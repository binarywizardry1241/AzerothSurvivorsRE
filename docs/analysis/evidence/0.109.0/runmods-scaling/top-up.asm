0x14593b52a: 410fb785b0020000 movzx eax, word ptr [r13 + 0x2b0]
0x14593b532: 0f57c0 xorps xmm0, xmm0
0x14593b535: f30f2ac0 cvtsi2ss xmm0, eax
0x14593b539: f30f5e058f1d4600 divss xmm0, dword ptr [rip + 0x461d8f]
0x14593b541: f30f104d18 movss xmm1, dword ptr [rbp + 0x18]
0x14593b546: 498b9568050000 mov rdx, qword ptr [r13 + 0x568]
0x14593b54d: 4885d2 test rdx, rdx
0x14593b550: 742e je 0x14593b580
0x14593b552: 498b8d60050000 mov rcx, qword ptr [r13 + 0x560]
0x14593b559: 4869c2d8010000 imul rax, rdx, 0x1d8
0x14593b560: 4801c8 add rax, rcx
0x14593b563: f30f103d351d4600 movss xmm7, dword ptr [rip + 0x461d35]
0x14593b56b: f30f10157d6c4a00 movss xmm2, dword ptr [rip + 0x4a6c7d]
0x14593b573: f30f101d3d1b4900 movss xmm3, dword ptr [rip + 0x491b3d]
0x14593b57b: 4989c8 mov r8, rcx
0x14593b57e: eb1c jmp 0x14593b59c
0x14593b580: 31c0 xor eax, eax
0x14593b582: e9fa000000 jmp 0x14593b681
0x14593b587: f30f5dfc minss xmm7, xmm4
0x14593b58b: 0f1f440000 nop dword ptr [rax + rax]
0x14593b590: 4981c0d8010000 add r8, 0x1d8
0x14593b597: 4939c0 cmp r8, rax
0x14593b59a: 7424 je 0x14593b5c0
0x14593b59c: 4180b8b000000000 cmp byte ptr [r8 + 0xb0], 0
0x14593b5a4: 75ea jne 0x14593b590
0x14593b5a6: 49837818ff cmp qword ptr [r8 + 0x18], -1
0x14593b5ab: 74e3 je 0x14593b590
0x14593b5ad: 4d8b4830 mov r9, qword ptr [r8 + 0x30]
0x14593b5b1: 4180796400 cmp byte ptr [r9 + 0x64], 0
0x14593b5b6: 0f28e2 movaps xmm4, xmm2
0x14593b5b9: 75cc jne 0x14593b587
0x14593b5bb: 0f28e3 movaps xmm4, xmm3
0x14593b5be: ebc7 jmp 0x14593b587
0x14593b5c0: 4883fa01 cmp rdx, 1
0x14593b5c4: 750a jne 0x14593b5d0
0x14593b5c6: 4531c0 xor r8d, r8d
0x14593b5c9: 31c0 xor eax, eax
0x14593b5cb: e982000000 jmp 0x14593b652
0x14593b5d0: 4989d1 mov r9, rdx
0x14593b5d3: 4983e1fe and r9, 0xfffffffffffffffe
0x14593b5d7: 4c8d91d0020000 lea r10, [rcx + 0x2d0]
0x14593b5de: 4531c0 xor r8d, r8d
0x14593b5e1: 31c0 xor eax, eax
0x14593b5e3: eb29 jmp 0x14593b60e
0x14593b5e5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14593b5f0: 0fb6764c movzx esi, byte ptr [rsi + 0x4c]
0x14593b5f4: 4883f601 xor rsi, 1
0x14593b5f8: 4c01d8 add rax, r11
0x14593b5fb: 4801f0 add rax, rsi
0x14593b5fe: 4983c002 add r8, 2
0x14593b602: 4981c2b0030000 add r10, 0x3b0
0x14593b609: 4d39c1 cmp r9, r8
0x14593b60c: 743f je 0x14593b64d
0x14593b60e: 4d8b9a28feffff mov r11, qword ptr [r10 - 0x1d8]
0x14593b615: 4d85db test r11, r11
0x14593b618: 400f94c6 sete sil
0x14593b61c: 410ab2e0fdffff or sil, byte ptr [r10 - 0x220]
0x14593b623: 740b je 0x14593b630
0x14593b625: 4531db xor r11d, r11d
0x14593b628: eb0f jmp 0x14593b639
0x14593b62a: 660f1f440000 nop word ptr [rax + rax]
0x14593b630: 450fb65b4c movzx r11d, byte ptr [r11 + 0x4c]
0x14593b635: 4983f301 xor r11, 1
0x14593b639: 498b32 mov rsi, qword ptr [r10]
0x14593b63c: 4885f6 test rsi, rsi
0x14593b63f: 410f94c6 sete r14b
0x14593b643: 450a72b8 or r14b, byte ptr [r10 - 0x48]
0x14593b647: 74a7 je 0x14593b5f0
0x14593b649: 31f6 xor esi, esi
0x14593b64b: ebab jmp 0x14593b5f8
0x14593b64d: f6c201 test dl, 1
0x14593b650: 742f je 0x14593b681
0x14593b652: 4d69c0d8010000 imul r8, r8, 0x1d8
0x14593b659: 4a8b9401f8000000 mov rdx, qword ptr [rcx + r8 + 0xf8]
0x14593b661: 4885d2 test rdx, rdx
0x14593b664: 410f94c1 sete r9b
0x14593b668: 460a8c01b0000000 or r9b, byte ptr [rcx + r8 + 0xb0]
0x14593b670: 7404 je 0x14593b676
0x14593b672: 31c9 xor ecx, ecx
0x14593b674: eb08 jmp 0x14593b67e
0x14593b676: 0fb64a4c movzx ecx, byte ptr [rdx + 0x4c]
0x14593b67a: 4883f101 xor rcx, 1
0x14593b67e: 4801c8 add rax, rcx
0x14593b681: f30f590d876e4a00 mulss xmm1, dword ptr [rip + 0x4a6e87]
0x14593b689: f30f580d371e4600 addss xmm1, dword ptr [rip + 0x461e37]
0x14593b691: f30f59c8 mulss xmm1, xmm0
0x14593b695: f30f59cf mulss xmm1, xmm7
0x14593b699: f30f1015ef204600 movss xmm2, dword ptr [rip + 0x4620ef]
0x14593b6a1: f30f59d0 mulss xmm2, xmm0
0x14593b6a5: 0f28d9 movaps xmm3, xmm1
0x14593b6a8: f30f5dda minss xmm3, xmm2
0x14593b6ac: 0f28d3 movaps xmm2, xmm3
0x14593b6af: f30fc2d303 cmpunordss xmm2, xmm3
0x14593b6b4: 0f54ca andps xmm1, xmm2
0x14593b6b7: 0f55d3 andnps xmm2, xmm3
0x14593b6ba: 0f56d1 orps xmm2, xmm1
0x14593b6bd: f3480f2cca cvttss2si rcx, xmm2
0x14593b6c2: 4889ca mov rdx, rcx
0x14593b6c5: 48c1fa3f sar rdx, 0x3f
0x14593b6c9: f30f103d0f1f4600 movss xmm7, dword ptr [rip + 0x461f0f]
0x14593b6d1: 0f28ca movaps xmm1, xmm2
0x14593b6d4: f30f5ccf subss xmm1, xmm7
0x14593b6d8: f34c0f2cf9 cvttss2si r15, xmm1
0x14593b6dd: 4921d7 and r15, rdx
0x14593b6e0: 4909cf or r15, rcx
0x14593b6e3: 31f6 xor esi, esi
0x14593b6e5: 0f57f6 xorps xmm6, xmm6
0x14593b6e8: 0f2ed6 ucomiss xmm2, xmm6
0x14593b6eb: 4c0f42fe cmovb r15, rsi
0x14593b6ef: f3440f1005ec1e4600 movss xmm8, dword ptr [rip + 0x461eec]
0x14593b6f8: 410f2ed0 ucomiss xmm2, xmm8
0x14593b6fc: 49c7c6ffffffff mov r14, 0xffffffffffffffff
0x14593b703: 4d0f47fe cmova r15, r14
0x14593b707: 4929c7 sub r15, rax
0x14593b70a: 4c0f42fe cmovb r15, rsi
0x14593b70e: e82eea2b00 call 0x145bfa141
0x14593b713: 0f28c8 movaps xmm1, xmm0
0x14593b716: f30f5ccf subss xmm1, xmm7
0x14593b71a: f3480f2cc1 cvttss2si rax, xmm1
0x14593b71f: f3480f2cc8 cvttss2si rcx, xmm0
0x14593b724: 4889ca mov rdx, rcx
0x14593b727: 48c1fa3f sar rdx, 0x3f
0x14593b72b: 4821c2 and rdx, rax
0x14593b72e: 4809ca or rdx, rcx
0x14593b731: 0f2ec6 ucomiss xmm0, xmm6
0x14593b734: 480f42d6 cmovb rdx, rsi
0x14593b738: 410f2ec0 ucomiss xmm0, xmm8
0x14593b73c: 490f47d6 cmova rdx, r14
0x14593b740: 488d0452 lea rax, [rdx + rdx*2]
0x14593b744: 4c39f8 cmp rax, r15
0x14593b747: 4c0f42f8 cmovb r15, rax
