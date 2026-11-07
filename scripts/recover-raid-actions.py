#!/usr/bin/env python3
"""Recover current cone/knockback records and check bounded native producers.

No compilation or game process. --write stages evidence in ignored runtime;
review/promote it before --check verifies the retained canonical ranges.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
STAGE = ROOT / 'runtime/analysis/staging/native-evidence/0.109.0/raid-actions'
KEPT = ROOT / 'docs/analysis/evidence/0.109.0/raid-actions'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/bosses/raid_actions.rs'
RANGES = {
    'dispatch-player-height': (0x145957aef, 0x145957b7c),
    'cone-producer': (0x145959bc4, 0x145959ceb),
    'knockback-producer': (0x145957f34, 0x145958025),
    'hazard-create': (0x1459575e0, 0x1459577e7),
    'visual-enqueue': (0x14594e230, 0x14594e2d3),
    'knockback-select': (0x14595056b, 0x1459505b9),
    'knockback-save': (0x14595105e, 0x145951086),
    'knockback-publish': (0x145952fed, 0x145953120),
    'knockback-packet': (0x1458c1c70, 0x1458c1f35),
    'visual-consume': (0x14593874c, 0x1459388cb),
    'cone-hit': (0x1459504af, 0x14595051a),
}
SHARED_ASSEMBLY={'hazard-create':'../raid-lines/hazard-constructor.asm'}

def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v): return json.dumps(v, indent=2, ensure_ascii=False) + '\n'

def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed target: recover new contracts first'
    data = target_bytes(target)
    module = load_script('actions_pe', ROOT/'scripts/inventory-executable.py')
    pe = module.PE(data)
    def raw(a, n):
        offset = pe.rva_offset(a-pe.image_base)
        value = data[offset:offset+n]; assert len(value) == n
        return value
    def span(a, n): return dict(va=hex(a), file_offset=hex(pe.rva_offset(a-pe.image_base)),
        byte_count=n, sha256=hashlib.sha256(raw(a,n)).hexdigest())
    def text(a):
        p,n = struct.unpack('<QQ',raw(a,16)); assert n < 4096
        return raw(p,n).decode()
    records=[]
    for zi in range(12):
        zone=0x146bde390+zi*240
        bosses,count=struct.unpack('<QQ',raw(zone+0x88,16)); assert count == 5
        for bi in range(count):
            boss=bosses+bi*104; identity=struct.unpack('<I',raw(boss+64,4))[0]
            moves,count=struct.unpack('<QQ',raw(boss+16,16))
            for slot in range(count):
                at=moves+slot*56;payload=raw(at,56);tag=payload[45]
                if tag not in [8,19]: continue
                w=list(struct.unpack('<14I',payload))
                records.append(dict(boss_id=identity, name=text(boss), native_slot=slot,
                    native_tag=tag,index=len(records),payload_words=w[:5 if tag==8 else 4],
                    repeat_bits=w[12],native_record=span(at,56),native_record_hex=payload.hex()))
    guardian_path='docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json'
    guardians=json.loads((ROOT/guardian_path).read_text()); assert guardians['target_sha256']==SHA
    for ri,row in enumerate(guardians['rows']):
        for vi,variant in enumerate(row['variants']):
            for mi,move in enumerate(variant):
                tag=move['tag']
                if tag not in [8,19]: continue
                native=move['record'];at=int(native['va'],16)
                assert span(at,56)['sha256']==native['sha256'];payload=raw(at,56)
                w=list(struct.unpack('<14I',payload));assert payload[45]==tag
                records.append(dict(guardian_id=row['enemy_id'],variant=vi,native_slot=mi,
                    native_tag=tag,index=len(records),payload_words=w[:5 if tag==8 else 4],repeat_bits=w[12],
                    canonical_native_record=f'{guardian_path}#/rows/{ri}/variants/{vi}/{mi}/record'))
        assert not any(p['tag'] in [8,19] for p in row['phases'])
    expected=[]
    for row in records:
        w=row['payload_words'];flt=lambda x:f'f32::from_bits(0x{x:08x})'
        if row['native_tag']==8:
            expected.append(f'    Action::Cone {{ spell: {w[0]}, range: {flt(w[1])}, degrees: {flt(w[2])}, windup: {flt(w[3])}, factor: {flt(w[4])} }},')
        else:
            expected.append(f'    Action::Knockback {{ spell: {w[0]}, radius: {flt(w[1])}, factor: {flt(w[2])}, speed: {flt(w[3])} }},')
    return target,raw,span,records,'\n'.join(expected)+'\n'

def native_cases(raw, records):
    # Existing optional analysis dependencies; never install anything here.
    sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        page=address&~4095
        if page not in mapped:
            uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,frame,stack,rows=(0x70000000,0x70010000,0x70020000,0x70030000,0x70040000)
    for a in [game,record,frame,stack,rows]:uc.mem_map(a,0x10000)
    def put(a,f,*v):uc.mem_write(a,struct.pack('<'+f,*v))
    def get(a,f):return struct.unpack('<'+f,uc.mem_read(a,struct.calcsize('<'+f)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def ret():
        sp=uc.reg_read(r.UC_X86_REG_RSP);end=get(sp,'Q')[0]
        uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,end)
    calls=[];stops=set();allowed=[]
    seams={0x145957320:'hold',0x1459577f0:'cast',0x1459575e0:'create',
           0x14594e230:'visual',0x145bfa11d:'cos',0x145bfa117:'sin',0x145bfa123:'atan2',
           0x145bfa129:'fmod',0x145bfa12f:'hypot',0x140002200:'allocator-init',
           0x1400021c0:'allocate',0x1458cf2e0:'packed-guid'}
    def hook(machine,a,size,user):
        if a in stops:uc.emu_stop();return
        name=seams.get(a)
        if name:
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            if name=='hold':calls.append((name,xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(sp+0x28,'f')[0]))
            elif name=='cast':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
            elif name=='create':
                shape=get(uc.reg_read(r.UC_X86_REG_R8),'III')
                calls.append((name,shape,xf(r.UC_X86_REG_XMM3),get(sp+0x28,'f')[0],
                    get(sp+0x30,'f')[0],get(sp+0x38,'f')[0],get(sp+0x40,'I')[0],get(sp+0x48,'f')[0]))
                put(game+0x598,'Q',1);uc.reg_write(r.UC_X86_REG_RAX,0)
            elif name=='visual':calls.append((name,xf(r.UC_X86_REG_XMM1),uc.reg_read(r.UC_X86_REG_R9D),get(get(sp+0x28,'Q')[0],'fff')))
            elif name=='atan2':sx(r.UC_X86_REG_XMM0,math.atan2(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='fmod':sx(r.UC_X86_REG_XMM0,math.fmod(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='hypot':sx(r.UC_X86_REG_XMM0,math.hypot(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='allocator-init':pass
            elif name=='allocate':uc.reg_write(r.UC_X86_REG_RAX,rows+0x1000)
            elif name=='packed-guid':
                guid=uc.reg_read(r.UC_X86_REG_RCX);output=uc.reg_read(r.UC_X86_REG_RDX)
                packed=guid.to_bytes(8,'little');wire=bytes([sum((v!=0)<<i for i,v in enumerate(packed))])+bytes(v for v in packed if v)
                capacity,buffer,count=get(output,'QQQ');assert count==0 and capacity>=len(wire)
                uc.mem_write(buffer,wire);put(output+16,'Q',len(wire))
            else:sx(r.UC_X86_REG_XMM0,{'cos':math.cos,'sin':math.sin}[name](xf(r.UC_X86_REG_XMM0)))
            ret();return
        assert any(a0<=a<a1 for a0,a1 in allowed),hex(a)
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':assert int(ins.op_str,16) in seams,hex(a)
    uc.hook_add(UC_HOOK_CODE,hook)
    def execute(a,b,end):
        nonlocal allowed,stops
        allowed=[(a,b)];stops={end}
        uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP)==end
    cases=0
    for row in records:
      for angle in [0.,.75,-2.5]:
        tag=row['native_tag'];w=row['payload_words'];values=[struct.unpack('<f',struct.pack('<I',v))[0] for v in w[1:]]
        uc.mem_write(frame,bytes(0x1000));uc.mem_write(rows,bytes(0x100));put(record,'14I',*(w+[0]*(14-len(w))))
        put(game+0x590,'Q',rows);put(frame+0xf0,'Q',3);put(frame+0x180,'Q',77)
        put(frame+0x150,'ffff',2.,4.,0.,0.);put(frame+0x178,'f',angle)
        uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
        uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record)
        sx(r.UC_X86_REG_XMM14,10.);sx(r.UC_X86_REG_XMM11,8.);sx(r.UC_X86_REG_XMM10,4.)
        calls.clear();a,b=RANGES['cone-producer' if tag==8 else 'knockback-producer'];execute(a,b,0x145957978)
        if tag==8:
            length,degrees,delay,factor=values;assert calls[0][:3]==('hold',f32(delay+f32(.3)),1)
            assert calls[1]==('cast',w[0],delay)
            shape=calls[2];assert shape[0]=='create' and shape[1]==(3,w[1],bits(f32(degrees*f32(math.pi/180))))
            assert shape[2:]==(2.,4.,angle,delay,0,f32(10.*factor))
            assert calls[3]==('visual',delay,w[0],(f32(f32(length*f32(math.cos(angle)))*.5+2.),f32(f32(length*f32(math.sin(angle)))*.5+4.),8.))
        else:
            radius,factor,speed=values;assert calls[0][:3]==('hold',f32(1.3),0)
            assert calls[1]==('cast',w[0],f32(1.3))
            assert calls[2][0]=='create' and calls[2][1][:2]==(0,w[1])
            assert calls[2][2:]==(2.,4.,0.,f32(1.3),w[0],f32(10.*factor))
            assert get(rows+0x7c,'B')[0]==1 and get(rows+0x6c,'I')[0]==w[3]
        cases+=1
      # The common gate dispatches native duration from the current record,
      # independently of each effect's later movement-hold duration.
      put(record,'14I',*(row['payload_words']+[0]*(14-len(row['payload_words']))))
      put(record+45,'B',row['native_tag']);stop=stack+0xf000;put(stack+0x8000,'Q',stop)
      uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000);uc.reg_write(r.UC_X86_REG_RCX,record)
      execute(0x14588be10,0x14588c004,stop)
      assert xf(r.UC_X86_REG_XMM0)==(struct.unpack('<f',struct.pack('<I',row['payload_words'][3]))[0] if row['native_tag']==8 else f32(1.3))
      cases+=1
    # Raw constant contract used by producer, membership and knockback fallback.
    assert raw(0x147229990,8)==struct.pack('<ff',1.,f32(math.pi/180))
    assert raw(0x145d9d2a0,8)==struct.pack('<ff',1.,.5)
    # Actual post-hit native knockback selection: the last qualifying hit wins;
    # positions within a strict one-yard epsilon retain the stored row angle.
    for dx,dy in [(0.,0.),(.5,0.),(0.,1.),(1.,0.),(-3.,2.)]:
      for fallback in [0.,.75,-2.5]:
        for speed in [0.,12.]:
            put(rows+0x40,'fff',0.,0.,99.);put(rows+0x4c,'f',fallback);put(rows+0x6c,'f',speed)
            put(frame+0xcc,'f',42.);put(frame+0x11c,'f',.125);put(frame-8,'Q',0)
            uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
            uc.reg_write(r.UC_X86_REG_R13,rows);sx(r.UC_X86_REG_XMM9,dx);sx(r.UC_X86_REG_XMM10,dy)
            sx(r.UC_X86_REG_XMM7,1.);sx(r.UC_X86_REG_XMM1,42.)
            # Nonpositive speed returns through the ordinary no-knockback lane.
            if speed<=0:continue
            execute(0x145950585,0x145951086,0x145951086)
            angle=math.atan2(dy,dx) if math.hypot(dx,dy)>=1. else fallback
            assert get(frame+0xcc,'f')[0]==speed and get(frame+0x11c,'I')[0]==bits(angle)
            assert get(frame-8,'B')[0]==1
            cases+=1
    # Execute the original packet serializer. Allocation, packed-GUID encoding
    # and CRT trigonometry are explicit seams; all scalar writes/order are native.
    for guid in [1,0xff00,0x1234005600000078]:
      for angle in [0.,.75,-2.5]:
        for horizontal in [0.,12.]:
            output=rows+0x2000;sp=stack+0x8000;stop=stack+0xf000
            put(sp,'Q',stop);put(sp+0x28,'f',horizontal);put(sp+0x30,'f',7.)
            uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,output)
            uc.reg_write(r.UC_X86_REG_RDX,guid);uc.reg_write(r.UC_X86_REG_R8D,0xfffffff0)
            sx(r.UC_X86_REG_XMM3,angle)
            execute(*RANGES['knockback-packet'],stop)
            capacity,buffer,count,opcode=get(output,'QQQH')
            packed=guid.to_bytes(8,'little');wire=bytes([sum((v!=0)<<i for i,v in enumerate(packed))])+bytes(v for v in packed if v)
            wire+=struct.pack('<Iffff',0xfffffff0,f32(math.cos(angle)),f32(math.sin(angle)),horizontal,-7.)
            actual=bytes(uc.mem_read(buffer,count))
            assert opcode==0xef and actual==wire,(guid,angle,horizontal,opcode,actual.hex(),wire.hex())
            cases+=1
    return cases,md

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');ap.add_argument('--check',action='store_true');ap.add_argument('--prepare-rea',action='store_true');args=ap.parse_args()
    if args.prepare_rea:
        target,raw,span,records,expected=recover()
        work=ROOT/'runtime/analysis/history/raid/raid-actions/cb67164bf8c6/reproduce';work.mkdir(parents=True,exist_ok=True)
        disabled='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
        dispatch_start,dispatch_end=0x1459578e0,0x14595cd42
        path=work/'dispatch.bin';path.write_bytes(raw(dispatch_start,dispatch_end-dispatch_start))
        seeds=work/'seeds.tsv';seeds.write_text(''.join(f'{RANGES[role][0]:#x}\tfunction\n{RANGES[role][0]:#x}\tcode\n' for role in ['cone-producer','knockback-producer']))
        plan=dict(target=str(path.relative_to(ROOT)),output=str((work/'dispatch').relative_to(ROOT)),init_timeout=60,timeout=180,
            environment={'REA_GHIDRA_DISABLED_ANALYZERS':disabled,'REA_GHIDRA_SEED_FILE':str(seeds.relative_to(ROOT))},
            open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(dispatch_start)),
            operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(RANGES[role][0]))) for role in ['cone-producer','knockback-producer']])
        (work/'dispatch-plan.json').write_text(dump(plan))
        for role in ['hazard-create','knockback-packet']:
            a,b=RANGES[role];path=work/(role+'.bin');path.write_bytes(raw(a,b-a))
            plan=dict(target=str(path.relative_to(ROOT)),output=str((work/role).relative_to(ROOT)),init_timeout=60,timeout=180,
                environment={'REA_GHIDRA_DISABLED_ANALYZERS':disabled},open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(a)))])
            (work/(role+'-plan.json')).write_text(dump(plan))
        print(work.relative_to(ROOT));return
    target,raw,span,records,expected=recover();cases,md=native_cases(raw,records)
    source=SOURCE.read_text();assert source.split('// BEGIN NATIVE ACTIONS\n')[1].split('// END NATIVE ACTIONS')[0]==expected
    for token in ['port.raid_hold_facing(', 'row.cone = Some(', 'row.knockback = speed;', 'row.follow = true;', 'if now < self.0[index].at', 'windup + context.now', 'CastTarget::Ground(visual.position)']:
        assert token in source,token
    ranges=[];output=STAGE if args.write else KEPT
    if args.write:output.mkdir(parents=True,exist_ok=True)
    for role,(a,b) in RANGES.items():
        payload=raw(a,b-a);ins=list(md.disasm(payload,a));assert sum(i.size for i in ins)==len(payload)
        asm=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        assembly=SHARED_ASSEMBLY.get(role,role+'.asm')
        path=(KEPT/assembly) if role in SHARED_ASSEMBLY else output/assembly
        if args.write and role not in SHARED_ASSEMBLY:path.write_text(asm)
        else:assert path.read_text()==asm,path
        ranges.append(dict(role=role,**span(a,b-a),end_exclusive=hex(b),assembly=assembly))
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,ranges=ranges,
        records=records,native_cases=cases,limits=['Raw branch imports omit global xrefs, tables and native callees.','External hold/create/cast/math calls are explicit synthetic seams; no reference process runs.','Source checks do not compile or execute reconstructed Rust. Gameplay and parity remain unverified.'])
    path=output/'manifest.json'
    if args.write:path.write_text(dump(manifest))
    else:assert path.read_text()==dump(manifest),path
    if not args.write:
        provenance=json.loads((output/'rea-provenance.json').read_text());assert provenance['target_sha256']==SHA
        for row in provenance['records']:
            assert hashlib.sha256((output/row['pseudocode']).read_bytes()).hexdigest()==row['pseudocode_sha256']
    print(f'0.109.0 cone/knockback: {len(records)} records, {cases} bounded producer cases; source/ranges checked')

if __name__=='__main__':main()
