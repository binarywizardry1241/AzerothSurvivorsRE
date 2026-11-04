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
from collections import Counter, defaultdict
import csv
from functools import lru_cache
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

import coverage_common as coverage
from capstone import (Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_CALL, CS_GRP_INT, CS_GRP_IRET,
                      CS_GRP_JUMP, CS_GRP_PRIVILEGE, CS_GRP_RET)
from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP
from script_sources import current_path, recorded_input_matches

SOURCE_ROOT = coverage.ROOT
PROOF = 'docs/analysis/evidence/0.121.0/as-ownerless-sites.json'
RESIDUAL = 'docs/analysis/evidence/0.121.0/native-residuals.json'
PREDECESSOR = 'docs/analysis/evidence/0.119.0/as-ownerless-sites.json'
TARGET = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
FAILURES = {0x146194453, 0x146194630, 0x146194370, 0x1461943b0}
REMOVALS = {0x140195640: (0x14019569b, 8), 0x145c6ca50: (0x145c6cb60, 120)}


def load_reference(root):
    # A linked checkout uses the primary checkout's retained runtime evidence;
    # there is no independent store or copy of any installed reference input.
    coverage.ROOT = root
    coverage.REGISTRY = root / 'docs/analysis/coverage/targets.json'
    coverage.REFERENCE_CONFIG = root / '.codex/reference-game.json'
    target = coverage.latest_target(verify=True)
    spec = importlib.util.spec_from_file_location('ownerless_pe', root / 'scripts/inventory-current-target.py')
    parser = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(parser)
    pe = parser.pe_parser(coverage.target_bytes(target))
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    return target, pe, decoder


def first_call(instructions, site):
    cursor, route = site, []
    while cursor in instructions and cursor not in route:
        instruction = instructions[cursor]
        route.append(cursor)
        if instruction.group(CS_GRP_CALL):
            assert instruction.operands[0].type == X86_OP_IMM, hex(cursor)
            return [instructions[address] for address in route]
        assert not instruction.group(CS_GRP_RET) and instruction.mnemonic != 'ud2', hex(cursor)
        if instruction.group(CS_GRP_JUMP):
            assert instruction.mnemonic == 'jmp' and instruction.operands[0].type == X86_OP_IMM
            cursor = instruction.operands[0].imm
        else:
            cursor += instruction.size
    raise AssertionError('No bounded first consumer at ' + hex(site))


def generate(root, target, pe, decoder):
    assert target['version'] == '0.121.0' and target['sha256'] == TARGET

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
        route = first_call(instructions, site)
        call = route[-1]
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


