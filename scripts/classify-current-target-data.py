#!/usr/bin/env python3
"""Join every selected embedded candidate to bounded static/source observations.

No native queries, compilation or application execution. --write publishes a
compact current-target manifest and immutable bulk profile below runtime/coverage.
--check recomposes it. Omit --census-summary only while its current Ghidra export
is pending; that omission is recorded, never filled from a historical target.
Actual data schemas, runtime pointer aliases and behavioral equivalence stay open.
"""

import argparse
import bisect
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import Path
import sqlite3
import struct
import subprocess

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script
from shared_native_inventory import open_readonly_uri as open_native_inventory


def encoded(value):
    return (json.dumps(value, sort_keys=True, ensure_ascii=False, separators=(",", ":")) + "\n").encode()


def digest(value):
    return hashlib.sha256(value).hexdigest()


class RangeIndex:
    """Find all overlapping half-open intervals, including coincident starts."""

    def __init__(self, rows, start, end):
        self.rows = sorted(rows, key=start)
        self.start, self.end = start, end
        self.starts = [start(row) for row in self.rows]
        self.maximum = max((end(row) - start(row) for row in self.rows), default=0)

    def at(self, address):
        left = bisect.bisect_right(self.starts, address - self.maximum)
        right = bisect.bisect_right(self.starts, address)
        return [row for row in self.rows[left:right] if address < self.end(row)]


def flow_owner(bodies, starts, address):
    """Binary lookup in independently checked disjoint native body ranges."""
    position = bisect.bisect_right(starts, address) - 1
    return bodies[position][2] if position >= 0 and address < bodies[position][1] else None


class Inputs:
    def __init__(self, target):
        self.target, self.records = target, {}

    def commit(self, value, expected=None):
        path = project_path(value)
        row = dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))
        if expected is not None and row["sha256"] != expected:
            raise ValueError("Input checksum differs: " + row["path"])
        previous = self.records.setdefault(row["path"], row)
        if previous != row:
            raise ValueError("Input changed during classification: " + row["path"])
        return row

    def load(self, value, current=True):
        receipt = self.commit(value)
        document = json.loads(project_path(receipt["path"]).read_text())
        if current and any(document.get("target", {}).get(k) != self.target[k]
                           for k in ("version", "sha256", "size_bytes")):
            raise ValueError("Input belongs to another target: " + receipt["path"])
        return document

    def stable(self):
        for row in list(self.records.values()):
            self.commit(row["path"], row["sha256"])


