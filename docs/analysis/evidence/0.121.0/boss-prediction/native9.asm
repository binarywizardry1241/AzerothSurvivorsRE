0000000145bf5857 8b19                           mov ebx, dword ptr [rcx]
0000000145bf5859 f3440f10410c                   movss xmm8, dword ptr [rcx + 0xc]
0000000145bf585f f3440f597110                   mulss xmm14, dword ptr [rcx + 0x10]
0000000145bf5865 f20f107104                     movsd xmm6, qword ptr [rcx + 4]
0000000145bf586a 4c8db5f0000000                 lea r14, [rbp + 0xf0]
0000000145bf5871 4c89f1                         mov rcx, r14
0000000145bf5874 4889f2                         mov rdx, rsi
0000000145bf5877 4c8bbd30010000                 mov r15, qword ptr [rbp + 0x130]
0000000145bf587e 4d89f8                         mov r8, r15
0000000145bf5881 410f28d8                       movaps xmm3, xmm8
0000000145bf5885 e816caffff                     call 0x145bf22a0
0000000145bf588a f30f108df0000000               movss xmm1, dword ptr [rbp + 0xf0]
0000000145bf5892 f30f1085f4000000               movss xmm0, dword ptr [rbp + 0xf4]
0000000145bf589a 440f2895d0000000               movaps xmm10, xmmword ptr [rbp + 0xd0]
0000000145bf58a2 f3410f5cc2                     subss xmm0, xmm10
0000000145bf58a7 0f28bd40010000                 movaps xmm7, xmmword ptr [rbp + 0x140]
0000000145bf58ae f30f5ccf                       subss xmm1, xmm7
0000000145bf58b2 e8b8633f00                     call 0x145febc6f
0000000145bf58b7 440f28c8                       movaps xmm9, xmm0
0000000145bf58bb f30f11442420                   movss dword ptr [rsp + 0x20], xmm0
