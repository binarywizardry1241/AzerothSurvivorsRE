#!/usr/bin/env python3
"""Replay every I01 literal against current included Lua/XML containers, no build.

Literal inclusion identifies source containers, not complete native semantics.
Default execution is read-only. --write refreshes the compact proof only.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

HERE = Path(__file__).resolve()
ROOT = next(p for p in HERE.parents if (p / "scripts/coverage_common.py").is_file())
sys.path.insert(0, str(ROOT / "scripts"))
from artifact_history import read_artifact
from coverage_common import artifact_path, file_sha256, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
MANIFEST = ROOT / "docs/analysis/evidence/0.115.0/data-classification/manifest.json"
ARCHIVED_OUTPUT = ROOT / "docs/analysis/evidence/0.115.0/q41-embedded-containers.json"
KEEP = ROOT / "docs/analysis/evidence/q41-embedded-containers.json"
UNKNOWN = "embedded_lead_schema_or_consumer_unresolved"
CATEGORIES = {"module_type_namespace": 922, "game_binding_identifier": 352,
              "lua_ui_registration": 336, "resource_path": 306,
              "lua_function_declaration": 187, "save_configuration_key_lead": 5,
              "textual_id_assignment": 2}
LITERAL = re.compile(r'include_str!\s*\(\s*"([^"\n]+)"\s*,?\s*\)')
CONCAT = re.compile(r'include_str!\s*\(\s*concat!\s*\(\s*env!\("CARGO_MANIFEST_DIR"\)\s*,\s*"([^"\n]+)"\s*,?\s*\)\s*\)')


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def receipt(path):
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest(read_artifact(path))}


def selector_ranges(selectors):
    """Lossless compact selector set, grouped by category and inclusive ordinal."""
    grouped = {}
    for selector in sorted(selectors):
        prefix, category, index = selector.split(":")
        assert prefix == "Q41-I01"
        grouped.setdefault(category, []).append(int(index))
    output = {}
    for category, values in sorted(grouped.items()):
        ranges = []
        for value in sorted(values):
            if ranges and value == ranges[-1][1] + 1:
                ranges[-1][1] = value
            else:
                ranges.append([value, value])
        output[category] = ranges
    return output


def derive():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.115.0"
    image = target_bytes(target)
    pe = load_script("q41_embedded_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def native(address, count):
        offset = pe.rva_offset(int(address, 16) - pe.image_base)
        return image[offset:offset + count]

    def verify_project_receipts(value):
        if isinstance(value, list):
            for item in value:
                verify_project_receipts(item)
        elif isinstance(value, dict):
            if isinstance(value.get("path"), str) and "sha256" in value:
                path = Path(value["path"])
                assert not path.is_absolute()
                if path.as_posix().startswith("installed-game/"):
                    assert any(row["path"] == str(path) and row["sha256"] == value["sha256"]
                               for row in target["runtime_data"]["archives"])
                    assert file_sha256(artifact_path(path)) == value["sha256"]
                else:
                    resolved = (ROOT / path).resolve()
                    assert resolved.is_relative_to(ROOT)
                    assert digest(read_artifact(resolved)) == value["sha256"], path
            for item in value.values():
                verify_project_receipts(item)
    baseline = json.loads(read_artifact(MANIFEST))
    assert baseline["target"]["sha256"] == SHA
    data_record = baseline["outputs"]["embedded-classification.jsonl"]
    data = ROOT / data_record["path"]
    raw = read_artifact(data)
    assert len(raw) == data_record["bytes"] and digest(raw) == data_record["sha256"]
    rows = [json.loads(line) for line in raw.splitlines()]
    assert len(rows) == data_record["records"] == 2110
    assert dict(Counter(row["category"] for row in rows)) == CATEGORIES
    assert len({row["selector"] for row in rows}) == len(rows)
    for category, count in CATEGORIES.items():
        assert {r["selector"] for r in rows if r["category"] == category} == {
            f"Q41-I01:{category}:{i}" for i in range(count)}
    for row in rows:
        offset = int(row["file_offset"], 16)
        literal = image[offset:offset + row["byte_count"]]
        assert digest(literal) == row["sha256"] and literal == row["literal"].encode()

    intervals = [r for r in baseline["intervals"] if r["lead_id"] == "Q41-B02"]
    assert len(intervals) == 13 and sum(r["byte_count"] for r in intervals) == 42795556
    for row in intervals:
        assert digest(image[row["file_start"]:row["file_end_exclusive"]]) == row["sha256"]
    assert baseline["outputs"]["relocation-classification.jsonl"]["records"] == 634018

    src = ROOT / "crates/azeroth-survivors-re/src"
    scanned, directives, containers = [], [], []
    for source in sorted(src.rglob("*.rs")):
        text = source.read_text()
        literal, concat = list(LITERAL.finditer(text)), list(CONCAT.finditer(text))
        assert len(literal) + len(concat) == text.count("include_str!"), source
        scanned.append(source.relative_to(ROOT).as_posix())
        for match in sorted(literal + concat, key=lambda m: m.start()):
            if match in concat:
                crate = next(p for p in source.parents if (p / "Cargo.toml").is_file())
                path = (crate / match.group(1).lstrip("/")).resolve()
            else:
                path = (source.parent / match.group(1)).resolve()
            directives.append({"source": source.relative_to(ROOT).as_posix(),
                               "path": path.relative_to(ROOT).as_posix()})
            if path.suffix.lower() in (".lua", ".xml"):
                assert path.is_file()
                matches = [r["selector"] for r in rows if r["literal"] in path.read_text()]
                containers.append({"source": receipt(source), "payload": receipt(path),
                                   "matched_rows": len(matches),
                                   "selectors": selector_ranges(matches)})
    assert len(containers) == 7
    payloads = [(ROOT / c["payload"]["path"]).read_text() for c in containers]
    replay = [{"selector": r["selector"], "original_classification": r["classification"],
               "containers": [i for i, text in enumerate(payloads) if r["literal"] in text]}
              for r in rows]
    included = [r for r, result in zip(rows, replay) if result["containers"]]
    unknown = [r for r in rows if r["classification"] == UNKNOWN]
    known_unknown = [r for r, result in zip(rows, replay)
                     if r["classification"] == UNKNOWN and result["containers"]]
    left = [r for r, result in zip(rows, replay)
            if r["classification"] == UNKNOWN and not result["containers"]]
    assert len(included) == 709 and len(unknown) == 281 and len(known_unknown) == 173
    assert Counter(r["category"] for r in known_unknown) == {
        "game_binding_identifier": 146, "lua_function_declaration": 27}
    assert Counter(r["category"] for r in left) == {
        "resource_path": 107, "lua_function_declaration": 1}

    contracts = []
    for selector, gap, name in [("Q41-I01:resource_path:208", 107, "q41-glue-strings.json"),
                                ("Q41-I01:resource_path:211", 106, "q41-death-popup.json")]:
        proof_path = ROOT / "docs/analysis/evidence/0.115.0" / name
        proof = json.loads(read_artifact(proof_path))
        assert proof["schema_version"] == 1 and proof["target"]["sha256"] == SHA
        assert gap in proof["gap_ids"] and selector in proof["lead_ids"]
        assert any(r["selector"] == selector for r in left)
        verify_project_receipts(proof)
        if gap == 107:
            assert len(proof["queries"]) == 9 and len(proof["source_files"]) == 10
            assert len(proof["source_checks"]) == 8 and all(proof["source_checks"].values())
            assert (proof["data"]["race_rows"], proof["data"]["class_rows"],
                    len(proof["data"]["realm_globals"])) == (22, 9, 5)
            assert len(proof["locales"]) == len(proof["lua_fixtures"]) == 14
            assert sum(r["assertions"] for r in proof["lua_fixtures"]) == 518
            for query in proof["queries"]:
                count = int(query["end_exclusive"], 16) - int(query["start"], 16)
                assert count > 0 and digest(native(query["start"], count)) == query["sha256"]
        else:
            owner = proof["native_owner"]
            count = int(owner["end_exclusive"], 16) - int(owner["start"], 16)
            assert count == 545 and digest(native(owner["start"], count)) == owner["sha256"]
            assert proof["lua"]["bytes"] == 271 and len(proof["interface_sites"]) == 9
            assert proof["interpreted_lua"]["cases"] == 52
            for site in proof["interface_sites"]:
                value = bytes.fromhex(site["bytes"])
                assert native(site["site"], len(value)) == value
            assert proof["path"]["value"] == next(r["literal"] for r in left if r["selector"] == selector)
        contracts.append({"selector": selector, "gap_id": gap, "proof": receipt(proof_path)})
    connected = {c["selector"] for c in contracts}
    remaining = [r for r in left if r["selector"] not in connected]
    assert len(remaining) == 106
    assert Counter(r["category"] for r in remaining) == {
        "resource_path": 105, "lua_function_declaration": 1}
    diagnostic = next(r for r in remaining if r["category"] == "lua_function_declaration")
    assert diagnostic["selector"] == "Q41-I01:lua_function_declaration:107"
    assert diagnostic["literal"] == "function argument("
    return {
        "schema_version": 1, "target": {"version": "0.115.0", "sha256": SHA},
        "gap_ids": [41, 105, 106, 107], "lead_ids": ["Q41-B02", "Q41-I01"],
        "generator": receipt(HERE), "classification_proof": receipt(MANIFEST),
        "dependencies": [receipt(ROOT / p) for p in (
            "scripts/coverage_common.py", "scripts/script_sources.py", "scripts/inventory-executable.py")],
        "input": {**receipt(data), "records": len(rows), "bytes": len(raw)},
        "all_rows": {"categories": CATEGORIES, "exact_image_bytes_verified": len(rows),
                     "replay_sha256": digest(encoded(replay))},
        "B02_reused_boundaries": {"ranges": len(intervals), "bytes": 42795556,
                                  "all_range_bytes_verified": True,
                                  "DIR64_records_in_owning_classification": 634018,
                                  "semantic_closure": False},
        "include_scan": {"root": src.relative_to(ROOT).as_posix(), "rust_files": len(scanned),
                         "rust_path_set_sha256": digest(encoded(scanned)),
                         "literal_and_concat_env_directives": len(directives),
                         "directive_set_sha256": digest(encoded(directives)),
                         "containers": containers},
        "included_rows": {"count": len(included),
                          "original_classifications": dict(Counter(r["classification"] for r in included))},
        "original_unknown": {"count": len(unknown),
                             "categories": dict(Counter(r["category"] for r in unknown))},
        "original_unknown_included": {"count": len(known_unknown),
                                      "categories": dict(Counter(r["category"] for r in known_unknown)),
                                      "selectors": selector_ranges(r["selector"] for r in known_unknown)},
        "original_unknown_without_included": {"count": len(left),
                                              "selectors": selector_ranges(r["selector"] for r in left)},
        "separate_recovered_AS_core_contracts": contracts,
        "remaining_without_these_connections": {
            "count": len(remaining), "categories": dict(Counter(r["category"] for r in remaining)),
            "selectors": selector_ranges(r["selector"] for r in remaining),
            "generic_Lua_diagnostic": {"selector": diagnostic["selector"], "literal": diagnostic["literal"]}},
        "limits": [
            "All 2110 rows are replayed; occurrence in immutable included text establishes a source container only, not native callback/schema/producer/consumer or runtime closure.",
            "Current literal include_str and concat/env forms are exhaustively checked in the AS Rust source tree. This is textual inspection, not Rust macro expansion or execution.",
            "Old canonical files keep original provenance. Inclusion does not revalidate their complete native behavior or every literal; owning current proofs govern recovered contracts.",
            "The two resource contracts reuse separate target-bound proofs; this checker does not duplicate their recovery or execute their source implementations.",
            "The 105 remaining resource leads are not all classified as engine or fully traced. Existing AS resource connections, artwork and generic engine leads remain distinct from demonstrated defects; #103/#104 proof-only revalidation is excluded.",
            "B02 byte boundaries retain mixed schemas, aliases/types and unknown AS consumers; no global semantic closure, compilation, application/game/network execution or parity is claimed.",
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--proof", type=Path, default=KEEP, help="alternate compact proof destination")
    options = parser.parse_args()
    proof = derive()
    if options.write:
        options.proof.parent.mkdir(parents=True, exist_ok=True)
        options.proof.write_text(json.dumps(proof, indent=2) + "\n")
    else:
        retained = ARCHIVED_OUTPUT if options.proof == KEEP and not KEEP.is_file() else options.proof
        assert json.loads(read_artifact(retained)) == proof, "Embedded-container proof differs"
    print("PASS: 2110 exact target rows, 7 included containers, 709 occurrences/173 original unknowns; 2 separate core contracts, 106 remaining without these connections; semantics/runtime/parity remain bounded")


if __name__ == "__main__":
    main()
