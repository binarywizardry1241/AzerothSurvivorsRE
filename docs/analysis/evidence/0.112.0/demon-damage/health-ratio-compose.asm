1458f3234 f3440f10bda8000000 movss xmm15, dword ptr [rbp + 0xa8]
1458f323d f3440f58ff addss xmm15, xmm7
1458f3242 f3440f597dd0 mulss xmm15, dword ptr [rbp - 0x30]
1458f3248 f3440f100d0fa04b00 movss xmm9, dword ptr [rip + 0x4ba00f]
1458f3251 f3410f5ff9 maxss xmm7, xmm9
1458f3256 440f297540 movaps xmmword ptr [rbp + 0x40], xmm14
1458f325b 0f28f1 movaps xmm6, xmm1
1458f325e 0f299d90000000 movaps xmmword ptr [rbp + 0x90], xmm3
1458f3265 450f28f7 movaps xmm14, xmm15
1458f3269 f3440f5ef7 divss xmm14, xmm7