def source_literals(rows, inputs, scratch):
    """All tracked source matches; lexical links never establish ownership."""
    literals = defaultdict(list)
    for row in rows:
        literals[row["literal"]].append(row)
    if any("\n" in value or "\r" in value for value in literals):
        raise ValueError("Expected single-line inventory candidates")
    tracked = set(subprocess.run(["git", "ls-files", "-z", "crates"], cwd=ROOT,
                                 check=True, capture_output=True).stdout.decode().split("\0"))
    pattern = scratch / "source-patterns.txt"
    pattern.write_text("\n".join(sorted(literals)) + "\n")
    command = ["rg", "--json", "--fixed-strings", "--file", str(pattern),
               "--glob", "*.rs", "--glob", "*.lua", "--glob", "*.xml", "--glob", "*.toml", "crates"]
    matches, related = {}, {}
    try:
        process = subprocess.Popen(command, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        for line in process.stdout:
            record = json.loads(line)
            if record["type"] != "match":
                continue
            data = record["data"]
            name, text = data["path"]["text"], data["lines"]["text"]
            if name not in tracked:
                continue
            for match in data["submatches"]:
                short = match["match"]["text"]
                if short not in related:
                    related[short] = [value for value in literals if short in value]
                for value in related[short]:
                    if value in text:
                        key = (name, value)
                        matches[key] = min(matches.get(key, data["line_number"]), data["line_number"])
        errors = process.stderr.read()
        if process.wait() not in (0, 1):
            raise ValueError("Source search failed: " + errors)
    finally:
        pattern.unlink(missing_ok=True)
    for path in sorted({key[0] for key in matches}):
        inputs.commit(path)
    for (path, literal), line in sorted(matches.items()):
        for row in literals[literal]:
            row["source_literal_occurrences"].append(dict(path=path, line=line))


def classify(args):
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    inputs = Inputs(target)
    for path in ("scripts/classify-current-target-data.py", "scripts/coverage_common.py",
                 "scripts/script_sources.py", "scripts/inventory-executable.py"):
        inputs.commit(path)
    native = inputs.load("docs/analysis/coverage/native-summary.json")
    inventory_record = native["inventory"]
    inputs.commit(inventory_record["path"], inventory_record["sha256"])
    inventory = inputs.load(inventory_record["path"])
    image = target_bytes(selected)
    pe = load_script("current_data_PE_format", ROOT / "scripts/inventory-executable.py").PE(image)
    ranges = inputs.load("docs/analysis/coverage/file-range-summary.json")
    inputs.commit(ranges["ledger"]["path"], ranges["ledger"]["sha256"])
    ledger = inputs.load(ranges["ledger"]["path"])
    base = ROOT / "runtime/coverage" / target["sha256"] / "data-classification"
    if args.write:
        base.mkdir(parents=True, exist_ok=True)
    elif not base.is_dir():
        raise ValueError("No retained classification exists; run --write")

    def section(address):
        return next((s["name"] for s in pe.sections
                     if pe.image_base + s["rva"] <= address < pe.image_base + s["rva"] + s["virtual_size"]),
                    "PE_headers" if pe.image_base <= address < pe.image_base + pe.u32(pe.optional + 60)
                    else "outside_mapped_virtual_sections")

    rows = []
    for category, population in sorted(inventory["embedded_candidates"].items()):
        for ordinal, original in enumerate(population):
            row = dict(original, selector=f"Q41-I01:{category}:{ordinal}", category=category,
                       source_literal_occurrences=[], ghidra_incoming=[], encoded_incoming=[],
                       relocation_incoming=[], container_selectors=[], native_schema_status="unresolved")
            at, length = int(row["file_offset"], 16), row["byte_count"]
            raw = image[at:at + length]
            if raw != row["literal"].encode() or digest(raw) != row["sha256"] or pe.offset_va(at) != int(row["virtual_address"], 16):
                raise ValueError("Candidate bytes or mapping differ: " + row["selector"])
            row["section"] = section(int(row["virtual_address"], 16))
            rows.append(row)
    rows.sort(key=lambda row: (int(row["virtual_address"], 16), row["selector"]))
    index = RangeIndex(rows, lambda row: int(row["virtual_address"], 16),
                       lambda row: int(row["virtual_address"], 16) + row["byte_count"])
    source_literals(rows, inputs, base)
    containers, relocation_count = [], 0
    starts = index.starts
    for rva, kind, value in inventory["pe"]["base_relocation_records"]["records"]:
        relocation_count += 1
        if kind != 10:
            continue
        at = pe.rva_offset(rva)
        if struct.unpack_from("<Q", image, at)[0] != value:
            raise ValueError("Relocation slot differs from EXE")
        for row in index.at(value):
            row["relocation_incoming"].append(dict(site_rva=rva, kind=kind, encoded_u64=value))
        if at + 16 > len(image) or pe.offset_va(at + 15) != pe.image_base + rva + 15:
            continue
        length = struct.unpack_from("<Q", image, at + 8)[0]
        if not 1 <= length <= 1048576:
            continue
        left, right = bisect.bisect_left(starts, value), bisect.bisect_right(starts, value + length - 1)
        contained = [row for row in index.rows[left:right]
                     if int(row["virtual_address"], 16) + row["byte_count"] <= value + length]
        if not contained:
            continue
        try:
            payload_at = pe.rva_offset(value - pe.image_base)
            if pe.rva_offset(value - pe.image_base + length - 1) != payload_at + length - 1:
                continue
        except ValueError:
            continue
        raw = image[payload_at:payload_at + length]
        if len(raw) != length or any(byte < 32 and byte not in (9, 10, 13) for byte in raw):
            continue
        try:
            raw.decode("utf-8")
        except UnicodeDecodeError:
            continue
        containers.append(dict(selector=f"encoded-pointer-length:{rva:x}", descriptor_rva=rva,
            descriptor_sha256=digest(image[at:at + 16]),
            preferred_va=value, byte_count=length, sha256=digest(raw),
            candidate_selectors=[row["selector"] for row in contained],
            role="encoded_pointer_u64_length_UTF8_candidate_not_recovered_native_type"))

    payloads = project_path(args.container_manifest or f"docs/analysis/evidence/{target['version']}/discovery-delta.json")
    if args.container_manifest and not payloads.is_file():
        raise ValueError("Explicit container manifest is absent")
    if payloads.is_file():
        api = inputs.load(payloads)["embedded_api"]
        at, start = int(api["file_offset"], 16), int(api["virtual_address"], 16)
        raw = image[at:at + api["byte_count"]]
        inputs.commit(api["canonical_extract"], api["sha256"])
        if digest(raw) != api["sha256"] or pe.offset_va(at) != start:
            raise ValueError("AS API payload does not match selected EXE")
        containers.append(dict(selector="exact-current-AS-addon-API", descriptor_rva=None,
            preferred_va=start, byte_count=api["byte_count"], sha256=api["sha256"],
            role="exact_current_AS_API_artifact_payload"))
    for path in sorted((ROOT / "crates/benilla-app/assets/ui").glob("*.xml")):
        raw = path.read_bytes()
        variants = {"source_bytes": raw, "LF_to_CRLF_only": raw.replace(b"\r\n", b"\n").replace(b"\n", b"\r\n")}
        seen = set()
        for normalization, payload in variants.items():
            cursor = 0
            while (at := image.find(payload, cursor)) >= 0:
                cursor = at + 1
                if (at, payload) in seen:
                    continue
                seen.add((at, payload))
                source = inputs.commit(path)
                containers.append(dict(selector=f"source-XML:{source['path']}:{at:x}", descriptor_rva=None,
                    preferred_va=pe.offset_va(at), byte_count=len(payload), sha256=digest(payload),
                    role="engine_XML_payload_byte_equivalence_only", source=source, normalization=normalization))
    for row in containers:
        row.update(end_exclusive=row["preferred_va"] + row["byte_count"], ghidra_incoming=[], encoded_incoming=[],
                   descriptor_ghidra_incoming=[], descriptor_encoded_incoming=[])
        contained = [candidate for candidate in rows if row["preferred_va"] <= int(candidate["virtual_address"], 16)
                     and int(candidate["virtual_address"], 16) + candidate["byte_count"] <= row["end_exclusive"]]
        row["candidate_selectors"] = [candidate["selector"] for candidate in contained]
        for candidate in contained:
            candidate["container_selectors"].append(row["selector"])
    container_index = RangeIndex(containers, lambda row: row["preferred_va"], lambda row: row["end_exclusive"])
    descriptors = [row for row in containers if row["descriptor_rva"] is not None]
    descriptor_index = RangeIndex(descriptors, lambda row: pe.image_base + row["descriptor_rva"],
                                 lambda row: pe.image_base + row["descriptor_rva"] + 16)
    bodies, census_state = [], "pending_not_supplied_no_historical_fallback"
    census = inputs.load(args.census_summary) if args.census_summary else None
    if census:
        if not census.get("independent_instructions", {}).get("exact_source_bytes_verified"):
            raise ValueError("Census lacks independent source-byte verification")
        directory = project_path(census["artifacts"]["directory"])
        for name in ("bodies.tsv.gz", "references.tsv.gz"):
            inputs.commit(directory / name, census["artifacts"]["files"][name]["sha256"])
        with gzip.open(directory / "bodies.tsv.gz", "rt") as stream:
            bodies = [(int(row["start"], 16), int(row["end"], 16) + 1, row["entry"])
                      for row in csv.DictReader(stream, delimiter="\t") if row["external"] == "false"]
        bodies.sort()
        if any(a[1] > b[0] for a, b in zip(bodies, bodies[1:])):
            raise ValueError("Overlapping native flow body ranges")
        census_state = "current_independently_verified_export_not_semantic_closure"
    body_starts = [row[0] for row in bodies]

    def connect(destination, record, family):
        candidate_hits = index.at(destination)
        payload_hits = container_index.at(destination)
        descriptor_hits = descriptor_index.at(destination)
        if not (candidate_hits or payload_hits or descriptor_hits):
            return
        source = record.get("from", record.get("site"))
        if source is not None:
            record["source_flow_body"] = flow_owner(bodies, body_starts, int(source, 16))
        for row in candidate_hits:
            row[family].append(record)
        for row in payload_hits:
            row[family].append(record)
        for row in descriptor_hits:
            row["descriptor_" + family].append(record)

    ghidra_count = 0
    if census:
        with gzip.open(directory / "references.tsv.gz", "rt") as stream:
            for row in csv.DictReader(stream, delimiter="\t"):
                ghidra_count += 1
                if ":" not in row["to"]:
                    connect(int(row["to"], 16), dict(row), "ghidra_incoming")
        if ghidra_count != census["counts"]["references"]:
            raise ValueError("Ghidra reference count differs")
        print(f"Joined all {ghidra_count} current Ghidra references", flush=True)
    encoded_counts = {}
    for name in ("instruction-summary", "unwind-complement-summary"):
        summary = inputs.load(f"docs/analysis/coverage/{name}.json")
        database = summary["inventory"]
        inputs.commit(database["path"], database["sha256"])
        count = 0
        with open_native_inventory(project_path(database["path"]).as_uri() + "?mode=ro", uri=True) as db:
            for site, kind, target_value in db.execute("SELECT site,kind,target FROM refs ORDER BY rowid"):
                count += 1
                try:
                    destination = int(target_value, 16)
                except (TypeError, ValueError):
                    continue
                connect(destination, dict(inventory=name, site=hex(site), kind=kind, target=target_value), "encoded_incoming")
        expected = sum(summary["counts"]["reference_kinds"].values())
        if count != expected:
            raise ValueError("Encoded reference count differs: " + name)
        encoded_counts[name] = count
        print(f"Joined all {count} current {name} references", flush=True)
    by_selector = {row["selector"]: row for row in rows}
    for row in containers:
        for selector in row["candidate_selectors"]:
            by_selector[selector].setdefault("container_reference_counts", {})[row["selector"]] = {
                field: len(row[field]) for field in ("ghidra_incoming", "encoded_incoming",
                    "descriptor_ghidra_incoming", "descriptor_encoded_incoming")}
    for row in rows:
        if row["section"] == ".text":
            role = "executable_byte_pattern_requires_instruction_operand_and_dispatch_recovery"
        elif "exact-current-AS-addon-API" in row["container_selectors"]:
            role = "current_AS_addon_API_script_container_not_native_consumer_proof"
        elif row["category"] == "module_type_namespace":
            role = ("AS_namespace_label_not_type_or_dispatch_proof" if "wenilla_rogue" in row["literal"]
                    or "azeroth" in row["literal"] else "engine_or_dependency_namespace_context")
        elif row["source_literal_occurrences"]:
            role = ("existing_engine_source_literal_context_native_consumer_unresolved"
                    if all(item["path"].startswith("crates/benilla-") for item in row["source_literal_occurrences"])
                    else "source_literal_connection_native_schema_or_consumer_unresolved")
        else:
            role = "embedded_lead_schema_or_consumer_unresolved"
        row["classification"] = role
        row["next_action"] = "Inspect candidate local source first; trace this exact byte range, descriptor or operand through current native producers/dispatch/consumers. Recover bounds and fields before assigning a schema."
    for row in ledger["ranges"]:
        at, end = row["file_start"], row["file_end_exclusive"]
        if digest(image[at:end]) != row["sha256"]:
            raise ValueError("File partition changed")
    inputs.stable()
    profile = dict(schema_version=1, target=target, census_state=census_state,
                   inputs=sorted(inputs.records.values(), key=lambda row: row["path"]))
    profile_id = digest(encoded(profile))
    directory = base / profile_id
    outputs = {}
    for name, population in (("embedded-classification.jsonl", rows), ("string-containers.jsonl", containers)):
        raw = b"".join(encoded(row) for row in population)
        path = directory / name
        if args.write:
            directory.mkdir(parents=True, exist_ok=True)
            if path.exists() and path.read_bytes() != raw:
                raise ValueError("Immutable profile output differs: " + str(path))
            path.write_bytes(raw)
        elif not path.is_file() or path.read_bytes() != raw:
            raise ValueError("Missing/stale classification output: " + str(path))
        outputs[name] = dict(path=path.relative_to(ROOT).as_posix(), records=len(population), bytes=len(raw), sha256=digest(raw))
    counts = dict(embedded_categories=dict(sorted(Counter(row["category"] for row in rows).items())),
                  embedded_classes=dict(sorted(Counter(row["classification"] for row in rows).items())),
                  candidates=len(rows), ghidra_references_examined=ghidra_count, encoded_references_examined=encoded_counts,
                  relocation_records_examined=relocation_count, string_containers=len(containers),
                  candidates_with_source_literals=sum(bool(row["source_literal_occurrences"]) for row in rows),
                  candidates_with_direct_ghidra_references=sum(bool(row["ghidra_incoming"]) for row in rows),
                  candidates_with_encoded_references=sum(bool(row["encoded_incoming"]) for row in rows),
                  candidates_with_relocations=sum(bool(row["relocation_incoming"]) for row in rows),
                  candidates_with_container_references=sum(any(any(counts.values()) for counts in row.get("container_reference_counts", {}).values()) for row in rows))
    proof = dict(**profile, profile_id=profile_id, preferred_image_base=pe.image_base,
                 generator=inputs.records["scripts/classify-current-target-data.py"],
                 outputs=outputs, counts=counts, file_partition=ledger["ranges"],
                 semantic_frontier_closed=False, native_schemas_complete=False, parity_verified=False,
                 limits=["The full declared regex-candidate population is retained, not every possible AS datum or numeric ID.",
                         "Source literal routes retain the first matching line per tracked file; matching text does not recover its native producer or consumer.",
                         "Lexical matches, namespace labels, source/XML byte equivalence, relocations and pointer/length candidates are observations, never native ownership or recovered schema proof.",
                         "All input reference records are examined. The reference families overlap; missing static references do not establish dead data or absence of computed consumers.",
                         "Descriptor and payload references remain distinct. Preferred PE addresses are not observed runtime addresses.",
                         "The file partition covers every byte structurally. No unknown range or uniform/alignment candidate is promoted to proved padding or semantic recovery.",
                         "No native query, compilation, application/server execution or original/rebuilt comparison occurs."])
    return proof


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--census-summary", help="Independently byte-verified current Ghidra summary")
    parser.add_argument("--container-manifest", help="Current-target manifest containing embedded_api")
    parser.add_argument("--manifest", help="Project-local compact proof destination")
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    args = parser.parse_args()
    proof = classify(args)
    path = project_path(args.manifest or f"docs/analysis/evidence/{proof['target']['version']}/data-classification/manifest.json")
    raw = (json.dumps(proof, indent=2, ensure_ascii=False) + "\n").encode()
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(raw)
    elif not path.is_file() or path.read_bytes() != raw:
        raise ValueError("Missing/stale compact proof; run --write")
    print(json.dumps(dict(target=proof["target"], profile_id=proof["profile_id"], counts=proof["counts"],
                          census_state=proof["census_state"], written=args.write), indent=2))


if __name__ == "__main__":
    main()
