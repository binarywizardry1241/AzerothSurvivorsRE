#!/usr/bin/env python3
"""Audit/apply transparent filesystem compression to immutable shared CAS objects.

Darwin uses the installed /usr/bin/ditto. Other platforms retain normal files.
Object paths, decompressed bytes and all existing provenance/hashes stay intact.
"""

import argparse
import json
from pathlib import Path

from shared_analysis import SharedAnalysis


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="Verify and compress one object at a time")
    parser.add_argument("--minimum-bytes", type=int, default=1024 * 1024)
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()
    if args.minimum_bytes < 1 or (args.limit is not None and args.limit < 1):
        parser.error("Minimum/limit must be positive")
    if not (Path(__file__).resolve().parents[1] / "runtime/analysis/knowledge.sqlite").is_file():
        parser.error("No shared analysis catalog exists; nothing to audit")
    store = SharedAnalysis()
    with store.connect() as connection:
        objects = connection.execute("SELECT sha256,bytes,kind FROM analysis_objects ORDER BY bytes DESC,sha256").fetchall()
    eligible = compressed = reclaimed = selected_bytes = 0
    for sha256, size, kind in objects:
        receipt = store._receipt(sha256, size, kind)
        selected, reason = store.compression_candidate(receipt, args.minimum_bytes)
        if not selected:
            continue
        eligible += 1
        selected_bytes += size
        if args.apply:
            result = store.compress_object(receipt, args.minimum_bytes)
            compressed += result["compressed"]
            reclaimed += result["reclaimed_allocated_bytes"]
            print(json.dumps(dict(result, sha256=sha256)), flush=True)
        if args.limit is not None and eligible >= args.limit:
            break
    print(json.dumps({"mode": "apply" if args.apply else "read-only audit", "eligible_objects": eligible,
                      "eligible_logical_bytes": selected_bytes, "compressed_objects": compressed,
                      "reclaimed_allocated_bytes": reclaimed}, indent=2))


if __name__ == "__main__":
    main()
