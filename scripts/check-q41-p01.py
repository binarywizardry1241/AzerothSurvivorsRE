#!/usr/bin/env python3
"""Verify the bounded 0.113.2 Q41-P01 slot producer; never compile or launch."""
from portable_paths import portable_json, portable_record
import argparse
from collections import deque
import hashlib
import json
from pathlib import Path
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
WORK = ROOT / 'runtime/analysis/history/findings/q41-p01/e2671bf7955c'
OUT = ROOT / 'docs/analysis/evidence/0.113.2/q41-p01/manifest.json'
SELECTED = ROOT / 'docs/analysis/coverage/seeded-census.json'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/native_input/acquisition.rs'
PROOF = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
OWNER = 0x1400b6eb0
CALL = 0x1400b718f
LOADER = 0x1400a7ea0


def sha(data):
    return hashlib.sha256(data).hexdigest()


def artifact(path):
    return {'path': str(path.relative_to(ROOT)), 'sha256': sha(path.read_bytes())}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--write', action='store_true')
    args = ap.parse_args()
    # Use the existing project-local Capstone environment; no dependency install.
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_JUMP, CS_GRP_RET
    from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_REG_RBP
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('q41_p01_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        assert len(value) == count
        return value
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    def decode(start, end):
        result = list(md.disasm(raw(start, end - start), start))
        assert sum(i.size for i in result) == end - start
        return {i.address: i for i in result}
    poll = decode(OWNER, 0x1400b7b41)
    loader = decode(LOADER, 0x1400a855c)
    site = poll[CALL]
    assert site.bytes.hex() == '41ff1424' and site.op_str == 'qword ptr [r12]'

    selected = json.loads(SELECTED.read_text())
    mapping = next(m for m in selected['mappings'] if m['address'] == hex(OWNER))
    observed_path = ROOT / mapping['retained_observations']['path']
    assert sha(observed_path.read_bytes()) == mapping['retained_observations']['sha256']
    observed = json.loads(observed_path.read_text())['observations']
    outgoing = observed['outgoing']['normalized_result']
    assert outgoing['unresolved_calls'] == [{'address': hex(CALL), 'reason': 'Instruction decoder identifies a call but ReferenceManager supplies no call destination'}]
    assert not [r for r in outgoing['references'] if r['source_address'] == hex(CALL)]
    assert any(int(r['start'], 16) <= CALL <= int(r['end'], 16) for r in observed['info']['normalized_result']['body']['ranges'])
    parent = json.loads(PROOF.read_text())['selectors']['Q41-P01']
    assert parent['records'] == 245 and parent['current_target_classification'] == {'no-static-target-owner': 1, 'now-has-observed-target-owner': 244}

    # Exact resource descriptor-to-slot chain. Vector copy preserves its low qword.
    expected = {
        0x1400b6f48: '410f1000', 0x1400b6f55: '0f1145c8',
        0x1400b6fb6: '4c8b65c8', 0x1400b7055: '4c89a508010000',
        0x1400b7180: '440f298520010000', 0x1400b7188: '488d9520010000',
        CALL: '41ff1424', 0x1400b71d7: '85c0', 0x1400b7290: '85c0',
        0x1400b75f0: '4c8ba508010000', 0x1400b786f: '4c8ba508010000',
        0x1400a7f42: '4889c7', 0x1400a83c8: '48897da0',
        0x1400a83cc: 'c745a800000000', 0x1400a83d3: 'c745c000000000',
        0x1400a83da: 'c745d800000000', 0x1400a83e1: 'c745f000000000',
        0x1400a83e8: 'c7450800000000',
    }
    for address, encoded in expected.items():
        assert raw(address, len(bytes.fromhex(encoded))).hex() == encoded, hex(address)

    # Direct intraprocedural control-flow reaching definitions for R12. Calls
    # preserve this Win64 nonvolatile register. The saved local pointer's sole
    # direct stack writer is checked; arbitrary external alias corruption remains
    # outside this bounded static claim.
    r12_aliases = {'r12', 'r12d', 'r12w', 'r12b'}
    definitions = {}
    for address, ins in poll.items():
        writes = {ins.reg_name(r) for r in ins.regs_access()[1]}
        if writes & r12_aliases:
            definitions[address] = 'resource' if address in [0x1400b6fb6, 0x1400b75f0, 0x1400b786f] else 'other'
        if ins.operands and ins.operands[0].type == X86_OP_MEM:
            op = ins.operands[0]
            if op.mem.base == X86_REG_RBP and not op.mem.index and op.mem.disp <= 0x108 < op.mem.disp + op.size:
                assert address == 0x1400b7055
    pending = deque([(OWNER, 'entry', 'unset')])
    states = set()
    calls = set()
    while pending:
        address, r12, saved = pending.popleft()
        state = (address, r12, saved)
        if state in states:
            continue
        states.add(state)
        ins = poll[address]
        if address == CALL:
            calls.add((r12, saved))
        if address in definitions:
            r12 = saved if address in [0x1400b75f0, 0x1400b786f] else definitions[address]
        if address == 0x1400b7055:
            saved = r12
        if ins.group(CS_GRP_RET):
            continue
        fallthrough = address + ins.size
        if ins.group(CS_GRP_JUMP):
            assert ins.operands[0].type == X86_OP_IMM, hex(address)
            destination = ins.operands[0].imm
            assert destination in poll
            pending.append((destination, r12, saved))
            if ins.mnemonic == 'jmp':
                continue
        assert fallthrough in poll, hex(address)
        pending.append((fallthrough, r12, saved))
    assert calls == {('resource', 'resource')}, calls
    reached = {s[0] for s in states}
    body = observed['info']['normalized_result']['body']
    body_ranges = [(int(r['start'], 16), int(r['end'], 16) + 1) for r in body['ranges']]
    assert sum(poll[a].size for a in reached) == body['total_bytes'] == 3171
    assert all(any(start <= a and a + poll[a].size <= end for start, end in body_ranges)
               for a in reached)

    # Exact loader string operands and IAT symbols, including the last fallback.
    imports = {int(row['iat_start_address'], 16) + n * 8: (row['library'], name)
               for row in pe.imports() for n, name in enumerate(row['functions'])}
    loads = []
    for library_site, library_call, symbol_site, symbol_call, name in [
        (0x1400a7ec5, 0x1400a7ecc, 0x1400a7ed7, 0x1400a7ee1, 'xinput1_4.dll'),
        (0x1400a7eec, 0x1400a7ef3, 0x1400a7efe, 0x1400a7f08, 'xinput1_3.dll'),
        (0x1400a7f13, 0x1400a7f1a, 0x1400a7f29, 0x1400a7f33, 'xinput9_1_0.dll'),
    ]:
        def rip_target(ins):
            op = ins.operands[-1]
            assert op.type == X86_OP_MEM and ins.reg_name(op.mem.base) == 'rip'
            return ins.address + ins.size + op.mem.disp
        lib = rip_target(loader[library_site])
        sym = rip_target(loader[symbol_site])
        assert raw(lib, len(name) + 1) == name.encode() + b'\0'
        assert raw(sym, 15) == b'XInputGetState\0'
        assert imports[rip_target(loader[library_call])][1] == 'LoadLibraryA'
        assert imports[rip_target(loader[symbol_call])][1] == 'GetProcAddress'
        loads.append({'library': name, 'library_address': hex(lib), 'symbol_address': hex(sym),
                      'load_call': hex(library_call), 'lookup_call': hex(symbol_call)})
    source = SOURCE.read_text()
    for anchor in [
        'type GetState = unsafe extern "system" fn(u32, *mut State) -> u32;',
        'get_state: GetState,',
        'for name in [c"xinput1_4.dll", c"xinput1_3.dll", c"xinput9_1_0.dll"]',
        'let symbol = GetProcAddress(module, c"XInputGetState".as_ptr().cast());',
        'get_state = Some(std::mem::transmute::<*mut c_void, GetState>(symbol));',
        'let success = unsafe { (acquisition.get_state)(slot as u32, &mut state) == 0 };',
    ]:
        assert anchor in source, anchor

    records = []
    for path in sorted((WORK / 'rea-bounded').glob('0*.json')):
        response = json.loads(path.read_text())
        ev = response.get('response', {}).get('result', {}).get('structuredContent', {})
        if ev.get('operation') in ['inspect_native_instruction', 'procedure_info', 'procedure_pseudo_code',
                                  'read_function_instructions', 'procedure_references', 'read_bytes']:
            assert ev['subject']['digest']['sha256'] == SHA
            records.append({'artifact': artifact(path), 'evidence_id': ev['evidence_id'],
                            'operation': ev['operation'], 'parameters': ev['parameters'],
                            'profile_digest': ev['analysis_profile']['digest']})
    assert len(records) == 9, len(records)
    run = json.loads((WORK / 'rea-bounded/run.json').read_text())
    assert run['failure'] is None and not run['operation_errors']
    def fresh_result(filename):
        return json.loads((WORK / 'rea-bounded' / filename).read_text())['response']['result']['structuredContent']['normalized_result']
    assert fresh_result('003-selected-call.json')['flow'] == {
        'kind': 'call', 'conditional': False, 'computed': True,
        'direct_destinations': [],
        'classification_evidence': [{'source': 'ghidra-listing-flow-type', 'value': 'COMPUTED_CALL'}],
    }
    assert fresh_result('004-poll-body.json')['body'] == body
    loader_body = fresh_result('008-loader-body.json')['body']
    assert loader_body['ranges'] == [{'start': hex(LOADER), 'end': '0x1400a855b'}]
    assert loader_body['total_bytes'] == 1724
    ranges = []
    for role, start, end in [('poll', OWNER, 0x1400b7b41), ('loader', LOADER, 0x1400a855c)]:
        ranges.append({'role': role, 'start': hex(start), 'end_exclusive': hex(end),
                       'file_offset': hex(pe.rva_offset(start - pe.image_base)),
                       'size': end - start, 'sha256': sha(raw(start, end - start))})
    result = {
        'target': {'version': target['version'], 'path': 'installed-game/AzerothSurvivors.exe', 'sha256': SHA},
        'lead': 'Q41-P01', 'gap': 41, 'system_id': 'custom-app-screens-xinput',
        'classification': 'AS_windows_acquisition_to_external_XInputGetState_boundary',
        'selected_call': {'address': hex(CALL), 'bytes': site.bytes.hex(), 'operand': site.op_str,
                          'slot_offset': 0, 'selected_owner': hex(OWNER),
                          'ReferenceManager_target': None, 'runtime_callee_address': None},
        'selector_inputs': [artifact(PROOF), artifact(SELECTED), artifact(observed_path)],
        'original_unresolved_evidence_id': observed['outgoing']['evidence_id'],
        'ranges': ranges,
        'actual_body_ranges_inclusive': {'poll': body['ranges'], 'loader': loader_body['ranges']},
        'critical_instructions': [dict(address=hex(a), bytes=h,
                                      assembly=(poll.get(a) or loader[a]).mnemonic + ' ' + (poll.get(a) or loader[a]).op_str)
                                  for a, h in sorted(expected.items())],
        'local_flow': {'reached_instruction_count': len(reached),
                       'reached_instruction_bytes': sum(poll[a].size for a in reached),
                       'reached_abstract_state_count': len(states),
                       'call_reaching_R12_and_saved_slot': [list(v) for v in sorted(calls)],
                       'R12_definition_addresses': [hex(a) for a in sorted(definitions)]},
        'loader_sequence': loads,
        'source': artifact(SOURCE), 'source_change_required': False,
        'rea': {'plan': artifact(WORK / 'rea.plan.json'), 'seeds': artifact(WORK / 'seeds.tsv'),
                'seed_rows': (WORK / 'seeds.tsv').read_text().splitlines(),
                'disabled_analyzers': json.loads((WORK / 'rea.plan.json').read_text())['environment']['REA_GHIDRA_DISABLED_ANALYZERS'].split(','),
                'observations': records},
        'limits': [
            'The exact external XInputGetState runtime address is loader-dependent and has no native-image body owner.',
            'The typed resource/source correspondence is bounded to the selected loader and poll; whole ECS type registry and arbitrary aliases are not proved.',
            'The local flow assumes Win64 nonvolatile-register preservation and no arbitrary external mutation of the saved stack slot.',
            'The disabled-analysis Ghidra profile is bounded and does not establish caller/reference completeness.',
            'No compilation, Rust test, game, device, platform or parity comparison ran.',
        ],
        'generator': artifact(Path(__file__).resolve()),
    }
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(portable_json(result, indent=2) + '\n')
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(result)
    print(f'Q41-P01: exact call/loader/source contracts and {len(states)} CFG states verified; external target and runtime parity remain unverified')


if __name__ == '__main__':
    main()
