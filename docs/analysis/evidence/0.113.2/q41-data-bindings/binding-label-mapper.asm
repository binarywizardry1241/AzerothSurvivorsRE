00000001401a8020: 55                             push rbp
00000001401a8021: 4157                           push r15
00000001401a8023: 4156                           push r14
00000001401a8025: 56                             push rsi
00000001401a8026: 57                             push rdi
00000001401a8027: 53                             push rbx
00000001401a8028: 4883ec68                       sub rsp, 0x68
00000001401a802c: 488d6c2460                     lea rbp, [rsp + 0x60]
00000001401a8031: 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
00000001401a8039: 4889ce                         mov rsi, rcx
00000001401a803c: 488b1a                         mov rbx, qword ptr [rdx]
00000001401a803f: 4883fbff                       cmp rbx, -1
00000001401a8043: 0f84b3000000                   je 0x1401a80fc
00000001401a8049: 48837a100e                     cmp qword ptr [rdx + 0x10], 0xe
00000001401a804e: 0f85c9000000                   jne 0x1401a811d
00000001401a8054: 4c8b4208                       mov r8, qword ptr [rdx + 8]
00000001401a8058: 48b8415a535f4f50454e           movabs rax, 0x4e45504f5f535a41
00000001401a8062: 493300                         xor rax, qword ptr [r8]
00000001401a8065: 48b9454e4c4556454c53           movabs rcx, 0x534c4556454c4e45
00000001401a806f: 49334806                       xor rcx, qword ptr [r8 + 6]
00000001401a8073: 4809c1                         or rcx, rax
00000001401a8076: 0f85a1000000                   jne 0x1401a811d
00000001401a807c: 4c8945f8                       mov qword ptr [rbp - 8], r8
00000001401a8080: 48895df0                       mov qword ptr [rbp - 0x10], rbx
00000001401a8084: 488955e8                       mov qword ptr [rbp - 0x18], rdx
00000001401a8088: 488d0dc260d405                 lea rcx, [rip + 0x5d460c2]
00000001401a808f: ba09000000                     mov edx, 9
00000001401a8094: e8d7d56e05                     call 0x145895670
00000001401a8099: 90                             nop
00000001401a809a: 4989d0                         mov r8, rdx
00000001401a809d: 48c744242000000000             mov qword ptr [rsp + 0x20], 0
00000001401a80a6: 488d4dc8                       lea rcx, [rbp - 0x38]
00000001401a80aa: 41b908000000                   mov r9d, 8
00000001401a80b0: 4889c2                         mov rdx, rax
00000001401a80b3: e818da6e05                     call 0x145895ad0
00000001401a80b8: 90                             nop
00000001401a80b9: 488b45f0                       mov rax, qword ptr [rbp - 0x10]
00000001401a80bd: 488906                         mov qword ptr [rsi], rax
00000001401a80c0: 488b45f8                       mov rax, qword ptr [rbp - 8]
00000001401a80c4: 48894608                       mov qword ptr [rsi + 8], rax
00000001401a80c8: 48c746100e000000               mov qword ptr [rsi + 0x10], 0xe
00000001401a80d0: 0f1045c8                       movups xmm0, xmmword ptr [rbp - 0x38]
00000001401a80d4: 0f114618                       movups xmmword ptr [rsi + 0x18], xmm0
00000001401a80d8: 488b45d8                       mov rax, qword ptr [rbp - 0x28]
00000001401a80dc: 48894628                       mov qword ptr [rsi + 0x28], rax
00000001401a80e0: 488b45e8                       mov rax, qword ptr [rbp - 0x18]
00000001401a80e4: 488b5018                       mov rdx, qword ptr [rax + 0x18]
00000001401a80e8: 4885d2                         test rdx, rdx
00000001401a80eb: 7446                           je 0x1401a8133
00000001401a80ed: 488b4820                       mov rcx, qword ptr [rax + 0x20]
00000001401a80f1: 41b801000000                   mov r8d, 1
00000001401a80f7: e9a1000000                     jmp 0x1401a819d
00000001401a80fc: 48837a1803                     cmp qword ptr [rdx + 0x18], 3
00000001401a8101: 751a                           jne 0x1401a811d
00000001401a8103: 4c8b7210                       mov r14, qword ptr [rdx + 0x10]
00000001401a8107: 410fb706                       movzx eax, word ptr [r14]
00000001401a810b: 35415a0000                     xor eax, 0x5a41
00000001401a8110: 410fb64e02                     movzx ecx, byte ptr [r14 + 2]
00000001401a8115: 83f153                         xor ecx, 0x53
00000001401a8118: 6609c1                         or cx, ax
00000001401a811b: 7426                           je 0x1401a8143
00000001401a811d: 0f1002                         movups xmm0, xmmword ptr [rdx]
00000001401a8120: 0f104a10                       movups xmm1, xmmword ptr [rdx + 0x10]
00000001401a8124: 0f105220                       movups xmm2, xmmword ptr [rdx + 0x20]
00000001401a8128: 0f115620                       movups xmmword ptr [rsi + 0x20], xmm2
00000001401a812c: 0f114e10                       movups xmmword ptr [rsi + 0x10], xmm1
00000001401a8130: 0f1106                         movups xmmword ptr [rsi], xmm0
00000001401a8133: 4889f0                         mov rax, rsi
00000001401a8136: 4883c468                       add rsp, 0x68
00000001401a813a: 5b                             pop rbx
00000001401a813b: 5f                             pop rdi
00000001401a813c: 5e                             pop rsi
00000001401a813d: 415e                           pop r14
00000001401a813f: 415f                           pop r15
00000001401a8141: 5d                             pop rbp
00000001401a8142: c3                             ret
00000001401a8143: 4889d7                         mov rdi, rdx
00000001401a8146: 4c8b7a08                       mov r15, qword ptr [rdx + 8]
00000001401a814a: e8b1a0e5ff                     call 0x140002200
00000001401a814f: b911000000                     mov ecx, 0x11
00000001401a8154: ba01000000                     mov edx, 1
00000001401a8159: e862a0e5ff                     call 0x1400021c0
00000001401a815e: 4885c0                         test rax, rax
00000001401a8161: 7441                           je 0x1401a81a4
00000001401a8163: 0f1005d65fd405                 movups xmm0, xmmword ptr [rip + 0x5d45fd6]
00000001401a816a: 0f1100                         movups xmmword ptr [rax], xmm0
00000001401a816d: c6401073                       mov byte ptr [rax + 0x10], 0x73
00000001401a8171: 48c7460811000000               mov qword ptr [rsi + 8], 0x11
00000001401a8179: 48894610                       mov qword ptr [rsi + 0x10], rax
00000001401a817d: 48c7461811000000               mov qword ptr [rsi + 0x18], 0x11
00000001401a8185: 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
00000001401a818c: 4d85ff                         test r15, r15
00000001401a818f: 74a2                           je 0x1401a8133
00000001401a8191: 41b801000000                   mov r8d, 1
00000001401a8197: 4c89f1                         mov rcx, r14
00000001401a819a: 4c89fa                         mov rdx, r15
00000001401a819d: e82ea0e5ff                     call 0x1400021d0
00000001401a81a2: eb8f                           jmp 0x1401a8133
00000001401a81a4: 4c897df8                       mov qword ptr [rbp - 8], r15
00000001401a81a8: 4c8975e0                       mov qword ptr [rbp - 0x20], r14
00000001401a81ac: 48895df0                       mov qword ptr [rbp - 0x10], rbx
00000001401a81b0: 48897de8                       mov qword ptr [rbp - 0x18], rdi
00000001401a81b4: b901000000                     mov ecx, 1
00000001401a81b9: ba11000000                     mov edx, 0x11
00000001401a81be: e8c83bcf05                     call 0x145e9bd8b
00000001401a81c3: 90                             nop
00000001401a81c4: 0f0b                           ud2
