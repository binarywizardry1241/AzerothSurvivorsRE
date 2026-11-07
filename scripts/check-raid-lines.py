#!/usr/bin/env python3
"""Check current warned-line producer/delayed movement using bounded native instructions.

No compiler, process launch or game is used. --write stages reviewed evidence
under runtime/analysis/staging/native-evidence/0.109.0/raid-lines; default checks retained evidence.
Capstone and Unicorn are optional analysis dependencies, never build inputs.
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

# Existing optional analysis packages stay project-local; normal Python
# installations with these dependencies also work without these directories.
sys.path[:0]=[str(p) for p in [ROOT/'runtime/tool-state/python/camera/python-libs',
    ROOT/'runtime/tool-state/python/armory/python-libs'] if p.is_dir()]

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED = ROOT/'docs/analysis/evidence/0.109.0/raid-lines'
STAGED = ROOT/'runtime/analysis/staging/native-evidence/0.109.0/raid-lines'
RANGES = {
    'producer-prefix': (0x145958665, 0x14595870b),
    'producer-tail': (0x14595bf44, 0x14595c0e9),
    'collision-margin': (0x1458d1c90, 0x1458d1d70),
    'hazard-constructor': (0x1459575e0, 0x1459577e7),
    'delayed-queue': (0x145957260, 0x14595731f),
    'delayed-admission': (0x14594e7a3, 0x14594e7c1),
    'delayed-alive-source': (0x14594e8d3, 0x14594e90f),
    'delayed-movement': (0x14594ea7b, 0x14594edb4),
    'line-membership': (0x145950436, 0x14595049b),
    'facing-packet-fields': (0x1458c6fb2, 0x1458c7126),
    'charge-packet-fields': (0x1458c2c32, 0x1458c2d6b),
    'boss-size-load': (0x14596db9e, 0x14596dba4),
    'boss-size-store': (0x14596dfab, 0x14596dfb4),
    'guardian-size-load': (0x14593dffb, 0x14593e00b),
    'guardian-size-store': (0x14593e54b, 0x14593e554),
}
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v): return json.dumps(v,indent=2,ensure_ascii=False,allow_nan=False)+'\n'

def main(write):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    target=latest_target(verify=True)
    assert target['sha256']==SHA, 'Recover changed installed bytes before using native addresses'
    data=target_bytes(target)
    module = load_script('lines_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    def raw(a,n):
        v=data[pe.rva_offset(a-pe.image_base):][:n];assert len(v)==n;return v
    def span(a,n):return dict(va=hex(a),byte_count=n,file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(raw(a,n)).hexdigest())
    records=[];enemy_scales={}
    for zi in range(12):
        enemies,enemy_count=struct.unpack('<QQ',raw(0x146bde390+zi*240+0x78,16))
        for index in range(enemy_count):
            a=enemies+index*80;identity=struct.unpack('<I',raw(a+32,4))[0]
            assert identity not in enemy_scales
            enemy_scales[identity]=(a+40,struct.unpack('<I',raw(a+40,4))[0])
        bosses,n=struct.unpack('<QQ',raw(0x146bde390+zi*240+0x88,16))
        assert n==5
        for bi in range(n):
            boss=bosses+bi*104;bid=struct.unpack('<I',raw(boss+64,4))[0]
            moves,count=struct.unpack('<QQ',raw(boss+16,16))
            for slot in range(count):
                a=moves+slot*56;v=raw(a,56)
                if v[45]!=7:continue
                w=struct.unpack('<14I',v)
                records.append(dict(boss_id=bid,slot=slot,spell=w[0],repeat_bits=w[12],record=span(a,56),
                    size_input=span(boss+72,4),definition_size_bits=struct.unpack('<I',raw(boss+72,4))[0]))
    guardian_path='docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json'
    catalog=json.loads((ROOT/guardian_path).read_text());assert catalog['target_sha256']==SHA
    for ri,row in enumerate(catalog['rows']):
        for vi,variant in enumerate(row['variants']):
            for mi,move in enumerate(variant):
                if move['tag']!=7:continue
                a=int(move['record']['va'],16);assert span(a,56)['sha256']==move['record']['sha256']
                records.append(dict(guardian_id=row['enemy_id'],variant=vi,slot=mi,
                    spell=move['words'][0],repeat_bits=move['words'][12],
                    size_input=span(enemy_scales[row['enemy_id']][0],4),definition_size_bits=enemy_scales[row['enemy_id']][1],
                    canonical_record=f'{guardian_path}#/rows/{ri}/variants/{vi}/{mi}/record'))
        assert all(p['tag']!=7 for p in row['phases'])
    assert len([v for v in records if 'boss_id'in v])==17
    assert len([v for v in records if 'guardian_id'in v])==20
    assert all(v['spell']==100 for v in records)
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        a=address&~4095
        if a not in mapped:
            v=raw(a,4096);uc.mem_map(a,4096);uc.mem_write(a,v);mapped.add(a)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,rows,frame,world,stack,actors,queue,events=[0x70000000+i*0x10000 for i in range(9)]
    for base in [game,record,rows,frame,world,stack,actors,queue,events]:uc.mem_map(base,0x4000)
    def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    calls=[];primary_valid=True;primary_height=4.;angle=0.;fraction=1.;stop=None
    seams={0x145bfa11d:'cos',0x145bfa117:'sin',0x145957320:'hold',
           0x1459577f0:'cast',0x1458d6f90:'primary',0x1458dc180:'secondary',
           0x1458d13e0:'ray',0x1458c2b90:'movement',0x1458cd770:'spell-go',
           0x1458acda0:'packet-xyz'}
    def hook(machine,a,size,user):
        if a==stop:machine.emu_stop();return
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':
            destination=int(ins.op_str,16)
            assert destination in seams or destination in [0x1458d1c90,0x1459575e0,0x145957260],hex(destination)
        if a not in seams:return
        name=seams[a]
        if name=='cos':sx(r.UC_X86_REG_XMM0,math.cos(xf(r.UC_X86_REG_XMM0)))
        elif name=='sin':sx(r.UC_X86_REG_XMM0,math.sin(xf(r.UC_X86_REG_XMM0)))
        elif name=='ray':sx(r.UC_X86_REG_XMM0,fraction)
        elif name=='primary':uc.reg_write(r.UC_X86_REG_RAX,int(primary_valid));sx(r.UC_X86_REG_XMM0,primary_height)
        elif name=='secondary':put(uc.reg_read(r.UC_X86_REG_RCX),'I',0)
        elif name=='hold':calls.append((name,xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(uc.reg_read(r.UC_X86_REG_RSP)+0x28,'f')[0]))
        elif name=='cast':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='movement':
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            calls.append((name,get(uc.reg_read(r.UC_X86_REG_R8),'3f'),get(uc.reg_read(r.UC_X86_REG_R9),'3f'),get(sp+0x28,'I')[0],get(sp+0x30,'I')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='spell-go':
            calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),get(uc.reg_read(r.UC_X86_REG_RSP)+0x30,'Q')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='packet-xyz':
            header=uc.reg_read(r.UC_X86_REG_RDX);capacity,buffer,length=get(header,'QQQ')
            xyz=bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_R8),12))
            assert capacity>=length+12;uc.mem_write(buffer+length,xyz)
            put(uc.reg_read(r.UC_X86_REG_RCX),'QQQ',capacity,buffer,length+12)
            put(uc.reg_read(r.UC_X86_REG_RCX)+24,'Q',get(header+24,'Q')[0])
        sp=uc.reg_read(r.UC_X86_REG_RSP);ret=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def setup():
        for base in [game,record,rows,frame,world,stack,actors,queue,events]:uc.mem_write(base,bytes(0x4000))
        put(game+0x560,'QQ',actors,1);put(game+0x588,'QQQ',64,rows,0)
        put(game+0x5a0,'QQQ',64,queue,0);put(game+0x618,'QQQ',64,events,0)
        put(game+0x998,'Q',world);put(game+0xa34,'f',10.);put(game+0xa38,'I',0xffffffff)
        put(world+0x40,'Q',0);put(world+0x68,'Q',0xffffffffffffffff);put(world+0xb8,'f',9.)
        put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77)
        for reg,v in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,v)
        uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);uc.reg_write(r.UC_X86_REG_EFLAGS,2)
        calls.clear()
    producer_cases=0
    for distance in [0.,3.,50.]:
      for scale in [0.,4.,10.,float('nan')]:
       for fraction in [0.,.5,1.]:
        for primary_valid in [False,True]:
            setup();primary_height=4.;angle=0.
            put(record,'I',100);put(frame+0x150,'4f',0.,0.,0.,0.)
            put(frame+0xa8,'3f',0.,0.,2.);put(frame+0xd0,'4f',distance,0.,0.,0.)
            put(frame+0xe0,'f',0.);put(frame+0x178,'f',angle);put(actors+0x170,'f',scale)
            sx(r.UC_X86_REG_XMM10,0.);sx(r.UC_X86_REG_XMM11,3.);sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,10.)
            stop=0x145957978;uc.emu_start(0x145958665,0,count=2000)
            assert uc.reg_read(r.UC_X86_REG_RIP)==stop
            extended=f32(distance+6.);clip=max(0.,f32(fraction-f32(.5/max(extended,.5)))) if fraction<1. else 1.
            dest=f32(extended*clip);length=max(dest,4.)
            expected_width=min(max(f32(scale*f32(1.2)),4.),7.) if not math.isnan(scale) else math.nan
            assert calls[0]==('hold',f32(f32(length/40.)+1.),1,0.)
            assert calls[1]==('cast',100,1.)
            assert get(game+0x598,'Q')[0]==1 and get(rows+0x30,'I')[0]==2
            assert get(rows+0x34,'I')[0]==bits(length)
            assert get(rows+0x38,'I')[0]==bits(expected_width)
            assert get(rows+0x3c,'I')[0]==0 and get(rows+0x50,'2f')==(10.,11.)
            assert get(rows+0x60,'f')[0]==200. and get(rows+0x5c,'I')[0]==0
            assert get(game+0x5b0,'Q')[0]==1 and get(queue,'Q')[0]==77
            assert get(queue+8,'f')[0]==11. and get(queue+0x3d,'B')[0]==35
            assert get(queue+0x10,'f')[0]==dest
            expected_z=primary_height if primary_valid else f32(f32(f32(3.-2.)*clip)+2.)
            assert get(queue+0x18,'I')[0]==bits(expected_z)
            producer_cases+=1
    movement_cases=0
    for length in [0.,3.,40.,100.]:
      for prior in [0.,10.,float('nan')]:
       for primary_valid in [False,True]:
            setup();put(actors+0xf0,'Q',77);put(actors+0x180,'3f',0.,0.,2.)
            put(actors+0x198,'f',prior);put(frame+0x248,'Q',game);put(frame+0x270,'f',length)
            put(frame+0x1a8,'2f',0.,5.);put(frame+0x290,'Q',game+0x618)
            for reg,v in [(r.UC_X86_REG_RAX,actors),(r.UC_X86_REG_RBX,0),(r.UC_X86_REG_RDI,0)]:uc.reg_write(reg,v)
            for reg,v in [(r.UC_X86_REG_XMM15,0.),(r.UC_X86_REG_XMM14,40.),(r.UC_X86_REG_XMM13,f32(.15)),(r.UC_X86_REG_XMM11,1000.),(r.UC_X86_REG_XMM10,4294967040.),(r.UC_X86_REG_XMM8,f32(.2))]:sx(reg,v)
            stop=0x14594edb4;uc.emu_start(0x14594ea7b,0,count=2000)
            duration=max(f32(length/40.),f32(.15));from_z=primary_height if primary_valid else 2.
            assert calls[0]==('movement',(0.,0.,from_z),(length,0.,5.),1,int(f32(duration*1000.)))
            assert calls[1][0:2]==('spell-go',100)
            assert get(actors+0x174,'3f')==(0.,0.,from_z)
            assert get(actors+0x180,'3f')==(length,0.,5.)
            assert get(actors+0x18c,'2f')==(10.,duration)
            assert get(actors+0x194,'I')[0]==bits(f32(f32(10.+duration)+f32(.2)))
            assert get(actors+0x198,'I')[0]==bits(max(prior,f32(duration+f32(.4))) if not math.isnan(prior) else f32(duration+f32(.4)))
            movement_cases+=1
    admission_cases=0
    for deadline in [10.,11.,float('nan')]:
      for now in [10.,11.,float('nan')]:
        setup();put(game+0x5a8,'Q',queue);put(queue+8,'f',deadline);put(frame+0x234,'f',now)
        uc.reg_write(r.UC_X86_REG_R13,game);uc.reg_write(r.UC_X86_REG_RCX,0)
        stop=0x14594e7c1 if not deadline>now else 0x14594e790
        uc.emu_start(0x14594e7a3,0,count=20);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
        admission_cases+=1
    membership_cases=0
    for along,across in [(a,b) for a in [-.001,0.,10.,10.001] for b in [-2.001,-2.,0.,2.,2.001]]:
        setup();put(rows+0x38,'f',4.)
        uc.reg_write(r.UC_X86_REG_R13,rows);sx(r.UC_X86_REG_XMM6,0.);sx(r.UC_X86_REG_XMM8,10.)
        uc.reg_write(r.UC_X86_REG_XMM14,bits(along)|(bits(across)<<32))
        uc.reg_write(r.UC_X86_REG_XMM11,int.from_bytes(struct.pack('<4I',*[0x7fffffff]*4),'little'))
        sx(r.UC_X86_REG_XMM7,.5);stop=0x14595049b if 0.<=along<=10. else 0x145950526
        uc.emu_start(0x145950436,0,count=100)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&1)==(0.<=along<=10. and abs(across)<=2.)
        membership_cases+=1
    facing_packet_cases=0
    for facing in [0.,1.25,-2.5]:
      for serial in [0,0xffffffff]:
        setup();put(rows,'3f',1.,2.,3.);put(record,'3f',1.,2.,3.)
        packet_frame=frame+0x1000;uc.reg_write(r.UC_X86_REG_RBP,packet_frame)
        put(packet_frame-0x30,'QQQQ',128,rows,12,0xdd);put(packet_frame+0x50,'f',facing)
        for reg,v in [(r.UC_X86_REG_RAX,rows),(r.UC_X86_REG_RDX,12),
                      (r.UC_X86_REG_RBX,serial),(r.UC_X86_REG_RSI,queue),(r.UC_X86_REG_RDI,record)]:uc.reg_write(reg,v)
        stop=0x1458c7126;uc.emu_start(0x1458c6fb2,0,count=300)
        expected=struct.pack('<3fIBfIII3f',1.,2.,3.,serial,4,facing,0x100,1,1,1.,2.,3.)
        assert bytes(uc.mem_read(rows,len(expected)))==expected
        assert get(queue+16,'Q')[0]==len(expected)
        facing_packet_cases+=1
    duration_cases=0
    for row in records:
        setup();put(record,'I',row['spell']);put(record+45,'B',7)
        put(stack+0x1008,'Q',stack+0x3000);uc.reg_write(r.UC_X86_REG_RSP,stack+0x1008)
        stop=stack+0x3000;uc.emu_start(0x14588be10,0,count=100)
        assert bits(xf(r.UC_X86_REG_XMM0))==bits(f32(1.6))
        duration_cases+=1
    charge_packet_cases=0
    for milliseconds in [0,1,650,2000]:
      for serial in [0,0xffffffff]:
        setup();put(rows,'3f',1.,2.,3.);put(record,'3f',10.,20.,30.)
        packet_frame=frame+0x1000;uc.reg_write(r.UC_X86_REG_RBP,packet_frame)
        put(packet_frame-0x30,'QQQQ',128,rows,12,0xdd)
        put(packet_frame+0x50,'II',serial,milliseconds)
        # Win64 places these two 32-bit arguments in separate 8-byte slots.
        put(packet_frame+0x58,'I',milliseconds)
        for reg,v in [(r.UC_X86_REG_RDX,12),(r.UC_X86_REG_RSI,queue),
                      (r.UC_X86_REG_RDI,record)]:uc.reg_write(reg,v)
        stop=0x1458c2d6b;uc.emu_start(0x1458c2c32,0,count=300)
        expected=struct.pack('<3fIBIII3f',1.,2.,3.,serial,0,0x100,max(milliseconds,1),1,10.,20.,30.)
        assert bytes(uc.mem_read(rows,len(expected)))==expected
        assert get(queue+16,'Q')[0]==len(expected)
        charge_packet_cases+=1
    catalog_source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    source_sizes={int(identity):int(value,16) for identity,value in re.findall(
        r'(?:Boss|Enemy)Definition\s*\{\s*id: (\d+),.*?scale: f32::from_bits\(0x([0-9a-f]+)\)',catalog_source,re.S)}
    constructor_size_cases=0
    for row in records:
        identity=row.get('boss_id',row.get('guardian_id'));assert source_sizes[identity]==row['definition_size_bits'],identity
        setup();size=struct.unpack('<f',struct.pack('<I',row['definition_size_bits']))[0]
        if 'boss_id' in row:
            put(record+72,'f',size);uc.reg_write(r.UC_X86_REG_R13,record)
            stop=0x14596dba4;uc.emu_start(0x14596db9e,0,count=10)
            assert bits(xf(r.UC_X86_REG_XMM9))==row['definition_size_bits']
            stop=0x14596dfb4;uc.emu_start(0x14596dfab,0,count=10)
            actual=get(frame+0x130,'I')[0];expected=row['definition_size_bits']
        else:
            put(record+40,'f',size);uc.reg_write(r.UC_X86_REG_RSI,record);uc.reg_write(r.UC_X86_REG_R14,0)
            stop=0x14593e00b;uc.emu_start(0x14593dffb,0,count=10)
            expected=bits(f32(size*f32(1.35)));assert bits(xf(r.UC_X86_REG_XMM15))==expected
            stop=0x14593e554;uc.emu_start(0x14593e54b,0,count=10)
            actual=get(frame+0x1e0,'I')[0]
        assert actual==expected
        row['actor_size_bits']=actual;constructor_size_cases+=1
    terminal_path='docs/analysis/evidence/0.109.0/terminal-order/manifest.json'
    terminal=json.loads((ROOT/terminal_path).read_text());assert terminal['target']['sha256']==SHA
    for role in ['boss-append','guardian-append']:
        item=next(v for v in terminal['ranges'] if v['role']==role)
        assert span(int(item['start'],16),item['byte_count'])['sha256']==item['sha256']
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_lines.rs').read_text()
    for token in ['record.words[0] != 9','let extended = (dy * dy + dx * dx).sqrt() + 6.0','port.raid_block(context.source_guid, f32::from_bits(0x3fcccccd))','port.raid_hold_facing(','self.push(area)','self.lines.rows.push(','if self.rows[*index].at > now','port.begin_raid_charge(','spell_id: 100','hit_targets: Vec::new()']:
        assert token in source,token
    schedule=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs').read_text()
    for row in (v for v in records if 'boss_id' in v):
        body=re.search(rf'BossSchedule {{ boss_id: {row["boss_id"]}, moves: &\[(.*?)\n    \] }},',schedule,re.S).group(1)
        match=re.search(rf'ScheduledMove {{ native_slot: {row["slot"]}, native_tag: 7, ability: RawBossAbility {{ words: \[(.*?)\]',body)
        assert match and [int(v,16) for v in match.group(1).split(', ')]==[9,row['spell'],0,0,0,0,row['repeat_bits']]
    signatures=(ROOT/'crates/azeroth-survivors-re/src/guardians/signature_catalog.rs').read_text()
    observed=[(int(cool,16),[int(v,16) for v in words.split(', ')]) for cool,words in re.findall(
        r'Move \{ native_tag: 7, cooldown: f32::from_bits\(0x([0-9a-f]+)\), ability: Some\(RawBossAbility \{ words: \[(.*?)\]',signatures)]
    expected=[(row['repeat_bits'],[9,row['spell'],0,0,0,0,row['repeat_bits']]) for row in records if 'guardian_id' in row]
    assert observed==expected
    areas=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
    assert 'self.dispatch_line(record, context, port, math)' in areas
    assert areas.index('self.lines.tick(now, port)')<areas.index('self.tick_areas(now, elapsed, port)')
    adapter=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs').read_text()
    charge=adapter.split('fn begin_raid_charge(')[1].split('\n    fn ')[0]
    for token in ['self.bosses.iter_mut()','self.actors.iter_mut()','actor.attack_delay > request.attack_delay','RunEvent::RaidCharge','self.movement_counter.next()']:
        assert token in charge,token
    size_adapter=adapter.split('fn raid_source_scale(')[1].split('\n    fn ')[0]
    assert 'row.definition.scale' in size_adapter and 'self.guardian_state.render_scale(guid)' in size_adapter
    assert 'let scale = definition.scale * 1.35;' in (ROOT/'crates/azeroth-survivors-re/src/guardians/mod.rs').read_text()
    assert 'render_scale: spawn.scale' in (ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs').read_text()
    ranges=[];assemblies={}
    for role,(a,b) in RANGES.items():
        ins=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in ins)==b-a,role
        assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        assemblies[role+'.asm']=assembly
        ranges.append(dict(role=role,**span(a,b-a),assembly=role+'.asm',assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest()))
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,
        records=records,ranges=ranges,canonical_duration_selector='docs/analysis/evidence/0.109.0/raid-waves/duration.asm',
        canonical_actor_copies=terminal_path,
        constants=[dict(**span(a,4),bits=raw(a,4).hex()) for a in [0x145dd4988,0x145d9d4c8,0x145dd4e58,0x145dd0ee0,0x145d9d714,0x145d9d2a0,0x145dd2e48,0x145dd2e3c,0x145de21f4,0x145de2510,0x146be7ce0,0x147229760]],
        cases=dict(producer=producer_cases,delayed_movement=movement_cases,deadline=admission_cases,line_membership=membership_cases,facing_packet=facing_packet_cases,action_duration=duration_cases,charge_packet=charge_packet_cases,constructor_size=constructor_size_cases),
        rea=dict(provider='ghidra',evidence_id='ev_60944bc04668e8a0453bc91d9f17b8ab3ddf56caaded44346d6d2a45b07481db',
            input_range=span(0x1459578e0,0x5462),procedure='0x145958665',pseudocode='producer.pseudo.c',
            pseudocode_sha256='c4a586b826b8e81294884dda91d73a67e4487237cd26bc4fa9dc79010197288c'),
        limits=['External trigonometry, height, ray-fraction, hold/cast and packet constructors are controlled seams; native collision-margin, hazard/queue writes and delayed actor writes execute.',
            'Synthetic memory only: no original target process, complete encounter, Rust compilation, gameplay or visual parity.',
            'Fresh full delayed-owner Ghidra import encountered a bridge handshake-identity error; its bounded instructions are independently decoded and executed here.'])
    destination=STAGED if write else RETAINED
    if write:
        destination.mkdir(parents=True,exist_ok=True)
        for name,value in assemblies.items():(destination/name).write_text(value)
        (destination/'manifest.json').write_text(dump(manifest))
    else:
        assert json.loads((destination/'manifest.json').read_text())==manifest
        for name,value in assemblies.items():assert (destination/name).read_text()==value
        assert hashlib.sha256((destination/'producer.pseudo.c').read_bytes()).hexdigest()==manifest['rea']['pseudocode_sha256']
    print(f'Raid lines:17 boss +20 guardian slots; {producer_cases} producer +{movement_cases} movement +{admission_cases} deadline +{membership_cases} membership +{facing_packet_cases} facing-packet +{duration_cases} action-duration +{charge_packet_cases} charge-packet +{constructor_size_cases} size cases; no compiler/game.')

if __name__=='__main__':
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');main(ap.parse_args().write)
