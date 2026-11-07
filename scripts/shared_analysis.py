"""Verified immutable payloads and query results shared by all REA workflows.

One catalog records provenance independently of payload storage. Equal bytes can
share an object across targets; a cached query still requires its complete exact
identity. A content match never transfers native semantics to another target.
"""

from contextlib import contextmanager
import fcntl
import functools
import hashlib
import json
import os
from pathlib import Path
import re
import sqlite3
import stat
import subprocess
import sys
import tempfile
import threading
import time
import uuid


HEX = re.compile(r"[0-9a-f]{64}\Z")
_DIGEST_CACHE = {}
COMPRESSED_MAGIC = (b"\x1f\x8b", b"PK\x03\x04", b"\x89PNG\r\n\x1a\n", b"\xff\xd8\xff", b"BZh",
                    b"\xfd7zXZ\x00", b"\x28\xb5\x2f\xfd", b"7z\xbc\xaf\x27\x1c", b"Rar!", b"wOF2")
SCHEMA = """
CREATE TABLE IF NOT EXISTS analysis_objects (
 sha256 TEXT PRIMARY KEY, path TEXT UNIQUE NOT NULL, bytes INTEGER NOT NULL,
 kind TEXT NOT NULL, created REAL NOT NULL);
CREATE TABLE IF NOT EXISTS analysis_aliases (
 path TEXT PRIMARY KEY, sha256 TEXT NOT NULL REFERENCES analysis_objects(sha256),
 provenance TEXT NOT NULL, updated REAL NOT NULL);
CREATE INDEX IF NOT EXISTS analysis_aliases_object ON analysis_aliases(sha256);
CREATE TABLE IF NOT EXISTS analysis_queries (
 identity_sha256 TEXT PRIMARY KEY, identity TEXT NOT NULL,
 sha256 TEXT NOT NULL REFERENCES analysis_objects(sha256), created REAL NOT NULL);
CREATE TABLE IF NOT EXISTS analysis_observations (
 sha256 TEXT NOT NULL REFERENCES analysis_objects(sha256), provenance_sha256 TEXT NOT NULL,
 provenance TEXT NOT NULL, kind TEXT NOT NULL, created REAL NOT NULL,
 PRIMARY KEY(sha256,provenance_sha256,kind));
CREATE TABLE IF NOT EXISTS analysis_migrations (
 path TEXT PRIMARY KEY, sha256 TEXT NOT NULL, bytes INTEGER NOT NULL,
 provenance TEXT NOT NULL, state TEXT NOT NULL, updated REAL NOT NULL);
"""


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False,
                      allow_nan=False)


def file_digest(path):
    """Hash stable regular bytes; fail rather than accepting a concurrent write."""
    path = Path(path)
    before = path.stat()
    if not stat.S_ISREG(before.st_mode):
        raise ValueError(f"Not a regular analysis payload: {path}")
    signature = lambda s: (s.st_dev, s.st_ino, s.st_size, s.st_mtime_ns, s.st_ctime_ns)
    key = signature(before)
    if key in _DIGEST_CACHE:
        return _DIGEST_CACHE[key]
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    after = path.stat()
    if signature(before) != signature(after):
        raise ValueError(f"Analysis payload changed while hashing: {path}")
    value = digest.hexdigest()
    if len(_DIGEST_CACHE) >= 8192:
        _DIGEST_CACHE.clear()
    _DIGEST_CACHE[key] = value
    return value


def _fsync_directory(path):
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def require_primary_checkout(root):
    """Never silently allocate a second live store in a linked worktree.

    Fixture roots without Git registration remain ordinary isolated test data.
    Registered worktrees carry a Git-controlled commondir and reverse gitdir
    pointer; use those records rather than accepting an arbitrary store symlink.
    """
    root = Path(root).resolve()
    marker = root / ".git"
    if not marker.is_file():
        return root
    value = marker.read_text().strip()
    if not value.startswith("gitdir:"):
        raise ValueError("Cannot determine primary checkout for shared REA analysis")
    control = (root / value[len("gitdir:"):].strip()).resolve()
    common_file, reverse = control / "commondir", control / "gitdir"
    if not common_file.is_file() or not reverse.is_file():
        raise ValueError("Shared REA analysis requires the primary checkout; this Git indirection is not a registered worktree")
    common = (control / common_file.read_text().strip()).resolve()
    registered_marker = (control / reverse.read_text().strip()).resolve()
    if registered_marker != marker or not common.is_dir():
        raise ValueError("Linked-worktree registration differs; refuse to create another analysis store")
    primary = common.parent
    if root != primary:
        raise ValueError(f"Run shared REA analysis from the primary checkout {primary}; "
                         "linked worktrees must not create separate runtime/analysis stores")
    return root


