#!/usr/bin/env python3
"""Replay the current Armory slot producer/filter with declared typed metadata.

No compiler, game, IO, or reconstructed Rust code executes. The item metadata
seam supplies only slots independently read from current armor/weapon records;
all class guards, candidate iteration and earned-feat membership execute natively.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OWNERS = {
    'collector': 0x1400853e0,
    'predicate': 0x1400f8890,
    'class_slots': 0x1459962d0,
    'earned_membership': 0x1458dd750,
}
CANDIDATES = [0, 2, 14, 4, 9, 8, 5, 6, 7, 15, 16, 17]
CLASS_IDS = [1, 2, 3, 4, 5, 7, 8, 9, 11]
KEYS = ['feat:vancleef', 'feat:hakkar', 'feat:cthun', 'feat:azuregos',
        'feat:nefarian', 'feat:nou', 'feat:herod']


def digest(value):
    return hashlib.sha256(json.dumps(value, separators=(',', ':')).encode()).hexdigest()


def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def raw(a, n):
        offset = pe.rva_offset(a - pe.image_base)
        assert offset is not None
        return data[offset:offset + n]

    def q(a):
        return struct.unpack('<Q', raw(a, 8))[0]

    def span(a, b):
        return dict(va=hex(a), end_exclusive=hex(b), byte_count=b - a,
                    sha256=hashlib.sha256(raw(a, b - a)).hexdigest())

    assert list(raw(0x145dbc290, 12)) == CANDIDATES
    assert raw(0x145dbbf68, 78).decode() == ''.join(KEYS)
    armor_slots = list(raw(0x14721f164, 8))
    assert armor_slots == [0, 2, 4, 5, 6, 7, 8, 9]
    asset = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory.json').read_text())
    assert sum(len(row['items']) for row in asset['classes']) == 415
    class_slots, metadata, class_proof = {}, {}, []
    for cid in CLASS_IDS:
        # Both current copies refer to the same304-byte class records.
        at = q(0x1472206f8 + (cid - 1) * 8)
        assert at == q(0x147220868 + (cid - 1) * 8)
        assert raw(at + 297, 1)[0] == cid
        weapon_ptr, count = struct.unpack('<QQ', raw(at + 120, 16))
        weapons = [raw(weapon_ptr + i * 144 + 140, 1)[0] for i in range(count)]
        slots = armor_slots + weapons
        class_slots[cid] = set(slots)
        for index, slot in enumerate(slots):
            metadata[100000 + cid * 1000 + index * 100] = slot
        hero = next(row for row in asset['classes'] if row['id'] == cid)
        for piece in hero['items']:
            assert piece['slot_id'] == slots[piece['slot']], (cid, piece['id'])
        class_proof.append(dict(id=cid, native_slots=slots, class_record=span(at, at + 304),
                                weapon_records=span(weapon_ptr, weapon_ptr + count * 144)))

    class Probe(EquipmentProbe):
        def hook(self, uc, pc, size, unused):
            if pc == self.stop or any(a <= pc and pc + size <= b for a, b in self.ranges):
                return super().hook(uc, pc, size, unused)
            rcx, rdx, r8 = (self.reg(v) for v in ['RCX', 'RDX', 'R8'])
            if pc == 0x1459963c0:
                # Typed metadata seam: only the slot field is consumed here.
                # Slot grammar comes from the independently recovered current
                # constructor in evidence/0.112.0/balance/ordinary-gear-reader.ghidra.c.
                assert rdx in metadata, hex(rdx)
                self.native.mem_write(rcx, bytes(112))
                self.native.mem_write(rcx + 104, bytes([metadata[rdx]]))
                self.reg('RAX', rcx)
            elif pc == 0x145c0a3e7:
                a, b = bytes(self.native.mem_read(rcx, r8)), bytes(self.native.mem_read(rdx, r8))
                self.reg('RAX', ((a > b) - (a < b)) & ((1 << 64) - 1))
            elif pc == 0x145c0d470:
                stride = self.q(self.reg('RSP') + 40)
                count = self.q(rcx + 16)
                capacity = max(4, self.q(rcx) * 2, count + r8)
                at = self.alloc(capacity * stride)
                if count:
                    self.native.mem_write(at, bytes(self.native.mem_read(self.q(rcx + 8), count * stride)))
                self.put(rcx, capacity, at)
            else:
                return super().hook(uc, pc, size, unused)
            self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
            sp = self.reg('RSP')
            self.reg('RSP', sp + 8)
            self.reg('RIP', self.q(sp))

    probe = Probe(data, pe, [(a, ends[a]) for a in OWNERS.values()])
    base = probe.cursor
    provider_cases = []
    for cid in range(256):
        for slot in range(19):
            probe.invoke(OWNERS['class_slots'], cid, slot)
            got = bool(probe.reg('RAX') & 255)
            assert got == (slot in class_slots.get(cid, set())), (cid, slot, got)
            provider_cases.append([cid, slot, got])
    vectors = []
    for cid in CLASS_IDS + [0, 6, 10, 12, 255]:
        for mask in range(128):
            probe.cursor = base
            earned = sorted(key for i, key in enumerate(KEYS) if mask >> i & 1)
            save, strings, cls, iterator, out = [probe.alloc(n) for n in [0x1d0, 7 * 24, 1, 32, 24]]
            for index, key in enumerate(earned):
                probe.output(strings + index * 24, key)
            probe.put(save + 0xa8, len(earned), strings, len(earned))
            probe.native.mem_write(cls, bytes([cid]))
            probe.put(iterator, 0x145dbc290, 0x145dbc29c, cls, save)
            probe.invoke(OWNERS['collector'], out, iterator)
            got = list(probe.native.mem_read(probe.q(out + 8), probe.q(out + 16)))
            allowed = class_slots.get(cid, set()).copy()
            if set(earned) & set(KEYS[:4]):
                allowed.add(0)
            if set(earned) & set(KEYS[4:]):
                allowed.add(14)
            want = [slot for slot in CANDIDATES if slot in allowed]
            assert got == want, (cid, mask, got, want)
            vectors.append([cid, mask, got])
    art = [raw(q(0x145e0bd40 + i * 8), q(0x145e0bdc8 + i * 8)).decode() for i in range(17)]
    assert art[14] == 'chest'  # Preserve the target's Back placeholder.
    source = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    assert 'const EQUIPMENT_ORDER: [usize; 12] = [0, 2, 14, 4, 9, 8, 5, 6, 7, 15, 16, 17];' in source
    assert '14 => "Chest"' in source and '17 => "Ranged"' in source
    assert 'for slot in equipment_slots(catalog, state.class_id(), gear)' in source
    # Exact builder LEAs/calls bind the candidate range and collector to the
    # vector passed to the already recovered equipment viewport wrappers.
    def rip_target(at, size, offset):
        return at + size + struct.unpack('<i', raw(at + offset, 4))[0]
    assert raw(0x1400feb7b, 3) == bytes.fromhex('488d05')
    assert rip_target(0x1400feb7b, 7, 3) == 0x145dbc290
    assert raw(0x1400feb89, 3) == bytes.fromhex('488d05')
    assert rip_target(0x1400feb89, 7, 3) == 0x145dbc29c
    for at, to in [(0x1400febbd, OWNERS['collector']), (0x1400fed3e, 0x140288ec0)]:
        assert raw(at, 1) == b'\xe8' and rip_target(at, 5, 1) == to
    return dict(
        target_sha256=SHA, application_executed=False, rebuilt_code_executed=False,
        native_instructions_executed=True, candidate_array=span(0x145dbc290, 0x145dbc29c),
        candidates=CANDIDATES, ordinary_armor_slots=span(0x14721f164, 0x14721f16c),
        classes=class_proof, connected_item_slots=415,
        feat_keys=KEYS, empty_row_art=art, art_pointers=span(0x145e0bd40, 0x145e0be50),
        owners={name: span(a, ends[a]) for name, a in OWNERS.items()},
        producer=span(0x1400fe650, ends[0x1400fe650]),
        provider_cases=len(provider_cases), provider_digest=digest(provider_cases),
        slot_vector_cases=len(vectors), slot_vector_digest=digest(vectors),
        calls=probe.calls,
        limits=[
            'Current collector, slot predicate, class-slot provider and sorted earned-feat lookup execute original instructions.',
            'The ordinary item metadata seam supplies only current armor/weapon slot fields, independently checked against415 source item slots; it does not execute item names/effects.',
            'Allocation, Vec growth and byte comparison are explicit host seams. The rebuild producer and presentation forwarding are statically recovered, not executed here.',
            'No filesystem, application, reconstructed Rust, rendering, build or original/rebuilt parity check runs.',
        ])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    record = recover()
    directory = ('runtime/analysis/staging/native-evidence/0.112.0/armory-slots' if args.stage
                 else 'docs/analysis/evidence/0.112.0/armory-slots')
    path = ROOT / directory / 'cases.json'
    if args.stage:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(record, indent=2) + '\n')
    else:
        assert json.loads(path.read_text()) == record
    print('Passed4864 native class-slot cases and1792 ordered vectors, with415 current source item slot fields')


if __name__ == '__main__':
    main()
