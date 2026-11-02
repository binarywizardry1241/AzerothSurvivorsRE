145b9f5a0: push	rbp
145b9f5a1: push	r14
145b9f5a3: push	rsi
145b9f5a4: push	rdi
145b9f5a5: push	rbx
145b9f5a6: sub	rsp, 0x50
145b9f5aa: lea	rbp, [rsp + 0x50]
145b9f5af: mov	qword ptr [rbp - 8], 0xfffffffffffffffe
145b9f5b7: mov	rdi, r9
145b9f5ba: mov	rsi, rcx
145b9f5bd: mov	rbx, qword ptr [rbp + 0x50]
145b9f5c1: lea	r14, [rbp - 0x28]
145b9f5c5: mov	rcx, r14
145b9f5c8: call	0x145bc4e10
145b9f5cd: nop
145b9f5ce: mov	rcx, r14
145b9f5d1: mov	rdx, rdi
145b9f5d4: mov	r8, rbx
145b9f5d7: call	0x145bab3e0
145b9f5dc: nop
145b9f5dd: movups	xmm0, xmmword ptr [rbp - 0x28]
145b9f5e1: movups	xmm1, xmmword ptr [rbp - 0x18]
145b9f5e5: movups	xmmword ptr [rsi + 0x10], xmm1
145b9f5e9: movups	xmmword ptr [rsi], xmm0
145b9f5ec: mov	rax, rsi
145b9f5ef: add	rsp, 0x50
145b9f5f3: pop	rbx
145b9f5f4: pop	rdi
145b9f5f5: pop	rsi
145b9f5f6: pop	r14
145b9f5f8: pop	rbp
145b9f5f9: ret
