#!/usr/bin/env python3
"""Recover current player-ability records from the SHA-bound PE, without execution.

The generated Rust catalog is standalone source: building it needs no EXE.
Native consumer recovery is owned by player-abilities-0.97.2.md and the separate
behavior report. A table record alone does not establish behavior parity.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
CATALOG = ROOT / "crates/azeroth-survivors-re/src/player_abilities/catalog.rs"
EVIDENCE = ROOT / "docs/analysis/evidence/0.97.2/player-abilities/catalog.json"
NATIVE = (
    (0x1454F94C0, 0x1454F96C1, 'upgrade-magnitude', 'PE RUNTIME_FUNCTION'),
    (0x14540F1C0, 0x14540F41A, 'learned-rarity', 'PE RUNTIME_FUNCTION'),
    (0x1455292B0, 0x145529460, 'collect-upgrade-types', 'PE RUNTIME_FUNCTION'),
    (0x145472190, 0x14547231E, 'eligible-upgrade-iterator', 'PE RUNTIME_FUNCTION'),
    (0x14540DA00, 0x14540DB5E, 'definition-upgrade-gates', 'Leaf code: all return branches, followed by INT3 padding'),
    (0x14541B790, 0x14541B8AF, 'passive-cooldown-gate', 'All return branches, followed by INT3 padding'),
    (0x14541B8B0, 0x14541B9C4, 'passive-minimum-interval', 'Leaf code: all return branches, followed by INT3 padding'),
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check", action="store_true", help="compare generated text, without writes")
    modes.add_argument("--prepare-native", action="store_true", help="write exact slices and REA plans under runtime")
    modes.add_argument("--collect-native", action="store_true", help="retain completed REA evidence and original disassembly")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA256, "selected target SHA-256 mismatch"
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def span(offset, size):
        raw = data[offset:offset + size]
        assert len(raw) == size
        return dict(file_offset=hex(offset), virtual_address=hex(pe.offset_va(offset)),
                    size_bytes=size, sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    def pair(offset):
        address, size = struct.unpack_from("<QQ", data, offset)
        return pe.rva_offset(address - pe.image_base), size

    def string(offset):
        at, size = pair(offset)
        assert 0 < size < 10000
        return data[at:at + size].decode("utf-8")

    def u32(offset):
        return struct.unpack_from("<I", data, offset)[0]

    def float_source(offset):
        return f"f32::from_bits(0x{u32(offset):08x})"

    if args.prepare_native or args.collect_native:
        directory = ROOT / 'runtime/player-abilities-0.97.2'
        directory.mkdir(parents=True, exist_ok=True)
        analyses = []
        for address, end, name, boundary in NATIVE:
            at = pe.rva_offset(address - pe.image_base)
            original = span(at, end - address)
            original.pop('raw_hex')
            original.update(end_virtual_address_exclusive=hex(end), boundary_source=boundary)
            if args.prepare_native:
                (directory / f'{address:x}.bin').write_bytes(data[at:at + end - address])
                plan = dict(target=f'runtime/player-abilities-0.97.2/{address:x}.bin',
                            output=f'runtime/player-abilities-0.97.2/rea-{address:x}',
                            open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
                            timeout=180, open_timeout=90, cleanup_timeout=60,
                            environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS': '180000'},
                            operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(address)), timeout=240)])
                (directory / f'plan-{address:x}.json').write_text(portable_json(plan, indent=2) + '\n')
            else:
                record = json.loads((directory / f'rea-{address:x}/003-procedure_pseudo_code.json').read_text())
                evidence = record['response']['result']['structuredContent']
                assert evidence['subject']['digest']['sha256'] == original['sha256']
                assert evidence['provider']['id'] == 'ghidra'
                code = evidence['normalized_result']
                assert isinstance(code, str) and code
                destination = EVIDENCE.parent
                destination.mkdir(parents=True, exist_ok=True)
                (destination / f'{name}.ghidra.c').write_text(code)
                assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                                                    f'--start-address={address}', f'--stop-address={end}',
                                                    str(TARGET)], cwd=ROOT, text=True)
                (destination / f'{name}.asm').write_text(assembly)
                analyses.append(dict(name=name, original_bytes=original, rea_evidence=evidence))
        if args.collect_native:
            jumps = {}
            for address, count in ((0x1469AD1C0, 5), (0x14671D188, 5), (0x14671D19C, 8), (0x1469ACEE0, 5)):
                at = pe.rva_offset(address - pe.image_base)
                jumps[hex(address)] = dict(source=span(at, count * 4),
                                          targets=[hex(address + off) for off in struct.unpack_from('<' + 'i' * count, data, at)])
            scalars = {}
            for address in (0x1458EB480, 0x1458EB488, 0x1458EB50C, 0x1458ED010, 0x1458F6620,
                            0x1458F6624, 0x1458F6628, 0x1458F662C, 0x1458F8D40, 0x1458F8DE4,
                            0x1458F8E00, 0x1458FC8AC, 0x1458FCC38, 0x145A41854, 0x145BCAED0,
                            0x145C14470, 0x14671D270, 0x14671D274, 0x1469AD098):
                at = pe.rva_offset(address - pe.image_base)
                scalars[hex(address)] = dict(source=span(at, 4), value=struct.unpack_from('<f', data, at)[0])
            output = dict(target=dict(path=str(TARGET.relative_to(ROOT)), sha256=SHA256),
                          method='Unchanged current native slices at original VAs through REA/Ghidra; original PE data and instructions control Windows x64 argument mapping.',
                          limitations=['Raw import uses generic GCC ABI, not the original Windows x64 ABI.',
                                       'Raw slices omit callees and referenced data. Indirect magnitude/definition switches remain unresolved in Ghidra; original PE tables and assembly bind their branches.',
                                       'No emulation, compilation or target execution occurred.'],
                          analyses=analyses, jump_tables=jumps, scalars=scalars)
            address, end = 0x1454C2EB0, 0x1454C63E5
            at = pe.rva_offset(address - pe.image_base)
            owner = span(at, end - address)
            owner.pop('raw_hex')
            assert owner['sha256'] == 'fa34d349dd4e7597bc1f2da2f90bcae0cdef33ed8128f0837a0ec72110d63c49'
            output['victim_damage_owner'] = dict(
                original=owner, rea_evidence_id='ev_ba95562638ee7eaae2ea1dc88d80c5df86859a014473f69b678b229aacd357bd',
                reused_current_evidence='docs/analysis/evidence/0.97.2/loot/rea-provenance.json',
                original_assembly='docs/analysis/evidence/0.97.2/loot/enemy-death.asm',
                multiplier_span=['0x1454c2f90', '0x1454c3398'],
                health_and_meter_span=['0x1454c33c0', '0x1454c35c3'],
                low_health_threshold=span(pe.rva_offset(0x14590AE44 - pe.image_base), 4),
                limits='Source ports the victim multiplier/health/meter inputs; downstream packets, lifesteal, proc and death/loot order still require the real run adapter.')
            (EVIDENCE.parent / 'upgrades-native.json').write_text(portable_json(output, indent=2) + '\n')
        print('Prepared seven exact native slices' if args.prepare_native else 'Collected seven SHA-bound REA records plus current PE instruction/data evidence')
        return

    quote = lambda value: json.dumps(value, ensure_ascii=False)
    rust = ['//! Generated from the verified 0.97.2 PE; see recover-player-abilities.py.',
            '//! Native definition stride120; class stride144. No runtime EXE dependency.',
            '', '#[derive(Clone, Copy, Debug, PartialEq)]',
            'pub struct StatusEffect { pub tag: u32, pub value: f32, pub duration: f32 }',
            '', '#[derive(Clone, Copy, Debug)]', 'pub struct AbilityDefinition {',
            "    pub key: &'static str,", "    pub name: &'static str,", "    pub icon: &'static str,",
            "    pub upgrade_types: &'static [u8],", '    pub spell_id: u32,',
            '    pub base_power: f32,', '    pub base_cooldown: f32,', '    pub range: f32,',
            '    pub radius: f32,', '    pub targets: u32,', '    pub duration: f32,',
            '    pub ticks: u32,',
            '    /// Stored definition+96. Actual travel uses the native spell-ID speed lookup.',
            '    pub projectile_speed: f32,', '    pub pulse_spell_id: u32,',
            '    pub effect: StatusEffect,', '    pub school: u8,', '    pub kind: u8,', '}', '',
            'impl AbilityDefinition {',
            "    pub fn by_key(key: &str) -> Option<&'static Self> { ABILITIES.iter().find(|a| a.key == key) }",
            '    /// Native spell-name lookup1454193f0 selects the first matching record.',
            '    /// Spell IDs are not unique: Holy Shock and Penance both use25912.',
            '    /// Use the key for ability identity; use for_spell_id to inspect aliases.',
            "    pub fn by_spell_id(id: u32) -> Option<&'static Self> { ABILITIES.iter().find(|a| a.spell_id == id) }",
            "    pub fn for_spell_id(id: u32) -> impl Iterator<Item = &'static Self> { ABILITIES.iter().filter(move |a| a.spell_id == id) }",
            '}', '', '#[derive(Clone, Copy, Debug)]', 'pub struct ClassAbilities {',
            '    pub class_id: u8,', "    pub key: &'static str,", "    pub starter: &'static str,",
            "    pub pool: &'static [&'static str],", '}', '',
            'pub static ABILITIES: &[AbilityDefinition] = &[']
    records = []
    floats = {68: 'base_power', 72: 'base_cooldown', 76: 'range', 80: 'radius',
              88: 'duration', 96: 'projectile_speed'}
    integers = {64: 'spell_id', 84: 'targets', 92: 'ticks', 100: 'pulse_spell_id'}
    for index in range(112):
        at = 0x6718A68 + index * 120
        names = dict(zip(('key', 'name', 'icon'), (string(at + off) for off in (0, 16, 32))))
        upgrades_at, size = pair(at + 48)
        upgrades = list(data[upgrades_at:upgrades_at + size])
        assert upgrades and len(upgrades) <= 5 and all(kind < 5 for kind in upgrades)
        fields = {name: struct.unpack_from('<f', data, at + off)[0] for off, name in floats.items()}
        fields.update({name: u32(at + off) for off, name in integers.items()})
        fields.update(school=data[at + 116], kind=data[at + 117])
        effect = dict(tag=u32(at + 104), value=struct.unpack_from('<f', data, at + 108)[0],
                      duration=struct.unpack_from('<f', data, at + 112)[0])
        records.append(dict(**names, **fields, upgrade_types=upgrades, effect=effect,
                            record=span(at, 120), upgrade_slice=span(upgrades_at, size)))
        rust.append('    AbilityDefinition {')
        rust.extend(f'        {name}: {quote(value)},' for name, value in names.items())
        rust.append(f'        upgrade_types: &{upgrades},')
        for off, name in sorted({**floats, **integers}.items()):
            value = float_source(at + off) if off in floats else str(u32(at + off))
            rust.append(f'        {name}: {value},')
        rust.extend([f'        effect: StatusEffect {{ tag: {effect["tag"]}, value: {float_source(at + 108)}, duration: {float_source(at + 112)} }},',
                     f'        school: {fields["school"]}, kind: {fields["kind"]},', '    },'])
    assert len({record['key'] for record in records}) == 112
    rust.extend(['];', '', 'pub static CLASSES: &[ClassAbilities] = &['])
    classes = []
    for index in range(9):
        at = 0x6717768 + index * 144
        pool_at, count = pair(at + 48)
        pool = [string(pool_at + i * 16) for i in range(count)]
        key, starter, class_id = string(at + 16), string(at + 64), data[at + 140]
        assert starter in pool and all(any(a['key'] == entry for a in records) for entry in pool)
        classes.append(dict(key=key, starter=starter, class_id=class_id, pool=pool, record=span(at, 144)))
        rust.append(f'    ClassAbilities {{ class_id: {class_id}, key: {quote(key)}, starter: {quote(starter)}, pool: &[{", ".join(map(quote, pool))}] }},')
    rust.append('];')
    constants = {}
    for name, address, count, fmt in (
        ('upgrade_power', 0x1469AD0D4, 5, 'f'), ('upgrade_cooldown', 0x1469AD100, 5, 'f'),
        ('upgrade_targets', 0x1469AD130, 5, 'I'), ('upgrade_area', 0x1469AD160, 5, 'f'),
        ('upgrade_duration', 0x1469AD190, 5, 'f'), ('cast_kind_weight_2_to_8', 0x1469ACA9C, 7, 'f'),
        ('initial_power', 0x14671CFA8, 5, 'f'), ('initial_cooldown', 0x14671CF3C, 5, 'f'),
    ):
        at = pe.rva_offset(address - pe.image_base)
        constants[name] = dict(values=list(struct.unpack_from('<' + fmt * count, data, at)), source=span(at, 4 * count))
    evidence = dict(target=dict(path=str(TARGET.relative_to(ROOT)), sha256=SHA256, size_bytes=len(data)),
                    method='Read-only PE-backed Rust strings, slices, scalar fields and constants; no execution.',
                    record_layout={'stride': 120, 'upgrade_types': 48, 'spell_id': 64, 'base_power': 68,
                                   'base_cooldown': 72, 'range': 76, 'radius': 80, 'targets': 84,
                                   'duration': 88, 'ticks': 92, 'projectile_speed': 96, 'pulse_spell_id': 100,
                                   'effect_tag_value_duration': [104, 108, 112], 'school': 116, 'kind': 117},
                    definitions=records, classes=classes, constants=constants,
                    limitations=['Raw school/kind/effect tags are retained; consumer recovery owns their semantics.',
                                 'Table extraction and source reproduction are not compilation or gameplay parity.'])
    roster = ['# Player-ability catalog — 0.97.2', '',
              'Generated from the hash-bound current PE by `recover-player-abilities.py`.',
              'These are definition values before the recovered cast/upgrade multipliers.',
              'See [source and behavior](player-abilities-0.97.2.md) for formulas and limitations.', '',
              '| Key | Kind | Base power | Base cooldown (s) | Range | Radius | Targets | Duration | Ticks | Upgrade tags |',
              '| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |']
    for row in records:
        values = [row[name] for name in ('base_power', 'base_cooldown', 'range', 'radius', 'targets', 'duration', 'ticks')]
        formatted = ' | '.join(f'{value:.7g}' for value in values)
        roster.append(f'| `{row["key"]}` | {row["kind"]} | {formatted} | {", ".join(map(str, row["upgrade_types"]))} |')
    roster.extend(['', 'Upgrade tags:0 power,1 cooldown,2 targets,3 area,4 duration.', '',
                   'School/kind/status tags, original record bytes, exact f32 bits, class pools and starter keys',
                   'are retained in [catalog evidence](evidence/0.97.2/player-abilities/catalog.json).',
                   'No EXE is required by a source build. No game execution or compilation was used here.'])
    outputs = {CATALOG: '\n'.join(rust) + '\n', EVIDENCE: json.dumps(evidence, ensure_ascii=False, indent=2) + '\n',
               ROOT / 'docs/analysis/player-ability-catalog-0.97.2.md': '\n'.join(roster) + '\n'}
    for path, text in outputs.items():
        if args.check:
            assert path.read_text() == text, f'generated source drift: {path.relative_to(ROOT)}'
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
    print(('Checked' if args.check else 'Recovered') + ' 112 abilities, 9 class pools and 8 constant tables; no target execution.')


if __name__ == '__main__':
    main()
