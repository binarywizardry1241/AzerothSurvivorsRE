#!/usr/bin/env python3
"""Restore/check the exact 0.120.0 race purchase/reset/hover locale delta.

The fourteen descriptors were independently discovered with the existing locale
reviewer. Verify their exact original bytes, pointer/length relationships and
source delta before writing. No compiler, application or native execution.
"""

import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
ADDED = {
    "Races",
    "Every class",
    "Opens it to: {classes}",
    "Open a race to every class, its racial and passives with it, for {cost} points each. Bought for good: resets keep it.",
    "Open it to every class on the Rewards tab, under Races.",
    "Perks, tabards and races are the account's: every hero of every class has them. Earn achievements for more points.",
    "Takes back every point spent on perks, to spend again. Tabards and races are kept. {resets} of {total} resets left on this save.",
    "You have changed your perks, tabards or races without confirming. Confirm the changes before you go?",
}
REMOVED = {
    "Perks and tabards are the account's: every hero of every class has them. Earn achievements for more points.",
    "Takes back every point spent on perks, to spend again. Tabards are kept. {resets} of {total} resets left on this save.",
    "You have changed your perks or tabards without confirming. Confirm the changes before you go?",
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.120.0" and target["sha256"] == SHA
    proof = json.loads((ROOT / "docs/analysis/evidence/race-locales/manifest.json").read_text())
    assert proof["target"]["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("race_locale_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, length):
        start = pe.rva_offset(address - pe.image_base)
        assert length > 0 and pe.rva_offset(address + length - 1 - pe.image_base) == start + length - 1
        result = image[start:start + length]
        assert len(result) == length
        return result

    def span(row):
        address = int(row["virtual_address"], 16)
        assert pe.rva_offset(address - pe.image_base) == int(row["file_offset"], 16)
        result = raw(address, row["byte_count"])
        assert hashlib.sha256(result).hexdigest() == row["sha256"]
        return result

    table = span(proof["locale_table"])
    assert len(table) == 14 * 56 and len(proof["locales"]) == 14
    codes, writes = [], []
    for index, row in enumerate(proof["locales"]):
        record = span(row["record"])
        assert record == table[index * 56:(index + 1) * 56] and index == row["index"]
        cp, cn, np, nn, jp, jn, trailing = struct.unpack("<7Q", record)
        assert raw(cp, cn).decode() == row["code"] and cn == 2
        assert raw(np, nn).decode() == row["name"] and trailing == row["trailing_word"]
        payload = span(row["payload"])
        assert payload == raw(jp, jn)
        native = json.loads(payload)
        assert row["native_keys"] == len(native) == 2984
        assert set(row["missing_source_keys"]) == ADDED
        assert set(row["removed_native_keys"]) == REMOVED and not row["changed_existing_values"]
        assert ADDED <= native.keys() and not REMOVED & native.keys()
        path = ROOT / row["source"]["path"]
        assert path == ROOT / f"crates/azeroth-survivors-re/assets/locales/{row['code']}.json"
        # Retain repository LF line endings, independently of native JSON CRLF.
        normalized = payload.replace(b"\r\n", b"\n")
        source = path.read_bytes()
        if source != normalized:
            assert source == payload or hashlib.sha256(source).hexdigest() == row["source"]["sha256"], "Concurrent locale edit"
            previous = json.loads(source)
            assert native == previous or native.keys() - previous.keys() == ADDED
            assert native == previous or previous.keys() - native.keys() == REMOVED
            assert all(previous[k] == native[k] for k in previous.keys() & native.keys())
            writes.append((path, normalized))
        codes.append(row["code"])
    assert len(set(codes)) == 14
    if args.apply:
        for path, payload in writes:
            path.write_bytes(payload)
    else:
        assert not writes, "Source race locales differ; use --apply"
    print(json.dumps(dict(target="0.120.0", catalogs=14, native_values=14 * 2984,
        restored_race_values=14 * len(ADDED), superseded_prose_values=14 * len(REMOVED),
        native_CRLF_normalized_to_LF=True,
        changed_files=len(writes), applied=args.apply, compilation=False,
        application_executed=False, parity_verified=False)))


if __name__ == "__main__":
    main()
