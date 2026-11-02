145950f4e: e84d41f3ff call 0x1458850a0
145950f53: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145950f5a: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145950f61: 4839d1 cmp rcx, rdx
145950f64: 0f83414f0000 jae 0x145955eab
145950f6a: f3410f58c7 addss xmm0, xmm15
145950f6f: f30f580535c14700 addss xmm0, dword ptr [rip + 0x47c135]
145950f77: 488b8e60050000 mov rcx, qword ptr [rsi + 0x560]
145950f7e: 488d0419 lea rax, [rcx + rbx]
145950f82: 48837c1918ff cmp qword ptr [rcx + rbx + 0x18], -1
145950f88: 7425 je 0x145950faf
145950f8a: f30f104848 movss xmm1, dword ptr [rax + 0x48]
145950f8f: 0f28d1 movaps xmm2, xmm1
145950f92: f30f5fd0 maxss xmm2, xmm0
145950f96: 0f28da movaps xmm3, xmm2
145950f99: f30fc2da03 cmpunordss xmm3, xmm2
145950f9e: 0f28e3 movaps xmm4, xmm3
145950fa1: 0f55e2 andnps xmm4, xmm2
145950fa4: 0f54d9 andps xmm3, xmm1
145950fa7: 0f56dc orps xmm3, xmm4
145950faa: f30f115848 movss dword ptr [rax + 0x48], xmm3
145950faf: 48837858ff cmp qword ptr [rax + 0x58], -1
145950fb4: 4c89f1 mov rcx, r14
145950fb7: 0f8403ffffff je 0x145950ec0
145950fbd: f30f1088a0000000 movss xmm1, dword ptr [rax + 0xa0]
145950fc5: 0f28d1 movaps xmm2, xmm1
145950fc8: f30f5fd0 maxss xmm2, xmm0
145950fcc: 0f28c2 movaps xmm0, xmm2
145950fcf: f30fc2c203 cmpunordss xmm0, xmm2
145950fd4: 0f28d8 movaps xmm3, xmm0
145950fd7: 0f55da andnps xmm3, xmm2
145950fda: 0f54c1 andps xmm0, xmm1
145950fdd: 0f56c3 orps xmm0, xmm3
145950fe0: f30f1180a0000000 movss dword ptr [rax + 0xa0], xmm0
