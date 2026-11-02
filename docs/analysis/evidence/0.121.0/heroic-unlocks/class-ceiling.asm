0000000145aa3b80 4156                           push r14
0000000145aa3b82 56                             push rsi
0000000145aa3b83 57                             push rdi
0000000145aa3b84 55                             push rbp
0000000145aa3b85 53                             push rbx
0000000145aa3b86 4c8b89e8000000                 mov r9, qword ptr [rcx + 0xe8]
0000000145aa3b8d 31c0                           xor eax, eax
0000000145aa3b8f 4d85c9                         test r9, r9
0000000145aa3b92 0f84bb000000                   je 0x145aa3c53
0000000145aa3b98 4c8b91e0000000                 mov r10, qword ptr [rcx + 0xe0]
0000000145aa3b9f 4531db                         xor r11d, r11d
0000000145aa3ba2 4983f901                       cmp r9, 1
0000000145aa3ba6 7445                           je 0x145aa3bed
0000000145aa3ba8 4c89c8                         mov rax, r9
0000000145aa3bab 0f1f440000                     nop dword ptr [rax + rax]
0000000145aa3bb0 4c89de                         mov rsi, r11
0000000145aa3bb3 4889c7                         mov rdi, rax
0000000145aa3bb6 48d1ef                         shr rdi, 1
0000000145aa3bb9 4901fb                         add r11, rdi
0000000145aa3bbc 4c89db                         mov rbx, r11
0000000145aa3bbf 48c1e304                       shl rbx, 4
0000000145aa3bc3 31ed                           xor ebp, ebp
0000000145aa3bc5 4d39441a08                     cmp qword ptr [r10 + rbx + 8], r8
0000000145aa3bca 400f97c5                       seta bpl
0000000145aa3bce 4531f6                         xor r14d, r14d
0000000145aa3bd1 4138141a                       cmp byte ptr [r10 + rbx], dl
0000000145aa3bd5 410f97c6                       seta r14b
0000000145aa3bd9 440f44f5                       cmove r14d, ebp
0000000145aa3bdd 4584f6                         test r14b, r14b
0000000145aa3be0 4c0f45de                       cmovne r11, rsi
0000000145aa3be4 4829f8                         sub rax, rdi
0000000145aa3be7 4883f801                       cmp rax, 1
0000000145aa3beb 77c3                           ja 0x145aa3bb0
0000000145aa3bed 49c1e304                       shl r11, 4
0000000145aa3bf1 31c0                           xor eax, eax
0000000145aa3bf3 4338141a                       cmp byte ptr [r10 + r11], dl
0000000145aa3bf7 755a                           jne 0x145aa3c53
0000000145aa3bf9 4f39441a08                     cmp qword ptr [r10 + r11 + 8], r8
0000000145aa3bfe 7553                           jne 0x145aa3c53
0000000145aa3c00 49c1e104                       shl r9, 4
0000000145aa3c04 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aa3c10 4d85c9                         test r9, r9
0000000145aa3c13 743c                           je 0x145aa3c51
0000000145aa3c15 4983c1f0                       add r9, -0x10
0000000145aa3c19 4d394208                       cmp qword ptr [r10 + 8], r8
0000000145aa3c1d 4d8d5210                       lea r10, [r10 + 0x10]
0000000145aa3c21 75ed                           jne 0x145aa3c10
0000000145aa3c23 4c8b89d8010000                 mov r9, qword ptr [rcx + 0x1d8]
0000000145aa3c2a b001                           mov al, 1
0000000145aa3c2c 4d85c9                         test r9, r9
0000000145aa3c2f 7422                           je 0x145aa3c53
0000000145aa3c31 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aa3c38 49c1e104                       shl r9, 4
0000000145aa3c3c 31d2                           xor edx, edx
0000000145aa3c3e 6690                           nop
0000000145aa3c40 4c390411                       cmp qword ptr [rcx + rdx], r8
0000000145aa3c44 7414                           je 0x145aa3c5a
0000000145aa3c46 4883c210                       add rdx, 0x10
0000000145aa3c4a 4939d1                         cmp r9, rdx
0000000145aa3c4d 75f1                           jne 0x145aa3c40
0000000145aa3c4f eb02                           jmp 0x145aa3c53
0000000145aa3c51 31c0                           xor eax, eax
0000000145aa3c53 5b                             pop rbx
0000000145aa3c54 5d                             pop rbp
0000000145aa3c55 5f                             pop rdi
0000000145aa3c56 5e                             pop rsi
0000000145aa3c57 415e                           pop r14
0000000145aa3c59 c3                             ret
0000000145aa3c5a 0fb6441109                     movzx eax, byte ptr [rcx + rdx + 9]
0000000145aa3c5f 4d8d51f0                       lea r10, [r9 - 0x10]
0000000145aa3c63 4939d2                         cmp r10, rdx
0000000145aa3c66 0f849e000000                   je 0x145aa3d0a
0000000145aa3c6c 4929d1                         sub r9, rdx
0000000145aa3c6f 4983c1f0                       add r9, -0x10
0000000145aa3c73 49c1e904                       shr r9, 4
0000000145aa3c77 4983f901                       cmp r9, 1
0000000145aa3c7b 7505                           jne 0x145aa3c82
0000000145aa3c7d 4531d2                         xor r10d, r10d
0000000145aa3c80 eb6b                           jmp 0x145aa3ced
0000000145aa3c82 4c8d1c11                       lea r11, [rcx + rdx]
0000000145aa3c86 4983c329                       add r11, 0x29
0000000145aa3c8a 4c89ce                         mov rsi, r9
0000000145aa3c8d 4883e6fe                       and rsi, 0xfffffffffffffffe
0000000145aa3c91 4531d2                         xor r10d, r10d
0000000145aa3c94 eb17                           jmp 0x145aa3cad
0000000145aa3c96 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145aa3ca0 4983c202                       add r10, 2
0000000145aa3ca4 4983c320                       add r11, 0x20
0000000145aa3ca8 4c39d6                         cmp rsi, r10
0000000145aa3cab 743a                           je 0x145aa3ce7
0000000145aa3cad 4d3943e7                       cmp qword ptr [r11 - 0x19], r8
0000000145aa3cb1 740d                           je 0x145aa3cc0
0000000145aa3cb3 4d3943f7                       cmp qword ptr [r11 - 9], r8
0000000145aa3cb7 75e7                           jne 0x145aa3ca0
0000000145aa3cb9 eb1b                           jmp 0x145aa3cd6
0000000145aa3cbb 0f1f440000                     nop dword ptr [rax + rax]
0000000145aa3cc0 0fb6c0                         movzx eax, al
0000000145aa3cc3 410fb67bf0                     movzx edi, byte ptr [r11 - 0x10]
0000000145aa3cc8 4038f8                         cmp al, dil
0000000145aa3ccb 0f47f8                         cmova edi, eax
0000000145aa3cce 89f8                           mov eax, edi
0000000145aa3cd0 4d3943f7                       cmp qword ptr [r11 - 9], r8
0000000145aa3cd4 75ca                           jne 0x145aa3ca0
0000000145aa3cd6 0fb6c0                         movzx eax, al
0000000145aa3cd9 410fb63b                       movzx edi, byte ptr [r11]
0000000145aa3cdd 4038f8                         cmp al, dil
0000000145aa3ce0 0f47f8                         cmova edi, eax
0000000145aa3ce3 89f8                           mov eax, edi
0000000145aa3ce5 ebb9                           jmp 0x145aa3ca0
0000000145aa3ce7 41f6c101                       test r9b, 1
0000000145aa3ceb 741d                           je 0x145aa3d0a
0000000145aa3ced 49c1e204                       shl r10, 4
0000000145aa3cf1 4c01d1                         add rcx, r10
0000000145aa3cf4 4c39440a10                     cmp qword ptr [rdx + rcx + 0x10], r8
0000000145aa3cf9 750f                           jne 0x145aa3d0a
0000000145aa3cfb 0fb6c0                         movzx eax, al
0000000145aa3cfe 0fb64c0a19                     movzx ecx, byte ptr [rdx + rcx + 0x19]
0000000145aa3d03 38c8                           cmp al, cl
0000000145aa3d05 0f47c8                         cmova ecx, eax
0000000145aa3d08 89c8                           mov eax, ecx
0000000145aa3d0a fec0                           inc al
0000000145aa3d0c 0fb6c8                         movzx ecx, al
0000000145aa3d0f 80f905                         cmp cl, 5
0000000145aa3d12 b805000000                     mov eax, 5
0000000145aa3d17 0f42c1                         cmovb eax, ecx
0000000145aa3d1a e934ffffff                     jmp 0x145aa3c53
