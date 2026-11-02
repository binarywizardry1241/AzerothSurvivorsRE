
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a0910:     	pushq	%rbp
1454a0911:     	pushq	%r15
1454a0913:     	pushq	%r14
1454a0915:     	pushq	%r13
1454a0917:     	pushq	%r12
1454a0919:     	pushq	%rsi
1454a091a:     	pushq	%rdi
1454a091b:     	pushq	%rbx
1454a091c:     	subq	$0x188, %rsp            # imm = 0x188
1454a0923:     	leaq	0x80(%rsp), %rbp
1454a092b:     	movaps	%xmm10, 0xf0(%rbp)
1454a0933:     	movapd	%xmm9, 0xe0(%rbp)
1454a093c:     	movaps	%xmm8, 0xd0(%rbp)
1454a0944:     	movaps	%xmm7, 0xc0(%rbp)
1454a094b:     	movaps	%xmm6, 0xb0(%rbp)
1454a0952:     	movq	$-0x2, 0xa8(%rbp)
1454a095d:     	cmpb	$0x1, 0x9b9(%rcx)
1454a0964:     	jne	0x1454a14d6 <.text+0x54a04d6>
1454a096a:     	movq	%rcx, %r12
1454a096d:     	cmpb	$0x0, 0x9b2(%rcx)
1454a0974:     	jne	0x1454a14d6 <.text+0x54a04d6>
1454a097a:     	movq	%r8, %r13
1454a097d:     	movaps	%xmm1, %xmm6
1454a0980:     	movss	0x934(%r12), %xmm8
1454a098a:     	movss	%xmm8, -0x1c(%rbp)
1454a0990:     	leaq	0x308(%r12), %r15
1454a0998:     	movq	0x310(%r12), %rax
1454a09a0:     	movq	0x318(%r12), %rcx
1454a09a8:     	leaq	(,%rcx,8), %rdx
1454a09b0:     	leaq	(%rdx,%rdx,2), %rdx
1454a09b4:     	movq	%rax, %r8
1454a09b7:     	nopw	(%rax,%rax)
1454a09c0:     	testq	%rdx, %rdx
1454a09c3:     	je	0x1454a09e7 <.text+0x549f9e7>
1454a09c5:     	movq	%r8, %r10
1454a09c8:     	addq	$0x18, %r8
1454a09cc:     	movss	0x10(%r10), %xmm0
1454a09d2:     	addq	$-0x18, %rdx
1454a09d6:     	ucomiss	%xmm8, %xmm0
1454a09da:     	jbe	0x1454a09c0 <.text+0x549f9c0>
1454a09dc:     	cmpl	$0xb, (%r10)
1454a09e0:     	jne	0x1454a09c0 <.text+0x549f9c0>
1454a09e2:     	jmp	0x1454a14d6 <.text+0x54a04d6>
1454a09e7:     	movss	0x466aa1(%rip), %xmm7   # 0x145907490
1454a09ef:     	subss	0x490(%r12), %xmm7
1454a09f9:     	mulss	%xmm6, %xmm7
1454a09fd:     	movss	0x41c(%r12), %xmm9
1454a0a07:     	xorps	%xmm0, %xmm0
1454a0a0a:     	ucomiss	%xmm0, %xmm9
1454a0a0e:     	jbe	0x1454a0c29 <.text+0x549fc29>
1454a0a14:     	movaps	%xmm7, %xmm1
1454a0a17:     	minss	%xmm9, %xmm1
1454a0a1c:     	movaps	%xmm1, %xmm10
1454a0a20:     	cmpunordss	%xmm1, %xmm10
1454a0a26:     	movaps	%xmm10, %xmm2
1454a0a2a:     	andnps	%xmm1, %xmm2
1454a0a2d:     	andps	%xmm7, %xmm10
1454a0a31:     	orps	%xmm2, %xmm10
1454a0a35:     	movaps	%xmm9, %xmm1
1454a0a39:     	subss	%xmm10, %xmm1
1454a0a3e:     	movss	%xmm1, 0x41c(%r12)
1454a0a48:     	movl	0x3f0(%r12), %edx
1454a0a50:     	movss	0x3f4(%r12), %xmm2
1454a0a5a:     	testl	%edx, %edx
1454a0a5c:     	setne	%r11b
1454a0a60:     	xorl	%r10d, %r10d
1454a0a63:     	ucomiss	%xmm2, %xmm10
1454a0a67:     	setae	%r8b
1454a0a6b:     	cmovbl	%edx, %r10d
1454a0a6f:     	xorps	%xmm3, %xmm3
1454a0a72:     	andb	%r11b, %r8b
1454a0a75:     	jne	0x1454a0a7f <.text+0x549fa7f>
1454a0a77:     	subss	%xmm10, %xmm2
1454a0a7c:     	movaps	%xmm2, %xmm3
1454a0a7f:     	subss	%xmm10, %xmm7
1454a0a84:     	movl	%r10d, 0x3f0(%r12)
1454a0a8c:     	movss	%xmm3, 0x3f4(%r12)
1454a0a96:     	ucomiss	%xmm1, %xmm0
1454a0a99:     	jae	0x1454a0adb <.text+0x549fadb>
1454a0a9b:     	testb	%r8b, %r8b
1454a0a9e:     	je	0x1454a0be0 <.text+0x549fbe0>
1454a0aa4:     	movl	%r9d, %r14d
1454a0aa7:     	testq	%rcx, %rcx
1454a0aaa:     	je	0x1454a0b19 <.text+0x549fb19>
1454a0aac:     	movq	%rcx, %r8
1454a0aaf:     	negq	%r8
1454a0ab2:     	xorl	%r9d, %r9d
1454a0ab5:     	movq	%rax, %r10
1454a0ab8:     	nopl	(%rax,%rax)
1454a0ac0:     	cmpl	%edx, 0xc(%r10)
1454a0ac4:     	je	0x1454a1cc7 <.text+0x54a0cc7>
1454a0aca:     	incq	%r9
1454a0acd:     	addq	$0x18, %r10
1454a0ad1:     	movq	%r8, %r11
1454a0ad4:     	addq	%r9, %r11
1454a0ad7:     	jne	0x1454a0ac0 <.text+0x549fac0>
1454a0ad9:     	jmp	0x1454a0b19 <.text+0x549fb19>
1454a0adb:     	movl	%r9d, %r14d
1454a0ade:     	movq	$0x0, 0x3f0(%r12)
1454a0aea:     	testq	%rcx, %rcx
1454a0aed:     	je	0x1454a0b19 <.text+0x549fb19>
1454a0aef:     	movq	%rcx, %r8
1454a0af2:     	negq	%r8
1454a0af5:     	xorl	%edx, %edx
1454a0af7:     	movq	%rax, %r9
1454a0afa:     	nopw	(%rax,%rax)
1454a0b00:     	cmpl	$0x7, (%r9)
1454a0b04:     	je	0x1454a1c78 <.text+0x54a0c78>
1454a0b0a:     	incq	%rdx
1454a0b0d:     	addq	$0x18, %r9
1454a0b11:     	movq	%r8, %r10
1454a0b14:     	addq	%rdx, %r10
1454a0b17:     	jne	0x1454a0b00 <.text+0x549fb00>
1454a0b19:     	movq	%r12, %rcx
1454a0b1c:     	callq	0x14549e650 <.text+0x549d650>
1454a0b21:     	movss	0x110(%r12), %xmm1
1454a0b2b:     	addss	%xmm10, %xmm1
1454a0b30:     	movss	0x114(%r12), %xmm0
1454a0b3a:     	movaps	%xmm0, %xmm2
1454a0b3d:     	maxss	%xmm9, %xmm2
1454a0b42:     	movaps	%xmm2, %xmm3
1454a0b45:     	cmpunordss	%xmm2, %xmm3
1454a0b4a:     	movaps	%xmm3, %xmm4
1454a0b4d:     	andnps	%xmm2, %xmm4
1454a0b50:     	andps	%xmm0, %xmm3
1454a0b53:     	orps	%xmm4, %xmm3
1454a0b56:     	movq	$0x0, 0x110(%r12)
1454a0b62:     	movaps	%xmm1, %xmm2
1454a0b65:     	minss	%xmm3, %xmm2
1454a0b69:     	movaps	%xmm2, %xmm0
1454a0b6c:     	cmpunordss	%xmm2, %xmm0
1454a0b71:     	movaps	%xmm0, %xmm3
1454a0b74:     	andnps	%xmm2, %xmm3
1454a0b77:     	andps	%xmm1, %xmm0
1454a0b7a:     	orps	%xmm3, %xmm0
1454a0b7d:     	xorps	%xmm1, %xmm1
1454a0b80:     	ucomiss	%xmm0, %xmm1
1454a0b83:     	jae	0x1454a0bdb <.text+0x549fbdb>
1454a0b85:     	cmpq	$0x0, 0x718(%r12)
1454a0b8e:     	je	0x1454a0bdb <.text+0x549fbdb>
1454a0b90:     	movl	0x408(%r12), %eax
1454a0b98:     	movl	%eax, 0x4c(%rbp)
1454a0b9b:     	movq	0x400(%r12), %rax
1454a0ba3:     	movq	%rax, 0x44(%rbp)
1454a0ba7:     	movl	$0x0, 0x40(%rbp)
1454a0bae:     	movq	$0x0, 0x38(%rbp)
1454a0bb6:     	movss	%xmm0, 0x50(%rbp)
1454a0bbb:     	movl	$0x600, 0x54(%rbp)      # imm = 0x600
1454a0bc2:     	movw	$0x0, 0x58(%rbp)
1454a0bc8:     	movb	$0x0, 0x5a(%rbp)
1454a0bcc:     	leaq	0x38(%rbp), %rdx
1454a0bd0:     	movq	%r12, %rcx
1454a0bd3:     	xorl	%r8d, %r8d
1454a0bd6:     	callq	0x1454cba10 <.text+0x54caa10>
1454a0bdb:     	movl	%r14d, %r9d
1454a0bde:     	jmp	0x1454a0c29 <.text+0x549fc29>
1454a0be0:     	movss	0x110(%r12), %xmm0
1454a0bea:     	addss	%xmm10, %xmm0
1454a0bef:     	movss	%xmm0, 0x110(%r12)
1454a0bf9:     	movss	0x114(%r12), %xmm0
1454a0c03:     	movaps	%xmm0, %xmm1
1454a0c06:     	maxss	%xmm9, %xmm1
1454a0c0b:     	movaps	%xmm1, %xmm2
1454a0c0e:     	cmpunordss	%xmm1, %xmm2
1454a0c13:     	movaps	%xmm2, %xmm3
1454a0c16:     	andnps	%xmm1, %xmm3
1454a0c19:     	andps	%xmm0, %xmm2
1454a0c1c:     	orps	%xmm3, %xmm2
1454a0c1f:     	movss	%xmm2, 0x114(%r12)
1454a0c29:     	movss	0x418(%r12), %xmm0
1454a0c33:     	subss	%xmm7, %xmm0
1454a0c37:     	movss	%xmm0, 0x418(%r12)
1454a0c41:     	movss	%xmm8, 0x4d4(%r12)
1454a0c4b:     	xorps	%xmm9, %xmm9
1454a0c4f:     	cvtss2sd	%xmm7, %xmm9
1454a0c54:     	movsd	0x630(%r12), %xmm0
1454a0c5e:     	addsd	%xmm9, %xmm0
1454a0c63:     	movsd	%xmm0, 0x630(%r12)
1454a0c6d:     	imulq	$0x160, 0x4e8(%r12), %rdx # imm = 0x160
1454a0c79:     	movq	0x4e0(%r12), %rax
1454a0c81:     	xorl	%ecx, %ecx
1454a0c83:     	leaq	0x1555d2a(%rip), %r14   # 0x1469f69b4
1454a0c8a:     	movq	%rax, %r8
1454a0c8d:     	nopl	(%rax)
1454a0c90:     	cmpq	%rcx, %rdx
1454a0c93:     	je	0x1454a0cd3 <.text+0x549fcd3>
1454a0c95:     	addq	$0x160, %rcx            # imm = 0x160
1454a0c9c:     	cmpq	%r13, 0x88(%r8)
1454a0ca3:     	leaq	0x160(%r8), %r8
1454a0caa:     	jne	0x1454a0c90 <.text+0x549fc90>
1454a0cac:     	cmpq	$-0x1, -0x148(%rax,%rcx)
1454a0cb5:     	je	0x1454a0cda <.text+0x549fcda>
1454a0cb7:     	leaq	0x1555d04(%rip), %rax   # 0x1469f69c2
1454a0cbe:     	leaq	0x1555cf3(%rip), %r14   # 0x1469f69b8
1454a0cc5:     	testb	%r9b, %r9b
1454a0cc8:     	cmovneq	%rax, %r14
1454a0ccc:     	movl	$0xa, %edi
1454a0cd1:     	jmp	0x1454a0d0c <.text+0x549fd0c>
1454a0cd3:     	movl	$0x4, %edi
1454a0cd8:     	jmp	0x1454a0d0c <.text+0x549fd0c>
1454a0cda:     	movzbl	-0x8(%rax,%rcx), %eax
1454a0cdf:     	leaq	0x1555cef(%rip), %rcx   # 0x1469f69d5
1454a0ce6:     	leaq	0x1555cdf(%rip), %rdx   # 0x1469f69cc
1454a0ced:     	testb	%r9b, %r9b
1454a0cf0:     	cmovneq	%rcx, %rdx
1454a0cf4:     	leaq	0x15555a1(%rip), %r14   # 0x1469f629c
1454a0cfb:     	testl	%eax, %eax
1454a0cfd:     	cmoveq	%rdx, %r14
1454a0d01:     	xorl	$0x1, %eax
1454a0d04:     	leaq	0x5(,%rax,4), %rdi
1454a0d0c:     	leaq	0x638(%r12), %rax
1454a0d14:     	movq	0x638(%r12), %rcx
1454a0d1c:     	testq	%rcx, %rcx
1454a0d1f:     	movb	%r9b, 0x9f(%rbp)
1454a0d26:     	je	0x1454a0e19 <.text+0x549fe19>
1454a0d2c:     	movq	%rax, 0x90(%rbp)
1454a0d33:     	movq	%r13, -0x28(%rbp)
1454a0d37:     	movq	%r15, -0x30(%rbp)
1454a0d3b:     	movq	%r12, -0x38(%rbp)
1454a0d3f:     	movq	0x640(%r12), %r13
1454a0d47:     	movzwl	0x112(%rcx), %ebx
1454a0d4e:     	movq	%rbx, -0x40(%rbp)
1454a0d52:     	shll	$0x4, %ebx
1454a0d55:     	movq	$-0x1, %r15
1454a0d5c:     	movq	%rcx, 0xa0(%rbp)
1454a0d63:     	nopw	%cs:(%rax,%rax)
1454a0d70:     	testq	%rbx, %rbx
1454a0d73:     	je	0x1454a0dbc <.text+0x549fdbc>
1454a0d75:     	leaq	0x10(%rcx), %rsi
1454a0d79:     	movq	(%rcx), %rdx
1454a0d7c:     	movq	0x8(%rcx), %r8
1454a0d80:     	movq	%rdi, %r12
1454a0d83:     	subq	%r8, %r12
1454a0d86:     	cmovbq	%rdi, %r8
1454a0d8a:     	movq	%r14, %rcx
1454a0d8d:     	callq	0x1457731e7 <.text+0x57721e7>
1454a0d92:     	cltq
1454a0d94:     	testl	%eax, %eax
1454a0d96:     	cmovneq	%rax, %r12
1454a0d9a:     	testq	%r12, %r12
1454a0d9d:     	sets	%cl
1454a0da0:     	setg	%al
1454a0da3:     	subb	%cl, %al
1454a0da5:     	incq	%r15
1454a0da8:     	addq	$-0x10, %rbx
1454a0dac:     	movq	%rsi, %rcx
1454a0daf:     	cmpb	$0x1, %al
1454a0db1:     	je	0x1454a0d70 <.text+0x549fd70>
1454a0db3:     	movzbl	%al, %eax
1454a0db6:     	testl	%eax, %eax
1454a0db8:     	je	0x1454a0de5 <.text+0x549fde5>
1454a0dba:     	jmp	0x1454a0dc0 <.text+0x549fdc0>
1454a0dbc:     	movq	-0x40(%rbp), %r15
1454a0dc0:     	movq	0x90(%rbp), %rax
1454a0dc7:     	movq	0xa0(%rbp), %rcx
1454a0dce:     	subq	$0x1, %r13
1454a0dd2:     	jb	0x1454a1ad0 <.text+0x54a0ad0>
1454a0dd8:     	movq	0x118(%rcx,%r15,8), %rcx
1454a0de0:     	jmp	0x1454a0d47 <.text+0x549fd47>
1454a0de5:     	movq	0xa0(%rbp), %rax
1454a0dec:     	movq	%rax, 0x40(%rbp)
1454a0df0:     	movq	%r13, 0x48(%rbp)
1454a0df4:     	movq	%r15, 0x50(%rbp)
1454a0df8:     	movq	0x90(%rbp), %rax
1454a0dff:     	movq	%rax, 0x58(%rbp)
1454a0e03:     	movq	$0x0, 0x38(%rbp)
1454a0e0b:     	movq	-0x38(%rbp), %r12
1454a0e0f:     	movq	-0x30(%rbp), %r15
1454a0e13:     	movq	-0x28(%rbp), %r13
1454a0e17:     	jmp	0x1454a0e2d <.text+0x549fe2d>
1454a0e19:     	movq	%r14, 0x38(%rbp)
1454a0e1d:     	movq	%rdi, 0x40(%rbp)
1454a0e21:     	movq	%rax, 0x48(%rbp)
1454a0e25:     	movq	$0x0, 0x50(%rbp)
1454a0e2d:     	leaq	0x38(%rbp), %rcx
1454a0e31:     	xorps	%xmm1, %xmm1
1454a0e34:     	callq	0x14552a410 <.text+0x5529410>
1454a0e39:     	addsd	(%rax), %xmm9
1454a0e3e:     	movsd	%xmm9, (%rax)
1454a0e43:     	movq	0x318(%r12), %rcx
1454a0e4b:     	testq	%rcx, %rcx
1454a0e4e:     	movzbl	0x9f(%rbp), %edx
1454a0e55:     	je	0x1454a0f40 <.text+0x549ff40>
1454a0e5b:     	movq	0x310(%r12), %rax
1454a0e63:     	cmpq	$0x1, %rcx
1454a0e67:     	jne	0x1454a0e76 <.text+0x549fe76>
1454a0e69:     	movss	0x4724db(%rip), %xmm2   # 0x14591334c
1454a0e71:     	xorl	%r8d, %r8d
1454a0e74:     	jmp	0x1454a0ed5 <.text+0x549fed5>
1454a0e76:     	movq	%rcx, %r9
1454a0e79:     	andq	$-0x2, %r9
1454a0e7d:     	movss	0x4724c7(%rip), %xmm2   # 0x14591334c
1454a0e85:     	xorl	%r8d, %r8d
1454a0e88:     	movq	%rax, %r10
1454a0e8b:     	jmp	0x1454a0e9d <.text+0x549fe9d>
1454a0e8d:     	nopl	(%rax)
1454a0e90:     	addq	$0x2, %r8
1454a0e94:     	addq	$0x30, %r10
1454a0e98:     	cmpq	%r8, %r9
1454a0e9b:     	je	0x1454a0ed0 <.text+0x549fed0>
1454a0e9d:     	movss	0x10(%r10), %xmm0
1454a0ea3:     	ucomiss	%xmm8, %xmm0
1454a0ea7:     	jbe	0x1454a0eb5 <.text+0x549feb5>
1454a0ea9:     	cmpl	$0xc, (%r10)
1454a0ead:     	jne	0x1454a0eb5 <.text+0x549feb5>
1454a0eaf:     	addss	0x4(%r10), %xmm2
1454a0eb5:     	movss	0x28(%r10), %xmm0
1454a0ebb:     	ucomiss	%xmm8, %xmm0
1454a0ebf:     	jbe	0x1454a0e90 <.text+0x549fe90>
1454a0ec1:     	cmpl	$0xc, 0x18(%r10)
1454a0ec6:     	jne	0x1454a0e90 <.text+0x549fe90>
1454a0ec8:     	addss	0x1c(%r10), %xmm2
1454a0ece:     	jmp	0x1454a0e90 <.text+0x549fe90>
1454a0ed0:     	testb	$0x1, %cl
1454a0ed3:     	je	0x1454a0ef6 <.text+0x549fef6>
1454a0ed5:     	leaq	(%r8,%r8,2), %r8
1454a0ed9:     	movss	0x10(%rax,%r8,8), %xmm0
1454a0ee0:     	ucomiss	%xmm8, %xmm0
1454a0ee4:     	jbe	0x1454a0ef6 <.text+0x549fef6>
1454a0ee6:     	leaq	(%rax,%r8,8), %r8
1454a0eea:     	cmpl	$0xc, (%r8)
1454a0eee:     	jne	0x1454a0ef6 <.text+0x549fef6>
1454a0ef0:     	addss	0x4(%r8), %xmm2
1454a0ef6:     	xorpd	%xmm0, %xmm0
1454a0efa:     	ucomiss	%xmm0, %xmm2
1454a0efd:     	jbe	0x1454a0f40 <.text+0x549ff40>
1454a0eff:     	testq	%r13, %r13
1454a0f02:     	sete	%r8b
1454a0f06:     	xorb	$0x1, %dl
1454a0f09:     	orb	%r8b, %dl
1454a0f0c:     	jne	0x1454a10c2 <.text+0x54a00c2>
1454a0f12:     	shlq	$0x3, %rcx
1454a0f16:     	leaq	(%rcx,%rcx,2), %rcx
1454a0f1a:     	xorl	%edx, %edx
1454a0f1c:     	nopl	(%rax)
1454a0f20:     	cmpq	%rdx, %rcx
1454a0f23:     	je	0x1454a1a7c <.text+0x54a0a7c>
1454a0f29:     	leaq	0x18(%rdx), %r8
1454a0f2d:     	cmpl	$0xc, (%rax,%rdx)
1454a0f31:     	movq	%r8, %rdx
1454a0f34:     	jne	0x1454a0f20 <.text+0x549ff20>
1454a0f36:     	movl	-0xc(%rax,%r8), %r9d
1454a0f3b:     	jmp	0x1454a1a82 <.text+0x54a0a82>
1454a0f40:     	testq	%r13, %r13
1454a0f43:     	je	0x1454a10c2 <.text+0x54a00c2>
1454a0f49:     	testb	%dl, %dl
1454a0f4b:     	je	0x1454a10c2 <.text+0x54a00c2>
1454a0f51:     	cmpb	$0x1, 0x9b9(%r12)
1454a0f5a:     	jne	0x1454a10c2 <.text+0x54a00c2>
1454a0f60:     	movq	0x6e8(%r12), %rdx
1454a0f68:     	testq	%rdx, %rdx
1454a0f6b:     	je	0x1454a1034 <.text+0x54a0034>
1454a0f71:     	movq	0x6e0(%r12), %rax
1454a0f79:     	cmpq	$0x1, %rdx
1454a0f7d:     	jne	0x1454a0f8b <.text+0x549ff8b>
1454a0f7f:     	movss	0x4723c5(%rip), %xmm0   # 0x14591334c
1454a0f87:     	xorl	%ecx, %ecx
1454a0f89:     	jmp	0x1454a0fda <.text+0x549ffda>
1454a0f8b:     	movq	%rdx, %r8
1454a0f8e:     	andq	$-0x2, %r8
1454a0f92:     	movss	0x4723b2(%rip), %xmm0   # 0x14591334c
1454a0f9a:     	xorl	%ecx, %ecx
1454a0f9c:     	jmp	0x1454a0fa9 <.text+0x549ffa9>
1454a0f9e:     	nop
1454a0fa0:     	addq	$0x2, %rcx
1454a0fa4:     	cmpq	%rcx, %r8
1454a0fa7:     	je	0x1454a0fd5 <.text+0x549ffd5>
1454a0fa9:     	cmpb	$0x16, (%rax,%rcx,8)
1454a0fad:     	je	0x1454a0fc0 <.text+0x549ffc0>
1454a0faf:     	cmpb	$0x16, 0x8(%rax,%rcx,8)
1454a0fb4:     	jne	0x1454a0fa0 <.text+0x549ffa0>
1454a0fb6:     	jmp	0x1454a0fcd <.text+0x549ffcd>
1454a0fb8:     	nopl	(%rax,%rax)
1454a0fc0:     	addss	0x4(%rax,%rcx,8), %xmm0
1454a0fc6:     	cmpb	$0x16, 0x8(%rax,%rcx,8)
1454a0fcb:     	jne	0x1454a0fa0 <.text+0x549ffa0>
1454a0fcd:     	addss	0xc(%rax,%rcx,8), %xmm0
1454a0fd3:     	jmp	0x1454a0fa0 <.text+0x549ffa0>
1454a0fd5:     	testb	$0x1, %dl
1454a0fd8:     	je	0x1454a0fe6 <.text+0x549ffe6>
1454a0fda:     	cmpb	$0x16, (%rax,%rcx,8)
1454a0fde:     	jne	0x1454a0fe6 <.text+0x549ffe6>
1454a0fe0:     	addss	0x4(%rax,%rcx,8), %xmm0
1454a0fe6:     	xorps	%xmm1, %xmm1
1454a0fe9:     	ucomiss	%xmm1, %xmm6
1454a0fec:     	jbe	0x1454a1034 <.text+0x54a0034>
1454a0fee:     	ucomiss	%xmm1, %xmm0
1454a0ff1:     	jbe	0x1454a1034 <.text+0x54a0034>
1454a0ff3:     	mulss	%xmm0, %xmm6
1454a0ff7:     	movzbl	0x129(%r12), %ebx
1454a1000:     	movb	$0x3, 0x129(%r12)
1454a1009:     	movb	$0x0, 0x30(%rsp)
1454a100e:     	movb	$0x0, 0x28(%rsp)
1454a1013:     	movb	$0x3, 0x20(%rsp)
1454a1018:     	movq	%r12, %rcx
1454a101b:     	movq	%r13, %rdx
1454a101e:     	movaps	%xmm6, %xmm2
1454a1021:     	movl	$0x1d3, %r9d            # imm = 0x1D3
1454a1027:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454a102c:     	movb	%bl, 0x129(%r12)
1454a1034:     	movl	0x408(%r12), %eax
1454a103c:     	movl	%eax, 0x4c(%rbp)
1454a103f:     	movq	0x400(%r12), %rax
1454a1047:     	movq	%rax, 0x44(%rbp)
1454a104b:     	movl	$0x0, 0x18(%rbp)
1454a1052:     	movq	%r13, 0x10(%rbp)
1454a1056:     	movq	0x400(%r12), %rax
1454a105e:     	movq	%rax, 0x1c(%rbp)
1454a1062:     	movl	0x408(%r12), %eax
1454a106a:     	movl	%eax, 0x24(%rbp)
1454a106d:     	movss	%xmm7, 0x28(%rbp)
1454a1072:     	movl	$0x400, 0x2c(%rbp)      # imm = 0x400
1454a1079:     	movw	$0x0, 0x30(%rbp)
1454a107f:     	movb	$0x0, 0x32(%rbp)
1454a1083:     	leaq	0x10(%rbp), %rdx
1454a1087:     	movq	%r12, %rcx
1454a108a:     	xorl	%r8d, %r8d
1454a108d:     	callq	0x1454cba10 <.text+0x54caa10>
1454a1092:     	movl	$0x0, 0x40(%rbp)
1454a1099:     	movq	%r13, 0x38(%rbp)
1454a109d:     	movss	%xmm7, 0x50(%rbp)
1454a10a2:     	movl	$0x500, 0x54(%rbp)      # imm = 0x500
1454a10a9:     	movw	$0x0, 0x58(%rbp)
1454a10af:     	movb	$0x0, 0x5a(%rbp)
1454a10b3:     	leaq	0x38(%rbp), %rdx
1454a10b7:     	movq	%r12, %rcx
1454a10ba:     	xorl	%r8d, %r8d
1454a10bd:     	callq	0x1454cba10 <.text+0x54caa10>
1454a10c2:     	movss	0x418(%r12), %xmm6
1454a10cc:     	cmpb	$0x0, 0x9b4(%r12)
1454a10d5:     	je	0x1454a10e9 <.text+0x54a00e9>
1454a10d7:     	maxss	0x4663b1(%rip), %xmm6   # 0x145907490
1454a10df:     	movss	%xmm6, 0x418(%r12)
1454a10e9:     	xorps	%xmm7, %xmm7
1454a10ec:     	ucomiss	%xmm6, %xmm7
1454a10ef:     	jae	0x1454a1249 <.text+0x54a0249>
1454a10f5:     	movss	0x418(%r12), %xmm0
1454a10ff:     	movss	0x470(%r12), %xmm6
1454a1109:     	maxss	%xmm7, %xmm0
1454a110d:     	callq	0x14577327d <.text+0x577227d>
1454a1112:     	cvttss2si	%xmm0, %rbx
1454a1117:     	xorl	%esi, %esi
1454a1119:     	ucomiss	%xmm7, %xmm0
1454a111c:     	cmovbl	%esi, %ebx
1454a111f:     	movss	0x466404(%rip), %xmm8   # 0x14590752c
1454a1128:     	ucomiss	%xmm8, %xmm0
1454a112c:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454a1132:     	cmoval	%r14d, %ebx
1454a1136:     	movaps	%xmm6, %xmm0
1454a1139:     	callq	0x14577327d <.text+0x577227d>
1454a113e:     	cvttss2si	%xmm0, %rdi
1454a1143:     	ucomiss	%xmm7, %xmm0
1454a1146:     	cmovbl	%esi, %edi
1454a1149:     	ucomiss	%xmm8, %xmm0
1454a114d:     	cmoval	%r14d, %edi
1454a1151:     	leaq	0x8d8(%r12), %r14
1454a1159:     	movq	0x8d8(%r12), %rax
1454a1161:     	testq	%rax, %rax
1454a1164:     	je	0x1454a146e <.text+0x54a046e>
1454a116a:     	movq	0x8e0(%r12), %rcx
1454a1172:     	movw	$0x16, %dx
1454a1176:     	movzwl	0x36(%rax), %r9d
1454a117b:     	movl	%r9d, %r10d
1454a117e:     	addl	%r10d, %r10d
1454a1181:     	movq	$-0x1, %r8
1454a1188:     	nopl	(%rax,%rax)
1454a1190:     	testq	%r10, %r10
1454a1193:     	je	0x1454a11bb <.text+0x54a01bb>
1454a1195:     	cmpw	0x3a(%rax,%r8,2), %dx
1454a119b:     	seta	%r11b
1454a119f:     	sbbb	$0x0, %r11b
1454a11a3:     	incq	%r8
1454a11a6:     	addq	$-0x2, %r10
1454a11aa:     	cmpb	$0x1, %r11b
1454a11ae:     	je	0x1454a1190 <.text+0x54a0190>
1454a11b0:     	movzbl	%r11b, %r9d
1454a11b4:     	testl	%r9d, %r9d
1454a11b7:     	je	0x1454a11cf <.text+0x54a01cf>
1454a11b9:     	jmp	0x1454a11be <.text+0x54a01be>
1454a11bb:     	movq	%r9, %r8
1454a11be:     	subq	$0x1, %rcx
1454a11c2:     	jb	0x1454a1470 <.text+0x54a0470>
1454a11c8:     	movq	0x50(%rax,%r8,8), %rax
1454a11cd:     	jmp	0x1454a1176 <.text+0x54a0176>
1454a11cf:     	movl	%ebx, 0x8(%rax,%r8,4)
1454a11d4:     	movq	(%r14), %rax
1454a11d7:     	testq	%rax, %rax
1454a11da:     	je	0x1454a14a8 <.text+0x54a04a8>
1454a11e0:     	movq	0x8e0(%r12), %rcx
1454a11e8:     	movw	$0x1c, %dx
1454a11ec:     	movzwl	0x36(%rax), %r9d
1454a11f1:     	movl	%r9d, %r10d
1454a11f4:     	addl	%r10d, %r10d
1454a11f7:     	movq	$-0x1, %r8
1454a11fe:     	nop
1454a1200:     	testq	%r10, %r10
1454a1203:     	je	0x1454a122b <.text+0x54a022b>
1454a1205:     	cmpw	0x3a(%rax,%r8,2), %dx
1454a120b:     	seta	%r11b
1454a120f:     	sbbb	$0x0, %r11b
1454a1213:     	incq	%r8
1454a1216:     	addq	$-0x2, %r10
1454a121a:     	cmpb	$0x1, %r11b
1454a121e:     	je	0x1454a1200 <.text+0x54a0200>
1454a1220:     	movzbl	%r11b, %r9d
1454a1224:     	testl	%r9d, %r9d
1454a1227:     	je	0x1454a123f <.text+0x54a023f>
1454a1229:     	jmp	0x1454a122e <.text+0x54a022e>
1454a122b:     	movq	%r9, %r8
1454a122e:     	subq	$0x1, %rcx
1454a1232:     	jb	0x1454a14aa <.text+0x54a04aa>
1454a1238:     	movq	0x50(%rax,%r8,8), %rax
1454a123d:     	jmp	0x1454a11ec <.text+0x54a01ec>
1454a123f:     	movl	%edi, 0x8(%rax,%r8,4)
1454a1244:     	jmp	0x1454a14d6 <.text+0x54a04d6>
1454a1249:     	movq	0x390(%r12), %rax
1454a1251:     	cmpl	$0xb, 0x68(%rax)
1454a1255:     	jne	0x1454a151a <.text+0x54a051a>
1454a125b:     	movss	0x39c(%r12), %xmm0
1454a1265:     	xorps	%xmm1, %xmm1
1454a1268:     	ucomiss	%xmm1, %xmm0
1454a126b:     	ja	0x1454a151a <.text+0x54a051a>
1454a1271:     	movl	0x398(%r12), %ecx
1454a1279:     	movl	0x3a8(%r12), %edx
1454a1281:     	movl	0x3c4(%r12), %r8d
1454a1289:     	movl	%r8d, 0x6c(%rbp)
1454a128d:     	movups	0x3b4(%r12), %xmm1
1454a1296:     	movups	%xmm1, 0x5c(%rbp)
1454a129a:     	movups	0x3c8(%r12), %xmm1
1454a12a3:     	movups	0x3d4(%r12), %xmm2
1454a12ac:     	movups	%xmm2, 0x7c(%rbp)
1454a12b0:     	movups	%xmm1, 0x70(%rbp)
1454a12b4:     	movq	%rax, 0x38(%rbp)
1454a12b8:     	movl	%ecx, 0x40(%rbp)
1454a12bb:     	movss	%xmm0, 0x44(%rbp)
1454a12c0:     	movsd	0x3a0(%r12), %xmm0
1454a12ca:     	movsd	%xmm0, 0x48(%rbp)
1454a12cf:     	movl	%edx, 0x50(%rbp)
1454a12d2:     	movsd	0x3ac(%r12), %xmm0
1454a12dc:     	movsd	%xmm0, 0x54(%rbp)
1454a12e1:     	movl	$0x3f800000, 0x418(%r12) # imm = 0x3F800000
1454a12ed:     	leaq	0x38(%rbp), %rdx
1454a12f1:     	movq	%r12, %rcx
1454a12f4:     	callq	0x1454f9bf0 <.text+0x54f8bf0>
1454a12f9:     	testb	%al, %al
1454a12fb:     	je	0x1454a1510 <.text+0x54a0510>
1454a1301:     	movq	0x390(%r12), %rax
1454a1309:     	movss	0x48(%rax), %xmm0
1454a130e:     	mulss	0x4773da(%rip), %xmm0   # 0x1459186f0
1454a1316:     	mulss	0x3a4(%r12), %xmm0
1454a1320:     	mulss	0x3cc(%r12), %xmm0
1454a132a:     	mulss	0x478(%r12), %xmm0
1454a1334:     	maxss	0x4682a4(%rip), %xmm0   # 0x1459095e0
1454a133c:     	movss	%xmm0, 0x39c(%r12)
1454a1346:     	mulss	0x4745ca(%rip), %xmm0   # 0x145915918
1454a134e:     	cvttss2si	%xmm0, %rcx
1454a1353:     	xorl	%edx, %edx
1454a1355:     	xorps	%xmm1, %xmm1
1454a1358:     	ucomiss	%xmm1, %xmm0
1454a135b:     	cmovael	%ecx, %edx
1454a135e:     	movl	0x40(%rax), %ebx
1454a1361:     	ucomiss	0x4661c4(%rip), %xmm0   # 0x14590752c
1454a1368:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a136d:     	cmovbel	%edx, %eax
1454a1370:     	leaq	0x550(%r12), %rdi
1454a1378:     	movq	0x3e8(%r12), %rdx
1454a1380:     	movl	%ebx, (%rbp)
1454a1383:     	movl	%eax, 0x4(%rbp)
1454a1386:     	leaq	0x10(%rbp), %rcx
1454a138a:     	movq	%rbp, %r8
1454a138d:     	movl	$0x1, %r9d
1454a1393:     	callq	0x14545d760 <.text+0x545c760>
1454a1398:     	movq	0x560(%r12), %rsi
1454a13a0:     	cmpq	0x550(%r12), %rsi
1454a13a8:     	jne	0x1454a13b3 <.text+0x54a03b3>
1454a13aa:     	movq	%rdi, %rcx
1454a13ad:     	callq	0x145774710 <.text+0x5773710>
1454a13b2:     	nop
1454a13b3:     	movq	0x558(%r12), %rax
1454a13bb:     	movq	%rsi, %rcx
1454a13be:     	shlq	$0x5, %rcx
1454a13c2:     	movups	0x10(%rbp), %xmm0
1454a13c6:     	movups	0x20(%rbp), %xmm1
1454a13ca:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a13cf:     	movups	%xmm0, (%rax,%rcx)
1454a13d3:     	incq	%rsi
1454a13d6:     	movq	%rsi, 0x560(%r12)
1454a13de:     	movq	0x3e8(%r12), %rsi
1454a13e6:     	callq	0x140002200 <.text+0x1200>
1454a13eb:     	movl	$0x20, %ecx
1454a13f0:     	movl	$0x1, %edx
1454a13f5:     	callq	0x1400021c0 <.text+0x11c0>
1454a13fa:     	testq	%rax, %rax
1454a13fd:     	je	0x1454a1e0d <.text+0x54a0e0d>
1454a1403:     	movl	%ebx, (%rax)
1454a1405:     	movq	%rax, 0xa0(%rbp)
1454a140c:     	movq	%rsi, 0x4(%rax)
1454a1410:     	movq	0x560(%r12), %rsi
1454a1418:     	cmpq	0x550(%r12), %rsi
1454a1420:     	jne	0x1454a142b <.text+0x54a042b>
1454a1422:     	movq	%rdi, %rcx
1454a1425:     	callq	0x145774710 <.text+0x5773710>
1454a142a:     	nop
1454a142b:     	movq	0x558(%r12), %rax
1454a1433:     	movq	%rsi, %rcx
1454a1436:     	shlq	$0x5, %rcx
1454a143a:     	movq	$0x20, (%rax,%rcx)
1454a1442:     	movq	0xa0(%rbp), %rdx
1454a1449:     	movq	%rdx, 0x8(%rax,%rcx)
1454a144e:     	movq	$0xc, 0x10(%rax,%rcx)
1454a1457:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454a145e:     	incq	%rsi
1454a1461:     	movq	%rsi, 0x560(%r12)
1454a1469:     	jmp	0x1454a10f5 <.text+0x54a00f5>
1454a146e:     	xorl	%eax, %eax
1454a1470:     	movq	%r14, 0x38(%rbp)
1454a1474:     	movq	%rax, 0x40(%rbp)
1454a1478:     	movq	$0x0, 0x48(%rbp)
1454a1480:     	movq	%r8, 0x50(%rbp)
1454a1484:     	movq	$0x16, 0x58(%rbp)
1454a148c:     	leaq	0x10(%rbp), %rcx
1454a1490:     	leaq	0x38(%rbp), %rdx
1454a1494:     	movl	%ebx, %r8d
1454a1497:     	callq	0x14552a730 <.text+0x5529730>
1454a149c:     	movq	(%r14), %rax
1454a149f:     	testq	%rax, %rax
1454a14a2:     	jne	0x1454a11e0 <.text+0x54a01e0>
1454a14a8:     	xorl	%eax, %eax
1454a14aa:     	movq	%r14, 0x38(%rbp)
1454a14ae:     	movq	%rax, 0x40(%rbp)
1454a14b2:     	movq	$0x0, 0x48(%rbp)
1454a14ba:     	movq	%r8, 0x50(%rbp)
1454a14be:     	movq	$0x1c, 0x58(%rbp)
1454a14c6:     	leaq	0x10(%rbp), %rcx
1454a14ca:     	leaq	0x38(%rbp), %rdx
1454a14ce:     	movl	%edi, %r8d
1454a14d1:     	callq	0x14552a730 <.text+0x5529730>
1454a14d6:     	movaps	0xb0(%rbp), %xmm6
1454a14dd:     	movaps	0xc0(%rbp), %xmm7
1454a14e4:     	movaps	0xd0(%rbp), %xmm8
1454a14ec:     	movaps	0xe0(%rbp), %xmm9
1454a14f4:     	movaps	0xf0(%rbp), %xmm10
1454a14fc:     	addq	$0x188, %rsp            # imm = 0x188
1454a1503:     	popq	%rbx
1454a1504:     	popq	%rdi
1454a1505:     	popq	%rsi
1454a1506:     	popq	%r12
1454a1508:     	popq	%r13
1454a150a:     	popq	%r14
1454a150c:     	popq	%r15
1454a150e:     	popq	%rbp
1454a150f:     	retq
1454a1510:     	movss	%xmm6, 0x418(%r12)
1454a151a:     	movss	0x934(%r12), %xmm6
1454a1524:     	movq	0x718(%r12), %rcx
1454a152c:     	testq	%rcx, %rcx
1454a152f:     	je	0x1454a1753 <.text+0x54a0753>
1454a1535:     	movq	0x710(%r12), %rax
1454a153d:     	cmpb	$0x13, (%rax)
1454a1540:     	jne	0x1454a172c <.text+0x54a072c>
1454a1546:     	movss	0x118(%r12), %xmm0
1454a1550:     	ucomiss	%xmm6, %xmm0
1454a1553:     	ja	0x1454a1753 <.text+0x54a0753>
1454a1559:     	movss	0xc(%rax), %xmm8
1454a155f:     	movss	0x8(%rax), %xmm0
1454a1564:     	movss	0x4(%rax), %xmm1
1454a1569:     	addss	%xmm6, %xmm1
1454a156d:     	movss	%xmm1, 0x118(%r12)
1454a1577:     	mulss	0x470(%r12), %xmm0
1454a1581:     	movss	%xmm0, 0x418(%r12)
1454a158b:     	leaq	0x130(%r12), %rdx
1454a1593:     	leaq	0x10(%rbp), %rcx
1454a1597:     	callq	0x145728850 <.text+0x5727850>
1454a159c:     	leaq	0x550(%r12), %rbx
1454a15a4:     	xorps	%xmm0, %xmm0
1454a15a7:     	ucomiss	%xmm0, %xmm8
1454a15ab:     	jbe	0x1454a1af1 <.text+0x54a0af1>
1454a15b1:     	movq	0x3e8(%r12), %rdx
1454a15b9:     	movq	%rdx, -0x8(%rbp)
1454a15bd:     	movl	$0x2, (%rbp)
1454a15c4:     	movl	$0x0, -0x18(%rbp)
1454a15cb:     	leaq	-0x18(%rbp), %rax
1454a15cf:     	movq	%rax, 0x30(%rsp)
1454a15d4:     	movq	%rbp, %rax
1454a15d7:     	movq	%rax, 0x28(%rsp)
1454a15dc:     	movq	$0x1, 0x20(%rsp)
1454a15e5:     	leaq	0x38(%rbp), %rcx
1454a15e9:     	leaq	-0x8(%rbp), %r9
1454a15ed:     	movl	$0x740, %r8d            # imm = 0x740
1454a15f3:     	callq	0x145466ab0 <.text+0x5465ab0>
1454a15f8:     	nop
1454a15f9:     	movq	0x560(%r12), %rsi
1454a1601:     	cmpq	0x550(%r12), %rsi
1454a1609:     	jne	0x1454a1614 <.text+0x54a0614>
1454a160b:     	movq	%rbx, %rcx
1454a160e:     	callq	0x145774710 <.text+0x5773710>
1454a1613:     	nop
1454a1614:     	movq	0x558(%r12), %rax
1454a161c:     	movq	%rsi, %rcx
1454a161f:     	shlq	$0x5, %rcx
1454a1623:     	movups	0x38(%rbp), %xmm0
1454a1627:     	movups	0x48(%rbp), %xmm1
1454a162b:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a1630:     	movups	%xmm0, (%rax,%rcx)
1454a1634:     	incq	%rsi
1454a1637:     	movq	%rsi, 0x560(%r12)
1454a163f:     	movq	0x318(%r12), %rsi
1454a1647:     	cmpq	0x308(%r12), %rsi
1454a164f:     	jne	0x1454a165a <.text+0x54a065a>
1454a1651:     	movq	%r15, %rcx
1454a1654:     	callq	0x14577ffc0 <.text+0x577efc0>
1454a1659:     	nop
1454a165a:     	addss	%xmm8, %xmm6
1454a165f:     	movq	0x310(%r12), %rax
1454a1667:     	leaq	(%rsi,%rsi,2), %rcx
1454a166b:     	movl	$0xb, (%rax,%rcx,8)
1454a1672:     	movl	$0x740, 0xc(%rax,%rcx,8) # imm = 0x740
1454a167a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
1454a1680:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454a1688:     	incq	%rsi
1454a168b:     	movq	%rsi, 0x318(%r12)
1454a1693:     	movq	%r12, %rcx
1454a1696:     	callq	0x14549e650 <.text+0x549d650>
1454a169b:     	nop
1454a169c:     	movq	0x18(%rbp), %rdi
1454a16a0:     	movq	0x20(%rbp), %r14
1454a16a4:     	leaq	0x1555708(%rip), %r15   # 0x1469f6db3
1454a16ab:     	movl	$0x10, %esi
1454a16b0:     	movl	$0x10, %edx
1454a16b5:     	movq	%r15, %rcx
1454a16b8:     	callq	0x145457cb0 <.text+0x5456cb0>
1454a16bd:     	nop
1454a16be:     	testq	%rax, %rax
1454a16c1:     	cmovneq	%rax, %r15
1454a16c5:     	cmoveq	%rsi, %rdx
1454a16c9:     	movq	%rdx, 0x20(%rsp)
1454a16ce:     	leaq	0x38(%rbp), %rcx
1454a16d2:     	movq	%rdi, %rdx
1454a16d5:     	movq	%r14, %r8
1454a16d8:     	movq	%r15, %r9
1454a16db:     	callq	0x145459d40 <.text+0x5458d40>
1454a16e0:     	nop
1454a16e1:     	movq	0x560(%r12), %rsi
1454a16e9:     	cmpq	0x550(%r12), %rsi
1454a16f1:     	jne	0x1454a16fc <.text+0x54a06fc>
1454a16f3:     	movq	%rbx, %rcx
1454a16f6:     	callq	0x145774710 <.text+0x5773710>
1454a16fb:     	nop
1454a16fc:     	movq	0x558(%r12), %rax
1454a1704:     	movq	%rsi, %rcx
1454a1707:     	shlq	$0x5, %rcx
1454a170b:     	movups	0x38(%rbp), %xmm0
1454a170f:     	movups	0x48(%rbp), %xmm1
1454a1713:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a1718:     	movups	%xmm0, (%rax,%rcx)
1454a171c:     	incq	%rsi
1454a171f:     	movq	%rsi, 0x560(%r12)
1454a1727:     	jmp	0x1454a1c58 <.text+0x54a0c58>
1454a172c:     	cmpq	$0x1, %rcx
1454a1730:     	je	0x1454a1753 <.text+0x54a0753>
1454a1732:     	shlq	$0x6, %rcx
1454a1736:     	addq	$0x40, %rax
1454a173a:     	addq	$-0x40, %rcx
1454a173e:     	nop
1454a1740:     	cmpb	$0x13, (%rax)
1454a1743:     	je	0x1454a1546 <.text+0x54a0546>
1454a1749:     	addq	$0x40, %rax
1454a174d:     	addq	$-0x40, %rcx
1454a1751:     	jne	0x1454a1740 <.text+0x54a0740>
1454a1753:     	movl	0x4c0(%r12), %eax
1454a175b:     	testl	%eax, %eax
1454a175d:     	je	0x1454a19cd <.text+0x54a09cd>
1454a1763:     	decl	%eax
1454a1765:     	movl	%eax, 0x4c0(%r12)
1454a176d:     	movss	0x470(%r12), %xmm0
1454a1777:     	mulss	0x465d19(%rip), %xmm0   # 0x145907498
1454a177f:     	movss	%xmm0, 0x418(%r12)
1454a1789:     	leaq	0x550(%r12), %rdi
1454a1791:     	movq	0x3e8(%r12), %rdx
1454a1799:     	movq	%rdx, -0x18(%rbp)
1454a179d:     	movl	$0x2, 0x10(%rbp)
1454a17a4:     	movl	$0x0, (%rbp)
1454a17ab:     	movq	%rbp, %r15
1454a17ae:     	movq	%r15, 0x30(%rsp)
1454a17b3:     	leaq	0x10(%rbp), %rax
1454a17b7:     	movq	%rax, 0x28(%rsp)
1454a17bc:     	movq	$0x1, 0x20(%rsp)
1454a17c5:     	leaq	0x38(%rbp), %rcx
1454a17c9:     	leaq	-0x18(%rbp), %r9
1454a17cd:     	movl	$0x52b1, %r8d           # imm = 0x52B1
1454a17d3:     	callq	0x145466ab0 <.text+0x5465ab0>
1454a17d8:     	movq	0x560(%r12), %rsi
1454a17e0:     	cmpq	0x550(%r12), %rsi
1454a17e8:     	jne	0x1454a17f3 <.text+0x54a07f3>
1454a17ea:     	movq	%rdi, %rcx
1454a17ed:     	callq	0x145774710 <.text+0x5773710>
1454a17f2:     	nop
1454a17f3:     	movq	0x558(%r12), %rax
1454a17fb:     	movq	%rsi, %rcx
1454a17fe:     	shlq	$0x5, %rcx
1454a1802:     	movups	0x38(%rbp), %xmm0
1454a1806:     	movups	0x48(%rbp), %xmm1
1454a180a:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a180f:     	movups	%xmm0, (%rax,%rcx)
1454a1813:     	incq	%rsi
1454a1816:     	movq	%rsi, 0x560(%r12)
1454a181e:     	leaq	0x130(%r12), %rdx
1454a1826:     	leaq	0x10(%rbp), %rcx
1454a182a:     	callq	0x145728850 <.text+0x5727850>
1454a182f:     	movq	0x18(%rbp), %rax
1454a1833:     	movq	%rax, 0xa0(%rbp)
1454a183a:     	movq	0x20(%rbp), %rbx
1454a183e:     	leaq	0x1555199(%rip), %r14   # 0x1469f69de
1454a1845:     	movl	$0x28, %esi
1454a184a:     	movl	$0x28, %edx
1454a184f:     	movq	%r14, %rcx
1454a1852:     	callq	0x145457cb0 <.text+0x5456cb0>
1454a1857:     	nop
1454a1858:     	testq	%rax, %rax
1454a185b:     	cmovneq	%rax, %r14
1454a185f:     	cmoveq	%rsi, %rdx
1454a1863:     	movq	%rdx, 0x20(%rsp)
1454a1868:     	leaq	0x38(%rbp), %rcx
1454a186c:     	movq	0xa0(%rbp), %rdx
1454a1873:     	movq	%rbx, %r8
1454a1876:     	movq	%r14, %r9
1454a1879:     	callq	0x145459d40 <.text+0x5458d40>
1454a187e:     	nop
1454a187f:     	movq	0x560(%r12), %rsi
1454a1887:     	cmpq	0x550(%r12), %rsi
1454a188f:     	jne	0x1454a189a <.text+0x54a089a>
1454a1891:     	movq	%rdi, %rcx
1454a1894:     	callq	0x145774710 <.text+0x5773710>
1454a1899:     	nop
1454a189a:     	movq	0x558(%r12), %rax
1454a18a2:     	movq	%rsi, %rcx
1454a18a5:     	shlq	$0x5, %rcx
1454a18a9:     	movups	0x38(%rbp), %xmm0
1454a18ad:     	movups	0x48(%rbp), %xmm1
1454a18b1:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a18b6:     	movups	%xmm0, (%rax,%rcx)
1454a18ba:     	incq	%rsi
1454a18bd:     	movq	%rsi, 0x560(%r12)
1454a18c5:     	movq	0x10(%rbp), %rdx
1454a18c9:     	testq	%rdx, %rdx
1454a18cc:     	movq	0xa0(%rbp), %rcx
1454a18d3:     	je	0x1454a18e0 <.text+0x54a08e0>
1454a18d5:     	movl	$0x1, %r8d
1454a18db:     	callq	0x1400021d0 <.text+0x11d0>
1454a18e0:     	movl	0x408(%r12), %eax
1454a18e8:     	movl	%eax, 0x8(%rbp)
1454a18eb:     	movq	0x400(%r12), %rax
1454a18f3:     	movq	%rax, (%rbp)
1454a18f7:     	movq	0x4e0(%r12), %rax
1454a18ff:     	imulq	$0x160, 0x4e8(%r12), %rcx # imm = 0x160
1454a190b:     	addq	%rax, %rcx
1454a190e:     	movq	%rax, 0x38(%rbp)
1454a1912:     	movq	%rcx, 0x40(%rbp)
1454a1916:     	leaq	-0x1c(%rbp), %rax
1454a191a:     	movq	%rax, 0x48(%rbp)
1454a191e:     	movq	%r15, 0x50(%rbp)
1454a1922:     	leaq	0x10(%rbp), %rcx
1454a1926:     	leaq	0x38(%rbp), %rdx
1454a192a:     	callq	0x1455405b0 <.text+0x553f5b0>
1454a192f:     	movq	0x10(%rbp), %rax
1454a1933:     	movq	%rax, 0x90(%rbp)
1454a193a:     	movq	0x18(%rbp), %rax
1454a193e:     	movq	%rax, 0xa0(%rbp)
1454a1945:     	movq	0x20(%rbp), %rsi
1454a1949:     	shlq	$0x3, %rsi
1454a194d:     	xorl	%edi, %edi
1454a194f:     	movss	0x473ef9(%rip), %xmm6   # 0x145915850
1454a1957:     	nopw	(%rax,%rax)
1454a1960:     	cmpq	%rdi, %rsi
1454a1963:     	je	0x1454a19a2 <.text+0x54a09a2>
1454a1965:     	movq	0xa0(%rbp), %rax
1454a196c:     	movq	(%rax,%rdi), %rdx
1454a1970:     	movss	0x474(%r12), %xmm2
1454a197a:     	mulss	%xmm6, %xmm2
1454a197e:     	addq	$0x8, %rdi
1454a1982:     	movb	$0x0, 0x30(%rsp)
1454a1987:     	movb	$0x0, 0x28(%rsp)
1454a198c:     	movb	$0x1, 0x20(%rsp)
1454a1991:     	movq	%r12, %rcx
1454a1994:     	movl	$0x3b85, %r9d           # imm = 0x3B85
1454a199a:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454a199f:     	nop
1454a19a0:     	jmp	0x1454a1960 <.text+0x54a0960>
1454a19a2:     	movq	0x90(%rbp), %rdx
1454a19a9:     	testq	%rdx, %rdx
1454a19ac:     	je	0x1454a10f5 <.text+0x54a00f5>
1454a19b2:     	shlq	$0x3, %rdx
1454a19b6:     	movl	$0x8, %r8d
1454a19bc:     	movq	0xa0(%rbp), %rcx
1454a19c3:     	callq	0x1400021d0 <.text+0x11d0>
1454a19c8:     	jmp	0x1454a10f5 <.text+0x54a00f5>
1454a19cd:     	movl	$0x0, 0x418(%r12)
1454a19d9:     	movb	$0x4, 0x9b9(%r12)
1454a19e2:     	movl	$0x1, 0x878(%r12)
1454a19ee:     	movss	%xmm6, 0x87c(%r12)
1454a19f8:     	movq	%r12, %rcx
1454a19fb:     	callq	0x1454a44d0 <.text+0x54a34d0>
1454a1a00:     	leaq	0x1555099(%rip), %r8    # 0x1469f6aa0
1454a1a07:     	leaq	0x38(%rbp), %rcx
1454a1a0b:     	movl	$0x6, %r9d
1454a1a11:     	movq	%r12, %rdx
1454a1a14:     	callq	0x1454c86f0 <.text+0x54c76f0>
1454a1a19:     	movq	0x578(%r12), %rsi
1454a1a21:     	cmpq	0x568(%r12), %rsi
1454a1a29:     	jne	0x1454a1a4f <.text+0x54a0a4f>
1454a1a2b:     	leaq	0x568(%r12), %rcx
1454a1a33:     	movq	0x38(%rbp), %rax
1454a1a37:     	movq	%rax, 0xa0(%rbp)
1454a1a3e:     	movq	0x40(%rbp), %rax
1454a1a42:     	movq	%rax, 0x90(%rbp)
1454a1a49:     	callq	0x1457745c0 <.text+0x57735c0>
1454a1a4e:     	nop
1454a1a4f:     	movq	0x570(%r12), %rax
1454a1a57:     	leaq	(%rsi,%rsi,2), %rcx
1454a1a5b:     	movq	0x48(%rbp), %rdx
1454a1a5f:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454a1a64:     	movups	0x38(%rbp), %xmm0
1454a1a68:     	movups	%xmm0, (%rax,%rcx,8)
1454a1a6c:     	incq	%rsi
1454a1a6f:     	movq	%rsi, 0x578(%r12)
1454a1a77:     	jmp	0x1454a10f5 <.text+0x54a00f5>
1454a1a7c:     	movl	$0x1d3, %r9d            # imm = 0x1D3
1454a1a82:     	movss	0x4b0(%r12), %xmm0
1454a1a8c:     	addss	0x4659fc(%rip), %xmm0   # 0x145907490
1454a1a94:     	mulss	%xmm0, %xmm2
1454a1a98:     	mulss	0x474(%r12), %xmm2
1454a1aa2:     	movb	$0x0, 0x30(%rsp)
1454a1aa7:     	movb	$0x0, 0x28(%rsp)
1454a1aac:     	movb	$0x3, 0x20(%rsp)
1454a1ab1:     	movq	%r12, %rcx
1454a1ab4:     	movq	%r13, %rdx
1454a1ab7:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454a1abc:     	cmpb	$0x1, 0x9b9(%r12)
1454a1ac5:     	je	0x1454a0f60 <.text+0x549ff60>
1454a1acb:     	jmp	0x1454a10c2 <.text+0x54a00c2>
1454a1ad0:     	movq	%rcx, 0x50(%rbp)
1454a1ad4:     	movq	$0x0, 0x58(%rbp)
1454a1adc:     	movq	%r15, 0x60(%rbp)
1454a1ae0:     	movq	%r14, 0x38(%rbp)
1454a1ae4:     	movq	%rdi, 0x40(%rbp)
1454a1ae8:     	movq	%rax, 0x48(%rbp)
1454a1aec:     	jmp	0x1454a0e0b <.text+0x549fe0b>
1454a1af1:     	movq	0x3e8(%r12), %rdx
1454a1af9:     	movq	%rdx, -0x8(%rbp)
1454a1afd:     	movl	$0x2, (%rbp)
1454a1b04:     	movl	$0x0, -0x18(%rbp)
1454a1b0b:     	leaq	-0x18(%rbp), %rax
1454a1b0f:     	movq	%rax, 0x30(%rsp)
1454a1b14:     	movq	%rbp, %rax
1454a1b17:     	movq	%rax, 0x28(%rsp)
1454a1b1c:     	movq	$0x1, 0x20(%rsp)
1454a1b25:     	leaq	0x38(%rbp), %rcx
1454a1b29:     	leaq	-0x8(%rbp), %r9
1454a1b2d:     	movl	$0x5072, %r8d           # imm = 0x5072
1454a1b33:     	callq	0x145466ab0 <.text+0x5465ab0>
1454a1b38:     	nop
1454a1b39:     	movq	0x560(%r12), %rsi
1454a1b41:     	cmpq	0x550(%r12), %rsi
1454a1b49:     	jne	0x1454a1b54 <.text+0x54a0b54>
1454a1b4b:     	movq	%rbx, %rcx
1454a1b4e:     	callq	0x145774710 <.text+0x5773710>
1454a1b53:     	nop
1454a1b54:     	movq	0x558(%r12), %rax
1454a1b5c:     	movq	%rsi, %rcx
1454a1b5f:     	shlq	$0x5, %rcx
1454a1b63:     	movups	0x38(%rbp), %xmm0
1454a1b67:     	movups	0x48(%rbp), %xmm1
1454a1b6b:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a1b70:     	movups	%xmm0, (%rax,%rcx)
1454a1b74:     	incq	%rsi
1454a1b77:     	movq	%rsi, 0x560(%r12)
1454a1b7f:     	movq	0x18(%rbp), %rdi
1454a1b83:     	movq	0x20(%rbp), %r14
1454a1b87:     	leaq	0x1555212(%rip), %r15   # 0x1469f6da0
1454a1b8e:     	movl	$0x13, %esi
1454a1b93:     	movl	$0x13, %edx
1454a1b98:     	movq	%r15, %rcx
1454a1b9b:     	callq	0x145457cb0 <.text+0x5456cb0>
1454a1ba0:     	nop
1454a1ba1:     	testq	%rax, %rax
1454a1ba4:     	cmovneq	%rax, %r15
1454a1ba8:     	cmoveq	%rsi, %rdx
1454a1bac:     	movq	%rdx, 0x20(%rsp)
1454a1bb1:     	leaq	0x38(%rbp), %rcx
1454a1bb5:     	movq	%rdi, %rdx
1454a1bb8:     	movq	%r14, %r8
1454a1bbb:     	movq	%r15, %r9
1454a1bbe:     	callq	0x145459d40 <.text+0x5458d40>
1454a1bc3:     	nop
1454a1bc4:     	movq	0x560(%r12), %rsi
1454a1bcc:     	cmpq	0x550(%r12), %rsi
1454a1bd4:     	jne	0x1454a1bdf <.text+0x54a0bdf>
1454a1bd6:     	movq	%rbx, %rcx
1454a1bd9:     	callq	0x145774710 <.text+0x5773710>
1454a1bde:     	nop
1454a1bdf:     	movq	0x558(%r12), %rax
1454a1be7:     	movq	%rsi, %rcx
1454a1bea:     	shlq	$0x5, %rcx
1454a1bee:     	movups	0x38(%rbp), %xmm0
1454a1bf2:     	movups	0x48(%rbp), %xmm1
1454a1bf6:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a1bfb:     	movups	%xmm0, (%rax,%rcx)
1454a1bff:     	incq	%rsi
1454a1c02:     	movq	%rsi, 0x560(%r12)
1454a1c0a:     	movl	0x408(%r12), %eax
1454a1c12:     	movl	%eax, 0x4c(%rbp)
1454a1c15:     	movq	0x400(%r12), %rax
1454a1c1d:     	movq	%rax, 0x44(%rbp)
1454a1c21:     	movl	$0x0, 0x40(%rbp)
1454a1c28:     	movw	$0x700, 0x54(%rbp)      # imm = 0x700
1454a1c2e:     	movq	$0x0, 0x38(%rbp)
1454a1c36:     	movl	$0x0, 0x50(%rbp)
1454a1c3d:     	movl	$0x0, 0x56(%rbp)
1454a1c44:     	movb	$0x0, 0x5a(%rbp)
1454a1c48:     	leaq	0x38(%rbp), %rdx
1454a1c4c:     	movq	%r12, %rcx
1454a1c4f:     	xorl	%r8d, %r8d
1454a1c52:     	callq	0x1454cba10 <.text+0x54caa10>
1454a1c57:     	nop
1454a1c58:     	movq	0x10(%rbp), %rdx
1454a1c5c:     	testq	%rdx, %rdx
1454a1c5f:     	je	0x1454a10f5 <.text+0x54a00f5>
1454a1c65:     	movl	$0x1, %r8d
1454a1c6b:     	movq	%rdi, %rcx
1454a1c6e:     	callq	0x1400021d0 <.text+0x11d0>
1454a1c73:     	jmp	0x1454a10f5 <.text+0x54a00f5>
1454a1c78:     	leaq	0x1(%rdx), %r11
1454a1c7c:     	cmpq	%rcx, %r11
1454a1c7f:     	jae	0x1454a1d18 <.text+0x54a0d18>
1454a1c85:     	movq	%rdx, %r8
1454a1c88:     	subq	%rcx, %r8
1454a1c8b:     	leaq	0x2(%r8), %r10
1454a1c8f:     	testb	$0x1, %r8b
1454a1c93:     	jne	0x1454a1d20 <.text+0x54a0d20>
1454a1c99:     	cmpl	$0x7, 0x18(%r9)
1454a1c9e:     	movq	%rdx, %r8
1454a1ca1:     	je	0x1454a1cbb <.text+0x54a0cbb>
1454a1ca3:     	leaq	0x18(%r9), %r8
1454a1ca7:     	movq	0x10(%r8), %r11
1454a1cab:     	movq	%r11, 0x10(%r9)
1454a1caf:     	movups	(%r8), %xmm0
1454a1cb3:     	movups	%xmm0, (%r9)
1454a1cb7:     	leaq	0x1(%rdx), %r8
1454a1cbb:     	addq	$0x2, %rdx
1454a1cbf:     	movq	%rdx, %r11
1454a1cc2:     	movq	%r8, %rdx
1454a1cc5:     	jmp	0x1454a1d20 <.text+0x54a0d20>
1454a1cc7:     	leaq	0x1(%r9), %rsi
1454a1ccb:     	cmpq	%rcx, %rsi
1454a1cce:     	jae	0x1454a1d93 <.text+0x54a0d93>
1454a1cd4:     	movq	%r9, %r8
1454a1cd7:     	subq	%rcx, %r8
1454a1cda:     	leaq	0x2(%r8), %r11
1454a1cde:     	testb	$0x1, %r8b
1454a1ce2:     	jne	0x1454a1d98 <.text+0x54a0d98>
1454a1ce8:     	movq	%r9, %r8
1454a1ceb:     	cmpl	%edx, 0x24(%r10)
1454a1cef:     	je	0x1454a1d09 <.text+0x54a0d09>
1454a1cf1:     	leaq	0x18(%r10), %r8
1454a1cf5:     	movq	0x10(%r8), %rsi
1454a1cf9:     	movq	%rsi, 0x10(%r10)
1454a1cfd:     	movups	(%r8), %xmm0
1454a1d01:     	movups	%xmm0, (%r10)
1454a1d05:     	leaq	0x1(%r9), %r8
1454a1d09:     	addq	$0x2, %r9
1454a1d0d:     	movq	%r9, %rsi
1454a1d10:     	movq	%r8, %r9
1454a1d13:     	jmp	0x1454a1d98 <.text+0x54a0d98>
1454a1d18:     	movq	%rdx, %r8
1454a1d1b:     	jmp	0x1454a1e00 <.text+0x54a0e00>
1454a1d20:     	testq	%r10, %r10
1454a1d23:     	je	0x1454a1e00 <.text+0x54a0e00>
1454a1d29:     	leaq	(%r11,%r11,2), %r8
1454a1d2d:     	leaq	(%rax,%r8,8), %r9
1454a1d31:     	subq	%r11, %rcx
1454a1d34:     	movq	%rdx, %r8
1454a1d37:     	jmp	0x1454a1d47 <.text+0x54a0d47>
1454a1d39:     	addq	$0x30, %r9
1454a1d3d:     	addq	$-0x2, %rcx
1454a1d41:     	je	0x1454a1e00 <.text+0x54a0e00>
1454a1d47:     	cmpl	$0x7, (%r9)
1454a1d4b:     	jne	0x1454a1d56 <.text+0x54a0d56>
1454a1d4d:     	cmpl	$0x7, 0x18(%r9)
1454a1d52:     	je	0x1454a1d39 <.text+0x54a0d39>
1454a1d54:     	jmp	0x1454a1d75 <.text+0x54a0d75>
1454a1d56:     	leaq	(%r8,%r8,2), %rdx
1454a1d5a:     	movq	0x10(%r9), %r10
1454a1d5e:     	movq	%r10, 0x10(%rax,%rdx,8)
1454a1d63:     	movups	(%r9), %xmm0
1454a1d67:     	movups	%xmm0, (%rax,%rdx,8)
1454a1d6b:     	incq	%r8
1454a1d6e:     	cmpl	$0x7, 0x18(%r9)
1454a1d73:     	je	0x1454a1d39 <.text+0x54a0d39>
1454a1d75:     	leaq	0x18(%r9), %rdx
1454a1d79:     	leaq	(%r8,%r8,2), %r10
1454a1d7d:     	movq	0x10(%rdx), %r11
1454a1d81:     	movq	%r11, 0x10(%rax,%r10,8)
1454a1d86:     	movups	(%rdx), %xmm0
1454a1d89:     	movups	%xmm0, (%rax,%r10,8)
1454a1d8e:     	incq	%r8
1454a1d91:     	jmp	0x1454a1d39 <.text+0x54a0d39>
1454a1d93:     	movq	%r9, %r8
1454a1d96:     	jmp	0x1454a1e00 <.text+0x54a0e00>
1454a1d98:     	testq	%r11, %r11
1454a1d9b:     	je	0x1454a1e00 <.text+0x54a0e00>
1454a1d9d:     	leaq	(%rsi,%rsi,2), %r8
1454a1da1:     	leaq	(%rax,%r8,8), %r10
1454a1da5:     	subq	%rsi, %rcx
1454a1da8:     	movq	%r9, %r8
1454a1dab:     	jmp	0x1454a1db7 <.text+0x54a0db7>
1454a1dad:     	addq	$0x30, %r10
1454a1db1:     	addq	$-0x2, %rcx
1454a1db5:     	je	0x1454a1e00 <.text+0x54a0e00>
1454a1db7:     	cmpl	%edx, 0xc(%r10)
1454a1dbb:     	jne	0x1454a1dc5 <.text+0x54a0dc5>
1454a1dbd:     	cmpl	%edx, 0x24(%r10)
1454a1dc1:     	je	0x1454a1dad <.text+0x54a0dad>
1454a1dc3:     	jmp	0x1454a1de4 <.text+0x54a0de4>
1454a1dc5:     	leaq	(%r8,%r8,2), %r9
1454a1dc9:     	movq	0x10(%r10), %r11
1454a1dcd:     	movq	%r11, 0x10(%rax,%r9,8)
1454a1dd2:     	movups	(%r10), %xmm0
1454a1dd6:     	movups	%xmm0, (%rax,%r9,8)
1454a1ddb:     	incq	%r8
1454a1dde:     	cmpl	%edx, 0x24(%r10)
1454a1de2:     	je	0x1454a1dad <.text+0x54a0dad>
1454a1de4:     	leaq	(%r8,%r8,2), %r9
1454a1de8:     	movq	0x28(%r10), %r11
1454a1dec:     	movq	%r11, 0x10(%rax,%r9,8)
1454a1df1:     	movups	0x18(%r10), %xmm0
1454a1df6:     	movups	%xmm0, (%rax,%r9,8)
1454a1dfb:     	incq	%r8
1454a1dfe:     	jmp	0x1454a1dad <.text+0x54a0dad>
1454a1e00:     	movq	%r8, 0x318(%r12)
1454a1e08:     	jmp	0x1454a0b19 <.text+0x549fb19>
1454a1e0d:     	movl	$0x1, %ecx
1454a1e12:     	movl	$0x20, %edx
1454a1e17:     	callq	0x14590379b <.text+0x590279b>
1454a1e1c:     	ud2
