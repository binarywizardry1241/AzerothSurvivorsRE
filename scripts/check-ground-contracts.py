#!/usr/bin/env python3
"""Revalidate #1 primary-cache and movement publication against installed 0.113.2.

Executes isolated native instructions with explicit seams, never Rust or a game.
Default checks canonical byte/result commitments; --stage writes ignored output.
Ghidra provenance and the remaining shared-client contract are in the owning report.
"""
from portable_paths import portable_json, portable_record
import sys,struct,math,json,importlib.util
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
sys.path.append(str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'))
from coverage_common import latest_target,target_bytes
import argparse,hashlib
from mob_movement_fixtures import fixtures

def check_indoor_surface(evidence, stage=False):
    """Replay the current separate indoor grids; no compiler or world execution."""
    from native_terminal import NativeReplay, verified_input, require
    from discovery_native_subject import verify_native_query_subject
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    import random
    manifest, target, data, pe = verified_input(evidence)
    for query in manifest['queries']:
        receipt = query['result']; raw = (ROOT/receipt['path']).read_bytes()
        require(hashlib.sha256(raw).hexdigest() == receipt['sha256'], 'Native result changed')
        result = json.loads(raw)
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, target, image=data, pe=pe)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoded = 0
    for row in manifest['ranges']:
        a,b = int(row['start'],16),int(row['end_exclusive'],16)
        offset = pe.rva_offset(a-pe.image_base); raw = data[offset:offset+b-a]
        instructions = list(decoder.disasm(raw,a))
        require(instructions[-1].address+instructions[-1].size == b, 'Incomplete retained decode')
        if 'assembly' in row:
            text = ''.join(f'{i.address:x}: {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
            require((evidence/row['assembly']).read_text() == text, 'Retained assembly differs')
        decoded += len(instructions)
    replay = NativeReplay(data, pe); u,r = replay.machine,replay.registers
    bits = lambda value: struct.unpack('<I',struct.pack('<f',value))[0]
    f32 = lambda value: struct.unpack('<f',struct.pack('<f',value))[0]
    threshold = struct.unpack('<f',replay.raw(0x146272370,4))[0]
    require(bits(threshold) == 0x3fcccccd, 'Indoor step limit differs')
    corpus = [(0,[]),(1,[0.]),(1,[math.nan]),(2,[0.,threshold,f32(threshold+2**-23),math.nan]),
              (2,[10.,11.,11.5,math.nan]),(2,[0.,4.,math.nan,1.]),
              (3,[1.5,1.,.5]*3),(3,[math.nan]*4+[10.]+[math.nan]*4)]
    rng = random.Random(127)
    for side in (2,3,4):
        for _ in range(16):
            corpus.append((side,[rng.choice([math.nan,0.,.5,1.,1.5,threshold,2.,3.,10.]) for _ in range(side*side)]))
    rows=[]
    for side,heights in corpus:
        replay.reset('indoor-surface',[(0x145ba2c8e,0x145ba2e55)],{0x145ba2e55})
        base,out = replay.mem+0x1000,replay.mem+0x2000
        raw = struct.pack('<'+'f'*len(heights),*heights)
        u.mem_write(base,raw); u.mem_write(out,raw)
        replay.put(replay.bp+0x1b0,'<Q',side)
        replay.put(replay.bp+0x1a8,'<Q',base)
        replay.put(replay.bp+0x1a0,'<Q',out)
        replay.put(replay.bp+0x170,'<Q',len(heights))
        u.reg_write(r.UC_X86_REG_RSI,len(heights));u.reg_write(r.UC_X86_REG_RDI,base)
        replay.scalar(r.UC_X86_REG_XMM6,threshold)
        replay.run(0x145ba2c8e)
        expected=list(heights)
        for y in range(side):
            for x in range(side):
                i=y*side+x; original=heights[i]
                if math.isnan(original): continue
                for ny in range(max(0,y-1),min(side,y+2)):
                    for nx in range(max(0,x-1),min(side,x+2)):
                        height=heights[ny*side+nx]
                        if f32(height-original)<=threshold and height>expected[i]: expected[i]=height
        actual=bytes(u.mem_read(out,len(raw)))
        require(actual == struct.pack('<'+'f'*len(expected),*expected), 'Indoor surface differs')
        require(bytes(u.mem_read(base,len(raw))) == raw, 'Connected floor was modified')
        rows.append(dict(side=side,input=[bits(v) for v in heights],output=[bits(v) for v in expected]))
    primary=[]
    for mode in ('flat','indoor','raised','plain'):
        for adt in (None,10.,30.):
            for x in (-1.,0.,.25,.75,1.,math.nan,math.inf,-math.inf):
                for y in (-1.,0.,.25,.75,1.,math.nan):
                    replay.reset('primary-height',[(0x145b9e1e0,0x145b9e4ae)],{replay.done})
                    m=replay.mem+0x4000
                    replay.put(m+0x58,'<Q',0xffffffffffffffff);replay.put(m+0x98,'<Q',0xffffffffffffffff)
                    if mode=='flat': replay.put(m+0xc0,'<fB',99.,1)
                    if mode=='indoor':
                        replay.put(m+0x58,'<7Q2f',4,m+0x1000,4,4,m+0x2000,4,2,0.,0.)
                        replay.put(m+0x1000,'<4f',101.,102.,103.,104.)
                        replay.put(m+0x2000,'<4f',11.,12.,21.,math.nan)
                    if mode=='raised':
                        replay.put(m+0x98,'<4Q2f',4,m+0x2000,4,2,0.,0.)
                        replay.put(m+0x2000,'<4f',11.,12.,21.,math.nan)
                    calls=[]
                    def seam(address):
                        if address != 0x145b9a340: return False
                        calls.append(address);u.reg_write(r.UC_X86_REG_RAX,int(adt is not None))
                        replay.scalar(r.UC_X86_REG_XMM0,adt or 0.);replay.return_seam();return True
                    replay.seam=seam
                    u.reg_write(r.UC_X86_REG_RCX,m)
                    replay.scalar(r.UC_X86_REG_XMM1,x);replay.scalar(r.UC_X86_REG_XMM2,y)
                    replay.run(0x145b9e1e0)
                    found=bool(u.reg_read(r.UC_X86_REG_RAX)&1)
                    value=struct.unpack('<f',u.reg_read(r.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0] if found else None
                    px,py=x*2,y*2;inside=not(px<0 or py<0 or px>=2 or py>=2)
                    cell=(0 if math.isnan(py) else int(py))*2+(0 if math.isnan(px) else int(px)) if inside else None
                    height=[11.,12.,21.,None][cell] if inside else None
                    expected=99. if mode=='flat' else height if mode=='indoor' else adt if mode=='plain' or adt is None else max(adt,height) if height is not None else adt
                    require(value==expected and len(calls)==int(mode in ('raised','plain')), 'Primary grid/precedence differs')
                    primary.append(dict(mode=mode,adt=adt,x=bits(x),y=bits(y),height=value))
    source=(ROOT/'crates/azeroth-survivors-re/src/floor_recovery/cache.rs').read_text()
    for guard in ['let surface_heights = raised_indoor_surface(side, &heights);','return indoor.surface_height(xy);',
                  'if height - original <= 1.6 && height > surface[cell]', 'let height = heights[nearby_row * side + nearby_col];']:
        require(guard in source,'Indoor source connection differs: '+guard)
    map_source=(ROOT/'crates/azeroth-survivors-re/src/floor_recovery/map.rs').read_text()
    require('map_or_else(|| result.adt(xy), |cache| cache.height(xy))' in map_source,'Occupancy stopped reading original floor')
    require('self.primary.indoor.as_ref()?.grid().minimum(xy)' in map_source,'Recovery stopped reading original floor')
    world_source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/world.rs').read_text()
    require('return native.height([x, y]);' in world_source,'Spawns stopped reading primary floor')
    visuals=(ROOT/'crates/azeroth-survivors-re/src/gameplay/visuals.rs').read_text()
    for guard in ['floor.terrain_ref()?.height(xy)', 'from[2] = height([from[0], from[1]]).unwrap_or(from[2])',
                  'to[2] = height([to[0], to[1]]).unwrap_or(to[2])']:
        require(guard in visuals,'Live actor path stopped reading primary floor')
    digest=lambda value:hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':')).encode()).hexdigest()
    result=dict(surface_cases=len(rows),surface_results_sha256=digest(rows),primary_cases=len(primary),
                primary_results_sha256=digest(primary),independently_decoded_instructions=decoded)
    if stage:
        print(json.dumps(result,sort_keys=True))
    else:
        require(result==manifest['validation'],'Current replay result differs from retained commitment')
    print(f"0.127.0 indoor ground: {len(rows)} surface + {len(primary)} primary native cases pass; source guards pass. No compilation/world/game/parity.")

ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true')
ap.add_argument('--evidence',type=Path,help='Check a retained current indoor-surface contract instead of historical 0.113.2')
args=ap.parse_args()
if args.evidence:
    evidence=(ROOT/args.evidence).resolve()
    if not evidence.is_relative_to(ROOT): ap.error('evidence must stay in this checkout')
    check_indoor_surface(evidence,args.stage)
    raise SystemExit(0)
