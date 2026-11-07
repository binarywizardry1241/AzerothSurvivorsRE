#!/usr/bin/env python3
"""Bounded current starter data/getter, cosmetic admission and UI action proof.

No original/rebuilt application, OS save, client, renderer or compiler runs.
Descriptor ID/slot is a seam bound to independently read current native records;
ordinary-item ownership rejection, memcpy and command publication are seams.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
from coverage_common import latest_target, target_bytes
from equipment_native import EquipmentProbe
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_MEM, X86_REG_RIP, X86_REG_R13

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--write', action='store_true', help='Refresh curated vectors after reviewing native changes')
args = parser.parse_args()

SHA = '507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293'
target = latest_target(verify=True)
assert target['sha256'] == SHA
data = target_bytes(target)
EVIDENCE = ROOT / 'docs/analysis/evidence/0.117.0/starting-clothes'
manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
assert manifest['target']['sha256'] == SHA
spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
STARTER, DESCRIPTOR, PROJECTOR, SETTER = 0x145ab5910, 0x145ab5be0, 0x145ac28d0, 0x145ac3120
MEMCPY, ORDINARY, COMMAND = 0x145f93cdb, 0x145ac20b0, 0x1400885e0
MUTATION, MUTATION_END = 0x1402498ba, 0x140249934
METADATA, FACTION = 0x145ab6630, 0x145ab8d10
FORMAT, LOOKUP = 0x145f66a30, 0x145b29c00
FOOTER_COLOR, FOOTER_PUBLISH = 0x14031c3a4, 0x14031c515

def raw(at, count):
    offset = pe.rva_offset(at - pe.image_base)
    return data[offset:offset + count]

def span(at, end):
    return {'va': hex(at), 'end_exclusive': hex(end),
            'sha256': hashlib.sha256(raw(at, end - at)).hexdigest()}

for extract in manifest['assembly']:
    assert hashlib.sha256((EVIDENCE / extract['file']).read_bytes()).hexdigest() == extract['file_sha256']
    for row in extract['ranges']:
        start, end = int(row['va'], 16), int(row['end_exclusive'], 16)
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256']
for key in ('canonical_look_evidence', 'canonical_look_pseudocode', 'canonical_parent_pseudocode'):
    assert (EVIDENCE / manifest[key]).is_file(), key

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
instructions = list(md.disasm(raw(DESCRIPTOR, ends[DESCRIPTOR] - DESCRIPTOR), DESCRIPTOR))
record_addresses = sorted({ins.address + ins.size + ins.operands[1].mem.disp
                          for ins in instructions if ins.mnemonic == 'lea'
                          and ins.operands[0].reg == X86_REG_R13
                          and ins.operands[1].type == X86_OP_MEM
                          and ins.operands[1].mem.base == X86_REG_RIP})
assert len(record_addresses) == 66
slot_instruction = next(ins for ins in instructions if ins.address == 0x145ab6015)
slot_address = slot_instruction.address + slot_instruction.size + slot_instruction.operands[1].mem.disp
slot_map = raw(slot_address, 23)
items = []
for at in record_addresses:
    pointer, length, item, display, inv, kind, subtype, sheath = struct.unpack('<QQ6I', raw(at, 40))
    items.append({'id': item, 'name': raw(pointer, length).decode(), 'display_id': display,
                  'inventory_type': inv, 'item_class': kind, 'item_subclass': subtype,
                  'sheath': sheath, 'slot_id': slot_map[inv - 1] if 1 <= inv <= 23 else 17})
base = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory.json').read_text())
assert items == base['starter_items']
item_map = {row['id']: row for row in items}
expected = {(row['race'], row['class']): row['slots'].copy() for row in base['starters']}
for (race, cls), slots in expected.items():
    if cls == 3:
        slots[15] = 0  # The actual embedded source catalog's documented correction.

class Probe(EquipmentProbe):
    def hook(self, uc, pc, size, unused):
        if pc == self.stop:
            self.native.emu_stop()
            return
        if pc == DESCRIPTOR and not getattr(self, 'execute_descriptor', False):
            pass
        elif any(start <= pc and pc + size <= end for start, end in self.ranges):
            return
        rcx, rdx, r8 = (self.reg(name) for name in ('RCX', 'RDX', 'R8'))
        if pc == DESCRIPTOR and not getattr(self, 'execute_descriptor', False):
            row = item_map[rdx]
            self.native.mem_write(rcx, bytes(112))
            self.native.mem_write(rcx + 80, struct.pack('<I', rdx))
            self.native.mem_write(rcx + 104, bytes([row['slot_id']]))
            self.reg('RAX', rcx)
        elif pc == MEMCPY:
            self.native.mem_write(rcx, bytes(self.native.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc == ORDINARY:
            self.reg('RAX', 0)  # No collection ownership or ordinary item is supplied.
        elif pc == COMMAND:
            self.commands.append(bytes(self.native.mem_read(rdx, 232)))
        elif pc == FORMAT:
            assert bytes(self.native.mem_read(rdx, 11)) == b'\x08starter.\xc0\x00'
            pointer, formatter = self.q(r8), self.q(r8 + 8)
            assert formatter == 0x145f784e0
            item = struct.unpack('<I', self.native.mem_read(pointer, 4))[0]
            self.output(rcx, f'starter.{item}')
        elif pc == LOOKUP:
            key = self.text(rcx, rdx)
            self.lookup_keys.append(key)
            value = self.current_labels.get(key)
            if value is None:
                self.reg('RAX', 0)
            else:
                encoded = value.encode()
                pointer = self.alloc(len(encoded))
                self.native.mem_write(pointer, encoded)
                self.reg('RAX', pointer)
                self.reg('RDX', len(encoded))
        else:
            return super().hook(uc, pc, size, unused)
        sp = self.reg('RSP')
        self.reg('RIP', self.q(sp))
        self.reg('RSP', sp + 8)

probe = Probe(data, pe, [(STARTER, ends[STARTER]), (PROJECTOR, ends[PROJECTOR]),
                         (SETTER, ends[SETTER]), (MUTATION, MUTATION_END),
                         (DESCRIPTOR, ends[DESCRIPTOR]), (METADATA, ends[METADATA]),
                         (FACTION, FACTION + 0x69), (FOOTER_COLOR, FOOTER_PUBLISH)])
output, record, owned = probe.HEAP + 0x100, probe.HEAP + 0x500, probe.HEAP + 0x800
baselines = []
for race, cls in sorted(expected):
    probe.invoke(STARTER, output, race, cls)
    slots = list(struct.unpack('<19I', probe.native.mem_read(output, 76)))
    assert slots == expected[race, cls], (race, cls, slots, expected[race, cls])
    baselines.append({'race': race, 'class': cls, 'slots': slots})

admission = []
for baseline in baselines:
    race, cls = baseline['race'], baseline['class']
    for slot, starter in enumerate(baseline['slots']):
        for value in (None, 0, starter, 0xffff0000 + slot):
            before = bytearray(232)
            before[228] = cls
            if value is not None:
                struct.pack_into('<II', before, slot * 8, 1, value)
            probe.native.mem_write(record, bytes(before))
            probe.reg('R9', 0)
            probe.native.mem_write(probe.STACK + 0x1f0008 + 40, bytes([race]))
            probe.invoke(PROJECTOR, output, record, owned)
            result = bytes(probe.native.mem_read(output, 232))
            present, actual = struct.unpack_from('<II', result, slot * 8)
            accepted = value is not None and (value == 0 or value == starter)
            assert bool(present) == accepted, (race, cls, slot, value, present, actual)
            if accepted:
                assert actual == value
            assert result[228] == cls and result[152:228] == bytes(76)
            admission.append([race, cls, slot, value, actual if present else None])

actions = []
bp, action, save, rows, tick = probe.STACK + 0x100000, probe.HEAP + 0x1000, probe.HEAP + 0x2000, probe.HEAP + 0x3000, probe.HEAP + 0x4000
for baseline in baselines:
    race, cls = baseline['race'], baseline['class']
    for slot, starter in enumerate(baseline['slots']):
        if not starter:
            continue
        before = bytearray(232)
        before[228] = cls
        for other in range(19):
            struct.pack_into('<II', before, other * 8, 1, 0x10000 + other)
        probe.native.mem_write(bp - 0x58, bytes(before))
        probe.native.mem_write(action, struct.pack('<IIB', 1, starter, slot) + bytes(7))
        probe.put(bp + 0x178, tick)
        probe.native.mem_write(bp + 0x18c, struct.pack('<I', 31))
        probe.put(bp + 0x1a8, save)
        probe.put(bp + 0x1f8, probe.HEAP + 0x5000)
        probe.put(save + 0x48, 1, rows, 0)
        probe.reg('RBP', bp)
        probe.reg('RSI', action)
        probe.reg('RAX', 1)
        probe.reg('R15', 0x2468)
        probe.reg('RSP', bp - 0x1000)
        probe.commands = []
        probe.stop = MUTATION_END
        probe.native.emu_start(MUTATION, 0, count=10000)
        assert probe.reg('RIP') == MUTATION_END
        after = bytearray(before)
        struct.pack_into('<II', after, slot * 8, 1, starter)
        assert bytes(probe.native.mem_read(bp - 0x58, 232)) == after
        assert probe.q(save + 0x58) == 1
        assert bytes(probe.native.mem_read(rows, 232)) == after
        assert probe.commands == [after]
        actions.append([race, cls, slot, starter])

names = []
probe.execute_descriptor = True
for language in ('en', 'de', 'fallback'):
    probe.current_labels = {} if language == 'fallback' else json.loads(
        (ROOT / f'crates/azeroth-survivors-re/assets/locales/{language}.json').read_text())
    for item in items:
        probe.lookup_keys = []
        probe.invoke(METADATA, output, item['id'])
        key = f"starter.{item['id']}"
        name = probe.pair(output + 8)
        quality = probe.q(output + 48)
        assert name == probe.current_labels.get(key, item['name'])
        assert quality == 0 and probe.lookup_keys == [key]
        names.append([language, item['id'], key, name, quality])
factions = []
for race in range(1, 9):
    for item in items:
        probe.invoke(FACTION, item['id'], race)
        assert probe.reg('RAX') == item['id']
        factions.append([race, item['id']])

probe.stop = FOOTER_PUBLISH
probe.native.mem_write(bp - 0x100, bytes(0x700))
style, counter = probe.HEAP + 0x7000, probe.HEAP + 0x7100
probe.native.mem_write(style, bytes(24))
probe.put(style + 8, counter)
probe.put(counter, 1)
for name, value in [('RBP', bp), ('RSP', bp - 0x1000), ('R14', 0), ('RBX', style)]:
    probe.reg(name, value)
probe.native.emu_start(FOOTER_COLOR, 0, count=10000)
assert probe.reg('RIP') == FOOTER_PUBLISH
footer_color = struct.unpack('<I4f', probe.native.mem_read(bp + 0x2e8, 20))
assert footer_color == (0, *([struct.unpack('<f', struct.pack('<f', .91))[0]] * 3), 1.0)

result = {'target_sha256': SHA,
          'ranges': [span(at, ends[at]) for at in (STARTER, DESCRIPTOR, PROJECTOR, SETTER, METADATA)] + [span(MUTATION, MUTATION_END), span(FACTION, FACTION + 0x69), span(FOOTER_COLOR, FOOTER_PUBLISH)],
          'starter_records': [dict(span(at, at + 40), item_id=row['id']) for at, row in zip(record_addresses, items)],
          'slot_map': span(slot_address, slot_address + 23),
          'baselines': baselines, 'admission_cases': len(admission),
          'admission_sha256': hashlib.sha256(json.dumps(admission, separators=(',', ':')).encode()).hexdigest(),
          'action_cases': len(actions), 'actions': actions,
          'name_cases': names, 'faction_cases': len(factions), 'footer_starter_color': list(footer_color),
          'limits': ['Native instruction replay only; no original/rebuilt app, compilation, file save, UI, renderer, input scheduling or parity runs.',
                     'Starter descriptor fixture supplies ID and slot from all66 independently checked current records; allocation/name/locale/effect-disposal internals do not run.',
                     'No ordinary items or earned cosmetics are supplied; ordinary-item validator returns false, while actual starter/zero branches and final native row projection run.',
                     'UI action replay starts at the Look branch with an admitted action payload; actual native mutation,232-byte row setter and queued command call run with byte-copy and command-capture fixtures.',
                     'Name replay executes current generic metadata dispatch and starter descriptor. Exact starter.ID format construction and locale lookup are explicit fixtures, including absence/fallback; source/native locale-loader execution is not certified.',
                     'Footer color replay starts with native starter quality0 and opaque UI style/text inputs, stopping before UI publication. Field tag0 is interpreted using the existing UI color enum interface.']}
path = EVIDENCE / 'vectors.json'
if args.write:
    path.write_text(json.dumps(result, indent=2) + '\n')
else:
    assert hashlib.sha256(path.read_bytes()).hexdigest() == manifest['vectors']['sha256']
    assert json.loads(path.read_text()) == result, 'Current native results differ from curated starting-clothes vectors'

# These guards trace the repaired live source consumers; they do not execute
# Rust or replace the independent native fixture population above.
source = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
compact = lambda text: re.sub(r'\s+', '', text)
look = compact(source.split('fn look(', 1)[1].split('\nfn time(', 1)[0])
setter = compact(source.split('pub fn set_look(', 1)[1].split('fn secondary_piece(', 1)[0])
assert 'catalog.starter_look(*race,class,native_slot(class,slot))==Some(id)' in setter
assert 'ifid!=0&&!starter&&!granted_cosmetic' in setter
assert '.starter_look(*race,class,slot)==Some(id)' in compact(source)
assert 'ifletSome(id)=catalog.starter_look(state.race,state.class_id(),native_slot(state.class_id(),slot),' in look
clothes = look.split('menu_catalog.label("armory.look_clothes")', 1)[1]
assert 'ArmoryAction::Look(slot,Some(id))' in clothes.split('menu_catalog.label("armory.look_hidden")', 1)[0]
assert 'ArmoryAction::Look(slot,Some(0))' in clothes.split('menu_catalog.label("armory.look_hidden")', 1)[1]
assert 'ArmoryAction::Look(slot,None)' in look
assert 'matches!(slot,2|3|4|5|6|7)' not in look
assert 'translated(labels,&format!("starter.{}",item.id),&item.name)' in compact(source)
assert 'catalog.starter_items.iter().find(|item|item.id==id)' in look
assert 'starter_name(menu_catalog,item).into(),Color::srgb(0.91,0.91,0.91)' in look
assert 'starting_clothes_hidden_and_worn_roundtrip_without_collection_ownership' in source
print(f'Current66 starter records; {len(baselines)} native/source outfits; {len(admission)} projection; {len(actions)} action/account/command; {len(names)} names; {len(factions)} faction cases; starter footer color pass')
