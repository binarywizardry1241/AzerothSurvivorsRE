0000000145a90f94  3c0b                   cmp al, 0xb
0000000145a90f96  0f8704feffff           ja 0x145a90da0
0000000145a90f9c  0fb6d8                 movzx ebx, al
0000000145a90f9f  b8be0b0000             mov eax, 0xbbe
0000000145a90fa4  0fa3d8                 bt eax, ebx
0000000145a90fa7  0f83f3fdffff           jae 0x145a90da0
0000000145a90fad  418d4424ff             lea eax, [r12 - 1]
0000000145a90fb2  3c07                   cmp al, 7
0000000145a90fb4  0f87e6fdffff           ja 0x145a90da0
