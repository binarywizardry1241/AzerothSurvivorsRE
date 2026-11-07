0000000145b22727 0fb6cb                         movzx ecx, bl
0000000145b2272a 0fb69578300000                 movzx edx, byte ptr [rbp + 0x3078]
0000000145b22731 440bad70300000                 or r13d, dword ptr [rbp + 0x3070]
0000000145b22738 4109d5                         or r13d, edx
0000000145b2273b 4509e7                         or r15d, r12d
0000000145b2273e 4109cf                         or r15d, ecx
0000000145b22741 49c1e720                       shl r15, 0x20
0000000145b22745 4d09ef                         or r15, r13
