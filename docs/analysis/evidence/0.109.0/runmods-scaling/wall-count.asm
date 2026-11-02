0x14593be4e: f30f58f6 addss xmm6, xmm6
0x14593be52: f30f5835b6144600 addss xmm6, dword ptr [rip + 0x4614b6]
0x14593be5a: f30f59f7 mulss xmm6, xmm7
0x14593be5e: f3480f2cc6 cvttss2si rax, xmm6
0x14593be63: 4889c1 mov rcx, rax
0x14593be66: 48c1f93f sar rcx, 0x3f
0x14593be6a: 0f28c6 movaps xmm0, xmm6
0x14593be6d: f30f5c056b174600 subss xmm0, dword ptr [rip + 0x46176b]
0x14593be75: f3480f2cd0 cvttss2si rdx, xmm0
0x14593be7a: 4821ca and rdx, rcx
0x14593be7d: 4809c2 or rdx, rax
0x14593be80: 31c0 xor eax, eax
0x14593be82: 0f57c0 xorps xmm0, xmm0
0x14593be85: 0f2ef0 ucomiss xmm6, xmm0
0x14593be88: 480f43c2 cmovae rax, rdx
0x14593be8c: 0f2e3551174600 ucomiss xmm6, dword ptr [rip + 0x461751]
0x14593be93: 48c7c6ffffffff mov rsi, 0xffffffffffffffff
0x14593be9a: 480f46f0 cmovbe rsi, rax
0x14593be9e: 4883fe01 cmp rsi, 1
0x14593bea2: 4883d600 adc rsi, 0
