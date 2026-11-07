#!/usr/bin/env python3
"""Recover the selected 0.100.1 locale/font data after complete SHA verification.

Optional analysis tooling; source builds never read the supplied executable.
The descriptors and tables were independently located in this target and their
native consumers are retained in assets-localization-native.json.
"""
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
SHA256 = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
TABLE, COUNT, STRIDE = 0x1469D1580, 14, 56


def main():
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA256:
        raise SystemExit("Target SHA-256 mismatch; outputs not written")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def offset(address):
        return pe.rva_offset(address - pe.image_base)

    def pair(address):
        pointer, size = struct.unpack_from("<QQ", data, offset(address))
        start = offset(pointer)
        payload = data[start:start + size]
        if len(payload) != size:
            raise ValueError("Unbounded descriptor")
        return pointer, payload

    def provenance(address, count, stride):
        start = offset(address)
        payload = data[start:start + count * stride]
        return dict(virtual_address=hex(address), file_offset=hex(start), count=count,
                    stride=stride, bytes_hex=payload.hex(), sha256=hashlib.sha256(payload).hexdigest())

    locales, catalogs, changes = [], [], {}
    output = ROOT / "crates/azeroth-survivors-re/assets/locales"
    for index in range(COUNT):
        row = TABLE + index * STRIDE
        code_address, code_bytes = pair(row)
        name_address, name_bytes = pair(row + 16)
        catalog_address, payload = pair(row + 32)
        code, name = code_bytes.decode(), name_bytes.decode()
        cjk = data[offset(row + 48)]
        assert len(code_bytes) == 2 and cjk in (0, 1)
        catalog = json.loads(payload)
        assert len(catalog) == 2632 and all(isinstance(k, str) and isinstance(v, str) for k, v in catalog.items())
        if catalogs:
            assert catalog.keys() == catalogs[0].keys()
        catalogs.append(catalog)
        old_file = output / f"{code}.json"
        if old_file.exists():
            old = json.loads(old_file.read_text())
            changes[code] = dict(added=sorted(catalog.keys() - old.keys()), removed=sorted(old.keys() - catalog.keys()),
                                 changed_existing=sum(catalog[k] != old[k] for k in catalog.keys() & old.keys()))
        old_file.write_bytes(payload)
        locales.append(dict(index=index, record_virtual_address=hex(row), code=code, native_name=name,
                            code_virtual_address=hex(code_address), name_virtual_address=hex(name_address),
                            cjk=bool(cjk), file_offset=hex(offset(catalog_address)),
                            virtual_address=hex(catalog_address), byte_count=len(payload), labels=len(catalog),
                            embedded_sha256=hashlib.sha256(payload).hexdigest(),
                            output=str(old_file.relative_to(ROOT)),
                            output_sha256=hashlib.sha256(old_file.read_bytes()).hexdigest()))
        print(f"{index}: {code} {name}, {len(catalog)} labels, CJK={cjk}")

    composites = provenance(0x1469FA038, 41, 16)
    composites["records"] = [dict(zip(["base", "target", "mark", "mode"],
                                           struct.unpack_from("<IIIB", data, offset(0x1469FA038) + i * 16))) for i in range(41)]
    mirrors = provenance(0x1469FA2E0, 2, 8)
    aliases = provenance(0x1469FA308, 6, 8)
    for table in (mirrors, aliases):
        at = int(table["file_offset"], 16)
        table["records"] = [dict(zip(["target", "donor"], struct.unpack_from("<II", data, at + i * 8)))
                            for i in range(table["count"])]
    base_fonts = provenance(0x146A4D898, 3, 40)
    base_fonts["records"] = []
    for i in range(3):
        row = 0x146A4D898 + i * 40
        _, name = pair(row)
        pointer, payload = pair(row + 16)
        base_fonts["records"].append(dict(path=name.decode(), virtual_address=hex(pointer), file_offset=hex(offset(pointer)),
                                           byte_count=len(payload), augment=bool(data[offset(row + 32)]),
                                           sha256=hashlib.sha256(payload).hexdigest()))
    report = dict(date="2026-10-18", version="0.100.1", target=str(TARGET.relative_to(ROOT)),
                  artifact_sha256=SHA256, target_executed=False,
                  method="Exact native 56-byte locale descriptors; pointer-length-bounded UTF-8 JSON; exact font tables.",
                  table=provenance(TABLE, COUNT, STRIDE), locales=locales,
                  historical_catalog_delta=changes, composites=composites, mirrors=mirrors, aliases=aliases,
                  base_fonts=base_fonts,
                  limitations=["Static data is not proof that every localized consumer renders correctly.",
                               "Native behavior/callers are retained separately; no target is launched by this script."])
    path = ROOT / "docs/analysis/evidence/locales.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")


if __name__ == "__main__":
    main()
