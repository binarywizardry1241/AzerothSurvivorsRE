1419bc530: push r15
1419bc532: push r14
1419bc534: push r13
1419bc536: push r12
1419bc538: push rsi
1419bc539: push rdi
1419bc53a: push rbp
1419bc53b: push rbx
1419bc53c: sub rsp, 0x1b8
1419bc543: movaps xmmword ptr [rsp + 0x1a0], xmm15
1419bc54c: movaps xmmword ptr [rsp + 0x190], xmm14
1419bc555: movaps xmmword ptr [rsp + 0x180], xmm13
1419bc55e: movaps xmmword ptr [rsp + 0x170], xmm12
1419bc567: movaps xmmword ptr [rsp + 0x160], xmm11
1419bc570: movaps xmmword ptr [rsp + 0x150], xmm10
1419bc579: movaps xmmword ptr [rsp + 0x140], xmm9
1419bc582: movaps xmmword ptr [rsp + 0x130], xmm8
1419bc58b: movaps xmmword ptr [rsp + 0x120], xmm7
1419bc593: movaps xmmword ptr [rsp + 0x110], xmm6
1419bc59b: mov rsi, rcx
1419bc59e: movss xmm3, dword ptr [rsp + 0x220]
1419bc5a7: mov r11, qword ptr [rdx + 0x88]
1419bc5ae: test r11, r11
1419bc5b1: je 0x1419bce21
1419bc5b7: mov r15, qword ptr [rdx + 0xb0]
1419bc5be: mov rcx, qword ptr [rdx + 0xb8]
1419bc5c5: mov rdi, qword ptr [rdx + 0xf8]
1419bc5cc: mov rax, qword ptr [rdx + 0x100]
1419bc5d3: mov qword ptr [rsp + 0x60], rax
1419bc5d8: mov rax, qword ptr [rdx + 0xc8]
1419bc5df: mov qword ptr [rsp + 0x90], rax
1419bc5e7: mov rax, qword ptr [rdx + 0xd0]
1419bc5ee: mov qword ptr [rsp + 0x78], rax
1419bc5f3: mov r10, qword ptr [rdx + 0x80]
1419bc5fa: mov rax, qword ptr [rdx + 0x38]
1419bc5fe: mov qword ptr [rsp + 0x88], rax
1419bc606: mov rax, qword ptr [rdx + 0x40]
1419bc60a: mov qword ptr [rsp + 0x98], rax
1419bc612: mov r14, qword ptr [rdx + 0x50]
1419bc616: mov rbx, qword ptr [rdx + 0x58]
1419bc61a: mov rax, qword ptr [rdx + 0x68]
1419bc61e: mov qword ptr [rsp + 0x80], rax
1419bc626: mov rax, qword ptr [rdx + 0x70]
1419bc62a: mov qword ptr [rsp + 0x68], rax
1419bc62f: imul rbp, r11, 0x2c
1419bc633: add rbp, r10
1419bc636: movsd xmm6, qword ptr [r8]
1419bc63b: movshdup xmm7, xmm6
1419bc63f: movss xmm8, dword ptr [r8 + 8]
1419bc645: add r15, 0x10
1419bc649: movss xmm11, dword ptr [rip + 0x4615102]
1419bc652: xor r12d, r12d
1419bc655: movaps xmm9, xmmword ptr [rip + 0x43de8e3]
1419bc65d: movss xmm15, dword ptr [rip + 0x46d981a]
1419bc666: xorps xmm14, xmm14
1419bc66a: lea r8, [rsp + 0xe0]
1419bc672: mov r13, r10
1419bc675: mov qword ptr [rsp + 0x50], 0
1419bc67e: imul rdx, r12, 0xa8
1419bc685: add rdx, rdi
1419bc688: lea rax, [r12 + r12*2]
1419bc68c: lea rax, [r15 + rax*8]
1419bc690: jmp 0x1419bc6bb
1419bc692: nop word ptr cs:[rax + rax]
1419bc6a0: add r13, 0x2c
1419bc6a4: add rdx, 0xa8
1419bc6ab: add rax, 0x18
1419bc6af: inc r12
1419bc6b2: cmp r13, rbp
1419bc6b5: je 0x1419bca6b
1419bc6bb: ucomiss xmm6, dword ptr [r13 + 4]
1419bc6c0: jb 0x1419bc6a0
1419bc6c2: movss xmm0, dword ptr [r13 + 0x10]
1419bc6c8: ucomiss xmm0, xmm6
1419bc6cb: jb 0x1419bc6a0
1419bc6cd: ucomiss xmm7, dword ptr [r13 + 8]
1419bc6d2: jb 0x1419bc6a0
1419bc6d4: movss xmm0, dword ptr [r13 + 0x14]
1419bc6da: ucomiss xmm0, xmm7
1419bc6dd: jb 0x1419bc6a0
1419bc6df: ucomiss xmm8, dword ptr [r13 + 0xc]
1419bc6e4: jb 0x1419bc6a0
1419bc6e6: mov qword ptr [rsp + 0x70], rdi
1419bc6eb: mov dword ptr [rsp + 0x2c], r9d
1419bc6f0: mov qword ptr [rsp + 0x38], r11
1419bc6f5: mov qword ptr [rsp + 0x40], r10
1419bc6fa: mov qword ptr [rsp + 0x48], rsi
1419bc6ff: cmp r12, rcx
1419bc702: jae 0x1419bc71c
1419bc704: mov rdi, qword ptr [rax - 8]
1419bc708: mov rsi, qword ptr [rax]
1419bc70b: cmp r12, qword ptr [rsp + 0x60]
1419bc710: mov qword ptr [rsp + 0x58], rcx
1419bc715: jb 0x1419bc733
1419bc717: jmp 0x1419bc8e1
1419bc71c: mov edi, 4
1419bc721: xor esi, esi
1419bc723: cmp r12, qword ptr [rsp + 0x60]
1419bc728: mov qword ptr [rsp + 0x58], rcx
1419bc72d: jae 0x1419bc8e1
1419bc733: cmp qword ptr [rdx], -1
1419bc737: je 0x1419bc8e1
1419bc73d: mov rcx, r8
1419bc740: movaps xmm2, xmm6
1419bc743: movaps xmm3, xmm7
1419bc746: call 0x1423079f0
1419bc74b: movups xmm0, xmmword ptr [rsp + 0xe0]
1419bc753: movups xmm1, xmmword ptr [rsp + 0xf0]
1419bc75b: movups xmm2, xmmword ptr [rsp + 0x100]
1419bc763: movaps xmmword ptr [rsp + 0xd0], xmm2
1419bc76b: movaps xmmword ptr [rsp + 0xc0], xmm1
1419bc773: movaps xmmword ptr [rsp + 0xb0], xmm0
1419bc77b: lea rcx, [rsp + 0xb0]
1419bc783: call 0x142307b90
1419bc788: cmp rax, 1
1419bc78c: je 0x1419bc7d1
1419bc78e: mov rsi, qword ptr [rsp + 0x48]
1419bc793: mov r10, qword ptr [rsp + 0x40]
1419bc798: mov r11, qword ptr [rsp + 0x38]
1419bc79d: mov r9d, dword ptr [rsp + 0x2c]
1419bc7a2: mov rcx, qword ptr [rsp + 0x30]
1419bc7a7: lea r8, [rsp + 0xe0]
1419bc7af: jmp 0x1419bca43
1419bc7b4: nop word ptr cs:[rax + rax]
1419bc7c0: lea rcx, [rsp + 0xb0]
1419bc7c8: call 0x142307b90
1419bc7cd: test al, 1
1419bc7cf: je 0x1419bc78e
1419bc7d1: cmp rdx, rsi
1419bc7d4: jae 0x1419bc7c0
1419bc7d6: lea rax, [rdx + rdx*8]
1419bc7da: movss xmm3, dword ptr [rdi + rax*4 + 4]
1419bc7e0: movsd xmm0, qword ptr [rdi + rax*4 + 0x10]
1419bc7e6: movsd xmm4, qword ptr [rdi + rax*4 + 0x18]
1419bc7ec: movshdup xmm1, xmm4
1419bc7f0: movsldup xmm2, xmm0
1419bc7f4: movss xmm5, dword ptr [rdi + rax*4]
1419bc7f9: movss xmm2, xmm5
1419bc7fd: subps xmm2, xmm4
1419bc800: movshdup xmm12, xmm2
1419bc805: mulss xmm12, xmm2
1419bc80a: movss xmm5, dword ptr [rdi + rax*4 + 0xc]
1419bc810: movaps xmm10, xmm4
1419bc814: subss xmm10, xmm5
1419bc819: movaps xmm5, xmm3
1419bc81c: subss xmm5, xmm1
1419bc820: mulss xmm5, xmm10
1419bc825: addss xmm5, xmm12
1419bc82a: movaps xmm12, xmm5
1419bc82e: andps xmm12, xmm9
1419bc832: ucomiss xmm15, xmm12
1419bc836: ja 0x1419bc7c0
1419bc838: shufps xmm2, xmm2, 0xe1
1419bc83c: movaps xmm12, xmm6
1419bc840: subps xmm12, xmm4
1419bc844: subss xmm1, xmm3
1419bc848: unpcklps xmm1, xmm10
1419bc84c: mulps xmm2, xmm12
1419bc850: shufps xmm12, xmm12, 0xe1
1419bc855: shufps xmm1, xmm1, 0xe1
1419bc859: mulps xmm1, xmm12
1419bc85d: addps xmm1, xmm2
1419bc860: movsldup xmm2, xmm5
1419bc864: divps xmm1, xmm2
1419bc867: ucomiss xmm14, xmm1
1419bc86b: ja 0x1419bc7c0
1419bc871: movshdup xmm3, xmm1
1419bc875: ucomiss xmm14, xmm3
1419bc879: ja 0x1419bc7c0
1419bc87f: movss xmm2, dword ptr [rip + 0x43b0ae5]
1419bc887: subss xmm2, xmm1
1419bc88b: subss xmm2, xmm3
1419bc88f: ucomiss xmm14, xmm2
1419bc893: ja 0x1419bc7c0
1419bc899: movss xmm3, dword ptr [rdi + rax*4 + 8]
1419bc89f: movss xmm0, xmm3
1419bc8a3: mulps xmm0, xmm1
1419bc8a6: movshdup xmm1, xmm0
1419bc8aa: mulss xmm2, dword ptr [rdi + rax*4 + 0x20]
1419bc8b0: addss xmm1, xmm0
1419bc8b4: addss xmm2, xmm1
1419bc8b8: ucomiss xmm8, xmm2
1419bc8bc: jb 0x1419bc7c0
1419bc8c2: ucomiss xmm2, xmm11
1419bc8c6: jbe 0x1419bc7c0
1419bc8cc: mov al, 1
1419bc8ce: mov qword ptr [rsp + 0x50], rax
1419bc8d3: mov qword ptr [rsp + 0x30], r12
1419bc8d8: movaps xmm11, xmm2
1419bc8dc: jmp 0x1419bc7c0
1419bc8e1: test rsi, rsi
1419bc8e4: je 0x1419bca2a
1419bc8ea: lea rax, [rsi + rsi*8]
1419bc8ee: lea rax, [rdi + rax*4]
1419bc8f2: mov rsi, qword ptr [rsp + 0x48]
1419bc8f7: mov r10, qword ptr [rsp + 0x40]
1419bc8fc: mov r11, qword ptr [rsp + 0x38]
1419bc901: mov r9d, dword ptr [rsp + 0x2c]
1419bc906: mov rcx, qword ptr [rsp + 0x30]
1419bc90b: jmp 0x1419bc91d
1419bc90d: nop dword ptr [rax]
1419bc910: add rdi, 0x24
1419bc914: cmp rdi, rax
1419bc917: je 0x1419bca43
1419bc91d: movss xmm4, dword ptr [rdi + 4]
1419bc922: movss xmm3, dword ptr [rdi + 0x1c]
1419bc927: movsd xmm0, qword ptr [rdi + 8]
1419bc92c: movsd xmm2, qword ptr [rdi + 0x14]
1419bc931: movss xmm1, dword ptr [rdi]
1419bc935: shufps xmm1, xmm2, 0xd4
1419bc939: shufps xmm1, xmm2, 0xf2
1419bc93d: movaps xmm5, xmm2
1419bc940: shufps xmm5, xmm0, 0x11
1419bc944: shufps xmm5, xmm0, 0xe2
1419bc948: subps xmm1, xmm5
1419bc94b: movss xmm5, dword ptr [rdi + 0x10]
1419bc950: movaps xmm10, xmm4
1419bc954: unpcklps xmm10, xmm5
1419bc958: movsldup xmm5, xmm3
1419bc95c: subps xmm10, xmm5
1419bc960: movaps xmm12, xmm1
1419bc964: mulps xmm12, xmm10
1419bc968: movshdup xmm5, xmm12
1419bc96d: addps xmm5, xmm12
1419bc971: movaps xmm12, xmm5
1419bc975: andps xmm12, xmm9
1419bc979: ucomiss xmm15, xmm12
1419bc97d: ja 0x1419bc910
1419bc97f: movaps xmm12, xmm6
1419bc983: subss xmm12, dword ptr [rdi + 0x18]
1419bc989: movaps xmm13, xmm7
1419bc98d: subss xmm13, xmm3
1419bc992: subss xmm3, xmm4
1419bc996: movsldup xmm4, xmm12
1419bc99b: shufps xmm3, xmm10, 0xd4
1419bc9a0: shufps xmm3, xmm10, 0xf2
1419bc9a5: mulps xmm3, xmm4
1419bc9a8: movsldup xmm4, xmm13
1419bc9ad: mulps xmm1, xmm4
1419bc9b0: addps xmm1, xmm3
1419bc9b3: movsldup xmm3, xmm5
1419bc9b7: divps xmm1, xmm3
1419bc9ba: ucomiss xmm14, xmm1
1419bc9be: ja 0x1419bc910
1419bc9c4: movshdup xmm4, xmm1
1419bc9c8: ucomiss xmm14, xmm4
1419bc9cc: ja 0x1419bc910
1419bc9d2: movss xmm3, dword ptr [rip + 0x43b0992]
1419bc9da: subss xmm3, xmm1
1419bc9de: subss xmm3, xmm4
1419bc9e2: ucomiss xmm14, xmm3
1419bc9e6: ja 0x1419bc910
1419bc9ec: unpcklps xmm0, xmm2
1419bc9ef: mulps xmm0, xmm1
1419bc9f2: movshdup xmm1, xmm0
1419bc9f6: mulss xmm3, dword ptr [rdi + 0x20]
1419bc9fb: addss xmm1, xmm0
1419bc9ff: addss xmm3, xmm1
1419bca03: ucomiss xmm8, xmm3
1419bca07: jb 0x1419bc910
1419bca0d: ucomiss xmm3, xmm11
1419bca11: jbe 0x1419bc910
1419bca17: mov cl, 1
1419bca19: mov qword ptr [rsp + 0x50], rcx
1419bca1e: mov rcx, r12
1419bca21: movaps xmm11, xmm3
1419bca25: jmp 0x1419bc910
1419bca2a: mov rsi, qword ptr [rsp + 0x48]
1419bca2f: mov r10, qword ptr [rsp + 0x40]
1419bca34: mov r11, qword ptr [rsp + 0x38]
1419bca39: mov r9d, dword ptr [rsp + 0x2c]
1419bca3e: mov rcx, qword ptr [rsp + 0x30]
1419bca43: mov qword ptr [rsp + 0x30], rcx
1419bca48: add r13, 0x2c
1419bca4c: inc r12
1419bca4f: cmp r13, rbp
1419bca52: movss xmm3, dword ptr [rsp + 0x220]
1419bca5b: mov rcx, qword ptr [rsp + 0x58]
1419bca60: mov rdi, qword ptr [rsp + 0x70]
1419bca65: jne 0x1419bc67e
1419bca6b: xor r12d, r12d
1419bca6e: movss xmm1, dword ptr [rip + 0x451acf2]
1419bca76: movss xmm4, dword ptr [rip + 0x45351ca]
1419bca7e: movss xmm5, dword ptr [rip + 0x43b41ae]
1419bca86: movaps xmm15, xmmword ptr [rip + 0x43b0d52]
1419bca8e: xor r15d, r15d
1419bca91: mov r13, r10
1419bca94: mov rdx, qword ptr [rsp + 0x30]
1419bca99: add r13, 0x2c
1419bca9d: jmp 0x1419bcab0
1419bca9f: nop
1419bcaa0: inc r12
1419bcaa3: cmp r13, rbp
1419bcaa6: lea r13, [r13 + 0x2c]
1419bcaaa: je 0x1419bcdcd
1419bcab0: ucomiss xmm6, dword ptr [r13 - 0x28]
1419bcab5: jb 0x1419bcaa0
1419bcab7: movss xmm0, dword ptr [r13 - 0x1c]
1419bcabd: ucomiss xmm0, xmm6
1419bcac0: jb 0x1419bcaa0
1419bcac2: ucomiss xmm7, dword ptr [r13 - 0x24]
1419bcac7: jb 0x1419bcaa0
1419bcac9: movss xmm0, dword ptr [r13 - 0x18]
1419bcacf: ucomiss xmm0, xmm7
1419bcad2: jb 0x1419bcaa0
1419bcad4: ucomiss xmm8, dword ptr [r13 - 0x20]
1419bcad9: jb 0x1419bcaa0
1419bcadb: mov r8, rdx
1419bcade: movzx ecx, word ptr [r13 - 4]
1419bcae3: movzx edx, word ptr [r13 - 2]
1419bcae8: add rdx, rcx
1419bcaeb: mov rax, qword ptr [rsp + 0x68]
1419bcaf0: cmp rax, rdx
1419bcaf3: cmovb rdx, rax
1419bcaf7: cmp rax, rcx
1419bcafa: jb 0x1419bd111
1419bcb00: mov qword ptr [rsp + 0x30], r15
1419bcb05: mov dword ptr [rsp + 0x2c], r9d
1419bcb0a: mov qword ptr [rsp + 0x38], r11
1419bcb0f: mov qword ptr [rsp + 0x40], r10
1419bcb14: mov qword ptr [rsp + 0x48], rsi
1419bcb19: cmp rdx, rcx
1419bcb1c: jne 0x1419bcb26
1419bcb1e: mov rdx, r8
1419bcb21: jmp 0x1419bcda8
1419bcb26: lea rax, [rdx + rdx*2]
1419bcb2a: mov rdx, qword ptr [rsp + 0x80]
1419bcb32: lea r15, [rdx + rax*2]
1419bcb36: lea rax, [rcx + rcx*2]
1419bcb3a: lea rsi, [rdx + rax*2]
1419bcb3e: mov rdx, r8
1419bcb41: mov qword ptr [rsp + 0x58], rdx
1419bcb46: movss dword ptr [rsp + 0x60], xmm11
1419bcb4d: movaps xmm12, xmm11
1419bcb51: addss xmm12, xmm1
1419bcb56: jmp 0x1419bcb7d
1419bcb58: cmp rdx, qword ptr [rsp + 0x38]
1419bcb5d: jb 0x1419bcd52
1419bcb63: nop word ptr cs:[rax + rax]
1419bcb70: add rsi, 6
1419bcb74: cmp rsi, r15
1419bcb77: je 0x1419bcd94
1419bcb7d: movzx eax, word ptr [rsi]
1419bcb80: cmp rbx, rax
1419bcb83: jbe 0x1419bcb70
1419bcb85: lea rax, [rax + rax*4]
1419bcb89: movsd xmm0, qword ptr [r14 + rax*4]
1419bcb8f: movss xmm14, dword ptr [r14 + rax*4 + 8]
1419bcb96: movss xmm13, dword ptr [r14 + rax*4 + 0xc]
1419bcb9d: movaps xmm1, xmm14
1419bcba1: andps xmm1, xmm9
1419bcba5: ucomiss xmm4, xmm1
1419bcba8: movaps xmm2, xmm6
1419bcbab: mulps xmm2, xmm0
1419bcbae: movshdup xmm10, xmm2
1419bcbb3: addss xmm10, xmm2
1419bcbb8: jbe 0x1419bcbe0
1419bcbba: movaps xmm2, xmm8
1419bcbbe: mulss xmm2, xmm14
1419bcbc3: addss xmm2, xmm10
1419bcbc8: addss xmm2, xmm13
1419bcbcd: andps xmm2, xmm9
1419bcbd1: ucomiss xmm2, xmm5
1419bcbd4: movaps xmm11, xmm8
1419bcbd8: ja 0x1419bcb70
1419bcbda: jmp 0x1419bcbfc
1419bcbdc: nop dword ptr [rax]
1419bcbe0: movaps xmm11, xmm13
1419bcbe4: addss xmm11, xmm10
1419bcbe9: xorps xmm11, xmm15
1419bcbed: divss xmm11, xmm14
1419bcbf2: ucomiss xmm11, xmm8
1419bcbf6: ja 0x1419bcb70
1419bcbfc: ucomiss xmm12, xmm11
1419bcc00: ja 0x1419bcb70
1419bcc06: lea rcx, [r14 + rax*4]
1419bcc0a: movzx eax, word ptr [rcx + 0x12]
1419bcc0e: cmp rax, 3
1419bcc12: jb 0x1419bcb70
1419bcc18: movzx ecx, word ptr [rcx + 0x10]
1419bcc1c: lea rdx, [rax + rcx]
1419bcc20: cmp rdx, qword ptr [rsp + 0x98]
1419bcc28: ja 0x1419bcb70
1419bcc2e: lea rcx, [rcx + rcx*2]
1419bcc32: mov rdx, qword ptr [rsp + 0x88]
1419bcc3a: lea rdx, [rdx + rcx*4]
1419bcc3e: andps xmm0, xmm9
1419bcc42: movaps xmm2, xmm1
1419bcc45: cmpnless xmm2, xmm0
1419bcc4a: pshufd xmm3, xmm0, 0xf5
1419bcc4f: ucomiss xmm3, xmm1
1419bcc52: cmpnless xmm3, xmm0
1419bcc57: orps xmm3, xmm2
1419bcc5a: movd r8d, xmm3
1419bcc5f: setb cl
1419bcc62: and cl, r8b
1419bcc65: movzx r9d, cl
1419bcc69: mov r10d, 2
1419bcc6f: sub r10, r9
1419bcc72: mov r9d, r8d
1419bcc75: not r9b
1419bcc78: movzx r9d, r9b
1419bcc7c: and r9d, 1
1419bcc80: mov qword ptr [rsp + 0xa0], r9
1419bcc88: mov qword ptr [rsp + 0xa8], r10
1419bcc90: lea rax, [rax + rax*2]
1419bcc94: lea rax, [rdx + rax*4]
1419bcc98: mov qword ptr [rsp + 0xb0], rdx
1419bcca0: mov qword ptr [rsp + 0xb8], rax
1419bcca8: lea rax, [rsp + 0xa0]
1419bccb0: mov qword ptr [rsp + 0xc0], rax
1419bccb8: lea rax, [rsp + 0xa8]
1419bccc0: mov qword ptr [rsp + 0xc8], rax
1419bccc8: movaps xmm1, xmm6
1419bcccb: test r8b, 1
1419bcccf: jne 0x1419bccd4
1419bccd1: movaps xmm1, xmm7
1419bccd4: movaps xmm15, xmm5
1419bccd8: movaps xmm9, xmm4
1419bccdc: movaps xmm2, xmm7
1419bccdf: test cl, cl
1419bcce1: jne 0x1419bcce7
1419bcce3: movaps xmm2, xmm11
1419bcce7: lea rcx, [rsp + 0xb0]
1419bccef: call 0x14179b520
1419bccf4: test al, al
1419bccf6: movss xmm3, dword ptr [rsp + 0x220]
1419bccff: movaps xmm4, xmm9
1419bcd03: movaps xmm9, xmmword ptr [rip + 0x43de235]
1419bcd0b: movaps xmm5, xmm15
1419bcd0f: xorps xmm0, xmm0
1419bcd12: movaps xmm15, xmmword ptr [rip + 0x43b0ac6]
1419bcd1a: je 0x1419bcb70
1419bcd20: mulss xmm14, xmm8
1419bcd25: addss xmm10, xmm14
1419bcd2a: addss xmm13, xmm10
1419bcd2f: ucomiss xmm13, xmm0
1419bcd33: setae al
1419bcd36: cmp word ptr [rsi + 4], 0
1419bcd3b: setle cl
1419bcd3e: xor cl, al
1419bcd40: mov rdx, r12
1419bcd43: jne 0x1419bcb58
1419bcd49: movzx edx, word ptr [rsi + 2]
1419bcd4d: jmp 0x1419bcb58
1419bcd52: mov rdi, r12
1419bcd55: cmp rdx, r12
1419bcd58: jne 0x1419bcd5e
1419bcd5a: movzx edi, word ptr [rsi + 2]
1419bcd5e: add rsi, 6
1419bcd62: cmp rdi, qword ptr [rsp + 0x38]
1419bcd67: setb al
1419bcd6a: cmp rdi, rdx
1419bcd6d: setne cl
1419bcd70: and cl, al
1419bcd72: movzx eax, cl
1419bcd75: mov qword ptr [rsp + 0x30], rax
1419bcd7a: mov al, 1
1419bcd7c: mov qword ptr [rsp + 0x50], rax
1419bcd81: cmp rsi, r15
1419bcd84: movss xmm1, dword ptr [rip + 0x451a9dc]
1419bcd8c: jne 0x1419bcb41
1419bcd92: jmp 0x1419bcda8
1419bcd94: mov rdx, qword ptr [rsp + 0x58]
1419bcd99: movss xmm11, dword ptr [rsp + 0x60]
1419bcda0: movss xmm1, dword ptr [rip + 0x451a9c0]
1419bcda8: inc r12
1419bcdab: cmp r13, rbp
1419bcdae: mov rsi, qword ptr [rsp + 0x48]
1419bcdb3: mov r10, qword ptr [rsp + 0x40]
1419bcdb8: mov r11, qword ptr [rsp + 0x38]
1419bcdbd: mov r9d, dword ptr [rsp + 0x2c]
1419bcdc2: mov r15, qword ptr [rsp + 0x30]
1419bcdc7: jne 0x1419bca99
1419bcdcd: test byte ptr [rsp + 0x50], 1
1419bcdd2: je 0x1419bce3d
1419bcdd4: cmp rdx, r11
1419bcdd7: jae 0x1419bce49
1419bcdd9: movaps xmm0, xmm8
1419bcddd: subss xmm0, xmm11
1419bcde2: ucomiss xmm0, dword ptr [rip + 0x46e871b]
1419bcde9: ja 0x1419bce49
1419bcdeb: imul rax, rdx, 0x2c
1419bcdef: test byte ptr [r10 + rax], 8
1419bcdf4: jne 0x1419bce49
1419bcdf6: cmp r9d, 1
1419bcdfa: jne 0x1419bce08
1419bcdfc: ucomiss xmm8, xmm3
1419bce00: jb 0x1419bce08
1419bce02: ucomiss xmm3, xmm11
1419bce06: ja 0x1419bce49
1419bce08: mov qword ptr [rsi], 1
1419bce0f: mov qword ptr [rsi + 8], rdx
1419bce13: mov qword ptr [rsi + 0x10], r15
1419bce17: mov eax, 0x18
1419bce1c: jmp 0x1419bd09e
1419bce21: xor ecx, ecx
1419bce23: cmp r9d, 1
1419bce27: jne 0x1419bd089
1419bce2d: movss xmm0, dword ptr [r8 + 8]
1419bce33: ucomiss xmm0, xmm3
1419bce36: jae 0x1419bce49
1419bce38: jmp 0x1419bd090
1419bce3d: cmp r9d, 1
1419bce41: jne 0x1419bce55
1419bce43: ucomiss xmm8, xmm3
1419bce47: jb 0x1419bce55
1419bce49: mov qword ptr [rsi], 0
1419bce50: jmp 0x1419bd097
1419bce55: mov r12, r11
1419bce58: mov r14, rsi
1419bce5b: movss xmm0, dword ptr [rip + 0x46148f1]
1419bce63: xor edx, edx
1419bce65: xorps xmm1, xmm1
1419bce68: xor ecx, ecx
1419bce6a: mov r8, r10
1419bce6d: xor esi, esi
1419bce6f: mov r15, r10
1419bce72: mov r13, qword ptr [rsp + 0x90]
1419bce7a: movss xmm15, dword ptr [rip + 0x46d8ffd]
1419bce83: lea r10, [rsi + rsi*2]
1419bce87: lea r11, [r10*8]
1419bce8f: add r11, r13
1419bce92: mov r10, rsi
1419bce95: jmp 0x1419bceb4
1419bce97: nop word ptr [rax + rax]
1419bcea0: add r8, 0x2c
1419bcea4: add r11, 0x18
1419bcea8: inc r10
1419bceab: cmp r8, rbp
1419bceae: je 0x1419bd057
1419bceb4: ucomiss xmm6, dword ptr [r8 + 4]
1419bceb9: jb 0x1419bcea0
1419bcebb: movss xmm2, dword ptr [r8 + 0x10]
1419bcec1: ucomiss xmm2, xmm6
1419bcec4: jb 0x1419bcea0
1419bcec6: ucomiss xmm7, dword ptr [r8 + 8]
1419bcecb: jb 0x1419bcea0
1419bcecd: movss xmm2, dword ptr [r8 + 0x14]
1419bced3: ucomiss xmm2, xmm7
1419bced6: jb 0x1419bcea0
1419bced8: ucomiss xmm8, dword ptr [r8 + 0xc]
1419bcedd: jb 0x1419bcea0
1419bcedf: cmp r10, qword ptr [rsp + 0x78]
1419bcee4: cmovae r11, rdx
1419bcee8: lea rsi, [r10 + 1]
1419bceec: add r8, 0x2c
1419bcef0: xor edi, edi
1419bcef2: nop word ptr cs:[rax + rax]
1419bcf00: test rdi, rdi
1419bcf03: je 0x1419bcf10
1419bcf05: cmp rdi, r9
1419bcf08: je 0x1419bcf10
1419bcf0a: mov rbx, rdi
1419bcf0d: jmp 0x1419bcf35
1419bcf0f: nop
1419bcf10: test r11, r11
1419bcf13: je 0x1419bd04e
1419bcf19: mov rbx, qword ptr [r11 + 8]
1419bcf1d: mov r11, qword ptr [r11 + 0x10]
1419bcf21: lea r9, [r11 + r11*8]
1419bcf25: lea r9, [rbx + r9*4]
1419bcf29: test r11, r11
1419bcf2c: je 0x1419bd04e
1419bcf32: xor r11d, r11d
1419bcf35: lea rdi, [rbx + 0x24]
1419bcf39: movss xmm10, dword ptr [rbx + 4]
1419bcf3f: movss xmm5, dword ptr [rbx + 0x1c]
1419bcf44: movsd xmm2, qword ptr [rbx + 8]
1419bcf49: movsd xmm4, qword ptr [rbx + 0x14]
1419bcf4e: movss xmm3, dword ptr [rbx]
1419bcf52: shufps xmm3, xmm4, 0xd4
1419bcf56: shufps xmm3, xmm4, 0xf2
1419bcf5a: movaps xmm11, xmm4
1419bcf5e: shufps xmm11, xmm2, 0x11
1419bcf63: shufps xmm11, xmm2, 0xe2
1419bcf68: subps xmm3, xmm11
1419bcf6c: movss xmm11, dword ptr [rbx + 0x10]
1419bcf72: movaps xmm12, xmm10
1419bcf76: unpcklps xmm12, xmm11
1419bcf7a: movsldup xmm11, xmm5
1419bcf7f: subps xmm12, xmm11
1419bcf83: movaps xmm13, xmm3
1419bcf87: mulps xmm13, xmm12
1419bcf8b: movshdup xmm11, xmm13
1419bcf90: addps xmm11, xmm13
1419bcf94: movaps xmm13, xmm11
1419bcf98: andps xmm13, xmm9
1419bcf9c: ucomiss xmm15, xmm13
1419bcfa0: ja 0x1419bcf00
1419bcfa6: movaps xmm13, xmm6
1419bcfaa: subss xmm13, dword ptr [rbx + 0x18]
1419bcfb0: movaps xmm14, xmm7
1419bcfb4: subss xmm14, xmm5
1419bcfb9: subss xmm5, xmm10
1419bcfbe: movsldup xmm10, xmm13
1419bcfc3: shufps xmm5, xmm12, 0xd4
1419bcfc8: shufps xmm5, xmm12, 0xf2
1419bcfcd: mulps xmm5, xmm10
1419bcfd1: movsldup xmm10, xmm14
1419bcfd6: mulps xmm3, xmm10
1419bcfda: addps xmm3, xmm5
1419bcfdd: movsldup xmm5, xmm11
1419bcfe2: divps xmm3, xmm5
1419bcfe5: ucomiss xmm1, xmm3
1419bcfe8: ja 0x1419bcf00
1419bcfee: movshdup xmm10, xmm3
1419bcff3: ucomiss xmm1, xmm10
1419bcff7: ja 0x1419bcf00
1419bcffd: movss xmm5, dword ptr [rip + 0x43b0367]
1419bd005: subss xmm5, xmm3
1419bd009: subss xmm5, xmm10
1419bd00e: ucomiss xmm1, xmm5
1419bd011: ja 0x1419bcf00
1419bd017: unpcklps xmm2, xmm4
1419bd01a: mulps xmm2, xmm3
1419bd01d: movshdup xmm3, xmm2
1419bd021: mulss xmm5, dword ptr [rbx + 0x20]
1419bd026: addss xmm3, xmm2
1419bd02a: addss xmm5, xmm3
1419bd02e: ucomiss xmm8, xmm5
1419bd032: jb 0x1419bcf00
1419bd038: ucomiss xmm5, xmm0
1419bd03b: jbe 0x1419bcf00
1419bd041: mov cl, 1
1419bd043: movaps xmm0, xmm5
1419bd046: mov rax, r10
1419bd049: jmp 0x1419bcf00
1419bd04e: cmp r8, rbp
1419bd051: jne 0x1419bce83
1419bd057: test cl, 1
1419bd05a: je 0x1419bd08b
1419bd05c: subss xmm8, xmm0
1419bd061: movss xmm0, dword ptr [rip + 0x46e849b]
1419bd069: ucomiss xmm0, xmm8
1419bd06d: mov rsi, r14
1419bd070: jb 0x1419bd087
1419bd072: cmp rax, r12
1419bd075: jae 0x1419bd087
1419bd077: imul rdx, rax, 0x2c
1419bd07b: mov ecx, 1
1419bd080: test byte ptr [r15 + rdx], 8
1419bd085: je 0x1419bd090
1419bd087: xor ecx, ecx
1419bd089: jmp 0x1419bd090
1419bd08b: xor ecx, ecx
1419bd08d: mov rsi, r14
1419bd090: mov qword ptr [rsi], rcx
1419bd093: mov qword ptr [rsi + 8], rax
1419bd097: mov eax, 0x10
1419bd09c: xor edi, edi
1419bd09e: mov qword ptr [rsi + rax], rdi
1419bd0a2: mov rax, rsi
1419bd0a5: movaps xmm6, xmmword ptr [rsp + 0x110]
1419bd0ad: movaps xmm7, xmmword ptr [rsp + 0x120]
1419bd0b5: movaps xmm8, xmmword ptr [rsp + 0x130]
1419bd0be: movaps xmm9, xmmword ptr [rsp + 0x140]
1419bd0c7: movaps xmm10, xmmword ptr [rsp + 0x150]
1419bd0d0: movaps xmm11, xmmword ptr [rsp + 0x160]
1419bd0d9: movaps xmm12, xmmword ptr [rsp + 0x170]
1419bd0e2: movaps xmm13, xmmword ptr [rsp + 0x180]
1419bd0eb: movaps xmm14, xmmword ptr [rsp + 0x190]
1419bd0f4: movaps xmm15, xmmword ptr [rsp + 0x1a0]
1419bd0fd: add rsp, 0x1b8
1419bd104: pop rbx
1419bd105: pop rbp
1419bd106: pop rdi
1419bd107: pop rsi
1419bd108: pop r12
1419bd10a: pop r13
1419bd10c: pop r14
1419bd10e: pop r15
1419bd110: ret
1419bd111: lea r9, [rip + 0x46e91a0]
1419bd118: mov r8, qword ptr [rsp + 0x68]
1419bd11d: call 0x145d699f0
1419bd122: ud2
