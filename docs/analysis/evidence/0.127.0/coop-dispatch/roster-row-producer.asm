0000000145d07900 55                             push rbp
0000000145d07901 4157                           push r15
0000000145d07903 4156                           push r14
0000000145d07905 4155                           push r13
0000000145d07907 4154                           push r12
0000000145d07909 56                             push rsi
0000000145d0790a 57                             push rdi
0000000145d0790b 53                             push rbx
0000000145d0790c 4881ec48020000                 sub rsp, 0x248
0000000145d07913 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145d0791b 0f29b5b0010000                 movaps xmmword ptr [rbp + 0x1b0], xmm6
0000000145d07922 48c785a8010000feffffff         mov qword ptr [rbp + 0x1a8], 0xfffffffffffffffe
0000000145d0792d 4889d7                         mov rdi, rdx
0000000145d07930 4889ce                         mov rsi, rcx
0000000145d07933 488b1a                         mov rbx, qword ptr [rdx]
0000000145d07936 4883fbfe                       cmp rbx, -2
0000000145d0793a 750a                           jne 0x145d07946
0000000145d0793c 48c745a0ffffffff               mov qword ptr [rbp - 0x60], 0xffffffffffffffff
0000000145d07944 eb3f                           jmp 0x145d07985
0000000145d07946 488d5708                       lea rdx, [rdi + 8]
0000000145d0794a 488d4da8                       lea rcx, [rbp - 0x58]
0000000145d0794e 41b8b0000000                   mov r8d, 0xb0
0000000145d07954 e8c29d3500                     call 0x14606171b
0000000145d07959 31c0                           xor eax, eax
0000000145d0795b 48895da0                       mov qword ptr [rbp - 0x60], rbx
0000000145d0795f 4883fbff                       cmp rbx, -1
0000000145d07963 0f94c0                         sete al
0000000145d07966 48f7d0                         not rax
0000000145d07969 488907                         mov qword ptr [rdi], rax
0000000145d0796c 7417                           je 0x145d07985
0000000145d0796e 488d55a0                       lea rdx, [rbp - 0x60]
0000000145d07972 41b8b8000000                   mov r8d, 0xb8
0000000145d07978 4889f1                         mov rcx, rsi
0000000145d0797b e89b9d3500                     call 0x14606171b
0000000145d07980 e925010000                     jmp 0x145d07aaa
0000000145d07985 4c8bbfb8000000                 mov r15, qword ptr [rdi + 0xb8]
0000000145d0798c 4d85ff                         test r15, r15
0000000145d0798f 0f840e010000                   je 0x145d07aa3
0000000145d07995 488b87c0000000                 mov rax, qword ptr [rdi + 0xc0]
0000000145d0799c 4939c7                         cmp r15, rax
0000000145d0799f 0f84fe000000                   je 0x145d07aa3
0000000145d079a5 4981c7e8040000                 add r15, 0x4e8
0000000145d079ac eb15                           jmp 0x145d079c3
0000000145d079ae 6690                           nop 
0000000145d079b0 498d8fe8040000                 lea rcx, [r15 + 0x4e8]
0000000145d079b7 4939c7                         cmp r15, rax
0000000145d079ba 4989cf                         mov r15, rcx
0000000145d079bd 0f84d2000000                   je 0x145d07a95
0000000145d079c3 41807ffc01                     cmp byte ptr [r15 - 4], 1
0000000145d079c8 75e6                           jne 0x145d079b0
0000000145d079ca 4983bfa8fdffffff               cmp qword ptr [r15 - 0x258], -1
0000000145d079d2 74dc                           je 0x145d079b0
0000000145d079d4 4c89bfb8000000                 mov qword ptr [rdi + 0xb8], r15
0000000145d079db 498d97a8fdffff                 lea rdx, [r15 - 0x258]
0000000145d079e2 488b9fc8000000                 mov rbx, qword ptr [rdi + 0xc8]
0000000145d079e9 4c8bafd0000000                 mov r13, qword ptr [rdi + 0xd0]
0000000145d079f0 498bbf60ffffff                 mov rdi, qword ptr [r15 - 0xa0]
0000000145d079f7 488d8d88010000                 lea rcx, [rbp + 0x188]
0000000145d079fe e82dcf3200                     call 0x146034930
0000000145d07a03 90                             nop 
0000000145d07a04 450fb677bf                     movzx r14d, byte ptr [r15 - 0x41]
0000000145d07a09 450fb667c0                     movzx r12d, byte ptr [r15 - 0x40]
0000000145d07a0e 4983bf20feffffff               cmp qword ptr [r15 - 0x1e0], -1
0000000145d07a16 4488a5a7010000                 mov byte ptr [rbp + 0x1a7], r12b
0000000145d07a1d 0f84a2000000                   je 0x145d07ac5
0000000145d07a23 498d9720feffff                 lea rdx, [r15 - 0x1e0]
0000000145d07a2a 488d4d70                       lea rcx, [rbp + 0x70]
0000000145d07a2e e89d8fffff                     call 0x145d009d0
0000000145d07a33 90                             nop 
0000000145d07a34 0f1085d0000000                 movups xmm0, xmmword ptr [rbp + 0xd0]
0000000145d07a3b 0f298570010000                 movaps xmmword ptr [rbp + 0x170], xmm0
0000000145d07a42 0f1085c0000000                 movups xmm0, xmmword ptr [rbp + 0xc0]
0000000145d07a49 0f298560010000                 movaps xmmword ptr [rbp + 0x160], xmm0
0000000145d07a50 0f1085b0000000                 movups xmm0, xmmword ptr [rbp + 0xb0]
0000000145d07a57 0f298550010000                 movaps xmmword ptr [rbp + 0x150], xmm0
0000000145d07a5e 0f104570                       movups xmm0, xmmword ptr [rbp + 0x70]
0000000145d07a62 0f108d80000000                 movups xmm1, xmmword ptr [rbp + 0x80]
0000000145d07a69 0f109590000000                 movups xmm2, xmmword ptr [rbp + 0x90]
0000000145d07a70 0f109da0000000                 movups xmm3, xmmword ptr [rbp + 0xa0]
0000000145d07a77 0f299d40010000                 movaps xmmword ptr [rbp + 0x140], xmm3
0000000145d07a7e 0f299530010000                 movaps xmmword ptr [rbp + 0x130], xmm2
0000000145d07a85 0f298d20010000                 movaps xmmword ptr [rbp + 0x120], xmm1
0000000145d07a8c 0f298510010000                 movaps xmmword ptr [rbp + 0x110], xmm0
0000000145d07a93 eb3b                           jmp 0x145d07ad0
0000000145d07a95 4881c118fbffff                 add rcx, -0x4e8
0000000145d07a9c 48898fb8000000                 mov qword ptr [rdi + 0xb8], rcx
0000000145d07aa3 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145d07aaa 0f28b5b0010000                 movaps xmm6, xmmword ptr [rbp + 0x1b0]
0000000145d07ab1 4881c448020000                 add rsp, 0x248
0000000145d07ab8 5b                             pop rbx
0000000145d07ab9 5f                             pop rdi
0000000145d07aba 5e                             pop rsi
0000000145d07abb 415c                           pop r12
0000000145d07abd 415d                           pop r13
0000000145d07abf 415e                           pop r14
0000000145d07ac1 415f                           pop r15
0000000145d07ac3 5d                             pop rbp
0000000145d07ac4 c3                             ret 
0000000145d07ac5 48c78510010000ffffffff         mov qword ptr [rbp + 0x110], 0xffffffffffffffff
0000000145d07ad0 458b67b8                       mov r12d, dword ptr [r15 - 0x48]
0000000145d07ad4 488b1b                         mov rbx, qword ptr [rbx]
0000000145d07ad7 498b8dc0140000                 mov rcx, qword ptr [r13 + 0x14c0]
0000000145d07ade 498b95c8140000                 mov rdx, qword ptr [r13 + 0x14c8]
0000000145d07ae5 e816d8dfff                     call 0x145b05300
0000000145d07aea 498d8d08120000                 lea rcx, [r13 + 0x1208]
0000000145d07af1 410fb695d0140000               movzx edx, byte ptr [r13 + 0x14d0]
0000000145d07af9 4989c0                         mov r8, rax
0000000145d07afc e88f63e0ff                     call 0x145b0de90
0000000145d07b01 90                             nop 
0000000145d07b02 418b8dd8140000                 mov ecx, dword ptr [r13 + 0x14d8]
0000000145d07b09 0fb6c0                         movzx eax, al
0000000145d07b0c 38c8                           cmp al, cl
0000000145d07b0e 0f42c8                         cmovb ecx, eax
0000000145d07b11 80f905                         cmp cl, 5
0000000145d07b14 b805000000                     mov eax, 5
0000000145d07b19 0f42c1                         cmovb eax, ecx
0000000145d07b1c 410fb64fda                     movzx ecx, byte ptr [r15 - 0x26]
0000000145d07b21 4839cb                         cmp rbx, rcx
0000000145d07b24 7316                           jae 0x145d07b3c
0000000145d07b26 493b9fe8fdffff                 cmp rbx, qword ptr [r15 - 0x218]
0000000145d07b2d 7312                           jae 0x145d07b41
0000000145d07b2f 498b8fe0fdffff                 mov rcx, qword ptr [r15 - 0x220]
0000000145d07b36 0fb60c19                       movzx ecx, byte ptr [rcx + rbx]
0000000145d07b3a eb07                           jmp 0x145d07b43
0000000145d07b3c 4531ed                         xor r13d, r13d
0000000145d07b3f eb08                           jmp 0x145d07b49
0000000145d07b41 31c9                           xor ecx, ecx
0000000145d07b43 38c8                           cmp al, cl
0000000145d07b45 410f96c5                       setbe r13b
0000000145d07b49 f2410f1077f8                   movsd xmm6, qword ptr [r15 - 8]
0000000145d07b4f 498b57e0                       mov rdx, qword ptr [r15 - 0x20]
0000000145d07b53 498b47e8                       mov rax, qword ptr [r15 - 0x18]
0000000145d07b57 488d4d58                       lea rcx, [rbp + 0x58]
0000000145d07b5b ff5050                         call qword ptr [rax + 0x50]
0000000145d07b5e 90                             nop 
0000000145d07b5f 488b8598010000                 mov rax, qword ptr [rbp + 0x198]
0000000145d07b66 48898580000000                 mov qword ptr [rbp + 0x80], rax
0000000145d07b6d 0f108588010000                 movups xmm0, xmmword ptr [rbp + 0x188]
0000000145d07b74 0f294570                       movaps xmmword ptr [rbp + 0x70], xmm0
0000000145d07b78 0f288510010000                 movaps xmm0, xmmword ptr [rbp + 0x110]
0000000145d07b7f 0f288d20010000                 movaps xmm1, xmmword ptr [rbp + 0x120]
0000000145d07b86 0f289530010000                 movaps xmm2, xmmword ptr [rbp + 0x130]
0000000145d07b8d 0f289d40010000                 movaps xmm3, xmmword ptr [rbp + 0x140]
0000000145d07b94 0f2985a0000000                 movaps xmmword ptr [rbp + 0xa0], xmm0
0000000145d07b9b 0f298db0000000                 movaps xmmword ptr [rbp + 0xb0], xmm1
0000000145d07ba2 0f2995c0000000                 movaps xmmword ptr [rbp + 0xc0], xmm2
0000000145d07ba9 0f299dd0000000                 movaps xmmword ptr [rbp + 0xd0], xmm3
0000000145d07bb0 0f288550010000                 movaps xmm0, xmmword ptr [rbp + 0x150]
0000000145d07bb7 0f2985e0000000                 movaps xmmword ptr [rbp + 0xe0], xmm0
0000000145d07bbe 0f288560010000                 movaps xmm0, xmmword ptr [rbp + 0x160]
0000000145d07bc5 0f2985f0000000                 movaps xmmword ptr [rbp + 0xf0], xmm0
0000000145d07bcc 0f288570010000                 movaps xmm0, xmmword ptr [rbp + 0x170]
0000000145d07bd3 0f298500010000                 movaps xmmword ptr [rbp + 0x100], xmm0
0000000145d07bda 488b4568                       mov rax, qword ptr [rbp + 0x68]
0000000145d07bde 48898598000000                 mov qword ptr [rbp + 0x98], rax
0000000145d07be5 0f104558                       movups xmm0, xmmword ptr [rbp + 0x58]
0000000145d07be9 0f118588000000                 movups xmmword ptr [rbp + 0x88], xmm0
0000000145d07bf0 488d5570                       lea rdx, [rbp + 0x70]
0000000145d07bf4 41b8a0000000                   mov r8d, 0xa0
0000000145d07bfa 4889f1                         mov rcx, rsi
0000000145d07bfd e8199b3500                     call 0x14606171b
0000000145d07c02 4889bea0000000                 mov qword ptr [rsi + 0xa0], rdi
0000000145d07c09 f30f11b6a8000000               movss dword ptr [rsi + 0xa8], xmm6
0000000145d07c11 4489a6ac000000                 mov dword ptr [rsi + 0xac], r12d
0000000145d07c18 4488aeb0000000                 mov byte ptr [rsi + 0xb0], r13b
0000000145d07c1f 4488b6b1000000                 mov byte ptr [rsi + 0xb1], r14b
0000000145d07c26 0fb685a7010000                 movzx eax, byte ptr [rbp + 0x1a7]
0000000145d07c2d 8886b2000000                   mov byte ptr [rsi + 0xb2], al
0000000145d07c33 e972feffff                     jmp 0x145d07aaa
