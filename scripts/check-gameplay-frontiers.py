#!/usr/bin/env python3
"""Check selected AS dispatch producers without compiling or starting a game.

Original-instruction fixtures use the existing explicit allocator/byte-operation
seams. A closed scalar return proof is separate from a contextual prefix replay
and from whole-program alias or native-body ownership claims.
"""
from native_recovery import digest as _shared_digest
import argparse
from collections import Counter, deque
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, file_sha256, json_text

sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
import capstone
import native_talent_fixture as native

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
KEPT = ROOT / 'docs/analysis/evidence/gameplay-frontiers'
STAGE = ROOT / 'runtime/analysis/history/native-recovery/gameplay-frontiers/1d609cc38fa0/staged'
RESET = (0x1459b7f00, 0x1459b82a6)
FILTER = (0x1459cbd40, 0x1459cbeab)


def digest(value):
    return _shared_digest(value)


def raw(address, size):
    offset = native.pe.rva_offset(address - native.pe.image_base)
    assert offset is not None and 0 <= offset <= len(native.data) - size
    return native.data[offset:offset + size]


def span(first, last):
    value = raw(first, last - first)
    return dict(va=hex(first), end_exclusive=hex(last), byte_count=len(value), sha256=digest(value))


def decoded(first, last):
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    result = list(decoder.disasm(raw(first, last - first), first))
    assert sum(row.size for row in result) == last - first
    return result


def low_byte_returns(instructions, start):
    """Conservative CFG lattice for AL; every unknown write becomes all256.

    Calls may return any AL. Direct conditional branches explore both arms;
    indirect flow, external jumps and undecoded fallthrough fail closed. Upper
    RAX bits and comparisons are deliberately not used to narrow this proof.
    """
    by_address = {row.address: row for row in instructions}
    all_bytes = frozenset(range(256))
    inputs = {start: all_bytes}
    queue = deque([start])
    returns = set()
    return_sites = set()
    visited_calls = set()
    while queue:
        site = queue.popleft()
        instruction = by_address[site]
        values = inputs[site]
        operands = instruction.operands
        writes = {instruction.reg_name(reg) for reg in instruction.regs_access()[1]}
        if instruction.group(capstone.CS_GRP_CALL):
            values = all_bytes
            visited_calls.add(site)
        elif writes.intersection({'rax', 'eax', 'ax', 'al'}):
            values = all_bytes
            if instruction.mnemonic == 'mov' and len(operands) == 2:
                if operands[1].type == capstone.x86_const.X86_OP_IMM:
                    values = frozenset([operands[1].imm & 255])
            elif instruction.mnemonic == 'xor' and len(operands) == 2:
                if operands[0].type == operands[1].type == capstone.x86_const.X86_OP_REG and operands[0].reg == operands[1].reg:
                    values = frozenset([0])
            elif instruction.mnemonic.startswith('set'):
                values = frozenset([0, 1])
        if instruction.group(capstone.CS_GRP_RET):
            returns.update(values)
            return_sites.add(site)
            continue
        if instruction.mnemonic in ('ud2', 'int3', 'hlt'):
            continue
        successors = []
        if instruction.group(capstone.CS_GRP_JUMP):
            assert len(operands) == 1 and operands[0].type == capstone.x86_const.X86_OP_IMM, 'Unproved indirect transfer in return proof'
            successors.append(operands[0].imm)
        if instruction.mnemonic != 'jmp':
            successors.append(site + instruction.size)
        for successor in successors:
            assert successor in by_address, f'Unproved exit {successor:#x}'
            previous = inputs.get(successor, frozenset())
            combined = previous | values
            if combined != previous:
                inputs[successor] = combined
                queue.append(successor)
    return dict(normal_return_values=sorted(returns), normal_return_sites=[hex(a) for a in sorted(return_sites)],
                reached_instruction_count=len(inputs), calls_with_unrestricted_return_values=[hex(a) for a in sorted(visited_calls)],
                proof='Complete direct-CFG AL lattice; all conditional paths explored and all calls clobber AL; no input-value assumptions.')


def return_proof_negative_checks():
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    def domain(value):
        return low_byte_returns(list(decoder.disasm(bytes.fromhex(value), 0x1000)), 0x1000)['normal_return_values']
    assert domain('b003b4ffc3') == [3], 'AH must not overwrite AL'
    assert domain('b003b0ffc3') == [255], 'AL clobber must not retain an earlier bound'
    assert domain('b003e800000000c3') == list(range(256)), 'Calls must clobber AL'
    assert domain('b003f7e1c3') == list(range(256)), 'Implicit MUL result must clobber AL'
    assert domain('b00385c97402b0ffc3') == [3, 255], 'Both conditional paths must remain admitted'
    try:
        domain('b003ffe0')
    except AssertionError:
        pass
    else:
        raise AssertionError('Unproved computed transfer must fail closed')
    return 6


def table(address, count, owner):
    value = raw(address, 4 * count)
    section = next(row for row in native.pe.sections if native.pe.image_base + row['rva'] <= address < native.pe.image_base + row['rva'] + row['virtual_size'])
    assert not int(section['characteristics'], 16) & 0x80000000, 'Writable dispatch table'
    boundaries = {row.address for row in decoded(*owner)}
    targets = [address + displacement for displacement in struct.unpack('<' + 'i' * count, value)]
    assert all(target in boundaries for target in targets), 'Destination is not an independently decoded owner boundary'
    return dict(**span(address, address + len(value)), encoding='signed-LE32-relative-to-table', hex=value.hex(),
                index_values=list(range(count)), targets=[hex(target) for target in targets],
                whole_domain_independent_instruction_boundaries=True)


def prefix_replays(machine, first, last, register, table_record, setup=None, result_register=native.UC_X86_REG_RAX):
    rows = []
    for selector, destination in enumerate(table_record['targets']):
        if setup:
            setup(selector)
        machine.u.reg_write(register, selector)
        machine.u.emu_start(first, last, count=100)
        assert machine.u.reg_read(native.UC_X86_REG_RIP) == last
        actual = machine.u.reg_read(result_register)
        assert actual == int(destination, 16)
        rows.append(dict(selector=selector, destination=hex(actual)))
    return rows


