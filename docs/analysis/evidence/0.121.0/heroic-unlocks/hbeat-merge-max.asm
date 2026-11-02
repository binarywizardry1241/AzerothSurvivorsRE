0000000145aac938 440fb652e8                     movzx r10d, byte ptr [rdx - 0x18]
0000000145aac93d 443a52f8                       cmp r10b, byte ptr [rdx - 8]
0000000145aac941 75dd                           jne 0x145aac920
0000000145aac943 4c8b52e0                       mov r10, qword ptr [rdx - 0x20]
0000000145aac947 4c3b52f0                       cmp r10, qword ptr [rdx - 0x10]
0000000145aac94b 75d3                           jne 0x145aac920
0000000145aac94d 440fb642e9                     movzx r8d, byte ptr [rdx - 0x17]
0000000145aac952 440fb652f9                     movzx r10d, byte ptr [rdx - 7]
0000000145aac957 4538c2                         cmp r10b, r8b
0000000145aac95a 450f47c2                       cmova r8d, r10d
0000000145aac95e 448842e9                       mov byte ptr [rdx - 0x17], r8b
0000000145aac962 4d8d41ff                       lea r8, [r9 - 1]
0000000145aac966 4c29c8                         sub rax, r9
0000000145aac969 7715                           ja 0x145aac980
0000000145aac96b eb51                           jmp 0x145aac9be
0000000145aac96d 0f1002                         movups xmm0, xmmword ptr [rdx]
0000000145aac970 410f1101                       movups xmmword ptr [r9], xmm0
0000000145aac974 49ffc0                         inc r8
0000000145aac977 4883c210                       add rdx, 0x10
0000000145aac97b 48ffc8                         dec rax
0000000145aac97e 743e                           je 0x145aac9be
0000000145aac980 4d89c2                         mov r10, r8
0000000145aac983 49c1e204                       shl r10, 4
0000000145aac987 4e8d0c11                       lea r9, [rcx + r10]
0000000145aac98b 460fb65411f8                   movzx r10d, byte ptr [rcx + r10 - 8]
0000000145aac991 443a5208                       cmp r10b, byte ptr [rdx + 8]
0000000145aac995 75d6                           jne 0x145aac96d
0000000145aac997 4d8b51f0                       mov r10, qword ptr [r9 - 0x10]
0000000145aac99b 4c3b12                         cmp r10, qword ptr [rdx]
0000000145aac99e 75cd                           jne 0x145aac96d
0000000145aac9a0 450fb651f9                     movzx r10d, byte ptr [r9 - 7]
0000000145aac9a5 440fb65a09                     movzx r11d, byte ptr [rdx + 9]
0000000145aac9aa 4538d3                         cmp r11b, r10b
0000000145aac9ad 450f47d3                       cmova r10d, r11d
0000000145aac9b1 458851f9                       mov byte ptr [r9 - 7], r10b
0000000145aac9b5 4883c210                       add rdx, 0x10
0000000145aac9b9 48ffc8                         dec rax
0000000145aac9bc 75c2                           jne 0x145aac980
0000000145aac9be 4c8985f8020000                 mov qword ptr [rbp + 0x2f8], r8
