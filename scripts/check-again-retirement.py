#!/usr/bin/env python3
"""Check hash-bound native Again retirement and connected source without building.

Unicorn executes only the selected original collector/delivery instructions.
Allocation, vector growth/copy/free, settlement, packet delivery and replacement
construction are explicit seams. No game, socket, Bevy system or Rust executes.
"""

from script_sources import current_path, recorded_input_matches
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/0.123.0/again-retirement"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


class Native:
    def __init__(self, image, pe):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn import x86_const as x
        self.x = x
        self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        self.pages = set()
        self.cursor = 0x30000000
        self.sent = []
        self.constructed = False
        self.stopped = False
        for a, b in [(0x145b1dd80, 0x145b1ea56), (0x145c8c6a0, 0x145c8c7e0),
                     (0x145c23740, 0x145c24ef9), (0x145c6ab70, 0x145c6abc4),
                     (0x14732a810, 0x14732a820)]:
            at = pe.rva_offset(a - pe.image_base)
            self.write(a, image[at:at + b - a])
        self.seams = {
            0x140002200, 0x1400021c0, 0x1400021d0, 0x146005df0,
            0x14600504b, 0x145c21730, 0x145c0bd80, 0x145c26320,
            0x145c027f0,
        }
        for a in self.seams | {0x10000, 0x145c2379a}:
            self.write(a, b'\xc3') if a in self.seams or a == 0x10000 else None
        self.map(0x10000000, 0x20000)
        self.uc.reg_write(x.UC_X86_REG_RSP, 0x10010008)
        self.write(0x10010008, struct.pack('<Q', 0x10000))
        self.uc.hook_add(UC_HOOK_CODE, self.hook)

    def map(self, address, count):
        for page in range(address & ~0xfff, (address + count + 0xfff) & ~0xfff, 0x1000):
            if page not in self.pages:
                self.uc.mem_map(page, 0x1000)
                self.pages.add(page)

    def write(self, address, raw):
        self.map(address, len(raw))
        self.uc.mem_write(address, raw)

    def alloc(self, count):
        address = self.cursor
        self.cursor += ((max(count, 1) + 15) // 16) * 16
        self.map(address, max(count, 1))
        return address

    def q(self, address):
        return struct.unpack('<Q', self.uc.mem_read(address, 8))[0]

    def put(self, address, value):
        self.write(address, struct.pack('<Q', value))

    def reg(self, name):
        return self.uc.reg_read(getattr(self.x, 'UC_X86_REG_' + name))

    def hook(self, uc, address, size, user):
        if address in (0x10000, 0x145c2379a):
            self.stopped = True
            uc.emu_stop()
            return
        if address not in self.seams:
            return
        a, b, c, d = (self.reg(name) for name in ('RCX', 'RDX', 'R8', 'R9'))
        value = 0
        if address == 0x1400021c0:
            value = self.alloc(a)
        elif address == 0x146005df0:
            old_capacity, old_pointer, old_len = (self.q(a + offset) for offset in (0, 8, 16))
            capacity = max(old_capacity * 2, b + c, 4)
            value = self.alloc(capacity * d)
            if old_len:
                self.write(value, bytes(uc.mem_read(old_pointer, old_len * d)))
            self.put(a, capacity)
            self.put(a + 8, value)
        elif address == 0x14600504b:
            self.write(a, bytes(uc.mem_read(b, c)))
            value = a
        elif address == 0x145c0bd80:
            opcode = struct.unpack('<H', uc.mem_read(d + 24, 2))[0]
            payload = bytes(uc.mem_read(self.q(d + 8), self.q(d + 16)))
            self.sent.append((opcode, payload))
        elif address == 0x145c26320:
            self.constructed = True
            uc.emu_stop()
            return
        uc.reg_write(self.x.UC_X86_REG_RAX, value)
        stack = self.reg('RSP')
        uc.reg_write(self.x.UC_X86_REG_RIP, self.q(stack))
        uc.reg_write(self.x.UC_X86_REG_RSP, stack + 8)

    def vector(self, owner, field, count, stride, guid_offset, ids):
        pointer = self.alloc(max(count * stride, 8))
        self.put(owner + field, pointer)
        self.put(owner + field + 8, count)
        for index, guid in enumerate(ids):
            self.put(pointer + index * stride + guid_offset, guid)
        return pointer

    def game(self, owner, n):
        self.map(owner, 0xd60)
        expected = []
        families = [(0x5b8, 0x1e0, 0xf0, 100), (0x660, 0x48, 0x28, 200),
                    (0x5d0, 0x58, 0x18, 300), (0x648, 0x78, 0x58, 400),
                    (0xd0, 0x80, 0x20, 500), (0x958, 0x20, 0, 600),
                    (0x9f8, 0x70, 0x38, 800), (0xa10, 8, 0, 900)]
        for field, stride, offset, base in families:
            ids = [base + i for i in range(n)]
            if field == 0x5d0:
                ids = [guid if i % 3 else 0 for i, guid in enumerate(ids)]
            ptr = self.vector(owner, field, n, stride, offset, ids)
            if field == 0x660:
                auxiliaries = []
                for i in range(n):
                    row = [1000 + i * 3 + j for j in range(i % 3)]
                    target = self.alloc(max(len(row) * 8, 8))
                    for j, value in enumerate(row):
                        self.put(target + j * 8, value)
                    self.put(ptr + i * stride + 8, target)
                    self.put(ptr + i * stride + 16, len(row))
                    auxiliaries.extend(row)
                expected.extend(ids)
                expected.extend(auxiliaries)
            elif field == 0x9f8:
                # The collector's tagged item pass sits before companions.
                item_ptr = self.vector(owner, 0x3a8, n, 0x48, 0x38, [700 + i for i in range(n)])
                expected.extend(0x4000000000000000 | (700 + i) for i in range(n))
                expected.extend(ids)
            else:
                expected.extend(guid for guid in ids if guid or field != 0x5d0)
        return expected

    def run(self, entry):
        self.uc.emu_start(entry, 0, count=2000000)
        assert self.stopped or self.constructed, hex(self.reg('RIP'))


def replay(image, pe):
    cases = 0
    for n in (0, 1, 2, 3, 4, 5, 7, 8, 15, 16, 17, 18, 19, 20):
        native = Native(image, pe)
        game, out = 0x20000000, 0x21000000
        expected = native.game(game, n)
        native.map(out, 24)
        native.uc.reg_write(native.x.UC_X86_REG_RCX, out)
        native.uc.reg_write(native.x.UC_X86_REG_RDX, game)
        native.run(0x145b1dd80)
        count, pointer = native.q(out + 16), native.q(out + 8)
        actual = list(struct.unpack('<' + 'Q' * count, native.uc.mem_read(pointer, count * 8))) if count else []
        assert actual == expected, (n, actual, expected)
        cases += 1
        for present, active, player in ((True, True, 42), (True, True, 0),
                                        (True, False, 42), (False, True, 42)):
            native = Native(image, pe)
            driver, frame = 0x22000000, 0x10004000
            native.map(driver, 0x2000)
            expected = native.game(driver + 0x10, n)
            native.put(driver + 0x10, 0 if present else 2)
            # The old Game's player GUID is its second u64, matching the caller.
            native.put(driver + 0x20, player)
            clients = native.alloc(0xb0)
            native.put(driver + 0x1188, clients)
            native.put(driver + 0x1190, 1 if active else 0)
            native.write(clients + 0xa8, b'\x01')
            native.uc.reg_write(native.x.UC_X86_REG_RSI, driver)
            native.uc.reg_write(native.x.UC_X86_REG_RBP, frame)
            native.run(0x145c24476)
            destroys = [struct.unpack('<Q', body)[0] for opcode, body in native.sent if opcode == 0xaa]
            assert native.q(driver + 0x10) == 2
            assert native.constructed == (present and active)
            assert destroys == (expected if present and active else [])
            gossip = [opcode for opcode, body in native.sent if opcode == 0x17e]
            assert gossip == ([0x17e] if present and active and player else [])
            assert not gossip or native.sent[0] == (0x17e, b'')
            cases += 1
    return cases


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    proof = json.loads((BASE / 'manifest.json').read_text())
    target = {k: v for k, v in latest_target(verify=True).items()
              if k in ('version', 'path', 'sha256', 'size_bytes')}
    assert target == proof['target'] and proof['target_executed'] is False
    image = target_bytes(target)
    pe = load_script('again_retirement_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = 0
    assembly = []
    for row in proof['ranges']:
        start, end = int(row['start'], 0), int(row['end_exclusive'], 0)
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + end - start]
        assert digest(raw) == row['sha256'] and hex(at) == row['file_offset']
        decoded = list(decoder.disasm(raw, start))
        assert sum(item.size for item in decoded) == len(raw)
        instructions += len(decoded)
        assembly.append('; ' + row['role'] + '\n' + ''.join(
            f'{item.address:016x} {item.bytes.hex():32} {item.mnemonic} {item.op_str}\n'
            for item in decoded))
    assert receipt(proof['assembly']).read_text() == '\n'.join(assembly)
    for row in proof['data_ranges']:
        at = pe.rva_offset(int(row['start'], 0) - pe.image_base)
        raw = image[at:at + row['byte_count']]
        assert raw.hex() == row['hex'] and digest(raw) == row['sha256']
    for row in proof['queries']:
        result = json.loads(receipt(row['result']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert verify_native_query_subject(ROOT, native, row, target, image=image, pe=pe) == row['subject_verification']
        assert receipt(row['canonical_extract']).read_text() == native['normalized_result']
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/terminal.rs').read_text()
    start = source.index('let retiring = (action == TerminalAction::Again)')
    assert source.index('session.mechanics = None;', start) > start
    assert '            retiring,' in source[start:]
    delivery = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text().split('fn finish_client_delivery(', 1)[1].split('fn native_requests(', 1)[0]
    assert delivery.index('flush_events(world);') < delivery.index('.extend(messages);')
    assert delivery.index('retiring.before_items') < delivery.index('client::inventory::retire(world)') < delivery.index('retiring.after_items')
    assert delivery.index('retiring.after_items') < delivery.index('session.set_paused(true);')
    assert delivery.index('runtime.flush_engine_events();') < delivery.index('runtime.route_world(0, packet);')
    assert delivery.index('runtime.route_world(0, packet);') < delivery.index('coop::publication::retire_inventory(world);') < delivery.index('for event in &after_items')
    assert 'SessionEvent::ObjectDestroyed' in delivery
    retirement = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/retirement.rs').read_text()
    assert retirement.index('map(|row| row.id)') < retirement.index('flat_map(|row| row.auxiliary)')
    assert 'remote_retirement_objects()' in retirement and 'self.boundary_objects.iter().copied()' in retirement
    boundary = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/boundary.rs').read_text()
    assert boundary.index('self.boundary_objects.push(object.guid);') < boundary.index('self.events.push(RunEvent::BoundaryPillar(object));')
    publication = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop_publish.rs').read_text()
    private = publication.split('fn retire_inventory(', 1)[1].split('fn publish_units(', 1)[0]
    assert 'inventory.retire()' in private and 'runtime.send(Some(client), packet.into_message());' in private
    assert 'route_world' not in private and 'state.units.clear()' not in private
    cases = replay(image, pe)
    return dict(status='passed', target_version=target['version'], target_sha256=target['sha256'],
                native_queries=len(proof['queries']), instructions_verified=instructions,
                bounded_native_cases=cases, target_executed=False, rust_executed=False,
                compilation_run=False, gameplay_verified=False, parity_verified=False)


if __name__ == '__main__':
    print(json.dumps(check(), indent=2))
