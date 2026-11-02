#!/usr/bin/env python3
"""Replay service31/32 and their shared peer flags; never compile or use sockets."""
import hashlib
import itertools
import json
import platform
import re
from pathlib import Path
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path[:0] = [str(ROOT / 'runtime/tests/query-python-deps'),
                str(ROOT / 'runtime/armory-recovery/python-libs')]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as reg

PROOF = ROOT / 'docs/analysis/evidence/0.120.2/service-peer-flags/core.json'
SESSION = 'crates/azeroth-survivors-re/src/coop/session.rs'
WIRE = 'crates/azeroth-survivors-re/src/coop/directory_wire.rs'
DIRECTORY = 'crates/azeroth-survivors-re/src/coop_directory.rs'
RUNTIME = 'crates/azeroth-survivors-re/src/coop_runtime.rs'
PRESENTATION = 'crates/azeroth-survivors-re/src/gameplay/coop_reconnection.rs'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def check_evidence(proof, image, pe):
    def verify(record):
        assert digest((ROOT / record['path']).read_bytes()) == record['sha256'], record['path']
    predecessor = json.loads((ROOT / proof['reused_native_manifest']).read_text())
    assert all(predecessor['target'][k] == v for k, v in proof['target'].items())
    roles = {'outer-control-parser-prefix', 'control-guest-flag', 'control-host-flag'}
    count = 0
    lifetime = json.loads((PROOF.parent / 'lifetime.json').read_text())
    assert lifetime['target'] == proof['target']
    for row in proof['native_ranges'] + lifetime['native_ranges'] + [r for r in predecessor['native_ranges'] if r['role'] in roles]:
        start, end = int(row.get('virtual_address') or row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert offset == int(row['file_offset'], 16)
        assert len(raw) == row['byte_count'] and digest(raw) == row['sha256']
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        assert sum(i.size for i in instructions) == len(raw)
        assert len(instructions) == row['instruction_count']
        verify(row['assembly'])
        actual = '\n'.join(line.rstrip() for line in (ROOT / row['assembly']['path']).read_text().splitlines()
                           if not line.startswith(';'))
        expected = '\n'.join(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip()
                             for i in instructions)
        assert actual == expected
        count += len(instructions)
    table = lifetime['guest_vtable']
    offset = pe.rva_offset(int(table['virtual_address'], 16) - pe.image_base)
    raw = image[offset:offset + table['byte_count']]
    assert digest(raw) == table['sha256']
    assert [hex(value[0]) for value in struct.iter_unpack('<Q', raw)] == table['qwords']
    assert table['qwords'][int(table['close_slot_offset'], 16) // 8] == table['close_target']
    queries = proof['queries'] + lifetime['queries'] + [lifetime['canonical_service_pump']]
    for query in queries:
        for key in ('plan', 'journal', 'result'):
            verify(query[key])
        saved = json.loads((ROOT / query['result']['path']).read_text())
        ev = saved.get('structuredContent') or json.loads(saved['content'][0]['text'])
        assert ev['subject']['digest']['sha256'] == proof['target']['sha256']
        assert ev['evidence_id'] == query['evidence_id']
        normalized = ev['normalized_result']
        # Earlier shared receipts hash canonical JSON; this task's compact
        # receipts hash the literal text. The complete result bytes are bound
        # independently above in either format.
        assert query['normalized_sha256'] in {
            digest(normalized.encode()),
            digest(json.dumps(normalized, sort_keys=True, separators=(',', ':')).encode()),
        }
    return count, len(queries)


def replay(image, pe):
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, length in [(0x145e0b000, 0x2000), (0x147677000, 0x1000),
                            (0x145bf7000, 0x2000), (0x145c03000, 0x3000),
                            (0x145b08000, 0x2000)]:
        cpu.mem_map(address, length)
        offset = pe.rva_offset(address - pe.image_base)
        cpu.mem_write(address, image[offset:offset + length])
    base = 0x200000000
    cpu.mem_map(base, 0x10000)
    # Ghidra getters use an Arc/Mutex and the process panic counter. Only the
    # uncontended lock path is selected; the hash seam supplies bucket zero.
    cpu.mem_map(0x148534000, 0x1000)
    def put(address, value):
        cpu.mem_write(address, struct.pack('<Q', value))
    def byte(address, value):
        cpu.mem_write(address, bytes([value]))
    def get(address):
        return struct.unpack('<Q', cpu.mem_read(address, 8))[0]
    stack, data, output, service = base + 0x7000, base + 0x1000, base + 0x2000, base + 0x3000
    handle, table, sentinel = base + 0x4000, base + 0x5000, base + 0xf000
    put(0x148534b78, base + 0x6000)
    stopped = False
    retry_states = []
    aggregate_emitted = False
    instructions = 0
    def hook(machine, pc, size, unused):
        nonlocal stopped, instructions, aggregate_emitted
        if pc in (sentinel, 0x145e0c18a, 0x145bf7b02, 0x145bf7d02, 0x145bf8f4e):
            stopped = True
            machine.emu_stop()
        elif pc == 0x145c03fe6:
            machine.reg_write(reg.UC_X86_REG_RAX, 0)
            machine.reg_write(reg.UC_X86_REG_RIP, pc + 5)
        elif pc in (0x145b088a1, 0x145b08932):
            ordinal = machine.reg_read(reg.UC_X86_REG_RCX)
            machine.reg_write(reg.UC_X86_REG_RAX,
                              retry_states[ordinal][pc == 0x145b08932])
            machine.reg_write(reg.UC_X86_REG_RIP, pc + 2)
        elif pc in (0x145b08949, 0x145b089af):
            aggregate_emitted = pc == 0x145b08949
            stopped = True
            machine.emu_stop()
        else:
            instructions += 1
    cpu.hook_add(UC_HOOK_CODE, hook)
    initial = cpu.context_save()
    def start(address):
        nonlocal stopped
        stopped = False
        cpu.emu_start(address, sentinel, count=1000)
        # Unicorn's end address may stop before the sentinel hook.
        assert stopped or cpu.reg_read(reg.UC_X86_REG_RIP) == sentinel
    def setup():
        cpu.context_restore(initial)
        cpu.mem_write(base, bytes(0x10000))
        put(0x148534b78, base + 0x6000)
        cpu.reg_write(reg.UC_X86_REG_RSP, stack)
        put(stack, sentinel)
    cases = 0
    for tag, peer, suffix in itertools.product((31, 32), (0, 1, 255, 256, 0xffffffff),
                                               (b'', b'\0', bytes(range(32)))):
        message = bytes([tag]) + struct.pack('<I', peer) + suffix
        for length in list(range(5)) + [len(message)]:
            setup()
            cpu.mem_write(data, message)
            cpu.reg_write(reg.UC_X86_REG_RCX, output)
            cpu.reg_write(reg.UC_X86_REG_RDX, data)
            cpu.reg_write(reg.UC_X86_REG_R8, length)
            start(0x145e0b690)
            assert get(output) == ((1 << 63) + tag - 20 if length >= 5 else (1 << 64) - 1)
            if length >= 5:
                assert get(output + 8) & 0xffffffff == peer
            cases += 1
    for tag, active, alive, previous in itertools.product((31, 32), (0, 1), (0, 1), (0, 1)):
        setup()
        cpu.reg_write(reg.UC_X86_REG_RBP, stack)
        cpu.reg_write(reg.UC_X86_REG_R12, service)
        put(stack + 0x280, (1 << 63) + tag - 20)
        byte(service + 0x1e0, active)
        byte(service + 0x1e2, previous)
        start(0x145bf7add)
        assert cpu.mem_read(service + 0x1e2, 1)[0] == (tag == 31 and active)
        assert cpu.mem_read(service + 0x1e0, 1)[0] == active
        cpu.reg_write(reg.UC_X86_REG_RCX, table)
        cpu.reg_write(reg.UC_X86_REG_R10, 0)
        byte(table - 8, alive)
        byte(table - 7, previous)
        start(0x145bf7cea)
        assert cpu.mem_read(table - 7, 1)[0] == (tag == 31)
        assert cpu.mem_read(table - 8, 1)[0] == alive
        cases += 2
    for enabled, flag in itertools.product((0, 1), repeat=2):
        setup()
        put(handle, service)
        byte(handle + 8, enabled)
        byte(service + 0x1fa, flag)
        cpu.reg_write(reg.UC_X86_REG_RCX, handle)
        start(0x145c05020)
        assert cpu.reg_read(reg.UC_X86_REG_RAX) & 255 == (enabled and flag)
        cases += 1
    for present, matches, alive, flag in itertools.product((0, 1), repeat=4):
        setup()
        put(handle, service)
        put(handle + 8, 77)
        put(service + 0x198, table)
        put(service + 0x1a0, 15)
        put(service + 0x1b0, present)
        cpu.mem_write(table, bytes([0]) + b'\xff' * 15)
        put(table - 48, 77 if matches else 78)
        byte(table - 8, alive)
        byte(table - 7, flag)
        cpu.reg_write(reg.UC_X86_REG_RCX, handle)
        start(0x145c03f90)
        assert cpu.reg_read(reg.UC_X86_REG_RAX) & 255 == (present and matches and alive and flag)
        cases += 1
    for guest, alive_a, alive_b, flag_a, flag_b in itertools.product((0, 1), repeat=5):
        setup()
        cpu.reg_write(reg.UC_X86_REG_RBX, service)
        byte(service + 0x1e2, guest)
        put(service + 0x180, table)
        put(service + 0x198, 2)
        cpu.mem_write(table, b'\0\0' + b'\xff' * 14)
        for slot, alive, flag in ((0, alive_a, flag_a), (1, alive_b, flag_b)):
            byte(table - slot * 48 - 8, alive)
            byte(table - slot * 48 - 7, flag)
            put(table - slot * 48 - 32, 1234)
        start(0x145bf8ed2)
        assert cpu.mem_read(service + 0x1e2, 1)[0] == 0
        for slot, alive in ((0, alive_a), (1, alive_b)):
            assert cpu.mem_read(table - slot * 48 - 8, 2) == bytes([alive, 0])
            assert get(table - slot * 48 - 32) == 1234
        cases += 1
    # Native host +40 aggregation has asymmetric edges: rising accepts any
    # peer's retry getter; falling requires at least one live peer. With none
    # live, it preserves the cached true state rather than fabricating recovery.
    for count in range(4):
        for retry_states in itertools.product(tuple(itertools.product((0, 1), repeat=2)), repeat=count):
            for previous in (0, 1):
                setup()
                game, peers = base + 0xb000, base + 0x9000
                put(stack + 0xc80, game)
                put(game + 0xcf0, peers)
                put(game + 0xcf8, count)
                byte(game + 0xd38, previous)
                for ordinal in range(count):
                    put(peers + ordinal * 0x480 + 0x468, ordinal)
                    put(peers + ordinal * 0x480 + 0x470, base + 0x8000)
                cpu.reg_write(reg.UC_X86_REG_RBP, stack)
                start(0x145b08856)
                active, alive = any(row[0] for row in retry_states), any(row[1] for row in retry_states)
                emitted = active != bool(previous) and (active or alive)
                assert aggregate_emitted == emitted, (retry_states, previous)
                assert cpu.mem_read(game + 0xd38, 1)[0] == (active if emitted else previous)
                cases += 1
    return cases, instructions


def main():
    proof = json.loads(PROOF.read_text())
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in proof['target'])
    image = target_bytes(target)
    pe = load_script('peer_flag_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    count, queries = check_evidence(proof, image, pe)
    cases, executed = replay(image, pe)
    wire, directory, session = [(ROOT / path).read_text() for path in (WIRE, DIRECTORY, SESSION)]
    assert '24 | 25 | 31 | 32 => DirectoryResponse::Number' in wire
    assert 'session::service_peer_reconnecting(' in directory
    assert '&service.relay_peers, value, tag == 31' in ' '.join(directory.split())
    for fragment in ['driver.share_guest_flags(service.guest_flags.clone())',
                     'service.guest_flags.lock().unwrap().control(tag == 31)',
                     'service.guest_flags.lock().unwrap().active = true',
                     'service.guest_flags.lock().unwrap().active = false']:
        assert fragment in directory, fragment
    for fragment in ['pub fn service_peer_reconnecting', 'pub fn take_reconnection_changes',
                     'peer.reconnecting = reconnecting', 'peer.reconnecting = false',
                     'peer.alive && peer.reconnecting']:
        assert fragment in session, fragment
    runtime = (ROOT / RUNTIME).read_text()
    assert 'driver.take_reconnection_changes()' in runtime
    assert 'driver.take_relay_retry_change()' in runtime
    presentation = (ROOT / PRESENTATION).read_text()
    for fragment in ['std::mem::take(&mut runtime.reconnection_changes)',
                     'state.sync_sent && local.active', 'row.world_hero', 'row.synchronized',
                     'slot == affected', 'LANGUAGES.iter()', 'unwrap_or(&locale)',
                     'Notice::Host(value)', 'Notice::Peer', 'Notice::Relay(value)',
                     'runtime.send(Some(recipient), packet.into_message())']:
        assert re.sub(r'\s+', '', fragment) in re.sub(r'\s+', '', presentation), fragment
    # rustfmt emits parsed output to a pipe and writes no source or build output.
    hosts = {('Darwin', 'arm64'): 'aarch64-apple-darwin',
             ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    parser = ROOT / '.tools/rust' / ('1.98.1-' + hosts[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    syntax_paths = (WIRE, SESSION, DIRECTORY, RUNTIME, PRESENTATION,
                    'crates/azeroth-survivors-re/src/gameplay/coop.rs',
                    'crates/azeroth-survivors-re/src/coop/mod.rs')
    for path in syntax_paths:
        subprocess.run([str(parser), '--edition', '2024', '--config', 'skip_children=true',
                        '--emit', 'stdout', str(ROOT / path)], cwd=ROOT,
                       stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, check=True)
    print(json.dumps({'target': proof['target'], 'native_cases': cases,
                      'executed_instructions': executed, 'verified_instructions': count,
                      'durable_queries': queries, 'source_paths_parsed': len(syntax_paths),
                      'compilation_or_network_execution': False, 'passed': True}, indent=2))


if __name__ == '__main__':
    main()
