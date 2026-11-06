#!/usr/bin/env python3
"""Check the current Again aura/mover publication without compiling or launching.

Only isolated original instructions execute in Unicorn. BTree insertion, packet
delivery, zone lookup, allocation and the shared teleport serializer are explicit
seams. This is neither a game session nor original/rebuilt runtime parity.
"""

from script_sources import current_path, recorded_input_matches
import hashlib
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / 'docs/analysis/evidence/0.123.0/again-runes'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row['path']))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def packed_guid(guid):
    raw = struct.pack('<Q', guid)
    return bytes([sum((value != 0) << n for n, value in enumerate(raw))]) + bytes(v for v in raw if v)


def native_class():
    ordinary = load_script('again_runes_retirement', ROOT / 'scripts/check-again-retirement.py')

    class Native(ordinary.Native):
        def __init__(self, image, pe, mode, existing=None):
            self.mode, self.existing = mode, existing
            self.inserted, self.steps = [], 0
            super().__init__(image, pe)
            for start, end in [(0x145b08d20, 0x145b09107), (0x145c67620, 0x145c6770b),
                               (0x145c6a940, 0x145c6aaa4)]:
                at = pe.rva_offset(start - pe.image_base)
                self.write(start, image[at:at + end - start])
            extra = {0x145b06f60, 0x145b98dc0, 0x145aaeb70, 0x145aaef50, 0x145c74b00}
            if mode == 'caller':
                extra.add(0x145b08d20)
            self.seams |= extra
            for address in extra:
                if not (address == 0x145b08d20 and mode == 'aura'):
                    self.write(address, b'\xc3')

        def run(self, entry):
            try:
                super().run(entry)
            except Exception as error:
                raise AssertionError(f'{self.mode} fixture stopped at {self.reg("RIP"):#x}') from error

        def hook(self, uc, address, size, user):
            self.steps += 1
            if ((self.mode == 'aura' and address == 0x145b08ee1)
                    or (self.mode == 'caller' and address == 0x145c24ceb)):
                self.stopped = True
                uc.emu_stop()
                return
            if address not in {0x145b06f60, 0x145b98dc0, 0x145aaeb70,
                               0x145aaef50, 0x145c74b00, 0x145b08d20}:
                return super().hook(uc, address, size, user)
            if address == 0x145b08d20 and self.mode != 'caller':
                return
            a, b, c, d = (self.reg(name) for name in ('RCX', 'RDX', 'R8', 'R9'))
            value = 0
            if address == 0x145b06f60:
                self.write(a, bytes(24))
                if self.existing is not None:
                    self.node = self.alloc(0x100)
                    self.write(self.node + 0x36, struct.pack('<HH', 1, self.existing))
                    self.write(self.node + 8, struct.pack('<I', 0xdeadbeef))
                    self.put(a, self.node)
            elif address == 0x145b98dc0:
                self.inserted.append((self.q(b + 0x20), c))
            elif address == 0x145aaeb70:
                raw = packed_guid(a)
                self.write(self.q(b + 8), raw)
                self.put(b + 16, len(raw))
            elif address == 0x145c74b00:
                # Selected caller inputs are original; shared teleport packet
                # composition is outside this fixture and remains a seam.
                raw = struct.pack('<I', c) + bytes(uc.mem_read(d, 12))
                raw += bytes(uc.mem_read(self.reg('RSP') + 0x28, 4))
                pointer = self.alloc(len(raw))
                self.write(pointer, raw)
                self.write(a, struct.pack('<QQQH', len(raw), pointer, len(raw), 0xc7))
            elif address == 0x145b08d20:
                pointer = self.alloc(1)
                self.write(a, struct.pack('<QQQH', 1, pointer, 0, 0xa9))
            uc.reg_write(self.x.UC_X86_REG_RAX, value)
            stack = self.reg('RSP')
            uc.reg_write(self.x.UC_X86_REG_RIP, self.q(stack))
            uc.reg_write(self.x.UC_X86_REG_RSP, stack + 8)

    return Native


