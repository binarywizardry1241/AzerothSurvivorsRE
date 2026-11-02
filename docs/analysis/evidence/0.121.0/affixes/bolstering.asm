0000000145c17329 4883bb38feffffff               cmp qword ptr [rbx - 0x1c8], -1
0000000145c17331 75d8                           jne 0x145c1730b
0000000145c17333 4883bb78feffffff               cmp qword ptr [rbx - 0x188], -1
0000000145c1733b 75ce                           jne 0x145c1730b
0000000145c1733d 4839bb10ffffff                 cmp qword ptr [rbx - 0xf0], rdi
0000000145c17344 74c5                           je 0x145c1730b
0000000145c17346 83bbf0feffffff                 cmp dword ptr [rbx - 0x110], -1
0000000145c1734d 75bc                           jne 0x145c1730b
0000000145c1734f 83bbd0feffff00                 cmp dword ptr [rbx - 0x130], 0
0000000145c17356 75b3                           jne 0x145c1730b
0000000145c17358 807bf909                       cmp byte ptr [rbx - 7], 9
0000000145c1735c 77ad                           ja 0x145c1730b
0000000145c1735e 4c89f1                         mov rcx, r14
0000000145c17361 488d9320feffff                 lea rdx, [rbx - 0x1e0]
0000000145c17368 410f28d1                       movaps xmm2, xmm9
0000000145c1736c e8af6fecff                     call 0x145ade320
0000000145c17371 488b4548                       mov rax, qword ptr [rbp + 0x48]
0000000145c17375 f20f108560010000               movsd xmm0, qword ptr [rbp + 0x160]
0000000145c1737d 0f5cc7                         subps xmm0, xmm7
0000000145c17380 0f59c0                         mulps xmm0, xmm0
0000000145c17383 f30f16c8                       movshdup xmm1, xmm0
0000000145c17387 f30f58c8                       addss xmm1, xmm0
0000000145c1738b 410f2ece                       ucomiss xmm1, xmm14
0000000145c1738f 0f8776ffffff                   ja 0x145c1730b
0000000145c17395 0fb643f9                       movzx eax, byte ptr [rbx - 7]
0000000145c17399 8d4801                         lea ecx, [rax + 1]
0000000145c1739c 660f6ec0                       movd xmm0, eax
0000000145c173a0 660f60c0                       punpcklbw xmm0, xmm0
0000000145c173a4 660ffc0554415900               paddb xmm0, xmmword ptr [rip + 0x594154]
0000000145c173ac 0f57c9                         xorps xmm1, xmm1
0000000145c173af 660f60c1                       punpcklbw xmm0, xmm1
0000000145c173b3 660f61c1                       punpcklwd xmm0, xmm1
0000000145c173b7 0f5bc0                         cvtdq2ps xmm0, xmm0
0000000145c173ba 0f59052f0e5800                 mulps xmm0, xmmword ptr [rip + 0x580e2f]
0000000145c173c1 0f5805b80d5800                 addps xmm0, xmmword ptr [rip + 0x580db8]
0000000145c173c8 f30f16c8                       movshdup xmm1, xmm0
0000000145c173cc f30f5ec1                       divss xmm0, xmm1
0000000145c173d0 884bf9                         mov byte ptr [rbx - 7], cl
0000000145c173d3 f20f104b80                     movsd xmm1, qword ptr [rbx - 0x80]
0000000145c173d8 f30f12d0                       movsldup xmm2, xmm0
0000000145c173dc 0f59d1                         mulps xmm2, xmm1
0000000145c173df 0f2995b0000000                 movaps xmmword ptr [rbp + 0xb0], xmm2
0000000145c173e6 0f135380                       movlps qword ptr [rbx - 0x80], xmm2
0000000145c173ea f30f594388                     mulss xmm0, dword ptr [rbx - 0x78]
0000000145c173ef f30f114388                     movss dword ptr [rbx - 0x78], xmm0
0000000145c173f4 f30f104398                     movss xmm0, dword ptr [rbx - 0x68]
0000000145c173f9 f3410f59c7                     mulss xmm0, xmm15
0000000145c173fe f30f114578                     movss dword ptr [rbp + 0x78], xmm0
0000000145c17403 f30f114398                     movss dword ptr [rbx - 0x68], xmm0
