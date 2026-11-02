140047740: 55 push rbp
140047741: 4157 push r15
140047743: 4156 push r14
140047745: 4155 push r13
140047747: 4154 push r12
140047749: 56 push rsi
14004774a: 57 push rdi
14004774b: 53 push rbx
14004774c: 4881ec98010000 sub rsp, 0x198
140047753: 488dac2480000000 lea rbp, [rsp + 0x80]
14004775b: 440f298500010000 movaps xmmword ptr [rbp + 0x100], xmm8
140047763: 0f29bdf0000000 movaps xmmword ptr [rbp + 0xf0], xmm7
14004776a: 660f7fb5e0000000 movdqa xmmword ptr [rbp + 0xe0], xmm6
140047772: 48c785d8000000feffffff mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
14004777d: 48898d90000000 mov qword ptr [rbp + 0x90], rcx
140047784: 488b4210 mov rax, qword ptr [rdx + 0x10]
140047788: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14004778f: 488b3a mov rdi, qword ptr [rdx]
140047792: 488b5a08 mov rbx, qword ptr [rdx + 8]
140047796: 4c8b6218 mov r12, qword ptr [rdx + 0x18]
14004779a: 4889bdd0000000 mov qword ptr [rbp + 0xd0], rdi
1400477a1: 4c39e3 cmp rbx, r12
1400477a4: 0f841c050000 je 0x140047cc6
1400477aa: 4c8d7db8 lea r15, [rbp - 0x48]
1400477ae: 4c8d6d28 lea r13, [rbp + 0x28]
1400477b2: 488b7220 mov rsi, qword ptr [rdx + 0x20]
1400477b6: 488b4228 mov rax, qword ptr [rdx + 0x28]
1400477ba: 488d4820 lea rcx, [rax + 0x20]
1400477be: 48898d88000000 mov qword ptr [rbp + 0x88], rcx
1400477c5: 488b4a30 mov rcx, qword ptr [rdx + 0x30]
1400477c9: 48898d98000000 mov qword ptr [rbp + 0x98], rcx
1400477d0: 488b4a38 mov rcx, qword ptr [rdx + 0x38]
1400477d4: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1400477db: 488d4e20 lea rcx, [rsi + 0x20]
1400477df: 48894d78 mov qword ptr [rbp + 0x78], rcx
1400477e3: 660f76f6 pcmpeqd xmm6, xmm6
1400477e7: 0f283de214d605 movaps xmm7, xmmword ptr [rip + 0x5d614e2]
1400477ee: 4c8d7540 lea r14, [rbp + 0x40]
1400477f2: 4889bdd0000000 mov qword ptr [rbp + 0xd0], rdi
1400477f9: 4889b5c8000000 mov qword ptr [rbp + 0xc8], rsi
140047800: 4889bdb8000000 mov qword ptr [rbp + 0xb8], rdi
140047807: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14004780e: 48898580000000 mov qword ptr [rbp + 0x80], rax
140047815: eb79 jmp 0x140047890
140047817: 660f1f840000000000 nop word ptr [rax + rax]
140047820: 4821d0 and rax, rdx
140047823: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
140047828: 660f6fd1 movdqa xmm2, xmm1
14004782c: 660f74d0 pcmpeqb xmm2, xmm0
140047830: 66440fd7d2 pmovmskb r10d, xmm2
140047835: 4585d2 test r10d, r10d
140047838: 7436 je 0x140047870
14004783a: f3450fbcda tzcnt r11d, r10d
14004783f: 4901c3 add r11, rax
140047842: 4921d3 and r11, rdx
140047845: 49c1e303 shl r11, 3
140047849: 4889ce mov rsi, rcx
14004784c: 4c29de sub rsi, r11
14004784f: 4c3b46f8 cmp r8, qword ptr [rsi - 8]
140047853: 0f8431040000 je 0x140047c8a
140047859: 458d5aff lea r11d, [r10 - 1]
14004785d: 664521d3 and r11w, r10w
140047861: 4589da mov r10d, r11d
140047864: 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
14004786b: 75cd jne 0x14004783a
14004786d: 0f1f00 nop dword ptr [rax]
140047870: 660f74ce pcmpeqb xmm1, xmm6
140047874: 66440fd7d1 pmovmskb r10d, xmm1
140047879: 4585d2 test r10d, r10d
14004787c: 7572 jne 0x1400478f0
14004787e: 4c01c8 add rax, r9
140047881: 4883c010 add rax, 0x10
140047885: 4983c110 add r9, 0x10
140047889: eb95 jmp 0x140047820
14004788b: 0f1f440000 nop dword ptr [rax + rax]
140047890: 48897da8 mov qword ptr [rbp - 0x58], rdi
140047894: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14004789b: 488945b0 mov qword ptr [rbp - 0x50], rax
14004789f: 488b4310 mov rax, qword ptr [rbx + 0x10]
1400478a3: 49894710 mov qword ptr [r15 + 0x10], rax
1400478a7: f30f6f03 movdqu xmm0, xmmword ptr [rbx]
1400478ab: f3410f7f07 movdqu xmmword ptr [r15], xmm0
1400478b0: 48837e1800 cmp qword ptr [rsi + 0x18], 0
1400478b5: 7439 je 0x1400478f0
1400478b7: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
1400478bb: 4c89fa mov rdx, r15
1400478be: e8cd58fcff call 0x14000d190
1400478c3: 4989c0 mov r8, rax
1400478c6: 49c1e839 shr r8, 0x39
1400478ca: 488b0e mov rcx, qword ptr [rsi]
1400478cd: 488b5608 mov rdx, qword ptr [rsi + 8]
1400478d1: 66410f6ec0 movd xmm0, r8d
1400478d6: 660f60c0 punpcklbw xmm0, xmm0
1400478da: f20f70c000 pshuflw xmm0, xmm0, 0
1400478df: 660f70c044 pshufd xmm0, xmm0, 0x44
1400478e4: 4c8b45b8 mov r8, qword ptr [rbp - 0x48]
1400478e8: 4531c9 xor r9d, r9d
1400478eb: e930ffffff jmp 0x140047820
1400478f0: 488b4310 mov rax, qword ptr [rbx + 0x10]
1400478f4: 49894510 mov qword ptr [r13 + 0x10], rax
1400478f8: 0f1003 movups xmm0, xmmword ptr [rbx]
1400478fb: 410f114500 movups xmmword ptr [r13], xmm0
140047900: 48897d18 mov qword ptr [rbp + 0x18], rdi
140047904: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
14004790b: 48894520 mov qword ptr [rbp + 0x20], rax
14004790f: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
140047916: 4883781800 cmp qword ptr [rax + 0x18], 0
14004791b: 0f8470030000 je 0x140047c91
140047921: 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
140047928: 4c89ea mov rdx, r13
14004792b: 4989c5 mov r13, rax
14004792e: e85d58fcff call 0x14000d190
140047933: 4989c0 mov r8, rax
140047936: 49c1e839 shr r8, 0x39
14004793a: 498b4d00 mov rcx, qword ptr [r13]
14004793e: 498b5508 mov rdx, qword ptr [r13 + 8]
140047942: 66410f6ec0 movd xmm0, r8d
140047947: 660f60c0 punpcklbw xmm0, xmm0
14004794b: f20f70c000 pshuflw xmm0, xmm0, 0
140047950: 660f70c044 pshufd xmm0, xmm0, 0x44
140047955: 4c8b6d28 mov r13, qword ptr [rbp + 0x28]
140047959: 4531c0 xor r8d, r8d
14004795c: 4821d0 and rax, rdx
14004795f: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
140047964: 660f6fd1 movdqa xmm2, xmm1
140047968: 660f74d0 pcmpeqb xmm2, xmm0
14004796c: 66440fd7ca pmovmskb r9d, xmm2
140047971: 4585c9 test r9d, r9d
140047974: 742a je 0x1400479a0
140047976: f3450fbcd9 tzcnt r11d, r9d
14004797b: 4901c3 add r11, rax
14004797e: 4921d3 and r11, rdx
140047981: 49c1e304 shl r11, 4
140047985: 4989ca mov r10, rcx
140047988: 4d29da sub r10, r11
14004798b: 4d3b6af0 cmp r13, qword ptr [r10 - 0x10]
14004798f: 742f je 0x1400479c0
140047991: 458d51ff lea r10d, [r9 - 1]
140047995: 664521ca and r10w, r9w
140047999: 4589d1 mov r9d, r10d
14004799c: 75d8 jne 0x140047976
14004799e: 6690 nop
1400479a0: 660f74ce pcmpeqb xmm1, xmm6
1400479a4: 66440fd7c9 pmovmskb r9d, xmm1
1400479a9: 4585c9 test r9d, r9d
1400479ac: 0f85ee020000 jne 0x140047ca0
1400479b2: 4c01c0 add rax, r8
1400479b5: 4883c010 add rax, 0x10
1400479b9: 4983c010 add r8, 0x10
1400479bd: eb9d jmp 0x14004795c
1400479bf: 90 nop
1400479c0: 498b7af8 mov rdi, qword ptr [r10 - 8]
1400479c4: f20f104530 movsd xmm0, qword ptr [rbp + 0x30]
1400479c9: f20f104d38 movsd xmm1, qword ptr [rbp + 0x38]
1400479ce: 0f58c8 addps xmm1, xmm0
1400479d1: f2440f12c1 movddup xmm8, xmm1
1400479d6: 440f59c7 mulps xmm8, xmm7
1400479da: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
1400479e1: 4c8b38 mov r15, qword ptr [rax]
1400479e4: e887bdb505 call 0x145ba3770
1400479e9: 90 nop
1400479ea: 4889c6 mov rsi, rax
1400479ed: 80781001 cmp byte ptr [rax + 0x10], 1
1400479f1: 0f85bc020000 jne 0x140047cb3
1400479f7: 488b06 mov rax, qword ptr [rsi]
1400479fa: 488b5608 mov rdx, qword ptr [rsi + 8]
1400479fe: 488d4801 lea rcx, [rax + 1]
140047a02: 48890e mov qword ptr [rsi], rcx
140047a05: 0f10050417d605 movups xmm0, xmmword ptr [rip + 0x5d61704]
140047a0c: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
140047a10: 0f1005e916d605 movups xmm0, xmmword ptr [rip + 0x5d616e9]
140047a17: 0f294540 movaps xmmword ptr [rbp + 0x40], xmm0
140047a1b: 48894560 mov qword ptr [rbp + 0x60], rax
140047a1f: 48895568 mov qword ptr [rbp + 0x68], rdx
140047a23: 4c897d08 mov qword ptr [rbp + 8], r15
140047a27: 4c896d10 mov qword ptr [rbp + 0x10], r13
140047a2b: 488d7508 lea rsi, [rbp + 8]
140047a2f: 4889f1 mov rcx, rsi
140047a32: e8e91a0d00 call 0x140119520
140047a37: 90 nop
140047a38: 0f1f840000000000 nop dword ptr [rax + rax]
140047a40: 85c0 test eax, eax
140047a42: 741c je 0x140047a60
140047a44: 4c89f1 mov rcx, r14
140047a47: 4889c2 mov rdx, rax
140047a4a: e881770700 call 0x1400bf1d0
140047a4f: 90 nop
140047a50: 4889f1 mov rcx, rsi
140047a53: e8c81a0d00 call 0x140119520
140047a58: 90 nop
140047a59: ebe5 jmp 0x140047a40
140047a5b: 0f1f440000 nop dword ptr [rax + rax]
140047a60: 0f284540 movaps xmm0, xmmword ptr [rbp + 0x40]
140047a64: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
140047a68: 660f6f5560 movdqa xmm2, xmmword ptr [rbp + 0x60]
140047a6d: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
140047a71: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
140047a75: 660f7f55f0 movdqa xmmword ptr [rbp - 0x10], xmm2
140047a7a: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
140047a81: 4c8b6010 mov r12, qword ptr [rax + 0x10]
140047a85: 488b45d0 mov rax, qword ptr [rbp - 0x30]
140047a89: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
140047a90: 488b75d8 mov rsi, qword ptr [rbp - 0x28]
140047a94: 4d85e4 test r12, r12
140047a97: 0f8483010000 je 0x140047c20
140047a9d: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
140047aa4: 4c8b7808 mov r15, qword ptr [rax + 8]
140047aa8: 49c1e405 shl r12, 5
140047aac: 4d01fc add r12, r15
140047aaf: 488b45e8 mov rax, qword ptr [rbp - 0x18]
140047ab3: 48894570 mov qword ptr [rbp + 0x70], rax
140047ab7: eb77 jmp 0x140047b30
140047ab9: 0f1f8000000000 nop dword ptr [rax]
140047ac0: 4821f0 and rax, rsi
140047ac3: 4c8b85c0000000 mov r8, qword ptr [rbp + 0xc0]
140047aca: f3410f6f0c00 movdqu xmm1, xmmword ptr [r8 + rax]
140047ad0: 660f6fd1 movdqa xmm2, xmm1
140047ad4: 660f74d0 pcmpeqb xmm2, xmm0
140047ad8: 66440fd7c2 pmovmskb r8d, xmm2
140047add: 4585c0 test r8d, r8d
140047ae0: 742e je 0x140047b10
140047ae2: f3450fbcc8 tzcnt r9d, r8d
140047ae7: 4901c1 add r9, rax
140047aea: 4921f1 and r9, rsi
140047aed: 49c1e103 shl r9, 3
140047af1: 4c8b95c0000000 mov r10, qword ptr [rbp + 0xc0]
140047af8: 4d29ca sub r10, r9
140047afb: 493b4af8 cmp rcx, qword ptr [r10 - 8]
140047aff: 7452 je 0x140047b53
140047b01: 458d48ff lea r9d, [r8 - 1]
140047b05: 664521c1 and r9w, r8w
140047b09: 4589c8 mov r8d, r9d
140047b0c: 75d4 jne 0x140047ae2
140047b0e: 6690 nop
140047b10: 660f74ce pcmpeqb xmm1, xmm6
140047b14: 66440fd7c1 pmovmskb r8d, xmm1
140047b19: 4585c0 test r8d, r8d
140047b1c: 757c jne 0x140047b9a
140047b1e: 4801d0 add rax, rdx
140047b21: 4883c010 add rax, 0x10
140047b25: 4883c210 add rdx, 0x10
140047b29: eb95 jmp 0x140047ac0
140047b2b: 0f1f440000 nop dword ptr [rax + rax]
140047b30: 49397f08 cmp qword ptr [r15 + 8], rdi
140047b34: 761d jbe 0x140047b53
140047b36: 410f104710 movups xmm0, xmmword ptr [r15 + 0x10]
140047b3b: 410f28c8 movaps xmm1, xmm8
140047b3f: 0fc2c806 cmpnleps xmm1, xmm0
140047b43: 410fc2c006 cmpnleps xmm0, xmm8
140047b48: 0fc6c1e4 shufps xmm0, xmm1, 0xe4
140047b4c: 0f50c0 movmskps eax, xmm0
140047b4f: 85c0 test eax, eax
140047b51: 740e je 0x140047b61
140047b53: 4983c720 add r15, 0x20
140047b57: 4d39e7 cmp r15, r12
140047b5a: 75d4 jne 0x140047b30
140047b5c: e9bf000000 jmp 0x140047c20
140047b61: 48837d7000 cmp qword ptr [rbp + 0x70], 0
140047b66: 742f je 0x140047b97
140047b68: 488d4df0 lea rcx, [rbp - 0x10]
140047b6c: 4c89fa mov rdx, r15
140047b6f: e81c56fcff call 0x14000d190
140047b74: 4889c1 mov rcx, rax
140047b77: 48c1e939 shr rcx, 0x39
140047b7b: 660f6ec1 movd xmm0, ecx
140047b7f: 660f60c0 punpcklbw xmm0, xmm0
140047b83: f20f70c000 pshuflw xmm0, xmm0, 0
140047b88: 660f70c044 pshufd xmm0, xmm0, 0x44
140047b8d: 498b0f mov rcx, qword ptr [r15]
140047b90: 31d2 xor edx, edx
140047b92: e929ffffff jmp 0x140047ac0
140047b97: 498b0f mov rcx, qword ptr [r15]
140047b9a: 4c39e9 cmp rcx, r13
140047b9d: 74b4 je 0x140047b53
140047b9f: 488b8598000000 mov rax, qword ptr [rbp + 0x98]
140047ba6: 488b00 mov rax, qword ptr [rax]
140047ba9: 48894540 mov qword ptr [rbp + 0x40], rax
140047bad: 48894d48 mov qword ptr [rbp + 0x48], rcx
140047bb1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140047bc0: 4c89f1 mov rcx, r14
140047bc3: e858190d00 call 0x140119520
140047bc8: 90 nop
140047bc9: 4c39e8 cmp rax, r13
140047bcc: 7407 je 0x140047bd5
140047bce: 89c1 mov ecx, eax
140047bd0: 4885c9 test rcx, rcx
140047bd3: 75eb jne 0x140047bc0
140047bd5: 85c0 test eax, eax
140047bd7: 0f8576ffffff jne 0x140047b53
140047bdd: 4885f6 test rsi, rsi
140047be0: 4c8d6d28 lea r13, [rbp + 0x28]
140047be4: 0f848e000000 je 0x140047c78
140047bea: 488d04f517000000 lea rax, [rsi*8 + 0x17]
140047bf2: 4883e0f0 and rax, 0xfffffffffffffff0
140047bf6: 4801c6 add rsi, rax
140047bf9: 4883c611 add rsi, 0x11
140047bfd: 0f8475000000 je 0x140047c78
140047c03: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
140047c0a: 4829c1 sub rcx, rax
140047c0d: 41b810000000 mov r8d, 0x10
140047c13: 4889f2 mov rdx, rsi
140047c16: e8b5a5fbff call 0x1400021d0
140047c1b: eb5b jmp 0x140047c78
140047c1d: 0f1f00 nop dword ptr [rax]
140047c20: 4885f6 test rsi, rsi
140047c23: 742d je 0x140047c52
140047c25: 488d04f517000000 lea rax, [rsi*8 + 0x17]
140047c2d: 4883e0f0 and rax, 0xfffffffffffffff0
140047c31: 4801c6 add rsi, rax
140047c34: 4883c611 add rsi, 0x11
140047c38: 7418 je 0x140047c52
140047c3a: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
140047c41: 4829c1 sub rcx, rax
140047c44: 41b810000000 mov r8d, 0x10
140047c4a: 4889f2 mov rdx, rsi
140047c4d: e87ea5fbff call 0x1400021d0
140047c52: 4c8d6d28 lea r13, [rbp + 0x28]
140047c56: 498b4510 mov rax, qword ptr [r13 + 0x10]
140047c5a: 488b8dd0000000 mov rcx, qword ptr [rbp + 0xd0]
140047c61: 48894110 mov qword ptr [rcx + 0x10], rax
140047c65: 410f104500 movups xmm0, xmmword ptr [r13]
140047c6a: 0f1101 movups xmmword ptr [rcx], xmm0
140047c6d: 4883c118 add rcx, 0x18
140047c71: 48898dd0000000 mov qword ptr [rbp + 0xd0], rcx
140047c78: 488bbdb8000000 mov rdi, qword ptr [rbp + 0xb8]
140047c7f: 4c8ba5a8000000 mov r12, qword ptr [rbp + 0xa8]
140047c86: 4c8d7db8 lea r15, [rbp - 0x48]
140047c8a: 488bb5c8000000 mov rsi, qword ptr [rbp + 0xc8]
140047c91: 4883c318 add rbx, 0x18
140047c95: 4c39e3 cmp rbx, r12
140047c98: 0f85f2fbffff jne 0x140047890
140047c9e: eb26 jmp 0x140047cc6
140047ca0: 4c8d6d28 lea r13, [rbp + 0x28]
140047ca4: 4883c318 add rbx, 0x18
140047ca8: 4c39e3 cmp rbx, r12
140047cab: 0f85dffbffff jne 0x140047890
140047cb1: eb13 jmp 0x140047cc6
140047cb3: e8d8f6b605 call 0x145bb7390
140047cb8: 90 nop
140047cb9: 48895608 mov qword ptr [rsi + 8], rdx
140047cbd: c6461001 mov byte ptr [rsi + 0x10], 1
140047cc1: e938fdffff jmp 0x1400479fe
140047cc6: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
140047ccd: 4829f8 sub rax, rdi
140047cd0: 48c1e803 shr rax, 3
140047cd4: 48baabaaaaaaaaaaaaaa movabs rdx, 0xaaaaaaaaaaaaaaab
140047cde: 480fafd0 imul rdx, rax
140047ce2: 488b8db0000000 mov rcx, qword ptr [rbp + 0xb0]
140047ce9: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
140047cf0: 488908 mov qword ptr [rax], rcx
140047cf3: 48897808 mov qword ptr [rax + 8], rdi
140047cf7: 48895010 mov qword ptr [rax + 0x10], rdx
140047cfb: 0f28b5e0000000 movaps xmm6, xmmword ptr [rbp + 0xe0]
140047d02: 0f28bdf0000000 movaps xmm7, xmmword ptr [rbp + 0xf0]
140047d09: 440f288500010000 movaps xmm8, xmmword ptr [rbp + 0x100]
140047d11: 4881c498010000 add rsp, 0x198
140047d18: 5b pop rbx
140047d19: 5f pop rdi
140047d1a: 5e pop rsi
140047d1b: 415c pop r12
140047d1d: 415d pop r13
140047d1f: 415e pop r14
140047d21: 415f pop r15
140047d23: 5d pop rbp
140047d24: c3 ret
