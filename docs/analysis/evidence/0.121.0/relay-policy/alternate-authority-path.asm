0000000145c58c39 488bb500030000                 mov rsi, qword ptr [rbp + 0x300]
0000000145c58c40 4829de                         sub rsi, rbx
0000000145c58c43 488b8510030000                 mov rax, qword ptr [rbp + 0x310]
0000000145c58c4a 4801c3                         add rbx, rax
0000000145c58c4d 488945c8                       mov qword ptr [rbp - 0x38], rax
0000000145c58c51 4c8945d0                       mov qword ptr [rbp - 0x30], r8
0000000145c58c55 48899dd0010000                 mov qword ptr [rbp + 0x1d0], rbx
0000000145c58c5c 4889b5d8010000                 mov qword ptr [rbp + 0x1d8], rsi
0000000145c58c63 48c785e001000000000000         mov qword ptr [rbp + 0x1e0], 0
0000000145c58c6e 4889b5e8010000                 mov qword ptr [rbp + 0x1e8], rsi
0000000145c58c75 c685f801000001                 mov byte ptr [rbp + 0x1f8], 1
0000000145c58c7c 48b82f0000002f000000           movabs rax, 0x2f0000002f
0000000145c58c86 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145c58c8d 488d8d90000000                 lea rcx, [rbp + 0x90]
0000000145c58c94 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000145c58c9b e810ca0000                     call 0x145c656b0
0000000145c58ca0 90                             nop
0000000145c58ca1 80bd9000000000                 cmp byte ptr [rbp + 0x90], 0
0000000145c58ca8 741c                           je 0x145c58cc6
0000000145c58caa 488b9598000000                 mov rdx, qword ptr [rbp + 0x98]
0000000145c58cb1 488b85a0000000                 mov rax, qword ptr [rbp + 0xa0]
0000000145c58cb8 4829c6                         sub rsi, rax
0000000145c58cbb 4801d8                         add rax, rbx
0000000145c58cbe 4889f1                         mov rcx, rsi
0000000145c58cc1 4889d6                         mov rsi, rdx
0000000145c58cc4 eb07                           jmp 0x145c58ccd
0000000145c58cc6 b801000000                     mov eax, 1
0000000145c58ccb 31c9                           xor ecx, ecx
0000000145c58ccd 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145c58cd1 48894d20                       mov qword ptr [rbp + 0x20], rcx
0000000145c58cd5 4989f0                         mov r8, rsi
0000000145c58cd8 eb0f                           jmp 0x145c58ce9
0000000145c58cda 660f1f440000                   nop word ptr [rax + rax]
0000000145c58ce0 4939f0                         cmp r8, rsi
0000000145c58ce3 0f8781000000                   ja 0x145c58d6a
0000000145c58ce9 b13a                           mov cl, 0x3a
0000000145c58ceb 4889da                         mov rdx, rbx
0000000145c58cee e89de73600                     call 0x145fc7490
0000000145c58cf3 90                             nop
0000000145c58cf4 4883f801                       cmp rax, 1
0000000145c58cf8 7570                           jne 0x145c58d6a
0000000145c58cfa 4989d0                         mov r8, rdx
0000000145c58cfd 4839f2                         cmp rdx, rsi
0000000145c58d00 73de                           jae 0x145c58ce0
0000000145c58d02 42803c033a                     cmp byte ptr [rbx + r8], 0x3a
0000000145c58d07 75d7                           jne 0x145c58ce0
0000000145c58d09 48895d00                       mov qword ptr [rbp], rbx
0000000145c58d0d 4c894508                       mov qword ptr [rbp + 8], r8
0000000145c58d11 488d45c8                       lea rax, [rbp - 0x38]
0000000145c58d15 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000145c58d1c 488d0d9d933afa                 lea rcx, [rip - 0x5c56c63]
0000000145c58d23 48898dd8010000                 mov qword ptr [rbp + 0x1d8], rcx
0000000145c58d2a 4889e8                         mov rax, rbp
0000000145c58d2d 488985e0010000                 mov qword ptr [rbp + 0x1e0], rax
0000000145c58d34 48898de8010000                 mov qword ptr [rbp + 0x1e8], rcx
0000000145c58d3b 488d4518                       lea rax, [rbp + 0x18]
0000000145c58d3f 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145c58d46 48898df8010000                 mov qword ptr [rbp + 0x1f8], rcx
0000000145c58d4d 488d8d90000000                 lea rcx, [rbp + 0x90]
0000000145c58d54 488d1590b4a301                 lea rdx, [rip + 0x1a3b490]
0000000145c58d5b 4c8d85d0010000                 lea r8, [rbp + 0x1d0]
0000000145c58d62 e8095c3600                     call 0x145fbe970
0000000145c58d67 90                             nop
0000000145c58d68 eb0b                           jmp 0x145c58d75
0000000145c58d6a 48c78590000000ffffffff         mov qword ptr [rbp + 0x90], 0xffffffffffffffff