def guardian(machine):
    proof = low_byte_returns(decoded(*RESET), RESET[0])
    assert proof['normal_return_values'] == [0, 1, 2, 3]
    assert raw(0x14594718a, 5) == bytes.fromhex('e8710d0700')
    assert raw(0x14594718f, 0x14) == bytes.fromhex('900fb6c0488d0dd2542c01486304814801c8ffe0')
    rows = []
    for awake in (0, 1):
        for x in (0., 10., 97.5, 98.):
            actor = machine.alloc(0x200)
            player = machine.alloc(12)
            home = machine.alloc(12)
            machine.u.mem_write(player, struct.pack('<3f', x, 0., 0.))
            machine.u.mem_write(home, bytes(12))
            machine.u.mem_write(actor + 0x158, struct.pack('<ff', 100., 100.))
            machine.u.mem_write(actor + 0xa8, bytes([awake]))
            result = machine.call(RESET[0], actor, player, home) & 255
            rows.append(dict(awake=awake, player_x=x, result=result))
    assert sorted(set(row['result'] for row in rows)) == [0, 1, 2, 3]
    current_table = table(0x146c0c66c, 4, (0x145945710, 0x14594ac38))
    replays = prefix_replays(machine, 0x145947190, 0x1459471a1, native.UC_X86_REG_RAX, current_table)
    return dict(site='0x1459471a1', selector_register='AL', selector_domain=[0, 1, 2, 3],
                domain_status='closed-normal-return-domain', producer=span(*RESET),
                canonical_producer_manifest='docs/analysis/evidence/0.112.0/raid-inputs/manifest.json',
                canonical_producer_pseudocode='docs/analysis/evidence/0.112.0/raid-inputs/guardian-reset.pseudo.c',
                direct_call=span(0x14594718a, 0x14594718f), consumer=span(0x14594718f, 0x1459471a3),
                proof=proof, table=current_table, native_cases=rows, prefix_replays=replays)


def wave_filter(machine):
    output = machine.alloc(24)
    state = machine.alloc(1)
    descriptor = machine.alloc(32)
    results = []
    for previous in range(256):
        machine.u.mem_write(state, bytes([previous]))
        machine.put(descriptor, state, 0, 4, 0x03020100)
        machine.call(FILTER[0], output, descriptor)
        count = machine.q(output + 16)
        actual = list(machine.u.mem_read(machine.q(output + 8), count))
        assert actual == [value for value in range(4) if value != previous]
        results.append([previous, actual])
    assert raw(0x145904e0e, 10) == bytes.fromhex('c785b800000000010203')
    assert raw(0x145904ee7, 4) == bytes.fromhex('0fb63410')
    assert raw(0x14590511b, 2) == bytes.fromhex('89f0')
    current_table = table(0x146c0c200, 4, (0x1458fb890, 0x145908680))
    replays = prefix_replays(machine, 0x14590511b, 0x14590512b, native.UC_X86_REG_RSI, current_table)
    return dict(site='0x14590512b', selector_register='ESI', selector_domain=[0, 1, 2, 3],
                domain_status='closed-for-recovered-fixed-four-byte-input-route',
                producer=span(*FILTER), fixed_input=span(0x145904df8, 0x145904e32),
                iterator_layout='state pointer, cursor0, end4, inline bytes00/01/02/03',
                filter_rule='Copies each supplied inline byte except the byte addressed by the state pointer, in order.',
                output_stores=[span(0x1459cbda6, 0x1459cbda8), span(0x1459cbe7e, 0x1459cbe85)],
                selected_byte_load=span(0x145904ed0, 0x145904ef2),
                fallback_scalar_save=span(0x145904fe9, 0x145904fef),
                fallback_scalar_restore=span(0x145905050, 0x145905060),
                consumer=span(0x14590511b, 0x14590512d), table=current_table,
                native_previous_state_cases=256, case_results_sha256=digest(json.dumps(results, separators=(',', ':')).encode()),
                prefix_replays=replays,
                whole_program_incoming_aliases_or_native_body_ownership_claimed=False,
                limits=['The fixed input and complete filter writes close this producer route; no arbitrary replacement vector is admitted.',
                        'The native caller selects through a length-checked UniformInt index and preserves its chosen byte through the fallback stack slot.',
                        'Allocator and external helper stack/ABI contracts are independent shared interfaces; no whole-program alias theorem is inferred.'])


def observed_direct_calls():
    """Cross-check census edges against all file-backed executable E8/E9 bytes.

    Every matching candidate must also be a linear instruction boundary in its
    exact .pdata owner. This admits no computed calls or alias closure claim.
    """
    counts = {0x145944310: 22, 0x14591f490: 13, 0x145924df0: 7, 0x1458975c0: 2,
              0x14592d530: 2, 0x145934c50: 8, 0x1459f5490: 1, 0x1459f9fb0: 3}
    results = {target: [] for target in counts}
    pdata = next(row for row in native.pe.sections if row['name'] == '.pdata')
    owners = [struct.unpack_from('<III', native.data, pdata['raw_offset'] + offset)[:2]
              for offset in range(0, pdata['raw_size'] - 11, 12)]
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    boundaries = {}
    for section in native.pe.sections:
        if not int(section['characteristics'], 16) & 0x20000000:
            continue
        buffer = native.data[section['raw_offset']:section['raw_offset'] + section['raw_size']]
        base = native.pe.image_base + section['rva']
        for opcode in (0xe8, 0xe9):
            offset = -1
            while True:
                offset = buffer.find(bytes([opcode]), offset + 1)
                if offset < 0 or offset > len(buffer) - 5:
                    break
                target = base + offset + 5 + struct.unpack_from('<i', buffer, offset + 1)[0]
                if target not in results:
                    continue
                address = base + offset
                owner = next(((first, last) for first, last in owners
                              if first <= address - native.pe.image_base < last), None)
                assert owner, f'Direct candidate outside known unwind owner: {address:#x}'
                if owner not in boundaries:
                    first, last = (native.pe.image_base + value for value in owner)
                    boundaries[owner] = {row.address: row.mnemonic for row in decoder.disasm(raw(first, last - first), first)}
                assert boundaries[owner].get(address) in ('call', 'jmp'), f'Noninstruction direct candidate: {address:#x}'
                results[target].append(dict(call=span(address, address + 5), bytes=buffer[offset:offset + 5].hex(),
                                            owner=[hex(native.pe.image_base + value) for value in owner]))
    assert {target: len(rows) for target, rows in results.items()} == counts
    return dict(targets={hex(target): rows for target, rows in results.items()},
                method='All file-backed executable E8/E9 candidates, validated against independently decoded unwind-owner instruction boundaries.',
                limits='Computed calls, veneers, mutable aliases and reachability are separate; this does not promote census body ownership.')


