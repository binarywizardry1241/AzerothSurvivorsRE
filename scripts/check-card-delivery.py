#!/usr/bin/env python3
"""Check current AS card command append, cursor and local dispatch; no build/game."""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, file_sha256
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
KEEP = ROOT/'docs/analysis/evidence/0.113.2/card-delivery'
PROBE = ROOT/'runtime/q41-card-delivery-0.113.2/rea'
SOURCE = ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs'
RANGES = [(0x1400dd4a0, 0x1400dd55b), (0x14586b5f5, 0x14586b700),
          (0x14586b700, 0x14586b717), (0x14586b7e0, 0x14586b7f7),
          (0x14586bda0, 0x14586bdbf), (0x14587df8c, 0x14587dfba),
          (0x14587e30c, 0x14587e333), (0x14587e42e, 0x14587e44a),
          (0x14596f15c, 0x14596f18b), (0x14597116b, 0x145971187),
          (0x1459729a0, 0x1459729b3)]


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def derive():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.113.2'
    image = target_bytes(target)
    pe = load_script('card_delivery_pe', ROOT/'scripts/inventory-executable.py').PE(image)

    def raw(a, n):
        at = pe.rva_offset(a-pe.image_base)
        assert at is not None
        return image[at:at+n]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly, ranges = [], []
    for a, z in RANGES:
        instructions = list(decoder.disasm(raw(a, z-a), a))
        assert sum(i.size for i in instructions) == z-a
        assembly.extend(f'{i.address:x}: {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
        ranges.append(dict(start_preferred_va=hex(a), end_exclusive_preferred_va=hex(z),
                           file_offset=hex(pe.rva_offset(a-pe.image_base)), sha256=hashlib.sha256(raw(a, z-a)).hexdigest()))
    table = 0x147018628
    assert [table+n for n in struct.unpack('<2i', raw(table, 8))] == [0x14587e30c, 0x14587e42e]
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva']+max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size+4095)&~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base+section['rva'], image[section['raw_offset']:section['raw_offset']+section['raw_size']])
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x100000); u.mem_map(stack, 0x100000); u.mem_map(done, 4096)
    shared, rows, server, frame = mem, mem+0x1000, mem+0x20000, mem+0x40000
    allowed, endpoint, trace = [], done, []

    def reg(name, value=None):
        key = getattr(r, 'UC_X86_REG_'+name)
        if value is None: return u.reg_read(key)
        u.reg_write(key, value)

    def q(a): return struct.unpack('<Q', u.mem_read(a, 8))[0]

    def ret():
        sp = reg('RSP'); reg('RIP', q(sp)); reg('RSP', sp+8)

    def hook(_, a, n, unused):
        if a in (endpoint, done): u.emu_stop(); return
        if a == 0x140cf3150:
            reg('RAX', shared); reg('RDX', 1); ret(); return
        if a == 0x145cf998b:
            c, d, length = reg('RCX'), reg('RDX'), reg('R8')
            u.mem_write(c, bytes(u.mem_read(d, length))); reg('RAX', c); ret(); return
        if a in (0x145cf8e50, 0x145860920): ret(); return
        if a in (0x14596f110, 0x1459729a0):
            assert reg('RCX') == server+0x10
            trace.append([2, reg('RDX')] if a == 0x14596f110 else [3, None]); ret(); return
        assert any(first <= a and a+n <= last for first, last in allowed), f'Unadmitted operation {a:#x}'

    u.hook_add(UC_HOOK_CODE, hook)

    def call(a, c, d):
        sp = stack+0x80008
        u.mem_write(sp, struct.pack('<Q', done)); reg('RSP', sp); reg('RCX', c); reg('RDX', d)
        u.emu_start(a, 0, count=10000)
        assert reg('RIP') == done

    append_cases, cursor_cases = [], []
    for prefix in [0, 1, 3]:
        for commands in [[], [(2, 0)], [(2, 3), (3, 0)], [(3, 0), (2, 1)]]:
            u.mem_write(shared, bytes(0x100)); u.mem_write(shared+0x28, struct.pack('<QQQ', 64, rows, prefix))
            retained = bytes((i*17+3)&255 for i in range(prefix*232)); u.mem_write(rows, retained or b'\0')
            payloads = []
            for tag, index in commands:
                payload = bytearray((i*29+tag)&255 for i in range(232))
                struct.pack_into('<I', payload, 0, tag); struct.pack_into('<Q', payload, 8, index)
                u.mem_write(mem+0x10000, bytes(payload)); payloads.append(bytes(payload))
                allowed, endpoint = [(0x1400dd4a0, 0x1400dd55b)], done
                call(0x1400dd4a0, shared, mem+0x10000)
            assert q(shared+0x38) == prefix+len(commands)
            assert bytes(u.mem_read(rows, (prefix+len(commands))*232)) == retained+b''.join(payloads)
            append_cases.append([prefix, list(map(list, commands))])
            for offset, payload in enumerate(payloads):
                row = rows+(prefix+offset)*232
                allowed, endpoint = [(0x14586b6ab, 0x14586b6e5)], 0x14586b6e5
                reg('RDX', row); reg('RDI', rows+(prefix+len(commands))*232)
                reg('RBP', frame); reg('R12', frame+0x18c); reg('R13', frame+0x188)
                reg('RSP', stack+0x80008)
                u.emu_start(0x14586b6ab, 0, count=100)
                assert reg('RIP') == endpoint and reg('R15') == row+232
                assert bytes(u.mem_read(frame+0x188, 232)) == payload
                cursor_cases.append([prefix+offset, payload[:16].hex()])

    dispatch_cases = []
    for length in range(5):
        for commands in itertools.product([(2, 0), (2, 0xffffffffffffffff), (3, 0)], repeat=length):
            for present in [False, True]:
                trace = []
                u.mem_write(server+0x10, struct.pack('<I', 0 if present else 2))
                for tag, index in commands:
                    u.mem_write(mem+0x10000, struct.pack('<I4xQ', tag, index)+bytes(216))
                    allowed, endpoint = [(0x14587df60, 0x14587dfdb), (0x14587e30c, 0x14587e333),
                                         (0x14587e42e, 0x14587e44a)], done
                    call(0x14587df60, server, mem+0x10000)
                expected = [[tag, index if tag == 2 else None] for tag, index in commands] if present else []
                assert trace == expected
                dispatch_cases.append([list(commands), present, trace])

    observations, profile = [], None
    for path in sorted(PROBE.glob('0*.json')):
        envelope = json.loads(path.read_text())
        evidence = envelope.get('response', {}).get('result', {}).get('structuredContent', {})
        if 'evidence_id' not in evidence: continue
        assert evidence['subject']['digest']['sha256'] == SHA
        profile = profile or evidence['analysis_profile']; assert evidence['analysis_profile'] == profile
        value = evidence['normalized_result']
        if evidence['operation'] == 'read_bytes':
            args = evidence['parameters']; assert value['bytes_hex'] == raw(int(args['address'],16), args['length']).hex()
            value = dict(matched_installed_bytes=True)
        else:
            assert value['status'] == 'decoded'
            value = {key: value[key] for key in ['address', 'status', 'mnemonic', 'flow']}
        observations.append(dict(artifact=commitment(path), evidence_id=evidence['evidence_id'], operation=evidence['operation'], parameters=evidence['parameters'], result=value))
    assert len(observations) == 18 and json.loads((PROBE/'run.json').read_text())['failure'] is None
    source = SOURCE.read_text(); controls = source.split('fn controls(',1)[1].split('const CHOICE_OPENING_SECONDS',1)[0]
    assert controls.count('game.choose(index)') == 1 and 'for action in actions' in controls
    assert controls.index('if let Some(index) = selected') < controls.index('keyboard_choice_actions') < controls.index('for action in actions')
    assert 'game.choose' not in controls.split('if let Some((_, began)) = opened.closing',1)[1].split('let age =',1)[0]
    assert 'opened.renewal_pending = true' in controls
    animation = ROOT/'crates/azeroth-survivors-re/src/gameplay/native_overlays.rs'
    assert 'super::CHOICE_EXIT_SECONDS' in animation.read_text()
    return dict(schema_version=1, target={key:target[key] for key in ['version','path','sha256','size_bytes']},
        generator=commitment(ROOT/'scripts/check-card-delivery.py'), lead_ids=['Q41-S01','Q41-M03'], gap_ids=[41],
        native_ranges=ranges, assembly='delivery.asm', command_table=dict(address=hex(table), bytes_hex=raw(table,8).hex(), targets=['0x14587e30c','0x14587e42e']),
        append_cases=append_cases, cursor_cases=cursor_cases, dispatch_cases=len(dispatch_cases), dispatch_output_sha256=hashlib.sha256(json.dumps(dispatch_cases,separators=(',',':')).encode()).hexdigest(),
        source=commitment(SOURCE), animation_source=commitment(animation), rea=dict(profile=profile, plan=commitment(PROBE/'plan.json'), seed_rows=(ROOT/'runtime/q41-card-delivery-0.113.2/seeds.tsv').read_text().splitlines(), observations=observations),
        limits=['Original append/cursor/dispatch instructions execute with synthetic shared resource, spare vector capacity, server Option and command payloads.',
                'Lock acquisition, byte-copy, stack probe, command drop and final accept/reroll callees are explicit fixture seams. Handler seams record order/arguments without simulating acceptance effects.',
                'Actual acceptance/completion and reroll admission retain their separately bound native contracts; source transactions are traced, not executed.',
                'The local path is selected after the separate cooperative interception boundary declines. No co-op behavior or transport is implemented.',
                'No worker/packet latency or global resource alias/lifetime closure is inferred. No build, Rust test execution, game or parity comparison ran.']), ''.join(assembly)


def main():
    parser=argparse.ArgumentParser(description=__doc__); parser.add_argument('--write',action='store_true'); args=parser.parse_args()
    proof, assembly=derive()
    if args.write:
        KEEP.mkdir(parents=True,exist_ok=True); (KEEP/'proof.json').write_text(portable_json(proof,indent=2)+'\n'); (KEEP/'delivery.asm').write_text(assembly)
    else:
        assert portable_record(json.loads((KEEP/'proof.json').read_text()))==portable_record(proof); assert (KEEP/'delivery.asm').read_text()==assembly
    print(f"Card delivery: {len(proof['append_cases'])} append, {len(proof['cursor_cases'])} cursor and {proof['dispatch_cases']} dispatch cases pass; no compiler/game")


if __name__=='__main__': main()
