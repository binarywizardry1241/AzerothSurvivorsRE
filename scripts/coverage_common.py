#!/usr/bin/env python3
"""Shared, non-compiling helpers for selected-target reconstruction coverage.

Installed inputs use machine-local configuration and portable record identifiers.
Tool executables, caches and rebuilt applications are excluded from discovery.
"""

import hashlib
import json
import os
from pathlib import Path
import re
import struct

from artifact_history import archived_artifact, has_archived_artifact

ROOT = Path(__file__).resolve().parent.parent
REGISTRY = ROOT / "docs/analysis/coverage/targets.json"
REFERENCE_CONFIG = ROOT / ".codex/reference-game.json"
REFERENCE_PREFIX = "installed-game/"
VERSION_RE = re.compile(r"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$")
EXE_RE = re.compile(r"^AzerothSurvivors(?:[-_]v?(\d+\.\d+\.\d+))?\.exe$", re.I)
EXCLUDED = {".git", ".tools", ".cache", "node_modules", "runtime", "target", ".venv"}


def finding_register(root=ROOT):
    """Read permanent source/verification ownership without opening the EXE.

    One issue may have source work and verification work under the same ID, with
    reciprocal links. A move never frees a number for reuse.
    """
    records = {}
    for kind, name in (("source", "CURRENT-STATE.md"), ("verification", "verification-needed.md")):
        path = root / 'docs' / name
        text = path.read_text()
        seen = set()
        for match in re.finditer(r'(?m)^\| #(-?\d+) \|.*$', text):
            number = int(match[1])
            row = match[0]
            if number <= 0 or number in seen:
                raise ValueError(f'{name}: invalid or duplicate permanent finding #{number}')
            if f'id="gap-{number}"' not in row:
                raise ValueError(f'{name}: finding #{number} has no stable anchor')
            seen.add(number)
            records.setdefault(number, {})[kind] = row
    for number, owners in records.items():
        if len(owners) == 2 and (f'verification-needed.md#gap-{number}' not in owners['source'] or
                                 f'CURRENT-STATE.md#gap-{number}' not in owners['verification']):
            raise ValueError(f'Finding #{number} appears in both registers without reciprocal ownership links')
    return records


def finding_reference(number, root=ROOT, *, verification=False):
    """Return a finding's live document anchor, preferring actionable source."""
    owners = finding_register(root).get(number)
    if owners is None:
        raise ValueError(f'Unknown permanent finding #{number}')
    kind = 'verification' if verification and 'verification' in owners else (
        'source' if 'source' in owners else 'verification')
    name = 'CURRENT-STATE.md' if kind == 'source' else 'verification-needed.md'
    return f'docs/{name}#gap-{number}'