def mutable_alias_boundaries(machine):
    """Follow identified AS slice readers to their typed/shared interfaces."""
    cases = {key: [] for key in ['linked-pickup-guids', 'eligible-pickup-guids', 'army-descriptor-filter', 'timed-cast-collector']}
    for kind in range(256):
        for linked in [0, 1]:
            game, row, actor, iterator, output = [machine.alloc(size) for size in [0xb00, 72, 112, 24, 24]]
            value = bytearray(72)
            struct.pack_into('<I', value, 32, kind)
            struct.pack_into('<Q', value, 40, 0x1234)
            machine.u.mem_write(row, bytes(value))
            machine.put(game + 0x958, actor, 1)
            machine.u.mem_write(actor + 0x18, struct.pack('<I', linked))
            machine.put(actor + 0x20, 0x1234)
            machine.put(iterator, row, row + 72, game)
            machine.call(0x1459d4d20, output, iterator)
            count = machine.q(output + 16)
            assert count == linked and (count == 0 or machine.q(machine.q(output + 8)) == 0x1234)
            assert bytes(machine.u.mem_read(row, 72)) == bytes(value)
            cases['linked-pickup-guids'].append([kind, linked, count])
    for kind in [*range(256), 0xffffffff]:
        for flag in [0, 1]:
            for subtype in range(4):
                for distance in [1., 3.]:
                    row, iterator, output, type_pointer, point, radius = [machine.alloc(size) for size in [72, 48, 24, 1, 12, 4]]
                    value = bytearray(72)
                    value[24] = flag
                    struct.pack_into('<I', value, 32, kind)
                    struct.pack_into('<Q', value, 40, 0x1234)
                    struct.pack_into('<3f', value, 52, distance, 0., 0.)
                    machine.u.mem_write(row, bytes(value))
                    machine.u.mem_write(type_pointer, bytes([subtype]))
                    machine.u.mem_write(radius, struct.pack('<f', 2.))
                    machine.put(iterator, row, row + 72, type_pointer, type_pointer, point, radius)
                    machine.call(0x1459d4350, output, iterator)
                    count = machine.q(output + 16)
                    expected = int(flag == 0 and (kind < 2 or (3 <= kind < 6 and subtype == 3)) and distance <= (4. if kind == 0 and subtype == 2 else 2.))
                    assert count == expected and (count == 0 or machine.q(machine.q(output + 8)) == 0x1234)
                    assert bytes(machine.u.mem_read(row, 72)) == bytes(value)
                    cases['eligible-pickup-guids'].append([kind, flag, subtype, distance, count])
    for tag in range(36):
        for flag in [0, 1]:
            for family in [0, 1, 4, 5]:
                row, definition, state, iterator, output = [machine.alloc(size) for size in [64, 64, 1, 24, 24]]
                value = bytearray(64)
                value[0] = tag
                struct.pack_into('<Q', value, 8, definition)
                machine.u.mem_write(row, bytes(value))
                machine.u.mem_write(definition + 0x39, bytes([family]))
                machine.u.mem_write(state, bytes([flag]))
                machine.put(iterator, row, row + 64, state)
                machine.call(0x1459cc290, output, iterator)
                count = machine.q(output + 16)
                assert count == int(tag == 29 and (flag != 1 or family not in [1, 2, 3, 4]))
                assert count == 0 or machine.q(machine.q(output + 8)) == definition
                assert bytes(machine.u.mem_read(row, 64)) == bytes(value)
                cases['army-descriptor-filter'].append([tag, flag, family, count])
    for tags in [[tag] for tag in range(36)] + [[], [26, 0, 26], [15, 26, 19, 31], [31, 29, 30, 35]]:
        row, output = machine.alloc(64 * len(tags)), machine.alloc(24)
        values = []
        for index, tag in enumerate(tags):
            value = bytearray(64)
            value[0] = tag
            struct.pack_into('<fQQ', value, 4, index + .5, 0x12340000 + index, 0x100 + index)
            values.append(bytes(value))
        machine.u.mem_write(row, b''.join(values) or bytes(1))
        machine.call(0x1459cdb60, output, row, row + len(tags) * 64)
        expected = [index for index, tag in enumerate(tags) if tag == 26]
        assert machine.q(output + 16) == len(expected)
        for slot, index in enumerate(expected):
            at = machine.q(output + 8) + slot * 24
            assert machine.q(at) == 0x12340000 + index and machine.q(at + 8) == 0x100 + index
            assert bytes(machine.u.mem_read(at + 16, 4)) == struct.pack('<f', index + .5)
        assert bytes(machine.u.mem_read(row, len(tags) * 64)) == b''.join(values)
        cases['timed-cast-collector'].append([tags, expected])
    selector_boundaries = []
    for first, last, allowed in [(0x145934b40, 0x145934c46, [0x145939990]),
                                (0x145939990, 0x145939be9, [0x145c0a3e7, 0x145da9a60])]:
        rows = decoded(first, last)
        calls = []
        for instruction in rows:
            if instruction.group(capstone.CS_GRP_CALL):
                assert instruction.operands[0].type == capstone.x86_const.X86_OP_IMM
                target = instruction.operands[0].imm
                assert target in allowed
                calls.append(hex(target))
            if instruction.operands and instruction.operands[0].type == capstone.x86_const.X86_OP_MEM:
                if instruction.mnemonic not in ['cmp', 'test', 'nop']:
                    assert instruction.reg_name(instruction.operands[0].mem.base) == 'rsp'
        selector_boundaries.append(dict(**span(first, last), non_stack_explicit_memory_writes=0, call_targets=sorted(set(calls))))
    return dict(
        vector_headers=[
            dict(role='pickups', header='Game+608/610/618', stride=72, tag_offset=32,
                 append_owners=['0x145944310'], removal_owners=['0x14594d9e0'],
                 shared_boundary='145c0da10 Vec growth;145c0a3ed complete72-byte compaction'),
            dict(role='hazards', header='Game+590/598/5a0', stride=128, shape_offset=48, kind_offset=16,
                 append_owners=['0x14591f490', '0x14591f790'], removal_owners=['0x1459164c0'],
                 active_shape_mutation='0x14591785b -> shape2', canonical_producers='docs/analysis/evidence/0.112.0/raid-hazards/manifest.json',
                 shared_boundary='145c0daf0 Vec growth;145c0a3ed complete128-byte compaction'),
            dict(role='queued-actions', header='Game+5a8/5b0/5b8', stride=64, action_offset=16, tag_offset=61,
                 append_owners=['0x14591f790'], removal_owners=['0x1459164c0'],
                 canonical_producers='docs/analysis/evidence/0.112.0/raid/manifest.json',
                 shared_boundary='145c165c0 Vec growth;145c0a3ed complete64-byte compaction; copied48-byte typed action payload'),
            dict(role='generic-effects', header='Game+820/828/830', stride=64, tag_offset=0,
                 publication_owner='0x14592d530', publication_sites=['0x14592d855', '0x14592d878'],
                 shared_boundary='145c0a3db snapshot copy; opaque incoming typed Game/instance resource identity')],
        read_only_slice_cases={key: dict(cases=len(value), results_sha256=digest(json.dumps(value, separators=(',', ':')).encode())) for key, value in cases.items()},
        reader_ranges=[span(first, last) for first, last in [(0x1459d4d20, 0x1459d4edc), (0x1459d4350, 0x1459d45ae),
                                                          (0x1459cc290, 0x1459cc40f), (0x1459cdb60, 0x1459cdcb3)]],
        source_rows_unchanged_in_all_reader_cases=True, selector_boundaries=selector_boundaries,
        aura_contract='docs/analysis/evidence/0.112.0/player-aura-indices/contracts.json',
        aura_contract_sha256=file_sha256(ROOT / 'docs/analysis/evidence/player-aura-indices/contracts.json'),
        remaining_obligation='Whole typed-resource pointer/lifetime identity and absence of unseen computed/aliased writes are separate static ownership claims. All identified AS producer/state/presentation paths in this focused audit have source consumers; no additional concrete missing AS behavior remains demonstrated.',
        limits='Header/source-operand audit is bounded to existing custom diagnostic/selected AS owners. Bulk inventory remains ignored; no whole-image or body ownership promotion.')


