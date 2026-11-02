"""Bounded 0.115.0 raid-target instruction replay, without an OS or game.

The original board transitions, wire serializers and selected local request
branch execute in Unicorn. Allocation, vector growth, free and packet delivery
are explicit Python seams; an unreviewed call fails. No cooperative path runs.
"""
import struct

from equipment_native import EquipmentProbe


TARGET_SHA256 = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
RANGES = {
    'board': (0x145824040, 0x1458241a7),
    'delta': (0x1459ab120, 0x1459ab203),
    'list': (0x1459ac910, 0x1459acab9),
    'request': (0x145873b00, 0x145876652),
}
EXCERPTS = {
    'replacement-reset': (0x14588cff7, 0x14588d03b),
    'login-list': (0x1458865fd, 0x145886617),
}


class RaidTargetProbe(EquipmentProbe):
    def __init__(self, data, pe):
        super().__init__(data, pe, list(RANGES.values()) + list(EXCERPTS.values()))
        self.packets = []
        self.prefix_only = False
        self.decoded = None
        self.trace = set()

    def returned(self):
        sp = self.reg('RSP')
        self.reg('RIP', self.q(sp))
        self.reg('RSP', sp + 8)

    def grow(self, vector, additional):
        capacity, old, count = (self.q(vector + i * 8) for i in range(3))
        capacity = max(32, capacity * 2, count + additional)
        pointer = self.alloc(capacity)
        if count:
            self.native.mem_write(pointer, bytes(self.native.mem_read(old, count)))
        self.put(vector, capacity, pointer)

    def packet(self, pointer):
        count = self.q(pointer + 16)
        assert 0 <= count <= 73
        return {
            'opcode': self.q(pointer + 24) & 0xffff,
            'body': bytes(self.native.mem_read(self.q(pointer + 8), count)).hex(),
        }

    def hook(self, uc, pc, size, unused):
        if pc == RANGES['board'][0]:
            self.decoded = [self.reg('R8') & 255, self.reg('R9')]
            if self.prefix_only:
                uc.emu_stop()
                return
        if any(start <= pc and pc + size <= end for start, end in self.ranges):
            self.trace.add(pc)
            return
        if pc == 0x145eb6ec0:
            self.grow(self.reg('RCX'), 1)
            self.returned()
        elif pc == 0x145d14a10:
            assert self.reg('R9') == 1
            self.grow(self.reg('RCX'), self.reg('R8'))
            self.returned()
        elif pc in (0x145894fe0, 0x145894b80):
            pointer = self.reg('R8' if pc == 0x145894fe0 else 'R9')
            self.packets.append(self.packet(pointer))
            self.returned()
        else:
            super().hook(uc, pc, size, unused)

    def reset(self):
        self.cursor = self.HEAP + 0x1000
        self.packets, self.decoded = [], None
        self.prefix_only = False
        self.stop = self.DONE

    def board(self, values, icon, guid):
        self.reset()
        board, out = self.alloc(64), self.alloc(24)
        self.put(board, *values)
        sp = self.STACK + 0x1f0008
        self.put(sp, self.DONE)
        for name, value in [('RSP', sp), ('RCX', out), ('RDX', board),
                            ('R8', icon), ('R9', guid), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        self.native.emu_start(RANGES['board'][0], self.DONE, count=10000)
        assert self.reg('RIP') == self.DONE
        count = self.q(out + 16)
        assert count <= 8
        return {'board': [self.q(board + i * 8) for i in range(8)],
                'changed': list(self.native.mem_read(self.q(out + 8), count)) if count else []}

    def serialize(self, values=None, icon=0, guid=0):
        self.reset()
        out = self.alloc(32)
        if values is None:
            self.invoke(RANGES['delta'][0], rcx=out, rdx=icon, r8=guid)
        else:
            board = self.alloc(64)
            self.put(board, *values)
            self.invoke(RANGES['list'][0], rcx=out, rdx=board)
        return self.packet(out)

    def request(self, values, payload, prefix_only=False):
        self.reset()
        self.prefix_only = prefix_only
        host = self.alloc(0x2000)
        self.native.mem_write(host + 0x10, struct.pack('<I', 2))
        self.put(host + 0x1750, *values)
        data = self.alloc(max(1, len(payload)))
        if payload:
            self.native.mem_write(data, payload)
        sp = self.STACK + 0x1f0008
        self.put(sp, self.DONE)
        self.put(sp + 40, data, len(payload))
        for name, value in [('RSP', sp), ('RCX', host), ('RDX', 0),
                            ('R8', 0), ('R9', 0x321), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        self.native.emu_start(RANGES['request'][0], self.DONE, count=100000)
        assert self.reg('RIP') == (RANGES['board'][0] if prefix_only else self.DONE)
        return {'decoded': self.decoded,
                'board': [self.q(host + 0x1750 + i * 8) for i in range(8)],
                'packets': self.packets}

    def lifecycle(self, role, values):
        """Execute just the native reset/list slice; upstream admission is not emulated."""
        self.reset()
        start, stop = EXCERPTS[role]
        host, frame = self.alloc(0x2000), self.alloc(0x4000)
        self.put(host + 0x1750, *values)
        for name, value in [('RSI', host), ('RBP', frame),
                            ('RSP', self.STACK + 0x1f0008), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        self.stop = stop
        self.native.emu_start(start, stop, count=10000)
        assert self.reg('RIP') == stop
        offset = 0xc00 if role == 'replacement-reset' else 0x1c50
        return {'board': [self.q(host + 0x1750 + i * 8) for i in range(8)],
                'packet': self.packet(frame + offset)}
