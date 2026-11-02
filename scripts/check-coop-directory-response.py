#!/usr/bin/env python3
"""Replay the current Binary lobby decoder and local eligibility projection.

No Rust compilation, network or game. String decoding, allocation, copying,
freeing and JSON/locale helpers are explicit seams. Native instructions retain
the wire field order/widths, tag dispatch, truncation flag, optional-capacity
trailer, class/zone lookup and selected-class unlock scan. This is not rebuilt
source execution or original/rebuilt parity.
"""
import hashlib
import itertools
import json
from pathlib import Path
import re
import struct
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

old = load_script('coop_ui_probe', ROOT / 'scripts/check-coop-ui.py')
SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
EVIDENCE = ROOT / 'docs/analysis/evidence/0.115.0/coop-directory-response'
ZONES = ['elwynn', 'duskwood', 'wsg', 'ungoro', 'ab', 'feralas',
         'arena', 'sm', 'av', 'brm', 'aq', 'naxx']


class Probe(old.Native):
    def __init__(self, data, pe):
        super().__init__(data, pe, [
            (0x145b7af90, 0x145b7bc7f), (0x1458095e0, 0x145809709),
            (0x145997f80, 0x145999097), (0x145b7bf90, 0x145b7c167),
            (0x145b79f90, 0x145b7a195),
        ], [0x140002200, 0x1400021c0, 0x1400021d0, 0x145b7c600,
            0x145e9e0b0, 0x145d145fb, 0x1405866c0, 0x145ce7350,
            0x1458dff90, 0x145858350, 0x145858210, 0x1458580a0, 0x145d14a10])
        # Bound Unicorn's translated blocks at the explicitly stubbed entries,
        # including the locale helper near its otherwise unmapped page edge.
        for address in (0x140002200, 0x1400021c0, 0x1400021d0, 0x145b7c600,
                        0x145e9e0b0, 0x145d145fb, 0x1405866c0, 0x145ce7350,
                        0x1458dff90, 0x145858350, 0x145858210, 0x1458580a0, 0x145d14a10):
            self.cpu.mem_write(address, b'\xc3')

    def hook(self, cpu, pc, size, unused):
        if pc == self.stop or (self.capture is not None and pc == self.capture[0]):
            return super().hook(cpu, pc, size, unused)
        if any(a <= pc and pc + size <= b for a, b in self.ranges):
            return
        a, b, n = (self.reg(k) for k in ('RCX', 'RDX', 'R8'))
        if pc in (0x140002200, 0x1400021d0, 0x1405866c0):
            pass
        elif pc == 0x1400021c0:
            self.reg('RAX', self.alloc(a))
        elif pc == 0x145d145fb:
            self.cpu.mem_write(a, bytes(self.cpu.mem_read(b, n)))
        elif pc == 0x145e9e0b0:
            capacity, pointer, length = (self.q(a + i) for i in (0, 8, 16))
            capacity = max(4, capacity * 2)
            new = self.alloc(capacity * 200)
            if length:
                self.cpu.mem_write(new, bytes(self.cpu.mem_read(pointer, length * 200)))
            self.put(a, capacity, new, length)
        elif pc == 0x145d14a10:
            capacity = max(4096, self.q(a) * 2, b + n)
            pointer = self.alloc(capacity)
            if b:
                self.cpu.mem_write(pointer, bytes(self.cpu.mem_read(self.q(a + 8), b)))
            self.put(a, capacity, pointer, b)
        elif pc == 0x145b7c600:
            pointer, length, at = (self.q(b + i) for i in (0, 8, 16))
            if at + 4 > length:
                self.cpu.mem_write(b + 24, b'\0'); self.put(b + 16, length)
                self.string(a, b'')
            else:
                count = struct.unpack('<I', self.cpu.mem_read(pointer + at, 4))[0]
                at += 4
                if at + count > length:
                    self.cpu.mem_write(b + 24, b'\0'); self.put(b + 16, length)
                    self.string(a, b'')
                else:
                    self.put(b + 16, at + count)
                    text = bytes(self.cpu.mem_read(pointer + at, count)).decode('utf-8', 'replace')
                    self.string(a, text.encode())
        elif pc in (0x145ce7350, 0x145858350, 0x145858210):
            pointer = self.alloc(4096)
            self.put(a, 4096, pointer, 0)
        elif pc == 0x1458dff90:
            self.reg('RAX', 0); self.reg('RDX', 0)
        elif pc == 0x1458580a0:
            pass
        else:
            raise AssertionError(f'Unreviewed native call {pc:#x}')
        stack = self.reg('RSP')
        self.reg('RIP', self.q(stack)); self.reg('RSP', stack + 8)

    def reset(self):
        self.cursor, self.capture = self.HEAP + 0x60000, None
        self.cpu.mem_write(self.HEAP, bytes(0x50000))
        self.stack, self.stop = self.HEAP + 0x40000, self.HEAP + 0x4f000
        self.put(self.stack, self.stop); self.reg('RSP', self.stack)

    def s(self, address):
        return bytes(self.cpu.mem_read(self.q(address + 8), self.q(address + 16))).decode()

    def decode(self, raw):
        self.reset()
        self.cpu.mem_write(self.HEAP + 0x10000, raw or b'\0')
        for k, v in [('RCX', self.HEAP), ('RDX', self.HEAP + 0x10000), ('R8', len(raw))]:
            self.reg(k, v)
        self.run(0x145b7af90)
        tag = self.q(self.HEAP)
        if tag == (1 << 64) - 1:
            return None
        tag ^= 1 << 63
        if tag != 0:
            return tag
        pointer, count = self.q(self.HEAP + 16), self.q(self.HEAP + 24)
        result = []
        for i in range(count):
            at = pointer + i * 200
            result.append({
                'code': self.s(at), 'name': self.s(at + 24),
                'description': self.s(at + 48), 'hero': self.s(at + 72),
                'zone_key': self.s(at + 96), 'country': self.s(at + 120),
                'classes': list(self.cpu.mem_read(self.q(at + 152), self.q(at + 160))),
                'host_title': self.s(at + 168),
                **dict(zip(('locked', 'open', 'class_id', 'players', 'max'),
                           self.cpu.mem_read(at + 192, 5))),
            })
        return result

    def eligibility(self, zone, selected_class, saved_rows, host_class=6,
                    capture=0x145998a45):
        self.reset()
        row, save, selected = (self.HEAP + i for i in (0x1000, 0x2000, 0x3000))
        for off in (0, 24, 48, 72, 120, 168): self.string(row + off, b'')
        self.string(row + 96, zone.encode())
        self.put(row + 144, 0, 1, 0)
        self.cpu.mem_write(row + 192, bytes([0, 1, host_class, 1, 5]))
        pointer = self.HEAP + 0x4000
        for i, (class_id, count) in enumerate(saved_rows):
            self.put(pointer + i * 16, class_id, count)
        self.put(save + 32, pointer, len(saved_rows))
        self.cpu.mem_write(selected, bytes([selected_class]))
        self.put(self.stack + 40, selected)
        for k, v in [('RCX', self.HEAP), ('RDX', row), ('R8', 1), ('R9', save)]:
            self.reg(k, v)
        self.capture = (capture, 'RSP', 0)
        self.run(0x145997f80)
        if capture == 0x145998154:
            frame = self.reg('RBP')
            pointer, length = self.q(frame + 0x88), self.q(frame + 0x68)
            if not length: return ''
            offset = self.pe.rva_offset(pointer - self.pe.image_base)
            return self.data[offset:offset + length].decode()
        return self.reg('RSI'), self.reg('RBX')


