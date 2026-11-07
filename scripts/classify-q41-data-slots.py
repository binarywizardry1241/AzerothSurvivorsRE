#!/usr/bin/env python3
"""Reconcile every exact .data slot reached by current AS-context operands.

This extends the saved F/A/M projection through the complete explicit-operand
inventory. It neither starts a native provider nor infers dynamic alias closure.
Default operation compares the compact witness and ignored full row artifact.
"""
import argparse
from collections import Counter, defaultdict
import gzip
import hashlib
import io
import json
import re
import struct

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
OUTPUT = "docs/analysis/evidence/as-data-slots.json"
ARTIFACT = "runtime/analysis/history/findings/q41-data-slots/3c0eb7d6c150/exact-slot-operands.jsonl.gz"
QUERIES = [
    ("locale-selector", 0x145AEB1E0, 0x145AEB337),
    ("locale-cache", 0x145B96C70, 0x145B96CC9),
    ("shared-state-helper", 0x1402AA300, 0x1402AA939),
]


def receipt(path):
    return {"path": path, "sha256": file_sha256(project_path(path))}


def checked(row):
    path = project_path(row["path"])
    if file_sha256(path) != row["sha256"]:
        raise ValueError(f"Changed retained input: {row['path']}")
    return path


def read_rows(row):
    with gzip.open(checked(row), "rt") as stream:
        for line in stream:
            yield json.loads(line)


