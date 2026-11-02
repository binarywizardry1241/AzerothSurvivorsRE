1400eb0b0: 55 push rbp
1400eb0b1: 4157 push r15
1400eb0b3: 4156 push r14
1400eb0b5: 4155 push r13
1400eb0b7: 4154 push r12
1400eb0b9: 56 push rsi
1400eb0ba: 57 push rdi
1400eb0bb: 53 push rbx
1400eb0bc: 4881ec88010000 sub rsp, 0x188
1400eb0c3: 488dac2480000000 lea rbp, [rsp + 0x80]
1400eb0cb: 440f299df0000000 movaps xmmword ptr [rbp + 0xf0], xmm11
1400eb0d3: 440f2995e0000000 movaps xmmword ptr [rbp + 0xe0], xmm10
1400eb0db: 440f298dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm9
1400eb0e3: 440f2985c0000000 movaps xmmword ptr [rbp + 0xc0], xmm8
1400eb0eb: 0f29bdb0000000 movaps xmmword ptr [rbp + 0xb0], xmm7
1400eb0f2: 0f29b5a0000000 movaps xmmword ptr [rbp + 0xa0], xmm6
1400eb0f9: 48c78598000000feffffff mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
1400eb104: 488b4210 mov rax, qword ptr [rdx + 0x10]
1400eb108: 48898588000000 mov qword ptr [rbp + 0x88], rax
1400eb10f: 4885c0 test rax, rax
1400eb112: 0f841c040000 je 0x1400eb534
1400eb118: 0fb6422c movzx eax, byte ptr [rdx + 0x2c]
1400eb11c: 4c8d05c580ce05 lea r8, [rip + 0x5ce80c5]
1400eb123: 49630480 movsxd rax, dword ptr [r8 + rax*4]
1400eb127: 4c01c0 add rax, r8
1400eb12a: ffe0 jmp rax
1400eb12c: 488b01 mov rax, qword ptr [rcx]
1400eb12f: 4c8b4108 mov r8, qword ptr [rcx + 8]
1400eb133: f20f1000 movsd xmm0, qword ptr [rax]
1400eb137: f30f107008 movss xmm6, dword ptr [rax + 8]
1400eb13c: 31c0 xor eax, eax
1400eb13e: 4183783000 cmp dword ptr [r8 + 0x30], 0
1400eb143: 0f94c0 sete al
1400eb146: 4c8d053b56ce05 lea r8, [rip + 0x5ce563b]
1400eb14d: f3410f100c80 movss xmm1, dword ptr [r8 + rax*4]
1400eb153: e992000000 jmp 0x1400eb1ea
1400eb158: 488b4108 mov rax, qword ptr [rcx + 8]
1400eb15c: 80787c00 cmp byte ptr [rax + 0x7c], 0
1400eb160: 0f85ce030000 jne 0x1400eb534
1400eb166: 488b01 mov rax, qword ptr [rcx]
1400eb169: f20f1008 movsd xmm1, qword ptr [rax]
1400eb16d: 0f28051c73cb05 movaps xmm0, xmmword ptr [rip + 0x5cb731c]
1400eb174: 0f5cc1 subps xmm0, xmm1
1400eb177: 0f59059255ce05 mulps xmm0, xmmword ptr [rip + 0x5ce5592]
1400eb17e: f30f105008 movss xmm2, dword ptr [rax + 8]
1400eb183: 0f58c1 addps xmm0, xmm1
1400eb186: f30f100d82c4ca05 movss xmm1, dword ptr [rip + 0x5cac482]
1400eb18e: 0f28f1 movaps xmm6, xmm1
1400eb191: f30f5cf2 subss xmm6, xmm2
1400eb195: f30f103d8355ce05 movss xmm7, dword ptr [rip + 0x5ce5583]
1400eb19d: f30f59f7 mulss xmm6, xmm7
1400eb1a1: f30f58f2 addss xmm6, xmm2
1400eb1a5: e941010000 jmp 0x1400eb2eb
1400eb1aa: 488b01 mov rax, qword ptr [rcx]
1400eb1ad: f30f104808 movss xmm1, dword ptr [rax + 8]
1400eb1b2: f20f1010 movsd xmm2, qword ptr [rax]
1400eb1b6: 0f2805d372cb05 movaps xmm0, xmmword ptr [rip + 0x5cb72d3]
1400eb1bd: 0f5cc2 subps xmm0, xmm2
1400eb1c0: 0f59058955ce05 mulps xmm0, xmmword ptr [rip + 0x5ce5589]
1400eb1c7: f30f103541c4ca05 movss xmm6, dword ptr [rip + 0x5cac441]
1400eb1cf: f30f5cf1 subss xmm6, xmm1
1400eb1d3: f30f593549aecb05 mulss xmm6, dword ptr [rip + 0x5cbae49]
1400eb1db: 0f58c2 addps xmm0, xmm2
1400eb1de: f30f58f1 addss xmm6, xmm1
1400eb1e2: f30f100d7655ce05 movss xmm1, dword ptr [rip + 0x5ce5576]
1400eb1ea: 0f57ff xorps xmm7, xmm7
1400eb1ed: e9f9000000 jmp 0x1400eb2eb
1400eb1f2: 488b01 mov rax, qword ptr [rcx]
1400eb1f5: f30f104808 movss xmm1, dword ptr [rax + 8]
1400eb1fa: f20f1010 movsd xmm2, qword ptr [rax]
1400eb1fe: 0f28058b72cb05 movaps xmm0, xmmword ptr [rip + 0x5cb728b]
1400eb205: 0f5cc2 subps xmm0, xmm2
1400eb208: 0f59052155ce05 mulps xmm0, xmmword ptr [rip + 0x5ce5521]
1400eb20f: f30f1035f9c3ca05 movss xmm6, dword ptr [rip + 0x5cac3f9]
1400eb217: f30f5cf1 subss xmm6, xmm1
1400eb21b: f30f5935891ece05 mulss xmm6, dword ptr [rip + 0x5ce1e89]
1400eb223: 0f58c2 addps xmm0, xmm2
1400eb226: f30f58f1 addss xmm6, xmm1
1400eb22a: f30f100d9eafcb05 movss xmm1, dword ptr [rip + 0x5cbaf9e]
1400eb232: f30f103d0655ce05 movss xmm7, dword ptr [rip + 0x5ce5506]
1400eb23a: e9ac000000 jmp 0x1400eb2eb
1400eb23f: 488b01 mov rax, qword ptr [rcx]
1400eb242: 4c8b4110 mov r8, qword ptr [rcx + 0x10]
1400eb246: f30f105008 movss xmm2, dword ptr [rax + 8]
1400eb24b: f20f1008 movsd xmm1, qword ptr [rax]
1400eb24f: 0f28053a72cb05 movaps xmm0, xmmword ptr [rip + 0x5cb723a]
1400eb256: 0f5cc1 subps xmm0, xmm1
1400eb259: 0f59051055ce05 mulps xmm0, xmmword ptr [rip + 0x5ce5510]
1400eb260: 0f58c1 addps xmm0, xmm1
1400eb263: f30f100da5c3ca05 movss xmm1, dword ptr [rip + 0x5cac3a5]
1400eb26b: 0f28f1 movaps xmm6, xmm1
1400eb26e: f30f5cf2 subss xmm6, xmm2
1400eb272: f30f59350655ce05 mulss xmm6, dword ptr [rip + 0x5ce5506]
1400eb27a: f30f58f2 addss xmm6, xmm2
1400eb27e: f3410f1038 movss xmm7, dword ptr [r8]
1400eb283: f30f593d89c3ca05 mulss xmm7, dword ptr [rip + 0x5cac389]
1400eb28b: f30f583d8d54ce05 addss xmm7, dword ptr [rip + 0x5ce548d]
1400eb293: eb56 jmp 0x1400eb2eb
1400eb295: 488b4108 mov rax, qword ptr [rcx + 8]
1400eb299: 80787c00 cmp byte ptr [rax + 0x7c], 0
1400eb29d: 0f8491020000 je 0x1400eb534
1400eb2a3: 488b01 mov rax, qword ptr [rcx]
1400eb2a6: f30f104808 movss xmm1, dword ptr [rax + 8]
1400eb2ab: f20f1010 movsd xmm2, qword ptr [rax]
1400eb2af: 0f2805da71cb05 movaps xmm0, xmmword ptr [rip + 0x5cb71da]
1400eb2b6: 0f5cc2 subps xmm0, xmm2
1400eb2b9: 0f59055054ce05 mulps xmm0, xmmword ptr [rip + 0x5ce5450]
1400eb2c0: f30f103548c3ca05 movss xmm6, dword ptr [rip + 0x5cac348]
1400eb2c8: f30f5cf1 subss xmm6, xmm1
1400eb2cc: f30f59354c54ce05 mulss xmm6, dword ptr [rip + 0x5ce544c]
1400eb2d4: 0f58c2 addps xmm0, xmm2
1400eb2d7: f30f58f1 addss xmm6, xmm1
1400eb2db: f30f100dedaecb05 movss xmm1, dword ptr [rip + 0x5cbaeed]
1400eb2e3: f30f103dc11dce05 movss xmm7, dword ptr [rip + 0x5ce1dc1]
1400eb2eb: 488b4118 mov rax, qword ptr [rcx + 0x18]
1400eb2ef: 4c8b4120 mov r8, qword ptr [rcx + 0x20]
1400eb2f3: f30f1010 movss xmm2, dword ptr [rax]
1400eb2f7: f30f12da movsldup xmm3, xmm2
1400eb2fb: 0f59d8 mulps xmm3, xmm0
1400eb2fe: 0f28c3 movaps xmm0, xmm3
1400eb301: 0f5d058871cb05 minps xmm0, xmmword ptr [rip + 0x5cb7188]
1400eb308: 440f28c0 movaps xmm8, xmm0
1400eb30c: 440fc2c003 cmpunordps xmm8, xmm0
1400eb311: 410f54d8 andps xmm3, xmm8
1400eb315: 440f55c0 andnps xmm8, xmm0
1400eb319: 440f56c3 orps xmm8, xmm3
1400eb31d: f30f59f2 mulss xmm6, xmm2
1400eb321: f30f5d35e7c2ca05 minss xmm6, dword ptr [rip + 0x5cac2e7]
1400eb329: f3410f1000 movss xmm0, dword ptr [r8]
1400eb32e: f30f59c8 mulss xmm1, xmm0
1400eb332: 488b4128 mov rax, qword ptr [rcx + 0x28]
1400eb336: f30f1010 movss xmm2, dword ptr [rax]
1400eb33a: f30f59ca mulss xmm1, xmm2
1400eb33e: f30f59f8 mulss xmm7, xmm0
1400eb342: f30f59fa mulss xmm7, xmm2
1400eb346: c6456800 mov byte ptr [rbp + 0x68], 0
1400eb34a: f30f114d6c movss dword ptr [rbp + 0x6c], xmm1
1400eb34f: c6457001 mov byte ptr [rbp + 0x70], 1
1400eb353: f30f117d74 movss dword ptr [rbp + 0x74], xmm7
1400eb358: 4c8b6930 mov r13, qword ptr [rcx + 0x30]
1400eb35c: 488b4138 mov rax, qword ptr [rcx + 0x38]
1400eb360: 48894578 mov qword ptr [rbp + 0x78], rax
1400eb364: 4c8b6140 mov r12, qword ptr [rcx + 0x40]
1400eb368: 488d7d08 lea rdi, [rbp + 8]
1400eb36c: 488b5a08 mov rbx, qword ptr [rdx + 8]
1400eb370: 4883c218 add rdx, 0x18
1400eb374: 4c8bbd88000000 mov r15, qword ptr [rbp + 0x88]
1400eb37b: 49f7df neg r15
1400eb37e: 31c0 xor eax, eax
1400eb380: 450f57c9 xorps xmm9, xmm9
1400eb384: 450f57d2 xorps xmm10, xmm10
1400eb388: 48899580000000 mov qword ptr [rbp + 0x80], rdx
1400eb38f: 90 nop
1400eb390: 488d7001 lea rsi, [rax + 1]
1400eb394: f3440f105cc56c movss xmm11, dword ptr [rbp + rax*8 + 0x6c]
1400eb39b: 450f2ecb ucomiss xmm9, xmm11
1400eb39f: 730f jae 0x1400eb3b0
1400eb3a1: 488d4d68 lea rcx, [rbp + 0x68]
1400eb3a5: 488d04c1 lea rax, [rcx + rax*8]
1400eb3a9: eb26 jmp 0x1400eb3d1
1400eb3ab: 0f1f440000 nop dword ptr [rax + rax]
1400eb3b0: 4883fe02 cmp rsi, 2
1400eb3b4: 0f847a010000 je 0x1400eb534
1400eb3ba: be02000000 mov esi, 2
1400eb3bf: 440f2ecf ucomiss xmm9, xmm7
1400eb3c3: 488d4570 lea rax, [rbp + 0x70]
1400eb3c7: 440f28df movaps xmm11, xmm7
1400eb3cb: 0f8363010000 jae 0x1400eb534
1400eb3d1: 0fb600 movzx eax, byte ptr [rax]
1400eb3d4: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
1400eb3d8: 488b09 mov rcx, qword ptr [rcx]
1400eb3db: 4d8b4d00 mov r9, qword ptr [r13]
1400eb3df: 4d8b4510 mov r8, qword ptr [r13 + 0x10]
1400eb3e3: 458b5110 mov r10d, dword ptr [r9 + 0x10]
1400eb3e7: 458b4d1c mov r9d, dword ptr [r13 + 0x1c]
1400eb3eb: 458908 mov dword ptr [r8], r9d
1400eb3ee: 4d8b7500 mov r14, qword ptr [r13]
1400eb3f2: 440f2955b0 movaps xmmword ptr [rbp - 0x50], xmm10
1400eb3f7: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1400eb3fb: 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1400eb403: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1400eb40b: 8b4a10 mov ecx, dword ptr [rdx + 0x10]
1400eb40e: 894f10 mov dword ptr [rdi + 0x10], ecx
1400eb411: 0f1002 movups xmm0, xmmword ptr [rdx]
1400eb414: 0f1107 movups xmmword ptr [rdi], xmm0
1400eb417: 418b4c2408 mov ecx, dword ptr [r12 + 8]
1400eb41c: 894f1c mov dword ptr [rdi + 0x1c], ecx
1400eb41f: 498b0c24 mov rcx, qword ptr [r12]
1400eb423: 48894f14 mov qword ptr [rdi + 0x14], rcx
1400eb427: 3401 xor al, 1
1400eb429: 48b900803bc700800000 movabs rcx, 0x8000c73b8000
1400eb433: 48894d28 mov qword ptr [rbp + 0x28], rcx
1400eb437: c7472b00000000 mov dword ptr [rdi + 0x2b], 0
1400eb43e: c7472800000000 mov dword ptr [rdi + 0x28], 0
1400eb445: 884537 mov byte ptr [rbp + 0x37], al
1400eb448: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
1400eb450: 4c897540 mov qword ptr [rbp + 0x40], r14
1400eb454: 44895548 mov dword ptr [rbp + 0x48], r10d
1400eb458: 498b06 mov rax, qword ptr [r14]
1400eb45b: 498b5610 mov rdx, qword ptr [r14 + 0x10]
1400eb45f: 4829d0 sub rax, rdx
1400eb462: 48398588000000 cmp qword ptr [rbp + 0x88], rax
1400eb469: 0f8796000000 ja 0x1400eb505
1400eb46f: 488d04d2 lea rax, [rdx + rdx*8]
1400eb473: 48c1e002 shl rax, 2
1400eb477: 49034608 add rax, qword ptr [r14 + 8]
1400eb47b: b920000000 mov ecx, 0x20
1400eb480: 4531c0 xor r8d, r8d
1400eb483: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400eb490: 4c8b4c0bec mov r9, qword ptr [rbx + rcx - 0x14]
1400eb495: f30f10040b movss xmm0, dword ptr [rbx + rcx]
1400eb49a: f3410f59c3 mulss xmm0, xmm11
1400eb49f: 448b540be8 mov r10d, dword ptr [rbx + rcx - 0x18]
1400eb4a4: 44895408e8 mov dword ptr [rax + rcx - 0x18], r10d
1400eb4a9: 4c8b540be0 mov r10, qword ptr [rbx + rcx - 0x20]
1400eb4ae: 4c895408e0 mov qword ptr [rax + rcx - 0x20], r10
1400eb4b3: 4c894c08ec mov qword ptr [rax + rcx - 0x14], r9
1400eb4b8: 440f134408f4 movlps qword ptr [rax + rcx - 0xc], xmm8
1400eb4be: f30f117408fc movss dword ptr [rax + rcx - 4], xmm6
1400eb4c4: f30f110408 movss dword ptr [rax + rcx], xmm0
1400eb4c9: 49ffc8 dec r8
1400eb4cc: 4883c124 add rcx, 0x24
1400eb4d0: 4d39c7 cmp r15, r8
1400eb4d3: 75bb jne 0x1400eb490
1400eb4d5: 4c29c2 sub rdx, r8
1400eb4d8: 49895610 mov qword ptr [r14 + 0x10], rdx
1400eb4dc: c6859700000000 mov byte ptr [rbp + 0x97], 0
1400eb4e3: 488d4db0 lea rcx, [rbp - 0x50]
1400eb4e7: e8d44b4d01 call 0x1415c00c0
1400eb4ec: 90 nop
1400eb4ed: b801000000 mov eax, 1
1400eb4f2: 4883fe02 cmp rsi, 2
1400eb4f6: 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
1400eb4fd: 0f858dfeffff jne 0x1400eb390
1400eb503: eb2f jmp 0x1400eb534
1400eb505: c6859700000001 mov byte ptr [rbp + 0x97], 1
1400eb50c: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400eb515: 41b904000000 mov r9d, 4
1400eb51b: 4c89f1 mov rcx, r14
1400eb51e: 4c8b8588000000 mov r8, qword ptr [rbp + 0x88]
1400eb525: e86695b005 call 0x145bf4a90
1400eb52a: 90 nop
1400eb52b: 498b5610 mov rdx, qword ptr [r14 + 0x10]
1400eb52f: e93bffffff jmp 0x1400eb46f
1400eb534: 0f28b5a0000000 movaps xmm6, xmmword ptr [rbp + 0xa0]
1400eb53b: 0f28bdb0000000 movaps xmm7, xmmword ptr [rbp + 0xb0]
1400eb542: 440f2885c0000000 movaps xmm8, xmmword ptr [rbp + 0xc0]
1400eb54a: 440f288dd0000000 movaps xmm9, xmmword ptr [rbp + 0xd0]
1400eb552: 440f2895e0000000 movaps xmm10, xmmword ptr [rbp + 0xe0]
1400eb55a: 440f289df0000000 movaps xmm11, xmmword ptr [rbp + 0xf0]
1400eb562: 4881c488010000 add rsp, 0x188
1400eb569: 5b pop rbx
1400eb56a: 5f pop rdi
1400eb56b: 5e pop rsi
1400eb56c: 415c pop r12
1400eb56e: 415d pop r13
1400eb570: 415e pop r14
1400eb572: 415f pop r15
1400eb574: 5d pop rbp
1400eb575: c3 ret