def contexts():
    # The two hoisted aliases are current RIP-relative LEAs. Retain this
    # progress without inventing a closed shape-tag input domain.
    aliases = []
    for initializer, site, register, expected in (
            (0x145917234, 0x1459179b6, 'r12', 0x146c0c25c),
            (0x1459198e5, 0x145919a34, 'r14', 0x146c0c220)):
        rows = decoded(initializer, site + 2)
        first = rows[0]
        assert first.mnemonic == 'lea' and first.reg_name(first.operands[0].reg) == register
        address = first.address + first.size + first.operands[1].mem.disp
        assert address == expected
        clobbers = [row for row in rows[1:] if register in {row.reg_name(reg) for reg in row.regs_access()[1]}]
        assert not clobbers, f'Hoisted {register} table base was overwritten'
        aliases.append(dict(site=hex(site), initializer=span(initializer, initializer + first.size), register=register,
                            table_va=hex(address), unchanged_linear_span=span(initializer + first.size, site + 2),
                            input_domain_closed=False,
                            limits='Observed linear initializer/preservation only; alternate incoming aliases and shape producers remain separate.'))
    return dict(hazard_hoisted_table_aliases=aliases,
                content_inner_selectors=dict(outer_record_stride=64, outer_tag=37, inner_byte_offset=36,
                    selector_reads=[span(0x1459f55e9, 0x1459f55ee), span(0x1459fa0eb, 0x1459fa0f0)],
                    sites=['0x1459f5738', '0x1459f592c', '0x1459f5b1e', '0x1459fa10f'],
                    domain_closed=False,
                    current_catalog_domain=list(range(7)),
                    limitation='Current catalogs and scaling preserve modifier0..6; this is not the independent five-value ability-upgrade slice. Whole mutable buffer identity is separate.'),
                additional_direct_paths=dict(
                    reward_owner=span(0x145966a60, 0x145968b5e),
                    amulet_tooltip_scaled_buffer=span(0x145967df1, 0x145967ed8),
                    reward_rebuild_calls=[span(0x145967777, 0x14596777c), span(0x145968ae0, 0x145968ae5)],
                    generic_proxy_casts=span(0x14593707d, 0x145937129),
                    canonical_proxy_contract='docs/analysis/soul-reaping-0.112.0.md',
                    source_consumers=['gameplay/mechanics/treasure.rs::choose_cache_reward',
                                      'gameplay/native_overlay_payload.rs::for_treasure/for_choice',
                                      'gameplay/mechanics/milestones.rs::generic_freecast']),
                unresolved_sites=[
                    dict(site='0x145903061', input='72-byte pickup Vec at Game+0x610/+0x618; dword+0x20',
                         missing='Current22 direct kind arguments are bounded; no-unseen-writer/computed-caller closure for the mutable pickup Vec remains unproved.'),
                    dict(site='0x1459167bd', input='byte from queued48-byte action+45; normalized below35 to0',
                         missing='Current493-node graph/producers and sentinel are covered; identities of all copied action-buffer aliases remain unclosed.'),
                    *[dict(site=site, input='shape dword at live128-byte hazard+0x30',
                           missing='Current13 direct common-constructor calls and explicit active shape2 mutation are covered; arbitrary mutable hazard-row alias writes remain unclosed.')
                      for site in ['0x1459179b6', '0x145918086', '0x1459182c9', '0x1459192d7', '0x145919353', '0x145919a34']],
                    dict(site='0x14591a026', input='kind dword at live128-byte hazard+0x10',
                         missing='Current common-constructor descriptors and hz presentation are covered; arbitrary mutable hazard-row kind writes remain unclosed.'),
                    dict(site='0x1459250f3', input='ability descriptor byte+0x75 via incoming instance pointer',
                         missing='Current113 immutable descriptors and seven direct cast callers are covered; closed instance/descriptor pointer identity across arbitrary aliases remains unproved.'),
                    dict(site='0x145934f5e', input='byte0 of64-byte live effect record',
                         missing='Current talent/amulet rank/scaling/aggregate/publication route is covered; closed identity/no-unseen-writer proof for arbitrary generic Vec aliases remains unproved.'),
                    *[dict(site=site, input='effect modifier byte+0x24 when outer64-byte tag37',
                           missing='Current catalog modifiers/scaler and known tooltip caller buffers are covered; arbitrary caller/buffer alias identity remains unclosed.')
                      for site in ['0x1459f5738', '0x1459f592c', '0x1459f5b1e', '0x1459fa10f']]])


