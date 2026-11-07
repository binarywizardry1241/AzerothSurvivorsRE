#!/usr/bin/env python3
"""Check bounded AS resource and builtin UI joins without exporting assets."""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, file_sha256, load_json, project_bytes, target_bytes, verify_resources
from script_sources import load_script

WORK=ROOT/'runtime/analysis/history/findings/q41-all/f1125d689593'
KEEP=ROOT/'docs/analysis/evidence/0.113.2/as-resource-paths.json'
PATHS={
    'bar':['interface/paperdollinfoframe/ui-character-skills-bar.blp'],
    'dragon':['interface/dialogframe/ui-dialogbox-gold-dragon.blp'],
    'feature':['interface/glues/common/glue-leftarrow-button-up.blp','interface/glues/common/glue-rightarrow-button-up.blp'],
    'rotation':['interface/buttons/ui-rotationleft-button-up.blp','interface/buttons/ui-rotationright-button-up.blp'],
}


def current_consumers():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_IMM, CS_OP_MEM, CS_OP_REG
    from capstone.x86_const import X86_REG_RIP, X86_REG_R8, X86_REG_R9D, X86_REG_RAX, X86_REG_RSP

    target = latest_target(verify=True)
    proof = load_json('docs/analysis/evidence/resource-consumers.json')
    assert proof['schema_version'] == 1 and target['sha256'] == proof['target_sha256']
    verify_resources(target)
    image = target_bytes(target)
    pe = load_script('resource_consumer_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    mpq = load_script('resource_consumer_mpq', ROOT / 'scripts/check-minimap-lifecycle.py')
    inventory = load_script('resource_consumer_inventory', ROOT / 'scripts/inventory-current-mpq-members.py')
    archives = [mpq.Archive(row['path']) for row in inventory.supported_source_order(target)]
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + length]

    def member(path):
        hits = [(archive, archive.lookup(path)) for archive in archives]
        matches = [(archive, entry) for archive, entry in hits if entry is not None]
        assert len(matches) == 1, path
        archive, entry = matches[0]
        assert archive.reference == 'installed-game/Data/patch.MPQ', path
        return archive.read(entry)

    def dbc(name):
        data = member(f'DBFilesClient\\{name}.dbc')
        assert data[:4] == b'WDBC', name
        count, fields, stride, strings = struct.unpack_from('<4I', data, 4)
        assert count and fields and stride and 20 + count * stride + strings == len(data), name
        return data, count, fields, stride

    def check_slice(site, value, reader, destination):
        instructions = list(decoder.disasm(raw(site, 65), site))
        first = instructions[0]
        reg, mem = first.operands
        assert first.mnemonic == 'lea' and reg.type == CS_OP_REG and reg.reg == destination
        assert mem.type == CS_OP_MEM and mem.mem.base == X86_REG_RIP
        length = None
        for ins in instructions[1:]:
            operands = ins.operands
            if ins.mnemonic == 'call':
                assert operands[0].type == CS_OP_IMM and operands[0].imm == reader
                break
            if ins.mnemonic != 'mov' or operands[1].type != CS_OP_IMM:
                continue
            dst, src = operands
            if (destination == X86_REG_R8 and dst.type == CS_OP_REG and dst.reg == X86_REG_R9D
                    or destination == X86_REG_RAX and dst.type == CS_OP_MEM
                    and dst.mem.base == X86_REG_RSP and dst.mem.disp == 0x28):
                length = src.imm
        else:
            raise AssertionError(f'No direct call after {site:#x}')
        assert length == len(value), (hex(site), value)
        assert raw(first.address + first.size + mem.mem.disp, length) == value

    for name, read_site, parse_site, label in proof['dbc_readers']:
        check_slice(int(read_site, 16), f'DBFilesClient\\{name}.dbc'.encode(),
                    int(proof['member_reader'], 16), X86_REG_R8)
        if parse_site:
            check_slice(int(parse_site, 16), label.encode(),
                        int(proof['table_parser'], 16), X86_REG_RAX)
        dbc(name)

    for offset, text, source in proof['dbc_diagnostics']:
        offset = int(offset, 16)
        expected = text.encode()
        assert image[offset] == len(expected)
        assert image[offset + 1:offset + 1 + len(expected)] == expected
        assert text in (ROOT / source).read_text()

    def comment_free_xml(raw_xml):
        raw_xml = re.sub(rb'<!--.*?-->', b'', raw_xml, flags=re.S)
        return [line for line in raw_xml.splitlines()
                if line.strip() and not line.lstrip().startswith(b'--')]

    ui = ROOT / 'crates/benilla-app/assets/ui'
    for name, descriptor, digest in proof['builtin_ui']:
        path, path_length, content, content_length = struct.unpack_from(
            '<4Q', image, int(descriptor, 16))
        assert raw(path, path_length) == name.encode()
        payload = raw(content, content_length)
        assert hashlib.sha256(payload).hexdigest() == digest
        source = (ui / name).read_bytes()
        if name.endswith('.xml'):
            assert comment_free_xml(payload) == comment_free_xml(source), name
        else:
            assert payload == source, name

    stdlib_offset, stdlib_sha = proof['stdlib']
    source = (ROOT / 'crates/benilla-ui/src/script/stdlib.rs').read_bytes()
    chunk = source.split(b'const WOW_STDLIB: &str = r#"')[1].split(b'"#;', 1)[0]
    assert hashlib.sha256(chunk).hexdigest() == stdlib_sha
    at = int(stdlib_offset, 16)
    assert image[at:at + len(chunk)] == chunk

    for start, end, digest in proof['native_spans']:
        start, end = int(start, 16), int(end, 16)
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == digest

    def check_call(site, target):
        site = int(site, 16)
        ins = next(decoder.disasm(raw(site, 5), site))
        assert ins.mnemonic == 'call' and ins.operands[0].type == CS_OP_IMM, hex(site)
        assert ins.operands[0].imm == int(target, 16), hex(site)

    overrides = proof.get('runtime_overrides')
    if overrides:
        for site, target in overrides['call_edges']:
            check_call(site, target)
        for site in overrides['writer_call_sites']:
            check_call(site, overrides['writer'])
        for path, producer, reader, digest in overrides['binding_paths']:
            for address in (producer, reader):
                assert raw(int(address, 16), len(path)) == path.encode(), path
            data = member(path)
            assert hashlib.sha256(data).hexdigest() == digest, path
            assert b'AZS_OPENLEVELS' not in data, path

        operands = overrides['binding_operands']
        for name, expected in (('command', b'AZS_OPENLEVELS'), ('key', b'Y'),
                               ('default_format', b'\x07\r\nbind \xc0\x01 \xc0\x02\r\n\0')):
            assert raw(int(operands[name], 16), len(expected)) == expected

        voices, rows, fields, stride = dbc('CreatureSoundData')
        assert fields >= 7 and stride >= fields * 4
        assert [struct.unpack_from('<I', voices, 20 + i * stride)[0] for i in range(rows)
                if struct.unpack_from('<I', voices, 20 + i * stride + 24)[0] == 8449] == [2068]
        print(f"Verified {len(overrides['writer_call_sites'])} resource override writer sites, "
              f"{len(overrides['binding_paths'])} binding members and the creature voice input")

    maps, map_count, fields, stride = dbc('Map')
    assert fields > 38 and stride == fields * 4
    loading_id = {
        struct.unpack_from('<I', maps, 20 + i * stride)[0]:
        struct.unpack_from('<I', maps, 20 + i * stride + 38 * 4)[0]
        for i in range(map_count)
    }
    screens, count, fields, stride = dbc('LoadingScreens')
    assert (fields, stride) == (3, 12)
    paths = dict((key, path) for key, _, path in
                 struct.iter_unpack('<3I', screens[20:20 + count * stride]))
    strings = screens[20 + count * stride:]
    survivors = ROOT / 'crates/azeroth-survivors-re'
    zones = json.loads((survivors / 'assets/run-entry-0.100.1.json').read_text())['zones']
    school = (survivors / 'src/zones/scholomance.rs').read_text()
    school_map = re.search(r'pub const MAP: u32 = (\d+);', school)
    assert school_map and len(zones) == 12
    assert {row[0] for row in proof['loading_art']} == (
        {zone['map_id'] for zone in zones} | {int(school_map[1])})
    for map_id, screen_id, path in proof['loading_art']:
        assert loading_id[map_id] == screen_id
        at = paths[screen_id]
        assert strings[at:strings.index(b'\0', at)].decode() == path
        assert member(path)[:4] == b'BLP2'

    for path in proof['dynamic_art_examples']:
        assert member(path)[:4] == b'BLP2'

    for art in proof.get('progression_art', []):
        path = art['path']
        uri = ('mpq://' + path.lower().replace('\\', '/')).encode()
        assert raw(int(art['uri_va'], 16), len(uri)) == uri
        assert member(path)[:4] == b'BLP2'
        check_call(art['load_call'], proof['progression_image_loader'])
        check_call(art['publish_call'], art['publish_target'])

    for path, descriptor, site in proof.get('creature_dbc_diagnostics', []):
        descriptor, site = int(descriptor, 16), int(site, 16)
        pointer, length = struct.unpack('<QQ', raw(descriptor, 16))
        assert raw(pointer, length) == path.encode()
        ins = next(decoder.disasm(raw(site, 7), site))
        assert ins.mnemonic == 'lea' and ins.operands[1].mem.base == X86_REG_RIP
        assert ins.address + ins.size + ins.operands[1].mem.disp == descriptor

    print(f"Verified {len(proof['dbc_readers'])} DBC member readers, {len(proof['builtin_ui'])} "
          f"builtin UI payloads, {len(proof['loading_art'])} loading-art joins, "
          f"{len(proof.get('progression_art', []))} progression-art consumers and "
          f"{len(proof.get('creature_dbc_diagnostics', []))} creature DBC diagnostics")


