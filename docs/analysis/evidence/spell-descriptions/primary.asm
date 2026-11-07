14585c8e0:     	push	rbp
14585c8e1:     	push	r15
14585c8e3:     	push	r14
14585c8e5:     	push	r13
14585c8e7:     	push	r12
14585c8e9:     	push	rsi
14585c8ea:     	push	rdi
14585c8eb:     	push	rbx
14585c8ec:     	sub	rsp, 0x318
14585c8f3:     	lea	rbp, [rsp + 0x80]
14585c8fb:     	movaps	xmmword ptr [rbp + 0x280], xmm14
14585c903:     	movaps	xmmword ptr [rbp + 0x270], xmm13
14585c90b:     	movaps	xmmword ptr [rbp + 0x260], xmm12
14585c913:     	movaps	xmmword ptr [rbp + 0x250], xmm11
14585c91b:     	movaps	xmmword ptr [rbp + 0x240], xmm10
14585c923:     	movaps	xmmword ptr [rbp + 0x230], xmm9
14585c92b:     	movaps	xmmword ptr [rbp + 0x220], xmm8
14585c933:     	movaps	xmmword ptr [rbp + 0x210], xmm7
14585c93a:     	movaps	xmmword ptr [rbp + 0x200], xmm6
14585c941:     	mov	qword ptr [rbp + 0x1f8], -0x2
14585c94c:     	mov	r12, r8
14585c94f:     	mov	qword ptr [rbp + 0x8], rcx
14585c953:     	mov	rdi, qword ptr [rdx]
14585c956:     	movss	xmm6, dword ptr [r8]
14585c95b:     	movss	xmm8, dword ptr [r8 + 0x4]
14585c961:     	movss	xmm7, dword ptr [rdi + 0x44]
14585c966:     	movss	xmm11, dword ptr [rdx + 0x10]
14585c96c:     	mov	qword ptr [rbp + 0x1b8], rdx
14585c973:     	movss	xmm10, dword ptr [rdx + 0x38]
14585c979:     	movzx	eax, byte ptr [rdi + 0x75]
14585c97d:     	add	al, -0x2
14585c97f:     	cmp	al, 0x6
14585c981:     	ja	0x14585c994 <.text+0x585b994>
14585c983:     	movzx	eax, al
14585c986:     	lea	rcx, [rip + 0x17cf507]  # 0x14702be94
14585c98d:     	movss	xmm0, dword ptr [rcx + 4*rax]
14585c992:     	jmp	0x14585c99c <.text+0x585b99c>
14585c994:     	movss	xmm0, dword ptr [rip + 0x683514] # 0x145edfeb0
14585c99c:     	mov	rax, qword ptr [rbp + 0x1b8]
14585c9a3:     	movss	xmm1, dword ptr [rax + 0x4c]
14585c9a8:     	mulss	xmm1, xmm6
14585c9ac:     	xorps	xmm2, xmm2
14585c9af:     	cmpltss	xmm2, xmm7
14585c9b4:     	andps	xmm2, xmm1
14585c9b7:     	mulss	xmm7, dword ptr [rip + 0x683bdd] # 0x145ee059c
14585c9bf:     	mulss	xmm7, xmm11
14585c9c4:     	mulss	xmm7, xmm10
14585c9c9:     	mulss	xmm7, xmm0
14585c9cd:     	addss	xmm7, xmm2
14585c9d1:     	mulss	xmm7, xmm8
14585c9d6:     	lea	rbx, [rip + 0x17ce1c6]  # 0x14702aba3
14585c9dd:     	mov	r15d, 0x15
14585c9e3:     	mov	edx, 0x15
14585c9e8:     	mov	rcx, rbx
14585c9eb:     	call	0x1458dff90 <.text+0x58def90>
14585c9f0:     	mov	r14, rax
14585c9f3:     	mov	rsi, rdx
14585c9f6:     	lea	r13, [rbp + 0x1e0]
14585c9fd:     	mov	rcx, r13
14585ca00:     	movaps	xmm1, xmm7
14585ca03:     	call	0x1458627d0 <.text+0x58617d0>
14585ca08:     	movzx	ecx, byte ptr [rdi + 0x74]
14585ca0c:     	call	0x14585c840 <.text+0x585b840>
14585ca11:     	nop
14585ca12:     	test	r14, r14
14585ca15:     	cmove	rsi, r15
14585ca19:     	cmovne	rbx, r14
14585ca1d:     	mov	qword ptr [rbp + 0x1c0], rax
14585ca24:     	mov	qword ptr [rbp + 0x1c8], rdx
14585ca2b:     	lea	r14, [rip + 0x17ce186]  # 0x14702abb8
14585ca32:     	mov	qword ptr [rbp + 0xb0], r14
14585ca39:     	mov	qword ptr [rbp + 0xb8], 0x3
14585ca44:     	mov	qword ptr [rbp + 0xc0], r13
14585ca4b:     	lea	rax, [rip + 0x17b011e]  # 0x14700cb70
14585ca52:     	mov	qword ptr [rbp + 0xc8], rax
14585ca59:     	lea	rax, [rip + 0x17ce15b]  # 0x14702abbb
14585ca60:     	mov	qword ptr [rbp + 0xd0], rax
14585ca67:     	mov	qword ptr [rbp + 0xd8], 0x6
14585ca72:     	lea	rax, [rbp + 0x1c0]
14585ca79:     	mov	qword ptr [rbp + 0xe0], rax
14585ca80:     	lea	rax, [rip + 0x17b0169]  # 0x14700cbf0
14585ca87:     	mov	qword ptr [rbp + 0xe8], rax
14585ca8e:     	mov	qword ptr [rsp + 0x20], 0x2
14585ca97:     	lea	r15, [rbp - 0x40]
14585ca9b:     	lea	r9, [rbp + 0xb0]
14585caa2:     	mov	rcx, r15
14585caa5:     	mov	rdx, rbx
14585caa8:     	mov	r8, rsi
14585caab:     	call	0x1458e0370 <.text+0x58df370>
14585cab0:     	nop
14585cab1:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585cab8:     	test	rdx, rdx
14585cabb:     	je	0x14585cacf <.text+0x585bacf>
14585cabd:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585cac4:     	mov	r8d, 0x1
14585caca:     	call	0x1400021d0 <.text+0x11d0>
14585cacf:     	mov	eax, dword ptr [rdi + 0x54]
14585cad2:     	test	eax, eax
14585cad4:     	je	0x14585caf2 <.text+0x585baf2>
14585cad6:     	mov	rcx, qword ptr [rbp + 0x1b8]
14585cadd:     	add	eax, dword ptr [rcx + 0x18]
14585cae0:     	add	eax, dword ptr [rcx + 0x40]
14585cae3:     	mov	ecx, dword ptr [r12 + 0x34]
14585cae8:     	lea	edx, [rax + rcx]
14585caeb:     	cmp	edx, 0x1
14585caee:     	adc	eax, ecx
14585caf0:     	jmp	0x14585caf7 <.text+0x585baf7>
14585caf2:     	mov	eax, 0x1
14585caf7:     	mov	dword ptr [rbp + 0x1dc], eax
14585cafd:     	movss	xmm1, dword ptr [rdi + 0x4c]
14585cb02:     	lea	rcx, [rbp + 0x18]
14585cb06:     	call	0x1458627d0 <.text+0x58617d0>
14585cb0b:     	nop
14585cb0c:     	mov	rax, qword ptr [rbp + 0x1b8]
14585cb13:     	movss	xmm12, dword ptr [rax + 0x1c]
14585cb19:     	mulss	xmm12, dword ptr [rax + 0x44]
14585cb1f:     	movss	xmm0, dword ptr [rdi + 0x50]
14585cb24:     	mulss	xmm0, xmm12
14585cb29:     	movss	xmm9, dword ptr [r12 + 0x28]
14585cb30:     	mulss	xmm0, xmm9
14585cb35:     	movss	xmm13, dword ptr [rip + 0x9381fa] # 0x146194d38
14585cb3e:     	ucomiss	xmm13, xmm0
14585cb42:     	jae	0x14585cb6c <.text+0x585bb6c>
14585cb44:     	addss	xmm0, dword ptr [rip + 0x17afda8] # 0x14700c8f4
14585cb4c:     	movss	xmm14, dword ptr [rip + 0x683837] # 0x145ee038c
14585cb55:     	divss	xmm0, xmm14
14585cb5a:     	call	0x145d1475d <.text+0x5d1375d>
14585cb5f:     	mulss	xmm0, xmm14
14585cb64:     	addss	xmm0, dword ptr [rip + 0x9381cc] # 0x146194d38
14585cb6c:     	lea	r13, [rbp - 0x58]
14585cb70:     	mov	rcx, r13
14585cb73:     	movaps	xmm1, xmm0
14585cb76:     	call	0x1458627d0 <.text+0x58617d0>
14585cb7b:     	nop
14585cb7c:     	lea	rsi, [rip + 0x17ce03e]  # 0x14702abc1
14585cb83:     	mov	ebx, 0x26
14585cb88:     	mov	edx, 0x26
14585cb8d:     	mov	rcx, rsi
14585cb90:     	call	0x1458dff90 <.text+0x58def90>
14585cb95:     	nop
14585cb96:     	test	rax, rax
14585cb99:     	cmovne	rsi, rax
14585cb9d:     	cmove	rdx, rbx
14585cba1:     	mov	qword ptr [rbp + 0x38], rsi
14585cba5:     	mov	qword ptr [rbp + 0x40], rdx
14585cba9:     	movzx	eax, byte ptr [rdi + 0x75]
14585cbad:     	lea	rcx, [rip + 0x17cf7e8]  # 0x14702c39c
14585cbb4:     	movsxd	rax, dword ptr [rcx + 4*rax]
14585cbb8:     	add	rax, rcx
14585cbbb:     	jmp	rax
14585cbbd:     	mov	ebx, 0x1
14585cbc2:     	cmp	qword ptr [rdi + 0x8], 0xa
14585cbc7:     	jne	0x14585cbec <.text+0x585bbec>
14585cbc9:     	mov	rax, qword ptr [rdi]
14585cbcc:     	movabs	rcx, 0x68735f64656d6961
14585cbd6:     	xor	rcx, qword ptr [rax]
14585cbd9:     	movzx	eax, word ptr [rax + 0x8]
14585cbdd:     	xor	rax, 0x746f
14585cbe3:     	or	rax, rcx
14585cbe6:     	je	0x14585e205 <.text+0x585d205>
14585cbec:     	xor	edx, edx
14585cbee:     	mov	qword ptr [rbp + 0x1c0], rbx
14585cbf5:     	mov	qword ptr [rbp + 0x1c8], rdx
14585cbfc:     	cmp	dword ptr [rbp + 0x1dc], 0x1
14585cc03:     	jbe	0x14585e245 <.text+0x585d245>
14585cc09:     	lea	r12, [rip + 0x17ce05f]  # 0x14702ac6f
14585cc10:     	mov	edx, 0x40
14585cc15:     	mov	rcx, r12
14585cc18:     	call	0x1458dff90 <.text+0x58def90>
14585cc1d:     	nop
14585cc1e:     	mov	rsi, rax
14585cc21:     	mov	rbx, rdx
14585cc24:     	mov	edx, dword ptr [rbp + 0x1dc]
14585cc2a:     	lea	r14, [rbp + 0x1e0]
14585cc31:     	mov	rcx, r14
14585cc34:     	xor	r8d, r8d
14585cc37:     	call	0x14586a870 <.text+0x5869870>
14585cc3c:     	nop
14585cc3d:     	test	rsi, rsi
14585cc40:     	mov	eax, 0x40
14585cc45:     	cmove	rbx, rax
14585cc49:     	cmovne	r12, rsi
14585cc4d:     	lea	rax, [rip + 0x17ce003]  # 0x14702ac57
14585cc54:     	mov	qword ptr [rbp + 0xb0], rax
14585cc5b:     	mov	qword ptr [rbp + 0xb8], 0x7
14585cc66:     	mov	qword ptr [rbp + 0xc0], r14
14585cc6d:     	lea	rcx, [rip + 0x17afefc]  # 0x14700cb70
14585cc74:     	mov	qword ptr [rbp + 0xc8], rcx
14585cc7b:     	lea	rax, [rip + 0x17cdfdc]  # 0x14702ac5e
14585cc82:     	mov	qword ptr [rbp + 0xd0], rax
14585cc89:     	mov	qword ptr [rbp + 0xd8], 0x5
14585cc94:     	lea	rax, [rbp + 0x18]
14585cc98:     	mov	qword ptr [rbp + 0xe0], rax
14585cc9f:     	mov	qword ptr [rbp + 0xe8], rcx
14585cca6:     	lea	rax, [rip + 0x17cdfb6]  # 0x14702ac63
14585ccad:     	mov	qword ptr [rbp + 0xf0], rax
14585ccb4:     	mov	qword ptr [rbp + 0xf8], 0x3
14585ccbf:     	mov	qword ptr [rbp + 0x100], r15
14585ccc6:     	mov	qword ptr [rbp + 0x108], rcx
14585cccd:     	lea	rax, [rip + 0x17cdf92]  # 0x14702ac66
14585ccd4:     	mov	qword ptr [rbp + 0x110], rax
14585ccdb:     	mov	qword ptr [rbp + 0x118], 0x5
14585cce6:     	lea	rax, [rbp + 0x38]
14585ccea:     	mov	qword ptr [rbp + 0x120], rax
14585ccf1:     	lea	rcx, [rip + 0x17afef8]  # 0x14700cbf0
14585ccf8:     	mov	qword ptr [rbp + 0x128], rcx
14585ccff:     	lea	rax, [rip + 0x17cdf65]  # 0x14702ac6b
14585cd06:     	mov	qword ptr [rbp + 0x130], rax
14585cd0d:     	mov	qword ptr [rbp + 0x138], 0x4
14585cd18:     	lea	rax, [rbp + 0x1c0]
14585cd1f:     	mov	qword ptr [rbp + 0x140], rax
14585cd26:     	mov	qword ptr [rbp + 0x148], rcx
14585cd2d:     	mov	qword ptr [rsp + 0x20], 0x5
14585cd36:     	lea	rcx, [rbp + 0x90]
14585cd3d:     	lea	r9, [rbp + 0xb0]
14585cd44:     	mov	rdx, r12
14585cd47:     	mov	r8, rbx
14585cd4a:     	call	0x1458e0370 <.text+0x58df370>
14585cd4f:     	nop
14585cd50:     	jmp	0x14585e38c <.text+0x585d38c>
14585cd55:     	lea	rcx, [rbp + 0x90]
14585cd5c:     	mov	rdx, qword ptr [rbp + 0x1b8]
14585cd63:     	mov	r8, r12
14585cd66:     	call	0x14596c1c0 <.text+0x596b1c0>
14585cd6b:     	nop
14585cd6c:     	jmp	0x14585ec46 <.text+0x585dc46>
14585cd71:     	lea	rbx, [rip + 0x17ce1d0]  # 0x14702af48
14585cd78:     	mov	esi, 0x90
14585cd7d:     	mov	edx, 0x90
14585cd82:     	mov	rcx, rbx
14585cd85:     	call	0x1458dff90 <.text+0x58def90>
14585cd8a:     	nop
14585cd8b:     	mov	r8, rdx
14585cd8e:     	test	rax, rax
14585cd91:     	cmovne	rbx, rax
14585cd95:     	cmove	r8, rsi
14585cd99:     	mov	eax, dword ptr [rbp + 0x1dc]
14585cd9f:     	dec	eax
14585cda1:     	mov	dword ptr [rbp + 0x1c0], eax
14585cda7:     	lea	rax, [rip + 0x17cdeb0]  # 0x14702ac5e
14585cdae:     	mov	qword ptr [rbp + 0xb0], rax
14585cdb5:     	mov	qword ptr [rbp + 0xb8], 0x5
14585cdc0:     	lea	rax, [rbp + 0x18]
14585cdc4:     	mov	qword ptr [rbp + 0xc0], rax
14585cdcb:     	lea	rcx, [rip + 0x17afd9e]  # 0x14700cb70
14585cdd2:     	mov	qword ptr [rbp + 0xc8], rcx
14585cdd9:     	lea	rax, [rip + 0x17cde83]  # 0x14702ac63
14585cde0:     	mov	qword ptr [rbp + 0xd0], rax
14585cde7:     	mov	qword ptr [rbp + 0xd8], 0x3
14585cdf2:     	mov	qword ptr [rbp + 0xe0], r15
14585cdf9:     	mov	qword ptr [rbp + 0xe8], rcx
14585ce00:     	lea	rax, [rip + 0x17afd89]  # 0x14700cb90
14585ce07:     	mov	qword ptr [rbp + 0xf0], rax
14585ce0e:     	mov	qword ptr [rbp + 0xf8], 0x1
14585ce19:     	lea	rax, [rbp + 0x1c0]
14585ce20:     	mov	qword ptr [rbp + 0x100], rax
14585ce27:     	lea	rax, [rip + 0x17afdea]  # 0x14700cc18
14585ce2e:     	mov	qword ptr [rbp + 0x108], rax
14585ce35:     	lea	rax, [rip + 0x17ce000]  # 0x14702ae3c
14585ce3c:     	mov	qword ptr [rbp + 0x110], rax
14585ce43:     	mov	qword ptr [rbp + 0x118], 0x1
14585ce4e:     	mov	qword ptr [rbp + 0x120], r13
14585ce55:     	mov	qword ptr [rbp + 0x128], rcx
14585ce5c:     	mov	qword ptr [rsp + 0x20], 0x4
14585ce65:     	lea	rcx, [rbp + 0x1e0]
14585ce6c:     	lea	r9, [rbp + 0xb0]
14585ce73:     	mov	rdx, rbx
14585ce76:     	call	0x1458e0370 <.text+0x58df370>
14585ce7b:     	nop
14585ce7c:     	mov	r14, qword ptr [rbp + 0x38]
14585ce80:     	mov	rbx, qword ptr [rbp + 0x40]
14585ce84:     	mov	rax, qword ptr [rbp + 0x1e0]
14585ce8b:     	mov	rsi, qword ptr [rbp + 0x1f0]
14585ce92:     	sub	rax, rsi
14585ce95:     	cmp	rbx, rax
14585ce98:     	ja	0x14585fa58 <.text+0x585ea58>
14585ce9e:     	test	rbx, rbx
14585cea1:     	je	0x14585ceb8 <.text+0x585beb8>
14585cea3:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585ceaa:     	add	rcx, rsi
14585cead:     	mov	rdx, r14
14585ceb0:     	mov	r8, rbx
14585ceb3:     	call	0x145d145fb <.text+0x5d135fb>
14585ceb8:     	add	rsi, rbx
14585cebb:     	movups	xmm0, xmmword ptr [rbp + 0x1e0]
14585cec2:     	movaps	xmmword ptr [rbp + 0x90], xmm0
14585cec9:     	mov	qword ptr [rbp + 0xa0], rsi
14585ced0:     	jmp	0x14585ec46 <.text+0x585dc46>
14585ced5:     	movss	xmm1, dword ptr [rdi + 0x58]
14585ceda:     	mulss	xmm1, dword ptr [rip + 0x6836ba] # 0x145ee059c
14585cee2:     	mov	rax, qword ptr [rbp + 0x1b8]
14585cee9:     	mulss	xmm1, dword ptr [rax + 0x20]
14585ceee:     	mulss	xmm1, dword ptr [rax + 0x48]
14585cef3:     	lea	r14, [rbp + 0x60]
14585cef7:     	mov	rcx, r14
14585cefa:     	call	0x1458627d0 <.text+0x58617d0>
14585ceff:     	nop
14585cf00:     	lea	rsi, [rip + 0x17ce9d8]  # 0x14702b8df
14585cf07:     	mov	ebx, 0x24
14585cf0c:     	mov	edx, 0x24
14585cf11:     	mov	rcx, rsi
14585cf14:     	call	0x1458dff90 <.text+0x58def90>
14585cf19:     	nop
14585cf1a:     	test	rax, rax
14585cf1d:     	cmovne	rsi, rax
14585cf21:     	cmove	rdx, rbx
14585cf25:     	mov	qword ptr [rbp + 0x48], rsi
14585cf29:     	mov	qword ptr [rbp + 0x50], rdx
14585cf2d:     	mov	eax, dword ptr [rdi + 0x68]
14585cf30:     	lea	ecx, [rax - 0x1]
14585cf33:     	cmp	ecx, 0xa
14585cf36:     	ja	0x14585e902 <.text+0x585d902>
14585cf3c:     	mov	rdx, qword ptr [rbp + 0x1b8]
14585cf43:     	movss	xmm7, dword ptr [rdx + 0x50]
14585cf48:     	lea	rdx, [rip + 0x17cf47d]  # 0x14702c3cc
14585cf4f:     	movsxd	rcx, dword ptr [rdx + 4*rcx]
14585cf53:     	add	rcx, rdx
14585cf56:     	jmp	rcx
14585cf58:     	lea	rsi, [rip + 0x17cec18]  # 0x14702bb77
14585cf5f:     	mov	ebx, 0x10
14585cf64:     	mov	edx, 0x10
14585cf69:     	mov	rcx, rsi
14585cf6c:     	call	0x1458dff90 <.text+0x58def90>
14585cf71:     	nop
14585cf72:     	mov	r8, rdx
14585cf75:     	test	rax, rax
14585cf78:     	cmovne	rsi, rax
14585cf7c:     	cmove	r8, rbx
14585cf80:     	lea	rax, [rip + 0x17cdfb9]  # 0x14702af40
14585cf87:     	mov	qword ptr [rbp + 0xb0], rax
14585cf8e:     	mov	qword ptr [rbp + 0xb8], 0x3
14585cf99:     	mov	qword ptr [rbp + 0xc0], r14
14585cfa0:     	lea	rax, [rip + 0x17afbc9]  # 0x14700cb70
14585cfa7:     	mov	qword ptr [rbp + 0xc8], rax
14585cfae:     	mov	qword ptr [rsp + 0x20], 0x1
14585cfb7:     	lea	rcx, [rbp + 0x90]
14585cfbe:     	lea	r9, [rbp + 0xb0]
14585cfc5:     	mov	rdx, rsi
14585cfc8:     	call	0x1458e0370 <.text+0x58df370>
14585cfcd:     	nop
14585cfce:     	jmp	0x14585e16c <.text+0x585d16c>
14585cfd3:     	lea	rsi, [rip + 0x17cde32]  # 0x14702ae0c
14585cfda:     	mov	ebx, 0x30
14585cfdf:     	mov	edx, 0x30
14585cfe4:     	mov	rcx, rsi
14585cfe7:     	call	0x1458dff90 <.text+0x58def90>
14585cfec:     	nop
14585cfed:     	mov	r8, rdx
14585cff0:     	test	rax, rax
14585cff3:     	cmovne	rsi, rax
14585cff7:     	cmove	r8, rbx
14585cffb:     	lea	rax, [rip + 0x17cde3a]  # 0x14702ae3c
14585d002:     	mov	qword ptr [rbp + 0xb0], rax
14585d009:     	mov	qword ptr [rbp + 0xb8], 0x1
14585d014:     	mov	qword ptr [rbp + 0xc0], r13
14585d01b:     	lea	rcx, [rip + 0x17afb4e]  # 0x14700cb70
14585d022:     	mov	qword ptr [rbp + 0xc8], rcx
14585d029:     	lea	rax, [rip + 0x17cdc33]  # 0x14702ac63
14585d030:     	mov	qword ptr [rbp + 0xd0], rax
14585d037:     	mov	qword ptr [rbp + 0xd8], 0x3
14585d042:     	mov	qword ptr [rbp + 0xe0], r15
14585d049:     	mov	qword ptr [rbp + 0xe8], rcx
14585d050:     	mov	qword ptr [rsp + 0x20], 0x2
14585d059:     	lea	rcx, [rbp + 0x90]
14585d060:     	lea	r9, [rbp + 0xb0]
14585d067:     	mov	rdx, rsi
14585d06a:     	call	0x1458e0370 <.text+0x58df370>
14585d06f:     	nop
14585d070:     	jmp	0x14585ec46 <.text+0x585dc46>
14585d075:     	movss	xmm1, dword ptr [rdi + 0x58]
14585d07a:     	movss	xmm8, dword ptr [rip + 0x683519] # 0x145ee059c
14585d083:     	mulss	xmm8, xmm1
14585d088:     	mov	rax, qword ptr [rbp + 0x1b8]
14585d08f:     	mulss	xmm8, dword ptr [rax + 0x20]
14585d095:     	mulss	xmm8, dword ptr [rax + 0x48]
14585d09b:     	mov	eax, dword ptr [rdi + 0x5c]
14585d09e:     	cmp	eax, 0x1
14585d0a1:     	adc	eax, 0x0
14585d0a4:     	cvtsi2ss	xmm10, rax
14585d0a9:     	movaps	xmm0, xmm8
14585d0ad:     	mulss	xmm0, xmm10
14585d0b2:     	maxss	xmm1, dword ptr [rip + 0x6936ce] # 0x145ef0788
14585d0ba:     	divss	xmm0, xmm1
14585d0be:     	call	0x145d1463d <.text+0x5d1363d>
14585d0c3:     	movaps	xmm9, xmm0
14585d0c7:     	xorps	xmm0, xmm0
14585d0ca:     	ucomiss	xmm0, dword ptr [rdi + 0x4c]
14585d0ce:     	jae	0x14585d96e <.text+0x585c96e>
14585d0d4:     	lea	rsi, [rip + 0x17cdd62]  # 0x14702ae3d
14585d0db:     	mov	ebx, 0x38
14585d0e0:     	mov	edx, 0x38
14585d0e5:     	mov	rcx, rsi
14585d0e8:     	call	0x1458dff90 <.text+0x58def90>
14585d0ed:     	nop
14585d0ee:     	mov	r8, rdx
14585d0f1:     	test	rax, rax
14585d0f4:     	cmovne	rsi, rax
14585d0f8:     	cmove	r8, rbx
14585d0fc:     	lea	rax, [rip + 0x17cdb5b]  # 0x14702ac5e
14585d103:     	mov	qword ptr [rbp + 0xb0], rax
14585d10a:     	mov	qword ptr [rbp + 0xb8], 0x5
14585d115:     	lea	rax, [rbp + 0x18]
14585d119:     	mov	qword ptr [rbp + 0xc0], rax
14585d120:     	lea	rax, [rip + 0x17afa49]  # 0x14700cb70
14585d127:     	mov	qword ptr [rbp + 0xc8], rax
14585d12e:     	mov	qword ptr [rsp + 0x20], 0x1
14585d137:     	lea	rcx, [rbp + 0x48]
14585d13b:     	lea	r9, [rbp + 0xb0]
14585d142:     	mov	rdx, rsi
14585d145:     	call	0x1458e0370 <.text+0x58df370>
14585d14a:     	nop
14585d14b:     	jmp	0x14585d9e1 <.text+0x585c9e1>
14585d150:     	lea	r12, [rip + 0x17ce043]  # 0x14702b19a
14585d157:     	mov	esi, 0xb0
14585d15c:     	mov	edx, 0xb0
14585d161:     	mov	rcx, r12
14585d164:     	call	0x1458dff90 <.text+0x58def90>
14585d169:     	nop
14585d16a:     	mov	r13, rdx
14585d16d:     	test	rax, rax
14585d170:     	cmovne	r12, rax
14585d174:     	cmove	r13, rsi
14585d178:     	cmp	dword ptr [rbp + 0x1dc], 0x1
14585d17f:     	jne	0x14585de39 <.text+0x585ce39>
14585d185:     	lea	rsi, [rip + 0x17ce0be]  # 0x14702b24a
14585d18c:     	mov	edx, 0x8
14585d191:     	mov	rcx, rsi
14585d194:     	call	0x1458dff90 <.text+0x58def90>
14585d199:     	nop
14585d19a:     	mov	rbx, rdx
14585d19d:     	test	rax, rax
14585d1a0:     	cmovne	rsi, rax
14585d1a4:     	mov	eax, 0x8
14585d1a9:     	cmove	rbx, rax
14585d1ad:     	test	rbx, rbx
14585d1b0:     	jns	0x14585e1c6 <.text+0x585d1c6>
14585d1b6:     	xor	ecx, ecx
14585d1b8:     	mov	rdx, rbx
14585d1bb:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14585d1c0:     	nop
14585d1c1:     	jmp	0x14585fad6 <.text+0x585ead6>
14585d1c6:     	cmp	dword ptr [rbp + 0x1dc], 0x1
14585d1cd:     	jne	0x14585dc23 <.text+0x585cc23>
14585d1d3:     	lea	rsi, [rip + 0x17cdad5]  # 0x14702acaf
14585d1da:     	mov	ebx, 0x33
14585d1df:     	mov	edx, 0x33
14585d1e4:     	mov	rcx, rsi
14585d1e7:     	call	0x1458dff90 <.text+0x58def90>
14585d1ec:     	nop
14585d1ed:     	mov	r8, rdx
14585d1f0:     	test	rax, rax
14585d1f3:     	cmovne	rsi, rax
14585d1f7:     	cmove	r8, rbx
14585d1fb:     	lea	rax, [rip + 0x17cda5c]  # 0x14702ac5e
14585d202:     	mov	qword ptr [rbp + 0xb0], rax
14585d209:     	mov	qword ptr [rbp + 0xb8], 0x5
14585d214:     	lea	rax, [rbp + 0x18]
14585d218:     	mov	qword ptr [rbp + 0xc0], rax
14585d21f:     	lea	rcx, [rip + 0x17af94a]  # 0x14700cb70
14585d226:     	mov	qword ptr [rbp + 0xc8], rcx
14585d22d:     	lea	rax, [rip + 0x17cda2f]  # 0x14702ac63
14585d234:     	mov	qword ptr [rbp + 0xd0], rax
14585d23b:     	mov	qword ptr [rbp + 0xd8], 0x3
14585d246:     	mov	qword ptr [rbp + 0xe0], r15
14585d24d:     	mov	qword ptr [rbp + 0xe8], rcx
14585d254:     	mov	qword ptr [rsp + 0x20], 0x2
14585d25d:     	lea	rcx, [rbp + 0x90]
14585d264:     	lea	r9, [rbp + 0xb0]
14585d26b:     	mov	rdx, rsi
14585d26e:     	call	0x1458e0370 <.text+0x58df370>
14585d273:     	nop
14585d274:     	jmp	0x14585ec46 <.text+0x585dc46>
14585d279:     	cmp	dword ptr [rbp + 0x1dc], 0x1
14585d280:     	jne	0x14585dd2c <.text+0x585cd2c>
14585d286:     	lea	rsi, [rip + 0x17cdd4b]  # 0x14702afd8
14585d28d:     	mov	ebx, 0x3d
14585d292:     	mov	edx, 0x3d
14585d297:     	mov	rcx, rsi
14585d29a:     	call	0x1458dff90 <.text+0x58def90>
14585d29f:     	nop
14585d2a0:     	mov	r8, rdx
14585d2a3:     	test	rax, rax
14585d2a6:     	cmovne	rsi, rax
14585d2aa:     	cmove	r8, rbx
14585d2ae:     	lea	rax, [rip + 0x17cd9a9]  # 0x14702ac5e
14585d2b5:     	mov	qword ptr [rbp + 0xb0], rax
14585d2bc:     	mov	qword ptr [rbp + 0xb8], 0x5
14585d2c7:     	lea	rax, [rbp + 0x18]
14585d2cb:     	mov	qword ptr [rbp + 0xc0], rax
14585d2d2:     	lea	rcx, [rip + 0x17af897]  # 0x14700cb70
14585d2d9:     	mov	qword ptr [rbp + 0xc8], rcx
14585d2e0:     	lea	rax, [rip + 0x17cd97c]  # 0x14702ac63
14585d2e7:     	mov	qword ptr [rbp + 0xd0], rax
14585d2ee:     	mov	qword ptr [rbp + 0xd8], 0x3
14585d2f9:     	mov	qword ptr [rbp + 0xe0], r15
14585d300:     	mov	qword ptr [rbp + 0xe8], rcx
14585d307:     	lea	rax, [rip + 0x17cd958]  # 0x14702ac66
14585d30e:     	mov	qword ptr [rbp + 0xf0], rax
14585d315:     	mov	qword ptr [rbp + 0xf8], 0x5
14585d320:     	lea	rax, [rbp + 0x38]
14585d324:     	mov	qword ptr [rbp + 0x100], rax
14585d32b:     	lea	rax, [rip + 0x17af8be]  # 0x14700cbf0
14585d332:     	mov	qword ptr [rbp + 0x108], rax
14585d339:     	mov	qword ptr [rsp + 0x20], 0x3
14585d342:     	lea	rcx, [rbp + 0x90]
14585d349:     	lea	r9, [rbp + 0xb0]
14585d350:     	mov	rdx, rsi
14585d353:     	call	0x1458e0370 <.text+0x58df370>
14585d358:     	nop
14585d359:     	jmp	0x14585ec46 <.text+0x585dc46>
14585d35e:     	movss	xmm12, dword ptr [rdi + 0x58]
14585d364:     	movss	xmm13, dword ptr [rip + 0x68322f] # 0x145ee059c
14585d36d:     	mulss	xmm13, xmm12
14585d372:     	mov	rax, qword ptr [rbp + 0x1b8]
14585d379:     	mulss	xmm13, dword ptr [rax + 0x20]
14585d37f:     	mulss	xmm13, dword ptr [rax + 0x48]
14585d385:     	movss	xmm14, dword ptr [rip + 0x6933fa] # 0x145ef0788
14585d38e:     	mov	eax, dword ptr [rdi + 0x5c]
14585d391:     	cmp	eax, 0x1
14585d394:     	adc	eax, 0x0
14585d397:     	movss	xmm10, dword ptr [rip + 0x682b10] # 0x145edfeb0
14585d3a0:     	xorps	xmm0, xmm0
14585d3a3:     	cvtsi2ss	xmm0, rax
14585d3a8:     	movss	xmm9, dword ptr [r12 + 0x48]
14585d3af:     	addss	xmm9, xmm10
14585d3b4:     	movaps	xmm11, xmm12
14585d3b8:     	divss	xmm11, xmm0
14585d3bd:     	movaps	xmm1, xmm11
14585d3c1:     	maxss	xmm1, xmm14
14585d3c6:     	movaps	xmm0, xmm13
14585d3ca:     	divss	xmm0, xmm1
14585d3ce:     	call	0x145d1463d <.text+0x5d1363d>
14585d3d3:     	movaps	xmm8, xmm0
14585d3d7:     	maxss	xmm8, xmm10
14585d3dc:     	movaps	xmm0, xmm9
14585d3e0:     	mulss	xmm0, xmm8
14585d3e5:     	call	0x145d1463d <.text+0x5d1363d>
14585d3ea:     	movaps	xmm10, xmm0
14585d3ee:     	cvttss2si	rax, xmm0
14585d3f3:     	xor	ecx, ecx
14585d3f5:     	xorps	xmm0, xmm0
14585d3f8:     	ucomiss	xmm10, xmm0
14585d3fc:     	cmovae	ecx, eax
14585d3ff:     	ucomiss	xmm10, dword ptr [rip + 0x6a37ad] # 0x145f00bb4
14585d407:     	mov	eax, 0xffffffff
14585d40c:     	cmovbe	eax, ecx
14585d40f:     	mov	ecx, dword ptr [r12 + 0x44]
14585d414:     	cmp	ecx, 0x3
14585d417:     	mov	edx, 0x3
14585d41c:     	cmovb	edx, ecx
14585d41f:     	mov	dword ptr [rbp + 0x34], eax
14585d422:     	inc	edx
14585d424:     	mov	qword ptr [rbp - 0x28], rdx
14585d428:     	test	ecx, ecx
14585d42a:     	je	0x14585e182 <.text+0x585d182>
14585d430:     	lea	rsi, [rip + 0x17cdc3f]  # 0x14702b076
14585d437:     	mov	ebx, 0x80
14585d43c:     	mov	edx, 0x80
14585d441:     	mov	rcx, rsi
14585d444:     	call	0x1458dff90 <.text+0x58def90>
14585d449:     	nop
14585d44a:     	mov	r8, rdx
14585d44d:     	test	rax, rax
14585d450:     	cmovne	rsi, rax
14585d454:     	cmove	r8, rbx
14585d458:     	lea	rax, [rip + 0x17cdcb9]  # 0x14702b118
14585d45f:     	mov	qword ptr [rbp + 0xb0], rax
14585d466:     	mov	qword ptr [rbp + 0xb8], 0x3
14585d471:     	lea	rax, [rbp - 0x28]
14585d475:     	mov	qword ptr [rbp + 0xc0], rax
14585d47c:     	lea	rax, [rip + 0x17cdc75]  # 0x14702b0f8
14585d483:     	mov	qword ptr [rbp + 0xc8], rax
14585d48a:     	mov	qword ptr [rsp + 0x20], 0x1
14585d493:     	lea	rcx, [rbp - 0x20]
14585d497:     	lea	r9, [rbp + 0xb0]
14585d49e:     	mov	rdx, rsi
14585d4a1:     	call	0x1458e0370 <.text+0x58df370>
14585d4a6:     	nop
14585d4a7:     	mov	r13d, 0x1
14585d4ad:     	xor	r12d, r12d
14585d4b0:     	mov	qword ptr [rbp + 0x48], r12
14585d4b4:     	mov	qword ptr [rbp + 0x50], r13
14585d4b8:     	mov	qword ptr [rbp + 0x58], r12
14585d4bc:     	mov	rax, qword ptr [rbp - 0x10]
14585d4c0:     	mov	qword ptr [rbp + 0x70], rax
14585d4c4:     	mov	rax, qword ptr [rbp - 0x20]
14585d4c8:     	mov	qword ptr [rbp + 0x60], rax
14585d4cc:     	mov	rax, qword ptr [rbp - 0x18]
14585d4d0:     	mov	qword ptr [rbp + 0x68], rax
14585d4d4:     	lea	r15, [rip + 0x17cdc40]  # 0x14702b11b
14585d4db:     	mov	esi, 0x6d
14585d4e0:     	mov	edx, 0x6d
14585d4e5:     	mov	rcx, r15
14585d4e8:     	call	0x1458dff90 <.text+0x58def90>
14585d4ed:     	nop
14585d4ee:     	mov	r12, rdx
14585d4f1:     	test	rax, rax
14585d4f4:     	cmovne	r15, rax
14585d4f8:     	cmove	r12, rsi
14585d4fc:     	mov	edx, dword ptr [rbp + 0x1dc]
14585d502:     	lea	r13, [rbp + 0x78]
14585d506:     	mov	rcx, r13
14585d509:     	mov	r8b, 0x1
14585d50c:     	call	0x14586a870 <.text+0x5869870>
14585d511:     	nop
14585d512:     	mulss	xmm7, xmm13
14585d517:     	maxss	xmm12, xmm14
14585d51c:     	divss	xmm7, xmm12
14585d521:     	mulss	xmm9, xmm7
14585d526:     	lea	rbx, [rbp + 0x1c0]
14585d52d:     	mov	rcx, rbx
14585d530:     	movaps	xmm1, xmm9
14585d534:     	call	0x1458627d0 <.text+0x58617d0>
14585d539:     	nop
14585d53a:     	movzx	ecx, byte ptr [rdi + 0x74]
14585d53e:     	call	0x14585c840 <.text+0x585b840>
14585d543:     	nop
14585d544:     	mulss	xmm11, xmm8
14585d549:     	divss	xmm11, xmm10
14585d54e:     	mov	qword ptr [rbp - 0x8], rax
14585d552:     	mov	qword ptr [rbp], rdx
14585d556:     	mov	eax, dword ptr [rbp + 0x34]
14585d559:     	xorps	xmm1, xmm1
14585d55c:     	cvtsi2ss	xmm1, rax
14585d561:     	mulss	xmm1, xmm11
14585d566:     	lea	rsi, [rbp + 0x1e0]
14585d56d:     	mov	rcx, rsi
14585d570:     	call	0x1458627d0 <.text+0x58617d0>
14585d575:     	nop
14585d576:     	lea	rax, [rip + 0x17cd6da]  # 0x14702ac57
14585d57d:     	mov	qword ptr [rbp + 0xb0], rax
14585d584:     	mov	qword ptr [rbp + 0xb8], 0x7
14585d58f:     	mov	qword ptr [rbp + 0xc0], r13
14585d596:     	lea	rcx, [rip + 0x17af5d3]  # 0x14700cb70
14585d59d:     	mov	qword ptr [rbp + 0xc8], rcx
14585d5a4:     	lea	rax, [rip + 0x17cd6b3]  # 0x14702ac5e
14585d5ab:     	mov	qword ptr [rbp + 0xd0], rax
14585d5b2:     	mov	qword ptr [rbp + 0xd8], 0x5
14585d5bd:     	lea	rax, [rbp + 0x18]
14585d5c1:     	mov	qword ptr [rbp + 0xe0], rax
14585d5c8:     	mov	qword ptr [rbp + 0xe8], rcx
14585d5cf:     	lea	rax, [rip + 0x17cdbb2]  # 0x14702b188
14585d5d6:     	mov	qword ptr [rbp + 0xf0], rax
14585d5dd:     	mov	qword ptr [rbp + 0xf8], 0x4
14585d5e8:     	lea	rax, [rbp + 0x48]
14585d5ec:     	mov	qword ptr [rbp + 0x100], rax
14585d5f3:     	mov	qword ptr [rbp + 0x108], rcx
14585d5fa:     	lea	rax, [rip + 0x17cd942]  # 0x14702af43
14585d601:     	mov	qword ptr [rbp + 0x110], rax
14585d608:     	mov	qword ptr [rbp + 0x118], 0x5
14585d613:     	mov	qword ptr [rbp + 0x120], rbx
14585d61a:     	mov	qword ptr [rbp + 0x128], rcx
14585d621:     	lea	rax, [rip + 0x17cd593]  # 0x14702abbb
14585d628:     	mov	qword ptr [rbp + 0x130], rax
14585d62f:     	mov	qword ptr [rbp + 0x138], 0x6
14585d63a:     	lea	rax, [rbp - 0x8]
14585d63e:     	mov	qword ptr [rbp + 0x140], rax
14585d645:     	lea	rax, [rip + 0x17af5a4]  # 0x14700cbf0
14585d64c:     	mov	qword ptr [rbp + 0x148], rax
14585d653:     	lea	rax, [rip + 0x17cdb32]  # 0x14702b18c
14585d65a:     	mov	qword ptr [rbp + 0x150], rax
14585d661:     	mov	qword ptr [rbp + 0x158], 0x4
14585d66c:     	mov	qword ptr [rbp + 0x160], rsi
14585d673:     	mov	qword ptr [rbp + 0x168], rcx
14585d67a:     	lea	rax, [rip + 0x17cdb0f]  # 0x14702b190
14585d681:     	mov	qword ptr [rbp + 0x170], rax
14585d688:     	mov	qword ptr [rbp + 0x178], 0x5
14585d693:     	lea	rax, [rbp + 0x34]
14585d697:     	mov	qword ptr [rbp + 0x180], rax
14585d69e:     	lea	rax, [rip + 0x17af573]  # 0x14700cc18
14585d6a5:     	mov	qword ptr [rbp + 0x188], rax
14585d6ac:     	lea	rax, [rip + 0x17cdae2]  # 0x14702b195
14585d6b3:     	mov	qword ptr [rbp + 0x190], rax
14585d6ba:     	mov	qword ptr [rbp + 0x198], 0x5
14585d6c5:     	lea	rax, [rbp + 0x60]
14585d6c9:     	mov	qword ptr [rbp + 0x1a0], rax
14585d6d0:     	mov	qword ptr [rbp + 0x1a8], rcx
14585d6d7:     	mov	qword ptr [rsp + 0x20], 0x8
14585d6e0:     	lea	rcx, [rbp + 0x90]
14585d6e7:     	lea	r9, [rbp + 0xb0]
14585d6ee:     	mov	rdx, r15
14585d6f1:     	mov	r8, r12
14585d6f4:     	call	0x1458e0370 <.text+0x58df370>
14585d6f9:     	nop
14585d6fa:     	mov	rdx, qword ptr [rbp + 0x60]
14585d6fe:     	test	rdx, rdx
14585d701:     	je	0x14585d712 <.text+0x585c712>
14585d703:     	mov	rcx, qword ptr [rbp + 0x68]
14585d707:     	mov	r8d, 0x1
14585d70d:     	call	0x1400021d0 <.text+0x11d0>
14585d712:     	mov	rdx, qword ptr [rbp + 0x48]
14585d716:     	test	rdx, rdx
14585d719:     	je	0x14585d72a <.text+0x585c72a>
14585d71b:     	mov	rcx, qword ptr [rbp + 0x50]
14585d71f:     	mov	r8d, 0x1
14585d725:     	call	0x1400021d0 <.text+0x11d0>
14585d72a:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585d731:     	test	rdx, rdx
14585d734:     	je	0x14585d748 <.text+0x585c748>
14585d736:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585d73d:     	mov	r8d, 0x1
14585d743:     	call	0x1400021d0 <.text+0x11d0>
14585d748:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585d74f:     	test	rdx, rdx
14585d752:     	je	0x14585d766 <.text+0x585c766>
14585d754:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585d75b:     	mov	r8d, 0x1
14585d761:     	call	0x1400021d0 <.text+0x11d0>
14585d766:     	mov	rdx, qword ptr [rbp + 0x78]
14585d76a:     	test	rdx, rdx
14585d76d:     	je	0x14585ec46 <.text+0x585dc46>
14585d773:     	mov	rcx, qword ptr [rbp + 0x80]
14585d77a:     	jmp	0x14585ec3b <.text+0x585dc3b>
14585d77f:     	movss	xmm1, dword ptr [rdi + 0x58]
14585d784:     	movss	xmm7, dword ptr [rip + 0x682e10] # 0x145ee059c
14585d78c:     	mulss	xmm7, xmm1
14585d790:     	mov	rax, qword ptr [rbp + 0x1b8]
14585d797:     	mulss	xmm7, dword ptr [rax + 0x20]
14585d79c:     	mulss	xmm7, dword ptr [rax + 0x48]
14585d7a1:     	mov	eax, dword ptr [rdi + 0x5c]
14585d7a4:     	cmp	eax, 0x1
14585d7a7:     	adc	eax, 0x0
14585d7aa:     	xorps	xmm0, xmm0
14585d7ad:     	cvtsi2ss	xmm0, rax
14585d7b2:     	divss	xmm1, xmm0
14585d7b6:     	lea	r12, [rbp + 0x60]
14585d7ba:     	mov	rcx, r12
14585d7bd:     	call	0x1458627d0 <.text+0x58617d0>
14585d7c2:     	nop
14585d7c3:     	movss	xmm0, dword ptr [rdi + 0x50]
14585d7c8:     	xorps	xmm1, xmm1
14585d7cb:     	ucomiss	xmm0, xmm1
14585d7ce:     	jbe	0x14585debb <.text+0x585cebb>
14585d7d4:     	lea	rsi, [rip + 0x17cdafe]  # 0x14702b2d9
14585d7db:     	mov	ebx, 0x2e
14585d7e0:     	mov	edx, 0x2e
14585d7e5:     	mov	rcx, rsi
14585d7e8:     	call	0x1458dff90 <.text+0x58def90>
14585d7ed:     	nop
14585d7ee:     	mov	r8, rdx
14585d7f1:     	test	rax, rax
14585d7f4:     	cmovne	rsi, rax
14585d7f8:     	cmove	r8, rbx
14585d7fc:     	lea	rax, [rip + 0x17cd460]  # 0x14702ac63
14585d803:     	mov	qword ptr [rbp + 0xb0], rax
14585d80a:     	mov	qword ptr [rbp + 0xb8], 0x3
14585d815:     	mov	qword ptr [rbp + 0xc0], r15
14585d81c:     	lea	rcx, [rip + 0x17af34d]  # 0x14700cb70
14585d823:     	mov	qword ptr [rbp + 0xc8], rcx
14585d82a:     	lea	rax, [rip + 0x17cd60b]  # 0x14702ae3c
14585d831:     	mov	qword ptr [rbp + 0xd0], rax
14585d838:     	mov	qword ptr [rbp + 0xd8], 0x1
14585d843:     	mov	qword ptr [rbp + 0xe0], r13
14585d84a:     	mov	qword ptr [rbp + 0xe8], rcx
14585d851:     	mov	qword ptr [rsp + 0x20], 0x2
14585d85a:     	lea	rcx, [rbp + 0x78]
14585d85e:     	lea	r9, [rbp + 0xb0]
14585d865:     	mov	rdx, rsi
14585d868:     	call	0x1458e0370 <.text+0x58df370>
14585d86d:     	nop
14585d86e:     	jmp	0x14585dfbe <.text+0x585cfbe>
14585d873:     	lea	r14, [rip + 0x17cd9f0]  # 0x14702b26a
14585d87a:     	mov	esi, 0x3f
14585d87f:     	mov	edx, 0x3f
14585d884:     	mov	rcx, r14
14585d887:     	call	0x1458dff90 <.text+0x58def90>
14585d88c:     	nop
14585d88d:     	mov	r12, rdx
14585d890:     	test	rax, rax
14585d893:     	cmovne	r14, rax
14585d897:     	cmove	r12, rsi
14585d89b:     	mulss	xmm12, dword ptr [rdi + 0x4c]
14585d8a1:     	mulss	xmm9, xmm12
14585d8a6:     	ucomiss	xmm13, xmm9
14585d8aa:     	jae	0x14585d8dd <.text+0x585c8dd>
14585d8ac:     	addss	xmm9, dword ptr [rip + 0x17af03f] # 0x14700c8f4
14585d8b5:     	movss	xmm7, dword ptr [rip + 0x682acf] # 0x145ee038c
14585d8bd:     	divss	xmm9, xmm7
14585d8c2:     	movaps	xmm0, xmm9
14585d8c6:     	call	0x145d1475d <.text+0x5d1375d>
14585d8cb:     	movaps	xmm9, xmm0
14585d8cf:     	mulss	xmm9, xmm7
14585d8d4:     	addss	xmm9, dword ptr [rip + 0x93745b] # 0x146194d38
14585d8dd:     	lea	rsi, [rbp + 0x1e0]
14585d8e4:     	mov	rcx, rsi
14585d8e7:     	movaps	xmm1, xmm9
14585d8eb:     	call	0x1458627d0 <.text+0x58617d0>
14585d8f0:     	nop
14585d8f1:     	lea	rax, [rip + 0x17cd9b1]  # 0x14702b2a9
14585d8f8:     	mov	qword ptr [rbp + 0xb0], rax
14585d8ff:     	mov	qword ptr [rbp + 0xb8], 0x4
14585d90a:     	mov	qword ptr [rbp + 0xc0], rsi
14585d911:     	lea	rcx, [rip + 0x17af258]  # 0x14700cb70
14585d918:     	mov	qword ptr [rbp + 0xc8], rcx
14585d91f:     	lea	rax, [rip + 0x17cd33d]  # 0x14702ac63
14585d926:     	mov	qword ptr [rbp + 0xd0], rax
14585d92d:     	mov	qword ptr [rbp + 0xd8], 0x3
14585d938:     	mov	qword ptr [rbp + 0xe0], r15
14585d93f:     	mov	qword ptr [rbp + 0xe8], rcx
14585d946:     	mov	qword ptr [rsp + 0x20], 0x2
14585d94f:     	lea	rcx, [rbp + 0x90]
14585d956:     	lea	r9, [rbp + 0xb0]
14585d95d:     	mov	rdx, r14
14585d960:     	mov	r8, r12
14585d963:     	call	0x1458e0370 <.text+0x58df370>
14585d968:     	nop
14585d969:     	jmp	0x14585e38c <.text+0x585d38c>
14585d96e:     	lea	rsi, [rip + 0x17cd500]  # 0x14702ae75
14585d975:     	mov	ebx, 0x40
14585d97a:     	mov	edx, 0x40
14585d97f:     	mov	rcx, rsi
14585d982:     	call	0x1458dff90 <.text+0x58def90>
14585d987:     	nop
14585d988:     	mov	r8, rdx
14585d98b:     	test	rax, rax
14585d98e:     	cmovne	rsi, rax
14585d992:     	cmove	r8, rbx
14585d996:     	lea	rax, [rip + 0x17cd49f]  # 0x14702ae3c
14585d99d:     	mov	qword ptr [rbp + 0xb0], rax
14585d9a4:     	mov	qword ptr [rbp + 0xb8], 0x1
14585d9af:     	mov	qword ptr [rbp + 0xc0], r13
14585d9b6:     	lea	rax, [rip + 0x17af1b3]  # 0x14700cb70
14585d9bd:     	mov	qword ptr [rbp + 0xc8], rax
14585d9c4:     	mov	qword ptr [rsp + 0x20], 0x1
14585d9cd:     	lea	rcx, [rbp + 0x48]
14585d9d1:     	lea	r9, [rbp + 0xb0]
14585d9d8:     	mov	rdx, rsi
14585d9db:     	call	0x1458e0370 <.text+0x58df370>
14585d9e0:     	nop
14585d9e1:     	lea	r14, [rip + 0x17cd4cd]  # 0x14702aeb5
14585d9e8:     	mov	esi, 0x7d
14585d9ed:     	mov	edx, 0x7d
14585d9f2:     	mov	rcx, r14
14585d9f5:     	call	0x1458dff90 <.text+0x58def90>
14585d9fa:     	nop
14585d9fb:     	mov	r15, rdx
14585d9fe:     	divss	xmm7, xmm10
14585da03:     	test	rax, rax
14585da06:     	cmovne	r14, rax
14585da0a:     	cmove	r15, rsi
14585da0e:     	lea	rcx, [rbp + 0x60]
14585da12:     	movaps	xmm1, xmm7
14585da15:     	call	0x1458627d0 <.text+0x58617d0>
14585da1a:     	nop
14585da1b:     	movzx	ecx, byte ptr [rdi + 0x74]
14585da1f:     	call	0x14585c840 <.text+0x585b840>
14585da24:     	nop
14585da25:     	maxss	xmm9, dword ptr [rip + 0x682482] # 0x145edfeb0
14585da2e:     	mov	qword ptr [rbp - 0x8], rax
14585da32:     	mov	qword ptr [rbp], rdx
14585da36:     	movaps	xmm1, xmm8
14585da3a:     	divss	xmm1, xmm9
14585da3f:     	lea	rbx, [rbp + 0x78]
14585da43:     	mov	rcx, rbx
14585da46:     	call	0x1458627d0 <.text+0x58617d0>
14585da4b:     	nop
14585da4c:     	lea	rsi, [rbp + 0x1c0]
14585da53:     	mov	rcx, rsi
14585da56:     	movaps	xmm1, xmm8
14585da5a:     	call	0x1458627d0 <.text+0x58617d0>
14585da5f:     	nop
14585da60:     	mulss	xmm7, xmm9
14585da65:     	lea	r12, [rbp + 0x1e0]
14585da6c:     	mov	rcx, r12
14585da6f:     	movaps	xmm1, xmm7
14585da72:     	call	0x1458627d0 <.text+0x58617d0>
14585da77:     	nop
14585da78:     	lea	rax, [rip + 0x17cd4b3]  # 0x14702af32
14585da7f:     	mov	qword ptr [rbp + 0xb0], rax
14585da86:     	mov	qword ptr [rbp + 0xb8], 0x5
14585da91:     	lea	rax, [rbp + 0x48]
14585da95:     	mov	qword ptr [rbp + 0xc0], rax
14585da9c:     	lea	rcx, [rip + 0x17af0cd]  # 0x14700cb70
14585daa3:     	mov	qword ptr [rbp + 0xc8], rcx
14585daaa:     	lea	rax, [rip + 0x17cd38b]  # 0x14702ae3c
14585dab1:     	mov	qword ptr [rbp + 0xd0], rax
14585dab8:     	mov	qword ptr [rbp + 0xd8], 0x1
14585dac3:     	mov	qword ptr [rbp + 0xe0], r13
14585daca:     	mov	qword ptr [rbp + 0xe8], rcx
14585dad1:     	lea	rax, [rip + 0x17cd45f]  # 0x14702af37
14585dad8:     	mov	qword ptr [rbp + 0xf0], rax
14585dadf:     	mov	qword ptr [rbp + 0xf8], 0x4
14585daea:     	lea	rax, [rbp + 0x60]
14585daee:     	mov	qword ptr [rbp + 0x100], rax
14585daf5:     	mov	qword ptr [rbp + 0x108], rcx
14585dafc:     	lea	rax, [rip + 0x17cd0b8]  # 0x14702abbb
14585db03:     	mov	qword ptr [rbp + 0x110], rax
14585db0a:     	mov	qword ptr [rbp + 0x118], 0x6
14585db15:     	lea	rax, [rbp - 0x8]
14585db19:     	mov	qword ptr [rbp + 0x120], rax
14585db20:     	lea	rax, [rip + 0x17af0c9]  # 0x14700cbf0
14585db27:     	mov	qword ptr [rbp + 0x128], rax
14585db2e:     	lea	rax, [rip + 0x17cd406]  # 0x14702af3b
14585db35:     	mov	qword ptr [rbp + 0x130], rax
14585db3c:     	mov	qword ptr [rbp + 0x138], 0x5
14585db47:     	mov	qword ptr [rbp + 0x140], rbx
14585db4e:     	mov	qword ptr [rbp + 0x148], rcx
14585db55:     	lea	rax, [rip + 0x17cd3e4]  # 0x14702af40
14585db5c:     	mov	qword ptr [rbp + 0x150], rax
14585db63:     	mov	qword ptr [rbp + 0x158], 0x3
14585db6e:     	mov	qword ptr [rbp + 0x160], rsi
14585db75:     	mov	qword ptr [rbp + 0x168], rcx
14585db7c:     	lea	rax, [rip + 0x17cd3c0]  # 0x14702af43
14585db83:     	mov	qword ptr [rbp + 0x170], rax
14585db8a:     	mov	qword ptr [rbp + 0x178], 0x5
14585db95:     	mov	qword ptr [rbp + 0x180], r12
14585db9c:     	mov	qword ptr [rbp + 0x188], rcx
14585dba3:     	mov	qword ptr [rsp + 0x20], 0x7
14585dbac:     	lea	rcx, [rbp + 0x90]
14585dbb3:     	lea	r9, [rbp + 0xb0]
14585dbba:     	mov	rdx, r14
14585dbbd:     	mov	r8, r15
14585dbc0:     	call	0x1458e0370 <.text+0x58df370>
14585dbc5:     	nop
14585dbc6:     	mov	rdx, qword ptr [rbp + 0x48]
14585dbca:     	test	rdx, rdx
14585dbcd:     	je	0x14585dbde <.text+0x585cbde>
14585dbcf:     	mov	rcx, qword ptr [rbp + 0x50]
14585dbd3:     	mov	r8d, 0x1
14585dbd9:     	call	0x1400021d0 <.text+0x11d0>
14585dbde:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585dbe5:     	test	rdx, rdx
14585dbe8:     	je	0x14585dbfc <.text+0x585cbfc>
14585dbea:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585dbf1:     	mov	r8d, 0x1
14585dbf7:     	call	0x1400021d0 <.text+0x11d0>
14585dbfc:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585dc03:     	test	rdx, rdx
14585dc06:     	je	0x14585e151 <.text+0x585d151>
14585dc0c:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585dc13:     	mov	r8d, 0x1
14585dc19:     	call	0x1400021d0 <.text+0x11d0>
14585dc1e:     	jmp	0x14585e151 <.text+0x585d151>
14585dc23:     	cmp	qword ptr [rdi + 0x8], 0xf
14585dc28:     	jne	0x14585dc51 <.text+0x585cc51>
14585dc2a:     	mov	rax, qword ptr [rdi]
14585dc2d:     	movabs	rcx, 0x6d5f656e61637261
14585dc37:     	xor	rcx, qword ptr [rax]
14585dc3a:     	movabs	rdx, 0x73656c697373696d
14585dc44:     	xor	rdx, qword ptr [rax + 0x7]
14585dc48:     	or	rdx, rcx
14585dc4b:     	je	0x14585ea34 <.text+0x585da34>
14585dc51:     	lea	rsi, [rip + 0x17cd08a]  # 0x14702ace2
14585dc58:     	mov	ebx, 0x7b
14585dc5d:     	mov	edx, 0x7b
14585dc62:     	mov	rcx, rsi
14585dc65:     	call	0x1458dff90 <.text+0x58def90>
14585dc6a:     	nop
14585dc6b:     	mov	r8, rdx
14585dc6e:     	test	rax, rax
14585dc71:     	cmovne	rsi, rax
14585dc75:     	cmove	r8, rbx
14585dc79:     	lea	rax, [rip + 0x17aef10]  # 0x14700cb90
14585dc80:     	mov	qword ptr [rbp + 0xb0], rax
14585dc87:     	mov	qword ptr [rbp + 0xb8], 0x1
14585dc92:     	lea	rax, [rbp + 0x1dc]
14585dc99:     	mov	qword ptr [rbp + 0xc0], rax
14585dca0:     	lea	rax, [rip + 0x17aef71]  # 0x14700cc18
14585dca7:     	mov	qword ptr [rbp + 0xc8], rax
14585dcae:     	lea	rax, [rip + 0x17ccfa9]  # 0x14702ac5e
14585dcb5:     	mov	qword ptr [rbp + 0xd0], rax
14585dcbc:     	mov	qword ptr [rbp + 0xd8], 0x5
14585dcc7:     	lea	rax, [rbp + 0x18]
14585dccb:     	mov	qword ptr [rbp + 0xe0], rax
14585dcd2:     	lea	rcx, [rip + 0x17aee97]  # 0x14700cb70
14585dcd9:     	mov	qword ptr [rbp + 0xe8], rcx
14585dce0:     	lea	rax, [rip + 0x17ccf7c]  # 0x14702ac63
14585dce7:     	mov	qword ptr [rbp + 0xf0], rax
14585dcee:     	mov	qword ptr [rbp + 0xf8], 0x3
14585dcf9:     	mov	qword ptr [rbp + 0x100], r15
14585dd00:     	mov	qword ptr [rbp + 0x108], rcx
14585dd07:     	mov	qword ptr [rsp + 0x20], 0x3
14585dd10:     	lea	rcx, [rbp + 0x90]
14585dd17:     	lea	r9, [rbp + 0xb0]
14585dd1e:     	mov	rdx, rsi
14585dd21:     	call	0x1458e0370 <.text+0x58df370>
14585dd26:     	nop
14585dd27:     	jmp	0x14585ec46 <.text+0x585dc46>
14585dd2c:     	lea	rsi, [rip + 0x17cd2e2]  # 0x14702b015
14585dd33:     	mov	ebx, 0x42
14585dd38:     	mov	edx, 0x42
14585dd3d:     	mov	rcx, rsi
14585dd40:     	call	0x1458dff90 <.text+0x58def90>
14585dd45:     	nop
14585dd46:     	mov	r8, rdx
14585dd49:     	test	rax, rax
14585dd4c:     	cmovne	rsi, rax
14585dd50:     	cmove	r8, rbx
14585dd54:     	lea	rax, [rip + 0x17aee35]  # 0x14700cb90
14585dd5b:     	mov	qword ptr [rbp + 0xb0], rax
14585dd62:     	mov	qword ptr [rbp + 0xb8], 0x1
14585dd6d:     	lea	rax, [rbp + 0x1dc]
14585dd74:     	mov	qword ptr [rbp + 0xc0], rax
14585dd7b:     	lea	rax, [rip + 0x17aee96]  # 0x14700cc18
14585dd82:     	mov	qword ptr [rbp + 0xc8], rax
14585dd89:     	lea	rax, [rip + 0x17ccece]  # 0x14702ac5e
14585dd90:     	mov	qword ptr [rbp + 0xd0], rax
14585dd97:     	mov	qword ptr [rbp + 0xd8], 0x5
14585dda2:     	lea	rax, [rbp + 0x18]
14585dda6:     	mov	qword ptr [rbp + 0xe0], rax
14585ddad:     	lea	rcx, [rip + 0x17aedbc]  # 0x14700cb70
14585ddb4:     	mov	qword ptr [rbp + 0xe8], rcx
14585ddbb:     	lea	rax, [rip + 0x17ccea1]  # 0x14702ac63
14585ddc2:     	mov	qword ptr [rbp + 0xf0], rax
14585ddc9:     	mov	qword ptr [rbp + 0xf8], 0x3
14585ddd4:     	mov	qword ptr [rbp + 0x100], r15
14585dddb:     	mov	qword ptr [rbp + 0x108], rcx
14585dde2:     	lea	rax, [rip + 0x17cce7d]  # 0x14702ac66
14585dde9:     	mov	qword ptr [rbp + 0x110], rax
14585ddf0:     	mov	qword ptr [rbp + 0x118], 0x5
14585ddfb:     	lea	rax, [rbp + 0x38]
14585ddff:     	mov	qword ptr [rbp + 0x120], rax
14585de06:     	lea	rax, [rip + 0x17aede3]  # 0x14700cbf0
14585de0d:     	mov	qword ptr [rbp + 0x128], rax
14585de14:     	mov	qword ptr [rsp + 0x20], 0x4
14585de1d:     	lea	rcx, [rbp + 0x90]
14585de24:     	lea	r9, [rbp + 0xb0]
14585de2b:     	mov	rdx, rsi
14585de2e:     	call	0x1458e0370 <.text+0x58df370>
14585de33:     	nop
14585de34:     	jmp	0x14585ec46 <.text+0x585dc46>
14585de39:     	lea	rsi, [rip + 0x17cd412]  # 0x14702b252
14585de40:     	mov	ebx, 0x11
14585de45:     	mov	edx, 0x11
14585de4a:     	mov	rcx, rsi
14585de4d:     	call	0x1458dff90 <.text+0x58def90>
14585de52:     	nop
14585de53:     	mov	r8, rdx
14585de56:     	test	rax, rax
14585de59:     	cmovne	rsi, rax
14585de5d:     	cmove	r8, rbx
14585de61:     	lea	rax, [rip + 0x17aed28]  # 0x14700cb90
14585de68:     	mov	qword ptr [rbp + 0xb0], rax
14585de6f:     	mov	qword ptr [rbp + 0xb8], 0x1
14585de7a:     	lea	rax, [rbp + 0x1dc]
14585de81:     	mov	qword ptr [rbp + 0xc0], rax
14585de88:     	lea	rax, [rip + 0x17aed89]  # 0x14700cc18
14585de8f:     	mov	qword ptr [rbp + 0xc8], rax
14585de96:     	mov	qword ptr [rsp + 0x20], 0x1
14585de9f:     	lea	rcx, [rbp + 0x1c0]
14585dea6:     	lea	r9, [rbp + 0xb0]
14585dead:     	mov	rdx, rsi
14585deb0:     	call	0x1458e0370 <.text+0x58df370>
14585deb5:     	nop
14585deb6:     	jmp	0x14585eb29 <.text+0x585db29>
14585debb:     	lea	rbx, [rip + 0x17cd3eb]  # 0x14702b2ad
14585dec2:     	mov	edx, 0x2c
14585dec7:     	mov	rcx, rbx
14585deca:     	call	0x1458dff90 <.text+0x58def90>
14585decf:     	nop
14585ded0:     	mov	r13, rax
14585ded3:     	mov	rsi, rdx
14585ded6:     	mov	edx, dword ptr [rbp + 0x1dc]
14585dedc:     	lea	r14, [rbp + 0x1e0]
14585dee3:     	mov	rcx, r14
14585dee6:     	xor	r8d, r8d
14585dee9:     	call	0x14586a870 <.text+0x5869870>
14585deee:     	nop
14585deef:     	test	r13, r13
14585def2:     	mov	eax, 0x2c
14585def7:     	cmove	rsi, rax
14585defb:     	cmovne	rbx, r13
14585deff:     	lea	rax, [rip + 0x17ccd51]  # 0x14702ac57
14585df06:     	mov	qword ptr [rbp + 0xb0], rax
14585df0d:     	mov	qword ptr [rbp + 0xb8], 0x7
14585df18:     	mov	qword ptr [rbp + 0xc0], r14
14585df1f:     	lea	rcx, [rip + 0x17aec4a]  # 0x14700cb70
14585df26:     	mov	qword ptr [rbp + 0xc8], rcx
14585df2d:     	lea	rax, [rip + 0x17ccd2a]  # 0x14702ac5e
14585df34:     	mov	qword ptr [rbp + 0xd0], rax
14585df3b:     	mov	qword ptr [rbp + 0xd8], 0x5
14585df46:     	lea	rax, [rbp + 0x18]
14585df4a:     	mov	qword ptr [rbp + 0xe0], rax
14585df51:     	mov	qword ptr [rbp + 0xe8], rcx
14585df58:     	lea	rax, [rip + 0x17ccd04]  # 0x14702ac63
14585df5f:     	mov	qword ptr [rbp + 0xf0], rax
14585df66:     	mov	qword ptr [rbp + 0xf8], 0x3
14585df71:     	mov	qword ptr [rbp + 0x100], r15
14585df78:     	mov	qword ptr [rbp + 0x108], rcx
14585df7f:     	mov	qword ptr [rsp + 0x20], 0x3
14585df88:     	lea	rcx, [rbp + 0x78]
14585df8c:     	lea	r9, [rbp + 0xb0]
14585df93:     	mov	rdx, rbx
14585df96:     	mov	r8, rsi
14585df99:     	call	0x1458e0370 <.text+0x58df370>
14585df9e:     	nop
14585df9f:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585dfa6:     	test	rdx, rdx
14585dfa9:     	je	0x14585dfbe <.text+0x585cfbe>
14585dfab:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585dfb2:     	mov	r8d, 0x1
14585dfb8:     	call	0x1400021d0 <.text+0x11d0>
14585dfbd:     	nop
14585dfbe:     	lea	rbx, [rip + 0x17cd342]  # 0x14702b307
14585dfc5:     	mov	edx, 0x62
14585dfca:     	mov	rcx, rbx
14585dfcd:     	call	0x1458dff90 <.text+0x58def90>
14585dfd2:     	nop
14585dfd3:     	mov	r14, rax
14585dfd6:     	mov	rsi, rdx
14585dfd9:     	lea	r15, [rbp + 0x1e0]
14585dfe0:     	mov	rcx, r15
14585dfe3:     	movaps	xmm1, xmm7
14585dfe6:     	call	0x1458627d0 <.text+0x58617d0>
14585dfeb:     	nop
14585dfec:     	test	r14, r14
14585dfef:     	mov	eax, 0x62
14585dff4:     	cmove	rsi, rax
14585dff8:     	cmovne	rbx, r14
14585dffc:     	lea	rax, [rip + 0x17ccf3d]  # 0x14702af40
14585e003:     	mov	qword ptr [rbp + 0xb0], rax
14585e00a:     	mov	qword ptr [rbp + 0xb8], 0x3
14585e015:     	mov	qword ptr [rbp + 0xc0], r15
14585e01c:     	lea	rcx, [rip + 0x17aeb4d]  # 0x14700cb70
14585e023:     	mov	qword ptr [rbp + 0xc8], rcx
14585e02a:     	lea	rax, [rip + 0x17ccf0a]  # 0x14702af3b
14585e031:     	mov	qword ptr [rbp + 0xd0], rax
14585e038:     	mov	qword ptr [rbp + 0xd8], 0x5
14585e043:     	mov	qword ptr [rbp + 0xe0], r12
14585e04a:     	mov	qword ptr [rbp + 0xe8], rcx
14585e051:     	lea	rax, [rip + 0x17cd311]  # 0x14702b369
14585e058:     	mov	qword ptr [rbp + 0xf0], rax
14585e05f:     	mov	qword ptr [rbp + 0xf8], 0x4
14585e06a:     	lea	rax, [rbp + 0x78]
14585e06e:     	mov	qword ptr [rbp + 0x100], rax
14585e075:     	mov	qword ptr [rbp + 0x108], rcx
14585e07c:     	mov	qword ptr [rsp + 0x20], 0x3
14585e085:     	lea	rcx, [rbp + 0x1c0]
14585e08c:     	lea	r9, [rbp + 0xb0]
14585e093:     	mov	rdx, rbx
14585e096:     	mov	r8, rsi
14585e099:     	call	0x1458e0370 <.text+0x58df370>
14585e09e:     	nop
14585e09f:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585e0a6:     	test	rdx, rdx
14585e0a9:     	je	0x14585e0bd <.text+0x585d0bd>
14585e0ab:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585e0b2:     	mov	r8d, 0x1
14585e0b8:     	call	0x1400021d0 <.text+0x11d0>
14585e0bd:     	movss	xmm0, dword ptr [rdi + 0x50]
14585e0c2:     	xorps	xmm1, xmm1
14585e0c5:     	ucomiss	xmm0, xmm1
14585e0c8:     	jbe	0x14585e0e8 <.text+0x585d0e8>
14585e0ca:     	mov	rax, qword ptr [rbp + 0x1d0]
14585e0d1:     	mov	qword ptr [rbp + 0xa0], rax
14585e0d8:     	movups	xmm0, xmmword ptr [rbp + 0x1c0]
14585e0df:     	movaps	xmmword ptr [rbp + 0x90], xmm0
14585e0e6:     	jmp	0x14585e151 <.text+0x585d151>
14585e0e8:     	movups	xmm0, xmmword ptr [rbp + 0x1c0]
14585e0ef:     	movaps	xmmword ptr [rbp + 0xb0], xmm0
14585e0f6:     	mov	rsi, qword ptr [rbp + 0x1d0]
14585e0fd:     	mov	qword ptr [rbp + 0xc0], rsi
14585e104:     	mov	r14, qword ptr [rbp + 0x38]
14585e108:     	mov	rbx, qword ptr [rbp + 0x40]
14585e10c:     	mov	rax, qword ptr [rbp + 0xb0]
14585e113:     	sub	rax, rsi
14585e116:     	cmp	rbx, rax
14585e119:     	ja	0x14585fa86 <.text+0x585ea86>
14585e11f:     	test	rbx, rbx
14585e122:     	je	0x14585e139 <.text+0x585d139>
14585e124:     	mov	rcx, qword ptr [rbp + 0xb8]
14585e12b:     	add	rcx, rsi
14585e12e:     	mov	rdx, r14
14585e131:     	mov	r8, rbx
14585e134:     	call	0x145d145fb <.text+0x5d135fb>
14585e139:     	add	rsi, rbx
14585e13c:     	movaps	xmm0, xmmword ptr [rbp + 0xb0]
14585e143:     	movaps	xmmword ptr [rbp + 0x90], xmm0
14585e14a:     	mov	qword ptr [rbp + 0xa0], rsi
14585e151:     	mov	rdx, qword ptr [rbp + 0x78]
14585e155:     	test	rdx, rdx
14585e158:     	je	0x14585e16c <.text+0x585d16c>
14585e15a:     	mov	rcx, qword ptr [rbp + 0x80]
14585e161:     	mov	r8d, 0x1
14585e167:     	call	0x1400021d0 <.text+0x11d0>
14585e16c:     	mov	rdx, qword ptr [rbp + 0x60]
14585e170:     	test	rdx, rdx
14585e173:     	je	0x14585ec46 <.text+0x585dc46>
14585e179:     	mov	rcx, qword ptr [rbp + 0x68]
14585e17d:     	jmp	0x14585ec3b <.text+0x585dc3b>
14585e182:     	lea	rsi, [rip + 0x17ccece]  # 0x14702b057
14585e189:     	mov	ebx, 0x1f
14585e18e:     	mov	edx, 0x1f
14585e193:     	mov	rcx, rsi
14585e196:     	call	0x1458dff90 <.text+0x58def90>
14585e19b:     	nop
14585e19c:     	test	rax, rax
14585e19f:     	cmovne	rsi, rax
14585e1a3:     	cmove	rdx, rbx
14585e1a7:     	test	rdx, rdx
14585e1aa:     	mov	r12, rdx
14585e1ad:     	jns	0x14585e3a8 <.text+0x585d3a8>
14585e1b3:     	xor	ebx, ebx
14585e1b5:     	mov	rcx, rbx
14585e1b8:     	mov	rdx, r12
14585e1bb:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14585e1c0:     	nop
14585e1c1:     	jmp	0x14585fad6 <.text+0x585ead6>
14585e1c6:     	je	0x14585eb0f <.text+0x585db0f>
14585e1cc:     	call	0x140002200 <.text+0x1200>
14585e1d1:     	mov	edx, 0x1
14585e1d6:     	mov	rcx, rbx
14585e1d9:     	call	0x1400021c0 <.text+0x11c0>
14585e1de:     	mov	ecx, 0x1
14585e1e3:     	test	rax, rax
14585e1e6:     	je	0x14585d1b8 <.text+0x585c1b8>
14585e1ec:     	mov	rcx, rax
14585e1ef:     	mov	rdx, rsi
14585e1f2:     	mov	r8, rbx
14585e1f5:     	mov	rsi, rax
14585e1f8:     	call	0x145d145fb <.text+0x5d135fb>
14585e1fd:     	mov	rax, rsi
14585e200:     	jmp	0x14585eb14 <.text+0x585db14>
14585e205:     	lea	rbx, [rip + 0x17cc9db]  # 0x14702abe7
14585e20c:     	mov	esi, 0x35
14585e211:     	mov	edx, 0x35
14585e216:     	mov	rcx, rbx
14585e219:     	call	0x1458dff90 <.text+0x58def90>
14585e21e:     	nop
14585e21f:     	test	rax, rax
14585e222:     	cmovne	rbx, rax
14585e226:     	cmove	rdx, rsi
14585e22a:     	mov	qword ptr [rbp + 0x1c0], rbx
14585e231:     	mov	qword ptr [rbp + 0x1c8], rdx
14585e238:     	cmp	dword ptr [rbp + 0x1dc], 0x1
14585e23f:     	ja	0x14585cc09 <.text+0x585bc09>
14585e245:     	lea	r12, [rip + 0x17cc9d0]  # 0x14702ac1c
14585e24c:     	mov	edx, 0x3b
14585e251:     	mov	rcx, r12
14585e254:     	call	0x1458dff90 <.text+0x58def90>
14585e259:     	nop
14585e25a:     	mov	rsi, rax
14585e25d:     	mov	rbx, rdx
14585e260:     	mov	edx, dword ptr [rbp + 0x1dc]
14585e266:     	lea	r14, [rbp + 0x1e0]
14585e26d:     	mov	rcx, r14
14585e270:     	xor	r8d, r8d
14585e273:     	call	0x14586a870 <.text+0x5869870>
14585e278:     	nop
14585e279:     	test	rsi, rsi
14585e27c:     	mov	eax, 0x3b
14585e281:     	cmove	rbx, rax
14585e285:     	cmovne	r12, rsi
14585e289:     	lea	rax, [rip + 0x17cc9c7]  # 0x14702ac57
14585e290:     	mov	qword ptr [rbp + 0xb0], rax
14585e297:     	mov	qword ptr [rbp + 0xb8], 0x7
14585e2a2:     	mov	qword ptr [rbp + 0xc0], r14
14585e2a9:     	lea	rcx, [rip + 0x17ae8c0]  # 0x14700cb70
14585e2b0:     	mov	qword ptr [rbp + 0xc8], rcx
14585e2b7:     	lea	rax, [rip + 0x17cc9a0]  # 0x14702ac5e
14585e2be:     	mov	qword ptr [rbp + 0xd0], rax
14585e2c5:     	mov	qword ptr [rbp + 0xd8], 0x5
14585e2d0:     	lea	rax, [rbp + 0x18]
14585e2d4:     	mov	qword ptr [rbp + 0xe0], rax
14585e2db:     	mov	qword ptr [rbp + 0xe8], rcx
14585e2e2:     	lea	rax, [rip + 0x17cc97a]  # 0x14702ac63
14585e2e9:     	mov	qword ptr [rbp + 0xf0], rax
14585e2f0:     	mov	qword ptr [rbp + 0xf8], 0x3
14585e2fb:     	mov	qword ptr [rbp + 0x100], r15
14585e302:     	mov	qword ptr [rbp + 0x108], rcx
14585e309:     	lea	rax, [rip + 0x17cc956]  # 0x14702ac66
14585e310:     	mov	qword ptr [rbp + 0x110], rax
14585e317:     	mov	qword ptr [rbp + 0x118], 0x5
14585e322:     	lea	rax, [rbp + 0x38]
14585e326:     	mov	qword ptr [rbp + 0x120], rax
14585e32d:     	lea	rcx, [rip + 0x17ae8bc]  # 0x14700cbf0
14585e334:     	mov	qword ptr [rbp + 0x128], rcx
14585e33b:     	lea	rax, [rip + 0x17cc929]  # 0x14702ac6b
14585e342:     	mov	qword ptr [rbp + 0x130], rax
14585e349:     	mov	qword ptr [rbp + 0x138], 0x4
14585e354:     	lea	rax, [rbp + 0x1c0]
14585e35b:     	mov	qword ptr [rbp + 0x140], rax
14585e362:     	mov	qword ptr [rbp + 0x148], rcx
14585e369:     	mov	qword ptr [rsp + 0x20], 0x5
14585e372:     	lea	rcx, [rbp + 0x90]
14585e379:     	lea	r9, [rbp + 0xb0]
14585e380:     	mov	rdx, r12
14585e383:     	mov	r8, rbx
14585e386:     	call	0x1458e0370 <.text+0x58df370>
14585e38b:     	nop
14585e38c:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585e393:     	test	rdx, rdx
14585e396:     	je	0x14585ec46 <.text+0x585dc46>
14585e39c:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585e3a3:     	jmp	0x14585ec3b <.text+0x585dc3b>
14585e3a8:     	je	0x14585f510 <.text+0x585e510>
14585e3ae:     	call	0x140002200 <.text+0x1200>
14585e3b3:     	mov	ebx, 0x1
14585e3b8:     	mov	edx, 0x1
14585e3bd:     	mov	rcx, r12
14585e3c0:     	call	0x1400021c0 <.text+0x11c0>
14585e3c5:     	test	rax, rax
14585e3c8:     	je	0x14585e1b5 <.text+0x585d1b5>
14585e3ce:     	mov	r13, rax
14585e3d1:     	mov	rcx, rax
14585e3d4:     	mov	rdx, rsi
14585e3d7:     	mov	r8, r12
14585e3da:     	call	0x145d145fb <.text+0x5d135fb>
14585e3df:     	jmp	0x14585f516 <.text+0x585e516>
14585e3e4:     	movss	xmm8, dword ptr [rdi + 0x6c]
14585e3ea:     	lea	r15, [rip + 0x17cd601]  # 0x14702b9f2
14585e3f1:     	mov	edx, 0x3a
14585e3f6:     	mov	rcx, r15
14585e3f9:     	call	0x1458dff90 <.text+0x58def90>
14585e3fe:     	nop
14585e3ff:     	mov	rsi, rax
14585e402:     	mov	r13, rdx
14585e405:     	movss	xmm0, dword ptr [r12 + 0x40]
14585e40c:     	addss	xmm0, dword ptr [rip + 0x681a9c] # 0x145edfeb0
14585e414:     	mulss	xmm7, xmm8
14585e419:     	mulss	xmm0, xmm7
14585e41d:     	mulss	xmm0, dword ptr [rip + 0x681f9b] # 0x145ee03c0
14585e425:     	movss	dword ptr [rbp + 0x1c0], xmm0
14585e42d:     	lea	rax, [rbp + 0x1c0]
14585e434:     	mov	qword ptr [rbp + 0xb0], rax
14585e43b:     	lea	rax, [rip + 0x499cbe]   # 0x145cf8100 <.text+0x5cf7100>
14585e442:     	mov	qword ptr [rbp + 0xb8], rax
14585e449:     	lea	rdx, [rip + 0x17ccf25]  # 0x14702b375
14585e450:     	lea	rbx, [rbp + 0x1e0]
14585e457:     	lea	r8, [rbp + 0xb0]
14585e45e:     	mov	rcx, rbx
14585e461:     	call	0x145ce7350 <.text+0x5ce6350>
14585e466:     	nop
14585e467:     	test	rsi, rsi
14585e46a:     	mov	eax, 0x3a
14585e46f:     	cmove	r13, rax
14585e473:     	cmovne	r15, rsi
14585e477:     	lea	rax, [rip + 0x17cc6c2]  # 0x14702ab40
14585e47e:     	mov	qword ptr [rbp + 0xb0], rax
14585e485:     	mov	qword ptr [rbp + 0xb8], 0x1
14585e490:     	mov	qword ptr [rbp + 0xc0], rbx
14585e497:     	lea	rcx, [rip + 0x17ae6d2]  # 0x14700cb70
14585e49e:     	mov	qword ptr [rbp + 0xc8], rcx
14585e4a5:     	lea	rax, [rip + 0x17cca94]  # 0x14702af40
14585e4ac:     	mov	qword ptr [rbp + 0xd0], rax
14585e4b3:     	mov	qword ptr [rbp + 0xd8], 0x3
14585e4be:     	mov	qword ptr [rbp + 0xe0], r14
14585e4c5:     	mov	qword ptr [rbp + 0xe8], rcx
14585e4cc:     	lea	rax, [rip + 0x17cd559]  # 0x14702ba2c
14585e4d3:     	mov	qword ptr [rbp + 0xf0], rax
14585e4da:     	mov	qword ptr [rbp + 0xf8], 0x8
14585e4e5:     	lea	rax, [rbp + 0x48]
14585e4e9:     	mov	qword ptr [rbp + 0x100], rax
14585e4f0:     	lea	rax, [rip + 0x17ae6f9]  # 0x14700cbf0
14585e4f7:     	mov	qword ptr [rbp + 0x108], rax
14585e4fe:     	mov	qword ptr [rsp + 0x20], 0x3
14585e507:     	lea	rcx, [rbp + 0x90]
14585e50e:     	lea	r9, [rbp + 0xb0]
14585e515:     	mov	rdx, r15
14585e518:     	mov	r8, r13
14585e51b:     	call	0x1458e0370 <.text+0x58df370>
14585e520:     	nop
14585e521:     	jmp	0x14585e773 <.text+0x585d773>
14585e526:     	movss	xmm8, dword ptr [rdi + 0x6c]
14585e52c:     	lea	r15, [rip + 0x17cd501]  # 0x14702ba34
14585e533:     	mov	edx, 0x3b
14585e538:     	mov	rcx, r15
14585e53b:     	call	0x1458dff90 <.text+0x58def90>
14585e540:     	nop
14585e541:     	mov	rsi, rax
14585e544:     	mov	r13, rdx
14585e547:     	movss	xmm0, dword ptr [r12 + 0x40]
14585e54e:     	addss	xmm0, dword ptr [rip + 0x68195a] # 0x145edfeb0
14585e556:     	mulss	xmm7, xmm8
14585e55b:     	mulss	xmm0, xmm7
14585e55f:     	mulss	xmm0, dword ptr [rip + 0x681e59] # 0x145ee03c0
14585e567:     	movss	dword ptr [rbp + 0x1c0], xmm0
14585e56f:     	lea	rax, [rbp + 0x1c0]
14585e576:     	mov	qword ptr [rbp + 0xb0], rax
14585e57d:     	lea	rax, [rip + 0x499b7c]   # 0x145cf8100 <.text+0x5cf7100>
14585e584:     	mov	qword ptr [rbp + 0xb8], rax
14585e58b:     	lea	rdx, [rip + 0x17ccde3]  # 0x14702b375
14585e592:     	lea	rbx, [rbp + 0x1e0]
14585e599:     	lea	r8, [rbp + 0xb0]
14585e5a0:     	mov	rcx, rbx
14585e5a3:     	call	0x145ce7350 <.text+0x5ce6350>
14585e5a8:     	nop
14585e5a9:     	test	rsi, rsi
14585e5ac:     	mov	eax, 0x3b
14585e5b1:     	cmove	r13, rax
14585e5b5:     	cmovne	r15, rsi
14585e5b9:     	lea	rax, [rip + 0x17cc580]  # 0x14702ab40
14585e5c0:     	mov	qword ptr [rbp + 0xb0], rax
14585e5c7:     	mov	qword ptr [rbp + 0xb8], 0x1
14585e5d2:     	mov	qword ptr [rbp + 0xc0], rbx
14585e5d9:     	lea	rcx, [rip + 0x17ae590]  # 0x14700cb70
14585e5e0:     	mov	qword ptr [rbp + 0xc8], rcx
14585e5e7:     	lea	rax, [rip + 0x17cc952]  # 0x14702af40
14585e5ee:     	mov	qword ptr [rbp + 0xd0], rax
14585e5f5:     	mov	qword ptr [rbp + 0xd8], 0x3
14585e600:     	mov	qword ptr [rbp + 0xe0], r14
14585e607:     	mov	qword ptr [rbp + 0xe8], rcx
14585e60e:     	lea	rax, [rip + 0x17cd417]  # 0x14702ba2c
14585e615:     	mov	qword ptr [rbp + 0xf0], rax
14585e61c:     	mov	qword ptr [rbp + 0xf8], 0x8
14585e627:     	lea	rax, [rbp + 0x48]
14585e62b:     	mov	qword ptr [rbp + 0x100], rax
14585e632:     	lea	rax, [rip + 0x17ae5b7]  # 0x14700cbf0
14585e639:     	mov	qword ptr [rbp + 0x108], rax
14585e640:     	mov	qword ptr [rsp + 0x20], 0x3
14585e649:     	lea	rcx, [rbp + 0x90]
14585e650:     	lea	r9, [rbp + 0xb0]
14585e657:     	mov	rdx, r15
14585e65a:     	mov	r8, r13
14585e65d:     	call	0x1458e0370 <.text+0x58df370>
14585e662:     	nop
14585e663:     	jmp	0x14585e773 <.text+0x585d773>
14585e668:     	movss	xmm8, dword ptr [rdi + 0x6c]
14585e66e:     	lea	r15, [rip + 0x17cd3fa]  # 0x14702ba6f
14585e675:     	mov	edx, 0x6f
14585e67a:     	mov	rcx, r15
14585e67d:     	call	0x1458dff90 <.text+0x58def90>
14585e682:     	nop
14585e683:     	mov	rsi, rax
14585e686:     	mov	rbx, rdx
14585e689:     	movss	xmm0, dword ptr [r12 + 0x40]
14585e690:     	addss	xmm0, dword ptr [rip + 0x681818] # 0x145edfeb0
14585e698:     	mulss	xmm7, xmm8
14585e69d:     	mulss	xmm0, xmm7
14585e6a1:     	mulss	xmm0, dword ptr [rip + 0x681d17] # 0x145ee03c0
14585e6a9:     	movss	dword ptr [rbp + 0x1c0], xmm0
14585e6b1:     	lea	rax, [rbp + 0x1c0]
14585e6b8:     	mov	qword ptr [rbp + 0xb0], rax
14585e6bf:     	lea	rax, [rip + 0x499a3a]   # 0x145cf8100 <.text+0x5cf7100>
14585e6c6:     	mov	qword ptr [rbp + 0xb8], rax
14585e6cd:     	lea	rdx, [rip + 0x17ccca1]  # 0x14702b375
14585e6d4:     	lea	r12, [rbp + 0x1e0]
14585e6db:     	lea	r8, [rbp + 0xb0]
14585e6e2:     	mov	rcx, r12
14585e6e5:     	call	0x145ce7350 <.text+0x5ce6350>
14585e6ea:     	nop
14585e6eb:     	test	rsi, rsi
14585e6ee:     	mov	eax, 0x6f
14585e6f3:     	cmove	rbx, rax
14585e6f7:     	cmovne	r15, rsi
14585e6fb:     	lea	rax, [rip + 0x17ccedc]  # 0x14702b5de
14585e702:     	mov	qword ptr [rbp + 0xb0], rax
14585e709:     	mov	qword ptr [rbp + 0xb8], 0x1
14585e714:     	mov	qword ptr [rbp + 0xc0], r12
14585e71b:     	lea	rcx, [rip + 0x17ae44e]  # 0x14700cb70
14585e722:     	mov	qword ptr [rbp + 0xc8], rcx
14585e729:     	lea	rax, [rip + 0x17cc810]  # 0x14702af40
14585e730:     	mov	qword ptr [rbp + 0xd0], rax
14585e737:     	mov	qword ptr [rbp + 0xd8], 0x3
14585e742:     	mov	qword ptr [rbp + 0xe0], r14
14585e749:     	mov	qword ptr [rbp + 0xe8], rcx
14585e750:     	mov	qword ptr [rsp + 0x20], 0x2
14585e759:     	lea	rcx, [rbp + 0x90]
14585e760:     	lea	r9, [rbp + 0xb0]
14585e767:     	mov	rdx, r15
14585e76a:     	mov	r8, rbx
14585e76d:     	call	0x1458e0370 <.text+0x58df370>
14585e772:     	nop
14585e773:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585e77a:     	test	rdx, rdx
14585e77d:     	je	0x14585e16c <.text+0x585d16c>
14585e783:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585e78a:     	jmp	0x14585e161 <.text+0x585d161>
14585e78f:     	mulss	xmm7, dword ptr [rdi + 0x6c]
14585e794:     	lea	r14, [rip + 0x17cd1ed]  # 0x14702b988
14585e79b:     	mov	esi, 0x6a
14585e7a0:     	mov	edx, 0x6a
14585e7a5:     	mov	rcx, r14
14585e7a8:     	call	0x1458dff90 <.text+0x58def90>
14585e7ad:     	nop
14585e7ae:     	mov	r15, rdx
14585e7b1:     	test	rax, rax
14585e7b4:     	cmovne	r14, rax
14585e7b8:     	cmove	r15, rsi
14585e7bc:     	movaps	xmm1, xmm6
14585e7bf:     	mulss	xmm1, xmm7
14585e7c3:     	mulss	xmm11, xmm10
14585e7c8:     	sqrtss	xmm8, xmm11
14585e7cd:     	mulss	xmm8, dword ptr [rip + 0x681dc6] # 0x145ee059c
14585e7d6:     	mulss	xmm1, xmm8
14585e7db:     	movss	xmm9, dword ptr [r12 + 0x40]
14585e7e2:     	addss	xmm9, dword ptr [rip + 0x6816c5] # 0x145edfeb0
14585e7eb:     	mulss	xmm1, xmm9
14585e7f0:     	lea	rsi, [rbp + 0x1c0]
14585e7f7:     	mov	rcx, rsi
14585e7fa:     	call	0x1458627d0 <.text+0x58617d0>
14585e7ff:     	nop
14585e800:     	mulss	xmm8, xmm7
14585e805:     	mulss	xmm8, xmm9
14585e80a:     	mulss	xmm8, dword ptr [rip + 0x681bad] # 0x145ee03c0
14585e813:     	movss	dword ptr [rbp + 0x78], xmm8
14585e819:     	lea	rax, [rbp + 0x78]
14585e81d:     	mov	qword ptr [rbp + 0xb0], rax
14585e824:     	lea	rax, [rip + 0x4998d5]   # 0x145cf8100 <.text+0x5cf7100>
14585e82b:     	mov	qword ptr [rbp + 0xb8], rax
14585e832:     	lea	rdx, [rip + 0x17ccb3c]  # 0x14702b375
14585e839:     	lea	rbx, [rbp + 0x1e0]
14585e840:     	lea	r8, [rbp + 0xb0]
14585e847:     	mov	rcx, rbx
14585e84a:     	call	0x145ce7350 <.text+0x5ce6350>
14585e84f:     	nop
14585e850:     	lea	rax, [rip + 0x17cd122]  # 0x14702b979
14585e857:     	mov	qword ptr [rbp + 0xb0], rax
14585e85e:     	mov	qword ptr [rbp + 0xb8], 0x6
14585e869:     	mov	qword ptr [rbp + 0xc0], rsi
14585e870:     	lea	rcx, [rip + 0x17ae2f9]  # 0x14700cb70
14585e877:     	mov	qword ptr [rbp + 0xc8], rcx
14585e87e:     	lea	rax, [rip + 0x17cd0fa]  # 0x14702b97f
14585e885:     	mov	qword ptr [rbp + 0xd0], rax
14585e88c:     	mov	qword ptr [rbp + 0xd8], 0x5
14585e897:     	mov	qword ptr [rbp + 0xe0], rbx
14585e89e:     	mov	qword ptr [rbp + 0xe8], rcx
14585e8a5:     	mov	qword ptr [rsp + 0x20], 0x2
14585e8ae:     	lea	rcx, [rbp + 0x90]
14585e8b5:     	lea	r9, [rbp + 0xb0]
14585e8bc:     	mov	rdx, r14
14585e8bf:     	mov	r8, r15
14585e8c2:     	call	0x1458e0370 <.text+0x58df370>
14585e8c7:     	nop
14585e8c8:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585e8cf:     	test	rdx, rdx
14585e8d2:     	je	0x14585e8e6 <.text+0x585d8e6>
14585e8d4:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585e8db:     	mov	r8d, 0x1
14585e8e1:     	call	0x1400021d0 <.text+0x11d0>
14585e8e6:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585e8ed:     	test	rdx, rdx
14585e8f0:     	je	0x14585e16c <.text+0x585d16c>
14585e8f6:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585e8fd:     	jmp	0x14585e161 <.text+0x585d161>
14585e902:     	movss	xmm9, dword ptr [rdi + 0x6c]
14585e908:     	cmp	eax, 0x6
14585e90b:     	je	0x14585f71d <.text+0x585e71d>
14585e911:     	cmp	eax, 0xc
14585e914:     	je	0x14585f6a2 <.text+0x585e6a2>
14585e91a:     	cmp	eax, 0xd
14585e91d:     	jne	0x14585cf58 <.text+0x585bf58>
14585e923:     	lea	r15, [rip + 0x17cd206]  # 0x14702bb30
14585e92a:     	mov	edx, 0x47
14585e92f:     	mov	rcx, r15
14585e932:     	call	0x1458dff90 <.text+0x58def90>
14585e937:     	nop
14585e938:     	mov	rsi, rax
14585e93b:     	mov	rbx, rdx
14585e93e:     	mulss	xmm11, xmm9
14585e943:     	mulss	xmm10, xmm11
14585e948:     	movss	xmm0, dword ptr [r12 + 0x40]
14585e94f:     	addss	xmm0, dword ptr [rip + 0x681559] # 0x145edfeb0
14585e957:     	mulss	xmm0, xmm10
14585e95c:     	mulss	xmm8, xmm0
14585e961:     	lea	r12, [rbp + 0x1e0]
14585e968:     	mov	rcx, r12
14585e96b:     	movaps	xmm1, xmm8
14585e96f:     	call	0x1458627d0 <.text+0x58617d0>
14585e974:     	nop
14585e975:     	test	rsi, rsi
14585e978:     	mov	eax, 0x47
14585e97d:     	cmove	rbx, rax
14585e981:     	cmovne	r15, rsi
14585e985:     	lea	rax, [rip + 0x17cc5b4]  # 0x14702af40
14585e98c:     	mov	qword ptr [rbp + 0xb0], rax
14585e993:     	mov	qword ptr [rbp + 0xb8], 0x3
14585e99e:     	mov	qword ptr [rbp + 0xc0], r14
14585e9a5:     	lea	rcx, [rip + 0x17ae1c4]  # 0x14700cb70
14585e9ac:     	mov	qword ptr [rbp + 0xc8], rcx
14585e9b3:     	lea	rax, [rip + 0x17ae1d6]  # 0x14700cb90
14585e9ba:     	mov	qword ptr [rbp + 0xd0], rax
14585e9c1:     	mov	qword ptr [rbp + 0xd8], 0x1
14585e9cc:     	mov	qword ptr [rbp + 0xe0], r12
14585e9d3:     	mov	qword ptr [rbp + 0xe8], rcx
14585e9da:     	lea	rax, [rip + 0x17cd04b]  # 0x14702ba2c
14585e9e1:     	mov	qword ptr [rbp + 0xf0], rax
14585e9e8:     	mov	qword ptr [rbp + 0xf8], 0x8
14585e9f3:     	lea	rax, [rbp + 0x48]
14585e9f7:     	mov	qword ptr [rbp + 0x100], rax
14585e9fe:     	lea	rax, [rip + 0x17ae1eb]  # 0x14700cbf0
14585ea05:     	mov	qword ptr [rbp + 0x108], rax
14585ea0c:     	mov	qword ptr [rsp + 0x20], 0x3
14585ea15:     	lea	rcx, [rbp + 0x90]
14585ea1c:     	lea	r9, [rbp + 0xb0]
14585ea23:     	mov	rdx, r15
14585ea26:     	mov	r8, rbx
14585ea29:     	call	0x1458e0370 <.text+0x58df370>
14585ea2e:     	nop
14585ea2f:     	jmp	0x14585e773 <.text+0x585d773>
14585ea34:     	lea	rsi, [rip + 0x17cc322]  # 0x14702ad5d
14585ea3b:     	mov	ebx, 0xaf
14585ea40:     	mov	edx, 0xaf
14585ea45:     	mov	rcx, rsi
14585ea48:     	call	0x1458dff90 <.text+0x58def90>
14585ea4d:     	nop
14585ea4e:     	mov	r8, rdx
14585ea51:     	test	rax, rax
14585ea54:     	cmovne	rsi, rax
14585ea58:     	cmove	r8, rbx
14585ea5c:     	lea	rax, [rip + 0x17ae12d]  # 0x14700cb90
14585ea63:     	mov	qword ptr [rbp + 0xb0], rax
14585ea6a:     	mov	qword ptr [rbp + 0xb8], 0x1
14585ea75:     	lea	rax, [rbp + 0x1dc]
14585ea7c:     	mov	qword ptr [rbp + 0xc0], rax
14585ea83:     	lea	rax, [rip + 0x17ae18e]  # 0x14700cc18
14585ea8a:     	mov	qword ptr [rbp + 0xc8], rax
14585ea91:     	lea	rax, [rip + 0x17cc1c6]  # 0x14702ac5e
14585ea98:     	mov	qword ptr [rbp + 0xd0], rax
14585ea9f:     	mov	qword ptr [rbp + 0xd8], 0x5
14585eaaa:     	lea	rax, [rbp + 0x18]
14585eaae:     	mov	qword ptr [rbp + 0xe0], rax
14585eab5:     	lea	rcx, [rip + 0x17ae0b4]  # 0x14700cb70
14585eabc:     	mov	qword ptr [rbp + 0xe8], rcx
14585eac3:     	lea	rax, [rip + 0x17cc199]  # 0x14702ac63
14585eaca:     	mov	qword ptr [rbp + 0xf0], rax
14585ead1:     	mov	qword ptr [rbp + 0xf8], 0x3
14585eadc:     	mov	qword ptr [rbp + 0x100], r15
14585eae3:     	mov	qword ptr [rbp + 0x108], rcx
14585eaea:     	mov	qword ptr [rsp + 0x20], 0x3
14585eaf3:     	lea	rcx, [rbp + 0x90]
14585eafa:     	lea	r9, [rbp + 0xb0]
14585eb01:     	mov	rdx, rsi
14585eb04:     	call	0x1458e0370 <.text+0x58df370>
14585eb09:     	nop
14585eb0a:     	jmp	0x14585ec46 <.text+0x585dc46>
14585eb0f:     	mov	eax, 0x1
14585eb14:     	mov	qword ptr [rbp + 0x1c0], rbx
14585eb1b:     	mov	qword ptr [rbp + 0x1c8], rax
14585eb22:     	mov	qword ptr [rbp + 0x1d0], rbx
14585eb29:     	addss	xmm7, xmm7
14585eb2d:     	lea	rsi, [rbp + 0x1e0]
14585eb34:     	mov	rcx, rsi
14585eb37:     	movaps	xmm1, xmm7
14585eb3a:     	call	0x1458627d0 <.text+0x58617d0>
14585eb3f:     	nop
14585eb40:     	lea	rax, [rip + 0x17cc71c]  # 0x14702b263
14585eb47:     	mov	qword ptr [rbp + 0xb0], rax
14585eb4e:     	mov	qword ptr [rbp + 0xb8], 0x7
14585eb59:     	lea	rax, [rbp + 0x1c0]
14585eb60:     	mov	qword ptr [rbp + 0xc0], rax
14585eb67:     	lea	rcx, [rip + 0x17ae002]  # 0x14700cb70
14585eb6e:     	mov	qword ptr [rbp + 0xc8], rcx
14585eb75:     	lea	rax, [rip + 0x17cc0e2]  # 0x14702ac5e
14585eb7c:     	mov	qword ptr [rbp + 0xd0], rax
14585eb83:     	mov	qword ptr [rbp + 0xd8], 0x5
14585eb8e:     	lea	rax, [rbp + 0x18]
14585eb92:     	mov	qword ptr [rbp + 0xe0], rax
14585eb99:     	mov	qword ptr [rbp + 0xe8], rcx
14585eba0:     	lea	rax, [rip + 0x17cc0bc]  # 0x14702ac63
14585eba7:     	mov	qword ptr [rbp + 0xf0], rax
14585ebae:     	mov	qword ptr [rbp + 0xf8], 0x3
14585ebb9:     	mov	qword ptr [rbp + 0x100], r15
14585ebc0:     	mov	qword ptr [rbp + 0x108], rcx
14585ebc7:     	mov	qword ptr [rbp + 0x110], r14
14585ebce:     	mov	qword ptr [rbp + 0x118], 0x3
14585ebd9:     	mov	qword ptr [rbp + 0x120], rsi
14585ebe0:     	mov	qword ptr [rbp + 0x128], rcx
14585ebe7:     	mov	qword ptr [rsp + 0x20], 0x4
14585ebf0:     	lea	rcx, [rbp + 0x90]
14585ebf7:     	lea	r9, [rbp + 0xb0]
14585ebfe:     	mov	rdx, r12
14585ec01:     	mov	r8, r13
14585ec04:     	call	0x1458e0370 <.text+0x58df370>
14585ec09:     	nop
14585ec0a:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585ec11:     	test	rdx, rdx
14585ec14:     	je	0x14585ec28 <.text+0x585dc28>
14585ec16:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585ec1d:     	mov	r8d, 0x1
14585ec23:     	call	0x1400021d0 <.text+0x11d0>
14585ec28:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585ec2f:     	test	rdx, rdx
14585ec32:     	je	0x14585ec46 <.text+0x585dc46>
14585ec34:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585ec3b:     	mov	r8d, 0x1
14585ec41:     	call	0x1400021d0 <.text+0x11d0>
14585ec46:     	movzx	eax, byte ptr [rdi + 0x75]
14585ec4a:     	or	eax, 0x2
14585ec4d:     	cmp	eax, 0xb
14585ec50:     	jne	0x14585ed11 <.text+0x585dd11>
14585ec56:     	mov	rax, qword ptr [rbp + 0xa0]
14585ec5d:     	mov	rcx, qword ptr [rbp + 0x8]
14585ec61:     	mov	qword ptr [rcx + 0x10], rax
14585ec65:     	movaps	xmm0, xmmword ptr [rbp + 0x90]
14585ec6c:     	movups	xmmword ptr [rcx], xmm0
14585ec6f:     	mov	rdx, qword ptr [rbp - 0x58]
14585ec73:     	test	rdx, rdx
14585ec76:     	je	0x14585ec87 <.text+0x585dc87>
14585ec78:     	mov	rcx, qword ptr [rbp - 0x50]
14585ec7c:     	mov	r8d, 0x1
14585ec82:     	call	0x1400021d0 <.text+0x11d0>
14585ec87:     	mov	rdx, qword ptr [rbp + 0x18]
14585ec8b:     	test	rdx, rdx
14585ec8e:     	je	0x14585ec9f <.text+0x585dc9f>
14585ec90:     	mov	rcx, qword ptr [rbp + 0x20]
14585ec94:     	mov	r8d, 0x1
14585ec9a:     	call	0x1400021d0 <.text+0x11d0>
14585ec9f:     	mov	rdx, qword ptr [rbp - 0x40]
14585eca3:     	test	rdx, rdx
14585eca6:     	je	0x14585ecb7 <.text+0x585dcb7>
14585eca8:     	mov	rcx, qword ptr [rbp - 0x38]
14585ecac:     	mov	r8d, 0x1
14585ecb2:     	call	0x1400021d0 <.text+0x11d0>
14585ecb7:     	movaps	xmm6, xmmword ptr [rbp + 0x200]
14585ecbe:     	movaps	xmm7, xmmword ptr [rbp + 0x210]
14585ecc5:     	movaps	xmm8, xmmword ptr [rbp + 0x220]
14585eccd:     	movaps	xmm9, xmmword ptr [rbp + 0x230]
14585ecd5:     	movaps	xmm10, xmmword ptr [rbp + 0x240]
14585ecdd:     	movaps	xmm11, xmmword ptr [rbp + 0x250]
14585ece5:     	movaps	xmm12, xmmword ptr [rbp + 0x260]
14585eced:     	movaps	xmm13, xmmword ptr [rbp + 0x270]
14585ecf5:     	movaps	xmm14, xmmword ptr [rbp + 0x280]
14585ecfd:     	add	rsp, 0x318
14585ed04:     	pop	rbx
14585ed05:     	pop	rdi
14585ed06:     	pop	rsi
14585ed07:     	pop	r12
14585ed09:     	pop	r13
14585ed0b:     	pop	r14
14585ed0d:     	pop	r15
14585ed0f:     	pop	rbp
14585ed10:     	ret
14585ed11:     	lea	rsi, [rip + 0x17cc8fc]  # 0x14702b614
14585ed18:     	mov	ebx, 0x1f
14585ed1d:     	mov	edx, 0x1f
14585ed22:     	mov	rcx, rsi
14585ed25:     	call	0x1458dff90 <.text+0x58def90>
14585ed2a:     	nop
14585ed2b:     	test	rax, rax
14585ed2e:     	cmovne	rsi, rax
14585ed32:     	cmove	rdx, rbx
14585ed36:     	mov	qword ptr [rbp + 0x60], rsi
14585ed3a:     	mov	qword ptr [rbp + 0x68], rdx
14585ed3e:     	mov	eax, dword ptr [rdi + 0x68]
14585ed41:     	lea	ecx, [rax - 0x1]
14585ed44:     	cmp	ecx, 0xa
14585ed47:     	mov	r8, qword ptr [rbp + 0x1b8]
14585ed4e:     	ja	0x14585f2f4 <.text+0x585e2f4>
14585ed54:     	movss	xmm7, dword ptr [r8 + 0x50]
14585ed5a:     	lea	rdx, [rip + 0x17cd697]  # 0x14702c3f8
14585ed61:     	movsxd	rcx, dword ptr [rdx + 4*rcx]
14585ed65:     	add	rcx, rdx
14585ed68:     	jmp	rcx
14585ed6a:     	movss	xmm7, dword ptr [rdi + 0x6c]
14585ed6f:     	movss	xmm6, dword ptr [rdi + 0x70]
14585ed74:     	mulss	xmm6, dword ptr [r8 + 0x48]
14585ed7a:     	lea	rdi, [rip + 0x17cc8b2]  # 0x14702b633
14585ed81:     	mov	edx, 0x1f
14585ed86:     	mov	rcx, rdi
14585ed89:     	call	0x1458dff90 <.text+0x58def90>
14585ed8e:     	nop
14585ed8f:     	mov	rsi, rax
14585ed92:     	mov	rbx, rdx
14585ed95:     	mulss	xmm7, dword ptr [rip + 0x681623] # 0x145ee03c0
14585ed9d:     	movss	dword ptr [rbp + 0x1e0], xmm7
14585eda5:     	lea	rax, [rbp + 0x1e0]
14585edac:     	mov	qword ptr [rbp + 0xb0], rax
14585edb3:     	lea	rax, [rip + 0x499346]   # 0x145cf8100 <.text+0x5cf7100>
14585edba:     	mov	qword ptr [rbp + 0xb8], rax
14585edc1:     	lea	rdx, [rip + 0x17cc5ad]  # 0x14702b375
14585edc8:     	lea	r14, [rbp + 0x1c0]
14585edcf:     	lea	r8, [rbp + 0xb0]
14585edd6:     	mov	rcx, r14
14585edd9:     	call	0x145ce7350 <.text+0x5ce6350>
14585edde:     	nop
14585eddf:     	lea	r15, [rbp + 0x1e0]
14585ede6:     	mov	rcx, r15
14585ede9:     	movaps	xmm1, xmm6
14585edec:     	call	0x1458627d0 <.text+0x58617d0>
14585edf1:     	nop
14585edf2:     	test	rsi, rsi
14585edf5:     	mov	eax, 0x1f
14585edfa:     	cmove	rbx, rax
14585edfe:     	cmovne	rdi, rsi
14585ee02:     	lea	rax, [rip + 0x17cbd37]  # 0x14702ab40
14585ee09:     	mov	qword ptr [rbp + 0xb0], rax
14585ee10:     	mov	qword ptr [rbp + 0xb8], 0x1
14585ee1b:     	mov	qword ptr [rbp + 0xc0], r14
14585ee22:     	lea	rcx, [rip + 0x17add47]  # 0x14700cb70
14585ee29:     	mov	qword ptr [rbp + 0xc8], rcx
14585ee30:     	lea	rax, [rip + 0x17cc7a7]  # 0x14702b5de
14585ee37:     	mov	qword ptr [rbp + 0xd0], rax
14585ee3e:     	mov	qword ptr [rbp + 0xd8], 0x1
14585ee49:     	mov	qword ptr [rbp + 0xe0], r15
14585ee50:     	mov	qword ptr [rbp + 0xe8], rcx
14585ee57:     	mov	qword ptr [rsp + 0x20], 0x2
14585ee60:     	lea	rcx, [rbp + 0x78]
14585ee64:     	lea	r9, [rbp + 0xb0]
14585ee6b:     	mov	rdx, rdi
14585ee6e:     	mov	r8, rbx
14585ee71:     	call	0x1458e0370 <.text+0x58df370>
14585ee76:     	nop
14585ee77:     	jmp	0x14585f145 <.text+0x585e145>
14585ee7c:     	movss	xmm6, dword ptr [rdi + 0x6c]
14585ee81:     	lea	rsi, [rip + 0x17cc7e6]  # 0x14702b66e
14585ee88:     	mov	edx, 0x1c
14585ee8d:     	mov	rcx, rsi
14585ee90:     	call	0x1458dff90 <.text+0x58def90>
14585ee95:     	nop
14585ee96:     	mov	rbx, rax
14585ee99:     	mov	rdi, rdx
14585ee9c:     	mulss	xmm7, xmm6
14585eea0:     	lea	r14, [rbp + 0x1e0]
14585eea7:     	mov	rcx, r14
14585eeaa:     	movaps	xmm1, xmm7
14585eead:     	call	0x1458627d0 <.text+0x58617d0>
14585eeb2:     	nop
14585eeb3:     	test	rbx, rbx
14585eeb6:     	mov	eax, 0x1c
14585eebb:     	cmove	rdi, rax
14585eebf:     	cmovne	rsi, rbx
14585eec3:     	lea	rax, [rip + 0x17cc714]  # 0x14702b5de
14585eeca:     	mov	qword ptr [rbp + 0xb0], rax
14585eed1:     	mov	qword ptr [rbp + 0xb8], 0x1
14585eedc:     	mov	qword ptr [rbp + 0xc0], r14
14585eee3:     	lea	rax, [rip + 0x17adc86]  # 0x14700cb70
14585eeea:     	mov	qword ptr [rbp + 0xc8], rax
14585eef1:     	lea	rax, [rip + 0x17add9d]  # 0x14700cc95
14585eef8:     	mov	qword ptr [rbp + 0xd0], rax
14585eeff:     	mov	qword ptr [rbp + 0xd8], 0x4
14585ef0a:     	lea	rax, [rbp + 0x60]
14585ef0e:     	mov	qword ptr [rbp + 0xe0], rax
14585ef15:     	lea	rax, [rip + 0x17adcd4]  # 0x14700cbf0
14585ef1c:     	mov	qword ptr [rbp + 0xe8], rax
14585ef23:     	mov	qword ptr [rsp + 0x20], 0x2
14585ef2c:     	lea	rcx, [rbp + 0x78]
14585ef30:     	lea	r9, [rbp + 0xb0]
14585ef37:     	mov	rdx, rsi
14585ef3a:     	mov	r8, rdi
14585ef3d:     	call	0x1458e0370 <.text+0x58df370>
14585ef42:     	nop
14585ef43:     	jmp	0x14585f246 <.text+0x585e246>
14585ef48:     	movss	xmm8, dword ptr [rdi + 0x6c]
14585ef4e:     	lea	rdi, [rip + 0x17cc7f7]  # 0x14702b74c
14585ef55:     	mov	edx, 0x51
14585ef5a:     	mov	rcx, rdi
14585ef5d:     	call	0x1458dff90 <.text+0x58def90>
14585ef62:     	nop
14585ef63:     	mov	rsi, rax
14585ef66:     	mov	rbx, rdx
14585ef69:     	mulss	xmm7, xmm8
14585ef6e:     	mulss	xmm6, xmm7
14585ef72:     	lea	r14, [rbp + 0x1c0]
14585ef79:     	mov	rcx, r14
14585ef7c:     	movaps	xmm1, xmm6
14585ef7f:     	call	0x1458627d0 <.text+0x58617d0>
14585ef84:     	nop
14585ef85:     	mulss	xmm6, dword ptr [rip + 0x681273] # 0x145ee0200
14585ef8d:     	lea	r15, [rbp + 0x1e0]
14585ef94:     	mov	rcx, r15
14585ef97:     	movaps	xmm1, xmm6
14585ef9a:     	call	0x1458627d0 <.text+0x58617d0>
14585ef9f:     	nop
14585efa0:     	test	rsi, rsi
14585efa3:     	mov	eax, 0x51
14585efa8:     	cmove	rbx, rax
14585efac:     	cmovne	rdi, rsi
14585efb0:     	lea	rax, [rip + 0x17adbd9]  # 0x14700cb90
14585efb7:     	mov	qword ptr [rbp + 0xb0], rax
14585efbe:     	mov	qword ptr [rbp + 0xb8], 0x1
14585efc9:     	mov	qword ptr [rbp + 0xc0], r14
14585efd0:     	lea	rcx, [rip + 0x17adb99]  # 0x14700cb70
14585efd7:     	mov	qword ptr [rbp + 0xc8], rcx
14585efde:     	lea	rax, [rip + 0x17cc7b8]  # 0x14702b79d
14585efe5:     	mov	qword ptr [rbp + 0xd0], rax
14585efec:     	mov	qword ptr [rbp + 0xd8], 0x3
14585eff7:     	mov	qword ptr [rbp + 0xe0], r15
14585effe:     	mov	qword ptr [rbp + 0xe8], rcx
14585f005:     	mov	qword ptr [rsp + 0x20], 0x2
14585f00e:     	lea	rcx, [rbp + 0x78]
14585f012:     	lea	r9, [rbp + 0xb0]
14585f019:     	mov	rdx, rdi
14585f01c:     	mov	r8, rbx
14585f01f:     	call	0x1458e0370 <.text+0x58df370>
14585f024:     	nop
14585f025:     	jmp	0x14585f145 <.text+0x585e145>
14585f02a:     	movss	xmm8, dword ptr [rdi + 0x6c]
14585f030:     	movss	xmm6, dword ptr [rdi + 0x70]
14585f035:     	mulss	xmm6, dword ptr [r8 + 0x48]
14585f03b:     	lea	rdi, [rip + 0x17cc75e]  # 0x14702b7a0
14585f042:     	mov	edx, 0x2e
14585f047:     	mov	rcx, rdi
14585f04a:     	call	0x1458dff90 <.text+0x58def90>
14585f04f:     	nop
14585f050:     	mov	rsi, rax
14585f053:     	mov	r14, rdx
14585f056:     	mulss	xmm7, xmm8
14585f05b:     	minss	xmm7, dword ptr [rip + 0x691411] # 0x145ef0474
14585f063:     	mulss	xmm7, dword ptr [rip + 0x681355] # 0x145ee03c0
14585f06b:     	movss	dword ptr [rbp + 0x1e0], xmm7
14585f073:     	lea	rax, [rbp + 0x1e0]
14585f07a:     	mov	qword ptr [rbp + 0xb0], rax
14585f081:     	lea	rax, [rip + 0x499078]   # 0x145cf8100 <.text+0x5cf7100>
14585f088:     	mov	qword ptr [rbp + 0xb8], rax
14585f08f:     	lea	rdx, [rip + 0x17cc2df]  # 0x14702b375
14585f096:     	lea	rbx, [rbp + 0x1c0]
14585f09d:     	lea	r8, [rbp + 0xb0]
14585f0a4:     	mov	rcx, rbx
14585f0a7:     	call	0x145ce7350 <.text+0x5ce6350>
14585f0ac:     	nop
14585f0ad:     	lea	r15, [rbp + 0x1e0]
14585f0b4:     	mov	rcx, r15
14585f0b7:     	movaps	xmm1, xmm6
14585f0ba:     	call	0x1458627d0 <.text+0x58617d0>
14585f0bf:     	nop
14585f0c0:     	test	rsi, rsi
14585f0c3:     	mov	eax, 0x2e
14585f0c8:     	cmove	r14, rax
14585f0cc:     	cmovne	rdi, rsi
14585f0d0:     	lea	rax, [rip + 0x17cba69]  # 0x14702ab40
14585f0d7:     	mov	qword ptr [rbp + 0xb0], rax
14585f0de:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f0e9:     	mov	qword ptr [rbp + 0xc0], rbx
14585f0f0:     	lea	rcx, [rip + 0x17ada79]  # 0x14700cb70
14585f0f7:     	mov	qword ptr [rbp + 0xc8], rcx
14585f0fe:     	lea	rax, [rip + 0x17cc4d9]  # 0x14702b5de
14585f105:     	mov	qword ptr [rbp + 0xd0], rax
14585f10c:     	mov	qword ptr [rbp + 0xd8], 0x1
14585f117:     	mov	qword ptr [rbp + 0xe0], r15
14585f11e:     	mov	qword ptr [rbp + 0xe8], rcx
14585f125:     	mov	qword ptr [rsp + 0x20], 0x2
14585f12e:     	lea	rcx, [rbp + 0x78]
14585f132:     	lea	r9, [rbp + 0xb0]
14585f139:     	mov	rdx, rdi
14585f13c:     	mov	r8, r14
14585f13f:     	call	0x1458e0370 <.text+0x58df370>
14585f144:     	nop
14585f145:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585f14c:     	test	rdx, rdx
14585f14f:     	je	0x14585f163 <.text+0x585e163>
14585f151:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585f158:     	mov	r8d, 0x1
14585f15e:     	call	0x1400021d0 <.text+0x11d0>
14585f163:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585f16a:     	test	rdx, rdx
14585f16d:     	je	0x14585f264 <.text+0x585e264>
14585f173:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585f17a:     	jmp	0x14585f259 <.text+0x585e259>
14585f17f:     	movss	xmm6, dword ptr [rdi + 0x6c]
14585f184:     	lea	rsi, [rip + 0x17cc4c7]  # 0x14702b652
14585f18b:     	mov	edx, 0x1c
14585f190:     	mov	rcx, rsi
14585f193:     	call	0x1458dff90 <.text+0x58def90>
14585f198:     	nop
14585f199:     	mov	rbx, rax
14585f19c:     	mov	rdi, rdx
14585f19f:     	mulss	xmm7, xmm6
14585f1a3:     	lea	r14, [rbp + 0x1e0]
14585f1aa:     	mov	rcx, r14
14585f1ad:     	movaps	xmm1, xmm7
14585f1b0:     	call	0x1458627d0 <.text+0x58617d0>
14585f1b5:     	nop
14585f1b6:     	test	rbx, rbx
14585f1b9:     	mov	eax, 0x1c
14585f1be:     	cmove	rdi, rax
14585f1c2:     	cmovne	rsi, rbx
14585f1c6:     	lea	rax, [rip + 0x17cc411]  # 0x14702b5de
14585f1cd:     	mov	qword ptr [rbp + 0xb0], rax
14585f1d4:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f1df:     	mov	qword ptr [rbp + 0xc0], r14
14585f1e6:     	lea	rax, [rip + 0x17ad983]  # 0x14700cb70
14585f1ed:     	mov	qword ptr [rbp + 0xc8], rax
14585f1f4:     	lea	rax, [rip + 0x17ada9a]  # 0x14700cc95
14585f1fb:     	mov	qword ptr [rbp + 0xd0], rax
14585f202:     	mov	qword ptr [rbp + 0xd8], 0x4
14585f20d:     	lea	rax, [rbp + 0x60]
14585f211:     	mov	qword ptr [rbp + 0xe0], rax
14585f218:     	lea	rax, [rip + 0x17ad9d1]  # 0x14700cbf0
14585f21f:     	mov	qword ptr [rbp + 0xe8], rax
14585f226:     	mov	qword ptr [rsp + 0x20], 0x2
14585f22f:     	lea	rcx, [rbp + 0x78]
14585f233:     	lea	r9, [rbp + 0xb0]
14585f23a:     	mov	rdx, rsi
14585f23d:     	mov	r8, rdi
14585f240:     	call	0x1458e0370 <.text+0x58df370>
14585f245:     	nop
14585f246:     	mov	rdx, qword ptr [rbp + 0x1e0]
14585f24d:     	test	rdx, rdx
14585f250:     	je	0x14585f264 <.text+0x585e264>
14585f252:     	mov	rcx, qword ptr [rbp + 0x1e8]
14585f259:     	mov	r8d, 0x1
14585f25f:     	call	0x1400021d0 <.text+0x11d0>
14585f264:     	mov	r14, qword ptr [rbp + 0x78]
14585f268:     	cmp	r14, -0x1
14585f26c:     	je	0x14585ec56 <.text+0x585dc56>
14585f272:     	mov	r15, qword ptr [rbp + 0x80]
14585f279:     	mov	rdi, qword ptr [rbp + 0x88]
14585f280:     	mov	rax, qword ptr [rbp + 0x90]
14585f287:     	mov	rbx, qword ptr [rbp + 0xa0]
14585f28e:     	cmp	rax, rbx
14585f291:     	je	0x14585f9c6 <.text+0x585e9c6>
14585f297:     	mov	rcx, qword ptr [rbp + 0x98]
14585f29e:     	mov	byte ptr [rcx + rbx], 0x20
14585f2a2:     	inc	rbx
14585f2a5:     	mov	qword ptr [rbp + 0xa0], rbx
14585f2ac:     	sub	rax, rbx
14585f2af:     	cmp	rdi, rax
14585f2b2:     	ja	0x14585fa0d <.text+0x585ea0d>
14585f2b8:     	test	rdi, rdi
14585f2bb:     	je	0x14585f2cb <.text+0x585e2cb>
14585f2bd:     	add	rcx, rbx
14585f2c0:     	mov	rdx, r15
14585f2c3:     	mov	r8, rdi
14585f2c6:     	call	0x145d145fb <.text+0x5d135fb>
14585f2cb:     	add	rbx, rdi
14585f2ce:     	mov	qword ptr [rbp + 0xa0], rbx
14585f2d5:     	test	r14, r14
14585f2d8:     	je	0x14585ec56 <.text+0x585dc56>
14585f2de:     	mov	r8d, 0x1
14585f2e4:     	mov	rcx, r15
14585f2e7:     	mov	rdx, r14
14585f2ea:     	call	0x1400021d0 <.text+0x11d0>
14585f2ef:     	jmp	0x14585ec56 <.text+0x585dc56>
14585f2f4:     	movss	xmm7, dword ptr [rdi + 0x6c]
14585f2f9:     	mov	eax, eax
14585f2fb:     	lea	rcx, [rip + 0x17cd122]  # 0x14702c424
14585f302:     	movsxd	rax, dword ptr [rcx + 4*rax]
14585f306:     	add	rax, rcx
14585f309:     	jmp	rax
14585f30b:     	lea	rsi, [rip + 0x17cc378]  # 0x14702b68a
14585f312:     	mov	edx, 0x2d
14585f317:     	mov	rcx, rsi
14585f31a:     	call	0x1458dff90 <.text+0x58def90>
14585f31f:     	nop
14585f320:     	mov	rbx, rax
14585f323:     	mov	rdi, rdx
14585f326:     	lea	r14, [rbp + 0x1e0]
14585f32d:     	mov	rcx, r14
14585f330:     	movaps	xmm1, xmm7
14585f333:     	call	0x1458627d0 <.text+0x58617d0>
14585f338:     	nop
14585f339:     	test	rbx, rbx
14585f33c:     	mov	eax, 0x2d
14585f341:     	cmove	rdi, rax
14585f345:     	cmovne	rsi, rbx
14585f349:     	lea	rax, [rip + 0x17cc28e]  # 0x14702b5de
14585f350:     	mov	qword ptr [rbp + 0xb0], rax
14585f357:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f362:     	mov	qword ptr [rbp + 0xc0], r14
14585f369:     	lea	rax, [rip + 0x17ad800]  # 0x14700cb70
14585f370:     	mov	qword ptr [rbp + 0xc8], rax
14585f377:     	mov	qword ptr [rsp + 0x20], 0x1
14585f380:     	lea	rcx, [rbp + 0x78]
14585f384:     	lea	r9, [rbp + 0xb0]
14585f38b:     	mov	rdx, rsi
14585f38e:     	mov	r8, rdi
14585f391:     	call	0x1458e0370 <.text+0x58df370>
14585f396:     	nop
14585f397:     	jmp	0x14585f246 <.text+0x585e246>
14585f39c:     	cmp	byte ptr [rdi + 0x75], 0x2
14585f3a0:     	mulss	xmm6, xmm7
14585f3a4:     	jne	0x14585f57b <.text+0x585e57b>
14585f3aa:     	lea	rsi, [rip + 0x17cc350]  # 0x14702b701
14585f3b1:     	mov	edx, 0x30
14585f3b6:     	mov	rcx, rsi
14585f3b9:     	call	0x1458dff90 <.text+0x58def90>
14585f3be:     	nop
14585f3bf:     	mov	rbx, rax
14585f3c2:     	mov	rdi, rdx
14585f3c5:     	lea	r14, [rbp + 0x1e0]
14585f3cc:     	mov	rcx, r14
14585f3cf:     	movaps	xmm1, xmm6
14585f3d2:     	call	0x1458627d0 <.text+0x58617d0>
14585f3d7:     	nop
14585f3d8:     	test	rbx, rbx
14585f3db:     	mov	eax, 0x30
14585f3e0:     	cmove	rdi, rax
14585f3e4:     	cmovne	rsi, rbx
14585f3e8:     	lea	rax, [rip + 0x17ad7a1]  # 0x14700cb90
14585f3ef:     	mov	qword ptr [rbp + 0xb0], rax
14585f3f6:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f401:     	mov	qword ptr [rbp + 0xc0], r14
14585f408:     	lea	rax, [rip + 0x17ad761]  # 0x14700cb70
14585f40f:     	mov	qword ptr [rbp + 0xc8], rax
14585f416:     	mov	qword ptr [rsp + 0x20], 0x1
14585f41f:     	lea	rcx, [rbp + 0x78]
14585f423:     	lea	r9, [rbp + 0xb0]
14585f42a:     	mov	rdx, rsi
14585f42d:     	mov	r8, rdi
14585f430:     	call	0x1458e0370 <.text+0x58df370>
14585f435:     	nop
14585f436:     	jmp	0x14585f246 <.text+0x585e246>
14585f43b:     	ucomiss	xmm7, dword ptr [rip + 0x680a6e] # 0x145edfeb0
14585f442:     	jae	0x14585f60c <.text+0x585e60c>
14585f448:     	lea	rsi, [rip + 0x17cc268]  # 0x14702b6b7
14585f44f:     	mov	edx, 0x27
14585f454:     	mov	rcx, rsi
14585f457:     	call	0x1458dff90 <.text+0x58def90>
14585f45c:     	nop
14585f45d:     	mov	rbx, rax
14585f460:     	mov	rdi, rdx
14585f463:     	mulss	xmm7, dword ptr [rip + 0x680f55] # 0x145ee03c0
14585f46b:     	movss	dword ptr [rbp + 0x1c0], xmm7
14585f473:     	lea	rax, [rbp + 0x1c0]
14585f47a:     	mov	qword ptr [rbp + 0xb0], rax
14585f481:     	lea	rax, [rip + 0x498c78]   # 0x145cf8100 <.text+0x5cf7100>
14585f488:     	mov	qword ptr [rbp + 0xb8], rax
14585f48f:     	lea	rdx, [rip + 0x17cbedf]  # 0x14702b375
14585f496:     	lea	r14, [rbp + 0x1e0]
14585f49d:     	lea	r8, [rbp + 0xb0]
14585f4a4:     	mov	rcx, r14
14585f4a7:     	call	0x145ce7350 <.text+0x5ce6350>
14585f4ac:     	nop
14585f4ad:     	test	rbx, rbx
14585f4b0:     	mov	eax, 0x27
14585f4b5:     	cmove	rdi, rax
14585f4b9:     	cmovne	rsi, rbx
14585f4bd:     	lea	rax, [rip + 0x17cb67c]  # 0x14702ab40
14585f4c4:     	mov	qword ptr [rbp + 0xb0], rax
14585f4cb:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f4d6:     	mov	qword ptr [rbp + 0xc0], r14
14585f4dd:     	lea	rax, [rip + 0x17ad68c]  # 0x14700cb70
14585f4e4:     	mov	qword ptr [rbp + 0xc8], rax
14585f4eb:     	mov	qword ptr [rsp + 0x20], 0x1
14585f4f4:     	lea	rcx, [rbp + 0x78]
14585f4f8:     	lea	r9, [rbp + 0xb0]
14585f4ff:     	mov	rdx, rsi
14585f502:     	mov	r8, rdi
14585f505:     	call	0x1458e0370 <.text+0x58df370>
14585f50a:     	nop
14585f50b:     	jmp	0x14585f246 <.text+0x585e246>
14585f510:     	mov	r13d, 0x1
14585f516:     	mov	rbx, qword ptr [rbp + 0x40]
14585f51a:     	test	rbx, rbx
14585f51d:     	jns	0x14585f53e <.text+0x585e53e>
14585f51f:     	xor	r15d, r15d
14585f522:     	mov	qword ptr [rbp + 0x8], r13
14585f526:     	mov	rcx, r15
14585f529:     	mov	rdx, rbx
14585f52c:     	mov	qword ptr [rbp + 0x1b8], r12
14585f533:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14585f538:     	nop
14585f539:     	jmp	0x14585fad6 <.text+0x585ead6>
14585f53e:     	je	0x14585f68c <.text+0x585e68c>
14585f544:     	mov	r14, qword ptr [rbp + 0x38]
14585f548:     	call	0x140002200 <.text+0x1200>
14585f54d:     	mov	r15d, 0x1
14585f553:     	mov	edx, 0x1
14585f558:     	mov	rcx, rbx
14585f55b:     	call	0x1400021c0 <.text+0x11c0>
14585f560:     	test	rax, rax
14585f563:     	je	0x14585f522 <.text+0x585e522>
14585f565:     	mov	rsi, rax
14585f568:     	mov	rcx, rax
14585f56b:     	mov	rdx, r14
14585f56e:     	mov	r8, rbx
14585f571:     	call	0x145d145fb <.text+0x5d135fb>
14585f576:     	jmp	0x14585f691 <.text+0x585e691>
14585f57b:     	lea	rsi, [rip + 0x17cc1af]  # 0x14702b731
14585f582:     	mov	edx, 0x1b
14585f587:     	mov	rcx, rsi
14585f58a:     	call	0x1458dff90 <.text+0x58def90>
14585f58f:     	nop
14585f590:     	mov	rbx, rax
14585f593:     	mov	rdi, rdx
14585f596:     	lea	r14, [rbp + 0x1e0]
14585f59d:     	mov	rcx, r14
14585f5a0:     	movaps	xmm1, xmm6
14585f5a3:     	call	0x1458627d0 <.text+0x58617d0>
14585f5a8:     	nop
14585f5a9:     	test	rbx, rbx
14585f5ac:     	mov	eax, 0x1b
14585f5b1:     	cmove	rdi, rax
14585f5b5:     	cmovne	rsi, rbx
14585f5b9:     	lea	rax, [rip + 0x17ad5d0]  # 0x14700cb90
14585f5c0:     	mov	qword ptr [rbp + 0xb0], rax
14585f5c7:     	mov	qword ptr [rbp + 0xb8], 0x1
14585f5d2:     	mov	qword ptr [rbp + 0xc0], r14
14585f5d9:     	lea	rax, [rip + 0x17ad590]  # 0x14700cb70
14585f5e0:     	mov	qword ptr [rbp + 0xc8], rax
14585f5e7:     	mov	qword ptr [rsp + 0x20], 0x1
14585f5f0:     	lea	rcx, [rbp + 0x78]
14585f5f4:     	lea	r9, [rbp + 0xb0]
14585f5fb:     	mov	rdx, rsi
14585f5fe:     	mov	r8, rdi
14585f601:     	call	0x1458e0370 <.text+0x58df370>
14585f606:     	nop
14585f607:     	jmp	0x14585f246 <.text+0x585e246>
14585f60c:     	lea	rsi, [rip + 0x17cc0cb]  # 0x14702b6de
14585f613:     	mov	ebx, 0x23
14585f618:     	mov	edx, 0x23
14585f61d:     	mov	rcx, rsi
14585f620:     	call	0x1458dff90 <.text+0x58def90>
14585f625:     	nop
14585f626:     	mov	rdi, rdx
14585f629:     	test	rax, rax
14585f62c:     	cmovne	rsi, rax
14585f630:     	cmove	rdi, rbx
14585f634:     	mov	qword ptr [rsp + 0x20], 0x1
14585f63d:     	lea	rcx, [rbp + 0xb0]
14585f644:     	mov	r9d, 0x1
14585f64a:     	mov	rdx, rdi
14585f64d:     	xor	r8d, r8d
14585f650:     	call	0x14001c2a0 <.text+0x1b2a0>
14585f655:     	mov	r14, qword ptr [rbp + 0xb8]
14585f65c:     	cmp	byte ptr [rbp + 0xb0], 0x0
14585f663:     	jne	0x14585fab4 <.text+0x585eab4>
14585f669:     	mov	r15, qword ptr [rbp + 0xc0]
14585f670:     	test	rdi, rdi
14585f673:     	je	0x14585f280 <.text+0x585e280>
14585f679:     	mov	rcx, r15
14585f67c:     	mov	rdx, rsi
14585f67f:     	mov	r8, rdi
14585f682:     	call	0x145d145fb <.text+0x5d135fb>
14585f687:     	jmp	0x14585f280 <.text+0x585e280>
14585f68c:     	mov	esi, 0x1
14585f691:     	mov	qword ptr [rbp - 0x20], rbx
14585f695:     	mov	qword ptr [rbp - 0x18], rsi
14585f699:     	mov	qword ptr [rbp - 0x10], rbx
14585f69d:     	jmp	0x14585d4b0 <.text+0x585c4b0>
14585f6a2:     	lea	rsi, [rip + 0x17cc435]  # 0x14702bade
14585f6a9:     	mov	ebx, 0x52
14585f6ae:     	mov	edx, 0x52
14585f6b3:     	mov	rcx, rsi
14585f6b6:     	call	0x1458dff90 <.text+0x58def90>
14585f6bb:     	nop
14585f6bc:     	mov	r8, rdx
14585f6bf:     	test	rax, rax
14585f6c2:     	cmovne	rsi, rax
14585f6c6:     	cmove	r8, rbx
14585f6ca:     	lea	rax, [rip + 0x17cb86f]  # 0x14702af40
14585f6d1:     	mov	qword ptr [rbp + 0xb0], rax
14585f6d8:     	mov	qword ptr [rbp + 0xb8], 0x3
14585f6e3:     	mov	qword ptr [rbp + 0xc0], r14
14585f6ea:     	lea	rax, [rip + 0x17ad47f]  # 0x14700cb70
14585f6f1:     	mov	qword ptr [rbp + 0xc8], rax
14585f6f8:     	mov	qword ptr [rsp + 0x20], 0x1
14585f701:     	lea	rcx, [rbp + 0x90]
14585f708:     	lea	r9, [rbp + 0xb0]
14585f70f:     	mov	rdx, rsi
14585f712:     	call	0x1458e0370 <.text+0x58df370>
14585f717:     	nop
14585f718:     	jmp	0x14585e16c <.text+0x585d16c>
14585f71d:     	mulss	xmm11, xmm10
14585f722:     	xorps	xmm7, xmm7
14585f725:     	sqrtss	xmm7, xmm11
14585f72a:     	mulss	xmm7, dword ptr [rip + 0x680e6a] # 0x145ee059c
14585f732:     	movaps	xmm0, xmm7
14585f735:     	mulss	xmm0, xmm9
14585f73a:     	mulss	xmm0, dword ptr [rip + 0x680c7e] # 0x145ee03c0
14585f742:     	movss	dword ptr [rbp + 0x1e0], xmm0
14585f74a:     	lea	rax, [rbp + 0x1e0]
14585f751:     	mov	qword ptr [rbp + 0xb0], rax
14585f758:     	lea	rax, [rip + 0x4989a1]   # 0x145cf8100 <.text+0x5cf7100>
14585f75f:     	mov	qword ptr [rbp + 0xb8], rax
14585f766:     	lea	rdx, [rip + 0x17cbc08]  # 0x14702b375
14585f76d:     	lea	r15, [rbp + 0x78]
14585f771:     	lea	r8, [rbp + 0xb0]
14585f778:     	mov	rcx, r15
14585f77b:     	call	0x145ce7350 <.text+0x5ce6350>
14585f780:     	nop
14585f781:     	movss	xmm0, dword ptr [rdi + 0x58]
14585f786:     	xorps	xmm1, xmm1
14585f789:     	ucomiss	xmm0, xmm1
14585f78c:     	jbe	0x14585f809 <.text+0x585e809>
14585f78e:     	lea	rsi, [rip + 0x17cc175]  # 0x14702b90a
14585f795:     	mov	ebx, 0xe
14585f79a:     	mov	edx, 0xe
14585f79f:     	mov	rcx, rsi
14585f7a2:     	call	0x1458dff90 <.text+0x58def90>
14585f7a7:     	nop
14585f7a8:     	mov	r8, rdx
14585f7ab:     	test	rax, rax
14585f7ae:     	cmovne	rsi, rax
14585f7b2:     	cmove	r8, rbx
14585f7b6:     	lea	rax, [rip + 0x17cb783]  # 0x14702af40
14585f7bd:     	mov	qword ptr [rbp + 0xb0], rax
14585f7c4:     	mov	qword ptr [rbp + 0xb8], 0x3
14585f7cf:     	mov	qword ptr [rbp + 0xc0], r14
14585f7d6:     	lea	rax, [rip + 0x17ad393]  # 0x14700cb70
14585f7dd:     	mov	qword ptr [rbp + 0xc8], rax
14585f7e4:     	mov	qword ptr [rsp + 0x20], 0x1
14585f7ed:     	lea	rcx, [rbp + 0x1c0]
14585f7f4:     	lea	r9, [rbp + 0xb0]
14585f7fb:     	mov	rdx, rsi
14585f7fe:     	call	0x1458e0370 <.text+0x58df370>
14585f803:     	nop
14585f804:     	jmp	0x14585f896 <.text+0x585e896>
14585f809:     	lea	rsi, [rip + 0x17cc0f3]  # 0x14702b903
14585f810:     	mov	r14d, 0x7
14585f816:     	mov	edx, 0x7
14585f81b:     	mov	rcx, rsi
14585f81e:     	call	0x1458dff90 <.text+0x58def90>
14585f823:     	nop
14585f824:     	mov	rbx, rdx
14585f827:     	test	rax, rax
14585f82a:     	cmovne	rsi, rax
14585f82e:     	cmove	rbx, r14
14585f832:     	mov	qword ptr [rsp + 0x20], 0x1
14585f83b:     	lea	rcx, [rbp + 0xb0]
14585f842:     	mov	r9d, 0x1
14585f848:     	mov	rdx, rbx
14585f84b:     	xor	r8d, r8d
14585f84e:     	call	0x14001c2a0 <.text+0x1b2a0>
14585f853:     	mov	r14, qword ptr [rbp + 0xb8]
14585f85a:     	cmp	dword ptr [rbp + 0xb0], 0x1
14585f861:     	je	0x14585fac6 <.text+0x585eac6>
14585f867:     	mov	r12, qword ptr [rbp + 0xc0]
14585f86e:     	test	rbx, rbx
14585f871:     	je	0x14585f881 <.text+0x585e881>
14585f873:     	mov	rcx, r12
14585f876:     	mov	rdx, rsi
14585f879:     	mov	r8, rbx
14585f87c:     	call	0x145d145fb <.text+0x5d135fb>
14585f881:     	mov	qword ptr [rbp + 0x1c0], r14
14585f888:     	mov	qword ptr [rbp + 0x1c8], r12
14585f88f:     	mov	qword ptr [rbp + 0x1d0], rbx
14585f896:     	lea	rbx, [rip + 0x17cc07b]  # 0x14702b918
14585f89d:     	mov	edx, 0x61
14585f8a2:     	mov	rcx, rbx
14585f8a5:     	call	0x1458dff90 <.text+0x58def90>
14585f8aa:     	nop
14585f8ab:     	mov	r14, rax
14585f8ae:     	mov	rsi, rdx
14585f8b1:     	mulss	xmm9, xmm6
14585f8b6:     	mulss	xmm7, xmm9
14585f8bb:     	lea	r12, [rbp + 0x1e0]
14585f8c2:     	mov	rcx, r12
14585f8c5:     	movaps	xmm1, xmm7
14585f8c8:     	call	0x1458627d0 <.text+0x58617d0>
14585f8cd:     	nop
14585f8ce:     	test	r14, r14
14585f8d1:     	mov	eax, 0x61
14585f8d6:     	cmove	rsi, rax
14585f8da:     	cmovne	rbx, r14
14585f8de:     	lea	rax, [rip + 0x17cc094]  # 0x14702b979
14585f8e5:     	mov	qword ptr [rbp + 0xb0], rax
14585f8ec:     	mov	qword ptr [rbp + 0xb8], 0x6
14585f8f7:     	mov	qword ptr [rbp + 0xc0], r12
14585f8fe:     	lea	rcx, [rip + 0x17ad26b]  # 0x14700cb70
14585f905:     	mov	qword ptr [rbp + 0xc8], rcx
14585f90c:     	lea	rax, [rip + 0x17cc06c]  # 0x14702b97f
14585f913:     	mov	qword ptr [rbp + 0xd0], rax
14585f91a:     	mov	qword ptr [rbp + 0xd8], 0x5
14585f925:     	mov	qword ptr [rbp + 0xe0], r15
14585f92c:     	mov	qword ptr [rbp + 0xe8], rcx
14585f933:     	lea	rax, [rip + 0x17cc04a]  # 0x14702b984
14585f93a:     	mov	qword ptr [rbp + 0xf0], rax
14585f941:     	mov	qword ptr [rbp + 0xf8], 0x4
14585f94c:     	lea	rax, [rbp + 0x1c0]
14585f953:     	mov	qword ptr [rbp + 0x100], rax
14585f95a:     	mov	qword ptr [rbp + 0x108], rcx
14585f961:     	mov	qword ptr [rsp + 0x20], 0x3
14585f96a:     	lea	rcx, [rbp + 0x90]
14585f971:     	lea	r9, [rbp + 0xb0]
14585f978:     	mov	rdx, rbx
14585f97b:     	mov	r8, rsi
14585f97e:     	call	0x1458e0370 <.text+0x58df370>
14585f983:     	nop
14585f984:     	mov	rdx, qword ptr [rbp + 0x1c0]
14585f98b:     	test	rdx, rdx
14585f98e:     	je	0x14585f9a2 <.text+0x585e9a2>
14585f990:     	mov	rcx, qword ptr [rbp + 0x1c8]
14585f997:     	mov	r8d, 0x1
14585f99d:     	call	0x1400021d0 <.text+0x11d0>
14585f9a2:     	mov	rdx, qword ptr [rbp + 0x78]
14585f9a6:     	test	rdx, rdx
14585f9a9:     	je	0x14585e773 <.text+0x585d773>
14585f9af:     	mov	rcx, qword ptr [rbp + 0x80]
14585f9b6:     	mov	r8d, 0x1
14585f9bc:     	call	0x1400021d0 <.text+0x11d0>
14585f9c1:     	jmp	0x14585e773 <.text+0x585d773>
14585f9c6:     	mov	qword ptr [rbp + 0x10], r15
14585f9ca:     	mov	qword ptr [rbp + 0x1b8], r14
14585f9d1:     	mov	qword ptr [rsp + 0x20], 0x1
14585f9da:     	lea	rcx, [rbp + 0x90]
14585f9e1:     	mov	r8d, 0x1
14585f9e7:     	mov	r9d, 0x1
14585f9ed:     	mov	rdx, rbx
14585f9f0:     	call	0x145d14a10 <.text+0x5d13a10>
14585f9f5:     	nop
14585f9f6:     	mov	rax, qword ptr [rbp + 0x90]
14585f9fd:     	mov	r14, qword ptr [rbp + 0x1b8]
14585fa04:     	mov	r15, qword ptr [rbp + 0x10]
14585fa08:     	jmp	0x14585f297 <.text+0x585e297>
14585fa0d:     	mov	qword ptr [rbp + 0x10], r15
14585fa11:     	mov	qword ptr [rbp + 0x1b8], r14
14585fa18:     	mov	qword ptr [rsp + 0x20], 0x1
14585fa21:     	lea	rcx, [rbp + 0x90]
14585fa28:     	mov	r9d, 0x1
14585fa2e:     	mov	rdx, rbx
14585fa31:     	mov	r8, rdi
14585fa34:     	call	0x145d14a10 <.text+0x5d13a10>
14585fa39:     	nop
14585fa3a:     	mov	rcx, qword ptr [rbp + 0x98]
14585fa41:     	mov	rbx, qword ptr [rbp + 0xa0]
14585fa48:     	mov	r14, qword ptr [rbp + 0x1b8]
14585fa4f:     	mov	r15, qword ptr [rbp + 0x10]
14585fa53:     	jmp	0x14585f2bd <.text+0x585e2bd>
14585fa58:     	mov	qword ptr [rsp + 0x20], 0x1
14585fa61:     	lea	rcx, [rbp + 0x1e0]
14585fa68:     	mov	r9d, 0x1
14585fa6e:     	mov	rdx, rsi
14585fa71:     	mov	r8, rbx
14585fa74:     	call	0x145d14a10 <.text+0x5d13a10>
14585fa79:     	nop
14585fa7a:     	mov	rsi, qword ptr [rbp + 0x1f0]
14585fa81:     	jmp	0x14585cea3 <.text+0x585bea3>
14585fa86:     	mov	qword ptr [rsp + 0x20], 0x1
14585fa8f:     	lea	rcx, [rbp + 0xb0]
14585fa96:     	mov	r9d, 0x1
14585fa9c:     	mov	rdx, rsi
14585fa9f:     	mov	r8, rbx
14585faa2:     	call	0x145d14a10 <.text+0x5d13a10>
14585faa7:     	nop
14585faa8:     	mov	rsi, qword ptr [rbp + 0xc0]
14585faaf:     	jmp	0x14585e124 <.text+0x585d124>
14585fab4:     	mov	rdx, qword ptr [rbp + 0xc0]
14585fabb:     	mov	rcx, r14
14585fabe:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14585fac3:     	nop
14585fac4:     	jmp	0x14585fad6 <.text+0x585ead6>
14585fac6:     	mov	rdx, qword ptr [rbp + 0xc0]
14585facd:     	mov	rcx, r14
14585fad0:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14585fad5:     	nop
14585fad6:     	ud2
