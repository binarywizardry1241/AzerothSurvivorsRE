#!/usr/bin/env python3
"""Bounded 0.115.0 text registry/ItemInfo replay with explicit host seams.

Only reviewed selected-EXE instructions run in Unicorn. Allocation, byte copy,
comparison, String clone and iterator clone/join are Python seams; no game,
operating-system endpoint, networking, Rust build or rebuilt source executes.
"""
import argparse
import ast
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from equipment_native import EquipmentProbe

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
RANGES = [
    (0x1459a8f50, 0x1459a9152, '6c5a00946a88d5ac595670084f10a1d47f0830b0d63a8d6eb16ccef30f8f7185'),
    (0x1459a91f0, 0x1459a932c, 'e92212fe4e417db302e8c67e6f0f71c361d6d6d0b76069c332ad17f1fe9d9d70'),
    (0x1459b1d90, 0x1459b40a1, 'afc0daec160d4f3d57857fa939a07cfeb9389d42436b860e90d397d128e18b62'),
    (0x14597ffe0, 0x14598000c, 'c09972094108fc88d649767520c577bd63d3695cbfa01054d401409f70a21584'),
]
INTERN, LOOKUP, SERIALIZE, ENTRY = [row[0] for row in RANGES]
REGISTRY = 0x1482147e0
DECODER = ROOT / 'scripts/check-equipped-inventory.py'


def decoder():
    """Reuse the ordinary ItemInfo grammar without running historical recovery."""
    source = DECODER.read_text()
    nodes = [node for node in ast.parse(source).body
             if isinstance(node, ast.FunctionDef) and node.name == 'decode_packet']
    assert len(nodes) == 1
    namespace = {'struct': struct}
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(DECODER), 'exec'), namespace)
    return namespace['decode_packet']


def expected_packet(name, flavor, health, spells):
    return dict(entry=101000, class_id=4, subclass=0, name=name,
        display_info_id=30000, quality=1, flags=0, buy_price=0, sell_price=0,
        inventory_type=1, allowable_class=-1, allowable_race=-1, item_level=60,
        required_level=0, required_skill=0, required_skill_rank=0, required_spell=0,
        required_honor_rank=0, required_city_rank=0, required_rep_faction=0,
        required_rep_rank=0, max_count=0, stackable=1, container_slots=0,
        stats=[[1, health]], damages=[], dmg_min=0., dmg_max=0., dmg_type=0,
        armor=44, resistances=[0] * 6, delay_ms=2000, ammo_type=0,
        ranged_mod_range=0., spells=spells, spell_charges_0=0, use_spell=None,
        bonding=int(bool(spells)), description=flavor, page_text=0, language_id=0,
        page_material=0, start_quest=0, lock_id=0, material=0, sheath=3,
        random_property=0, block=0, item_set=0, max_durability=0, area=0,
        map=0, bag_family=0)


