1458a83b0	push	rbp
1458a83b1	push	rsi
1458a83b2	push	rdi
1458a83b3	sub	rsp, 0x220
1458a83ba	lea	rbp, [rsp + 0x80]
1458a83c2	mov	qword ptr [rbp + 0x198], 0xfffffffffffffffe
1458a83cd	mov	rsi, rcx
1458a83d0	lea	rdi, [rbp - 0x58]
1458a83d4	mov	rcx, rdi
1458a83d7	call	0x14589d550
1458a83dc	nop
1458a83dd	lea	rcx, [rbp + 0x178]
1458a83e4	mov	rdx, rdi
1458a83e7	call	0x1458a4340
1458a83ec	nop
1458a83ed	mov	rdx, qword ptr [rbp + 0x180]
1458a83f4	mov	r8, qword ptr [rbp + 0x188]
1458a83fb	mov	rcx, rsi
1458a83fe	mov	qword ptr [rbp + 0x190], rdx
1458a8405	call	0x1458f6c40
1458a840a	nop
1458a840b	mov	rdx, qword ptr [rbp + 0x178]
1458a8412	test	rdx, rdx
1458a8415	je	0x1458a8429
1458a8417	mov	r8d, 1
1458a841d	mov	rcx, qword ptr [rbp + 0x190]
1458a8424	call	0x1400021d0
1458a8429	lea	rcx, [rbp - 0x58]
1458a842d	call	0x140009eb0
1458a8432	mov	rax, rsi
1458a8435	add	rsp, 0x220
1458a843c	pop	rdi
1458a843d	pop	rsi
1458a843e	pop	rbp
1458a843f	ret
