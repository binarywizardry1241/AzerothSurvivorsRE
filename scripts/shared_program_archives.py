"""Lossless cold storage for inactive historical Ghidra Programs.

Programs remain independently resumable at their original paths. The small
descriptor and catalog retain exact file commitments; only a verified compressed
archive replaces cold .gpr/.rep files. Restoration never runs Ghidra or an EXE.
"""

from contextlib import contextmanager
import fcntl
import gzip
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import shlex
import stat
import subprocess
import sys
import tarfile
import tempfile
import time
import uuid

from shared_analysis import SharedAnalysis, canonical, file_digest, _fsync_directory

ROOT = Path(__file__).resolve().parents[1]
DESCRIPTOR = "shared-program-archive.json"
MANIFEST = "__program_manifest__.json"
SCHEMA = """CREATE TABLE IF NOT EXISTS program_archive_records (
 archive_id TEXT PRIMARY KEY, project_path TEXT NOT NULL,
 object_sha256 TEXT NOT NULL, manifest TEXT NOT NULL, receipt TEXT NOT NULL,
 state TEXT NOT NULL, updated REAL NOT NULL);
CREATE TABLE IF NOT EXISTS program_archive_policy (
 archive_id TEXT PRIMARY KEY REFERENCES program_archive_records(archive_id),
 retention TEXT NOT NULL CHECK(retention IN ('pinned','automatic-cache')));
CREATE TABLE IF NOT EXISTS program_archive_retirements (
 archive_id TEXT PRIMARY KEY, payload TEXT NOT NULL);
"""


def _project_path(root, value):
    root = Path(root).resolve()
    path = Path(value)
    if not path.is_absolute():
        path = root / path
    path = path.resolve()
    if not path.is_relative_to(root / "runtime") or path == root / "runtime":
        raise ValueError("Program path must remain inside project runtime/")
    return path


