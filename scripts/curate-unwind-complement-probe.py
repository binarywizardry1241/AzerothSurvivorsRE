#!/usr/bin/env python3
"""Validate retained complement probes and curate compact native evidence.

No provider starts here. An existing Capstone installation independently checks
the exact Ghidra body boundaries against the selected installed image.
"""

import hashlib
import importlib.util
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, target_bytes


def validate_seeds(selection, saved_digest):
    seeds=''.join(f'{address}\tfunction\n{address}\tcode\n' for address in selection['seeds'])
    if (hashlib.sha256(seeds.encode()).hexdigest()!=selection['seed_sha256']
            or saved_digest!=selection['seed_sha256']):
        raise ValueError('Probe selected entries differ from the actual Ghidra seeds')


def curate():
    import capstone
    target=latest_target(verify=True)
    spec=importlib.util.spec_from_file_location('complement_curator_pe',ROOT/'scripts/inventory-current-target.py')
    parser=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(parser)
    pe=parser.pe_parser(target_bytes(target))
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    root=ROOT/'runtime/coverage'/target['sha256']/'ghidra'
    bundles,entries,assembly,seed_counts=[],[],[],[]
    for name in ('complement-most-referenced','complement-forwarder-destinations-replay'):
        base=root/name
        selection=load_json(base/'selection.json')
        seed_counts.append(len(selection['seeds']))
        if any(selection['target'][k]!=target[k] for k in ('version','path','sha256','size_bytes')):
            raise ValueError('Probe belongs to another target')
        validate_seeds(selection,file_sha256(base/'seeds.tsv'))
        current_summary=load_json(ROOT/'docs/analysis/coverage/unwind-complement-summary.json')
        if (file_sha256(ROOT/'docs/analysis/coverage/unwind-complement-summary.json')!=selection['source_summary_sha256']
                or current_summary['inventory']['sha256']!=selection['source_inventory_sha256']
                or file_sha256(ROOT/current_summary['inventory']['path'])!=selection['source_inventory_sha256']):
            raise ValueError('Probe selection source inventory differs from current bound evidence')
        selected=selection['input_range']
        offset=int(selected['file_offset'],16)
        raw=pe.data[offset:offset+selected['byte_count']]
        if len(raw)!=selected['byte_count'] or hashlib.sha256(raw).hexdigest()!=selected['sha256']:
            raise ValueError('Probe source range changed')
        bundle=base/'session/evidence-bundle.json'
        records=load_json(bundle)['records']
        if (not records or any(r['subject']['digest']['sha256']!=selected['sha256']
                or r['provider']['id']!='ghidra' for r in records)
                or len({r['analysis_profile']['digest'] for r in records})!=1
                or any(r['analysis_profile']['parameters']['analysis_seeds']['sha256']!=selection['seed_sha256'] for r in records)):
            raise ValueError('Retained Ghidra identity/profile/seeds differ')
        bundles.append(dict(path=bundle.relative_to(ROOT).as_posix(),sha256=file_sha256(bundle),
            profile_digest=records[0]['analysis_profile']['digest'],input_range=selected,seed_sha256=selection['seed_sha256']))
        for address in selection['seeds']:
            own=[r for r in records if r['parameters'].get('procedure')==address]
            instructions=next(r for r in own if r['operation']=='read_function_instructions')
            native=instructions['normalized_result']
            body=native['procedure']['body']
            if not body['available'] or len(body['ranges'])!=1 or body['ranges'][0]['start']!=address:
                raise ValueError('Probe does not have one entry-containing native body')
            start=int(address,16)
            end=int(body['ranges'][0]['end'],16)+1
            offset=pe.rva_offset(start-pe.image_base)
            raw=pe.data[offset:offset+end-start]
            decoded=list(decoder.disasm(raw,start))
            starts=[int(line.split(':',1)[0],16) for line in native['instructions']]
            if starts!=[row.address for row in decoded] or sum(row.size for row in decoded)!=len(raw):
                raise ValueError('Ghidra and independent decoder body boundaries differ')
            assembly.append('\n'.join(native['instructions']))
            entries.append(dict(address=address,file_offset=hex(offset),byte_count=len(raw),
                sha256=hashlib.sha256(raw).hexdigest(),instruction_count=len(decoded),
                ghidra_capstone_boundaries_equal=True,body=body,
                evidence_ids={r['operation']:r['evidence_id'] for r in own}))
    slots={int(row['iat_start_address'],16)+8*i:dict(library=row['library'],symbol=name)
           for row in pe.imports() for i,name in enumerate(row['functions'])}
    # Preserve the exact selected destination IAT associations, not guessed
    # runtime callees. Addresses come from the validated current body records.
    decoder.detail=True
    imported=set()
    for entry in entries[seed_counts[0]:]:
        offset=int(entry['file_offset'],16)
        for instruction in decoder.disasm(pe.data[offset:offset+entry['byte_count']],int(entry['address'],16)):
            for operand in instruction.operands:
                if operand.type==capstone.x86_const.X86_OP_MEM and operand.mem.base==capstone.x86_const.X86_REG_RIP:
                    address=instruction.address+instruction.size+operand.mem.disp
                    if address in slots:
                        imported.add(address)
    output=ROOT/'docs/analysis/evidence'/target['version']/'unwind-complement'
    output.mkdir(parents=True,exist_ok=True)
    assembly_path=output/'native.asm'
    assembly_path.write_text('\n\n'.join(assembly)+'\n')
    result=dict(schema_version=1,target=selection['target'],
        scope='Most-referenced complement region and its encoded direct-jump destinations, not all non-unwind code.',
        selection_rule='Maximum incoming direct seed-lead count, ties by address; all seeded entries in that range; then all unconditional direct destinations that are current declared starts.',
        incoming_leads=bundles[0]['input_range']['incoming_leads'],retained_bundles=bundles,
        assembly=dict(path=assembly_path.relative_to(ROOT).as_posix(),sha256=file_sha256(assembly_path)),
        entries=entries,counts=dict(complement_entries=seed_counts[0],destination_entries=seed_counts[1],
            instructions=sum(row['instruction_count'] for row in entries),body_bytes=sum(row['byte_count'] for row in entries)),
        import_slot_bindings=[dict(address=hex(address),**slots[address]) for address in sorted(imported)],
        decoder=dict(name='Capstone',version=capstone.__version__),
        native_semantics_complete=False,parity_verified=False,gap_ids=[41],limitations=[
            'Raw import turns the four missing native destinations into synthetic external-space names; they are native PE addresses, not imported DLL implementations.',
            'Destination instruction boundaries/body bytes agree independently, but two pseudocode results report bad-data/PIC flow warnings. Pseudocode signatures, Windows ABI and source semantics are not certified.',
            'GetProcessHeap/HeapFree/HeapReAlloc are exact PE IAT slot associations, not observed runtime callee values. Complete allocator, external/platform and gameplay ownership remain open.',
            'Raw imports omit full-PE caller/global/import context. Incoming leads are retained independently in the complement database.'])
    (output/'manifest.json').write_text(json_text(result))
    progress=load_json(root/'full-image-entry-decoding-extended/progress.json')
    if progress['target']['sha256']!=target['sha256'] or progress['status']!='failed':
        raise ValueError('Expected failed current-target whole-image attempt')
    session=ROOT/progress['last_session']
    failures=list(session.glob('*-search_procedures.json'))
    if len(failures)!=1:
        raise ValueError('Expected one retained search failure in the recorded session')
    failed=failures[0]
    response=load_json(failed)
    import json
    error=json.loads(response['response']['result']['content'][0]['text'])['error']
    if error['code']!='provider_timeout':
        raise ValueError('Expected bounded startup timeout')
    timeout=dict(schema_version=1,target=result['target'],profile=progress['profile'],
        analysis_environment=progress['analysis_environment'],status=progress['status'],operation='search_procedures',
        error_code=error['code'],timeout_ms=error['details']['timeout_ms'],elapsed_seconds=response['elapsed_seconds'],
        discovered_procedure_inventory_observed=False,completed_body_queries=0,
        failed_response=dict(path=failed.relative_to(ROOT).as_posix(),sha256=file_sha256(failed)),
        whole_image_input=True,native_semantics_complete=False,parity_verified=False,gap_ids=[41],
        limitation='No completed inventory or body results. Failure logs are disposable; historical 0.107.0 results are not reused.')
    (output.parent/'entry-decoding-timeout.json').write_text(json_text(timeout))
    print(json_text(dict(counts=result['counts'],timeout_elapsed_seconds=timeout['elapsed_seconds'])))


if __name__=='__main__':
    try:
        curate()
    except (ValueError,OSError,KeyError,ImportError,StopIteration) as error:
        print(f'Complement evidence curation: {error}',file=sys.stderr)
        sys.exit(1)
