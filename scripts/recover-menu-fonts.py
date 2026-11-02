#!/usr/bin/env python3
"""Bind current font tables/supply and replay CJK provider decisions without compilation.

Font payloads are read only in the installed EXE; no binary font is exported.
--collect stages textual evidence under runtime for review; --check verifies it.
The Ghidra carrier includes all three current font owners; its generic ABI and
missing external/table context are independent of the unchanged PE replay.
"""
from script_sources import load_script
import argparse
import ast
import hashlib
import json
import math
import re
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED = ROOT / 'docs/analysis/evidence/0.109.0/menu-fonts'
STAGED = ROOT / 'runtime/native-evidence/0.109.0/menu-fonts'
WORK = ROOT / 'runtime/menu-lifecycle-0.109.0'
OWNERS = {'cjk-provider': (0x1458f8a60, 0x1458f8c4a),
          'augment': (0x1458f8cd0, 0x1458fb738),
          'base-provider': (0x1458fc5c0, 0x1458fc818),
          'startup': (0x145891530, 0x14589162d)}
FONTS = [('AZS_NAMES_SC.TTF', 0x145da5988, 2368),
         ('AZS_NAMES_JP.TTF', 0x145da62c8, 2068),
         ('AZS_NAMES_KR.TTF', 0x145da6adc, 2060),
         ('FRIZQT__.TTF', 0x146ed381e, 70856),
         ('MORPHEUS.TTF', 0x146ee4cf8, 101328),
         ('SKURRI.TTF', 0x146efd8d8, 169028),
         ('AZS_KR.TTF', 0x146f26d98, 498808),
         ('AZS_JP.TTF', 0x146fa0a10, 1303236),
         ('AZS_SC.TTF', 0x1470decd4, 1225412)]
TABLES = {'composites': (0x146ed34c0, 41, 16),
          'mirrors': (0x146ed3768, 2, 8),
          'aliases': (0x146ed3790, 6, 8)}


