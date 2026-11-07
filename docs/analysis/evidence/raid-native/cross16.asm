14595a082: 448b31 mov r14d, dword ptr [rcx]
14595a085: f20f107904 movsd xmm7, qword ptr [rcx + 4]
14595a08a: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14595a08f: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
14595a095: 4889f1 mov rcx, rsi
14595a098: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595a09f: 0f28d6 movaps xmm2, xmm6
14595a0a2: 4531c9 xor r9d, r9d
14595a0a5: e876d2ffff call 0x145957320
14595a0aa: 4889f1 mov rcx, rsi
14595a0ad: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a0b4: 4589f0 mov r8d, r14d
14595a0b7: 0f28de movaps xmm3, xmm6
14595a0ba: e831d7ffff call 0x1459577f0
14595a0bf: 488d9e88050000 lea rbx, [rsi + 0x588]
14595a0c6: 450f57c0 xorps xmm8, xmm8
14595a0ca: f3440f588578010000 addss xmm8, dword ptr [rbp + 0x178]
14595a0d3: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595a0d9: ffc7 inc edi
14595a0db: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595a0e1: f3440f108e340a0000 movss xmm9, dword ptr [rsi + 0xa34]
14595a0ea: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595a0f1: 4883c110 add rcx, 0x10
14595a0f5: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595a0fc: 450f28e2 movaps xmm12, xmm10
14595a100: 410f28d2 movaps xmm2, xmm10
14595a104: e8779cf7ff call 0x1458d3d80
14595a109: 440f28d0 movaps xmm10, xmm0
14595a10d: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595a114: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595a11b: 7508 jne 0x14595a125
14595a11d: 4889d9 mov rcx, rbx
14595a120: e80b0c2a00 call 0x145bfad30
14595a125: 0f28c6 movaps xmm0, xmm6
14595a128: f3410f58c1 addss xmm0, xmm9
14595a12d: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595a134: 4c89f9 mov rcx, r15
14595a137: 48c1e107 shl rcx, 7
14595a13b: 48c7040800000000 mov qword ptr [rax + rcx], 0
14595a143: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
14595a14b: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a152: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14595a157: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14595a160: c744083002000000 mov dword ptr [rax + rcx + 0x30], 2
14595a168: 0f137c0834 movlps qword ptr [rax + rcx + 0x34], xmm7
14595a16d: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
14595a171: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595a178: 0f134c0840 movlps qword ptr [rax + rcx + 0x40], xmm1
14595a17d: f3440f11540848 movss dword ptr [rax + rcx + 0x48], xmm10
14595a184: f3440f1144084c movss dword ptr [rax + rcx + 0x4c], xmm8
14595a18b: f3440f114c0850 movss dword ptr [rax + rcx + 0x50], xmm9
14595a192: f30f11440854 movss dword ptr [rax + rcx + 0x54], xmm0
14595a198: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
14595a1a0: 448974085c mov dword ptr [rax + rcx + 0x5c], r14d
14595a1a5: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
14595a1ac: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
14595a1b4: 498d7f01 lea rdi, [r15 + 1]
14595a1b8: 450f57c0 xorps xmm8, xmm8
14595a1bc: 440f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm8
14595a1c2: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14595a1cb: 4889be98050000 mov qword ptr [rsi + 0x598], rdi
14595a1d2: f3440f100ddd804800 movss xmm9, dword ptr [rip + 0x4880dd]
14595a1db: f3440f588d78010000 addss xmm9, dword ptr [rbp + 0x178]
14595a1e4: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595a1eb: 41ffc6 inc r14d
14595a1ee: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
14595a1f5: f3440f109e340a0000 movss xmm11, dword ptr [rsi + 0xa34]
14595a1fe: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595a205: 4883c110 add rcx, 0x10
14595a209: 410f28d4 movaps xmm2, xmm12
14595a20d: e86e9bf7ff call 0x1458d3d80
14595a212: 440f28d0 movaps xmm10, xmm0
14595a216: 483bbe88050000 cmp rdi, qword ptr [rsi + 0x588]
14595a21d: 7508 jne 0x14595a227
14595a21f: 4889d9 mov rcx, rbx
14595a222: e8090b2a00 call 0x145bfad30
14595a227: 0f28c6 movaps xmm0, xmm6
14595a22a: f3410f58c3 addss xmm0, xmm11
14595a22f: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595a236: 48c1e707 shl rdi, 7
14595a23a: 48c7043800000000 mov qword ptr [rax + rdi], 0
14595a242: c744381000000000 mov dword ptr [rax + rdi + 0x10], 0
14595a24a: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14595a251: 48894c3820 mov qword ptr [rax + rdi + 0x20], rcx
14595a256: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
14595a25f: c744383002000000 mov dword ptr [rax + rdi + 0x30], 2
14595a267: 0f137c3834 movlps qword ptr [rax + rdi + 0x34], xmm7
14595a26c: 448974383c mov dword ptr [rax + rdi + 0x3c], r14d
14595a271: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595a278: 0f134c3840 movlps qword ptr [rax + rdi + 0x40], xmm1
14595a27d: f3440f11543848 movss dword ptr [rax + rdi + 0x48], xmm10
14595a284: f3440f114c384c movss dword ptr [rax + rdi + 0x4c], xmm9
14595a28b: f3440f115c3850 movss dword ptr [rax + rdi + 0x50], xmm11
14595a292: f30f11443854 movss dword ptr [rax + rdi + 0x54], xmm0
14595a298: 48c744385800000000 mov qword ptr [rax + rdi + 0x58], 0
14595a2a1: f3440f11743860 movss dword ptr [rax + rdi + 0x60], xmm14
14595a2a8: c74438640000807f mov dword ptr [rax + rdi + 0x64], 0x7f800000
14595a2b0: 4d8d7702 lea r14, [r15 + 2]
14595a2b4: 440f11443868 movups xmmword ptr [rax + rdi + 0x68], xmm8
14595a2ba: 48c744387700000000 mov qword ptr [rax + rdi + 0x77], 0
14595a2c3: 4c89b698050000 mov qword ptr [rsi + 0x598], r14
14595a2ca: f3440f1005cd804800 movss xmm8, dword ptr [rip + 0x4880cd]
14595a2d3: f3440f588578010000 addss xmm8, dword ptr [rbp + 0x178]
14595a2dc: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595a2e2: ffc7 inc edi
14595a2e4: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595a2ea: f3440f108e340a0000 movss xmm9, dword ptr [rsi + 0xa34]
14595a2f3: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595a2fa: 4883c110 add rcx, 0x10
14595a2fe: 410f28d4 movaps xmm2, xmm12
14595a302: e8799af7ff call 0x1458d3d80
14595a307: 440f28d0 movaps xmm10, xmm0
14595a30b: 4c3bb688050000 cmp r14, qword ptr [rsi + 0x588]
14595a312: 7508 jne 0x14595a31c
14595a314: 4889d9 mov rcx, rbx
14595a317: e8140a2a00 call 0x145bfad30
14595a31c: 0f28c6 movaps xmm0, xmm6
14595a31f: f3410f58c1 addss xmm0, xmm9
14595a324: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595a32b: 49c1e607 shl r14, 7
14595a32f: 4ac7043000000000 mov qword ptr [rax + r14], 0
14595a337: 42c744301000000000 mov dword ptr [rax + r14 + 0x10], 0
14595a340: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14595a347: 4a894c3020 mov qword ptr [rax + r14 + 0x20], rcx
14595a34c: 4ac744302800000000 mov qword ptr [rax + r14 + 0x28], 0
14595a355: 42c744303002000000 mov dword ptr [rax + r14 + 0x30], 2
14595a35e: 420f137c3034 movlps qword ptr [rax + r14 + 0x34], xmm7
14595a364: 42897c303c mov dword ptr [rax + r14 + 0x3c], edi
14595a369: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595a370: 420f134c3040 movlps qword ptr [rax + r14 + 0x40], xmm1
14595a376: f3460f11543048 movss dword ptr [rax + r14 + 0x48], xmm10
14595a37d: f3460f1144304c movss dword ptr [rax + r14 + 0x4c], xmm8
14595a384: f3460f114c3050 movss dword ptr [rax + r14 + 0x50], xmm9
14595a38b: f3420f11443054 movss dword ptr [rax + r14 + 0x54], xmm0
14595a392: 4ac744305800000000 mov qword ptr [rax + r14 + 0x58], 0
14595a39b: f3460f11743060 movss dword ptr [rax + r14 + 0x60], xmm14
14595a3a2: 42c74430640000807f mov dword ptr [rax + r14 + 0x64], 0x7f800000
14595a3ab: 498d7f03 lea rdi, [r15 + 3]
14595a3af: 450f57c9 xorps xmm9, xmm9
14595a3b3: 460f114c3068 movups xmmword ptr [rax + r14 + 0x68], xmm9
14595a3b9: 4ac744307700000000 mov qword ptr [rax + r14 + 0x77], 0
14595a3c2: 4889be98050000 mov qword ptr [rsi + 0x598], rdi
14595a3c9: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595a3d1: f30f5805a7f58c01 addss xmm0, dword ptr [rip + 0x18cf5a7]
14595a3d9: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
14595a3e1: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595a3e8: 41ffc6 inc r14d
14595a3eb: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
14595a3f2: f3440f1096340a0000 movss xmm10, dword ptr [rsi + 0xa34]
14595a3fb: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595a402: 4883c110 add rcx, 0x10
14595a406: 410f28d4 movaps xmm2, xmm12
14595a40a: e87199f7ff call 0x1458d3d80
14595a40f: 440f28c0 movaps xmm8, xmm0
14595a413: 483bbe88050000 cmp rdi, qword ptr [rsi + 0x588]
14595a41a: 7508 jne 0x14595a424
14595a41c: 4889d9 mov rcx, rbx
14595a41f: e80c092a00 call 0x145bfad30
14595a424: f3410f58f2 addss xmm6, xmm10
14595a429: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595a430: 48c1e707 shl rdi, 7
14595a434: 48c7043800000000 mov qword ptr [rax + rdi], 0
14595a43c: c744381000000000 mov dword ptr [rax + rdi + 0x10], 0
14595a444: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14595a44b: 48894c3820 mov qword ptr [rax + rdi + 0x20], rcx
14595a450: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
14595a459: c744383002000000 mov dword ptr [rax + rdi + 0x30], 2
14595a461: 0f137c3834 movlps qword ptr [rax + rdi + 0x34], xmm7
14595a466: 448974383c mov dword ptr [rax + rdi + 0x3c], r14d
14595a46b: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
14595a472: 0f13443840 movlps qword ptr [rax + rdi + 0x40], xmm0
14595a477: f3440f11443848 movss dword ptr [rax + rdi + 0x48], xmm8
14595a47e: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595a486: f30f1144384c movss dword ptr [rax + rdi + 0x4c], xmm0
14595a48c: f3440f11543850 movss dword ptr [rax + rdi + 0x50], xmm10
14595a493: f30f11743854 movss dword ptr [rax + rdi + 0x54], xmm6
14595a499: 48c744385800000000 mov qword ptr [rax + rdi + 0x58], 0
14595a4a2: f3440f11743860 movss dword ptr [rax + rdi + 0x60], xmm14
14595a4a9: c74438640000807f mov dword ptr [rax + rdi + 0x64], 0x7f800000
14595a4b1: 4983c704 add r15, 4
14595a4b5: 440f114c3868 movups xmmword ptr [rax + rdi + 0x68], xmm9
14595a4bb: 48c744387700000000 mov qword ptr [rax + rdi + 0x77], 0
14595a4c4: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
14595a4cb: e9a8d4ffff jmp 0x145957978
