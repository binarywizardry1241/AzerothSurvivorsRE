#!/usr/bin/env python3
"""Compact, provenance-preserving SQLite inventories in the shared REA catalog.

Historical SQLite byte streams remain losslessly archived in the shared object
store. Their logical paths become small receipts. Query adapters expose the
original tables from compressed row chunks in the single knowledge.sqlite;
tasks do not materialize another expanded SQLite copy.
"""

import argparse
import ast
from bisect import bisect_left
from collections import OrderedDict
from contextlib import closing, contextmanager
from functools import lru_cache
import fcntl
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import sqlite3
import subprocess
import tempfile
import time
from urllib.parse import unquote, urlsplit, parse_qs
import zlib

from artifact_history import iter_artifact_paths, read_artifact
from shared_analysis import SharedAnalysis, canonical, file_digest

ROOT = Path(__file__).resolve().parents[1]
MAGIC = b"REA shared native inventory v1\n"
SQLITE_MAGIC = b"SQLite format 3\x00"
CHUNK_ROWS = 4096
NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_]*\Z")
HEX = re.compile(r"[0-9a-f]{64}\Z")
SCHEMA = """
CREATE TABLE IF NOT EXISTS native_snapshots (
 id TEXT PRIMARY KEY, target_sha256 TEXT, metadata TEXT NOT NULL,
 schema_json TEXT NOT NULL, logical_sha256 TEXT, complete INTEGER NOT NULL DEFAULT 0,
 source_sha256 TEXT, archive_json TEXT);
CREATE TABLE IF NOT EXISTS native_chunks (
 sha256 TEXT PRIMARY KEY, payload BLOB NOT NULL, rows INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS native_membership (
 snapshot TEXT NOT NULL REFERENCES native_snapshots(id), table_name TEXT NOT NULL,
 ordinal INTEGER NOT NULL, sha256 TEXT NOT NULL REFERENCES native_chunks(sha256),
 PRIMARY KEY(snapshot,table_name,ordinal));
CREATE INDEX IF NOT EXISTS native_membership_chunk ON native_membership(sha256);
CREATE TABLE IF NOT EXISTS native_sources (
 path TEXT PRIMARY KEY, snapshot TEXT NOT NULL REFERENCES native_snapshots(id),
 source_sha256 TEXT, descriptor_sha256 TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS native_ranges (
 range_sha256 BLOB NOT NULL, start INTEGER NOT NULL, end INTEGER NOT NULL,
 decoder INTEGER NOT NULL, snapshot INTEGER NOT NULL, ordinal INTEGER NOT NULL,
 decoded_end INTEGER NOT NULL, instructions INTEGER NOT NULL,
 refs_first INTEGER, refs_count INTEGER NOT NULL,
 PRIMARY KEY(range_sha256,start,end,decoder)) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS native_decoders (
 id INTEGER PRIMARY KEY, contract TEXT NOT NULL, version TEXT NOT NULL,
 UNIQUE(contract,version));
CREATE TABLE IF NOT EXISTS native_decoder_compat (
 snapshot INTEGER NOT NULL, legacy_decoder INTEGER NOT NULL,
 contract TEXT NOT NULL, version TEXT NOT NULL,
 source_path TEXT NOT NULL, source_sha256 TEXT NOT NULL,
 legacy_contract TEXT NOT NULL, initialization_sha256 TEXT NOT NULL,
 PRIMARY KEY(snapshot,legacy_decoder));
CREATE INDEX IF NOT EXISTS native_decoder_compat_current ON native_decoder_compat(contract,version);
"""


def _range_key(value):
    return bytes.fromhex(value) if HEX.fullmatch(value) else value.encode()


def _initialize(connection):
    connection.executescript(SCHEMA)
    columns = [row[1] for row in connection.execute("PRAGMA table_info(native_ranges)")]
    if "decoder_contract" not in columns:
        return
    # Upgrade the initial storage implementation without losing any candidate
    # index entry. The rows themselves remain in shared chunks/archives.
    connection.execute("BEGIN IMMEDIATE")
    try:
        connection.execute("ALTER TABLE native_ranges RENAME TO native_ranges_legacy")
        connection.execute("CREATE TABLE native_ranges(range_sha256 BLOB NOT NULL,start INTEGER NOT NULL,end INTEGER NOT NULL,decoder INTEGER NOT NULL,snapshot INTEGER NOT NULL,ordinal INTEGER NOT NULL,decoded_end INTEGER NOT NULL,instructions INTEGER NOT NULL,refs_first INTEGER,refs_count INTEGER NOT NULL,PRIMARY KEY(range_sha256,start,end,decoder)) WITHOUT ROWID")
        connection.execute("INSERT OR IGNORE INTO native_decoders(contract,version) SELECT DISTINCT decoder_contract,decoder_version FROM native_ranges_legacy")
        cursor = connection.execute("SELECT r.range_sha256,r.start,r.end,d.id,s.rowid,r.ordinal,r.decoded_end,r.instructions,r.refs_first,r.refs_count FROM native_ranges_legacy r JOIN native_decoders d ON d.contract=r.decoder_contract AND d.version=r.decoder_version JOIN native_snapshots s ON s.id=r.snapshot")
        while rows := cursor.fetchmany(4096):
            connection.executemany("INSERT OR IGNORE INTO native_ranges VALUES(?,?,?,?,?,?,?,?,?,?)", [(_range_key(r[0]), *r[1:]) for r in rows])
        connection.execute("DROP TABLE native_ranges_legacy")
        connection.commit()
    except BaseException:
        connection.rollback();raise


def _remember_ranges(connection, rows):
    decoders = {};snapshots = {};packed = []
    for digest, start, end, contract, version, snapshot, ordinal, decoded, instructions, first, count in rows:
        profile = (contract, version)
        if profile not in decoders:
            connection.execute("INSERT OR IGNORE INTO native_decoders(contract,version) VALUES(?,?)", profile)
            decoders[profile] = connection.execute("SELECT id FROM native_decoders WHERE contract=? AND version=?", profile).fetchone()[0]
        if snapshot not in snapshots:
            snapshots[snapshot] = connection.execute("SELECT rowid FROM native_snapshots WHERE id=?", (snapshot,)).fetchone()[0]
        packed.append((_range_key(digest), start, end, decoders[profile], snapshots[snapshot], ordinal, decoded, instructions, first, count))
    connection.executemany("INSERT OR IGNORE INTO native_ranges VALUES(?,?,?,?,?,?,?,?,?,?)", packed)


def _decoder_algorithm(source):
    tree = ast.parse(source)
    names = {"instruction_references", "InstructionView", "instructions", "decode_extent"}
    nodes = [ast.dump(n, include_attributes=False) for n in tree.body if isinstance(n, (ast.FunctionDef, ast.ClassDef)) and n.name in names]
    if len(nodes) != len(names):
        raise ValueError("Native decoder contract is incomplete")
    return tree, nodes


def _legacy_decoder_contract(source):
    """Identify the former algorithm-only key solely for verified migration."""
    _, nodes = _decoder_algorithm(source)
    return hashlib.sha256(canonical(nodes).encode()).hexdigest()


