1458e6a10: push	rbp
1458e6a11: push	r15
1458e6a13: push	r14
1458e6a15: push	r13
1458e6a17: push	r12
1458e6a19: push	rsi
1458e6a1a: push	rdi
1458e6a1b: push	rbx
1458e6a1c: sub	rsp, 0xe8
1458e6a23: lea	rbp, [rsp + 0x80]
1458e6a2b: mov	qword ptr [rbp + 0x60], 0xfffffffffffffffe
1458e6a33: mov	rsi, rcx
1458e6a36: mov	rcx, r8
1458e6a39: sub	rcx, rdx
1458e6a3c: sub	rcx, r8
1458e6a3f: xor	r9d, r9d
1458e6a42: jmp	0x1458e6a7d
1458e6a44: nop	word ptr cs:[rax + rax]
1458e6a50: movzx	edi, byte ptr [r9 + 3]
1458e6a55: add	r9, 4
1458e6a59: and	r11d, 7
1458e6a5d: shl	r11d, 0x12
1458e6a61: shl	r10d, 6
1458e6a65: and	edi, 0x3f
1458e6a68: or	edi, r10d
1458e6a6b: or	edi, r11d
1458e6a6e: mov	r10d, edi
1458e6a71: add	r9, rcx
1458e6a74: cmp	r10d, 0xfeff
1458e6a7b: jne	0x1458e6ad5
1458e6a7d: cmp	r9, r8
1458e6a80: je	0x1458e6ad2
1458e6a82: mov	rax, r9
1458e6a85: add	r9, rdx
1458e6a88: movzx	ebx, byte ptr [r9]
1458e6a8c: test	bl, bl
1458e6a8e: jns	0x1458e6ad5
1458e6a90: cmp	bl, 0xe0
1458e6a93: jb	0x1458e6ad5
1458e6a95: movzx	r11d, bl
1458e6a99: and	r11d, 0x1f
1458e6a9d: movzx	edi, byte ptr [r9 + 1]
1458e6aa2: and	edi, 0x3f
1458e6aa5: movzx	r10d, byte ptr [r9 + 2]
1458e6aaa: shl	edi, 6
1458e6aad: and	r10d, 0x3f
1458e6ab1: or	r10d, edi
1458e6ab4: cmp	bl, 0xf0
1458e6ab7: jae	0x1458e6a50
1458e6ab9: add	r9, 3
1458e6abd: shl	r11d, 0xc
1458e6ac1: or	r10d, r11d
1458e6ac4: add	r9, rcx
1458e6ac7: cmp	r10d, 0xfeff
1458e6ace: je	0x1458e6a7d
1458e6ad0: jmp	0x1458e6ad5
1458e6ad2: mov	rax, r8
1458e6ad5: add	rdx, rax
1458e6ad8: mov	qword ptr [rbp + 8], 0
1458e6ae0: mov	qword ptr [rbp + 0x10], 8
1458e6ae8: mov	qword ptr [rbp + 0x18], 0
1458e6af0: sub	r8, rax
1458e6af3: mov	qword ptr [rbp + 0x30], rdx
1458e6af7: mov	qword ptr [rbp + 0x38], r8
1458e6afb: je	0x1458e6b2e
1458e6afd: xor	eax, eax
1458e6aff: movabs	rcx, 0x100002600
1458e6b09: nop	dword ptr [rax]
1458e6b10: movzx	r9d, byte ptr [rdx + rax]
1458e6b15: cmp	r9, 0x20
1458e6b19: ja	0x1458e6b30
1458e6b1b: bt	rcx, r9
1458e6b1f: jae	0x1458e6b30
1458e6b21: inc	rax
1458e6b24: cmp	r8, rax
1458e6b27: jne	0x1458e6b10
1458e6b29: mov	rax, r8
1458e6b2c: jmp	0x1458e6b30
1458e6b2e: xor	eax, eax
1458e6b30: mov	qword ptr [rbp + 0x40], rax
1458e6b34: lea	rcx, [rbp - 0x28]
1458e6b38: lea	rdx, [rbp + 0x30]
1458e6b3c: mov	r8b, 0x7b
1458e6b3f: call	0x1458e2760
1458e6b44: nop
1458e6b45: cmp	qword ptr [rbp - 0x28], -1
1458e6b4a: je	0x1458e6bf1
1458e6b50: mov	rax, qword ptr [rbp - 0x18]
1458e6b54: mov	qword ptr [rsi + 0x18], rax
1458e6b58: movdqu	xmm0, xmmword ptr [rbp - 0x28]
1458e6b5d: movdqu	xmmword ptr [rsi + 8], xmm0
1458e6b62: mov	qword ptr [rsi], 1
1458e6b69: mov	rdi, qword ptr [rbp + 0x18]
1458e6b6d: test	rdi, rdi
1458e6b70: je	0x1458e6bba
1458e6b72: mov	rbx, qword ptr [rbp + 0x10]
1458e6b76: add	rbx, 0x20
1458e6b7a: jmp	0x1458e6b89
1458e6b7c: nop	dword ptr [rax]
1458e6b80: add	rbx, 0x30
1458e6b84: dec	rdi
1458e6b87: je	0x1458e6bba
1458e6b89: mov	rdx, qword ptr [rbx - 0x20]
1458e6b8d: test	rdx, rdx
1458e6b90: je	0x1458e6ba1
1458e6b92: mov	rcx, qword ptr [rbx - 0x18]
1458e6b96: mov	r8d, 1
1458e6b9c: call	0x1400021d0
1458e6ba1: mov	rdx, qword ptr [rbx - 8]
1458e6ba5: test	rdx, rdx
1458e6ba8: je	0x1458e6b80
1458e6baa: mov	rcx, qword ptr [rbx]
1458e6bad: mov	r8d, 1
1458e6bb3: call	0x1400021d0
1458e6bb8: jmp	0x1458e6b80
1458e6bba: mov	rax, qword ptr [rbp + 8]
1458e6bbe: test	rax, rax
1458e6bc1: je	0x1458e6bda
1458e6bc3: mov	rcx, qword ptr [rbp + 0x10]
1458e6bc7: shl	rax, 4
1458e6bcb: lea	rdx, [rax + rax*2]
1458e6bcf: mov	r8d, 8
1458e6bd5: call	0x1400021d0
1458e6bda: mov	rax, rsi
1458e6bdd: add	rsp, 0xe8
1458e6be4: pop	rbx
1458e6be5: pop	rdi
1458e6be6: pop	rsi
1458e6be7: pop	r12
1458e6be9: pop	r13
1458e6beb: pop	r14
1458e6bed: pop	r15
1458e6bef: pop	rbp
1458e6bf0: ret
1458e6bf1: mov	r14, qword ptr [rbp + 0x38]
1458e6bf5: mov	r12, qword ptr [rbp + 0x40]
1458e6bf9: cmp	r12, r14
1458e6bfc: jae	0x1458e6c4e
1458e6bfe: mov	rax, qword ptr [rbp + 0x30]
1458e6c02: movabs	rcx, 0x100002600
1458e6c0c: nop	dword ptr [rax]
1458e6c10: movzx	edx, byte ptr [rax + r12]
1458e6c15: cmp	rdx, 0x20
1458e6c19: ja	0x1458e6c2e
1458e6c1b: bt	rcx, rdx
1458e6c1f: jae	0x1458e6c2e
1458e6c21: inc	r12
1458e6c24: cmp	r14, r12
1458e6c27: jne	0x1458e6c10
1458e6c29: mov	r12, r14
1458e6c2c: jmp	0x1458e6c4e
1458e6c2e: cmp	edx, 0x7d
1458e6c31: jne	0x1458e6c4e
1458e6c33: mov	rax, qword ptr [rbp + 0x18]
1458e6c37: mov	qword ptr [rsi + 0x18], rax
1458e6c3b: movdqu	xmm0, xmmword ptr [rbp + 8]
1458e6c40: movdqu	xmmword ptr [rsi + 8], xmm0
1458e6c45: mov	qword ptr [rsi], 0
1458e6c4c: jmp	0x1458e6bda
1458e6c4e: movabs	r15, 0x100002600
1458e6c58: lea	rdi, [rbp - 0x28]
1458e6c5c: lea	rbx, [rbp + 0x30]
1458e6c60: cmp	r12, r14
1458e6c63: jae	0x1458e6c8c
1458e6c65: mov	rax, qword ptr [rbp + 0x30]
1458e6c69: nop	dword ptr [rax]
1458e6c70: movzx	ecx, byte ptr [rax + r12]
1458e6c75: cmp	rcx, 0x20
1458e6c79: ja	0x1458e6c8c
1458e6c7b: bt	r15, rcx
1458e6c7f: jae	0x1458e6c8c
1458e6c81: inc	r12
1458e6c84: cmp	r14, r12
1458e6c87: jne	0x1458e6c70
1458e6c89: mov	r12, r14
1458e6c8c: mov	qword ptr [rbp + 0x40], r12
1458e6c90: mov	rcx, rdi
1458e6c93: mov	rdx, rbx
1458e6c96: call	0x1458e2970
1458e6c9b: nop
1458e6c9c: mov	rax, qword ptr [rbp - 0x20]
1458e6ca0: mov	qword ptr [rbp + 0x50], rax
1458e6ca4: mov	rax, qword ptr [rbp - 0x18]
1458e6ca8: mov	qword ptr [rbp + 0x48], rax
1458e6cac: mov	r14, qword ptr [rbp - 0x10]
1458e6cb0: cmp	dword ptr [rbp - 0x28], 1
1458e6cb4: je	0x1458e6f59
1458e6cba: mov	rcx, qword ptr [rbp + 0x38]
1458e6cbe: mov	rax, qword ptr [rbp + 0x40]
1458e6cc2: cmp	rax, rcx
1458e6cc5: jae	0x1458e6cec
1458e6cc7: mov	rdx, qword ptr [rbp + 0x30]
1458e6ccb: nop	dword ptr [rax + rax]
1458e6cd0: movzx	r8d, byte ptr [rdx + rax]
1458e6cd5: cmp	r8, 0x20
1458e6cd9: ja	0x1458e6cec
1458e6cdb: bt	r15, r8
1458e6cdf: jae	0x1458e6cec
1458e6ce1: inc	rax
1458e6ce4: cmp	rcx, rax
1458e6ce7: jne	0x1458e6cd0
1458e6ce9: mov	rax, rcx
1458e6cec: mov	qword ptr [rbp + 0x40], rax
1458e6cf0: mov	byte ptr [rbp + 0x5f], 1
1458e6cf4: mov	rcx, rdi
1458e6cf7: mov	rdx, rbx
1458e6cfa: mov	r8b, 0x3a
1458e6cfd: call	0x1458e2760
1458e6d02: nop
1458e6d03: cmp	qword ptr [rbp - 0x28], -1
1458e6d08: jne	0x1458e6f72
1458e6d0e: mov	rcx, qword ptr [rbp + 0x38]
1458e6d12: mov	rax, qword ptr [rbp + 0x40]
1458e6d16: cmp	rax, rcx
1458e6d19: jae	0x1458e6d3c
1458e6d1b: mov	rdx, qword ptr [rbp + 0x30]
1458e6d1f: nop
1458e6d20: movzx	r8d, byte ptr [rdx + rax]
1458e6d25: cmp	r8, 0x20
1458e6d29: ja	0x1458e6d3c
1458e6d2b: bt	r15, r8
1458e6d2f: jae	0x1458e6d3c
1458e6d31: inc	rax
1458e6d34: cmp	rcx, rax
1458e6d37: jne	0x1458e6d20
1458e6d39: mov	rax, rcx
1458e6d3c: mov	qword ptr [rbp + 0x40], rax
1458e6d40: mov	byte ptr [rbp + 0x5f], 1
1458e6d44: mov	rcx, rdi
1458e6d47: mov	rdx, rbx
1458e6d4a: call	0x1458e2970
1458e6d4f: nop
1458e6d50: mov	rcx, qword ptr [rbp - 0x20]
1458e6d54: mov	rax, qword ptr [rbp - 0x18]
1458e6d58: mov	qword ptr [rbp + 0x28], rax
1458e6d5c: mov	rax, qword ptr [rbp - 0x10]
1458e6d60: cmp	dword ptr [rbp - 0x28], 1
1458e6d64: je	0x1458e6f8e
1458e6d6a: mov	qword ptr [rbp + 0x20], rcx
1458e6d6e: test	r14, r14
1458e6d71: je	0x1458e6d7f
1458e6d73: mov	r13b, 1
1458e6d76: mov	rcx, qword ptr [rbp + 0x48]
1458e6d7a: cmp	byte ptr [rcx], 0x5f
1458e6d7d: je	0x1458e6df1
1458e6d7f: mov	rcx, qword ptr [rbp + 0x50]
1458e6d83: mov	qword ptr [rbp - 0x28], rcx
1458e6d87: mov	rcx, qword ptr [rbp + 0x48]
1458e6d8b: mov	qword ptr [rbp - 0x20], rcx
1458e6d8f: mov	qword ptr [rbp - 0x18], r14
1458e6d93: mov	rcx, qword ptr [rbp + 0x20]
1458e6d97: mov	qword ptr [rbp - 0x10], rcx
1458e6d9b: mov	rcx, qword ptr [rbp + 0x28]
1458e6d9f: mov	qword ptr [rbp - 8], rcx
1458e6da3: mov	qword ptr [rbp], rax
1458e6da7: mov	r14, qword ptr [rbp + 0x18]
1458e6dab: cmp	r14, qword ptr [rbp + 8]
1458e6daf: jne	0x1458e6dbb
1458e6db1: lea	rcx, [rbp + 8]
1458e6db5: call	0x145bf4d90
1458e6dba: nop
1458e6dbb: mov	rax, qword ptr [rbp + 0x10]
1458e6dbf: lea	rcx, [r14 + r14*2]
1458e6dc3: shl	rcx, 4
1458e6dc7: movdqu	xmm0, xmmword ptr [rbp - 0x28]
1458e6dcc: movdqu	xmm1, xmmword ptr [rbp - 0x18]
1458e6dd1: movdqu	xmm2, xmmword ptr [rbp - 8]
1458e6dd6: movdqu	xmmword ptr [rax + rcx + 0x20], xmm2
1458e6ddc: movdqu	xmmword ptr [rax + rcx + 0x10], xmm1
1458e6de2: movdqu	xmmword ptr [rax + rcx], xmm0
1458e6de7: inc	r14
1458e6dea: mov	qword ptr [rbp + 0x18], r14
1458e6dee: xor	r13d, r13d
1458e6df1: mov	rax, qword ptr [rbp + 0x30]
1458e6df5: mov	r14, qword ptr [rbp + 0x38]
1458e6df9: mov	r12, qword ptr [rbp + 0x40]
1458e6dfd: cmp	r12, r14
1458e6e00: jae	0x1458e6e88
1458e6e06: inc	r12
1458e6e09: mov	rcx, r14
1458e6e0c: neg	rcx
1458e6e0f: nop
1458e6e10: movzx	edx, byte ptr [rax + r12 - 1]
1458e6e16: cmp	rdx, 0x20
1458e6e1a: ja	0x1458e6e34
1458e6e1c: bt	r15, rdx
1458e6e20: jae	0x1458e6e34
1458e6e22: lea	rdx, [rcx + r12]
1458e6e26: inc	rdx
1458e6e29: inc	r12
1458e6e2c: cmp	rdx, 1
1458e6e30: jne	0x1458e6e10
1458e6e32: jmp	0x1458e6e85
1458e6e34: mov	qword ptr [rbp + 0x40], r12
1458e6e38: cmp	edx, 0x2c
1458e6e3b: jne	0x1458e6faa
1458e6e41: test	r13b, r13b
1458e6e44: je	0x1458e6c60
1458e6e4a: mov	rdx, qword ptr [rbp + 0x20]
1458e6e4e: test	rdx, rdx
1458e6e51: je	0x1458e6e62
1458e6e53: mov	r8d, 1
1458e6e59: mov	rcx, qword ptr [rbp + 0x28]
1458e6e5d: call	0x1400021d0
1458e6e62: cmp	qword ptr [rbp + 0x50], 0
1458e6e67: je	0x1458e6c60
1458e6e6d: mov	r8d, 1
1458e6e73: mov	rcx, qword ptr [rbp + 0x48]
1458e6e77: mov	rdx, qword ptr [rbp + 0x50]
1458e6e7b: call	0x1400021d0
1458e6e80: jmp	0x1458e6c60
1458e6e85: mov	r12, r14
1458e6e88: inc	r12
1458e6e8b: mov	qword ptr [rbp + 0x40], r12
1458e6e8f: lea	rcx, [rip + 0x130442e]
1458e6e96: mov	qword ptr [rbp - 0x40], rcx
1458e6e9a: mov	qword ptr [rbp - 0x38], 0xf
1458e6ea2: cmp	r14, r12
1458e6ea5: cmovb	r12, r14
1458e6ea9: test	r12, r12
1458e6eac: je	0x1458e6ebd
1458e6eae: cmp	r12, 4
1458e6eb2: jae	0x1458e6ec4
1458e6eb4: xor	ecx, ecx
1458e6eb6: xor	edx, edx
1458e6eb8: jmp	0x1458e6ff7
1458e6ebd: xor	edx, edx
1458e6ebf: jmp	0x1458e700d
1458e6ec4: mov	rcx, r12
1458e6ec7: and	rcx, 0xfffffffffffffffc
1458e6ecb: pxor	xmm0, xmm0
1458e6ecf: xor	edx, edx
1458e6ed1: movdqa	xmm1, xmmword ptr [rip + 0x7747b7]
1458e6ed9: movdqa	xmm3, xmmword ptr [rip + 0x4b08ef]
1458e6ee1: pxor	xmm2, xmm2
1458e6ee5: nop	word ptr cs:[rax + rax]
1458e6ef0: movzx	r8d, word ptr [rax + rdx]
1458e6ef5: movd	xmm4, r8d
1458e6efa: movzx	r8d, word ptr [rax + rdx + 2]
1458e6f00: movd	xmm5, r8d
1458e6f05: pcmpeqb	xmm4, xmm1
1458e6f09: punpcklbw	xmm4, xmm4
1458e6f0d: pshuflw	xmm4, xmm4, 0xd4
1458e6f12: pshufd	xmm4, xmm4, 0xd4
1458e6f17: pand	xmm4, xmm3
1458e6f1b: paddq	xmm2, xmm4
1458e6f1f: pcmpeqb	xmm5, xmm1
1458e6f23: punpcklbw	xmm5, xmm5
1458e6f27: pshuflw	xmm4, xmm5, 0xd4
1458e6f2c: pshufd	xmm4, xmm4, 0xd4
1458e6f31: pand	xmm4, xmm3
1458e6f35: paddq	xmm0, xmm4
1458e6f39: add	rdx, 4
1458e6f3d: cmp	rcx, rdx
1458e6f40: jne	0x1458e6ef0
1458e6f42: paddq	xmm0, xmm2
1458e6f46: pshufd	xmm1, xmm0, 0xee
1458e6f4b: paddq	xmm1, xmm0
1458e6f4f: movq	rdx, xmm1
1458e6f54: jmp	0x1458e7008
1458e6f59: mov	rax, qword ptr [rbp + 0x50]
1458e6f5d: mov	qword ptr [rsi + 8], rax
1458e6f61: mov	rax, qword ptr [rbp + 0x48]
1458e6f65: mov	qword ptr [rsi + 0x10], rax
1458e6f69: mov	qword ptr [rsi + 0x18], r14
1458e6f6d: jmp	0x1458e6b62
1458e6f72: mov	rax, qword ptr [rbp - 0x18]
1458e6f76: mov	qword ptr [rsi + 0x18], rax
1458e6f7a: movups	xmm0, xmmword ptr [rbp - 0x28]
1458e6f7e: movups	xmmword ptr [rsi + 8], xmm0
1458e6f82: mov	qword ptr [rsi], 1
1458e6f89: jmp	0x1458e708b
1458e6f8e: mov	qword ptr [rsi + 8], rcx
1458e6f92: mov	rcx, qword ptr [rbp + 0x28]
1458e6f96: mov	qword ptr [rsi + 0x10], rcx
1458e6f9a: mov	qword ptr [rsi + 0x18], rax
1458e6f9e: mov	qword ptr [rsi], 1
1458e6fa5: jmp	0x1458e708b
1458e6faa: cmp	edx, 0x7d
1458e6fad: jne	0x1458e6e8f
1458e6fb3: test	r13b, r13b
1458e6fb6: je	0x1458e6c33
1458e6fbc: mov	rdx, qword ptr [rbp + 0x20]
1458e6fc0: test	rdx, rdx
1458e6fc3: je	0x1458e6fd4
1458e6fc5: mov	r8d, 1
1458e6fcb: mov	rcx, qword ptr [rbp + 0x28]
1458e6fcf: call	0x1400021d0
1458e6fd4: cmp	qword ptr [rbp + 0x50], 0
1458e6fd9: je	0x1458e6c33
1458e6fdf: mov	r8d, 1
1458e6fe5: mov	rcx, qword ptr [rbp + 0x48]
1458e6fe9: mov	rdx, qword ptr [rbp + 0x50]
1458e6fed: call	0x1400021d0
1458e6ff2: jmp	0x1458e6c33
1458e6ff7: xor	r8d, r8d
1458e6ffa: cmp	byte ptr [rax + rcx], 0xa
1458e6ffe: sete	r8b
1458e7002: add	rdx, r8
1458e7005: inc	rcx
1458e7008: cmp	r12, rcx
1458e700b: jne	0x1458e6ff7
1458e700d: inc	rdx
1458e7010: mov	qword ptr [rbp - 0x30], rdx
1458e7014: lea	rax, [rbp - 0x30]
1458e7018: mov	qword ptr [rbp - 0x28], rax
1458e701c: lea	rax, [rip + 0x2f100d]
1458e7023: mov	qword ptr [rbp - 0x20], rax
1458e7027: lea	rax, [rbp - 0x40]
1458e702b: mov	qword ptr [rbp - 0x18], rax
1458e702f: lea	rax, [rip - 0x58e4f76]
1458e7036: mov	qword ptr [rbp - 0x10], rax
1458e703a: mov	byte ptr [rbp + 0x5e], r13b
1458e703e: lea	rdx, [rip + 0x1303e8a]
1458e7045: lea	rcx, [rbp - 0x58]
1458e7049: lea	r8, [rbp - 0x28]
1458e704d: call	0x145bc5690
1458e7052: nop
1458e7053: mov	rax, qword ptr [rbp - 0x48]
1458e7057: mov	qword ptr [rsi + 0x18], rax
1458e705b: movups	xmm0, xmmword ptr [rbp - 0x58]
1458e705f: movups	xmmword ptr [rsi + 8], xmm0
1458e7063: mov	qword ptr [rsi], 1
1458e706a: test	r13b, r13b
1458e706d: je	0x1458e6b69
1458e7073: mov	rdx, qword ptr [rbp + 0x20]
1458e7077: test	rdx, rdx
1458e707a: je	0x1458e708b
1458e707c: mov	r8d, 1
1458e7082: mov	rcx, qword ptr [rbp + 0x28]
1458e7086: call	0x1400021d0
1458e708b: cmp	qword ptr [rbp + 0x50], 0
1458e7090: je	0x1458e6b69
1458e7096: mov	r8d, 1
1458e709c: mov	rcx, qword ptr [rbp + 0x48]
1458e70a0: mov	rdx, qword ptr [rbp + 0x50]
1458e70a4: call	0x1400021d0
1458e70a9: jmp	0x1458e6b69
