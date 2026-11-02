0000000145bf37d9 448b39                         mov r15d, dword ptr [rcx]
0000000145bf37dc 488d8d90000000                 lea rcx, [rbp + 0x90]
0000000145bf37e3 f3440f1005b4495a00             movss xmm8, dword ptr [rip + 0x5a49b4]
0000000145bf37ec 4889f2                         mov rdx, rsi
0000000145bf37ef 4c8b8530010000                 mov r8, qword ptr [rbp + 0x130]
0000000145bf37f6 410f28d8                       movaps xmm3, xmm8
0000000145bf37fa e8a1eaffff                     call 0x145bf22a0
0000000145bf37ff f20f10b590000000               movsd xmm6, qword ptr [rbp + 0x90]
0000000145bf3807 0f28ce                         movaps xmm1, xmm6
0000000145bf380a 0f28bd40010000                 movaps xmm7, xmmword ptr [rbp + 0x140]
0000000145bf3811 0f5ccf                         subps xmm1, xmm7
0000000145bf3814 f30f16c1                       movshdup xmm0, xmm1
0000000145bf3818 e852843f00                     call 0x145febc6f
0000000145bf381d 440f28c8                       movaps xmm9, xmm0
