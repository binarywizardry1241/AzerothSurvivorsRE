1401c3394: f30f108d4c030000 movss xmm1, dword ptr [rbp + 0x34c]
1401c339c: f20f104030 movsd xmm0, qword ptr [rax + 0x30]
1401c33a1: 0f5905c877bf05 mulps xmm0, xmmword ptr [rip + 0x5bf77c8]
1401c33a8: f30f105034 movss xmm2, dword ptr [rax + 0x34]
1401c33ad: 0f14c0 unpcklps xmm0, xmm0
1401c33b0: 0f28d9 movaps xmm3, xmm1
1401c33b3: f30f5fde maxss xmm3, xmm6
1401c33b7: f30f5efb divss xmm7, xmm3
1401c33bb: 0f28258ea1be05 movaps xmm4, xmmword ptr [rip + 0x5bea18e]
1401c33c2: 0f57e0 xorps xmm4, xmm0
1401c33c5: 0f2819 movaps xmm3, xmmword ptr [rcx]
1401c33c8: 0f59e3 mulps xmm4, xmm3
1401c33cb: 0f59c3 mulps xmm0, xmm3
1401c33ce: f30f106914 movss xmm5, dword ptr [rcx + 0x14]
1401c33d3: f30f12ed movsldup xmm5, xmm5
1401c33d7: 440f28c0 movaps xmm8, xmm0
1401c33db: 440fc6c411 shufps xmm8, xmm4, 0x11
1401c33e0: 440fc6c4e2 shufps xmm8, xmm4, 0xe2
1401c33e5: 0fc6c4f7 shufps xmm0, xmm4, 0xf7
1401c33e9: 0fc6c4e2 shufps xmm0, xmm4, 0xe2
1401c33ed: 410f58c0 addps xmm0, xmm8
1401c33f1: 0f58c5 addps xmm0, xmm5
1401c33f4: f30f12ef movsldup xmm5, xmm7
1401c33f8: 0f59e8 mulps xmm5, xmm0
1401c33fb: f3440f16c5 movshdup xmm8, xmm5
1401c3400: 0f28fd movaps xmm7, xmm5
1401c3403: f3410f5df8 minss xmm7, xmm8
1401c3408: f30f106064 movss xmm4, dword ptr [rax + 0x64]
1401c340d: f3410f16c2 movshdup xmm0, xmm10
1401c3412: 0f2ef8 ucomiss xmm7, xmm0
1401c3415: 7639 jbe 0x1401c3450
1401c3417: f30f5cc7 subss xmm0, xmm7
1401c341b: f30f580539e6c205 addss xmm0, dword ptr [rip + 0x5c2e639]
1401c3423: eb4a jmp 0x1401c346f
1401c3425: f7d0 not eax
1401c3427: 8b8dac000000 mov ecx, dword ptr [rbp + 0xac]
1401c342d: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1401c3434: 890a mov dword ptr [rdx], ecx
1401c3436: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
1401c343d: 498b14c0 mov rdx, qword ptr [r8 + rax*8]
1401c3441: f30f2ad6 cvtsi2ss xmm2, esi
1401c3445: e8c6a5f5ff call 0x14011da10
1401c344a: 90 nop
1401c344b: e900fbffff jmp 0x1401c2f50
1401c3450: f3410f5fe8 maxss xmm5, xmm8
1401c3455: f3410f16c1 movshdup xmm0, xmm9
1401c345a: 0f2ec5 ucomiss xmm0, xmm5
1401c345d: 0f868d000000 jbe 0x1401c34f0
1401c3463: f30f5cc5 subss xmm0, xmm5
1401c3467: f30f580571e0be05 addss xmm0, dword ptr [rip + 0x5bee071]
1401c346f: 0f57ed xorps xmm5, xmm5
1401c3472: 0f2ec5 ucomiss xmm0, xmm5
1401c3475: 7502 jne 0x1401c3479
1401c3477: 7b77 jnp 0x1401c34f0
1401c3479: 0f59db mulps xmm3, xmm3
1401c347c: 0f28fb movaps xmm7, xmm3
1401c347f: 0fc6fbff shufps xmm7, xmm3, 0xff
1401c3483: 0f12db movhlps xmm3, xmm3
1401c3486: f30f58df addss xmm3, xmm7
1401c348a: f30f51db sqrtss xmm3, xmm3
1401c348e: f30f5fde maxss xmm3, xmm6
1401c3492: f30f59cc mulss xmm1, xmm4
1401c3496: f30f5fce maxss xmm1, xmm6
1401c349a: f30f5ed9 divss xmm3, xmm1
1401c349e: f30f10483c movss xmm1, dword ptr [rax + 0x3c]
1401c34a3: f30f5cca subss xmm1, xmm2
1401c34a7: f30f59cc mulss xmm1, xmm4
1401c34ab: f30f5fcd maxss xmm1, xmm5
1401c34af: f30f5ec3 divss xmm0, xmm3
1401c34b3: f30f5844fb04 addss xmm0, dword ptr [rbx + rdi*8 + 4]
1401c34b9: e8f226ffff call 0x1401b5bb0
1401c34be: 90 nop
1401c34bf: 418934be mov dword ptr [r14 + rdi*4], esi
1401c34c3: f30f1144fb04 movss dword ptr [rbx + rdi*8 + 4], xmm0
1401c34c9: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
1401c34d0: 80b8c001000001 cmp byte ptr [rax + 0x1c0], 1
1401c34d7: 7517 jne 0x1401c34f0
1401c34d9: 8b8dac000000 mov ecx, dword ptr [rbp + 0xac]
1401c34df: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1401c34e6: 890a mov dword ptr [rdx], ecx
1401c34e8: f30f1180bc010000 movss dword ptr [rax + 0x1bc], xmm0