def effect_inputs(machine):
    """Bind every current talent/amulet input and the real aggregate partition."""
    def pair(address):
        return struct.unpack('<QQ', raw(address, 16))
    def text(address):
        pointer, count = pair(address)
        return raw(pointer, count).decode()
    asset = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/talents.json').read_text())
    sources = {row['id']: {talent['key']: talent for tree in row['trees'] for talent in tree['talents']} for row in asset['classes']}
    for class_id, path in ((1, 'crates/azeroth-survivors-re/assets/warrior-talents-0.112.0.json'),
                           (9, 'crates/azeroth-survivors-re/assets/warlock-effects-0.112.0.json')):
        sources[class_id].update({row['key']: row for row in json.loads((ROOT / path).read_text())['talents']})
    descriptors = []
    original_records = []
    ranked = []
    rank_cases = 0
    descriptor_effects = 0
    for class_id in (1, 2, 3, 4, 5, 7, 8, 9, 11):
        trees = struct.unpack('<Q', raw(0x14723f158 + 8 * (class_id - 1), 8))[0]
        for tree in range(3):
            pointer, count = pair(trees + tree * 64 + 48)
            for index in range(count):
                descriptor = pointer + index * 160
                key = text(descriptor + 48)
                effects, effect_count = pair(descriptor + 96)
                maximum = raw(descriptor + 154, 1)[0]
                source = sources[class_id][key]['effects']
                assert len(source) == effect_count, (class_id, key, 'missing current source effect row')
                values = []
                for effect_index in range(effect_count):
                    value = raw(effects + effect_index * 64, 64)
                    projected = bytes.fromhex(source[effect_index].get('raw_hex', source[effect_index].get('payload')))
                    tag = value[0]
                    expected = 253 if class_id == 9 and 29 <= tag <= 35 else {36: 30, 37: 31}.get(tag, tag)
                    assert projected[0] == expected
                    if expected == 253:
                        assert projected[63] == tag
                    if tag == 37:
                        assert projected[36] == value[36]
                    values.append(value)
                    original_records.append(value)
                    descriptor_effects += 1
                descriptors.append([class_id, tree, key, maximum, [value[0] for value in values]])
                for rank in range(1, maximum + 1):
                    vector = machine.vector([(descriptor, rank)])
                    output = machine.alloc(24)
                    machine.call(0x14599e8d0, output, vector)
                    assert machine.q(output + 16) == effect_count
                    for effect_index, original in enumerate(values):
                        value = bytes(machine.u.mem_read(machine.q(output + 8) + effect_index * 72 + 8, 64))
                        assert value[0] == original[0]
                        if value[0] == 37:
                            assert value[36] == original[36]
                        ranked.append(value)
                    rank_cases += 1
    amulet_records = []
    for index in range(113):
        output = machine.alloc(112)
        machine.call(0x1458a1730, output, 0x146bf5eb0 + index * 120)
        pointer, count = machine.q(output + 56), machine.q(output + 64)
        amulet_records.extend(bytes(machine.u.mem_read(pointer + slot * 64, 64)) for slot in range(count))
    for index in range(16):
        pointer, count = pair(0x146c015c8 + index * 80 + 48)
        amulet_records.extend(raw(pointer + slot * 64, 64) for slot in range(count))
    all_records = ranked + amulet_records
    assert len(descriptors) == 355 and descriptor_effects == 429 and rank_cases == 1121
    assert all(value[0] < 38 for value in all_records)
    inner = sorted({value[36] for value in all_records if value[0] == 37})
    assert inner == list(range(7))
    # Aggregate authentic current records through original instructions. The
    # borrowed metadata stamp identifies the input row and is not dereferenced.
    aggregate = machine.alloc(96)
    machine.put(aggregate, 0, 4, 0, 0, 8, 0, 0, 8, 0, 0, 8, 0)
    incoming = machine.alloc(64)
    metadata = machine.alloc(40)
    expected_generic = []
    expected_spell = []
    expected_stats = []
    for index, value in enumerate(all_records):
        machine.u.mem_write(incoming, value)
        machine.put(metadata, (1 << 64) - 1, index + 0x1000, 1, 0x2000, 1)
        machine.call(0x1458975c0, aggregate, incoming, metadata)
        if value[0] == 36:
            tag = value[8]
            amount = struct.unpack_from('<f', value, 4)[0]
            previous = next((i for i, row in enumerate(expected_stats) if row[0] == tag), None)
            if previous is None:
                expected_stats.append([tag, amount])
            else:
                expected_stats[previous][1] = struct.unpack('<f', struct.pack('<f', expected_stats[previous][1] + amount))[0]
        elif value[0] == 37:
            expected_spell.append(value)
        else:
            expected_generic.append((index, value))
    generic_pointer, generic_count = machine.q(aggregate + 56), machine.q(aggregate + 64)
    source_pointer, source_count = machine.q(aggregate + 80), machine.q(aggregate + 88)
    assert generic_count == source_count == len(expected_generic)
    for slot, (index, value) in enumerate(expected_generic):
        assert bytes(machine.u.mem_read(generic_pointer + slot * 64, 64)) == value
        assert machine.q(source_pointer + slot * 40 + 8) == index + 0x1000
    assert machine.q(aggregate + 40) == len(expected_spell)
    for slot, value in enumerate(expected_spell):
        pointer = machine.q(aggregate + 32) + slot * 32
        assert bytes(machine.u.mem_read(pointer, 24)) == value[8:32]
        assert machine.u.mem_read(pointer + 24, 1)[0] == value[36]
        assert bytes(machine.u.mem_read(pointer + 28, 4)) == value[32:36]
    assert machine.q(aggregate + 16) == len(expected_stats)
    for slot, (tag, amount) in enumerate(expected_stats):
        pointer = machine.q(aggregate + 8) + slot * 8
        assert machine.u.mem_read(pointer, 1)[0] == tag
        assert bytes(machine.u.mem_read(pointer + 4, 4)) == struct.pack('<f', amount)
    # Every encoded table destination is checked independently, with actual
    # producer domains scoped separately from complete mutable alias ancestry.
    executor = table(0x146c0c540, 36, (0x145934c50, 0x145938917))
    content_tables = [table(address, 7, owner) for address, owner in (
        (0x147246884, (0x1459f5490, 0x1459f72d7)),
        (0x147246868, (0x1459f5490, 0x1459f72d7)),
        (0x1472468f4, (0x1459f9fb0, 0x1459fce7d)))]
    executor_replays = prefix_replays(machine, 0x145934f4d, 0x145934f5e, native.UC_X86_REG_R10,
                                     executor, result_register=native.UC_X86_REG_R10)
    frame = machine.alloc(0x400) + 0x80
    def stack_selector(selector):
        machine.u.reg_write(native.UC_X86_REG_RBP, frame)
        machine.u.mem_write(frame - 0x38, struct.pack('<I', selector))
    content_replays = []
    for first, last, register, item, setup in (
            (0x1459f5722, 0x1459f5738, native.UC_X86_REG_RBX, content_tables[0], stack_selector),
            (0x1459f591e, 0x1459f592c, native.UC_X86_REG_RBX, content_tables[1], None),
            (0x1459f5b05, 0x1459f5b1e, native.UC_X86_REG_RBX, content_tables[0], stack_selector),
            (0x1459fa0ff, 0x1459fa10f, native.UC_X86_REG_RDI, content_tables[2], None)):
        content_replays.append(dict(site=hex(last), cases=prefix_replays(machine, first, last, register, item, setup)))
    return dict(current_talent_descriptors=len(descriptors), current_talent_effect_payloads=descriptor_effects,
                current_rank_collector_cases=rank_cases, current_ranked_effect_rows=len(ranked),
                descriptor_order_sha256=digest(json.dumps(descriptors, separators=(',', ':')).encode()),
                current_amulet_descriptors=dict(generated=113, shared=16, produced_effect_rows=len(amulet_records)),
                input_effect_tag_counts={str(tag): count for tag, count in sorted(Counter(value[0] for value in all_records).items())},
                spell_modifier_domain=inner, source_talent_tags_order_and_modifiers_checked=True,
                aggregate_cases=len(all_records), generic_rows=generic_count, spell_rows=len(expected_spell), merged_stats=len(expected_stats),
                original_generic_metadata_order_verified=True, original_generic_record_copy_verified=True,
                generic_output_domain=sorted({value[0] for _, value in expected_generic}),
                native_aggregate=span(0x1458975c0, 0x1458977e0),
                native_rebuild_publication=span(0x14592d831, 0x14592d894),
                producer_contract='Native36 and37 are diverted into stats/modifier vectors; all other current records retain full64 bytes and matching40-byte provenance in original order.',
                executor_table=executor, content_tables=content_tables,
                executor_prefix_replays=executor_replays, content_prefix_replays=content_replays,
                limits=['All current355 talent and129 amulet descriptor inputs, native rank transforms and original aggregate copies are covered.',
                        'The reconstructed source uses historical internal tags30/31 and explicit253 markers for current Warlock29..35; numeric inputs never acquire generic effect indices.',
                        'These producer domains do not by themselves prove every saved-input, caller alias or mutable Vec writer in the complete program.'])