def legacy_consumers(args):
    from creature_query_native import D, PE
    from resource_uri_native import UriProbe, SPANS

    target=latest_target(verify=True)
    assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    proof_path=ROOT/'docs/analysis/evidence/0.113.2/mpq-member-coverage.json'
    proof=load_json(proof_path)
    lead_input=proof['outputs']['resource-leads.jsonl']
    assert file_sha256(ROOT/lead_input['path'])==lead_input['sha256']
    leads=[json.loads(line)for line in (ROOT/lead_input['path']).read_text().splitlines()]
    assert len(leads)==303
    selected=[]
    for ordinal in range(6):
        row=leads[ordinal]
        assert row['selector']=='Q41-D03:resource_path:'+str(ordinal)
        at=int(row['file_offset'],16)
        raw=row['literal'].encode()
        assert D[at:at+len(raw)]==raw and hashlib.sha256(raw).hexdigest()==row['literal_sha256']
        assert D[at-4:at]==b'mpq:' and raw.startswith(b'//')
        selected.append(dict(selector=row['selector'],original_file_offset=row['file_offset'],
            original_status=row['status'],complete_uri='mpq:'+row['literal'],
            full_uri_location=dict(file_offset=hex(at-4),virtual_address=hex(PE.offset_va(at-4)),
                size_bytes=len(raw)+4,sha256=hashlib.sha256(D[at-4:at+len(raw)]).hexdigest())))
    probe,cases=UriProbe(),[]
    for kind,paths in PATHS.items():
        for index,path in enumerate(paths):
            actual=probe.run(kind,index)
            assert actual=='mpq://'+path
            cases.append(dict(kind=kind,index=index,uri=actual))
    for index in [2,2**64-1]:
        assert probe.run('rotation',index)=='bounds'
        cases.append(dict(kind='rotation',index=index,result='bounds_before_asset_interface'))
    spans=[]
    for role,(start,call)in SPANS.items():
        at=PE.rva_offset(start-PE.image_base)
        spans.append(dict(role=role,start=hex(start),end_exclusive=hex(call+5),
            sha256=hashlib.sha256(D[at:at+call+5-start]).hexdigest(),first_asset_interface='0x140159a10'))
    observations=[]
    for path in sorted((WORK/'rea-resource-contracts-v2').glob('0*.json')):
        e=json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if e.get('operation')not in ['procedure_info','procedure_pseudo_code']:continue
        assert e['subject']['digest']['sha256']==target['sha256']
        observations.append(dict(operation=e['operation'],parameters=e['parameters'],evidence_id=e['evidence_id'],response_sha256=file_sha256(path)))
    assert len(observations)==8
    reused=[]
    for name in ['race-portraits/manifest.json','meter-minimap/manifest.json']:
        path=ROOT/'docs/analysis/evidence/0.113.2'/name
        p=load_json(path);assert p['target_sha256']==target['sha256']
        reused.append(dict(path=str(path.relative_to(ROOT)),sha256=file_sha256(path)))
    assert verify_resources(target)==9
    mpq=load_script('as_uri_mpq','scripts/check-minimap-lifecycle.py')
    records=sorted(target['runtime_data']['archives'],key=lambda r:(not r['path'].lower().endswith('/patch.mpq'),r['path'].lower()))
    archives=[mpq.Archive(r['path'])for r in records]
    uris=sorted(set([r['complete_uri']for r in selected]+[r['uri']for r in cases if 'uri'in r]))
    assert len(uris)==8
    assets=[]
    for uri in uris:
        path=uri[len('mpq://'):].replace('/','\\')
        for archive in reversed(archives):
            entry=archive.lookup(path)
            if entry is not None:
                raw=archive.read(entry);break
        else:raise AssertionError('resource unavailable: '+path)
        assert raw[:4]==b'BLP2'
        width,height=struct.unpack_from('<II',raw,12)
        assert width>0 and height>0
        assets.append(dict(uri=uri,member=path,archive=archive.reference,size_bytes=len(raw),
            sha256=hashlib.sha256(raw).hexdigest(),width=width,height=height))
    sources=['crates/azeroth-survivors-re/src/assets.rs','crates/azeroth-survivors-re/src/armory.rs',
        'crates/azeroth-survivors-re/src/progression.rs','crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs',
        'crates/azeroth-survivors-re/src/gameplay/meter.rs','crates/benilla-formats/src/chain.rs']
    asset,armory,progression,sidebar,meter,chain=[(ROOT/p).read_text()for p in sources]
    normalized='\n'.join([asset,armory,progression,meter]).replace('\\\\','/').lower()
    assert all(uri[len('mpq://'):]in normalized for uri in uris)
    assert 'chain.read_file(path)'in asset and 'fn read_file('in chain
    for key in ['armory.turn_left','armory.turn_right','armory.feature_left','armory.feature_right']:assert armory.count('"'+key+'"')>=2
    assert 'images.progress_bar.clone()'in progression and 'images.dragon.clone()'in sidebar
    result=dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},
        gap_ids=[41],leads=['Q41-R01','Q41-D03'],original_candidate_count=303,
        original_candidate_proof=dict(path=str(proof_path.relative_to(ROOT)),sha256=file_sha256(proof_path)),
        selected_candidates=selected,native_spans=spans,native_cases=cases,ghidra_observations=observations,
        reused_proofs=reused,assets=assets,source_hashes={p:file_sha256(ROOT/p)for p in sources},
        limits=[
            'Four new AS URI producer slices execute with synthetic frame/allocator/copy seams; stop at the first asset interface. Two current race/meter proofs are reused without duplicate extracts.',
            'Feature cases cover indices0/1 only; no arbitrary-index safety claim. Rotation additionally observes unsigned rejection for2/u64max. Full widget/action/layout/loader contracts do not execute.',
            'Eight available BLP2 members have full content hashes and header dimensions; texture codecs, first/all mip pixels, color/filtering and actual rendered appearance are not validated here.',
            'Original six partial-string selectors/statuses and all303 resource candidates remain unchanged. These URI classifications do not resolve the other297 candidates, all AS resources or native mount/locale/dynamic alias equivalence.',
            'No source omission is established for these eight paths. Existing AS load/handle consumers and benilla MPQ chain are reused; no generic engine reconstruction, compilation, Rust/client/game execution, binary asset export or original/rebuilt parity.'])
    text=json.dumps(result,indent=2)+'\n'
    if args.stage:(WORK/'as-resource-paths.json').write_text(text)
    else:assert project_bytes(KEEP)==text.encode()
    print(json.dumps(dict(selected_candidates=6,available_members=8,native_cases=len(cases),source_defect_found=False)))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--stage', action='store_true')
    mode.add_argument('--current-consumers', action='store_true')
    args = parser.parse_args()
    if args.current_consumers:
        current_consumers()
    else:
        legacy_consumers(args)


if __name__ == '__main__':
    main()
