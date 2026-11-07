#!/usr/bin/env python3
"""Verify owned patched QA fonts against ignored SHA-bound native font inputs.

Run the owned font_patch.rs augmentation first to runtime/analysis/history/interface/menu-recovery/0558cac00653/patched-*.ttf.
This analysis helper reads neither the reference EXE nor operating-system fonts.
"""
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent

def tables(data):
    result = {}
    for at in range(12, 12 + struct.unpack_from('>H', data, 4)[0] * 16, 16):
        tag, _, offset, size = struct.unpack_from('>4sIII', data, at)
        result[tag] = data[offset:offset + size]
    return result

def cmap(font):
    data = font[b'cmap']
    result = {}
    for index in range(struct.unpack_from('>H', data, 2)[0]):
        platform, encoding, off = struct.unpack_from('>HHI', data, 4 + 8 * index)
        if platform != 0 and not (platform == 3 and encoding in (1, 10)):
            continue
        format_ = struct.unpack_from('>H', data, off)[0]
        if format_ == 12:
            for row in range(struct.unpack_from('>I', data, off + 12)[0]):
                start, end, glyph = struct.unpack_from('>III', data, off + 16 + row * 12)
                result.update((code, glyph + code - start) for code in range(start, end + 1) if glyph + code - start)
        if format_ == 4:
            count = struct.unpack_from('>H', data, off + 6)[0] // 2
            for row in range(count):
                end = struct.unpack_from('>H', data, off + 14 + row * 2)[0]
                start = struct.unpack_from('>H', data, off + 16 + count * 2 + row * 2)[0]
                delta = struct.unpack_from('>H', data, off + 16 + count * 4 + row * 2)[0]
                address = off + 16 + count * 6 + row * 2
                range_ = struct.unpack_from('>H', data, address)[0]
                for code in range(start, end + 1):
                    glyph = (code + delta) & 0xffff if not range_ else struct.unpack_from('>H', data, address + range_ + (code - start) * 2)[0]
                    if range_ and glyph:
                        glyph = (glyph + delta) & 0xffff
                    if glyph and code != 0xffff:
                        result[code] = glyph
    return result

def glyphs(font):
    count = struct.unpack_from('>H', font[b'maxp'], 4)[0]
    long = struct.unpack_from('>h', font[b'head'], 50)[0]
    offsets = struct.unpack('>' + ('I' if long else 'H') * (count + 1), font[b'loca'][:(count + 1) * (4 if long else 2)])
    if not long:
        offsets = [value * 2 for value in offsets]
    return [font[b'glyf'][offsets[index]:offsets[index + 1]].rstrip(b'\0') for index in range(count)]

def main():
    records = []
    fontmaps = {}
    for name in ['FRIZQT__', 'MORPHEUS']:
        original = (ROOT / f'runtime/analysis/history/interface/menu-fonts/b488d8153517/{name}.TTF').read_bytes()
        patched = (ROOT / f'runtime/analysis/history/interface/menu-recovery/0558cac00653/patched-{name}.ttf').read_bytes()
        before, after = tables(original), tables(patched)
        oldmap, newmap = cmap(before), cmap(after)
        oldglyphs, newglyphs = glyphs(before), glyphs(after)
        assert all(newmap[code] == glyph for code, glyph in oldmap.items())
        assert oldglyphs == newglyphs[:len(oldglyphs)]
        assert sum(struct.unpack('>' + 'I' * (len(patched) // 4), patched)) & 0xffffffff == 0xb1b0afba
        assert all(ord(character) in newmap for character in 'ąćęńóśźżĄĆĘŃÓŚŹŻğĞşŞİ')
        fontmaps[name] = newmap
        records.append(dict(font=name, original_glyphs=len(oldglyphs), patched_glyphs=len(newglyphs),
                            new_glyphs=[dict(codepoint=f'U+{code:04X}', character=chr(code), glyph=glyph) for code, glyph in sorted(newmap.items()) if code not in oldmap],
                            preserved_original_glyphs=True, preserved_existing_cmap=True,
                            valid_sfnt_checksum=True, patched_sha256=hashlib.sha256(patched).hexdigest()))
    for name in ['AZS_NAMES_SC', 'AZS_NAMES_KR', 'AZS_SC', 'AZS_KR']:
        fontmaps[name] = cmap(tables((ROOT / f'runtime/analysis/history/interface/menu-fonts/b488d8153517/{name}.TTF').read_bytes()))
    base = set().union(*(fontmaps[name] for name in ['FRIZQT__', 'MORPHEUS', 'AZS_NAMES_SC', 'AZS_NAMES_KR']))
    full = base | set(fontmaps['AZS_SC']) | set(fontmaps['AZS_KR'])
    locales = []
    for path in sorted((ROOT / 'crates/azeroth-survivors-re/assets/locales').glob('*.json')):
        labels = json.loads(path.read_text())
        required = {ord(character) for value in labels.values() for character in value if not character.isspace()}
        missing = sorted(required - (full if path.stem in ('zh', 'ko') else base))
        locales.append(dict(code=path.stem, required_distinct_codepoints=len(required),
                            absent_from_registered_target_font_maps=[dict(codepoint=f'U+{code:04X}', character=chr(code)) for code in missing]))
    output = dict(validation='Owned native composite patch applied to exact reference QA inputs; not comparison of final font bytes against native runtime.', fonts=records, locale_catalog_coverage=locales)
    (ROOT / 'docs/analysis/evidence/0.92/menu-font-patch-validation.json').write_text(json.dumps(output, indent=2, ensure_ascii=False) + '\n')
    for row in records:
        print(f"{row['font']}: {row['original_glyphs']}→{row['patched_glyphs']}, original outlines/mappings retained, valid checksum")
    for row in locales:
        missing = row['absent_from_registered_target_font_maps']
        print(f"{row['code']}: {row['required_distinct_codepoints']} distinct catalog codepoints, {len(missing)} absent from native registered font maps")

if __name__ == '__main__':
    main()
