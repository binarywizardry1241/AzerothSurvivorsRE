"""Current AS query instructions with intercepted packet delivery; no game/network.

Extends the bounded Creature probe's explicit allocator/string/memory seams.
Only the current AS GameObject name getter and serializer are additionally
admitted. Raw wire bytes are returned before any synthetic client decoding.
"""
import struct
from creature_query_native import Probe, ENDS


class TemplateQueryProbe(Probe):
    def __init__(self):
        super().__init__()
        self.ranges += [(address, ENDS[address]) for address in [0x145809000, 0x1458d58f0]]

    def response(self, opcode, entry, payload=None):
        self.cursor = self.HEAP + 0x1000
        self.packet, self.keys = None, set()
        payload = struct.pack('<IQ', entry, 0) if payload is None else payload
        inp = self.alloc(len(payload))
        self.native.mem_write(inp, payload)
        host = self.alloc(0x1000)
        sp = self.STACK + 0x1f0008
        self.put(sp, self.DONE)
        self.put(sp + 40, inp, len(payload))
        for name, value in [('RSP', sp), ('RCX', host), ('RDX', 0), ('R8', 0),
                            ('R9', opcode), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        self.native.emu_start(0x1458646d0, self.DONE, count=100000)
        assert self.reg('RIP') == self.DONE and self.packet is not None
        return self.packet
