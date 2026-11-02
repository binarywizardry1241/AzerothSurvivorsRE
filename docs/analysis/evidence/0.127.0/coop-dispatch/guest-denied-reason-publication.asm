0000000145bd906d 83f802                         cmp eax, 2
0000000145bd9070 740a                           je 0x145bd907c
0000000145bd9072 488d4dc8                       lea rcx, [rbp - 0x38]
0000000145bd9076 e8751bfdff                     call 0x145baabf0
0000000145bd907b 90                             nop 
0000000145bd907c 48897c2420                     mov qword ptr [rsp + 0x20], rdi
0000000145bd9081 488d15f8ad4a01                 lea rdx, [rip + 0x14aadf8]
0000000145bd9088 41b807000000                   mov r8d, 7
0000000145bd908e 4889f1                         mov rcx, rsi
0000000145bd9091 4c8b8d78050000                 mov r9, qword ptr [rbp + 0x578]
0000000145bd9098 e873b0ffff                     call 0x145bd4110
0000000145bd909d 90                             nop 
0000000145bd909e 488b9568050000                 mov rdx, qword ptr [rbp + 0x568]
0000000145bd90a5 4885d2                         test rdx, rdx
0000000145bd90a8 0f8490010000                   je 0x145bd923e
0000000145bd90ae 41b801000000                   mov r8d, 1
0000000145bd90b4 488b8d78050000                 mov rcx, qword ptr [rbp + 0x578]
0000000145bd90bb 0f28b590050000                 movaps xmm6, xmmword ptr [rbp + 0x590]
0000000145bd90c2 4881c428060000                 add rsp, 0x628
0000000145bd90c9 5b                             pop rbx
0000000145bd90ca 5f                             pop rdi
0000000145bd90cb 5e                             pop rsi
0000000145bd90cc 415c                           pop r12
0000000145bd90ce 415d                           pop r13
0000000145bd90d0 415e                           pop r14
0000000145bd90d2 415f                           pop r15
0000000145bd90d4 5d                             pop rbp
0000000145bd90d5 e9f69042fa                     jmp 0x1400021d0
