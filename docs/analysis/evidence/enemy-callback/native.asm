; constructor-selector 0x145bbf0b1..0x145bbf153 sha256 68688dbb3ad79627dcc463f41413b553f416045e01ac2ef2f62acb8f95721cba
0000000145bbf0b1  41807d4c00               cmp byte ptr [r13 + 0x4c], 0
0000000145bbf0b6  7522                     jne 0x145bbf0da
0000000145bbf0b8  f3440f100db356a301       movss xmm9, dword ptr [rip + 0x1a356b3]
0000000145bbf0c1  f30f5e3d97c15e00         divss xmm7, dword ptr [rip + 0x5ec197]
0000000145bbf0c9  f3440f102dce475b00       movss xmm13, dword ptr [rip + 0x5b47ce]
0000000145bbf0d2  450f28dd                 movaps xmm11, xmm13
0000000145bbf0d6  7422                     je 0x145bbf0fa
0000000145bbf0d8  eb29                     jmp 0x145bbf103
0000000145bbf0da  f3440f100d8d56a301       movss xmm9, dword ptr [rip + 0x1a3568d]
0000000145bbf0e3  f30f5e3d75c15e00         divss xmm7, dword ptr [rip + 0x5ec175]
0000000145bbf0eb  f3440f102dac475b00       movss xmm13, dword ptr [rip + 0x5b47ac]
0000000145bbf0f4  450f28dd                 movaps xmm11, xmm13
0000000145bbf0f8  7509                     jne 0x145bbf103
0000000145bbf0fa  f3440f101d017d6900       movss xmm11, dword ptr [rip + 0x697d01]
0000000145bbf103  488d05767e0300           lea rax, [rip + 0x37e76]
0000000145bbf10a  488d0dbf7e0300           lea rcx, [rip + 0x37ebf]
0000000145bbf111  480f45c8                 cmovne rcx, rax
0000000145bbf115  0fb7beda020000           movzx edi, word ptr [rsi + 0x2da]
0000000145bbf11c  440fb7a6dc020000         movzx r12d, word ptr [rsi + 0x2dc]
0000000145bbf124  f3450f594d30             mulss xmm9, dword ptr [r13 + 0x30]
0000000145bbf12a  0fb786de020000           movzx eax, word ptr [rsi + 0x2de]
0000000145bbf131  668985b6010000           mov word ptr [rbp + 0x1b6], ax
0000000145bbf138  f3450f1086e0000000       movss xmm8, dword ptr [r14 + 0xe0]
0000000145bbf141  f3440f5986540c0000       mulss xmm8, dword ptr [rsi + 0xc54]
0000000145bbf14a  0f28c7                   movaps xmm0, xmm7
0000000145bbf14d  410f28c8                 movaps xmm1, xmm8
0000000145bbf151  ffd1                     call rcx

; nonzero-flag-health-polynomial 0x145bf6f80..0x145bf6fc5 sha256 f8fe42259bae0476258a252d80d47a522d769fe1ac49307bfa203bc9fec72815
0000000145bf6f80  f30f10152c235900         movss xmm2, dword ptr [rip + 0x59232c]
0000000145bf6f88  f30f59d0                 mulss xmm2, xmm0
0000000145bf6f8c  f30f58150cc95700         addss xmm2, dword ptr [rip + 0x57c90c]
0000000145bf6f94  f30f101df4d89f01         movss xmm3, dword ptr [rip + 0x19fd8f4]
0000000145bf6f9c  f30f59d8                 mulss xmm3, xmm0
0000000145bf6fa0  f30f59d8                 mulss xmm3, xmm0
0000000145bf6fa4  f30f58da                 addss xmm3, xmm2
0000000145bf6fa8  f30f1015e4d89f01         movss xmm2, dword ptr [rip + 0x19fd8e4]
0000000145bf6fb0  f30f59d0                 mulss xmm2, xmm0
0000000145bf6fb4  f30f59d0                 mulss xmm2, xmm0
0000000145bf6fb8  f30f59c2                 mulss xmm0, xmm2
0000000145bf6fbc  f30f58c3                 addss xmm0, xmm3
0000000145bf6fc0  f30f59c1                 mulss xmm0, xmm1
0000000145bf6fc4  c3                       ret

; zero-flag-health-polynomial 0x145bf6fd0..0x145bf7015 sha256 4809b196b00f8a32ddbac20288cd70e41e37bcffd39853435af9b1795dd50127
0000000145bf6fd0  f30f1015dc225900         movss xmm2, dword ptr [rip + 0x5922dc]
0000000145bf6fd8  f30f59d0                 mulss xmm2, xmm0
0000000145bf6fdc  f30f5815bcc85700         addss xmm2, dword ptr [rip + 0x57c8bc]
0000000145bf6fe4  f30f101da4d89f01         movss xmm3, dword ptr [rip + 0x19fd8a4]
0000000145bf6fec  f30f59d8                 mulss xmm3, xmm0
0000000145bf6ff0  f30f59d8                 mulss xmm3, xmm0
0000000145bf6ff4  f30f58da                 addss xmm3, xmm2
0000000145bf6ff8  f30f101598d89f01         movss xmm2, dword ptr [rip + 0x19fd898]
0000000145bf7000  f30f59d0                 mulss xmm2, xmm0
0000000145bf7004  f30f59d0                 mulss xmm2, xmm0
0000000145bf7008  f30f59c2                 mulss xmm0, xmm2
0000000145bf700c  f30f58c3                 addss xmm0, xmm3
0000000145bf7010  f30f59c1                 mulss xmm0, xmm1
0000000145bf7014  c3                       ret
