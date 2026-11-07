#!/usr/bin/env python3
"""Replay current Horn eligibility from original AS reward instructions.

Only the declared predicate prefix runs in a synthetic CPU/memory fixture.
No external call, game process, compilation or Rust execution is admitted.
"""
from portable_paths import portable_json_text, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct

import capstone
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as x

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
TABLE, COUNT, STRIDE = 0x146fe05c8, 113, 120
START, STOP = 0x14596cd85, 0x14596ce0f
RUNTIME = ROOT / 'runtime/analysis/history/native-recovery/as-ui-contracts/09a4d154b813'
OUT = ROOT / 'docs/analysis/evidence/0.113.2/as-ui-contracts-horn.json'
SOURCE = 'crates/azeroth-survivors-re/src/loot_rewards.rs'
CATALOG = 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.113.2'
    data = target_bytes(target)
    pe = load_script('horn_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + count]
        assert len(value) == count
        return value

    def span(first, last):
        return dict(va=hex(first), end_exclusive=hex(last), byte_count=last - first,
                    sha256=hashlib.sha256(raw(first, last - first)).hexdigest())

    chunks = re.findall(r'AbilityDefinition \{(.*?)\n    \},', (ROOT / CATALOG).read_text().split(
        'pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0], re.S)
    assert len(chunks) == COUNT
    descriptors = []
    for index, chunk in enumerate(chunks):
        address = TABLE + index * STRIDE
        pointer, length = struct.unpack('<QQ', raw(address, 16))
        key = raw(pointer, length).decode()
        native_tag, native_kind = struct.unpack('<I', raw(address + 104, 4))[0], raw(address + 117, 1)[0]
        source_key = json.loads(re.search(r'key:\s*("[^"]+")', chunk)[1])
        source_tag = int(re.search(r'effect: StatusEffect \{ tag: (\d+)', chunk)[1])
        source_kind = int(re.search(r'kind: (\d+)', chunk)[1])
        projected_tag = {11: 10, 12: 11, 13: 12}.get(native_tag, native_tag)
        assert (source_key, source_tag, source_kind) == (key, projected_tag, native_kind), (source_key, source_tag, source_kind, key, projected_tag, native_kind)
        descriptors.append(dict(key=key, va=address, native_kind=native_kind,
                                native_tag=native_tag, source_tag=source_tag))

    source = (ROOT / SOURCE).read_text()
    predicate = source.split('pub fn enables_war_horn(self)', 1)[1].split('pub fn enables_seal_damned', 1)[0]
    tags = [int(value.strip()) for value in re.search(r'matches!\(self.native_subtype_at_104, ([^)]+)\)', predicate)[1].split('|')]
    assert tags == [7, 8, 9, 10, 12]
    assert 'self.native_kind_at_117 == 9' in predicate
    assert 'definition.tag == 16 && !has_horn_spell' in source

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(row['rva'] + max(row['raw_size'], row['virtual_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    game, frame, learned = 0x200000000, 0x200004000, 0x200008000
    machine.mem_map(game, 0x10000)
    executed = set()

    def hook(uc, address, size, unused):
        if address == STOP:
            uc.emu_stop()
        elif START <= address < STOP:
            executed.add(address)
        else:
            raise RuntimeError(f'Unreviewed native excursion {address:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)
    observations = []
    neutral = descriptors[0]
    for row in descriptors:
        for role in ('base', 'learned'):
            base = row if role == 'base' else neutral
            learned_row = None if role == 'base' else row
            machine.mem_write(game + 0x410, struct.pack('<Q', base['va']))
            machine.mem_write(game + 0x330, struct.pack('<QQ', learned, int(learned_row is not None)))
            machine.mem_write(learned, struct.pack('<Q', learned_row['va'] if learned_row else 0))
            machine.mem_write(frame + 0x1d0, bytes(4))
            for name, value in [('RBX', game), ('RBP', frame), ('RSP', frame + 0x2000), ('EFLAGS', 2)]:
                machine.reg_write(getattr(x, 'UC_X86_REG_' + name), value)
            machine.emu_start(START, 0, count=256)
            assert machine.reg_read(x.UC_X86_REG_RIP) == STOP
            actual = struct.unpack('<I', machine.mem_read(frame + 0x1d0, 4))[0]
            expected = int(row['native_kind'] == 9 and row['source_tag'] in tags)
            assert actual == expected, (row['key'], role, actual, expected)
            observations.append(dict(key=row['key'], role=role, eligible=bool(actual)))

    # Bind the actual mask, unsigned subtraction guard and both predicate paths.
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    instructions = list(decoder.disasm(raw(START, STOP - START), START))
    assert sum(row.size for row in instructions) == STOP - START
    assert [row.op_str for row in instructions if row.mnemonic == 'mov' and row.op_str.startswith('r9b,')] == ['r9b, 0x4f'] * 2
    assert all(any(row.address == address and row.mnemonic == 'add' and row.op_str == 'ecx, -7'
                   for row in instructions) for address in (0x14596cda7, 0x14596cde6))
    evidence_path = RUNTIME / 'reward-choices/rea/003-procedure_pseudo_code.json'
    evidence = json.loads(evidence_path.read_text())['response']['result']['structuredContent']
    owner = span(0x14596cbb0, 0x14596e080)
    assert evidence['provider']['id'] == 'ghidra'
    assert evidence['subject']['digest']['sha256'] == owner['sha256']
    RUNTIME.mkdir(parents=True, exist_ok=True)
    cases = RUNTIME / 'horn-cases.json'
    cases.write_text(portable_json_text(observations))
    proof = dict(schema_version=1, target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                 reward_owner=owner, predicate=span(START, STOP), descriptor_table=span(TABLE, TABLE + COUNT * STRIDE),
                 descriptor_count=COUNT, descriptor_source_projection_checked=True,
                 native_effect_tags=[7, 8, 9, 10, 13], stable_source_effect_tags=tags,
                 native_cases=len(observations), executed_instruction_boundaries=len(executed),
                 detailed_cases=dict(path=cases.relative_to(ROOT).as_posix(), sha256=file_sha256(cases)),
                 ghidra=dict(evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                             analysis_profile=evidence['analysis_profile'],
                             pseudocode_sha256=hashlib.sha256(evidence['normalized_result'].encode()).hexdigest()),
                 source=[dict(path=name, sha256=file_sha256(ROOT / name)) for name in (SOURCE, CATALOG, 'crates/azeroth-survivors-re/tests/loot_rewards.rs')],
                 limits=['Exact current base/learned Horn predicate and all current descriptor inputs only.',
                         'Full reward construction, mutation aliases, generic ECS resources and UI are not established by this prefix.',
                         'Raw Ghidra import omits immutable data and external callees; instruction replay uses the actual current PE.',
                         'No external seam, compiler, Rust execution, game launch or original/rebuilt parity comparison.'],
                 gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(portable_json_text(proof))
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(proof), 'Current Horn proof is stale'
    print(f'Checked {COUNT} descriptors and {len(observations)} original Horn predicate cases; no compiler/game')


if __name__ == '__main__':
    main()
