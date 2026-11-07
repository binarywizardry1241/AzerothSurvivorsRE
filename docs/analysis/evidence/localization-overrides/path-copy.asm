145bc4e10: push	rbp
145bc4e11: push	r14
145bc4e13: push	rsi
145bc4e14: push	rdi
145bc4e15: push	rbx
145bc4e16: sub	rsp, 0x20
145bc4e1a: lea	rbp, [rsp + 0x20]
145bc4e1f: mov	rsi, r8
145bc4e22: mov	rdi, rcx
145bc4e25: test	r8, r8
145bc4e28: je	0x145bc4e57
145bc4e2a: mov	rbx, rdx
145bc4e2d: call	0x140002200
145bc4e32: mov	edx, 1
145bc4e37: mov	rcx, rsi
145bc4e3a: call	0x1400021c0
145bc4e3f: test	rax, rax
145bc4e42: je	0x145bc4e7a
145bc4e44: mov	r14, rax
145bc4e47: mov	rcx, rax
145bc4e4a: mov	rdx, rbx
145bc4e4d: mov	r8, rsi
145bc4e50: call	0x145bf293b
145bc4e55: jmp	0x145bc4e5d
145bc4e57: mov	r14d, 1
145bc4e5d: mov	qword ptr [rdi], rsi
145bc4e60: mov	qword ptr [rdi + 8], r14
145bc4e64: mov	qword ptr [rdi + 0x10], rsi
145bc4e68: mov	byte ptr [rdi + 0x18], 0
145bc4e6c: mov	rax, rdi
145bc4e6f: add	rsp, 0x20
145bc4e73: pop	rbx
145bc4e74: pop	rdi
145bc4e75: pop	rsi
145bc4e76: pop	r14
145bc4e78: pop	rbp
145bc4e79: ret
145bc4e7a: mov	ecx, 1
145bc4e7f: mov	rdx, rsi
145bc4e82: call	0x145d934fb
145bc4e87: ud2
