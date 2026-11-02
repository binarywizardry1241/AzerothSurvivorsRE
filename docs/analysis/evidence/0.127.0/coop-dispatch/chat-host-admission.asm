0000000145bd7620 55                             push rbp
0000000145bd7621 4157                           push r15
0000000145bd7623 4156                           push r14
0000000145bd7625 4155                           push r13
0000000145bd7627 4154                           push r12
0000000145bd7629 56                             push rsi
0000000145bd762a 57                             push rdi
0000000145bd762b 53                             push rbx
0000000145bd762c 4881ec98000000                 sub rsp, 0x98
0000000145bd7633 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd763b 660f297500                     movapd xmmword ptr [rbp], xmm6
0000000145bd7640 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145bd7648 4889d7                         mov rdi, rdx
0000000145bd764b 4889ce                         mov rsi, rcx
0000000145bd764e 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145bd7652 4c89c2                         mov rdx, r8
0000000145bd7655 4d89c8                         mov r8, r9
0000000145bd7658 e813c6f7ff                     call 0x145b53c70
0000000145bd765d 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145bd7661 4d85f6                         test r14, r14
0000000145bd7664 0f84a7010000                   je 0x145bd7811
0000000145bd766a 488b86980d0000                 mov rax, qword ptr [rsi + 0xd98]
0000000145bd7671 4889c2                         mov rdx, rax
0000000145bd7674 4883ea02                       sub rdx, 2
0000000145bd7678 b902000000                     mov ecx, 2
0000000145bd767d 480f43ca                       cmovae rcx, rdx
0000000145bd7681 4885c9                         test rcx, rcx
0000000145bd7684 0f8487010000                   je 0x145bd7811
0000000145bd768a 4883f901                       cmp rcx, 1
0000000145bd768e 7511                           jne 0x145bd76a1
0000000145bd7690 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145bd7694 0f94c1                         sete cl
0000000145bd7697 83f803                         cmp eax, 3
0000000145bd769a 7433                           je 0x145bd76cf
0000000145bd769c e970010000                     jmp 0x145bd7811
0000000145bd76a1 80bebc11000001                 cmp byte ptr [rsi + 0x11bc], 1
0000000145bd76a8 0f8563010000                   jne 0x145bd7811
0000000145bd76ae 4883be9011000000               cmp qword ptr [rsi + 0x1190], 0
0000000145bd76b6 0f8555010000                   jne 0x145bd7811
0000000145bd76bc 0fb68ebd110000                 movzx ecx, byte ptr [rsi + 0x11bd]
0000000145bd76c3 80f101                         xor cl, 1
0000000145bd76c6 83f803                         cmp eax, 3
0000000145bd76c9 0f8542010000                   jne 0x145bd7811
0000000145bd76cf 84c9                           test cl, cl
0000000145bd76d1 0f843a010000                   je 0x145bd7811
0000000145bd76d7 488b96d80d0000                 mov rdx, qword ptr [rsi + 0xdd8]
0000000145bd76de 4839d7                         cmp rdi, rdx
0000000145bd76e1 0f8302020000                   jae 0x145bd78e9
0000000145bd76e7 488b86d00d0000                 mov rax, qword ptr [rsi + 0xdd0]
0000000145bd76ee 4869cfe8040000                 imul rcx, rdi, 0x4e8
0000000145bd76f5 4883bc0890020000ff             cmp qword ptr [rax + rcx + 0x290], -1
0000000145bd76fe 0f840d010000                   je 0x145bd7811
0000000145bd7704 f20f10b6280e0000               movsd xmm6, qword ptr [rsi + 0xe28]
0000000145bd770c 4c8d3c08                       lea r15, [rax + rcx]
0000000145bd7710 488d1408                       lea rdx, [rax + rcx]
0000000145bd7714 4881c290020000                 add rdx, 0x290
0000000145bd771b 498bbf48040000                 mov rdi, qword ptr [r15 + 0x448]
0000000145bd7722 488d4db8                       lea rcx, [rbp - 0x48]
0000000145bd7726 e805d24500                     call 0x146034930
0000000145bd772b 90                             nop 
0000000145bd772c 450fb6a7a7040000               movzx r12d, byte ptr [r15 + 0x4a7]
0000000145bd7734 488b55b8                       mov rdx, qword ptr [rbp - 0x48]
0000000145bd7738 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145bd773c 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145bd7740 488b5dc8                       mov rbx, qword ptr [rbp - 0x38]
0000000145bd7744 4d8baf70020000                 mov r13, qword ptr [r15 + 0x270]
0000000145bd774b 4d85ed                         test r13, r13
0000000145bd774e 7453                           je 0x145bd77a3
0000000145bd7750 498b8f68020000                 mov rcx, qword ptr [r15 + 0x268]
0000000145bd7757 31c0                           xor eax, eax
0000000145bd7759 f20f100587807e00               movsd xmm0, qword ptr [rip + 0x7e8087]
0000000145bd7761 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145bd7770 660f28ce                       movapd xmm1, xmm6
0000000145bd7774 f20f5c0cc1                     subsd xmm1, qword ptr [rcx + rax*8]
0000000145bd7779 660f2ec1                       ucomisd xmm0, xmm1
0000000145bd777d 0f86be000000                   jbe 0x145bd7841
0000000145bd7783 48ffc0                         inc rax
0000000145bd7786 4939c5                         cmp r13, rax
0000000145bd7789 75e5                           jne 0x145bd7770
0000000145bd778b 4983fd03                       cmp r13, 3
0000000145bd778f 776c                           ja 0x145bd77fd
0000000145bd7791 488955f0                       mov qword ptr [rbp - 0x10], rdx
0000000145bd7795 498d8f60020000                 lea rcx, [r15 + 0x260]
0000000145bd779c 4c3b29                         cmp r13, qword ptr [rcx]
0000000145bd779f 7415                           je 0x145bd77b6
0000000145bd77a1 eb19                           jmp 0x145bd77bc
0000000145bd77a3 4531ed                         xor r13d, r13d
0000000145bd77a6 488955f0                       mov qword ptr [rbp - 0x10], rdx
0000000145bd77aa 498d8f60020000                 lea rcx, [r15 + 0x260]
0000000145bd77b1 4c3b29                         cmp r13, qword ptr [rcx]
0000000145bd77b4 7506                           jne 0x145bd77bc
0000000145bd77b6 e8f5a44800                     call 0x146061cb0
0000000145bd77bb 90                             nop 
0000000145bd77bc 498b8768020000                 mov rax, qword ptr [r15 + 0x268]
0000000145bd77c3 f2420f1134e8                   movsd qword ptr [rax + r13*8], xmm6
0000000145bd77c9 49ffc5                         inc r13
0000000145bd77cc 4d89af70020000                 mov qword ptr [r15 + 0x270], r13
0000000145bd77d3 488b45d8                       mov rax, qword ptr [rbp - 0x28]
0000000145bd77d7 4c89742430                     mov qword ptr [rsp + 0x30], r14
0000000145bd77dc 4889442428                     mov qword ptr [rsp + 0x28], rax
0000000145bd77e1 4488642420                     mov byte ptr [rsp + 0x20], r12b
0000000145bd77e6 4889f1                         mov rcx, rsi
0000000145bd77e9 4889fa                         mov rdx, rdi
0000000145bd77ec 4c8b45e8                       mov r8, qword ptr [rbp - 0x18]
0000000145bd77f0 4989d9                         mov r9, rbx
0000000145bd77f3 e8b8b5ffff                     call 0x145bd2db0
0000000145bd77f8 90                             nop 
0000000145bd77f9 488b55f0                       mov rdx, qword ptr [rbp - 0x10]
0000000145bd77fd 4885d2                         test rdx, rdx
0000000145bd7800 740f                           je 0x145bd7811
0000000145bd7802 41b801000000                   mov r8d, 1
0000000145bd7808 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145bd780c e8bfa942fa                     call 0x1400021d0
0000000145bd7811 488b55d0                       mov rdx, qword ptr [rbp - 0x30]
0000000145bd7815 4885d2                         test rdx, rdx
0000000145bd7818 740f                           je 0x145bd7829
0000000145bd781a 488b4dd8                       mov rcx, qword ptr [rbp - 0x28]
0000000145bd781e 41b801000000                   mov r8d, 1
0000000145bd7824 e8a7a942fa                     call 0x1400021d0
0000000145bd7829 0f287500                       movaps xmm6, xmmword ptr [rbp]
0000000145bd782d 4881c498000000                 add rsp, 0x98
0000000145bd7834 5b                             pop rbx
0000000145bd7835 5f                             pop rdi
0000000145bd7836 5e                             pop rsi
0000000145bd7837 415c                           pop r12
0000000145bd7839 415d                           pop r13
0000000145bd783b 415e                           pop r14
0000000145bd783d 415f                           pop r15
0000000145bd783f 5d                             pop rbp
0000000145bd7840 c3                             ret 
0000000145bd7841 4c8d5801                       lea r11, [rax + 1]
0000000145bd7845 4d39eb                         cmp r11, r13
0000000145bd7848 733d                           jae 0x145bd7887
0000000145bd784a 4d8d45fe                       lea r8, [r13 - 2]
0000000145bd784e 468d1428                       lea r10d, [rax + r13]
0000000145bd7852 4989c1                         mov r9, rax
0000000145bd7855 41f6c201                       test r10b, 1
0000000145bd7859 7524                           jne 0x145bd787f
0000000145bd785b f20f104cc108                   movsd xmm1, qword ptr [rcx + rax*8 + 8]
0000000145bd7861 660f28d6                       movapd xmm2, xmm6
0000000145bd7865 f20f5cd1                       subsd xmm2, xmm1
0000000145bd7869 660f2ec2                       ucomisd xmm0, xmm2
0000000145bd786d 4989c1                         mov r9, rax
0000000145bd7870 7609                           jbe 0x145bd787b
0000000145bd7872 f20f110cc1                     movsd qword ptr [rcx + rax*8], xmm1
0000000145bd7877 4c8d4801                       lea r9, [rax + 1]
0000000145bd787b 4c8d5802                       lea r11, [rax + 2]
0000000145bd787f 4939c0                         cmp r8, rax
0000000145bd7882 4c89c8                         mov rax, r9
0000000145bd7885 7519                           jne 0x145bd78a0
0000000145bd7887 49898770020000                 mov qword ptr [r15 + 0x270], rax
0000000145bd788e 4989c5                         mov r13, rax
0000000145bd7891 4983fd03                       cmp r13, 3
0000000145bd7895 0f86f6feffff                   jbe 0x145bd7791
0000000145bd789b e95dffffff                     jmp 0x145bd77fd
0000000145bd78a0 4c89c8                         mov rax, r9
0000000145bd78a3 eb09                           jmp 0x145bd78ae
0000000145bd78a5 4983c302                       add r11, 2
0000000145bd78a9 4d39dd                         cmp r13, r11
0000000145bd78ac 74d9                           je 0x145bd7887
0000000145bd78ae f2420f100cd9                   movsd xmm1, qword ptr [rcx + r11*8]
0000000145bd78b4 660f28d6                       movapd xmm2, xmm6
0000000145bd78b8 f20f5cd1                       subsd xmm2, xmm1
0000000145bd78bc 660f2ec2                       ucomisd xmm0, xmm2
0000000145bd78c0 7608                           jbe 0x145bd78ca
0000000145bd78c2 f20f110cc1                     movsd qword ptr [rcx + rax*8], xmm1
0000000145bd78c7 48ffc0                         inc rax
0000000145bd78ca f2420f104cd908                 movsd xmm1, qword ptr [rcx + r11*8 + 8]
0000000145bd78d1 660f28d6                       movapd xmm2, xmm6
0000000145bd78d5 f20f5cd1                       subsd xmm2, xmm1
0000000145bd78d9 660f2ec2                       ucomisd xmm0, xmm2
0000000145bd78dd 76c6                           jbe 0x145bd78a5
0000000145bd78df f20f110cc1                     movsd qword ptr [rcx + rax*8], xmm1
0000000145bd78e4 48ffc0                         inc rax
0000000145bd78e7 ebbc                           jmp 0x145bd78a5
0000000145bd78e9 4c8d0560c54a01                 lea r8, [rip + 0x14ac560]
0000000145bd78f0 4889f9                         mov rcx, rdi
0000000145bd78f3 e80b146300                     call 0x146208d03
0000000145bd78f8 90                             nop 
0000000145bd78f9 0f0b                           ud2 