def collect():
    target = latest_target(verify=True)
    if target["sha256"] != SHA:
        raise ValueError("The exact 0.121.0 target is required")
    inputs = [receipt(path) for path in (
        "docs/analysis/evidence/native-residuals-comparison.json",
        "docs/analysis/evidence/native-diagnostics/native-operands.json",
        "docs/analysis/evidence/as-reference-frontier.json",
    )]
    residuals, operands, frontier = [json.loads(checked(row).read_text()) for row in inputs]
    if any(value["target"]["sha256"] != SHA for value in (residuals, operands, frontier)):
        raise ValueError("Mixed target witnesses")
    sources = defaultdict(set)
    for row in read_rows(residuals["artifacts"]["diagnostic-sites.jsonl.gz"]):
        if row["actual_body_owner"]:
            sources[row["actual_body_owner"]].add(row["path"])
    owners = frozenset(owner for owner, paths in sources.items() if any(
        path.startswith(("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")) for path in paths))
    if len(owners) != frontier["counts"]["actual_AS_context_body_owners"]:
        raise ValueError("AS-context owner membership changed")

    contexts = defaultdict(list)
    total = 0
    for row in read_rows(operands["inventory"]):
        total += 1
        if row["source_native_owner"] in owners and row["target_region"] == ".data":
            contexts[row["target"]].append(row)
    if total != 676285 or len(contexts) != 30 or sum(map(len, contexts.values())) != 230:
        raise ValueError("Exact complete operand/slot population changed")
    reverse = defaultdict(list)
    all_rows = []
    for ordinal, row in enumerate(read_rows(operands["inventory"])):
        if row["target"] in contexts:
            value = {"ordinal": ordinal, **row,
                     "actual_body_diagnostic_contexts": sorted(sources.get(row["source_native_owner"], ())),
                     "actual_body_AS_context": row["source_native_owner"] in owners}
            reverse[row["target"]].append(value)
            all_rows.append(value)

    image = target_bytes(target)
    pe = load_script("q41_data_slots_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw_range(role, start, end):
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        if len(raw) != end - start:
            raise ValueError("Truncated original bytes")
        return {"role": role, "virtual_address": hex(start), "end_exclusive": hex(end),
                "file_offset": hex(offset), "byte_count": len(raw),
                "sha256": hashlib.sha256(raw).hexdigest()}

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + length]

    def qword(address):
        return struct.unpack("<Q", read(address, 8))[0]

    def initial_state(role, address, width):
        rva = address - pe.image_base
        section, = [part for part in pe.sections if part["rva"] <= rva
                    and rva + width <= part["rva"] + max(part["virtual_size"], part["raw_size"])]
        if rva + width <= section["rva"] + section["raw_size"]:
            return {"kind": "file-backed", **raw_range(role, address, address + width)}
        if rva >= section["rva"] + section["raw_size"]:
            return {"kind": "PE-loader-zero-fill", "section": section["name"],
                    "virtual_address": hex(address), "byte_count": width,
                    "initial_value_hex": bytes(width).hex()}
        raise ValueError("Slot straddles the file-backed/zero-fill boundary")

    # These are immutable catalog-view carriers, not a claim that every .data
    # location is writable state. Exact no-writer observations are scoped below.
    catalog_slices = []
    for slot, count, key_address, key, role in [
        (0x1485C6448, 12, 0x146FB2578, b"elwynn", "zone-definition-slice"),
        (0x1485C6450, 9, 0x146FBF6D0, b"warrior", "hero-definition-slice"),
        (0x1485C6460, 23, 0x147303BC5, b"accuria", "ring-trinket-definition-slice"),
        (0x1485C6468, 16, 0x1473048EC, b"mark_of_fordring", "shared-amulet-definition-slice"),
    ]:
        pointer = qword(slot)
        if qword(pointer + 8) != count or read(key_address, len(key)) != key:
            raise ValueError(f"Changed catalog identity/count at {slot:#x}")
        catalog_slices.append({"slot": hex(slot), "role": role, "slice_pointer": hex(pointer),
                               "records": count, "first_key": key.decode(),
                               "key": raw_range(role + "-key", key_address, key_address + len(key)),
                               "slice": raw_range(role, pointer, pointer + 16)})

    profiles = [
        ("catalog-carriers", [0x1485C6448, 0x1485C6450, 0x1485C6460, 0x1485C6468],
         "Fixed zone/hero/jewelry definition-slice carriers; exact observed readers have existing catalog consumers.",
         ["crates/azeroth-survivors-re/src/catalog.rs", "crates/azeroth-survivors-re/src/codex.rs"]),
        ("frontend-fallback", [0x14859C338],
         "Shared frontend empty-context fallback; selected meter consumers already retain their separate current proofs.",
         ["crates/azeroth-survivors-re/src/gameplay/meter/view.rs"]),
        ("shared-registry", [0x1485BF750],
         "Locked heterogeneous registry with an erased key/constructor interface; stop at the shared-engine/library interface.", []),
        ("logging-filter-and-callsites", [0x1485B9058, 0x14857D050, 0x14857D060, 0x14857D068, 0x14857D078],
         "Shared logging level/filter and callsite metadata interface; no new AS operation is established.", []),
        ("shared-panic-poison-state", [0x1485C6B78],
         "Shared panic-count/poison guard used by the registry and other synchronization consumers; no AS mechanic.", []),
        ("locale-cache-fields", [0x1485C6470, 0x1485C6478, 0x1485C6480, 0x1485C6488,
                                 0x1485C6490, 0x1485C6498, 0x1485C64A0, 0x1485C64A8,
                                 0x1485C64B0, 0x1485C64B8, 0x1485C64C0, 0x1485C64C8],
         "Three lazy i18n aggregate/field groups; direct address escape invokes the existing lazy-initialization interface.",
         ["crates/azeroth-survivors-re/src/localization.rs", "crates/azeroth-survivors-re/src/localization/catalogs.rs"]),
        ("locale-selection", [0x1485C9220],
         "Exact fourteen-code process locale selector with English fallback; existing language_index/select and per-recipient locale source supply the bounded behavior.",
         ["crates/azeroth-survivors-re/src/localization.rs"]),
        ("locale-indexed-cache", [0x1485C6778],
         "Fourteen lazy32-byte locale entries selected by TLS override or process selection, clamped at13; existing locale/catalog consumers are retained.",
         ["crates/azeroth-survivors-re/src/localization.rs", "crates/azeroth-survivors-re/src/localization/catalogs.rs"]),
        ("PE-thread-local-index", [0x1485C93E8],
         "Windows loader TLS index, followed by GS:[58] and the thread block; shared platform interface, not a missing AS state producer.", []),
        ("transport-observation-counters", [0x1485C9208, 0x1485C9218],
         "Atomic outgoing-byte and send counters before the existing transport-send interface; payload/state behavior retains its owning source contracts.",
         ["crates/azeroth-survivors-re/src/coop/session.rs"]),
        ("spell-effect-admission", [0x1485C6D38],
         "noSpellEffects publication and engine creation gates; existing live CVar consumer preserves the recovered admission rule.",
         ["crates/benilla-app/src/local_client/spell_settings.rs"]),
    ]
    slots = []
    profile_records = []
    seen = set()
    for name, addresses, classification, source_paths in profiles:
        profile_records.append({"id": name, "slots": list(map(hex, addresses)),
                                "classification": classification,
                                "source_receipts": [receipt(path) for path in source_paths]})
        for address in addresses:
            slot = hex(address)
            if slot not in contexts or slot in seen:
                raise ValueError(f"Unaccounted/duplicated exact slot: {slot}")
            seen.add(slot)
            rows = reverse[slot]
            access = Counter(f"{row['kind']}:{row['access']}" for row in rows)
            slots.append({"address": slot, "profile": name,
                          "AS_context_operands": len(contexts[slot]), "complete_exact_slot_operands": len(rows),
                          "operand_access": dict(sorted(access.items())),
                          "source_native_owner_count": len({row["source_native_owner"] for row in rows}),
                          "AS_context_native_owners": sorted({row["source_native_owner"] for row in rows
                                                              if row["actual_body_AS_context"]}),
                          "writers_and_address_escapes": [
                              {key: row[key] for key in ("site", "source_native_owner", "kind", "access")}
                              for row in rows if row["access"] & 2 or row["kind"] == "address-expression"],
                          "initial_state": initial_state(name, address, max(row["width"] for row in rows))})
    if seen != set(contexts):
        raise ValueError("Some exact slots lack a classification profile")

    queries = []
    for name, start, end in QUERIES:
        base = f"runtime/analysis/history/findings/q41-data-slots/3c0eb7d6c150/{name}"
        journal_path = base + "/query/journal.json"
        journal = json.loads(project_path(journal_path).read_text())
        operation, = journal["operations"].values()
        if (journal["status"] != "completed" or operation["status"] != "completed"
                or operation["arguments"] != {"procedure": hex(start)}):
            raise ValueError(f"Unfinished or changed native subject: {name}")
        result = operation["result"]
        value = json.loads(checked(result).read_text())["structuredContent"]
        raw_input = receipt(base + "/code.bin")
        if project_path(raw_input["path"]).read_bytes() != read(start, end - start):
            raise ValueError("Raw native subject differs from installed bytes")
        query = {"procedure": hex(start), "slice_virtual_address": hex(start),
                 "plan": receipt(base + "/plan.json"), "journal": receipt(journal_path),
                 "result": result, "raw_input": raw_input, "evidence_id": value["evidence_id"],
                 "provider": value["provider"], "analysis_profile_digest": value["analysis_profile"]["digest"],
                 "normalized_text_sha256": hashlib.sha256(value["normalized_result"].encode()).hexdigest()}
        query["subject_binding"] = verify_native_query_subject(ROOT, value, query, target, image=image, pe=pe)
        queries.append(query)
    for row in [*inputs, operands["inventory"], residuals["artifacts"]["diagnostic-sites.jsonl.gz"]]:
        checked(row)
    payload = b"".join((json.dumps(row, sort_keys=True, separators=(",", ":")) + "\n").encode() for row in all_rows)
    # The source's fourteen actual locale keys are compared with exhaustive
    # original selector instructions, rather than a second hand-written table.
    import unicorn
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP
    locale_source = project_path("crates/azeroth-survivors-re/src/localization.rs").read_text()
    language_block = locale_source.split("pub const LANGUAGES:", 1)[1].split("];", 1)[0]
    codes = re.findall(r'\("([a-z]{2})",', language_block)
    if len(codes) != 14 or len(set(codes)) != 14:
        raise ValueError("Actual source locale-key domain changed")
    expected_codes = {value.encode(): index for index, value in enumerate(codes)}
    machine = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    code_start, code_end = QUERIES[0][1:]
    code_page = code_start & ~0xFFF
    global_address = 0x1485C9220
    fixture_base, fixture_end = 0x20000000, 0x2000F000
    machine.mem_map(code_page, 0x1000)
    machine.mem_write(code_start, read(code_start, code_end - code_start))
    machine.mem_map(global_address & ~0xFFF, 0x1000)
    machine.mem_map(fixture_base, 0x10000)
    stack = fixture_base + 0x8000
    machine.mem_write(stack, struct.pack("<Q", fixture_end))
    cases = 0

    def execute(value, length):
        nonlocal cases
        machine.mem_write(fixture_base, value.ljust(8, b"\0"))
        machine.mem_write(global_address, b"\xff" * 8)
        machine.reg_write(UC_X86_REG_RCX, fixture_base)
        machine.reg_write(UC_X86_REG_RDX, length)
        machine.reg_write(UC_X86_REG_RSP, stack)
        machine.emu_start(code_start, fixture_end, count=1000)
        observed = struct.unpack("<Q", bytes(machine.mem_read(global_address, 8)))[0]
        expected = expected_codes.get(value, 0) if length == 2 else 0
        if observed != expected:
            raise ValueError(f"Original/source locale selector differs: {value!r}/{length}")
        cases += 1

    for word in range(65536):
        execute(struct.pack("<H", word), 2)
    for code in codes:
        for length in (0, 1, 3, 8, 0xFFFFFFFFFFFFFFFF):
            execute(code.encode(), length)
    proof = {
        "schema_version": 1,
        "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
        "gap_ids": [41], "lead_ids": ["Q41-M01", "Q41-A01", "Q41-A02", "Q41-F01", "Q41-F02"],
        "generator": receipt("scripts/classify-q41-data-slots.py"),
        "dependencies": [receipt(path) for path in ("scripts/coverage_common.py", "scripts/script_sources.py",
                                                     "scripts/inventory-executable.py", "scripts/discovery_native_subject.py")],
        "inputs": inputs, "native_operand_inventory": operands["inventory"],
        "counts": {"complete_explicit_operands": total, "actual_AS_context_owners": len(owners),
                   "AS_context_data_operands": sum(map(len, contexts.values())), "exact_slots": len(contexts),
                   "complete_exact_slot_operands": len(all_rows), "classification_profiles": len(profiles)},
        "method": "Complete two-pass exact-address reverse join of every explicit expression, using the frozen315actual-body AS diagnostic-context owners. No sampling, recursive engine reconstruction or dynamic alias inference.",
        "profiles": profile_records, "slots": sorted(slots, key=lambda value: int(value["address"], 16)),
        "catalog_slices": catalog_slices, "native_queries": queries,
        "native_locale_selector_cases": {"two_byte_words": 65536, "other_length_cases": cases - 65536,
                                         "total": cases, "actual_source_codes": codes,
                                         "engine": "Unicorn", "engine_version": unicorn.__version__,
                                         "scope": "Original pure selector instructions only, with synthetic memory/stack; invalid UTF-8 byte words are native-boundary probes, not manufactured valid Rust strings."},
        "full_operand_artifact": {"path": ARTIFACT, "rows": len(all_rows),
                                  "uncompressed_sha256": hashlib.sha256(payload).hexdigest()},
        "source_defect_established": False, "global_dynamic_aliases_closed": False,
        "limits": ["The exact-address join does not enumerate stores through arbitrary pointers or interior indexed aliases, nor all reachable filename-free AS state.",
                   "A .data placement or diagnostic association alone establishes neither mutability nor semantic AS ownership.",
                   "The three Ghidra results have raw-subject and incoming-type limitations; original bytes and exact producer/consumer coordinates govern the stated boundary.",
                   "Catalog identity, existing source and generic registry/TLS/logging interfaces do not certify whole-system native completeness or application parity.",
                   "No application compilation, compiling test, client/game/server/network execution or original/rebuilt comparison was performed."]}
    return proof, payload


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof, payload = collect()
    path = project_path(ARTIFACT)
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        buffer = io.BytesIO()
        with gzip.GzipFile(fileobj=buffer, mode="wb", mtime=0) as stream:
            stream.write(payload)
        path.write_bytes(buffer.getvalue())
        proof["full_operand_artifact"]["sha256"] = file_sha256(path)
        project_path(OUTPUT).write_text(json.dumps(proof, indent=2) + "\n")
    else:
        if gzip.decompress(path.read_bytes()) != payload:
            raise ValueError("Changed complete reverse-slot artifact")
        proof["full_operand_artifact"]["sha256"] = file_sha256(path)
        if json.loads(project_path(OUTPUT).read_text()) != proof:
            raise ValueError("Changed exact-slot proof; inspect its owning native/source inputs")
    print(json.dumps(proof["counts"], sort_keys=True))


if __name__ == "__main__":
    main()
