#!/usr/bin/env python3
"""Check selected call ownership and the current AS aura-alias boundary.

Only admitted native instructions run in synthetic Unicorn memory. No compiler,
game, OS/DLL code or source-language execution is involved.
"""
import argparse
from collections import Counter, defaultdict
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
KEEP = ROOT / 'docs/analysis/evidence/q41-p01-aura'
WORK = ROOT / 'runtime/analysis/history/findings/q41-p01-aura/ebd7af99df13'
ALIAS, END = 0x14580b380, 0x14580b64e
SOURCE = 'crates/azeroth-survivors-re/src/run_effects/player_auras.rs'
NAMES = ['Flurry', 'Fortified', 'Soul Link', 'Last Stand', 'Cheat Death',
         'Blessed Life', 'Reincarnation', 'Shield Mastery', 'Ardent Defender',
         'Divine Intervention']


def sha(data):
    return hashlib.sha256(data).hexdigest()


def artifact(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': sha(path.read_bytes())}


def derive():
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                   str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('p01_alias_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None
        value = image[offset:offset + count]
        assert len(value) == count
        return value

    def span(role, start, end):
        return {'role': role, 'start': hex(start), 'end_exclusive': hex(end),
                'sha256': sha(raw(start, end - start)), 'size': end - start}

    # Reconstruct all original selected-owner unresolved calls, preserving their
    # observations rather than treating a newly found owner as recovered meaning.
    selected = ROOT / 'docs/analysis/coverage/seeded-census.json'
    census = json.loads(selected.read_text())
    assert census['target']['sha256'] == SHA
    by_target = defaultdict(list)
    no_target = []
    inputs = []
    for mapping in census['mappings']:
        path = ROOT / mapping['retained_observations']['path']
        assert sha(path.read_bytes()) == mapping['retained_observations']['sha256']
        observations = json.loads(path.read_text())['observations']
        outgoing = observations['outgoing']['normalized_result']
        if not outgoing['unresolved_calls']:
            continue
        inputs.append(artifact(path))
        for call in outgoing['unresolved_calls']:
            refs = [ref for ref in outgoing['references']
                    if ref['source_address'] == call['address']]
            assert len(refs) <= 1
            row = {'path': mapping['path'], 'selected_owner': mapping['address'],
                   'source_address': call['address'], 'reason': call['reason']}
            if not refs:
                no_target.append(row)
            else:
                row['observed_target'] = refs[0]['target_address']
                by_target[row['observed_target']].append(row)
    assert len(no_target) == 1 and no_target[0]['source_address'] == '0x1400b718f'
    assert sum(map(len, by_target.values())) == 244 and len(by_target) == 21
    assert [row['source_address'] for row in by_target[hex(ALIAS)]] == [
        '0x1458f365b', '0x1458f369f']
    imports = {int(row['iat_start_address'], 16) + i * 8: (row['library'], name)
               for row in pe.imports() for i, name in enumerate(row['functions'])}
    roles = {
        0x1404f7650: ('AS_legacy_configuration_support', 'home/configuration collector trampoline; see legacy-config report'),
        0x1400021d0: ('shared_runtime_context', 'deallocation trampoline candidate; full allocator semantics not selected'),
        0x145cf9991: ('import_boundary', 'memcmp'),
        0x145cdf070: ('AS_legacy_configuration_support', 'dynamic drop dispatch; concrete trait type remains unclassified'),
        0x140002200: ('shared_runtime_context', 'RET leaf; surrounding allocation-marker meaning is an inference'),
        0x1400021c0: ('shared_runtime_context', 'allocation trampoline candidate; full allocator semantics not selected'),
        0x145cf998b: ('import_boundary', 'memcpy'),
        0x141452c30: ('AS_legacy_configuration_support', 'configuration read trampoline; see legacy-config report'),
        0x1458971e0: ('AS_contract_remaining', 'language index clamped to 13 then 56-byte record selection'),
        0x144bf4410: ('AS_shared_interface_remaining', 'pad UI supporting trampoline; target semantics remain unclassified'),
        0x145827bf0: ('AS_contract_remaining', 'picker equipment-art admission predicate; see picker-equipment-art evidence'),
        0x142674550: ('AS_shared_interface_support', 'image node constructor; see race-portraits evidence'),
        0x145cf9997: ('import_boundary', 'memset'),
        0x145cf999d: ('import_boundary', 'memmove'),
        0x145cf99df: ('import_boundary', 'roundf'),
        ALIAS: ('AS_contract_selected', 'exact provenance-name and kind to spell ID alias'),
        0x145808880: ('AS_contract_remaining_mixed_server_context', 'mode-name parser candidate shared with excluded server owner'),
        0x145cf9a15: ('import_boundary', 'powf'),
        0x145911d50: ('excluded_coop_context', 'party-state exchange candidate; no cooperative gameplay implementation'),
        0x145a3dce0: ('AS_local_auth_support_remaining', 'realmd local-auth/roster supporting trampoline; target semantics unclassified and not selected'),
        0x145a4abe0: ('AS_local_auth_support_remaining', 'realmd local-auth/roster reference-count/drop candidate; target semantics unclassified and not selected'),
    }
    assert set(roles) == {int(address, 16) for address in by_target}
    inventory = []
    for address, rows in sorted(by_target.items(), key=lambda item: int(item[0], 16)):
        start = int(address, 16)
        instruction = next(md.disasm(raw(start, 16), start))
        scope, meaning = roles[start]
        record = {'target': address, 'record_count': len(rows), 'routing_scope': scope,
                  'routing_meaning': meaning, 'first_instruction':
                  f'{instruction.mnemonic} {instruction.op_str}'.strip(),
                  'first_instruction_hex': instruction.bytes.hex(),
                  'selected_owner_contexts': dict(sorted(Counter(row['path'] for row in rows).items()))}
        if scope == 'import_boundary':
            assert instruction.mnemonic == 'jmp' and instruction.size == 6
            slot = start + instruction.size + instruction.operands[0].mem.disp
            library, name = imports[slot]
            assert name == meaning
            record['import'] = {'iat_slot': hex(slot), 'library': library, 'name': name}
        inventory.append(record)

    code = list(md.disasm(raw(ALIAS, END - ALIAS), ALIAS))
    assert sum(ins.size for ins in code) == END - ALIAS == 718
    assembly = '\n'.join(f'{ins.address:x}: {ins.mnemonic} {ins.op_str}'.rstrip()
                         for ins in code) + '\n'
    table = 0x147003d78
    destinations = [table + offset for offset in struct.unpack('<14i', raw(table, 56))]
    assert set(destinations) == {0x14580b39e, 0x14580b3d8, 0x14580b417,
        0x14580b45c, 0x14580b49b, 0x14580b4df, 0x14580b523,
        0x14580b568, 0x14580b5a8, 0x14580b63c}
    defaults = list(struct.unpack('<3I', raw(0x1470035a8, 12)))
    assert defaults == [27779, 26635, 25771]

    # Source inspection interprets only this deliberately simple match. The
    # expected lookup comes from current Rust text, independently of native IDs.
    source_path = ROOT / SOURCE
    source = source_path.read_text()
    match_text = source.split('pub fn player_aura_alias(', 1)[1].split('\n}\n', 1)[0]
    source_named, source_defaults = {}, {}
    for pattern, kind, value in re.findall(r'\(([^,]+),(\d)\)\s*=>\s*(\d+)', match_text):
        if pattern.strip() == '_':
            source_defaults[int(kind)] = int(value)
        else:
            names = re.findall(r'"([^"]+)"', pattern)
            assert names
            for name in names:
                source_named[name.encode(), int(kind)] = int(value)
    assert set(name.decode() for name, _ in source_named) == set(NAMES)
    assert source_defaults == dict(enumerate(defaults))
    assert len(source_named) == 11

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(section['rva'] + max(section['raw_size'], section['virtual_size'])
               for section in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'],
                    image[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x10000)
    u.mem_map(stack, 0x20000)
    u.mem_map(done, 4096)
    admitted = [(ALIAS, END), (0x1458f5b9e, 0x1458f5be2),
                (0x1458e9520, 0x1458e9680)]
    reached = set()
    reserve_calls = 0
    def hook(_u, address, count, _data):
        nonlocal reserve_calls
        if address == 0x145cfa1c0:
            # Explicit vector-reserve seam only. The native index selector and
            # its writes execute; the generic allocator is outside AS scope.
            reserve_calls += 1
            descriptor = u.reg_read(r.UC_X86_REG_RCX)
            u.mem_write(descriptor, struct.pack('<QQ', 64, heap + 0x6000))
            sp = u.reg_read(r.UC_X86_REG_RSP)
            ret = struct.unpack('<Q', u.mem_read(sp, 8))[0]
            u.reg_write(r.UC_X86_REG_RIP, ret)
            u.reg_write(r.UC_X86_REG_RSP, sp + 8)
            return
        assert any(first <= address and address + count <= last for first, last in admitted), hex(address)
        reached.add(address)
    u.hook_add(UC_HOOK_CODE, hook)
    def native_alias(encoded, kind, pointer=None):
        pointer = heap if pointer is None else pointer
        if encoded:
            u.mem_write(pointer, encoded)
        u.mem_write(stack + 0x10000, struct.pack('<Q', done))
        for register, value in [(r.UC_X86_REG_RSP, stack + 0x10000),
                                (r.UC_X86_REG_RCX, pointer), (r.UC_X86_REG_RDX, len(encoded)),
                                (r.UC_X86_REG_R8, kind)]:
            u.reg_write(register, value)
        u.emu_start(ALIAS, done, count=1000)
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        return u.reg_read(r.UC_X86_REG_EAX)

    names = {b'', b'Other', b'Soul link', b'soul_link', 'Flurr\u00fd'.encode(),
             b'Divine Intervention\0', b'An unknown provenance name'}
    for name in NAMES:
        encoded = name.encode()
        names.update([encoded, encoded.lower(), encoded.upper(), b' ' + encoded, encoded + b' '])
        names.update(encoded[:i] for i in range(len(encoded)))
        for index in range(len(encoded)):
            names.add(encoded[:index] + bytes([encoded[index] ^ 1]) + encoded[index + 1:])
    names.update(b'?' * count for count in range(65))
    vectors = []
    named_cases = []
    for encoded in sorted(names):
        for kind in range(3):
            actual = native_alias(encoded, kind)
            expected = source_named.get((encoded, kind), source_defaults[kind])
            assert actual == expected, (encoded, kind, actual, expected)
            vectors.append([encoded.hex(), kind, actual])
            if encoded.decode(errors='replace') in NAMES:
                named_cases.append({'name': encoded.decode(), 'kind': kind, 'spell_id': actual})
    # Empty input is never dereferenced; native callers use dangling pointer1.
    assert [native_alias(b'', kind, pointer=1) for kind in range(3)] == defaults

    # Current live publisher selects valid provenance40-byte records, defaults
    # absent/out-of-range names, and forwards the exact index-kind byte. Execute
    # through the real CALL and callee, stopping immediately after its return.
    row, vector, frame = heap + 0x1000, heap + 0x2000, stack + 0x8000
    provenance_cases = []
    for kind in range(3):
        for pointer_present, index, count in [(False, 0, 1), (True, 0, 0),
                                               (True, 1, 1), (True, 0, 1)]:
            encoded = b'Flurry'
            u.mem_write(heap, encoded)
            u.mem_write(vector, bytes(80))
            u.mem_write(vector + 8, struct.pack('<QQ', heap, len(encoded)))
            u.mem_write(row, struct.pack('<QB7x', index, kind))
            u.mem_write(frame + 0x20, struct.pack('<Q', count))
            u.reg_write(r.UC_X86_REG_RBP, frame)
            u.reg_write(r.UC_X86_REG_RDI, vector if pointer_present else 0)
            u.reg_write(r.UC_X86_REG_R15, row)
            u.reg_write(r.UC_X86_REG_RSP, stack + 0x10000)
            u.emu_start(0x1458f5b9e, 0x1458f5be2, count=1000)
            assert u.reg_read(r.UC_X86_REG_RIP) == 0x1458f5be2
            actual = u.reg_read(r.UC_X86_REG_EAX)
            assert u.reg_read(r.UC_X86_REG_R12D) == actual
            selected_name = encoded if pointer_present and index < count else b''
            assert actual == source_named.get((selected_name, kind), source_defaults[kind])
            provenance_cases.append({'pointer_present': pointer_present, 'index': index,
                                     'count': count, 'kind': kind, 'spell_id': actual})

    index_cases = []
    tag_vectors = [[tag] for tag in range(36)] + [[], [255], [31, 18], [18, 31],
        [20, 31], [31, 20], [29, 30, 31, 33], [15, 31, 19, 20, 18, 15],
        [19, 15], [15, 15], [0, 18, 20, 31], [31, 31], [20, 18, 31, 19, 19, 15]]
    output, effects = heap + 0x3000, heap + 0x4000
    for tags in tag_vectors:
        u.mem_write(effects, b''.join(bytes([tag]) + bytes(63) for tag in tags) or b'\0')
        u.mem_write(stack + 0x10000, struct.pack('<Q', done))
        for register, value in [(r.UC_X86_REG_RSP, stack + 0x10000),
                                (r.UC_X86_REG_RCX, output), (r.UC_X86_REG_RDX, effects),
                                (r.UC_X86_REG_R8, len(tags))]:
            u.reg_write(register, value)
        u.emu_start(0x1458e9520, done, count=10000)
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        _, pointer, count = struct.unpack('<3Q', u.mem_read(output, 24))
        actual = [[struct.unpack('<Q', u.mem_read(pointer + i * 16, 8))[0],
                   u.mem_read(pointer + i * 16 + 8, 1)[0]] for i in range(count)]
        expected = []
        first_shield = next((i for i, tag in enumerate(tags) if tag in [18, 20, 31]), None)
        first_rescue = next((i for i, tag in enumerate(tags) if tag == 19), None)
        if first_shield is not None:
            expected.append([first_shield, 0])
        if first_rescue is not None:
            expected.append([first_rescue, 2])
        expected.extend([i, 1] for i, tag in enumerate(tags) if tag == 15)
        assert actual == expected, (tags, actual, expected)
        index_cases.append({'native_generic_tags': tags, 'index_kind_pairs': actual})

    observations, actual_bodies = [], {}
    for directory in ['rea-bounded', 'rea-consumer']:
        run = json.loads((WORK / directory / 'run.json').read_text())
        assert run['failure'] is None and not run['operation_errors']
        for path in sorted((WORK / directory).glob('0*.json')):
            ev = json.loads(path.read_text()).get('response', {}).get('result', {}).get('structuredContent', {})
            if ev.get('operation') not in ['procedure_info', 'read_function_instructions',
                                            'procedure_pseudo_code', 'procedure_references']:
                continue
            assert ev['subject']['digest']['sha256'] == SHA
            if ev['operation'] == 'procedure_info' and ev['parameters']['procedure'] == hex(ALIAS):
                assert ev['normalized_result']['body']['ranges'] == [
                    {'start': hex(ALIAS), 'end': hex(END - 1)}]
            if ev['operation'] == 'procedure_info':
                actual_bodies[ev['parameters']['procedure']] = ev['normalized_result']['body']
            observations.append({'artifact': artifact(path), 'evidence_id': ev['evidence_id'],
                'operation': ev['operation'], 'parameters': ev['parameters'],
                'profile_digest': ev['analysis_profile']['digest']})
    assert len(observations) == 14
    source_anchors = {
        'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs': [
            'talent.name.as_str(),', 'definition.name.as_str(),',
            'provenance: &self.effect_state.provenance,', '.publish(PlayerAuraInputs {',
            'self.events.push(RunEvent::Aura {'],
        SOURCE: ['let alias=|index,kind|player_aura_alias(self.provenance[index],kind);',
                 'spell_id:alias(index,0)', 'spell_id:alias(index,1)', 'spell_id:alias(index,2)',
                 'self.effects.iter().position(|row|matches!(row.tag(),18|20)',
                 'self.effects.iter().position(|row|row.tag()==19)',
                 'self.effects.iter().enumerate().filter(|(_,row)|row.tag()==15)',
                 'fields.push((47+index as u16,id));'],
        'crates/azeroth-survivors-re/src/gameplay/client/events.rs': [
            'RunEvent::Aura { target,fields,.. }=>{',
            'SessionEvent::ObjectValues { guid:target,fields:ObjectFields::from_pairs(&fields) }'],
    }
    for path, anchors in source_anchors.items():
        text = (ROOT / path).read_text()
        for anchor in anchors:
            assert anchor in text, (path, anchor)
    result = {
        'target': {'version': target['version'], 'path': target['path'], 'sha256': SHA},
        'lead': 'Q41-P01', 'gap': 41,
        'selected_contract': 'AS provenance-name/kind spell-ID aliases shared by aura descriptors and player fields',
        'selector': {'input': artifact(selected), 'procedure_inputs': inputs,
                     'original_unresolved_records': 245, 'already_classified_external_calls': 1,
                     'remaining_original_records': 244, 'unique_static_target_addresses': 21},
        'target_routing': inventory,
        'selected_original_calls': by_target[hex(ALIAS)],
        'ranges': [span('alias actual body', ALIAS, END),
                   span('alias guarded offset table', table, table + 56),
                   span('alias kind fallback table', 0x1470035a8, 0x1470035b4),
                   span('selected descriptor caller arguments', 0x1458f3631, 0x1458f36aa),
                   span('field publisher provenance selector', 0x1458f5b9e, 0x1458f5be2),
                   span('index-kind producer', 0x1458e9520, 0x1458e9680)],
        'guarded_table': {'base': hex(table), 'length_bias': 6, 'unsigned_max_index': 13,
                          'destinations': list(map(hex, destinations))},
        'kind_defaults': defaults, 'named_cases': named_cases,
        'actual_ghidra_bodies': actual_bodies,
        'static_replay': {'alias_cases': len(vectors), 'vector_sha256': sha(json.dumps(vectors, separators=(',', ':')).encode()),
                          'publisher_provenance_cases': provenance_cases,
                          'index_kind_cases': index_cases, 'vector_reserve_seam_calls': reserve_calls,
                          'admitted_native_ranges': [[hex(a), hex(b)] for a, b in admitted],
                          'instruction_addresses_reached': len(reached),
                          'valid_kind_domain': [0, 1, 2],
                          'external_seams': [{'address': '0x145cfa1c0',
                              'role': 'vector reserve only; supplies capacity64 and synthetic allocation'}]},
        'source': [artifact(ROOT / path) for path in source_anchors],
        'source_change_required': False,
        'rea': {'plans': [artifact(WORK / 'rea.plan.json'), artifact(WORK / 'consumer.plan.json')],
                'observations': observations},
        'limits': [
            'Original unresolved counts are preserved; routing labels do not recover the semantics of every selected-owner call.',
            'Only the selected alias contract is revalidated; other AS contracts and generic engine internals remain separate.',
            'Descriptor assembly, complete producer composition and full publication flow were inspected but not executed end to end.',
            'Native kind values outside0..2 index beyond the three-value fallback table; no valid-AS contract is asserted there.',
            'Synthetic instruction replay and source anchors do not compile or execute Rust and do not establish runtime or visual parity.',
        ],
    }
    return result, assembly


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    result, assembly = derive()
    result['checker'] = artifact(ROOT / 'scripts/check-q41-p01-aura.py')
    text = json.dumps(result, indent=2, ensure_ascii=False) + '\n'
    if args.write:
        KEEP.mkdir(parents=True, exist_ok=True)
        (KEEP / 'manifest.json').write_text(text)
        (KEEP / 'alias.asm').write_text(assembly)
    else:
        assert (KEEP / 'manifest.json').read_text() == text, 'Current proof differs from retained manifest'
        assert (KEEP / 'alias.asm').read_text() == assembly, 'Alias instruction extract differs'
    print(f"Q41-P01 aura:245 original calls;244 records/21 target addresses routed; "
          f"{result['static_replay']['alias_cases']} alias,12 provenance and"
          f"{len(result['static_replay']['index_kind_cases'])} index cases match source; runtime/parity unverified")


if __name__ == '__main__':
    main()
