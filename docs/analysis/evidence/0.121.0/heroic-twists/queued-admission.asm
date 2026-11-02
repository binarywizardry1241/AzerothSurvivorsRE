0000000145c21a12 4180bc246f03000003             cmp byte ptr [r12 + 0x36f], 3
0000000145c21a1b 77a3                           ja 0x145c219c0
0000000145c21a1d 2c03                           sub al, 3
0000000145c21a1f 0fb6c0                         movzx eax, al
0000000145c21a22 410f42c7                       cmovb eax, r15d
0000000145c21a26 3c09                           cmp al, 9
0000000145c21a28 74a2                           je 0x145c219cc
0000000145c21a2a 0fb6c0                         movzx eax, al
0000000145c21a2d 83f817                         cmp eax, 0x17
0000000145c21a30 749a                           je 0x145c219cc
0000000145c21a32 eb8c                           jmp 0x145c219c0
