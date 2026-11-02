14594e7a3: 498b85a8050000 mov rax, qword ptr [r13 + 0x5a8]
14594e7aa: 4989cc mov r12, rcx
14594e7ad: 49c1e406 shl r12, 6
14594e7b1: f3420f10442008 movss xmm0, dword ptr [rax + r12 + 8]
14594e7b8: 0f2e8534020000 ucomiss xmm0, dword ptr [rbp + 0x234]
14594e7bf: 77cf ja 0x14594e790
