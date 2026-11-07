#!/usr/bin/env python3
"""Hash-bound native28 pool producer, activation, periodic and marker checks.

No compilation or game process. --write stages textual evidence in runtime.
Native cast/localization/heap/terrain calls are explicit fixture seams.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
OUT = ROOT / 'docs/analysis/evidence/raid-pools'
STAGE = ROOT / 'runtime/analysis/staging/native-evidence/raid-pools'

def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)

def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Recover the changed target before using addresses'
    data = target_bytes(target)
    module = load_script('pools_pe', ROOT/'scripts/inventory-executable.py')
    pe = module.PE(data)
    def raw(a, n):
        offset = pe.rva_offset(a-pe.image_base)
        value = data[offset:offset+n]; assert len(value) == n
        return value
    def span(a, n): return dict(va=hex(a), file_offset=hex(pe.rva_offset(a-pe.image_base)),
        byte_count=n, sha256=hashlib.sha256(raw(a,n)).hexdigest())
    rows = []
    for zi in range(12):
        pointer, count = struct.unpack('<QQ', raw(0x146bde390+240*zi+0x88,16))
        for bi in range(count):
            boss = pointer+104*bi
            moves, count = struct.unpack('<QQ', raw(boss+16,16))
            boss_id = struct.unpack('<I', raw(boss+64,4))[0]
            for slot in range(count):
                at = moves+56*slot; value = raw(at,56)
                if value[45] != 28: continue
                w = list(struct.unpack('<14I',value))
                rows.append(dict(boss_id=boss_id,native_slot=slot,native_tag=28,
                    words=w[:5],repeat_bits=w[12],record=span(at,56)))
    catalog = json.loads((ROOT/'docs/analysis/evidence/guardian-signatures/catalog.json').read_text())
    assert catalog['target_sha256'] == SHA
    for row in catalog['rows']:
        for phase in row['phases']:
            if phase['tag'] != 28: continue
            at = int(phase['record']['va'],16)
            assert span(at,72)['sha256'] == phase['record']['sha256']
            rows.append(dict(guardian_id=row['enemy_id'],phase_index=phase['index'],native_tag=28,
                words=phase['words'][4:9],repeat_bits=0,
                canonical_record=f'docs/analysis/evidence/guardian-signatures/catalog.json#/rows/{catalog["rows"].index(row)}/phases/{phase["index"]}/record'))
    assert len(rows) == 3 and rows[0]['boss_id'] == 394
    assert [row['guardian_id'] for row in rows[1:]] == [111,1011]
    return target, raw, span, rows

def main():
    ap = argparse.ArgumentParser(description=__doc__); ap.add_argument('--write',action='store_true')
    args = ap.parse_args()
    target, raw, span, rows = recover()
    sys.path[:0] = [str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md = Cs(CS_ARCH_X86,CS_MODE_64)
    uc = Uc(UC_ARCH_X86,UC_MODE_64)
    mem=0x70000000; uc.mem_map(mem,0x100000); mapped=set()
    def demand(machine, access, a, size, value, user):
        page=a&~4095
        if page not in mapped:
            uc.mem_map(page,4096); uc.mem_write(page,raw(page,4096)); mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    def put(a,fmt,*v): uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt): return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v): uc.reg_write(reg,bits(v))
    def xf(reg): return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    game,record,frame,stack,row=mem,mem+0x10000,mem+0x20000,mem+0x40008,mem+0x60000
    stops=set(); casts=[]
    def hook(machine,a,size,user):
        if a in stops: uc.emu_stop(); return
        if a == 0x1459577f0:
            casts.append((uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
            sp=uc.reg_read(r.UC_X86_REG_RSP); ret=get(sp,'Q')[0]
            uc.reg_write(r.UC_X86_REG_RSP,sp+8); uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(a,endpoints):
        nonlocal stops
        stops=set(endpoints);uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP) in stops
    cases=0
    for item in rows:
      spell,inner_bits,windup_bits,lifetime_bits,factor_bits=item['words']
      inner,windup,lifetime,factor=[struct.unpack('<f',struct.pack('<I',w))[0] for w in item['words'][1:]]
      for now in [0.,10.,12345.125]:
       for damage in [0.,17.,1000.25]:
        casts.clear();put(record,'5I',*item['words'])
        for reg,value in [(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack)]:uc.reg_write(reg,value)
        put(frame+0x180,'Q',99);sx(r.UC_X86_REG_XMM14,damage);sx(r.UC_X86_REG_XMM15,now)
        run(0x145958d26,[0x145958deb])
        assert casts==[(spell,windup)]
        assert get(frame+0x160,'I2f')==(1,inner,f32(inner+40.))
        assert get(frame+0x110,'If2f')==(3,f32(f32(now+windup)+lifetime),.5,0.)
        assert bits(xf(r.UC_X86_REG_XMM14))==bits(f32(damage*factor))
        assert get(stack+0x30,'f')[0]==windup and get(stack+0x38,'I')[0]==spell
        cases+=1
    # Activation initializes the periodic deadline at the actual activation tick.
    for now in [0.,10.,12345.125]:
        put(row+0x70,'f',0.);put(row+0x7c,'3B',0,0,1);put(frame+0x234,'f',now)
        uc.reg_write(r.UC_X86_REG_R13,row);uc.reg_write(r.UC_X86_REG_RBP,frame)
        run(0x14595072e,[0x145950754])
        assert get(row+0x7d,'B')[0]==1 and get(row+0x68,'f')[0]==now
        cases+=1
    periodic_cases=0
    # No catch-up loop: one deadline advance per owner update, even outside shape.
    for expires in [11.,20.]:
     for next_tick in [10.,10.5,15.]:
      for now in [9.999,10.,10.5,11.,15.,20.]:
        now=f32(now);put(row+0x14,'f',expires);put(row+0x18,'f',.5);put(row+0x68,'f',next_tick)
        put(frame+0x234,'f',now);uc.reg_write(r.UC_X86_REG_R13,row);uc.reg_write(r.UC_X86_REG_RBP,frame)
        run(0x145951438,[0x1459515f9,0x14594f405,0x145951466])
        expected=0x1459515f9 if now>=expires else (0x14594f405 if now<next_tick else 0x145951466)
        assert uc.reg_read(r.UC_X86_REG_RIP)==expected
        assert get(row+0x68,'f')[0]==(f32(next_tick+.5) if expected==0x145951466 else next_tick)
        periodic_cases+=1
    marker_cases=0
    for active in [0,1]:
        put(row+0x7d,'B',active);uc.reg_write(r.UC_X86_REG_R12,row)
        run(0x1459526a0,[0x145952198])
        pointer=uc.reg_read(r.UC_X86_REG_RCX);size=uc.reg_read(r.UC_X86_REG_RAX)
        assert raw(pointer,size).decode()==('pool' if active else 'danger')
        marker_cases+=1
    # Generic native action-block duration is the third payload word (windup).
    for item in rows:
        put(record,'5I',*item['words']);put(record+45,'B',28);put(stack,'Q',mem+0xff000)
        uc.reg_write(r.UC_X86_REG_RCX,record);uc.reg_write(r.UC_X86_REG_RSP,stack)
        run(0x14588be10,[mem+0xff000])
        assert bits(xf(r.UC_X86_REG_XMM0))==item['words'][2]
        cases+=1
    ranges=[('producer',0x145958d26,0x145958df0),('activation',0x14595072e,0x145950754),
        ('periodic-deadlines',0x145951438,0x145951466),('pool-tick-hit',0x14595190a,0x145951936),
        ('marker-kind',0x1459526a0,0x1459526bd),('marker-lifetime',0x14595268c,0x1459526a0)]
    evidence=[]
    for role,a,b in ranges:
        value=raw(a,b-a); instructions=list(md.disasm(value,a));assert sum(i.size for i in instructions)==len(value)
        assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
        evidence.append((role,assembly,dict(role=role,**span(a,b-a),assembly=role+'.asm')))
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_pools.rs').read_text()
    for token in ['inner + 40.', 'expires: (context.now + windup) + lifetime','row.inner_radius = Some(inner)',
                  'port.raid_cast(context.source_guid, w[1], windup)', 'RaidWarning::BurningGround']:
        assert token in source,token
    shared=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
    for token in ['pool.next_tick = now','pool.next_tick += 0.5','now >= pool.expires','"pool"','row.contains(player)']:
        assert token in shared,token
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,records=rows,
        ranges=[r for _,_,r in evidence],native_producer_activation_duration_cases=cases,
        native_periodic_cases=periodic_cases,native_marker_cases=marker_cases,
        rea_evidence='ev_a993fbe2198c91f4176eef7f72f9b57408ceafcc3ae704cb2c59ab21d13f0f9a',
        canonical_shared_evidence=['docs/analysis/evidence/0.109.0/raid-lines/manifest.json',
            'docs/analysis/evidence/0.109.0/raid-waves/manifest.json'],
        limitations=['Unicorn executes original instructions with synthetic state and intercepted cast calls; no game or reconstructed Rust executes.',
            'Terrain, shared allocation, localization/warning and engine presentation have separate owners and explicit fixture boundaries.',
            'Compilation, gameplay, rendering and original/rebuilt parity remain unverified.'])
    output=STAGE if args.write else OUT
    if args.write:output.mkdir(parents=True,exist_ok=True)
    for role,assembly,_ in evidence:
        if args.write:(output/(role+'.asm')).write_text(assembly)
        else:assert (output/(role+'.asm')).read_text()==assembly
    text=json.dumps(manifest,indent=2)+'\n'
    if args.write:(output/'manifest.json').write_text(text)
    else:assert (output/'manifest.json').read_text()==text
    print(f'Raid pools:3 native records; {cases+periodic_cases+marker_cases} bounded native cases; no compiler/game')

if __name__=='__main__': main()
