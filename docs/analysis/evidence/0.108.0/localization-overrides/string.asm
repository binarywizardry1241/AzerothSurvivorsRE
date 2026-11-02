1458e2970: push	rbp
1458e2971: push	r15
1458e2973: push	r14
1458e2975: push	r13
1458e2977: push	r12
1458e2979: push	rsi
1458e297a: push	rdi
1458e297b: push	rbx
1458e297c: sub	rsp, 0xb8
1458e2983: lea	rbp, [rsp + 0x80]
1458e298b: mov	qword ptr [rbp + 0x30], 0xfffffffffffffffe
1458e2993: mov	rdi, rdx
1458e2996: mov	rsi, rcx
1458e2999: lea	rcx, [rbp - 0x10]
1458e299d: mov	r8b, 0x22
1458e29a0: call	0x1458e2760
1458e29a5: cmp	qword ptr [rbp - 0x10], -1
1458e29aa: je	0x1458e29ca
1458e29ac: mov	rax, qword ptr [rbp]
1458e29b0: mov	qword ptr [rsi + 0x18], rax
1458e29b4: movdqu	xmm0, xmmword ptr [rbp - 0x10]
1458e29b9: movdqu	xmmword ptr [rsi + 8], xmm0
1458e29be: mov	qword ptr [rsi], 1
1458e29c5: jmp	0x1458e301f
1458e29ca: mov	qword ptr [rbp + 0x10], 0
1458e29d2: mov	qword ptr [rbp + 0x18], 1
1458e29da: mov	qword ptr [rbp + 0x20], 0
1458e29e2: xor	r15d, r15d
1458e29e5: lea	r12, [rip + 0x15b5fe4]
1458e29ec: mov	rcx, qword ptr [rdi + 8]
1458e29f0: mov	rax, qword ptr [rdi + 0x10]
1458e29f4: cmp	rax, rcx
1458e29f7: jb	0x1458e2a5c
1458e29f9: inc	rax
1458e29fc: mov	qword ptr [rdi + 0x10], rax
1458e2a00: lea	rdx, [rip + 0x13084e0]
1458e2a07: mov	qword ptr [rbp - 0x38], rdx
1458e2a0b: mov	qword ptr [rbp - 0x30], 0x13
1458e2a13: cmp	rcx, rax
1458e2a16: cmovb	rax, rcx
1458e2a1a: test	rax, rax
1458e2a1d: je	0x1458e2dcd
1458e2a23: mov	rcx, qword ptr [rdi]
1458e2a26: cmp	rax, 4
1458e2a2a: jae	0x1458e2dd5
1458e2a30: xor	edx, edx
1458e2a32: xor	r8d, r8d
1458e2a35: jmp	0x1458e3033
1458e2a3a: nop	word ptr [rax + rax]
1458e2a40: mov	rax, qword ptr [rbp + 0x18]
1458e2a44: mov	byte ptr [rax + r15], bl
1458e2a48: inc	r15
1458e2a4b: mov	qword ptr [rbp + 0x20], r15
1458e2a4f: mov	rcx, qword ptr [rdi + 8]
1458e2a53: mov	rax, qword ptr [rdi + 0x10]
1458e2a57: cmp	rax, rcx
1458e2a5a: jae	0x1458e29f9
1458e2a5c: mov	r13, qword ptr [rdi]
1458e2a5f: movzx	ebx, byte ptr [r13 + rax]
1458e2a65: lea	r14, [rax + 1]
1458e2a69: mov	qword ptr [rdi + 0x10], r14
1458e2a6d: cmp	ebx, 0x5c
1458e2a70: je	0x1458e2aa0
1458e2a72: cmp	ebx, 0x22
1458e2a75: je	0x1458e2d34
1458e2a7b: cmp	r15, qword ptr [rbp + 0x10]
1458e2a7f: jne	0x1458e2a40
1458e2a81: mov	byte ptr [rbp + 0x2f], 1
1458e2a85: lea	rcx, [rbp + 0x10]
1458e2a89: call	0x145d933f0
1458e2a8e: nop
1458e2a8f: jmp	0x1458e2a40
1458e2a91: nop	word ptr cs:[rax + rax]
1458e2aa0: cmp	r14, rcx
1458e2aa3: jae	0x1458e2d8c
1458e2aa9: movzx	r14d, byte ptr [r13 + rax + 1]
1458e2aaf: add	rax, 2
1458e2ab3: mov	qword ptr [rdi + 0x10], rax
1458e2ab7: lea	ecx, [r14 - 0x22]
1458e2abb: cmp	ecx, 0x53
1458e2abe: ja	0x1458e2f38
1458e2ac4: movsxd	rcx, dword ptr [r12 + rcx*4]
1458e2ac8: add	rcx, r12
1458e2acb: jmp	rcx
1458e2acd: cmp	r15, qword ptr [rbp + 0x10]
1458e2ad1: jne	0x1458e2ae1
1458e2ad3: mov	byte ptr [rbp + 0x2f], 1
1458e2ad7: lea	rcx, [rbp + 0x10]
1458e2adb: call	0x145d933f0
1458e2ae0: nop
1458e2ae1: mov	rax, qword ptr [rbp + 0x18]
1458e2ae5: mov	byte ptr [rax + r15], r14b
1458e2ae9: jmp	0x1458e2a48
1458e2aee: cmp	r15, qword ptr [rbp + 0x10]
1458e2af2: jne	0x1458e2b02
1458e2af4: mov	byte ptr [rbp + 0x2f], 1
1458e2af8: lea	rcx, [rbp + 0x10]
1458e2afc: call	0x145d933f0
1458e2b01: nop
1458e2b02: mov	rax, qword ptr [rbp + 0x18]
1458e2b06: mov	byte ptr [rax + r15], 8
1458e2b0b: jmp	0x1458e2a48
1458e2b10: cmp	r15, qword ptr [rbp + 0x10]
1458e2b14: jne	0x1458e2b24
1458e2b16: mov	byte ptr [rbp + 0x2f], 1
1458e2b1a: lea	rcx, [rbp + 0x10]
1458e2b1e: call	0x145d933f0
1458e2b23: nop
1458e2b24: mov	rax, qword ptr [rbp + 0x18]
1458e2b28: mov	byte ptr [rax + r15], 0xc
1458e2b2d: jmp	0x1458e2a48
1458e2b32: mov	byte ptr [rbp + 0x2f], 1
1458e2b36: lea	rcx, [rbp - 0x10]
1458e2b3a: mov	rdx, rdi
1458e2b3d: call	0x1458e22b0
1458e2b42: nop
1458e2b43: mov	rax, qword ptr [rbp - 0x10]
1458e2b47: mov	r14d, dword ptr [rbp - 8]
1458e2b4b: cmp	rax, -1
1458e2b4f: jne	0x1458e2fea
1458e2b55: mov	eax, r14d
1458e2b58: and	eax, 0xfffffc00
1458e2b5d: cmp	eax, 0xd800
1458e2b62: jne	0x1458e2bbc
1458e2b64: mov	rax, qword ptr [rdi + 0x10]
1458e2b68: cmp	rax, -2
1458e2b6c: jae	0x1458e2bbc
1458e2b6e: lea	rcx, [rax + 2]
1458e2b72: cmp	rcx, qword ptr [rdi + 8]
1458e2b76: ja	0x1458e2bbc
1458e2b78: mov	rdx, qword ptr [rdi]
1458e2b7b: cmp	word ptr [rdx + rax], 0x755c
1458e2b81: jne	0x1458e2bbc
1458e2b83: mov	qword ptr [rdi + 0x10], rcx
1458e2b87: mov	byte ptr [rbp + 0x2f], 1
1458e2b8b: lea	rcx, [rbp - 0x10]
1458e2b8f: mov	rdx, rdi
1458e2b92: call	0x1458e22b0
1458e2b97: nop
1458e2b98: mov	rcx, qword ptr [rbp - 0x10]
1458e2b9c: mov	eax, dword ptr [rbp - 8]
1458e2b9f: cmp	rcx, -1
1458e2ba3: jne	0x1458e3005
1458e2ba9: shl	r14d, 0xa
1458e2bad: and	eax, 0x3ff
1458e2bb2: add	r14d, eax
1458e2bb5: add	r14d, 0xfca10000
1458e2bbc: mov	eax, r14d
1458e2bbf: xor	eax, 0xd800
1458e2bc4: add	eax, 0xffef0000
1458e2bc9: cmp	eax, 0xffef0800
1458e2bce: mov	eax, 0xfffd
1458e2bd3: cmovb	r14d, eax
1458e2bd7: mov	dword ptr [rbp - 0x10], 0
1458e2bde: cmp	r14d, 0x80
1458e2be5: jae	0x1458e2c5c
1458e2be7: mov	byte ptr [rbp - 0x10], r14b
1458e2beb: mov	r15d, 1
1458e2bf1: jmp	0x1458e2ccd
1458e2bf6: cmp	r15, qword ptr [rbp + 0x10]
1458e2bfa: jne	0x1458e2c0a
1458e2bfc: mov	byte ptr [rbp + 0x2f], 1
1458e2c00: lea	rcx, [rbp + 0x10]
1458e2c04: call	0x145d933f0
1458e2c09: nop
1458e2c0a: mov	rax, qword ptr [rbp + 0x18]
1458e2c0e: mov	byte ptr [rax + r15], 0xd
1458e2c13: jmp	0x1458e2a48
1458e2c18: cmp	r15, qword ptr [rbp + 0x10]
1458e2c1c: jne	0x1458e2c2c
1458e2c1e: mov	byte ptr [rbp + 0x2f], 1
1458e2c22: lea	rcx, [rbp + 0x10]
1458e2c26: call	0x145d933f0
1458e2c2b: nop
1458e2c2c: mov	rax, qword ptr [rbp + 0x18]
1458e2c30: mov	byte ptr [rax + r15], 0xa
1458e2c35: jmp	0x1458e2a48
1458e2c3a: cmp	r15, qword ptr [rbp + 0x10]
1458e2c3e: jne	0x1458e2c4e
1458e2c40: mov	byte ptr [rbp + 0x2f], 1
1458e2c44: lea	rcx, [rbp + 0x10]
1458e2c48: call	0x145d933f0
1458e2c4d: nop
1458e2c4e: mov	rax, qword ptr [rbp + 0x18]
1458e2c52: mov	byte ptr [rax + r15], 9
1458e2c57: jmp	0x1458e2a48
1458e2c5c: mov	eax, r14d
1458e2c5f: and	al, 0x3f
1458e2c61: or	al, 0x80
1458e2c63: mov	ecx, r14d
1458e2c66: shr	ecx, 6
1458e2c69: cmp	r14d, 0x800
1458e2c70: jae	0x1458e2c83
1458e2c72: or	cl, 0xc0
1458e2c75: mov	byte ptr [rbp - 0x10], cl
1458e2c78: mov	byte ptr [rbp - 0xf], al
1458e2c7b: mov	r15d, 2
1458e2c81: jmp	0x1458e2ccd
1458e2c83: and	cl, 0x3f
1458e2c86: or	cl, 0x80
1458e2c89: mov	edx, r14d
1458e2c8c: shr	edx, 0xc
1458e2c8f: cmp	r14d, 0xffff
1458e2c96: ja	0x1458e2cac
1458e2c98: or	dl, 0xe0
1458e2c9b: mov	byte ptr [rbp - 0x10], dl
1458e2c9e: mov	byte ptr [rbp - 0xf], cl
1458e2ca1: mov	byte ptr [rbp - 0xe], al
1458e2ca4: mov	r15d, 3
1458e2caa: jmp	0x1458e2ccd
1458e2cac: and	dl, 0x3f
1458e2caf: or	dl, 0x80
1458e2cb2: shr	r14d, 0x12
1458e2cb6: or	r14b, 0xf0
1458e2cba: mov	byte ptr [rbp - 0x10], r14b
1458e2cbe: mov	byte ptr [rbp - 0xf], dl
1458e2cc1: mov	byte ptr [rbp - 0xe], cl
1458e2cc4: mov	byte ptr [rbp - 0xd], al
1458e2cc7: mov	r15d, 4
1458e2ccd: mov	rax, qword ptr [rbp + 0x10]
1458e2cd1: mov	rdx, qword ptr [rbp + 0x20]
1458e2cd5: sub	rax, rdx
1458e2cd8: cmp	r15, rax
1458e2cdb: ja	0x1458e2d0e
1458e2cdd: add	rdx, qword ptr [rbp + 0x18]
1458e2ce1: mov	rcx, rdx
1458e2ce4: lea	rdx, [rbp - 0x10]
1458e2ce8: mov	r8, r15
1458e2ceb: call	0x145bf293b
1458e2cf0: add	r15, qword ptr [rbp + 0x20]
1458e2cf4: mov	qword ptr [rbp + 0x20], r15
1458e2cf8: mov	rcx, qword ptr [rdi + 8]
1458e2cfc: mov	rax, qword ptr [rdi + 0x10]
1458e2d00: cmp	rax, rcx
1458e2d03: jb	0x1458e2a5c
1458e2d09: jmp	0x1458e29f9
1458e2d0e: mov	byte ptr [rbp + 0x2f], 1
1458e2d12: mov	qword ptr [rsp + 0x20], 1
1458e2d1b: mov	r9d, 1
1458e2d21: lea	rcx, [rbp + 0x10]
1458e2d25: mov	r8, r15
1458e2d28: call	0x145bf4a90
1458e2d2d: nop
1458e2d2e: mov	rdx, qword ptr [rbp + 0x20]
1458e2d32: jmp	0x1458e2cdd
1458e2d34: mov	rax, qword ptr [rbp + 0x10]
1458e2d38: mov	qword ptr [rbp - 0x18], rax
1458e2d3c: mov	rdx, qword ptr [rbp + 0x18]
1458e2d40: lea	rcx, [rbp - 0x10]
1458e2d44: mov	qword ptr [rbp - 0x20], rdx
1458e2d48: mov	r8, r15
1458e2d4b: call	0x145bcdeb0
1458e2d50: nop
1458e2d51: cmp	byte ptr [rbp - 0x10], 0
1458e2d55: je	0x1458e2e69
1458e2d5b: cmp	qword ptr [rbp - 0x18], -1
1458e2d60: je	0x1458e2e7d
1458e2d66: lea	rax, [rip + 0x1308030]
1458e2d6d: mov	qword ptr [rbp - 0x38], rax
1458e2d71: mov	qword ptr [rbp - 0x30], 9
1458e2d79: cmp	r14, 4
1458e2d7d: jae	0x1458e2ea0
1458e2d83: xor	eax, eax
1458e2d85: xor	ecx, ecx
1458e2d87: jmp	0x1458e30c9
1458e2d8c: add	rax, 2
1458e2d90: mov	qword ptr [rdi + 0x10], rax
1458e2d94: lea	rdx, [rip + 0x130815f]
1458e2d9b: mov	qword ptr [rbp - 0x38], rdx
1458e2d9f: mov	qword ptr [rbp - 0x30], 0xa
1458e2da7: cmp	rcx, rax
1458e2daa: cmovae	rcx, rax
1458e2dae: test	rax, rax
1458e2db1: mov	rax, rcx
1458e2db4: je	0x1458e2e73
1458e2dba: cmp	rax, 4
1458e2dbe: jae	0x1458e2f55
1458e2dc4: xor	ecx, ecx
1458e2dc6: xor	edx, edx
1458e2dc8: jmp	0x1458e314b
1458e2dcd: xor	r8d, r8d
1458e2dd0: jmp	0x1458e3049
1458e2dd5: mov	rdx, rax
1458e2dd8: and	rdx, 0xfffffffffffffffc
1458e2ddc: pxor	xmm0, xmm0
1458e2de0: xor	r8d, r8d
1458e2de3: movdqa	xmm1, xmmword ptr [rip + 0x7788a5]
1458e2deb: movdqa	xmm3, xmmword ptr [rip + 0x4b49dd]
1458e2df3: pxor	xmm2, xmm2
1458e2df7: nop	word ptr [rax + rax]
1458e2e00: movzx	r9d, word ptr [rcx + r8]
1458e2e05: movd	xmm4, r9d
1458e2e0a: movzx	r9d, word ptr [rcx + r8 + 2]
1458e2e10: movd	xmm5, r9d
1458e2e15: pcmpeqb	xmm4, xmm1
1458e2e19: punpcklbw	xmm4, xmm4
1458e2e1d: pshuflw	xmm4, xmm4, 0xd4
1458e2e22: pshufd	xmm4, xmm4, 0xd4
1458e2e27: pand	xmm4, xmm3
1458e2e2b: paddq	xmm2, xmm4
1458e2e2f: pcmpeqb	xmm5, xmm1
1458e2e33: punpcklbw	xmm5, xmm5
1458e2e37: pshuflw	xmm4, xmm5, 0xd4
1458e2e3c: pshufd	xmm4, xmm4, 0xd4
1458e2e41: pand	xmm4, xmm3
1458e2e45: paddq	xmm0, xmm4
1458e2e49: add	r8, 4
1458e2e4d: cmp	rdx, r8
1458e2e50: jne	0x1458e2e00
1458e2e52: paddq	xmm0, xmm2
1458e2e56: pshufd	xmm1, xmm0, 0xee
1458e2e5b: paddq	xmm1, xmm0
1458e2e5f: movq	r8, xmm1
1458e2e64: jmp	0x1458e3044
1458e2e69: mov	rax, qword ptr [rbp - 0x18]
1458e2e6d: mov	rcx, qword ptr [rbp - 0x20]
1458e2e71: jmp	0x1458e2e88
1458e2e73: mov	edx, 1
1458e2e78: jmp	0x1458e3166
1458e2e7d: mov	rax, qword ptr [rbp - 0x20]
1458e2e81: mov	rcx, r15
1458e2e84: mov	r15, qword ptr [rbp - 8]
1458e2e88: mov	qword ptr [rsi + 8], rax
1458e2e8c: mov	qword ptr [rsi + 0x10], rcx
1458e2e90: mov	qword ptr [rsi + 0x18], r15
1458e2e94: mov	qword ptr [rsi], 0
1458e2e9b: jmp	0x1458e301f
1458e2ea0: mov	rax, r14
1458e2ea3: and	rax, 0xfffffffffffffffc
1458e2ea7: pxor	xmm0, xmm0
1458e2eab: xor	ecx, ecx
1458e2ead: movdqa	xmm1, xmmword ptr [rip + 0x7787db]
1458e2eb5: movdqa	xmm3, xmmword ptr [rip + 0x4b4913]
1458e2ebd: pxor	xmm2, xmm2
1458e2ec1: nop	word ptr cs:[rax + rax]
1458e2ed0: movzx	edx, word ptr [r13 + rcx]
1458e2ed6: movd	xmm4, edx
1458e2eda: movzx	edx, word ptr [r13 + rcx + 2]
1458e2ee0: movd	xmm5, edx
1458e2ee4: pcmpeqb	xmm4, xmm1
1458e2ee8: punpcklbw	xmm4, xmm4
1458e2eec: pshuflw	xmm4, xmm4, 0xd4
1458e2ef1: pshufd	xmm4, xmm4, 0xd4
1458e2ef6: pand	xmm4, xmm3
1458e2efa: paddq	xmm2, xmm4
1458e2efe: pcmpeqb	xmm5, xmm1
1458e2f02: punpcklbw	xmm5, xmm5
1458e2f06: pshuflw	xmm4, xmm5, 0xd4
1458e2f0b: pshufd	xmm4, xmm4, 0xd4
1458e2f10: pand	xmm4, xmm3
1458e2f14: paddq	xmm0, xmm4
1458e2f18: add	rcx, 4
1458e2f1c: cmp	rax, rcx
1458e2f1f: jne	0x1458e2ed0
1458e2f21: paddq	xmm0, xmm2
1458e2f25: pshufd	xmm1, xmm0, 0xee
1458e2f2a: paddq	xmm1, xmm0
1458e2f2e: movq	rcx, xmm1
1458e2f33: jmp	0x1458e30da
1458e2f38: lea	rcx, [rip + 0x1307fbb]
1458e2f3f: mov	qword ptr [rbp - 0x38], rcx
1458e2f43: mov	qword ptr [rbp - 0x30], 0xa
1458e2f4b: cmp	rax, 4
1458e2f4f: jb	0x1458e2dc4
1458e2f55: mov	rcx, rax
1458e2f58: and	rcx, 0xfffffffffffffffc
1458e2f5c: pxor	xmm0, xmm0
1458e2f60: xor	edx, edx
1458e2f62: movdqa	xmm1, xmmword ptr [rip + 0x778726]
1458e2f6a: movdqa	xmm3, xmmword ptr [rip + 0x4b485e]
1458e2f72: pxor	xmm2, xmm2
1458e2f76: nop	word ptr cs:[rax + rax]
1458e2f80: movzx	r8d, word ptr [r13 + rdx]
1458e2f86: movd	xmm4, r8d
1458e2f8b: movzx	r8d, word ptr [r13 + rdx + 2]
1458e2f91: movd	xmm5, r8d
1458e2f96: pcmpeqb	xmm4, xmm1
1458e2f9a: punpcklbw	xmm4, xmm4
1458e2f9e: pshuflw	xmm4, xmm4, 0xd4
1458e2fa3: pshufd	xmm4, xmm4, 0xd4
1458e2fa8: pand	xmm4, xmm3
1458e2fac: paddq	xmm2, xmm4
1458e2fb0: pcmpeqb	xmm5, xmm1
1458e2fb4: punpcklbw	xmm5, xmm5
1458e2fb8: pshuflw	xmm4, xmm5, 0xd4
1458e2fbd: pshufd	xmm4, xmm4, 0xd4
1458e2fc2: pand	xmm4, xmm3
1458e2fc6: paddq	xmm0, xmm4
1458e2fca: add	rdx, 4
1458e2fce: cmp	rcx, rdx
1458e2fd1: jne	0x1458e2f80
1458e2fd3: paddq	xmm0, xmm2
1458e2fd7: pshufd	xmm1, xmm0, 0xee
1458e2fdc: paddq	xmm1, xmm0
1458e2fe0: movq	rdx, xmm1
1458e2fe5: jmp	0x1458e315e
1458e2fea: mov	ecx, dword ptr [rbp + 4]
1458e2fed: mov	dword ptr [rsi + 0x1c], ecx
1458e2ff0: mov	rcx, qword ptr [rbp - 4]
1458e2ff4: mov	qword ptr [rsi + 0x14], rcx
1458e2ff8: mov	qword ptr [rsi + 8], rax
1458e2ffc: mov	dword ptr [rsi + 0x10], r14d
1458e3000: jmp	0x1458e30a1
1458e3005: mov	edx, dword ptr [rbp + 4]
1458e3008: mov	dword ptr [rsi + 0x1c], edx
1458e300b: mov	rdx, qword ptr [rbp - 4]
1458e300f: mov	qword ptr [rsi + 0x14], rdx
1458e3013: mov	qword ptr [rsi + 8], rcx
1458e3017: mov	dword ptr [rsi + 0x10], eax
1458e301a: jmp	0x1458e30a1
1458e301f: add	rsp, 0xb8
1458e3026: pop	rbx
1458e3027: pop	rdi
1458e3028: pop	rsi
1458e3029: pop	r12
1458e302b: pop	r13
1458e302d: pop	r14
1458e302f: pop	r15
1458e3031: pop	rbp
1458e3032: ret
1458e3033: xor	r9d, r9d
1458e3036: cmp	byte ptr [rcx + rdx], 0xa
1458e303a: sete	r9b
1458e303e: add	r8, r9
1458e3041: inc	rdx
1458e3044: cmp	rax, rdx
1458e3047: jne	0x1458e3033
1458e3049: inc	r8
1458e304c: mov	qword ptr [rbp - 0x28], r8
1458e3050: lea	rax, [rbp - 0x28]
1458e3054: mov	qword ptr [rbp - 0x10], rax
1458e3058: lea	rax, [rip + 0x2f4fd1]
1458e305f: mov	qword ptr [rbp - 8], rax
1458e3063: lea	rax, [rbp - 0x38]
1458e3067: mov	qword ptr [rbp], rax
1458e306b: lea	rax, [rip - 0x58e0fb2]
1458e3072: mov	qword ptr [rbp + 8], rax
1458e3076: mov	byte ptr [rbp + 0x2f], 1
1458e307a: lea	rdx, [rip + 0x1307e4e]
1458e3081: lea	rcx, [rbp - 0x50]
1458e3085: lea	r8, [rbp - 0x10]
1458e3089: call	0x145bc5690
1458e308e: nop
1458e308f: mov	rax, qword ptr [rbp - 0x40]
1458e3093: mov	qword ptr [rsi + 0x18], rax
1458e3097: movdqu	xmm0, xmmword ptr [rbp - 0x50]
1458e309c: movdqu	xmmword ptr [rsi + 8], xmm0
1458e30a1: mov	qword ptr [rsi], 1
1458e30a8: mov	rdx, qword ptr [rbp + 0x10]
1458e30ac: test	rdx, rdx
1458e30af: je	0x1458e301f
1458e30b5: mov	rcx, qword ptr [rbp + 0x18]
1458e30b9: mov	r8d, 1
1458e30bf: call	0x1400021d0
1458e30c4: jmp	0x1458e301f
1458e30c9: xor	edx, edx
1458e30cb: cmp	byte ptr [r13 + rax], 0xa
1458e30d1: sete	dl
1458e30d4: add	rcx, rdx
1458e30d7: inc	rax
1458e30da: cmp	r14, rax
1458e30dd: jne	0x1458e30c9
1458e30df: inc	rcx
1458e30e2: mov	qword ptr [rbp - 0x28], rcx
1458e30e6: lea	rax, [rbp - 0x28]
1458e30ea: mov	qword ptr [rbp - 0x10], rax
1458e30ee: lea	rax, [rip + 0x2f4f3b]
1458e30f5: mov	qword ptr [rbp - 8], rax
1458e30f9: lea	rax, [rbp - 0x38]
1458e30fd: mov	qword ptr [rbp], rax
1458e3101: lea	rax, [rip - 0x58e1048]
1458e3108: mov	qword ptr [rbp + 8], rax
1458e310c: lea	rdx, [rip + 0x1307dbc]
1458e3113: lea	rcx, [rbp - 0x50]
1458e3117: lea	r8, [rbp - 0x10]
1458e311b: call	0x145bc5690
1458e3120: nop
1458e3121: mov	rdx, qword ptr [rbp - 0x18]
1458e3125: test	rdx, rdx
1458e3128: je	0x1458e3139
1458e312a: mov	r8d, 1
1458e3130: mov	rcx, qword ptr [rbp - 0x20]
1458e3134: call	0x1400021d0
1458e3139: mov	rax, qword ptr [rbp - 0x40]
1458e313d: mov	qword ptr [rsi + 0x18], rax
1458e3141: movdqu	xmm0, xmmword ptr [rbp - 0x50]
1458e3146: jmp	0x1458e29b9
1458e314b: xor	r8d, r8d
1458e314e: cmp	byte ptr [r13 + rcx], 0xa
1458e3154: sete	r8b
1458e3158: add	rdx, r8
1458e315b: inc	rcx
1458e315e: cmp	rax, rcx
1458e3161: jne	0x1458e314b
1458e3163: inc	rdx
1458e3166: mov	qword ptr [rbp - 0x28], rdx
1458e316a: lea	rax, [rbp - 0x28]
1458e316e: mov	qword ptr [rbp - 0x10], rax
1458e3172: lea	rax, [rip + 0x2f4eb7]
1458e3179: mov	qword ptr [rbp - 8], rax
1458e317d: lea	rax, [rbp - 0x38]
1458e3181: mov	qword ptr [rbp], rax
1458e3185: lea	rax, [rip - 0x58e10cc]
1458e318c: mov	qword ptr [rbp + 8], rax
1458e3190: mov	byte ptr [rbp + 0x2f], 1
1458e3194: lea	rdx, [rip + 0x1307d34]
1458e319b: lea	rcx, [rbp - 0x50]
1458e319f: lea	r8, [rbp - 0x10]
1458e31a3: call	0x145bc5690
1458e31a8: nop
1458e31a9: jmp	0x1458e308f
