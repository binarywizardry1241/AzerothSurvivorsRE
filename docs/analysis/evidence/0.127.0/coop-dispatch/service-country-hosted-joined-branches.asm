0000000145cb8046 488b8598010000                 mov rax, qword ptr [rbp + 0x198]
0000000145cb804d 48898550030000                 mov qword ptr [rbp + 0x350], rax
0000000145cb8054 488b85a0010000                 mov rax, qword ptr [rbp + 0x1a0]
0000000145cb805b 48898530030000                 mov qword ptr [rbp + 0x330], rax
0000000145cb8062 488bbda8010000                 mov rdi, qword ptr [rbp + 0x1a8]
0000000145cb8069 41c684242802000001             mov byte ptr [r12 + 0x228], 1
0000000145cb8072 4983bc241002000000             cmp qword ptr [r12 + 0x210], 0
0000000145cb807b 0f84c90a0000                   je 0x145cb8b4a
0000000145cb8081 488b8d20030000                 mov rcx, qword ptr [rbp + 0x320]
0000000145cb8088 e883d4edff                     call 0x145b95510
0000000145cb808d 90                             nop 
0000000145cb808e 4c8ba548030000                 mov r12, qword ptr [rbp + 0x348]
0000000145cb8095 498b9c2400020000               mov rbx, qword ptr [r12 + 0x200]
0000000145cb809d 4885db                         test rbx, rbx
0000000145cb80a0 0f848e0a0000                   je 0x145cb8b34
0000000145cb80a6 488b8520030000                 mov rax, qword ptr [rbp + 0x320]
0000000145cb80ad 488b08                         mov rcx, qword ptr [rax]
0000000145cb80b0 4c8d4311                       lea r8, [rbx + 0x11]
0000000145cb80b4 b2ff                           mov dl, 0xff
0000000145cb80b6 e872963a00                     call 0x14606172d
0000000145cb80bb 488d4301                       lea rax, [rbx + 1]
0000000145cb80bf 4889c1                         mov rcx, rax
0000000145cb80c2 48c1e903                       shr rcx, 3
0000000145cb80c6 4883e0f8                       and rax, 0xfffffffffffffff8
0000000145cb80ca 4829c8                         sub rax, rcx
0000000145cb80cd 4883fb08                       cmp rbx, 8
0000000145cb80d1 480f42c3                       cmovb rax, rbx
0000000145cb80d5 e95c0a0000                     jmp 0x145cb8b36
0000000145cb80da 488b8598010000                 mov rax, qword ptr [rbp + 0x198]
0000000145cb80e1 48898550030000                 mov qword ptr [rbp + 0x350], rax
0000000145cb80e8 488b85a0010000                 mov rax, qword ptr [rbp + 0x1a0]
0000000145cb80ef 48898530030000                 mov qword ptr [rbp + 0x330], rax
0000000145cb80f6 488b9da8010000                 mov rbx, qword ptr [rbp + 0x1a8]
0000000145cb80fd 4983bc241002000000             cmp qword ptr [r12 + 0x210], 0
0000000145cb8106 0f84d20a0000                   je 0x145cb8bde
0000000145cb810c 488b8d20030000                 mov rcx, qword ptr [rbp + 0x320]
0000000145cb8113 e8f8d3edff                     call 0x145b95510
0000000145cb8118 90                             nop 
0000000145cb8119 4c8ba548030000                 mov r12, qword ptr [rbp + 0x348]
0000000145cb8120 498bbc2400020000               mov rdi, qword ptr [r12 + 0x200]
0000000145cb8128 4885ff                         test rdi, rdi
0000000145cb812b 0f84970a0000                   je 0x145cb8bc8
0000000145cb8131 488b8520030000                 mov rax, qword ptr [rbp + 0x320]
0000000145cb8138 488b08                         mov rcx, qword ptr [rax]
0000000145cb813b 4c8d4711                       lea r8, [rdi + 0x11]
0000000145cb813f b2ff                           mov dl, 0xff
0000000145cb8141 e8e7953a00                     call 0x14606172d
0000000145cb8146 488d4701                       lea rax, [rdi + 1]
0000000145cb814a 4889c1                         mov rcx, rax
0000000145cb814d 48c1e903                       shr rcx, 3
0000000145cb8151 4883e0f8                       and rax, 0xfffffffffffffff8
0000000145cb8155 4829c8                         sub rax, rcx
0000000145cb8158 4883ff08                       cmp rdi, 8
0000000145cb815c 480f42c7                       cmovb rax, rdi
0000000145cb8160 e9650a0000                     jmp 0x145cb8bca
