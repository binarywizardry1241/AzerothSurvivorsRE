140078c10: 55 push rbp
140078c11: 4157 push r15
140078c13: 4156 push r14
140078c15: 4155 push r13
140078c17: 4154 push r12
140078c19: 56 push rsi
140078c1a: 57 push rdi
140078c1b: 53 push rbx
140078c1c: 4881ecf8020000 sub rsp, 0x2f8
140078c23: 488dac2480000000 lea rbp, [rsp + 0x80]
140078c2b: 0f29b560020000 movaps xmmword ptr [rbp + 0x260], xmm6
140078c32: 48c78558020000feffffff mov qword ptr [rbp + 0x258], 0xfffffffffffffffe
140078c3d: 4c8ba508030000 mov r12, qword ptr [rbp + 0x308]
140078c44: 488b85e8020000 mov rax, qword ptr [rbp + 0x2e8]
140078c4b: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
140078c52: 4c8b9518030000 mov r10, qword ptr [rbp + 0x318]
140078c59: 4c8b9d10030000 mov r11, qword ptr [rbp + 0x310]
140078c60: 488bb500030000 mov rsi, qword ptr [rbp + 0x300]
140078c67: 488bbdf8020000 mov rdi, qword ptr [rbp + 0x2f8]
140078c6e: 488b9df0020000 mov rbx, qword ptr [rbp + 0x2f0]
140078c75: 4c8bb5e0020000 mov r14, qword ptr [rbp + 0x2e0]
140078c7c: 4c8b7a20 mov r15, qword ptr [rdx + 0x20]
140078c80: 4c897df0 mov qword ptr [rbp - 0x10], r15
140078c84: 0f1002 movups xmm0, xmmword ptr [rdx]
140078c87: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140078c8b: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
140078c8f: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
140078c93: 410f1000 movups xmm0, xmmword ptr [r8]
140078c97: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
140078c9c: 0f114d08 movups xmmword ptr [rbp + 8], xmm1
140078ca0: 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
140078ca4: 410f1001 movups xmm0, xmmword ptr [r9]
140078ca8: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
140078cad: 0f114d28 movups xmmword ptr [rbp + 0x28], xmm1
140078cb1: 0f114518 movups xmmword ptr [rbp + 0x18], xmm0
140078cb5: 410f1006 movups xmm0, xmmword ptr [r14]
140078cb9: 410f104e10 movups xmm1, xmmword ptr [r14 + 0x10]
140078cbe: 0f114d48 movups xmmword ptr [rbp + 0x48], xmm1
140078cc2: 0f114538 movups xmmword ptr [rbp + 0x38], xmm0
140078cc6: 0f1000 movups xmm0, xmmword ptr [rax]
140078cc9: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140078ccd: 0f118df8000000 movups xmmword ptr [rbp + 0xf8], xmm1
140078cd4: 0f1185e8000000 movups xmmword ptr [rbp + 0xe8], xmm0
140078cdb: 0f1003 movups xmm0, xmmword ptr [rbx]
140078cde: 0f104b10 movups xmm1, xmmword ptr [rbx + 0x10]
140078ce2: 0f114558 movups xmmword ptr [rbp + 0x58], xmm0
140078ce6: 0f114d68 movups xmmword ptr [rbp + 0x68], xmm1
140078cea: 0f1007 movups xmm0, xmmword ptr [rdi]
140078ced: 0f114578 movups xmmword ptr [rbp + 0x78], xmm0
140078cf1: 488b5710 mov rdx, qword ptr [rdi + 0x10]
140078cf5: 48899588000000 mov qword ptr [rbp + 0x88], rdx
140078cfc: 488b5610 mov rdx, qword ptr [rsi + 0x10]
140078d00: 488995a0000000 mov qword ptr [rbp + 0xa0], rdx
140078d07: 0f1006 movups xmm0, xmmword ptr [rsi]
140078d0a: 0f298590000000 movaps xmmword ptr [rbp + 0x90], xmm0
140078d11: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
140078d18: 410f1003 movups xmm0, xmmword ptr [r11]
140078d1c: 410f104b10 movups xmm1, xmmword ptr [r11 + 0x10]
140078d21: 0f298dc0000000 movaps xmmword ptr [rbp + 0xc0], xmm1
140078d28: 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
140078d2f: 410f1002 movups xmm0, xmmword ptr [r10]
140078d33: 0f2985d0000000 movaps xmmword ptr [rbp + 0xd0], xmm0
140078d3a: 498b5210 mov rdx, qword ptr [r10 + 0x10]
140078d3e: 488995e0000000 mov qword ptr [rbp + 0xe0], rdx
140078d45: 0f1001 movups xmm0, xmmword ptr [rcx]
140078d48: 0f118508010000 movups xmmword ptr [rbp + 0x108], xmm0
140078d4f: 488b4910 mov rcx, qword ptr [rcx + 0x10]
140078d53: 48898d18010000 mov qword ptr [rbp + 0x118], rcx
140078d5a: 4883bde800000000 cmp qword ptr [rbp + 0xe8], 0
140078d62: 0f84dc090000 je 0x140079744
140078d68: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
140078d6c: 48898d28020000 mov qword ptr [rbp + 0x228], rcx
140078d73: 0f1000 movups xmm0, xmmword ptr [rax]
140078d76: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140078d7a: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
140078d7e: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
140078d82: 4c8b4d78 mov r9, qword ptr [rbp + 0x78]
140078d86: 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
140078d8d: 4d8b81f8000000 mov r8, qword ptr [r9 + 0xf8]
140078d94: 498b8100010000 mov rax, qword ptr [r9 + 0x100]
140078d9b: 498d1480 lea rdx, [r8 + rax*4]
140078d9f: 4c898d10020000 mov qword ptr [rbp + 0x210], r9
140078da6: 410fb68108010000 movzx eax, byte ptr [r9 + 0x108]
140078dae: 888518020000 mov byte ptr [rbp + 0x218], al
140078db4: 84c0 test al, al
140078db6: 0f8411010000 je 0x140078ecd
140078dbc: 4531c9 xor r9d, r9d
140078dbf: 41bd08000000 mov r13d, 8
140078dc5: 4531e4 xor r12d, r12d
140078dc8: 31c0 xor eax, eax
140078dca: 31ff xor edi, edi
140078dcc: 4531d2 xor r10d, r10d
140078dcf: 4889b548020000 mov qword ptr [rbp + 0x248], rsi
140078dd6: 4139fa cmp r10d, edi
140078dd9: 7572 jne 0x140078e4d
140078ddb: 0f1f440000 nop dword ptr [rax + rax]
140078de0: 4939d0 cmp r8, rdx
140078de3: 0f843b020000 je 0x140079024
140078de9: 458b10 mov r10d, dword ptr [r8]
140078dec: 4983c004 add r8, 4
140078df0: 488b81a8010000 mov rax, qword ptr [rcx + 0x1a8]
140078df7: 4f8d14d2 lea r10, [r10 + r10*8]
140078dfb: 4a8b74d010 mov rsi, qword ptr [rax + r10*8 + 0x10]
140078e00: 4885f6 test rsi, rsi
140078e03: 74db je 0x140078de0
140078e05: 4a8d3cd0 lea rdi, [rax + r10*8]
140078e09: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
140078e10: 488b8010010000 mov rax, qword ptr [rax + 0x110]
140078e17: 4531d2 xor r10d, r10d
140078e1a: 483b4740 cmp rax, qword ptr [rdi + 0x40]
140078e1e: 7325 jae 0x140078e45
140078e20: 488b5f38 mov rbx, qword ptr [rdi + 0x38]
140078e24: 488b04c3 mov rax, qword ptr [rbx + rax*8]
140078e28: 4885c0 test rax, rax
140078e2b: 7418 je 0x140078e45
140078e2d: 488b5f18 mov rbx, qword ptr [rdi + 0x18]
140078e31: 48f7d0 not rax
140078e34: 488d0440 lea rax, [rax + rax*2]
140078e38: 48c1e004 shl rax, 4
140078e3c: 4c8b640310 mov r12, qword ptr [rbx + rax + 0x10]
140078e41: b001 mov al, 1
140078e43: eb02 jmp 0x140078e47
140078e45: 31c0 xor eax, eax
140078e47: 4c8b6f08 mov r13, qword ptr [rdi + 8]
140078e4b: 89f7 mov edi, esi
140078e4d: 4489d6 mov esi, r10d
140078e50: 41ffc2 inc r10d
140078e53: 4d8b5cf500 mov r11, qword ptr [r13 + rsi*8]
140078e58: 488d3476 lea rsi, [rsi + rsi*2]
140078e5c: 498d34f4 lea rsi, [r12 + rsi*8]
140078e60: a801 test al, 1
140078e62: 490f44f1 cmove rsi, r9
140078e66: 4c89db mov rbx, r11
140078e69: 48c1eb20 shr rbx, 0x20
140078e6d: 4585db test r11d, r11d
140078e70: 0f449d48020000 cmove ebx, dword ptr [rbp + 0x248]
140078e77: 490f44f7 cmove rsi, r15
140078e7b: 4189df mov r15d, ebx
140078e7e: 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
140078e85: 4989f7 mov r15, rsi
140078e88: 0f8448ffffff je 0x140078dd6
140078e8e: 4189df mov r15d, ebx
140078e91: 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
140078e98: 4989f7 mov r15, rsi
140078e9b: 0f8435ffffff je 0x140078dd6
140078ea1: 4d89de mov r14, r11
140078ea4: 41bc08000000 mov r12d, 8
140078eaa: 48899d48020000 mov qword ptr [rbp + 0x248], rbx
140078eb1: 4989f7 mov r15, rsi
140078eb4: 488b9d08030000 mov rbx, qword ptr [rbp + 0x308]
140078ebb: 80bd1802000000 cmp byte ptr [rbp + 0x218], 0
140078ec2: 0f85c7010000 jne 0x14007908f
140078ec8: e990010000 jmp 0x14007905d
140078ecd: 4c89e3 mov rbx, r12
140078ed0: 41bc08000000 mov r12d, 8
140078ed6: 4531ed xor r13d, r13d
140078ed9: 31c0 xor eax, eax
140078edb: 31ff xor edi, edi
140078edd: 4531d2 xor r10d, r10d
140078ee0: 4889b548020000 mov qword ptr [rbp + 0x248], rsi
140078ee7: 4139fa cmp r10d, edi
140078eea: 0f85aa000000 jne 0x140078f9a
140078ef0: 4939d0 cmp r8, rdx
140078ef3: 0f844c010000 je 0x140079045
140078ef9: 418b00 mov eax, dword ptr [r8]
140078efc: 4983c004 add r8, 4
140078f00: 488bb108010000 mov rsi, qword ptr [rcx + 0x108]
140078f07: 488d0480 lea rax, [rax + rax*4]
140078f0b: 48c1e005 shl rax, 5
140078f0f: 4c8b740658 mov r14, qword ptr [rsi + rax + 0x58]
140078f14: 4d85f6 test r14, r14
140078f17: 74d7 je 0x140078ef0
140078f19: 4801c6 add rsi, rax
140078f1c: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
140078f23: 488bb810010000 mov rdi, qword ptr [rax + 0x110]
140078f2a: 4531d2 xor r10d, r10d
140078f2d: 483bbe88000000 cmp rdi, qword ptr [rsi + 0x88]
140078f34: 734f jae 0x140078f85
140078f36: 488b8680000000 mov rax, qword ptr [rsi + 0x80]
140078f3d: 48833cf800 cmp qword ptr [rax + rdi*8], 0
140078f42: 7441 je 0x140078f85
140078f44: 8b8694000000 mov eax, dword ptr [rsi + 0x94]
140078f4a: 488b99a8010000 mov rbx, qword ptr [rcx + 0x1a8]
140078f51: 4c8d24c0 lea r12, [rax + rax*8]
140078f55: b001 mov al, 1
140078f57: 4a3b7ce340 cmp rdi, qword ptr [rbx + r12*8 + 0x40]
140078f5c: 732b jae 0x140078f89
140078f5e: 4a8d1ce3 lea rbx, [rbx + r12*8]
140078f62: 4c8b6338 mov r12, qword ptr [rbx + 0x38]
140078f66: 498b3cfc mov rdi, qword ptr [r12 + rdi*8]
140078f6a: 4885ff test rdi, rdi
140078f6d: 741a je 0x140078f89
140078f6f: 488b5b18 mov rbx, qword ptr [rbx + 0x18]
140078f73: 48f7d7 not rdi
140078f76: 488d3c7f lea rdi, [rdi + rdi*2]
140078f7a: 48c1e704 shl rdi, 4
140078f7e: 4c8b6c3b10 mov r13, qword ptr [rbx + rdi + 0x10]
140078f83: eb07 jmp 0x140078f8c
140078f85: 31c0 xor eax, eax
140078f87: eb0a jmp 0x140078f93
140078f89: 4531ed xor r13d, r13d
140078f8c: 488b9d08030000 mov rbx, qword ptr [rbp + 0x308]
140078f93: 4c8b6650 mov r12, qword ptr [rsi + 0x50]
140078f97: 4489f7 mov edi, r14d
140078f9a: 4489d6 mov esi, r10d
140078f9d: 48c1e604 shl rsi, 4
140078fa1: 41ffc2 inc r10d
140078fa4: 4d8b1c34 mov r11, qword ptr [r12 + rsi]
140078fa8: 418b743408 mov esi, dword ptr [r12 + rsi + 8]
140078fad: f7d6 not esi
140078faf: 488d3476 lea rsi, [rsi + rsi*2]
140078fb3: 488d34f500000000 lea rsi, [rsi*8]
140078fbb: 4c01ee add rsi, r13
140078fbe: a801 test al, 1
140078fc0: 41b900000000 mov r9d, 0
140078fc6: 490f44f1 cmove rsi, r9
140078fca: 4d89de mov r14, r11
140078fcd: 49c1ee20 shr r14, 0x20
140078fd1: 4585db test r11d, r11d
140078fd4: 440f44b548020000 cmove r14d, dword ptr [rbp + 0x248]
140078fdc: 490f44f7 cmove rsi, r15
140078fe0: 4589f7 mov r15d, r14d
140078fe3: 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
140078fea: 4989f7 mov r15, rsi
140078fed: 0f84f4feffff je 0x140078ee7
140078ff3: 4589f7 mov r15d, r14d
140078ff6: 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
140078ffd: 4989f7 mov r15, rsi
140079000: 0f84e1feffff je 0x140078ee7
140079006: 41bd08000000 mov r13d, 8
14007900c: 4c89b548020000 mov qword ptr [rbp + 0x248], r14
140079013: 4989f7 mov r15, rsi
140079016: 4d89de mov r14, r11
140079019: 80bd1802000000 cmp byte ptr [rbp + 0x218], 0
140079020: 756d jne 0x14007908f
140079022: eb39 jmp 0x14007905d
140079024: 4531f6 xor r14d, r14d
140079027: 41bc08000000 mov r12d, 8
14007902d: 4989d0 mov r8, rdx
140079030: 4189fa mov r10d, edi
140079033: 488b9d08030000 mov rbx, qword ptr [rbp + 0x308]
14007903a: 80bd1802000000 cmp byte ptr [rbp + 0x218], 0
140079041: 754c jne 0x14007908f
140079043: eb18 jmp 0x14007905d
140079045: 4531f6 xor r14d, r14d
140079048: 41bd08000000 mov r13d, 8
14007904e: 4989d0 mov r8, rdx
140079051: 4189fa mov r10d, edi
140079054: 80bd1802000000 cmp byte ptr [rbp + 0x218], 0
14007905b: 7532 jne 0x14007908f
14007905d: 4c8b8d10020000 mov r9, qword ptr [rbp + 0x210]
140079064: e992000000 jmp 0x1400790fb
140079069: 0f1f8000000000 nop dword ptr [rax]
140079070: 4a8d04c8 lea rax, [rax + r9*8]
140079074: 4c8b6808 mov r13, qword ptr [rax + 8]
140079078: 4531d2 xor r10d, r10d
14007907b: 4489d0 mov eax, r10d
14007907e: 41ffc2 inc r10d
140079081: 418b44c500 mov eax, dword ptr [r13 + rax*8]
140079086: 4885c0 test rax, rax
140079089: 0f859a000000 jne 0x140079129
14007908f: 4139fa cmp r10d, edi
140079092: 75e7 jne 0x14007907b
140079094: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400790a0: 4939d0 cmp r8, rdx
1400790a3: 0f847e000000 je 0x140079127
1400790a9: 458b08 mov r9d, dword ptr [r8]
1400790ac: 4983c004 add r8, 4
1400790b0: 488b81a8010000 mov rax, qword ptr [rcx + 0x1a8]
1400790b7: 4f8d0cc9 lea r9, [r9 + r9*8]
1400790bb: 4a8b7cc810 mov rdi, qword ptr [rax + r9*8 + 0x10]
1400790c0: 4885ff test rdi, rdi
1400790c3: 74db je 0x1400790a0
1400790c5: eba9 jmp 0x140079070
1400790c7: 660f1f840000000000 nop word ptr [rax + rax]
1400790d0: 4c01d0 add rax, r10
1400790d3: 4d8b9110010000 mov r10, qword ptr [r9 + 0x110]
1400790da: 4c3b9088000000 cmp r10, qword ptr [rax + 0x88]
1400790e1: 4c8b6050 mov r12, qword ptr [rax + 0x50]
1400790e5: 4531d2 xor r10d, r10d
1400790e8: 4489d0 mov eax, r10d
1400790eb: 48c1e004 shl rax, 4
1400790ef: 41ffc2 inc r10d
1400790f2: 418b0404 mov eax, dword ptr [r12 + rax]
1400790f6: 4885c0 test rax, rax
1400790f9: 752e jne 0x140079129
1400790fb: 4139fa cmp r10d, edi
1400790fe: 75e8 jne 0x1400790e8
140079100: 4939d0 cmp r8, rdx
140079103: 7422 je 0x140079127
140079105: 458b10 mov r10d, dword ptr [r8]
140079108: 4983c004 add r8, 4
14007910c: 488b8108010000 mov rax, qword ptr [rcx + 0x108]
140079113: 4f8d1492 lea r10, [r10 + r10*4]
140079117: 49c1e205 shl r10, 5
14007911b: 4a8b7c1058 mov rdi, qword ptr [rax + r10 + 0x58]
140079120: 4885ff test rdi, rdi
140079123: 74db je 0x140079100
140079125: eba9 jmp 0x1400790d0
140079127: 31c0 xor eax, eax
140079129: 4585f6 test r14d, r14d
14007912c: 0f840d050000 je 0x14007963f
140079132: 4885c0 test rax, rax
140079135: 0f8504050000 jne 0x14007963f
14007913b: 4c89b510020000 mov qword ptr [rbp + 0x210], r14
140079142: 488b8528020000 mov rax, qword ptr [rbp + 0x228]
140079149: 408a38 mov dil, byte ptr [rax]
14007914c: 4088bd47020000 mov byte ptr [rbp + 0x247], dil
140079153: 4c8b65f8 mov r12, qword ptr [rbp - 8]
140079157: 458a742438 mov r14b, byte ptr [r12 + 0x38]
14007915c: 458a6c2439 mov r13b, byte ptr [r12 + 0x39]
140079161: 418a74243a mov sil, byte ptr [r12 + 0x3a]
140079166: 488d8de8010000 lea rcx, [rbp + 0x1e8]
14007916d: 4c89e2 mov rdx, r12
140079170: e87b41b505 call 0x145bcd2f0
140079175: 498d542418 lea rdx, [r12 + 0x18]
14007917a: 488d8d78010000 lea rcx, [rbp + 0x178]
140079181: e86a41b505 call 0x145bcd2f0
140079186: 90 nop
140079187: 4c89e1 mov rcx, r12
14007918a: 4d8b642430 mov r12, qword ptr [r12 + 0x30]
14007918f: 488b85f8010000 mov rax, qword ptr [rbp + 0x1f8]
140079196: 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
14007919d: 0f1085e8010000 movups xmm0, xmmword ptr [rbp + 0x1e8]
1400791a4: 0f2985a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm0
1400791ab: 488b8588010000 mov rax, qword ptr [rbp + 0x188]
1400791b2: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
1400791b9: 0f108d78010000 movups xmm1, xmmword ptr [rbp + 0x178]
1400791c0: 0f118db8010000 movups xmmword ptr [rbp + 0x1b8], xmm1
1400791c7: 0f298530010000 movaps xmmword ptr [rbp + 0x130], xmm0
1400791ce: 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
1400791d5: 48898550010000 mov qword ptr [rbp + 0x150], rax
1400791dc: 488b85c8010000 mov rax, qword ptr [rbp + 0x1c8]
1400791e3: 48898558010000 mov qword ptr [rbp + 0x158], rax
1400791ea: 488b85b0010000 mov rax, qword ptr [rbp + 0x1b0]
1400791f1: 48898540010000 mov qword ptr [rbp + 0x140], rax
1400791f8: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
1400791ff: 48898548010000 mov qword ptr [rbp + 0x148], rax
140079206: 4c89a560010000 mov qword ptr [rbp + 0x160], r12
14007920d: 4488b568010000 mov byte ptr [rbp + 0x168], r14b
140079214: 4488ad69010000 mov byte ptr [rbp + 0x169], r13b
14007921b: 4088b56a010000 mov byte ptr [rbp + 0x16a], sil
140079222: 0fb6413f movzx eax, byte ptr [rcx + 0x3f]
140079226: 88856f010000 mov byte ptr [rbp + 0x16f], al
14007922c: 48898d00020000 mov qword ptr [rbp + 0x200], rcx
140079233: 8b413b mov eax, dword ptr [rcx + 0x3b]
140079236: 89856b010000 mov dword ptr [rbp + 0x16b], eax
14007923c: 4088bd70010000 mov byte ptr [rbp + 0x170], dil
140079243: 4d85ff test r15, r15
140079246: 0f8490000000 je 0x1400792dc
14007924c: 49837f1000 cmp qword ptr [r15 + 0x10], 0
140079251: 0f8485000000 je 0x1400792dc
140079257: 4c8b3b mov r15, qword ptr [rbx]
14007925a: 4983ffff cmp r15, -1
14007925e: 7458 je 0x1400792b8
140079260: 44387338 cmp byte ptr [rbx + 0x38], r14b
140079264: 7552 jne 0x1400792b8
140079266: 44386b39 cmp byte ptr [rbx + 0x39], r13b
14007926a: 754c jne 0x1400792b8
14007926c: 4038733a cmp byte ptr [rbx + 0x3a], sil
140079270: 7546 jne 0x1400792b8
140079272: 4c8b4310 mov r8, qword ptr [rbx + 0x10]
140079276: 4c3b8540010000 cmp r8, qword ptr [rbp + 0x140]
14007927d: 7539 jne 0x1400792b8
14007927f: 488b9538010000 mov rdx, qword ptr [rbp + 0x138]
140079286: 488b4b08 mov rcx, qword ptr [rbx + 8]
14007928a: e8520eb805 call 0x145bfa0e1
14007928f: 85c0 test eax, eax
140079291: 7525 jne 0x1400792b8
140079293: 4c8b4328 mov r8, qword ptr [rbx + 0x28]
140079297: 4c3b8558010000 cmp r8, qword ptr [rbp + 0x158]
14007929e: 7518 jne 0x1400792b8
1400792a0: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
1400792a7: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
1400792ab: e8310eb805 call 0x145bfa0e1
1400792b0: 85c0 test eax, eax
1400792b2: 0f84030c0000 je 0x140079ebb
1400792b8: 488b4528 mov rax, qword ptr [rbp + 0x28]
1400792bc: 8b4d34 mov ecx, dword ptr [rbp + 0x34]
1400792bf: 89ca mov edx, ecx
1400792c1: 2b10 sub edx, dword ptr [rax]
1400792c3: 2b4d30 sub ecx, dword ptr [rbp + 0x30]
1400792c6: 81f900b033c2 cmp ecx, 0xc233b000
1400792cc: b800b033c2 mov eax, 0xc233b000
1400792d1: 0f42c1 cmovb eax, ecx
1400792d4: 39c2 cmp edx, eax
1400792d6: 0f8383040000 jae 0x14007975f
1400792dc: 8bb510020000 mov esi, dword ptr [rbp + 0x210]
1400792e2: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
1400792e9: 48c1e720 shl rdi, 0x20
1400792ed: 488b13 mov rdx, qword ptr [rbx]
1400792f0: 4883faff cmp rdx, -1
1400792f4: 742c je 0x140079322
1400792f6: 4885d2 test rdx, rdx
1400792f9: 740f je 0x14007930a
1400792fb: 488b4b08 mov rcx, qword ptr [rbx + 8]
1400792ff: 41b801000000 mov r8d, 1
140079305: e8c68ef8ff call 0x1400021d0
14007930a: 488b5318 mov rdx, qword ptr [rbx + 0x18]
14007930e: 4885d2 test rdx, rdx
140079311: 740f je 0x140079322
140079313: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
140079317: 41b801000000 mov r8d, 1
14007931d: e8ae8ef8ff call 0x1400021d0
140079322: 4809f7 or rdi, rsi
140079325: 4889bd48020000 mov qword ptr [rbp + 0x248], rdi
14007932c: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
140079333: 48894340 mov qword ptr [rbx + 0x40], rax
140079337: 0f288530010000 movaps xmm0, xmmword ptr [rbp + 0x130]
14007933e: 0f288d40010000 movaps xmm1, xmmword ptr [rbp + 0x140]
140079345: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
14007934c: 0f289d60010000 movaps xmm3, xmmword ptr [rbp + 0x160]
140079353: 0f115b30 movups xmmword ptr [rbx + 0x30], xmm3
140079357: 0f115320 movups xmmword ptr [rbx + 0x20], xmm2
14007935b: 0f114b10 movups xmmword ptr [rbx + 0x10], xmm1
14007935f: 0f1103 movups xmmword ptr [rbx], xmm0
140079362: 8b85cc000000 mov eax, dword ptr [rbp + 0xcc]
140079368: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
14007936f: 8901 mov dword ptr [rcx], eax
140079371: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
140079378: c60001 mov byte ptr [rax], 1
14007937b: 4c8bb598000000 mov r14, qword ptr [rbp + 0x98]
140079382: 488b4558 mov rax, qword ptr [rbp + 0x58]
140079386: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
14007938d: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
140079394: 8b85a4000000 mov eax, dword ptr [rbp + 0xa4]
14007939a: 898508020000 mov dword ptr [rbp + 0x208], eax
1400793a0: 488bb9f8000000 mov rdi, qword ptr [rcx + 0xf8]
1400793a7: 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400793ae: 4c8d3c87 lea r15, [rdi + rax*4]
1400793b2: 48898d38020000 mov qword ptr [rbp + 0x238], rcx
1400793b9: 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400793c0: 888518020000 mov byte ptr [rbp + 0x218], al
1400793c6: 4531e4 xor r12d, r12d
1400793c9: b808000000 mov eax, 8
1400793ce: 48898520020000 mov qword ptr [rbp + 0x220], rax
1400793d5: 48c7852802000000000000 mov qword ptr [rbp + 0x228], 0
1400793e0: 31db xor ebx, ebx
1400793e2: eb2a jmp 0x14007940e
1400793e4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400793f0: ffc3 inc ebx
1400793f2: 488b85f8010000 mov rax, qword ptr [rbp + 0x1f8]
1400793f9: 488b8d10020000 mov rcx, qword ptr [rbp + 0x210]
140079400: 48894110 mov qword ptr [rcx + 0x10], rax
140079404: 0f1085e8010000 movups xmm0, xmmword ptr [rbp + 0x1e8]
14007940b: 0f1101 movups xmmword ptr [rcx], xmm0
14007940e: 80bd1802000000 cmp byte ptr [rbp + 0x218], 0
140079415: 7479 je 0x140079490
140079417: 4439e3 cmp ebx, r12d
14007941a: 756b jne 0x140079487
14007941c: 0f1f4000 nop dword ptr [rax]
140079420: 4c39ff cmp rdi, r15
140079423: 0f8457020000 je 0x140079680
140079429: 8b0f mov ecx, dword ptr [rdi]
14007942b: 4883c704 add rdi, 4
14007942f: 498b86a8010000 mov rax, qword ptr [r14 + 0x1a8]
140079436: 488d0cc9 lea rcx, [rcx + rcx*8]
14007943a: 4c8b64c810 mov r12, qword ptr [rax + rcx*8 + 0x10]
14007943f: 4d85e4 test r12, r12
140079442: 74dc je 0x140079420
140079444: 488d04c8 lea rax, [rax + rcx*8]
140079448: 488b8d38020000 mov rcx, qword ptr [rbp + 0x238]
14007944f: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
140079456: 488b5018 mov rdx, qword ptr [rax + 0x18]
14007945a: 488b4038 mov rax, qword ptr [rax + 0x38]
14007945e: 488b04c8 mov rax, qword ptr [rax + rcx*8]
140079462: 48f7d0 not rax
140079465: 488d0440 lea rax, [rax + rax*2]
140079469: 48c1e004 shl rax, 4
14007946d: 488b4c0210 mov rcx, qword ptr [rdx + rax + 0x10]
140079472: 48898d28020000 mov qword ptr [rbp + 0x228], rcx
140079479: 488b440228 mov rax, qword ptr [rdx + rax + 0x28]
14007947e: 48898530020000 mov qword ptr [rbp + 0x230], rax
140079485: 31db xor ebx, ebx
140079487: 89d8 mov eax, ebx
140079489: e9ad000000 jmp 0x14007953b
14007948e: 6690 nop
140079490: 4439e3 cmp ebx, r12d
140079493: 0f858f000000 jne 0x140079528
140079499: 0f1f8000000000 nop dword ptr [rax]
1400794a0: 4c39ff cmp rdi, r15
1400794a3: 0f84d7010000 je 0x140079680
1400794a9: 8b0f mov ecx, dword ptr [rdi]
1400794ab: 4883c704 add rdi, 4
1400794af: 498b8608010000 mov rax, qword ptr [r14 + 0x108]
1400794b6: 488d0c89 lea rcx, [rcx + rcx*4]
1400794ba: 48c1e105 shl rcx, 5
1400794be: 4c8b640858 mov r12, qword ptr [rax + rcx + 0x58]
1400794c3: 4d85e4 test r12, r12
1400794c6: 74d8 je 0x1400794a0
1400794c8: 4801c8 add rax, rcx
1400794cb: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400794d1: 498b96a8010000 mov rdx, qword ptr [r14 + 0x1a8]
1400794d8: 488d0cc9 lea rcx, [rcx + rcx*8]
1400794dc: 4c8b8538020000 mov r8, qword ptr [rbp + 0x238]
1400794e3: 4d8b8010010000 mov r8, qword ptr [r8 + 0x110]
1400794ea: 4c8b4cca18 mov r9, qword ptr [rdx + rcx*8 + 0x18]
1400794ef: 488b4cca38 mov rcx, qword ptr [rdx + rcx*8 + 0x38]
1400794f4: 4a8b0cc1 mov rcx, qword ptr [rcx + r8*8]
1400794f8: 48f7d1 not rcx
1400794fb: 488d0c49 lea rcx, [rcx + rcx*2]
1400794ff: 48c1e104 shl rcx, 4
140079503: 498b540910 mov rdx, qword ptr [r9 + rcx + 0x10]
140079508: 48899528020000 mov qword ptr [rbp + 0x228], rdx
14007950f: 498b4c0928 mov rcx, qword ptr [r9 + rcx + 0x28]
140079514: 48898d30020000 mov qword ptr [rbp + 0x230], rcx
14007951b: 488b4050 mov rax, qword ptr [rax + 0x50]
14007951f: 48898520020000 mov qword ptr [rbp + 0x220], rax
140079526: 31db xor ebx, ebx
140079528: 89d8 mov eax, ebx
14007952a: 48c1e004 shl rax, 4
14007952e: 488b8d20020000 mov rcx, qword ptr [rbp + 0x220]
140079535: 8b440108 mov eax, dword ptr [rcx + rax + 8]
140079539: f7d0 not eax
14007953b: 4889c1 mov rcx, rax
14007953e: 48c1e107 shl rcx, 7
140079542: 4c8d2cc1 lea r13, [rcx + rax*8]
140079546: 4c03ad28020000 add r13, qword ptr [rbp + 0x228]
14007954d: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
140079554: 488d3481 lea rsi, [rcx + rax*4]
140079558: 488b8500020000 mov rax, qword ptr [rbp + 0x200]
14007955f: 488b4820 mov rcx, qword ptr [rax + 0x20]
140079563: 488b5028 mov rdx, qword ptr [rax + 0x28]
140079567: c6855702000000 mov byte ptr [rbp + 0x257], 0
14007956e: e88d3c8105 call 0x14588d200
140079573: 90 nop
140079574: 480598000000 add rax, 0x98
14007957a: 488985a0010000 mov qword ptr [rbp + 0x1a0], rax
140079581: 488d05388bf8ff lea rax, [rip - 0x774c8]
140079588: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
14007958f: c6855702000000 mov byte ptr [rbp + 0x257], 0
140079596: 488d8d78010000 lea rcx, [rbp + 0x178]
14007959d: 488d159e58d505 lea rdx, [rip + 0x5d5589e]
1400795a4: 4c8d85a0010000 lea r8, [rbp + 0x1a0]
1400795ab: e88038b505 call 0x145bcce30
1400795b0: 90 nop
1400795b1: 488b8588010000 mov rax, qword ptr [rbp + 0x188]
1400795b8: 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
1400795bf: 0f108578010000 movups xmm0, xmmword ptr [rbp + 0x178]
1400795c6: 0f2985a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm0
1400795cd: c6855702000000 mov byte ptr [rbp + 0x257], 0
1400795d4: 488d057df6d505 lea rax, [rip + 0x5d5f67d]
1400795db: 4889442420 mov qword ptr [rsp + 0x20], rax
1400795e0: 41b901000000 mov r9d, 1
1400795e6: 488d8de8010000 lea rcx, [rbp + 0x1e8]
1400795ed: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
1400795f4: 4c8d85a0010000 lea r8, [rbp + 0x1a0]
1400795fb: e8f0c90a00 call 0x140125ff0
140079600: 90 nop
140079601: 8b8508020000 mov eax, dword ptr [rbp + 0x208]
140079607: 8906 mov dword ptr [rsi], eax
140079609: 498d4520 lea rax, [r13 + 0x20]
14007960d: 48898510020000 mov qword ptr [rbp + 0x210], rax
140079614: 41807d2000 cmp byte ptr [r13 + 0x20], 0
140079619: 0f85d1fdffff jne 0x1400793f0
14007961f: 498b4528 mov rax, qword ptr [r13 + 0x28]
140079623: f048ff08 lock dec qword ptr [rax]
140079627: 0f85c3fdffff jne 0x1400793f0
14007962d: 4983c528 add r13, 0x28
140079631: 4c89e9 mov rcx, r13
140079634: e837bb9004 call 0x144985170
140079639: 90 nop
14007963a: e9b1fdffff jmp 0x1400793f0
14007963f: 488b13 mov rdx, qword ptr [rbx]
140079642: 4883faff cmp rdx, -1
140079646: 742c je 0x140079674
140079648: 4885d2 test rdx, rdx
14007964b: 740f je 0x14007965c
14007964d: 488b4b08 mov rcx, qword ptr [rbx + 8]
140079651: 41b801000000 mov r8d, 1
140079657: e8748bf8ff call 0x1400021d0
14007965c: 488b5318 mov rdx, qword ptr [rbx + 0x18]
140079660: 4885d2 test rdx, rdx
140079663: 740f je 0x140079674
140079665: 488b4b20 mov rcx, qword ptr [rbx + 0x20]
140079669: 41b801000000 mov r8d, 1
14007966f: e85c8bf8ff call 0x1400021d0
140079674: 48c703ffffffff mov qword ptr [rbx], 0xffffffffffffffff
14007967b: e9c4000000 jmp 0x140079744
140079680: 488b75e0 mov rsi, qword ptr [rbp - 0x20]
140079684: 4885f6 test rsi, rsi
140079687: 7504 jne 0x14007968d
140079689: 488b75e8 mov rsi, qword ptr [rbp - 0x18]
14007968d: 0f2875d0 movaps xmm6, xmmword ptr [rbp - 0x30]
140079691: 488b06 mov rax, qword ptr [rsi]
140079694: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
140079698: 4829f8 sub rax, rdi
14007969b: 4883f80f cmp rax, 0xf
14007969f: 0f868a080000 jbe 0x140079f2f
1400796a5: 488d45e0 lea rax, [rbp - 0x20]
1400796a9: 488b4e08 mov rcx, qword ptr [rsi + 8]
1400796ad: 488d154c662000 lea rdx, [rip + 0x20664c]
1400796b4: 48891439 mov qword ptr [rcx + rdi], rdx
1400796b8: 488b9548020000 mov rdx, qword ptr [rbp + 0x248]
1400796bf: 4889543908 mov qword ptr [rcx + rdi + 8], rdx
1400796c4: 4883c710 add rdi, 0x10
1400796c8: 48897e10 mov qword ptr [rsi + 0x10], rdi
1400796cc: 488b4810 mov rcx, qword ptr [rax + 0x10]
1400796d0: 48898dc8010000 mov qword ptr [rbp + 0x1c8], rcx
1400796d7: 0f1000 movups xmm0, xmmword ptr [rax]
1400796da: 0f1185b8010000 movups xmmword ptr [rbp + 0x1b8], xmm0
1400796e1: 488995a0010000 mov qword ptr [rbp + 0x1a0], rdx
1400796e8: 0f11b5a8010000 movups xmmword ptr [rbp + 0x1a8], xmm6
1400796ef: 488d45b0 lea rax, [rbp - 0x50]
1400796f3: 48898578010000 mov qword ptr [rbp + 0x178], rax
1400796fa: 488d45f8 lea rax, [rbp - 8]
1400796fe: 48898580010000 mov qword ptr [rbp + 0x180], rax
140079705: 488d4518 lea rax, [rbp + 0x18]
140079709: 48898588010000 mov qword ptr [rbp + 0x188], rax
140079710: 488d4558 lea rax, [rbp + 0x58]
140079714: 48898590010000 mov qword ptr [rbp + 0x190], rax
14007971b: 488d8547020000 lea rax, [rbp + 0x247]
140079722: 48898598010000 mov qword ptr [rbp + 0x198], rax
140079729: c6855702000000 mov byte ptr [rbp + 0x257], 0
140079730: 488d8da0010000 lea rcx, [rbp + 0x1a0]
140079737: 488d9578010000 lea rdx, [rbp + 0x178]
14007973e: e84d191d00 call 0x14024b090
140079743: 90 nop
140079744: 0f28b560020000 movaps xmm6, xmmword ptr [rbp + 0x260]
14007974b: 4881c4f8020000 add rsp, 0x2f8
140079752: 5b pop rbx
140079753: 5f pop rdi
140079754: 5e pop rsi
140079755: 415c pop r12
140079757: 415d pop r13
140079759: 415e pop r14
14007975b: 415f pop r15
14007975d: 5d pop rbp
14007975e: c3 ret
14007975f: 4c8ba5d0000000 mov r12, qword ptr [rbp + 0xd0]
140079766: 4c8badd8000000 mov r13, qword ptr [rbp + 0xd8]
14007976d: 448b95e4000000 mov r10d, dword ptr [rbp + 0xe4]
140079774: 498b8424f8000000 mov rax, qword ptr [r12 + 0xf8]
14007977c: 498b8c2400010000 mov rcx, qword ptr [r12 + 0x100]
140079784: 4180bc240801000000 cmp byte ptr [r12 + 0x108], 0
14007978d: 7437 je 0x1400797c6
14007978f: 48c1e102 shl rcx, 2
140079793: 31d2 xor edx, edx
140079795: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400797a0: 4839d1 cmp rcx, rdx
1400797a3: 0f8433fbffff je 0x1400792dc
1400797a9: 448b0410 mov r8d, dword ptr [rax + rdx]
1400797ad: 4d8b8da8010000 mov r9, qword ptr [r13 + 0x1a8]
1400797b4: 4f8d04c0 lea r8, [r8 + r8*8]
1400797b8: 4883c204 add rdx, 4
1400797bc: 4b837cc11000 cmp qword ptr [r9 + r8*8 + 0x10], 0
1400797c2: 74dc je 0x1400797a0
1400797c4: eb32 jmp 0x1400797f8
1400797c6: 48c1e102 shl rcx, 2
1400797ca: 31d2 xor edx, edx
1400797cc: 0f1f4000 nop dword ptr [rax]
1400797d0: 4839d1 cmp rcx, rdx
1400797d3: 0f8403fbffff je 0x1400792dc
1400797d9: 448b0410 mov r8d, dword ptr [rax + rdx]
1400797dd: 4d8b8d08010000 mov r9, qword ptr [r13 + 0x108]
1400797e4: 4f8d0480 lea r8, [r8 + r8*4]
1400797e8: 49c1e005 shl r8, 5
1400797ec: 4883c204 add rdx, 4
1400797f0: 4b837c015800 cmp qword ptr [r9 + r8 + 0x58], 0
1400797f6: 74d8 je 0x1400797d0
1400797f8: 4983ffff cmp r15, -1
1400797fc: 0f84dafaffff je 0x1400792dc
140079802: 40387b40 cmp byte ptr [rbx + 0x40], dil
140079806: 0f85d0faffff jne 0x1400792dc
14007980c: 448995e0010000 mov dword ptr [rbp + 0x1e0], r10d
140079813: c6855702000001 mov byte ptr [rbp + 0x257], 1
14007981a: 488d8de8010000 lea rcx, [rbp + 0x1e8]
140079821: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
140079828: e8c33ab505 call 0x145bcd2f0
14007982d: 90 nop
14007982e: 4c8bb508030000 mov r14, qword ptr [rbp + 0x308]
140079835: 418a7e38 mov dil, byte ptr [r14 + 0x38]
140079839: 418a7639 mov sil, byte ptr [r14 + 0x39]
14007983d: 418a5e3a mov bl, byte ptr [r14 + 0x3a]
140079841: 488d8d78010000 lea rcx, [rbp + 0x178]
140079848: 4c89f2 mov rdx, r14
14007984b: e8a03ab505 call 0x145bcd2f0
140079850: 90 nop
140079851: 498d5618 lea rdx, [r14 + 0x18]
140079855: 488d8da0010000 lea rcx, [rbp + 0x1a0]
14007985c: e88f3ab505 call 0x145bcd2f0
140079861: 90 nop
140079862: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
140079869: 48898518020000 mov qword ptr [rbp + 0x218], rax
140079870: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
140079877: 48898528020000 mov qword ptr [rbp + 0x228], rax
14007987e: 4c8bbda0010000 mov r15, qword ptr [rbp + 0x1a0]
140079885: 4c8b8da8010000 mov r9, qword ptr [rbp + 0x1a8]
14007988c: 488b95e8010000 mov rdx, qword ptr [rbp + 0x1e8]
140079893: 488b8df0010000 mov rcx, qword ptr [rbp + 0x1f0]
14007989a: 4c8bb500020000 mov r14, qword ptr [rbp + 0x200]
1400798a1: 413a7e38 cmp dil, byte ptr [r14 + 0x38]
1400798a5: 0f85b6050000 jne 0x140079e61
1400798ab: 413a7639 cmp sil, byte ptr [r14 + 0x39]
1400798af: 0f85ac050000 jne 0x140079e61
1400798b5: 413a5e3a cmp bl, byte ptr [r14 + 0x3a]
1400798b9: 0f85a2050000 jne 0x140079e61
1400798bf: 4c8b85f8010000 mov r8, qword ptr [rbp + 0x1f8]
1400798c6: 4d3b4610 cmp r8, qword ptr [r14 + 0x10]
1400798ca: 0f8591050000 jne 0x140079e61
1400798d0: 488b8508030000 mov rax, qword ptr [rbp + 0x308]
1400798d7: 4c8b5030 mov r10, qword ptr [rax + 0x30]
1400798db: 4c899538020000 mov qword ptr [rbp + 0x238], r10
1400798e2: 4c8b95b0010000 mov r10, qword ptr [rbp + 0x1b0]
1400798e9: 4c899520020000 mov qword ptr [rbp + 0x220], r10
1400798f0: 8b583b mov ebx, dword ptr [rax + 0x3b]
1400798f3: 0fb6703f movzx esi, byte ptr [rax + 0x3f]
1400798f7: 498b4608 mov rax, qword ptr [r14 + 8]
1400798fb: 48898d08020000 mov qword ptr [rbp + 0x208], rcx
140079902: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
140079909: 48899530020000 mov qword ptr [rbp + 0x230], rdx
140079910: 4889c2 mov rdx, rax
140079913: 4c89cf mov rdi, r9
140079916: e8c607b805 call 0x145bfa0e1
14007991b: 4989f9 mov r9, rdi
14007991e: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
140079925: 488b9530020000 mov rdx, qword ptr [rbp + 0x230]
14007992c: 85c0 test eax, eax
14007992e: 0f852d050000 jne 0x140079e61
140079934: 488b8520020000 mov rax, qword ptr [rbp + 0x220]
14007993b: 493b4628 cmp rax, qword ptr [r14 + 0x28]
14007993f: 0f851c050000 jne 0x140079e61
140079945: 498b5620 mov rdx, qword ptr [r14 + 0x20]
140079949: 4c89c9 mov rcx, r9
14007994c: 4c8b8520020000 mov r8, qword ptr [rbp + 0x220]
140079953: e88907b805 call 0x145bfa0e1
140079958: 4989f9 mov r9, rdi
14007995b: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
140079962: 488b9530020000 mov rdx, qword ptr [rbp + 0x230]
140079969: 85c0 test eax, eax
14007996b: 0f85f0040000 jne 0x140079e61
140079971: 498d463b lea rax, [r14 + 0x3b]
140079975: 48c1e620 shl rsi, 0x20
140079979: 4809de or rsi, rbx
14007997c: 448b00 mov r8d, dword ptr [rax]
14007997f: 0fb64004 movzx eax, byte ptr [rax + 4]
140079983: 48c1e020 shl rax, 0x20
140079987: 4c09c0 or rax, r8
14007998a: 49b8ffffffffff000000 movabs r8, 0xffffffffff
140079994: 4921f0 and r8, rsi
140079997: 4939c0 cmp r8, rax
14007999a: 0f85c1040000 jne 0x140079e61
1400799a0: 498b7630 mov rsi, qword ptr [r14 + 0x30]
1400799a4: 4885d2 test rdx, rdx
1400799a7: 7419 je 0x1400799c2
1400799a9: 41b801000000 mov r8d, 1
1400799af: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
1400799b6: 488b9530020000 mov rdx, qword ptr [rbp + 0x230]
1400799bd: e80e88f8ff call 0x1400021d0
1400799c2: 4d85ff test r15, r15
1400799c5: 7411 je 0x1400799d8
1400799c7: 41b801000000 mov r8d, 1
1400799cd: 4889f9 mov rcx, rdi
1400799d0: 4c89fa mov rdx, r15
1400799d3: e8f887f8ff call 0x1400021d0
1400799d8: 4883bd1802000000 cmp qword ptr [rbp + 0x218], 0
1400799e0: 7419 je 0x1400799fb
1400799e2: 41b801000000 mov r8d, 1
1400799e8: 488b8d28020000 mov rcx, qword ptr [rbp + 0x228]
1400799ef: 488b9518020000 mov rdx, qword ptr [rbp + 0x218]
1400799f6: e8d587f8ff call 0x1400021d0
1400799fb: 4839b538020000 cmp qword ptr [rbp + 0x238], rsi
140079a02: 488b9d08030000 mov rbx, qword ptr [rbp + 0x308]
140079a09: 0f85cdf8ffff jne 0x1400792dc
140079a0f: 488b8500020000 mov rax, qword ptr [rbp + 0x200]
140079a16: 488b5008 mov rdx, qword ptr [rax + 8]
140079a1a: 4c8b4010 mov r8, qword ptr [rax + 0x10]
140079a1e: c6855702000001 mov byte ptr [rbp + 0x257], 1
140079a25: f30f1005c336d505 movss xmm0, dword ptr [rip + 0x5d536c3]
140079a2d: e83ee1feff call 0x140067b70
140079a32: 90 nop
140079a33: 0f28f0 movaps xmm6, xmm0
140079a36: 498b9c24f8000000 mov rbx, qword ptr [r12 + 0xf8]
140079a3e: 498b842400010000 mov rax, qword ptr [r12 + 0x100]
140079a46: 488d0483 lea rax, [rbx + rax*4]
140079a4a: 48898528020000 mov qword ptr [rbp + 0x228], rax
140079a51: 410fb6842408010000 movzx eax, byte ptr [r12 + 0x108]
140079a5a: 888508020000 mov byte ptr [rbp + 0x208], al
140079a60: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
140079a67: 48898520010000 mov qword ptr [rbp + 0x120], rax
140079a6e: 4c8bb510010000 mov r14, qword ptr [rbp + 0x110]
140079a75: b808000000 mov eax, 8
140079a7a: 48898528010000 mov qword ptr [rbp + 0x128], rax
140079a81: 48c7854802000000000000 mov qword ptr [rbp + 0x248], 0
140079a8c: 8b851c010000 mov eax, dword ptr [rbp + 0x11c]
140079a92: 898510020000 mov dword ptr [rbp + 0x210], eax
140079a98: 4531ff xor r15d, r15d
140079a9b: 48c7853802000000000000 mov qword ptr [rbp + 0x238], 0
140079aa6: 48c7852002000000000000 mov qword ptr [rbp + 0x220], 0
140079ab1: 48c7853002000000000000 mov qword ptr [rbp + 0x230], 0
140079abc: 80bd0802000000 cmp byte ptr [rbp + 0x208], 0
140079ac3: 747f je 0x140079b44
140079ac5: 4439bd48020000 cmp dword ptr [rbp + 0x248], r15d
140079acc: 488b9528020000 mov rdx, qword ptr [rbp + 0x228]
140079ad3: 0f8575010000 jne 0x140079c4e
140079ad9: 4839d3 cmp rbx, rdx
140079adc: 0f847a040000 je 0x140079f5c
140079ae2: 8b0b mov ecx, dword ptr [rbx]
140079ae4: 4883c304 add rbx, 4
140079ae8: 498b85a8010000 mov rax, qword ptr [r13 + 0x1a8]
140079aef: 488d0cc9 lea rcx, [rcx + rcx*8]
140079af3: 4c8b7cc810 mov r15, qword ptr [rax + rcx*8 + 0x10]
140079af8: 4d85ff test r15, r15
140079afb: 74dc je 0x140079ad9
140079afd: 4c8d04c8 lea r8, [rax + rcx*8]
140079b01: 498b4018 mov rax, qword ptr [r8 + 0x18]
140079b05: 498b4838 mov rcx, qword ptr [r8 + 0x38]
140079b09: 498b942420010000 mov rdx, qword ptr [r12 + 0x120]
140079b11: 493b5040 cmp rdx, qword ptr [r8 + 0x40]
140079b15: 0f83bf000000 jae 0x140079bda
140079b1b: 488b14d1 mov rdx, qword ptr [rcx + rdx*8]
140079b1f: 4885d2 test rdx, rdx
140079b22: 0f84b2000000 je 0x140079bda
140079b28: 48f7d2 not rdx
140079b2b: 488d1452 lea rdx, [rdx + rdx*2]
140079b2f: 48c1e204 shl rdx, 4
140079b33: 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
140079b38: 48899538020000 mov qword ptr [rbp + 0x238], rdx
140079b3f: e9a1000000 jmp 0x140079be5
140079b44: 4439bd48020000 cmp dword ptr [rbp + 0x248], r15d
140079b4b: 488b9528020000 mov rdx, qword ptr [rbp + 0x228]
140079b52: 0f8580010000 jne 0x140079cd8
140079b58: 4839d3 cmp rbx, rdx
140079b5b: 0f84fb030000 je 0x140079f5c
140079b61: 8b0b mov ecx, dword ptr [rbx]
140079b63: 4883c304 add rbx, 4
140079b67: 498b8508010000 mov rax, qword ptr [r13 + 0x108]
140079b6e: 488d0c89 lea rcx, [rcx + rcx*4]
140079b72: 48c1e105 shl rcx, 5
140079b76: 4c8b7c0858 mov r15, qword ptr [rax + rcx + 0x58]
140079b7b: 4d85ff test r15, r15
140079b7e: 74d8 je 0x140079b58
140079b80: 4801c8 add rax, rcx
140079b83: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
140079b89: 4d8b8da8010000 mov r9, qword ptr [r13 + 0x1a8]
140079b90: 4c8d14c9 lea r10, [rcx + rcx*8]
140079b94: 4b8b4cd118 mov rcx, qword ptr [r9 + r10*8 + 0x18]
140079b99: 4b8b54d138 mov rdx, qword ptr [r9 + r10*8 + 0x38]
140079b9e: 4d8b842420010000 mov r8, qword ptr [r12 + 0x120]
140079ba6: 4f3b44d140 cmp r8, qword ptr [r9 + r10*8 + 0x40]
140079bab: 0f83a8000000 jae 0x140079c59
140079bb1: 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
140079bb5: 4d85c0 test r8, r8
140079bb8: 0f849b000000 je 0x140079c59
140079bbe: 49f7d0 not r8
140079bc1: 4f8d0440 lea r8, [r8 + r8*2]
140079bc5: 49c1e004 shl r8, 4
140079bc9: 4e8b440110 mov r8, qword ptr [rcx + r8 + 0x10]
140079bce: 4c898538020000 mov qword ptr [rbp + 0x238], r8
140079bd5: e98a000000 jmp 0x140079c64
140079bda: 48c7853802000000000000 mov qword ptr [rbp + 0x238], 0
140079be5: 498b942410010000 mov rdx, qword ptr [r12 + 0x110]
140079bed: 4d8b842418010000 mov r8, qword ptr [r12 + 0x118]
140079bf5: 488b14d1 mov rdx, qword ptr [rcx + rdx*8]
140079bf9: 48f7d2 not rdx
140079bfc: 488d1452 lea rdx, [rdx + rdx*2]
140079c00: 48c1e204 shl rdx, 4
140079c04: 4c8b4c1010 mov r9, qword ptr [rax + rdx + 0x10]
140079c09: 4c898d30020000 mov qword ptr [rbp + 0x230], r9
140079c10: 488b541028 mov rdx, qword ptr [rax + rdx + 0x28]
140079c15: 488995d0010000 mov qword ptr [rbp + 0x1d0], rdx
140079c1c: 4a8b0cc1 mov rcx, qword ptr [rcx + r8*8]
140079c20: 48f7d1 not rcx
140079c23: 488d0c49 lea rcx, [rcx + rcx*2]
140079c27: 48c1e104 shl rcx, 4
140079c2b: 488b540810 mov rdx, qword ptr [rax + rcx + 0x10]
140079c30: 48899520020000 mov qword ptr [rbp + 0x220], rdx
140079c37: 488b440828 mov rax, qword ptr [rax + rcx + 0x28]
140079c3c: 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
140079c43: 48c7854802000000000000 mov qword ptr [rbp + 0x248], 0
140079c4e: 8b9548020000 mov edx, dword ptr [rbp + 0x248]
140079c54: e996000000 jmp 0x140079cef
140079c59: 48c7853802000000000000 mov qword ptr [rbp + 0x238], 0
140079c64: 4d8b842410010000 mov r8, qword ptr [r12 + 0x110]
140079c6c: 4d8b8c2418010000 mov r9, qword ptr [r12 + 0x118]
140079c74: 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
140079c78: 49f7d0 not r8
140079c7b: 4f8d0440 lea r8, [r8 + r8*2]
140079c7f: 49c1e004 shl r8, 4
140079c83: 4e8b540110 mov r10, qword ptr [rcx + r8 + 0x10]
140079c88: 4c899530020000 mov qword ptr [rbp + 0x230], r10
140079c8f: 4e8b440128 mov r8, qword ptr [rcx + r8 + 0x28]
140079c94: 4c8985d0010000 mov qword ptr [rbp + 0x1d0], r8
140079c9b: 4a8b14ca mov rdx, qword ptr [rdx + r9*8]
140079c9f: 48f7d2 not rdx
140079ca2: 488d1452 lea rdx, [rdx + rdx*2]
140079ca6: 48c1e204 shl rdx, 4
140079caa: 4c8b441110 mov r8, qword ptr [rcx + rdx + 0x10]
140079caf: 4c898520020000 mov qword ptr [rbp + 0x220], r8
140079cb6: 488b4c1128 mov rcx, qword ptr [rcx + rdx + 0x28]
140079cbb: 48898dd8010000 mov qword ptr [rbp + 0x1d8], rcx
140079cc2: 488b4050 mov rax, qword ptr [rax + 0x50]
140079cc6: 48898528010000 mov qword ptr [rbp + 0x128], rax
140079ccd: 48c7854802000000000000 mov qword ptr [rbp + 0x248], 0
140079cd8: 8b8548020000 mov eax, dword ptr [rbp + 0x248]
140079cde: 48c1e004 shl rax, 4
140079ce2: 488b8d28010000 mov rcx, qword ptr [rbp + 0x128]
140079ce9: 8b540108 mov edx, dword ptr [rcx + rax + 8]
140079ced: f7d2 not edx
140079cef: 488d04d500000000 lea rax, [rdx*8]
140079cf7: 488d3c40 lea rdi, [rax + rax*2]
140079cfb: 488b8530020000 mov rax, qword ptr [rbp + 0x230]
140079d02: 488d0c38 lea rcx, [rax + rdi]
140079d06: 488b85d0010000 mov rax, qword ptr [rbp + 0x1d0]
140079d0d: 488d0490 lea rax, [rax + rdx*4]
140079d11: 4c6bc238 imul r8, rdx, 0x38
140079d15: 4c038520020000 add r8, qword ptr [rbp + 0x220]
140079d1c: 4c898518020000 mov qword ptr [rbp + 0x218], r8
140079d23: 4c8b85d8010000 mov r8, qword ptr [rbp + 0x1d8]
140079d2a: 498d3490 lea rsi, [r8 + rdx*4]
140079d2e: 4803bd38020000 add rdi, qword ptr [rbp + 0x238]
140079d35: 8b95e0010000 mov edx, dword ptr [rbp + 0x1e0]
140079d3b: 8910 mov dword ptr [rax], edx
140079d3d: c6855702000001 mov byte ptr [rbp + 0x257], 1
140079d44: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
140079d4b: e83035b505 call 0x145bcd280
140079d50: 90 nop
140079d51: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
140079d58: ffc0 inc eax
140079d5a: 48898548020000 mov qword ptr [rbp + 0x248], rax
140079d61: 8b85e0010000 mov eax, dword ptr [rbp + 0x1e0]
140079d67: 8906 mov dword ptr [rsi], eax
140079d69: 488b8518020000 mov rax, qword ptr [rbp + 0x218]
140079d70: f30f117030 movss dword ptr [rax + 0x30], xmm6
140079d75: 488b4710 mov rax, qword ptr [rdi + 0x10]
140079d79: 4885c0 test rax, rax
140079d7c: 0f843afdffff je 0x140079abc
140079d82: 488b4f08 mov rcx, qword ptr [rdi + 8]
140079d86: 48c1e003 shl rax, 3
140079d8a: 31d2 xor edx, edx
140079d8c: 488bbd20010000 mov rdi, qword ptr [rbp + 0x120]
140079d93: 4c8d1dfa48d505 lea r11, [rip + 0x5d548fa]
140079d9a: eb0d jmp 0x140079da9
140079d9c: 4883c208 add rdx, 8
140079da0: 4839d0 cmp rax, rdx
140079da3: 0f8413fdffff je 0x140079abc
140079da9: 4c8b0411 mov r8, qword ptr [rcx + rdx]
140079dad: 4589c2 mov r10d, r8d
140079db0: 41f7d2 not r10d
140079db3: 49c1e820 shr r8, 0x20
140079db7: 4f8d0c52 lea r9, [r10 + r10*2]
140079dbb: 49c1e103 shl r9, 3
140079dbf: 4d034e08 add r9, qword ptr [r14 + 8]
140079dc3: 4d3b5610 cmp r10, qword ptr [r14 + 0x10]
140079dc7: 4d0f43cb cmovae r9, r11
140079dcb: 45394110 cmp dword ptr [r9 + 0x10], r8d
140079dcf: 75cb jne 0x140079d9c
140079dd1: 41833900 cmp dword ptr [r9], 0
140079dd5: 74c5 je 0x140079d9c
140079dd7: 4d8b4104 mov r8, qword ptr [r9 + 4]
140079ddb: 4d89c2 mov r10, r8
140079dde: 49c1ea20 shr r10, 0x20
140079de2: 4c395738 cmp qword ptr [rdi + 0x38], r10
140079de6: 76b4 jbe 0x140079d9c
140079de8: 4d89c3 mov r11, r8
140079deb: 49c1eb26 shr r11, 0x26
140079def: 488b7728 mov rsi, qword ptr [rdi + 0x28]
140079df3: 4e8b1cde mov r11, qword ptr [rsi + r11*8]
140079df7: 4d0fa3d3 bt r11, r10
140079dfb: 4c8d1d9248d505 lea r11, [rip + 0x5d54892]
140079e02: 7398 jae 0x140079d9c
140079e04: 458b490c mov r9d, dword ptr [r9 + 0xc]
140079e08: 4d8b96a8010000 mov r10, qword ptr [r14 + 0x1a8]
140079e0f: 4f8d0cc9 lea r9, [r9 + r9*8]
140079e13: 4c8b9f10010000 mov r11, qword ptr [rdi + 0x110]
140079e1a: 4b8b74ca18 mov rsi, qword ptr [r10 + r9*8 + 0x18]
140079e1f: 4f8b4cca38 mov r9, qword ptr [r10 + r9*8 + 0x38]
140079e24: 4f8b0cd9 mov r9, qword ptr [r9 + r11*8]
140079e28: 49f7d1 not r9
140079e2b: 4f8d0c49 lea r9, [r9 + r9*2]
140079e2f: 49c1e104 shl r9, 4
140079e33: 4e8b540e10 mov r10, qword ptr [rsi + r9 + 0x10]
140079e38: 4e8b4c0e28 mov r9, qword ptr [rsi + r9 + 0x28]
140079e3d: 41f7d0 not r8d
140079e40: 4d6bd838 imul r11, r8, 0x38
140079e44: 8bb510020000 mov esi, dword ptr [rbp + 0x210]
140079e4a: 43893481 mov dword ptr [r9 + r8*4], esi
140079e4e: f3430f11741a30 movss dword ptr [r10 + r11 + 0x30], xmm6
140079e55: 4c8d1d3848d505 lea r11, [rip + 0x5d54838]
140079e5c: e93bffffff jmp 0x140079d9c
140079e61: 4885d2 test rdx, rdx
140079e64: 7411 je 0x140079e77
140079e66: 41b801000000 mov r8d, 1
140079e6c: 4c89ce mov rsi, r9
140079e6f: e85c83f8ff call 0x1400021d0
140079e74: 4989f1 mov r9, rsi
140079e77: 4d85ff test r15, r15
140079e7a: 488b9d08030000 mov rbx, qword ptr [rbp + 0x308]
140079e81: 7411 je 0x140079e94
140079e83: 41b801000000 mov r8d, 1
140079e89: 4c89c9 mov rcx, r9
140079e8c: 4c89fa mov rdx, r15
140079e8f: e83c83f8ff call 0x1400021d0
140079e94: 488b9518020000 mov rdx, qword ptr [rbp + 0x218]
140079e9b: 4885d2 test rdx, rdx
140079e9e: 0f8438f4ffff je 0x1400792dc
140079ea4: 41b801000000 mov r8d, 1
140079eaa: 488b8d28020000 mov rcx, qword ptr [rbp + 0x228]
140079eb1: e81a83f8ff call 0x1400021d0
140079eb6: e921f4ffff jmp 0x1400792dc
140079ebb: 8b433b mov eax, dword ptr [rbx + 0x3b]
140079ebe: 0fb64b3f movzx ecx, byte ptr [rbx + 0x3f]
140079ec2: 48c1e120 shl rcx, 0x20
140079ec6: 4809c1 or rcx, rax
140079ec9: 8b856b010000 mov eax, dword ptr [rbp + 0x16b]
140079ecf: 0fb6956f010000 movzx edx, byte ptr [rbp + 0x16f]
140079ed6: 48c1e220 shl rdx, 0x20
140079eda: 4809c2 or rdx, rax
140079edd: 4839d1 cmp rcx, rdx
140079ee0: 0f85d2f3ffff jne 0x1400792b8
140079ee6: 4c396330 cmp qword ptr [rbx + 0x30], r12
140079eea: 0f85c8f3ffff jne 0x1400792b8
140079ef0: 40387b40 cmp byte ptr [rbx + 0x40], dil
140079ef4: 0f85bef3ffff jne 0x1400792b8
140079efa: 488b4528 mov rax, qword ptr [rbp + 0x28]
140079efe: 8b4d34 mov ecx, dword ptr [rbp + 0x34]
140079f01: 89ca mov edx, ecx
140079f03: 2b10 sub edx, dword ptr [rax]
140079f05: 2b4d30 sub ecx, dword ptr [rbp + 0x30]
140079f08: 81f900b033c2 cmp ecx, 0xc233b000
140079f0e: b800b033c2 mov eax, 0xc233b000
140079f13: 0f42c1 cmovb eax, ecx
140079f16: 39c2 cmp edx, eax
140079f18: 0f829af3ffff jb 0x1400792b8
140079f1e: 488d8d30010000 lea rcx, [rbp + 0x130]
140079f25: e896f3f8ff call 0x1400092c0
140079f2a: e915f8ffff jmp 0x140079744
140079f2f: c6855702000000 mov byte ptr [rbp + 0x257], 0
140079f36: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140079f3f: 41b810000000 mov r8d, 0x10
140079f45: 41b901000000 mov r9d, 1
140079f4b: 4889f1 mov rcx, rsi
140079f4e: 4889fa mov rdx, rdi
140079f51: e81a0ab805 call 0x145bfa970
140079f56: 90 nop
140079f57: e949f7ffff jmp 0x1400796a5
140079f5c: 488bb508030000 mov rsi, qword ptr [rbp + 0x308]
140079f63: 4889f1 mov rcx, rsi
140079f66: e855dcf8ff call 0x140007bc0
140079f6b: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
140079f72: 48894640 mov qword ptr [rsi + 0x40], rax
140079f76: 0f288530010000 movaps xmm0, xmmword ptr [rbp + 0x130]
140079f7d: 0f288d40010000 movaps xmm1, xmmword ptr [rbp + 0x140]
140079f84: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
140079f8b: 0f289d60010000 movaps xmm3, xmmword ptr [rbp + 0x160]
140079f92: 0f115e30 movups xmmword ptr [rsi + 0x30], xmm3
140079f96: 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
140079f9a: 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
140079f9e: 0f1106 movups xmmword ptr [rsi], xmm0
140079fa1: e99ef7ffff jmp 0x140079744
