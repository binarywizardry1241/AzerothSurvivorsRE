#!/usr/bin/env python3
"""Replay one AS-linked U01 interval without compiling or starting a game."""
from runtime_layout import retained_runtime_path
import argparse
import csv
import gzip
import hashlib
import json
from pathlib import Path
import re
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, target_bytes
from native_recovery import bits, f32
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
FIRST, LAST = 0x145840D60, 0x145840F61
START, END = 0x145840D78, 0x145840F24
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/q41-u01'
PROBE = ROOT / 'runtime/analysis/history/findings/q41-u01/df7f818123c7/rea-pe'
TABLES = [('POWER', 0x14700BD34, 'f'), ('COOLDOWN', 0x14700BD60, 'f'),
          ('TARGETS', 0x14700BD90, 'I'), ('AREA', 0x14700BDC0, 'f'),
          ('DURATION', 0x14700BDF0, 'f')]
CASES = [0x145840D78, 0x145840E98, 0x145840DDC, 0x145840E70, 0x145840DB1]
SOURCE = 'crates/azeroth-survivors-re/src/player_abilities/upgrades.rs'


def committed(record):
    path = retained_runtime_path(ROOT / record['path'], ROOT)
    assert path.resolve().is_relative_to(ROOT)
    assert file_sha256(path) == record['sha256'], f'Input drift: {path}'
    return path


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def derive():
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('u01_pe', ROOT / 'scripts/inventory-executable.py').PE(image)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None
        value = image[offset:offset + count]
        assert len(value) == count
        return value

    queue_path = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
    queue = json.loads(queue_path.read_text())
    assert queue['target']['sha256'] == SHA
    ranges = committed(queue['inputs']['missing-executable-ranges.tsv.gz'])
    selected, hasher, count = None, hashlib.sha256(), 0
    with gzip.open(ranges, 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            if row['location'] != 'declared':
                continue
            projection = [row[key] for key in queue['selectors']['Q41-U01']['projection']]
            hasher.update((json.dumps(projection, ensure_ascii=False, separators=(',', ':')) + '\n').encode())
            count += 1
            if int(row['start'], 16) == START:
                selected = row
    assert count == queue['selectors']['Q41-U01']['records']
    assert hasher.hexdigest() == queue['selectors']['Q41-U01']['output_sha256']
    assert selected and int(selected['end_exclusive'], 16) == END
    assert selected['location'] == 'declared' and selected['category'] == 'mixed-unclassified'
    assert hashlib.sha256(raw(START, END - START)).hexdigest() == selected['sha256']
    assert dict((pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions())[FIRST] == LAST
    owner = raw(FIRST, LAST - FIRST)
    assert hashlib.sha256(owner).hexdigest() == '3f91df8d199dac8e4faeae9eac3ce9b68890f959c68d2e8d930f09cec7720eb5'
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoded = list(decoder.disasm(owner, FIRST))
    assert sum(i.size for i in decoded) == len(owner)
    assembly = '\n'.join(f'{i.address:x}: {i.mnemonic} {i.op_str}'.rstrip() for i in decoded) + '\n'
    assert (KEEP / 'magnitude.asm').read_text() == assembly
    relative = struct.unpack('<5i', raw(0x147014FF8, 20))
    assert [0x147014FF8 + offset for offset in relative] == CASES
    references = committed(queue['inputs']['references.tsv.gz'])
    with gzip.open(references, 'rt') as stream:
        incoming = [row for row in csv.DictReader(stream, delimiter='\t') if row['to'] == f'{FIRST:x}']
    assert [(row['from'], row['type']) for row in incoming] == [
        ('14599f060', 'UNCONDITIONAL_CALL'), ('1459a9372', 'UNCONDITIONAL_CALL'), ('1485b9a60', 'DATA')]
    callers = [(0x14599F053, 0x14599F06F), (0x1459A9362, 0x1459A937B)]
    caller_ranges = [dict(va=hex(a), end_exclusive=hex(b), sha256=hashlib.sha256(raw(a, b-a)).hexdigest())
                     for a, b in callers]

    source = (ROOT / SOURCE).read_text()
    values, tables = {}, []
    for name, address, fmt in TABLES:
        native = struct.unpack('<' + fmt * 5, raw(address, 20))
        declared = [float(v) for v in re.search(r'const ' + name + r':\s*\[[^]]+\]\s*=\s*\[([^]]+)\]', source)[1].split(',')]
        assert [bits(v) for v in native] == [bits(v) for v in declared], name
        values[name] = native
        tables.append(dict(name=name, address=hex(address), bytes_hex=raw(address, 20).hex()))
    assert all(f'{name} = {index}' in source for index, name in enumerate(['Power', 'Cooldown', 'Targets', 'Area', 'Duration']))
    assert 'assert!(rarity_index < 5)' in source

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], image[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    mem, stack, stop = 0x200000000, 0x300000000, 0x400000000
    for at in [mem, stack, stop]:
        u.mem_map(at, 0x10000)
    visited, endings = set(), []

    def hook(uc, address, size, unused):
        if address == stop or address == 0x145E9C123:
            endings.append(address)
            uc.emu_stop()
        else:
            assert FIRST <= address < LAST, f'Unreviewed native excursion {address:#x}'
            visited.add(address)

    u.hook_add(UC_HOOK_CODE, hook)
    profiles = [(0, 1., 1., 1., 0), (1, .5, 2., 2., 1), (7, .2, 5., 6., 12),
                (0xffffffff, -1., 6., 7., 0xffffffff), (16777217, 1.5, .5, .5, 2),
                (2, float('nan'), float('nan'), float('nan'), 3)]
    descriptors = [('ordinary', 0), ('ordinary', 11), ('seal_fate', 11), ('soul_fire', 11),
                   ('lightwell', 11), ('faerie_fire', 11), ('faerie_firx', 11)]
    cases, output_hash = 0, hashlib.sha256()

    def run(kind, rarity, key, cast, profile):
        u.mem_write(mem, bytes(0x2000))
        u.mem_write(stack, bytes(0x1000))
        count, cooldown, area, duration, target_count = profile
        u.mem_write(mem, struct.pack('<Q', mem + 0x100))
        encoded = key.encode()
        u.mem_write(mem + 0x100, struct.pack('<QQ', mem + 0x200, len(encoded)))
        u.mem_write(mem + 0x200, encoded)
        u.mem_write(mem + 0x175, bytes([cast]))
        for at, value in [(0x14, cooldown), (0x1c, area), (0x20, duration)]:
            u.mem_write(mem + at, struct.pack('<f', value))
        u.mem_write(mem + 0x18, struct.pack('<I', target_count))
        u.mem_write(mem + 0x24, struct.pack('<5I', *([count] * 5)))
        for name in ['RAX', 'RBX', 'RCX', 'RDX', 'R8', 'R9', 'R10', 'R11']:
            u.reg_write(getattr(r, 'UC_X86_REG_' + name), 0)
        u.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
        u.reg_write(r.UC_X86_REG_EFLAGS, 2)
        u.reg_write(r.UC_X86_REG_RCX, mem)
        u.reg_write(r.UC_X86_REG_RDX, kind)
        u.reg_write(r.UC_X86_REG_R8, rarity)
        u.mem_write(stack + 0x808, struct.pack('<Q', stop))
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x808)
        endings.clear()
        u.emu_start(FIRST, 0, count=200)
        assert len(endings) == 1
        return endings[0], u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff

    def expected(kind, rarity, key, cast, profile):
        count, cooldown, area, duration, target_count = profile
        cooldown, area, duration = map(f32, [cooldown, area, duration])
        if kind == 0:
            return f32(values['POWER'][rarity] / f32(1. + f32(f32(count) * .5)))
        if kind == 2:
            cap = 12 if cast != 11 else 2 if key in ['seal_fate', 'soul_fire', 'lightwell', 'faerie_fire'] else 0
            return float(min(max(cap - target_count, 0), values['TARGETS'][rarity]))
        if kind == 1:
            value, table = f32(f32(cooldown + f32(-.2)) / f32(.8)), 'COOLDOWN'
        elif kind == 3:
            value, table = f32(f32(5. - area) * .25), 'AREA'
        else:
            value, table = f32(f32(6. - duration) / 5.), 'DURATION'
        return f32((value if value > 0. else 0.) * values[table][rarity])

    for key, cast in descriptors:
        for profile in profiles:
            for kind in range(5):
                for rarity in range(5):
                    exit_at, actual = run(kind, rarity, key, cast, profile)
                    assert exit_at == stop
                    assert actual == bits(expected(kind, rarity, key, cast, profile)), (key, profile, kind, rarity, hex(actual))
                    output_hash.update(struct.pack('<I', actual))
                    cases += 1
    panic_cases = []
    for kind in range(5):
        for rarity in [5, 255, 0xffffffffffffffff]:
            exit_at, _ = run(kind, rarity, 'ordinary', 0, profiles[0])
            assert exit_at == 0x145E9C123
            assert u.reg_read(r.UC_X86_REG_RCX) == rarity and u.reg_read(r.UC_X86_REG_RDX) == 5
            panic_cases.append(dict(kind=kind, rarity=rarity, location=hex(u.reg_read(r.UC_X86_REG_R8))))

    observations, profile = [], None
    for path in sorted(PROBE.glob('0*.json')):
        ev = json.loads(path.read_text()).get('response', {}).get('result', {}).get('structuredContent', {})
        if 'evidence_id' not in ev:
            continue
        assert ev['subject']['digest']['sha256'] == SHA
        if profile is None:
            profile = ev['analysis_profile']
        assert ev['analysis_profile'] == profile
        result = ev['normalized_result']
        if ev['operation'] == 'read_bytes':
            assert result['bytes_hex'] == raw(int(ev['parameters']['address'], 16), ev['parameters']['length']).hex()
            result = dict(matched_installed_file_bytes=True)
        observations.append(dict(evidence_id=ev['evidence_id'], operation=ev['operation'],
                                 parameters=ev['parameters'], result=result, envelope=commitment(path)))
    assert len(observations) == 4
    assert observations[2]['result']['body']['ranges'] == [dict(start=hex(FIRST), end='0x145840d77')]
    assert observations[3]['result']['found'] is False
    failed = json.loads((PROBE / 'run.json').read_text())['operation_errors']
    assert len(failed) == 1 and failed[0]['operation']['name'] == 'procedure_pseudo_code'
    seed_path = PROBE.parent / 'seeds.tsv'
    assert file_sha256(seed_path) == profile['parameters']['analysis_seeds']['sha256']
    return dict(schema_version=1, target={key: target[key] for key in ['version', 'path', 'sha256', 'size_bytes']},
                lead_id='Q41-U01', classification_id='Q41-U01-upgrade-magnitude-145840d78', gap_ids=[41],
                queue_input=commitment(queue_path), selector=queue['selectors']['Q41-U01'], selected_row=selected,
                original_census_bytes_removed=0, classification='AS_ordinary_upgrade_magnitude_switch_cases',
                source_change_required=False,
                declared_extent=dict(va=hex(FIRST), end_exclusive=hex(LAST), sha256=hashlib.sha256(owner).hexdigest(),
                           assembly='magnitude.asm', assembly_sha256=file_sha256(KEEP / 'magnitude.asm')),
                relative_table=dict(va='0x147014ff8', bytes_hex=raw(0x147014FF8, 20).hex(), targets=list(map(hex, CASES))),
                magnitude_tables=tables, native_cases=cases, result_bits_sha256=output_hash.hexdigest(),
                current_observed_incoming=incoming, caller_ranges=caller_ranges,
                native_panic_cases=panic_cases, instruction_sites_executed=len(visited),
                source_refs=[commitment(ROOT / path) for path in [SOURCE,
                    'crates/azeroth-survivors-re/src/player_abilities/mod.rs',
                    'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs']],
                rea=dict(seed_input=commitment(seed_path), seed_rows=seed_path.read_text().splitlines(),
                         provider=profile['provider'], profile_digest=profile['digest'],
                         disabled_analyzers=profile['parameters']['analysis_options']['disabled_analyzers'],
                         plan=commitment(PROBE / 'plan.json'), observations=observations,
                         unavailable='Full-PE pseudocode operation returned execution_failure; successful byte/body observations are retained. Raw-fragment decompilation resolves only the dispatch head.'),
                inputs=[commitment(ranges), commitment(references), commitment(committed(queue['inputs']['full-image-census']))],
                limits=['Selected typed kind domain is 0..4; this entry has no lexical bounds check for a malformed kind byte.',
                        'Synthetic instance/descriptor memory and an intercepted panic entry; no Rust, allocation, live choices or UI execution.',
                        'Fresh code-only seeds decode cases without creating function entries; original census remains immutable.',
                        'This bounded classification identifies no source mismatch and does not close #41 or whole-system/claim recovery.',
                        'No compilation, game, rendered comparison, Windows ABI execution or original/rebuilt parity.'],
                generator=commitment(Path(__file__).resolve()))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    proof = derive()
    output = KEEP / 'proof.json'
    if args.write:
        output.write_text(json_text(proof))
    else:
        assert proof == json.loads(output.read_text()), 'Review changed evidence before publishing'
    print(json.dumps(dict(result='passed', lead=proof['classification_id'], native_cases=proof['native_cases'],
                          panic_cases=len(proof['native_panic_cases']), REA_started=False, compilation_run=False, game_run=False)))


if __name__ == '__main__':
    main()
