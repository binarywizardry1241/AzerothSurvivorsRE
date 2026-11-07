145bb5af0: push	rbp
145bb5af1: push	rsi
145bb5af2: push	rdi
145bb5af3: push	rbx
145bb5af4: sub	rsp, 0xc8
145bb5afb: lea	rbp, [rsp + 0x80]
145bb5b03: mov	qword ptr [rbp + 0x40], 0xfffffffffffffffe
145bb5b0b: mov	rax, r8
145bb5b0e: mov	rsi, rcx
145bb5b11: mov	dword ptr [rbp - 0x58], 0
145bb5b18: mov	qword ptr [rbp - 0x50], 0
145bb5b20: mov	dword ptr [rbp - 0x48], 7
145bb5b27: mov	qword ptr [rbp - 0x44], 0
145bb5b2f: mov	qword ptr [rbp - 0x3f], 0
145bb5b37: mov	byte ptr [rbp - 0x40], 1
145bb5b3b: lea	r8, [rbp - 0x58]
145bb5b3f: mov	rcx, rdx
145bb5b42: mov	rdx, rax
145bb5b45: call	0x145ba1680
145bb5b4a: test	al, 1
145bb5b4c: je	0x145bb5b5e
145bb5b4e: mov	qword ptr [rsi + 8], rdx
145bb5b52: mov	qword ptr [rsi], 0xffffffffffffffff
145bb5b59: jmp	0x145bb5cbb
145bb5b5e: mov	qword ptr [rbp + 0x20], rdx
145bb5b62: mov	qword ptr [rbp], rdx
145bb5b66: lea	rcx, [rbp - 0x58]
145bb5b6a: mov	rdx, rbp
145bb5b6d: call	0x145ba1790
145bb5b72: nop
145bb5b73: cmp	dword ptr [rbp - 0x58], 2
145bb5b77: jne	0x145bb5ba8
145bb5b79: mov	rax, qword ptr [rbp - 0x50]
145bb5b7d: mov	ecx, eax
145bb5b7f: and	ecx, 3
145bb5b82: lea	edx, [rcx - 2]
145bb5b85: cmp	edx, 2
145bb5b88: jb	0x145bb5ba4
145bb5b8a: test	rcx, rcx
145bb5b8d: je	0x145bb5ba4
145bb5b8f: dec	rax
145bb5b92: lea	rcx, [rbp - 0x50]
145bb5b96: mov	qword ptr [rbp - 0x50], rax
145bb5b9a: mov	byte ptr [rbp - 0x58], 3
145bb5b9e: call	0x145bd8020
145bb5ba3: nop
145bb5ba4: xor	edi, edi
145bb5ba6: jmp	0x145bb5bb1
145bb5ba8: mov	rbx, qword ptr [rbp - 0x20]
145bb5bac: mov	edi, 1
145bb5bb1: mov	qword ptr [rbp + 0x28], 0
145bb5bb9: mov	qword ptr [rbp + 0x30], 1
145bb5bc1: mov	qword ptr [rbp + 0x38], 0
145bb5bc9: test	rdi, rdi
145bb5bcc: mov	rdx, rbx
145bb5bcf: cmove	rdx, rdi
145bb5bd3: lea	rcx, [rbp + 0x28]
145bb5bd7: call	0x145bc3310
145bb5bdc: nop
145bb5bdd: cmp	rax, -1
145bb5be1: je	0x145bb5bf3
145bb5be3: movabs	rcx, 0x2600000003
145bb5bed: mov	rdi, qword ptr [rbp + 0x20]
145bb5bf1: jmp	0x145bb5c65
145bb5bf3: mov	rax, qword ptr [rbp + 0x38]
145bb5bf7: mov	qword ptr [rbp + 8], rax
145bb5bfb: mov	rcx, rbp
145bb5bfe: lea	rdx, [rbp + 0x28]
145bb5c02: mov	r8, rdi
145bb5c05: mov	r9, rbx
145bb5c08: call	0x145b99510
145bb5c0d: mov	qword ptr [rbp + 0x18], rax
145bb5c11: mov	qword ptr [rbp + 0x10], rdx
145bb5c15: mov	rdi, qword ptr [rbp + 0x38]
145bb5c19: mov	r8, rdi
145bb5c1c: mov	rax, qword ptr [rbp + 8]
145bb5c20: sub	r8, rax
145bb5c23: mov	rdx, qword ptr [rbp + 0x30]
145bb5c27: add	rdx, rax
145bb5c2a: lea	rcx, [rbp - 0x58]
145bb5c2e: call	0x145bcdeb0
145bb5c33: nop
145bb5c34: cmp	qword ptr [rbp - 0x58], 0
145bb5c39: je	0x145bb5c8a
145bb5c3b: lea	rax, [rip + 0x1676a06]
145bb5c42: test	byte ptr [rbp + 0x18], 1
145bb5c46: mov	rcx, qword ptr [rbp + 0x10]
145bb5c4a: cmove	rcx, rax
145bb5c4e: mov	edx, 1
145bb5c53: mov	rdi, qword ptr [rbp + 0x20]
145bb5c57: mov	rax, qword ptr [rbp + 8]
145bb5c5b: mov	qword ptr [rbp + 0x38], rax
145bb5c5f: cmp	rdx, 1
145bb5c63: jne	0x145bb5ca3
145bb5c65: mov	qword ptr [rsi + 8], rcx
145bb5c69: mov	qword ptr [rsi], 0xffffffffffffffff
145bb5c70: mov	rdx, qword ptr [rbp + 0x28]
145bb5c74: test	rdx, rdx
145bb5c77: je	0x145bb5cb2
145bb5c79: mov	rcx, qword ptr [rbp + 0x30]
145bb5c7d: mov	r8d, 1
145bb5c83: call	0x1400021d0
145bb5c88: jmp	0x145bb5cb2
145bb5c8a: mov	rax, rdi
145bb5c8d: mov	rdi, qword ptr [rbp + 0x20]
145bb5c91: mov	rcx, qword ptr [rbp + 0x10]
145bb5c95: mov	rdx, qword ptr [rbp + 0x18]
145bb5c99: mov	qword ptr [rbp + 0x38], rax
145bb5c9d: cmp	rdx, 1
145bb5ca1: je	0x145bb5c65
145bb5ca3: mov	rax, qword ptr [rbp + 0x38]
145bb5ca7: mov	qword ptr [rsi + 0x10], rax
145bb5cab: movups	xmm0, xmmword ptr [rbp + 0x28]
145bb5caf: movups	xmmword ptr [rsi], xmm0
145bb5cb2: mov	rcx, rdi
145bb5cb5: call	qword ptr [rip + 0x1dec05]
145bb5cbb: mov	rax, rsi
145bb5cbe: add	rsp, 0xc8
145bb5cc5: pop	rbx
145bb5cc6: pop	rdi
145bb5cc7: pop	rsi
145bb5cc8: pop	rbp
145bb5cc9: ret
