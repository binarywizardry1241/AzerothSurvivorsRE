0000000145c598e3 488b8570010000                 mov rax, qword ptr [rbp + 0x170]
0000000145c598ea 488985f0000000                 mov qword ptr [rbp + 0xf0], rax
0000000145c598f1 f30f6f8560010000               movdqu xmm0, xmmword ptr [rbp + 0x160]
0000000145c598f9 660f7f85e0000000               movdqa xmmword ptr [rbp + 0xe0], xmm0
0000000145c59901 f30f6f8dd0010000               movdqu xmm1, xmmword ptr [rbp + 0x1d0]
0000000145c59909 f30f7f8df8000000               movdqu xmmword ptr [rbp + 0xf8], xmm1
0000000145c59911 488b85e0010000                 mov rax, qword ptr [rbp + 0x1e0]
0000000145c59918 48898508010000                 mov qword ptr [rbp + 0x108], rax
0000000145c5991f f30f7f85d8010000               movdqu xmmword ptr [rbp + 0x1d8], xmm0
0000000145c59927 488b85f0000000                 mov rax, qword ptr [rbp + 0xf0]
0000000145c5992e 488985e8010000                 mov qword ptr [rbp + 0x1e8], rax
0000000145c59935 488b85f8000000                 mov rax, qword ptr [rbp + 0xf8]
0000000145c5993c 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145c59943 488b8500010000                 mov rax, qword ptr [rbp + 0x100]
0000000145c5994a 488985f8010000                 mov qword ptr [rbp + 0x1f8], rax
0000000145c59951 488b8508010000                 mov rax, qword ptr [rbp + 0x108]
0000000145c59958 48898500020000                 mov qword ptr [rbp + 0x200], rax
0000000145c5995f 4889b508020000                 mov qword ptr [rbp + 0x208], rsi
0000000145c59966 48899d10020000                 mov qword ptr [rbp + 0x210], rbx
0000000145c5996d 4889b518020000                 mov qword ptr [rbp + 0x218], rsi
0000000145c59974 4c89a520020000                 mov qword ptr [rbp + 0x220], r12
0000000145c5997b 4c89ad28020000                 mov qword ptr [rbp + 0x228], r13
0000000145c59982 4489bd30020000                 mov dword ptr [rbp + 0x230], r15d
0000000145c59989 48b80a00000000000080           movabs rax, 0x800000000000000a
0000000145c59993 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000145c5999a 488d8de0000000                 lea rcx, [rbp + 0xe0]
0000000145c599a1 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000145c599a8 e8931d1f00                     call 0x145e4b740
0000000145c599ad 90                             nop
0000000145c599ae 488d95e0000000                 lea rdx, [rbp + 0xe0]
0000000145c599b5 488b8dc8020000                 mov rcx, qword ptr [rbp + 0x2c8]
0000000145c599bc 488b85f8020000                 mov rax, qword ptr [rbp + 0x2f8]
0000000145c599c3 ff5018                         call qword ptr [rax + 0x18]
0000000145c599c6 90                             nop
0000000145c599c7 488d8dd0010000                 lea rcx, [rbp + 0x1d0]
0000000145c599ce e83d8fffff                     call 0x145c52910
0000000145c599d3 4c8ba520030000                 mov r12, qword ptr [rbp + 0x320]
0000000145c599da 498bb42430010000               mov rsi, qword ptr [r12 + 0x130]
0000000145c599e2 498bbc2438010000               mov rdi, qword ptr [r12 + 0x138]
0000000145c599ea c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c599f1 488d1558a5a301                 lea rdx, [rip + 0x1a3a558]
0000000145c599f8 488d8dd0010000                 lea rcx, [rbp + 0x1d0]
0000000145c599ff e83c1d1f00                     call 0x145e4b740
0000000145c59a04 90                             nop
0000000145c59a05 488b4718                       mov rax, qword ptr [rdi + 0x18]
0000000145c59a09 c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c59a10 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000145c59a17 4889f1                         mov rcx, rsi
0000000145c59a1a ffd0                           call rax
0000000145c59a1c 90                             nop
0000000145c59a1d c6853703000000                 mov byte ptr [rbp + 0x337], 0
0000000145c59a24 e8d7bd3300                     call 0x145f95800
0000000145c59a29 90                             nop
0000000145c59a2a 4989c3                         mov r11, rax
0000000145c59a2d 49898424f0000000               mov qword ptr [r12 + 0xf0], rax
0000000145c59a35 41899424f8000000               mov dword ptr [r12 + 0xf8], edx
0000000145c59a3d 4989842400010000               mov qword ptr [r12 + 0x100], rax
0000000145c59a45 4189942408010000               mov dword ptr [r12 + 0x108], edx
0000000145c59a4d 4989842410010000               mov qword ptr [r12 + 0x110], rax
0000000145c59a55 8995f8020000                   mov dword ptr [rbp + 0x2f8], edx
0000000145c59a5b 4189942418010000               mov dword ptr [r12 + 0x118], edx
0000000145c59a63 41c68424fa01000000             mov byte ptr [r12 + 0x1fa], 0
0000000145c59a6c 498b842498010000               mov rax, qword ptr [r12 + 0x198]
0000000145c59a74 498b8c24b0010000               mov rcx, qword ptr [r12 + 0x1b0]
0000000145c59a7c 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145c59a80 488d5010                       lea rdx, [rax + 0x10]
0000000145c59a84 66440fd7c0                     pmovmskb r8d, xmm0
0000000145c59a89 41f7d0                         not r8d
0000000145c59a8c eb25                           jmp 0x145c59ab3
0000000145c59a8e 6690                           nop
0000000145c59a90 458d48ff                       lea r9d, [r8 - 1]
0000000145c59a94 f3450fbcd0                     tzcnt r10d, r8d
0000000145c59a99 4521c1                         and r9d, r8d
0000000145c59a9c 49f7da                         neg r10
0000000145c59a9f 4f8d0452                       lea r8, [r10 + r10*2]
0000000145c59aa3 49c1e004                       shl r8, 4
0000000145c59aa7 42c64400f900                   mov byte ptr [rax + r8 - 7], 0
0000000145c59aad 48ffc9                         dec rcx
0000000145c59ab0 4589c8                         mov r8d, r9d
0000000145c59ab3 664585c0                       test r8w, r8w
0000000145c59ab7 75d7                           jne 0x145c59a90
0000000145c59ab9 4885c9                         test rcx, rcx
0000000145c59abc 7420                           je 0x145c59ade
0000000145c59abe 6690                           nop
0000000145c59ac0 660f6f02                       movdqa xmm0, xmmword ptr [rdx]
0000000145c59ac4 480500fdffff                   add rax, -0x300
0000000145c59aca 4883c210                       add rdx, 0x10
0000000145c59ace 66440fd7c0                     pmovmskb r8d, xmm0
0000000145c59ad3 4181f0ffff0000                 xor r8d, 0xffff
0000000145c59ada 74e4                           je 0x145c59ac0
0000000145c59adc ebb2                           jmp 0x145c59a90
