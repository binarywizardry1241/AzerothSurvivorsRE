0000000145b2b3fc 48837dc000                     cmp qword ptr [rbp - 0x40], 0
0000000145b2b401 742b                           je 0x145b2b42e
0000000145b2b403 488d8df00c0000                 lea rcx, [rbp + 0xcf0]
0000000145b2b40a e8c1350500                     call 0x145b7e9d0
0000000145b2b40f 90                             nop
0000000145b2b410 488b8e00110000                 mov rcx, qword ptr [rsi + 0x1100]
0000000145b2b417 488b9608110000                 mov rdx, qword ptr [rsi + 0x1108]
0000000145b2b41e 4c8d8df00c0000                 lea r9, [rbp + 0xcf0]
0000000145b2b425 4989d8                         mov r8, rbx
0000000145b2b428 e8737ffeff                     call 0x145b133a0
0000000145b2b42d 90                             nop
0000000145b2b42e 488d8d08280000                 lea rcx, [rbp + 0x2808]
0000000145b2b435 488d55b0                       lea rdx, [rbp - 0x50]
0000000145b2b439 e8d2970b00                     call 0x145be4c10
0000000145b2b43e 90                             nop
0000000145b2b43f c7856028000000000000           mov dword ptr [rbp + 0x2860], 0
0000000145b2b449 48c7854828000000000000         mov qword ptr [rbp + 0x2848], 0
0000000145b2b454 48c7855028000001000000         mov qword ptr [rbp + 0x2850], 1
0000000145b2b45f 48c7855828000000000000         mov qword ptr [rbp + 0x2858], 0
0000000145b2b46a 488bbd10280000                 mov rdi, qword ptr [rbp + 0x2810]
0000000145b2b471 4c8b8518280000                 mov r8, qword ptr [rbp + 0x2818]
0000000145b2b478 c6858e28000001                 mov byte ptr [rbp + 0x288e], 1
0000000145b2b47f 488d8d48280000                 lea rcx, [rbp + 0x2848]
0000000145b2b486 4889fa                         mov rdx, rdi
0000000145b2b489 e8926d0100                     call 0x145b42220
0000000145b2b48e 90                             nop
0000000145b2b48f 83bd6028000000                 cmp dword ptr [rbp + 0x2860], 0
0000000145b2b496 7461                           je 0x145b2b4f9
0000000145b2b498 0f108548280000                 movups xmm0, xmmword ptr [rbp + 0x2848]
0000000145b2b49f 0f108d58280000                 movups xmm1, xmmword ptr [rbp + 0x2858]
0000000145b2b4a6 0f298d000d0000                 movaps xmmword ptr [rbp + 0xd00], xmm1
0000000145b2b4ad 0f2985f00c0000                 movaps xmmword ptr [rbp + 0xcf0], xmm0
0000000145b2b4b4 c6858e28000000                 mov byte ptr [rbp + 0x288e], 0
0000000145b2b4bb 488d8d281a0000                 lea rcx, [rbp + 0x1a28]
0000000145b2b4c2 488d95f00c0000                 lea rdx, [rbp + 0xcf0]
0000000145b2b4c9 e862780100                     call 0x145b42d30
0000000145b2b4ce 90                             nop
0000000145b2b4cf 488b8e00110000                 mov rcx, qword ptr [rsi + 0x1100]
0000000145b2b4d6 488b9608110000                 mov rdx, qword ptr [rsi + 0x1108]
0000000145b2b4dd c6858e28000000                 mov byte ptr [rbp + 0x288e], 0
0000000145b2b4e4 4c8d8d281a0000                 lea r9, [rbp + 0x1a28]
0000000145b2b4eb 4989d8                         mov r8, rbx
0000000145b2b4ee e8ad7efeff                     call 0x145b133a0
0000000145b2b4f3 90                             nop
0000000145b2b4f4 4531f6                         xor r14d, r14d
0000000145b2b4f7 eb03                           jmp 0x145b2b4fc
0000000145b2b4f9 41b601                         mov r14b, 1
0000000145b2b4fc 4488b58e280000                 mov byte ptr [rbp + 0x288e], r14b
0000000145b2b503 488d8df00c0000                 lea rcx, [rbp + 0xcf0]
0000000145b2b50a 4889f2                         mov rdx, rsi
0000000145b2b50d e86e1b0000                     call 0x145b2d080
