0000000145aa4080 56                             push rsi
0000000145aa4081 57                             push rdi
0000000145aa4082 4c8b81e0000000                 mov r8, qword ptr [rcx + 0xe0]
0000000145aa4089 488b81e8000000                 mov rax, qword ptr [rcx + 0xe8]
0000000145aa4090 48c1e004                       shl rax, 4
0000000145aa4094 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aa40a0 4885c0                         test rax, rax
0000000145aa40a3 743d                           je 0x145aa40e2
0000000145aa40a5 4883c0f0                       add rax, -0x10
0000000145aa40a9 49395008                       cmp qword ptr [r8 + 8], rdx
0000000145aa40ad 4d8d4010                       lea r8, [r8 + 0x10]
0000000145aa40b1 75ed                           jne 0x145aa40a0
0000000145aa40b3 4c8b89d8010000                 mov r9, qword ptr [rcx + 0x1d8]
0000000145aa40ba b001                           mov al, 1
0000000145aa40bc 4d85c9                         test r9, r9
0000000145aa40bf 741e                           je 0x145aa40df
0000000145aa40c1 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aa40c8 49c1e104                       shl r9, 4
0000000145aa40cc 4531c0                         xor r8d, r8d
0000000145aa40cf 90                             nop
0000000145aa40d0 4a391401                       cmp qword ptr [rcx + r8], rdx
0000000145aa40d4 7411                           je 0x145aa40e7
0000000145aa40d6 4983c010                       add r8, 0x10
0000000145aa40da 4d39c1                         cmp r9, r8
0000000145aa40dd 75f1                           jne 0x145aa40d0
0000000145aa40df 5f                             pop rdi
0000000145aa40e0 5e                             pop rsi
0000000145aa40e1 c3                             ret
0000000145aa40e2 31c0                           xor eax, eax
0000000145aa40e4 5f                             pop rdi
0000000145aa40e5 5e                             pop rsi
0000000145aa40e6 c3                             ret
0000000145aa40e7 420fb6440109                   movzx eax, byte ptr [rcx + r8 + 9]
0000000145aa40ed 4d8d51f0                       lea r10, [r9 - 0x10]
0000000145aa40f1 4d39c2                         cmp r10, r8
0000000145aa40f4 0f84a1000000                   je 0x145aa419b
0000000145aa40fa 4d29c1                         sub r9, r8
0000000145aa40fd 4983c1f0                       add r9, -0x10
0000000145aa4101 49c1e904                       shr r9, 4
0000000145aa4105 4983f901                       cmp r9, 1
0000000145aa4109 7505                           jne 0x145aa4110
0000000145aa410b 4531d2                         xor r10d, r10d
0000000145aa410e eb6d                           jmp 0x145aa417d
0000000145aa4110 4e8d1c01                       lea r11, [rcx + r8]
0000000145aa4114 4983c329                       add r11, 0x29
0000000145aa4118 4c89ce                         mov rsi, r9
0000000145aa411b 4883e6fe                       and rsi, 0xfffffffffffffffe
0000000145aa411f 4531d2                         xor r10d, r10d
0000000145aa4122 eb19                           jmp 0x145aa413d
0000000145aa4124 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aa4130 4983c202                       add r10, 2
0000000145aa4134 4983c320                       add r11, 0x20
0000000145aa4138 4c39d6                         cmp rsi, r10
0000000145aa413b 743a                           je 0x145aa4177
0000000145aa413d 493953e7                       cmp qword ptr [r11 - 0x19], rdx
0000000145aa4141 751d                           jne 0x145aa4160
0000000145aa4143 0fb6c0                         movzx eax, al
0000000145aa4146 410fb67bf0                     movzx edi, byte ptr [r11 - 0x10]
0000000145aa414b 4038f8                         cmp al, dil
0000000145aa414e 0f47f8                         cmova edi, eax
0000000145aa4151 89f8                           mov eax, edi
0000000145aa4153 493953f7                       cmp qword ptr [r11 - 9], rdx
0000000145aa4157 75d7                           jne 0x145aa4130
0000000145aa4159 eb0b                           jmp 0x145aa4166
0000000145aa415b 0f1f440000                     nop dword ptr [rax + rax]
0000000145aa4160 493953f7                       cmp qword ptr [r11 - 9], rdx
0000000145aa4164 75ca                           jne 0x145aa4130
0000000145aa4166 0fb6c0                         movzx eax, al
0000000145aa4169 410fb63b                       movzx edi, byte ptr [r11]
0000000145aa416d 4038f8                         cmp al, dil
0000000145aa4170 0f47f8                         cmova edi, eax
0000000145aa4173 89f8                           mov eax, edi
0000000145aa4175 ebb9                           jmp 0x145aa4130
0000000145aa4177 41f6c101                       test r9b, 1
0000000145aa417b 741e                           je 0x145aa419b
0000000145aa417d 49c1e204                       shl r10, 4
0000000145aa4181 4c01d1                         add rcx, r10
0000000145aa4184 4939540810                     cmp qword ptr [r8 + rcx + 0x10], rdx
0000000145aa4189 7510                           jne 0x145aa419b
0000000145aa418b 0fb6c0                         movzx eax, al
0000000145aa418e 410fb64c0819                   movzx ecx, byte ptr [r8 + rcx + 0x19]
0000000145aa4194 38c8                           cmp al, cl
0000000145aa4196 0f47c8                         cmova ecx, eax
0000000145aa4199 89c8                           mov eax, ecx
0000000145aa419b fec0                           inc al
0000000145aa419d 0fb6c8                         movzx ecx, al
0000000145aa41a0 80f905                         cmp cl, 5
0000000145aa41a3 b805000000                     mov eax, 5
0000000145aa41a8 0f42c1                         cmovb eax, ecx
0000000145aa41ab 5f                             pop rdi
0000000145aa41ac 5e                             pop rsi
0000000145aa41ad c3                             ret
