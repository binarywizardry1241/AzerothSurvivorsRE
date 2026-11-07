#!/usr/bin/env python3
"""Check the complete current I01/include_str source-container join, no build.

This classifies lexical source inclusion. It recovers no native callback,
schema, lifetime, runtime behavior or current applicability of older contracts.
Default operation compares the compact proof without writing.
"""
from runtime_layout import retained_runtime_path
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
MANIFEST = ROOT / "docs/analysis/evidence/data-classification/manifest.json"
PROOF = ROOT / "docs/analysis/evidence/included-source-frontier.json"
UNKNOWN = "embedded_lead_schema_or_consumer_unresolved"


def packed(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": file_sha256(path)}


def derive():
    selected = latest_target(verify=True)
    if selected["sha256"] != SHA or selected["version"] != "0.121.0":
        raise ValueError("This proof belongs only to the exact 0.121.0 target")
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    baseline = json.loads(MANIFEST.read_text())
    if baseline["target"] != target:
        raise ValueError("Candidate manifest target differs")
    record = baseline["outputs"]["embedded-classification.jsonl"]
    path = (retained_runtime_path(ROOT / record["path"], ROOT)).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError("Candidate input is outside the checkout")
    raw = path.read_bytes()
    if len(raw) != record["bytes"] or digest(raw) != record["sha256"]:
        raise ValueError("Candidate input commitment differs")
    rows = [json.loads(line) for line in raw.splitlines()]
    if len(rows) != record["records"] or len(rows) != 2144:
        raise ValueError("Candidate population differs")
    categories = dict(Counter(row["category"] for row in rows))
    if categories != baseline["counts"]["embedded_categories"]:
        raise ValueError("Candidate categories differ")
    if len({row["selector"] for row in rows}) != len(rows):
        raise ValueError("Candidate selectors are duplicated")
    for category, count in categories.items():
        if {row["selector"] for row in rows if row["category"] == category} != {
                f"Q41-I01:{category}:{index}" for index in range(count)}:
            raise ValueError("Candidate selector domain differs")

    image = target_bytes(selected)
    pe = load_script("q41_include_PE", ROOT / "scripts/inventory-executable.py").PE(image)
    for row in rows:
        at, count = int(row["file_offset"], 16), row["byte_count"]
        literal = image[at:at + count]
        if (literal != row["literal"].encode() or digest(literal) != row["sha256"]
                or pe.offset_va(at) != int(row["virtual_address"], 16)):
            raise ValueError("Candidate bytes or mapping differ: " + row["selector"])

    # Keep the established literal/concat forms and lossless selector encoding
    # shared with the historical whole-population container review.
    helper = load_script("q41_include_forms", ROOT / "scripts/check-q41-embedded-containers.py")
    source_root = ROOT / "crates/azeroth-survivors-re/src"
    sources = sorted(source_root.rglob("*.rs"))
    directives, containers, payloads = [], [], []
    for source in sources:
        text = source.read_text()
        literal = list(helper.LITERAL.finditer(text))
        concat = list(helper.CONCAT.finditer(text))
        if len(literal) + len(concat) != text.count("include_str!"):
            raise ValueError("Unsupported include_str form: " + str(source.relative_to(ROOT)))
        for match in sorted(literal + concat, key=lambda value: value.start()):
            if match in concat:
                crate = next(parent for parent in source.parents if (parent / "Cargo.toml").is_file())
                payload = (crate / match.group(1).lstrip("/")).resolve()
            else:
                payload = (source.parent / match.group(1)).resolve()
            if not payload.is_relative_to(ROOT) or not payload.is_file():
                raise ValueError("Missing or out-of-checkout include: " + str(payload))
            directives.append({"source": source.relative_to(ROOT).as_posix(),
                               "payload": payload.relative_to(ROOT).as_posix()})
            if payload.suffix.lower() in (".lua", ".xml"):
                content = payload.read_text()
                selectors = [row["selector"] for row in rows if row["literal"] in content]
                containers.append({"source": receipt(source), "payload": receipt(payload),
                                   "matched_rows": len(selectors),
                                   "selectors": helper.selector_ranges(selectors)})
                payloads.append(content)

    decisions = [{"selector": row["selector"], "input_classification": row["classification"],
                  "containers": [index for index, content in enumerate(payloads)
                                 if row["literal"] in content]} for row in rows]
    included = [row for row, decision in zip(rows, decisions) if decision["containers"]]
    unknown = [row for row in rows if row["classification"] == UNKNOWN]
    connected = [row for row, decision in zip(rows, decisions)
                 if row["classification"] == UNKNOWN and decision["containers"]]
    remaining = [row for row, decision in zip(rows, decisions)
                 if row["classification"] == UNKNOWN and not decision["containers"]]
    if (len(containers), len(unknown), len(connected), len(remaining)) != (8, 283, 173, 110):
        raise ValueError("Reviewed source-container boundary changed; inspect before updating the proof")
    if Counter(row["category"] for row in connected) != {
            "game_binding_identifier": 146, "lua_function_declaration": 27}:
        raise ValueError("Connected unresolved categories differ")
    if Counter(row["category"] for row in remaining) != {
            "resource_path": 109, "lua_function_declaration": 1}:
        raise ValueError("Remaining unresolved categories differ")

    def population(values):
        return {"rows": len(values), "categories": dict(Counter(row["category"] for row in values)),
                "selectors": helper.selector_ranges(row["selector"] for row in values)}

    return {
        "schema_version": 1, "target": target, "gap_ids": [41], "lead_ids": ["Q41-B02", "Q41-I01"],
        "generator": receipt(Path(__file__).resolve()),
        "dependencies": [receipt(ROOT / name) for name in (
            "scripts/coverage_common.py", "scripts/script_sources.py", "scripts/inventory-executable.py",
            "scripts/check-q41-embedded-containers.py")],
        "classification_input": receipt(MANIFEST), "candidate_input": record,
        "all_candidates": {"rows": len(rows), "categories": categories,
                           "exact_current_bytes_and_addresses_verified": True,
                           "decision_stream_sha256": digest(packed(decisions))},
        "include_scan": {"root": source_root.relative_to(ROOT).as_posix(), "rust_files": len(sources),
                         "source_path_set_sha256": digest(packed([str(source.relative_to(ROOT)) for source in sources])),
                         "directives": len(directives), "directive_stream_sha256": digest(packed(directives)),
                         "Lua_XML_containers": containers},
        "any_included_rows": {"rows": len(included),
                              "input_classes": dict(Counter(row["classification"] for row in included))},
        "input_unresolved": population(unknown), "input_unresolved_included": population(connected),
        "input_unresolved_without_included_payload": population(remaining),
        "native_schema_or_consumer_complete": False, "parity_verified": False,
        "limits": [
            "All current I01 rows and every observed AS-source include_str invocation are joined, without executing macros or compiling code.",
            "Literal inclusion is source-container evidence only; callbacks, inputs, schema, mutation, lifetime and native producer/consumer meanings retain independent proofs.",
            "The input classifier and its original source receipts are immutable; this join does not overwrite their classifications or claim a renewed whole-source review.",
            "Historical payload filenames retain their original provenance. Current inclusion does not promote historical native contracts to current behavioral applicability.",
            "The 110-row remainder includes existing AS resource interfaces and generic or packed resource/diagnostic candidates; it is not 110 absent implementations or confirmed AS defects.",
            "Mixed B02 data schemas and dynamic aliases require concrete AS producer, range and consumer evidence; this lexical projection provides no global closure.",
            "No REA query, native recovery, compilation, application/game/server operation or original/rebuilt comparison occurs.",
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="publish the reviewed compact proof")
    args = parser.parse_args()
    proof = derive()
    if args.write:
        PROOF.write_text(json.dumps(proof, indent=2) + "\n")
    elif json.loads(PROOF.read_text()) != proof:
        raise ValueError("Included-source proof differs")
    print("PASS: 2,144 exact current rows; all AS include_str directives; eight Lua/XML payloads; "
          "173 unresolved binding/Lua rows source-included; 110 resource/diagnostic rows remain separate")


if __name__ == "__main__":
    main()