def _decoder_setup(tree):
    """Bind the actual admitted constructor/options and reject hidden setup."""
    run = next((n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == "run"), None)
    if run is None:
        raise ValueError("Native decoder initialization is missing")
    parents = {child: node for node in ast.walk(run) for child in ast.iter_child_nodes(node)}
    def rooted(node):
        while isinstance(node, ast.Attribute):
            node = node.value
        return isinstance(node, ast.Name) and node.id == "decoder"
    def constant(node):
        if isinstance(node, ast.Constant):
            return True
        if isinstance(node, ast.Attribute):
            return isinstance(node.value, ast.Name) and node.value.id == "capstone"
        if isinstance(node, ast.BinOp) and isinstance(node.op, (ast.BitOr, ast.BitAnd, ast.BitXor)):
            return constant(node.left) and constant(node.right)
        if isinstance(node, ast.UnaryOp) and isinstance(node.op, (ast.USub, ast.UAdd, ast.Invert)):
            return constant(node.operand)
        if isinstance(node, (ast.Tuple, ast.List)):
            return all(constant(item) for item in node.elts)
        return False
    setup = []
    constructor = None
    attrs = []
    for node in ast.walk(run):
        if isinstance(node, ast.Assign) and any(rooted(target) for target in node.targets):
            if len(node.targets) != 1:
                raise ValueError("Unsupported chained native decoder configuration")
            target = node.targets[0]
            if isinstance(target, ast.Name):
                value = node.value
                if (constructor is not None or not isinstance(value, ast.Call) or
                        not isinstance(value.func, ast.Attribute) or value.func.attr != "Cs" or
                        not isinstance(value.func.value, ast.Name) or value.func.value.id != "capstone" or
                        not all(constant(arg) for arg in value.args) or
                        not all(keyword.arg is not None and constant(keyword.value) for keyword in value.keywords)):
                    raise ValueError("Unsupported indirect native decoder constructor")
                constructor = node
            elif not constant(node.value):
                raise ValueError("Unsupported indirect native decoder option")
            else:
                attrs.append(target.attr)
            setup.append(node)
        elif isinstance(node, (ast.AnnAssign, ast.AugAssign)) and rooted(node.target):
            raise ValueError("Unsupported native decoder configuration assignment")
        elif isinstance(node, ast.Call):
            if isinstance(node.func, ast.Attribute) and rooted(node.func.value):
                raise ValueError("Unsupported native decoder method configuration")
            if any(isinstance(arg, ast.Name) and arg.id == "decoder" for arg in [*node.args, *[k.value for k in node.keywords]]):
                if not isinstance(node.func, ast.Name) or node.func.id != "decode_extent":
                    raise ValueError("Unsupported external native decoder configuration")
    if constructor is None or attrs.count("detail") != 1 or attrs.count("skipdata") != 1:
        raise ValueError("Native decoder detail/skipdata configuration is incomplete")
    block = parents[constructor]
    if not isinstance(block, (ast.Try, ast.FunctionDef)) or any(parents[n] is not block for n in setup):
        raise ValueError("Conditional native decoder setup requires an explicit contract")
    # Line numbers/order select statements, but do not enter the fingerprint.
    return [ast.dump(n, include_attributes=False) for n in sorted(setup, key=lambda n: (n.lineno, n.col_offset))]


def decoder_contract(source):
    """Bind decoding/reference code and actual Capstone construction/options.

    Storage-only source edits keep the key stable. Architecture, mode, detail,
    skipdata or any admitted option change selects a different decode lineage.
    Unsupported indirect/conditional initialization fails closed.
    """
    tree, nodes = _decoder_algorithm(source)
    return hashlib.sha256(canonical({"format": "native-linear-decoder-contract-v2", "algorithm": nodes,
                                     "initialization": _decoder_setup(tree)}).encode()).hexdigest()


@lru_cache(maxsize=32)
def _historical_decoder_source(root, path, digest):
    """Recover exact original source, including its actual decoder options."""
    root = Path(root)
    if path != "scripts/inventory-native-instructions.py" or not isinstance(digest, str) or not HEX.fullmatch(digest):
        return None
    current = root / path
    if current.exists():
        source = current.read_bytes()
        if hashlib.sha256(source).hexdigest() == digest:
            return source.decode()
    try:
        lines = subprocess.check_output(["git", "rev-list", "--all", "--objects", "--", path], cwd=root, stderr=subprocess.DEVNULL).decode().splitlines()
        for line in lines:
            oid, _, name = line.partition(" ")
            if name != path:
                continue
            source = subprocess.check_output(["git", "cat-file", "blob", oid], cwd=root, stderr=subprocess.DEVNULL)
            if hashlib.sha256(source).hexdigest() == digest:
                return source.decode()
    except (OSError, subprocess.CalledProcessError, UnicodeError, ValueError):
        return None
    return None


@lru_cache(maxsize=32)
def _historical_contract(root, path, digest):
    source = _historical_decoder_source(root, path, digest)
    if source is None:
        return None
    try:
        return decoder_contract(source)
    except ValueError:
        return None


@lru_cache(maxsize=4)
def _documented_inventory_receipts(root):
    """Admit historical decode reuse only from retained hash-bound evidence."""
    result = set()
    for path in iter_artifact_paths("docs/analysis", ".json", recursive=True, root=Path(root)):
        try:
            value = json.loads(read_artifact(path, root=Path(root)))
        except (OSError, UnicodeError, json.JSONDecodeError):
            continue
        stack = [value]
        while stack:
            row = stack.pop()
            if isinstance(row, dict):
                name, digest = row.get("path"), row.get("sha256")
                if isinstance(name, str) and name.endswith("native-instructions.sqlite") and isinstance(digest, str) and HEX.fullmatch(digest):
                    result.add((name, digest))
                stack.extend(row.values())
            elif isinstance(row, list):
                stack.extend(row)
    return result


def _root(path, root=None):
    root = Path(root or ROOT).resolve()
    path = Path(path)
    if not path.is_absolute():
        path = root / path
    # Resolve parents, but do not silently accept an input alias outside runtime.
    path = path.parent.resolve() / path.name
    if not path.is_relative_to(root / "runtime"):
        raise ValueError("Native inventory is outside project runtime/")
    if path.is_symlink() and not path.resolve().is_relative_to(root / "runtime"):
        raise ValueError("Native inventory alias escapes project runtime/")
    return root, path


def _quoted(name):
    if not NAME.fullmatch(name):
        raise ValueError("Unsupported native inventory identifier: " + str(name))
    return '"' + name + '"'


def descriptor(path):
    path = Path(path)
    with path.open("rb") as stream:
        if stream.read(len(MAGIC)) != MAGIC:
            return None
        data = stream.read(1024 * 1024 + 1)
    if len(data) > 1024 * 1024:
        raise ValueError("Native inventory receipt is too large")
    value = json.loads(data)
    if value.get("format") != "rea-shared-native-inventory-v1" or not HEX.fullmatch(value.get("snapshot", "")):
        raise ValueError("Invalid native inventory receipt")
    return value


