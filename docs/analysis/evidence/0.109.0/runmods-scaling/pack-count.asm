0x14593bf0d: f30f59351b8e4a00 mulss xmm6, dword ptr [rip + 0x4a8e1b]
0x14593bf15: f30f583503104900 addss xmm6, dword ptr [rip + 0x491003]
0x14593bf1d: f30f59f7 mulss xmm6, xmm7
0x14593bf21: f3480f2cc6 cvttss2si rax, xmm6
0x14593bf26: 4889c1 mov rcx, rax
0x14593bf29: 48c1f93f sar rcx, 0x3f
0x14593bf2d: 0f28c6 movaps xmm0, xmm6
0x14593bf30: f30f5c05a8164600 subss xmm0, dword ptr [rip + 0x4616a8]
0x14593bf38: f3480f2cd0 cvttss2si rdx, xmm0
0x14593bf3d: 4821ca and rdx, rcx
0x14593bf40: 4809c2 or rdx, rax
0x14593bf43: 31c0 xor eax, eax
0x14593bf45: 0f57c0 xorps xmm0, xmm0
0x14593bf48: 0f2ef0 ucomiss xmm6, xmm0
0x14593bf4b: 480f43c2 cmovae rax, rdx
0x14593bf4f: 0f2e358e164600 ucomiss xmm6, dword ptr [rip + 0x46168e]
0x14593bf56: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
0x14593bf5d: 480f46c8 cmovbe rcx, rax
0x14593bf61: 4883f903 cmp rcx, 3
0x14593bf65: bf02000000 mov edi, 2
0x14593bf6a: 480f43f9 cmovae rdi, rcx
