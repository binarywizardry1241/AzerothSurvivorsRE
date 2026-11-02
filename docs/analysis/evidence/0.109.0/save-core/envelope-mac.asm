1458f6280	push	r15
1458f6282	push	r14
1458f6284	push	r13
1458f6286	push	r12
1458f6288	push	rsi
1458f6289	push	rdi
1458f628a	push	rbp
1458f628b	push	rbx
1458f628c	sub	rsp, 0x1e8
1458f6293	movaps	xmmword ptr [rsp + 0x1d0], xmm7
1458f629b	movaps	xmmword ptr [rsp + 0x1c0], xmm6
1458f62a3	mov	r15, rdx
1458f62a6	mov	rsi, rcx
1458f62a9	lea	rbx, [rsp + 0xd0]
1458f62b1	xorps	xmm0, xmm0
1458f62b4	movups	xmmword ptr [rsp + 0x100], xmm0
1458f62bc	movups	xmmword ptr [rsp + 0xf0], xmm0
1458f62c4	movups	xmmword ptr [rsp + 0xe0], xmm0
1458f62cc	movups	xmmword ptr [rsp + 0xd0], xmm0
1458f62d4	mov	byte ptr [rsp + 0x110], 0
1458f62dc	lea	r14, [rsp + 0xb8]
1458f62e4	movaps	xmm6, xmmword ptr [rip + 0xf8e585]
1458f62eb	movups	xmmword ptr [rsp + 0xb8], xmm6
1458f62f3	mov	dword ptr [rsp + 0xc8], 0xc3d2e1f0
1458f62fe	movaps	xmm0, xmmword ptr [rip + 0x15dcb3b]
1458f6305	movaps	xmmword ptr [rsp + 0x40], xmm0
1458f630a	movaps	xmm0, xmmword ptr [rip + 0x15dcb3f]
1458f6311	movaps	xmmword ptr [rsp + 0x50], xmm0
1458f6316	movaps	xmm0, xmmword ptr [rip + 0x15dcb43]
1458f631d	movaps	xmmword ptr [rsp + 0x60], xmm0
1458f6322	movaps	xmm0, xmmword ptr [rip + 0x4f16b7]
1458f6329	movaps	xmmword ptr [rsp + 0x70], xmm0
1458f632e	mov	qword ptr [rsp + 0xb0], 1
1458f633a	lea	rdx, [rsp + 0x40]
1458f633f	mov	r8d, 1
1458f6345	mov	rcx, r14
1458f6348	call	0x145a5dfc0
1458f634d	mov	byte ptr [rsp + 0x110], 0
1458f6355	mov	rdx, qword ptr [r15]
1458f6358	mov	r13, qword ptr [r15 + 8]
1458f635c	movabs	rdi, 0x7fffffffffffffc0
1458f6366	cmp	r13, 0x40
1458f636a	jae	0x1458f6379
1458f636c	mov	rcx, rbx
1458f636f	mov	r8, r13
1458f6372	call	0x145bfa0e7
1458f6377	jmp	0x1458f63b0
1458f6379	mov	r12, r13
1458f637c	and	r12, rdi
1458f637f	mov	ebp, r13d
1458f6382	and	ebp, 0x3f
1458f6385	add	r12, rdx
1458f6388	shr	r13, 6
1458f638c	add	qword ptr [rsp + 0xb0], r13
1458f6394	mov	rcx, r14
1458f6397	mov	r8, r13
1458f639a	call	0x145a5dfc0
1458f639f	mov	rcx, rbx
1458f63a2	mov	rdx, r12
1458f63a5	mov	r8, rbp
1458f63a8	call	0x145bfa0e7
1458f63ad	mov	r13, rbp
1458f63b0	mov	byte ptr [rsp + 0x110], r13b
1458f63b8	mov	rdx, qword ptr [r15 + 0x10]
1458f63bc	mov	rbp, qword ptr [r15 + 0x18]
1458f63c0	mov	r8d, 0x40
1458f63c6	sub	r8, r13
1458f63c9	mov	r12, rbp
1458f63cc	sub	r12, r8
1458f63cf	jae	0x1458f63e5
1458f63d1	lea	rcx, [rbx + r13]
1458f63d5	mov	r8, rbp
1458f63d8	call	0x145bfa0e7
1458f63dd	add	rbp, r13
1458f63e0	mov	r12, rbp
1458f63e3	jmp	0x1458f6451
1458f63e5	test	r13, r13
1458f63e8	je	0x1458f6417
1458f63ea	lea	rbp, [rdx + r8]
1458f63ee	add	r13, rbx
1458f63f1	mov	rcx, r13
1458f63f4	call	0x145bfa0e7
1458f63f9	inc	qword ptr [rsp + 0xb0]
1458f6401	mov	r8d, 1
1458f6407	mov	rcx, r14
1458f640a	mov	rdx, rbx
1458f640d	call	0x145a5dfc0
1458f6412	mov	rdx, rbp
1458f6415	jmp	0x1458f641a
1458f6417	mov	r12, rbp
1458f641a	mov	r8, r12
1458f641d	shr	r8, 6
1458f6421	mov	r13, r12
1458f6424	and	r13, rdi
1458f6427	and	r12d, 0x3f
1458f642b	add	r13, rdx
1458f642e	test	r8, r8
1458f6431	je	0x1458f6443
1458f6433	add	qword ptr [rsp + 0xb0], r8
1458f643b	mov	rcx, r14
1458f643e	call	0x145a5dfc0
1458f6443	mov	rcx, rbx
1458f6446	mov	rdx, r13
1458f6449	mov	r8, r12
1458f644c	call	0x145bfa0e7
1458f6451	mov	byte ptr [rsp + 0x110], r12b
1458f6459	mov	rdx, qword ptr [r15 + 0x20]
1458f645d	mov	r13, qword ptr [r15 + 0x28]
1458f6461	mov	r8d, 0x40
1458f6467	sub	r8, r12
1458f646a	mov	r15, r13
1458f646d	sub	r15, r8
1458f6470	jae	0x1458f6488
1458f6472	add	rbx, r12
1458f6475	mov	rcx, rbx
1458f6478	mov	r8, r13
1458f647b	call	0x145bfa0e7
1458f6480	add	r13, r12
1458f6483	mov	r15, r13
1458f6486	jmp	0x1458f64f4
1458f6488	test	r12, r12
1458f648b	je	0x1458f64ba
1458f648d	lea	r13, [rdx + r8]
1458f6491	add	r12, rbx
1458f6494	mov	rcx, r12
1458f6497	call	0x145bfa0e7
1458f649c	inc	qword ptr [rsp + 0xb0]
1458f64a4	mov	r8d, 1
1458f64aa	mov	rcx, r14
1458f64ad	mov	rdx, rbx
1458f64b0	call	0x145a5dfc0
1458f64b5	mov	rdx, r13
1458f64b8	jmp	0x1458f64bd
1458f64ba	mov	r15, r13
1458f64bd	mov	r8, r15
1458f64c0	shr	r8, 6
1458f64c4	mov	r12, r15
1458f64c7	and	r12, rdi
1458f64ca	and	r15d, 0x3f
1458f64ce	add	r12, rdx
1458f64d1	test	r8, r8
1458f64d4	je	0x1458f64e6
1458f64d6	add	qword ptr [rsp + 0xb0], r8
1458f64de	mov	rcx, r14
1458f64e1	call	0x145a5dfc0
1458f64e6	mov	rcx, rbx
1458f64e9	mov	rdx, r12
1458f64ec	mov	r8, r15
1458f64ef	call	0x145bfa0e7
1458f64f4	mov	byte ptr [rsp + 0x110], r15b
1458f64fc	xorps	xmm7, xmm7
1458f64ff	movups	xmmword ptr [rsp + 0x168], xmm7
1458f6507	movups	xmmword ptr [rsp + 0x158], xmm7
1458f650f	movups	xmmword ptr [rsp + 0x148], xmm7
1458f6517	movups	xmmword ptr [rsp + 0x138], xmm7
1458f651f	mov	byte ptr [rsp + 0x178], 0
1458f6527	lea	rbx, [rsp + 0x120]
1458f652f	movups	xmmword ptr [rsp + 0x120], xmm6
1458f6537	mov	dword ptr [rsp + 0x130], 0xc3d2e1f0
1458f6542	movaps	xmm0, xmmword ptr [rip + 0x15dc927]
1458f6549	movaps	xmmword ptr [rsp + 0x40], xmm0
1458f654e	movaps	xmm0, xmmword ptr [rip + 0x15dc92b]
1458f6555	movaps	xmmword ptr [rsp + 0x50], xmm0
1458f655a	movaps	xmm0, xmmword ptr [rip + 0x15dc92f]
1458f6561	movaps	xmmword ptr [rsp + 0x60], xmm0
1458f6566	movaps	xmm0, xmmword ptr [rip + 0x4ec0e3]
1458f656d	movaps	xmmword ptr [rsp + 0x70], xmm0
1458f6572	mov	qword ptr [rsp + 0x118], 1
1458f657e	lea	rdx, [rsp + 0x40]
1458f6583	mov	r8d, 1
1458f6589	mov	rcx, rbx
1458f658c	call	0x145a5dfc0
1458f6591	mov	byte ptr [rsp + 0x178], 0
1458f6599	movups	xmm0, xmmword ptr [rsp + 0xb0]
1458f65a1	movups	xmm1, xmmword ptr [rsp + 0xc0]
1458f65a9	movups	xmm2, xmmword ptr [rsp + 0xd0]
1458f65b1	movups	xmm3, xmmword ptr [rsp + 0xe0]
1458f65b9	movaps	xmmword ptr [rsp + 0x40], xmm0
1458f65be	mov	rax, qword ptr [rsp + 0x110]
1458f65c6	mov	qword ptr [rsp + 0xa0], rax
1458f65ce	movups	xmm0, xmmword ptr [rsp + 0x100]
1458f65d6	movaps	xmmword ptr [rsp + 0x90], xmm0
1458f65de	movups	xmm0, xmmword ptr [rsp + 0xf0]
1458f65e6	movaps	xmmword ptr [rsp + 0x80], xmm0
1458f65ee	movaps	xmmword ptr [rsp + 0x70], xmm3
1458f65f3	movaps	xmmword ptr [rsp + 0x60], xmm2
1458f65f8	movaps	xmmword ptr [rsp + 0x50], xmm1
1458f65fd	lea	r14, [rsp + 0x60]
1458f6602	movzx	ecx, al
1458f6605	mov	rdx, qword ptr [rsp + 0x40]
1458f660a	shl	rdx, 9
1458f660e	lea	r12d, [rcx*8]
1458f6616	or	r12, rdx
1458f6619	movzx	r15d, al
1458f661d	mov	eax, dword ptr [rsp + 0xc8]
1458f6624	mov	dword ptr [rsp + 0x30], eax
1458f6628	movdqu	xmm0, xmmword ptr [rsp + 0xb8]
1458f6631	movdqa	xmmword ptr [rsp + 0x20], xmm0
1458f6637	bswap	r12
1458f663a	mov	byte ptr [rsp + r15 + 0x60], 0x80
1458f6640	cmp	ecx, 0x3f
1458f6643	je	0x1458f6668
1458f6645	lea	rcx, [rsp + r15]
1458f6649	add	rcx, 0x60
1458f664d	inc	rcx
1458f6650	mov	r8, r15
1458f6653	xor	r8, 0x3f
1458f6657	xor	edx, edx
1458f6659	call	0x145bfa0db
1458f665e	xor	r15d, 0x38
1458f6662	cmp	r15d, 7
1458f6666	ja	0x1458f66bd
1458f6668	lea	r15, [rsp + 0x20]
1458f666d	mov	r8d, 1
1458f6673	mov	rcx, r15
1458f6676	mov	rdx, r14
1458f6679	call	0x145a5dfc0
1458f667e	movaps	xmmword ptr [rsp + 0x1a0], xmm7
1458f6686	movaps	xmmword ptr [rsp + 0x190], xmm7
1458f668e	movaps	xmmword ptr [rsp + 0x180], xmm7
1458f6696	mov	qword ptr [rsp + 0x1b0], 0
1458f66a2	mov	qword ptr [rsp + 0x1b8], r12
1458f66aa	lea	rdx, [rsp + 0x180]
1458f66b2	mov	r8d, 1
1458f66b8	mov	rcx, r15
1458f66bb	jmp	0x1458f66d3
1458f66bd	mov	qword ptr [rsp + 0x98], r12
1458f66c5	lea	rcx, [rsp + 0x20]
1458f66ca	mov	r8d, 1
1458f66d0	mov	rdx, r14
1458f66d3	call	0x145a5dfc0
1458f66d8	lea	r14, [rsp + 0x138]
1458f66e0	mov	eax, dword ptr [rsp + 0x30]
1458f66e4	bswap	eax
1458f66e6	pxor	xmm0, xmm0
1458f66ea	movdqa	xmm1, xmmword ptr [rsp + 0x20]
1458f66f0	movdqa	xmm2, xmm1
1458f66f4	punpckhbw	xmm2, xmm0
1458f66f8	pshuflw	xmm2, xmm2, 0x1b
1458f66fd	pshufhw	xmm2, xmm2, 0x1b
1458f6702	punpcklbw	xmm1, xmm0
1458f6706	pshuflw	xmm0, xmm1, 0x1b
1458f670b	pshufhw	xmm0, xmm0, 0x1b
1458f6710	packuswb	xmm0, xmm2
1458f6714	movdqa	xmmword ptr [rsp + 0x40], xmm0
1458f671a	mov	dword ptr [rsp + 0x50], eax
1458f671e	movzx	r15d, byte ptr [rsp + 0x178]
1458f6727	cmp	r15, 0x2c
1458f672b	jae	0x1458f6748
1458f672d	mov	eax, dword ptr [rsp + 0x50]
1458f6731	mov	dword ptr [r14 + r15 + 0x10], eax
1458f6736	movdqa	xmm0, xmmword ptr [rsp + 0x40]
1458f673c	movdqu	xmmword ptr [r14 + r15], xmm0
1458f6742	add	r15, 0x14
1458f6746	jmp	0x1458f6798
1458f6748	mov	r8d, 0x40
1458f674e	sub	r8, r15
1458f6751	lea	r12, [rsp + r8]
1458f6755	add	r12, 0x40
1458f6759	lea	rcx, [r14 + r15]
1458f675d	add	r15, -0x2c
1458f6761	lea	rdx, [rsp + 0x40]
1458f6766	call	0x145bfa0e7
1458f676b	inc	qword ptr [rsp + 0x118]
1458f6773	mov	r8d, 1
1458f6779	mov	rcx, rbx
1458f677c	mov	rdx, r14
1458f677f	call	0x145a5dfc0
1458f6784	and	rdi, r15
1458f6787	add	rdi, r12
1458f678a	mov	rcx, r14
1458f678d	mov	rdx, rdi
1458f6790	mov	r8, r15
1458f6793	call	0x145bfa0e7
1458f6798	mov	byte ptr [rsp + 0x178], r15b
1458f67a0	movups	xmm0, xmmword ptr [rsp + 0x118]
1458f67a8	movups	xmm1, xmmword ptr [rsp + 0x128]
1458f67b0	movups	xmm2, xmmword ptr [rsp + 0x138]
1458f67b8	movups	xmm3, xmmword ptr [rsp + 0x148]
1458f67c0	movaps	xmmword ptr [rsp + 0x40], xmm0
1458f67c5	mov	rax, qword ptr [rsp + 0x178]
1458f67cd	mov	qword ptr [rsp + 0xa0], rax
1458f67d5	movups	xmm0, xmmword ptr [rsp + 0x168]
1458f67dd	movaps	xmmword ptr [rsp + 0x90], xmm0
1458f67e5	movups	xmm0, xmmword ptr [rsp + 0x158]
1458f67ed	movaps	xmmword ptr [rsp + 0x80], xmm0
1458f67f5	movaps	xmmword ptr [rsp + 0x70], xmm3
1458f67fa	movaps	xmmword ptr [rsp + 0x60], xmm2
1458f67ff	movaps	xmmword ptr [rsp + 0x50], xmm1
1458f6804	lea	rdi, [rsp + 0x60]
1458f6809	movzx	ecx, al
1458f680c	mov	rdx, qword ptr [rsp + 0x40]
1458f6811	shl	rdx, 9
1458f6815	lea	r14d, [rcx*8]
1458f681d	or	r14, rdx
1458f6820	movzx	ebx, al
1458f6823	mov	eax, dword ptr [rsp + 0x130]
1458f682a	mov	dword ptr [rsp + 0x30], eax
1458f682e	movdqu	xmm0, xmmword ptr [rsp + 0x120]
1458f6837	movdqa	xmmword ptr [rsp + 0x20], xmm0
1458f683d	bswap	r14
1458f6840	mov	byte ptr [rsp + rbx + 0x60], 0x80
1458f6845	cmp	ecx, 0x3f
1458f6848	je	0x1458f686b
1458f684a	lea	rcx, [rsp + rbx]
1458f684e	add	rcx, 0x60
1458f6852	inc	rcx
1458f6855	mov	r8, rbx
1458f6858	xor	r8, 0x3f
1458f685c	xor	edx, edx
1458f685e	call	0x145bfa0db
1458f6863	xor	ebx, 0x38
1458f6866	cmp	ebx, 7
1458f6869	ja	0x1458f68c7
1458f686b	lea	rbx, [rsp + 0x20]
1458f6870	mov	r8d, 1
1458f6876	mov	rcx, rbx
1458f6879	mov	rdx, rdi
1458f687c	call	0x145a5dfc0
1458f6881	pxor	xmm0, xmm0
1458f6885	movdqa	xmmword ptr [rsp + 0x1a0], xmm0
1458f688e	movdqa	xmmword ptr [rsp + 0x190], xmm0
1458f6897	movdqa	xmmword ptr [rsp + 0x180], xmm0
1458f68a0	mov	qword ptr [rsp + 0x1b0], 0
1458f68ac	mov	qword ptr [rsp + 0x1b8], r14
1458f68b4	lea	rdx, [rsp + 0x180]
1458f68bc	mov	r8d, 1
1458f68c2	mov	rcx, rbx
1458f68c5	jmp	0x1458f68dd
1458f68c7	mov	qword ptr [rsp + 0x98], r14
1458f68cf	lea	rcx, [rsp + 0x20]
1458f68d4	mov	r8d, 1
1458f68da	mov	rdx, rdi
1458f68dd	call	0x145a5dfc0
1458f68e2	mov	eax, dword ptr [rsp + 0x30]
1458f68e6	bswap	eax
1458f68e8	pxor	xmm0, xmm0
1458f68ec	movdqa	xmm1, xmmword ptr [rsp + 0x20]
1458f68f2	movdqa	xmm2, xmm1
1458f68f6	punpckhbw	xmm2, xmm0
1458f68fa	pshuflw	xmm2, xmm2, 0x1b
1458f68ff	pshufhw	xmm2, xmm2, 0x1b
1458f6904	punpcklbw	xmm1, xmm0
1458f6908	pshuflw	xmm0, xmm1, 0x1b
1458f690d	pshufhw	xmm0, xmm0, 0x1b
1458f6912	packuswb	xmm0, xmm2
1458f6916	movdqu	xmmword ptr [rsi], xmm0
1458f691a	mov	dword ptr [rsi + 0x10], eax
1458f691d	movaps	xmm6, xmmword ptr [rsp + 0x1c0]
1458f6925	movaps	xmm7, xmmword ptr [rsp + 0x1d0]
1458f692d	add	rsp, 0x1e8
1458f6934	pop	rbx
1458f6935	pop	rbp
1458f6936	pop	rdi
1458f6937	pop	rsi
1458f6938	pop	r12
1458f693a	pop	r13
1458f693c	pop	r14
1458f693e	pop	r15
1458f6940	ret
