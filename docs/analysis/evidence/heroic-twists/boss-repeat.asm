0000000145c20017 4989f4                         mov r12, rsi
0000000145c2001a 488b8db0030000                 mov rcx, qword ptr [rbp + 0x3b0]
0000000145c20021 80795000                       cmp byte ptr [rcx + 0x50], 0
0000000145c20025 f30f108d94000000               movss xmm1, dword ptr [rbp + 0x94]
0000000145c2002d 7508                           jne 0x145c20037
0000000145c2002f f30f108d9c000000               movss xmm1, dword ptr [rbp + 0x9c]
0000000145c20037 f30f59c1                       mulss xmm0, xmm1
0000000145c2003b f30f1100                       movss dword ptr [rax], xmm0
