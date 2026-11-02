0000000145c28a2b f30f104d7c                     movss xmm1, dword ptr [rbp + 0x7c]
0000000145c28a30 0f2e4818                       ucomiss xmm1, dword ptr [rax + 0x18]
0000000145c28a34 0f8386000000                   jae 0x145c28ac0
0000000145c28a3a f30f10401c                     movss xmm0, dword ptr [rax + 0x1c]
0000000145c28a3f 0f2ec8                         ucomiss xmm1, xmm0
0000000145c28a42 4d89fc                         mov r12, r15
0000000145c28a45 72cb                           jb 0x145c28a12
0000000145c28a47 f3410f58c2                     addss xmm0, xmm10
0000000145c28a4c f30f11401c                     movss dword ptr [rax + 0x1c], xmm0