def _save(path, value):
    if path.is_symlink():
        raise ValueError("Program archive metadata is redirected")
    path.parent.mkdir(parents=True, exist_ok=True)
    pending = path.with_name("." + path.name + "." + uuid.uuid4().hex + ".pending")
    try:
        with pending.open("x") as stream:
            stream.write(canonical(value) + "\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(pending, path)
        _fsync_directory(path.parent)
    finally:
        pending.unlink(missing_ok=True)


def _no_ghidra_process(root, project=None):
    commands = subprocess.check_output(["ps", "-axo", "command="], text=True)
    for command in commands.splitlines():
        try:
            arguments = shlex.split(command)
        except ValueError:
            arguments = []
        executable = Path(arguments[0]).name if arguments else ""
        # Shells inspecting commands or reporting diagnostics are not JVMs.
        if executable not in {"java", "analyzeHeadless"}:
            continue
        if str(root) in command and "ghidra" in command.lower():
            if project is not None:
                # Only exempt a positively identified different headless
                # project. Unrecognized commands retain conservative rejection.
                try:
                    owner = arguments.index("ghidra.app.util.headless.AnalyzeHeadless")
                    active_project = Path(arguments[owner + 1]).resolve()
                    if active_project.is_relative_to(root / "runtime") and active_project != project:
                        continue
                except (ValueError, IndexError):
                    pass
            raise ValueError("A project Ghidra process is active; leave Programs hot")


@contextmanager
def _program_lease(root, project, check_processes=True, scoped_processes=False, legacy_path=None):
    if check_processes:
        _no_ghidra_process(root, project if scoped_processes else None)
    descriptors, channel_holder = [], None
    try:
        candidates = {(project / ".program-archive.lock", "flock")}
        # Ghidra's FileChannel locks are POSIX byte-range locks. A leftover
        # filename alone is not evidence of a live owner: acquire and hold the
        # actual lock, then preserve its bytes with the rest of the Program.
        if project.exists():
            candidates.update((p, "posix") for p in project.rglob("*")
                              if p.name.endswith((".lock", ".lock~"))
                              and p.name != ".program-archive.lock" and p.is_file())
        parents = [project, *project.parents]
        if legacy_path is not None:
            parents.extend(p.resolve() for p in legacy_path.parents)
        for parent in parents:
            if not parent.is_relative_to(root / "runtime"):
                continue
            for name in ["program.lock", "census.lock"]:
                if (parent / name).exists():
                    candidates.add((parent / name, "flock"))
            active = parent / "active-process.json"
            if active.is_file():
                record = json.loads(active.read_text())
                if record.get("active"):
                    pid = record.get("ownership", {}).get("leaderPid")
                    if not isinstance(pid, int) or pid <= 0:
                        raise ValueError("Program has an unresolvable active owner")
                    try:
                        os.kill(pid, 0)
                    except ProcessLookupError:
                        pass
                    else:
                        raise ValueError("Program still has a live process owner")
        channel_paths = [str(path) for path, style in sorted(candidates) if style == "posix"]
        if channel_paths:
            # POSIX record locks are released when their owning process closes
            # *any* descriptor for the inode. A dedicated holder lets the
            # archiver hash/read the lock-file bytes without releasing its lease.
            code = ("import os,fcntl,stat,sys\n"
                    "fds=[]\n"
                    "for path in sys.argv[1:]:\n"
                    " fd=os.open(path,os.O_RDWR|os.O_NOFOLLOW|os.O_NONBLOCK)\n"
                    " if not stat.S_ISREG(os.fstat(fd).st_mode): raise ValueError('Nonregular Ghidra lock')\n"
                    " fcntl.lockf(fd,fcntl.LOCK_EX|fcntl.LOCK_NB);fds.append(fd)\n"
                    "print('locked',flush=True)\n"
                    "sys.stdin.read()\n")
            channel_holder = subprocess.Popen([sys.executable, "-B", "-c", code, *channel_paths],
                                              cwd=root, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                              stderr=subprocess.PIPE, text=True)
            if channel_holder.stdout.readline().strip() != "locked":
                channel_holder.wait(timeout=5)
                raise ValueError("A Ghidra FileChannel lock is held or unavailable; leave this Program hot")
        for path, style in sorted(candidates):
            if style == "posix":
                continue
            path.parent.mkdir(parents=True, exist_ok=True)
            descriptor = os.open(path, os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
            descriptors.append(descriptor)
            try:
                fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError as error:
                raise ValueError("A runner owns this Program; leave it hot") from error
        yield
    finally:
        for descriptor in descriptors:
            os.close(descriptor)
        if channel_holder is not None:
            channel_holder.stdin.close()
            channel_holder.wait(timeout=5)
            channel_holder.stdout.close()
            channel_holder.stderr.close()


def _inventory(project):
    files, directories = [], []
    for parent, names, leaves in os.walk(project, followlinks=False):
        names.sort()
        for name in list(names):
            path = Path(parent) / name
            if path.is_symlink():
                raise ValueError("Ghidra Program archive must not traverse directory symlinks")
            if name.startswith(".restore-"):
                raise ValueError("An unfinished restore must be resolved before archiving")
            s = path.stat()
            directories.append({"path": path.relative_to(project).as_posix(), "mode": stat.S_IMODE(s.st_mode),
                                "mtime_ns": s.st_mtime_ns})
        for name in sorted(leaves):
            if Path(parent) == project and name in [DESCRIPTOR, ".program-archive.lock"]:
                continue
            path = Path(parent) / name
            if path.is_symlink() or not path.is_file():
                raise ValueError("Ghidra Program archives accept only regular files")
            s = path.stat()
            files.append({"path": path.relative_to(project).as_posix(), "sha256": file_digest(path),
                          "bytes": s.st_size, "mode": stat.S_IMODE(s.st_mode), "mtime_ns": s.st_mtime_ns})
    if not any(row["path"].endswith(".gpr") for row in files) or not any(".rep/" in row["path"] for row in files):
        raise ValueError("Expected a saved .gpr/.rep Program")
    return {"format": "rea-program-archive-v1", "files": files, "directories": directories}


def _member_name(value):
    path = PurePosixPath(value)
    if not value or path.is_absolute() or ".." in path.parts or "\\" in value or str(path) != value:
        raise ValueError("Unsafe Program archive member")
    return path


def _read_archive(path, expected_manifest=None, stage=None):
    """Verify each stream member, optionally restoring into a fresh staging tree."""
    manifest, expected, seen = None, {}, set()
    with tarfile.open(path, mode="r|gz") as archive:
        for member in archive:
            _member_name(member.name)
            if not member.isfile() or member.name in seen:
                raise ValueError("Program archive contains a duplicate or unsupported member")
            seen.add(member.name)
            stream = archive.extractfile(member)
            if member.name == MANIFEST:
                if manifest is not None or len(seen) != 1 or member.size > 64 * 1024 * 1024:
                    raise ValueError("Invalid Program archive manifest")
                manifest = json.load(stream)
                if manifest.get("format") != "rea-program-archive-v1":
                    raise ValueError("Unknown Program archive format")
                if expected_manifest is not None and canonical(manifest) != canonical(expected_manifest):
                    raise ValueError("Program archive manifest differs")
                for row in manifest["files"]:
                    _member_name(row["path"])
                    if row["path"] in {MANIFEST, DESCRIPTOR, ".program-archive.lock"} or row["path"] in expected:
                        raise ValueError("Duplicate Program manifest path")
                    expected[row["path"]] = row
                for row in manifest["directories"]:
                    _member_name(row["path"])
                continue
            if manifest is None or member.name not in expected:
                raise ValueError("Program archive has an uncommitted member")
            row = expected[member.name]
            if member.size != row["bytes"]:
                raise ValueError("Program archive member size differs")
            digest = hashlib.sha256()
            output = None
            if stage is not None:
                output_path = stage / member.name
                output_path.parent.mkdir(parents=True, exist_ok=True)
                output = output_path.open("xb")
            count = 0
            try:
                for block in iter(lambda: stream.read(1024 * 1024), b""):
                    digest.update(block)
                    count += len(block)
                    if output:
                        output.write(block)
                if output:
                    output.flush()
                    os.fsync(output.fileno())
            finally:
                if output:
                    output.close()
            if count != row["bytes"] or digest.hexdigest() != row["sha256"]:
                raise ValueError("Program archive member hash differs")
    if manifest is None or seen != set(expected) | {MANIFEST}:
        raise ValueError("Program archive is incomplete")
    return manifest


def _catalog(store):
    with store.connect() as connection:
        connection.executescript(SCHEMA)


def _record(store, descriptor, manifest, project, state):
    with store.connect() as connection:
        connection.execute("INSERT INTO program_archive_records VALUES(?,?,?,?,?,?,?) ON CONFLICT(archive_id) "
                           "DO UPDATE SET project_path=excluded.project_path,state=excluded.state,updated=excluded.updated",
                           (descriptor["archive_id"], project.relative_to(store.root).as_posix(),
                            descriptor["receipt"]["sha256"], canonical(manifest), canonical(descriptor["receipt"]),
                            state, time.time()))


def _retention(store, archive_id, requested=None):
    with store.connect() as connection:
        row = connection.execute("SELECT retention FROM program_archive_policy WHERE archive_id=?", (archive_id,)).fetchone()
        exists = connection.execute("SELECT 1 FROM program_archive_records WHERE archive_id=?", (archive_id,)).fetchone()
    # Archives created before the policy table are historical pins, never caches.
    current = row[0] if row else "pinned" if exists else requested
    return "pinned" if current == "pinned" or requested == "pinned" else "automatic-cache"


def _set_retention(store, archive_id, retention):
    with store.connect() as connection:
        connection.execute("INSERT INTO program_archive_policy VALUES(?,?) ON CONFLICT(archive_id) DO UPDATE SET "
                           "retention=CASE WHEN retention='pinned' OR excluded.retention='pinned' THEN 'pinned' ELSE 'automatic-cache' END",
                           (archive_id, retention))


def _owned_observation(row, archive_id, manifest, validation=False):
    try:
        provenance = json.loads(row[2])
    except (ValueError, TypeError):
        return False
    bound = (row[3] == "ghidra-program-archive" and provenance.get("manifest_sha256") == archive_id
             and provenance.get("project") == manifest["original_project_path"])
    return bound and (validation or (provenance.get("retention") == "automatic-cache"
                                    and provenance.get("program_archive_id") == archive_id))


def _external_consumers(connection, store, record, manifest, validation=False, require_owned=True,
                        own_descriptor=None):
    archive_id, _, sha256, _, receipt_json, _, _ = record
    receipt = json.loads(receipt_json)
    path = store.object_path(sha256)
    reasons = []
    if path.exists() and path.stat().st_nlink != 1:
        reasons.append("another hard-link owner")
    observations = connection.execute("SELECT * FROM analysis_observations WHERE sha256=? OR instr(provenance,?)>0",
                                      (sha256, sha256)).fetchall()
    owned = [r for r in observations if r[0] == sha256 and _owned_observation(r, archive_id, manifest, validation)]
    if any(r not in owned for r in observations):
        reasons.append("external observation/provenance")
    if require_owned and not owned:
        reasons.append("missing owned automatic archive provenance")
    # These native tables contain numeric decode rows/chunk identities, never
    # CAS ownership. The native snapshot receipt itself is checked below.
    non_consumers = {"analysis_objects", "analysis_observations", "program_archive_policy",
                     "native_chunks", "native_membership", "native_ranges", "native_decoders"}
    for (table,) in connection.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'"):
        if table in non_consumers:
            continue
        quoted = '"' + table.replace('"', '""') + '"'
        columns = connection.execute("PRAGMA table_info(" + quoted + ")").fetchall()
        if any("BLOB" in c[2].upper() for c in columns) and connection.execute("SELECT 1 FROM " + quoted + " LIMIT 1").fetchone():
            reasons.append("unknown binary consumer table " + table)
            continue
        fields = [c[1] for c in columns if "TEXT" in c[2].upper() or c[2] == ""]
        if not fields:
            continue
        conditions = ["instr(CAST(\"" + c.replace('"', '""') + "\" AS TEXT),?)>0" for c in fields]
        where = "(" + " OR ".join(conditions) + ")"
        values = [sha256] * len(fields)
        if table in {"program_archive_records", "program_archive_retirements"}:
            where += " AND archive_id!=?"
            values.append(archive_id)
        if connection.execute("SELECT 1 FROM " + quoted + " WHERE " + where + " LIMIT 1", values).fetchone():
            reasons.append("catalog consumer in " + table)
    # Catch unregistered aliases/descriptors too; never follow directory links
    # into another workspace, build cache, or the immutable object store.
    for parent, directories, leaves in os.walk(store.runtime, followlinks=False):
        directories[:] = [d for d in directories if d not in {"objects", "cargo", "cargo-target", "target", "node_modules"}
                          and not d.startswith("optimized-") and not d.endswith((".rep", ".app"))
                          and not (Path(parent) / d).is_symlink()]
        for name in leaves:
            leaf = Path(parent) / name
            if leaf.is_symlink():
                try:
                    if leaf.resolve() == path:
                        reasons.append("filesystem alias " + leaf.relative_to(store.root).as_posix())
                except (OSError, RuntimeError):
                    reasons.append("unresolved filesystem alias")
            elif name == DESCRIPTOR and leaf != own_descriptor:
                try:
                    document = json.loads(leaf.read_text())
                    if document.get("receipt", {}).get("sha256") == sha256:
                        reasons.append("Program descriptor " + leaf.relative_to(store.root).as_posix())
                except (OSError, ValueError, TypeError):
                    reasons.append("unresolved Program descriptor")
    return sorted(set(reasons)), owned


def _restore_retirement_metadata(connection, payload):
    for table, rows in [("analysis_objects", [payload["object"]]),
                        ("program_archive_records", [payload["record"]]),
                        ("program_archive_policy", [payload["policy"]]),
                        ("analysis_observations", payload["observations"])]:
        for row in rows:
            connection.execute("INSERT OR IGNORE INTO " + table + " VALUES(" + ",".join("?" for _ in row) + ")", row)


def _mark_historical_retired(project, retired):
    descriptor = project / DESCRIPTOR
    if json.loads(descriptor.read_text()) != retired:
        _save(descriptor, retired)
    for name in ("ready.json", "bootstrap.json"):
        path = project.parent / name
        if path.is_file() and not path.is_symlink():
            try:
                marker = json.loads(path.read_text())
            except ValueError:
                continue
            if isinstance(marker, dict) and marker.get("target_sha256") == retired["target_sha256"]:
                path.unlink()
                _fsync_directory(path.parent)


def _finish_retirements(store, project):
    with store.lock(), store.connect() as connection:
        pending = connection.execute("SELECT archive_id,payload FROM program_archive_retirements").fetchall()
        for archive_id, serialized in pending:
            payload = json.loads(serialized)
            if (store.root / payload["record"][1]).resolve() != project:
                continue
            descriptor = project / DESCRIPTOR
            historical = payload.get("historical")
            if historical is None:
                replacement = connection.execute("SELECT receipt FROM program_archive_records WHERE archive_id=?",
                                                 (payload["replacement"],)).fetchone()
                if replacement is None:
                    raise ValueError("Retirement replacement archive is unavailable; preserve old cache")
                store.verify_receipt(json.loads(replacement[0]))
            record = payload["record"]
            manifest = json.loads(record[3])
            reasons, _ = _external_consumers(connection, store, record, manifest,
                                              validation=payload["validation"], require_owned=False,
                                              own_descriptor=descriptor if historical else None)
            republished = connection.execute("SELECT 1 FROM analysis_objects WHERE sha256=?", (record[2],)).fetchone()
            old = store.object_path(record[2])
            if reasons or republished:
                store.verify_receipt(json.loads(record[4]))
                _restore_retirement_metadata(connection, payload)
                if historical:
                    _save(descriptor, historical["original"])
            else:
                if historical:
                    _mark_historical_retired(project, historical["retired"])
                if old.exists():
                    store.verify_receipt(json.loads(record[4]))
                    old.unlink()
                    _fsync_directory(old.parent)
            connection.execute("DELETE FROM program_archive_retirements WHERE archive_id=?", (archive_id,))


def _retire_record(store, record, replacement, validation=False, historical=None):
    archive_id, _, sha256, manifest_json, receipt_json, _, _ = record
    manifest, receipt = json.loads(manifest_json), json.loads(receipt_json)
    with store.lock():
        with store.connect() as connection:
            connection.execute("BEGIN IMMEDIATE")
            policy = connection.execute("SELECT retention FROM program_archive_policy WHERE archive_id=?", (archive_id,)).fetchone()
            if not validation and (policy is None or policy[0] != "automatic-cache"):
                return {"archive_id": archive_id, "retired": False, "reasons": ["historical/manual pin"]}
            descriptor = (store.root / record[1]).resolve() / DESCRIPTOR
            reasons, owned = _external_consumers(connection, store, record, manifest, validation,
                                                 own_descriptor=descriptor if historical else None)
            if historical and (store.root / ".git").exists():
                references = subprocess.run(["git", "grep", "-l", "-F", "-e", sha256, "--"],
                                            cwd=store.root, capture_output=True, text=True)
                if references.returncode not in (0, 1):
                    raise ValueError("Could not check tracked Program archive references")
                reasons.extend("tracked archive reference " + path for path in references.stdout.splitlines())
            object_row = connection.execute("SELECT * FROM analysis_objects WHERE sha256=?", (sha256,)).fetchone()
            if object_row is None or object_row[3] != "ghidra-program-archive":
                reasons.append("unknown canonical object owner")
            if reasons:
                return {"archive_id": archive_id, "retired": False, "reasons": sorted(set(reasons))}
            path = store.verify_receipt(receipt)
            allocated = path.stat().st_blocks * 512
            payload = {"record": list(record), "object": list(object_row),
                       "policy": [archive_id, policy[0] if policy else "pinned"], "observations": owned,
                       "replacement": replacement, "validation": validation, "historical": historical}
            connection.execute("INSERT OR REPLACE INTO program_archive_retirements VALUES(?,?)",
                               (archive_id, canonical(payload)))
        # The durable retirement journal predates metadata removal. A crash can
        # leave an unindexed old blob, but never loses its recovery commitment.
        with store.connect() as connection:
            connection.execute("BEGIN IMMEDIATE")
            for row in owned:
                connection.execute("DELETE FROM analysis_observations WHERE sha256=? AND provenance_sha256=? AND kind=?",
                                   (row[0], row[1], row[3]))
            connection.execute("DELETE FROM program_archive_policy WHERE archive_id=?", (archive_id,))
            connection.execute("DELETE FROM program_archive_records WHERE archive_id=?", (archive_id,))
            connection.execute("DELETE FROM analysis_objects WHERE sha256=?", (sha256,))
        if historical:
            _mark_historical_retired(descriptor.parent, historical["retired"])
        path.unlink()
        _fsync_directory(path.parent)
        with store.connect() as connection:
            connection.execute("DELETE FROM program_archive_retirements WHERE archive_id=?", (archive_id,))
        return {"archive_id": archive_id, "retired": True, "reclaimed_allocated_bytes": allocated}


def _retire_expanded_program(project, target_sha256):
    descriptor = project / DESCRIPTOR
    if descriptor.exists():
        retirement = json.loads(descriptor.read_text())
        if retirement.get("state") != "retiring-expanded" or retirement.get("target_sha256") != target_sha256:
            raise ValueError("Expanded Program has a different retirement commitment")
    else:
        workspace = json.loads((project.parent / "workspace.json").read_text())
        if workspace.get("identity", {}).get("target_sha256") != target_sha256:
            raise ValueError("Expanded Program workspace does not bind the historical EXE")
        retirement = {"format": "rea-program-archive-v1", "state": "retiring-expanded",
                      "target_sha256": target_sha256, "manifest": _inventory(project)}
        _save(descriptor, retirement)
    allocated = _remove_verified_originals(project, retirement["manifest"])
    _mark_historical_retired(project, {"format": retirement["format"], "state": "retired",
                                       "target_sha256": target_sha256})
    return {"retired": True, "reclaimed_allocated_bytes": allocated}


def retire_historical_program(project_root, target_sha256, root=None, check_processes=True):
    """Discard one inactive older Program while preserving its evidence and logical path."""
    root = Path(root or ROOT).resolve()
    project = _project_path(root, project_root)
    if target_sha256 not in project.relative_to(root / "runtime").parts:
        raise ValueError("Historical Program path does not bind the selected target")
    store = SharedAnalysis(root)
    _catalog(store)
    descriptor = project / DESCRIPTOR
    if descriptor.is_symlink():
        raise ValueError("Program archive descriptor is redirected")
    original = json.loads(descriptor.read_text()) if descriptor.exists() else None
    if original is None or original.get("state") == "retiring-expanded":
        with _program_lease(root, project, check_processes):
            return _retire_expanded_program(project, target_sha256)
    with store.connect() as connection:
        row = connection.execute("SELECT * FROM program_archive_records WHERE archive_id=?",
                                 (original.get("archive_id"),)).fetchone()
    legacy_path = root / row[1] if row else None
    if legacy_path is not None and (legacy_path.resolve() != project or target_sha256 not in legacy_path.parts):
        raise ValueError("Historical Program path differs from the archive catalog")
    with _program_lease(root, project, check_processes, legacy_path=legacy_path):
        _finish_retirements(store, project)
        original = json.loads(descriptor.read_text())
        if original["state"] == "retired":
            if original["target_sha256"] != target_sha256:
                raise ValueError("Retired Program descriptor binds a different target")
            _mark_historical_retired(project, original)
            return {"retired": False, "already_retired": True}
        if original["state"] != "cold" or set(p.name for p in project.iterdir()) - {DESCRIPTOR, ".program-archive.lock"}:
            raise ValueError("Historical Program still has expanded or in-flight state")
        with store.connect() as connection:
            row = connection.execute("SELECT * FROM program_archive_records WHERE archive_id=?",
                                     (original["archive_id"],)).fetchone()
        if (row is None or root / row[1] != legacy_path or legacy_path.resolve() != project
                or row[5] != "cold" or json.loads(row[4]) != original["receipt"]):
            raise ValueError("Historical Program descriptor disagrees with the archive catalog")
        retired = {"format": original["format"], "state": "retired", "archive_id": original["archive_id"],
                   "target_sha256": target_sha256}
        return _retire_record(store, row, None, validation=True,
                              historical={"original": original, "retired": retired})


def _retire_previous_caches(store, project, current):
    _finish_retirements(store, project)
    with store.connect() as connection:
        records = connection.execute("SELECT r.* FROM program_archive_records r JOIN program_archive_policy p USING(archive_id) "
                                     "WHERE p.retention='automatic-cache' AND r.project_path=? AND r.archive_id!=? "
                                     "AND r.state IN ('cold','hot')", (project.relative_to(store.root).as_posix(), current)).fetchall()
    return [_retire_record(store, record, current) for record in records]


def _remove_verified_originals(project, manifest):
    expected = {row["path"]: row for row in manifest["files"]}
    actual = []
    for parent, directories, leaves in os.walk(project, followlinks=False):
        if any((Path(parent) / d).is_symlink() for d in directories):
            raise ValueError("Program gained a redirected directory")
        for name in leaves:
            if Path(parent) == project and name in {DESCRIPTOR, ".program-archive.lock"}:
                continue
            path = Path(parent) / name
            relative = path.relative_to(project).as_posix()
            row = expected.get(relative)
            if row is None or path.is_symlink() or path.stat().st_size != row["bytes"] or file_digest(path) != row["sha256"]:
                raise ValueError("Program changed after archive verification; preserve originals")
            actual.append(path)
    allocated = sum(p.stat().st_blocks * 512 for p in actual if p.stat().st_nlink == 1)
    for path in actual:
        path.unlink()
    for row in sorted(manifest["directories"], key=lambda r: len(PurePosixPath(r["path"]).parts), reverse=True):
        directory = project / row["path"]
        if directory.exists():
            directory.rmdir()
    _fsync_directory(project)
    return allocated


def _clean_program_scratch(project, *, temporary_only=False):
    """Remove disposable headless scratch for a Program whose lease is held."""
    runtime = project.parent / "runtime"
    if not runtime.is_dir() or runtime.is_symlink():
        return 0
    directories = [runtime / "tmp"]
    if not temporary_only:
        directories.extend(runtime.glob("config/*-ghidra/ghidra_*_PUBLIC/osgi"))
    templates = {
        "_code_browser.tcd": "7f3b72bbcccef22e476da60f88101885b1ec625fae79a58cbb78a9a81dacbd0d",
        "_emulator.tcd": "bdc4262723f9b714ef8e2038f39c09b1aa567fb57acb9edf3d597b4bd892385a",
        "_version _tracking.tcd": "42a672303407e4d56e3042c396cc9d37a72965c653aa6aec62160cadcd98e1c0",
        "_debugger.tcd": "efa89df0d486fe15de6c1abdbfb3a1fbcde70596c7f6c96fd9fd547cd1477ed4",
    }
    files = [] if temporary_only else [p for p in runtime.glob("config/*-ghidra/ghidra_*_PUBLIC/tools/*.tcd")
             if p.name in templates and not p.is_symlink() and p.is_file() and file_digest(p) == templates[p.name]]
    if not temporary_only:
        for output in project.parent.glob("attempts/*/bridge-stdout.log"):
            if output.is_symlink() or output.resolve() != output:
                continue
            stdout = output.read_bytes()
            if b"REPORT: Save succeeded for processed file:" not in stdout or b"ERROR" in stdout:
                continue
            logs = [p for p in output.parent.glob("*.log") if not p.is_symlink() and p.is_file()]
            if not any(b"ERROR" in p.read_bytes() for p in logs):
                files.extend(logs)
    removed = 0
    for path in directories + files:
        if path.is_symlink() or path.resolve() != path or not path.exists():
            continue
        if path.is_dir():
            removed += sum(p.lstat().st_blocks * 512 for p in path.rglob("*")
                           if p.is_file() and not p.is_symlink() and p.stat().st_nlink == 1)
            shutil.rmtree(path)
        elif path.is_file():
            if path.stat().st_nlink == 1:
                removed += path.stat().st_blocks * 512
            path.unlink()
    if temporary_only:
        return removed
    # Ghidra's empty file-cache layout contains only a maintenance timestamp.
    # Keep any populated cache and all configuration files.
    for cache in runtime.glob("cache/*-ghidra/fscache2"):
        if cache.resolve() != cache or not cache.is_dir():
            continue
        marker = cache / ".lastmaint"
        new = cache / "new"
        children = set(cache.iterdir())
        if new in children and not new.is_symlink() and new.is_dir() and not any(new.iterdir()):
            children.remove(new)
        if children == {marker} and not marker.is_symlink() and marker.is_file():
            attrs = marker.stat()
            removed += attrs.st_blocks * 512 if attrs.st_nlink == 1 else 0
            marker.unlink()
    for parent, _, _ in os.walk(runtime, topdown=False):
        directory = Path(parent)
        if not any(directory.iterdir()):
            directory.rmdir()
    return removed


def clean_archived_program_scratch(project_root, root=None, *, temporary_only=False):
    root = Path(root or ROOT).resolve()
    project = _project_path(root, project_root)
    with _program_lease(root, project, scoped_processes=True):
        if temporary_only:
            return _clean_program_scratch(project, temporary_only=True)
        descriptor = project / DESCRIPTOR
        if descriptor.is_symlink() or not descriptor.is_file():
            return 0
        if json.loads(descriptor.read_text()).get("state") not in {"cold", "retired"}:
            return 0
        return _clean_program_scratch(project)


def archive_program(project_root, root=None, check_processes=True, automatic_cache=False):
    root = Path(root or ROOT).resolve()
    project = _project_path(root, project_root)
    store = SharedAnalysis(root)
    _catalog(store)
    with _program_lease(root, project, check_processes, scoped_processes=automatic_cache):
        _finish_retirements(store, project)
        descriptor_path = project / DESCRIPTOR
        if descriptor_path.is_file():
            previous = json.loads(descriptor_path.read_text())
            if previous.get("state") in {"retired", "retiring-expanded"}:
                raise ValueError("This historical Program was retired or is being retired")
            if previous.get("state") == "restoring":
                raise ValueError("Complete the interrupted restore before archiving again")
            if previous.get("state") == "cold":
                archive = store.verify_receipt(previous["receipt"])
                manifest = _read_archive(archive)
                if hashlib.sha256(canonical(manifest).encode()).hexdigest() != previous["manifest_sha256"]:
                    raise ValueError("Retained Program archive manifest differs")
                reclaimed = _remove_verified_originals(project, manifest)
                _record(store, previous, manifest, project, "cold")
                retention = _retention(store, previous["archive_id"], "automatic-cache" if automatic_cache else "pinned")
                _set_retention(store, previous["archive_id"], retention)
                previous["retention"] = retention
                _save(descriptor_path, previous)
                return {"project": str(project), "state": "cold", "already_archived": True,
                        "archive_bytes": previous["receipt"]["bytes"],
                        "reclaimed_allocated_bytes_estimate": reclaimed + (_clean_program_scratch(project) if automatic_cache else 0),
                        "cache_retirement": _retire_previous_caches(store, project, previous["archive_id"])}
        manifest = _inventory(project)
        manifest["original_project_path"] = project.relative_to(root).as_posix()
        manifest_bytes = canonical(manifest).encode()
        manifest_sha = hashlib.sha256(manifest_bytes).hexdigest()
        retention = _retention(store, manifest_sha, "automatic-cache" if automatic_cache else "pinned")
        needed = sum(r["bytes"] for r in manifest["files"]) + len(manifest["files"]) * 2048 + 64 * 1024 * 1024
        if shutil.disk_usage(project).free < needed:
            raise ValueError("Insufficient free space for a verified archive before removing the original Program")
        staging = store.store / "staging"
        staging.mkdir(exist_ok=True)
        descriptor, pending_name = tempfile.mkstemp(prefix="program-", suffix=".tar.gz.pending", dir=staging)
        pending = Path(pending_name)
        try:
            with os.fdopen(descriptor, "wb") as raw:
                with gzip.GzipFile(filename="", fileobj=raw, mode="wb", compresslevel=1, mtime=0) as compressed:
                    with tarfile.open(fileobj=compressed, mode="w|") as archive:
                        header = tarfile.TarInfo(MANIFEST)
                        header.size = len(manifest_bytes)
                        header.mode = 0o444
                        archive.addfile(header, io.BytesIO(manifest_bytes))
                        for row in manifest["files"]:
                            path = project / row["path"]
                            if path.stat().st_size != row["bytes"] or file_digest(path) != row["sha256"]:
                                raise ValueError("Program changed during archival")
                            info = tarfile.TarInfo(row["path"])
                            info.size = row["bytes"]
                            info.mode = row["mode"]
                            with path.open("rb") as stream:
                                archive.addfile(info, stream)
                raw.flush()
                os.fsync(raw.fileno())
            _read_archive(pending, manifest)
            receipt = store.put_file(pending, kind="ghidra-program-archive",
                                     provenance={"project": manifest["original_project_path"],
                                                 "manifest_sha256": manifest_sha,
                                                 "program_archive_id": manifest_sha, "retention": retention,
                                                 "applicability": "original Program bytes only"})
        finally:
            pending.unlink(missing_ok=True)
        descriptor = {"format": "rea-program-archive-v1", "archive_id": manifest_sha,
                      "manifest_sha256": manifest_sha, "receipt": receipt, "state": "cold", "retention": retention}
        _record(store, descriptor, manifest, project, "verified")
        _set_retention(store, manifest_sha, retention)
        _save(descriptor_path, descriptor)  # Restore commitment exists before any removal.
        original_bytes = sum(r["bytes"] for r in manifest["files"])
        original_allocated = _remove_verified_originals(project, manifest)
        _record(store, descriptor, manifest, project, "cold")
        retirement = _retire_previous_caches(store, project, manifest_sha)
        return {"project": str(project), "state": "cold", "original_bytes": original_bytes,
                "original_allocated_bytes": original_allocated, "archive_bytes": receipt["bytes"],
                "reclaimed_allocated_bytes_estimate": original_allocated - store.verify_receipt(receipt).stat().st_blocks * 512
                    + (_clean_program_scratch(project) if automatic_cache else 0),
                "files": len(manifest["files"]), "archive_id": manifest_sha,
                "retention": retention, "cache_retirement": retirement}


def ensure_program_available(project_root, root=None, check_processes=True):
    root = Path(root or ROOT).resolve()
    project = _project_path(root, project_root)
    descriptor_path = project / DESCRIPTOR
    if not descriptor_path.exists():
        return {"project": str(project), "state": "hot-or-new", "restored": False}
    if descriptor_path.is_symlink():
        raise ValueError("Program archive descriptor is redirected")
    descriptor = json.loads(descriptor_path.read_text())
    if descriptor.get("format") != "rea-program-archive-v1":
        raise ValueError("Unsupported Program archive descriptor")
    if descriptor.get("state") in {"retired", "retiring-expanded"}:
        raise ValueError("This historical Program was retired; use retained exports and query evidence")
    if descriptor.get("state") == "hot":
        if list(project.glob("*.gpr")) and any(project.glob("*.rep")):
            return {"project": str(project), "state": "hot", "restored": False}
    store = SharedAnalysis(root)
    _catalog(store)
    with _program_lease(root, project, check_processes, scoped_processes=True):
        archive = store.verify_receipt(descriptor["receipt"])
        manifest = _read_archive(archive)
        if hashlib.sha256(canonical(manifest).encode()).hexdigest() != descriptor["manifest_sha256"]:
            raise ValueError("Program archive descriptor/manifest commitment differs")
        if shutil.disk_usage(project).free < sum(row["bytes"] for row in manifest["files"]) + 16 * 1024 * 1024:
            raise ValueError("Insufficient free space to restore this Program; archived evidence remains intact")
        # A failed staging extraction never replaces original bytes. A previous
        # stage can be removed only after the committed archive has verified.
        old_stage = descriptor.get("restore_stage")
        if old_stage:
            if not isinstance(old_stage, str) or not old_stage.startswith(".restore-") or "/" in old_stage or "\\" in old_stage:
                raise ValueError("Unexpected restore staging path")
            previous_stage = project / old_stage
            if previous_stage.exists():
                marker = previous_stage / ".restore-owner.json"
                if previous_stage.is_symlink() or not previous_stage.is_dir() or not marker.is_file() or marker.is_symlink() or json.loads(marker.read_text()) != {"archive_id": descriptor["archive_id"]}:
                    raise ValueError("Unowned restore staging directory")
                shutil.rmtree(previous_stage)
        stage = project / (".restore-" + uuid.uuid4().hex)
        descriptor["state"] = "restoring"
        descriptor["restore_stage"] = stage.name
        _save(descriptor_path, descriptor)
        _record(store, descriptor, manifest, project, "restoring")
        stage.mkdir()
        _save(stage / ".restore-owner.json", {"archive_id": descriptor["archive_id"]})
        try:
            _read_archive(archive, manifest, stage)
            for row in manifest["files"]:
                destination = project / row["path"]
                if destination.is_symlink():
                    raise ValueError("Restore destination is redirected")
                if destination.exists() and (not destination.is_file() or file_digest(destination) != row["sha256"]):
                    raise ValueError("Existing Program bytes differ; do not overwrite resumed analysis")
                if not destination.parent.resolve().is_relative_to(project):
                    raise ValueError("Restore destination parent leaves Program")
            for row in manifest["directories"]:
                directory = project / row["path"]
                if directory.is_symlink():
                    raise ValueError("Restore directory is redirected")
                directory.mkdir(parents=True, exist_ok=True)
            for row in manifest["files"]:
                source = stage / row["path"]
                destination = project / row["path"]
                destination.parent.mkdir(parents=True, exist_ok=True)
                os.replace(source, destination)
                destination.chmod(row["mode"])
                os.utime(destination, ns=(row["mtime_ns"], row["mtime_ns"]))
                _fsync_directory(destination.parent)
            for row in sorted(manifest["directories"], key=lambda r: len(PurePosixPath(r["path"]).parts), reverse=True):
                directory = project / row["path"]
                directory.chmod(row["mode"])
                os.utime(directory, ns=(row["mtime_ns"], row["mtime_ns"]))
            descriptor["state"] = "hot"
            _save(descriptor_path, descriptor)
            _record(store, descriptor, manifest, project, "hot")
        finally:
            shutil.rmtree(stage)
        descriptor.pop("restore_stage", None)
        _save(descriptor_path, descriptor)
        return {"project": str(project), "state": "hot", "restored": True,
                "files": len(manifest["files"]), "restored_bytes": sum(r["bytes"] for r in manifest["files"])}


def list_archives(root=None):
    store = SharedAnalysis(root or ROOT)
    _catalog(store)
    with store.connect() as connection:
        rows = connection.execute("SELECT r.archive_id,r.project_path,r.object_sha256,r.state,COALESCE(p.retention,'pinned') "
                                  "FROM program_archive_records r LEFT JOIN program_archive_policy p USING(archive_id) "
                                  "ORDER BY r.project_path").fetchall()
    return [{"archive_id": a, "project": p, "object_sha256": o, "state": s, "retention": r} for a, p, o, s, r in rows]
