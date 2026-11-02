#!/usr/bin/env python3
"""Selected 0.120.0 race data and starter contract; no game or compilation."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path[:0] = [str(ROOT / 'scripts'), str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs')]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_MEM, X86_REG_RIP, X86_REG_R13
from equipment_native import EquipmentProbe

HERE = ROOT / 'docs/analysis/evidence/0.120.0/race-run-carry'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--queries', action='store_true', help='Verify retained ignored query journals/results as well')
args = parser.parse_args()
SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
from coverage_common import latest_target, target_bytes
target = latest_target(verify=True)
assert target['version'] == '0.120.0' and target['sha256'] == SHA
data = target_bytes(target)
assert hashlib.sha256(data).hexdigest() == SHA
spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
records = []

def raw(at, size):
    offset = pe.rva_offset(at - pe.image_base)
    return data[offset:offset + size]

def span(role, at, end):
    content = raw(at, end - at)
    result = dict(role=role, va=hex(at), end_exclusive=hex(end), sha256=hashlib.sha256(content).hexdigest())
    records.append(result)
    return result

def text(at):
    pointer, size = struct.unpack('<QQ', raw(at, 16))
    return raw(pointer, size).decode()

def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]

fields = ['health_multiplier', 'damage_bonus', 'cooldown_divisor', 'move_bonus', 'crit_bonus',
          'armor_bonus', 'regeneration_bonus', 'pickup_multiplier', 'experience_multiplier',
          'gold_multiplier', 'luck_bonus', 'heal_on_kill']
source_races = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text())['races']
races = []
for index, expected in enumerate(source_races):
    at = 0x146f79f68 + index * 88
    span('race-descriptor', at, at + 88)
    pointer, count = struct.unpack('<QQ', raw(at + 32, 16))
    span('race-passives', pointer, pointer + count * 8)
    effects = list(struct.iter_unpack('<If', raw(pointer, count * 8)))
    actual = {field: float(field in ['health_multiplier', 'cooldown_divisor', 'pickup_multiplier',
                                   'experience_multiplier', 'gold_multiplier']) for field in fields}
    for tag, amount in effects:
        actual[fields[tag]] = f32(actual[fields[tag]] + amount)
    assert all(struct.pack('<f', actual[key]) == struct.pack('<f', expected[key]) for key in fields)
    assert text(at + 48) == expected['racial_ability_key']
    assert raw(at + 80, 1)[0] == expected['native_id']
    races.append(dict(id=expected['native_id'], racial=text(at + 48), passives=effects, fields=actual))

STARTER, DESCRIPTOR = 0x145af68d0, 0x145af6ba0
for name, at in [('starter-getter', STARTER), ('starter-descriptor', DESCRIPTOR)]:
    span(name, at, ends[at])
instructions = list(md.disasm(raw(DESCRIPTOR, ends[DESCRIPTOR] - DESCRIPTOR), DESCRIPTOR))
record_addresses = sorted({ins.address + ins.size + ins.operands[1].mem.disp
    for ins in instructions if ins.mnemonic == 'lea' and ins.operands[0].reg == X86_REG_R13
    and ins.operands[1].type == X86_OP_MEM and ins.operands[1].mem.base == X86_REG_RIP})
assert len(record_addresses) == 66
ins = next(ins for ins in instructions if ins.address == 0x145af6fd5)
slot_at = ins.address + ins.size + ins.operands[1].mem.disp
slot_map = raw(slot_at, 23)
span('starter-slot-map', slot_at, slot_at + 23)
items = []
for at in record_addresses:
    span('starter-item', at, at + 40)
    pointer, size, item, display, inv, kind, subtype, sheath = struct.unpack('<QQ6I', raw(at, 40))
    items.append(dict(id=item, name=raw(pointer, size).decode(), display_id=display,
                      inventory_type=inv, item_class=kind, item_subclass=subtype, sheath=sheath,
                      slot_id=slot_map[inv - 1] if 1 <= inv <= 23 else 17))
catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory.json').read_text())
assert items == catalog['starter_items']
item_map = {row['id']: row for row in items}

class Probe(EquipmentProbe):
    def hook(self, uc, pc, size, unused):
        if pc == DESCRIPTOR:
            rcx, rdx = self.reg('RCX'), self.reg('RDX')
            row = item_map[rdx]
            self.native.mem_write(rcx, bytes(112))
            self.native.mem_write(rcx + 80, struct.pack('<I', rdx))
            self.native.mem_write(rcx + 104, bytes([row['slot_id']]))
            self.reg('RAX', rcx)
            sp = self.reg('RSP')
            self.reg('RIP', self.q(sp))
            self.reg('RSP', sp + 8)
            return
        super().hook(uc, pc, size, unused)

probe = Probe(data, pe, [(STARTER, ends[STARTER])])
outfits = []
assert len(catalog['starters']) == 72
for row in catalog['starters']:
    expected = row['slots'].copy()
    if row['class'] == 3:
        expected[15] = 0
    output = probe.HEAP + 0x100
    probe.invoke(STARTER, output, row['race'], row['class'])
    actual = list(struct.unpack('<19I', probe.native.mem_read(output, 76)))
    assert actual == expected, (row['race'], row['class'], actual, expected)
    outfits.append(dict(race=row['race'], class_id=row['class'], slots=actual))

for name, a, e in [('stat-refresh', 0x145b7de20, 0x145b7ee40),
                   ('constructor', 0x145b88390, 0x145b89a6d),
                   ('entry-outfit', 0x145af7160, 0x145af74f4)]:
    span(name, a, e)
span('stat-race-pointer-table', 0x1475f7ac0, 0x1475f7af8)
span('stat-class-pointer-table', 0x1475f7b38, 0x1475f7b88)
span('stat-racial-dispatch', 0x1475f7c64, 0x1475f7c94)
stat_probe = Probe(data, pe, [(0x145b7de20, 0x145b7ee40)])
game = stat_probe.HEAP + 0x100
entry = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text())
classes = {row['id']: row for row in entry['classes']}
stat_cases = []
for cls, class_row in classes.items():
    for race_row in source_races:
        for level in [1, 2, 37, 99]:
            stat_probe.native.mem_write(game, bytes(0x1000))
            stat_probe.native.mem_write(game + 0x33c, bytes([cls, race_row['native_id']]))
            stat_probe.native.mem_write(game + 0x500, struct.pack('<I', level))
            sp = stat_probe.STACK + 0x1f0008
            stat_probe.put(sp, stat_probe.DONE)
            for key, value in [('RSP', sp), ('RCX', game), ('MXCSR', 0x1f80)]:
                stat_probe.reg(key, value)
            stat_probe.stop = 0x145b7e374
            stat_probe.native.emu_start(0x145b7de20, stat_probe.DONE, count=100000)
            assert stat_probe.reg('RIP') == stat_probe.stop
            bp = stat_probe.reg('RBP')
            def bits_register(name):
                return stat_probe.reg(name) & 0xffffffff
            def bits_stack(offset):
                return struct.unpack('<I', stat_probe.native.mem_read(bp + offset, 4))[0]
            actual = [bits_register('XMM7'), bits_stack(0x90), bits_register('XMM10'),
                      bits_stack(0xa0), bits_stack(0x70), bits_stack(0x80), bits_register('XMM0'),
                      bits_register('XMM2'), bits_register('XMM15'), bits_stack(0x50),
                      bits_register('XMM13'), bits_register('XMM6')]
            offset = f32(f32(level) + f32(-1))
            expected = [race_row['health_multiplier'],
                        f32(f32(1 + f32(f32(.03) * offset)) + race_row['damage_bonus']),
                        f32(.08) if race_row['native_id'] == 7 else 0.,
                        f32(1 + race_row['move_bonus']),
                        f32(f32(.05) + race_row['crit_bonus']),
                        f32(class_row['armor_fraction'] + race_row['armor_bonus']),
                        f32(f32(f32(.8) + f32(f32(.08) * offset)) + race_row['regeneration_bonus']),
                        f32(9 * race_row['pickup_multiplier']), race_row['experience_multiplier'],
                        race_row['gold_multiplier'], race_row['luck_bonus'], race_row['heal_on_kill']]
            bits = [struct.unpack('<I', struct.pack('<f', value))[0] for value in expected]
            assert actual == bits, (cls, race_row['native_id'], level, actual, bits)
            stat_cases.append([cls, race_row['native_id'], level, actual])
result = dict(target_sha256=SHA, races=races, starter_items=items, outfits=outfits, ranges=records,
              native_cases=len(outfits) + len(stat_cases), stat_cases=stat_cases, source_compiled=False, game_executed=False,
              seams=['Starter descriptor ID and slot are supplied from independently decoded current item records.',
                     'Allocator/free are deterministic Python fixtures; reconstructed Rust and game do not execute.',
                     'Stat refresh executes through the complete race-passive loop with empty equipment/temporary/jewelry collections; later layers do not execute.',
                     'Selected constructor original instructions are reviewed, not emulated by this check.'])
assert json.loads((HERE / 'vectors.json').read_text()) == json.loads(json.dumps(result))
manifest = json.loads((HERE / 'manifest.json').read_text())
assert manifest['target']['sha256'] == SHA
for receipt in manifest['source_receipts'] + [manifest['vectors']] + manifest['assembly']:
    assert hashlib.sha256((ROOT / receipt['path']).read_bytes()).hexdigest() == receipt['sha256'], receipt['path']
for assembly in manifest['assembly']:
    extent = assembly['native_range']
    start, end = int(extent['va'], 16), int(extent['end_exclusive'], 16)
    instructions = list(md.disasm(raw(start, end - start), start))
    assert len(instructions) == assembly['instruction_count']
    assert sum(ins.size for ins in instructions) == end - start
    actual_assembly = '\n'.join(f'{ins.address:016x}  {ins.bytes.hex():22s} {ins.mnemonic} {ins.op_str}'.rstrip() for ins in instructions) + '\n'
    assert (ROOT / assembly['path']).read_text() == actual_assembly
if args.queries:
    for query in manifest['queries']:
        for field in ['result', 'journal', 'plan']:
            receipt = query[field]
            assert hashlib.sha256((ROOT / receipt['path']).read_bytes()).hexdigest() == receipt['sha256'], receipt['path']
        journal = json.loads((ROOT / query['journal']['path']).read_text())
        assert journal['status'] == 'completed'
        evidence = json.loads((ROOT / query['result']['path']).read_text())['structuredContent']
        assert evidence['provider']['id'] == 'ghidra'
        assert evidence['evidence_id'] == query['evidence_id']
        assert evidence['parameters']['procedure'] == query['procedure']
        assert evidence['subject']['digest']['sha256'] == query['subject_sha256']
        assert evidence['analysis_profile']['digest'] == query['profile_digest']
        assert hashlib.sha256(evidence['normalized_result'].encode()).hexdigest() == query['normalized_result_sha256']
print(f'0.120.0: {len(races)} racial/passive records, {len(items)} starter descriptors, {len(outfits)} native/source outfits, {len(stat_cases)} native racial stat prefixes agree')
