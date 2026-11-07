#!/usr/bin/env python3
"""Check current grouped-tower instructions/source without compiling or launching.

--write stages selected textual evidence under runtime/analysis/staging/native-evidence/0.109.0.
CRT trigonometry/hypot, terrain, zone lookup, packets and allocation are explicit
synthetic seams. Original RNG, placement, grouping and failure admission execute.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
STAGED=ROOT/'runtime/analysis/staging/native-evidence/raid-towers'
RETAINED=ROOT/'docs/analysis/evidence/raid-towers'

def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v):return json.dumps(v,indent=2,ensure_ascii=False)+'\n'

def main(write):
    sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target)
    m = load_script('tower_pe', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
    def raw(a,n):
        value=data[pe.rva_offset(a-pe.image_base):][:n];assert len(value)==n;return value
    def span(a,n):return dict(va=hex(a),byte_count=n,file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(raw(a,n)).hexdigest())
    table=0x14722ce3c
    assert table+struct.unpack('<i',raw(table+(12-3)*4,4))[0]==0x1459588ca
    records=[];minion_phases=[]
    for zi in range(12):
        ptr,count=struct.unpack('<QQ',raw(0x146bde390+zi*240+0x88,16));assert count==5
        for bi in range(count):
            boss=ptr+bi*104;bid=struct.unpack('<I',raw(boss+64,4))[0]
            for role,offset,stride,tagoff,wordoff in [('move',16,56,45,0),('phase',48,72,61,4)]:
                moves,n=struct.unpack('<QQ',raw(boss+offset,16))
                for slot in range(n):
                    a=moves+slot*stride;v=raw(a,stride)
                    if role=='phase'and v[tagoff]==5:
                        w=struct.unpack('<18I',v);text_ptr,text_len=struct.unpack('<QQ',v[:16])
                        minion_phases.append(dict(boss_id=bid,phase_index=slot,count=w[4],threshold_bits=w[16],yell=raw(text_ptr,text_len).decode(),record=span(a,stride)))
                    if v[tagoff]!=12:continue
                    w=struct.unpack('<'+'I'*(stride//4),v)
                    row=dict(boss_id=bid,role=role,slot=slot,index=len(records),payload_words=list(w[wordoff:wordoff+6]),repeat_bits=w[12] if wordoff==0 else 0,record=span(a,stride))
                    row['semantic_words']=[13,row['index'],0,0,0,0,row['repeat_bits']]
                    if role=='phase':
                        text_ptr,text_len=struct.unpack('<QQ',v[:16])
                        row.update(phase_index=slot,threshold_bits=w[16],yell=raw(text_ptr,text_len).decode())
                    records.append(row)
    assert [(v['boss_id'],v['role'],v['slot'])for v in records]==[(1594,'phase',0),(994,'move',5),(1493,'move',3),(1493,'phase',0),(1494,'phase',2)]
    guardians=json.loads((ROOT/'docs/analysis/evidence/guardian-signatures/catalog.json').read_text())
    assert guardians['target_sha256']==SHA
    assert all(x['tag']!=12 for row in guardians['rows'] for variant in row['variants'] for x in variant)
    assert all(x['tag']!=12 for row in guardians['rows'] for x in row['phases'])
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_towers.rs').read_text()
    phase_source=(ROOT/'crates/azeroth-survivors-re/src/bosses/minion_phases.rs').read_text()
    phase_rows=['    PhaseSummon { boss_id: %d, phase_index: %d, threshold: f32::from_bits(0x%08x), count: %d, yell: %s },'%(
        row['boss_id'],row['phase_index'],row['threshold_bits'],row['count'],json.dumps(row['yell'],ensure_ascii=False))for row in minion_phases]
    assert len(phase_rows)==9
    assert phase_source.split('// BEGIN RECOVERED PHASE SUMMONS\n')[1].split('// END RECOVERED PHASE SUMMONS')[0]=='\n'.join(phase_rows)+'\n'
    fingerprints={path.stem:json.loads(path.read_text())for path in (ROOT/'crates/azeroth-survivors-re/assets/locales').glob('*.json')}
    identity=['common.female','common.male','common.cooldown_sec','common.list_sep','common.yards']
    locale_keys=['Get in a tower!','Stand still!']+[f"boss.{row['boss_id']}.phase{row['phase_index']+1}"for row in records if row['role']=='phase']
    locales=[];offset=0;decoder=json.JSONDecoder();seen=set()
    while(offset:=data.find(b'"game.title"',offset))>=0:
        start=data.rfind(b'{',max(0,offset-16),offset);assert start>=0;offset+=1
        native_text=data[start:start+512000].decode('utf8',errors='replace');native,end=decoder.raw_decode(native_text)
        payload=native_text[:end].encode('utf8');assert data[start:start+len(payload)]==payload
        candidates=[code for code,source in fingerprints.items()if all(source[key]==native[key]for key in identity)]
        assert len(candidates)==1;c=candidates[0];assert c not in seen;seen.add(c)
        for key in locale_keys:assert fingerprints[c].get(key,key)==native.get(key,key),(c,key)
        locales.append(dict(code=c,source=span(pe.offset_va(start),len(payload)),values={k:native[k]for k in locale_keys if k in native},absent=[k for k in locale_keys if k not in native]))
    assert len(locales)==14
    generated=[]
    for row in records:
        w=row['payload_words'];names=['radius','spread','windup','factor']
        generated.append('    Tower { spell: '+str(w[0])+', count: '+str(w[1])+', '+', '.join(f'{name}: f32::from_bits(0x{value:08x})'for name,value in zip(names,w[2:]))+' },')
    assert source.split('// BEGIN NATIVE TOWERS\n')[1].split('// END NATIVE TOWERS')[0]=='\n'.join(generated)+'\n'
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:
            uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,rows,frame,world,stack,actors,events,groups,removals,visuals,heap=[0x70000000+i*0x10000 for i in range(12)]
    for a in [game,record,rows,frame,world,stack,actors,events,groups,removals,visuals,heap]:uc.mem_map(a,0x8000)
    def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def reg(name,v=None):
        key=getattr(r,'UC_X86_REG_'+name)
        if v is not None:uc.reg_write(key,v)
        return uc.reg_read(key)
    def sx(name,v):reg(name,bits(v))
    def xf(name):return struct.unpack('<f',reg(name).to_bytes(16,'little')[:4])[0]
    mode='producer';stop=set();calls=[];height_mode=0;next_heap=heap
    def alloc(n):
        nonlocal next_heap
        result=next_heap;next_heap+=(n+15)&~15;assert next_heap<heap+0x8000;return result
    allowed={0x1459577f0,0x1458f1080,0x145bfa11d,0x145bfa117,0x145bfa12f,0x14588d0d0,0x1458d6f90,0x1458dc180,0x14590d9a0,0x1458ec500,0x1458c1260,0x141196a70,0x1459c2f40,0x140002200,0x1400021c0,0x1400021d0,0x145bfa0e7}
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    def hook(machine,a,size,user):
        if a in stop:machine.emu_stop();return
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':assert int(ins.op_str,16) in allowed,(hex(a),ins.op_str)
        if a in (0x1458f1080,0x1459c2f40):return
        if a not in allowed:return
        if a==0x1459577f0:calls.append(('cast',reg('R8D'),xf('XMM3')))
        elif a==0x145bfa11d:sx('XMM0',math.cos(xf('XMM0')))
        elif a==0x145bfa117:sx('XMM0',math.sin(xf('XMM0')))
        elif a==0x145bfa12f:sx('XMM0',math.hypot(xf('XMM0'),xf('XMM1')))
        elif a==0x14588d0d0:reg('RAX',0)
        elif a==0x1458d6f90:reg('RAX',int(height_mode==0));sx('XMM0',4.)
        elif a==0x1458dc180:put(reg('RCX'),'I',int(height_mode==1));put(reg('RCX')+12,'f',6.)
        elif a==0x14590d9a0:uc.mem_write(events,b'Guardian');reg('RAX',events);reg('RDX',8)
        elif a==0x1458ec500:
            demand(None,None,reg('RCX'),0,None,None)
            calls.append(('warning',bytes(uc.mem_read(reg('RCX'),reg('RDX'))).decode()));reg('RAX',0)
        elif a==0x1458c1260:
            text=bytes(uc.mem_read(reg('R9'),get(reg('RSP')+0x28,'Q')[0])).decode();calls.append(('emote',text));uc.mem_write(reg('RCX'),bytes(32))
        elif a==0x141196a70:pass
        elif a==0x140002200:pass
        elif a==0x1400021c0:reg('RAX',alloc(reg('RCX')))
        elif a==0x1400021d0:pass
        elif a==0x145bfa0e7:uc.mem_write(reg('RCX'),bytes(uc.mem_read(reg('RDX'),reg('R8'))))
        sp=reg('RSP');ret=get(sp,'Q')[0];reg('RSP',sp+8);reg('RIP',ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def setup():
        nonlocal next_heap
        for a in [game,record,rows,frame,world,stack,actors,events,groups,removals,visuals,heap]:uc.mem_write(a,bytes(0x8000))
        next_heap=heap;calls.clear()
        for name in ['RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15']:reg(name,0)
        put(game+0x560,'QQ',actors,1);put(game+0x588,'QQQ',64,rows,0)
        put(game+0x998,'Q',world);put(game+0xa34,'f',10.);put(game+0xa38,'II',0xffffffff,0xffffffff)
        put(world+0x68,'Q',0 if height_mode==1 else 0xffffffffffffffff);put(world+0xb8,'f',8.)
        put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77)
        reg('RBP',frame);reg('RSP',stack+0x1000);reg('RSI',game);reg('RCX',record)
        reg('MXCSR',0x1f80);reg('EFLAGS',2)
    mask=(1<<64)-1
    def rand(state,lower,upper):
        while True:
            a,b,c,d=state;result=((((a+d)&mask)<<23)|(((a+d)&mask)>>41))&mask;result=(result+a)&mask
            shift=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shift;d=((d<<45)|(d>>19))&mask;state[:]=[a,b,c,d]
            unit=f32(struct.unpack('<f',struct.pack('<I',0x3f800000|(result>>41)))[0]-1.)
            value=f32(f32(unit*f32(upper-lower))+lower)
            if value<upper:return value
    zone_xy=struct.unpack('<2f',raw(0x146bde458,8));zone_radius=struct.unpack('<f',raw(0x146bde468,4))[0]
    producer_cases=0
    payloads=[tuple(v['payload_words'])for v in records]
    for count in [0,1,4]:
        for spread in [-1.,0.,12.]:payloads.append((1449,count,bits(4.),bits(spread),bits(4.),bits(5.)))
    for words in payloads:
      for edge in [False,True]:
       for height_mode in [0,1,2]:
        setup();spell,count,radius_b,spread_b,windup_b,factor_b=words
        radius,spread,windup,factor=[struct.unpack('<f',struct.pack('<I',v))[0]for v in words[2:]]
        player=(f32(zone_xy[0]+(zone_radius-1. if edge else 0.)),zone_xy[1])
        put(record,'6I',*words);put(frame+0xd0,'4f',player[0],player[1],0.,0.)
        sx('XMM14',100.);sx('XMM15',10.)
        state=[1,2,3,4];put(game+0x9a0,'4Q',*state)
        stop={0x145957978};mode='producer';uc.emu_start(0x1459588ca,0,count=30000)
        assert reg('RIP') in stop
        assert get(game+0xa3c,'I')[0]==0 and get(game+0x598,'Q')[0]==max(count,1)
        angle=rand(state,0.,f32(math.tau))
        for i in range(max(count,1)):
            x,y=player
            if spread>0.:
                distance=f32(rand(state,f32(.7),1.)*spread);theta=f32(f32(f32(float(i)/max(count,1))*f32(math.tau))+angle)
                x=f32(f32(distance*f32(math.cos(theta)))+x);y=f32(f32(distance*f32(math.sin(theta)))+y)
                dx,dy=f32(x-zone_xy[0]),f32(y-zone_xy[1]);distance=f32(math.hypot(dx,dy));limit=f32(zone_radius-4.)
                if distance>=f32(.01)and distance>limit:
                    x=f32(f32(limit*f32(dx/distance))+zone_xy[0]);y=f32(f32(limit*f32(dy/distance))+zone_xy[1])
            a=rows+i*128
            assert get(a+0x10,'II')==(1,0)
            assert get(a+0x3c,'I')[0]==i and get(a+0x30,'If')==(0,radius)
            assert get(a+0x40,'3I')==(bits(x),bits(y),bits([4.,6.,8.][height_mode]))
            assert get(a+0x50,'2f')==(10.,f32(10.+windup))
            assert get(a+0x5c,'If')==(spell,f32(100.*factor))
        assert get(game+0x9a0,'4Q')==tuple(state)
        text='Get in a tower!'if spread>0. else'Stand still!'
        assert calls==[('cast',spell,windup),('warning',text),('emote',text)],calls
        producer_cases+=1

    group_cases=0
    for player_x in [-10.,0.,4.,4.000000476837158,10.,14.,100.]:
      for two_groups in [False,True]:
       for future_member in [False,True]:
        height_mode=0;setup();mode='groups';put(frame+0x248,'Q',game)
        definitions=[(1,10,0.,4.,100.,77,1449),(0,10,0.,999.,777.,55,1),(1,10,10.,4.,200.,88,24324)]
        if two_groups:definitions.append((1,20,30.,4.,300.,99,28524))
        for i,(kind,group,x,radius,damage,source_guid,spell)in enumerate(definitions):
            a=rows+128*i;put(a+0x10,'II',kind,group);put(a+0x20,'Q',source_guid);put(a+0x30,'If',0,radius);put(a+0x40,'3f',x,0.,4.);put(a+0x5c,'If',spell,damage)
            put(a+0x54,'f',1000. if future_member and i==2 else 10.)
        put(game+0x598,'Q',len(definitions))
        selected=[10]+([20]if two_groups else[]);put(groups,'I'*len(selected),*selected)
        put(frame+0xb0,'QQQ',64,groups,len(selected));put(frame+0x160,'Q',game+0x588)
        put(frame+0x1b0,'QQQ',64,removals,0);put(frame+0x168,'QQQ',64,visuals,0)
        put(frame+0x238,'f',5.);put(frame+0x228,'f',9.);put(frame+0x1a8,'Q',999)
        sx('XMM9',player_x);sx('XMM10',0.);sx('XMM7',.5)
        stop={0x145951df5};uc.emu_start(0x145951a11,0,count=10000)
        expected_damage=5.;expected_source=999;expected_visuals=[];expected_removals=[]
        for group in selected:
            members=[i for i,d in enumerate(definitions)if d[0]==1 and d[1]==group];expected_removals+=members
            first=definitions[members[0]]
            if not any(abs(player_x-definitions[i][2])<=definitions[i][3]for i in members):
                expected_damage=f32(expected_damage+first[4]);expected_source=first[5];expected_visuals.append((first[5],first[6],player_x,0.,9.))
        assert get(frame+0x238,'f')[0]==expected_damage
        assert get(frame+0x1a8,'Q')[0]==expected_source
        assert get(frame+0x1c0,'Q')[0]==len(expected_removals)
        assert get(removals,'Q'*len(expected_removals))==tuple(expected_removals)
        assert get(frame+0x178,'Q')[0]==len(expected_visuals)
        for i,v in enumerate(expected_visuals):assert get(visuals+i*24,'QI3f')==v
        group_cases+=1

    phase_cases=0
    for phase in [row for row in records if row['role']=='phase']+minion_phases:
      threshold=phase['threshold_bits']
      for ratio_bits in [0,threshold-1,threshold,threshold+1,0x3f800000,0x7fc00000]:
       for latched in [False,True]:
        setup();index=phase['phase_index'];mask=(1<<index)if latched else 0
        put(actors+0x4c,'I',mask);put(record+64,'I',threshold)
        for name,value in [('R14',actors),('R11',record),('R8',64),('RDI',index),('RDX',32),('R10',mask),('XMM0',ratio_bits)]:reg(name,value)
        stop={0x14597a510,0x14597a54a};uc.emu_start(0x14597a520,0,count=32)
        ratio=struct.unpack('<f',struct.pack('<I',ratio_bits))[0];limit=struct.unpack('<f',struct.pack('<I',threshold))[0]
        fired=reg('RIP')==0x14597a54a;assert fired==(not latched and ratio<limit)
        assert get(actors+0x4c,'I')[0]==(mask|(1<<index)if fired else mask)
        phase_cases+=1

    # Adding each failed group to the existing scalar differs from reducing
    # tower-only damage first: f32(2**24 + 1 + 1) remains 2**24.
    setup();put(frame+0x238,'f',float(2**24))
    for _ in range(2):
        sx('XMM6',1.);stop={0x145951d41};uc.emu_start(0x145951d2d,0,count=5)
    assert get(frame+0x238,'f')[0]==float(2**24)
    assert f32(float(2**24)+f32(1.+1.))!=get(frame+0x238,'f')[0]
    for token in ['self.next_tower_group.wrapping_add(1)','rng.range_f32(0., std::f32::consts::TAU)','radius - 4.','row.tower_group == Some(group)','*total += first.damage','CastTarget::Ground(visual_position)',
                  'result.ended.push((original_indices[index], row.id))','original_indices.remove(index)']:
        assert token in source,token
    ai_source=(ROOT/'crates/azeroth-survivors-re/src/bosses/ai.rs').read_text()
    assert ai_source.index('phases.take_actions(')<ai_source.index('self.raid_schedule.advance_with_phases(')
    assert'due.sort_by_key(|phase| phase.phase_index)'in phase_source
    ranges=[('producer',0x1459588ca,0x145958d26),('group-filter',0x1459c2f40,0x1459c30fe),('group-resolver',0x145951a11,0x145951df5),('random-f32',0x1458f1080,0x1458f11fa),('boss-phase-gate',0x14597a520,0x14597a54a)]
    manifest=dict(target_version='0.109.0',target_sha256=SHA,target_executed=False,records=records,minion_phase_records=minion_phases,native_producer_cases=producer_cases,native_group_cases=group_cases,native_accumulation_cases=2,native_phase_gate_cases=phase_cases,locale_catalogs=locales,ranges=[],
        warnings=[dict(text=t,**span(a,len(t)))for a,t in [(0x14722ab70,'Get in a tower!'),(0x14722ab7f,'Stand still!')]],
        rea=[dict(role=role,evidence_id=eid,provider='ghidra')for role,eid in [('producer','ev_464bbd6b1b697fef133eeb5eeba8ff52950f42f44d05b6300bd20e7e990f6cfa'),('group-filter','ev_d877253b01952b746adcf436f6ca818970699cd125bebe64ae917cea20f003ee')]],
        limits=['Unicorn uses synthetic terrain/zone/CRT/packet/heap seams; original process and reconstructed Rust do not execute.','Native direct producer, RNG, group filter, inclusive circle membership, failure aggregation and removal selection execute; complete engine/GPU/original-rebuilt parity remains unverified.'])
    assemblies={}
    for role,a,b in ranges:
        ins=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in ins)==b-a
        text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);assemblies[role+'.asm']=text
        manifest['ranges'].append(dict(role=role,**span(a,b-a),assembly=role+'.asm',assembly_sha256=hashlib.sha256(text.encode()).hexdigest()))
    out=STAGED if write else RETAINED
    if write:
        out.mkdir(parents=True,exist_ok=True);(out/'manifest.json').write_text(dump(manifest))
        for name,text in assemblies.items():(out/name).write_text(text)
    else:
        assert json.loads((out/'manifest.json').read_text())==manifest
        for name,text in assemblies.items():assert (out/name).read_text()==text
    print(f'PASS:5 native12 +9 shared minion phase records; {producer_cases} native producer +{group_cases} grouped resolution +{phase_cases} phase gate +2 accumulation cases; no compiler/game/Rust execution')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');main(parser.parse_args().write)
