#!/usr/bin/env python3
"""Verify current Armory badge instructions, text, admission and live source wiring.

No compiler, application, filesystem/save operation or renderer runs. --stage
writes reviewable evidence under runtime/; the default verifies curated evidence.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from equipment_native import EquipmentProbe

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
WORK = ROOT / 'runtime/analysis/history/inventory/armory-marks/3d405be0d7ba'
CURATED = ROOT / 'docs/analysis/evidence/armory-badges'
OWNERS = {'item-badges': (0x1402be5a0, 0x1402be839),
          'badge-text': (0x140304e60, 0x140305377)}
RANGES = {**OWNERS, 'worn-predicate': (0x140131a10, 0x140131a82)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Recover a new target before reusing these addresses'
    data = target_bytes(target)
    pe = load_script('badge_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(a, n):
        offset = pe.rva_offset(a - pe.image_base)
        return data[offset:offset + n]

    def span(a, b):
        return dict(address=hex(a), end_exclusive=hex(b), byte_count=b-a,
                    sha256=hashlib.sha256(raw(a, b-a)).hexdigest())

    class Probe(EquipmentProbe):
        def hook(self, uc, pc, size, unused):
            if pc == 0x140263620:
                at = self.reg('R8')
                self.node = bytes(uc.mem_read(at+8, 384))
                self.fill = bytes(uc.mem_read(at+472, 20))
                self.outline = bytes(uc.mem_read(at+392, 80))
                self.reg('RAX', self.reg('RCX'))
            elif pc == 0x145cf998b:
                uc.mem_write(self.reg('RCX'), bytes(uc.mem_read(self.reg('RDX'), self.reg('R8'))))
                self.reg('RAX', self.reg('RCX'))
            elif pc == 0x14027fc90:
                at = self.reg('RDX')
                self.text_row = bytes(uc.mem_read(at, 100))
                self.label = self.text(self.q(at+8), self.q(at+16))
                uc.emu_stop()
                return
            else:
                return super().hook(uc, pc, size, unused)
            sp = self.reg('RSP')
            self.reg('RSP', sp+8)
            self.reg('RIP', self.q(sp))

    probe = Probe(data, pe, [RANGES['badge-text'], RANGES['worn-predicate']])
    badges = []
    gold = raw(0x145efd948, 20)
    blue = raw(0x145efe2a0, 20)
    assert struct.unpack('<I4f', gold)[0] == 0
    for locale in sorted((ROOT/'crates/azeroth-survivors-re/assets/locales').glob('*.json')):
        labels = json.loads(locale.read_text())
        for key, right, fill in [('armory.mark_worn', True, gold), ('armory.mark_look', False, blue)]:
            label = labels[key]
            # Exact localized key/value pair is present in the selected image.
            assert json.dumps(key, ensure_ascii=False).encode() + b': ' + json.dumps(label, ensure_ascii=False).encode() in data
            h = probe.alloc(0x1000)
            font, text, color = h+0x100, h+0x300, h+0x400
            probe.put(font+8, font+0x100)
            probe.put(font+0x100, 1)
            probe.native.mem_write(text, label.encode())
            probe.native.mem_write(color, fill)
            sp = probe.STACK+0x1f0008
            probe.put(sp, probe.DONE)
            probe.put(sp+40, color, int(right))
            for name, value in [('RCX', h), ('RDX', font), ('R8', text), ('R9', len(label.encode())), ('RSP', sp)]:
                probe.reg(name, value)
            probe.native.emu_start(0x140304e60, 0, count=10000)
            assert probe.reg('RIP') == 0x14027fc90
            val = lambda at: list(struct.unpack_from('<If', probe.node, at))
            node = {k: val(at) for k, at in [('left',104),('right',112),('top',120),('width',136),('height',144)]}
            assert node == dict(left=[0,0.] if right else [1,-7.], right=[1,-7.] if right else [0,0.], top=[1,-7.], width=[1,18.], height=[1,18.])
            assert [val(248+i*8) for i in range(4)] == [[1,1.]]*4
            assert [val(280+i*8) for i in range(4)] == [[2,50.]]*4
            assert [probe.node[i] for i in [371,378,381]] == [1,5,5]
            black = struct.pack('<I4f', 1, 0.,0.,0.,1.)
            assert probe.outline == black*4 and probe.fill == fill
            assert struct.unpack_from('<f',probe.text_row,72)[0] == 11.
            assert probe.text_row[80:100] == black and probe.label == label
            badges.append(dict(locale=locale.stem,key=key,label=label,right=right,node=node,fill_hex=fill.hex()))
    assert len(badges) == 28
    assert json.loads((ROOT/'crates/azeroth-survivors-re/assets/locales/en.json').read_text())['armory.mark_worn'] == 'E'

    admission = []
    for position in range(-1,19):
        for item in [0,101010,0xffffffff]:
            gear = probe.alloc(0x200)
            values = [0]*19
            if position >= 0:
                values[position] = item
            probe.native.mem_write(gear+0xc8, struct.pack('<19I',*values))
            probe.invoke(0x140131a10, gear, item)
            found = bool(probe.reg('RAX') & 255)
            assert found == (item != 0 and position >= 0)
            admission.append(dict(position=position,item=item,found=found))

    source = (ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
    body = source[source.index('fn piece_badge('):source.index('fn piece_icon(')]
    for token in ['top: Val::Px(-7.)','Val::Px(18.)','Val::Percent(50.)', 'UiRect::all(Val::Px(1.))', 'AlignItems::Center','JustifyContent::Center','BackgroundColor(color)', 'BorderColor::all(Color::BLACK)', 'font_size: 11.', 'TextColor(Color::BLACK)', 'FocusPolicy::Pass']:
        assert token in body, token
    cells = source[source.index('fn piece_icon('):source.index('pub fn shell_node()')]
    assert cells.count('piece_badge(') == 2
    for token in ['gear.worn(class, p.slot) == Some(p.id)', 'gear.cosmetic(class, p.slot) == Some(p.id)', 'menu_catalog.label("armory.mark_worn")','menu_catalog.label("armory.mark_look")','state.dirty = true;', 'if persist {', 'state.queue_gear(class);']:
        assert token in source, token

    directory = WORK/'staged' if args.stage else CURATED
    digest = lambda rows: hashlib.sha256(json.dumps(rows, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest()
    cases = dict(
        badge_count=len(badges), badge_sha256=digest(badges),
        localized_labels={row['locale']: {item['key']: item['label'] for item in badges if item['locale'] == row['locale']} for row in badges},
        right_node=next(row['node'] for row in badges if row['right']),
        left_node=next(row['node'] for row in badges if not row['right']),
        admission_count=len(admission), admission_sha256=digest(admission),
    )
    if args.stage:
        directory.mkdir(parents=True,exist_ok=True)
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64
        decoder = Cs(CS_ARCH_X86, CS_MODE_64)
        for name,(a,b) in RANGES.items():
            instructions=list(decoder.disasm(raw(a,b-a),a))
            assert sum(i.size for i in instructions)==b-a
            (directory/f'{name}.asm').write_text('\n'.join(f'{i.address:016x}: {i.mnemonic} {i.op_str}'.rstrip() for i in instructions)+'\n')
        owners=[]
        for role,(a,b) in OWNERS.items():
            evidence=json.loads((WORK/f'rea-{role}/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
            assert evidence['provider']['id']=='ghidra' and evidence['subject']['digest']['sha256']==span(a,b)['sha256']
            owners.append(dict(role=role,rea_evidence_id=evidence['evidence_id'],analysis_profile_digest=evidence['analysis_profile']['digest'],**span(a,b)))
        manifest=dict(target=target,application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,owners=owners,ranges=[dict(role=role,assembly=role+'.asm',**span(a,b))for role,(a,b)in RANGES.items()],data=[dict(bytes_hex=raw(a,n).hex(),**span(a,a+n))for a,n in [(0x145efd948,20),(0x145efe2a0,20),(0x145efe174,16),(0x145efe1ac,16)]],limits=['Original instructions use synthetic parent/font handles and explicit allocation, byte-copy and ECS/text-publication seams.','Native Node offsets are the existing shared384-byte Bevy layout; current stores and produced values are checked independently.','Admission checks cover all19 lanes, zero/missing IDs, SIMD and scalar tails. Valid source projection retains only owned IDs in their catalog slot.','No Rust execution, layout/picking/GPU, save IO, application build or original/rebuilt comparison.'])
        for row in manifest['ranges']:
            row['assembly_sha256'] = hashlib.sha256((directory/row['assembly']).read_bytes()).hexdigest()
        (directory/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
        (directory/'cases.json').write_text(portable_json(cases,indent=2,ensure_ascii=False)+'\n')
    else:
        manifest=json.loads((directory/'manifest.json').read_text())
        assert manifest['target']==target
        for row in manifest['ranges']+manifest['data']:
            assert span(int(row['address'],16),int(row['end_exclusive'],16))['sha256']==row['sha256']
            if 'assembly_sha256' in row:
                assert hashlib.sha256((directory/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
        assert portable_record(json.loads((directory/'cases.json').read_text()))==portable_record(cases)
    print(f'Passed {len(badges)} native localized badge constructors and {len(admission)} native worn-ID cases; source wiring checked; no compiler/game.')

if __name__ == '__main__':
    main()
