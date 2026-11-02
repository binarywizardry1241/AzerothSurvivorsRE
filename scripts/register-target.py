#!/usr/bin/env python3
"""Inspect/verify the latest supplied target; register only with --register.

--inspect-installed discovers the configured live EXE without changing records.
--register --installed verifies embedded version markers and hashes its Data
chain directly. Nothing copies, modifies or executes installed game files.
A second hash for one version requires --replace-same-version; the prior
identity remains historical. Registration alone is not a coverage refresh.
"""

import argparse
import importlib.util
import struct
import sys

from coverage_common import (ROOT, REGISTRY, EXE_RE, file_sha256, json_text, latest_target,
                             load_json, project_path, validate_registry, verify_resources, version_key,
                             artifact_path, artifact_reference, installed_identity, REFERENCE_PREFIX, target_bytes)


def candidate_record(args):
    if args.installed:
        if args.exe or args.manifest or args.data_dir or args.version:
            raise ValueError("--installed uses only .codex/reference-game.json and embedded version markers")
        row = installed_identity()
        row.update(identity_manifest=REGISTRY.relative_to(ROOT).as_posix(),
                   version_provenance="matching_embedded_updater_and_independent_version_witness",
                   runtime_data={"archives": []})
    elif args.manifest:
        manifest = load_json(args.manifest)
        row = {key: manifest["current_target"][key]
               for key in ("version", "path", "sha256", "size_bytes")}
        row["identity_manifest"] = project_path(args.manifest).relative_to(ROOT).as_posix()
        row["version_provenance"] = "hash_bound_identity_manifest"
        row["runtime_data"] = manifest.get("runtime_data", {"archives": []})
    else:
        if not args.exe or not args.version:
            raise ValueError("Registration requires --manifest or both --exe and --version")
        path = artifact_path(args.exe)
        version_key(args.version)
        row = {"version": args.version, "path": artifact_reference(path),
               "sha256": file_sha256(path), "size_bytes": path.stat().st_size,
               "identity_manifest": REGISTRY.relative_to(ROOT).as_posix(),
               "version_provenance": "user_supplied_not_embedded_version_verified",
               "runtime_data": {"archives": []}}
    path = artifact_path(row["path"])
    filename = EXE_RE.fullmatch(path.name)
    if filename and filename[1] and filename[1] != row["version"]:
        raise ValueError("Versioned EXE filename disagrees with the registered version")
    if path.stat().st_size != row["size_bytes"] or file_sha256(path) != row["sha256"]:
        raise ValueError("Supplied file does not match the identity manifest")
    spec = importlib.util.spec_from_file_location("registration_pe_format", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(target_bytes(row))
    if pe.machine != 0x8664:
        raise ValueError("The supplied game target must be an AMD64 PE32+ image")
    if args.data_dir or args.installed:
        directory = artifact_path(REFERENCE_PREFIX + "Data" if args.installed else args.data_dir)
        archives = [{"path": artifact_reference(path), "size_bytes": path.stat().st_size,
                     "sha256": file_sha256(path)} for path in sorted(directory.rglob("*"))
                    if path.is_file() and path.suffix.lower() == ".mpq"]
        if not archives:
            raise ValueError("No MPQ archives found in --data-dir")
        row["runtime_data"] = {"directory": artifact_reference(directory), "archives": archives}
    verify_resources(row)
    if file_sha256(path) != row["sha256"]:
        raise ValueError("Installed EXE changed during resource verification; restart discovery")
    return row


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--register", action="store_true", help="Explicitly write the supplied target registration")
    parser.add_argument("--check", action="store_true", help="Verify EXE and complete resource chain; read-only")
    parser.add_argument("--installed", action="store_true", help="Register the configured installed EXE and Data directly")
    parser.add_argument("--inspect-installed", action="store_true", help="Discover installed version/hash; read-only, no coverage refresh")
    parser.add_argument("--data-path", action="store_true", help="Print the configured Data directory for launch helpers")
    parser.add_argument("--manifest")
    parser.add_argument("--exe")
    parser.add_argument("--version")
    parser.add_argument("--data-dir")
    parser.add_argument("--replace-same-version", action="store_true",
                        help="Explicitly choose this registered hash as the successor for its version")
    args = parser.parse_args()
    try:
        if args.inspect_installed or args.data_path:
            if args.inspect_installed and args.data_path or any((args.register, args.check, args.installed, args.manifest, args.exe, args.version, args.data_dir, args.replace_same_version)):
                parser.error("Inspection/path modes cannot be combined with registration or check options")
            if args.data_path:
                print(artifact_path(REFERENCE_PREFIX + "Data"))
            else:
                identity = installed_identity()
                registry = load_json(REGISTRY)
                identity["identity_registered"] = any((row["version"], row["sha256"]) == (identity["version"], identity["sha256"]) for row in registry["targets"])
                identity["target_executed"] = False
                print(json_text(identity).rstrip())
            return 0
        if args.register:
            row = candidate_record(args)
            registry = load_json(REGISTRY) if REGISTRY.exists() else {
                "schema_version": 1, "selection": "highest_semantic_version_then_explicit_same_version_successor",
                "supplied_roots": ["AzerothSurvivors", "."], "selected_sha256_by_version": {}, "targets": []}
            if registry.get("input_mode") == "installed_game" and row["path"] != REFERENCE_PREFIX + "AzerothSurvivors.exe":
                raise ValueError("This project reads installed game inputs directly; use --register --installed")
            previous = [item for item in registry["targets"] if item["version"] == row["version"]]
            distinct = any(item["sha256"] != row["sha256"] for item in previous)
            if distinct and not args.replace_same_version:
                raise ValueError("A different hash exists for this version; review identity, then use --replace-same-version")
            matching = next((item for item in previous if item["sha256"] == row["sha256"]), None)
            if matching:
                if matching != row:
                    if not args.installed:
                        raise ValueError("This identity is registered with different metadata; review the registry explicitly")
                    matching.clear()
                    matching.update(row)
            else:
                registry["targets"].append(row)
            registry.setdefault("selected_sha256_by_version", {})[row["version"]] = row["sha256"]
            validate_registry(registry)
            REGISTRY.parent.mkdir(parents=True, exist_ok=True)
            pending = REGISTRY.with_suffix(".json.pending")
            pending.write_text(json_text(registry), encoding="utf-8")
            pending.replace(REGISTRY)
        elif any((args.installed, args.manifest, args.exe, args.version, args.data_dir, args.replace_same_version)):
            parser.error("Registration arguments require explicit --register")
        target = latest_target()
        resource_count = verify_resources(target) if args.check or args.register else None
        print(json_text({"version": target["version"], "sha256": target["sha256"], "path": target["path"],
                         "resource_archives_verified": resource_count, "registered": args.register,
                         "target_executed": False}).rstrip())
    except (ValueError, OSError, KeyError, struct.error, IndexError) as error:
        print(f"Target coverage error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
