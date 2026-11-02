0000000145bf2530 55                             push rbp
0000000145bf2531 4157                           push r15
0000000145bf2533 4156                           push r14
0000000145bf2535 4155                           push r13
0000000145bf2537 4154                           push r12
0000000145bf2539 56                             push rsi
0000000145bf253a 57                             push rdi
0000000145bf253b 53                             push rbx
0000000145bf253c 4881ec88000000                 sub rsp, 0x88
0000000145bf2543 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bf254b 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bf2553 4c89c3                         mov rbx, r8
0000000145bf2556 4889d7                         mov rdi, rdx
0000000145bf2559 4889ce                         mov rsi, rcx
0000000145bf255c c645e802                       mov byte ptr [rbp - 0x18], 2
0000000145bf2560 488d4da8                       lea rcx, [rbp - 0x58]
0000000145bf2564 4c8d4dc8                       lea r9, [rbp - 0x38]
0000000145bf2568 e8c3020000                     call 0x145bf2830
0000000145bf256d 0fb645a8                       movzx eax, byte ptr [rbp - 0x58]
0000000145bf2571 3cff                           cmp al, 0xff
0000000145bf2573 741e                           je 0x145bf2593
0000000145bf2575 0fb64da9                       movzx ecx, byte ptr [rbp - 0x57]
0000000145bf2579 0f1045b8                       movups xmm0, xmmword ptr [rbp - 0x48]
0000000145bf257d 0f114610                       movups xmmword ptr [rsi + 0x10], xmm0
0000000145bf2581 0f1045aa                       movups xmm0, xmmword ptr [rbp - 0x56]
0000000145bf2585 0f114602                       movups xmmword ptr [rsi + 2], xmm0
0000000145bf2589 8806                           mov byte ptr [rsi], al
0000000145bf258b 884e01                         mov byte ptr [rsi + 1], cl
0000000145bf258e e921020000                     jmp 0x145bf27b4
0000000145bf2593 4c8b7f50                       mov r15, qword ptr [rdi + 0x50]
0000000145bf2597 4d85ff                         test r15, r15
0000000145bf259a 7471                           je 0x145bf260d
0000000145bf259c 4c8b7748                       mov r14, qword ptr [rdi + 0x48]
0000000145bf25a0 4889d9                         mov rcx, rbx
0000000145bf25a3 4c89f2                         mov rdx, r14
0000000145bf25a6 4d89f8                         mov r8, r15
0000000145bf25a9 e8f2150100                     call 0x145c03ba0
0000000145bf25ae a801                           test al, 1
0000000145bf25b0 0f85dc000000                   jne 0x145bf2692
0000000145bf25b6 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145bf25c0 4885d2                         test rdx, rdx
0000000145bf25c3 0f84b2000000                   je 0x145bf267b
0000000145bf25c9 4d89fc                         mov r12, r15
0000000145bf25cc 4929d4                         sub r12, rdx
0000000145bf25cf 0f8207020000                   jb 0x145bf27dc
0000000145bf25d5 48c7475000000000               mov qword ptr [rdi + 0x50], 0
0000000145bf25dd 742e                           je 0x145bf260d
0000000145bf25df 4c01f2                         add rdx, r14
0000000145bf25e2 4c89f1                         mov rcx, r14
0000000145bf25e5 4d89e0                         mov r8, r12
0000000145bf25e8 e84a883b00                     call 0x145faae37
0000000145bf25ed 4c896750                       mov qword ptr [rdi + 0x50], r12
0000000145bf25f1 4889d9                         mov rcx, rbx
0000000145bf25f4 4c89f2                         mov rdx, r14
0000000145bf25f7 4d89e0                         mov r8, r12
0000000145bf25fa e8a1150100                     call 0x145c03ba0
0000000145bf25ff 4d89e7                         mov r15, r12
0000000145bf2602 4883f801                       cmp rax, 1
0000000145bf2606 75b8                           jne 0x145bf25c0
0000000145bf2608 e985000000                     jmp 0x145bf2692
0000000145bf260d 833b02                         cmp dword ptr [rbx], 2
0000000145bf2610 750f                           jne 0x145bf2621
0000000145bf2612 c687f900000000                 mov byte ptr [rdi + 0xf9], 0
0000000145bf2619 c606ff                         mov byte ptr [rsi], 0xff
0000000145bf261c e993010000                     jmp 0x145bf27b4
0000000145bf2621 4c8db320040000                 lea r14, [rbx + 0x420]
0000000145bf2628 80bb3603000001                 cmp byte ptr [rbx + 0x336], 1
0000000145bf262f 7509                           jne 0x145bf263a
0000000145bf2631 f6833703000001                 test byte ptr [rbx + 0x337], 1
0000000145bf2638 7515                           jne 0x145bf264f
0000000145bf263a 488d4dc8                       lea rcx, [rbp - 0x38]
0000000145bf263e 4889da                         mov rdx, rbx
0000000145bf2641 4d89f0                         mov r8, r14
0000000145bf2644 e8c7a2ecff                     call 0x145abc910
0000000145bf2649 807dc800                       cmp byte ptr [rbp - 0x38], 0
0000000145bf264d 7523                           jne 0x145bf2672
0000000145bf264f 4883bbb000000000               cmp qword ptr [rbx + 0xb0], 0
0000000145bf2657 0f842c010000                   je 0x145bf2789
0000000145bf265d 488d4dc8                       lea rcx, [rbp - 0x38]
0000000145bf2661 4889da                         mov rdx, rbx
0000000145bf2664 4d89f0                         mov r8, r14
0000000145bf2667 e8a4a2ecff                     call 0x145abc910
0000000145bf266c 837dc801                       cmp dword ptr [rbp - 0x38], 1
0000000145bf2670 752c                           jne 0x145bf269e
0000000145bf2672 4c8b7dd0                       mov r15, qword ptr [rbp - 0x30]
0000000145bf2676 e932010000                     jmp 0x145bf27ad
0000000145bf267b 488d157e5c6d01                 lea rdx, [rip + 0x16d5c7e]
0000000145bf2682 41b81e000000                   mov r8d, 0x1e
0000000145bf2688 b103                           mov cl, 3
0000000145bf268a e8a1c13500                     call 0x145f4e830
0000000145bf268f 4889c2                         mov rdx, rax
0000000145bf2692 c60602                         mov byte ptr [rsi], 2
0000000145bf2695 48895608                       mov qword ptr [rsi + 8], rdx
0000000145bf2699 e916010000                     jmp 0x145bf27b4
0000000145bf269e 4883bbb000000000               cmp qword ptr [rbx + 0xb0], 0
0000000145bf26a6 0f84dd000000                   je 0x145bf2789
0000000145bf26ac 4c8da388000000                 lea r12, [rbx + 0x88]
0000000145bf26b3 4c8d2de6d7a001                 lea r13, [rip + 0x1a0d7e6]
0000000145bf26ba eb1b                           jmp 0x145bf26d7
0000000145bf26bc 4d89ec                         mov r12, r13
0000000145bf26bf 4d89f5                         mov r13, r14
0000000145bf26c2 4c8db320040000                 lea r14, [rbx + 0x420]
0000000145bf26c9 4883bbb000000000               cmp qword ptr [rbx + 0xb0], 0
0000000145bf26d1 0f84b2000000                   je 0x145bf2789
0000000145bf26d7 4c89e1                         mov rcx, r12
0000000145bf26da 4c89f2                         mov rdx, r14
0000000145bf26dd 4d89e8                         mov r8, r13
0000000145bf26e0 e88bd61300                     call 0x145d2fd70
0000000145bf26e5 4989d7                         mov r15, rdx
0000000145bf26e8 488945a8                       mov qword ptr [rbp - 0x58], rax
0000000145bf26ec 488955b0                       mov qword ptr [rbp - 0x50], rdx
0000000145bf26f0 4883f801                       cmp rax, 1
0000000145bf26f4 7524                           jne 0x145bf271a
0000000145bf26f6 4d89ee                         mov r14, r13
0000000145bf26f9 4d89e5                         mov r13, r12
0000000145bf26fc 4589fc                         mov r12d, r15d
0000000145bf26ff 4183e403                       and r12d, 3
0000000145bf2703 488d0db2f4a001                 lea rcx, [rip + 0x1a0f4b2]
0000000145bf270a 4a6304a1                       movsxd rax, dword ptr [rcx + r12*4]
0000000145bf270e 4801c8                         add rax, rcx
0000000145bf2711 ffe0                           jmp rax
0000000145bf2713 410fb64710                     movzx eax, byte ptr [r15 + 0x10]
0000000145bf2718 eb36                           jmp 0x145bf2750
0000000145bf271a 4d85ff                         test r15, r15
0000000145bf271d 75aa                           jne 0x145bf26c9
0000000145bf271f e9a4000000                     jmp 0x145bf27c8
0000000145bf2724 c645ff01                       mov byte ptr [rbp - 1], 1
0000000145bf2728 e8a3403900                     call 0x145f867d0
0000000145bf272d 90                             nop
0000000145bf272e 4c89f9                         mov rcx, r15
0000000145bf2731 48c1e920                       shr rcx, 0x20
0000000145bf2735 488b4008                       mov rax, qword ptr [rax + 8]
0000000145bf2739 c645ff01                       mov byte ptr [rbp - 1], 1
0000000145bf273d ffd0                           call rax
0000000145bf273f 90                             nop
0000000145bf2740 eb0e                           jmp 0x145bf2750
0000000145bf2742 4c89f8                         mov rax, r15
0000000145bf2745 48c1e820                       shr rax, 0x20
0000000145bf2749 eb05                           jmp 0x145bf2750
0000000145bf274b 410fb6471f                     movzx eax, byte ptr [r15 + 0x1f]
0000000145bf2750 3c23                           cmp al, 0x23
0000000145bf2752 7550                           jne 0x145bf27a4
0000000145bf2754 418d4424fe                     lea eax, [r12 - 2]
0000000145bf2759 83f802                         cmp eax, 2
0000000145bf275c 0f825affffff                   jb 0x145bf26bc
0000000145bf2762 4d85e4                         test r12, r12
0000000145bf2765 0f8451ffffff                   je 0x145bf26bc
0000000145bf276b 49ffcf                         dec r15
0000000145bf276e 4c897dd0                       mov qword ptr [rbp - 0x30], r15
0000000145bf2772 c645c803                       mov byte ptr [rbp - 0x38], 3
0000000145bf2776 c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bf277a 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145bf277e e88ddd3900                     call 0x145f90510
0000000145bf2783 90                             nop
0000000145bf2784 e933ffffff                     jmp 0x145bf26bc
0000000145bf2789 48895dc8                       mov qword ptr [rbp - 0x38], rbx
0000000145bf278d 488d059cc2a001                 lea rax, [rip + 0x1a0c29c]
0000000145bf2794 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145bf2798 488d4dc8                       lea rcx, [rbp - 0x38]
0000000145bf279c e89f9187fa                     call 0x14046b940
0000000145bf27a1 4989c7                         mov r15, rax
0000000145bf27a4 4d85ff                         test r15, r15
0000000145bf27a7 0f8465feffff                   je 0x145bf2612
0000000145bf27ad c60602                         mov byte ptr [rsi], 2
0000000145bf27b0 4c897e08                       mov qword ptr [rsi + 8], r15
0000000145bf27b4 4881c488000000                 add rsp, 0x88
0000000145bf27bb 5b                             pop rbx
0000000145bf27bc 5f                             pop rdi
0000000145bf27bd 5e                             pop rsi
0000000145bf27be 415c                           pop r12
0000000145bf27c0 415d                           pop r13
0000000145bf27c2 415e                           pop r14
0000000145bf27c4 415f                           pop r15
0000000145bf27c6 5d                             pop rbp
0000000145bf27c7 c3                             ret
0000000145bf27c8 49bf0300000017000000           movabs r15, 0x1700000003
0000000145bf27d2 4d85ff                         test r15, r15
0000000145bf27d5 75d6                           jne 0x145bf27ad
0000000145bf27d7 e936feffff                     jmp 0x145bf2612
0000000145bf27dc 4c8d0d15d86f01                 lea r9, [rip + 0x16fd815]
0000000145bf27e3 31c9                           xor ecx, ecx
0000000145bf27e5 4d89f8                         mov r8, r15
0000000145bf27e8 e863fe5500                     call 0x146152650
0000000145bf27ed 0f0b                           ud2
