14585c840:     	push	rsi
14585c841:     	push	rdi
14585c842:     	sub	rsp, 0x28
14585c846:     	movzx	eax, cl
14585c849:     	dec	eax
14585c84b:     	cmp	eax, 0x5
14585c84e:     	ja	0x14585c8b4 <.text+0x585b8b4>
14585c850:     	lea	rcx, [rip + 0x17cfb2d]  # 0x14702c384
14585c857:     	movsxd	rax, dword ptr [rcx + 4*rax]
14585c85b:     	add	rax, rcx
14585c85e:     	jmp	rax
14585c860:     	lea	rsi, [rip + 0x17b45a9]  # 0x147010e10
14585c867:     	jmp	0x14585c895 <.text+0x585b895>
14585c869:     	lea	rsi, [rip + 0x17bf7e8]  # 0x14701c058
14585c870:     	jmp	0x14585c8a8 <.text+0x585b8a8>
14585c872:     	lea	rsi, [rip + 0x17ce31c]  # 0x14702ab95
14585c879:     	jmp	0x14585c8a8 <.text+0x585b8a8>
14585c87b:     	lea	rsi, [rip + 0x17c58fe]  # 0x147022180
14585c882:     	mov	edi, 0x5
14585c887:     	mov	edx, 0x5
14585c88c:     	jmp	0x14585c8c5 <.text+0x585b8c5>
14585c88e:     	lea	rsi, [rip + 0x17c48fb]  # 0x147021190
14585c895:     	mov	edi, 0x4
14585c89a:     	mov	edx, 0x4
14585c89f:     	jmp	0x14585c8c5 <.text+0x585b8c5>
14585c8a1:     	lea	rsi, [rip + 0x17c3898]  # 0x147020140
14585c8a8:     	mov	edi, 0x6
14585c8ad:     	mov	edx, 0x6
14585c8b2:     	jmp	0x14585c8c5 <.text+0x585b8c5>
14585c8b4:     	lea	rsi, [rip + 0x17ce2e0]  # 0x14702ab9b
14585c8bb:     	mov	edi, 0x8
14585c8c0:     	mov	edx, 0x8
14585c8c5:     	mov	rcx, rsi
14585c8c8:     	call	0x1458dff90 <.text+0x58def90>
14585c8cd:     	test	rax, rax
14585c8d0:     	cmove	rdx, rdi
14585c8d4:     	cmove	rax, rsi
14585c8d8:     	add	rsp, 0x28
14585c8dc:     	pop	rdi
14585c8dd:     	pop	rsi
14585c8de:     	ret
