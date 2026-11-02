145958d26: 448b31 mov r14d, dword ptr [rcx]
145958d29: f30f107104 movss xmm6, dword ptr [rcx + 4]
145958d2e: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145958d34: f30f107908 movss xmm7, dword ptr [rcx + 8]
145958d39: f3440f58ff addss xmm15, xmm7
145958d3e: f3440f58790c addss xmm15, dword ptr [rcx + 0xc]
145958d44: 4889f1 mov rcx, rsi
145958d47: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145958d4e: 4889fa mov rdx, rdi
145958d51: 4589f0 mov r8d, r14d
145958d54: 0f28df movaps xmm3, xmm7
145958d57: e894eaffff call 0x1459577f0
145958d5c: f30f1005b0494400 movss xmm0, dword ptr [rip + 0x4449b0]
145958d64: f30f58c6 addss xmm0, xmm6
145958d68: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
145958d70: f30f118568010000 movss dword ptr [rbp + 0x168], xmm0
145958d78: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
145958d82: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
145958d8b: f30f100511454400 movss xmm0, dword ptr [rip + 0x444511]
145958d93: 0f138518010000 movlps qword ptr [rbp + 0x118], xmm0
145958d9a: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
145958da4: 488d8510010000 lea rax, [rbp + 0x110]
145958dab: 4889442448 mov qword ptr [rsp + 0x48], rax
145958db0: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145958db7: 4489742438 mov dword ptr [rsp + 0x38], r14d
145958dbc: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
145958dc2: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145958dc9: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145958dcf: c744242800000000 mov dword ptr [rsp + 0x28], 0
145958dd7: 4c8d8560010000 lea r8, [rbp + 0x160]
145958dde: 4889f1 mov rcx, rsi
145958de1: 4889fa mov rdx, rdi
145958de4: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
145958deb: e8f0e7ffff call 0x1459575e0
