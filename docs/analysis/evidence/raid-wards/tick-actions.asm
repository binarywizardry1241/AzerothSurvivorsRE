145949d4a: 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
145949d51: 48898518030000 mov qword ptr [rbp + 0x318], rax
145949d58: 4c8bb500010000 mov r14, qword ptr [rbp + 0x100]
145949d5f: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
145949d66: 488d0480 lea rax, [rax + rax*4]
145949d6a: 498d1cc6 lea rbx, [r14 + rax*8]
145949d6e: f3440f1015297a4600 movss xmm10, dword ptr [rip + 0x467a29]
145949d77: 440f281de1ef2b01 movaps xmm11, xmmword ptr [rip + 0x12befe1]
145949d7f: 4c8dbd60020000 lea r15, [rbp + 0x260]
145949d86: 4c89b5c8020000 mov qword ptr [rbp + 0x2c8], r14
145949d8d: 4939de cmp r14, rbx
145949d90: 752b jne 0x145949dbd
145949d92: e945020000 jmp 0x145949fdc
145949d97: 660f6ed7 movd xmm2, edi
145949d9b: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
145949da2: 41b906080000 mov r9d, 0x806
145949da8: e833befcff call 0x145915be0
145949dad: 90 nop
145949dae: 6690 nop
145949db0: 4983c628 add r14, 0x28
145949db4: 4939de cmp r14, rbx
145949db7: 0f841f020000 je 0x145949fdc
145949dbd: 418b06 mov eax, dword ptr [r14]
145949dc0: 83f8ff cmp eax, -1
145949dc3: 0f8413020000 je 0x145949fdc
145949dc9: 418b7e04 mov edi, dword ptr [r14 + 4]
145949dcd: 4d8b6608 mov r12, qword ptr [r14 + 8]
145949dd1: 4d8b6e10 mov r13, qword ptr [r14 + 0x10]
145949dd5: f2450f106618 movsd xmm12, qword ptr [r14 + 0x18]
145949ddb: f3450f106e20 movss xmm13, dword ptr [r14 + 0x20]
145949de1: 410fb64e24 movzx ecx, byte ptr [r14 + 0x24]
145949de6: 4c89ad00020000 mov qword ptr [rbp + 0x200], r13
145949ded: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
145949df4: 488b9270050000 mov rdx, qword ptr [rdx + 0x570]
145949dfb: 4885d2 test rdx, rdx
145949dfe: 74b0 je 0x145949db0
145949e00: 4c8b8520030000 mov r8, qword ptr [rbp + 0x320]
145949e07: 4d8b8868050000 mov r9, qword ptr [r8 + 0x568]
145949e0e: 4c69c2d8010000 imul r8, rdx, 0x1d8
145949e15: 31d2 xor edx, edx
145949e17: eb13 jmp 0x145949e2c
145949e19: 0f1f8000000000 nop dword ptr [rax]
145949e20: 4881c2d8010000 add rdx, 0x1d8
145949e27: 4939d0 cmp r8, rdx
145949e2a: 7484 je 0x145949db0
145949e2c: 4d39ac11f0000000 cmp qword ptr [r9 + rdx + 0xf0], r13
145949e34: 75ea jne 0x145949e20
145949e36: 4183bc11b000000001 cmp dword ptr [r9 + rdx + 0xb0], 1
145949e3f: 74df je 0x145949e20
145949e41: 4183bc11d0000000ff cmp dword ptr [r9 + rdx + 0xd0], -1
145949e4a: 0f8460ffffff je 0x145949db0
145949e50: 498b9411e0000000 mov rdx, qword ptr [r9 + rdx + 0xe0]
145949e58: 0f1f840000000000 nop dword ptr [rax + rax]
145949e60: 4d85c0 test r8, r8
145949e63: 0f84c7000000 je 0x145949f30
145949e69: 4d89ca mov r10, r9
145949e6c: 4981c1d8010000 add r9, 0x1d8
145949e73: 4981c028feffff add r8, -0x1d8
145949e7a: 493992f0000000 cmp qword ptr [r10 + 0xf0], rdx
145949e81: 75dd jne 0x145949e60
145949e83: 41f682b000000001 test byte ptr [r10 + 0xb0], 1
145949e8b: 75d3 jne 0x145949e60
145949e8d: 85c0 test eax, eax
145949e8f: 7417 je 0x145949ea8
145949e91: 83f801 cmp eax, 1
145949e94: 0f858d000000 jne 0x145949f27
145949e9a: f6c101 test cl, 1
145949e9d: 0f84f4feffff je 0x145949d97
145949ea3: e988000000 jmp 0x145949f30
145949ea8: f6c101 test cl, 1
145949eab: 0f84fffeffff je 0x145949db0
145949eb1: 85ff test edi, edi
145949eb3: 747b je 0x145949f30
145949eb5: 89f8 mov eax, edi
145949eb7: f34c0f2af0 cvtsi2ss xmm14, rax
145949ebc: 31f6 xor esi, esi
145949ebe: 6690 nop
145949ec0: 89f0 mov eax, esi
145949ec2: 0f57f6 xorps xmm6, xmm6
145949ec5: f3480f2af0 cvtsi2ss xmm6, rax
145949eca: f3410f5ef6 divss xmm6, xmm14
145949ecf: f3410f59f2 mulss xmm6, xmm10
145949ed4: 0f28c6 movaps xmm0, xmm6
145949ed7: e83b052c00 call 0x145c0a417
145949edc: 0f28f8 movaps xmm7, xmm0
145949edf: 0f28c6 movaps xmm0, xmm6
145949ee2: e82a052c00 call 0x145c0a411
145949ee7: 0f14f8 unpcklps xmm7, xmm0
145949eea: 410f59fb mulps xmm7, xmm11
145949eee: 410f58fc addps xmm7, xmm12
145949ef2: 0f13bd64020000 movlps qword ptr [rbp + 0x264], xmm7
145949ef9: f3440f11ad6c020000 movss dword ptr [rbp + 0x26c], xmm13
145949f02: c7856002000001000000 mov dword ptr [rbp + 0x260], 1
145949f0c: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
145949f13: 4c89e2 mov rdx, r12
145949f16: 4d89f8 mov r8, r15
145949f19: e8723effff call 0x14593dd90
145949f1e: 90 nop
145949f1f: ffc6 inc esi
145949f21: 39fe cmp esi, edi
145949f23: 759b jne 0x145949ec0
145949f25: eb09 jmp 0x145949f30
145949f27: f6c101 test cl, 1
145949f2a: 0f8480feffff je 0x145949db0
145949f30: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
145949f34: 488d9500020000 lea rdx, [rbp + 0x200]
145949f3b: e8c0a90700 call 0x1459c4900
145949f40: 90 nop
145949f41: e8ba826bfa call 0x140002200
145949f46: b920000000 mov ecx, 0x20
145949f4b: ba01000000 mov edx, 1
145949f50: e86b826bfa call 0x1400021c0
145949f55: 4885c0 test rax, rax
145949f58: 0f84be0a0000 je 0x14594aa1c
145949f5e: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
145949f65: 4c8928 mov qword ptr [rax], r13
145949f68: 488b8520030000 mov rax, qword ptr [rbp + 0x320]
145949f6f: 488bb030060000 mov rsi, qword ptr [rax + 0x630]
145949f76: 483bb020060000 cmp rsi, qword ptr [rax + 0x620]
145949f7d: 750d jne 0x145949f8c
145949f7f: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
145949f86: e8453c2c00 call 0x145c0dbd0
145949f8b: 90 nop
145949f8c: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
145949f93: 488b8228060000 mov rax, qword ptr [rdx + 0x628]
145949f9a: 4889f1 mov rcx, rsi
145949f9d: 48c1e105 shl rcx, 5
145949fa1: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
145949fa9: 4c8b85f0020000 mov r8, qword ptr [rbp + 0x2f0]
145949fb0: 4c89440808 mov qword ptr [rax + rcx + 8], r8
145949fb5: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
145949fbe: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
145949fc5: 48ffc6 inc rsi
145949fc8: 4889b230060000 mov qword ptr [rdx + 0x630], rsi
145949fcf: 4983c628 add r14, 0x28
145949fd3: 4939de cmp r14, rbx
145949fd6: 0f85e1fdffff jne 0x145949dbd
