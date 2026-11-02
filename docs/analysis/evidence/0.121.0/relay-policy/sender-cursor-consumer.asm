0000000145c5c730 55                             push rbp
0000000145c5c731 4157                           push r15
0000000145c5c733 4156                           push r14
0000000145c5c735 4155                           push r13
0000000145c5c737 4154                           push r12
0000000145c5c739 56                             push rsi
0000000145c5c73a 57                             push rdi
0000000145c5c73b 53                             push rbx
0000000145c5c73c 4881ec88010000                 sub rsp, 0x188
0000000145c5c743 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c5c74b 660f29b5f0000000               movapd xmmword ptr [rbp + 0xf0], xmm6
0000000145c5c753 48c785e8000000feffffff         mov qword ptr [rbp + 0xe8], 0xfffffffffffffffe
0000000145c5c75e 4889ce                         mov rsi, rcx
0000000145c5c761 48837960ff                     cmp qword ptr [rcx + 0x60], -1
0000000145c5c766 7426                           je 0x145c5c78e
0000000145c5c768 80be4101000000                 cmp byte ptr [rsi + 0x141], 0
0000000145c5c76f 0f8569050000                   jne 0x145c5ccde
0000000145c5c775 83be28010000ff                 cmp dword ptr [rsi + 0x128], -1
0000000145c5c77c 0f855c050000                   jne 0x145c5ccde
0000000145c5c782 b838010000                     mov eax, 0x138
0000000145c5c787 b930010000                     mov ecx, 0x130
0000000145c5c78c eb0a                           jmp 0x145c5c798
0000000145c5c78e b888010000                     mov eax, 0x188
0000000145c5c793 b980010000                     mov ecx, 0x180
0000000145c5c798 488b0c0e                       mov rcx, qword ptr [rsi + rcx]
0000000145c5c79c 488b0406                       mov rax, qword ptr [rsi + rax]
0000000145c5c7a0 ff5028                         call qword ptr [rax + 0x28]
0000000145c5c7a3 3c01                           cmp al, 1
0000000145c5c7a5 0f8533050000                   jne 0x145c5ccde
0000000145c5c7ab f20f10b668010000               movsd xmm6, qword ptr [rsi + 0x168]
0000000145c5c7b3 488d8e70010000                 lea rcx, [rsi + 0x170]
0000000145c5c7ba e891913300                     call 0x145f95950
0000000145c5c7bf 66480f6ec0                     movq xmm0, rax
0000000145c5c7c4 660f620584be5300               punpckldq xmm0, xmmword ptr [rip + 0x53be84]
0000000145c5c7cc 660f5c058cbe5300               subpd xmm0, xmmword ptr [rip + 0x53be8c]
0000000145c5c7d4 660f28c8                       movapd xmm1, xmm0
0000000145c5c7d8 660f15c8                       unpckhpd xmm1, xmm0
0000000145c5c7dc f20f58c8                       addsd xmm1, xmm0
0000000145c5c7e0 0f57c0                         xorps xmm0, xmm0
0000000145c5c7e3 f20f2ac2                       cvtsi2sd xmm0, edx
0000000145c5c7e7 f20f5e0571595500               divsd xmm0, qword ptr [rip + 0x555971]
0000000145c5c7ef f20f58c1                       addsd xmm0, xmm1
0000000145c5c7f3 f20f100dd56da301               movsd xmm1, qword ptr [rip + 0x1a36dd5]
0000000145c5c7fb f20f59c1                       mulsd xmm0, xmm1
0000000145c5c7ff f20f58c6                       addsd xmm0, xmm6
0000000145c5c803 f20f5dc1                       minsd xmm0, xmm1
0000000145c5c807 f20f118668010000               movsd qword ptr [rsi + 0x168], xmm0
0000000145c5c80f e8ec8f3300                     call 0x145f95800
0000000145c5c814 48898670010000                 mov qword ptr [rsi + 0x170], rax
0000000145c5c81b 899678010000                   mov dword ptr [rsi + 0x178], edx
0000000145c5c821 48c785a800000000000000         mov qword ptr [rbp + 0xa8], 0
0000000145c5c82c 48c785b000000008000000         mov qword ptr [rbp + 0xb0], 8
0000000145c5c837 48c785b800000000000000         mov qword ptr [rbp + 0xb8], 0
0000000145c5c842 4c8ba6e0010000                 mov r12, qword ptr [rsi + 0x1e0]
0000000145c5c849 4d85e4                         test r12, r12
0000000145c5c84c 0f84fd020000                   je 0x145c5cb4f
0000000145c5c852 4c8baec8010000                 mov r13, qword ptr [rsi + 0x1c8]
0000000145c5c859 66410f6f4500                   movdqa xmm0, xmmword ptr [r13]
0000000145c5c85f 660fd7c0                       pmovmskb eax, xmm0
0000000145c5c863 f7d0                           not eax
0000000145c5c865 498d5d10                       lea rbx, [r13 + 0x10]
0000000145c5c869 660f57f6                       xorpd xmm6, xmm6
0000000145c5c86d eb0f                           jmp 0x145c5c87e
0000000145c5c86f 90                             nop
0000000145c5c870 8d41ff                         lea eax, [rcx - 1]
0000000145c5c873 21c8                           and eax, ecx
0000000145c5c875 49ffcc                         dec r12
0000000145c5c878 0f847b040000                   je 0x145c5ccf9
0000000145c5c87e 6685c0                         test ax, ax
0000000145c5c881 7527                           jne 0x145c5c8aa
0000000145c5c883 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000145c5c890 660f6f03                       movdqa xmm0, xmmword ptr [rbx]
0000000145c5c894 4981c500f9ffff                 add r13, -0x700
0000000145c5c89b 4883c310                       add rbx, 0x10
0000000145c5c89f 660fd7c0                       pmovmskb eax, xmm0
0000000145c5c8a3 35ffff0000                     xor eax, 0xffff
0000000145c5c8a8 74e6                           je 0x145c5c890
0000000145c5c8aa 89c1                           mov ecx, eax
0000000145c5c8ac f30fbcc1                       tzcnt eax, ecx
0000000145c5c8b0 48f7d8                         neg rax
0000000145c5c8b3 486bc070                       imul rax, rax, 0x70
0000000145c5c8b7 41807c05f800                   cmp byte ptr [r13 + rax - 8], 0
0000000145c5c8bd 75b1                           jne 0x145c5c870
0000000145c5c8bf 4a8d3c28                       lea rdi, [rax + r13]
0000000145c5c8c3 418b440590                     mov eax, dword ptr [r13 + rax - 0x70]
0000000145c5c8c8 8985a4000000                   mov dword ptr [rbp + 0xa4], eax
0000000145c5c8ce 488b47d8                       mov rax, qword ptr [rdi - 0x28]
0000000145c5c8d2 48898d90000000                 mov qword ptr [rbp + 0x90], rcx
0000000145c5c8d9 4c89a5c0000000                 mov qword ptr [rbp + 0xc0], r12
0000000145c5c8e0 483b47b0                       cmp rax, qword ptr [rdi - 0x50]
0000000145c5c8e4 738a                           jae 0x145c5c870
0000000145c5c8e6 488b57e0                       mov rdx, qword ptr [rdi - 0x20]
0000000145c5c8ea f20f108668010000               movsd xmm0, qword ptr [rsi + 0x168]
0000000145c5c8f2 4839d0                         cmp rax, rdx
0000000145c5c8f5 730a                           jae 0x145c5c901
0000000145c5c8f7 660f2ec6                       ucomisd xmm0, xmm6
0000000145c5c8fb 0f866fffffff                   jbe 0x145c5c870
0000000145c5c901 488b4fa8                       mov rcx, qword ptr [rdi - 0x58]
0000000145c5c905 4801c1                         add rcx, rax
0000000145c5c908 4c8b4798                       mov r8, qword ptr [rdi - 0x68]
0000000145c5c90c 4c39c1                         cmp rcx, r8
0000000145c5c90f 41b900000000                   mov r9d, 0
0000000145c5c915 4d0f42c1                       cmovb r8, r9
0000000145c5c919 4c29c1                         sub rcx, r8
0000000145c5c91c 48c1e105                       shl rcx, 5
0000000145c5c920 48034fa0                       add rcx, qword ptr [rdi - 0x60]
0000000145c5c924 4839d0                         cmp rax, rdx
0000000145c5c927 7315                           jae 0x145c5c93e
0000000145c5c929 0f57c9                         xorps xmm1, xmm1
0000000145c5c92c f2480f2a4918                   cvtsi2sd xmm1, qword ptr [rcx + 0x18]
0000000145c5c932 f20f5cc1                       subsd xmm0, xmm1
0000000145c5c936 f20f118668010000               movsd qword ptr [rsi + 0x168], xmm0
0000000145c5c93e 4c8b6118                       mov r12, qword ptr [rcx + 0x18]
0000000145c5c942 4d85e4                         test r12, r12
0000000145c5c945 0f88e9010000                   js 0x145c5cb34
0000000145c5c94b 488b01                         mov rax, qword ptr [rcx]
0000000145c5c94e 488985c8000000                 mov qword ptr [rbp + 0xc8], rax
0000000145c5c955 743c                           je 0x145c5c993
0000000145c5c957 4c8b7110                       mov r14, qword ptr [rcx + 0x10]
0000000145c5c95b e8a0583afa                     call 0x140002200
0000000145c5c960 41bf01000000                   mov r15d, 1
0000000145c5c966 ba01000000                     mov edx, 1
0000000145c5c96b 4c89e1                         mov rcx, r12
0000000145c5c96e e84d583afa                     call 0x1400021c0
0000000145c5c973 4885c0                         test rax, rax
0000000145c5c976 0f84bb010000                   je 0x145c5cb37
0000000145c5c97c 488985d8000000                 mov qword ptr [rbp + 0xd8], rax
0000000145c5c983 4889c1                         mov rcx, rax
0000000145c5c986 4c89f2                         mov rdx, r14
0000000145c5c989 4d89e0                         mov r8, r12
0000000145c5c98c e88af23800                     call 0x145febc1b
0000000145c5c991 eb0c                           jmp 0x145c5c99f
0000000145c5c993 b801000000                     mov eax, 1
0000000145c5c998 488985d8000000                 mov qword ptr [rbp + 0xd8], rax
0000000145c5c99f 4c89a5d0000000                 mov qword ptr [rbp + 0xd0], r12
0000000145c5c9a6 e855583afa                     call 0x140002200
0000000145c5c9ab b901000000                     mov ecx, 1
0000000145c5c9b0 ba01000000                     mov edx, 1
0000000145c5c9b5 e806583afa                     call 0x1400021c0
0000000145c5c9ba 4885c0                         test rax, rax
0000000145c5c9bd 0f8450030000                   je 0x145c5cd13
0000000145c5c9c3 c60000                         mov byte ptr [rax], 0
0000000145c5c9c6 48c745d001000000               mov qword ptr [rbp - 0x30], 1
0000000145c5c9ce 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145c5c9d2 48c745e001000000               mov qword ptr [rbp - 0x20], 1
0000000145c5c9da 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c5c9e3 ba01000000                     mov edx, 1
0000000145c5c9e8 41b808000000                   mov r8d, 8
0000000145c5c9ee 41b901000000                   mov r9d, 1
0000000145c5c9f4 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145c5c9f8 e893f93800                     call 0x145fec390
0000000145c5c9fd 90                             nop
0000000145c5c9fe 4c8ba5c0000000                 mov r12, qword ptr [rbp + 0xc0]
0000000145c5ca05 4c8b7dd8                       mov r15, qword ptr [rbp - 0x28]
0000000145c5ca09 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145c5ca0d 488b85c8000000                 mov rax, qword ptr [rbp + 0xc8]
0000000145c5ca14 4b890437                       mov qword ptr [r15 + r14], rax
0000000145c5ca18 4983c608                       add r14, 8
0000000145c5ca1c 4c8975e0                       mov qword ptr [rbp - 0x20], r14
0000000145c5ca20 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0000000145c5ca24 488985c8000000                 mov qword ptr [rbp + 0xc8], rax
0000000145c5ca2b 4c29f0                         sub rax, r14
0000000145c5ca2e 4c8b85d0000000                 mov r8, qword ptr [rbp + 0xd0]
0000000145c5ca35 4939c0                         cmp r8, rax
0000000145c5ca38 0f87bb000000                   ja 0x145c5caf9
0000000145c5ca3e 4d85c0                         test r8, r8
0000000145c5ca41 7410                           je 0x145c5ca53
0000000145c5ca43 4b8d0c37                       lea rcx, [r15 + r14]
0000000145c5ca47 488b95d8000000                 mov rdx, qword ptr [rbp + 0xd8]
0000000145c5ca4e e8c8f13800                     call 0x145febc1b
0000000145c5ca53 4c89bd98000000                 mov qword ptr [rbp + 0x98], r15
0000000145c5ca5a 4c8bbdb8000000                 mov r15, qword ptr [rbp + 0xb8]
0000000145c5ca61 4c3bbda8000000                 cmp r15, qword ptr [rbp + 0xa8]
0000000145c5ca68 750d                           jne 0x145c5ca77
0000000145c5ca6a 488d8da8000000                 lea rcx, [rbp + 0xa8]
0000000145c5ca71 e85afc3800                     call 0x145fec6d0
0000000145c5ca76 90                             nop
0000000145c5ca77 488b95d0000000                 mov rdx, qword ptr [rbp + 0xd0]
0000000145c5ca7e 4901d6                         add r14, rdx
0000000145c5ca81 4c89f8                         mov rax, r15
0000000145c5ca84 48c1e005                       shl rax, 5
0000000145c5ca88 49ffc7                         inc r15
0000000145c5ca8b 488b8db0000000                 mov rcx, qword ptr [rbp + 0xb0]
0000000145c5ca92 448b85a4000000                 mov r8d, dword ptr [rbp + 0xa4]
0000000145c5ca99 44890401                       mov dword ptr [rcx + rax], r8d
0000000145c5ca9d 4c8b85c8000000                 mov r8, qword ptr [rbp + 0xc8]
0000000145c5caa4 4c89440108                     mov qword ptr [rcx + rax + 8], r8
0000000145c5caa9 4c8b8598000000                 mov r8, qword ptr [rbp + 0x98]
0000000145c5cab0 4c89440110                     mov qword ptr [rcx + rax + 0x10], r8
0000000145c5cab5 4c89740118                     mov qword ptr [rcx + rax + 0x18], r14
0000000145c5caba 4c89bdb8000000                 mov qword ptr [rbp + 0xb8], r15
0000000145c5cac1 4885d2                         test rdx, rdx
0000000145c5cac4 7412                           je 0x145c5cad8
0000000145c5cac6 41b801000000                   mov r8d, 1
0000000145c5cacc 488b8dd8000000                 mov rcx, qword ptr [rbp + 0xd8]
0000000145c5cad3 e8f8563afa                     call 0x1400021d0
0000000145c5cad8 488b47d8                       mov rax, qword ptr [rdi - 0x28]
0000000145c5cadc 48ffc0                         inc rax
0000000145c5cadf 488947d8                       mov qword ptr [rdi - 0x28], rax
0000000145c5cae3 807ff800                       cmp byte ptr [rdi - 8], 0
0000000145c5cae7 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
0000000145c5caee 0f84ecfdffff                   je 0x145c5c8e0
0000000145c5caf4 e977fdffff                     jmp 0x145c5c870
0000000145c5caf9 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c5cb02 41b901000000                   mov r9d, 1
0000000145c5cb08 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145c5cb0c 4c89f2                         mov rdx, r14
0000000145c5cb0f e87cf83800                     call 0x145fec390
0000000145c5cb14 90                             nop
0000000145c5cb15 4c8b75e0                       mov r14, qword ptr [rbp - 0x20]
0000000145c5cb19 488b45d0                       mov rax, qword ptr [rbp - 0x30]
0000000145c5cb1d 488985c8000000                 mov qword ptr [rbp + 0xc8], rax
0000000145c5cb24 4c8b7dd8                       mov r15, qword ptr [rbp - 0x28]
0000000145c5cb28 4c8b85d0000000                 mov r8, qword ptr [rbp + 0xd0]
0000000145c5cb2f e90fffffff                     jmp 0x145c5ca43
0000000145c5cb34 4531ff                         xor r15d, r15d
0000000145c5cb37 c685e700000000                 mov byte ptr [rbp + 0xe7], 0
0000000145c5cb3e 4c89f9                         mov rcx, r15
0000000145c5cb41 4c89e2                         mov rdx, r12
0000000145c5cb44 e872755300                     call 0x1461940bb
0000000145c5cb49 90                             nop
0000000145c5cb4a e9d4010000                     jmp 0x145c5cd23
0000000145c5cb4f b908000000                     mov ecx, 8
0000000145c5cb54 31c0                           xor eax, eax
0000000145c5cb56 31d2                           xor edx, edx
0000000145c5cb58 4889c3                         mov rbx, rax
0000000145c5cb5b 48c1e305                       shl rbx, 5
0000000145c5cb5f 4c8d2c19                       lea r13, [rcx + rbx]
0000000145c5cb63 48894d70                       mov qword ptr [rbp + 0x70], rcx
0000000145c5cb67 488995c0000000                 mov qword ptr [rbp + 0xc0], rdx
0000000145c5cb6e 48899580000000                 mov qword ptr [rbp + 0x80], rdx
0000000145c5cb75 4c89ad88000000                 mov qword ptr [rbp + 0x88], r13
0000000145c5cb7c 48898dd8000000                 mov qword ptr [rbp + 0xd8], rcx
0000000145c5cb83 4989cc                         mov r12, rcx
0000000145c5cb86 4885c0                         test rax, rax
0000000145c5cb89 0f84ea000000                   je 0x145c5cc79
0000000145c5cb8f 488b85d8000000                 mov rax, qword ptr [rbp + 0xd8]
0000000145c5cb96 4883c020                       add rax, 0x20
0000000145c5cb9a 4c8d75a8                       lea r14, [rbp - 0x58]
0000000145c5cb9e 4c8d7dd0                       lea r15, [rbp - 0x30]
0000000145c5cba2 eb2a                           jmp 0x145c5cbce
0000000145c5cba4 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145c5cbb0 4c89f9                         mov rcx, r15
0000000145c5cbb3 e8585dffff                     call 0x145c52910
0000000145c5cbb8 4c8ba5d0000000                 mov r12, qword ptr [rbp + 0xd0]
0000000145c5cbbf 498d442420                     lea rax, [r12 + 0x20]
0000000145c5cbc4 4883c3e0                       add rbx, -0x20
0000000145c5cbc8 0f84ab000000                   je 0x145c5cc79
0000000145c5cbce 4989c4                         mov r12, rax
0000000145c5cbd1 488b40e8                       mov rax, qword ptr [rax - 0x18]
0000000145c5cbd5 4883f8ff                       cmp rax, -1
0000000145c5cbd9 0f849a000000                   je 0x145c5cc79
0000000145c5cbdf 418b4c24e0                     mov ecx, dword ptr [r12 - 0x20]
0000000145c5cbe4 4c89a5d0000000                 mov qword ptr [rbp + 0xd0], r12
0000000145c5cbeb f3410f6f4424f0                 movdqu xmm0, xmmword ptr [r12 - 0x10]
0000000145c5cbf2 660f7f45c0                     movdqa xmmword ptr [rbp - 0x40], xmm0
0000000145c5cbf7 894df0                         mov dword ptr [rbp - 0x10], ecx
0000000145c5cbfa 488945d8                       mov qword ptr [rbp - 0x28], rax
0000000145c5cbfe 488d45e0                       lea rax, [rbp - 0x20]
0000000145c5cc02 f30f7f00                       movdqu xmmword ptr [rax], xmm0
0000000145c5cc06 48b80500000000000080           movabs rax, 0x8000000000000005
0000000145c5cc10 488945d0                       mov qword ptr [rbp - 0x30], rax
0000000145c5cc14 48837e60ff                     cmp qword ptr [rsi + 0x60], -1
0000000145c5cc19 7435                           je 0x145c5cc50
0000000145c5cc1b 4c8ba630010000                 mov r12, qword ptr [rsi + 0x130]
0000000145c5cc22 488bbe38010000                 mov rdi, qword ptr [rsi + 0x138]
0000000145c5cc29 4c89f1                         mov rcx, r14
0000000145c5cc2c 4c89fa                         mov rdx, r15
0000000145c5cc2f e80ceb1e00                     call 0x145e4b740
0000000145c5cc34 90                             nop
0000000145c5cc35 4c89e1                         mov rcx, r12
0000000145c5cc38 4c89f2                         mov rdx, r14
0000000145c5cc3b ff5718                         call qword ptr [rdi + 0x18]
0000000145c5cc3e 90                             nop
0000000145c5cc3f e96cffffff                     jmp 0x145c5cbb0
0000000145c5cc44 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145c5cc50 4c8ba680010000                 mov r12, qword ptr [rsi + 0x180]
0000000145c5cc57 488bbe88010000                 mov rdi, qword ptr [rsi + 0x188]
0000000145c5cc5e 4c89f1                         mov rcx, r14
0000000145c5cc61 4c89fa                         mov rdx, r15
0000000145c5cc64 e8d7ea1e00                     call 0x145e4b740
0000000145c5cc69 90                             nop
0000000145c5cc6a 4c89e1                         mov rcx, r12
0000000145c5cc6d 4c89f2                         mov rdx, r14
0000000145c5cc70 ff5718                         call qword ptr [rdi + 0x18]
0000000145c5cc73 90                             nop
0000000145c5cc74 e937ffffff                     jmp 0x145c5cbb0
0000000145c5cc79 4c896578                       mov qword ptr [rbp + 0x78], r12
0000000145c5cc7d 4d29e5                         sub r13, r12
0000000145c5cc80 488bb5d8000000                 mov rsi, qword ptr [rbp + 0xd8]
0000000145c5cc87 488bbdc0000000                 mov rdi, qword ptr [rbp + 0xc0]
0000000145c5cc8e 7434                           je 0x145c5ccc4
0000000145c5cc90 49c1ed05                       shr r13, 5
0000000145c5cc94 4983c410                       add r12, 0x10
0000000145c5cc98 eb0f                           jmp 0x145c5cca9
0000000145c5cc9a 660f1f440000                   nop word ptr [rax + rax]
0000000145c5cca0 4983c420                       add r12, 0x20
0000000145c5cca4 49ffcd                         dec r13
0000000145c5cca7 741b                           je 0x145c5ccc4
0000000145c5cca9 498b5424f8                     mov rdx, qword ptr [r12 - 8]
0000000145c5ccae 4885d2                         test rdx, rdx
0000000145c5ccb1 74ed                           je 0x145c5cca0
0000000145c5ccb3 498b0c24                       mov rcx, qword ptr [r12]
0000000145c5ccb7 41b801000000                   mov r8d, 1
0000000145c5ccbd e80e553afa                     call 0x1400021d0
0000000145c5ccc2 ebdc                           jmp 0x145c5cca0
0000000145c5ccc4 4885ff                         test rdi, rdi
0000000145c5ccc7 7415                           je 0x145c5ccde
0000000145c5ccc9 48c1e705                       shl rdi, 5
0000000145c5cccd 41b808000000                   mov r8d, 8
0000000145c5ccd3 4889f1                         mov rcx, rsi
0000000145c5ccd6 4889fa                         mov rdx, rdi
0000000145c5ccd9 e8f2543afa                     call 0x1400021d0
0000000145c5ccde 0f28b5f0000000                 movaps xmm6, xmmword ptr [rbp + 0xf0]
0000000145c5cce5 4881c488010000                 add rsp, 0x188
0000000145c5ccec 5b                             pop rbx
0000000145c5cced 5f                             pop rdi
0000000145c5ccee 5e                             pop rsi
0000000145c5ccef 415c                           pop r12
0000000145c5ccf1 415d                           pop r13
0000000145c5ccf3 415e                           pop r14
0000000145c5ccf5 415f                           pop r15
0000000145c5ccf7 5d                             pop rbp
0000000145c5ccf8 c3                             ret
0000000145c5ccf9 488b95a8000000                 mov rdx, qword ptr [rbp + 0xa8]
0000000145c5cd00 488b8db0000000                 mov rcx, qword ptr [rbp + 0xb0]
0000000145c5cd07 488b85b8000000                 mov rax, qword ptr [rbp + 0xb8]
0000000145c5cd0e e945feffff                     jmp 0x145c5cb58
0000000145c5cd13 b901000000                     mov ecx, 1
0000000145c5cd18 ba01000000                     mov edx, 1
0000000145c5cd1d e87f735300                     call 0x1461940a1
0000000145c5cd22 90                             nop
0000000145c5cd23 0f0b                           ud2
