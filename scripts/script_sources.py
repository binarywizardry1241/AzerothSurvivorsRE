#!/usr/bin/env python3
"""Resolve stable script names and verify historical execution sources in Git.

Relocations never make changed code satisfy an old source hash. Historical
acceptance requires the exact committed bytes; native target guards are separate.
"""
import argparse
import ast
from functools import lru_cache
import hashlib
import importlib.util
import json
from pathlib import Path, PurePosixPath
import re
import subprocess
import sys

from artifact_history import archived_artifact, archived_replacement, committed_bytes, has_archived_artifact
from runtime_layout import retained_runtime_path

ROOT = Path(__file__).resolve().parents[1]
INDEX = 'docs/analysis/script-provenance.json'
REPORT_INDEX = 'docs/analysis/report-provenance.json'


@lru_cache(maxsize=8)
def provenance(root=ROOT):
    path = root / INDEX
    return json.loads(path.read_text()) if path.is_file() else {'relocations': {}}


@lru_cache(maxsize=8)
def report_provenance(root=ROOT):
    path = root / REPORT_INDEX
    return json.loads(path.read_text()) if path.is_file() else {'reports': {}}


@lru_cache(maxsize=512)
def retained_report(name, expected=None, root=ROOT):
    """Read original report bytes, separate from the maintained topic guide."""
    index = report_provenance(root)
    path = PurePosixPath(name)
    commit = index.get('source_commit', '')
    if (path.is_absolute() or '..' in path.parts or path.suffix != '.md' or path.parts[0] != 'docs'
            or name not in index['reports'] or not re.fullmatch('[0-9a-f]{40}', commit)):
        raise ValueError(f'No archived report commitment for {name}')
    return committed_bytes(name, commit, expected, root)


def current_path(value, root=ROOT):
    """Resolve former paths for live links/imports, never for recorded hashes."""
    path = Path(value)
    if path.is_absolute():
        try:
            name = path.relative_to(root).as_posix()
        except ValueError:
            return path
    else:
        name = path.as_posix()
    if (root / name).is_file():
        return root / name
    if name.startswith('runtime/'):
        return retained_runtime_path(root / name, root)
    record = provenance(root)['relocations'].get(name)
    report = report_provenance(root)['reports'].get(name)
    replacement = root / (record['replacement'] if record else report or name)
    if not record and not report:
        replacement = archived_replacement(name, root) or replacement
    if not replacement.resolve().is_relative_to(root.resolve()):
        raise ValueError('Script relocation leaves the project')
    return replacement


def load_script(name, reference, root=ROOT):
    """Load a fresh project-local module through its stable source path."""
    path = Path(reference)
    if not path.is_absolute():
        path = root / (path if len(path.parts) > 1 else Path('scripts') / path)
    path = current_path(path, root).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError('Script import leaves the project')
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f'Not an importable project script: {reference}')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def historical_source(name, expected, root=ROOT):
    """Return exact pre-migration source only when its Git bytes match the digest."""
    index = provenance(root)
    candidates = [(former, record.get('source_commit', index.get('source_commit', '')))
                  for former, record in index['relocations'].items()
                  if former == name or record['replacement'] == name]
    retained = index.get('retained_execution_sources', {}).get(name)
    if retained:
        candidates.append((name, retained['source_commit']))
    for commit, paths in index.get('storage_predecessors', {}).items():
        if name in paths:
            candidates.append((name, commit))
    if not candidates or not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected):
        raise ValueError('No historical source commitment for this script')
    for former, commit in candidates:
        path = PurePosixPath(former)
        if (path.is_absolute() or '..' in path.parts or path.parts[0] != 'scripts' or
                not re.fullmatch('[0-9a-f]{40}', commit)):
            raise ValueError('Invalid historical source boundary')
        try:
            return committed_bytes(former, commit, expected, root)
        except ValueError:
            continue
    raise ValueError('Exact historical script bytes are unavailable; retain Git history')


def historical_matches(name, expected, root=ROOT):
    try:
        historical_source(name, expected, root)
        return True
    except (OSError, ValueError):
        return False


def recorded_input_matches(value, expected, root=ROOT):
    """Verify a recorded input against live bytes or an explicit Git archive."""
    path = Path(value)
    if not path.is_absolute():
        path = root / path
    try:
        name = path.resolve().relative_to(root.resolve()).as_posix()
    except ValueError:
        return False
    current = current_path(path, root)
    if has_archived_artifact(name, root):
        if not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected):
            return False
        try:
            return archived_artifact(name, expected, root) is not None
        except (OSError, ValueError):
            return False
    if current != path and name in report_provenance(root)['reports']:
        if not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected):
            return False
        try:
            retained_report(name, expected, root)
            return True
        except (OSError, ValueError):
            return False
    if current.is_file():
        from coverage_common import file_sha256
        try:
            if file_sha256(current) == expected:
                return True
        except (OSError, ValueError):
            return False
    return name.startswith('scripts/') and historical_matches(name, expected, root)


