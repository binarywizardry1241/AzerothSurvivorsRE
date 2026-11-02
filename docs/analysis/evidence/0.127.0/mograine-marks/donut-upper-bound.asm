0x145c52b4f: movss xmm1, dword ptr [rbp + 0x268]
0x145c52b57: ucomiss xmm1, xmm0
0x145c52b5a: setae al
0x145c52b5d: mov ecx, dword ptr [r15 + 0x10]
0x145c52b61: lea rdx, [rip + 0x178ec64]
0x145c52b68: movsxd rcx, dword ptr [rdx + rcx*4]
0x145c52b6c: add rcx, rdx
0x145c52b6f: jmp rcx
