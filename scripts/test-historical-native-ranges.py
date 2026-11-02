#!/usr/bin/env python3
"""Non-compiling historical-ASM hash reconstruction and identity guards."""
import hashlib
from concurrent.futures import ThreadPoolExecutor
import importlib.util
import json
import random
from pathlib import Path
import struct
import tempfile
import unittest
from unittest.mock import patch
from types import SimpleNamespace
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('historical_native_ranges',ROOT/'scripts/revalidate-historical-native-ranges.py')
audit=importlib.util.module_from_spec(spec);spec.loader.exec_module(audit)


class HistoricalCacheTests(unittest.TestCase):
    def setUp(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        self.temporary=tempfile.TemporaryDirectory(dir=scratch);self.root=Path(self.temporary.name)
        self.image=b'prefixUNIQUE-tail-repeat-repeat';self.target=hashlib.sha256(self.image).hexdigest()
        self.raw=b'UNIQUE';self.digest=hashlib.sha256(self.raw).hexdigest()
        self.identity={'schema':audit.PREIMAGE_SCHEMA,'inputs_sha256':'a'*64,'tool':'fixture','source_revision':'revision'}
        self.key=audit.canonical([None,len(self.raw),self.digest,'0x1000'])
        self.preimages={self.key:(self.raw,{'path':'docs/input.json','sha256':'b'*64,'encoding':'explicit-json-hex'})}

    def tearDown(self):self.temporary.cleanup()

    def snapshot(self):
        return {path.relative_to(self.root).as_posix():(hashlib.sha256(path.read_bytes()).hexdigest(),path.stat().st_mtime_ns)
                for path in (self.root/'runtime/analysis').rglob('*') if path.is_file()}

    def seed(self):
        cache=audit.HistoricalCache(self.target,root=self.root,write=True)
        for raw in (self.raw,b'absent',b'repeat'):
            cache.search(self.image,raw,hashlib.sha256(raw).hexdigest())
        cache.close();cache.publish(self.identity,self.preimages)

    def test_search_reuses_unique_ambiguous_and_no_match_without_mutation(self):
        self.seed();before=self.snapshot()
        cache=audit.HistoricalCache(self.target,root=self.root)
        self.assertEqual(cache.search(self.image,self.raw,self.digest),(6,-1))
        self.assertEqual(cache.search(self.image,b'absent',hashlib.sha256(b'absent').hexdigest()),(-1,-1))
        self.assertEqual(cache.search(self.image,b'repeat',hashlib.sha256(b'repeat').hexdigest()),(18,25))
        self.assertEqual(cache.metrics['search_hits'],3);self.assertEqual(cache.metrics['search_misses'],0)
        self.assertEqual(cache.preimages(self.identity),self.preimages)
        # Existing evidence JSON deliberately preserves provenance field order.
        self.assertEqual(audit.json_text(cache.preimages(self.identity)[self.key][1]),audit.json_text(self.preimages[self.key][1]))
        cache.close();cache.publish(self.identity,self.preimages)
        self.assertEqual(self.snapshot(),before)

    def test_target_range_length_algorithm_and_schema_invalidation(self):
        self.seed()
        changed=self.image+b'UNIQUE';cache=audit.HistoricalCache(hashlib.sha256(changed).hexdigest(),root=self.root)
        self.assertEqual(cache.search(changed,self.raw,self.digest),(6,len(self.image)))
        self.assertEqual(cache.metrics['search_misses'],1);cache.close()
        cache=audit.HistoricalCache(self.target,root=self.root,algorithm='changed-algorithm')
        self.assertEqual(cache.search(self.image,self.raw,self.digest),(6,-1));self.assertEqual(cache.metrics['search_misses'],1)
        with self.assertRaisesRegex(ValueError,'image differs'):cache.search(changed,self.raw,self.digest)
        with self.assertRaisesRegex(ValueError,'digest differs'):cache.search(self.image,self.raw+b'x',self.digest)
        for field,value in (('schema','v2'),('tool','changed'),('inputs_sha256','c'*64),('source_revision','new')):
            self.assertIsNone(cache.preimages({**self.identity,field:value}))
        cache.close()

    def test_current_owner_is_rejoined_for_each_census_and_whole_range(self):
        self.seed();cache=audit.HistoricalCache(self.target,root=self.root)
        offset,_=cache.search(self.image,self.raw,self.digest)
        pe=SimpleNamespace(offset_va=lambda value:4096+value,sections=[{'name':'.text','raw_offset':0,'raw_size':100,'characteristics':'0x20000000'}])
        entry={'file_offset':1,'byte_count':len(self.raw)}
        self.assertEqual(audit.current_match(entry,offset,pe,lambda _:4096)[0]['whole_range_actual_native_owner'],'0x1000')
        self.assertEqual(audit.current_match(entry,offset,pe,lambda _:8192)[0]['whole_range_actual_native_owner'],'0x2000')
        self.assertIsNone(audit.current_match(entry,offset,pe,lambda value:4096 if value<4105 else 8192)[1])
        cache.close()

    def test_readonly_missing_store_creates_nothing_and_equal_publication_preserves_alias(self):
        cache=audit.HistoricalCache(self.target,root=self.root)
        self.assertIsNone(cache.preimages(self.identity));cache.search(self.image,self.raw,self.digest);cache.close()
        self.assertFalse((self.root/'runtime').exists())
        path=self.root/'result.json';original=self.root/'object';original.write_text('{}\n');path.symlink_to(original.name)
        before=original.stat().st_mtime_ns
        self.assertFalse(audit.publish_text(path,'{}\n',False));self.assertFalse(audit.publish_text(path,'{}\n',True))
        self.assertTrue(path.is_symlink());self.assertEqual(original.stat().st_mtime_ns,before)
        with self.assertRaises(ValueError):audit.publish_text(path,'changed',False)
        audit.publish_text(path,'changed',True)
        self.assertFalse(path.is_symlink());self.assertEqual(original.read_text(),'{}\n')

    def test_concurrent_identical_publications_share_one_object_and_search_population(self):
        self.seed()
        def publish(_):
            cache=audit.HistoricalCache(self.target,root=self.root,write=True)
            self.assertEqual(cache.search(self.image,self.raw,self.digest),(6,-1))
            cache.close();cache.publish(self.identity,self.preimages)
        with ThreadPoolExecutor(max_workers=3) as pool:list(pool.map(publish,range(6)))
        cache=audit.HistoricalCache(self.target,root=self.root)
        self.assertEqual(cache.connection.execute('SELECT count(*) FROM historical_range_search').fetchone()[0],3)
        self.assertEqual(cache.connection.execute('SELECT count(*) FROM historical_preimage_sets').fetchone()[0],1)
        self.assertEqual(len(list((self.root/'runtime/analysis/objects').glob('*/*'))),1)
        cache.close()

    def test_negative_preimage_population_is_reusable_and_corruption_fails_closed(self):
        cache=audit.HistoricalCache(self.target,root=self.root,write=True)
        cache.close();cache.publish(self.identity,{})
        cache=audit.HistoricalCache(self.target,root=self.root)
        self.assertEqual(cache.preimages(self.identity),{})
        self.assertIsNone(cache.preimages({**self.identity,'inputs_sha256':'new-source'}))
        cache.close()
        path=next((self.root/'runtime/analysis/objects').glob('*/*'));path.chmod(0o644);path.write_bytes(b'broken')
        cache=audit.HistoricalCache(self.target,root=self.root)
        with self.assertRaisesRegex(ValueError,'object commitment'):cache.preimages(self.identity)
        cache.close()

    def test_source_corpus_and_extractor_changes_invalidate_preimage_bundle(self):
        source=self.root/'docs/evidence/manifest.json';source.parent.mkdir(parents=True)
        document={'target_sha256':'b'*64,'row':{'address':'0x1000','byte_count':len(self.raw),'sha256':self.digest}}
        source.write_text(json.dumps(document));tool=self.root/'scripts/recover-talents.py';tool.parent.mkdir();tool.write_text('schema v1')
        def identity():
            return audit.preimage_identity({'sha256':self.target},[(source,document)],{source:hashlib.sha256(source.read_bytes()).hexdigest()},[source])
        with patch.object(audit,'ROOT',self.root),patch.object(audit.subprocess,'check_output',return_value='revision'):
            original=identity();tool.write_text('schema v2');changed=identity();self.assertNotEqual(original,changed)
            tool.write_text('schema v1');self.assertEqual(original,identity())
            source.write_text(json.dumps({**document,'new_schema_field':1}));self.assertNotEqual(original,identity())
            source.write_text(json.dumps(document));(source.parent/'new.asm').write_text('1000: c3 ret\n');self.assertNotEqual(original,identity())

    def test_imported_history_invalidates_preimages_without_changing_head(self):
        with patch.object(audit,'ROOT',self.root),patch.object(audit.subprocess,'check_output',side_effect=['same-head','first-ref\n','same-head','first-ref\nnew-ref\n']):
            first=audit.preimage_identity({'sha256':self.target},[],{},[])
            second=audit.preimage_identity({'sha256':self.target},[],{},[])
        self.assertNotEqual(first,second)

    def test_intrinsic_results_survive_before_source_bundle_or_owner_publication(self):
        cache=audit.HistoricalCache(self.target,root=self.root,write=True)
        cache.search_many(self.image,[(self.raw,self.digest),(b'absent',hashlib.sha256(b'absent').hexdigest())])
        cache.close()  # No publish(identity, preimages), as on an interrupted join.
        reader=audit.HistoricalCache(self.target,root=self.root)
        self.assertEqual(reader.search(self.image,self.raw,self.digest),(6,-1))
        self.assertEqual(reader.metrics['search_hits'],1)
        self.assertIsNone(reader.preimages(self.identity))
        self.assertEqual(reader.connection.execute('SELECT DISTINCT algorithm FROM historical_range_search').fetchall(),[(audit.LEGACY_SEARCH_ALGORITHM,)])
        self.assertEqual(reader.connection.execute('SELECT count(*) FROM historical_preimage_sets').fetchone()[0],0)
        reader.close()

    def test_legacy_rows_are_verified_without_relabeling_and_corruption_fails_closed(self):
        self.seed();before=self.snapshot()
        cache=audit.HistoricalCache(self.target,root=self.root)
        self.assertEqual(cache.search(self.image,self.raw,self.digest),(6,-1))
        self.assertEqual(cache.metrics['legacy_search_hits'],1);cache.close()
        self.assertEqual(before,self.snapshot())
        import sqlite3
        connection=sqlite3.connect(self.root/'runtime/analysis/knowledge.sqlite')
        connection.execute('UPDATE historical_range_search SET first_offset=7 WHERE range_sha256=?',(self.digest,));connection.commit();connection.close()
        cache=audit.HistoricalCache(self.target,root=self.root)
        with self.assertRaisesRegex(ValueError,'cache bytes differ'):cache.search(self.image,self.raw,self.digest)
        cache.close()


class HistoricalBulkSearchTests(unittest.TestCase):
    def setUp(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        self.temporary=tempfile.TemporaryDirectory(dir=scratch);self.directory=Path(self.temporary.name)

    def tearDown(self):self.temporary.cleanup()

    def search(self,image,raws):
        path=self.directory/'image.bin';path.write_bytes(image)
        ranges={(hashlib.sha256(raw).hexdigest(),len(raw)):raw for raw in raws}
        result=audit.bulk_search(path,hashlib.sha256(image).hexdigest(),len(image),ranges)
        if result is None:self.skipTest('Installed Node unavailable')
        values,metrics=result
        for key,raw in ranges.items():
            first=image.find(raw);expected=(first,image.find(raw,first+1) if first>=0 else -1)
            self.assertEqual(values[key],expected,raw)
        return values,metrics

    def test_overlap_negative_short_prefix_suffix_and_repeated_anchor(self):
        image=b'a'*80+b'first-prefix-suffix'+b'0123456789abcdef'+b'x'*40+b'Y'+b'a'*80
        raws=[b'a',b'aa',b'aaaa',b'aaaaa',b'a'*79,b'a'*81,b'absent',b'first',b'suffix',image,
              b'0123456789abcdef'+b'x'*40+b'Y',b'0123456789abcdef'+b'x'*40+b'Z',image+b'x']
        _,metrics=self.search(image,raws)
        self.assertGreater(metrics['short_patterns'],0)
        self.assertLessEqual(metrics['states'],len(raws)*16+1)

    def test_seeded_random_population_agrees_with_independent_bytes_find(self):
        rng=random.Random(82731);image=bytes(rng.randrange(8) for _ in range(12000))
        raws=[]
        for _ in range(150):
            count=rng.randrange(1,90);offset=rng.randrange(len(image)-count)
            raw=image[offset:offset+count]
            raws.extend((raw,raw+b'\xff'))
        self.search(image,raws)

    def test_malformed_hex_and_commitments_fail_closed(self):
        path=self.directory/'image.bin';path.write_bytes(b'abcabc')
        digest=hashlib.sha256(b'abcabc').hexdigest();raw=b'abc';key=(hashlib.sha256(raw).hexdigest(),len(raw))
        with self.assertRaisesRegex(ValueError,'Target bytes differ'):
            audit.bulk_search(path,'0'*64,6,{key:raw})
        with self.assertRaisesRegex(ValueError,'Range digest differs'):
            audit.bulk_search(path,digest,6,{('0'*64,len(raw)):raw})
        with self.assertRaisesRegex(ValueError,'Invalid range hex/length'):
            audit.bulk_search(path,digest,6,{(key[0],4):raw})

    def test_invalid_bulk_result_is_not_published_and_missing_node_uses_legacy_producer(self):
        image=b'abcabc';digest=hashlib.sha256(image).hexdigest();raw=b'abc';key=(hashlib.sha256(raw).hexdigest(),len(raw))
        root=self.directory/'store';root.mkdir()
        cache=audit.HistoricalCache(digest,root=root,write=True)
        with patch.object(audit,'bulk_search',return_value=({key:(1,-1)},{})):
            with self.assertRaisesRegex(ValueError,'cache bytes differ'):
                cache.search_many(image,[(raw,key[0])],self.directory/'unused')
        self.assertEqual(cache.metrics['search_rows_published'],0)
        with patch.object(audit,'bulk_search',return_value=None):
            self.assertEqual(cache.search_many(image,[(raw,key[0])],self.directory/'unused')[key],(0,3))
        cache.close()
        reader=audit.HistoricalCache(digest,root=root)
        self.assertEqual(reader.connection.execute('SELECT algorithm FROM historical_range_search').fetchall(),[(audit.LEGACY_SEARCH_ALGORITHM,)])
        reader.close()

    def test_bulk_rows_keep_new_producer_and_publish_before_source_or_owners(self):
        image=b'abcabc-x';digest=hashlib.sha256(image).hexdigest();raw=b'abc';key=(hashlib.sha256(raw).hexdigest(),len(raw))
        path=self.directory/'image.bin';path.write_bytes(image)
        root=self.directory/'store';root.mkdir()
        cache=audit.HistoricalCache(digest,root=root,write=True)
        self.assertEqual(cache.search_many(image,[(raw,key[0])],path)[key],(0,3))
        if 'bulk_search' not in cache.metrics:self.skipTest('Installed Node unavailable')
        self.assertEqual(cache.metrics['bulk_search']['algorithm'],audit.SEARCH_ALGORITHM)
        self.assertEqual(len(cache.metrics['bulk_search']['helper_sha256']),64)
        self.assertEqual(len(cache.metrics['bulk_search']['node_executable_sha256']),64)
        cache.close()
        reader=audit.HistoricalCache(digest,root=root)
        self.assertEqual(reader.connection.execute('SELECT algorithm FROM historical_range_search').fetchall(),[(audit.SEARCH_ALGORITHM,)])
        self.assertEqual(reader.search(image,raw,key[0]),(0,3))
        self.assertEqual(reader.metrics['legacy_search_hits'],0)
        self.assertEqual(reader.connection.execute('SELECT count(*) FROM historical_preimage_sets').fetchone()[0],0)
        reader.close()


class HistoricalRanges(unittest.TestCase):
    def test_output_alias_replacement_preserves_original_immutable_payload(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='historical-alias-fixture-') as folder:
            directory=Path(folder);original=directory/'object.json';original.write_text('old')
            alias=directory/'inventory.json';alias.symlink_to(original)
            output,_=audit.output_paths({'sha256':'a'*64},str(alias),'runtime/unused-summary.json')
            self.assertEqual(output,alias)
            audit.publish_text(output,'new',True)
            self.assertEqual(original.read_text(),'old')
            self.assertEqual(alias.read_text(),'new')
            self.assertFalse(alias.is_symlink())

    def test_output_overrides_preserve_defaults_and_project_boundaries(self):
        target={'sha256':'a'*64}
        inventory,summary=audit.output_paths(target)
        self.assertEqual(inventory,ROOT/'runtime/coverage'/target['sha256']/'historical-range-revalidation.json')
        self.assertEqual(summary,ROOT/'docs/analysis/coverage/historical-range-revalidation.json')
        self.assertEqual(audit.output_paths(target,'runtime/benchmarks/history/inventory.json','runtime/benchmarks/history/summary.json'),
            (ROOT/'runtime/benchmarks/history/inventory.json',ROOT/'runtime/benchmarks/history/summary.json'))
        for inventory,summary in (('../outside.json',None),('docs/inventory.json',None),('runtime/same.json','runtime/same.json'),(None,'../outside.json')):
            with self.assertRaises(ValueError):audit.output_paths(target,inventory,summary)

    def test_stale_historical_census_default_requires_explicit_current_selection(self):
        target={'version':'0.110.0','path':'installed-game/AzerothSurvivors.exe','sha256':'new','size_bytes':10}
        selected={'path':'runtime/census.json','sha256':'digest'}
        with patch.object(audit,'load_json',return_value={'target':{**target,'sha256':'old'},'current_native_body_census':selected}):
            with self.assertRaisesRegex(ValueError,'required for a newly selected target'):
                audit.current_census_path(target)
        with patch.object(audit,'load_json',return_value={'target':target,'current_native_body_census':selected}), patch.object(audit,'file_sha256',return_value='digest'):
            self.assertEqual(audit.current_census_path(target),ROOT/'runtime/census.json')
        with self.assertRaises(ValueError):audit.current_census_path(target,'../outside.json')
    def test_missing_target_identity_is_not_inferred_from_folder_name(self):
        self.assertIsNone(audit.target_digest({'version':'0.105.0','sha256':'f'*64}))
        self.assertEqual(audit.target_digest({'target':{'sha256':'A'*64}}),'a'*64)
        self.assertEqual(audit.target_digest({'original_target':'old.exe','original_sha256':'b'*64}),'b'*64)
        self.assertEqual(audit.target_digest({'target':'old.exe','sha256':'c'*64}),'c'*64)
        self.assertIsNone(audit.target_digest({'target_sha256':'a'*64,'original_target':'old.exe','original_sha256':'b'*64}))
        self.assertIsNone(audit.target_digest({'artifact':{'path':'catalog.json','sha256':'a'*64}}))
    def test_owning_manifest_admits_only_an_exact_document_hash(self):
        import json
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);catalog=directory/'catalog.json';catalog.write_text('{}');manifest=directory/'manifest.json'
            document={'target_sha256':'a'*64,'output':'catalog.json','output_sha256':hashlib.sha256(b'{}').hexdigest()};manifest.write_text(json.dumps(document))
            self.assertIn(catalog,audit.manifest_target_bindings([(manifest,document)]))
            self.assertEqual(audit.manifest_target_bindings([(manifest,{**document,'output_sha256':'f'*64})]),{})
    def test_only_unambiguous_extent_size_fields_are_supported(self):
        rows=list(audit.ranges({'ranges':[{'file_offset':'0x10','start':'0x140001000','end_exclusive':'0x140001005','sha256':'f'*64},
            {'file_offset':'0x10','start':'0x140001000','end':'0x140001005','sha256':'f'*64}]}))
        self.assertEqual(len(rows),1);self.assertEqual(rows[0]['byte_count'],5)
    def test_canonical_byte_columns_must_match_the_historical_hash(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);assembly=directory/'native.asm'
            assembly.write_text('140001000: 48 83 ec 28 \tsubq $0x28, %rsp\n140001004: c3 \tretq\n140001005:      pushq %rbp\n')
            record={'address':'0x140001000','byte_count':5,'sha256':hashlib.sha256(bytes.fromhex('4883ec28c3')).hexdigest(),'assembly':'native.asm'}
            result=audit.reconstruct_range(record,directory/'manifest.json',{})
            self.assertEqual(result[0],bytes.fromhex('4883ec28c3'))
            self.assertIsNone(audit.reconstruct_range({**record,'sha256':'f'*64},directory/'manifest.json',{}))
            self.assertNotIn(0x140001005,audit.assembly_instructions(str(assembly)))
    def test_compact_hex_columns_reconstruct_only_hash_matching_ranges(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);assembly=directory/'native.asm'
            assembly.write_text('14594f765: f3410f104570 movss 0x70(%r13), %xmm0\n14594f76b: c3 retq\n14594f76c: fadd qword ptr [rax]\n14594f76e: add eax, eax\n14594f770: db 0xc3\n')
            raw=bytes.fromhex('f3410f104570c3')
            record={'address':'0x14594f765','byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'assembly':'native.asm'}
            self.assertEqual(audit.reconstruct_range(record,directory/'manifest.json',{})[0],raw)
            self.assertIsNone(audit.reconstruct_range({**record,'sha256':'f'*64},directory/'manifest.json',{}))
            self.assertEqual(set(audit.assembly_instructions(str(assembly))),{0x14594f765,0x14594f76b})
    def test_explicit_json_preimages_require_exact_length_and_digest(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);manifest=directory/'manifest.json';manifest.write_text('{}')
            raw=bytes.fromhex('4883ec28c3');digest=hashlib.sha256(raw).hexdigest()
            value={'va':'0x140001000','hex':raw.hex(),'sha256':digest}
            record=list(audit.ranges(value))[0]
            self.assertIsNone(record['file_offset']);self.assertEqual(record['byte_count'],len(raw))
            self.assertEqual(audit.reconstruct_range(record,manifest,{})[0],raw)
            self.assertIsNone(audit.reconstruct_range({**record,'byte_count':len(raw)+1},manifest,{}))
            self.assertIsNone(audit.reconstruct_range({**record,'sha256':'f'*64},manifest,{}))
            self.assertEqual(list(audit.explicit_raw({'raw_hex':'mov rax, rbx'})),[])
    def test_sibling_json_spans_require_contiguous_same_target_conflict_free_bytes(self):
        import json
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);manifest=directory/'manifest.json';manifest.write_text('{}')
            target='a'*64;document={'target_sha256':target};raw=bytes.fromhex('4883ec28c3')
            (directory/'spans.json').write_text(json.dumps({**document,'spans':[{'address':'0x140001000','raw_hex':'4883ec28'},{'address':'0x140001004','raw_hex':'c3'}]}))
            record={'address':'0x140001000','byte_count':5,'sha256':hashlib.sha256(raw).hexdigest()}
            self.assertEqual(audit.reconstruct_range(record,manifest,document)[0],raw)
            self.assertIsNone(audit.reconstruct_range(record,manifest,{'target_sha256':'b'*64}))
            (directory/'conflict.json').write_text(json.dumps({**document,'address':'0x140001004','raw_hex':'cc'}));audit.sibling_json_bytes.cache_clear()
            self.assertIsNone(audit.reconstruct_range(record,manifest,document))
    def test_utf8_literals_require_exact_bytes_and_preserve_source_identity(self):
        import json
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            path=Path(folder)/'strings.json';text='Elwynn Forest';raw=text.encode('utf8');digest=hashlib.sha256(raw).hexdigest()
            path.write_text(json.dumps({'target_sha256':'b'*64,'name':text}))
            found=audit.utf8_preimages({(len(raw),digest),(len(raw)+1,digest),(len(raw),'f'*64)},[path])
            self.assertEqual(set(found),{(len(raw),digest)})
            self.assertEqual(found[(len(raw),digest)][1]['source_target_sha256'],'b'*64)
            self.assertEqual(found[(len(raw),digest)][1]['json_pointer'],'/name')
    def test_source_artifact_admission_requires_exact_bytes_and_keeps_reference_copies_forbidden(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            directory=Path(folder);manifest=directory/'manifest.json';manifest.write_text('{}')
            raw=b'return 1';digest=hashlib.sha256(raw).hexdigest()
            path=directory/'native.lua';path.write_bytes(raw)
            record={'address':None,'raw_artifact':'native.lua','byte_count':len(raw),'sha256':digest}
            self.assertEqual(audit.reconstruct_range(record,manifest,{})[0],raw)
            path.write_bytes(raw+b'\n');result=audit.reconstruct_range(record,manifest,{})
            self.assertEqual(result[0],raw)
            self.assertEqual(result[1]['sha256'],hashlib.sha256(raw+b'\n').hexdigest())
            path.write_bytes(raw+b'!');self.assertIsNone(audit.reconstruct_range(record,manifest,{}))
            for name in ('old.exe','archive.MPQ'):
                (directory/name).write_bytes(raw)
                self.assertIsNone(audit.reconstruct_range({**record,'raw_artifact':name},manifest,{}))
    def test_global_verbatim_candidates_require_length_hash_and_source_identity(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            path=Path(folder)/'source.json';raw=bytes.fromhex('4883ec28c3');digest=hashlib.sha256(raw).hexdigest()
            document={'target_sha256':'a'*64,'row':{'payload':raw.hex()}}
            source=json.dumps(document).encode();path.write_bytes(source);snapshot=hashlib.sha256(source).hexdigest()
            # The input snapshot, not a later reread, owns the candidate bytes.
            path.write_text('{}')
            found=audit.serialized_preimages({(len(raw),digest),(len(raw)+1,digest),(len(raw),'f'*64)},[(path,document)],{path:snapshot})
            self.assertEqual(set(found),{(len(raw),digest)})
            self.assertEqual(found[(len(raw),digest)][1]['sha256'],snapshot)
            self.assertEqual(found[(len(raw),digest)][1]['source_target_sha256'],'a'*64)
            self.assertEqual(found[(len(raw),digest)][1]['json_pointer'],'/row/payload')
            self.assertEqual(audit.serialized_preimages({(len(raw),digest)},[(path,{'row':document['row']})],{path:snapshot}),{})
    def test_ordered_effect_arrays_keep_all_union_bytes_and_do_not_pad(self):
        raw1=bytes(range(64));raw2=bytes(reversed(range(64)))
        document={'effects':[{'payload':raw1.hex()},{'payload':raw2.hex()}]}
        path=ROOT/'runtime/coverage-tests/effects.json'
        rows=list(audit.serialized_json_candidates(document,path))
        self.assertIn((raw1+raw2,'/effects','ordered-verbatim-64-byte-effects'),rows)
        self.assertNotIn((raw2+raw1,'/effects','ordered-verbatim-64-byte-effects'),rows)
        partial={'effects':[{'payload':raw1.hex()},{'payload':raw2[:-1].hex()}]}
        self.assertFalse(any(encoding=='ordered-verbatim-64-byte-effects' for _,_,encoding in audit.serialized_json_candidates(partial,path)))
    def test_before_after_effect_arrays_remain_separate_exact_preimages(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            path=Path(folder)/'delta.json';old=bytes(range(64))*2;current=bytes(reversed(range(64)))*2
            effects={side:[{'payload':raw[:64].hex()},{'payload':raw[64:].hex()}] for side,raw in [('old',old),('current',current)]}
            document={'target_sha256':'b'*64,'differences':[{'fields':{'effects':effects}}]}
            source=json.dumps(document).encode();path.write_bytes(source)
            wanted={(len(raw),hashlib.sha256(raw).hexdigest()) for raw in [old,current]}
            found=audit.serialized_preimages(wanted,[(path,document)],{path:hashlib.sha256(source).hexdigest()})
            self.assertEqual(set(found),wanted)
            self.assertEqual({v[1]['json_pointer'] for v in found.values()},{'/differences/0/fields/effects/old','/differences/0/fields/effects/current'})
    def test_typed_layouts_use_the_retained_extractor_widths(self):
        path=ROOT/'docs/analysis/evidence/0.97.2/talents.json';entries=[-1,2]*11+[3]
        self.assertIn((struct.pack('<23i',*entries),'/table/relative_entries','little-endian-i32-relative-entries'),list(audit.serialized_json_candidates({'table':{'relative_entries':entries}},path)))
        self.assertEqual(list(audit.serialized_json_candidates({'table':{'relative_entries':entries[:-1]}},path)),[])
        path=ROOT/'docs/analysis/evidence/0.100.1/run-effects/entry-inputs.json'
        rows=list(audit.serialized_json_candidates({'constants':[{'bits':[0x80000000,0x7fc01234],'values':[0,0]}]},path))
        self.assertEqual(rows,[(bytes.fromhex('000000803412c07f'),'/constants/0/bits','little-endian-u32-bit-words')])
        self.assertEqual(list(audit.serialized_json_candidates({'constants':[{'bits':[1.0]}]},path)),[])
        path=ROOT/'docs/analysis/evidence/0.105.0/balance-catalog/manifest.json'
        document={'ordinary_upgrade_tables':[{'name':'TARGETS','values':[1,1,1,2,2]},{'name':'POWER','values':[.25]*5},{'name':'UNKNOWN','values':[1]*5}]}
        rows=list(audit.serialized_json_candidates(document,path))
        self.assertEqual([v[0] for v in rows],[struct.pack('<5I',1,1,1,2,2),struct.pack('<5f',*([.25]*5))])
        self.assertEqual(list(audit.serialized_json_candidates(document,ROOT/'runtime/coverage-tests/unknown-layout.json')),[])
    def test_pvp_wide_indices_are_not_truncated_or_inferred_from_percentages(self):
        path=ROOT/'docs/analysis/evidence/0.105.0/pvp-gear/data-evidence.json'
        order=[0,1,2,3,2**40,4]
        rows=list(audit.serialized_json_candidates({'collection_order':order,'drop_percent':[60,50,40,30,20,10]},path))
        self.assertEqual(rows,[(struct.pack('<6Q',*order),'/collection_order','little-endian-pvp-6Q')])
        path=ROOT/'crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json'
        self.assertEqual(list(audit.serialized_json_candidates({'zones':[{'tier':i} for i in range(12)]},path))[0][0],struct.pack('<12Q',*range(12)))
    def test_notification_vtable_and_enemy_words_preserve_exact_integer_bytes(self):
        path=ROOT/'docs/analysis/evidence/0.100.1/notifications/manifest.json';entries=[0,0,1]+list(range(0x140001000,0x14000100b))
        document={'loading_plugin_vtable':{'entries':[hex(value) for value in entries]},'constants':[{'bits':'0000803f'}]}
        rows=list(audit.serialized_json_candidates(document,path))
        self.assertIn((struct.pack('<14Q',*entries),'/loading_plugin_vtable/entries','little-endian-notification-14Q'),rows)
        self.assertIn((bytes.fromhex('0000803f'),'/constants/0/bits','verbatim-notification-constant-bytes'),rows)
        self.assertFalse(any(encoding=='little-endian-notification-14Q' for _,_,encoding in audit.serialized_json_candidates({'loading_plugin_vtable':{'entries':document['loading_plugin_vtable']['entries'][:-1]}},path)))
        path=ROOT/'docs/analysis/evidence/0.97.2/enemies/scaling-evidence.json'
        rows=list(audit.serialized_json_candidates({'constants':[{'u32_words':[0xffffffff,0x80000000,3]}]},path))
        self.assertEqual(rows,[(struct.pack('<3I',0xffffffff,0x80000000,3),'/constants/0/u32_words','little-endian-enemy-u32-words')])
    def test_archived_source_output_requires_exact_blob_hash_and_safe_source_path(self):
        path='crates/azeroth-survivors-re/assets/talents.json';raw=b'{"classes": []}\n';digest=hashlib.sha256(raw).hexdigest();commit='a'*40
        audit.committed_json_output.cache_clear()
        with patch.object(audit.subprocess,'check_output',side_effect=[commit+'\n',raw]) as command:
            document,source=audit.committed_json_output(path,digest)
            self.assertEqual(document,{'classes':[]});self.assertEqual(source,{'path':path,'commit':commit,'sha256':digest})
            self.assertEqual(command.call_args_list[1].args[0],['git','show',commit+':'+path])
        audit.committed_json_output.cache_clear()
        with patch.object(audit.subprocess,'check_output',side_effect=[commit+'\n',raw]):
            self.assertIsNone(audit.committed_json_output(path,'f'*64))
        with patch.object(audit.subprocess,'check_output') as command:
            for forbidden in ('old.exe','archive.MPQ','/outside/assets.json','crates/azeroth-survivors-re/assets/../old.json','runtime/old.json'):
                self.assertIsNone(audit.committed_json_output(forbidden,digest))
            command.assert_not_called()
        audit.committed_json_output.cache_clear()
    def test_archived_asset_preimage_retains_manifest_target_and_git_witness(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder:
            path=Path(folder)/'manifest.json';raw=bytes(range(64))*2;asset={'effects':[{'payload':raw[:64].hex()},{'payload':raw[64:].hex()}]}
            blob=json.dumps(asset).encode();output='crates/azeroth-survivors-re/assets/talents.json'
            manifest={'target_sha256':'b'*64,'output':output,'output_sha256':hashlib.sha256(blob).hexdigest()}
            source=json.dumps(manifest).encode();path.write_bytes(source);digest=hashlib.sha256(raw).hexdigest()
            audit.committed_json_output.cache_clear()
            with patch.object(audit.subprocess,'check_output',side_effect=['a'*40+'\n',blob]):
                result=audit.serialized_preimages({(len(raw),digest)},[(path,manifest)],{path:hashlib.sha256(source).hexdigest()})[(len(raw),digest)]
            self.assertEqual(result[0],raw);self.assertEqual(result[1]['source_target_sha256'],'b'*64)
            self.assertEqual(result[1]['path'],path.relative_to(ROOT).as_posix())
            self.assertEqual(result[1]['git_source']['sha256'],manifest['output_sha256'])
            self.assertEqual(result[1]['json_pointer'],'/output')
            self.assertEqual(result[1]['git_source']['json_pointer'],'/effects')
            audit.committed_json_output.cache_clear()
    def test_archived_real_talent_payloads_match_all_354_original_effect_ranges(self):
        path=ROOT/'docs/analysis/evidence/0.97.2/talents.json';source=path.read_bytes();document=json.loads(source)
        wanted={(row['effects']['byte_count'],row['effects']['sha256']) for row in document['records']}
        found=audit.serialized_preimages(wanted,[(path,document)],{path:hashlib.sha256(source).hexdigest()})
        self.assertEqual(len(document['records']),354)
        self.assertEqual(set(found),wanted)
        for count,digest in wanted:
            self.assertEqual(len(found[(count,digest)][0]),count)
            self.assertEqual(hashlib.sha256(found[(count,digest)][0]).hexdigest(),digest)
            self.assertEqual(found[(count,digest)][1]['git_source']['sha256'],document['output_sha256'])
if __name__=='__main__':unittest.main()
