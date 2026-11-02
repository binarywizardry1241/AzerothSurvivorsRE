140acaca0: push r15
140acaca2: push r14
140acaca4: push r13
140acaca6: push r12
140acaca8: push rsi
140acaca9: push rdi
140acacaa: push rbp
140acacab: push rbx
140acacac: sub rsp, 0x188
140acacb3: movaps xmmword ptr [rsp + 0x170], xmm14
140acacbc: movaps xmmword ptr [rsp + 0x160], xmm13
140acacc5: movaps xmmword ptr [rsp + 0x150], xmm12
140acacce: movaps xmmword ptr [rsp + 0x140], xmm11
140acacd7: movdqa xmmword ptr [rsp + 0x130], xmm10
140acace1: movaps xmmword ptr [rsp + 0x120], xmm9
140acacea: movaps xmmword ptr [rsp + 0x110], xmm8
140acacf3: movaps xmmword ptr [rsp + 0x100], xmm7
140acacfb: movaps xmmword ptr [rsp + 0xf0], xmm6
140acad03: mov dword ptr [rsp + 0x4c], r9d
140acad08: mov r13, rcx
140acad0b: movss xmm6, dword ptr [rsp + 0x1f0]
140acad14: mov rcx, qword ptr [r8]
140acad17: mov rbp, qword ptr [r8 + 8]
140acad1b: mov rbx, qword ptr [rcx + 0xf8]
140acad22: mov rax, qword ptr [rcx + 0x100]
140acad29: lea r14, [rbx + rax*4]
140acad2d: mov qword ptr [rsp + 0x50], rcx
140acad32: movzx r11d, byte ptr [rcx + 0x108]
140acad3a: movss xmm7, dword ptr [r13]
140acad40: movss xmm8, dword ptr [r13 + 4]
140acad46: movss xmm9, dword ptr [r13 + 8]
140acad4c: shufps xmm7, xmm7, 0
140acad50: shufps xmm8, xmm8, 0
140acad55: shufps xmm9, xmm9, 0
140acad5a: mov rax, qword ptr [rdx + 0x40]
140acad5e: mov qword ptr [rsp + 0x58], rax
140acad63: mov rdi, qword ptr [rdx + 0x48]
140acad67: mov rax, qword ptr [rdx + 0x90]
140acad6e: mov qword ptr [rsp + 0x78], rax
140acad73: mov rax, qword ptr [rdx + 0x80]
140acad7a: mov qword ptr [rsp + 0x60], rax
140acad7f: mov rax, qword ptr [rdx + 0x78]
140acad83: mov qword ptr [rsp + 0x70], rax
140acad88: mov r8d, 8
140acad8e: xor r9d, r9d
140acad91: pcmpeqd xmm10, xmm10
140acad96: movss xmm11, dword ptr [rip + 0x52a25cd]
140acad9f: movaps xmm12, xmmword ptr [rip + 0x52a2a39]
140acada7: xor r10d, r10d
140acadaa: xor esi, esi
140acadac: mov qword ptr [rsp + 0x40], rdi
140acadb1: test r11b, r11b
140acadb4: je 0x140acae30
140acadb6: cmp r10d, esi
140acadb9: jne 0x140acaebc
140acadbf: nop
140acadc0: cmp rbx, r14
140acadc3: je 0x140acb29a
140acadc9: mov ecx, dword ptr [rbx]
140acadcb: add rbx, 4
140acadcf: mov rax, qword ptr [rbp + 0x1a8]
140acadd6: lea rcx, [rcx + rcx*8]
140acadda: mov rsi, qword ptr [rax + rcx*8 + 0x10]
140acaddf: test rsi, rsi
140acade2: je 0x140acadc0
140acade4: lea rax, [rax + rcx*8]
140acade8: mov rcx, qword ptr [rsp + 0x50]
140acaded: mov rcx, qword ptr [rcx + 0x110]
140acadf4: cmp rcx, qword ptr [rax + 0x40]
140acadf8: jae 0x140acaeb6
140acadfe: mov rdx, qword ptr [rax + 0x38]
140acae02: mov rcx, qword ptr [rdx + rcx*8]
140acae06: test rcx, rcx
140acae09: je 0x140acaeb6
140acae0f: mov rax, qword ptr [rax + 0x18]
140acae13: not rcx
140acae16: lea rcx, [rcx + rcx*2]
140acae1a: shl rcx, 4
140acae1e: mov r9, qword ptr [rax + rcx + 0x10]
140acae23: jmp 0x140acaeb9
140acae28: nop dword ptr [rax + rax]
140acae30: cmp r10d, esi
140acae33: jne 0x140acaecb
140acae39: nop dword ptr [rax]
140acae40: cmp rbx, r14
140acae43: je 0x140acb29a
140acae49: mov ecx, dword ptr [rbx]
140acae4b: add rbx, 4
140acae4f: mov rax, qword ptr [rbp + 0x108]
140acae56: lea rcx, [rcx + rcx*4]
140acae5a: shl rcx, 5
140acae5e: mov rsi, qword ptr [rax + rcx + 0x58]
140acae63: test rsi, rsi
140acae66: je 0x140acae40
140acae68: add rax, rcx
140acae6b: mov ecx, dword ptr [rax + 0x94]
140acae71: mov rdx, qword ptr [rbp + 0x1a8]
140acae78: lea r8, [rcx + rcx*8]
140acae7c: mov rcx, qword ptr [rsp + 0x50]
140acae81: mov rcx, qword ptr [rcx + 0x110]
140acae88: cmp rcx, qword ptr [rdx + r8*8 + 0x40]
140acae8d: jae 0x140acaec1
140acae8f: lea rdx, [rdx + r8*8]
140acae93: mov r8, qword ptr [rdx + 0x38]
140acae97: mov rcx, qword ptr [r8 + rcx*8]
140acae9b: test rcx, rcx
140acae9e: je 0x140acaec1
140acaea0: mov rdx, qword ptr [rdx + 0x18]
140acaea4: not rcx
140acaea7: lea rcx, [rcx + rcx*2]
140acaeab: shl rcx, 4
140acaeaf: mov r9, qword ptr [rdx + rcx + 0x10]
140acaeb4: jmp 0x140acaec4
140acaeb6: xor r9d, r9d
140acaeb9: xor r10d, r10d
140acaebc: mov eax, r10d
140acaebf: jmp 0x140acaed9
140acaec1: xor r9d, r9d
140acaec4: mov r8, qword ptr [rax + 0x50]
140acaec8: xor r10d, r10d
140acaecb: mov eax, r10d
140acaece: shl rax, 4
140acaed2: mov eax, dword ptr [r8 + rax + 8]
140acaed7: not eax
140acaed9: lea rcx, [rax + rax*2]
140acaedd: shl rcx, 6
140acaee1: add rcx, r9
140acaee4: inc r10d
140acaee7: cmp byte ptr [rcx + 0x40], 1
140acaeeb: jne 0x140acb040
140acaef1: cmp qword ptr [rsp + 0x78], 0
140acaef7: je 0x140acadb1
140acaefd: mov dword ptr [rsp + 0x2c], r10d
140acaf02: mov qword ptr [rsp + 0x30], r9
140acaf07: mov qword ptr [rsp + 0x38], r8
140acaf0c: movzx eax, word ptr [rcx + 0x41]
140acaf10: movzx edx, byte ptr [rcx + 0x43]
140acaf14: shl edx, 0x10
140acaf17: or rdx, rax
140acaf1a: mov eax, dword ptr [rcx + 0x44]
140acaf1d: mov r8d, dword ptr [rcx + 0x48]
140acaf21: movzx r9d, byte ptr [rcx + 0x50]
140acaf26: mov r10d, dword ptr [rcx + 0x4c]
140acaf2a: shl rax, 0x18
140acaf2e: or rax, rdx
140acaf31: mov edx, r8d
140acaf34: shr edx, 8
140acaf37: shl r8, 0x38
140acaf3b: or r8, rax
140acaf3e: shl r10, 0x18
140acaf42: shl r9, 0x38
140acaf46: or r9, r10
140acaf49: or r9, rdx
140acaf4c: mov rdx, r8
140acaf4f: movabs rax, 0xdef19dc0fe5cef68
140acaf59: xor rdx, rax
140acaf5c: mov rax, r9
140acaf5f: movabs r10, 0x3f84d5b5b5470917
140acaf69: xor rax, r10
140acaf6c: mul rdx
140acaf6f: xor rdx, rax
140acaf72: mov rax, rdx
140acaf75: shr rax, 0x39
140acaf79: movd xmm0, eax
140acaf7d: punpcklbw xmm0, xmm0
140acaf81: pshuflw xmm0, xmm0, 0
140acaf86: pshufd xmm0, xmm0, 0x44
140acaf8b: xor eax, eax
140acaf8d: mov r15, qword ptr [rsp + 0x70]
140acaf92: and rdx, qword ptr [rsp + 0x60]
140acaf97: movdqu xmm1, xmmword ptr [r15 + rdx]
140acaf9d: movdqa xmm2, xmm1
140acafa1: pcmpeqb xmm2, xmm0
140acafa5: pmovmskb r10d, xmm2
140acafaa: test r10d, r10d
140acafad: je 0x140acb010
140acafaf: mov qword ptr [rsp + 0x68], rax
140acafb4: mov edi, r11d
140acafb7: mov rax, r13
140acafba: tzcnt r11d, r10d
140acafbf: add r11, rdx
140acafc2: and r11, qword ptr [rsp + 0x60]
140acafc7: neg r11
140acafca: lea r12, [r11 + r11*2]
140acafce: shl r12, 8
140acafd2: mov r11, qword ptr [r15 + r12 - 0x2f8]
140acafda: xor r11, r9
140acafdd: mov r13, qword ptr [r15 + r12 - 0x300]
140acafe5: xor r13, r8
140acafe8: or r13, r11
140acafeb: je 0x140acb097
140acaff1: lea r11d, [r10 - 1]
140acaff5: and r11w, r10w
140acaff9: mov r10d, r11d
140acaffc: mov r13, rax
140acafff: mov r11d, edi
140acb002: mov rdi, qword ptr [rsp + 0x40]
140acb007: mov rax, qword ptr [rsp + 0x68]
140acb00c: jne 0x140acafb4
140acb00e: nop
140acb010: pcmpeqb xmm1, xmm10
140acb015: pmovmskb r10d, xmm1
140acb01a: test r10d, r10d
140acb01d: jne 0x140acb286
140acb023: add rdx, rax
140acb026: add rdx, 0x10
140acb02a: add rax, 0x10
140acb02e: jmp 0x140acaf92
140acb033: nop word ptr cs:[rax + rax]
140acb040: mov rax, qword ptr [rcx + 0x48]
140acb044: mov edx, dword ptr [rax + 0x6c]
140acb047: cmp rdi, rdx
140acb04a: jbe 0x140acadb1
140acb050: imul r12, rdx, 0x2f8
140acb057: mov rdx, qword ptr [rsp + 0x58]
140acb05c: mov rdx, qword ptr [rdx + r12]
140acb060: cmp rdx, -2
140acb064: je 0x140acadb1
140acb06a: cmp rdx, -1
140acb06e: je 0x140acadb1
140acb074: mov eax, dword ptr [rax + 0x68]
140acb077: add r12, qword ptr [rsp + 0x58]
140acb07c: cmp dword ptr [r12 + 0x2f0], eax
140acb084: jne 0x140acadb1
140acb08a: cmp qword ptr [r12 + 0x70], 0
140acb090: jne 0x140acb0c7
140acb092: jmp 0x140acadb1
140acb097: add r12, r15
140acb09a: add r12, -0x2f0
140acb0a1: mov r13, rax
140acb0a4: mov r11d, edi
140acb0a7: mov rdi, qword ptr [rsp + 0x40]
140acb0ac: mov r8, qword ptr [rsp + 0x38]
140acb0b1: mov r9, qword ptr [rsp + 0x30]
140acb0b6: mov r10d, dword ptr [rsp + 0x2c]
140acb0bb: cmp qword ptr [r12 + 0x70], 0
140acb0c1: je 0x140acadb1
140acb0c7: mov dword ptr [rsp + 0x2c], r10d
140acb0cc: mov qword ptr [rsp + 0x30], r9
140acb0d1: mov qword ptr [rsp + 0x38], r8
140acb0d6: mov r15d, r11d
140acb0d9: movaps xmm0, xmmword ptr [rcx]
140acb0dc: movaps xmm5, xmmword ptr [rcx + 0x10]
140acb0e0: movaps xmm4, xmmword ptr [rcx + 0x20]
140acb0e4: movaps xmm1, xmmword ptr [rcx + 0x30]
140acb0e8: movaps xmm2, xmm5
140acb0eb: shufps xmm2, xmm5, 0xd2
140acb0ef: movaps xmm3, xmm0
140acb0f2: shufps xmm3, xmm0, 0xd2
140acb0f6: movaps xmm13, xmm2
140acb0fa: mulps xmm13, xmm0
140acb0fe: movaps xmm14, xmm4
140acb102: shufps xmm14, xmm4, 0xd2
140acb107: mulps xmm0, xmm14
140acb10b: mulps xmm14, xmm5
140acb10f: mulps xmm5, xmm3
140acb112: subps xmm5, xmm13
140acb116: shufps xmm5, xmm5, 0x52
140acb11a: mulps xmm3, xmm4
140acb11d: mulps xmm2, xmm4
140acb120: mulps xmm4, xmm5
140acb123: movshdup xmm13, xmm4
140acb128: addss xmm13, xmm4
140acb12d: movhlps xmm4, xmm4
140acb130: addss xmm4, xmm13
140acb135: movaps xmm13, xmm11
140acb139: divss xmm13, xmm4
140acb13e: shufps xmm13, xmm13, 0
140acb143: subps xmm0, xmm3
140acb146: shufps xmm0, xmm0, 0x52
140acb14a: subps xmm2, xmm14
140acb14e: shufps xmm2, xmm2, 0x52
140acb152: mulps xmm2, xmm13
140acb156: mulps xmm0, xmm13
140acb15a: mulps xmm13, xmm5
140acb15e: movaps xmm3, xmm2
140acb161: movlhps xmm3, xmm0
140acb164: movhlps xmm0, xmm2
140acb167: movaps xmm2, xmm3
140acb16a: shufps xmm2, xmm13, 8
140acb16f: shufps xmm3, xmm13, 0x5d
140acb174: shufps xmm0, xmm13, 0xa8
140acb179: movaps xmm4, xmm1
140acb17c: shufps xmm4, xmm1, 0
140acb180: mulps xmm4, xmm2
140acb183: movaps xmm5, xmm1
140acb186: shufps xmm5, xmm1, 0x15
140acb18a: mulps xmm5, xmm3
140acb18d: addps xmm5, xmm4
140acb190: shufps xmm1, xmm1, 0x2a
140acb194: mulps xmm1, xmm0
140acb197: addps xmm1, xmm5
140acb19a: xorps xmm1, xmm12
140acb19e: movaps xmmword ptr [rsp + 0xb0], xmm2
140acb1a6: movaps xmmword ptr [rsp + 0xc0], xmm3
140acb1ae: movaps xmmword ptr [rsp + 0xd0], xmm0
140acb1b6: movaps xmmword ptr [rsp + 0xe0], xmm1
140acb1be: mulps xmm2, xmm7
140acb1c1: mulps xmm3, xmm8
140acb1c5: addps xmm3, xmm2
140acb1c8: mulps xmm0, xmm9
140acb1cc: addps xmm0, xmm3
140acb1cf: addps xmm0, xmm1
140acb1d2: movshdup xmm1, xmm0
140acb1d6: shufps xmm0, xmm0, 0xe2
140acb1da: xorps xmm0, xmm12
140acb1de: movlps qword ptr [rsp + 0x80], xmm0
140acb1e6: movss dword ptr [rsp + 0x88], xmm1
140acb1ef: xor r9d, r9d
140acb1f2: test byte ptr [rsp + 0x4c], 1
140acb1f7: je 0x140acb212
140acb1f9: lea rcx, [rsp + 0xb0]
140acb201: mov rdx, r13
140acb204: movaps xmm2, xmm6
140acb207: call 0x141925b70
140acb20c: mov r9d, 1
140acb212: movd dword ptr [rsp + 0x20], xmm0
140acb218: lea rcx, [rsp + 0x90]
140acb220: mov rdx, r12
140acb223: lea r8, [rsp + 0x80]
140acb22b: call 0x1419bc530
140acb230: cmp dword ptr [rsp + 0x90], 1
140acb238: jne 0x140acb27e
140acb23a: mov rax, qword ptr [rsp + 0x98]
140acb242: cmp rax, qword ptr [r12 + 0x88]
140acb24a: jae 0x140acb27e
140acb24c: mov rcx, qword ptr [r12 + 0x80]
140acb254: imul rax, rax, 0x2c
140acb258: test byte ptr [rcx + rax], 8
140acb25c: mov r11d, r15d
140acb25f: mov rdi, qword ptr [rsp + 0x40]
140acb264: mov r8, qword ptr [rsp + 0x38]
140acb269: mov r9, qword ptr [rsp + 0x30]
140acb26e: mov r10d, dword ptr [rsp + 0x2c]
140acb273: jne 0x140acadb1
140acb279: jmp 0x140acb2ff
140acb27e: mov r11d, r15d
140acb281: mov rdi, qword ptr [rsp + 0x40]
140acb286: mov r8, qword ptr [rsp + 0x38]
140acb28b: mov r9, qword ptr [rsp + 0x30]
140acb290: mov r10d, dword ptr [rsp + 0x2c]
140acb295: jmp 0x140acadb1
140acb29a: xor eax, eax
140acb29c: movaps xmm6, xmmword ptr [rsp + 0xf0]
140acb2a4: movaps xmm7, xmmword ptr [rsp + 0x100]
140acb2ac: movaps xmm8, xmmword ptr [rsp + 0x110]
140acb2b5: movaps xmm9, xmmword ptr [rsp + 0x120]
140acb2be: movaps xmm10, xmmword ptr [rsp + 0x130]
140acb2c7: movaps xmm11, xmmword ptr [rsp + 0x140]
140acb2d0: movaps xmm12, xmmword ptr [rsp + 0x150]
140acb2d9: movaps xmm13, xmmword ptr [rsp + 0x160]
140acb2e2: movaps xmm14, xmmword ptr [rsp + 0x170]
140acb2eb: add rsp, 0x188
140acb2f2: pop rbx
140acb2f3: pop rbp
140acb2f4: pop rdi
140acb2f5: pop rsi
140acb2f6: pop r12
140acb2f8: pop r13
140acb2fa: pop r14
140acb2fc: pop r15
140acb2fe: ret
140acb2ff: mov al, 1
140acb301: jmp 0x140acb29c
