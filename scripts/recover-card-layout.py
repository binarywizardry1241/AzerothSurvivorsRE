#!/usr/bin/env python3
"""Recover/replay bounded 0.108.0 card contracts without a compiler or game.

--prepare writes raw-function Ghidra plans under runtime/; run each with
scripts/rea-batch.py. --collect stages canonical textual evidence under runtime/
for review. --check verifies curated evidence and replays original instructions.
No mode starts REA, the application, a compiler or the renderer implicitly.
"""
from portable_paths import portable_json
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b'
WORK = ROOT / 'runtime/analysis/history/interface/card-layout/a253b785ead7'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/0.108.0/card-layout'
CURATED = ROOT / 'docs/analysis/evidence/0.108.0/card-layout'
OWNERS = {
    'card-tile': 0x1401356B0,
    'card-content': 0x14023FE40,
    'node-reflection': 0x1426553B0,
    'numeric-line': 0x14013ABB0,
    'numeric-spans': 0x14024A220,
}
# Current PE instruction boundaries, independently located from constructor
# immediates, current rel32 call targets and Node field-name references.
RANGES = {
    'card-frame': (0x140136082, 0x14013623C),
    'font-forward': (0x140136751, 0x1401367DF),
    'font-load': (0x14024015F, 0x140240166),
    'name-font': (0x140241544, 0x1402416C0),
    'footer': (0x140241D6E, 0x140242004),
    'description-lanes': (0x140241BD7, 0x140241D6E),
    'line-font': (0x14013AEF3, 0x14013B0B9),
    'node-dimensions': (0x14265596E, 0x142655B9D),
    'node-margin': (0x14265608E, 0x142656111),
    'numeric-spans': (0x14024A220, 0x14024A49B),
}
FIELDS = {'width': (136, 0x14627ED19), 'height': (144, 0x14627ED1E),
          'min_height': (160, 0x14627ED5B), 'margin': (184, 0x14627EDCE)}
SOURCE = 'crates/azeroth-survivors-re/src/gameplay/native_overlays.rs'
LIMITS = [
    'Raw Ghidra imports omit external data/callees and use a generic ABI; original PE instructions govern Win64 arguments.',
    'Replay supplies synthetic registers, live font handles and memcpy/empty-title seams; it stops before ECS spawning.',
    'Full font registration/fallback, glyph rasterization, Bevy layout, wrapping, input and original/rebuilt visual parity remain unverified.',
]


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2) + '\n')


def decoder():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    dis = Cs(CS_ARCH_X86, CS_MODE_64)
    dis.detail = True
    return dis


def raw(pe, address, count):
    offset = pe.rva_offset(address - pe.image_base)
    return pe.data[offset:offset + count]


def record(pe, address, end):
    value = raw(pe, address, end - address)
    return dict(address=hex(address), end_exclusive=hex(end), byte_count=len(value),
                file_offset=hex(pe.rva_offset(address - pe.image_base)),
                sha256=hashlib.sha256(value).hexdigest())


def instructions(pe, a, b):
    rows = list(decoder().disasm(raw(pe, a, b - a), a))
    assert rows and sum(i.size for i in rows) == b - a, f'Incomplete decode {a:#x}'
    return rows


def check_boundaries(pe, owners):
    for a, b in RANGES.values():
        owner = next(row for row in owners if int(row['address'], 16) <= a < b <= int(row['end_exclusive'], 16))
        start, end = int(owner['address'], 16), int(owner['end_exclusive'], 16)
        boundaries = {i.address for i in instructions(pe, start, end)} | {end}
        assert a in boundaries and b in boundaries, f'Range is not on owner instruction boundaries: {a:#x}..{b:#x}'


def prepare(pe):
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    for role, a in OWNERS.items():
        b = bounds[a]
        (WORK / f'{role}.bin').write_bytes(raw(pe, a, b - a))
        save(WORK / f'{role}-plan.json', dict(
            target=str((WORK / f'{role}.bin').relative_to(ROOT)),
            output=str((WORK / f'rea-{role}').relative_to(ROOT)),
            init_timeout=60, open_timeout=60, timeout=240,
            open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
            operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))]))


