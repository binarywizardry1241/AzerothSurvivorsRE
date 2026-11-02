#!/usr/bin/env python3
"""Recover current weapon swings with unchanged PE instruction vectors.

Only the two weapon spans are extracted from the shared tick owner.
--rea decompiles the focused selector with the project REA/Ghidra wrapper.
All fresh output stays under ignored runtime/ for review. No game is launched.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import f32 as _shared_f32, bits as _shared_bits
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
OUT = ROOT / 'runtime/power-scaling-0.105.0/weapon'
STAGE = (0x145902c51, 0x145902f6b)
SELECTOR = 0x145925e50


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def bits(value):
    return _shared_bits(value)


def f32(value):
    return _shared_f32(value)


def machine(pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], pe.data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x400000)
    u.mem_map(stack, 0x10000)
    u.mem_map(done, 4096)
    return u, r, mem, stack, done


def recovery_vectors(pe):
    """Execute only the current refresh aura fold, conversion and timer tail."""
    u, r, mem, stack, done = machine(pe)
    from unicorn import UC_HOOK_CODE
    game, auras = mem + 0x1000, mem + 0x3000
    bp = stack + 0x8000
    spans = [(0x1458f9dd5, 0x1458f9e9f), (0x1458f9edb, 0x1458f9eed),
             (0x145902f1e, 0x145902f50)]

    def hook(_, address, size, unused):
        if not any(lo <= address < hi for lo, hi in spans):
            raise RuntimeError('Unreviewed recovery instruction ' + hex(address))

    def put(at, fmt, *values):
        u.mem_write(at, struct.pack(fmt, *values))

    def float_reg(reg):
        return struct.unpack('<f', struct.pack('<I', u.reg_read(reg) & 0xffffffff))[0]

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    # Include ordinary values and cancellation boundaries which expose the
    # old reciprocal reconstruction/order before aura accumulation.
    inputs = [
        ('none', .1, 0., []),
        ('one_aura', .1, 0., [(9, .2, 20.)]),
        ('buff_potency', .08, .25, [(9, .3, 20.), (9, .2, 20.)]),
        ('expired_and_other', .1, .25, [(9, 4., 10.), (8, 9., 20.), (9, .2, 20.)]),
        ('ordered_cancellation', 16777216., 0., [(9, 1., 20.), (9, -16777216., 20.)]),
        ('negative_recovery', -.75, 0., [(9, .1, 20.)]),
    ]
    for name, raw_recovery, buff_bonus, rows in inputs:
        u.mem_write(mem, bytes(0x400000))
        u.mem_write(stack, bytes(0x10000))
        put(game + 0x378, '<2Q', auras, len(rows))
        put(game + 0x9ec, '<f', 10.)
        for i, (tag, value, expires) in enumerate(rows):
            put(auras + i * 24, '<IfIIfI', tag, value, 0, 0, expires, 0)
        u.reg_write(r.UC_X86_REG_R12, game)
        u.reg_write(r.UC_X86_REG_RBP, bp)
        u.reg_write(r.UC_X86_REG_XMM6, bits(raw_recovery))
        u.reg_write(r.UC_X86_REG_XMM15, bits(buff_bonus))
        u.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
        u.emu_start(*spans[0], count=500)
        after_auras = float_reg(r.UC_X86_REG_XMM6)
        expected = f32(raw_recovery)
        for tag, value, expires in rows:
            if tag == 9 and 10. < expires:
                expected = f32(expected + f32(f32(value) * f32(1. + f32(buff_bonus))))
        assert bits(after_auras) == bits(expected)
        u.reg_write(r.UC_X86_REG_XMM2, bits(1.))
        u.emu_start(*spans[1], count=20)
        cooldown = float_reg(r.UC_X86_REG_XMM9)
        assert bits(cooldown) == bits(f32(1. / f32(after_auras + 1.)))
        put(game + 0x480, '<f', cooldown)
        u.reg_write(r.UC_X86_REG_R13, game)
        u.reg_write(r.UC_X86_REG_XMM8, bits(1.6))
        u.emu_start(*spans[2], count=20)
        timer = struct.unpack('<I', u.mem_read(game + 0x538, 4))[0]
        cases.append(dict(name=name, raw_recovery_bits=bits(raw_recovery), buff_bonus_bits=bits(buff_bonus),
                          now_bits=bits(10.), auras=[dict(tag=tag, value_bits=bits(value), expires_bits=bits(expires))
                                                    for tag, value, expires in rows],
                          after_auras_bits=bits(after_auras), cooldown_bits=bits(cooldown),
                          interval_bits=bits(1.6), timer_bits=timer))
    return cases


def vectors(pe):
    u, r, mem, stack, done = machine(pe)
    from unicorn import UC_HOOK_CODE
    game, stats, targets, packets = [mem + a for a in (0x1000, 0x3000, 0x5000, 0x6000)]
    bp, sp = stack + 0x8000, stack + 0x7000
    context = {}

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack(fmt, *v))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def low(reg):
        return u.reg_read(reg) & 0xffffffff

    def ret():
        rsp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, get(rsp, '<Q')[0])
        u.reg_write(r.UC_X86_REG_RSP, rsp + 8)

    def hook(_, address, size, unused):
        if address == STAGE[1] or address == done:
            u.emu_stop()
        elif address == SELECTOR and context['kind'] == 'stage':
            context['calls'].append('query')
            context['radius_bits'] = low(r.UC_X86_REG_XMM3)
            count = int(context['target'])
            put(u.reg_read(r.UC_X86_REG_RCX), '<3Q', count, targets, count)
            put(targets, '<Q', 77)
            ret()
        elif address == 0x1458ab9e0:
            rsp = u.reg_read(r.UC_X86_REG_RSP)
            context['calls'].append('melee')
            context['melee'] = dict(source=u.reg_read(r.UC_X86_REG_RDX),
                                   target=u.reg_read(r.UC_X86_REG_R8),
                                   amount=u.reg_read(r.UC_X86_REG_R9) & 0xffffffff,
                                   critical=bool(get(rsp + 0x28, '<B')[0]))
            put(u.reg_read(r.UC_X86_REG_RCX), '<4Q', 0, 8, 0, 0)
            ret()
        elif address == 0x145933ec0:
            rsp = u.reg_read(r.UC_X86_REG_RSP)
            context['calls'].append('hit')
            context['hit'] = dict(target=u.reg_read(r.UC_X86_REG_RDX),
                                 power_bits=low(r.UC_X86_REG_XMM2),
                                 spell=u.reg_read(r.UC_X86_REG_R9) & 0xffffffff,
                                 school=get(rsp + 0x28, '<B')[0],
                                 critical=bool(get(rsp + 0x30, '<B')[0]),
                                 suppress_log=bool(get(rsp + 0x38, '<B')[0]))
            # A synchronous proc may refresh cooldown before the timer write.
            put(game + 0x480, '<I', context['cooldown_after_bits'])
            ret()
        elif address in (0x140002200, 0x1400021d0, 0x145bc8c10):
            ret()  # allocator preflight / deallocation / mapped-stack probe
        elif address == 0x1400021c0:
            length = u.reg_read(r.UC_X86_REG_RCX)
            allocation = context['allocation']
            context['allocation'] += (length + 15) & ~15
            assert context['allocation'] < mem + 0x400000
            u.reg_write(r.UC_X86_REG_RAX, allocation)
            ret()
        elif address == 0x145bc977b:
            dst, src, length = (u.reg_read(reg) for reg in
                                (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            u.mem_write(dst, bytes(u.mem_read(src, length)))
            ret()
        elif address == 0x145bcb2d0 or address == 0x145bcb530:
            vector = u.reg_read(r.UC_X86_REG_RCX)
            cap, old, length = get(vector, '<3Q')
            stride = get(u.reg_read(r.UC_X86_REG_RSP) + 0x28, '<Q')[0] if address == 0x145bcb2d0 else 32
            allocation = context['allocation']
            capacity = max(cap * 2, length + 1, 4)
            context['allocation'] += (capacity * stride + 15) & ~15
            if length:
                u.mem_write(allocation, bytes(u.mem_read(old, length * stride)))
            put(vector, '<3Q', capacity, allocation, length)
            ret()

    u.hook_add(UC_HOOK_CODE, hook)

    def reset(kind):
        u.mem_write(mem, bytes(0x400000))
        u.mem_write(stack, bytes(0x10000))
        context.clear()
        context.update(kind=kind, calls=[], allocation=mem + 0x10000)
        u.reg_write(r.UC_X86_REG_RBP, bp)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.reg_write(r.UC_X86_REG_R13, game)

    def stage(case):
        reset('stage')
        context.update(case)
        put(game + 0x304, '<B', case['class'])
        put(game + 0x538, '<I', case['remaining_bits'])
        put(game + 0x778, '<2Q', stats, len(case['stats']))
        for i, (tag, value) in enumerate(case['stats']):
            put(stats + i * 8, '<II', tag, value)
        put(game + 0x460, '<Q', 1)
        put(game + 0x47c, '<4I', case['damage_bits'], case['cooldown_before_bits'],
            case['chance_bits'], case['critical_multiplier_bits'])
        put(game + 0x958, '<4Q', *case['rng_before'])
        put(game + 0x5d0, '<3Q', 8, packets, 0)
        u.reg_write(r.UC_X86_REG_XMM6, case['delta_bits'])
        u.emu_start(STAGE[0], STAGE[1], count=20000)
        assert u.reg_read(r.UC_X86_REG_RIP) == STAGE[1]
        return dict(**case, calls=context['calls'], radius_bits=context.get('radius_bits'),
                    melee=context.get('melee'), hit=context.get('hit'),
                    remaining_after_bits=get(game + 0x538, '<I')[0],
                    rng_after=list(get(game + 0x958, '<4Q')))

    cases = []
    base = dict(remaining_bits=bits(0.), delta_bits=bits(.1), stats=[], target=True,
                damage_bits=bits(1.), cooldown_before_bits=bits(1.), cooldown_after_bits=bits(1.),
                chance_bits=bits(0.), critical_multiplier_bits=bits(2.), rng_before=[1, 2, 3, 4])
    for cls in range(13):
        cases.append(stage(dict(base, name=f'class_{cls}', **{'class': cls})))
    for name, replacement in [
        ('rank_scaling', dict(stats=[(16, bits(.05 * 5)), (17, bits(100.)), (16, bits(.04 * 5))], damage_bits=bits(1.3))),
        ('ordered_cancellation', dict(stats=[(16, bits(16777216.)), (16, bits(1.)), (16, bits(-16777216.))])),
        ('critical', dict(chance_bits=bits(1.), critical_multiplier_bits=bits(2.5), rng_before=[0x8000000000000001, 2, 3, 4])),
        ('critical_equal', dict(chance_bits=bits(0.))),
        ('critical_nan', dict(chance_bits=0x7fc00000)),
        ('no_target', dict(target=False, remaining_bits=bits(.04))),
        ('held', dict(remaining_bits=bits(.5))),
        ('exact_due', dict(remaining_bits=bits(.1))),
        ('nan_timer', dict(remaining_bits=0x7fc00000)),
        ('negative_power', dict(stats=[(16, bits(-2.))])),
        ('nan_power', dict(stats=[(16, 0x7fc00000)])),
        ('saturated_power', dict(damage_bits=bits(1.e20))),
        ('post_hit_cooldown', dict(cooldown_before_bits=bits(.81), cooldown_after_bits=bits(.25))),
        ('nan_cooldown', dict(cooldown_after_bits=0x7fc00000)),
        ('negative_cooldown', dict(cooldown_after_bits=bits(-1.))),
    ]:
        cases.append(stage(dict(base, name=name, **{'class': 1}, **replacement)))

    def candidate(guid, x, health, **kw):
        return dict(guid=guid, x=x, y=0., health_bits=bits(health), dead=False,
                    avoid_bits=bits(0.), metadata=False, flag=0, **kw)

    selector_cases = []
    queries = [
        ('near_health_before_distance', [candidate(1, 1., 100.), candidate(2, 5., 10.)]),
        ('boss_before_low_health', [candidate(1, 1., 1.), dict(candidate(2, 5., 100.), metadata=True)]),
        ('elite_before_ordinary', [candidate(1, 1., 1.), dict(candidate(2, 5., 100.), flag=1)]),
        ('avoid_last', [dict(candidate(1, 1., 1.), avoid_bits=bits(100.)), candidate(2, 5., 100.)]),
        ('avoid_equal_is_eligible', [dict(candidate(1, 1., 1.), avoid_bits=bits(10.)), candidate(2, 5., 100.)]),
        ('nan_avoid_is_eligible', [dict(candidate(1, 1., 1.), avoid_bits=0x7fc00000), candidate(2, 5., 100.)]),
        ('inclusive_range_dead_excluded', [dict(candidate(1, 1., 1.), dead=True), candidate(2, 6.01, 1.), candidate(3, 6., 20.)]),
        ('equal_health_keeps_distance', [candidate(1, 5., 100.), candidate(2, 1., 100.)]),
        ('weapon_opposite_sides_anchor', [candidate(1, -5., 100.), candidate(2, 5., 1.)]),
        ('far_ordinary_keeps_distance', [candidate(1, 7., 100.), candidate(2, 8., 1.), candidate(3, 5., 500.)]),
        ('negative_health_total_order', [candidate(1, 1., 1.), candidate(2, 5., -1.)]),
        ('nan_health_total_order', [dict(candidate(1, 1., 1.), health_bits=0x7fc00000), candidate(2, 5., 100.)]),
        ('raw_flag_two', [dict(candidate(1, 1., 1.), metadata=True), dict(candidate(2, 5., 100.), flag=2)]),
        ('long_equal_ties', [candidate(i + 1, float(i % 4 + 1), 100.) for i in range(24)]),
        ('long_mixed', [dict(candidate(i + 1, float(i % 5 + 1), float((i * 7) % 11)),
                            flag=int(i % 7 == 0), metadata=i % 13 == 0,
                            avoid_bits=bits(100. if i % 9 == 0 else 0.)) for i in range(32)]),
    ]
    for name, actors in queries:
        reset('selector')
        now, radius = 10., 10. if name.startswith('far_') else 6.
        actor_data, origin, result = mem + 0x7000, mem + 0xe000, mem + 0xf000
        put(game + 0x560, '<2Q', actor_data, len(actors))
        put(game + 0x9ec, '<f', now)
        for i, actor in enumerate(actors):
            a = actor_data + i * 352
            put(a + 24, '<q', 0 if actor['metadata'] else -1)
            put(a + 104, '<B', int(actor['dead']))
            put(a + 136, '<Q', actor['guid'])
            put(a + 240, '<I', actor['health_bits'])
            put(a + 268, '<6f', actor['x'], actor['y'], 0., actor['x'], actor['y'], 0.)
            put(a + 320, '<I', actor['avoid_bits'])
            put(a + 348, '<B', actor['flag'])
        u.reg_write(r.UC_X86_REG_RSP, sp - 8)
        put(sp - 8, '<Q', done)
        u.reg_write(r.UC_X86_REG_RCX, result)
        u.reg_write(r.UC_X86_REG_RDX, game)
        u.reg_write(r.UC_X86_REG_R8, origin)
        u.reg_write(r.UC_X86_REG_XMM3, bits(radius))
        try:
            u.emu_start(SELECTOR, done, count=100000)
        except Exception as error:
            raise RuntimeError(f"Query {name} stopped at {u.reg_read(r.UC_X86_REG_RIP):#x}") from error
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        _, pointer, count = get(result, '<3Q')
        selected = list(get(pointer, '<' + 'Q' * count)) if count else []
        selector_cases.append(dict(name=name, now_bits=bits(now), radius_bits=bits(radius),
                                   actors=actors, selected=selected))
    initial = []
    for before in (bits(7.0), bits(-3.0), 0x7fc00000):
        reset('initial')
        put(bp + 0x568, '<I', before)
        u.emu_start(0x145900998, 0x1459009a3, count=10)
        assert get(bp + 0x568, '<I')[0] == 0
        put(bp + 0xbe8, '<Q', game)
        u.emu_start(0x14590156b, 0x145901594, count=20)
        assert get(game + 0x538, '<I')[0] == 0
        initial.append(dict(before_bits=before, after_copy_bits=get(game + 0x538, '<I')[0]))
    return cases, selector_cases, initial


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rea', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('pe_inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    OUT.mkdir(parents=True, exist_ok=True)

    def span(lo, hi):
        offset = pe.rva_offset(lo - pe.image_base)
        raw = data[offset:offset + hi - lo]
        return raw, dict(start=hex(lo), end_exclusive=hex(hi), file_offset=hex(offset),
                         sha256=hashlib.sha256(raw).hexdigest())

    weapon_spans = [STAGE, (0x145904029, 0x14590404f)]
    (OUT.parent / 'weapon-stages.asm').write_text('\n'.join(objdump_output([
        'objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}',
        f'--stop-address={hi:#x}', str(TARGET.relative_to(ROOT)),
    ], cwd=ROOT, text=True) for lo, hi in weapon_spans))

    owners = []
    for name, lo in [('selector', SELECTOR), ('radius', 0x145925c80), ('rows', 0x14599eb80),
                     ('near', 0x1459adf00), ('radius-filter', 0x1459b0300),
                     ('game-constructor', 0x145900230), ('initial-stat-refresh', 0x1458f96f0)]:
        raw, record = span(lo, bounds[lo])
        (OUT / (name + '.asm')).write_text(objdump_output([
            'objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}',
            f'--stop-address={bounds[lo]:#x}', str(TARGET.relative_to(ROOT)),
        ], cwd=ROOT, text=True))
        owners.append(dict(role=name, **record, assembly=name + '.asm'))
    rea = []
    for name, lo in [('selector', SELECTOR), ('game-constructor', 0x145900230)]:
        raw, record = span(lo, bounds[lo])
        binary, output = OUT / (name + '.bin'), OUT / ('rea-' + name)
        binary.write_bytes(raw)
        if args.rea and not output.exists():
            plan = OUT / (name + '-plan.json')
            save(plan, dict(target=str(binary.relative_to(ROOT)), output=str(output.relative_to(ROOT)),
                            init_timeout=60, open_timeout=60, timeout=180,
                            open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                            operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(lo)))]))
            subprocess.run(['python3', 'scripts/rea-batch.py', str(plan.relative_to(ROOT))], cwd=ROOT, check=True)
        response = json.loads((output / '003-procedure_pseudo_code.json').read_text())['response']['result']
        evidence = response.get('structuredContent') or json.loads(response['content'][0]['text'])
        assert evidence['subject']['digest']['sha256'] == record['sha256']
        assert evidence['provider']['id'] == 'ghidra'
        (OUT / (name + '.ghidra.c')).write_text(evidence['raw_result']['value'])
        rea.append(dict(role=name, **record, evidence_id=evidence['evidence_id'], provider='Ghidra 12.1.4',
                        limitation='Headerless function import; current PE instructions determine Win64 ABI and external code/data.'))
    cases, queries, initial = vectors(pe)
    recovery = recovery_vectors(pe)
    save(OUT / 'native-fixtures.json', dict(target_sha256=SHA, swings=cases, queries=queries, initial_timer=initial,
         recovery=recovery,
         seams=['Weapon-stage vectors intercept the selector and capture melee serialization/canonical actor hit.',
                'The hit seam supplies an explicitly chosen post-hit cooldown to test synchronous stat refresh.',
                'Selector vectors execute current radius/filter/interpolation/ordering code with controlled actor records.',
                'Initial-timer vectors execute the constructor zero store and final memcpy span; intervening constructor/refresh calls are inspected statically and are not executed by those vectors.',
                'Recovery vectors execute the current ordered aura loop1458f9dd5..9e9f, add-one/reciprocal1458f9edb..9eed and weapon timer tail145902f1e..2f50. Raw recovery, aura rows and buff bonus are controlled; canonical initial-stat-refresh.asm owns the refresh extract.',
                'Allocation, capacity growth, memcpy and deallocation use explicit project-local host storage; the Windows stack probe is bypassed on mapped stack memory.',
                'No original game process, reconstructed source, MPQ geometry or graphical interaction executes.']))
    profiles = []
    for cls in range(13):
        address = struct.unpack_from('<Q', data, pe.rva_offset(0x146e7b190 + 8 * (cls - 2) - pe.image_base))[0] if 2 <= cls <= 11 else 0x146bab7a8
        raw, record = span(address, address + 16)
        enabled, damage, interval, radius = struct.unpack('<I3I', raw)
        profiles.append(dict(class_id=cls, **record, enabled=bool(enabled & 1),
                             damage_bits=damage, interval_bits=interval, radius_bits=radius))
    producer_records = []
    for key, address in [('imp_heroic', 0x146e5bc78), ('unbridled_wrath', 0x146e5cce0)]:
        raw, record = span(address, address + 120)
        key_ptr, key_len, name_ptr, name_len = struct.unpack_from('<4Q', raw)
        key_at, name_at = (pe.rva_offset(a - pe.image_base) for a in (key_ptr, name_ptr))
        assert data[key_at:key_at + key_len].decode() == key
        effects_ptr, effects_len = struct.unpack_from('<2Q', raw, 48)
        assert effects_len == 1
        effect, effect_record = span(effects_ptr, effects_ptr + 64)
        assert effect[0] == 35 and effect[8] == 16
        producer_records.append(dict(key=key, name=data[name_at:name_at + name_len].decode(),
                                     **record, effects=dict(**effect_record, raw_hex=effect.hex(),
                                     native_variant=35, stat=16, amount_bits=struct.unpack_from('<I', effect, 4)[0])))
    save(OUT / 'manifest.json', dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
         target_process_launched=False, owners=owners,
         shared_tick_spans=[dict(role='weapon-stage', **span(*STAGE)[1], assembly='../weapon-stages.asm'),
                            dict(role='weapon-miss', **span(0x145904029, 0x14590404f)[1], assembly='../weapon-stages.asm')],
         rea=rea, profiles=profiles, stat16_producers=producer_records,
         stat16_source=dict(game_rows='0x778', game_count='0x780',
                            weapon_read='0x145902ca9..0x145902d3f',
                            refresh_scratch='0x1458f97be..0x1458f9929',
                            assembly='initial-stat-refresh.asm',
                            proof='Refresh clones Game+778/+780 into a local vector at RBP+60. Temporary contributions append to that scratch vector at1458f98b0; no scratch publication writes back to Game+778/+780. The weapon stat16 read therefore uses equipped stats without temporary additions; computed general damage/recovery can still reflect temporary effects.'),
         initial_timer=dict(game_offset='0x538', bits=0, aggregate_base='rbp+0x30', store='0x145900998',
                            store_destination='rbp+0x568', final_copy='0x14590157b..0x145901594',
                            stat_refresh='0x1458f96f0',
                            proof='The constructor zeroes the timer with a qword store. Its final memcpy copies the aggregate from rbp+0x30; the intervening stat-refresh owner does not access Game+0x538.'),
         counts=dict(swings=len(cases), queries=len(queries), initial_timer=len(initial), recovery=len(recovery)),
         limits=['Controlled native-instruction vectors do not establish original/rebuilt gameplay or rendering parity.',
                 'Current stat16 producers use native variant35; existing historical catalog payloads retain variant30 provenance.',
                 'Live application integration is validated separately.']))
    print(f'{len(cases)} native weapon-stage, {len(queries)} native selector, {len(initial)} initial-timer and {len(recovery)} recovery vectors passed')


if __name__ == '__main__':
    main()
