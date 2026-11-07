#!/usr/bin/env python3
"""Check current player-bomb producer/follow/burst contracts without building or launching.

--write stages textual evidence under runtime/analysis/staging/native-evidence/0.109.0/raid-bombs.
The shared hazard constructor remains canonical under raid-lines; external
height, serializers, localization and canonical damage are controlled seams.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import re
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes

sys.path[:0]=[str(p) for p in [ROOT/'runtime/tool-state/python/camera/python-libs',
    ROOT/'runtime/tool-state/python/armory/python-libs'] if p.is_dir()]

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED=ROOT/'docs/analysis/evidence/0.109.0/raid-bombs'
STAGED=ROOT/'runtime/analysis/staging/native-evidence/0.109.0/raid-bombs'
RANGES={
    'producer':(0x145957d4b,0x145957f34),
    'player-follow-height':(0x14594f1b5,0x14594f1f8),
    'player-follow':(0x14594f743,0x14594f765),
    'move-publication-gate':(0x145950134,0x145950172),
    'enemy-burst-queue':(0x145951091,0x1459511a5),
    'ordinary-radius-selector':(0x1459c4940,0x1459c4c29),
    'enemy-damage-consumer':(0x1459532d0,0x145953305),
    'removal-sort':(0x14595360f,0x145953671),
    'removal-deduplicate':(0x145953b7d,0x145953c52),
    'removal-descending-index':(0x1459528d6,0x1459528ee),
}
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v):return json.dumps(v,indent=2,ensure_ascii=False,allow_nan=False)+'\n'

def main(write):
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    target=latest_target(verify=True);assert target['sha256']==SHA
    module = load_script('bomb_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(target_bytes(target));data=pe.data
    def raw(a,n):v=data[pe.rva_offset(a-pe.image_base):][:n];assert len(v)==n;return v
    def span(a,n):return dict(va=hex(a),byte_count=n,file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(raw(a,n)).hexdigest())
    records=[]
    for zi in range(12):
        bosses,n=struct.unpack('<QQ',raw(0x146bde390+zi*240+0x88,16));assert n==5
        for bi in range(n):
            boss=bosses+bi*104;bid=struct.unpack('<I',raw(boss+64,4))[0];moves,count=struct.unpack('<QQ',raw(boss+16,16))
            for slot in range(count):
                a=moves+slot*56;v=raw(a,56)
                if v[45]!=30:continue
                w=list(struct.unpack('<14I',v));records.append(dict(boss_id=bid,slot=slot,payload_words=w[:5],repeat_bits=w[12],record=span(a,56)))
    assert [(v['boss_id'],v['slot']) for v in records]==[(192,1),(193,3),(1494,5)]
    guardians=json.loads((ROOT/'docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json').read_text());assert guardians['target_sha256']==SHA
    assert all(m['tag']!=30 for g in guardians['rows'] for v in g['variants'] for m in v)
    assert all(p['tag']!=30 for g in guardians['rows'] for p in g['phases'])
    md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        page=address&~4095
        if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,rows,frame,world,stack,actors,queue=[0x71000000+i*0x10000 for i in range(8)]
    for base in [game,record,rows,frame,world,stack,actors,queue]:uc.mem_map(base,0x4000)
    def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def literal(a,n):return raw(a,n) if a>=pe.image_base else bytes(uc.mem_read(a,n))
    seams={0x1459577f0:'cast-start',0x1458d6f90:'primary',0x1458dc180:'secondary',
        0x1458cd770:'spell-go',0x141196a70:'enqueue-packet',0x14590d9a0:'actor-label',
        0x1458ec500:'localize',0x1458c1260:'warning',0x145bfa12f:'hypot',0x145971490:'damage'}
    stop=set();calls=[];valid_height=True
    def hook(machine,a,size,user):
        if a in stop:machine.emu_stop();return
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':assert int(ins.op_str,16) in seams or int(ins.op_str,16)==0x1459575e0,hex(a)
        if a not in seams:return
        name=seams[a];sp=uc.reg_read(r.UC_X86_REG_RSP)
        if name=='primary':uc.reg_write(r.UC_X86_REG_RAX,int(valid_height));sx(r.UC_X86_REG_XMM0,4.)
        elif name=='secondary':put(uc.reg_read(r.UC_X86_REG_RCX),'I',0)
        elif name=='cast-start':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='spell-go':
            target=get(sp+0x30,'Q')[0]
            calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),get(sp+0x28,'Q')[0],get(uc.reg_read(r.UC_X86_REG_R9),'Q')[0],get(target,'I')[0],get(target+8,'Q')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='actor-label':uc.reg_write(r.UC_X86_REG_RAX,record+0x100);uc.reg_write(r.UC_X86_REG_RDX,4)
        elif name=='localize':
            calls.append((name,literal(uc.reg_read(r.UC_X86_REG_RCX),uc.reg_read(r.UC_X86_REG_RDX)).decode()))
            uc.reg_write(r.UC_X86_REG_RAX,0)
        elif name=='warning':
            calls.append((name,literal(uc.reg_read(r.UC_X86_REG_R9),get(sp+0x28,'Q')[0]).decode()))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='hypot':sx(r.UC_X86_REG_XMM0,math.hypot(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
        elif name=='damage':calls.append((name,uc.reg_read(r.UC_X86_REG_RDX),xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(sp+0x28,'B')[0],get(sp+0x30,'B')[0],get(sp+0x38,'B')[0]))
        ret=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def setup():
        for base in [game,record,rows,frame,world,stack,actors,queue]:uc.mem_write(base,bytes(0x4000))
        put(game+0x460,'Q',1);put(game+0x560,'QQ',actors,1);put(game+0x588,'QQQ',64,rows,0)
        put(game+0x998,'Q',world);put(game+0xa34,'f',10.);put(game+0xa38,'I',99)
        put(world+0x68,'Q',0xffffffffffffffff);put(world+0xb8,'f',9.)
        put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77);put(frame+0xd0,'f',13.);put(frame+0xe0,'f',17.)
        uc.mem_write(record+0x100,b'Boss')
        for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,value)
        sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,10.)
        uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);uc.reg_write(r.UC_X86_REG_EFLAGS,2);calls.clear()
    producer_cases=0;duration_cases=0
    for row in records:
      for windup in [0.,f32(1.6),5.]:
       for valid_height in [False,True]:
        setup();w=row['payload_words'][:];w[2]=bits(windup);put(record,'5I',*w);put(record+45,'B',30)
        stop={0x145957978};uc.emu_start(0x145957d4b,0,count=1500)
        assert get(game+0x598,'Q')[0]==1 and get(rows+0x30,'I')[0]==0
        assert get(rows+0x40,'3f')==(13.,17.,4. if valid_height else 9.)
        assert get(rows+0x50,'2f')==(10.,f32(10.+windup))
        assert get(rows+0x58,'I')[0]==bits(f32(max(f32(windup+f32(-1.6)),0.)+10.))
        assert get(rows+0x60,'I')[0]==bits(f32(100.*struct.unpack('<f',struct.pack('<I',w[3]))[0]))
        assert get(rows+0x74,'I')[0]==bits(f32(100.*struct.unpack('<f',struct.pack('<I',w[4]))[0]))
        assert calls[0]==('cast-start',w[0],windup)
        assert ('spell-go',w[0],1,1,0,1) in calls
        assert calls[-1]==('warning','You are the bomb! Carry it into the horde!')
        producer_cases+=1
        put(stack+0x1008,'Q',stack+0x3000);uc.reg_write(r.UC_X86_REG_RSP,stack+0x1008);uc.reg_write(r.UC_X86_REG_RCX,record)
        stop={stack+0x3000};uc.emu_start(0x14588be10,0,count=100)
        assert bits(xf(r.UC_X86_REG_XMM0))==bits(windup);duration_cases+=1
    height_cases=0
    for valid_height in [False,True]:
        setup();put(game+0x4c8,'3f',13.,17.,3.);uc.reg_write(r.UC_X86_REG_R13,game)
        stop={0x14594f1f8};uc.emu_start(0x14594f1b5,0,count=40)
        assert get(frame+0x228,'f')[0]==(4. if valid_height else 3.);height_cases+=1
    follow_cases=0;move_gate_cases=0
    for deadline in [10.,f32(13.4),float('nan')]:
      for now in [10.,f32(13.399),f32(13.4),15.,float('nan')]:
        setup();put(rows+0x40,'3f',1.,2.,3.);put(rows+0x58,'f',deadline);put(frame+0x234,'f',now);put(frame+0x228,'f',30.)
        uc.reg_write(r.UC_X86_REG_R13,rows);uc.reg_write(r.UC_X86_REG_XMM9,bits(10.)|(bits(20.)<<32))
        stop={0x14594f765};uc.emu_start(0x14594f743,0,count=30)
        assert get(rows+0x40,'3f')==((10.,20.,30.) if deadline>now else (1.,2.,3.));follow_cases+=1
        put(rows+0x50,'f',10.);put(rows+0x70,'f',0.);put(rows+0x1c,'f',0.);uc.reg_write(r.UC_X86_REG_RAX,0)
        stop={0x14594fdec,0x145950172};uc.emu_start(0x145950134,0,count=30)
        assert (uc.reg_read(r.UC_X86_REG_RIP)==0x14594fdec)==(deadline>10.);move_gate_cases+=1
    burst_queue_cases=0
    for damage in [0.,100.,float('nan')]:
      for shape in [0,1,2]:
        setup();put(rows+0x40,'3f',10.,20.,30.);put(rows+0x74,'f',damage);put(rows+0x30,'I',shape)
        put(rows+0x34,'f',7.);put(rows+0x5c,'I',20475);put(frame+0x80,'QQQ',64,queue,0)
        uc.reg_write(r.UC_X86_REG_R13,rows);uc.reg_write(r.UC_X86_REG_RSI,rows+0x40)
        stop={0x1459511a5};uc.emu_start(0x145951091,0,count=100)
        admitted=damage>0. and shape==0;assert get(frame+0x90,'Q')[0]==int(admitted)
        if admitted:assert get(queue,'5fI')==(10.,20.,30.,7.,damage,20475)
        burst_queue_cases+=1
    selection_cases=0
    for dead in [0,1]:
      for boss in [False,True]:
       for guardian in [False,True]:
        for distance in [0.,7.,7.001]:
            setup();put(actors+0xb0,'B',dead);put(actors+0x18,'Q',0 if boss else 0xffffffffffffffff)
            put(actors+0x58,'Q',0 if guardian else 0xffffffffffffffff);put(actors+0x180,'3f',distance,0.,999.)
            put(rows,'2f',0.,0.);put(record,'f',7.)
            for reg,value in [(r.UC_X86_REG_R12,actors+0x1d8),(r.UC_X86_REG_R15,actors+0x1d8),
                              (r.UC_X86_REG_RDI,queue),(r.UC_X86_REG_RBX,rows),(r.UC_X86_REG_R14,record)]:uc.reg_write(reg,value)
            sx(r.UC_X86_REG_XMM7,0.);stop={0x1459c49de,0x1459c4a76}
            uc.emu_start(0x1459c49eb,0,count=100)
            assert (uc.reg_read(r.UC_X86_REG_RIP)==0x1459c4a76)==(not dead and not boss and not guardian and distance<=7.)
            selection_cases+=1
    setup();put(queue,'Q',123);put(frame+0x270,'Q',queue);put(frame+0x248,'Q',game)
    for reg,value in [(r.UC_X86_REG_R13,8),(r.UC_X86_REG_R14,0),(r.UC_X86_REG_R15D,20475)]:uc.reg_write(reg,value)
    sx(r.UC_X86_REG_XMM6,1500.);stop={0x145953305};uc.emu_start(0x1459532d0,0,count=40)
    assert calls==[('damage',123,1500.,20475,2,0,0)]
    removal_cases=0
    for indices in [[1,0],[2,0,1],[0,0],[5,1,3,5,1],[9,0,7,2,4,1]]:
        setup();put(queue,'Q'*len(indices),*indices)
        put(frame+0x1b8,'QQ',queue,len(indices));put(frame+0x248,'Q',game)
        uc.reg_write(r.UC_X86_REG_RCX,queue);uc.reg_write(r.UC_X86_REG_RDX,len(indices))
        stop={0x145952875};uc.emu_start(0x14595360f,0,count=1000)
        ordered=sorted(set(indices));assert get(frame+0x1c0,'Q')[0]==len(ordered)
        assert get(queue,'Q'*len(ordered))==tuple(ordered)
        uc.reg_write(r.UC_X86_REG_R14,queue+len(ordered)*8);uc.reg_write(r.UC_X86_REG_R12,game)
        stop={0x1459528e5};uc.emu_start(0x1459528d6,0,count=10)
        assert uc.reg_read(r.UC_X86_REG_RBX)==ordered[-1]
        removal_cases+=1
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_bombs.rs').read_text()
    for token in ['if w[0] != 12','row.follow_player_until =','0xbfcccccd','row.enemy_damage =','hit_targets: vec![context.player_guid]','RaidWarning::Bomb']:
        assert token in source,token
    schedule=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs').read_text()
    for row in records:
        body=re.search(rf'BossSchedule {{ boss_id: {row["boss_id"]}, moves: &\[(.*?)\n    \] }},',schedule,re.S).group(1)
        match=re.search(rf'ScheduledMove {{ native_slot: {row["slot"]}, native_tag: 30, ability: RawBossAbility {{ words: \[(.*?)\]',body)
        assert match and [int(v,16) for v in match.group(1).split(', ')]==[12,*row['payload_words'],row['repeat_bits']],(row['boss_id'],row['slot'])
    areas=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
    for token in ['self.dispatch_bomb(record, context, port)','now < row.follow_player_until',
                  'row.follow_player_until > row.start','port.raid_bomb_damage(center,radius,damage,spell)',
                  'let mut original_indices: Vec<usize>','original_indices.remove(index)',
                  'ended.sort_unstable_by_key(|&(index, _)| index)','ended.dedup_by_key(|row| row.0)',
                  'for (_, id) in ended.into_iter().rev()']:
        assert token in areas,token
    live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/raid_hits.rs').read_text()
    for token in ['self.dead || self.completed','let targets = actor_targets(','!self.guardian_state.contains(row.actor.guid)',
                  'row.actor.movement.position_at(now)','passive.hit_with_execution(PendingHit',
                  'source_guid: 1','critical: false','damages_player: false, school: 2',
                  'port.flush_vitals','self.accept_refreshed_stats']:
        assert ''.join(token.split()) in ''.join(live.split()),token
    owner=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs').read_text()
    assert 'self.apply_raid_bomb_hits(bomb_bursts, player, facing, world)' in owner
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,records=records,
        cases=dict(producer=producer_cases,duration=duration_cases,follow_height=height_cases,follow=follow_cases,movement_gate=move_gate_cases,
            burst_queue=burst_queue_cases,enemy_selection=selection_cases,damage_dispatch=1,removal_order=removal_cases),ranges=[],
        canonical_constructor='docs/analysis/evidence/0.109.0/raid-lines/hazard-constructor.asm',
        warning=dict(**span(0x14722af08,42),text='You are the bomb! Carry it into the horde!'),
        follow_release_constant=dict(**span(0x147229920,4),bits=raw(0x147229920,4).hex()),
        rea=dict(provider='ghidra',evidence_id='ev_c4d3cd164dc7a08b02dc1436ec934c908c04e7cd2bc1a88df5caef05351f7c27',
            procedure='0x145957d4b',input_range=span(0x1459578e0,0x5462),pseudocode='producer.pseudo.c',
            pseudocode_sha256='ac2259ddc999dab31408e22202fde4804686a8760f13ade41292a88825f74c1a'),
        limits=['Synthetic memory only; original process, Rust compilation, gameplay/visual/original-rebuilt parity not run.',
            'Height, localization, packet serializers, CRT hypot and canonical player-damage routine are controlled external seams.',
            'Native producer/header/follow/publication/queue/admission and damage-call arguments execute; complete canonical player damage internals are not re-certified by this check.'])
    assemblies={}
    for role,(a,b) in RANGES.items():
        ins=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in ins)==b-a
        v=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        assemblies[role+'.asm']=v;manifest['ranges'].append(dict(role=role,**span(a,b-a),assembly=role+'.asm',assembly_sha256=hashlib.sha256(v.encode()).hexdigest()))
    out=STAGED if write else RETAINED
    if write:
        out.mkdir(parents=True,exist_ok=True);(out/'manifest.json').write_text(dump(manifest))
        for name,value in assemblies.items():(out/name).write_text(value)
    else:
        assert json.loads((out/'manifest.json').read_text())==manifest
        for name,value in assemblies.items():assert (out/name).read_text()==value
        assert hashlib.sha256((out/'producer.pseudo.c').read_bytes()).hexdigest()==manifest['rea']['pseudocode_sha256']
    print(f'Raid bombs:3 primary slots; {producer_cases} producer+{duration_cases} duration+{height_cases} height+{follow_cases} follow+{move_gate_cases} movement gate+{burst_queue_cases} burst+{selection_cases} selection+1 damage-dispatch+{removal_cases} removal-order cases; no compiler/game.')

if __name__=='__main__':
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');main(ap.parse_args().write)
