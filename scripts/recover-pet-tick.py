#!/usr/bin/env python3
"""Run the selected EXE's ordinary pet control flow with explicit engine seams.

The target process is not launched. Queries receive supplied ordered candidates;
terrain/network/impact calls are recorded or skipped. These fixtures validate
the recovered deadlines, target retention and movement requests, not rendering.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT = ROOT / 'runtime/power-scaling-0.105.0/pet-update'
HELPERS = [
    ('movement', 'move', 0x14592ea80, 0x14592ed7a,
     'dbf608a629aa80b33dfcf33c90bb59e24137d0ecff216fdba94e754d0e1a85ea'),
    ('special-target', 'target', 0x14594cdc0, 0x14594e0e4,
     'ccca631387de1ca71f32ce7cea9d9ae569ebf6f3465ecc7f3a6aadde2ee9a741'),
    ('cooldown', 'cooldown', 0x14594e0f0, 0x14594e482,
     '7c24bc140a593dce776c159e52e468aa38d2c4296fc32e33cf9161e1467594a1'),
    ('pending-resolve', 'pending-resolve', 0x145927040, 0x1459271ba,
     '6378c1816de7133edaa23b19b328b8b3259c0b7a2f1649abaa13b6432d12ebb8'),
]


def main():
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)
    OUT.mkdir(parents=True, exist_ok=True)
    owners = []
    for role, analysis_name, start, end, digest in HELPERS:
        assert any((begin + pe.image_base, stop + pe.image_base) == (start, end)
                   for begin, stop, _ in pe.functions()), f'{role}: unwind boundary drift'
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        assert hashlib.sha256(raw).hexdigest() == digest
        (OUT / f'{role}.bin').write_bytes(raw)
        assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={start:#x}', f'--stop-address={end:#x}',
            'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'], cwd=ROOT, text=True)
        (OUT / f'{role}.asm').write_text(assembly)
        owner = dict(role=role, start=hex(start), end_exclusive=hex(end),
                     file_offset=hex(offset), sha256=digest, assembly=f'{role}.asm')
        result_path = OUT / f'rea-{role}/003-procedure_pseudo_code.json'
        if not result_path.exists():
            result_path = OUT / f'rea-{analysis_name}/003-procedure_pseudo_code.json'
        if result_path.exists():
            evidence = json.loads(result_path.read_text())['response']['result']['structuredContent']
            assert evidence['subject']['digest']['sha256'] == digest
            (OUT / f'{role}.ghidra.c').write_text(evidence['normalized_result'])
            owner.update(pseudocode=f'{role}.ghidra.c', evidence_id=evidence['evidence_id'],
                         provider='Ghidra 12.1.4', analysis_input='unchanged complete raw-binary slice')
        plan = dict(target=str((OUT / f'{role}.bin').relative_to(ROOT)),
                    output=str((OUT / f'rea-{role}').relative_to(ROOT)),
                    init_timeout=60, open_timeout=60, timeout=180,
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
        (OUT / f'{role}-plan.json').write_text(portable_json(plan, indent=2) + '\n')
        owners.append(owner)
    manifest = dict(target_version='0.105.0', target_sha256=SHA, owners=owners,
        method='Exact PE exception-directory bounds and immutable original bytes; three helper owners also retain REA/Ghidra raw-slice decompilation.',
        reproduction='python3 scripts/recover-pet-tick.py; run generated helper plans with scripts/rea-batch.py when fresh pseudocode is needed.',
        shared_tick_assembly='../tick.asm',
        limits=['Raw-slice imports do not include external functions or constant data; Win64 assembly controls those interpretations.',
                'Ghidra pseudocode has inferred types and calling conventions and is not original source.',
                'The special-target helper includes Demonology branches; retaining it does not establish their live implementation.',
                'No original or rebuilt game process was launched.'])
    (OUT / 'helpers-manifest.json').write_text(portable_json(manifest, indent=2) + '\n')
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'],
                    data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    memory, stack = 0x200000000, 0x300000000
    u.mem_map(memory, 0x20000)
    u.mem_map(stack, 0x10000)
    game, pet, definition = memory, memory + 0x2000, memory + 0x3000
    actors, ids, packets = memory + 0x4000, memory + 0x10000, memory + 0x12000
    frame = stack + 0x8000

    def put(address, fmt, *values):
        u.mem_write(address, struct.pack(fmt, *values))

    def read(address, fmt):
        return struct.unpack(fmt, u.mem_read(address, struct.calcsize(fmt)))

    def xmm(reg):
        return struct.unpack('<f', struct.pack('<I', u.reg_read(reg) & 0xffffffff))[0]

    def set_xmm(reg, value):
        u.reg_write(reg, struct.unpack('<I', struct.pack('<f', value))[0])

    def ret():
        sp = u.reg_read(r.UC_X86_REG_RSP)
        destination, = read(sp, '<Q')
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)
        u.reg_write(r.UC_X86_REG_RIP, destination)

    result = {}
    current = {}
    phase = 'tick'

    def hook(uc, address, size, unused):
        if address in (0x145bc97c3, 0x145bc97bd):
            # Every fixture uses angle0; the native imports are cosf/sinf.
            assert xmm(r.UC_X86_REG_XMM0) == 0.0
            set_xmm(r.UC_X86_REG_XMM0, 1.0 if address == 0x145bc97c3 else 0.0)
            ret()
        elif address == 0x14592ea80:
            sp = uc.reg_read(r.UC_X86_REG_RSP)
            speed, = read(sp + 0x28, '<f')
            result['movement'] = dict(destination=[xmm(r.UC_X86_REG_XMM2),
                                                   xmm(r.UC_X86_REG_XMM3)], speed=speed)
            ret()
        elif address == 0x145925e50:
            out = uc.reg_read(r.UC_X86_REG_RCX)
            result['query_radius'] = xmm(r.UC_X86_REG_XMM3)
            candidate_ids = current['ordered_candidate_ids']
            for i, guid in enumerate(candidate_ids):
                put(ids + 8 * i, '<Q', guid)
            put(out, '<QQQ', 0, ids, len(candidate_ids))
            ret()
        elif address == 0x14594e0f0:
            result['attack'] = uc.reg_read(r.UC_X86_REG_R8)
            set_xmm(r.UC_X86_REG_XMM0, current['period'])
            ret()
        elif address == 0x14590538d:
            # Ordinary ranged dispatch follows the already-recorded attack.
            uc.emu_stop()
        elif address == 0x1458ab9e0:
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX), bytes(32))
            ret()
        elif address == 0x145933ec0:
            if phase == 'pending':
                sp = uc.reg_read(r.UC_X86_REG_RSP)
                result['damage_calls'].append(dict(
                    power_bits=uc.reg_read(r.UC_X86_REG_XMM2) & 0xffffffff,
                    target_guid=uc.reg_read(r.UC_X86_REG_RDX),
                    spell_id=uc.reg_read(r.UC_X86_REG_R9),
                    suppress_damage_log=bool(read(sp + 0x38, '<B')[0])))
            ret()
        elif address == 0x1459251b0:
            assert phase == 'pending'
            tag, value, duration = read(uc.reg_read(r.UC_X86_REG_R8), '<I2f')
            result['status_calls'].append(dict(tag=tag, value=value, duration=duration,
                target_guid=uc.reg_read(r.UC_X86_REG_RDX),
                power_bits=uc.reg_read(r.UC_X86_REG_XMM3) & 0xffffffff))
            ret()
        elif address == 0x1400021d0:
            ret()

    u.hook_add(UC_HOOK_CODE, hook)

    def motion(x, y=0.0, end_x=None, duration=0.0, started_at=0.0):
        return dict(from_=[x, y, 0.0], to=[x if end_x is None else end_x, y, 0.0],
                    duration=duration, started_at=started_at)

    target_a = dict(guid=51, motion=motion(8.0), retained_target_eligible=True, priority=0)
    target_b = dict(guid=52, motion=motion(12.0), retained_target_eligible=True, priority=2)
    scenarios = [
        dict(name='update_not_due', next_update=10.1),
        dict(name='idle_at_ring', position=motion(2.8)),
        dict(name='idle_returns', position=motion(10.0)),
        dict(name='far_returns', position=motion(40.1)),
        dict(name='far_boundary', position=motion(40.0)),
        dict(name='ranged_follow', ranged=True, position=motion(10.0)),
        dict(name='ranged_cooldown', ranged=True, next_attack=10.1, candidates=[51]),
        dict(name='ranged_attack', ranged=True, candidates=[51]),
        dict(name='ranged_first', ranged=True, candidates=[52, 51]),
        dict(name='melee_chase', candidates=[51]),
        dict(name='melee_hits', position=motion(4.5), candidates=[51]),
        dict(name='melee_cooldown', position=motion(4.5), candidates=[51], next_attack=10.1),
        dict(name='retain_priority', candidates=[51], target_guid=52),
        dict(name='replace_priority', candidates=[52], target_guid=51),
        dict(name='retain_without_candidate', candidates=[], target_guid=51),
        dict(name='moving_pet', position=motion(0.0, end_x=12.0, duration=20.0), candidates=[51]),
        dict(name='moving_target', candidates=[51], targets=[dict(target_a,
             motion=motion(0.0, end_x=20.0, duration=20.0))]),
        dict(name='candidate_player28', candidates=[51], targets=[dict(target_a, motion=motion(28.0))]),
        dict(name='retained_player32', target_guid=51, targets=[dict(target_a, motion=motion(32.0))]),
        dict(name='retained_dead', target_guid=51, targets=[dict(target_a, retained_target_eligible=False)]),
    ]
    cases = []
    for scenario in scenarios:
        for speed in [0.5, 1.0, 2.0]:
            u.mem_write(memory, bytes(0x20000))
            u.mem_write(stack, bytes(0x10000))
            ranged = scenario.get('ranged', False)
            current = dict(name=scenario['name'], now=10.0, player_position=[0., 0., 0.],
                           player_speed_multiplier=speed, period=1.75, ranged=ranged,
                           motion=scenario.get('position', motion(0.0)),
                           next_update=scenario.get('next_update', 0.0),
                           next_attack=scenario.get('next_attack', 0.0),
                           target_guid=scenario.get('target_guid'),
                           targets=scenario.get('targets', [target_a, target_b]),
                           ordered_candidate_ids=scenario.get('candidates', []))
            result = dict(movement=None, attack=None, query_radius=None)
            put(game + 0xd0, '<QQ', pet, 1)
            put(game + 0x48c, '<f', speed)
            put(game + 0x47c, '<4f', 1., 1., 0., 1.5)
            put(game + 0x4d8, '<I', 1)
            put(game + 0x560, '<QQ', actors, len(current['targets']))
            put(game + 0x5d0, '<QQQ', 64, packets, 0)
            put(game + 0x9ec, '<f', current['now'])
            put(definition + 0x2c, '<2fI', 12., current['period'], 75 if ranged else 0)
            put(pet + 0x18, '<QQQ', definition, 33, current['target_guid'] or 0)
            m = current['motion']
            put(pet + 0x40, '<3f3f2f2f', *m['from_'], *m['to'], m['started_at'], m['duration'],
                current['next_attack'], current['next_update'])
            for i, target in enumerate(current['targets']):
                a, m = actors + i * 0x160, target['motion']
                put(a + 0x18, '<Q', 0 if target['priority'] & 2 else 0xffffffffffffffff)
                put(a + 0x68, '<I', 0 if target['retained_target_eligible'] else 1)
                put(a + 0x88, '<Q', target['guid'])
                put(a + 0x10c, '<3f3f2f', *m['from_'], *m['to'], m['started_at'], m['duration'])
                put(a + 0x15c, '<B', target['priority'] & 1)
            put(frame + 0x378, '<Q', game)
            put(frame + 0x200, '<f', current['now'])
            put(frame + 0x80, '<Q', game + 0x9ec)
            u.reg_write(r.UC_X86_REG_R13, game)
            u.reg_write(r.UC_X86_REG_RBP, frame)
            u.reg_write(r.UC_X86_REG_RSP, stack + 0x1000)
            u.emu_start(0x145904e91, 0x1459077f2, count=100000)
            assert u.reg_read(r.UC_X86_REG_RIP) in (0x1459077f2, 0x14590538d)
            result['next_attack'], result['next_update'] = read(pet + 0x60, '<2f')
            result['target_guid'], = read(pet + 0x28, '<Q')
            if result['target_guid'] == 0:
                result['target_guid'] = None
            initial_update = struct.unpack('<f', struct.pack('<f', current['next_update']))[0]
            result['processed'] = result['next_update'] != initial_update
            cases.append(dict(input=current, output=result))
    impact_cases = []
    for now in [0.0, 10.0, 1000.0]:
        for source, target in [([0., 0., 0.], [28., 0., 7.]),
                               ([0., 0., 0.], [3., 4., 0.]),
                               ([5., 10., 6.], [5., 10., 1.]),
                               ([-30., 11., 0.], [25.5, -7.5, 0.])]:
            put(definition + 0x34, '<I', 116)
            put(definition + 0x38, '<B', 4)
            put(game + 0x9ec, '<f', now)
            put(game + 0x588, '<QQQ', 64, memory + 0x14000, 0)
            put(frame + 0x360, '<f', target[0])
            u.reg_write(r.UC_X86_REG_R14, definition)
            u.reg_write(r.UC_X86_REG_RSI, 33)
            u.reg_write(r.UC_X86_REG_RBX, 51)
            u.reg_write(r.UC_X86_REG_XMM10, int.from_bytes(struct.pack('<4f', *source[:2], 0., 0.), 'little'))
            set_xmm(r.UC_X86_REG_XMM2, target[1])
            set_xmm(r.UC_X86_REG_XMM8, 1.0)
            set_xmm(r.UC_X86_REG_XMM13, 0.0)
            set_xmm(r.UC_X86_REG_XMM12, 0.0)
            set_xmm(r.UC_X86_REG_XMM5, 250.0)
            set_xmm(r.UC_X86_REG_XMM14, 375.0)
            u.emu_start(0x14590634b, 0x145906c8c, count=1000)
            assert u.reg_read(r.UC_X86_REG_RIP) == 0x145906c8c
            row = memory + 0x14000
            effect_tag, effect_value, effect_duration = read(row + 0x60, '<I2f')
            critical, damages_player, overcast, school = read(row + 0x78, '<4B')
            impact_cases.append(dict(now=now, from_=source, target=target,
                impact_at=read(row + 0x6c, '<f')[0], effect_tag=effect_tag,
                effect_value=effect_value, effect_duration=effect_duration,
                critical=bool(critical), damages_player=bool(damages_player),
                overcast=bool(overcast), school=school))
    pending_gate_cases = []
    phase = 'pending'
    pending = memory + 0x16000
    for power_bits in [0xc1200000, 0x80000000, 0, 1, 0x38d1b717, 0x42480000,
                       0x7f800000, 0x7fc00000]:
        u.mem_write(pending, bytes(128))
        put(pending + 0x50, '<QQI2f', 51, 33, 1, 0.3, 2.0)
        put(pending + 0x70, '<II', 116, power_bits)
        put(pending + 0x7b, '<B', 4)
        sp = stack + 0x1008
        put(sp, '<Q', pe.image_base)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.reg_write(r.UC_X86_REG_RCX, game)
        u.reg_write(r.UC_X86_REG_RDX, pending)
        result = dict(damage_calls=[], status_calls=[])
        u.emu_start(0x145927040, pe.image_base, count=1000)
        assert u.reg_read(r.UC_X86_REG_RIP) == pe.image_base
        positive = power_bits in [1, 0x38d1b717, 0x42480000, 0x7f800000]
        assert bool(result['damage_calls']) == positive
        assert len(result['status_calls']) == 1
        assert result['status_calls'][0]['tag'] == 1
        assert all(not call['suppress_damage_log'] for call in result['damage_calls'])
        pending_gate_cases.append(dict(power_bits=power_bits, **result))
    begin, end = 0x145904e91, 0x1459077f2
    at = pe.rva_offset(begin - pe.image_base)
    output = dict(target_sha256=SHA, target_process_launched=False, cases=cases,
        impact_cases=impact_cases,
        pending_gate_cases=pending_gate_cases,
        owner=dict(start=hex(begin), end_exclusive=hex(end), file_offset=hex(at),
                   sha256=hashlib.sha256(data[at:at + end - begin]).hexdigest(),
                   assembly='../tick.asm'),
        pending_gate_owner=dict(manifest='helpers-manifest.json', role='pending-resolve'),
        method='Unchanged 0.105.0 pet loop145904e91..1459077f2 in Unicorn.',
        seams=['Ordered enemy-query results are supplied inputs; the selector is validated separately.',
               'cosf/sinf at angle0 return their exact1/0 results.',
               'Terrain movement requests, attack dispatch and cooldown calls are intercepted; period is supplied.',
               'Network packets, impact application and allocation frees are skipped.',
               'Ordinary ranged tick cases stop after the native next-attack write, before projectile dispatch.',
               'Impact cases continue through the original pending-row stores.',
               'Pending-gate cases execute complete145927040..1459271ba; canonical damage and status owners are intercepted, preserving whether each is called.'],
        limits=['Finite ordinary special0 cases do not establish special pet AI, terrain, presentation or gameplay parity.'])
    (OUT / 'native-tick.json').write_text(portable_json(output, indent=2) + '\n')
    print(f'{len(cases)} native pet-tick, {len(impact_cases)} impact and {len(pending_gate_cases)} pending-gate cases recorded')


if __name__ == '__main__':
    main()
