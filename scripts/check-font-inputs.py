#!/usr/bin/env python3
"""Validate current embedded SFNT inputs and bounded registration, without export/build."""
import argparse
import ast
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, file_sha256
from script_sources import load_script
from creature_query_native import PE, D, ENDS
from font_input_native import FontProbe, CJK, BASE, AUTO

WORK = ROOT / 'runtime/analysis/history/findings/q41-all/f1125d689593'
KEEP = ROOT / 'docs/analysis/evidence/font-inputs.json'
ASSETS = load_script('font_inputs_assets', 'scripts/recover-exe-assets.py')
SUPPLY = {family: name for family, name in ASSETS.FONT_NAMES.items()
          if family != 'Fira Mono Medium'}


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    fonts = {}
    for section in PE.sections:
        if int(section['characteristics'], 16) & 0x20000000:
            continue
        start = section['raw_offset']
        end = min(len(D), start + section['raw_size'])
        for signature in [b'\0\1\0\0', b'OTTO', b'true']:
            at = D.find(signature, start, end)
            while at >= 0:
                try:
                    fonts[at] = ASSETS.sfnt_at(D, at, end)
                except (ValueError, struct.error, UnicodeError, IndexError):
                    pass
                at = D.find(signature, at+1, end)
    fonts = dict(sorted(fonts.items()))
    assert len(fonts) == 10
    assert {v['family'] for v in fonts.values()} == set(ASSETS.FONT_NAMES)
    named = ASSETS.named_font_records(PE, fonts)
    rows = []
    for at, font in fonts.items():
        raw = D[at:at+font['size_bytes']]
        rows.append(dict(family=font['family'], supply_filename=SUPPLY.get(font['family']),
            location=ASSETS.location(PE, at, len(raw)), table_count=len(font['tables']),
            validation=font['validation'], native_named_records=named[at]))
        # Reject both a truncated input and a damaged table for every valid font.
        for broken in [raw[:-4], raw[:100] + bytes([raw[100] ^ 1]) + raw[101:]]:
            try:
                ASSETS.sfnt_at(broken, 0, len(broken))
            except (ValueError, struct.error, UnicodeError, IndexError):
                continue
            raise AssertionError('damaged/truncated font admitted')
    by_name = {r['supply_filename']: r['location'] for r in rows if r['supply_filename']}
    patch_path = 'crates/azeroth-survivors-re/src/font_patch.rs'
    menu_path = 'crates/azeroth-survivors-re/src/menu_fonts.rs'
    patch, menu = (ROOT/patch_path).read_text(), (ROOT/menu_path).read_text()
    tables = []
    for name, count, fields in [('COMPOSITES',41,4),('MIRRORS',2,2),('ALIASES',6,2)]:
        source = re.search(r'const '+name+r':.*?=\s*(\[.*?\]);', patch, re.S).group(1)
        values = ast.literal_eval(source)
        assert len(values) == count and all(len(row) == fields for row in values)
        raw = b''.join(struct.pack('<'+'I'*fields,*row) for row in values)
        at = D.find(raw)
        assert at >= 0 and D.find(raw,at+1) < 0
        tables.append(dict(name=name, rows=count, fields=fields, location=ASSETS.location(PE,at,len(raw))))
    assert all(name+'"' in menu for name in SUPPLY.values())
    assert 'Ok(bytes)' in menu and 'font_patch::augment(bytes.clone())' in menu
    probe, cases = FontProbe(), []
    for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko','','ZH','zh-CN','jp','é']:
        for cached in [False,True]:
            actual = probe.cjk(code,cached)
            suffix = {'zh':'SC','ja':'JP','ko':'KR'}.get(code)
            path = 'Fonts\\AZS_'+suffix+'.TTF' if suffix else None
            expected = dict(result=path, reads=[path] if path else [], stored=[])
            if path and not cached:
                row = by_name['AZS_'+suffix+'.TTF']
                expected['stored'] = [[path,row['size_bytes'],row['sha256']]]
            assert actual == expected
            cases.append(dict(kind='cjk',locale=code,cached=cached,actual=actual))
    for failures in [[False,False],[True,False],[False,True],[True,True]]:
        actual = probe.base(failures)
        expected = dict(stored=[], transforms=[], logs=sum(failures))
        for index, name in enumerate(['FRIZQT__.TTF','MORPHEUS.TTF','SKURRI.TTF']):
            row = by_name[name]
            at = int(row['file_offset'],16)
            raw = D[at:at+row['size_bytes']]
            if index < 2:
                expected['transforms'].append(sha(raw))
                if not failures[index]:
                    raw = b'patched'+raw  # Opaque synthetic success result, not native glyph output.
            expected['stored'].append(['Fonts\\'+name,len(raw),sha(raw)])
        assert actual == expected
        cases.append(dict(kind='base',synthetic_augmentation_errors=failures,actual=actual))
    actual = probe.autonyms()
    assert actual == [[by_name[name]['size_bytes'],by_name[name]['sha256']]
        for name in ['AZS_NAMES_SC.TTF','AZS_NAMES_JP.TTF','AZS_NAMES_KR.TTF']]
    cases.append(dict(kind='autonym_prefix',actual=actual,stop_before='0x14004fe4b'))
    observations = []
    for path in sorted((WORK/'rea-font-contracts').glob('0*.json')):
        e = json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if e.get('operation') not in ['procedure_info','procedure_pseudo_code']:
            continue
        assert e['subject']['digest']['sha256'] == target['sha256']
        observations.append(dict(operation=e['operation'], parameters=e['parameters'],
            evidence_id=e['evidence_id'],response_sha256=file_sha256(path)))
    assert len(observations) == 8
    spans = []
    for a,b in [(CJK,ENDS[CJK]),(BASE,ENDS[BASE]),(AUTO,0x14004fe4b),(0x1432fb9f0,ENDS[0x1432fb9f0])]:
        at = PE.rva_offset(a-PE.image_base)
        spans.append(dict(start=hex(a),end_exclusive=hex(b),sha256=sha(D[at:at+b-a])))
    result = dict(schema_version=1,target={k:target[k] for k in ['version','path','sha256','size_bytes']},
        gap_ids=[17,41], leads=['Q41-B02','Q41-R01','Q41-D01','Q41-D02','Q41-D03'],
        scan_scope='All three supported standalone SFNT signatures in nonexecutable PE sections; no compressed/other-format completeness claim.',
        fonts=rows, rejected_counterexamples=20, glyph_tables=tables,
        locale_path_records=ASSETS.language_font_records(PE,ASSETS.pointer_slices(PE)),
        native_spans=spans,ghidra_observations=observations,native_cases=len(cases),cases=cases,
        source_hashes={p:file_sha256(ROOT/p) for p in [menu_path,patch_path]},
        supporting_font=dict(family='Fira Mono Medium',native_payload_sha256=next(r['location']['sha256'] for r in rows if r['family']=='Fira Mono Medium'),
            correspondence='Exact bytes match Bevy 0.18.1 bevy_text DEFAULT_FONT_DATA / FiraMono-subset.ttf; native carrier copies 0x49a0 bytes from 0x1465a9800 into its parser boundary. Full native generic plugin/type identity is not recovered.'),
        limits=[
            'Original registration decisions execute with synthetic allocation/copy/cache/fontDB seams. Native augmentation is intercepted with explicit success/error results; glyph output and real font database/shaping/rendering do not execute.',
            'Autonym proof stops after three inserts, not the whole startup/shared-tail body. Base flag1 transforms Friz/Morpheus; error logs and retains originals; flag0 copies Skurri.',
            '49 glyph table rows match source data, not a revalidation of the full augmentation algorithm, shaping, glyph geometry or generated-font output.',
            'Nine AS data payloads match historical 0.109.0 hashes; current callers were independently recovered. Binary data equality alone never revalidates old code/addresses.',
            'No binary font exported, source compilation, game, actual file/cache timing, dynamic aliases, rendered or original/rebuilt parity check. Original census/selector populations unchanged.'])
    encoded = json.dumps(result,ensure_ascii=False,indent=2)+'\n'
    if args.stage:
        (WORK/'font-inputs.json').write_text(encoded)
    else:
        assert KEEP.read_text() == encoded
    print(json.dumps(dict(valid_sfnt=len(fonts),source_glyph_rows=49,native_cases=len(cases),rejected_counterexamples=20)))


if __name__ == '__main__':
    main()
