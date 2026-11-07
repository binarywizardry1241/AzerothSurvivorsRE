#!/usr/bin/env python3
"""Restore/check exact selected 0.119.0 embedded catalogs for finding #169.

Independently rediscover the descriptor table using the existing locale reviewer,
then require its native-only commitments to match the retained pre-repair audit.
Do not rewrite that historical source-delta evidence. No native execution,
compilation, game/server launch or installed-file writes.
"""

import argparse
import hashlib
import json

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="Replace source catalogs with exact native payload bytes")
    args = parser.parse_args()
    target = latest_target(verify=True)
    expected_sha = "6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f"
    if target["version"] != "0.119.0" or target["sha256"] != expected_sha:
        raise ValueError("This repair is bound to the recovered 0.119.0 target")
    retained = json.loads((ROOT / "docs/analysis/evidence/locale-catalog-review.json").read_text())
    reviewer = load_script("restore_coop_locale_review", ROOT / "scripts/review-current-locale-catalogs.py")
    current = reviewer.derive()
    if current["target"] != retained["target"] or current["locale_table"] != retained["locale_table"]:
        raise ValueError("Selected target or independently discovered locale table changed")
    image = target_bytes(target)
    writes, rows = [], []
    for previous, row in zip(retained["locales"], current["locales"], strict=True):
        for field in ("index", "record", "code", "name", "trailing_word", "payload", "native_keys"):
            if previous[field] != row[field]:
                raise ValueError(f"Native descriptor changed: {row['code']} {field}")
        payload = row["payload"]
        start = int(payload["file_offset"], 16)
        raw = image[start:start + payload["byte_count"]]
        if hashlib.sha256(raw).hexdigest() != payload["sha256"]:
            raise ValueError("Descriptor-bounded payload changed")
        path = ROOT / row["source"]["path"]
        if path != ROOT / f"crates/azeroth-survivors-re/assets/locales/{row['code']}.json":
            raise ValueError("Unexpected catalog destination")
        source = path.read_bytes()
        native_map, source_map = json.loads(raw), json.loads(source)
        # This is an additive translation repair plus obsolete English keys;
        # reject overwriting any value or any non-English source-only entry.
        if any(source_map[key] != value for key, value in native_map.items() if key in source_map):
            raise ValueError(f"Existing translated value differs: {row['code']}")
        if row["code"] != "en" and source_map.keys() - native_map.keys():
            raise ValueError(f"Unexpected source-only translation: {row['code']}")
        if row["code"] == "en" and not (source_map.keys() - native_map.keys()) <= set(previous["removed_native_keys"]):
            raise ValueError("Unexpected obsolete English key")
        if source != raw:
            writes.append((path, raw))
        rows.append(dict(code=row["code"], keys=len(native_map), payload_sha256=payload["sha256"],
                         missing_values=len(native_map.keys() - source_map.keys()),
                         obsolete_keys=len(source_map.keys() - native_map.keys())))
    if len(rows) != 14 or sum(row["keys"] for row in rows) != 41706:
        raise ValueError("Reviewed catalog population changed")
    if args.apply:
        for path, raw in writes:
            path.write_bytes(raw)
    elif writes:
        raise ValueError("Source catalogs differ from the selected native payloads; use --apply")
    print(json.dumps(dict(target=current["target"], catalogs=rows, changed_files=len(writes),
                          exact_native_payloads=True, applied=args.apply), ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