SHA='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
assert latest_target(verify=True)['sha256']==SHA
KEPT=ROOT/'docs/analysis/evidence/0.113.2/ground-contracts'
STAGE=ROOT/'runtime/movement-0.113.2/staged'
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
s=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);d=target_bytes(latest_target());p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(v['rva']+max(v['virtual_size'],v['raw_size'])for v in p.sections);u.mem_map(p.image_base,(size+4095)&~4095)
for v in p.sections:u.mem_write(p.image_base+v['rva'],d[v['raw_offset']:v['raw_offset']+v['raw_size']])
M,S,END=0x200000000,0x300000000,0x400000000;u.mem_map(M,0x10000);u.mem_map(S,0x10000);u.mem_map(END,4096)
put=lambda a,f,*v:u.mem_write(a,struct.pack('<'+f,*v))
get=lambda a,f:struct.unpack('<'+f,u.mem_read(a,struct.calcsize('<'+f)))
bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
context={}
def hook(_,a,n,data):
 if a==END:u.emu_stop();return
 if 0x1458a67e0<=a<0x1458a6aa5:return
 if a==0x1458a2b90:
  context['adt_calls']+=1;u.reg_write(r.UC_X86_REG_RAX,int(context['adt']is not None));u.reg_write(r.UC_X86_REG_XMM0,bits(context['adt']or 0.));sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8);return
 raise AssertionError(hex(a))
