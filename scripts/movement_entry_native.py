"""Current AS movement admission; original instructions with explicit services.

Only Elwynn's ordinary local report path is replayed. Primary-height answers,
hypotf, packet construction and Begin are declared seams. No world or game runs.
"""
import math
import struct

from creature_query_native import D, PE, EquipmentProbe

FIRST, LAST = 0x1458fd2b0, 0x1458fdee1
BEGIN, PHASE_STOP = 0x14590b550, 0x14590b5ce


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def scalar(value):
    return struct.unpack('<f', struct.pack('<I', value & 0xffffffff))[0]


def f32(value):
    return scalar(bits(value))


class MovementEntry(EquipmentProbe):
    def __init__(self):
        super().__init__(D, PE, [(FIRST, LAST)])
        self.phase_probe = False

    def hook(self, uc, pc, size, unused):
        if self.phase_probe:
            if pc == PHASE_STOP:
                self.native.emu_stop()
                return
            if BEGIN <= pc and pc + size <= PHASE_STOP:
                return
            raise RuntimeError(f'Unexpected Begin-prefix instruction {pc:#x}')
        if any(a <= pc and pc + size <= b for a, b in self.ranges):
            return
        rcx, rdx, r8, r9 = (self.reg(r) for r in ['RCX', 'RDX', 'R8', 'R9'])
        if pc == 0x145808880:
            self.reg('RAX', 0)  # exact current Elwynn definition index
        elif pc == 0x1458a67e0:
            self.reg('RAX', 1)
            self.reg('XMM0', bits(0.0))  # supplied successful primary height
        elif pc == 0x145cf99eb:
            self.reg('XMM0', bits(math.hypot(scalar(self.reg('XMM0')), scalar(self.reg('XMM1')))))
        elif pc == 0x1458d7a40:
            self.corrected = struct.unpack('<3f', self.native.mem_read(r9, 12))
            self.native.mem_write(rcx, bytes(range(32)))  # opaque packet value
        elif pc == 0x1458cdb20:
            self.notice = True
            self.native.mem_write(rcx, bytes(range(32)))
        elif pc == BEGIN:
            self.begins += 1
            # Only the separately replayed first phase store is supplied. Begin's
            # actors, RNG, stats and further publication do not execute here.
            self.native.mem_write(rcx + 0xc12, b'\x01')
        else:
            return super().hook(uc, pc, size, unused)
        sp = self.reg('RSP')
        self.reg('RSP', sp + 8)
        self.reg('RIP', self.q(sp))

    def run(self, old, reported, phase=0, pending=0, local_index=0, expected=None, reports_left=0):
        self.cursor = self.HEAP + 0x1000
        self.corrected, self.notice, self.begins = None, False, 0
        game, floor, packet, pos = (self.alloc(n) for n in [0x2000, 0x1000, 1024, 16])
        self.native.mem_write(game + 0x4d0, struct.pack('<3f', *old))
        self.put(game + 0xab8, floor)
        self.put(floor + 0x40, 0xffffffffffffffff)
        self.put(floor + 0x68, 0xffffffffffffffff)
        self.put(game + 0x620, 32, packet, 0)
        self.put(game + 0xb18, local_index)
        self.native.mem_write(game + 0xc12, bytes([phase]))
        self.native.mem_write(game + 0xc0e, bytes([pending]))
        if expected is not None:
            self.native.mem_write(game + 0xb30, struct.pack('<I3fB', 1, *expected, reports_left))
        self.native.mem_write(pos, struct.pack('<3f', *reported))
        self.invoke(FIRST, game, pos, bits(1.25))
        return dict(old=old, reported=reported, phase=phase, pending=pending, local_index=local_index,
                    final=list(struct.unpack('<3f', self.native.mem_read(game + 0x4d0, 12))),
                    corrected=list(self.corrected) if self.corrected else None,
                    begins=self.begins, notice=self.notice,
                    final_phase=self.native.mem_read(game + 0xc12, 1)[0],
                    pending_reports=self.native.mem_read(game + 0xb40, 1)[0])

    def begin_phase(self, phase):
        self.phase_probe = True
        game = self.HEAP + 0x1000
        self.native.mem_write(game, bytes(0x2000))
        self.native.mem_write(game + 0xc12, bytes([phase]))
        before = bytes(self.native.mem_read(game, 0x2000))
        self.reg('RCX', game)
        self.reg('RSP', self.STACK + 0x1f0008)
        self.native.emu_start(BEGIN, PHASE_STOP, count=50)
        after = bytearray(before)
        after[0xc12] = 1
        assert bytes(self.native.mem_read(game, 0x2000)) == after
        self.phase_probe = False
