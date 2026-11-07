1459a2790	push	r15
1459a2792	push	r14
1459a2794	push	rsi
1459a2795	push	rdi
1459a2796	push	rbx
1459a2797	sub	rsp, 0x20
1459a279b	mov	rsi, r8
1459a279e	mov	ebx, edx
1459a27a0	mov	edi, ecx
1459a27a2	call	0x1459a29c0
1459a27a7	mov	r14d, 1
1459a27ad	test	rax, rax
1459a27b0	je	0x1459a2830
1459a27b2	mov	rcx, rax
1459a27b5	mov	edx, edi
1459a27b7	mov	r8d, ebx
1459a27ba	call	0x145a7d6b0
1459a27bf	mov	edi, 1
1459a27c4	mov	ebx, 1
1459a27c9	mov	r15d, 1
1459a27cf	mov	r11d, 1
1459a27d5	test	al, 1
1459a27d7	je	0x1459a2846
1459a27d9	mov	ecx, eax
1459a27db	shr	ecx, 8
1459a27de	mov	edx, eax
1459a27e0	shr	edx, 0x10
1459a27e3	mov	r8d, eax
1459a27e6	shr	r8d, 0x18
1459a27ea	mov	r9, rax
1459a27ed	shr	r9, 0x20
1459a27f1	shr	rax, 0x28
1459a27f5	cmp	cl, 1
1459a27f8	adc	ecx, 0
1459a27fb	movzx	r14d, cl
1459a27ff	cmp	dl, 1
1459a2802	adc	edx, 0
1459a2805	movzx	edi, dl
1459a2808	cmp	r8b, 1
1459a280c	adc	r8d, 0
1459a2810	movzx	ebx, r8b
1459a2814	cmp	r9b, 2
1459a2818	mov	ecx, 1
1459a281d	cmovb	r9d, ecx
1459a2821	movzx	r15d, r9b
1459a2825	cmp	al, 2
1459a2827	cmovb	eax, ecx
1459a282a	movzx	r11d, al
1459a282e	jmp	0x1459a2846
1459a2830	mov	edi, 1
1459a2835	mov	ebx, 1
1459a283a	mov	r15d, 1
1459a2840	mov	r11d, 1
1459a2846	movabs	rax, 0x9e3779b97f4a7c15
1459a2850	xor	rsi, rax
1459a2853	mov	rax, rsi
1459a2856	shl	rax, 0xd
1459a285a	xor	rax, rsi
1459a285d	mov	rdx, rax
1459a2860	shr	rdx, 7
1459a2864	xor	rdx, rax
1459a2867	mov	rcx, rdx
1459a286a	shl	rcx, 0x11
1459a286e	xor	rcx, rdx
1459a2871	mov	rax, rcx
1459a2874	shl	rax, 0xd
1459a2878	xor	rax, rcx
1459a287b	mov	rdx, rax
1459a287e	shr	rdx, 7
1459a2882	xor	rdx, rax
1459a2885	mov	r8, rdx
1459a2888	shl	r8, 0x11
1459a288c	xor	r8, rdx
1459a288f	mov	rax, r8
1459a2892	shl	rax, 0xd
1459a2896	xor	rax, r8
1459a2899	mov	rdx, rax
1459a289c	shr	rdx, 7
1459a28a0	xor	rdx, rax
1459a28a3	mov	r9, rdx
1459a28a6	shl	r9, 0x11
1459a28aa	xor	r9, rdx
1459a28ad	mov	rax, r9
1459a28b0	shl	rax, 0xd
1459a28b4	xor	rax, r9
1459a28b7	mov	rdx, rax
1459a28ba	shr	rdx, 7
1459a28be	xor	rdx, rax
1459a28c1	mov	r10, rdx
1459a28c4	shl	r10, 0x11
1459a28c8	xor	r10, rdx
1459a28cb	mov	rax, r10
1459a28ce	shl	rax, 0xd
1459a28d2	xor	rax, r10
1459a28d5	mov	rdx, rax
1459a28d8	shr	rdx, 7
1459a28dc	xor	rdx, rax
1459a28df	mov	rax, rdx
1459a28e2	shl	rax, 0x11
1459a28e6	xor	rax, rdx
1459a28e9	xor	edx, edx
1459a28eb	div	r11
1459a28ee	mov	r11, rdx
1459a28f1	mov	rax, r10
1459a28f4	xor	edx, edx
1459a28f6	div	r15
1459a28f9	mov	r10, rdx
1459a28fc	mov	rax, r9
1459a28ff	xor	edx, edx
1459a2901	div	rbx
1459a2904	mov	r9, rdx
1459a2907	mov	rax, r8
1459a290a	xor	edx, edx
1459a290c	div	rdi
1459a290f	mov	r8, rdx
1459a2912	mov	rax, rcx
1459a2915	xor	edx, edx
1459a2917	div	r14
1459a291a	shl	r11, 0x20
1459a291e	shl	r10d, 0x18
1459a2922	or	r10, r11
1459a2925	shl	r9d, 0x10
1459a2929	shl	r8d, 8
1459a292d	or	r8, r9
1459a2930	or	r8, rdx
1459a2933	or	r8, r10
1459a2936	mov	rax, r8
1459a2939	add	rsp, 0x20
1459a293d	pop	rbx
1459a293e	pop	rdi
1459a293f	pop	rsi
1459a2940	pop	r14
1459a2942	pop	r15
1459a2944	ret
