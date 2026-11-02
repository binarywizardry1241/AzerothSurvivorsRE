#!/usr/bin/env python3
"""Check reviewed 0.109.0 native UI initializer spans without launching the game.

Use --python-libs for an existing checkout-local Unicorn installation and
--output for generated JSON beneath runtime/. No native callees are executed.
Only four exact current memcpy call sites are replaced with bounded copies.
Current owners are independently identified by callers, literals and Ghidra;
matching historical initializer offsets are replayed from current bytes.
"""
from script_sources import load_script
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def find_root():
    for candidate in Path(__file__).resolve().parents:
        if (candidate / 'scripts/inventory-executable.py').is_file() and (candidate / 'Cargo.toml').is_file():
            return candidate
    raise RuntimeError('Script must be kept inside the project checkout')


ROOT = find_root()
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--python-libs', type=Path, help='Existing checkout-local directory containing Unicorn')
parser.add_argument('--output', type=Path, default=Path('runtime/terminal-flow-0.109.0/layout-vectors.json'))
args = parser.parse_args()


def local_path(value):
    resolved = (ROOT / value).resolve() if not value.is_absolute() else value.resolve()
    require(resolved.is_relative_to(ROOT), f'Path escapes checkout: {value}')
    return resolved


output = local_path(args.output)
require(output.is_relative_to(ROOT / 'runtime'), 'Generated output must stay beneath checkout runtime/')
if args.python_libs is not None:
    libraries = local_path(args.python_libs)
    require(libraries.is_dir(), f'Unicorn library directory missing: {libraries}')
    sys.path.insert(0, str(libraries))
try:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    from unicorn.x86_const import *
except ImportError as error:
    raise RuntimeError('Unicorn is unavailable; supply --python-libs with an existing checkout-local installation') from error

