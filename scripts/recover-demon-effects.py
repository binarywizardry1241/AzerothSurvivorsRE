#!/usr/bin/env python3
"""Check bounded special-demon instruction contracts; never compile or launch a game."""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT / 'runtime/demon-effects-01050'
OUT = ROOT / 'runtime/native-evidence/0.105.0/demon-effects'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/demon-effects'
OWNERS = [('demon-hit', 0x14594c4e0, 0x14594cce9),
          ('shard-prune', 0x145995f70, 0x145996047)]


EXTRA_RANGES = [
    ('gate-owner',0x14590410b,0x1459047da,'gate-owner'),
    ('initial-greater',0x145918596,0x1459187ae,'initial-greater'),
    ('cast-admission',0x14592a097,0x14592a33c,None),
    ('cast-summon-gates',0x14592c741,0x14592c7d7,None),
    ('cast-proc-state',0x14592d39d,0x14592d53c,None),
    ('landing-center',0x145927830,0x145927c39,'landing-center'),
    ('landing-density',0x1459ae710,0x1459aeae2,None),
    ('gate-choose',0x1458df010,0x1458df123,None),
    ('shield-cap',0x145904b3a,0x145904b8a,None),
    ('capstone-departure',0x145904e24,0x145904e60,None),
]


def save(path, obj):
    path.write_text(portable_json(obj, indent=2, allow_nan=False) + '\n')


