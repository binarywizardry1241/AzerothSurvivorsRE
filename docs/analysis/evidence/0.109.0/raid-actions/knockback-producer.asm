145957f34: 8b19 mov ebx, dword ptr [rcx]
145957f36: f3440f104104 movss xmm8, dword ptr [rcx + 4]
145957f3c: f30f10790c movss xmm7, dword ptr [rcx + 0xc]
145957f41: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
145957f47: f30f103501a34800 movss xmm6, dword ptr [rip + 0x48a301]
145957f4f: 4889f1 mov rcx, rsi
145957f52: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145957f59: 0f28d6 movaps xmm2, xmm6
145957f5c: 4531c9 xor r9d, r9d
145957f5f: e8bcf3ffff call 0x145957320
145957f64: 4889f1 mov rcx, rsi
145957f67: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145957f6e: 4889fa mov rdx, rdi
145957f71: 4189d8 mov r8d, ebx
145957f74: 0f28de movaps xmm3, xmm6
145957f77: e874f8ffff call 0x1459577f0
145957f7c: f3440f118564010000 movss dword ptr [rbp + 0x164], xmm8
145957f85: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
145957f8f: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145957f99: 488d8510010000 lea rax, [rbp + 0x110]
145957fa0: 4889442448 mov qword ptr [rsp + 0x48], rax
145957fa5: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145957fac: 895c2438 mov dword ptr [rsp + 0x38], ebx
145957fb0: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145957fb7: c74424306666a63f mov dword ptr [rsp + 0x30], 0x3fa66666
145957fbf: c744242800000000 mov dword ptr [rsp + 0x28], 0
145957fc7: 4c8d8560010000 lea r8, [rbp + 0x160]
145957fce: 4889f1 mov rcx, rsi
145957fd1: 4889fa mov rdx, rdi
145957fd4: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
145957fdb: e800f6ffff call 0x1459575e0
145957fe0: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145957fe7: 4839d0 cmp rax, rdx
145957fea: 0f83ca4b0000 jae 0x14595cbba
145957ff0: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
145957ff7: 4889c1 mov rcx, rax
145957ffa: 48c1e107 shl rcx, 7
145957ffe: c6440a7c01 mov byte ptr [rdx + rcx + 0x7c], 1
145958003: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595800a: 4839d0 cmp rax, rdx
14595800d: 0f83c74c0000 jae 0x14595ccda
145958013: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595801a: f30f117c086c movss dword ptr [rax + rcx + 0x6c], xmm7
145958020: e953f9ffff jmp 0x145957978
