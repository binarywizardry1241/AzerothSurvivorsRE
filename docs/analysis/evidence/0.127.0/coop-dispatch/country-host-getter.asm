0000000145cc8fa0 55                             push rbp
0000000145cc8fa1 4156                           push r14
0000000145cc8fa3 56                             push rsi
0000000145cc8fa4 57                             push rdi
0000000145cc8fa5 53                             push rbx
0000000145cc8fa6 4883ec50                       sub rsp, 0x50
0000000145cc8faa 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145cc8faf 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145cc8fb7 4889ce                         mov rsi, rcx
0000000145cc8fba 488b1a                         mov rbx, qword ptr [rdx]
0000000145cc8fbd b101                           mov cl, 1
0000000145cc8fbf 31c0                           xor eax, eax
0000000145cc8fc1 f00fb04b10                     lock cmpxchg byte ptr [rbx + 0x10], cl
0000000145cc8fc6 0f8501010000                   jne 0x145cc90cd
0000000145cc8fcc 488b3d955b9902                 mov rdi, qword ptr [rip + 0x2995b95]
0000000145cc8fd3 488b07                         mov rax, qword ptr [rdi]
0000000145cc8fd6 48d1e0                         shl rax, 1
0000000145cc8fd9 4885c0                         test rax, rax
0000000145cc8fdc 0f85f9000000                   jne 0x145cc90db
0000000145cc8fe2 4531f6                         xor r14d, r14d
0000000145cc8fe5 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145cc8fe9 4883bbf801000000               cmp qword ptr [rbx + 0x1f8], 0
0000000145cc8ff1 0f8402010000                   je 0x145cc90f9
0000000145cc8ff7 488d8b00020000                 lea rcx, [rbx + 0x200]
0000000145cc8ffe 488d1543d27101                 lea rdx, [rip + 0x171d243]
0000000145cc9005 e8362c1bfb                     call 0x140e7bc40
0000000145cc900a 4889c2                         mov rdx, rax
0000000145cc900d 48c1ea39                       shr rdx, 0x39
0000000145cc9011 488b8be0010000                 mov rcx, qword ptr [rbx + 0x1e0]
0000000145cc9018 4c8b83e8010000                 mov r8, qword ptr [rbx + 0x1e8]
0000000145cc901f 660f6ec2                       movd xmm0, edx
0000000145cc9023 660f60c0                       punpcklbw xmm0, xmm0
0000000145cc9027 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145cc902c 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145cc9031 4531c9                         xor r9d, r9d
0000000145cc9034 660f76c9                       pcmpeqd xmm1, xmm1
0000000145cc9038 4c21c0                         and rax, r8
0000000145cc903b f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145cc9040 660f6fda                       movdqa xmm3, xmm2
0000000145cc9044 660f74d8                       pcmpeqb xmm3, xmm0
0000000145cc9048 66440fd7d3                     pmovmskb r10d, xmm3
0000000145cc904d 4585d2                         test r10d, r10d
0000000145cc9050 742e                           je 0x145cc9080
0000000145cc9052 f3450fbcda                     tzcnt r11d, r10d
0000000145cc9057 4901c3                         add r11, rax
0000000145cc905a 4d21c3                         and r11, r8
0000000145cc905d 49c1e305                       shl r11, 5
0000000145cc9061 4889ca                         mov rdx, rcx
0000000145cc9064 4c29da                         sub rdx, r11
0000000145cc9067 837ae000                       cmp dword ptr [rdx - 0x20], 0
0000000145cc906b 742c                           je 0x145cc9099
0000000145cc906d 418d52ff                       lea edx, [r10 - 1]
0000000145cc9071 664421d2                       and dx, r10w
0000000145cc9075 4189d2                         mov r10d, edx
0000000145cc9078 75d8                           jne 0x145cc9052
0000000145cc907a 660f1f440000                   nop word ptr [rax + rax]
0000000145cc9080 660f74d1                       pcmpeqb xmm2, xmm1
0000000145cc9084 660fd7d2                       pmovmskb edx, xmm2
0000000145cc9088 85d2                           test edx, edx
0000000145cc908a 756d                           jne 0x145cc90f9
0000000145cc908c 4c01c8                         add rax, r9
0000000145cc908f 4883c010                       add rax, 0x10
0000000145cc9093 4983c110                       add r9, 0x10
0000000145cc9097 eb9f                           jmp 0x145cc9038
0000000145cc9099 448975f4                       mov dword ptr [rbp - 0xc], r14d
0000000145cc909d 48895de8                       mov qword ptr [rbp - 0x18], rbx
0000000145cc90a1 4883c2e8                       add rdx, -0x18
0000000145cc90a5 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145cc90a9 e882b83600                     call 0x146034930
0000000145cc90ae 90                             nop 
0000000145cc90af 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145cc90b3 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145cc90b7 0f1045d0                       movups xmm0, xmmword ptr [rbp - 0x30]
0000000145cc90bb 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145cc90be 488b5de8                       mov rbx, qword ptr [rbp - 0x18]
0000000145cc90c2 448b75f4                       mov r14d, dword ptr [rbp - 0xc]
0000000145cc90c6 4584f6                         test r14b, r14b
0000000145cc90c9 744a                           je 0x145cc9115
0000000145cc90cb eb53                           jmp 0x145cc9120
0000000145cc90cd 488d4b10                       lea rcx, [rbx + 0x10]
0000000145cc90d1 e83adf5300                     call 0x146207010
0000000145cc90d6 e9f1feffff                     jmp 0x145cc8fcc
0000000145cc90db e8c0ec5300                     call 0x146207da0
0000000145cc90e0 4189c6                         mov r14d, eax
0000000145cc90e3 4180f601                       xor r14b, 1
0000000145cc90e7 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145cc90eb 4883bbf801000000               cmp qword ptr [rbx + 0x1f8], 0
0000000145cc90f3 0f85fefeffff                   jne 0x145cc8ff7
0000000145cc90f9 48c70600000000                 mov qword ptr [rsi], 0
0000000145cc9100 48c7460801000000               mov qword ptr [rsi + 8], 1
0000000145cc9108 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145cc9110 4584f6                         test r14b, r14b
0000000145cc9113 750b                           jne 0x145cc9120
0000000145cc9115 488b07                         mov rax, qword ptr [rdi]
0000000145cc9118 48d1e0                         shl rax, 1
0000000145cc911b 4885c0                         test rax, rax
0000000145cc911e 7525                           jne 0x145cc9145
0000000145cc9120 31c0                           xor eax, eax
0000000145cc9122 864310                         xchg byte ptr [rbx + 0x10], al
0000000145cc9125 3c02                           cmp al, 2
0000000145cc9127 740e                           je 0x145cc9137
0000000145cc9129 4889f0                         mov rax, rsi
0000000145cc912c 4883c450                       add rsp, 0x50
0000000145cc9130 5b                             pop rbx
0000000145cc9131 5f                             pop rdi
0000000145cc9132 5e                             pop rsi
0000000145cc9133 415e                           pop r14
0000000145cc9135 5d                             pop rbp
0000000145cc9136 c3                             ret 
0000000145cc9137 4883c310                       add rbx, 0x10
0000000145cc913b 4889d9                         mov rcx, rbx
0000000145cc913e e88ddf5300                     call 0x1462070d0
0000000145cc9143 ebe4                           jmp 0x145cc9129
0000000145cc9145 e856ec5300                     call 0x146207da0
0000000145cc914a 84c0                           test al, al
0000000145cc914c 75d2                           jne 0x145cc9120
0000000145cc914e c6431101                       mov byte ptr [rbx + 0x11], 1
0000000145cc9152 ebcc                           jmp 0x145cc9120
