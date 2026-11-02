0x1458e4ae0: push r15
0x1458e4ae2: push r14
0x1458e4ae4: push r13
0x1458e4ae6: push r12
0x1458e4ae8: push rsi
0x1458e4ae9: push rdi
0x1458e4aea: push rbp
0x1458e4aeb: push rbx
0x1458e4aec: sub rsp, 0x58
0x1458e4af0: mov rdi, rdx
0x1458e4af3: mov qword ptr [rsp + 0x48], rcx
0x1458e4af8: mov rsi, qword ptr [rdx]
0x1458e4afb: mov rax, qword ptr [rdx + 0x10]
0x1458e4aff: mov qword ptr [rsp + 0x40], rax
0x1458e4b04: mov r15, qword ptr [rdx + 0x28]
0x1458e4b08: mov qword ptr [rsp + 0x38], rsi
0x1458e4b0d: test r15, r15
0x1458e4b10: je 0x1458e6276
0x1458e4b16: mov r12, qword ptr [rdi + 8]
0x1458e4b1a: mov rax, qword ptr [rdi + 0x18]
0x1458e4b1e: mov rsi, qword ptr [rsp + 0x38]
0x1458e4b23: mov qword ptr [rsp + 0x50], rax
0x1458e4b28: cmp r12, rax
0x1458e4b2b: je 0x1458e6276
0x1458e4b31: mov rbx, qword ptr [rsp + 0x38]
0x1458e4b36: jmp 0x1458e4b7c
0x1458e4b38: nop dword ptr [rax + rax]
0x1458e4b40: lea rsi, [rbx + 0x20]
0x1458e4b44: dec r15
0x1458e4b47: mov qword ptr [rdi + 0x28], r15
0x1458e4b4b: mov qword ptr [rbx], rdx
0x1458e4b4e: mov qword ptr [rbx + 8], rcx
0x1458e4b52: mov qword ptr [rbx + 0x10], rax
0x1458e4b56: mov byte ptr [rbx + 0x18], r14b
0x1458e4b5a: mov eax, dword ptr [rsp + 0x30]
0x1458e4b5e: mov ecx, dword ptr [rsp + 0x33]
0x1458e4b62: mov dword ptr [rbx + 0x19], eax
0x1458e4b65: mov dword ptr [rbx + 0x1c], ecx
0x1458e4b68: mov rbx, rsi
0x1458e4b6b: je 0x1458e6276
0x1458e4b71: cmp r12, qword ptr [rsp + 0x50]
0x1458e4b76: je 0x1458e6276
0x1458e4b7c: mov rdx, qword ptr [r12]
0x1458e4b80: mov rcx, qword ptr [r12 + 8]
0x1458e4b85: mov rax, qword ptr [r12 + 0x10]
0x1458e4b8a: movzx r14d, byte ptr [r12 + 0x18]
0x1458e4b90: mov r9d, dword ptr [r12 + 0x1c]
0x1458e4b95: mov dword ptr [rsp + 0x33], r9d
0x1458e4b9a: mov r9d, dword ptr [r12 + 0x19]
0x1458e4b9f: mov dword ptr [rsp + 0x30], r9d
0x1458e4ba4: add r12, 0x20
0x1458e4ba8: mov qword ptr [rdi + 8], r12
0x1458e4bac: cmp r14b, 4
0x1458e4bb0: ja 0x1458e5b70
0x1458e4bb6: cmp rax, 0xa
0x1458e4bba: jae 0x1458e4c20
0x1458e4bbc: xor ebp, ebp
0x1458e4bbe: lea r9, [rax - 7]
0x1458e4bc2: cmp r9, 5
0x1458e4bc6: ja 0x1458e4e05
0x1458e4bcc: lea r11, [rip + 0x1a4a691]
0x1458e4bd3: movsxd r10, dword ptr [r11 + r9*4]
0x1458e4bd7: add r10, r11
0x1458e4bda: xor r9d, r9d
0x1458e4bdd: jmp r10
0x1458e4be0: mov r9d, dword ptr [rip + 0x172040f]
0x1458e4be7: xor r9d, dword ptr [rcx]
0x1458e4bea: mov r10d, dword ptr [rip + 0x1720408]
0x1458e4bf1: xor r10d, dword ptr [rcx + 3]
0x1458e4bf5: or r10d, r9d
0x1458e4bf8: je 0x1458e4b40
0x1458e4bfe: mov bpl, 1
0x1458e4c01: xor r9d, r9d
0x1458e4c04: cmp rax, 8
0x1458e4c08: sete r11b
0x1458e4c0c: je 0x1458e4df4
0x1458e4c12: jmp 0x1458e4e12
0x1458e4c17: nop word ptr [rax + rax]
0x1458e4c20: mov r9, qword ptr [rcx]
0x1458e4c23: movabs r10, 0x7261646e6567656c
0x1458e4c2d: xor r9, r10
0x1458e4c30: movzx r10d, word ptr [rcx + 8]
0x1458e4c35: xor r10, 0x3a79
0x1458e4c3c: or r10, r9
0x1458e4c3f: je 0x1458e4cb3
0x1458e4c41: cmp rax, 9
0x1458e4c45: je 0x1458e4d92
0x1458e4c4b: cmp rax, 0xb
0x1458e4c4f: je 0x1458e4cfe
0x1458e4c55: cmp rax, 0xc
0x1458e4c59: jne 0x1458e4de5
0x1458e4c5f: mov r9, qword ptr [rip + 0x17203c5]
0x1458e4c66: xor r9, qword ptr [rcx]
0x1458e4c69: mov r10d, dword ptr [rip + 0x17203c3]
0x1458e4c70: xor r10d, dword ptr [rcx + 8]
0x1458e4c74: or r10, r9
0x1458e4c77: je 0x1458e4b40
0x1458e4c7d: mov r9, qword ptr [rip + 0x1720426]
0x1458e4c84: xor r9, qword ptr [rcx]
0x1458e4c87: mov r10d, dword ptr [rip + 0x1720424]
0x1458e4c8e: xor r10d, dword ptr [rcx + 8]
0x1458e4c92: or r10, r9
0x1458e4c95: je 0x1458e4b40
0x1458e4c9b: mov r9b, 1
0x1458e4c9e: xor ebp, ebp
0x1458e4ca0: cmp rax, 8
0x1458e4ca4: sete r11b
0x1458e4ca8: je 0x1458e4df4
0x1458e4cae: jmp 0x1458e4e12
0x1458e4cb3: lea r9, [rcx + 0xa]
0x1458e4cb7: xor esi, esi
0x1458e4cb9: lea r11, [rax - 0x10]
0x1458e4cbd: cmp r11, 7
0x1458e4cc1: ja 0x1458e5205
0x1458e4cc7: lea r10, [rip + 0x1a4a2de]
0x1458e4cce: movsxd rbp, dword ptr [r10 + r11*4]
0x1458e4cd2: add rbp, r10
0x1458e4cd5: jmp rbp
0x1458e4cd7: mov esi, dword ptr [rip + 0x13dd4b9]
0x1458e4cdd: xor esi, dword ptr [r9]
0x1458e4ce0: movzx ebp, word ptr [rip + 0x13dd4b3]
0x1458e4ce7: xor bp, word ptr [r9 + 4]
0x1458e4cec: movzx ebp, bp
0x1458e4cef: or ebp, esi
0x1458e4cf1: je 0x1458e4b40
0x1458e4cf7: xor esi, esi
0x1458e4cf9: jmp 0x1458e5205
0x1458e4cfe: mov r9, qword ptr [rip + 0x17203fa]
0x1458e4d05: xor r9, qword ptr [rcx]
0x1458e4d08: mov r10, qword ptr [rip + 0x17203f3]
0x1458e4d0f: xor r10, qword ptr [rcx + 3]
0x1458e4d13: or r10, r9
0x1458e4d16: je 0x1458e4b40
0x1458e4d1c: mov r9, qword ptr [rip + 0x1720493]
0x1458e4d23: xor r9, qword ptr [rcx]
0x1458e4d26: mov r10, qword ptr [rip + 0x172048c]
0x1458e4d2d: xor r10, qword ptr [rcx + 3]
0x1458e4d31: or r10, r9
0x1458e4d34: je 0x1458e4b40
0x1458e4d3a: mov r9, qword ptr [rip + 0x17204ba]
0x1458e4d41: xor r9, qword ptr [rcx]
0x1458e4d44: mov r10, qword ptr [rip + 0x17204b3]
0x1458e4d4b: xor r10, qword ptr [rcx + 3]
0x1458e4d4f: or r10, r9
0x1458e4d52: je 0x1458e4b40
0x1458e4d58: mov r9, qword ptr [rip + 0x172055f]
0x1458e4d5f: xor r9, qword ptr [rcx]
0x1458e4d62: mov r10, qword ptr [rip + 0x1720558]
0x1458e4d69: xor r10, qword ptr [rcx + 3]
0x1458e4d6d: or r10, r9
0x1458e4d70: je 0x1458e4b40
0x1458e4d76: xor r11d, r11d
0x1458e4d79: mov dword ptr [rsp + 0x28], 0
0x1458e4d81: xor ebp, ebp
0x1458e4d83: cmp rax, 3
0x1458e4d87: je 0x1458e4e45
0x1458e4d8d: jmp 0x1458e4eaf
0x1458e4d92: mov r9, qword ptr [rip + 0x17202d1]
0x1458e4d99: xor r9, qword ptr [rcx]
0x1458e4d9c: movzx r10d, byte ptr [rip + 0x17202ce]
0x1458e4da4: xor r10b, byte ptr [rcx + 8]
0x1458e4da8: movzx r10d, r10b
0x1458e4dac: or r10, r9
0x1458e4daf: je 0x1458e4b40
0x1458e4db5: mov r10b, 1
0x1458e4db8: xor ebp, ebp
0x1458e4dba: mov dword ptr [rsp + 0x28], 0
0x1458e4dc2: xor r11d, r11d
0x1458e4dc5: cmp rax, 0xa
0x1458e4dc9: je 0x1458e4ebc
0x1458e4dcf: mov dword ptr [rsp + 0x2c], 0
0x1458e4dd7: test r10b, r10b
0x1458e4dda: jne 0x1458e4ef6
0x1458e4de0: jmp 0x1458e4f1f
0x1458e4de5: xor ebp, ebp
0x1458e4de7: xor r9d, r9d
0x1458e4dea: cmp rax, 8
0x1458e4dee: sete r11b
0x1458e4df2: jne 0x1458e4e12
0x1458e4df4: mov r10, qword ptr [rip + 0x172036d]
0x1458e4dfb: cmp r10, qword ptr [rcx]
0x1458e4dfe: jne 0x1458e4e12
0x1458e4e00: jmp 0x1458e4b40
0x1458e4e05: xor r9d, r9d
0x1458e4e08: cmp rax, 8
0x1458e4e0c: sete r11b
0x1458e4e10: je 0x1458e4df4
0x1458e4e12: test r9b, r9b
0x1458e4e15: je 0x1458e4ea1
0x1458e4e1b: mov r10, qword ptr [rip + 0x172043f]
0x1458e4e22: xor r10, qword ptr [rcx]
0x1458e4e25: mov esi, dword ptr [rip + 0x172043e]
0x1458e4e2b: xor esi, dword ptr [rcx + 8]
0x1458e4e2e: mov r8b, 1
0x1458e4e31: mov dword ptr [rsp + 0x28], r8d
0x1458e4e36: or rsi, r10
0x1458e4e39: je 0x1458e4b40
0x1458e4e3f: cmp rax, 3
0x1458e4e43: jne 0x1458e4eaf
0x1458e4e45: movzx r10d, word ptr [rip + 0x17204a0]
0x1458e4e4d: xor r10w, word ptr [rcx]
0x1458e4e51: movzx esi, byte ptr [rip + 0x1720497]
0x1458e4e58: xor sil, byte ptr [rcx + 2]
0x1458e4e5c: movzx esi, sil
0x1458e4e60: or si, r10w
0x1458e4e64: je 0x1458e4b40
0x1458e4e6a: movzx r10d, word ptr [rip + 0x17204dd]
0x1458e4e72: xor r10w, word ptr [rcx]
0x1458e4e76: movzx esi, byte ptr [rip + 0x17204d4]
0x1458e4e7d: xor sil, byte ptr [rcx + 2]
0x1458e4e81: movzx esi, sil
0x1458e4e85: or si, r10w
0x1458e4e89: je 0x1458e4b40
0x1458e4e8f: xor r10d, r10d
0x1458e4e92: mov dword ptr [rsp + 0x2c], 0
0x1458e4e9a: test r10b, r10b
0x1458e4e9d: jne 0x1458e4ef6
0x1458e4e9f: jmp 0x1458e4f1f
0x1458e4ea1: mov dword ptr [rsp + 0x28], 0
0x1458e4ea9: cmp rax, 3
0x1458e4ead: je 0x1458e4e45
0x1458e4eaf: xor r10d, r10d
0x1458e4eb2: cmp rax, 0xa
0x1458e4eb6: jne 0x1458e4dcf
0x1458e4ebc: mov r9d, r14d
0x1458e4ebf: mov r14, qword ptr [rip + 0x172045c]
0x1458e4ec6: xor r14, qword ptr [rcx]
0x1458e4ec9: movzx esi, word ptr [rip + 0x172045a]
0x1458e4ed0: xor si, word ptr [rcx + 8]
0x1458e4ed4: movzx esi, si
0x1458e4ed7: mov r8, rdi
0x1458e4eda: mov r13b, 1
0x1458e4edd: mov dword ptr [rsp + 0x2c], r13d
0x1458e4ee2: mov rdi, r8
0x1458e4ee5: or rsi, r14
0x1458e4ee8: mov r14d, r9d
0x1458e4eeb: je 0x1458e4b40
0x1458e4ef1: test r10b, r10b
0x1458e4ef4: je 0x1458e4f1f
0x1458e4ef6: mov rsi, qword ptr [rip + 0x17204a0]
0x1458e4efd: xor rsi, qword ptr [rcx]
0x1458e4f00: mov r8d, r14d
0x1458e4f03: movzx r14d, byte ptr [rip + 0x172049a]
0x1458e4f0b: xor r14b, byte ptr [rcx + 8]
0x1458e4f0f: movzx r14d, r14b
0x1458e4f13: or r14, rsi
0x1458e4f16: mov r14d, r8d
0x1458e4f19: je 0x1458e4b40
0x1458e4f1f: cmp rax, 6
0x1458e4f23: jne 0x1458e4f72
0x1458e4f25: mov esi, dword ptr [rip + 0x17204be]
0x1458e4f2b: xor esi, dword ptr [rcx]
0x1458e4f2d: mov r13d, r14d
0x1458e4f30: movzx r14d, word ptr [rip + 0x17204b5]
0x1458e4f38: xor r14w, word ptr [rcx + 4]
0x1458e4f3d: movzx r14d, r14w
0x1458e4f41: or r14d, esi
0x1458e4f44: mov r14d, r13d
0x1458e4f47: je 0x1458e4b40
0x1458e4f4d: mov esi, dword ptr [rip + 0x17204d1]
0x1458e4f53: xor esi, dword ptr [rcx]
0x1458e4f55: movzx r14d, word ptr [rip + 0x17204cb]
0x1458e4f5d: xor r14w, word ptr [rcx + 4]
0x1458e4f62: movzx r14d, r14w
0x1458e4f66: or r14d, esi
0x1458e4f69: mov r14d, r13d
0x1458e4f6c: je 0x1458e4b40
0x1458e4f72: test r11b, r11b
0x1458e4f75: je 0x1458e4f87
0x1458e4f77: mov rsi, qword ptr [rip + 0x17204ed]
0x1458e4f7e: cmp rsi, qword ptr [rcx]
0x1458e4f81: je 0x1458e4b40
0x1458e4f87: cmp byte ptr [rsp + 0x28], 0
0x1458e4f8c: je 0x1458e4fb2
0x1458e4f8e: mov rsi, qword ptr [rip + 0x172051c]
0x1458e4f95: xor rsi, qword ptr [rcx]
0x1458e4f98: mov r8d, r14d
0x1458e4f9b: mov r14d, dword ptr [rip + 0x1720517]
0x1458e4fa2: xor r14d, dword ptr [rcx + 8]
0x1458e4fa6: or r14, rsi
0x1458e4fa9: mov r14d, r8d
0x1458e4fac: je 0x1458e4b40
0x1458e4fb2: cmp rax, 6
0x1458e4fb6: jne 0x1458e4fe0
0x1458e4fb8: mov esi, dword ptr [rip + 0x172053a]
0x1458e4fbe: xor esi, dword ptr [rcx]
0x1458e4fc0: mov r8d, r14d
0x1458e4fc3: movzx r14d, word ptr [rip + 0x1720531]
0x1458e4fcb: xor r14w, word ptr [rcx + 4]
0x1458e4fd0: movzx r14d, r14w
0x1458e4fd4: or r14d, esi
0x1458e4fd7: mov r14d, r8d
0x1458e4fda: je 0x1458e4b40
0x1458e4fe0: cmp byte ptr [rsp + 0x28], 0
0x1458e4fe5: je 0x1458e500b
0x1458e4fe7: mov rsi, qword ptr [rip + 0x1720543]
0x1458e4fee: xor rsi, qword ptr [rcx]
0x1458e4ff1: mov r8d, r14d
0x1458e4ff4: mov r14d, dword ptr [rip + 0x172053e]
0x1458e4ffb: xor r14d, dword ptr [rcx + 8]
0x1458e4fff: or r14, rsi
0x1458e5002: mov r14d, r8d
0x1458e5005: je 0x1458e4b40
0x1458e500b: test r11b, r11b
0x1458e500e: je 0x1458e5020
0x1458e5010: mov rsi, qword ptr [rip + 0x172056b]
0x1458e5017: cmp rsi, qword ptr [rcx]
0x1458e501a: je 0x1458e4b40
0x1458e5020: test r10b, r10b
0x1458e5023: je 0x1458e504e
0x1458e5025: mov rsi, qword ptr [rip + 0x172059e]
0x1458e502c: xor rsi, qword ptr [rcx]
0x1458e502f: mov r8d, r14d
0x1458e5032: movzx r14d, byte ptr [rip + 0x1720598]
0x1458e503a: xor r14b, byte ptr [rcx + 8]
0x1458e503e: movzx r14d, r14b
0x1458e5042: or r14, rsi
0x1458e5045: mov r14d, r8d
0x1458e5048: je 0x1458e4b40
0x1458e504e: cmp rax, 0x10
0x1458e5052: jne 0x1458e5094
0x1458e5054: movdqu xmm0, xmmword ptr [rip + 0x17205c3]
0x1458e505c: movdqu xmm1, xmmword ptr [rcx]
0x1458e5060: pcmpeqb xmm1, xmm0
0x1458e5064: pmovmskb esi, xmm1
0x1458e5068: cmp esi, 0xffff
0x1458e506e: je 0x1458e4b40
0x1458e5074: movdqu xmm0, xmmword ptr [rip + 0x1720ca8]
0x1458e507c: movdqu xmm1, xmmword ptr [rcx]
0x1458e5080: pcmpeqb xmm1, xmm0
0x1458e5084: pmovmskb esi, xmm1
0x1458e5088: cmp esi, 0xffff
0x1458e508e: je 0x1458e4b40
0x1458e5094: test bpl, bpl
0x1458e5097: je 0x1458e50bb
0x1458e5099: mov esi, dword ptr [rip + 0x1720d01]
0x1458e509f: xor esi, dword ptr [rcx]
0x1458e50a1: mov r8d, r14d
0x1458e50a4: mov r14d, dword ptr [rip + 0x1720cf8]
0x1458e50ab: xor r14d, dword ptr [rcx + 3]
0x1458e50af: or r14d, esi
0x1458e50b2: mov r14d, r8d
0x1458e50b5: je 0x1458e4b40
0x1458e50bb: cmp rax, 0xf
0x1458e50bf: jne 0x1458e50e5
0x1458e50c1: mov rsi, qword ptr [rip + 0x1720d58]
0x1458e50c8: xor rsi, qword ptr [rcx]
0x1458e50cb: mov r8d, r14d
0x1458e50ce: mov r14, qword ptr [rip + 0x1720d52]
0x1458e50d5: xor r14, qword ptr [rcx + 7]
0x1458e50d9: or r14, rsi
0x1458e50dc: mov r14d, r8d
0x1458e50df: je 0x1458e4b40
0x1458e50e5: test bpl, bpl
0x1458e50e8: je 0x1458e5103
0x1458e50ea: mov esi, dword ptr [rip + 0x1720df8]
0x1458e50f0: xor esi, dword ptr [rcx]
0x1458e50f2: mov ebp, dword ptr [rip + 0x1720df3]
0x1458e50f8: xor ebp, dword ptr [rcx + 3]
0x1458e50fb: or ebp, esi
0x1458e50fd: je 0x1458e4b40
0x1458e5103: cmp rax, 0xe
0x1458e5107: jne 0x1458e512d
0x1458e5109: mov rsi, qword ptr [rip + 0x1720e98]
0x1458e5110: xor rsi, qword ptr [rcx]
0x1458e5113: mov r8d, r14d
0x1458e5116: mov r14, qword ptr [rip + 0x1720e91]
0x1458e511d: xor r14, qword ptr [rcx + 6]
0x1458e5121: or r14, rsi
0x1458e5124: mov r14d, r8d
0x1458e5127: je 0x1458e4b40
0x1458e512d: test r10b, r10b
0x1458e5130: je 0x1458e515a
0x1458e5132: mov rsi, qword ptr [rip + 0x1720f2f]
0x1458e5139: xor rsi, qword ptr [rcx]
0x1458e513c: movzx ebp, byte ptr [rip + 0x1720f2d]
0x1458e5143: xor bpl, byte ptr [rcx + 8]
0x1458e5147: mov r8d, r14d
0x1458e514a: movzx r14d, bpl
0x1458e514e: or r14, rsi
0x1458e5151: mov r14d, r8d
0x1458e5154: je 0x1458e4b40
0x1458e515a: test r11b, r11b
0x1458e515d: je 0x1458e516f
0x1458e515f: mov r11, qword ptr [rip + 0x1720ff2]
0x1458e5166: cmp r11, qword ptr [rcx]
0x1458e5169: je 0x1458e4b40
0x1458e516f: cmp rax, 6
0x1458e5173: jne 0x1458e54d1
0x1458e5179: mov r11d, dword ptr [rip + 0x1721090]
0x1458e5180: xor r11d, dword ptr [rcx]
0x1458e5183: movzx esi, word ptr [rip + 0x172108a]
0x1458e518a: xor si, word ptr [rcx + 4]
0x1458e518e: movzx esi, si
0x1458e5191: or esi, r11d
0x1458e5194: jne 0x1458e5aab
0x1458e519a: jmp 0x1458e4b40
0x1458e519f: mov r10, qword ptr [rip + 0x13dcfff]
0x1458e51a6: xor r10, qword ptr [r9]
0x1458e51a9: mov esi, dword ptr [rip + 0x13dcffe]
0x1458e51af: xor esi, dword ptr [r9 + 8]
0x1458e51b3: or rsi, r10
0x1458e51b6: je 0x1458e4b40
0x1458e51bc: mov r10, qword ptr [rip + 0x13dd00c]
0x1458e51c3: xor r10, qword ptr [r9]
0x1458e51c6: mov esi, dword ptr [rip + 0x13dd00b]
0x1458e51cc: xor esi, dword ptr [r9 + 8]
0x1458e51d0: or rsi, r10
0x1458e51d3: je 0x1458e4b40
0x1458e51d9: xor esi, esi
0x1458e51db: jmp 0x1458e5307
0x1458e51e0: mov rbp, qword ptr [rip + 0x13dcfb5]
0x1458e51e7: xor rbp, qword ptr [r9]
0x1458e51ea: movzx esi, byte ptr [rip + 0x13dcfb3]
0x1458e51f1: xor sil, byte ptr [r9 + 8]
0x1458e51f5: movzx r10d, sil
0x1458e51f9: mov sil, 1
0x1458e51fc: or r10, rbp
0x1458e51ff: je 0x1458e4b40
0x1458e5205: cmp rax, 0x14
0x1458e5209: je 0x1458e52e5
0x1458e520f: cmp rax, 0x11
0x1458e5213: jne 0x1458e5307
0x1458e5219: mov r10d, dword ptr [rip + 0x13dcf9e]
0x1458e5220: xor r10d, dword ptr [r9]
0x1458e5223: mov ebp, dword ptr [rip + 0x13dcf98]
0x1458e5229: xor ebp, dword ptr [r9 + 3]
0x1458e522d: or ebp, r10d
0x1458e5230: jne 0x1458e5307
0x1458e5236: jmp 0x1458e4b40
0x1458e523b: mov r10, qword ptr [rip + 0x13dcf6f]
0x1458e5242: xor r10, qword ptr [r9]
0x1458e5245: mov rsi, qword ptr [rip + 0x13dcf6a]
0x1458e524c: xor rsi, qword ptr [r9 + 5]
0x1458e5250: or rsi, r10
0x1458e5253: je 0x1458e4b40
0x1458e5259: xor esi, esi
0x1458e525b: lea rbp, [rax - 0xf]
0x1458e525f: cmp rbp, 0xc
0x1458e5263: ja 0x1458e5696
0x1458e5269: lea r10, [rip + 0x1a49d90]
0x1458e5270: mov r8d, r14d
0x1458e5273: mov r14, r10
0x1458e5276: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e527a: add r10, r14
0x1458e527d: mov r14d, r8d
0x1458e5280: jmp r10
0x1458e5283: mov r10, qword ptr [rip + 0x13dd263]
0x1458e528a: xor r10, qword ptr [r9]
0x1458e528d: movzx esi, word ptr [rip + 0x13dd261]
0x1458e5294: xor si, word ptr [r9 + 8]
0x1458e5299: movzx esi, si
0x1458e529c: or rsi, r10
0x1458e529f: je 0x1458e4b40
0x1458e52a5: mov r10, qword ptr [rip + 0x13dd27b]
0x1458e52ac: xor r10, qword ptr [r9]
0x1458e52af: movzx esi, word ptr [rip + 0x13dd279]
0x1458e52b6: xor si, word ptr [r9 + 8]
0x1458e52bb: movzx esi, si
0x1458e52be: or rsi, r10
0x1458e52c1: je 0x1458e4b40
0x1458e52c7: mov r10, qword ptr [rip + 0x13dd272]
0x1458e52ce: xor r10, qword ptr [r9]
0x1458e52d1: movzx esi, word ptr [rip + 0x13dd270]
0x1458e52d8: xor si, word ptr [r9 + 8]
0x1458e52dd: movzx esi, si
0x1458e52e0: jmp 0x1458e5648
0x1458e52e5: mov r10, qword ptr [rip + 0x13dced9]
0x1458e52ec: xor r10, qword ptr [r9]
0x1458e52ef: movzx ebp, word ptr [rip + 0x13dced7]
0x1458e52f6: xor bp, word ptr [r9 + 8]
0x1458e52fb: movzx ebp, bp
0x1458e52fe: or rbp, r10
0x1458e5301: je 0x1458e4b40
0x1458e5307: cmp rax, 0xe
0x1458e530b: je 0x1458e5350
0x1458e530d: cmp rax, 0x15
0x1458e5311: jne 0x1458e5360
0x1458e5313: mov r10, qword ptr [rip + 0x13dcec1]
0x1458e531a: xor r10, qword ptr [r9]
0x1458e531d: mov rbp, qword ptr [rip + 0x13dceba]
0x1458e5324: xor rbp, qword ptr [r9 + 3]
0x1458e5328: or rbp, r10
0x1458e532b: je 0x1458e4b40
0x1458e5331: mov r10, qword ptr [rip + 0x13dceb2]
0x1458e5338: xor r10, qword ptr [r9]
0x1458e533b: mov rbp, qword ptr [rip + 0x13dceab]
0x1458e5342: xor rbp, qword ptr [r9 + 3]
0x1458e5346: or rbp, r10
0x1458e5349: jne 0x1458e5360
0x1458e534b: jmp 0x1458e4b40
0x1458e5350: mov r10d, dword ptr [rip + 0x13dce8f]
0x1458e5357: cmp r10d, dword ptr [r9]
0x1458e535a: je 0x1458e4b40
0x1458e5360: test sil, sil
0x1458e5363: je 0x1458e5387
0x1458e5365: mov r10, qword ptr [rip + 0x13dce89]
0x1458e536c: xor r10, qword ptr [r9]
0x1458e536f: movzx esi, byte ptr [rip + 0x13dce87]
0x1458e5376: xor sil, byte ptr [r9 + 8]
0x1458e537a: movzx esi, sil
0x1458e537e: or rsi, r10
0x1458e5381: je 0x1458e4b40
0x1458e5387: xor esi, esi
0x1458e5389: lea rbp, [rax - 0xf]
0x1458e538d: cmp rbp, 0xc
0x1458e5391: ja 0x1458e5696
0x1458e5397: lea r10, [rip + 0x1a49c2e]
0x1458e539e: mov r8d, r14d
0x1458e53a1: mov r14, r10
0x1458e53a4: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e53a8: add r10, r14
0x1458e53ab: mov r14d, r8d
0x1458e53ae: jmp r10
0x1458e53b1: mov r10, qword ptr [rip + 0x13dcf81]
0x1458e53b8: cmp r10, qword ptr [r9]
0x1458e53bb: jne 0x1458e5259
0x1458e53c1: jmp 0x1458e4b40
0x1458e53c6: movdqu xmm0, xmmword ptr [rip + 0x13dcf9f]
0x1458e53ce: movdqu xmm1, xmmword ptr [r9]
0x1458e53d3: pcmpeqb xmm1, xmm0
0x1458e53d7: movzx r10d, byte ptr [rip + 0x13dcf9e]
0x1458e53df: movzx esi, byte ptr [r9 + 0x10]
0x1458e53e4: movd xmm0, r10d
0x1458e53e9: movd xmm2, esi
0x1458e53ed: pcmpeqb xmm2, xmm0
0x1458e53f1: pand xmm2, xmm1
0x1458e53f5: pmovmskb r10d, xmm2
0x1458e53fa: cmp r10d, 0xffff
0x1458e5401: jne 0x1458e5565
0x1458e5407: jmp 0x1458e4b40
0x1458e540c: mov r10, qword ptr [rip + 0x13dcf82]
0x1458e5413: xor r10, qword ptr [r9]
0x1458e5416: mov rsi, qword ptr [rip + 0x13dcf7b]
0x1458e541d: xor rsi, qword ptr [r9 + 3]
0x1458e5421: or rsi, r10
0x1458e5424: je 0x1458e4b40
0x1458e542a: mov r10, qword ptr [rip + 0x13dd0b1]
0x1458e5431: xor r10, qword ptr [r9]
0x1458e5434: mov rsi, qword ptr [rip + 0x13dd0aa]
0x1458e543b: xor rsi, qword ptr [r9 + 3]
0x1458e543f: or rsi, r10
0x1458e5442: jne 0x1458e55d0
0x1458e5448: jmp 0x1458e4b40
0x1458e544d: mov r10, qword ptr [rip + 0x13dcf34]
0x1458e5454: xor r10, qword ptr [r9]
0x1458e5457: mov rsi, qword ptr [rip + 0x13dcf2f]
0x1458e545e: xor rsi, qword ptr [r9 + 5]
0x1458e5462: jmp 0x1458e555c
0x1458e5467: mov r10, qword ptr [rip + 0x13dcef6]
0x1458e546e: xor r10, qword ptr [r9]
0x1458e5471: movzx esi, byte ptr [rip + 0x13dcef4]
0x1458e5478: xor sil, byte ptr [r9 + 8]
0x1458e547c: movzx esi, sil
0x1458e5480: or rsi, r10
0x1458e5483: je 0x1458e4b40
0x1458e5489: xor esi, esi
0x1458e548b: lea rbp, [rax - 0xf]
0x1458e548f: cmp rbp, 0xa
0x1458e5493: ja 0x1458e5696
0x1458e5499: lea r10, [rip + 0x1a49b94]
0x1458e54a0: mov r8d, r14d
0x1458e54a3: mov r14, r10
0x1458e54a6: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e54aa: add r10, r14
0x1458e54ad: mov r14d, r8d
0x1458e54b0: jmp r10
0x1458e54b3: mov r10, qword ptr [rip + 0x13dd01f]
0x1458e54ba: xor r10, qword ptr [r9]
0x1458e54bd: movzx esi, byte ptr [rip + 0x13dd01d]
0x1458e54c4: xor sil, byte ptr [r9 + 8]
0x1458e54c8: movzx esi, sil
0x1458e54cc: jmp 0x1458e555c
0x1458e54d1: cmp rax, 0xd
0x1458e54d5: jne 0x1458e5a87
0x1458e54db: mov r11, qword ptr [rip + 0x1720de6]
0x1458e54e2: xor r11, qword ptr [rcx]
0x1458e54e5: mov rsi, qword ptr [rip + 0x1720de1]
0x1458e54ec: xor rsi, qword ptr [rcx + 5]
0x1458e54f0: or rsi, r11
0x1458e54f3: je 0x1458e4b40
0x1458e54f9: mov rsi, qword ptr [rip + 0x1720f80]
0x1458e5500: xor rsi, qword ptr [rcx]
0x1458e5503: mov r8d, r14d
0x1458e5506: mov r14, qword ptr [rip + 0x1720f78]
0x1458e550d: xor r14, qword ptr [rcx + 5]
0x1458e5511: mov r11b, 1
0x1458e5514: or r14, rsi
0x1458e5517: mov r14d, r8d
0x1458e551a: jne 0x1458e5aae
0x1458e5520: jmp 0x1458e4b40
0x1458e5525: mov r10, qword ptr [rip + 0x13dce01]
0x1458e552c: xor r10, qword ptr [r9]
0x1458e552f: mov esi, dword ptr [rip + 0x13dce00]
0x1458e5535: xor esi, dword ptr [r9 + 8]
0x1458e5539: or rsi, r10
0x1458e553c: jne 0x1458e5259
0x1458e5542: jmp 0x1458e4b40
0x1458e5547: mov r10, qword ptr [rip + 0x13dcdf3]
0x1458e554e: xor r10, qword ptr [r9]
0x1458e5551: mov rsi, qword ptr [rip + 0x13dcdf0]
0x1458e5558: xor rsi, qword ptr [r9 + 7]
0x1458e555c: or rsi, r10
0x1458e555f: je 0x1458e4b40
0x1458e5565: xor esi, esi
0x1458e5567: lea rbp, [rax - 0xf]
0x1458e556b: cmp rbp, 0xa
0x1458e556f: ja 0x1458e5696
0x1458e5575: lea r10, [rip + 0x1a49ae4]
0x1458e557c: mov r8d, r14d
0x1458e557f: mov r14, r10
0x1458e5582: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e5586: add r10, r14
0x1458e5589: mov r14d, r8d
0x1458e558c: jmp r10
0x1458e558f: mov r10d, dword ptr [rip + 0x13dcf6e]
0x1458e5596: xor r10d, dword ptr [r9]
0x1458e5599: movzx esi, word ptr [rip + 0x13dcf68]
0x1458e55a0: xor si, word ptr [r9 + 4]
0x1458e55a5: movzx esi, si
0x1458e55a8: or esi, r10d
0x1458e55ab: jne 0x1458e55d0
0x1458e55ad: jmp 0x1458e4b40
0x1458e55b2: mov r10, qword ptr [rip + 0x13dcf51]
0x1458e55b9: xor r10, qword ptr [r9]
0x1458e55bc: mov rsi, qword ptr [rip + 0x13dcf4d]
0x1458e55c3: xor rsi, qword ptr [r9 + 6]
0x1458e55c7: or rsi, r10
0x1458e55ca: je 0x1458e4b40
0x1458e55d0: xor esi, esi
0x1458e55d2: lea rbp, [rax - 0xf]
0x1458e55d6: cmp rbp, 9
0x1458e55da: ja 0x1458e5696
0x1458e55e0: lea r10, [rip + 0x1a49ad1]
0x1458e55e7: mov r8d, r14d
0x1458e55ea: mov r14, r10
0x1458e55ed: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e55f1: add r10, r14
0x1458e55f4: mov r14d, r8d
0x1458e55f7: jmp r10
0x1458e55fa: mov r10d, dword ptr [rip + 0x13dd0af]
0x1458e5601: xor r10d, dword ptr [r9]
0x1458e5604: movzx esi, byte ptr [rip + 0x13dd0a9]
0x1458e560b: xor sil, byte ptr [r9 + 4]
0x1458e560f: movzx esi, sil
0x1458e5613: jmp 0x1458e568b
0x1458e5615: mov r10, qword ptr [rip + 0x13dcefc]
0x1458e561c: xor r10, qword ptr [r9]
0x1458e561f: mov rsi, qword ptr [rip + 0x13dcef9]
0x1458e5626: xor rsi, qword ptr [r9 + 7]
0x1458e562a: or rsi, r10
0x1458e562d: je 0x1458e4b40
0x1458e5633: mov r10, qword ptr [rip + 0x13dcef7]
0x1458e563a: xor r10, qword ptr [r9]
0x1458e563d: mov rsi, qword ptr [rip + 0x13dcef4]
0x1458e5644: xor rsi, qword ptr [r9 + 7]
0x1458e5648: or rsi, r10
0x1458e564b: je 0x1458e4b40
0x1458e5651: xor esi, esi
0x1458e5653: lea rbp, [rax - 0xf]
0x1458e5657: cmp rbp, 0xa
0x1458e565b: ja 0x1458e5696
0x1458e565d: lea r10, [rip + 0x1a49a28]
0x1458e5664: mov r8d, r14d
0x1458e5667: mov r14, r10
0x1458e566a: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e566e: add r10, r14
0x1458e5671: mov r14d, r8d
0x1458e5674: jmp r10
0x1458e5677: mov r10d, dword ptr [rip + 0x13dd020]
0x1458e567e: xor r10d, dword ptr [r9]
0x1458e5681: mov esi, dword ptr [rip + 0x13dd01a]
0x1458e5687: xor esi, dword ptr [r9 + 3]
0x1458e568b: or esi, r10d
0x1458e568e: je 0x1458e4b40
0x1458e5694: xor esi, esi
0x1458e5696: lea r10, [rax - 0xa]
0x1458e569a: cmp r10, 8
0x1458e569e: jne 0x1458e56b0
0x1458e56a0: mov r10, qword ptr [rip + 0x13dd02b]
0x1458e56a7: cmp r10, qword ptr [r9]
0x1458e56aa: je 0x1458e4b40
0x1458e56b0: test sil, sil
0x1458e56b3: je 0x1458e56d3
0x1458e56b5: mov r10, qword ptr [rip + 0x13dd01e]
0x1458e56bc: xor r10, qword ptr [r9]
0x1458e56bf: mov rsi, qword ptr [rip + 0x13dd01a]
0x1458e56c6: xor rsi, qword ptr [r9 + 6]
0x1458e56ca: or rsi, r10
0x1458e56cd: je 0x1458e4b40
0x1458e56d3: xor esi, esi
0x1458e56d5: lea rbp, [rax - 0xf]
0x1458e56d9: cmp rbp, 5
0x1458e56dd: ja 0x1458e58ee
0x1458e56e3: lea r10, [rip + 0x1a499f6]
0x1458e56ea: mov r8d, r14d
0x1458e56ed: mov r14, r10
0x1458e56f0: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e56f4: add r10, r14
0x1458e56f7: mov r14d, r8d
0x1458e56fa: jmp r10
0x1458e56fd: mov r10d, dword ptr [rip + 0x13dd116]
0x1458e5704: xor r10d, dword ptr [r9]
0x1458e5707: movzx esi, byte ptr [rip + 0x13dd110]
0x1458e570e: xor sil, byte ptr [r9 + 4]
0x1458e5712: movzx esi, sil
0x1458e5716: or esi, r10d
0x1458e5719: je 0x1458e4b40
0x1458e571f: mov r10d, dword ptr [rip + 0x13dd11c]
0x1458e5726: xor r10d, dword ptr [r9]
0x1458e5729: movzx esi, byte ptr [rip + 0x13dd116]
0x1458e5730: xor sil, byte ptr [r9 + 4]
0x1458e5734: movzx esi, sil
0x1458e5738: jmp 0x1458e583b
0x1458e573d: mov r10, qword ptr [rip + 0x13dce06]
0x1458e5744: xor r10, qword ptr [r9]
0x1458e5747: mov esi, dword ptr [rip + 0x13dce05]
0x1458e574d: xor esi, dword ptr [r9 + 8]
0x1458e5751: or rsi, r10
0x1458e5754: je 0x1458e4b40
0x1458e575a: mov r10, qword ptr [rip + 0x13dcf31]
0x1458e5761: xor r10, qword ptr [r9]
0x1458e5764: mov esi, dword ptr [rip + 0x13dcf30]
0x1458e576a: xor esi, dword ptr [r9 + 8]
0x1458e576e: jmp 0x1458e5862
0x1458e5773: mov r10, qword ptr [rip + 0x13dcbd6]
0x1458e577a: xor r10, qword ptr [r9]
0x1458e577d: movzx esi, word ptr [rip + 0x13dcbd4]
0x1458e5784: xor si, word ptr [r9 + 8]
0x1458e5789: movzx esi, si
0x1458e578c: or rsi, r10
0x1458e578f: je 0x1458e4b40
0x1458e5795: mov r10, qword ptr [rip + 0x13dcbbe]
0x1458e579c: xor r10, qword ptr [r9]
0x1458e579f: movzx esi, word ptr [rip + 0x13dcbbc]
0x1458e57a6: xor si, word ptr [r9 + 8]
0x1458e57ab: movzx esi, si
0x1458e57ae: or rsi, r10
0x1458e57b1: je 0x1458e4b40
0x1458e57b7: mov r10, qword ptr [rip + 0x13dcbc0]
0x1458e57be: xor r10, qword ptr [r9]
0x1458e57c1: movzx esi, word ptr [rip + 0x13dcbbe]
0x1458e57c8: xor si, word ptr [r9 + 8]
0x1458e57cd: movzx esi, si
0x1458e57d0: or rsi, r10
0x1458e57d3: je 0x1458e4b40
0x1458e57d9: mov r10, qword ptr [rip + 0x13dcbc0]
0x1458e57e0: xor r10, qword ptr [r9]
0x1458e57e3: movzx esi, word ptr [rip + 0x13dcbbe]
0x1458e57ea: xor si, word ptr [r9 + 8]
0x1458e57ef: movzx esi, si
0x1458e57f2: or rsi, r10
0x1458e57f5: jne 0x1458e5489
0x1458e57fb: jmp 0x1458e4b40
0x1458e5800: mov r10, qword ptr [rip + 0x13dcee1]
0x1458e5807: xor r10, qword ptr [r9]
0x1458e580a: movzx esi, byte ptr [rip + 0x13dcedf]
0x1458e5811: xor sil, byte ptr [r9 + 8]
0x1458e5815: movzx esi, sil
0x1458e5819: or rsi, r10
0x1458e581c: jne 0x1458e5925
0x1458e5822: jmp 0x1458e4b40
0x1458e5827: mov r10d, dword ptr [rip + 0x13dcff1]
0x1458e582e: xor r10d, dword ptr [r9]
0x1458e5831: mov esi, dword ptr [rip + 0x13dcfeb]
0x1458e5837: xor esi, dword ptr [r9 + 3]
0x1458e583b: or esi, r10d
0x1458e583e: jne 0x1458e58ec
0x1458e5844: jmp 0x1458e4b40
0x1458e5849: mov r10, qword ptr [rip + 0x13dce38]
0x1458e5850: xor r10, qword ptr [r9]
0x1458e5853: movzx esi, word ptr [rip + 0x13dce36]
0x1458e585a: xor si, word ptr [r9 + 8]
0x1458e585f: movzx esi, si
0x1458e5862: or rsi, r10
0x1458e5865: je 0x1458e4b40
0x1458e586b: cmp rax, 0x13
0x1458e586f: je 0x1458e5925
0x1458e5875: cmp rax, 0x14
0x1458e5879: jne 0x1458e58ec
0x1458e587b: mov r10, qword ptr [rip + 0x13dcfa4]
0x1458e5882: xor r10, qword ptr [r9]
0x1458e5885: movzx esi, word ptr [rip + 0x13dcfa2]
0x1458e588c: xor si, word ptr [r9 + 8]
0x1458e5891: movzx esi, si
0x1458e5894: or rsi, r10
0x1458e5897: je 0x1458e4b40
0x1458e589d: xor esi, esi
0x1458e589f: lea rbp, [rax - 0xe]
0x1458e58a3: cmp rbp, 0xf
0x1458e58a7: ja 0x1458e6176
0x1458e58ad: lea r10, [rip + 0x1a498c4]
0x1458e58b4: mov r8d, r14d
0x1458e58b7: mov r14, r10
0x1458e58ba: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e58be: add r10, r14
0x1458e58c1: mov r14d, r8d
0x1458e58c4: jmp r10
0x1458e58c7: mov r10, qword ptr [rip + 0x13dd459]
0x1458e58ce: cmp r10, qword ptr [r9]
0x1458e58d1: je 0x1458e4b40
0x1458e58d7: mov r10, qword ptr [rip + 0x13cf50e]
0x1458e58de: cmp r10, qword ptr [r9]
0x1458e58e1: jne 0x1458e5e67
0x1458e58e7: jmp 0x1458e4b40
0x1458e58ec: xor esi, esi
0x1458e58ee: cmp rax, 0x1a
0x1458e58f2: je 0x1458e59d8
0x1458e58f8: cmp rax, 0x18
0x1458e58fc: jne 0x1458e59fb
0x1458e5902: mov r10, qword ptr [rip + 0x13dcf50]
0x1458e5909: xor r10, qword ptr [r9]
0x1458e590c: mov rbp, qword ptr [rip + 0x13dcf4c]
0x1458e5913: xor rbp, qword ptr [r9 + 6]
0x1458e5917: or rbp, r10
0x1458e591a: jne 0x1458e59fb
0x1458e5920: jmp 0x1458e4b40
0x1458e5925: mov r10, qword ptr [rip + 0x13dcf04]
0x1458e592c: xor r10, qword ptr [r9]
0x1458e592f: movzx esi, byte ptr [rip + 0x13dcf02]
0x1458e5936: xor sil, byte ptr [r9 + 8]
0x1458e593a: movzx esi, sil
0x1458e593e: or rsi, r10
0x1458e5941: je 0x1458e4b40
0x1458e5947: mov r10, qword ptr [rip + 0x13dceeb]
0x1458e594e: xor r10, qword ptr [r9]
0x1458e5951: movzx esi, byte ptr [rip + 0x13dcee9]
0x1458e5958: xor sil, byte ptr [r9 + 8]
0x1458e595c: movzx esi, sil
0x1458e5960: or rsi, r10
0x1458e5963: je 0x1458e4b40
0x1458e5969: mov r10, qword ptr [rip + 0x13dced7]
0x1458e5970: xor r10, qword ptr [r9]
0x1458e5973: movzx esi, byte ptr [rip + 0x13dced5]
0x1458e597a: xor sil, byte ptr [r9 + 8]
0x1458e597e: movzx esi, sil
0x1458e5982: or rsi, r10
0x1458e5985: je 0x1458e4b40
0x1458e598b: mov r10, qword ptr [rip + 0x13dcebe]
0x1458e5992: xor r10, qword ptr [r9]
0x1458e5995: movzx esi, byte ptr [rip + 0x13dcebc]
0x1458e599c: xor sil, byte ptr [r9 + 8]
0x1458e59a0: movzx ebp, sil
0x1458e59a4: mov sil, 1
0x1458e59a7: or rbp, r10
0x1458e59aa: jne 0x1458e58ee
0x1458e59b0: jmp 0x1458e4b40
0x1458e59b5: mov r10, qword ptr [rip + 0x13dcce9]
0x1458e59bc: xor r10, qword ptr [r9]
0x1458e59bf: mov rsi, qword ptr [rip + 0x13dcce2]
0x1458e59c6: xor rsi, qword ptr [r9 + 3]
0x1458e59ca: or rsi, r10
0x1458e59cd: jne 0x1458e5694
0x1458e59d3: jmp 0x1458e4b40
0x1458e59d8: movdqu xmm0, xmmword ptr [rip + 0x13dce87]
0x1458e59e0: movdqu xmm1, xmmword ptr [r9]
0x1458e59e5: pcmpeqb xmm1, xmm0
0x1458e59e9: pmovmskb r10d, xmm1
0x1458e59ee: cmp r10d, 0xffff
0x1458e59f5: je 0x1458e4b40
0x1458e59fb: test sil, sil
0x1458e59fe: je 0x1458e5a22
0x1458e5a00: mov r10, qword ptr [rip + 0x13cf60c]
0x1458e5a07: xor r10, qword ptr [r9]
0x1458e5a0a: movzx esi, byte ptr [rip + 0x13cf60a]
0x1458e5a11: xor sil, byte ptr [r9 + 8]
0x1458e5a15: movzx esi, sil
0x1458e5a19: or rsi, r10
0x1458e5a1c: je 0x1458e4b40
0x1458e5a22: xor esi, esi
0x1458e5a24: lea r13, [rax - 0xe]
0x1458e5a28: cmp r13, 0xf
0x1458e5a2c: ja 0x1458e6176
0x1458e5a32: lea r10, [rip + 0x1a496bf]
0x1458e5a39: mov ebp, r14d
0x1458e5a3c: mov r14, r10
0x1458e5a3f: movsxd r10, dword ptr [r10 + r13*4]
0x1458e5a43: add r10, r14
0x1458e5a46: mov r14d, ebp
0x1458e5a49: jmp r10
0x1458e5a4c: mov r10d, dword ptr [rip + 0x13dd316]
0x1458e5a53: cmp r10d, dword ptr [r9]
0x1458e5a56: jne 0x1458e600f
0x1458e5a5c: jmp 0x1458e4b40
0x1458e5a61: mov r10, qword ptr [rip + 0x13dcc4d]
0x1458e5a68: xor r10, qword ptr [r9]
0x1458e5a6b: mov rbp, qword ptr [rip + 0x13dcc49]
0x1458e5a72: xor rbp, qword ptr [r9 + 6]
0x1458e5a76: mov sil, 1
0x1458e5a79: or rbp, r10
0x1458e5a7c: jne 0x1458e5696
0x1458e5a82: jmp 0x1458e4b40
0x1458e5a87: cmp rax, 0xf
0x1458e5a8b: jne 0x1458e5aab
0x1458e5a8d: mov r11, qword ptr [rip + 0x17208ec]
0x1458e5a94: xor r11, qword ptr [rcx]
0x1458e5a97: mov rsi, qword ptr [rip + 0x17208e9]
0x1458e5a9e: xor rsi, qword ptr [rcx + 7]
0x1458e5aa2: or rsi, r11
0x1458e5aa5: je 0x1458e4b40
0x1458e5aab: xor r11d, r11d
0x1458e5aae: cmp byte ptr [rsp + 0x2c], 0
0x1458e5ab3: je 0x1458e5add
0x1458e5ab5: mov rsi, qword ptr [rip + 0x1720a44]
0x1458e5abc: xor rsi, qword ptr [rcx]
0x1458e5abf: movzx ebp, word ptr [rip + 0x1720a42]
0x1458e5ac6: xor bp, word ptr [rcx + 8]
0x1458e5aca: mov r8d, r14d
0x1458e5acd: movzx r14d, bp
0x1458e5ad1: or r14, rsi
0x1458e5ad4: mov r14d, r8d
0x1458e5ad7: je 0x1458e4b40
0x1458e5add: test r11b, r11b
0x1458e5ae0: je 0x1458e5b00
0x1458e5ae2: mov r11, qword ptr [rip + 0x1720ad7]
0x1458e5ae9: xor r11, qword ptr [rcx]
0x1458e5aec: mov rsi, qword ptr [rip + 0x1720ad2]
0x1458e5af3: xor rsi, qword ptr [rcx + 5]
0x1458e5af7: or rsi, r11
0x1458e5afa: je 0x1458e4b40
0x1458e5b00: cmp byte ptr [rsp + 0x28], 0
0x1458e5b05: je 0x1458e5b43
0x1458e5b07: mov r9, qword ptr [rip + 0x1720bb2]
0x1458e5b0e: xor r9, qword ptr [rcx]
0x1458e5b11: mov r11d, dword ptr [rip + 0x1720bb0]
0x1458e5b18: xor r11d, dword ptr [rcx + 8]
0x1458e5b1c: or r11, r9
0x1458e5b1f: je 0x1458e4b40
0x1458e5b25: mov r9, qword ptr [rip + 0x1720c54]
0x1458e5b2c: xor r9, qword ptr [rcx]
0x1458e5b2f: mov r11d, dword ptr [rip + 0x1720c52]
0x1458e5b36: xor r11d, dword ptr [rcx + 8]
0x1458e5b3a: or r11, r9
0x1458e5b3d: je 0x1458e4b40
0x1458e5b43: test r10b, r10b
0x1458e5b46: je 0x1458e5b70
0x1458e5b48: mov r9, qword ptr [rip + 0x1720d29]
0x1458e5b4f: xor r9, qword ptr [rcx]
0x1458e5b52: movzx r10d, byte ptr [rip + 0x1720d26]
0x1458e5b5a: xor r10b, byte ptr [rcx + 8]
0x1458e5b5e: movzx r10d, r10b
0x1458e5b62: or r10, r9
0x1458e5b65: je 0x1458e4b40
0x1458e5b6b: nop dword ptr [rax + rax]
0x1458e5b70: test rdx, rdx
0x1458e5b73: je 0x1458e5b80
0x1458e5b75: mov r8d, 1
0x1458e5b7b: call 0x1400021d0
0x1458e5b80: mov rsi, rbx
0x1458e5b83: cmp r12, qword ptr [rsp + 0x50]
0x1458e5b88: jne 0x1458e4b7c
0x1458e5b8e: jmp 0x1458e6276
0x1458e5b93: mov r10, qword ptr [rip + 0x13dc95d]
0x1458e5b9a: xor r10, qword ptr [r9]
0x1458e5b9d: mov rsi, qword ptr [rip + 0x13dc958]
0x1458e5ba4: xor rsi, qword ptr [r9 + 5]
0x1458e5ba8: or rsi, r10
0x1458e5bab: jne 0x1458e55d0
0x1458e5bb1: jmp 0x1458e4b40
0x1458e5bb6: mov r10, qword ptr [rip + 0x13dcde2]
0x1458e5bbd: xor r10, qword ptr [r9]
0x1458e5bc0: mov rsi, qword ptr [rip + 0x13dcdde]
0x1458e5bc7: xor rsi, qword ptr [r9 + 6]
0x1458e5bcb: jmp 0x1458e5894
0x1458e5bd0: movdqu xmm0, xmmword ptr [rip + 0x13dce05]
0x1458e5bd8: movdqu xmm1, xmmword ptr [r9]
0x1458e5bdd: pcmpeqb xmm1, xmm0
0x1458e5be1: pmovmskb r10d, xmm1
0x1458e5be6: cmp r10d, 0xffff
0x1458e5bed: jne 0x1458e589d
0x1458e5bf3: jmp 0x1458e4b40
0x1458e5bf8: mov r10, qword ptr [rip + 0x13dce06]
0x1458e5bff: xor r10, qword ptr [r9]
0x1458e5c02: movzx esi, byte ptr [rip + 0x13dce04]
0x1458e5c09: xor sil, byte ptr [r9 + 8]
0x1458e5c0d: movzx esi, sil
0x1458e5c11: or rsi, r10
0x1458e5c14: je 0x1458e4b40
0x1458e5c1a: mov r10, qword ptr [rip + 0x13dcf27]
0x1458e5c21: xor r10, qword ptr [r9]
0x1458e5c24: movzx esi, byte ptr [rip + 0x13dcf25]
0x1458e5c2b: xor sil, byte ptr [r9 + 8]
0x1458e5c2f: movzx esi, sil
0x1458e5c33: or rsi, r10
0x1458e5c36: je 0x1458e4b40
0x1458e5c3c: mov r10, qword ptr [rip + 0x13dcf6a]
0x1458e5c43: xor r10, qword ptr [r9]
0x1458e5c46: movzx esi, byte ptr [rip + 0x13dcf68]
0x1458e5c4d: xor sil, byte ptr [r9 + 8]
0x1458e5c51: movzx esi, sil
0x1458e5c55: or rsi, r10
0x1458e5c58: je 0x1458e4b40
0x1458e5c5e: mov r10, qword ptr [rip + 0x13dcf5c]
0x1458e5c65: xor r10, qword ptr [r9]
0x1458e5c68: movzx esi, byte ptr [rip + 0x13dcf5a]
0x1458e5c6f: xor sil, byte ptr [r9 + 8]
0x1458e5c73: movzx esi, sil
0x1458e5c77: jmp 0x1458e5f0f
0x1458e5c7c: mov r10, qword ptr [rip + 0x13dcd2a]
0x1458e5c83: xor r10, qword ptr [r9]
0x1458e5c86: mov rsi, qword ptr [rip + 0x13dcd27]
0x1458e5c8d: xor rsi, qword ptr [r9 + 7]
0x1458e5c91: jmp 0x1458e5894
0x1458e5c96: mov r10, qword ptr [rip + 0x13dcd1f]
0x1458e5c9d: xor r10, qword ptr [r9]
0x1458e5ca0: mov rsi, qword ptr [rip + 0x13dcd18]
0x1458e5ca7: xor rsi, qword ptr [r9 + 3]
0x1458e5cab: or rsi, r10
0x1458e5cae: je 0x1458e4b40
0x1458e5cb4: mov r10, qword ptr [rip + 0x13dcd0c]
0x1458e5cbb: xor r10, qword ptr [r9]
0x1458e5cbe: mov rsi, qword ptr [rip + 0x13dcd05]
0x1458e5cc5: xor rsi, qword ptr [r9 + 3]
0x1458e5cc9: or rsi, r10
0x1458e5ccc: je 0x1458e4b40
0x1458e5cd2: mov r10, qword ptr [rip + 0x13dccf9]
0x1458e5cd9: xor r10, qword ptr [r9]
0x1458e5cdc: mov rsi, qword ptr [rip + 0x13dccf2]
0x1458e5ce3: xor rsi, qword ptr [r9 + 3]
0x1458e5ce7: or rsi, r10
0x1458e5cea: je 0x1458e4b40
0x1458e5cf0: mov r10, qword ptr [rip + 0x13dccf6]
0x1458e5cf7: xor r10, qword ptr [r9]
0x1458e5cfa: mov rsi, qword ptr [rip + 0x13dccef]
0x1458e5d01: xor rsi, qword ptr [r9 + 3]
0x1458e5d05: jmp 0x1458e5894
0x1458e5d0a: mov r10, qword ptr [rip + 0x13dcce7]
0x1458e5d11: xor r10, qword ptr [r9]
0x1458e5d14: mov rsi, qword ptr [rip + 0x13dcce2]
0x1458e5d1b: xor rsi, qword ptr [r9 + 5]
0x1458e5d1f: or rsi, r10
0x1458e5d22: je 0x1458e4b40
0x1458e5d28: mov r10, qword ptr [rip + 0x13dcceb]
0x1458e5d2f: xor r10, qword ptr [r9]
0x1458e5d32: mov rsi, qword ptr [rip + 0x13dcce6]
0x1458e5d39: xor rsi, qword ptr [r9 + 5]
0x1458e5d3d: or rsi, r10
0x1458e5d40: je 0x1458e4b40
0x1458e5d46: mov r8, rdx
0x1458e5d49: xor esi, esi
0x1458e5d4b: cmp r13, 0xf
0x1458e5d4f: ja 0x1458e625d
0x1458e5d55: lea r14, [rip + 0x1a493dc]
0x1458e5d5c: movsxd r10, dword ptr [r14 + r13*4]
0x1458e5d60: add r10, r14
0x1458e5d63: mov rdx, r8
0x1458e5d66: mov r14d, ebp
0x1458e5d69: jmp r10
0x1458e5d6c: mov r10, qword ptr [rip + 0x13dcdcd]
0x1458e5d73: cmp r10, qword ptr [r9]
0x1458e5d76: je 0x1458e4b40
0x1458e5d7c: mov r10, qword ptr [rip + 0x13dcdf7]
0x1458e5d83: cmp r10, qword ptr [r9]
0x1458e5d86: jne 0x1458e5f18
0x1458e5d8c: jmp 0x1458e4b40
0x1458e5d91: mov r10, qword ptr [rip + 0x13dcdc8]
0x1458e5d98: xor r10, qword ptr [r9]
0x1458e5d9b: movzx esi, word ptr [rip + 0x13dcdc6]
0x1458e5da2: xor si, word ptr [r9 + 8]
0x1458e5da7: movzx esi, si
0x1458e5daa: or rsi, r10
0x1458e5dad: je 0x1458e4b40
0x1458e5db3: mov r10, qword ptr [rip + 0x13dcdd3]
0x1458e5dba: xor r10, qword ptr [r9]
0x1458e5dbd: movzx esi, word ptr [rip + 0x13dcdd1]
0x1458e5dc4: xor si, word ptr [r9 + 8]
0x1458e5dc9: movzx esi, si
0x1458e5dcc: or rsi, r10
0x1458e5dcf: je 0x1458e4b40
0x1458e5dd5: mov r10, qword ptr [rip + 0x13dcdc7]
0x1458e5ddc: xor r10, qword ptr [r9]
0x1458e5ddf: movzx esi, word ptr [rip + 0x13dcdc5]
0x1458e5de6: xor si, word ptr [r9 + 8]
0x1458e5deb: movzx esi, si
0x1458e5dee: jmp 0x1458e5f0f
0x1458e5df3: mov r10, qword ptr [rip + 0x13dcc14]
0x1458e5dfa: xor r10, qword ptr [r9]
0x1458e5dfd: mov esi, dword ptr [rip + 0x13dcc13]
0x1458e5e03: xor esi, dword ptr [r9 + 8]
0x1458e5e07: or rsi, r10
0x1458e5e0a: je 0x1458e4b40
0x1458e5e10: mov r10, qword ptr [rip + 0x13dcd80]
0x1458e5e17: xor r10, qword ptr [r9]
0x1458e5e1a: mov esi, dword ptr [rip + 0x13dcd7f]
0x1458e5e20: xor esi, dword ptr [r9 + 8]
0x1458e5e24: or rsi, r10
0x1458e5e27: je 0x1458e4b40
0x1458e5e2d: mov r10, qword ptr [rip + 0x13dcf09]
0x1458e5e34: xor r10, qword ptr [r9]
0x1458e5e37: mov esi, dword ptr [rip + 0x13dcf08]
0x1458e5e3d: xor esi, dword ptr [r9 + 8]
0x1458e5e41: or rsi, r10
0x1458e5e44: je 0x1458e4b40
0x1458e5e4a: mov r10, qword ptr [rip + 0x13dcf02]
0x1458e5e51: xor r10, qword ptr [r9]
0x1458e5e54: mov esi, dword ptr [rip + 0x13dcf01]
0x1458e5e5a: xor esi, dword ptr [r9 + 8]
0x1458e5e5e: or rsi, r10
0x1458e5e61: je 0x1458e4b40
0x1458e5e67: xor esi, esi
0x1458e5e69: lea rbp, [rax - 0xe]
0x1458e5e6d: cmp rbp, 0xf
0x1458e5e71: ja 0x1458e6176
0x1458e5e77: lea r10, [rip + 0x1a4937a]
0x1458e5e7e: mov r8d, r14d
0x1458e5e81: mov r14, r10
0x1458e5e84: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e5e88: add r10, r14
0x1458e5e8b: mov r14d, r8d
0x1458e5e8e: jmp r10
0x1458e5e91: mov r10, qword ptr [rip + 0x13dccb9]
0x1458e5e98: xor r10, qword ptr [r9]
0x1458e5e9b: mov rsi, qword ptr [rip + 0x13dccb6]
0x1458e5ea2: xor rsi, qword ptr [r9 + 7]
0x1458e5ea6: or rsi, r10
0x1458e5ea9: jne 0x1458e600f
0x1458e5eaf: jmp 0x1458e4b40
0x1458e5eb4: movdqu xmm0, xmmword ptr [rip + 0x13dccae]
0x1458e5ebc: movdqu xmm1, xmmword ptr [r9]
0x1458e5ec1: pcmpeqb xmm1, xmm0
0x1458e5ec5: pmovmskb r10d, xmm1
0x1458e5eca: cmp r10d, 0xffff
0x1458e5ed1: jne 0x1458e600f
0x1458e5ed7: jmp 0x1458e4b40
0x1458e5edc: mov r10, qword ptr [rip + 0x13dcc9f]
0x1458e5ee3: xor r10, qword ptr [r9]
0x1458e5ee6: mov rsi, qword ptr [rip + 0x13dcc98]
0x1458e5eed: xor rsi, qword ptr [r9 + 3]
0x1458e5ef1: or rsi, r10
0x1458e5ef4: je 0x1458e4b40
0x1458e5efa: mov r10, qword ptr [rip + 0x13dccb5]
0x1458e5f01: xor r10, qword ptr [r9]
0x1458e5f04: mov rsi, qword ptr [rip + 0x13dccae]
0x1458e5f0b: xor rsi, qword ptr [r9 + 3]
0x1458e5f0f: or rsi, r10
0x1458e5f12: je 0x1458e4b40
0x1458e5f18: xor esi, esi
0x1458e5f1a: lea rbp, [rax - 0xe]
0x1458e5f1e: cmp rbp, 0xf
0x1458e5f22: ja 0x1458e6176
0x1458e5f28: lea r10, [rip + 0x1a49289]
0x1458e5f2f: mov r8d, r14d
0x1458e5f32: mov r14, r10
0x1458e5f35: movsxd r10, dword ptr [r10 + rbp*4]
0x1458e5f39: add r10, r14
0x1458e5f3c: mov r14d, r8d
0x1458e5f3f: jmp r10
0x1458e5f42: mov r10d, dword ptr [rip + 0x13dcf79]
0x1458e5f49: xor r10d, dword ptr [r9]
0x1458e5f4c: movzx r11d, byte ptr [rip + 0x13dcf72]
0x1458e5f54: xor r11b, byte ptr [r9 + 4]
0x1458e5f58: movzx r11d, r11b
0x1458e5f5c: or r11d, r10d
0x1458e5f5f: je 0x1458e4b40
0x1458e5f65: mov r10d, dword ptr [rip + 0x13dcfaa]
0x1458e5f6c: xor r10d, dword ptr [r9]
0x1458e5f6f: movzx r11d, byte ptr [rip + 0x13dcfa3]
0x1458e5f77: xor r11b, byte ptr [r9 + 4]
0x1458e5f7b: movzx r11d, r11b
0x1458e5f7f: mov sil, 1
0x1458e5f82: or r11d, r10d
0x1458e5f85: jne 0x1458e6176
0x1458e5f8b: jmp 0x1458e4b40
0x1458e5f90: movdqu xmm0, xmmword ptr [rip + 0x13dcdde]
0x1458e5f98: movdqu xmm1, xmmword ptr [rip + 0x13dcdd9]
0x1458e5fa0: movdqu xmm2, xmmword ptr [r9]
0x1458e5fa5: pcmpeqb xmm2, xmm0
0x1458e5fa9: movdqu xmm0, xmmword ptr [r9 + 3]
0x1458e5faf: pcmpeqb xmm0, xmm1
0x1458e5fb3: pand xmm0, xmm2
0x1458e5fb7: pmovmskb r9d, xmm0
0x1458e5fbc: cmp r9d, 0xffff
0x1458e5fc3: jne 0x1458e4c41
0x1458e5fc9: jmp 0x1458e4b40
0x1458e5fce: mov r10, qword ptr [rip + 0x13dcd98]
0x1458e5fd5: xor r10, qword ptr [r9]
0x1458e5fd8: movzx esi, byte ptr [rip + 0x13dcd96]
0x1458e5fdf: xor sil, byte ptr [r9 + 8]
0x1458e5fe3: movzx esi, sil
0x1458e5fe7: or rsi, r10
0x1458e5fea: jne 0x1458e600f
0x1458e5fec: jmp 0x1458e4b40
0x1458e5ff1: mov r10, qword ptr [rip + 0x13dcd37]
0x1458e5ff8: xor r10, qword ptr [r9]
0x1458e5ffb: mov rsi, qword ptr [rip + 0x13dcd33]
0x1458e6002: xor rsi, qword ptr [r9 + 6]
0x1458e6006: or rsi, r10
0x1458e6009: je 0x1458e4b40
0x1458e600f: xor esi, esi
0x1458e6011: cmp r11, 0xa
0x1458e6015: ja 0x1458e6176
0x1458e601b: lea r10, [rip + 0x1a49216]
0x1458e6022: mov r8d, r14d
0x1458e6025: mov r14, r10
0x1458e6028: movsxd r10, dword ptr [r10 + r11*4]
0x1458e602c: add r10, r14
0x1458e602f: mov r14d, r8d
0x1458e6032: jmp r10
0x1458e6035: mov r10d, dword ptr [rip + 0x13dced4]
0x1458e603c: xor r10d, dword ptr [r9]
0x1458e603f: movzx r11d, word ptr [rip + 0x13dcecd]
0x1458e6047: xor r11w, word ptr [r9 + 4]
0x1458e604c: movzx r11d, r11w
0x1458e6050: or r11d, r10d
0x1458e6053: jne 0x1458e6143
0x1458e6059: jmp 0x1458e4b40
0x1458e605e: movdqu xmm0, xmmword ptr [rip + 0x13dce86]
0x1458e6066: movdqu xmm1, xmmword ptr [r9]
0x1458e606b: pcmpeqb xmm1, xmm0
0x1458e606f: pmovmskb r10d, xmm1
0x1458e6074: cmp r10d, 0xffff
0x1458e607b: jne 0x1458e6143
0x1458e6081: jmp 0x1458e4b40
0x1458e6086: mov r10, qword ptr [rip + 0x13dc5ec]
0x1458e608d: xor r10, qword ptr [r9]
0x1458e6090: mov rsi, qword ptr [rip + 0x13dc5e9]
0x1458e6097: xor rsi, qword ptr [r9 + 7]
0x1458e609b: or rsi, r10
0x1458e609e: je 0x1458e4b40
0x1458e60a4: mov r10, qword ptr [rip + 0x13dc618]
0x1458e60ab: xor r10, qword ptr [r9]
0x1458e60ae: mov rsi, qword ptr [rip + 0x13dc615]
0x1458e60b5: xor rsi, qword ptr [r9 + 7]
0x1458e60b9: or rsi, r10
0x1458e60bc: jne 0x1458e5694
0x1458e60c2: jmp 0x1458e4b40
0x1458e60c7: mov r10, qword ptr [rip + 0x13dcdf9]
0x1458e60ce: cmp r10, qword ptr [r9]
0x1458e60d1: je 0x1458e4b40
0x1458e60d7: mov r10, qword ptr [rip + 0x13dcdf1]
0x1458e60de: cmp r10, qword ptr [r9]
0x1458e60e1: je 0x1458e4b40
0x1458e60e7: mov r10, qword ptr [rip + 0x13dce1a]
0x1458e60ee: cmp r10, qword ptr [r9]
0x1458e60f1: je 0x1458e4b40
0x1458e60f7: lea r10, [rax - 0xa]
0x1458e60fb: cmp r10, 6
0x1458e60ff: je 0x1458e6035
0x1458e6105: jmp 0x1458e6143
0x1458e6107: mov r10, qword ptr [rip + 0x13dcdd2]
0x1458e610e: xor r10, qword ptr [r9]
0x1458e6111: mov r11d, dword ptr [rip + 0x13dcdd0]
0x1458e6118: xor r11d, dword ptr [r9 + 8]
0x1458e611c: or r11, r10
0x1458e611f: je 0x1458e4b40
0x1458e6125: mov r10, qword ptr [rip + 0x13dcdd0]
0x1458e612c: xor r10, qword ptr [r9]
0x1458e612f: mov r11d, dword ptr [rip + 0x13dcdce]
0x1458e6136: xor r11d, dword ptr [r9 + 8]
0x1458e613a: or r11, r10
0x1458e613d: je 0x1458e4b40
0x1458e6143: xor esi, esi
0x1458e6145: lea r10, [rax - 0xa]
0x1458e6149: cmp r10, 0xb
0x1458e614d: je 0x1458e6180
0x1458e614f: jmp 0x1458e619e
0x1458e6151: mov r10, qword ptr [rip + 0x13dcd7f]
0x1458e6158: xor r10, qword ptr [r9]
0x1458e615b: movzx r11d, byte ptr [rip + 0x13dcd7c]
0x1458e6163: xor r11b, byte ptr [r9 + 8]
0x1458e6167: movzx r11d, r11b
0x1458e616b: or r11, r10
0x1458e616e: je 0x1458e4b40
0x1458e6174: xor esi, esi
0x1458e6176: lea r10, [rax - 0xa]
0x1458e617a: cmp r10, 0xb
0x1458e617e: jne 0x1458e619e
0x1458e6180: mov r10, qword ptr [rip + 0x13dcd94]
0x1458e6187: xor r10, qword ptr [r9]
0x1458e618a: mov r11, qword ptr [rip + 0x13dcd8d]
0x1458e6191: xor r11, qword ptr [r9 + 3]
0x1458e6195: or r11, r10
0x1458e6198: je 0x1458e4b40
0x1458e619e: test sil, sil
0x1458e61a1: je 0x1458e4c41
0x1458e61a7: mov r10d, dword ptr [rip + 0x13dcd78]
0x1458e61ae: xor r10d, dword ptr [r9]
0x1458e61b1: movzx r11d, byte ptr [rip + 0x13dcd71]
0x1458e61b9: xor r11b, byte ptr [r9 + 4]
0x1458e61bd: movzx r9d, r11b
0x1458e61c1: or r9d, r10d
0x1458e61c4: jne 0x1458e4bbc
0x1458e61ca: jmp 0x1458e4b40
0x1458e61cf: mov r10, qword ptr [rip + 0x13dcb47]
0x1458e61d6: xor r10, qword ptr [r9]
0x1458e61d9: movzx esi, word ptr [rip + 0x13dcb45]
0x1458e61e0: xor si, word ptr [r9 + 8]
0x1458e61e5: movzx esi, si
0x1458e61e8: or rsi, r10
0x1458e61eb: je 0x1458e4b40
0x1458e61f1: mov r10, qword ptr [rip + 0x13dcb51]
0x1458e61f8: xor r10, qword ptr [r9]
0x1458e61fb: movzx esi, word ptr [rip + 0x13dcb4f]
0x1458e6202: xor si, word ptr [r9 + 8]
0x1458e6207: movzx esi, si
0x1458e620a: or rsi, r10
0x1458e620d: je 0x1458e4b40
0x1458e6213: mov r10, qword ptr [rip + 0x13dcb45]
0x1458e621a: xor r10, qword ptr [r9]
0x1458e621d: movzx esi, word ptr [rip + 0x13dcb43]
0x1458e6224: xor si, word ptr [r9 + 8]
0x1458e6229: movzx esi, si
0x1458e622c: or rsi, r10
0x1458e622f: jne 0x1458e5e67
0x1458e6235: jmp 0x1458e4b40
0x1458e623a: mov r10, qword ptr [rip + 0x13dcad1]
0x1458e6241: xor r10, qword ptr [r9]
0x1458e6244: mov rsi, qword ptr [rip + 0x13dcaca]
0x1458e624b: xor rsi, qword ptr [r9 + 3]
0x1458e624f: or rsi, r10
0x1458e6252: jne 0x1458e600f
0x1458e6258: jmp 0x1458e4b40
0x1458e625d: mov rdx, r8
0x1458e6260: mov r14d, ebp
0x1458e6263: lea r10, [rax - 0xa]
0x1458e6267: cmp r10, 0xb
0x1458e626b: je 0x1458e6180
0x1458e6271: jmp 0x1458e619e
0x1458e6276: mov rbx, qword ptr [rdi + 8]
0x1458e627a: mov rdi, qword ptr [rdi + 0x18]
0x1458e627e: sub rdi, rbx
0x1458e6281: je 0x1458e62b2
0x1458e6283: shr rdi, 5
0x1458e6287: add rbx, 8
0x1458e628b: jmp 0x1458e6299
0x1458e628d: nop dword ptr [rax]
0x1458e6290: add rbx, 0x20
0x1458e6294: dec rdi
0x1458e6297: je 0x1458e62b2
0x1458e6299: mov rdx, qword ptr [rbx - 8]
0x1458e629d: test rdx, rdx
0x1458e62a0: je 0x1458e6290
0x1458e62a2: mov rcx, qword ptr [rbx]
0x1458e62a5: mov r8d, 1
0x1458e62ab: call 0x1400021d0
0x1458e62b0: jmp 0x1458e6290
0x1458e62b2: mov rcx, qword ptr [rsp + 0x38]
0x1458e62b7: sub rsi, rcx
0x1458e62ba: shr rsi, 5
0x1458e62be: mov rax, qword ptr [rsp + 0x48]
0x1458e62c3: mov rdx, qword ptr [rsp + 0x40]
0x1458e62c8: mov qword ptr [rax], rdx
0x1458e62cb: mov qword ptr [rax + 8], rcx
0x1458e62cf: mov qword ptr [rax + 0x10], rsi
0x1458e62d3: add rsp, 0x58
0x1458e62d7: pop rbx
0x1458e62d8: pop rbp
0x1458e62d9: pop rdi
0x1458e62da: pop rsi
0x1458e62db: pop r12
0x1458e62dd: pop r13
0x1458e62df: pop r14
0x1458e62e1: pop r15
0x1458e62e3: ret
