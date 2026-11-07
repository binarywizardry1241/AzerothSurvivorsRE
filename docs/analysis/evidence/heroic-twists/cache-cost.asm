0000000145c2f060 31c9                           xor ecx, ecx
0000000145c2f062 4489fa                         mov edx, r15d
0000000145c2f065 f3480f2ac2                     cvtsi2ss xmm0, rdx
0000000145c2f06a 80be6f03000003                 cmp byte ptr [rsi + 0x36f], 3
0000000145c2f071 f30f5905c3915600               mulss xmm0, dword ptr [rip + 0x5691c3]
0000000145c2f079 0f93c1                         setae cl
0000000145c2f07c 488d155d07a601                 lea rdx, [rip + 0x1a6075d]
0000000145c2f083 f30f58048a                     addss xmm0, dword ptr [rdx + rcx*4]
0000000145c2f088 f3480f2cc8                     cvttss2si rcx, xmm0
0000000145c2f08d 31d2                           xor edx, edx
0000000145c2f08f 0f57c9                         xorps xmm1, xmm1
0000000145c2f092 0f2ec1                         ucomiss xmm0, xmm1
0000000145c2f095 0f43d1                         cmovae edx, ecx
0000000145c2f098 0f2e05d1bd5700                 ucomiss xmm0, dword ptr [rip + 0x57bdd1]
0000000145c2f09f b9ffffffff                     mov ecx, 0xffffffff
0000000145c2f0a4 0f46ca                         cmovbe ecx, edx
0000000145c2f0a7 898ed00c0000                   mov dword ptr [rsi + 0xcd0], ecx
