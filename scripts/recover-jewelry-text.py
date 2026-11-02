#!/usr/bin/env python3
"""Recover current jewelry/Codex strings with bounded native formatting.

No compiler, client, layout engine, OS, save or game is run. --write updates only
selected source deltas/proof. Native arithmetic/branching uses actual PE data;
UTF-8 locale, allocation and Rust string services are explicit fixture seams.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
RANGES = [(0x14589e0e0, 0x14589e755), (0x14589e760, 0x14589ea98),
          (0x14589ec50, 0x14589ece4), (0x1458aa2a0, 0x1458aa3cd),
          (0x140305770, 0x1403058c7), (0x14027268f, 0x140272ef1),
          (0x14027302a, 0x140273037)]
ASSETS = ROOT / 'crates/azeroth-survivors-re/assets'
OUTPUT = ROOT / 'docs/analysis/evidence/0.112.0/jewelry/text-validation.json'
DELTA = ASSETS / 'jewelry-codex-0.112.0.json'


def module(name, path):
    result = load_script(name, path)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = module('jewelry_text_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    locales = module('codex_locale_reader', ROOT / 'scripts/recover-codex.py').embedded_locales(data, pe)
    probe = EquipmentProbe(data, pe, RANGES)
    rows = json.loads((ROOT / 'docs/analysis/evidence/0.112.0/jewelry/validation.json').read_text())['rows']
    base = json.loads((ASSETS / 'codex-locales-0.105.0.json').read_text())
    old_delta = json.loads((ASSETS / 'codex-locale-delta-0.109.0.json').read_text())['locales']
    for code, entries in old_delta.items():
        base[code].update(entries)
    structures = {r['key']: r for r in json.loads((ASSETS / 'codex-0.105.0.json').read_text())['entries']}
    changes, structures_changed, samples, cap_cases = {}, [], [], []
    cases, digest = 0, hashlib.sha256()
    for code, (locale, _) in locales.items():
        probe.locale = locale
        result = {}
        for index, definition in enumerate(rows):
            probe.cursor = probe.HEAP + 0x1000
            at = 0x146c00368 + index * 72
            probe.invoke(0x14589ec50, at)
            name = probe.text(probe.reg('RAX'), probe.reg('RDX'))
            row = dict(name=name, descriptions=[])
            none = probe.alloc(16)
            for rarity in range(5):
                probe.invoke(0x14589e0e0, at, rarity, none)
                magnitude = probe.reg('XMM0') & 0xffffffff
                out = probe.alloc(24)
                probe.invoke(0x14589e760, out, at, xmm2=magnitude)
                row['descriptions'].append(probe.pair(out + 8))
                cases += 1
                digest.update(probe.pair(out + 8).encode())
            probe.invoke(0x140305770, at)
            row['tag_label'] = probe.text(probe.reg('RAX'), probe.reg('RDX'))
            bp = probe.STACK + 0x100000
            probe.native.mem_write(bp - 0x100, bytes(0x900))
            probe.put(bp + 0x670, at)
            probe.reg('RBP', bp)
            probe.reg('RSP', bp - 0x80)
            probe.reg('R13', 0x145e07120)
            probe.stop = 0x140272ef1
            probe.native.emu_start(0x14027268f, 0, count=1000000)
            assert probe.reg('RIP') == probe.stop
            row['growth'] = probe.pair(bp + 0x608)
            cases += 1
            digest.update(row['growth'].encode())
            result[definition['key']] = row
            if code == 'en':
                item = dict(key=definition['key'], name=name, icon=definition['icon'],
                            group='trinkets' if definition['slot'] else 'rings', quality=0,
                            **{k: v for k, v in row.items() if k != 'name'})
                if structures[definition['key']] != item:
                    structures_changed.append(item)
        changes[code] = {key: row for key, row in result.items() if base[code].get(key) != row}
        samples.append(dict(code=code, name=result['star_of_mystaria']['name'],
                            descriptions=result['star_of_mystaria']['descriptions'],
                            growth=result['star_of_mystaria']['growth'], tag_label=result['star_of_mystaria']['tag_label']))
        at = 0x146c00998
        for magnitude in [0., 0.01, 0.74999, 0.749995, 0.75, 1., 10.]:
            amount_bits = struct.unpack('<I', struct.pack('<f', magnitude))[0]
            out = probe.alloc(24)
            probe.invoke(0x14589e760, out, at, xmm2=amount_bits)
            text = probe.pair(out + 8)
            if code == 'en':
                cap_cases.append(dict(amount_bits=amount_bits, text=text))
            digest.update(text.encode())
            cases += 1
    assert [row['key'] for row in structures_changed] == ['star_of_mystaria'], structures_changed
    delta = dict(target_sha256=SHA, after='soulstone', entry=structures_changed[0], locales=changes)
    spans = []
    for start, end in RANGES:
        at = pe.rva_offset(start - pe.image_base)
        spans.append(dict(address=hex(start), end_exclusive=hex(end),
                          sha256=hashlib.sha256(data[at:at + end - start]).hexdigest()))
    proof = dict(target=target, ranges=spans, native_cases=cases,
                 localized_jewelry_records=23 * 14, output_sha256=digest.hexdigest(),
                 locales=[x[1] for x in locales.values()], star_samples=samples, cap_cases=cap_cases,
                 host_calls=probe.calls, lookup_keys=sorted(probe.keys),
                 limits=['Exact selected x64 executes with the helper\'s declared allocation/format/string/locale seams.',
                         'All five fresh-rarity descriptions and actual Codex growth branches execute for 23 jewelry rows and 14 locales.',
                         'Full Codex, actual fonts/rendering/input, compilation and game/parity are unverified.'])
    for path, value in [(DELTA, delta), (OUTPUT, proof)]:
        if args.write:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')
        else:
            assert json.loads(path.read_text()) == value, path
    print(f'Checked {cases} native description/growth cases and 322 localized jewelry records; no compiler/game')


if __name__ == '__main__':
    main()
