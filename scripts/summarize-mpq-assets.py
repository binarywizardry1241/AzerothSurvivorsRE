#!/usr/bin/env python3
"""Export compact, reproducible textual evidence from asset-recovery's local JSON report."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
from datetime import datetime
from pathlib import Path
from zoneinfo import ZoneInfo


ROOT = Path(__file__).resolve().parent.parent
FIELDS = ("archive_id", "member_path", "bytes", "sha256", "extracted_path")


def local_path(value: str | Path) -> Path:
    path = Path(value)
    if not path.is_absolute():
        path = Path.cwd() / path
    path = Path(os.path.normpath(path))
    try:
        suffix = path.relative_to(ROOT)
    except ValueError as error:
        raise ValueError(f"path escapes project workspace: {path}") from error
    cursor = ROOT
    for part in suffix.parts:
        cursor /= part
        if cursor.is_symlink():
            raise ValueError(f"symlink path refused: {cursor}")
    return path


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def export(args: argparse.Namespace) -> dict:
    source = local_path(args.input)
    paths_file = local_path(args.paths_file)
    output_dir = local_path(args.output_dir)
    if not output_dir.is_relative_to(ROOT / "runtime"):
        raise ValueError("bulk inventory output must stay under runtime/; curate summaries separately")
    report = json.loads(source.read_text())
    if report["schema_version"] != 1:
        raise ValueError("unsupported asset-recovery report schema")
    probes = [line.strip() for line in paths_file.read_text().splitlines()
              if line.strip() and not line.strip().startswith("#")]
    if probes != [item["input"] for item in report["requested_paths"]]:
        raise ValueError("supplied EXE path list differs from the inventory's requested paths")
    rows = []
    checked = 0
    checked_bytes = 0
    archive_summaries = []
    status_counts: dict[str, int] = {}
    for archive in report["archives"]:
        readable = [member for member in archive["members"] if member["status"] == "readable"]
        archive_summaries.append({
            key: archive[key] for key in (
                "archive_id", "path", "size_bytes", "sha256", "hash_error",
                "staged_update", "source_chain_role", "open_status", "open_error",
                "listfile_status", "listfile_error", "listfile_utf8",
            )
        } | {
            "listed_paths": len(archive["listed_paths"]),
            "member_matches": len(archive["members"]),
            "readable_members": len(readable),
        })
        for member in archive["members"]:
            status_counts[member["status"]] = status_counts.get(member["status"], 0) + 1
        for member in readable:
            extracted = member["extracted_path"]
            if args.verify_extracted and member["extraction_status"] == "extracted":
                path = local_path(extracted)
                if path.stat().st_size != member["size_bytes"] or sha256_file(path) != member["sha256"]:
                    raise ValueError(f"extracted size/hash mismatch: {path}")
                checked += 1
                checked_bytes += path.stat().st_size
            rows.append((archive["archive_id"], member["path"], member["size_bytes"],
                         member["sha256"], extracted or ""))
    if len(rows) != report["summary"]["readable_members"]:
        raise ValueError("readable member count differs from the report summary")
    if args.verify_extracted and checked != report["summary"]["extracted_members"]:
        raise ValueError("verified extracted count differs from the report summary")

    # Bulk binary and textual inventories stay in runtime/. Curate only useful summaries
    # for docs. A TSV reader preserves Windows-style backslashes without escaping.
    output_dir.mkdir(parents=True, exist_ok=True)
    catalog = local_path(output_dir / "mpq-paths.tsv")
    with catalog.open("w", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(FIELDS)
        writer.writerows(rows)
    with catalog.open(newline="") as stream:
        check_rows = list(csv.reader(stream, delimiter="\t"))
    if tuple(check_rows[0]) != FIELDS or len(check_rows) - 1 != len(rows):
        raise ValueError("written catalog header/row-count validation failed")

    target = None
    if args.target_manifest:
        manifest_path = local_path(args.target_manifest)
        manifest = json.loads(manifest_path.read_text())
        target = {
            "manifest": relative(manifest_path),
            "manifest_sha256": sha256_file(manifest_path),
            "version": manifest["current_target"]["version"],
            "exe_path": manifest["current_target"]["path"],
            "exe_sha256": manifest["current_target"]["sha256"],
            "data_freshness": "These are the project-local archive hashes; a matching EXE does not establish that the local MPQs are the current installed version.",
        }
    result = {
        "schema_version": 1,
        "reviewed_date": args.date or datetime.now(ZoneInfo("Europe/Zagreb")).date().isoformat(),
        "target": target,
        "runtime_report": {"path": relative(source), "size_bytes": source.stat().st_size,
                           "sha256": sha256_file(source)},
        "requested_paths_source": {"path": relative(paths_file), "size_bytes": paths_file.stat().st_size,
                                   "sha256": sha256_file(paths_file)},
        "source_catalog": {"path": relative(catalog), "size_bytes": catalog.stat().st_size,
                           "sha256": sha256_file(catalog), "data_rows": len(rows), "columns": FIELDS},
        "summary": report["summary"],
        "member_status_counts": status_counts,
        "member_errors": [{"archive_id": archive["archive_id"], **member}
                          for archive in report["archives"] for member in archive["members"]
                          if member["status"] not in ("readable", "delete_marker")],
        "extraction_verification": {"performed": args.verify_extracted,
                                    "verified_files": checked, "verified_bytes": checked_bytes,
                                    "method": "Independently reread each extracted file and checked its size and SHA-256 against the recovery report."},
        "chain_status": report["chain_status"],
        "chain_error": report["chain_error"],
        "limitations": report["limitations"],
        "archives": archive_summaries,
        "requested_paths": report["requested_paths"],
        "scan_warnings": report["scan_warnings"],
    }
    summary = local_path(output_dir / "mpq-assets.json")
    summary.write_text(json.dumps(result, indent=2) + "\n")
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", required=True, help="runtime asset-recovery JSON inventory")
    parser.add_argument("--paths-file", required=True, help="the exact probe list used for the inventory")
    parser.add_argument("--output-dir", default="runtime/asset-recovery-summary",
                        help="bulk inventory directory beneath runtime/ (default: runtime/asset-recovery-summary)")
    parser.add_argument("--target-manifest", help="optional target-refresh JSON for explicit version binding")
    parser.add_argument("--date", help="explicit review date (YYYY-MM-DD)")
    parser.add_argument("--verify-extracted", action="store_true", help="independently hash every extracted file")
    args = parser.parse_args()
    try:
        result = export(args)
    except (OSError, ValueError, KeyError, TypeError) as error:
        parser.exit(1, f"summarize-mpq-assets: {error}\n")
    print(json.dumps({"catalog": result["source_catalog"], "verification": result["extraction_verification"]}))


if __name__ == "__main__":
    main()
