0x1458629b0: push rbp
0x1458629b1: push r15
0x1458629b3: push r14
0x1458629b5: push r13
0x1458629b7: push r12
0x1458629b9: push rsi
0x1458629ba: push rdi
0x1458629bb: push rbx
0x1458629bc: sub rsp, 0x458
0x1458629c3: lea rbp, [rsp + 0x80]
0x1458629cb: movaps xmmword ptr [rbp + 0x3c0], xmm15
0x1458629d3: movaps xmmword ptr [rbp + 0x3b0], xmm14
0x1458629db: movaps xmmword ptr [rbp + 0x3a0], xmm13
0x1458629e3: movaps xmmword ptr [rbp + 0x390], xmm12
0x1458629eb: movaps xmmword ptr [rbp + 0x380], xmm11
0x1458629f3: movaps xmmword ptr [rbp + 0x370], xmm10
0x1458629fb: movaps xmmword ptr [rbp + 0x360], xmm9
0x145862a03: movaps xmmword ptr [rbp + 0x350], xmm8
0x145862a0b: movaps xmmword ptr [rbp + 0x340], xmm7
0x145862a12: movaps xmmword ptr [rbp + 0x330], xmm6
0x145862a19: mov qword ptr [rbp + 0x328], 0xfffffffffffffffe
0x145862a24: mov bl, r9b
0x145862a27: mov qword ptr [rbp - 0x38], rcx
0x145862a2b: mov rsi, qword ptr [rdx]
0x145862a2e: mov byte ptr [rbp + 0x320], 1
0x145862a35: lea rcx, [rbp + 0x278]
0x145862a3c: mov qword ptr [rbp + 0x2f0], rdx
0x145862a43: mov qword ptr [rbp + 0x2e8], r8
0x145862a4a: call 0x14585c8e0
0x145862a4f: nop
0x145862a50: cmp bl, 2
0x145862a53: mov qword ptr [rbp + 0x308], rsi
0x145862a5a: mov byte ptr [rbp + 0x290], bl
0x145862a60: je 0x145862c4c
0x145862a66: cmp dword ptr [rsi + 0x68], 0xc
0x145862a6a: jne 0x145862c4c
0x145862a70: mov r15, qword ptr [rbp + 0x288]
0x145862a77: cmp qword ptr [rbp + 0x278], r15
0x145862a7e: je 0x1458664ea
0x145862a84: mov r12, qword ptr [rbp + 0x280]
0x145862a8b: mov byte ptr [r12 + r15], 0x20
0x145862a90: inc r15
0x145862a93: mov qword ptr [rbp + 0x288], r15
0x145862a9a: mov byte ptr [rbp + 0x325], 1
0x145862aa1: mov byte ptr [rbp + 0x324], 1
0x145862aa8: lea r13, [rip + 0x17c88cc]
0x145862aaf: mov edi, 0x52
0x145862ab4: mov edx, 0x52
0x145862ab9: mov rcx, r13
0x145862abc: call 0x1458dff90
0x145862ac1: nop
0x145862ac2: mov rsi, rdx
0x145862ac5: test rax, rax
0x145862ac8: cmovne r13, rax
0x145862acc: cmove rsi, rdi
0x145862ad0: mov rax, qword ptr [rbp + 0x2e8]
0x145862ad7: movss xmm0, dword ptr [rax + 8]
0x145862adc: movss xmm2, dword ptr [rip + 0x68116c]
0x145862ae4: mov rax, qword ptr [rbp + 0x308]
0x145862aeb: cmp qword ptr [rax + 8], 8
0x145862af0: jne 0x145862b0c
0x145862af2: mov rax, qword ptr [rax]
0x145862af5: movabs rcx, 0x657269666c6c6568
0x145862aff: cmp qword ptr [rax], rcx
0x145862b02: jne 0x145862b0c
0x145862b04: movss xmm2, dword ptr [rip + 0x67d870]
0x145862b0c: movss xmm1, dword ptr [rip + 0x67da88]
0x145862b14: mov rcx, qword ptr [rbp + 0x308]
0x145862b1b: movss xmm3, dword ptr [rcx + 0x48]
0x145862b20: mulss xmm3, xmm1
0x145862b24: mov rax, qword ptr [rbp + 0x2f0]
0x145862b2b: mulss xmm3, dword ptr [rax + 0x14]
0x145862b30: mulss xmm3, dword ptr [rax + 0x3c]
0x145862b35: mulss xmm0, xmm3
0x145862b39: movaps xmm3, xmm0
0x145862b3c: maxss xmm3, xmm2
0x145862b40: movaps xmm2, xmm3
0x145862b43: cmpunordss xmm2, xmm3
0x145862b48: andps xmm0, xmm2
0x145862b4b: andnps xmm2, xmm3
0x145862b4e: mulss xmm1, dword ptr [rcx + 0x58]
0x145862b53: mulss xmm1, dword ptr [rax + 0x20]
0x145862b58: mulss xmm1, dword ptr [rax + 0x48]
0x145862b5d: orps xmm2, xmm0
0x145862b60: addss xmm1, xmm2
0x145862b64: mov byte ptr [rbp + 0x325], 1
0x145862b6b: mov byte ptr [rbp + 0x324], 1
0x145862b72: lea rdi, [rbp + 0x1d0]
0x145862b79: mov rcx, rdi
0x145862b7c: call 0x1458627d0
0x145862b81: nop
0x145862b82: lea rax, [rip + 0x17c83ba]
0x145862b89: mov qword ptr [rbp + 0xe0], rax
0x145862b90: mov qword ptr [rbp + 0xe8], 5
0x145862b9b: mov qword ptr [rbp + 0xf0], rdi
0x145862ba2: lea rax, [rip + 0x17a9fc7]
0x145862ba9: mov qword ptr [rbp + 0xf8], rax
0x145862bb0: mov qword ptr [rsp + 0x20], 1
0x145862bb9: lea rcx, [rbp + 0x298]
0x145862bc0: lea r9, [rbp + 0xe0]
0x145862bc7: mov rdx, r13
0x145862bca: mov r8, rsi
0x145862bcd: call 0x1458e0370
0x145862bd2: nop
0x145862bd3: mov rdi, qword ptr [rbp + 0x2a0]
0x145862bda: mov rsi, qword ptr [rbp + 0x2a8]
0x145862be1: mov rax, qword ptr [rbp + 0x278]
0x145862be8: sub rax, r15
0x145862beb: cmp rsi, rax
0x145862bee: ja 0x145866529
0x145862bf4: test rsi, rsi
0x145862bf7: je 0x145862c0a
0x145862bf9: add r12, r15
0x145862bfc: mov rcx, r12
0x145862bff: mov rdx, rdi
0x145862c02: mov r8, rsi
0x145862c05: call 0x145d145fb
0x145862c0a: add r15, rsi
0x145862c0d: mov qword ptr [rbp + 0x288], r15
0x145862c14: mov rdx, qword ptr [rbp + 0x298]
0x145862c1b: test rdx, rdx
0x145862c1e: je 0x145862c2e
0x145862c20: mov r8d, 1
0x145862c26: mov rcx, rdi
0x145862c29: call 0x1400021d0
0x145862c2e: mov rdx, qword ptr [rbp + 0x1d0]
0x145862c35: test rdx, rdx
0x145862c38: je 0x145862c4c
0x145862c3a: mov rcx, qword ptr [rbp + 0x1d8]
0x145862c41: mov r8d, 1
0x145862c47: call 0x1400021d0
0x145862c4c: mov byte ptr [rbp + 0x325], 1
0x145862c53: mov byte ptr [rbp + 0x324], 1
0x145862c5a: lea r15, [rip + 0x17c876c]
0x145862c61: mov edx, 0xa
0x145862c66: mov rcx, r15
0x145862c69: call 0x1458dff90
0x145862c6e: nop
0x145862c6f: mov r13, rax
0x145862c72: mov r12, rdx
0x145862c75: mov qword ptr [rbp + 0x98], 0
0x145862c80: mov qword ptr [rbp + 0xa0], 8
0x145862c8b: mov qword ptr [rbp + 0xa8], 0
0x145862c96: mov rax, qword ptr [rbp + 0x2f0]
0x145862c9d: movss xmm9, dword ptr [rax + 0x10]
0x145862ca3: ucomiss xmm9, dword ptr [rip + 0x17a9c79]
0x145862cab: jbe 0x145862f31
0x145862cb1: mov rax, qword ptr [rbp + 0x308]
0x145862cb8: cmp byte ptr [rax + 0x75], 9
0x145862cbc: jne 0x145862ce5
0x145862cbe: mov eax, dword ptr [rax + 0x68]
0x145862cc1: mov dil, 1
0x145862cc4: movaps xmm0, xmm9
0x145862cc8: cmp eax, 0xd
0x145862ccb: je 0x145862cfd
0x145862ccd: and eax, 0xfffffffe
0x145862cd0: cmp eax, 6
0x145862cd3: jne 0x145862f31
0x145862cd9: xorps xmm0, xmm0
0x145862cdc: sqrtss xmm0, xmm9
0x145862ce1: xor edi, edi
0x145862ce3: jmp 0x145862cfd
0x145862ce5: movss xmm0, dword ptr [rax + 0x44]
0x145862cea: mov dil, 1
0x145862ced: xorps xmm1, xmm1
0x145862cf0: ucomiss xmm0, xmm1
0x145862cf3: movaps xmm0, xmm9
0x145862cf7: jbe 0x145862f31
0x145862cfd: addss xmm0, dword ptr [rip + 0x67d213]
0x145862d05: mulss xmm0, dword ptr [rip + 0x67d6b3]
0x145862d0d: movss dword ptr [rbp + 0x1d0], xmm0
0x145862d15: lea rax, [rbp + 0x1d0]
0x145862d1c: mov qword ptr [rbp + 0xe0], rax
0x145862d23: lea rax, [rip + 0x4953d6]
0x145862d2a: mov qword ptr [rbp + 0xe8], rax
0x145862d31: lea rdx, [rip + 0x17c863d]
0x145862d38: lea rsi, [rbp + 0x298]
0x145862d3f: lea r8, [rbp + 0xe0]
0x145862d46: mov rcx, rsi
0x145862d49: call 0x145ce7350
0x145862d4e: nop
0x145862d4f: test dil, dil
0x145862d52: je 0x145862dcf
0x145862d54: lea rdi, [rip + 0x17c7df3]
0x145862d5b: mov ebx, 0xc
0x145862d60: mov edx, 0xc
0x145862d65: mov rcx, rdi
0x145862d68: call 0x1458dff90
0x145862d6d: nop
0x145862d6e: mov r8, rdx
0x145862d71: test rax, rax
0x145862d74: cmovne rdi, rax
0x145862d78: cmove r8, rbx
0x145862d7c: lea rax, [rip + 0x17c7dbd]
0x145862d83: mov qword ptr [rbp + 0xe0], rax
0x145862d8a: mov qword ptr [rbp + 0xe8], 1
0x145862d95: mov qword ptr [rbp + 0xf0], rsi
0x145862d9c: lea rax, [rip + 0x17a9dcd]
0x145862da3: mov qword ptr [rbp + 0xf8], rax
0x145862daa: mov qword ptr [rsp + 0x20], 1
0x145862db3: lea rcx, [rbp + 0x1d0]
0x145862dba: lea r9, [rbp + 0xe0]
0x145862dc1: mov rdx, rdi
0x145862dc4: call 0x1458e0370
0x145862dc9: nop
0x145862dca: jmp 0x145862eca
0x145862dcf: mov rax, qword ptr [rbp + 0x308]
0x145862dd6: cmp dword ptr [rax + 0x68], 7
0x145862dda: jne 0x145862e54
0x145862ddc: lea rdi, [rip + 0x17c7d51]
0x145862de3: mov ebx, 0xc
0x145862de8: mov edx, 0xc
0x145862ded: mov rcx, rdi
0x145862df0: call 0x1458dff90
0x145862df5: nop
0x145862df6: mov r8, rdx
0x145862df9: test rax, rax
0x145862dfc: cmovne rdi, rax
0x145862e00: cmove r8, rbx
0x145862e04: lea rax, [rip + 0x17c7d35]
0x145862e0b: mov qword ptr [rbp + 0xe0], rax
0x145862e12: mov qword ptr [rbp + 0xe8], 1
0x145862e1d: mov qword ptr [rbp + 0xf0], rsi
0x145862e24: lea rax, [rip + 0x17a9d45]
0x145862e2b: mov qword ptr [rbp + 0xf8], rax
0x145862e32: mov qword ptr [rsp + 0x20], 1
0x145862e3b: lea rcx, [rbp + 0x1d0]
0x145862e42: lea r9, [rbp + 0xe0]
0x145862e49: mov rdx, rdi
0x145862e4c: call 0x1458e0370
0x145862e51: nop
0x145862e52: jmp 0x145862eca
0x145862e54: lea rdi, [rip + 0x17c7ce6]
0x145862e5b: mov ebx, 0xd
0x145862e60: mov edx, 0xd
0x145862e65: mov rcx, rdi
0x145862e68: call 0x1458dff90
0x145862e6d: nop
0x145862e6e: mov r8, rdx
0x145862e71: test rax, rax
0x145862e74: cmovne rdi, rax
0x145862e78: cmove r8, rbx
0x145862e7c: lea rax, [rip + 0x17c7cbd]
0x145862e83: mov qword ptr [rbp + 0xe0], rax
0x145862e8a: mov qword ptr [rbp + 0xe8], 1
0x145862e95: mov qword ptr [rbp + 0xf0], rsi
0x145862e9c: lea rax, [rip + 0x17a9ccd]
0x145862ea3: mov qword ptr [rbp + 0xf8], rax
0x145862eaa: mov qword ptr [rsp + 0x20], 1
0x145862eb3: lea rcx, [rbp + 0x1d0]
0x145862eba: lea r9, [rbp + 0xe0]
0x145862ec1: mov rdx, rdi
0x145862ec4: call 0x1458e0370
0x145862ec9: nop
0x145862eca: mov rsi, qword ptr [rbp + 0xa8]
0x145862ed1: cmp rsi, qword ptr [rbp + 0x98]
0x145862ed8: jne 0x145862ee7
0x145862eda: lea rcx, [rbp + 0x98]
0x145862ee1: call 0x145d14e50
0x145862ee6: nop
0x145862ee7: mov rax, qword ptr [rbp + 0xa0]
0x145862eee: lea rcx, [rsi + rsi*2]
0x145862ef2: mov rdx, qword ptr [rbp + 0x1e0]
0x145862ef9: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145862efe: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x145862f05: movups xmmword ptr [rax + rcx*8], xmm0
0x145862f09: inc rsi
0x145862f0c: mov qword ptr [rbp + 0xa8], rsi
0x145862f13: mov rdx, qword ptr [rbp + 0x298]
0x145862f1a: test rdx, rdx
0x145862f1d: je 0x145862f31
0x145862f1f: mov rcx, qword ptr [rbp + 0x2a0]
0x145862f26: mov r8d, 1
0x145862f2c: call 0x1400021d0
0x145862f31: mov rax, qword ptr [rbp + 0x2f0]
0x145862f38: movss xmm8, dword ptr [rax + 0x14]
0x145862f3e: movss xmm7, dword ptr [rip + 0x68d8be]
0x145862f46: ucomiss xmm7, xmm8
0x145862f4a: jbe 0x14586308a
0x145862f50: lea rsi, [rip + 0x17c7c03]
0x145862f57: mov edx, 0xe
0x145862f5c: mov rcx, rsi
0x145862f5f: call 0x1458dff90
0x145862f64: nop
0x145862f65: mov rdi, rax
0x145862f68: mov r14, rdx
0x145862f6b: movss xmm0, dword ptr [rip + 0x67cf3d]
0x145862f73: subss xmm0, xmm8
0x145862f78: mulss xmm0, dword ptr [rip + 0x67d440]
0x145862f80: movss dword ptr [rbp + 0x298], xmm0
0x145862f88: lea rax, [rbp + 0x298]
0x145862f8f: mov qword ptr [rbp + 0xe0], rax
0x145862f96: lea rax, [rip + 0x495163]
0x145862f9d: mov qword ptr [rbp + 0xe8], rax
0x145862fa4: lea rdx, [rip + 0x17c83ca]
0x145862fab: lea rbx, [rbp + 0x1d0]
0x145862fb2: lea r8, [rbp + 0xe0]
0x145862fb9: mov rcx, rbx
0x145862fbc: call 0x145ce7350
0x145862fc1: nop
0x145862fc2: test rdi, rdi
0x145862fc5: mov eax, 0xe
0x145862fca: cmove r14, rax
0x145862fce: cmovne rsi, rdi
0x145862fd2: lea rax, [rip + 0x17c7b67]
0x145862fd9: mov qword ptr [rbp + 0xe0], rax
0x145862fe0: mov qword ptr [rbp + 0xe8], 1
0x145862feb: mov qword ptr [rbp + 0xf0], rbx
0x145862ff2: lea rax, [rip + 0x17a9b77]
0x145862ff9: mov qword ptr [rbp + 0xf8], rax
0x145863000: mov qword ptr [rsp + 0x20], 1
0x145863009: lea rcx, [rbp + 0x298]
0x145863010: lea r9, [rbp + 0xe0]
0x145863017: mov rdx, rsi
0x14586301a: mov r8, r14
0x14586301d: call 0x1458e0370
0x145863022: nop
0x145863023: mov rsi, qword ptr [rbp + 0xa8]
0x14586302a: cmp rsi, qword ptr [rbp + 0x98]
0x145863031: jne 0x145863040
0x145863033: lea rcx, [rbp + 0x98]
0x14586303a: call 0x145d14e50
0x14586303f: nop
0x145863040: mov rax, qword ptr [rbp + 0xa0]
0x145863047: lea rcx, [rsi + rsi*2]
0x14586304b: mov rdx, qword ptr [rbp + 0x2a8]
0x145863052: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863057: movups xmm0, xmmword ptr [rbp + 0x298]
0x14586305e: movups xmmword ptr [rax + rcx*8], xmm0
0x145863062: inc rsi
0x145863065: mov qword ptr [rbp + 0xa8], rsi
0x14586306c: mov rdx, qword ptr [rbp + 0x1d0]
0x145863073: test rdx, rdx
0x145863076: je 0x14586308a
0x145863078: mov rcx, qword ptr [rbp + 0x1d8]
0x14586307f: mov r8d, 1
0x145863085: call 0x1400021d0
0x14586308a: mov rax, qword ptr [rbp + 0x2f0]
0x145863091: mov eax, dword ptr [rax + 0x18]
0x145863094: test eax, eax
0x145863096: je 0x145863210
0x14586309c: cmp eax, 1
0x14586309f: jne 0x1458630e5
0x1458630a1: lea r14, [rip + 0x17c7ac0]
0x1458630a8: mov edi, 9
0x1458630ad: mov edx, 9
0x1458630b2: mov rcx, r14
0x1458630b5: call 0x1458dff90
0x1458630ba: nop
0x1458630bb: mov rsi, rdx
0x1458630be: test rax, rax
0x1458630c1: cmovne r14, rax
0x1458630c5: cmove rsi, rdi
0x1458630c9: test rsi, rsi
0x1458630cc: jns 0x145863178
0x1458630d2: xor ebx, ebx
0x1458630d4: mov rcx, rbx
0x1458630d7: mov rdx, rsi
0x1458630da: call 0x145eb6fcb
0x1458630df: nop
0x1458630e0: jmp 0x14586664c
0x1458630e5: lea rsi, [rip + 0x17c7a85]
0x1458630ec: mov edi, 0xc
0x1458630f1: mov edx, 0xc
0x1458630f6: mov rcx, rsi
0x1458630f9: call 0x1458dff90
0x1458630fe: nop
0x1458630ff: mov r8, rdx
0x145863102: mov rcx, qword ptr [rbp + 0x2f0]
0x145863109: add rcx, 0x18
0x14586310d: test rax, rax
0x145863110: cmovne rsi, rax
0x145863114: cmove r8, rdi
0x145863118: lea rax, [rip + 0x17a9a71]
0x14586311f: mov qword ptr [rbp + 0xe0], rax
0x145863126: mov qword ptr [rbp + 0xe8], 1
0x145863131: mov qword ptr [rbp + 0xf0], rcx
0x145863138: lea rax, [rip + 0x17a9ad9]
0x14586313f: mov qword ptr [rbp + 0xf8], rax
0x145863146: mov qword ptr [rsp + 0x20], 1
0x14586314f: lea rcx, [rbp + 0x1d0]
0x145863156: lea r9, [rbp + 0xe0]
0x14586315d: mov rdx, rsi
0x145863160: call 0x1458e0370
0x145863165: nop
0x145863166: mov rsi, qword ptr [rbp + 0xa8]
0x14586316d: cmp rsi, qword ptr [rbp + 0x98]
0x145863174: je 0x1458631d7
0x145863176: jmp 0x1458631e4
0x145863178: je 0x1458631ad
0x14586317a: call 0x140002200
0x14586317f: mov ebx, 1
0x145863184: mov edx, 1
0x145863189: mov rcx, rsi
0x14586318c: call 0x1400021c0
0x145863191: test rax, rax
0x145863194: je 0x1458630d4
0x14586319a: mov rdi, rax
0x14586319d: mov rcx, rax
0x1458631a0: mov rdx, r14
0x1458631a3: mov r8, rsi
0x1458631a6: call 0x145d145fb
0x1458631ab: jmp 0x1458631b2
0x1458631ad: mov edi, 1
0x1458631b2: mov qword ptr [rbp + 0x1d0], rsi
0x1458631b9: mov qword ptr [rbp + 0x1d8], rdi
0x1458631c0: mov qword ptr [rbp + 0x1e0], rsi
0x1458631c7: mov rsi, qword ptr [rbp + 0xa8]
0x1458631ce: cmp rsi, qword ptr [rbp + 0x98]
0x1458631d5: jne 0x1458631e4
0x1458631d7: lea rcx, [rbp + 0x98]
0x1458631de: call 0x145d14e50
0x1458631e3: nop
0x1458631e4: mov rax, qword ptr [rbp + 0xa0]
0x1458631eb: lea rcx, [rsi + rsi*2]
0x1458631ef: mov rdx, qword ptr [rbp + 0x1e0]
0x1458631f6: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1458631fb: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x145863202: movups xmmword ptr [rax + rcx*8], xmm0
0x145863206: inc rsi
0x145863209: mov qword ptr [rbp + 0xa8], rsi
0x145863210: mov rax, qword ptr [rbp + 0x2f0]
0x145863217: movss xmm11, dword ptr [rax + 0x1c]
0x14586321d: ucomiss xmm11, dword ptr [rip + 0x17a96ff]
0x145863225: jbe 0x145863365
0x14586322b: lea rsi, [rip + 0x17c794b]
0x145863232: mov edx, 0xa
0x145863237: mov rcx, rsi
0x14586323a: call 0x1458dff90
0x14586323f: nop
0x145863240: mov rdi, rax
0x145863243: mov r14, rdx
0x145863246: movss xmm0, dword ptr [rip + 0x67ccca]
0x14586324e: addss xmm0, xmm11
0x145863253: mulss xmm0, dword ptr [rip + 0x67d165]
0x14586325b: movss dword ptr [rbp + 0x298], xmm0
0x145863263: lea rax, [rbp + 0x298]
0x14586326a: mov qword ptr [rbp + 0xe0], rax
0x145863271: lea rax, [rip + 0x494e88]
0x145863278: mov qword ptr [rbp + 0xe8], rax
0x14586327f: lea rdx, [rip + 0x17c80ef]
0x145863286: lea rbx, [rbp + 0x1d0]
0x14586328d: lea r8, [rbp + 0xe0]
0x145863294: mov rcx, rbx
0x145863297: call 0x145ce7350
0x14586329c: nop
0x14586329d: test rdi, rdi
0x1458632a0: mov eax, 0xa
0x1458632a5: cmove r14, rax
0x1458632a9: cmovne rsi, rdi
0x1458632ad: lea rax, [rip + 0x17c788c]
0x1458632b4: mov qword ptr [rbp + 0xe0], rax
0x1458632bb: mov qword ptr [rbp + 0xe8], 1
0x1458632c6: mov qword ptr [rbp + 0xf0], rbx
0x1458632cd: lea rax, [rip + 0x17a989c]
0x1458632d4: mov qword ptr [rbp + 0xf8], rax
0x1458632db: mov qword ptr [rsp + 0x20], 1
0x1458632e4: lea rcx, [rbp + 0x298]
0x1458632eb: lea r9, [rbp + 0xe0]
0x1458632f2: mov rdx, rsi
0x1458632f5: mov r8, r14
0x1458632f8: call 0x1458e0370
0x1458632fd: nop
0x1458632fe: mov rsi, qword ptr [rbp + 0xa8]
0x145863305: cmp rsi, qword ptr [rbp + 0x98]
0x14586330c: jne 0x14586331b
0x14586330e: lea rcx, [rbp + 0x98]
0x145863315: call 0x145d14e50
0x14586331a: nop
0x14586331b: mov rax, qword ptr [rbp + 0xa0]
0x145863322: lea rcx, [rsi + rsi*2]
0x145863326: mov rdx, qword ptr [rbp + 0x2a8]
0x14586332d: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863332: movups xmm0, xmmword ptr [rbp + 0x298]
0x145863339: movups xmmword ptr [rax + rcx*8], xmm0
0x14586333d: inc rsi
0x145863340: mov qword ptr [rbp + 0xa8], rsi
0x145863347: mov rdx, qword ptr [rbp + 0x1d0]
0x14586334e: test rdx, rdx
0x145863351: je 0x145863365
0x145863353: mov rcx, qword ptr [rbp + 0x1d8]
0x14586335a: mov r8d, 1
0x145863360: call 0x1400021d0
0x145863365: mov rax, qword ptr [rbp + 0x2f0]
0x14586336c: movss xmm6, dword ptr [rax + 0x20]
0x145863371: ucomiss xmm6, dword ptr [rip + 0x17a95ac]
0x145863378: jbe 0x1458634b7
0x14586337e: lea rsi, [rip + 0x17c7802]
0x145863385: mov edx, 0xe
0x14586338a: mov rcx, rsi
0x14586338d: call 0x1458dff90
0x145863392: nop
0x145863393: mov rdi, rax
0x145863396: mov r14, rdx
0x145863399: movss xmm0, dword ptr [rip + 0x67cb77]
0x1458633a1: addss xmm0, xmm6
0x1458633a5: mulss xmm0, dword ptr [rip + 0x67d013]
0x1458633ad: movss dword ptr [rbp + 0x298], xmm0
0x1458633b5: lea rax, [rbp + 0x298]
0x1458633bc: mov qword ptr [rbp + 0xe0], rax
0x1458633c3: lea rax, [rip + 0x494d36]
0x1458633ca: mov qword ptr [rbp + 0xe8], rax
0x1458633d1: lea rdx, [rip + 0x17c7f9d]
0x1458633d8: lea rbx, [rbp + 0x1d0]
0x1458633df: lea r8, [rbp + 0xe0]
0x1458633e6: mov rcx, rbx
0x1458633e9: call 0x145ce7350
0x1458633ee: nop
0x1458633ef: test rdi, rdi
0x1458633f2: mov eax, 0xe
0x1458633f7: cmove r14, rax
0x1458633fb: cmovne rsi, rdi
0x1458633ff: lea rax, [rip + 0x17c773a]
0x145863406: mov qword ptr [rbp + 0xe0], rax
0x14586340d: mov qword ptr [rbp + 0xe8], 1
0x145863418: mov qword ptr [rbp + 0xf0], rbx
0x14586341f: lea rax, [rip + 0x17a974a]
0x145863426: mov qword ptr [rbp + 0xf8], rax
0x14586342d: mov qword ptr [rsp + 0x20], 1
0x145863436: lea rcx, [rbp + 0x298]
0x14586343d: lea r9, [rbp + 0xe0]
0x145863444: mov rdx, rsi
0x145863447: mov r8, r14
0x14586344a: call 0x1458e0370
0x14586344f: nop
0x145863450: mov rsi, qword ptr [rbp + 0xa8]
0x145863457: cmp rsi, qword ptr [rbp + 0x98]
0x14586345e: jne 0x14586346d
0x145863460: lea rcx, [rbp + 0x98]
0x145863467: call 0x145d14e50
0x14586346c: nop
0x14586346d: mov rax, qword ptr [rbp + 0xa0]
0x145863474: lea rcx, [rsi + rsi*2]
0x145863478: mov rdx, qword ptr [rbp + 0x2a8]
0x14586347f: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863484: movups xmm0, xmmword ptr [rbp + 0x298]
0x14586348b: movups xmmword ptr [rax + rcx*8], xmm0
0x14586348f: inc rsi
0x145863492: mov qword ptr [rbp + 0xa8], rsi
0x145863499: mov rdx, qword ptr [rbp + 0x1d0]
0x1458634a0: test rdx, rdx
0x1458634a3: je 0x1458634b7
0x1458634a5: mov rcx, qword ptr [rbp + 0x1d8]
0x1458634ac: mov r8d, 1
0x1458634b2: call 0x1400021d0
0x1458634b7: test r13, r13
0x1458634ba: mov rax, qword ptr [rbp + 0xa8]
0x1458634c1: mov qword ptr [rbp + 0x70], rax
0x1458634c5: movups xmm0, xmmword ptr [rbp + 0x98]
0x1458634cc: movups xmmword ptr [rbp + 0x60], xmm0
0x1458634d0: mov eax, 0xa
0x1458634d5: cmove r12, rax
0x1458634d9: cmovne r15, r13
0x1458634dd: lea rax, [rip + 0x17c7ef3]
0x1458634e4: mov qword ptr [rbp + 0x40], rax
0x1458634e8: mov qword ptr [rbp + 0x48], 0xa
0x1458634f0: mov qword ptr [rbp + 0x50], r15
0x1458634f4: mov qword ptr [rbp + 0x58], r12
0x1458634f8: mov byte ptr [rbp + 0x31f], 1
0x1458634ff: lea r15, [rip + 0x17c7edb]
0x145863506: mov edx, 0xe
0x14586350b: mov rcx, r15
0x14586350e: call 0x1458dff90
0x145863513: nop
0x145863514: mov r13, rax
0x145863517: mov r12, rdx
0x14586351a: mov qword ptr [rbp + 0x2d0], 0
0x145863525: mov qword ptr [rbp + 0x2d8], 8
0x145863530: mov qword ptr [rbp + 0x2e0], 0
0x14586353b: mov rax, qword ptr [rbp + 0x308]
0x145863542: cmp byte ptr [rax + 0x75], 9
0x145863546: jne 0x145863553
0x145863548: cmp dword ptr [rax + 0x68], 0xd
0x14586354c: je 0x145863564
0x14586354e: jmp 0x145863723
0x145863553: movss xmm0, dword ptr [rax + 0x44]
0x145863558: xorps xmm1, xmm1
0x14586355b: ucomiss xmm0, xmm1
0x14586355e: jbe 0x145863723
0x145863564: mov rax, qword ptr [rbp + 0x2e8]
0x14586356b: movss xmm0, dword ptr [rax + 4]
0x145863570: movss xmm10, dword ptr [rip + 0x67c99f]
0x145863579: addss xmm10, xmm0
0x14586357e: andps xmm10, xmmword ptr [rip + 0x6821fa]
0x145863586: ucomiss xmm10, dword ptr [rip + 0x87a75a]
0x14586358e: jbe 0x145863723
0x145863594: ucomiss xmm0, dword ptr [rip + 0x67c915]
0x14586359b: lea rax, [rip + 0x17c823e]
0x1458635a2: lea rcx, [rip + 0x17c8238]
0x1458635a9: cmovb rcx, rax
0x1458635ad: mov qword ptr [rbp + 0x98], rcx
0x1458635b4: mov qword ptr [rbp + 0xa0], 1
0x1458635bf: lea rsi, [rip + 0x17c821c]
0x1458635c6: mov edx, 0x11
0x1458635cb: mov rcx, rsi
0x1458635ce: call 0x1458dff90
0x1458635d3: nop
0x1458635d4: mov rdi, rax
0x1458635d7: mov r14, rdx
0x1458635da: mulss xmm10, dword ptr [rip + 0x67cddd]
0x1458635e3: movss dword ptr [rbp + 0x298], xmm10
0x1458635ec: lea rax, [rbp + 0x298]
0x1458635f3: mov qword ptr [rbp + 0xe0], rax
0x1458635fa: lea rax, [rip + 0x494aff]
0x145863601: mov qword ptr [rbp + 0xe8], rax
0x145863608: lea rdx, [rip + 0x17c7d66]
0x14586360f: lea rbx, [rbp + 0x1d0]
0x145863616: lea r8, [rbp + 0xe0]
0x14586361d: mov rcx, rbx
0x145863620: call 0x145ce7350
0x145863625: nop
0x145863626: test rdi, rdi
0x145863629: mov eax, 0x11
0x14586362e: cmove r14, rax
0x145863632: cmovne rsi, rdi
0x145863636: lea rax, [rip + 0x17c81b6]
0x14586363d: mov qword ptr [rbp + 0xe0], rax
0x145863644: mov qword ptr [rbp + 0xe8], 4
0x14586364f: lea rax, [rbp + 0x98]
0x145863656: mov qword ptr [rbp + 0xf0], rax
0x14586365d: lea rax, [rip + 0x17a958c]
0x145863664: mov qword ptr [rbp + 0xf8], rax
0x14586366b: lea rax, [rip + 0x17c74ce]
0x145863672: mov qword ptr [rbp + 0x100], rax
0x145863679: mov qword ptr [rbp + 0x108], 1
0x145863684: mov qword ptr [rbp + 0x110], rbx
0x14586368b: lea rax, [rip + 0x17a94de]
0x145863692: mov qword ptr [rbp + 0x118], rax
0x145863699: mov qword ptr [rsp + 0x20], 2
0x1458636a2: lea rcx, [rbp + 0x298]
0x1458636a9: lea r9, [rbp + 0xe0]
0x1458636b0: mov rdx, rsi
0x1458636b3: mov r8, r14
0x1458636b6: call 0x1458e0370
0x1458636bb: nop
0x1458636bc: mov rsi, qword ptr [rbp + 0x2e0]
0x1458636c3: cmp rsi, qword ptr [rbp + 0x2d0]
0x1458636ca: jne 0x1458636d9
0x1458636cc: lea rcx, [rbp + 0x2d0]
0x1458636d3: call 0x145d14e50
0x1458636d8: nop
0x1458636d9: mov rax, qword ptr [rbp + 0x2d8]
0x1458636e0: lea rcx, [rsi + rsi*2]
0x1458636e4: mov rdx, qword ptr [rbp + 0x2a8]
0x1458636eb: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1458636f0: movups xmm0, xmmword ptr [rbp + 0x298]
0x1458636f7: movups xmmword ptr [rax + rcx*8], xmm0
0x1458636fb: inc rsi
0x1458636fe: mov qword ptr [rbp + 0x2e0], rsi
0x145863705: mov rdx, qword ptr [rbp + 0x1d0]
0x14586370c: test rdx, rdx
0x14586370f: je 0x145863723
0x145863711: mov rcx, qword ptr [rbp + 0x1d8]
0x145863718: mov r8d, 1
0x14586371e: call 0x1400021d0
0x145863723: mov rax, qword ptr [rbp + 0x2e8]
0x14586372a: movss xmm10, dword ptr [rax + 8]
0x145863730: ucomiss xmm7, xmm10
0x145863734: jbe 0x145863874
0x14586373a: lea rsi, [rip + 0x17c7419]
0x145863741: mov edx, 0xe
0x145863746: mov rcx, rsi
0x145863749: call 0x1458dff90
0x14586374e: nop
0x14586374f: mov rdi, rax
0x145863752: mov r14, rdx
0x145863755: movss xmm0, dword ptr [rip + 0x67c753]
0x14586375d: subss xmm0, xmm10
0x145863762: mulss xmm0, dword ptr [rip + 0x67cc56]
0x14586376a: movss dword ptr [rbp + 0x298], xmm0
0x145863772: lea rax, [rbp + 0x298]
0x145863779: mov qword ptr [rbp + 0xe0], rax
0x145863780: lea rax, [rip + 0x494979]
0x145863787: mov qword ptr [rbp + 0xe8], rax
0x14586378e: lea rdx, [rip + 0x17c7be0]
0x145863795: lea rbx, [rbp + 0x1d0]
0x14586379c: lea r8, [rbp + 0xe0]
0x1458637a3: mov rcx, rbx
0x1458637a6: call 0x145ce7350
0x1458637ab: nop
0x1458637ac: test rdi, rdi
0x1458637af: mov eax, 0xe
0x1458637b4: cmove r14, rax
0x1458637b8: cmovne rsi, rdi
0x1458637bc: lea rax, [rip + 0x17c737d]
0x1458637c3: mov qword ptr [rbp + 0xe0], rax
0x1458637ca: mov qword ptr [rbp + 0xe8], 1
0x1458637d5: mov qword ptr [rbp + 0xf0], rbx
0x1458637dc: lea rax, [rip + 0x17a938d]
0x1458637e3: mov qword ptr [rbp + 0xf8], rax
0x1458637ea: mov qword ptr [rsp + 0x20], 1
0x1458637f3: lea rcx, [rbp + 0x298]
0x1458637fa: lea r9, [rbp + 0xe0]
0x145863801: mov rdx, rsi
0x145863804: mov r8, r14
0x145863807: call 0x1458e0370
0x14586380c: nop
0x14586380d: mov rsi, qword ptr [rbp + 0x2e0]
0x145863814: cmp rsi, qword ptr [rbp + 0x2d0]
0x14586381b: jne 0x14586382a
0x14586381d: lea rcx, [rbp + 0x2d0]
0x145863824: call 0x145d14e50
0x145863829: nop
0x14586382a: mov rax, qword ptr [rbp + 0x2d8]
0x145863831: lea rcx, [rsi + rsi*2]
0x145863835: mov rdx, qword ptr [rbp + 0x2a8]
0x14586383c: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863841: movups xmm0, xmmword ptr [rbp + 0x298]
0x145863848: movups xmmword ptr [rax + rcx*8], xmm0
0x14586384c: inc rsi
0x14586384f: mov qword ptr [rbp + 0x2e0], rsi
0x145863856: mov rdx, qword ptr [rbp + 0x1d0]
0x14586385d: test rdx, rdx
0x145863860: je 0x145863874
0x145863862: mov rcx, qword ptr [rbp + 0x1d8]
0x145863869: mov r8d, 1
0x14586386f: call 0x1400021d0
0x145863874: mov rax, qword ptr [rbp + 0x308]
0x14586387b: movzx eax, byte ptr [rax + 0x75]
0x14586387f: lea ecx, [rax - 2]
0x145863882: cmp ecx, 3
0x145863885: jb 0x1458638ad
0x145863887: cmp eax, 8
0x14586388a: je 0x1458638ad
0x14586388c: cmp eax, 0xa
0x14586388f: jne 0x145863a05
0x145863895: mov rax, qword ptr [rbp + 0x308]
0x14586389c: movss xmm0, dword ptr [rax + 0x50]
0x1458638a1: xorps xmm1, xmm1
0x1458638a4: ucomiss xmm0, xmm1
0x1458638a7: jbe 0x145863a05
0x1458638ad: mov rax, qword ptr [rbp + 0x2e8]
0x1458638b4: movss xmm7, dword ptr [rax + 0x28]
0x1458638b9: addss xmm7, dword ptr [rip + 0x67c657]
0x1458638c1: movaps xmm0, xmmword ptr [rip + 0x681eb8]
0x1458638c8: andps xmm0, xmm7
0x1458638cb: ucomiss xmm0, dword ptr [rip + 0x87a416]
0x1458638d2: jbe 0x145863a05
0x1458638d8: lea rsi, [rip + 0x17c729e]
0x1458638df: mov edx, 0xa
0x1458638e4: mov rcx, rsi
0x1458638e7: call 0x1458dff90
0x1458638ec: nop
0x1458638ed: mov rdi, rax
0x1458638f0: mov r14, rdx
0x1458638f3: mulss xmm7, dword ptr [rip + 0x67cac5]
0x1458638fb: movss dword ptr [rbp + 0x298], xmm7
0x145863903: lea rax, [rbp + 0x298]
0x14586390a: mov qword ptr [rbp + 0xe0], rax
0x145863911: lea rax, [rip + 0x4947e8]
0x145863918: mov qword ptr [rbp + 0xe8], rax
0x14586391f: lea rdx, [rip + 0x17c7a4f]
0x145863926: lea rbx, [rbp + 0x1d0]
0x14586392d: lea r8, [rbp + 0xe0]
0x145863934: mov rcx, rbx
0x145863937: call 0x145ce7350
0x14586393c: nop
0x14586393d: test rdi, rdi
0x145863940: mov eax, 0xa
0x145863945: cmove r14, rax
0x145863949: cmovne rsi, rdi
0x14586394d: lea rax, [rip + 0x17c71ec]
0x145863954: mov qword ptr [rbp + 0xe0], rax
0x14586395b: mov qword ptr [rbp + 0xe8], 1
0x145863966: mov qword ptr [rbp + 0xf0], rbx
0x14586396d: lea rax, [rip + 0x17a91fc]
0x145863974: mov qword ptr [rbp + 0xf8], rax
0x14586397b: mov qword ptr [rsp + 0x20], 1
0x145863984: lea rcx, [rbp + 0x298]
0x14586398b: lea r9, [rbp + 0xe0]
0x145863992: mov rdx, rsi
0x145863995: mov r8, r14
0x145863998: call 0x1458e0370
0x14586399d: nop
0x14586399e: mov rsi, qword ptr [rbp + 0x2e0]
0x1458639a5: cmp rsi, qword ptr [rbp + 0x2d0]
0x1458639ac: jne 0x1458639bb
0x1458639ae: lea rcx, [rbp + 0x2d0]
0x1458639b5: call 0x145d14e50
0x1458639ba: nop
0x1458639bb: mov rax, qword ptr [rbp + 0x2d8]
0x1458639c2: lea rcx, [rsi + rsi*2]
0x1458639c6: mov rdx, qword ptr [rbp + 0x2a8]
0x1458639cd: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1458639d2: movups xmm0, xmmword ptr [rbp + 0x298]
0x1458639d9: movups xmmword ptr [rax + rcx*8], xmm0
0x1458639dd: inc rsi
0x1458639e0: mov qword ptr [rbp + 0x2e0], rsi
0x1458639e7: mov rdx, qword ptr [rbp + 0x1d0]
0x1458639ee: test rdx, rdx
0x1458639f1: je 0x145863a05
0x1458639f3: mov rcx, qword ptr [rbp + 0x1d8]
0x1458639fa: mov r8d, 1
0x145863a00: call 0x1400021d0
0x145863a05: mov rax, qword ptr [rbp + 0x308]
0x145863a0c: cmp dword ptr [rax + 0x54], 0
0x145863a10: je 0x145863b9c
0x145863a16: mov rax, qword ptr [rbp + 0x2e8]
0x145863a1d: mov eax, dword ptr [rax + 0x34]
0x145863a20: test eax, eax
0x145863a22: je 0x145863b9c
0x145863a28: cmp eax, 1
0x145863a2b: jne 0x145863a71
0x145863a2d: lea r14, [rip + 0x17c7134]
0x145863a34: mov edi, 9
0x145863a39: mov edx, 9
0x145863a3e: mov rcx, r14
0x145863a41: call 0x1458dff90
0x145863a46: nop
0x145863a47: mov rsi, rdx
0x145863a4a: test rax, rax
0x145863a4d: cmovne r14, rax
0x145863a51: cmove rsi, rdi
0x145863a55: test rsi, rsi
0x145863a58: jns 0x145863b04
0x145863a5e: xor ebx, ebx
0x145863a60: mov rcx, rbx
0x145863a63: mov rdx, rsi
0x145863a66: call 0x145eb6fcb
0x145863a6b: nop
0x145863a6c: jmp 0x14586664c
0x145863a71: lea rsi, [rip + 0x17c70f9]
0x145863a78: mov edi, 0xc
0x145863a7d: mov edx, 0xc
0x145863a82: mov rcx, rsi
0x145863a85: call 0x1458dff90
0x145863a8a: nop
0x145863a8b: mov r8, rdx
0x145863a8e: mov rcx, qword ptr [rbp + 0x2e8]
0x145863a95: add rcx, 0x34
0x145863a99: test rax, rax
0x145863a9c: cmovne rsi, rax
0x145863aa0: cmove r8, rdi
0x145863aa4: lea rax, [rip + 0x17a90e5]
0x145863aab: mov qword ptr [rbp + 0xe0], rax
0x145863ab2: mov qword ptr [rbp + 0xe8], 1
0x145863abd: mov qword ptr [rbp + 0xf0], rcx
0x145863ac4: lea rax, [rip + 0x17a914d]
0x145863acb: mov qword ptr [rbp + 0xf8], rax
0x145863ad2: mov qword ptr [rsp + 0x20], 1
0x145863adb: lea rcx, [rbp + 0x1d0]
0x145863ae2: lea r9, [rbp + 0xe0]
0x145863ae9: mov rdx, rsi
0x145863aec: call 0x1458e0370
0x145863af1: nop
0x145863af2: mov rsi, qword ptr [rbp + 0x2e0]
0x145863af9: cmp rsi, qword ptr [rbp + 0x2d0]
0x145863b00: je 0x145863b63
0x145863b02: jmp 0x145863b70
0x145863b04: je 0x145863b39
0x145863b06: call 0x140002200
0x145863b0b: mov ebx, 1
0x145863b10: mov edx, 1
0x145863b15: mov rcx, rsi
0x145863b18: call 0x1400021c0
0x145863b1d: test rax, rax
0x145863b20: je 0x145863a60
0x145863b26: mov rdi, rax
0x145863b29: mov rcx, rax
0x145863b2c: mov rdx, r14
0x145863b2f: mov r8, rsi
0x145863b32: call 0x145d145fb
0x145863b37: jmp 0x145863b3e
0x145863b39: mov edi, 1
0x145863b3e: mov qword ptr [rbp + 0x1d0], rsi
0x145863b45: mov qword ptr [rbp + 0x1d8], rdi
0x145863b4c: mov qword ptr [rbp + 0x1e0], rsi
0x145863b53: mov rsi, qword ptr [rbp + 0x2e0]
0x145863b5a: cmp rsi, qword ptr [rbp + 0x2d0]
0x145863b61: jne 0x145863b70
0x145863b63: lea rcx, [rbp + 0x2d0]
0x145863b6a: call 0x145d14e50
0x145863b6f: nop
0x145863b70: mov rax, qword ptr [rbp + 0x2d8]
0x145863b77: lea rcx, [rsi + rsi*2]
0x145863b7b: mov rdx, qword ptr [rbp + 0x1e0]
0x145863b82: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863b87: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x145863b8e: movups xmmword ptr [rax + rcx*8], xmm0
0x145863b92: inc rsi
0x145863b95: mov qword ptr [rbp + 0x2e0], rsi
0x145863b9c: mov rax, qword ptr [rbp + 0x308]
0x145863ba3: cmp byte ptr [rax + 0x75], 9
0x145863ba7: jne 0x145863d0e
0x145863bad: mov rax, qword ptr [rbp + 0x308]
0x145863bb4: mov eax, dword ptr [rax + 0x68]
0x145863bb7: lea ecx, [rax - 7]
0x145863bba: cmp ecx, 4
0x145863bbd: jb 0x145863bc8
0x145863bbf: cmp eax, 0xd
0x145863bc2: jne 0x145863d0e
0x145863bc8: mov rax, qword ptr [rbp + 0x2e8]
0x145863bcf: movss xmm7, dword ptr [rax + 0x40]
0x145863bd4: ucomiss xmm7, dword ptr [rip + 0x87a10d]
0x145863bdb: jbe 0x145863d0e
0x145863be1: lea rsi, [rip + 0x17c7c0f]
0x145863be8: mov edx, 0x10
0x145863bed: mov rcx, rsi
0x145863bf0: call 0x1458dff90
0x145863bf5: nop
0x145863bf6: mov rdi, rax
0x145863bf9: mov r14, rdx
0x145863bfc: mulss xmm7, dword ptr [rip + 0x67c7bc]
0x145863c04: movss dword ptr [rbp + 0x298], xmm7
0x145863c0c: lea rax, [rbp + 0x298]
0x145863c13: mov qword ptr [rbp + 0xe0], rax
0x145863c1a: lea rax, [rip + 0x4944df]
0x145863c21: mov qword ptr [rbp + 0xe8], rax
0x145863c28: lea rdx, [rip + 0x17c7746]
0x145863c2f: lea rbx, [rbp + 0x1d0]
0x145863c36: lea r8, [rbp + 0xe0]
0x145863c3d: mov rcx, rbx
0x145863c40: call 0x145ce7350
0x145863c45: nop
0x145863c46: test rdi, rdi
0x145863c49: mov eax, 0x10
0x145863c4e: cmove r14, rax
0x145863c52: cmovne rsi, rdi
0x145863c56: lea rax, [rip + 0x17c6ee3]
0x145863c5d: mov qword ptr [rbp + 0xe0], rax
0x145863c64: mov qword ptr [rbp + 0xe8], 1
0x145863c6f: mov qword ptr [rbp + 0xf0], rbx
0x145863c76: lea rax, [rip + 0x17a8ef3]
0x145863c7d: mov qword ptr [rbp + 0xf8], rax
0x145863c84: mov qword ptr [rsp + 0x20], 1
0x145863c8d: lea rcx, [rbp + 0x298]
0x145863c94: lea r9, [rbp + 0xe0]
0x145863c9b: mov rdx, rsi
0x145863c9e: mov r8, r14
0x145863ca1: call 0x1458e0370
0x145863ca6: nop
0x145863ca7: mov rsi, qword ptr [rbp + 0x2e0]
0x145863cae: cmp rsi, qword ptr [rbp + 0x2d0]
0x145863cb5: jne 0x145863cc4
0x145863cb7: lea rcx, [rbp + 0x2d0]
0x145863cbe: call 0x145d14e50
0x145863cc3: nop
0x145863cc4: mov rax, qword ptr [rbp + 0x2d8]
0x145863ccb: lea rcx, [rsi + rsi*2]
0x145863ccf: mov rdx, qword ptr [rbp + 0x2a8]
0x145863cd6: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863cdb: movups xmm0, xmmword ptr [rbp + 0x298]
0x145863ce2: movups xmmword ptr [rax + rcx*8], xmm0
0x145863ce6: inc rsi
0x145863ce9: mov qword ptr [rbp + 0x2e0], rsi
0x145863cf0: mov rdx, qword ptr [rbp + 0x1d0]
0x145863cf7: test rdx, rdx
0x145863cfa: je 0x145863d0e
0x145863cfc: mov rcx, qword ptr [rbp + 0x1d8]
0x145863d03: mov r8d, 1
0x145863d09: call 0x1400021d0
0x145863d0e: test r13, r13
0x145863d11: mov rax, qword ptr [rbp + 0x2e0]
0x145863d18: mov qword ptr [rbp + 0xc8], rax
0x145863d1f: movups xmm0, xmmword ptr [rbp + 0x2d0]
0x145863d26: movups xmmword ptr [rbp + 0xb8], xmm0
0x145863d2d: mov eax, 0xe
0x145863d32: cmove r12, rax
0x145863d36: cmovne r15, r13
0x145863d3a: lea rax, [rip + 0x17c76ae]
0x145863d41: mov qword ptr [rbp + 0x98], rax
0x145863d48: mov qword ptr [rbp + 0xa0], 0xa
0x145863d53: mov qword ptr [rbp + 0xa8], r15
0x145863d5a: mov qword ptr [rbp + 0xb0], r12
0x145863d61: mov byte ptr [rbp + 0x307], 1
0x145863d68: lea rsi, [rip + 0x17c768a]
0x145863d6f: mov edi, 9
0x145863d74: mov edx, 9
0x145863d79: mov rcx, rsi
0x145863d7c: call 0x1458dff90
0x145863d81: nop
0x145863d82: test rax, rax
0x145863d85: cmovne rsi, rax
0x145863d89: cmove rdx, rdi
0x145863d8d: mov rcx, qword ptr [rbp + 0x440]
0x145863d94: mov rax, qword ptr [rcx + 0x10]
0x145863d98: mov qword ptr [rbp + 0x2c8], rax
0x145863d9f: movups xmm0, xmmword ptr [rcx]
0x145863da2: movups xmmword ptr [rbp + 0x2b8], xmm0
0x145863da9: lea rax, [rip + 0x17c7652]
0x145863db0: mov qword ptr [rbp + 0x298], rax
0x145863db7: mov qword ptr [rbp + 0x2a0], 0xa
0x145863dc2: mov qword ptr [rbp + 0x2a8], rsi
0x145863dc9: mov qword ptr [rbp + 0x2b0], rdx
0x145863dd0: mov qword ptr [rbp + 0x80], 0
0x145863ddb: mov qword ptr [rbp + 0x88], 8
0x145863de6: mov qword ptr [rbp + 0x90], 0
0x145863df1: mov rsi, qword ptr [rbp + 0x308]
0x145863df8: movzx eax, byte ptr [rsi + 0x75]
0x145863dfc: cmp eax, 9
0x145863dff: movzx ebx, byte ptr [rbp + 0x290]
0x145863e06: je 0x145863ff8
0x145863e0c: movss xmm0, dword ptr [rsi + 0x44]
0x145863e11: xorps xmm1, xmm1
0x145863e14: ucomiss xmm0, xmm1
0x145863e17: jbe 0x145863ff8
0x145863e1d: cmp eax, 9
0x145863e20: je 0x145863ff8
0x145863e26: cmp eax, 6
0x145863e29: je 0x145863ff8
0x145863e2f: lea rsi, [rip + 0x17c79d1]
0x145863e36: mov edi, 0x26
0x145863e3b: mov edx, 0x26
0x145863e40: mov rcx, rsi
0x145863e43: call 0x1458dff90
0x145863e48: nop
0x145863e49: mov r15, rdx
0x145863e4c: test rax, rax
0x145863e4f: cmovne rsi, rax
0x145863e53: cmove r15, rdi
0x145863e57: mov rax, qword ptr [rbp + 0x2e8]
0x145863e5e: movss xmm0, dword ptr [rax + 0xc]
0x145863e63: mulss xmm0, dword ptr [rip + 0x67c555]
0x145863e6b: movss dword ptr [rbp + 0x1d0], xmm0
0x145863e73: lea rax, [rbp + 0x1d0]
0x145863e7a: mov qword ptr [rbp + 0xe0], rax
0x145863e81: lea rbx, [rip + 0x494278]
0x145863e88: mov qword ptr [rbp + 0xe8], rbx
0x145863e8f: lea rdx, [rip + 0x17c74df]
0x145863e96: lea rdi, [rbp + 0x2d0]
0x145863e9d: lea r8, [rbp + 0xe0]
0x145863ea4: mov rcx, rdi
0x145863ea7: call 0x145ce7350
0x145863eac: nop
0x145863ead: mov rax, qword ptr [rbp + 0x2e8]
0x145863eb4: movss xmm0, dword ptr [rax + 0x10]
0x145863eb9: mulss xmm0, dword ptr [rip + 0x67c4ff]
0x145863ec1: movss dword ptr [rbp - 0x10], xmm0
0x145863ec6: lea rax, [rbp - 0x10]
0x145863eca: mov qword ptr [rbp + 0xe0], rax
0x145863ed1: mov qword ptr [rbp + 0xe8], rbx
0x145863ed8: lea rdx, [rip + 0x17c7496]
0x145863edf: lea rbx, [rbp + 0x1d0]
0x145863ee6: lea r8, [rbp + 0xe0]
0x145863eed: mov rcx, rbx
0x145863ef0: call 0x145ce7350
0x145863ef5: nop
0x145863ef6: lea rax, [rip + 0x17c6c43]
0x145863efd: mov qword ptr [rbp + 0xe0], rax
0x145863f04: mov qword ptr [rbp + 0xe8], 1
0x145863f0f: mov qword ptr [rbp + 0xf0], rdi
0x145863f16: lea rax, [rip + 0x17a8c53]
0x145863f1d: mov qword ptr [rbp + 0xf8], rax
0x145863f24: lea rcx, [rip + 0x17c7902]
0x145863f2b: mov qword ptr [rbp + 0x100], rcx
0x145863f32: mov qword ptr [rbp + 0x108], 4
0x145863f3d: mov qword ptr [rbp + 0x110], rbx
0x145863f44: mov qword ptr [rbp + 0x118], rax
0x145863f4b: mov qword ptr [rsp + 0x20], 2
0x145863f54: lea rcx, [rbp - 0x10]
0x145863f58: lea r9, [rbp + 0xe0]
0x145863f5f: mov rdx, rsi
0x145863f62: mov r8, r15
0x145863f65: call 0x1458e0370
0x145863f6a: nop
0x145863f6b: mov rsi, qword ptr [rbp + 0x90]
0x145863f72: cmp rsi, qword ptr [rbp + 0x80]
0x145863f79: jne 0x145863f88
0x145863f7b: lea rcx, [rbp + 0x80]
0x145863f82: call 0x145d14e50
0x145863f87: nop
0x145863f88: mov rax, qword ptr [rbp + 0x88]
0x145863f8f: lea rcx, [rsi + rsi*2]
0x145863f93: mov rdx, qword ptr [rbp]
0x145863f97: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145863f9c: movups xmm0, xmmword ptr [rbp - 0x10]
0x145863fa0: movups xmmword ptr [rax + rcx*8], xmm0
0x145863fa4: inc rsi
0x145863fa7: mov qword ptr [rbp + 0x90], rsi
0x145863fae: mov rdx, qword ptr [rbp + 0x1d0]
0x145863fb5: test rdx, rdx
0x145863fb8: mov rsi, qword ptr [rbp + 0x308]
0x145863fbf: movzx ebx, byte ptr [rbp + 0x290]
0x145863fc6: je 0x145863fda
0x145863fc8: mov rcx, qword ptr [rbp + 0x1d8]
0x145863fcf: mov r8d, 1
0x145863fd5: call 0x1400021d0
0x145863fda: mov rdx, qword ptr [rbp + 0x2d0]
0x145863fe1: test rdx, rdx
0x145863fe4: je 0x145863ff8
0x145863fe6: mov rcx, qword ptr [rbp + 0x2d8]
0x145863fed: mov r8d, 1
0x145863ff3: call 0x1400021d0
0x145863ff8: cmp bl, 2
0x145863ffb: je 0x145864420
0x145864001: mov rax, qword ptr [rbp + 0x2e8]
0x145864008: movss xmm7, dword ptr [rax + 0x38]
0x14586400d: ucomiss xmm7, dword ptr [rip + 0x879cd4]
0x145864014: jbe 0x145864420
0x14586401a: cmp byte ptr [rsi + 0x75], 0xb
0x14586401e: je 0x145864420
0x145864024: movaps xmm0, xmm7
0x145864027: call 0x145d14697
0x14586402c: cvttss2si rax, xmm0
0x145864031: xor ecx, ecx
0x145864033: xorps xmm1, xmm1
0x145864036: ucomiss xmm0, xmm1
0x145864039: cmovae ecx, eax
0x14586403c: ucomiss xmm0, dword ptr [rip + 0x69cb71]
0x145864043: mov r12d, 0xffffffff
0x145864049: cmovbe r12d, ecx
0x14586404d: movaps xmm0, xmm7
0x145864050: call 0x145d14661
0x145864055: subss xmm7, xmm0
0x145864059: test r12d, r12d
0x14586405c: je 0x14586423e
0x145864062: lea r14d, [r12 + 1]
0x145864067: ucomiss xmm7, dword ptr [rip + 0x879c7a]
0x14586406e: jbe 0x14586432a
0x145864074: lea rsi, [rip + 0x17c77e1]
0x14586407b: mov edi, 0x29
0x145864080: mov edx, 0x29
0x145864085: mov rcx, rsi
0x145864088: call 0x1458dff90
0x14586408d: nop
0x14586408e: mov r15, rdx
0x145864091: test rax, rax
0x145864094: cmovne rsi, rax
0x145864098: cmove r15, rdi
0x14586409c: lea r13, [rbp - 0x10]
0x1458640a0: mov rcx, r13
0x1458640a3: mov edx, r14d
0x1458640a6: call 0x14586a730
0x1458640ab: nop
0x1458640ac: mulss xmm7, dword ptr [rip + 0x67c30c]
0x1458640b4: movss dword ptr [rbp + 0x1d0], xmm7
0x1458640bc: lea rax, [rbp + 0x1d0]
0x1458640c3: mov qword ptr [rbp + 0xe0], rax
0x1458640ca: lea rax, [rip + 0x49402f]
0x1458640d1: mov qword ptr [rbp + 0xe8], rax
0x1458640d8: lea rdx, [rip + 0x17c7296]
0x1458640df: lea rdi, [rbp + 0x2d0]
0x1458640e6: lea r8, [rbp + 0xe0]
0x1458640ed: mov rcx, rdi
0x1458640f0: call 0x145ce7350
0x1458640f5: nop
0x1458640f6: add r12d, 2
0x1458640fa: lea rbx, [rbp + 0x1d0]
0x145864101: mov rcx, rbx
0x145864104: mov edx, r12d
0x145864107: call 0x14586a730
0x14586410c: nop
0x14586410d: lea rax, [rip + 0x17c7743]
0x145864114: mov qword ptr [rbp + 0xe0], rax
0x14586411b: mov qword ptr [rbp + 0xe8], 5
0x145864126: mov qword ptr [rbp + 0xf0], r13
0x14586412d: lea rax, [rip + 0x17a8a3c]
0x145864134: mov qword ptr [rbp + 0xf8], rax
0x14586413b: lea rcx, [rip + 0x17c69fe]
0x145864142: mov qword ptr [rbp + 0x100], rcx
0x145864149: mov qword ptr [rbp + 0x108], 1
0x145864154: mov qword ptr [rbp + 0x110], rdi
0x14586415b: mov qword ptr [rbp + 0x118], rax
0x145864162: lea rcx, [rip + 0x17c771c]
0x145864169: mov qword ptr [rbp + 0x120], rcx
0x145864170: mov qword ptr [rbp + 0x128], 4
0x14586417b: mov qword ptr [rbp + 0x130], rbx
0x145864182: mov qword ptr [rbp + 0x138], rax
0x145864189: mov qword ptr [rsp + 0x20], 3
0x145864192: lea rcx, [rbp - 0x58]
0x145864196: lea r9, [rbp + 0xe0]
0x14586419d: mov rdx, rsi
0x1458641a0: mov r8, r15
0x1458641a3: call 0x1458e0370
0x1458641a8: nop
0x1458641a9: mov rsi, qword ptr [rbp + 0x90]
0x1458641b0: cmp rsi, qword ptr [rbp + 0x80]
0x1458641b7: jne 0x1458641c6
0x1458641b9: lea rcx, [rbp + 0x80]
0x1458641c0: call 0x145d14e50
0x1458641c5: nop
0x1458641c6: mov rax, qword ptr [rbp + 0x88]
0x1458641cd: lea rcx, [rsi + rsi*2]
0x1458641d1: mov rdx, qword ptr [rbp - 0x48]
0x1458641d5: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1458641da: movups xmm0, xmmword ptr [rbp - 0x58]
0x1458641de: movups xmmword ptr [rax + rcx*8], xmm0
0x1458641e2: inc rsi
0x1458641e5: mov qword ptr [rbp + 0x90], rsi
0x1458641ec: mov rdx, qword ptr [rbp + 0x1d0]
0x1458641f3: test rdx, rdx
0x1458641f6: je 0x14586420a
0x1458641f8: mov rcx, qword ptr [rbp + 0x1d8]
0x1458641ff: mov r8d, 1
0x145864205: call 0x1400021d0
0x14586420a: mov rdx, qword ptr [rbp + 0x2d0]
0x145864211: test rdx, rdx
0x145864214: je 0x145864228
0x145864216: mov rcx, qword ptr [rbp + 0x2d8]
0x14586421d: mov r8d, 1
0x145864223: call 0x1400021d0
0x145864228: mov rdx, qword ptr [rbp - 0x10]
0x14586422c: test rdx, rdx
0x14586422f: je 0x145864420
0x145864235: mov rcx, qword ptr [rbp - 8]
0x145864239: jmp 0x145864415
0x14586423e: lea rsi, [rip + 0x17c75ec]
0x145864245: mov edx, 0x19
0x14586424a: mov rcx, rsi
0x14586424d: call 0x1458dff90
0x145864252: nop
0x145864253: mov rdi, rax
0x145864256: mov r14, rdx
0x145864259: mulss xmm7, dword ptr [rip + 0x67c15f]
0x145864261: movss dword ptr [rbp + 0x2d0], xmm7
0x145864269: lea rax, [rbp + 0x2d0]
0x145864270: mov qword ptr [rbp + 0xe0], rax
0x145864277: lea rax, [rip + 0x493e82]
0x14586427e: mov qword ptr [rbp + 0xe8], rax
0x145864285: lea rdx, [rip + 0x17c70e9]
0x14586428c: lea rbx, [rbp + 0x1d0]
0x145864293: lea r8, [rbp + 0xe0]
0x14586429a: mov rcx, rbx
0x14586429d: call 0x145ce7350
0x1458642a2: nop
0x1458642a3: test rdi, rdi
0x1458642a6: mov eax, 0x19
0x1458642ab: cmove r14, rax
0x1458642af: cmovne rsi, rdi
0x1458642b3: lea rax, [rip + 0x17c6886]
0x1458642ba: mov qword ptr [rbp + 0xe0], rax
0x1458642c1: mov qword ptr [rbp + 0xe8], 1
0x1458642cc: mov qword ptr [rbp + 0xf0], rbx
0x1458642d3: lea rax, [rip + 0x17a8896]
0x1458642da: mov qword ptr [rbp + 0xf8], rax
0x1458642e1: mov qword ptr [rsp + 0x20], 1
0x1458642ea: lea rcx, [rbp + 0x2d0]
0x1458642f1: lea r9, [rbp + 0xe0]
0x1458642f8: mov rdx, rsi
0x1458642fb: mov r8, r14
0x1458642fe: call 0x1458e0370
0x145864303: nop
0x145864304: mov rsi, qword ptr [rbp + 0x90]
0x14586430b: cmp rsi, qword ptr [rbp + 0x80]
0x145864312: jne 0x1458643d6
0x145864318: lea rcx, [rbp + 0x80]
0x14586431f: call 0x145d14e50
0x145864324: nop
0x145864325: jmp 0x1458643d6
0x14586432a: lea rsi, [rip + 0x17c7519]
0x145864331: mov edx, 0xd
0x145864336: mov rcx, rsi
0x145864339: call 0x1458dff90
0x14586433e: nop
0x14586433f: mov rdi, rax
0x145864342: mov r15, rdx
0x145864345: lea rbx, [rbp + 0x1d0]
0x14586434c: mov rcx, rbx
0x14586434f: mov edx, r14d
0x145864352: call 0x14586a730
0x145864357: nop
0x145864358: test rdi, rdi
0x14586435b: mov eax, 0xd
0x145864360: cmove r15, rax
0x145864364: cmovne rsi, rdi
0x145864368: lea rax, [rip + 0x17c74e8]
0x14586436f: mov qword ptr [rbp + 0xe0], rax
0x145864376: mov qword ptr [rbp + 0xe8], 5
0x145864381: mov qword ptr [rbp + 0xf0], rbx
0x145864388: lea rax, [rip + 0x17a87e1]
0x14586438f: mov qword ptr [rbp + 0xf8], rax
0x145864396: mov qword ptr [rsp + 0x20], 1
0x14586439f: lea rcx, [rbp + 0x2d0]
0x1458643a6: lea r9, [rbp + 0xe0]
0x1458643ad: mov rdx, rsi
0x1458643b0: mov r8, r15
0x1458643b3: call 0x1458e0370
0x1458643b8: nop
0x1458643b9: mov rsi, qword ptr [rbp + 0x90]
0x1458643c0: cmp rsi, qword ptr [rbp + 0x80]
0x1458643c7: jne 0x1458643d6
0x1458643c9: lea rcx, [rbp + 0x80]
0x1458643d0: call 0x145d14e50
0x1458643d5: nop
0x1458643d6: mov rax, qword ptr [rbp + 0x88]
0x1458643dd: lea rcx, [rsi + rsi*2]
0x1458643e1: mov rdx, qword ptr [rbp + 0x2e0]
0x1458643e8: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1458643ed: movups xmm0, xmmword ptr [rbp + 0x2d0]
0x1458643f4: movups xmmword ptr [rax + rcx*8], xmm0
0x1458643f8: inc rsi
0x1458643fb: mov qword ptr [rbp + 0x90], rsi
0x145864402: mov rdx, qword ptr [rbp + 0x1d0]
0x145864409: test rdx, rdx
0x14586440c: je 0x145864420
0x14586440e: mov rcx, qword ptr [rbp + 0x1d8]
0x145864415: mov r8d, 1
0x14586441b: call 0x1400021d0
0x145864420: mov rax, qword ptr [rbp + 0x90]
0x145864427: mov qword ptr [rbp + 0x1c8], rax
0x14586442e: movups xmm0, xmmword ptr [rbp + 0x80]
0x145864435: movups xmmword ptr [rbp + 0x1b8], xmm0
0x14586443c: movups xmm0, xmmword ptr [rbp + 0x40]
0x145864440: movups xmm1, xmmword ptr [rbp + 0x50]
0x145864444: movups xmm2, xmmword ptr [rbp + 0x60]
0x145864448: movaps xmmword ptr [rbp + 0x1d0], xmm0
0x14586444f: movaps xmmword ptr [rbp + 0x1e0], xmm1
0x145864456: movaps xmmword ptr [rbp + 0x1f0], xmm2
0x14586445d: mov rax, qword ptr [rbp + 0x70]
0x145864461: mov qword ptr [rbp + 0x200], rax
0x145864468: movups xmm0, xmmword ptr [rbp + 0x98]
0x14586446f: movups xmm1, xmmword ptr [rbp + 0xa8]
0x145864476: movups xmm2, xmmword ptr [rbp + 0xb8]
0x14586447d: movups xmmword ptr [rbp + 0x208], xmm0
0x145864484: movups xmmword ptr [rbp + 0x218], xmm1
0x14586448b: movups xmmword ptr [rbp + 0x228], xmm2
0x145864492: mov rax, qword ptr [rbp + 0xc8]
0x145864499: mov qword ptr [rbp + 0x238], rax
0x1458644a0: mov rax, qword ptr [rbp + 0x2c8]
0x1458644a7: mov qword ptr [rbp + 0x270], rax
0x1458644ae: movups xmm0, xmmword ptr [rbp + 0x298]
0x1458644b5: movups xmm1, xmmword ptr [rbp + 0x2a8]
0x1458644bc: movups xmm2, xmmword ptr [rbp + 0x2b8]
0x1458644c3: movaps xmmword ptr [rbp + 0x260], xmm2
0x1458644ca: movaps xmmword ptr [rbp + 0x250], xmm1
0x1458644d1: movaps xmmword ptr [rbp + 0x240], xmm0
0x1458644d8: lea rcx, [rbp + 0xf0]
0x1458644df: lea rsi, [rbp + 0x1d0]
0x1458644e6: mov r8d, 0xa8
0x1458644ec: mov rdx, rsi
0x1458644ef: call 0x145d145fb
0x1458644f4: mov qword ptr [rbp + 0xe0], 0
0x1458644ff: mov qword ptr [rbp + 0xe8], 4
0x14586450a: lea rax, [rip + 0x17c6ec6]
0x145864511: mov qword ptr [rbp + 0x198], rax
0x145864518: mov qword ptr [rbp + 0x1a0], 0xa
0x145864523: mov qword ptr [rbp + 0x1a8], 1
0x14586452e: mov qword ptr [rbp + 0x1b0], 0
0x145864539: mov byte ptr [rbp + 0x325], 1
0x145864540: mov byte ptr [rbp + 0x324], 0
0x145864547: lea rcx, [rbp + 0x2d0]
0x14586454e: lea rdx, [rbp + 0xe0]
0x145864555: call 0x1459c1b00
0x14586455a: nop
0x14586455b: mov r8, qword ptr [rbp + 0x2e0]
0x145864562: test r8, r8
0x145864565: mov r12, qword ptr [rbp + 0x308]
0x14586456c: movzx r15d, byte ptr [rbp + 0x290]
0x145864574: je 0x14586468c
0x14586457a: mov rdx, qword ptr [rbp + 0x2d8]
0x145864581: mov byte ptr [rbp + 0x327], 1
0x145864588: mov qword ptr [rsp + 0x20], 1
0x145864591: lea r9, [rip + 0x17c6e74]
0x145864598: lea rcx, [rbp + 0xe0]
0x14586459f: call 0x1458c01f0
0x1458645a4: nop
0x1458645a5: mov rax, qword ptr [rbp + 0xf0]
0x1458645ac: mov qword ptr [rbp + 0x1e0], rax
0x1458645b3: movups xmm0, xmmword ptr [rbp + 0xe0]
0x1458645ba: movaps xmmword ptr [rbp + 0x1d0], xmm0
0x1458645c1: mov qword ptr [rbp + 0x298], rsi
0x1458645c8: lea rax, [rip - 0x58624ef]
0x1458645cf: mov qword ptr [rbp + 0x2a0], rax
0x1458645d6: lea rdx, [rip + 0x17c6e30]
0x1458645dd: lea rcx, [rbp + 0xe0]
0x1458645e4: lea r8, [rbp + 0x298]
0x1458645eb: call 0x145ce7350
0x1458645f0: nop
0x1458645f1: mov rdx, qword ptr [rbp + 0x1d0]
0x1458645f8: test rdx, rdx
0x1458645fb: je 0x14586460f
0x1458645fd: mov rcx, qword ptr [rbp + 0x1d8]
0x145864604: mov r8d, 1
0x14586460a: call 0x1400021d0
0x14586460f: mov rdi, qword ptr [rbp + 0xe0]
0x145864616: mov rbx, qword ptr [rbp + 0xe8]
0x14586461d: mov rsi, qword ptr [rbp + 0xf0]
0x145864624: mov rax, qword ptr [rbp + 0x278]
0x14586462b: mov r14, qword ptr [rbp + 0x288]
0x145864632: sub rax, r14
0x145864635: cmp rsi, rax
0x145864638: ja 0x14586656c
0x14586463e: test rsi, rsi
0x145864641: je 0x145864658
0x145864643: mov rcx, qword ptr [rbp + 0x280]
0x14586464a: add rcx, r14
0x14586464d: mov rdx, rbx
0x145864650: mov r8, rsi
0x145864653: call 0x145d145fb
0x145864658: add r14, rsi
0x14586465b: mov qword ptr [rbp + 0x288], r14
0x145864662: test rdi, rdi
0x145864665: je 0x14586468c
0x145864667: mov r8d, 1
0x14586466d: mov rcx, rbx
0x145864670: mov rdx, rdi
0x145864673: call 0x1400021d0
0x145864678: movzx eax, r15b
0x14586467c: lea rcx, [rip + 0x17c7dd9]
0x145864683: movsxd rax, dword ptr [rcx + rax*4]
0x145864687: add rax, rcx
0x14586468a: jmp rax
0x14586468c: movzx eax, r15b
0x145864690: lea rcx, [rip + 0x17c7dc5]
0x145864697: movsxd rax, dword ptr [rcx + rax*4]
0x14586469b: add rax, rcx
0x14586469e: jmp rax
0x1458646a0: mov byte ptr [rbp + 0x327], 1
0x1458646a7: lea rsi, [rip + 0x17c6d64]
0x1458646ae: mov edi, 0x29
0x1458646b3: mov edx, 0x29
0x1458646b8: mov rcx, rsi
0x1458646bb: call 0x1458dff90
0x1458646c0: nop
0x1458646c1: test rax, rax
0x1458646c4: cmovne rsi, rax
0x1458646c8: cmove rdx, rdi
0x1458646cc: mov qword ptr [rbp + 0x298], rsi
0x1458646d3: mov qword ptr [rbp + 0x2a0], rdx
0x1458646da: lea rax, [rip + 0x17c6d67]
0x1458646e1: mov qword ptr [rbp + 0xe0], rax
0x1458646e8: lea rax, [rip - 0x586262f]
0x1458646ef: mov qword ptr [rbp + 0xe8], rax
0x1458646f6: lea rcx, [rbp + 0x298]
0x1458646fd: mov qword ptr [rbp + 0xf0], rcx
0x145864704: mov qword ptr [rbp + 0xf8], rax
0x14586470b: lea rcx, [rip + 0x17c6d4e]
0x145864712: mov qword ptr [rbp + 0x100], rcx
0x145864719: mov qword ptr [rbp + 0x108], rax
0x145864720: mov byte ptr [rbp + 0x327], 1
0x145864727: lea rdx, [rip + 0x17c6d42]
0x14586472e: lea rcx, [rbp + 0x1d0]
0x145864735: lea r8, [rbp + 0xe0]
0x14586473c: call 0x145ce7350
0x145864741: nop
0x145864742: mov rdi, qword ptr [rbp + 0x1d0]
0x145864749: mov rbx, qword ptr [rbp + 0x1d8]
0x145864750: mov rsi, qword ptr [rbp + 0x1e0]
0x145864757: mov rax, qword ptr [rbp + 0x278]
0x14586475e: mov r14, qword ptr [rbp + 0x288]
0x145864765: sub rax, r14
0x145864768: cmp rsi, rax
0x14586476b: jbe 0x14586497d
0x145864771: mov qword ptr [rbp + 0x2f8], rbx
0x145864778: mov qword ptr [rbp + 0x310], rdi
0x14586477f: mov qword ptr [rsp + 0x20], 1
0x145864788: lea rcx, [rbp + 0x278]
0x14586478f: mov r9d, 1
0x145864795: mov rdx, r14
0x145864798: mov r8, rsi
0x14586479b: call 0x145d14a10
0x1458647a0: nop
0x1458647a1: jmp 0x1458665e6
0x1458647a6: mov byte ptr [rbp + 0x327], 1
0x1458647ad: lea rsi, [rip + 0x17c6cc3]
0x1458647b4: mov edi, 0x19
0x1458647b9: mov edx, 0x19
0x1458647be: mov rcx, rsi
0x1458647c1: call 0x1458dff90
0x1458647c6: nop
0x1458647c7: test rax, rax
0x1458647ca: cmovne rsi, rax
0x1458647ce: cmove rdx, rdi
0x1458647d2: mov qword ptr [rbp + 0x298], rsi
0x1458647d9: mov qword ptr [rbp + 0x2a0], rdx
0x1458647e0: lea rax, [rip + 0x17c6c61]
0x1458647e7: mov qword ptr [rbp + 0xe0], rax
0x1458647ee: lea rax, [rip - 0x5862735]
0x1458647f5: mov qword ptr [rbp + 0xe8], rax
0x1458647fc: lea rcx, [rbp + 0x298]
0x145864803: mov qword ptr [rbp + 0xf0], rcx
0x14586480a: mov qword ptr [rbp + 0xf8], rax
0x145864811: lea rcx, [rip + 0x17c6c48]
0x145864818: mov qword ptr [rbp + 0x100], rcx
0x14586481f: mov qword ptr [rbp + 0x108], rax
0x145864826: mov byte ptr [rbp + 0x327], 1
0x14586482d: lea rdx, [rip + 0x17c6c3c]
0x145864834: lea rcx, [rbp + 0x1d0]
0x14586483b: lea r8, [rbp + 0xe0]
0x145864842: call 0x145ce7350
0x145864847: nop
0x145864848: mov rdi, qword ptr [rbp + 0x1d0]
0x14586484f: mov rbx, qword ptr [rbp + 0x1d8]
0x145864856: mov rsi, qword ptr [rbp + 0x1e0]
0x14586485d: mov rax, qword ptr [rbp + 0x278]
0x145864864: mov r14, qword ptr [rbp + 0x288]
0x14586486b: sub rax, r14
0x14586486e: cmp rsi, rax
0x145864871: jbe 0x14586497d
0x145864877: mov qword ptr [rbp + 0x2f8], rbx
0x14586487e: mov qword ptr [rbp + 0x310], rdi
0x145864885: mov qword ptr [rsp + 0x20], 1
0x14586488e: lea rcx, [rbp + 0x278]
0x145864895: mov r9d, 1
0x14586489b: mov rdx, r14
0x14586489e: mov r8, rsi
0x1458648a1: call 0x145d14a10
0x1458648a6: nop
0x1458648a7: jmp 0x1458665e6
0x1458648ac: mov byte ptr [rbp + 0x327], 1
0x1458648b3: lea rsi, [rip + 0x17c6bd6]
0x1458648ba: mov edi, 0x1d
0x1458648bf: mov edx, 0x1d
0x1458648c4: mov rcx, rsi
0x1458648c7: call 0x1458dff90
0x1458648cc: nop
0x1458648cd: test rax, rax
0x1458648d0: cmovne rsi, rax
0x1458648d4: cmove rdx, rdi
0x1458648d8: mov qword ptr [rbp + 0x298], rsi
0x1458648df: mov qword ptr [rbp + 0x2a0], rdx
0x1458648e6: lea rax, [rip + 0x17c6b5b]
0x1458648ed: mov qword ptr [rbp + 0xe0], rax
0x1458648f4: lea rax, [rip - 0x586283b]
0x1458648fb: mov qword ptr [rbp + 0xe8], rax
0x145864902: lea rcx, [rbp + 0x298]
0x145864909: mov qword ptr [rbp + 0xf0], rcx
0x145864910: mov qword ptr [rbp + 0xf8], rax
0x145864917: lea rcx, [rip + 0x17c6b42]
0x14586491e: mov qword ptr [rbp + 0x100], rcx
0x145864925: mov qword ptr [rbp + 0x108], rax
0x14586492c: mov byte ptr [rbp + 0x327], 1
0x145864933: lea rdx, [rip + 0x17c6b36]
0x14586493a: lea rcx, [rbp + 0x1d0]
0x145864941: lea r8, [rbp + 0xe0]
0x145864948: call 0x145ce7350
0x14586494d: nop
0x14586494e: mov rdi, qword ptr [rbp + 0x1d0]
0x145864955: mov rbx, qword ptr [rbp + 0x1d8]
0x14586495c: mov rsi, qword ptr [rbp + 0x1e0]
0x145864963: mov rax, qword ptr [rbp + 0x278]
0x14586496a: mov r14, qword ptr [rbp + 0x288]
0x145864971: sub rax, r14
0x145864974: cmp rsi, rax
0x145864977: ja 0x1458665b6
0x14586497d: test rsi, rsi
0x145864980: je 0x145864997
0x145864982: mov rcx, qword ptr [rbp + 0x280]
0x145864989: add rcx, r14
0x14586498c: mov rdx, rbx
0x14586498f: mov r8, rsi
0x145864992: call 0x145d145fb
0x145864997: add r14, rsi
0x14586499a: mov qword ptr [rbp + 0x288], r14
0x1458649a1: test rdi, rdi
0x1458649a4: je 0x1458649b7
0x1458649a6: mov r8d, 1
0x1458649ac: mov rcx, rbx
0x1458649af: mov rdx, rdi
0x1458649b2: call 0x1400021d0
0x1458649b7: mov r13d, dword ptr [r12 + 0x40]
0x1458649bc: mov qword ptr [rbp + 0x1d0], r12
0x1458649c3: lea rax, [rip - 0x586290a]
0x1458649ca: mov qword ptr [rbp + 0x1d8], rax
0x1458649d1: mov byte ptr [rbp + 0x327], 1
0x1458649d8: lea rdx, [rip + 0x14504a1]
0x1458649df: lea rcx, [rbp + 0xe0]
0x1458649e6: lea r8, [rbp + 0x1d0]
0x1458649ed: call 0x145ce7350
0x1458649f2: nop
0x1458649f3: mov rcx, qword ptr [rbp + 0xe8]
0x1458649fa: mov rdx, qword ptr [rbp + 0xf0]
0x145864a01: mov rsi, qword ptr [r12 + 0x10]
0x145864a06: mov rbx, qword ptr [r12 + 0x18]
0x145864a0b: mov qword ptr [rbp + 0x310], rcx
0x145864a12: call 0x1458dff90
0x145864a17: nop
0x145864a18: mov rdi, rax
0x145864a1b: mov r14, rdx
0x145864a1e: mov rdx, qword ptr [rbp + 0xe0]
0x145864a25: test rdx, rdx
0x145864a28: je 0x145864a3c
0x145864a2a: mov r8d, 1
0x145864a30: mov rcx, qword ptr [rbp + 0x310]
0x145864a37: call 0x1400021d0
0x145864a3c: test rdi, rdi
0x145864a3f: cmovne rsi, rdi
0x145864a43: cmove r14, rbx
0x145864a47: test r14, r14
0x145864a4a: jns 0x145864a66
0x145864a4c: xor edi, edi
0x145864a4e: mov byte ptr [rbp + 0x327], 1
0x145864a55: mov rcx, rdi
0x145864a58: mov rdx, r14
0x145864a5b: call 0x145eb6fcb
0x145864a60: nop
0x145864a61: jmp 0x14586664c
0x145864a66: mov qword ptr [rbp + 0x310], r14
0x145864a6d: je 0x145864ab1
0x145864a6f: call 0x140002200
0x145864a74: mov edi, 1
0x145864a79: mov edx, 1
0x145864a7e: mov rcx, r14
0x145864a81: call 0x1400021c0
0x145864a86: test rax, rax
0x145864a89: je 0x145864a4e
0x145864a8b: mov qword ptr [rbp + 8], rax
0x145864a8f: mov rcx, rax
0x145864a92: mov rdx, rsi
0x145864a95: mov r8, r14
0x145864a98: call 0x145d145fb
0x145864a9d: movzx eax, r15b
0x145864aa1: lea rcx, [rip + 0x17c79c4]
0x145864aa8: movsxd rax, dword ptr [rcx + rax*4]
0x145864aac: add rax, rcx
0x145864aaf: jmp rax
0x145864ab1: mov eax, 1
0x145864ab6: mov qword ptr [rbp + 8], rax
0x145864aba: movzx eax, r15b
0x145864abe: lea rcx, [rip + 0x17c79a7]
0x145864ac5: movsxd rax, dword ptr [rcx + rax*4]
0x145864ac9: add rax, rcx
0x145864acc: jmp rax
0x145864ace: mov byte ptr [rbp + 0x323], 1
0x145864ad5: lea rsi, [rip + 0x17c69d1]
0x145864adc: mov edi, 8
0x145864ae1: mov edx, 8
0x145864ae6: mov rcx, rsi
0x145864ae9: call 0x1458dff90
0x145864aee: nop
0x145864aef: mov r8, rdx
0x145864af2: test rax, rax
0x145864af5: cmovne rsi, rax
0x145864af9: cmove r8, rdi
0x145864afd: mov rax, qword ptr [rbp + 0x2f0]
0x145864b04: lea rax, [rax + 8]
0x145864b08: lea rcx, [rip + 0x17a8081]
0x145864b0f: mov qword ptr [rbp + 0xe0], rcx
0x145864b16: mov qword ptr [rbp + 0xe8], 1
0x145864b21: mov qword ptr [rbp + 0xf0], rax
0x145864b28: lea rax, [rip + 0x17a80e9]
0x145864b2f: mov qword ptr [rbp + 0xf8], rax
0x145864b36: mov byte ptr [rbp + 0x323], 1
0x145864b3d: mov qword ptr [rsp + 0x20], 1
0x145864b46: lea rcx, [rbp + 0x1d0]
0x145864b4d: lea r9, [rbp + 0xe0]
0x145864b54: mov rdx, rsi
0x145864b57: call 0x1458e0370
0x145864b5c: nop
0x145864b5d: mov rax, qword ptr [rbp + 0x1d0]
0x145864b64: mov qword ptr [rbp + 0xd0], rax
0x145864b6b: mov rax, qword ptr [rbp + 0x1d8]
0x145864b72: mov qword ptr [rbp + 0xd8], rax
0x145864b79: mov r14, qword ptr [rbp + 0x1e0]
0x145864b80: movzx eax, byte ptr [r12 + 0x75]
0x145864b86: add eax, -2
0x145864b89: cmp eax, 9
0x145864b8c: jbe 0x145864d29
0x145864b92: jmp 0x14586515f
0x145864b97: mov byte ptr [rbp + 0x323], 1
0x145864b9e: lea rsi, [rip + 0x17c691b]
0x145864ba5: mov edi, 6
0x145864baa: mov edx, 6
0x145864baf: mov rcx, rsi
0x145864bb2: call 0x1458dff90
0x145864bb7: nop
0x145864bb8: mov r14, rdx
0x145864bbb: test rax, rax
0x145864bbe: cmovne rsi, rax
0x145864bc2: cmove r14, rdi
0x145864bc6: test r14, r14
0x145864bc9: jns 0x145864c89
0x145864bcf: xor edi, edi
0x145864bd1: mov byte ptr [rbp + 0x323], 1
0x145864bd8: mov rcx, rdi
0x145864bdb: mov rdx, r14
0x145864bde: call 0x145eb6fcb
0x145864be3: nop
0x145864be4: jmp 0x14586664c
0x145864be9: mov byte ptr [rbp + 0x323], 1
0x145864bf0: lea rsi, [rip + 0x17c68cf]
0x145864bf7: mov edi, 6
0x145864bfc: mov edx, 6
0x145864c01: mov rcx, rsi
0x145864c04: call 0x1458dff90
0x145864c09: nop
0x145864c0a: mov r14, rdx
0x145864c0d: test rax, rax
0x145864c10: cmovne rsi, rax
0x145864c14: cmove r14, rdi
0x145864c18: test r14, r14
0x145864c1b: jns 0x145864cac
0x145864c21: xor edi, edi
0x145864c23: mov byte ptr [rbp + 0x323], 1
0x145864c2a: mov rcx, rdi
0x145864c2d: mov rdx, r14
0x145864c30: call 0x145eb6fcb
0x145864c35: nop
0x145864c36: jmp 0x14586664c
0x145864c3b: mov byte ptr [rbp + 0x323], 1
0x145864c42: lea rsi, [rip + 0x17c686c]
0x145864c49: mov edi, 0xb
0x145864c4e: mov edx, 0xb
0x145864c53: mov rcx, rsi
0x145864c56: call 0x1458dff90
0x145864c5b: nop
0x145864c5c: mov r14, rdx
0x145864c5f: test rax, rax
0x145864c62: cmovne rsi, rax
0x145864c66: cmove r14, rdi
0x145864c6a: test r14, r14
0x145864c6d: jns 0x145864ccf
0x145864c6f: xor edi, edi
0x145864c71: mov byte ptr [rbp + 0x323], 1
0x145864c78: mov rcx, rdi
0x145864c7b: mov rdx, r14
0x145864c7e: call 0x145eb6fcb
0x145864c83: nop
0x145864c84: jmp 0x14586664c
0x145864c89: je 0x145864d04
0x145864c8b: call 0x140002200
0x145864c90: mov edi, 1
0x145864c95: mov edx, 1
0x145864c9a: mov rcx, r14
0x145864c9d: call 0x1400021c0
0x145864ca2: test rax, rax
0x145864ca5: jne 0x145864ced
0x145864ca7: jmp 0x145864bd1
0x145864cac: je 0x145864d04
0x145864cae: call 0x140002200
0x145864cb3: mov edi, 1
0x145864cb8: mov edx, 1
0x145864cbd: mov rcx, r14
0x145864cc0: call 0x1400021c0
0x145864cc5: test rax, rax
0x145864cc8: jne 0x145864ced
0x145864cca: jmp 0x145864c23
0x145864ccf: je 0x145864d04
0x145864cd1: call 0x140002200
0x145864cd6: mov edi, 1
0x145864cdb: mov edx, 1
0x145864ce0: mov rcx, r14
0x145864ce3: call 0x1400021c0
0x145864ce8: test rax, rax
0x145864ceb: je 0x145864c71
0x145864ced: mov qword ptr [rbp + 0xd8], rax
0x145864cf4: mov rcx, rax
0x145864cf7: mov rdx, rsi
0x145864cfa: mov r8, r14
0x145864cfd: call 0x145d145fb
0x145864d02: jmp 0x145864d10
0x145864d04: mov eax, 1
0x145864d09: mov qword ptr [rbp + 0xd8], rax
0x145864d10: mov qword ptr [rbp + 0xd0], r14
0x145864d17: movzx eax, byte ptr [r12 + 0x75]
0x145864d1d: add eax, -2
0x145864d20: cmp eax, 9
0x145864d23: ja 0x14586515f
0x145864d29: mov rcx, qword ptr [rbp + 0x2e8]
0x145864d30: movss xmm7, dword ptr [rcx + 0x28]
0x145864d35: lea rcx, [rip + 0x17c7740]
0x145864d3c: movsxd rax, dword ptr [rcx + rax*4]
0x145864d40: add rax, rcx
0x145864d43: jmp rax
0x145864d45: xorps xmm0, xmm0
0x145864d48: ucomiss xmm0, dword ptr [r12 + 0x4c]
0x145864d4e: jb 0x14586515f
0x145864d54: movss xmm1, dword ptr [r12 + 0x50]
0x145864d5b: ucomiss xmm1, xmm0
0x145864d5e: jbe 0x14586515f
0x145864d64: mov byte ptr [rbp + 0x326], 1
0x145864d6b: lea rsi, [rip + 0x17c5d9e]
0x145864d72: mov edi, 0xd
0x145864d77: mov edx, 0xd
0x145864d7c: mov rcx, rsi
0x145864d7f: call 0x1458dff90
0x145864d84: nop
0x145864d85: mov r15, rdx
0x145864d88: test rax, rax
0x145864d8b: cmovne rsi, rax
0x145864d8f: cmove r15, rdi
0x145864d93: mov rax, qword ptr [rbp + 0x2f0]
0x145864d9a: mulss xmm11, dword ptr [rax + 0x44]
0x145864da0: mulss xmm11, dword ptr [r12 + 0x50]
0x145864da7: mulss xmm7, xmm11
0x145864dac: movss xmm0, dword ptr [rip + 0x92ff84]
0x145864db4: ucomiss xmm0, xmm7
0x145864db7: jae 0x145864de7
0x145864db9: addss xmm7, dword ptr [rip + 0x17a7b33]
0x145864dc1: movss xmm11, dword ptr [rip + 0x67b5c2]
0x145864dca: divss xmm7, xmm11
0x145864dcf: movaps xmm0, xmm7
0x145864dd2: call 0x145d1475d
0x145864dd7: movaps xmm7, xmm0
0x145864dda: mulss xmm7, xmm11
0x145864ddf: addss xmm7, dword ptr [rip + 0x92ff51]
0x145864de7: mov byte ptr [rbp + 0x326], 1
0x145864dee: lea rdi, [rbp + 0x1d0]
0x145864df5: mov rcx, rdi
0x145864df8: movaps xmm1, xmm7
0x145864dfb: call 0x1458627d0
0x145864e00: nop
0x145864e01: lea rax, [rip + 0x17a7d88]
0x145864e08: mov qword ptr [rbp + 0xe0], rax
0x145864e0f: mov qword ptr [rbp + 0xe8], 1
0x145864e1a: mov qword ptr [rbp + 0xf0], rdi
0x145864e21: lea rax, [rip + 0x17a7d48]
0x145864e28: mov qword ptr [rbp + 0xf8], rax
0x145864e2f: mov qword ptr [rsp + 0x20], 1
0x145864e38: lea rcx, [rbp + 0x298]
0x145864e3f: lea r9, [rbp + 0xe0]
0x145864e46: mov rdx, rsi
0x145864e49: mov r8, r15
0x145864e4c: call 0x1458e0370
0x145864e51: nop
0x145864e52: jmp 0x145865200
0x145864e57: movss xmm1, dword ptr [r12 + 0x50]
0x145864e5e: xorps xmm0, xmm0
0x145864e61: ucomiss xmm1, xmm0
0x145864e64: jbe 0x145865153
0x145864e6a: mov byte ptr [rbp + 0x326], 1
0x145864e71: lea rsi, [rip + 0x17c5c98]
0x145864e78: mov edi, 0xd
0x145864e7d: mov edx, 0xd
0x145864e82: mov rcx, rsi
0x145864e85: call 0x1458dff90
0x145864e8a: nop
0x145864e8b: mov r15, rdx
0x145864e8e: test rax, rax
0x145864e91: cmovne rsi, rax
0x145864e95: cmove r15, rdi
0x145864e99: mov rax, qword ptr [rbp + 0x2f0]
0x145864ea0: mulss xmm11, dword ptr [rax + 0x44]
0x145864ea6: mulss xmm11, dword ptr [r12 + 0x50]
0x145864ead: mulss xmm7, xmm11
0x145864eb2: movss xmm0, dword ptr [rip + 0x92fe7e]
0x145864eba: ucomiss xmm0, xmm7
0x145864ebd: jae 0x145864eed
0x145864ebf: addss xmm7, dword ptr [rip + 0x17a7a2d]
0x145864ec7: movss xmm11, dword ptr [rip + 0x67b4bc]
0x145864ed0: divss xmm7, xmm11
0x145864ed5: movaps xmm0, xmm7
0x145864ed8: call 0x145d1475d
0x145864edd: movaps xmm7, xmm0
0x145864ee0: mulss xmm7, xmm11
0x145864ee5: addss xmm7, dword ptr [rip + 0x92fe4b]
0x145864eed: mov byte ptr [rbp + 0x326], 1
0x145864ef4: lea rdi, [rbp + 0x1d0]
0x145864efb: mov rcx, rdi
0x145864efe: movaps xmm1, xmm7
0x145864f01: call 0x1458627d0
0x145864f06: nop
0x145864f07: lea rax, [rip + 0x17a7c82]
0x145864f0e: mov qword ptr [rbp + 0xe0], rax
0x145864f15: mov qword ptr [rbp + 0xe8], 1
0x145864f20: mov qword ptr [rbp + 0xf0], rdi
0x145864f27: lea rax, [rip + 0x17a7c42]
0x145864f2e: mov qword ptr [rbp + 0xf8], rax
0x145864f35: mov qword ptr [rsp + 0x20], 1
0x145864f3e: lea rcx, [rbp + 0x298]
0x145864f45: lea r9, [rbp + 0xe0]
0x145864f4c: mov rdx, rsi
0x145864f4f: mov r8, r15
0x145864f52: call 0x1458e0370
0x145864f57: nop
0x145864f58: jmp 0x145865200
0x145864f5d: mov qword ptr [rbp + 0x290], 0xffffffffffffffff
0x145864f68: jmp 0x145865299
0x145864f6d: mov byte ptr [rbp + 0x326], 1
0x145864f74: lea rsi, [rip + 0x17c5b95]
0x145864f7b: mov edi, 0xd
0x145864f80: mov edx, 0xd
0x145864f85: mov rcx, rsi
0x145864f88: call 0x1458dff90
0x145864f8d: nop
0x145864f8e: mov r15, rdx
0x145864f91: test rax, rax
0x145864f94: cmovne rsi, rax
0x145864f98: cmove r15, rdi
0x145864f9c: mov rax, qword ptr [rbp + 0x2f0]
0x145864fa3: mulss xmm11, dword ptr [rax + 0x44]
0x145864fa9: mulss xmm11, dword ptr [r12 + 0x50]
0x145864fb0: mulss xmm7, xmm11
0x145864fb5: movss xmm0, dword ptr [rip + 0x92fd7b]
0x145864fbd: ucomiss xmm0, xmm7
0x145864fc0: jae 0x145864ff0
0x145864fc2: addss xmm7, dword ptr [rip + 0x17a792a]
0x145864fca: movss xmm11, dword ptr [rip + 0x67b3b9]
0x145864fd3: divss xmm7, xmm11
0x145864fd8: movaps xmm0, xmm7
0x145864fdb: call 0x145d1475d
0x145864fe0: movaps xmm7, xmm0
0x145864fe3: mulss xmm7, xmm11
0x145864fe8: addss xmm7, dword ptr [rip + 0x92fd48]
0x145864ff0: mov byte ptr [rbp + 0x326], 1
0x145864ff7: lea rdi, [rbp + 0x1d0]
0x145864ffe: mov rcx, rdi
0x145865001: movaps xmm1, xmm7
0x145865004: call 0x1458627d0
0x145865009: nop
0x14586500a: lea rax, [rip + 0x17a7b7f]
0x145865011: mov qword ptr [rbp + 0xe0], rax
0x145865018: mov qword ptr [rbp + 0xe8], 1
0x145865023: mov qword ptr [rbp + 0xf0], rdi
0x14586502a: lea rax, [rip + 0x17a7b3f]
0x145865031: mov qword ptr [rbp + 0xf8], rax
0x145865038: mov qword ptr [rsp + 0x20], 1
0x145865041: lea rcx, [rbp + 0x298]
0x145865048: lea r9, [rbp + 0xe0]
0x14586504f: mov rdx, rsi
0x145865052: mov r8, r15
0x145865055: call 0x1458e0370
0x14586505a: nop
0x14586505b: jmp 0x145865200
0x145865060: mov byte ptr [rbp + 0x326], 1
0x145865067: lea rsi, [rip + 0x17c5aaf]
0x14586506e: mov edi, 0xb
0x145865073: mov edx, 0xb
0x145865078: mov rcx, rsi
0x14586507b: call 0x1458dff90
0x145865080: nop
0x145865081: mov r15, rdx
0x145865084: test rax, rax
0x145865087: cmovne rsi, rax
0x14586508b: cmove r15, rdi
0x14586508f: mov rax, qword ptr [rbp + 0x2f0]
0x145865096: mulss xmm11, dword ptr [rax + 0x44]
0x14586509c: mulss xmm11, dword ptr [r12 + 0x4c]
0x1458650a3: mulss xmm7, xmm11
0x1458650a8: movss xmm0, dword ptr [rip + 0x92fc88]
0x1458650b0: ucomiss xmm0, xmm7
0x1458650b3: jae 0x1458650e3
0x1458650b5: addss xmm7, dword ptr [rip + 0x17a7837]
0x1458650bd: movss xmm11, dword ptr [rip + 0x67b2c6]
0x1458650c6: divss xmm7, xmm11
0x1458650cb: movaps xmm0, xmm7
0x1458650ce: call 0x145d1475d
0x1458650d3: movaps xmm7, xmm0
0x1458650d6: mulss xmm7, xmm11
0x1458650db: addss xmm7, dword ptr [rip + 0x92fc55]
0x1458650e3: mov byte ptr [rbp + 0x326], 1
0x1458650ea: lea rdi, [rbp + 0x1d0]
0x1458650f1: mov rcx, rdi
0x1458650f4: movaps xmm1, xmm7
0x1458650f7: call 0x1458627d0
0x1458650fc: nop
0x1458650fd: lea rax, [rip + 0x17a7a8c]
0x145865104: mov qword ptr [rbp + 0xe0], rax
0x14586510b: mov qword ptr [rbp + 0xe8], 1
0x145865116: mov qword ptr [rbp + 0xf0], rdi
0x14586511d: lea rax, [rip + 0x17a7a4c]
0x145865124: mov qword ptr [rbp + 0xf8], rax
0x14586512b: mov qword ptr [rsp + 0x20], 1
0x145865134: lea rcx, [rbp + 0x298]
0x14586513b: lea r9, [rbp + 0xe0]
0x145865142: mov rdx, rsi
0x145865145: mov r8, r15
0x145865148: call 0x1458e0370
0x14586514d: nop
0x14586514e: jmp 0x145865200
0x145865153: ucomiss xmm0, dword ptr [r12 + 0x4c]
0x145865159: jae 0x145865286
0x14586515f: mov byte ptr [rbp + 0x326], 1
0x145865166: lea rsi, [rip + 0x17c59bb]
0x14586516d: mov edx, 0xc
0x145865172: mov rcx, rsi
0x145865175: call 0x1458dff90
0x14586517a: nop
0x14586517b: mov rdi, rax
0x14586517e: mov r15, rdx
0x145865181: movss xmm1, dword ptr [r12 + 0x4c]
0x145865188: mov byte ptr [rbp + 0x326], 1
0x14586518f: lea rbx, [rbp + 0x1d0]
0x145865196: mov rcx, rbx
0x145865199: call 0x1458627d0
0x14586519e: nop
0x14586519f: test rdi, rdi
0x1458651a2: mov eax, 0xc
0x1458651a7: cmove r15, rax
0x1458651ab: cmovne rsi, rdi
0x1458651af: lea rax, [rip + 0x17a79da]
0x1458651b6: mov qword ptr [rbp + 0xe0], rax
0x1458651bd: mov qword ptr [rbp + 0xe8], 1
0x1458651c8: mov qword ptr [rbp + 0xf0], rbx
0x1458651cf: lea rax, [rip + 0x17a799a]
0x1458651d6: mov qword ptr [rbp + 0xf8], rax
0x1458651dd: mov qword ptr [rsp + 0x20], 1
0x1458651e6: lea rcx, [rbp + 0x298]
0x1458651ed: lea r9, [rbp + 0xe0]
0x1458651f4: mov rdx, rsi
0x1458651f7: mov r8, r15
0x1458651fa: call 0x1458e0370
0x1458651ff: nop
0x145865200: mov rax, qword ptr [rbp + 0x298]
0x145865207: mov qword ptr [rbp + 0x290], rax
0x14586520e: mov rax, qword ptr [rbp + 0x2a0]
0x145865215: mov qword ptr [rbp + 0x2f8], rax
0x14586521c: mov rax, qword ptr [rbp + 0x2a8]
0x145865223: mov qword ptr [rbp + 0x78], rax
0x145865227: mov rdx, qword ptr [rbp + 0x1d0]
0x14586522e: test rdx, rdx
0x145865231: je 0x145865245
0x145865233: mov rcx, qword ptr [rbp + 0x1d8]
0x14586523a: mov r8d, 1
0x145865240: call 0x1400021d0
0x145865245: cmp byte ptr [r12 + 0x75], 0xb
0x14586524b: jne 0x145865299
0x14586524d: mov rax, qword ptr [rbp + 0x2f8]
0x145865254: mov qword ptr [rbp + 0x30], rax
0x145865258: mov rax, qword ptr [rbp + 0x290]
0x14586525f: mov qword ptr [rbp + 0x28], rax
0x145865263: mov byte ptr [rbp + 0x321], 1
0x14586526a: lea rsi, [rip + 0x17c625b]
0x145865271: mov edi, 7
0x145865276: mov edx, 7
0x14586527b: mov rcx, rsi
0x14586527e: call 0x1458dff90
0x145865283: nop
0x145865284: jmp 0x1458652d0
0x145865286: mov qword ptr [rbp + 0x290], 0xffffffffffffffff
0x145865291: cmp byte ptr [r12 + 0x75], 0xb
0x145865297: je 0x14586524d
0x145865299: mov rax, qword ptr [rbp + 0x2f8]
0x1458652a0: mov qword ptr [rbp + 0x30], rax
0x1458652a4: mov rax, qword ptr [rbp + 0x290]
0x1458652ab: mov qword ptr [rbp + 0x28], rax
0x1458652af: mov byte ptr [rbp + 0x321], 1
0x1458652b6: lea rsi, [rip + 0x17c6216]
0x1458652bd: mov edi, 9
0x1458652c2: mov edx, 9
0x1458652c7: mov rcx, rsi
0x1458652ca: call 0x1458dff90
0x1458652cf: nop
0x1458652d0: test rax, rax
0x1458652d3: cmove rdx, rdi
0x1458652d7: cmovne rsi, rax
0x1458652db: test rdx, rdx
0x1458652de: jns 0x14586530d
0x1458652e0: xor edi, edi
0x1458652e2: mov rax, qword ptr [rbp + 0x2f8]
0x1458652e9: mov qword ptr [rbp + 0x30], rax
0x1458652ed: mov rax, qword ptr [rbp + 0x290]
0x1458652f4: mov qword ptr [rbp + 0x28], rax
0x1458652f8: mov byte ptr [rbp + 0x321], 1
0x1458652ff: mov rcx, rdi
0x145865302: call 0x145eb6fcb
0x145865307: nop
0x145865308: jmp 0x14586664c
0x14586530d: mov qword ptr [rbp + 0x10], rdx
0x145865311: je 0x14586545b
0x145865317: call 0x140002200
0x14586531c: mov edi, 1
0x145865321: mov edx, 1
0x145865326: mov rbx, qword ptr [rbp + 0x10]
0x14586532a: mov rcx, rbx
0x14586532d: call 0x1400021c0
0x145865332: mov rdx, rbx
0x145865335: test rax, rax
0x145865338: je 0x1458652e2
0x14586533a: mov qword ptr [rbp + 0x18], rax
0x14586533e: mov rcx, rax
0x145865341: mov r8, rdx
0x145865344: mov rdx, rsi
0x145865347: call 0x145d145fb
0x14586534c: cmp byte ptr [r12 + 0x75], 0xb
0x145865352: mov dword ptr [rbp - 0x14], r13d
0x145865356: jne 0x145865474
0x14586535c: mov rcx, qword ptr [rbp + 0x2f0]
0x145865363: mov rdx, qword ptr [rbp + 0x2e8]
0x14586536a: call 0x14580a670
0x14586536f: test al, 1
0x145865371: je 0x1458655b8
0x145865377: movaps xmm7, xmm0
0x14586537a: mov byte ptr [rbp + 0x322], 1
0x145865381: lea rsi, [rip + 0x17a77d5]
0x145865388: mov edx, 0x10
0x14586538d: mov rcx, rsi
0x145865390: call 0x1458dff90
0x145865395: nop
0x145865396: mov rdi, rax
0x145865399: mov r15, rdx
0x14586539c: mov byte ptr [rbp + 0x322], 1
0x1458653a3: lea rbx, [rbp + 0x1d0]
0x1458653aa: mov rcx, rbx
0x1458653ad: movaps xmm1, xmm7
0x1458653b0: call 0x1458627d0
0x1458653b5: nop
0x1458653b6: test rdi, rdi
0x1458653b9: mov eax, 0x10
0x1458653be: cmove r15, rax
0x1458653c2: cmovne rsi, rdi
0x1458653c6: lea rax, [rip + 0x17a77c3]
0x1458653cd: mov qword ptr [rbp + 0xe0], rax
0x1458653d4: mov qword ptr [rbp + 0xe8], 1
0x1458653df: mov qword ptr [rbp + 0xf0], rbx
0x1458653e6: lea rax, [rip + 0x17a7783]
0x1458653ed: mov qword ptr [rbp + 0xf8], rax
0x1458653f4: mov qword ptr [rsp + 0x20], 1
0x1458653fd: lea rcx, [rbp + 0x298]
0x145865404: lea r9, [rbp + 0xe0]
0x14586540b: mov rdx, rsi
0x14586540e: mov r8, r15
0x145865411: call 0x1458e0370
0x145865416: nop
0x145865417: mov rdx, qword ptr [rbp + 0x1d0]
0x14586541e: test rdx, rdx
0x145865421: je 0x145865435
0x145865423: mov rcx, qword ptr [rbp + 0x1d8]
0x14586542a: mov r8d, 1
0x145865430: call 0x1400021d0
0x145865435: mov rax, qword ptr [rbp + 0x298]
0x14586543c: mov qword ptr [rbp + 0x38], rax
0x145865440: mov rax, qword ptr [rbp + 0x2a0]
0x145865447: mov qword ptr [rbp + 0x20], rax
0x14586544b: mov rax, qword ptr [rbp + 0x2a8]
0x145865452: mov qword ptr [rbp - 0x20], rax
0x145865456: jmp 0x1458655c0
0x14586545b: mov eax, 1
0x145865460: mov qword ptr [rbp + 0x18], rax
0x145865464: cmp byte ptr [r12 + 0x75], 0xb
0x14586546a: mov dword ptr [rbp - 0x14], r13d
0x14586546e: je 0x14586535c
0x145865474: mov byte ptr [rbp + 0x322], 1
0x14586547b: lea rsi, [rip + 0x17a76db]
0x145865482: mov edi, 0x10
0x145865487: mov edx, 0x10
0x14586548c: mov rcx, rsi
0x14586548f: call 0x1458dff90
0x145865494: nop
0x145865495: mov r15, rdx
0x145865498: test rax, rax
0x14586549b: cmovne rsi, rax
0x14586549f: cmove r15, rdi
0x1458654a3: movss xmm0, dword ptr [rip + 0x67e7a5]
0x1458654ab: cmp qword ptr [r12 + 8], 8
0x1458654b1: jne 0x1458654ce
0x1458654b3: mov rax, qword ptr [r12]
0x1458654b7: movabs rcx, 0x657269666c6c6568
0x1458654c1: cmp qword ptr [rax], rcx
0x1458654c4: jne 0x1458654ce
0x1458654c6: movss xmm0, dword ptr [rip + 0x67aeae]
0x1458654ce: movss xmm1, dword ptr [r12 + 0x48]
0x1458654d5: mulss xmm1, dword ptr [rip + 0x67b0bf]
0x1458654dd: mulss xmm8, xmm1
0x1458654e2: mov rax, qword ptr [rbp + 0x2f0]
0x1458654e9: mulss xmm8, dword ptr [rax + 0x3c]
0x1458654ef: mulss xmm10, xmm8
0x1458654f4: movaps xmm2, xmm10
0x1458654f8: maxss xmm2, xmm0
0x1458654fc: movaps xmm1, xmm2
0x1458654ff: cmpunordss xmm1, xmm2
0x145865504: andps xmm10, xmm1
0x145865508: andnps xmm1, xmm2
0x14586550b: orps xmm1, xmm10
0x14586550f: mov byte ptr [rbp + 0x322], 1
0x145865516: lea rdi, [rbp + 0x1d0]
0x14586551d: mov rcx, rdi
0x145865520: call 0x1458627d0
0x145865525: nop
0x145865526: lea rax, [rip + 0x17a7663]
0x14586552d: mov qword ptr [rbp + 0xe0], rax
0x145865534: mov qword ptr [rbp + 0xe8], 1
0x14586553f: mov qword ptr [rbp + 0xf0], rdi
0x145865546: lea rax, [rip + 0x17a7623]
0x14586554d: mov qword ptr [rbp + 0xf8], rax
0x145865554: mov qword ptr [rsp + 0x20], 1
0x14586555d: lea rcx, [rbp + 0x298]
0x145865564: lea r9, [rbp + 0xe0]
0x14586556b: mov rdx, rsi
0x14586556e: mov r8, r15
0x145865571: call 0x1458e0370
0x145865576: nop
0x145865577: mov rax, qword ptr [rbp + 0x298]
0x14586557e: mov qword ptr [rbp + 0x38], rax
0x145865582: mov rax, qword ptr [rbp + 0x2a0]
0x145865589: mov qword ptr [rbp + 0x20], rax
0x14586558d: mov rax, qword ptr [rbp + 0x2a8]
0x145865594: mov qword ptr [rbp - 0x20], rax
0x145865598: mov rdx, qword ptr [rbp + 0x1d0]
0x14586559f: test rdx, rdx
0x1458655a2: je 0x1458655c0
0x1458655a4: mov rcx, qword ptr [rbp + 0x1d8]
0x1458655ab: mov r8d, 1
0x1458655b1: call 0x1400021d0
0x1458655b6: jmp 0x1458655c0
0x1458655b8: mov qword ptr [rbp + 0x38], 0xffffffffffffffff
0x1458655c0: movzx ebx, byte ptr [r12 + 0x75]
0x1458655c6: mov r13d, dword ptr [r12 + 0x68]
0x1458655cb: movss xmm7, dword ptr [r12 + 0x6c]
0x1458655d2: lea eax, [r13 - 2]
0x1458655d6: cmp eax, 9
0x1458655d9: ja 0x1458655fb
0x1458655db: mov rcx, qword ptr [rbp + 0x2f0]
0x1458655e2: movss xmm0, dword ptr [rcx + 0x50]
0x1458655e7: lea rcx, [rip + 0x17c6eb6]
0x1458655ee: movsxd rdx, dword ptr [rcx + rax*4]
0x1458655f2: add rdx, rcx
0x1458655f5: jmp rdx
0x1458655f7: mulss xmm7, xmm0
0x1458655fb: mov rcx, qword ptr [rbp + 0x278]
0x145865602: mov qword ptr [rbp - 0x30], rcx
0x145865606: mov rcx, qword ptr [rbp + 0x280]
0x14586560d: mov qword ptr [rbp - 0x28], rcx
0x145865611: mov rcx, qword ptr [rbp + 0x288]
0x145865618: mov qword ptr [rbp - 0x40], rcx
0x14586561c: cmp bl, 6
0x14586561f: jne 0x1458659bd
0x145865625: mov rax, qword ptr [rbp + 0x2e8]
0x14586562c: movss xmm12, dword ptr [rax]
0x145865631: movss xmm8, dword ptr [rax + 4]
0x145865637: mov rdx, qword ptr [rbp + 0x308]
0x14586563e: movss xmm14, dword ptr [rdx + 0x44]
0x145865644: movss xmm10, dword ptr [rdx + 0x58]
0x14586564a: mov rcx, qword ptr [rbp + 0x2f0]
0x145865651: movss xmm13, dword ptr [rcx + 0x38]
0x145865657: movss xmm15, dword ptr [rcx + 0x4c]
0x14586565d: movss xmm0, dword ptr [rip + 0x67af37]
0x145865665: mulss xmm0, xmm10
0x14586566a: mulss xmm6, xmm0
0x14586566e: mulss xmm6, dword ptr [rcx + 0x48]
0x145865673: movss xmm11, dword ptr [rax + 0x48]
0x145865679: mov edi, dword ptr [rdx + 0x5c]
0x14586567c: lea rbx, [rip + 0x17c5e59]
0x145865683: mov esi, 0x28
0x145865688: mov edx, 0x28
0x14586568d: mov rcx, rbx
0x145865690: call 0x1458dff90
0x145865695: nop
0x145865696: mov r15, rdx
0x145865699: addss xmm11, dword ptr [rip + 0x67a80e]
0x1458656a2: test rax, rax
0x1458656a5: movss xmm0, dword ptr [rip + 0x67aeef]
0x1458656ad: mulss xmm0, xmm14
0x1458656b2: mulss xmm9, xmm0
0x1458656b7: mulss xmm13, xmm9
0x1458656bc: mulss xmm12, xmm15
0x1458656c1: xorps xmm0, xmm0
0x1458656c4: cmpltss xmm0, xmm14
0x1458656ca: andps xmm0, xmm12
0x1458656ce: addss xmm0, xmm13
0x1458656d3: mulss xmm8, xmm0
0x1458656d8: mulss xmm8, xmm6
0x1458656dd: movaps xmm0, xmm10
0x1458656e1: maxss xmm0, dword ptr [rip + 0x68b09f]
0x1458656e9: divss xmm8, xmm0
0x1458656ee: mulss xmm8, xmm11
0x1458656f3: cmovne rbx, rax
0x1458656f7: cmove r15, rsi
0x1458656fb: lea rcx, [rbp + 0x298]
0x145865702: movaps xmm1, xmm8
0x145865706: call 0x1458627d0
0x14586570b: nop
0x14586570c: mov rax, qword ptr [rbp + 0x308]
0x145865713: movzx ecx, byte ptr [rax + 0x74]
0x145865717: call 0x14585c840
0x14586571c: nop
0x14586571d: mov rsi, rax
0x145865720: mov r12, rdx
0x145865723: cmp edi, 1
0x145865726: adc edi, 0
0x145865729: xorps xmm0, xmm0
0x14586572c: cvtsi2ss xmm0, rdi
0x145865731: divss xmm10, xmm0
0x145865736: movaps xmm0, xmm10
0x14586573a: maxss xmm0, dword ptr [rip + 0x68b046]
0x145865742: divss xmm6, xmm0
0x145865746: movaps xmm0, xmm6
0x145865749: call 0x145d1463d
0x14586574e: maxss xmm0, dword ptr [rip + 0x67a75a]
0x145865756: mulss xmm10, xmm0
0x14586575b: mulss xmm0, xmm11
0x145865760: call 0x145d1463d
0x145865765: cvttss2si rax, xmm0
0x14586576a: xor ecx, ecx
0x14586576c: xorps xmm1, xmm1
0x14586576f: ucomiss xmm0, xmm1
0x145865772: cmovae ecx, eax
0x145865775: ucomiss xmm0, dword ptr [rip + 0x69b438]
0x14586577c: mov eax, 0xffffffff
0x145865781: cmovbe eax, ecx
0x145865784: divss xmm10, xmm0
0x145865789: mov qword ptr [rbp + 0x40], rsi
0x14586578d: mov qword ptr [rbp + 0x48], r12
0x145865791: xorps xmm1, xmm1
0x145865794: cvtsi2ss xmm1, rax
0x145865799: mulss xmm1, xmm10
0x14586579e: lea rsi, [rbp + 0x1d0]
0x1458657a5: mov rcx, rsi
0x1458657a8: call 0x1458627d0
0x1458657ad: nop
0x1458657ae: lea rax, [rip + 0x17c578e]
0x1458657b5: mov qword ptr [rbp + 0xe0], rax
0x1458657bc: mov qword ptr [rbp + 0xe8], 5
0x1458657c7: lea rdi, [rbp + 0x298]
0x1458657ce: mov qword ptr [rbp + 0xf0], rdi
0x1458657d5: lea r12, [rip + 0x17a7394]
0x1458657dc: mov qword ptr [rbp + 0xf8], r12
0x1458657e3: lea rax, [rip + 0x17c53d1]
0x1458657ea: mov qword ptr [rbp + 0x100], rax
0x1458657f1: mov qword ptr [rbp + 0x108], 6
0x1458657fc: lea rax, [rbp + 0x40]
0x145865800: mov qword ptr [rbp + 0x110], rax
0x145865807: lea rax, [rip + 0x17a73e2]
0x14586580e: mov qword ptr [rbp + 0x118], rax
0x145865815: lea rax, [rip + 0x17c5970]
0x14586581c: mov qword ptr [rbp + 0x120], rax
0x145865823: mov qword ptr [rbp + 0x128], 4
0x14586582e: mov qword ptr [rbp + 0x130], rsi
0x145865835: mov qword ptr [rbp + 0x138], r12
0x14586583c: mov qword ptr [rsp + 0x20], 3
0x145865845: lea rcx, [rbp + 0x98]
0x14586584c: lea r9, [rbp + 0xe0]
0x145865853: mov rdx, rbx
0x145865856: mov r8, r15
0x145865859: call 0x1458e0370
0x14586585e: nop
0x14586585f: mov rdx, qword ptr [rbp + 0x1d0]
0x145865866: test rdx, rdx
0x145865869: je 0x14586587d
0x14586586b: mov rcx, qword ptr [rbp + 0x1d8]
0x145865872: mov r8d, 1
0x145865878: call 0x1400021d0
0x14586587d: mov rdx, qword ptr [rbp + 0x298]
0x145865884: test rdx, rdx
0x145865887: je 0x14586589b
0x145865889: mov rcx, qword ptr [rbp + 0x2a0]
0x145865890: mov r8d, 1
0x145865896: call 0x1400021d0
0x14586589b: cmp r13d, 5
0x14586589f: je 0x145865a1e
0x1458658a5: cmp r13d, 0xb
0x1458658a9: jne 0x145865b5a
0x1458658af: lea rsi, [rip + 0x17c5c6f]
0x1458658b6: mov edx, 0x18
0x1458658bb: mov rcx, rsi
0x1458658be: call 0x1458dff90
0x1458658c3: nop
0x1458658c4: mov r15, rax
0x1458658c7: mov rbx, rdx
0x1458658ca: mulss xmm7, dword ptr [rip + 0x67aaee]
0x1458658d2: movss dword ptr [rbp + 0x298], xmm7
0x1458658da: mov qword ptr [rbp + 0xe0], rdi
0x1458658e1: lea rax, [rip + 0x492818]
0x1458658e8: mov qword ptr [rbp + 0xe8], rax
0x1458658ef: lea rdx, [rip + 0x17c5a7f]
0x1458658f6: lea rdi, [rbp + 0x1d0]
0x1458658fd: lea r8, [rbp + 0xe0]
0x145865904: mov rcx, rdi
0x145865907: call 0x145ce7350
0x14586590c: nop
0x14586590d: test r15, r15
0x145865910: mov eax, 0x18
0x145865915: cmove rbx, rax
0x145865919: cmovne rsi, r15
0x14586591d: lea rax, [rip + 0x17c521c]
0x145865924: mov qword ptr [rbp + 0xe0], rax
0x14586592b: mov qword ptr [rbp + 0xe8], 1
0x145865936: mov qword ptr [rbp + 0xf0], rdi
0x14586593d: mov qword ptr [rbp + 0xf8], r12
0x145865944: mov qword ptr [rsp + 0x20], 1
0x14586594d: lea rcx, [rbp + 0x298]
0x145865954: lea r9, [rbp + 0xe0]
0x14586595b: mov rdx, rsi
0x14586595e: mov r8, rbx
0x145865961: call 0x1458e0370
0x145865966: nop
0x145865967: mov rbx, qword ptr [rbp + 0x2a0]
0x14586596e: mov rsi, qword ptr [rbp + 0x2a8]
0x145865975: mov rax, qword ptr [rbp + 0x98]
0x14586597c: mov rdi, qword ptr [rbp + 0xa8]
0x145865983: sub rax, rdi
0x145865986: cmp rsi, rax
0x145865989: jbe 0x145865afe
0x14586598f: mov qword ptr [rbp + 0x308], rbx
0x145865996: mov qword ptr [rsp + 0x20], 1
0x14586599f: lea rcx, [rbp + 0x98]
0x1458659a6: mov r9d, 1
0x1458659ac: mov rdx, rdi
0x1458659af: mov r8, rsi
0x1458659b2: call 0x145d14a10
0x1458659b7: nop
0x1458659b8: jmp 0x145866629
0x1458659bd: movzx ecx, bl
0x1458659c0: cmp eax, 0xa
0x1458659c3: ja 0x145865b89
0x1458659c9: lea rdx, [rip + 0x17c6afc]
0x1458659d0: movsxd rax, dword ptr [rdx + rax*4]
0x1458659d4: add rax, rdx
0x1458659d7: jmp rax
0x1458659d9: lea rdi, [rip + 0x17c5b5d]
0x1458659e0: mov ebx, 0x10
0x1458659e5: mov edx, 0x10
0x1458659ea: mov rcx, rdi
0x1458659ed: call 0x1458dff90
0x1458659f2: nop
0x1458659f3: mov rsi, rdx
0x1458659f6: test rax, rax
0x1458659f9: cmovne rdi, rax
0x1458659fd: cmove rsi, rbx
0x145865a01: test rsi, rsi
0x145865a04: jns 0x14586621f
0x145865a0a: xor r15d, r15d
0x145865a0d: mov rcx, r15
0x145865a10: mov rdx, rsi
0x145865a13: call 0x145eb6fcb
0x145865a18: nop
0x145865a19: jmp 0x14586664c
0x145865a1e: lea rsi, [rip + 0x17c5adf]
0x145865a25: mov edx, 0x21
0x145865a2a: mov rcx, rsi
0x145865a2d: call 0x1458dff90
0x145865a32: nop
0x145865a33: mov r15, rax
0x145865a36: mov rbx, rdx
0x145865a39: mulss xmm7, dword ptr [rip + 0x67a97f]
0x145865a41: movss dword ptr [rbp + 0x298], xmm7
0x145865a49: mov qword ptr [rbp + 0xe0], rdi
0x145865a50: lea rax, [rip + 0x4926a9]
0x145865a57: mov qword ptr [rbp + 0xe8], rax
0x145865a5e: lea rdx, [rip + 0x17c5910]
0x145865a65: lea rdi, [rbp + 0x1d0]
0x145865a6c: lea r8, [rbp + 0xe0]
0x145865a73: mov rcx, rdi
0x145865a76: call 0x145ce7350
0x145865a7b: nop
0x145865a7c: test r15, r15
0x145865a7f: mov eax, 0x21
0x145865a84: cmove rbx, rax
0x145865a88: cmovne rsi, r15
0x145865a8c: lea rax, [rip + 0x17c50ad]
0x145865a93: mov qword ptr [rbp + 0xe0], rax
0x145865a9a: mov qword ptr [rbp + 0xe8], 1
0x145865aa5: mov qword ptr [rbp + 0xf0], rdi
0x145865aac: mov qword ptr [rbp + 0xf8], r12
0x145865ab3: mov qword ptr [rsp + 0x20], 1
0x145865abc: lea rcx, [rbp + 0x298]
0x145865ac3: lea r9, [rbp + 0xe0]
0x145865aca: mov rdx, rsi
0x145865acd: mov r8, rbx
0x145865ad0: call 0x1458e0370
0x145865ad5: nop
0x145865ad6: mov rbx, qword ptr [rbp + 0x2a0]
0x145865add: mov rsi, qword ptr [rbp + 0x2a8]
0x145865ae4: mov rax, qword ptr [rbp + 0x98]
0x145865aeb: mov rdi, qword ptr [rbp + 0xa8]
0x145865af2: sub rax, rdi
0x145865af5: cmp rsi, rax
0x145865af8: ja 0x145866600
0x145865afe: test rsi, rsi
0x145865b01: je 0x145865b18
0x145865b03: mov rcx, qword ptr [rbp + 0xa0]
0x145865b0a: add rcx, rdi
0x145865b0d: mov rdx, rbx
0x145865b10: mov r8, rsi
0x145865b13: call 0x145d145fb
0x145865b18: add rdi, rsi
0x145865b1b: mov qword ptr [rbp + 0xa8], rdi
0x145865b22: mov rdx, qword ptr [rbp + 0x298]
0x145865b29: test rdx, rdx
0x145865b2c: je 0x145865b3c
0x145865b2e: mov r8d, 1
0x145865b34: mov rcx, rbx
0x145865b37: call 0x1400021d0
0x145865b3c: mov rdx, qword ptr [rbp + 0x1d0]
0x145865b43: test rdx, rdx
0x145865b46: je 0x145865b5a
0x145865b48: mov rcx, qword ptr [rbp + 0x1d8]
0x145865b4f: mov r8d, 1
0x145865b55: call 0x1400021d0
0x145865b5a: mov rax, qword ptr [rbp + 0xa8]
0x145865b61: mov qword ptr [rbp + 0x50], rax
0x145865b65: movups xmm0, xmmword ptr [rbp + 0x98]
0x145865b6c: movaps xmmword ptr [rbp + 0x40], xmm0
0x145865b70: jmp 0x145866364
0x145865b75: mulss xmm0, xmm7
0x145865b79: minss xmm0, dword ptr [rip + 0x68a8f3]
0x145865b81: movaps xmm7, xmm0
0x145865b84: jmp 0x1458655fb
0x145865b89: cmp ecx, 9
0x145865b8c: jne 0x14586614a
0x145865b92: cmp r13d, 0xd
0x145865b96: jne 0x145866165
0x145865b9c: lea rsi, [rip + 0x17c5a51]
0x145865ba3: mov edx, 0x20
0x145865ba8: mov rcx, rsi
0x145865bab: call 0x1458dff90
0x145865bb0: nop
0x145865bb1: mov rdi, rax
0x145865bb4: mov r15, rdx
0x145865bb7: mulss xmm9, xmm7
0x145865bbc: mov rax, qword ptr [rbp + 0x2f0]
0x145865bc3: mulss xmm9, dword ptr [rax + 0x38]
0x145865bc9: mov rax, qword ptr [rbp + 0x2e8]
0x145865bd0: movss xmm1, dword ptr [rax + 0x40]
0x145865bd5: addss xmm1, dword ptr [rip + 0x67a2d3]
0x145865bdd: mulss xmm1, xmm9
0x145865be2: mulss xmm1, dword ptr [rax + 4]
0x145865be7: lea rbx, [rbp + 0x1d0]
0x145865bee: mov rcx, rbx
0x145865bf1: call 0x1458627d0
0x145865bf6: nop
0x145865bf7: test rdi, rdi
0x145865bfa: mov eax, 0x20
0x145865bff: cmove r15, rax
0x145865c03: cmovne rsi, rdi
0x145865c07: lea rax, [rip + 0x17a6f82]
0x145865c0e: mov qword ptr [rbp + 0xe0], rax
0x145865c15: mov qword ptr [rbp + 0xe8], 1
0x145865c20: mov qword ptr [rbp + 0xf0], rbx
0x145865c27: lea rax, [rip + 0x17a6f42]
0x145865c2e: mov qword ptr [rbp + 0xf8], rax
0x145865c35: mov qword ptr [rsp + 0x20], 1
0x145865c3e: lea rcx, [rbp + 0x40]
0x145865c42: lea r9, [rbp + 0xe0]
0x145865c49: mov rdx, rsi
0x145865c4c: mov r8, r15
0x145865c4f: call 0x1458e0370
0x145865c54: nop
0x145865c55: jmp 0x145866346
0x145865c5a: cmp bl, 9
0x145865c5d: jne 0x14586614a
0x145865c63: lea rsi, [rip + 0x17c5939]
0x145865c6a: mov edx, 0x1e
0x145865c6f: mov rcx, rsi
0x145865c72: call 0x1458dff90
0x145865c77: nop
0x145865c78: mov r15, rax
0x145865c7b: mov rbx, rdx
0x145865c7e: mov rax, qword ptr [rbp + 0x2e8]
0x145865c85: movss xmm0, dword ptr [rax + 0x40]
0x145865c8a: addss xmm0, dword ptr [rip + 0x67a21e]
0x145865c92: mulss xmm7, xmm0
0x145865c96: mulss xmm7, dword ptr [rip + 0x67a722]
0x145865c9e: movss dword ptr [rbp + 0x298], xmm7
0x145865ca6: lea rax, [rbp + 0x298]
0x145865cad: mov qword ptr [rbp + 0xe0], rax
0x145865cb4: lea rax, [rip + 0x492445]
0x145865cbb: mov qword ptr [rbp + 0xe8], rax
0x145865cc2: lea rdx, [rip + 0x17c56ac]
0x145865cc9: lea rdi, [rbp + 0x1d0]
0x145865cd0: lea r8, [rbp + 0xe0]
0x145865cd7: mov rcx, rdi
0x145865cda: call 0x145ce7350
0x145865cdf: nop
0x145865ce0: test r15, r15
0x145865ce3: mov eax, 0x1e
0x145865ce8: cmove rbx, rax
0x145865cec: cmovne rsi, r15
0x145865cf0: lea rax, [rip + 0x17c4e49]
0x145865cf7: mov qword ptr [rbp + 0xe0], rax
0x145865cfe: mov qword ptr [rbp + 0xe8], 1
0x145865d09: mov qword ptr [rbp + 0xf0], rdi
0x145865d10: lea rax, [rip + 0x17a6e59]
0x145865d17: mov qword ptr [rbp + 0xf8], rax
0x145865d1e: mov qword ptr [rsp + 0x20], 1
0x145865d27: lea rcx, [rbp + 0x40]
0x145865d2b: lea r9, [rbp + 0xe0]
0x145865d32: mov rdx, rsi
0x145865d35: mov r8, rbx
0x145865d38: call 0x1458e0370
0x145865d3d: nop
0x145865d3e: jmp 0x145866346
0x145865d43: lea rdi, [rip + 0x17c5803]
0x145865d4a: mov ebx, 8
0x145865d4f: mov edx, 8
0x145865d54: mov rcx, rdi
0x145865d57: call 0x1458dff90
0x145865d5c: nop
0x145865d5d: mov rsi, rdx
0x145865d60: test rax, rax
0x145865d63: cmovne rdi, rax
0x145865d67: cmove rsi, rbx
0x145865d6b: test rsi, rsi
0x145865d6e: jns 0x1458661fb
0x145865d74: xor r15d, r15d
0x145865d77: mov rcx, r15
0x145865d7a: mov rdx, rsi
0x145865d7d: call 0x145eb6fcb
0x145865d82: nop
0x145865d83: jmp 0x14586664c
0x145865d88: cmp bl, 9
0x145865d8b: jne 0x14586614a
0x145865d91: lea rsi, [rip + 0x17c5829]
0x145865d98: mov edx, 0x1d
0x145865d9d: mov rcx, rsi
0x145865da0: call 0x1458dff90
0x145865da5: nop
0x145865da6: mov r15, rax
0x145865da9: mov rbx, rdx
0x145865dac: mov rax, qword ptr [rbp + 0x2e8]
0x145865db3: movss xmm0, dword ptr [rax + 0x40]
0x145865db8: addss xmm0, dword ptr [rip + 0x67a0f0]
0x145865dc0: mulss xmm7, xmm0
0x145865dc4: mulss xmm7, dword ptr [rip + 0x67a5f4]
0x145865dcc: movss dword ptr [rbp + 0x298], xmm7
0x145865dd4: lea rax, [rbp + 0x298]
0x145865ddb: mov qword ptr [rbp + 0xe0], rax
0x145865de2: lea rax, [rip + 0x492317]
0x145865de9: mov qword ptr [rbp + 0xe8], rax
0x145865df0: lea rdx, [rip + 0x17c557e]
0x145865df7: lea rdi, [rbp + 0x1d0]
0x145865dfe: lea r8, [rbp + 0xe0]
0x145865e05: mov rcx, rdi
0x145865e08: call 0x145ce7350
0x145865e0d: nop
0x145865e0e: test r15, r15
0x145865e11: mov eax, 0x1d
0x145865e16: cmove rbx, rax
0x145865e1a: cmovne rsi, r15
0x145865e1e: lea rax, [rip + 0x17c57b9]
0x145865e25: mov qword ptr [rbp + 0xe0], rax
0x145865e2c: mov qword ptr [rbp + 0xe8], 1
0x145865e37: mov qword ptr [rbp + 0xf0], rdi
0x145865e3e: lea rax, [rip + 0x17a6d2b]
0x145865e45: mov qword ptr [rbp + 0xf8], rax
0x145865e4c: mov qword ptr [rsp + 0x20], 1
0x145865e55: lea rcx, [rbp + 0x40]
0x145865e59: lea r9, [rbp + 0xe0]
0x145865e60: mov rdx, rsi
0x145865e63: mov r8, rbx
0x145865e66: call 0x1458e0370
0x145865e6b: nop
0x145865e6c: jmp 0x145866346
0x145865e71: cmp bl, 9
0x145865e74: jne 0x14586614a
0x145865e7a: lea rsi, [rip + 0x17c575e]
0x145865e81: mov ebx, 0x15
0x145865e86: mov edx, 0x15
0x145865e8b: mov rcx, rsi
0x145865e8e: call 0x1458dff90
0x145865e93: nop
0x145865e94: mov rdi, rdx
0x145865e97: test rax, rax
0x145865e9a: cmovne rsi, rax
0x145865e9e: cmove rdi, rbx
0x145865ea2: mov qword ptr [rsp + 0x20], 1
0x145865eab: lea rcx, [rbp + 0xe0]
0x145865eb2: mov r9d, 1
0x145865eb8: mov rdx, rdi
0x145865ebb: xor r8d, r8d
0x145865ebe: call 0x14001c2a0
0x145865ec3: mov rbx, qword ptr [rbp + 0xe8]
0x145865eca: cmp dword ptr [rbp + 0xe0], 1
0x145865ed1: je 0x14586663c
0x145865ed7: mov r15, qword ptr [rbp + 0xf0]
0x145865ede: test rdi, rdi
0x145865ee1: je 0x145865ef1
0x145865ee3: mov rcx, r15
0x145865ee6: mov rdx, rsi
0x145865ee9: mov r8, rdi
0x145865eec: call 0x145d145fb
0x145865ef1: mov qword ptr [rbp + 0x40], rbx
0x145865ef5: mov qword ptr [rbp + 0x48], r15
0x145865ef9: mov qword ptr [rbp + 0x50], rdi
0x145865efd: jmp 0x145866364
0x145865f02: cmp ecx, 9
0x145865f05: jne 0x14586614a
0x145865f0b: mov rax, qword ptr [rbp + 0x308]
0x145865f12: movss xmm0, dword ptr [rax + 0x58]
0x145865f17: xorps xmm1, xmm1
0x145865f1a: ucomiss xmm0, xmm1
0x145865f1d: jbe 0x145866165
0x145865f23: lea rsi, [rip + 0x17c562b]
0x145865f2a: mov edx, 0x1c
0x145865f2f: mov rcx, rsi
0x145865f32: call 0x1458dff90
0x145865f37: nop
0x145865f38: mov r12, rax
0x145865f3b: mov r15, rdx
0x145865f3e: mov rax, qword ptr [rbp + 0x2e8]
0x145865f45: mulss xmm7, dword ptr [rax]
0x145865f49: mov rax, qword ptr [rbp + 0x2f0]
0x145865f50: mulss xmm9, dword ptr [rax + 0x38]
0x145865f56: xorps xmm1, xmm1
0x145865f59: sqrtss xmm1, xmm9
0x145865f5e: mulss xmm1, dword ptr [rip + 0x67a636]
0x145865f66: mulss xmm1, xmm7
0x145865f6a: lea rdi, [rbp + 0x298]
0x145865f71: mov rcx, rdi
0x145865f74: call 0x1458627d0
0x145865f79: nop
0x145865f7a: mov rax, qword ptr [rbp + 0x308]
0x145865f81: movss xmm0, dword ptr [rax + 0x58]
0x145865f86: mulss xmm0, dword ptr [rip + 0x67a60e]
0x145865f8e: mulss xmm6, xmm0
0x145865f92: mov rax, qword ptr [rbp + 0x2f0]
0x145865f99: mulss xmm6, dword ptr [rax + 0x48]
0x145865f9e: lea rbx, [rbp + 0x1d0]
0x145865fa5: mov rcx, rbx
0x145865fa8: movaps xmm1, xmm6
0x145865fab: call 0x1458627d0
0x145865fb0: nop
0x145865fb1: test r12, r12
0x145865fb4: mov eax, 0x1c
0x145865fb9: cmove r15, rax
0x145865fbd: cmovne rsi, r12
0x145865fc1: lea rax, [rip + 0x17a6bc8]
0x145865fc8: mov qword ptr [rbp + 0xe0], rax
0x145865fcf: mov qword ptr [rbp + 0xe8], 1
0x145865fda: mov qword ptr [rbp + 0xf0], rdi
0x145865fe1: lea rax, [rip + 0x17a6b88]
0x145865fe8: mov qword ptr [rbp + 0xf8], rax
0x145865fef: lea rcx, [rip + 0x17c5196]
0x145865ff6: mov qword ptr [rbp + 0x100], rcx
0x145865ffd: mov qword ptr [rbp + 0x108], 4
0x145866008: mov qword ptr [rbp + 0x110], rbx
0x14586600f: mov qword ptr [rbp + 0x118], rax
0x145866016: mov qword ptr [rsp + 0x20], 2
0x14586601f: lea rcx, [rbp + 0x40]
0x145866023: lea r9, [rbp + 0xe0]
0x14586602a: mov rdx, rsi
0x14586602d: mov r8, r15
0x145866030: call 0x1458e0370
0x145866035: nop
0x145866036: mov rdx, qword ptr [rbp + 0x1d0]
0x14586603d: test rdx, rdx
0x145866040: je 0x145866054
0x145866042: mov rcx, qword ptr [rbp + 0x1d8]
0x145866049: mov r8d, 1
0x14586604f: call 0x1400021d0
0x145866054: mov rdx, qword ptr [rbp + 0x298]
0x14586605b: test rdx, rdx
0x14586605e: je 0x145866364
0x145866064: mov rcx, qword ptr [rbp + 0x2a0]
0x14586606b: jmp 0x145866359
0x145866070: lea r15, [rip + 0x17c54fa]
0x145866077: mov edi, 0x19
0x14586607c: mov edx, 0x19
0x145866081: mov rcx, r15
0x145866084: call 0x1458dff90
0x145866089: nop
0x14586608a: mov rsi, rdx
0x14586608d: test rax, rax
0x145866090: cmovne r15, rax
0x145866094: cmove rsi, rdi
0x145866098: cmp bl, 9
0x14586609b: jne 0x145866182
0x1458660a1: mov rax, qword ptr [rbp + 0x2e8]
0x1458660a8: mulss xmm7, dword ptr [rax]
0x1458660ac: mov rcx, qword ptr [rbp + 0x2f0]
0x1458660b3: mulss xmm9, dword ptr [rcx + 0x38]
0x1458660b9: xorps xmm0, xmm0
0x1458660bc: sqrtss xmm0, xmm9
0x1458660c1: mulss xmm0, dword ptr [rip + 0x67a4d3]
0x1458660c9: mulss xmm0, xmm7
0x1458660cd: movss xmm1, dword ptr [rax + 0x40]
0x1458660d2: addss xmm1, dword ptr [rip + 0x679dd6]
0x1458660da: mulss xmm1, xmm0
0x1458660de: lea rdi, [rbp + 0x1d0]
0x1458660e5: mov rcx, rdi
0x1458660e8: call 0x1458627d0
0x1458660ed: nop
0x1458660ee: lea rax, [rip + 0x17a6a9b]
0x1458660f5: mov qword ptr [rbp + 0xe0], rax
0x1458660fc: mov qword ptr [rbp + 0xe8], 1
0x145866107: mov qword ptr [rbp + 0xf0], rdi
0x14586610e: lea rax, [rip + 0x17a6a5b]
0x145866115: mov qword ptr [rbp + 0xf8], rax
0x14586611c: mov qword ptr [rsp + 0x20], 1
0x145866125: lea rcx, [rbp + 0x40]
0x145866129: lea r9, [rbp + 0xe0]
0x145866130: mov rdx, r15
0x145866133: mov r8, rsi
0x145866136: call 0x1458e0370
0x14586613b: nop
0x14586613c: jmp 0x145866346
0x145866141: cmp ecx, 9
0x145866144: je 0x14586626b
0x14586614a: cmp ecx, 0xb
0x14586614d: jne 0x145866165
0x14586614f: lea rcx, [rbp + 0x40]
0x145866153: mov rdx, qword ptr [rbp + 0x2f0]
0x14586615a: call 0x14596bf50
0x14586615f: nop
0x145866160: jmp 0x145866364
0x145866165: mov qword ptr [rbp + 0x40], 0
0x14586616d: mov qword ptr [rbp + 0x48], 1
0x145866175: mov qword ptr [rbp + 0x50], 0
0x14586617d: jmp 0x145866364
0x145866182: mov rax, qword ptr [rbp + 0x2e8]
0x145866189: mulss xmm7, dword ptr [rax]
0x14586618d: mulss xmm7, dword ptr [rip + 0x67a06b]
0x145866195: lea rdi, [rbp + 0x1d0]
0x14586619c: mov rcx, rdi
0x14586619f: movaps xmm1, xmm7
0x1458661a2: call 0x1458627d0
0x1458661a7: nop
0x1458661a8: lea rax, [rip + 0x17a69e1]
0x1458661af: mov qword ptr [rbp + 0xe0], rax
0x1458661b6: mov qword ptr [rbp + 0xe8], 1
0x1458661c1: mov qword ptr [rbp + 0xf0], rdi
0x1458661c8: lea rax, [rip + 0x17a69a1]
0x1458661cf: mov qword ptr [rbp + 0xf8], rax
0x1458661d6: mov qword ptr [rsp + 0x20], 1
0x1458661df: lea rcx, [rbp + 0x40]
0x1458661e3: lea r9, [rbp + 0xe0]
0x1458661ea: mov rdx, r15
0x1458661ed: mov r8, rsi
0x1458661f0: call 0x1458e0370
0x1458661f5: nop
0x1458661f6: jmp 0x145866346
0x1458661fb: je 0x145866255
0x1458661fd: call 0x140002200
0x145866202: mov r15d, 1
0x145866208: mov edx, 1
0x14586620d: mov rcx, rsi
0x145866210: call 0x1400021c0
0x145866215: test rax, rax
0x145866218: jne 0x145866242
0x14586621a: jmp 0x145865d77
0x14586621f: je 0x145866255
0x145866221: call 0x140002200
0x145866226: mov r15d, 1
0x14586622c: mov edx, 1
0x145866231: mov rcx, rsi
0x145866234: call 0x1400021c0
0x145866239: test rax, rax
0x14586623c: je 0x145865a0d
0x145866242: mov rbx, rax
0x145866245: mov rcx, rax
0x145866248: mov rdx, rdi
0x14586624b: mov r8, rsi
0x14586624e: call 0x145d145fb
0x145866253: jmp 0x14586625a
0x145866255: mov ebx, 1
0x14586625a: mov qword ptr [rbp + 0x40], rsi
0x14586625e: mov qword ptr [rbp + 0x48], rbx
0x145866262: mov qword ptr [rbp + 0x50], rsi
0x145866266: jmp 0x145866364
0x14586626b: lea rsi, [rip + 0x17c5318]
0x145866272: mov edx, 0x19
0x145866277: mov rcx, rsi
0x14586627a: call 0x1458dff90
0x14586627f: nop
0x145866280: mov r15, rax
0x145866283: mov rbx, rdx
0x145866286: mov rax, qword ptr [rbp + 0x2e8]
0x14586628d: movss xmm0, dword ptr [rax + 0x40]
0x145866292: addss xmm0, dword ptr [rip + 0x679c16]
0x14586629a: mulss xmm7, xmm0
0x14586629e: mulss xmm7, dword ptr [rip + 0x67a11a]
0x1458662a6: movss dword ptr [rbp + 0x298], xmm7
0x1458662ae: lea rax, [rbp + 0x298]
0x1458662b5: mov qword ptr [rbp + 0xe0], rax
0x1458662bc: lea rax, [rip + 0x491e3d]
0x1458662c3: mov qword ptr [rbp + 0xe8], rax
0x1458662ca: lea rdx, [rip + 0x17c50a4]
0x1458662d1: lea rdi, [rbp + 0x1d0]
0x1458662d8: lea r8, [rbp + 0xe0]
0x1458662df: mov rcx, rdi
0x1458662e2: call 0x145ce7350
0x1458662e7: nop
0x1458662e8: test r15, r15
0x1458662eb: mov eax, 0x19
0x1458662f0: cmove rbx, rax
0x1458662f4: cmovne rsi, r15
0x1458662f8: lea rax, [rip + 0x17c4841]
0x1458662ff: mov qword ptr [rbp + 0xe0], rax
0x145866306: mov qword ptr [rbp + 0xe8], 1
0x145866311: mov qword ptr [rbp + 0xf0], rdi
0x145866318: lea rax, [rip + 0x17a6851]
0x14586631f: mov qword ptr [rbp + 0xf8], rax
0x145866326: mov qword ptr [rsp + 0x20], 1
0x14586632f: lea rcx, [rbp + 0x40]
0x145866333: lea r9, [rbp + 0xe0]
0x14586633a: mov rdx, rsi
0x14586633d: mov r8, rbx
0x145866340: call 0x1458e0370
0x145866345: nop
0x145866346: mov rdx, qword ptr [rbp + 0x1d0]
0x14586634d: test rdx, rdx
0x145866350: je 0x145866364
0x145866352: mov rcx, qword ptr [rbp + 0x1d8]
0x145866359: mov r8d, 1
0x14586635f: call 0x1400021d0
0x145866364: mov rcx, qword ptr [rbp - 0x38]
0x145866368: mov eax, dword ptr [rbp - 0x14]
0x14586636b: mov dword ptr [rcx + 0xa8], eax
0x145866371: mov rax, qword ptr [rbp + 0x310]
0x145866378: mov qword ptr [rcx], rax
0x14586637b: mov rdx, qword ptr [rbp + 8]
0x14586637f: mov qword ptr [rcx + 8], rdx
0x145866383: mov qword ptr [rcx + 0x10], rax
0x145866387: mov rax, qword ptr [rbp + 0xd0]
0x14586638e: mov qword ptr [rcx + 0x48], rax
0x145866392: mov rax, qword ptr [rbp + 0xd8]
0x145866399: mov qword ptr [rcx + 0x50], rax
0x14586639d: mov qword ptr [rcx + 0x58], r14
0x1458663a1: mov rax, qword ptr [rbp + 0x290]
0x1458663a8: mov qword ptr [rcx + 0x60], rax
0x1458663ac: mov rax, qword ptr [rbp + 0x2f8]
0x1458663b3: mov qword ptr [rcx + 0x68], rax
0x1458663b7: mov rax, qword ptr [rbp + 0x78]
0x1458663bb: mov qword ptr [rcx + 0x70], rax
0x1458663bf: mov rax, qword ptr [rbp + 0x10]
0x1458663c3: mov qword ptr [rcx + 0x78], rax
0x1458663c7: mov rdx, qword ptr [rbp + 0x18]
0x1458663cb: mov qword ptr [rcx + 0x80], rdx
0x1458663d2: mov qword ptr [rcx + 0x88], rax
0x1458663d9: mov rax, qword ptr [rbp + 0x38]
0x1458663dd: mov qword ptr [rcx + 0x90], rax
0x1458663e4: mov rax, qword ptr [rbp + 0x20]
0x1458663e8: mov qword ptr [rcx + 0x98], rax
0x1458663ef: mov rax, qword ptr [rbp - 0x20]
0x1458663f3: mov qword ptr [rcx + 0xa0], rax
0x1458663fa: mov rax, qword ptr [rbp - 0x30]
0x1458663fe: mov qword ptr [rcx + 0x18], rax
0x145866402: mov rax, qword ptr [rbp - 0x28]
0x145866406: mov qword ptr [rcx + 0x20], rax
0x14586640a: mov rax, qword ptr [rbp - 0x40]
0x14586640e: mov qword ptr [rcx + 0x28], rax
0x145866412: mov rax, qword ptr [rbp + 0x50]
0x145866416: mov qword ptr [rcx + 0x40], rax
0x14586641a: movaps xmm0, xmmword ptr [rbp + 0x40]
0x14586641e: movups xmmword ptr [rcx + 0x30], xmm0
0x145866422: mov rsi, qword ptr [rbp + 0x2d8]
0x145866429: mov rdi, qword ptr [rbp + 0x2e0]
0x145866430: test rdi, rdi
0x145866433: je 0x145866462
0x145866435: lea rbx, [rsi + 8]
0x145866439: jmp 0x145866449
0x14586643b: nop dword ptr [rax + rax]
0x145866440: add rbx, 0x18
0x145866444: dec rdi
0x145866447: je 0x145866462
0x145866449: mov rdx, qword ptr [rbx - 8]
0x14586644d: test rdx, rdx
0x145866450: je 0x145866440
0x145866452: mov rcx, qword ptr [rbx]
0x145866455: mov r8d, 1
0x14586645b: call 0x1400021d0
0x145866460: jmp 0x145866440
0x145866462: mov rax, qword ptr [rbp + 0x2d0]
0x145866469: test rax, rax
0x14586646c: je 0x145866484
0x14586646e: shl rax, 3
0x145866472: lea rdx, [rax + rax*2]
0x145866476: mov r8d, 8
0x14586647c: mov rcx, rsi
0x14586647f: call 0x1400021d0
0x145866484: mov rax, qword ptr [rbp - 0x38]
0x145866488: movaps xmm6, xmmword ptr [rbp + 0x330]
0x14586648f: movaps xmm7, xmmword ptr [rbp + 0x340]
0x145866496: movaps xmm8, xmmword ptr [rbp + 0x350]
0x14586649e: movaps xmm9, xmmword ptr [rbp + 0x360]
0x1458664a6: movaps xmm10, xmmword ptr [rbp + 0x370]
0x1458664ae: movaps xmm11, xmmword ptr [rbp + 0x380]
0x1458664b6: movaps xmm12, xmmword ptr [rbp + 0x390]
0x1458664be: movaps xmm13, xmmword ptr [rbp + 0x3a0]
0x1458664c6: movaps xmm14, xmmword ptr [rbp + 0x3b0]
0x1458664ce: movaps xmm15, xmmword ptr [rbp + 0x3c0]
0x1458664d6: add rsp, 0x458
0x1458664dd: pop rbx
0x1458664de: pop rdi
0x1458664df: pop rsi
0x1458664e0: pop r12
0x1458664e2: pop r13
0x1458664e4: pop r14
0x1458664e6: pop r15
0x1458664e8: pop rbp
0x1458664e9: ret
0x1458664ea: mov byte ptr [rbp + 0x325], 1
0x1458664f1: mov byte ptr [rbp + 0x324], 1
0x1458664f8: mov qword ptr [rsp + 0x20], 1
0x145866501: lea rcx, [rbp + 0x278]
0x145866508: mov r8d, 1
0x14586650e: mov r9d, 1
0x145866514: mov rdx, r15
0x145866517: call 0x145d14a10
0x14586651c: nop
0x14586651d: mov r15, qword ptr [rbp + 0x288]
0x145866524: jmp 0x145862a84
0x145866529: mov qword ptr [rbp + 0x310], rdi
0x145866530: mov qword ptr [rsp + 0x20], 1
0x145866539: lea rcx, [rbp + 0x278]
0x145866540: mov r9d, 1
0x145866546: mov rdx, r15
0x145866549: mov r8, rsi
0x14586654c: call 0x145d14a10
0x145866551: nop
0x145866552: mov r12, qword ptr [rbp + 0x280]
0x145866559: mov r15, qword ptr [rbp + 0x288]
0x145866560: mov rdi, qword ptr [rbp + 0x310]
0x145866567: jmp 0x145862bf9
0x14586656c: mov qword ptr [rbp + 0x2f8], rbx
0x145866573: mov qword ptr [rbp + 0x310], rdi
0x14586657a: mov qword ptr [rsp + 0x20], 1
0x145866583: lea rcx, [rbp + 0x278]
0x14586658a: mov r9d, 1
0x145866590: mov rdx, r14
0x145866593: mov r8, rsi
0x145866596: call 0x145d14a10
0x14586659b: nop
0x14586659c: mov r14, qword ptr [rbp + 0x288]
0x1458665a3: mov rdi, qword ptr [rbp + 0x310]
0x1458665aa: mov rbx, qword ptr [rbp + 0x2f8]
0x1458665b1: jmp 0x145864643
0x1458665b6: mov qword ptr [rbp + 0x2f8], rbx
0x1458665bd: mov qword ptr [rbp + 0x310], rdi
0x1458665c4: mov qword ptr [rsp + 0x20], 1
0x1458665cd: lea rcx, [rbp + 0x278]
0x1458665d4: mov r9d, 1
0x1458665da: mov rdx, r14
0x1458665dd: mov r8, rsi
0x1458665e0: call 0x145d14a10
0x1458665e5: nop
0x1458665e6: mov r14, qword ptr [rbp + 0x288]
0x1458665ed: mov rdi, qword ptr [rbp + 0x310]
0x1458665f4: mov rbx, qword ptr [rbp + 0x2f8]
0x1458665fb: jmp 0x145864982
0x145866600: mov qword ptr [rbp + 0x308], rbx
0x145866607: mov qword ptr [rsp + 0x20], 1
0x145866610: lea rcx, [rbp + 0x98]
0x145866617: mov r9d, 1
0x14586661d: mov rdx, rdi
0x145866620: mov r8, rsi
0x145866623: call 0x145d14a10
0x145866628: nop
0x145866629: mov rdi, qword ptr [rbp + 0xa8]
0x145866630: mov rbx, qword ptr [rbp + 0x308]
0x145866637: jmp 0x145865b03
0x14586663c: mov rdx, qword ptr [rbp + 0xf0]
0x145866643: mov rcx, rbx
0x145866646: call 0x145eb6fcb
0x14586664b: nop
0x14586664c: ud2
