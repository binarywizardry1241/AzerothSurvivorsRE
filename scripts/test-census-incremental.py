#!/usr/bin/env python3
"""Non-compiling admission/benchmark regressions; real Program proof is separate."""
import gzip
import importlib.util
import io
import json
import os
from pathlib import Path
import sys
from types import SimpleNamespace
import tempfile
import unittest
from contextlib import redirect_stdout
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]

def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result

selection = module('incremental_selection', 'scripts/census-native-image.py')
benchmark = module('incremental_benchmark', 'scripts/benchmark-census-reuse.py')

class CensusIncremental(unittest.TestCase):
    def test_checkpoint_time_limit_precedes_a_large_batch_safety_ceiling(self):
        defaults=selection.argument_parser().parse_args([])
        self.assertEqual(defaults.checkpoint_seconds,30)
        self.assertEqual(defaults.checkpoint_max_batches,256)
        explicit=selection.argument_parser().parse_args(['--checkpoint-seconds','5','--checkpoint-max-batches','1'])
        self.assertEqual((explicit.checkpoint_seconds,explicit.checkpoint_max_batches),(5,1))

    def test_legacy_resume_preserves_its_original_checkpoint_policy(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-policy-fixture-') as temporary:
            root=Path(temporary);output=root/'runtime/frozen';output.mkdir(parents=True)
            frozen={'heap':'2G','checkpoint_interval_ms':30000,'checkpoint_max_batches':16}
            plan_path=output/'plan.json';raw=json.dumps(frozen).encode();plan_path.write_bytes(raw)
            arguments=['census-native-image.py','--resume','--output','runtime/frozen',
                       '--checkpoint-seconds','99','--checkpoint-max-batches','256']
            with patch.object(selection,'ROOT',root),patch.object(selection,'latest_target',return_value={}),\
                 patch.object(selection,'restore_census_aliases'),\
                 patch.object(selection,'validate_resume_plan',side_effect=lambda plan,target:plan),\
                 patch.object(selection.os,'chdir'),patch.object(selection.os,'execve',side_effect=RuntimeError('fixture launch')) as launch,\
                 patch.object(sys,'argv',arguments),redirect_stdout(io.StringIO()):
                with self.assertRaisesRegex(RuntimeError,'fixture launch'):selection.main()
            self.assertEqual(plan_path.read_bytes(),raw)
            self.assertEqual(launch.call_args.args[1], [str(root/'scripts/rea'),'census-native-image',str(plan_path)])
            self.assertEqual(launch.call_args.args[2]['GHIDRA_HEADLESS_MAXMEM'],'2G')

    def test_reuse_policy_and_explicit_program_variant_cannot_alias_full_or_baseline_receipts(self):
        plan = dict(format='new-profile', target_sha256='a' * 64, starts_sha256='b' * 64, script_sha256='c' * 64,
                    seed_scope='declared', incremental_reuse=True, persistence={})
        key = selection.canonical_census_directory(plan)
        self.assertNotEqual(key, selection.canonical_census_directory({**plan, 'incremental_reuse': False}))
        self.assertNotEqual(key, selection.canonical_census_directory({**plan, 'persistence': {'variant': 'explicit-experiment'}}))
        self.assertEqual(key, selection.canonical_census_directory({**plan, 'checkpoint_interval_ms': 10, 'checkpoint_max_batches': 1, 'batch_size': 2}))

    def decoder(self, records):
        class Instruction:
            size = 1
            def __init__(self, address, kind, target=None):
                self.address, self.kind = address, kind
                self.mnemonic = 'jmp' if kind in ('jump', 'computed') else kind
                self.operands = [SimpleNamespace(type=2 if target is not None else 1, imm=target)]
            def group(self, group):
                return self.kind in ({1: ('jump', 'computed'), 2: ('call',), 3: ('ret',)}.get(group, ()))
        class Decoder:
            def disasm(self, data, address, count):
                return iter([Instruction(address, *records[address])]) if address in records else iter([])
        return Decoder()

    def pe(self):
        return SimpleNamespace(image_base=0x1000, data=b'x' * 8192, rva_offset=lambda value: value)

    def test_benchmark_requires_real_guarded_flow_without_calls_or_unknown_exits(self):
        records = {0x1000: ('normal',), 0x1001: ('computed',), 0x1002: ('ret',), 0x1003: ('jump', 0x1004), 0x1004: ('ret',)}
        table = dict(site='0x1001', case_targets=['0x1002', '0x1003', '0x1002'])
        self.assertIsNone(benchmark.bounded_flow(self.pe(), self.decoder(records), 0x1000))
        self.assertEqual(benchmark.bounded_flow(self.pe(), self.decoder(records), 0x1000, table), set(records))
        for changes in ({0x1003: ('call',)}, {0x1003: ('jump', 0x3000)}, {0x1003: ('computed',)}):
            with self.subTest(changes=changes):
                self.assertIsNone(benchmark.bounded_flow(self.pe(), self.decoder({**records, **changes}), 0x1000, table))

    def test_benchmark_rejects_missing_instruction_and_unbounded_loops(self):
        self.assertIsNone(benchmark.bounded_flow(self.pe(), self.decoder({0x1000: ('normal',)}), 0x1000))
        records = {address: ('normal',) for address in range(0x1000, 0x1250)}
        self.assertIsNone(benchmark.bounded_flow(self.pe(), self.decoder(records), 0x1000))
        # A finite control-flow cycle is valid and is visited once.
        self.assertEqual(benchmark.bounded_flow(self.pe(), self.decoder({0x1000: ('jump', 0x1000)}), 0x1000), {0x1000})

    def test_completed_receipt_guard_rejects_byte_and_mtime_changes(self):
        scratch = ROOT / 'runtime/tests/coverage'
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as temporary:
            path = Path(temporary) / 'progress.json'
            path.write_bytes(b'{"stage":"completed"}\n')
            before = benchmark.receipt_identity(path)
            benchmark.require_unchanged_receipt(path, before)
            path.write_bytes(b'{"stage":"different"}\n')
            os.utime(path, ns=(before[1], before[1]))
            with self.assertRaisesRegex(ValueError, 'bytes or mtime'):
                benchmark.require_unchanged_receipt(path, before)
            path.write_bytes(b'{"stage":"completed"}\n')
            os.utime(path, ns=(before[1] + 1000000, before[1] + 1000000))
            with self.assertRaisesRegex(ValueError, 'bytes or mtime'):
                benchmark.require_unchanged_receipt(path, before)

    def test_equivalence_compares_record_bytes_not_gzip_headers_or_only_totals(self):
        scratch = ROOT / 'runtime/tests/coverage'
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as temporary:
            left, right = Path(temporary) / 'left', Path(temporary) / 'right'
            left.mkdir(); right.mkdir()
            names = ('instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz', 'externals.tsv.gz', 'direct-call-helpers.tsv.gz')
            for name in names:
                (left / name).write_bytes(gzip.compress(b'header\nreal-record\n', mtime=1))
                (right / name).write_bytes(gzip.compress(b'header\nreal-record\n', mtime=2))
            self.assertEqual(len(benchmark.compare_exports(left, right)), 5)
            (right / 'references.tsv.gz').write_bytes(gzip.compress(b'header\nwrong-record\n'))
            with self.assertRaisesRegex(ValueError, 'references'):
                benchmark.compare_exports(left, right)

if __name__ == '__main__':
    unittest.main()
