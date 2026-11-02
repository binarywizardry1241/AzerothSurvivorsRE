#!/usr/bin/env python3
"""Revalidate the complete raid graph and current initial-request tower filter.

Static PE/Ghidra evidence and isolated original instructions only. No compiler,
Rust execution, reference/rebuilt process, terrain or rendering is invoked.
--stage writes fresh extracts under ignored runtime; the default checks reviewed
canonical evidence. --prepare-rea stages bounded project-local Ghidra plans.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import re
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
HISTORICAL = ROOT/'docs/analysis/evidence/0.109.0/raid-native/catalog.json'
STAGE = ROOT/'runtime/native-evidence/0.112.0/raid'
KEPT = ROOT/'docs/analysis/evidence/0.112.0/raid'
ZONE_TABLE, GUARDIAN_TABLE = 0x146bf2630, 0x146bfb470
DURATION = (0x145896950, 0x145896b44)
QUEUE = (0x145949ca7, 0x145949d28)
DISPATCH = 0x14591f790
KEYS = ('elwynn','duskwood','wsg','ungoro','ab','feralas','arena','sm','av','brm','aq','naxx')


def load(name, path):
    module = load_script(name, ROOT/path)
    return module


def dump(value):
    return json.dumps(value, indent=2, ensure_ascii=False)+'\n'


def graph_text(value):
    lines = ['{']
    for name in ('target_version','target_sha256','target_executed'):
        lines.append(f'  {json.dumps(name)}: {json.dumps(value[name])},')
    for name in ('actions','bosses','guardians'):
        lines.append(f'  {json.dumps(name)}: [')
        rows = value[name]
        lines.extend('    '+json.dumps(row, separators=(',',':'), ensure_ascii=False)+
                     (',' if i+1<len(rows) else '') for i,row in enumerate(rows))
        lines.append('  ]'+(',' if name!='guardians' else ''))
    return '\n'.join([*lines,'}'])+'\n'


def recover():
    target = latest_target(verify=False)
    assert target['sha256']==SHA, 'Revalidate the changed installed target first'
    data = target_bytes(target)
    pe = load('raid_current_pe', 'scripts/inventory-executable.py').PE(data)
    def raw(address, size):
        offset = pe.rva_offset(address-pe.image_base)
        value = data[offset:offset+size]
        assert len(value)==size
        return value
    def span(address, size):
        return dict(va=hex(address),file_offset=hex(pe.rva_offset(address-pe.image_base)),
                    byte_count=size,sha256=hashlib.sha256(raw(address,size)).hexdigest())
    def text(address):
        pointer,size = struct.unpack('<QQ',raw(address,16))
        assert size<4096
        return raw(pointer,size).decode()
    actions, bosses, guardians, headers = {}, [], [], []
    def add(address, stride=48):
        if address in actions:
            if stride==56:
                repeat = struct.unpack('<I',raw(address+48,4))[0]
                assert actions[address]['repeat_bits']==repeat
            return address
        value = raw(address,48)
        tag = value[45]
        assert tag<=34
        row = dict(native_tag=tag,words=list(struct.unpack('<12I',value)),
                   record=span(address,48),children=[],
                   repeat_bits=struct.unpack('<I',raw(address+48,4))[0] if stride==56 else 0)
        actions[address] = row
        if tag in (0,1,2,18,32):
            pointer,count = struct.unpack('<QQ',value[:16])
            assert count<1000
            child_stride = 48 if tag==18 else 56
            row['children'] = [add(pointer+child_stride*i,child_stride) for i in range(count)]
        return address
    for zi,key in enumerate(KEYS):
        zone = ZONE_TABLE+240*zi
        assert text(zone+8)==key
        pointer,count = struct.unpack('<QQ',raw(zone+136,16))
        assert count==5
        for bi in range(count):
            address = pointer+104*bi
            words = list(struct.unpack('<26I',raw(address,104)))
            row = dict(boss_id=words[16],moves=[],phases=[])
            headers.append(dict(zone_index=zi,boss_index=bi,record=span(address,104),
                                words=words,name=text(address),yell=text(address+32)))
            for role,offset,stride in (('moves',16,56),('phases',48,72)):
                pointer2,count2 = struct.unpack('<QQ',raw(address+offset,16))
                assert count2<100
                for slot in range(count2):
                    at = pointer2+stride*slot
                    item = dict(slot=slot,action=add(at+(16 if role=='phases' else 0),
                                                     48 if role=='phases' else 56),record=span(at,stride))
                    if role=='phases':
                        item.update(threshold_bits=struct.unpack('<I',raw(at+64,4))[0],yell=text(at))
                    row[role].append(item)
            bosses.append(row)
    for i in range(37):
        address = GUARDIAN_TABLE+56*i
        pointer,count,alternates,nalt,phases,nphase,identity = struct.unpack('<7Q',raw(address,56))
        assert nalt<10 and nphase<10
        row = dict(enemy_id=identity,variants=[],phases=[])
        lists = [(pointer,count)]+[struct.unpack('<QQ',raw(alternates+16*k,16)) for k in range(nalt)]
        for pointer,count in lists:
            assert count<100
            row['variants'].append([dict(slot=k,action=add(pointer+56*k,56),
                                         record=span(pointer+56*k,56)) for k in range(count)])
        for k in range(nphase):
            at = phases+72*k
            row['phases'].append(dict(slot=k,action=add(at+16),record=span(at,72),
                                     threshold_bits=struct.unpack('<I',raw(at+64,4))[0],yell=text(at)))
        guardians.append(row)
    assert len({r['enemy_id'] for r in guardians})==37
    keys = sorted(actions)
    indices = {address:i for i,address in enumerate(keys)}
    for address in keys:
        actions[address].update(index=indices[address],children=[indices[x] for x in actions[address]['children']])
    for row in bosses+guardians:
        for item in row.get('moves',[])+row['phases']+sum(row.get('variants',[]),[]):
            item['action'] = indices[item['action']]
    graph = dict(target_version=target['version'],target_sha256=SHA,target_executed=False,
                 actions=[actions[k] for k in keys],bosses=bosses,guardians=guardians)
    return target,raw,span,graph,headers


def check_graph(graph, headers):
    historical = json.loads(HISTORICAL.read_text())
    assert len(graph['actions'])==len(historical['actions'])==493
    relocated = []
    for new,old in zip(graph['actions'],historical['actions']):
        assert (new['index'],new['native_tag'],new['children'],new['repeat_bits']) == \
               (old['index'],old['native_tag'],old['children'],old['repeat_bits'])
        start = 4 if new['native_tag'] in (0,1,2,18,32) else 0
        assert new['words'][start:]==old['words'][start:]
        if new['words']!=old['words']:
            relocated.append(new['index'])
        new['duration_bits'] = old['duration_bits']
    for role,identity in (('bosses','boss_id'),('guardians','enemy_id')):
        assert len(graph[role])==len(historical[role])
        for new,old in zip(graph[role],historical[role]):
            assert new[identity]==old[identity]
            def without_spans(value):
                if isinstance(value,dict):return {k:without_spans(v) for k,v in value.items() if k!='record'}
                if isinstance(value,list):return [without_spans(v) for v in value]
                return value
            assert without_spans(new)==without_spans(old)
    old_headers = json.loads((ROOT/'docs/analysis/evidence/0.109.0/boss-inputs/manifest.json').read_text())['boss_headers']
    source = (ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    blocks = re.findall(r'^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)',source,re.M|re.S)
    assert len(blocks)==len(headers)==60
    for row,old,block in zip(headers,old_headers,blocks):
        assert (row['name'],row['yell'],row['words'][16:])==(old['name'],old['yell'],old['words'][16:])
        for field,wi in (('id',16),('model_id',17),('raw_3c',19),('raw_50',24),('flag_54',25)):
            assert int(re.search(r'\b'+field+r':\s*(\d+)',block)[1]) == (row['words'][wi]&255 if field=='flag_54' else row['words'][wi])
        for field,wi in (('scale',18),('time_minutes',20),('base_hp',21),('base_damage',22),('raw_4c',23)):
            assert int(re.search(r'\b'+field+r':\s*f32::from_bits\(0x([0-9a-f]+)',block)[1],16)==row['words'][wi]
    # Native pointer words are not interpreted by source: recursive indices own
    # the connections. Preserve their historical provenance in the old registry.
    registry = (ROOT/'crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs').read_text()
    rows = [line for line in registry.splitlines() if 'NativeAction { native_tag:' in line]
    assert len(rows)==493
    for row,old in zip(rows,historical['actions']):
        tag = int(re.search(r'native_tag: (\d+)',row)[1])
        assert tag==old['native_tag']
        words = [int(x,16) for x in re.search(r'words: \[([^]]+)\]',row)[1].split(', ')]
        assert words==old['words']
        assert f'duration: f32::from_bits(0x{old["duration_bits"]:08x})' in row
        actual_children = re.search(r'children: &\[([^]]*)\]',row)[1]
        assert ([int(x) for x in actual_children.split(', ')] if actual_children else [])==old['children']
        assert f'repeat: f32::from_bits(0x{old["repeat_bits"]:08x})' in row
    semantic = [re.search(r'ability: (RawBossAbility \{ words: \[[^]]+\] \})',row)[1] for row in rows]
    for action,ability in zip(graph['actions'],semantic):
        semantic_tag = int(re.search(r'words: \[0x([0-9a-f]+)',ability)[1],16)
        assert (semantic_tag==13)==(action['native_tag']==12)
    schedules = (ROOT/'crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs').read_text()
    for boss in graph['bosses']:
        block = schedules.split(f'BossSchedule {{ boss_id: {boss["boss_id"]}, moves: &[',1)[1].split('    ] },',1)[0]
        expected = ['        ScheduledMove { native_slot: %d, native_tag: %d, ability: %s },' %
                    (m['slot'],graph['actions'][m['action']]['native_tag'],semantic[m['action']]) for m in boss['moves']]
        assert block=='\n'+'\n'.join(expected)+'\n'
    guardian_source = (ROOT/'crates/azeroth-survivors-re/src/guardians/signature_catalog.rs').read_text()
    check_guardian_signatures(guardian_source,graph['guardians'],graph['actions'],semantic)
    return relocated


def check_guardian_signatures(source, guardians, actions, semantic):
    """Bind list boundaries and scheduling metadata as well as payloads.

    Flattened abilities alone can miss a moved variant boundary, changed
    cooldown/native tag, or changed phase threshold/yell in the live source.
    """
    blocks = re.findall(r'Signature \{ enemy_id: (\d+), variants: &\[(.*?)\n    \], phases: &\[(.*?)\n    \] \}',source,re.S)
    assert source.count('Signature {')==len(blocks), 'Unparsed guardian signature'
    assert [int(row[0]) for row in blocks]==[row['enemy_id'] for row in guardians], 'Guardian identity/order drift'
    ability = r'(RawBossAbility \{ words: \[[^]]+\] \})'
    for (identity,variant_source,phase_source),guardian in zip(blocks,guardians):
        variants = re.findall(r'&\[\n(.*?)        \],',variant_source,re.S)
        assert variant_source.count('&[')==len(variants), (identity,'unparsed variant')
        assert len(variants)==len(guardian['variants']), (identity,'variant count')
        for slot,(block,variant) in enumerate(zip(variants,guardian['variants'])):
            rows = re.findall(r'Move \{ native_tag: (\d+), cooldown: f32::from_bits\(0x([0-9a-f]+)\), ability: Some\('+ability+r'\) \}',block)
            assert block.count('Move {')==len(rows), (identity,'unparsed move',slot)
            actual = [(int(tag),int(repeat,16),payload) for tag,repeat,payload in rows]
            expected = [(actions[row['action']]['native_tag'],actions[row['action']]['repeat_bits'],semantic[row['action']]) for row in variant]
            assert actual==expected, (identity,'variant',slot)
        rows = re.findall(r'Phase \{ native_tag: (\d+), threshold: f32::from_bits\(0x([0-9a-f]+)\), yell: ("(?:[^"\\]|\\.)*"), ability: Some\('+ability+r'\) \}',phase_source)
        assert phase_source.count('Phase {')==len(rows), (identity,'unparsed phase')
        actual = [(int(tag),int(threshold,16),json.loads(yell),payload) for tag,threshold,yell,payload in rows]
        expected = [(actions[row['action']]['native_tag'],row['threshold_bits'],row['yell'],semantic[row['action']]) for row in guardian['phases']]
        assert actual==expected, (identity,'phases')


def native_checks(raw, graph):
    sys.path[:0] = [str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),
                   str(ROOT/'runtime/armory-recovery/python-libs')]
    import unicorn as u
    from unicorn import x86_const as r
    machine = u.Uc(u.UC_ARCH_X86,u.UC_MODE_64)
    memory = 0x70000000
    machine.mem_map(memory,0x100000)
    mapped = set()
    def demand(uc,access,address,size,value,user):
        page = address&~4095
        if page not in mapped:
            machine.mem_map(page,4096)
            machine.mem_write(page,raw(page,4096))
            mapped.add(page)
        return True
    machine.hook_add(u.UC_HOOK_MEM_UNMAPPED,demand)
    stop = memory+0xff000
    for row in graph['actions']:
        machine.mem_write(memory,struct.pack('<12I',*row['words']))
        machine.mem_write(memory+0x8000,struct.pack('<Q',stop))
        machine.reg_write(r.UC_X86_REG_RCX,memory)
        machine.reg_write(r.UC_X86_REG_RSP,memory+0x8000)
        machine.reg_write(r.UC_X86_REG_EFLAGS,2)
        machine.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        machine.emu_start(DURATION[0],stop,count=100000)
        assert machine.reg_read(r.UC_X86_REG_RIP)==stop
        assert machine.reg_read(r.UC_X86_REG_XMM0)&0xffffffff==row['duration_bits']
    calls = []
    frame,queue = memory+0x10000,memory+0x20000
    def hook(uc,address,size,user):
        if address==QUEUE[1]:
            uc.emu_stop()
        elif address==DISPATCH:
            payload = machine.reg_read(r.UC_X86_REG_R8)
            tag = machine.mem_read(payload+45,1)[0]
            calls.append((machine.reg_read(r.UC_X86_REG_RDX),tag))
            stack = machine.reg_read(r.UC_X86_REG_RSP)
            target = struct.unpack('<Q',machine.mem_read(stack,8))[0]
            machine.reg_write(r.UC_X86_REG_RSP,stack+8)
            machine.reg_write(r.UC_X86_REG_RIP,target)
    machine.hook_add(u.UC_HOOK_CODE,hook)
    cases = [[i] for i in range(256)]+[[],[12,3,12,5],[3,255,6],[12,255,3],
                                      [18,12,32,5,12,33],list(range(35))]
    for tags in cases:
        machine.mem_write(queue,bytes(max(len(tags),1)*56))
        for i,tag in enumerate(tags):
            machine.mem_write(queue+56*i,struct.pack('<Q',100+i))
            machine.mem_write(queue+56*i+53,bytes([tag]))
        machine.mem_write(frame+0x238,struct.pack('<Q',len(tags)))
        machine.mem_write(frame+0x2f0,struct.pack('<Q',queue))
        machine.reg_write(r.UC_X86_REG_RBP,frame)
        machine.reg_write(r.UC_X86_REG_RSP,frame+0x8000)
        machine.reg_write(r.UC_X86_REG_R15,memory+0x40000)
        machine.reg_write(r.UC_X86_REG_EFLAGS,2)
        calls.clear()
        try:
            machine.emu_start(QUEUE[0],0,count=100000)
        except u.UcError as error:
            raise AssertionError((tags,hex(machine.reg_read(r.UC_X86_REG_RIP)),hex(machine.reg_read(r.UC_X86_REG_RBX)),hex(machine.reg_read(r.UC_X86_REG_RBP)))) from error
        assert machine.reg_read(r.UC_X86_REG_RIP)==QUEUE[1]
        expected = []
        for i,tag in enumerate(tags):
            if tag==255:break
            if tag!=12:expected.append((100+i,tag))
        assert calls==expected,(tags,calls,expected)
    return dict(native_duration_cases=len(graph['actions']),native_queue_cases=len(cases),
                queue_dispatch_intercepted=True,source_executed=False)


def source_checks():
    base = ROOT/'crates/azeroth-survivors-re/src'
    abilities = (base/'bosses/abilities.rs').read_text()
    body = abilities.split('pub fn queued_action_enabled(')[1].split('\n}')[0]
    assert 'record.words[0] != 13' in body
    for path,scope,sentinel,guard,lookup in (
        ('bosses/ai.rs','for request in requests {','if request.ability.words[0]==u32::MAX',
         'queued_action_enabled(&request.ability)','port.ability_actor('),
        ('gameplay/mechanics/bosses.rs','for (actor_index, ability) in requests {','if ability.words[0] == u32::MAX',
         'queued_action_enabled(&ability)','port.object_counter.sequence()')):
        text = (base/path).read_text().split(scope)[1]
        assert text.index(sentinel)<text.index(guard)<text.index(lookup)
    # Do not suppress the separately ordered delayed/recursive dispatch entry.
    assert 'queued_action_enabled' not in abilities.split('pub fn dispatch_live(')[1].split('pub fn dispatch(')[0]
    assert 'queued_action_enabled' not in (base/'bosses/raid_sequences.rs').read_text()


def verify_rea_operations(raw, directory, target_sha256):
    """Bind the current operation-style raw imports to installed bytes and prose."""
    record = json.loads((directory/'rea-provenance.json').read_text())
    assert record['target_sha256']==target_sha256
    assert record['operations']
    for operation in record['operations']:
        first = int(operation['va'],16)
        assert hashlib.sha256(raw(first,operation['byte_count'])).hexdigest()==operation['input_sha256']
        assert hashlib.sha256((directory/operation['pseudocode']).read_bytes()).hexdigest()==operation['pseudocode_sha256']


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',action='store_true')
    parser.add_argument('--prepare-rea',action='store_true')
    args = parser.parse_args()
    target,raw,span,graph,headers = recover()
    if args.prepare_rea:
        STAGE.mkdir(parents=True,exist_ok=True)
        disabled = 'Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
        for role,(first,last) in (('queue',QUEUE),('duration',DURATION)):
            binary = STAGE/(role+'.bin')
            binary.write_bytes(raw(first,last-first))
            plan = dict(target=str(binary.relative_to(ROOT)),output=str((STAGE/('rea-'+role)).relative_to(ROOT)),
                        init_timeout=60,timeout=180,environment={'REA_GHIDRA_DISABLED_ANALYZERS':disabled},
                        open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(first)),
                        operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(first)),label=role)])
            (STAGE/(role+'-plan.json')).write_text(dump(plan))
        print('Prepared current bounded REA plans:',STAGE.relative_to(ROOT))
        return
    relocated = check_graph(graph,headers)
    checks = native_checks(raw,graph)
    source_checks()
    towers = [dict(boss_id=b['boss_id'],role=role,slot=row['slot'])
              for b in graph['bosses'] for role in ('moves','phases') for row in b[role]
              if graph['actions'][row['action']]['native_tag']==12]
    assert towers==[dict(boss_id=i,role=r,slot=s) for i,r,s in
                   ((1594,'phases',0),(994,'moves',5),(1493,'moves',3),(1493,'phases',0),(1494,'phases',2))]
    proof = dict(target_version=target['version'],target_sha256=SHA,target_executed=False,
                 historical_graph=dict(path=str(HISTORICAL.relative_to(ROOT)),sha256=hashlib.sha256(HISTORICAL.read_bytes()).hexdigest()),
                 counts=dict(actions=493,bosses=60,boss_recurring=257,boss_phases=33,guardian_identities=37,
                             guardian_lists=40,guardian_recurring=120,guardian_phases=15),
                 relocated_pointer_nodes=relocated,all_scalar_graph_values_and_root_order_match=True,
                 all_sixty_boss_headers_match=True,suppressed_initial_requests=towers,
                 initial_request_filter=dict(native_tag=12,semantic_tag=13,sentinel_native_tag=255,
                                             range=span(QUEUE[0],QUEUE[1]-QUEUE[0]),
                                             direct_nested_and_delayed_dispatch_unchanged=True),
                 duration=span(DURATION[0],DURATION[1]-DURATION[0]),checks=checks,
                 limitations=['Graph/header and bounded original-instruction checks do not certify remaining native dependencies.',
                              'Historical source/native payload pointer words keep their actual 0.109.0 provenance; source uses recursive indices.',
                              'No compilation, Rust tests, game process, MPQ terrain, input/rendering or original/rebuilt parity comparison.'])
    sys.path.insert(0,str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'))
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    decoder = Cs(CS_ARCH_X86,CS_MODE_64)
    directory = STAGE if args.stage else KEPT
    if args.stage:directory.mkdir(parents=True,exist_ok=True)
    if not args.stage:
        rea = json.loads((directory/'rea-provenance.json').read_text())
        assert rea['target_sha256']==SHA
        for query in rea['queries']:
            commitment = query['raw_input']
            assert commitment==span(int(commitment['va'],16),commitment['byte_count'])
            assert query['raw_import_sha256']==commitment['sha256']
            assert hashlib.sha256((directory/query['pseudocode']).read_bytes()).hexdigest()==query['pseudocode_sha256']
    artifacts = {'catalog.json':graph_text(graph),'manifest.json':dump(proof)}
    for role,(first,last) in (('queue',QUEUE),('duration',DURATION)):
        instructions = list(decoder.disasm(raw(first,last-first),first))
        assert sum(i.size for i in instructions)==last-first
        artifacts[role+'.asm'] = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
    for name,value in artifacts.items():
        path = directory/name
        if args.stage:path.write_text(value)
        else:assert path.read_text()==value, f'Current raid proof/source drift: {path}'
    print('Raid 0.112.0:493 graph nodes,60 boss headers,493 native durations,262 native queue cases; source guards pass; no build/game')


if __name__=='__main__':
    main()
