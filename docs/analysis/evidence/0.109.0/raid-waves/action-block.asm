145957c3e: e8cd41f3ff call 0x14588be10
145957c43: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145957c4a: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145957c51: 4839d1 cmp rcx, rdx
145957c54: 0f83414f0000 jae 0x14595cb9b
145957c5a: f3410f58c7 addss xmm0, xmm15
145957c5f: f30f58058da54800 addss xmm0, dword ptr [rip + 0x48a58d]
145957c67: 488b8e60050000 mov rcx, qword ptr [rsi + 0x560]
145957c6e: 488d0419 lea rax, [rcx + rbx]
145957c72: 48837c1918ff cmp qword ptr [rcx + rbx + 0x18], -1
145957c78: 7425 je 0x145957c9f
145957c7a: f30f104848 movss xmm1, dword ptr [rax + 0x48]
145957c7f: 0f28d1 movaps xmm2, xmm1
145957c82: f30f5fd0 maxss xmm2, xmm0
145957c86: 0f28da movaps xmm3, xmm2
145957c89: f30fc2da03 cmpunordss xmm3, xmm2
145957c8e: 0f28e3 movaps xmm4, xmm3
145957c91: 0f55e2 andnps xmm4, xmm2
145957c94: 0f54d9 andps xmm3, xmm1
145957c97: 0f56dc orps xmm3, xmm4
145957c9a: f30f115848 movss dword ptr [rax + 0x48], xmm3
145957c9f: 48837858ff cmp qword ptr [rax + 0x58], -1
145957ca4: 4c89f1 mov rcx, r14
145957ca7: 0f8403ffffff je 0x145957bb0
145957cad: f30f1088a0000000 movss xmm1, dword ptr [rax + 0xa0]
145957cb5: 0f28d1 movaps xmm2, xmm1
145957cb8: f30f5fd0 maxss xmm2, xmm0
145957cbc: 0f28c2 movaps xmm0, xmm2
145957cbf: f30fc2c203 cmpunordss xmm0, xmm2
145957cc4: 0f28d8 movaps xmm3, xmm0
145957cc7: 0f55da andnps xmm3, xmm2
145957cca: 0f54c1 andps xmm0, xmm1
145957ccd: 0f56c3 orps xmm0, xmm3
145957cd0: f30f1180a0000000 movss dword ptr [rax + 0xa0], xmm0
