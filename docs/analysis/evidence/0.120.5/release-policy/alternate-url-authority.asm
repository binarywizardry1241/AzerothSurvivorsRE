0000000145b66b94 488bbd08030000                 mov rdi, qword ptr [rbp + 0x308]
0000000145b66b9b 4829f7                         sub rdi, rsi
0000000145b66b9e 488b8d18030000                 mov rcx, qword ptr [rbp + 0x318]
0000000145b66ba5 4801ce                         add rsi, rcx
0000000145b66ba8 48894dc8                       mov qword ptr [rbp - 0x38], rcx
0000000145b66bac 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145b66bb0 4531f6                         xor r14d, r14d
0000000145b66bb3 eb13                           jmp 0x145b66bc8
0000000145b66bb5 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145b66bc0 4989c6                         mov r14, rax
0000000145b66bc3 4839c7                         cmp rdi, rax
0000000145b66bc6 7278                           jb 0x145b66c40
0000000145b66bc8 4989f8                         mov r8, rdi
0000000145b66bcb 4d29f0                         sub r8, r14
0000000145b66bce 4a8d0436                       lea rax, [rsi + r14]
0000000145b66bd2 4983f810                       cmp r8, 0x10
0000000145b66bd6 7328                           jae 0x145b66c00
0000000145b66bd8 31d2                           xor edx, edx
0000000145b66bda 4d85c0                         test r8, r8
0000000145b66bdd 7412                           je 0x145b66bf1
0000000145b66bdf 90                             nop
0000000145b66be0 803c102f                       cmp byte ptr [rax + rdx], 0x2f
0000000145b66be4 744a                           je 0x145b66c30
0000000145b66be6 48ffc2                         inc rdx
0000000145b66be9 4939d0                         cmp r8, rdx
0000000145b66bec 75f2                           jne 0x145b66be0
0000000145b66bee 4c89c2                         mov rdx, r8
0000000145b66bf1 31c0                           xor eax, eax
0000000145b66bf3 b901000000                     mov ecx, 1
0000000145b66bf8 4883f801                       cmp rax, 1
0000000145b66bfc 7418                           je 0x145b66c16
0000000145b66bfe eb40                           jmp 0x145b66c40
0000000145b66c00 b12f                           mov cl, 0x2f
0000000145b66c02 4889c2                         mov rdx, rax
0000000145b66c05 e826154200                     call 0x145f88130
0000000145b66c0a 90                             nop
0000000145b66c0b b901000000                     mov ecx, 1
0000000145b66c10 4883f801                       cmp rax, 1
0000000145b66c14 752a                           jne 0x145b66c40
0000000145b66c16 4a8d0432                       lea rax, [rdx + r14]
0000000145b66c1a 48ffc0                         inc rax
0000000145b66c1d 4c01f2                         add rdx, r14
0000000145b66c20 4839fa                         cmp rdx, rdi
0000000145b66c23 739b                           jae 0x145b66bc0
0000000145b66c25 803c162f                       cmp byte ptr [rsi + rdx], 0x2f
0000000145b66c29 7595                           jne 0x145b66bc0
0000000145b66c2b e9ae000000                     jmp 0x145b66cde
0000000145b66c30 b801000000                     mov eax, 1
0000000145b66c35 b901000000                     mov ecx, 1
0000000145b66c3a 4883f801                       cmp rax, 1
0000000145b66c3e 74d6                           je 0x145b66c16
0000000145b66c40 31c0                           xor eax, eax
0000000145b66c42 48894d18                       mov qword ptr [rbp + 0x18], rcx
0000000145b66c46 48894520                       mov qword ptr [rbp + 0x20], rax
0000000145b66c4a 4989f8                         mov r8, rdi
0000000145b66c4d eb0a                           jmp 0x145b66c59
0000000145b66c4f 90                             nop
0000000145b66c50 4939f8                         cmp r8, rdi
0000000145b66c53 0f8731fcffff                   ja 0x145b6688a
0000000145b66c59 b13a                           mov cl, 0x3a
0000000145b66c5b 4889f2                         mov rdx, rsi
0000000145b66c5e e8bd154200                     call 0x145f88220
0000000145b66c63 90                             nop
0000000145b66c64 4883f801                       cmp rax, 1
0000000145b66c68 0f851cfcffff                   jne 0x145b6688a
0000000145b66c6e 4989d0                         mov r8, rdx
0000000145b66c71 4839fa                         cmp rdx, rdi
0000000145b66c74 73da                           jae 0x145b66c50
0000000145b66c76 42803c063a                     cmp byte ptr [rsi + r8], 0x3a
0000000145b66c7b 75d3                           jne 0x145b66c50
0000000145b66c7d 48897500                       mov qword ptr [rbp], rsi
0000000145b66c81 4c894508                       mov qword ptr [rbp + 8], r8
0000000145b66c85 488d45c8                       lea rax, [rbp - 0x38]
0000000145b66c89 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000145b66c90 488d0d29b449fa                 lea rcx, [rip - 0x5b64bd7]
0000000145b66c97 48898dd8010000                 mov qword ptr [rbp + 0x1d8], rcx
0000000145b66c9e 4889e8                         mov rax, rbp
0000000145b66ca1 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
0000000145b66ca8 48898de8010000                 mov qword ptr [rbp + 0x1e8], rcx
0000000145b66caf 488d4518                       lea rax, [rbp + 0x18]
0000000145b66cb3 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145b66cba 48898df8010000                 mov qword ptr [rbp + 0x1f8], rcx
0000000145b66cc1 488d4d40                       lea rcx, [rbp + 0x40]
0000000145b66cc5 488d156f7fa901                 lea rdx, [rip + 0x1a97f6f]
0000000145b66ccc 4c8d85d0010000                 lea r8, [rbp + 0x1d0]
0000000145b66cd3 e8288a4100                     call 0x145f7f700
0000000145b66cd8 90                             nop
0000000145b66cd9 e9b4fbffff                     jmp 0x145b66892
0000000145b66cde 4829c7                         sub rdi, rax
0000000145b66ce1 4801f0                         add rax, rsi
0000000145b66ce4 4889c1                         mov rcx, rax
0000000145b66ce7 4889f8                         mov rax, rdi
0000000145b66cea 4889d7                         mov rdi, rdx
0000000145b66ced e950ffffff                     jmp 0x145b66c42
