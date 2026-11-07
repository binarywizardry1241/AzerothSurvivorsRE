0x1459586e0: 4157 push r15
0x1459586e2: 4156 push r14
0x1459586e4: 4155 push r13
0x1459586e6: 4154 push r12
0x1459586e8: 56 push rsi
0x1459586e9: 57 push rdi
0x1459586ea: 55 push rbp
0x1459586eb: 53 push rbx
0x1459586ec: 4881ec98010000 sub rsp, 0x198
0x1459586f3: 440f29bc2480010000 movaps xmmword ptr [rsp + 0x180], xmm15
0x1459586fc: 440f29b42470010000 movaps xmmword ptr [rsp + 0x170], xmm14
0x145958705: 440f29ac2460010000 movaps xmmword ptr [rsp + 0x160], xmm13
0x14595870e: 440f29a42450010000 movaps xmmword ptr [rsp + 0x150], xmm12
0x145958717: 440f299c2440010000 movaps xmmword ptr [rsp + 0x140], xmm11
0x145958720: 440f29942430010000 movaps xmmword ptr [rsp + 0x130], xmm10
0x145958729: 440f298c2420010000 movaps xmmword ptr [rsp + 0x120], xmm9
0x145958732: 440f29842410010000 movaps xmmword ptr [rsp + 0x110], xmm8
0x14595873b: 0f29bc2400010000 movaps xmmword ptr [rsp + 0x100], xmm7
0x145958743: 0f29b424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm6
0x14595874b: 4889d6 mov rsi, rdx
0x14595874e: 4c8ba1d8000000 mov r12, qword ptr [rcx + 0xd8]
0x145958755: 4c39e2 cmp rdx, r12
0x145958758: 0f8336110000 jae 0x145959894
0x14595875e: 4989ce mov r14, rcx
0x145958761: f30f10b14c0a0000 movss xmm6, dword ptr [rcx + 0xa4c]
0x145958769: 488b91d0000000 mov rdx, qword ptr [rcx + 0xd0]
0x145958770: 4889f1 mov rcx, rsi
0x145958773: 48c1e107 shl rcx, 7
0x145958777: 488d040a lea rax, [rdx + rcx]
0x14595877b: 4c8b7c0a18 mov r15, qword ptr [rdx + rcx + 0x18]
0x145958780: 4889542478 mov qword ptr [rsp + 0x78], rdx
0x145958785: f30f10440a5c movss xmm0, dword ptr [rdx + rcx + 0x5c]
0x14595878b: 0f57c9 xorps xmm1, xmm1
0x14595878e: 0f2ec8 ucomiss xmm1, xmm0
0x145958791: 7358 jae 0x1459587eb
0x145958793: 0f28d6 movaps xmm2, xmm6
0x145958796: f30f5c5058 subss xmm2, dword ptr [rax + 0x58]
0x14595879b: f30f5ed0 divss xmm2, xmm0
0x14595879f: f30f5fca maxss xmm1, xmm2
0x1459587a3: f30f101db54a4500 movss xmm3, dword ptr [rip + 0x454ab5]
0x1459587ab: f30f5dd9 minss xmm3, xmm1
0x1459587af: f20f105040 movsd xmm2, qword ptr [rax + 0x40]
0x1459587b4: f20f10484c movsd xmm1, qword ptr [rax + 0x4c]
0x1459587b9: 0f28e1 movaps xmm4, xmm1
0x1459587bc: 0f5ce2 subps xmm4, xmm2
0x1459587bf: f3440f12c3 movsldup xmm8, xmm3
0x1459587c4: 440f59c4 mulps xmm8, xmm4
0x1459587c8: 440f58c2 addps xmm8, xmm2
0x1459587cc: f30f106048 movss xmm4, dword ptr [rax + 0x48]
0x1459587d1: f30f105054 movss xmm2, dword ptr [rax + 0x54]
0x1459587d6: 440f28ca movaps xmm9, xmm2
0x1459587da: f3440f5ccc subss xmm9, xmm4
0x1459587df: f3440f59cb mulss xmm9, xmm3
0x1459587e4: f3440f58cc addss xmm9, xmm4
0x1459587e9: eb13 jmp 0x1459587fe
0x1459587eb: f2440f10404c movsd xmm8, qword ptr [rax + 0x4c]
0x1459587f1: f30f105054 movss xmm2, dword ptr [rax + 0x54]
0x1459587f6: 440f28ca movaps xmm9, xmm2
0x1459587fa: 410f28c8 movaps xmm1, xmm8
0x1459587fe: f2410f10bed0040000 movsd xmm7, qword ptr [r14 + 0x4d0]
0x145958807: 418bbed8040000 mov edi, dword ptr [r14 + 0x4d8]
0x14595880e: 488b6828 mov rbp, qword ptr [rax + 0x28]
0x145958812: 410fb64f39 movzx ecx, byte ptr [r15 + 0x39]
0x145958817: 83f905 cmp ecx, 5
0x14595881a: 746c je 0x145958888
0x14595881c: 83f907 cmp ecx, 7
0x14595881f: 4c89bc2480000000 mov qword ptr [rsp + 0x80], r15
0x145958827: 0f8510050000 jne 0x145958d3d
0x14595882d: 0f57db xorps xmm3, xmm3
0x145958830: 0f2ed8 ucomiss xmm3, xmm0
0x145958833: 0f830d020000 jae 0x145958a46
0x145958839: 0f28e6 movaps xmm4, xmm6
0x14595883c: f30f5c6058 subss xmm4, dword ptr [rax + 0x58]
0x145958841: f30f5ee0 divss xmm4, xmm0
0x145958845: f30f5fdc maxss xmm3, xmm4
0x145958849: f30f10050f4a4500 movss xmm0, dword ptr [rip + 0x454a0f]
0x145958851: f30f5dc3 minss xmm0, xmm3
0x145958855: f30f105848 movss xmm3, dword ptr [rax + 0x48]
0x14595885a: f30f5cd3 subss xmm2, xmm3
0x14595885e: f30f59d0 mulss xmm2, xmm0
0x145958862: f30f58d3 addss xmm2, xmm3
0x145958866: f20f105840 movsd xmm3, qword ptr [rax + 0x40]
0x14595886b: 0f5ccb subps xmm1, xmm3
0x14595886e: f30f12c0 movsldup xmm0, xmm0
0x145958872: 0f59c1 mulps xmm0, xmm1
0x145958875: 0f58c3 addps xmm0, xmm3
0x145958878: 0f13442438 movlps qword ptr [rsp + 0x38], xmm0
0x14595887d: f30f11542440 movss dword ptr [rsp + 0x40], xmm2
0x145958883: e9ce010000 jmp 0x145958a56
0x145958888: f30f11742438 movss dword ptr [rsp + 0x38], xmm6
0x14595888e: 498bb668050000 mov rsi, qword ptr [r14 + 0x568]
0x145958895: 4d8ba670050000 mov r12, qword ptr [r14 + 0x570]
0x14595889c: 4d85e4 test r12, r12
0x14595889f: 0f84280e0000 je 0x1459596cd
0x1459588a5: 4d69ecd8010000 imul r13, r12, 0x1d8
0x1459588ac: 4a8d042e lea rax, [rsi + r13]
0x1459588b0: 488d8ed8010000 lea rcx, [rsi + 0x1d8]
0x1459588b7: 0f57c0 xorps xmm0, xmm0
0x1459588ba: f3440f100d9d494500 movss xmm9, dword ptr [rip + 0x45499d]
0x1459588c3: f3440f1005145b4600 movss xmm8, dword ptr [rip + 0x465b14]
0x1459588cc: 4c89ea mov rdx, r13
0x1459588cf: eb3f jmp 0x145958910
0x1459588d1: f20f1049a8 movsd xmm1, qword ptr [rcx - 0x58]
0x1459588d6: 0f5ccf subps xmm1, xmm7
0x1459588d9: 0f59c9 mulps xmm1, xmm1
0x1459588dc: f30f16d1 movshdup xmm2, xmm1
0x1459588e0: f30f58d1 addss xmm2, xmm1
0x1459588e4: 0f57c9 xorps xmm1, xmm1
0x1459588e7: f30f51ca sqrtss xmm1, xmm2
0x1459588eb: 440f2ec1 ucomiss xmm8, xmm1
0x1459588ef: 0f83520d0000 jae 0x145959647
0x1459588f5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958900: 4881c1d8010000 add rcx, 0x1d8
0x145958907: 4881c228feffff add rdx, -0x1d8
0x14595890e: 7460 je 0x145958970
0x145958910: 80b9d8feffff00 cmp byte ptr [rcx - 0x128], 0
0x145958917: 75e7 jne 0x145958900
0x145958919: 4883b940feffffff cmp qword ptr [rcx - 0x1c0], -1
0x145958921: 7506 jne 0x145958929
0x145958923: 8079f800 cmp byte ptr [rcx - 8], 0
0x145958927: 74d7 je 0x145958900
0x145958929: 0f2e71d0 ucomiss xmm6, dword ptr [rcx - 0x30]
0x14595892d: 72d1 jb 0x145958900
0x14595892f: f30f1049b8 movss xmm1, dword ptr [rcx - 0x48]
0x145958934: 0f2ec1 ucomiss xmm0, xmm1
0x145958937: 7398 jae 0x1459588d1
0x145958939: 0f28d6 movaps xmm2, xmm6
0x14595893c: f30f5c51b4 subss xmm2, dword ptr [rcx - 0x4c]
0x145958941: f30f5ed1 divss xmm2, xmm1
0x145958945: 0f57c9 xorps xmm1, xmm1
0x145958948: f30f5fca maxss xmm1, xmm2
0x14595894c: 410f28d1 movaps xmm2, xmm9
0x145958950: f30f5dd1 minss xmm2, xmm1
0x145958954: f20f10599c movsd xmm3, qword ptr [rcx - 0x64]
0x145958959: f20f1061a8 movsd xmm4, qword ptr [rcx - 0x58]
0x14595895e: 0f5ce3 subps xmm4, xmm3
0x145958961: f30f12ca movsldup xmm1, xmm2
0x145958965: 0f59cc mulps xmm1, xmm4
0x145958968: 0f58cb addps xmm1, xmm3
0x14595896b: e966ffffff jmp 0x1459588d6
0x145958970: 31c9 xor ecx, ecx
0x145958972: 31c0 xor eax, eax
0x145958974: eb19 jmp 0x14595898f
0x145958976: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958980: 4805d8010000 add rax, 0x1d8
0x145958986: 4939c5 cmp r13, rax
0x145958989: 0f842c0d0000 je 0x1459596bb
0x14595898f: 4839ac06f0000000 cmp qword ptr [rsi + rax + 0xf0], rbp
0x145958997: 75e7 jne 0x145958980
0x145958999: 80bc06b000000000 cmp byte ptr [rsi + rax + 0xb0], 0
0x1459589a1: 75dd jne 0x145958980
0x1459589a3: 48837c0618ff cmp qword ptr [rsi + rax + 0x18], -1
0x1459589a9: 750a jne 0x1459589b5
0x1459589ab: 80bc06d001000000 cmp byte ptr [rsi + rax + 0x1d0], 0
0x1459589b3: 74cb je 0x145958980
0x1459589b5: f30f1094065c010000 movss xmm2, dword ptr [rsi + rax + 0x15c]
0x1459589be: f30f5f159a484500 maxss xmm2, dword ptr [rip + 0x45489a]
0x1459589c6: f30f108c0658010000 movss xmm1, dword ptr [rsi + rax + 0x158]
0x1459589cf: f30f5eca divss xmm1, xmm2
0x1459589d3: 31c0 xor eax, eax
0x1459589d5: 4889f2 mov rdx, rsi
0x1459589d8: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459589e0: 4939c5 cmp r13, rax
0x1459589e3: 0f84d20c0000 je 0x1459596bb
0x1459589e9: 4805d8010000 add rax, 0x1d8
0x1459589ef: 4839aaf0000000 cmp qword ptr [rdx + 0xf0], rbp
0x1459589f6: 488d92d8010000 lea rdx, [rdx + 0x1d8]
0x1459589fd: 75e1 jne 0x1459589e0
0x1459589ff: f30f105c06b8 movss xmm3, dword ptr [rsi + rax - 0x48]
0x145958a05: 0f57d2 xorps xmm2, xmm2
0x145958a08: 0f2ed3 ucomiss xmm2, xmm3
0x145958a0b: 0f83850c0000 jae 0x145959696
0x145958a11: 0f28e6 movaps xmm4, xmm6
0x145958a14: f30f5c6406b4 subss xmm4, dword ptr [rsi + rax - 0x4c]
0x145958a1a: f30f5ee3 divss xmm4, xmm3
0x145958a1e: f30f5fd4 maxss xmm2, xmm4
0x145958a22: f3440f5dca minss xmm9, xmm2
0x145958a27: f20f105c069c movsd xmm3, qword ptr [rsi + rax - 0x64]
0x145958a2d: f20f106406a8 movsd xmm4, qword ptr [rsi + rax - 0x58]
0x145958a33: 0f5ce3 subps xmm4, xmm3
0x145958a36: f3410f12d1 movsldup xmm2, xmm9
0x145958a3b: 0f59d4 mulps xmm2, xmm4
0x145958a3e: 0f58d3 addps xmm2, xmm3
0x145958a41: e9560c0000 jmp 0x14595969c
0x145958a46: 8b4854 mov ecx, dword ptr [rax + 0x54]
0x145958a49: 894c2440 mov dword ptr [rsp + 0x40], ecx
0x145958a4d: 488b484c mov rcx, qword ptr [rax + 0x4c]
0x145958a51: 48894c2438 mov qword ptr [rsp + 0x38], rcx
0x145958a56: 488b5830 mov rbx, qword ptr [rax + 0x30]
0x145958a5a: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
0x145958a63: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x145958a6c: 488d4c2448 lea rcx, [rsp + 0x48]
0x145958a71: 4c8d442438 lea r8, [rsp + 0x38]
0x145958a76: f30f101df6494500 movss xmm3, dword ptr [rip + 0x4549f6]
0x145958a7e: 4c89f2 mov rdx, r14
0x145958a81: e86a28fdff call 0x14592b2f0
0x145958a86: 488b4c2450 mov rcx, qword ptr [rsp + 0x50]
0x145958a8b: 488b442458 mov rax, qword ptr [rsp + 0x58]
0x145958a90: 48baf8ffffffffffff0f movabs rdx, 0xffffffffffffff8
0x145958a9a: 4821c2 and rdx, rax
0x145958a9d: 4531c0 xor r8d, r8d
0x145958aa0: 4c39c2 cmp rdx, r8
0x145958aa3: 743d je 0x145958ae2
0x145958aa5: 4a391cc1 cmp qword ptr [rcx + r8*8], rbx
0x145958aa9: 7453 je 0x145958afe
0x145958aab: 4a395cc108 cmp qword ptr [rcx + r8*8 + 8], rbx
0x145958ab0: 744c je 0x145958afe
0x145958ab2: 4a395cc110 cmp qword ptr [rcx + r8*8 + 0x10], rbx
0x145958ab7: 7445 je 0x145958afe
0x145958ab9: 4a395cc118 cmp qword ptr [rcx + r8*8 + 0x18], rbx
0x145958abe: 743e je 0x145958afe
0x145958ac0: 4a395cc120 cmp qword ptr [rcx + r8*8 + 0x20], rbx
0x145958ac5: 7437 je 0x145958afe
0x145958ac7: 4a395cc128 cmp qword ptr [rcx + r8*8 + 0x28], rbx
0x145958acc: 7430 je 0x145958afe
0x145958ace: 4a395cc130 cmp qword ptr [rcx + r8*8 + 0x30], rbx
0x145958ad3: 7429 je 0x145958afe
0x145958ad5: 4a395cc138 cmp qword ptr [rcx + r8*8 + 0x38], rbx
0x145958ada: 4d8d4008 lea r8, [r8 + 8]
0x145958ade: 75c0 jne 0x145958aa0
0x145958ae0: eb1c jmp 0x145958afe
0x145958ae2: 448d04c500000000 lea r8d, [rax*8]
0x145958aea: 4183e038 and r8d, 0x38
0x145958aee: 0f8485010000 je 0x145958c79
0x145958af4: 48391cd1 cmp qword ptr [rcx + rdx*8], rbx
0x145958af8: 0f85a1000000 jne 0x145958b9f
0x145958afe: 4d8b8670050000 mov r8, qword ptr [r14 + 0x570]
0x145958b05: 4d85c0 test r8, r8
0x145958b08: 0f846b010000 je 0x145958c79
0x145958b0e: 498b9668050000 mov rdx, qword ptr [r14 + 0x568]
0x145958b15: 4d69c0d8010000 imul r8, r8, 0x1d8
0x145958b1c: 4531c9 xor r9d, r9d
0x145958b1f: eb1f jmp 0x145958b40
0x145958b21: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958b30: 4981c1d8010000 add r9, 0x1d8
0x145958b37: 4d39c8 cmp r8, r9
0x145958b3a: 0f8439010000 je 0x145958c79
0x145958b40: 4a399c0af0000000 cmp qword ptr [rdx + r9 + 0xf0], rbx
0x145958b48: 75e6 jne 0x145958b30
0x145958b4a: 4280bc0ab000000000 cmp byte ptr [rdx + r9 + 0xb0], 0
0x145958b53: 75db jne 0x145958b30
0x145958b55: 4a837c0a18ff cmp qword ptr [rdx + r9 + 0x18], -1
0x145958b5b: 750b jne 0x145958b68
0x145958b5d: 4280bc0ad001000000 cmp byte ptr [rdx + r9 + 0x1d0], 0
0x145958b66: 74c8 je 0x145958b30
0x145958b68: 4d89c1 mov r9, r8
0x145958b6b: 4989d2 mov r10, rdx
0x145958b6e: 6690 nop
0x145958b70: 4d85c9 test r9, r9
0x145958b73: 0f84ab000000 je 0x145958c24
0x145958b79: 4d89d3 mov r11, r10
0x145958b7c: 4981c2d8010000 add r10, 0x1d8
0x145958b83: 4981c128feffff add r9, -0x1d8
0x145958b8a: 49399bf0000000 cmp qword ptr [r11 + 0xf0], rbx
0x145958b91: 75dd jne 0x145958b70
0x145958b93: 49837b18ff cmp qword ptr [r11 + 0x18], -1
0x145958b98: 74d6 je 0x145958b70
0x145958b9a: e9860a0000 jmp 0x145959625
0x145958b9f: 4183f808 cmp r8d, 8
0x145958ba3: 0f84d0000000 je 0x145958c79
0x145958ba9: 48395cd108 cmp qword ptr [rcx + rdx*8 + 8], rbx
0x145958bae: 0f844affffff je 0x145958afe
0x145958bb4: 4183f810 cmp r8d, 0x10
0x145958bb8: 0f84bb000000 je 0x145958c79
0x145958bbe: 48395cd110 cmp qword ptr [rcx + rdx*8 + 0x10], rbx
0x145958bc3: 0f8435ffffff je 0x145958afe
0x145958bc9: 4183f818 cmp r8d, 0x18
0x145958bcd: 0f84a6000000 je 0x145958c79
0x145958bd3: 48395cd118 cmp qword ptr [rcx + rdx*8 + 0x18], rbx
0x145958bd8: 0f8420ffffff je 0x145958afe
0x145958bde: 4183f820 cmp r8d, 0x20
0x145958be2: 0f8491000000 je 0x145958c79
0x145958be8: 48395cd120 cmp qword ptr [rcx + rdx*8 + 0x20], rbx
0x145958bed: 0f840bffffff je 0x145958afe
0x145958bf3: 4183f828 cmp r8d, 0x28
0x145958bf7: 0f847c000000 je 0x145958c79
0x145958bfd: 48395cd128 cmp qword ptr [rcx + rdx*8 + 0x28], rbx
0x145958c02: 0f84f6feffff je 0x145958afe
0x145958c08: 4183f830 cmp r8d, 0x30
0x145958c0c: 746b je 0x145958c79
0x145958c0e: 48395cd130 cmp qword ptr [rcx + rdx*8 + 0x30], rbx
0x145958c13: 0f84e5feffff je 0x145958afe
0x145958c19: 4183f838 cmp r8d, 0x38
0x145958c1d: 745a je 0x145958c79
0x145958c1f: e9dafeffff jmp 0x145958afe
0x145958c24: 4885c0 test rax, rax
0x145958c27: 0f84f8090000 je 0x145959625
0x145958c2d: 4c8d0cc1 lea r9, [rcx + rax*8]
0x145958c31: 4989ca mov r10, rcx
0x145958c34: eb09 jmp 0x145958c3f
0x145958c36: 4d39ca cmp r10, r9
0x145958c39: 0f84e6090000 je 0x145959625
0x145958c3f: 4d8b1a mov r11, qword ptr [r10]
0x145958c42: 4983c208 add r10, 8
0x145958c46: 4531ff xor r15d, r15d
0x145958c49: eb11 jmp 0x145958c5c
0x145958c4b: 0f1f440000 nop dword ptr [rax + rax]
0x145958c50: 4981c7d8010000 add r15, 0x1d8
0x145958c57: 4d39f8 cmp r8, r15
0x145958c5a: 74da je 0x145958c36
0x145958c5c: 4e399c3af0000000 cmp qword ptr [rdx + r15 + 0xf0], r11
0x145958c64: 75ea jne 0x145958c50
0x145958c66: 4283bc3ab000000000 cmp dword ptr [rdx + r15 + 0xb0], 0
0x145958c6f: 75df jne 0x145958c50
0x145958c71: 4a837c3a18ff cmp qword ptr [rdx + r15 + 0x18], -1
0x145958c77: 74d7 je 0x145958c50
0x145958c79: 4885c0 test rax, rax
0x145958c7c: 0f847f000000 je 0x145958d01
0x145958c82: 4d8b8670050000 mov r8, qword ptr [r14 + 0x570]
0x145958c89: 4d85c0 test r8, r8
0x145958c8c: 7473 je 0x145958d01
0x145958c8e: 488d04c1 lea rax, [rcx + rax*8]
0x145958c92: 498b9668050000 mov rdx, qword ptr [r14 + 0x568]
0x145958c99: 4d69c0d8010000 imul r8, r8, 0x1d8
0x145958ca0: 4989c9 mov r9, rcx
0x145958ca3: eb14 jmp 0x145958cb9
0x145958ca5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958cb0: 4939c1 cmp r9, rax
0x145958cb3: 0f847c0b0000 je 0x145959835
0x145958cb9: 498b19 mov rbx, qword ptr [r9]
0x145958cbc: 4983c108 add r9, 8
0x145958cc0: 4531d2 xor r10d, r10d
0x145958cc3: eb17 jmp 0x145958cdc
0x145958cc5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958cd0: 4981c2d8010000 add r10, 0x1d8
0x145958cd7: 4d39d0 cmp r8, r10
0x145958cda: 74d4 je 0x145958cb0
0x145958cdc: 4a399c12f0000000 cmp qword ptr [rdx + r10 + 0xf0], rbx
0x145958ce4: 75ea jne 0x145958cd0
0x145958ce6: 4283bc12b000000000 cmp dword ptr [rdx + r10 + 0xb0], 0
0x145958cef: 75df jne 0x145958cd0
0x145958cf1: 4a837c1218ff cmp qword ptr [rdx + r10 + 0x18], -1
0x145958cf7: 74d7 je 0x145958cd0
0x145958cf9: 4989ef mov r15, rbp
0x145958cfc: 40b501 mov bpl, 1
0x145958cff: eb05 jmp 0x145958d06
0x145958d01: 4989ef mov r15, rbp
0x145958d04: 31ed xor ebp, ebp
0x145958d06: 488b542448 mov rdx, qword ptr [rsp + 0x48]
0x145958d0b: 4885d2 test rdx, rdx
0x145958d0e: 740f je 0x145958d1f
0x145958d10: 48c1e203 shl rdx, 3
0x145958d14: 41b808000000 mov r8d, 8
0x145958d1a: e8b1946afa call 0x1400021d0
0x145958d1f: b801000000 mov eax, 1
0x145958d24: 4889442430 mov qword ptr [rsp + 0x30], rax
0x145958d29: 4084ed test bpl, bpl
0x145958d2c: 4c89fd mov rbp, r15
0x145958d2f: 4c8bbc2480000000 mov r15, qword ptr [rsp + 0x80]
0x145958d37: 0f85840a0000 jne 0x1459597c1
0x145958d3d: 418b4734 mov eax, dword ptr [r15 + 0x34]
0x145958d41: 89442444 mov dword ptr [rsp + 0x44], eax
0x145958d45: 85c0 test eax, eax
0x145958d47: 740f je 0x145958d58
0x145958d49: 440f13442438 movlps qword ptr [rsp + 0x38], xmm8
0x145958d4f: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
0x145958d56: eb09 jmp 0x145958d61
0x145958d58: 0f137c2438 movlps qword ptr [rsp + 0x38], xmm7
0x145958d5d: 897c2440 mov dword ptr [rsp + 0x40], edi
0x145958d61: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
0x145958d6a: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x145958d73: 488d4c2448 lea rcx, [rsp + 0x48]
0x145958d78: 4c8d442438 lea r8, [rsp + 0x38]
0x145958d7d: f30f101d5b564600 movss xmm3, dword ptr [rip + 0x46565b]
0x145958d85: 4c89f2 mov rdx, r14
0x145958d88: e86325fdff call 0x14592b2f0
0x145958d8d: 488b442458 mov rax, qword ptr [rsp + 0x58]
0x145958d92: 4885c0 test rax, rax
0x145958d95: 0f845e080000 je 0x1459595f9
0x145958d9b: 31c9 xor ecx, ecx
0x145958d9d: 8b7c2444 mov edi, dword ptr [rsp + 0x44]
0x145958da1: 85ff test edi, edi
0x145958da3: 0f94c1 sete cl
0x145958da6: 418b96e0040000 mov edx, dword ptr [r14 + 0x4e0]
0x145958dad: 0f57c0 xorps xmm0, xmm0
0x145958db0: f3480f2ac2 cvtsi2ss xmm0, rdx
0x145958db5: f30f5805ab854500 addss xmm0, dword ptr [rip + 0x4585ab]
0x145958dbd: f30f590583dd4500 mulss xmm0, dword ptr [rip + 0x45dd83]
0x145958dc5: f30f100d93444500 movss xmm1, dword ptr [rip + 0x454493]
0x145958dcd: f30f58c1 addss xmm0, xmm1
0x145958dd1: f3410f59472c mulss xmm0, dword ptr [r15 + 0x2c]
0x145958dd7: f3410f598684040000 mulss xmm0, dword ptr [r14 + 0x484]
0x145958de0: 488b542448 mov rdx, qword ptr [rsp + 0x48]
0x145958de5: 48899424b8000000 mov qword ptr [rsp + 0xb8], rdx
0x145958ded: 488b542450 mov rdx, qword ptr [rsp + 0x50]
0x145958df2: 4c8d3cc2 lea r15, [rdx + rax*8]
0x145958df6: 4d8b8e68050000 mov r9, qword ptr [r14 + 0x568]
0x145958dfd: 4d8b8670050000 mov r8, qword ptr [r14 + 0x570]
0x145958e04: 4d8b96e0050000 mov r10, qword ptr [r14 + 0x5e0]
0x145958e0b: 4d8b9ee8050000 mov r11, qword ptr [r14 + 0x5e8]
0x145958e12: 488d05a7002b01 lea rax, [rip + 0x12b00a7]
0x145958e19: f30f101488 movss xmm2, dword ptr [rax + rcx*4]
0x145958e1e: f30f5fc1 maxss xmm0, xmm1
0x145958e22: 498b8618010000 mov rax, qword ptr [r14 + 0x118]
0x145958e29: 4889842490000000 mov qword ptr [rsp + 0x90], rax
0x145958e31: 498b8e20010000 mov rcx, qword ptr [r14 + 0x120]
0x145958e38: 4c895c2470 mov qword ptr [rsp + 0x70], r11
0x145958e3d: 4983e3fe and r11, 0xfffffffffffffffe
0x145958e41: 4c899c24e0000000 mov qword ptr [rsp + 0xe0], r11
0x145958e49: 4c89e0 mov rax, r12
0x145958e4c: 4883e0fe and rax, 0xfffffffffffffffe
0x145958e50: 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
0x145958e58: 4c898424a8000000 mov qword ptr [rsp + 0xa8], r8
0x145958e60: 4d69d8d8010000 imul r11, r8, 0x1d8
0x145958e67: 4c899424a0000000 mov qword ptr [rsp + 0xa0], r10
0x145958e6f: 498d82f9000000 lea rax, [r10 + 0xf9]
0x145958e76: 4889842498000000 mov qword ptr [rsp + 0x98], rax
0x145958e7e: 488b442478 mov rax, qword ptr [rsp + 0x78]
0x145958e83: 4805a8000000 add rax, 0xa8
0x145958e89: 48898424c0000000 mov qword ptr [rsp + 0xc0], rax
0x145958e91: 48c1e104 shl rcx, 4
0x145958e95: 48898c2488000000 mov qword ptr [rsp + 0x88], rcx
0x145958e9d: 0f57db xorps xmm3, xmm3
0x145958ea0: 41be20000000 mov r14d, 0x20
0x145958ea6: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
0x145958eaf: 48899424b0000000 mov qword ptr [rsp + 0xb0], rdx
0x145958eb7: 4889d1 mov rcx, rdx
0x145958eba: 4889ac24d0000000 mov qword ptr [rsp + 0xd0], rbp
0x145958ec2: 4c89a424c8000000 mov qword ptr [rsp + 0xc8], r12
0x145958eca: 4c89bc24d8000000 mov qword ptr [rsp + 0xd8], r15
0x145958ed2: eb25 jmp 0x145958ef9
0x145958ed4: 490f44dd cmove rbx, r13
0x145958ed8: b801000000 mov eax, 1
0x145958edd: 4889442430 mov qword ptr [rsp + 0x30], rax
0x145958ee2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958ef0: 4d85f6 test r14, r14
0x145958ef3: 0f84d3060000 je 0x1459595cc
0x145958ef9: 4c39f9 cmp rcx, r15
0x145958efc: 0f84ca060000 je 0x1459595cc
0x145958f02: 49ffce dec r14
0x145958f05: 4c8b29 mov r13, qword ptr [rcx]
0x145958f08: 4883c108 add rcx, 8
0x145958f0c: 4531d2 xor r10d, r10d
0x145958f0f: 4c89c8 mov rax, r9
0x145958f12: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145958f20: 4d39d3 cmp r11, r10
0x145958f23: 74cb je 0x145958ef0
0x145958f25: 4981c2d8010000 add r10, 0x1d8
0x145958f2c: 4c39a8f0000000 cmp qword ptr [rax + 0xf0], r13
0x145958f33: 488d80d8010000 lea rax, [rax + 0x1d8]
0x145958f3a: 75e4 jne 0x145958f20
0x145958f3c: f3430f106c11b8 movss xmm5, dword ptr [r9 + r10 - 0x48]
0x145958f43: 0f2edd ucomiss xmm3, xmm5
0x145958f46: 7348 jae 0x145958f90
0x145958f48: 440f28ce movaps xmm9, xmm6
0x145958f4c: f3470f5c4c11b4 subss xmm9, dword ptr [r9 + r10 - 0x4c]
0x145958f53: f3440f5ecd divss xmm9, xmm5
0x145958f58: 0f57ed xorps xmm5, xmm5
0x145958f5b: f3410f5fe9 maxss xmm5, xmm9
0x145958f60: 440f28c9 movaps xmm9, xmm1
0x145958f64: f3440f5dcd minss xmm9, xmm5
0x145958f69: f2470f105c119c movsd xmm11, qword ptr [r9 + r10 - 0x64]
0x145958f70: f2470f106411a8 movsd xmm12, qword ptr [r9 + r10 - 0x58]
0x145958f77: 450f5ce3 subps xmm12, xmm11
0x145958f7b: f3410f12e9 movsldup xmm5, xmm9
0x145958f80: 410f59ec mulps xmm5, xmm12
0x145958f84: 410f58eb addps xmm5, xmm11
0x145958f88: 85ff test edi, edi
0x145958f8a: 753c jne 0x145958fc8
0x145958f8c: eb0d jmp 0x145958f9b
0x145958f8e: 6690 nop
0x145958f90: f2430f106c11a8 movsd xmm5, qword ptr [r9 + r10 - 0x58]
0x145958f97: 85ff test edi, edi
0x145958f99: 752d jne 0x145958fc8
0x145958f9b: 440f28cd movaps xmm9, xmm5
0x145958f9f: 450f5cc8 subps xmm9, xmm8
0x145958fa3: 450f59c9 mulps xmm9, xmm9
0x145958fa7: f3450f16d9 movshdup xmm11, xmm9
0x145958fac: f3450f58d9 addss xmm11, xmm9
0x145958fb1: 450f57c9 xorps xmm9, xmm9
0x145958fb5: f3450f51cb sqrtss xmm9, xmm11
0x145958fba: 440f2e0dded04a00 ucomiss xmm9, dword ptr [rip + 0x4ad0de]
0x145958fc2: 0f8728ffffff ja 0x145958ef0
0x145958fc8: f3470f104c11d0 movss xmm9, dword ptr [r9 + r10 - 0x30]
0x145958fcf: 440f2ece ucomiss xmm9, xmm6
0x145958fd3: 0f8717ffffff ja 0x145958ef0
0x145958fd9: 4b8b941140feffff mov rdx, qword ptr [r9 + r10 - 0x1c0]
0x145958fe1: 4883faff cmp rdx, -1
0x145958fe5: 0f8533010000 jne 0x14595911e
0x145958feb: 43807c11f801 cmp byte ptr [r9 + r10 - 8], 1
0x145958ff1: 0f8427010000 je 0x14595911e
0x145958ff7: 4d89e0 mov r8, r12
0x145958ffa: f3440f100ddd444500 movss xmm9, dword ptr [rip + 0x4544dd]
0x145959003: 48837c247000 cmp qword ptr [rsp + 0x70], 0
0x145959009: 0f8400010000 je 0x14595910f
0x14595900f: 48837c247001 cmp qword ptr [rsp + 0x70], 1
0x145959015: 7511 jne 0x145959028
0x145959017: 4531e4 xor r12d, r12d
0x14595901a: f3440f100dbd444500 movss xmm9, dword ptr [rip + 0x4544bd]
0x145959023: e9b8000000 jmp 0x1459590e0
0x145959028: 4889e8 mov rax, rbp
0x14595902b: 488bac2498000000 mov rbp, qword ptr [rsp + 0x98]
0x145959033: 4531e4 xor r12d, r12d
0x145959036: f3440f100da1444500 movss xmm9, dword ptr [rip + 0x4544a1]
0x14595903f: eb24 jmp 0x145959065
0x145959041: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145959050: 4983c402 add r12, 2
0x145959054: 4881c500010000 add rbp, 0x100
0x14595905b: 4c39a424e0000000 cmp qword ptr [rsp + 0xe0], r12
0x145959063: 7471 je 0x1459590d6
0x145959065: f6458001 test byte ptr [rbp - 0x80], 1
0x145959069: 450f28d9 movaps xmm11, xmm9
0x14595906d: 7541 jne 0x1459590b0
0x14595906f: f3440f109d7bffffff movss xmm11, dword ptr [rbp - 0x85]
0x145959078: f3450f58d9 addss xmm11, xmm9
0x14595907d: 4c39ad57ffffff cmp qword ptr [rbp - 0xa9], r13
0x145959084: 7433 je 0x1459590b9
0x145959086: f6450001 test byte ptr [rbp], 1
0x14595908a: 450f28d9 movaps xmm11, xmm9
0x14595908e: 7537 jne 0x1459590c7
0x145959090: f3440f105dfb movss xmm11, dword ptr [rbp - 5]
0x145959096: f3450f58d9 addss xmm11, xmm9
0x14595909b: 4c396dd7 cmp qword ptr [rbp - 0x29], r13
0x14595909f: 75af jne 0x145959050
0x1459590a1: eb2a jmp 0x1459590cd
0x1459590a3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459590b0: 4c39ad57ffffff cmp qword ptr [rbp - 0xa9], r13
0x1459590b7: 75cd jne 0x145959086
0x1459590b9: 450f28cb movaps xmm9, xmm11
0x1459590bd: f6450001 test byte ptr [rbp], 1
0x1459590c1: 450f28d9 movaps xmm11, xmm9
0x1459590c5: 74c9 je 0x145959090
0x1459590c7: 4c396dd7 cmp qword ptr [rbp - 0x29], r13
0x1459590cb: 7583 jne 0x145959050
0x1459590cd: 450f28cb movaps xmm9, xmm11
0x1459590d1: e97affffff jmp 0x145959050
0x1459590d6: f644247001 test byte ptr [rsp + 0x70], 1
0x1459590db: 4889c5 mov rbp, rax
0x1459590de: 742f je 0x14595910f
0x1459590e0: 49c1e407 shl r12, 7
0x1459590e4: 488b8424a0000000 mov rax, qword ptr [rsp + 0xa0]
0x1459590ec: 42f644207901 test byte ptr [rax + r12 + 0x79], 1
0x1459590f2: 450f28d9 movaps xmm11, xmm9
0x1459590f6: 750c jne 0x145959104
0x1459590f8: f3460f105c2074 movss xmm11, dword ptr [rax + r12 + 0x74]
0x1459590ff: f3450f58d9 addss xmm11, xmm9
0x145959104: 4e396c2050 cmp qword ptr [rax + r12 + 0x50], r13
0x145959109: 7504 jne 0x14595910f
0x14595910b: 450f28cb movaps xmm9, xmm11
0x14595910f: 470f2e4c1180 ucomiss xmm9, dword ptr [r9 + r10 - 0x80]
0x145959115: 4d89c4 mov r12, r8
0x145959118: 0f83d2fdffff jae 0x145958ef0
0x14595911e: 440f28cd movaps xmm9, xmm5
0x145959122: 440f5ccf subps xmm9, xmm7
0x145959126: 450f59c9 mulps xmm9, xmm9
0x14595912a: f3450f16d9 movshdup xmm11, xmm9
0x14595912f: f3450f58d9 addss xmm11, xmm9
0x145959134: 450f57ff xorps xmm15, xmm15
0x145959138: f3450f51fb sqrtss xmm15, xmm11
0x14595913d: 450f28cf movaps xmm9, xmm15
0x145959141: f3440f5e0dea1b4600 divss xmm9, dword ptr [rip + 0x461bea]
0x14595914a: f3440f58c9 addss xmm9, xmm1
0x14595914f: f3440f102588d84a00 movss xmm12, dword ptr [rip + 0x4ad888]
0x145959158: f3440f101d67834500 movss xmm11, dword ptr [rip + 0x458367]
0x145959161: 4883faff cmp rdx, -1
0x145959165: 7541 jne 0x1459591a8
0x145959167: 43807c11f801 cmp byte ptr [r9 + r10 - 8], 1
0x14595916d: f3440f1025221f4600 movss xmm12, dword ptr [rip + 0x461f22]
0x145959176: f3440f101d01434500 movss xmm11, dword ptr [rip + 0x454301]
0x14595917f: 7427 je 0x1459591a8
0x145959181: f3470f105c1180 movss xmm11, dword ptr [r9 + r10 - 0x80]
0x145959188: f3440f5ed8 divss xmm11, xmm0
0x14595918d: 440f28e1 movaps xmm12, xmm1
0x145959191: f3450f5fe3 maxss xmm12, xmm11
0x145959196: f3440f101dc9404500 movss xmm11, dword ptr [rip + 0x4540c9]
0x14595919f: f3450f5ddc minss xmm11, xmm12
0x1459591a4: 450f57e4 xorps xmm12, xmm12
0x1459591a8: 4983fc01 cmp r12, 1
0x1459591ac: 753f jne 0x1459591ed
0x1459591ae: 4531ff xor r15d, r15d
0x1459591b1: 31d2 xor edx, edx
0x1459591b3: 4939f7 cmp r15, rsi
0x1459591b6: 0f84e5000000 je 0x1459592a1
0x1459591bc: 49c1e707 shl r15, 7
0x1459591c0: b800000000 mov eax, 0
0x1459591c5: 4c8b442478 mov r8, qword ptr [rsp + 0x78]
0x1459591ca: 4f396c3828 cmp qword ptr [r8 + r15 + 0x28], r13
0x1459591cf: 0f85ce000000 jne 0x1459592a3
0x1459591d5: 4c037c2478 add r15, qword ptr [rsp + 0x78]
0x1459591da: 4d8b4718 mov r8, qword ptr [r15 + 0x18]
0x1459591de: 31c0 xor eax, eax
0x1459591e0: 4180783900 cmp byte ptr [r8 + 0x39], 0
0x1459591e5: 0f95c0 setne al
0x1459591e8: e9b6000000 jmp 0x1459592a3
0x1459591ed: 488bac24c0000000 mov rbp, qword ptr [rsp + 0xc0]
0x1459591f5: 4531e4 xor r12d, r12d
0x1459591f8: 31d2 xor edx, edx
0x1459591fa: eb20 jmp 0x14595921c
0x1459591fc: 0f1f4000 nop dword ptr [rax]
0x145959200: 31c0 xor eax, eax
0x145959202: 4c01c2 add rdx, r8
0x145959205: 4801c2 add rdx, rax
0x145959208: 4881c500010000 add rbp, 0x100
0x14595920f: 49ffc4 inc r12
0x145959212: 4c3ba424e8000000 cmp r12, qword ptr [rsp + 0xe8]
0x14595921a: 7462 je 0x14595927e
0x14595921c: 4d89e7 mov r15, r12
0x14595921f: 4c39e6 cmp rsi, r12
0x145959222: 744c je 0x145959270
0x145959224: 41b800000000 mov r8d, 0
0x14595922a: 4c396d80 cmp qword ptr [rbp - 0x80], r13
0x14595922e: 7512 jne 0x145959242
0x145959230: 488b8570ffffff mov rax, qword ptr [rbp - 0x90]
0x145959237: 4531c0 xor r8d, r8d
0x14595923a: 80783900 cmp byte ptr [rax + 0x39], 0
0x14595923e: 410f95c0 setne r8b
0x145959242: 4d8d6701 lea r12, [r15 + 1]
0x145959246: 4939f4 cmp r12, rsi
0x145959249: 74b5 je 0x145959200
0x14595924b: b800000000 mov eax, 0
0x145959250: 4c396d00 cmp qword ptr [rbp], r13
0x145959254: 75ac jne 0x145959202
0x145959256: 488b7df0 mov rdi, qword ptr [rbp - 0x10]
0x14595925a: 31c0 xor eax, eax
0x14595925c: 807f3900 cmp byte ptr [rdi + 0x39], 0
0x145959260: 0f95c0 setne al
0x145959263: eb9d jmp 0x145959202
0x145959265: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145959270: 4531c0 xor r8d, r8d
0x145959273: 4d8d6701 lea r12, [r15 + 1]
0x145959277: 4939f4 cmp r12, rsi
0x14595927a: 75cf jne 0x14595924b
0x14595927c: eb82 jmp 0x145959200
0x14595927e: 4c8ba424c8000000 mov r12, qword ptr [rsp + 0xc8]
0x145959286: 41f6c401 test r12b, 1
0x14595928a: 488bac24d0000000 mov rbp, qword ptr [rsp + 0xd0]
0x145959292: 7412 je 0x1459592a6
0x145959294: 4983c702 add r15, 2
0x145959298: 4939f7 cmp r15, rsi
0x14595929b: 0f851bffffff jne 0x1459591bc
0x1459592a1: 31c0 xor eax, eax
0x1459592a3: 4801c2 add rdx, rax
0x1459592a6: 4885d2 test rdx, rdx
0x1459592a9: 4c8b842480000000 mov r8, qword ptr [rsp + 0x80]
0x1459592b1: 8b7c2444 mov edi, dword ptr [rsp + 0x44]
0x1459592b5: 4c8bbc24d8000000 mov r15, qword ptr [rsp + 0xd8]
0x1459592bd: 7807 js 0x1459592c6
0x1459592bf: f34c0f2aea cvtsi2ss xmm13, rdx
0x1459592c4: eb16 jmp 0x1459592dc
0x1459592c6: 4889d0 mov rax, rdx
0x1459592c9: 48d1e8 shr rax, 1
0x1459592cc: 83e201 and edx, 1
0x1459592cf: 4809c2 or rdx, rax
0x1459592d2: f34c0f2aea cvtsi2ss xmm13, rdx
0x1459592d7: f3450f58ed addss xmm13, xmm13
0x1459592dc: f3440f10159b414500 movss xmm10, dword ptr [rip + 0x45419b]
0x1459592e5: f3450f5ed1 divss xmm10, xmm9
0x1459592ea: 440f28cd movaps xmm9, xmm5
0x1459592ee: 450f5cc8 subps xmm9, xmm8
0x1459592f2: 450f59c9 mulps xmm9, xmm9
0x1459592f6: f3410f16e1 movshdup xmm4, xmm9
0x1459592fb: f3410f58e1 addss xmm4, xmm9
0x145959300: f30f51e4 sqrtss xmm4, xmm4
0x145959304: f30f59e2 mulss xmm4, xmm2
0x145959308: f3440f5cd4 subss xmm10, xmm4
0x14595930d: f3450f58d4 addss xmm10, xmm12
0x145959312: f3440f592df5f92a01 mulss xmm13, dword ptr [rip + 0x12af9f5]
0x14595931b: f3450f5eeb divss xmm13, xmm11
0x145959320: f3450f58ea addss xmm13, xmm10
0x145959325: 410fb64039 movzx eax, byte ptr [r8 + 0x39]
0x14595932a: 488d155f332b01 lea rdx, [rip + 0x12b335f]
0x145959331: 48630482 movsxd rax, dword ptr [rdx + rax*4]
0x145959335: 4801d0 add rax, rdx
0x145959338: ffe0 jmp rax
0x14595933a: 4b8b941130feffff mov rdx, qword ptr [r9 + r10 - 0x1d0]
0x145959342: 4b8b841138feffff mov rax, qword ptr [r9 + r10 - 0x1c8]
0x14595934a: 48c1e004 shl rax, 4
0x14595934e: 4c8d0440 lea r8, [rax + rax*2]
0x145959352: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145959360: 4d85c0 test r8, r8
0x145959363: 0f84d5010000 je 0x14595953e
0x145959369: 4983c0d0 add r8, -0x30
0x14595936d: 817a105c010000 cmp dword ptr [rdx + 0x10], 0x15c
0x145959374: 488d5230 lea rdx, [rdx + 0x30]
0x145959378: 75e6 jne 0x145959360
0x14595937a: e90a020000 jmp 0x145959589
0x14595937f: 4d89e0 mov r8, r12
0x145959382: 4c8ba424a8000000 mov r12, qword ptr [rsp + 0xa8]
0x14595938a: 4d85e4 test r12, r12
0x14595938d: 0f84c3010000 je 0x145959556
0x145959393: 4d8d9190010000 lea r10, [r9 + 0x190]
0x14595939a: 31d2 xor edx, edx
0x14595939c: eb17 jmp 0x1459593b5
0x14595939e: 6690 nop
0x1459593a0: 31c0 xor eax, eax
0x1459593a2: 4801c2 add rdx, rax
0x1459593a5: 4981c2d8010000 add r10, 0x1d8
0x1459593ac: 49ffcc dec r12
0x1459593af: 0f84a3010000 je 0x145959558
0x1459593b5: 4180ba20ffffff00 cmp byte ptr [r10 - 0xe0], 0
0x1459593bd: 75e1 jne 0x1459593a0
0x1459593bf: f3450f100a movss xmm9, dword ptr [r10]
0x1459593c4: 410f2ed9 ucomiss xmm3, xmm9
0x1459593c8: 733e jae 0x145959408
0x1459593ca: 0f28e6 movaps xmm4, xmm6
0x1459593cd: f3410f5c62fc subss xmm4, dword ptr [r10 - 4]
0x1459593d3: f3410f5ee1 divss xmm4, xmm9
0x1459593d8: 450f57c9 xorps xmm9, xmm9
0x1459593dc: f3440f5fcc maxss xmm9, xmm4
0x1459593e1: 0f28e1 movaps xmm4, xmm1
0x1459593e4: f3410f5de1 minss xmm4, xmm9
0x1459593e9: f2450f1052e4 movsd xmm10, qword ptr [r10 - 0x1c]
0x1459593ef: f2450f105af0 movsd xmm11, qword ptr [r10 - 0x10]
0x1459593f5: 450f5cda subps xmm11, xmm10
0x1459593f9: f3440f12cc movsldup xmm9, xmm4
0x1459593fe: 450f59cb mulps xmm9, xmm11
0x145959402: 450f58ca addps xmm9, xmm10
0x145959406: eb06 jmp 0x14595940e
0x145959408: f2450f104af0 movsd xmm9, qword ptr [r10 - 0x10]
0x14595940e: 440f5ccd subps xmm9, xmm5
0x145959412: 450f59c9 mulps xmm9, xmm9
0x145959416: f3410f16e1 movshdup xmm4, xmm9
0x14595941b: f3410f58e1 addss xmm4, xmm9
0x145959420: f30f51e4 sqrtss xmm4, xmm4
0x145959424: f3440f100d9b804500 movss xmm9, dword ptr [rip + 0x45809b]
0x14595942d: 440f2ecc ucomiss xmm9, xmm4
0x145959431: 0f8269ffffff jb 0x1459593a0
0x145959437: b801000000 mov eax, 1
0x14595943c: 4801c2 add rdx, rax
0x14595943f: 4981c2d8010000 add r10, 0x1d8
0x145959446: 49ffcc dec r12
0x145959449: 0f8566ffffff jne 0x1459593b5
0x14595944f: e904010000 jmp 0x145959558
0x145959454: f30f102524404500 movss xmm4, dword ptr [rip + 0x454024]
0x14595945c: f3440f5efc divss xmm15, xmm4
0x145959461: f3440f58f9 addss xmm15, xmm1
0x145959466: f3410f5ee7 divss xmm4, xmm15
0x14595946b: f3440f58ec addss xmm13, xmm4
0x145959470: 410f28ed movaps xmm5, xmm13
0x145959474: f30f58e9 addss xmm5, xmm1
0x145959478: 4939ed cmp r13, rbp
0x14595947b: 0f8515010000 jne 0x145959596
0x145959481: e914010000 jmp 0x14595959a
0x145959486: 4b8b941130feffff mov rdx, qword ptr [r9 + r10 - 0x1d0]
0x14595948e: 4b8b841138feffff mov rax, qword ptr [r9 + r10 - 0x1c8]
0x145959496: 48c1e004 shl rax, 4
0x14595949a: 4c8d0440 lea r8, [rax + rax*2]
0x14595949e: 6690 nop
0x1459594a0: 4d85c0 test r8, r8
0x1459594a3: 0f84e0000000 je 0x145959589
0x1459594a9: 4983c0d0 add r8, -0x30
0x1459594ad: 817a10ac000000 cmp dword ptr [rdx + 0x10], 0xac
0x1459594b4: 488d5230 lea rdx, [rdx + 0x30]
0x1459594b8: 75e6 jne 0x1459594a0
0x1459594ba: f3440f58e9 addss xmm13, xmm1
0x1459594bf: 488b942488000000 mov rdx, qword ptr [rsp + 0x88]
0x1459594c7: 488b842490000000 mov rax, qword ptr [rsp + 0x90]
0x1459594cf: 90 nop
0x1459594d0: 4885d2 test rdx, rdx
0x1459594d3: 0f84db000000 je 0x1459595b4
0x1459594d9: 4989c0 mov r8, rax
0x1459594dc: 4883c010 add rax, 0x10
0x1459594e0: 4883c2f0 add rdx, -0x10
0x1459594e4: 4d3928 cmp qword ptr [r8], r13
0x1459594e7: 75e7 jne 0x1459594d0
0x1459594e9: f3410f106008 movss xmm4, dword ptr [r8 + 8]
0x1459594ef: 0f2ee6 ucomiss xmm4, xmm6
0x1459594f2: 76dc jbe 0x1459594d0
0x1459594f4: e990000000 jmp 0x145959589
0x1459594f9: f3450f58e4 addss xmm12, xmm12
0x1459594fe: eb2a jmp 0x14595952a
0x145959500: f3430f10641180 movss xmm4, dword ptr [r9 + r10 - 0x80]
0x145959507: f3430f106c1184 movss xmm5, dword ptr [r9 + r10 - 0x7c]
0x14595950e: f30f5fe9 maxss xmm5, xmm1
0x145959512: f30f5ee5 divss xmm4, xmm5
0x145959516: 0f28e9 movaps xmm5, xmm1
0x145959519: f30f5cec subss xmm5, xmm4
0x14595951d: f30f592d731b4600 mulss xmm5, dword ptr [rip + 0x461b73]
0x145959525: f3440f58e5 addss xmm12, xmm5
0x14595952a: f3450f58ec addss xmm13, xmm12
0x14595952f: 410f28ed movaps xmm5, xmm13
0x145959533: f30f58e9 addss xmm5, xmm1
0x145959537: 4939ed cmp r13, rbp
0x14595953a: 755a jne 0x145959596
0x14595953c: eb5c jmp 0x14595959a
0x14595953e: f3440f582d353f4500 addss xmm13, dword ptr [rip + 0x453f35]
0x145959547: 410f28ed movaps xmm5, xmm13
0x14595954b: f30f58e9 addss xmm5, xmm1
0x14595954f: 4939ed cmp r13, rbp
0x145959552: 7542 jne 0x145959596
0x145959554: eb44 jmp 0x14595959a
0x145959556: 31d2 xor edx, edx
0x145959558: 4885d2 test rdx, rdx
0x14595955b: 7807 js 0x145959564
0x14595955d: f3480f2aea cvtsi2ss xmm5, rdx
0x145959562: eb15 jmp 0x145959579
0x145959564: 4889d0 mov rax, rdx
0x145959567: 48d1e8 shr rax, 1
0x14595956a: 83e201 and edx, 1
0x14595956d: 4809c2 or rdx, rax
0x145959570: f3480f2aea cvtsi2ss xmm5, rdx
0x145959575: f30f58ed addss xmm5, xmm5
0x145959579: 4d89c4 mov r12, r8
0x14595957c: f30f592d8cf24500 mulss xmm5, dword ptr [rip + 0x45f28c]
0x145959584: f3440f58ed addss xmm13, xmm5
0x145959589: 410f28ed movaps xmm5, xmm13
0x14595958d: f30f58e9 addss xmm5, xmm1
0x145959591: 4939ed cmp r13, rbp
0x145959594: 7404 je 0x14595959a
0x145959596: 410f28ed movaps xmm5, xmm13
0x14595959a: 410f2eee ucomiss xmm5, xmm14
0x14595959e: 0f96c0 setbe al
0x1459595a1: 84442430 test byte ptr [rsp + 0x30], al
0x1459595a5: 0f8529f9ffff jne 0x145958ed4
0x1459595ab: 440f28f5 movaps xmm14, xmm5
0x1459595af: e920f9ffff jmp 0x145958ed4
0x1459595b4: f3440f582d73814500 addss xmm13, dword ptr [rip + 0x458173]
0x1459595bd: 410f28ed movaps xmm5, xmm13
0x1459595c1: f30f58e9 addss xmm5, xmm1
0x1459595c5: 4939ed cmp r13, rbp
0x1459595c8: 75cc jne 0x145959596
0x1459595ca: ebce jmp 0x14595959a
0x1459595cc: 488b9424b8000000 mov rdx, qword ptr [rsp + 0xb8]
0x1459595d4: 4885d2 test rdx, rdx
0x1459595d7: 0f84e4010000 je 0x1459597c1
0x1459595dd: 48c1e203 shl rdx, 3
0x1459595e1: 41b808000000 mov r8d, 8
0x1459595e7: 488b8c24b0000000 mov rcx, qword ptr [rsp + 0xb0]
0x1459595ef: e8dc8b6afa call 0x1400021d0
0x1459595f4: e9c8010000 jmp 0x1459597c1
0x1459595f9: 488b542448 mov rdx, qword ptr [rsp + 0x48]
0x1459595fe: 4885d2 test rdx, rdx
0x145959601: 7414 je 0x145959617
0x145959603: 488b4c2450 mov rcx, qword ptr [rsp + 0x50]
0x145959608: 48c1e203 shl rdx, 3
0x14595960c: 41b808000000 mov r8d, 8
0x145959612: e8b98b6afa call 0x1400021d0
0x145959617: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
0x145959620: e99c010000 jmp 0x1459597c1
0x145959625: 488b542448 mov rdx, qword ptr [rsp + 0x48]
0x14595962a: 4885d2 test rdx, rdx
0x14595962d: 0f8484010000 je 0x1459597b7
0x145959633: 48c1e203 shl rdx, 3
0x145959637: 41b808000000 mov r8d, 8
0x14595963d: e88e8b6afa call 0x1400021d0
0x145959642: e970010000 jmp 0x1459597b7
0x145959647: 488b9118ffffff mov rdx, qword ptr [rcx - 0xe8]
0x14595964e: f30f104184 movss xmm0, dword ptr [rcx - 0x7c]
0x145959653: f30f5f05053c4500 maxss xmm0, dword ptr [rip + 0x453c05]
0x14595965b: f30f105180 movss xmm2, dword ptr [rcx - 0x80]
0x145959660: f30f5ed0 divss xmm2, xmm0
0x145959664: 48894c2448 mov qword ptr [rsp + 0x48], rcx
0x145959669: 4889442450 mov qword ptr [rsp + 0x50], rax
0x14595966e: 488d442438 lea rax, [rsp + 0x38]
0x145959673: 4889442458 mov qword ptr [rsp + 0x58], rax
0x145959678: 4889442460 mov qword ptr [rsp + 0x60], rax
0x14595967d: 4c89742468 mov qword ptr [rsp + 0x68], r14
0x145959682: 488d4c2448 lea rcx, [rsp + 0x48]
0x145959687: e824640900 call 0x1459efab0
0x14595968c: 4889c3 mov rbx, rax
0x14595968f: b101 mov cl, 1
0x145959691: e9dcf2ffff jmp 0x145958972
0x145959696: f20f105406a8 movsd xmm2, qword ptr [rsi + rax - 0x58]
0x14595969c: 0f5cd7 subps xmm2, xmm7
0x14595969f: 0f59d2 mulps xmm2, xmm2
0x1459596a2: f30f16da movshdup xmm3, xmm2
0x1459596a6: f30f58da addss xmm3, xmm2
0x1459596aa: 0f57d2 xorps xmm2, xmm2
0x1459596ad: f30f51d3 sqrtss xmm2, xmm3
0x1459596b1: 440f2ec2 ucomiss xmm8, xmm2
0x1459596b5: 0f83e7000000 jae 0x1459597a2
0x1459596bb: b801000000 mov eax, 1
0x1459596c0: 4889442430 mov qword ptr [rsp + 0x30], rax
0x1459596c5: 84c9 test cl, cl
0x1459596c7: 0f85f4000000 jne 0x1459597c1
0x1459596cd: 0f137c2438 movlps qword ptr [rsp + 0x38], xmm7
0x1459596d2: 897c2440 mov dword ptr [rsp + 0x40], edi
0x1459596d6: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
0x1459596df: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x1459596e8: 488d4c2448 lea rcx, [rsp + 0x48]
0x1459596ed: 4c8d442438 lea r8, [rsp + 0x38]
0x1459596f2: f30f101de64c4600 movss xmm3, dword ptr [rip + 0x464ce6]
0x1459596fa: 4c89f2 mov rdx, r14
0x1459596fd: e8ee1bfdff call 0x14592b2f0
0x145959702: 488b542448 mov rdx, qword ptr [rsp + 0x48]
0x145959707: 488b4c2450 mov rcx, qword ptr [rsp + 0x50]
0x14595970c: 488b442458 mov rax, qword ptr [rsp + 0x58]
0x145959711: 4885c0 test rax, rax
0x145959714: 746d je 0x145959783
0x145959716: 488d04c1 lea rax, [rcx + rax*8]
0x14595971a: 4d69c4d8010000 imul r8, r12, 0x1d8
0x145959721: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
0x14595972a: 4989c9 mov r9, rcx
0x14595972d: 498b19 mov rbx, qword ptr [r9]
0x145959730: 4983c108 add r9, 8
0x145959734: 4d89c2 mov r10, r8
0x145959737: 4889f7 mov rdi, rsi
0x14595973a: 660f1f440000 nop word ptr [rax + rax]
0x145959740: 4d85d2 test r10, r10
0x145959743: 7426 je 0x14595976b
0x145959745: 4989fb mov r11, rdi
0x145959748: 4881c7d8010000 add rdi, 0x1d8
0x14595974f: 4981c228feffff add r10, -0x1d8
0x145959756: 49399bf0000000 cmp qword ptr [r11 + 0xf0], rbx
0x14595975d: 75e1 jne 0x145959740
0x14595975f: 410f2eb3a8010000 ucomiss xmm6, dword ptr [r11 + 0x1a8]
0x145959767: 72d7 jb 0x145959740
0x145959769: eb07 jmp 0x145959772
0x14595976b: 4939c1 cmp r9, rax
0x14595976e: 75bd jne 0x14595972d
0x145959770: eb0a jmp 0x14595977c
0x145959772: b801000000 mov eax, 1
0x145959777: 4889442430 mov qword ptr [rsp + 0x30], rax
0x14595977c: 4885d2 test rdx, rdx
0x14595977f: 7510 jne 0x145959791
0x145959781: eb3e jmp 0x1459597c1
0x145959783: 48c744243000000000 mov qword ptr [rsp + 0x30], 0
0x14595978c: 4885d2 test rdx, rdx
0x14595978f: 7430 je 0x1459597c1
0x145959791: 48c1e203 shl rdx, 3
0x145959795: 41b808000000 mov r8d, 8
0x14595979b: e8308a6afa call 0x1400021d0
0x1459597a0: eb1f jmp 0x1459597c1
0x1459597a2: f30f580dd6e45c00 addss xmm1, dword ptr [rip + 0x5ce4d6]
0x1459597aa: 0f2ec8 ucomiss xmm1, xmm0
0x1459597ad: 480f46dd cmovbe rbx, rbp
0x1459597b1: 84c9 test cl, cl
0x1459597b3: 480f44dd cmove rbx, rbp
0x1459597b7: b801000000 mov eax, 1
0x1459597bc: 4889442430 mov qword ptr [rsp + 0x30], rax
0x1459597c1: 488b442430 mov rax, qword ptr [rsp + 0x30]
0x1459597c6: 4889da mov rdx, rbx
0x1459597c9: 0f28b424f0000000 movaps xmm6, xmmword ptr [rsp + 0xf0]
0x1459597d1: 0f28bc2400010000 movaps xmm7, xmmword ptr [rsp + 0x100]
0x1459597d9: 440f28842410010000 movaps xmm8, xmmword ptr [rsp + 0x110]
0x1459597e2: 440f288c2420010000 movaps xmm9, xmmword ptr [rsp + 0x120]
0x1459597eb: 440f28942430010000 movaps xmm10, xmmword ptr [rsp + 0x130]
0x1459597f4: 440f289c2440010000 movaps xmm11, xmmword ptr [rsp + 0x140]
0x1459597fd: 440f28a42450010000 movaps xmm12, xmmword ptr [rsp + 0x150]
0x145959806: 440f28ac2460010000 movaps xmm13, xmmword ptr [rsp + 0x160]
0x14595980f: 440f28b42470010000 movaps xmm14, xmmword ptr [rsp + 0x170]
0x145959818: 440f28bc2480010000 movaps xmm15, xmmword ptr [rsp + 0x180]
0x145959821: 4881c498010000 add rsp, 0x198
0x145959828: 5b pop rbx
0x145959829: 5d pop rbp
0x14595982a: 5f pop rdi
0x14595982b: 5e pop rsi
0x14595982c: 415c pop r12
0x14595982e: 415d pop r13
0x145959830: 415e pop r14
0x145959832: 415f pop r15
0x145959834: c3 ret
0x145959835: 4989ef mov r15, rbp
0x145959838: 4989c9 mov r9, rcx
0x14595983b: eb0b jmp 0x145959848
0x14595983d: 31ed xor ebp, ebp
0x14595983f: 4939c1 cmp r9, rax
0x145959842: 0f84bef4ffff je 0x145958d06
0x145959848: 498b19 mov rbx, qword ptr [r9]
0x14595984b: 4983c108 add r9, 8
0x14595984f: 4531d2 xor r10d, r10d
0x145959852: eb18 jmp 0x14595986c
0x145959854: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145959860: 4981c2d8010000 add r10, 0x1d8
0x145959867: 4d39d0 cmp r8, r10
0x14595986a: 74d1 je 0x14595983d
0x14595986c: 4a399c12f0000000 cmp qword ptr [rdx + r10 + 0xf0], rbx
0x145959874: 75ea jne 0x145959860
0x145959876: 4283bc12b000000000 cmp dword ptr [rdx + r10 + 0xb0], 0
0x14595987f: 75df jne 0x145959860
0x145959881: 4280bc12d001000000 cmp byte ptr [rdx + r10 + 0x1d0], 0
0x14595988a: 74d4 je 0x145959860
0x14595988c: 40b501 mov bpl, 1
0x14595988f: e972f4ffff jmp 0x145958d06
0x145959894: 4c8d05451e2b01 lea r8, [rip + 0x12b1e45]
0x14595989b: 4889f1 mov rcx, rsi
0x14595989e: 4c89e2 mov rdx, r12
0x1459598a1: e8ddff4400 call 0x145da9883
0x1459598a6: 0f0b ud2
