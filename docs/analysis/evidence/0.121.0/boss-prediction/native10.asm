0000000145bf475b 448b31                         mov r14d, dword ptr [rcx]
0000000145bf475e 448b6104                       mov r12d, dword ptr [rcx + 4]
0000000145bf4762 f30f107108                     movss xmm6, dword ptr [rcx + 8]
0000000145bf4767 f3440f10510c                   movss xmm10, dword ptr [rcx + 0xc]
0000000145bf476d f30f107910                     movss xmm7, dword ptr [rcx + 0x10]
0000000145bf4772 f3440f104114                   movss xmm8, dword ptr [rcx + 0x14]
0000000145bf4778 488d8d68010000                 lea rcx, [rbp + 0x168]
0000000145bf477f 4889f2                         mov rdx, rsi
0000000145bf4782 4c8b8530010000                 mov r8, qword ptr [rbp + 0x130]
0000000145bf4789 0f28df                         movaps xmm3, xmm7
0000000145bf478c e80fdbffff                     call 0x145bf22a0
0000000145bf4791 4889f1                         mov rcx, rsi
0000000145bf4794 488b9580010000                 mov rdx, qword ptr [rbp + 0x180]
0000000145bf479b 4589f0                         mov r8d, r14d
0000000145bf479e f30f11bd40010000               movss dword ptr [rbp + 0x140], xmm7
0000000145bf47a6 0f28df                         movaps xmm3, xmm7
0000000145bf47a9 e802daffff                     call 0x145bf21b0
0000000145bf47ae 4585e4                         test r12d, r12d
0000000145bf47b1 0f84a2e2ffff                   je 0x145bf2a59
