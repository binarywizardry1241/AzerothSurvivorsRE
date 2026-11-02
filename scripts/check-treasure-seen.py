#!/usr/bin/env python3
"""Replay the current displayed-offer Seen producer with bounded native x64.

Allocation, cloning/copying use explicit fixture seams; native variant filtering,
order, key selection, quality-byte publication and vector append execute.
No compiler, game, filesystem save, OS, layout or UI runs.
"""
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
START, END = 0x14595d7bb, 0x14595d970
OUT = ROOT / 'docs/analysis/evidence/0.112.0/jewelry/seen-validation.json'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('seen_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    probe = EquipmentProbe(data, pe, [(START, END)])
    game, queue, choices, bp = probe.HEAP + 0x100000, probe.HEAP + 0x110000, probe.HEAP + 0x120000, probe.STACK + 0x100000
    cases, digest = 0, hashlib.sha256()
    for length in range(5):
        for variants in itertools.product(range(4), repeat=length):
            for existing in [0, 2]:
                probe.cursor = probe.HEAP + 0x1000
                probe.native.mem_write(game, bytes(0x1000))
                probe.native.mem_write(queue, bytes(0x1000))
                probe.native.mem_write(choices, bytes(0x1000))
                probe.native.mem_write(bp - 0x100, bytes(0x900))
                probe.put(game + 0x658, choices, length)
                probe.put(game + 0x698, 64, queue, existing)
                probe.put(bp + 0x128, game)
                for i in range(existing):
                    probe.output(queue + i * 32, 'retained-' + str(i))
                    probe.native.mem_write(queue + i * 32 + 24, bytes([i + 1]))
                expected = [('retained-' + str(i), i + 1) for i in range(existing)]
                for index, variant in enumerate(variants):
                    at = choices + index * 160
                    # 0 gold, 1 ordinary ability pointer/nonniche, 2 jewelry,
                    # 3 owned amulet. These current producer discriminants are
                    # separately read from the selected caller below.
                    tag = 0x8000000000000000 | variant if variant != 1 else 0x12340000
                    probe.put(at + 0x78, tag)
                    quality = [0, 4, 2, 255][index]
                    probe.native.mem_write(at + 0x98, bytes([quality]))
                    if variant == 2:
                        # Use actual current jewelry definitions, including Star.
                        row = [22, 0, 21, 4][index]
                        pointer = 0x146c00368 + row * 72
                        probe.put(at + 0x80, pointer)
                        expected.append((probe.pair(pointer), quality))
                    elif variant == 3:
                        pointer = probe.alloc(24)
                        key = ['mark_of_fordring', 'legendary:demonic_empowerment', '', 'mark_of_fordring'][index]
                        probe.output(pointer, key)
                        probe.put(at + 0x80, pointer)
                        expected.append((key, quality))
                probe.reg('RDI', game)
                probe.reg('RBP', bp)
                probe.reg('RSP', bp - 0x80)
                probe.stop = END
                probe.native.emu_start(START, 0, count=10000)
                assert probe.reg('RIP') == END
                count = probe.q(game + 0x6a8)
                observed = [(probe.pair(queue + i * 32 + 8), probe.native.mem_read(queue + i * 32 + 24, 1)[0]) for i in range(count)]
                assert observed == expected, (variants, existing, observed, expected)
                digest.update(json.dumps(observed, ensure_ascii=False).encode())
                cases += 1
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/treasure.rs').read_text()
    function = source.split('pub(super) fn generate_cache_choices(', 1)[1].split('#[cfg(test)]', 1)[0]
    assert function.index('self.effect_state.seen.extend(') < function.index('self.treasure_state.offers = offers;')
    assert 'TreasureChoice::Gold { .. } => None' in function
    assert 'TreasureChoice::Jewelry { definition, rarity } => Some((definition.key.to_owned(), *rarity as u8))' in function
    assert 'TreasureChoice::Amulet { definition, rarity, .. } => Some((definition.key.clone(), *rarity as u8))' in function
    at = pe.rva_offset(START - pe.image_base)
    proof = dict(target=target, interval=dict(address=hex(START), end_exclusive=hex(END),
                 sha256=hashlib.sha256(data[at:at + END - START]).hexdigest()),
                 cases=cases, output_sha256=digest.hexdigest(), host_calls=probe.calls,
                 observed_contract='Display-time jewelry/amulet keys and raw quality bytes append in order; ordinary ability/gold rows skip; prior queued records survive.',
                 limits=['Synthetic choice records use current native tag layout; real jewelry definitions and owned amulet keys supply payloads.',
                         'Allocation/clone/copy are supplied; capacity is preallocated. Native append/filter/order code executes; actual reallocation, save I/O and Rust do not.',
                         'Current regular tick gates, source save queues, rendering, compilation and parity are not executed by this fixture.'])
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(json.dumps(proof, indent=2) + '\n')
    else:
        assert json.loads(OUT.read_text()) == proof
    print(f'Checked {cases} current native displayed-offer Seen sequences; no compiler/game/save I/O')


if __name__ == '__main__':
    main()
