#!/usr/bin/env python3
"""Replay the bounded 0.119.0 opcode-58 decoder, without game/OS/source execution.

CString parsing/allocation, vector growth and deallocation are explicit seams.
This proves only the admitted decoder's fields/cursor behavior; it does not
establish a guest text carrier or the absence of one elsewhere in the EXE.
"""
import argparse
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from equipment_native import EquipmentProbe


SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
START, END = 0x145c8e500, 0x145c8face
RANGE_SHA = 'f2f1ba8e86a8978f05ffeac98896cd3d5f226ce4d97a588dc475eebfd95c7194'
MASK64 = (1 << 64) - 1
GROW = {0x145fc4810: 8, 0x145fc4c00: 12, 0x145fe4450: 28}


class Probe(EquipmentProbe):
    def __init__(self, data, pe):
        super().__init__(data, pe, [(START, END)])
        self.instructions = 0

    def raw(self, at, count):
        assert 0 <= count < 0x100000
        return bytes(self.native.mem_read(at, count)) if count else b''

    def words(self, at, count):
        return list(struct.unpack('<' + 'I' * count, self.raw(at, count * 4)))

    def hook(self, uc, pc, size, unused):
        if pc == self.stop:
            uc.emu_stop()
            return
        if START <= pc and pc + size <= END:
            self.instructions += 1
            return
        rcx, rdx = self.reg('RCX'), self.reg('RDX')
        if pc == 0x145cc58f0:
            # Only admitted NUL-terminated valid UTF-8 strings use this seam.
            pointer, count = self.q(rdx), self.q(rdx + 8)
            raw = self.raw(pointer, count)
            assert b'\0' in raw, 'missing-NUL CString errors are outside this replay'
            text = raw.split(b'\0', 1)[0]
            text.decode('utf-8')
            destination = self.alloc(len(text) + 1)
            if text:
                uc.mem_write(destination, text)
            self.put(rcx, len(text), destination, len(text))
            self.put(rdx, pointer + len(text) + 1, count - len(text) - 1)
            self.reg('RAX', rcx)
        elif pc in GROW:
            # The decoder retains logical length in separate locals. Preserve
            # every old allocated byte rather than assuming a Vec length slot.
            capacity = self.q(rcx)
            stride = GROW[pc]
            next_capacity = max(4, capacity * 2)
            pointer = self.alloc(next_capacity * stride)
            if capacity:
                uc.mem_write(pointer, self.raw(self.q(rcx + 8), capacity * stride))
            self.put(rcx, next_capacity, pointer)
        elif pc == 0x1400021d0:
            pass  # Deallocation; no address is reused by this bounded harness.
        else:
            raise RuntimeError(f'Unreviewed call {pc:#x} from {self.q(self.reg("RSP")):#x}')
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        stack = self.reg('RSP')
        self.reg('RSP', stack + 8)
        self.reg('RIP', self.q(stack))

    def decode(self, payload):
        # Each call has independent fixture/stack/output storage. Original PE
        # registry bytes remain present and are never synthesized by the seams.
        self.cursor = self.HEAP + 0x1000
        self.native.mem_write(self.STACK, bytes(0x200000))
        body = self.alloc(len(payload) + 1)
        if payload:
            self.native.mem_write(body, payload)
        cursor = self.alloc(16)
        self.put(cursor, body, len(payload))
        output = self.alloc(0x160)
        registry_before = self.raw(0x148516728, 0x28)
        self.invoke(START, output, cursor)
        assert self.reg('RAX') == output
        assert self.raw(0x148516728, 0x28) == registry_before
        assert self.raw(body, len(payload)) == payload
        remaining = self.q(cursor + 8)
        consumed = self.q(cursor) - body
        assert consumed + remaining == len(payload)
        result = {'consumed': consumed, 'remaining': remaining,
                  'tail_hex': self.raw(self.q(cursor), remaining).hex()}
        discriminant = self.q(output + 8)
        if discriminant == MASK64 - 1:
            result['kind'] = 'error'
        elif discriminant == MASK64:
            result.update(kind='unknown', entry=self.words(output, 1)[0])
        else:
            result.update(kind='template', entry=self.words(output, 1)[0],
                          name=self.raw(self.q(output + 16), self.q(output + 24)).decode(),
                          flavor=self.raw(self.q(output + 0x70), self.q(output + 0x78)).decode(),
                          bonding=self.words(output + 0x124, 1)[0],
                          suffix=self.words(output + 0x128, 14),
                          spells=[])
            for index in range(self.q(output + 0x60)):
                row = self.q(output + 0x58) + index * 28
                result['spells'].append(self.words(row, 6) + [self.raw(row + 24, 1)[0]])
        return result


