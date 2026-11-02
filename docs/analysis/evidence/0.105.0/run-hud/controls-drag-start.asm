Disassembly of section .text:

0000000140001000 <.text>:
1402788c0:     	pushq	%r15
1402788c2:     	pushq	%r14
1402788c4:     	pushq	%r13
1402788c6:     	pushq	%r12
1402788c8:     	pushq	%rsi
1402788c9:     	pushq	%rdi
1402788ca:     	pushq	%rbp
1402788cb:     	pushq	%rbx
1402788cc:     	subq	$0xc8, %rsp
1402788d3:     	movaps	%xmm7, 0xb0(%rsp)
1402788db:     	movaps	%xmm6, 0xa0(%rsp)
1402788e3:     	movq	0x138(%rsp), %rax
1402788eb:     	movq	0x130(%rsp), %rcx
1402788f3:     	movq	(%rdx), %rdi
1402788f6:     	movq	0x8(%rdx), %rbx
1402788fa:     	movl	0x10(%rdx), %r14d
1402788fe:     	movl	0x14(%rdx), %ebp
140278901:     	movq	(%r8), %r15
140278904:     	movq	0x10(%r8), %r12
140278908:     	movl	0x1c(%r8), %edx
14027890c:     	movl	%edx, 0x44(%rsp)
140278910:     	movq	(%rcx), %rsi
140278913:     	movq	(%rax), %rax
140278916:     	movq	%rax, 0x58(%rsp)
14027891b:     	movupd	(%r9), %xmm0
140278920:     	movapd	%xmm0, 0x60(%rsp)
140278926:     	movq	0x10(%r9), %rax
14027892a:     	movq	%rax, 0x70(%rsp)
14027892f:     	leaq	0x90(%rsp), %rcx
140278937:     	leaq	0x60(%rsp), %rdx
14027893c:     	callq	0x1400118b0 <.text+0x108b0>
140278941:     	cmpb	$0x1, 0x90(%rsp)
140278949:     	je	0x14027901d <.text+0x27801d>
14027894f:     	movq	0x98(%rsp), %rax
140278957:     	cmpl	$0x1, (%rax)
14027895a:     	jne	0x1402789d5 <.text+0x2779d5>
14027895c:     	movupd	0x8(%rax), %xmm0
140278961:     	xorpd	%xmm2, %xmm2
140278965:     	ucomisd	%xmm2, %xmm0
140278969:     	jb	0x1402789d5 <.text+0x2779d5>
14027896b:     	movsd	0x10(%rax), %xmm1
140278970:     	ucomisd	%xmm2, %xmm1
140278974:     	jb	0x1402789d5 <.text+0x2779d5>
140278976:     	movl	0xc0(%rax), %ecx
14027897c:     	xorps	%xmm2, %xmm2
14027897f:     	cvtsi2sd	%rcx, %xmm2
140278984:     	ucomisd	%xmm0, %xmm2
140278988:     	jbe	0x1402789d5 <.text+0x2779d5>
14027898a:     	movl	0xc4(%rax), %ecx
140278990:     	xorps	%xmm2, %xmm2
140278993:     	cvtsi2sd	%rcx, %xmm2
140278998:     	ucomisd	%xmm1, %xmm2
14027899c:     	jbe	0x1402789d5 <.text+0x2779d5>
14027899e:     	movq	%r12, 0x50(%rsp)
1402789a3:     	movq	%r15, 0x38(%rsp)
1402789a8:     	cvtpd2ps	%xmm0, %xmm6
1402789ac:     	leaq	0xc8(%rax), %rcx
1402789b3:     	leaq	0xbc(%rax), %rdx
1402789ba:     	cmpb	$0x0, 0xb8(%rax)
1402789c1:     	cmovneq	%rdx, %rcx
1402789c5:     	movss	(%rcx), %xmm0
1402789c9:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1402789cd:     	divps	%xmm0, %xmm6
1402789d0:     	jmp	0x140278a74 <.text+0x277a74>
1402789d5:     	leaq	0x60(%rsp), %rcx
1402789da:     	movq	%rsi, %rdx
1402789dd:     	callq	0x143608050 <.text+0x3607050>
1402789e2:     	movq	0x80(%rsp), %rax
1402789ea:     	testq	%rax, %rax
1402789ed:     	je	0x14027901d <.text+0x27801d>
1402789f3:     	movzwl	0x78(%rsp), %edx
1402789f8:     	movq	0x60(%rsp), %rcx
1402789fd:     	testw	%dx, %dx
140278a00:     	jne	0x140278a36 <.text+0x277a36>
140278a02:     	movq	0x68(%rsp), %r8
140278a07:     	nopw	(%rax,%rax)
140278a10:     	movdqa	(%r8), %xmm0
140278a15:     	addq	$-0x880, %rcx           # imm = 0xF780
140278a1c:     	addq	$0x10, %r8
140278a20:     	pmovmskb	%xmm0, %edx
140278a24:     	xorl	$0xffff, %edx           # imm = 0xFFFF
140278a2a:     	je	0x140278a10 <.text+0x277a10>
140278a2c:     	movq	%r8, 0x68(%rsp)
140278a31:     	movq	%rcx, 0x60(%rsp)
140278a36:     	movq	%r12, 0x50(%rsp)
140278a3b:     	movq	%r15, 0x38(%rsp)
140278a40:     	leal	-0x1(%rdx), %r8d
140278a44:     	tzcntl	%edx, %r9d
140278a49:     	andl	%edx, %r8d
140278a4c:     	movw	%r8w, 0x78(%rsp)
140278a52:     	movq	%r9, %rdx
140278a55:     	negq	%rdx
140278a58:     	shll	$0x3, %r9d
140278a5c:     	shlq	$0x7, %rdx
140278a60:     	subq	%r9, %rdx
140278a63:     	decq	%rax
140278a66:     	movq	%rax, 0x80(%rsp)
140278a6e:     	movsd	-0x8(%rcx,%rdx), %xmm6
140278a74:     	movq	0xf8(%rdi), %rsi
140278a7b:     	movq	0x100(%rdi), %rax
140278a82:     	leaq	(%rsi,%rax,4), %r15
140278a86:     	movl	%ebp, %eax
140278a88:     	subl	%r14d, %eax
140278a8b:     	cmpl	$0xc233b000, %eax       # imm = 0xC233B000
140278a90:     	movl	$0xc233b000, %r12d      # imm = 0xC233B000
140278a96:     	cmovbl	%eax, %r12d
140278a9a:     	cmpb	$0x0, 0x108(%rdi)
140278aa1:     	je	0x140278d46 <.text+0x277d46>
140278aa7:     	xorl	%eax, %eax
140278aa9:     	movaps	0x5af81e0(%rip), %xmm7  # 0x145d70c90
140278ab0:     	xorl	%ecx, %ecx
140278ab2:     	xorl	%edx, %edx
140278ab4:     	xorl	%r14d, %r14d
140278ab7:     	movq	$0x0, 0x20(%rsp)
140278ac0:     	movq	$0x0, 0x28(%rsp)
140278ac9:     	movq	$0x0, 0x30(%rsp)
140278ad2:     	jmp	0x140278b0a <.text+0x277b0a>
140278ad4:     	nopw	%cs:(%rax,%rax)
140278ae0:     	xorl	%r14d, %r14d
140278ae3:     	movq	0x130(%rdi), %rdx
140278aea:     	callq	0x144e38680 <.text+0x4e37680>
140278aef:     	movq	(%r13), %rcx
140278af3:     	xorl	%edx, %edx
140278af5:     	movl	%edx, %r8d
140278af8:     	incl	%edx
140278afa:     	movl	%ebp, %r9d
140278afd:     	subl	(%rax,%r8,4), %r9d
140278b01:     	cmpl	%r12d, %r9d
140278b04:     	jb	0x140278ca3 <.text+0x277ca3>
140278b0a:     	cmpl	%ecx, %edx
140278b0c:     	jne	0x140278af5 <.text+0x277af5>
140278b0e:     	cmpq	%r15, %rsi
140278b11:     	je	0x14027901d <.text+0x27801d>
140278b17:     	movl	(%rsi), %ecx
140278b19:     	addq	$0x4, %rsi
140278b1d:     	movq	0x1a8(%rbx), %rax
140278b24:     	leaq	(%rcx,%rcx,8), %rdx
140278b28:     	cmpq	$0x0, 0x10(%rax,%rdx,8)
140278b2e:     	je	0x140278b50 <.text+0x277b50>
140278b30:     	leaq	(%rax,%rdx,8), %rcx
140278b34:     	leaq	(%rax,%rdx,8), %r13
140278b38:     	addq	$0x10, %r13
140278b3c:     	movq	0x110(%rdi), %rdx
140278b43:     	movq	0x40(%rcx), %rax
140278b47:     	cmpq	%rax, %rdx
140278b4a:     	jae	0x140278bc0 <.text+0x277bc0>
140278b4c:     	jmp	0x140278b8a <.text+0x277b8a>
140278b4e:     	nop
140278b50:     	cmpq	%r15, %rsi
140278b53:     	je	0x14027901d <.text+0x27801d>
140278b59:     	movl	(%rsi), %ecx
140278b5b:     	addq	$0x4, %rsi
140278b5f:     	movq	0x1a8(%rbx), %rax
140278b66:     	leaq	(%rcx,%rcx,8), %rcx
140278b6a:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
140278b70:     	je	0x140278b50 <.text+0x277b50>
140278b72:     	leaq	(%rax,%rcx,8), %rcx
140278b76:     	leaq	0x10(%rcx), %r13
140278b7a:     	movq	0x110(%rdi), %rdx
140278b81:     	movq	0x40(%rcx), %rax
140278b85:     	cmpq	%rax, %rdx
140278b88:     	jae	0x140278bc0 <.text+0x277bc0>
140278b8a:     	movq	0x38(%rcx), %r8
140278b8e:     	movq	(%r8,%rdx,8), %rdx
140278b92:     	testq	%rdx, %rdx
140278b95:     	je	0x140278bc0 <.text+0x277bc0>
140278b97:     	movq	0x18(%rcx), %r8
140278b9b:     	notq	%rdx
140278b9e:     	leaq	(%rdx,%rdx,2), %rdx
140278ba2:     	shlq	$0x4, %rdx
140278ba6:     	movq	0x10(%r8,%rdx), %rdx
140278bab:     	movq	%rdx, 0x30(%rsp)
140278bb0:     	movq	0x118(%rdi), %rdx
140278bb7:     	cmpq	%rax, %rdx
140278bba:     	jb	0x140278bd5 <.text+0x277bd5>
140278bbc:     	jmp	0x140278c10 <.text+0x277c10>
140278bbe:     	nop
140278bc0:     	movq	$0x0, 0x30(%rsp)
140278bc9:     	movq	0x118(%rdi), %rdx
140278bd0:     	cmpq	%rax, %rdx
140278bd3:     	jae	0x140278c10 <.text+0x277c10>
140278bd5:     	movq	0x38(%rcx), %r8
140278bd9:     	movq	(%r8,%rdx,8), %rdx
140278bdd:     	testq	%rdx, %rdx
140278be0:     	je	0x140278c10 <.text+0x277c10>
140278be2:     	movq	0x18(%rcx), %r8
140278be6:     	notq	%rdx
140278be9:     	leaq	(%rdx,%rdx,2), %rdx
140278bed:     	shlq	$0x4, %rdx
140278bf1:     	movq	0x10(%r8,%rdx), %rdx
140278bf6:     	movq	%rdx, 0x28(%rsp)
140278bfb:     	movq	0x120(%rdi), %rdx
140278c02:     	cmpq	%rax, %rdx
140278c05:     	jae	0x140278c60 <.text+0x277c60>
140278c07:     	jmp	0x140278c25 <.text+0x277c25>
140278c09:     	nopl	(%rax)
140278c10:     	movq	$0x0, 0x28(%rsp)
140278c19:     	movq	0x120(%rdi), %rdx
140278c20:     	cmpq	%rax, %rdx
140278c23:     	jae	0x140278c60 <.text+0x277c60>
140278c25:     	movq	0x38(%rcx), %r8
140278c29:     	movq	(%r8,%rdx,8), %rdx
140278c2d:     	testq	%rdx, %rdx
140278c30:     	je	0x140278c60 <.text+0x277c60>
140278c32:     	movq	0x18(%rcx), %r8
140278c36:     	notq	%rdx
140278c39:     	leaq	(%rdx,%rdx,2), %rdx
140278c3d:     	shlq	$0x4, %rdx
140278c41:     	movq	0x10(%r8,%rdx), %rdx
140278c46:     	movq	%rdx, 0x20(%rsp)
140278c4b:     	movq	0x128(%rdi), %rdx
140278c52:     	cmpq	%rax, %rdx
140278c55:     	jae	0x140278ae0 <.text+0x277ae0>
140278c5b:     	jmp	0x140278c79 <.text+0x277c79>
140278c5d:     	nopl	(%rax)
140278c60:     	movq	$0x0, 0x20(%rsp)
140278c69:     	movq	0x128(%rdi), %rdx
140278c70:     	cmpq	%rax, %rdx
140278c73:     	jae	0x140278ae0 <.text+0x277ae0>
140278c79:     	movq	0x38(%rcx), %rax
140278c7d:     	movq	(%rax,%rdx,8), %rax
140278c81:     	testq	%rax, %rax
140278c84:     	je	0x140278ae0 <.text+0x277ae0>
140278c8a:     	movq	0x18(%rcx), %rdx
140278c8e:     	notq	%rax
140278c91:     	leaq	(%rax,%rax,2), %rax
140278c95:     	shlq	$0x4, %rax
140278c99:     	movq	0x10(%rdx,%rax), %r14
140278c9e:     	jmp	0x140278ae3 <.text+0x277ae3>
140278ca3:     	movq	0x30(%rsp), %r9
140278ca8:     	cmpb	$0x0, (%r9,%r8)
140278cad:     	jne	0x140278b0a <.text+0x277b0a>
140278cb3:     	movq	0x38(%rsp), %r9
140278cb8:     	cmpb	$0x2, 0x20(%r9)
140278cbd:     	jne	0x140278b0a <.text+0x277b0a>
140278cc3:     	imulq	$0x68, %r8, %r9
140278cc7:     	addq	0x20(%rsp), %r9
140278ccc:     	movq	%r8, %r10
140278ccf:     	shlq	$0x5, %r10
140278cd3:     	addq	%r14, %r10
140278cd6:     	movsd	0x30(%r9), %xmm0
140278cdc:     	unpcklps	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1]
140278cdf:     	mulps	%xmm7, %xmm0
140278ce2:     	mulps	(%r10), %xmm0
140278ce6:     	movq	0x28(%rsp), %r11
140278ceb:     	movzbl	(%r11,%r8), %r8d
140278cf0:     	movsd	0x10(%r10), %xmm1
140278cf6:     	movaps	%xmm0, %xmm2
140278cf9:     	unpckhpd	%xmm0, %xmm2            # xmm2 = xmm2[1],xmm0[1]
140278cfd:     	addps	%xmm0, %xmm2
140278d00:     	addps	%xmm1, %xmm2
140278d03:     	movss	0x64(%r9), %xmm0
140278d09:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
140278d0d:     	mulps	%xmm2, %xmm0
140278d10:     	movq	0x58(%rsp), %r9
140278d15:     	movss	(%r9), %xmm1
140278d1a:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
140278d1e:     	mulps	%xmm0, %xmm1
140278d21:     	movq	0x50(%rsp), %r9
140278d26:     	movl	0x44(%rsp), %r10d
140278d2b:     	movl	%r10d, (%r9)
140278d2e:     	movq	0x38(%rsp), %r9
140278d33:     	movlps	%xmm6, 0x18(%r9)
140278d38:     	movb	%r8b, 0x20(%r9)
140278d3c:     	movlps	%xmm1, 0x24(%r9)
140278d41:     	jmp	0x140278b0a <.text+0x277b0a>
140278d46:     	xorl	%eax, %eax
140278d48:     	movl	$0x8, %ecx
140278d4d:     	movaps	0x5af7f3c(%rip), %xmm7  # 0x145d70c90
140278d54:     	xorl	%edx, %edx
140278d56:     	xorl	%r8d, %r8d
140278d59:     	movq	$0x0, 0x48(%rsp)
140278d62:     	movq	$0x0, 0x20(%rsp)
140278d6b:     	movq	$0x0, 0x28(%rsp)
140278d74:     	movq	$0x0, 0x30(%rsp)
140278d7d:     	jmp	0x140278dc1 <.text+0x277dc1>
140278d7f:     	nop
140278d80:     	movq	$0x0, 0x48(%rsp)
140278d89:     	movq	0x130(%rdi), %rdx
140278d90:     	callq	0x144e38680 <.text+0x4e37680>
140278d95:     	movq	0x50(%r13), %rcx
140278d99:     	movq	(%r14), %rdx
140278d9c:     	xorl	%r8d, %r8d
140278d9f:     	movl	%r8d, %r9d
140278da2:     	shlq	$0x4, %r9
140278da6:     	incl	%r8d
140278da9:     	movl	0x8(%rcx,%r9), %r9d
140278dae:     	notl	%r9d
140278db1:     	movl	%ebp, %r10d
140278db4:     	subl	(%rax,%r9,4), %r10d
140278db8:     	cmpl	%r12d, %r10d
140278dbb:     	jb	0x140278f78 <.text+0x277f78>
140278dc1:     	cmpl	%edx, %r8d
140278dc4:     	jne	0x140278d9f <.text+0x277d9f>
140278dc6:     	cmpq	%r15, %rsi
140278dc9:     	je	0x14027901d <.text+0x27801d>
140278dcf:     	movl	(%rsi), %ecx
140278dd1:     	addq	$0x4, %rsi
140278dd5:     	movq	0x108(%rbx), %rax
140278ddc:     	leaq	(%rcx,%rcx,4), %rcx
140278de0:     	shlq	$0x5, %rcx
140278de4:     	cmpq	$0x0, 0x58(%rax,%rcx)
140278dea:     	je	0x140278e00 <.text+0x277e00>
140278dec:     	leaq	(%rax,%rcx), %r13
140278df0:     	leaq	(%rax,%rcx), %r14
140278df4:     	addq	$0x58, %r14
140278df8:     	jmp	0x140278e2d <.text+0x277e2d>
140278dfa:     	nopw	(%rax,%rax)
140278e00:     	cmpq	%r15, %rsi
140278e03:     	je	0x14027901d <.text+0x27801d>
140278e09:     	movl	(%rsi), %eax
140278e0b:     	addq	$0x4, %rsi
140278e0f:     	movq	0x108(%rbx), %r13
140278e16:     	leaq	(%rax,%rax,4), %rax
140278e1a:     	shlq	$0x5, %rax
140278e1e:     	cmpq	$0x0, 0x58(%r13,%rax)
140278e24:     	je	0x140278e00 <.text+0x277e00>
140278e26:     	addq	%rax, %r13
140278e29:     	leaq	0x58(%r13), %r14
140278e2d:     	movl	0x94(%r13), %eax
140278e34:     	movq	0x1a8(%rbx), %r8
140278e3b:     	leaq	(%rax,%rax,8), %rax
140278e3f:     	leaq	(%r8,%rax,8), %rcx
140278e43:     	movq	0x110(%rdi), %rdx
140278e4a:     	movq	0x40(%r8,%rax,8), %rax
140278e4f:     	cmpq	%rax, %rdx
140278e52:     	jae	0x140278e90 <.text+0x277e90>
140278e54:     	movq	0x38(%rcx), %r8
140278e58:     	movq	(%r8,%rdx,8), %rdx
140278e5c:     	testq	%rdx, %rdx
140278e5f:     	je	0x140278e90 <.text+0x277e90>
140278e61:     	movq	0x18(%rcx), %r8
140278e65:     	notq	%rdx
140278e68:     	leaq	(%rdx,%rdx,2), %rdx
140278e6c:     	shlq	$0x4, %rdx
140278e70:     	movq	0x10(%r8,%rdx), %rdx
140278e75:     	movq	%rdx, 0x30(%rsp)
140278e7a:     	movq	0x118(%rdi), %rdx
140278e81:     	cmpq	%rax, %rdx
140278e84:     	jb	0x140278ea5 <.text+0x277ea5>
140278e86:     	jmp	0x140278ee0 <.text+0x277ee0>
140278e88:     	nopl	(%rax,%rax)
140278e90:     	movq	$0x0, 0x30(%rsp)
140278e99:     	movq	0x118(%rdi), %rdx
140278ea0:     	cmpq	%rax, %rdx
140278ea3:     	jae	0x140278ee0 <.text+0x277ee0>
140278ea5:     	movq	0x38(%rcx), %r8
140278ea9:     	movq	(%r8,%rdx,8), %rdx
140278ead:     	testq	%rdx, %rdx
140278eb0:     	je	0x140278ee0 <.text+0x277ee0>
140278eb2:     	movq	0x18(%rcx), %r8
140278eb6:     	notq	%rdx
140278eb9:     	leaq	(%rdx,%rdx,2), %rdx
140278ebd:     	shlq	$0x4, %rdx
140278ec1:     	movq	0x10(%r8,%rdx), %rdx
140278ec6:     	movq	%rdx, 0x28(%rsp)
140278ecb:     	movq	0x120(%rdi), %rdx
140278ed2:     	cmpq	%rax, %rdx
140278ed5:     	jae	0x140278f30 <.text+0x277f30>
140278ed7:     	jmp	0x140278ef5 <.text+0x277ef5>
140278ed9:     	nopl	(%rax)
140278ee0:     	movq	$0x0, 0x28(%rsp)
140278ee9:     	movq	0x120(%rdi), %rdx
140278ef0:     	cmpq	%rax, %rdx
140278ef3:     	jae	0x140278f30 <.text+0x277f30>
140278ef5:     	movq	0x38(%rcx), %r8
140278ef9:     	movq	(%r8,%rdx,8), %rdx
140278efd:     	testq	%rdx, %rdx
140278f00:     	je	0x140278f30 <.text+0x277f30>
140278f02:     	movq	0x18(%rcx), %r8
140278f06:     	notq	%rdx
140278f09:     	leaq	(%rdx,%rdx,2), %rdx
140278f0d:     	shlq	$0x4, %rdx
140278f11:     	movq	0x10(%r8,%rdx), %rdx
140278f16:     	movq	%rdx, 0x20(%rsp)
140278f1b:     	movq	0x128(%rdi), %rdx
140278f22:     	cmpq	%rax, %rdx
140278f25:     	jae	0x140278d80 <.text+0x277d80>
140278f2b:     	jmp	0x140278f49 <.text+0x277f49>
140278f2d:     	nopl	(%rax)
140278f30:     	movq	$0x0, 0x20(%rsp)
140278f39:     	movq	0x128(%rdi), %rdx
140278f40:     	cmpq	%rax, %rdx
140278f43:     	jae	0x140278d80 <.text+0x277d80>
140278f49:     	movq	0x38(%rcx), %rax
140278f4d:     	movq	(%rax,%rdx,8), %rax
140278f51:     	testq	%rax, %rax
140278f54:     	je	0x140278d80 <.text+0x277d80>
140278f5a:     	movq	0x18(%rcx), %rdx
140278f5e:     	notq	%rax
140278f61:     	leaq	(%rax,%rax,2), %rax
140278f65:     	shlq	$0x4, %rax
140278f69:     	movq	0x10(%rdx,%rax), %rax
140278f6e:     	movq	%rax, 0x48(%rsp)
140278f73:     	jmp	0x140278d89 <.text+0x277d89>
140278f78:     	movq	0x30(%rsp), %r10
140278f7d:     	cmpb	$0x0, (%r10,%r9)
140278f82:     	jne	0x140278dc1 <.text+0x277dc1>
140278f88:     	movq	0x38(%rsp), %r10
140278f8d:     	cmpb	$0x2, 0x20(%r10)
140278f92:     	jne	0x140278dc1 <.text+0x277dc1>
140278f98:     	imulq	$0x68, %r9, %r10
140278f9c:     	addq	0x20(%rsp), %r10
140278fa1:     	movq	%r9, %r11
140278fa4:     	shlq	$0x5, %r11
140278fa8:     	addq	0x48(%rsp), %r11
140278fad:     	movsd	0x30(%r10), %xmm0
140278fb3:     	unpcklps	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1]
140278fb6:     	mulps	%xmm7, %xmm0
140278fb9:     	mulps	(%r11), %xmm0
140278fbd:     	movq	0x28(%rsp), %r14
140278fc2:     	movzbl	(%r14,%r9), %r9d
140278fc7:     	movsd	0x10(%r11), %xmm1
140278fcd:     	movaps	%xmm0, %xmm2
140278fd0:     	unpckhpd	%xmm0, %xmm2            # xmm2 = xmm2[1],xmm0[1]
140278fd4:     	addps	%xmm0, %xmm2
140278fd7:     	addps	%xmm1, %xmm2
140278fda:     	movss	0x64(%r10), %xmm0
140278fe0:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
140278fe4:     	mulps	%xmm2, %xmm0
140278fe7:     	movq	0x58(%rsp), %r10
140278fec:     	movss	(%r10), %xmm1
140278ff1:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
140278ff5:     	mulps	%xmm0, %xmm1
140278ff8:     	movq	0x50(%rsp), %r10
140278ffd:     	movl	0x44(%rsp), %r11d
140279002:     	movl	%r11d, (%r10)
140279005:     	movq	0x38(%rsp), %r10
14027900a:     	movlps	%xmm6, 0x18(%r10)
14027900f:     	movb	%r9b, 0x20(%r10)
140279013:     	movlps	%xmm1, 0x24(%r10)
140279018:     	jmp	0x140278dc1 <.text+0x277dc1>
14027901d:     	movaps	0xa0(%rsp), %xmm6
140279025:     	movaps	0xb0(%rsp), %xmm7
14027902d:     	addq	$0xc8, %rsp
140279034:     	popq	%rbx
140279035:     	popq	%rbp
140279036:     	popq	%rdi
140279037:     	popq	%rsi
140279038:     	popq	%r12
14027903a:     	popq	%r13
14027903c:     	popq	%r14
14027903e:     	popq	%r15
140279040:     	retq
