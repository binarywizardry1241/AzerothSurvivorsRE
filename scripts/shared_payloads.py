"""Lossless byte snapshots in the existing shared REA catalog.

Legacy paths carry small, explicit receipts. Chunks are shared by content, while
the original byte length/hash and all observations keep each snapshot distinct.
This module also supplies the gzip reader used by retained analysis consumers.
No import changes the standard library or materializes a private archive cache.
"""

from contextlib import closing, contextmanager
import gzip as _gzip
from gzip import *  # Preserve gzip's public codec/exception interface for readers.
import hashlib
import io
import json
import os
from pathlib import Path
import re
import sqlite3
import tempfile
import zlib

MAGIC = b"REA shared payload v1\n"
HEX = re.compile(r"[a-f0-9]{64}\Z")
MIN_CHUNK = 16384
MAX_CHUNK = 262144
SCHEMA = """
CREATE TABLE IF NOT EXISTS payload_snapshots (
 sha256 TEXT PRIMARY KEY, bytes INTEGER NOT NULL, complete INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS payload_chunks (
 sha256 TEXT PRIMARY KEY, bytes INTEGER NOT NULL, codec TEXT NOT NULL, payload BLOB NOT NULL);
CREATE TABLE IF NOT EXISTS payload_membership (
 snapshot TEXT NOT NULL REFERENCES payload_snapshots(sha256), ordinal INTEGER NOT NULL,
 chunk TEXT NOT NULL REFERENCES payload_chunks(sha256),
 PRIMARY KEY(snapshot,ordinal)) WITHOUT ROWID;
CREATE INDEX IF NOT EXISTS payload_membership_chunk ON payload_membership(chunk);
CREATE TABLE IF NOT EXISTS payload_paths (
 path TEXT PRIMARY KEY, sha256 TEXT NOT NULL REFERENCES payload_snapshots(sha256),
 bytes INTEGER NOT NULL, provenance TEXT NOT NULL);
"""


def resolve_payload(path):
    """Resolve a removed legacy filename through its exact catalog binding."""
    path = Path(path)
    if path.exists():
        return path
    absolute = path.resolve(strict=False)
    for root in absolute.parents:
        runtime = root / "runtime"
        catalog = runtime / "analysis/knowledge.sqlite"
        if not absolute.is_relative_to(runtime) or not catalog.is_file():
            continue
        if catalog.is_symlink() or catalog.resolve() != catalog:
            raise ValueError("Shared payload catalog is redirected")
        with closing(sqlite3.connect(catalog.as_uri() + "?mode=ro", uri=True, timeout=60)) as connection:
            if not connection.execute("SELECT 1 FROM sqlite_master WHERE name='payload_paths'").fetchone():
                return path
            row = connection.execute("SELECT sha256 FROM payload_paths WHERE path=?",
                                     (absolute.relative_to(root).as_posix(),)).fetchone()
        if row is None:
            return path
        if not HEX.fullmatch(row[0]):
            raise ValueError("Shared payload path has an invalid snapshot identity")
        canonical = runtime / "analysis/objects" / row[0][:2] / row[0]
        if not canonical.is_file() or canonical.is_symlink():
            raise ValueError("Shared payload path has no canonical snapshot")
        return canonical
    return path


def descriptor(path):
    """Recognize only bounded, project-local receipts; ordinary bytes pass through."""
    if hasattr(path, "read"):
        return None
    path = resolve_payload(path)
    if path.stat().st_size > 4096:
        return None
    with path.open("rb") as stream:
        if stream.read(len(MAGIC)) != MAGIC:
            return None
        value = json.load(stream)
    if (set(value) != {"sha256", "bytes"} or not isinstance(value["sha256"], str)
            or not HEX.fullmatch(value["sha256"]) or type(value["bytes"]) is not int
            or value["bytes"] < 0):
        raise ValueError(f"Invalid shared payload receipt: {path}")
    resolved = path.resolve(strict=True)
    for root in resolved.parents:
        runtime = root / "runtime"
        catalog = runtime / "analysis/knowledge.sqlite"
        if resolved.is_relative_to(runtime) and catalog.is_file():
            if catalog.is_symlink() or catalog.resolve() != catalog:
                raise ValueError("Shared payload catalog is redirected")
            return value, catalog
    raise ValueError(f"Shared payload receipt has no owning catalog: {path}")


