#!/usr/bin/env python3
"""Current directory parser/receiver proof without compilation or network access.

Runs bounded original 0.115.0 instructions under Unicorn. JSON lookup, allocation,
memcpy and ownership drops are deterministic seams. It does not run the game,
compiled Rust, OS sockets, a service request, rendering or parity comparisons.
"""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe
from script_sources import load_script

EVIDENCE = ROOT / 'docs/analysis/evidence/0.115.0/coop-directory'
M = json.loads((EVIDENCE / 'manifest.json').read_text())
T = latest_target(verify=True)
assert T['sha256'] == M['target']['sha256']
DATA = target_bytes(T)
PE = load_script('directory_pe', ROOT / 'scripts/inventory-executable.py').PE(DATA)
ranges = [(int(row['start'], 16), int(row['end_exclusive'], 16))
          for row in M['functions']]
byte_guards = 0
for row, (start, end) in zip(M['functions'], ranges):
    offset = PE.rva_offset(start - PE.image_base)
    assert offset == int(row['file_offset'], 16)
    assert hashlib.sha256(DATA[offset:offset + end - start]).hexdigest() == row['sha256']
    byte_guards += 1
for name, digest in M['extracts'].items():
    assert hashlib.sha256((EVIDENCE / name).read_bytes()).hexdigest() == digest, name
    byte_guards += 1
for row in M['data_ranges']:
    offset = PE.rva_offset(int(row['start'], 16) - PE.image_base)
    assert offset == int(row['file_offset'], 16)
    payload = DATA[offset:offset + row['byte_count']]
    assert payload.hex() == row['bytes_hex']
    assert hashlib.sha256(payload).hexdigest() == row['sha256']
    byte_guards += 1
for row in M['ghidra']:
    # Retained sessions are optional on another machine; saved results present
    # here must still match the original durable query's exact digest.
    path = (ROOT / row['retained_result']['path']).resolve()
    assert path.is_relative_to(ROOT / 'runtime')
    if path.exists():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == row['retained_result']['sha256']
        byte_guards += 1

