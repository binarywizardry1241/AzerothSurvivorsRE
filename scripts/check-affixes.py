#!/usr/bin/env python3
"""Verify current affix bytes and replay bounded original instructions in synthetic memory.

No compilation, application/server launch or reconstructed Rust execution.
"""
from portable_paths import portable_json
import argparse
from bisect import bisect_right
import hashlib
import json
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script
from pathlib import Path


def shared_root():
    common = Path(subprocess.check_output(['git', 'rev-parse', '--git-common-dir'], cwd=ROOT, text=True).strip())
    if not common.is_absolute():
        common = ROOT / common
    return common.resolve().parent


PROOF = ROOT / 'docs/analysis/evidence/0.121.0/affixes/manifest.json'


def digest(value):
    return hashlib.sha256(value).hexdigest()


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    assert proof['target'] == {k: selected[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(selected)
    pe = load_script('affix_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    functions = pe.functions()
    starts = [row[0] for row in functions]
    boundaries = {}
    for row in proof['native_ranges'] + proof['native_data']:
        va = int(row['virtual_address'], 16)
        offset = pe.rva_offset(va - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert offset == int(row['file_offset'], 16)
        assert raw == bytes.fromhex(row['bytes_hex']) and digest(raw) == row['sha256']
        if 'assembly' in row:
            begin, end, _ = functions[bisect_right(starts, va - pe.image_base) - 1]
            if va - pe.image_base >= end:
                # The stackless zone-key leaf has no Windows unwind entry.
                # Its exact start is called by the current affix spawn owner.
                assert row['role'] == 'zone-key' and va == 0x145a9c190
                parent = next(value for value in proof['native_ranges'] if value['role'] == 'orb-position-and-health')
                calls = list(decoder.disasm(bytes.fromhex(parent['bytes_hex']), int(parent['virtual_address'], 16)))
                assert any(i.mnemonic == 'call' and i.op_str == hex(va) for i in calls)
            else:
                if begin not in boundaries:
                    origin = pe.image_base + begin
                    at = pe.rva_offset(begin)
                    entire = list(decoder.disasm(image[at:at + end - begin], origin))
                    boundaries[begin] = {i.address for i in entire} | {pe.image_base + end}
                assert va in boundaries[begin] and va + row['byte_count'] in boundaries[begin], row['role']
            ins = list(decoder.disasm(raw, va))
            assert sum(i.size for i in ins) == len(raw) and len(ins) == row['instruction_count']
            expected = ''.join(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip() + '\n' for i in ins)
            actual = (ROOT / row['assembly']['path']).read_bytes()
            assert digest(actual) == row['assembly']['sha256'] and actual.decode() == expected
    primary = shared_root()
    for query in proof['queries']:
        for role in ('plan', 'journal', 'result', 'raw_input'):
            row = query[role]
            assert digest((primary / row['path']).read_bytes()) == row['sha256'], row['path']
        result = json.loads((primary / query['result']['path']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert digest(native['normalized_result'].encode()) == query['normalized_text_sha256']
        verify_native_query_subject(primary, native, query, proof['target'], image=image, pe=pe)
    # The new hit gate looks up each class pool before learned/racial records.
    # Its kind and both spell IDs must correspond to the actual current table.
    catalog = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    source = {}
    for match in re.finditer(r'AbilityDefinition \{\s*key: "([^"]+)"(?P<body>.*?)school: \d+, kind: (\d+),', catalog, re.S):
        body = match['body']
        source[match[1]] = (int(re.search(r'spell_id: (\d+)', body)[1]), int(re.search(r'pulse_spell_id: (\d+)', body)[1]), int(match[3]))
    def read(address, length):
        at = pe.rva_offset(address - pe.image_base)
        return image[at:at + length]
    for index in range(113):
        row = read(0x146fc1af8 + 120 * index, 120)
        pointer, length = struct.unpack_from('<QQ', row)
        key = read(pointer, length).decode()
        assert source[key] == (struct.unpack_from('<I', row, 64)[0], struct.unpack_from('<I', row, 100)[0], row[117]), key
    for match in re.finditer(r'ClassAbilities \{ class_id: (\d+), key: "([^"]+)", starter: "[^"]+", pool: &\[(.*?)\]', catalog):
        class_id = int(match[1])
        descriptor = struct.unpack('<Q', read(0x147692c70 + 8 * (class_id - 2), 8))[0] if 2 <= class_id <= 11 else 0x146fc05a0
        pointer, length = struct.unpack('<QQ', read(descriptor + 0x30, 16))
        keys = []
        for index in range(length):
            key_pointer, key_length = struct.unpack('<QQ', read(pointer + 16 * index, 16))
            keys.append(read(key_pointer, key_length).decode())
        assert keys == re.findall(r'"([^"]+)"', match[3]), match[2]
    return image, pe


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def ensure(address, count):
        for page in range(address & -4096, (address + count + 4095) & -4096, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    for row in proof['native_ranges'] + proof['native_data']:
        va = int(row['virtual_address'], 16)
        ensure(va, row['byte_count'])
        machine.mem_write(va, bytes.fromhex(row['bytes_hex']))
    base, size = 0x22000000, 0x40000
    ensure(base, size)
    stop = base + size - 16
    for va in (0x145ade320, 0x140002200, 0x1400021c0, 0x145bcdcf0,
               0x145f994e0, 0x145f99490, 0x145febc1b, 0x145bdcb10,
               0x145b28410, 0x145be4c10, 0x145b42220):
        ensure(va, 1)
        machine.mem_write(va, b'\xc3')
    state = {}
    total_steps = 0
    counts = {}

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack('<' + fmt, *values))

    def get(address, fmt):
        return struct.unpack('<' + fmt, machine.mem_read(address, struct.calcsize('<' + fmt)))

    def setreg(name, value):
        machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def readreg(name):
        return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))

    def xmm(index, value):
        setreg('XMM' + str(index), int.from_bytes(struct.pack('<f', value) + bytes(12), 'little'))

    def scalar(index):
        return struct.unpack('<f', readreg('XMM' + str(index)).to_bytes(16, 'little')[:4])[0]

    def returned(value=None):
        if value is not None:
            setreg('RAX', value)
        sp = readreg('RSP')
        setreg('RIP', get(sp, 'Q')[0])
        setreg('RSP', sp + 8)

    def hook(_machine, address, _size, _context):
        state['steps'] += 1
        if address in state['stops']:
            state['exit'] = address
            machine.emu_stop()
        elif address == 0x145ade320:  # shared interpolated position interface
            machine.mem_write(readreg('RCX'), struct.pack('<3f', *state['position']))
            returned(readreg('RCX'))
        elif address == 0x140002200:  # allocation initialization
            returned()
        elif address == 0x1400021c0:  # successful synthetic allocator
            assert readreg('RCX') <= 0x1000
            returned(base + 0x30000)
        elif address == 0x145f994e0:  # host clock, no OS clock code executed
            setreg('RDX', 0)
            returned(0)
        elif address == 0x145f99490:  # Result<Duration> interface
            assert readreg('R8') == 0xd53e8000 and readreg('R9') == 0x19db1de
            out = readreg('RCX')
            put(out, 'B', state['duration_error'])
            put(out + 8, 'Q', state['seconds'])
            returned()
        elif address == 0x145febc1b:  # exact 448-byte configuration move
            count = readreg('R8')
            assert count == (0xd30 if state.get('again_route') else 448)
            machine.mem_write(readreg('RCX'), bytes(machine.mem_read(readreg('RDX'), count)))
            returned(readreg('RCX'))
        elif address == 0x145b28410:  # terminal result persistence, separately recovered
            assert state['again_route'] and readreg('RCX') == base
            returned()
        elif address == 0x145be4c10:  # old Game result list, explicitly empty here
            assert state['again_route']
            machine.mem_write(readreg('RCX'), bytes(24))
            returned()
        elif address == 0x145b42220:  # result serialization has no list in this fixture
            assert state['again_route']
            returned()
        elif address == 0x145bdcb10:  # run constructor, inspect captured fields
            configuration = readreg('RDX')
            state['constructor_week'] = get(configuration + 0x19c, 'I')[0]
            state['constructor_rank'] = get(configuration + 0x1bf, 'B')[0]
            state['exit'] = address
            machine.emu_stop()
        elif address == 0x145bcdcf0:  # canonical player-damage boundary
            state['raw'] = scalar(1)
            state['source'] = readreg('R8')
            state['physical'] = readreg('R9')
            returned()

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset(stops):
        machine.mem_write(base, bytes(size))
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
            setreg(name, 0)
        for index in range(16):
            setreg('XMM' + str(index), 0)
        setreg('EFLAGS', 2)
        setreg('RSP', base + 0x2e008)
        setreg('RBP', base + 0x2d000)
        put(base + 0x2e008, 'Q', stop)
        state.clear()
        state.update(stops=set(stops) | {stop}, steps=0)
        for address in state['stops']:
            ensure(address, 16)
            if not any(int(row['virtual_address'], 16) <= address < int(row['virtual_address'], 16) + row['byte_count'] for row in proof['native_ranges']):
                machine.mem_write(address, b'\xc3')

    def run(start, name):
        nonlocal total_steps
        try:
            machine.emu_start(start, stop + 1, count=10000)
        except Exception as error:
            raise AssertionError((name, hex(readreg('RIP')), state)) from error
        assert 'exit' in state, name
        total_steps += state['steps']
        counts[name] = counts.get(name, 0) + 1

    # Zero/default and exact zone strings, including collision-free length guards.
    for zone, expected in [('elwynn', 0), ('duskwood', 1), ('wsg', 2), ('ungoro', 3), ('ab', 4),
                           ('feralas', 5), ('arena', 6), ('sm', 7), ('av', 8), ('brm', 9), ('aq', 10),
                           ('naxx', 11), ('', 0), ('unknown', 0), ('NAXX', 0), ('naxxx', 0)]:
        reset([])
        machine.mem_write(base, zone.encode() + b'\0')
        setreg('RCX', base)
        setreg('RDX', len(zone))
        run(0x145a9c190, 'zone_ordinal')
        assert readreg('RAX') == expected, zone

    # Unix-epoch weeks, including pre-epoch failure and u32 truncation.
    for seconds in (0, 1, 604799, 604800, 604801, 1209599, 1209600, 2**32, 2**32 * 604800, 2**64 - 1):
        for error in (0, 1):
            reset([])
            state.update(seconds=seconds, duration_error=error)
            run(0x145ac9f90, 'current_week')
            assert readreg('RAX') == (0 if error else (seconds // 604800) & 0xffffffff)

    # The complete shared Config is copied, preserving the captured rank/week.
    for week in (0, 2964, 2**32 - 1):
        for rank in (0, 3, 5):
            reset([])
            frame = base + 0x20000
            setreg('RBP', frame)
            setreg('RBX', frame + 0xcf0)
            setreg('RDI', base + 0x1000)  # opaque existing world-resource Arc
            machine.mem_write(frame + 0xeb0, bytes(448))
            put(frame + 0xeb0 + 0x19c, 'I', week)
            put(frame + 0xeb0 + 0x1bf, 'B', rank)
            run(0x145b2d74a, 'captured_config_copy')
            assert (state['constructor_week'], state['constructor_rank']) == (week, rank)

    # Current terminal action bytes map Again/Endless/Menu to 6/8/9.
    for action, command in enumerate((6, 8, 9)):
        reset([0x1404125b0])
        setreg('RDX', base)
        put(base, 'B', action)
        run(0x1404125a0, 'terminal_action_command')
        assert readreg('RAX') == command

    # Current command6 selects its own admission case, separate from Pick11.
    for command, destination in ((6, 0x145b2a4b0), (8, 0x145b2aa47), (9, 0x145b2a4d2), (11, 0x145b2ab08)):
        reset([destination])
        setreg('RDX', base)
        put(base, 'I', command)
        run(0x145b2a453, 'terminal_command_dispatch')
        assert state['exit'] == destination

    for game_tag, cooperative in ((2, 0), (0, 0), (1, 0), (0, 1)):
        destination = 0x145b28190 if game_tag != 2 and cooperative else 0x145b2b156
        reset([destination])
        setreg('RSI', base)
        put(base + 0x10, 'I', game_tag)
        put(base + 0xd3a, 'B', cooperative)
        run(0x145b2a4b0, 'again_admission')
        assert state['exit'] == destination

    # Solo Again takes the old Game and reaches the same Config start owner.
    # Terminal persistence and old-Game result extraction are explicit seams;
    # the actual route, active-connection gate and full Game copy are executed.
    # The same 18 cases retain both week and rank (0/3/5 across Game tags).
    for game_tag in (0, 1, 2):
        for week in (0, 2964, 2**32 - 1):
            for active in (0, 1):
                reset([0x145b2d080, 0x145b2a47a, 0x145b2b55e])
                state['again_route'] = True
                setreg('RSI', base)
                put(base + 0x10, 'Q', game_tag)
                put(base + 0x17e4, 'I', week)
                rank = (0, 3, 5)[game_tag]
                put(base + 0x1807, 'B', rank)
                put(base + 0x1100, '2Q', base + 0x10000, active)
                put(base + 0x100a8, 'B', 1)
                run(0x145b2b156, 'again_retained_week')
                assert get(base + 0x17e4, 'I')[0] == week
                assert get(base + 0x1807, 'B')[0] == rank
                assert get(base + 0x10, 'Q')[0] == 2
                expected = 0x145b2a47a if game_tag == 2 else 0x145b2d080 if active else 0x145b2b55e
                assert state['exit'] == expected
                if expected == 0x145b2d080:
                    assert readreg('RDX') == base

    # The shared actor's selected target owns deferred ward effects in co-op.
    for cooperative in (0, 1):
        for active in range(5):
            for target in range(5):
                reset([0x145c1d6b0, 0x145c1dbb6])
                frame, actor = base + 0x2d000, base
                put(frame + 0x340, 'B', cooperative)
                put(frame + 0x268, 'Q', active)
                put(frame + 0x3b0, 'Q', actor)
                put(actor + 0xf8, 'Q', target)
                run(0x145c1db92, 'ward_target_context')
                assert state['exit'] == (0x145c1dbb6 if not cooperative or active == target else 0x145c1d6b0)

    # Pool expiry has priority; inclusive tick boundary advances by stored+1.
    for now in (0.0, 0.999, 1.0, 1.001, 14.0, 15.0, 16.0):
        reset([0x145c28a12, 0x145c28ac0, 0x145c28a51])
        pool, frame = base, base + 0x2d000
        setreg('RAX', pool)
        put(frame + 0x7c, 'f', now)
        put(pool + 0x18, '2f', 15.0, 1.0)
        xmm(10, 1.0)
        run(0x145c28a2b, 'pool_deadline')
        expected = 0x145c28ac0 if now >= 15 else 0x145c28a51 if now >= 1 else 0x145c28a12
        assert state['exit'] == expected
        assert get(pool + 0x1c, 'f')[0] == (2.0 if 1 <= now < 15 else 1.0)

    # The heal reaches only positive missing HP, never exceeds max, no healer log.
    for health, maximum in [(0., 100.), (50., 100.), (95., 100.), (100., 100.), (110., 100.), (-5., 100.)]:
        for dead in (0, 1):
            reset([0x145c28c10, 0x145c28bd0, 0x145c28c84])
            setreg('RAX', base)
            put(base + 0xb0, 'I', dead)
            put(base + 0x160, '2f', health, maximum)
            xmm(6, 0.1)
            xmm(8, 0.0)
            run(0x145c28c26, 'pool_heal')
            expected = health if dead else health + max(0.0, min(maximum * 0.1, maximum - health))
            assert get(base + 0x160, 'f')[0] == expected

    # Bolstering recipient gates, cap10 and exact additive-stack ratio/scale.
    for stacks in range(12):
        for distance in (0.0, 12.0, 12.001):
            reset([0x145c1730b, 0x145c17408])
            actor, out, frame = base, base + 0x10000, base + 0x2d000
            setreg('RBX', actor + 0x1e0)
            setreg('RDI', 1)
            setreg('R14', frame + 0x160)
            put(actor + 0x18, 'Q', 2**64 - 1)
            put(actor + 0x58, 'Q', 2**64 - 1)
            put(actor + 0xd0, 'I', 2**32 - 1)
            put(actor + 0xf0, 'Q', 2)
            put(actor + 0x160, '3f', 100.0, 200.0, 30.0)
            put(actor + 0x178, 'f', 1.0)
            put(actor + 0x1d9, 'B', stacks)
            state['position'] = (distance, 0.0, 0.0)
            xmm(7, 0.0)
            xmm(9, 0.0)
            xmm(14, 144.0)
            xmm(15, struct.unpack('<f', bytes.fromhex('6666863f'))[0])
            run(0x145c17329, 'bolstering_stack')
            applied = stacks < 10 and distance <= 12.0
            assert state['exit'] == (0x145c17408 if applied else 0x145c1730b), (stacks, distance, state)
            assert get(actor + 0x1d9, 'B')[0] == stacks + int(applied)
            health, maximum, damage = get(actor + 0x160, '3f')
            if applied:
                expected = (1 + (stacks + 1) * 0.2) / (1 + stacks * 0.2)
                assert abs(health - 100 * expected) < 0.0001
                assert abs(maximum - 200 * expected) < 0.0002
                assert abs(damage - 30 * expected) < 0.0001
                assert get(actor + 0x178, 'f')[0] == struct.unpack('<f', bytes.fromhex('6666863f'))[0]
            else:
                assert (health, maximum, damage) == (100.0, 200.0, 30.0)

    # Exact enum mask and maxHP/5 cap, including the zero-before-minimum gate.
    for kind in range(14):
        for power in (0.0, 1.0, 15.0, 100.0):
            reset([0x145c19aa6, 0x145c160f7])
            descriptor, actor = base, base + 0x1000
            setreg('RSI', descriptor)
            setreg('R12', actor)
            setreg('RBX', 0x1e0)
            put(descriptor + 0x75, 'B', kind)
            put(actor + 0x164, 'f', 50.0)
            xmm(8, power)
            run(0x145c1609b, 'orb_direct_gate')
            rejected = kind in (2, 3, 8, 10, 11) or power == 0.0
            assert state['exit'] == (0x145c19aa6 if rejected else 0x145c160f7)
            if not rejected:
                assert scalar(8) == min(power, 10.0)

    # Pool targets admit live bosses/guardians/horde, excluding special wards.
    for distance in (0.0, 6.0, 6.001):
        for dead in (0, 1):
            for ward_kind in (2**32 - 1, 0, 3):
                reset([])
                actor, iterator, out = base + 0x1000, base + 0x2000, base + 0x2100
                clock, center = base + 0x2200, base + 0x2210
                put(actor + 0xb0, 'B', dead)
                put(actor + 0xd0, 'I', ward_kind)
                put(actor + 0xf0, 'Q', 77)
                put(actor + 0x188, '2f', distance, 0.0)
                put(actor + 0x198, 'f', 0.0)
                put(clock, 'f', 2.0)
                put(center, '3f', 0.0, 0.0, 0.0)
                put(iterator, '4Q', actor, actor + 0x1e0, clock, center)
                setreg('RCX', out)
                setreg('RDX', iterator)
                run(0x145c7da10, 'pool_targets')
                admitted = not dead and ward_kind == 2**32 - 1 and distance <= 6.0
                assert get(out + 0x10, 'Q')[0] == int(admitted)
                if admitted:
                    assert get(get(out + 8, 'Q')[0], 'Q')[0] == 77

    # Active ID2 alone arms/spawns an orb, with no independent RNG for rotation.
    for active in ([], [0, 1], [2], [1, 2]):
        for deadline in (0.0, 39.0, 40.0, 41.0):
            reset([0x145c295cc, 0x145c29258])
            game, ids, frame = base, base + 0x1000, base + 0x2d000
            setreg('RSI', game)
            machine.mem_write(ids, bytes(active) or b'\0')
            put(game + 0x838, '2Q', ids, len(active))
            put(game + 0xcdc, 'f', deadline)
            put(frame + 0x7c, 'f', 40.0)
            run(0x145c291e9, 'orb_deadline')
            expected = deadline if 2 not in active else 80.0 if deadline == 0.0 else 55.0 if deadline <= 40.0 else deadline
            assert get(game + 0xcdc, 'f')[0] == expected
            assert state['exit'] == (0x145c29258 if 2 in active and 0 < deadline <= 40 else 0x145c295cc)

    # Actual spawned template12 supplies entry/display/scale to the UNIT creator.
    for template in (12, 13, 255):
        for serial in (0, 2**24 - 1, 2**32 - 1):
            reset([0x145be8dd5])
            game = base
            setreg('RSI', game)
            setreg('R8', template)
            put(game + 0xca4, 'I', serial)
            xmm(6, 100.0)
            run(0x145be8d58, 'orb_unit_template')
            assert readreg('R8') == 9612 and readreg('R9') == 16111
            expected_guid = 0xf130000000000000 | (9612 << 24) | ((serial + 1) & 0xffffff)
            assert readreg('RDX') == expected_guid
            assert scalar(7) == struct.unpack('<f', bytes.fromhex('6666663f'))[0]

    # Native expiry compensates reduction before the real incoming owner.
    for armor in (0.0, 0.25, 0.9, 0.95, 1.0):
        for mode in (0, 1, 2):
            reset([0x145c2250f])
            game, frame = base, base + 0x2d000
            setreg('RDX', game)
            setreg('R13', 99)
            put(frame + 0x3a8, 'Q', game)
            put(game + 0xd2f, 'B', mode)
            put(game + 0x4c8, 'f', 100.0)
            put(game + 0x4e8, 'f', armor)
            xmm(6, 0.4)
            xmm(11, 1.0)
            run(0x145c224d0, 'orb_expiry_damage')
            if mode == 1:
                assert state['source'] == 99 and state['physical'] == 0
                assert abs(state['raw'] - 40.0 / max(1.0 - armor, 0.1)) < 0.001
            else:
                assert 'raw' not in state

    return dict(original_instruction_cases=counts, original_instruction_steps=total_steps,
                fixture_seams=['interpolated actor position', 'allocator', 'canonical player damage', 'SystemTime and duration', '448-byte Config / 3376-byte Game memcpy', 'run constructor', 'terminal result persistence and empty old-Game result extraction'])


def source_check(proof, source_root=None):
    import platform
    root = (source_root or ROOT) / 'crates/azeroth-survivors-re/src'
    scopes = proof['implemented_source_scopes']
    assert scopes and len(scopes) == len(set(scopes))
    assert scopes[0] == 'selection'
    assert set(scopes) <= {'selection', 'bolstering', 'sanguine', 'explosive'}
    paths = list(dict.fromkeys(path for scope in scopes for path in proof['source_scope_paths'][scope]))
    assert set(paths) == set(proof['source_paths'])
    source = {name: (root / name).read_text() for name in paths}
    mechanics = source['gameplay/mechanics.rs']
    affixes = source['gameplay/mechanics/affixes.rs']
    assert 'mod affixes;' in mechanics and 'affixes: affixes::State' in mechanics
    assert 'affixes: affixes::State::default()' in mechanics
    assert 'pub fn configure_heroic_affixes' in affixes and 'pub fn active_affix_ids' in affixes
    assert 'heroic::affix_ids(rank, selector)' in affixes
    assert '(duration.as_secs() / 604_800) as u32' in source['heroic/affix_calendar.rs']
    assert 'heroic::zone_selector(self.zone.key, week_discriminator)' in affixes
    if 'bolstering' in scopes:
        assert 'affix_death(guid, position' in mechanics
        assert mechanics.count('affixes: &mut self.affixes') == 3
        assert all('affixes: &mut self.affixes' in source['gameplay/mechanics/' + name + '.rs'] for name in ('raid_hits', 'demons', 'incoming'))
        assert 'self.bolstered_scale(guid)' in mechanics
        assert 'self.affixes.retire(guid)' in source['gameplay/mechanics/actor_frame.rs']
        assert 'self.affixes.active.contains(&0)' in affixes
        assert 'row.actor.damage *= ratio' in affixes and 'state.scale *= 1.05' in affixes
    if 'sanguine' in scopes:
        assert 'bolstering' in scopes  # shared live death adapter is already connected
        assert 'tick_affix_pools();' in mechanics
        assert 'self.boss_state.allocate_affix_marker()' in affixes
        assert 'self.effects.raid_areas.allocate_marker_id()' in source['gameplay/mechanics/bosses.rs']
        assert 'elite && self.affixes.active.contains(&1)' in affixes
        assert 'pool.next_tick += 1.0' in affixes and 'fn heal_pool' in affixes
    if 'explosive' in scopes:
        assert 'tick_affix_orbs(player, world);' in mechanics
        assert 'request.template.min(12)' in source['bosses/raid_wards.rs']
        assert 'entry: 9612, display: 16111' in source['bosses/raid_wards.rs']
        assert 'damage::apply_hit_with_cap' in source['gameplay/mechanics/wards.rs']
        assert 'RunEvent::Notification(text)' in source['gameplay/client/events.rs']
        assert 'self.with_party_hero(slot' in source['gameplay/mechanics/wards.rs']
        assert 'self.coop.targets.get(&action.guid)' in source['gameplay/mechanics/wards.rs']
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin', ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = shared_root() / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    for name, text in source.items():
        parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'], input=text, text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (name, parsed.stderr)
    return dict(source_connections_checked=True, implemented_source_scopes=scopes, syntax_files=len(source),
                source_receipts={str(Path('crates/azeroth-survivors-re/src') / name): digest(text.encode()) for name, text in source.items()})


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--manifest', type=Path, default=PROOF,
                        help='Explicit scoped manifest snapshot for source-only commit review')
    parser.add_argument('--source-root', type=Path,
                        help='Explicit source snapshot root; native evidence always uses the owning checkout')
    args = parser.parse_args()
    manifest = args.manifest.resolve()
    if args.source_root is not None:
        args.source_root = args.source_root.resolve()
        assert args.source_root.is_relative_to(shared_root())
    assert manifest.is_relative_to(shared_root())
    proof = json.loads(manifest.read_text())
    verify(proof)
    result = replay(proof)
    result.update(source_check(proof, args.source_root))
    result.update(target_sha256=proof['target']['sha256'], native_ranges=len(proof['native_ranges']),
                  native_data=len(proof['native_data']), retained_queries_verified=len(proof['queries']), current_ability_kind_rows=113, current_class_pools=9,
                  compilation='not_run', runtime='not_run', parity='unverified')
    if args.write:
        (manifest.parent / 'static-check.json').write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
