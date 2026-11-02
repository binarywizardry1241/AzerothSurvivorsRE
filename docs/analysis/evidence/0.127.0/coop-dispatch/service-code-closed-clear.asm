0000000145bb3b3c 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb3b43 488338ff                       cmp qword ptr [rax], -1
0000000145bb3b47 0f8444010000                   je 0x145bb3c91
0000000145bb3b4d 4989fc                         mov r12, rdi
0000000145bb3b50 488b85f00c0000                 mov rax, qword ptr [rbp + 0xcf0]
0000000145bb3b57 488b10                         mov rdx, qword ptr [rax]
0000000145bb3b5a 4883faff                       cmp rdx, -1
0000000145bb3b5e 7425                           je 0x145bb3b85
0000000145bb3b60 4885d2                         test rdx, rdx
0000000145bb3b63 7420                           je 0x145bb3b85
0000000145bb3b65 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb3b6c 488b8850190000                 mov rcx, qword ptr [rax + 0x1950]
0000000145bb3b73 41b801000000                   mov r8d, 1
0000000145bb3b79 e852e644fa                     call 0x1400021d0
0000000145bb3b7e 4c8b85600d0000                 mov r8, qword ptr [rbp + 0xd60]
0000000145bb3b85 488bbd800d0000                 mov rdi, qword ptr [rbp + 0xd80]
0000000145bb3b8c 48c78748190000ffffffff         mov qword ptr [rdi + 0x1948], 0xffffffffffffffff