def encoded(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + '\n'


def native(data, pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x800000)
    machine.mem_map(stack, 0x10000)
    machine.mem_map(done, 4096)
    cursor = heap + 0x1000
    present, inserts, reads = False, [], []

    def get(name):
        return machine.reg_read(getattr(r, 'UC_X86_REG_' + name))

    def q(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack('<' + 'Q' * len(values), *(v & ((1 << 64) - 1) for v in values)))

    def ret(value=None):
        if value is not None:
            machine.reg_write(r.UC_X86_REG_RAX, value)
        sp = get('RSP')
        machine.reg_write(r.UC_X86_REG_RIP, q(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def text(address, count):
        assert count < 1024
        return bytes(machine.mem_read(address, count)).decode()

    def hook(_, pc, size, __):
        nonlocal cursor
        if pc in (done, 0x1458f9fb4):
            machine.emu_stop()
        elif pc == 0x145acad30:
            reads.append(text(get('RDX'), get('R8')))
            put(get('RCX'), 0 if present else -1, 1, 0)
            ret()
        elif pc in (0x140002200, 0x1400021d0):
            ret()
        elif pc == 0x1400021c0:
            address = cursor
            cursor += (get('RCX') + 31) & ~15
            assert cursor < heap + 0x800000
            ret(address)
        elif pc == 0x145bfa0e7:
            address, source, count = get('RCX'), get('RDX'), get('R8')
            machine.mem_write(address, bytes(machine.mem_read(source, count)))
            ret(address)
        elif pc == 0x145acb540:
            vector = get('R8')
            raw = bytes(machine.mem_read(q(vector + 8), q(vector + 16)))
            inserts.append(dict(path=text(get('RCX'), get('RDX')), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest()))
            ret()
        elif pc == 0x145bfa10b:
            value = struct.unpack('<f', (get('XMM0') & 0xffffffff).to_bytes(4, 'little'))[0]
            rounded = math.copysign(math.floor(abs(value) + 0.5), value)
            machine.reg_write(r.UC_X86_REG_XMM0, int.from_bytes(struct.pack('<f', rounded), 'little'))
            ret()
        elif not (OWNERS['cjk-provider'][0] <= pc < OWNERS['cjk-provider'][1]
                  or 0x1458f9f77 <= pc < 0x1458f9fb4):
            raise AssertionError(f'Unreviewed native font instruction/callee {pc:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for code in ['en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru', 'uk',
                 'zh', 'ja', 'ko', '', 'ZH', 'zh-CN', 'jp', 'é']:
        for present in (False, True):
            cursor, inserts, reads = heap + 0x1000, [], []
            raw = code.encode()
            machine.mem_write(heap, raw or b'\0')
            sp = stack + 0x8000 - 8
            put(sp, done)
            for name, value in [('RSP', sp), ('RCX', heap), ('RDX', len(raw))]:
                machine.reg_write(getattr(r, 'UC_X86_REG_' + name), value)
            machine.emu_start(OWNERS['cjk-provider'][0], done, count=1000)
            assert get('RIP') == done
            result = text(get('RAX'), get('RDX')) if get('RAX') else None
            expected = {'zh': 'Fonts\\AZS_SC.TTF', 'ja': 'Fonts\\AZS_JP.TTF', 'ko': 'Fonts\\AZS_KR.TTF'}.get(code)
            assert result == expected
            assert len(reads) == int(expected is not None)
            assert len(inserts) == int(expected is not None and not present)
            cases.append(dict(locale=code, cached=present, result=result, read=reads, inserted=inserts))
    advances = []
    def f32(value):
        return struct.unpack('<f', struct.pack('<f', value))[0]
    for mode in range(5):
        for base in (0, 900, 65530):
            for left, right, units in [(0, 300, 1000), (-100, 201, 2048),
                                       (-32768, 32767, 65535), (500, -500, 1000),
                                       (0, 0, 25), (0, 0, 24)]:
                rbp = stack + 0x4000
                machine.mem_write(rbp + 0x1f0, bytes([mode]))
                machine.reg_write(r.UC_X86_REG_RBP, rbp)
                machine.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
                machine.reg_write(r.UC_X86_REG_RBX, base)
                for name, value in [('XMM6', right), ('XMM15', left), ('XMM9', f32(f32(units) * f32(.02)))]:
                    machine.reg_write(getattr(r, 'UC_X86_REG_' + name), int.from_bytes(struct.pack('<f', value), 'little'))
                machine.emu_start(0x1458f9f77, 0, count=1000)
                assert get('RIP') == 0x1458f9fb4
                result = get('RBX') & 0xffff
                increment = f32(f32(f32(right) - f32(left)) + f32(f32(units) * f32(.02)))
                rounded = math.copysign(math.floor(abs(increment) + .5), increment)
                expected = min(65535, base + min(65535, max(0, int(rounded)))) if mode == 4 else base
                assert result == expected
                advances.append(dict(mode=mode, base_advance=base, mark_xmin=left,
                                     mark_xmax=right, units=units, native_advance=result))
    return dict(cjk=cases, advance=advances,
                advance_limits='Original metric branch and saturation instructions; CRT roundf is an explicit round-away-from-zero fixture seam.')


def check_contract(evidence):
    """Selected mixed-script classification, supplied cmap and live consumer check."""
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from native_terminal import verified_input, NativeReplay
    manifest, target, data, pe = verified_input(evidence)
    for query in manifest['queries']:
        path = ROOT / query['result']
        assert hashlib.sha256(path.read_bytes()).hexdigest() == query['result_sha256']
        native = json.loads(path.read_text())['structuredContent']
        assert native['provider']['id'] == 'ghidra' and native['evidence_id'] == query['evidence_id']
        assert native['subject']['digest']['sha256'] == query['input_sha256']
    patch = load_script('mixed_font_cmap', ROOT / 'scripts/verify-menu-font-patch.py')
    assets = load_script('mixed_font_inputs', ROOT / 'scripts/recover-exe-assets.py')
    historical = json.loads((ROOT / 'docs/analysis/evidence/0.109.0/menu-fonts/manifest.json').read_text())
    old = {row['filename']: row['sha256'] for row in historical['contracts']['fonts']}
    fonts = []
    for row in manifest['fonts']:
        start, count = int(row['start'], 16), row['byte_count']
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + count]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        assert row['sha256'] == old[row['filename']], 'Changed font payload requires a new mapping review'
        meta = assets.sfnt_at(raw, 0, len(raw))
        assert meta['size_bytes'] == count
        mapping = patch.cmap(patch.tables(raw))
        # Each full CJK face maps Latin independently. These IDs are face-local:
        # a fallback's glyph number must never index the primary face's cache.
        if row['filename'] in ['AZS_SC.TTF', 'AZS_JP.TTF', 'AZS_KR.TTF']:
            assert all(ord(ch) in mapping for ch in 'empty slotRhahkZor')
            assert len({mapping[ord(ch)] for ch in 'emptysloRhkZr'}) == len(set('emptysloRhkZr'))
        fonts.append(dict(filename=row['filename'], family=meta['family'], mappings=len(mapping),
                          latin_m_glyph=mapping.get(ord('m'))))
    menu_path = ROOT / 'crates/azeroth-survivors-re/src/menu_fonts.rs'
    menu = menu_path.read_text()
    literal = re.search(r'const CJK_FONTS:.*?=\s*(\[.*?\]);', menu, re.S)[1]
    selectors = ast.literal_eval(literal.replace('&', ''))
    assert [row[0] for row in selectors] == ['ko', 'ja', 'zh']
    def selected(ch):
        code = ord(ch)
        return next((locale for locale, _, ranges in selectors
                     if any(first <= code <= last for first, last in ranges)), None)
    points = set(range(256)) | {0x10ff, 0x1200, 0x2fff, 0x10000, 0x20000, 0x10ffff}
    for _, _, ranges in selectors:
        for first, last in ranges:
            points.update(code for code in [first-2, first-1, first, first+1, last-1, last, last+1, last+2]
                          if 0 <= code <= 0x10ffff)
    texts = [chr(code) for code in sorted(points)] + ['empty slot', 'Rhahk\'Zor', '拉m佐',
             '한국 カナ 中文', '中文 한국 カナ 中文', 'ｶＡ한', '😀', '日本語カナ']
    vm = NativeReplay(data, pe); r = vm.registers; result = hashlib.sha256(); steps = 0
    for text in texts:
        vm.reset('font-script-classifier', [(0x14027c320, 0x14027c582)], [vm.done])
        vector, buffer, string = vm.mem + 0x4000, vm.mem + 0x5000, vm.mem + 0x6000
        raw = text.encode(); vm.machine.mem_write(string, raw)
        vm.put(vector, '<QQQ', 3, buffer, 0)
        for reg, value in [(r.UC_X86_REG_RCX, vector), (r.UC_X86_REG_RDX, string),
                           (r.UC_X86_REG_R8, len(raw))]: vm.machine.reg_write(reg, value)
        before = vm.instructions; vm.run(0x14027c320); steps += vm.instructions - before
        count = vm.get(vector + 16, '<Q')[0]; assert count <= 3
        actual = []
        for index in range(count):
            pointer, length = vm.get(buffer + index * 16, '<QQ')
            actual.append(bytes(vm.machine.mem_read(pointer, length)).decode())
        expected = list(dict.fromkeys(code for code in map(selected, text) if code))
        assert actual == expected, (text, actual, expected)
        result.update(json.dumps([text, actual], ensure_ascii=False).encode())
    engine = (ROOT / 'crates/benilla-app/src/ui_text/engine/mod.rs').read_text()
    layout = (ROOT / 'crates/benilla-app/src/ui_text/layout/mod.rs').read_text()
    overrides = (ROOT / 'crates/benilla-app/src/font_overrides.rs').read_text()
    assert 'text: Query<&Text>' in menu and 'spans: Query<&TextSpan>' in menu
    assert 'value.chars().filter_map(cjk_locale)' in menu and 'requested.push(locale.code())' in menu
    assert 'overrides.insert_fallback(&path, bytes, ranges)' in menu
    assert 'source.overrides.fallback_path(ch)' in engine
    assert 'let key: GlyphKey = (g.key.font_id, g.glyph_id, ppem, bake)' in engine
    assert 'self.cells.get(&(glyph.key.font_id, glyph.glyph_id, ppem, bake))' in engine
    assert 'e.cell_for_glyph(r.ppem, r.bake, g)' in layout
    assert 'register_cjk.before(bevy::ui::UiSystems::Content)' in menu
    assert 'pub fn insert_fallback(' in overrides and 'pub(crate) fn fallback_path(' in overrides
    return dict(target_sha256=target['sha256'], native_classifier_cases=len(texts),
                original_instruction_steps=steps, classification_sha256=result.hexdigest(), fonts=fonts,
                ghidra_queries=len(manifest['queries']), connected_source_paths=4,
                compiled=False, target_executed=False, parity=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--collect', action='store_true')
    mode.add_argument('--check', action='store_true')
    mode.add_argument('--check-contract', type=Path)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    if args.check_contract:
        evidence = (ROOT / args.check_contract).resolve().parent
        assert evidence.is_relative_to(ROOT)
        proof = check_contract(evidence)
        text = encoded(proof)
        if args.write: (evidence / 'validation.json').write_text(text)
        else: assert (evidence / 'validation.json').read_text() == text, 'Mixed font proof missing/stale'
        print(text); return
    target = latest_target(verify=False)
    assert target['version'] == '0.109.0' and target['sha256'] == SHA
    data = target_bytes(target)
    assets = load_script('assets', ROOT / 'scripts/recover-exe-assets.py')
    pe = assets.PE(data)

    def blob(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    def span(address, count):
        return dict(address=hex(address), byte_count=count, sha256=hashlib.sha256(blob(address, count)).hexdigest())

    fonts = []
    for filename, address, count in FONTS:
        offset = pe.rva_offset(address - pe.image_base)
        font = assets.sfnt_at(data, offset, offset + count)
        assert font['size_bytes'] == count
        fonts.append(dict(filename=filename, family=font['family'], **span(address, count)))
    patch = (ROOT / 'crates/azeroth-survivors-re/src/font_patch.rs').read_text()
    tables = {}
    for name, (address, count, stride) in TABLES.items():
        values = [tuple(row) for row in struct.iter_unpack('<' + ('4I' if stride == 16 else '2I'), blob(address, count * stride))]
        definition = re.search(r'const ' + name.upper() + r':.*?=\s*(\[.*?\]);', patch, re.S)
        assert definition and ast.literal_eval(definition[1]) == values
        tables[name] = dict(count=count, stride=stride, values=values, **span(address, count * stride))
    base = []
    for index in range(3):
        path, length, pointer, count, augment = struct.unpack('<5Q', blob(0x146f26d20 + 40 * index, 40))
        name = blob(path, length).decode()
        assert (name.split('\\')[-1], pointer, count) == FONTS[3 + index]
        assert bool(augment) == (index < 2)
        base.append(dict(path=name, augment=bool(augment), **span(0x146f26d20 + 40 * index, 40)))
    source = (ROOT / 'crates/azeroth-survivors-re/src/menu_fonts.rs').read_text()
    gpu = (ROOT / 'crates/benilla-app/src/ui_text/engine/gpu.rs').read_text()
    assert '.in_set(benilla_app::font_overrides::FontOverridesSet)' in source
    assert '.after(crate::font_overrides::FontOverridesSet)' in gpu
    assert 'if existing.is_some()' in gpu
    assert all(filename in source for filename, _, _ in FONTS[:3] + FONTS[6:])
    assert 'metrics.push((composite_advance(metrics[usize::from(base_id)].0, mark_box, mode, units), bearing));' in patch
    assert 'base.saturating_add(extra)' in patch
    vectors = native(data, pe)
    for case in vectors['cjk']:
        for inserted in case['inserted']:
            expected = next(row for row in fonts if inserted['path'].endswith(row['filename']))
            assert (inserted['sha256'], inserted['byte_count']) == (expected['sha256'], expected['byte_count'])
    summary = dict(target_sha256=SHA, fonts=fonts, tables=tables, base_registration=base,
                   native_ranges={name: span(start, end - start) for name, (start, end) in OWNERS.items()},
                   native_cases=vectors)
    if args.check:
        manifest = json.loads((RETAINED / 'manifest.json').read_text())
        assert manifest['contracts'] == json.loads(encoded(summary))
        for row in manifest['extracts']:
            assert hashlib.sha256((RETAINED / row['path']).read_bytes()).hexdigest() == row['sha256']
        print('Verified nine current font inputs/checksums, 41 composite/two mirror/six alias '
              'records, 38 native CJK/cache and 90 advance cases, ordered FrameXML supply; no compilation/game')
        return
    STAGED.mkdir(parents=True, exist_ok=True)
    extracts, evidence = [], []
    for name, address in [('cjk-provider', '1458f8a60'), ('base-provider', '1458fc5c0'), ('startup', '145891530')]:
        raw = ('\n'.join(line.rstrip() for line in (WORK / address / 'native.asm').read_text().splitlines()) + '\n').encode()
        (STAGED / (name + '.asm')).write_bytes(raw)
        extracts.append(dict(path=name + '.asm', sha256=hashlib.sha256(raw).hexdigest()))
    lines = (WORK / '1458f8cd0/native.asm').read_text().splitlines()
    metric = '\n'.join(line.rstrip() for line in lines if 0x1458f9f77 <= int(line.split(':', 1)[0], 16) < 0x1458f9fb4) + '\n'
    (STAGED / 'advance.asm').write_text(metric)
    extracts.append(dict(path='advance.asm', sha256=hashlib.sha256(metric.encode()).hexdigest()))
    for index in (3, 4, 5):
        value = json.loads((WORK / f'fonts-current/rea/{index:03d}-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
        evidence.append(dict(evidence_id=value['evidence_id'], analysis_profile_digest=value['analysis_profile']['digest'], operation=value['parameters']))
    value = json.loads((WORK / '145891530/rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
    evidence.append(dict(evidence_id=value['evidence_id'], analysis_profile_digest=value['analysis_profile']['digest'], operation=value['parameters']))
    manifest = dict(contracts=summary, extracts=extracts, ghidra=evidence,
                    limits=['Original PE bytes and Ghidra raw imports; generic ABI and missing external/jump-table context are not source typing.',
                            'Native CJK lookup/insertion use synthetic cache, scratch allocation and memcpy seams; selected embedded payload bytes are copied exactly.',
                            'Current glyph tables and native metric instructions are verified; the separate CRT roundf seam does not validate the Windows CRT. Other geometry retains its original report provenance.',
                            'No fonts are bundled. Source/runtime compatible font supply remains --font-dir or user MPQs; missing binary inputs cannot be manufactured.',
                            'Font shaping, Bevy scheduling, compilation and rendered/original-rebuilt parity remain unverified.'])
    (STAGED / 'manifest.json').write_text(encoded(manifest))
    print('Staged textual current font evidence:', STAGED.relative_to(ROOT))


if __name__ == '__main__':
    main()