def clean_text(value):
    return '\n'.join(line.rstrip() for line in value.splitlines()).rstrip() + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=['prepare', 'collect', 'check'])
    args = parser.parse_args()
    out = RETAINED if args.mode == 'check' else OUT
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    WORK.mkdir(parents=True, exist_ok=True)
    owners = []
    for role, lo, hi in OWNERS:
        assert any((a + pe.image_base, b + pe.image_base) == (lo, hi)
                   for a, b, _ in pe.functions())
        offset = pe.rva_offset(lo - pe.image_base)
        blob = data[offset:offset + hi - lo]
        row = dict(role=role, address=hex(lo), end_exclusive=hex(hi),
                   file_offset=hex(offset), sha256=hashlib.sha256(blob).hexdigest())
        if args.mode == 'prepare':
            (WORK / f'{role}.bin').write_bytes(blob)
            save(WORK / f'{role}-plan.json', dict(target=str((WORK / f'{role}.bin').relative_to(ROOT)),
                output=f'runtime/demon-effects-01050/rea-{role}', init_timeout=60,
                open_timeout=60, timeout=180,
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(lo)))]))
        elif args.mode == 'collect':
            out.mkdir(parents=True, exist_ok=True)
            assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                f'--start-address={lo:#x}', f'--stop-address={hi:#x}', str(TARGET.relative_to(ROOT))],
                cwd=ROOT, text=True)
            (out / f'{role}.asm').write_text(assembly)
            result = json.loads((WORK / f'rea-{role}/003-procedure_pseudo_code.json').read_text())
            evidence = result['response']['result']['structuredContent']
            assert evidence['subject']['digest']['sha256'] == row['sha256']
            (out / f'{role}.ghidra.c').write_text(clean_text(evidence['normalized_result']))
            row.update(evidence_id=evidence['evidence_id'], provider='Ghidra 12.1.4',
                       assembly=f'{role}.asm', pseudocode=f'{role}.ghidra.c')
            row['text_sha256'] = {name: hashlib.sha256((out / name).read_bytes()).hexdigest()
                                  for name in [row['assembly'], row['pseudocode']]}
        owners.append(row)
    if args.mode == 'prepare':
        for role,lo,hi,analysis in EXTRA_RANGES:
            if not analysis: continue
            offset=pe.rva_offset(lo-pe.image_base)
            (WORK/f'{role}.bin').write_bytes(data[offset:offset+hi-lo])
            save(WORK/f'{role}-plan.json',dict(target=str((WORK/f'{role}.bin').relative_to(ROOT)),
                output=f'runtime/demon-effects-01050/rea-{role}',init_timeout=60,open_timeout=60,timeout=180,
                open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(lo)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(lo)))]))
        return
    if args.mode == 'collect':
        lo, hi = 0x14593dd8c, 0x14593de83
        offset = pe.rva_offset(lo - pe.image_base)
        assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={lo:#x}', f'--stop-address={hi:#x}', str(TARGET.relative_to(ROOT))],
            cwd=ROOT, text=True)
        (out / 'agony-critical.asm').write_text(assembly)
        owners.append(dict(role='agony-critical', address=hex(lo), end_exclusive=hex(hi),
            file_offset=hex(offset), sha256=hashlib.sha256(data[offset:offset + hi - lo]).hexdigest(),
            assembly='agony-critical.asm', text_sha256={'agony-critical.asm': hashlib.sha256(assembly.encode()).hexdigest()},
            owner_manifest='../mob-movement/manifest.json',
            owner_evidence_id='ev_10465e5ad204cc1e24111454175964dfde70431e74a96913303a3f3df61c7d1d'))
        for role,lo,hi,analysis in EXTRA_RANGES:
            offset=pe.rva_offset(lo-pe.image_base)
            assembly=objdump_output(['objdump','-d','--no-show-raw-insn',
                f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
            (out/f'{role}.asm').write_text(assembly)
            row=dict(role=role,address=hex(lo),end_exclusive=hex(hi),file_offset=hex(offset),
                sha256=hashlib.sha256(data[offset:offset+hi-lo]).hexdigest(),assembly=f'{role}.asm',
                text_sha256={f'{role}.asm':hashlib.sha256(assembly.encode()).hexdigest()})
            if analysis:
                ev=json.loads((WORK/f'rea-{analysis}/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
                assert ev['subject']['digest']['sha256']==row['sha256']
                (out/f'{role}.ghidra.c').write_text(clean_text(ev['normalized_result']))
                row.update(evidence_id=ev['evidence_id'],provider='Ghidra 12.1.4',pseudocode=f'{role}.ghidra.c')
                row['text_sha256'][f'{role}.ghidra.c']=hashlib.sha256((out/f'{role}.ghidra.c').read_bytes()).hexdigest()
            owners.append(row)
        save(out / 'manifest.json', dict(target_sha256=SHA, owners=owners,
            shared_shard_credit='../power-scaling/tick.asm',
            shared_credit_range=['0x14590682a', '0x145906fe5'],
            limits=['Unchanged PE instructions with explicit isolated-memory inputs; no target process is launched.',
                    'Raw imports use generic ABI; Win64 assembly controls values and argument interpretation.',
                    'Existing canonical pet tick and actor owner evidence is referenced rather than duplicated; fresh gate and initial greater excerpts cover earlier non-overlapping ranges.']))
    else:
        manifest = json.loads((out / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        for owner in manifest['owners']:
            lo, hi = int(owner['address'], 16), int(owner['end_exclusive'], 16)
            offset = pe.rva_offset(lo - pe.image_base)
            assert hashlib.sha256(data[offset:offset + hi - lo]).hexdigest() == owner['sha256']
            for name, digest in owner['text_sha256'].items():
                assert hashlib.sha256((out / name).read_bytes()).hexdigest() == digest
    fixture = vectors(pe)
    if args.mode == 'collect':
        save(out / 'native-vectors.json', fixture)
    else:
        assert portable_record(fixture) == portable_record(json.loads((out / 'native-vectors.json').read_text()))
    print(f"Verified {sum(len(v) for v in fixture['cases'].values())} unchanged native demon-effect cases")


def vectors(pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], pe.data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x20000)
    u.mem_map(stack, 0x10000)
    u.mem_map(stop, 4096)
    game, rows, actor, vec, clock = [mem + n for n in (0, 0x2000, 0x4000, 0x6000, 0x7000)]
    frame = stack + 0x8000
    calls = []
    spans = []
    context = {}
    def put(at, fmt, *values): u.mem_write(at, struct.pack('<' + fmt, *values))
    def get(at, fmt): return struct.unpack('<' + fmt, u.mem_read(at, struct.calcsize('<' + fmt)))
    def bits(value): return struct.unpack('<I', struct.pack('<f', value))[0]
    def xf(register, value): u.reg_write(register, bits(value))
    def readxf(register): return struct.unpack('<f', struct.pack('<I', u.reg_read(register) & 0xffffffff))[0]
    def hook(uc, address, size, unused):
        if address == stop: uc.emu_stop()
        elif address == 0x145947780:
            calls.append('publish_soul_fire')
            sp = u.reg_read(r.UC_X86_REG_RSP)
            u.reg_write(r.UC_X86_REG_RIP, get(sp, 'Q')[0])
            u.reg_write(r.UC_X86_REG_RSP, sp + 8)
        elif address in (0x145925c80,0x1459992c0) and 'landing' in context:
            out=u.reg_read(r.UC_X86_REG_RCX)
            points=context['landing']
            if address==0x145925c80:
                ids=context['candidates']
                put(out,'3Q',64,rows,len(ids))
                for i,index in enumerate(ids):put(rows+i*8,'Q',100+index)
            else:
                put(out,'3Q',64,mem+0x10000,len(points))
                for i,point in enumerate(points):put(mem+0x10000+i*12,'fff',*point)
            sp=u.reg_read(r.UC_X86_REG_RSP)
            u.reg_write(r.UC_X86_REG_RIP,get(sp,'Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
        elif address==0x1400021d0:
            sp=u.reg_read(r.UC_X86_REG_RSP)
            u.reg_write(r.UC_X86_REG_RIP,get(sp,'Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
        elif address==0x14594e4f0 and 'cast-proc' in context:
            sp=u.reg_read(r.UC_X86_REG_RSP)
            calls.append(dict(descriptor=u.reg_read(r.UC_X86_REG_RDX),lifetime_bits=bits(readxf(r.UC_X86_REG_XMM3)),
                power_bits=get(sp+0x30,'I')[0]))
            u.reg_write(r.UC_X86_REG_RIP,get(sp,'Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
        elif not any(lo <= address < hi for lo, hi in spans):
            raise RuntimeError(f'Unexpected demon-effect instruction {address:#x}')
    u.hook_add(UC_HOOK_CODE, hook)
    def reset(*ranges):
        spans[:] = ranges
        calls.clear()
        context.clear()
        u.mem_write(mem, bytes(0x20000))
        u.mem_write(stack, bytes(0x10000))
        for reg in [r.UC_X86_REG_RAX, r.UC_X86_REG_RBX, r.UC_X86_REG_RCX, r.UC_X86_REG_RDX,
                    r.UC_X86_REG_RSI, r.UC_X86_REG_RDI, r.UC_X86_REG_R8, r.UC_X86_REG_R9,
                    r.UC_X86_REG_R12, r.UC_X86_REG_R13, r.UC_X86_REG_R14, r.UC_X86_REG_R15]:
            u.reg_write(reg, 0)
        u.reg_write(r.UC_X86_REG_RBP, frame)
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x7000)
        u.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
    cases = dict(shield=[], kill_heal=[], shard_credit=[], prune=[], devourer_mark=[], agony_critical=[], shield_cap=[], gate_choose=[], capstone_proc=[], greater_proc=[], landing=[], capstone_departure=[])
    for damage, fraction, pool, absorb, maximum in [
        (40., .3, 0., 0., 100.), (100., .3, 0., 7., 100.),
        (40., .3, 24., 40., 100.), (40., .3, 25., 40., 100.),
        (40., 0., 0., 0., 100.), (40., -.3, 0., 0., 100.),
        (-40., .3, 0., 0., 100.), (40., .3, 30., 40., 100.)]:
        reset((0x14594cb99, 0x14594cbf4), (0x14594c660, 0x14594c661))
        put(game + 0x190, 'f', pool); put(game + 0x478, 'f', maximum); put(game + 0x4e4, 'f', absorb)
        u.reg_write(r.UC_X86_REG_RBX, game)
        for reg, value in [(r.UC_X86_REG_XMM0,fraction),(r.UC_X86_REG_XMM7,damage),
                           (r.UC_X86_REG_XMM9,0.),(r.UC_X86_REG_XMM11,.25)]: xf(reg,value)
        u.emu_start(0x14594cb99, 0x14594c660, count=100)
        cases['shield'].append(dict(damage_bits=bits(damage), fraction_bits=bits(fraction),
            pool_bits=bits(pool), absorb_bits=bits(absorb), maximum_bits=bits(maximum),
            expected_pool_bits=bits(get(game+0x190,'f')[0]), expected_absorb_bits=bits(get(game+0x4e4,'f')[0])))
    for health in [0., 75., 99., 100., 105.]:
        reset((0x14594c843, 0x14594c887))
        put(game+0x478,'f',100.); put(game+0x4e0,'f',health)
        u.reg_write(r.UC_X86_REG_RBX,game); xf(r.UC_X86_REG_XMM14,2.5)
        u.emu_start(0x14594c843,0x14594c887,count=100)
        cases['kill_heal'].append(dict(health_bits=bits(health), maximum_bits=bits(100.),
            expected_health_bits=bits(get(game+0x4e0,'f')[0]), effective_bits=bits(readxf(r.UC_X86_REG_XMM1))))
    for points, bank, recent in [(0,0.,0.),(0,.8,0.),(0,.79991,0.),(4,.8,0.),
                                  (5,.2,0.),(2,.25,1.9),(2,.25,2.),(2,.25,2.1),
                                  (0,3.8,0.),(3,3.8,0.)]:
        reset((0x145906d78,0x145906fe5))
        put(frame+0x378,'Q',game); put(frame+0x50,'Q',game+0x7e8)
        put(game+0x7e8,'3Q',32,rows,0); put(game+0x8a0,'Iff',points,0.,bank)
        u.reg_write(r.UC_X86_REG_RAX,rows)
        xf(r.UC_X86_REG_XMM0,recent); xf(r.UC_X86_REG_XMM9,0.); xf(r.UC_X86_REG_XMM14,10.)
        u.emu_start(0x145906d78,0x145906fe5,count=1000)
        length = get(game+0x7f8,'Q')[0]
        cases['shard_credit'].append(dict(points=points, fraction_bits=bits(bank), recent_bits=bits(recent),
            expected_points=get(game+0x8a0,'I')[0], expected_fraction_bits=bits(get(game+0x8a8,'f')[0]),
            admitted_bits=bits(get(rows+4,'f')[0]) if length else None, publisher_calls=len(calls)))
    for ages in [[],[0.],[.9999],[1.],[1.1],[0.,1.,.5,1.5],[1.,0.,1.,.5,1.]]:
        reset((0x145995f70,0x145996047))
        put(vec,'3Q',32,rows,len(ages)); put(clock,'f',10.)
        for i,age in enumerate(ages): put(rows+i*8,'ff',10.-age,float(i+1))
        u.reg_write(r.UC_X86_REG_RCX,vec);u.reg_write(r.UC_X86_REG_RDX,clock)
        put(stack+0x7000,'Q',stop)
        u.emu_start(0x145995f70,stop,count=1000)
        count=get(vec+16,'Q')[0]
        cases['prune'].append(dict(age_bits=[bits(v) for v in ages], retained=[get(rows+i*8,'ff')[1] for i in range(count)]))
    for rank, alive, health in [(2,True,20.),(3,True,20.),(3,True,25.),
                                (3,True,24.99),(3,False,20.),(0,True,20.)]:
        reset((0x14594c9d0,0x14594ca75),(0x14594c64e,0x14594c660))
        put(frame+0x34,'I',int(rank>=3));put(actor+0x88,'Q',42)
        put(actor+0x68,'I',0 if alive else 1);put(actor+0xf0,'ff',health,100.)
        put(game+0x9ec,'f',10.)
        for reg,value in [(r.UC_X86_REG_RAX,actor),(r.UC_X86_REG_RBX,game),
                          (r.UC_X86_REG_RCX,352),(r.UC_X86_REG_RDX,1),
                          (r.UC_X86_REG_R8,int(alive)),(r.UC_X86_REG_R12,42)]:u.reg_write(reg,value)
        xf(r.UC_X86_REG_XMM11,.25);xf(r.UC_X86_REG_XMM12,5.)
        u.emu_start(0x14594c9d0,0x14594c660,count=1000)
        cases['devourer_mark'].append(dict(rank=rank,alive=alive,health_bits=bits(health),
            maximum_bits=bits(100.),marked_until_bits=bits(get(actor+0x158,'f')[0])))
    # Start after the spell/actor lookup so these vectors exercise the real mark
    # deadline, xoshiro draw, strict chance test and critical multiplication.
    for until, now, chance in [(0.,1.,1.),(1.,1.,1.),(2.,1.,0.),(2.,1.,1.),(2.,1.,.25)]:
        reset((0x14593dde2,0x14593de83),(0x14593ddc0,0x14593dde2))
        put(frame+0x2a0,'Q',game);put(actor+0x158,'f',until);put(game+0x484,'ff',chance,2.)
        seed=[1,2,3,4];put(game+0x958,'4Q',*seed)
        u.reg_write(r.UC_X86_REG_RDX,actor);u.reg_write(r.UC_X86_REG_RAX,0)
        for reg,value in [(r.UC_X86_REG_XMM6,now),(r.UC_X86_REG_XMM7,10.),(r.UC_X86_REG_XMM8,2.**-24)]:xf(reg,value)
        u.emu_start(0x14593dde2,0x14593de83,count=1000)
        cases['agony_critical'].append(dict(until_bits=bits(until), now_bits=bits(now), chance_bits=bits(chance),
            power_bits=bits(10.),multiplier_bits=bits(2.),rng_before=seed,rng_after=list(get(game+0x958,'4Q')),
            expected_power_bits=bits(readxf(r.UC_X86_REG_XMM7)), critical=bool(u.reg_read(r.UC_X86_REG_R12)&1)))
    for maximum,pool,absorb in [(100.,30.,40.),(100.,25.,40.),(100.,20.,40.),(40.,25.,15.),(100.,30.,3.)]:
        reset((0x145904b3a,0x145904b8a))
        u.reg_write(r.UC_X86_REG_R13,game);put(frame+0x378,'Q',game)
        put(game+0x478,'f',maximum);put(game+0x190,'f',pool);put(game+0x4e4,'f',absorb)
        u.emu_start(0x145904b3a,0x145904b8a,count=1000)
        cases['shield_cap'].append(dict(maximum_bits=bits(maximum),pool_bits=bits(pool),absorb_bits=bits(absorb),
            expected_pool_bits=bits(get(game+0x190,'f')[0]),expected_absorb_bits=bits(get(game+0x4e4,'f')[0])))
    seeds=[[1,2,3,4],[0x8000000000,2,3,4]]
    for count in [2,3]:
        for seed in seeds:
            reset((0x1458df010,0x1458df123))
            put(game+0x958,'4Q',*seed)
            for i in range(count):put(rows+i*8,'Q',i)
            u.reg_write(r.UC_X86_REG_RCX,rows);u.reg_write(r.UC_X86_REG_RDX,count);u.reg_write(r.UC_X86_REG_R8,game+0x958)
            put(stack+0x7000,'Q',stop)
            u.emu_start(0x1458df010,stop,count=1000)
            selected=(u.reg_read(r.UC_X86_REG_RAX)-rows)//8
            cases['gate_choose'].append(dict(count=count,rng_before=seed,index=selected,rng_after=list(get(game+0x958,'4Q'))))
    for misses,recovery,seed_index in [(0,1.,1),(8,1.,1),(9,1.,1),(9,.5,1),(0,1.,0)]:
        chance=.1; seed=seeds[seed_index]
        reset((0x14592d477,0x14592d53c),(0x1458e96b0,0x1458e96f8))
        context['cast-proc']=True
        put(frame+0x218,'Q',game);put(frame+0x1e0,'Q',0);put(frame+0x208,'I',10)
        put(frame+0x1f0,'f',10.);put(frame+0x48,'Q',game+0x958);put(frame+0x120,'Q',0x146e75178)
        put(game+0x88,'Q',rows);put(game+0x90,'Q',1);put(game+0x70,'Q',rows+0x100);put(game+0x78,'Q',1)
        put(rows,'I',misses);put(rows+0x100,'f',0.);put(game+0x480,'f',recovery);put(game+0x958,'4Q',*seed)
        for reg,value in [(r.UC_X86_REG_XMM8,chance),(r.UC_X86_REG_XMM9,12.),(r.UC_X86_REG_XMM10,40.),(r.UC_X86_REG_XMM14,2.**-24)]:xf(reg,value)
        u.emu_start(0x14592d477,0x145929e10,count=1000)
        cases['capstone_proc'].append(dict(misses=misses,chance_bits=bits(chance),recovery_bits=bits(recovery),
            expected_misses=get(rows,'I')[0],deadline_bits=bits(get(rows+0x100,'f')[0]),
            rng_before=seed,rng_after=list(get(game+0x958,'4Q')),summons=list(calls)))
    for rank,seed_index in [(1,1),(1,0),(2,0),(3,0)]:
        chance=.05;seed=seeds[seed_index]
        reset((0x14592d39d,0x14592d46a))
        context['cast-proc']=True
        put(frame+0x218,'Q',game);put(frame+0x1e0,'Q',0);put(frame+0xf0,'Q',0x146e75130)
        put(game+0x958,'4Q',*seed);u.reg_write(r.UC_X86_REG_R11,game);u.reg_write(r.UC_X86_REG_R13,rank)
        for reg,value in [(r.UC_X86_REG_XMM8,chance),(r.UC_X86_REG_XMM9,15.),(r.UC_X86_REG_XMM14,2.**-24),(r.UC_X86_REG_XMM15,1.)]:xf(reg,value)
        u.emu_start(0x14592d39d,0x145929e10,count=1000)
        cases['greater_proc'].append(dict(rank=rank,chance_bits=bits(chance),rng_before=seed,
            rng_after=list(get(game+0x958,'4Q')),summons=list(calls)))
    for points,candidates,radius in [([],[],8.),([(5.,0.,0.)],[0],8.),
            ([(5.,0.,0.),(25.,0.,0.)],[0,1],8.),
            ([(5.,0.,0.),(25.,0.,0.),(26.,0.,0.)],[0,1,2],8.),
            ([(5.,0.,0.),(25.,0.,0.),(31.,0.,0.)],[0,1],8.)]:
        reset((0x145927830,0x145927c39),(0x1459ae710,0x1459aeae2))
        context.update(landing=points,candidates=candidates)
        put(game+0x560,'Q',actor);put(game+0x568,'Q',len(points));put(game+0x9ec,'f',10.)
        for i,point in enumerate(points):put(actor+i*352+0x88,'Q',100+i);put(actor+i*352+0x118,'fff',*point)
        u.reg_write(r.UC_X86_REG_RCX,mem+0x1e000);u.reg_write(r.UC_X86_REG_RDX,game)
        xf(r.UC_X86_REG_XMM2,30.);xf(r.UC_X86_REG_XMM3,radius)
        u.reg_write(r.UC_X86_REG_RSP,stack+0x7008);put(stack+0x7008,'Q',stop)
        u.emu_start(0x145927830,stop,count=20000)
        present=get(mem+0x1e000,'I')[0]
        cases['landing'].append(dict(points=[list(p) for p in points],candidates=candidates,radius_bits=bits(radius),
            selected_bits=[bits(v) for v in get(mem+0x1e004,'fff')] if present else None))
    for deadline,now in [(0.,10.),(50.,10.),(17.5,10.),(25.,20.)]:
        reset((0x145904e24,0x145904e60))
        u.reg_write(r.UC_X86_REG_R13,game);u.reg_write(r.UC_X86_REG_R15,0);u.reg_write(r.UC_X86_REG_RAX,mem+0x9000)
        put(game+0x9ec,'f',now);put(game+0x70,'Q',rows);put(rows,'f',deadline);put(mem+0x9014,'f',7.5)
        u.emu_start(0x145904e24,0x145904e60,count=1000)
        cases['capstone_departure'].append(dict(deadline_bits=bits(deadline),now_bits=bits(now),
            expected_deadline_bits=bits(get(rows,'f')[0])))
    return dict(target_sha256=SHA, cases=cases,
        limitations=['Bounded unchanged instructions; no application compilation or process launch.',
                     'Soul Fire publisher is recorded as a seam; actual spell target selection is outside these vectors.',
                     'Agony cases enter after spell980 and matching actor admission, preserving the real deadline and RNG branch.'])


if __name__ == '__main__': main()
