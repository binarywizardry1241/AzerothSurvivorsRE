#!/usr/bin/env python3
"""Verify current pick/smoothing discovery receipts without compiling or execution.

This checks every declared code byte/instruction boundary, exact original data,
durable Ghidra subjects and the inspected source witnesses. It does not simulate
packets, execute instructions or certify complete semantics or parity.
"""

from script_sources import current_path, recorded_input_matches
import hashlib
import json
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/pick-smooth"
DISCOVERY_SOURCE_REVISION = "14bc932e5f52188fbe0f3f1c38c07d2cbd382e44"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    proof = json.loads((BASE / "manifest.json").read_text())
    target = {key: value for key, value in latest_target(verify=True).items()
              if key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"] and proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("release123_discovery_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instruction_count = 0
    texts = {}
    for row in proof["ranges"]:
        start, end = int(row["start"], 0), int(row["end_exclusive"], 0)
        at = pe.rva_offset(start - pe.image_base)
        assert hex(at) == row["file_offset"]
        raw = image[at:at + end - start]
        assert digest(raw) == row["sha256"]
        instructions = list(decoder.disasm(raw, start))
        assert sum(item.size for item in instructions) == len(raw), row["role"]
        assert instructions[0].address == start
        assert instructions[-1].address + instructions[-1].size == end
        instruction_count += len(instructions)
    data = {}
    for row in proof["data_ranges"]:
        at = pe.rva_offset(int(row["start"], 0) - pe.image_base)
        assert hex(at) == row["file_offset"]
        raw = image[at:at + row["byte_count"]]
        assert raw.hex() == row["hex"] and digest(raw) == row["sha256"]
        if "utf8" in row:
            assert raw.decode() == row["utf8"]
        data[row["role"]] = row
    assert data["exact-json-prefix"]["utf8"] == '{"type":"'
    assert data["offer-key"]["utf8"] == '"offer":'
    assert data["delay-threshold-ms"]["value"] == 40.0
    assert data["movement-speed"]["value"] == 7.0
    imports = {int(row["iat_start_address"], 16) + index * 8: (row["library"], function)
               for row in pe.imports() for index, function in enumerate(row["functions"])}
    for row in proof["import_bindings"]:
        address = int(row["thunk"], 0)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + 6]
        assert hex(at) == row["file_offset"] and raw.hex() == row["hex"]
        assert digest(raw) == row["sha256"] and raw[:2] == b"\xff\x25"
        iat = address + 6 + struct.unpack("<i", raw[2:])[0]
        assert hex(iat) == row["iat"]
        assert imports[iat] == (row["library"], row["function"])
    for query in proof["queries"]:
        result = json.loads(receipt(query["result"]).read_text())
        native = result.get("structuredContent")
        if native is None:
            native = json.loads(result["content"][0]["text"])
        subject = verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        assert subject == query["subject_verification"]
        assert digest(native["normalized_result"].encode()) == query["normalized_sha256"]
        assert receipt(query["canonical_extract"]).read_text() == native["normalized_result"]
        texts[query["role"]] = native["normalized_result"]
    pick = texts["choice-receiver"]
    assert "param_4[2] = 0xffffffffffffffff" in pick
    assert "*(undefined4 *)(param_4 + 5) = uVar12;" in pick
    smooth = texts["packet-smoother"]
    assert "uVar17 == 0xaa" in smooth and "uVar17 == 0xdd" in smooth
    assert "uVar17 != 199" in smooth and "param_3 + 0x50" in smooth
    assert "_DAT_14645d7e0" in smooth and "_DAT_1461ba31c" in smooth
    assert "FUN_145bde900" in smooth
    # These observations describe the source at discovery, before the selected
    # repairs. Verify its exact Git bytes so implementing a defect does not
    # invalidate the retained native/discrepancy evidence.
    revision = DISCOVERY_SOURCE_REVISION
    sources = {}
    for row in proof["source_witnesses"]:
        project_path(row["path"])
        raw = subprocess.check_output(["git", "show", revision + ":" + row["path"]], cwd=ROOT)
        assert digest(raw) == row["sha256"], row["path"]
        sources[row["path"]] = raw.decode()
    overlay = sources["crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs"]
    receiver = overlay.split("pub(super) fn receive_choices(", 1)[1].split("fn raw_icon(", 1)[0]
    assert 'value.get("type")' in receiver and 'value.get("choices")' in receiver
    assert "state.choices = Some(value);" in receiver
    assert "state.choice_revision = state.choice_revision.wrapping_add(1);" in receiver
    assert 'get("offer")' not in receiver
    wire = sources["crates/azeroth-survivors-re/src/coop/replication.rs"]
    assert "Control { kind: u8, argument: u8 }" in wire
    commands = sources["crates/azeroth-survivors-re/src/gameplay/coop_commands.rs"]
    assert "for (client, kind, argument) in std::mem::take(&mut state.controls)" in commands
    assert "motion.recovery.admit(" in commands
    return {"status": "passed", "target_version": target["version"],
            "target_sha256": target["sha256"], "code_ranges": len(proof["ranges"]),
            "instructions_verified": instruction_count,
            "data_ranges": len(proof["data_ranges"]), "queries": len(proof["queries"]),
            "source_witnesses": len(sources), "source_review_revision": revision,
            "source_scope": "historical_discovery_observations",
            "target_executed": False,
            "semantic_completeness": False, "runtime_verified": False, "parity_verified": False}


if __name__ == "__main__":
    print(json.dumps(check(), indent=2))
