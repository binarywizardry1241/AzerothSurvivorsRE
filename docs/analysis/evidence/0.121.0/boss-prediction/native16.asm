0000000145bf5376 448b31                         mov r14d, dword ptr [rcx]
0000000145bf5379 f2440f105904                   movsd xmm11, qword ptr [rcx + 4]
0000000145bf537f f3440f10410c                   movss xmm8, dword ptr [rcx + 0xc]
0000000145bf5385 f3440f597110                   mulss xmm14, dword ptr [rcx + 0x10]
0000000145bf538b 488d8df0000000                 lea rcx, [rbp + 0xf0]
0000000145bf5392 4889f2                         mov rdx, rsi
0000000145bf5395 488b9d30010000                 mov rbx, qword ptr [rbp + 0x130]
0000000145bf539c 4989d8                         mov r8, rbx
0000000145bf539f 410f28d8                       movaps xmm3, xmm8
0000000145bf53a3 e8f8ceffff                     call 0x145bf22a0
0000000145bf53a8 f30f108df0000000               movss xmm1, dword ptr [rbp + 0xf0]
0000000145bf53b0 f30f1085f4000000               movss xmm0, dword ptr [rbp + 0xf4]
0000000145bf53b8 440f28add0000000               movaps xmm13, xmmword ptr [rbp + 0xd0]
0000000145bf53c0 f3410f5cc5                     subss xmm0, xmm13
0000000145bf53c5 440f289540010000               movaps xmm10, xmmword ptr [rbp + 0x140]
0000000145bf53cd f3410f5cca                     subss xmm1, xmm10
0000000145bf53d2 e898683f00                     call 0x145febc6f
0000000145bf53d7 440f28c8                       movaps xmm9, xmm0
