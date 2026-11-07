#!/usr/bin/env python3
"""Check current Empowerment upgrade supports, eligibility and ordinary apply.

Bounded original instruction replay, with the shared exact-target mapped-image
VM. No compiler or game process. Only current offered kinds1/4 are applied.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse
import hashlib
import json
import struct

import native_talent_fixture as n

ROOT = n.ROOT
SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
BASE = ROOT/'docs/analysis/evidence/demonic-empowerment'
OUT = BASE/'upgrade-flow-cases.json'


def f32(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def from_bits(value):
    return struct.unpack('<f', struct.pack('<I', value))[0]


def magnitude(kind, rarity, cooldown, duration):
    if kind == 1:
        room = max(f32(f32(cooldown+f32(-0.2))/f32(0.8)), 0.0)
        return f32(room*f32([0.07, 0.10, 0.13, 0.17, 0.23][rarity]))
    room = max(f32(f32(6.0-duration)/5.0), 0.0)
    return f32(room*f32([0.15, 0.22, 0.3, 0.4, 0.6][rarity]))


def recover():
    if n.target['sha256'] != SHA:
        raise ValueError('Exact current target required')
    manifest = json.loads((BASE/'manifest.json').read_text())
    for row in manifest['ranges']:
        if row['role'] not in ['eligible-upgrades', 'upgrade-supports', 'ordinary-upgrade-apply', 'upgrade-magnitude']:
            continue
        offset = n.pe.rva_offset(int(row['address'], 16)-n.pe.image_base)
        if hashlib.sha256(n.data[offset:offset+row['byte_count']]).hexdigest() != row['sha256']:
            raise ValueError('Current native upgrade range drift')
        for field in ['assembly', 'pseudocode']:
            if field in row and hashlib.sha256((BASE/row[field]).read_bytes()).hexdigest() != row[field+'_sha256']:
                raise ValueError('Current upgrade canonical extraction drift')
    vm = n.Machine()

    def put_float(address, value):
        vm.u.mem_write(address, struct.pack('<f', value))

    def get_float(address):
        return struct.unpack('<f', vm.u.mem_read(address, 4))[0]

    def instance(state, rank=1, count=0):
        address = vm.alloc(128);vm.put(address, 0x146bf88e0)
        for at in [0x10, 0x14, 0x1c, 0x20, 0x38, 0x3c, 0x44, 0x48, 0x50]:
            put_float(address+at, 1.0)
        vm.u.mem_write(address+8, struct.pack('<I', rank));put_float(address+12, 0.75)
        put_float(address+0x14, state['cooldown']);put_float(address+0x20, state['duration'])
        put_float(address+0x3c, state['talent_cooldown']);put_float(address+0x48, state['talent_duration'])
        for tag in [1, 4]:
            vm.u.mem_write(address+0x24+tag*4, struct.pack('<I', count))
        return address

    supports = []
    for kind in range(5):
        supported = bool(vm.call(0x1458967f0, 0x146bf88e0, kind)&255)
        if supported != (kind in [1, 4]):
            raise ValueError('Current Empowerment supports drift')
        supports.append(dict(kind=kind, supported=supported))

    neutral = dict(cooldown=1.0, duration=1.0, talent_cooldown=1.0, talent_duration=1.0, global_cooldown=1.0)
    states = [dict(neutral, name='neutral'), dict(neutral, name='equal-uptime', duration=2.0),
        dict(neutral, name='below-uptime', duration=from_bits(bits(2.0)-1)),
        dict(neutral, name='above-uptime', duration=from_bits(bits(2.0)+1)),
        dict(neutral, name='global-equal', global_cooldown=0.5),
        dict(neutral, name='global-below', global_cooldown=from_bits(bits(0.5)-1)),
        dict(neutral, name='global-above', global_cooldown=from_bits(bits(0.5)+1)),
        dict(neutral, name='equipped-equal', talent_cooldown=0.5),
        dict(neutral, name='equipped-duration-equal', talent_duration=2.0),
        dict(neutral, name='cooldown-saturated', cooldown=0.2, global_cooldown=100.0),
        dict(neutral, name='duration-saturated', duration=6.0, global_cooldown=100.0)]
    inputs = [(state, rarity) for state in states for rarity in range(5)]
    for rarity in range(5):
        threshold_cd = f32(f32(0.2)+f32(f32(f32(0.005)*f32(0.8))/f32([0.07, 0.10, 0.13, 0.17, 0.23][rarity])))
        threshold_duration = f32(6.0-f32(f32(f32(0.005)*5.0)/f32([0.15, 0.22, 0.3, 0.4, 0.6][rarity])))
        for delta in [-1, 0, 1]:
            inputs.append((dict(neutral, name=f'cooldown-threshold-{delta}', cooldown=from_bits(bits(threshold_cd)+delta), global_cooldown=100.0), rarity))
            inputs.append((dict(neutral, name=f'duration-threshold-{delta}', duration=from_bits(bits(threshold_duration)+delta), global_cooldown=100.0), rarity))
    eligible = []
    for state, rarity in inputs:
        value = instance(state);global_context = vm.alloc(16);put_float(global_context+8, state['global_cooldown'])
        timing = vm.alloc(16);vm.put(timing, value, global_context)
        rarity_ptr = vm.alloc(8);vm.put(rarity_ptr, rarity)
        increment = vm.alloc(16);vm.put(increment, value, rarity_ptr)
        targets = vm.alloc(8);vm.put(targets, value)
        captures = vm.alloc(40);vm.put(captures, value, timing, timing, targets, increment)
        kinds = vm.alloc(2);vm.u.mem_write(kinds, bytes([1, 4]));iterator = vm.alloc(16);vm.put(iterator, kinds, kinds+2)
        actual = []
        for _ in range(3):
            kind = vm.call(0x145896530, iterator, captures)&255
            if kind == 255:
                break
            actual.append(kind)
        duration = f32(f32(f32(8.0*f32(1.4))*state['duration'])*state['talent_duration'])
        cooldown = f32(f32(f32(f32(16.0*f32(1.4))*state['cooldown'])*state['talent_cooldown'])*state['global_cooldown'])
        cooldown = max(cooldown, 0.25)
        expected = [] if duration >= cooldown else [kind for kind in [1, 4]
            if magnitude(kind, rarity, state['cooldown'], state['duration']) >= f32(0.005)]
        if actual != expected:
            raise ValueError(('Current upgrade eligibility mismatch', state, rarity, actual, expected))
        eligible.append(dict(state, rarity=rarity, offered=actual))

    apply = []
    for initial_rank in [1, 2, 100, 0xffffffff]:
        for kinds in [[1], [4], [1, 4]]:
            for rarity in range(5):
                initial_count = 0xffffffff if initial_rank == 0xffffffff else 3
                state = dict(neutral, cooldown=0.6, duration=1.5)
                address = instance(state, initial_rank, initial_count);put_float(address+0x10, 1.25)
                choices = vm.alloc(len(kinds));vm.u.mem_write(choices, bytes(kinds))
                frame = vm.S+0x80000;vm.put(frame+0x2b8, choices)
                for reg, value in [(n.UC_X86_REG_RDI, address), (n.UC_X86_REG_RSI, len(kinds)),
                    (n.UC_X86_REG_RBP, frame), (n.UC_X86_REG_R12, rarity), (n.UC_X86_REG_RSP, vm.S+0x180000)]:
                    vm.u.reg_write(reg, value)
                vm.u.emu_start(0x1459673e9, 0x145967665, count=10000)
                rank = initial_rank;power = 1.25;cooldown = f32(0.6);duration = 1.5;counts = {1: initial_count, 4: initial_count}
                for kind in kinds:
                    rank = (rank+1)&0xffffffff
                    amount = magnitude(kind, rarity, cooldown, duration)
                    if kind == 1:
                        cooldown = f32(cooldown-amount)
                    else:
                        duration = f32(duration+amount)
                    counts[kind] = (counts[kind]+1)&0xffffffff
                    growth = f32(1.0+f32(f32(0.04)/f32(1.0+f32(f32(max(rank-2, 0))*f32(0.125)))))
                    power = f32(power*growth)
                actual = dict(rank=struct.unpack('<I', vm.u.mem_read(address+8, 4))[0],
                    remaining_bits=bits(get_float(address+12)), power_bits=bits(get_float(address+16)),
                    cooldown_bits=bits(get_float(address+20)), duration_bits=bits(get_float(address+32)),
                    counts=[struct.unpack('<I', vm.u.mem_read(address+0x24+kind*4, 4))[0] for kind in [1, 4]])
                expected = dict(rank=rank, remaining_bits=bits(0.75), power_bits=bits(power),
                    cooldown_bits=bits(cooldown), duration_bits=bits(duration), counts=[counts[1], counts[4]])
                if actual != expected:
                    raise ValueError(('Current ordinary upgrade apply mismatch', initial_rank, kinds, rarity, actual, expected))
                apply.append(dict(initial_rank=initial_rank, initial_count=initial_count, kinds=kinds, rarity=rarity, **actual))
    return dict(target_sha256=SHA, version='0.112.0', supports_cases=supports, eligible_cases=eligible, apply_cases=apply,
        limits=['Current Empowerment descriptor, offered kinds1/4 and explicit finite states only; no complete dispatch-domain claim.',
                'Original accept-loop replay starts in a controlled native register/frame context and stops before downstream reward/UI work.',
                'No compiler, game process or original/rebuilt comparison.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__);parser.add_argument('--write', action='store_true')
    args = parser.parse_args();result = recover();serialized = json.dumps(result, indent=2)+'\n'
    if args.write:
        OUT.write_text(serialized)
    elif OUT.read_text() != serialized:
        raise ValueError('Missing/stale current upgrade-flow fixtures')
    print(f"{len(result['supports_cases'])} supports, {len(result['eligible_cases'])} eligibility and {len(result['apply_cases'])} ordinary apply cases pass; no build or game run.")


if __name__ == '__main__':
    main()
