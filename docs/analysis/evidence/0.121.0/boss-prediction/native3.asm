0000000145bf2c9a 8b7904                         mov edi, dword ptr [rcx + 4]
0000000145bf2c9d f30f107908                     movss xmm7, dword ptr [rcx + 8]
0000000145bf2ca2 f30f10710c                     movss xmm6, dword ptr [rcx + 0xc]
0000000145bf2ca7 f3440f597110                   mulss xmm14, dword ptr [rcx + 0x10]
0000000145bf2cad 488d8dc0000000                 lea rcx, [rbp + 0xc0]
0000000145bf2cb4 4889f2                         mov rdx, rsi
0000000145bf2cb7 4c8b8530010000                 mov r8, qword ptr [rbp + 0x130]
0000000145bf2cbe 0f28de                         movaps xmm3, xmm6
0000000145bf2cc1 e8daf5ffff                     call 0x145bf22a0
0000000145bf2cc6 f30f11bd6c010000               movss dword ptr [rbp + 0x16c], xmm7
0000000145bf2cce c7856801000000000000           mov dword ptr [rbp + 0x168], 0
0000000145bf2cd8 c785f000000000000000           mov dword ptr [rbp + 0xf0], 0
0000000145bf2ce2 f30f109dc0000000               movss xmm3, dword ptr [rbp + 0xc0]
0000000145bf2cea f30f1085c4000000               movss xmm0, dword ptr [rbp + 0xc4]
