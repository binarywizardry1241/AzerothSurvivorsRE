0000000145bf38b9 448b39                         mov r15d, dword ptr [rcx]
0000000145bf38bc f3440f10410c                   movss xmm8, dword ptr [rcx + 0xc]
0000000145bf38c2 f3440f597114                   mulss xmm14, dword ptr [rcx + 0x14]
0000000145bf38c8 f30f107110                     movss xmm6, dword ptr [rcx + 0x10]
0000000145bf38cd 450f28d0                       movaps xmm10, xmm8
0000000145bf38d1 f3440f58d6                     addss xmm10, xmm6
0000000145bf38d6 f20f107904                     movsd xmm7, qword ptr [rcx + 4]
0000000145bf38db 488d9df0000000                 lea rbx, [rbp + 0xf0]
0000000145bf38e2 4889d9                         mov rcx, rbx
0000000145bf38e5 4889f2                         mov rdx, rsi
0000000145bf38e8 4c8ba530010000                 mov r12, qword ptr [rbp + 0x130]
0000000145bf38ef 4d89e0                         mov r8, r12
0000000145bf38f2 410f28d8                       movaps xmm3, xmm8
0000000145bf38f6 e8a5e9ffff                     call 0x145bf22a0
0000000145bf38fb f30f108df0000000               movss xmm1, dword ptr [rbp + 0xf0]
0000000145bf3903 f30f1085f4000000               movss xmm0, dword ptr [rbp + 0xf4]
0000000145bf390b 440f28a5d0000000               movaps xmm12, xmmword ptr [rbp + 0xd0]
0000000145bf3913 f3410f5cc4                     subss xmm0, xmm12
0000000145bf3918 440f289d40010000               movaps xmm11, xmmword ptr [rbp + 0x140]
0000000145bf3920 f3410f5ccb                     subss xmm1, xmm11
0000000145bf3925 e845833f00                     call 0x145febc6f
0000000145bf392a 440f28c8                       movaps xmm9, xmm0
0000000145bf392e f30f11442420                   movss dword ptr [rsp + 0x20], xmm0
