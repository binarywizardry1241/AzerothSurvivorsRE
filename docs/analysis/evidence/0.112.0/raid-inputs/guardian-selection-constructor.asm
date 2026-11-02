145906d20: 4f8d3401 lea r14, [r9 + r8]
145906d24: 49c1c617 rol r14, 0x17
145906d28: 4d01ce add r14, r9
145906d2b: 4989d3 mov r11, rdx
145906d2e: 49c1e311 shl r11, 0x11
145906d32: 4c31c8 xor rax, r9
145906d35: 4931d0 xor r8, rdx
145906d38: 4831c2 xor rdx, rax
145906d3b: 4d31c1 xor r9, r8
145906d3e: 4c31d8 xor rax, r11
145906d41: 49c1c02d rol r8, 0x2d
145906d45: 490fbae639 bt r14, 0x39
145906d4a: 72d4 jb 0x145906d20
145906d4c: f3440f11add8030000 movss dword ptr [rbp + 0x3d8], xmm13
145906d55: f3450f59eb mulss xmm13, xmm11
145906d5a: 450f28f7 movaps xmm14, xmm15
145906d5e: f3440f593599434b00 mulss xmm14, dword ptr [rip + 0x4b4399]
145906d67: f3440f5835dc1d3001 addss xmm14, dword ptr [rip + 0x1301ddc]
145906d70: 450fb7d2 movzx r10d, r10w
145906d74: f3410f2af2 cvtsi2ss xmm6, r10d
145906d79: f30f5e3507674a00 divss xmm6, dword ptr [rip + 0x4a6707]
145906d81: 4c8b9538040000 mov r10, qword ptr [rbp + 0x438]
145906d88: 4d898ab8090000 mov qword ptr [r10 + 0x9b8], r9
145906d8f: 4d8982d0090000 mov qword ptr [r10 + 0x9d0], r8
145906d96: 498992c0090000 mov qword ptr [r10 + 0x9c0], rdx
145906d9d: 498982c8090000 mov qword ptr [r10 + 0x9c8], rax
145906da4: e86721f9ff call 0x145898f10
145906da9: 4885c0 test rax, rax
145906dac: 7470 je 0x145906e1e
145906dae: 4c8b4818 mov r9, qword ptr [rax + 0x18]
145906db2: 4d85c9 test r9, r9
145906db5: 7441 je 0x145906df8
145906db7: 4c89c9 mov rcx, r9
145906dba: 48ffc1 inc rcx
145906dbd: 0f84ec170000 je 0x1459085af
145906dc3: 49c1ee3a shr r14, 0x3a
145906dc7: 4939ce cmp r14, rcx
145906dca: 7210 jb 0x145906ddc
145906dcc: 4989c0 mov r8, rax
145906dcf: 4489f0 mov eax, r14d
145906dd2: 31d2 xor edx, edx
145906dd4: f7f1 div ecx
145906dd6: 4c89c0 mov rax, r8
145906dd9: 4189d6 mov r14d, edx
145906ddc: 4d85f6 test r14, r14
145906ddf: 7417 je 0x145906df8
145906de1: 49ffce dec r14
145906de4: 4d39ce cmp r14, r9
145906de7: 0f8306180000 jae 0x1459085f3
145906ded: 49c1e604 shl r14, 4
145906df1: 4c037010 add r14, qword ptr [rax + 0x10]
145906df5: 4c89f0 mov rax, r14
145906df8: 4c8b30 mov r14, qword ptr [rax]
145906dfb: 4c8b6008 mov r12, qword ptr [rax + 8]
145906dff: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
145906e02: e80921f9ff call 0x145898f10
145906e07: 4889c2 mov rdx, rax
145906e0a: 4d85e4 test r12, r12
145906e0d: 0f8494000000 je 0x145906ea7
145906e13: 488995e0030000 mov qword ptr [rbp + 0x3e0], rdx
145906e1a: 89fe mov esi, edi
145906e1c: eb21 jmp 0x145906e3f
145906e1e: 4889f0 mov rax, rsi
145906e21: 89fe mov esi, edi
145906e23: 8b4820 mov ecx, dword ptr [rax + 0x20]
145906e26: e8e520f9ff call 0x145898f10
145906e2b: 488985e0030000 mov qword ptr [rbp + 0x3e0], rax
145906e32: 41bc03000000 mov r12d, 3
145906e38: 4c8d35418b9301 lea r14, [rip + 0x1938b41]
145906e3f: 4a8d3ca500000000 lea rdi, [r12*4]
145906e47: e8b4b36ffa call 0x140002200
145906e4c: ba04000000 mov edx, 4
145906e51: 4889f9 mov rcx, rdi
145906e54: e867b36ffa call 0x1400021c0
145906e59: 4885c0 test rax, rax
145906e5c: 0f84dd160000 je 0x14590853f
145906e62: 4983fc08 cmp r12, 8
145906e66: 660f6ea508040000 movd xmm4, dword ptr [rbp + 0x408]
145906e6e: 660f6eadf8030000 movd xmm5, dword ptr [rbp + 0x3f8]
145906e76: 7309 jae 0x145906e81
145906e78: 31c9 xor ecx, ecx
145906e7a: 89f7 mov edi, esi
145906e7c: e9cb000000 jmp 0x145906f4c
145906e81: 498d5630 lea rdx, [r14 + 0x30]
145906e85: 496bcc38 imul rcx, r12, 0x38
145906e89: 4c01f1 add rcx, r14
145906e8c: 4883c1fc add rcx, -4
145906e90: 4839c8 cmp rax, rcx
145906e93: 89f7 mov edi, esi
145906e95: 732d jae 0x145906ec4
145906e97: 4a8d0ca0 lea rcx, [rax + r12*4]
145906e9b: 4839ca cmp rdx, rcx
145906e9e: 7324 jae 0x145906ec4
145906ea0: 31c9 xor ecx, ecx
145906ea2: e9a5000000 jmp 0x145906f4c
145906ea7: b804000000 mov eax, 4
145906eac: 4531e4 xor r12d, r12d
145906eaf: 660f6ea508040000 movd xmm4, dword ptr [rbp + 0x408]
145906eb7: 660f6eadf8030000 movd xmm5, dword ptr [rbp + 0x3f8]
145906ebf: e954010000 jmp 0x145907018
145906ec4: 4c89e1 mov rcx, r12
145906ec7: 4883e1f8 and rcx, 0xfffffffffffffff8
145906ecb: 4531c0 xor r8d, r8d
145906ece: 6690 nop
145906ed0: f30f1002 movss xmm0, dword ptr [rdx]
145906ed4: f30f104a38 movss xmm1, dword ptr [rdx + 0x38]
145906ed9: 0f14c1 unpcklps xmm0, xmm1
145906edc: f30f104a70 movss xmm1, dword ptr [rdx + 0x70]
145906ee1: f30f1092a8000000 movss xmm2, dword ptr [rdx + 0xa8]
145906ee9: 0f14ca unpcklps xmm1, xmm2
145906eec: 0f16c1 movlhps xmm0, xmm1
145906eef: f30f108a88010000 movss xmm1, dword ptr [rdx + 0x188]
145906ef7: f30f109250010000 movss xmm2, dword ptr [rdx + 0x150]
145906eff: 0f14d1 unpcklps xmm2, xmm1
145906f02: f30f108a18010000 movss xmm1, dword ptr [rdx + 0x118]
145906f0a: f30f109ae0000000 movss xmm3, dword ptr [rdx + 0xe0]
145906f12: 0f14d9 unpcklps xmm3, xmm1
145906f15: 0f16da movlhps xmm3, xmm2
145906f18: 410f59c0 mulps xmm0, xmm8
145906f1c: 410f59d8 mulps xmm3, xmm8
145906f20: 420f110480 movups xmmword ptr [rax + r8*4], xmm0
145906f25: 420f115c8010 movups xmmword ptr [rax + r8*4 + 0x10], xmm3
145906f2b: 4983c008 add r8, 8
145906f2f: 4881c2c0010000 add rdx, 0x1c0
145906f36: 4c39c1 cmp rcx, r8
145906f39: 7595 jne 0x145906ed0
145906f3b: 4939cc cmp r12, rcx
145906f3e: 750c jne 0x145906f4c
145906f40: 488bb510040000 mov rsi, qword ptr [rbp + 0x410]
145906f47: e9c5000000 jmp 0x145907011
145906f4c: 4d89e0 mov r8, r12
145906f4f: 4889ca mov rdx, rcx
145906f52: 4983e003 and r8, 3
145906f56: 7444 je 0x145906f9c
145906f58: 486bd138 imul rdx, rcx, 0x38
145906f5c: 4d8d0c16 lea r9, [r14 + rdx]
145906f60: 4983c130 add r9, 0x30
145906f64: 4b8d1400 lea rdx, [r8 + r8]
145906f68: 41c1e004 shl r8d, 4
145906f6c: 4929d0 sub r8, rdx
145906f6f: 4531d2 xor r10d, r10d
145906f72: 4889ca mov rdx, rcx
145906f75: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145906f80: f3430f100491 movss xmm0, dword ptr [r9 + r10*4]
145906f86: f3410f59c3 mulss xmm0, xmm11
145906f8b: f30f110490 movss dword ptr [rax + rdx*4], xmm0
145906f90: 48ffc2 inc rdx
145906f93: 4983c20e add r10, 0xe
145906f97: 4d39d0 cmp r8, r10
145906f9a: 75e4 jne 0x145906f80
145906f9c: 4c29e1 sub rcx, r12
145906f9f: 4883f9fc cmp rcx, -4
145906fa3: 488bb510040000 mov rsi, qword ptr [rbp + 0x410]
145906faa: 7765 ja 0x145907011
145906fac: 486bca38 imul rcx, rdx, 0x38
145906fb0: 4c01f1 add rcx, r14
145906fb3: 4881c1d8000000 add rcx, 0xd8
145906fba: 660f1f440000 nop word ptr [rax + rax]
145906fc0: f30f108158ffffff movss xmm0, dword ptr [rcx - 0xa8]
145906fc8: f3410f59c3 mulss xmm0, xmm11
145906fcd: f30f110490 movss dword ptr [rax + rdx*4], xmm0
145906fd2: f30f104190 movss xmm0, dword ptr [rcx - 0x70]
145906fd7: f3410f59c3 mulss xmm0, xmm11
145906fdc: f30f11449004 movss dword ptr [rax + rdx*4 + 4], xmm0
145906fe2: f30f1041c8 movss xmm0, dword ptr [rcx - 0x38]
145906fe7: f3410f59c3 mulss xmm0, xmm11
145906fec: f30f11449008 movss dword ptr [rax + rdx*4 + 8], xmm0
145906ff2: f30f1001 movss xmm0, dword ptr [rcx]
145906ff6: f3410f59c3 mulss xmm0, xmm11
145906ffb: f30f1144900c movss dword ptr [rax + rdx*4 + 0xc], xmm0
145907001: 4883c204 add rdx, 4
145907005: 4881c1e0000000 add rcx, 0xe0
14590700c: 4939d4 cmp r12, rdx
14590700f: 75af jne 0x145906fc0
145907011: 488b95e0030000 mov rdx, qword ptr [rbp + 0x3e0]
