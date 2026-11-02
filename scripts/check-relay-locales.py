#!/usr/bin/env python3
"""Verify exact current relay-unreachable translations and their UI consumer.

Read-only native/data/source checks; no application compilation or execution.
"""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/relay-locales/manifest.json"
KEY = "the co-op relay cannot be reached"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def retained(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"], row["path"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert target == proof["target"] and target["version"] == "0.121.0"
    image = target_bytes(target)
    pe = load_script("relay_locales_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"]
        if "assembly" in row:
            ins = list(decoder.disasm(raw, start))
            assert sum(i.size for i in ins) == len(raw)
            assert len(ins) == row["instruction_count"]
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in ins)
            assert retained(row["assembly"]).read_text() == text
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in proof["locales"]:
        at = pe.rva_offset(int(row["record_virtual_address"], 16) - pe.image_base)
        code, code_len, _, _, pointer, size = struct.unpack_from("<6Q", image, at)
        code_at = pe.rva_offset(code - pe.image_base)
        assert image[code_at:code_at + code_len].decode() == row["code"]
        offset = pe.rva_offset(pointer - pe.image_base)
        payload = image[offset:offset + size]
        assert hex(pointer) == row["payload_virtual_address"]
        assert len(payload) == row["byte_count"] and sha(payload) == row["sha256"]
        catalog = json.loads(payload)
        assert len(catalog) == row["keys"] == 3187
        assert catalog[KEY] == row["relay_unreachable"]
        source = json.loads((ROOT / f"crates/azeroth-survivors-re/assets/locales/{row['code']}.json").read_text())
        assert source[KEY] == catalog[KEY]
    assert [r["code"] for r in proof["locales"]] == [
        "en", "pl", "cs", "de", "pt", "es", "fr", "ro", "tr", "ru", "uk", "zh", "ja", "ko"]
    dispatch = next(r for r in proof["native_data"] if r["role"] == "ui-reason-dispatch")
    assert 0x1461ece68 + struct.unpack_from("<i", bytes.fromhex(dispatch["bytes_hex"]), (33 - 13) * 4)[0] == 0x1402728c2
    forms = (ROOT / "crates/azeroth-survivors-re/src/coop_forms.rs").read_text()
    assert f'"{KEY}"' in forms.split("fn localized_reason", 1)[1].split("\n}", 1)[0]
    ui = (ROOT / "crates/azeroth-survivors-re/src/coop_ui.rs").read_text()
    assert "forms::localized_reason(raw)" in ui and "label(locale, raw)" in ui
    assert proof["target_executed"] is False


def main():
    proof = json.loads(MANIFEST.read_text())
    verify(proof)
    print(json.dumps({"target": proof["target"]["version"], "locale_values": len(proof["locales"]),
                      "native_instructions": sum(r["instruction_count"] for r in proof["native_ranges"]),
                      "queries": len(proof["queries"]), "source_consumer": "verified",
                      "application_executed": False, "parity_verified": False}, indent=2))


if __name__ == "__main__":
    main()