def replay(image, pe):
    Native = native_class()
    cases, steps = 0, 0
    for existing in [None, *range(47, 101)]:
        native = Native(image, pe, 'aura', existing)
        native.uc.reg_write(native.x.UC_X86_REG_RCX, native.alloc(32))
        native.uc.reg_write(native.x.UC_X86_REG_RDX, native.alloc(0xd60))
        native.run(0x145b08d20)
        fields = list(native.inserted)
        if existing is not None:
            assert struct.unpack('<I', native.uc.mem_read(native.node + 8, 4))[0] == 0
            fields.append((existing, 0))
        assert sorted(fields) == [(field, 0) for field in range(47, 101)]
        cases += 1
        steps += native.steps
    for old in [0, 1, 17, 0xfffffff2, 0xfffffff3, 0xfffffff4, 0xfffffff5, 0xffffffff]:
        for speed in [0x40e00000, 0x41066667, 0x41766667]:
            for guid in [1, 0x123456789abcdef0]:
                native = Native(image, pe, 'caller')
                frame, driver = 0x10004000, native.alloc(0x2000)
                native.uc.reg_write(native.x.UC_X86_REG_RBP, frame)
                native.uc.reg_write(native.x.UC_X86_REG_RSI, driver)
                native.uc.reg_write(native.x.UC_X86_REG_RDI, 0)
                native.put(driver + 0x1188, native.alloc(0xb0))
                native.put(driver + 0x1190, 1)
                native.write(frame + 0x550, struct.pack('<I', old))
                native.put(frame + 0x1f20, guid)
                native.write(frame + 0x2014, struct.pack('<I', speed))
                native.write(frame + 0x1f90, struct.pack('<fff', 1., -2., 3.))
                native.write(0x146fd9044, struct.pack('<f', 0.5))
                native.run(0x145c24b79)
                assert [opcode for opcode, _ in native.sent] == [0xa9, 0xea, 0xc7, 0xe2]
                assert native.sent[1][1] == packed_guid(guid) + struct.pack('<I', (old + 10) & 0xffffffff)
                assert native.sent[2][1] == struct.pack('<Iffff', (old + 11) & 0xffffffff, 1., -2., 3., 0.5)
                assert native.sent[3][1] == packed_guid(guid) + struct.pack('<II', (old + 12) & 0xffffffff, speed)
                assert struct.unpack('<I', native.uc.mem_read(frame + 0x2010, 4))[0] == (old + 13) & 0xffffffff
                cases += 1
                steps += native.steps
    return cases, steps


def source_checks():
    mover = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/player_mover.rs').read_text()
    body = mover.split('fn restart_player_entry(', 1)[1].split('/// The report-driven', 1)[0]
    assert 'fields: (47..101).map(|field| (field, 0)).collect()' in body
    assert 'previous_sequence.wrapping_add(10)' in body
    assert body.index('.root(false)') < body.index('.teleport(position, facing)') < body.index('PlayerMoverEvent::RunSpeed')
    assert 'counter: self.player_mover.next()' in body and 'speed: self.player_mover.run_speed' in body
    assert 'self.events.splice(0..0' in body and '.speed(' not in body
    terminal = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/terminal.rs').read_text()
    start = terminal.index('state.restart_mover = (action == TerminalAction::Again)')
    assert terminal.index('session.mechanics = None;', start) > start
    assert 'map(Mechanics::player_mover_sequence)' in terminal[start:]
    entry = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    start = entry.index('game.finish_player_entry();')
    assert entry.index('terminal.take_restart_mover()', start) < entry.index('terminal.begin(entry_owned);', start)
    assert 'game.restart_player_entry(sequence, spawn, zone.facing);' in entry[start:]
    assert 'self.restart_mover = None;' in terminal
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}[(platform.system(), platform.machine())]
    parser = ROOT / '.tools/rust' / ('1.98.1-' + host) / 'bin/rustfmt'
    paths = ['crates/azeroth-survivors-re/src/gameplay/mechanics/player_mover.rs',
             'crates/azeroth-survivors-re/src/gameplay/terminal.rs',
             'crates/azeroth-survivors-re/src/gameplay/mod.rs']
    for path in paths:
        subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true', path],
                       cwd=ROOT, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    return len(paths)


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    proof = json.loads((BASE / 'manifest.json').read_text())
    target = {key: value for key, value in latest_target().items()
              if key in ('version', 'path', 'sha256', 'size_bytes')}
    assert target == proof['target'] and proof['target_executed'] is False
    image = target_bytes(target)
    pe = load_script('again_runes_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly, instructions = [], 0
    for row in proof['ranges']:
        start, end = int(row['start'], 0), int(row['end_exclusive'], 0)
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + end - start]
        assert digest(raw) == row['sha256'] and hex(at) == row['file_offset']
        decoded = list(decoder.disasm(raw, start))
        assert sum(item.size for item in decoded) == len(raw)
        instructions += len(decoded)
        assembly.append('; ' + row['role'] + '\n' + ''.join(
            f'{item.address:016x} {item.bytes.hex():32} {item.mnemonic} {item.op_str}\n' for item in decoded))
    assert receipt(proof['assembly']).read_text() == '\n'.join(assembly)
    for row in proof['queries']:
        result = json.loads(receipt(row['result']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert verify_native_query_subject(ROOT, native, row, target, image=image, pe=pe) == row['subject_verification']
        assert receipt(row['canonical_extract']).read_text() == native['normalized_result']
    cases, steps = replay(image, pe)
    files = source_checks()
    return dict(status='passed', target_version=target['version'], target_sha256=target['sha256'],
                native_queries=len(proof['queries']), instructions_verified=instructions,
                isolated_native_cases=cases, original_instruction_steps=steps,
                rust_syntax_paths=files, rust_regressions_executed=False,
                compilation_run=False, game_client_server_execution=False, parity_verified=False)


if __name__ == '__main__':
    print(json.dumps(check(), indent=2))
