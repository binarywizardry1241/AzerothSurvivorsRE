0000000145b137d9  0fb7d3                 movzx edx, bx
0000000145b137dc  8d4aca                 lea ecx, [rdx - 0x36]
0000000145b137df  83f907                 cmp ecx, 7
0000000145b137e2  7743                   ja 0x145b13827
0000000145b137e4  488d1599814a01         lea rdx, [rip + 0x14a8199]
0000000145b137eb  48630c8a               movsxd rcx, dword ptr [rdx + rcx*4]
0000000145b137ef  4801d1                 add rcx, rdx
0000000145b137f2  ffe1                   jmp rcx
