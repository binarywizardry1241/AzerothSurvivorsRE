#!/usr/bin/env python3
"""Replay current lazy locale loading branches without compiling or launching a game.

Original loader/initializer instructions execute with explicit synthetic path,
UTF-8 read, parser-result, HashMap, allocator, byte-copy and diagnostic seams.
The custom JSON parser is independently checked by recover-locale-parser.py.
--collect stages compact output in runtime; --check verifies retained evidence.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b'
WORK = ROOT / 'runtime/analysis/history/interface/locale-overrides/f85c9ec06bba'
RETAINED = ROOT / 'docs/analysis/evidence/0.108.0/localization-overrides'
RANGES = {
    'loader': (0x1458E4B30, 0x1458E527E),
    'initializer': (0x1459CAEA0, 0x1459CB26C),
    'lazy-thunk': (0x145D7837E, 0x145D783D4),
    'lazy-callback': (0x1458E1C60, 0x1458E1D1B),
    'executable-path': (0x145BACBE0, 0x145BACBFD),
    'windows-executable-path': (0x145BB39E0, 0x145BB3C88),
    'path-parent': (0x145B9F6D0, 0x145B9F7FC),
    'path-copy': (0x145BC4E10, 0x145BC4E89),
    'path-join': (0x145B9F5A0, 0x145B9F5FA),
    'base-directory': (0x1458E8400, 0x1458E85E8),
    'utf8-file-read': (0x145BB5AF0, 0x145BB5CCA),
    'entries-to-map': (0x145999230, 0x145999334),
    'map-insert': (0x14599A6D0, 0x14599A953),
    'stderr-diagnostic': (0x145BAEDF0, 0x145BAEE99),
}


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--collect', action='store_true')
    mode.add_argument('--check', action='store_true')
    mode.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    require(target['version'] == '0.108.0' and target['sha256'] == SHA,
            'Selected target changed; independent recovery required')
    data = target_bytes(target)
    pe_module = load_script('native_pe', ROOT / 'scripts/inventory-executable.py')
    pe = pe_module.PE(data)

    def blob(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        result = data[offset:offset + count]
        require(len(result) == count, 'Incomplete PE range')
        return result

    ranges = {name: dict(start=hex(a), end_exclusive=hex(b), byte_count=b - a,
                        file_offset=hex(pe.rva_offset(a - pe.image_base)),
                        sha256=hashlib.sha256(blob(a, b - a)).hexdigest())
              for name, (a, b) in RANGES.items()}
    data_ranges = {}
    for name, address, count in [('lazy-vtable', 0x146BEA988, 40),
                                 ('filename-format', 0x146BEB1C1, 7),
                                 ('language-subdirectory', 0x146BEB1C9, 4),
                                 ('diagnostic-stream', 0x14722E5A6, 6)]:
        data_ranges[name] = dict(address=hex(address), byte_count=count,
                                 file_offset=hex(pe.rva_offset(address - pe.image_base)),
                                 sha256=hashlib.sha256(blob(address, count)).hexdigest())
    require(struct.unpack('<QQ', blob(0x146BEA9A0, 16)) == (RANGES['lazy-callback'][0],) * 2,
            'Lazy vtable callback changed')
    if args.prepare_rea:
        # A new output leaf permits repeatable independent recovery without
        # overwriting the earlier bounded Ghidra session.
        directory = WORK / 'rea-reproduction'
        directory.mkdir(parents=True, exist_ok=True)
        for name in ('loader', 'initializer', 'lazy-thunk', 'lazy-callback'):
            a, b = RANGES[name]
            binary = directory / (name + '.bin')
            binary.write_bytes(blob(a, b - a))
            plan = dict(target=str(binary.relative_to(ROOT)),
                        output=str((directory / ('rea-' + name)).relative_to(ROOT)),
                        init_timeout=60, timeout=240,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))])
            (directory / (name + '-plan.json')).write_text(encoded(plan))
        print('Prepared bounded Ghidra plans:', directory.relative_to(ROOT))
        return
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        at, count = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[at:at + count])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x800000)
    machine.mem_map(stack, 0x200000)
    machine.mem_map(done, 4096)
    state = {}
    maps = {}
    instruction_count = 0

    def get(name):
        return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))

    def setreg(name, value):
        machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def q(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack('<' + 'Q' * len(values),
                                             *(v & ((1 << 64) - 1) for v in values)))

    def allocate(count):
        require(0 <= count <= 0x200000, 'Unexpected fixture allocation')
        address = state['cursor']
        state['cursor'] += (count + 31) & ~15
        require(state['cursor'] < heap + 0x800000, 'Fixture heap exhausted')
        return address

    def string(value):
        raw = value.encode('utf-8')
        address = allocate(len(raw))
        if raw:
            machine.mem_write(address, raw)
        return address, len(raw)

    def text(address, count):
        require(count <= 0x100000, 'Unexpected fixture string')
        return bytes(machine.mem_read(address, count)).decode('utf-8')

    def owned(out, value, path=False):
        address, count = string(value)
        put(out, count, address, count)
        if path:
            put(out + 24, 0)

    def entries(pairs):
        address = allocate(48 * len(pairs))
        for n, (key, value) in enumerate(pairs):
            kp, kn = string(key)
            vp, vn = string(value)
            put(address + 48 * n, kn, kp, kn, vn, vp, vn)
        return address, len(pairs)

    def parsed(out, pairs):
        if pairs is None:
            address, count = string('fixture parser error')
            put(out, 1, count, address, count)
        else:
            address, count = entries(pairs)
            put(out, 0, count, address, count)

    def grow(vector, width, additional=1):
        old_cap, old_ptr, length = q(vector), q(vector + 8), q(vector + 16)
        capacity = max(4, old_cap * 2, length + additional)
        pointer = allocate(capacity * width)
        if length:
            machine.mem_write(pointer, bytes(machine.mem_read(old_ptr, length * width)))
        put(vector, capacity, pointer, length)

    def ret():
        sp = get('RSP')
        setreg('RIP', q(sp))
        setreg('RSP', sp + 8)

    admitted = [RANGES[name] for name in ('loader', 'initializer', 'lazy-callback', 'map-insert')]

    def hook(_, pc, size, __):
        nonlocal instruction_count
        instruction_count += 1
        if pc == done:
            machine.emu_stop()
            return
        rcx, rdx, r8, r9 = [get(name) for name in ('RCX', 'RDX', 'R8', 'R9')]
        caller = q(get('RSP'))
        if pc == 0x145BC5690:  # native formatting; only selected callsites admitted
            if caller == 0x1458E4B91:
                pair = q(r8)
                owned(rcx, text(q(pair), q(pair + 8)) + '.json')
            elif caller in (0x1458E4FE6, 0x1459CAFE9):
                owned(rcx, 'fixture diagnostic')
            else:
                raise AssertionError(f'Unreviewed formatter caller {caller:#x}')
        elif pc == 0x145BACBE0:  # current_exe: fixture result, no OS call
            if state['executable'] is None:
                put(rcx, -1, 0)
            else:
                owned(rcx, state['executable'], True)
        elif pc == 0x145B9F6D0:  # Path::parent of supplied fixture executable
            value = text(rcx, rdx)
            require(value == state['executable'], 'Unexpected parent argument')
            parent = state['executable_parent']
            if parent is None:
                setreg('RAX', 0)
                setreg('RDX', 0)
            else:
                pointer, count = string(parent)
                setreg('RAX', pointer)
                setreg('RDX', count)
        elif pc == 0x145BC4E10:  # owned PathBuf from fixture slice
            owned(rcx, text(rdx, r8), True)
        elif pc == 0x1458E8400:  # separately recovered native base directory
            if state['base'] is None:
                put(rcx, -1, 0, 0, 0)
            else:
                owned(rcx, state['base'], True)
        elif pc == 0x145B9F5A0:  # Path::join at both reviewed loader sites
            suffix = text(r9, q(get('RSP') + 0x28))
            base = text(rdx, r8)
            owned(rcx, base.rstrip('/') + '/' + suffix, True)
        elif pc == 0x145BB5AF0:  # read_to_string fixture; invalid UTF-8 is an error
            path = text(rdx, r8)
            state['reads'].append(path)
            payload = state['files'].get(path)
            if payload is None:
                put(rcx, -1, 0)
            else:
                owned(rcx, payload)
        elif pc == 0x1458E6A10:  # declared parser-result seam; parser replay is separate
            payload = text(rdx, r8)
            if payload in state['parse']:
                pairs = state['parse'][payload]
            else:
                require(state['worker'], 'Unexpected loader parser input')
                code = state['locale_codes'][state['embedded_index']]
                state['embedded_index'] += 1
                pairs = state['embedded'][code]
            state['parsed'].append(payload if payload in state['parse'] else '<embedded fixture>')
            parsed(rcx, pairs)
        elif pc == 0x145999230:  # Vec<(String,String)> to fixture HashMap
            start, end = q(rdx), q(rdx + 24)
            result = {}
            for address in range(start, end, 48):
                result[text(q(address + 8), q(address + 16))] = text(q(address + 32), q(address + 40))
            token = allocate(16)
            maps[token] = result
            put(rcx, token, 0, 0, len(result), 0, 0)
        elif pc == 0x14599A6D0:  # HashMap::insert: native caller controls ordered key/value input
            if state.get('native_map'):
                return
            token = q(rcx)
            key = text(q(rdx + 8), q(rdx + 16))
            value = text(r8, r9)
            state['inserts'].append([key, value])
            maps[token][key] = value
            put(rcx + 24, len(maps[token]))
        elif pc == 0x140017260:  # deterministic hash for original map insertion probe
            require(state.get('native_map'), 'Unexpected native hash caller')
            setreg('RAX', 0)
        elif pc == 0x145BF2947:
            require(state.get('native_map'), 'Unexpected native compare caller')
            equal = bytes(machine.mem_read(rcx, r8)) == bytes(machine.mem_read(rdx, r8))
            setreg('RAX', int(not equal))
        elif pc == 0x145BF4EE0:
            grow(rcx, 32)
        elif pc == 0x145BF4A90:
            require(q(get('RSP') + 0x28) == 48, 'Unexpected reserve element width')
            grow(rcx, 48, r8)
        elif pc == 0x1400021C0:
            setreg('RAX', allocate(rcx))
        elif pc == 0x1400021E0:
            pointer = allocate(r9)
            machine.mem_write(pointer, bytes(machine.mem_read(rcx, min(rdx, r9))))
            setreg('RAX', pointer)
        elif pc in (0x140002200, 0x1400021D0, 0x145BD8020):
            pass
        elif pc == 0x145BF293B:
            if r8:
                machine.mem_write(rcx, bytes(machine.mem_read(rdx, r8)))
            setreg('RAX', rcx)
        elif pc == 0x145BAEDF0:
            state['diagnostics'] += 1
        elif any(a <= pc < b for a, b in admitted):
            return
        else:
            raise AssertionError(f'Unreviewed native instruction/callee {pc:#x}, caller {caller:#x}')
        ret()

    machine.hook_add(UC_HOOK_CODE, hook)
    vectors = []
    cases = [
        dict(name='both-roots-merge', executable='/fixture/exe/game.exe', base='/fixture/save',
             files={'/fixture/exe/lang/de.json': 'exe', '/fixture/save/lang/de.json': 'save'},
             parse={'exe': [('same', 'exe'), ('extra', 'new')], 'save': [('same', 'save'), ('empty', '')]},
             expected=[('same', 'exe'), ('extra', 'new'), ('same', 'save'), ('empty', '')], diagnostics=0),
        dict(name='empty-map-preserves', files={'/fixture/exe/lang/de.json': 'empty'},
             parse={'empty': []}, expected=[], diagnostics=0),
        dict(name='first-parse-error-second-valid', files={'/fixture/exe/lang/de.json': 'bad', '/fixture/save/lang/de.json': 'save'},
             parse={'bad': None, 'save': [('same', 'save')]}, expected=[('same', 'save')], diagnostics=1),
        dict(name='second-parse-error-preserves-first', files={'/fixture/exe/lang/de.json': 'exe', '/fixture/save/lang/de.json': 'bad'},
             parse={'exe': [('same', 'exe')], 'bad': None}, expected=[('same', 'exe')], diagnostics=1),
        dict(name='read-errors-ignored', files={}, parse={}, expected=[], diagnostics=0),
        dict(name='no-executable-save-only', executable=None, files={'/fixture/save/lang/de.json': 'save'},
             parse={'save': [('same', 'save')]}, expected=[('same', 'save')], diagnostics=0),
        dict(name='no-executable-parent-save-only', executable='/', executable_parent=None,
             files={'/fixture/save/lang/de.json': 'save'},
             parse={'save': [('same', 'save')]}, expected=[('same', 'save')], diagnostics=0),
        dict(name='no-save-executable-only', base=None, files={'/fixture/exe/lang/de.json': 'exe'},
             parse={'exe': [('same', 'exe')]}, expected=[('same', 'exe')], diagnostics=0),
        dict(name='no-roots', executable=None, base=None, files={}, parse={}, expected=[], diagnostics=0),
        dict(name='duplicate-roots-retain-order', base='/fixture/exe', files={'/fixture/exe/lang/de.json': 'exe'},
             parse={'exe': [('same', 'exe')]}, expected=[('same', 'exe'), ('same', 'exe')], diagnostics=0),
    ]
    for case in cases:
        state.clear()
        state.update(cursor=heap + 0x10000, executable=case.get('executable', '/fixture/exe/game.exe'),
                     executable_parent=case.get('executable_parent', '/fixture/exe'),
                     base=case.get('base', '/fixture/save'), files=case['files'], parse=case['parse'],
                     reads=[], parsed=[], inserts=[], diagnostics=0, worker=False)
        output = heap + 0x1000
        pointer, count = string('de')
        sp = stack + 0x1F0000 - 8
        put(sp, done)
        setreg('RSP', sp)
        setreg('RCX', output)
        setreg('RDX', pointer)
        setreg('R8', count)
        machine.emu_start(RANGES['loader'][0], 0, count=100000)
        require(get('RIP') == done, case['name'] + ' did not complete')
        got = []
        for address in range(q(output + 8), q(output + 8) + q(output + 16) * 48, 48):
            got.append((text(q(address + 8), q(address + 16)), text(q(address + 32), q(address + 40))))
        require(got == case['expected'] and state['diagnostics'] == case['diagnostics'], case['name'])
        vectors.append(dict(name=case['name'], reads=state['reads'], entries=got,
                            parse_diagnostics=state['diagnostics']))

    # Execute the real lazy callback and its real worker over all fourteen native
    # descriptors. Only parser results/HashMap storage are fixtures; descriptor
    # count, call order, per-locale root reads and merge loops remain native.
    state.clear()
    codes = ['en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru', 'uk', 'zh', 'ja', 'ko']
    state.update(cursor=heap + 0x10000, executable='/fixture/exe/game.exe', base='/fixture/save',
                 executable_parent='/fixture/exe',
                 files={'/fixture/exe/lang/de.json': 'exe', '/fixture/save/lang/de.json': 'save'},
                 parse={'exe': [('same', 'exe'), ('unknown', 'added')], 'save': [('same', 'save'), ('blank', '')]},
                 reads=[], parsed=[], inserts=[], diagnostics=0, worker=True, embedded_index=0,
                 locale_codes=codes, embedded={code: [('same', code), ('kept', 'embedded')] for code in codes})
    output = heap + 0x1000
    closure = heap + 0x1100
    outer = heap + 0x1200
    put(outer, closure)
    put(closure, output)
    sp = stack + 0x1F0000 - 8
    put(sp, done)
    setreg('RSP', sp)
    setreg('RCX', outer)
    machine.emu_start(RANGES['lazy-callback'][0], 0, count=200000)
    require(get('RIP') == done and q(output + 16) == 14 and state['embedded_index'] == 14,
            'Lazy callback did not initialize fourteen maps')
    produced = {code: maps[q(q(output + 8) + index * 48)] for index, code in enumerate(codes)}
    require(produced['de'] == {'same': 'save', 'kept': 'embedded', 'unknown': 'added', 'blank': ''},
            'Per-key overrides did not merge in recovered order')
    require(produced['en'] == {'same': 'en', 'kept': 'embedded'}, 'Another locale was modified')
    require(state['reads'] == [f'/fixture/{root}/lang/{code}.json' for code in codes for root in ('exe', 'save')],
            'Lazy callback locale/root order changed')
    vectors.append(dict(name='fourteen-descriptor-lazy-initialization', reads=state['reads'],
                        locale_order=codes, catalogs=produced, ordered_inserts=state['inserts']))

    # Independently execute the real HashMap insert probe/stores. A synthetic
    # bucket table and constant hash avoid substituting the overwrite operation
    # whose behavior determines external precedence.
    state.clear()
    state.update(cursor=heap + 0x10000, native_map=True)
    native_map, controls = heap + 0x2000, heap + 0x4000
    machine.mem_write(controls, b'\x00\x00' + b'\xff' * 30)
    put(native_map, controls, 15, 12, 2, 0, 0)
    for index, (key, value) in enumerate([('same', 'embedded'), ('kept', 'untouched')]):
        kp, kn = string(key)
        vp, vn = string(value)
        put(controls - 40 * (index + 1), kn, kp, kn, vp, vn)
    inserted = []
    for key, value, previous in [('same', 'override', 'embedded'),
                                 ('added', 'new', None), ('same', '', 'override')]:
        key_pointer, key_count = string(key)
        value_pointer, value_count = string(value)
        key_owned = allocate(24)
        put(key_owned, key_count, key_pointer, key_count)
        sp = stack + 0x1F0000 - 8
        put(sp, done)
        for name, val in [('RSP', sp), ('RCX', native_map), ('RDX', key_owned),
                          ('R8', value_pointer), ('R9', value_count)]:
            setreg(name, val)
        machine.emu_start(RANGES['map-insert'][0], 0, count=10000)
        require(get('RIP') == done, 'Native map insertion did not return')
        observed = text(get('RAX'), get('RDX')) if get('RAX') else None
        require(observed == previous, 'Native map insertion returned a different previous value')
        inserted.append(dict(key=key, value=value, previous=observed))
    final_map = {}
    for index in range(16):
        if machine.mem_read(controls + index, 1)[0] < 0x80:
            address = controls - 40 * (index + 1)
            final_map[text(q(address + 8), q(address + 16))] = text(q(address + 24), q(address + 32))
    require(final_map == {'same': '', 'kept': 'untouched', 'added': 'new'} and q(native_map + 24) == 3,
            'Native HashMap merge/overwrite semantics differ')
    vectors.append(dict(name='native-map-insert-overwrite-empty-value', inserts=inserted, result=final_map))
    manifest = dict(target={k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}, ranges=ranges,
                    data_ranges=data_ranges,
                    evidence_ids=dict(loader='ev_7ee9363bd2e7b42bcce8d7e73783ab7c3128048d55868a82afed4469b475d2b4',
                                      initializer='ev_8c76c3328d1ed7514b80f3950c1a467154563344677716a53a04601b76d31d8a'),
                    method='REA/Ghidra raw-range pseudocode plus unchanged original-instruction replay at declared fixture seams.',
                    seams=['Native path acquisition, parent/copy/join and UTF-8 reads return synthetic results; no OS calls or player files.',
                           'Native custom parser returns explicit fixture key/value vectors or errors; its full instruction replay is separately owned.',
                           'Initializer HashMap conversion/insertion use synthetic storage; original initializer determines all input/order and empty/error branches.',
                           'A separate original HashMap insertion replay uses synthetic buckets, constant hash and byte-comparison seam; actual overwrite/new-key/empty-value stores execute.',
                           'Allocation/reallocation/growth/free, byte copying and diagnostics are scratch-memory seams.'],
                    limits=['No compilation, Rust execution, game launch, original/rebuilt comparison, disk reads through native helpers or rendering.',
                            'Raw Ghidra imports omit original external memory/callees and infer generic ABI; original PE instructions govern.',
                            'Native parser semantics are independently covered by recover-locale-parser.py.'])
    result = dict(target_sha256=SHA, vector_count=len(vectors), executed_instructions=instruction_count, vectors=vectors)
    WORK.mkdir(parents=True, exist_ok=True)
    if args.collect:
        (WORK / 'loader-manifest.json').write_text(encoded(manifest))
        (WORK / 'loader-vectors.json').write_text(encoded(result))
    else:
        require(json.loads((RETAINED / 'loader-manifest.json').read_text()) == manifest, 'Retained loader manifest differs')
        require(json.loads((RETAINED / 'loader-vectors.json').read_text()) == json.loads(encoded(result)),
                'Retained loader vectors differ')
        extracts = json.loads((RETAINED / 'extracts.json').read_text())
        require(extracts['target']['sha256'] == SHA, 'Extract index target differs')
        for role, row in extracts['extracts'].items():
            start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
            require(hashlib.sha256(blob(start, end - start)).hexdigest() == row['sha256'],
                    role + ': original byte range differs')
            for kind in ('assembly', 'pseudocode'):
                if kind not in row:
                    continue
                path = (RETAINED / row[kind]).resolve()
                require(path.is_relative_to(ROOT) and path.is_file(), role + ': missing extract')
                expected = row.get(kind + '_sha256')
                if expected:
                    require(hashlib.sha256(path.read_bytes()).hexdigest() == expected,
                            role + ': extract bytes differ')
            if 'rea_subject_sha256' in row:
                imported = row.get('rea_import_range', row)
                lo, hi = int(imported['start'], 16), int(imported['end_exclusive'], 16)
                require(hashlib.sha256(blob(lo, hi - lo)).hexdigest() == row['rea_subject_sha256'],
                        role + ': Ghidra raw input identity differs')
        for role, row in extracts['data_ranges'].items():
            require(hashlib.sha256(blob(int(row['address'], 16), row['byte_count'])).hexdigest() == row['sha256'],
                    role + ': data bytes differ')
    print(f'Verified {len(vectors)} native loader/initializer vectors; {instruction_count} original instructions')


if __name__ == '__main__':
    main()
