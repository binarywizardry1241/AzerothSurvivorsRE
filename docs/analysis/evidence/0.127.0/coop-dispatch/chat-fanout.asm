0000000145bd2db0 55                             push rbp
0000000145bd2db1 4157                           push r15
0000000145bd2db3 4156                           push r14
0000000145bd2db5 4155                           push r13
0000000145bd2db7 4154                           push r12
0000000145bd2db9 56                             push rsi
0000000145bd2dba 57                             push rdi
0000000145bd2dbb 53                             push rbx
0000000145bd2dbc 4881ecb8020000                 sub rsp, 0x2b8
0000000145bd2dc3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd2dcb 48c78530020000feffffff         mov qword ptr [rbp + 0x230], 0xfffffffffffffffe
0000000145bd2dd6 83b9980d000003                 cmp dword ptr [rcx + 0xd98], 3
0000000145bd2ddd 0f85c4020000                   jne 0x145bd30a7
0000000145bd2de3 4d89cd                         mov r13, r9
0000000145bd2de6 4d85c9                         test r9, r9
0000000145bd2de9 790f                           jns 0x145bd2dfa
0000000145bd2deb 31ff                           xor edi, edi
0000000145bd2ded 4889f9                         mov rcx, rdi
0000000145bd2df0 4c89ea                         mov rdx, r13
0000000145bd2df3 e8735b6300                     call 0x14620896b
0000000145bd2df8 0f0b                           ud2 
0000000145bd2dfa 4c898528020000                 mov qword ptr [rbp + 0x228], r8
0000000145bd2e01 4c8bb9481b0000                 mov r15, qword ptr [rcx + 0x1b48]
0000000145bd2e08 7468                           je 0x145bd2e72
0000000145bd2e0a 4889cb                         mov rbx, rcx
0000000145bd2e0d 4989d6                         mov r14, rdx
0000000145bd2e10 e8ebf342fa                     call 0x140002200
0000000145bd2e15 bf01000000                     mov edi, 1
0000000145bd2e1a ba01000000                     mov edx, 1
0000000145bd2e1f 4c89e9                         mov rcx, r13
0000000145bd2e22 e899f342fa                     call 0x1400021c0
0000000145bd2e27 4885c0                         test rax, rax
0000000145bd2e2a 74c1                           je 0x145bd2ded
0000000145bd2e2c 4889c6                         mov rsi, rax
0000000145bd2e2f 4889c1                         mov rcx, rax
0000000145bd2e32 488b9528020000                 mov rdx, qword ptr [rbp + 0x228]
0000000145bd2e39 4d89e8                         mov r8, r13
0000000145bd2e3c e8dae84800                     call 0x14606171b
0000000145bd2e41 4c89f2                         mov rdx, r14
0000000145bd2e44 4889d9                         mov rcx, rbx
0000000145bd2e47 488bbdb0020000                 mov rdi, qword ptr [rbp + 0x2b0]
0000000145bd2e4e 4885ff                         test rdi, rdi
0000000145bd2e51 7930                           jns 0x145bd2e83
0000000145bd2e53 4889b520020000                 mov qword ptr [rbp + 0x220], rsi
0000000145bd2e5a 4531ff                         xor r15d, r15d
0000000145bd2e5d 4c89ad18020000                 mov qword ptr [rbp + 0x218], r13
0000000145bd2e64 4c89f9                         mov rcx, r15
0000000145bd2e67 4889fa                         mov rdx, rdi
0000000145bd2e6a e8fc5a6300                     call 0x14620896b
0000000145bd2e6f 90                             nop 
0000000145bd2e70 0f0b                           ud2 
0000000145bd2e72 be01000000                     mov esi, 1
0000000145bd2e77 488bbdb0020000                 mov rdi, qword ptr [rbp + 0x2b0]
0000000145bd2e7e 4885ff                         test rdi, rdi
0000000145bd2e81 78d0                           js 0x145bd2e53
0000000145bd2e83 7454                           je 0x145bd2ed9
0000000145bd2e85 4889b520020000                 mov qword ptr [rbp + 0x220], rsi
0000000145bd2e8c 4c89fe                         mov rsi, r15
0000000145bd2e8f 4889cb                         mov rbx, rcx
0000000145bd2e92 4989d4                         mov r12, rdx
0000000145bd2e95 e866f342fa                     call 0x140002200
0000000145bd2e9a 41bf01000000                   mov r15d, 1
0000000145bd2ea0 ba01000000                     mov edx, 1
0000000145bd2ea5 4889f9                         mov rcx, rdi
0000000145bd2ea8 e813f342fa                     call 0x1400021c0
0000000145bd2ead 4885c0                         test rax, rax
0000000145bd2eb0 74ab                           je 0x145bd2e5d
0000000145bd2eb2 4989c6                         mov r14, rax
0000000145bd2eb5 4889c1                         mov rcx, rax
0000000145bd2eb8 488b95a8020000                 mov rdx, qword ptr [rbp + 0x2a8]
0000000145bd2ebf 4989f8                         mov r8, rdi
0000000145bd2ec2 e854e84800                     call 0x14606171b
0000000145bd2ec7 4c89e2                         mov rdx, r12
0000000145bd2eca 4889d9                         mov rcx, rbx
0000000145bd2ecd 4989f7                         mov r15, rsi
0000000145bd2ed0 488bb520020000                 mov rsi, qword ptr [rbp + 0x220]
0000000145bd2ed7 eb06                           jmp 0x145bd2edf
0000000145bd2ed9 41be01000000                   mov r14d, 1
0000000145bd2edf 440fb68da0020000               movzx r9d, byte ptr [rbp + 0x2a0]
0000000145bd2ee7 488955f8                       mov qword ptr [rbp - 8], rdx
0000000145bd2eeb 4c896dc8                       mov qword ptr [rbp - 0x38], r13
0000000145bd2eef 488975d0                       mov qword ptr [rbp - 0x30], rsi
0000000145bd2ef3 4c896dd8                       mov qword ptr [rbp - 0x28], r13
0000000145bd2ef7 44884d00                       mov byte ptr [rbp], r9b
0000000145bd2efb 48897de0                       mov qword ptr [rbp - 0x20], rdi
0000000145bd2eff 4c8975e8                       mov qword ptr [rbp - 0x18], r14
0000000145bd2f03 48897df0                       mov qword ptr [rbp - 0x10], rdi
0000000145bd2f07 48b81500000000000080           movabs rax, 0x8000000000000015
0000000145bd2f11 488945c0                       mov qword ptr [rbp - 0x40], rax
0000000145bd2f15 4c69b1d80d0000e8040000         imul r14, qword ptr [rcx + 0xdd8], 0x4e8
0000000145bd2f20 488b99d00d0000                 mov rbx, qword ptr [rcx + 0xdd0]
0000000145bd2f27 4901de                         add r14, rbx
0000000145bd2f2a 4c8b8528020000                 mov r8, qword ptr [rbp + 0x228]
0000000145bd2f31 4c39f3                         cmp rbx, r14
0000000145bd2f34 0f84ed000000                   je 0x145bd3027
0000000145bd2f3a 4881c3e8040000                 add rbx, 0x4e8
0000000145bd2f41 eb1d                           jmp 0x145bd2f60
0000000145bd2f43 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145bd2f50 4c39f3                         cmp rbx, r14
0000000145bd2f53 488d9be8040000                 lea rbx, [rbx + 0x4e8]
0000000145bd2f5a 0f84c7000000                   je 0x145bd3027
0000000145bd2f60 807bfc01                       cmp byte ptr [rbx - 4], 1
0000000145bd2f64 75ea                           jne 0x145bd2f50
0000000145bd2f66 83bb28fbffff01                 cmp dword ptr [rbx - 0x4d8], 1
0000000145bd2f6d 74e1                           je 0x145bd2f50
0000000145bd2f6f 4c89bd20020000                 mov qword ptr [rbp + 0x220], r15
0000000145bd2f76 4c89ad18020000                 mov qword ptr [rbp + 0x218], r13
0000000145bd2f7d 4989cf                         mov r15, rcx
0000000145bd2f80 4989d5                         mov r13, rdx
0000000145bd2f83 488b4be0                       mov rcx, qword ptr [rbx - 0x20]
0000000145bd2f87 488b53e8                       mov rdx, qword ptr [rbx - 0x18]
0000000145bd2f8b 4c8d8390fdffff                 lea r8, [rbx - 0x270]
0000000145bd2f92 e899ecfbff                     call 0x145b91c30
0000000145bd2f97 90                             nop 
0000000145bd2f98 4c8b63e0                       mov r12, qword ptr [rbx - 0x20]
0000000145bd2f9c 488b73e8                       mov rsi, qword ptr [rbx - 0x18]
0000000145bd2fa0 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bd2fa7 488d55c0                       lea rdx, [rbp - 0x40]
0000000145bd2fab e8e01a1400                     call 0x145d14a90
0000000145bd2fb0 90                             nop 
0000000145bd2fb1 488b9508020000                 mov rdx, qword ptr [rbp + 0x208]
0000000145bd2fb8 4c8b8510020000                 mov r8, qword ptr [rbp + 0x210]
0000000145bd2fbf f04c010581e2a802               lock add qword ptr [rip + 0x2a8e281], r8
0000000145bd2fc7 f048ff0589e2a802               lock inc qword ptr [rip + 0x2a8e289]
0000000145bd2fcf 4c89e1                         mov rcx, r12
0000000145bd2fd2 488995f8010000                 mov qword ptr [rbp + 0x1f8], rdx
0000000145bd2fd9 ff5618                         call qword ptr [rsi + 0x18]
0000000145bd2fdc 90                             nop 
0000000145bd2fdd 488b9500020000                 mov rdx, qword ptr [rbp + 0x200]
0000000145bd2fe4 4885d2                         test rdx, rdx
0000000145bd2fe7 7412                           je 0x145bd2ffb
0000000145bd2fe9 41b801000000                   mov r8d, 1
0000000145bd2fef 488b8df8010000                 mov rcx, qword ptr [rbp + 0x1f8]
0000000145bd2ff6 e8d5f142fa                     call 0x1400021d0
0000000145bd2ffb 4c8b8528020000                 mov r8, qword ptr [rbp + 0x228]
0000000145bd3002 4c89ea                         mov rdx, r13
0000000145bd3005 4c89f9                         mov rcx, r15
0000000145bd3008 4c8bad18020000                 mov r13, qword ptr [rbp + 0x218]
0000000145bd300f 4c8bbd20020000                 mov r15, qword ptr [rbp + 0x220]
0000000145bd3016 440fb68da0020000               movzx r9d, byte ptr [rbp + 0x2a0]
0000000145bd301e 4c39f3                         cmp rbx, r14
0000000145bd3021 0f8513ffffff                   jne 0x145bd2f3a
0000000145bd3027 488bb1781a0000                 mov rsi, qword ptr [rcx + 0x1a78]
0000000145bd302e 488b99801a0000                 mov rbx, qword ptr [rcx + 0x1a80]
0000000145bd3035 4c39fa                         cmp rdx, r15
0000000145bd3038 0f94442438                     sete byte ptr [rsp + 0x38]
0000000145bd303d 48897c2430                     mov qword ptr [rsp + 0x30], rdi
0000000145bd3042 488b85a8020000                 mov rax, qword ptr [rbp + 0x2a8]
0000000145bd3049 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145bd304e 44884c2420                     mov byte ptr [rsp + 0x20], r9b
0000000145bd3053 488d8d00020000                 lea rcx, [rbp + 0x200]
0000000145bd305a 4d89e9                         mov r9, r13
0000000145bd305d e82ecffbff                     call 0x145b8ff90
0000000145bd3062 90                             nop 
0000000145bd3063 488b9508020000                 mov rdx, qword ptr [rbp + 0x208]
0000000145bd306a 4c8b8510020000                 mov r8, qword ptr [rbp + 0x210]
0000000145bd3071 4889f1                         mov rcx, rsi
0000000145bd3074 48899528020000                 mov qword ptr [rbp + 0x228], rdx
0000000145bd307b ff5318                         call qword ptr [rbx + 0x18]
0000000145bd307e 90                             nop 
0000000145bd307f 488b9500020000                 mov rdx, qword ptr [rbp + 0x200]
0000000145bd3086 4885d2                         test rdx, rdx
0000000145bd3089 7412                           je 0x145bd309d
0000000145bd308b 41b801000000                   mov r8d, 1
0000000145bd3091 488b8d28020000                 mov rcx, qword ptr [rbp + 0x228]
0000000145bd3098 e833f142fa                     call 0x1400021d0
0000000145bd309d 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bd30a1 e82a75fdff                     call 0x145baa5d0
0000000145bd30a6 90                             nop 
0000000145bd30a7 4881c4b8020000                 add rsp, 0x2b8
0000000145bd30ae 5b                             pop rbx
0000000145bd30af 5f                             pop rdi
0000000145bd30b0 5e                             pop rsi
0000000145bd30b1 415c                           pop r12
0000000145bd30b3 415d                           pop r13
0000000145bd30b5 415e                           pop r14
0000000145bd30b7 415f                           pop r15
0000000145bd30b9 5d                             pop rbp
0000000145bd30ba c3                             ret 
