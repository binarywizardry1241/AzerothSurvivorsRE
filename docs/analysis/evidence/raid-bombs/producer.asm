145957d4b: 448b31 mov r14d, dword ptr [rcx]
145957d4e: f3440f104104 movss xmm8, dword ptr [rcx + 4]
145957d54: f30f107908 movss xmm7, dword ptr [rcx + 8]
145957d59: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
145957d5e: f3440f10490c movss xmm9, dword ptr [rcx + 0xc]
145957d64: f3450f59ce mulss xmm9, xmm14
145957d69: 4889f1 mov rcx, rsi
145957d6c: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145957d73: 4889fa mov rdx, rdi
145957d76: 4589f0 mov r8d, r14d
145957d79: 0f28df movaps xmm3, xmm7
145957d7c: e86ffaffff call 0x1459577f0
145957d81: f3440f118564010000 movss dword ptr [rbp + 0x164], xmm8
145957d8a: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
145957d94: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145957d9e: 488d8510010000 lea rax, [rbp + 0x110]
145957da5: 4889442448 mov qword ptr [rsp + 0x48], rax
145957daa: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
145957db1: 4489742438 mov dword ptr [rsp + 0x38], r14d
145957db6: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
145957dbc: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145957dc3: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145957dc9: c744242800000000 mov dword ptr [rsp + 0x28], 0
145957dd1: 4c8da560010000 lea r12, [rbp + 0x160]
145957dd8: 4889f1 mov rcx, rsi
145957ddb: 4889fa mov rdx, rdi
145957dde: 4d89e0 mov r8, r12
145957de1: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
145957de8: e8f3f7ffff call 0x1459575e0
145957ded: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145957df4: 4839d0 cmp rax, rdx
145957df7: 0f83ac4d0000 jae 0x14595cba9
145957dfd: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
145957e04: f30f583d141b8d01 addss xmm7, dword ptr [rip + 0x18d1b14]
145957e0c: 0f57c0 xorps xmm0, xmm0
145957e0f: f30f5ff8 maxss xmm7, xmm0
145957e13: 4889c1 mov rcx, rax
145957e16: 48c1e107 shl rcx, 7
145957e1a: f3440f58ff addss xmm15, xmm7
145957e1f: f3440f117c0a58 movss dword ptr [rdx + rcx + 0x58], xmm15
145957e26: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145957e2d: 4839d0 cmp rax, rdx
145957e30: 0f83934e0000 jae 0x14595ccc9
145957e36: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
145957e3d: f3440f59f6 mulss xmm14, xmm6
145957e42: f3440f11740874 movss dword ptr [rax + rcx + 0x74], xmm14
145957e49: 4c8dbe18060000 lea r15, [rsi + 0x618]
145957e50: 488b8660040000 mov rax, qword ptr [rsi + 0x460]
145957e57: 48898588000000 mov qword ptr [rbp + 0x88], rax
145957e5e: 48898568010000 mov qword ptr [rbp + 0x168], rax
145957e65: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
145957e6f: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
145957e79: 488d85c0000000 lea rax, [rbp + 0xc0]
145957e80: 4889442430 mov qword ptr [rsp + 0x30], rax
145957e85: 4c89642428 mov qword ptr [rsp + 0x28], r12
145957e8a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145957e93: 4c8da510010000 lea r12, [rbp + 0x110]
145957e9a: 4c8d8d88000000 lea r9, [rbp + 0x88]
145957ea1: 4c89e1 mov rcx, r12
145957ea4: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145957eab: 4589f0 mov r8d, r14d
145957eae: e8bd58f7ff call 0x1458cd770
145957eb3: 4c89f9 mov rcx, r15
145957eb6: 4c89e2 mov rdx, r12
145957eb9: e8b2eb83fb call 0x141196a70
145957ebe: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145957ec5: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145957ecc: 4839d1 cmp rcx, rdx
145957ecf: 0f83514e0000 jae 0x14595cd26
145957ed5: 48039e60050000 add rbx, qword ptr [rsi + 0x560]
145957edc: 4889d9 mov rcx, rbx
145957edf: e8bc5afbff call 0x14590d9a0
145957ee4: 4889c6 mov rsi, rax
145957ee7: 4889d7 mov rdi, rdx
145957eea: 488d1d17308d01 lea rbx, [rip + 0x18d3017]
145957ef1: 41be2a000000 mov r14d, 0x2a
145957ef7: ba2a000000 mov edx, 0x2a
145957efc: 4889d9 mov rcx, rbx
145957eff: e8fc45f9ff call 0x1458ec500
145957f04: 4885c0 test rax, rax
145957f07: 480f45d8 cmovne rbx, rax
145957f0b: 490f44d6 cmove rdx, r14
145957f0f: 4889542420 mov qword ptr [rsp + 0x20], rdx
145957f14: 4c8db510010000 lea r14, [rbp + 0x110]
145957f1b: 4c89f1 mov rcx, r14
145957f1e: 4889f2 mov rdx, rsi
145957f21: 4989f8 mov r8, rdi
145957f24: 4989d9 mov r9, rbx
145957f27: e83493f6ff call 0x1458c1260
145957f2c: 4c89f9 mov rcx, r15
145957f2f: e941440000 jmp 0x14595c375