class _Connection(sqlite3.Connection):
    def __exit__(self, *arguments):
        try:
            return super().__exit__(*arguments)
        finally:
            self.close()


def _serialized(method):
    @functools.wraps(method)
    def call(self, *arguments, **keywords):
        with self.lock():
            return method(self, *arguments, **keywords)
    return call


class SharedAnalysis:
    def __init__(self, root=None):
        self.root = Path(root or Path(__file__).resolve().parents[1]).resolve()
        require_primary_checkout(self.root)
        self.runtime = self.root / "runtime"
        self.store = self.runtime / "analysis"
        self.objects = self.store / "objects"
        self.database = self.store / "knowledge.sqlite"
        self._lease = threading.local()
        self._directory(self.objects)
        if self.database.is_symlink():
            raise ValueError("Shared analysis catalog must not be redirected")
        with self.connect() as connection:
            connection.executescript(SCHEMA)

    def _directory(self, path):
        path = Path(path)
        if not path.is_relative_to(self.runtime):
            raise ValueError("Shared analysis path escapes runtime/")
        existing = path
        while not existing.exists():
            existing = existing.parent
        if not existing.resolve().is_relative_to(self.root):
            raise ValueError("Shared analysis parent is redirected outside project")
        path.mkdir(parents=True, exist_ok=True)
        if path.resolve() != path:
            raise ValueError("Canonical analysis directories must not be redirected")

    def connect(self):
        """Return a transactional catalog connection; caller owns its lifetime."""
        connection = sqlite3.connect(self.database, timeout=60, factory=_Connection)
        connection.execute("PRAGMA foreign_keys=ON")
        connection.execute("PRAGMA busy_timeout=60000")
        return connection

    @contextmanager
    def lock(self):
        """Serialize catalog/object publication and migration between processes."""
        depth = getattr(self._lease, "depth", 0)
        if depth:
            self._lease.depth = depth + 1
            try:
                yield
            finally:
                self._lease.depth = depth
            return
        path = self.store / "storage.lock"
        descriptor = os.open(path, os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            self._lease.depth = 1
            yield
        finally:
            self._lease.depth = 0
            os.close(descriptor)

    def object_path(self, sha256):
        if not isinstance(sha256, str) or not HEX.fullmatch(sha256):
            raise ValueError("Invalid analysis object digest")
        return self.objects / sha256[:2] / sha256

    def _receipt(self, sha256, size, kind):
        return {"sha256": sha256, "path": self.object_path(sha256).relative_to(self.root).as_posix(),
                "bytes": size, "kind": kind}

    def _remember(self, sha256, size, kind):
        receipt = self._receipt(sha256, size, kind)
        with self.connect() as connection:
            connection.execute("INSERT OR IGNORE INTO analysis_objects VALUES(?,?,?,?,?)",
                               (sha256, receipt["path"], size, kind, time.time()))
            row = connection.execute("SELECT path,bytes FROM analysis_objects WHERE sha256=?",
                                     (sha256,)).fetchone()
            if row != (receipt["path"], size):
                raise ValueError("Catalog object commitment differs")
        return receipt

    def verify_receipt(self, receipt):
        path = self.object_path(receipt["sha256"])
        if receipt.get("path") != path.relative_to(self.root).as_posix():
            raise ValueError("Analysis object path differs from its digest")
        if path.is_symlink() or not path.is_file() or path.stat().st_size != receipt["bytes"]:
            raise ValueError(f"Missing or redirected analysis object: {path}")
        if file_digest(path) != receipt["sha256"]:
            raise ValueError(f"Analysis object bytes differ: {path}")
        return path

    @_serialized
    def put_bytes(self, data, kind="query-result", provenance=None):
        if not isinstance(data, bytes):
            raise TypeError("Analysis payload must be bytes")
        sha256 = hashlib.sha256(data).hexdigest()
        destination = self.object_path(sha256)
        self._directory(destination.parent)
        with self.lock():
            if destination.exists() or destination.is_symlink():
                self.verify_receipt(self._receipt(sha256, len(data), kind))
            else:
                descriptor, name = tempfile.mkstemp(prefix=".object-", dir=destination.parent)
                pending = Path(name)
                try:
                    with os.fdopen(descriptor, "wb") as stream:
                        stream.write(data)
                        stream.flush()
                        os.fsync(stream.fileno())
                    pending.chmod(0o444)
                    os.link(pending, destination)
                    _fsync_directory(destination.parent)
                finally:
                    pending.unlink(missing_ok=True)
            receipt = self._remember(sha256, len(data), kind)
        # Provenance belongs to each logical record, never to the shared bytes.
        self.observe(receipt, provenance if provenance is not None else {"unscoped_publication": True}, kind)
        self._maybe_compress(receipt)
        return receipt

    @_serialized
    def put_file(self, path, kind="evidence", provenance=None):
        """Publish a stable project-local file without copying its payload."""
        path = Path(path).resolve(strict=True)
        if not path.is_relative_to(self.runtime) or not path.is_file():
            raise ValueError("File publication requires a project runtime payload")
        sha256 = file_digest(path)
        receipt = self._receipt(sha256, path.stat().st_size, kind)
        destination = self.object_path(sha256)
        self._directory(destination.parent)
        with self.lock():
            if not destination.exists():
                os.link(path, destination)
                destination.chmod(0o444)
                _fsync_directory(destination.parent)
            self.verify_receipt(receipt)
            self._remember(sha256, receipt["bytes"], kind)
        self.observe(receipt, provenance if provenance is not None else {"unscoped_publication": True}, kind)
        self._maybe_compress(receipt)
        return receipt

    def _maybe_compress(self, receipt):
        if sys.platform == "darwin" and os.environ.get("REA_CAS_FILESYSTEM_COMPRESSION", "1") != "0":
            return self.compress_object(receipt)

    def compression_candidate(self, receipt, minimum_bytes=1024 * 1024):
        path = self.object_path(receipt["sha256"])
        s = path.stat()
        if path.is_symlink() or not stat.S_ISREG(s.st_mode) or s.st_size != receipt["bytes"]:
            raise ValueError("Filesystem compression requires an intact regular CAS object")
        if s.st_size < minimum_bytes:
            return False, "below minimum size"
        if s.st_blocks * 512 < s.st_size * 0.9:
            return False, "already compressed or sparse"
        with path.open("rb") as stream:
            magic = stream.read(16)
        if magic.startswith(COMPRESSED_MAGIC):
            return False, "compressed payload format"
        return True, "eligible"

    def _cleanup_compression_staging(self, directory):
        """Remove only owned copies after the canonical original verifies."""
        for marker in directory.glob("*.json"):
            match = re.fullmatch(r"([0-9a-f]{64})-([0-9a-f]{32})[.]json", marker.name)
            if match is None or marker.is_symlink():
                continue
            value = json.loads(marker.read_text())
            expected = {"format": "rea-cas-filesystem-compression-v1", "sha256": match[1],
                        "bytes": value.get("bytes"), "token": match[2]}
            if value != expected or not isinstance(value["bytes"], int) or value["bytes"] < 0:
                continue
            self.verify_receipt(self._receipt(value["sha256"], value["bytes"], "evidence"))
            pending = marker.with_suffix(".pending")
            if pending.is_symlink():
                raise ValueError("Owned compression staging file is redirected")
            pending.unlink(missing_ok=True)
            marker.unlink()

    def compress_object(self, receipt, minimum_bytes=1024 * 1024, copier=None):
        """Apply transparent filesystem compression without changing bytes/paths.

        Installed Darwin ditto supplies HFS/APFS compression. An injected copier
        exercises integrity/atomic replacement in portable storage fixtures.
        Only one owned staging copy exists under the global store lease, and
        replacement occurs only after exact hash/size verification and a real
        allocated-block reduction. Unsupported filesystems retain the original.
        """
        if minimum_bytes < 1:
            raise ValueError("Compression minimum must be positive")
        if copier is None and (sys.platform != "darwin" or not Path("/usr/bin/ditto").is_file()):
            return {"compressed": False, "reason": "filesystem compression unavailable", "reclaimed_allocated_bytes": 0}
        with self.lock():
            path = self.verify_receipt(receipt)
            staging = self.store / "compression-staging"
            if staging.exists():
                self._directory(staging)
                self._cleanup_compression_staging(staging)
            eligible, reason = self.compression_candidate(receipt, minimum_bytes)
            if not eligible:
                return {"compressed": False, "reason": reason, "reclaimed_allocated_bytes": 0}
            self._directory(staging)
            before = path.stat()
            stem = receipt["sha256"] + "-" + uuid.uuid4().hex
            pending, marker = staging / (stem + ".pending"), staging / (stem + ".json")
            with marker.open("x") as stream:
                stream.write(canonical({"format": "rea-cas-filesystem-compression-v1", "sha256": receipt["sha256"],
                                        "bytes": receipt["bytes"], "token": stem[-32:]}) + "\n")
                stream.flush()
                os.fsync(stream.fileno())
            _fsync_directory(staging)
            try:
                if copier is not None:
                    copier(path, pending)
                else:
                    try:
                        subprocess.run(["/usr/bin/ditto", "--hfsCompression", "--noclone", str(path), str(pending)],
                                       cwd=self.root, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                    except (OSError, subprocess.CalledProcessError):
                        return {"compressed": False, "reason": "filesystem compression unsupported or failed",
                                "reclaimed_allocated_bytes": 0}
                if pending.is_symlink() or not pending.is_file() or pending.stat().st_size != receipt["bytes"] or file_digest(pending) != receipt["sha256"]:
                    raise ValueError("Compressed staging bytes differ; original object preserved")
                pending.chmod(stat.S_IMODE(before.st_mode))
                if stat.S_IMODE(pending.stat().st_mode) != stat.S_IMODE(before.st_mode):
                    raise ValueError("Compressed staging mode differs")
                saved = before.st_blocks * 512 - pending.stat().st_blocks * 512
                if saved <= 0:
                    return {"compressed": False, "reason": "no allocated-block improvement", "reclaimed_allocated_bytes": 0}
                self.verify_receipt(receipt)
                current = path.stat()
                if (current.st_dev, current.st_ino, current.st_size, current.st_mtime_ns, current.st_ctime_ns) != (
                        before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns):
                    raise ValueError("Canonical object changed during compression")
                with pending.open("rb") as stream:
                    os.fsync(stream.fileno())
                os.replace(pending, path)
                _fsync_directory(path.parent)
                self.verify_receipt(receipt)
                return {"compressed": True, "reason": "verified transparent filesystem compression",
                        "reclaimed_allocated_bytes": saved, "sha256": receipt["sha256"]}
            finally:
                pending.unlink(missing_ok=True)
                marker.unlink(missing_ok=True)

    @_serialized
    def register_alias(self, alias, provenance=None):
        """Index a verified existing alias chain without changing its link target."""
        alias = self.alias_path(alias)
        if not alias.is_symlink() or os.path.isabs(os.readlink(alias)):
            raise ValueError("Expected an existing relative analysis alias")
        destination = alias.resolve(strict=True)
        if not destination.is_relative_to(self.objects):
            raise ValueError("Alias does not resolve into shared objects")
        receipt = self._receipt(destination.name, destination.stat().st_size, "migrated-evidence")
        self.verify_receipt(receipt)
        self._remember(receipt["sha256"], receipt["bytes"], receipt["kind"])
        with self.connect() as connection:
            connection.execute("INSERT INTO analysis_aliases VALUES(?,?,?,?) ON CONFLICT(path) DO UPDATE SET "
                               "sha256=excluded.sha256,provenance=excluded.provenance,updated=excluded.updated",
                               (alias.relative_to(self.root).as_posix(), receipt["sha256"],
                                canonical(provenance or {}), time.time()))
        return receipt

    @_serialized
    def observe(self, receipt, provenance, kind="evidence"):
        self.verify_receipt(receipt)
        document = canonical(provenance)
        digest = hashlib.sha256(document.encode()).hexdigest()
        with self.connect() as connection:
            connection.execute("INSERT OR IGNORE INTO analysis_observations VALUES(?,?,?,?,?)",
                               (receipt["sha256"], digest, document, kind, time.time()))

    @_serialized
    def publish_query(self, identity, result):
        identity_json = canonical(identity)
        key = hashlib.sha256(identity_json.encode()).hexdigest()
        receipt = self.put_bytes((canonical(result) + "\n").encode(), provenance=identity)
        with self.connect() as connection:
            old = connection.execute("SELECT identity,sha256 FROM analysis_queries WHERE identity_sha256=?",
                                     (key,)).fetchone()
            if old is not None and old != (identity_json, receipt["sha256"]):
                raise ValueError("The same exact query identity produced different retained bytes")
            connection.execute("INSERT OR IGNORE INTO analysis_queries VALUES(?,?,?,?)",
                               (key, identity_json, receipt["sha256"], time.time()))
        return dict(receipt, identity_sha256=key)

    def lookup_query_receipt(self, identity):
        identity_json = canonical(identity)
        key = hashlib.sha256(identity_json.encode()).hexdigest()
        with self.connect() as connection:
            row = connection.execute("SELECT q.identity,o.sha256,o.bytes,o.kind FROM analysis_queries q "
                                     "JOIN analysis_objects o USING(sha256) WHERE q.identity_sha256=?",
                                     (key,)).fetchone()
        if row is None:
            return None
        if row[0] != identity_json:
            raise ValueError("Shared query identity commitment differs")
        receipt = self._receipt(*row[1:])
        self.verify_receipt(receipt)
        return dict(receipt, identity_sha256=key)

    def lookup_query(self, identity):
        receipt = self.lookup_query_receipt(identity)
        return None if receipt is None else json.loads(self.verify_receipt(receipt).read_text())

    def alias_path(self, alias):
        alias = Path(alias)
        if not alias.is_absolute():
            alias = self.root / alias
        alias = Path(os.path.normpath(alias))
        if not alias.is_relative_to(self.runtime) or alias.is_relative_to(self.objects):
            raise ValueError("Analysis alias escapes runtime/ or replaces a canonical object")
        parent = alias.parent.resolve()
        if not parent.is_relative_to(self.runtime) or parent.is_relative_to(self.objects):
            raise ValueError("Analysis alias parent is redirected outside runtime/ or into objects")
        return alias

    @_serialized
    def link_alias(self, alias, receipt, provenance=None, *, replace_output=False):
        alias = self.alias_path(alias)
        destination = self.verify_receipt(receipt)
        if not replace_output and (alias.exists() or alias.is_symlink()):
            if not alias.is_file() or alias.stat().st_size != receipt["bytes"] or file_digest(alias) != receipt["sha256"]:
                raise ValueError(f"Existing analysis alias has different bytes: {alias}")
        alias.parent.mkdir(parents=True, exist_ok=True)
        self.alias_path(alias)  # Recheck after creating parents.
        pending = alias.with_name("." + alias.name + ".alias-" + uuid.uuid4().hex)
        try:
            pending.symlink_to(os.path.relpath(destination, alias.parent.resolve()))
            os.replace(pending, alias)
            _fsync_directory(alias.parent)
        finally:
            pending.unlink(missing_ok=True)
        with self.connect() as connection:
            connection.execute("INSERT INTO analysis_aliases VALUES(?,?,?,?) ON CONFLICT(path) DO UPDATE SET "
                               "sha256=excluded.sha256,provenance=excluded.provenance,updated=excluded.updated",
                               (alias.relative_to(self.root).as_posix(), receipt["sha256"],
                                canonical(provenance or {}), time.time()))
        return receipt

    def publish_output(self, path, data, kind="execheck-stage-output"):
        """Publish an explicitly writable runtime proof without a second data file."""
        alias = self.alias_path(path)
        digest = hashlib.sha256(data).hexdigest()
        destination = self.object_path(digest)
        with self.lock():
            if alias.is_symlink() and alias.resolve() == destination and destination.is_file():
                receipt = self._receipt(digest, len(data), kind)
                self.verify_receipt(receipt)
                return receipt
            provenance = {"output": alias.relative_to(self.root).as_posix()}
            receipt = self.put_bytes(data, kind, provenance)
            return self.link_alias(alias, receipt, provenance, replace_output=True)

    @_serialized
    def migrate_file(self, source, provenance=None):
        """Publish immutable bytes without duplicating allocation, then alias atomically.

        The source remains present until the object has been verified. A durable
        migration row permits recovery if the process stops before alias creation.
        Hard-link publication uses the same inode, rather than a second full copy.
        """
        source = self.alias_path(source)
        if source.is_symlink():
            destination = source.resolve(strict=True)
            if destination.is_relative_to(self.objects):
                receipt = self._receipt(destination.name, destination.stat().st_size, "migrated-evidence")
                self.verify_receipt(receipt)
                return dict(receipt, reclaimed_allocated_bytes=0, already_shared=True)
            if not destination.is_relative_to(self.runtime):
                raise ValueError("Historical alias leaves runtime/")
            raise ValueError("Migrate the historical alias's physical source first")
        observed = source.stat()
        sha256 = file_digest(source)
        destination = self.object_path(sha256)
        self._directory(destination.parent)
        name = source.relative_to(self.root).as_posix()
        provenance = provenance or {"legacy_path": name}
        with self.lock():
            if file_digest(source) != sha256:
                raise ValueError("Migration input changed")
            with self.connect() as connection:
                connection.execute("INSERT INTO analysis_migrations VALUES(?,?,?,?,?,?) ON CONFLICT(path) DO UPDATE SET "
                                   "sha256=excluded.sha256,bytes=excluded.bytes,provenance=excluded.provenance,"
                                   "state=excluded.state,updated=excluded.updated",
                                   (name, sha256, observed.st_size, canonical(provenance), "prepared", time.time()))
            existed = destination.exists() or destination.is_symlink()
            receipt = self._receipt(sha256, observed.st_size, "migrated-evidence")
            if existed:
                self.verify_receipt(receipt)
            else:
                # A same-filesystem hard link is atomic and uses no extra payload
                # storage; refuse cross-device moves instead of silently copying.
                os.link(source, destination, follow_symlinks=False)
                _fsync_directory(destination.parent)
            destination.chmod(0o444)
            self.verify_receipt(receipt)
            self._remember(sha256, observed.st_size, "migrated-evidence")
            with self.connect() as connection:
                connection.execute("UPDATE analysis_migrations SET state='published',updated=? WHERE path=?",
                                   (time.time(), name))
            reclaimed = (observed.st_blocks * 512 if existed and observed.st_nlink == 1 and
                         source.stat().st_ino != destination.stat().st_ino else 0)
            self.link_alias(source, receipt, provenance)
            with self.connect() as connection:
                connection.execute("UPDATE analysis_migrations SET state='complete',updated=? WHERE path=?",
                                   (time.time(), name))
        compression = self._maybe_compress(receipt) or {}
        return dict(receipt, reclaimed_allocated_bytes=reclaimed + compression.get("reclaimed_allocated_bytes", 0),
                    already_shared=False)

    def recover_migrations(self):
        with self.connect() as connection:
            rows = connection.execute("SELECT path,sha256,bytes,provenance FROM analysis_migrations "
                                      "WHERE state!='complete'").fetchall()
        recovered = 0
        for name, sha256, size, provenance in rows:
            source = self.alias_path(name)
            receipt = self._receipt(sha256, size, "migrated-evidence")
            if self.object_path(sha256).exists():
                self.verify_receipt(receipt)
                self._remember(sha256, size, "migrated-evidence")
                self.link_alias(source, receipt, json.loads(provenance))
                with self.connect() as connection:
                    connection.execute("UPDATE analysis_migrations SET state='complete',updated=? WHERE path=?",
                                       (time.time(), name))
            else:
                if not source.is_file() or source.stat().st_size != size or file_digest(source) != sha256:
                    raise ValueError(f"Interrupted migration source changed: {name}")
                self.migrate_file(source, json.loads(provenance))
            recovered += 1
        return recovered

    def verify(self):
        with self.connect() as connection:
            objects = connection.execute("SELECT sha256,bytes,kind FROM analysis_objects").fetchall()
            aliases = connection.execute("SELECT path,sha256 FROM analysis_aliases").fetchall()
            pending = connection.execute("SELECT count(*) FROM analysis_migrations WHERE state!='complete'").fetchone()[0]
            check = connection.execute("PRAGMA integrity_check").fetchall()
        if check != [("ok",)]:
            raise ValueError(f"Shared analysis catalog integrity failed: {check}")
        for row in objects:
            self.verify_receipt(self._receipt(*row))
        for name, sha256 in aliases:
            alias = self.alias_path(name)
            if not alias.is_symlink() or os.path.isabs(os.readlink(alias)) or alias.resolve(strict=True) != self.object_path(sha256):
                raise ValueError(f"Shared analysis alias commitment differs: {name}")
        if pending:
            raise ValueError(f"{pending} interrupted migrations need recovery")
        return {"objects": len(objects), "aliases": len(aliases), "queries": self.query_count(),
                "unique_payload_bytes": sum(row[1] for row in objects), "integrity": "ok"}

    def retire_stale_aliases(self):
        """Retain proof for obsolete aliases while leaving files and objects intact."""
        retired = 0
        with self.lock(), self.connect() as connection:
            rows = connection.execute(
                "SELECT a.path,a.sha256,a.provenance,o.bytes,o.kind FROM analysis_aliases a "
                "JOIN analysis_objects o USING(sha256) "
                "WHERE NOT EXISTS (SELECT 1 FROM analysis_migrations m WHERE m.path=a.path AND m.state!='complete')"
            ).fetchall()
            for name, digest, previous, size, kind in rows:
                alias = self.alias_path(name)
                if alias.is_symlink() or (alias.exists() and not alias.is_file()):
                    continue
                self.verify_receipt(self._receipt(digest, size, kind))
                record = canonical({"former_alias": name, "original_provenance": json.loads(previous)})
                connection.execute("INSERT OR IGNORE INTO analysis_observations VALUES(?,?,?,?,?)",
                                   (digest, hashlib.sha256(record.encode()).hexdigest(), record,
                                    "retired-runtime-alias", time.time()))
                connection.execute("DELETE FROM analysis_migrations WHERE path=? AND state='complete'", (name,))
                connection.execute("DELETE FROM analysis_aliases WHERE path=?", (name,))
                retired += 1
        return retired

    def _registered_moves(self):
        programs = self.store / "programs"
        if not programs.is_dir() or programs.is_symlink():
            return []
        paths = list(programs.glob("*/*.adopting.json")) + list(programs.glob("*/*/adopting.json"))
        moves = []
        for path in paths:
            if path.is_symlink() or not path.is_file():
                continue
            document = json.loads(path.read_text())
            if not isinstance(document.get("source"), str) or not isinstance(document.get("destination"), str):
                continue
            source = Path(os.path.normpath(document["source"]))
            destination = Path(os.path.normpath(document["destination"]))
            if not source.is_absolute() or not destination.is_absolute() or not source.is_relative_to(self.runtime) or not destination.is_relative_to(programs):
                continue
            if source.is_relative_to(self.objects) or destination.is_symlink() or not destination.is_dir() or destination.resolve() != destination:
                continue
            aliases = [source]
            if isinstance(document.get("alias"), str):
                aliases.append(Path(os.path.normpath(document["alias"])))
            registered = any(alias.is_relative_to(self.runtime) and alias.is_symlink()
                             and not os.path.isabs(os.readlink(alias)) and alias.resolve() == destination
                             for alias in aliases)
            if not registered:
                continue
            workspace_path = destination / "workspace.json"
            if not workspace_path.is_file():
                workspace_path = destination.parent / "workspace.json"
            if workspace_path.is_symlink() or not workspace_path.is_file():
                continue
            workspace = json.loads(workspace_path.read_text())
            if workspace.get("format") != "rea-shared-program-v1":
                continue
            if "identity" in document and canonical(document["identity"]) != canonical(workspace.get("identity")):
                continue
            moves.append((source, destination))
            moves.extend((alias, destination) for alias in aliases if alias != source)
        return moves

    @contextmanager
    def _registration_lease(self):
        programs = self.store / "programs"
        descriptor = None
        try:
            if programs.exists():
                if programs.is_symlink() or programs.resolve() != programs:
                    raise ValueError("Shared Program registry is redirected")
                descriptor = os.open(programs / "registry.lock", os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
                try:
                    fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
                except BlockingIOError as error:
                    raise ValueError("Program registration is active; retry alias repair after it completes") from error
            yield
        finally:
            if descriptor is not None:
                os.close(descriptor)

    def repair_aliases(self, apply=False):
        """Repair dangling CAS links using exact catalog and registered-move proof.

        Regular files, missing leaves, absolute links and links to another valid
        payload are never replaced. A moved parent requires a completed adoption
        intent and directory alias identifying the exact physical destination.
        """
        repaired, eligible, skipped = [], [], []
        with self.lock(), self._registration_lease():
            moves = self._registered_moves()
            with self.connect() as connection:
                rows = connection.execute("SELECT a.path,a.sha256,o.bytes,o.kind FROM analysis_aliases a "
                                          "JOIN analysis_objects o USING(sha256) ORDER BY a.path").fetchall()
            for name, sha256, size, kind in rows:
                alias = self.alias_path(name)
                if not alias.is_symlink() or alias.exists():
                    continue
                previous = os.readlink(alias)
                parts = Path(previous).parts
                if os.path.isabs(previous) or len(parts) < 3 or parts[-3:] != ("objects", sha256[:2], sha256):
                    skipped.append({"path": name, "reason": "dangling link is not the catalog-committed CAS payload"})
                    continue
                physical_parent = alias.parent.resolve()
                if physical_parent != alias.parent:
                    proved = any(alias.is_relative_to(source) and physical_parent == (destination / alias.relative_to(source)).parent
                                 for source, destination in moves)
                    if not proved:
                        skipped.append({"path": name, "reason": "parent relocation has no completed registration proof"})
                        continue
                receipt = self._receipt(sha256, size, kind)
                destination = self.verify_receipt(receipt)
                eligible.append(name)
                if not apply:
                    continue
                if not alias.is_symlink() or os.readlink(alias) != previous or alias.exists():
                    raise ValueError("Dangling alias changed during repair")
                pending = alias.with_name("." + alias.name + ".repair-" + uuid.uuid4().hex)
                try:
                    pending.symlink_to(os.path.relpath(destination, physical_parent))
                    os.replace(pending, alias)
                    _fsync_directory(physical_parent)
                finally:
                    pending.unlink(missing_ok=True)
                if alias.resolve(strict=True) != destination or file_digest(alias) != sha256:
                    raise ValueError("Repaired alias bytes differ")
                repaired.append(name)
        return {"mode": "repair" if apply else "read-only audit", "checked_aliases": len(rows),
                "registered_moves": len(moves), "eligible": eligible, "repaired": repaired, "skipped": skipped}

    def query_count(self):
        with self.connect() as connection:
            return connection.execute("SELECT count(*) FROM analysis_queries").fetchone()[0]

    def find_objects(self, sha256=None, target_sha256=None, text=None, limit=50):
        """Discover shared evidence without treating a match as applicability proof.

        Targets can appear anywhere in a query identity or observation. Exact
        object matches expose all historical aliases and receipts together.
        """
        if sha256 is not None and not HEX.fullmatch(sha256):
            raise ValueError("Invalid object SHA-256")
        if target_sha256 is not None and not HEX.fullmatch(target_sha256):
            raise ValueError("Invalid target SHA-256")
        if not 1 <= limit <= 10000:
            raise ValueError("Search limit must be between 1 and 10000")
        with self.connect() as connection:
            where, values = (" WHERE o.sha256=?", [sha256]) if sha256 else ("", [])
            rows = connection.execute("SELECT o.sha256,o.bytes,o.kind FROM analysis_objects o" + where +
                                      " ORDER BY o.sha256", values).fetchall()
            results = []
            for digest, size, kind in rows:
                aliases = connection.execute("SELECT path,provenance FROM analysis_aliases WHERE sha256=?",
                                             (digest,)).fetchall()
                observations = connection.execute("SELECT kind,provenance FROM analysis_observations WHERE sha256=?",
                                                  (digest,)).fetchall()
                queries = connection.execute("SELECT identity_sha256,identity FROM analysis_queries WHERE sha256=?",
                                             (digest,)).fetchall()
                haystack = canonical([aliases, observations, queries])
                if target_sha256 and target_sha256 not in haystack:
                    continue
                if text and text.casefold() not in haystack.casefold():
                    continue
                results.append(dict(self._receipt(digest, size, kind),
                                    aliases=[{"path": p, "provenance": json.loads(v)} for p, v in aliases],
                                    observations=[{"kind": k, "provenance": json.loads(v)} for k, v in observations],
                                    queries=[{"identity_sha256": k, "identity": json.loads(v)} for k, v in queries],
                                    applicability="not inferred from content or search match"))
                if len(results) >= limit:
                    break
        return results
