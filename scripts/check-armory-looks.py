#!/usr/bin/env python3
"""Replay the 0.117.0 Armory Look parent, scroll row and retained viewport.

This is a non-compiling instruction fixture. No application, rebuilt code, UI
publication, layout or interaction runs. Default mode compares retained evidence
without writing; --stage writes only runtime/0.117.0/armory-looks/nodes-staged.json.
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
sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86 import X86_OP_REG, X86_OP_MEM, X86_REG_RIP
from coverage_common import latest_target, target_bytes
from equipment_native import EquipmentProbe
from unicorn import UC_HOOK_MEM_WRITE

TARGET = '507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293'
LOOK_OWNER, LOOK_END = 0x14031b280, 0x14031c5b6
PARENT_OWNER, PARENT_END = 0x14023d840, 0x14023db5d
MEMCPY = 0x145f93cdb
NODE_SIZE = 384

# Explicit field interpretation for these current stores, not a whole-target
# compiler-layout claim. The current Node extent ends at the Kept key +392.
# Scalar/rect offsets match the retained Node layout and Bevy 0.18.1 types;
# current writes, literal bytes and poison trials are independently captured.
VAL_OFFSETS = {'left': 104, 'right': 112, 'top': 120, 'bottom': 128,
               'width': 136, 'height': 144, 'min_width': 152,
               'min_height': 160, 'max_width': 168, 'max_height': 176,
               'flex_basis': 312, 'row_gap': 320, 'column_gap': 328}
RECT_OFFSETS = {'margin': 184, 'padding': 216, 'border': 248, 'border_radius': 280}
FLOAT_OFFSETS = {'scrollbar_width': 344, 'flex_grow': 348, 'flex_shrink': 352}
BYTE_OFFSETS = {'box_sizing': 370, 'position_type': 371, 'flex_wrap': 372,
                'display': 373, 'flex_direction': 374, 'grid_auto_flow': 375,
                'justify_items': 376, 'justify_self': 377, 'align_items': 378,
                'align_self': 379, 'align_content': 380, 'justify_content': 381}
ENUMS = {'FlexDirection': {'Row': 0, 'Column': 1},
         'FlexWrap': {'NoWrap': 0, 'Wrap': 1},
         'AlignContent': {'Default': 0, 'FlexStart': 3},
         'OverflowAxis': {'Visible': 0, 'Scroll': 3},
         'Val': {'Auto': 0, 'Px': 1, 'Percent': 2}}

selected = latest_target(verify=True)
assert selected['sha256'] == TARGET
data = target_bytes(selected)
spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True

def raw(address, count):
    offset = pe.rva_offset(address - pe.image_base)
    return data[offset:offset + count]

def bound(start, end):
    return {'va': hex(start), 'end_exclusive': hex(end),
            'sha256': hashlib.sha256(raw(start, end - start)).hexdigest()}

def xmm_seeds(start, stop):
    values, origins = {}, {}
    for ins in md.disasm(raw(LOOK_OWNER, start - LOOK_OWNER), LOOK_OWNER):
        for register in ins.regs_access()[1]:
            name = ins.reg_name(register)
            if not name.startswith('xmm'):
                continue
            value, origin = None, None
            if ins.mnemonic in ('xorps', 'pxor') and ins.operands[0].reg == ins.operands[1].reg:
                value, origin = bytes(16), {'site': hex(ins.address), 'kind': 'zero'}
            elif ins.mnemonic in ('movaps', 'movups', 'movss', 'movsd'):
                source = ins.operands[1]
                if source.type == X86_OP_REG:
                    source_name = ins.reg_name(source.reg)
                    value, origin = values.get(source_name), origins.get(source_name)
                elif source.type == X86_OP_MEM and source.mem.base == X86_REG_RIP:
                    at = ins.address + ins.size + source.mem.disp
                    count = 4 if ins.mnemonic == 'movss' else 8 if ins.mnemonic == 'movsd' else 16
                    value = raw(at, count) + bytes(16 - count)
                    origin = {'site': hex(ins.address), 'address': hex(at), 'bytes': value.hex()}
            values[name], origins[name] = value, origin
    needed, written = set(), set()
    for ins in md.disasm(raw(start, stop - start), start):
        reads, writes = ins.regs_access()
        if ins.mnemonic in ('xorps', 'pxor') and ins.operands[0].reg == ins.operands[1].reg:
            reads = [reg for reg in reads if reg != ins.operands[0].reg]
        needed.update(ins.reg_name(reg) for reg in reads
                      if ins.reg_name(reg).startswith('xmm') and ins.reg_name(reg) not in written)
        written.update(ins.reg_name(reg) for reg in writes)
    assert all(values.get(name) is not None for name in needed), needed
    return {name: values[name] for name in sorted(needed)}, {name: origins[name] for name in sorted(needed)}

def intervals(numbers):
    result = []
    for value in sorted(numbers):
        if result and result[-1][1] == value:
            result[-1][1] += 1
        else:
            result.append([value, value + 1])
    return result

def decode(node):
    def val(at):
        tag, value = struct.unpack_from('<If', node, at)
        assert tag in (0, 1, 2)
        return [tag, None if tag == 0 else value]
    result = {key: val(at) for key, at in VAL_OFFSETS.items()}
    result.update({key: [val(at + index * 8) for index in range(4)]
                   for key, at in RECT_OFFSETS.items()})
    result.update({key: struct.unpack_from('<f', node, at)[0] for key, at in FLOAT_OFFSETS.items()})
    result.update({key: node[at] for key, at in BYTE_OFFSETS.items()})
    result['overflow'] = list(node[356:358])
    return result

def masked(node):
    result = bytearray(node)
    ignored = set(range(341, 344)) | set(range(382, 384))
    offsets = list(VAL_OFFSETS.values())
    offsets.extend(at + index * 8 for at in RECT_OFFSETS.values() for index in range(4))
    for at in offsets:
        if struct.unpack_from('<I', node, at)[0] == ENUMS['Val']['Auto']:
            ignored.update(range(at + 4, at + 8))
    for at in ignored:
        result[at] = 0
    return bytes(result), ignored

def capture(name, start, stop, node_offset, poison):
    parent = name == 'look-parent'
    values, origins = ({}, {}) if parent else xmm_seeds(start, stop)
    writes = set()
    class Probe(EquipmentProbe):
        def hook(self, uc, pc, size, unused):
            if pc == stop:
                self.node_pointer = self.reg('R8') + 8
                assert self.node_pointer == self.frame + node_offset
                self.node = bytes(self.native.mem_read(self.node_pointer, NODE_SIZE))
                self.key = self.pair(self.reg('R8') + 392) if name == 'viewport' else None
                self.native.emu_stop()
                return
            if pc == MEMCPY:
                destination, source, count = (self.reg(reg) for reg in ('RCX', 'RDX', 'R8'))
                assert name == 'viewport' and count == 160
                self.native.mem_write(destination, bytes(self.native.mem_read(source, count)))
                self.reg('RAX', destination)
                writes.update(at for at in range(destination, destination + count)
                              if self.frame + node_offset <= at < self.frame + node_offset + NODE_SIZE)
                self.copy = {'destination_offset': destination - (self.frame + node_offset),
                             'source_offset_from_rbp': source - self.frame, 'bytes': count,
                             'call_site': hex(self.q(self.reg('RSP')) - 5)}
                sp = self.reg('RSP')
                self.reg('RIP', self.q(sp))
                self.reg('RSP', sp + 8)
                return
            return super().hook(uc, pc, size, unused)
    probe = Probe(data, pe, [(start, stop)])
    probe.frame = probe.STACK + 0x102000
    probe.native.mem_write(probe.frame - 0x400, bytes([poison]) * 0x1000)
    probe.reg('RSP', probe.frame if parent else probe.frame - 0x2000)
    probe.reg('RBP', probe.frame)
    if parent:
        probe.reg('RDX', probe.HEAP + 0x1000)
    for register, value in values.items():
        probe.reg(register.upper(), int.from_bytes(value, 'little'))
    # These UI/context pointers are opaque. The selected instructions do not
    # dereference them, apart from the parent's first entity-word read above.
    for register in ('RSI', 'R12', 'R14', 'R15', 'RDI'):
        probe.reg(register, probe.HEAP + 0x1000)
    def track_write(uc, access, address, size, value, unused):
        writes.update(at for at in range(address, address + size)
                      if probe.frame + node_offset <= at < probe.frame + node_offset + NODE_SIZE)
    probe.native.hook_add(UC_HOOK_MEM_WRITE, track_write)
    probe.native.emu_start(start, 0, count=2000)
    assert probe.reg('RIP') == stop
    return {'node': probe.node, 'key': probe.key, 'fields': decode(probe.node),
            'written': {at - probe.node_pointer for at in writes},
            'seeds': origins, 'memcpy': getattr(probe, 'copy', None)}

records = []
for name, start, stop, node_offset in [('look-parent', 0x14023d874, 0x14023dae2, 0xb0),
                                       ('scroll-row', 0x14031b8a1, 0x14031bad6, 0x2a0),
                                       ('viewport', 0x14031bb23, 0x14031bd57, 0x2a0)]:
    trials = [capture(name, start, stop, node_offset, fill) for fill in (0xA5, 0x5A)]
    a, b = trials
    clean_a, ignored = masked(a['node'])
    clean_b, ignored_b = masked(b['node'])
    assert clean_a == clean_b and ignored == ignored_b
    assert a['fields'] == b['fields'] and a['written'] == b['written']
    changed = {at for at in range(NODE_SIZE) if a['node'][at] != b['node'][at]}
    assert changed <= ignored
    records.append({'name': name, 'key': a['key'], 'initializer': bound(start, stop),
                    'capture_call': hex(stop), 'node_size': NODE_SIZE,
                    'node_base_register': 'rsp' if name == 'look-parent' else 'rbp',
                    'node_offset': node_offset, 'masked_node_hex': clean_a.hex(),
                    'masked_node_sha256': hashlib.sha256(clean_a).hexdigest(),
                    'masked_intervals': intervals(ignored),
                    'poison_sensitive_intervals': intervals(changed),
                    'written_node_intervals': intervals(a['written']),
                    'xmm_seeds': a['seeds'], 'memcpy': a['memcpy'], 'fields': a['fields']})

parent, row, body = (record['fields'] for record in records)
assert parent['min_height'] == [1, 0.] and parent['flex_direction'] == ENUMS['FlexDirection']['Column']
assert parent['row_gap'] == [1, 6.] and parent['margin'][2] == [0, None]
assert parent['flex_grow'] == 0. and parent['overflow'] == [0, 0]
assert row['min_height'] == [1, 0.] and row['column_gap'] == [1, 4.]
assert row['flex_grow'] == 0. and row['flex_direction'] == ENUMS['FlexDirection']['Row']
assert body['flex_grow'] == 1. and body['min_height'] == [1, 0.]
assert body['flex_wrap'] == ENUMS['FlexWrap']['Wrap']
assert body['row_gap'] == body['column_gap'] == [1, 6.]
assert body['overflow'] == [ENUMS['OverflowAxis']['Visible'], ENUMS['OverflowAxis']['Scroll']]
assert body['align_content'] == ENUMS['AlignContent']['FlexStart']
assert records[2]['key'] == 'armory-looks'

# Narrow source connectivity checks: no full-file hash, compiled code or layout
# model. Both live callers must use this shared constructor and its actual
# retained target must reach the existing scrollbar input implementation.
source_path = 'crates/azeroth-survivors-re/src/armory.rs'
source = (ROOT / source_path).read_text()
compact = lambda value: re.sub(r'\s+', '', value)
look = source.split('fn look(', 1)[1].split('\nfn time(', 1)[0]
look_compact = compact(look)
character = source.split('fn character(', 1)[1].split('\nfn collection(', 1)[0]
details = source.split('fn details(', 1)[1].split('\nfn look(', 1)[0]
assert 'look(ui,art,menu_catalog,state,catalog,view,gear,None);' in compact(character)
assert 'look(ui,art,menu_catalog,state,catalog,view,gear,selected);' in compact(details)
for expected in ['margin:UiRect::top(Val::Auto)', 'min_height:Val::Px(0.)',
                 'row_gap:Val::Px(6.)', 'column_gap:Val::Px(4.)',
                 'flex_grow:1.', 'flex_wrap:FlexWrap::Wrap',
                 'align_content:AlignContent::FlexStart', 'overflow:Overflow::scroll_y()',
                 'ScrollPosition::default()',
                 'crate::scrollbar::Kept::new("armory-looks",crate::scrollbar::InputScope::Armory)',
                 'crate::scrollbar::spawn(row,target,1.,crate::scrollbar::InputScope::Armory)']:
    assert expected in look_compact, expected
assert 'lettarget=row.spawn((' in look_compact and '.id();crate::scrollbar::spawn(' in look_compact

result = {'target_sha256': TARGET, 'application_executed': False,
          'rebuilt_code_executed': False, 'native_instructions_executed': True,
          'owners': [bound(PARENT_OWNER, PARENT_END), bound(LOOK_OWNER, LOOK_END)],
          'node_size': NODE_SIZE, 'enum_interpretation': ENUMS, 'records': records,
          'source_connection': {'path': source_path, 'shared_constructor': 'look',
                                'callers': ['character', 'details'], 'kept_key': 'armory-looks',
                                'scrollbar_target_connected': True},
          'limits': ['Three bounded Node initializers run before UI/ECS publication; layout, wheel/drag, persistence, rendering and platform behavior do not run.',
                     'Current RIP-relative constants and traced nonvolatile XMM values seed the two late initializers; preceding dynamic UI work does not run.',
                     'The current memcpy call is a byte-copy fixture seam; its library instructions do not run.',
                     'Field labels and enum interpretation are bounded to these observed current stores and Bevy 0.18.1 definitions; complete target compiler/type layout is not certified.',
                     'Two poison trials must agree after masking Node padding and inactive Auto payloads; masked bytes carry no semantic assertion.',
                     'Source checks establish the named target, scrollbar connection and both callers; source execution, compilation and original/rebuilt parity remain unverified.']}
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--stage', action='store_true')
parser.add_argument('--prepare-queries', action='store_true',
                    help='Extract current function slices and journaled REA plans under runtime/')
args = parser.parse_args()
if args.stage:
    output = ROOT / 'runtime/0.117.0/armory-looks/nodes-staged.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + '\n')
else:
    output = ROOT / 'docs/analysis/evidence/0.117.0/armory-looks/nodes.json'
    assert json.loads(output.read_text()) == result, 'Retained Armory Look node evidence differs'
    manifest = json.loads(output.with_name('manifest.json').read_text())
    assert manifest['target']['sha256'] == TARGET
    ends = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    for query in manifest['queries']:
        start, end = int(query['va'], 16), int(query['end_exclusive'], 16)
        assert ends[start] == end
        assert bound(start, end)['sha256'] == query['sha256']
        receipt = query['decompiler']
        assert hashlib.sha256((ROOT / receipt['path']).read_bytes()).hexdigest() == receipt['sha256']
        saved = query['retained_query_result']
        if (ROOT / saved['path']).exists():
            assert hashlib.sha256((ROOT / saved['path']).read_bytes()).hexdigest() == saved['sha256']
    literal = manifest['literal']
    literal_bytes = raw(int(literal['va'], 16), literal['byte_count'])
    assert literal_bytes == literal['value'].encode()
    assert hashlib.sha256(literal_bytes).hexdigest() == literal['sha256']
    reference = manifest['encoded_reference']
    encoded = bytes.fromhex(reference['bytes'])
    site = int(reference['site'], 16)
    assert raw(site, len(encoded)) == encoded
    assert site + len(encoded) + struct.unpack_from('<i', encoded, 3)[0] == int(literal['va'], 16)
    assert hashlib.sha256(output.read_bytes()).hexdigest() == manifest['nodes']['sha256']
    assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == manifest['checker']['sha256']
if args.prepare_queries:
    directory = ROOT / 'runtime/0.117.0/armory-looks'
    directory.mkdir(parents=True, exist_ok=True)
    ends = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    for name, start, end in [('look', LOOK_OWNER, LOOK_END),
                             ('look-parent', PARENT_OWNER, PARENT_END),
                             ('scrollbar', 0x140272ef0, 0x14027350a),
                             ('kept-publish', 0x1402cee60, 0x1402cf037)]:
        assert ends[start] == end
        (directory / (name + '.bin')).write_bytes(raw(start, end - start))
        plan = {'target': f'runtime/0.117.0/armory-looks/{name}.bin',
                'output': f'runtime/0.117.0/armory-looks/{name}-query',
                'init_timeout': 90,
                'open_options': {'format': 'raw-binary', 'architecture': 'x86_64',
                                 'entry_point': hex(start)},
                'timeout': 240,
                'operations': [{'name': 'procedure_pseudo_code',
                                'arguments': {'procedure': hex(start)},
                                'label': 'armory-look' if name == 'look' else name}]}
        (directory / (name + '-plan.json')).write_text(json.dumps(plan, indent=2) + '\n')
print('Passed 6 poison-seeded native captures for 3 Armory Look Nodes, exact retained key and both source callers')
