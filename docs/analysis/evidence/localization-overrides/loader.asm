1458e4b30: push	rbp
1458e4b31: push	r15
1458e4b33: push	r14
1458e4b35: push	r13
1458e4b37: push	r12
1458e4b39: push	rsi
1458e4b3a: push	rdi
1458e4b3b: push	rbx
1458e4b3c: sub	rsp, 0x1d8
1458e4b43: lea	rbp, [rsp + 0x80]
1458e4b4b: mov	qword ptr [rbp + 0x150], 0xfffffffffffffffe
1458e4b56: mov	rdi, rcx
1458e4b59: mov	qword ptr [rbp - 8], rdx
1458e4b5d: mov	qword ptr [rbp], r8
1458e4b61: lea	rax, [rbp - 8]
1458e4b65: mov	qword ptr [rbp + 0x118], rax
1458e4b6c: lea	rax, [rip - 0x58e2ab3]
1458e4b73: mov	qword ptr [rbp + 0x120], rax
1458e4b7a: lea	rdx, [rip + 0x1306640]
1458e4b81: lea	rcx, [rbp + 0x58]
1458e4b85: lea	r8, [rbp + 0x118]
1458e4b8c: call	0x145bc5690
1458e4b91: mov	qword ptr [rbp + 0xe8], 0
1458e4b9c: mov	qword ptr [rbp + 0xf0], 8
1458e4ba7: mov	qword ptr [rbp + 0xf8], 0
1458e4bb2: mov	byte ptr [rbp + 0x14f], 1
1458e4bb9: lea	rcx, [rbp + 0x118]
1458e4bc0: call	0x145bacbe0
1458e4bc5: nop
1458e4bc6: mov	rax, qword ptr [rbp + 0x118]
1458e4bcd: cmp	rax, -1
1458e4bd1: je	0x1458e4cbb
1458e4bd7: mov	qword ptr [rbp + 0x140], rax
1458e4bde: mov	rcx, qword ptr [rbp + 0x120]
1458e4be5: mov	rdx, qword ptr [rbp + 0x128]
1458e4bec: mov	qword ptr [rbp + 0x138], rcx
1458e4bf3: call	0x145b9f6d0
1458e4bf8: nop
1458e4bf9: test	rax, rax
1458e4bfc: je	0x1458e5262
1458e4c02: mov	r8, rdx
1458e4c05: lea	rcx, [rbp + 0x118]
1458e4c0c: mov	rdx, rax
1458e4c0f: call	0x145bc4e10
1458e4c14: nop
1458e4c15: mov	rsi, qword ptr [rbp + 0x118]
1458e4c1c: mov	rax, qword ptr [rbp + 0x120]
1458e4c23: mov	qword ptr [rbp + 0x100], rax
1458e4c2a: movups	xmm0, xmmword ptr [rbp + 0x128]
1458e4c31: movaps	xmmword ptr [rbp - 0x50], xmm0
1458e4c35: mov	rdx, qword ptr [rbp + 0x140]
1458e4c3c: test	rdx, rdx
1458e4c3f: je	0x1458e4c53
1458e4c41: mov	r8d, 1
1458e4c47: mov	rcx, qword ptr [rbp + 0x138]
1458e4c4e: call	0x1400021d0
1458e4c53: cmp	rsi, -1
1458e4c57: je	0x1458e4cf9
1458e4c5d: mov	qword ptr [rbp + 0x140], rsi
1458e4c64: mov	rsi, qword ptr [rbp + 0xf8]
1458e4c6b: cmp	rsi, qword ptr [rbp + 0xe8]
1458e4c72: jne	0x1458e4c81
1458e4c74: lea	rcx, [rbp + 0xe8]
1458e4c7b: call	0x145bf4ee0
1458e4c80: nop
1458e4c81: mov	rax, qword ptr [rbp + 0xf0]
1458e4c88: mov	rcx, rsi
1458e4c8b: shl	rcx, 5
1458e4c8f: mov	rdx, qword ptr [rbp + 0x140]
1458e4c96: mov	qword ptr [rax + rcx], rdx
1458e4c9a: mov	rdx, qword ptr [rbp + 0x100]
1458e4ca1: mov	qword ptr [rax + rcx + 8], rdx
1458e4ca6: movaps	xmm0, xmmword ptr [rbp - 0x50]
1458e4caa: movups	xmmword ptr [rax + rcx + 0x10], xmm0
1458e4caf: inc	rsi
1458e4cb2: mov	qword ptr [rbp + 0xf8], rsi
1458e4cb9: jmp	0x1458e4cf9
1458e4cbb: mov	rax, qword ptr [rbp + 0x120]
1458e4cc2: mov	ecx, eax
1458e4cc4: and	ecx, 3
1458e4cc7: lea	edx, [rcx - 2]
1458e4cca: cmp	edx, 2
1458e4ccd: jb	0x1458e4cf9
1458e4ccf: test	rcx, rcx
1458e4cd2: je	0x1458e4cf9
1458e4cd4: dec	rax
1458e4cd7: lea	rcx, [rbp + 0x98]
1458e4cde: mov	qword ptr [rbp + 0x98], rax
1458e4ce5: mov	byte ptr [rbp + 0x90], 3
1458e4cec: mov	byte ptr [rbp + 0x14f], 1
1458e4cf3: call	0x145bd8020
1458e4cf8: nop
1458e4cf9: mov	byte ptr [rbp + 0x14f], 1
1458e4d00: lea	rcx, [rbp + 0x118]
1458e4d07: call	0x1458e8400
1458e4d0c: nop
1458e4d0d: mov	rax, qword ptr [rbp + 0x118]
1458e4d14: cmp	rax, -1
1458e4d18: mov	qword ptr [rbp + 0x40], rdi
1458e4d1c: je	0x1458e4d81
1458e4d1e: mov	qword ptr [rbp + 0x140], rax
1458e4d25: mov	rbx, qword ptr [rbp + 0xf8]
1458e4d2c: cmp	rbx, qword ptr [rbp + 0xe8]
1458e4d33: jne	0x1458e4d50
1458e4d35: mov	rax, qword ptr [rbp + 0x120]
1458e4d3c: mov	qword ptr [rbp + 0x138], rax
1458e4d43: lea	rcx, [rbp + 0xe8]
1458e4d4a: call	0x145bf4ee0
1458e4d4f: nop
1458e4d50: mov	rdi, qword ptr [rbp + 0xf0]
1458e4d57: mov	rax, rbx
1458e4d5a: shl	rax, 5
1458e4d5e: movups	xmm0, xmmword ptr [rbp + 0x118]
1458e4d65: movups	xmm1, xmmword ptr [rbp + 0x128]
1458e4d6c: movups	xmmword ptr [rdi + rax + 0x10], xmm1
1458e4d71: movups	xmmword ptr [rdi + rax], xmm0
1458e4d75: inc	rbx
1458e4d78: mov	qword ptr [rbp + 0xf8], rbx
1458e4d7f: jmp	0x1458e4d8f
1458e4d81: mov	rdi, qword ptr [rbp + 0xf0]
1458e4d88: mov	rbx, qword ptr [rbp + 0xf8]
1458e4d8f: mov	qword ptr [rbp + 0xc0], 0
1458e4d9a: mov	qword ptr [rbp + 0xc8], 8
1458e4da5: mov	qword ptr [rbp + 0xd0], 0
1458e4db0: mov	rax, qword ptr [rbp + 0xe8]
1458e4db7: shl	rbx, 5
1458e4dbb: add	rbx, rdi
1458e4dbe: mov	qword ptr [rbp - 0x28], rdi
1458e4dc2: mov	qword ptr [rbp - 0x20], rdi
1458e4dc6: mov	qword ptr [rbp + 0x48], rax
1458e4dca: mov	qword ptr [rbp - 0x18], rax
1458e4dce: mov	qword ptr [rbp - 0x10], rbx
1458e4dd2: mov	eax, 8
1458e4dd7: mov	qword ptr [rbp + 0xb0], rax
1458e4dde: mov	qword ptr [rbp + 0xe0], 0
1458e4de9: lea	r12, [rbp + 0x118]
1458e4df0: lea	r13, [rbp + 8]
1458e4df4: mov	qword ptr [rbp + 0x50], rdi
1458e4df8: mov	rsi, qword ptr [rbp + 0x60]
1458e4dfc: mov	r15, qword ptr [rbp + 0x68]
1458e4e00: mov	r14, rdi
1458e4e03: jmp	0x1458e4e23
1458e4e05: nop	word ptr cs:[rax + rax]
1458e4e10: mov	r14, rdi
1458e4e13: mov	rdx, qword ptr [rbp + 0x140]
1458e4e1a: test	rdx, rdx
1458e4e1d: jne	0x1458e516e
1458e4e23: cmp	r14, rbx
1458e4e26: je	0x1458e51c1
1458e4e2c: lea	rdi, [r14 + 0x20]
1458e4e30: mov	qword ptr [rbp - 0x20], rdi
1458e4e34: mov	rax, qword ptr [r14]
1458e4e37: cmp	rax, -1
1458e4e3b: je	0x1458e51be
1458e4e41: mov	qword ptr [rbp + 0x140], rax
1458e4e48: mov	rdx, qword ptr [r14 + 8]
1458e4e4c: mov	r8, qword ptr [r14 + 0x10]
1458e4e50: mov	qword ptr [rsp + 0x20], 4
1458e4e59: mov	rcx, r12
1458e4e5c: mov	qword ptr [rbp + 0x100], rdx
1458e4e63: lea	r9, [rip + 0x130635f]
1458e4e6a: call	0x145b9f5a0
1458e4e6f: nop
1458e4e70: mov	rdx, qword ptr [rbp + 0x120]
1458e4e77: mov	r8, qword ptr [rbp + 0x128]
1458e4e7e: mov	qword ptr [rsp + 0x20], r15
1458e4e83: mov	rcx, r13
1458e4e86: mov	qword ptr [rbp + 0x138], rdx
1458e4e8d: mov	r9, rsi
1458e4e90: call	0x145b9f5a0
1458e4e95: nop
1458e4e96: mov	rdx, qword ptr [rbp + 0x118]
1458e4e9d: test	rdx, rdx
1458e4ea0: je	0x1458e4eb4
1458e4ea2: mov	r8d, 1
1458e4ea8: mov	rcx, qword ptr [rbp + 0x138]
1458e4eaf: call	0x1400021d0
1458e4eb4: mov	rdx, qword ptr [rbp + 0x10]
1458e4eb8: mov	r14, qword ptr [rbp + 0x18]
1458e4ebc: mov	rcx, r12
1458e4ebf: mov	qword ptr [rbp + 0x138], rdx
1458e4ec6: mov	r8, r14
1458e4ec9: call	0x145bb5af0
1458e4ece: nop
1458e4ecf: mov	rax, qword ptr [rbp + 0x118]
1458e4ed6: cmp	rax, -1
1458e4eda: jne	0x1458e4f40
1458e4edc: mov	rax, qword ptr [rbp + 0x120]
1458e4ee3: mov	ecx, eax
1458e4ee5: and	ecx, 3
1458e4ee8: lea	edx, [rcx - 2]
1458e4eeb: cmp	edx, 2
1458e4eee: jb	0x1458e4f13
1458e4ef0: test	rcx, rcx
1458e4ef3: je	0x1458e4f13
1458e4ef5: dec	rax
1458e4ef8: mov	qword ptr [rbp + 0x98], rax
1458e4eff: mov	byte ptr [rbp + 0x90], 3
1458e4f06: lea	rcx, [rbp + 0x98]
1458e4f0d: call	0x145bd8020
1458e4f12: nop
1458e4f13: mov	rdx, qword ptr [rbp + 8]
1458e4f17: test	rdx, rdx
1458e4f1a: je	0x1458e4e10
1458e4f20: mov	r8d, 1
1458e4f26: mov	rcx, qword ptr [rbp + 0x138]
1458e4f2d: call	0x1400021d0
1458e4f32: jmp	0x1458e4e10
1458e4f37: nop	word ptr [rax + rax]
1458e4f40: mov	qword ptr [rbp + 0x108], rax
1458e4f47: mov	rdx, qword ptr [rbp + 0x120]
1458e4f4e: mov	r8, qword ptr [rbp + 0x128]
1458e4f55: lea	rcx, [rbp + 0x90]
1458e4f5c: mov	qword ptr [rbp + 0xd8], rdx
1458e4f63: call	0x1458e6a10
1458e4f68: nop
1458e4f69: cmp	dword ptr [rbp + 0x90], 1
1458e4f70: jne	0x1458e5068
1458e4f76: lea	rcx, [rbp + 0x98]
1458e4f7d: mov	rax, qword ptr [rcx + 0x10]
1458e4f81: mov	qword ptr [rbp + 0x80], rax
1458e4f88: movups	xmm0, xmmword ptr [rcx]
1458e4f8b: movaps	xmmword ptr [rbp + 0x70], xmm0
1458e4f8f: mov	rax, qword ptr [rbp + 0x138]
1458e4f96: mov	qword ptr [rbp - 0x38], rax
1458e4f9a: mov	qword ptr [rbp - 0x30], r14
1458e4f9e: lea	rax, [rbp - 0x38]
1458e4fa2: mov	qword ptr [rbp + 0x118], rax
1458e4fa9: lea	rax, [rip + 0x2d3590]
1458e4fb0: mov	qword ptr [rbp + 0x120], rax
1458e4fb7: lea	rax, [rbp + 0x70]
1458e4fbb: mov	qword ptr [rbp + 0x128], rax
1458e4fc2: lea	rax, [rip - 0x58e2ee9]
1458e4fc9: mov	qword ptr [rbp + 0x130], rax
1458e4fd0: lea	rsi, [rbp + 0x28]
1458e4fd4: mov	rcx, rsi
1458e4fd7: lea	rdx, [rip + 0x13061ef]
1458e4fde: mov	r8, r12
1458e4fe1: call	0x145bc5690
1458e4fe6: nop
1458e4fe7: mov	rax, qword ptr [rbp + 0x28]
1458e4feb: mov	qword ptr [rbp + 0x110], rax
1458e4ff2: mov	rcx, qword ptr [rbp + 0x30]
1458e4ff6: mov	rax, qword ptr [rbp + 0x38]
1458e4ffa: mov	qword ptr [rbp + 0xb8], rcx
1458e5001: mov	qword ptr [rbp + 0x28], rcx
1458e5005: mov	qword ptr [rbp + 0x30], rax
1458e5009: mov	qword ptr [rbp + 0x118], rsi
1458e5010: lea	rax, [rip - 0x58e2f57]
1458e5017: mov	qword ptr [rbp + 0x120], rax
1458e501e: lea	rcx, [rip + 0x1306293]
1458e5025: mov	rdx, r12
1458e5028: call	0x145baedf0
1458e502d: nop
1458e502e: mov	rdx, qword ptr [rbp + 0x110]
1458e5035: test	rdx, rdx
1458e5038: je	0x1458e504c
1458e503a: mov	r8d, 1
1458e5040: mov	rcx, qword ptr [rbp + 0xb8]
1458e5047: call	0x1400021d0
1458e504c: mov	rdx, qword ptr [rbp + 0x70]
1458e5050: test	rdx, rdx
1458e5053: je	0x1458e5125
1458e5059: mov	rcx, qword ptr [rbp + 0x78]
1458e505d: mov	r8d, 1
1458e5063: jmp	0x1458e5120
1458e5068: mov	r15, qword ptr [rbp + 0x98]
1458e506f: mov	rsi, qword ptr [rbp + 0xa0]
1458e5076: mov	r14, qword ptr [rbp + 0xa8]
1458e507d: mov	rax, r14
1458e5080: shl	rax, 4
1458e5084: lea	rax, [rax + rax*2]
1458e5088: mov	qword ptr [rbp + 0x110], rax
1458e508f: add	rax, rsi
1458e5092: mov	qword ptr [rbp + 0x118], rsi
1458e5099: mov	qword ptr [rbp + 0x128], r15
1458e50a0: mov	qword ptr [rbp + 0x120], rsi
1458e50a7: mov	qword ptr [rbp + 0x130], rax
1458e50ae: mov	rax, qword ptr [rbp + 0xc0]
1458e50b5: mov	rdx, qword ptr [rbp + 0xe0]
1458e50bc: sub	rax, rdx
1458e50bf: cmp	r14, rax
1458e50c2: ja	0x1458e5185
1458e50c8: test	r14, r14
1458e50cb: je	0x1458e50f9
1458e50cd: mov	qword ptr [rbp + 0xe0], rdx
1458e50d4: lea	rcx, [rdx + rdx*2]
1458e50d8: shl	rcx, 4
1458e50dc: add	rcx, qword ptr [rbp + 0xb0]
1458e50e3: mov	rdx, rsi
1458e50e6: mov	r8, qword ptr [rbp + 0x110]
1458e50ed: call	0x145bf293b
1458e50f2: mov	rdx, qword ptr [rbp + 0xe0]
1458e50f9: add	rdx, r14
1458e50fc: mov	qword ptr [rbp + 0xe0], rdx
1458e5103: mov	qword ptr [rbp + 0xd0], rdx
1458e510a: test	r15, r15
1458e510d: je	0x1458e5125
1458e510f: shl	r15, 4
1458e5113: lea	rdx, [r15 + r15*2]
1458e5117: mov	r8d, 8
1458e511d: mov	rcx, rsi
1458e5120: call	0x1400021d0
1458e5125: mov	rdx, qword ptr [rbp + 0x108]
1458e512c: test	rdx, rdx
1458e512f: je	0x1458e5143
1458e5131: mov	r8d, 1
1458e5137: mov	rcx, qword ptr [rbp + 0xd8]
1458e513e: call	0x1400021d0
1458e5143: mov	rdx, qword ptr [rbp + 8]
1458e5147: test	rdx, rdx
1458e514a: je	0x1458e515e
1458e514c: mov	r8d, 1
1458e5152: mov	rcx, qword ptr [rbp + 0x138]
1458e5159: call	0x1400021d0
1458e515e: mov	rdx, qword ptr [rbp + 0x140]
1458e5165: test	rdx, rdx
1458e5168: je	0x1458e4df8
1458e516e: mov	r8d, 1
1458e5174: mov	rcx, qword ptr [rbp + 0x100]
1458e517b: call	0x1400021d0
1458e5180: jmp	0x1458e4df8
1458e5185: mov	qword ptr [rsp + 0x20], 0x30
1458e518e: mov	r9d, 8
1458e5194: lea	rcx, [rbp + 0xc0]
1458e519b: mov	r8, r14
1458e519e: call	0x145bf4a90
1458e51a3: nop
1458e51a4: mov	rax, qword ptr [rbp + 0xc8]
1458e51ab: mov	qword ptr [rbp + 0xb0], rax
1458e51b2: mov	rdx, qword ptr [rbp + 0xd0]
1458e51b9: jmp	0x1458e50cd
1458e51be: mov	r14, rdi
1458e51c1: sub	rbx, r14
1458e51c4: mov	rsi, qword ptr [rbp + 0x40]
1458e51c8: je	0x1458e5202
1458e51ca: shr	rbx, 5
1458e51ce: add	r14, 8
1458e51d2: jmp	0x1458e51e9
1458e51d4: nop	word ptr cs:[rax + rax]
1458e51e0: add	r14, 0x20
1458e51e4: dec	rbx
1458e51e7: je	0x1458e5202
1458e51e9: mov	rdx, qword ptr [r14 - 8]
1458e51ed: test	rdx, rdx
1458e51f0: je	0x1458e51e0
1458e51f2: mov	rcx, qword ptr [r14]
1458e51f5: mov	r8d, 1
1458e51fb: call	0x1400021d0
1458e5200: jmp	0x1458e51e0
1458e5202: mov	rdx, qword ptr [rbp + 0x48]
1458e5206: test	rdx, rdx
1458e5209: je	0x1458e521e
1458e520b: shl	rdx, 5
1458e520f: mov	r8d, 8
1458e5215: mov	rcx, qword ptr [rbp + 0x50]
1458e5219: call	0x1400021d0
1458e521e: mov	rax, qword ptr [rbp + 0xd0]
1458e5225: mov	qword ptr [rsi + 0x10], rax
1458e5229: movups	xmm0, xmmword ptr [rbp + 0xc0]
1458e5230: movups	xmmword ptr [rsi], xmm0
1458e5233: mov	rdx, qword ptr [rbp + 0x58]
1458e5237: test	rdx, rdx
1458e523a: je	0x1458e524b
1458e523c: mov	rcx, qword ptr [rbp + 0x60]
1458e5240: mov	r8d, 1
1458e5246: call	0x1400021d0
1458e524b: mov	rax, rsi
1458e524e: add	rsp, 0x1d8
1458e5255: pop	rbx
1458e5256: pop	rdi
1458e5257: pop	rsi
1458e5258: pop	r12
1458e525a: pop	r13
1458e525c: pop	r14
1458e525e: pop	r15
1458e5260: pop	rbp
1458e5261: ret
1458e5262: mov	rsi, 0xffffffffffffffff
1458e5269: mov	rdx, qword ptr [rbp + 0x140]
1458e5270: test	rdx, rdx
1458e5273: jne	0x1458e4c41
1458e5279: jmp	0x1458e4c53
