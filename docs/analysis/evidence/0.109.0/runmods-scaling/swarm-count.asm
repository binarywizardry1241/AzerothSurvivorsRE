0x14593bdde: f30f5935caf84a00 mulss xmm6, dword ptr [rip + 0x4af8ca]
0x14593bde6: f30f583592154600 addss xmm6, dword ptr [rip + 0x461592]
0x14593bdee: f30f59f7 mulss xmm6, xmm7
0x14593bdf2: f3480f2cc6 cvttss2si rax, xmm6
0x14593bdf7: 4889c1 mov rcx, rax
0x14593bdfa: 48c1f93f sar rcx, 0x3f
0x14593bdfe: 0f28c6 movaps xmm0, xmm6
0x14593be01: f30f5c05d7174600 subss xmm0, dword ptr [rip + 0x4617d7]
0x14593be09: f3480f2cd0 cvttss2si rdx, xmm0
0x14593be0e: 4821ca and rdx, rcx
0x14593be11: 4809c2 or rdx, rax
0x14593be14: 4531f6 xor r14d, r14d
0x14593be17: 0f57c0 xorps xmm0, xmm0
0x14593be1a: 0f2ef0 ucomiss xmm6, xmm0
0x14593be1d: 490f42d6 cmovb rdx, r14
0x14593be21: 0f2e35bc174600 ucomiss xmm6, dword ptr [rip + 0x4617bc]
0x14593be28: 49c7c7ffffffff mov r15, 0xffffffffffffffff
0x14593be2f: 490f47d7 cmova rdx, r15
0x14593be33: 4883fa01 cmp rdx, 1
0x14593be37: 4883d200 adc rdx, 0