class SnapshotReader(io.RawIOBase):
    """Bounded-memory, checked streaming access to an exact historical byte stream."""
    def __init__(self, catalog, sha256, size):
        super().__init__()
        self.connection = sqlite3.connect(Path(catalog).as_uri() + "?mode=ro", uri=True, timeout=60)
        try:
            row = self.connection.execute("SELECT bytes,complete FROM payload_snapshots WHERE sha256=?",
                                          (sha256,)).fetchone()
            if row != (size, 1):
                raise ValueError("Shared payload snapshot is missing, incomplete or has a different length")
            self.expected, self.size = sha256, size
            self.digest, self.count, self.ordinal = hashlib.sha256(), 0, 0
            self.pending, self.offset, self.finished = b"", 0, False
            self.position = 0
        except BaseException:
            self.connection.close()
            raise

    def readable(self):
        return True

    def _next(self):
        # Release each SELECT promptly. A slow TSV consumer must not retain a
        # catalog-wide read transaction and block other tasks' publications.
        cursor = self.connection.execute(
            "SELECT m.ordinal,c.sha256,c.bytes,c.codec,c.payload FROM payload_membership m "
            "JOIN payload_chunks c ON c.sha256=m.chunk WHERE m.snapshot=? AND m.ordinal=?",
            (self.expected, self.ordinal))
        row = cursor.fetchone()
        cursor.close()
        if row is None:
            if self.count != self.size or self.digest.hexdigest() != self.expected:
                raise ValueError("Shared payload snapshot bytes differ from their original commitment")
            self.finished = True
            return False
        ordinal, digest, size, codec, payload = row
        if ordinal != self.ordinal or codec not in ("raw", "zlib") or not 0 < size <= MAX_CHUNK:
            raise ValueError("Invalid shared payload chunk membership")
        data = zlib.decompress(payload) if codec == "zlib" else payload
        if len(data) != size or hashlib.sha256(data).hexdigest() != digest:
            raise ValueError("Shared payload chunk bytes differ")
        self.count += size
        if self.count > self.size:
            raise ValueError("Shared payload exceeds its recorded length")
        self.digest.update(data)
        self.ordinal += 1
        self.pending, self.offset = data, 0
        return True

    def readinto(self, target):
        self._checkClosed()
        view = memoryview(target).cast("B")
        written = 0
        while written < len(view):
            if self.offset == len(self.pending):
                if self.finished or not self._next():
                    break
            count = min(len(view) - written, len(self.pending) - self.offset)
            view[written:written + count] = self.pending[self.offset:self.offset + count]
            self.offset += count
            written += count
            self.position += count
        return written

    def tell(self):
        return self.position

    def seekable(self):
        return True

    def seek(self, offset, whence=os.SEEK_SET):
        self._checkClosed()
        target = offset if whence == os.SEEK_SET else (
            self.position + offset if whence == os.SEEK_CUR else self.size + offset if whence == os.SEEK_END else -1)
        if target < 0:
            raise ValueError("Invalid shared payload seek")
        if target < self.position:
            self.digest, self.count, self.ordinal = hashlib.sha256(), 0, 0
            self.pending, self.offset, self.finished, self.position = b"", 0, False, 0
        buffer = bytearray(min(MAX_CHUNK, max(1, target - self.position)))
        while self.position < target:
            count = self.readinto(memoryview(buffer)[:min(len(buffer), target - self.position)])
            if not count:
                break
        return self.position

    def close(self):
        if not self.closed:
            self.connection.close()
        super().close()


def open_payload(path):
    """Read original encoded bytes, whether loose or represented by a receipt."""
    path = resolve_payload(path)
    item = descriptor(path)
    if item is None:
        return Path(path).open("rb")
    value, catalog = item
    return io.BufferedReader(SnapshotReader(catalog, value["sha256"], value["bytes"]))


