#!/usr/bin/env python3
"""Check the recovered RaceTip footer without compiling or launching a game.

Original instructions run in synthetic memory. Class naming, localization,
formatting, allocation/copy and text-widget construction are observed seams.
The source assertions check the live consumer; Rust and rendering do not run.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe
from script_sources import load_script

SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
START, END = 0x1402f97e9, 0x1402f9b3c
HINT = 'Open it to every class on the Rewards tab, under Races.'
KEEP = ROOT / 'docs/analysis/evidence/0.120.0/race-hover'


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


class Footer(EquipmentProbe):
    def hook(self, _, pc, size, unused):
        if pc == END:
            self.native.emu_stop()
            return
        if START <= pc and pc + size <= END:
            self.instructions += 1
            return
        rcx, rdx, r8, r9 = (self.reg(k) for k in ('RCX', 'RDX', 'R8', 'R9'))
        if pc == 0x145a83360:
            assert rcx == self.class_id
            self.reg('RAX', rcx)
        elif pc == 0x145a7e960:
            assert rcx == self.class_id
            raw = self.class_name.encode()
            at = self.alloc(len(raw))
            self.native.mem_write(at, raw)
            self.reg('RAX', at)
            self.reg('RDX', len(raw))
        elif pc == 0x145b55140:
            key = self.text(rdx, r8)
            assert key == 'armory.not_open_to'
            assert self.pair(r9) == 'class'
            assert self.pair(self.q(r9 + 16)) == self.class_name
            assert self.q(self.reg('RSP') + 40) == 1
            self.events.append(('format', key))
            self.output(rcx, self.locale[key].replace('{class}', self.class_name))
        elif pc == 0x145b550e0:
            key = self.text(rcx, rdx)
            assert key == HINT
            self.events.append(('localize', key))
            raw = self.locale.get(key, key).encode()
            at = self.alloc(len(raw))
            self.native.mem_write(at, raw)
            self.reg('RAX', at)
            self.reg('RDX', len(raw))
        elif pc == 0x140002200:
            pass
        elif pc == 0x1400021c0:
            assert rdx == 1
            self.reg('RAX', self.alloc(rcx))
        elif pc == 0x145fa3aab:
            self.native.mem_write(rcx, bytes(self.native.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc == 0x1402a96d0:
            text = self.text(self.q(r8 + 16), self.q(r8 + 24))
            size = struct.unpack('<f', self.native.mem_read(r8 + 0x50, 4))[0]
            weight = struct.unpack('<H', self.native.mem_read(r8 + 0x54, 2))[0]
            color = struct.unpack('<4f', self.native.mem_read(r8 + 0x5c, 16))
            self.events.append(('text', text))
            self.widgets.append(dict(text=text, font_size=size, weight=weight,
                                     color=list(color)))
        else:
            raise AssertionError(f'Unreviewed footer call {pc:#x}')
        sp = self.reg('RSP')
        self.reg('RIP', self.q(sp))
        self.reg('RSP', sp + 8)

    def run(self, allowed, class_id, class_name, locale, shared_font):
        self.cursor = self.HEAP + 0x1000
        self.events, self.widgets = [], []
        self.class_id, self.class_name, self.locale = class_id, class_name, locale
        frame = self.STACK + 0x10000
        self.native.mem_write(frame - 0x100, bytes(0x900))
        flag, save, save_ref, font_ref, font, header = [self.alloc(0x100) for _ in range(6)]
        self.native.mem_write(flag, bytes([allowed]))
        self.native.mem_write(save + 0x38, bytes([class_id]))
        self.put(save_ref, save)
        self.put(font_ref, font)
        self.native.mem_write(font, bytes([0 if shared_font else 1]))
        self.put(font + 8, header)
        self.put(header, 1)
        self.put(frame + 0x350, flag)
        self.put(frame + 0x348, save_ref)
        for name, value in [('RBP', frame), ('RSP', self.STACK + 0x180000),
                            ('RBX', font_ref), ('RDI', 0), ('XMM7', 0), ('XMM8', 0)]:
            self.reg(name, value)
        self.native.emu_start(START, 0, count=1000)
        assert self.reg('RIP') == END
        if allowed:
            assert self.events == [] and self.widgets == []
            return
        restriction = locale['armory.not_open_to'].replace('{class}', class_name)
        hint = locale.get(HINT, HINT)
        assert self.events == [('format', 'armory.not_open_to'), ('text', restriction),
                               ('localize', HINT), ('text', hint)]
        for widget, rgb in zip(self.widgets, [(1., .353, .235), (.725, .663, .510)]):
            assert widget['font_size'] == 12. and widget['weight'] == 400
            assert all(abs(a - b) < 0.000001 for a, b in zip(widget['color'], (*rgb, 1.))), widget


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--native-only', action='store_true', help='skip source/dependency assertions')
    parser.add_argument('--queries', action='store_true', help='verify retained durable Ghidra results')
    parser.add_argument('--write', action='store_true', help='save the compact reviewed check result')
    args = parser.parse_args()
    assert not (args.native_only and args.write), 'Publish only a full source/native check'
    target = latest_target(verify=True)
    assert target['version'] == '0.120.0' and target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('race_hover_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    proof = json.loads((KEEP / 'contract.json').read_text())
    assert proof['target']['sha256'] == SHA
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    picker_path = ROOT / proof['picker_contract']
    picker = json.loads(picker_path.read_text())
    assert picker['target']['sha256'] == SHA
    rows = proof['native_ranges'] + [dict(row, assembly=(picker_path.parent / row['assembly']).relative_to(ROOT).as_posix())
                                      for row in picker['native_ranges']]
    instructions = 0
    for row in rows:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert sha(raw) == row['sha256']
        decoded = list(md.disasm(raw, start))
        assert sum(i.size for i in decoded) == len(raw)
        assembly = '\n'.join(f'{i.address:016x}  {i.bytes.hex():22s} {i.mnemonic} {i.op_str}'.rstrip()
                             for i in decoded) + '\n'
        assert (ROOT / row['assembly']).read_text() == assembly
        instructions += len(decoded)
    queries = proof['queries'] + picker['queries']
    for query in queries:
        raw_input = query['native_input']
        start, end = int(raw_input['start'], 16), int(raw_input['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert sha(image[offset:offset + end - start]) == raw_input['sha256']
        if args.queries:
            for key in ('plan', 'journal', 'result'):
                receipt = query[key]
                assert sha((ROOT / receipt['path']).read_bytes()) == receipt['sha256']
            assert json.loads((ROOT / query['journal']['path']).read_text())['status'] == 'completed'
            evidence = json.loads((ROOT / query['result']['path']).read_text())['structuredContent']
            assert evidence['evidence_id'] == query['evidence_id']
            assert evidence['provider']['id'] == 'ghidra'
            assert evidence['subject']['digest']['sha256'] == raw_input['sha256']
            assert evidence['parameters']['procedure'] == query['procedure']
            assert evidence['analysis_profile']['digest'] == query['analysis_profile_digest']
            assert sha(evidence['normalized_result'].encode()) == query['normalized_result_sha256']
    literal = proof['hint_literal']
    offset = pe.rva_offset(int(literal['va'], 16) - pe.image_base)
    assert image[offset:offset + len(HINT.encode())] == HINT.encode()
    probe = Footer(image, pe, [(START, END)])
    probe.instructions = 0
    catalogs = {p.stem: json.loads(p.read_text()) for p in
                sorted((ROOT / 'crates/azeroth-survivors-re/assets/locales').glob('*.json'))}
    assert len(catalogs) == 14
    if not args.native_only:
        locale_proof = json.loads((ROOT / 'docs/analysis/evidence/0.120.0/race-locales/manifest.json').read_text())
        assert locale_proof['target']['sha256'] == SHA and len(locale_proof['locales']) == 14
        for row in locale_proof['locales']:
            payload = row['payload']
            offset = pe.rva_offset(int(payload['virtual_address'], 16) - pe.image_base)
            raw = image[offset:offset + payload['byte_count']]
            assert sha(raw) == payload['sha256']
            assert json.loads(raw)[HINT] == catalogs[row['code']][HINT]
    classes = [('warrior', 1), ('paladin', 2), ('hunter', 3), ('rogue', 4),
               ('priest', 5), ('shaman', 7), ('mage', 8), ('warlock', 9), ('druid', 11)]
    cases = 0
    for locale in catalogs.values():
        if not args.native_only:
            assert HINT in locale
        for key, class_id in classes:
            for shared_font in (False, True):
                for allowed in (0, 1):
                    probe.run(allowed, class_id, locale[f'class.{key}.name'], locale, shared_font)
                    cases += 1
    for allowed in range(256):
        for shared_font in (False, True):
            probe.run(allowed, 1, 'Warrior', catalogs['en'], shared_font)
            cases += 1
    sources = []
    if not args.native_only:
        source_paths = ['crates/azeroth-survivors-re/src/armory/race_tip.rs',
                        'crates/azeroth-survivors-re/src/save.rs',
                        'crates/azeroth-survivors-re/src/catalog.rs',
                        'crates/azeroth-survivors-re/src/localization.rs',
                        'crates/azeroth-survivors-re/src/armory.rs',
                        'crates/azeroth-survivors-re/src/menu.rs']
        tip, save, catalog, localization, armory, menu = [(ROOT / p).read_text() for p in source_paths]
        gate = 'if !state.save.allowed_races(class).contains(&race_id) {'
        assert gate in tip and 'crate::save::allowed_races(class)' not in tip
        footer = tip[tip.index(gate):]
        assert footer.index('armory.not_open_to') < footer.index(HINT)
        assert '12.,\n                        crate::menu::MUTED,\n                        false,' in footer
        assert '!state.is_changed()' in tip and '!catalog.is_changed()' in tip
        assert 'pub fn allowed_races(&self, class: u8)' in save
        assert 'self.purchased_races()' in save
        assert 'self.labels.get(key).map(String::as_str).unwrap_or(key)' in catalog
        assert 'translated.labels.extend(self.catalogs[self.index].clone())' in localization
        assert 'pub const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);' in menu
        text_consumer = armory[armory.index('fn flow_text('):armory.index('fn flow_icon(')]
        assert 'Text::new(text.into())' in text_consumer
        assert 'art.font.clone()' in text_consumer and 'font_size: size' in text_consumer
        sources = [dict(path=p, sha256=sha((ROOT / p).read_bytes())) for p in source_paths]
        sources.extend(dict(path=p.relative_to(ROOT).as_posix(), sha256=sha(p.read_bytes()))
                       for p in sorted((ROOT / 'crates/azeroth-survivors-re/assets/locales').glob('*.json')))
    result = dict(target_sha256=SHA, native_cases=cases, original_instructions=instructions,
                  executed_instructions=probe.instructions, locales=14, classes=9,
                  source_checked=not args.native_only, source_receipts=sources,
                  durable_queries_verified=len(queries) if args.queries else 0,
                  native_hint_translations=0 if args.native_only else len(catalogs),
                  seams=['Class naming and existing token formatter.',
                         'Selected/English/key lookup; supplied exact catalog values.',
                         'Font reference, allocation/copy and text-widget publication.'],
                  compilation=False, source_executed=False, target_executed=False,
                  renderer_executed=False, parity_verified=False)
    if args.write:
        (KEEP / 'check.json').write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k != 'source_receipts'}, indent=2))


if __name__ == '__main__':
    main()
