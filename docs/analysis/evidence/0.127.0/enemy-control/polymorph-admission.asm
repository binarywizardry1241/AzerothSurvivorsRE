145c6cec0:     	movq	0x5c0(%rcx), %rax
145c6cec7:     	testq	%rax, %rax
145c6ceca:     	je	0x145c6cf23 <.text+0x5c6bf23>
145c6cecc:     	movss	0xcc0(%rcx), %xmm0
145c6ced4:     	movq	0x5b8(%rcx), %rcx
145c6cedb:     	imulq	$0x1f8, %rax, %rax      # imm = 0x1F8
145c6cee2:     	xorl	%r8d, %r8d
145c6cee5:     	jmp	0x145c6cefc <.text+0x5c6befc>
145c6cee7:     	nopw	(%rax,%rax)
145c6cef0:     	addq	$0x1f8, %r8             # imm = 0x1F8
145c6cef7:     	cmpq	%r8, %rax
145c6cefa:     	je	0x145c6cf23 <.text+0x5c6bf23>
145c6cefc:     	cmpq	%rdx, 0xf0(%rcx,%r8)
145c6cf04:     	jne	0x145c6cef0 <.text+0x5c6bef0>
145c6cf06:     	cmpl	$0x1, 0xb0(%rcx,%r8)
145c6cf0f:     	je	0x145c6cef0 <.text+0x5c6bef0>
145c6cf11:     	movss	0x1dc(%rcx,%r8), %xmm1
145c6cf1b:     	xorl	%eax, %eax
145c6cf1d:     	ucomiss	%xmm0, %xmm1
145c6cf20:     	jbe	0x145c6cf26 <.text+0x5c6bf26>
145c6cf22:     	retq
145c6cf23:     	xorl	%eax, %eax
145c6cf25:     	retq
145c6cf26:     	movzbl	0x1f5(%rcx,%r8), %edx
145c6cf2f:     	cmpq	$0x5, %rdx
145c6cf33:     	jae	0x145c6cf6a <.text+0x5c6bf6a>
145c6cf35:     	leaq	0x1771910(%rip), %rax   # 0x1473de84c
145c6cf3c:     	leal	0x1(%rdx), %r9d
145c6cf40:     	movb	%r9b, 0x1f5(%rcx,%r8)
145c6cf48:     	cmpb	$0x0, 0x1f4(%rcx,%r8)
145c6cf51:     	jne	0x145c6d018 <.text+0x5c6c018>
145c6cf57:     	movss	0x5c61f1(%rip), %xmm0   # 0x146233150
145c6cf5f:     	mulss	(%rax,%rdx,4), %xmm0
145c6cf64:     	movl	$0x1, %eax
145c6cf69:     	retq
145c6cf6a:     	movss	0x5df86e(%rip), %xmm1   # 0x14624c7e0
145c6cf72:     	addss	%xmm0, %xmm1
145c6cf76:     	movss	%xmm1, 0x1dc(%rcx,%r8)
145c6cf80:     	movb	$0x0, 0x1f5(%rcx,%r8)
145c6cf89:     	movss	0x1c8(%rcx,%r8), %xmm1
145c6cf93:     	movss	0x1d0(%rcx,%r8), %xmm2
145c6cf9d:     	movaps	%xmm2, %xmm3
145c6cfa0:     	minss	%xmm0, %xmm3
145c6cfa4:     	movaps	%xmm3, %xmm4
145c6cfa7:     	cmpunordss	%xmm3, %xmm4
145c6cfac:     	andps	%xmm4, %xmm2
145c6cfaf:     	andnps	%xmm3, %xmm4
145c6cfb2:     	orps	%xmm2, %xmm4
145c6cfb5:     	movss	%xmm4, 0x1d0(%rcx,%r8)
145c6cfbf:     	movss	0x1d8(%rcx,%r8), %xmm2
145c6cfc9:     	movaps	%xmm2, %xmm3
145c6cfcc:     	minss	%xmm0, %xmm3
145c6cfd0:     	movaps	%xmm3, %xmm4
145c6cfd3:     	cmpunordss	%xmm3, %xmm4
145c6cfd8:     	andps	%xmm4, %xmm2
145c6cfdb:     	andnps	%xmm3, %xmm4
145c6cfde:     	orps	%xmm2, %xmm4
145c6cfe1:     	movss	%xmm4, 0x1d8(%rcx,%r8)
145c6cfeb:     	movaps	%xmm1, %xmm2
145c6cfee:     	minss	%xmm0, %xmm2
145c6cff2:     	movaps	%xmm2, %xmm3
145c6cff5:     	cmpunordss	%xmm2, %xmm3
145c6cffa:     	andps	%xmm3, %xmm1
145c6cffd:     	andnps	%xmm2, %xmm3
145c6d000:     	orps	%xmm1, %xmm3
145c6d003:     	movss	%xmm3, 0x1c8(%rcx,%r8)
145c6d00d:     	movss	%xmm0, 0x1b4(%rcx,%r8)
145c6d017:     	retq
145c6d018:     	movss	0x5c5ea0(%rip), %xmm0   # 0x146232ec0
145c6d020:     	mulss	(%rax,%rdx,4), %xmm0
145c6d025:     	movl	$0x1, %eax
145c6d02a:     	retq