def payload_size(path):
    path = resolve_payload(path)
    item = descriptor(path)
    return item[0]["bytes"] if item else Path(path).stat().st_size


def read_payload(path):
    with open_payload(path) as stream:
        return stream.read()


@contextmanager
def open_tar(path, mode="r:*"):
    """Read a retained category archive without restoring a loose tar file."""
    import tarfile
    if not mode.startswith('r'):
        raise ValueError("Shared tar snapshots are read-only inputs")
    with open_payload(path) as source, tarfile.open(fileobj=source, mode=mode) as archive:
        yield archive


def retire_path(store, path, receipt, provenance=None):
    """Delete a verified legacy archive only after its catalog route is durable."""
    from shared_analysis import canonical, file_digest, _fsync_directory
    path = store.alias_path(path)
    with store.lock():
        store.verify_receipt(receipt)
        if descriptor(store.object_path(receipt["sha256"])) is None:
            raise ValueError("Retiring a path requires a verified shared snapshot")
        if payload_size(path) != receipt["bytes"] or file_digest(path) != receipt["sha256"]:
            raise ValueError("Legacy archive changed before retirement")
        name = path.relative_to(store.root).as_posix()
        provenance = provenance or {"legacy_path": name}
        store.observe(receipt, provenance, "retired-payload-path")
        with store.connect() as connection:
            connection.execute("INSERT INTO payload_paths VALUES(?,?,?,?) ON CONFLICT(path) DO UPDATE SET "
                               "sha256=excluded.sha256,bytes=excluded.bytes,provenance=excluded.provenance",
                               (name, receipt["sha256"], receipt["bytes"], canonical(provenance)))
            # Preserve every former alias observation, then move its live routing
            # responsibility to payload_paths rather than leaving a dangling link.
            old = connection.execute("SELECT provenance FROM analysis_aliases WHERE path=?", (name,)).fetchone()
            if old:
                connection.execute("INSERT OR IGNORE INTO analysis_observations VALUES(?,?,?,?,?)",
                    (receipt["sha256"], hashlib.sha256(old[0].encode()).hexdigest(), old[0], "retired-alias", __import__('time').time()))
            connection.execute("DELETE FROM analysis_aliases WHERE path=?", (name,))
        if path.exists() or path.is_symlink():
            path.unlink()
            _fsync_directory(path.parent)
        if resolve_payload(path) != store.object_path(receipt["sha256"]):
            raise ValueError("Retired archive cannot resolve its shared snapshot")


class GzipFile(_gzip.GzipFile):
    """gzip-compatible reader which owns its shared byte-stream handle."""
    def __init__(self, filename=None, mode=None, compresslevel=9, fileobj=None, mtime=None):
        self.mode = _gzip.READ  # Also safe for gzip's destructor after failed admission.
        self._payload_source = None
        if filename is not None and fileobj is None and (mode is None or mode.startswith("r")):
            if descriptor(filename) is not None:
                self._payload_source = open_payload(filename)
                fileobj = self._payload_source
                filename = None
        try:
            super().__init__(filename=filename, mode=mode, compresslevel=compresslevel,
                             fileobj=fileobj, mtime=mtime)
        except BaseException:
            if self._payload_source is not None:
                self._payload_source.close()
            raise

    def close(self):
        try:
            super().close()
        finally:
            if self._payload_source is not None:
                self._payload_source.close()


def open(filename, mode="rb", compresslevel=9, encoding=None, errors=None, newline=None):
    if "t" not in mode:
        if encoding is not None or errors is not None or newline is not None:
            raise ValueError("Argument 'encoding', 'errors' or 'newline' not supported in binary mode")
    elif "b" in mode:
        raise ValueError("Invalid mode: %r" % mode)
    binary = mode.replace("t", "")
    if hasattr(filename, "read") or hasattr(filename, "write"):
        stream = GzipFile(fileobj=filename, mode=binary, compresslevel=compresslevel)
    else:
        # Never truncate an immutable receipt through a shared legacy alias.
        if not binary.startswith("r") and Path(filename).exists() and descriptor(filename) is not None:
            raise ValueError("Publish changed shared gzip bytes through a staged replacement")
        stream = GzipFile(filename=filename, mode=binary, compresslevel=compresslevel)
    return io.TextIOWrapper(stream, encoding, errors, newline) if "t" in mode else stream


