0x14020e930: push rbp
0x14020e931: push r15
0x14020e933: push r14
0x14020e935: push r13
0x14020e937: push r12
0x14020e939: push rsi
0x14020e93a: push rdi
0x14020e93b: push rbx
0x14020e93c: sub rsp, 0x398
0x14020e943: lea rbp, [rsp + 0x80]
0x14020e94b: mov qword ptr [rbp + 0x310], 0xfffffffffffffffe
0x14020e956: mov rbx, r8
0x14020e959: mov rsi, rdx
0x14020e95c: mov rdi, rcx
0x14020e95f: mov r14, qword ptr [r8 + 0x20]
0x14020e963: mov r15, qword ptr [r8 + 0x28]
0x14020e967: cmp r15, 7
0x14020e96b: jb 0x14020e982
0x14020e96d: mov eax, 0x6b636f6c
0x14020e972: xor eax, dword ptr [r14]
0x14020e975: mov ecx, 0x3a64656b
0x14020e97a: xor ecx, dword ptr [r14 + 3]
0x14020e97e: or ecx, eax
0x14020e980: je 0x14020e9db
0x14020e982: lea rax, [r15 - 0xd]
0x14020e986: cmp rax, 0x23
0x14020e98a: ja 0x14020f57e
0x14020e990: lea rcx, [rip + 0x5d05aad]
0x14020e997: movsxd rax, dword ptr [rcx + rax*4]
0x14020e99b: add rax, rcx
0x14020e99e: jmp rax
0x14020e9a0: movabs rax, 0x74736f6820656874
0x14020e9aa: xor rax, qword ptr [r14]
0x14020e9ad: movabs rcx, 0x7466656c2074736f
0x14020e9b7: xor rcx, qword ptr [r14 + 5]
0x14020e9bb: or rcx, rax
0x14020e9be: mov r15d, 0xd
0x14020e9c4: jne 0x14020ee83
0x14020e9ca: lea rcx, [rip + 0x5d023bd]
0x14020e9d1: mov edx, 0xd
0x14020e9d6: jmp 0x14020f573
0x14020e9db: add r15, -7
0x14020e9df: add r14, 7
0x14020e9e3: mov rcx, r14
0x14020e9e6: mov rdx, r15
0x14020e9e9: call 0x145809710
0x14020e9ee: mov rcx, rax
0x14020e9f1: call 0x145809010
0x14020e9f6: mov qword ptr [rbp - 0x20], rax
0x14020e9fa: mov qword ptr [rbp - 0x18], rdx
0x14020e9fe: lea rcx, [rip + 0x5d023fd]
0x14020ea05: mov edx, 0x2f
0x14020ea0a: call 0x1458dfee0
0x14020ea0f: mov r8, rdx
0x14020ea12: lea rcx, [rip + 0x5d0243f]
0x14020ea19: mov qword ptr [rbp + 0x120], rcx
0x14020ea20: mov qword ptr [rbp + 0x128], 4
0x14020ea2b: lea rcx, [rbp - 0x20]
0x14020ea2f: mov qword ptr [rbp + 0x130], rcx
0x14020ea36: lea rcx, [rip + 0x5d023fb]
0x14020ea3d: mov qword ptr [rbp + 0x138], rcx
0x14020ea44: mov qword ptr [rsp + 0x20], 1
0x14020ea4d: lea rcx, [rbp + 0x2c0]
0x14020ea54: lea r9, [rbp + 0x120]
0x14020ea5b: mov rdx, rax
0x14020ea5e: call 0x1458e0370
0x14020ea63: mov rcx, qword ptr [rbx + 0x10]
0x14020ea67: add rcx, -5
0x14020ea6b: cmp rcx, 6
0x14020ea6f: jbe 0x14020eedc
0x14020ea75: jmp 0x14020f096
0x14020ea7a: lea rdx, [rip + 0x5d0235e]
0x14020ea81: mov r15d, 0x23
0x14020ea87: mov r8d, 0x23
0x14020ea8d: mov rcx, r14
0x14020ea90: call 0x145d14601
0x14020ea95: test eax, eax
0x14020ea97: jne 0x14020ee83
0x14020ea9d: lea rcx, [rip + 0x5d0233b]
0x14020eaa4: mov edx, 0x23
0x14020eaa9: jmp 0x14020f573
0x14020eaae: movdqu xmm0, xmmword ptr [r14]
0x14020eab3: movdqu xmm1, xmmword ptr [r14 + 0xd]
0x14020eab9: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00d0f]
0x14020eac1: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00d17]
0x14020eac9: pand xmm0, xmm1
0x14020eacd: pmovmskb eax, xmm0
0x14020ead1: cmp eax, 0xffff
0x14020ead6: je 0x14020f4f4
0x14020eadc: movdqu xmm0, xmmword ptr [r14]
0x14020eae1: movdqu xmm1, xmmword ptr [r14 + 0xd]
0x14020eae7: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00d01]
0x14020eaef: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00d09]
0x14020eaf7: pand xmm0, xmm1
0x14020eafb: pmovmskb eax, xmm0
0x14020eaff: mov r15d, 0x1d
0x14020eb05: cmp eax, 0xffff
0x14020eb0a: jne 0x14020ee83
0x14020eb10: lea rcx, [rip + 0x5d02226]
0x14020eb17: mov edx, 0x1d
0x14020eb1c: jmp 0x14020f573
0x14020eb21: movdqu xmm0, xmmword ptr [r14]
0x14020eb26: movdqu xmm1, xmmword ptr [r14 + 0xf]
0x14020eb2c: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00d7c]
0x14020eb34: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00d84]
0x14020eb3c: pand xmm0, xmm1
0x14020eb40: pmovmskb eax, xmm0
0x14020eb44: mov r15d, 0x1f
0x14020eb4a: cmp eax, 0xffff
0x14020eb4f: jne 0x14020ee83
0x14020eb55: lea rcx, [rip + 0x5d020da]
0x14020eb5c: mov edx, 0x1f
0x14020eb61: jmp 0x14020f573
0x14020eb66: movdqu xmm0, xmmword ptr [r14]
0x14020eb6b: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00bed]
0x14020eb73: pmovmskb eax, xmm0
0x14020eb77: mov r15d, 0x10
0x14020eb7d: cmp eax, 0xffff
0x14020eb82: jne 0x14020ee83
0x14020eb88: lea rcx, [rip + 0x5d02225]
0x14020eb8f: mov edx, 0x10
0x14020eb94: jmp 0x14020f573
0x14020eb99: movdqu xmm0, xmmword ptr [r14]
0x14020eb9e: movd xmm1, dword ptr [r14 + 0x10]
0x14020eba4: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00cc4]
0x14020ebac: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00ccc]
0x14020ebb4: pand xmm0, xmm1
0x14020ebb8: pmovmskb eax, xmm0
0x14020ebbc: mov r15d, 0x14
0x14020ebc2: cmp eax, 0xffff
0x14020ebc7: jne 0x14020ee83
0x14020ebcd: lea rcx, [rip + 0x5d020d0]
0x14020ebd4: mov edx, 0x14
0x14020ebd9: jmp 0x14020f573
0x14020ebde: movdqu xmm0, xmmword ptr [r14]
0x14020ebe3: movdqu xmm1, xmmword ptr [r14 + 0xe]
0x14020ebe9: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00b9f]
0x14020ebf1: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00ba7]
0x14020ebf9: pand xmm0, xmm1
0x14020ebfd: pmovmskb eax, xmm0
0x14020ec01: mov r15d, 0x1e
0x14020ec07: cmp eax, 0xffff
0x14020ec0c: jne 0x14020ee83
0x14020ec12: lea rcx, [rip + 0x5d02141]
0x14020ec19: mov edx, 0x1e
0x14020ec1e: jmp 0x14020f573
0x14020ec23: movabs rax, 0x617020676e6f7277
0x14020ec2d: xor rax, qword ptr [r14]
0x14020ec30: movabs rcx, 0x64726f7773736170
0x14020ec3a: xor rcx, qword ptr [r14 + 6]
0x14020ec3e: or rcx, rax
0x14020ec41: mov r15d, 0xe
0x14020ec47: jne 0x14020ee83
0x14020ec4d: lea rcx, [rip + 0x5d02031]
0x14020ec54: mov edx, 0xe
0x14020ec59: jmp 0x14020f573
0x14020ec5e: movdqu xmm0, xmmword ptr [r14]
0x14020ec63: movdqu xmm1, xmmword ptr [r14 + 6]
0x14020ec69: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00aff]
0x14020ec71: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00b07]
0x14020ec79: pand xmm0, xmm1
0x14020ec7d: pmovmskb eax, xmm0
0x14020ec81: mov r15d, 0x16
0x14020ec87: cmp eax, 0xffff
0x14020ec8c: jne 0x14020ee83
0x14020ec92: lea rcx, [rip + 0x5d020df]
0x14020ec99: mov edx, 0x16
0x14020ec9e: jmp 0x14020f573
0x14020eca3: movdqu xmm0, xmmword ptr [r14]
0x14020eca8: movdqu xmm1, xmmword ptr [r14 + 7]
0x14020ecae: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00afa]
0x14020ecb6: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00b02]
0x14020ecbe: pand xmm0, xmm1
0x14020ecc2: pmovmskb eax, xmm0
0x14020ecc6: mov r15d, 0x17
0x14020eccc: cmp eax, 0xffff
0x14020ecd1: jne 0x14020ee83
0x14020ecd7: lea rcx, [rip + 0x5d02048]
0x14020ecde: mov edx, 0x17
0x14020ece3: jmp 0x14020f573
0x14020ece8: lea rdx, [rip + 0x5d01fdb]
0x14020ecef: mov r15d, 0x26
0x14020ecf5: mov r8d, 0x26
0x14020ecfb: mov rcx, r14
0x14020ecfe: call 0x145d14601
0x14020ed03: test eax, eax
0x14020ed05: jne 0x14020ee83
0x14020ed0b: lea rcx, [rip + 0x5d01fb8]
0x14020ed12: mov edx, 0x26
0x14020ed17: jmp 0x14020f573
0x14020ed1c: lea rdx, [rip + 0x5d01f32]
0x14020ed23: mov r15d, 0x30
0x14020ed29: mov r8d, 0x30
0x14020ed2f: mov rcx, r14
0x14020ed32: call 0x145d14601
0x14020ed37: test eax, eax
0x14020ed39: jne 0x14020ee83
0x14020ed3f: lea rcx, [rip + 0x5d01f0f]
0x14020ed46: mov edx, 0x30
0x14020ed4b: jmp 0x14020f573
0x14020ed50: movdqu xmm0, xmmword ptr [r14]
0x14020ed55: movzx eax, byte ptr [r14 + 0x10]
0x14020ed5a: movd xmm1, eax
0x14020ed5e: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00b2a]
0x14020ed66: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00b32]
0x14020ed6e: pand xmm1, xmm0
0x14020ed72: pmovmskb eax, xmm1
0x14020ed76: mov r15d, 0x11
0x14020ed7c: cmp eax, 0xffff
0x14020ed81: jne 0x14020ee83
0x14020ed87: lea rcx, [rip + 0x5d01f05]
0x14020ed8e: mov edx, 0x11
0x14020ed93: jmp 0x14020f573
0x14020ed98: movdqu xmm0, xmmword ptr [r14]
0x14020ed9d: movzx eax, word ptr [r14 + 0x10]
0x14020eda2: movd xmm1, eax
0x14020eda6: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00aa2]
0x14020edae: pcmpeqb xmm1, xmmword ptr [rip + 0x5d00aaa]
0x14020edb6: pand xmm1, xmm0
0x14020edba: pmovmskb eax, xmm1
0x14020edbe: mov r15d, 0x12
0x14020edc4: cmp eax, 0xffff
0x14020edc9: jne 0x14020ee83
0x14020edcf: lea rcx, [rip + 0x5d01ee2]
0x14020edd6: mov edx, 0x12
0x14020eddb: jmp 0x14020f573
0x14020ede0: movdqu xmm0, xmmword ptr [r14]
0x14020ede5: movdqu xmm1, xmmword ptr [r14 + 0xb]
0x14020edeb: pcmpeqb xmm1, xmmword ptr [rip + 0x5d0094d]
0x14020edf3: pcmpeqb xmm0, xmmword ptr [rip + 0x5d00955]
0x14020edfb: pand xmm0, xmm1
0x14020edff: pmovmskb eax, xmm0
0x14020ee03: mov r15d, 0x1b
0x14020ee09: cmp eax, 0xffff
0x14020ee0e: jne 0x14020ee83
0x14020ee10: lea rcx, [rip + 0x5d01fad]
0x14020ee17: mov edx, 0x1b
0x14020ee1c: jmp 0x14020f573
0x14020ee21: movdqu xmm0, xmmword ptr [r14]
0x14020ee26: movdqu xmm1, xmmword ptr [r14 + 9]
0x14020ee2c: pcmpeqb xmm1, xmmword ptr [rip + 0x5d009dc]
0x14020ee34: pcmpeqb xmm0, xmmword ptr [rip + 0x5d009e4]
0x14020ee3c: pand xmm0, xmm1
0x14020ee40: pmovmskb eax, xmm0
0x14020ee44: cmp eax, 0xffff
0x14020ee49: je 0x14020f502
0x14020ee4f: movdqu xmm0, xmmword ptr [r14]
0x14020ee54: movdqu xmm1, xmmword ptr [r14 + 9]
0x14020ee5a: pcmpeqb xmm1, xmmword ptr [rip + 0x5d009ce]
0x14020ee62: pcmpeqb xmm0, xmmword ptr [rip + 0x5d009d6]
0x14020ee6a: pand xmm0, xmm1
0x14020ee6e: pmovmskb eax, xmm0
0x14020ee72: mov r15d, 0x19
0x14020ee78: cmp eax, 0xffff
0x14020ee7d: je 0x14020f567
0x14020ee83: call 0x140002200
0x14020ee88: mov r13d, 1
0x14020ee8e: mov edx, 1
0x14020ee93: mov rcx, r15
0x14020ee96: call 0x1400021c0
0x14020ee9b: test rax, rax
0x14020ee9e: je 0x14020f586
0x14020eea4: mov r12, rax
0x14020eea7: mov rcx, rax
0x14020eeaa: mov rdx, r14
0x14020eead: mov r8, r15
0x14020eeb0: call 0x145d145fb
0x14020eeb5: mov qword ptr [rbp + 0x2c0], r15
0x14020eebc: mov qword ptr [rbp + 0x2c8], r12
0x14020eec3: mov qword ptr [rbp + 0x2d0], r15
0x14020eeca: mov rcx, qword ptr [rbx + 0x10]
0x14020eece: add rcx, -5
0x14020eed2: cmp rcx, 6
0x14020eed6: ja 0x14020f096
0x14020eedc: mov rax, qword ptr [rbx + 8]
0x14020eee0: lea rdx, [rip + 0x5d055ed]
0x14020eee7: movsxd rcx, dword ptr [rdx + rcx*4]
0x14020eeeb: add rcx, rdx
0x14020eeee: jmp rcx
0x14020eef0: mov ecx, 0x65646e65
0x14020eef5: xor ecx, dword ptr [rax]
0x14020eef7: movzx eax, byte ptr [rax + 4]
0x14020eefb: xor eax, 0x64
0x14020eefe: or eax, ecx
0x14020ef00: jne 0x14020f096
0x14020ef06: jmp 0x14020efb5
0x14020ef0b: mov ecx, 0x75666572
0x14020ef10: xor ecx, dword ptr [rax]
0x14020ef12: mov edx, 0x64657375
0x14020ef17: xor edx, dword ptr [rax + 3]
0x14020ef1a: or edx, ecx
0x14020ef1c: je 0x14020f0c3
0x14020ef22: mov ecx, 0x6e696f6a
0x14020ef27: xor ecx, dword ptr [rax]
0x14020ef29: mov edx, 0x676e696e
0x14020ef2e: xor edx, dword ptr [rax + 3]
0x14020ef31: or edx, ecx
0x14020ef33: jne 0x14020f096
0x14020ef39: lea rcx, [rip + 0x5d01f1c]
0x14020ef40: mov edx, 0xa
0x14020ef45: call 0x1458dfee0
0x14020ef4a: nop
0x14020ef4b: mov rbx, rdx
0x14020ef4e: test rdx, rdx
0x14020ef51: jns 0x14020f50b
0x14020ef57: xor r12d, r12d
0x14020ef5a: mov rcx, r12
0x14020ef5d: mov rdx, rbx
0x14020ef60: call 0x145eb6fcb
0x14020ef65: nop
0x14020ef66: jmp 0x14020f593
0x14020ef6b: mov ecx, 0x696c6e6f
0x14020ef70: xor ecx, dword ptr [rax]
0x14020ef72: movzx edx, word ptr [rax + 4]
0x14020ef76: xor edx, 0x656e
0x14020ef7c: or edx, ecx
0x14020ef7e: je 0x14020f096
0x14020ef84: mov ecx, 0x696e6564
0x14020ef89: xor ecx, dword ptr [rax]
0x14020ef8b: movzx edx, word ptr [rax + 4]
0x14020ef8f: xor edx, 0x6465
0x14020ef95: or edx, ecx
0x14020ef97: je 0x14020f0c3
0x14020ef9d: mov ecx, 0x736f6c63
0x14020efa2: xor ecx, dword ptr [rax]
0x14020efa4: movzx eax, word ptr [rax + 4]
0x14020efa8: xor eax, 0x6465
0x14020efad: or eax, ecx
0x14020efaf: jne 0x14020f096
0x14020efb5: lea rcx, [rip + 0x5d01eaa]
0x14020efbc: mov edx, 0x17
0x14020efc1: call 0x1458dfee0
0x14020efc6: nop
0x14020efc7: mov r8, rdx
0x14020efca: lea rcx, [rip + 0x5d01c5b]
0x14020efd1: mov qword ptr [rbp + 0x120], rcx
0x14020efd8: mov qword ptr [rbp + 0x128], 3
0x14020efe3: lea rcx, [rbp + 0x2c0]
0x14020efea: mov qword ptr [rbp + 0x130], rcx
0x14020eff1: lea rcx, [rip + 0x5d01778]
0x14020eff8: mov qword ptr [rbp + 0x138], rcx
0x14020efff: mov qword ptr [rsp + 0x20], 1
0x14020f008: lea rcx, [rbp + 0x2d8]
0x14020f00f: lea r9, [rbp + 0x120]
0x14020f016: mov rdx, rax
0x14020f019: call 0x1458e0370
0x14020f01e: nop
0x14020f01f: jmp 0x14020f199
0x14020f024: movabs rcx, 0x697463656e6e6f63
0x14020f02e: xor rcx, qword ptr [rax]
0x14020f031: movzx eax, word ptr [rax + 8]
0x14020f035: xor rax, 0x676e
0x14020f03b: or rax, rcx
0x14020f03e: jne 0x14020f096
0x14020f040: lea rcx, [rip + 0x5d01e7f]
0x14020f047: mov edx, 0x22
0x14020f04c: call 0x1458dfee0
0x14020f051: nop
0x14020f052: mov rbx, rdx
0x14020f055: test rdx, rdx
0x14020f058: jns 0x14020f4ca
0x14020f05e: xor r12d, r12d
0x14020f061: mov rcx, r12
0x14020f064: mov rdx, rbx
0x14020f067: call 0x145eb6fcb
0x14020f06c: nop
0x14020f06d: jmp 0x14020f593
0x14020f072: movabs rcx, 0x616c696176616e75
0x14020f07c: xor rcx, qword ptr [rax]
0x14020f07f: movabs rdx, 0x656c62616c696176
0x14020f089: xor rdx, qword ptr [rax + 3]
0x14020f08d: or rdx, rcx
0x14020f090: je 0x14020f12f
0x14020f096: mov qword ptr [rbp + 0x2d8], 0
0x14020f0a1: mov qword ptr [rbp + 0x2e0], 1
0x14020f0ac: mov qword ptr [rbp + 0x2e8], 0
0x14020f0b7: movups xmm0, xmmword ptr [rip + 0x5d0140a]
0x14020f0be: jmp 0x14020f1a0
0x14020f0c3: lea rcx, [rip + 0x5d01dca]
0x14020f0ca: mov edx, 0x16
0x14020f0cf: call 0x1458dfee0
0x14020f0d4: nop
0x14020f0d5: mov r8, rdx
0x14020f0d8: lea rcx, [rip + 0x5d01b4d]
0x14020f0df: mov qword ptr [rbp + 0x120], rcx
0x14020f0e6: mov qword ptr [rbp + 0x128], 3
0x14020f0f1: lea rcx, [rbp + 0x2c0]
0x14020f0f8: mov qword ptr [rbp + 0x130], rcx
0x14020f0ff: lea rcx, [rip + 0x5d0166a]
0x14020f106: mov qword ptr [rbp + 0x138], rcx
0x14020f10d: mov qword ptr [rsp + 0x20], 1
0x14020f116: lea rcx, [rbp + 0x2d8]
0x14020f11d: lea r9, [rbp + 0x120]
0x14020f124: mov rdx, rax
0x14020f127: call 0x1458e0370
0x14020f12c: nop
0x14020f12d: jmp 0x14020f199
0x14020f12f: lea rcx, [rip + 0x5d01d74]
0x14020f136: mov edx, 0x1c
0x14020f13b: call 0x1458dfee0
0x14020f140: nop
0x14020f141: mov r8, rdx
0x14020f144: lea rcx, [rip + 0x5d01ae1]
0x14020f14b: mov qword ptr [rbp + 0x120], rcx
0x14020f152: mov qword ptr [rbp + 0x128], 3
0x14020f15d: lea rcx, [rbp + 0x2c0]
0x14020f164: mov qword ptr [rbp + 0x130], rcx
0x14020f16b: lea rcx, [rip + 0x5d015fe]
0x14020f172: mov qword ptr [rbp + 0x138], rcx
0x14020f179: mov qword ptr [rsp + 0x20], 1
0x14020f182: lea rcx, [rbp + 0x2d8]
0x14020f189: lea r9, [rbp + 0x120]
0x14020f190: mov rdx, rax
0x14020f193: call 0x1458e0370
0x14020f198: nop
0x14020f199: movups xmm0, xmmword ptr [rip + 0x5d01ce0]
0x14020f1a0: movaps xmmword ptr [rbp + 0x2f0], xmm0
0x14020f1a7: mov dword ptr [rbp + 0x300], 0x3f800000
0x14020f1b1: mov rax, qword ptr [rbp + 0x2d8]
0x14020f1b8: mov qword ptr [rbp + 0x2b8], rax
0x14020f1bf: mov rax, qword ptr [rbp + 0x2e0]
0x14020f1c6: mov qword ptr [rbp + 0x2b0], rax
0x14020f1cd: xorps xmm0, xmm0
0x14020f1d0: movaps xmmword ptr [rbp + 0x80], xmm0
0x14020f1d7: movaps xmmword ptr [rbp + 0x70], xmm0
0x14020f1db: movaps xmmword ptr [rbp + 0x60], xmm0
0x14020f1df: movaps xmmword ptr [rbp + 0x50], xmm0
0x14020f1e3: movaps xmmword ptr [rbp + 0x40], xmm0
0x14020f1e7: mov qword ptr [rbp + 0x90], 0
0x14020f1f2: mov byte ptr [rbp + 0x2a4], 0
0x14020f1f9: mov dword ptr [rbp + 0x2a0], 0
0x14020f203: movups xmm0, xmmword ptr [rip + 0x5d017f6]
0x14020f20a: movups xmmword ptr [rbp + 0x98], xmm0
0x14020f211: movups xmm0, xmmword ptr [rip + 0x5d017f8]
0x14020f218: movups xmmword ptr [rbp + 0xa8], xmm0
0x14020f21f: movups xmm0, xmmword ptr [rip + 0x5d017fa]
0x14020f226: movups xmmword ptr [rbp + 0xb8], xmm0
0x14020f22d: movups xmm0, xmmword ptr [rip + 0x5d017fc]
0x14020f234: movups xmmword ptr [rbp + 0xc8], xmm0
0x14020f23b: movups xmm0, xmmword ptr [rip + 0x5d0180e]
0x14020f242: movups xmmword ptr [rbp + 0xe8], xmm0
0x14020f249: movups xmm0, xmmword ptr [rip + 0x5d017f0]
0x14020f250: movups xmmword ptr [rbp + 0xd8], xmm0
0x14020f257: movups xmm0, xmmword ptr [rip + 0x5d01812]
0x14020f25e: movups xmmword ptr [rbp + 0x108], xmm0
0x14020f265: movups xmm0, xmmword ptr [rip + 0x5d017f4]
0x14020f26c: movups xmmword ptr [rbp + 0xf8], xmm0
0x14020f273: movups xmm0, xmmword ptr [rip + 0x5d016ce]
0x14020f27a: movaps xmmword ptr [rbp - 0x20], xmm0
0x14020f27e: mov qword ptr [rbp - 0x10], 0
0x14020f286: movups xmm0, xmmword ptr [rip + 0x5d016d3]
0x14020f28d: movups xmmword ptr [rbp - 8], xmm0
0x14020f291: mov qword ptr [rbp + 8], 0
0x14020f299: movups xmm0, xmmword ptr [rip + 0x5d016d8]
0x14020f2a0: movaps xmmword ptr [rbp + 0x10], xmm0
0x14020f2a4: mov qword ptr [rbp + 0x20], 0
0x14020f2ac: movups xmm0, xmmword ptr [rip + 0x5d016dd]
0x14020f2b3: movups xmmword ptr [rbp + 0x28], xmm0
0x14020f2b7: mov qword ptr [rbp + 0x38], 0
0x14020f2bf: mov rbx, qword ptr [rdi]
0x14020f2c2: add rdi, 8
0x14020f2c6: lea rcx, [rbp + 0x128]
0x14020f2cd: lea rdx, [rbp - 0x20]
0x14020f2d1: mov r8d, 0x138
0x14020f2d7: call 0x145d145fb
0x14020f2dc: movdqa xmm0, xmmword ptr [rip + 0x5cd0c1c]
0x14020f2e4: movdqu xmmword ptr [rbp + 0x260], xmm0
0x14020f2ec: mov dword ptr [rbp + 0x270], 1
0x14020f2f6: mov qword ptr [rbp + 0x274], 0
0x14020f301: mov byte ptr [rbp + 0x27c], 1
0x14020f308: mov qword ptr [rbp + 0x280], 0
0x14020f313: mov dword ptr [rbp + 0x288], 0x3f800000
0x14020f31d: mov word ptr [rbp + 0x28c], 0
0x14020f326: mov dword ptr [rbp + 0x28e], 0x10000
0x14020f330: mov word ptr [rbp + 0x292], 0
0x14020f339: mov dword ptr [rbp + 0x294], 0x10000
0x14020f343: mov word ptr [rbp + 0x298], 0
0x14020f34c: mov dword ptr [rbp + 0x29a], 0
0x14020f356: mov word ptr [rbp + 0x29e], 0
0x14020f35f: mov byte ptr [rbp + 0x2a5], 5
0x14020f366: mov qword ptr [rbp + 0x120], rbx
0x14020f36d: mov byte ptr [rbp + 0x30f], 1
0x14020f374: lea r9, [rip + 0x5cd17c5]
0x14020f37b: lea rcx, [rbp - 0x50]
0x14020f37f: lea r8, [rbp + 0x120]
0x14020f386: mov rdx, rdi
0x14020f389: call 0x1402b57b0
0x14020f38e: nop
0x14020f38f: cmp byte ptr [rsi], 1
0x14020f392: jne 0x14020f3ac
0x14020f394: mov eax, dword ptr [rsi + 1]
0x14020f397: mov ecx, dword ptr [rsi + 4]
0x14020f39a: mov dword ptr [rbp - 0x1d], ecx
0x14020f39d: mov dword ptr [rbp - 0x20], eax
0x14020f3a0: mov rax, qword ptr [rsi + 8]
0x14020f3a4: movzx ecx, byte ptr [rsi + 0x10]
0x14020f3a8: mov dl, 1
0x14020f3aa: jmp 0x14020f3bc
0x14020f3ac: mov rax, qword ptr [rsi + 8]
0x14020f3b0: lock inc qword ptr [rax]
0x14020f3b4: jle 0x14020f593
0x14020f3ba: xor edx, edx
0x14020f3bc: mov r8, qword ptr [rbp + 0x2e8]
0x14020f3c3: mov qword ptr [rbp + 0x130], r8
0x14020f3ca: movups xmm0, xmmword ptr [rbp + 0x2d8]
0x14020f3d1: movaps xmmword ptr [rbp + 0x120], xmm0
0x14020f3d8: mov qword ptr [rbp + 0x138], 0
0x14020f3e3: mov qword ptr [rbp + 0x140], 4
0x14020f3ee: mov qword ptr [rbp + 0x148], 0
0x14020f3f9: mov byte ptr [rbp + 0x150], dl
0x14020f3ff: mov edx, dword ptr [rbp - 0x20]
0x14020f402: mov r8d, dword ptr [rbp - 0x1d]
0x14020f406: mov dword ptr [rbp + 0x151], edx
0x14020f40c: mov dword ptr [rbp + 0x154], r8d
0x14020f413: mov qword ptr [rbp + 0x158], rax
0x14020f41a: mov qword ptr [rbp + 0x160], rcx
0x14020f421: mov dword ptr [rbp + 0x168], 0x41600000
0x14020f42b: mov word ptr [rbp + 0x16c], 0x190
0x14020f434: mov byte ptr [rbp + 0x16e], 1
0x14020f43b: mov eax, dword ptr [rbp + 0x300]
0x14020f441: mov dword ptr [rbp + 0x180], eax
0x14020f447: movaps xmm0, xmmword ptr [rbp + 0x2f0]
0x14020f44e: movaps xmmword ptr [rbp + 0x170], xmm0
0x14020f455: movups xmm0, xmmword ptr [rip + 0x5d05e74]
0x14020f45c: movups xmmword ptr [rbp + 0x184], xmm0
0x14020f463: mov eax, dword ptr [rip + 0x5d05e77]
0x14020f469: mov dword ptr [rbp + 0x194], eax
0x14020f46f: movq xmm0, qword ptr [rip + 0x5cd0af9]
0x14020f477: movq qword ptr [rbp + 0x198], xmm0
0x14020f47f: mov byte ptr [rbp + 0x30f], 0
0x14020f486: lea rcx, [rbp - 0x50]
0x14020f48a: lea rdx, [rbp + 0x120]
0x14020f491: call 0x1402d2c30
0x14020f496: nop
0x14020f497: mov rdx, qword ptr [rbp + 0x2c0]
0x14020f49e: test rdx, rdx
0x14020f4a1: je 0x14020f4b6
0x14020f4a3: mov rcx, qword ptr [rbp + 0x2c8]
0x14020f4aa: mov r8d, 1
0x14020f4b0: call 0x1400021d0
0x14020f4b5: nop
0x14020f4b6: add rsp, 0x398
0x14020f4bd: pop rbx
0x14020f4be: pop rdi
0x14020f4bf: pop rsi
0x14020f4c0: pop r12
0x14020f4c2: pop r13
0x14020f4c4: pop r14
0x14020f4c6: pop r15
0x14020f4c8: pop rbp
0x14020f4c9: ret
0x14020f4ca: test rbx, rbx
0x14020f4cd: je 0x14020f547
0x14020f4cf: mov r15, rax
0x14020f4d2: call 0x140002200
0x14020f4d7: mov r12d, 1
0x14020f4dd: mov edx, 1
0x14020f4e2: mov rcx, rbx
0x14020f4e5: call 0x1400021c0
0x14020f4ea: test rax, rax
0x14020f4ed: jne 0x14020f534
0x14020f4ef: jmp 0x14020f061
0x14020f4f4: lea rcx, [rip + 0x5d0180e]
0x14020f4fb: mov edx, 0x1d
0x14020f500: jmp 0x14020f573
0x14020f502: lea rcx, [rip + 0x5d017e7]
0x14020f509: jmp 0x14020f56e
0x14020f50b: test rbx, rbx
0x14020f50e: je 0x14020f547
0x14020f510: mov r15, rax
0x14020f513: call 0x140002200
0x14020f518: mov r12d, 1
0x14020f51e: mov edx, 1
0x14020f523: mov rcx, rbx
0x14020f526: call 0x1400021c0
0x14020f52b: test rax, rax
0x14020f52e: je 0x14020ef5a
0x14020f534: mov r14, rax
0x14020f537: mov rcx, rax
0x14020f53a: mov rdx, r15
0x14020f53d: mov r8, rbx
0x14020f540: call 0x145d145fb
0x14020f545: jmp 0x14020f54d
0x14020f547: mov r14d, 1
0x14020f54d: mov qword ptr [rbp + 0x2d8], rbx
0x14020f554: mov qword ptr [rbp + 0x2e0], r14
0x14020f55b: mov qword ptr [rbp + 0x2e8], rbx
0x14020f562: jmp 0x14020f0b7
0x14020f567: lea rcx, [rip + 0x5d0182d]
0x14020f56e: mov edx, 0x19
0x14020f573: call 0x1458dfee0
0x14020f578: mov r14, rax
0x14020f57b: mov r15, rdx
0x14020f57e: test r15, r15
0x14020f581: jns 0x14020f595
0x14020f583: xor r13d, r13d
0x14020f586: mov rcx, r13
0x14020f589: mov rdx, r15
0x14020f58c: call 0x145eb6fcb
0x14020f591: ud2
0x14020f593: ud2
0x14020f595: jne 0x14020ee83
0x14020f59b: mov r12d, 1
0x14020f5a1: xor r15d, r15d
0x14020f5a4: jmp 0x14020eeb5
