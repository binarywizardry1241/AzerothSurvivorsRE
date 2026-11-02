1459a21a0	push	rsi
1459a21a1	push	rdi
1459a21a2	push	rbx
1459a21a3	sub	rsp, 0x30
1459a21a7	mov	rsi, r9
1459a21aa	mov	ebx, r8d
1459a21ad	mov	edi, edx
1459a21af	call	0x1459a2280
1459a21b4	mov	dword ptr [rsp + 0x20], eax
1459a21b8	shr	rax, 0x20
1459a21bc	mov	byte ptr [rsp + 0x24], al
1459a21c0	call	0x1459a29c0
1459a21c5	test	rax, rax
1459a21c8	je	0x1459a220d
1459a21ca	mov	rcx, rax
1459a21cd	mov	edx, edi
1459a21cf	mov	r8d, ebx
1459a21d2	call	0x145a7d6b0
1459a21d7	test	al, 1
1459a21d9	je	0x1459a220d
1459a21db	movabs	rcx, 0xffffffff00
1459a21e5	and	rcx, rax
1459a21e8	shr	rcx, 8
1459a21ec	shr	rax, 0x28
1459a21f0	mov	byte ptr [rsp + 0x2c], al
1459a21f4	mov	dword ptr [rsp + 0x28], ecx
1459a21f8	cmp	rsi, 5
1459a21fc	jae	0x1459a225e
1459a21fe	movzx	eax, byte ptr [rsp + rsi + 0x28]
1459a2203	cmp	al, 1
1459a2205	adc	eax, 0
1459a2208	movzx	ecx, al
1459a220b	jmp	0x1459a2218
1459a220d	mov	ecx, 1
1459a2212	cmp	rsi, 4
1459a2216	ja	0x1459a2248
1459a2218	movzx	eax, byte ptr [rsp + rsi + 0x20]
1459a221d	add	eax, dword ptr [rsp + 0x70]
1459a2221	cdq
1459a2222	idiv	ecx
1459a2224	mov	eax, edx
1459a2226	sar	eax, 0x1f
1459a2229	and	eax, ecx
1459a222b	add	eax, edx
1459a222d	mov	byte ptr [rsp + rsi + 0x20], al
1459a2231	mov	ecx, dword ptr [rsp + 0x20]
1459a2235	mov	eax, dword ptr [rsp + 0x24]
1459a2239	shl	rax, 0x20
1459a223d	or	rax, rcx
1459a2240	add	rsp, 0x30
1459a2244	pop	rbx
1459a2245	pop	rdi
1459a2246	pop	rsi
1459a2247	ret
1459a2248	lea	r8, [rip + 0x188bed1]
1459a224f	mov	edx, 5
1459a2254	mov	rcx, rsi
1459a2257	call	0x145d99653
1459a225c	ud2
1459a225e	lea	r8, [rip + 0x188b3db]
1459a2265	mov	edx, 5
1459a226a	mov	rcx, rsi
1459a226d	call	0x145d99653
1459a2272	ud2
