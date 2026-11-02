#!/usr/bin/env python3
"""Bounded current-target Ghidra reuse/equivalence experiment in an explicit variant.

Selects a real guarded dispatch whose complete statically known flow is small,
contains no calls and stays within a 4 KiB window. Adds its verified table edges
and code seeds after an initial pass, then compares every exported record with
an independent PE import and full body-repair path. A sequential full pass is
also retained as a supplementary check. Never changes canonical coverage pointers.
The independent path verifies a bounded real flow/boundary extension, not
whole-target equivalence or a whole-target speedup.
"""
import argparse
from bisect import bisect_left
import csv
import gzip
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import time
from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def bounded_flow(pe, decoder, entry, table=None):
    """Independent bounded selector: reject calls, unknown exits and other switches."""
    pending = [entry] + ([int(value, 16) for value in table['case_targets']] if table else [])
    seen = set()
    site = int(table['site'], 16) if table else None
    while pending:
        address = pending.pop()
        if address in seen:
            continue
        if len(seen) >= 500 or not entry <= address < entry + 4096:
            return None
        try:
            offset = pe.rva_offset(address - pe.image_base)
            instruction = next(decoder.disasm(pe.data[offset:offset + 15], address, count=1), None)
        except (ValueError, StopIteration):
            return None
        if instruction is None:
            return None
        seen.add(address)
        if instruction.group(2):  # X86_GRP_CALL
            return None
        if instruction.group(3):  # X86_GRP_RET
            continue
        if instruction.group(1):  # X86_GRP_JUMP
            if instruction.operands[0].type == 2:  # X86_OP_IMM
                pending.append(instruction.operands[0].imm)
            elif address != site:
                return None
            if instruction.mnemonic == 'jmp':
                continue
        pending.append(address + instruction.size)
    return seen


