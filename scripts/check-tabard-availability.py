#!/usr/bin/env python3
"""Replay current tabard availability, combined inventory and class look projection.

The actual native gate, purchased-ID scan, grant iterator, inventory accessor,
class getter and appearance admission/projector execute. Native allocation,
bytes and an empty baseline outfit are declared host seams. No compiler/game.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OWNERS = dict(admission=0x1459b6f30, iterator=0x1459d2e10,
              inventory=0x1458d4270, cosmetic_grants=0x1459d2a10,
              class_getter=0x1458da080, appearance_admission=0x1458d1ba0,
              projector=0x1458d1d40)


def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    rows = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json').read_text())['tabards']
    cosmetics = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory-cosmetics-0.112.0.json').read_text())['cosmetics']

    class Probe(EquipmentProbe):
        def hook(self, uc, pc, size, unused):
            if pc == self.stop or any(a <= pc and pc + size <= b for a, b in self.ranges):
                return super().hook(uc, pc, size, unused)
            c, d, n = (self.reg(x) for x in ['RCX', 'RDX', 'R8'])
            if pc == 0x145c0a3e7:
                a, b = bytes(self.native.mem_read(c, n)), bytes(self.native.mem_read(d, n))
                self.reg('RAX', ((a > b) - (a < b)) & 0xffffffffffffffff)
            elif pc == 0x145c0d470:
                stride = self.q(self.reg('RSP') + 40)
                capacity = max(self.q(c) * 2, d + n, 4)
                at = self.alloc(capacity * stride)
                if d:
                    self.native.mem_write(at, bytes(self.native.mem_read(self.q(c + 8), d * stride)))
                self.put(c, capacity, at)
            elif pc == 0x1459956a0:
                self.native.mem_write(c, bytes(19 * 4))
                self.reg('RAX', c)
            else:
                return super().hook(uc, pc, size, unused)
            self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
            sp = self.reg('RSP')
            self.reg('RSP', sp + 8)
            self.reg('RIP', self.q(sp))

    probe = Probe(data, pe, [(a, ends[a]) for a in OWNERS.values()])
    base = probe.cursor
    cases = []
    for row in rows:
        for earned in [[], [row['zone']] if row['zone'] else ['feat:herod']]:
            for position in [-1, 0, 15, 16]:
                probe.cursor = base
                purchased = [1] * 17
                if position >= 0:
                    purchased[position] = row['id']
                save, keys, ids = [probe.alloc(n) for n in [0x1d0, 24 * len(earned), 4 * len(purchased)]]
                probe.native.mem_write(ids, struct.pack('<17I', *purchased))
                probe.put(save + 0xa8, len(earned), keys, len(earned))
                probe.put(save + 0x108, len(purchased), ids, len(purchased))
                for index, key in enumerate(sorted(earned)):
                    probe.output(keys + index * 24, key)
                iterator, out = probe.alloc(24), probe.alloc(24)
                probe.put(iterator, 0x14721c358, 0x14721c358 + 20 * 64, save)
                probe.invoke(OWNERS['iterator'], out, iterator)

                def values(at):
                    count = probe.q(at + 16)
                    return list(struct.unpack('<' + 'I' * count,
                                              probe.native.mem_read(probe.q(at + 8), count * 4)))

                got = values(out)
                # A descriptor gate excludes purchase fallback, including old
                # purchased90016 records after its0.112 conversion to Herod.
                want = [v['id'] for v in rows if (v['zone'] in earned if v['zone'] is not None
                                                 else v['id'] in purchased)]
                assert got == want, (row['id'], earned, position, got, want)
                inventory = probe.alloc(24)
                probe.invoke(OWNERS['inventory'], inventory, save)
                allgot = values(inventory)
                allwant = want + [v['id'] for v in cosmetics if v['achievement'] in earned]
                assert allgot == allwant
                record, out = probe.alloc(232), probe.alloc(232)
                probe.native.mem_write(record + 18 * 8, struct.pack('<II', 1, row['id']))
                probe.native.mem_write(record + 0xe4, b'\x01')
                probe.put(save + 0x48, 1, record, 1)
                probe.reg('R9', 1)
                probe.invoke(OWNERS['class_getter'], out, save, 1)
                look = probe.q(out + 18 * 8) & 0xffffffff == 1
                assert look == (row['id'] in want), (row['id'], earned, position, look)
                cases.append(dict(id=row['id'], earned=earned, purchased_position=position,
                                  granted=got, inventory=allgot, look_kept=look))
    source = (ROOT / 'crates/azeroth-survivors-re/src/progression.rs').read_text()
    assert 'self.zone.as_ref().map_or_else(' in source
    assert '|| account.tabards.contains(&self.id),' in source
    assert '|key| account.earned.contains(key),' in source
    assert '.filter(|tabard| tabard.available(&account))' in source

    def span(a):
        b = ends[a]
        offset = pe.rva_offset(a - pe.image_base)
        return dict(va=hex(a), end_exclusive=hex(b), byte_count=b - a,
                    sha256=hashlib.sha256(data[offset:offset + b - a]).hexdigest())

    return dict(target_sha256=SHA, application_executed=False, rebuilt_code_executed=False,
                native_instructions_executed=True,
                owners={name: span(a) for name, a in OWNERS.items()},
                cases=len(cases), case_digest=hashlib.sha256(json.dumps(cases, separators=(',', ':')).encode()).hexdigest(),
                legacy_scarlet_cases=[v for v in cases if v['id'] == 90016], calls=probe.calls,
                limits=[
                    'All20 descriptors execute with absent/first/SIMD-lane/scalar-tail purchases and absent/present gates, for160 iterator/inventory/class-appearance cases.',
                    'The actual tabard appearance admission executes. No synthetic inventory or tabard-availability result replaces these native consumers.',
                    'Allocation/Vec growth, byte comparison/copy and zero baseline outfit are declared seams. Other equipment fields are empty; this checks tabard ownership/projection rather than baseline ordinary gear.',
                    'No compiler, Rust execution, application, native file operation, device or original/rebuilt comparison.',
                ])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    proof = recover()
    directory = ('runtime/native-evidence/0.112.0/tabard-availability' if args.stage
                 else 'docs/analysis/evidence/0.112.0/tabard-availability')
    path = ROOT / directory / 'cases.json'
    if args.stage:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(proof, indent=2) + '\n')
    else:
        assert json.loads(path.read_text()) == proof
    print('Passed160 current tabard grant/inventory/class-look cases including legacy90016 purchases')


if __name__ == '__main__':
    main()
