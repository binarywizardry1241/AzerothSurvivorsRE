145971998: 31d2 xor edx, edx
14597199a: 4d89f0 mov r8, r14
14597199d: 0f1f00 nop dword ptr [rax]
1459719a0: 4839d0 cmp rax, rdx
1459719a3: 745e je 0x145971a03
1459719a5: 4881c2d8010000 add rdx, 0x1d8
1459719ac: 4939b0f0000000 cmp qword ptr [r8 + 0xf0], rsi
1459719b3: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
1459719ba: 75e4 jne 0x1459719a0
1459719bc: 4983bc1640feffffff cmp qword ptr [r14 + rdx - 0x1c0], -1
1459719c5: 750b jne 0x1459719d2
1459719c7: 4983bc1680feffffff cmp qword ptr [r14 + rdx - 0x180], -1
1459719d0: 7431 je 0x145971a03
1459719d2: f3410f105416f8 movss xmm2, dword ptr [r14 + rdx - 8]
1459719d9: 0f2ed1 ucomiss xmm2, xmm1
1459719dc: 760a jbe 0x1459719e8
1459719de: f30f1005e2324600 movss xmm0, dword ptr [rip + 0x4632e2]
1459719e6: eb1b jmp 0x145971a03
1459719e8: f3410f105c16f4 movss xmm3, dword ptr [r14 + rdx - 0xc]
1459719ef: f30f10158db44500 movss xmm2, dword ptr [rip + 0x45b48d]
1459719f7: 0f2ed9 ucomiss xmm3, xmm1
1459719fa: 0f86fd000000 jbe 0x145971afd
145971a00: 0f28c2 movaps xmm0, xmm2
