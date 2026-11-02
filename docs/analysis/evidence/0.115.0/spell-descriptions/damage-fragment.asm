14586a870:     	push	r15
14586a872:     	push	r14
14586a874:     	push	rsi
14586a875:     	push	rdi
14586a876:     	push	rbx
14586a877:     	sub	rsp, 0x50
14586a87b:     	mov	rsi, rcx
14586a87e:     	cmp	edx, 0x1
14586a881:     	jne	0x14586a89b <.text+0x586989b>
14586a883:     	test	r8b, r8b
14586a886:     	je	0x14586a8b7 <.text+0x58698b7>
14586a888:     	lea	rdi, [rip + 0x17c100b]  # 0x14702b89a
14586a88f:     	mov	ebx, 0x14
14586a894:     	mov	edx, 0x14
14586a899:     	jmp	0x14586a8c8 <.text+0x58698c8>
14586a89b:     	test	r8b, r8b
14586a89e:     	je	0x14586a8f7 <.text+0x58698f7>
14586a8a0:     	mov	dword ptr [rsp + 0x2c], edx
14586a8a4:     	lea	rdi, [rip + 0x17c101a]  # 0x14702b8c5
14586a8ab:     	mov	ebx, 0x1a
14586a8b0:     	mov	edx, 0x1a
14586a8b5:     	jmp	0x14586a90c <.text+0x586990c>
14586a8b7:     	lea	rdi, [rip + 0x17c0fcb]  # 0x14702b889
14586a8be:     	mov	ebx, 0x11
14586a8c3:     	mov	edx, 0x11
14586a8c8:     	mov	rcx, rdi
14586a8cb:     	call	0x1458dff90 <.text+0x58def90>
14586a8d0:     	test	rax, rax
14586a8d3:     	cmove	rax, rdi
14586a8d7:     	mov	rdi, rdx
14586a8da:     	cmove	rdi, rbx
14586a8de:     	test	rdi, rdi
14586a8e1:     	jns	0x14586a968 <.text+0x5869968>
14586a8e7:     	xor	r15d, r15d
14586a8ea:     	mov	rcx, r15
14586a8ed:     	mov	rdx, rdi
14586a8f0:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14586a8f5:     	ud2
14586a8f7:     	mov	dword ptr [rsp + 0x2c], edx
14586a8fb:     	lea	rdi, [rip + 0x17c0fac]  # 0x14702b8ae
14586a902:     	mov	ebx, 0x17
14586a907:     	mov	edx, 0x17
14586a90c:     	mov	rcx, rdi
14586a90f:     	call	0x1458dff90 <.text+0x58def90>
14586a914:     	test	rax, rax
14586a917:     	cmovne	rdi, rax
14586a91b:     	cmovne	rbx, rdx
14586a91f:     	lea	rax, [rip + 0x17a226a]  # 0x14700cb90
14586a926:     	mov	qword ptr [rsp + 0x30], rax
14586a92b:     	mov	qword ptr [rsp + 0x38], 0x1
14586a934:     	lea	rax, [rsp + 0x2c]
14586a939:     	mov	qword ptr [rsp + 0x40], rax
14586a93e:     	lea	rax, [rip + 0x17a22d3]  # 0x14700cc18
14586a945:     	mov	qword ptr [rsp + 0x48], rax
14586a94a:     	mov	qword ptr [rsp + 0x20], 0x1
14586a953:     	lea	r9, [rsp + 0x30]
14586a958:     	mov	rcx, rsi
14586a95b:     	mov	rdx, rdi
14586a95e:     	mov	r8, rbx
14586a961:     	call	0x1458e0370 <.text+0x58df370>
14586a966:     	jmp	0x14586a9b1 <.text+0x58699b1>
14586a968:     	je	0x14586a9a1 <.text+0x58699a1>
14586a96a:     	mov	r14, rax
14586a96d:     	call	0x140002200 <.text+0x1200>
14586a972:     	mov	r15d, 0x1
14586a978:     	mov	edx, 0x1
14586a97d:     	mov	rcx, rdi
14586a980:     	call	0x1400021c0 <.text+0x11c0>
14586a985:     	test	rax, rax
14586a988:     	je	0x14586a8ea <.text+0x58698ea>
14586a98e:     	mov	rbx, rax
14586a991:     	mov	rcx, rax
14586a994:     	mov	rdx, r14
14586a997:     	mov	r8, rdi
14586a99a:     	call	0x145d145fb <.text+0x5d135fb>
14586a99f:     	jmp	0x14586a9a6 <.text+0x58699a6>
14586a9a1:     	mov	ebx, 0x1
14586a9a6:     	mov	qword ptr [rsi], rdi
14586a9a9:     	mov	qword ptr [rsi + 0x8], rbx
14586a9ad:     	mov	qword ptr [rsi + 0x10], rdi
14586a9b1:     	add	rsp, 0x50
14586a9b5:     	pop	rbx
14586a9b6:     	pop	rdi
14586a9b7:     	pop	rsi
14586a9b8:     	pop	r14
14586a9ba:     	pop	r15
14586a9bc:     	ret