def _schema(connection):
    result = []
    for name, sql in connection.execute("SELECT name,sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name"):
        _quoted(name)
        columns = [row[1] for row in connection.execute("PRAGMA table_info(" + _quoted(name) + ")")]
        for column in columns:
            _quoted(column)
        result.append({"name": name, "columns": columns, "sql": sql})
    return result


def _metadata(connection, schema):
    if any(t["name"] == "metadata" for t in schema):
        row = connection.execute("SELECT value FROM metadata LIMIT 1").fetchone()
        if row:
            return json.loads(row[0])
    return {}


@lru_cache(maxsize=32)
def _expand(payload, expected):
    raw = zlib.decompress(payload)
    if hashlib.sha256(raw).hexdigest() != expected:
        raise ValueError("Shared native row chunk digest differs")
    return raw.decode("utf-8")


def _logical(connection, snapshot, metadata, schema):
    h = hashlib.sha256(canonical({"metadata": metadata, "schema": schema}).encode())
    for row in connection.execute("SELECT table_name,ordinal,sha256 FROM native_membership WHERE snapshot=? ORDER BY table_name,ordinal", (snapshot,)):
        h.update(canonical(row).encode())
    return h.hexdigest()


class _ReadConnection(sqlite3.Connection):
    """Preserve SELECT *'s original columns while exposing the original rowid."""
    table_columns = None

    def _sql(self, sql):
        if not self.table_columns:
            return sql
        for name, columns in self.table_columns.items():
            pattern = r'\bSELECT\s+\*\s+FROM\s+(?:"' + name + r'"|' + name + r')(?![A-Za-z0-9_])'
            sql = re.sub(pattern, "SELECT " + ",".join(_quoted(c) for c in columns) + " FROM " + _quoted(name), sql, flags=re.I)
        return sql

    def execute(self, sql, parameters=()):
        return super().execute(self._sql(sql), parameters)

    def __exit__(self, *args):
        try:
            return super().__exit__(*args)
        finally:
            self.close()


class _HotConnection(_ReadConnection):
    hot_lease = None
    hot_root = None
    hot_name = None

    def close(self):
        try:
            super().close()
        finally:
            if self.hot_lease is not None:
                os.close(self.hot_lease);self.hot_lease = None
                _evict_hot(self.hot_root, self.hot_name)


def _open_chunks_readonly(path, root=None):
    """Open an ordinary inventory or shared receipt with the same query tables.

    Metadata, SQL column order and original rowids are preserved. The shared
    catalog is opened read-only; temporary views contain no expanded row copies.
    """
    root, path = _root(path, root)
    value = descriptor(path)
    if value is None:
        connection = sqlite3.connect(path.resolve().as_uri() + "?mode=ro", uri=True, factory=_ReadConnection)
        connection.execute("PRAGMA temp_store=MEMORY")
        return connection
    catalog = root / value["catalog"]
    if catalog != root / "runtime/analysis/knowledge.sqlite" or catalog.is_symlink():
        raise ValueError("Shared native catalog path differs")
    connection = sqlite3.connect(catalog.as_uri() + "?mode=ro", uri=True, factory=_ReadConnection)
    try:
        connection.execute("PRAGMA temp_store=MEMORY")
        row = connection.execute("SELECT metadata,schema_json,logical_sha256,complete,source_sha256,archive_json FROM native_snapshots WHERE id=?", (value["snapshot"],)).fetchone()
        if not row or not row[3] or row[2] != value["logical_sha256"]:
            raise ValueError("Incomplete or changed shared native snapshot")
        metadata, schema = json.loads(row[0]), json.loads(row[1])
        if _logical(connection, value["snapshot"], metadata, schema) != row[2]:
            raise ValueError("Shared native snapshot membership differs")
        if row[4] != value.get("source_sha256") or (json.loads(row[5]) if row[5] else None) != value.get("archive"):
            raise ValueError("Historical native byte-stream commitment differs")
        connection.create_function("native_chunk", 2, _expand, deterministic=True)
        for table in schema:
            fields = ["json_extract(j.value,'$[" + str(i + 1) + "]') AS " + _quoted(name) for i, name in enumerate(table["columns"])]
            fields.append("json_extract(j.value,'$[0]') AS rowid")
            sql = "CREATE TEMP VIEW " + _quoted(table["name"]) + " AS SELECT " + ",".join(fields)
            sql += " FROM native_membership m JOIN native_chunks c ON c.sha256=m.sha256, json_each(native_chunk(c.payload,c.sha256)) j"
            sql += " WHERE m.snapshot='" + value["snapshot"] + "' AND m.table_name='" + table["name"] + "'"
            connection.execute(sql)
        connection.table_columns = {t["name"]: t["columns"] for t in schema}
        return connection
    except BaseException:
        connection.close()
        raise


def _cache_lock(root):
    directory = root / "runtime/analysis/native-hot"
    directory.mkdir(parents=True, exist_ok=True)
    if directory.resolve() != directory:
        raise ValueError("Native hot cache must not be redirected")
    return directory, os.open(directory / "cache.lock", os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)


