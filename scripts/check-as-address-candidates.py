#!/usr/bin/env python3
"""Check the five current code-only address candidates with direct AS context.

Only exact saved candidate/source bytes, two ordinary-enemy HP leaves and their
bounded caller, and three shared support thunks are examined. This does not
start Ghidra, compile Rust, recover generic UI/math systems or run the game.
"""
import argparse
from collections import defaultdict
import gzip
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, load_json, file_sha256, project_path, json_text
from native_residual_summary import residual_summary_path
from native_recovery import f32, bits

GENERATOR = 'scripts/check-as-address-candidates.py'
GENERATOR_SHA256 = file_sha256(ROOT / GENERATOR)
TARGET_SHA256 = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
SOURCE = 'crates/azeroth-survivors-re/src/enemies/scaling.rs'
SOURCE_BODY_SHA256 = '0d7f32357ec1e164c261e96b68e3f725ba0b2068c88abc9f41a56d38f8af4461'
CANDIDATES = {'0x140006ea0', '0x14005b390', '0x14008c5e0', '0x145985db0', '0x145985e00'}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def health_body():
    text = (ROOT/SOURCE).read_text()
    start = text.index('pub fn health_polynomial(')
    cursor = text.index('{', start) + 1
    depth = 1
    while depth:
        depth += (text[cursor] == '{') - (text[cursor] == '}')
        cursor += 1
    return text[start:cursor]


def source_health(minutes, zone_difficulty, flag):
    # Independent scalar-f32 transcription of the reviewed, hash-bound body.
    linear = f32(f32(f32(.1) * minutes) + 1.)
    quadratic = f32(f32(value(0x3d1374bc) * minutes) * minutes)
    partial = f32(quadratic + linear)
    coefficient = value(0x3bc2a455 if flag != 0 else 0x3be6afcd)
    cubic = f32(f32(coefficient * minutes) * minutes)
    cubic = f32(minutes * cubic)
    return f32(f32(cubic + partial) * zone_difficulty)


def value(raw):
    return struct.unpack('<f', struct.pack('<I', raw))[0]


