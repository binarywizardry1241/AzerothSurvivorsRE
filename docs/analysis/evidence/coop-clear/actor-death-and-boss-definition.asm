0000000145b539c6 c781b000000001000000           mov dword ptr [rcx + 0xb0], 1
0000000145b539d0 f3440f11a9b4000000             movss dword ptr [rcx + 0xb4], xmm13
0000000145b539d9 48c7411000000000               mov qword ptr [rcx + 0x10], 0
0000000145b539e1 48837918ff                     cmp qword ptr [rcx + 0x18], -1
0000000145b539e6 7406                           je 0x145b539ee
0000000145b539e8 4c8b6930                       mov r13, qword ptr [rcx + 0x30]
0000000145b539ec eb03                           jmp 0x145b539f1
0000000145b539ee 4531ed                         xor r13d, r13d
