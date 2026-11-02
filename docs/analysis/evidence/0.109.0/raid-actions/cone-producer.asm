145959bc4: 8b19 mov ebx, dword ptr [rcx]
145959bc6: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145959bcb: f30f10151d864800 movss xmm2, dword ptr [rip + 0x48861d]
145959bd3: f30f58d6 addss xmm2, xmm6
145959bd7: f20f107904 movsd xmm7, qword ptr [rcx + 4]
145959bdc: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145959be2: f3440f10a578010000 movss xmm12, dword ptr [rbp + 0x178]
145959beb: f3440f11642420 movss dword ptr [rsp + 0x20], xmm12
145959bf2: 4889f1 mov rcx, rsi
145959bf5: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145959bfc: 41b901000000 mov r9d, 1
145959c02: e819d7ffff call 0x145957320
145959c07: 4889f1 mov rcx, rsi
145959c0a: 4c8bb580010000 mov r14, qword ptr [rbp + 0x180]
145959c11: 4c89f2 mov rdx, r14
145959c14: 4189d8 mov r8d, ebx
145959c17: 0f28de movaps xmm3, xmm6
145959c1a: e8d1dbffff call 0x1459577f0
145959c1f: f20f100569fd8c01 movsd xmm0, qword ptr [rip + 0x18cfd69]
145959c27: 0f59c7 mulps xmm0, xmm7
145959c2a: 0f138564010000 movlps qword ptr [rbp + 0x164], xmm0
145959c31: c7856001000003000000 mov dword ptr [rbp + 0x160], 3
145959c3b: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145959c45: 488dbd10010000 lea rdi, [rbp + 0x110]
145959c4c: 48897c2448 mov qword ptr [rsp + 0x48], rdi
145959c51: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145959c58: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
145959c5e: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
145959c65: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145959c6c: c744243800000000 mov dword ptr [rsp + 0x38], 0
145959c74: 4c8d8560010000 lea r8, [rbp + 0x160]
145959c7b: 4889f1 mov rcx, rsi
145959c7e: 4c89f2 mov rdx, r14
145959c81: 440f288d50010000 movaps xmm9, xmmword ptr [rbp + 0x150]
145959c89: 410f28d9 movaps xmm3, xmm9
145959c8d: e84ed9ffff call 0x1459575e0
145959c92: 410f28c4 movaps xmm0, xmm12
145959c96: e882042a00 call 0x145bfa11d
145959c9b: 440f28c0 movaps xmm8, xmm0
145959c9f: 410f28c4 movaps xmm0, xmm12
145959ca3: e86f042a00 call 0x145bfa117
145959ca8: 440f14c0 unpcklps xmm8, xmm0
145959cac: f30f12c7 movsldup xmm0, xmm7
145959cb0: 410f59c0 mulps xmm0, xmm8
145959cb4: 0f5905a5854800 mulps xmm0, xmmword ptr [rip + 0x4885a5]
145959cbb: 440f58c8 addps xmm9, xmm0
145959cbf: 440f138d10010000 movlps qword ptr [rbp + 0x110], xmm9
145959cc7: f3440f119d18010000 movss dword ptr [rbp + 0x118], xmm11
145959cd0: 48897c2420 mov qword ptr [rsp + 0x20], rdi
145959cd5: 4889f1 mov rcx, rsi
145959cd8: 0f28ce movaps xmm1, xmm6
145959cdb: 4d89f0 mov r8, r14
145959cde: 4189d9 mov r9d, ebx
145959ce1: e84a45ffff call 0x14594e230
145959ce6: e98ddcffff jmp 0x145957978
