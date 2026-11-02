#!/usr/bin/env python3
"""Check current choice producers and ordinary upgrade type consumers statically.

Executes original instructions with the existing explicit mapped-image fixture.
It does not compile Rust, launch a game, or establish arbitrary Game-pointer
ancestry. The encoded-CALL scan is restricted to these selected AS interfaces.
"""
import argparse
import bisect
import hashlib
import json
import math
from pathlib import Path
import re
import struct

import capstone
import native_talent_fixture as native
from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
TABLE, COUNT, STRIDE = 0x146bf5eb0, 113, 120
OUT = ROOT / 'docs/analysis/evidence/0.112.0/choice-contracts.json'
RUNTIME = ROOT / 'runtime/choice-contracts-0.112.0'
CALL_TARGETS = {0x145961590, 0x145993420, 0x1459cb2a0, 0x1459f4900, 0x1459d8300}
EXPECTED_CALLS = {
    0x1458965c0: 0x145993420, 0x14596748a: 0x145993420, 0x1459f49d2: 0x145993420,
    0x14595d10e: 0x1459cb2a0, 0x145961e62: 0x1459cb2a0,
    0x1459ec285: 0x1459cb2a0, 0x1459ec32f: 0x1459cb2a0,
    0x145961ef3: 0x1459d8300, 0x1459d83ac: 0x1459f4900,
    0x14595d69a: 0x145961590, 0x145965288: 0x145961590,
    0x14596568c: 0x145961590, 0x1459657fb: 0x145961590,
    0x145965901: 0x145961590, 0x1459ec39b: 0x145961590,
}
SOURCE_FILES = [
    'crates/azeroth-survivors-re/src/player_abilities/upgrades.rs',
    'crates/azeroth-survivors-re/src/player_abilities/behavior.rs',
    'crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs',
    'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs',
    'crates/azeroth-survivors-re/src/run_effects/actions.rs',
]


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def raw(address, size):
    offset = native.pe.rva_offset(address - native.pe.image_base)
    result = native.data[offset:offset + size]
    assert len(result) == size
    if size:
        assert native.pe.rva_offset(address - native.pe.image_base + size - 1) == offset + size - 1
    return result


def span(start, end):
    value = raw(start, end - start)
    return dict(va=hex(start), end_exclusive=hex(end), byte_count=len(value),
                sha256=hashlib.sha256(value).hexdigest())


class Machine(native.Machine):
    def hook(self, uc, address, size, unused):
        if address == 0x145c0a441:
            # The current spell-description writer calls the ceilf import.
            value = struct.unpack('<f', (uc.reg_read(native.UC_X86_REG_XMM0) & 0xffffffff).to_bytes(4, 'little'))[0]
            assert math.isfinite(value), 'Nonfinite prose ceilf is outside this fixture'
            rounded = float(math.ceil(value))
            sp = uc.reg_read(native.UC_X86_REG_RSP)
            uc.reg_write(native.UC_X86_REG_XMM0, int.from_bytes(struct.pack('<f', rounded), 'little'))
            uc.reg_write(native.UC_X86_REG_RIP, self.q(sp))
            uc.reg_write(native.UC_X86_REG_RSP, sp + 8)
            self.seams.add(address)
            return
        # Amulet constructor scenarios use pick counts0/1: both current and
        # next-rank exponents are0. Only the exact identity powf(x,0)=1 is
        # supplied, never an arbitrary Windows floating-point implementation.
        if address == 0x145c0a465:
            exponent = uc.reg_read(native.UC_X86_REG_XMM1) & 0xffffffff
            assert exponent in (0, 0x80000000), 'Nonzero powf exponent is outside this fixture'
            sp = uc.reg_read(native.UC_X86_REG_RSP)
            uc.reg_write(native.UC_X86_REG_XMM0, 0x3f800000)
            uc.reg_write(native.UC_X86_REG_RIP, self.q(sp))
            uc.reg_write(native.UC_X86_REG_RSP, sp + 8)
            self.seams.add(address)
            return
        super().hook(uc, address, size, unused)


def put_float(vm, address, value):
    vm.u.mem_write(address, struct.pack('<f', value))


