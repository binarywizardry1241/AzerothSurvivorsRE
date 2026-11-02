0000000145bf3122 448b31                         mov r14d, dword ptr [rcx]
0000000145bf3125 8b7904                         mov edi, dword ptr [rcx + 4]
0000000145bf3128 8b4108                         mov eax, dword ptr [rcx + 8]
0000000145bf312b 898558010000                   mov dword ptr [rbp + 0x158], eax
0000000145bf3131 f30f10410c                     movss xmm0, dword ptr [rcx + 0xc]
0000000145bf3136 f30f118540010000               movss dword ptr [rbp + 0x140], xmm0
0000000145bf313e f30f107110                     movss xmm6, dword ptr [rcx + 0x10]
0000000145bf3143 f30f104114                     movss xmm0, dword ptr [rcx + 0x14]
0000000145bf3148 f30f1185e8000000               movss dword ptr [rbp + 0xe8], xmm0
0000000145bf3150 f30f107918                     movss xmm7, dword ptr [rcx + 0x18]
0000000145bf3155 488d8d68010000                 lea rcx, [rbp + 0x168]
0000000145bf315c 4889f2                         mov rdx, rsi
0000000145bf315f 4c8b8530010000                 mov r8, qword ptr [rbp + 0x130]
0000000145bf3166 0f28de                         movaps xmm3, xmm6
0000000145bf3169 e832f1ffff                     call 0x145bf22a0
0000000145bf316e 4889f1                         mov rcx, rsi
0000000145bf3171 488b9580010000                 mov rdx, qword ptr [rbp + 0x180]
0000000145bf3178 4589f0                         mov r8d, r14d
0000000145bf317b f30f11b57c010000               movss dword ptr [rbp + 0x17c], xmm6
0000000145bf3183 0f28de                         movaps xmm3, xmm6
0000000145bf3186 e825f0ffff                     call 0x145bf21b0
