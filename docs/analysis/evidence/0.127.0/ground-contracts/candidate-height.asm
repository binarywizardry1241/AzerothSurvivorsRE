145b96b30: sub rsp, 0x38
145b96b34: movaps xmmword ptr [rsp + 0x20], xmm6
145b96b39: mov rax, qword ptr [rsp + 0x60]
145b96b3e: cmp rax, r9
145b96b41: jae 0x145b96c5c
145b96b47: mov r10, rdx
145b96b4a: lea rdx, [rax + 1]
145b96b4e: cmp rdx, r9
145b96b51: jae 0x145b96c70
145b96b57: mov r11d, dword ptr [r8 + rax*4]
145b96b5b: mov edx, dword ptr [r8 + rax*4 + 4]
145b96b60: cmp edx, r11d
145b96b63: jb 0x145b96c48
145b96b69: cmp r10, rdx
145b96b6c: jb 0x145b96c48
145b96b72: xor eax, eax
145b96b74: cmp r11d, edx
145b96b77: je 0x145b96bd5
145b96b79: movss xmm1, dword ptr [rsp + 0x68]
145b96b7f: lea r9, [rcx + rdx*8]
145b96b83: lea r8, [rcx + r11*8]
145b96b87: lea r10, [r11*8]
145b96b8f: lea rcx, [rdx*8]
145b96b97: sub rcx, r10
145b96b9a: add rcx, -8
145b96b9e: movaps xmm2, xmmword ptr [rip + 0x69c5cb]
145b96ba5: movss xmm3, dword ptr [rip + 0x6db7c3]
145b96bad: nop dword ptr [rax]
145b96bb0: lea rdx, [r8 + 8]
145b96bb4: movss xmm0, dword ptr [r8 + 4]
145b96bba: movaps xmm4, xmm0
145b96bbd: subss xmm4, xmm1
145b96bc1: andps xmm4, xmm2
145b96bc4: ucomiss xmm3, xmm4
145b96bc7: jae 0x145b96bdf
145b96bc9: add rcx, -8
145b96bcd: mov r8, rdx
145b96bd0: cmp rdx, r9
145b96bd3: jne 0x145b96bb0
145b96bd5: movaps xmm6, xmmword ptr [rsp + 0x20]
145b96bda: add rsp, 0x38
145b96bde: ret
145b96bdf: mov eax, 1
145b96be4: cmp rdx, r9
145b96be7: je 0x145b96bd5
145b96be9: shr rcx, 3
145b96bed: xor edx, edx
145b96bef: jmp 0x145b96c0e
145b96bf1: nop word ptr cs:[rax + rax]
145b96c00: movaps xmm0, xmm6
145b96c03: movaps xmm4, xmm5
145b96c06: inc rdx
145b96c09: cmp rcx, rdx
145b96c0c: je 0x145b96bd5
145b96c0e: movss xmm6, dword ptr [r8 + rdx*8 + 0xc]
145b96c15: movaps xmm5, xmm6
145b96c18: subss xmm5, xmm1
145b96c1c: andps xmm5, xmm2
145b96c1f: ucomiss xmm3, xmm5
145b96c22: jb 0x145b96c06
145b96c24: movd r9d, xmm4
145b96c29: movd r10d, xmm5
145b96c2e: mov r11d, r9d
145b96c31: sar r11d, 0x1f
145b96c35: shr r11d, 1
145b96c38: xor r11d, r9d
145b96c3b: cmp r11d, r10d
145b96c3e: jg 0x145b96c00
145b96c40: movaps xmm5, xmm4
145b96c43: movaps xmm6, xmm0
145b96c46: jmp 0x145b96c00
145b96c48: lea r9, [rip + 0x14e81d1]
145b96c4f: mov rcx, r11
145b96c52: mov r8, r10
145b96c55: call 0x146208f10
145b96c5a: ud2
145b96c5c: lea r8, [rip + 0x14e818d]
145b96c63: mov rcx, rax
145b96c66: mov rdx, r9
145b96c69: call 0x146208d03
145b96c6e: ud2
145b96c70: lea r8, [rip + 0x14e8191]
145b96c77: mov rcx, rdx
145b96c7a: mov rdx, r9
145b96c7d: call 0x146208d03
145b96c82: ud2
