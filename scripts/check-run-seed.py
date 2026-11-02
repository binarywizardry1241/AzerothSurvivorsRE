#!/usr/bin/env python3
"""Replay the hash-bound process/run seed chain without compilation or a game."""
from script_sources import load_script
import hashlib
import json
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

MASK = (1 << 64) - 1
MULTIPLIER = 0x5851F42D4C957F2D


def main():
    evidence = ROOT / 'docs/analysis/evidence/0.109.0/run-seed'
    manifest = json.loads((evidence / 'manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[k] == v for k, v in manifest['target'].items()), 'Changed selected target'
    data = target_bytes(target)
    module = load_script('run_seed_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    def raw(a, n):
        off = pe.rva_offset(a - pe.image_base)
        assert off is not None
        return data[off:off+n]
    roles = {row['role']: row for row in manifest['ranges']}
    for row in manifest['ranges']:
        a = int(row['start'],16)
        assert hashlib.sha256(raw(a,row['byte_count'])).hexdigest() == row['sha256'], row['role']
        assert hashlib.sha256((evidence/row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
    for row in manifest['ghidra']:
        if 'pseudocode' in row:
            assert hashlib.sha256((evidence/row['pseudocode']).read_bytes()).hexdigest() == row['pseudocode_sha256']
    sys.path[:0] = [str(ROOT/'runtime/armory-recovery/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    from unicorn import x86_const as reg
    machine = Uc(UC_ARCH_X86,UC_MODE_64)
    extent = max(s['rva']+max(s['raw_size'],s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base,(extent+4095)&~4095)
    for section in pe.sections:
        off,size=section['raw_offset'],section['raw_size']
        machine.mem_write(pe.image_base+section['rva'],data[off:off+size])
    scratch,size=0x200000000,0x100000
    machine.mem_map(scratch,size)
    stop=scratch+size-16
    context={};cases=[]
    def read(name):return machine.reg_read(getattr(reg,'UC_X86_REG_'+name))
    def write(name,value):machine.reg_write(getattr(reg,'UC_X86_REG_'+name),value)
    def word(address):return struct.unpack('<Q',machine.mem_read(address,8))[0]
    def put(address,value):machine.mem_write(address,struct.pack('<Q',value&MASK))
    def code(_,address,count,unused):
        if address in context['stops']:
            machine.emu_stop();return
        assert any(a<=address and address+count<=b for a,b in context['ranges']),hex(address)
        assert bytes(machine.mem_read(address,count))==raw(address,count),'Changed instruction'
    def changed(_,access,address,count,value,unused):
        assert scratch<=address and address+count<=scratch+size,hex(address)
    machine.hook_add(UC_HOOK_CODE,code);machine.hook_add(UC_HOOK_MEM_WRITE,changed)
    def reset(selected,stops=()):
        machine.mem_write(scratch,bytes(size));machine.mem_write(stop,b'\xcc')
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15','RBP'):
            write(name,0)
        write('EFLAGS',2);write('RSP',scratch+0x1F008);put(read('RSP'),stop)
        context.clear();context.update(stops={stop,*stops},ranges=[(int(roles[r]['start'],16),int(roles[r]['end_exclusive'],16)) for r in selected])
    def run(a):
        machine.emu_start(a,0,count=50000)
        assert read('RIP') in context['stops'],f'Native replay did not reach a reviewed boundary: {read("RIP"):#x}'
    # The main clock result stores seconds/nanos only on success; errors use1.
    for failed in [False,True]:
        for seconds in [0,1,1_792_578_123,MASK]:
            for nanos in [0,999_999,1_000_000,999_999_999]:
                reset(['app-main'],[0x140001619]);bp=scratch+0x4000;write('RBP',bp);machine.mem_write(bp+0x80,bytes([failed]));put(bp+0x88,seconds);machine.mem_write(bp+0x90,struct.pack('<I',nanos));run(0x1400015EC)
                expected=1 if failed else (seconds*1000+nanos//1_000_000)&MASK
                assert read('RSI')==expected,'Clock milliseconds/fallback/overflow'
                cases.append(dict(kind='clock',failed=failed,seconds=seconds,nanos=nanos,seed=expected))
    def expand(seed):
        values=[]
        for _ in range(8):
            seed=(seed*MULTIPLIER+0xA17654E46FBE17F3)&MASK
            v=(((seed>>18)^seed)>>27)&0xffffffff;r=seed>>59
            values.append(((v>>r)|(v<<((-r)&31)))&0xffffffff)
        words=[values[i]|(values[i+1]<<32) for i in range(0,8,2)]
        return words if any(words) else [0xE220A8397B1DCDAF,0x6E789E6AA1B965F4,0x06C45D188009454F,0xF88BB8A8724C81EC]
    seeds=[0,1,2,0x8000000000000000,MASK,*range(16),1_792_578_123_456]
    for initial in seeds:
        state=initial
        for index in range(4):
            expected=(state*MULTIPLIER+0x14057B7EF767814F)&MASK
            for role,a,b,owner in [('run-factory',0x1458BE1F5,0x1458BE222,'R13'),('initial-enter-lcg',0x1458B3FF7,0x1458B401D,'RSI')]:
                reset([role],[b]);server=scratch+0x8000;write(owner,server);write('RBP',scratch+0x4000);put(server+0x1118,state);run(a)
                assert word(server+0x1118)==expected,'Run LCG state'
                if role=='run-factory':assert word(scratch+0x4000+0xb90)==expected,'Constructor seed field'
            reset(['run-rng','run-rng-zero']);write('RCX',scratch+0x4000);write('RDX',expected);run(0x14590C4D0)
            actual=list(struct.unpack('<4Q',machine.mem_read(scratch+0x4000,32)))
            assert actual==expand(expected),'PCG32 expansion and little-endian pairing'
            cases.append(dict(kind='run-sequence',initial_seed=initial,run=index,state=expected,words=actual));state=expected
    # Execute the actual allzero branch and its SplitMix64(0) callee.
    reset(['run-rng','run-rng-zero'],[0x14590C6BD]);write('RSI',scratch+0x4000);run(0x14590C648)
    fallback=list(struct.unpack('<4Q',machine.mem_read(scratch+0x4000,32)))
    assert fallback==[0xE220A8397B1DCDAF,0x6E789E6AA1B965F4,0x06C45D188009454F,0xF88BB8A8724C81EC]
    cases.append(dict(kind='zero-expanded-state',words=fallback))
    # No run context exits before touching the process-wide LCG or Game.
    reset(['run-factory'],[0x1458BE7DD]);out=scratch+0x5000;server=scratch+0x8000;write('RCX',out);write('RDX',server);put(server+0xF18,MASK);put(server+0x1118,123);run(0x1458BDF90)
    assert word(out)==2 and word(server+0x1118)==123,'Absent run context'
    cases.append(dict(kind='absent-context',seed_unchanged=True))
    source=(ROOT/'crates/azeroth-survivors-re/src/run_seed.rs').read_text()
    main_source=(ROOT/'crates/azeroth-survivors-re/src/main.rs').read_text()
    gameplay=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    for token in ['elapsed.as_secs().wrapping_mul(1000)', 'elapsed.subsec_millis()', '.unwrap_or(1)',
                  '0x1405_7b7e_f767_814f','0xa176_54e4_6fbe_17f3','rotate_right((seed >> 59) as u32)',
                  '<< shift', 'if words == [0; 4]']:
        assert token in source,token
    assert 'let run_seeds = run_seed::RunSeeds::default();' in main_source
    assert 'app.insert_resource(run_seeds);' in main_source
    assert 'let seed = run_seeds.next();' in gameplay and 'getrandom::fill(&mut seed_bytes)' not in gameplay
    assert 'if !menu.entering || menu.in_run {' in gameplay
    output=ROOT/'runtime/gap9-startup-0.109.0/run-seed-checks.json'
    output.write_text(json.dumps(dict(target=manifest['target'],cases=cases,source_guards='passed; Rust not executed',limits=manifest['limits']),indent=2)+'\n')
    print(f'{len(cases)} current native clock/run-seed cases passed; source guards and {len(roles)} range hashes checked')


if __name__=='__main__':main()
