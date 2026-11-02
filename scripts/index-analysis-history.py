#!/usr/bin/env python3
"""Index completed legacy operations without re-running or reinterpreting them."""
import argparse
import json
import os
from pathlib import Path

from shared_analysis import SharedAnalysis, file_digest

ROOT = Path(__file__).resolve().parents[1]


def import_history(root, apply=False):
    store = SharedAnalysis(root) if apply else None
    completed = indexed = missing = 0
    for parent, directories, names in os.walk(root / "runtime", followlinks=False):
        directories[:] = [n for n in directories if n not in
            {"objects", "programs", "cargo", "cargo-target", "target", "node_modules", "project"}
            and not n.endswith(".rep") and not (Path(parent) / n).is_symlink()]
        if "journal.json" not in names:
            continue
        path = Path(parent) / "journal.json"
        if path.is_symlink():
            continue
        journal = json.loads(path.read_text())
        identity = journal.get("identity", {})
        target = identity.get("target", {})
        if not target.get("sha256"):
            continue
        for row in journal.get("operations", {}).values():
            if row.get("status") != "completed":
                continue
            completed += 1
            receipt = row["result"]
            logical = Path(os.path.normpath(root / receipt["path"]))
            if not logical.is_relative_to(root / "runtime"):
                raise ValueError("Historical operation result leaves runtime/")
            if not logical.is_file():
                missing += 1
                continue
            if not logical.resolve().is_relative_to(root / "runtime") or file_digest(logical) != receipt["sha256"]:
                raise ValueError(f"Historical query result differs: {logical}")
            provenance = {"format": "rea-retained-operation-v1", "target_sha256": target["sha256"],
                "target": target, "operation": {"name": row["name"], "arguments": row["arguments"]},
                "analysis_inputs": {k: v for k, v in identity.items() if k not in ("plan", "target")},
                "journal": path.relative_to(root).as_posix(),
                "applicability": "original target/profile only; cross-target matches require correspondence proof"}
            if apply:
                physical = logical.resolve()
                if logical.is_symlink() and physical.is_relative_to(store.objects):
                    shared_receipt = {"sha256": receipt["sha256"],
                        "path": physical.relative_to(root).as_posix(), "bytes": physical.stat().st_size}
                elif not logical.is_symlink():
                    shared_receipt = store.migrate_file(logical, provenance)
                else:
                    # Other historical alias stores retain their own consumers.
                    # Index the bytes, preserving their original alias chain.
                    shared_receipt = store.put_bytes(logical.read_bytes(), "historical-query", provenance)
                store.observe(shared_receipt, provenance, "historical-query")
                indexed += 1
    return {"completed_operations": completed, "indexed_operations": indexed,
            "missing_legacy_results": missing, "applied": apply}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    print(json.dumps(import_history(ROOT, args.apply), indent=2))


if __name__ == "__main__":
    main()
