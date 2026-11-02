#!/usr/bin/env python3
"""Check the shared set/item text producer without compiling or running a client.

Optional Unicorn replay executes only the current interner and lookup. Allocation,
byte copy/comparison, vector growth and String cloning are explicit leaf seams.
"""
from portable_paths import portable_json

from script_sources import current_path, recorded_input_matches

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
import hashlib
import json
import sqlite3
import struct

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script
from shared_native_inventory import open_readonly

BASE = ROOT / 'docs/analysis/evidence/0.121.0/coop-item-registry'


def carrier_check(run_native):
    """Current wire25 carrier, keeping historical registry suites independent."""
    from discovery_native_subject import verify_native_query_subject
    base = ROOT / 'docs/analysis/evidence/0.127.0/coop-item-carrier'
    proof = json.loads((base / 'manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[k] == v for k, v in proof['target'].items())
    image = target_bytes(target)
    pe = load_script('carrier_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert digest(image[offset:offset + end - start]) == row['sha256'], row['role']
        if 'assembly' in row:
            receipt(row['assembly'])
    for row in proof.get('dispatch_tables', []):
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row['entries'] * 4]
        assert digest(raw) == row['sha256']
        targets = [hex(address + value[0]) for value in struct.iter_unpack('<i', raw)]
        assert targets[row['index']] == row['selected_target']
    for query in proof['queries']:
        native = json.loads(receipt(query['result']).read_text())['structuredContent']
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
        value = native['normalized_result']
        encoded = value.encode() if isinstance(value, str) else json.dumps(value, sort_keys=True).encode()
        assert digest(encoded) == query['normalized_sha256']
        if 'pseudocode' in query:
            assert receipt(query['pseudocode']).read_text() == value
    # Native enum24 -> wire25; the byte writer precedes payload, count and strings.
    offset = pe.rva_offset(0x145d14cc9 - pe.image_base)
    assert image[offset:offset + 11].hex() == '488d4d58b219e80cbf1a00'
    requirements = {
        'coop/engine_packets.rs': ['cursor.checked_add(0x17c)', 'cursor + 0x104 + index * 0x18',
            'NativeMessage::ItemTemplate', 'super::client_state::sanitize_text(&mut text)',
            'descriptions.get(index).filter(|text| old != 0 && !text.is_empty())', 'intern(&text)'],
        'coop/replication.rs': ['out.push(25)', 'push_bytes(&mut out, payload)',
            'push_count(&mut out, descriptions.len())', 'let count = reader.count(4)?'],
        'gameplay/coop_commands.rs': ['engine_packets::item_message(encoded',
            'item_texts.0.iter().find(|(entry, _)| *entry == id)'],
        'gameplay/coop.rs': ['mut item_texts: ResMut<benilla_app::local_client::LocalItemDescriptions>',
            'engine_packets::remap_item_descriptions(payload, &descriptions', '|text| item_texts.intern(text)'],
    }
    for name, fragments in requirements.items():
        source = (ROOT / 'crates/azeroth-survivors-re/src' / name).read_text()
        for fragment in fragments:
            assert fragment in source, (name, fragment)
    result = dict(target=proof['target'], native_query_receipts=len(proof['queries']),
        source_paths=len(requirements), compilation='not_run', runtime_validation='not_run', parity='unverified')
    if run_native:
        result['native'] = carrier_replay(image, pe)
    return result


def carrier_replay(image, pe):
    """Original slot/remap instructions; String/registry operations are seams."""
    from equipment_native import EquipmentProbe
    ranges = [(0x145afbe60, 0x145afc15a), (0x145b00d90, 0x145b00f44),
              (0x145b53260, 0x145b53565)]

    class Carrier(EquipmentProbe):
        def __init__(self):
            super().__init__(image, pe, ranges)
            self.steps = 0
            self.registry = ['prior local set text']
            self.interned = []

        def hook(self, uc, pc, size, unused):
            if pc == self.stop:
                uc.emu_stop(); return
            if any(a <= pc and pc + size <= z for a, z in ranges):
                self.steps += 1; return
            rcx, rdx = self.reg('RCX'), self.reg('RDX')
            if pc == 0x146034930:  # Clone one String into the native temporary.
                self.output(rcx, self.pair(rdx + 8))
            elif pc == 0x145b54cc0:  # Already recovered sanitizer, explicit seam.
                text = self.pair(rcx + 8)
                for a, b in [('|H', '||H'), ('|h', '||h'), ('|T', '||T'), ('|t', '||t')]:
                    text = text.replace(a, b)
                raw = text.encode()[:4096]
                self.output(rcx, raw.decode('utf-8', errors='ignore'))
            elif pc == 0x145af3a50:  # Persistent exact-byte interner, explicit seam.
                text = self.text(rcx, rdx)
                self.interned.append(text)
                if text not in self.registry:
                    self.registry.append(text)
                self.reg('RAX', 0xf00000 + self.registry.index(text))
            elif pc != 0x1400021d0:
                raise AssertionError(('unreviewed carrier call', hex(pc)))
            sp = self.reg('RSP')
            self.reg('RSP', sp + 8); self.reg('RIP', self.q(sp))

    probe = Carrier()
    # Existing historical packet is only a grammar fixture, not current behavior.
    fixture = json.loads((ROOT / 'docs/analysis/evidence/0.113.2/equipped-inventory/cases.json').read_text())
    original = bytes.fromhex(fixture['packets'][0]['payload_hex'])
    cursor = 12
    for _ in range(4): cursor = original.index(0, cursor) + 1
    offsets = [cursor + 0x104 + i * 24 for i in range(5)]
    cases = 0
    for mask in range(32):
        for count in range(8):
            values = ['|Hlink|h', '', 'same', 'same', 'x' * 4095 + 'é', 'unused', 'surplus'][:count]
            packet = bytearray(original)
            for index, at in enumerate(offsets):
                struct.pack_into('<I', packet, at, 100 + index if mask >> index & 1 else 0)
            body = probe.alloc(len(packet)); probe.native.mem_write(body, bytes(packet))
            vec, out, strings = probe.alloc(24), probe.alloc(24), probe.alloc(max(1, count) * 24)
            probe.put(vec, len(packet), body, len(packet))
            for index, text in enumerate(values): probe.output(strings + index * 24, text)
            before = list(probe.registry); expected = bytearray(packet)
            for index, at in enumerate(offsets):
                text = values[index] if index < len(values) and mask >> index & 1 else ''
                if text:
                    for a, b in [('|H', '||H'), ('|h', '||h'), ('|T', '||T'), ('|t', '||t')]: text = text.replace(a, b)
                    text = text.encode()[:4096].decode('utf-8', errors='ignore')
                    if text not in before: before.append(text)
                    ident = 0xf00000 + before.index(text)
                else: ident = 0
                struct.pack_into('<I', expected, at, ident)
            probe.reg('R9', count)
            probe.invoke(0x145b53260, out, vec, strings)
            assert probe.q(out) != (1 << 64) - 1
            actual = bytes(probe.native.mem_read(probe.q(out + 8), probe.q(out + 16)))
            assert actual == expected, (mask, count)
            assert probe.registry == before
            cases += 1
    malformed = [original[:end] for end in range(cursor + 0x17c)]
    malformed += [b'\xff\xff\xff\xff', b'\x01' * 500]
    for packet in malformed:
        body = probe.alloc(max(1, len(packet))); probe.native.mem_write(body, packet)
        vec, out = probe.alloc(24), probe.alloc(24)
        probe.put(vec, len(packet), body, len(packet))
        before = list(probe.interned)
        probe.reg('R9', 0)
        probe.invoke(0x145b53260, out, vec, 8)
        assert probe.q(out) == (1 << 64) - 1
        assert probe.interned == before
    return dict(remap_cases=cases, malformed_cases=len(malformed), original_instruction_steps=probe.steps,
        limits='Original extractor/remap/rewrite only; String clone, sanitizer, interning and free are explicit seams. No client/source/network/game executes.')


def digest(data):
    return hashlib.sha256(data).hexdigest()


def receipt(row):
    path = current_path(project_path(row['path']))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def check():
    proof = json.loads((BASE / 'manifest.json').read_text())
    target = {key: value for key, value in latest_target(verify=True).items()
              if key in ('version', 'path', 'sha256', 'size_bytes')}
    assert proof['target'] == target and proof['target_executed'] is False
    image = target_bytes(target)
    pe = load_script('item_registry_121_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['ranges']:
        at = pe.rva_offset(int(row['start'], 0) - pe.image_base)
        length = int(row['end_exclusive'], 0) - int(row['start'], 0)
        assert digest(image[at:at + length]) == row['sha256'], row['role']
    for query in proof['queries']:
        result = json.loads(receipt(query['result']).read_text())['structuredContent']
        assert result['provider']['id'] == 'ghidra'
        assert result['subject']['digest']['sha256'] == target['sha256']
        assert result['evidence_id'] == query['evidence_id']
        assert result['analysis_profile']['digest'] == query['analysis_profile_digest']
        assert digest(result['normalized_result'].encode()) == query['normalized_sha256']
        receipt(query['plan'])
        receipt(query['journal'])
    sets = json.loads(receipt(proof['set_contract']).read_text())
    assert sets['target'] == target
    query = next(q for q in sets['queries'] if q['procedure'] == '0x145ac1180')
    result = json.loads(receipt(query['result']).read_text())['structuredContent']
    assert digest(result['normalized_result'].encode()) == query['normalized_text_sha256']
    assert result['normalized_result'].count('func_0x000145b78be0()') == 2
    for row in proof['reference_inputs']:
        con = open_readonly(receipt(row))
        con.row_factory = sqlite3.Row
        observed = [dict(r) for r in con.execute(proof['reference_sql'])]
        con.close()
        assert observed == row['rows']
    calls = [(hex(r['site']), r['target']) for p in proof['reference_inputs']
             for r in p['rows'] if r['kind'] == 'call_direct']
    assert calls == [('0x145ac13a2', '0x145b78be0'),
                     ('0x145ac152e', '0x145b78be0'),
                     ('0x145b829e7', '0x145b78be0')]
    for row in proof['source_witnesses']:
        receipt(row)
    sources = {row['path']: project_path(row['path']).read_text()
               for row in proof['source_witnesses']}
    descriptions = sources['crates/benilla-app/src/local_client/item_descriptions.rs']
    assert 'pub fn intern(&mut self, text: &str) -> u32' in descriptions
    assert 'old == text' in descriptions and 'wrapping_add(self.0.len() as u32)' in descriptions
    assert 'descriptions.0.iter().skip(*published)' in descriptions
    sets_source = sources['crates/benilla-app/src/local_client/item_sets.rs']
    assert 'if!self.intern_bonus_descriptions{return;}' in ''.join(sets_source.split())
    assert 'for &id in asked' in sets_source and 'for (_, text) in &view.bonuses' in sets_source
    feed = sources['crates/benilla-app/src/ui_items/feed.rs']
    assert feed.index('sets.intern_asked_bonuses(&asks, descriptions)') < feed.index('asks.into_iter().collect()')
    inventory = sources['crates/azeroth-survivors-re/src/gameplay/client/inventory.rs']
    assert 'let spell_id = texts.intern(&text);' in inventory
    assert inventory.index('sets.intern_bonus_descriptions = true;') < inventory.index('if coop.as_ref()')
    model = sources['crates/benilla-ui/src/script/model.rs']
    assert 'pub(crate) item_set_asks: Vec<u32>' in model
    renderer = sources['crates/benilla-ui/src/script/tooltip_item/render.rs']
    assert 'if !model.item_set_asks.contains(&v.item_set)' in renderer
    assert 'model.item_set_asks.push(v.item_set)' in renderer
    stats = sources['crates/benilla-ui/src/script/item_stats.rs']
    assert 'std::mem::take(&mut self.model_mut().item_set_asks)' in stats
    assert 'model.item_set_asks.retain(|id| *id != set_id)' in stats
    if proof.get('pre_sync_source_repair'):
        coop = sources['crates/azeroth-survivors-re/src/gameplay/coop.rs']
        assert 'wire.enabled = runtime.is_guest() && state.sync_sent;' in coop
        assert '.add_systems(Update, guest_request_route.after(bootstrap))' in coop
        runtime = sources['crates/azeroth-survivors-re/src/coop_runtime.rs']
        assert 'wire.enabled = runtime.is_guest();' not in runtime
        assert 'answer_guest_local_queries(client.active,' in inventory
        assert 'definition(armory, labels, entry, 0)' in inventory
        requests = sources['crates/benilla-app/src/local_client/requests.rs']
        assert '.add_systems(PostUpdate, collect)' in requests
        assert 'if wire.enabled' in requests and 'items.0.push((entry, guid))' in requests
    return proof, image, pe


def native(image, pe):
    from equipment_native import EquipmentProbe

    intern, lookup = 0x145b78be0, 0x145b78e80
    registry, lock, panic_thread = 0x1485c6760, 0x1485c6758, 0x1485c6b78
    ranges = [(intern, 0x145b78de2), (lookup, 0x145b78fbc)]
    mask = (1 << 64) - 1

    class Probe(EquipmentProbe):
        def __init__(self):
            super().__init__(image, pe, ranges)
            self.steps = 0
            self.put(panic_thread, self.alloc(8))
            self.native.mem_write(lock, bytes(2))
            self.put(registry, 0, 8, 0)

        def raw(self, at, count):
            assert 0 <= count < 0x100000
            return bytes(self.native.mem_read(at, count)) if count else b''

        def hook(self, uc, pc, size, unused):
            if pc == self.stop:
                uc.emu_stop()
                return
            if any(a <= pc and pc + size <= z for a, z in ranges):
                self.steps += 1
                return
            rcx, rdx, r8 = (self.reg(r) for r in ('RCX', 'RDX', 'R8'))
            if pc == 0x140002200:
                pass
            elif pc == 0x1400021c0:
                assert rdx == 1
                self.reg('RAX', self.alloc(rcx))
            elif pc == 0x145febc27:
                left, right = self.raw(rcx, r8), self.raw(rdx, r8)
                self.reg('RAX', ((left > right) - (left < right)) & mask)
            elif pc == 0x145febc1b:
                if r8:
                    uc.mem_write(rcx, self.raw(rdx, r8))
                self.reg('RAX', rcx)
            elif pc == 0x145fec430:
                assert rcx == registry
                length = self.q(rcx + 16)
                assert length == self.q(rcx)
                capacity = max(4, length * 2)
                pointer = self.alloc(capacity * 24)
                if length:
                    uc.mem_write(pointer, self.raw(self.q(rcx + 8), length * 24))
                self.put(rcx, capacity, pointer)
            elif pc == 0x145fbee30:
                raw = self.raw(self.q(rdx + 8), self.q(rdx + 16))
                pointer = self.alloc(len(raw) + 1)
                if raw:
                    uc.mem_write(pointer, raw)
                self.put(rcx, len(raw), pointer, len(raw))
            else:
                raise AssertionError(('unadmitted native call', hex(pc)))
            self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
            sp = self.reg('RSP')
            self.reg('RSP', sp + 8)
            self.reg('RIP', self.q(sp))

        def add(self, text):
            raw = text.encode()
            pointer = self.alloc(len(raw) + 1)
            if raw:
                self.native.mem_write(pointer, raw)
            self.invoke(intern, pointer, len(raw))
            assert self.raw(lock, 2) == bytes(2)
            return self.reg('RAX') & 0xffffffff

        def find(self, identity):
            output = self.alloc(24)
            self.invoke(lookup, output, identity)
            assert self.raw(lock, 2) == bytes(2)
            return None if self.q(output) == mask else self.raw(self.q(output + 8), self.q(output + 16))

    probe = Probe()
    texts = ['', 'set four', 'set eight', 'item effect', 'set four', 'a\0b',
             'é', 'e\u0301', '日本語', '🙂', '', 'set eight', 'tail\0']
    seen, cases = [], []
    for text in texts:
        if text not in seen:
            seen.append(text)
        identity = probe.add(text)
        assert identity == 0xf00000 + seen.index(text)
        assert probe.find(identity) == text.encode()
        assert probe.q(registry + 16) == len(seen)
        cases.append({'utf8_hex': text.encode().hex(), 'id': identity})
    missing = [0, 0xefffff, 0xf00000 + len(seen), 0xffffffff]
    for identity in missing:
        assert probe.find(identity) is None
    guest = Probe()
    assert guest.add('guest set four') == 0xf00000
    assert probe.find(0xf00000) != guest.find(0xf00000)
    assert guest.find(0xf00003) is None
    return {'interner_cases': cases, 'missing_lookup_cases': missing,
            'isolated_registry_cases': 2, 'instruction_steps': probe.steps + guest.steps,
            'seam_calls': probe.calls, 'guest_carrier_recovered': False,
            'limits': 'Uncontended/nonpoisoned registry only; allocation, byte comparison/copy, vector growth and String cloning are seams. This executes no Rust/client/network/server.'}


def routing(image, pe):
    """Execute the original forwarding gate up to its three outcome boundaries."""
    from equipment_native import EquipmentProbe

    start, forward, fallback, local = (0x145b21ef6, 0x145b21f2f,
                                      0x145b21f69, 0x145b220b8)

    class Gate(EquipmentProbe):
        def hook(self, uc, pc, size, unused):
            if pc in (forward, fallback, local):
                uc.emu_stop()
            elif start <= pc and pc + size <= forward:
                self.steps += 1
            else:
                raise AssertionError(('outside forwarding gate', hex(pc)))

    gate = Gate(image, pe, [(start, forward)])
    gate.steps = 0
    game = gate.alloc(0x1200)
    gate.reg('RCX', game)
    gate.reg('RSI', game)
    opcodes = [0, 0x4a, 0x4b, 0x4c, 0x55, 0x56, 0x57,
               0x1cd, 0x1ce, 0x1cf, 0x1db, 0x1dc, 0x1dd, 0xffff]
    cases = []
    for party in (0, 1, 2, 3, 0xffffffffffffffff):
        gate.put(game + 0xd48, party)
        for synchronized in (0, 1, 2, 255):
            gate.native.mem_write(game + 0x10c5, bytes([synchronized]))
            for opcode in opcodes:
                gate.reg('RBX', opcode)
                gate.native.emu_start(start, gate.DONE, count=32)
                actual = gate.reg('RIP')
                expected = (fallback if party >= 2 or synchronized == 0 else
                            local if opcode in (0x4b, 0x1ce, 0x1dc) else forward)
                assert actual == expected, (party, synchronized, opcode, hex(actual))
                cases.append((party, synchronized, opcode, hex(actual)))
    return {'cases': len(cases), 'instruction_steps': gate.steps,
            'case_sha256': digest(json.dumps(cases, separators=(',', ':')).encode()),
            'limits': 'Original routing predicate only; no serializer, socket, lifecycle sender or local request handler executes.'}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--native', action='store_true')
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--carrier', action='store_true', help='check current wire25 item text delivery')
    args = parser.parse_args()
    if args.carrier:
        assert not args.write, 'Current carrier check prints its result without rewriting evidence'
        print(json.dumps(carrier_check(args.native), ensure_ascii=False))
        raise SystemExit(0)
    proof, image, pe = check()
    result = {'target': proof['target'], 'source_static_checked': True,
              'compilation': 'not_run', 'runtime_validation': 'not_run', 'parity': 'unverified'}
    if args.native:
        result['native'] = native(image, pe)
        if proof.get('pre_sync_source_repair'):
            result['routing'] = routing(image, pe)
    if args.write:
        assert args.native, 'Durable check receipt includes the native replay'
        (BASE / 'static-check.json').write_text(portable_json(result, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps(result, ensure_ascii=False))
