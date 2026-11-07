
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b0880:     	pushq	%rbp
1454b0881:     	pushq	%rsi
1454b0882:     	pushq	%rdi
1454b0883:     	pushq	%rbx
1454b0884:     	subq	$0xd8, %rsp
1454b088b:     	leaq	0x80(%rsp), %rbp
1454b0893:     	movaps	%xmm7, 0x40(%rbp)
1454b0897:     	movaps	%xmm6, 0x30(%rbp)
1454b089b:     	movq	$-0x2, 0x28(%rbp)
1454b08a3:     	movq	%rcx, %rsi
1454b08a6:     	testb	%dl, %dl
1454b08a8:     	je	0x1454b08c6 <.text+0x54af8c6>
1454b08aa:     	movzbl	%dl, %eax
1454b08ad:     	cmpl	$0x1, %eax
1454b08b0:     	jne	0x1454b08e1 <.text+0x54af8e1>
1454b08b2:     	movl	0x8e0(%rsi), %eax
1454b08b8:     	cmpl	$0x1, %eax
1454b08bb:     	adcl	$-0x1, %eax
1454b08be:     	movl	%eax, 0x8e0(%rsi)
1454b08c4:     	jmp	0x1454b08f3 <.text+0x54af8f3>
1454b08c6:     	movl	0x8dc(%rsi), %eax
1454b08cc:     	cmpl	$0x1, %eax
1454b08cf:     	adcl	$-0x1, %eax
1454b08d2:     	movl	%eax, 0x8dc(%rsi)
1454b08d8:     	movb	$0x1, 0x94b(%rsi)
1454b08df:     	jmp	0x1454b08f3 <.text+0x54af8f3>
1454b08e1:     	movl	0x8e4(%rsi), %eax
1454b08e7:     	cmpl	$0x1, %eax
1454b08ea:     	adcl	$-0x1, %eax
1454b08ed:     	movl	%eax, 0x8e4(%rsi)
1454b08f3:     	movq	0x570(%rsi), %rdi
1454b08fa:     	movq	0x578(%rsi), %rbx
1454b0901:     	movq	$0x0, 0x578(%rsi)
1454b090c:     	testq	%rbx, %rbx
1454b090f:     	je	0x1454b0934 <.text+0x54af934>
1454b0911:     	nopw	%cs:(%rax,%rax)
1454b0920:     	movq	%rdi, %rcx
1454b0923:     	callq	0x14545f080 <.text+0x545e080>
1454b0928:     	addq	$0xa0, %rdi
1454b092f:     	decq	%rbx
1454b0932:     	jne	0x1454b0920 <.text+0x54af920>
1454b0934:     	movq	0x530(%rsi), %rax
1454b093b:     	testq	%rax, %rax
1454b093e:     	je	0x1454b0a07 <.text+0x54afa07>
1454b0944:     	movsd	0x3e8(%rsi), %xmm6
1454b094c:     	movss	0x470(%rsi), %xmm7
1454b0954:     	xorl	%edi, %edi
1454b0956:     	xorl	%ebx, %ebx
1454b0958:     	jmp	0x1454b0968 <.text+0x54af968>
1454b095a:     	nopw	(%rax,%rax)
1454b0960:     	incq	%rdi
1454b0963:     	cmpq	%rax, %rdi
1454b0966:     	jae	0x1454b09bd <.text+0x54af9bd>
1454b0968:     	movq	0x528(%rsi), %rcx
1454b096f:     	leaq	(%rdi,%rdi,8), %rdx
1454b0973:     	cmpl	$0x0, 0x20(%rcx,%rdx,8)
1454b0978:     	jne	0x1454b0960 <.text+0x54af960>
1454b097a:     	leaq	(%rcx,%rdx,8), %rcx
1454b097e:     	cmpl	$0x0, 0x18(%rcx)
1454b0982:     	jne	0x1454b09a3 <.text+0x54af9a3>
1454b0984:     	movsd	0x34(%rcx), %xmm0
1454b0989:     	subps	%xmm6, %xmm0
1454b098c:     	mulps	%xmm0, %xmm0
1454b098f:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b0993:     	addss	%xmm0, %xmm1
1454b0997:     	xorps	%xmm0, %xmm0
1454b099a:     	sqrtss	%xmm1, %xmm0
1454b099e:     	ucomiss	%xmm0, %xmm7
1454b09a1:     	jb	0x1454b0960 <.text+0x54af960>
1454b09a3:     	addl	0x24(%rcx), %ebx
1454b09a6:     	movq	%rsi, %rcx
1454b09a9:     	movq	%rdi, %rdx
1454b09ac:     	callq	0x1454a5d50 <.text+0x54a4d50>
1454b09b1:     	movq	0x530(%rsi), %rax
1454b09b8:     	cmpq	%rax, %rdi
1454b09bb:     	jb	0x1454b0968 <.text+0x54af968>
1454b09bd:     	testl	%ebx, %ebx
1454b09bf:     	je	0x1454b0a07 <.text+0x54afa07>
1454b09c1:     	movl	%ebx, %eax
1454b09c3:     	xorps	%xmm0, %xmm0
1454b09c6:     	cvtsi2ss	%rax, %xmm0
1454b09cb:     	mulss	0x474(%rsi), %xmm0
1454b09d3:     	callq	0x145714a5d <.text+0x5713a5d>
1454b09d8:     	maxss	0x3f7a40(%rip), %xmm0   # 0x1458a8420
1454b09e0:     	cvttss2si	%xmm0, %rax
1454b09e5:     	xorl	%ecx, %ecx
1454b09e7:     	xorps	%xmm1, %xmm1
1454b09ea:     	ucomiss	%xmm1, %xmm0
1454b09ed:     	cmovael	%eax, %ecx
1454b09f0:     	ucomiss	0x3faa4d(%rip), %xmm0   # 0x1458ab444
1454b09f7:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454b09fc:     	cmovbel	%ecx, %edx
1454b09ff:     	movq	%rsi, %rcx
1454b0a02:     	callq	0x14548ac90 <.text+0x5489c90>
1454b0a07:     	movb	$0x1, %dl
1454b0a09:     	cmpl	$0x0, 0x8e0(%rsi)
1454b0a10:     	jne	0x1454b0a28 <.text+0x54afa28>
1454b0a12:     	movb	$0x2, %dl
1454b0a14:     	cmpl	$0x0, 0x8e4(%rsi)
1454b0a1b:     	jne	0x1454b0a28 <.text+0x54afa28>
1454b0a1d:     	cmpl	$0x0, 0x8dc(%rsi)
1454b0a24:     	je	0x1454b0a46 <.text+0x54afa46>
1454b0a26:     	xorl	%edx, %edx
1454b0a28:     	movq	%rsi, %rcx
1454b0a2b:     	xorl	%r8d, %r8d
1454b0a2e:     	movaps	0x30(%rbp), %xmm6
1454b0a32:     	movaps	0x40(%rbp), %xmm7
1454b0a36:     	addq	$0xd8, %rsp
1454b0a3d:     	popq	%rbx
1454b0a3e:     	popq	%rdi
1454b0a3f:     	popq	%rsi
1454b0a40:     	popq	%rbp
1454b0a41:     	jmp	0x1454af2b0 <.text+0x54ae2b0>
1454b0a46:     	movb	$-0x1, 0x94c(%rsi)
1454b0a4d:     	cmpq	$0x0, 0x10(%rsi)
1454b0a52:     	movq	$0x0, 0x10(%rsi)
1454b0a5a:     	je	0x1454b0ad3 <.text+0x54afad3>
1454b0a5c:     	callq	0x140002200 <.text+0x1200>
1454b0a61:     	movl	$0x20, %ecx
1454b0a66:     	movl	$0x1, %edx
1454b0a6b:     	callq	0x1400021c0 <.text+0x11c0>
1454b0a70:     	movq	%rax, 0x20(%rbp)
1454b0a74:     	testq	%rax, %rax
1454b0a77:     	je	0x1454b0e06 <.text+0x54afe06>
1454b0a7d:     	movq	0x548(%rsi), %rdi
1454b0a84:     	cmpq	0x538(%rsi), %rdi
1454b0a8b:     	jne	0x1454b0a9a <.text+0x54afa9a>
1454b0a8d:     	leaq	0x538(%rsi), %rcx
1454b0a94:     	callq	0x145717d60 <.text+0x5716d60>
1454b0a99:     	nop
1454b0a9a:     	movq	0x540(%rsi), %rax
1454b0aa1:     	movq	%rdi, %rcx
1454b0aa4:     	shlq	$0x5, %rcx
1454b0aa8:     	movq	$0x20, (%rax,%rcx)
1454b0ab0:     	movq	0x20(%rbp), %rdx
1454b0ab4:     	movq	%rdx, 0x8(%rax,%rcx)
1454b0ab9:     	movq	$0x0, 0x10(%rax,%rcx)
1454b0ac2:     	movw	$0x17e, 0x18(%rax,%rcx) # imm = 0x17E
1454b0ac9:     	incq	%rdi
1454b0acc:     	movq	%rdi, 0x548(%rsi)
1454b0ad3:     	movb	$0x1, 0x94e(%rsi)
1454b0ada:     	movq	%rsi, %rcx
1454b0add:     	callq	0x14546b5f0 <.text+0x546a5f0>
1454b0ae2:     	movss	0x8d4(%rsi), %xmm6
1454b0aea:     	leaq	0x2f0(%rsi), %rcx
1454b0af1:     	movq	0x300(%rsi), %rdi
1454b0af8:     	testq	%rdi, %rdi
1454b0afb:     	je	0x1454b0b2c <.text+0x54afb2c>
1454b0afd:     	movq	0x2f8(%rsi), %rax
1454b0b04:     	xorl	%edx, %edx
1454b0b06:     	movq	%rax, %r8
1454b0b09:     	nopl	(%rax)
1454b0b10:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454b0b18:     	je	0x1454b0cee <.text+0x54afcee>
1454b0b1e:     	incq	%rdx
1454b0b21:     	addq	$0x18, %r8
1454b0b25:     	cmpq	%rdx, %rdi
1454b0b28:     	jne	0x1454b0b10 <.text+0x54afb10>
1454b0b2a:     	jmp	0x1454b0b2e <.text+0x54afb2e>
1454b0b2c:     	xorl	%edi, %edi
1454b0b2e:     	addss	0x3f78ea(%rip), %xmm6   # 0x1458a8420
1454b0b36:     	cmpq	(%rcx), %rdi
1454b0b39:     	jne	0x1454b0b40 <.text+0x54afb40>
1454b0b3b:     	callq	0x14573df00 <.text+0x573cf00>
1454b0b40:     	movq	0x2f8(%rsi), %rax
1454b0b47:     	leaq	(%rdi,%rdi,2), %rcx
1454b0b4b:     	movl	$0xb, (%rax,%rcx,8)
1454b0b52:     	movl	$0x3fc, 0xc(%rax,%rcx,8) # imm = 0x3FC
1454b0b5a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
1454b0b60:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454b0b68:     	incq	%rdi
1454b0b6b:     	movq	%rdi, 0x300(%rsi)
1454b0b72:     	movq	0x3d0(%rsi), %rdx
1454b0b79:     	movq	%rdx, -0x30(%rbp)
1454b0b7d:     	movl	$0x2, -0x8(%rbp)
1454b0b84:     	movl	$0x0, -0x3c(%rbp)
1454b0b8b:     	leaq	-0x3c(%rbp), %rax
1454b0b8f:     	movq	%rax, 0x30(%rsp)
1454b0b94:     	leaq	-0x8(%rbp), %rax
1454b0b98:     	movq	%rax, 0x28(%rsp)
1454b0b9d:     	movq	$0x1, 0x20(%rsp)
1454b0ba6:     	leaq	-0x28(%rbp), %rcx
1454b0baa:     	leaq	-0x30(%rbp), %r9
1454b0bae:     	movl	$0x3fc, %r8d            # imm = 0x3FC
1454b0bb4:     	callq	0x1454424a0 <.text+0x54414a0>
1454b0bb9:     	movq	0x548(%rsi), %rdi
1454b0bc0:     	cmpq	0x538(%rsi), %rdi
1454b0bc7:     	jne	0x1454b0bd6 <.text+0x54afbd6>
1454b0bc9:     	leaq	0x538(%rsi), %rcx
1454b0bd0:     	callq	0x145717d60 <.text+0x5716d60>
1454b0bd5:     	nop
1454b0bd6:     	movq	0x540(%rsi), %rax
1454b0bdd:     	movq	%rdi, %rcx
1454b0be0:     	shlq	$0x5, %rcx
1454b0be4:     	movups	-0x28(%rbp), %xmm0
1454b0be8:     	movups	-0x18(%rbp), %xmm1
1454b0bec:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b0bf1:     	movups	%xmm0, (%rax,%rcx)
1454b0bf5:     	incq	%rdi
1454b0bf8:     	movq	%rdi, 0x548(%rsi)
1454b0bff:     	movq	%rsi, %rcx
1454b0c02:     	callq	0x145464860 <.text+0x5463860>
1454b0c07:     	callq	0x140002200 <.text+0x1200>
1454b0c0c:     	movl	$0x1, %ecx
1454b0c11:     	movl	$0x1, %edx
1454b0c16:     	callq	0x1400021c0 <.text+0x11c0>
1454b0c1b:     	testq	%rax, %rax
1454b0c1e:     	je	0x1454b0df5 <.text+0x54afdf5>
1454b0c24:     	movb	$0x7b, (%rax)
1454b0c27:     	movq	$0x1, -0x28(%rbp)
1454b0c2f:     	movq	%rax, -0x20(%rbp)
1454b0c33:     	movq	$0x1, -0x18(%rbp)
1454b0c3b:     	movb	$0x1, -0x10(%rbp)
1454b0c3f:     	leaq	0x15ffff2(%rip), %rax   # 0x146ab0c38
1454b0c46:     	movq	%rax, 0x20(%rsp)
1454b0c4b:     	movq	$0x6, 0x28(%rsp)
1454b0c54:     	leaq	0x15fea4e(%rip), %r8    # 0x146aaf6a9
1454b0c5b:     	leaq	-0x8(%rbp), %rcx
1454b0c5f:     	leaq	-0x28(%rbp), %rdx
1454b0c63:     	movl	$0x4, %r9d
1454b0c69:     	callq	0x145426da0 <.text+0x5425da0>
1454b0c6e:     	movq	-0x8(%rbp), %rax
1454b0c72:     	movq	0x8(%rbp), %rdi
1454b0c76:     	movq	%rax, 0x20(%rbp)
1454b0c7a:     	cmpq	%rdi, %rax
1454b0c7d:     	je	0x1454b0dc6 <.text+0x54afdc6>
1454b0c83:     	movq	(%rbp), %rax
1454b0c87:     	movq	%rax, 0x18(%rbp)
1454b0c8b:     	movb	$0x7d, (%rax,%rdi)
1454b0c8f:     	movq	0x560(%rsi), %rbx
1454b0c96:     	cmpq	0x550(%rsi), %rbx
1454b0c9d:     	jne	0x1454b0cac <.text+0x54afcac>
1454b0c9f:     	leaq	0x550(%rsi), %rcx
1454b0ca6:     	callq	0x145717c10 <.text+0x5716c10>
1454b0cab:     	nop
1454b0cac:     	incq	%rdi
1454b0caf:     	movq	0x558(%rsi), %rax
1454b0cb6:     	leaq	(%rbx,%rbx,2), %rcx
1454b0cba:     	movq	0x20(%rbp), %rdx
1454b0cbe:     	movq	%rdx, (%rax,%rcx,8)
1454b0cc2:     	movq	0x18(%rbp), %rdx
1454b0cc6:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454b0ccb:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454b0cd0:     	incq	%rbx
1454b0cd3:     	movq	%rbx, 0x560(%rsi)
1454b0cda:     	movaps	0x30(%rbp), %xmm6
1454b0cde:     	movaps	0x40(%rbp), %xmm7
1454b0ce2:     	addq	$0xd8, %rsp
1454b0ce9:     	popq	%rbx
1454b0cea:     	popq	%rdi
1454b0ceb:     	popq	%rsi
1454b0cec:     	popq	%rbp
1454b0ced:     	retq
1454b0cee:     	leaq	0x1(%rdx), %r10
1454b0cf2:     	cmpq	%rdi, %r10
1454b0cf5:     	jae	0x1454b0d37 <.text+0x54afd37>
1454b0cf7:     	leaq	-0x2(%rdi), %r9
1454b0cfb:     	leal	(%rdi,%rdx), %ebx
1454b0cfe:     	movq	%rdx, %r11
1454b0d01:     	testb	$0x1, %bl
1454b0d04:     	jne	0x1454b0d2f <.text+0x54afd2f>
1454b0d06:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454b0d0e:     	movq	%rdx, %r11
1454b0d11:     	je	0x1454b0d2b <.text+0x54afd2b>
1454b0d13:     	leaq	0x18(%r8), %r10
1454b0d17:     	movq	0x10(%r10), %r11
1454b0d1b:     	movq	%r11, 0x10(%r8)
1454b0d1f:     	movups	(%r10), %xmm0
1454b0d23:     	movups	%xmm0, (%r8)
1454b0d27:     	leaq	0x1(%rdx), %r11
1454b0d2b:     	leaq	0x2(%rdx), %r10
1454b0d2f:     	cmpq	%rdx, %r9
1454b0d32:     	movq	%r11, %rdx
1454b0d35:     	jne	0x1454b0d57 <.text+0x54afd57>
1454b0d37:     	movq	%rdx, 0x300(%rsi)
1454b0d3e:     	movq	%rdx, %rdi
1454b0d41:     	addss	0x3f76d7(%rip), %xmm6   # 0x1458a8420
1454b0d49:     	cmpq	(%rcx), %rdi
1454b0d4c:     	je	0x1454b0b3b <.text+0x54afb3b>
1454b0d52:     	jmp	0x1454b0b40 <.text+0x54afb40>
1454b0d57:     	leaq	(%r10,%r10,2), %rdx
1454b0d5b:     	leaq	(%rax,%rdx,8), %r8
1454b0d5f:     	subq	%r10, %rdi
1454b0d62:     	movq	%r11, %rdx
1454b0d65:     	jmp	0x1454b0d71 <.text+0x54afd71>
1454b0d67:     	addq	$0x30, %r8
1454b0d6b:     	addq	$-0x2, %rdi
1454b0d6f:     	je	0x1454b0d37 <.text+0x54afd37>
1454b0d71:     	cmpl	$0x3fc, 0xc(%r8)        # imm = 0x3FC
1454b0d79:     	jne	0x1454b0d87 <.text+0x54afd87>
1454b0d7b:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454b0d83:     	je	0x1454b0d67 <.text+0x54afd67>
1454b0d85:     	jmp	0x1454b0daa <.text+0x54afdaa>
1454b0d87:     	leaq	(%rdx,%rdx,2), %r9
1454b0d8b:     	movq	0x10(%r8), %r10
1454b0d8f:     	movq	%r10, 0x10(%rax,%r9,8)
1454b0d94:     	movups	(%r8), %xmm0
1454b0d98:     	movups	%xmm0, (%rax,%r9,8)
1454b0d9d:     	incq	%rdx
1454b0da0:     	cmpl	$0x3fc, 0x24(%r8)       # imm = 0x3FC
1454b0da8:     	je	0x1454b0d67 <.text+0x54afd67>
1454b0daa:     	leaq	(%rdx,%rdx,2), %r9
1454b0dae:     	movq	0x28(%r8), %r10
1454b0db2:     	movq	%r10, 0x10(%rax,%r9,8)
1454b0db7:     	movups	0x18(%r8), %xmm0
1454b0dbc:     	movups	%xmm0, (%rax,%r9,8)
1454b0dc1:     	incq	%rdx
1454b0dc4:     	jmp	0x1454b0d67 <.text+0x54afd67>
1454b0dc6:     	movq	$0x1, 0x20(%rsp)
1454b0dcf:     	leaq	-0x8(%rbp), %rcx
1454b0dd3:     	movl	$0x1, %r8d
1454b0dd9:     	movl	$0x1, %r9d
1454b0ddf:     	movq	%rdi, %rdx
1454b0de2:     	callq	0x145717840 <.text+0x5716840>
1454b0de7:     	nop
1454b0de8:     	movq	-0x8(%rbp), %rax
1454b0dec:     	movq	%rax, 0x20(%rbp)
1454b0df0:     	jmp	0x1454b0c83 <.text+0x54afc83>
1454b0df5:     	movl	$0x1, %ecx
1454b0dfa:     	movl	$0x1, %edx
1454b0dff:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454b0e04:     	ud2
1454b0e06:     	movl	$0x1, %ecx
1454b0e0b:     	movl	$0x20, %edx
1454b0e10:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454b0e15:     	ud2
