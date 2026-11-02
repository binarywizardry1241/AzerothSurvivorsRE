0000000145cc93a0 55                             push rbp
0000000145cc93a1 56                             push rsi
0000000145cc93a2 57                             push rdi
0000000145cc93a3 53                             push rbx
0000000145cc93a4 4883ec58                       sub rsp, 0x58
0000000145cc93a8 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145cc93ad 0f2975f0                       movaps xmmword ptr [rbp - 0x10], xmm6
0000000145cc93b1 48c745e8feffffff               mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
0000000145cc93b9 488b19                         mov rbx, qword ptr [rcx]
0000000145cc93bc b201                           mov dl, 1
0000000145cc93be 31c0                           xor eax, eax
0000000145cc93c0 f00fb05310                     lock cmpxchg byte ptr [rbx + 0x10], dl
0000000145cc93c5 0f8588000000                   jne 0x145cc9453
0000000145cc93cb 488b3596579902                 mov rsi, qword ptr [rip + 0x2995796]
0000000145cc93d2 488b06                         mov rax, qword ptr [rsi]
0000000145cc93d5 48d1e0                         shl rax, 1
0000000145cc93d8 4885c0                         test rax, rax
0000000145cc93db 0f8589000000                   jne 0x145cc946a
0000000145cc93e1 c745e400000000                 mov dword ptr [rbp - 0x1c], 0
0000000145cc93e8 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145cc93ec 488d8380010000                 lea rax, [rbx + 0x180]
0000000145cc93f3 4c8d8330010000                 lea r8, [rbx + 0x130]
0000000145cc93fa 4c8d8b50010000                 lea r9, [rbx + 0x150]
0000000145cc9401 48837b78ff                     cmp qword ptr [rbx + 0x78], -1
0000000145cc9406 48895dd8                       mov qword ptr [rbp - 0x28], rbx
0000000145cc940a 4c8d93a0010000                 lea r10, [rbx + 0x1a0]
0000000145cc9411 4c0f44c0                       cmove r8, rax
0000000145cc9415 8b5108                         mov edx, dword ptr [rcx + 8]
0000000145cc9418 498b4818                       mov rcx, qword ptr [r8 + 0x18]
0000000145cc941c 4d0f45d1                       cmovne r10, r9
0000000145cc9420 498b02                         mov rax, qword ptr [r10]
0000000145cc9423 ff5038                         call qword ptr [rax + 0x38]
0000000145cc9426 90                             nop 
0000000145cc9427 807de400                       cmp byte ptr [rbp - 0x1c], 0
0000000145cc942b 488b7dd8                       mov rdi, qword ptr [rbp - 0x28]
0000000145cc942f 750b                           jne 0x145cc943c
0000000145cc9431 488b0e                         mov rcx, qword ptr [rsi]
0000000145cc9434 48d1e1                         shl rcx, 1
0000000145cc9437 4885c9                         test rcx, rcx
0000000145cc943a 755b                           jne 0x145cc9497
0000000145cc943c 31c9                           xor ecx, ecx
0000000145cc943e 864f10                         xchg byte ptr [rdi + 0x10], cl
0000000145cc9441 80f902                         cmp cl, 2
0000000145cc9444 7439                           je 0x145cc947f
0000000145cc9446 0f2875f0                       movaps xmm6, xmmword ptr [rbp - 0x10]
0000000145cc944a 4883c458                       add rsp, 0x58
0000000145cc944e 5b                             pop rbx
0000000145cc944f 5f                             pop rdi
0000000145cc9450 5e                             pop rsi
0000000145cc9451 5d                             pop rbp
0000000145cc9452 c3                             ret 
0000000145cc9453 488d4310                       lea rax, [rbx + 0x10]
0000000145cc9457 4889ce                         mov rsi, rcx
0000000145cc945a 4889c1                         mov rcx, rax
0000000145cc945d e8aedb5300                     call 0x146207010
0000000145cc9462 4889f1                         mov rcx, rsi
0000000145cc9465 e961ffffff                     jmp 0x145cc93cb
0000000145cc946a 4889cf                         mov rdi, rcx
0000000145cc946d e82ee95300                     call 0x146207da0
0000000145cc9472 4889f9                         mov rcx, rdi
0000000145cc9475 3401                           xor al, 1
0000000145cc9477 8945e4                         mov dword ptr [rbp - 0x1c], eax
0000000145cc947a e969ffffff                     jmp 0x145cc93e8
0000000145cc947f 4883c710                       add rdi, 0x10
0000000145cc9483 4889f9                         mov rcx, rdi
0000000145cc9486 89c6                           mov esi, eax
0000000145cc9488 0f28f0                         movaps xmm6, xmm0
0000000145cc948b e840dc5300                     call 0x1462070d0
0000000145cc9490 0f28c6                         movaps xmm0, xmm6
0000000145cc9493 89f0                           mov eax, esi
0000000145cc9495 ebaf                           jmp 0x145cc9446
0000000145cc9497 89c6                           mov esi, eax
0000000145cc9499 0f28f0                         movaps xmm6, xmm0
0000000145cc949c e8ffe85300                     call 0x146207da0
0000000145cc94a1 0f28c6                         movaps xmm0, xmm6
0000000145cc94a4 89c1                           mov ecx, eax
0000000145cc94a6 89f0                           mov eax, esi
0000000145cc94a8 84c9                           test cl, cl
0000000145cc94aa 7590                           jne 0x145cc943c
0000000145cc94ac c6471101                       mov byte ptr [rdi + 0x11], 1
0000000145cc94b0 eb8a                           jmp 0x145cc943c