class Probe(EquipmentProbe):
    def __init__(self):
        super().__init__(DATA, PE, ranges)
        self.objects = {}

    def value(self, value, at=None):
        """Supply serde_json's recovered Value/Number variants to native code.

        Objects carry a harness token instead of a real map. Only the exact
        field-getter seam dereferences that token; native array iteration,
        unsigned-number tests, casts, defaults and output writes stay intact.
        """
        at = at or self.alloc(32)
        self.native.mem_write(at, bytes(32))
        if value is None:
            return at
        if type(value) is bool:
            self.native.mem_write(at, bytes([1, int(value)]))
        elif type(value) is int:
            if 0 <= value < 2**64:
                self.put(at, 2, 0, value, 0)
            elif -(2**63) <= value < 0:
                self.put(at, 2, 1, value & ((1 << 64) - 1), 0)
            else:
                bits = struct.unpack('<Q', struct.pack('<d', float(value)))[0]
                self.put(at, 2, 2, bits, 0)
        elif type(value) is float:
            bits = struct.unpack('<Q', struct.pack('<d', value))[0]
            self.put(at, 2, 2, bits, 0)
        elif isinstance(value, str):
            raw = value.encode()
            pointer = self.alloc(len(raw))
            self.native.mem_write(pointer, raw)
            self.put(at, 3, len(raw), pointer, len(raw))
        elif isinstance(value, list):
            pointer = self.alloc(len(value) * 32)
            for index, item in enumerate(value):
                self.value(item, pointer + 32 * index)
            self.put(at, 4, len(value), pointer, len(value))
        elif isinstance(value, dict):
            token = self.alloc(1)
            self.objects[token] = value
            self.put(at, 5, token, 0, 0)
        else:
            raise ValueError(type(value))
        return at

    def hook(self, uc, pc, size, unused):
        if pc == self.DONE:
            uc.emu_stop()
            return
        if any(start <= pc and pc + size <= end for start, end in self.ranges):
            return
        rcx, rdx, r8 = (self.reg(name) for name in ['RCX', 'RDX', 'R8'])
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        if pc == 0x142a769a0:  # immutable JSON field lookup
            key = self.text(rcx, rdx)
            obj = self.objects.get(self.q(r8 + 8), {}) if self.q(r8) == 5 else {}
            self.reg('RAX', self.value(obj.get(key)))
        elif pc in [0x140002200, 0x1400021d0, 0x140023810, 0x1400e61a0, 0x1400cd080]:
            pass  # allocator marker, free, JSON/event/old-row ownership drops
        elif pc == 0x1400021c0:
            self.reg('RAX', self.alloc(rcx))
        elif pc == 0x145d145fb:
            uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc == 0x145d14a10:  # Vec<u8> growth; existing contents remain intact
            capacity, pointer, length = (self.q(rcx + index * 8) for index in range(3))
            new_capacity = max(capacity * 2, length + 1, 8)
            new_pointer = self.alloc(new_capacity)
            uc.mem_write(new_pointer, bytes(uc.mem_read(pointer, length)))
            self.put(rcx, new_capacity, new_pointer, length)
        else:
            raise RuntimeError(f'Unreviewed call {pc:#x} from {self.q(self.reg("RSP")):#x}')
        stack = self.reg('RSP')
        self.reg('RSP', stack + 8)
        self.reg('RIP', self.q(stack))

    def row(self, at):
        out = {}
        for key, offset in M['contracts']['string_offsets'].items():
            out[key] = self.text(self.q(at + offset + 8), self.q(at + offset + 16))
        out['classes'] = list(self.native.mem_read(self.q(at + 0x50), self.q(at + 0x58)))
        out['opened'] = bool(self.native.mem_read(at + 0xe8, 1)[0])
        out['locked'] = bool(self.native.mem_read(at + 0xe9, 1)[0])
        out['players'] = self.q(at + 0xd8)
        out['max'] = self.q(at + 0xe0)
        return out

    def parse(self, values):
        array = self.value(values)
        begin = self.q(array + 16)
        output = self.alloc(len(values) * 0xf0)
        length = self.alloc(8)
        state = self.alloc(24)
        self.put(state, length, 0, output)
        self.invoke(0x1400749a0, begin, begin + len(values) * 32, state)
        assert self.q(length) == len(values)
        return [self.row(output + index * 0xf0) for index in range(len(values))]

    def receive(self, messages, revision=0):
        array = self.value(messages)
        queue = self.alloc(24)
        self.put(queue, len(messages), self.q(array + 16), len(messages))
        resource = self.alloc(0x138)
        self.put(resource + 0x60, 0, 8, 0)
        self.put(resource + 0x120, revision)
        wrappers = []
        for base in [queue, resource, self.alloc(64), self.alloc(64)]:
            wrapper, tick = self.alloc(32), self.alloc(8)
            self.put(wrapper, base, 0, tick, 0)
            wrappers.append(wrapper)
        stack = self.STACK + 0x1f0008
        self.put(stack, self.DONE)
        self.put(stack + 40, wrappers[3])
        for register, value in [('RSP', stack), ('RCX', 0), ('RDX', wrappers[0]),
                                ('R8', wrappers[1]), ('R9', wrappers[2]), ('MXCSR', 0x1f80)]:
            self.reg(register, value)
        self.native.emu_start(0x14021b980, self.DONE, count=1000000)
        assert self.reg('RIP') == self.DONE
        received = bool(self.native.mem_read(resource + 0x12d, 1)[0])
        rows = [self.row(self.q(resource + 0x68) + index * 0xf0)
                for index in range(self.q(resource + 0x70))]
        return {'received': received, 'revision': self.q(resource + 0x120), 'rows': rows}