def chunks(stream):
    """Content-defined byte boundaries resynchronize after insertions in any format.

    The bounded two-byte delimiter search runs in the native bytes implementation.
    Chunks include the delimiter, preserving every byte and deterministic order.
    """
    pending = b""
    while True:
        data = stream.read(1024 * 1024)
        pending += data
        while len(pending) >= MAX_CHUNK or (not data and pending):
            boundary = pending.find(b"\xa5\x5a", MIN_CHUNK, MAX_CHUNK - 1)
            length = boundary + 2 if boundary >= 0 else min(len(pending), MAX_CHUNK)
            yield pending[:length]
            pending = pending[length:]
        if not data:
            return


def compact_object(store, receipt):
    """Commit and verify shared chunks before atomically replacing the last archive.

    Original file observations remain in analysis_objects/analysis_observations.
    A transaction or publication interruption leaves either the original bytes or
    a fully verified receipt. No backup/archive copy or per-task store is needed.
    Caller coordinates any legacy hard links through their owning census lease.
    """
    with store.lock():
        path = store.verify_receipt(receipt)
        existing = descriptor(path)
        if existing is not None:
            return {"compacted": False, "reclaimed_allocated_bytes": 0}
        before = path.stat()
        with store.connect() as connection:
            connection.executescript(SCHEMA)
            row = connection.execute("SELECT bytes,complete FROM payload_snapshots WHERE sha256=?",
                                     (receipt["sha256"],)).fetchone()
            if row is not None and row != (receipt["bytes"], 1):
                raise ValueError("Existing shared payload snapshot differs")
            if row is None:
                connection.execute("INSERT INTO payload_snapshots VALUES(?,?,0)",
                                   (receipt["sha256"], receipt["bytes"]))
                digest, size = hashlib.sha256(), 0
                with path.open("rb") as source:
                    for ordinal, data in enumerate(chunks(source)):
                        digest.update(data)
                        size += len(data)
                        sha = hashlib.sha256(data).hexdigest()
                        packed = zlib.compress(data, 1)
                        codec = "zlib" if len(packed) + 32 < len(data) else "raw"
                        payload = packed if codec == "zlib" else data
                        connection.execute("INSERT OR IGNORE INTO payload_chunks VALUES(?,?,?,?)",
                                           (sha, len(data), codec, payload))
                        connection.execute("INSERT INTO payload_membership VALUES(?,?,?)",
                                           (receipt["sha256"], ordinal, sha))
                if size != receipt["bytes"] or digest.hexdigest() != receipt["sha256"]:
                    raise ValueError("Payload changed during chunk publication; original preserved")
                connection.execute("UPDATE payload_snapshots SET complete=1 WHERE sha256=?", (receipt["sha256"],))
        # Verify committed storage independently, including reused chunk contents.
        digest = hashlib.sha256()
        with io.BufferedReader(SnapshotReader(store.database, receipt["sha256"], receipt["bytes"])) as stream:
            for data in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(data)
        if digest.hexdigest() != receipt["sha256"]:
            raise ValueError("Shared snapshot reconstruction differs; original preserved")
        from shared_analysis import _fsync_directory, file_digest
        signature = lambda s: (s.st_dev, s.st_ino, s.st_size, s.st_mtime_ns, s.st_ctime_ns)
        if file_digest(path) != receipt["sha256"] or signature(path.stat()) != signature(before):
            raise ValueError("Original payload changed before replacement")
        fd, name = tempfile.mkstemp(prefix=".payload-", dir=path.parent)
        pending = Path(name)
        try:
            with os.fdopen(fd, "wb") as stream:
                stream.write(MAGIC + json.dumps({"sha256": receipt["sha256"], "bytes": receipt["bytes"]},
                                               sort_keys=True).encode() + b"\n")
                stream.flush()
                os.fsync(stream.fileno())
            pending.chmod(0o444)
            os.replace(pending, path)
            _fsync_directory(path.parent)
            store.verify_receipt(receipt)
        finally:
            pending.unlink(missing_ok=True)
        return {"compacted": True, "reclaimed_allocated_bytes": before.st_blocks * 512 if before.st_nlink == 1 else 0}


