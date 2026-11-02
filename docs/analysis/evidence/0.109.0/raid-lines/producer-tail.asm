14595bf44: 450f28e2 movaps xmm12, xmm10
14595bf48: 8b85c8000000 mov eax, dword ptr [rbp + 0xc8]
14595bf4e: 898580000000 mov dword ptr [rbp + 0x80], eax
14595bf54: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
14595bf5b: 48894578 mov qword ptr [rbp + 0x78], rax
14595bf5f: 4883c210 add rdx, 0x10
14595bf63: f20f107578 movsd xmm6, qword ptr [rbp + 0x78]
14595bf68: f30f16d6 movshdup xmm2, xmm6
14595bf6c: 4889d1 mov rcx, rdx
14595bf6f: 0f28ce movaps xmm1, xmm6
14595bf72: e819b0f7ff call 0x1458d6f90
14595bf77: 4c8b8e68050000 mov r9, qword ptr [rsi + 0x568]
14595bf7e: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595bf85: 4c39ca cmp rdx, r9
14595bf88: 0f83cd0c0000 jae 0x14595cc5b
14595bf8e: 440f28d0 movaps xmm10, xmm0
14595bf92: a801 test al, 1
14595bf94: 7509 jne 0x14595bf9f
14595bf96: f3440f109580000000 movss xmm10, dword ptr [rbp + 0x80]
14595bf9f: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
14595bfa6: 440f288d50010000 movaps xmm9, xmmword ptr [rbp + 0x150]
14595bfae: 410f28c1 movaps xmm0, xmm9
14595bfb2: 0f5cc6 subps xmm0, xmm6
14595bfb5: 0f59c0 mulps xmm0, xmm0
14595bfb8: f30f16c8 movshdup xmm1, xmm0
14595bfbc: f30f58c8 addss xmm1, xmm0
14595bfc0: 0f57ff xorps xmm7, xmm7
14595bfc3: f30f51f9 sqrtss xmm7, xmm1
14595bfc7: f30f1005f9144400 movss xmm0, dword ptr [rip + 0x4414f9]
14595bfcf: f30f5ff8 maxss xmm7, xmm0
14595bfd3: f30f108c1870010000 movss xmm1, dword ptr [rax + rbx + 0x170]
14595bfdc: f30f590d748e4700 mulss xmm1, dword ptr [rip + 0x478e74]
14595bfe4: f30f5fc1 maxss xmm0, xmm1
14595bfe8: f3440f1005ef4e4700 movss xmm8, dword ptr [rip + 0x474eef]
14595bff1: f3440f5dc0 minss xmm8, xmm0
14595bff6: 0f28d7 movaps xmm2, xmm7
14595bff9: f30f5e1513174400 divss xmm2, dword ptr [rip + 0x441713]
14595c001: f3440f101d96124400 movss xmm11, dword ptr [rip + 0x441296]
14595c00a: f3410f58d3 addss xmm2, xmm11
14595c00f: f3440f10ad78010000 movss xmm13, dword ptr [rbp + 0x178]
14595c018: f3440f116c2420 movss dword ptr [rsp + 0x20], xmm13
14595c01f: 4889f1 mov rcx, rsi
14595c022: 41b901000000 mov r9d, 1
14595c028: e8f3b2ffff call 0x145957320
14595c02d: 4889f1 mov rcx, rsi
14595c030: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595c037: 4889fa mov rdx, rdi
14595c03a: 4589f8 mov r8d, r15d
14595c03d: 410f28db movaps xmm3, xmm11
14595c041: e8aab7ffff call 0x1459577f0
14595c046: f30f11bd64010000 movss dword ptr [rbp + 0x164], xmm7
14595c04e: f3440f118568010000 movss dword ptr [rbp + 0x168], xmm8
14595c057: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
14595c061: f3450f58f6 addss xmm14, xmm14
14595c066: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14595c070: 488d8510010000 lea rax, [rbp + 0x110]
14595c077: 4889442448 mov qword ptr [rsp + 0x48], rax
14595c07c: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595c083: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
14595c08a: f3440f11642420 movss dword ptr [rsp + 0x20], xmm12
14595c091: c744243800000000 mov dword ptr [rsp + 0x38], 0
14595c099: c74424300000803f mov dword ptr [rsp + 0x30], 0x3f800000
14595c0a1: 4c8d8560010000 lea r8, [rbp + 0x160]
14595c0a8: 4889f1 mov rcx, rsi
14595c0ab: 4889fa mov rdx, rdi
14595c0ae: 410f28d9 movaps xmm3, xmm9
14595c0b2: e829b5ffff call 0x1459575e0
14595c0b7: 0f13b510010000 movlps qword ptr [rbp + 0x110], xmm6
14595c0be: f3440f119518010000 movss dword ptr [rbp + 0x118], xmm10
14595c0c7: c6853d01000023 mov byte ptr [rbp + 0x13d], 0x23
14595c0ce: 4c8d8d10010000 lea r9, [rbp + 0x110]
14595c0d5: 4889f1 mov rcx, rsi
14595c0d8: 410f28cb movaps xmm1, xmm11
14595c0dc: 4989f8 mov r8, rdi
14595c0df: e87cb1ffff call 0x145957260
14595c0e4: e98fb8ffff jmp 0x145957978
