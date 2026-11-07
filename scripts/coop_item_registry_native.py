#!/usr/bin/env python3
"""Replay bounded 0.118.0 registry/framing instructions without a game or build.

Allocation, String cloning, byte comparison/copy and registry-vector growth are
explicit Python seams. No guest registry carrier, network or gameplay is modeled.
"""
import argparse
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from equipment_native import EquipmentProbe


SHA = '4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae'
RANGES = [
    ('interner', 0x145b5ca70, 0x145b5cc72,
     '399281da0339e3ee8e8e415f768946a47a74f602d5dd7a012e71504247dfa23e'),
    ('lookup', 0x145b5cd10, 0x145b5ce4c,
     '542dc41f807eb0f746ff8b04953a734e8f4566d6e98854e485ef45ead5121cb2'),
    ('framing_writer', 0x145b5b1f0, 0x145b5b3fe,
     '371d9460ad58fb91c323a19db406967fea178c3e603bf0c0c9d46d4ff8228f79'),
]
INTERN, LOOKUP, FRAME = [row[1] for row in RANGES]
MUTEX, POISON, REGISTRY, PANIC_THREAD = (
    0x148516728, 0x148516729, 0x148516730, 0x148516b70)
BASE = 0x00f00000
MASK64 = (1 << 64) - 1


class Probe(EquipmentProbe):
    """Allow only the three admitted native intervals and declared leaf seams."""

    def __init__(self, data, pe):
        super().__init__(data, pe, [(a, z) for _, a, z, _ in RANGES])
        self.instruction_counts = {role: 0 for role, *_ in RANGES}
        self.put(PANIC_THREAD, self.alloc(8))
        self.native.mem_write(MUTEX, bytes(2))
        self.put(REGISTRY, 0, 8, 0)

    def raw(self, at, count):
        assert 0 <= count < 0x100000
        return bytes(self.native.mem_read(at, count)) if count else b''

    def output_bytes(self, at, raw):
        pointer = self.alloc(len(raw) + 1)
        if raw:
            self.native.mem_write(pointer, raw)
        self.put(at, len(raw), pointer, len(raw))

    def hook(self, uc, pc, size, unused):
        if pc == self.stop:
            uc.emu_stop()
            return
        for role, start, end, _ in RANGES:
            if start <= pc and pc + size <= end:
                self.instruction_counts[role] += 1
                return
        rcx, rdx, r8 = (self.reg(name) for name in ('RCX', 'RDX', 'R8'))
        if pc == 0x140002200:  # Existing allocator-initialization seam.
            pass
        elif pc == 0x1400021c0:
            assert rdx == 1, ('unexpected allocation alignment', rdx)
            self.reg('RAX', self.alloc(rcx))
        elif pc == 0x145f93d67:
            left, right = self.raw(rcx, r8), self.raw(rdx, r8)
            self.reg('RAX', ((left > right) - (left < right)) & MASK64)
        elif pc == 0x145f93d5b:
            if r8:
                uc.mem_write(rcx, self.raw(rdx, r8))
            self.reg('RAX', rcx)
        elif pc == 0x145f94210:
            assert rcx == REGISTRY, ('unexpected registry vector', hex(rcx))
            length = self.q(rcx + 16)
            assert length == self.q(rcx), 'reserve only occurs at full capacity'
            capacity = max(4, length * 2)
            pointer = self.alloc(capacity * 24)
            if length:
                uc.mem_write(pointer, self.raw(self.q(rcx + 8), length * 24))
            self.put(rcx, capacity, pointer)
        elif pc == 0x145f66f70:
            self.output_bytes(rcx, self.raw(self.q(rdx + 8), self.q(rdx + 16)))
        else:
            raise RuntimeError(f'Unreviewed call {pc:#x} from {self.q(self.reg("RSP")):#x}')
        key = hex(pc)
        self.calls[key] = self.calls.get(key, 0) + 1
        stack = self.reg('RSP')
        self.reg('RSP', stack + 8)
        self.reg('RIP', self.q(stack))

    def intern(self, raw):
        pointer = self.alloc(len(raw) + 1)
        if raw:
            self.native.mem_write(pointer, raw)
        self.invoke(INTERN, pointer, len(raw))
        assert self.raw(MUTEX, 2) == bytes(2), 'uncontended mutex must be released'
        return self.reg('RAX') & 0xffffffff

    def lookup(self, spell_id):
        output = self.alloc(24)
        self.invoke(LOOKUP, output, spell_id)
        assert self.raw(MUTEX, 2) == bytes(2), 'lookup must release the mutex'
        if self.q(output) == MASK64:
            return None
        return self.raw(self.q(output + 8), self.q(output + 16))

    def frame(self, body, opcode, flag, key, index, previous, prefix=b''):
        assert len(key) == 40 and 0 <= index < 40
        actor = self.alloc(0x60)
        self.native.mem_write(actor + 0x30, bytes([flag]) + key + bytes([index, previous]))
        packet = self.alloc(32)
        pointer = self.alloc(len(body) + 1)
        if body:
            self.native.mem_write(pointer, body)
        self.put(packet, len(body), pointer, len(body))
        self.native.mem_write(packet + 24, struct.pack('<H', opcode))
        # Both append branches have sufficient capacity; reserve is not substituted.
        capacity = len(prefix) + len(body) + 4 + 32
        output = self.alloc(24)
        buffer = self.alloc(capacity)
        if prefix:
            self.native.mem_write(buffer, prefix)
        self.put(output, capacity, buffer, len(prefix))
        self.invoke(FRAME, actor, packet, output)
        assert self.q(output) == capacity and self.q(output + 8) == buffer
        assert self.raw(pointer, len(body)) == body
        assert self.raw(actor + 0x30, 41) == bytes([flag]) + key
        state = self.raw(actor + 0x59, 2)
        return self.raw(buffer, self.q(output + 16)), tuple(state)


