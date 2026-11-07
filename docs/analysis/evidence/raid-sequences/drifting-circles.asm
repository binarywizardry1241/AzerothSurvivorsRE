145959ceb: 448b31 mov r14d, dword ptr [rcx]
145959cee: 448b7904 mov r15d, dword ptr [rcx + 4]
145959cf2: f30f107908 movss xmm7, dword ptr [rcx + 8]
145959cf7: f3440f10490c movss xmm9, dword ptr [rcx + 0xc]
145959cfd: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
145959d03: f30f101d95354400 movss xmm3, dword ptr [rip + 0x443595]
145959d0b: f3440f58fb addss xmm15, xmm3
145959d10: f3440f587910 addss xmm15, dword ptr [rcx + 0x10]
145959d16: 4889f1 mov rcx, rsi
145959d19: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145959d20: 4589f0 mov r8d, r14d
145959d23: e8c8daffff call 0x1459577f0
145959d28: 450f57e4 xorps xmm12, xmm12
145959d2c: f34d0f2ae7 cvtsi2ss xmm12, r15
145959d31: f3440f58258a334700 addss xmm12, dword ptr [rip + 0x47338a]
145959d3a: f3440f592561354400 mulss xmm12, dword ptr [rip + 0x443561]
145959d43: 488d9e88050000 lea rbx, [rsi + 0x588]
145959d4a: 450f57d2 xorps xmm10, xmm10
145959d4e: f3450f5cd4 subss xmm10, xmm12
145959d53: f3440f5915fcb04700 mulss xmm10, dword ptr [rip + 0x47b0fc]
145959d5c: f3440f589578010000 addss xmm10, dword ptr [rbp + 0x178]
145959d65: 410f28c2 movaps xmm0, xmm10
145959d69: e8af032a00 call 0x145bfa11d
145959d6e: 440f28c0 movaps xmm8, xmm0
145959d72: 410f28c2 movaps xmm0, xmm10
145959d76: e89c032a00 call 0x145bfa117
145959d7b: 440f14c0 unpcklps xmm8, xmm0
145959d7f: 440f590589aa6500 mulps xmm8, xmmword ptr [rip + 0x65aa89]
145959d87: 440f588550010000 addps xmm8, xmmword ptr [rbp + 0x150]
145959d8f: f3410f16d0 movshdup xmm2, xmm8
145959d94: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
145959d9a: ffc7 inc edi
145959d9c: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
145959da2: f30f10b6340a0000 movss xmm6, dword ptr [rsi + 0xa34]
145959daa: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
145959db1: 4883c110 add rcx, 0x10
145959db5: 410f28c8 movaps xmm1, xmm8
145959db9: e8c29ff7ff call 0x1458d3d80
145959dbe: 440f28d0 movaps xmm10, xmm0
145959dc2: 4c8ba698050000 mov r12, qword ptr [rsi + 0x598]
145959dc9: 4c3ba688050000 cmp r12, qword ptr [rsi + 0x588]
145959dd0: 7508 jne 0x145959dda
145959dd2: 4889d9 mov rcx, rbx
145959dd5: e8560f2a00 call 0x145bfad30
145959dda: f30f1005be344400 movss xmm0, dword ptr [rip + 0x4434be]
145959de2: f30f58c6 addss xmm0, xmm6
145959de6: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145959ded: 4c89e0 mov rax, r12
145959df0: 48c1e007 shl rax, 7
145959df4: 48c7040100000000 mov qword ptr [rcx + rax], 0
145959dfc: c744011003000000 mov dword ptr [rcx + rax + 0x10], 3
145959e04: f3440f117c0114 movss dword ptr [rcx + rax + 0x14], xmm15
145959e0b: f30f100d91344400 movss xmm1, dword ptr [rip + 0x443491]
145959e13: 0f134c0118 movlps qword ptr [rcx + rax + 0x18], xmm1
145959e18: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145959e1f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145959e24: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
145959e2d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145959e35: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
145959e3b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
145959e3f: 440f13440140 movlps qword ptr [rcx + rax + 0x40], xmm8
145959e45: f3440f11540148 movss dword ptr [rcx + rax + 0x48], xmm10
145959e4c: c744014c00000000 mov dword ptr [rcx + rax + 0x4c], 0
145959e54: f30f11740150 movss dword ptr [rcx + rax + 0x50], xmm6
145959e5a: f30f11440154 movss dword ptr [rcx + rax + 0x54], xmm0
145959e60: c744015800000000 mov dword ptr [rcx + rax + 0x58], 0
145959e68: 448974015c mov dword ptr [rcx + rax + 0x5c], r14d
145959e6d: f3440f11740160 movss dword ptr [rcx + rax + 0x60], xmm14
145959e74: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
145959e7c: 49ffc4 inc r12
145959e7f: 0f57c0 xorps xmm0, xmm0
145959e82: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
145959e87: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145959e90: 4c89a698050000 mov qword ptr [rsi + 0x598], r12
145959e97: 0f848f2c0000 je 0x14595cb2c
145959e9d: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145959ea4: f3440f114c0170 movss dword ptr [rcx + rax + 0x70], xmm9
145959eab: 4183ff02 cmp r15d, 2
145959eaf: 0f82c3daffff jb 0x145957978
145959eb5: 410f28f6 movaps xmm6, xmm14
145959eb9: bf01000000 mov edi, 1
145959ebe: 450f57ed xorps xmm13, xmm13
145959ec2: 4c8db510010000 lea r14, [rbp + 0x110]
145959ec9: 89f8 mov eax, edi
145959ecb: 450f57d2 xorps xmm10, xmm10
145959ecf: f34c0f2ad0 cvtsi2ss xmm10, rax
145959ed4: f3450f5cd4 subss xmm10, xmm12
145959ed9: f3440f591576af4700 mulss xmm10, dword ptr [rip + 0x47af76]
145959ee2: f3440f589578010000 addss xmm10, dword ptr [rbp + 0x178]
145959eeb: 410f28c2 movaps xmm0, xmm10
145959eef: e829022a00 call 0x145bfa11d
145959ef4: 440f28c0 movaps xmm8, xmm0
145959ef8: 410f28c2 movaps xmm0, xmm10
145959efc: e816022a00 call 0x145bfa117
145959f01: 440f14c0 unpcklps xmm8, xmm0
145959f05: 440f590503a96500 mulps xmm8, xmmword ptr [rip + 0x65a903]
145959f0d: 440f588550010000 addps xmm8, xmmword ptr [rbp + 0x150]
145959f15: f3450f16d8 movshdup xmm11, xmm8
145959f1a: 448ba6380a0000 mov r12d, dword ptr [rsi + 0xa38]
145959f21: 41ffc4 inc r12d
145959f24: 4489a6380a0000 mov dword ptr [rsi + 0xa38], r12d
145959f2b: f3440f10b6340a0000 movss xmm14, dword ptr [rsi + 0xa34]
145959f34: 4c8bae98090000 mov r13, qword ptr [rsi + 0x998]
145959f3b: 498d4d10 lea rcx, [r13 + 0x10]
145959f3f: 410f28c8 movaps xmm1, xmm8
145959f43: 410f28d3 movaps xmm2, xmm11
145959f47: e844d0f7ff call 0x1458d6f90
145959f4c: a801 test al, 1
145959f4e: 7406 je 0x145959f56
145959f50: 440f28d0 movaps xmm10, xmm0
145959f54: eb38 jmp 0x145959f8e
145959f56: 49837d68ff cmp qword ptr [r13 + 0x68], -1
145959f5b: 7428 je 0x145959f85
145959f5d: 498d5568 lea rdx, [r13 + 0x68]
145959f61: 4c89f1 mov rcx, r14
145959f64: 410f28d0 movaps xmm2, xmm8
145959f68: 410f28db movaps xmm3, xmm11
145959f6c: e80f22f8ff call 0x1458dc180
145959f71: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145959f78: 750b jne 0x145959f85
145959f7a: f3440f10951c010000 movss xmm10, dword ptr [rbp + 0x11c]
145959f83: eb09 jmp 0x145959f8e
145959f85: f3450f1095b8000000 movss xmm10, dword ptr [r13 + 0xb8]
145959f8e: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
145959f95: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
145959f9c: 7508 jne 0x145959fa6
145959f9e: 4889d9 mov rcx, rbx
145959fa1: e88a0d2a00 call 0x145bfad30
145959fa6: 410f28c6 movaps xmm0, xmm14
145959faa: f30f5805ee324400 addss xmm0, dword ptr [rip + 0x4432ee]
145959fb2: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
145959fb9: 4c89e8 mov rax, r13
145959fbc: 48c1e007 shl rax, 7
145959fc0: 48c7040100000000 mov qword ptr [rcx + rax], 0
145959fc8: c744011003000000 mov dword ptr [rcx + rax + 0x10], 3
145959fd0: f3440f117c0114 movss dword ptr [rcx + rax + 0x14], xmm15
145959fd7: f30f100dc5324400 movss xmm1, dword ptr [rip + 0x4432c5]
145959fdf: 0f134c0118 movlps qword ptr [rcx + rax + 0x18], xmm1
145959fe4: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145959feb: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145959ff0: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
145959ff9: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
14595a001: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14595a007: 448964013c mov dword ptr [rcx + rax + 0x3c], r12d
14595a00c: 440f13440140 movlps qword ptr [rcx + rax + 0x40], xmm8
14595a012: f3440f11540148 movss dword ptr [rcx + rax + 0x48], xmm10
14595a019: c744014c00000000 mov dword ptr [rcx + rax + 0x4c], 0
14595a021: f3440f11740150 movss dword ptr [rcx + rax + 0x50], xmm14
14595a028: f30f11440154 movss dword ptr [rcx + rax + 0x54], xmm0
14595a02e: 48c744015800000000 mov qword ptr [rcx + rax + 0x58], 0
14595a037: f30f11740160 movss dword ptr [rcx + rax + 0x60], xmm6
14595a03d: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14595a045: 49ffc5 inc r13
14595a048: 440f116c0168 movups xmmword ptr [rcx + rax + 0x68], xmm13
14595a04e: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
14595a057: 4c89ae98050000 mov qword ptr [rsi + 0x598], r13
14595a05e: 0f84c82a0000 je 0x14595cb2c
14595a064: ffc7 inc edi
14595a066: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595a06d: f3440f114c0170 movss dword ptr [rcx + rax + 0x70], xmm9
14595a074: 4139ff cmp r15d, edi
14595a077: 0f854cfeffff jne 0x145959ec9
14595a07d: e9f6d8ffff jmp 0x145957978
