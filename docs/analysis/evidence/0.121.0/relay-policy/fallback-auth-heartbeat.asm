0000000145c596a9 488b8570010000                 mov rax, qword ptr [rbp + 0x170]
0000000145c596b0 488985f0000000                 mov qword ptr [rbp + 0xf0], rax
0000000145c596b7 0f108560010000                 movups xmm0, xmmword ptr [rbp + 0x160]
0000000145c596be 0f2985e0000000                 movaps xmmword ptr [rbp + 0xe0], xmm0
0000000145c596c5 0f108dd0010000                 movups xmm1, xmmword ptr [rbp + 0x1d0]
0000000145c596cc 0f118df8000000                 movups xmmword ptr [rbp + 0xf8], xmm1
0000000145c596d3 488b85e0010000                 mov rax, qword ptr [rbp + 0x1e0]
0000000145c596da 48898508010000                 mov qword ptr [rbp + 0x108], rax
0000000145c596e1 0f1185d8010000                 movups xmmword ptr [rbp + 0x1d8], xmm0
0000000145c596e8 488b85f0000000                 mov rax, qword ptr [rbp + 0xf0]
0000000145c596ef 488985e8010000                 mov qword ptr [rbp + 0x1e8], rax
0000000145c596f6 488b85f8000000                 mov rax, qword ptr [rbp + 0xf8]
0000000145c596fd 488985f0010000                 mov qword ptr [rbp + 0x1f0], rax
0000000145c59704 488b8500010000                 mov rax, qword ptr [rbp + 0x100]
0000000145c5970b 488985f8010000                 mov qword ptr [rbp + 0x1f8], rax
0000000145c59712 488b8508010000                 mov rax, qword ptr [rbp + 0x108]
0000000145c59719 48898500020000                 mov qword ptr [rbp + 0x200], rax
0000000145c59720 48899d08020000                 mov qword ptr [rbp + 0x208], rbx
0000000145c59727 4c89b510020000                 mov qword ptr [rbp + 0x210], r14
0000000145c5972e 48899d18020000                 mov qword ptr [rbp + 0x218], rbx
0000000145c59735 4c89ad20020000                 mov qword ptr [rbp + 0x220], r13
0000000145c5973c 48898d28020000                 mov qword ptr [rbp + 0x228], rcx
0000000145c59743 4489a530020000                 mov dword ptr [rbp + 0x230], r12d
0000000145c5974a 48b80a00000000000080           movabs rax, 0x800000000000000a
0000000145c59754 488985d0010000                 mov qword ptr [rbp + 0x1d0], rax
0000000145c5975b 488d8de0000000                 lea rcx, [rbp + 0xe0]
0000000145c59762 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000145c59769 e8d21f1f00                     call 0x145e4b740
0000000145c5976e 90                             nop
0000000145c5976f 488d95e0000000                 lea rdx, [rbp + 0xe0]
0000000145c59776 488b8dd0020000                 mov rcx, qword ptr [rbp + 0x2d0]
0000000145c5977d 488b85c8020000                 mov rax, qword ptr [rbp + 0x2c8]
0000000145c59784 ff5018                         call qword ptr [rax + 0x18]
0000000145c59787 90                             nop
0000000145c59788 488d8dd0010000                 lea rcx, [rbp + 0x1d0]
0000000145c5978f e87c91ffff                     call 0x145c52910
0000000145c59794 4c8ba520030000                 mov r12, qword ptr [rbp + 0x320]
0000000145c5979b 498bbc2430010000               mov rdi, qword ptr [r12 + 0x130]
0000000145c597a3 498bb42438010000               mov rsi, qword ptr [r12 + 0x138]
0000000145c597ab c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145c597b2 488d1597a7a301                 lea rdx, [rip + 0x1a3a797]
0000000145c597b9 488d8dd0010000                 lea rcx, [rbp + 0x1d0]
0000000145c597c0 e87b1f1f00                     call 0x145e4b740
0000000145c597c5 90                             nop
0000000145c597c6 488b4618                       mov rax, qword ptr [rsi + 0x18]
0000000145c597ca c6853003000001                 mov byte ptr [rbp + 0x330], 1
0000000145c597d1 488d95d0010000                 lea rdx, [rbp + 0x1d0]
0000000145c597d8 4889f9                         mov rcx, rdi
0000000145c597db ffd0                           call rax
0000000145c597dd 90                             nop
