#!/usr/bin/env python3
"""Retain current class-special hit/death evidence without executing the target.

Reuses the complete, SHA-bound REA/Ghidra hit-owner dossier already retained
for this exact EXE. No new full-function analysis, compilation or emulation.
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
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
TARGET_SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OWNER_SHA = 'fa34d349dd4e7597bc1f2da2f90bcae0cdef33ed8128f0837a0ec72110d63c49'
REA_ID = 'ev_ba95562638ee7eaae2ea1dc88d80c5df86859a014473f69b678b229aacd357bd'
DESTINATION = ROOT / 'docs/analysis/evidence/0.97.2/player-hit-passives'
RUNTIME = ROOT / 'runtime/player-hit-passives-0.97.2'
HELPERS = (0x1454D4DC0, 0x1454D5230, 0x1454D68B0)
SPANS = (
    ('gates-polymorph-break', 0x1454C4D50, 0x1454C4FD9),
    ('bloodrage-seal-fate', 0x1454C4FD9, 0x1454C51EB),
    ('faerie-hit', 0x1454C51EB, 0x1454C5687),
    ('polymorph-burst', 0x1454C5687, 0x1454C5984),
    ('hit-death-routing', 0x1454C5984, 0x1454C5A66),
    ('hunters-mark-death', 0x1454C5A66, 0x1454C5E6F),
    ('faerie-death', 0x1454C5E6F, 0x1454C5FC8),
    ('faerie-talent-repeat', 0x1454C622B, 0x1454C63AF),
    ('passive-radius', 0x1454F96D0, 0x1454F972C),
    ('polymorph-rng-next-u32', 0x145486E90, 0x145486ED8),
)
SCALARS = (0x1458EB480, 0x1458EB4FC, 0x1458EB500, 0x1458EB51C,
           0x1458EB528, 0x1458EB52C, 0x1458F6624, 0x1458F6628,
           0x1458F667C, 0x1458F8D40, 0x1458FCDEC, 0x1459EB3C0,
           0x145BFC414, 0x14698EBD0, 0x1458F8DE0, 0x1458F8DE4,
           0x1458F6620, 0x1458ED010, 0x1458EB50C, 0x1458EB488,
           0x1458EB520, 0x14590AEFC)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true', help='prepare exact focused helper slices and REA plans')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == TARGET_SHA, 'wrong selected EXE'
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    functions = {pe.image_base + a: pe.image_base + z for a, z, _ in pe.functions()}

    def span(address, size):
        at = pe.rva_offset(address - pe.image_base)
        payload = data[at:at + size]
        assert len(payload) == size
        return dict(virtual_address=hex(address), file_offset=hex(at), size_bytes=size,
                    sha256=hashlib.sha256(payload).hexdigest())

    owner = span(0x1454C2EB0, 0x1454C63E5 - 0x1454C2EB0)
    assert owner['sha256'] == OWNER_SHA
    provenance_path = ROOT / 'docs/analysis/evidence/0.97.2/loot/rea-provenance.json'
    record = next(row for row in json.loads(provenance_path.read_text())['records']
                  if row['evidence_id'] == REA_ID)
    assert record['subject']['digest']['sha256'] == OWNER_SHA
    assert record['provider']['id'] == 'ghidra'
    DESTINATION.mkdir(parents=True, exist_ok=True)
    ranges = []
    for name, start, end in SPANS:
        assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={start:#x}', f'--stop-address={end:#x}', str(TARGET)],
            cwd=ROOT, text=True)
        (DESTINATION / f'{name}.asm').write_text(assembly)
        ranges.append(dict(name=name, source=span(start, end-start),
                           end_exclusive=hex(end), assembly=f'{name}.asm'))
    helper_rows = []
    for address in HELPERS:
        end = functions[address]
        native = span(address, end-address)
        if args.prepare:
            RUNTIME.mkdir(parents=True, exist_ok=True)
            at = pe.rva_offset(address-pe.image_base)
            target = RUNTIME / f'{address:x}.bin'
            target.write_bytes(data[at:at+end-address])
            plan = dict(target=str(target.relative_to(ROOT)),
                output=f'runtime/player-hit-passives-0.97.2/rea-{address:x}',
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
                timeout=240, open_timeout=90, cleanup_timeout=60,
                operations=[dict(name='analyze_function', arguments=dict(procedure=hex(address)))])
            (RUNTIME / f'plan-{address:x}.json').write_text(portable_json(plan, indent=2)+'\n')
        assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={address:#x}', f'--stop-address={end:#x}', str(TARGET)], cwd=ROOT, text=True)
        (DESTINATION / f'{address:x}.asm').write_text(assembly)
        row = dict(source=native, end_exclusive=hex(end), assembly=f'{address:x}.asm')
        bundle = RUNTIME / f'rea-{address:x}/evidence-bundle.json'
        if bundle.exists():
            evidence = next(item for item in json.loads(bundle.read_text())['records']
                            if item.get('operation') == 'analyze_function')
            assert evidence['subject']['digest']['sha256'] == native['sha256']
            assert evidence['provider']['id'] == 'ghidra'
            code = evidence['normalized_result']['pseudocode']
            (DESTINATION / f'{address:x}.ghidra.c').write_text(code)
            row.update(rea_evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                       analysis_profile=evidence['analysis_profile'],
                       pseudocode=f'{address:x}.ghidra.c',
                       decompiler_warning='bad instruction at out-of-slice tail call; original PE assembly binds tail1454d5bd0' if address == 0x1454D68B0 else None)
        helper_rows.append(row)
    constants = []
    for address in SCALARS:
        at = pe.rva_offset(address - pe.image_base)
        constants.append(dict(source=span(address, 4), raw_hex=data[at:at+4].hex(),
                              value=struct.unpack_from('<f', data, at)[0]))
    address = 0x1469ACD94
    at = pe.rva_offset(address - pe.image_base)
    jumps = [hex(address + offset) for offset in struct.unpack_from('<4i', data, at)]
    output = dict(
        version='0.97.2', target=dict(path=str(TARGET.relative_to(ROOT)), sha256=TARGET_SHA),
        method='Reuse current complete REA/Ghidra owner; original Windows x64 instructions and PE constants bind arguments, gates and arithmetic.',
        native_owner=owner,
        rea=dict(evidence_id=REA_ID, subject=record['subject'], provider=record['provider'],
                 analysis_profile=record['analysis_profile'],
                 provenance=str(provenance_path.relative_to(ROOT)),
                 pseudocode='docs/analysis/evidence/0.97.2/loot/enemy-death.ghidra.c'),
        ranges=ranges, focused_helpers=helper_rows, scalars=constants,
        death_jump_table=dict(source=span(address, 16), targets_by_source_kind=jumps),
        raw_call_arguments=dict(game='RCX', victim_guid='RDX', power='XMM2', spell='R9D',
            school='caller RSP+0x20 / callee RBP+0x290',
            critical='caller RSP+0x28 / callee RBP+0x298',
            final_flag='caller RSP+0x30 / callee RBP+0x2a0'),
        class_state=dict(bloodrage_pool='Game+0x7c4', bloodrage_bank='Game+0x7c8',
            bloodrage_last_gain='Game+0x7cc', seal_fate_points='Game+0x7d0',
            seal_fate_bank='Game+0x7d4', hunters_mark_guid='Game+0x7b0',
            soul_fire_points='Game+0x7d8', soul_fire_gain_at='Game+0x7dc',
            redemption_queue_at='Game+0x7e0', redemptions='Game+0x750/+0x758/+0x760',
            hunters_mark_reacquire='Game+0x7e8', faerie_vector='Game+0x768/+0x770/+0x778',
            polymorph_vector='Game+0x798/+0x7a0/+0x7a8'),
        action_order=['initial kind11 presence gate', 'capture source gates and death qualification',
            'tracked Polymorph break/removal and possible burst',
            'normal-source Bloodrage gain then publication',
            'normal-source Seal Fate gain then publication',
            'normal-source Faerie Fire charged hit then matching talent13 repeat',
            'surviving eligible nonzero-spell Polymorph producer1454d4dc0',
            'qualifying-death SoulFire credit1454d68b0 then Redemption queue1454d5230(reason1), or passive death reason2',
            'marked-victim Hunter\'s Mark death clear/reacquire/burst',
            'Faerie Fire death removal and one replacement',
            'return to shared source-context/talent tail1454c5fc8'],
        shared_source_owners=dict(totem_passives=['1454d43d0 multi-hit', '1454d49e0 begin-passive',
                'single recursive hit attribution save/clear/restore'],
            passive_tick=['1454d69f0/1454d7020/1454d5bd0 resource publication and bursts',
                '1454d5950 special replacement candidates', '1454d7810 apply Faerie Fire',
                '145524320/145524410 stable collection removals']),
        required_world_owners=['1454c2eb0 canonical recursive hit/death',
            '1454d5440 actor appearance fields/packet', '1454d13a0 aura update',
            '1454627f0 actual terrain height', '1454451b0 stopped movement packet',
            'actual run source attribution/actors/learned ability storage'],
        validation=dict(target_executed=False, compiled=False, tests_run=False,
            scope='Static SHA-bound extraction/source review only; no compiler checks, tests, emulation or launches.'),
        limitations=['Raw Ghidra import is generic GCC ABI; PE assembly controls original Windows x64 arguments.',
            'This is the class-special tail only, not the complete hit/death, attribution, packet, loot or world pipeline.',
            'Opaque hit-context values and required native owner operations have no invented default implementations.',
            'No live parity or functional gameplay claim.'])
    (DESTINATION / 'native.json').write_text(portable_json(output, indent=2) + '\n')
    print(f'Retained {len(ranges)} static native ranges and {len(constants)} PE float constants.')


if __name__ == '__main__':
    main()