def packet(ids, name='', flavor='', suffix=None):
    assert len(ids) == 5
    suffix = list(range(0x101, 0x10f)) if suffix is None else suffix
    payload = bytearray()

    def words(*values):
        payload.extend(struct.pack('<' + 'I' * len(values), *(n & 0xffffffff for n in values)))

    words(101000, 4, 0)
    payload.extend(name.encode() + b'\0\0\0\0')
    words(30000, 1, 0, 0, 0, 1, -1, -1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0)
    words(*([0] * 20))  # Ten empty stat pairs.
    words(*([0] * 15))  # Five empty damage triples.
    words(44, 0, 0, 0, 0, 0, 0, 2000, 0, 0)
    expected = []
    for index, spell in enumerate(ids):
        row = [spell, (0, 1, 2, 255, 1)[index] if spell else 0,
               -index if spell else 0, -1, 17 + index if spell else 0, -1]
        words(*row)
        if spell:
            expected.append([n & 0xffffffff for n in row] + [index])
    words(3)
    payload.extend(flavor.encode() + b'\0')
    words(*suffix)
    return bytes(payload), expected, suffix


def run():
    target = latest_target(verify=True)
    assert target['version'] == '0.119.0' and target['sha256'] == SHA
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location('item_decoder_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    offset = pe.rva_offset(START - pe.image_base)
    assert hashlib.sha256(data[offset:offset + END - START]).hexdigest() == RANGE_SHA
    probe = Probe(data, pe)
    cases = []
    all_ids = [1, 0xefffff, 0xf00000, 0xf00017, 0xffffffff]
    # All sparse masks cover zero through five spells, every ordinal, ordinary
    # and synthetic IDs, and preservation of every six-word spell block.
    for mask in range(32):
        ids = [spell if mask & (1 << index) else 0 for index, spell in enumerate(all_ids)]
        for name, flavor in [('', ''), ('Żółć 日本語 🙂', 'Lore é e\u0301\nEquip: +5%')]:
            body, spells, suffix = packet(ids, name, flavor)
            for tail in [b'', b'opaque\0\xff\x00\xf0']:
                result = probe.decode(body + tail)
                assert result == dict(kind='template', entry=101000, name=name, flavor=flavor,
                                      bonding=3, suffix=suffix, spells=spells,
                                      consumed=len(body), remaining=len(tail), tail_hex=tail.hex())
                cases.append({'mask': mask, 'unicode': bool(name), 'tail_bytes': len(tail),
                              'payload_sha256': hashlib.sha256(body + tail).hexdigest(),
                              'decoded': result})
    misses = []
    for entry in (0, 1, 101000, 0x7fffffff):
        for tail in (b'', b'ignored negative-entry tail\0\xff'):
            body = struct.pack('<I', entry | 0x80000000) + tail
            result = probe.decode(body)
            assert result == dict(kind='unknown', entry=entry, consumed=4,
                                  remaining=len(tail), tail_hex=tail.hex())
            misses.append(result)
    # Native scalar truncation paths only: complete strings are admitted by
    # the CString seam, and no missing-NUL/error formatting path is substituted.
    body, _, _ = packet(all_ids, 'A', 'B')
    lengths = list(range(12)) + list(range(len(body) - 56, len(body)))
    truncations = []
    for length in lengths:
        result = probe.decode(body[:length])
        assert result['kind'] == 'error' and result['remaining'] == 0
        assert result['consumed'] == length
        truncations.append(length)
    return {
        'target': {'version': target['version'], 'sha256': SHA},
        'decoder': {'start_va': hex(START), 'end_va_exclusive': hex(END), 'sha256': RANGE_SHA},
        'counts': {'template_cases': len(cases), 'negative_entry_cases': len(misses),
                   'scalar_truncation_cases': len(truncations), 'native_instructions': probe.instructions},
        'helper_calls': probe.calls, 'template_cases': cases, 'negative_entry_cases': misses,
        'scalar_truncation_lengths': truncations,
        'seams': {'0x145cc58f0': 'NUL-terminated valid UTF-8 CString read and owned allocation',
                  '0x145fc4810': 'eight-byte stat-vector capacity growth/copy',
                  '0x145fc4c00': 'twelve-byte damage-vector capacity growth/copy',
                  '0x145fe4450': 'twenty-eight-byte spell-vector capacity growth/copy',
                  '0x1400021d0': 'deallocation; addresses are not reused'},
        'limits': ['Only the declared decoder instructions execute; helpers are explicit Python seams.',
                   'Stat/damage growth seams are declared but unexercised by these empty-stat/damage fixtures.',
                   'Missing-NUL, malformed UTF-8, allocation failure and unwind paths are excluded.',
                   'No rebuilt source, game, OS service, socket or server executes.',
                   'Unchanged registry bytes and retained tails apply only to these fixtures and seams.',
                   'This does not establish a guest text carrier or its global absence, UI delivery or parity.'],
    }


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap101/44963486c7a7/decoder-replay.json')
    args = parser.parse_args()
    result = run()
    output = project_path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps({'counts': result['counts'], 'output': str(output.relative_to(ROOT))}))
