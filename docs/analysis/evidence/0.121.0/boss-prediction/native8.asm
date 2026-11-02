0000000145bf4e62 448b31                         mov r14d, dword ptr [rcx]
0000000145bf4e65 f3440f597110                   mulss xmm14, dword ptr [rcx + 0x10]
0000000145bf4e6b f3440f10410c                   movss xmm8, dword ptr [rcx + 0xc]
0000000145bf4e71 f3440f10152a335a00             movss xmm10, dword ptr [rip + 0x5a332a]
0000000145bf4e7a f3450f58d0                     addss xmm10, xmm8
0000000145bf4e7f f20f107104                     movsd xmm6, qword ptr [rcx + 4]
0000000145bf4e84 488d9df0000000                 lea rbx, [rbp + 0xf0]
0000000145bf4e8b 4889d9                         mov rcx, rbx
0000000145bf4e8e 4889f2                         mov rdx, rsi
0000000145bf4e91 4c8bbd30010000                 mov r15, qword ptr [rbp + 0x130]
0000000145bf4e98 4d89f8                         mov r8, r15
0000000145bf4e9b 410f28d8                       movaps xmm3, xmm8
0000000145bf4e9f e8fcd3ffff                     call 0x145bf22a0
0000000145bf4ea4 f30f108df0000000               movss xmm1, dword ptr [rbp + 0xf0]
0000000145bf4eac f30f1085f4000000               movss xmm0, dword ptr [rbp + 0xf4]
0000000145bf4eb4 0f28bdd0000000                 movaps xmm7, xmmword ptr [rbp + 0xd0]
0000000145bf4ebb f30f5cc7                       subss xmm0, xmm7
0000000145bf4ebf 440f28a540010000               movaps xmm12, xmmword ptr [rbp + 0x140]
0000000145bf4ec7 f3410f5ccc                     subss xmm1, xmm12
0000000145bf4ecc e89e6d3f00                     call 0x145febc6f
0000000145bf4ed1 440f28c8                       movaps xmm9, xmm0
0000000145bf4ed5 f30f11442420                   movss dword ptr [rsp + 0x20], xmm0