@contextmanager
def materialized(paths):
    """Lease-owned temporary native views; always restore receipts, even on failure.

    Native Java collectors require ordinary files. The caller must hold the
    census lease for these paths; this context never creates another hot cache.
    A crash leaves exact original bytes, which the normal migration can compact.
    """
    restored = []
    try:
        for path in dict.fromkeys(Path(p) for p in paths):
            item = descriptor(path)
            if item is None:
                continue
            existed = path.exists() or path.is_symlink()
            original = resolve_payload(path).read_bytes()
            fd, name = tempfile.mkstemp(prefix=".payload-view-", dir=path.parent)
            pending = Path(name)
            try:
                with os.fdopen(fd, "wb") as output, open_payload(path) as source:
                    for block in iter(lambda: source.read(1024 * 1024), b""):
                        output.write(block)
                    output.flush()
                    os.fsync(output.fileno())
                os.replace(pending, path)
                restored.append((path, original, item[0], existed))
            finally:
                pending.unlink(missing_ok=True)

        yield
    finally:
        from shared_analysis import file_digest
        for path, original, receipt, existed in reversed(restored):
            # A producer may deliberately replace an export. Never discard it.
            if payload_size(path) != receipt["bytes"] or file_digest(path) != receipt["sha256"]:
                continue
            if not existed:
                path.unlink()
                continue
            fd, name = tempfile.mkstemp(prefix=".payload-receipt-", dir=path.parent)
            pending = Path(name)
            try:
                with os.fdopen(fd, "wb") as output:
                    output.write(original)
                    output.flush()
                    os.fsync(output.fileno())
                pending.chmod(0o444)
                os.replace(pending, path)
            finally:
                pending.unlink(missing_ok=True)


def main():
    import argparse
    import sys
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group(required=True)
    modes.add_argument("--verify", metavar="PATH")
    modes.add_argument("--cat", metavar="PATH")
    modes.add_argument("--lease-census", metavar="PLAN")
    args = parser.parse_args()
    if args.verify or args.cat:
        digest, size = hashlib.sha256(), 0
        with open_payload(args.verify or args.cat) as stream:
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(block)
                size += len(block)
                if args.cat:
                    sys.stdout.buffer.write(block)
        if args.verify:
            print(json.dumps({"sha256": digest.hexdigest(), "bytes": size}))
        return
    plan_path = Path(args.lease_census).resolve(strict=True)
    root = Path(__file__).resolve().parents[1]
    census = root / "runtime/analysis/census"
    plan = json.loads(plan_path.read_text())
    output = Path(plan["output"]).resolve(strict=True)
    if (plan_path != output / "plan.json" or not HEX.fullmatch(plan["target_sha256"])
            or not output.is_relative_to(census / plan["target_sha256"])):
        raise ValueError("Native payload view requires a canonical target-bound census plan")
    # The caller holds the whole-image native slot and current census lease.
    # Frozen predecessors share this target's Program and may be loaded by the
    # exact original Java collector, whose bytes are deliberately unchanged.
    paths = list(output.glob("*.gz"))
    paths.extend((census / plan["target_sha256"]).glob("*/reuse-state.json.gz"))
    catalog = root / "runtime/analysis/knowledge.sqlite"
    with closing(sqlite3.connect(catalog.as_uri() + "?mode=ro", uri=True)) as connection:
        if connection.execute("SELECT 1 FROM sqlite_master WHERE name='payload_paths'").fetchone():
            prefix = (census / plan["target_sha256"]).relative_to(root).as_posix() + "/%"
            for (name,) in connection.execute("SELECT path FROM payload_paths WHERE path LIKE ?", (prefix,)):
                path = root / name
                if path.parent == output or path.name == "reuse-state.json.gz":
                    paths.append(path)
    with materialized(paths):
        print("materialized", flush=True)
        sys.stdin.buffer.read()


if __name__ == "__main__":
    main()
