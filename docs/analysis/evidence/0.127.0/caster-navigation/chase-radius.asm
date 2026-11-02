145c3d9df: f3450f10b6e0010000 movss xmm14, dword ptr [r14 + 0x1e0]
145c3d9e8: f3440f5835b3ec6000 addss xmm14, dword ptr [rip + 0x60ecb3]
145c3d9f1: f3450f11b6e0010000 movss dword ptr [r14 + 0x1e0], xmm14
145c3d9fa: f30f100506f06000 movss xmm0, dword ptr [rip + 0x60f006]
145c3da02: f3440f5fc0 maxss xmm8, xmm0
145c3da07: 84c0 test al, al
145c3da09: 7512 jne 0x145c3da1d
145c3da0b: f3450fc2ef01 cmpltss xmm13, xmm15
145c3da11: 450f54c5 andps xmm8, xmm13
145c3da15: 440f55e8 andnps xmm13, xmm0
145c3da19: 450f56c5 orps xmm8, xmm13
