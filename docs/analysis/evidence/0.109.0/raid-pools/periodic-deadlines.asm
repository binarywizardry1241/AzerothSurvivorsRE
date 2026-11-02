145951438: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
145951440: 410f2e4d14 ucomiss xmm1, dword ptr [r13 + 0x14]
145951445: 0f83ae010000 jae 0x1459515f9
14595144b: f3410f104568 movss xmm0, dword ptr [r13 + 0x68]
145951451: 0f2ec8 ucomiss xmm1, xmm0
145951454: 0f82abdfffff jb 0x14594f405
14595145a: f3410f584518 addss xmm0, dword ptr [r13 + 0x18]
145951460: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
