0000000145bb3790 488b85500d0000                 mov rax, qword ptr [rbp + 0xd50]
0000000145bb3797 488985b00c0000                 mov qword ptr [rbp + 0xcb0], rax
0000000145bb379e 4c89a5b80c0000                 mov qword ptr [rbp + 0xcb8], r12
0000000145bb37a5 4c8985c00c0000                 mov qword ptr [rbp + 0xcc0], r8
0000000145bb37ac 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb37b3 488338ff                       cmp qword ptr [rax], -1
0000000145bb37b7 0f8428050000                   je 0x145bb3ce5
0000000145bb37bd 488d8d00030000                 lea rcx, [rbp + 0x300]
0000000145bb37c4 488d95b00c0000                 lea rdx, [rbp + 0xcb0]
0000000145bb37cb e860114800                     call 0x146034930
0000000145bb37d0 90                             nop 
0000000145bb37d1 488b85f00c0000                 mov rax, qword ptr [rbp + 0xcf0]
0000000145bb37d8 488b10                         mov rdx, qword ptr [rax]
0000000145bb37db 4883faff                       cmp rdx, -1
0000000145bb37df 741e                           je 0x145bb37ff
0000000145bb37e1 4885d2                         test rdx, rdx
0000000145bb37e4 7419                           je 0x145bb37ff
0000000145bb37e6 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb37ed 488b8850190000                 mov rcx, qword ptr [rax + 0x1950]
0000000145bb37f4 41b801000000                   mov r8d, 1
0000000145bb37fa e8d1e944fa                     call 0x1400021d0
0000000145bb37ff 488b8510030000                 mov rax, qword ptr [rbp + 0x310]
0000000145bb3806 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145bb380d 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb3811 0f108500030000                 movups xmm0, xmmword ptr [rbp + 0x300]
0000000145bb3818 0f1101                         movups xmmword ptr [rcx], xmm0
