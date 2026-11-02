#!/usr/bin/env python3
"""Verify the five current collection labels against all fourteen native catalogs.

Read-only by default. --write updates only the compact evidence projection;
no locale source file, common locale checker or application is changed.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

PROOF = ROOT / "docs/analysis/evidence/0.121.0/collection-localization.json"
CATALOG_RECEIPTS = ROOT / "docs/analysis/evidence/0.121.0/orb-source.json"
SOURCE = "crates/azeroth-survivors-re/src/armory.rs"
KEYS = ("armory.collection_complete", "armory.zones_done", "armory.star_cap",
        "armory.star_cap_none", "armory.stars")


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def inspect():
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    receipts_raw = CATALOG_RECEIPTS.read_bytes()
    receipts = json.loads(receipts_raw)
    assert target == receipts["target"]
    image = target_bytes(selected)
    pe = load_script("collection_locale_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def native(receipt):
        address = int(receipt["virtual_address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        assert offset == int(receipt["file_offset"], 16)
        raw = image[offset:offset + receipt["byte_count"]]
        assert len(raw) == receipt["byte_count"] and sha(raw) == receipt["sha256"]
        return raw

    table = receipts["locale_table"]
    native(table)
    assert table["byte_count"] == 14 * 56
    assert len(receipts["locales"]) == 14
    rows = []
    for index, row in enumerate(receipts["locales"]):
        assert row["index"] == index
        assert int(row["descriptor"]["virtual_address"], 16) == int(table["virtual_address"], 16) + index * 56
        descriptor = struct.unpack("<7Q", native(row["descriptor"]))
        code_offset = pe.rva_offset(descriptor[0] - pe.image_base)
        assert image[code_offset:code_offset + descriptor[1]].decode() == row["code"]
        assert descriptor[4] == int(row["payload"]["virtual_address"], 16)
        assert descriptor[5] == row["payload"]["byte_count"]
        catalog = json.loads(native(row["payload"]))
        values = [catalog[key] for key in KEYS]
        assert all(isinstance(value, str) for value in values)
        source_path = "crates/azeroth-survivors-re/assets/locales/" + row["code"] + ".json"
        source = json.loads((ROOT / source_path).read_text())
        assert all(source.get(key) == value for key, value in zip(KEYS, values)), source_path
        rows.append(dict(code=row["code"], descriptor=row["descriptor"], payload=row["payload"],
                         source_path=source_path, values=values,
                         selected_values_sha256=sha(json.dumps(values, ensure_ascii=False,
                             separators=(",", ":")).encode())))
    source = (ROOT / SOURCE).read_text()
    assert all('"' + key + '"' in source for key in KEYS)
    return dict(schema_version=1, target=target, gap_ids=[236], keys=list(KEYS),
                catalog_receipts=dict(path=CATALOG_RECEIPTS.relative_to(ROOT).as_posix(),
                                      sha256=sha(receipts_raw)),
                locale_table=table, locales=rows,
                generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(),
                               sha256=sha(Path(__file__).read_bytes())),
                consumer=dict(path=SOURCE, keys=list(KEYS)),
                scope="Five collection labels only, preserving every native UTF-8 value. SetTip, selected-set and purchase labels are outside this projection.",
                compilation="not_run", application_executed=False, parity_verified=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    result = inspect()
    if args.write:
        PROOF.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
    else:
        assert result == json.loads(PROOF.read_text())
    print(json.dumps(dict(locale_count=len(result["locales"]), key_count=len(KEYS),
                          exact_native_values=len(result["locales"]) * len(KEYS),
                          source_connection_checked=True, compiled=False,
                          application_executed=False, parity_verified=False)))


if __name__ == "__main__":
    main()
