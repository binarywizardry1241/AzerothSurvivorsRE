#!/usr/bin/env python3
"""Retain selected-target REA actor evidence and bounded native AI fixtures.

Never launches the game. Unicorn executes only the listed unchanged instruction
ranges; external calls and all unexpected control flow fail closed.
"""
from portable_paths import objdump_output, portable_json, portable_record
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import struct
import subprocess
import sys
from enemy_evidence import pseudocode_text

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT = ROOT / 'docs/analysis/evidence/0.97.2/enemies'
RUNTIME = ROOT / 'runtime/enemies-ai-0.97.2'
FUNCTION = 0x1454c9510


def prepare_current(addresses, directory):
    """Prepare exact current PE owners for the shared durable query runner."""
    from coverage_common import latest_target, target_bytes
    from script_sources import load_script
    target = latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script('enemy_current_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    base = (ROOT / directory).resolve()
    if not base.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Current query preparation must stay under project runtime/')
    for address in addresses:
        end = bounds[address]
        offset = pe.rva_offset(address - pe.image_base)
        folder = base / f'{address:x}'
        folder.mkdir(parents=True, exist_ok=True)
        raw = data[offset:offset + end - address]
        (folder / 'body.bin').write_bytes(raw)
        (folder / 'seeds.tsv').write_text(f'{address:#x}\tcode\n{address:#x}\tfunction\n')
        save(folder / 'input.json', dict(target=target, start=hex(address), end_exclusive=hex(end),
             source_file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest(),
             boundary='PE RUNTIME_FUNCTION', limits=['Exact raw owner omits external code/data; inferred ABI needs instruction review.']))
        save(folder / 'plan.json', dict(target=str((folder / 'body.bin').relative_to(ROOT)),
             output=str((folder / 'rea').relative_to(ROOT)), init_timeout=60, timeout=420,
             open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
             environment={'REA_GHIDRA_SEED_FILE': str((folder / 'seeds.tsv').relative_to(ROOT))},
             operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(address)))]))
        print(str((folder / 'plan.json').relative_to(ROOT)))


