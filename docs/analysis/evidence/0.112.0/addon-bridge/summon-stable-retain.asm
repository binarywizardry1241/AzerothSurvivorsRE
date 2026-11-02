1459c4ce0: 4156 push r14
1459c4ce2: 56 push rsi
1459c4ce3: 57 push rdi
1459c4ce4: 53 push rbx
1459c4ce5: 488b4110 mov rax, qword ptr [rcx + 0x10]
1459c4ce9: 4885c0 test rax, rax
1459c4cec: 0f8453010000 je 0x1459c4e45
1459c4cf2: 4c8b4108 mov r8, qword ptr [rcx + 8]
1459c4cf6: 4c8b4a08 mov r9, qword ptr [rdx + 8]
1459c4cfa: 488b5210 mov rdx, qword ptr [rdx + 0x10]
1459c4cfe: 49baf8ffffffffffff0f movabs r10, 0xffffffffffffff8
1459c4d08: 4921d2 and r10, rdx
1459c4d0b: c1e203 shl edx, 3
1459c4d0e: 83e238 and edx, 0x38
1459c4d11: 4531db xor r11d, r11d
1459c4d14: eb16 jmp 0x1459c4d2c
1459c4d16: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4d20: 49ffc3 inc r11
1459c4d23: 4939c3 cmp r11, rax
1459c4d26: 0f8419010000 je 0x1459c4e45
1459c4d2c: 4c89de mov rsi, r11
1459c4d2f: 48c1e607 shl rsi, 7
1459c4d33: 498b743020 mov rsi, qword ptr [r8 + rsi + 0x20]
1459c4d38: 31ff xor edi, edi
1459c4d3a: 660f1f440000 nop word ptr [rax + rax]
1459c4d40: 4939fa cmp r10, rdi
1459c4d43: 746b je 0x1459c4db0
1459c4d45: 493934f9 cmp qword ptr [r9 + rdi*8], rsi
1459c4d49: 0f84e9000000 je 0x1459c4e38
1459c4d4f: 493974f908 cmp qword ptr [r9 + rdi*8 + 8], rsi
1459c4d54: 0f84de000000 je 0x1459c4e38
1459c4d5a: 493974f910 cmp qword ptr [r9 + rdi*8 + 0x10], rsi
1459c4d5f: 0f84d3000000 je 0x1459c4e38
1459c4d65: 493974f918 cmp qword ptr [r9 + rdi*8 + 0x18], rsi
1459c4d6a: 0f84c8000000 je 0x1459c4e38
1459c4d70: 493974f920 cmp qword ptr [r9 + rdi*8 + 0x20], rsi
1459c4d75: 0f84bd000000 je 0x1459c4e38
1459c4d7b: 493974f928 cmp qword ptr [r9 + rdi*8 + 0x28], rsi
1459c4d80: 0f84b2000000 je 0x1459c4e38
1459c4d86: 493974f930 cmp qword ptr [r9 + rdi*8 + 0x30], rsi
1459c4d8b: 0f84a7000000 je 0x1459c4e38
1459c4d91: 493974f938 cmp qword ptr [r9 + rdi*8 + 0x38], rsi
1459c4d96: 488d7f08 lea rdi, [rdi + 8]
1459c4d9a: 75a4 jne 0x1459c4d40
1459c4d9c: e997000000 jmp 0x1459c4e38
1459c4da1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4db0: 4885d2 test rdx, rdx
1459c4db3: 0f8467ffffff je 0x1459c4d20
1459c4db9: 4b3934d1 cmp qword ptr [r9 + r10*8], rsi
1459c4dbd: 7479 je 0x1459c4e38
1459c4dbf: 83fa08 cmp edx, 8
1459c4dc2: 0f8458ffffff je 0x1459c4d20
1459c4dc8: 4b3974d108 cmp qword ptr [r9 + r10*8 + 8], rsi
1459c4dcd: 7469 je 0x1459c4e38
1459c4dcf: 83fa10 cmp edx, 0x10
1459c4dd2: 0f8448ffffff je 0x1459c4d20
1459c4dd8: 4b3974d110 cmp qword ptr [r9 + r10*8 + 0x10], rsi
1459c4ddd: 7459 je 0x1459c4e38
1459c4ddf: 83fa18 cmp edx, 0x18
1459c4de2: 0f8438ffffff je 0x1459c4d20
1459c4de8: 4b3974d118 cmp qword ptr [r9 + r10*8 + 0x18], rsi
1459c4ded: 7449 je 0x1459c4e38
1459c4def: 83fa20 cmp edx, 0x20
1459c4df2: 0f8428ffffff je 0x1459c4d20
1459c4df8: 4b3974d120 cmp qword ptr [r9 + r10*8 + 0x20], rsi
1459c4dfd: 7439 je 0x1459c4e38
1459c4dff: 83fa28 cmp edx, 0x28
1459c4e02: 0f8418ffffff je 0x1459c4d20
1459c4e08: 4b3974d128 cmp qword ptr [r9 + r10*8 + 0x28], rsi
1459c4e0d: 7429 je 0x1459c4e38
1459c4e0f: 83fa30 cmp edx, 0x30
1459c4e12: 0f8408ffffff je 0x1459c4d20
1459c4e18: 83fa38 cmp edx, 0x38
1459c4e1b: 0f95c3 setne bl
1459c4e1e: 4b3974d130 cmp qword ptr [r9 + r10*8 + 0x30], rsi
1459c4e23: 7409 je 0x1459c4e2e
1459c4e25: 84db test bl, bl
1459c4e27: 750f jne 0x1459c4e38
1459c4e29: e9f2feffff jmp 0x1459c4d20
1459c4e2e: b301 mov bl, 1
1459c4e30: 84db test bl, bl
1459c4e32: 0f84e8feffff je 0x1459c4d20
1459c4e38: 498d7301 lea rsi, [r11 + 1]
1459c4e3c: 4839c6 cmp rsi, rax
1459c4e3f: 726f jb 0x1459c4eb0
1459c4e41: 4c895910 mov qword ptr [rcx + 0x10], r11
1459c4e45: 5b pop rbx
1459c4e46: 5f pop rdi
1459c4e47: 5e pop rsi
1459c4e48: 415e pop r14
1459c4e4a: c3 ret
1459c4e4b: 0f1f440000 nop dword ptr [rax + rax]
1459c4e50: 4c89db mov rbx, r11
1459c4e53: 48c1e307 shl rbx, 7
1459c4e57: 0f104770 movups xmm0, xmmword ptr [rdi + 0x70]
1459c4e5b: 410f11441870 movups xmmword ptr [r8 + rbx + 0x70], xmm0
1459c4e61: 0f104760 movups xmm0, xmmword ptr [rdi + 0x60]
1459c4e65: 410f11441860 movups xmmword ptr [r8 + rbx + 0x60], xmm0
1459c4e6b: 0f104750 movups xmm0, xmmword ptr [rdi + 0x50]
1459c4e6f: 410f11441850 movups xmmword ptr [r8 + rbx + 0x50], xmm0
1459c4e75: 0f104740 movups xmm0, xmmword ptr [rdi + 0x40]
1459c4e79: 410f11441840 movups xmmword ptr [r8 + rbx + 0x40], xmm0
1459c4e7f: 0f1007 movups xmm0, xmmword ptr [rdi]
1459c4e82: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1459c4e86: 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
1459c4e8a: 0f105f30 movups xmm3, xmmword ptr [rdi + 0x30]
1459c4e8e: 410f115c1830 movups xmmword ptr [r8 + rbx + 0x30], xmm3
1459c4e94: 410f11541820 movups xmmword ptr [r8 + rbx + 0x20], xmm2
1459c4e9a: 410f114c1810 movups xmmword ptr [r8 + rbx + 0x10], xmm1
1459c4ea0: 410f110418 movups xmmword ptr [r8 + rbx], xmm0
1459c4ea5: 49ffc3 inc r11
1459c4ea8: 48ffc6 inc rsi
1459c4eab: 4839c6 cmp rsi, rax
1459c4eae: 7491 je 0x1459c4e41
1459c4eb0: 4889f3 mov rbx, rsi
1459c4eb3: 48c1e307 shl rbx, 7
1459c4eb7: 498d3c18 lea rdi, [r8 + rbx]
1459c4ebb: 498b5c1820 mov rbx, qword ptr [r8 + rbx + 0x20]
1459c4ec0: 4531f6 xor r14d, r14d
1459c4ec3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4ed0: 4d39f2 cmp r10, r14
1459c4ed3: 744b je 0x1459c4f20
1459c4ed5: 4b391cf1 cmp qword ptr [r9 + r14*8], rbx
1459c4ed9: 74cd je 0x1459c4ea8
1459c4edb: 4b395cf108 cmp qword ptr [r9 + r14*8 + 8], rbx
1459c4ee0: 74c6 je 0x1459c4ea8
1459c4ee2: 4b395cf110 cmp qword ptr [r9 + r14*8 + 0x10], rbx
1459c4ee7: 74bf je 0x1459c4ea8
1459c4ee9: 4b395cf118 cmp qword ptr [r9 + r14*8 + 0x18], rbx
1459c4eee: 74b8 je 0x1459c4ea8
1459c4ef0: 4b395cf120 cmp qword ptr [r9 + r14*8 + 0x20], rbx
1459c4ef5: 74b1 je 0x1459c4ea8
1459c4ef7: 4b395cf128 cmp qword ptr [r9 + r14*8 + 0x28], rbx
1459c4efc: 74aa je 0x1459c4ea8
1459c4efe: 4b395cf130 cmp qword ptr [r9 + r14*8 + 0x30], rbx
1459c4f03: 74a3 je 0x1459c4ea8
1459c4f05: 4b395cf138 cmp qword ptr [r9 + r14*8 + 0x38], rbx
1459c4f0a: 4d8d7608 lea r14, [r14 + 8]
1459c4f0e: 75c0 jne 0x1459c4ed0
1459c4f10: eb96 jmp 0x1459c4ea8
1459c4f12: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4f20: 4885d2 test rdx, rdx
1459c4f23: 0f8427ffffff je 0x1459c4e50
1459c4f29: 4b391cd1 cmp qword ptr [r9 + r10*8], rbx
1459c4f2d: 0f8475ffffff je 0x1459c4ea8
1459c4f33: 83fa08 cmp edx, 8
1459c4f36: 0f8414ffffff je 0x1459c4e50
1459c4f3c: 4b395cd108 cmp qword ptr [r9 + r10*8 + 8], rbx
1459c4f41: 0f8461ffffff je 0x1459c4ea8
1459c4f47: 83fa10 cmp edx, 0x10
1459c4f4a: 0f8400ffffff je 0x1459c4e50
1459c4f50: 4b395cd110 cmp qword ptr [r9 + r10*8 + 0x10], rbx
1459c4f55: 0f844dffffff je 0x1459c4ea8
1459c4f5b: 83fa18 cmp edx, 0x18
1459c4f5e: 0f84ecfeffff je 0x1459c4e50
1459c4f64: 4b395cd118 cmp qword ptr [r9 + r10*8 + 0x18], rbx
1459c4f69: 0f8439ffffff je 0x1459c4ea8
1459c4f6f: 83fa20 cmp edx, 0x20
1459c4f72: 0f84d8feffff je 0x1459c4e50
1459c4f78: 4b395cd120 cmp qword ptr [r9 + r10*8 + 0x20], rbx
1459c4f7d: 0f8425ffffff je 0x1459c4ea8
1459c4f83: 83fa28 cmp edx, 0x28
1459c4f86: 0f84c4feffff je 0x1459c4e50
1459c4f8c: 4b395cd128 cmp qword ptr [r9 + r10*8 + 0x28], rbx
1459c4f91: 0f8411ffffff je 0x1459c4ea8
1459c4f97: 83fa30 cmp edx, 0x30
1459c4f9a: 0f84b0feffff je 0x1459c4e50
1459c4fa0: 4b395cd130 cmp qword ptr [r9 + r10*8 + 0x30], rbx
1459c4fa5: 0f84fdfeffff je 0x1459c4ea8
1459c4fab: 83fa38 cmp edx, 0x38
1459c4fae: 0f849cfeffff je 0x1459c4e50
1459c4fb4: e9effeffff jmp 0x1459c4ea8
