0x14593c026: f30f58f6 addss xmm6, xmm6
0x14593c02a: f30f5835de124600 addss xmm6, dword ptr [rip + 0x4612de]
0x14593c032: f30f59f7 mulss xmm6, xmm7
0x14593c036: f3480f2cc6 cvttss2si rax, xmm6
0x14593c03b: 4889c1 mov rcx, rax
0x14593c03e: 48c1f93f sar rcx, 0x3f
0x14593c042: 0f28c6 movaps xmm0, xmm6
0x14593c045: f30f5c0593154600 subss xmm0, dword ptr [rip + 0x461593]
0x14593c04d: f34c0f2cc0 cvttss2si r8, xmm0
0x14593c052: 4921c8 and r8, rcx
0x14593c055: 4909c0 or r8, rax
0x14593c058: 31c0 xor eax, eax
0x14593c05a: 0f57c0 xorps xmm0, xmm0
0x14593c05d: 0f2ef0 ucomiss xmm6, xmm0
0x14593c060: 490f43c0 cmovae rax, r8
0x14593c064: 0f2e3579154600 ucomiss xmm6, dword ptr [rip + 0x461579]
0x14593c06b: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
0x14593c072: 480f46c8 cmovbe rcx, rax
0x14593c076: 488b03 mov rax, qword ptr [rbx]
0x14593c079: 488985d0030000 mov qword ptr [rbp + 0x3d0], rax
0x14593c080: 4883f901 cmp rcx, 1
0x14593c084: 4883d100 adc rcx, 0
