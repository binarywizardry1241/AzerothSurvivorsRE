0000000145e0d104 488d4d50                       lea rcx, [rbp + 0x50]
0000000145e0d108 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145e0d10f e82c150000                     call 0x145e0e640
0000000145e0d114 448b6550                       mov r12d, dword ptr [rbp + 0x50]
0000000145e0d118 448b7d54                       mov r15d, dword ptr [rbp + 0x54]
0000000145e0d11c 488b7d58                       mov rdi, qword ptr [rbp + 0x58]
0000000145e0d120 488b4560                       mov rax, qword ptr [rbp + 0x60]
0000000145e0d124 48898598010000                 mov qword ptr [rbp + 0x198], rax
0000000145e0d12b 48ba0200000000000080           movabs rdx, 0x8000000000000002
0000000145e0d135 e931080000                     jmp 0x145e0d96b