def select_inputs(plan, pe, decoder):
    table_spec = plan['jump_tables']
    if file_sha256(Path(table_spec['path'])) != table_spec['sha256']:
        raise ValueError('Baseline table input differs')
    payload = json.loads(Path(table_spec['path']).read_text())
    candidates = sorted((int(row['site'], 16), row) for row in payload['tables'] if 2 <= row['unique_targets'] <= 8)
    owners, sizes = {}, {}
    bodies = Path(plan['output']) / 'bodies.tsv.gz'
    receipt = json.loads((Path(plan['output']) / 'progress.json').read_text())
    if file_sha256(bodies) != receipt['files']['bodies.tsv.gz']['sha256']:
        raise ValueError('Baseline body inventory differs')
    with gzip.open(bodies, 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            if row['external'] != 'false':
                continue
            low, high, entry = (int(row[key], 16) for key in ('start', 'end', 'entry'))
            sizes[entry] = sizes.get(entry, 0) + high - low + 1
            index = bisect_left(candidates, (low,))
            while index < len(candidates) and candidates[index][0] <= high:
                owners[candidates[index][0]] = entry
                index += 1
    for _, site, table in sorted((sizes[owners[site]], site, table) for site, table in candidates if site in owners):
        entry = owners[site]
        complete = bounded_flow(pe, decoder, entry, table)
        if complete is None:
            continue
        initial = bounded_flow(pe, decoder, entry)
        if initial is not None:  # A computed dispatch must stop the initial selector.
            continue
        for leaf in sorted(entry for entry, size in sizes.items() if 1 <= size <= 16 and entry != owners[site]):
            leaf_flow = bounded_flow(pe, decoder, leaf)
            if leaf_flow and len(leaf_flow) <= 4 and not leaf_flow & complete:
                return payload, table, owners[site], leaf, len(complete)
    raise ValueError('No bounded real guarded dispatch and independent leaf were found')


def run(plan, checkpoint_limit=None, metrics_path=None):
    environment = dict(os.environ)
    environment.pop('REA_CENSUS_CHECKPOINT_LIMIT', None)
    environment.pop('REA_STAGE_METRICS_PATH', None)
    if metrics_path is not None:
        environment['REA_STAGE_METRICS_PATH'] = str(metrics_path)
    if checkpoint_limit is not None:
        environment['REA_CENSUS_CHECKPOINT_LIMIT'] = str(checkpoint_limit)
    began = time.monotonic()
    subprocess.run([str(ROOT / 'scripts/rea'), 'census-native-image', str(plan)], cwd=ROOT, env=environment, check=True)
    return time.monotonic() - began


def receipt_identity(path):
    return hashlib.sha256(path.read_bytes()).hexdigest(), path.stat().st_mtime_ns


def require_unchanged_receipt(path, before):
    if receipt_identity(path) != before:
        raise ValueError('Completed replay changed receipt bytes or mtime')


def compare_exports(incremental, full):
    rows = {}
    for name in ('instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz', 'externals.tsv.gz', 'direct-call-helpers.tsv.gz'):
        left = gzip.decompress((incremental / name).read_bytes())
        right = gzip.decompress((full / name).read_bytes())
        if left != right:
            raise ValueError('Incremental/full exported records differ: ' + name)
        rows[name] = dict(uncompressed_sha256=hashlib.sha256(left).hexdigest(), records=left.count(b'\n') - 1)
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--baseline-plan', required=True, help='Frozen expanded current-target plan with guarded table proof')
    parser.add_argument('--run', action='store_true', help='Run the authorized static Ghidra experiment')
    parser.add_argument('--heap', default='2G')
    args = parser.parse_args()
    import capstone
    target = latest_target()
    baseline_path = (ROOT / args.baseline_plan).resolve()
    if not baseline_path.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Baseline must be a frozen project runtime plan')
    baseline = json.loads(baseline_path.read_text())
    if baseline['target_sha256'] != target['sha256']:
        raise ValueError('Baseline differs from current target')
    selection = module('benchmark_census', 'scripts/census-native-image.py')
    pe = module('benchmark_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    payload, table, entry, leaf, flow_instructions = select_inputs(baseline, pe, decoder)
    source_sha = file_sha256(ROOT / 'scripts/ghidra/ReaNativeCensus.java')
    base = ROOT / 'runtime/analysis/benchmarks/census-reuse' / target['sha256'] / source_sha
    base.mkdir(parents=True, exist_ok=True)
    paths = {}
    tools = {name: file_sha256(ROOT / name) for name in ('scripts/ghidra/ReaNativeCensus.java', 'scripts/census-native-image.py', 'scripts/rea-native-census.mjs', 'scripts/repair-rea-native-census.py', 'scripts/repair-rea-reference-input.py', 'node_modules/rea-agents/dist/ghidra/GhidraLauncher.js', 'node_modules/rea-agents/dist/ghidra/GhidraTargetSnapshot.js')}
    for kind in ('initial', 'incremental', 'full', 'independent-initial', 'independent-full'):
        directory = base / kind
        if directory.exists():
            selection.validate_resume_plan(json.loads((directory / 'plan.json').read_text()), target)
            paths[kind] = directory.resolve()
            continue
        directory.mkdir()
        starts = directory / 'starts.tsv'
        initial_kind = kind in ('initial', 'independent-initial')
        chosen = (entry, leaf) if initial_kind else (entry, leaf, min(int(value, 16) for value in table['case_targets']))
        starts.write_text(''.join(f'{value:x}\n' for value in sorted(set(chosen))))
        plan = {key: value for key, value in baseline.items() if key not in ('storage_aliases', 'pointer_selection', 'complement_inventory')}
        plan.update(format='rea-census-impact-equivalence-experiment-v1', output=str(directory), starts=str(starts), starts_sha256=file_sha256(starts), seed_count=len(set(chosen)), seed_scope='bounded-experiment', declared_start_count=2,
            script_sha256=source_sha, tooling=tools, heap=args.heap, batch_size=1, incremental_reuse=kind not in ('full', 'independent-full'), checkpoint_interval_ms=30000, checkpoint_max_batches=16,
            samples=[hex(entry), hex(leaf)], address_leads=None, diagnostic_leads=None, unwind_handlers=None, import_thunks=None, jump_tables=None)
        plan['persistence'] = {**baseline['persistence'], 'variant': 'census-impact-equivalence-v2-' + source_sha[:12] + ('-full' if kind.startswith('independent-') else '')}
        if not initial_kind:
            subset = {**payload, 'tables': [table], 'counts': {'tables': 1}, 'benchmark_subset_of_sha256': baseline['jump_tables']['sha256']}
            proof = directory / 'guarded-tables-input.json'
            proof.write_text(json_text(subset))
            plan['jump_tables'] = {'path': str(proof), 'sha256': file_sha256(proof)}
        plan, published = selection.publish_census_plan(plan, directory, target)
        paths[kind] = published
    result = dict(format='rea-census-impact-equivalence-experiment-v1', generator_sha256=file_sha256(Path(__file__)), target=target, entry=hex(entry), leaf=hex(leaf), guarded_site=table['site'], bounded_flow_instructions=flow_instructions,
        plans={key: str(value / 'plan.json') for key, value in paths.items()}, baseline_program_modified=False,
        limitation='Independent imports verify this bounded real flow/boundary extension; not whole-target equivalence or a whole-target speedup.')
    if args.run:
        previous = json.loads((base / 'result.json').read_text()) if (base / 'result.json').exists() else {}
        times = previous.get('elapsed', {})
        cached = []
        def completed(kind):
            directory = paths[kind]
            receipt_path = directory / 'progress.json'
            if not receipt_path.exists():
                return False
            receipt = json.loads(receipt_path.read_text())
            if receipt.get('stage') != 'completed':
                return False
            if receipt.get('plan_sha256') != file_sha256(directory / 'plan.json') or receipt.get('script_sha256') != source_sha:
                raise ValueError('Completed benchmark receipt identity differs')
            for name, item in receipt['files'].items():
                artifact = directory / name
                if artifact.stat().st_size != item['bytes'] or file_sha256(artifact) != item['sha256']:
                    raise ValueError('Completed benchmark export differs: ' + name)
            cached.append(kind)
            return True
        if not completed('initial'):
            times['initial_interruption_seconds'] = run(paths['initial'] / 'plan.json', 1)
            times['initial_resume_seconds'] = run(paths['initial'] / 'plan.json')
        if not completed('incremental'):
            times['incremental_seconds'] = run(paths['incremental'] / 'plan.json')
        incremental = json.loads((paths['incremental'] / 'progress.json').read_text())
        if incremental.get('reuse_mode') != 'incremental' or incremental.get('body_entries_reused', 0) < 1 or incremental.get('body_entries_affected', 0) < 1 or incremental.get('body_entries_new', 0) < 1:
            raise ValueError('Experiment did not exercise reused, affected and new entries: ' + json.dumps({k: v for k, v in incremental.items() if k.startswith(('reuse_', 'body_entries'))}))
        initial = json.loads((paths['initial'] / 'progress.json').read_text())
        if incremental['instructions'] <= initial['instructions']:
            raise ValueError('Experiment did not add real decoded instructions')
        if not completed('full'):
            times['full_seconds'] = run(paths['full'] / 'plan.json')
        if not completed('independent-initial'):
            times['independent_initial_seconds'] = run(paths['independent-initial'] / 'plan.json')
        initial_equal = compare_exports(paths['initial'], paths['independent-initial'])
        if not completed('independent-full'):
            times['independent_full_seconds'] = run(paths['independent-full'] / 'plan.json')
        result.update(elapsed=times, cached_immutable_exports=cached, independent_full_verified=True,
            independent_initial_equal_exports=initial_equal,
            equal_exports=compare_exports(paths['incremental'], paths['independent-full']),
            sequential_equal_exports=compare_exports(paths['incremental'], paths['full']),
            incremental_metrics=json.loads((paths['incremental'] / 'metrics.json').read_text()),
            full_metrics=json.loads((paths['full'] / 'metrics.json').read_text()),
            independent_full_metrics=json.loads((paths['independent-full'] / 'metrics.json').read_text()))
        receipt = paths['initial'] / 'progress.json'
        if 'metrics' in json.loads(receipt.read_text()):
            raise ValueError('Observational metrics entered the native proof receipt')
        before = receipt_identity(receipt)
        override = base / 'completed-replay-metrics.json'
        times['completed_replay_seconds'] = run(paths['initial'] / 'plan.json', metrics_path=override)
        require_unchanged_receipt(receipt, before)
        observations = json.loads(override.read_text())
        if observations.get('completed_receipt_reused') is not True or observations.get('metrics', {}).get('program_saves', 0) <= 0:
            raise ValueError('Completed replay did not recover matching observational metrics')
        if observations != json.loads((paths['initial'] / 'metrics.json').read_text()):
            raise ValueError('Canonical and override metrics publications differ')
        result.update(completed_replay_metrics_verified=True, completed_replay_receipt_unchanged=True)
    (base / 'result.json').write_text(json_text(result))
    print(json_text(result))


if __name__ == '__main__':
    main()
