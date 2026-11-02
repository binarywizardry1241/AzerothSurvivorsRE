0000000145bb3a29 488b85500d0000                 mov rax, qword ptr [rbp + 0xd50]
0000000145bb3a30 488985b00c0000                 mov qword ptr [rbp + 0xcb0], rax
0000000145bb3a37 4c89a5b80c0000                 mov qword ptr [rbp + 0xcb8], r12
0000000145bb3a3e 4c8985c00c0000                 mov qword ptr [rbp + 0xcc0], r8
0000000145bb3a45 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb3a4c 488338ff                       cmp qword ptr [rax], -1
0000000145bb3a50 0f8400040000                   je 0x145bb3e56
0000000145bb3a56 488d8d00030000                 lea rcx, [rbp + 0x300]
0000000145bb3a5d 488d95b00c0000                 lea rdx, [rbp + 0xcb0]
0000000145bb3a64 e8c70e4800                     call 0x146034930
0000000145bb3a69 90                             nop 
0000000145bb3a6a 488b85f00c0000                 mov rax, qword ptr [rbp + 0xcf0]
0000000145bb3a71 488b10                         mov rdx, qword ptr [rax]
0000000145bb3a74 4883faff                       cmp rdx, -1
0000000145bb3a78 741e                           je 0x145bb3a98
0000000145bb3a7a 4885d2                         test rdx, rdx
0000000145bb3a7d 7419                           je 0x145bb3a98
0000000145bb3a7f 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb3a86 488b8850190000                 mov rcx, qword ptr [rax + 0x1950]
0000000145bb3a8d 41b801000000                   mov r8d, 1
0000000145bb3a93 e838e744fa                     call 0x1400021d0
0000000145bb3a98 488b8510030000                 mov rax, qword ptr [rbp + 0x310]
0000000145bb3a9f 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145bb3aa6 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb3aaa 0f108500030000                 movups xmm0, xmmword ptr [rbp + 0x300]
0000000145bb3ab1 0f1101                         movups xmmword ptr [rcx], xmm0