module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
from native_terminal import verified_input
manifest, target, data, pe = verified_input(ROOT / 'docs/analysis/evidence/0.109.0/terminal-presentation')
u = Uc(UC_ARCH_X86, UC_MODE_64)
size = max(section['rva'] + section['raw_size'] for section in pe.sections)
u.mem_map(pe.image_base, (size + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
STACK, STACK_SIZE = 0x20000000, 0x10000
BP, SP = STACK + 0x1000, STACK + 0xf000
u.mem_map(STACK, STACK_SIZE)


def raw(address, length):
    at = pe.rva_offset(address - pe.image_base)
    require(at is not None, f'Address lacks PE source mapping: {address:#x}')
    result = data[at:at + length]
    require(len(result) == length, 'Truncated PE source range')
    return result


# Exact reviewed call sites and fixed synthetic-stack arguments, not arbitrary
# callee stubs. The native memcpy function itself is never entered.
MEMCPY = {
    0x140203c13: (BP + 0x508, BP + 0x1a0, 0x88),
    0x140205486: (BP + 0x508, BP + 0x1a0, 0x138),
    0x1402540e3: (BP + 0x3b8, BP + 0x1c0, 0x138),
    0x14020c3f5: (BP + 0x1e8, BP + 0x30, 0x138),
}
SPANS = {
    'canvas': (0x140203aeb, 0x140203d6d),
    'panel-before-common-style': (0x140203e2a, 0x140203f81),
    'stat-grid': (0x140204bec, 0x140204d7c),
    'buttons-row': (0x140205385, 0x140205517),
    'button': (0x140205744, 0x14020587d),
    'outer': (0x140288b8e, 0x140288dd3),
    'xp-panel': (0x1400c43ed, 0x1400c4667),
    'loot-wrap': (0x1402859a2, 0x140285bda),
    'xp-header': (0x140253fbc, 0x14025416b),
    'xp-parts-grid': (0x14025457a, 0x1402546ef),
    'xp-bar': (0x140254c45, 0x140254eae),
    'loot-constant-seed': (0x14020c287, 0x14020c2c9),
    'loot-item-row': (0x14020c33d, 0x14020c487),
    'loot-icon': (0x14020c4e3, 0x14020c611),
}
active = None
next_instruction = None


def code_hook(machine, address, length, _):
    global next_instruction
    require(active is not None, 'Native instruction requested without an active reviewed span')
    start, end = active
    require(start <= address and address + length <= end, f'Instruction escapes reviewed span: {address:#x}')
    require(address == next_instruction, f'Nonlinear control flow rejected: {address:#x}')
    next_instruction = address + length
    instruction = bytes(machine.mem_read(address, length))
    require(instruction == raw(address, length), f'Native code was modified at {address:#x}')
    if address in MEMCPY:
        require(length == 5 and instruction[0] == 0xe8, 'Reviewed memcpy call encoding changed')
        target = address + 5 + struct.unpack_from('<i', instruction, 1)[0]
        require(target == 0x145bfa0e7, 'Reviewed memcpy target changed')
        actual = tuple(machine.reg_read(register) for register in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
        require(actual == MEMCPY[address], f'Unexpected memcpy arguments at {address:#x}: {actual}')
        destination, source, count = actual
        require(STACK <= source <= source + count <= STACK + STACK_SIZE, 'memcpy source escapes scratch stack')
        require(STACK <= destination <= destination + count <= STACK + STACK_SIZE, 'memcpy destination escapes scratch stack')
        machine.mem_write(destination, bytes(machine.mem_read(source, count)))
        machine.reg_write(UC_X86_REG_RIP, address + length)
    else:
        # No other calls, branches, returns, interrupts or system transfers
        # belong to the reviewed linear spans. Reject before they execute.
        index = 0
        prefixes = {0xf0, 0xf2, 0xf3, 0x2e, 0x36, 0x3e, 0x26, 0x64, 0x65, 0x66, 0x67}
        while index < length and (instruction[index] in prefixes or 0x40 <= instruction[index] <= 0x4f):
            index += 1
        require(index < length, 'Invalid instruction encoding')
        opcode = instruction[index]
        control = opcode in {0xe8, 0xe9, 0xea, 0xeb, 0x9a, 0xc2, 0xc3, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xf1}
        control |= 0x70 <= opcode <= 0x7f or 0xe0 <= opcode <= 0xe3
        if opcode == 0xff:
            require(index + 1 < length, 'Invalid indirect instruction encoding')
            control |= ((instruction[index + 1] >> 3) & 7) in {2, 3, 4, 5}
        if opcode == 0x0f:
            require(index + 1 < length, 'Invalid extended instruction encoding')
            control |= instruction[index + 1] in {0x05, 0x07, 0x34, 0x35} or 0x80 <= instruction[index + 1] <= 0x8f
        require(not control, f'Unreviewed control transfer rejected at {address:#x}')


def write_hook(_, __, address, length, ___, ____):
    require(STACK <= address <= address + length <= STACK + STACK_SIZE, f'Native write escapes scratch stack: {address:#x}')


u.hook_add(UC_HOOK_CODE, code_hook)
u.hook_add(UC_HOOK_MEM_WRITE, write_hook)


def reset():
    u.mem_write(STACK, bytes(STACK_SIZE))
    for register in (UC_X86_REG_RAX, UC_X86_REG_RBX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSI,
                     UC_X86_REG_RDI, UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_R10, UC_X86_REG_R11,
                     UC_X86_REG_R12, UC_X86_REG_R13, UC_X86_REG_R14, UC_X86_REG_R15):
        u.reg_write(register, 0)
    for index in range(16):
        u.reg_write(globals()[f'UC_X86_REG_XMM{index}'], 0)
    u.reg_write(UC_X86_REG_RBP, BP)
    u.reg_write(UC_X86_REG_RSP, SP)
    for register, address in [(UC_X86_REG_XMM6, 0x145deb900), (UC_X86_REG_XMM7, 0x145deb918),
                              (UC_X86_REG_XMM8, 0x145deb930), (UC_X86_REG_XMM9, 0x145deb948),
                              (UC_X86_REG_XMM10, 0x145deb9b8), (UC_X86_REG_XMM11, 0x145deb9c8),
                              (UC_X86_REG_XMM12, 0x145deba18), (UC_X86_REG_XMM14, 0x145deba28)]:
        u.reg_write(register, int.from_bytes(raw(address, 16), 'little'))
    u.reg_write(UC_X86_REG_RCX, BP + 0x508)
    u.reg_write(UC_X86_REG_XMM15, int.from_bytes(struct.pack('<4f', 560, 700, 0, 0), 'little'))


FIELDS = {'width': 136, 'height': 144, 'min_width': 152, 'min_height': 160, 'max_width': 168,
          'max_height': 176, 'margin_left': 184, 'margin_right': 192, 'margin_top': 200,
          'margin_bottom': 208, 'padding_left': 216, 'padding_right': 224, 'padding_top': 232,
          'padding_bottom': 240, 'border_left': 248, 'border_right': 256, 'border_top': 264,
          'border_bottom': 272, 'radius_tl': 280, 'radius_tr': 288, 'radius_br': 296,
          'radius_bl': 304, 'row_gap': 320, 'column_gap': 328}
ENUMS = {'display': 373, 'position': 371, 'flex_direction': 374, 'flex_wrap': 372,
         'align_items': 378, 'justify_content': 381}


def node(base):
    result = {key: dict(zip(('tag', 'value'), struct.unpack('<If', u.mem_read(base + offset, 8))))
              for key, offset in FIELDS.items()}
    result['enums'] = {key: u.mem_read(base + offset, 1)[0] for key, offset in ENUMS.items()}
    return result


out = {}


def execute(name, base=None):
    global active, next_instruction
    require(name in SPANS, f'Unreviewed span rejected: {name}')
    active = SPANS[name]
    start, end = active
    next_instruction = start
    try:
        u.emu_start(start, end, count=2000)
        require(u.reg_read(UC_X86_REG_RIP) == end and next_instruction == end, f'Incomplete reviewed span: {name}')
    finally:
        active = None
        next_instruction = None
    if base is not None:
        out[name] = dict(start=hex(start), end=hex(end), node=node(base))


for name, offset in [('canvas', 0x508), ('panel-before-common-style', 0x500), ('stat-grid', 0x508),
                     ('buttons-row', 0x508), ('button', 0x500), ('outer', 0x140)]:
    reset()
    if name == 'button':
        u.reg_write(UC_X86_REG_R14, BP + 0x560)
        u.reg_write(UC_X86_REG_XMM12, 0)
        u.reg_write(UC_X86_REG_XMM13, int.from_bytes(raw(0x145d9d2b0, 16), 'little'))
        u.reg_write(UC_X86_REG_XMM14, int.from_bytes(raw(0x145d9d5d0, 16), 'little'))
    execute(name, BP + offset)
for name, base in [('xp-panel', BP + 0x18), ('loot-wrap', SP + 0xd8)]:
    reset()
    u.reg_write(UC_X86_REG_RDI, BP + 0x3000)
    u.reg_write(UC_X86_REG_RBX, BP + 0x3000)
    execute(name, base)
reset()
for name in ('xp-header', 'xp-parts-grid', 'xp-bar'):
    execute(name, BP + 0x3b8)
reset()
u.reg_write(UC_X86_REG_RSI, BP + 0x98)
execute('loot-constant-seed')
for name, base in [('loot-item-row', BP + 0x1e8), ('loot-icon', BP + 0x30)]:
    execute(name, base)
EXPECTED = {
    'canvas': {'width': 560, 'height': 700},
    'panel-before-common-style': {'padding_left': 30, 'padding_right': 30, 'padding_top': 22,
                                  'padding_bottom': 22, 'row_gap': 10},
    'stat-grid': {'margin_top': 10, 'margin_bottom': 10, 'row_gap': 4, 'column_gap': 24},
    'buttons-row': {'column_gap': 12},
    'button': {'padding_left': 22, 'padding_right': 22, 'padding_top': 10, 'padding_bottom': 10,
               'border_left': 1, 'radius_tl': 4},
    'outer': {'width': 100, 'height': 100},
    'xp-panel': {'width': 420, 'margin_top': 0, 'margin_bottom': 0, 'padding_left': 14,
                 'padding_right': 14, 'padding_top': 10, 'padding_bottom': 10, 'border_left': 1,
                 'radius_tl': 6, 'row_gap': 5},
    'loot-wrap': {'max_width': 500, 'row_gap': 6, 'column_gap': 10},
    'xp-bar': {'height': 14, 'margin_top': 4, 'border_left': 1, 'radius_tl': 3},
    'xp-parts-grid': {'row_gap': 2},
    'loot-item-row': {'column_gap': 6},
    'loot-icon': {'width': 26, 'height': 26, 'border_left': 1, 'radius_tl': 4},
}
for name, fields in EXPECTED.items():
    for field, value in fields.items():
        require(out[name]['node'][field]['value'] == value, f'Layout mismatch: {name} {field}')
for name, field, value in [('buttons-row', 'flex_direction', 0), ('stat-grid', 'display', 1),
                           ('loot-wrap', 'flex_wrap', 1)]:
    require(out[name]['node']['enums'][field] == value, f'Layout enum mismatch: {name} {field}')
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(json.dumps(out, indent=2) + '\n')
print(f'PASS: {len(out)} unchanged native initializer vectors; reviewed linear spans and exact memcpy seams only.')
print(f'Output: {output.relative_to(ROOT)}')
