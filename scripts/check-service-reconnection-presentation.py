#!/usr/bin/env python3
"""Check native reconnection presentation, without compiling or running a game.

Only the original packet-builder instructions execute in synthetic memory.
Allocation, byte copying and vector growth are declared fixture seams. Locale
payloads, Ghidra receipts and source syntax have independent checks.
"""
from runtime_layout import retained_runtime_path
import hashlib
import json
import platform
import struct
import subprocess

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from equipment_native import EquipmentProbe
from script_sources import load_script

MANIFEST = 'docs/analysis/evidence/service-peer-flags/presentation.json'
LOCALES = 'docs/analysis/evidence/service-peer-flags/notice-locales.json'
HELPER = 'crates/azeroth-survivors-re/src/coop/reconnection.rs'


def verify_receipt(row):
    assert file_sha256(retained_runtime_path(ROOT / row['path'], ROOT)) == row['sha256'], row['path']


class PacketProbe(EquipmentProbe):
    def __init__(self, blob, pe, ranges):
        super().__init__(blob, pe, ranges)
        self.instructions = 0

    def hook(self, cpu, pc, size, unused):
        if pc == self.stop:
            cpu.emu_stop()
            return
        if any(start <= pc and pc + size <= end for start, end in self.ranges):
            self.instructions += 1
            return
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        rcx, rdx, r8 = (self.reg(name) for name in ('RCX', 'RDX', 'R8'))
        if pc in (0x140002200, 0x1400021d0):
            pass
        elif pc == 0x1400021c0:
            self.reg('RAX', self.alloc(rcx))
        elif pc == 0x145faae2b:
            self.native.mem_write(rcx, bytes(self.native.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc in (0x145fab240, 0x146151fa0):
            old_capacity, old_pointer, stored_len = (self.q(rcx + at) for at in (0, 8, 16))
            length, additional = (rdx, r8) if pc == 0x145fab240 else (stored_len, 1)
            capacity = max(old_capacity * 2, length + additional, 8)
            pointer = self.alloc(capacity)
            self.native.mem_write(pointer, bytes(self.native.mem_read(old_pointer, length)))
            self.put(rcx, capacity, pointer)
        else:
            raise AssertionError(f'Unreviewed packet-builder call {pc:#x}')
        stack = self.reg('RSP')
        self.reg('RSP', stack + 8)
        self.reg('RIP', self.q(stack))


def check():
    target = latest_target(verify=True)
    proof = json.loads((ROOT / MANIFEST).read_text())
    assert all(target[key] == proof['target'][key] for key in ('version', 'sha256', 'size_bytes'))
    blob = target_bytes(target)
    pe = load_script('reconnection_presentation_pe', ROOT / 'scripts/inventory-executable.py').PE(blob)
    for row in proof['inputs']:
        verify_receipt(row)
    decoded_count = 0
    for row in proof['native_ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        at = pe.rva_offset(start - pe.image_base)
        raw = blob[at:at + end - start]
        assert at == int(row['file_offset'], 16)
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        assert sum(item.size for item in instructions) == len(raw)
        assert len(instructions) == row['instruction_count']
        expected = '\n'.join(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip() for i in instructions)
        actual = '\n'.join(line.rstrip() for line in (ROOT / row['assembly']['path']).read_text().splitlines() if not line.startswith(';'))
        assert expected == actual
        verify_receipt(row['assembly'])
        decoded_count += len(instructions)
    for query in proof['queries']:
        for key in ('plan', 'journal', 'result'):
            verify_receipt(query[key])
        evidence = json.loads(json.loads((ROOT / query['result']['path']).read_text())['content'][0]['text'])
        assert evidence['subject']['digest']['sha256'] == target['sha256']
        assert evidence['evidence_id'] == query['evidence_id']
        assert hashlib.sha256(evidence['normalized_result'].encode()).hexdigest() == query['normalized_sha256']

    locales = json.loads((ROOT / LOCALES).read_text())
    assert locales['target']['sha256'] == target['sha256']
    texts = set()
    for row in locales['locales']:
        for span in (row['record'], row['payload']):
            offset = int(span['file_offset'], 16)
            raw = blob[offset:offset + span['byte_count']]
            assert hashlib.sha256(raw).hexdigest() == span['sha256']
        span = row['payload']
        offset = int(span['file_offset'], 16)
        native = json.loads(blob[offset:offset + span['byte_count']])
        source = json.loads((ROOT / row['source']['path']).read_text())
        assert all(native[key] == value == source[key] for key, value in row['values'].items())
        for value in row['values'].values():
            texts.add(value.replace('{hero}', 'Ärie{hero}|cff71d5ff'))

    # Include both reserve paths, UTF-8 lengths and retained embedded NUL bytes.
    texts.update(['', 'x' * 14, 'x' * 15, 'x' * 16, 'x' * 31, 'x' * 32,
                  'x' * 63, 'x' * 64, 'a\0b', 'é' * 17])
    packet_range = next(row for row in proof['native_ranges'] if row['role'] == 'system-chat-packet')
    start, end = int(packet_range['start'], 16), int(packet_range['end_exclusive'], 16)
    probe = PacketProbe(blob, pe, [(start, end)])
    for text in sorted(texts):
        raw = text.encode()
        pointer, result = probe.alloc(len(raw) + 1), probe.alloc(32)
        probe.native.mem_write(pointer, raw)
        probe.invoke(start, result, pointer, len(raw))
        payload = bytes(probe.native.mem_read(probe.q(result + 8), probe.q(result + 16)))
        expected = bytes([10]) + bytes(12) + struct.pack('<I', len(raw) + 1) + raw + bytes(2)
        assert probe.q(result + 24) & 0xffff == 0x96
        assert payload == expected, repr(text)

    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    parser = ROOT / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    parsed = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                            input=(ROOT / HELPER).read_text(), cwd=ROOT, text=True,
                            stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
    assert parsed.returncode == 0, parsed.stderr
    return dict(target_sha256=target['sha256'], native_packet_cases=len(texts),
                original_packet_instructions=probe.instructions, decoded_instructions=decoded_count,
                current_native_ranges=len(proof['native_ranges']), durable_queries=len(proof['queries']),
                locale_values=sum(len(row['values']) for row in locales['locales']),
                source_syntax_parsed=True, authored_rust_regressions_uncompiled_unrun=2,
                seams=['Allocation, memcpy and Vec growth are synthetic services.',
                       'Locale JSON parsing compares original descriptor-bounded values without executing the native loader.',
                       'Source syntax parsing does not type-check or execute the source.'],
                compilation=False, target_execution=False, server_execution=False, parity='unverified')


if __name__ == '__main__':
    print(json.dumps(check(), indent=2))
