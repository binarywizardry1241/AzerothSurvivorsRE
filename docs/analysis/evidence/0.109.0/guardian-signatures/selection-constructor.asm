14593e120: 488bb5e0030000 mov rsi, qword ptr [rbp + 0x3e0]
14593e127: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
14593e12a: 660f1f440000 nop word ptr [rax + rax]
14593e130: 4f8d2c01 lea r13, [r9 + r8]
14593e134: 49c1c517 rol r13, 0x17
14593e138: 4d01cd add r13, r9
14593e13b: 4989d3 mov r11, rdx
14593e13e: 49c1e311 shl r11, 0x11
14593e142: 4c31c8 xor rax, r9
14593e145: 4931d0 xor r8, rdx
14593e148: 4831c2 xor rdx, rax
14593e14b: 4d31c1 xor r9, r8
14593e14e: 4c31d8 xor rax, r11
14593e151: 49c1c02d rol r8, 0x2d
14593e155: 490fbae539 bt r13, 0x39
14593e15a: 72d4 jb 0x14593e130
14593e15c: f3440f11adc8030000 movss dword ptr [rbp + 0x3c8], xmm13
14593e165: f3450f59eb mulss xmm13, xmm11
14593e16a: 450f28f7 movaps xmm14, xmm15
14593e16e: f3440f5935e16c4900 mulss xmm14, dword ptr [rip + 0x496ce1]
14593e177: f3440f5835e8b58e01 addss xmm14, dword ptr [rip + 0x18eb5e8]
14593e180: 450fb7d2 movzx r10d, r10w
14593e184: f3410f2af2 cvtsi2ss xmm6, r10d
14593e189: f30f5e353ff14500 divss xmm6, dword ptr [rip + 0x45f13f]
14593e191: 4c8b95e8030000 mov r10, qword ptr [rbp + 0x3e8]
14593e198: 4d898aa0090000 mov qword ptr [r10 + 0x9a0], r9
14593e19f: 4d8982b8090000 mov qword ptr [r10 + 0x9b8], r8
14593e1a6: 498992a8090000 mov qword ptr [r10 + 0x9a8], rdx
14593e1ad: 498982b0090000 mov qword ptr [r10 + 0x9b0], rax
14593e1b4: e867f0f4ff call 0x14588d220
14593e1b9: 4885c0 test rax, rax
14593e1bc: 7470 je 0x14593e22e
14593e1be: 4c8b4818 mov r9, qword ptr [rax + 0x18]
14593e1c2: 4d85c9 test r9, r9
14593e1c5: 7441 je 0x14593e208
14593e1c7: 4c89c9 mov rcx, r9
14593e1ca: 48ffc1 inc rcx
14593e1cd: 0f84ca110000 je 0x14593f39d
14593e1d3: 49c1ed3a shr r13, 0x3a
14593e1d7: 4939cd cmp r13, rcx
14593e1da: 7210 jb 0x14593e1ec
14593e1dc: 4989c0 mov r8, rax
14593e1df: 4489e8 mov eax, r13d
14593e1e2: 31d2 xor edx, edx
14593e1e4: f7f1 div ecx
14593e1e6: 4c89c0 mov rax, r8
14593e1e9: 4189d5 mov r13d, edx
14593e1ec: 4d85ed test r13, r13
14593e1ef: 7417 je 0x14593e208
14593e1f1: 49ffcd dec r13
14593e1f4: 4d39cd cmp r13, r9
14593e1f7: 0f83e4110000 jae 0x14593f3e1
14593e1fd: 49c1e504 shl r13, 4
14593e201: 4c036810 add r13, qword ptr [rax + 0x10]
14593e205: 4c89e8 mov rax, r13
14593e208: 4c8b28 mov r13, qword ptr [rax]
14593e20b: 4c8b7008 mov r14, qword ptr [rax + 8]
14593e20f: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
14593e212: e809f0f4ff call 0x14588d220
14593e217: 4889c2 mov rdx, rax
14593e21a: 4d85f6 test r14, r14
14593e21d: 0f8494000000 je 0x14593e2b7
14593e223: 48899588030000 mov qword ptr [rbp + 0x388], rdx
14593e22a: 89fe mov esi, edi
14593e22c: eb21 jmp 0x14593e24f
14593e22e: 4889f0 mov rax, rsi
14593e231: 89fe mov esi, edi
14593e233: 8b4820 mov ecx, dword ptr [rax + 0x20]
14593e236: e8e5eff4ff call 0x14588d220
14593e23b: 48898588030000 mov qword ptr [rbp + 0x388], rax
14593e242: 41be03000000 mov r14d, 3
14593e248: 4c8d2dc99d2a01 lea r13, [rip + 0x12a9dc9]
14593e24f: 4a8d3cb500000000 lea rdi, [r14*4]
14593e257: e8a43f6cfa call 0x140002200
14593e25c: ba04000000 mov edx, 4
14593e261: 4889f9 mov rcx, rdi
14593e264: e8573f6cfa call 0x1400021c0
14593e269: 4885c0 test rax, rax
14593e26c: 0f8479100000 je 0x14593f2eb
14593e272: 4983fe08 cmp r14, 8
14593e276: 660f6ea5d0030000 movd xmm4, dword ptr [rbp + 0x3d0]
14593e27e: 660f6eada0030000 movd xmm5, dword ptr [rbp + 0x3a0]
14593e286: 7309 jae 0x14593e291
14593e288: 31c9 xor ecx, ecx
14593e28a: 89f7 mov edi, esi
14593e28c: e9cb000000 jmp 0x14593e35c
14593e291: 498d5530 lea rdx, [r13 + 0x30]
14593e295: 496bce38 imul rcx, r14, 0x38
14593e299: 4c01e9 add rcx, r13
14593e29c: 4883c1fc add rcx, -4
14593e2a0: 4839c8 cmp rax, rcx
14593e2a3: 89f7 mov edi, esi
14593e2a5: 732d jae 0x14593e2d4
14593e2a7: 4a8d0cb0 lea rcx, [rax + r14*4]
14593e2ab: 4839ca cmp rdx, rcx
14593e2ae: 7324 jae 0x14593e2d4
14593e2b0: 31c9 xor ecx, ecx
14593e2b2: e9a5000000 jmp 0x14593e35c
14593e2b7: b804000000 mov eax, 4
14593e2bc: 4531f6 xor r14d, r14d
14593e2bf: 660f6ea5d0030000 movd xmm4, dword ptr [rbp + 0x3d0]
14593e2c7: 660f6eada0030000 movd xmm5, dword ptr [rbp + 0x3a0]
14593e2cf: e954010000 jmp 0x14593e428
14593e2d4: 4c89f1 mov rcx, r14
14593e2d7: 4883e1f8 and rcx, 0xfffffffffffffff8
14593e2db: 4531c0 xor r8d, r8d
14593e2de: 6690 nop
14593e2e0: f30f1002 movss xmm0, dword ptr [rdx]
14593e2e4: f30f104a38 movss xmm1, dword ptr [rdx + 0x38]
14593e2e9: 0f14c1 unpcklps xmm0, xmm1
14593e2ec: f30f104a70 movss xmm1, dword ptr [rdx + 0x70]
14593e2f1: f30f1092a8000000 movss xmm2, dword ptr [rdx + 0xa8]
14593e2f9: 0f14ca unpcklps xmm1, xmm2
14593e2fc: 0f16c1 movlhps xmm0, xmm1
14593e2ff: f30f108a88010000 movss xmm1, dword ptr [rdx + 0x188]
14593e307: f30f109250010000 movss xmm2, dword ptr [rdx + 0x150]
14593e30f: 0f14d1 unpcklps xmm2, xmm1
14593e312: f30f108a18010000 movss xmm1, dword ptr [rdx + 0x118]
14593e31a: f30f109ae0000000 movss xmm3, dword ptr [rdx + 0xe0]
14593e322: 0f14d9 unpcklps xmm3, xmm1
14593e325: 0f16da movlhps xmm3, xmm2
14593e328: 410f59c0 mulps xmm0, xmm8
14593e32c: 410f59d8 mulps xmm3, xmm8
14593e330: 420f110480 movups xmmword ptr [rax + r8*4], xmm0
14593e335: 420f115c8010 movups xmmword ptr [rax + r8*4 + 0x10], xmm3
14593e33b: 4983c008 add r8, 8
14593e33f: 4881c2c0010000 add rdx, 0x1c0
14593e346: 4c39c1 cmp rcx, r8
14593e349: 7595 jne 0x14593e2e0
14593e34b: 4939ce cmp r14, rcx
14593e34e: 750c jne 0x14593e35c
14593e350: 488bb5e0030000 mov rsi, qword ptr [rbp + 0x3e0]
14593e357: e9c5000000 jmp 0x14593e421
14593e35c: 4d89f0 mov r8, r14
14593e35f: 4889ca mov rdx, rcx
14593e362: 4983e003 and r8, 3
14593e366: 7444 je 0x14593e3ac
14593e368: 486bd138 imul rdx, rcx, 0x38
14593e36c: 4e8d0c2a lea r9, [rdx + r13]
14593e370: 4983c130 add r9, 0x30
14593e374: 4b8d1400 lea rdx, [r8 + r8]
14593e378: 41c1e004 shl r8d, 4
14593e37c: 4929d0 sub r8, rdx
14593e37f: 4531d2 xor r10d, r10d
14593e382: 4889ca mov rdx, rcx
14593e385: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593e390: f3430f100491 movss xmm0, dword ptr [r9 + r10*4]
14593e396: f3410f59c3 mulss xmm0, xmm11
14593e39b: f30f110490 movss dword ptr [rax + rdx*4], xmm0
14593e3a0: 48ffc2 inc rdx
14593e3a3: 4983c20e add r10, 0xe
14593e3a7: 4d39d0 cmp r8, r10
14593e3aa: 75e4 jne 0x14593e390
14593e3ac: 4c29f1 sub rcx, r14
14593e3af: 4883f9fc cmp rcx, -4
14593e3b3: 488bb5e0030000 mov rsi, qword ptr [rbp + 0x3e0]
14593e3ba: 7765 ja 0x14593e421
14593e3bc: 486bca38 imul rcx, rdx, 0x38
14593e3c0: 4c01e9 add rcx, r13
14593e3c3: 4881c1d8000000 add rcx, 0xd8
14593e3ca: 660f1f440000 nop word ptr [rax + rax]
14593e3d0: f30f108158ffffff movss xmm0, dword ptr [rcx - 0xa8]
14593e3d8: f3410f59c3 mulss xmm0, xmm11
14593e3dd: f30f110490 movss dword ptr [rax + rdx*4], xmm0
14593e3e2: f30f104190 movss xmm0, dword ptr [rcx - 0x70]
14593e3e7: f3410f59c3 mulss xmm0, xmm11
14593e3ec: f30f11449004 movss dword ptr [rax + rdx*4 + 4], xmm0
14593e3f2: f30f1041c8 movss xmm0, dword ptr [rcx - 0x38]
14593e3f7: f3410f59c3 mulss xmm0, xmm11
14593e3fc: f30f11449008 movss dword ptr [rax + rdx*4 + 8], xmm0
14593e402: f30f1001 movss xmm0, dword ptr [rcx]
14593e406: f3410f59c3 mulss xmm0, xmm11
14593e40b: f30f1144900c movss dword ptr [rax + rdx*4 + 0xc], xmm0
14593e411: 4883c204 add rdx, 4
14593e415: 4881c1e0000000 add rcx, 0xe0
14593e41c: 4939d6 cmp r14, rdx
14593e41f: 75af jne 0x14593e3d0
14593e421: 488b9588030000 mov rdx, qword ptr [rbp + 0x388]
14593e428: f30f59fe mulss xmm7, xmm6
14593e42c: 0f57c0 xorps xmm0, xmm0
14593e42f: f3440f58e0 addss xmm12, xmm0
14593e434: 488d8d10010000 lea rcx, [rbp + 0x110]
14593e43b: c6410800 mov byte ptr [rcx + 8], 0
14593e43f: 48c70100000000 mov qword ptr [rcx], 0
14593e446: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
14593e44e: 48c7457808000000 mov qword ptr [rbp + 0x78], 8
14593e456: 48c7858000000000000000 mov qword ptr [rbp + 0x80], 0
14593e461: 48c78588000000ffffffff mov qword ptr [rbp + 0x88], 0xffffffffffffffff
14593e46c: 4c89b5c8000000 mov qword ptr [rbp + 0xc8], r14
14593e473: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
14593e47a: 4c89b5d8000000 mov qword ptr [rbp + 0xd8], r14
14593e481: 4c89ade0000000 mov qword ptr [rbp + 0xe0], r13
14593e488: 4c89b5e8000000 mov qword ptr [rbp + 0xe8], r14
14593e48f: 4c89adf0000000 mov qword ptr [rbp + 0xf0], r13
14593e496: 4c89b5f8000000 mov qword ptr [rbp + 0xf8], r14
14593e49d: 48899d00010000 mov qword ptr [rbp + 0x100], rbx
14593e4a4: 48899508010000 mov qword ptr [rbp + 0x108], rdx
