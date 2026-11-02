0000000145cb827e 4889bd48010000                 mov qword ptr [rbp + 0x148], rdi
0000000145cb8285 488b8598010000                 mov rax, qword ptr [rbp + 0x198]
0000000145cb828c 48898550030000                 mov qword ptr [rbp + 0x350], rax
0000000145cb8293 488b85a0010000                 mov rax, qword ptr [rbp + 0x1a0]
0000000145cb829a 48898530030000                 mov qword ptr [rbp + 0x330], rax
0000000145cb82a1 488d8598010000                 lea rax, [rbp + 0x198]
0000000145cb82a8 0f104060                       movups xmm0, xmmword ptr [rax + 0x60]
0000000145cb82ac 0f2985a0000000                 movaps xmmword ptr [rbp + 0xa0], xmm0
0000000145cb82b3 0f104050                       movups xmm0, xmmword ptr [rax + 0x50]
0000000145cb82b7 0f298590000000                 movaps xmmword ptr [rbp + 0x90], xmm0
0000000145cb82be f30f6f4010                     movdqu xmm0, xmmword ptr [rax + 0x10]
0000000145cb82c3 f30f6f4820                     movdqu xmm1, xmmword ptr [rax + 0x20]
0000000145cb82c8 f30f6f5030                     movdqu xmm2, xmmword ptr [rax + 0x30]
0000000145cb82cd 0f105840                       movups xmm3, xmmword ptr [rax + 0x40]
0000000145cb82d1 0f299d80000000                 movaps xmmword ptr [rbp + 0x80], xmm3
0000000145cb82d8 660f7f5570                     movdqa xmmword ptr [rbp + 0x70], xmm2
0000000145cb82dd 660f7f4d60                     movdqa xmmword ptr [rbp + 0x60], xmm1
0000000145cb82e2 660f7f4550                     movdqa xmmword ptr [rbp + 0x50], xmm0
0000000145cb82e7 488b8d00030000                 mov rcx, qword ptr [rbp + 0x300]
0000000145cb82ee 488b01                         mov rax, qword ptr [rcx]
0000000145cb82f1 48c701ffffffff                 mov qword ptr [rcx], 0xffffffffffffffff
0000000145cb82f8 4883f8ff                       cmp rax, -1
0000000145cb82fc 746b                           je 0x145cb8369
0000000145cb82fe 48898510020000                 mov qword ptr [rbp + 0x210], rax
0000000145cb8305 41b8e0000000                   mov r8d, 0xe0
0000000145cb830b 488d8d18020000                 lea rcx, [rbp + 0x218]
0000000145cb8312 488b9510010000                 mov rdx, qword ptr [rbp + 0x110]
0000000145cb8319 e8fd933a00                     call 0x14606171b
0000000145cb831e 488bbde0020000                 mov rdi, qword ptr [rbp + 0x2e0]
0000000145cb8325 488b9de8020000                 mov rbx, qword ptr [rbp + 0x2e8]
0000000145cb832c 488d8d50010000                 lea rcx, [rbp + 0x150]
0000000145cb8333 488d152ed87201                 lea rdx, [rip + 0x172d82e]
0000000145cb833a e8d1922000                     call 0x145ec1610
0000000145cb833f 90                             nop 
0000000145cb8340 4889f9                         mov rcx, rdi
0000000145cb8343 488d9550010000                 lea rdx, [rbp + 0x150]
0000000145cb834a ff5318                         call qword ptr [rbx + 0x18]
0000000145cb834d 90                             nop 
0000000145cb834e 4889f9                         mov rcx, rdi
0000000145cb8351 ff5330                         call qword ptr [rbx + 0x30]
0000000145cb8354 90                             nop 
0000000145cb8355 c6855d03000001                 mov byte ptr [rbp + 0x35d], 1
0000000145cb835c 488d8d10020000                 lea rcx, [rbp + 0x210]
0000000145cb8363 e838dcffff                     call 0x145cb5fa0
0000000145cb8368 90                             nop 
0000000145cb8369 4983bc241002000000             cmp qword ptr [r12 + 0x210], 0
0000000145cb8372 0f84ca0c0000                   je 0x145cb9042
