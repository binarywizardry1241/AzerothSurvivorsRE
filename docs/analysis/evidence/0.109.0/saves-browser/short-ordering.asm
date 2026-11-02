1400f13b0	push	r15
1400f13b2	push	r14
1400f13b4	push	r13
1400f13b6	push	r12
1400f13b8	push	rsi
1400f13b9	push	rdi
1400f13ba	push	rbp
1400f13bb	push	rbx
1400f13bc	sub	rsp, 0x58
1400f13c0	mov	rsi, rcx
1400f13c3	mov	ebx, dword ptr [rdx + 0x18]
1400f13c6	cmp	dword ptr [rdx - 0x30], 1
1400f13ca	jne	0x1400f13e5
1400f13cc	test	bl, bl
1400f13ce	je	0x1400f1548
1400f13d4	mov	rax, qword ptr [rdx + 0x1c]
1400f13d8	cmp	qword ptr [rdx - 0x2c], rax
1400f13dc	je	0x1400f13e9
1400f13de	jl	0x1400f1422
1400f13e0	jmp	0x1400f1548
1400f13e5	test	bl, bl
1400f13e7	jne	0x1400f1422
1400f13e9	mov	rcx, qword ptr [rdx + 8]
1400f13ed	mov	r9, qword ptr [rdx + 0x10]
1400f13f1	mov	rax, qword ptr [rdx - 0x40]
1400f13f5	mov	r8, qword ptr [rdx - 0x38]
1400f13f9	mov	r14, r9
1400f13fc	sub	r14, r8
1400f13ff	cmovb	r8, r9
1400f1403	mov	rdi, rdx
1400f1406	mov	rdx, rax
1400f1409	call	0x145bfa0e1
1400f140e	mov	rdx, rdi
1400f1411	cdqe
1400f1413	test	eax, eax
1400f1415	cmovne	r14, rax
1400f1419	test	r14, r14
1400f141c	jns	0x1400f1548
1400f1422	lea	rbp, [rdx - 0x48]
1400f1426	mov	r8, qword ptr [rdx]
1400f1429	mov	rdi, qword ptr [rdx + 8]
1400f142d	mov	r14, qword ptr [rdx + 0x10]
1400f1431	mov	ecx, dword ptr [rdx + 0x1c]
1400f1434	mov	r15d, dword ptr [rdx + 0x20]
1400f1438	mov	eax, dword ptr [rdx + 0x44]
1400f143b	mov	dword ptr [rsp + 0x50], eax
1400f143f	movups	xmm0, xmmword ptr [rdx + 0x34]
1400f1443	movaps	xmmword ptr [rsp + 0x40], xmm0
1400f1448	movups	xmm0, xmmword ptr [rdx + 0x24]
1400f144c	movaps	xmmword ptr [rsp + 0x30], xmm0
1400f1451	movups	xmm0, xmmword ptr [rbp]
1400f1455	movups	xmm1, xmmword ptr [rbp + 0x10]
1400f1459	movups	xmm2, xmmword ptr [rbp + 0x20]
1400f145d	movups	xmm3, xmmword ptr [rbp + 0x30]
1400f1461	movups	xmmword ptr [rdx + 0x30], xmm3
1400f1465	movups	xmmword ptr [rdx + 0x20], xmm2
1400f1469	movups	xmmword ptr [rdx], xmm0
1400f146c	movups	xmmword ptr [rdx + 0x10], xmm1
1400f1470	mov	rax, qword ptr [rbp + 0x40]
1400f1474	mov	qword ptr [rdx + 0x40], rax
1400f1478	cmp	rbp, rsi
1400f147b	mov	qword ptr [rsp + 0x28], r15
1400f1480	mov	qword ptr [rsp + 0x20], r8
1400f1485	je	0x1400f150a
1400f148b	test	bl, bl
1400f148d	je	0x1400f1559
1400f1493	shl	r15, 0x20
1400f1497	mov	r12, rcx
1400f149a	or	r15, rcx
1400f149d	jmp	0x1400f14d5
1400f149f	nop
1400f14a0	jge	0x1400f150d
1400f14a2	lea	rax, [rbp - 0x48]
1400f14a6	mov	rcx, qword ptr [rax + 0x40]
1400f14aa	mov	qword ptr [rbp + 0x40], rcx
1400f14ae	movups	xmm0, xmmword ptr [rax]
1400f14b1	movups	xmm1, xmmword ptr [rax + 0x10]
1400f14b5	movups	xmm2, xmmword ptr [rax + 0x20]
1400f14b9	movups	xmm3, xmmword ptr [rax + 0x30]
1400f14bd	movups	xmmword ptr [rbp + 0x30], xmm3
1400f14c1	movups	xmmword ptr [rbp + 0x20], xmm2
1400f14c5	movups	xmmword ptr [rbp + 0x10], xmm1
1400f14c9	movups	xmmword ptr [rbp], xmm0
1400f14cd	mov	rbp, rax
1400f14d0	cmp	rax, rsi
1400f14d3	je	0x1400f1510
1400f14d5	cmp	dword ptr [rbp - 0x30], 1
1400f14d9	jne	0x1400f14a2
1400f14db	cmp	qword ptr [rbp - 0x2c], r15
1400f14df	jne	0x1400f14a0
1400f14e1	mov	rdx, qword ptr [rbp - 0x40]
1400f14e5	mov	r8, qword ptr [rbp - 0x38]
1400f14e9	mov	r13, r14
1400f14ec	sub	r13, r8
1400f14ef	cmovb	r8, r14
1400f14f3	mov	rcx, rdi
1400f14f6	call	0x145bfa0e1
1400f14fb	cdqe
1400f14fd	test	eax, eax
1400f14ff	cmovne	r13, rax
1400f1503	test	r13, r13
1400f1506	js	0x1400f14a2
1400f1508	jmp	0x1400f150d
1400f150a	mov	r12, rcx
1400f150d	mov	rax, rbp
1400f1510	mov	rcx, qword ptr [rsp + 0x20]
1400f1515	mov	qword ptr [rax], rcx
1400f1518	mov	qword ptr [rax + 8], rdi
1400f151c	mov	qword ptr [rax + 0x10], r14
1400f1520	mov	dword ptr [rax + 0x18], ebx
1400f1523	mov	dword ptr [rax + 0x1c], r12d
1400f1527	mov	rcx, qword ptr [rsp + 0x28]
1400f152c	mov	dword ptr [rax + 0x20], ecx
1400f152f	movaps	xmm0, xmmword ptr [rsp + 0x30]
1400f1534	movaps	xmm1, xmmword ptr [rsp + 0x40]
1400f1539	movups	xmmword ptr [rax + 0x24], xmm0
1400f153d	movups	xmmword ptr [rax + 0x34], xmm1
1400f1541	mov	ecx, dword ptr [rsp + 0x50]
1400f1545	mov	dword ptr [rax + 0x44], ecx
1400f1548	add	rsp, 0x58
1400f154c	pop	rbx
1400f154d	pop	rbp
1400f154e	pop	rdi
1400f154f	pop	rsi
1400f1550	pop	r12
1400f1552	pop	r13
1400f1554	pop	r14
1400f1556	pop	r15
1400f1558	ret
1400f1559	mov	r12, rcx
1400f155c	nop	dword ptr [rax]
1400f1560	cmp	byte ptr [rbp - 0x30], 0
1400f1564	jne	0x1400f150d
1400f1566	mov	rdx, qword ptr [rbp - 0x40]
1400f156a	mov	r8, qword ptr [rbp - 0x38]
1400f156e	mov	r15, r14
1400f1571	sub	r15, r8
1400f1574	cmovb	r8, r14
1400f1578	mov	rcx, rdi
1400f157b	call	0x145bfa0e1
1400f1580	cdqe
1400f1582	test	eax, eax
1400f1584	cmovne	r15, rax
1400f1588	test	r15, r15
1400f158b	jns	0x1400f150d
1400f158d	lea	rax, [rbp - 0x48]
1400f1591	mov	rcx, qword ptr [rax + 0x40]
1400f1595	mov	qword ptr [rbp + 0x40], rcx
1400f1599	movups	xmm0, xmmword ptr [rax]
1400f159c	movups	xmm1, xmmword ptr [rax + 0x10]
1400f15a0	movups	xmm2, xmmword ptr [rax + 0x20]
1400f15a4	movups	xmm3, xmmword ptr [rax + 0x30]
1400f15a8	movups	xmmword ptr [rbp + 0x30], xmm3
1400f15ac	movups	xmmword ptr [rbp + 0x20], xmm2
1400f15b0	movups	xmmword ptr [rbp + 0x10], xmm1
1400f15b4	movups	xmmword ptr [rbp], xmm0
1400f15b8	mov	rbp, rax
1400f15bb	cmp	rax, rsi
1400f15be	jne	0x1400f1560
1400f15c0	jmp	0x1400f1510
