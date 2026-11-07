#!/usr/bin/env python3
"""Replay current ground/navigation instructions; never compile or launch a game.

Historical fixtures supply inputs/expected outputs only. All executed instructions,
field offsets, call seams and owner identities below are independently current.
--write stages compact evidence under runtime for review before promotion.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse
import hashlib
import importlib.util
import json
import math
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA = 'e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048'
KEPT = ROOT/'docs/analysis/evidence/0.110.0/ground-navigation'
STAGE = ROOT/'runtime/analysis/staging/native-evidence/0.110.0/ground-navigation'
OWNERS = {
    'segment': 0x1459a3a00, 'occupancy-finalize': 0x1459a3dd0,
    'occupancy-rasterize': 0x1459a4390, 'footprint': 0x1459a4b70,
    'nearest-open': 0x1459a4f80, 'terrain-base': 0x14589a130,
    'nearby-height': 0x14589a330, 'terrain-constructor': 0x14589abe0,
    'primary-height': 0x14589bf40, 'descent': 0x1459a79b0,
    'field-membership': 0x1459a7b90, 'distance-field': 0x1459a7c90,
    'chase': 0x1459a8280, 'minimum-floor': 0x14589e720,
    'indoor-cache': 0x14589e8b0, 'nearest-floor': 0x1458a0450,
    'placement': 0x1459b1ac0, 'floor-triangle': 0x1458a5ab0,
    'movement-packet': 0x1458bee80, 'facing-packet': 0x1458be9c0,
    'candidate-height': 0x145897ef0, 'occupancy-flood': 0x1459d08c0,
}
SLICES = {'refresh-deadline': (0x145940801, 0x14594081a), 'boundary-polygon': (0x14590a0e3,0x14590a336), 'boundary-circle': (0x14590a6d9,0x14590a859)}


def dump(x): return json.dumps(x, indent=2, ensure_ascii=False, allow_nan=False)+'\n'
def f32(x):
    return _shared_f32(x)
def bits(x):
    return _shared_bits(x)


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target)
    spec=importlib.util.spec_from_file_location('ground_pe',ROOT/'scripts/inventory-executable.py')
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);pe=mod.PE(data)
    bounds={a+pe.image_base:b+pe.image_base for a,b,_ in pe.functions()}
    sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    def raw(a,n):
        o=pe.rva_offset(a-pe.image_base);v=data[o:o+n];assert len(v)==n;return v
    ranges=[];assemblies={}
    intervals={role:(a,bounds[a])for role,a in OWNERS.items()}|SLICES
    for role,(a,b) in intervals.items():
        v=raw(a,b-a);ins=list(md.disasm(v,a));assert ins[-1].address+ins[-1].size==b
        text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins)
        assemblies[role+'.asm']=text
        ranges.append(dict(role=role,va=hex(a),byte_count=b-a,file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(v).hexdigest(),assembly=role+'.asm'))
    assert struct.unpack('<16q',raw(0x147244480,128))==(1,0,-1,0,0,1,0,-1,1,1,1,-1,-1,1,-1,-1)
    u=Uc(UC_ARCH_X86,UC_MODE_64)
    end=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections)
    u.mem_map(pe.image_base,(end+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    mem,stack,stop=0x200000000,0x300000000,0x400000000
    u.mem_map(mem,0x30000);u.mem_map(stack,0x10000);u.mem_map(stop,4096)
    def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):u.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);dest=get(sp,'Q')[0]
        u.reg_write(r.UC_X86_REG_RSP,sp+8);u.reg_write(r.UC_X86_REG_RIP,dest)
    stops={stop};active=[];placement_seam=False;shape_zone=None
    def hook(_,a,size,user):
        if a in stops:u.emu_stop();return
        if any(lo<=a<hi for lo,hi in active):return
        if shape_zone is not None:
            if a==0x145893fc0:u.reg_write(r.UC_X86_REG_RAX,shape_zone);ret();return
            if a==0x145c11230:put(u.reg_read(r.UC_X86_REG_RCX),'2Q',4096,mem+0x20000);ret();return
            if a in (0x145c051e9,0x145c051d7,0x145c051d1):
                v=xf(r.UC_X86_REG_XMM0);v=math.hypot(v,xf(r.UC_X86_REG_XMM1))if a==0x145c051e9 else math.cos(v)if a==0x145c051d7 else math.sin(v)
                sx(r.UC_X86_REG_XMM0,v);ret();return
        if placement_seam and a==OWNERS['placement']:
            put(u.reg_read(r.UC_X86_REG_RCX),'3Q',0,mem+0x11000,3);ret();return
        if a in (0x140002200,0x1400021d0):ret();return
        if a==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,mem+0x15000);ret();return
        if a==0x1404adae0:
            out=u.reg_read(r.UC_X86_REG_RCX);assert get(out+24,'Q')[0]==0
            put(out,'4Q',512,mem+0x17000,0,0);ret();return
        if a==0x145c051a1:
            u.mem_write(u.reg_read(r.UC_X86_REG_RCX),bytes([u.reg_read(r.UC_X86_REG_RDX)&255])*u.reg_read(r.UC_X86_REG_R8));ret();return
        if a in (0x145c051fb,0x145c05219):
            v=xf(r.UC_X86_REG_XMM0);sx(r.UC_X86_REG_XMM0,math.ceil(v)if a==0x145c051fb else math.floor(v));ret();return
        raise AssertionError('Unreviewed native call/flow '+hex(a))
    u.hook_add(UC_HOOK_CODE,hook)
    def call(a):
        put(stack+0x8008,'Q',stop);u.reg_write(r.UC_X86_REG_RSP,stack+0x8008);u.emu_start(a,stop,count=1000000)
        assert u.reg_read(r.UC_X86_REG_RIP)==stop
    def packed(xy):return struct.unpack('<Q',struct.pack('<2f',*xy))[0]
    cases=[];historical=ROOT/'docs/analysis/evidence/0.100.1/floor-recovery'
    active=[intervals[k]for k in ['distance-field','descent','segment','chase']]
    for old in json.loads((historical/'navigation-fixtures.json').read_text())['cases']:
        u.mem_write(mem,bytes(0x30000));side=old['side'];cells=old['cells'];xy=old['player']
        grid,out,field=mem+0x4000,mem+0x6000,mem+0x7000
        put(grid,'4Q2f',len(cells),mem+0x5000,len(cells),side,*old['origin']);u.mem_write(mem+0x5000,bytes(cells))
        u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,grid);sx(r.UC_X86_REG_XMM2,xy[0]);sx(r.UC_X86_REG_XMM3,xy[1]);call(OWNERS['distance-field'])
        dist=list(get(get(out+8,'Q')[0],str(len(cells))+'H'));start,count=get(out+24,'2Q')
        assert (dist,start,count)==(old['distances'],old['start'],old['populated'])
        cases.append(dict(kind='distance-field',start=start,populated=count,distances=dist))
        put(field,'5Q',len(cells),mem+0x15000,len(cells),start,count)
        for q in old['queries']:
            u.reg_write(r.UC_X86_REG_RCX,grid);u.reg_write(r.UC_X86_REG_RDX,packed(q['point']));u.reg_write(r.UC_X86_REG_R8,packed(q['to']));call(OWNERS['segment'])
            fraction=xf(r.UC_X86_REG_XMM0);assert fraction==q['segment_fraction']
            put(mem+0x8000,'2f',*q['point']);put(mem+0x8100,'2f',*q['to']);put(stack+0x8030,'Q',mem+0x8100);put(stack+0x8038,'f',14.)
            u.reg_write(r.UC_X86_REG_RCX,mem+0x8200);u.reg_write(r.UC_X86_REG_RDX,field);u.reg_write(r.UC_X86_REG_R8,grid);u.reg_write(r.UC_X86_REG_R9,mem+0x8000);call(OWNERS['chase'])
            result=list(get(mem+0x8204,'2f'))if get(mem+0x8200,'I')[0]else None
            assert result==q['chase'];cases.append(dict(kind='segment-and-chase',fraction=fraction,chase=result))
    active=[intervals[k]for k in ['minimum-floor','nearest-floor','footprint','nearest-open']]
    for old in json.loads((historical/'grid-fixtures.json').read_text())['cases']:
        op=old['operation'];height=op in ('minimum','nearest');cells=[float('nan')if x is None else x for x in old['cells']]
        grid,values,out=mem+0x4000,mem+0x5000,mem+0x7000;u.mem_write(values,struct.pack('<'+('f'if height else'B')*len(cells),*cells));put(grid,'4Q2f',len(cells),values,len(cells),old['side'],*old['origin']);put(out,'4I',0,0,0,0)
        put(stack+0x8030,'f',old['radius']);u.reg_write(r.UC_X86_REG_RAX,0)
        if op in ('minimum','blocked'):
            u.reg_write(r.UC_X86_REG_RCX,grid);sx(r.UC_X86_REG_XMM1,old['xy'][0]);sx(r.UC_X86_REG_XMM2,old['xy'][1])
        else:
            u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,grid);sx(r.UC_X86_REG_XMM2,old['xy'][0]);sx(r.UC_X86_REG_XMM3,old['xy'][1])
        call(OWNERS[{'minimum':'minimum-floor','nearest':'nearest-floor','blocked':'footprint','open':'nearest-open'}[op]])
        found=u.reg_read(r.UC_X86_REG_RAX)&1
        if op=='minimum':result=xf(r.UC_X86_REG_XMM0)if found else None
        elif op=='blocked':result=bool(found)
        else:result=list(get(out+4,'3f'if op=='nearest'else'2f'))if get(out,'I')[0]else None
        assert result==old['result'],(op,result,old['result']);cases.append(dict(kind=op,result=result))
    active=[intervals['floor-triangle']]
    for old in json.loads((historical/'triangle-fixtures.json').read_text())['cases']:
        out,values,layout,vertices=mem+0x9000,mem+0xa000,mem+0x3000,mem+0x3100
        put(out,'3Q',4096,values,0);put(layout,'2fQ',*old['origin'],old['side'])
        for i,v in enumerate(old['triangle']):put(vertices+i*16,'3f',*v)
        put(stack+0x8030,'Q',vertices+32);put(stack+0x8038,'f',old['maximum'])
        for reg,value in [(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,layout),(r.UC_X86_REG_R8,vertices),(r.UC_X86_REG_R9,vertices+16)]:u.reg_write(reg,value)
        call(OWNERS['floor-triangle']);n=get(out+16,'Q')[0]
        result=[dict(cell=get(values+i*8,'I')[0],height=get(values+i*8+4,'f')[0])for i in range(n)]
        assert result==old['result'];cases.append(dict(kind='floor-triangle',candidates=result))
    active=[intervals['occupancy-rasterize']];placement_seam=True
    for old in json.loads((historical/'occupancy-fixtures.json').read_text())['cases']:
        grid,vertices,indices,mesh,cells,floors=[mem+x for x in [0x10000,0x11000,0x12000,0x13000,0x14000,0x15000]]
        side=old['side'];n=side*side;put(grid,'4Q2f',n,cells,n,side,*old['origin']);u.mem_write(cells,bytes(n));put(floors,str(n)+'f',*old['floor_heights'])
        for i,v in enumerate(old['triangle']):put(vertices+i*12,'3f',*v)
        put(indices,'3I',0,1,2);put(mesh,'6Q',0,vertices,3,0,indices,3);put(stack+0x8030,'f',1.);put(stack+0x8038,'Q',floors);put(stack+0x8040,'Q',n)
        for reg,value in [(r.UC_X86_REG_RCX,grid),(r.UC_X86_REG_RDX,mesh),(r.UC_X86_REG_R8,0),(r.UC_X86_REG_R9,0)]:u.reg_write(reg,value)
        call(OWNERS['occupancy-rasterize']);result=list(u.mem_read(cells,n));assert result==old['cells'];cases.append(dict(kind='occupancy-triangle',cells=result))
    placement_seam=False
    # Exact current constructor index policy, including unordered coordinates.
    active=[intervals['distance-field']]
    for xy in [(float('nan'),1.5),(1.5,float('nan')),(float('nan'),float('nan')),(-.01,0.),(8.,0.),(7.99,7.99)]:
        u.mem_write(mem,bytes(0x30000));grid,out=mem+0x4000,mem+0x6000
        put(grid,'4Q2f',64,mem+0x5000,64,8,0.,0.);u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,grid);sx(r.UC_X86_REG_XMM2,xy[0]);sx(r.UC_X86_REG_XMM3,xy[1]);call(OWNERS['distance-field'])
        valid=get(out,'Q')[0] != 0xffffffffffffffff
        expected=None if any(v<0 or v>=8 for v in xy)else (0 if math.isnan(xy[1])else int(xy[1]))*8+(0 if math.isnan(xy[0])else int(xy[0]))
        assert valid==(expected is not None)
        if valid:assert get(out+24,'Q')[0]==expected
        cases.append(dict(kind='index',xy_bits=[bits(v)for v in xy],start=expected))
    active=[SLICES['refresh-deadline']];stops={0x14594081a,0x145940945}
    for now in [0.,.2,1.,float('nan'),float('inf'),-float('inf')]:
        for previous in [0.,.2,1.,float('nan')]:
            put(mem+0xa64,'f',previous);u.reg_write(r.UC_X86_REG_R15,mem);sx(r.UC_X86_REG_XMM6,now)
            u.emu_start(0x145940801,0,count=20);rebuild=u.reg_read(r.UC_X86_REG_RIP)==0x14594081a
            assert rebuild==(f32(f32(now)-f32(previous))>=f32(.2))
            cases.append(dict(kind='refresh-deadline',now_bits=bits(now),previous_bits=bits(previous),rebuild=rebuild))
    source=(ROOT/'crates/azeroth-survivors-re/src/floor_recovery/navigation.rs').read_text()
    assert 'if x < 0.0 || y < 0.0' in source and '(col < grid.side && row < grid.side)' in source
    assert '!(now - self.navigation_updated_at >= 0.2)'in (ROOT/'crates/azeroth-survivors-re/src/floor_recovery/map.rs').read_text()
    world=(ROOT/'crates/azeroth-survivors-re/src/gameplay/world.rs').read_text()
    assert 'native.navigation.as_ref()?.chase('in world and 'return native.height([x, y])'in world
    zones=[]
    for i in range(12):
        a=0x146bed630+i*240;payload=raw(a,240);p,n=struct.unpack_from('<2Q',payload,8);key=raw(p,n).decode();polygon=[]
        if key in ('wsg','sm'):
            p,n=struct.unpack_from('<2Q',payload,88);polygon=[list(struct.unpack_from('<2f',raw(p,n*8),j*8))for j in range(n)]
        zones.append(dict(key=key,center=list(struct.unpack_from('<2f',payload,200)),radius=struct.unpack_from('<f',payload,216)[0],indoor=bool(payload[236]),polygon=polygon))
    asset=ROOT/'crates/azeroth-survivors-re/assets/native-floor-zones-0.110.0.json'
    if args.write:(STAGE/'zones.json').parent.mkdir(parents=True,exist_ok=True);(STAGE/'zones.json').write_text(dump(zones))
    else:assert zones==json.loads(asset.read_text())
    boundary_shapes=[];active=[(0x145908170,bounds[0x145908170])];stops={0x14590a336,0x14590a33d}
    for i,zone in enumerate(zones):
        shape_zone=i;frame=stack+0x7000;put(frame+0x128,'Q',mem);u.reg_write(r.UC_X86_REG_R13,mem);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,stack+0x5000)
        u.emu_start(0x14590a0e3,0,count=100000);assert u.reg_read(r.UC_X86_REG_RIP)in stops
        _,pointer,n=get(frame+0x130,'3Q');points=[list(get(pointer+j*8,'2f'))for j in range(n)]
        boundary_shapes.append(dict(zone=zone['key'],points=points))
    shape_zone=None
    spec=importlib.util.spec_from_file_location('movement_fixtures',ROOT/'scripts/mob_movement_fixtures.py')
    movement=importlib.util.module_from_spec(spec);spec.loader.exec_module(movement)
    profile=dict(dispatch=(0x145943c92,0x145943de1),packet=intervals['movement-packet'],stop_after_move=0x145943d83,height_query=0x14589bf40,facing_packet=0x1458be9c0,facing_packet_end=bounds[0x1458be9c0],guid_writer=0x1458cb5d0,point_writer=0x1458a9740,buffer_grow=0x145c08230,upper_bound=0x145dd2e40,terrain_offset=0x9b8,serial_offset=0xa84,target_offset=0x470)
    def prepare(machine,reg,memory,stack_address,frame,duration_bits,upper_bits):
        machine.mem_write(frame+0x320,struct.pack('<Q',memory))
        for register,value in [(reg.UC_X86_REG_RDI,memory+0x5000),(reg.UC_X86_REG_R12,frame+0x30),(reg.UC_X86_REG_XMM9,upper_bits),(reg.UC_X86_REG_XMM10,0),(reg.UC_X86_REG_XMM11,bits(1000.))]:machine.reg_write(register,value)
    publication=movement.fixtures(pe,data,profile,execute_facing=True,prepare=prepare)
    cases.extend(dict(kind='movement-publication',**case)for case in publication)
    record=dict(target_sha256=SHA,cases=cases,native_case_count=len(cases),zone_contracts=zones,boundary_shapes=boundary_shapes,target_process_launched=False,compilation='not_run',parity='unverified')
    manifest=dict(target_sha256=SHA,ranges=ranges,neighbor_table=dict(va='0x147244480',byte_count=128,sha256=hashlib.sha256(raw(0x147244480,128)).hexdigest()),native_case_count=len(cases),seams=['Preallocated allocator/queue storage, allocator initialization/free and memset.','Host floorf/ceilf, immutable synthetic grids and caller memory; occupancy triangles are pretransformed through an explicit placement seam.','Current native BFS/descent/segment/chase and four grid query bodies execute; source guards do not execute Rust.','Cache constructors, geometry/MPQ ingestion, actual scheduler/client/GPU and original/rebuilt comparisons are not executed.'])
    if args.write:
        STAGE.mkdir(parents=True,exist_ok=True)
        for name,text in assemblies.items():(STAGE/name).write_text(text)
        (STAGE/'manifest.json').write_text(dump(manifest));(STAGE/'native-cases.json').write_text(dump(record))
    else:
        assert json.loads((KEPT/'manifest.json').read_text())==manifest
        assert json.loads((KEPT/'native-cases.json').read_text())==record
        for name,text in assemblies.items():assert (KEPT/name).read_text()==text,name
    print(f'Current ground/navigation: {len(cases)} native cases; source guards pass; no build/game/parity.')

if __name__=='__main__':main()
