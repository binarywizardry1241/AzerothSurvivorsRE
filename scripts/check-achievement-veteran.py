#!/usr/bin/env python3
"""Check the current Veteran XP input and transient-Tester run-entry gate.

Executes original native instructions in synthetic memory. No compiler, game,
OS clock, file operation or rebuilt Rust runs. Other perk consumers are outside
this bounded proof. --prepare-rea writes a fresh project-local Ghidra plan.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from native_terminal import NativeReplay, require, verified_input

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--stage', action='store_true')
parser.add_argument('--prepare-rea', action='store_true')
args = parser.parse_args()
evidence = ROOT/'docs/analysis/evidence/0.112.0/achievement-veteran'
work = ROOT/'runtime/analysis/history/progression/achievement-grants/6d75f76be1b4'
manifest, target, data, pe = verified_input(evidence)
require(target['sha256'] == 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a', 'Selected target changed')
require(hashlib.sha256((evidence/'selected-native.asm').read_bytes()).hexdigest() == manifest['selected_assembly_sha256'], 'Curated Veteran assembly changed')
if args.prepare_rea:
    row = manifest['ranges'][0]
    start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
    directory = work/'reproduce-veteran'
    directory.mkdir(exist_ok=True)
    offset = pe.rva_offset(start-pe.image_base)
    (directory/'body.bin').write_bytes(data[offset:offset+end-start])
    (directory/'seeds.tsv').write_text(f'{start:#x}\tfunction\n{start:#x}\tcode\n')
    plan = dict(target=str((directory/'body.bin').relative_to(ROOT)),
                output=str((directory/'rea').relative_to(ROOT)), init_timeout=60, timeout=240,
                environment=dict(REA_GHIDRA_SEED_FILE=str((directory/'seeds.tsv').relative_to(ROOT)),
                                 REA_GHIDRA_DISABLED_ANALYZERS='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'),
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
    (directory/'plan.json').write_text(json.dumps(plan, indent=2)+'\n')
    print('Prepared bounded Veteran REA/Ghidra plan')
    sys.exit(0)

# Reuse the current typed parser and its supporting allocation/perk owners.
support = json.loads((ROOT/'docs/analysis/evidence/0.112.0/talent-allocations/manifest.json').read_text())
require(support['target_sha256'] == target['sha256'], 'Current typed Save identity')
for row in support['functions'] + support['replayed_shared_owners']:
    offset = pe.rva_offset(int(row['address'], 16)-pe.image_base)
    require(hashlib.sha256(data[offset:offset+row['byte_count']]).hexdigest() == row['sha256'], row['name'])
from native_talent_fixture import Machine
from unicorn.x86_const import UC_X86_REG_XMM0
vm = Machine()
classes = [1, 2, 3, 4, 5, 7, 8, 9, 11]
cases = []


def check(selected, rank, rows):
    plain = ''.join(f'talent|{class_id}|{xp}|\n' for class_id, xp in rows)+f'perk|veteran:{rank}\n'
    account = vm.parse(plain)
    vm.call(0x1459b70c0, account, selected)
    bits = vm.u.reg_read(UC_X86_REG_XMM0) & 0xffffffff
    values = {}
    for class_id, xp in rows:
        values.setdefault(class_id, xp)
    expected = 0
    if rank and values.get(selected, 0) < max(values.get(class_id, 0) for class_id in classes):
        coefficient = struct.unpack('<f', bytes.fromhex('cdcc4c3e'))[0]
        expected = struct.unpack('<I', struct.pack('<f', min(rank, 2)*coefficient))[0]
    require(bits == expected, str((selected, rank, rows, bits, expected)))
    cases.append([selected, rank, rows, bits])


for selected in classes:
    for rank in [0, 1, 2, 3, 255]:
        check(selected, rank, [])
        check(selected, rank, [(6, 0xffffffff), (selected, 50)])
        for other in classes:
            if other != selected:
                for xp in [49, 50, 51, 0xffffffff]:
                    check(selected, rank, [(selected, 50), (other, xp)])
        other = next(class_id for class_id in classes if class_id != selected)
        check(selected, rank, [(selected, 50), (selected, 0xffffffff), (other, 51)])
        check(selected, rank, [(selected, 0xffffffff), (selected, 50), (other, 51)])

replay = NativeReplay(data, pe)
u, r = replay.machine, replay.registers
calls = []


def seam(address):
    if address != 0x1459b70c0:
        return False
    require(u.reg_read(r.UC_X86_REG_RCX) == replay.app+0xb38, 'Veteran uses backend Save')
    require(u.reg_read(r.UC_X86_REG_EDX) == replay.context['class_id'], 'Actual selected class')
    calls.append(1)
    u.reg_write(r.UC_X86_REG_XMM0, replay.context['factor'])
    replay.return_seam()
    return True


replay.seam = seam
entry = []
for class_id in classes:
    for guid in [42, 0xfffffe, 0xffffff]:
        for bits in [0, 0x3e4ccccd, 0x3ecccccd]:
            replay.reset('entry', [(0x1458bff2e, 0x1458bff58)], {0x1458bff58})
            replay.context.update(class_id=class_id, factor=bits)
            calls.clear()
            replay.put(replay.app+0x10d0, '<Q', guid)
            u.reg_write(r.UC_X86_REG_R13, replay.app)
            u.reg_write(r.UC_X86_REG_R15, class_id)
            u.reg_write(r.UC_X86_REG_XMM0, 0x7fc00000)
            replay.run(0x1458bff2e)
            actual = replay.get(replay.app+0x1150, '<I')[0]
            require(actual == (0 if guid == 0xffffff else bits), 'Tester Veteran gate')
            require(len(calls) == int(guid != 0xffffff), 'Tester bypasses factor producer')
            entry.append([class_id, guid, bits, actual])

source = ''.join((ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text().split())
require('ifmenu.selected_roster_guid()==Some(crate::startup::TESTER_GUID){account_grants.veteran_bonus=0.0;}game.set_account_grants(account_grants);' in source, 'Live Tester Veteran adapter')
projection = ''.join((ROOT/'crates/azeroth-survivors-re/src/run_progression.rs').read_text().split())
for token in ['letselected=experience(class);', '[1,2,3,4,5,7,8,9,11]',
              'ifveteran!=0&&selected<highest{f32::from(veteran)*0.2}']:
    require(token in projection, 'Current Veteran source '+token)


def digest(value):
    return hashlib.sha256(json.dumps(value, separators=(',', ':')).encode()).hexdigest()


result = dict(target=manifest['target'], factor_cases=len(cases), factor_sha256=digest(cases),
              caller_cases=len(entry), caller_sha256=digest(entry), caller_instructions=replay.instructions,
              executed_addresses=len(vm.executed), seams=[hex(address) for address in sorted(vm.seams)],
              limits=manifest['limitations'])
(work/'veteran-current-vectors.json').write_text(json.dumps(result, indent=2)+'\n')
if not args.stage:
    require(json.loads((evidence/'native-vectors.json').read_text()) == result, 'Current Veteran proof changed')
print(json.dumps(result))
