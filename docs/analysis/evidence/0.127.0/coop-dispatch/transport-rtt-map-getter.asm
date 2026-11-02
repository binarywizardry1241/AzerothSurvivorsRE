0000000145b9e4b0 4157                           push r15
0000000145b9e4b2 4156                           push r14
0000000145b9e4b4 56                             push rsi
0000000145b9e4b5 57                             push rdi
0000000145b9e4b6 55                             push rbp
0000000145b9e4b7 53                             push rbx
0000000145b9e4b8 4883ec48                       sub rsp, 0x48
0000000145b9e4bc 660f7f742430                   movdqa xmmword ptr [rsp + 0x30], xmm6
0000000145b9e4c2 89d7                           mov edi, edx
0000000145b9e4c4 8954242c                       mov dword ptr [rsp + 0x2c], edx
0000000145b9e4c8 488b31                         mov rsi, qword ptr [rcx]
0000000145b9e4cb b101                           mov cl, 1
0000000145b9e4cd 31c0                           xor eax, eax
0000000145b9e4cf f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145b9e4d4 0f85e8000000                   jne 0x145b9e5c2
0000000145b9e4da 4c8b358706ac02                 mov r14, qword ptr [rip + 0x2ac0687]
0000000145b9e4e1 498b06                         mov rax, qword ptr [r14]
0000000145b9e4e4 48d1e0                         shl rax, 1
0000000145b9e4e7 31ed                           xor ebp, ebp
0000000145b9e4e9 bb00000000                     mov ebx, 0
0000000145b9e4ee 4885c0                         test rax, rax
0000000145b9e4f1 0f85d9000000                   jne 0x145b9e5d0
0000000145b9e4f7 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145b9e4fb 48837e3000                     cmp qword ptr [rsi + 0x30], 0
0000000145b9e500 0f84e3000000                   je 0x145b9e5e9
0000000145b9e506 488d4e38                       lea rcx, [rsi + 0x38]
0000000145b9e50a 488d54242c                     lea rdx, [rsp + 0x2c]
0000000145b9e50f e82cd72dfb                     call 0x140e7bc40
0000000145b9e514 4989c0                         mov r8, rax
0000000145b9e517 49c1e839                       shr r8, 0x39
0000000145b9e51b 488b4e18                       mov rcx, qword ptr [rsi + 0x18]
0000000145b9e51f 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145b9e523 66410f6ec0                     movd xmm0, r8d
0000000145b9e528 660f60c0                       punpcklbw xmm0, xmm0
0000000145b9e52c f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145b9e531 660f70c844                     pshufd xmm1, xmm0, 0x44
0000000145b9e536 4531c0                         xor r8d, r8d
0000000145b9e539 660f76d2                       pcmpeqd xmm2, xmm2
0000000145b9e53d 4821d0                         and rax, rdx
0000000145b9e540 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145b9e545 660f6fd8                       movdqa xmm3, xmm0
0000000145b9e549 660f74d9                       pcmpeqb xmm3, xmm1
0000000145b9e54d 66440fd7cb                     pmovmskb r9d, xmm3
0000000145b9e552 4585c9                         test r9d, r9d
0000000145b9e555 7439                           je 0x145b9e590
0000000145b9e557 f3450fbcd1                     tzcnt r10d, r9d
0000000145b9e55c 4901c2                         add r10, rax
0000000145b9e55f 4921d2                         and r10, rdx
0000000145b9e562 4e8d1cd500000000               lea r11, [r10*8]
0000000145b9e56a 4989cf                         mov r15, rcx
0000000145b9e56d 4d29df                         sub r15, r11
0000000145b9e570 413b7ff8                       cmp edi, dword ptr [r15 - 8]
0000000145b9e574 7437                           je 0x145b9e5ad
0000000145b9e576 458d51ff                       lea r10d, [r9 - 1]
0000000145b9e57a 664521ca                       and r10w, r9w
0000000145b9e57e 4589d1                         mov r9d, r10d
0000000145b9e581 75d4                           jne 0x145b9e557
0000000145b9e583 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145b9e590 660f74c2                       pcmpeqb xmm0, xmm2
0000000145b9e594 66440fd7c8                     pmovmskb r9d, xmm0
0000000145b9e599 31ed                           xor ebp, ebp
0000000145b9e59b 4585c9                         test r9d, r9d
0000000145b9e59e 751c                           jne 0x145b9e5bc
0000000145b9e5a0 4c01c0                         add rax, r8
0000000145b9e5a3 4883c010                       add rax, 0x10
0000000145b9e5a7 4983c010                       add r8, 0x10
0000000145b9e5ab eb90                           jmp 0x145b9e53d
0000000145b9e5ad 49f7da                         neg r10
0000000145b9e5b0 f3420f1044d1fc                 movss xmm0, dword ptr [rcx + r10*8 - 4]
0000000145b9e5b7 bd01000000                     mov ebp, 1
0000000145b9e5bc 84db                           test bl, bl
0000000145b9e5be 742d                           je 0x145b9e5ed
0000000145b9e5c0 eb36                           jmp 0x145b9e5f8
0000000145b9e5c2 488d4e10                       lea rcx, [rsi + 0x10]
0000000145b9e5c6 e8458a6600                     call 0x146207010
0000000145b9e5cb e90affffff                     jmp 0x145b9e4da
0000000145b9e5d0 e8cb976600                     call 0x146207da0
0000000145b9e5d5 89c3                           mov ebx, eax
0000000145b9e5d7 80f301                         xor bl, 1
0000000145b9e5da 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145b9e5de 48837e3000                     cmp qword ptr [rsi + 0x30], 0
0000000145b9e5e3 0f851dffffff                   jne 0x145b9e506
0000000145b9e5e9 84db                           test bl, bl
0000000145b9e5eb 750b                           jne 0x145b9e5f8
0000000145b9e5ed 498b06                         mov rax, qword ptr [r14]
0000000145b9e5f0 48d1e0                         shl rax, 1
0000000145b9e5f3 4885c0                         test rax, rax
0000000145b9e5f6 7533                           jne 0x145b9e62b
0000000145b9e5f8 31c0                           xor eax, eax
0000000145b9e5fa 864610                         xchg byte ptr [rsi + 0x10], al
0000000145b9e5fd 3c02                           cmp al, 2
0000000145b9e5ff 7414                           je 0x145b9e615
0000000145b9e601 89e8                           mov eax, ebp
0000000145b9e603 0f28742430                     movaps xmm6, xmmword ptr [rsp + 0x30]
0000000145b9e608 4883c448                       add rsp, 0x48
0000000145b9e60c 5b                             pop rbx
0000000145b9e60d 5d                             pop rbp
0000000145b9e60e 5f                             pop rdi
0000000145b9e60f 5e                             pop rsi
0000000145b9e610 415e                           pop r14
0000000145b9e612 415f                           pop r15
0000000145b9e614 c3                             ret 
0000000145b9e615 4883c610                       add rsi, 0x10
0000000145b9e619 4889f1                         mov rcx, rsi
0000000145b9e61c 660f6ff0                       movdqa xmm6, xmm0
0000000145b9e620 e8ab8a6600                     call 0x1462070d0
0000000145b9e625 660f6fc6                       movdqa xmm0, xmm6
0000000145b9e629 ebd6                           jmp 0x145b9e601
0000000145b9e62b 660f6ff0                       movdqa xmm6, xmm0
0000000145b9e62f e86c976600                     call 0x146207da0
0000000145b9e634 660f6fc6                       movdqa xmm0, xmm6
0000000145b9e638 84c0                           test al, al
0000000145b9e63a 75bc                           jne 0x145b9e5f8
0000000145b9e63c c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145b9e640 ebb6                           jmp 0x145b9e5f8