u.hook_add(UC_HOOK_CODE,hook)
rows=[]
for mode in ('flat','indoor','raised','plain'):
 for adt in (None,10.,30.):
  for x in (-1.,0.,.25,.75,1.,float('nan'),float('inf'),-float('inf')):
   for y in (-1.,0.,.25,.75,1.,float('nan')):
    u.mem_write(M,bytes(0x10000));u.mem_write(S,bytes(0x10000));put(M+0x58,'Q',0xffffffffffffffff);put(M+0x80,'Q',0xffffffffffffffff)
    context.update(adt=adt,adt_calls=0)
    if mode=='flat':put(M+0xa8,'fB',99.,1)
    if mode in ('indoor','raised'):
     off=0x58 if mode=='indoor'else 0x80;put(M+off,'4Q2f',4,M+0x1000,4,2,0.,0.);put(M+0x1000,'4f',11.,12.,21.,float('nan'))
    put(S+0x8008,'Q',END);u.reg_write(r.UC_X86_REG_RSP,S+0x8008);u.reg_write(r.UC_X86_REG_RCX,M);u.reg_write(r.UC_X86_REG_XMM1,bits(x));u.reg_write(r.UC_X86_REG_XMM2,bits(y));u.emu_start(0x1458a67e0,END,count=1000)
    assert u.reg_read(r.UC_X86_REG_RIP)==END
    found=bool(u.reg_read(r.UC_X86_REG_RAX)&1);value=struct.unpack('<f',u.reg_read(r.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]if found else None
    px,py=x*2,y*2;inside=not(px<0 or py<0 or px>=2 or py>=2)
    cell=(0 if math.isnan(py)else int(py))*2+(0 if math.isnan(px)else int(px))if inside else None
    height=[11.,12.,21.,None][cell]if inside else None
    expected=99. if mode=='flat'else height if mode=='indoor'else adt if mode=='plain'or adt is None else max(adt,height)if height is not None else adt
    assert value==expected,(mode,adt,x,y,value,expected)
    assert context['adt_calls']==int(mode in ('raised','plain'))
    rows.append(dict(mode=mode,adt=adt,x_bits=bits(x),y_bits=bits(y),height=value,adt_calls=context['adt_calls']))
profile=dict(dispatch=(0x145949ab2,0x145949c02),packet=(0x1458cb3d0,0x1458cb66d),stop_after_move=0x145949ba3,height_query=0x1458a67e0,facing_packet=0x1458caf10,facing_packet_end=0x1458cb20e,guid_writer=0x1458b6e10,point_writer=0x1458a28f0,buffer_grow=0x145cf9da0,upper_bound=0x145ed69d4,terrain_offset=0xab8,serial_offset=0xb9c,target_offset=0x468)
def prepare(u,r,mem,stack,frame,bits,upper):
 u.mem_write(frame+0x398,struct.pack('<Q',mem))
 for reg,v in [(r.UC_X86_REG_R15,mem+0x5000),(r.UC_X86_REG_R13,frame+0x30),(r.UC_X86_REG_XMM9,upper),(r.UC_X86_REG_XMM10,0),(r.UC_X86_REG_XMM11,struct.unpack('<I',struct.pack('<f',1000.))[0])]:u.reg_write(reg,v)
movement=fixtures(p,d,profile,execute_facing=True,prepare=prepare)

def compact(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),allow_nan=False).encode()
source=(ROOT/'crates/azeroth-survivors-re/src/floor_recovery/cache.rs').read_text()
assert 'if x < 0.0 || y < 0.0 || x >= self.side as f32 || y >= self.side as f32' in source
visuals=(ROOT/'crates/azeroth-survivors-re/src/gameplay/visuals.rs').read_text()
assert 'floor.terrain_ref()?.height(xy)' in visuals
assert 'from[2] = height([from[0], from[1]]).unwrap_or(from[2])' in visuals
assert 'to[2] = height([to[0], to[1]]).unwrap_or(to[2])' in visuals
ranges=[]
for role,a,b in [('dispatch',*profile['dispatch']),('travel',*profile['packet']),('facing',profile['facing_packet'],profile['facing_packet_end']),('primary-height',0x1458a67e0,0x1458a6aa5),('actor',0x145945cf0,0x14594b72d),('terrain-constructor',0x1458a3640,0x1458a56d9)]:
    offset=p.rva_offset(a-p.image_base)
    raw=d[offset:offset+b-a]
    ranges.append(dict(role=role,va=hex(a),byte_count=b-a,file_offset=hex(offset),sha256=hashlib.sha256(raw).hexdigest()))
