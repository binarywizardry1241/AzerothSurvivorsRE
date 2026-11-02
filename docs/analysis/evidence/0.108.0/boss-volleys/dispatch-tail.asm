145955213: cmp ebx, 0x5e5
145955219: jle 0x1459556bf
14595521f: cmp ebx, 0xafb
145955225: jg 0x145955736
14595522b: cmp ebx, 0x5e6
145955231: je 0x145955704
145955237: cmp ebx, 0x7ba
14595523d: je 0x145955776
145955243: cmp ebx, 0xa53
145955249: je 0x145955704
14595524f: jmp 0x145955786
145955254: movaps xmm12, xmm10
145955258: mov eax, dword ptr [rbp + 0xc8]
14595525e: mov dword ptr [rbp + 0x80], eax
145955264: mov rax, qword ptr [rbp + 0xc0]
14595526b: mov qword ptr [rbp + 0x78], rax
14595526f: add rdx, 0x10
145955273: movsd xmm6, qword ptr [rbp + 0x78]
145955278: movshdup xmm2, xmm6
14595527c: mov rcx, rdx
14595527f: movaps xmm1, xmm6
145955282: call 0x1458d0220
145955287: mov r9, qword ptr [rsi + 0x568]
14595528e: mov rdx, qword ptr [rbp + 0xf0]
145955295: cmp rdx, r9
145955298: jae 0x145955f6b
14595529e: movaps xmm10, xmm0
1459552a2: test al, 1
1459552a4: jne 0x1459552af
1459552a6: movss xmm10, dword ptr [rbp + 0x80]
1459552af: mov rax, qword ptr [rsi + 0x560]
1459552b6: movaps xmm9, xmmword ptr [rbp + 0x150]
1459552be: movaps xmm0, xmm9
1459552c2: subps xmm0, xmm6
1459552c5: mulps xmm0, xmm0
1459552c8: movshdup xmm1, xmm0
1459552cc: addss xmm1, xmm0
1459552d0: xorps xmm7, xmm7
1459552d3: sqrtss xmm7, xmm1
1459552d7: movss xmm0, dword ptr [rip + 0x442559]
1459552df: maxss xmm7, xmm0
1459552e3: movss xmm1, dword ptr [rax + rbx + 0x170]
1459552ec: mulss xmm1, dword ptr [rip + 0x477de8]
1459552f4: maxss xmm0, xmm1
1459552f8: movss xmm8, dword ptr [rip + 0x48c887]
145955301: minss xmm8, xmm0
145955306: movaps xmm2, xmm7
145955309: divss xmm2, dword ptr [rip + 0x442763]
145955311: movss xmm11, dword ptr [rip + 0x4422f6]
14595531a: addss xmm2, xmm11
14595531f: movss xmm13, dword ptr [rbp + 0x178]
145955328: movss dword ptr [rsp + 0x20], xmm13
14595532f: mov rcx, rsi
145955332: mov r9d, 1
145955338: call 0x145950630
14595533d: mov rcx, rsi
145955340: mov rdi, qword ptr [rbp + 0x180]
145955347: mov rdx, rdi
14595534a: mov r8d, r15d
14595534d: movaps xmm3, xmm11
145955351: call 0x145950b00
145955356: movss dword ptr [rbp + 0x164], xmm7
14595535e: movss dword ptr [rbp + 0x168], xmm8
145955367: mov dword ptr [rbp + 0x160], 2
145955371: addss xmm14, xmm14
145955376: mov dword ptr [rbp + 0x110], 0
145955380: lea rax, [rbp + 0x110]
145955387: mov qword ptr [rsp + 0x48], rax
14595538c: movss dword ptr [rsp + 0x40], xmm14
145955393: movss dword ptr [rsp + 0x28], xmm13
14595539a: movss dword ptr [rsp + 0x20], xmm12
1459553a1: mov dword ptr [rsp + 0x38], 0
1459553a9: mov dword ptr [rsp + 0x30], 0x3f800000
1459553b1: lea r8, [rbp + 0x160]
1459553b8: mov rcx, rsi
1459553bb: mov rdx, rdi
1459553be: movaps xmm3, xmm9
1459553c2: call 0x1459508f0
1459553c7: movlps qword ptr [rbp + 0x110], xmm6
1459553ce: movss dword ptr [rbp + 0x118], xmm10
1459553d7: mov byte ptr [rbp + 0x13d], 0x23
1459553de: lea r9, [rbp + 0x110]
1459553e5: mov rcx, rsi
1459553e8: movaps xmm1, xmm11
1459553ec: mov r8, rdi
1459553ef: call 0x145950570
1459553f4: jmp 0x145950c88
1459553f9: mov eax, dword ptr [rbp + 0xc8]
1459553ff: mov dword ptr [rbp + 0x38], eax
145955402: mov rax, qword ptr [rbp + 0xc0]
145955409: mov qword ptr [rbp + 0x30], rax
14595540d: mov qword ptr [rbp + 0x90], rbx
145955414: add r14, 0x10
145955418: mov rdx, qword ptr [rsi + 0x290]
14595541f: mov r8, qword ptr [rsi + 0x298]
145955426: lea rcx, [rbp + 0x110]
14595542d: lea r9, [rbp + 0x30]
145955431: call 0x145947480
145955436: movsd xmm7, qword ptr [rbp + 0x110]
14595543e: movshdup xmm8, xmm7
145955443: mov rcx, r14
145955446: movaps xmm1, xmm7
145955449: movaps xmm2, xmm8
14595544d: call 0x1458d0220
145955452: movaps xmm9, xmm0
145955456: test al, 1
145955458: jne 0x145955463
14595545a: movss xmm9, dword ptr [rbp + 0x118]
145955463: lea rbx, [rsi + 0x618]
14595546a: mov eax, dword ptr [rbp + 0xb0]
145955470: mov dword ptr [rbp + 0x16c], eax
145955476: mov rax, qword ptr [rbp + 0xa8]
14595547d: mov qword ptr [rbp + 0x164], rax
145955484: mov dword ptr [rbp + 0x160], 1
14595548e: mov dword ptr [rbp - 0x1c], 0
145955495: lea rdi, [rbp - 0x1c]
145955499: mov qword ptr [rsp + 0x30], rdi
14595549e: lea r13, [rbp + 0x160]
1459554a5: mov qword ptr [rsp + 0x28], r13
1459554aa: mov qword ptr [rsp + 0x20], 0
1459554b3: lea r12, [rbp + 0x110]
1459554ba: mov r9d, 8
1459554c0: mov rcx, r12
1459554c3: mov r15, qword ptr [rbp + 0x180]
1459554ca: mov rdx, r15
1459554cd: mov r14d, dword ptr [rbp + 0x150]
1459554d4: mov r8d, r14d
1459554d7: call 0x1458c6a00
1459554dc: mov rcx, rbx
1459554df: mov rdx, r12
1459554e2: call 0x141191d70
1459554e7: movsd qword ptr [rbp + 0x164], xmm7
1459554ef: movss dword ptr [rbp + 0x16c], xmm9
1459554f8: mov dword ptr [rbp + 0x160], 1
145955502: mov qword ptr [rsp + 0x30], rdi
145955507: mov qword ptr [rsp + 0x28], r13
14595550c: mov qword ptr [rsp + 0x20], 0
145955515: mov r9d, 8
14595551b: mov r8d, r14d
14595551e: mov rcx, r12
145955521: mov rdx, r15
145955524: call 0x1458c6a00
145955529: mov rcx, rbx
14595552c: mov rdx, r12
14595552f: call 0x141191d70
145955534: mov rdx, qword ptr [rsi + 0x568]
14595553b: cmp qword ptr [rbp + 0xf0], rdx
145955542: jae 0x145955f7f
145955548: mov rax, qword ptr [rsi + 0x560]
14595554f: mov rbx, qword ptr [rbp + 0x90]
145955556: movlps qword ptr [rax + rbx + 0x174], xmm7
14595555e: movss dword ptr [rax + rbx + 0x17c], xmm9
145955568: movlps qword ptr [rax + rbx + 0x180], xmm7
145955570: movss dword ptr [rax + rbx + 0x188], xmm9
14595557a: xorps xmm0, xmm0
14595557d: movss xmm0, xmm15
145955582: movlps qword ptr [rax + rbx + 0x18c], xmm0
14595558a: movaps xmm0, xmmword ptr [rbp + 0xe0]
145955591: subss xmm0, xmm8
145955596: movaps xmm1, xmmword ptr [rbp + 0xd0]
14595559d: subss xmm1, xmm7
1459555a1: call 0x145bf2983
1459555a6: movss dword ptr [rsp + 0x20], xmm0
1459555ac: movss xmm2, dword ptr [rip + 0x442060]
1459555b4: mov rcx, rsi
1459555b7: mov rdx, qword ptr [rbp + 0xf0]
1459555be: mov r9d, 1
1459555c4: call 0x145950630
1459555c9: jmp 0x145950c88
1459555ce: mov byte ptr [rbp + 0x177], 1
1459555d5: lea rax, [rbp + 0xa8]
1459555dc: mov qword ptr [rsp + 0x20], rax
1459555e1: movss xmm1, dword ptr [rip + 0x442027]
1459555e9: mov rcx, rsi
1459555ec: mov r8, qword ptr [rbp + 0x180]
1459555f3: mov r9d, dword ptr [rbp + 0x178]
1459555fa: call 0x145947540
1459555ff: nop
145955600: mov rdx, qword ptr [rbp + 0x18]
145955604: test rdx, rdx
145955607: je 0x145950c88
14595560d: mov rcx, qword ptr [rbp + 0x20]
145955611: shl rdx, 2
145955615: mov r8d, 4
14595561b: call 0x1400021d0
145955620: jmp 0x145950c88
145955625: lea r14, [rip + 0x189b37c]
14595562c: mov r15d, 0x1f
145955632: mov edx, 0x1f
145955637: jmp 0x14595564b
145955639: lea r14, [rip + 0x189b3af]
145955640: mov r15d, 0x2a
145955646: mov edx, 0x2a
14595564b: mov rcx, r14
14595564e: call 0x1458e5790
145955653: test rax, rax
145955656: cmove rdx, r15
14595565a: cmove rax, r14
14595565e: add rsi, 0x618
145955665: mov qword ptr [rsp + 0x20], rdx
14595566a: lea r14, [rbp + 0x110]
145955671: mov rcx, r14
145955674: mov rdx, rdi
145955677: mov r8, rbx
14595567a: mov r9, rax
14595567d: call 0x1458ba4f0
145955682: mov rcx, rsi
145955685: mov rdx, r14
145955688: call 0x141191d70
14595568d: jmp 0x145950c88
145955692: cmp ebx, 0x4be9
145955698: jg 0x145955718
14595569a: cmp ebx, 0x1c65
1459556a0: je 0x145955758
1459556a6: cmp ebx, 0x27c5
1459556ac: je 0x14595576c
1459556b2: cmp ebx, 0x2c66
1459556b8: je 0x14595570e
1459556ba: jmp 0x145955786
1459556bf: cmp ebx, 0x84
1459556c5: jle 0x145955762
1459556cb: cmp ebx, 0x85
1459556d1: je 0x14595570e
1459556d3: cmp ebx, 0x193
1459556d9: je 0x145955758
1459556db: cmp ebx, 0x2ae
1459556e1: je 0x145955758
1459556e3: jmp 0x145955786
1459556e8: cmp ebx, 0x1a85
1459556ee: je 0x14595570e
1459556f0: cmp ebx, 0x1b05
1459556f6: je 0x145955776
1459556f8: cmp ebx, 0x1b54
1459556fe: jne 0x145955786
145955704: movss xmm0, dword ptr [rip + 0x44ccf8]
14595570c: jmp 0x14595577e
14595570e: movss xmm0, dword ptr [rip + 0x49758e]
145955716: jmp 0x14595577e
145955718: cmp ebx, 0x4bea
14595571e: je 0x145955776
145955720: cmp ebx, 0x5ed3
145955726: je 0x145955e00
14595572c: cmp ebx, 0x6af7
145955732: je 0x145955758
145955734: jmp 0x145955786
145955736: cmp ebx, 0xafc
14595573c: je 0x145955758
14595573e: cmp ebx, 0xbe4
145955744: je 0x145955776
145955746: cmp ebx, 0xe16
14595574c: jne 0x145955786
14595574e: movss xmm0, dword ptr [rip + 0x1899e7a]
145955756: jmp 0x14595577e
145955758: movss xmm0, dword ptr [rip + 0x441e30]
145955760: jmp 0x14595577e
145955762: cmp ebx, 0x4b
145955765: je 0x145955776
145955767: cmp ebx, 0x74
14595576a: jne 0x145955786
14595576c: movss xmm0, dword ptr [rip + 0x44217c]
145955774: jmp 0x14595577e
145955776: movss xmm0, dword ptr [rip + 0x4422f6]
14595577e: movss dword ptr [rbp + 0xe0], xmm0
145955786: movaps xmmword ptr [rbp + 0xf0], xmm10
14595578e: test r13d, r13d
145955791: je 0x145950c88
145955797: mov eax, r13d
14595579a: xorps xmm0, xmm0
14595579d: cvtsi2ss xmm0, rax
1459557a2: lea rcx, [rsi + 0x9a0]
1459557a9: xorps xmm6, xmm6
1459557ac: movss dword ptr [rbp + 0xb8], xmm0
1459557b4: divss xmm6, xmm0
1459557b8: mulss xmm6, dword ptr [rip + 0x450a70]
1459557c0: movss xmm9, dword ptr [rip + 0x441e47]
1459557c9: xorps xmm1, xmm1
1459557cc: movaps xmm2, xmm9
1459557d0: call 0x1458ea390
1459557d5: movaps xmm10, xmm0
1459557d9: addss xmm10, xmm6
1459557de: mov r15, qword ptr [rsi + 0x998]
1459557e5: movaps xmm0, xmm10
1459557e9: call 0x145bf297d
1459557ee: movaps xmm11, xmm0
1459557f2: movaps xmm0, xmm10
1459557f6: call 0x145bf2977
1459557fb: unpcklps xmm11, xmm0
1459557ff: xorps xmm10, xmm10
145955803: mulps xmm10, xmm11
145955807: addps xmm10, xmmword ptr [rbp + 0xd0]
14595580f: movshdup xmm11, xmm10
145955814: add r15, 0x10
145955818: mov rcx, r15
14595581b: movaps xmm1, xmm10
14595581f: movaps xmm2, xmm11
145955823: call 0x1458cd010
145955828: movlps qword ptr [rbp + 0x164], xmm10
145955830: movss dword ptr [rbp + 0x16c], xmm0
145955838: mov dword ptr [rbp + 0x160], 1
145955842: mov dword ptr [rbp + 0xc0], 0
14595584c: lea rax, [rbp + 0xc0]
145955853: mov qword ptr [rsp + 0x30], rax
145955858: lea rax, [rbp + 0x160]
14595585f: mov qword ptr [rsp + 0x28], rax
145955864: mov qword ptr [rsp + 0x20], 0
14595586d: lea rcx, [rbp + 0x110]
145955874: mov r9d, 8
14595587a: mov rdx, qword ptr [rbp + 0x180]
145955881: mov r8d, ebx
145955884: call 0x1458c6a00
145955889: mov rdi, qword ptr [rsi + 0x628]
145955890: cmp rdi, qword ptr [rsi + 0x618]
145955897: jne 0x1459558a6
145955899: lea rcx, [rsi + 0x618]
1459558a0: call 0x145bf4ee0
1459558a5: nop
1459558a6: mulss xmm14, dword ptr [rip + 0x450901]
1459558af: mov rax, qword ptr [rsi + 0x620]
1459558b6: mov rcx, rdi
1459558b9: shl rcx, 5
1459558bd: movups xmm0, xmmword ptr [rbp + 0x110]
1459558c4: movups xmm1, xmmword ptr [rbp + 0x120]
1459558cb: movups xmmword ptr [rax + rcx + 0x10], xmm1
1459558d0: movups xmmword ptr [rax + rcx], xmm0
1459558d4: inc rdi
1459558d7: mov qword ptr [rsi + 0x628], rdi
1459558de: movaps xmm0, xmmword ptr [rbp + 0xf0]
1459558e5: subss xmm0, xmm11
1459558ea: movaps xmm1, xmmword ptr [rbp + 0x150]
1459558f1: subss xmm1, xmm10
1459558f6: mulss xmm1, xmm1
1459558fa: mulss xmm0, xmm0
1459558fe: addss xmm0, xmm1
145955902: xorps xmm6, xmm6
145955905: sqrtss xmm6, xmm0
145955909: divss xmm6, dword ptr [rbp + 0xe0]
145955911: maxss xmm6, dword ptr [rip + 0x4508df]
145955919: mov edi, dword ptr [rsi + 0xa38]
14595591f: inc edi
145955921: mov dword ptr [rsi + 0xa38], edi
145955927: movss xmm7, dword ptr [rsi + 0xa34]
14595592f: mov rcx, qword ptr [rsi + 0x998]
145955936: add rcx, 0x10
14595593a: movaps xmm1, xmm10
14595593e: movaps xmm2, xmm11
145955942: call 0x1458cd010
145955947: movaps xmm11, xmm0
14595594b: mov r15, qword ptr [rsi + 0x598]
145955952: cmp r15, qword ptr [rsi + 0x588]
145955959: jne 0x145955967
14595595b: lea rcx, [rsi + 0x588]
145955962: call 0x145bf4e00
145955967: addss xmm6, xmm7
14595596b: mov rax, qword ptr [rsi + 0x590]
145955972: mov rcx, r15
145955975: shl rcx, 7
145955979: mov qword ptr [rax + rcx], 0
145955981: mov dword ptr [rax + rcx + 0x10], 0
145955989: mov rdx, qword ptr [rbp + 0x180]
145955990: mov qword ptr [rax + rcx + 0x20], rdx
145955995: mov qword ptr [rax + rcx + 0x28], 0
14595599e: movabs rdx, 0x4020000000000000
1459559a8: mov qword ptr [rax + rcx + 0x30], rdx
1459559ad: mov dword ptr [rax + rcx + 0x3c], edi
1459559b1: movlps qword ptr [rax + rcx + 0x40], xmm10
1459559b7: movss dword ptr [rax + rcx + 0x48], xmm11
1459559be: mov dword ptr [rax + rcx + 0x4c], 0
1459559c6: movss dword ptr [rax + rcx + 0x50], xmm7
1459559cc: movss dword ptr [rax + rcx + 0x54], xmm6
1459559d2: mov qword ptr [rax + rcx + 0x58], 0
1459559db: movss dword ptr [rbp + 0x178], xmm14
1459559e4: movss dword ptr [rax + rcx + 0x60], xmm14
1459559eb: mov dword ptr [rax + rcx + 0x64], 0x7f800000
1459559f3: inc r15
1459559f6: xorps xmm0, xmm0
1459559f9: movups xmmword ptr [rax + rcx + 0x68], xmm0
1459559fe: mov qword ptr [rax + rcx + 0x77], 0
145955a07: mov qword ptr [rsi + 0x598], r15
145955a0e: cmp r13d, 1
145955a12: je 0x145950c88
145955a18: mov r15d, 1
145955a1e: movss xmm6, dword ptr [rip + 0x450796]
145955a26: movss xmm13, dword ptr [rip + 0x441e09]
145955a2f: movss xmm15, dword ptr [rip + 0x44c858]
145955a38: movss xmm8, dword ptr [rip + 0x477607]
145955a41: lea r12, [rbp + 0x110]
145955a48: jmp 0x145955b00
145955a4d: inc r15d
145955a50: addss xmm7, xmm14
145955a55: mov rax, qword ptr [rsi + 0x590]
145955a5c: mov rcx, r14
145955a5f: shl rcx, 7
145955a63: mov qword ptr [rax + rcx], 0
145955a6b: mov dword ptr [rax + rcx + 0x10], 0
145955a73: mov rdx, qword ptr [rbp + 0x180]
145955a7a: mov qword ptr [rax + rcx + 0x20], rdx
145955a7f: mov qword ptr [rax + rcx + 0x28], 0
145955a88: movabs rdx, 0x4020000000000000
145955a92: mov qword ptr [rax + rcx + 0x30], rdx
145955a97: mov dword ptr [rax + rcx + 0x3c], edi
145955a9b: movlps qword ptr [rax + rcx + 0x40], xmm10
145955aa1: movss dword ptr [rax + rcx + 0x48], xmm12
145955aa8: mov dword ptr [rax + rcx + 0x4c], 0
145955ab0: movss dword ptr [rax + rcx + 0x50], xmm14
145955ab7: movss dword ptr [rax + rcx + 0x54], xmm7
145955abd: mov qword ptr [rax + rcx + 0x58], 0
145955ac6: movss xmm0, dword ptr [rbp + 0x178]
145955ace: movss dword ptr [rax + rcx + 0x60], xmm0
145955ad4: mov dword ptr [rax + rcx + 0x64], 0x7f800000
145955adc: inc r14
145955adf: xorps xmm0, xmm0
145955ae2: movups xmmword ptr [rax + rcx + 0x68], xmm0
145955ae7: mov qword ptr [rax + rcx + 0x77], 0
145955af0: mov qword ptr [rsi + 0x598], r14
145955af7: cmp r15d, r13d
145955afa: je 0x145950c88
145955b00: mov rdx, qword ptr [rsi + 0x9a0]
145955b07: mov rax, qword ptr [rsi + 0x9a8]
145955b0e: mov r8, qword ptr [rsi + 0x9b8]
145955b15: mov rcx, qword ptr [rsi + 0x9b0]
145955b1c: nop dword ptr [rax]
145955b20: lea r9, [rdx + r8]
145955b24: rol r9, 0x17
145955b28: add r9, rdx
145955b2b: mov r10, rax
145955b2e: shl r10, 0x11
145955b32: xor rcx, rdx
145955b35: xor r8, rax
145955b38: xor rax, rcx
145955b3b: xor rdx, r8
145955b3e: xor rcx, r10
145955b41: rol r8, 0x2d
145955b45: shr r9, 0x29
145955b49: or r9d, 0x3f800000
145955b50: movd xmm0, r9d
145955b55: addss xmm0, xmm6
145955b59: ucomiss xmm9, xmm0
145955b5d: jbe 0x145955b20
145955b5f: mov qword ptr [rsi + 0x9a0], rdx
145955b66: mov qword ptr [rsi + 0x9b8], r8
145955b6d: mov qword ptr [rsi + 0x9a8], rax
145955b74: mov qword ptr [rsi + 0x9b0], rcx
145955b7b: nop dword ptr [rax + rax]
145955b80: lea r9, [rdx + r8]
145955b84: rol r9, 0x17
145955b88: add r9, rdx
145955b8b: mov r10, rax
145955b8e: shl r10, 0x11
145955b92: xor rcx, rdx
145955b95: xor r8, rax
145955b98: xor rax, rcx
145955b9b: xor rdx, r8
145955b9e: xor rcx, r10
145955ba1: rol r8, 0x2d
145955ba5: shr r9, 0x29
145955ba9: or r9d, 0x3f800000
145955bb0: movd xmm7, r9d
145955bb5: addss xmm7, xmm6
145955bb9: mulss xmm7, xmm13
145955bbe: addss xmm7, xmm15
145955bc3: ucomiss xmm8, xmm7
145955bc7: jbe 0x145955b80
145955bc9: mov r9d, r15d
145955bcc: cvtsi2ss xmm10, r9
145955bd1: divss xmm10, dword ptr [rbp + 0xb8]
145955bda: mulss xmm10, dword ptr [rip + 0x45064d]
145955be3: addss xmm10, xmm0
145955be8: mov qword ptr [rsi + 0x9a0], rdx
145955bef: mov qword ptr [rsi + 0x9b8], r8
145955bf6: mov qword ptr [rsi + 0x9a8], rax
145955bfd: mov qword ptr [rsi + 0x9b0], rcx
145955c04: movaps xmm0, xmm10
145955c08: call 0x145bf297d
145955c0d: movaps xmm11, xmm0
145955c11: movaps xmm0, xmm10
145955c15: call 0x145bf2977
145955c1a: unpcklps xmm11, xmm0
145955c1e: movsldup xmm10, xmm7
145955c23: mulps xmm10, xmm11
145955c27: addps xmm10, xmmword ptr [rbp + 0xd0]
145955c2f: movshdup xmm11, xmm10
145955c34: mov rdi, qword ptr [rsi + 0x998]
145955c3b: lea rcx, [rdi + 0x10]
145955c3f: movaps xmm1, xmm10
145955c43: movaps xmm2, xmm11
145955c47: call 0x1458d0220
145955c4c: test al, 1
145955c4e: jne 0x145955c86
145955c50: cmp qword ptr [rdi + 0x68], -1
145955c55: je 0x145955c7e
145955c57: lea rdx, [rdi + 0x68]
145955c5b: mov rcx, r12
145955c5e: movaps xmm2, xmm10
145955c62: movaps xmm3, xmm11
145955c66: call 0x1458d5410
145955c6b: cmp dword ptr [rbp + 0x110], 1
145955c72: jne 0x145955c7e
145955c74: movss xmm0, dword ptr [rbp + 0x11c]
145955c7c: jmp 0x145955c86
145955c7e: movss xmm0, dword ptr [rdi + 0xb8]
145955c86: movlps qword ptr [rbp + 0x164], xmm10
145955c8e: movss dword ptr [rbp + 0x16c], xmm0
145955c96: mov dword ptr [rbp + 0x160], 1
145955ca0: mov dword ptr [rbp + 0xc0], 0
145955caa: lea rax, [rbp + 0xc0]
145955cb1: mov qword ptr [rsp + 0x30], rax
145955cb6: lea rax, [rbp + 0x160]
145955cbd: mov qword ptr [rsp + 0x28], rax
145955cc2: mov qword ptr [rsp + 0x20], 0
145955ccb: mov r9d, 8
145955cd1: mov rcx, r12
145955cd4: mov rdx, qword ptr [rbp + 0x180]
145955cdb: mov r8d, ebx
145955cde: call 0x1458c6a00
145955ce3: mov rdi, qword ptr [rsi + 0x628]
145955cea: cmp rdi, qword ptr [rsi + 0x618]
145955cf1: jne 0x145955d00
145955cf3: lea rcx, [rsi + 0x618]
145955cfa: call 0x145bf4ee0
145955cff: nop
145955d00: mov rax, qword ptr [rsi + 0x620]
145955d07: mov rcx, rdi
145955d0a: shl rcx, 5
145955d0e: movups xmm0, xmmword ptr [rbp + 0x110]
145955d15: movups xmm1, xmmword ptr [rbp + 0x120]
145955d1c: movups xmmword ptr [rax + rcx + 0x10], xmm1
145955d21: movups xmmword ptr [rax + rcx], xmm0
145955d25: inc rdi
145955d28: mov qword ptr [rsi + 0x628], rdi
145955d2f: movaps xmm0, xmmword ptr [rbp + 0xf0]
145955d36: subss xmm0, xmm11
145955d3b: movaps xmm1, xmmword ptr [rbp + 0x150]
145955d42: subss xmm1, xmm10
145955d47: mulss xmm1, xmm1
145955d4b: mulss xmm0, xmm0
145955d4f: addss xmm0, xmm1
145955d53: xorps xmm7, xmm7
145955d56: sqrtss xmm7, xmm0
145955d5a: divss xmm7, dword ptr [rbp + 0xe0]
145955d62: maxss xmm7, dword ptr [rip + 0x45048e]
145955d6a: mov edi, dword ptr [rsi + 0xa38]
145955d70: inc edi
145955d72: mov dword ptr [rsi + 0xa38], edi
145955d78: movss xmm14, dword ptr [rsi + 0xa34]
145955d81: mov r14, qword ptr [rsi + 0x998]
145955d88: lea rcx, [r14 + 0x10]
145955d8c: movaps xmm1, xmm10
145955d90: movaps xmm2, xmm11
145955d94: call 0x1458d0220
145955d99: test al, 1
145955d9b: je 0x145955da3
145955d9d: movaps xmm12, xmm0
145955da1: jmp 0x145955ddb
145955da3: cmp qword ptr [r14 + 0x68], -1
145955da8: je 0x145955dd2
145955daa: lea rdx, [r14 + 0x68]
145955dae: mov rcx, r12
145955db1: movaps xmm2, xmm10
145955db5: movaps xmm3, xmm11
145955db9: call 0x1458d5410
145955dbe: cmp dword ptr [rbp + 0x110], 1
145955dc5: jne 0x145955dd2
145955dc7: movss xmm12, dword ptr [rbp + 0x11c]
145955dd0: jmp 0x145955ddb
145955dd2: movss xmm12, dword ptr [r14 + 0xb8]
145955ddb: mov r14, qword ptr [rsi + 0x598]
145955de2: cmp r14, qword ptr [rsi + 0x588]
145955de9: jne 0x145955a4d
145955def: lea rcx, [rsi + 0x588]
145955df6: call 0x145bf4e00
145955dfb: jmp 0x145955a4d
145955e00: movss xmm0, dword ptr [rip + 0x1899728]
145955e08: jmp 0x14595577e