class Probe(EquipmentProbe):
    def grow(self, at, stride, length=None, additional=1):
        length = self.q(at + 16) if length is None else length
        capacity = max(16, self.q(at) * 2, length + additional)
        pointer = self.alloc(capacity * stride)
        if length:
            self.native.mem_write(pointer, bytes(self.native.mem_read(self.q(at + 8), length * stride)))
        self.put(at, capacity, pointer)

    def hook(self, uc, pc, size, unused):
        if pc == self.stop or any(a <= pc and pc + size <= z for a, z in self.ranges):
            return super().hook(uc, pc, size, unused)
        rcx, rdx, r8, r9 = (self.reg(name) for name in ('RCX', 'RDX', 'R8', 'R9'))
        if pc == 0x145d14601:
            left, right = bytes(uc.mem_read(rcx, r8)), bytes(uc.mem_read(rdx, r8))
            self.reg('RAX', ((left > right) - (left < right)) & ((1 << 64) - 1))
        elif pc == 0x145d145fb:
            uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc == 0x145d14e50:
            self.grow(rcx, 24)
        elif pc == 0x145d14a10:
            self.grow(rcx, self.q(self.reg('RSP') + 40), rdx, r8)
        elif pc == 0x145eb6ec0:
            self.grow(rcx, 1, self.q(rcx))
        elif pc == 0x145ce7810:
            self.output(rcx, self.pair(rdx + 8))
        elif pc == 0x1459d45e0:
            first, end, maximum = (self.q(rdx + index * 8) for index in range(3))
            assert end >= first and (end - first) % 24 == 0
            count = min((end - first) // 24, maximum)
            array = self.alloc(max(count, 1) * 24)
            for index in range(count):
                self.output(array + index * 24, self.pair(first + index * 24 + 8))
            self.put(rcx, count, array, count)
        elif pc == 0x1458c01f0:
            separator = self.text(r9, self.q(self.reg('RSP') + 40))
            assert separator == '\nEquip: '
            self.output(rcx, separator.join(self.pair(rdx + index * 24 + 8) for index in range(r8)))
        else:
            return super().hook(uc, pc, size, unused)
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        sp = self.reg('RSP')
        self.reg('RSP', sp + 8)
        self.reg('RIP', self.q(sp))

    def intern(self, value):
        raw = value.encode()
        pointer = self.alloc(len(raw) + 1)
        self.native.mem_write(pointer, raw)
        self.invoke(INTERN, pointer, len(raw))
        return self.reg('RAX') & 0xffffffff

    def lookup(self, spell_id):
        out = self.alloc(24)
        self.invoke(LOOKUP, out, spell_id)
        return None if self.q(out) == (1 << 64) - 1 else self.pair(out + 8)

    def packet(self, lines, health, name, flavor):
        info = self.alloc(88)
        for at, value in ((info, name), (info + 32, flavor)):
            raw = value.encode()
            pointer = self.alloc(len(raw) + 1)
            self.native.mem_write(pointer, raw)
            self.put(at, pointer, len(raw))
        array = self.alloc(max(len(lines), 1) * 24)
        for index, line in enumerate(lines):
            self.output(array + index * 24, line)
        self.put(info + 16, array, len(lines))
        self.native.mem_write(info + 48,
            struct.pack('<8IiI', 101000, 4, 0, 30000, 1, 1, 3, 44, health, 0))
        out = self.alloc(32)
        self.invoke(SERIALIZE, out, info)
        assert self.q(out + 24) & 0xffff == 0x58
        return bytes(self.native.mem_read(self.q(out + 8), self.q(out + 16)))


def run():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location('coop_item_native_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    for start, end, expected in RANGES:
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == expected
    probe = Probe(data, pe, [(a, z) for a, z, _ in RANGES])
    probe.put(0x148214a38, probe.alloc(8))
    parse = decoder()
    registered, interning, lookups, packets = [], [], [], []
    texts = ['', 'hello', '+25% damage', 'Polski Żółć', 'hello', '+25% damage', '',
             '日本語', 'A\0B', 'A', 'A\0B', 'line1\nline2', 'é', 'e\u0301', 'É',
             'trailing ', 'trailing', '🙂', '🙂']
    for value in texts:
        spell = probe.intern(value)
        if value not in registered:
            registered.append(value)
        assert spell == 0xf00000 + registered.index(value)
        assert probe.q(REGISTRY + 16) == len(registered)
        assert probe.lookup(spell) == value
        interning.append({'text': value, 'spell_id': spell})
    for spell in [0, 1, 0xefffff, 0xf00000 + len(registered), 0xffffffff]:
        assert probe.lookup(spell) is None
        lookups.append({'spell_id': spell, 'found': False})
    for index, value in enumerate(registered):
        assert probe.lookup(0xf00000 + index) == value
        lookups.append({'spell_id': 0xf00000 + index, 'found': True, 'text': value})
    cases = [([f'line {index}' for index in range(count)], 23, 'Hello', 'Flavor')
             for count in range(9)]
    cases += [(['same', 'same'], health, 'Żółć 日本語', 'Lore 🙂')
              for health in (-(1 << 31), -1, 0, 1, (1 << 31) - 1)]
    cases += [(['', 'A\0B', '日本語', '🙂', 'same', 'same'], 0, '', ''),
              (['health only'], 17, 'Long name ' * 6, 'Long flavor ' * 6)]
    for lines, health, name, flavor in cases:
        payload = probe.packet(lines, health, name, flavor)
        decoded = parse(payload)
        assert decoded['entry'] == 101000 and decoded['name'] == name
        assert decoded['description'] == flavor and decoded['stats'] == [[1, health]]
        assert decoded['bonding'] == int(bool(lines))
        joined = lines[:4] + (['\nEquip: '.join(lines[4:])] if len(lines) > 4 else [])
        assert len(decoded['spells']) == len(joined)
        expected_spells = []
        for index, (spell, text) in enumerate(zip(decoded['spells'], joined)):
            if text not in registered:
                registered.append(text)
            expected_spells.append({'index': index, 'spell_id': 0xf00000 + registered.index(text),
                'trigger': 1, 'charges': 0, 'cooldown_ms': -1, 'category': 0, 'category_cooldown_ms': -1})
            assert spell == expected_spells[-1]
            assert probe.lookup(spell['spell_id']) == text
        assert decoded == expected_packet(name, flavor, health, expected_spells)
        assert probe.q(REGISTRY + 16) == len(registered)
        packets.append({'lines': lines, 'health': health, 'name': name, 'flavor': flavor,
                        'decoded': decoded, 'payload_sha256': hashlib.sha256(payload).hexdigest()})
    # Length-delimited text interning preserves NUL. Ordinary packet C strings
    # contain the supplied bytes verbatim; embedded NUL disrupts the grammar.
    malformed = []
    for name, flavor in [('A\0B', 'Flavor'), ('Hello', 'A\0B')]:
        payload = probe.packet([], 0, name, flavor)
        try:
            parse(payload)
        except (AssertionError, ValueError, UnicodeDecodeError, struct.error) as error:
            malformed.append({'name': name, 'flavor': flavor,
                              'decoder_rejected': type(error).__name__,
                              'payload_sha256': hashlib.sha256(payload).hexdigest()})
        else:
            raise AssertionError('embedded-NUL packet unexpectedly consumed the ordinary grammar')
    counters = []
    frame = probe.alloc(16)
    for old in (0, 1, 99_999_999, 100_000_000, (1 << 32) - 2, (1 << 32) - 1):
        probe.native.mem_write(0x148217140, struct.pack('<I', old))
        probe.reg('RBP', frame)
        probe.stop = RANGES[-1][1]
        probe.native.emu_start(ENTRY, probe.stop, count=100)
        assert probe.reg('RIP') == probe.stop
        entry = probe.reg('RDI') & 0xffffffff
        next_value = struct.unpack('<I', probe.native.mem_read(0x148217140, 4))[0]
        assert entry == 900_000 + old % 100_000_000
        assert next_value == (old + 1) & 0xffffffff
        assert struct.unpack('<I', probe.native.mem_read(frame + 8, 4))[0] == entry
        counters.append({'old_counter': old, 'entry': entry, 'next_counter': next_value})
    return {'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
            'ranges': [{'start': hex(a), 'end_exclusive': hex(z), 'sha256': sha}
                       for a, z, sha in RANGES],
            'decoder': {'path': str(DECODER.relative_to(ROOT)),
                        'sha256': hashlib.sha256(DECODER.read_bytes()).hexdigest()},
            'text_registry_cases': interning, 'lookup_cases': lookups,
            'packet_cases': packets, 'embedded_nul_packet_cases': malformed,
            'entry_counter_cases': counters,
            'registered_text_count': probe.q(REGISTRY + 16), 'seam_calls': probe.calls,
            'limits': ['Only four exact selected-target instruction intervals execute in Unicorn.',
                       'Allocator, byte comparison/copy, String clone and iterator clone/join are Python seams.',
                       'No game, sockets, Rust compilation/execution, rendering or original/rebuilt parity.']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap101/3d83db8dabbf/native-item-text-cases.json')
    args = parser.parse_args()
    output = project_path(args.output)
    assert output.is_relative_to(ROOT / 'runtime'), 'bulk replay output belongs under runtime/'
    result = run()
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    print(f"PASS: {len(result['text_registry_cases'])} text interning, "
          f"{len(result['lookup_cases'])} lookup and {len(result['packet_cases'])} decoded packet cases; "
          f"{len(result['embedded_nul_packet_cases'])} embedded-NUL packet boundaries; "
          f"{len(result['entry_counter_cases'])} process counter cases; no game/build")


if __name__ == '__main__':
    main()