def collect(pe, target):
    from capstone.x86 import X86_OP_MEM, X86_REG_RIP
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    owners = []
    for role, a in OWNERS.items():
        row = dict(role=role, **record(pe, a, bounds[a]))
        evidence = json.loads((WORK / f'rea-{role}/003-procedure_pseudo_code.json').read_text())
        evidence = evidence['response']['result']['structuredContent']
        assert evidence['provider']['id'] == 'ghidra'
        assert evidence['subject']['digest']['sha256'] == row['sha256']
        assert len(evidence['normalized_result']) > 100
        row['rea_evidence_id'] = evidence['evidence_id']
        owners.append(row)
    check_boundaries(pe, owners)
    fragments, literals = [], {}
    for role, (a, b) in RANGES.items():
        rows = instructions(pe, a, b)
        assembly = '\n'.join(f'{i.address:016x}: {i.mnemonic} {i.op_str}'.rstrip() for i in rows) + '\n'
        path = STAGED / f'{role}.asm'
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(assembly)
        fragments.append(dict(role=role, assembly=path.name,
                              assembly_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                              **record(pe, a, b)))
        for i in rows:
            for op in i.operands:
                if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                    at = i.address + i.size + op.mem.disp
                    literals[(at, op.size)] = dict(**record(pe, at, at + op.size),
                                                  bytes_hex=raw(pe, at, op.size).hex())
    save(STAGED / 'manifest.json', dict(
        target=target, application_executed=False, owners=owners, fragments=fragments,
        referenced_data=list(literals.values()),
        node_fields=[dict(name=name, node_offset=offset, **record(pe, a, a + len(name)))
                     for name, (offset, a) in FIELDS.items()],
        discovery='Unique current width252/min-height388 constructor; current rel32 content/line/span chain; current width/height/min_height/margin serializer references.',
        native_contract=dict(width_px=252, height='Auto', min_height_px=388,
                             footer_margin_top='Auto', footer_padding_xy=[10, 9],
                             name_px=21, plain_px=14, highlighted_px=15,
                             supplied_font_preserved=True, numeric_rgb=[0.302, 1, 0.416],
                             ordinary_rgb=[0.949, 0.902, 0.788]),
        limitations=LIMITS))


