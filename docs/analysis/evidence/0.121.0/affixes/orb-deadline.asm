0000000145c291e9 488b8638080000                 mov rax, qword ptr [rsi + 0x838]
0000000145c291f0 488b8e40080000                 mov rcx, qword ptr [rsi + 0x840]
0000000145c291f7 31d2                           xor edx, edx
0000000145c291f9 0f1f8000000000                 nop dword ptr [rax]
0000000145c29200 4839d1                         cmp rcx, rdx
0000000145c29203 0f84c3030000                   je 0x145c295cc
0000000145c29209 803c1002                       cmp byte ptr [rax + rdx], 2
0000000145c2920d 488d5201                       lea rdx, [rdx + 1]
0000000145c29211 75ed                           jne 0x145c29200
0000000145c29213 f30f108edc0c0000               movss xmm1, dword ptr [rsi + 0xcdc]
0000000145c2921b 0f57c0                         xorps xmm0, xmm0
0000000145c2921e 0f2ec8                         ucomiss xmm1, xmm0
0000000145c29221 f30f10457c                     movss xmm0, dword ptr [rbp + 0x7c]
0000000145c29226 7517                           jne 0x145c2923f
0000000145c29228 7a15                           jp 0x145c2923f
0000000145c2922a f30f5805f2f55600               addss xmm0, dword ptr [rip + 0x56f5f2]
0000000145c29232 f30f1186dc0c0000               movss dword ptr [rsi + 0xcdc], xmm0
0000000145c2923a e98d030000                     jmp 0x145c295cc
0000000145c2923f 0f2ec1                         ucomiss xmm0, xmm1
0000000145c29242 0f8284030000                   jb 0x145c295cc
0000000145c29248 f30f5805102a5800               addss xmm0, dword ptr [rip + 0x582a10]
0000000145c29250 f30f1186dc0c0000               movss dword ptr [rsi + 0xcdc], xmm0
