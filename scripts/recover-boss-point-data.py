#!/usr/bin/env python3
"""Independently revalidate all selected 0.97.2 boss records and raw abilities.

The portable boss source reexports the existing canonical guardian-owned data.
This static recovery never launches the EXE or compiles source.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT = ROOT / 'docs/analysis/evidence/bosses/catalog.json'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/bosses/catalog.rs'
KEYS = ('elwynn', 'duskwood', 'wsg', 'ungoro', 'ab', 'feralas', 'arena', 'sm', 'av', 'brm', 'aq', 'naxx')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    def read(va, count):
        offset = pe.rva_offset(va - pe.image_base)
        result = data[offset:offset+count]
        assert len(result) == count
        return result
    def span(va, count):
        raw = read(va, count)
        return dict(va=hex(va), file_offset=hex(pe.rva_offset(va-pe.image_base)), byte_count=count,
                    sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())
    def string(va):
        ptr, size = struct.unpack('<QQ', read(va,16))
        assert size < 4096
        return dict(text=read(ptr,size).decode('utf-8'), source=span(ptr,size))
    zones = []
    for index, key in enumerate(KEYS):
        at = 0x146716438 + index * 240
        assert string(at+8)['text'] == key
        ptr, count = struct.unpack('<QQ',read(at+0x88,16))
        assert count == 5
        points_ptr, point_count = struct.unpack('<QQ',read(at+0x68,16))
        points = [dict(index=n, record=span(points_ptr+n*8,8), xy_bits=list(struct.unpack('<2I',read(points_ptr+n*8,8))))
                  for n in range(point_count)]
        bosses = []
        for n in range(count):
            row = ptr+n*88
            ability_ptr, ability_count = struct.unpack('<QQ',read(row+16,16))
            assert ability_count <= 32
            bosses.append(dict(index=n,record=span(row,88),name=string(row),yell=string(row+32),
                words=list(struct.unpack('<22I',read(row,88))),
                abilities=[dict(index=k,record=span(ability_ptr+k*28,28),words=list(struct.unpack('<7I',read(ability_ptr+k*28,28))))
                           for k in range(ability_count)]))
        zones.append(dict(index=index,key=key,name=string(at+24)['text'],record=span(at,240),
                          boss_slice=dict(va=hex(ptr),count=count,stride=88),spawn_points=points,bosses=bosses))
    result=dict(date='2026-10-18',target_version='0.97.2',target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,
        target_executed=False,zone_count=12,boss_count=60,ability_count=sum(len(b['abilities']) for z in zones for b in z['bosses']),
        method='SHA-bound selected PE strings/slices and exact record words; canonical Rust records remain guardian catalog owned.',
        zones=zones,limitations=['Recovered tables do not establish implemented ability effects or runtime parity.',
         'Boss ability words retain raw offsets until their native consumers recover semantics.',
         'Canonical source is reused rather than copied; builds never require the reference EXE.'])
    text=json.dumps(result,indent=2)+'\n'
    lines=['//! Canonical selected 0.97.2 boss records, shared with guardian scaling.',
           '//! Independent byte proof: docs/analysis/evidence/bosses/catalog.json.',
           '//! Regenerate supplemental point data: python3 scripts/recover-boss-point-data.py.',
           '//! Boss definitions/abilities have one source owner; normal builds need no EXE.',
           'pub use crate::guardians::catalog::{BossDefinition, RawBossAbility, ZoneDefinition, ZONES};','',
           "pub fn boss_by_id(zone: &ZoneDefinition, id: u32) -> Option<&'static BossDefinition> {",
           '    zone.bosses.iter().find(|boss| boss.id == id)','}','',
           "pub fn spawn_points(zone_key: &str) -> &'static [[f32; 2]] {",'    match zone_key {']
    for zone in zones:
        if zone['spawn_points']:
            lines.append(f'        "{zone["key"]}" => {{')
            lines.append('            const POINTS: &[[f32; 2]] = &[')
            for point in zone['spawn_points']:
                lines.append('                ['+', '.join(f'f32::from_bits(0x{v:08x})' for v in point['xy_bits'])+'],')
            lines.extend(['            ];', '            POINTS', '        },'])
    lines.extend(['        _ => &[],','    }','}',''])
    for path,value in [(OUT,text),(SOURCE,'\n'.join(lines))]:
        if args.check:
            assert path.read_text()==value, f'Boss catalog differs: {path.relative_to(ROOT)}'
        else:
            path.parent.mkdir(parents=True,exist_ok=True)
            path.write_text(value)
    # Inspect the canonical literal data without invoking a compiler or parser.
    source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    blocks=re.findall(r'^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)',source,re.M|re.S)
    original=[boss for zone in zones for boss in zone['bosses']]
    assert len(blocks)==len(original)==60
    for block,native in zip(blocks,original):
        words=native['words']
        for field,index in [('id',12),('model_id',13),('raw_3c',15),('raw_50',20)]:
            assert int(re.search(r'\b'+field+r':\s*(\d+)',block)[1])==words[index]
        for field,index in [('scale',14),('time_minutes',16),('base_hp',17),('base_damage',18),('raw_4c',19)]:
            assert int(re.search(r'\b'+field+r':\s*f32::from_bits\(0x([0-9a-f]+)\)',block)[1],16)==words[index]
        for field in ['name','yell']:
            assert json.loads(re.search(r'\b'+field+r':\s*("(?:\\.|[^"\\])*")',block)[1])==native[field]['text']
        assert int(re.search(r'\bflag_54:\s*(\d+)',block)[1])==words[21]&255
        abilities=re.findall(r'words:\s*\[(.*?)\]',block,re.S)
        assert len(abilities)==len(native['abilities'])
        for values,ability in zip(abilities,native['abilities']):
            assert [int(word,16) for word in re.findall(r'0x[0-9a-f]+',values)]==ability['words']
    print(f"{'Checked' if args.check else 'Recovered'} 12 zones / 60 primary bosses / {result['ability_count']} ability records")


if __name__=='__main__':main()
