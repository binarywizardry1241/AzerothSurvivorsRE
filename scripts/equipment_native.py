"""Bounded current equipment-text instruction harness; no OS or game calls.

Allocation, Rust formatting, Unicode strings and locale-map services are explicit
Python seams. Callers supply exact admitted instruction intervals and endpoints.
"""
from decimal import Decimal
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r


class EquipmentProbe:
    HEAP, STACK, DONE = 0x200000000, 0x300000000, 0x400000000

    def __init__(self, data, pe, ranges):
        self.native = Uc(UC_ARCH_X86, UC_MODE_64)
        size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
        self.native.mem_map(pe.image_base, (size + 4095) & ~4095)
        for section in pe.sections:
            at, count = section['raw_offset'], section['raw_size']
            self.native.mem_write(pe.image_base + section['rva'], data[at:at + count])
        self.native.mem_map(self.HEAP, 0x2000000)
        self.native.mem_map(self.STACK, 0x200000)
        self.native.mem_map(self.DONE, 4096)
        self.ranges, self.locale, self.calls, self.keys = ranges, {}, {}, set()
        self.cursor, self.stop = self.HEAP + 0x1000, self.DONE
        self.native.hook_add(UC_HOOK_CODE, self.hook)

    def reg(self, name, value=None):
        register = getattr(r, 'UC_X86_REG_' + name)
        if value is not None:
            self.native.reg_write(register, value)
        return self.native.reg_read(register)

    def q(self, at):
        return struct.unpack('<Q', self.native.mem_read(at, 8))[0]

    def put(self, at, *values):
        self.native.mem_write(at, struct.pack('<' + 'Q' * len(values), *values))

    def text(self, at, count):
        assert 0 <= count < 65536
        return bytes(self.native.mem_read(at, count)).decode()

    def pair(self, at):
        return self.text(self.q(at), self.q(at + 8))

    def alloc(self, count):
        assert 0 <= count < 0x100000
        at = self.cursor
        self.cursor += (max(count, 1) + 15) & ~15
        assert self.cursor < self.HEAP + 0x2000000
        self.native.mem_write(at, bytes(count))
        return at

    def output(self, at, text):
        raw = text.encode()
        pointer = self.alloc(len(raw) + 1)
        self.native.mem_write(pointer, raw)
        self.put(at, len(raw), pointer, len(raw))

    def number(self, at, formatter, precision=None):
        if formatter == 0x1400020c0:
            return self.pair(at)
        if formatter == 0x1400020e0:
            return self.pair(at + 8)
        if formatter == 0x145beebe0:
            return str(struct.unpack('<I', self.native.mem_read(at, 4))[0])
        assert formatter == 0x145bedee0, hex(formatter)
        value = struct.unpack('<f', self.native.mem_read(at, 4))[0]
        if precision is not None:
            return format(value, f'.{precision}f')
        short = next(format(value, f'.{n}g') for n in range(1, 10)
                     if struct.pack('<f', float(format(value, f'.{n}g'))) == struct.pack('<f', value))
        return format(Decimal(short), 'f') if 'e' in short.lower() else short

    def hook(self, _, pc, size, unused):
        if pc == self.stop:
            self.native.emu_stop()
            return
        if any(start <= pc and pc + size <= end for start, end in self.ranges):
            return
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        rcx, rdx, r8, r9 = (self.reg(x) for x in ('RCX', 'RDX', 'R8', 'R9'))
        if pc in (0x140002200, 0x1400021d0):
            pass
        elif pc == 0x1400021c0:
            self.reg('RAX', self.alloc(rcx))
        elif pc == 0x145c0a3db:
            self.native.mem_write(rcx, bytes(self.native.mem_read(rdx, r8)))
            self.reg('RAX', rcx)
        elif pc == 0x145bdd5f0:
            self.output(rcx, self.pair(rdx + 8))
        elif pc in (0x14598ddd0, 0x14598dd20):
            key = self.text(rcx, rdx)
            self.keys.add(key)
            value = self.locale.get(key, key if pc == 0x14598dd20 else None)
            if value is None:
                self.reg('RAX', 0)
                self.reg('RDX', 0)
            else:
                raw = value.encode()
                pointer = self.alloc(len(raw) + 1)
                self.native.mem_write(pointer, raw)
                self.reg('RAX', pointer)
                self.reg('RDX', len(raw))
        elif pc == 0x14589a5f0:
            value = self.text(rdx, r8)
            sp = self.reg('RSP')
            needle = self.text(r9, self.q(sp + 40))
            replacement = self.text(self.q(sp + 48), self.q(sp + 56))
            self.output(rcx, value.replace(needle, replacement))
        elif pc == 0x14598e180:
            value = self.text(rdx, r8)
            count = self.q(self.reg('RSP') + 40)
            assert count <= 16
            for index in range(count):
                at = r9 + index * 32
                value = value.replace('{' + self.pair(at) + '}',
                                      self.number(self.q(at + 16), self.q(self.q(at + 24) + 24)))
            self.output(rcx, value)
        elif pc == 0x145bdd130:
            at, arg, value = rdx, 0, ''
            while True:
                op = self.native.mem_read(at, 1)[0]
                at += 1
                if op == 0:
                    break
                if op < 0x80:
                    value += self.text(at, op)
                    at += op
                    continue
                precision = None
                if op in (0xc1, 0xc5):
                    at += 4
                    precision = 0
                    if op == 0xc5:
                        precision = struct.unpack('<H', self.native.mem_read(at, 2))[0]
                        at += 2
                else:
                    assert op == 0xc0, hex(op)
                value += self.number(self.q(r8 + arg * 16), self.q(r8 + arg * 16 + 8), precision)
                arg += 1
            self.output(rcx, value)
        else:
            raise RuntimeError(f'Unreviewed call {pc:#x} from {self.q(self.reg("RSP")):#x}')
        sp = self.reg('RSP')
        self.reg('RSP', sp + 8)
        self.reg('RIP', self.q(sp))

    def invoke(self, at, rcx=0, rdx=0, r8=0, xmm2=None):
        self.stop = self.DONE
        sp = self.STACK + 0x1f0008
        self.put(sp, self.DONE)
        for name, value in [('RSP', sp), ('RCX', rcx), ('RDX', rdx), ('R8', r8), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        if xmm2 is not None:
            self.reg('XMM2', xmm2)
        self.native.emu_start(at, self.DONE, count=1000000)
        assert self.reg('RIP') == self.DONE