def aggregate_order_fixtures(machine):
    fixtures = []
    for tags in ([], [36, 37], [36, 0, 37, 13, 36, 29, 30, 33], [37, 36, 37, 4, 31, 35]):
        aggregate = machine.alloc(96)
        machine.put(aggregate, 0, 4, 0, 0, 8, 0, 0, 8, 0, 0, 8, 0)
        metadata = machine.alloc(40)
        incoming = machine.alloc(64)
        inputs = []
        for index, tag in enumerate(tags):
            value = bytearray(64)
            value[0] = tag
            struct.pack_into('<I', value, 56, index)
            if tag == 36:
                value[8] = 3
                struct.pack_into('<f', value, 4, index + 0.25)
            elif tag == 37:
                struct.pack_into('<f', value, 32, index * 0.125)
            machine.u.mem_write(incoming, bytes(value))
            machine.put(metadata, (1 << 64) - 1, index + 0x1000, 1, 0x2000, 1)
            machine.call(0x1458975c0, aggregate, incoming, metadata)
            inputs.append(value.hex())
        count = machine.q(aggregate + 64)
        tags_out = [machine.u.mem_read(machine.q(aggregate + 56) + i * 64, 1)[0] for i in range(count)]
        indices = [machine.q(machine.q(aggregate + 80) + i * 40 + 8) - 0x1000 for i in range(count)]
        stat_count = machine.q(aggregate + 16)
        stats = []
        for i in range(stat_count):
            pointer = machine.q(aggregate + 8) + i * 8
            stats.append([machine.u.mem_read(pointer, 1)[0], struct.unpack('<I', machine.u.mem_read(pointer + 4, 4))[0]])
        fixtures.append(dict(native_inputs_hex=inputs, native_generic_tags=tags_out, native_generic_input_indices=indices,
                             spell_count=machine.q(aggregate + 40), stat_tag_value_bits=stats))
    return fixtures


