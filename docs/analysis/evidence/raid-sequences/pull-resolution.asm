14594e993: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
14594e99a: 4180bdc70a000001 cmp byte ptr [r13 + 0xac7], 1
14594e9a2: 0f850c040000 jne 0x14594edb4
14594e9a8: 450f28c2 movaps xmm8, xmm10
14594e9ac: 450f28d3 movaps xmm10, xmm11
14594e9b0: f30f10841890010000 movss xmm0, dword ptr [rax + rbx + 0x190]
14594e9b9: 450f28dd movaps xmm11, xmm13
14594e9bd: 440f2ef8 ucomiss xmm15, xmm0
14594e9c1: 0f832b040000 jae 0x14594edf2
14594e9c7: 450f28fe movaps xmm15, xmm14
14594e9cb: 488bb548020000 mov rsi, qword ptr [rbp + 0x248]
14594e9d2: f30f108e340a0000 movss xmm1, dword ptr [rsi + 0xa34]
14594e9da: f30f5c8c188c010000 subss xmm1, dword ptr [rax + rbx + 0x18c]
14594e9e3: f30f5ec8 divss xmm1, xmm0
14594e9e7: 0f57c0 xorps xmm0, xmm0
14594e9ea: f30f5fc1 maxss xmm0, xmm1
14594e9ee: f30f100daae84400 movss xmm1, dword ptr [rip + 0x44e8aa]
14594e9f6: f30f5dc8 minss xmm1, xmm0
14594e9fa: f20f10841874010000 movsd xmm0, qword ptr [rax + rbx + 0x174]
14594ea03: f20f10941880010000 movsd xmm2, qword ptr [rax + rbx + 0x180]
14594ea0c: 0f5cd0 subps xmm2, xmm0
14594ea0f: f3440f12c9 movsldup xmm9, xmm1
14594ea14: 440f59ca mulps xmm9, xmm2
14594ea18: 440f58c8 addps xmm9, xmm0
14594ea1c: f30f1084187c010000 movss xmm0, dword ptr [rax + rbx + 0x17c]
14594ea25: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
14594ea2f: f3440f5ce0 subss xmm12, xmm0
14594ea34: f3440f59e1 mulss xmm12, xmm1
14594ea39: f3440f58e0 addss xmm12, xmm0
14594ea3e: e9ce030000 jmp 0x14594ee11
