
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454589f0:     	pushq	%rbp
1454589f1:     	pushq	%r15
1454589f3:     	pushq	%r14
1454589f5:     	pushq	%r13
1454589f7:     	pushq	%r12
1454589f9:     	pushq	%rsi
1454589fa:     	pushq	%rdi
1454589fb:     	pushq	%rbx
1454589fc:     	subq	$0xe8, %rsp
145458a03:     	leaq	0x80(%rsp), %rbp
145458a0b:     	movaps	%xmm7, 0x50(%rbp)
145458a0f:     	movaps	%xmm6, 0x40(%rbp)
145458a13:     	movq	$-0x2, 0x38(%rbp)
145458a1b:     	movq	%rcx, %rsi
145458a1e:     	movb	%dl, 0x37(%rbp)
145458a21:     	cmpq	$0xc, %r8
145458a25:     	setb	%al
145458a28:     	cmpq	$0x5, %r9
145458a2c:     	setb	%cl
145458a2f:     	testb	%cl, %al
145458a31:     	je	0x145458aad <.text+0x5457aad>
145458a33:     	imulq	$0xf0, %r8, %rcx
145458a3a:     	leaq	0x12bd9f7(%rip), %rax   # 0x146716438
145458a41:     	movq	0x88(%rcx,%rax), %rcx
145458a49:     	imulq	$0x58, %r9, %r10
145458a4d:     	leaq	0x152cebc(%rip), %r11   # 0x146985910
145458a54:     	movq	(%r11,%r8,8), %r12
145458a58:     	movq	%r12, 0x10(%rbp)
145458a5c:     	leaq	0x152d7d5(%rip), %r11   # 0x146986238
145458a63:     	movss	(%r11,%r12,4), %xmm6
145458a69:     	movss	%xmm6, 0x30(%rbp)
145458a6e:     	cmpb	$0x0, 0x54(%rcx,%r10)
145458a74:     	je	0x145458ac9 <.text+0x5457ac9>
145458a76:     	leal	-0x1(%rdx), %eax
145458a79:     	cmpb	$0xa, %al
145458a7b:     	ja	0x145458baf <.text+0x5457baf>
145458a81:     	movzbl	%al, %eax
145458a84:     	movl	$0x5df, %ecx            # imm = 0x5DF
145458a89:     	btl	%eax, %ecx
145458a8c:     	jae	0x145458baf <.text+0x5457baf>
145458a92:     	leaq	0x153290f(%rip), %rcx   # 0x14698b3a8
145458a99:     	movq	(%rcx,%rax,8), %rax
145458a9d:     	movq	0x80(%rax), %r14
145458aa4:     	addq	$0x8, %r14
145458aa8:     	jmp	0x145458bb2 <.text+0x5457bb2>
145458aad:     	movq	$0x0, (%rsi)
145458ab4:     	movq	$0x4, 0x8(%rsi)
145458abc:     	movq	$0x0, 0x10(%rsi)
145458ac4:     	jmp	0x145458d7f <.text+0x5457d7f>
145458ac9:     	movq	%rax, -0x58(%rbp)
145458acd:     	leaq	0x12be4a4(%rip), %rax   # 0x146716f78
145458ad4:     	movq	%rax, -0x50(%rbp)
145458ad8:     	movq	$0x0, -0x48(%rbp)
145458ae0:     	leaq	0x10(%rbp), %rbx
145458ae4:     	movq	%rbx, -0x40(%rbp)
145458ae8:     	movq	$0x0, -0x38(%rbp)
145458af0:     	movq	$0x0, -0x18(%rbp)
145458af8:     	leaq	0x18(%rbp), %rdi
145458afc:     	leaq	-0x58(%rbp), %rdx
145458b00:     	movq	%rdi, %rcx
145458b03:     	movq	%r9, %r14
145458b06:     	movq	%r8, %r15
145458b09:     	callq	0x14552cb40 <.text+0x552bb40>
145458b0e:     	movq	0x20(%rbp), %rcx
145458b12:     	movq	0x28(%rbp), %r8
145458b16:     	testq	%r8, %r8
145458b19:     	je	0x145458bf2 <.text+0x5457bf2>
145458b1f:     	movq	%r15, %rax
145458b22:     	movq	%r14, %rdx
145458b25:     	shlq	$0x4, %r8
145458b29:     	addq	%rcx, %r8
145458b2c:     	xorl	%r9d, %r9d
145458b2f:     	movq	%rcx, %r10
145458b32:     	jmp	0x145458b50 <.text+0x5457b50>
145458b34:     	nopw	%cs:(%rax,%rax)
145458b40:     	addq	$0x10, %r10
145458b44:     	incq	%r9
145458b47:     	cmpq	%r8, %r10
145458b4a:     	je	0x145458bf2 <.text+0x5457bf2>
145458b50:     	cmpq	%rax, (%r10)
145458b53:     	jne	0x145458b40 <.text+0x5457b40>
145458b55:     	cmpq	%rdx, 0x8(%r10)
145458b59:     	jne	0x145458b40 <.text+0x5457b40>
145458b5b:     	movq	%r9, 0x8(%rbp)
145458b5f:     	movq	%rdi, -0x58(%rbp)
145458b63:     	leaq	0x8(%rbp), %rax
145458b67:     	movq	%rax, -0x50(%rbp)
145458b6b:     	movq	$0x0, -0x48(%rbp)
145458b73:     	movq	$0x8, -0x40(%rbp)
145458b7b:     	leaq	0x37(%rbp), %rax
145458b7f:     	movq	%rax, -0x38(%rbp)
145458b83:     	movq	%rbx, -0x30(%rbp)
145458b87:     	leaq	0x30(%rbp), %rax
145458b8b:     	movq	%rax, -0x28(%rbp)
145458b8f:     	leaq	-0x58(%rbp), %rdx
145458b93:     	movq	%rsi, %rcx
145458b96:     	callq	0x1455287e0 <.text+0x55277e0>
145458b9b:     	nop
145458b9c:     	movq	0x18(%rbp), %rdx
145458ba0:     	testq	%rdx, %rdx
145458ba3:     	je	0x145458d7f <.text+0x5457d7f>
145458ba9:     	movq	0x20(%rbp), %rcx
145458bad:     	jmp	0x145458c16 <.text+0x5457c16>
145458baf:     	xorl	%r14d, %r14d
145458bb2:     	xorl	%ebx, %ebx
145458bb4:     	movq	%r14, %r15
145458bb7:     	subq	$0x8, %r15
145458bbb:     	cmovbq	%rbx, %r15
145458bbf:     	leaq	(,%r15,8), %rdi
145458bc7:     	movq	%r15, %rax
145458bca:     	shrq	$0x3d, %rax
145458bce:     	setne	%al
145458bd1:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145458bdb:     	cmpq	%rcx, %rdi
145458bde:     	seta	%cl
145458be1:     	orb	%al, %cl
145458be3:     	je	0x145458c2a <.text+0x5457c2a>
145458be5:     	movq	%rbx, %rcx
145458be8:     	movq	%rdi, %rdx
145458beb:     	callq	0x1458e721b <.text+0x58e621b>
145458bf0:     	ud2
145458bf2:     	movq	$0x0, (%rsi)
145458bf9:     	movq	$0x4, 0x8(%rsi)
145458c01:     	movq	$0x0, 0x10(%rsi)
145458c09:     	movq	0x18(%rbp), %rdx
145458c0d:     	testq	%rdx, %rdx
145458c10:     	je	0x145458d7f <.text+0x5457d7f>
145458c16:     	shlq	$0x4, %rdx
145458c1a:     	movl	$0x8, %r8d
145458c20:     	callq	0x1400021d0 <.text+0x11d0>
145458c25:     	jmp	0x145458d7f <.text+0x5457d7f>
145458c2a:     	testq	%rdi, %rdi
145458c2d:     	je	0x145458c8a <.text+0x5457c8a>
145458c2f:     	movq	%rdx, %r13
145458c32:     	callq	0x140002200 <.text+0x1200>
145458c37:     	movl	$0x4, %ebx
145458c3c:     	movl	$0x4, %edx
145458c41:     	movq	%rdi, %rcx
145458c44:     	callq	0x1400021c0 <.text+0x11c0>
145458c49:     	testq	%rax, %rax
145458c4c:     	je	0x145458be5 <.text+0x5457be5>
145458c4e:     	movq	%r13, %rdx
145458c51:     	cmpq	$0x9, %r14
145458c55:     	jb	0x145458c98 <.text+0x5457c98>
145458c57:     	movzbl	%dl, %ecx
145458c5a:     	imull	$0x3e8, %ecx, %edx      # imm = 0x3E8
145458c60:     	cmpq	$0x5, %r12
145458c64:     	movl	$0x5, %ecx
145458c69:     	cmovbq	%r12, %rcx
145458c6d:     	addl	%ecx, %ecx
145458c6f:     	leal	(%rcx,%rcx,4), %r8d
145458c73:     	leaq	-0x8(%r14), %r10
145458c77:     	cmpq	$0x4, %r10
145458c7b:     	jae	0x145458c9f <.text+0x5457c9f>
145458c7d:     	movl	$0x8, %r9d
145458c83:     	xorl	%ecx, %ecx
145458c85:     	jmp	0x145458d48 <.text+0x5457d48>
145458c8a:     	movl	$0x4, %eax
145458c8f:     	xorl	%r15d, %r15d
145458c92:     	cmpq	$0x9, %r14
145458c96:     	jae	0x145458c57 <.text+0x5457c57>
145458c98:     	xorl	%ecx, %ecx
145458c9a:     	jmp	0x145458d74 <.text+0x5457d74>
145458c9f:     	leal	(%rdx,%r8), %r11d
145458ca3:     	addl	$0x186a0, %r11d         # imm = 0x186A0
145458caa:     	movq	%r10, %rcx
145458cad:     	andq	$-0x4, %rcx
145458cb1:     	leaq	0x8(%rcx), %r9
145458cb5:     	movd	%r11d, %xmm0
145458cba:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145458cbf:     	movdqa	0x152c949(%rip), %xmm1  # 0x146985610
145458cc7:     	paddd	%xmm0, %xmm1
145458ccb:     	movq	0x152c94d(%rip), %xmm2  # 0x146985620
145458cd3:     	xorl	%r11d, %r11d
145458cd6:     	movdqa	0x152c952(%rip), %xmm3  # 0x146985630
145458cde:     	movdqa	0x8e41ea(%rip), %xmm4   # 0x145d3ced0
145458ce6:     	nopw	%cs:(%rax,%rax)
145458cf0:     	movdqa	%xmm2, %xmm5
145458cf4:     	pmuludq	%xmm3, %xmm5
145458cf8:     	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
145458cfd:     	pshufd	$0xf5, %xmm2, %xmm7     # xmm7 = xmm2[1,1,3,3]
145458d02:     	pmuludq	%xmm3, %xmm7
145458d06:     	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
145458d0b:     	punpckldq	%xmm7, %xmm5    # xmm5 = xmm5[0],xmm7[0],xmm5[1],xmm7[1]
145458d0f:     	movdqa	%xmm5, %xmm7
145458d13:     	paddd	%xmm0, %xmm7
145458d17:     	paddd	%xmm1, %xmm5
145458d1b:     	shufps	$0x4, %xmm6, %xmm7      # xmm7 = xmm7[0,1],xmm6[0,0]
145458d1f:     	shufps	$0xd8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,1,3]
145458d23:     	movups	%xmm7, (%rax,%r11,8)
145458d28:     	shufps	$0x4, %xmm6, %xmm5      # xmm5 = xmm5[0,1],xmm6[0,0]
145458d2c:     	shufps	$0xd8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,1,3]
145458d30:     	movups	%xmm5, 0x10(%rax,%r11,8)
145458d36:     	addq	$0x4, %r11
145458d3a:     	paddd	%xmm4, %xmm2
145458d3e:     	cmpq	%r11, %rcx
145458d41:     	jne	0x145458cf0 <.text+0x5457cf0>
145458d43:     	cmpq	%rcx, %r10
145458d46:     	je	0x145458d74 <.text+0x5457d74>
145458d48:     	subq	%r9, %r14
145458d4b:     	imull	$0x64, %r9d, %r9d
145458d4f:     	addl	%r9d, %edx
145458d52:     	addl	%r8d, %edx
145458d55:     	addl	$0x186a0, %edx          # imm = 0x186A0
145458d5b:     	nopl	(%rax,%rax)
145458d60:     	movl	%edx, (%rax,%rcx,8)
145458d63:     	movss	%xmm6, 0x4(%rax,%rcx,8)
145458d69:     	incq	%rcx
145458d6c:     	addl	$0x64, %edx
145458d6f:     	decq	%r14
145458d72:     	jne	0x145458d60 <.text+0x5457d60>
145458d74:     	movq	%r15, (%rsi)
145458d77:     	movq	%rax, 0x8(%rsi)
145458d7b:     	movq	%rcx, 0x10(%rsi)
145458d7f:     	movq	%rsi, %rax
145458d82:     	movaps	0x40(%rbp), %xmm6
145458d86:     	movaps	0x50(%rbp), %xmm7
145458d8a:     	addq	$0xe8, %rsp
145458d91:     	popq	%rbx
145458d92:     	popq	%rdi
145458d93:     	popq	%rsi
145458d94:     	popq	%r12
145458d96:     	popq	%r13
145458d98:     	popq	%r14
145458d9a:     	popq	%r15
145458d9c:     	popq	%rbp
145458d9d:     	retq
