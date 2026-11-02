0000000145c1f38f 80bd3f03000003                 cmp byte ptr [rbp + 0x33f], 3
0000000145c1f396 41ba1d000000                   mov r10d, 0x1d
0000000145c1f39c 488bb5b0030000                 mov rsi, qword ptr [rbp + 0x3b0]
0000000145c1f3a3 7727                           ja 0x145c1f3cc
0000000145c1f3a5 488b4720                       mov rax, qword ptr [rdi + 0x20]
0000000145c1f3a9 420fb644f83d                   movzx eax, byte ptr [rax + r15*8 + 0x3d]
0000000145c1f3af 2c03                           sub al, 3
0000000145c1f3b1 0fb6c0                         movzx eax, al
0000000145c1f3b4 410f42c2                       cmovb eax, r10d
0000000145c1f3b8 3c09                           cmp al, 9
0000000145c1f3ba 0f8413050000                   je 0x145c1f8d3
0000000145c1f3c0 0fb6c0                         movzx eax, al
0000000145c1f3c3 83f817                         cmp eax, 0x17
0000000145c1f3c6 0f8407050000                   je 0x145c1f8d3
