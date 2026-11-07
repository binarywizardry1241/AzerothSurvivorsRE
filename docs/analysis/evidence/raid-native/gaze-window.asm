14594faa0: 418b4510 mov eax, dword ptr [r13 + 0x10]
14594faa4: 83f804 cmp eax, 4
14594faa7: 0f85fd020000 jne 0x14594fdaa
14594faad: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
14594fab5: 410f2e4514 ucomiss xmm0, dword ptr [r13 + 0x14]
14594faba: 0f8296050000 jb 0x145950056
14594fac0: f3410f104d54 movss xmm1, dword ptr [r13 + 0x54]
14594fac6: 0f2ec8 ucomiss xmm1, xmm0
14594fac9: 0f8687050000 jbe 0x145950056
