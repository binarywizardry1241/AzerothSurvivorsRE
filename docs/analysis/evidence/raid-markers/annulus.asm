14013e2a0: 55 push rbp
14013e2a1: 4157 push r15
14013e2a3: 4156 push r14
14013e2a5: 4155 push r13
14013e2a7: 4154 push r12
14013e2a9: 56 push rsi
14013e2aa: 57 push rdi
14013e2ab: 53 push rbx
14013e2ac: 4881ec88010000 sub rsp, 0x188
14013e2b3: 488dac2480000000 lea rbp, [rsp + 0x80]
14013e2bb: 440f29bdf0000000 movaps xmmword ptr [rbp + 0xf0], xmm15
14013e2c3: 440f29b5e0000000 movaps xmmword ptr [rbp + 0xe0], xmm14
14013e2cb: 440f29add0000000 movaps xmmword ptr [rbp + 0xd0], xmm13
14013e2d3: 440f29a5c0000000 movaps xmmword ptr [rbp + 0xc0], xmm12
14013e2db: 440f299db0000000 movaps xmmword ptr [rbp + 0xb0], xmm11
14013e2e3: 440f2995a0000000 movaps xmmword ptr [rbp + 0xa0], xmm10
14013e2eb: 440f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm9
14013e2f3: 440f298580000000 movaps xmmword ptr [rbp + 0x80], xmm8
14013e2fb: 0f297d70 movaps xmmword ptr [rbp + 0x70], xmm7
14013e2ff: 0f297560 movaps xmmword ptr [rbp + 0x60], xmm6
14013e303: 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
14013e30b: 44884d57 mov byte ptr [rbp + 0x57], r9b
14013e30f: 44884556 mov byte ptr [rbp + 0x56], r8b
14013e313: 4989d1 mov r9, rdx
14013e316: 48894d08 mov qword ptr [rbp + 8], rcx
14013e31a: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14013e321: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14013e329: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
14013e331: 48c7454004000000 mov qword ptr [rbp + 0x40], 4
14013e339: 48c7454800000000 mov qword ptr [rbp + 0x48], 0
14013e341: 48c7421000000000 mov qword ptr [rdx + 0x10], 0
14013e349: 440f28354fedc805 movaps xmm14, xmmword ptr [rip + 0x5c8ed4f]
14013e351: 0f28c8 movaps xmm1, xmm0
14013e354: 410f57ce xorps xmm1, xmm14
14013e358: f30f101524ebc805 movss xmm2, dword ptr [rip + 0x5c8eb24]
14013e360: f30f59d0 mulss xmm2, xmm0
14013e364: f30f58155cf1c505 addss xmm2, dword ptr [rip + 0x5c5f15c]
14013e36c: f30f105808 movss xmm3, dword ptr [rax + 8]
14013e371: f20f1030 movsd xmm6, qword ptr [rax]
14013e375: f30f16e6 movshdup xmm4, xmm6
14013e379: 0f2965c0 movaps xmmword ptr [rbp - 0x40], xmm4
14013e37d: 410f57e6 xorps xmm4, xmm14
14013e381: 0f28ee movaps xmm5, xmm6
14013e384: 410f57ee xorps xmm5, xmm14
14013e388: 0f28fa movaps xmm7, xmm2
14013e38b: 410f57fe xorps xmm7, xmm14
14013e38f: f30f1165d4 movss dword ptr [rbp - 0x2c], xmm4
14013e394: f30f115dd8 movss dword ptr [rbp - 0x28], xmm3
14013e399: f30f116ddc movss dword ptr [rbp - 0x24], xmm5
14013e39e: f20f101d1a3fca05 movsd xmm3, qword ptr [rip + 0x5ca3f1a]
14013e3a6: f20f115de0 movsd qword ptr [rbp - 0x20], xmm3
14013e3ab: f30f114de8 movss dword ptr [rbp - 0x18], xmm1
14013e3b0: f30f1145ec movss dword ptr [rbp - 0x14], xmm0
14013e3b5: f30f114df0 movss dword ptr [rbp - 0x10], xmm1
14013e3ba: f30f1145f4 movss dword ptr [rbp - 0xc], xmm0
14013e3bf: f30f117df8 movss dword ptr [rbp - 8], xmm7
14013e3c4: f30f1155fc movss dword ptr [rbp - 4], xmm2
14013e3c9: 488b5218 mov rdx, qword ptr [rdx + 0x18]
14013e3cd: 4c8d45d4 lea r8, [rbp - 0x2c]
14013e3d1: 4c894d00 mov qword ptr [rbp], r9
14013e3d5: 4c89c9 mov rcx, r9
14013e3d8: 4d89c1 mov r9, r8
14013e3db: e840ecf4ff call 0x14008d020
14013e3e0: 90 nop
14013e3e1: f3440f108580010000 movss xmm8, dword ptr [rbp + 0x180]
14013e3ea: 410f28c8 movaps xmm1, xmm8
14013e3ee: f30f5f0d7a3eca05 maxss xmm1, dword ptr [rip + 0x5ca3e7a]
14013e3f6: f30f1005b23eca05 movss xmm0, dword ptr [rip + 0x5ca3eb2]
14013e3fe: f30f5ec1 divss xmm0, xmm1
14013e402: f30f580596eec505 addss xmm0, dword ptr [rip + 0x5c5ee96]
14013e40a: e82cbdab05 call 0x145bfa13b
14013e40f: f30f58c0 addss xmm0, xmm0
14013e413: f30f5d05993eca05 minss xmm0, dword ptr [rip + 0x5ca3e99]
14013e41b: f3440f103d1cedc805 movss xmm15, dword ptr [rip + 0x5c8ed1c]
14013e424: 410f28cf movaps xmm1, xmm15
14013e428: f30f5ec8 divss xmm1, xmm0
14013e42c: 0f28c1 movaps xmm0, xmm1
14013e42f: e80dbdab05 call 0x145bfa141
14013e434: f3480f2cc0 cvttss2si rax, xmm0
14013e439: 4889c1 mov rcx, rax
14013e43c: 48c1f93f sar rcx, 0x3f
14013e440: 0f28c8 movaps xmm1, xmm0
14013e443: f30f5c0d95f1c505 subss xmm1, dword ptr [rip + 0x5c5f195]
14013e44b: f3480f2cd1 cvttss2si rdx, xmm1
14013e450: 4821ca and rdx, rcx
14013e453: 4809c2 or rdx, rax
14013e456: 31c0 xor eax, eax
14013e458: 0f57c9 xorps xmm1, xmm1
14013e45b: 0f2ec1 ucomiss xmm0, xmm1
14013e45e: 480f43c2 cmovae rax, rdx
14013e462: 0f2e057bf1c505 ucomiss xmm0, dword ptr [rip + 0x5c5f17b]
14013e469: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
14013e470: 480f46c8 cmovbe rcx, rax
14013e474: 4883f904 cmp rcx, 4
14013e478: b803000000 mov eax, 3
14013e47d: 480f42c8 cmovb rcx, rax
14013e481: 4881f9a0000000 cmp rcx, 0xa0
14013e488: 41bda0000000 mov r13d, 0xa0
14013e48e: 4c0f42e9 cmovb r13, rcx
14013e492: 0f57c0 xorps xmm0, xmm0
14013e495: f3490f2ac5 cvtsi2ss xmm0, r13
14013e49a: f3440f5ef8 divss xmm15, xmm0
14013e49f: f30f1005fdedc505 movss xmm0, dword ptr [rip + 0x5c5edfd]
14013e4a7: f3410f59c7 mulss xmm0, xmm15
14013e4ac: e86cbcab05 call 0x145bfa11d
14013e4b1: 0f28f8 movaps xmm7, xmm0
14013e4b4: f3410f59f8 mulss xmm7, xmm8
14013e4b9: 48b8abaaaaaaaaaaaaaa movabs rax, 0xaaaaaaaaaaaaaaab
14013e4c3: 488b4d00 mov rcx, qword ptr [rbp]
14013e4c7: 48f76110 mul qword ptr [rcx + 0x10]
14013e4cb: 488b5908 mov rbx, qword ptr [rcx + 8]
14013e4cf: 48d1ea shr rdx, 1
14013e4d2: f3440f5f05f5ebc805 maxss xmm8, dword ptr [rip + 0x5c8ebf5]
14013e4db: f3440f59059cefc505 mulss xmm8, dword ptr [rip + 0x5c5ef9c]
14013e4e4: f3440f114534 movss dword ptr [rbp + 0x34], xmm8
14013e4ea: 488d3c52 lea rdi, [rdx + rdx*2]
14013e4ee: 488d7510 lea rsi, [rbp + 0x10]
14013e4f2: 4c8d7d38 lea r15, [rbp + 0x38]
14013e4f6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14013e500: 440fb67557 movzx r14d, byte ptr [rbp + 0x57]
14013e505: 4883ff02 cmp rdi, 2
14013e509: 0f8620030000 jbe 0x14013e82f
14013e50f: 4989dc mov r12, rbx
14013e512: 4883c36c add rbx, 0x6c
14013e516: 4883c7fd add rdi, -3
14013e51a: f3410f100c24 movss xmm1, dword ptr [r12]
14013e520: f3410f10442408 movss xmm0, dword ptr [r12 + 8]
14013e527: 0f14c1 unpcklps xmm0, xmm1
14013e52a: f3410f10542424 movss xmm2, dword ptr [r12 + 0x24]
14013e531: f3410f104c242c movss xmm1, dword ptr [r12 + 0x2c]
14013e538: 0f14ca unpcklps xmm1, xmm2
14013e53b: 410f57ce xorps xmm1, xmm14
14013e53f: 0f5cce subps xmm1, xmm6
14013e542: 0f28d1 movaps xmm2, xmm1
14013e545: 0f59d1 mulps xmm2, xmm1
14013e548: f30f16da movshdup xmm3, xmm2
14013e54c: f30f58da addss xmm3, xmm2
14013e550: f30f51db sqrtss xmm3, xmm3
14013e554: 410f57c6 xorps xmm0, xmm14
14013e558: 0f5cc6 subps xmm0, xmm6
14013e55b: 0f28d0 movaps xmm2, xmm0
14013e55e: 0f59d0 mulps xmm2, xmm0
14013e561: f30f16e2 movshdup xmm4, xmm2
14013e565: f30f58e2 addss xmm4, xmm2
14013e569: f30f51e4 sqrtss xmm4, xmm4
14013e56d: f3410f106c2448 movss xmm5, dword ptr [r12 + 0x48]
14013e574: f3410f10542450 movss xmm2, dword ptr [r12 + 0x50]
14013e57b: 0f14d5 unpcklps xmm2, xmm5
14013e57e: 410f57d6 xorps xmm2, xmm14
14013e582: 0f5cd6 subps xmm2, xmm6
14013e585: 0f28ea movaps xmm5, xmm2
14013e588: 0f59ea mulps xmm5, xmm2
14013e58b: f3440f16c5 movshdup xmm8, xmm5
14013e590: f3440f58c5 addss xmm8, xmm5
14013e595: 0f57ed xorps xmm5, xmm5
14013e598: f3410f51e8 sqrtss xmm5, xmm8
14013e59d: 440f28c4 movaps xmm8, xmm4
14013e5a1: f3440f5fc3 maxss xmm8, xmm3
14013e5a6: 450f28c8 movaps xmm9, xmm8
14013e5aa: f3450fc2c803 cmpunordss xmm9, xmm8
14013e5b0: 450f28d1 movaps xmm10, xmm9
14013e5b4: 450f55d0 andnps xmm10, xmm8
14013e5b8: 440f54cc andps xmm9, xmm4
14013e5bc: 450f56ca orps xmm9, xmm10
14013e5c0: 450f28c1 movaps xmm8, xmm9
14013e5c4: f3440f5fc5 maxss xmm8, xmm5
14013e5c9: 450f28d0 movaps xmm10, xmm8
14013e5cd: f3450fc2d003 cmpunordss xmm10, xmm8
14013e5d3: 450f54ca andps xmm9, xmm10
14013e5d7: 450f55d0 andnps xmm10, xmm8
14013e5db: 450f56d1 orps xmm10, xmm9
14013e5df: 410f2efa ucomiss xmm7, xmm10
14013e5e3: 0f831cffffff jae 0x14013e505
14013e5e9: 440f28c4 movaps xmm8, xmm4
14013e5ed: f3440f5dc3 minss xmm8, xmm3
14013e5f2: 450f28c8 movaps xmm9, xmm8
14013e5f6: f3450fc2c803 cmpunordss xmm9, xmm8
14013e5fc: 410f28d9 movaps xmm3, xmm9
14013e600: 410f55d8 andnps xmm3, xmm8
14013e604: 440f54cc andps xmm9, xmm4
14013e608: 440f56cb orps xmm9, xmm3
14013e60c: 410f28e1 movaps xmm4, xmm9
14013e610: f30f5de5 minss xmm4, xmm5
14013e614: 0f28dc movaps xmm3, xmm4
14013e617: f30fc2dc03 cmpunordss xmm3, xmm4
14013e61c: 440f54cb andps xmm9, xmm3
14013e620: 0f55dc andnps xmm3, xmm4
14013e623: 410f56d9 orps xmm3, xmm9
14013e627: 0f28e0 movaps xmm4, xmm0
14013e62a: 0f5ce1 subps xmm4, xmm1
14013e62d: 0f59e4 mulps xmm4, xmm4
14013e630: f30f16ec movshdup xmm5, xmm4
14013e634: f30f58ec addss xmm5, xmm4
14013e638: 0f57e4 xorps xmm4, xmm4
14013e63b: f30f51e5 sqrtss xmm4, xmm5
14013e63f: 0f57ed xorps xmm5, xmm5
14013e642: f30f5fe5 maxss xmm4, xmm5
14013e646: 0f5cca subps xmm1, xmm2
14013e649: 0f59c9 mulps xmm1, xmm1
14013e64c: f30f16e9 movshdup xmm5, xmm1
14013e650: f30f58e9 addss xmm5, xmm1
14013e654: 0f57c9 xorps xmm1, xmm1
14013e657: f30f51cd sqrtss xmm1, xmm5
14013e65b: f30f5fcc maxss xmm1, xmm4
14013e65f: 0f5cd0 subps xmm2, xmm0
14013e662: 0f59d2 mulps xmm2, xmm2
14013e665: f30f16c2 movshdup xmm0, xmm2
14013e669: f30f58c2 addss xmm0, xmm2
14013e66d: f30f51c0 sqrtss xmm0, xmm0
14013e671: f30f5fc1 maxss xmm0, xmm1
14013e675: f30f59c0 mulss xmm0, xmm0
14013e679: f30f5e4534 divss xmm0, dword ptr [rbp + 0x34]
14013e67e: f30f588580010000 addss xmm0, dword ptr [rbp + 0x180]
14013e686: 0f2ed8 ucomiss xmm3, xmm0
14013e689: 0f82a1000000 jb 0x14013e730
14013e68f: 488b4538 mov rax, qword ptr [rbp + 0x38]
14013e693: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14013e697: 4829d0 sub rax, rdx
14013e69a: 4883f802 cmp rax, 2
14013e69e: 7660 jbe 0x14013e700
14013e6a0: 488b4540 mov rax, qword ptr [rbp + 0x40]
14013e6a4: 488d0cd2 lea rcx, [rdx + rdx*8]
14013e6a8: 410f1044245c movups xmm0, xmmword ptr [r12 + 0x5c]
14013e6ae: 0f1144885c movups xmmword ptr [rax + rcx*4 + 0x5c], xmm0
14013e6b3: 410f10442450 movups xmm0, xmmword ptr [r12 + 0x50]
14013e6b9: 0f11448850 movups xmmword ptr [rax + rcx*4 + 0x50], xmm0
14013e6be: 410f10442440 movups xmm0, xmmword ptr [r12 + 0x40]
14013e6c4: 0f11448840 movups xmmword ptr [rax + rcx*4 + 0x40], xmm0
14013e6c9: 410f100424 movups xmm0, xmmword ptr [r12]
14013e6ce: 410f104c2410 movups xmm1, xmmword ptr [r12 + 0x10]
14013e6d4: 410f10542420 movups xmm2, xmmword ptr [r12 + 0x20]
14013e6da: 410f105c2430 movups xmm3, xmmword ptr [r12 + 0x30]
14013e6e0: 0f115c8830 movups xmmword ptr [rax + rcx*4 + 0x30], xmm3
14013e6e5: 0f11548820 movups xmmword ptr [rax + rcx*4 + 0x20], xmm2
14013e6ea: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
14013e6ef: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
14013e6f3: 4883c203 add rdx, 3
14013e6f7: 48895548 mov qword ptr [rbp + 0x48], rdx
14013e6fb: e905feffff jmp 0x14013e505
14013e700: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14013e709: 41b803000000 mov r8d, 3
14013e70f: 41b904000000 mov r9d, 4
14013e715: 4c89f9 mov rcx, r15
14013e718: e853c2ab05 call 0x145bfa970
14013e71d: 90 nop
14013e71e: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14013e722: 440fb67557 movzx r14d, byte ptr [rbp + 0x57]
14013e727: e974ffffff jmp 0x14013e6a0
14013e72c: 0f1f4000 nop dword ptr [rax]
14013e730: 4531f6 xor r14d, r14d
14013e733: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14013e740: 4d39ee cmp r14, r13
14013e743: 0f83b7fdffff jae 0x14013e500
14013e749: 450f57d2 xorps xmm10, xmm10
14013e74d: f34d0f2ad6 cvtsi2ss xmm10, r14
14013e752: 49ffc6 inc r14
14013e755: f3450f59d7 mulss xmm10, xmm15
14013e75a: 450f57c0 xorps xmm8, xmm8
14013e75e: f34d0f2ac6 cvtsi2ss xmm8, r14
14013e763: f3450f59c7 mulss xmm8, xmm15
14013e768: 410f28c2 movaps xmm0, xmm10
14013e76c: e8acb9ab05 call 0x145bfa11d
14013e771: 440f28c8 movaps xmm9, xmm0
14013e775: 410f28c2 movaps xmm0, xmm10
14013e779: e899b9ab05 call 0x145bfa117
14013e77e: 440f28d8 movaps xmm11, xmm0
14013e782: 450f57de xorps xmm11, xmm14
14013e786: 410f28c0 movaps xmm0, xmm8
14013e78a: e88eb9ab05 call 0x145bfa11d
14013e78f: 440f28e0 movaps xmm12, xmm0
14013e793: 410f28c0 movaps xmm0, xmm8
14013e797: e87bb9ab05 call 0x145bfa117
14013e79c: 440f28e8 movaps xmm13, xmm0
14013e7a0: 450f57e6 xorps xmm12, xmm14
14013e7a4: f3450f58c2 addss xmm8, xmm10
14013e7a9: f3440f5905f2eac505 mulss xmm8, dword ptr [rip + 0x5c5eaf2]
14013e7b2: 410f28c0 movaps xmm0, xmm8
14013e7b6: e862b9ab05 call 0x145bfa11d
14013e7bb: 440f28d0 movaps xmm10, xmm0
14013e7bf: 410f28c0 movaps xmm0, xmm8
14013e7c3: e84fb9ab05 call 0x145bfa117
14013e7c8: f3440f115d10 movss dword ptr [rbp + 0x10], xmm11
14013e7ce: f3440f114d14 movss dword ptr [rbp + 0x14], xmm9
14013e7d4: c7451800000000 mov dword ptr [rbp + 0x18], 0
14013e7db: f3440f116d1c movss dword ptr [rbp + 0x1c], xmm13
14013e7e1: f3440f116520 movss dword ptr [rbp + 0x20], xmm12
14013e7e7: c7452400000000 mov dword ptr [rbp + 0x24], 0
14013e7ee: f3440f115528 movss dword ptr [rbp + 0x28], xmm10
14013e7f4: f30f11452c movss dword ptr [rbp + 0x2c], xmm0
14013e7f9: f30f117d30 movss dword ptr [rbp + 0x30], xmm7
14013e7fe: 4889742428 mov qword ptr [rsp + 0x28], rsi
14013e803: 0f2845c0 movaps xmm0, xmmword ptr [rbp - 0x40]
14013e807: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14013e80d: 48c744243003000000 mov qword ptr [rsp + 0x30], 3
14013e816: ba03000000 mov edx, 3
14013e81b: 4c89e1 mov rcx, r12
14013e81e: 4d89f8 mov r8, r15
14013e821: 0f28de movaps xmm3, xmm6
14013e824: e8a7950000 call 0x140147dd0
14013e829: 90 nop
14013e82a: e911ffffff jmp 0x14013e740
14013e82f: 488b4500 mov rax, qword ptr [rbp]
14013e833: 488b7020 mov rsi, qword ptr [rax + 0x20]
14013e837: 44887555 mov byte ptr [rbp + 0x55], r14b
14013e83b: 48837e1800 cmp qword ptr [rsi + 0x18], 0
14013e840: 0f84ca000000 je 0x14013e910
14013e846: 488d4e20 lea rcx, [rsi + 0x20]
14013e84a: 488d5555 lea rdx, [rbp + 0x55]
14013e84e: e81dececff call 0x14000d470
14013e853: 4989c0 mov r8, rax
14013e856: 49c1e839 shr r8, 0x39
14013e85a: 488b0e mov rcx, qword ptr [rsi]
14013e85d: 488b5608 mov rdx, qword ptr [rsi + 8]
14013e861: 66410f6ec0 movd xmm0, r8d
14013e866: 660f60c0 punpcklbw xmm0, xmm0
14013e86a: f20f70c000 pshuflw xmm0, xmm0, 0
14013e86f: 660f70c044 pshufd xmm0, xmm0, 0x44
14013e874: 4531c0 xor r8d, r8d
14013e877: 660f76c9 pcmpeqd xmm1, xmm1
14013e87b: 4821d0 and rax, rdx
14013e87e: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14013e883: 660f6fda movdqa xmm3, xmm2
14013e887: 660f74d8 pcmpeqb xmm3, xmm0
14013e88b: 66440fd7cb pmovmskb r9d, xmm3
14013e890: 4585c9 test r9d, r9d
14013e893: 742b je 0x14013e8c0
14013e895: f3450fbcd9 tzcnt r11d, r9d
14013e89a: 4901c3 add r11, rax
14013e89d: 4921d3 and r11, rdx
14013e8a0: 49c1e305 shl r11, 5
14013e8a4: 4989ca mov r10, rcx
14013e8a7: 4d29da sub r10, r11
14013e8aa: 453a72e0 cmp r14b, byte ptr [r10 - 0x20]
14013e8ae: 742b je 0x14013e8db
14013e8b0: 458d51ff lea r10d, [r9 - 1]
14013e8b4: 664521ca and r10w, r9w
14013e8b8: 4589d1 mov r9d, r10d
14013e8bb: 75d8 jne 0x14013e895
14013e8bd: 0f1f00 nop dword ptr [rax]
14013e8c0: 660f74d1 pcmpeqb xmm2, xmm1
14013e8c4: 66440fd7ca pmovmskb r9d, xmm2
14013e8c9: 4585c9 test r9d, r9d
14013e8cc: 7542 jne 0x14013e910
14013e8ce: 4c01c0 add rax, r8
14013e8d1: 4883c010 add rax, 0x10
14013e8d5: 4983c010 add r8, 0x10
14013e8d9: eba0 jmp 0x14013e87b
14013e8db: 41807ae800 cmp byte ptr [r10 - 0x18], 0
14013e8e0: 7449 je 0x14013e92b
14013e8e2: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
14013e8e7: 884512 mov byte ptr [rbp + 0x12], al
14013e8ea: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
14013e8ef: 66894510 mov word ptr [rbp + 0x10], ax
14013e8f3: 498d4aec lea rcx, [r10 - 0x14]
14013e8f7: 498d52f0 lea rdx, [r10 - 0x10]
14013e8fb: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
14013e8ff: 410fb642f8 movzx eax, byte ptr [r10 - 8]
14013e904: 48c1e020 shl rax, 0x20
14013e908: 4c09c0 or rax, r8
14013e90b: 41b001 mov r8b, 1
14013e90e: eb2a jmp 0x14013e93a
14013e910: 488d0de445ca05 lea rcx, [rip + 0x5ca45e4]
14013e917: 4c8d05fa45ca05 lea r8, [rip + 0x5ca45fa]
14013e91e: ba16000000 mov edx, 0x16
14013e923: e848acc505 call 0x145d99570
14013e928: 90 nop
14013e929: 0f0b ud2
14013e92b: 498b52f0 mov rdx, qword ptr [r10 - 0x10]
14013e92f: 488d4a68 lea rcx, [rdx + 0x68]
14013e933: 4883c26c add rdx, 0x6c
14013e937: 4531c0 xor r8d, r8d
14013e93a: 4c8b5508 mov r10, qword ptr [rbp + 8]
14013e93e: 440fb65d56 movzx r11d, byte ptr [rbp + 0x56]
14013e943: 8b12 mov edx, dword ptr [rdx]
14013e945: 8b09 mov ecx, dword ptr [rcx]
14013e947: 4c8b4d48 mov r9, qword ptr [rbp + 0x48]
14013e94b: 4d894a10 mov qword ptr [r10 + 0x10], r9
14013e94f: 0f104538 movups xmm0, xmmword ptr [rbp + 0x38]
14013e953: 410f1102 movups xmmword ptr [r10], xmm0
14013e957: 45885a2c mov byte ptr [r10 + 0x2c], r11b
14013e95b: 45884218 mov byte ptr [r10 + 0x18], r8b
14013e95f: 440fb74510 movzx r8d, word ptr [rbp + 0x10]
14013e964: 6645894219 mov word ptr [r10 + 0x19], r8w
14013e969: 440fb64512 movzx r8d, byte ptr [rbp + 0x12]
14013e96e: 4588421b mov byte ptr [r10 + 0x1b], r8b
14013e972: 41894a1c mov dword ptr [r10 + 0x1c], ecx
14013e976: 41895220 mov dword ptr [r10 + 0x20], edx
14013e97a: 49894224 mov qword ptr [r10 + 0x24], rax
14013e97e: 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
14013e982: 0f287d70 movaps xmm7, xmmword ptr [rbp + 0x70]
14013e986: 440f288580000000 movaps xmm8, xmmword ptr [rbp + 0x80]
14013e98e: 440f288d90000000 movaps xmm9, xmmword ptr [rbp + 0x90]
14013e996: 440f2895a0000000 movaps xmm10, xmmword ptr [rbp + 0xa0]
14013e99e: 440f289db0000000 movaps xmm11, xmmword ptr [rbp + 0xb0]
14013e9a6: 440f28a5c0000000 movaps xmm12, xmmword ptr [rbp + 0xc0]
14013e9ae: 440f28add0000000 movaps xmm13, xmmword ptr [rbp + 0xd0]
14013e9b6: 440f28b5e0000000 movaps xmm14, xmmword ptr [rbp + 0xe0]
14013e9be: 440f28bdf0000000 movaps xmm15, xmmword ptr [rbp + 0xf0]
14013e9c6: 4881c488010000 add rsp, 0x188
14013e9cd: 5b pop rbx
14013e9ce: 5f pop rdi
14013e9cf: 5e pop rsi
14013e9d0: 415c pop r12
14013e9d2: 415d pop r13
14013e9d4: 415e pop r14
14013e9d6: 415f pop r15
14013e9d8: 5d pop rbp
14013e9d9: c3 ret