def model_frame(body, opcode, flag, key, index, previous, prefix):
    if len(body) > 0xfffd:
        return prefix, (index, previous)
    header = bytearray(struct.pack('>H', len(body) + 2) + struct.pack('<H', opcode))
    if flag == 1:
        for at, byte in enumerate(header):
            previous = ((byte ^ key[index]) + previous) & 0xff
            header[at] = previous
            index = (index + 1) % 40
    return prefix + header + body, (index, previous)


def load_image():
    target = latest_target(verify=True)
    assert target['version'] == '0.118.0' and target['sha256'] == SHA
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location(
        'coop_item_registry_pe_0_118', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    for _, start, end, expected in RANGES:
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == expected
    return target, data, pe


def run():
    target, data, pe = load_image()
    probe = Probe(data, pe)
    values = ['', 'hello', '+25% damage', 'Polski Żółć', 'hello', '+25% damage', '',
              '日本語', 'A\0B', 'A', 'A\0B', 'line1\nline2', 'é', 'e\u0301', 'É',
              'trailing ', 'trailing', '🙂', '🙂', '\0', '\0\0', 'tail\0']
    registered, interns, lookups = [], [], []
    for text in values:
        raw = text.encode('utf-8')
        actual = probe.intern(raw)
        if raw not in registered:
            registered.append(raw)
        expected = BASE + registered.index(raw)
        assert actual == expected
        assert probe.q(REGISTRY + 16) == len(registered)
        assert probe.lookup(actual) == raw
        interns.append({'text': text, 'utf8_hex': raw.hex(), 'spell_id': actual})
    for index, raw in enumerate(registered):
        actual = probe.lookup(BASE + index)
        assert actual == raw
        lookups.append({'spell_id': BASE + index, 'found': True, 'utf8_hex': raw.hex()})
    missing_ids = [0, 1, BASE - 1, BASE + len(registered), BASE + len(registered) + 1,
                   0x7fffffff, 0x80000000, 0xffffffff]
    for spell_id in missing_ids:
        assert probe.lookup(spell_id) is None
        lookups.append({'spell_id': spell_id, 'found': False})

    # Separate Unicorn registries demonstrate identity dependence, not an actual
    # guest execution, recovered carrier, or defect in the original application.
    guest = Probe(data, pe)
    guest_first = guest.intern(b'guest-local first text')
    assert guest_first == BASE and probe.lookup(BASE) == b''
    assert guest.lookup(BASE) == b'guest-local first text'
    host_only = probe.intern(b'host-only new text')
    assert guest.lookup(host_only) is None
    mismatch = [
        {'kind': 'same_id_different_text', 'spell_id': BASE,
         'host_utf8_hex': probe.lookup(BASE).hex(),
         'guest_utf8_hex': guest.lookup(BASE).hex()},
        {'kind': 'host_id_absent_from_guest', 'spell_id': host_only,
         'host_utf8_hex': probe.lookup(host_only).hex(), 'guest_found': False},
    ]

    frames = []
    # Exercise every rotating-key position, unsigned header carry, exact flag
    # admission, empty/Unicode/NUL bodies, append prefixes and maximum lengths.
    bodies = [b'', b'A', b'A\0B', 'Żółć 日本語 🙂'.encode('utf-8'), bytes(range(256)),
              b'x' * 0xfffd, b'y' * 0xfffe]
    keys = [bytes(40), bytes((i * 13 + 7) & 0xff for i in range(40))]
    for flag in (0, 1, 2, 255):
        for key_number, key in enumerate(keys):
            for index in range(40):
                for previous in (0, 255):
                    body = bodies[(index + previous + key_number) % len(bodies)]
                    opcode = (0, 0x58, 0xff, 0x100, 0xffff)[index % 5]
                    prefix = b'prior\0frame' if index % 2 else b''
                    actual = probe.frame(body, opcode, flag, key, index, previous, prefix)
                    expected = model_frame(body, opcode, flag, key, index, previous, prefix)
                    assert actual == expected, (flag, key_number, index, previous, len(body))
                    output, state = actual
                    frames.append({'flag': flag, 'key_fixture': key_number, 'index': index,
                        'previous': previous, 'body_bytes': len(body), 'opcode': opcode,
                        'prefix_bytes': len(prefix), 'output_bytes': len(output),
                        'output_sha256': hashlib.sha256(output).hexdigest(),
                        'final_index': state[0], 'final_previous': state[1],
                        'body_appended_unchanged': len(body) <= 0xfffd,
                        'oversize_omitted': len(body) > 0xfffd})
    return {
        'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
        'ranges': [{'role': role, 'start': hex(a), 'end_exclusive': hex(z), 'sha256': sha}
                   for role, a, z, sha in RANGES],
        'interner_cases': interns, 'lookup_cases': lookups,
        'isolated_registry_cases': mismatch, 'framing_cases': frames,
        'counts': {'interner': len(interns), 'lookup': len(lookups),
                   'isolated_registry': len(mismatch), 'framing': len(frames)},
        'seam_calls': {'primary': probe.calls, 'isolated_guest': guest.calls},
        'native_instruction_counts': {'primary': probe.instruction_counts,
                                      'isolated_guest': guest.instruction_counts},
        'limits': [
            'Only the three hash-verified 0.118.0 instruction intervals execute in Unicorn.',
            'Allocation initialization/allocation, memcmp/memcpy, String clone and registry Vec growth are explicit Python seams.',
            'Registry mutex fixtures are uncontended and unpoisoned; panic, contention and allocation failure paths are excluded.',
            'Framing uses valid key indices and preallocated output capacity; reserve and invalid-index panic paths are excluded.',
            'Isolated registries are analyst fixtures and do not prove original guest behavior or a game defect.',
            'The guest registry carrier/population, network delivery and native reconstruction completeness are not established.',
            'No game, sockets/server, Rust compilation/execution, rendering or original/rebuilt parity.',
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap101/a2e528ce14fd/native-replay.json')
    args = parser.parse_args()
    output = project_path(args.output)
    assert output.is_relative_to(ROOT / 'runtime'), 'bulk replay output belongs under runtime/'
    result = run()
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    counts = result['counts']
    print(f"PASS: {counts['interner']} interner, {counts['lookup']} lookup, "
          f"{counts['isolated_registry']} isolated registry and {counts['framing']} framing cases; "
          'bounded original instructions, no game/build/network')


if __name__ == '__main__':
    main()
