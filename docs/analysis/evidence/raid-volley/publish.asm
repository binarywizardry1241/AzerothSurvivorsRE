145950063: f3410f104554 movss xmm0, dword ptr [r13 + 0x54]
145950069: f3410f5c4564 subss xmm0, dword ptr [r13 + 0x64]
14595006f: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
145950077: 0f2ec8 ucomiss xmm1, xmm0
14595007a: 0f82f2000000 jb 0x145950172
145950080: 41c6457e01 mov byte ptr [r13 + 0x7e], 1