def project_path(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError(f"Path leaves project: {value}")
    from script_sources import current_path
    return current_path(path)


def reference_config():
    """Read machine-local input locations; these are never output directories."""
    config = load_json(REFERENCE_CONFIG)
    result = {}
    for key in ("exe", "data_dir"):
        path = Path(config[key]).expanduser()
        if not path.is_absolute():
            raise ValueError(f"reference-game.json {key} must be absolute")
        result[key] = path.resolve()
    return result


def artifact_path(value):
    """Resolve a read-only input, allowing only the configured installed game."""
    value = str(value)
    if value.startswith(REFERENCE_PREFIX):
        config = reference_config()
        name = value[len(REFERENCE_PREFIX):]
        if name == "AzerothSurvivors.exe":
            return config["exe"]
        if name == "Data" or name.startswith("Data/"):
            path = (config["data_dir"] / name[5:]).resolve() if name != "Data" else config["data_dir"]
            if path.is_relative_to(config["data_dir"]):
                return path
        raise ValueError(f"Invalid installed-game input: {value}")
    path = (ROOT / value).resolve()
    if path.is_relative_to(ROOT):
        from script_sources import current_path
        return current_path(path)
    config = reference_config()
    if path == config["exe"] or path.is_relative_to(config["data_dir"]):
        return path
    raise ValueError(f"Input is outside the project and configured game: {value}")


def artifact_reference(value):
    """Portable record identifier; never persist machine-specific input paths."""
    path = artifact_path(value)
    if path.is_relative_to(ROOT):
        return path.relative_to(ROOT).as_posix()
    config = reference_config()
    if path == config["exe"]:
        return REFERENCE_PREFIX + "AzerothSurvivors.exe"
    relative = path.relative_to(config["data_dir"])
    return REFERENCE_PREFIX + "Data" + ("/" + relative.as_posix() if relative.parts else "")


def target_bytes(target):
    data = artifact_path(target["path"]).read_bytes()
    if len(data) != target["size_bytes"] or hashlib.sha256(data).hexdigest() != target["sha256"]:
        raise ValueError("Selected EXE changed while reading; restart discovery before using evidence")
    return data


def embedded_marker_versions(data, marker):
    """Find exact three-part numeric suffixes without scanning binary digit runs.

    An unanchored ``\\d+`` regex over a whole binary can retry each prefix of a
    large numeric table. Search the fixed marker first, then read only its three
    immediately preceding ASCII numeric groups. This retains findall's original
    suffix behavior when another dotted numeric group precedes the version.
    """
    versions, offset = [], 0
    while (end := data.find(marker, offset)) != -1:
        cursor, valid = end, True
        for component in range(3):
            stop = cursor
            while cursor and 48 <= data[cursor - 1] <= 57:
                cursor -= 1
            if cursor == stop:
                valid = False
                break
            if component < 2:
                if not cursor or data[cursor - 1] != 46:
                    valid = False
                    break
                cursor -= 1
        if valid:
            versions.append(data[cursor:end])
        offset = end + len(marker)
    return versions


def platform_descriptor_versions(data, *, display=False, updater=False, details=False):
    """Read the PE's self-referencing version/platform Rust string slices.

    Newer targets store the version separately from the dialog text. Require
    mapped, adjacent pointer/length pairs for both version and Windows platform;
    a naked version-looking byte string is never an identity certificate.
    """
    try:
        pe_at = struct.unpack_from("<I", data, 0x3c)[0]
        if data[:2] != b"MZ" or data[pe_at:pe_at + 4] != b"PE\0\0":
            return []
        section_count = struct.unpack_from("<H", data, pe_at + 6)[0]
        optional_size = struct.unpack_from("<H", data, pe_at + 20)[0]
        optional = pe_at + 24
        if struct.unpack_from("<H", data, optional)[0] != 0x20b:
            return []
        image_base = struct.unpack_from("<Q", data, optional + 24)[0]
        sections = optional + optional_size
        mapped = []
        for index in range(section_count):
            at = sections + index * 40
            virtual_size, rva, raw_size, raw_at = struct.unpack_from("<IIII", data, at + 8)
            mapped.append((raw_at, raw_at + min(raw_size, virtual_size), image_base + rva))
        def address(at):
            owners = [base + at - start for start, end, base in mapped if start <= at < end]
            return owners[0] if len(owners) == 1 else None
        def slice_at(at):
            pointer, length = struct.unpack_from("<QQ", data, at)
            if not 5 <= length <= 64:
                return None
            owners = [start + pointer - base for start, end, base in mapped
                      if base <= pointer and pointer + length <= base + end - start]
            if len(owners) != 1:
                return None
            start = owners[0]
            value = data[start:start + length]
            return (start, value) if len(value) == length and re.fullmatch(rb"[0-9]+\.[0-9]+\.[0-9]+", value) else None
        def record(version, start, end, descriptor_at, kind):
            versions.append(dict(version=version.decode("ascii"), file_offset=start,
                                 byte_count=end - start, descriptor_offset=descriptor_at,
                                 kind=kind) if details else version)
        versions, cursor = [], 0
        if updater:
            # The manual update-result message embeds its named version
            # argument as a mapped Rust slice, independently of the display.
            marker = "You\u2019re up to date (v{version}).version".encode("utf-8")
            while (message_at := data.find(marker, cursor)) >= 0:
                cursor = message_at + len(marker)
                end = data.find(b"\0", cursor, cursor + 65)
                if end < 0:
                    continue
                value = slice_at(end + 1)
                if value is not None and value[0] == cursor and cursor + len(value[1]) == end:
                    record(value[1], message_at, end + 17, end + 1, "mapped_manual_update_version_slice")
                    continue
                # A separate updater literal can be referenced by an aligned
                # slice following the zero-padded message.
                descriptor = (cursor + 7) & ~7
                if descriptor == cursor or data[cursor:descriptor] != bytes(descriptor - cursor):
                    continue
                descriptor_va = address(descriptor)
                if descriptor_va is None or address(descriptor + 15) != descriptor_va + 15:
                    continue
                value = slice_at(descriptor)
                if value is None:
                    continue
                start, version = value
                auto_update_key = b"WOW_ROGUE_UPDATE_AUTO"
                key_at = start + len(version)
                if data[key_at:key_at + len(auto_update_key)] == auto_update_key:
                    record(version, message_at, descriptor + 16, descriptor,
                           "mapped_manual_update_remote_version_slice")
            return versions
        if display:
            # The version display is independently stored from the updater.
            # Its Rust slice points back to the version immediately before it
            # (with or without a NUL); the compiled format follows the slice.
            versions = []
            marker = b"\x01v\xc0\x02 (\xc0\x01)\0"
            cursor = 0
            while (format_at := data.find(marker, cursor)) >= 0:
                cursor = format_at + len(marker)
                if format_at < 16:
                    continue
                value = slice_at(format_at - 16)
                if value is None:
                    continue
                start, version = value
                end = start + len(version)
                if end == format_at - 16 or (end == format_at - 17 and data[end] == 0):
                    record(version, start, format_at + len(marker), format_at - 16,
                           "mapped_version_display_slice")
            return versions
        marker = b"windows\0"
        while (platform_at := data.find(marker, cursor)) >= 0:
            cursor = platform_at + len(marker)
            # version\0, version ptr/len, windows\0, windows ptr/len
            version_end = platform_at - 17
            version_at = version_end
            while version_at and data[version_at - 1] in b"0123456789.":
                version_at -= 1
            version = data[version_at:version_end]
            if not re.fullmatch(rb"[0-9]+\.[0-9]+\.[0-9]+", version):
                continue
            version_va, platform_va = address(version_at), address(platform_at)
            if version_va is None or platform_va is None:
                continue
            if data[version_end:version_end + 1] != b"\0":
                continue
            if struct.unpack_from("<QQ", data, platform_at - 16) != (version_va, len(version)):
                continue
            if struct.unpack_from("<QQ", data, platform_at + 8) != (platform_va, 7):
                continue
            record(version, version_at, platform_at + 24, platform_at - 16,
                   "mapped_version_platform_slices")
        return versions
    except (struct.error, IndexError):
        return []


def installed_version(data):
    """Bind updater identity to the legacy dialog or mapped platform slices."""
    checker = embedded_marker_versions(data, b"\x1eupdate: up to date")
    updater = platform_descriptor_versions(data, updater=True)
    dialog = embedded_marker_versions(data, b"A new version is out!")
    platform = platform_descriptor_versions(data)
    display = platform_descriptor_versions(data, display=True)
    primary = checker or updater
    witness = dialog or platform or display
    if (len(primary) != 1 or len(witness) != 1 or primary != witness
            or any(values and (len(values) != 1 or values != primary)
                   for values in (checker, updater, dialog, platform, display))):
        raise ValueError("Embedded game version markers are absent, ambiguous or disagree; inspect with REA")
    version = primary[0].decode("ascii")
    version_key(version)
    return version


def installed_identity():
    path = artifact_path(REFERENCE_PREFIX + "AzerothSurvivors.exe")
    before = path.stat()
    data = path.read_bytes()
    after = path.stat()
    if (before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) != (after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns):
        raise ValueError("Installed EXE changed during discovery; retry after its updater finishes")
    return {"version": installed_version(data), "path": REFERENCE_PREFIX + "AzerothSurvivors.exe",
            "sha256": hashlib.sha256(data).hexdigest(), "size_bytes": len(data)}


def project_bytes(path, *, root=ROOT, expected=None):
    """Read a project input or its exact archived bytes without restoring it."""
    root = Path(root).resolve()
    resolved = (root / path).resolve()
    if not resolved.is_relative_to(root):
        raise ValueError(f"Path leaves project: {path}")
    if not resolved.is_file():
        archived = archived_artifact(resolved, expected, root=root)
        if archived is not None:
            return archived
    from script_sources import current_path
    data = current_path(resolved, root).read_bytes()
    if expected is not None and hashlib.sha256(data).hexdigest() != expected:
        raise ValueError(f"Input differs from its SHA-256: {path}")
    return data


def load_json(path):
    try:
        return json.loads(project_bytes(path))
    except (OSError, json.JSONDecodeError) as error:
        raise ValueError(f"Cannot read project JSON {path}: {error}") from error


def optional_target_json(path, target):
    """A stable optional record from a previous release is pending for this target."""
    if not path.is_file():
        return None
    proof = load_json(path)
    if proof["target"]["version"] != target["version"]:
        return None
    if proof["target"]["sha256"] != target["sha256"]:
        raise ValueError(f"Optional proof target differs from the selected bytes: {path}")
    return proof


def file_sha256(path):
    result = hashlib.sha256()
    try:
        original = (ROOT / path).resolve()
        if not original.is_file():
            archived = archived_artifact(original, root=ROOT)
            if archived is not None:
                return hashlib.sha256(archived).hexdigest()
        resolved = artifact_path(path)
        # A shared native receipt transports a losslessly archived historical
        # SQLite byte stream. Preserve that manifest identity, verifying both
        # the catalog binding and archived bytes rather than hashing the stub.
        if resolved.suffix == ".sqlite":
            from shared_native_inventory import historical_file_sha256
            historical = historical_file_sha256(resolved, root=ROOT)
            if historical is not None:
                return historical
        before = resolved.stat()
        with resolved.open("rb") as stream:
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                result.update(block)
        after = resolved.stat()
        if (before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) != (after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns):
            raise ValueError(f"Input changed while hashing: {path}")
    except OSError as error:
        raise ValueError(f"Cannot hash input {path}: {error}") from error
    return result.hexdigest()


def same_artifact(first, second, expected, root=None):
    """Require the exact commitment when a retained record changes its live name."""
    if not first or not second or not isinstance(expected, str) or not re.fullmatch(r"[0-9a-f]{64}", expected):
        return False
    root = ROOT if root is None else Path(root).resolve()
    paths = [(root / value).resolve() for value in (first, second)]
    if not all(path.is_relative_to(root) for path in paths):
        return False
    if paths[0] != paths[1] and not any(has_archived_artifact(path, root=root) for path in paths):
        return False
    try:
        for path in paths:
            if path.is_file():
                actual = file_sha256(path) if root == ROOT else hashlib.sha256(path.read_bytes()).hexdigest()
                if actual != expected:
                    return False
            elif archived_artifact(path, expected, root=root) is None:
                return False
    except (OSError, ValueError):
        return False
    return True


def same_replay_receipt(current, retained, root=ROOT):
    """Match regenerated receipt metadata to exact archived evidence or producer bytes."""
    if current == retained:
        return True
    if {key: value for key, value in current.items() if key not in ("path", "sha256")} != {
            key: value for key, value in retained.items() if key not in ("path", "sha256")}:
        return False
    path, previous = current["path"], retained["path"]
    expected = retained["sha256"]
    if path == previous and path.startswith("scripts/"):
        from script_sources import recorded_input_matches
        return recorded_input_matches(previous, expected, root)
    return current["sha256"] == expected and same_artifact(path, previous, expected, root)


def version_key(value):
    if not isinstance(value, str) or not VERSION_RE.fullmatch(value):
        raise ValueError(f"Expected stable major.minor.patch version, got {value!r}")
    return tuple(map(int, value.split(".")))


def supplied_executables(registry):
    """Find game filenames only, without following symlinked directories/files."""
    found = {}
    if registry.get("input_mode") == "installed_game":
        identity = installed_identity()
        return [{"path": identity["path"], "version_from_filename": identity["version"]}]
    for root in registry.get("supplied_roots", ["AzerothSurvivors", "."]):
        directory = project_path(root)
        if not directory.is_dir():
            continue
        for parent, directories, files in os.walk(directory, followlinks=False):
            directories[:] = sorted(name for name in directories if name not in EXCLUDED
                                    and not (Path(parent) / name).is_symlink())
            for name in sorted(files):
                match = EXE_RE.fullmatch(name)
                path = Path(parent) / name
                if match and not path.is_symlink():
                    relative = path.relative_to(ROOT).as_posix()
                    found[relative] = {"path": relative, "version_from_filename": match[1]}
    return [found[key] for key in sorted(found)]


def validate_registry(registry):
    if registry.get("schema_version") != 1 or not registry.get("targets"):
        raise ValueError("Target registry is absent, empty or has an unsupported schema")
    identities = set()
    for row in registry["targets"]:
        version_key(row.get("version"))
        artifact_path(row["path"])
        project_path(row["identity_manifest"])
        if not re.fullmatch(r"[0-9a-f]{64}", row.get("sha256", "")) or row.get("size_bytes", 0) <= 0:
            raise ValueError("Invalid target digest/size")
        identity = (row["version"], row["sha256"])
        if identity in identities:
            raise ValueError(f"Duplicate registered target identity: {identity}")
        identities.add(identity)
        for archive in row.get("runtime_data", {}).get("archives", []):
            artifact_path(archive["path"])
            if not re.fullmatch(r"[0-9a-f]{64}", archive.get("sha256", "")) or archive.get("size_bytes", -1) < 0:
                raise ValueError("Invalid resource digest/size")
    return registry


def latest_target(verify=True):
    registry = validate_registry(load_json(REGISTRY))
    newest = max((row["version"] for row in registry["targets"]), key=version_key)
    candidates = [row for row in registry["targets"] if row["version"] == newest]
    selected = registry.get("selected_sha256_by_version", {}).get(newest)
    if len(candidates) > 1 and selected is None:
        raise ValueError(f"Multiple hashes registered for {newest}; explicitly select its successor hash")
    target = next((row for row in candidates if selected is None or row["sha256"] == selected), None)
    if target is None:
        raise ValueError(f"Selected hash for latest version {newest} is not registered")
    if not verify:
        return dict(target)
    known = {(row["version"], row["sha256"]) for row in registry["targets"]}
    known_hashes = {row["sha256"] for row in registry["targets"]}
    for candidate in supplied_executables(registry):
        digest = file_sha256(candidate["path"])
        version = candidate["version_from_filename"]
        if version and (version, digest) not in known:
            qualifier = "newer " if version_key(version) > version_key(newest) else ""
            raise ValueError(f"Unregistered {qualifier}supplied EXE {candidate['path']} ({version}, {digest}); "
                             "register its exact identity before coverage work")
        if version is None and digest not in known_hashes:
            raise ValueError(f"Unregistered unversioned supplied EXE {candidate['path']} ({digest}); "
                             "register it with an explicit verified version")
    path = artifact_path(target["path"])
    if not path.is_file() or path.stat().st_size != target["size_bytes"] or file_sha256(path) != target["sha256"]:
        raise ValueError(f"Latest registered target {newest} is missing or changed; run $execheck; never fall back to an older target")
    manifest_path = project_path(target["identity_manifest"])
    if manifest_path != REGISTRY:
        identity = load_json(manifest_path).get("current_target", {})
        if any(identity.get(key) != target[key] for key in ("version", "path", "sha256", "size_bytes")):
            raise ValueError("Registered target disagrees with its identity manifest")
    return dict(target)


def verify_resources(target):
    archives = target.get("runtime_data", {}).get("archives", [])
    for row in archives:
        path = artifact_path(row["path"])
        if not path.is_file() or path.stat().st_size != row["size_bytes"] or file_sha256(path) != row["sha256"]:
            raise ValueError(f"Selected target resource missing/changed: {row['path']}")
    directory = target.get("runtime_data", {}).get("directory")
    if directory:
        found = {artifact_reference(path) for path in artifact_path(directory).rglob("*")
                 if path.is_file() and path.suffix.lower() == ".mpq"}
        expected = {row["path"] for row in archives}
        if found != expected:
            raise ValueError(f"Resource archive chain changed; unregistered={sorted(found - expected)}, "
                             f"missing={sorted(expected - found)}")
    return len(archives)


def json_text(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"