def check_evidence(pe, target, directory):
    from capstone.x86 import X86_OP_MEM, X86_REG_RIP, X86_REG_RDI, X86_REG_RDX
    manifest = json.loads((directory / 'manifest.json').read_text())
    assert manifest['target'] == target
    check_boundaries(pe, manifest['owners'])
    for row in (manifest['owners'] + manifest['fragments'] +
                manifest['referenced_data'] + manifest['node_fields']):
        a, b = int(row['address'], 16), int(row['end_exclusive'], 16)
        assert record(pe, a, b)['sha256'] == row['sha256']
        assert row['byte_count'] == b - a
        if 'assembly' in row:
            assert hashlib.sha256((directory / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
    for name, (offset, a) in FIELDS.items():
        assert raw(pe, a, len(name)) == name.encode()
        row = next(r for r in manifest['node_fields'] if r['name'] == name)
        assert row['node_offset'] == offset
        # Pair each field name with the actual current Node member read.
        role = 'node-margin' if name == 'margin' else 'node-dimensions'
        rows = instructions(pe, *RANGES[role])
        reads = [n for n, i in enumerate(rows) if i.mnemonic == 'lea' and
                 i.operands[0].reg == X86_REG_RDX and i.operands[1].type == X86_OP_MEM and
                 i.operands[1].mem.base == X86_REG_RDI and i.operands[1].mem.disp == offset]
        assert len(reads) == 1
        assert any(i.mnemonic == 'lea' and i.operands[0].reg == X86_REG_RDX and
                   i.operands[1].type == X86_OP_MEM and i.operands[1].mem.base == X86_REG_RIP and
                   i.address + i.size + i.operands[1].mem.disp == a
                   for i in rows[reads[0]:reads[0] + 40])
    # Verify the current call chain, independently of generic raw-import ABI.
    for at, destination in ((0x1401367DA, OWNERS['card-content']),
                            (0x140241D60, OWNERS['numeric-line']),
                            (0x14013B0B4, OWNERS['numeric-spans'])):
        code = raw(pe, at, 5)
        assert code[0] == 0xE8 and at + 5 + struct.unpack('<i', code[1:])[0] == destination
    return manifest


def replay(pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for s in pe.sections:
        machine.mem_write(pe.image_base + s['rva'], pe.data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    stack, inputs = 0x20000000, 0x30000000
    machine.mem_map(stack, 0x10000)
    machine.mem_map(inputs, 0x10000)
    bp = stack + 0x1000
    active = dict(allowed=set(), copies=set(), empty_title=set())

    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def put(a, value): machine.mem_write(a, struct.pack('<Q', value))
    def scalar(a): return struct.unpack('<f', machine.mem_read(a, 4))[0]

    def guard(_, a, size, unused):
        assert a in active['allowed'], f'Unexpected instruction/callee {a:#x}'
        if a in active['copies']:
            machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8'))))
            write('RIP', a + size)
        elif a in active['empty_title']:
            machine.mem_write(bp + 0x520, struct.pack('<QQQ', 0, 4, 0))
            write('RIP', a + size)

    machine.hook_add(UC_HOOK_CODE, guard)

    def reset():
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'EFLAGS'):
            write(name, 0)
        machine.mem_write(stack, bytes(0x10000))
        machine.mem_write(inputs, bytes(0x10000))
        write('RBP', bp)
        write('RSP', stack + 0xF000)
        write('R14', inputs + 0x4000)
        for number in range(16): write('XMM' + str(number), 0)
        for number, address in ((9, 0x145DED860), (10, 0x145DED890), (11, 0x145DED878),
                                (12, 0x145DED8A8), (14, 0x145DED918)):
            write('XMM' + str(number), int.from_bytes(raw(pe, address, 16), 'little'))

    def run(a, b, copies=(), title=()):
        rows = instructions(pe, a, b)
        active.update(allowed={i.address for i in rows}, copies=set(copies), empty_title=set(title))
        # Every external call is stopped before execution or an explicit data seam.
        for i in rows:
            if i.mnemonic.startswith('call'):
                assert i.address in set(copies) | set(title), f'Unmodeled call {i.address:#x}'
        machine.emu_start(a, b, count=2000)
        assert read('RIP') == b

    def val(base, offset):
        tag, value = struct.unpack('<If', machine.mem_read(base + offset, 8))
        return dict(tag=tag, value=value if tag else None)

    reset()
    run(0x140136082, 0x14013623C)
    frame = {name: val(bp + 0xF0, offset) for name, offset in
             (('width', 136), ('height', 144), ('min_height', 160))}
    assert frame == dict(width=dict(tag=1, value=252), height=dict(tag=0, value=None),
                         min_height=dict(tag=1, value=388))
    reset()
    run(0x140241D6E, 0x140241FFF, copies=(0x140241E82,))
    footer = {name: val(bp + 0x5B8, offset) for name, offset in
              (('width', 136), ('margin_top', 200), ('padding_left', 216),
               ('padding_right', 224), ('padding_top', 232), ('padding_bottom', 240))}
    assert footer == dict(width=dict(tag=2, value=100), margin_top=dict(tag=0, value=None),
                          padding_left=dict(tag=1, value=10), padding_right=dict(tag=1, value=10),
                          padding_top=dict(tag=1, value=9), padding_bottom=dict(tag=1, value=9))
    cases = [dict(role='frame', fields=frame), dict(role='footer', fields=footer)]
    for tag in (0, 1):
        def font():
            handle = bytearray(17)
            handle[0] = tag
            handle[1:8] = b'CARD_ID' if tag else bytes(7)
            struct.pack_into('<Q', handle, 8, inputs + 0x2000)
            handle[16] = tag
            machine.mem_write(inputs + 0x1000, bytes(handle))
            put(inputs + 0x2000, 1)
            return bytes(handle)

        def preserved(address, handle):
            actual = bytes(machine.mem_read(address, 17))
            assert actual[0] == tag and actual[8:16] == handle[8:16]
            if tag: assert actual == handle

        reset()
        handle = font()
        put(inputs + 0x20, inputs + 0x3000)
        write('RBX', inputs)
        write('RDI', inputs + 0x1000)
        run(0x140241544, 0x1402416BB, copies=(0x140241605, 0x14024161A), title=(0x14024154F,))
        preserved(bp + 0x768, handle)
        assert scalar(bp + 0x780) == 21
        cases.append(dict(role='name', handle_tag=tag, px=21))
        reset()
        handle = font()
        write('RDI', inputs + 0x1000)
        run(0x140241BEE, 0x140241D24)
        preserved(bp + 0x5E8, handle)
        assert scalar(bp + 0x600) == 14
        cases.append(dict(role='plain', handle_tag=tag, px=14))
        reset()
        handle = font()
        put(bp + 0x390, inputs + 0x1000)
        put(bp + 0x398, inputs + 0x3000)
        run(0x14013AEF3, 0x14013B050, copies=(0x14013AF66, 0x14013B04B))
        preserved(bp + 0x198, handle)
        assert scalar(bp + 0x1B0) == 15
        cases.append(dict(role='highlighted-line', handle_tag=tag, px=15))
        for numeric in (False, True):
            reset()
            handle = font()
            write('RCX', inputs)
            write('RDX', inputs + 0x100)
            put(inputs + 0x100, 1)
            put(inputs + 0x108, inputs + 0x200)
            put(inputs + 0x110, 1)
            put(inputs + 0x118, inputs + 0x1000)
            put(inputs + 0x208, inputs + 0x400)
            put(inputs + 0x210, 1)
            machine.mem_write(inputs + 0x218, bytes([numeric]))
            run(0x14024A220, 0x14024A3E7)
            current_bp = read('RBP')
            preserved(current_bp + 8, handle)
            assert scalar(current_bp + 0x20) == 15
            color = struct.unpack('<Iffff', machine.mem_read(current_bp + 0x5C, 20))
            expected = (0.302, 1, 0.416) if numeric else (0.949, 0.902, 0.788)
            assert color[0] == 0 and color[4] == 1
            assert all(abs(a - b) < 1e-6 for a, b in zip(color[1:4], expected))
            cases.append(dict(role='span', handle_tag=tag, numeric=numeric, px=15, rgb=list(color[1:4])))
    return cases


def check_source():
    source = (ROOT / SOURCE).read_text()
    tile = source.split('fn card_tile(', 1)[1].split('fn card_annotations(', 1)[0]
    frame = tile.split('Node {', 1)[1].split('..default()', 1)[0]
    assert 'width: Val::Px(252.)' in frame and 'min_height: Val::Px(388.)' in frame
    assert not any(line.strip().startswith('height:') for line in frame.splitlines())
    assert re.search(r'21\.,\s*text_color,\s*false,\s*Node', re.sub(r'//[^\n]*', '', tile))
    assert 'let (plain, lines) = card.body()' in tile
    assert 'text(ui, art, plain, 14., CARD_BODY, false' in tile
    assert 'for line in lines' in tile and 'number_text(ui, art, line)' in tile
    assert 'margin: UiRect::top(Val::Auto)' in tile
    assert 'padding: UiRect::axes(Val::Px(10.), Val::Px(9.))' in tile
    rich = source.split('fn number_text(', 1)[1].split('pub fn numeric_spans(', 1)[0]
    assert 'font: art.font.clone()' in rich and 'font_size: 15.' in rich
    assert rich.index('font.clone()', rich.index('TextSpan::new(span)')) < rich.index('TextColor(if numeric')
    assert 'Color::srgb(0.302, 1., 0.416)' in rich
    text = source.split('fn text(', 1)[1].split('fn number_text(', 1)[0]
    assert re.search(r'font: if heading\s*\{\s*art.heading_font.clone\(\)\s*\}\s*else\s*\{\s*art.font.clone\(\)', text)
    tooltip = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/native_overlays/tooltip.rs').read_text()
    span = tooltip.split('TextSpan::new(value)', 1)[1]
    assert 'let line_font = font(15.0)' in tooltip
    assert span.index('line_font.clone()') < span.index('TextColor(')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true')
    parser.add_argument('--collect', action='store_true')
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--staged', action='store_true', help='Check staged rather than curated evidence')
    parser.add_argument('--python-libs', action='append', default=[], help='Project-local Capstone/Unicorn packages; repeat for separate directories')
    args = parser.parse_args()
    if not any((args.prepare, args.collect, args.check)): parser.error('Select --prepare, --collect or --check')
    for value in args.python_libs:
        path = (ROOT / value).resolve()
        assert path.is_relative_to(ROOT), 'Dependencies must stay project-local'
        sys.path.insert(0, str(path))
    decoder()
    target = latest_target(verify=True)
    assert target['version'] == '0.108.0' and target['sha256'] == SHA, 'Selected target is no longer this evidence target'
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(target_bytes(target))
    if args.prepare: prepare(pe)
    if args.collect: collect(pe, target)
    if args.check:
        import capstone
        import unicorn
        manifest = check_evidence(pe, target, STAGED if args.staged else CURATED)
        cases = replay(pe)
        check_source()
        save(WORK / 'checks.json', dict(target=target, application_executed=False,
                                       engines={'Capstone': capstone.__version__, 'Unicorn': unicorn.__version__},
                                       cases=cases, source_connections='checked', limitations=manifest['limitations']))
        print(f'Card layout 0.108.0: {len(cases)} native cases and live source checks passed; no compiler/game/renderer.')
    else: print('Card evidence staged under runtime/analysis/history/interface/card-layout/a253b785ead7 and runtime/analysis/staging/native-evidence/0.108.0/card-layout.')


if __name__ == '__main__':
    main()
