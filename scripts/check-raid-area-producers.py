#!/usr/bin/env python3
"""Hash-bound native hazard creation/gates; no compiler or game is invoked."""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b'
OUT = ROOT / 'docs/analysis/evidence/0.108.0/raid-area-producers'
RANGES = {
    'create': (0x1459508f0, 0x145950af7),
    'follow': (0x145948715, 0x145948a53),
    'publish_gate': (0x145949366, 0x145949444),
    'circle_gate': (0x1459496c9, 0x145949746),
    'damage': (0x14594984a, 0x145949895),
    'optional_visual': (0x14594a0f5, 0x14594a118),
    'emit_circle': (0x14594b39b, 0x14594b5f9),
    'emit_times': (0x14594b83c, 0x14594b99c),
    'emit_end': (0x14594bcf3, 0x14594bdad),
    'emit_clock': (0x14594be47, 0x14594c000),
}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    assert target['sha256'] == SHA, 'Recover changed target before reusing these addresses'
    data = target_bytes(target)  # Rechecks the complete installed input hash.
    mod = load_script('raid_area_pe', ROOT / 'scripts/inventory-executable.py')
    pe = mod.PE(data)
    raw = lambda a, n: data[pe.rva_offset(a-pe.image_base):pe.rva_offset(a-pe.image_base)+n]
    bounds = {pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    assert bounds[0x1459508f0] == 0x145950af7 and bounds[0x145947920] == 0x14594cf62
    sys.path[:0] = [str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),
                    str(ROOT/'runtime/armory-recovery/python-libs')]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    records=[]
    OUT.mkdir(parents=True, exist_ok=True)
    for name,(a,b) in RANGES.items():
        v=raw(a,b-a); ins=list(md.disasm(v,a)); assert sum(i.size for i in ins)==len(v), (name,hex(ins[-1].address),hex(a+sum(i.size for i in ins)),hex(b))
        assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        row=dict(role=name,va=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),
                 byte_count=len(v),sha256=hashlib.sha256(v).hexdigest(),assembly=name+'.asm')
        if args.write: (OUT/row['assembly']).write_text(assembly)
        else: assert (OUT/row['assembly']).read_text()==assembly
        records.append(row)
    uc=Uc(UC_ARCH_X86,UC_MODE_64); mapped=set()
    def demand(machine,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:
            uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    mem=0x200000000;uc.mem_map(mem,0x100000)
    put=lambda a,f,*v: uc.mem_write(a,struct.pack('<'+f,*v))
    get=lambda a,f:struct.unpack('<'+f,uc.mem_read(a,struct.calcsize('<'+f)))
    f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
    sx=lambda reg,v:uc.reg_write(reg,int.from_bytes(struct.pack('<f',v),'little'))
    xf=lambda reg:struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    stop=mem+0xf0000
    def hook(machine,a,size,user):
        if a==0x1458d0220:
            sx(r.UC_X86_REG_XMM0,4.5);uc.reg_write(r.UC_X86_REG_RAX,1)
            rsp=uc.reg_read(r.UC_X86_REG_RSP);uc.reg_write(r.UC_X86_REG_RIP,get(rsp,'Q')[0]);uc.reg_write(r.UC_X86_REG_RSP,rsp+8)
    uc.hook_add(UC_HOOK_CODE,hook)
    cases=0
    # Execute the entire original creation function with actual Win64 stack
    # slots; terrain returns one explicit height and capacity avoids allocation.
    for counter in (0,0xffffffff):
      for now in (0.,120.):
       for delay in (0.,1.3,1.5,5.):
        for radius in (0.,9.):
            game=mem+0x10000;shape=mem+0x12000;kind=mem+0x13000;rows=mem+0x20000;rsp=mem+0x80000
            uc.mem_write(game,bytes(0xb00));uc.mem_write(rows,bytes(128))
            put(game+0xa38,'I',counter);put(game+0xa34,'f',now);put(game+0x998,'Q',mem+0x30000)
            put(game+0x588,'QQQ',4,rows,0);put(shape,'Iff',0,radius,0.);put(kind,'4I',0,0,0,0)
            put(rsp,'Q',stop);put(rsp+0x28,'f',2.);put(rsp+0x30,'f',0.);put(rsp+0x38,'f',delay)
            put(rsp+0x40,'I',8122);put(rsp+0x48,'f',160.);put(rsp+0x50,'Q',kind)
            for reg,value in [(r.UC_X86_REG_RSP,rsp),(r.UC_X86_REG_RCX,game),(r.UC_X86_REG_RDX,99),(r.UC_X86_REG_R8,shape)]:uc.reg_write(reg,value)
            sx(r.UC_X86_REG_XMM3,1.)
            uc.emu_start(0x1459508f0,stop,count=1000)
            assert get(game+0xa38,'I')[0]==(counter+1)&0xffffffff
            assert get(game+0x598,'Q')[0]==1 and get(rows+0x3c,'I')[0]==(counter+1)&0xffffffff
            assert get(rows+0x20,'Q')[0]==99 and get(rows,'Q')[0]==0
            assert get(rows+0x30,'If')[0:2]==(0,radius)
            assert get(rows+0x40,'3f')==(1.,2.,4.5)
            assert get(rows+0x50,'2f')==(now,f32(now+f32(delay)))
            assert get(rows+0x64,'f')[0]==float('inf') and get(rows+0x7c,'3B')==(0,0,0)
            cases+=1
    # Original no-call publication and circle-membership branch boundaries.
    row=mem+0x40000
    for now in (-1.,0.,1.3,float('nan')):
      for end in (0.,1.3,120.):
       for warning in (0.,1.6,float('inf')):
        uc.mem_write(row,bytes(128));put(row+0x54,'f',end);put(row+0x64,'f',warning)
        uc.reg_write(r.UC_X86_REG_R13,row);uc.reg_write(r.UC_X86_REG_RBP,mem+0x50000);put(mem+0x50234,'f',now)
        uc.emu_start(0x145949373,0x145949395,count=7)
        # JB includes unordered; native does not publish for NaN clocks.
        admitted=not(math.isnan(now) or now<f32(f32(end)-f32(warning)))
        assert bool(get(row+0x7e,'B')[0])==admitted
        cases+=1
    for radius in (0.,5.,float('nan')):
      for distance in (0.,4.999,5.,5.001,float('nan')):
        sx(r.UC_X86_REG_XMM8,radius);sx(r.UC_X86_REG_XMM0,distance)
        uc.emu_start(0x14594972b,0x145949732,count=2)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&255)==(f32(radius)>=f32(distance))
        cases+=1
    # Source tracing guards are separate from execution of native instructions.
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
    for token in ('self.next_id.wrapping_add(1)','port.raid_block','port.raid_hold','port.raid_cast',
                  'port.raid_source(row.source)','ended.into_iter().rev()', 'total += row.damage',
                  'port.damage_player(total, last_source)', '"hzt"', '"hzend"'):
        assert token in source,token
    assert 'cast_spell(' not in source and 'create_ground_object(' not in source
    manifest=dict(target_sha256=SHA,target_version=target['version'],ranges=records,
        static_cases=cases,limitations=['Synthetic terrain height; preallocated native vector, no real terrain or allocator.',
        'Native instruction execution and textual source tracing do not execute Rust or establish compile/runtime/rendering parity.'])
    serialized=json.dumps(manifest,indent=2)+'\n'
    if args.write:(OUT/'manifest.json').write_text(serialized)
    else:assert json.loads((OUT/'manifest.json').read_text())==manifest
    print(f'Raid area producer contracts: {cases} bounded native cases; selected source tracing passed.')
if __name__=='__main__':main()
