0x1451c6910: push rbp
0x1451c6911: push r15
0x1451c6913: push r14
0x1451c6915: push r13
0x1451c6917: push r12
0x1451c6919: push rsi
0x1451c691a: push rdi
0x1451c691b: push rbx
0x1451c691c: sub rsp, 0x1b8
0x1451c6923: lea rbp, [rsp + 0x80]
0x1451c692b: movaps xmmword ptr [rbp + 0x120], xmm6
0x1451c6932: mov qword ptr [rbp + 0x118], 0xfffffffffffffffe
0x1451c693d: mov rdi, r9
0x1451c6940: mov qword ptr [rbp + 0x100], r8
0x1451c6947: mov qword ptr [rbp + 0x108], rdx
0x1451c694e: mov rsi, rcx
0x1451c6951: mov rbx, qword ptr [rbp + 0x1a0]
0x1451c6958: bt rbx, 0x20
0x1451c695d: jae 0x1451c69b3
0x1451c695f: movups xmm6, xmmword ptr [rip + 0x1ac1ab2]
0x1451c6966: movaps xmmword ptr [rbp], xmm6
0x1451c696a: cmp qword ptr [rdi + 0x60], -1
0x1451c696f: je 0x1451c6a1a
0x1451c6975: lea rdx, [rdi + 0x60]
0x1451c6979: mov byte ptr [rbp + 0x115], 1
0x1451c6980: lea rcx, [rbp + 0x88]
0x1451c6987: call 0x145ce7810
0x1451c698c: nop
0x1451c698d: mov rax, qword ptr [rbp + 0x88]
0x1451c6994: mov qword ptr [rbp + 0x48], rax
0x1451c6998: mov rax, qword ptr [rbp + 0x90]
0x1451c699f: mov qword ptr [rbp + 0x40], rax
0x1451c69a3: mov rbx, qword ptr [rbp + 0x98]
0x1451c69aa: movaps xmmword ptr [rbp - 0x10], xmm6
0x1451c69ae: jmp 0x1451c6a3a
0x1451c69b3: movups xmm0, xmmword ptr [rip + 0x1ac19ee]
0x1451c69ba: movaps xmmword ptr [rbp], xmm0
0x1451c69be: mov qword ptr [rbp + 0x48], 0xffffffffffffffff
0x1451c69c6: cmp qword ptr [rdi + 0x48], -1
0x1451c69cb: je 0x1451c6a18
0x1451c69cd: lea rdx, [rdi + 0x48]
0x1451c69d1: mov byte ptr [rbp + 0x115], 1
0x1451c69d8: lea rcx, [rbp + 0x88]
0x1451c69df: call 0x145ce7810
0x1451c69e4: nop
0x1451c69e5: mov rdx, qword ptr [rbp + 0x88]
0x1451c69ec: cmp rdx, -1
0x1451c69f0: je 0x1451c6a18
0x1451c69f2: mov rax, qword ptr [rbp + 0x90]
0x1451c69f9: mov qword ptr [rbp + 0x40], rax
0x1451c69fd: bt rbx, 0x28
0x1451c6a02: jb 0x1451c6a24
0x1451c6a04: test rdx, rdx
0x1451c6a07: je 0x1451c6a18
0x1451c6a09: mov r8d, 1
0x1451c6a0f: mov rcx, qword ptr [rbp + 0x40]
0x1451c6a13: call 0x1400021d0
0x1451c6a18: jmp 0x1451c6a3a
0x1451c6a1a: mov qword ptr [rbp + 0x48], 0xffffffffffffffff
0x1451c6a22: jmp 0x1451c6a3a
0x1451c6a24: mov rbx, qword ptr [rbp + 0x98]
0x1451c6a2b: movups xmm0, xmmword ptr [rip + 0x1ac1526]
0x1451c6a32: movaps xmmword ptr [rbp - 0x10], xmm0
0x1451c6a36: mov qword ptr [rbp + 0x48], rdx
0x1451c6a3a: mov byte ptr [rbp + 0x117], 1
0x1451c6a41: mov byte ptr [rbp + 0x116], 1
0x1451c6a48: lea r14, [rbp + 0x60]
0x1451c6a4c: mov rcx, r14
0x1451c6a4f: mov qword ptr [rbp + 0x58], rdi
0x1451c6a53: mov rdx, rdi
0x1451c6a56: call 0x145ce7810
0x1451c6a5b: nop
0x1451c6a5c: mov rax, qword ptr [rbp + 0x70]
0x1451c6a60: mov qword ptr [rbp + 0xe0], rax
0x1451c6a67: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6a6b: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6a72: movaps xmm0, xmmword ptr [rbp]
0x1451c6a76: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c6a7d: mov rax, qword ptr [rbp + 0x48]
0x1451c6a81: mov qword ptr [rbp + 0x60], rax
0x1451c6a85: mov rax, qword ptr [rbp + 0x40]
0x1451c6a89: mov qword ptr [rbp + 0x68], rax
0x1451c6a8d: mov qword ptr [rbp + 0x70], rbx
0x1451c6a91: movaps xmm0, xmmword ptr [rbp - 0x10]
0x1451c6a95: movups xmmword ptr [rbp + 0x78], xmm0
0x1451c6a99: mov byte ptr [rbp + 0x117], 1
0x1451c6aa0: mov byte ptr [rbp + 0x116], 0
0x1451c6aa7: mov qword ptr [rsp + 0x20], r14
0x1451c6aac: mov byte ptr [rsp + 0x28], 0
0x1451c6ab1: lea rcx, [rbp + 0x88]
0x1451c6ab8: lea r9, [rbp + 0xd0]
0x1451c6abf: mov rdx, qword ptr [rbp + 0x108]
0x1451c6ac6: mov r8, qword ptr [rbp + 0x100]
0x1451c6acd: call 0x14519b7b0
0x1451c6ad2: nop
0x1451c6ad3: cmp byte ptr [rbp + 0x88], 0xff
0x1451c6ada: je 0x1451c6b51
0x1451c6adc: mov rax, qword ptr [rbp + 0xc8]
0x1451c6ae3: mov qword ptr [rsi + 0x40], rax
0x1451c6ae7: movups xmm0, xmmword ptr [rbp + 0x88]
0x1451c6aee: movups xmm1, xmmword ptr [rbp + 0x98]
0x1451c6af5: movups xmm2, xmmword ptr [rbp + 0xa8]
0x1451c6afc: movups xmm3, xmmword ptr [rbp + 0xb8]
0x1451c6b03: movups xmmword ptr [rsi + 0x30], xmm3
0x1451c6b07: movups xmmword ptr [rsi + 0x20], xmm2
0x1451c6b0b: movups xmmword ptr [rsi + 0x10], xmm1
0x1451c6b0f: movups xmmword ptr [rsi], xmm0
0x1451c6b12: mov rax, qword ptr [rbp + 0x1a8]
0x1451c6b19: mov rdx, qword ptr [rax]
0x1451c6b1c: cmp rdx, -1
0x1451c6b20: je 0x1451c6b36
0x1451c6b22: test rdx, rdx
0x1451c6b25: je 0x1451c6b36
0x1451c6b27: mov rcx, qword ptr [rax + 8]
0x1451c6b2b: mov r8d, 1
0x1451c6b31: call 0x1400021d0
0x1451c6b36: movaps xmm6, xmmword ptr [rbp + 0x120]
0x1451c6b3d: add rsp, 0x1b8
0x1451c6b44: pop rbx
0x1451c6b45: pop rdi
0x1451c6b46: pop rsi
0x1451c6b47: pop r12
0x1451c6b49: pop r13
0x1451c6b4b: pop r14
0x1451c6b4d: pop r15
0x1451c6b4f: pop rbp
0x1451c6b50: ret
0x1451c6b51: mov r14, qword ptr [rbp + 0x1b0]
0x1451c6b58: test r14, r14
0x1451c6b5b: je 0x1451c6cee
0x1451c6b61: movzx eax, byte ptr [r14 + 0x4c]
0x1451c6b66: mov dword ptr [rbp + 0x54], eax
0x1451c6b69: cmp qword ptr [r14 + 0x18], -1
0x1451c6b6e: je 0x1451c6c0c
0x1451c6b74: mov rdi, r14
0x1451c6b77: lea rdx, [r14 + 0x18]
0x1451c6b7b: mov byte ptr [rbp + 0x117], 1
0x1451c6b82: mov byte ptr [rbp + 0x116], 0
0x1451c6b89: lea rbx, [rbp + 0x60]
0x1451c6b8d: mov rcx, rbx
0x1451c6b90: call 0x145ce7810
0x1451c6b95: nop
0x1451c6b96: mov rax, qword ptr [rbp + 0x70]
0x1451c6b9a: mov qword ptr [rbp + 0xe0], rax
0x1451c6ba1: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6ba5: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6bac: movups xmm0, xmmword ptr [rip + 0x1ac17f5]
0x1451c6bb3: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c6bba: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c6bc2: mov byte ptr [rbp + 0x117], 1
0x1451c6bc9: mov byte ptr [rbp + 0x116], 0
0x1451c6bd0: mov qword ptr [rsp + 0x20], rbx
0x1451c6bd5: mov byte ptr [rsp + 0x28], 0
0x1451c6bda: lea rcx, [rbp + 0x88]
0x1451c6be1: lea r9, [rbp + 0xd0]
0x1451c6be8: mov rdx, qword ptr [rbp + 0x108]
0x1451c6bef: mov r8, qword ptr [rbp + 0x100]
0x1451c6bf6: call 0x14519b7b0
0x1451c6bfb: nop
0x1451c6bfc: cmp byte ptr [rbp + 0x88], 0xff
0x1451c6c03: jne 0x1451c6adc
0x1451c6c09: mov r14, rdi
0x1451c6c0c: mov rbx, qword ptr [r14 + 8]
0x1451c6c10: mov rax, qword ptr [r14 + 0x10]
0x1451c6c14: lea rax, [rax + rax*2]
0x1451c6c18: lea rdi, [rbx + rax*8]
0x1451c6c1c: lea r14, [rbp + 0xe8]
0x1451c6c23: lea r13, [rbp + 0x88]
0x1451c6c2a: lea r12, [rbp + 0xd0]
0x1451c6c31: cmp rbx, rdi
0x1451c6c34: je 0x1451c6cd3
0x1451c6c3a: nop word ptr [rax + rax]
0x1451c6c40: mov byte ptr [rbp + 0x117], 1
0x1451c6c47: mov byte ptr [rbp + 0x116], 0
0x1451c6c4e: lea r15, [rbp + 0x60]
0x1451c6c52: mov rcx, r15
0x1451c6c55: mov rdx, rbx
0x1451c6c58: call 0x145ce7810
0x1451c6c5d: nop
0x1451c6c5e: mov rax, qword ptr [rbp + 0x70]
0x1451c6c62: mov qword ptr [rbp + 0xe0], rax
0x1451c6c69: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6c6d: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6c74: movups xmm0, xmmword ptr [rip + 0x1ac1299]
0x1451c6c7b: movups xmmword ptr [r14], xmm0
0x1451c6c7f: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c6c87: mov byte ptr [rbp + 0x117], 1
0x1451c6c8e: mov byte ptr [rbp + 0x116], 0
0x1451c6c95: mov qword ptr [rsp + 0x20], r15
0x1451c6c9a: mov byte ptr [rsp + 0x28], 1
0x1451c6c9f: mov rcx, r13
0x1451c6ca2: mov rdx, qword ptr [rbp + 0x108]
0x1451c6ca9: mov r8, qword ptr [rbp + 0x100]
0x1451c6cb0: mov r9, r12
0x1451c6cb3: call 0x14519b7b0
0x1451c6cb8: nop
0x1451c6cb9: cmp byte ptr [rbp + 0x88], 0xff
0x1451c6cc0: jne 0x1451c6adc
0x1451c6cc6: add rbx, 0x18
0x1451c6cca: cmp rbx, rdi
0x1451c6ccd: jne 0x1451c6c40
0x1451c6cd3: mov eax, dword ptr [rbp + 0x54]
0x1451c6cd6: test al, al
0x1451c6cd8: sete r15b
0x1451c6cdc: xor al, 1
0x1451c6cde: mov dword ptr [rbp + 0x54], eax
0x1451c6ce1: mov rdi, qword ptr [rbp + 0x58]
0x1451c6ce5: mov r14, qword ptr [rbp + 0x1b0]
0x1451c6cec: jmp 0x1451c6cfc
0x1451c6cee: mov dword ptr [rbp + 0x54], 0
0x1451c6cf5: xor r15d, r15d
0x1451c6cf8: mov rdi, qword ptr [rbp + 0x58]
0x1451c6cfc: mov rcx, qword ptr [rbp + 0x1a0]
0x1451c6d03: mov r13, rcx
0x1451c6d06: shr r13, 0x20
0x1451c6d0a: mov eax, r13d
0x1451c6d0d: and eax, 1
0x1451c6d10: or al, r15b
0x1451c6d13: je 0x1451c6d34
0x1451c6d15: bt rcx, 0x20
0x1451c6d1a: jae 0x1451c6e1e
0x1451c6d20: cmp qword ptr [rdi + 0x40], 0
0x1451c6d25: je 0x1451c7065
0x1451c6d2b: lea rdx, [rdi + 0x30]
0x1451c6d2f: jmp 0x1451c7074
0x1451c6d34: lea rbx, [rdi + 0x90]
0x1451c6d3b: mov rax, qword ptr [rdi + 0x90]
0x1451c6d42: cmp qword ptr [rdi + 0x78], -1
0x1451c6d47: je 0x1451c6e45
0x1451c6d4d: lea rdx, [rdi + 0x78]
0x1451c6d51: cmp rax, -1
0x1451c6d55: je 0x1451c6ed8
0x1451c6d5b: mov byte ptr [rbp + 0x117], 1
0x1451c6d62: mov byte ptr [rbp + 0x116], 0
0x1451c6d69: lea rcx, [rbp + 0x60]
0x1451c6d6d: call 0x145ce7810
0x1451c6d72: nop
0x1451c6d73: mov rax, qword ptr [rbp + 0x70]
0x1451c6d77: mov qword ptr [rbp + 0x20], rax
0x1451c6d7b: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6d7f: movaps xmmword ptr [rbp + 0x10], xmm0
0x1451c6d83: movups xmm6, xmmword ptr [rip + 0x1ac161e]
0x1451c6d8a: movups xmmword ptr [rbp + 0x28], xmm6
0x1451c6d8e: mov byte ptr [rbp + 0x114], 1
0x1451c6d95: lea r12, [rbp + 0xd0]
0x1451c6d9c: mov rcx, r12
0x1451c6d9f: mov rdx, rbx
0x1451c6da2: call 0x145ce7810
0x1451c6da7: nop
0x1451c6da8: mov rax, qword ptr [rbp + 0xe0]
0x1451c6daf: mov qword ptr [rbp + 0x70], rax
0x1451c6db3: movups xmm0, xmmword ptr [rbp + 0xd0]
0x1451c6dba: movups xmmword ptr [rbp + 0x78], xmm6
0x1451c6dbe: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6dc5: mov rax, qword ptr [rbp + 0x70]
0x1451c6dc9: mov qword ptr [rbp + 0xe0], rax
0x1451c6dd0: mov rax, qword ptr [rbp + 0x78]
0x1451c6dd4: mov qword ptr [rbp + 0xe8], rax
0x1451c6ddb: mov rax, qword ptr [rbp + 0x80]
0x1451c6de2: mov qword ptr [rbp + 0xf0], rax
0x1451c6de9: mov byte ptr [rbp + 0x114], 0
0x1451c6df0: mov qword ptr [rsp + 0x20], r12
0x1451c6df5: mov byte ptr [rsp + 0x28], 0
0x1451c6dfa: lea rcx, [rbp + 0x88]
0x1451c6e01: lea r9, [rbp + 0x10]
0x1451c6e05: mov rdx, qword ptr [rbp + 0x108]
0x1451c6e0c: mov r8, qword ptr [rbp + 0x100]
0x1451c6e13: call 0x14519b7b0
0x1451c6e18: nop
0x1451c6e19: jmp 0x1451c6f59
0x1451c6e1e: xor eax, eax
0x1451c6e20: cmp qword ptr [rdi + 0x28], 0
0x1451c6e25: mov r12d, 0
0x1451c6e2b: je 0x1451c7110
0x1451c6e31: lea rdx, [rdi + 0x18]
0x1451c6e35: movups xmm0, xmmword ptr [rip + 0x1ac15dc]
0x1451c6e3c: movaps xmmword ptr [rbp - 0x40], xmm0
0x1451c6e40: jmp 0x1451c7082
0x1451c6e45: cmp rax, -1
0x1451c6e49: je 0x1451c6f6a
0x1451c6e4f: mov byte ptr [rbp + 0x117], 1
0x1451c6e56: mov byte ptr [rbp + 0x116], 0
0x1451c6e5d: lea r12, [rbp + 0x60]
0x1451c6e61: mov rcx, r12
0x1451c6e64: mov rdx, rbx
0x1451c6e67: call 0x145ce7810
0x1451c6e6c: nop
0x1451c6e6d: mov rax, qword ptr [rbp + 0x70]
0x1451c6e71: mov qword ptr [rbp + 0xe0], rax
0x1451c6e78: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6e7c: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6e83: movups xmm0, xmmword ptr [rip + 0x1ac151e]
0x1451c6e8a: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c6e91: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c6e99: mov byte ptr [rbp + 0x117], 1
0x1451c6ea0: mov byte ptr [rbp + 0x116], 0
0x1451c6ea7: mov qword ptr [rsp + 0x20], r12
0x1451c6eac: mov byte ptr [rsp + 0x28], 0
0x1451c6eb1: lea rcx, [rbp + 0x88]
0x1451c6eb8: lea r9, [rbp + 0xd0]
0x1451c6ebf: mov rdx, qword ptr [rbp + 0x108]
0x1451c6ec6: mov r8, qword ptr [rbp + 0x100]
0x1451c6ecd: call 0x14519b7b0
0x1451c6ed2: nop
0x1451c6ed3: jmp 0x1451c6f59
0x1451c6ed8: mov byte ptr [rbp + 0x117], 1
0x1451c6edf: mov byte ptr [rbp + 0x116], 0
0x1451c6ee6: lea rbx, [rbp + 0x60]
0x1451c6eea: mov rcx, rbx
0x1451c6eed: call 0x145ce7810
0x1451c6ef2: nop
0x1451c6ef3: mov rax, qword ptr [rbp + 0x70]
0x1451c6ef7: mov qword ptr [rbp + 0xe0], rax
0x1451c6efe: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6f02: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6f09: movups xmm0, xmmword ptr [rip + 0x1ac1498]
0x1451c6f10: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c6f17: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c6f1f: mov byte ptr [rbp + 0x117], 1
0x1451c6f26: mov byte ptr [rbp + 0x116], 0
0x1451c6f2d: mov qword ptr [rsp + 0x20], rbx
0x1451c6f32: mov byte ptr [rsp + 0x28], 0
0x1451c6f37: lea rcx, [rbp + 0x88]
0x1451c6f3e: lea r9, [rbp + 0xd0]
0x1451c6f45: mov rdx, qword ptr [rbp + 0x108]
0x1451c6f4c: mov r8, qword ptr [rbp + 0x100]
0x1451c6f53: call 0x14519b7b0
0x1451c6f58: nop
0x1451c6f59: cmp byte ptr [rbp + 0x88], 0xff
0x1451c6f60: jne 0x1451c6adc
0x1451c6f66: mov rdi, qword ptr [rbp + 0x58]
0x1451c6f6a: cmp qword ptr [rdi + 0xa8], -1
0x1451c6f72: je 0x1451c7545
0x1451c6f78: lea rdx, [rdi + 0xa8]
0x1451c6f7f: cmp qword ptr [rdi + 0xc0], -1
0x1451c6f87: je 0x1451c74b3
0x1451c6f8d: mov byte ptr [rbp + 0x117], 1
0x1451c6f94: mov byte ptr [rbp + 0x116], 0
0x1451c6f9b: lea rcx, [rbp + 0x60]
0x1451c6f9f: call 0x145ce7810
0x1451c6fa4: nop
0x1451c6fa5: mov rdi, qword ptr [rbp + 0x58]
0x1451c6fa9: lea rdx, [rdi + 0xc0]
0x1451c6fb0: mov rax, qword ptr [rbp + 0x70]
0x1451c6fb4: mov qword ptr [rbp + 0x20], rax
0x1451c6fb8: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c6fbc: movaps xmmword ptr [rbp + 0x10], xmm0
0x1451c6fc0: movups xmm6, xmmword ptr [rip + 0x1ac13e1]
0x1451c6fc7: movups xmmword ptr [rbp + 0x28], xmm6
0x1451c6fcb: mov byte ptr [rbp + 0x113], 1
0x1451c6fd2: lea rbx, [rbp + 0xd0]
0x1451c6fd9: mov rcx, rbx
0x1451c6fdc: call 0x145ce7810
0x1451c6fe1: nop
0x1451c6fe2: mov rax, qword ptr [rbp + 0xe0]
0x1451c6fe9: mov qword ptr [rbp + 0x70], rax
0x1451c6fed: movups xmm0, xmmword ptr [rbp + 0xd0]
0x1451c6ff4: movups xmmword ptr [rbp + 0x78], xmm6
0x1451c6ff8: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c6fff: mov rax, qword ptr [rbp + 0x70]
0x1451c7003: mov qword ptr [rbp + 0xe0], rax
0x1451c700a: mov rax, qword ptr [rbp + 0x78]
0x1451c700e: mov qword ptr [rbp + 0xe8], rax
0x1451c7015: mov rax, qword ptr [rbp + 0x80]
0x1451c701c: mov qword ptr [rbp + 0xf0], rax
0x1451c7023: mov byte ptr [rbp + 0x113], 0
0x1451c702a: mov qword ptr [rsp + 0x20], rbx
0x1451c702f: mov byte ptr [rsp + 0x28], 0
0x1451c7034: lea rcx, [rbp + 0x88]
0x1451c703b: lea r9, [rbp + 0x10]
0x1451c703f: mov rdx, qword ptr [rbp + 0x108]
0x1451c7046: mov r8, qword ptr [rbp + 0x100]
0x1451c704d: call 0x14519b7b0
0x1451c7052: nop
0x1451c7053: cmp byte ptr [rbp + 0x88], 0xff
0x1451c705a: jne 0x1451c6adc
0x1451c7060: jmp 0x1451c7545
0x1451c7065: cmp qword ptr [rdi + 0x28], 0
0x1451c706a: je 0x1451c763b
0x1451c7070: lea rdx, [rdi + 0x18]
0x1451c7074: movups xmm0, xmmword ptr [rip + 0x1ac132d]
0x1451c707b: movaps xmmword ptr [rbp - 0x40], xmm0
0x1451c707f: xor r12d, r12d
0x1451c7082: mov byte ptr [rbp + 0x117], 1
0x1451c7089: mov byte ptr [rbp + 0x116], 0
0x1451c7090: lea rbx, [rbp + 0x60]
0x1451c7094: mov rcx, rbx
0x1451c7097: call 0x145ce7810
0x1451c709c: nop
0x1451c709d: mov rax, qword ptr [rbp + 0x70]
0x1451c70a1: mov qword ptr [rbp + 0xe0], rax
0x1451c70a8: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c70ac: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c70b3: movaps xmm0, xmmword ptr [rbp - 0x40]
0x1451c70b7: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c70be: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c70c6: mov byte ptr [rbp + 0x117], 1
0x1451c70cd: mov byte ptr [rbp + 0x116], 0
0x1451c70d4: mov qword ptr [rsp + 0x20], rbx
0x1451c70d9: mov byte ptr [rsp + 0x28], 1
0x1451c70de: lea rcx, [rbp + 0x88]
0x1451c70e5: lea r9, [rbp + 0xd0]
0x1451c70ec: mov rdx, qword ptr [rbp + 0x108]
0x1451c70f3: mov r8, qword ptr [rbp + 0x100]
0x1451c70fa: call 0x14519b7b0
0x1451c70ff: nop
0x1451c7100: cmp byte ptr [rbp + 0x88], 0xff
0x1451c7107: jne 0x1451c6adc
0x1451c710d: mov eax, r15d
0x1451c7110: test r14, r14
0x1451c7113: lea rdi, [rbp + 0x60]
0x1451c7117: je 0x1451c73cc
0x1451c711d: cmp qword ptr [r14 + 0x30], -1
0x1451c7122: je 0x1451c7317
0x1451c7128: cmp byte ptr [rbp + 0x54], 0
0x1451c712c: je 0x1451c7139
0x1451c712e: cmp qword ptr [r14 + 0x40], 0
0x1451c7133: je 0x1451c7317
0x1451c7139: test al, al
0x1451c713b: je 0x1451c71db
0x1451c7141: call 0x140002200
0x1451c7146: mov ecx, 1
0x1451c714b: mov edx, 1
0x1451c7150: call 0x1400021c0
0x1451c7155: test rax, rax
0x1451c7158: je 0x1451c7968
0x1451c715e: mov byte ptr [rax], 0x20
0x1451c7161: mov qword ptr [rbp + 0xd0], 1
0x1451c716c: mov qword ptr [rbp + 0xd8], rax
0x1451c7173: mov qword ptr [rbp + 0xe0], 1
0x1451c717e: movups xmm0, xmmword ptr [rip + 0x1ac1293]
0x1451c7185: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c718c: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c7194: mov byte ptr [rbp + 0x117], 1
0x1451c719b: mov byte ptr [rbp + 0x116], 0
0x1451c71a2: mov qword ptr [rsp + 0x20], rdi
0x1451c71a7: mov byte ptr [rsp + 0x28], 0
0x1451c71ac: lea rcx, [rbp + 0x88]
0x1451c71b3: lea r9, [rbp + 0xd0]
0x1451c71ba: mov rdx, qword ptr [rbp + 0x108]
0x1451c71c1: mov r8, qword ptr [rbp + 0x100]
0x1451c71c8: call 0x14519b7b0
0x1451c71cd: nop
0x1451c71ce: cmp byte ptr [rbp + 0x88], 0xff
0x1451c71d5: jne 0x1451c6adc
0x1451c71db: mov byte ptr [rbp + 0x117], 1
0x1451c71e2: mov byte ptr [rbp + 0x116], 0
0x1451c71e9: lea r8, [rip + 0x1ac127a]
0x1451c71f0: lea rcx, [rbp + 0x10]
0x1451c71f4: mov r9d, 0x18
0x1451c71fa: mov rdx, qword ptr [rbp + 0x108]
0x1451c7201: call 0x1450f0fe0
0x1451c7206: nop
0x1451c7207: cmp qword ptr [rbp + 0x10], -1
0x1451c720c: je 0x1451c7285
0x1451c720e: mov rax, qword ptr [rbp + 0x20]
0x1451c7212: mov qword ptr [rbp + 0xe0], rax
0x1451c7219: movups xmm0, xmmword ptr [rbp + 0x10]
0x1451c721d: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c7224: movups xmm0, xmmword ptr [rip + 0x1ac117d]
0x1451c722b: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7232: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c723a: mov byte ptr [rbp + 0x117], 1
0x1451c7241: mov byte ptr [rbp + 0x116], 0
0x1451c7248: lea rax, [rbp + 0x60]
0x1451c724c: mov qword ptr [rsp + 0x20], rax
0x1451c7251: mov byte ptr [rsp + 0x28], 0
0x1451c7256: lea rcx, [rbp + 0x88]
0x1451c725d: lea r9, [rbp + 0xd0]
0x1451c7264: mov rdx, qword ptr [rbp + 0x108]
0x1451c726b: mov r8, qword ptr [rbp + 0x100]
0x1451c7272: call 0x14519b7b0
0x1451c7277: nop
0x1451c7278: cmp byte ptr [rbp + 0x88], 0xff
0x1451c727f: jne 0x1451c6adc
0x1451c7285: lea rdx, [r14 + 0x30]
0x1451c7289: mov byte ptr [rbp + 0x117], 1
0x1451c7290: mov byte ptr [rbp + 0x116], 0
0x1451c7297: lea rbx, [rbp + 0x60]
0x1451c729b: mov rcx, rbx
0x1451c729e: call 0x145ce7810
0x1451c72a3: nop
0x1451c72a4: mov rax, qword ptr [rbp + 0x70]
0x1451c72a8: mov qword ptr [rbp + 0xe0], rax
0x1451c72af: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c72b3: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c72ba: movups xmm0, xmmword ptr [rip + 0x1ac1157]
0x1451c72c1: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c72c8: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c72d0: mov byte ptr [rbp + 0x117], 1
0x1451c72d7: mov byte ptr [rbp + 0x116], 0
0x1451c72de: mov qword ptr [rsp + 0x20], rbx
0x1451c72e3: mov byte ptr [rsp + 0x28], 1
0x1451c72e8: lea rcx, [rbp + 0x88]
0x1451c72ef: lea r9, [rbp + 0xd0]
0x1451c72f6: mov rdx, qword ptr [rbp + 0x108]
0x1451c72fd: mov r8, qword ptr [rbp + 0x100]
0x1451c7304: call 0x14519b7b0
0x1451c7309: nop
0x1451c730a: cmp byte ptr [rbp + 0x88], 0xff
0x1451c7311: jne 0x1451c6adc
0x1451c7317: cmp byte ptr [r14 + 0x4d], 0
0x1451c731c: je 0x1451c73cc
0x1451c7322: mov byte ptr [rbp + 0x117], 1
0x1451c7329: mov byte ptr [rbp + 0x116], 0
0x1451c7330: lea r8, [rip + 0x1ac114b]
0x1451c7337: lea rcx, [rbp + 0x10]
0x1451c733b: mov r9d, 0x14
0x1451c7341: mov rdx, qword ptr [rbp + 0x108]
0x1451c7348: call 0x1450f0fe0
0x1451c734d: nop
0x1451c734e: cmp qword ptr [rbp + 0x10], -1
0x1451c7353: je 0x1451c73cc
0x1451c7355: mov rax, qword ptr [rbp + 0x20]
0x1451c7359: mov qword ptr [rbp + 0xe0], rax
0x1451c7360: movups xmm0, xmmword ptr [rbp + 0x10]
0x1451c7364: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c736b: movups xmm0, xmmword ptr [rip + 0x1ac1126]
0x1451c7372: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7379: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c7381: mov byte ptr [rbp + 0x117], 1
0x1451c7388: mov byte ptr [rbp + 0x116], 0
0x1451c738f: lea rax, [rbp + 0x60]
0x1451c7393: mov qword ptr [rsp + 0x20], rax
0x1451c7398: mov byte ptr [rsp + 0x28], 0
0x1451c739d: lea rcx, [rbp + 0x88]
0x1451c73a4: lea r9, [rbp + 0xd0]
0x1451c73ab: mov rdx, qword ptr [rbp + 0x108]
0x1451c73b2: mov r8, qword ptr [rbp + 0x100]
0x1451c73b9: call 0x14519b7b0
0x1451c73be: nop
0x1451c73bf: cmp byte ptr [rbp + 0x88], 0xff
0x1451c73c6: jne 0x1451c6adc
0x1451c73cc: mov rax, qword ptr [rbp + 0x1a8]
0x1451c73d3: cmp qword ptr [rax], -1
0x1451c73d7: je 0x1451c7489
0x1451c73dd: mov rcx, rax
0x1451c73e0: mov rax, qword ptr [rax + 0x10]
0x1451c73e4: mov qword ptr [rbp + 0xe0], rax
0x1451c73eb: movups xmm0, xmmword ptr [rcx]
0x1451c73ee: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c73f5: movups xmm0, xmmword ptr [rip + 0x1ac101c]
0x1451c73fc: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7403: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c740b: mov byte ptr [rbp + 0x117], 0
0x1451c7412: mov byte ptr [rbp + 0x116], 0
0x1451c7419: mov qword ptr [rsp + 0x20], rdi
0x1451c741e: mov byte ptr [rsp + 0x28], 0
0x1451c7423: lea rcx, [rbp + 0x88]
0x1451c742a: lea r9, [rbp + 0xd0]
0x1451c7431: mov rdx, qword ptr [rbp + 0x108]
0x1451c7438: mov r8, qword ptr [rbp + 0x100]
0x1451c743f: call 0x14519b7b0
0x1451c7444: nop
0x1451c7445: cmp byte ptr [rbp + 0x88], 0xff
0x1451c744c: je 0x1451c7489
0x1451c744e: mov rax, qword ptr [rbp + 0xc8]
0x1451c7455: mov qword ptr [rsi + 0x40], rax
0x1451c7459: movups xmm0, xmmword ptr [rbp + 0x88]
0x1451c7460: movups xmm1, xmmword ptr [rbp + 0x98]
0x1451c7467: movups xmm2, xmmword ptr [rbp + 0xa8]
0x1451c746e: movups xmm3, xmmword ptr [rbp + 0xb8]
0x1451c7475: movups xmmword ptr [rsi + 0x30], xmm3
0x1451c7479: movups xmmword ptr [rsi + 0x20], xmm2
0x1451c747d: movups xmmword ptr [rsi + 0x10], xmm1
0x1451c7481: movups xmmword ptr [rsi], xmm0
0x1451c7484: jmp 0x1451c6b36
0x1451c7489: or r15b, r12b
0x1451c748c: jne 0x1451c7657
0x1451c7492: and r13d, 1
0x1451c7496: mov rax, qword ptr [rbp + 0x1a0]
0x1451c749d: test eax, eax
0x1451c749f: sete al
0x1451c74a2: or al, r13b
0x1451c74a5: je 0x1451c7645
0x1451c74ab: xor r12d, r12d
0x1451c74ae: jmp 0x1451c7657
0x1451c74b3: mov byte ptr [rbp + 0x117], 1
0x1451c74ba: mov byte ptr [rbp + 0x116], 0
0x1451c74c1: lea rbx, [rbp + 0x60]
0x1451c74c5: mov rcx, rbx
0x1451c74c8: call 0x145ce7810
0x1451c74cd: nop
0x1451c74ce: mov rax, qword ptr [rbp + 0x70]
0x1451c74d2: mov qword ptr [rbp + 0xe0], rax
0x1451c74d9: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c74dd: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c74e4: movups xmm0, xmmword ptr [rip + 0x1ac0ebd]
0x1451c74eb: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c74f2: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c74fa: mov byte ptr [rbp + 0x117], 1
0x1451c7501: mov byte ptr [rbp + 0x116], 0
0x1451c7508: mov qword ptr [rsp + 0x20], rbx
0x1451c750d: mov byte ptr [rsp + 0x28], 0
0x1451c7512: lea rcx, [rbp + 0x88]
0x1451c7519: lea r9, [rbp + 0xd0]
0x1451c7520: mov rdx, qword ptr [rbp + 0x108]
0x1451c7527: mov r8, qword ptr [rbp + 0x100]
0x1451c752e: call 0x14519b7b0
0x1451c7533: nop
0x1451c7534: cmp byte ptr [rbp + 0x88], 0xff
0x1451c753b: jne 0x1451c6adc
0x1451c7541: mov rdi, qword ptr [rbp + 0x58]
0x1451c7545: cmp qword ptr [rdi + 0xd8], -1
0x1451c754d: mov rdx, qword ptr [rbp + 0x1a0]
0x1451c7554: je 0x1451c7614
0x1451c755a: lea rdx, [rdi + 0xd8]
0x1451c7561: cmp byte ptr [rdi + 0x13c], 0
0x1451c7568: je 0x1451c7573
0x1451c756a: movups xmm0, xmmword ptr [rip + 0x1ac0e37]
0x1451c7571: jmp 0x1451c757a
0x1451c7573: movups xmm0, xmmword ptr [rip + 0x1ac099a]
0x1451c757a: movaps xmmword ptr [rbp - 0x20], xmm0
0x1451c757e: mov byte ptr [rbp + 0x117], 1
0x1451c7585: mov byte ptr [rbp + 0x116], 0
0x1451c758c: lea rbx, [rbp + 0x60]
0x1451c7590: mov rcx, rbx
0x1451c7593: call 0x145ce7810
0x1451c7598: nop
0x1451c7599: mov rax, qword ptr [rbp + 0x70]
0x1451c759d: mov qword ptr [rbp + 0xe0], rax
0x1451c75a4: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c75a8: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c75af: movaps xmm0, xmmword ptr [rbp - 0x20]
0x1451c75b3: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c75ba: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c75c2: mov byte ptr [rbp + 0x117], 1
0x1451c75c9: mov byte ptr [rbp + 0x116], 0
0x1451c75d0: mov qword ptr [rsp + 0x20], rbx
0x1451c75d5: mov byte ptr [rsp + 0x28], 0
0x1451c75da: lea rcx, [rbp + 0x88]
0x1451c75e1: lea r9, [rbp + 0xd0]
0x1451c75e8: mov rdx, qword ptr [rbp + 0x108]
0x1451c75ef: mov r8, qword ptr [rbp + 0x100]
0x1451c75f6: call 0x14519b7b0
0x1451c75fb: nop
0x1451c75fc: cmp byte ptr [rbp + 0x88], 0xff
0x1451c7603: jne 0x1451c6adc
0x1451c7609: mov rdi, qword ptr [rbp + 0x58]
0x1451c760d: mov rdx, qword ptr [rbp + 0x1a0]
0x1451c7614: cmp qword ptr [rdi + 0xf0], -1
0x1451c761c: je 0x1451c7704
0x1451c7622: lea rdx, [rdi + 0xf0]
0x1451c7629: cmp byte ptr [rdi + 0x13d], 0
0x1451c7630: je 0x1451c7663
0x1451c7632: movups xmm0, xmmword ptr [rip + 0x1ac0d6f]
0x1451c7639: jmp 0x1451c766a
0x1451c763b: xor eax, eax
0x1451c763d: xor r12d, r12d
0x1451c7640: jmp 0x1451c7110
0x1451c7645: mov rax, qword ptr [rbp + 0x58]
0x1451c7649: cmp dword ptr [rax + 0x138], 0xea60
0x1451c7653: setae r12b
0x1451c7657: mov byte ptr [rsi + 1], r12b
0x1451c765b: mov byte ptr [rsi], 0xff
0x1451c765e: jmp 0x1451c6b36
0x1451c7663: movups xmm0, xmmword ptr [rip + 0x1ac08aa]
0x1451c766a: movaps xmmword ptr [rbp - 0x30], xmm0
0x1451c766e: mov byte ptr [rbp + 0x117], 1
0x1451c7675: mov byte ptr [rbp + 0x116], 0
0x1451c767c: lea rbx, [rbp + 0x60]
0x1451c7680: mov rcx, rbx
0x1451c7683: call 0x145ce7810
0x1451c7688: nop
0x1451c7689: mov rax, qword ptr [rbp + 0x70]
0x1451c768d: mov qword ptr [rbp + 0xe0], rax
0x1451c7694: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c7698: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c769f: movaps xmm0, xmmword ptr [rbp - 0x30]
0x1451c76a3: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c76aa: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c76b2: mov byte ptr [rbp + 0x117], 1
0x1451c76b9: mov byte ptr [rbp + 0x116], 0
0x1451c76c0: mov qword ptr [rsp + 0x20], rbx
0x1451c76c5: mov byte ptr [rsp + 0x28], 0
0x1451c76ca: lea rcx, [rbp + 0x88]
0x1451c76d1: lea r9, [rbp + 0xd0]
0x1451c76d8: mov rdx, qword ptr [rbp + 0x108]
0x1451c76df: mov r8, qword ptr [rbp + 0x100]
0x1451c76e6: call 0x14519b7b0
0x1451c76eb: nop
0x1451c76ec: cmp byte ptr [rbp + 0x88], 0xff
0x1451c76f3: jne 0x1451c6adc
0x1451c76f9: mov rdi, qword ptr [rbp + 0x58]
0x1451c76fd: mov rdx, qword ptr [rbp + 0x1a0]
0x1451c7704: mov rax, rdx
0x1451c7707: shr rax, 0x30
0x1451c770b: and eax, 1
0x1451c770e: cmp qword ptr [rdi + 0x108], -1
0x1451c7716: sete cl
0x1451c7719: or cl, al
0x1451c771b: jne 0x1451c77c1
0x1451c7721: lea rdx, [rdi + 0x108]
0x1451c7728: mov byte ptr [rbp + 0x117], 1
0x1451c772f: mov byte ptr [rbp + 0x116], 0
0x1451c7736: lea rbx, [rbp + 0x60]
0x1451c773a: mov rcx, rbx
0x1451c773d: call 0x145ce7810
0x1451c7742: nop
0x1451c7743: mov rax, qword ptr [rbp + 0x70]
0x1451c7747: mov qword ptr [rbp + 0xe0], rax
0x1451c774e: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c7752: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c7759: movups xmm0, xmmword ptr [rip + 0x1ac0c48]
0x1451c7760: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7767: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c776f: mov byte ptr [rbp + 0x117], 1
0x1451c7776: mov byte ptr [rbp + 0x116], 0
0x1451c777d: mov qword ptr [rsp + 0x20], rbx
0x1451c7782: mov byte ptr [rsp + 0x28], 1
0x1451c7787: lea rcx, [rbp + 0x88]
0x1451c778e: lea r9, [rbp + 0xd0]
0x1451c7795: mov rdx, qword ptr [rbp + 0x108]
0x1451c779c: mov r8, qword ptr [rbp + 0x100]
0x1451c77a3: call 0x14519b7b0
0x1451c77a8: nop
0x1451c77a9: cmp byte ptr [rbp + 0x88], 0xff
0x1451c77b0: jne 0x1451c6adc
0x1451c77b6: mov rdi, qword ptr [rbp + 0x58]
0x1451c77ba: mov rdx, qword ptr [rbp + 0x1a0]
0x1451c77c1: test edx, edx
0x1451c77c3: je 0x1451c78ab
0x1451c77c9: cmp dword ptr [rdi + 0x138], 0xea5f
0x1451c77d3: jbe 0x1451c78ab
0x1451c77d9: mov rax, qword ptr [rbp + 0x108]
0x1451c77e0: mov qword ptr [rbp + 0x88], rax
0x1451c77e7: mov byte ptr [rbp + 0x117], 1
0x1451c77ee: mov byte ptr [rbp + 0x116], 0
0x1451c77f5: lea rax, [rip + 0x1ac0c2c]
0x1451c77fc: mov qword ptr [rsp + 0x30], rax
0x1451c7801: lea rax, [rbp + 0x88]
0x1451c7808: mov qword ptr [rsp + 0x28], rax
0x1451c780d: mov byte ptr [rsp + 0x20], 1
0x1451c7812: lea r8, [rip + 0x1ac0c3f]
0x1451c7819: lea rcx, [rbp + 0x10]
0x1451c781d: mov r9d, 0x12
0x1451c7823: call 0x14519e390
0x1451c7828: nop
0x1451c7829: cmp qword ptr [rbp + 0x10], -1
0x1451c782e: je 0x1451c78a7
0x1451c7830: mov rax, qword ptr [rbp + 0x20]
0x1451c7834: mov qword ptr [rbp + 0xe0], rax
0x1451c783b: movups xmm0, xmmword ptr [rbp + 0x10]
0x1451c783f: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c7846: movups xmm0, xmmword ptr [rip + 0x1ac0b5b]
0x1451c784d: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7854: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c785c: mov byte ptr [rbp + 0x117], 1
0x1451c7863: mov byte ptr [rbp + 0x116], 0
0x1451c786a: lea rax, [rbp + 0x60]
0x1451c786e: mov qword ptr [rsp + 0x20], rax
0x1451c7873: mov byte ptr [rsp + 0x28], 0
0x1451c7878: lea rcx, [rbp + 0x88]
0x1451c787f: lea r9, [rbp + 0xd0]
0x1451c7886: mov rdx, qword ptr [rbp + 0x108]
0x1451c788d: mov r8, qword ptr [rbp + 0x100]
0x1451c7894: call 0x14519b7b0
0x1451c7899: nop
0x1451c789a: cmp byte ptr [rbp + 0x88], 0xff
0x1451c78a1: jne 0x1451c6adc
0x1451c78a7: mov rdi, qword ptr [rbp + 0x58]
0x1451c78ab: cmp qword ptr [rdi + 0x120], -1
0x1451c78b3: setne r12b
0x1451c78b7: je 0x1451c7956
0x1451c78bd: lea rdx, [rdi + 0x120]
0x1451c78c4: mov byte ptr [rbp + 0x117], 1
0x1451c78cb: mov byte ptr [rbp + 0x116], 0
0x1451c78d2: lea rbx, [rbp + 0x60]
0x1451c78d6: mov rcx, rbx
0x1451c78d9: call 0x145ce7810
0x1451c78de: nop
0x1451c78df: mov rax, qword ptr [rbp + 0x70]
0x1451c78e3: mov qword ptr [rbp + 0xe0], rax
0x1451c78ea: movups xmm0, xmmword ptr [rbp + 0x60]
0x1451c78ee: movaps xmmword ptr [rbp + 0xd0], xmm0
0x1451c78f5: movups xmm0, xmmword ptr [rip + 0x1ac0aac]
0x1451c78fc: movups xmmword ptr [rbp + 0xe8], xmm0
0x1451c7903: mov qword ptr [rbp + 0x60], 0xffffffffffffffff
0x1451c790b: mov byte ptr [rbp + 0x117], 1
0x1451c7912: mov byte ptr [rbp + 0x116], 0
0x1451c7919: mov qword ptr [rsp + 0x20], rbx
0x1451c791e: mov byte ptr [rsp + 0x28], 0
0x1451c7923: lea rcx, [rbp + 0x88]
0x1451c792a: lea r9, [rbp + 0xd0]
0x1451c7931: mov rdx, qword ptr [rbp + 0x108]
0x1451c7938: mov r8, qword ptr [rbp + 0x100]
0x1451c793f: call 0x14519b7b0
0x1451c7944: nop
0x1451c7945: cmp byte ptr [rbp + 0x88], 0xff
0x1451c794c: jne 0x1451c6adc
0x1451c7952: mov rdi, qword ptr [rbp + 0x58]
0x1451c7956: cmp qword ptr [rdi + 0x28], 0
0x1451c795b: jne 0x1451c6e31
0x1451c7961: xor eax, eax
0x1451c7963: jmp 0x1451c7110
0x1451c7968: mov byte ptr [rbp + 0x117], 1
0x1451c796f: mov byte ptr [rbp + 0x116], 0
0x1451c7976: mov ecx, 1
0x1451c797b: mov edx, 1
0x1451c7980: call 0x145eb6fcb
0x1451c7985: nop
0x1451c7986: ud2
