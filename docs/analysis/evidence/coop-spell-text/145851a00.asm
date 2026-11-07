0x145851a00: push r15
0x145851a02: push r14
0x145851a04: push r13
0x145851a06: push r12
0x145851a08: push rsi
0x145851a09: push rdi
0x145851a0a: push rbp
0x145851a0b: push rbx
0x145851a0c: sub rsp, 0x98
0x145851a13: movaps xmmword ptr [rsp + 0x80], xmm8
0x145851a1c: movaps xmmword ptr [rsp + 0x70], xmm7
0x145851a21: movaps xmmword ptr [rsp + 0x60], xmm6
0x145851a26: mov rax, qword ptr [rcx]
0x145851a29: mov r12, qword ptr [rcx + 8]
0x145851a2d: cmp rax, r12
0x145851a30: je 0x145851c2e
0x145851a36: mov rdi, r8
0x145851a39: mov rbx, rdx
0x145851a3c: mov rsi, rcx
0x145851a3f: mov ebp, 2
0x145851a44: movss xmm6, dword ptr [rip + 0x68e974]
0x145851a4c: lea r14, [rsp + 0x20]
0x145851a51: lea r13, [rip + 0x17da554]
0x145851a58: movss xmm7, dword ptr [rip + 0x68e660]
0x145851a60: movss xmm8, dword ptr [rip + 0x68e447]
0x145851a69: nop dword ptr [rax]
0x145851a70: mov r15, rax
0x145851a73: movzx eax, byte ptr [rax]
0x145851a76: sub al, 0x24
0x145851a78: movzx eax, al
0x145851a7b: cmovb eax, ebp
0x145851a7e: test al, al
0x145851a80: je 0x145851ab0
0x145851a82: movzx eax, al
0x145851a85: cmp eax, 1
0x145851a88: jne 0x145851ae0
0x145851a8a: cmp byte ptr [r15 + 0x24], 2
0x145851a8f: movss xmm0, dword ptr [r15 + 0x20]
0x145851a95: mulss xmm0, dword ptr [rbx]
0x145851a99: mov eax, 1
0x145851a9e: je 0x145851b37
0x145851aa4: mulss xmm0, xmm6
0x145851aa8: jmp 0x145851b37
0x145851aad: nop dword ptr [rax]
0x145851ab0: movzx ecx, byte ptr [r15 + 8]
0x145851ab5: movss xmm0, dword ptr [r15 + 4]
0x145851abb: mulss xmm0, dword ptr [rbx]
0x145851abf: mov eax, 1
0x145851ac4: cmp ecx, 0x1a
0x145851ac7: ja 0x145851aa4
0x145851ac9: mov edx, 0x6008040
0x145851ace: bt edx, ecx
0x145851ad1: jb 0x145851b37
0x145851ad3: jmp 0x145851aa4
0x145851ad5: nop word ptr cs:[rax + rax]
0x145851ae0: movzx eax, byte ptr [rdi]
0x145851ae3: cmp al, 1
0x145851ae5: adc eax, 0
0x145851ae8: movzx eax, al
0x145851aeb: xorps xmm2, xmm2
0x145851aee: cvtsi2ss xmm2, eax
0x145851af2: mov rcx, r14
0x145851af5: mov rdx, r15
0x145851af8: call 0x1458551a0
0x145851afd: movzx ecx, byte ptr [rsp + 0x20]
0x145851b02: xor eax, eax
0x145851b04: cmp rcx, 0x23
0x145851b08: ja 0x145851c29
0x145851b0e: movsxd rdx, dword ptr [r13 + rcx*4]
0x145851b13: add rdx, r13
0x145851b16: lea rcx, [rsp + 0x24]
0x145851b1b: jmp rdx
0x145851b1d: movss xmm0, dword ptr [rsp + 0x24]
0x145851b23: jmp 0x145851b2e
0x145851b25: lea rcx, [rsp + 0x28]
0x145851b2a: movss xmm0, dword ptr [rcx]
0x145851b2e: mulss xmm0, xmm6
0x145851b32: mov eax, 1
0x145851b37: cmp eax, 1
0x145851b3a: je 0x145851c34
0x145851b40: lea rax, [r15 + 0x40]
0x145851b44: cmp rax, r12
0x145851b47: jne 0x145851a70
0x145851b4d: jmp 0x145851c32
0x145851b52: mov eax, 1
0x145851b57: movss xmm0, dword ptr [rsp + 0x24]
0x145851b5d: jmp 0x145851b37
0x145851b5f: cmp dword ptr [rsp + 0x28], -1
0x145851b64: jne 0x145851b1d
0x145851b66: movss xmm0, dword ptr [rsp + 0x2c]
0x145851b6c: jmp 0x145851b2e
0x145851b6e: mov rax, qword ptr [rsp + 0x30]
0x145851b73: cmp byte ptr [rax + 0x39], 7
0x145851b77: movzx eax, byte ptr [rsp + 0x21]
0x145851b7c: jne 0x145851c0d
0x145851b82: movzx ecx, al
0x145851b85: cmp al, 3
0x145851b87: mov edx, 3
0x145851b8c: cmovae ecx, edx
0x145851b8f: add cl, 2
0x145851b92: test al, al
0x145851b94: movzx eax, cl
0x145851b97: cmove eax, edx
0x145851b9a: movsx eax, al
0x145851b9d: xorps xmm0, xmm0
0x145851ba0: cvtsi2ss xmm0, eax
0x145851ba4: mulss xmm0, xmm7
0x145851ba8: jmp 0x145851b2e
0x145851baa: movzx eax, byte ptr [rsp + 0x21]
0x145851baf: mov ecx, eax
0x145851bb1: cmp al, 3
0x145851bb3: mov edx, 3
0x145851bb8: cmovae eax, edx
0x145851bbb: dec al
0x145851bbd: test cl, cl
0x145851bbf: movzx eax, al
0x145851bc2: mov ecx, 0
0x145851bc7: cmove eax, ecx
0x145851bca: movzx eax, al
0x145851bcd: lea rcx, [rip + 0x17bb42c]
0x145851bd4: movss xmm0, dword ptr [rcx + rax*4]
0x145851bd9: jmp 0x145851b2e
0x145851bde: movss xmm0, dword ptr [rsp + 0x24]
0x145851be4: movzx ecx, byte ptr [rsp + 0x21]
0x145851be9: mov eax, 1
0x145851bee: cmp ecx, 0x1a
0x145851bf1: jbe 0x145851ac9
0x145851bf7: jmp 0x145851aa4
0x145851bfc: mov eax, dword ptr [rsp + 0x24]
0x145851c00: xorps xmm0, xmm0
0x145851c03: cvtsi2ss xmm0, rax
0x145851c08: jmp 0x145851b32
0x145851c0d: cmp al, 1
0x145851c0f: adc al, 0xff
0x145851c11: movzx eax, al
0x145851c14: xorps xmm0, xmm0
0x145851c17: cvtsi2ss xmm0, eax
0x145851c1b: mulss xmm0, xmm7
0x145851c1f: addss xmm0, xmm8
0x145851c24: jmp 0x145851b2e
0x145851c29: jmp 0x145851b37
0x145851c2e: xor eax, eax
0x145851c30: jmp 0x145851c3b
0x145851c32: xor eax, eax
0x145851c34: add r15, 0x40
0x145851c38: mov qword ptr [rsi], r15
0x145851c3b: movaps xmm6, xmmword ptr [rsp + 0x60]
0x145851c40: movaps xmm7, xmmword ptr [rsp + 0x70]
0x145851c45: movaps xmm8, xmmword ptr [rsp + 0x80]
0x145851c4e: add rsp, 0x98
0x145851c55: pop rbx
0x145851c56: pop rbp
0x145851c57: pop rdi
0x145851c58: pop rsi
0x145851c59: pop r12
0x145851c5b: pop r13
0x145851c5d: pop r14
0x145851c5f: pop r15
0x145851c61: ret
