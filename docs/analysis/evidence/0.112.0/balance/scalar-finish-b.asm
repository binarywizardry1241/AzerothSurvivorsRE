1458f33f6: 898ec4040000 mov dword ptr [rsi + 0x4c4], ecx
1458f33fc: 0f2845e0 movaps xmm0, xmmword ptr [rbp - 0x20]
1458f3400: f30f1186c8040000 movss dword ptr [rsi + 0x4c8], xmm0
1458f3408: f3440f11b6cc040000 movss dword ptr [rsi + 0x4cc], xmm14
1458f3411: 0f2ee2 ucomiss xmm4, xmm2
1458f3414: f30f108ee8040000 movss xmm1, dword ptr [rsi + 0x4e8]
1458f341c: 760c jbe 0x1458f342a
1458f341e: f30f58cc addss xmm1, xmm4
1458f3422: f30f118ee8040000 movss dword ptr [rsi + 0x4e8], xmm1
1458f342a: 4c89b590000000 mov qword ptr [rbp + 0x90], r14
1458f3431: 0f28d1 movaps xmm2, xmm1
1458f3434: f3410f5dd7 minss xmm2, xmm15
1458f3439: 0f28c2 movaps xmm0, xmm2
1458f343c: f30fc2c203 cmpunordss xmm0, xmm2
1458f3441: 0f28e0 movaps xmm4, xmm0
1458f3444: 0f55e2 andnps xmm4, xmm2
1458f3447: 0f54c1 andps xmm0, xmm1
1458f344a: 0f56c4 orps xmm0, xmm4
1458f344d: f30f1186e8040000 movss dword ptr [rsi + 0x4e8], xmm0