def _evict_hot(root, preferred):
    """Bound the cache to actively leased snapshots and at most one idle one."""
    directory, lock = _cache_lock(root)
    try:
        fcntl.flock(lock, fcntl.LOCK_EX)
        idle = []
        for path in sorted(directory.glob("*.sqlite")):
            lease = os.open(path.with_suffix(".lease"), os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
            try:
                fcntl.flock(lease, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                os.close(lease);continue
            idle.append((path, lease))
        keep = next((p for p, _ in idle if p.name == preferred), idle[-1][0] if idle else None)
        for path, lease in idle:
            if path != keep:
                path.unlink();path.with_suffix(".json").unlink(missing_ok=True)
                path.with_suffix(".lease").unlink(missing_ok=True)
            os.close(lease)
    finally:
        os.close(lock)


@lru_cache(maxsize=16)
def _verify_hot(path, signature, expected):
    if file_digest(path) != expected:
        raise ValueError("Native hot inventory bytes differ; preserve/review cache")
    return True


def _materialize_hot(root, value, output):
    """Restore exact historical bytes, or build an indexed current snapshot."""
    if value.get("archive"):
        receipt = value["archive"]
        archive = root / receipt["path"]
        if archive != root / "runtime/analysis/objects" / receipt["sha256"][:2] / receipt["sha256"] or archive.is_symlink():
            raise ValueError("Native source archive is redirected")
        if file_digest(archive) != receipt["sha256"]:
            raise ValueError("Native source archive digest differs")
        h = hashlib.sha256()
        with gzip.open(archive, "rb") as source, output.open("wb") as destination:
            for block in iter(lambda: source.read(1024 * 1024), b""):
                destination.write(block);h.update(block)
            destination.flush();os.fsync(destination.fileno())
        if h.hexdigest() != value["source_sha256"]:
            raise ValueError("Restored native SQLite bytes differ")
        return h.hexdigest()
    catalog = root / value["catalog"]
    with closing(sqlite3.connect(catalog.as_uri() + "?mode=ro", uri=True)) as source, closing(sqlite3.connect(output)) as destination:
        schema = json.loads(source.execute("SELECT schema_json FROM native_snapshots WHERE id=?", (value["snapshot"],)).fetchone()[0])
        destination.execute("PRAGMA temp_store=MEMORY")
        for table in schema:
            if table["sql"]:
                destination.execute(table["sql"])
            else:
                fields = []
                for column in table["columns"]:
                    kind = "TEXT" if column in ("value", "bytes", "sha256", "kind", "target") else "INTEGER"
                    primary = " PRIMARY KEY" if (table["name"], column) in (("metadata", "id"), ("extents", "ordinal")) else ""
                    fields.append(_quoted(column) + " " + kind + primary)
                destination.execute("CREATE TABLE " + _quoted(table["name"]) + "(" + ",".join(fields) + ")")
            columns = ",".join(["rowid"] + [_quoted(c) for c in table["columns"]])
            sql = "INSERT INTO " + _quoted(table["name"]) + "(" + columns + ") VALUES(" + ",".join("?" for _ in range(len(table["columns"]) + 1)) + ")"
            for payload, digest in source.execute("SELECT c.payload,c.sha256 FROM native_membership m JOIN native_chunks c ON c.sha256=m.sha256 WHERE m.snapshot=? AND m.table_name=? ORDER BY m.ordinal", (value["snapshot"], table["name"])):
                destination.executemany(sql, json.loads(_expand(payload, digest)))
        reference_columns = next((t["columns"] for t in schema if t["name"] == "refs"), [])
        for column in ("target", "site", "extent"):
            if column in reference_columns:
                destination.execute("CREATE INDEX " + _quoted("refs_" + column) + " ON refs(" + _quoted(column) + ")")
        destination.commit()
    return file_digest(output)


def open_readonly(path, root=None):
    """Query through a bounded leased relational cache, preserving SQL indexes.

    There is at most one idle expanded inventory. Concurrent readers may lease
    distinct snapshots; a lease prevents eviction until that connection closes.
    Canonical compressed data and all historical identities stay in the shared
    catalog/CAS. No game, provider or decoder is executed to populate this cache.
    """
    root, path = _root(path, root)
    value = descriptor(path)
    if value is None:
        return _open_chunks_readonly(path, root=root)
    # Validate all bindings before trusting an existing derived cache.
    with _open_chunks_readonly(path, root=root):
        pass
    directory, lock = _cache_lock(root)
    name = value["snapshot"] + "-" + value["logical_sha256"][:16]
    selected = directory / (name + ".sqlite")
    sidecar = selected.with_suffix(".json")
    lease = None
    try:
        fcntl.flock(lock, fcntl.LOCK_EX)
        lease = os.open(selected.with_suffix(".lease"), os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
        if not selected.exists():
            fd, pending_name = tempfile.mkstemp(prefix=".native-hot-", suffix=".sqlite", dir=directory)
            os.close(fd);pending = Path(pending_name)
            try:
                digest = _materialize_hot(root, value, pending)
                pending.chmod(0o444)
                cache = {"snapshot": value["snapshot"], "logical_sha256": value["logical_sha256"], "sha256": digest, "bytes": pending.stat().st_size}
                metadata_fd, metadata_name = tempfile.mkstemp(prefix=".native-hot-", suffix=".json", dir=directory)
                try:
                    with os.fdopen(metadata_fd, "w") as metadata_stream:
                        metadata_stream.write(canonical(cache) + "\n");metadata_stream.flush();os.fsync(metadata_stream.fileno())
                    os.replace(metadata_name, sidecar)
                finally:
                    Path(metadata_name).unlink(missing_ok=True)
                os.replace(pending, selected)
            finally:
                pending.unlink(missing_ok=True)
        if selected.is_symlink() or sidecar.is_symlink():
            raise ValueError("Native hot inventory is redirected")
        cache = json.loads(sidecar.read_text())
        if cache["snapshot"] != value["snapshot"] or cache["logical_sha256"] != value["logical_sha256"] or cache["bytes"] != selected.stat().st_size:
            raise ValueError("Native hot inventory commitment differs")
        s = selected.stat()
        _verify_hot(selected, (s.st_dev, s.st_ino, s.st_size, s.st_mtime_ns, s.st_ctime_ns), cache["sha256"])
        fcntl.flock(lease, fcntl.LOCK_SH)
        connection = sqlite3.connect(selected.as_uri() + "?mode=ro", uri=True, factory=_HotConnection)
        connection.execute("PRAGMA temp_store=MEMORY")
        connection.hot_lease, connection.hot_root, connection.hot_name = lease, root, selected.name
        lease = None
    finally:
        if lease is not None:
            os.close(lease)
        os.close(lock)
    _evict_hot(root, selected.name)
    return connection


def open_readonly_uri(database, *, uri=False, root=None):
    """Compatibility entry point for existing SQLite ``mode=ro`` URI callers."""
    if uri:
        parsed = urlsplit(str(database))
        if parsed.scheme != "file" or parsed.netloc not in ("", "localhost"):
            raise ValueError("Native SQLite URI must be a local file")
        if parse_qs(parsed.query).get("mode") != ["ro"]:
            raise ValueError("Native SQLite adapter accepts read-only URIs")
        database = unquote(parsed.path)
    return open_readonly(database, root=root)


def selected_inventory(target, kind="native-instructions", root=None):
    """Resolve the owning summary, independently of historical folder layout."""
    root = Path(root or ROOT).resolve()
    name = {"native-instructions": "instruction-summary", "unwind-complement": "unwind-complement-summary"}.get(kind)
    if name is None:
        raise ValueError("Unknown native inventory kind")
    summary = json.loads((root / "docs/analysis/coverage" / (name + ".json")).read_text())
    if summary.get("target", {}).get("sha256") != target["sha256"]:
        raise ValueError("Native inventory summary belongs to another target")
    _, path = _root(root / summary["inventory"]["path"], root)
    return path


@lru_cache(maxsize=32)
def _archived_digest(path, signature, expected):
    h = hashlib.sha256()
    length = 0
    with gzip.open(path, "rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
            length += len(block)
    if h.hexdigest() != expected:
        raise ValueError("Archived native SQLite bytes differ")
    return expected, length


def inventory_size(path, root=None):
    """Logical original byte length for archived SQLite, physical size otherwise."""
    value = descriptor(path)
    if value is None or not value.get("source_sha256"):
        return Path(path).stat().st_size
    root, path = _root(path, root)
    historical_file_sha256(path, root=root)
    archive = root / value["archive"]["path"]
    s = archive.stat()
    signature = (s.st_dev, s.st_ino, s.st_size, s.st_mtime_ns, s.st_ctime_ns)
    return _archived_digest(archive, signature, value["source_sha256"])[1]


def historical_file_sha256(path, root=None):
    """Return verified historical SQLite bytes' hash, or None for normal files.

    A migrated receipt is a transport for the original byte stream. This never
    changes a historical manifest's claimed digest to that of a new database.
    New shared-only inventories have no source archive and hash their receipt.
    """
    path = Path(path)
    with path.open("rb") as stream:
        if stream.read(len(MAGIC)) != MAGIC:
            return None
    root, path = _root(path, root)
    value = descriptor(path)
    # Validate the catalog binding even when only a historical hash was asked.
    with _open_chunks_readonly(path, root=root):
        pass
    if not value.get("source_sha256"):
        return None
    receipt = value["archive"]
    expected_path = root / "runtime/analysis/objects" / receipt["sha256"][:2] / receipt["sha256"]
    archive = root / receipt["path"]
    if archive != expected_path or archive.is_symlink() or archive.stat().st_size != receipt["bytes"]:
        raise ValueError("Archived native SQLite object is missing or redirected")
    s = archive.stat()
    signature = (s.st_dev, s.st_ino, s.st_size, s.st_mtime_ns, s.st_ctime_ns)
    # The compressed object digest and original byte stream are both verified.
    if file_digest(archive) != receipt["sha256"]:
        raise ValueError("Compressed native SQLite object digest differs")
    return _archived_digest(archive, signature, value["source_sha256"])[0]


@contextmanager
def _inventory_lock(store, path):
    directory = store.store / "native-locks"
    directory.mkdir(exist_ok=True)
    lock = directory / (hashlib.sha256(str(path).encode()).hexdigest() + ".lock")
    fd = os.open(lock, os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)
    try:
        fcntl.flock(fd, fcntl.LOCK_EX)
        yield
    finally:
        os.close(fd)


def _insert_chunk(connection, snapshot, table, ordinal, rows):
    raw = canonical(rows).encode()
    digest = hashlib.sha256(raw).hexdigest()
    payload = zlib.compress(raw, 9)
    connection.execute("INSERT OR IGNORE INTO native_chunks VALUES(?,?,?)", (digest, payload, len(rows)))
    saved = connection.execute("SELECT payload,rows FROM native_chunks WHERE sha256=?", (digest,)).fetchone()
    if saved[1] != len(rows) or _expand(saved[0], digest).encode() != raw:
        raise ValueError("Existing native row chunk differs")
    previous = connection.execute("SELECT sha256 FROM native_membership WHERE snapshot=? AND table_name=? AND ordinal=?", (snapshot, table, ordinal)).fetchone()
    connection.execute("INSERT OR REPLACE INTO native_membership VALUES(?,?,?,?)", (snapshot, table, ordinal, digest))
    if previous and previous[0] != digest:
        connection.execute("DELETE FROM native_chunks WHERE sha256=? AND NOT EXISTS(SELECT 1 FROM native_membership WHERE sha256=?)", (previous[0], previous[0]))
    return digest


def _index_ranges(store, source, snapshot, metadata, schema, source_path, source_sha256):
    """Index reusable decode inputs without copying their rows/references again."""
    if {t["name"] for t in schema} != {"metadata", "extents", "refs"}:
        return 0
    if (str(source_path.relative_to(store.root)), source_sha256) not in _documented_inventory_receipts(str(store.root)):
        return 0
    generator = metadata.get("generator", {})
    contract = _historical_contract(str(store.root), generator.get("path"), generator.get("sha256"))
    if contract is None:
        return 0
    source.execute("PRAGMA temp_store=MEMORY")
    minimum, maximum, total = source.execute("SELECT min(rowid),max(rowid),count(*) FROM refs").fetchone()
    if total and (minimum != 1 or maximum != total):
        return 0  # Query fidelity is retained; sparse rowids need no guessed cache index.
    references = {};invalid = set()
    for ordinal, first, last, count in source.execute("SELECT extent,min(rowid),max(rowid),count(*) FROM refs GROUP BY extent"):
        if last - first + 1 == count:
            references[ordinal] = (first, count)
        else:
            invalid.add(ordinal)
    rows = []
    count = 0
    with store.connect() as destination:
        for ordinal, start, end, digest, decoded, instructions in source.execute("SELECT ordinal,start,end,sha256,decoded_end,instructions FROM extents ORDER BY ordinal"):
            if ordinal in invalid:
                continue
            first, refs = references.get(ordinal, (None, 0))
            rows.append((digest, start, end, contract, generator.get("decoder_version", ""), snapshot, ordinal, decoded, instructions, first, refs))
            if len(rows) >= 4096:
                _remember_ranges(destination, rows)
                count += len(rows);rows.clear()
        if rows:
            _remember_ranges(destination, rows)
            count += len(rows)
    return count


class DecodeCache:
    """One read-only exact-input lookup session, safe alongside inventory writes.

    No long read transaction or hot-index lease is needed: references are copied
    from committed chunks, verified by their digest and bounded in an LRU. Chunk
    membership is reread so appending to an unfinished snapshot cannot hide new
    reference rows. A target change is allowed only with identical bytes, virtual
    address, extent boundary and decoder contract/version; semantics never move.
    """
    def __init__(self, contract, decoder_version, root=None, chunk_cache_size=32):
        self.connection = None
        self.contract = contract
        self.version = decoder_version
        self.chunk_cache_size = max(0, chunk_cache_size)
        self.chunks = OrderedDict()
        self.metrics = dict(lookups=0, hits=0, misses=0, chunks_read=0,
                            chunks_parsed=0, parsed_chunk_hits=0, lookup_wall_seconds=0.0)
        self.decoders = []
        database = Path(root or ROOT).resolve() / "runtime/analysis/knowledge.sqlite"
        if not database.exists():
            return
        if database.is_symlink():
            raise ValueError("Shared analysis catalog must not be redirected")
        self.connection = sqlite3.connect(database.as_uri() + "?mode=ro", uri=True, timeout=60)
        self.connection.execute("PRAGMA query_only=ON")
        tables = {row[0] for row in self.connection.execute("SELECT name FROM sqlite_master WHERE type='table'")}
        if not {"native_ranges", "native_decoders", "native_snapshots"} <= tables:
            return
        # Resolve decoder profiles once, including only source-verified legacy
        # bridges. Unknown legacy initialization never satisfies a current key.
        self.decoders = [(row[0], None) for row in self.connection.execute(
            "SELECT id FROM native_decoders WHERE contract=? AND version=?", (contract, decoder_version))]
        if "native_decoder_compat" in tables:
            self.decoders.extend(self.connection.execute(
                "SELECT legacy_decoder,snapshot FROM native_decoder_compat WHERE contract=? AND version=? ORDER BY snapshot,legacy_decoder",
                (contract, decoder_version)).fetchall())

    def __enter__(self):
        return self

    def __exit__(self, *arguments):
        self.close()

    def close(self):
        if self.connection is not None:
            self.connection.close();self.connection = None
        self.chunks.clear()

    def lookup_many(self, extents):
        """Yield results in input order without reopening/schema-checking SQLite."""
        return [self.lookup(digest, start, end) for digest, start, end in extents]

    def lookup(self, raw_sha256, start, end):
        began = time.perf_counter()
        self.metrics["lookups"] += 1
        try:
            result = self._lookup(raw_sha256, start, end)
            self.metrics["misses" if result is None else "hits"] += 1
            return result
        finally:
            self.metrics["lookup_wall_seconds"] += time.perf_counter() - began

    def _lookup(self, raw_sha256, start, end):
        if self.connection is None:
            return None
        row = None
        for decoder, snapshot in self.decoders:
            sql = "SELECT s.id,r.ordinal,r.decoded_end,r.instructions,r.refs_first,r.refs_count FROM native_ranges r JOIN native_snapshots s ON s.rowid=r.snapshot WHERE r.range_sha256=? AND r.start=? AND r.end=? AND r.decoder=?"
            parameters = (_range_key(raw_sha256), start, end, decoder)
            if snapshot is not None:
                sql += " AND r.snapshot=?";parameters += (snapshot,)
            row = self.connection.execute(sql, parameters).fetchone()
            if row is not None:
                break
        if row is None:
            return None
        snapshot, ordinal, decoded, instructions, first, total = row
        if not start <= decoded <= end or instructions < 0 or total < 0 or (total and (first is None or first < 1)):
            raise ValueError("Shared decode extent accounting differs")
        references = []
        if total:
            for chunk in range((first - 1) // CHUNK_ROWS, (first + total - 2) // CHUNK_ROWS + 1):
                value = self.connection.execute("SELECT c.payload,c.sha256 FROM native_membership m JOIN native_chunks c ON c.sha256=m.sha256 WHERE m.snapshot=? AND m.table_name='refs' AND m.ordinal=?", (snapshot, chunk)).fetchone()
                if value is None:
                    raise ValueError("Shared decode reference chunk is missing")
                payload, digest = value
                self.metrics["chunks_read"] += 1
                cached = self.chunks.get(digest)
                if cached is None or cached[0] != payload:
                    rows = json.loads(_expand(payload, digest))
                    rowids = [row[0] for row in rows]
                    if any(left >= right for left,right in zip(rowids,rowids[1:])):
                        raise ValueError("Shared decode reference chunk row order differs")
                    self.metrics["chunks_parsed"] += 1
                    if self.chunk_cache_size:
                        self.chunks[digest] = (payload, rows, rowids)
                        if len(self.chunks) > self.chunk_cache_size:
                            self.chunks.popitem(last=False)
                else:
                    rows, rowids = cached[1:]
                    self.chunks.move_to_end(digest)
                    self.metrics["parsed_chunk_hits"] += 1
                for r in rows[bisect_left(rowids,first):bisect_left(rowids,first+total)]:
                    if r[1] != ordinal:
                        raise ValueError("Shared decode references belong to another extent")
                    references.append(tuple(r[2:]))
            if len(references) != total:
                raise ValueError("Shared decode reference index is incomplete")
        return decoded - start, instructions, references


def reuse_decoded_extent(raw_sha256, start, end, contract, decoder_version, root=None):
    """Compatibility helper; bulk callers should keep one DecodeCache session."""
    with DecodeCache(contract, decoder_version, root=root) as cache:
        return cache.lookup(raw_sha256, start, end)


def upgrade_decoder_contracts(root=None, apply=False):
    """Bridge old keys through exact original source without rewriting evidence.

    Provenance is per source snapshot: equal algorithm-only keys never imply
    equal initialization. Unknown sources/options remain unmatched, and neither
    their rows nor original metadata are removed. No decoding is performed.
    """
    root = Path(root or ROOT).resolve()
    database = root / "runtime/analysis/knowledge.sqlite"
    if not database.exists():
        return {"profiles": [], "source_verified": 0, "applied": False}
    with closing(sqlite3.connect(database.as_uri() + "?mode=ro", uri=True)) as connection:
        groups = connection.execute("SELECT DISTINCT r.snapshot,r.decoder,d.contract,d.version,s.metadata,s.id FROM native_ranges r JOIN native_decoders d ON d.id=r.decoder JOIN native_snapshots s ON s.rowid=r.snapshot").fetchall()
    verified = [];profiles = []
    for snapshot, decoder, old_contract, version, metadata_json, identity in groups:
        metadata = json.loads(metadata_json);generator = metadata.get("generator", {})
        source_path, source_sha = generator.get("path"), generator.get("sha256")
        source = _historical_decoder_source(str(root), source_path, source_sha)
        record = {"snapshot": identity, "legacy_decoder": decoder, "source_sha256": source_sha}
        if source is None:
            profiles.append({**record, "state": "source-unavailable"});continue
        if generator.get("decoder_version") != version:
            profiles.append({**record, "state": "decoder-version-differs"});continue
        try:
            strengthened = decoder_contract(source)
            legacy = _legacy_decoder_contract(source)
            setup_sha = hashlib.sha256(canonical(_decoder_setup(ast.parse(source))).encode()).hexdigest()
        except ValueError as error:
            profiles.append({**record, "state": "unsupported-configuration", "reason": str(error)});continue
        if old_contract == strengthened:
            profiles.append({**record, "state": "already-strengthened"});continue
        if old_contract != legacy:
            profiles.append({**record, "state": "original-algorithm-differs"});continue
        verified.append((snapshot, decoder, strengthened, version, source_path, source_sha, legacy, setup_sha))
        profiles.append({**record, "state": "source-verified", "contract": strengthened, "initialization_sha256": setup_sha})
    if apply:
        with SharedAnalysis(root).connect() as connection:
            _initialize(connection)
            for row in verified:
                old = connection.execute("SELECT contract,version,source_path,source_sha256,legacy_contract,initialization_sha256 FROM native_decoder_compat WHERE snapshot=? AND legacy_decoder=?", row[:2]).fetchone()
                if old is not None and old != row[2:]:
                    raise ValueError("Native decoder compatibility proof changed")
                connection.execute("INSERT OR IGNORE INTO native_decoder_compat VALUES(?,?,?,?,?,?,?,?)", row)
    return {"profiles": profiles, "source_verified": len(verified), "applied": apply,
            "ranges_rewritten": 0, "original_metadata_changed": False}


def _write_receipt(path, root, snapshot, logical, source=None, archive=None):
    value = {"format": "rea-shared-native-inventory-v1", "catalog": "runtime/analysis/knowledge.sqlite",
             "snapshot": snapshot, "logical_sha256": logical, "source_sha256": source, "archive": archive}
    data = MAGIC + (canonical(value) + "\n").encode()
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, pending = tempfile.mkstemp(prefix=".native-receipt-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(data); stream.flush(); os.fsync(stream.fileno())
        os.replace(pending, path)
    finally:
        Path(pending).unlink(missing_ok=True)
    return hashlib.sha256(data).hexdigest()


class NativeWriter:
    """Append native extents to shared chunks, keeping interrupted progress.

    This writer owns a single target/decoder lineage. Historical snapshot chunks
    can seed it by reference; additions never mutate the archived snapshot.
    """
    def __init__(self, path, metadata, root=None, inherit_from=None):
        self.root, self.path = _root(path, root)
        self.store = SharedAnalysis(self.root)
        self._guard = _inventory_lock(self.store, self.path)
        self._guard.__enter__()
        self.metadata = metadata
        self.snapshot = hashlib.sha256(("native-writer-v1:" + canonical(metadata)).encode()).hexdigest()
        if self.path.exists():
            previous = descriptor(self.path)
            if previous is None or previous.get("snapshot") != self.snapshot:
                raise ValueError("Existing native writer receipt belongs to another target/profile")
        self.schema = [
            {"name": "extents", "columns": ["ordinal", "start", "end", "file_offset", "sha256", "decoded_end", "instructions"], "sql": None},
            {"name": "metadata", "columns": ["id", "value"], "sql": None},
            {"name": "refs", "columns": ["extent", "site", "bytes", "kind", "target", "operand", "access"], "sql": None}]
        self.buffers = {};self.ordinals = {};self.counts = {};self.range_rows = [];self.reader = None
        with self.store.connect() as connection:
            _initialize(connection)
            saved = connection.execute("SELECT metadata FROM native_snapshots WHERE id=?", (self.snapshot,)).fetchone()
        if saved and json.loads(saved[0]) != metadata:
            raise ValueError("Shared native writer metadata differs")
        if not saved:
            source = None
            if inherit_from and Path(inherit_from).exists():
                inherit_from = Path(inherit_from)
                if descriptor(inherit_from) is None:
                    migrate_inventory(inherit_from, root=self.root, apply=True)
            with self.store.connect() as connection:
                candidates = connection.execute("SELECT s.id,s.metadata,COALESCE(sum(c.rows),0) AS extent_count FROM native_snapshots s LEFT JOIN native_membership m ON m.snapshot=s.id AND m.table_name='extents' LEFT JOIN native_chunks c ON c.sha256=m.sha256 WHERE s.target_sha256=? AND s.complete=1 GROUP BY s.id ORDER BY extent_count DESC,s.id", (metadata.get("target_sha256"),)).fetchall()
            for snapshot, saved_metadata, _ in candidates:
                old = json.loads(saved_metadata)
                old_generator, new_generator = old.get("generator", {}), metadata.get("generator", {})
                old_contract = _historical_contract(str(self.root), old_generator.get("path"), old_generator.get("sha256")) or old.get("decoder_contract")
                equivalent = (
                    old.get("target_sha256") == metadata.get("target_sha256") and
                    old.get("unwind_records_sha256") == metadata.get("unwind_records_sha256") and
                    old_generator.get("decoder_version") == new_generator.get("decoder_version") and
                    old_generator.get("parser_sha256") == new_generator.get("parser_sha256") and
                    old_contract is not None and old_contract == metadata.get("decoder_contract"))
                if old == metadata or equivalent:
                    source = {"snapshot": snapshot}
                    break
            with self.store.connect() as connection:
                connection.execute("INSERT INTO native_snapshots(id,target_sha256,metadata,schema_json) VALUES(?,?,?,?)", (self.snapshot, metadata.get("target_sha256"), canonical(metadata), canonical(self.schema)))
                if source:
                    connection.execute("INSERT INTO native_membership SELECT ?,table_name,ordinal,sha256 FROM native_membership WHERE snapshot=? AND table_name!='metadata'", (self.snapshot, source["snapshot"]))
                _insert_chunk(connection, self.snapshot, "metadata", 0, [(1, 1, canonical(metadata))])
        for table in ("extents", "refs"):
            with self.store.connect() as connection:
                count, total, tail = connection.execute(
                    "SELECT count(*),coalesce(sum(c.rows),0),max(m.ordinal) FROM native_membership m "
                    "JOIN native_chunks c ON c.sha256=m.sha256 WHERE m.snapshot=? AND m.table_name=?",
                    (self.snapshot, table)).fetchone()
                last = connection.execute(
                    "SELECT c.payload,c.sha256 FROM native_membership m JOIN native_chunks c ON c.sha256=m.sha256 "
                    "WHERE m.snapshot=? AND m.table_name=? AND m.ordinal=? AND c.rows<?",
                    (self.snapshot, table, tail, CHUNK_ROWS)).fetchone()
            self.counts[table] = total
            self.ordinals[table] = count
            self.buffers[table] = []
            if last:
                self.ordinals[table] = tail
                self.buffers[table] = json.loads(_expand(*last))
        self.commit()

    def execute(self, sql, parameters=()):
        return self.reader.execute(sql, parameters)

    def store_extent(self, row, refs):
        ordinal, start, end, offset, digest, decoded, instructions = row
        if ordinal != self.counts["extents"]:
            raise ValueError("Shared native extents must append in ordinal order")
        self.buffers["extents"].append((ordinal, *row));self.counts["extents"] += 1
        first = self.counts["refs"] + 1 if refs else None
        for reference in refs:
            self.counts["refs"] += 1
            self.buffers["refs"].append((self.counts["refs"], ordinal, *reference))
        generator = self.metadata.get("generator", {})
        contract = self.metadata.get("decoder_contract")
        if contract:
            self.range_rows.append((digest, start, end, contract, generator.get("decoder_version", ""), self.snapshot, ordinal, decoded, instructions, first, len(refs)))

    def commit(self):
        if self.reader:
            self.reader.close();self.reader = None
        with self.store.connect() as connection:
            for table, buffer in self.buffers.items():
                while buffer:
                    count = min(len(buffer), CHUNK_ROWS)
                    _insert_chunk(connection, self.snapshot, table, self.ordinals[table], buffer[:count])
                    if count < CHUNK_ROWS:
                        break
                    del buffer[:count];self.ordinals[table] += 1
            if self.range_rows:
                _remember_ranges(connection, self.range_rows)
                self.range_rows.clear()
            logical = _logical(connection, self.snapshot, self.metadata, self.schema)
            connection.execute("UPDATE native_snapshots SET logical_sha256=?,complete=1 WHERE id=?", (logical, self.snapshot))
        _write_receipt(self.path, self.root, self.snapshot, logical)
        self.reader = _open_chunks_readonly(self.path, root=self.root)

    def close(self):
        if self.reader:
            self.reader.close();self.reader = None
        if self._guard:
            self._guard.__exit__(None, None, None);self._guard = None

    def __del__(self):
        if getattr(self, "_guard", None):
            self._guard.__exit__(None, None, None);self._guard = None


def verify_inventory(path, root=None):
    """Verify canonical chunks and archive identities, independently of hot cache."""
    root, path = _root(path, root)
    value = descriptor(path)
    digest = historical_file_sha256(path, root=root)
    if value is None:
        with open_readonly(path, root=root) as connection:
            schema = _schema(connection)
            tables = {t["name"]: connection.execute("SELECT count(*) FROM " + _quoted(t["name"])).fetchone()[0] for t in schema}
    else:
        tables = {}
        with _open_chunks_readonly(path, root=root) as connection:
            schema = json.loads(connection.execute("SELECT schema_json FROM native_snapshots WHERE id=?", (value["snapshot"],)).fetchone()[0])
            for table in schema:
                count = 0
                for payload, chunk_sha, rows in connection.execute("SELECT c.payload,c.sha256,c.rows FROM native_membership m JOIN native_chunks c ON c.sha256=m.sha256 WHERE m.snapshot=? AND m.table_name=? ORDER BY m.ordinal", (value["snapshot"], table["name"])):
                    observed = json.loads(_expand(payload, chunk_sha))
                    if len(observed) != rows or any(len(r) != len(table["columns"]) + 1 for r in observed):
                        raise ValueError("Shared native chunk row shape/count differs")
                    count += rows
                tables[table["name"]] = count
    return {"path": str(path.relative_to(root)), "verified_sha256": digest, "tables": tables}


def migrate_inventory(path, root=None, apply=False):
    """Archive and pack one immutable SQLite inventory, then atomically replace it.

    A failed/interrupted import leaves the original byte stream in place. A
    retry reuses committed chunks and only publishes a complete verified receipt.
    No Ghidra, decoder, target or compiler is started.
    """
    root, path = _root(path, root)
    if path.is_symlink():
        raise ValueError("Resolve native inventory aliases before migration")
    existing = descriptor(path)
    if existing is not None:
        digest = historical_file_sha256(path, root)
        return {"path": str(path.relative_to(root)), "state": "already-shared", "source_sha256": digest}
    with path.open("rb") as stream:
        if stream.read(16) != SQLITE_MAGIC:
            raise ValueError("Not a native SQLite inventory")
    for suffix in ("-wal", "-journal"):
        sibling = Path(str(path) + suffix)
        if sibling.exists() and sibling.stat().st_size:
            raise ValueError("Native inventory has an active/recovery journal")
    size = path.stat().st_size
    with closing(sqlite3.connect(path.as_uri() + "?mode=ro", uri=True)) as source:
        schema = _schema(source)
        metadata = _metadata(source, schema)
        if not (any(t["name"] == "extents" for t in schema) or any(t["name"] == "regions" for t in schema)):
            raise ValueError("SQLite file is not a recognized native instruction inventory")
        if not apply:
            return {"path": str(path.relative_to(root)), "state": "candidate", "bytes": size,
                    "tables": {t["name"]: source.execute("SELECT count(*) FROM " + _quoted(t["name"])).fetchone()[0] for t in schema}}
    store = SharedAnalysis(root)
    with _inventory_lock(store, path):
        original = file_digest(path)
        snapshot = hashlib.sha256(("native-sqlite-original-v1:" + original).encode()).hexdigest()
        with store.connect() as destination:
            _initialize(destination)
            old = destination.execute("SELECT metadata,schema_json FROM native_snapshots WHERE id=?", (snapshot,)).fetchone()
            if old is not None and old != (canonical(metadata), canonical(schema)):
                raise ValueError("Native snapshot commitment differs")
            destination.execute("INSERT OR IGNORE INTO native_snapshots(id,target_sha256,metadata,schema_json) VALUES(?,?,?,?)",
                                (snapshot, metadata.get("target_sha256", metadata.get("target", {}).get("sha256")), canonical(metadata), canonical(schema)))
        with closing(sqlite3.connect(path.as_uri() + "?mode=ro", uri=True)) as source:
            source.execute("BEGIN")
            for table in schema:
                cursor = source.execute("SELECT rowid,* FROM " + _quoted(table["name"]) + " ORDER BY rowid")
                ordinal = 0
                while rows := cursor.fetchmany(CHUNK_ROWS):
                    with store.connect() as destination:
                        _insert_chunk(destination, snapshot, table["name"], ordinal, rows)
                    ordinal += 1
                with store.connect() as destination:
                    destination.execute("DELETE FROM native_membership WHERE snapshot=? AND table_name=? AND ordinal>=?", (snapshot, table["name"], ordinal))
            _index_ranges(store, source, snapshot, metadata, schema, path, original)
            source.rollback()
        # Lossless archival is a proof/recovery input, not an expanded second DB.
        staging = store.store / "native-staging"
        staging.mkdir(exist_ok=True)
        fd, pending = tempfile.mkstemp(prefix="sqlite-", suffix=".gz", dir=staging)
        try:
            with os.fdopen(fd, "wb") as output, path.open("rb") as source:
                with gzip.GzipFile(filename="", mode="wb", fileobj=output, mtime=0, compresslevel=6) as archive:
                    for block in iter(lambda: source.read(1024 * 1024), b""):
                        archive.write(block)
                output.flush()
                os.fsync(output.fileno())
            receipt = store.put_file(Path(pending), kind="native-sqlite-archive", provenance={"source_path": str(path.relative_to(root)), "source_sha256": original, "snapshot": snapshot})
        finally:
            Path(pending).unlink(missing_ok=True)
        if file_digest(path) != original:
            raise ValueError("Native SQLite changed during migration; original preserved")
        archive_path = store.verify_receipt(receipt)
        if _archived_digest(archive_path, tuple(archive_path.stat()), original)[0] != original:
            raise ValueError("Lossless native SQLite archive differs")
        with store.connect() as destination:
            logical = _logical(destination, snapshot, metadata, schema)
            destination.execute("UPDATE native_snapshots SET logical_sha256=?,complete=1,source_sha256=?,archive_json=? WHERE id=?",
                                (logical, original, canonical(receipt), snapshot))
        # Validate every saved chunk before removing the expanded original.
        with store.connect() as destination:
            for payload, digest in destination.execute("SELECT c.payload,c.sha256 FROM native_chunks c JOIN native_membership m ON m.sha256=c.sha256 WHERE m.snapshot=?", (snapshot,)):
                _expand(payload, digest)
        if file_digest(path) != original:
            raise ValueError("Native SQLite changed before receipt publication")
        descriptor_sha = _write_receipt(path, root, snapshot, logical, original, receipt)
        with store.connect() as destination:
            destination.execute("INSERT OR REPLACE INTO native_sources VALUES(?,?,?,?)", (str(path.relative_to(root)), snapshot, original, descriptor_sha))
        with open_readonly(path, root=root) as connection:
            for table in schema:
                connection.execute("SELECT count(*) FROM " + _quoted(table["name"])).fetchone()
        return {"path": str(path.relative_to(root)), "state": "migrated", "source_sha256": original,
                "snapshot": snapshot, "original_bytes": size, "archive_bytes": receipt["bytes"], "descriptor_bytes": path.stat().st_size}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="*", help="Native SQLite paths (default: all registered coverage inventories)")
    parser.add_argument("--apply", action="store_true", help="Pack, verify, archive and publish shared receipts")
    parser.add_argument("--verify", action="store_true", help="Verify migrated receipts, archives and all table rows")
    parser.add_argument("--upgrade-decoder-contracts", action="store_true", help="Bind legacy decode keys to verified original architecture/mode/options; --apply publishes compatibility proofs")
    args = parser.parse_args()
    if args.upgrade_decoder_contracts:
        if args.paths or args.verify:
            parser.error("Decoder contract upgrade does not take inventory paths or --verify")
        print(canonical(upgrade_decoder_contracts(apply=args.apply)), flush=True)
        return
    paths = ([ROOT / value for value in args.paths] if args.paths else
             sorted(p for p in (ROOT / "runtime/coverage").glob("*/*.sqlite")
                    if p.name in ("native-instructions.sqlite", "unwind-complement.sqlite")))
    for path in paths:
        if args.verify:
            print(canonical(verify_inventory(path)), flush=True)
        else:
            print(canonical(migrate_inventory(path, apply=args.apply)), flush=True)


if __name__ == "__main__":
    main()
