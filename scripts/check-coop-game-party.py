#!/usr/bin/env python3
"""Verify current party evidence and replay native target/revive branches.

No Rust compilation, networking, game, renderer or OS API executes. The native
collector's allocator and initialization barrier are explicit fixture seams.
"""
import hashlib
import itertools
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
EVIDENCE = ROOT / 'docs/analysis/evidence/0.115.0/coop-game-party'


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('party_check_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA
    for row in manifest['functions'] + manifest['data_ranges']:
        start, size = int(row['start'], 16), row['byte_count']
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert hashlib.sha256(data[offset:offset + size]).hexdigest() == row['sha256']
    for name, digest in manifest['extracts'].items():
        assert hashlib.sha256((EVIDENCE / name).read_bytes()).hexdigest() == digest, name
    imports = pe.imports()
    for key in ['native_round_import', 'native_ceil_import']:
        row = manifest[key]
        thunk, iat = int(row['thunk'], 16), int(row['iat'], 16)
        offset = pe.rva_offset(thunk - pe.image_base)
        assert data[offset:offset + 2] == b'\xff\x25'
        assert thunk + 6 + struct.unpack_from('<i', data, offset + 2)[0] == iat
        imported = next(library['functions'][(iat - int(library['iat_start_address'], 16)) // 8]
            for library in imports if int(library['iat_start_address'], 16) <= iat <
                int(library['iat_start_address'], 16) + len(library['functions']) * 8)
        assert imported == row['name']
    # Reuse the existing bounded native-memory harness, not another game path.
    native = load_script('party_native_harness', ROOT / 'scripts/check-coop-ui.py')

    class Probe(native.Native):
        def hook(self, cpu, pc, size, extra):
            if pc in (0x140002200, 0x1400021C0, 0x145D14A10):
                if pc == 0x1400021C0:
                    self.reg('RAX', self.alloc(self.reg('RCX')))
                elif pc == 0x145D14A10:
                    vector = self.reg('RCX')
                    capacity, length = self.q(vector), self.q(vector + 16)
                    pointer = self.alloc(max(8, capacity * 2) * 8)
                    self.cpu.mem_write(pointer, bytes(self.cpu.mem_read(self.q(vector + 8), length * 8)))
                    self.put(vector, max(8, capacity * 2), pointer, length)
                stack = self.reg('RSP')
                self.reg('RIP', self.q(stack))
                self.reg('RSP', stack + 8)
                return
            return super().hook(cpu, pc, size, extra)

    def put_float(probe, address, *values):
        probe.cpu.mem_write(address, struct.pack('<' + 'f' * len(values), *values))

    cases = []
    collector = Probe(data, pe, [(0x1459CC920, 0x1459CCAE6)], [0x140002200, 0x1400021C0, 0x145D14A10])
    base = collector.HEAP
    output, iterator, rows, local, position = (base + n for n in (0, 0x100, 0x1000, 0x2000, 0x2100))
    stack, stop = base + 0x40000, base + 0x50000
    collector.stop = stop
    fixtures = [[], [(0., 0., 1)], [(3., 4., 1)], [(5.001, 0., 1)],
                [(3., 4., 0), (-3., -4., 1), (0., 0., 1), (6., 0., 1)],
                [(0., 0., 1), (3., 4., 1), (-3., -4., 1), (4., 3., 1), (-4., -3., 1)]]
    for values in fixtures:
        for own_slot in range(len(values) + 1):
            collector.cursor = base + 0x60000
            collector.put(iterator, rows, rows + len(values) * 16, 0, local, position)
            collector.put(local, own_slot)
            put_float(collector, position, 0., 0., 1000.)
            for index, (x, y, active) in enumerate(values):
                collector.cpu.mem_write(rows + index * 16, struct.pack('<fffB3x', x, y, -1000., active))
            collector.put(stack, stop)
            for name, value in [('RSP', stack), ('RCX', output), ('RDX', iterator)]:
                collector.reg(name, value)
            collector.run(0x1459CC920)
            actual = [collector.q(collector.q(output + 8) + i * 8) for i in range(collector.q(output + 16))]
            expected = [i for i, (x, y, active) in enumerate(values)
                        if i != own_slot and active == 1 and f32(f32(x * x) + f32(y * y)) <= 25.]
            assert actual == expected, (values, own_slot, actual, expected)
            cases.append(dict(kind='revive-helpers', slots=len(values), own=own_slot, selected=actual))

    update = Probe(data, pe, [(0x1458F74F0, 0x1458FB2EC)])
    base = update.HEAP
    state, enemy, rows, frame, stack, delta = (base + n for n in (0, 0x2000, 0x3000, 0x10000, 0x40000, 0x50000))
    # Real instructions choose a native index from actual active-position rows.
    for positions in [(10., 8.), (10., 7.), (10., 6.999), (10., 6.), (4., -4.), (1., 20.)]:
        for states, current in itertools.product([(1, 1), (1, 0), (0, 1), (0, 0)], [0, 1, 99]):
            update.cpu.mem_write(state, bytes(0xD00))
            update.cpu.mem_write(enemy, bytes(0x1E0))
            update.put(state + 0x578, enemy, 1)
            update.put(state + 0x9F8, rows, 2)
            put_float(update, state + 0xB9C, 10.)
            update.put(enemy + 0xF8, current)
            put_float(update, enemy + 0x19C, 12.)
            for index, (x, active) in enumerate(zip(positions, states)):
                update.cpu.mem_write(rows + index * 16, struct.pack('<fffB3x', x, 0., 0., active))
            for name, value in [('R13', state), ('RBP', frame), ('RSP', stack)]:
                update.reg(name, value)
            update.stop = 0x1458F788F
            update.run(0x1458F75B5)
            eligible = [i for i, active in enumerate(states) if active]
            expected = current
            if eligible:
                nearest = min(eligible, key=lambda i: positions[i] ** 2)
                threshold = f32(f32(f32(positions[current] ** 2) * f32(.7)) * f32(.7)) if current < 2 else 0.
                if current not in eligible or f32(positions[nearest] ** 2) < threshold:
                    expected = nearest
            assert update.q(enemy + 0xF8) == expected, (positions, states, current, expected)
            cases.append(dict(kind='target-selection', x=positions, active=states, previous=current, selected=expected))

    for elapsed, step, helpers in itertools.product([0., .25, 3., 5.75, 6.], [.25, 1.], [0, 1, 4]):
        update.put(frame + 0x1330, helpers)
        update.put(frame - 0x58, delta)
        put_float(update, state + 0xC28, elapsed)
        put_float(update, delta, step)
        for name, value in [('R13', state), ('RBP', frame), ('RSP', stack)]:
            update.reg(name, value)
        expected = f32(elapsed + step) if helpers else max(0., f32(elapsed - step))
        update.stop = 0x1458F8B5D if expected >= 6. else 0x1458F8967
        update.run(0x1458F8924)
        actual = struct.unpack('<f', update.cpu.mem_read(state + 0xC28, 4))[0]
        assert actual == expected, (elapsed, step, helpers, actual, expected)
        cases.append(dict(kind='revive-clock', elapsed=elapsed, step=step, helpers=helpers,
                          result=actual, completion=expected >= 6.))

    sanitizer = Probe(data, pe, [(0x1459E6CB0, 0x1459E6EFC)])
    base = sanitizer.HEAP
    text, vector, destination, stack, stop = (base + n for n in (0, 0x1000, 0x2000, 0x40000, 0x50000))
    sanitizer.stop = stop
    for value in ['', 'name', '\t,;=', '\n\r ', 'é,中;🙂=\t', '\0name',
                  ''.join(map(chr, range(128))), 'αβγ\tЖ']:
        encoded = value.encode()
        sanitizer.cpu.mem_write(text, encoded or b'\0')
        sanitizer.put(vector, 4096, destination, 0)
        sanitizer.put(stack, stop)
        for name, number in [('RCX', text), ('RDX', text + len(encoded)), ('R8', vector), ('RSP', stack)]:
            sanitizer.reg(name, number)
        sanitizer.run(0x1459E6CB0)
        actual = bytes(sanitizer.cpu.mem_read(destination, sanitizer.q(vector + 16))).decode()
        expected = ''.join(' ' if char in '\t,;=' else char for char in value)
        assert actual == expected, (value, actual, expected)
        cases.append(dict(kind='addon-sanitize', input=value, output=actual))

    sorter = Probe(data, pe, [(0x1458A24B0, 0x1458A2574)])
    base = sorter.HEAP
    pointers, rows, stack, stop = (base + n for n in (0, 0x1000, 0x40000, 0x50000))
    sorter.stop = stop
    for damages in [[0.], [1., 10.], [10., 1.], [1., 1.], [2., 0., 2., 9., 0.],
                    [0., -0., -1., 1.], [100., 0., 2., 0., 100.], [float('nan'), 2., float('inf')]]:
        for index, damage in enumerate(damages):
            sorter.put(pointers + index * 8, rows + index * 80)
            sorter.cpu.mem_write(rows + index * 80 + 0x30, struct.pack('<d', damage))
        sorter.put(stack, stop)
        for name, number in [('RCX', pointers), ('RDX', len(damages)), ('R8', 1), ('RSP', stack)]:
            sorter.reg(name, number)
        sorter.run(0x1458A24B0)
        actual = [(sorter.q(pointers + index * 8) - rows) // 80 for index in range(len(damages))]
        def total_order(value):
            signed = struct.unpack('<q', struct.pack('<d', value))[0]
            return signed ^ ((signed >> 63) & 0x7FFFFFFFFFFFFFFF)
        expected = sorted(range(len(damages)), key=lambda i: total_order(damages[i]), reverse=True)
        assert actual == expected, (damages, actual, expected)
        cases.append(dict(kind='party-damage-sort', rows=len(damages), indices=actual))

    # Native add-hero admission, before any clone/allocation/bootstrap owner.
    admission = Probe(data, pe, [(0x145900890, 0x145900B22)])
    state = admission.HEAP
    for count, active, phase in itertools.product(range(6), [0, 1], range(6)):
        admission.put(state + 0x988, count)
        admission.cpu.mem_write(state + 0xC41, bytes([active]))
        other_phase = 1 if phase == 0 else 0
        admission.cpu.mem_write(state + 0xC46,
            bytes([other_phase, phase] if active else [phase, other_phase]))
        admission.reg('RCX', state)
        admitted = count <= 3 and phase == 0
        admission.stop = 0x145900948 if admitted else 0x1459008EE
        admission.run(0x1459008CD)
        cases.append(dict(kind='remote-hero-admission', remote_count=count,
                          previously_cooperative=active, phase=phase, admitted=admitted))
    state = update.HEAP
    for active, (clock, previous) in itertools.product([0, 1],
            [(0., 0.), (.9, 0.), (1., 0.), (2., 1.), (2., 1.1), (.5, 1.), (20., 0.), (20., 19.)]):
        update.cpu.mem_write(state + 0xC41, bytes([active]))
        put_float(update, state + 0xB9C, clock)
        put_float(update, state + 0xC20, previous)
        update.reg('R13', state)
        capture = active != 0 and f32(f32(clock) - f32(previous)) >= 1.
        update.stop = 0x1458FA9ED if capture else 0x1458FAF2E
        update.run(0x1458FA9B4)
        actual = struct.unpack('<f', update.cpu.mem_read(state + 0xC20, 4))[0]
        assert actual == f32(clock if capture else previous)
        cases.append(dict(kind='party-meter-capture', cooperative=active, clock=clock,
                          previous=previous, captured=capture))

    swap = Probe(data, pe, [(0x145920ED0, 0x1459221F9)])
    game, remote, stack, stop = (swap.HEAP + n for n in (0, 0x2000, 0x40000, 0x50000))
    swap.stop = stop
    for seed in range(16):
        original_game = bytes((index * 29 + seed * 17) & 255 for index in range(0xD00))
        original_remote = bytes((index * 13 + seed * 37 + 7) & 255 for index in range(0x980))
        swap.cpu.mem_write(game, original_game)
        swap.cpu.mem_write(remote, original_remote)
        def execute_swap():
            swap.put(stack, stop)
            for name, value in [('RCX', game), ('RDX', remote), ('RSP', stack)]:
                swap.reg(name, value)
            swap.run(0x145920ED0)
        execute_swap()
        actual = bytes(swap.cpu.mem_read(game, 0xD00))
        # The actual enemy vector, shared hazard queues, RNG, clock, party
        # storage and active index never move into the remote hero record.
        for first, last in [(0x570, 0x588), (0x5A0, 0x5E8), (0xBCC, 0xBD0),
                            (0x978, 0x990), (0xAE8, 0xB08), (0xB40, 0xB60),
                            (0xB9C, 0xBA0), (0xC41, 0xC43), (0xC47, 0xC48)]:
            assert actual[first:last] == original_game[first:last], (seed, hex(first))
        assert actual[0x1B0:0x568] == original_remote[0x1B0:0x568]
        assert actual[0xC46] == original_remote[0x97C]
        assert actual[0xC28:0xC2C] == original_remote[0x968:0x96C]
        execute_swap()
        assert bytes(swap.cpu.mem_read(game, 0xD00)) == original_game
        assert bytes(swap.cpu.mem_read(remote, 0x980)) == original_remote
        cases.append(dict(kind='hero-state-swap', seed=seed, shared_regions_preserved=True, involution=True))

    schedule = Probe(data, pe, [(0x1458F74F0, 0x1458FB2EC)])
    game, rows = schedule.HEAP, schedule.HEAP + 0x2000
    for count in range(1, 6):
        for active, previous in itertools.product(range(1 << count), range(count)):
            flags = [(active >> index) & 1 for index in range(count)]
            schedule.put(game + 0x9F8, rows, count)
            schedule.put(game + 0xB48, previous)
            for index, flag in enumerate(flags):
                schedule.cpu.mem_write(rows + index * 16 + 12, bytes([flag]))
            schedule.reg('R13', game)
            selected = next(((previous + step) % count for step in range(1, count + 1)
                             if flags[(previous + step) % count]), None)
            schedule.stop = 0x1458F9671 if selected is None else 0x1458F920C
            schedule.run(0x1458F90B2)
            if selected is not None:
                assert schedule.reg('RDX') == selected, (flags, previous, selected, schedule.reg('RDX'))
            cases.append(dict(kind='world-schedule', active=flags, previous=previous, selected=selected))

    hazard = Probe(data, pe, [(0x145922F90, 0x145928348)])
    game, record, actors = (hazard.HEAP + n for n in (0, 0x2000, 0x3000))
    for cooperative, slot, target, exists in itertools.product([0, 1], range(5), range(5), [False, True]):
        hazard.cpu.mem_write(game + 0xC41, bytes([cooperative]))
        hazard.put(game + 0xB40, slot)
        hazard.put(game + 0x578, actors, int(exists))
        hazard.put(record, 100)
        hazard.put(actors + 0xF0, 100, target)
        for name, value in [('RDI', game), ('RCX', record)]:
            hazard.reg(name, value)
        admitted = not cooperative or (target if exists else 0) == slot
        hazard.stop = 0x1459231DF if admitted else 0x145923AFB
        hazard.run(0x145923166)
        cases.append(dict(kind='hazard-source-owner', cooperative=cooperative, slot=slot,
                          source_target=target, source_exists=exists, admitted=admitted))

    class RewardProbe(Probe):
        zone = 0
        def hook(self, cpu, pc, size, extra):
            if pc in (0x1458095E0, 0x145D1463D):
                if pc == 0x1458095E0:
                    self.reg('RAX', self.zone)
                else:
                    value = struct.unpack('<f', struct.pack('<I', self.reg('XMM0') & 0xFFFFFFFF))[0]
                    rounded = math.floor(value + 0.5) if value >= 0 else math.ceil(value - 0.5)
                    self.reg('XMM0', struct.unpack('<I', struct.pack('<f', rounded))[0])
                stack = self.reg('RSP')
                self.reg('RIP', self.q(stack))
                self.reg('RSP', stack + 8)
                return
            return super().hook(cpu, pc, size, extra)
    reward = RewardProbe(data, pe, [(0x145920470, 0x1459205C1)], [0x1458095E0, 0x145D1463D])
    game, queue, stack = (reward.HEAP + n for n in (0, 0x2000, 0x40008))
    reward.stop = 0x1458092F0  # ordinary coinage publication follows the tested arithmetic
    for zone, living, multiplier, amount in itertools.product([0, 2, 3, 11], [1, 2, 5], [0.5, 1., 2.], [1, 2, 100]):
        reward.zone = zone
        reward.cpu.mem_write(game, bytes(0xD00))
        reward.cpu.mem_write(game + 0xC41, b'\x01')
        reward.put(game + 0x9A8, 8, queue, 0)
        reward.put(game + 0xB40, 2)
        reward.put(game + 0xB50, living)
        put_float(reward, game + 0x4C0, multiplier)
        for name, value in [('RCX', game), ('RDX', amount), ('RSP', stack)]:
            reward.reg(name, value)
        reward.run(0x145920470)
        coefficient = f32(0.7) if zone < 3 else 1.
        divisor = f32(f32(f32(living - 1) * coefficient) * f32(0.6))
        factor = f32(1. / f32(divisor + 1.))
        expected = math.floor(f32(f32(amount * multiplier) * factor) + 0.5)
        assert struct.unpack('<I', reward.cpu.mem_read(game + 0x500, 4))[0] == expected
        assert struct.unpack('<I', reward.cpu.mem_read(game + 0x7AC, 4))[0] == expected
        assert reward.q(game + 0x9B8) == 1 and reward.q(queue) == 2
        assert struct.unpack('<I', reward.cpu.mem_read(queue + 8, 4))[0] == amount
        cases.append(dict(kind='raw-shared-reward', zone=zone, living=living, multiplier=multiplier,
                          raw=amount, credited=expected))

    # Three real initial-HP producers use the same living-hero/zone factors.
    # Zone lookup is the explicit existing enum seam; no constructor/RNG runs.
    def health_factors(zone, living):
        extra = f32(f32(living - 1) * (f32(0.7) if zone < 3 else 1.))
        return [f32(f32(extra * f32(value)) + 1.) for value in (0.9, 1.3)]

    def xmm(probe, index, value):
        probe.reg(f'XMM{index}', struct.unpack('<I', struct.pack('<f', value))[0])

    def scalar(probe, index):
        return struct.unpack('<f', struct.pack('<I', probe.reg(f'XMM{index}') & 0xFFFFFFFF))[0]

    initial_hp = RewardProbe(data, pe, [(0x14594BC00, 0x14594C9AA),
        (0x14594DF00, 0x14594E874), (0x145983510, 0x145983909)], [0x1458095E0])
    game, stack = initial_hp.HEAP, initial_hp.HEAP + 0x40008
    producers = [('ordinary', 0x14594E36A, 0x14594E3DE, 13, 0),
                 ('boss', 0x14594BE6C, 0x14594BFD9, 3, 1),
                 ('guardian', 0x145983718, 0x145983784, 12, 1)]
    for zone, living, cooperative in itertools.product([0, 2, 3, 11], range(1, 6), [0, 1]):
        initial_hp.zone = zone
        initial_hp.put(game + 0xB50, living)
        initial_hp.cpu.mem_write(game + 0xC41, bytes([cooperative]))
        for kind, start, stop, result, index in producers:
            initial_hp.reg('RSI', game)
            initial_hp.reg('RBX', zone)
            initial_hp.reg('RSP', stack)
            xmm(initial_hp, result, 1.)
            initial_hp.stop = stop
            initial_hp.run(start)
            expected = health_factors(zone, living)[index] if cooperative else 1.
            assert scalar(initial_hp, result) == expected, (kind, zone, living, cooperative)
            cases.append(dict(kind='initial-party-health', producer=kind, zone=zone,
                              living=living, cooperative=cooperative, factor=expected))

    rescale = Probe(data, pe, [(0x1459011A0, 0x145901A09)])
    game, actor = rescale.HEAP, rescale.HEAP + 0x2000
    for zone, previous, living in itertools.product([0, 2, 3, 11], range(1, 6), range(1, 6)):
        old, new = health_factors(zone, previous), health_factors(zone, living)
        rescale.reg('XMM6', struct.unpack('<Q', struct.pack('<ff', *old))[0])
        rescale.reg('RAX', zone)
        rescale.reg('RSI', game)
        rescale.put(game + 0xB50, living)
        ratio = [f32(new[index] / old[index]) for index in range(2)]
        changed = any(abs(f32(value - 1.)) >= f32(0.0001) for value in ratio)
        rescale.stop = 0x1459016A7 if changed else 0x145901941
        rescale.run(0x145901604)
        assert [scalar(rescale, 7), scalar(rescale, 8)] == ratio
        cases.append(dict(kind='disconnect-health-factors', zone=zone, previous=previous,
                          living=living, ratio=ratio, changed=changed))

    for lane, value in itertools.product([0, 1], [1., 1.00001, 1.0000999, 1.0001, 0.9999, 0.99990004, float('nan')]):
        ratio = [1., 1.]
        ratio[lane] = f32(value)
        rescale.reg('XMM6', struct.unpack('<Q', struct.pack('<ff', 1., 1.))[0])
        xmm(rescale, 7, ratio[0])
        xmm(rescale, 8, ratio[1])
        changed = not all(abs(f32(value - 1.)) < f32(0.0001) for value in ratio)
        rescale.stop = 0x1459016A7 if changed else 0x145901941
        rescale.run(0x14590165D)
        cases.append(dict(kind='disconnect-health-epsilon', lane=lane, ratio=str(value), changed=changed))

    for membership, ratio, vitals in itertools.product(
            [(-1, -1), (0, -1), (-1, 0), (0, 0)], [0.1, 0.25, 0.5, 1., 2.],
            [(0., 100.), (-1., 100.), (float('nan'), 100.), (0.4, 0.8),
             (40.8, 100.2), (120., 100.), (float('inf'), 100.), (1., float('nan'))]):
        health, maximum = map(f32, vitals)
        rescale.cpu.mem_write(actor, bytes(0x1E0))
        rescale.put(actor + 0x18, membership[0])
        rescale.put(actor + 0x58, membership[1])
        put_float(rescale, actor + 0x160, health, maximum)
        factor = f32(ratio if membership == (-1, -1) else ratio * 0.75)
        for index, value in [(6, 0.), (7, ratio), (8, ratio * 0.75), (9, 1.)]:
            xmm(rescale, index, value)
        rescale.reg('R12', actor + 0x1E0)
        rescale.reg('R15', actor + 0x1E0)
        rescale.stop = 0x1459017AB if health > 0. else 0x145901739
        rescale.run(0x145901720)
        actual = struct.unpack('<ff', rescale.cpu.mem_read(actor + 0x160, 8))
        if health > 0.:
            expected_max = f32(maximum * factor)
            expected_max = expected_max if expected_max > 1. else 1.
            expected_hp = max(1., f32(health * factor))
            expected = (min(expected_max, expected_hp), expected_max)
        else:
            expected = (health, maximum)
        assert all(a == e or math.isnan(a) and math.isnan(e) for a, e in zip(actual, expected)), (membership, ratio, vitals, actual, expected)
        cases.append(dict(kind='disconnect-actor-health', membership=membership, ratio=ratio,
                          vitals=[str(value) for value in vitals], result=[str(value) for value in actual]))

    pause = Probe(data, pe, [(0x14591A310, 0x14591A46E)])
    game = pause.HEAP
    for cooperative, phase in itertools.product([0, 1], range(6)):
        pause.cpu.mem_write(game + 0xC41, bytes([cooperative]))
        pause.cpu.mem_write(game + 0xC46, bytes([phase]))
        pause.reg('RCX', game)
        accepted = phase == 1 and cooperative == 0
        pause.stop = 0x14591A34F if accepted else 0x14591A426
        pause.run(0x14591A32B)
        actual = bytes(pause.cpu.mem_read(game + 0xC46, 1))[0]
        assert actual == (3 if accepted else phase)
        cases.append(dict(kind='cooperative-pause-gate', cooperative=cooperative, phase=phase, accepted=accepted))

    phase_probe = Probe(data, pe, [(0x1458F74F0, 0x1458FB2EC)])
    game, phases, frame = (phase_probe.HEAP + n for n in (0, 0x2000, 0x10000))
    for count in range(1, 4):
        for values in itertools.product(range(6), repeat=count):
            phase_probe.cpu.mem_write(phases, bytes(values))
            phase_probe.put(frame - 0x58, phases, count)
            phase_probe.cpu.mem_write(game + 0xC47, b'\x01')
            phase_probe.reg('RBP', frame)
            phase_probe.reg('R13', game)
            expected = 1 if any(value in (1, 2) for value in values) else 5 if 5 in values else 4
            phase_probe.stop = {1: 0x1458F9E30, 5: 0x1458F9BD8, 4: 0x1458F9BCF}[expected]
            phase_probe.run(0x1458F9B71)
            assert bytes(phase_probe.cpu.mem_read(game + 0xC47, 1))[0] == expected
            cases.append(dict(kind='shared-terminal-fold', phases=values, shared_phase=expected))

    continuation = Probe(data, pe, [(0x1458FEFF0, 0x1458FF2CF), (0x145903B80, 0x145903CF8)])
    game = continuation.HEAP
    for cooperative, phase in itertools.product([0, 1], range(6)):
        continuation.cpu.mem_write(game + 0xC41, bytes([cooperative]))
        continuation.cpu.mem_write(game + 0xC47, bytes([phase]))
        continuation.reg('RCX', game)
        accepted = cooperative == 1 and phase == 5
        continuation.stop = 0x1458FF02C if accepted else 0x1458FF283
        continuation.run(0x1458FF00F)
        cases.append(dict(kind='cooperative-endless-admission', cooperative=cooperative, phase=phase, accepted=accepted))
    for health in [-1., 0., 1., float('nan')]:
        continuation.cpu.mem_write(game + 0xC46, b'\x05')
        put_float(continuation, game + 0x4F8, health)
        continuation.reg('R14', game)
        down = health <= 0.
        continuation.stop = 0x1458FF04B if down else 0x1458FF03C
        continuation.run(0x1458FF02C)
        assert bytes(continuation.cpu.mem_read(game + 0xC46, 1))[0] == (4 if down else 5)
        cases.append(dict(kind='cooperative-endless-health', health=str(health), down=down))
    for phase in range(6):
        continuation.cpu.mem_write(game + 0xC46, bytes([phase]))
        continuation.cpu.mem_write(game + 0xC34, b'\0')
        put_float(continuation, game + 0xB9C, 123.)
        continuation.reg('RCX', game)
        continuation.stop = 0x145903BD8 if phase == 5 else 0x145903CE9
        continuation.run(0x145903B9B)
        assert bytes(continuation.cpu.mem_read(game + 0xC46, 1))[0] == (1 if phase == 5 else phase)
        if phase == 5:
            assert bytes(continuation.cpu.mem_read(game + 0xC34, 1)) == b'\x01'
            assert struct.unpack('<f', continuation.cpu.mem_read(game + 0xBF8, 4))[0] == 423.
        cases.append(dict(kind='hero-endless-transition', phase=phase))

    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/game_party.rs').read_text()
    colors = json.loads((EVIDENCE / 'hud-class-colors.json').read_text())
    assert colors['target_sha256'] == SHA
    for row in colors['rows']:
        descriptor = int(row['descriptor'], 16)
        offset = pe.rva_offset(descriptor + 0x50 - pe.image_base)
        pointer, length = struct.unpack_from('<QQ', data, offset)
        text_offset = pe.rva_offset(pointer - pe.image_base)
        assert data[text_offset:text_offset + length].decode() == row['color']
        assert row['color'] in source
    for required in ['REVIVE_SECONDS: f32 = 6.0', 'REVIVE_RADIUS_SQUARED: f32 = 25.0',
                     'RETARGET_FACTOR: f32 = 0.7', 'hero.max_health * 0.5',
                     'immunity_spell: 1020', 'immunity_expires: clock + 2.0',
                     'hero.damage.round()', 'damage.total_cmp', 'row.helper == local_slot']:
        assert required in source, required
    simulation = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs').read_text()
    for required in ['credit_pickup_experience', 'distribute_party_rewards', 'schedule_party_world',
                     'with_party_hero', 'apply_replica_native', 'self.clock += delta',
                     'self.coop.live_heroes', 'hero.state.swap(self)', 'game.dead = false',
                     'pub fn coop_hud', 'pub fn apply_replica_hud', 'pub fn replica_hud',
                     'rescale_party_actor_health(previous)', 'rescaled_health_fields',
                     '[extra * 0.9 + 1.0, extra * 1.3 + 1.0]']:
        assert required in simulation, required
    for name, required in {
        'gameplay/run_hud/view.rs': ['BarKey::ReplicaRow', 'hud.get("bosses")', 'hud.get("abilities")', 'hud.get("jewelry")'],
        'gameplay/meter/view.rs': ['fn replica_rows', 'hud.get("meter")', 'hud.get("healing")', 'hud.get("bossMeter")'],
        'gameplay/mechanics/demons.rs': ['self.replica_hud()', 'hud.get("timers")'],
    }.items():
        presentation = (ROOT / 'crates/azeroth-survivors-re/src' / name).read_text()
        for fragment in required:
            assert fragment in presentation, (name, fragment)
    result = dict(target_sha256=SHA, cases=cases, source_guarded=True,
                  compilation_run=False, target_executed=False, parity_verified=False,
                  limits='Bounded original-instruction replay with allocation seams; no Rust or live simulation/network proof.')
    output = ROOT / 'runtime/coop-game-party-0.115.0/check-results.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + '\n')
    print(f'{len(cases)} native party state/target/revive/reward/hazard/pause/terminal cases pass; source guards and evidence hashes pass.')
    print('Compilation, live co-op, rendering and original/rebuilt parity remain unverified.')


if __name__ == '__main__':
    main()
