0000000145c1deab 83b8d0000000ff                 cmp dword ptr [rax + 0xd0], -1
0000000145c1deb2 0f84aa000000                   je 0x145c1df62
0000000145c1deb8 f30f1080e8000000               movss xmm0, dword ptr [rax + 0xe8]
0000000145c1dec0 0f2ef0                         ucomiss xmm6, xmm0
0000000145c1dec3 7314                           jae 0x145c1ded9
0000000145c1dec5 488b85b0030000                 mov rax, qword ptr [rbp + 0x3b0]
0000000145c1decc 0f2eb0ec000000                 ucomiss xmm6, dword ptr [rax + 0xec]
0000000145c1ded3 0f82d7f7ffff                   jb 0x145c1d6b0
0000000145c1ded9 f30f108d90000000               movss xmm1, dword ptr [rbp + 0x90]
0000000145c1dee1 488b85b0030000                 mov rax, qword ptr [rbp + 0x3b0]
0000000145c1dee8 f30f1188ec000000               movss dword ptr [rax + 0xec], xmm1
0000000145c1def0 f30f108898010000               movss xmm1, dword ptr [rax + 0x198]
0000000145c1def8 440f2ef9                       ucomiss xmm15, xmm1
0000000145c1defc 0f83f7000000                   jae 0x145c1dff9
0000000145c1df02 0f28d6                         movaps xmm2, xmm6
0000000145c1df05 f30f5c9094010000               subss xmm2, dword ptr [rax + 0x194]
0000000145c1df0d f30f5ed1                       divss xmm2, xmm1
0000000145c1df11 0f57c9                         xorps xmm1, xmm1
0000000145c1df14 f30f5fca                       maxss xmm1, xmm2
0000000145c1df18 410f28d3                       movaps xmm2, xmm11
0000000145c1df1c f30f5dd1                       minss xmm2, xmm1
0000000145c1df20 f20f10887c010000               movsd xmm1, qword ptr [rax + 0x17c]
0000000145c1df28 f20f109888010000               movsd xmm3, qword ptr [rax + 0x188]
0000000145c1df30 0f5cd9                         subps xmm3, xmm1
0000000145c1df33 f30f12fa                       movsldup xmm7, xmm2
0000000145c1df37 0f59fb                         mulps xmm7, xmm3
0000000145c1df3a 0f58f9                         addps xmm7, xmm1
0000000145c1df3d f30f108884010000               movss xmm1, dword ptr [rax + 0x184]
0000000145c1df45 f3440f108890010000             movss xmm9, dword ptr [rax + 0x190]
0000000145c1df4e f3440f5cc9                     subss xmm9, xmm1
0000000145c1df53 f3440f59ca                     mulss xmm9, xmm2
0000000145c1df58 f3440f58c9                     addss xmm9, xmm1
0000000145c1df5d e9a8000000                     jmp 0x145c1e00a
