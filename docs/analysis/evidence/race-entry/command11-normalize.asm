0000000145b1bd86  488b8580260000         mov rax, qword ptr [rbp + 0x2680]
0000000145b1bd8d  0f104008               movups xmm0, xmmword ptr [rax + 8]
0000000145b1bd91  0f104818               movups xmm1, xmmword ptr [rax + 0x18]
0000000145b1bd95  0f105028               movups xmm2, xmmword ptr [rax + 0x28]
0000000145b1bd99  0f105838               movups xmm3, xmmword ptr [rax + 0x38]
0000000145b1bd9d  0f295de0               movaps xmmword ptr [rbp - 0x20], xmm3
0000000145b1bda1  0f2955d0               movaps xmmword ptr [rbp - 0x30], xmm2
0000000145b1bda5  0f294dc0               movaps xmmword ptr [rbp - 0x40], xmm1
0000000145b1bda9  0f2945b0               movaps xmmword ptr [rbp - 0x50], xmm0
0000000145b1bdad  488d8d400c0000         lea rcx, [rbp + 0xc40]
0000000145b1bdb4  488d55b0               lea rdx, [rbp - 0x50]
0000000145b1bdb8  e8a3c3f7ff             call 0x145a98160
0000000145b1bdbd  90                     nop
0000000145b1bdbe  488dbe20100000         lea rdi, [rsi + 0x1020]
0000000145b1bdc5  488d8dd0180000         lea rcx, [rbp + 0x18d0]
0000000145b1bdcc  4c8d85400c0000         lea r8, [rbp + 0xc40]
0000000145b1bdd3  4889fa                 mov rdx, rdi
0000000145b1bdd6  e8e5f6f6ff             call 0x145a8b4c0
