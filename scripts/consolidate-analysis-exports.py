#!/usr/bin/env python3
"""Consolidate identical retained analysis exports without an EXE or compilation.

The curated index binds each alias to one target and exact file digest. Historical
plans and reports keep their paths and bytes; only duplicate storage is replaced.
Default operation verifies the index. --scan prints an expanded index for review;
--apply creates read-only canonical files and relative aliases inside runtime/.
"""

import argparse
from collections import defaultdict
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import tempfile
import uuid

ROOT = Path(__file__).resolve().parents[1]
INDEX = 'docs/analysis/evidence/native-export-storage.json'
STORE = Path('runtime/analysis-exports')
EXPORT_SUFFIXES = {'.json', '.jsonl', '.tsv', '.gz', '.bin', '.asm', '.c'}
HEX = re.compile(r'[0-9a-f]{64}')


def local_path(root, value):
    path = PurePosixPath(value)
    if path.is_absolute() or '..' in path.parts or '\\' in value:
        raise ValueError(f'Invalid project-relative path: {value}')
    result = root / path
    if not result.parent.resolve().is_relative_to(root.resolve()):
        raise ValueError(f'Path leaves project: {value}')
    return result


def digest(path):
    before = path.stat()
    result = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            result.update(block)
    after = path.stat()
    if (before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) != (
            after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns):
        raise ValueError(f'Export changed while hashing: {path}')
    return result.hexdigest()


def roots_for(index, root):
    if index.get('schema_version') != 1 or index.get('minimum_bytes', 0) <= 0:
        raise ValueError('Unsupported export-storage index')
    registry = json.loads((root / 'docs/analysis/coverage/targets.json').read_text())
    targets = {(row['version'], row['sha256']) for row in registry['targets']}
    roots = []
    for entry in index['roots']:
        if (entry['target_version'], entry['target_sha256']) not in targets:
            raise ValueError('Export root has an unregistered historical target')
        path = local_path(root, entry['path'])
        parts = path.relative_to(root).parts
        allowed = (len(parts) == 3 and parts[:2] == ('runtime', 'coverage') and
                   parts[2] == entry['target_sha256']) or (
                   len(parts) == 2 and parts[0] == 'runtime' and
                   parts[1].startswith(('fixgap', 'execheck')) and entry['target_version'] in parts[1])
        if (not allowed
                or path.is_symlink() or path.resolve() != path):
            raise ValueError(f'Not an analysis root: {entry["path"]}')
        if any(path.is_relative_to(old) or old.is_relative_to(path) for old, _ in roots):
            raise ValueError('Analysis roots overlap')
        roots.append((path, entry['target_sha256']))
    return roots


def validate(index, root):
    """Validate every planned replacement before changing any file."""
    roots = roots_for(index, root)
    seen, canonical_paths, prepared = set(), set(), []
    for group in index['groups']:
        target, expected, size = group['target_sha256'], group['sha256'], group['bytes']
        if not HEX.fullmatch(target) or not HEX.fullmatch(expected) or size < index['minimum_bytes']:
            raise ValueError('Invalid export commitment')
        paths = group['paths']
        if len(paths) < 2 or len(set(paths)) != len(paths):
            raise ValueError('An export group requires distinct historical paths')
        canonical = local_path(root, group['canonical'])
        required = root / STORE / target / expected
        # The historical target-bound index remains the provenance authority;
        # equal payload bytes now live once in the shared cross-target CAS.
        shared = root / 'runtime/analysis/objects' / expected[:2] / expected
        if (canonical != required or canonical.resolve() not in (canonical, shared)
                or canonical in canonical_paths):
            raise ValueError('Invalid or duplicate canonical export path')
        canonical_paths.add(canonical)
        if canonical.exists() and (not canonical.is_file() or canonical.stat().st_size != size or digest(canonical) != expected):
            raise ValueError(f'Canonical export differs: {canonical}')
        sources, aliases = [], []
        for name in paths:
            path = local_path(root, name)
            if path in seen or not any(path.is_relative_to(base) and path != base and sha == target for base, sha in roots):
                raise ValueError(f'Duplicate, protected or wrongly bound alias: {name}')
            seen.add(path)
            if path.parent.resolve() != path.parent:
                raise ValueError(f'Alias parent is redirected: {name}')
            if path.is_symlink():
                if os.path.isabs(os.readlink(path)) or path.resolve() != canonical.resolve():
                    raise ValueError(f'Alias points outside its canonical export: {name}')
            elif path.exists():
                if not path.is_file() or path.stat().st_size != size or digest(path) != expected:
                    raise ValueError(f'Historical export differs: {name}')
                sources.append(path)
            aliases.append(path)
        if not canonical.is_file() and not sources:
            raise ValueError('No retained bytes available for export group')
        prepared.append((group, canonical, sources, aliases))
    return prepared