NODE_FIELDS={'width':136,'height':144,'min_width':152,'min_height':160,'max_width':168,'max_height':176,'margin':184,'padding':216,'border':248,'border_radius':280,'row_gap':320,'column_gap':328,'flex_grow':348,'flex_shrink':352,'overflow':356,'bytes360':360,'bytes368':368,'bytes376':376}
def decode_node(b):
 out={}
 for k,n in NODE_FIELDS.items():
  if k in['width','height','min_width','min_height','max_width','max_height','row_gap','column_gap']:out[k]=list(struct.unpack_from('<If',b,n))
  elif k in['margin','padding','border','border_radius']:out[k]=[list(struct.unpack_from('<If',b,n+i*8))for i in range(4)]
  elif k in['flex_grow','flex_shrink']:out[k]=struct.unpack_from('<f',b,n)[0]
  else:out[k]=list(b[n:n+8])
 return out
class StyleProbe(EquipmentProbe):
 def __init__(self,capture):super().__init__(DATA,PE,ranges);self.capture=capture;self.nodes=[]
 def hook(self,uc,pc,size,_):
  if pc==self.DONE:uc.emu_stop();return
  if any(a<=pc and pc+size<=b for a,b in self.ranges)and pc!=self.capture:return
  a,b,c,d=(self.reg(r)for r in['RCX','RDX','R8','R9']);sp=self.reg('RSP')
  if pc==self.capture:
   p={'frame':c+8,'left':c+8,'right':c+8,'tooltip':c+8}[self.kind];self.result={'fields':decode_node(bytes(uc.mem_read(p,384))),'bytes':bytes(uc.mem_read(p,384)).hex()}
   if self.kind=='frame':self.result['hover']={'resting':list(struct.unpack('<I4f',uc.mem_read(c+0x198,20))),'active':list(struct.unpack('<I4f',uc.mem_read(c+0x1ac,20))),'lift':struct.unpack('<f',uc.mem_read(c+0x1c0,4))[0]}
   uc.emu_stop();return
  if pc in[0x140002200,0x1400021d0]:pass
  elif pc==0x1400021c0:self.reg('RAX',self.alloc(a))
  elif pc==0x145d145fb:uc.mem_write(a,bytes(uc.mem_read(b,c)));self.reg('RAX',a)
  elif pc==0x140242370:uc.mem_write(a,bytes(104))
  elif pc in[0x1402b57b0,0x1402bacf0,0x1402bfa00,0x1402b90e0]:uc.mem_write(a,bytes(uc.mem_read(b,48)));self.reg('RAX',a)
  elif pc==0x145ce7810:self.output(a,self.text(self.q(b+8),self.q(b+16)))
  elif pc==0x1458dfee0:
   raw=self.text(a,b).encode();p=self.alloc(len(raw));uc.mem_write(p,raw);self.reg('RAX',p);self.reg('RDX',len(raw))
  elif pc==0x1458e0370:
   val=self.text(b,c)
   for ix in range(self.q(sp+40)):
    at=d+ix*32;key=self.text(self.q(at),self.q(at+8));v=self.q(at+16);value=self.text(self.q(v+8),self.q(v+16));val=val.replace('{'+key+'}',value)
   self.output(a,val)
  elif pc==0x145ce7350:
   at=b;arg=0;val=''
   while True:
    op=uc.mem_read(at,1)[0];at+=1
    if op==0:break
    if op<0x80:val+=self.text(at,op);at+=op;continue
    assert op==0xc0
    ptr=self.q(c+arg*16);fmt=self.q(c+arg*16+8);arg+=1
    if fmt==0x145cf9cf0:val+=str(self.q(ptr))
    else:val+=self.number(ptr,fmt)
   self.output(a,val)
  elif pc==0x14020b170:
   # Only a tooltip case enters the real helper; keep all its instructions.
   raise RuntimeError('helper was not in ranges')
  elif pc==0x1402425a0:uc.mem_write(a,bytes(32));self.reg('RAX',a)
  elif pc==0x142679460:uc.mem_write(a,bytes(32));self.reg('RAX',a)
  elif pc in[0x1402baf80,0x1402d2c30]:pass
  else:raise RuntimeError(f'Call {pc:#x} from {self.q(sp):#x}')
  self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
 def run(self,kind,opened=True,title=''):
  self.kind=kind;row=self.alloc(240)
  for o,val in[(0,'CODE'),(24,'Name'),(48,'Desc'),(96,'Hero'),(120,'Class'),(144,'Zone'),(168,'GB'),(192,title)]:self.output(row+o,val)
  classes=self.alloc(1);self.native.mem_write(classes,b'\x01');self.put(row+72,1,classes,1);self.put(row+216,1,5);self.native.mem_write(row+232,bytes([int(opened),0]));res=self.alloc(312);self.put(res+96,1,row,1);self.put(res+264,0xffffffffffffffff,1,0)
  builder=self.alloc(64);self.put(builder,1);font=self.alloc(64);self.native.mem_write(font,b'\x01');self.native.mem_write(font+24,b'\x01');ref=self.alloc(8);self.put(ref,row);closure=self.alloc(32);self.put(closure,row,font,ref,self.alloc(64));sp=self.STACK+0x1f0008;self.put(sp,self.DONE)
  self.reg('RSP',sp);self.reg('MXCSR',0x1f80)
  if kind=='frame':self.reg('RCX',builder);self.reg('RDX',font);self.reg('R8',self.alloc(64));self.reg('R9',res);start=0x14020a850
  else:self.reg('RCX',builder);self.reg('RDX',closure);start=0x1402ebc50
  self.native.emu_start(start,self.DONE,count=1000000);return self.result


