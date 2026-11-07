#!/usr/bin/env python3
"""Replay the bounded current jewelry cap-table contract, without a build/game."""
from portable_paths import portable_json, portable_record
import argparse
import csv
import gzip
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, file_sha256
from native_recovery import bits, f32
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
START, END, SITE = 0x14583f9c0, 0x145840035, 0x14583fa56
TABLE, SECOND = 0x147014f3c, 0x147014f8c
KEEP = ROOT / 'docs/analysis/evidence/q41-m01-jewelry'
PROBE = ROOT / 'runtime/analysis/history/findings/q41-m01-jewelry/1c9142944e3d/rea-pe'
SOURCE = 'crates/azeroth-survivors-re/src/loot_rewards.rs'


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def derive():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.113.2'
    image = target_bytes(target)
    pe = load_script('m01_pe', ROOT / 'scripts/inventory-executable.py').PE(image)

    def raw(a, n):
        at = pe.rva_offset(a - pe.image_base)
        assert at is not None
        return image[at:at+n]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = list(decoder.disasm(raw(START, END-START), START))
    assert sum(i.size for i in instructions) == END-START
    boundaries = {i.address: i for i in instructions}
    assert raw(END, 11) == b'\xcc' * 11
    assembly = ''.join(f'{i.address:x}: {i.mnemonic} {i.op_str}'.rstrip() + '\n' for i in instructions)
    proof_input = ROOT / 'runtime/analysis/history/target-audit/execheck/69d2f07fbba6/proofs/guarded-jump-tables.json'
    census = json.loads(proof_input.read_text())
    assert census['target']['sha256'] == SHA and len(census['candidate_tables']) == 205
    candidate = next(row for row in census['candidate_tables'] if row['site'] == hex(SITE))
    assert candidate['candidate_rejection_reason'] == 'scalar-domain-has-unproved-or-conflicting-instruction-targets'
    assert candidate['table_address'] == hex(TABLE) and candidate['selector_maximum'] == 19
    assert candidate['sha256'] == hashlib.sha256(raw(TABLE, 80)).hexdigest()
    targets = [TABLE + n for n in struct.unpack('<20i', raw(TABLE, 80))]
    assert list(map(hex, targets)) == candidate['case_targets']
    assert all(a in boundaries for a in targets)
    assert len(set(targets)) == 5
    assert [(e['target'], e['reason']) for e in candidate['whole_domain_instruction_boundaries']['exceptions']] == [
        (hex(a), 'no-independent-instruction-boundary') for a in [0x14583fa58, 0x14583fa62, 0x14583fa6c, 0x14583fff8]]
    assert struct.unpack('<5f', raw(0x14700bca4, 20)) == tuple(map(f32, [1, 1.4, 1.8, 2.4, 3.2]))
    secondary_targets = [SECOND + n for n in struct.unpack('<13i', raw(SECOND, 52))]
    assert all(a in boundaries for a in secondary_targets)

    model_path = ROOT / 'scripts/recover-jewelry.py'
    model = load_script('m01_jewelry_model', model_path)
    source = (ROOT / SOURCE).read_text()
    for fragment in ['0..=5 | 7 | 19 => f32::INFINITY', '6 | 14 | 17 => self.base * 3.0',
                     '8 => 0.6', '18 => self.base * 4.0', 'if self.tag == 15',
                     'RARITY_MULTIPLIERS[rarity.min(4)]', 'for _ in 0..16',
                     'definition.increment(rarity, existing.map(|index| items[index].value))']:
        assert fragment in source, fragment
    consumers = {
        'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs': ['definition.increment(rarity', 'jewelry_description'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/treasure.rs': ['native::apply_jewelry('],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs': ['numeric.apply_jewelry(item.definition.tag, item.value.value, item.definition.base)'],
    }
    for name, fragments in consumers.items():
        text = (ROOT / name).read_text()
        assert all(fragment in text for fragment in fragments), name

    native = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    native.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        native.mem_write(pe.image_base + section['rva'], image[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    scratch, stack, done = 0x200000000, 0x300000000, 0x400000000
    for a in [scratch, stack, done]:
        native.mem_map(a, 0x10000)
    endpoint, visited = done, []

    def hook(_, a, n, unused):
        if a == endpoint or a == done:
            native.emu_stop()
        elif not START <= a < a+n <= END:
            raise AssertionError(f'Unadmitted native operation {a:#x}')
        else:
            visited.append(a)

    native.hook_add(UC_HOOK_CODE, hook)

    def run(tag, rarity, present=False, current=0., upgrades=0, stop=None):
        nonlocal endpoint, visited
        endpoint, visited = stop or done, []
        native.mem_write(scratch, bytes(80))
        native.mem_write(scratch+0x40, struct.pack('<fB', f32(.2), tag))
        native.mem_write(scratch+0x100, struct.pack('<B3xfI', present, current, upgrades))
        native.mem_write(stack+0x800, struct.pack('<Q', done))
        for register, value in [('RCX', scratch), ('RDX', rarity), ('R8', scratch+0x100), ('RSP', stack+0x800), ('MXCSR', 0x1f80)]:
            native.reg_write(getattr(r, 'UC_X86_REG_'+register), value)
        native.emu_start(START, 0, count=10000)
        assert native.reg_read(r.UC_X86_REG_RIP) in [endpoint, done]
        return native.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff

    dispatch = []
    for tag in range(256):
        result = run(tag, 0, stop=0x14584000b if tag == 9 else 0x14583fa83)
        expected = (1.0 if tag == 16 else float('inf') if tag in [0, 1, 2, 3, 4, 5, 6, 8]
                    else f32(.6) if tag == 9 else f32(f32(.2) * (3 if tag in [7, 15, 18] else 4 if tag == 19 else 5)))
        assert result == bits(expected), (tag, hex(result), expected)
        hit = [a for a in visited if a in set(targets)]
        if tag == 16:
            assert SITE not in visited
        elif tag <= 19:
            assert SITE in visited and hit[0] == targets[tag]
        else:
            assert SITE not in visited
        dispatch.append([tag, result, hex(hit[0]) if hit else None, SITE in visited])

    cases, outputs = 0, hashlib.sha256()
    states = [(False, 0., 0), (True, 0., 0), (True, .2, 0), (True, .6, 3),
              (True, .99, 20), (True, 2., 100), (True, 20., 10000), (True, .15, 0xffffffff)]
    for tag in range(20):
        row = dict(source_tag=model.source_tag(tag), base=f32(.2))
        for rarity in [0, 1, 2, 3, 4, 5, 0xffffffffffffffff]:
            for present, current, upgrades in states:
                current = f32(current)
                actual = run(tag, rarity, present, current, upgrades)
                expected = model.increment(row, min(rarity, 4), current if present else None, upgrades)
                assert actual == bits(expected), (tag, rarity, present, current, upgrades, hex(actual), hex(bits(expected)))
                cases += 1
                outputs.update(struct.pack('<I', actual))

    queue = json.loads((ROOT / 'docs/analysis/evidence/unknown-recovery-comparison-2.json').read_text())
    refs_path = ROOT / queue['inputs']['references.tsv.gz']['path']
    assert file_sha256(refs_path) == queue['inputs']['references.tsv.gz']['sha256']
    with gzip.open(refs_path, 'rt') as stream:
        incoming = [row for row in csv.DictReader(stream, delimiter='\t') if row['to'] == f'{START:x}']
    assert [(row['from'], row['type']) for row in incoming] == [('1402afbed', 'UNCONDITIONAL_CALL')]
    caller = list(decoder.disasm(raw(0x1402afbdd, 0x28), 0x1402afbdd))
    assert [i.op_str for i in caller if i.mnemonic == 'call'] == ['0x14583f9c0', '0x145840040']
    assert any(i.mnemonic == 'movaps' and i.op_str == 'xmm2, xmm0' for i in caller)

    observations = []
    profile = None
    for path in sorted(PROBE.glob('0*.json')):
        envelope = json.loads(path.read_text())
        evidence = envelope.get('response', {}).get('result', {}).get('structuredContent', {})
        if 'evidence_id' not in evidence:
            continue
        assert evidence['subject']['digest']['sha256'] == SHA
        profile = profile or evidence['analysis_profile']
        assert evidence['analysis_profile'] == profile
        result = evidence['normalized_result']
        if evidence['operation'] == 'read_bytes':
            a, n = int(evidence['parameters']['address'], 16), evidence['parameters']['length']
            assert result['bytes_hex'] == raw(a, n).hex()
            result = dict(complete=True, matched_installed_bytes=True)
        elif evidence['operation'] == 'inspect_native_instruction':
            a = int(evidence['parameters']['address'], 16)
            assert result['status'] == 'decoded' and result['mnemonic'].lower() == boundaries[a].mnemonic
            result = {key: result[key] for key in ['address', 'status', 'procedure', 'mnemonic', 'flow']}
        observations.append(dict(artifact=commitment(path), evidence_id=evidence['evidence_id'], operation=evidence['operation'], parameters=evidence['parameters'], result=result))
    plan = json.loads((PROBE/'plan.json').read_text())
    assert len(observations) == 23 and json.loads((PROBE/'run.json').read_text())['failure'] is None
    assert [(row['operation'], row['parameters']) for row in observations] == [
        (row['name'], row['arguments']) for row in plan['operations']]
    assert observations[3]['result']['body']['ranges'] == [
        dict(start='0x14583f9c0', end='0x14583fa57'),
        dict(start='0x14583fa74', end='0x14583ffed'),
        dict(start='0x145840028', end='0x145840034')]
    ownership = observations[-5:]
    assert [row['result']['found'] for row in ownership] == [False, False, False, True, False]
    assert file_sha256(ROOT/'runtime/analysis/history/findings/q41-m01-jewelry/1c9142944e3d/seeds.tsv') == profile['parameters']['analysis_seeds']['sha256']
    result = dict(schema_version=1, target={key: target[key] for key in ['version', 'path', 'sha256', 'size_bytes']},
        generator=commitment(ROOT/'scripts/check-q41-m01-jewelry.py'),
        lead_id='Q41-M01', classification_id='Q41-M01-jewelry-cap-14583fa56', gap_ids=[34, 41],
        selected_input=commitment(proof_input), selected_candidate=candidate,
        leaf=dict(start_preferred_va=hex(START), end_exclusive_preferred_va=hex(END), file_offset=hex(pe.rva_offset(START-pe.image_base)),
                  sha256=hashlib.sha256(raw(START, END-START)).hexdigest(), byte_count=END-START, assembly='increment.asm'),
        cap_table=dict(address=hex(TABLE), bytes_hex=raw(TABLE, 80).hex(), case_targets=list(map(hex, targets))),
        multiplier_table=dict(address=hex(SECOND), bytes_hex=raw(SECOND, 52).hex(), case_targets=list(map(hex, secondary_targets))),
        dispatch_cases=dispatch, native_increment_cases=cases, increment_output_sha256=outputs.hexdigest(),
        expected_model=commitment(model_path), source=[commitment(ROOT/name) for name in [SOURCE, *consumers]],
        incoming_reference_input=commitment(refs_path), incoming_references=incoming,
        caller_to_description=dict(start_preferred_va='0x1402afbdd', end_exclusive_preferred_va='0x1402afc05', sha256=hashlib.sha256(raw(0x1402afbdd, 0x28)).hexdigest()),
        rea=dict(profile=profile, plan=commitment(PROBE/'plan.json'), seed_rows=(ROOT/'runtime/analysis/history/findings/q41-m01-jewelry/1c9142944e3d/seeds.tsv').read_text().splitlines(), observations=observations),
        classification='AS jewelry increment cap and multiplier dispatch; existing connected source matches',
        source_mismatch_established=False, global_admission_or_census_changed=False,
        limits=['Current original leaf instructions execute with synthetic descriptor/Option and stack memory; no callee seams occur.',
                'Expected arithmetic is the separately retained source-formula translation; reconstructed Rust is not executed.',
                'All byte values establish this entry path only, not every computed incoming context, resource alias or catalog lifetime.',
                'Existing global rejected candidate and census counts stay unchanged; fresh code-only labels do not assert global body ownership.',
                'No build, compiling test, application, live gameplay, rendering or original/rebuilt parity check ran.'])
    return result, assembly


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    result, assembly = derive()
    if args.write:
        KEEP.mkdir(parents=True, exist_ok=True)
        (KEEP/'proof.json').write_text(portable_json(result, indent=2)+'\n')
        (KEEP/'increment.asm').write_text(assembly)
    else:
        assert portable_record(json.loads((KEEP/'proof.json').read_text())) == portable_record(result)
        assert (KEEP/'increment.asm').read_text() == assembly
    print(f"Q41-M01 jewelry cap: 256 dispatch cases and {result['native_increment_cases']} native increment cases pass; no compiler/game")


if __name__ == '__main__':
    main()