def generate_current(root, target, pe, decoder, instruction_frontier=False):
    evidence_dir = Path('docs/analysis/evidence') / target['version']
    residual_path = evidence_dir / 'native-residuals.json'
    residual = json.loads((root / residual_path).read_text())
    assert residual['target'] == {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    artifact = residual['artifacts']['diagnostic-sites.jsonl.gz']
    assert coverage.file_sha256(root / artifact['path']) == artifact['sha256']
    selector = "context == 'AS-custom-path' and actual_body_owner == null"
    with gzip.open(root / artifact['path'], 'rt') as stream:
        selected = [row for line in stream if (row := json.loads(line))['context'] == 'AS-custom-path'
                    and row['actual_body_owner'] is None]
    assert selected and len(selected) == residual['counts']['diagnostic_contexts']['AS-custom-path:ownerless']

    def raw(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        return pe.data[offset:offset + end - start]

    def span(start, end):
        return dict(start=hex(start), end_exclusive=hex(end), file_offset=hex(pe.rva_offset(start - pe.image_base)),
                    sha256=hashlib.sha256(raw(start, end)).hexdigest())

    declared = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    bodies = {}

    def body(start, require_complete=True):
        if start not in bodies:
            end = declared[start]
            data = raw(start, end)
            rows = {i.address: i for i in decoder.disasm(data, start)}
            bodies[start] = (rows, span(start, end), sum(i.size for i in rows.values()) == len(data))
        rows, digest, complete = bodies[start]
        assert complete or not require_complete, hex(start)
        return rows, digest

    imports = {int(row['iat_start_address'], 16) + 8 * i: (row['library'], symbol)
               for row in pe.imports() for i, symbol in enumerate(row['functions'])}

    def rip_target(instruction):
        operands = [op for op in instruction.operands if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP]
        assert len(operands) == 1, hex(instruction.address)
        return instruction.address + instruction.size + operands[0].mem.disp

    helpers = {}

    def classify_location(destination):
        if destination in helpers:
            return helpers[destination]['role']
        rows, digest = body(destination)
        instructions = list(rows.values())
        calls = [i for i in instructions if i.group(CS_GRP_CALL)]
        assert calls and instructions[-1].mnemonic == 'ud2', hex(destination)
        if not any(i.group(CS_GRP_JUMP) or i.group(CS_GRP_RET) for i in instructions):
            role = 'terminal-failure-location'
            helpers[destination] = dict(digest, role=role, terminal_trap=hex(instructions[-1].address))
            return role

        assert len(calls) == 2 and all(i.operands[0].type == X86_OP_IMM for i in calls), hex(destination)
        move, fail = calls
        thunk_address = move.operands[0].imm
        thunk = next(decoder.disasm(raw(thunk_address, thunk_address + 15), thunk_address))
        assert thunk.mnemonic == 'jmp'
        slot = rip_target(thunk)
        library, symbol = imports[slot]
        assert symbol == 'memmove'
        shifts = {i.operands[1].imm for i in instructions if i.mnemonic == 'shl'
                  and i.operands[1].type == X86_OP_IMM}
        assert len(shifts) == 1
        width = 1 << shifts.pop()
        guard = next(i for i in instructions if i.mnemonic == 'jae' and i.operands[0].type == X86_OP_IMM)
        assert first_call(rows, guard.operands[0].imm)[-1].address == fail.address
        assert first_call(rows, guard.address + guard.size)[-1].address == move.address
        assert any(i.mnemonic == 'dec' and move.address < i.address < fail.address for i in instructions)
        assert any(i.group(CS_GRP_RET) and move.address < i.address < fail.address for i in instructions)
        role = 'location-forwarded-to-returning-removal'
        helpers[destination] = dict(digest, role=role, row_width=width, move_site=hex(move.address),
                                    move_import=dict(slot=hex(slot), library=library, symbol=symbol),
                                    bounds_branch=hex(guard.address), bounds_failure_call=hex(fail.address),
                                    terminal_trap=hex(instructions[-1].address))
        return role

    formatters = {}

    def classify_adjacent(route, start, end):
        call = route[-1]
        destination = call.operands[0].imm
        payload = raw(start, end)
        if payload in (b'spell', b'p'):
            store, length = route[1:3]
            assert store.mnemonic == length.mnemonic == 'mov'
            assert store.operands[0].type == length.operands[0].type == X86_OP_MEM
            assert store.operands[1].type == X86_OP_REG
            assert store.operands[1].reg == route[0].operands[0].reg
            assert length.operands[0].mem.base == store.operands[0].mem.base
            assert length.operands[0].mem.disp == store.operands[0].mem.disp + 8
            assert length.operands[1].type == X86_OP_IMM and length.operands[1].imm == len(payload)
            assert any(i.mnemonic == 'lea' and i.operands[0].type == X86_OP_REG
                       and i.reg_name(i.operands[0].reg) == 'r9' and i.operands[1].type == X86_OP_MEM
                       and i.operands[1].mem.base == store.operands[0].mem.base
                       and i.operands[1].mem.disp == store.operands[0].mem.disp for i in route[3:-1])
            return dict(role='adjacent-named-token', token=payload.decode(), explicit_length=len(payload))

        assert payload == b'\xc0\xc0\x00' and route[0].op_str.startswith('rdx, '), hex(call.address)
        if destination not in formatters:
            rows, digest = body(destination)
            instructions = list(rows.values())
            forwarded = next(i for n, i in enumerate(instructions) if i.group(CS_GRP_CALL) and
                             [j.op_str for j in instructions[n - 2:n]] == ['r8, rbx', 'r9, rdi'])
            assert forwarded.operands[0].type == X86_OP_IMM
            interpreter, interpreter_digest = body(forwarded.operands[0].imm)
            reads = list(interpreter.values())
            default = next(i for i in reads if i.mnemonic == 'cmp' and i.op_str == 'r13d, 0xc0')
            callback = next(i for i in reads if i.mnemonic == 'call' and i.op_str == 'qword ptr [rsi + rax + 8]')
            assert any(default.address < i.address < callback.address and i.mnemonic == 'shl'
                       and i.op_str == 'rax, 4' for i in reads)
            assert any(i.address > callback.address and i.mnemonic == 'inc' and i.op_str == 'rbx' for i in reads)
            formatters[destination] = dict(digest, forwarded_at=hex(forwarded.address),
                                           interpreter=dict(interpreter_digest, default_piece=hex(default.address),
                                                            argument_callback=hex(callback.address)))
        return dict(role='adjacent-packed-format-program', program=payload.hex(), default_arguments=2)

    sites = []
    extents = set()
    for row in sorted(selected, key=lambda r: int(r['instruction_address'], 16)):
        start, end = (int(row[key], 16) for key in ('runtime_function_start', 'runtime_function_end'))
        site, target_address = (int(row[key], 16) for key in ('instruction_address', 'target_address'))
        instructions, digest = body(start)
        extents.add(start)
        assert declared[start] == end and digest['sha256'] == row['owner_sha256']
        assert instructions[site].bytes.hex() == row['instruction_bytes']
        assert instructions[site].mnemonic == 'lea' and rip_target(instructions[site]) == target_address
        route = first_call(instructions, site)
        call = route[-1]
        destination = call.operands[0].imm
        if row['kind'] == 'rust_location':
            location_reg = route[0].operands[0].reg
            for i in route[1:-1]:
                if (i.mnemonic == 'mov' and all(op.type == X86_OP_REG for op in i.operands)
                        and i.operands[1].reg == location_reg):
                    location_reg = i.operands[0].reg
                else:
                    assert location_reg not in i.regs_access()[1], hex(i.address)
            argument = call.reg_name(location_reg)
            assert argument in ('rcx', 'rdx', 'r8', 'r9')
            pointer, length, line, column = struct.unpack('<QQII', raw(target_address, target_address + 24))
            assert raw(pointer, pointer + length).decode().replace('\\', '/') == row['path']
            assert (line, column) == (row['source_line'], row['source_column'])
            result = dict(role=classify_location(destination), line=line, column=column, argument=argument)
        else:
            assert row['kind'] == 'path_literal'
            result = classify_adjacent(route, target_address, int(row['path_address'], 16))
        sites.append(dict(site=hex(site), original_path=row['path'], kind=row['kind'], target_address=hex(target_address),
                          declared_extent=hex(start), call_site=hex(call.address), call_target=hex(destination),
                          route_sha256=hashlib.sha256(b''.join(i.bytes for i in route)).hexdigest(), **result))

    generator = Path(__file__).relative_to(SOURCE_ROOT)
    result = dict(schema_version=1, target=residual['target'],
                generator=dict(path=generator.as_posix(), sha256=coverage.file_sha256(SOURCE_ROOT / generator)),
                inputs=[dict(path=residual_path.as_posix(), sha256=coverage.file_sha256(root / residual_path)), artifact],
                lead_ids=['Q41-D01'], gap_ids=[41], selector=selector,
                counts=dict(sites=len(sites), declared_extents=len(extents),
                            diagnostic_paths=len({row['path'] for row in selected}),
                            roles=dict(Counter(row['role'] for row in sites))),
                location_helpers=list(helpers.values()), format_helpers=list(formatters.values()), sites=sites,
                limits=['Immediate operands and first consumers only. Raw census body ownership is unchanged.',
                        'Collection type, full caller behavior and native source parity are separate proof obligations.',
                        'No new native query, Program import or mutation, compilation or application execution.'])
    if not instruction_frontier:
        return result
    diagnostic_proof = root / evidence_dir / 'as-ownerless-sites.json'
    verify_proof(result, diagnostic_proof, root)
    return classify_instruction_frontier(root, residual, declared, body, span, result, diagnostic_proof)


def verify_proof(result, output, root):
    saved = json.loads(output.read_text())
    producer = saved['generator']
    assert current_path(producer['path'], root) == root / result['generator']['path']
    assert recorded_input_matches(producer['path'], producer['sha256'], root)
    assert dict(result, generator=producer) == saved, 'Ownerless-AS role proof differs'


def classify_instruction_frontier(root, residual, declared, body, span, immediate, diagnostic_proof):
    """Join exact retained ownerless instructions and observed incoming references."""
    artifacts = residual['artifacts']
    used = [artifacts[name] for name in ('diagnostic-sites.jsonl.gz', 'ownerless-instructions.tsv.gz',
                                        'static-reference-roles.tsv.gz')]
    for record in used:
        assert coverage.file_sha256(root / record['path']) == record['sha256'], record['path']
    contexts, as_locations = set(), defaultdict(set)
    with gzip.open(root / used[0]['path'], 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            start = int(row['runtime_function_start'], 16)
            assert declared[start] == int(row['runtime_function_end'], 16)
            contexts.add(start)
            if row['kind'] == 'rust_location' and row['path'].startswith(
                    ('crates/wenilla-rogue/', 'crates/wenilla-rogue-app/')):
                as_locations[start].add(row['path'])
    starts = sorted(declared)

    def extent_at(address):
        index = bisect_right(starts, address) - 1
        if index >= 0 and address < declared[starts[index]]:
            return starts[index]
        return None

    failures = {int(row['start'], 16) for row in immediate['location_helpers']
                if row['role'] == 'terminal-failure-location'}
    supplemental_wrappers = {}
    in_path = set()

    @lru_cache(maxsize=None)
    def failure_wrapper(address):
        if address in failures:
            return True
        end = declared.get(address)
        if end is None or end - address > 0x40:
            return False
        instructions, digest = body(address, require_complete=False)
        if (sum(i.size for i in instructions.values()) != end - address
                or not any(i.group(CS_GRP_CALL) for i in instructions.values())
                or not terminal_route(address, address, through_calls=True)):
            return False
        calls = [[hex(i.address), hex(i.operands[0].imm)] for i in instructions.values()
                 if i.group(CS_GRP_CALL) and i.operands[0].type == X86_OP_IMM]
        supplemental_wrappers[address] = dict(digest, direct_calls=calls, trap_sites=[
            hex(i.address) for i in instructions.values() if i.mnemonic == 'ud2'])
        return True

    @lru_cache(maxsize=None)
    def terminal_route(extent, address, through_calls=False):
        instruction = body(extent)[0].get(address)
        state = extent, address, through_calls
        if instruction is None or state in in_path:
            return False
        if instruction.mnemonic == 'ud2':
            return True
        if instruction.mnemonic in ('ud0', 'ud1') or any(instruction.group(group) for group in (
                CS_GRP_INT, CS_GRP_IRET, CS_GRP_PRIVILEGE, CS_GRP_RET)):
            return False
        if instruction.group(CS_GRP_CALL):
            operand = instruction.operands[0]
            if operand.type != X86_OP_IMM:
                return False
            if not through_calls:
                return failure_wrapper(operand.imm)
        successors = [address + instruction.size]
        if instruction.group(CS_GRP_JUMP):
            operand = instruction.operands[0]
            if operand.type != X86_OP_IMM:
                return False
            if instruction.mnemonic == 'jmp':
                successors.clear()
            successors.append(operand.imm)
        in_path.add(state)
        try:
            return all(terminal_route(extent, successor, through_calls) for successor in successors)
        finally:
            in_path.remove(state)

    counts, selected, flow_counts = Counter(), {}, Counter()
    runs = []
    with gzip.open(root / used[1]['path'], 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            address, length = int(row['address'], 16), int(row['length'])
            extent = extent_at(address)
            if extent not in as_locations:
                role = ('outside_declared_extents' if extent is None else
                        'other_diagnostic_context' if extent in contexts else 'no_diagnostic_context')
                counts[role] += 1
                continue
            counts['genuine_AS_Location_context'] += 1
            assert address not in selected
            instruction = body(extent)[0][address]
            assert instruction.bytes.hex() == row['bytes'] and instruction.size == length
            flow_counts[row['flow']] += 1
            terminal = terminal_route(extent, address)
            selected[address] = (extent, terminal)
            if runs and runs[-1]['extent'] == extent and runs[-1]['end'] == address:
                run = runs[-1]
            else:
                run = dict(extent=extent, start=address, end=address, instructions=0, terminal_ranges=[])
                runs.append(run)
            run['end'] = address + length
            run['instructions'] += 1
            if terminal:
                ranges = run['terminal_ranges']
                if ranges and ranges[-1][1] == address:
                    ranges[-1][1] = address + length
                    ranges[-1][2] += 1
                else:
                    ranges.append([address, address + length, 1])
    assert sum(counts.values()) == used[1]['rows']
    # Include equally bounded local callees of a supplemental wrapper once.
    for wrapper in tuple(supplemental_wrappers.values()):
        for _, target in wrapper['direct_calls']:
            failure_wrapper(int(target, 16))

    incoming = defaultdict(Counter)
    incoming_sha256 = hashlib.sha256()
    with gzip.open(root / used[2]['path'], 'rt') as stream:
        header = next(stream).rstrip('\n').split('\t')
        assert header == ['ordinal', 'from', 'to', 'type', 'source_owner', 'destination_owner',
                          'destination_domain']
        rows = 0
        for line in stream:
            _, source, destination, kind, source_owner, owner, _ = line.rstrip('\n').split('\t')
            rows += 1
            site = int(destination, 16) if destination and ':' not in destination else None
            if site not in selected:
                continue
            assert not owner
            extent, _ = selected[site]
            if source_owner:
                source_role = 'owned_body'
            elif source and ':' not in source and int(source, 16) in selected:
                source_role = 'selected_ownerless_instruction'
            else:
                source_role = 'other_ownerless_source'
            incoming[extent][f'{kind}:{source_role}'] += 1
            incoming_sha256.update(line.encode())
        assert rows == used[2]['rows']

    published_runs = defaultdict(list)
    for run in runs:
        ranges = [[hex(a), hex(b), count] for a, b, count in run['terminal_ranges']]
        published_runs[run['extent']].append(dict(span(run['start'], run['end']),
                                                   instructions=run['instructions'], terminal_ranges=ranges))
    extents = []
    for extent, extent_runs in published_runs.items():
        total = sum(run['instructions'] for run in extent_runs)
        terminal = sum(r[2] for run in extent_runs for r in run['terminal_ranges'])
        extents.append(dict(start=hex(extent), end_exclusive=hex(declared[extent]),
                            paths=sorted(as_locations[extent]), instructions=total,
                            terminal_instructions=terminal, other_instructions=total - terminal,
                            observed_incoming_references=dict(sorted(incoming[extent].items())),
                            runs=extent_runs))
    return dict(schema_version=1, target=residual['target'],
                generator=dict(path=immediate['generator']['path'], sha256=immediate['generator']['sha256']),
                inputs=[*immediate['inputs'][:1], *used,
                        dict(path=diagnostic_proof.relative_to(root).as_posix(),
                             sha256=coverage.file_sha256(diagnostic_proof))],
                lead_ids=['Q41-G01'], gap_ids=[41],
                selector='ownerless-instructions.tsv.gz joined to declared PE unwind extents containing a genuine Rust Location for either AS crate',
                counts=dict(ownerless_by_declared_extent_context=dict(counts),
                            AS_location_extents=len(as_locations), selected_extents=len(extents), runs=len(runs),
                            terminal_instructions=sum(terminal for _, terminal in selected.values()),
                            entirely_terminal_runs=sum(run['instructions'] == sum(r[2] for r in run['terminal_ranges'])
                                                        for run in runs),
                            selected_flow_records=dict(sorted(flow_counts.items())),
                            incoming_reference_records=sum(sum(values.values()) for values in incoming.values())),
                incoming_reference_rows_sha256=incoming_sha256.hexdigest(),
                additional_local_terminal_wrappers=[supplemental_wrappers[a] for a in sorted(supplemental_wrappers)],
                wrapper_direct_call_columns=['site', 'target'],
                terminal_range_columns=['start', 'end_exclusive', 'instruction_count'],
                extents=extents,
                limits=['Terminal routes stop at UD2 or a checked terminal wrapper. Supplemental wrappers have a fully decoded declared extent of at most 64 bytes and every local normal path reaches UD2, following direct calls only at their return sites.',
                        'Both conditional successors must qualify. A cycle, return, other call, computed jump or missing instruction fails the outer route test. Callee internals and nonlocal exits remain separate.',
                        'Diagnostic context is an exact extent association. Incoming references are saved observations, including data and computed relations. Neither fact establishes the source owner, runtime callee or successful gameplay behavior.',
                        'Other instruction rows retain their selectors. Q41-D01 removal and format-argument roles apply only to their verified operand routes.',
                        'No census changes, new native query, compilation or application execution.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--instruction-frontier', action='store_true',
                        help='Check the selected ownerless instruction and incoming-reference proof')
    parser.add_argument('--analysis-workspace', type=Path, default=SOURCE_ROOT,
                        help='Primary checkout holding retained evidence when checking from a linked worktree')
    args = parser.parse_args()
    root = args.analysis_workspace.resolve()
    target, pe, decoder = load_reference(root)
    if target['version'] == '0.121.0' and not args.instruction_frontier:
        result = generate(root, target, pe, decoder)
        output = SOURCE_ROOT / PROOF
    else:
        result = generate_current(root, target, pe, decoder, args.instruction_frontier)
        name = 'as-ownerless-instructions.json' if args.instruction_frontier else 'as-ownerless-sites.json'
        output = SOURCE_ROOT / 'docs/analysis/evidence' / target['version'] / name
    if args.write:
        output.write_text(coverage.json_text(result))
    else:
        verify_proof(result, output, root)
    print(coverage.json_text(result['counts']).strip())


if __name__ == '__main__':
    main()