def check(integration=False):
    probe = Probe()
    fixtures = json.loads((EVIDENCE / 'row-fixtures.json').read_text())
    cases = 0
    for fixture in fixtures:
        assert probe.parse([fixture['value']]) == [fixture['expected']], fixture['name']
        cases += 1

    def default_row(**changes):
        row = dict(fixtures[0]['expected'])
        row.update(changes)
        return row

    for message in [None, {}, [], {'type': None}, {'type': 3},
                    {'type': 'Lobbies'}, {'type': 'lobbies '}, {'type': 'unknown'}]:
        actual = probe.receive([message])
        assert actual == {'received': False, 'revision': 0, 'rows': []}, message
        cases += 1
    for value in [None, False, 0, 1.5, 'not an array', {}, []]:
        actual = probe.receive([{'type': 'lobbies', 'list': value}])
        assert actual == {'received': True, 'revision': 1, 'rows': []}, value
        cases += 1
    for messages, expected in [
        ([{'type': 'lobbies'}], []),
        ([{'type': 'lobbies', 'list': [None, 4]}], [default_row(), default_row()]),
        ([{'type': 'lobbies', 'list': [{'code': 'A'}]},
          {'type': 'Lobbies', 'list': []}], [default_row(code='A')]),
        ([{'type': 'lobbies', 'list': [{'code': 'A'}]},
          {'type': 'lobbies', 'list': [{'code': 'B'}]}], [default_row(code='B')]),
        ([{'type': 'lobbies', 'list': [{'code': 'A'}]},
          {'type': 'lobbies'}], []),
    ]:
        actual = probe.receive(messages)
        assert actual['received'] and actual['rows'] == expected
        assert actual['revision'] == sum(message['type'] == 'lobbies' for message in messages)
        cases += 1
    actual = probe.receive([{'type': 'lobbies'}], revision=(1 << 64) - 1)
    assert actual == {'received': True, 'revision': 0, 'rows': []}
    cases += 1
    for count in [0, 1, 2, 3, 20, 21, 30, 64, 65, 100, 200]:
        for pattern in [0, 1, 2]:
            values = [{'code': str(i),
                       'hostTitle': ('Host' if (i % 2 == 1 if pattern == 0 else
                                               i >= count // 2 if pattern == 1 else
                                               i < count // 2) else '')}
                      for i in range(count)]
            expected = [default_row(**value) for value in values if value['hostTitle']]
            expected += [default_row(**value) for value in values if not value['hostTitle']]
            actual = probe.receive([{'type': 'lobbies', 'list': values}])
            assert actual == {'received': True, 'revision': 1, 'rows': expected}, (count, pattern)
            cases += 1

    class_source = (ROOT / 'crates/azeroth-survivors-re/src/coop/game_party.rs').read_text()
    class_source = class_source[class_source.index('pub fn class_key('):class_source.index('pub fn class_color(')]
    class_keys = {int(class_id): key for class_id, key in
                  re.findall(r'(\d+) => "([^"]+)"', class_source)}
    assert '_ => "warrior"' in class_source
    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    icons = {row['key']: row['icon'] for row in catalog['classes']}
    icon_proof = json.loads((EVIDENCE / 'class-icons.json').read_text())
    descriptors = {int(row['descriptor'], 16): row for row in icon_proof['records']}
    for class_id in range(256):
        probe.invoke(0x145809ca0, class_id)
        descriptor = probe.reg('RAX')
        row = descriptors[descriptor]
        native_key = probe.text(probe.q(descriptor + 0x10), probe.q(descriptor + 0x18))
        native_icon = probe.text(probe.q(descriptor + 0x60), probe.q(descriptor + 0x68))
        assert native_key == row['key'] == class_keys.get(class_id, 'warrior')
        assert native_icon == row['icon'] == icons[native_key]
        cases += 1
    style_probe = StyleProbe(0)
    captures = {'frame': 0x14020aed3, 'left': 0x1402ebf00,
                'right': 0x1402ec922, 'tooltip': 0x1402ed4c1}
    for fixture in json.loads((EVIDENCE / 'style-fields.json').read_text()):
        style_probe.capture = captures[fixture['role']]
        actual = style_probe.run(fixture['role'], fixture['opened'], fixture['title'])
        assert actual == {key: value for key, value in fixture.items()
                          if key not in ['role', 'opened', 'title']}, fixture['role']
        if fixture['role'] == 'tooltip':
            raw_node = bytes.fromhex(actual['bytes'])
            assert struct.unpack_from('<If', raw_node, 104) == (1, 0.)
            assert struct.unpack_from('<If', raw_node, 128) == (2, 100.)
            assert raw_node[371] == 1 and raw_node[373] == 3  # absolute, Display::None
        cases += 1

    # Static source tracing binds the independently checked native contract to
    # the Rust path. Rust semantic tests in directory.rs are authored but unrun.
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/directory.rs').read_text()
    fields = dict(re.findall(r'pub (\w+): ([^,\n]+)', source))
    for key in ['code', 'name', 'description', 'host_title', 'hero', 'class', 'zone', 'country']:
        assert fields[key] == 'String', key
    assert fields['classes'] == 'Vec<u8>'
    assert all(fields[key] == 'u64' for key in ['players', 'max', 'revision'])
    assert all(fields[key] == 'bool' for key in ['opened', 'locked'])
    for token in ['code: string("code")', 'name: string("name")',
                  'description: string("description")', 'host_title: string("hostTitle")',
                  'hero: string("hero")', 'class: string("class")',
                  'zone: string("zone")', 'country: string("country")',
                  'value["classes"]', '.filter_map(Value::as_u64)',
                  '.map(|class| class as u8)',
                  'opened: value["opened"].as_bool().unwrap_or(true)',
                  'players: value["players"].as_u64().unwrap_or(1)',
                  'max: value["max"].as_u64().unwrap_or(5)',
                  'locked: value["locked"].as_bool().unwrap_or(false)',
                  'message["type"].as_str() != Some("lobbies")',
                  'message["list"]', '.map(DirectoryLobby::read)',
                  'rows.sort_by_key(|row| row.host_title.is_empty())',
                  'self.snapshot = Some(rows)', 'self.revision.wrapping_add(1)']:
        assert token in source, token
    assert 'pub mod directory;' in (ROOT / 'crates/azeroth-survivors-re/src/coop/mod.rs').read_text()
    presentation = (ROOT / 'crates/azeroth-survivors-re/src/coop_directory_row.rs').read_text()
    compact = re.sub(r'\s+', '', presentation)
    for token in ['row.host_title.is_empty()', 'Color::srgb(0.56, 0.27, 0.98)',
                  'Color::srgb(0.86, 0.66, 1.)', 'Color::srgb(0.427, 0.333, 0.145)',
                  'Color::srgb(0.973, 0.824, 0.416)', 'column_gap: Val::Px(14.)',
                  'padding: UiRect::axes(Val::Px(12.), Val::Px(6.))',
                  'border: UiRect::all(Val::Px(if titled { 2. } else { 1. }))',
                  'if row.unlocked { 1. } else { 0. }', 'flex_direction: FlexDirection::Column',
                  'column_gap: Val::Px(3.)', 'width: Val::Px(22.)', 'height: Val::Px(22.)',
                  'font: art.heading_font.clone()', 'font_size: 20.',
                  '"{} · {}", row.name, label(locale, "Password")',
                  '"{hero} the {class} · {zone}"', '.replace("{hero}", &row.host)',
                  '.replace("{class}", &row.hero_class)', '.replace("{zone}", &row.zone)',
                  '"You haven\'t unlocked {zone} with this class yet."',
                  '!row.country.is_empty()', 'art.icons.get(class)',
                  'bottom: Val::Percent(100.)', 'left: Val::Px(0.)',
                  'margin: UiRect::bottom(Val::Px(4.))',
                  'padding: UiRect::axes(Val::Px(8.), Val::Px(3.))',
                  'GlobalZIndex(9000)', 'Color::srgba(0.06, 0.02, 0.12, 0.95)',
                  'if node.display != display', 'node.display = display']:
        assert re.sub(r'\s+', '', token) in compact, token

    if integration:
        mapper = (ROOT / 'crates/azeroth-survivors-re/src/coop_directory.rs').read_text()
        mapper = mapper[mapper.index('fn publish_directory('):]
        for token in ['view.lobbies = directory.snapshot.as_ref().map(',
                      'host: row.hero.clone()', 'hero_class: row.class.clone()',
                      'host_title: row.host_title.clone()', 'country: row.country.clone()',
                      'zone: row.zone.clone()', 'zone_key: row.zone.clone()',
                      'unlocked: row.opened', 'has_password: row.locked',
                      'joined: row.players', 'capacity: row.max',
                      'game_party::class_key(*id)']:
            assert token in mapper, token
        ui_source = (ROOT / 'crates/azeroth-survivors-re/src/coop_ui.rs').read_text()
        assert 'crate::coop_directory_row::frame(lobby)' in ui_source
        assert 'crate::coop_directory_row::spawn(ui, &art, &locale, lobby)' in ui_source
        assert 'if !row.unlocked' in ui_source
        assert 'coop_directory_row::DirectoryRowPlugin' in (ROOT / 'crates/azeroth-survivors-re/src/main.rs').read_text()
    print(f'PASS: {cases} bounded original-instruction directory cases, '
          f'{byte_guards} target/extract/result guards and source-contract tracing; '
          f'live integration guards {"checked" if integration else "not requested"}; '
          'no compilation, Rust/game/service execution or parity comparison')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--integration', action='store_true', help='also require the live service mapper and UI consumers')
    check(parser.parse_args().integration)
