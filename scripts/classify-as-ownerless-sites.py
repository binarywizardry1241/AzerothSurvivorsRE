#!/usr/bin/env python3
"""Reconcile the complete Q41-D01 ownerless AS diagnostic population.

Reads existing census observations and exact installed bytes. No native query,
Program mutation, application execution or compilation is performed.
"""

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
from bisect import bisect_right
from collections import Counter
import csv
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

import coverage_common as coverage
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_CALL, CS_GRP_JUMP, CS_GRP_RET
from capstone.x86_const import X86_OP_IMM

SOURCE_ROOT = coverage.ROOT
PROOF = 'docs/analysis/evidence/0.121.0/as-ownerless-sites.json'
RESIDUAL = 'docs/analysis/evidence/0.121.0/native-residuals.json'
PREDECESSOR = 'docs/analysis/evidence/0.119.0/as-ownerless-sites.json'
TARGET = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
FAILURES = {0x146194453, 0x146194630, 0x146194370, 0x1461943b0}
REMOVALS = {0x140195640: (0x14019569b, 8), 0x145c6ca50: (0x145c6cb60, 120)}


def generate(root):
    # A linked checkout uses the primary checkout's retained runtime evidence;
    # there is no independent store or copy of any installed reference input.
    coverage.ROOT = root
    coverage.REGISTRY = root / 'docs/analysis/coverage/targets.json'
    coverage.REFERENCE_CONFIG = root / '.codex/reference-game.json'
    target = coverage.latest_target(verify=True)
    assert target['version'] == '0.121.0' and target['sha256'] == TARGET
    spec = importlib.util.spec_from_file_location('ownerless_pe', root / 'scripts/inventory-current-target.py')
    parser = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(parser)
    pe = parser.pe_parser(coverage.target_bytes(target))
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True

    def commitment(path, source=False):
        return {'path': path, 'sha256': coverage.file_sha256((SOURCE_ROOT if source else root) / path)}

    def span(start, end):
        at = pe.rva_offset(start - pe.image_base)
        return dict(start=hex(start), end_exclusive=hex(end), file_offset=hex(at),
                    sha256=hashlib.sha256(pe.data[at:at + end - start]).hexdigest())

    def decode(start, end):
        at = pe.rva_offset(start - pe.image_base)
        result = list(decoder.disasm(pe.data[at:at + end - start], start))
        assert sum(i.size for i in result) == end - start
        return result

    residual = json.loads((root / RESIDUAL).read_text())
    assert residual['target'] == {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    binding = residual['artifacts']['diagnostic-sites.jsonl.gz']
    assert coverage.file_sha256(root / binding['path']) == binding['sha256']
    population = [json.loads(line) for line in gzip.open(root / binding['path'], 'rt')]
    selected = [r for r in population if r['context'] == 'AS-custom-path' and r['actual_body_owner'] is None]
    assert len(selected) == 60
    bodies = {}
    for row in selected:
        start, end = (int(row[k], 16) for k in ('runtime_function_start', 'runtime_function_end'))
        if start not in bodies:
            bodies[start] = (span(start, end), {i.address: i for i in decode(start, end)})
        assert bodies[start][0]['sha256'] == row['owner_sha256']

    records = []
    for row in sorted(selected, key=lambda r: int(r['instruction_address'], 16)):
        start, site = int(row['runtime_function_start'], 16), int(row['instruction_address'], 16)
        instructions = bodies[start][1]
        assert instructions[site].bytes.hex() == row['instruction_bytes']
        cursor, route = site, []
        for _ in range(80):
            instruction = instructions[cursor]
            route.append(instruction)
            if instruction.group(CS_GRP_CALL):
                break
            if instruction.group(CS_GRP_JUMP):
                assert instruction.mnemonic == 'jmp' and instruction.operands[0].type == X86_OP_IMM
                cursor = instruction.operands[0].imm
            else:
                cursor += instruction.size
        else:
            raise AssertionError('No bounded first consumer at ' + hex(site))
        call = route[-1]
        assert call.operands[0].type == X86_OP_IMM
        destination = call.operands[0].imm
        record = dict(site=hex(site), original_path=row['path'], original_kind=row['kind'],
                      original_body_owner=None, declared_extent=hex(start),
                      first_call=dict(site=hex(call.address), target=hex(destination)),
                      local_route_sites=[hex(i.address) for i in route],
                      local_route_bytes_sha256=hashlib.sha256(b''.join(i.bytes for i in route)).hexdigest())
        if row['kind'] == 'rust_location':
            address = int(row['target_address'], 16)
            at = pe.rva_offset(address - pe.image_base)
            pointer, length, line, column = struct.unpack_from('<QQII', pe.data, at)
            at = pe.rva_offset(pointer - pe.image_base)
            assert pe.data[at:at + length].decode().replace('\\', '/') == row['path']
            assert (line, column) == (row['source_line'], row['source_column'])
            record['location'] = dict(span(address, address + 24), line=line, column=column)
            if destination in FAILURES:
                record['role'] = 'terminal-failure-location'
            else:
                assert destination in REMOVALS
                record.update(role='location-forwarded-to-returning-removal', row_width=REMOVALS[destination][1])
        else:
            assert row['kind'] == 'path_literal' and destination == 0x145aeb340
            pointer, filename = int(row['target_address'], 16), int(row['path_address'], 16)
            length = filename - pointer
            at = pe.rva_offset(pointer - pe.image_base)
            token = pe.data[at:at + length].decode()
            assert (token, length) in [('p', 1), ('spell', 5)]
            store, length_store = route[1:3]
            assert store.mnemonic == length_store.mnemonic == 'mov'
            assert length_store.operands[1].imm == length
            assert length_store.operands[0].mem.disp == store.operands[0].mem.disp + 8
            record.update(role='adjacent-token-not-filename-use', token=dict(span(pointer, filename), text=token,
                          explicit_length=length), length_store=span(length_store.address, length_store.address + length_store.size))
        records.append(record)
    counts = Counter(r['role'] for r in records)
    assert counts == {'terminal-failure-location': 53, 'location-forwarded-to-returning-removal': 2,
                      'adjacent-token-not-filename-use': 5}

    declared = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    failures = []
    for start in sorted(FAILURES | {0x14619418b}):
        decoded = decode(start, declared[start])
        assert decoded[-1].mnemonic == 'ud2'
        assert not any(i.mnemonic == 'ret' or i.group(CS_GRP_JUMP) for i in decoded)
        failures.append(dict(span(start, declared[start]), role='straight-call-then-terminal-trap',
                             callees=[dict(site=hex(i.address), target=i.op_str) for i in decoded if i.group(CS_GRP_CALL)]))

    # Complete instruction correspondence is used only for the already-recovered
    # removal contract. Explicitly bind internal branches and both external calls.
    predecessor = json.loads((root / PREDECESSOR).read_text())
    removal_proofs = []
    for start, (end, width) in REMOVALS.items():
        name = 'option-remove-eight-byte-row' if width == 8 else 'ability-remove-120-byte-row'
        prior_query = next(r for r in predecessor['queries'] if r['name'] == name)
        journal_path = prior_query['journal']['path']
        assert commitment(journal_path)['sha256'] == prior_query['journal']['sha256']
        journal = json.loads((root / journal_path).read_text())
        assert journal['status'] == 'completed'
        for result in prior_query['results']:
            assert commitment(result['path'])['sha256'] == result['sha256']
        raw_path = f'runtime/q41-native-ownership-0.119.0/{name}.bin'
        raw = (root / raw_path).read_bytes()
        assert hashlib.sha256(raw).hexdigest() == journal['identity']['target']['sha256']
        old_start = int(journal['identity']['open_options']['entry_point'], 16)
        old = list(decoder.disasm(raw, old_start))
        current = decode(start, end)
        assert len(old) == len(current) and sum(i.size for i in old) == len(raw)
        old_calls = [i.operands[0].imm for i in old if i.group(CS_GRP_CALL)]
        current_calls = [i.operands[0].imm for i in current if i.group(CS_GRP_CALL)]
        assert old_calls == [0x145f941e1, 0x14613b28b]
        assert current_calls == [0x145febc2d, 0x14619418b]
        def normalized(rows, base, aliases):
            result = []
            for i in rows:
                operand = i.op_str
                if i.group(CS_GRP_CALL):
                    operand = aliases[i.operands[0].imm]
                elif i.group(CS_GRP_JUMP):
                    operand = f'local:{i.operands[0].imm - base:x}'
                result.append((i.address - base, i.mnemonic, operand))
            return result
        before = normalized(old, old_start, dict(zip(old_calls, ['memmove', 'bounds-failure'])))
        after = normalized(current, start, dict(zip(current_calls, ['memmove', 'bounds-failure'])))
        assert before == after
        thunk = decode(0x145febc2d, 0x145febc33)[0]
        slot = thunk.address + thunk.size + thunk.operands[0].mem.disp
        imports = {int(r['iat_start_address'], 16) + 8*n: (r['library'], symbol)
                   for r in pe.imports() for n, symbol in enumerate(r['functions'])}
        assert thunk.mnemonic == 'jmp' and imports[slot][1] == 'memmove'
        removal_proofs.append(dict(span(start, end), row_width=width,
                                  predecessor_query=prior_query, predecessor_raw=commitment(raw_path),
                                  normalized_instruction_sha256=hashlib.sha256(json.dumps(after).encode()).hexdigest(),
                                  normalization='Local branches use helper-relative offsets; two calls are bound to memmove and bounds failure.',
                                  memmove_thunk=dict(span(thunk.address, thunk.address + thunk.size),
                                                      iat_slot=hex(slot), library=imports[slot][0], symbol=imports[slot][1])))

    contexts = {int(r['runtime_function_start'], 16): int(r['runtime_function_end'], 16)
                for r in population if r['kind'] == 'rust_location' and
                r['path'].startswith(('crates/wenilla-rogue/', 'crates/wenilla-rogue-app/'))}
    starts, runs = sorted(contexts), []
    ownerless = residual['artifacts']['ownerless-instructions.tsv.gz']
    assert coverage.file_sha256(root / ownerless['path']) == ownerless['sha256']
    for row in csv.DictReader(gzip.open(root / ownerless['path'], 'rt'), delimiter='\t'):
        address = int(row['address'], 16)
        index = bisect_right(starts, address) - 1
        if index < 0 or address >= contexts[starts[index]]:
            continue
        context = starts[index]
        instruction = bodies[context][1][address]
        assert instruction.bytes.hex() == row['bytes'] and instruction.size == int(row['length'])
        if not runs or runs[-1][0] != context or runs[-1][1][-1].address + runs[-1][1][-1].size != address:
            runs.append((context, [instruction]))
        else:
            runs[-1][1].append(instruction)
    frontier = []
    def terminal_route(instructions, site, seen=frozenset()):
        assert site not in seen, 'Cyclic route is not a proved terminal failure'
        i = instructions[site]
        if i.mnemonic == 'ud2':
            return
        assert not i.group(CS_GRP_RET), 'Returning route is not terminal failure'
        if i.group(CS_GRP_CALL):
            assert i.operands[0].type == X86_OP_IMM and i.operands[0].imm in FAILURES
            return  # The checked wrapper's own straight route ends in UD2.
        successors = [site + i.size]
        if i.group(CS_GRP_JUMP):
            assert i.operands[0].type == X86_OP_IMM, 'Unproved computed failure route'
            successors = [i.operands[0].imm] + ([] if i.mnemonic == 'jmp' else successors)
        for successor in successors:
            terminal_route(instructions, successor, seen | {site})
    for context, instructions in runs:
        a, b = instructions[0].address, instructions[-1].address + instructions[-1].size
        if context == 0x145c44820 and a < 0x145c4649e:
            role = 'retained-card-payload-and-cleanup-context'
        elif context == 0x145bf8450 and a < 0x145bfb9b8:
            role = 'retained-totem-removal-create-and-cleanup-context'
        elif context == 0x1402f6b00 and a < 0x1402f80e3:
            role = 'retained-options-writeback-and-removal-context'
        else:
            role = 'failure-route-or-terminal-trap'
            for instruction in instructions:
                terminal_route(bodies[context][1], instruction.address)
        frontier.append(dict(span(a, b), declared_extent=hex(context), instructions=len(instructions),
                             context_role=role, context_is_complete_semantics=False))
    assert len(contexts) == 302 and len(frontier) == 49 and sum(r['instructions'] for r in frontier) == 790
    return dict(schema_version=1, target=residual['target'], generator=commitment('scripts/classify-as-ownerless-sites.py', True),
                inputs=[commitment(RESIDUAL), binding, ownerless], predecessor=commitment(PREDECESSOR),
                lead_ids=['Q41-D01', 'Q41-G01', 'Q41-U01'], gap_ids=[41],
                selector="diagnostic-sites.jsonl.gz: context == 'AS-custom-path' and actual_body_owner == null",
                counts=dict(sites=60, diagnostic_paths=14, declared_extents=len(bodies), roles=dict(counts)),
                sites=records, failure_helpers=failures, removal_correspondence=removal_proofs,
                as_location_extent_frontier=dict(context_extents=len(contexts), selected_instructions=790,
                                                selected_extents=len({r[0] for r in runs}), runs=frontier),
                limits=['All 60 immediate diagnostic roles are classified; raw Ghidra body ownership is unchanged.',
                        'Failure routing reaches checked call/UD2 wrappers; their external callees, unwinding and nonlocal exits remain generic unresolved boundaries.',
                        'The 790-instruction frontier is known context, not complete successful AS semantics or reconstructed types.',
                        'No source defect is established. Retained source/recovery is not reopened for proof-only current applicability.',
                        'No new native query, Program import/mutation, compilation, client/game/network/server execution or parity comparison.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--analysis-workspace', type=Path, default=SOURCE_ROOT,
                        help='Primary checkout holding retained evidence when checking from a linked worktree')
    args = parser.parse_args()
    result = generate(args.analysis_workspace.resolve())
    output = SOURCE_ROOT / PROOF
    if args.write:
        output.write_text(coverage.json_text(result))
    else:
        assert result == json.loads(output.read_text()), 'Current ownerless-AS role proof differs'
    print(coverage.json_text(result['counts']).strip())


if __name__ == '__main__':
    main()