# Current AS zone inputs are read at their independently discovered table,
# rather than assuming the historical asset's version proves current values.
zone_table = 0x146fdcd48
zones = []
def raw(address, count):
    offset=p.rva_offset(address-p.image_base)
    return d[offset:offset+count]
for index,key in enumerate(('elwynn','duskwood','wsg','ungoro','ab','feralas','arena','sm','av','brm','aq','naxx')):
    payload=raw(zone_table+index*240,240)
    pointer,count=struct.unpack_from('<QQ',payload,8)
    assert raw(pointer,count).decode()==key
    polygon=[]
    if key in ('wsg','sm'):
        pointer,count=struct.unpack_from('<QQ',payload,88)
        assert count<100
        polygon=[list(struct.unpack_from('<ff',raw(pointer,count*8),j*8))for j in range(count)]
    zones.append(dict(key=key,center=list(struct.unpack_from('<ff',payload,200)),radius=struct.unpack_from('<f',payload,216)[0],indoor=bool(payload[236]),polygon=polygon))
assert portable_record(zones)==portable_record(json.loads((ROOT/'crates/azeroth-survivors-re/assets/native-floor-zones-0.110.0.json').read_text()))
zone_contract=dict(va=hex(zone_table),stride=240,count=len(zones),sha256=hashlib.sha256(raw(zone_table,240*len(zones))).hexdigest(),values_sha256=hashlib.sha256(compact(zones)).hexdigest(),source_values_match=True)
record=dict(target_sha256=SHA,zone_contract=zone_contract,ranges=ranges,primary_cases=len(rows),primary_results_sha256=hashlib.sha256(compact(rows)).hexdigest(),movement_cases=len(movement),movement_results_sha256=hashlib.sha256(compact(movement)).hexdigest(),source_connection='NativeFloor -> unit_path -> existing LocalUnitPath/client ground owner',limits=['Native primary-query replay supplies immutable 2x2 synthetic grids and an ADT return seam. No geometry or MPQ execution.','Movement replay executes current caller and serializers; allocator, buffer growth, packed GUID/vector writes and supplied endpoint heights are explicit seams.','Source guards do not execute Rust. Native constructor/actor identity alone does not prove full behavior, rendering or runtime parity.'])
if args.stage:
    STAGE.mkdir(parents=True,exist_ok=True)
    (STAGE/'manifest.json').write_text(portable_json(record,indent=2)+'\n')
else:
    assert portable_record(record)==portable_record(json.loads((KEPT/'manifest.json').read_text())), 'Current byte/result/source contract differs from reviewed proof'
print(f"0.113.2 ground contracts: {len(rows)} primary + {len(movement)} movement native cases pass; source guards pass. No compilation/game/parity.")