def check_current(evidence, write):
    """Replay the bounded current caster contract without compiling Rust."""
    from coverage_common import latest_target, target_bytes
    from script_sources import load_script
    import math
    manifest_path = (ROOT / evidence).resolve()
    if not manifest_path.is_relative_to(ROOT):
        raise ValueError('Current evidence must stay inside this checkout')
    manifest = json.loads(manifest_path.read_text())
    target = latest_target(verify=True)
    assert manifest['target_sha256'] == target['sha256']
    data = target_bytes(target)
    pe = load_script('enemy_current_check_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == row['sha256']
        assert hashlib.sha256((manifest_path.parent / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
    for row in manifest['queries']:
        for key in ['raw_input', 'plan', 'journal', 'result']:
            receipt = row[key]
            assert hashlib.sha256((ROOT / receipt['path']).read_bytes()).hexdigest() == receipt['sha256']
        start = int(row['start'], 16)
        raw = (ROOT / row['raw_input']['path']).read_bytes()
        offset = pe.rva_offset(start - pe.image_base)
        assert data[offset:offset + len(raw)] == raw
        saved = json.loads((ROOT / row['result']['path']).read_text())
        native = saved.get('structuredContent') or json.loads(saved['content'][0]['text'])
        assert native['provider']['id'] == 'ghidra'
        assert native['subject']['digest']['sha256'] == row['raw_input']['sha256']
        assert native['parameters'] == {'procedure': row['start']}
    sys.path[:0] = [str(ROOT / 'runtime/armory-recovery/python-libs'),
                   str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    uc.mem_map(memory, 0x10000); uc.mem_map(stack, 0x10000); uc.mem_map(stop, 4096)
    def put(address, fmt, *values): uc.mem_write(address, struct.pack('<' + fmt, *values))
    def get(address, fmt): return struct.unpack('<' + fmt, uc.mem_read(address, struct.calcsize('<' + fmt)))
    def bits(value): return struct.unpack('<I', struct.pack('<f', value))[0]
    def packed(xy): return bits(xy[0]) | bits(xy[1]) << 32
    def xmm(index, value): uc.reg_write(getattr(reg, f'UC_X86_REG_XMM{index}'), bits(value))
    def ret():
        sp = uc.reg_read(reg.UC_X86_REG_RSP)
        address = get(sp, 'Q')[0]
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
        uc.reg_write(reg.UC_X86_REG_RIP, address)
    active, stops, seam = [], set(), {}
    def hook(_, address, size, user):
        if address in stops: uc.emu_stop(); return
        if any(a <= address < b for a, b in active): return
        if address == 0x145b98300 and seam.get('kind') == 'sight':
            assert uc.reg_read(reg.UC_X86_REG_RCX) == memory
            assert uc.reg_read(reg.UC_X86_REG_RDX) == packed(seam['from'])
            assert uc.reg_read(reg.UC_X86_REG_R8) == packed(seam['corrected'])
            seam['segment_calls'] += 1
            xmm(0, seam['fraction']); ret(); return
        if address == 0x145b99a00 and seam.get('kind') == 'sight':
            assert uc.reg_read(reg.UC_X86_REG_RDX) == memory
            assert uc.reg_read(reg.UC_X86_REG_R8) == packed(seam['to'])
            assert get(uc.reg_read(reg.UC_X86_REG_RSP) + 0x28, 'f')[0] == 2.5
            out = uc.reg_read(reg.UC_X86_REG_RCX)
            seam['nearest_calls'] += 1
            put(out, 'Iff', int(seam['nearest'] is not None), *(seam['nearest'] or [0., 0.]))
            ret(); return
        if address == 0x145b98c90 and seam.get('kind') == 'impact':
            assert uc.reg_read(reg.UC_X86_REG_RDX) == packed(seam['from'])
            assert uc.reg_read(reg.UC_X86_REG_R8) == packed(seam['to'])
            seam['sight_calls'] += 1
            uc.reg_write(reg.UC_X86_REG_RAX, int(seam['clear'])); ret(); return
        raise AssertionError(f'Undeclared native instruction {address:#x}')
    uc.hook_add(UC_HOOK_CODE, hook)
    def reset():
        uc.mem_write(memory, bytes(0x10000)); uc.mem_write(stack, bytes(0x10000))
        for name in ['RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']:
            uc.reg_write(getattr(reg, 'UC_X86_REG_' + name), 0)
        for i in range(16): xmm(i, 0.)
        uc.reg_write(reg.UC_X86_REG_RSP, stack + 0xf008)
        put(stack + 0xf008, 'Q', stop)
        uc.reg_write(reg.UC_X86_REG_EFLAGS, 2); uc.reg_write(reg.UC_X86_REG_MXCSR, 0x1f80)
    def execute(start, end, endpoints):
        nonlocal active, stops
        active, stops = [(start, end)], set(endpoints)
        uc.emu_start(start, 0, count=10000)
        address = uc.reg_read(reg.UC_X86_REG_RIP)
        assert address in stops
        return address
    cases = []
    for cell, to in [(0, [8.5, 3.5]), (1, [8.5, 3.5]), (2, [8.5, 3.5]), (0, [-1., 3.5]), (0, [18., 3.5])]:
        for nearest in [None, [7.5, 3.5]]:
            for fraction in [0., 0.99999994, 1., 1.0001, float('nan')]:
                reset(); put(memory + 8, 'QQQff', memory + 0x1000, 256, 16, 0., 0.)
                if 0 <= to[0] < 16: put(memory + 0x1000 + int(to[1]) * 16 + int(to[0]), 'B', cell)
                adjusted = cell == 1 and 0 <= to[0] < 16
                seam = dict(kind='sight', **{'from': [2.5, 3.5]}, to=to, nearest=nearest,
                    corrected=nearest if adjusted and nearest is not None else to,
                    fraction=fraction, segment_calls=0, nearest_calls=0)
                uc.reg_write(reg.UC_X86_REG_RCX, memory)
                uc.reg_write(reg.UC_X86_REG_RDX, packed(seam['from']))
                uc.reg_write(reg.UC_X86_REG_R8, packed(to))
                execute(0x145b98c90, 0x145b98de4, [stop])
                expected = True if adjusted and nearest is None else fraction >= 1.
                actual = bool(uc.reg_read(reg.UC_X86_REG_RAX) & 0xff)
                assert actual == expected
                assert seam['nearest_calls'] == int(adjusted)
                assert seam['segment_calls'] == int(not adjusted or nearest is not None)
                cases.append(dict(kind='sight', endpoint=to, cell=cell, nearest=nearest,
                    fraction_bits=bits(fraction), clear=actual))
    for clear in [False, True]:
        for outside in [False, True]:
            for distance in [0., 22., 23., float('nan')]:
                reset(); seam = {}
                uc.reg_write(reg.UC_X86_REG_RAX, int(clear)); uc.reg_write(reg.UC_X86_REG_RBX, int(outside))
                xmm(13, 22.); xmm(15, distance)
                actual = execute(0x145c3d759, 0x145c3d76e, [0x145c3d76e, 0x145c3d9d1]) == 0x145c3d76e
                assert actual == (clear and not outside and 22. >= distance)
                cases.append(dict(kind='cast-admission', clear=clear, outside=outside, distance_bits=bits(distance), admitted=actual))
        for distance in [0., 22., 23., float('nan')]:
            reset(); seam = {}; uc.reg_write(reg.UC_X86_REG_RAX, int(clear)); xmm(8, 18.); xmm(13, 22.); xmm(15, distance)
            execute(0x145c3d9fa, 0x145c3da1d, [0x145c3da1d])
            actual = uc.reg_read(reg.UC_X86_REG_XMM8) & 0xffffffff
            expected = 18. if clear or 22. < distance else 1.5
            assert actual == bits(expected)
            cases.append(dict(kind='chase-radius', clear=clear, distance_bits=bits(distance), radius_bits=actual))
        for deadline in [10., 10.001, float('nan')]:
            for tag in [0, 1, 3]:
                reset(); seam = {}; uc.reg_write(reg.UC_X86_REG_R14, memory)
                uc.reg_write(reg.UC_X86_REG_RAX, int(clear)); xmm(6, 10.)
                put(memory + 0xb8, 'If', 1, deadline); put(memory + 0x100, 'Q', memory + 0x1000); put(memory + 0x1000, 'I', tag)
                actual = execute(0x145c3d654, 0x145c3d695, [0x145c3d695, 0x145c3aa20]) == 0x145c3d695
                assert actual == (10. >= deadline and clear and bool(tag & 1))
                cases.append(dict(kind='cast-completion', clear=clear, deadline_bits=bits(deadline), tag=tag, admitted=actual))
    for origin in [False, True]:
        for grid in [False, True]:
            for clear in [False, True]:
                reset(); row = memory + 0x1000; terrain = memory + 0x2000
                put(row + 0x20, 'Iff', int(origin), 2.5, 3.5)
                put(memory + 0xc18, 'Q', terrain); put(terrain + 0x40, 'q', 0 if grid else -1)
                put(memory + 0x520, 'ff', 8.5, 3.5)
                uc.reg_write(reg.UC_X86_REG_R14, memory); uc.reg_write(reg.UC_X86_REG_RDI, row)
                uc.reg_write(reg.UC_X86_REG_RBP, stack + 0x8000)
                seam = dict(kind='impact', **{'from': [2.5, 3.5]}, to=[8.5, 3.5], clear=clear, sight_calls=0)
                result = execute(0x145c69b43, 0x145c69c24, [0x145c69b20, 0x145c69b32, 0x145c69c24])
                expected = 0x145c69c24 if not origin else 0x145c69b20 if not grid or clear else 0x145c69b32
                assert result == expected
                assert seam['sight_calls'] == int(origin and grid)
                cases.append(dict(kind='hostile-impact', origin=origin, grid=grid, clear=clear,
                    result={0x145c69c24:'actor', 0x145c69b20:'damage-player', 0x145c69b32:'drop'}[result]))
    source = (ROOT / 'crates/azeroth-survivors-re/src/enemies/ai.rs').read_text()
    for token in ['let sight_clear = !caster || world.sight_clear(current, context.player)',
                  'outside || !sight_clear', 'sight_clear && definition.raw_cast[0] & 1 != 0',
                  '!sight_clear && !(range < player_distance)']:
        assert token in source, token
    mechanics = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
    assert mechanics.index('if !world.sight_clear(from, player) { continue; }') < mechanics.index('self.damage_player(hit.damage, false, hit.source_guid, player, facing, world)')
    actor_frame = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/actor_frame.rs').read_text()
    assert 'hostile_origin: Some([from.x.to_bits(), from.y.to_bits(), from.z.to_bits()])' in actor_frame
    navigation = (ROOT / 'crates/azeroth-survivors-re/src/floor_recovery/navigation.rs').read_text()
    for token in ['grid.cells[cell] == 1', 'super::nearest_open(grid, to, 2.5)',
                  'else { return true; }', 'segment_fraction(grid, from, to) >= 1.0']:
        assert token in navigation, token
    world = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/world.rs').read_text()
    assert 'self.native.and_then(|native| native.occupancy.as_ref()).is_none_or' in world
    assert 'azeroth_survivors_re::floor_recovery::navigation::sight_clear(' in world
    result = dict(target_sha256=target['sha256'], cases=cases, native_cases=len(cases),
        limits=['Bounded unchanged original instructions with declared nearest-open, segment and LOS seams.',
                'Existing native navigation/terrain interfaces are reused; this does not validate their entire algorithms.',
                'Source connections are inspected, not compiled or executed; no game/server/network or parity validation.'])
    out = manifest_path.parent / 'native-cases.json'
    if write:
        stage = ROOT / 'runtime/caster-navigation-0.127.0/native-cases.json'
        save(stage, result); print(stage.relative_to(ROOT))
    else: assert portable_record(json.loads(out.read_text())) == portable_record(result)
    print(f'{len(cases)} current caster LOS/chase/completion/impact native cases pass; no compiler/game')


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-current', action='store_true')
    parser.add_argument('--address', action='append', type=lambda value: int(value, 0))
    parser.add_argument('--output', default='runtime/enemy-ai-current')
    parser.add_argument('--check-current', action='store_true')
    parser.add_argument('--write-current', action='store_true')
    parser.add_argument('--evidence', default='docs/analysis/evidence/0.127.0/caster-navigation/manifest.json')
    args = parser.parse_args()
    if args.check_current:
        check_current(args.evidence, args.write_current)
        return
    if args.prepare_current:
        if not args.address:
            parser.error('--prepare-current requires --address')
        prepare_current(args.address, args.output)
        return
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    end = dict((pe.image_base+a, pe.image_base+b) for a,b,_ in pe.functions())[FUNCTION]
    offset = pe.rva_offset(FUNCTION - pe.image_base)
    function_sha = hashlib.sha256(data[offset:offset+end-FUNCTION]).hexdigest()
    # Reuse the matching completed REA session instead of reanalysing the same
    # function. Its byte identity is checked independently against the PE.
    bundle = ROOT / 'runtime/guardians-0.97.2/rea-1454c9510/evidence-bundle.json'
    if not bundle.exists():
        RUNTIME.mkdir(parents=True, exist_ok=True)
        binary_slice = RUNTIME / 'actor-update.bin'
        binary_slice.write_bytes(data[offset:offset+end-FUNCTION])
        plan = RUNTIME / 'actor-plan.json'
        save(plan,dict(target=str(binary_slice.relative_to(ROOT)),output=str((RUNTIME/'rea-actor').relative_to(ROOT)),
             open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(FUNCTION)),
             timeout=240,open_timeout=60,
             operations=[dict(name='analyze_function',arguments=dict(procedure=hex(FUNCTION)))]))
        bundle=RUNTIME/'rea-actor/evidence-bundle.json'
        if not bundle.exists():
            subprocess.run(['python3','scripts/rea-batch.py',str(plan.relative_to(ROOT))],cwd=ROOT,check=True)
    records = json.loads(bundle.read_text())['records']
    record = next(r for r in records if r['operation'] == 'analyze_function'
                  and r['parameters']['procedure'] == hex(FUNCTION))
    assert record['subject']['digest']['sha256'] == function_sha
    value = record['normalized_result']
    OUT.mkdir(parents=True, exist_ok=True)
    RUNTIME.mkdir(parents=True, exist_ok=True)
    (OUT / 'actor-update.ghidra.c').write_text(pseudocode_text(value['pseudocode']))
    scopes = []
    for name, start, stop in [
        ('actor-status-gates',0x1454c9e92,0x1454ca5f0),
        ('escape-and-guardian-dispatch',0x1454ca5f0,0x1454cab2b),
        ('ordinary-combat',0x1454cb009,0x1454cb5cd),
        ('ordinary-movement',0x1454cbaf5,0x1454cbdff),
        ('ordinary-melee-damage',0x1454cb959,0x1454cba5a),
        ('melee-dispatch',0x1454cc1da,0x1454cc255),
    ]:
        off = pe.rva_offset(start-pe.image_base)
        raw = data[off:off+stop-start]
        asm = objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={start:#x}',f'--stop-address={stop:#x}',str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        path = OUT / f'{name}.asm'
        path.write_text(asm)
        scopes.append(dict(name=name, va=hex(start), end_exclusive=hex(stop), file_offset=hex(off),
                           byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),assembly=path.name))
    constants=[]
    for address in [0x1458eb480,0x1458eb488,0x1458eb4f8,0x1458eb524,0x1458eb528,
                    0x1458f6620,0x1458f6624,0x1458f6628,0x1458f6680,0x1458fcc38,
                    0x1458fcce8,0x1458fcde4,0x1458fcde8,0x1458fcdec,0x1458ed010,
                    0x14590af0c,0x14594f310,0x1458f8d40,0x1459f74d4,0x1458f8e00]:
        off=pe.rva_offset(address-pe.image_base);raw=data[off:off+4]
        constants.append(dict(va=hex(address),file_offset=hex(off),bits=struct.unpack('<I',raw)[0],
            value=struct.unpack('<f',raw)[0],sha256=hashlib.sha256(raw).hexdigest()))
    save(OUT/'ai-native.json',dict(target_version='0.97.2',target_sha256=SHA,target_executed=False,
         function=dict(va=hex(FUNCTION),end_exclusive=hex(end),file_offset=hex(offset),sha256=function_sha,
                       boundary='PE RUNTIME_FUNCTION'),
         rea={k:record.get(k) for k in ['evidence_id','operation','subject','parameters','provider','analysis_profile','limitations','relationship_coverage']},
         scopes=scopes,constants=constants,limitations=['Static decompilation is not original source or runtime parity.',
          'REA raw function slice omits external code/data and infers ABI types; original Win64 instructions govern.',
          'Actor source returns engine requests; world, packets, aura lists and spell resolution require real adapters.',
          'Host trigonometry/hypot and full Windows CRT equivalence are unverified.']))

    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    uc=Uc(UC_ARCH_X86,UC_MODE_64)
    size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base,(size+4095)&~4095)
    for s in pe.sections:
        uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    ACTOR, DEFINITION, FRAME=0x200000000,0x200001000,0x300000000
    uc.mem_map(ACTOR,0x3000);uc.mem_map(FRAME,0x2000)
    def putf(a,v):uc.mem_write(a,struct.pack('<f',v))
    def putu(a,v):uc.mem_write(a,struct.pack('<I',v))
    def putq(a,v):uc.mem_write(a,struct.pack('<Q',v))
    def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
    def readu(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
    def xmm(index,value):uc.reg_write(getattr(reg,f'UC_X86_REG_XMM{index}'),bits(value))
    def vector(index,x,y):uc.reg_write(getattr(reg,f'UC_X86_REG_XMM{index}'),bits(x)|(bits(y)<<32))
    active_range=(0,0);stops=set()
    def hook(_,address,size,__):
        if address in stops:uc.emu_stop()
        elif not active_range[0]<=address<active_range[1]:raise RuntimeError(f'Unexpected instruction {address:x}')
    uc.hook_add(UC_HOOK_CODE,hook)
    def reset():
        uc.mem_write(ACTOR,bytes(0x3000));uc.mem_write(FRAME,bytes(0x2000))
        uc.reg_write(reg.UC_X86_REG_RDI,ACTOR);uc.reg_write(reg.UC_X86_REG_RBP,FRAME+0x800)
        uc.reg_write(reg.UC_X86_REG_RSP,FRAME+0x1800)
        uc.reg_write(reg.UC_X86_REG_R15,0)
        uc.reg_write(reg.UC_X86_REG_MXCSR,0x1f80);uc.reg_write(reg.UC_X86_REG_EFLAGS,2)
        xmm(6,10);xmm(8,0);xmm(11,1)
    def execute(start,end,endpoints):
        nonlocal active_range,stops
        active_range=(start,end);stops=set(endpoints)
        uc.emu_start(start,0,count=1000)
        rip=uc.reg_read(reg.UC_X86_REG_RIP);assert rip in stops
        return rip
    movement=[]
    for range_,dist,outside,now,deadline in [
        (3,3,False,10,10),(3,3.001,False,10,10),(3,2,True,10,10),
        (3,4,False,10,10.001),(3,2,False,10,999),(float('nan'),2,False,10,10),
        (3,float('nan'),False,10,10),(3,4,False,10,float('nan')),
    ]:
        reset();xmm(9,range_);xmm(10,dist);xmm(6,now);putf(ACTOR+0x12c,deadline)
        uc.reg_write(reg.UC_X86_REG_R15,int(outside))
        rip=execute(0x1454cb201,0x1454cb21e,[0x1454cb3bb,0x1454cb21e,0x1454c9a4c])
        movement.append(dict(range_bits=bits(range_),distance_bits=bits(dist),outside=outside,
           now_bits=bits(now),deadline_bits=bits(deadline),result={0x1454cb3bb:0,0x1454cb21e:1,0x1454c9a4c:2}[rip]))
    completion=[]
    for now,end_ in [(10,10),(10,10.001),(10,9),(10,float('nan'))]:
      for kind in [0,1]:
        reset();putu(ACTOR+0x70,1);putf(ACTOR+0x74,end_);xmm(6,now)
        putq(ACTOR+0x90,DEFINITION);putu(DEFINITION,kind)
        rip=execute(0x1454cb084,0x1454cb0ae,[0x1454cb0ae,0x1454c9a4c])
        completion.append(dict(now_bits=bits(now),ends_at_bits=bits(end_),tag=kind,
            casting_after=bool(readu(ACTOR+0x70)),complete=rip==0x1454cb0ae))
    attacks=[]
    for delay in [0,0.001,-5,float('nan')]:
      for kind in [0,1]:
        reset();putf(ACTOR+0x130,delay);putf(ACTOR+0x100,3.2)
        putq(ACTOR+0x90,DEFINITION);putu(DEFINITION,kind)
        rip=execute(0x1454cb4db,0x1454cb512,[0x1454cb512,0x1454cb959,0x1454c9a4c])
        attacks.append(dict(delay_bits=bits(delay),interval_bits=bits(3.2),tag=kind,
            due=rip!=0x1454c9a4c,after_bits=readu(ACTOR+0x130)))
    starts=[]
    for duration in [0,1.8,2.5]:
        reset();uc.reg_write(reg.UC_X86_REG_RAX,DEFINITION)
        putu(DEFINITION+4,133);putf(DEFINITION+12,duration)
        execute(0x1454cb512,0x1454cb52f,[0x1454cb52f])
        starts.append(dict(duration_bits=bits(duration),now_bits=bits(10),casting=readu(ACTOR+0x70),ends_at_bits=readu(ACTOR+0x74)))
    timings=[]
    for length in [0,0.5,1,5,14]:
      for speed in [0,0.5,5,100]:
        reset();vector(13,length,0);vector(9,0,0);xmm(0,speed)
        execute(0x1454cbcc2,0x1454cbd4c,[0x1454cbd4c])
        timings.append(dict(length_bits=bits(length),speed_bits=bits(speed),now_bits=bits(10),
            duration_bits=readu(ACTOR+0x128),next_movement_at_bits=readu(ACTOR+0x12c)))
    fear=[]
    for now in [0,0.1,10,12.6,100,1000,16384]:
        reset();xmm(6,now)
        execute(0x1454c99bf,0x1454c99e1,[0x1454c99e1])
        fear.append(dict(now_bits=bits(now),next_movement_at_bits=readu(FRAME+0x800+0x24)))
    output=ROOT/'crates/azeroth-survivors-re/tests/fixtures/enemy-ai-0.97.2-native.json'
    save(output,dict(target_sha256=SHA,method='Bounded unchanged x86-64 instructions in Unicorn; no external calls; game not launched.',
        oracle_ranges=dict(movement=['0x1454cb201','0x1454cb21e'],completion=['0x1454cb084','0x1454cb0ae'],
            attack=['0x1454cb4db','0x1454cb512'],cast_start=['0x1454cb512','0x1454cb52f'],timing=['0x1454cbcc2','0x1454cbd4c'],fear=['0x1454c99bf','0x1454c99e1']),
        movement_cases=movement,completion_cases=completion,attack_cases=attacks,cast_start_cases=starts,timing_cases=timings,fear_cases=fear))
    print(f'AI evidence retained; {len(movement)+len(completion)+len(attacks)+len(starts)+len(timings)+len(fear)} native instruction fixtures; '+hashlib.sha256(output.read_bytes()).hexdigest())


if __name__=='__main__':main()