def encoded_string(value):
    return struct.pack('<I', len(value)) + value


def encoded_row(i=0):
    values = [b'Code' + bytes([65 + i]), b'Name', b'Description', b'Hero']
    result = b''.join(map(encoded_string, values)) + bytes([8])
    result += encoded_string(b'duskwood') + bytes([255, 2, 0])
    result += b''.join(map(encoded_string, [b'GB', bytes([1, 8, 255]), b'Title']))
    return result


def verify_evidence(data, pe):
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA
    for row in manifest['functions'] + manifest['data_ranges']:
        at = int(row['start'], 16); offset = pe.rva_offset(at - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        raw = data[offset:offset + row['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
    for name, digest in manifest['extracts'].items():
        assert hashlib.sha256((EVIDENCE / name).read_bytes()).hexdigest() == digest
    labels = json.loads((EVIDENCE / 'labels.json').read_text())
    assert labels['target_sha256'] == SHA
    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    for kind in ('classes', 'zones'):
        source = {row['key']: row['name'] for row in catalog[kind]}
        for label in labels[kind]:
            assert source[label['key']] == label['english']
            for field in ('descriptor_fields', 'key_bytes', 'english_bytes'):
                binding = label[field]
                at = int(binding['start'], 16)
                offset = pe.rva_offset(at - pe.image_base)
                assert offset == int(binding['file_offset'], 16)
                raw = data[offset:offset + binding['byte_count']]
                assert hashlib.sha256(raw).hexdigest() == binding['sha256']
                if field != 'descriptor_fields':
                    assert raw.decode() == label['key' if field == 'key_bytes' else 'english']
    assert [row['key'] for row in catalog['zones']] == ZONES


def source_contracts():
    """Bind the reviewed library ports; do not treat tokens as Rust execution."""
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/directory_wire.rs').read_text()
    source = source.split('#[cfg(test)]', 1)[0]
    # Preserve quoted literals while dropping comments, so evidence descriptions
    # and regression-test fixtures cannot themselves satisfy a source guard.
    source = re.sub(r'"(?:\\.|[^"\\])*"|//[^\n]*|/\*.*?\*/',
                    lambda match: '' if match[0].startswith(('//', '/*')) else match[0],
                    source, flags=re.S)
    source = re.sub(r'\s+', '', source)
    count = 0

    def check(condition, label):
        nonlocal count
        assert condition, f'Rust directory contract changed: {label}'
        count += 1

    def ordered(body, parts, label):
        previous = -1
        for part in parts:
            position = body.find(part, previous + 1)
            check(position > previous, f'{label}: {part}')
            previous = position

    declaration = source.split('pubstructWireLobby{', 1)[1].split('}', 1)[0]
    types = {
        'code': 'String', 'name': 'String', 'description': 'String', 'hero': 'String',
        'class_id': 'u8', 'zone_key': 'String', 'players': 'u8', 'locked': 'bool',
        'open': 'bool', 'country': 'String', 'classes': 'Vec<u8>',
        'host_title': 'String', 'max': 'u8',
    }
    for field, kind in types.items():
        check(f'pub{field}:{kind},' in declaration, f'{field} width/type')
    reader = source.split("impl<'a>Reader<'a>{", 1)[1].split('pubfndecode_response', 1)[0]
    ordered(reader, ['letend=self.at.checked_add(count)?;',
                     'letbytes=self.bytes.get(self.at..end)?;', 'self.at=end;'],
            'mandatory read bounds')
    for token in ['u32::from_le_bytes(self.take(4)?.try_into().ok()?)',
                  'u64::from_le_bytes(self.take(8)?.try_into().ok()?)',
                  'fnu32(&mutself)->Option<u32>{', 'fnu64(&mutself)->Option<u64>{',
                  'letlength=self.u32()?asusize;', 'Some(self.take(length)?.to_vec())',
                  'Some(String::from_utf8_lossy(&self.bytes()?).into_owned())']:
        check(token in reader, f'binary primitive {token}')
    decoder = source.split('pubfndecode_response', 1)[1].split('pubfnlobbies_message', 1)[0]
    ordered(decoder, ['lettag=reader.u8()?;', 'letcount=reader.u32()?asusize;',
                      'ifcount>(bytes.len()-reader.at)/30{returnNone;}',
                      'letmutrows=Vec::with_capacity(count);', 'for_in0..count{',
                      'rows.push(WireLobby{'], 'tag20 admission/vector')
    row = decoder.split('rows.push(WireLobby{', 1)[1].split('});', 1)[0]
    ordered(row, [f'{field}:reader.{operation}?,' for field, operation in [
        ('code', 'string()'), ('name', 'string()'), ('description', 'string()'),
        ('hero', 'string()'), ('class_id', 'u8()'), ('zone_key', 'string()'),
        ('players', 'u8()'),
    ]] + ['locked:reader.u8()?!=0,', 'open:reader.u8()?!=0,',
          'country:reader.string()?,', 'classes:reader.bytes()?,',
          'host_title:reader.string()?,', 'max:5,'], 'lobby field order')
    check('max:5,});}forrowin&mutrows{' in decoder, 'capacity follows entire row vector')
    check('ifletSome(max)=reader.u8(){row.max=max.clamp(1,5);}' in decoder,
          'optional capacity/default/clamp')
    check(decoder.count('reader.at') == 1, 'no final cursor/exhaustion restriction')
    for token in [
        '21|22|23|27=>DirectoryResponse::Text{tag,text:reader.string()?,}',
        '24|25=>DirectoryResponse::Number{tag,value:reader.u32()?,}',
        '26=>DirectoryResponse::Bytes{value:reader.u32()?,bytes:reader.bytes()?,}',
        '28=>DirectoryResponse::Unit,', '_=>returnNone,',
    ]:
        check(token in decoder, f'response dispatch {token}')
    tag29, tag30 = decoder.split('29=>{', 1)[1].split('30=>{', 1)
    ordered(tag29, ['letfirst=reader.string()?;', 'letfirst_number=reader.u64()?;',
                    'letsecond=reader.string()?;', 'letthird=reader.string()?;',
                    'letsecond_number=reader.u64()?;', 'strings:[first,second,third],',
                    'numbers:[first_number,second_number],', 'bytes:reader.bytes()?,'],
            'tag29 fields')
    ordered(tag30, ['letprefix=reader.string()?;', 'letfirst=reader.string()?;',
                    'letfirst_number=reader.u64()?;', 'letvalue=reader.u32()?;',
                    'letsecond=reader.string()?;', 'letsecond_number=reader.u64()?;',
                    'strings:[prefix,first,second],', 'numbers:[first_number,second_number],',
                    'value,', 'bytes:reader.bytes()?,'], 'tag30 fields')
    projection = source.split('pubfnlobbies_message', 1)[1]
    for token in [
        'letzones=crate::guardians::catalog::ZONES;',
        'zones.iter().position(|zone|zone.key==row.zone_key)',
        'letzone=ifzone_index.is_some(){zone_name(&row.zone_key)}else{row.zone_key.clone()};',
        '(1..=11).contains(&row.class_id)&&(0x5df_u16&(1<<(row.class_id-1)))!=0',
        'class_name(row.class_id)}else{String::new()}',
        '"opened":(zone_index.unwrap_or(0)asu64)<open_zones.clamp(1,12)',
        '"locked":row.locked', '"open":row.open', '"players":row.players',
        '"max":row.max', '"classes":row.classes', '"class":class', '"zone":zone',
        '"code":row.code', '"name":row.name', '"description":row.description',
        '"hostTitle":row.host_title', '"hero":row.hero',
        '"country":row.country', 'json!({"type":"lobbies","list":list})',
    ]:
        check(token in projection, f'menu projection {token}')
    return count


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    verify_evidence(data, pe)
    source_guards = source_contracts()
    probe, cases = Probe(data, pe), 0
    for count in range(7):
        base = bytes([20]) + struct.pack('<I', count) + b''.join(encoded_row(i) for i in range(count))
        rows = probe.decode(base)
        assert len(rows) == count and all(row['max'] == 5 for row in rows)
        for trailer in [b'', b'\0', b'\xff', bytes([1, 2, 3, 4, 5, 6, 0, 255])]:
            rows = probe.decode(base + trailer)
            assert [row['max'] for row in rows] == [max(1, min(5, trailer[i])) if i < len(trailer) else 5 for i in range(count)]
            for row in rows:
                assert (row['class_id'], row['players'], row['locked'], row['open']) == (8, 255, 1, 0)
                assert row['classes'] == [1, 8, 255]
                assert row['zone_key'] == 'duskwood' and row['host_title'] == 'Title'
            cases += 1
        for end in range(len(base)):
            assert probe.decode(base[:end]) is None, (count, end)
            cases += 1
    for max_value in range(256):
        raw = bytes([20, 1, 0, 0, 0]) + encoded_row() + bytes([max_value])
        assert probe.decode(raw)[0]['max'] == max(1, min(5, max_value)); cases += 1
    for tag in range(256):
        result = probe.decode(bytes([tag]))
        assert result == (8 if tag == 28 else None), (tag, result)
        cases += 1
    # Exercise every other admitted tag with its full field widths, including
    # the two nested payload owners rather than only their dispatch entries.
    number, token = 0xfedcba98, 0xfedcba9876543210
    texts = [b'one', b'two', b'three']
    for tag in (21, 22, 23, 27):
        raw = bytes([tag]) + encoded_string(texts[0])
        assert probe.decode(raw) == tag - 20 and probe.s(probe.HEAP + 8) == 'one'
        for end in range(len(raw)):
            assert probe.decode(raw[:end]) is None; cases += 1
    for tag in (24, 25):
        raw = bytes([tag]) + struct.pack('<I', number)
        assert probe.decode(raw) == tag - 20
        assert struct.unpack('<I', probe.cpu.mem_read(probe.HEAP + 8, 4))[0] == number
        for end in range(len(raw)):
            assert probe.decode(raw[:end]) is None; cases += 1
    raw = bytes([26]) + struct.pack('<I', number) + encoded_string(b'\xff\0A')
    assert probe.decode(raw) == 6 and probe.q(probe.HEAP + 32) & 0xffffffff == number
    assert bytes(probe.cpu.mem_read(probe.q(probe.HEAP + 16), probe.q(probe.HEAP + 24))) == b'\xff\0A'
    for end in range(len(raw)):
        assert probe.decode(raw[:end]) is None; cases += 1
    raw = bytes([29]) + encoded_string(texts[0]) + struct.pack('<Q', token)
    raw += encoded_string(texts[1]) + encoded_string(texts[2]) + struct.pack('<Q', 7) + encoded_string(b'raw')
    assert probe.decode(raw) == 9
    assert [probe.s(probe.HEAP + off) for off in (8, 32, 56)] == ['one', 'two', 'three']
    assert [probe.q(probe.HEAP + off) for off in (104, 112)] == [token, 7]
    assert bytes(probe.cpu.mem_read(probe.q(probe.HEAP + 88), probe.q(probe.HEAP + 96))) == b'raw'
    for end in range(len(raw)):
        assert probe.decode(raw[:end]) is None; cases += 1
    raw = bytes([30]) + encoded_string(texts[0]) + encoded_string(texts[1])
    raw += struct.pack('<QI', token, number) + encoded_string(texts[2]) + struct.pack('<Q', 7) + encoded_string(b'raw')
    assert probe.decode(raw) is not None
    assert [probe.s(probe.HEAP + off) for off in (0, 24, 48)] == ['one', 'two', 'three']
    assert [probe.q(probe.HEAP + off) for off in (96, 104)] == [token, 7]
    assert struct.unpack('<I', probe.cpu.mem_read(probe.HEAP + 112, 4))[0] == number
    assert bytes(probe.cpu.mem_read(probe.q(probe.HEAP + 80), probe.q(probe.HEAP + 88))) == b'raw'
    for end in range(len(raw)):
        assert probe.decode(raw[:end]) is None; cases += 1
    for zone, selected, count in itertools.product(ZONES + ['unknown'], [1, 6, 11], [0, 1, 2, 11, 12, 13, (1 << 64) - 1]):
        index, unlocked = probe.eligibility(zone, selected, [(7, 12), (selected, count)])
        assert index == (ZONES.index(zone) if zone in ZONES else 0)
        assert unlocked == max(1, min(12, count)), (zone, selected, count, unlocked)
        cases += 1
    assert probe.eligibility('naxx', 1, [(7, 12)]) == (11, 1)
    assert probe.eligibility('duskwood', 1, [(1, 2), (1, 12)]) == (1, 2)
    labels = json.loads((EVIDENCE / 'labels.json').read_text())
    names = {row['class_id']: row['english'] for row in labels['classes']}
    for class_id in range(256):
        label = probe.eligibility('unknown', 1, [], class_id, capture=0x145998154)
        assert label == names.get(class_id, ''), (class_id, label)
        cases += 1
    print(f'PASS {cases + 2} native response/eligibility cases, {source_guards} library source guards; String/allocator/JSON/locale seams explicit; no compilation/network/game/parity')


if __name__ == '__main__': main()
