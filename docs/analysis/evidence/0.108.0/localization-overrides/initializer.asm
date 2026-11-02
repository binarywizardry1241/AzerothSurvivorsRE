1459caea0: push	rbp
1459caea1: push	r15
1459caea3: push	r14
1459caea5: push	r13
1459caea7: push	r12
1459caea9: push	rsi
1459caeaa: push	rdi
1459caeab: push	rbx
1459caeac: sub	rsp, 0x108
1459caeb3: lea	rbp, [rsp + 0x80]
1459caebb: mov	qword ptr [rbp + 0x80], 0xfffffffffffffffe
1459caec6: mov	rbx, rcx
1459caec9: mov	rax, qword ptr [r8]
1459caecc: mov	qword ptr [rbp + 0x18], rax
1459caed0: mov	rcx, qword ptr [r8 + 8]
1459caed4: cmp	rbx, rdx
1459caed7: je	0x1459cb239
1459caedd: mov	rax, qword ptr [r8 + 0x10]
1459caee1: mov	qword ptr [rbp - 0x20], rax
1459caee5: sub	rdx, rbx
1459caee8: shr	rdx, 3
1459caeec: movabs	rax, 0x6db6db6db6db6db7
1459caef6: imul	rax, rdx
1459caefa: mov	qword ptr [rbp - 0x18], rax
1459caefe: xor	r12d, r12d
1459caf01: lea	r13, [rbp + 0x20]
1459caf05: lea	r15, [rip - 0x59c8e4c]
1459caf0c: lea	rsi, [rbp + 0x50]
1459caf10: lea	r14, [rbp - 0x60]
1459caf14: mov	qword ptr [rbp - 0x28], rbx
1459caf18: jmp	0x1459caf81
1459caf1a: nop	word ptr [rax + rax]
1459caf20: movups	xmm0, xmmword ptr [rbp - 0x60]
1459caf24: movups	xmm1, xmmword ptr [rbp - 0x50]
1459caf28: movups	xmm2, xmmword ptr [rbp - 0x40]
1459caf2c: movaps	xmmword ptr [rbp + 0x20], xmm0
1459caf30: movaps	xmmword ptr [rbp + 0x30], xmm1
1459caf34: movaps	xmmword ptr [rbp + 0x40], xmm2
1459caf38: mov	rcx, qword ptr [rbp + 0x10]
1459caf3c: lea	rax, [rcx + rcx*2]
1459caf40: shl	rax, 4
1459caf44: mov	rdx, qword ptr [rbp - 0x20]
1459caf48: movups	xmmword ptr [rdx + rax + 0x20], xmm2
1459caf4d: movups	xmmword ptr [rdx + rax + 0x10], xmm1
1459caf52: movups	xmmword ptr [rdx + rax], xmm0
1459caf56: inc	rcx
1459caf59: mov	r12, qword ptr [rbp + 0x70]
1459caf5d: inc	r12
1459caf60: cmp	r12, qword ptr [rbp - 0x18]
1459caf64: mov	rbx, qword ptr [rbp - 0x28]
1459caf68: lea	r13, [rbp + 0x20]
1459caf6c: lea	r15, [rip - 0x59c8eb3]
1459caf73: lea	rsi, [rbp + 0x50]
1459caf77: lea	r14, [rbp - 0x60]
1459caf7b: je	0x1459cb239
1459caf81: mov	qword ptr [rbp + 0x10], rcx
1459caf85: imul	rdi, r12, 0x38
1459caf89: mov	rdx, qword ptr [rbx + rdi + 0x20]
1459caf8e: mov	r8, qword ptr [rbx + rdi + 0x28]
1459caf93: mov	rcx, r13
1459caf96: call	0x1458e6a10
1459caf9b: nop
1459caf9c: add	rdi, rbx
1459caf9f: cmp	dword ptr [rbp + 0x20], 1
1459cafa3: jne	0x1459cb060
1459cafa9: lea	rcx, [rbp + 0x28]
1459cafad: mov	rax, qword ptr [rcx + 0x10]
1459cafb1: mov	qword ptr [rbp], rax
1459cafb5: movups	xmm0, xmmword ptr [rcx]
1459cafb8: movaps	xmmword ptr [rbp - 0x10], xmm0
1459cafbc: mov	qword ptr [rbp - 0x60], rdi
1459cafc0: mov	qword ptr [rbp - 0x58], r15
1459cafc4: lea	rax, [rbp - 0x10]
1459cafc8: mov	qword ptr [rbp - 0x50], rax
1459cafcc: lea	rax, [rip - 0x59c8ef3]
1459cafd3: mov	qword ptr [rbp - 0x48], rax
1459cafd7: mov	rcx, rsi
1459cafda: lea	rdx, [rip + 0x1831b33]
1459cafe1: mov	r8, r14
1459cafe4: call	0x145bc5690
1459cafe9: nop
1459cafea: mov	rax, qword ptr [rbp + 0x50]
1459cafee: mov	qword ptr [rbp + 0x70], rax
1459caff2: mov	rcx, qword ptr [rbp + 0x58]
1459caff6: mov	rax, qword ptr [rbp + 0x60]
1459caffa: mov	qword ptr [rbp + 0x68], rcx
1459caffe: mov	qword ptr [rbp + 0x50], rcx
1459cb002: mov	qword ptr [rbp + 0x58], rax
1459cb006: mov	qword ptr [rbp - 0x60], rsi
1459cb00a: mov	qword ptr [rbp - 0x58], r15
1459cb00e: lea	rcx, [rip + 0x12202a3]
1459cb015: mov	rdx, r14
1459cb018: call	0x145baedf0
1459cb01d: nop
1459cb01e: mov	rdx, qword ptr [rbp + 0x70]
1459cb022: test	rdx, rdx
1459cb025: je	0x1459cb036
1459cb027: mov	r8d, 1
1459cb02d: mov	rcx, qword ptr [rbp + 0x68]
1459cb031: call	0x1400021d0
1459cb036: mov	rdx, qword ptr [rbp - 0x10]
1459cb03a: test	rdx, rdx
1459cb03d: je	0x1459cb04e
1459cb03f: mov	rcx, qword ptr [rbp - 8]
1459cb043: mov	r8d, 1
1459cb049: call	0x1400021d0
1459cb04e: mov	eax, 8
1459cb053: xor	edx, edx
1459cb055: xor	ecx, ecx
1459cb057: jmp	0x1459cb06c
1459cb059: nop	dword ptr [rax]
1459cb060: mov	rcx, qword ptr [rbp + 0x28]
1459cb064: mov	rax, qword ptr [rbp + 0x30]
1459cb068: mov	rdx, qword ptr [rbp + 0x38]
1459cb06c: lea	rdx, [rdx + rdx*2]
1459cb070: shl	rdx, 4
1459cb074: add	rdx, rax
1459cb077: mov	qword ptr [rbp + 0x20], rax
1459cb07b: mov	qword ptr [rbp + 0x28], rax
1459cb07f: mov	qword ptr [rbp + 0x30], rcx
1459cb083: mov	qword ptr [rbp + 0x38], rdx
1459cb087: mov	rcx, r14
1459cb08a: mov	rdx, r13
1459cb08d: call	0x145999230
1459cb092: nop
1459cb093: mov	qword ptr [rbp + 0x70], r12
1459cb097: mov	rdx, qword ptr [rdi]
1459cb09a: mov	r8, qword ptr [rdi + 8]
1459cb09e: mov	rcx, r13
1459cb0a1: call	0x1458e4b30
1459cb0a6: nop
1459cb0a7: mov	rax, qword ptr [rbp + 0x20]
1459cb0ab: mov	r13, qword ptr [rbp + 0x28]
1459cb0af: mov	rcx, qword ptr [rbp + 0x30]
1459cb0b3: lea	r15, [rcx + rcx*2]
1459cb0b7: shl	r15, 4
1459cb0bb: add	r15, r13
1459cb0be: mov	qword ptr [rbp + 0x20], r13
1459cb0c2: mov	qword ptr [rbp + 0x28], r13
1459cb0c6: mov	qword ptr [rbp + 0x68], rax
1459cb0ca: mov	qword ptr [rbp + 0x30], rax
1459cb0ce: mov	qword ptr [rbp + 0x38], r15
1459cb0d2: mov	rax, r13
1459cb0d5: mov	qword ptr [rbp - 0x30], r13
1459cb0d9: test	rcx, rcx
1459cb0dc: je	0x1459cb1a0
1459cb0e2: nop	word ptr cs:[rax + rax]
1459cb0f0: lea	r13, [rax + 0x30]
1459cb0f4: mov	qword ptr [rbp + 0x28], r13
1459cb0f8: mov	r8, qword ptr [rax]
1459cb0fb: cmp	r8, -1
1459cb0ff: je	0x1459cb1a0
1459cb105: movups	xmm0, xmmword ptr [rax + 8]
1459cb109: lea	rdx, [rbp + 0x58]
1459cb10d: movups	xmmword ptr [rdx], xmm0
1459cb110: mov	rdi, qword ptr [rax + 0x18]
1459cb114: mov	rcx, qword ptr [rax + 0x20]
1459cb118: mov	rbx, qword ptr [rax + 0x28]
1459cb11c: mov	qword ptr [rbp + 0x50], r8
1459cb120: cmp	rdi, rbx
1459cb123: jbe	0x1459cb150
1459cb125: test	rbx, rbx
1459cb128: je	0x1459cb155
1459cb12a: mov	r8d, 1
1459cb130: mov	rdx, rdi
1459cb133: mov	rsi, rcx
1459cb136: mov	r9, rbx
1459cb139: call	0x1400021e0
1459cb13e: mov	r12, rax
1459cb141: test	rax, rax
1459cb144: jne	0x1459cb170
1459cb146: jmp	0x1459cb254
1459cb14b: nop	dword ptr [rax + rax]
1459cb150: mov	r12, rcx
1459cb153: jmp	0x1459cb170
1459cb155: mov	r12d, 1
1459cb15b: mov	r8d, 1
1459cb161: mov	rdx, rdi
1459cb164: call	0x1400021d0
1459cb169: nop	dword ptr [rax]
1459cb170: mov	byte ptr [rbp + 0x7f], 0
1459cb174: mov	rcx, r14
1459cb177: lea	rdx, [rbp + 0x50]
1459cb17b: mov	r8, r12
1459cb17e: mov	r9, rbx
1459cb181: call	0x14599a6d0
1459cb186: nop
1459cb187: mov	rax, r13
1459cb18a: cmp	r13, r15
1459cb18d: jne	0x1459cb0f0
1459cb193: jmp	0x1459cb210
1459cb195: nop	word ptr cs:[rax + rax]
1459cb1a0: mov	rax, r15
1459cb1a3: sub	rax, r13
1459cb1a6: movabs	rcx, 0xaaaaaaaaaaaaaaab
1459cb1b0: mul	rcx
1459cb1b3: cmp	r15, r13
1459cb1b6: je	0x1459cb210
1459cb1b8: mov	rbx, rdx
1459cb1bb: shr	rbx, 5
1459cb1bf: add	r13, 0x20
1459cb1c3: jmp	0x1459cb1d9
1459cb1c5: nop	word ptr cs:[rax + rax]
1459cb1d0: add	r13, 0x30
1459cb1d4: dec	rbx
1459cb1d7: je	0x1459cb210
1459cb1d9: mov	rdx, qword ptr [r13 - 0x20]
1459cb1dd: test	rdx, rdx
1459cb1e0: je	0x1459cb1f1
1459cb1e2: mov	rcx, qword ptr [r13 - 0x18]
1459cb1e6: mov	r8d, 1
1459cb1ec: call	0x1400021d0
1459cb1f1: mov	rdx, qword ptr [r13 - 8]
1459cb1f5: test	rdx, rdx
1459cb1f8: je	0x1459cb1d0
1459cb1fa: mov	rcx, qword ptr [r13]
1459cb1fe: mov	r8d, 1
1459cb204: call	0x1400021d0
1459cb209: jmp	0x1459cb1d0
1459cb20b: nop	dword ptr [rax + rax]
1459cb210: mov	rax, qword ptr [rbp + 0x68]
1459cb214: test	rax, rax
1459cb217: je	0x1459caf20
1459cb21d: shl	rax, 4
1459cb221: lea	rdx, [rax + rax*2]
1459cb225: mov	r8d, 8
1459cb22b: mov	rcx, qword ptr [rbp - 0x30]
1459cb22f: call	0x1400021d0
1459cb234: jmp	0x1459caf20
1459cb239: mov	rax, qword ptr [rbp + 0x18]
1459cb23d: mov	qword ptr [rax], rcx
1459cb240: add	rsp, 0x108
1459cb247: pop	rbx
1459cb248: pop	rdi
1459cb249: pop	rsi
1459cb24a: pop	r12
1459cb24c: pop	r13
1459cb24e: pop	r14
1459cb250: pop	r15
1459cb252: pop	rbp
1459cb253: ret
1459cb254: mov	qword ptr [rbp + 0x68], rsi
1459cb258: mov	qword ptr [rbp + 0x70], rdi
1459cb25c: mov	ecx, 1
1459cb261: mov	rdx, rbx
1459cb264: call	0x145d934fb
1459cb269: nop
1459cb26a: ud2
