#!/usr/bin/env python3
"""Check 0.109.0 concentric-wave records/instructions without a compiler or game.

--write stages curated evidence under runtime/analysis/staging/native-evidence/0.109.0/raid-waves.
Optional Capstone/Unicorn dependencies must already be installed. Native external
height, hold and packet functions are explicit seams, not executed game code.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/0.109.0/raid-waves'
RETAINED = ROOT / 'docs/analysis/evidence/0.109.0/raid-waves'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/bosses/raid_shapes.rs'
CATALOG = ROOT / 'crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs'

def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v): return json.dumps(v, indent=2, ensure_ascii=False, allow_nan=False) + '\n'

def run(write):
    import capstone
    import unicorn
    from unicorn import x86_const as r
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Recover the selected target before reusing addresses'
    data = target_bytes(target)
    module = load_script('waves_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    def raw(a, n):
        o = pe.rva_offset(a - pe.image_base)
        return data[o:o + n]
    def span(a, n): return dict(va=hex(a), byte_count=n,
        file_offset=hex(pe.rva_offset(a - pe.image_base)), sha256=hashlib.sha256(raw(a,n)).hexdigest())
    def text(a):
        pointer, size = struct.unpack('<QQ', raw(a,16))
        return raw(pointer,size).decode()
    records = []
    for zi in range(12):
        zone = 0x146bde390 + zi*240
        bosses, count = struct.unpack('<QQ',raw(zone+0x88,16))
        assert count == 5
        for bi in range(count):
            boss = bosses+bi*104
            bid = struct.unpack('<I',raw(boss+64,4))[0]
            moves, count = struct.unpack('<QQ',raw(boss+16,16))
            for slot in range(count):
                address=moves+slot*56
                payload=raw(address,56)
                if payload[45] != 27: continue
                words=struct.unpack('<14I',payload)
                records.append(dict(boss_id=bid,name=text(boss),native_slot=slot,native_tag=27,
                    index=len(records),payload_words=list(words[:6]),repeat_bits=words[12],
                    native_record=span(address,56),native_record_hex=payload.hex()))
    assert [(x['boss_id'],x['native_slot']) for x in records] == [(792,1),(1294,1),(991,2),(393,3),(1093,2)]
    guardian_path='docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json'
    guardians=json.loads((ROOT/guardian_path).read_text())
    assert guardians['target_sha256']==SHA
    for ri,row in enumerate(guardians['rows']):
        for vi,variant in enumerate(row['variants']):
            for mi,move in enumerate(variant):
                if move['tag'] !=27: continue
                native=move['record'];a=int(native['va'],16)
                assert span(a,56)['sha256']==native['sha256']
                payload=raw(a,56);words=struct.unpack('<14I',payload)
                assert payload[45]==27
                records.append(dict(guardian_id=row['enemy_id'],native_slot=move['slot'],native_tag=27,
                    index=len(records),payload_words=list(words[:6]),repeat_bits=words[12],
                    canonical_native_record=f'{guardian_path}#/rows/{ri}/variants/{vi}/{mi}/record'))
    assert [x['guardian_id'] for x in records[5:]]==[1311,1011,1413]
    row=next(row for row in guardians['rows'] if row['enemy_id']==1511)
    ri=guardians['rows'].index(row)
    phase=row['phases'][0];native=phase['record'];a=int(native['va'],16)
    assert phase['tag']==27 and span(a,72)['sha256']==native['sha256']
    payload=raw(a,72);words=struct.unpack('<18I',payload)
    assert payload[61]==27
    records.append(dict(guardian_id=1511,phase_index=0,native_tag=27,index=len(records),
        payload_words=list(words[4:10]),repeat_bits=0,
        canonical_native_record=f'{guardian_path}#/rows/{ri}/phases/0/record'))
    source=SOURCE.read_text()
    expected=[]
    for row in records:
        w=row['payload_words']
        expected.append(f"    Wave {{ spell: {w[0]}, count: {w[1]}, width: f32::from_bits(0x{w[2]:08x}), windup: f32::from_bits(0x{w[3]:08x}), step: f32::from_bits(0x{w[4]:08x}), damage_factor: f32::from_bits(0x{w[5]:08x}) }},")
        if 'guardian_id' in row: continue
        body=re.search(rf'BossSchedule {{ boss_id: {row["boss_id"]}, moves: &\[(.*?)\n    \] }},',CATALOG.read_text(),re.S).group(1)
        entries=[(int(slot),int(tag),[int(v,16) for v in words.split(', ')]) for slot,tag,words in re.findall(r'ScheduledMove \{ native_slot: (\d+), native_tag: (\d+), ability: RawBossAbility \{ words: \[(.*?)\]',body)]
        assert (row['native_slot'],27,[8,row['index'],0,0,0,0,row['repeat_bits']]) in entries
        assert [x[0] for x in entries] == sorted(x[0] for x in entries), 'native slot ordering changed'
    assert source.split('// BEGIN NATIVE WAVES\n')[1].split('// END NATIVE WAVES')[0] == '\n'.join(expected)+'\n'
    for needle in ['self.dispatch_shape(record, context, port)', 'for visual in visuals { port.cast_spell(visual); }',
                   'row.inner_radius.is_none_or(|inner| distance >= inner)', 'value["shape"] = json!("donut")', 'now >= row.end - row.warning_lead', 'self.start.max(self.end-self.warning_lead).min(now)']:
        assert needle in (ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text(), needle
    md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    # Retain selected spans once; the shared hazard owner references these
    # wave-specific membership/tell/optional-visual contracts.
    ranges=[dict(role='spell-go-wire-flags',**span(0x1458cd872,16),assembly='spell-go-flags.asm'),
            dict(role='wave-producer',**span(0x145958e3a,0x14595914b-0x145958e3a),assembly='producer.asm'),
            dict(role='inclusive-donut-hit',**span(0x14595051a,0x145950526-0x14595051a),assembly='donut-hit.asm'),
            dict(role='inclusive-donut-outer',**span(0x1459505b9,0x1459505c5-0x1459505b9),assembly='donut-outer.asm'),
            dict(role='tell-start',**span(0x145952579,0x1459525ba-0x145952579),assembly='tell-start.asm'),
            dict(role='hold-helper',**span(0x145957320,0x145957562-0x145957320),assembly='hold.asm'),
            dict(role='cast-start-helper',**span(0x1459577f0,0x1459578a0-0x1459577f0),assembly='cast-start.asm'),
            dict(role='action-block-extension',**span(0x145957c3e,0x145957cd8-0x145957c3e),assembly='action-block.asm'),
            dict(role='optional-ground-visual',**span(0x1459527aa,0x14595280d-0x1459527aa),assembly='optional-ground-visual.asm'),
            dict(role='duration-dispatch',**span(0x14588be10,0x14588c004-0x14588be10),assembly='duration.asm')]
    # Original instructions, synthetic buffers, and read-only PE data. The hook
    # intercepts every external call rather than running unknown native callees.
    uc=unicorn.Uc(unicorn.UC_ARCH_X86,unicorn.UC_MODE_64)
    mapped=set()
    def map_page(a):
        a &= ~4095
        if a not in mapped:
            uc.mem_map(a,4096);mapped.add(a)
            try: uc.mem_write(a,raw(a,4096))
            except (ValueError,IndexError): pass
    for a in range(0x145957000,0x14595d000,4096): map_page(a)
    for a in [0x145dcce80,0x14588be10,0x14588c000,0x146be7cd0,0x145950000,0x145952000]: map_page(a)
    game,record,rows,frame,world,stack=(0x70000000,0x70010000,0x70020000,0x70040000,0x70050000,0x70060000)
    for base in [game,record,rows,frame,world,stack]:
        for a in range(base,base+0x4000,4096): uc.mem_map(a,4096)
    calls=[]
    def put(a,fmt,*v): uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt): return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def xf(reg): return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def sx(reg,v): uc.reg_write(reg,bits(v))
    seams={0x145957320:'hold',0x1459577f0:'cast',0x1458d3d80:'height',0x1458d6f90:'primary',0x1458dc180:'secondary'}
    for a in seams: map_page(a)
    current_height=4.
    height_mode=0
    def hook(machine,a,size,user):
        if a not in seams: return
        name=seams[a]
        if name=='hold': calls.append((name,xf(r.UC_X86_REG_XMM2)))
        elif name=='cast': calls.append((name,machine.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='primary':
            machine.reg_write(r.UC_X86_REG_RAX,int(height_mode==0));sx(r.UC_X86_REG_XMM0,current_height)
        elif name=='secondary':
            output=machine.reg_read(r.UC_X86_REG_RCX)
            put(output,'I',int(height_mode==1));put(output+12,'f',current_height)
        else: sx(r.UC_X86_REG_XMM0,current_height)
        sp=machine.reg_read(r.UC_X86_REG_RSP)
        return_address=get(sp,'Q')[0]
        machine.reg_write(r.UC_X86_REG_RSP,sp+8);machine.reg_write(r.UC_X86_REG_RIP,return_address)
    uc.hook_add(unicorn.UC_HOOK_CODE,hook)
    cases=0
    payloads=[tuple(x['payload_words']) for x in records]
    payloads += [(6524,n,bits(5.),bits(1.6),bits(step),bits(1.6)) for n in [0,1,2,7] for step in [.1,.7,1.1]]
    for words in payloads:
        spell,count,width_bits,windup_bits,step_bits,factor_bits=words
        width,windup,step,factor=[struct.unpack('<f',struct.pack('<I',x))[0] for x in words[2:]]
        for height_mode in range(3):
            current_height=[4.,7.,9.][height_mode]
            for now in [0.,10.,12345.125]:
                calls.clear();uc.mem_write(rows,bytes(0x4000))
                put(game+0x588,'QQQ',64,rows,0);put(game+0x998,'Q',world);put(game+0xa34,'f',now);put(game+0xa38,'I',0xfffffffd)
                put(world+0x68,'Q',0 if height_mode!=2 else 0xffffffffffffffff);put(world+0xb8,'f',9.)
                put(record,'6I',*words);put(record+45,'B',27);put(frame+0xf0,'Q',2);put(frame+0x180,'Q',99);put(frame+0x150,'2f',13.,17.);put(frame+0x178,'f',0.)
                for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000)]:uc.reg_write(reg,value)
                sx(r.UC_X86_REG_XMM10,17.);sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,now)
                uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
                uc.emu_start(0x145958e3a,0x145957978,count=10000)
                assert uc.reg_read(r.UC_X86_REG_RIP)==0x145957978
                assert get(game+0x598,'Q')[0]==max(count,1)
                assert calls==[('hold',windup),('cast',spell,windup)]
                for i in range(max(count,1)):
                    row=rows+i*128
                    assert get(row+0x30,'I')[0]==int(i!=0)
                    expected_radii=[bits(width)] if i==0 else [bits(f32(i*width)),bits(f32((i+1)*width))]
                    assert list(get(row+0x34,'I' if i==0 else '2I'))==expected_radii
                    assert get(row+0x3c,'I')[0]==(0xfffffffe+i)&0xffffffff
                    assert get(row+0x40,'3f')==(13.,17.,current_height)
                    assert get(row+0x50,'I')[0]==bits(now)
                    assert get(row+0x54,'I')[0]==bits(f32(f32(f32(i*step)+windup)+now))
                    assert get(row+0x5c,'I')[0]==(spell if i==0 else 0)
                    assert get(row+0x60,'I')[0]==bits(f32(100.*factor))
                    actual_window=get(row+0x64,'f')[0]
                    assert actual_window==(math.inf if i==0 else min(f32(step+step),f32(1.4)))
                    assert get(row+0x7c,'3B')==(0,0,0)
                # Verify the native generic selector's action-block duration as well.
                put(stack+0x1000,'Q',stack+0x3000)
                uc.reg_write(r.UC_X86_REG_RSP,stack+0x1000)
                uc.reg_write(r.UC_X86_REG_RCX,record)
                uc.emu_start(0x14588be10,stack+0x3000,count=2048)
                assert bits(xf(r.UC_X86_REG_XMM0))==bits(f32(f32(count*step)+windup))
                cases+=1
    membership_cases=0
    def membership_stop(machine,a,size,user):
        if a in (0x145950526,0x1459505c5): machine.emu_stop()
    stop_hook=uc.hook_add(unicorn.UC_HOOK_CODE,membership_stop)
    for inner,outer,distance in [(5.,10.,d) for d in [4.999,5.,7.5,10.,10.001,math.nan]]+[(math.nan,10.,5.),(5.,math.nan,5.)]:
        uc.reg_write(r.UC_X86_REG_R13,rows);put(rows+0x38,'f',outer)
        sx(r.UC_X86_REG_XMM8,inner);sx(r.UC_X86_REG_XMM0,distance)
        uc.emu_start(0x14595051a,0x1459505c5,count=32)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&1)==(distance>=inner and outer>=distance)
        membership_cases+=1
    uc.hook_del(stop_hook)
    tell_cases=0
    for end in [11.6,12.4,100.]:
        for lead in [math.inf,f32(1.4),f32(.2)]:
            for now in [10.,11.,12.5,101.]:
                uc.reg_write(r.UC_X86_REG_R12,rows);put(rows+0x50,'f',10.);put(rows+0x64,'f',lead)
                sx(r.UC_X86_REG_XMM0,end);sx(r.UC_X86_REG_XMM6,now)
                uc.emu_start(0x145952579,0x1459525ba,count=64)
                assert bits(xf(r.UC_X86_REG_XMM2))==bits(min(now,max(10.,f32(f32(end)-lead))))
                tell_cases+=1
    for item in ranges:
        if 'assembly' in item:
            a=int(item['va'],16)
            assembly='\n'.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() for i in md.disasm(raw(a,item['byte_count']),a))+'\n'
            item['assembly_sha256']=hashlib.sha256(assembly.encode()).hexdigest()
    manifest=dict(schema_version=1,target_version=target['version'],target_sha256=SHA,target_executed=False,
        ranges=ranges,records=records,native_producer_cases=cases,native_duration_cases=cases,
        native_membership_cases=membership_cases,native_tell_start_cases=tell_cases,
        constants=[span(0x145dcce80,4),span(0x146be7cd0+24*4,4),span(0x14722ce3c+24*4,4)],
        rea=dict(provider='ghidra',evidence_id='ev_80cfbb2fcc905e884a1d637976f79982ef233ae88e39b17ddcb61c2b1f105e10',
            analysis='Original-VA raw producer import, branch145958e3a explicitly seeded; indirect/table/external callees remain bounded.'),
        established=['Five boss and three guardian current native27 slots plus guardian1511 phase0, with exact six-word payloads and cooldowns.',
            'Initial circle for count0/1; subsequent inclusive donut rings, same fixed sourceXY and shared wrapping marker IDs.',
            'Only first circle queues the impact visual; rings use min(2*step,1.4s) tell windows.',
            'Native27 duration selector uses count*step+windup; hold/cast uses windup.'],
        limits=['Unicorn runs extracted instructions with synthetic memory and height/hold/packet seams; no original process or Rust code executes.',
            'Source constants, slot records and live dispatch hooks are checked; Rust tests are authored but not compiled/run.',
            'Native28 persistent donut pools/warnings, other shapes and custom boss cast widget remain unrecovered; runtime/visual parity unverified.'])
    if write:
        STAGED.mkdir(parents=True,exist_ok=True)
        (STAGED/'manifest.json').write_text(dump(manifest))
        for name,a,b in [('spell-go-flags',0x1458cd872,0x1458cd882),('duration',0x14588be10,0x14588c004),('hold',0x145957320,0x145957562),('cast-start',0x1459577f0,0x1459578a0),('action-block',0x145957c3e,0x145957cd8),('optional-ground-visual',0x1459527aa,0x14595280d),('producer',0x145958e3a,0x14595914b),('donut-hit',0x14595051a,0x145950526),('donut-outer',0x1459505b9,0x1459505c5),('tell-start',0x145952579,0x1459525ba)]:
            (STAGED/(name+'.asm')).write_text('\n'.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() for i in md.disasm(raw(a,b-a),a))+'\n')
        print(STAGED.relative_to(ROOT))
    else:
        assert json.loads((RETAINED/'manifest.json').read_text())==manifest
        for item in ranges:
            if 'assembly' in item:
                assert hashlib.sha256((RETAINED/item['assembly']).read_bytes()).hexdigest()==item['assembly_sha256']
    print(f'Raid waves:9 source/native records, {cases} native producer and {cases} duration + {membership_cases} annulus + {tell_cases} tell-start cases passed; no compiler/game')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true')
    run(parser.parse_args().write)
