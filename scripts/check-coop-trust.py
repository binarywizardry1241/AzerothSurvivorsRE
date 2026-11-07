#!/usr/bin/env python3
"""Replay bounded guest trust instructions, never a game process or Rust code.

Default mode verifies retained evidence and shared vectors without writing.
--write refreshes only this check's curated manifest and fixture. Allocation,
growth, copy and free are explicit storage seams; UTF-8 validation executes the
original helper. Unknown calls fail closed. Requires Unicorn in PYTHONPATH.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import platform
import struct
import subprocess

from coverage_common import latest_target, target_bytes
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as reg

ROOT = Path(__file__).resolve().parents[1]
OWNER = (0x145aa8d20, 0x145aa95e1)
UTF = (0x145f7f020, 0x145f7f229)
SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
CORRESPONDENCE = 'docs/analysis/evidence/0.120.0/coop-correspondence/manifest.json'
QUERY = 'runtime/analysis/history/co-op/coop-trust/4fb22b1800ba/query/results/52427a95d30810b14fc7c5da1c95c3453fc4bb8fbe0b2d4f6aa84a0e8b901266.json'
FIXTURE = 'crates/azeroth-survivors-re/tests/fixtures/guest-engine-trust.json'
MANIFEST = 'docs/analysis/evidence/0.120.0/coop-trust/manifest.json'
QUERY_EVIDENCE = 'ev_d4518f2421735409feb64e5082294ff06366debdb5d1df3531a013c6fcf24002'
STORAGE = {
    0x140002200: 'allocator initialization',
    0x1400021c0: 'allocate bytes',
    0x1400021d0: 'free bytes',
    0x1400154b0: 'fallible allocation success',
    0x145fa3ec0: 'reserve byte vector capacity',
    0x14614ac60: 'reserve one byte',
    0x145fa3aab: 'copy bytes',
}


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def json_bytes(value):
    return (json.dumps(value, indent=2, ensure_ascii=True) + '\n').encode()


def fixture_bytes(value):
    # One compact vector per line keeps this shared fixture reviewable.
    return ('[\n' + ',\n'.join('  ' + json.dumps(row, separators=(',', ':')) for row in value) + '\n]\n').encode()


def receipt(path):
    return {'path': path, 'sha256': digest((ROOT / path).read_bytes())}


def model(opcode, body):
    """Independent byte-contract model; native replay supplies fixture outputs."""
    if opcode == 0x51:
        if len(body) < 9 or 0 not in body[8:]:
            return body
        end = body.index(0, 8)
        return body[:8] + body[8:end].replace(b'|', b'') + body[end:]
    if opcode != 0x96 or len(body) < 5:
        return body
    kind = body[0]
    if kind in (0, 1, 5, 6):
        if kind == 6 and body[1:5] == b'\xff' * 4:
            return body
        length_at = 21
    elif kind == 8:
        length_at = 13
    else:
        return body
    start = length_at + 4
    if len(body) < start:
        return body
    length = struct.unpack_from('<I', body, length_at)[0]
    end = start + max(0, length - 1)
    if end > len(body):
        return body
    try:
        text = body[start:end].decode('utf-8', errors='strict')
    except UnicodeDecodeError:
        return body
    # Collapse pairs to one logical pipe, then escape each logical pipe.
    chars, output, cursor = list(text), [], 0
    while cursor < len(chars):
        ch = chars[cursor]
        cursor += 1
        if ch == '|':
            output.append('||')
            if cursor < len(chars) and chars[cursor] == '|':
                cursor += 1
        else:
            output.append(ch)
    encoded = ''.join(output).encode('utf-8')
    suffix = body[min(start + length, len(body)):]
    return body[:length_at] + struct.pack('<I', len(encoded) + 1) + encoded + b'\0' + suffix


def cases():
    result = []

    def add(name, opcode, body):
        assert name not in {row['name'] for row in result}
        result.append({'name': name, 'opcode': opcode, 'input_hex': body.hex()})

    def chat(kind, text=b'hello|world', length=None, terminal=b'\0', suffix=b'\x7f\xfe'):
        start = 17 if kind == 8 else 25
        prefix = bytearray((index * 37 + 11) % 256 for index in range(start))
        prefix[0] = kind
        prefix[1:5] = struct.pack('<I', 7)
        prefix[start - 4:start] = struct.pack('<I', len(text) + 1 if length is None else length)
        return bytes(prefix) + text + terminal + suffix

    for opcode in (0, 0x50, 0x52, 0x95, 0x97, 0xffff):
        add(f'other-opcode-{opcode:04x}', opcode, b'\x00|\xff\0suffix')
    guid = bytes(range(8))
    for length in range(10):
        add(f'name-short-{length}', 0x51, b'|' * length)
    for name in (b'', b'a', b'|', b'||', b'|||', b'|A||B|||', bytes(range(1, 256)), b'\xff|\xc0\xaf|\xed\xa0\x80'):
        add(f'name-{len(result)}', 0x51, guid + name + b'\0\xff|suffix\0')
    for count in range(1, 17):
        add(f'name-pipe-run-{count}', 0x51, guid + b'a' + b'|' * count + b'b\0\0|end')
    for kind in range(256):
        add(f'chat-type-{kind:03}', 0x96, chat(kind))
    for length in range(26):
        add(f'chat-short-{length}', 0x96, chat(0)[:length])
    for kind in (0, 1, 5, 6, 8):
        for text in (b'', b'plain', b'|', b'||', b'|||', b'\0|a\0', 'é|Ж||中|||😀'.encode()):
            add(f'chat-text-{kind}-{len(result)}', 0x96, chat(kind, text))
        for declared in (0, 1, 2, 3, 4, 5, 6, 7, 0xffffffff):
            add(f'chat-length-{kind}-{declared}', 0x96, chat(kind, b'a|b', declared))
        add(f'chat-no-terminal-{kind}', 0x96, chat(kind, b'a|b', terminal=b'', suffix=b''))
        add(f'chat-nonnul-terminal-{kind}', 0x96, chat(kind, b'a|b', terminal=b'\xff'))
        add(f'chat-zero-empty-{kind}', 0x96, chat(kind, b'', 0, terminal=b'', suffix=b''))
        add(f'chat-one-empty-{kind}', 0x96, chat(kind, b'', 1, terminal=b'', suffix=b''))
    for language in (0, 1, 0x7fffffff, 0xfffffffe, 0xffffffff):
        body = bytearray(chat(6))
        body[1:5] = struct.pack('<I', language)
        add(f'chat-language-{language:08x}', 0x96, bytes(body))
    for count in range(1, 20):
        add(f'chat-pipe-run-{count}', 0x96, chat(0, b'a' + b'|' * count + b'b'))
    texts = [bytes([byte]) for byte in range(128, 256)] + [
        b'\xc0\x80', b'\xc1\xbf', b'\xc2\x80', b'\xdf\xbf', b'\xe0\x9f\xbf',
        b'\xe0\xa0\x80', b'\xed\x9f\xbf', b'\xed\xa0\x80', b'\xed\xbf\xbf',
        b'\xee\x80\x80', b'\xef\xbf\xbf', b'\xf0\x8f\xbf\xbf', b'\xf0\x90\x80\x80',
        b'\xf4\x8f\xbf\xbf', b'\xf4\x90\x80\x80', b'\xf5\x80\x80\x80',
        b'\xf8\x88\x80\x80\x80', b'\xff', b'\xe2\x82', b'\xf0\x9f\x98',
        b'\xc2A', b'\xe2\x82A', b'\xf0\x9f\x98A', b'|\xff', b'||\xff',
    ]
    for index, text in enumerate(texts):
        add(f'chat-utf8-{index}', 0x96, chat(0, text))
    for alignment in range(8):
        for count in (15, 16, 17, 31, 32, 33, 64):
            add(f'chat-ascii-scan-{alignment}-{count}', 0x96,
                chat(8, b'a' * alignment + b'|' + b'b' * count + '😀'.encode()))
    return result


def source_checks():
    helper = 'crates/azeroth-survivors-re/src/coop/trust.rs'
    module = 'crates/azeroth-survivors-re/src/coop/mod.rs'
    consumer = 'crates/azeroth-survivors-re/src/gameplay/coop.rs'
    source = (ROOT / consumer).read_text()
    start = source.index('    fn guest_engine_packet(')
    end = source.index('    pub(crate) fn leave(', start)
    guest = source[start:end]
    assert guest.index('guest_engine_packet_allowed(') < guest.index('.then(||') < guest.index('trust::guest_engine_payload(opcode, payload)')
    assert 'self.sync_sent && engine_active' in guest
    receive = source[source.index('            NativeMessage::Lifecycle(LifecyclePacket::EngineCommand'):]
    receive = receive[:receive.index('            NativeMessage::ZoneKey(')]
    assert receive.index('state.guest_engine_packet(') < receive.index('packet.decode_server()') < receive.index('observe(') < receive.index('inbound.0.push((packet.opcode, packet.payload))')
    assert 'pub mod trust;' in (ROOT / module).read_text()
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    parser = ROOT / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    assert parser.is_file(), 'Configured parse-only tool unavailable; no installation attempted'
    for path in (helper, module, consumer):
        parsed = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                                input=(ROOT / path).read_text(), cwd=ROOT, text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    return {'helper': receipt(helper),
            'module_registration': {'path': module, 'anchor': 'pub mod trust;'},
            'guest_boundary': {'path': consumer, 'start_marker': '    fn guest_engine_packet(',
                               'end_marker': '    pub(crate) fn leave(', 'sha256': digest(guest.encode())},
            'receive_order': ['guest_engine_packet', 'decode_server', 'observe', 'LocalWireEvents'],
            'rust_syntax_files': 3, 'rust_tests': 'authored_not_compiled_or_run'}


class Replay:
    def __init__(self, blob, pe):
        self.blob, self.pe = blob, pe
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        self.pages = set()
        self.base, self.stack, self.stop = 0x200000000, 0x300000000, 0x400000000
        self.u.mem_map(self.base, 0x200000)
        self.u.mem_map(self.stack, 0x20000)
        self.u.mem_map(self.stop, 4096)
        self.calls, self.instructions = Counter(), Counter()
        self.u.hook_add(UC_HOOK_MEM_UNMAPPED, self.missing)
        self.u.hook_add(UC_HOOK_CODE, self.hook)

    def raw(self, address, length):
        offset = self.pe.rva_offset(address - self.pe.image_base)
        return self.blob[offset:offset + length]

    def missing(self, cpu, access, address, size, value, context):
        page = address & ~4095
        assert page not in self.pages
        raw = self.raw(page, 4096)
        assert len(raw) == 4096
        cpu.mem_map(page, 4096)
        cpu.mem_write(page, raw)
        self.pages.add(page)
        return True

    def q(self, address):
        return struct.unpack('<Q', self.u.mem_read(address, 8))[0]

    def put(self, address, value):
        self.u.mem_write(address, struct.pack('<Q', value))

    def alloc(self, length):
        address = self.next
        self.next += (max(length, 1) + 15) & ~15
        assert self.next < self.base + 0x200000
        self.u.mem_write(address, bytes(max(length, 1)))
        return address

    def reserve(self, vector, used, additional):
        capacity = self.q(vector)
        wanted = max(used + additional, capacity * 2, 8)
        address = self.alloc(wanted)
        if used:
            self.u.mem_write(address, bytes(self.u.mem_read(self.q(vector + 8), used)))
        self.put(vector, wanted)
        self.put(vector + 8, address)

    def hook(self, cpu, pc, size, context):
        if pc == self.stop:
            cpu.emu_stop()
            return
        for name, (start, end) in (('owner', OWNER), ('utf8', UTF)):
            if start <= pc and pc + size <= end:
                self.instructions[name] += 1
                return
        assert pc in STORAGE, f'unreviewed call {pc:#x}'
        self.calls[STORAGE[pc]] += 1
        rcx, rdx, r8, sp = (cpu.reg_read(register) for register in
                           (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8, reg.UC_X86_REG_RSP))
        if pc == 0x1400021c0:
            cpu.reg_write(reg.UC_X86_REG_RAX, self.alloc(rcx))
        elif pc == 0x1400154b0:
            self.put(rcx, 0)
            self.put(rcx + 8, rdx)
            self.put(rcx + 16, self.alloc(rdx) if rdx else 1)
        elif pc == 0x145fa3ec0:
            self.reserve(rcx, rdx, r8)
        elif pc == 0x14614ac60:
            self.reserve(rcx, self.q(rcx + 16), 1)
        elif pc == 0x145fa3aab:
            if r8:
                cpu.mem_write(rcx, bytes(cpu.mem_read(rdx, r8)))
            cpu.reg_write(reg.UC_X86_REG_RAX, rcx)
        else:
            assert pc in (0x140002200, 0x1400021d0)
        cpu.reg_write(reg.UC_X86_REG_RIP, self.q(sp))
        cpu.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def run(self, opcode, body):
        self.next = self.base + 0x1000
        out, vector = self.base, self.base + 0x100
        self.u.mem_write(out, bytes(0x200))
        address = self.alloc(len(body))
        self.u.mem_write(address, body)
        self.u.mem_write(vector, struct.pack('<QQQ', len(body), address, len(body)))
        sp = self.stack + 0x10008
        self.put(sp, self.stop)
        for register, value in ((reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, out),
                                (reg.UC_X86_REG_RDX, opcode), (reg.UC_X86_REG_R8, vector)):
            self.u.reg_write(register, value)
        self.u.emu_start(OWNER[0], 0, count=100000)
        assert self.u.reg_read(reg.UC_X86_REG_RIP) == self.stop
        assert self.u.reg_read(reg.UC_X86_REG_RAX) == out
        length = self.q(out + 16)
        assert length < 0x100000
        return bytes(self.u.mem_read(self.q(out + 8), length))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    blob = target_bytes(target)
    pe = load_script('trust_pe', ROOT / 'scripts/inventory-executable.py').PE(blob)
    assert (UTF[0] - pe.image_base, UTF[1] - pe.image_base) in {(a, b) for a, b, _ in pe.functions()}
    proof = json.loads((ROOT / CORRESPONDENCE).read_text())
    assert proof['target']['sha256'] == SHA
    replay = Replay(blob, pe)
    for row in proof['ranges'] + proof['data_ranges']:
        if row['role'] in ('engine-packet-trust', 'guest-engine-admission-port', 'guest-trust-delivery') or 'targets' in row:
            raw = replay.raw(int(row['start'], 16), row['byte_count'])
            assert digest(raw) == row['sha256']
    query_raw = (ROOT / QUERY).read_bytes()
    journal_path = 'runtime/analysis/history/co-op/coop-trust/4fb22b1800ba/query/journal.json'
    journal = json.loads((ROOT / journal_path).read_text())
    assert journal['status'] == 'completed'
    operation = journal['operations'][Path(QUERY).stem]
    assert operation['status'] == 'completed' and operation['result']['sha256'] == digest(query_raw)
    query = json.loads(query_raw)['structuredContent']
    assert query['subject']['digest']['sha256'] == SHA and query['evidence_id'] == QUERY_EVIDENCE
    assert query['parameters']['procedure'] == hex(UTF[0])
    rows = cases()
    for row in rows:
        body = bytes.fromhex(row['input_hex'])
        actual = replay.run(row['opcode'], body)
        assert actual == model(row['opcode'], body), row['name']
        row['output_hex'] = actual.hex()
    fixture = [{'case': row['name'], 'opcode': row['opcode'],
                'input': list(bytes.fromhex(row['input_hex'])), 'output': list(bytes.fromhex(row['output_hex']))}
               for row in rows]
    spans = []
    for role, start, end in [('strict-utf8-helper', *UTF), ('strict-utf8-width-table', 0x1476914e5, 0x1476915e5)]:
        spans.append({'role': role, 'start': hex(start), 'end_exclusive': hex(end),
                      'file_offset': hex(pe.rva_offset(start - pe.image_base)), 'byte_count': end - start,
                      'sha256': digest(replay.raw(start, end - start))})
    manifest = {
        'schema_version': 1, 'target': proof['target'], 'gap_ids': [186],
        'canonical_native_ranges': {'manifest': receipt(CORRESPONDENCE), 'selectors': [
            'ranges[role=engine-packet-trust]', 'ranges[role=guest-engine-admission-port]',
            'ranges[role=guest-trust-delivery]', 'data_ranges[role=bounded-chat-kind-table]']},
        'additional_ranges': spans,
        'utf8_query': {'result': receipt(QUERY), 'evidence_id': query['evidence_id'],
                       'journal': receipt(journal_path), 'plan': receipt('runtime/analysis/history/co-op/coop-trust/4fb22b1800ba/query/plan.json'),
                       'analysis_profile_digest': query['analysis_profile']['digest'],
                       'normalized_text_sha256': digest(query['normalized_result'].encode())},
        'shared_vectors': {'path': FIXTURE, 'sha256': digest(fixture_bytes(fixture)), 'case_count': len(rows)},
        'source': source_checks(),
        'checker': receipt('scripts/check-coop-trust.py'),
        'native_instructions': dict(sorted(replay.instructions.items())),
        'storage_seam_calls': dict(sorted(replay.calls.items())),
        'limits': ['Original owner and UTF-8 validator execute in Unicorn; no target process, OS I/O, server, client, network or Rust source executes.',
                   'Allocator initialization, successful allocation, byte-vector growth, copy and free are explicit storage seams; allocation failure/unwinding are not checked.',
                   'All 256 chat type bytes, bounded malformed lengths/UTF-8 and pipe/suffix cases are checked; this is not exhaustive packet enumeration or gameplay/rendering/parity proof.'],
        'compilation': 'not_run', 'runtime_validation': 'not_run', 'parity': 'unverified',
    }
    if args.write:
        for path, raw in ((FIXTURE, fixture_bytes(fixture)), (MANIFEST, json_bytes(manifest))):
            (ROOT / path).parent.mkdir(parents=True, exist_ok=True)
            (ROOT / path).write_bytes(raw)
    else:
        assert json.loads((ROOT / FIXTURE).read_text()) == fixture, 'shared native vectors changed'
        assert json.loads((ROOT / MANIFEST).read_text()) == manifest, 'native check receipts changed'
    print(f"Verified {len(rows)} original-instruction trust cases; {sum(replay.instructions.values())} owner/UTF instructions. No compilation, Rust, game/client/network/server execution or parity check.")


if __name__ == '__main__':
    main()