class _RecordedInputChecks(ast.NodeTransformer):
    """Keep frozen producer checks explicit after a suite's live paths move."""
    def __init__(self, functions, producer_hash_functions=(), reference_paths=(), reference_path=None,
                 command_rewrites=None, root=ROOT):
        self.functions = set(functions)
        self.producer_hash_functions = set(producer_hash_functions)
        self.reference_paths = set(reference_paths)
        self.reference_path = reference_path
        self.command_rewrites = command_rewrites or {}
        self.root = root

    def visit_List(self, node):
        self.generic_visit(node)
        if node.elts and isinstance(node.elts[0], ast.Constant) and node.elts[0].value == 'lua':
            arguments = []
            for argument in node.elts:
                replacement = self.command_rewrites.get(argument.value) if isinstance(argument, ast.Constant) else None
                if replacement:
                    arguments.extend(ast.copy_location(ast.Constant(value=value), argument) for value in replacement)
                else:
                    arguments.append(argument)
            node.elts = arguments
        return node

    def visit_Constant(self, node):
        if isinstance(node.value, str) and node.value in self.reference_paths:
            return ast.copy_location(ast.Constant(value=self.reference_path), node)
        if isinstance(node.value, str) and node.value.startswith("runtime/"):
            original = self.root / node.value
            current = retained_runtime_path(original, self.root)
            if current != original:
                return ast.copy_location(ast.Constant(value=current.relative_to(self.root).as_posix()), node)
        return node

    def visit_Call(self, node):
        node = self.generic_visit(node)
        if isinstance(node.func, ast.Name) and node.func.id in self.producer_hash_functions:
            node.func = ast.copy_location(ast.Name(id='retained_producer_input_sha256', ctx=ast.Load()), node.func)
        return node

    def visit_Assert(self, node):
        node = self.generic_visit(node)
        test = node.test
        if (isinstance(test, ast.Compare) and len(test.ops) == 1 and
                isinstance(test.ops[0], ast.Eq) and isinstance(test.left, ast.Call) and
                isinstance(test.left.func, ast.Name) and test.left.func.id in self.functions and
                len(test.left.args) == 1 and not test.left.keywords):
            node.test = ast.copy_location(ast.Call(func=ast.Name(id='recorded_input_matches', ctx=ast.Load()),
                args=[test.left.args[0], test.comparators[0]], keywords=[]), test)
        return node


def run_contract(tool, arguments=None, root=ROOT):
    """Run a retained semantic suite from its exact producer, without copying it.

    The default falls through to the maintained tool. Retained suites are frozen
    regression inputs; this adapter never claims a fresh execution of their old
    producer or relaxes the suite's native target checks.
    """
    tool = Path(tool).resolve()
    name = tool.relative_to(root.resolve()).as_posix()
    suites = provenance(root).get('contract_suites', {}).get(name, {})
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--contract', choices=['current', *suites])
    parser.add_argument('--list-contracts', action='store_true')
    args, remaining = parser.parse_known_args(sys.argv[1:] if arguments is None else arguments)
    if args.list_contracts:
        print(json.dumps({'tool': name, 'contracts': ['current', *suites]}))
        raise SystemExit(0)
    if args.contract in (None, 'current'):
        if args.contract == 'current':
            sys.argv[1:] = remaining
        return
    row = suites[args.contract]
    if any(value in remaining for value in ('-h', '--help')):
        print(f"{name} --contract {args.contract}: retained static contract suite; "
              "uses its original arguments and target guards")
        raise SystemExit(0)
    from coverage_common import file_sha256, reference_config
    reference = None
    if row.get('target_sha256') or row.get('reference_paths'):
        reference = reference_config()['exe']
        if row.get('target_sha256') and file_sha256(reference) != row['target_sha256']:
            raise ValueError('Retained contract is unavailable for the configured installed EXE')
    raw = historical_source(row['producer_path'], row['source_sha256'], root)
    if hashlib.sha256(raw).hexdigest() != row['source_sha256']:
        raise ValueError('Retained suite source differs from its commitment')
    tree = ast.parse(raw, filename=str(tool))
    tree = _RecordedInputChecks(row.get('file_hash_functions', []),
        row.get('producer_hash_functions', []), row.get('reference_paths', []),
        str(reference) if reference is not None else None, row.get('command_rewrites'), root).visit(tree)
    ast.fix_missing_locations(tree)
    def producer_input_hash(value):
        path = Path(value)
        if not path.is_absolute():
            path = root / path
        if path.resolve() in (tool, (root / row['producer_path']).resolve()):
            return row['source_sha256']
        return file_sha256(current_path(path, root))
    print(json.dumps({'retained_contract': args.contract,
        'original_producer': {'path': row['producer_path'], 'sha256': row['source_sha256']},
        'execution_adapter': {'path': 'scripts/script_sources.py',
            'sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}}), file=sys.stderr)
    original_arguments = sys.argv
    try:
        sys.argv = [str(tool), *remaining]
        namespace = {'__name__': '__main__', '__file__': str(tool), '__package__': None,
                     'recorded_input_matches': lambda path, expected: recorded_input_matches(path, expected, root),
                     'retained_producer_input_sha256': producer_input_hash}
        exec(compile(tree, str(tool), 'exec'), namespace)
    finally:
        sys.argv = original_arguments
    raise SystemExit(0)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--show', required=True, help='Former script path in the provenance index')
    parser.add_argument('--sha256', required=True, help='Exact source hash from its execution record')
    args = parser.parse_args()
    sys.stdout.buffer.write(historical_source(args.show, args.sha256))


if __name__ == '__main__':
    main()
