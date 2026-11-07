145952f18: 0f57c0 xorps xmm0, xmm0
145952f1b: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
145952f23: 0f2ec8 ucomiss xmm1, xmm0
145952f26: 0f86c1000000 jbe 0x145952fed
145952f2c: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
145952f33: 80b9b80a000000 cmp byte ptr [rcx + 0xab8], 0
145952f3a: 7510 jne 0x145952f4c
145952f3c: f30f1005c41d4800 movss xmm0, dword ptr [rip + 0x481dc4]
145952f44: f30f1185c8000000 movss dword ptr [rbp + 0xc8], xmm0
145952f4c: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
145952f54: f30f598dc8000000 mulss xmm1, dword ptr [rbp + 0xc8]
