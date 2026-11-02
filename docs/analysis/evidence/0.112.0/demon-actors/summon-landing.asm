0x145959b30: 55 push rbp
0x145959b31: 4157 push r15
0x145959b33: 4156 push r14
0x145959b35: 4155 push r13
0x145959b37: 4154 push r12
0x145959b39: 56 push rsi
0x145959b3a: 57 push rdi
0x145959b3b: 53 push rbx
0x145959b3c: 4881ec28010000 sub rsp, 0x128
0x145959b43: 488dac2480000000 lea rbp, [rsp + 0x80]
0x145959b4b: 440f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm9
0x145959b53: 440f298580000000 movaps xmmword ptr [rbp + 0x80], xmm8
0x145959b5b: 0f297d70 movaps xmmword ptr [rbp + 0x70], xmm7
0x145959b5f: 0f297560 movaps xmmword ptr [rbp + 0x60], xmm6
0x145959b63: 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
0x145959b6b: 0f28f3 movaps xmm6, xmm3
0x145959b6e: 4489c7 mov edi, r8d
0x145959b71: 4889ce mov rsi, rcx
0x145959b74: f30f10b94c0a0000 movss xmm7, dword ptr [rcx + 0xa4c]
0x145959b7c: 0fb65a39 movzx ebx, byte ptr [rdx + 0x39]
0x145959b80: 80fb06 cmp bl, 6
0x145959b83: 7564 jne 0x145959be9
0x145959b85: f30f1086a8040000 movss xmm0, dword ptr [rsi + 0x4a8]
0x145959b8d: f30f59054b794500 mulss xmm0, dword ptr [rip + 0x45794b]
0x145959b95: f30f100d0ba47500 movss xmm1, dword ptr [rip + 0x75a40b]
0x145959b9d: 4989d6 mov r14, rdx
0x145959ba0: 0f2ec8 ucomiss xmm1, xmm0
0x145959ba3: 7328 jae 0x145959bcd
0x145959ba5: f30f580573f02a01 addss xmm0, dword ptr [rip + 0x12af073]
0x145959bad: f3440f10050a794500 movss xmm8, dword ptr [rip + 0x45790a]
0x145959bb6: f3410f5ec0 divss xmm0, xmm8
0x145959bbb: e87d092b00 call 0x145c0a53d
0x145959bc0: f3410f59c0 mulss xmm0, xmm8
0x145959bc5: f30f5805dba37500 addss xmm0, dword ptr [rip + 0x75a3db]
0x145959bcd: 488d4dc0 lea rcx, [rbp - 0x40]
0x145959bd1: f30f10159b384500 movss xmm2, dword ptr [rip + 0x45389b]
0x145959bd9: 4889f2 mov rdx, rsi
0x145959bdc: 0f28d8 movaps xmm3, xmm0
0x145959bdf: e84c31fdff call 0x14592cd30
0x145959be4: 4c89f2 mov rdx, r14
0x145959be7: eb10 jmp 0x145959bf9
0x145959be9: c745c000000000 mov dword ptr [rbp - 0x40], 0
0x145959bf0: 80fb04 cmp bl, 4
0x145959bf3: 0f862b010000 jbe 0x145959d24
0x145959bf9: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
0x145959c00: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
0x145959c07: 4c8b8ed0090000 mov r9, qword ptr [rsi + 0x9d0]
0x145959c0e: 4989c6 mov r14, rax
0x145959c11: 49c1e611 shl r14, 0x11
0x145959c15: 4c8b86c8090000 mov r8, qword ptr [rsi + 0x9c8]
0x145959c1c: 4931c8 xor r8, rcx
0x145959c1f: 4d89c2 mov r10, r8
0x145959c22: 4931c2 xor r10, rax
0x145959c25: 4c31c8 xor rax, r9
0x145959c28: 4c8996c0090000 mov qword ptr [rsi + 0x9c0], r10
0x145959c2f: 4989c3 mov r11, rax
0x145959c32: 4931cb xor r11, rcx
0x145959c35: 4c899eb8090000 mov qword ptr [rsi + 0x9b8], r11
0x145959c3c: 4d31f0 xor r8, r14
0x145959c3f: 4c8986c8090000 mov qword ptr [rsi + 0x9c8], r8
0x145959c46: 48c1c02d rol rax, 0x2d
0x145959c4a: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x145959c51: f30f10050f774500 movss xmm0, dword ptr [rip + 0x45770f]
0x145959c59: f30f100d67f22a01 movss xmm1, dword ptr [rip + 0x12af267]
0x145959c61: f30f101dd3ce4500 movss xmm3, dword ptr [rip + 0x45ced3]
0x145959c69: f30f102517215f00 movss xmm4, dword ptr [rip + 0x5f2117]
0x145959c71: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145959c80: 4d8d3403 lea r14, [r11 + rax]
0x145959c84: 49c1c617 rol r14, 0x17
0x145959c88: 4d01de add r14, r11
0x145959c8b: 4d89d7 mov r15, r10
0x145959c8e: 49c1e711 shl r15, 0x11
0x145959c92: 4d31d8 xor r8, r11
0x145959c95: 4c31d0 xor rax, r10
0x145959c98: 4d31c2 xor r10, r8
0x145959c9b: 4931c3 xor r11, rax
0x145959c9e: 4d31f8 xor r8, r15
0x145959ca1: 48c1c02d rol rax, 0x2d
0x145959ca5: 49c1ee29 shr r14, 0x29
0x145959ca9: 4181ce0000803f or r14d, 0x3f800000
0x145959cb0: 66410f6ed6 movd xmm2, r14d
0x145959cb5: f30f58d0 addss xmm2, xmm0
0x145959cb9: f30f59d1 mulss xmm2, xmm1
0x145959cbd: f30f58d3 addss xmm2, xmm3
0x145959cc1: 0f2ee2 ucomiss xmm4, xmm2
0x145959cc4: 76ba jbe 0x145959c80
0x145959cc6: 4901c9 add r9, rcx
0x145959cc9: 49c1c117 rol r9, 0x17
0x145959ccd: 4901c9 add r9, rcx
0x145959cd0: 4c899eb8090000 mov qword ptr [rsi + 0x9b8], r11
0x145959cd7: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
0x145959cde: 4c8996c0090000 mov qword ptr [rsi + 0x9c0], r10
0x145959ce5: 4c8986c8090000 mov qword ptr [rsi + 0x9c8], r8
0x145959cec: 7807 js 0x145959cf5
0x145959cee: 0f57155b384500 xorps xmm2, xmmword ptr [rip + 0x45385b]
0x145959cf5: f30f5915a3114600 mulss xmm2, dword ptr [rip + 0x4611a3]
0x145959cfd: 83ff01 cmp edi, 1
0x145959d00: 0f85b8000000 jne 0x145959dbe
0x145959d06: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
0x145959d0d: f30f58f7 addss xmm6, xmm7
0x145959d11: f30f117518 movss dword ptr [rbp + 0x18], xmm6
0x145959d16: 48894520 mov qword ptr [rbp + 0x20], rax
0x145959d1a: b801000000 mov eax, 1
0x145959d1f: e99c000000 jmp 0x145959dc0
0x145959d24: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
0x145959d2b: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
0x145959d32: 4c8b8ed0090000 mov r9, qword ptr [rsi + 0x9d0]
0x145959d39: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
0x145959d40: f30f100520764500 movss xmm0, dword ptr [rip + 0x457620]
0x145959d48: f30f100d507a4500 movss xmm1, dword ptr [rip + 0x457a50]
0x145959d50: 4f8d1408 lea r10, [r8 + r9]
0x145959d54: 49c1c217 rol r10, 0x17
0x145959d58: 4d01c2 add r10, r8
0x145959d5b: 4989c3 mov r11, rax
0x145959d5e: 49c1e311 shl r11, 0x11
0x145959d62: 4c31c1 xor rcx, r8
0x145959d65: 4931c1 xor r9, rax
0x145959d68: 4831c8 xor rax, rcx
0x145959d6b: 4d31c8 xor r8, r9
0x145959d6e: 49c1c12d rol r9, 0x2d
0x145959d72: 4c31d9 xor rcx, r11
0x145959d75: 49c1ea29 shr r10, 0x29
0x145959d79: 4181ca0000803f or r10d, 0x3f800000
0x145959d80: 66410f6ed2 movd xmm2, r10d
0x145959d85: f30f58d0 addss xmm2, xmm0
0x145959d89: f30f59d1 mulss xmm2, xmm1
0x145959d8d: 0f2eca ucomiss xmm1, xmm2
0x145959d90: 76be jbe 0x145959d50
0x145959d92: 0f57c0 xorps xmm0, xmm0
0x145959d95: f30f58d0 addss xmm2, xmm0
0x145959d99: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
0x145959da0: 4c898ed0090000 mov qword ptr [rsi + 0x9d0], r9
0x145959da7: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
0x145959dae: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
0x145959db5: 83ff01 cmp edi, 1
0x145959db8: 0f8448ffffff je 0x145959d06
0x145959dbe: 31c0 xor eax, eax
0x145959dc0: 48894510 mov qword ptr [rbp + 0x10], rax
0x145959dc4: 488d45c0 lea rax, [rbp - 0x40]
0x145959dc8: 4889442420 mov qword ptr [rsp + 0x20], rax
0x145959dcd: 4c8d4d10 lea r9, [rbp + 0x10]
0x145959dd1: 4889f1 mov rcx, rsi
0x145959dd4: e8a745fdff call 0x14592e380
0x145959dd9: 488b8ed8000000 mov rcx, qword ptr [rsi + 0xd8]
0x145959de0: 4885c9 test rcx, rcx
0x145959de3: 742b je 0x145959e10
0x145959de5: f30f108518010000 movss xmm0, dword ptr [rbp + 0x118]
0x145959ded: 488b96d0000000 mov rdx, qword ptr [rsi + 0xd0]
0x145959df4: 48c1e107 shl rcx, 7
0x145959df8: f30f11440af0 movss dword ptr [rdx + rcx - 0x10], xmm0
0x145959dfe: f30f10055a344500 movss xmm0, dword ptr [rip + 0x45345a]
0x145959e06: f30f58c7 addss xmm0, xmm7
0x145959e0a: f30f11440af8 movss dword ptr [rdx + rcx - 8], xmm0
0x145959e10: 80fb06 cmp bl, 6
0x145959e13: 0f8594000000 jne 0x145959ead
0x145959e19: 488b96d8000000 mov rdx, qword ptr [rsi + 0xd8]
0x145959e20: 4885d2 test rdx, rdx
0x145959e23: 0f8412010000 je 0x145959f3b
0x145959e29: 488b8ed0000000 mov rcx, qword ptr [rsi + 0xd0]
0x145959e30: 48c1e207 shl rdx, 7
0x145959e34: 4c8d0411 lea r8, [rcx + rdx]
0x145959e38: 4983c080 add r8, -0x80
0x145959e3c: 4d85c0 test r8, r8
0x145959e3f: 0f84f6000000 je 0x145959f3b
0x145959e45: 4801d1 add rcx, rdx
0x145959e48: f30f1049dc movss xmm1, dword ptr [rcx - 0x24]
0x145959e4d: 0f57c0 xorps xmm0, xmm0
0x145959e50: 0f2ec1 ucomiss xmm0, xmm1
0x145959e53: 0f83f4000000 jae 0x145959f4d
0x145959e59: f30f5c79d8 subss xmm7, dword ptr [rcx - 0x28]
0x145959e5e: f30f5ef9 divss xmm7, xmm1
0x145959e62: f30f5fc7 maxss xmm0, xmm7
0x145959e66: f30f100df2334500 movss xmm1, dword ptr [rip + 0x4533f2]
0x145959e6e: f30f5dc8 minss xmm1, xmm0
0x145959e72: f30f1041c8 movss xmm0, dword ptr [rcx - 0x38]
0x145959e77: f30f1051d4 movss xmm2, dword ptr [rcx - 0x2c]
0x145959e7c: f30f5cd0 subss xmm2, xmm0
0x145959e80: f30f59d1 mulss xmm2, xmm1
0x145959e84: f30f58d0 addss xmm2, xmm0
0x145959e88: f20f1041c0 movsd xmm0, qword ptr [rcx - 0x40]
0x145959e8d: f20f1059cc movsd xmm3, qword ptr [rcx - 0x34]
0x145959e92: 0f5cd8 subps xmm3, xmm0
0x145959e95: f30f12c9 movsldup xmm1, xmm1
0x145959e99: 0f59cb mulps xmm1, xmm3
0x145959e9c: 0f58c8 addps xmm1, xmm0
0x145959e9f: 0f134d48 movlps qword ptr [rbp + 0x48], xmm1
0x145959ea3: f30f115550 movss dword ptr [rbp + 0x50], xmm2
0x145959ea8: e9ae000000 jmp 0x145959f5b
0x145959ead: 48894548 mov qword ptr [rbp + 0x48], rax
0x145959eb1: c745f002000000 mov dword ptr [rbp - 0x10], 2
0x145959eb8: c745e400000000 mov dword ptr [rbp - 0x1c], 0
0x145959ebf: 488d4de4 lea rcx, [rbp - 0x1c]
0x145959ec3: 48894c2430 mov qword ptr [rsp + 0x30], rcx
0x145959ec8: 488d4df0 lea rcx, [rbp - 0x10]
0x145959ecc: 48894c2428 mov qword ptr [rsp + 0x28], rcx
0x145959ed1: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
0x145959eda: 488d4d10 lea rcx, [rbp + 0x10]
0x145959ede: 4c8d4d48 lea r9, [rbp + 0x48]
0x145959ee2: 4889c2 mov rdx, rax
0x145959ee5: 41b83d1e0000 mov r8d, 0x1e3d
0x145959eeb: e8e048f7ff call 0x1458ce7d0
0x145959ef0: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
0x145959ef7: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
0x145959efe: 750d jne 0x145959f0d
0x145959f00: 488d8e20060000 lea rcx, [rsi + 0x620]
0x145959f07: e8c43c2b00 call 0x145c0dbd0
0x145959f0c: 90 nop
0x145959f0d: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
0x145959f14: 4889f9 mov rcx, rdi
0x145959f17: 48c1e105 shl rcx, 5
0x145959f1b: 0f104510 movups xmm0, xmmword ptr [rbp + 0x10]
0x145959f1f: 0f104d20 movups xmm1, xmmword ptr [rbp + 0x20]
0x145959f23: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145959f28: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x145959f2c: 48ffc7 inc rdi
0x145959f2f: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
0x145959f36: e95b030000 jmp 0x14595a296
0x145959f3b: 8b8ed8040000 mov ecx, dword ptr [rsi + 0x4d8]
0x145959f41: 894d50 mov dword ptr [rbp + 0x50], ecx
0x145959f44: 488b8ed0040000 mov rcx, qword ptr [rsi + 0x4d0]
0x145959f4b: eb0a jmp 0x145959f57
0x145959f4d: 8b51d4 mov edx, dword ptr [rcx - 0x2c]
0x145959f50: 895550 mov dword ptr [rbp + 0x50], edx
0x145959f53: 488b49cc mov rcx, qword ptr [rcx - 0x34]
0x145959f57: 48894d48 mov qword ptr [rbp + 0x48], rcx
0x145959f5b: 8b4d50 mov ecx, dword ptr [rbp + 0x50]
0x145959f5e: 894dfc mov dword ptr [rbp - 4], ecx
0x145959f61: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
0x145959f65: 48894df4 mov qword ptr [rbp - 0xc], rcx
0x145959f69: c745f001000000 mov dword ptr [rbp - 0x10], 1
0x145959f70: c745e400000000 mov dword ptr [rbp - 0x1c], 0
0x145959f77: 488d4de4 lea rcx, [rbp - 0x1c]
0x145959f7b: 48894c2430 mov qword ptr [rsp + 0x30], rcx
0x145959f80: 488d4df0 lea rcx, [rbp - 0x10]
0x145959f84: 48894c2428 mov qword ptr [rsp + 0x28], rcx
0x145959f89: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
0x145959f92: 488d4d10 lea rcx, [rbp + 0x10]
0x145959f96: 41b908000000 mov r9d, 8
0x145959f9c: 4889c2 mov rdx, rax
0x145959f9f: 41b862040000 mov r8d, 0x462
0x145959fa5: e82648f7ff call 0x1458ce7d0
0x145959faa: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
0x145959fb1: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
0x145959fb8: 750d jne 0x145959fc7
0x145959fba: 488d8e20060000 lea rcx, [rsi + 0x620]
0x145959fc1: e80a3c2b00 call 0x145c0dbd0
0x145959fc6: 90 nop
0x145959fc7: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
0x145959fce: 4889f9 mov rcx, rdi
0x145959fd1: 48c1e105 shl rcx, 5
0x145959fd5: 0f104510 movups xmm0, xmmword ptr [rbp + 0x10]
0x145959fd9: 0f104d20 movups xmm1, xmmword ptr [rbp + 0x20]
0x145959fdd: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145959fe2: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x145959fe6: 48ffc7 inc rdi
0x145959fe9: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
0x145959ff0: 488b8ed8000000 mov rcx, qword ptr [rsi + 0xd8]
0x145959ff7: 4883e901 sub rcx, 1
0x145959ffb: 0f82c1020000 jb 0x14595a2c2
0x14595a001: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
0x14595a008: 8b96e0040000 mov edx, dword ptr [rsi + 0x4e0]
0x14595a00e: 0f57f6 xorps xmm6, xmm6
0x14595a011: f3480f2af2 cvtsi2ss xmm6, rdx
0x14595a016: 4889cf mov rdi, rcx
0x14595a019: 48c1e107 shl rcx, 7
0x14595a01d: 488b440818 mov rax, qword ptr [rax + rcx + 0x18]
0x14595a022: f30f58353e734500 addss xmm6, dword ptr [rip + 0x45733e]
0x14595a02a: f30f593516cb4500 mulss xmm6, dword ptr [rip + 0x45cb16]
0x14595a032: f30f583526324500 addss xmm6, dword ptr [rip + 0x453226]
0x14595a03a: 488945d0 mov qword ptr [rbp - 0x30], rax
0x14595a03e: f30f59702c mulss xmm6, dword ptr [rax + 0x2c]
0x14595a043: f30f59b684040000 mulss xmm6, dword ptr [rsi + 0x484]
0x14595a04b: f30f1086a8040000 movss xmm0, dword ptr [rsi + 0x4a8]
0x14595a053: f30f590585744500 mulss xmm0, dword ptr [rip + 0x457485]
0x14595a05b: f30f100d459f7500 movss xmm1, dword ptr [rip + 0x759f45]
0x14595a063: 0f2ec8 ucomiss xmm1, xmm0
0x14595a066: 7325 jae 0x14595a08d
0x14595a068: f30f5805b0eb2a01 addss xmm0, dword ptr [rip + 0x12aebb0]
0x14595a070: f30f103d48744500 movss xmm7, dword ptr [rip + 0x457448]
0x14595a078: f30f5ec7 divss xmm0, xmm7
0x14595a07c: e8bc042b00 call 0x145c0a53d
0x14595a081: f30f59c7 mulss xmm0, xmm7
0x14595a085: f30f58051b9f7500 addss xmm0, dword ptr [rip + 0x759f1b]
0x14595a08d: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
0x14595a096: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
0x14595a09f: 488d4d10 lea rcx, [rbp + 0x10]
0x14595a0a3: 4c8d4548 lea r8, [rbp + 0x48]
0x14595a0a7: 4889f2 mov rdx, rsi
0x14595a0aa: 0f28d8 movaps xmm3, xmm0
0x14595a0ad: e83e12fdff call 0x14592b2f0
0x14595a0b2: 488b4510 mov rax, qword ptr [rbp + 0x10]
0x14595a0b6: 48894508 mov qword ptr [rbp + 8], rax
0x14595a0ba: 488b4518 mov rax, qword ptr [rbp + 0x18]
0x14595a0be: 48894500 mov qword ptr [rbp], rax
0x14595a0c2: 488b4520 mov rax, qword ptr [rbp + 0x20]
0x14595a0c6: 4885c0 test rax, rax
0x14595a0c9: 0f84ab010000 je 0x14595a27a
0x14595a0cf: 4889fa mov rdx, rdi
0x14595a0d2: f30f5935f2ed2a01 mulss xmm6, dword ptr [rip + 0x12aedf2]
0x14595a0da: 488b5d00 mov rbx, qword ptr [rbp]
0x14595a0de: 488d04c3 lea rax, [rbx + rax*8]
0x14595a0e2: 488945d8 mov qword ptr [rbp - 0x28], rax
0x14595a0e6: 4c8dae58010000 lea r13, [rsi + 0x158]
0x14595a0ed: f30f103d73314500 movss xmm7, dword ptr [rip + 0x453173]
0x14595a0f5: f3440f10059a0f4600 movss xmm8, dword ptr [rip + 0x460f9a]
0x14595a0fe: f3440f100d5d314500 movss xmm9, dword ptr [rip + 0x45315d]
0x14595a107: eb3b jmp 0x14595a144
0x14595a109: 0f1f8000000000 nop dword ptr [rax]
0x14595a110: f30f114514 movss dword ptr [rbp + 0x14], xmm0
0x14595a115: c7451003000000 mov dword ptr [rbp + 0x10], 3
0x14595a11c: c744242062040000 mov dword ptr [rsp + 0x20], 0x462
0x14595a124: 0f57db xorps xmm3, xmm3
0x14595a127: 4889f1 mov rcx, rsi
0x14595a12a: 4c89f2 mov rdx, r14
0x14595a12d: 4c8d4510 lea r8, [rbp + 0x10]
0x14595a131: e8ea06fdff call 0x14592a820
0x14595a136: 90 nop
0x14595a137: 483b5dd8 cmp rbx, qword ptr [rbp - 0x28]
0x14595a13b: 4c89fa mov rdx, r15
0x14595a13e: 0f8436010000 je 0x14595a27a
0x14595a144: 4c8b33 mov r14, qword ptr [rbx]
0x14595a147: 4889f1 mov rcx, rsi
0x14595a14a: 4989d7 mov r15, rdx
0x14595a14d: 0f28d6 movaps xmm2, xmm6
0x14595a150: 4d89f1 mov r9, r14
0x14595a153: e8a8200000 call 0x14595c200
0x14595a158: 90 nop
0x14595a159: 408abead010000 mov dil, byte ptr [rsi + 0x1ad]
0x14595a160: c686ad01000002 mov byte ptr [rsi + 0x1ad], 2
0x14595a167: 4c8ba688010000 mov r12, qword ptr [rsi + 0x188]
0x14595a16e: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
0x14595a172: 48898e88010000 mov qword ptr [rsi + 0x188], rcx
0x14595a179: 410f104d00 movups xmm1, xmmword ptr [r13]
0x14595a17e: 410f105510 movups xmm2, xmmword ptr [r13 + 0x10]
0x14595a183: 410f105d20 movups xmm3, xmmword ptr [r13 + 0x20]
0x14595a188: 0f295d30 movaps xmmword ptr [rbp + 0x30], xmm3
0x14595a18c: 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
0x14595a190: 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
0x14595a194: 488d15f5152b01 lea rdx, [rip + 0x12b15f5]
0x14595a19b: 48899658010000 mov qword ptr [rsi + 0x158], rdx
0x14595a1a2: 48c7866001000007000000 mov qword ptr [rsi + 0x160], 7
0x14595a1ad: 48c7866801000000000000 mov qword ptr [rsi + 0x168], 0
0x14595a1b8: 66c786800100000000 mov word ptr [rsi + 0x180], 0
0x14595a1c1: 0fb64938 movzx ecx, byte ptr [rcx + 0x38]
0x14595a1c5: 2401 and al, 1
0x14595a1c7: 88442428 mov byte ptr [rsp + 0x28], al
0x14595a1cb: 884c2420 mov byte ptr [rsp + 0x20], cl
0x14595a1cf: c644243000 mov byte ptr [rsp + 0x30], 0
0x14595a1d4: 4889f1 mov rcx, rsi
0x14595a1d7: 4c89f2 mov rdx, r14
0x14595a1da: 0f28d0 movaps xmm2, xmm0
0x14595a1dd: 41b962040000 mov r9d, 0x462
0x14595a1e3: e8a84afeff call 0x14593ec90
0x14595a1e8: 90 nop
0x14595a1e9: 4883c308 add rbx, 8
0x14595a1ed: 0f284510 movaps xmm0, xmmword ptr [rbp + 0x10]
0x14595a1f1: 0f284d20 movaps xmm1, xmmword ptr [rbp + 0x20]
0x14595a1f5: 0f285530 movaps xmm2, xmmword ptr [rbp + 0x30]
0x14595a1f9: 410f115520 movups xmmword ptr [r13 + 0x20], xmm2
0x14595a1fe: 410f114d10 movups xmmword ptr [r13 + 0x10], xmm1
0x14595a203: 410f114500 movups xmmword ptr [r13], xmm0
0x14595a208: 4c89a688010000 mov qword ptr [rsi + 0x188], r12
0x14595a20f: 4088bead010000 mov byte ptr [rsi + 0x1ad], dil
0x14595a216: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
0x14595a21d: 48699670050000d8010000 imul rdx, qword ptr [rsi + 0x570], 0x1d8
0x14595a228: 31c9 xor ecx, ecx
0x14595a22a: 4989c0 mov r8, rax
0x14595a22d: 0f1f00 nop dword ptr [rax]
0x14595a230: 4839ca cmp rdx, rcx
0x14595a233: 0f84fefeffff je 0x14595a137
0x14595a239: 4881c1d8010000 add rcx, 0x1d8
0x14595a240: 4d39b0f0000000 cmp qword ptr [r8 + 0xf0], r14
0x14595a247: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
0x14595a24e: 75e0 jne 0x14595a230
0x14595a250: 4883bc0840feffffff cmp qword ptr [rax + rcx - 0x1c0], -1
0x14595a259: 0f28c7 movaps xmm0, xmm7
0x14595a25c: 0f85aefeffff jne 0x14595a110
0x14595a262: 807c08f800 cmp byte ptr [rax + rcx - 8], 0
0x14595a267: 410f28c0 movaps xmm0, xmm8
0x14595a26b: 0f849ffeffff je 0x14595a110
0x14595a271: 410f28c1 movaps xmm0, xmm9
0x14595a275: e996feffff jmp 0x14595a110
0x14595a27a: 488b5508 mov rdx, qword ptr [rbp + 8]
0x14595a27e: 4885d2 test rdx, rdx
0x14595a281: 7413 je 0x14595a296
0x14595a283: 48c1e203 shl rdx, 3
0x14595a287: 41b808000000 mov r8d, 8
0x14595a28d: 488b4d00 mov rcx, qword ptr [rbp]
0x14595a291: e83a7f6afa call 0x1400021d0
0x14595a296: 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
0x14595a29a: 0f287d70 movaps xmm7, xmmword ptr [rbp + 0x70]
0x14595a29e: 440f288580000000 movaps xmm8, xmmword ptr [rbp + 0x80]
0x14595a2a6: 440f288d90000000 movaps xmm9, xmmword ptr [rbp + 0x90]
0x14595a2ae: 4881c428010000 add rsp, 0x128
0x14595a2b5: 5b pop rbx
0x14595a2b6: 5f pop rdi
0x14595a2b7: 5e pop rsi
0x14595a2b8: 415c pop r12
0x14595a2ba: 415d pop r13
0x14595a2bc: 415e pop r14
0x14595a2be: 415f pop r15
0x14595a2c0: 5d pop rbp
0x14595a2c1: c3 ret
0x14595a2c2: 4c8d05af142b01 lea r8, [rip + 0x12b14af]
0x14595a2c9: 31d2 xor edx, edx
0x14595a2cb: e8b3f54400 call 0x145da9883
0x14595a2d0: 0f0b ud2
