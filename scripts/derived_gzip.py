"""Stream-check derived UTF-8 gzip content; publish only when explicitly asked.

Verification reads the existing artifact without creating a comparison file.
Publication stages deterministic gzip bytes beside the destination, preserves
any existing gzip/header when its decoded content matches, and replaces only
after the producer finishes successfully. Temporary files stay project-local.
"""
from contextlib import contextmanager
import gzip
import io
import os
from pathlib import Path
import tempfile
import zlib

from coverage_common import ROOT, project_path

CHUNK_SIZE = 1024 * 1024


class DerivedGzipMismatch(ValueError):
    """A retained derived artifact is absent, invalid, or has different content."""


class _VerifyingTextWriter:
    def __init__(self, stream, path):
        self.stream, self.path = stream, path

    def write(self, text):
        data = text.encode("utf-8")
        for start in range(0, len(data), CHUNK_SIZE):
            chunk = data[start:start + CHUNK_SIZE]
            if self.read(len(chunk)) != chunk:
                raise DerivedGzipMismatch(f"Derived gzip content differs: {self.path}")
        return len(text)

    def read(self, count):
        try:
            return self.stream.read(count)
        except (gzip.BadGzipFile, EOFError, zlib.error) as error:
            raise DerivedGzipMismatch(f"Derived gzip artifact is invalid: {self.path}") from error

    def finish(self):
        if self.read(1):
            raise DerivedGzipMismatch(f"Derived gzip content differs: {self.path}")


def _same_content(first, second):
    try:
        with gzip.open(first, "rb") as left, gzip.open(second, "rb") as right:
            while True:
                chunk = left.read(CHUNK_SIZE)
                if chunk != right.read(CHUNK_SIZE):
                    return False
                if not chunk:
                    return True
    except (gzip.BadGzipFile, EOFError, zlib.error):
        return False


@contextmanager
def derived_gzip_text(path, *, publish=False):
    """Yield a write-only text sink for a checked or explicitly published artifact.

An equal payload always preserves the original compressed bytes and mtime.
Read-only verification rejects missing/changed/invalid content. New or changed
published payloads use an empty gzip filename and mtime zero. Producer and I/O
exceptions leave the destination untouched and remove only this call's staging
file. Callers must let exceptions escape the context for publication to abort.
"""
    # Validate the resolved target, but retain a final file alias so changed
    # publication replaces that alias rather than an immutable shared object.
    project_path(path)
    path = Path(path)
    if not path.is_absolute():
        path = ROOT / path
    path = path.parent.resolve() / path.name
    if not publish:
        try:
            existing = gzip.open(path, "rb")
        except FileNotFoundError as error:
            raise DerivedGzipMismatch(f"Derived gzip artifact is missing: {path}") from error
        with existing:
            writer = _VerifyingTextWriter(existing, path)
            yield writer
            writer.finish()
        return

    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".tmp", dir=path.parent)
    temporary = Path(temporary)
    try:
        with os.fdopen(descriptor, "wb") as raw:
            with gzip.GzipFile(filename="", mode="wb", fileobj=raw, mtime=0) as compressed:
                with io.TextIOWrapper(compressed, encoding="utf-8", newline="") as writer:
                    yield writer
        if not path.exists() or not _same_content(path, temporary):
            os.replace(temporary, path)
    finally:
        temporary.unlink(missing_ok=True)