def generic_slot_resets(machine):
    results = []
    for old in range(7):
        for base in range(7):
            for suffix in range(3):
                total = base + suffix
                game = machine.alloc(0xb00)
                frame = machine.alloc(0x400) + 0x80
                pointers = [machine.alloc(64 * size) for size in (4, 4, 24)]
                for offset, pointer, size in zip((0x68, 0x80, 0x98), pointers, (4, 4, 24)):
                    machine.put(game + offset, 64, pointer, old)
                    for index in range(old):
                        value = struct.pack('<I', index + 101) if size == 4 else struct.pack('<QQQ', 0, 0x100 + index * 4, 0)
                        machine.u.mem_write(pointer + index * size, value)
                machine.put(game + 0x830, total)
                machine.put(frame + 0x178, 0)
                machine.put(frame + 0x188, base)
                stack = machine.S + 0x100008
                machine.put(stack, machine.D)
                for register, value in ((native.UC_X86_REG_RSP, stack), (native.UC_X86_REG_RBP, frame),
                                        (native.UC_X86_REG_RSI, game), (native.UC_X86_REG_R15, base)):
                    machine.u.reg_write(register, value)
                machine.u.emu_start(0x14592d894, 0x14592da81, count=100000)
                assert machine.u.reg_read(native.UC_X86_REG_RIP) == 0x14592da81
                assert [machine.q(game + offset) for offset in (0x78, 0x90, 0xa8)] == [total] * 3
                retained = min(old, base)
                expected = list(range(101, 101 + retained)) + [0] * (total - retained)
                for pointer in pointers[:2]:
                    assert list(struct.unpack('<' + 'I' * total, machine.u.mem_read(pointer, total * 4))) == expected
                expected_nested = [0x100 + i * 4 for i in range(retained)] + [4] * (total - retained)
                assert [machine.q(pointers[2] + i * 24 + 8) for i in range(total)] == expected_nested
                results.append([old, base, suffix, expected, expected_nested])
    source = (ROOT / 'crates/azeroth-survivors-re/src/run_effects/milestones.rs').read_text()
    assert 'slots.truncate(base_count)' in source and 'slots.resize_with(total_count, T::default)' in source
    return dict(native_range=span(0x14592d894, 0x14592da81), cases=len(results),
                arrays=['Game+68/70/78 u32', 'Game+80/88/90 u32', 'Game+98/a0/a8 Vec<f32>'],
                rule='Preserve min(old length,generic talent count), then initialize the entire generic suffix and publish its total length.',
                results_sha256=digest(json.dumps(results, separators=(',', ':')).encode()),
                source='crates/azeroth-survivors-re/src/run_effects/milestones.rs::refresh_slots',
                limits='Synthetic spare capacities avoid allocator-growth branches; borrowed empty nested vectors identify retained slots. No Rust executes.')


def temporary_prefix_resets(machine):
    results = []
    for base in range(7):
        for indices in ([], [0], [6], [0, 2, 1, 5], [5, 0, 6, 1, 2], [1, 1, 0, 7], [(1 << 64) - 1, 0, 6]):
            game = machine.alloc(0xb00)
            pointer = machine.alloc(16 * max(1, len(indices)))
            rows = [struct.pack('<QIf', index, position + 1, position + 10.) for position, index in enumerate(indices)]
            machine.u.mem_write(pointer, b''.join(rows) or bytes(16))
            machine.put(game + 0x58, pointer, len(indices))
            for register, value in ((native.UC_X86_REG_RSI, game), (native.UC_X86_REG_R15, base)):
                machine.u.reg_write(register, value)
            machine.u.emu_start(0x14592da81, 0x14592dab9, count=100000)
            assert machine.u.reg_read(native.UC_X86_REG_RIP) == 0x14592dab9
            expected = [value for index, value in zip(indices, rows) if index < base]
            count = machine.q(game + 0x60)
            assert count == len(expected)
            assert bytes(machine.u.mem_read(pointer, count * 16)) == b''.join(expected)
            results.append([base, indices, digest(b''.join(expected))])
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs').read_text()
    assert '.retain_effect_prefix(base_count)' in source
    assert '.retain_effect_prefix(self.effect_state.equipped.rows.len())' not in source
    return dict(native_ranges=[span(0x14592da81, 0x14592dab9), span(0x14592df8f, 0x14592e03b)],
                cases=len(results), results_sha256=digest(json.dumps(results, separators=(',', ':')).encode()),
                rule='Stable retain effect_index < generic talent count; discard the complete old amulet suffix even when a replacement keeps its numeric index.',
                fixture_layout='16-byte source-index/stacks/expiry records; no active effect or Rust game executes.')


