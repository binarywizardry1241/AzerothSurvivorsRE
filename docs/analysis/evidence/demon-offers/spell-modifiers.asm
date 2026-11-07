
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e3a30:     	pushq	%r15
1458e3a32:     	pushq	%r14
1458e3a34:     	pushq	%r13
1458e3a36:     	pushq	%r12
1458e3a38:     	pushq	%rsi
1458e3a39:     	pushq	%rdi
1458e3a3a:     	pushq	%rbp
1458e3a3b:     	pushq	%rbx
1458e3a3c:     	subq	$0xe8, %rsp
1458e3a43:     	movaps	%xmm15, 0xd0(%rsp)
1458e3a4c:     	movaps	%xmm14, 0xc0(%rsp)
1458e3a55:     	movaps	%xmm13, 0xb0(%rsp)
1458e3a5e:     	movaps	%xmm12, 0xa0(%rsp)
1458e3a67:     	movaps	%xmm11, 0x90(%rsp)
1458e3a70:     	movaps	%xmm10, 0x80(%rsp)
1458e3a79:     	movaps	%xmm9, 0x70(%rsp)
1458e3a7f:     	movaps	%xmm8, 0x60(%rsp)
1458e3a85:     	movaps	%xmm7, 0x50(%rsp)
1458e3a8a:     	movaps	%xmm6, 0x40(%rsp)
1458e3a8f:     	movq	%rcx, %rsi
1458e3a92:     	movsd	0x48d206(%rip), %xmm0   # 0x145d70ca0
1458e3a9a:     	movsd	%xmm0, (%rcx)
1458e3a9e:     	movl	$0x0, 0x8(%rcx)
1458e3aa5:     	movaps	0x490284(%rip), %xmm1   # 0x145d73d30
1458e3aac:     	movups	%xmm1, 0xc(%rcx)
1458e3ab0:     	movsd	%xmm0, 0x1c(%rcx)
1458e3ab5:     	movq	0x28(%rdx), %r15
1458e3ab9:     	xorps	%xmm7, %xmm7
1458e3abc:     	xorps	%xmm6, %xmm6
1458e3abf:     	xorps	%xmm8, %xmm8
1458e3ac3:     	testq	%r15, %r15
1458e3ac6:     	je	0x1458e3cfb <.text+0x58e2cfb>
1458e3acc:     	movq	0x20(%rdx), %r13
1458e3ad0:     	shlq	$0x5, %r15
1458e3ad4:     	addq	%r13, %r15
1458e3ad7:     	movzbl	0x75(%r8), %eax
1458e3adc:     	movb	%al, 0x2f(%rsp)
1458e3ae0:     	movzbl	0x74(%r8), %eax
1458e3ae5:     	movb	%al, 0x2e(%rsp)
1458e3ae9:     	movq	(%r8), %rdi
1458e3aec:     	movq	0x8(%r8), %rbx
1458e3af0:     	movss	0x489873(%rip), %xmm9   # 0x145d6d36c
1458e3af9:     	movaps	%xmm9, %xmm11
1458e3afd:     	movaps	%xmm9, %xmm12
1458e3b01:     	xorps	%xmm13, %xmm13
1458e3b05:     	movaps	%xmm9, %xmm14
1458e3b09:     	movaps	%xmm9, %xmm15
1458e3b0d:     	movaps	%xmm9, %xmm10
1458e3b11:     	movss	%xmm9, 0x3c(%rsp)
1458e3b18:     	movq	%rsi, 0x30(%rsp)
1458e3b1d:     	jmp	0x1458e3b39 <.text+0x58e2b39>
1458e3b1f:     	cmpb	%al, 0x2f(%rsp)
1458e3b23:     	je	0x1458e3bc1 <.text+0x58e2bc1>
1458e3b29:     	nopl	(%rax)
1458e3b30:     	cmpq	%r15, %r13
1458e3b33:     	je	0x1458e3cf6 <.text+0x58e2cf6>
1458e3b39:     	movq	%r13, %r12
1458e3b3c:     	addq	$0x20, %r13
1458e3b40:     	movzbl	(%r12), %ebp
1458e3b45:     	movzbl	0x1(%r12), %eax
1458e3b4b:     	movq	0x8(%r12), %r14
1458e3b50:     	movq	0x10(%r12), %rsi
1458e3b55:     	movzbl	%bpl, %ecx
1458e3b59:     	leaq	0x159465c(%rip), %rdx   # 0x146e781bc
1458e3b60:     	movslq	(%rdx,%rcx,4), %rcx
1458e3b64:     	addq	%rdx, %rcx
1458e3b67:     	jmpq	*%rcx
1458e3b69:     	cmpq	%rsi, %rbx
1458e3b6c:     	jne	0x1458e3b30 <.text+0x58e2b30>
1458e3b6e:     	movq	%rdi, %rcx
1458e3b71:     	movq	%r14, %rdx
1458e3b74:     	movq	%rbx, %r8
1458e3b77:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e3b7c:     	testl	%eax, %eax
1458e3b7e:     	jne	0x1458e3b30 <.text+0x58e2b30>
1458e3b80:     	jmp	0x1458e3bc1 <.text+0x58e2bc1>
1458e3b82:     	testq	%rsi, %rsi
1458e3b85:     	je	0x1458e3b30 <.text+0x58e2b30>
1458e3b87:     	shlq	$0x4, %rsi
1458e3b8b:     	xorl	%ebp, %ebp
1458e3b8d:     	jmp	0x1458e3b99 <.text+0x58e2b99>
1458e3b8f:     	nop
1458e3b90:     	addq	$0x10, %rbp
1458e3b94:     	cmpq	%rbp, %rsi
1458e3b97:     	je	0x1458e3b30 <.text+0x58e2b30>
1458e3b99:     	cmpq	%rbx, 0x8(%r14,%rbp)
1458e3b9e:     	jne	0x1458e3b90 <.text+0x58e2b90>
1458e3ba0:     	movq	(%r14,%rbp), %rcx
1458e3ba4:     	movq	%rdi, %rdx
1458e3ba7:     	movq	%rbx, %r8
1458e3baa:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e3baf:     	testl	%eax, %eax
1458e3bb1:     	jne	0x1458e3b90 <.text+0x58e2b90>
1458e3bb3:     	movb	$0x1, %al
1458e3bb5:     	jmp	0x1458e3bcb <.text+0x58e2bcb>
1458e3bb7:     	cmpb	%al, 0x2e(%rsp)
1458e3bbb:     	jne	0x1458e3b30 <.text+0x58e2b30>
1458e3bc1:     	decb	%bpl
1458e3bc4:     	cmpb	$0x2, %bpl
1458e3bc8:     	setb	%al
1458e3bcb:     	movss	0x1c(%r12), %xmm0
1458e3bd2:     	movzbl	0x18(%r12), %ecx
1458e3bd8:     	leaq	0x15945f9(%rip), %rdx   # 0x146e781d8
1458e3bdf:     	movslq	(%rdx,%rcx,4), %rcx
1458e3be3:     	addq	%rdx, %rcx
1458e3be6:     	jmpq	*%rcx
1458e3be8:     	addss	%xmm0, %xmm10
1458e3bed:     	movq	0x30(%rsp), %rsi
1458e3bf2:     	movss	%xmm10, (%rsi)
1458e3bf7:     	testb	%al, %al
1458e3bf9:     	je	0x1458e3cd0 <.text+0x58e2cd0>
1458e3bff:     	movss	0x3c(%rsp), %xmm1
1458e3c05:     	addss	%xmm0, %xmm1
1458e3c09:     	movss	%xmm1, 0x3c(%rsp)
1458e3c0f:     	movss	%xmm1, 0x1c(%rsi)
1458e3c14:     	cmpq	%r15, %r13
1458e3c17:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3c1d:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3c22:     	addss	%xmm0, %xmm14
1458e3c27:     	movq	0x30(%rsp), %rsi
1458e3c2c:     	movss	%xmm14, 0x10(%rsi)
1458e3c32:     	cmpq	%r15, %r13
1458e3c35:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3c3b:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3c40:     	addss	%xmm0, %xmm6
1458e3c44:     	movq	0x30(%rsp), %rsi
1458e3c49:     	cmpq	%r15, %r13
1458e3c4c:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3c52:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3c57:     	addss	%xmm0, %xmm15
1458e3c5c:     	movq	0x30(%rsp), %rsi
1458e3c61:     	movss	%xmm15, 0xc(%rsi)
1458e3c67:     	cmpq	%r15, %r13
1458e3c6a:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3c70:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3c75:     	xorps	%xmm1, %xmm1
1458e3c78:     	maxss	%xmm0, %xmm1
1458e3c7c:     	movss	0x5780dc(%rip), %xmm0   # 0x145e5bd60
1458e3c84:     	minss	%xmm1, %xmm0
1458e3c88:     	movaps	%xmm9, %xmm1
1458e3c8c:     	subss	%xmm0, %xmm1
1458e3c90:     	mulss	%xmm1, %xmm11
1458e3c95:     	movq	0x30(%rsp), %rsi
1458e3c9a:     	movss	%xmm11, 0x20(%rsi)
1458e3ca0:     	cmpq	%r15, %r13
1458e3ca3:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3ca9:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3cab:     	addss	%xmm0, %xmm8
1458e3cb0:     	movq	0x30(%rsp), %rsi
1458e3cb5:     	cmpq	%r15, %r13
1458e3cb8:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3cbe:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3cc0:     	addss	%xmm0, %xmm13
1458e3cc5:     	movq	0x30(%rsp), %rsi
1458e3cca:     	movss	%xmm13, 0x14(%rsi)
1458e3cd0:     	cmpq	%r15, %r13
1458e3cd3:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3cd9:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3cdb:     	addss	%xmm0, %xmm12
1458e3ce0:     	movq	0x30(%rsp), %rsi
1458e3ce5:     	movss	%xmm12, 0x18(%rsi)
1458e3ceb:     	cmpq	%r15, %r13
1458e3cee:     	jne	0x1458e3b39 <.text+0x58e2b39>
1458e3cf4:     	jmp	0x1458e3cfb <.text+0x58e2cfb>
1458e3cf6:     	movq	0x30(%rsp), %rsi
1458e3cfb:     	movss	0x489669(%rip), %xmm0   # 0x145d6d36c
1458e3d03:     	subss	%xmm8, %xmm0
1458e3d08:     	maxss	0x4b71fc(%rip), %xmm0   # 0x145d9af0c
1458e3d10:     	movss	%xmm0, 0x4(%rsi)
1458e3d15:     	movaps	%xmm6, %xmm0
1458e3d18:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1458e3d1d:     	cvttss2si	%xmm0, %rax
1458e3d22:     	xorl	%ecx, %ecx
1458e3d24:     	ucomiss	%xmm7, %xmm0
1458e3d27:     	cmovael	%eax, %ecx
1458e3d2a:     	ucomiss	0x489b43(%rip), %xmm0   # 0x145d6d874
1458e3d31:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1458e3d36:     	cmovbel	%ecx, %eax
1458e3d39:     	movl	%eax, 0x8(%rsi)
1458e3d3c:     	movq	%rsi, %rax
1458e3d3f:     	movaps	0x40(%rsp), %xmm6
1458e3d44:     	movaps	0x50(%rsp), %xmm7
1458e3d49:     	movaps	0x60(%rsp), %xmm8
1458e3d4f:     	movaps	0x70(%rsp), %xmm9
1458e3d55:     	movaps	0x80(%rsp), %xmm10
1458e3d5e:     	movaps	0x90(%rsp), %xmm11
1458e3d67:     	movaps	0xa0(%rsp), %xmm12
1458e3d70:     	movaps	0xb0(%rsp), %xmm13
1458e3d79:     	movaps	0xc0(%rsp), %xmm14
1458e3d82:     	movaps	0xd0(%rsp), %xmm15
1458e3d8b:     	addq	$0xe8, %rsp
1458e3d92:     	popq	%rbx
1458e3d93:     	popq	%rbp
1458e3d94:     	popq	%rdi
1458e3d95:     	popq	%rsi
1458e3d96:     	popq	%r12
1458e3d98:     	popq	%r13
1458e3d9a:     	popq	%r14
1458e3d9c:     	popq	%r15
1458e3d9e:     	retq
