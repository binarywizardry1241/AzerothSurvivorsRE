0x1402c08e0: push r15
0x1402c08e2: push r14
0x1402c08e4: push rsi
0x1402c08e5: push rdi
0x1402c08e6: push rbp
0x1402c08e7: push rbx
0x1402c08e8: sub rsp, 0x338
0x1402c08ef: mov rsi, rdx
0x1402c08f2: mov rbx, rcx
0x1402c08f5: mov rdi, qword ptr [rsp + 0x390]
0x1402c08fd: cmp byte ptr [rdi + 0x39], 0
0x1402c0901: je 0x1402c0b45
0x1402c0907: xorps xmm0, xmm0
0x1402c090a: movaps xmmword ptr [rsp + 0x2d0], xmm0
0x1402c0912: movaps xmmword ptr [rsp + 0x2c0], xmm0
0x1402c091a: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x1402c0922: movaps xmmword ptr [rsp + 0x2a0], xmm0
0x1402c092a: movaps xmmword ptr [rsp + 0x290], xmm0
0x1402c0932: mov qword ptr [rsp + 0x2e0], 0
0x1402c093e: mov byte ptr [rsp + 0x214], 0
0x1402c0946: mov dword ptr [rsp + 0x210], 0
0x1402c0951: movups xmm0, xmmword ptr [rip + 0x5fb75f8]
0x1402c0958: movups xmmword ptr [rsp + 0x2e8], xmm0
0x1402c0960: movups xmm0, xmmword ptr [rip + 0x5fb75f9]
0x1402c0967: movups xmmword ptr [rsp + 0x2f8], xmm0
0x1402c096f: movups xmm0, xmmword ptr [rip + 0x5fb7522]
0x1402c0976: movaps xmmword ptr [rsp + 0x230], xmm0
0x1402c097e: mov qword ptr [rsp + 0x240], 0
0x1402c098a: movups xmm0, xmmword ptr [rip + 0x5fb751f]
0x1402c0991: movups xmmword ptr [rsp + 0x248], xmm0
0x1402c0999: mov qword ptr [rsp + 0x258], 0
0x1402c09a5: movups xmm0, xmmword ptr [rip + 0x5fb751c]
0x1402c09ac: movaps xmmword ptr [rsp + 0x260], xmm0
0x1402c09b4: mov qword ptr [rsp + 0x270], 0
0x1402c09c0: movups xmm0, xmmword ptr [rip + 0x5fb7519]
0x1402c09c7: movups xmmword ptr [rsp + 0x278], xmm0
0x1402c09cf: mov qword ptr [rsp + 0x288], 0
0x1402c09db: mov r14, qword ptr [rbx]
0x1402c09de: add rbx, 8
0x1402c09e2: lea rcx, [rsp + 0x98]
0x1402c09ea: lea rdx, [rsp + 0x230]
0x1402c09f2: mov r8d, 0xd8
0x1402c09f8: call 0x14606171b
0x1402c09fd: movaps xmm0, xmmword ptr [rip + 0x5f7255c]
0x1402c0a04: movups xmmword ptr [rsp + 0x170], xmm0
0x1402c0a0c: movaps xmm0, xmmword ptr [rip + 0x5f7258d]
0x1402c0a13: movups xmmword ptr [rsp + 0x180], xmm0
0x1402c0a1b: movups xmm0, xmmword ptr [rip + 0x5fb756e]
0x1402c0a22: movups xmmword ptr [rsp + 0x190], xmm0
0x1402c0a2a: movups xmm0, xmmword ptr [rip + 0x5fb756f]
0x1402c0a31: movups xmmword ptr [rsp + 0x1a0], xmm0
0x1402c0a39: movups xmm0, xmmword ptr [rip + 0x5fb7570]
0x1402c0a40: movups xmmword ptr [rsp + 0x1b0], xmm0
0x1402c0a48: movups xmm0, xmmword ptr [rip + 0x5fb7571]
0x1402c0a4f: movups xmmword ptr [rsp + 0x1c0], xmm0
0x1402c0a57: movaps xmm0, xmmword ptr [rip + 0x5f724f2]
0x1402c0a5e: movups xmmword ptr [rsp + 0x1d0], xmm0
0x1402c0a66: mov dword ptr [rsp + 0x1e0], 1
0x1402c0a71: mov qword ptr [rsp + 0x1e4], 0
0x1402c0a7d: mov byte ptr [rsp + 0x1ec], 1
0x1402c0a85: mov qword ptr [rsp + 0x1f6], 0
0x1402c0a91: mov qword ptr [rsp + 0x1f0], 0
0x1402c0a9d: mov dword ptr [rsp + 0x1fe], 0x10000
0x1402c0aa8: mov word ptr [rsp + 0x202], 0
0x1402c0ab2: mov word ptr [rsp + 0x208], 0
0x1402c0abc: mov dword ptr [rsp + 0x204], 0x10000
0x1402c0ac7: mov dword ptr [rsp + 0x20a], 0
0x1402c0ad2: mov word ptr [rsp + 0x20e], 0
0x1402c0adc: mov byte ptr [rsp + 0x215], 5
0x1402c0ae4: mov qword ptr [rsp + 0x90], r14
0x1402c0aec: lea r9, [rip + 0x5fb1d5d]
0x1402c0af3: lea rcx, [rsp + 0x308]
0x1402c0afb: lea r8, [rsp + 0x90]
0x1402c0b03: mov rdx, rbx
0x1402c0b06: call 0x1402f4270
0x1402c0b0b: add rdi, 0x18
0x1402c0b0f: lea rcx, [rsp + 0x230]
0x1402c0b17: mov rdx, rdi
0x1402c0b1a: call 0x146034930
0x1402c0b1f: cmp byte ptr [rsi], 1
0x1402c0b22: jne 0x1402c0c7e
0x1402c0b28: mov eax, dword ptr [rsi + 1]
0x1402c0b2b: mov ecx, dword ptr [rsi + 4]
0x1402c0b2e: mov dword ptr [rsp + 0x2b], ecx
0x1402c0b32: mov dword ptr [rsp + 0x28], eax
0x1402c0b36: mov rax, qword ptr [rsi + 8]
0x1402c0b3a: movzx ecx, byte ptr [rsi + 0x10]
0x1402c0b3e: mov dl, 1
0x1402c0b40: jmp 0x1402c0c8e
0x1402c0b45: mov r14, r8
0x1402c0b48: mov rax, qword ptr [rdi + 0x30]
0x1402c0b4c: test rax, rax
0x1402c0b4f: je 0x1402c0bb4
0x1402c0b51: mov rdx, qword ptr [r9 + 0x90]
0x1402c0b58: mov rcx, qword ptr [r9 + 0x98]
0x1402c0b5f: shl rcx, 4
0x1402c0b63: lea rcx, [rcx + rcx*8]
0x1402c0b67: nop word ptr [rax + rax]
0x1402c0b70: test rcx, rcx
0x1402c0b73: je 0x1402c0bb4
0x1402c0b75: mov r8, rdx
0x1402c0b78: add rdx, 0x90
0x1402c0b7f: add rcx, -0x90
0x1402c0b86: cmp qword ptr [r8 + 0x80], rax
0x1402c0b8d: jne 0x1402c0b70
0x1402c0b8f: cmp qword ptr [r8 + 0x58], 0
0x1402c0b94: je 0x1402c0b70
0x1402c0b96: mov byte ptr [rsp + 0x27], 1
0x1402c0b9b: movups xmm0, xmmword ptr [rip + 0x5fb7d4a]
0x1402c0ba2: movaps xmmword ptr [rsp + 0x40], xmm0
0x1402c0ba7: mov dword ptr [rsp + 0x50], 0x3f800000
0x1402c0baf: jmp 0x1402c0dd6
0x1402c0bb4: mov byte ptr [rsp + 0x27], 0
0x1402c0bb9: movzx ecx, byte ptr [rdi + 0x3a]
0x1402c0bbd: call 0x145b059c0
0x1402c0bc2: mov rdx, qword ptr [rax + 0x50]
0x1402c0bc6: mov r8, qword ptr [rax + 0x58]
0x1402c0bca: mov rcx, r8
0x1402c0bcd: sub rcx, rdx
0x1402c0bd0: sub rcx, r8
0x1402c0bd3: xor r9d, r9d
0x1402c0bd6: jmp 0x1402c0bf0
0x1402c0bd8: nop dword ptr [rax + rax]
0x1402c0be0: inc r9
0x1402c0be3: add r9, rcx
0x1402c0be6: cmp r10d, 0x23
0x1402c0bea: jne 0x1402c0d8c
0x1402c0bf0: cmp r9, r8
0x1402c0bf3: je 0x1402c0d89
0x1402c0bf9: mov rax, r9
0x1402c0bfc: add r9, rdx
0x1402c0bff: movzx ebp, byte ptr [r9]
0x1402c0c03: movzx r10d, bpl
0x1402c0c07: test r10b, r10b
0x1402c0c0a: jns 0x1402c0be0
0x1402c0c0c: mov r11d, r10d
0x1402c0c0f: and r11d, 0x1f
0x1402c0c13: movzx r15d, byte ptr [r9 + 1]
0x1402c0c18: and r15d, 0x3f
0x1402c0c1c: cmp r10b, 0xdf
0x1402c0c20: jbe 0x1402c0c5b
0x1402c0c22: movzx r10d, byte ptr [r9 + 2]
0x1402c0c27: shl r15d, 6
0x1402c0c2b: and r10d, 0x3f
0x1402c0c2f: or r10d, r15d
0x1402c0c32: cmp bpl, 0xf0
0x1402c0c36: jb 0x1402c0c6e
0x1402c0c38: movzx ebp, byte ptr [r9 + 3]
0x1402c0c3d: add r9, 4
0x1402c0c41: and r11d, 7
0x1402c0c45: shl r11d, 0x12
0x1402c0c49: shl r10d, 6
0x1402c0c4d: and ebp, 0x3f
0x1402c0c50: or ebp, r10d
0x1402c0c53: or ebp, r11d
0x1402c0c56: mov r10d, ebp
0x1402c0c59: jmp 0x1402c0be3
0x1402c0c5b: add r9, 2
0x1402c0c5f: shl r11d, 6
0x1402c0c63: or r11d, r15d
0x1402c0c66: mov r10d, r11d
0x1402c0c69: jmp 0x1402c0be3
0x1402c0c6e: add r9, 3
0x1402c0c72: shl r11d, 0xc
0x1402c0c76: or r10d, r11d
0x1402c0c79: jmp 0x1402c0be3
0x1402c0c7e: mov rax, qword ptr [rsi + 8]
0x1402c0c82: lock inc qword ptr [rax]
0x1402c0c86: jle 0x1402c10e5
0x1402c0c8c: xor edx, edx
0x1402c0c8e: mov r8, qword ptr [rsp + 0x240]
0x1402c0c96: mov qword ptr [rsp + 0xa0], r8
0x1402c0c9e: movups xmm0, xmmword ptr [rsp + 0x230]
0x1402c0ca6: movaps xmmword ptr [rsp + 0x90], xmm0
0x1402c0cae: mov qword ptr [rsp + 0xa8], 0
0x1402c0cba: mov qword ptr [rsp + 0xb0], 4
0x1402c0cc6: mov qword ptr [rsp + 0xb8], 0
0x1402c0cd2: mov byte ptr [rsp + 0xc0], dl
0x1402c0cd9: mov edx, dword ptr [rsp + 0x28]
0x1402c0cdd: mov r8d, dword ptr [rsp + 0x2b]
0x1402c0ce2: mov dword ptr [rsp + 0xc1], edx
0x1402c0ce9: mov dword ptr [rsp + 0xc4], r8d
0x1402c0cf1: mov qword ptr [rsp + 0xc8], rax
0x1402c0cf9: mov qword ptr [rsp + 0xd0], rcx
0x1402c0d01: mov dword ptr [rsp + 0xd8], 0x41400000
0x1402c0d0c: mov word ptr [rsp + 0xdc], 0x190
0x1402c0d16: mov byte ptr [rsp + 0xde], 1
0x1402c0d1e: movups xmm0, xmmword ptr [rip + 0x5fb7b03]
0x1402c0d25: movaps xmmword ptr [rsp + 0xe0], xmm0
0x1402c0d2d: mov dword ptr [rsp + 0xf0], 0x3f800000
0x1402c0d38: movups xmm0, xmmword ptr [rip + 0x5f9fb21]
0x1402c0d3f: movups xmmword ptr [rsp + 0xf4], xmm0
0x1402c0d47: mov eax, dword ptr [rip + 0x5f9fb23]
0x1402c0d4d: mov dword ptr [rsp + 0x104], eax
0x1402c0d54: movsd xmm0, qword ptr [rip + 0x5f721d4]
0x1402c0d5c: movsd qword ptr [rsp + 0x108], xmm0
0x1402c0d65: mov word ptr [rsp + 0x110], 1
0x1402c0d6f: lea rcx, [rsp + 0x308]
0x1402c0d77: lea rdx, [rsp + 0x90]
0x1402c0d7f: call 0x140313800
0x1402c0d84: jmp 0x1402c10d5
0x1402c0d89: mov rax, r8
0x1402c0d8c: sub r8, rax
0x1402c0d8f: add rdx, rax
0x1402c0d92: lea rcx, [rsp + 0x90]
0x1402c0d9a: call 0x140056f40
0x1402c0d9f: cmp dword ptr [rsp + 0x90], 1
0x1402c0da7: jne 0x1402c0dc1
0x1402c0da9: movups xmm0, xmmword ptr [rip + 0x5fa052c]
0x1402c0db0: movaps xmmword ptr [rsp + 0x40], xmm0
0x1402c0db5: mov eax, dword ptr [rip + 0x5fa0531]
0x1402c0dbb: mov dword ptr [rsp + 0x50], eax
0x1402c0dbf: jmp 0x1402c0dd6
0x1402c0dc1: movups xmm0, xmmword ptr [rsp + 0x94]
0x1402c0dc9: movups xmmword ptr [rsp + 0x44], xmm0
0x1402c0dce: mov dword ptr [rsp + 0x40], 0
0x1402c0dd6: movups xmm0, xmmword ptr [rip + 0x5fb70bb]
0x1402c0ddd: movaps xmmword ptr [rsp + 0x90], xmm0
0x1402c0de5: mov qword ptr [rsp + 0xa0], 0
0x1402c0df1: movups xmm0, xmmword ptr [rip + 0x5fb70b8]
0x1402c0df8: movups xmmword ptr [rsp + 0xa8], xmm0
0x1402c0e00: mov qword ptr [rsp + 0xb8], 0
0x1402c0e0c: movups xmm0, xmmword ptr [rip + 0x5fb70b5]
0x1402c0e13: movaps xmmword ptr [rsp + 0xc0], xmm0
0x1402c0e1b: mov qword ptr [rsp + 0xd0], 0
0x1402c0e27: movups xmm0, xmmword ptr [rip + 0x5fb70b2]
0x1402c0e2e: movups xmmword ptr [rsp + 0xd8], xmm0
0x1402c0e36: mov qword ptr [rsp + 0xe8], 0
0x1402c0e42: cmp byte ptr [rdi + 0x38], 0
0x1402c0e46: je 0x1402c0e5e
0x1402c0e48: movups xmm0, xmmword ptr [rip + 0x5fb8119]
0x1402c0e4f: movaps xmmword ptr [rsp + 0x60], xmm0
0x1402c0e54: mov dword ptr [rsp + 0x70], 0x3d8f5c29
0x1402c0e5c: jmp 0x1402c0e72
0x1402c0e5e: movups xmm0, xmmword ptr [rip + 0x5fb79eb]
0x1402c0e65: movaps xmmword ptr [rsp + 0x60], xmm0
0x1402c0e6a: mov dword ptr [rsp + 0x70], 0
0x1402c0e72: movaps xmm0, xmmword ptr [rsp + 0xe0]
0x1402c0e7a: movaps xmmword ptr [rsp + 0x280], xmm0
0x1402c0e82: movaps xmm0, xmmword ptr [rsp + 0xd0]
0x1402c0e8a: movaps xmmword ptr [rsp + 0x270], xmm0
0x1402c0e92: movaps xmm0, xmmword ptr [rsp + 0x90]
0x1402c0e9a: movaps xmm1, xmmword ptr [rsp + 0xa0]
0x1402c0ea2: movaps xmm2, xmmword ptr [rsp + 0xb0]
0x1402c0eaa: movaps xmm3, xmmword ptr [rsp + 0xc0]
0x1402c0eb2: movaps xmmword ptr [rsp + 0x260], xmm3
0x1402c0eba: movaps xmmword ptr [rsp + 0x250], xmm2
0x1402c0ec2: movaps xmmword ptr [rsp + 0x240], xmm1
0x1402c0eca: movaps xmmword ptr [rsp + 0x230], xmm0
0x1402c0ed2: xorps xmm0, xmm0
0x1402c0ed5: movaps xmmword ptr [rsp + 0x290], xmm0
0x1402c0edd: movaps xmmword ptr [rsp + 0x2a0], xmm0
0x1402c0ee5: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x1402c0eed: movaps xmmword ptr [rsp + 0x2c0], xmm0
0x1402c0ef5: movaps xmmword ptr [rsp + 0x2d0], xmm0
0x1402c0efd: mov qword ptr [rsp + 0x2e0], 0
0x1402c0f09: movups xmm0, xmmword ptr [rip + 0x5fb7050]
0x1402c0f10: movups xmmword ptr [rsp + 0x2f8], xmm0
0x1402c0f18: movups xmm0, xmmword ptr [rip + 0x5fb7031]
0x1402c0f1f: movups xmmword ptr [rsp + 0x2e8], xmm0
0x1402c0f27: mov qword ptr [rsp + 0x82], 0
0x1402c0f33: mov qword ptr [rsp + 0x88], 0
0x1402c0f3f: movaps xmm0, xmmword ptr [rsp + 0x60]
0x1402c0f44: movups xmmword ptr [rsp + 0x2a], xmm0
0x1402c0f49: mov eax, dword ptr [rsp + 0x70]
0x1402c0f4d: mov dword ptr [rsp + 0x3a], eax
0x1402c0f51: mov r15, qword ptr [rbx]
0x1402c0f54: add rbx, 8
0x1402c0f58: lea rcx, [rsp + 0x98]
0x1402c0f60: lea rdx, [rsp + 0x230]
0x1402c0f68: mov r8d, 0xd8
0x1402c0f6e: call 0x14606171b
0x1402c0f73: movaps xmm0, xmmword ptr [rip + 0x5f8b716]
0x1402c0f7a: movups xmmword ptr [rsp + 0x170], xmm0
0x1402c0f82: movaps xmm0, xmmword ptr [rip + 0x5f72057]
0x1402c0f89: movups xmmword ptr [rsp + 0x180], xmm0
0x1402c0f91: movups xmm1, xmmword ptr [rip + 0x5fb6ff8]
0x1402c0f98: movups xmmword ptr [rsp + 0x190], xmm1
0x1402c0fa0: movups xmm1, xmmword ptr [rip + 0x5fb6ff9]
0x1402c0fa7: movups xmmword ptr [rsp + 0x1a0], xmm1
0x1402c0faf: movups xmmword ptr [rsp + 0x1b0], xmm0
0x1402c0fb7: movups xmmword ptr [rsp + 0x1c0], xmm0
0x1402c0fbf: movaps xmm0, xmmword ptr [rip + 0x5f71f8a]
0x1402c0fc6: movups xmmword ptr [rsp + 0x1d0], xmm0
0x1402c0fce: mov dword ptr [rsp + 0x1e0], 1
0x1402c0fd9: movss xmm0, dword ptr [rip + 0x5f8a60f]
0x1402c0fe1: movlps qword ptr [rsp + 0x1e4], xmm0
0x1402c0fe9: mov byte ptr [rsp + 0x1ec], 1
0x1402c0ff1: movzx eax, byte ptr [rsp + 0x8f]
0x1402c0ff9: mov byte ptr [rsp + 0x1fd], al
0x1402c1000: movups xmm0, xmmword ptr [rsp + 0x7f]
0x1402c1005: movups xmmword ptr [rsp + 0x1ed], xmm0
0x1402c100d: mov dword ptr [rsp + 0x1fe], 0x10000
0x1402c1018: mov word ptr [rsp + 0x202], 0
0x1402c1022: mov word ptr [rsp + 0x208], 0
0x1402c102c: mov dword ptr [rsp + 0x204], 0x10000
0x1402c1037: mov qword ptr [rsp + 0x20a], 0
0x1402c1043: mov dword ptr [rsp + 0x212], 3
0x1402c104e: movups xmm0, xmmword ptr [rsp + 0x28]
0x1402c1053: movups xmmword ptr [rsp + 0x216], xmm0
0x1402c105b: mov rax, qword ptr [rsp + 0x36]
0x1402c1060: mov qword ptr [rsp + 0x224], rax
0x1402c1068: mov qword ptr [rsp + 0x90], r15
0x1402c1070: lea r9, [rip + 0x5fb17d9]
0x1402c1077: lea r15, [rsp + 0x308]
0x1402c107f: lea r8, [rsp + 0x90]
0x1402c1087: mov rcx, r15
0x1402c108a: mov rdx, rbx
0x1402c108d: call 0x1402f68d0
0x1402c1092: mov qword ptr [rsp + 0x90], r14
0x1402c109a: mov qword ptr [rsp + 0x98], rdi
0x1402c10a2: mov qword ptr [rsp + 0xa0], rsi
0x1402c10aa: lea rax, [rsp + 0x40]
0x1402c10af: mov qword ptr [rsp + 0xa8], rax
0x1402c10b7: lea rax, [rsp + 0x27]
0x1402c10bc: mov qword ptr [rsp + 0xb0], rax
0x1402c10c4: lea rdx, [rsp + 0x90]
0x1402c10cc: mov rcx, r15
0x1402c10cf: call 0x14033eb50
0x1402c10d4: nop 
0x1402c10d5: add rsp, 0x338
0x1402c10dc: pop rbx
0x1402c10dd: pop rbp
0x1402c10de: pop rdi
0x1402c10df: pop rsi
0x1402c10e0: pop r14
0x1402c10e2: pop r15
0x1402c10e4: ret 
0x1402c10e5: ud2 