def source_connections():
    owners = {
        'crates/azeroth-survivors-re/src/enemies/waves.rs':
            ['pub enum Pattern { Swarm = 0, Stampede = 1, Wall = 2, Pack = 3 }',
             '[Pattern::Swarm, Pattern::Stampede, Pattern::Wall, Pattern::Pack]',
             '.into_iter().filter(|pattern| *pattern as u8 != self.previous_pattern).collect()',
             'let pattern = patterns[uniform_index(patterns.len(), rng)]',
             'self.previous_pattern = pattern as u8'],
        'crates/azeroth-survivors-re/src/guardians/ai.rs':
            ['pub enum GuardianDecision', 'Idle,', 'Engage,', 'Reset { restored_health: f32 }', 'Combat,'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs':
            ['match guardian.ai.evaluate(', 'GuardianDecision::Idle', 'GuardianDecision::Reset { restored_health }',
             'GuardianDecision::Engage', 'GuardianDecision::Combat'],
        'crates/azeroth-survivors-re/src/run_effects.rs':
            ['pub fn is_generic(&self) -> bool', '!matches!(self.tag(), 30 | 31)',
             'pub spell_rows: Vec<EffectRow>', 'self.rows.clear()', 'self.spell_rows.clear()',
             'for row in inputs', 'self.spell_rows.push(row)', 'self.rows.push(row)',
             'for row in &self.spell_rows', 'matches!(value.bytes[63], 30 | 33)'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs':
            ['let generic_count = effects.iter().filter(|row| row.is_generic()).count()',
             'let base_count = self.effect_state.equipped.generic_talent_count()', 'amulets::Effect::Passive { .. }',
             '.clone_from(&self.effect_state.talent_meter_sources)',
             '.clone_from(&self.effect_state.talent_provenance)',
             'self.effect_state.equipped.rows.len()',
             'run_effects::milestones::refresh_slots('],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/demons.rs':
            ['&self.core.equipped.spell_rows'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs':
            ['let rows = self.core.equipped.rows.clone()', 'for (index, row) in rows.iter().enumerate()',
             'source_words: [1, 0, index as u32, (index as u64 >> 32) as u32]'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics/milestones.rs':
            ['pub(super) fn generic_freecast(', 'Some(key) => self.free_instance(key)',
             'self.core.generic.source = Some(index)',
             'let words = [1, 0, index as u32, (index as u64 >> 32) as u32]',
             'dispatch::cast(&instance, context, &targets, execution, rng, counter, self)',
             'self.core.attribution = original', 'self.core.generic.source = original_source'],
        'crates/azeroth-survivors-re/src/run_effects/actions.rs':
            ['(row.tag() == 26).then(|| Self {', 'key: row.key(8).expect("native timed cast key")',
             'interval_override: row.float(4)'],
        'crates/azeroth-survivors-re/src/run_effects/conditions.rs':
            ['pub fn matches_event(', 'pub fn condition_matches(', 'match self.word(condition_offset)',
             'admitted && self.matches_event(condition_offset + 8, event, definition)'],
        'crates/azeroth-survivors-re/src/run_effects/player_auras.rs':
            ['("Soul Link",0)=>19028', 'row.tag()==253&&row.bytes[63]==31',
             'let alias=|index,kind|player_aura_alias(self.provenance[index],kind)'],
        'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs':
            ['amulets::description_lines(definition, rarity, next_picks)',
             'amulets::description_lines(item.payload, item.rarity, item.picks)'],
    }
    result = []
    for path, snippets in owners.items():
        content = (ROOT / path).read_text()
        assert all(snippet in content for snippet in snippets), path
        result.append(dict(path=path, sha256=file_sha256(ROOT / path), checked_connections=snippets))
    prose = (ROOT / 'crates/azeroth-survivors-re/src/loot_rewards/prose.rs').read_text()
    assert '1 | 7 =>' not in prose
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true', help='Write candidate compact contracts inside ignored runtime')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.112.0' and target['sha256'] == SHA
    machine = native.Machine()
    result = dict(schema_version=1, target={key: target[key] for key in ('version', 'sha256', 'size_bytes')},
                  generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                  closed_return_contract=guardian(machine), fixed_input_contract=wave_filter(machine),
                  equipped_effect_input_contract=effect_inputs(machine),
                  aggregate_order_fixtures=aggregate_order_fixtures(machine),
                  generic_slot_reset_contract=generic_slot_resets(machine),
                  temporary_prefix_reset_contract=temporary_prefix_resets(machine),
                  observed_direct_calls=observed_direct_calls(),
                  mutable_alias_boundaries=mutable_alias_boundaries(machine),
                  contextual_recovery=contexts(), source_connections=source_connections(),
                  return_proof_negative_cases=return_proof_negative_checks(),
                  fixture=dict(path='scripts/native_talent_fixture.py', sha256=file_sha256(ROOT / 'scripts/native_talent_fixture.py'),
                               observed_seams=[hex(address) for address in sorted(machine.seams)]),
                  compilation_run=False, game_process_run=False, native_body_ownership_updated=False, parity_verified=False,
                  limits=['Closed normal-return AL proof and fixed four-byte input route are distinct claims.',
                          'Current original instructions and input/output assertions establish only the described static contracts.',
                          'Generic engine census unknowns are outside this AS repair; other live AS producer/type/alias contracts remain explicit.'])
    if args.stage:
        STAGE.mkdir(parents=True, exist_ok=True)
        (STAGE / 'contracts.json').write_text(json_text(result))
    else:
        assert json.loads((KEPT / 'contracts.json').read_text()) == result, 'Reviewed gameplay frontier contracts differ; use --stage and inspect'
    print('Gameplay frontiers 0.112.0: 355 talent descriptors/429 source payloads, 1121 native rank inputs, 1599 native aggregate rows, 72 selector prefixes, 256 pattern states, 8 guardian cases, 6 negative return-proof cases, 147 slot resets, 49 temporary-prefix compactions and 4952 read-only slice cases pass; wider ownership obligations retained.')


if __name__ == '__main__':
    main()