def main():
    import capstone
    import unicorn
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as reg
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', default='docs/analysis/evidence/0.115.0/as-address-candidates.json')
    parser.add_argument('--write', action='store_true', help='Write new evidence under runtime/ for review')
    parser.add_argument('--residual-summary', help='Select a snapshot for a new proof; replay defaults to its retained receipt')
    args = parser.parse_args()
    proof_path = project_path(args.proof)
    require(not args.write or proof_path.is_relative_to(ROOT/'runtime'), 'Fresh evidence must stay in runtime/')
    target = latest_target(verify=True)
    require(target['sha256'] == TARGET_SHA256, 'Selected target differs')
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    dependencies = [dict(path=p, sha256=file_sha256(ROOT/p)) for p in (
        'scripts/coverage_common.py', 'scripts/native_recovery.py', 'scripts/inventory-executable.py',
        'scripts/summarize-native-image.py', 'scripts/native_residual_summary.py')]
    source_body_hash = hashlib.sha256(health_body().encode()).hexdigest()
    require(source_body_hash == SOURCE_BODY_SHA256, 'Reviewed source HP expression changed; review its operation order')
    inputs = []
    def consume(path, digest=None):
        path = project_path(path)
        actual = file_sha256(path)
        require(digest is None or digest == actual, 'Changed input: ' + str(path))
        record = dict(path=path.relative_to(ROOT).as_posix(), sha256=actual)
        inputs.append(record)
        return record
    address_summary_binding = consume('runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/address-leads/summary.json')
    address_summary = load_json(project_path(address_summary_binding['path']))
    require(address_summary['target'] == identity, 'Address candidate target differs')
    consume(address_summary['inventory']['path'], address_summary['inventory']['sha256'])
    address = load_json(project_path(address_summary['inventory']['path']))
    residual_binding = consume(residual_summary_path(proof_path, args.residual_summary))
    residual = load_json(project_path(residual_binding['path']))
    require(residual['target'] == identity, 'Residual target differs')
    diagnostic_binding = residual['artifacts']['diagnostic-sites.jsonl.gz']
    consume(diagnostic_binding['path'], diagnostic_binding['sha256'])
    paths = defaultdict(set)
    with gzip.open(project_path(diagnostic_binding['path']), 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            if row['context'] == 'AS-custom-path' and row['actual_body_owner']:
                paths[row['actual_body_owner']].add(row['path'])
    selected = [row for row in address['code_only_seeds'] if paths[row['source_native_owner']]]
    require({row['site'] for row in selected} == CANDIDATES and len(selected) == 5,
            'Direct AS-context address selection changed')
    census_binding = consume('docs/analysis/coverage/full-image-census.json')
    require(address['source_census'] == census_binding and census_binding in residual['inputs'], 'Address/residual census differs')
    census = load_json(project_path(census_binding['path']))
    require(census['target'] == identity and census['independent_instructions']['exact_source_bytes_verified'], 'Census identity differs')
    body_path = project_path(census['artifacts']['directory'])/'bodies.tsv.gz'
    consume(body_path, census['artifacts']['files']['bodies.tsv.gz']['sha256'])
    helpers = module('as_address_census', 'scripts/summarize-native-image.py')
    owner = helpers.owner_lookup([(int(r['start'], 16), int(r['end'], 16), int(r['entry'], 16))
                                  for r in helpers.rows(body_path) if r['external'] == 'false'])
    pe = module('as_address_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    def raw(address, count):
        first = pe.rva_offset(address-pe.image_base)
        last = pe.rva_offset(address+count-1-pe.image_base)
        require(last-first == count-1, 'Range is not contiguous original file bytes')
        return pe.data[first:first+count]
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    ranges = {}
    def capture(name, start, end):
        data = raw(start, end-start)
        decoded = list(decoder.disasm(data, start))
        require(sum(i.size for i in decoded) == len(data), 'Original range does not decode exactly')
        ranges[name] = dict(start=hex(start), end_exclusive=hex(end), sha256=hashlib.sha256(data).hexdigest(),
                            instruction_count=len(decoded))
        return decoded
    selection = []
    source_owners = {}
    for row in selected:
        site = int(row['site'], 16)
        source = int(row['source_site'], 16)
        require(raw(site, len(bytes.fromhex(row['instruction_bytes']))).hex() == row['instruction_bytes'], 'Candidate bytes differ')
        require(raw(source, len(bytes.fromhex(row['source_instruction_bytes']))).hex() == row['source_instruction_bytes'], 'Source LEA bytes differ')
        require(hex(owner(source)) == row['source_native_owner'], 'Source native owner differs')
        for instruction in row['code_validation']['instructions']:
            require(raw(int(instruction['site'], 16), len(bytes.fromhex(instruction['instruction_bytes']))).hex() == instruction['instruction_bytes'], 'Candidate validation bytes differ')
        selection.append(dict(site=row['site'], source_site=row['source_site'], source_native_owner=row['source_native_owner'],
                              direct_diagnostic_context=sorted(paths[row['source_native_owner']])))
        source_owners[row['source_native_owner']] = source
    constructor = capture('ordinary-constructor', 0x14594df00, 0x14594e874)
    touch = capture('touch-context-owner', 0x14012f990, 0x140133878)
    meter = capture('meter-context-owner', 0x14007f800, 0x140083785)
    for name, start, end in [('nonzero-hp-helper', 0x145985db0, 0x145985df5),
                              ('zero-hp-helper', 0x145985e00, 0x145985e45),
                              ('hp-clock-selection-call', 0x14594e1e6, 0x14594e308),
                              ('hp-post-call-consumer', 0x14594e308, 0x14594e36a),
                              ('hp-percent-product', 0x14594e3de, 0x14594e3e3),
                              ('refcount-release-thunk', 0x140006ea0, 0x140006eaf),
                              ('data-count-forwarding-thunk', 0x14005b390, 0x14005b3a3),
                              ('vector-deallocation-thunk', 0x14008c5e0, 0x14008c5fd)]:
        capture(name, start, end)
    for label, source, instructions in [('refcount-callback-consumer', 0x14012fca3, touch),
                                         ('vector-callback-consumer', 0x1401320d2, touch),
                                         ('format-argument-consumer', 0x14008177e, meter)]:
        index = next(i for i, ins in enumerate(instructions) if ins.address == source)
        capture(label, instructions[index-8].address, instructions[index+12].address)
    constants = {}
    for start in (0x145985db0, 0x145985e00):
        values = []
        for instruction in decoder.disasm(raw(start, 69), start):
            for operand in instruction.operands:
                if operand.type == capstone.x86_const.X86_OP_MEM and operand.mem.base == capstone.x86_const.X86_REG_RIP:
                    address = instruction.address+instruction.size+operand.mem.disp
                    word = struct.unpack('<I', raw(address, 4))[0]
                    values.append(dict(instruction=hex(instruction.address), address=hex(address), bits=word))
        constants[hex(start)] = values
    require([r['bits'] for r in constants['0x145985db0']] == [0x3dcccccd, 0x3f800000, 0x3d1374bc, 0x3bc2a455], 'Nonzero HP coefficients differ')
    require([r['bits'] for r in constants['0x145985e00']] == [0x3dcccccd, 0x3f800000, 0x3d1374bc, 0x3be6afcd], 'Zero HP coefficients differ')
    # The current caller tests all flag bits, then selects the actual callback.
    require(raw(0x14594e261, 7).hex() == '41807d4c007522', 'Nonzero-flag branch differs')
    require(raw(0x14594e2b3, 18).hex() == '488d05f67a0300488d0d3f7b0300480f45c8', 'HP callback selection differs')
    require(raw(0x14594e301, 7).hex() == 'ffd1f3410f59c1', 'Native HP callback consumer differs')
    cases = []
    # Memory and register inputs are synthetic. No arithmetic/call host seam
    # exists inside either HP replay; the native selected helper runs normally.
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    GAME, DEFINITION, ZONE, STACK, STOP = 0x30000000, 0x30003000, 0x30005000, 0x20000000, 0x40000000
    u.mem_map(GAME, 0x10000)
    u.mem_map(STACK, 0x20000)
    u.mem_map(STOP, 4096)
    allowed = []
    stop = STOP
    selected_helper = []
    def missing(machine, access, address, count, value, user):
        require(pe.image_base <= address < 0x149000000, 'Unexpected native memory access')
        page = address & ~4095
        machine.mem_map(page, 4096)
        machine.mem_write(page, raw(page, 4096))
        return True
    def hook(machine, address, count, user):
        if address in (STOP, stop):
            machine.emu_stop()
            return
        require(any(a <= address < b for a, b in allowed), 'Unscoped native instruction: ' + hex(address))
        if address in (0x145985db0, 0x145985e00):
            selected_helper.append(address)
    u.hook_add(UC_HOOK_MEM_UNMAPPED, missing)
    u.hook_add(UC_HOOK_CODE, hook)
    names = ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'RSP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15')
    def reset():
        u.mem_write(GAME, bytes(0x10000))
        u.mem_write(STACK, bytes(0x20000))
        for name in names:
            u.reg_write(getattr(reg, 'UC_X86_REG_'+name), 0)
        for index in range(16):
            u.reg_write(getattr(reg, 'UC_X86_REG_XMM'+str(index)), 0)
        u.reg_write(reg.UC_X86_REG_MXCSR, 0x1f80)
        u.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        u.reg_write(reg.UC_X86_REG_RSP, STACK+0x10008)
        u.mem_write(STACK+0x10008, struct.pack('<Q', STOP))
        selected_helper.clear()
    def putf(address, value):
        u.mem_write(address, struct.pack('<f', value))
    for flag in (0, 1, 2, 3, 128, 255):
        helper = 0x145985db0 if flag != 0 else 0x145985e00
        for minutes in (-1., 0., .1, .9999, 1., 4.5, 16., 20., 30., 60., 120.):
            for difficulty in (0., .4, 1., 1.7, 4.):
                reset()
                minutes, difficulty = f32(minutes), f32(difficulty)
                u.reg_write(reg.UC_X86_REG_XMM0, bits(minutes))
                u.reg_write(reg.UC_X86_REG_XMM1, bits(difficulty))
                allowed = [(helper, helper+69)]
                stop = STOP
                u.emu_start(helper, 0, count=1000)
                actual = u.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
                expected = bits(source_health(minutes, difficulty, flag))
                require(actual == expected and u.reg_read(reg.UC_X86_REG_RIP) == STOP, 'Original HP helper differs from source expression')
                cases.append(dict(kind='hp-helper', flag=flag, minutes_bits=bits(minutes), difficulty_bits=bits(difficulty), helper=hex(helper), native_bits=actual, source_expression_bits=expected))
        for clock in (0., 1., 7.5, 60., 600., 960., 1200., 1800., 3600.):
            for zone_scale in (.4, 1., 2.3):
                for independent_difficulty in (.7, 1.4):
                    reset()
                    clock, zone_scale, independent_difficulty = map(f32, (clock, zone_scale, independent_difficulty))
                    base_hp = f32(11.3 if clock < 1000. else 1000.25)
                    u.reg_write(reg.UC_X86_REG_RSI, GAME)
                    u.reg_write(reg.UC_X86_REG_R13, DEFINITION)
                    u.reg_write(reg.UC_X86_REG_R14, ZONE)
                    u.reg_write(reg.UC_X86_REG_RBP, STACK+0x8000)
                    u.mem_write(DEFINITION+0x4c, bytes([flag]))
                    u.mem_write(GAME+0x2ca, struct.pack('<HHH', 130, 140, 150))
                    putf(GAME+0xb9c, clock)
                    putf(GAME+0xc14, independent_difficulty)
                    putf(ZONE+0xe0, zone_scale)
                    putf(DEFINITION+0x30, base_hp)
                    allowed = [(0x14594e1e6, 0x14594e308), (0x145985db0, 0x145985df5), (0x145985e00, 0x145985e45)]
                    stop = 0x14594e308
                    u.emu_start(0x14594e1e6, 0, count=1000)
                    minutes = f32(clock/60.)
                    zone_difficulty = f32(zone_scale*independent_difficulty)
                    polynomial = source_health(minutes, zone_difficulty, flag)
                    expected = bits(f32(polynomial*f32(base_hp*f32(4.8 if flag != 0 else 4.95))))
                    actual = u.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
                    require(actual == expected and selected_helper == [helper], 'Current caller HP selection/inputs/order differs')
                    cases.append(dict(kind='hp-caller', flag=flag, clock_bits=bits(clock), zone_scale_bits=bits(zone_scale), independent_difficulty_bits=bits(independent_difficulty), base_hp_bits=bits(base_hp), helper=hex(helper), native_bits=actual, source_expression_bits=expected))
    # Support-thunk replays stop at their encoded shared callee or return. The
    # shared destructor/formatter/allocator implementation remains outside scope.
    thunk_cases = []
    for count in (1, 2):
        reset()
        u.reg_write(reg.UC_X86_REG_RCX, GAME)
        u.mem_write(GAME, struct.pack('<Q', DEFINITION))
        u.mem_write(DEFINITION, struct.pack('<Q', count))
        allowed = [(0x140006ea0, 0x140006eaf)]
        stop = 0x14581fb30
        u.emu_start(0x140006ea0, 0, count=100)
        actual_count = struct.unpack('<Q', u.mem_read(DEFINITION, 8))[0]
        expected_exit = stop if count == 1 else STOP
        require(actual_count == count-1 and u.reg_read(reg.UC_X86_REG_RIP) == expected_exit, 'Reference-release thunk differs')
        thunk_cases.append(dict(kind='atomic-reference-release', old_count=count, new_count=actual_count, exit=hex(expected_exit)))
    reset()
    u.reg_write(reg.UC_X86_REG_RCX, GAME)
    u.reg_write(reg.UC_X86_REG_RDX, 0x12345678)
    u.mem_write(GAME, struct.pack('<Q', DEFINITION))
    u.mem_write(DEFINITION+8, struct.pack('<QQ', 0x88776655, 19))
    allowed = [(0x14005b390, 0x14005b3a3)]
    stop = 0x145cfa240
    u.emu_start(0x14005b390, 0, count=100)
    forwarded = [u.reg_read(r) for r in (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8)]
    require(forwarded == [0x88776655, 19, 0x12345678], 'Data/count forwarding thunk differs')
    thunk_cases.append(dict(kind='data-count-forwarding', shared_exit=hex(stop), forwarded_registers=forwarded))
    for count in (0, 3):
        reset()
        u.reg_write(reg.UC_X86_REG_RCX, GAME)
        u.mem_write(GAME+0x18, struct.pack('<QQ', count, DEFINITION))
        allowed = [(0x14008c5e0, 0x14008c5fd)]
        stop = 0x1400021d0
        u.emu_start(0x14008c5e0, 0, count=100)
        expected_exit = stop if count else STOP
        require(u.reg_read(reg.UC_X86_REG_RIP) == expected_exit, 'Vector deallocation thunk exit differs')
        if count:
            require([u.reg_read(r) for r in (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8)] == [DEFINITION, count*16, 8], 'Vector deallocation arguments differ')
        thunk_cases.append(dict(kind='vector-buffer-deallocation', count=count, exit=hex(expected_exit)))
    case_payload = json_text(dict(target=identity, hp_cases=cases, support_thunk_cases=thunk_cases))
    case_path = ROOT/'runtime/analysis/history/findings/q41-as-addresses/e528e90bbac6/native-cases.json'
    case_binding = dict(path=case_path.relative_to(ROOT).as_posix(), sha256=hashlib.sha256(case_payload.encode()).hexdigest())
    record = dict(schema_version=1, target=identity, generator=dict(path=GENERATOR, sha256=GENERATOR_SHA256),
                  tool_versions=dict(capstone=capstone.__version__, unicorn=unicorn.__version__), dependencies=dependencies,
                  inputs=inputs, source_contract=dict(path=SOURCE, function='health_polynomial', body_sha256=SOURCE_BODY_SHA256),
                  exact_direct_AS_context_candidates=selection, ranges=ranges, hp_coefficients=constants,
                  checks=dict(hp_helper_cases=sum(r['kind'] == 'hp-helper' for r in cases), hp_caller_cases=sum(r['kind'] == 'hp-caller' for r in cases), support_thunk_cases=len(thunk_cases)),
                  cases=case_binding, actual_source_defect_found=False,
                  hp_helper_current_source_expression_matches=True, source_semantics_complete=False,
                  global_aliasing_complete=False, gameplay_parity_verified=False,
                  limits=['Current original instructions and immutable constants run with synthetic inputs; no arithmetic or call host seam exists inside the HP helper/caller intervals.',
                          'The caller replay stops after its selected HP helper and base-HP product, before late-zone/endless/percentage/entity-publication behavior. Later arithmetic is retained as static consumer context only.',
                          'The source expression is a reviewed hash-bound scalar-f32 transcription; Rust was neither compiled nor executed.',
                          'Three UI-context code candidates are support thunks. Their shared destructor/formatter/allocator targets and complete UI consumer semantics remain outside scope.',
                          'No native analysis session or application/game launch. Five selected candidates do not establish all enemy/UI/source ownership, changelog completion or original/rebuilt parity.'])
    for binding in inputs+dependencies+[dict(path=GENERATOR, sha256=GENERATOR_SHA256)]:
        require(file_sha256(project_path(binding['path'])) == binding['sha256'], 'Input/generator changed during review')
    require(hashlib.sha256(health_body().encode()).hexdigest() == SOURCE_BODY_SHA256, 'Source expression changed during review')
    if args.write:
        require(not proof_path.exists(), 'Preserve existing proof; use a new output path')
        case_path.parent.mkdir(parents=True, exist_ok=True)
        if case_path.exists():
            require(case_path.read_text() == case_payload, 'Preserve existing differing native cases')
        else:
            case_path.write_text(case_payload)
        proof_path.parent.mkdir(parents=True, exist_ok=True)
        proof_path.write_text(json_text(record))
    else:
        require(load_json(proof_path) == record, 'Retained AS candidate proof differs')
        require(file_sha256(case_path) == case_binding['sha256'], 'Retained native case evidence differs')
    print(f'PASS: five exact AS-context address candidates; {record["checks"]["hp_helper_cases"]} HP helper, {record["checks"]["hp_caller_cases"]} current caller, {len(thunk_cases)} support-thunk native cases. No source defect found; broader parity remains unverified.')


if __name__ == '__main__':
    main()
