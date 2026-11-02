0000000145bc28c0 55                             push rbp
0000000145bc28c1 4157                           push r15
0000000145bc28c3 4156                           push r14
0000000145bc28c5 4155                           push r13
0000000145bc28c7 4154                           push r12
0000000145bc28c9 56                             push rsi
0000000145bc28ca 57                             push rdi
0000000145bc28cb 53                             push rbx
0000000145bc28cc 4883ec58                       sub rsp, 0x58
0000000145bc28d0 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145bc28d5 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bc28dd 80ba2a0d000001                 cmp byte ptr [rdx + 0xd2a], 1
0000000145bc28e4 7548                           jne 0x145bc292e
0000000145bc28e6 4883ba180a000000               cmp qword ptr [rdx + 0xa18], 0
0000000145bc28ee 743e                           je 0x145bc292e
0000000145bc28f0 4c8bb2200b0000                 mov r14, qword ptr [rdx + 0xb20]
0000000145bc28f7 4a8d34f500000000               lea rsi, [r14*8]
0000000145bc28ff 4c89f0                         mov rax, r14
0000000145bc2902 48c1e83d                       shr rax, 0x3d
0000000145bc2906 0f95c0                         setne al
0000000145bc2909 49b8fcffffffffffff7f           movabs r8, 0x7ffffffffffffffc
0000000145bc2913 4c39c6                         cmp rsi, r8
0000000145bc2916 410f97c0                       seta r8b
0000000145bc291a 4108c0                         or r8b, al
0000000145bc291d 742a                           je 0x145bc2949
0000000145bc291f 31db                           xor ebx, ebx
0000000145bc2921 4889d9                         mov rcx, rbx
0000000145bc2924 4889f2                         mov rdx, rsi
0000000145bc2927 e88f175d00                     call 0x1461940bb
0000000145bc292c 0f0b                           ud2
0000000145bc292e 48c701ffffffff                 mov qword ptr [rcx], 0xffffffffffffffff
0000000145bc2935 4889c8                         mov rax, rcx
0000000145bc2938 4883c458                       add rsp, 0x58
0000000145bc293c 5b                             pop rbx
0000000145bc293d 5f                             pop rdi
0000000145bc293e 5e                             pop rsi
0000000145bc293f 415c                           pop r12
0000000145bc2941 415d                           pop r13
0000000145bc2943 415e                           pop r14
0000000145bc2945 415f                           pop r15
0000000145bc2947 5d                             pop rbp
0000000145bc2948 c3                             ret
0000000145bc2949 4989cf                         mov r15, rcx
0000000145bc294c 488bba180b0000                 mov rdi, qword ptr [rdx + 0xb18]
0000000145bc2953 4885f6                         test rsi, rsi
0000000145bc2956 4989d4                         mov r12, rdx
0000000145bc2959 0f8495000000                   je 0x145bc29f4
0000000145bc295f e89cf843fa                     call 0x140002200
0000000145bc2964 bb04000000                     mov ebx, 4
0000000145bc2969 ba04000000                     mov edx, 4
0000000145bc296e 4889f1                         mov rcx, rsi
0000000145bc2971 e84af843fa                     call 0x1400021c0
0000000145bc2976 4885c0                         test rax, rax
0000000145bc2979 74a6                           je 0x145bc2921
0000000145bc297b 4989c5                         mov r13, rax
0000000145bc297e 4c8975f8                       mov qword ptr [rbp - 8], r14
0000000145bc2982 4c89e2                         mov rdx, r12
0000000145bc2985 4d85f6                         test r14, r14
0000000145bc2988 7411                           je 0x145bc299b
0000000145bc298a 4c89e9                         mov rcx, r13
0000000145bc298d 4889fa                         mov rdx, rdi
0000000145bc2990 4989f0                         mov r8, rsi
0000000145bc2993 e883924200                     call 0x145febc1b
0000000145bc2998 4c89e2                         mov rdx, r12
0000000145bc299b 4c896df0                       mov qword ptr [rbp - 0x10], r13
0000000145bc299f 8bb2100d0000                   mov esi, dword ptr [rdx + 0xd10]
0000000145bc29a5 4881c2280b0000                 add rdx, 0xb28
0000000145bc29ac 488d4dd8                       lea rcx, [rbp - 0x28]
0000000145bc29b0 e8db5b0c00                     call 0x145c88590
0000000145bc29b5 90                             nop
0000000145bc29b6 4180bc246f03000003             cmp byte ptr [r12 + 0x36f], 3
0000000145bc29bf 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145bc29c3 4c89f9                         mov rcx, r15
0000000145bc29c6 49894728                       mov qword ptr [r15 + 0x28], rax
0000000145bc29ca 0f1045d8                       movups xmm0, xmmword ptr [rbp - 0x28]
0000000145bc29ce 410f114718                     movups xmmword ptr [r15 + 0x18], xmm0
0000000145bc29d3 488b45f8                       mov rax, qword ptr [rbp - 8]
0000000145bc29d7 498907                         mov qword ptr [r15], rax
0000000145bc29da 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145bc29de 49894708                       mov qword ptr [r15 + 8], rax
0000000145bc29e2 4d897710                       mov qword ptr [r15 + 0x10], r14
0000000145bc29e6 41897730                       mov dword ptr [r15 + 0x30], esi
0000000145bc29ea 410f934734                     setae byte ptr [r15 + 0x34]
0000000145bc29ef e941ffffff                     jmp 0x145bc2935
0000000145bc29f4 41bd04000000                   mov r13d, 4
0000000145bc29fa 48c745f800000000               mov qword ptr [rbp - 8], 0
0000000145bc2a02 4d85f6                         test r14, r14
0000000145bc2a05 7583                           jne 0x145bc298a
0000000145bc2a07 eb92                           jmp 0x145bc299b
