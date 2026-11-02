00000001459994ad: 0f2845a0                       movaps xmm0, xmmword ptr [rbp - 0x60]
00000001459994b1: 0f284db0                       movaps xmm1, xmmword ptr [rbp - 0x50]
00000001459994b5: 0f298db0000000                 movaps xmmword ptr [rbp + 0xb0], xmm1
00000001459994bc: 0f2985a0000000                 movaps xmmword ptr [rbp + 0xa0], xmm0
00000001459994c3: c685e700000000                 mov byte ptr [rbp + 0xe7], 0
00000001459994ca: 488d4dc0                       lea rcx, [rbp - 0x40]
00000001459994ce: 4889f2                         mov rdx, rsi
00000001459994d1: 4c8d85a0000000                 lea r8, [rbp + 0xa0]
00000001459994d8: 4d89e1                         mov r9, r12
00000001459994db: e81007fdff                     call 0x145969bf0
