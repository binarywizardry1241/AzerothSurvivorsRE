0x1403deb60: push rbp
0x1403deb61: push r14
0x1403deb63: push rsi
0x1403deb64: push rdi
0x1403deb65: push rbx
0x1403deb66: sub rsp, 0xe0
0x1403deb6d: lea rbp, [rsp + 0x80]
0x1403deb75: movaps xmmword ptr [rbp + 0x50], xmm6
0x1403deb79: mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
0x1403deb81: mov rax, rcx
0x1403deb84: add rcx, 0x40
0x1403deb88: lea rdx, [rax + 0x5a8]
0x1403deb8f: mov qword ptr [rbp + 0x30], rcx
0x1403deb93: mov qword ptr [rbp + 0x38], rdx
0x1403deb97: mov qword ptr [rbp + 0x18], 0
0x1403deb9f: mov qword ptr [rbp + 0x20], 8
0x1403deba7: mov qword ptr [rbp + 0x28], 0
0x1403debaf: cmp qword ptr [rax + 0x70], 0
0x1403debb4: je 0x1403dec59
0x1403debba: movabs r9, 0x2e3026136b966c74
0x1403debc4: mov r8, qword ptr [rax + 0x58]
0x1403debc8: mov r10, qword ptr [rax + 0x60]
0x1403debcc: xor r11d, r11d
0x1403debcf: movdqa xmm0, xmmword ptr [rip + 0x5e52f09]
0x1403debd7: pcmpeqd xmm1, xmm1
0x1403debdb: movdqa xmm2, xmmword ptr [rip + 0x5e52f0d]
0x1403debe3: and r9, r10
0x1403debe6: movdqu xmm3, xmmword ptr [r8 + r9]
0x1403debec: movdqa xmm4, xmm3
0x1403debf0: pcmpeqb xmm4, xmm0
0x1403debf4: pmovmskb esi, xmm4
0x1403debf8: test esi, esi
0x1403debfa: je 0x1403dec40
0x1403debfc: tzcnt edi, esi
0x1403dec00: add rdi, r9
0x1403dec03: and rdi, r10
0x1403dec06: neg rdi
0x1403dec09: lea rdi, [rdi + rdi*2]
0x1403dec0d: movdqu xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
0x1403dec14: pcmpeqb xmm4, xmm2
0x1403dec18: pmovmskb ebx, xmm4
0x1403dec1c: cmp ebx, 0xffff
0x1403dec22: je 0x1403ded0d
0x1403dec28: lea edi, [rsi - 1]
0x1403dec2b: and di, si
0x1403dec2e: mov esi, edi
0x1403dec30: jne 0x1403debfc
0x1403dec32: nop word ptr cs:[rax + rax]
0x1403dec40: pcmpeqb xmm3, xmm1
0x1403dec44: pmovmskb esi, xmm3
0x1403dec48: test esi, esi
0x1403dec4a: jne 0x1403dec59
0x1403dec4c: add r9, r11
0x1403dec4f: add r9, 0x10
0x1403dec53: add r11, 0x10
0x1403dec57: jmp 0x1403debe3
0x1403dec59: movzx r8d, byte ptr [rax + 0xa0]
0x1403dec61: mov r8, qword ptr [rax + 0xc0]
0x1403dec68: mov r9, qword ptr [rax + 0xc8]
0x1403dec6f: movabs r10, 0x2e3026136b966c74
0x1403dec79: xor r11d, r11d
0x1403dec7c: movdqa xmm0, xmmword ptr [rip + 0x5e52e5c]
0x1403dec84: pcmpeqd xmm1, xmm1
0x1403dec88: movdqa xmm2, xmmword ptr [rip + 0x5e52e60]
0x1403dec90: and r10, r9
0x1403dec93: movdqu xmm3, xmmword ptr [r8 + r10]
0x1403dec99: movdqa xmm4, xmm3
0x1403dec9d: pcmpeqb xmm4, xmm0
0x1403deca1: pmovmskb ebx, xmm4
0x1403deca5: test ebx, ebx
0x1403deca7: je 0x1403decf0
0x1403deca9: tzcnt edi, ebx
0x1403decad: add rdi, r10
0x1403decb0: and rdi, r9
0x1403decb3: mov r14, rdi
0x1403decb6: shl r14, 7
0x1403decba: mov rsi, r8
0x1403decbd: sub rsi, r14
0x1403decc0: movdqu xmm4, xmmword ptr [rsi - 0x80]
0x1403decc5: pcmpeqb xmm4, xmm2
0x1403decc9: pmovmskb r14d, xmm4
0x1403decce: cmp r14d, 0xffff
0x1403decd5: je 0x1403ded2b
0x1403decd7: lea esi, [rbx - 1]
0x1403decda: and si, bx
0x1403decdd: mov ebx, esi
0x1403decdf: jne 0x1403deca9
0x1403dece1: nop word ptr cs:[rax + rax]
0x1403decf0: pcmpeqb xmm3, xmm1
0x1403decf4: pmovmskb esi, xmm3
0x1403decf8: test esi, esi
0x1403decfa: jne 0x1403deda1
0x1403ded00: add r10, r11
0x1403ded03: add r10, 0x10
0x1403ded07: add r11, 0x10
0x1403ded0b: jmp 0x1403dec90
0x1403ded0d: lea rax, [r8 + rdi*8]
0x1403ded11: mov rsi, qword ptr [rax - 8]
0x1403ded15: mov edx, 8
0x1403ded1a: xor r8d, r8d
0x1403ded1d: mov r9, rsi
0x1403ded20: call 0x14508f7a0
0x1403ded25: nop 
0x1403ded26: jmp 0x1403def16
0x1403ded2b: lea r10, [rdi - 0x10]
0x1403ded2f: and r10, r9
0x1403ded32: movdqu xmm0, xmmword ptr [r8 + r10]
0x1403ded38: pcmpeqd xmm1, xmm1
0x1403ded3c: pcmpeqb xmm0, xmm1
0x1403ded40: pmovmskb r9d, xmm0
0x1403ded45: movdqu xmm0, xmmword ptr [r8 + rdi]
0x1403ded4b: pcmpeqb xmm0, xmm1
0x1403ded4f: pmovmskb r11d, xmm0
0x1403ded54: mov bx, 0x1f
0x1403ded58: bsr bx, r9w
0x1403ded5d: xor ebx, 0xf
0x1403ded60: or r11d, 0x10000
0x1403ded67: tzcnt r11d, r11d
0x1403ded6c: add r11d, ebx
0x1403ded6f: mov r9b, 0x80
0x1403ded72: cmp r11w, 0xf
0x1403ded77: ja 0x1403ded83
0x1403ded79: inc qword ptr [rax + 0xd0]
0x1403ded80: mov r9b, 0xff
0x1403ded83: mov byte ptr [r8 + rdi], r9b
0x1403ded87: mov byte ptr [r8 + r10 + 0x10], r9b
0x1403ded8c: dec qword ptr [rax + 0xd8]
0x1403ded93: mov r8, qword ptr [rsi - 0x70]
0x1403ded97: cmp r8, 2
0x1403ded9b: jne 0x1403def47
0x1403deda1: mov rdi, rax
0x1403deda4: mov rsi, qword ptr [rdx]
0x1403deda7: lea rax, [rsi + 1]
0x1403dedab: mov qword ptr [rdx], rax
0x1403dedae: mov word ptr [rbp - 8], 0x100
0x1403dedb4: mov qword ptr [rbp - 0x58], 1
0x1403dedbc: movdqu xmm0, xmmword ptr [rip + 0x5e94074]
0x1403dedc4: movdqu xmmword ptr [rbp - 0x50], xmm0
0x1403dedc9: mov qword ptr [rbp - 0x30], 1
0x1403dedd1: mov qword ptr [rbp - 0x28], 0
0x1403dedd9: mov qword ptr [rbp - 0x10], 0
0x1403dede1: mov byte ptr [rbp - 6], 1
0x1403dede5: mov qword ptr [rbp - 0x40], 0
0x1403deded: mov byte ptr [rbp - 0x20], 2
0x1403dedf1: lea r8, [rbp - 0x58]
0x1403dedf5: mov rdx, rsi
0x1403dedf8: call 0x14006dbf0
0x1403dedfd: nop 
0x1403dedfe: mov rcx, rdi
0x1403dee01: add rcx, 0x58
0x1403dee05: lea rdx, [rip + 0x5ea3404]
0x1403dee0c: mov r8, rsi
0x1403dee0f: call 0x14006da40
0x1403dee14: nop 
0x1403dee15: mov rdi, qword ptr [rbp + 0x28]
0x1403dee19: cmp rdi, qword ptr [rbp + 0x18]
0x1403dee1d: jne 0x1403dee29
0x1403dee1f: lea rcx, [rbp + 0x18]
0x1403dee23: call 0x146061cb0
0x1403dee28: nop 
0x1403dee29: mov rax, qword ptr [rbp + 0x20]
0x1403dee2d: mov qword ptr [rax + rdi*8], rsi
0x1403dee31: inc rdi
0x1403dee34: mov qword ptr [rbp + 0x28], rdi
0x1403dee38: mov qword ptr [rbp - 0x58], 0
0x1403dee40: mov qword ptr [rbp - 0x50], 8
0x1403dee48: mov qword ptr [rbp - 0x48], 0
0x1403dee50: movdqu xmm0, xmmword ptr [rip + 0x5ea3bb8]
0x1403dee58: movdqu xmmword ptr [rbp - 0x40], xmm0
0x1403dee5d: movdqu xmm1, xmmword ptr [rip + 0x5ea3bbb]
0x1403dee65: movdqu xmmword ptr [rbp - 0x30], xmm1
0x1403dee6a: mov qword ptr [rbp - 0x20], 0
0x1403dee72: mov qword ptr [rbp - 0x18], 8
0x1403dee7a: mov qword ptr [rbp - 0x10], 0
0x1403dee82: movdqu xmmword ptr [rbp - 8], xmm0
0x1403dee87: movdqu xmmword ptr [rbp + 8], xmm1
0x1403dee8c: mov rcx, qword ptr [rbp + 0x30]
0x1403dee90: mov byte ptr [rbp + 0x47], 1
0x1403dee94: lea r8, [rbp - 0x58]
0x1403dee98: mov rdx, rsi
0x1403dee9b: call 0x14506a8c0
0x1403deea0: nop 
0x1403deea1: mov rax, qword ptr [rbp + 0x28]
0x1403deea5: test rax, rax
0x1403deea8: je 0x1403deeb1
0x1403deeaa: dec rax
0x1403deead: mov qword ptr [rbp + 0x28], rax
0x1403deeb1: mov rax, qword ptr [rbp + 0x30]
0x1403deeb5: mov rax, qword ptr [rax + 8]
0x1403deeb9: imul rcx, rsi, 0x130
0x1403deec0: add rcx, rax
0x1403deec3: add rcx, 0x58
0x1403deec7: mov qword ptr [rbp - 0x60], rcx
0x1403deecb: call 0x14005dc70
0x1403deed0: nop 
0x1403deed1: movdqu xmm0, xmmword ptr [rbp - 0x58]
0x1403deed6: movdqu xmm1, xmmword ptr [rbp - 0x48]
0x1403deedb: movdqu xmm2, xmmword ptr [rbp - 0x38]
0x1403deee0: movdqu xmm3, xmmword ptr [rbp - 0x28]
0x1403deee5: movdqu xmm4, xmmword ptr [rbp - 0x18]
0x1403deeea: movups xmm5, xmmword ptr [rbp - 8]
0x1403deeee: movups xmm6, xmmword ptr [rbp + 8]
0x1403deef2: mov rax, qword ptr [rbp - 0x60]
0x1403deef6: movups xmmword ptr [rax + 0x60], xmm6
0x1403deefa: movups xmmword ptr [rax + 0x50], xmm5
0x1403deefe: movdqu xmmword ptr [rax + 0x40], xmm4
0x1403def03: movdqu xmmword ptr [rax + 0x30], xmm3
0x1403def08: movdqu xmmword ptr [rax + 0x20], xmm2
0x1403def0d: movdqu xmmword ptr [rax + 0x10], xmm1
0x1403def12: movdqu xmmword ptr [rax], xmm0
0x1403def16: mov rdx, qword ptr [rbp + 0x18]
0x1403def1a: test rdx, rdx
0x1403def1d: je 0x1403def32
0x1403def1f: mov rcx, qword ptr [rbp + 0x20]
0x1403def23: shl rdx, 3
0x1403def27: mov r8d, 8
0x1403def2d: call 0x1400021d0
0x1403def32: mov rax, rsi
0x1403def35: movaps xmm6, xmmword ptr [rbp + 0x50]
0x1403def39: add rsp, 0xe0
0x1403def40: pop rbx
0x1403def41: pop rdi
0x1403def42: pop rsi
0x1403def43: pop r14
0x1403def45: pop rbp
0x1403def46: ret 
0x1403def47: mov rax, qword ptr [rsi - 8]
0x1403def4b: mov qword ptr [rbp + 0x10], rax
0x1403def4f: movups xmm0, xmmword ptr [rsi - 0x18]
0x1403def53: movups xmmword ptr [rbp], xmm0
0x1403def57: movups xmm0, xmmword ptr [rsi - 0x28]
0x1403def5b: movups xmmword ptr [rbp - 0x10], xmm0
0x1403def5f: movdqu xmm0, xmmword ptr [rsi - 0x68]
0x1403def64: movdqu xmm1, xmmword ptr [rsi - 0x58]
0x1403def69: movdqu xmm2, xmmword ptr [rsi - 0x48]
0x1403def6e: movdqu xmm3, xmmword ptr [rsi - 0x38]
0x1403def73: movdqu xmmword ptr [rbp - 0x20], xmm3
0x1403def78: movdqu xmmword ptr [rbp - 0x30], xmm2
0x1403def7d: movdqu xmmword ptr [rbp - 0x40], xmm1
0x1403def82: movdqu xmmword ptr [rbp - 0x50], xmm0
0x1403def87: mov qword ptr [rbp - 0x58], r8
0x1403def8b: lea rcx, [rbp - 0x58]
0x1403def8f: lea rdx, [rbp + 0x18]
0x1403def93: call 0x14502ee80
0x1403def98: nop 
0x1403def99: mov rsi, rax
0x1403def9c: mov rdx, qword ptr [rbp + 0x18]
0x1403defa0: test rdx, rdx
0x1403defa3: jne 0x1403def1f
0x1403defa9: jmp 0x1403def32
