0x140001779: 488b95f0000000           mov rdx, qword ptr [rbp + 0xf0]
0x140001780: 31c0                     xor eax, eax
0x140001782: 4883fafe                 cmp rdx, -2
0x140001786: 7517                     jne 0x14000179f
0x140001788: 4883bd0801000001         cmp qword ptr [rbp + 0x108], 1
0x140001790: 750d                     jne 0x14000179f
0x140001792: 488b8500010000           mov rax, qword ptr [rbp + 0x100]
0x140001799: 803831                   cmp byte ptr [rax], 0x31
0x14000179c: 0f94c0                   sete al
