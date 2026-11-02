#!/usr/bin/env python3
"""Non-compiling shared decode reuse and current ownership regressions."""
import importlib.util
import gc
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import capstone
from instruction_facts import InstructionFacts, BoundaryVerifier, NativeOperandStream

ROOT = Path(__file__).resolve().parents[1]


def module(name, filename):
    spec = importlib.util.spec_from_file_location(name, ROOT / 'scripts' / filename)
    value = importlib.util.module_from_spec(spec); spec.loader.exec_module(value)
    return value


class PE:
    image_base = 0x140000000

    def __init__(self, data):
        self.data = data

    def rva_offset(self, rva):
        if not 0 <= rva < len(self.data):
            raise ValueError('Unmapped fixture byte')
        return rva


class Facts(unittest.TestCase):
    def setUp(self):
        runtime = ROOT / 'runtime'; runtime.mkdir(exist_ok=True)
        self.temp = tempfile.TemporaryDirectory(prefix='instruction-facts-fixture-', dir=runtime)
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.data = bytes.fromhex('48b88000004001000000488d0d07000000ffd090c3')
        self.pe = PE(self.data)
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        self.rows = [{'address':hex(i.address), 'length':str(i.size), 'bytes':i.bytes.hex(),
                      'flow':'FALL_THROUGH'} for i in decoder.disasm(self.data, self.pe.image_base)]

    def facts(self, rows=None, **options):
        with InstructionFacts(options.pop('target_sha256', 'a' * 64), self.pe, capstone,
                              root=self.root, block_rows=2, **options) as facts:
            result = list(facts.instructions(self.rows if rows is None else rows))
            return result, facts.receipt(), dict(facts.metrics)

    def snapshot(self):
        return {p.relative_to(self.root).as_posix():(p.stat().st_mtime_ns,p.read_bytes())
                for p in self.root.rglob('*') if p.is_file()}

    def test_full_cache_hit_and_readonly_replay_are_identical(self):
        _, initial, misses = self.facts(publish=True)
        before = self.snapshot()
        _, replay, hits = self.facts()
        self.assertEqual(initial, replay)
        self.assertEqual(misses['decoded_instructions'], len(self.rows))
        self.assertEqual(hits['cache_hits'], len(self.rows))
        self.assertEqual(hits['decoded_instructions'], 0)
        self.assertEqual(before, self.snapshot())

    def test_expanded_stream_decodes_only_new_boundaries(self):
        self.facts(self.rows[::2], publish=True)
        _, _, metrics = self.facts(publish=True)
        self.assertEqual(metrics['cache_hits'], len(self.rows[::2]))
        self.assertEqual(metrics['cache_misses'], len(self.rows[1::2]))
        _, _, replay = self.facts()
        self.assertEqual(replay['cache_hits'], len(self.rows))

    def test_current_bytes_checked_even_on_a_hit(self):
        self.facts(publish=True)
        self.pe.data = b'\x90' + self.data[1:]
        with self.assertRaisesRegex(ValueError, 'source bytes differ'):
            self.facts()

    def test_bad_length_and_wrong_source_are_never_published(self):
        for altered in ({**self.rows[0], 'length':'9'},
                        {**self.rows[0], 'bytes':'90' * 10}):
            with self.assertRaisesRegex(ValueError, 'source bytes differ'):
                self.facts([altered], publish=True)
        _, _, metrics = self.facts()
        self.assertEqual(metrics['cache_hits'], 0)

    def test_target_mode_and_tool_contracts_are_isolated(self):
        self.facts(publish=True)
        for options in ({'target_sha256':'b' * 64},
                        {'mode':capstone.CS_MODE_32},
                        {'tool_identity':{'version':'different-decoder'}}):
            # 32-bit decoding changes the first boundary and must fail instead
            # of admitting the cached 64-bit instruction length.
            if 'mode' in options:
                with self.assertRaisesRegex(ValueError, 'instruction length differs'):
                    self.facts(**options)
            else:
                _, _, metrics = self.facts(**options)
                self.assertEqual(metrics['cache_hits'], 0)

    def test_changed_ownership_is_joined_again_from_current_bodies(self):
        helpers = module('facts_census', 'summarize-native-image.py')
        initial, _, _ = self.facts(publish=True)
        changed, _, metrics = self.facts()
        address = initial[0][1].address
        first = helpers.owner_lookup([(address,address + len(self.data) - 1,address)])
        second = helpers.owner_lookup([(address,address + len(self.data) - 1,address + 0x100)])
        self.assertEqual(metrics['decoded_instructions'], 0)
        self.assertNotEqual(first(address),second(changed[0][1].address))

    def test_cached_operands_and_propagation_equal_capstone(self):
        operands = module('facts_operands','audit-native-operands.py')
        classifier = module('facts_classifier','classify-native-ownership.py')
        decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        expected = list(decoder.disasm(self.data,self.pe.image_base))
        self.facts(publish=True)
        observed = [instruction for _,instruction in self.facts()[0]]
        for original,cached in zip(expected,observed):
            self.assertEqual(list(operands.explicit_operands(original,capstone)),
                             list(operands.explicit_operands(cached,capstone)))
            self.assertEqual(original.regs_access(), cached.regs_access())
        self.assertEqual(classifier.local_values(expected[:2],lambda _:None,capstone),
                         classifier.local_values(observed[:2],lambda _:None,capstone))

    def test_corrupt_payload_is_rejected(self):
        self.facts(publish=True)
        payload = next((self.root/'runtime/analysis/objects').glob('*/*'))
        payload.chmod(0o644); payload.write_bytes(b'corrupt')
        with self.assertRaisesRegex(ValueError,'CAS commitment differs'):
            self.facts()

    def test_readonly_miss_creates_no_store(self):
        self.facts()
        self.assertEqual(list(self.root.iterdir()), [])

    def test_boundary_only_verifier_matches_every_boundary_without_detail_cache(self):
        with BoundaryVerifier('a'*64,self.pe,capstone,root=self.root,block_rows=2) as verifier:
            observed=[(instruction.address,instruction.size,instruction.bytes) for _,instruction in verifier.instructions(self.rows)]
            receipt=verifier.receipt()
        self.assertEqual(observed,[(int(row['address'],16),int(row['length']),bytes.fromhex(row['bytes'])) for row in self.rows])
        self.assertFalse(receipt['contract']['detail'])
        self.assertEqual(list(self.root.iterdir()),[])

    def test_boundary_batch_cannot_accept_wrong_exported_length_or_changed_current_bytes(self):
        rows=[{'address':hex(self.pe.image_base),'length':str(len(self.data)),'bytes':self.data.hex()}]
        with self.assertRaisesRegex(ValueError,'instruction length differs'):
            with BoundaryVerifier('a'*64,self.pe,capstone,root=self.root) as verifier:list(verifier.instructions(rows))
        self.pe.data=b'\x90'+self.data[1:]
        with self.assertRaisesRegex(ValueError,'source bytes differ'):
            with BoundaryVerifier('a'*64,self.pe,capstone,root=self.root) as verifier:list(verifier.instructions(self.rows))

    def test_bulk_native_batch_checks_all_individual_lengths_and_rejects_missing_tail(self):
        rows=[{'address':hex(self.pe.image_base),'length':str(len(self.data)),'bytes':self.data.hex()}]
        with self.assertRaisesRegex(ValueError,'instruction length differs'):
            self.facts(rows,publish=True)
        self.assertEqual(list((self.root/'runtime/analysis/objects').glob('*/*')),[])

    def test_sparse_direct_mode_avoids_full_block_reads_and_publication(self):
        self.facts(publish=True);before=self.snapshot()
        with InstructionFacts('a'*64,self.pe,capstone,root=self.root,publish=True,cache_policy='direct') as facts:
            first=facts.instruction(self.rows[0]);second=facts.instruction(self.rows[0])
            self.assertEqual(first.bytes,second.bytes)
            self.assertEqual(facts.metrics['decoded_instructions'],1)
            self.assertEqual(facts.metrics['blocks_read'],0)
            self.assertEqual(facts.metrics['cache_hits'],1)
        self.assertEqual(before,self.snapshot())

    def test_borrowed_operand_views_retain_all_batches_after_iterator_close(self):
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        expected=list(decoder.disasm(self.data,self.pe.image_base))
        with NativeOperandStream('a'*64,self.pe,capstone,root=self.root,block_rows=1) as stream:
            retained=[instruction for _,instruction in stream.instructions(self.rows)]
        gc.collect()
        operand=module('borrowed_operand_equivalence','audit-native-operands.py')
        for native,legacy in zip(retained,expected):
            self.assertEqual(native.bytes,legacy.bytes)
            self.assertEqual(native.regs_access(),legacy.regs_access())
            self.assertEqual(list(operand.explicit_operands(native,capstone)),list(operand.explicit_operands(legacy,capstone)))
        self.assertEqual(list(self.root.iterdir()),[])

    def test_retained_memory_operand_owns_native_batch_until_last_use(self):
        # Keep only a nested memory operand, not the instruction/stream.
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        legacy=list(decoder.disasm(self.data,self.pe.image_base))[1]
        expected=(legacy.operands[1].mem.base,legacy.operands[1].mem.disp)
        free=capstone._cs.cs_free
        with patch.object(capstone._cs,'cs_free',wraps=free) as release:
            stream=NativeOperandStream('a'*64,self.pe,capstone,root=self.root,block_rows=1)
            iterator=stream.instructions(self.rows[1:2]);instruction=next(iterator)[1]
            memory=instruction.operands[1].mem
            iterator.close();stream.close()
            del iterator,stream,instruction;gc.collect()
            self.assertEqual(release.call_count,0)
            self.assertEqual((memory.base,memory.disp),expected)
            del memory;gc.collect()
            self.assertEqual(release.call_count,1)

    def test_dense_operand_stream_rejects_bad_boundaries_without_publishing(self):
        rows=[{'address':hex(self.pe.image_base),'length':str(len(self.data)),'bytes':self.data.hex()}]
        with self.assertRaisesRegex(ValueError,'instruction length differs'):
            with NativeOperandStream('a'*64,self.pe,capstone,root=self.root) as stream:list(stream.instructions(rows))
        self.assertEqual(list(self.root.iterdir()),[])

    def test_sparse_requests_reuse_same_session_and_published_blocks(self):
        with InstructionFacts('a'*64,self.pe,capstone,root=self.root,publish=True,block_rows=2) as facts:
            facts.instruction(self.rows[0]); facts.instruction(self.rows[0])
            facts.instruction(self.rows[1]); facts.instruction(self.rows[0])
            self.assertEqual(facts.metrics['decoded_instructions'],2)
            self.assertEqual(facts.metrics['cache_hits'],2)
        _,_,metrics=self.facts(self.rows[:2])
        self.assertEqual(metrics['decoded_instructions'],0)

    def test_all_consumer_outputs_equal_legacy_decoding(self):
        operand = module('facts_all_operand','audit-native-operands.py')
        classifier = module('facts_all_classifier','classify-native-ownership.py')
        dispatch = module('facts_all_dispatch','audit-native-dispatch.py')
        constant = module('facts_all_constant','audit-native-constant-dispatch.py')
        self.data=bytes.fromhex('48b88000004001000000488d0d070000004883c010ffe0'
                               '488b0579000000488b04c50000004065488b042500000040'
                               '67488d057900000031c04883c005ffd0e800000000750190cc0f0bc3')
        self.pe=PE(self.data)
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        legacy=list(decoder.disasm(self.data,self.pe.image_base))
        self.rows=[{'address':hex(i.address),'length':str(i.size),'bytes':i.bytes.hex(),'flow':'FALL_THROUGH'} for i in legacy]
        self.facts(publish=True)
        cached=[instruction for _,instruction in self.facts()[0]]
        def outputs(instructions):
            return {
                'verifier':[(i.address,i.bytes.hex(),i.size) for i in instructions],
                'operands':[list(operand.explicit_operands(i,capstone)) for i in instructions],
                'ownership':[classifier.local_values(instructions[:index],lambda _:None,capstone) for index in range(len(instructions)+1)],
                'dispatch':[dispatch.computed_jump(i,instructions[:index+1],capstone,classifier) for index,i in enumerate(instructions)],
                'constant_dispatch':[constant.immutable_target(instructions[:index],i,capstone,classifier) for index,i in enumerate(instructions)]}
        self.assertEqual(outputs(legacy),outputs(cached))

    def test_compaction_preserves_original_bytes_and_readonly_artifacts(self):
        compact = module('facts_compact','compact-native-census.py')
        directory = self.root.relative_to(ROOT).as_posix()
        report = {'target':{'sha256':'a' * 64},'artifacts':{'directory':directory},
                  'seed_scope':'declared','diagnostic_bindings':[]}
        # The exact historical byte stream need not use today's JSON layout.
        original = b'{"historical":"byte stream"}\n'
        first = compact.compact(report,original)
        before = self.snapshot()
        self.assertEqual(first,compact.compact(report,original,publish=False))
        self.assertEqual(before,self.snapshot())
        self.assertEqual((self.root/'full-summary.json').read_bytes(),original)
        with self.assertRaisesRegex(ValueError,'immutable full-summary'):
            compact.compact(report,b'changed')

    def test_native_ownership_cache_excludes_source_mapping_and_rejects_corruption(self):
        classifier=module('facts_core_cache','classify-native-ownership.py')
        directory=self.root/'runtime/results';directory.mkdir(parents=True)
        files={name:directory/(name+'.json') for name in ('indirect','imports','resolvers')}
        for name,path in files.items():path.write_text(name)
        report={'artifact':{'path':str(files['indirect'])},
                'import_ownership':{'artifact':{'path':str(files['imports'])}},
                'conditional_export_resolvers':{'artifact':{'path':str(files['resolvers'])}},
                'source_candidates':{'source_refs':['old.rs']},'indirect_counts':{'actual_indirect_call':3}}
        inputs={'target_sha256':'a'*64,'native':'same'}
        cache=classifier.NativeCoreCache(True,root=self.root)
        cache.publish(inputs,report,{'expanded':{'native.rs':[123]},'resource_paths':{}})
        cache.close()
        before=self.snapshot();cache=classifier.NativeCoreCache(False,root=self.root)
        payload=cache.load(inputs)
        self.assertNotIn('source_candidates',payload['report'])
        self.assertEqual(payload['report']['indirect_counts'],report['indirect_counts'])
        self.assertIsNone(cache.load({**inputs,'native':'changed'}));cache.close()
        self.assertEqual(before,self.snapshot())
        artifact=self.root/payload['artifacts']['indirect']['path'];artifact.chmod(0o644);artifact.write_bytes(b'corrupt')
        cache=classifier.NativeCoreCache(False,root=self.root)
        with self.assertRaisesRegex(ValueError,'core artifact differs'):cache.load(inputs)
        cache.close()

    def test_source_only_ownership_refresh_does_not_reenter_native_resolution(self):
        classifier=module('facts_core_refresh','classify-native-ownership.py')
        report={'indirect_counts':{},'computed_flow_non_call_or_jump_mnemonics':{},'unknown_indirect_reasons':{},'source_candidates':{'counts':{'new_source':1}}}
        args=type('Args',(),{'write':False,'output':str(self.root/'result.json')})()
        cache=type('Cache',(),{'load':lambda _self,inputs:{'native':'retained'},'close':lambda _self:None})()
        with patch.object(classifier,'native_core_inputs',return_value={'native':'same'}) as inputs,patch.object(classifier,'NativeCoreCache',return_value=cache),patch.object(classifier,'refresh_source_mapping',return_value=report) as refresh,patch.object(classifier,'validate_source_mapping') as validate,patch.object(classifier,'run_full_native',side_effect=AssertionError('native work repeated')),patch.object(classifier,'derived_json') as output:
            classifier.run(args)
            refresh.assert_called_once();validate.assert_called_once_with(report)
            self.assertEqual(inputs.call_count,2)
            output.assert_called_once_with(classifier.artifact_path(args.output),report,publish=False)

    def test_native_core_key_changes_for_actual_decoder_binding_library_and_version(self):
        classifier=module('facts_core_decoder','classify-native-ownership.py')
        binding=Path(capstone.__file__);library=Path(str(capstone._cs._name))
        digests={binding:'a'*64,library:'b'*64}
        with patch.object(classifier,'file_sha256',side_effect=lambda path:digests[Path(path)]):
            initial=classifier.native_decoder_identity()
            self.assertEqual(initial['python_binding_sha256'],'a'*64)
            self.assertEqual(initial['native_library_sha256'],'b'*64)
            key=lambda identity:classifier.NativeCoreCache.key(None,{'target_sha256':'c'*64,'decoder':identity,'inputs':{'native':'same'}})
            for path in (binding,library):
                old=digests[path];digests[path]='d'*64
                self.assertNotEqual(key(initial),key(classifier.native_decoder_identity()))
                digests[path]=old
            with patch.object(capstone,'__version__','changed'),patch.object(capstone,'cs_version',return_value=(5,1,999)):
                self.assertNotEqual(key(initial),key(classifier.native_decoder_identity()))

    def test_native_core_hit_rejects_inputs_that_change_during_source_join(self):
        classifier=module('facts_core_changed_input','classify-native-ownership.py')
        args=type('Args',(),{'write':False,'output':str(self.root/'result.json')})()
        cache=type('Cache',(),{'load':lambda _self,inputs:{'native':'retained'},'close':lambda _self:None})()
        with patch.object(classifier,'native_core_inputs',side_effect=[{'native':'same'},{'native':'changed'}]),patch.object(classifier,'NativeCoreCache',return_value=cache),patch.object(classifier,'refresh_source_mapping',return_value={}),patch.object(classifier,'derived_json') as output:
            with self.assertRaisesRegex(ValueError,'inputs changed during source review'):classifier.run(args)
            output.assert_not_called()

    def test_source_join_rejects_changed_mapping_and_source_bytes(self):
        classifier=module('facts_core_changed_source','classify-native-ownership.py')
        mapping=self.root/'mapping.json';mapping.write_text('mapping')
        source=self.root/'source.rs';source.write_text('source')
        commitment=lambda path:{'path':str(path),'sha256':classifier.file_sha256(path)}
        value={'source_mapping':commitment(mapping),'vendor_manifest_sha256':classifier.file_sha256(ROOT/'docs/analysis/benilla-vendor.json'),
               'retained_archive_missing_path_search':[],'paths':[{'source_candidate':commitment(source)}]}
        audit=self.root/'source-audit.json';audit.write_text(__import__('json').dumps(value))
        report={'source_candidates':{'audit':commitment(audit)}}
        classifier.validate_source_mapping(report)
        for path in (mapping,source):
            old=path.read_bytes();path.write_bytes(b'changed')
            with self.assertRaisesRegex(ValueError,'Source candidate input changed'):classifier.validate_source_mapping(report)
            path.write_bytes(old)


if __name__ == '__main__':
    unittest.main()
