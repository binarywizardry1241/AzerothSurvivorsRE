#!/usr/bin/env python3
"""Synthetic admission/binding regressions; project-local fixtures, no compilation."""
from collections import Counter
from copy import deepcopy
from contextlib import closing
import ast
import gzip
import json
from pathlib import Path
import sqlite3
import tempfile
import unittest
from unittest.mock import patch

from coverage_common import ROOT, file_sha256
from native_residual_inputs import SUPPORT, checker, packed, verified_classifications
import hashlib


class ClassificationInputs(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(dir=ROOT/'runtime', prefix='residual-admission-')
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.target = dict(version='fixture', path='installed-game/fixture.exe', sha256='a'*64, size_bytes=12)
        self.directory = self.root/'docs/analysis/evidence/fixture'
        self.directory.mkdir(parents=True)
        self.path = self.directory/'native-residuals.json'
        self.census_path = 'docs/analysis/coverage/full-image-census.json'
        files = {}
        for name in ('instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz', 'externals.tsv.gz', 'direct-call-helpers.tsv.gz'):
            text = ('address\tlength\tbytes\tflow\n1000\t1\t90\tFALL_THROUGH\n1002\t2\tffd0\tCOMPUTED_CALL\n1004\t1\tc3\tTERMINATOR\n'
                    if name == 'instructions.tsv.gz' else 'fixture\n')
            files[name] = self.gzip('runtime/census/'+name, text)
        self.census = dict(target=self.target, counts=dict(instructions=3, references=4, computed_calls=1, computed_jumps=0),
            diagnostic_binding_counts=dict(verified_sites=2, sites_without_actual_native_owner=1),
            independent_instructions=dict(exact_source_bytes_verified=True),
            artifacts=dict(directory='runtime/census', files=files))
        self.write_json(self.census_path, self.census)
        independent = {}
        for name in ('instruction-summary', 'unwind-complement-summary', 'diagnostic-ownership'):
            inventory = 'runtime/'+name+'.sqlite' if name != 'diagnostic-ownership' else 'runtime/diagnostics.json'
            p = self.root/inventory
            if name != 'diagnostic-ownership':
                with closing(sqlite3.connect(p)) as db, db:
                    db.execute('CREATE TABLE refs (site INTEGER,kind TEXT,bytes TEXT,operand INTEGER,access INTEGER,extent INTEGER)')
                    db.execute('CREATE TABLE instructions (site INTEGER,bytes TEXT)')
                    site, kind, raw = (0x1002,'call_indirect','ffd0') if name == 'instruction-summary' else (0x2000,'jump_indirect','ffe0')
                    db.execute('INSERT INTO refs VALUES (?,?,?,?,?,?)',(site,kind,raw,0,0,1))
                    db.execute('INSERT INTO instructions VALUES (?,?)',(site,raw))
            else:
                self.write_json(inventory, dict(target=self.target, diagnostics=[]))
            counts = (dict(reference_kinds=dict(call_indirect=1,jump_indirect=0,memory=3),unwind_extents=1)
                      if name == 'instruction-summary' else
                      dict(reference_kinds=dict(jump_indirect=1,memory=1),stop_reasons=dict(return_=1),complement_regions=1))
            summary = dict(target=self.target, inventory=self.receipt(inventory), counts=counts)
            path = 'docs/analysis/coverage/'+name+'.json'
            self.write_json(path, summary)
            independent[name] = dict(summary=self.receipt(path), inventory=self.receipt(inventory))
        row_counts = {'diagnostic-sites.jsonl.gz':2,'static-reference-roles.tsv.gz':4,
            'ownerless-reference-sources.tsv.gz':1,'unowned-executable-destinations.tsv.gz':1,
            'declared-reference-roles.tsv.gz':4,'declared-indirect-sites.tsv.gz':1,
            'declared-extent-roles.tsv.gz':1,'complement-reference-roles.tsv.gz':2,
            'complement-indirect-sites.tsv.gz':1,'complement-stops.jsonl.gz':1,
            'complement-region-roles.tsv.gz':1,'ownerless-instructions.tsv.gz':0}
        artifacts = {}
        for name,n in row_counts.items():
            content = ('{}\n'*n if name.endswith('.jsonl.gz') else 'fixture\n'+'row\n'*n)
            if name in ('declared-indirect-sites.tsv.gz','complement-indirect-sites.tsv.gz'):
                content = 'site\tsource_owner\n'+('1002\t0x1000\n' if name.startswith('declared') else '2000\t\n')
            artifacts[name] = dict(self.gzip('runtime/residuals/'+name, content), rows=n)
        self.write_bytes('scripts/classify-native-residuals.py', b'fixture generator')
        inputs = [self.receipt(self.census_path),*files.values()]
        for value in independent.values(): inputs.extend(value.values())
        self.record = dict(target=deepcopy(self.target), explicit_residual_sets_available=True,
            generator=self.receipt('scripts/classify-native-residuals.py'),dependencies=[],inputs=inputs,
            artifacts=artifacts,independent_inputs=independent,
            counts=dict(instruction_records=3,ownerless_instruction_records=0,static_reference_records=4,
                reference_records_with_ownerless_sources=1,distinct_unowned_executable_destinations=1,
                diagnostic_sites=dict(records=2,owned=1,ownerless=1)),
            source_semantics_complete=False,global_aliasing_complete=False,
            computed_runtime_targets_complete=False,parity_verified=False)

    def write_bytes(self, name, raw):
        path = self.root/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(raw)

    def write_json(self, name, value):
        self.write_bytes(name,json.dumps(value).encode())

    def receipt(self, name):
        return dict(path=name,sha256=file_sha256(self.root/name))

    def gzip(self, name, text):
        self.write_bytes(name,gzip.compress(text.encode(),mtime=0))
        return self.receipt(name)

    def run_record(self):
        self.write_json(self.path.relative_to(self.root),self.record)
        return verified_classifications(self.target,root=self.root)

    def test_explicit_census_does_not_fall_back_to_default(self):
        alternate = 'docs/analysis/coverage/expanded.json'
        self.write_json(alternate,self.census)
        old = self.receipt(self.census_path)
        self.record['inputs'] = [self.receipt(alternate) if item == old else item
                                 for item in self.record['inputs']]
        self.write_json(self.path.relative_to(self.root),self.record)
        stale = deepcopy(self.census)
        stale['target']['sha256'] = 'b'*64
        self.write_json(self.census_path,stale)
        result = verified_classifications(self.target,root=self.root,census_summary=alternate)
        self.assertEqual(result['residual_counts']['instruction_records'],3)
        self.assertTrue(result['explicit_ownerless_site_inventory_available'])

    def test_explicit_census_requires_its_own_commitment(self):
        alternate = 'docs/analysis/coverage/expanded.json'
        self.write_json(alternate,self.census)
        self.write_json(self.path.relative_to(self.root),self.record)
        with self.assertRaisesRegex(ValueError,'owning census commitment'):
            verified_classifications(self.target,root=self.root,census_summary=alternate)

    def ownership(self):
        row = dict(site='0x1002',kind='call',instruction_bytes='ffd0',ghidra_flow='COMPUTED_CALL',
            runtime_dispatch_verified=False,unknown_reason='register-value-not-established-in-observed-block')
        value = dict(target=self.target,census_summary=self.census_path,
            census_summary_sha256=self.receipt(self.census_path)['sha256'],
            artifact=self.gzip('runtime/ownership.jsonl.gz',json.dumps(row)+'\n'),
            indirect_counts=dict(actual_indirect_call=1),
            unknown_indirect_reasons={'call:register-value-not-established-in-observed-block':1},
            computed_flow_non_call_or_jump_mnemonics={})
        self.write_json(self.directory.relative_to(self.root)/'native-ownership.json',value)
        return value

    def independent(self):
        self.ownership()
        self.run_record()
        producer = checker('check-independent-indirects').producer_module()
        for name in (producer.GENERATOR,*producer.DEPENDENCIES): self.write_bytes(name,b'fixture script')
        inputs = [self.receipt(self.census_path)]
        ownership = self.receipt((self.directory/'native-ownership.json').relative_to(self.root).as_posix())
        residual = self.receipt(self.path.relative_to(self.root).as_posix())
        inputs.extend([ownership,residual])
        bindings, rows, hist, per = {}, [], Counter(), {}
        for lead,name,label,site,kind,raw,owner,present in [
                ('Q41-F01','instruction-summary','declared','0x1002','call_indirect','ffd0','0x1000',True),
                ('Q41-F02','unwind-complement-summary','complement','0x2000','jump_indirect','ffe0',None,False)]:
            binding = dict(self.record['independent_inputs'][name],expected_records=1,
                residual_artifact=self.record['artifacts'][label+'-indirect-sites.tsv.gz'])
            bindings[lead] = binding
            inputs.extend([binding['summary'],binding['inventory']])
            row = dict(lead_id=lead,site=site,kind=kind,instruction_bytes=raw,operand=0,access=0,
                extent_ordinal=1 if label=='declared' else None,operand_state=dict(width_bytes=8,operand_class='register',register='rax'),
                slot_binding=dict(kind='dynamic-address-state-required'),ghidra_indirect_record_present=present,
                observed_body_owner=owner,ghidra_initial_target=None)
            for flag in ('initial_image_binding_is_runtime_dispatch','incoming_register_state_established',
                    'global_aliasing_complete','runtime_dispatch_verified','source_semantics_established'):row[flag]=False
            rows.append(row)
            keys=['records','kind:'+kind,'operand:register','binding:dynamic-address-state-required',
                'ghidra:'+('present' if present else 'absent'),'body:'+('present' if owner else 'absent')]
            per[lead]=dict(Counter(keys));hist.update(keys)
        value = dict(target=self.target,generator=self.receipt(producer.GENERATOR),
            dependencies=[self.receipt(n) for n in producer.DEPENDENCIES],source_census=self.receipt(self.census_path),
            inputs=inputs,ghidra_ownership=ownership,residual_summary=residual,
            independent_inputs=bindings,per_lead=per,counts=dict(hist),exact_selected_sites_classified=True,
            artifact=dict(self.gzip('runtime/indirects.jsonl.gz',''.join(json.dumps(r)+'\n' for r in rows)),rows=2))
        for flag in ('computed_runtime_targets_complete','source_semantics_complete','global_aliasing_complete','parity_verified'):value[flag]=False
        self.write_json(self.directory.relative_to(self.root)/'independent-indirects.json',value)
        return value,rows

    def support_fixture(self, name):
        """Small coherent source populations, never copied production artifacts."""
        if not hasattr(self,'support_rows'):
            self.support_rows=[]
            specifications=[('crates/missing-native-file.rs','AS-custom-path','0x1000',True),
                ('crates/missing-ownerless-file.rs','AS-custom-path',None,True),
                ('crates/coop/route.rs','excluded-coop-path','0x1000',True),
                ('crates/engine.rs','shared-engine-or-other-path',None,False)]
            diagnostics=[]
            for i,(path,context,owner,custom) in enumerate(specifications):
                row=dict(path=path,context=context,actual_body_owner=owner,kind='rust_location',
                    instruction_address=hex(0x1100+i),target_address=hex(0x3100+i),
                    runtime_function_start='0x1000',runtime_function_end='0x1200',owner_sha256='c'*64,
                    source_line=1,source_column=2)
                self.support_rows.append(row)
                diagnostics.append(dict(path=path,custom_game_crate=custom,verified_references=[row]))
            self.write_json('runtime/diagnostics.json',dict(target=self.target,diagnostics=diagnostics))
            path='docs/analysis/coverage/diagnostic-ownership.json'
            summary=json.loads((self.root/path).read_text());summary['inventory']=self.receipt('runtime/diagnostics.json')
            self.write_json(path,summary)
            self.record['independent_inputs']['diagnostic-ownership']=dict(summary=self.receipt(path),inventory=self.receipt('runtime/diagnostics.json'))
            self.census['diagnostic_binding_counts']=dict(verified_sites=4,sites_without_actual_native_owner=2)
            self.write_json(self.census_path,self.census)
            art=self.record['artifacts']['diagnostic-sites.jsonl.gz']
            art.update(self.gzip(art['path'],''.join(json.dumps(x)+'\n' for x in self.support_rows)),rows=4)
            self.record['counts']['diagnostic_sites']=dict(records=4,owned=2,ownerless=2)
            self.record['inputs']=[self.receipt(r['path']) for r in self.record['inputs']]
            self.write_json(self.path.relative_to(self.root),self.record)
            self.write_json('docs/analysis/evidence/fixture/addon-timers/integration.json',dict(target_sha256=self.target['sha256']))
        path=self.directory/(name+'.json')
        if path.exists():return json.loads(path.read_text())
        generator,dep_field,deps,_=SUPPORT[name]
        for file in ([generator] if generator else [])+list(deps):self.write_bytes(file,b'fixture supporting tool')
        r=dict(target=self.target,schema_version=1,source_semantics_complete=False,native_semantics_complete=False,
            global_native_semantics_complete=False,global_aliasing_complete=False,global_classification_semantics_complete=False,
            dynamic_dispatch_verified=False,parity_verified=False,gameplay_parity_verified=False)
        if generator:r['generator']=self.receipt(generator)
        r[dep_field]=[self.receipt(p) for p in deps]
        census=self.receipt(self.census_path)
        body=self.census['artifacts']['files']['bodies.tsv.gz']
        diagnostic=self.receipt('runtime/diagnostics.json')
        if name=='native-operands':
            operand=dict(site='0x1002',target='0x5000',instruction_bytes='488d05f73f0000',source_native_owner='0x1000',
                kind='address-expression',program_reference_pair_present=False)
            r.update(source_census=census,diagnostic_input=diagnostic,verified_instruction_count=3,
                inventory=self.gzip('runtime/operands.jsonl.gz',json.dumps(operand)+'\n'),
                all_explicit_operand_domains={'explicit-static-memory-or-address':1},
                retained_explicit_operand_counts={'address-expression':1,'address-expression:program-pair-absent':1},source_ownership={'source-owned':1},
                complete_runtime_aliases_or_source_semantics=False)
            details=dict(r,unowned_executable_address_candidates=[dict(destination='0x5000',decode_status='not-observed')],
                exact_import_thunk_candidates=[],import_slot_ownership=[],diagnostic_path_ownership=[])
            self.write_json('runtime/operand-details.json',details)
            r.update(details=self.receipt('runtime/operand-details.json'),unowned_executable_candidates=dict(destinations=1,
                exact_observed_instructions=0,observed_instruction_interiors=0,not_observed=1,exact_import_thunk_sources=0),
                import_slots_with_owned_explicit_operands=0,diagnostic_paths_with_explicit_operands=0)
        elif name=='native-address-leads':
            operand=self.support_fixture('native-operands')
            r.update(source_census=census,operand_summary=self.receipt('docs/analysis/evidence/fixture/native-operands.json'),
                function_entry_or_incoming_flow_edges_inferred=False,
                counts=dict(addressed_executable_targets=1,admitted_code_only_starts=1,retained_existing_instruction_starts=0,exceptions={}))
            seed=dict(site='0x5000',source_site='0x1002',source_instruction_bytes='488d05f73f0000',source_native_owner='0x1000',
                instruction_bytes='90',function_entry_or_incoming_flow_established=False,
                code_validation=dict(instructions=[dict(site='0x5000',instruction_bytes='90')],byte_count=1,validation_basis='bounded-coherent-new-code'))
            self.write_json('runtime/address-inventory.json',dict(r,code_only_seeds=[seed],exceptions=[]))
            r['inventory']=self.receipt('runtime/address-inventory.json')
        elif name in ('q41-custom-diagnostics','engine-diagnostic-roles'):
            r.update(selector='all selected fixture diagnostic rows',counts={},declared_extents=[],helpers=[])
            if name=='q41-custom-diagnostics':
                x=self.support_rows[1]
                site=dict(path=x['path'],site=x['instruction_address'],diagnostic_target=x['target_address'],reference_kind=x['kind'],callee='0x6000',role='fixture-interface',declared_extent=['0x1000','0x1200'])
                r.update(inputs={'diagnostic-ownership':diagnostic,'ghidra-bodies':body},sites=[site],excluded_sites=[],selected_site_roles_classified=True,
                    counts=dict(classified_sites=1,excluded_sites=0,paths=1,roles={'fixture-interface':1}))
                projection=[[site[k] for k in ('path','site','diagnostic_target','reference_kind','callee','role')]]
                r['classification_digest']=hashlib.sha256(''.join(json.dumps(x,separators=(',',':'))+'\n' for x in projection).encode()).hexdigest()
            else:
                self.support_fixture('q41-custom-diagnostics');x=self.support_rows[3]
                r.update(inputs=dict(diagnostics=diagnostic,saved_bodies=body,canonical_D01=self.receipt('docs/analysis/evidence/fixture/q41-custom-diagnostics.json')),
                    classification_boundary_complete=True,paths=[x['path']],
                    site_columns=['path_index','instruction','data_target','kind','source_line','source_column','extent_index','first_call','first_consumer','flow_address_and_bytes_sha256','selected_pointer_carriers'],
                    sites=[[0,x['instruction_address'],x['target_address'],x['kind'],1,2,0,'0x6000','0x6000','d'*64,['r8']]],
                    declared_extents=[['0x1000','0x1200','c'*64]],
                    counts=dict(sites=1,paths=1,declared_extents=1,rust_locations=1,path_literals=0,roles={'fixture-interface':1}))
                r['classification_digest']=hashlib.sha256(packed(r['sites'])).hexdigest()
        elif name=='owned-custom-diagnostics':
            self.support_fixture('engine-diagnostic-roles')
            x=self.support_rows[0]
            leaf=dict(role='fixture-interface',boundary='direct_call',guards=[],complete_native_semantics=False)
            row=dict(residual_ordinal=0,path=x['path'],site=x['instruction_address'],actual_body_owner=x['actual_body_owner'],
                declared_extent=[x['runtime_function_start'],x['runtime_function_end']],declared_extent_sha256=x['owner_sha256'],
                data_contract=dict(target=x['target_address'],kind=x['kind']),first_interface_paths=[leaf],
                selected_first_interfaces_are_source_semantics=False,parity_verified=False,both_conditional_successors_followed=True)
            y=self.support_rows[2];excluded=dict(residual_ordinal=2,path=y['path'],site=y['instruction_address'],
                actual_body_owner=y['actual_body_owner'],gameplay_recovered=False,custom_game_crate=True)
            ownerless=self.receipt('docs/analysis/evidence/fixture/q41-custom-diagnostics.json');engine=self.receipt('docs/analysis/evidence/fixture/engine-diagnostic-roles.json')
            r.update(selector='all owned fixture diagnostic rows',canonical_ownerless_proof=ownerless,canonical_engine_proof=engine,
                inputs=[self.receipt(self.path.relative_to(self.root).as_posix()),self.record['artifacts']['diagnostic-sites.jsonl.gz'],census,body,ownerless,engine,diagnostic,
                    self.receipt('docs/analysis/evidence/fixture/addon-timers/integration.json')],
                artifacts=dict(owned_AS=dict(self.gzip('runtime/owned.jsonl.gz',json.dumps(row)+'\n'),rows=1),
                    excluded_context=dict(self.gzip('runtime/excluded.jsonl.gz',json.dumps(excluded)+'\n'),rows=1)),
                finite_bounds=dict(instructions_per_path=256,conditional_guards_per_path=16,paths_per_site=256),
                declared_extents=[],first_helpers=[],failure_wrappers=[],supporting_interfaces=[],classification_boundary_complete=True,both_conditional_successors_followed=True,
                selection_digest=hashlib.sha256(packed([[0,x['path'],x['instruction_address'],x['target_address'],x['kind']]])).hexdigest(),
                counts=dict(owned_AS_sites=1,owned_AS_rust_locations=1,owned_AS_path_literals=0,owned_AS_paths=1,
                    owned_excluded_context_sites=1,owned_excluded_custom_sites=1,owned_excluded_noncustom_sites=0,
                    all_custom_D01_sites=3,AS_D01_sites=2,excluded_custom_D01_sites=1,ownerless_AS_sites=1,ownerless_excluded_custom_sites=0,
                    first_interface_paths=1,first_interface_roles={'fixture-interface':1},first_interface_boundaries={'direct_call':1},paths={x['path']:1},
                    branching_owned_AS_sites=0,owned_AS_sites_with_unresolved_boundary=0,owned_AS_sites_with_only_classified_boundaries=1))
        elif name=='unowned-unwind-destinations':
            art=self.record['artifacts']['unowned-executable-destinations.tsv.gz'];art.update(self.gzip(art['path'],'destination\treference_records\n5000\t1\n'))
            self.write_json(self.path.relative_to(self.root),self.record)
            r.update(selector='all unowned fixture destinations',inputs={'bodies.tsv.gz':body,'references.tsv.gz':self.census['artifacts']['files']['references.tsv.gz']},
                field_projection=['source','destination','field_role','unwind_flags','UNWIND_INFO_address'],field_classification_sha256='c'*64,
                selected_field_roles_classified=True,import_thunks=[],native_callbacks=[dict(entry='0x5000',source_reference_count=1,handler_metadata=[{}],role='fixture-callback',reachable_instructions=1,reachable_bytes=1,flow_commitment='c'*64,code_ranges=[])],
                counts=dict(selected_reference_records=1,handler_rva_fields=1,distinct_destinations=1,import_thunk_fields=0,native_callback_fields=1,native_callbacks=1,import_thunks=0))
        elif name=='as-address-candidates':
            address=self.support_fixture('native-address-leads')
            source='pub fn health_polynomial() -> f32 { 1.0 }'
            self.write_bytes('crates/fixture.rs',source.encode())
            self.write_json('runtime/as-cases.json',dict(target=self.target,hp_cases=[dict(kind='hp-helper'),dict(kind='hp-caller')],support_thunk_cases=[{}]))
            r.update(inputs=[self.receipt(self.path.relative_to(self.root).as_posix()),self.record['artifacts']['diagnostic-sites.jsonl.gz'],census,body,
                    self.receipt('docs/analysis/evidence/fixture/native-address-leads.json'),address['inventory']],
                source_contract=dict(path='crates/fixture.rs',function='health_polynomial',body_sha256=hashlib.sha256(source.encode()).hexdigest()),
                exact_direct_AS_context_candidates=[dict(site='0x5000',source_site='0x1002',source_native_owner='0x1000',direct_diagnostic_context=[self.support_rows[0]['path']])],
                ranges={'fixture':dict(start='0x5000',end_exclusive='0x5001',sha256='c'*64,instruction_count=1)},cases=self.receipt('runtime/as-cases.json'),checks=dict(hp_helper_cases=1,hp_caller_cases=1,support_thunk_cases=1))
        self.write_json(path.relative_to(self.root),r)
        return r

    def test_complete_bound_population_is_available_without_semantic_promotion(self):
        value=self.run_record()
        self.assertTrue(value['explicit_ownerless_site_inventory_available'])
        self.assertFalse(value['computed_destination_classification_available'])
        for field in ('global_native_semantics_complete','global_aliasing_complete','parity_verified'):self.assertFalse(value[field])

    def test_absent_optional_proof_does_not_invent_inventory(self):
        self.assertEqual(verified_classifications(self.target,root=self.root)['proofs'],{})

    def test_wrong_target_is_rejected(self):
        self.record['target']['sha256']='b'*64
        with self.assertRaisesRegex(ValueError,'target differs'):self.run_record()

    def test_same_target_substituted_artifact_is_rejected(self):
        self.record['artifacts']['diagnostic-sites.jsonl.gz']['sha256']='b'*64
        with self.assertRaisesRegex(ValueError,'artifact changed'):self.run_record()

    def test_missing_artifact_is_rejected(self):
        (self.root/self.record['artifacts']['diagnostic-sites.jsonl.gz']['path']).unlink()
        with self.assertRaisesRegex(ValueError,'artifact missing'):self.run_record()

    def test_escape_is_rejected_before_read(self):
        self.record['artifacts']['diagnostic-sites.jsonl.gz']['path']='../outside'
        with self.assertRaisesRegex(ValueError,'escapes project'):self.run_record()

    def test_truncated_population_is_rejected(self):
        self.record['counts']['static_reference_records']-=1
        with self.assertRaisesRegex(ValueError,'Reference total differs'):self.run_record()

    def test_incomplete_set_is_rejected(self):
        self.record['explicit_residual_sets_available']=False
        with self.assertRaisesRegex(ValueError,'unavailable'):self.run_record()

    def test_required_residual_receipts_cannot_be_omitted(self):
        original=deepcopy(self.record['artifacts'])
        for names in ([],['ownerless-instructions.tsv.gz'],['diagnostic-sites.jsonl.gz']):
            with self.subTest(names=names):
                self.record['artifacts']={k:v for k,v in original.items() if k not in names} if names else {}
                with self.assertRaisesRegex(ValueError,'artifact set differs'):self.run_record()

    def test_rehashed_empty_or_truncated_residual_is_rejected(self):
        item=self.record['artifacts']['diagnostic-sites.jsonl.gz']
        for text in ('','{}\n'):
            item.update(self.gzip(item['path'],text))
            with self.assertRaisesRegex(ValueError,'Truncated/extra'):self.run_record()

    def test_residual_census_commitment_is_required(self):
        self.record['inputs'].remove(self.receipt(self.census_path))
        with self.assertRaisesRegex(ValueError,'census commitment missing'):self.run_record()

    def test_residual_census_requires_exact_byte_verification(self):
        old=self.receipt(self.census_path)
        self.census['independent_instructions']['exact_source_bytes_verified']=False
        self.write_json(self.census_path,self.census)
        self.record['inputs'].remove(old)
        self.record['inputs'].append(self.receipt(self.census_path))
        with self.assertRaisesRegex(ValueError,'source-byte verification'):self.run_record()

    def test_independent_summary_binding_cannot_be_omitted_or_substituted(self):
        self.record['independent_inputs']['instruction-summary']['inventory']=self.receipt('runtime/diagnostics.json')
        with self.assertRaisesRegex(ValueError,'inventory does not match'):self.run_record()

    def test_native_diagnostic_paths_are_not_file_receipts(self):
        self.support_fixture('q41-custom-diagnostics')
        self.assertTrue(self.run_record()['explicit_ownerless_site_inventory_available'])

    def test_ownership_requires_actual_complete_inventory(self):
        value=self.ownership()
        self.assertTrue(self.run_record()['computed_destination_classification_available'])
        value['artifact']=self.gzip(value['artifact']['path'],'')
        self.write_json(self.directory.relative_to(self.root)/'native-ownership.json',value)
        with self.assertRaisesRegex(ValueError,'exact indirect population'):self.run_record()

    def test_ownership_filename_and_census_alone_are_insufficient(self):
        value=self.ownership();del value['artifact']
        self.write_json(self.directory.relative_to(self.root)/'native-ownership.json',value)
        with self.assertRaises((ValueError,KeyError)):self.run_record()

    def test_ownership_stale_census_is_rejected(self):
        value=self.ownership();value['census_summary_sha256']='b'*64
        self.write_json(self.directory.relative_to(self.root)/'native-ownership.json',value)
        with self.assertRaisesRegex(ValueError,'artifact changed'):self.run_record()

    def test_rehashed_ownership_site_substitution_is_rejected(self):
        value=self.ownership()
        row=json.loads(gzip.decompress((self.root/value['artifact']['path']).read_bytes()))
        row['site']='0x1003'
        value['artifact']=self.gzip(value['artifact']['path'],json.dumps(row)+'\n')
        self.write_json(self.directory.relative_to(self.root)/'native-ownership.json',value)
        with self.assertRaisesRegex(ValueError,'site/bytes/flow'):self.run_record()

    def test_exact_independent_rows_are_available(self):
        self.independent()
        self.assertIn('independent-indirects',self.run_record()['proofs'])

    def test_independent_rehashed_truncation_is_rejected(self):
        value,rows=self.independent()
        value['artifact'].update(self.gzip(value['artifact']['path'],json.dumps(rows[0])+'\n'))
        self.write_json(self.directory.relative_to(self.root)/'independent-indirects.json',value)
        with self.assertRaisesRegex(ValueError,'histogram differs'):self.run_record()

    def test_independent_requires_artifact_receipt(self):
        value,_=self.independent();del value['artifact']
        self.write_json(self.directory.relative_to(self.root)/'independent-indirects.json',value)
        with self.assertRaises((ValueError,KeyError)):self.run_record()

    def test_independent_empty_rehashed_inventory_is_rejected(self):
        value,_=self.independent()
        value['artifact'].update(self.gzip(value['artifact']['path'],''))
        self.write_json(self.directory.relative_to(self.root)/'independent-indirects.json',value)
        with self.assertRaisesRegex(ValueError,'histogram differs'):self.run_record()

    def test_optimistic_claims_are_rejected(self):
        for field in ('source_semantics_complete','global_aliasing_complete','computed_runtime_targets_complete',
                'parity_verified','native_semantics_complete','global_classification_semantics_complete',
                'dynamic_dispatch_verified','runtime_dispatch_verified'):
            with self.subTest(field=field):
                self.record[field]=True
                with self.assertRaisesRegex(ValueError,'cannot certify'):self.run_record()
                self.record[field]=False

    def test_target_only_is_rejected_for_every_admitted_name(self):
        for name in ('native-residuals','native-ownership','independent-indirects',*SUPPORT):
            with self.subTest(name=name):
                path=self.directory/(name+'.json')
                self.write_json(path.relative_to(self.root),dict(target=self.target))
                with self.assertRaises((ValueError,KeyError)):verified_classifications(self.target,root=self.root)
                path.unlink()

    def test_all_supporting_fixture_populations_are_admitted(self):
        for name in SUPPORT:self.support_fixture(name)
        value=self.run_record()
        self.assertTrue(set(SUPPORT).issubset(value['proofs']))
        self.assertFalse(value['global_native_semantics_complete'])
        self.assertFalse(value['parity_verified'])

    def test_required_support_commitments_and_populations_cannot_be_omitted(self):
        for name in SUPPORT:
            record=self.support_fixture(name)
            generator,dep_field,_,fields=SUPPORT[name]
            population={'native-operands':'inventory','native-address-leads':'inventory','q41-custom-diagnostics':'sites',
                'engine-diagnostic-roles':'sites','unowned-unwind-destinations':'native_callbacks',
                'owned-custom-diagnostics':'artifacts','as-address-candidates':'exact_direct_AS_context_candidates'}[name]
            mandatory=['generator' if generator else dep_field,dep_field,population]
            mandatory.extend(field for field in ('inputs','source_census') if field in fields)
            for field in dict.fromkeys(mandatory):
                with self.subTest(name=name,field=field):
                    changed=deepcopy(record);del changed[field]
                    self.write_json((self.directory/(name+'.json')).relative_to(self.root),changed)
                    with self.assertRaises((ValueError,KeyError)):self.run_record()
                    self.write_json((self.directory/(name+'.json')).relative_to(self.root),record)

    def test_operand_dependency_schema_matches_emitted_producer_contract(self):
        source=ast.parse((ROOT/'scripts/audit-native-operands.py').read_text())
        assignments=[node for node in ast.walk(source) if isinstance(node,ast.Assign)
                     and any(isinstance(target,ast.Name) and target.id=='dependencies' for target in node.targets)]
        self.assertEqual(len(assignments),1)
        emitted=assignments[0].value
        self.assertIsInstance(emitted,ast.ListComp)
        names=ast.literal_eval(emitted.generators[0].iter)
        self.assertEqual(set(names),set(SUPPORT['native-operands'][2]))
        self.assertEqual(len(names),len(SUPPORT['native-operands'][2]))

    def test_operand_cache_and_publication_dependencies_remain_required_and_hash_bound(self):
        record=self.support_fixture('native-operands')
        path=(self.directory/'native-operands.json').relative_to(self.root)
        for name in ('scripts/instruction_facts.py','scripts/derived_gzip.py'):
            with self.subTest(dependency=name,mutation='omitted'):
                changed=deepcopy(record)
                changed['generator_dependencies']=[row for row in changed['generator_dependencies'] if row['path']!=name]
                self.write_json(path,changed)
                with self.assertRaisesRegex(ValueError,'dependency set differs'):self.run_record()
            with self.subTest(dependency=name,mutation='changed'):
                self.write_json(path,record)
                original=(self.root/name).read_bytes()
                self.write_bytes(name,original+b' changed')
                with self.assertRaisesRegex(ValueError,'artifact changed'):self.run_record()
                self.write_bytes(name,original)
        self.write_json(path,record)
        self.assertIn('native-operands',self.run_record()['proofs'])

    def reject_support_mutation(self,name,mutate):
        record=self.support_fixture(name);mutate(record)
        self.write_json((self.directory/(name+'.json')).relative_to(self.root),record)
        with self.assertRaises(ValueError):self.run_record()

    def test_rehashed_empty_operand_population_is_rejected(self):
        def mutate(r):
            r['inventory']=self.gzip(r['inventory']['path'],'')
            detail=json.loads((self.root/r['details']['path']).read_text());detail['inventory']=r['inventory']
            self.write_json(r['details']['path'],detail);r['details']=self.receipt(r['details']['path'])
        self.reject_support_mutation('native-operands',mutate)

    def test_rehashed_truncated_address_population_is_rejected(self):
        def mutate(r):
            full=json.loads((self.root/r['inventory']['path']).read_text());full['code_only_seeds']=[]
            self.write_json(r['inventory']['path'],full);r['inventory']=self.receipt(r['inventory']['path'])
        self.reject_support_mutation('native-address-leads',mutate)

    def test_custom_diagnostic_same_count_site_substitution_is_rejected(self):
        self.reject_support_mutation('q41-custom-diagnostics',lambda r:r['sites'][0].update(site='0xdead'))

    def test_engine_diagnostic_same_count_site_substitution_is_rejected(self):
        def mutate(r):
            r['sites'][0][1]='0xdead';r['classification_digest']=hashlib.sha256(packed(r['sites'])).hexdigest()
        self.reject_support_mutation('engine-diagnostic-roles',mutate)

    def test_owned_diagnostic_same_count_site_substitution_is_rejected(self):
        def mutate(r):
            item=r['artifacts']['owned_AS'];row=json.loads(gzip.decompress((self.root/item['path']).read_bytes()))
            row['site']='0xdead';item.update(self.gzip(item['path'],json.dumps(row)+'\n'))
        self.reject_support_mutation('owned-custom-diagnostics',mutate)

    def test_owned_excluded_same_count_site_substitution_is_rejected(self):
        def mutate(r):
            item=r['artifacts']['excluded_context'];row=json.loads(gzip.decompress((self.root/item['path']).read_bytes()))
            row['site']='0xdead';item.update(self.gzip(item['path'],json.dumps(row)+'\n'))
        self.reject_support_mutation('owned-custom-diagnostics',mutate)

    def test_rehashed_truncated_owned_population_is_rejected(self):
        def mutate(r):
            item=r['artifacts']['owned_AS'];item.update(self.gzip(item['path'],''))
        self.reject_support_mutation('owned-custom-diagnostics',mutate)

    def test_unwind_same_count_destination_substitution_is_rejected(self):
        self.reject_support_mutation('unowned-unwind-destinations',lambda r:r['native_callbacks'][0].update(entry='0xdead'))

    def test_as_address_same_count_candidate_substitution_is_rejected(self):
        self.reject_support_mutation('as-address-candidates',lambda r:r['exact_direct_AS_context_candidates'][0].update(site='0xdead'))

    def test_rehashed_truncated_as_cases_are_rejected(self):
        def mutate(r):
            cases=json.loads((self.root/r['cases']['path']).read_text());cases['hp_cases']=[]
            self.write_json(r['cases']['path'],cases);r['cases']=self.receipt(r['cases']['path'])
        self.reject_support_mutation('as-address-candidates',mutate)

    def test_rehashed_wrong_operand_register_is_rejected(self):
        value,rows=self.independent();rows[0]['operand_state']['register']='rcx'
        value['artifact'].update(self.gzip(value['artifact']['path'],''.join(json.dumps(r)+'\n' for r in rows)))
        self.write_json(self.directory.relative_to(self.root)/'independent-indirects.json',value)
        with self.assertRaisesRegex(ValueError,'Encoded operand state differs'):self.run_record()

    def test_bound_artifact_change_during_admission_is_rejected(self):
        name=self.record['artifacts']['diagnostic-sites.jsonl.gz']['path'];calls=0
        def changing_hash(path):
            nonlocal calls
            if Path(path)==self.root/name:
                calls+=1
                if calls==2:self.gzip(name,'')
            return file_sha256(path)
        with patch('native_residual_inputs.file_sha256',side_effect=changing_hash):
            with self.assertRaisesRegex(ValueError,'changed during admission'):self.run_record()


if __name__=='__main__':unittest.main()