def instance(vm, definition, modified=False):
    at = vm.alloc(88)
    vm.put(at, definition)
    vm.u.mem_write(at + 8, struct.pack('<I', 3 if modified else 1))
    for offset in (0x10, 0x14, 0x1c, 0x20, 0x38, 0x3c, 0x44, 0x48, 0x50):
        put_float(vm, at + offset, 1.0)
    if modified:
        for offset, value in ((0x10, 1.5), (0x14, 0.6), (0x1c, 1.75), (0x20, 1.5)):
            put_float(vm, at + offset, value)
        vm.u.mem_write(at + 0x18, struct.pack('<I', 1))
        vm.u.mem_write(at + 0x24, struct.pack('<5I', 3, 2, 1, 4, 5))
    return at


def descriptors():
    rows = []
    source = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    chunks = re.findall(r'AbilityDefinition \{(.*?)\n    \},', source.split(
        'pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0], re.S)
    assert len(chunks) == COUNT
    for index, chunk in enumerate(chunks):
        address = TABLE + STRIDE * index
        key_pointer, key_length = struct.unpack('<QQ', raw(address, 16))
        key = raw(key_pointer, key_length).decode()
        pointer, count = struct.unpack('<QQ', raw(address + 0x30, 16))
        assert count <= 32
        tags = list(raw(pointer, count))
        assert set(tags) <= set(range(5))
        assert json.loads(re.search(r'\bkey:\s*("[^"]+")', chunk)[1]) == key
        source_tags = [int(value) for value in re.search(r'upgrade_types:\s*&\[([^]]*)\]', chunk)[1].split(',') if value.strip()]
        assert source_tags == tags, (key, source_tags, tags)
        rows.append(dict(key=key, address=address, pointer=pointer, tags=tags))
    return rows


def callers():
    """Find encoded direct CALLs missed behind currently unresolved dispatches.

    A complete independent linear decode supplies instruction boundaries only;
    it does not assign actual flow ownership or certify every candidate live.
    """
    extents = sorted((native.pe.image_base + a, native.pe.image_base + b)
                     for a, b, _ in native.pe.functions())
    starts, decoded, found, rejected = [a for a, _ in extents], {}, [], []
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    for section in native.pe.sections:
        if not int(section['characteristics'], 16) & 0x20000000:
            continue
        value = native.data[section['raw_offset']:section['raw_offset'] + section['raw_size']]
        base, position = native.pe.image_base + section['rva'], -1
        while True:
            position = value.find(b'\xe8', position + 1)
            if position < 0:
                break
            if position + 5 > len(value):
                continue
            site = base + position
            target = site + 5 + struct.unpack_from('<i', value, position + 1)[0]
            if target not in CALL_TARGETS:
                continue
            index = bisect.bisect_right(starts, site) - 1
            start, end = extents[index]
            if not start <= site < end:
                rejected.append(dict(site=hex(site), target=hex(target), reason='outside-declared-extent'))
                continue
            if start not in decoded:
                instructions = list(decoder.disasm(raw(start, end - start), start))
                assert sum(row.size for row in instructions) == end - start
                decoded[start] = {row.address: row for row in instructions}
            instruction = decoded[start].get(site)
            if instruction is None or instruction.mnemonic != 'call' or instruction.size != 5:
                rejected.append(dict(site=hex(site), target=hex(target), reason='not-a-linear-CALL-boundary'))
                continue
            found.append(dict(site=hex(site), target=hex(target), declared_extent=span(start, end),
                              instruction_sha256=hashlib.sha256(instruction.bytes).hexdigest(),
                              actual_ghidra_body_owner_inferred=False))
    assert {int(row['site'], 16): int(row['target'], 16) for row in found} == EXPECTED_CALLS
    return found, rejected


def replay(rows):
    vm = Machine()
    observations, constructor_rows, collector_rows = [], [], []
    game = vm.alloc(0x2000)
    stats = game + 0x480
    put_float(vm, stats + 8, 1.0)
    rarity_ptr = vm.alloc(8)
    sum_input = vm.alloc(32)
    display = vm.alloc(160)
    for modified in (False, True):
        for descriptor in rows:
            ability = instance(vm, descriptor['address'], modified)
            vm.put(game + 0x330, ability, 1)
            for rarity in range(5):
                vm.put(rarity_ptr, rarity)
                capture = vm.alloc(80)
                pointer, count = descriptor['pointer'], len(descriptor['tags'])
                vm.put(capture, pointer, pointer + count, descriptor['address'], ability,
                       stats, ability, stats, rarity_ptr, ability, rarity_ptr)
                output = vm.alloc(24)
                vm.call(0x1459cb2a0, output, capture)
                kinds = list(vm.u.mem_read(vm.q(output + 8), vm.q(output + 16)))
                # This is an ordered filter, not merely a set/domain check.
                remaining = iter(descriptor['tags'])
                assert all(any(candidate == kind for candidate in remaining) for kind in kinds)
                collector_rows.append(dict(key=descriptor['key'], modified=modified, rarity=rarity, kinds=kinds))
                for selector in (0, 1):
                    if selector == 0:
                        vm.put(sum_input, 1 << 63, vm.q(descriptor['address']), vm.q(descriptor['address'] + 8), 0)
                    else:
                        # The weighted producer's one-byte candidate is discarded
                        # and rebuilt by the constructor's current collector.
                        byte = vm.alloc(1)
                        vm.u.mem_write(byte, bytes(descriptor['tags'][:1] or [0]))
                        vm.put(sum_input, 1, byte, 1, 0)
                    try:
                        vm.call(0x145961590, display, game, sum_input, rarity)
                    except RuntimeError as error:
                        raise RuntimeError((descriptor['key'], modified, rarity, selector)) from error
                    header = vm.q(display + 0x78)
                    assert (header == 1 << 63) if selector == 0 else (header < 1 << 63)
                    emitted = [] if selector == 0 else list(vm.u.mem_read(vm.q(display + 0x80), vm.q(display + 0x88)))
                    assert set(emitted) <= set(kinds)
                    if selector == 1:
                        assert len(emitted) == min(len(kinds), 2 if rarity == 4 else 1)
                    destination = accept_prefix(vm, game, display)
                    expected = relative_target(0x146c0c7b0, selector)
                    assert destination == expected
                    constructor_rows.append(dict(key=descriptor['key'], modified=modified, rarity=rarity,
                                                 selector=selector, output_nonnegative=header < 1 << 63,
                                                 emitted_kinds=emitted, accept_destination=hex(destination)))
    # Exercise the three other complete constructor branches with real current
    # jewelry/amulet payloads; only powf's exponent-zero identity is supplied.
    for selector in (2, 3, 4):
        if selector == 2:
            vm.put(sum_input, (1 << 63) | selector, 0x146c00368, 0, 0)
        elif selector == 3:
            amulet = vm.alloc(112)
            vm.call(0x1458a1730, amulet, 0x146bf88e0)
            vm.put(sum_input, (1 << 63) | selector, amulet, 0, 0)
        else:
            vm.put(sum_input, (1 << 63) | selector, 25, 0, 0)
        for rarity in range(5):
            vm.call(0x145961590, display, game, sum_input, rarity)
            assert vm.q(display + 0x78) == (1 << 63) | selector
            destination = accept_prefix(vm, game, display)
            assert destination == relative_target(0x146c0c7b0, selector)
            constructor_rows.append(dict(selector=selector, rarity=rarity, output_header=hex(vm.q(display + 0x78)),
                                         accept_destination=hex(destination)))
    # All five lanes reach their actual magnitude CALL from this controlled
    # accept-loop frame, using bytes from each descriptor's permitted slice.
    for descriptor in rows:
        ability = instance(vm, descriptor['address'])
        for kind in descriptor['tags']:
            for rarity in range(5):
                frame, vector = vm.S + 0x80000, vm.alloc(1)
                vm.u.mem_write(vector, bytes([kind]))
                vm.put(frame + 0x2b8, vector)
                for reg, value in ((native.UC_X86_REG_RDI, ability), (native.UC_X86_REG_RSI, 1),
                                   (native.UC_X86_REG_RBP, frame), (native.UC_X86_REG_R12, rarity),
                                   (native.UC_X86_REG_RSP, vm.S + 0x180000)):
                    vm.u.reg_write(reg, value)
                vm.u.emu_start(0x1459673e9, 0x14596748a, count=100)
                assert vm.u.reg_read(native.UC_X86_REG_RIP) == 0x14596748a
                assert vm.u.reg_read(native.UC_X86_REG_RCX) == ability
                assert vm.u.reg_read(native.UC_X86_REG_RDX) & 255 == kind
                assert vm.u.reg_read(native.UC_X86_REG_R8) == rarity
                observations.append(dict(key=descriptor['key'], kind=kind, rarity=rarity))
    return dict(collector=dict(cases=len(collector_rows), output_sha256=digest(collector_rows),
                               ordered_filter_of_current_descriptor_slice=True),
                constructor_to_accept_prefix=dict(cases=len(constructor_rows), output_sha256=digest(constructor_rows),
                                                   full_constructor_executed=True, full_accept_executed=False),
                accept_magnitude_call_prefix=dict(cases=len(observations), output_sha256=digest(observations)),
                fixture_seams=[hex(value) for value in sorted(vm.seams)]), dict(
                    collector=collector_rows, constructor=constructor_rows, accept_magnitude=observations)


def relative_target(table, selector):
    return table + struct.unpack('<i', raw(table + selector * 4, 4))[0]


def accept_prefix(vm, game, display):
    vm.put(game + 0x658, display, 1)
    vm.u.mem_write(game + 0xadf, b'\x02')
    vm.u.mem_write(game + 0xadd, b'\x00')
    vm.u.reg_write(native.UC_X86_REG_RCX, game)
    vm.u.reg_write(native.UC_X86_REG_RDX, 0)
    vm.u.reg_write(native.UC_X86_REG_RSP, vm.S + 0x100008)
    vm.u.emu_start(0x145966a60, 0x145966b24, count=100)
    assert vm.u.reg_read(native.UC_X86_REG_RIP) == 0x145966b24
    return vm.u.reg_read(native.UC_X86_REG_RDX)


def source_contract():
    sources = {name: (ROOT / name).read_text() for name in SOURCE_FILES}
    upgrades, behavior = [sources[name] for name in SOURCE_FILES[:2]]
    enum = upgrades.split('pub enum UpgradeKind {', 1)[1].split('}', 1)[0]
    assert re.findall(r'(\w+) = (\d+)', enum) == [
        ('Power', '0'), ('Cooldown', '1'), ('Targets', '2'), ('Area', '3'), ('Duration', '4')]
    assert 'pub upgrade_counts: [u32; 5]' in behavior and 'upgrade_counts: [0; 5]' in behavior
    assert 'Serialize' not in behavior and 'Deserialize' not in behavior
    for text in sources.values():
        assert 'UpgradeKind::Haste' not in text and 'Haste = 5' not in text
    source_rows = [dict(path=path, sha256=file_sha256(ROOT / path)) for path in SOURCE_FILES]
    return dict(files=source_rows, ordinary_upgrade_tags=list(range(5)), upgrade_count_lanes=5,
                obsolete_haste_variant_and_prose_removed=True, runtime_instance_is_serialized=False)


def ghidra_contract():
    path = ROOT / 'docs/analysis/evidence/0.112.0/choice-contracts-ghidra.json'
    manifest = json.loads(path.read_text())
    assert manifest['target_sha256'] == SHA
    for row in manifest['observations']:
        assert hashlib.sha256(raw(int(row['va'], 16), row['byte_count'])).hexdigest() == row['sha256']
        assert row['provider'] == dict(id='ghidra', name='Ghidra', version='12.1.4')
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def import_contract():
    entries = {int(row['iat_start_address'], 16) + index * 8: (row['library'], name)
               for row in native.pe.imports() for index, name in enumerate(row['functions'])}
    result = []
    for address, name in ((0x145c0a441, 'ceilf'), (0x145c0a465, 'powf')):
        encoded = raw(address, 6)
        assert encoded[:2] == bytes.fromhex('ff25')
        iat = address + 6 + struct.unpack('<i', encoded[2:])[0]
        library, actual = entries[iat]
        assert actual == name
        result.append(dict(name=name, library=library, iat=hex(iat), thunk=span(address, address + 6)))
    return result


def prepare_rea():
    latest_target(verify=True)
    for role, start, end in (('collector', 0x1459cb2a0, 0x1459cb44f),
                             ('prose-adapter', 0x1459d8300, 0x1459d83d1)):
        work = RUNTIME / role
        work.mkdir(parents=True, exist_ok=True)
        (work / 'code.bin').write_bytes(raw(start, end - start))
        (work / 'seeds.tsv').write_text(f'{start:#x}\tcode\n{start:#x}\tfunction\n')
        plan = dict(target=str((work / 'code.bin').relative_to(ROOT)), output=str((work / 'rea').relative_to(ROOT)),
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                    init_timeout=60, timeout=180,
                    environment={'REA_GHIDRA_SEED_FILE': str((work / 'seeds.tsv').relative_to(ROOT))},
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
        (work / 'plan.json').write_text(json_text(plan))
    print('Prepared scoped current collector and prose-adapter REA/Ghidra plans')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.112.0' and target['sha256'] == SHA
    if args.prepare_rea:
        prepare_rea()
        return
    rows = descriptors()
    calls, rejected = callers()
    results, complete = replay(rows)
    RUNTIME.mkdir(parents=True, exist_ok=True)
    # Bulk fixtures remain regenerable runtime evidence. The compact commitment
    # is stable and retained alongside the selected source fix.
    inventory = RUNTIME / 'native-cases.json'
    inventory.write_text(json_text(complete))
    proof = dict(schema_version=1, target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 generator=dict(path='scripts/check-choice-contracts.py', sha256=file_sha256(Path(__file__))),
                 canonical_producer_contracts='docs/analysis/evidence/0.112.0/native-producer-contracts.json',
                 focused_ghidra_observations=ghidra_contract(),
                 descriptor_table=span(TABLE, TABLE + COUNT * STRIDE), descriptors=COUNT,
                 descriptor_upgrade_domain=sorted(set(tag for row in rows for tag in row['tags'])),
                 encoded_direct_callers=calls, rejected_encoded_candidates=rejected,
                 new_call_facts_beyond_observed_ghidra_references=['0x145961e62', '0x145961ef3', '0x14596748a'],
                 native_results=results, source=source_contract(),
                 native_fixture=dict(path='scripts/native_talent_fixture.py', sha256=file_sha256(ROOT / 'scripts/native_talent_fixture.py')),
                 fixture_import_bindings=import_contract(),
                 detailed_cases=dict(path=inventory.relative_to(ROOT).as_posix(), sha256=file_sha256(inventory)),
                 unresolved_contracts=[
                     'Game+0x330 learned-instance definition-pointer ancestry for arbitrary current run state is not universally proved by descriptor fixtures.',
                     'Constructor and accept domains are checked for complete current constructor scenarios; every possible mutable Game+0x650 Vec alias/mutation is not proved.',
                     'The selected closure/Vec/caller evidence does not create native Ghidra body ownership or globally admit unguarded computed dispatch.',
                 ], limits=[
                     'All113 immutable descriptor slices match source; collector fixtures cover two explicit states and five rarities, not all floating-point or run state.',
                     'Native constructor executes fully for current ordinary inputs and three concrete reward payloads; accept executes only its gate/dispatch and magnitude-call prefixes.',
                     'Accept magnitude-call cases supply the native loop register/frame context and descriptor bytes; they do not execute full accept or prove arbitrary live choice-pointer ancestry.',
                     'Allocator/C-memory/English fallback use existing explicit seams. Finite prose ceilf uses host ceil; amulet powf is supplied only at exponent0, using its exact identity.',
                     'No compiler, reconstructed Rust execution, gameplay, UI rendering or original/rebuilt parity.',
                 ], gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.write_text(json_text(proof))
    else:
        assert json.loads(OUT.read_text()) == proof, 'Choice contract proof is missing or stale'
    print(f'Checked{COUNT} descriptor slices, {len(calls)} selected direct CALLs, '
          f"{results['collector']['cases']} collector scenarios, "
          f"{results['constructor_to_accept_prefix']['cases']} full-constructor/prefix cases and "
          f"{results['accept_magnitude_call_prefix']['cases']} accept CALL contexts; no compiler/game")


if __name__ == '__main__':
    main()
