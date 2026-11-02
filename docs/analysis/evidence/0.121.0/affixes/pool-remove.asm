0000000145c28fd8 4c39b5c8000000                 cmp qword ptr [rbp + 0xc8], r14
0000000145c28fdf 0f84e2010000                   je 0x145c291c7
0000000145c28fe5 4d8b46f8                       mov r8, qword ptr [r14 - 8]
0000000145c28fe9 488bbe58080000                 mov rdi, qword ptr [rsi + 0x858]
0000000145c28ff0 4939f8                         cmp r8, rdi
0000000145c28ff3 0f8349320000                   jae 0x145c2c242
0000000145c28ff9 488b8650080000                 mov rax, qword ptr [rsi + 0x850]
0000000145c29000 4c89c2                         mov rdx, r8
0000000145c29003 48c1e205                       shl rdx, 5
0000000145c29007 488d0c10                       lea rcx, [rax + rdx]
0000000145c2900b 4c8b3c10                       mov r15, qword ptr [rax + rdx]
0000000145c2900f 8b5c1008                       mov ebx, dword ptr [rax + rdx + 8]
0000000145c29013 4801c2                         add rdx, rax
0000000145c29016 4883c220                       add rdx, 0x20
0000000145c2901a 49f7d0                         not r8
0000000145c2901d 4901f8                         add r8, rdi
0000000145c29020 49c1e005                       shl r8, 5
0000000145c29024 e8042c3c00                     call 0x145febc2d
0000000145c29029 48ffcf                         dec rdi
0000000145c2902c 4889be58080000                 mov qword ptr [rsi + 0x858], rdi
0000000145c29033 4d85ff                         test r15, r15
0000000145c29036 0f8480000000                   je 0x145c290bc
0000000145c2903c e8bf913dfa                     call 0x140002200
0000000145c29041 b920000000                     mov ecx, 0x20
0000000145c29046 ba01000000                     mov edx, 1
0000000145c2904b e870913dfa                     call 0x1400021c0
0000000145c29050 4885c0                         test rax, rax
0000000145c29053 0f8419320000                   je 0x145c2c272
0000000145c29059 48898528010000                 mov qword ptr [rbp + 0x128], rax
0000000145c29060 4c8938                         mov qword ptr [rax], r15
0000000145c29063 488bbe80060000                 mov rdi, qword ptr [rsi + 0x680]
0000000145c2906a 483bbe70060000                 cmp rdi, qword ptr [rsi + 0x670]
0000000145c29071 750d                           jne 0x145c29080
0000000145c29073 488d8e70060000                 lea rcx, [rsi + 0x670]
0000000145c2907a e851363c00                     call 0x145fec6d0
0000000145c2907f 90                             nop
0000000145c29080 488b8678060000                 mov rax, qword ptr [rsi + 0x678]
0000000145c29087 4889f9                         mov rcx, rdi
0000000145c2908a 48c1e105                       shl rcx, 5
0000000145c2908e 48c7040820000000               mov qword ptr [rax + rcx], 0x20
0000000145c29096 488b9528010000                 mov rdx, qword ptr [rbp + 0x128]
0000000145c2909d 4889540808                     mov qword ptr [rax + rcx + 8], rdx
0000000145c290a2 48c744081008000000             mov qword ptr [rax + rcx + 0x10], 8
0000000145c290ab 66c7440818aa00                 mov word ptr [rax + rcx + 0x18], 0xaa
0000000145c290b2 48ffc7                         inc rdi
0000000145c290b5 4889be80060000                 mov qword ptr [rsi + 0x680], rdi
0000000145c290bc e83f913dfa                     call 0x140002200
0000000145c290c1 b901000000                     mov ecx, 1
0000000145c290c6 ba01000000                     mov edx, 1
0000000145c290cb e8f0903dfa                     call 0x1400021c0
0000000145c290d0 4885c0                         test rax, rax
0000000145c290d3 0f8484310000                   je 0x145c2c25d
0000000145c290d9 c6007b                         mov byte ptr [rax], 0x7b
0000000145c290dc 48c785d000000001000000         mov qword ptr [rbp + 0xd0], 1
0000000145c290e7 488985d8000000                 mov qword ptr [rbp + 0xd8], rax
0000000145c290ee 48c785e000000001000000         mov qword ptr [rbp + 0xe0], 1
0000000145c290f9 c685e800000001                 mov byte ptr [rbp + 0xe8], 1
0000000145c29100 488d056971a601                 lea rax, [rip + 0x1a67169]
0000000145c29107 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c2910c 48c744242805000000             mov qword ptr [rsp + 0x28], 5
0000000145c29115 41b904000000                   mov r9d, 4
0000000145c2911b 4c89e9                         mov rcx, r13
0000000145c2911e 4c89e2                         mov rdx, r12
0000000145c29121 4c8d05c068a601                 lea r8, [rip + 0x1a668c0]
0000000145c29128 e8c36be9ff                     call 0x145abfcf0
0000000145c2912d 90                             nop
0000000145c2912e 895c2420                       mov dword ptr [rsp + 0x20], ebx
0000000145c29132 41b902000000                   mov r9d, 2
0000000145c29138 4c89e1                         mov rcx, r12
0000000145c2913b 4c89ea                         mov rdx, r13
0000000145c2913e 4c8d053071a601                 lea r8, [rip + 0x1a67130]
0000000145c29145 e8a60ae9ff                     call 0x145ab9bf0
0000000145c2914a 90                             nop
0000000145c2914b 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145c29152 488bbde0000000                 mov rdi, qword ptr [rbp + 0xe0]
0000000145c29159 4839f8                         cmp rax, rdi
0000000145c2915c 743f                           je 0x145c2919d
0000000145c2915e 48898528010000                 mov qword ptr [rbp + 0x128], rax
0000000145c29165 488b85d8000000                 mov rax, qword ptr [rbp + 0xd8]
0000000145c2916c 48898520010000                 mov qword ptr [rbp + 0x120], rax
0000000145c29173 c604387d                       mov byte ptr [rax + rdi], 0x7d
0000000145c29177 488b9e98060000                 mov rbx, qword ptr [rsi + 0x698]
0000000145c2917e 483b9e88060000                 cmp rbx, qword ptr [rsi + 0x688]
0000000145c29185 0f8515feffff                   jne 0x145c28fa0
0000000145c2918b 488d8e88060000                 lea rcx, [rsi + 0x688]
0000000145c29192 e899323c00                     call 0x145fec430
0000000145c29197 90                             nop
0000000145c29198 e903feffff                     jmp 0x145c28fa0
0000000145c2919d 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145c291a6 41b801000000                   mov r8d, 1
0000000145c291ac 41b901000000                   mov r9d, 1
0000000145c291b2 4c89e1                         mov rcx, r12
0000000145c291b5 4889fa                         mov rdx, rdi
0000000145c291b8 e8d3313c00                     call 0x145fec390
0000000145c291bd 90                             nop
0000000145c291be 488b85d0000000                 mov rax, qword ptr [rbp + 0xd0]
0000000145c291c5 eb97                           jmp 0x145c2915e
0000000145c291c7 488b9518010000                 mov rdx, qword ptr [rbp + 0x118]
0000000145c291ce 4885d2                         test rdx, rdx
0000000145c291d1 7416                           je 0x145c291e9
0000000145c291d3 48c1e203                       shl rdx, 3
0000000145c291d7 41b808000000                   mov r8d, 8
0000000145c291dd 488b8dc8000000                 mov rcx, qword ptr [rbp + 0xc8]
0000000145c291e4 e8e78f3dfa                     call 0x1400021d0
