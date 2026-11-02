; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone5.0.7
0000000145bfac90 55                             push rbp
0000000145bfac91 4157                           push r15
0000000145bfac93 4156                           push r14
0000000145bfac95 4155                           push r13
0000000145bfac97 4154                           push r12
0000000145bfac99 56                             push rsi
0000000145bfac9a 57                             push rdi
0000000145bfac9b 53                             push rbx
0000000145bfac9c 4883ec78                       sub rsp, 0x78
0000000145bfaca0 488d6c2470                     lea rbp, [rsp + 0x70]
0000000145bfaca5 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bfacad 8955b8                         mov dword ptr [rbp - 0x48], edx
0000000145bfacb0 4983f909                       cmp r9, 9
0000000145bfacb4 0f8242060000                   jb 0x145bfb2fc
0000000145bfacba 89d7                           mov edi, edx
0000000145bfacbc 4889cb                         mov rbx, rcx
0000000145bfacbf 4d8b6801                       mov r13, qword ptr [r8 + 1]
0000000145bfacc3 410fb600                       movzx eax, byte ptr [r8]
0000000145bfacc7 85c0                           test eax, eax
0000000145bfacc9 744b                           je 0x145bfad16
0000000145bfaccb 83f801                         cmp eax, 1
0000000145bfacce 7431                           je 0x145bfad01
0000000145bfacd0 83f802                         cmp eax, 2
0000000145bfacd3 0f8523060000                   jne 0x145bfb2fc
0000000145bfacd9 4983f909                       cmp r9, 9
0000000145bfacdd 0f8419060000                   je 0x145bfb2fc
0000000145bface3 4531c9                         xor r9d, r9d
0000000145bface6 4180780900                     cmp byte ptr [r8 + 9], 0
0000000145bfaceb 410f95c1                       setne r9b
0000000145bfacef 48be0100000000000080           movabs rsi, 0x8000000000000001
0000000145bfacf9 31c0                           xor eax, eax
0000000145bfacfb 4c896df0                       mov qword ptr [rbp - 0x10], r13
0000000145bfacff eb6f                           jmp 0x145bfad70
0000000145bfad01 31c0                           xor eax, eax
0000000145bfad03 48be0000000000000080           movabs rsi, 0x8000000000000000
0000000145bfad0d 4531c9                         xor r9d, r9d
0000000145bfad10 4c896df0                       mov qword ptr [rbp - 0x10], r13
0000000145bfad14 eb5a                           jmp 0x145bfad70
0000000145bfad16 4983c1f7                       add r9, -9
0000000145bfad1a 743f                           je 0x145bfad5b
0000000145bfad1c 4c89c6                         mov rsi, r8
0000000145bfad1f 4d89cf                         mov r15, r9
0000000145bfad22 e8d97440fa                     call 0x140002200
0000000145bfad27 ba01000000                     mov edx, 1
0000000145bfad2c 4d89fe                         mov r14, r15
0000000145bfad2f 4c89f9                         mov rcx, r15
0000000145bfad32 e8897440fa                     call 0x1400021c0
0000000145bfad37 4885c0                         test rax, rax
0000000145bfad3a 0f843f060000                   je 0x145bfb37f
0000000145bfad40 4889f2                         mov rdx, rsi
0000000145bfad43 4883c209                       add rdx, 9
0000000145bfad47 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145bfad4b 4889c1                         mov rcx, rax
0000000145bfad4e 4d89f0                         mov r8, r14
0000000145bfad51 e8d5003b00                     call 0x145faae2b
0000000145bfad56 4d89f1                         mov r9, r14
0000000145bfad59 eb09                           jmp 0x145bfad64
0000000145bfad5b b801000000                     mov eax, 1
0000000145bfad60 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145bfad64 4c89c8                         mov rax, r9
0000000145bfad67 482500ffffff                   and rax, 0xffffffffffffff00
0000000145bfad6d 4c89ce                         mov rsi, r9
0000000145bfad70 4c894db0                       mov qword ptr [rbp - 0x50], r9
0000000145bfad74 450fb6e1                       movzx r12d, r9b
0000000145bfad78 4909c4                         or r12, rax
0000000145bfad7b 488d83b0010000                 lea rax, [rbx + 0x1b0]
0000000145bfad82 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145bfad86 897dc0                         mov dword ptr [rbp - 0x40], edi
0000000145bfad89 4c8dbbd0010000                 lea r15, [rbx + 0x1d0]
0000000145bfad90 488d55c0                       lea rdx, [rbp - 0x40]
0000000145bfad94 4c89f9                         mov rcx, r15
0000000145bfad97 e8c4db91fa                     call 0x140518960
0000000145bfad9c 4989c6                         mov r14, rax
0000000145bfad9f 49c1ee39                       shr r14, 0x39
0000000145bfada3 488b8bb0010000                 mov rcx, qword ptr [rbx + 0x1b0]
0000000145bfadaa 488b93b8010000                 mov rdx, qword ptr [rbx + 0x1b8]
0000000145bfadb1 66410f6ec6                     movd xmm0, r14d
0000000145bfadb6 660f60c0                       punpcklbw xmm0, xmm0
0000000145bfadba f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bfadbf 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bfadc4 4531c0                         xor r8d, r8d
0000000145bfadc7 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfadcb 4989c1                         mov r9, rax
0000000145bfadce 488975e0                       mov qword ptr [rbp - 0x20], rsi
0000000145bfadd2 4921d1                         and r9, rdx
0000000145bfadd5 f3420f6f1409                   movdqu xmm2, xmmword ptr [rcx + r9]
0000000145bfaddb 660f6fda                       movdqa xmm3, xmm2
0000000145bfaddf 660f74d8                       pcmpeqb xmm3, xmm0
0000000145bfade3 66440fd7d3                     pmovmskb r10d, xmm3
0000000145bfade8 4585d2                         test r10d, r10d
0000000145bfadeb 7426                           je 0x145bfae13
0000000145bfaded f3450fbcda                     tzcnt r11d, r10d
0000000145bfadf2 4d01cb                         add r11, r9
0000000145bfadf5 4921d3                         and r11, rdx
0000000145bfadf8 49f7db                         neg r11
0000000145bfadfb 4d6bdb68                       imul r11, r11, 0x68
0000000145bfadff 42397c1998                     cmp dword ptr [rcx + r11 - 0x68], edi
0000000145bfae04 7428                           je 0x145bfae2e
0000000145bfae06 458d5aff                       lea r11d, [r10 - 1]
0000000145bfae0a 664521d3                       and r11w, r10w
0000000145bfae0e 4589da                         mov r10d, r11d
0000000145bfae11 75da                           jne 0x145bfaded
0000000145bfae13 660f74d1                       pcmpeqb xmm2, xmm1
0000000145bfae17 66440fd7d2                     pmovmskb r10d, xmm2
0000000145bfae1c 4585d2                         test r10d, r10d
0000000145bfae1f 7518                           jne 0x145bfae39
0000000145bfae21 4d01c1                         add r9, r8
0000000145bfae24 4983c110                       add r9, 0x10
0000000145bfae28 4983c010                       add r8, 0x10
0000000145bfae2c eba4                           jmp 0x145bfadd2
0000000145bfae2e 4c01d9                         add rcx, r11
0000000145bfae31 4989ce                         mov r14, rcx
0000000145bfae34 e9a4000000                     jmp 0x145bfaedd
0000000145bfae39 4883bbc001000000               cmp qword ptr [rbx + 0x1c0], 0
0000000145bfae41 0f84eb040000                   je 0x145bfb332
0000000145bfae47 4821d0                         and rax, rdx
0000000145bfae4a f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bfae4f 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bfae54 4585c0                         test r8d, r8d
0000000145bfae57 0f84b0040000                   je 0x145bfb30d
0000000145bfae5d f3450fbcc0                     tzcnt r8d, r8d
0000000145bfae62 4901c0                         add r8, rax
0000000145bfae65 4921d0                         and r8, rdx
0000000145bfae68 420fb60401                     movzx eax, byte ptr [rcx + r8]
0000000145bfae6d 84c0                           test al, al
0000000145bfae6f 0f89f3040000                   jns 0x145bfb368
0000000145bfae75 4d8d48f0                       lea r9, [r8 - 0x10]
0000000145bfae79 4921d1                         and r9, rdx
0000000145bfae7c 46883401                       mov byte ptr [rcx + r8], r14b
0000000145bfae80 4688740910                     mov byte ptr [rcx + r9 + 0x10], r14b
0000000145bfae85 49f7d8                         neg r8
0000000145bfae88 496bd068                       imul rdx, r8, 0x68
0000000145bfae8c 4c8d3411                       lea r14, [rcx + rdx]
0000000145bfae90 2401                           and al, 1
0000000145bfae92 0fb6c0                         movzx eax, al
0000000145bfae95 482983c0010000                 sub qword ptr [rbx + 0x1c0], rax
0000000145bfae9c 897c1198                       mov dword ptr [rcx + rdx - 0x68], edi
0000000145bfaea0 48c74411a000000000             mov qword ptr [rcx + rdx - 0x60], 0
0000000145bfaea9 48c74411a808000000             mov qword ptr [rcx + rdx - 0x58], 8
0000000145bfaeb2 660fefc0                       pxor xmm0, xmm0
0000000145bfaeb6 f30f7f4411b0                   movdqu xmmword ptr [rcx + rdx - 0x50], xmm0
0000000145bfaebc c74411c8ffffffff               mov dword ptr [rcx + rdx - 0x38], 0xffffffff
0000000145bfaec4 f30f7f4411d0                   movdqu xmmword ptr [rcx + rdx - 0x30], xmm0
0000000145bfaeca f30f7f4411e0                   movdqu xmmword ptr [rcx + rdx - 0x20], xmm0
0000000145bfaed0 f30f7f4411e9                   movdqu xmmword ptr [rcx + rdx - 0x17], xmm0
0000000145bfaed6 48ff83c8010000                 inc qword ptr [rbx + 0x1c8]
0000000145bfaedd 49bf0100000000000080           movabs r15, 0x8000000000000001
0000000145bfaee7 4a8d0c3e                       lea rcx, [rsi + r15]
0000000145bfaeeb 4889f0                         mov rax, rsi
0000000145bfaeee 48c1f83f                       sar rax, 0x3f
0000000145bfaef2 4821c8                         and rax, rcx
0000000145bfaef5 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfaef9 0f84d0000000                   je 0x145bfafcf
0000000145bfaeff 4883f801                       cmp rax, 1
0000000145bfaf03 0f85a5010000                   jne 0x145bfb0ae
0000000145bfaf09 498b76b8                       mov rsi, qword ptr [r14 - 0x48]
0000000145bfaf0d 4885f6                         test rsi, rsi
0000000145bfaf10 0f84ce030000                   je 0x145bfb2e4
0000000145bfaf16 498b7ea0                       mov rdi, qword ptr [r14 - 0x60]
0000000145bfaf1a 498b5ea8                       mov rbx, qword ptr [r14 - 0x58]
0000000145bfaf1e 498b46b0                       mov rax, qword ptr [r14 - 0x50]
0000000145bfaf22 4d8b7ed8                       mov r15, qword ptr [r14 - 0x28]
0000000145bfaf26 4d8b66e0                       mov r12, qword ptr [r14 - 0x20]
0000000145bfaf2a 48ffce                         dec rsi
0000000145bfaf2d eb0e                           jmp 0x145bfaf3d
0000000145bfaf2f 90                             nop 
0000000145bfaf30 4c89e8                         mov rax, r13
0000000145bfaf33 4883c6ff                       add rsi, -1
0000000145bfaf37 0f83a7030000                   jae 0x145bfb2e4
0000000145bfaf3d 4839f8                         cmp rax, rdi
0000000145bfaf40 4889f9                         mov rcx, rdi
0000000145bfaf43 ba00000000                     mov edx, 0
0000000145bfaf48 480f42ca                       cmovb rcx, rdx
0000000145bfaf4c 4889c2                         mov rdx, rax
0000000145bfaf4f 4829ca                         sub rdx, rcx
0000000145bfaf52 48c1e205                       shl rdx, 5
0000000145bfaf56 4c390c13                       cmp qword ptr [rbx + rdx], r9
0000000145bfaf5a 0f8784030000                   ja 0x145bfb2e4
0000000145bfaf60 488d4801                       lea rcx, [rax + 1]
0000000145bfaf64 4839f9                         cmp rcx, rdi
0000000145bfaf67 b900000000                     mov ecx, 0
0000000145bfaf6c 480f43cf                       cmovae rcx, rdi
0000000145bfaf70 48f7d9                         neg rcx
0000000145bfaf73 4c8d2c08                       lea r13, [rax + rcx]
0000000145bfaf77 49ffc5                         inc r13
0000000145bfaf7a 4d896eb0                       mov qword ptr [r14 - 0x50], r13
0000000145bfaf7e 498976b8                       mov qword ptr [r14 - 0x48], rsi
0000000145bfaf82 48c1e005                       shl rax, 5
0000000145bfaf86 488b540308                     mov rdx, qword ptr [rbx + rax + 8]
0000000145bfaf8b 4883faff                       cmp rdx, -1
0000000145bfaf8f 0f84f9030000                   je 0x145bfb38e
0000000145bfaf95 488d0c03                       lea rcx, [rbx + rax]
0000000145bfaf99 4c2b7918                       sub r15, qword ptr [rcx + 0x18]
0000000145bfaf9d 488b4c0310                     mov rcx, qword ptr [rbx + rax + 0x10]
0000000145bfafa2 4d897ed8                       mov qword ptr [r14 - 0x28], r15
0000000145bfafa6 4983fc01                       cmp r12, 1
0000000145bfafaa 4983d4ff                       adc r12, -1
0000000145bfafae 4d8966e0                       mov qword ptr [r14 - 0x20], r12
0000000145bfafb2 4885d2                         test rdx, rdx
0000000145bfafb5 0f8475ffffff                   je 0x145bfaf30
0000000145bfafbb 41b801000000                   mov r8d, 1
0000000145bfafc1 e80a7240fa                     call 0x1400021d0
0000000145bfafc6 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfafca e961ffffff                     jmp 0x145bfaf30
0000000145bfafcf 48895de8                       mov qword ptr [rbp - 0x18], rbx
0000000145bfafd3 498d5ee8                       lea rbx, [r14 - 0x18]
0000000145bfafd7 498b46e8                       mov rax, qword ptr [r14 - 0x18]
0000000145bfafdb 48ffc0                         inc rax
0000000145bfafde 4939c5                         cmp r13, rax
0000000145bfafe1 0f85ce010000                   jne 0x145bfb1b5
0000000145bfafe7 4c892b                         mov qword ptr [rbx], r13
0000000145bfafea 85ff                           test edi, edi
0000000145bfafec 0f842f020000                   je 0x145bfb221
0000000145bfaff2 488b5de8                       mov rbx, qword ptr [rbp - 0x18]
0000000145bfaff6 4883bb9801000000               cmp qword ptr [rbx + 0x198], 0
0000000145bfaffe 0f84f3010000                   je 0x145bfb1f7
0000000145bfb004 488d8ba0010000                 lea rcx, [rbx + 0x1a0]
0000000145bfb00b 488d55b8                       lea rdx, [rbp - 0x48]
0000000145bfb00f e84cd991fa                     call 0x140518960
0000000145bfb014 4989c0                         mov r8, rax
0000000145bfb017 49c1e839                       shr r8, 0x39
0000000145bfb01b 488b8b80010000                 mov rcx, qword ptr [rbx + 0x180]
0000000145bfb022 488b9388010000                 mov rdx, qword ptr [rbx + 0x188]
0000000145bfb029 66410f6ec0                     movd xmm0, r8d
0000000145bfb02e 660f60c0                       punpcklbw xmm0, xmm0
0000000145bfb032 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145bfb037 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145bfb03c 4531c0                         xor r8d, r8d
0000000145bfb03f 660f76c9                       pcmpeqd xmm1, xmm1
0000000145bfb043 4821d0                         and rax, rdx
0000000145bfb046 f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145bfb04b 660f6fda                       movdqa xmm3, xmm2
0000000145bfb04f 660f74d8                       pcmpeqb xmm3, xmm0
0000000145bfb053 66440fd7cb                     pmovmskb r9d, xmm3
0000000145bfb058 4585c9                         test r9d, r9d
0000000145bfb05b 742e                           je 0x145bfb08b
0000000145bfb05d f3450fbcd1                     tzcnt r10d, r9d
0000000145bfb062 4901c2                         add r10, rax
0000000145bfb065 4921d2                         and r10, rdx
0000000145bfb068 49f7da                         neg r10
0000000145bfb06b 4f8d1452                       lea r10, [r10 + r10*2]
0000000145bfb06f 49c1e204                       shl r10, 4
0000000145bfb073 423b7c11d0                     cmp edi, dword ptr [rcx + r10 - 0x30]
0000000145bfb078 0f84ca010000                   je 0x145bfb248
0000000145bfb07e 458d51ff                       lea r10d, [r9 - 1]
0000000145bfb082 664521ca                       and r10w, r9w
0000000145bfb086 4589d1                         mov r9d, r10d
0000000145bfb089 75d2                           jne 0x145bfb05d
0000000145bfb08b 660f74d1                       pcmpeqb xmm2, xmm1
0000000145bfb08f 66440fd7ca                     pmovmskb r9d, xmm2
0000000145bfb094 4585c9                         test r9d, r9d
0000000145bfb097 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfb09b 0f8556010000                   jne 0x145bfb1f7
0000000145bfb0a1 4c01c0                         add rax, r8
0000000145bfb0a4 4883c010                       add rax, 0x10
0000000145bfb0a8 4983c010                       add r8, 0x10
0000000145bfb0ac eb95                           jmp 0x145bfb043
0000000145bfb0ae 48895de8                       mov qword ptr [rbp - 0x18], rbx
0000000145bfb0b2 897dbc                         mov dword ptr [rbp - 0x44], edi
0000000145bfb0b5 4d8b66b8                       mov r12, qword ptr [r14 - 0x48]
0000000145bfb0b9 4d85e4                         test r12, r12
0000000145bfb0bc 0f84b9000000                   je 0x145bfb17b
0000000145bfb0c2 4d8b6ea0                       mov r13, qword ptr [r14 - 0x60]
0000000145bfb0c6 4d8b7ea8                       mov r15, qword ptr [r14 - 0x58]
0000000145bfb0ca 498b46b0                       mov rax, qword ptr [r14 - 0x50]
0000000145bfb0ce 498b76d8                       mov rsi, qword ptr [r14 - 0x28]
0000000145bfb0d2 498b7ee0                       mov rdi, qword ptr [r14 - 0x20]
0000000145bfb0d6 49ffcc                         dec r12
0000000145bfb0d9 eb12                           jmp 0x145bfb0ed
0000000145bfb0db 0f1f440000                     nop dword ptr [rax + rax]
0000000145bfb0e0 4889d8                         mov rax, rbx
0000000145bfb0e3 4983c4ff                       add r12, -1
0000000145bfb0e7 0f838e000000                   jae 0x145bfb17b
0000000145bfb0ed 4c39e8                         cmp rax, r13
0000000145bfb0f0 4c89e9                         mov rcx, r13
0000000145bfb0f3 ba00000000                     mov edx, 0
0000000145bfb0f8 480f42ca                       cmovb rcx, rdx
0000000145bfb0fc 4889c2                         mov rdx, rax
0000000145bfb0ff 4829ca                         sub rdx, rcx
0000000145bfb102 48c1e205                       shl rdx, 5
0000000145bfb106 4d390c17                       cmp qword ptr [r15 + rdx], r9
0000000145bfb10a 776f                           ja 0x145bfb17b
0000000145bfb10c 488d4801                       lea rcx, [rax + 1]
0000000145bfb110 4c39e9                         cmp rcx, r13
0000000145bfb113 b900000000                     mov ecx, 0
0000000145bfb118 490f43cd                       cmovae rcx, r13
0000000145bfb11c 48f7d9                         neg rcx
0000000145bfb11f 488d1c08                       lea rbx, [rax + rcx]
0000000145bfb123 48ffc3                         inc rbx
0000000145bfb126 49895eb0                       mov qword ptr [r14 - 0x50], rbx
0000000145bfb12a 4d8966b8                       mov qword ptr [r14 - 0x48], r12
0000000145bfb12e 48c1e005                       shl rax, 5
0000000145bfb132 498b540708                     mov rdx, qword ptr [r15 + rax + 8]
0000000145bfb137 4883faff                       cmp rdx, -1
0000000145bfb13b 0f846c020000                   je 0x145bfb3ad
0000000145bfb141 498d0c07                       lea rcx, [r15 + rax]
0000000145bfb145 482b7118                       sub rsi, qword ptr [rcx + 0x18]
0000000145bfb149 498b4c0710                     mov rcx, qword ptr [r15 + rax + 0x10]
0000000145bfb14e 498976d8                       mov qword ptr [r14 - 0x28], rsi
0000000145bfb152 4883ff01                       cmp rdi, 1
0000000145bfb156 4883d7ff                       adc rdi, -1
0000000145bfb15a 49897ee0                       mov qword ptr [r14 - 0x20], rdi
0000000145bfb15e 4885d2                         test rdx, rdx
0000000145bfb161 0f8479ffffff                   je 0x145bfb0e0
0000000145bfb167 41b801000000                   mov r8d, 1
0000000145bfb16d e85e7040fa                     call 0x1400021d0
0000000145bfb172 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfb176 e965ffffff                     jmp 0x145bfb0e0
0000000145bfb17b 49c746e000000000               mov qword ptr [r14 - 0x20], 0
0000000145bfb183 41c646f800                     mov byte ptr [r14 - 8], 0
0000000145bfb188 41c746c8ffffffff               mov dword ptr [r14 - 0x38], 0xffffffff
0000000145bfb190 f645b001                       test byte ptr [rbp - 0x50], 1
0000000145bfb194 8b7dbc                         mov edi, dword ptr [rbp - 0x44]
0000000145bfb197 49bf0100000000000080           movabs r15, 0x8000000000000001
0000000145bfb1a1 0f853d010000                   jne 0x145bfb2e4
0000000145bfb1a7 4983c6e8                       add r14, -0x18
0000000145bfb1ab b001                           mov al, 1
0000000145bfb1ad 4c89f3                         mov rbx, r14
0000000145bfb1b0 e909010000                     jmp 0x145bfb2be
0000000145bfb1b5 0f8629010000                   jbe 0x145bfb2e4
0000000145bfb1bb 418b46c8                       mov eax, dword ptr [r14 - 0x38]
0000000145bfb1bf 83f8ff                         cmp eax, -1
0000000145bfb1c2 0f84e2000000                   je 0x145bfb2aa
0000000145bfb1c8 498b4ec0                       mov rcx, qword ptr [r14 - 0x40]
0000000145bfb1cc 48894dc0                       mov qword ptr [rbp - 0x40], rcx
0000000145bfb1d0 8945c8                         mov dword ptr [rbp - 0x38], eax
0000000145bfb1d3 c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb1d7 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bfb1db e880993500                     call 0x145f54b60
0000000145bfb1e0 90                             nop 
0000000145bfb1e1 4885c0                         test rax, rax
0000000145bfb1e4 0f8888000000                   js 0x145bfb272
0000000145bfb1ea 0f57c0                         xorps xmm0, xmm0
0000000145bfb1ed f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bfb1f2 e993000000                     jmp 0x145bfb28a
0000000145bfb1f7 4885f6                         test rsi, rsi
0000000145bfb1fa 0f84fc000000                   je 0x145bfb2fc
0000000145bfb200 41b801000000                   mov r8d, 1
0000000145bfb206 4c89c9                         mov rcx, r9
0000000145bfb209 4889f2                         mov rdx, rsi
0000000145bfb20c 4883c478                       add rsp, 0x78
0000000145bfb210 5b                             pop rbx
0000000145bfb211 5f                             pop rdi
0000000145bfb212 5e                             pop rsi
0000000145bfb213 415c                           pop r12
0000000145bfb215 415d                           pop r13
0000000145bfb217 415e                           pop r14
0000000145bfb219 415f                           pop r15
0000000145bfb21b 5d                             pop rbp
0000000145bfb21c e9af6f40fa                     jmp 0x1400021d0
0000000145bfb221 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145bfb225 4883c140                       add rcx, 0x40
0000000145bfb229 488975c0                       mov qword ptr [rbp - 0x40], rsi
0000000145bfb22d 4c894dc8                       mov qword ptr [rbp - 0x38], r9
0000000145bfb231 4c8965d0                       mov qword ptr [rbp - 0x30], r12
0000000145bfb235 c645ff01                       mov byte ptr [rbp - 1], 1
0000000145bfb239 488d55c0                       lea rdx, [rbp - 0x40]
0000000145bfb23d e8fe680700                     call 0x145c71b40
0000000145bfb242 90                             nop 
0000000145bfb243 e9b4000000                     jmp 0x145bfb2fc
0000000145bfb248 4c01d1                         add rcx, r10
0000000145bfb24b 4883c1d8                       add rcx, -0x28
0000000145bfb24f 488975c0                       mov qword ptr [rbp - 0x40], rsi
0000000145bfb253 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145bfb257 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145bfb25b 4c8965d0                       mov qword ptr [rbp - 0x30], r12
0000000145bfb25f c645ff01                       mov byte ptr [rbp - 1], 1
0000000145bfb263 488d55c0                       lea rdx, [rbp - 0x40]
0000000145bfb267 e8d4680700                     call 0x145c71b40
0000000145bfb26c 90                             nop 
0000000145bfb26d e98a000000                     jmp 0x145bfb2fc
0000000145bfb272 4889c1                         mov rcx, rax
0000000145bfb275 48d1e9                         shr rcx, 1
0000000145bfb278 83e001                         and eax, 1
0000000145bfb27b 4809c8                         or rax, rcx
0000000145bfb27e 0f57c0                         xorps xmm0, xmm0
0000000145bfb281 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145bfb286 f30f58c0                       addss xmm0, xmm0
0000000145bfb28a 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfb28e 0f57c9                         xorps xmm1, xmm1
0000000145bfb291 f30f2aca                       cvtsi2ss xmm1, edx
0000000145bfb295 f30f5e0d53ea5f00               divss xmm1, dword ptr [rip + 0x5fea53]
0000000145bfb29d f30f58c8                       addss xmm1, xmm0
0000000145bfb2a1 0f2e0d08d95900                 ucomiss xmm1, dword ptr [rip + 0x59d908]
0000000145bfb2a8 723a                           jb 0x145bfb2e4
0000000145bfb2aa c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb2ae e85d973500                     call 0x145f54a10
0000000145bfb2b3 90                             nop 
0000000145bfb2b4 498946c0                       mov qword ptr [r14 - 0x40], rax
0000000145bfb2b8 418956c8                       mov dword ptr [r14 - 0x38], edx
0000000145bfb2bc 31c0                           xor eax, eax
0000000145bfb2be 488b0b                         mov rcx, qword ptr [rbx]
0000000145bfb2c1 4c897dc0                       mov qword ptr [rbp - 0x40], r15
0000000145bfb2c5 48894dc8                       mov qword ptr [rbp - 0x38], rcx
0000000145bfb2c9 8845d0                         mov byte ptr [rbp - 0x30], al
0000000145bfb2cc c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb2d0 4c8d45c0                       lea r8, [rbp - 0x40]
0000000145bfb2d4 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145bfb2d8 89fa                           mov edx, edi
0000000145bfb2da e841baffff                     call 0x145bf6d20
0000000145bfb2df 90                             nop 
0000000145bfb2e0 4c8b4df0                       mov r9, qword ptr [rbp - 0x10]
0000000145bfb2e4 488b55e0                       mov rdx, qword ptr [rbp - 0x20]
0000000145bfb2e8 4885d2                         test rdx, rdx
0000000145bfb2eb 7e0f                           jle 0x145bfb2fc
0000000145bfb2ed 41b801000000                   mov r8d, 1
0000000145bfb2f3 4c89c9                         mov rcx, r9
0000000145bfb2f6 e8d56e40fa                     call 0x1400021d0
0000000145bfb2fb 90                             nop 
0000000145bfb2fc 4883c478                       add rsp, 0x78
0000000145bfb300 5b                             pop rbx
0000000145bfb301 5f                             pop rdi
0000000145bfb302 5e                             pop rsi
0000000145bfb303 415c                           pop r12
0000000145bfb305 415d                           pop r13
0000000145bfb307 415e                           pop r14
0000000145bfb309 415f                           pop r15
0000000145bfb30b 5d                             pop rbp
0000000145bfb30c c3                             ret 
0000000145bfb30d 41b910000000                   mov r9d, 0x10
0000000145bfb313 4c01c8                         add rax, r9
0000000145bfb316 4821d0                         and rax, rdx
0000000145bfb319 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145bfb31e 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bfb323 4983c110                       add r9, 0x10
0000000145bfb327 4585c0                         test r8d, r8d
0000000145bfb32a 0f852dfbffff                   jne 0x145bfae5d
0000000145bfb330 ebe1                           jmp 0x145bfb313
0000000145bfb332 4889c6                         mov rsi, rax
0000000145bfb335 c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb339 ba01000000                     mov edx, 1
0000000145bfb33e 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145bfb342 4d89f8                         mov r8, r15
0000000145bfb345 41b101                         mov r9b, 1
0000000145bfb348 e8836f5300                     call 0x1461322d0
0000000145bfb34d 90                             nop 
0000000145bfb34e 488b8bb0010000                 mov rcx, qword ptr [rbx + 0x1b0]
0000000145bfb355 488b93b8010000                 mov rdx, qword ptr [rbx + 0x1b8]
0000000145bfb35c 4889f0                         mov rax, rsi
0000000145bfb35f 488b75e0                       mov rsi, qword ptr [rbp - 0x20]
0000000145bfb363 e9dffaffff                     jmp 0x145bfae47
0000000145bfb368 660f6f01                       movdqa xmm0, xmmword ptr [rcx]
0000000145bfb36c 660fd7c0                       pmovmskb eax, xmm0
0000000145bfb370 f3440fbcc0                     tzcnt r8d, eax
0000000145bfb375 420fb60401                     movzx eax, byte ptr [rcx + r8]
0000000145bfb37a e9f6faffff                     jmp 0x145bfae75
0000000145bfb37f b901000000                     mov ecx, 1
0000000145bfb384 4c89f2                         mov rdx, r14
0000000145bfb387 e81f6d5500                     call 0x1461520ab
0000000145bfb38c 0f0b                           ud2 
0000000145bfb38e c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb392 488d0da739a001                 lea rcx, [rip + 0x1a039a7]
0000000145bfb399 4c8d05b039a001                 lea r8, [rip + 0x1a039b0]
0000000145bfb3a0 ba09000000                     mov edx, 9
0000000145bfb3a5 e8b66f5500                     call 0x146152360
0000000145bfb3aa 90                             nop 
0000000145bfb3ab eb1d                           jmp 0x145bfb3ca
0000000145bfb3ad c645ff00                       mov byte ptr [rbp - 1], 0
0000000145bfb3b1 488d0d8839a001                 lea rcx, [rip + 0x1a03988]
0000000145bfb3b8 4c8d059139a001                 lea r8, [rip + 0x1a03991]
0000000145bfb3bf ba09000000                     mov edx, 9
0000000145bfb3c4 e8976f5500                     call 0x146152360
0000000145bfb3c9 90                             nop 
0000000145bfb3ca 0f0b                           ud2 
