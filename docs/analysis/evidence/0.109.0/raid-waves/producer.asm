145958e3a: 448b31 mov r14d, dword ptr [rcx]
145958e3d: 448b6104 mov r12d, dword ptr [rcx + 4]
145958e41: f3440f105908 movss xmm11, dword ptr [rcx + 8]
145958e47: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145958e4c: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
145958e51: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
145958e57: 4889f1 mov rcx, rsi
145958e5a: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145958e61: 0f28d6 movaps xmm2, xmm6
145958e64: 4531c9 xor r9d, r9d
145958e67: e8b4e4ffff call 0x145957320
145958e6c: 4889f1 mov rcx, rsi
145958e6f: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145958e76: 4589f0 mov r8d, r14d
145958e79: 0f28de movaps xmm3, xmm6
145958e7c: e86fe9ffff call 0x1459577f0
145958e81: 488d9e88050000 lea rbx, [rsi + 0x588]
145958e88: 410f28d2 movaps xmm2, xmm10
145958e8c: 450f57d2 xorps xmm10, xmm10
145958e90: f3440f59d7 mulss xmm10, xmm7
145958e95: f3440f58d6 addss xmm10, xmm6
145958e9a: 448bbe380a0000 mov r15d, dword ptr [rsi + 0xa38]
145958ea1: 41ffc7 inc r15d
145958ea4: 4489be380a0000 mov dword ptr [rsi + 0xa38], r15d
145958eab: f3440f10a6340a0000 movss xmm12, dword ptr [rsi + 0xa34]
145958eb4: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
145958ebb: 4883c110 add rcx, 0x10
145958ebf: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145958ec6: 440f28fa movaps xmm15, xmm2
145958eca: e8b1aef7ff call 0x1458d3d80
145958ecf: 440f28c8 movaps xmm9, xmm0
145958ed3: 488bbe98050000 mov rdi, qword ptr [rsi + 0x598]
145958eda: 483bbe88050000 cmp rdi, qword ptr [rsi + 0x588]
145958ee1: 7508 jne 0x145958eeb
145958ee3: 4889d9 mov rcx, rbx
145958ee6: e8451e2a00 call 0x145bfad30
145958eeb: f3450f58d4 addss xmm10, xmm12
145958ef0: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
145958ef7: 4889f9 mov rcx, rdi
145958efa: 48c1e107 shl rcx, 7
145958efe: 48c7040800000000 mov qword ptr [rax + rcx], 0
145958f06: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145958f0e: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145958f15: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145958f1a: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145958f23: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
145958f2b: f3440f115c0834 movss dword ptr [rax + rcx + 0x34], xmm11
145958f32: 44897c083c mov dword ptr [rax + rcx + 0x3c], r15d
145958f37: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
145958f3e: 0f13440840 movlps qword ptr [rax + rcx + 0x40], xmm0
145958f43: f3440f114c0848 movss dword ptr [rax + rcx + 0x48], xmm9
145958f4a: 450f57c0 xorps xmm8, xmm8
145958f4e: 0f57c0 xorps xmm0, xmm0
145958f51: f3410f10c4 movss xmm0, xmm12
145958f56: 0f57c9 xorps xmm1, xmm1
145958f59: f3410f10ca movss xmm1, xmm10
145958f5e: 0fc6c141 shufps xmm0, xmm1, 0x41
145958f62: 0f1144084c movups xmmword ptr [rax + rcx + 0x4c], xmm0
145958f67: 448974085c mov dword ptr [rax + rcx + 0x5c], r14d
145958f6c: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
145958f73: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145958f7b: 48ffc7 inc rdi
145958f7e: 440f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm8
145958f84: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145958f8d: 4889be98050000 mov qword ptr [rsi + 0x598], rdi
145958f94: 4183fc02 cmp r12d, 2
145958f98: 0f82dae9ffff jb 0x145957978
145958f9e: 450f28ee movaps xmm13, xmm14
145958fa2: 440f28d7 movaps xmm10, xmm7
145958fa6: f3440f58d7 addss xmm10, xmm7
145958fab: f3440f5d15cc3e4700 minss xmm10, dword ptr [rip + 0x473ecc]
145958fb4: f3450f12db movsldup xmm11, xmm11
145958fb9: 41bd01000000 mov r13d, 1
145958fbf: 4c8db510010000 lea r14, [rbp + 0x110]
145958fc6: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
145958fcc: ffc7 inc edi
145958fce: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
145958fd4: f3440f10a6340a0000 movss xmm12, dword ptr [rsi + 0xa34]
145958fdd: 4c8bbe98090000 mov r15, qword ptr [rsi + 0x998]
145958fe4: 498d4f10 lea rcx, [r15 + 0x10]
145958fe8: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145958fef: 410f28d7 movaps xmm2, xmm15
145958ff3: e898dff7ff call 0x1458d6f90
145958ff8: a801 test al, 1
145958ffa: 7406 je 0x145959002
145958ffc: 440f28c8 movaps xmm9, xmm0
145959000: eb3b jmp 0x14595903d
145959002: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145959007: 742b je 0x145959034
145959009: 498d5768 lea rdx, [r15 + 0x68]
14595900d: 4c89f1 mov rcx, r14
145959010: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
145959017: 410f28df movaps xmm3, xmm15
14595901b: e86031f8ff call 0x1458dc180
145959020: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145959027: 750b jne 0x145959034
145959029: f3440f108d1c010000 movss xmm9, dword ptr [rbp + 0x11c]
145959032: eb09 jmp 0x14595903d
145959034: f3450f108fb8000000 movss xmm9, dword ptr [r15 + 0xb8]
14595903d: 450f28f5 movaps xmm14, xmm13
145959041: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
145959048: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595904f: 7508 jne 0x145959059
145959051: 4889d9 mov rcx, rbx
145959054: e8d71c2a00 call 0x145bfad30
145959059: 418d4501 lea eax, [r13 + 1]
14595905d: 0f57c0 xorps xmm0, xmm0
145959060: f3480f2ac0 cvtsi2ss xmm0, rax
145959065: 4489e9 mov ecx, r13d
145959068: 0f57c9 xorps xmm1, xmm1
14595906b: f3480f2ac9 cvtsi2ss xmm1, rcx
145959070: 0f28d7 movaps xmm2, xmm7
145959073: f30f59d1 mulss xmm2, xmm1
145959077: 0f14c8 unpcklps xmm1, xmm0
14595907a: 410f59cb mulps xmm1, xmm11
14595907e: f30f58d6 addss xmm2, xmm6
145959082: f3410f58d4 addss xmm2, xmm12
145959087: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
14595908e: 4c89f9 mov rcx, r15
145959091: 48c1e107 shl rcx, 7
145959095: 48c7040a00000000 mov qword ptr [rdx + rcx], 0
14595909d: c7440a1000000000 mov dword ptr [rdx + rcx + 0x10], 0
1459590a5: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
1459590ac: 4c89440a20 mov qword ptr [rdx + rcx + 0x20], r8
1459590b1: 48c7440a2800000000 mov qword ptr [rdx + rcx + 0x28], 0
1459590ba: c7440a3001000000 mov dword ptr [rdx + rcx + 0x30], 1
1459590c2: 0f134c0a34 movlps qword ptr [rdx + rcx + 0x34], xmm1
1459590c7: 897c0a3c mov dword ptr [rdx + rcx + 0x3c], edi
1459590cb: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
1459590d2: 0f13440a40 movlps qword ptr [rdx + rcx + 0x40], xmm0
1459590d7: f3440f114c0a48 movss dword ptr [rdx + rcx + 0x48], xmm9
1459590de: 0f57c0 xorps xmm0, xmm0
1459590e1: f3410f10c4 movss xmm0, xmm12
1459590e6: 0f57c9 xorps xmm1, xmm1
1459590e9: f30f10ca movss xmm1, xmm2
1459590ed: 0fc6c141 shufps xmm0, xmm1, 0x41
1459590f1: 0f11440a4c movups xmmword ptr [rdx + rcx + 0x4c], xmm0
1459590f6: c7440a5c00000000 mov dword ptr [rdx + rcx + 0x5c], 0
1459590fe: f3440f11740a60 movss dword ptr [rdx + rcx + 0x60], xmm14
145959105: c7440a640000807f mov dword ptr [rdx + rcx + 0x64], 0x7f800000
14595910d: 49ffc7 inc r15
145959110: 440f11440a68 movups xmmword ptr [rdx + rcx + 0x68], xmm8
145959116: 48c7440a7700000000 mov qword ptr [rdx + rcx + 0x77], 0
14595911f: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
145959126: 0f84173a0000 je 0x14595cb43
14595912c: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
145959133: f3440f11540a64 movss dword ptr [rdx + rcx + 0x64], xmm10
14595913a: 4189c5 mov r13d, eax
14595913d: 4139c4 cmp r12d, eax
145959140: 0f8580feffff jne 0x145958fc6
145959146: e92de8ffff jmp 0x145957978