def scan(index, root):
    """Find byte-identical large exports only within explicitly bound roots."""
    validate(index, root)
    grouped = {(g['target_sha256'], g['sha256']): dict(g, paths=list(g['paths'])) for g in index['groups']}
    sizes = defaultdict(list)
    for base, target in roots_for(index, root):
        for parent, dirs, files in os.walk(base, followlinks=False):
            dirs[:] = sorted(name for name in dirs if not (Path(parent) / name).is_symlink())
            for name in sorted(files):
                path = Path(parent) / name
                if path.is_symlink() or path.suffix not in EXPORT_SUFFIXES:
                    continue
                size = path.stat().st_size
                if size >= index['minimum_bytes']:
                    sizes[(target, size)].append(path)
    for (target, size), paths in sizes.items():
        if len(paths) < 2 and not any(g['target_sha256'] == target and g['bytes'] == size for g in grouped.values()):
            continue
        for path in paths:
            sha = digest(path)
            key = target, sha
            if key not in grouped:
                grouped[key] = {'target_sha256': target, 'sha256': sha, 'bytes': size,
                                'canonical': (STORE / target / sha).as_posix(), 'paths': []}
            name = path.relative_to(root).as_posix()
            if name not in grouped[key]['paths']:
                grouped[key]['paths'].append(name)
    groups = []
    for group in grouped.values():
        if len(group['paths']) > 1:
            group['paths'].sort()
            groups.append(group)
    result = dict(index, groups=sorted(groups, key=lambda g: (g['target_sha256'], g['sha256'])))
    validate(result, root)
    return result


def consolidate(index, root, apply=False):
    prepared = validate(index, root)
    redundant = sum(g['bytes'] * (len(sources) - int(not canonical.exists()))
                    for g, canonical, sources, _ in prepared)
    if apply:
        for group, canonical, sources, aliases in prepared:
            if not canonical.exists():
                canonical.parent.mkdir(parents=True, exist_ok=True)
                with tempfile.NamedTemporaryFile(dir=canonical.parent, prefix='.export-', delete=False) as stream:
                    temporary = Path(stream.name)
                try:
                    shutil.copyfile(sources[0], temporary)
                    if temporary.stat().st_size != group['bytes'] or digest(temporary) != group['sha256']:
                        raise ValueError('Export changed before canonical snapshot')
                    temporary.chmod(stat.S_IRUSR | stat.S_IRGRP | stat.S_IROTH)
                    os.link(temporary, canonical)  # Exclusive publication; never overwrite retained bytes.
                finally:
                    temporary.unlink(missing_ok=True)
            canonical.chmod(stat.S_IRUSR | stat.S_IRGRP | stat.S_IROTH)
            for alias in aliases:
                if alias.is_symlink():
                    continue
                if alias.exists() and digest(alias) != group['sha256']:
                    raise ValueError('Export changed before alias replacement')
                alias.parent.mkdir(parents=True, exist_ok=True)
                temporary = alias.with_name('.' + alias.name + '.alias-' + uuid.uuid4().hex)
                try:
                    temporary.symlink_to(os.path.relpath(canonical, alias.parent))
                    temporary.replace(alias)
                finally:
                    temporary.unlink(missing_ok=True)
        validate(index, root)
    return {'groups': len(prepared), 'historical_paths': sum(len(paths) for _, _, _, paths in prepared),
            'redundant_bytes': redundant, 'applied': apply}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--index', default=INDEX)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--scan', action='store_true', help='Print a proposed index without changing files')
    mode.add_argument('--apply', action='store_true', help='Replace verified duplicate copies with relative aliases')
    args = parser.parse_args()
    index = json.loads(local_path(ROOT, args.index).read_text())
    result = scan(index, ROOT) if args.scan else consolidate(index, ROOT, args.apply)
    print(json.dumps(result, indent=2) + '\n', end='')


if __name__ == '__main__':
    main()
