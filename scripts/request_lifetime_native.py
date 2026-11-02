"""Current local request lifetime probe: optional Game is a synthetic state.

Metadata/refusal serializers run unchanged. Cast construction/sender/postresponse
are observed service boundaries, not cast-wire or player-state execution.
"""
import struct
from template_query_native import TemplateQueryProbe
from creature_query_native import D, PE, ENDS

H, REFUSE, CAST, SEND, POST = 0x1458646d0,0x1458d5730,0x1458ca2f0,0x145885a50,0x1458ded90


class LifetimeProbe(TemplateQueryProbe):
    def __init__(self):
        super().__init__()
        self.ranges += [(REFUSE,ENDS[REFUSE])]

    def hook(self,uc,pc,size,unused):
        if self.opcode == 0x12e and pc in [CAST,SEND,POST]:
            if pc == CAST:
                self.cast = [self.reg('RDX') & 0xffffffff,self.reg('R8') & 255]
            elif pc == SEND:
                self.sent += 1
            else:
                self.post += 1
            sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
            return
        return super().hook(uc,pc,size,unused)

    def response(self,opcode,payload,game):
        self.opcode=opcode
        self.cursor=self.HEAP+0x1000
        self.packet,self.keys,self.cast,self.sent,self.post=None,set(),None,0,0
        host=self.alloc(0x2000)
        self.native.mem_write(host+0x10,struct.pack('<I',0 if game else 2))
        inp=self.alloc(len(payload));self.native.mem_write(inp,payload)
        sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,inp,len(payload))
        for name,value in [('RSP',sp),('RCX',host),('RDX',0),('R8',0),('R9',opcode),('MXCSR',0x1f80)]:
            self.reg(name,value)
        self.native.emu_start(H,self.DONE,count=100000)
        assert self.reg('RIP')==self.DONE
        if opcode == 0x12e:
            return dict(constructor=self.cast,sends=self.sent,post_response_calls=self.post)
        assert self.packet is not None
        return [self.packet[0],self.packet[1].hex()]
