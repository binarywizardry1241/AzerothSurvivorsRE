
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145933a30:     	pushq	%r15
145933a32:     	pushq	%r14
145933a34:     	pushq	%r12
145933a36:     	pushq	%rsi
145933a37:     	pushq	%rdi
145933a38:     	pushq	%rbp
145933a39:     	pushq	%rbx
145933a3a:     	subq	$0xd0, %rsp
145933a41:     	movaps	%xmm15, 0xc0(%rsp)
145933a4a:     	movaps	%xmm14, 0xb0(%rsp)
145933a53:     	movaps	%xmm13, 0xa0(%rsp)
145933a5c:     	movaps	%xmm12, 0x90(%rsp)
145933a65:     	movaps	%xmm11, 0x80(%rsp)
145933a6e:     	movaps	%xmm10, 0x70(%rsp)
145933a74:     	movaps	%xmm9, 0x60(%rsp)
145933a7a:     	movaps	%xmm8, 0x50(%rsp)
145933a80:     	movaps	%xmm7, 0x40(%rsp)
145933a85:     	movaps	%xmm6, 0x30(%rsp)
145933a8a:     	movaps	%xmm3, %xmm7
145933a8d:     	movaps	%xmm2, %xmm8
145933a91:     	movq	%rdx, %rdi
145933a94:     	movq	%rcx, %rsi
145933a97:     	movq	0x290(%rdx), %rcx
145933a9e:     	movq	0x298(%rdx), %rdx
145933aa5:     	callq	0x1458753b0 <.text+0x58743b0>
145933aaa:     	imulq	$0xf0, %rax, %rax
145933ab1:     	leaq	0x1275998(%rip), %r14   # 0x146ba9450
145933ab8:     	addq	%rax, %r14
145933abb:     	leaq	0x958(%rdi), %rbx
145933ac2:     	xorl	%r15d, %r15d
145933ac5:     	movss	0x440246(%rip), %xmm12  # 0x145d73d14
145933ace:     	movss	0x440571(%rip), %xmm13  # 0x145d74048
145933ad7:     	xorps	%xmm14, %xmm14
145933adb:     	movss	0x46a380(%rip), %xmm15  # 0x145d9de64
145933ae4:     	movq	$-0x1, %r12
145933aeb:     	xorl	%ebp, %ebp
145933aed:     	jmp	0x145933afb <.text+0x5932afb>
145933aef:     	nop
145933af0:     	incl	%ebp
145933af2:     	cmpl	$0xc, %ebp
145933af5:     	je	0x145933d24 <.text+0x5932d24>
145933afb:     	movsd	0x4c8(%rdi), %xmm6
145933b03:     	movq	0x958(%rdi), %r8
145933b0a:     	movq	0x970(%rdi), %rdx
145933b11:     	movq	0x960(%rdi), %rcx
145933b18:     	movq	0x968(%rdi), %rax
145933b1f:     	nop
145933b20:     	leaq	(%r8,%rdx), %r9
145933b24:     	rolq	$0x17, %r9
145933b28:     	addq	%r8, %r9
145933b2b:     	movq	%rcx, %r10
145933b2e:     	shlq	$0x11, %r10
145933b32:     	xorq	%r8, %rax
145933b35:     	xorq	%rcx, %rdx
145933b38:     	xorq	%rax, %rcx
145933b3b:     	xorq	%rdx, %r8
145933b3e:     	rolq	$0x2d, %rdx
145933b42:     	xorq	%r10, %rax
145933b45:     	shrq	$0x29, %r9
145933b49:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
145933b50:     	movd	%r9d, %xmm9
145933b55:     	addss	%xmm12, %xmm9
145933b5a:     	mulss	%xmm13, %xmm9
145933b5f:     	ucomiss	%xmm9, %xmm13
145933b63:     	jbe	0x145933b20 <.text+0x5932b20>
145933b65:     	addss	%xmm14, %xmm9
145933b6a:     	movq	%r8, 0x958(%rdi)
145933b71:     	movq	%rdx, 0x970(%rdi)
145933b78:     	movq	%rcx, 0x960(%rdi)
145933b7f:     	movq	%rax, 0x968(%rdi)
145933b86:     	movq	%rbx, %rcx
145933b89:     	movaps	%xmm8, %xmm1
145933b8d:     	movaps	%xmm7, %xmm2
145933b90:     	callq	0x145961d00 <.text+0x5960d00>
145933b95:     	movaps	%xmm0, %xmm10
145933b99:     	movaps	%xmm9, %xmm0
145933b9d:     	callq	0x145bc97c3 <.text+0x5bc87c3>
145933ba2:     	movaps	%xmm0, %xmm11
145933ba6:     	movaps	%xmm9, %xmm0
145933baa:     	callq	0x145bc97bd <.text+0x5bc87bd>
145933baf:     	unpcklps	%xmm0, %xmm11           # xmm11 = xmm11[0],xmm0[0],xmm11[1],xmm0[1]
145933bb3:     	movsldup	%xmm10, %xmm0           # xmm0 = xmm10[0,0,2,2]
145933bb8:     	mulps	%xmm11, %xmm0
145933bbc:     	addps	%xmm0, %xmm6
145933bbf:     	movsd	0xc8(%r14), %xmm0
145933bc8:     	movaps	%xmm6, %xmm1
145933bcb:     	subps	%xmm0, %xmm1
145933bce:     	movaps	%xmm1, %xmm2
145933bd1:     	mulps	%xmm1, %xmm2
145933bd4:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145933bd8:     	addss	%xmm2, %xmm3
145933bdc:     	sqrtss	%xmm3, %xmm3
145933be0:     	movss	0xd8(%r14), %xmm2
145933be9:     	ucomiss	%xmm2, %xmm3
145933bec:     	jbe	0x145933c02 <.text+0x5932c02>
145933bee:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
145933bf2:     	divps	%xmm3, %xmm1
145933bf5:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
145933bf9:     	mulps	%xmm1, %xmm2
145933bfc:     	addps	%xmm2, %xmm0
145933bff:     	movaps	%xmm0, %xmm6
145933c02:     	movq	0x950(%rdi), %rcx
145933c09:     	cmpq	$-0x1, 0x40(%rcx)
145933c0e:     	je	0x145933ce0 <.text+0x5932ce0>
145933c14:     	movsd	0x60(%rcx), %xmm1
145933c19:     	movaps	%xmm6, %xmm0
145933c1c:     	subps	%xmm1, %xmm0
145933c1f:     	movaps	%xmm0, %xmm1
145933c22:     	xorps	%xmm2, %xmm2
145933c25:     	cmpltps	%xmm2, %xmm1
145933c29:     	unpcklps	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1]
145933c2c:     	movmskpd	%xmm1, %eax
145933c30:     	testl	%eax, %eax
145933c32:     	jne	0x145933ce0 <.text+0x5932ce0>
145933c38:     	movaps	%xmm0, %xmm1
145933c3b:     	movss	0x46a21d(%rip), %xmm2   # 0x145d9de60
145933c43:     	subss	%xmm2, %xmm1
145933c47:     	cvttss2si	%xmm1, %rax
145933c4c:     	cvttss2si	%xmm0, %r8
145933c51:     	movq	%r8, %rdx
145933c54:     	sarq	$0x3f, %rdx
145933c58:     	andq	%rax, %rdx
145933c5b:     	orq	%r8, %rdx
145933c5e:     	ucomiss	%xmm14, %xmm0
145933c62:     	cmovbq	%r15, %rdx
145933c66:     	ucomiss	%xmm15, %xmm0
145933c6a:     	cmovaq	%r12, %rdx
145933c6e:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
145933c72:     	movaps	%xmm0, %xmm1
145933c75:     	subss	%xmm2, %xmm1
145933c79:     	cvttss2si	%xmm1, %rax
145933c7e:     	cvttss2si	%xmm0, %r9
145933c83:     	movq	%r9, %r8
145933c86:     	sarq	$0x3f, %r8
145933c8a:     	andq	%rax, %r8
145933c8d:     	orq	%r9, %r8
145933c90:     	ucomiss	%xmm14, %xmm0
145933c94:     	cmovbq	%r15, %r8
145933c98:     	ucomiss	%xmm15, %xmm0
145933c9c:     	cmovaq	%r12, %r8
145933ca0:     	movq	0x58(%rcx), %rax
145933ca4:     	cmpq	%rax, %rdx
145933ca7:     	setae	%r9b
145933cab:     	cmpq	%rax, %r8
145933cae:     	setae	%r10b
145933cb2:     	orb	%r9b, %r10b
145933cb5:     	jne	0x145933ce0 <.text+0x5932ce0>
145933cb7:     	imulq	%r8, %rax
145933cbb:     	addq	%rdx, %rax
145933cbe:     	movq	0x50(%rcx), %rdx
145933cc2:     	cmpq	%rdx, %rax
145933cc5:     	jae	0x145933ea3 <.text+0x5932ea3>
145933ccb:     	movq	0x48(%rcx), %rdx
145933ccf:     	cmpb	$0x0, (%rdx,%rax)
145933cd3:     	jne	0x145933af0 <.text+0x5932af0>
145933cd9:     	nopl	(%rax)
145933ce0:     	addq	$0x10, %rcx
145933ce4:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
145933ce8:     	movaps	%xmm6, %xmm1
145933ceb:     	callq	0x1458c7b60 <.text+0x58c6b60>
145933cf0:     	testb	$0x1, %al
145933cf2:     	je	0x145933af0 <.text+0x5932af0>
145933cf8:     	movss	0x4d0(%rdi), %xmm1
145933d00:     	movaps	%xmm0, %xmm2
145933d03:     	subss	%xmm1, %xmm2
145933d07:     	andps	0x467232(%rip), %xmm2   # 0x145d9af40
145933d0e:     	movss	0x527fe2(%rip), %xmm1   # 0x145e5bcf8
145933d16:     	ucomiss	%xmm2, %xmm1
145933d19:     	jbe	0x145933af0 <.text+0x5932af0>
145933d1f:     	jmp	0x145933e40 <.text+0x5932e40>
145933d24:     	movsd	0x4c8(%rdi), %xmm6
145933d2c:     	movq	0x958(%rdi), %r8
145933d33:     	movq	0x970(%rdi), %rdx
145933d3a:     	movq	0x960(%rdi), %rcx
145933d41:     	movq	0x968(%rdi), %rax
145933d48:     	nopl	(%rax,%rax)
145933d50:     	leaq	(%r8,%rdx), %r9
145933d54:     	rolq	$0x17, %r9
145933d58:     	addq	%r8, %r9
145933d5b:     	movq	%rcx, %r10
145933d5e:     	shlq	$0x11, %r10
145933d62:     	xorq	%r8, %rax
145933d65:     	xorq	%rcx, %rdx
145933d68:     	xorq	%rax, %rcx
145933d6b:     	xorq	%rdx, %r8
145933d6e:     	rolq	$0x2d, %rdx
145933d72:     	xorq	%r10, %rax
145933d75:     	shrq	$0x29, %r9
145933d79:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
145933d80:     	movd	%r9d, %xmm9
145933d85:     	addss	%xmm12, %xmm9
145933d8a:     	mulss	%xmm13, %xmm9
145933d8f:     	ucomiss	%xmm9, %xmm13
145933d93:     	jbe	0x145933d50 <.text+0x5932d50>
145933d95:     	xorps	%xmm0, %xmm0
145933d98:     	addss	%xmm0, %xmm9
145933d9d:     	movq	%r8, 0x958(%rdi)
145933da4:     	movq	%rdx, 0x970(%rdi)
145933dab:     	movq	%rcx, 0x960(%rdi)
145933db2:     	movq	%rax, 0x968(%rdi)
145933db9:     	movq	%rbx, %rcx
145933dbc:     	movaps	%xmm8, %xmm1
145933dc0:     	movaps	%xmm7, %xmm2
145933dc3:     	callq	0x145961d00 <.text+0x5960d00>
145933dc8:     	movaps	%xmm0, %xmm7
145933dcb:     	movaps	%xmm9, %xmm0
145933dcf:     	callq	0x145bc97c3 <.text+0x5bc87c3>
145933dd4:     	movaps	%xmm0, %xmm8
145933dd8:     	movaps	%xmm9, %xmm0
145933ddc:     	callq	0x145bc97bd <.text+0x5bc87bd>
145933de1:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
145933de5:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
145933de9:     	mulps	%xmm8, %xmm0
145933ded:     	addps	%xmm0, %xmm6
145933df0:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
145933df4:     	movq	0x950(%rdi), %rdi
145933dfb:     	leaq	0x10(%rdi), %rcx
145933dff:     	movaps	%xmm6, %xmm1
145933e02:     	movaps	%xmm7, %xmm2
145933e05:     	callq	0x1458c7b60 <.text+0x58c6b60>
145933e0a:     	testb	$0x1, %al
145933e0c:     	jne	0x145933e40 <.text+0x5932e40>
145933e0e:     	cmpq	$-0x1, 0x68(%rdi)
145933e13:     	je	0x145933e38 <.text+0x5932e38>
145933e15:     	leaq	0x68(%rdi), %rdx
145933e19:     	leaq	0x20(%rsp), %rcx
145933e1e:     	movaps	%xmm6, %xmm2
145933e21:     	movaps	%xmm7, %xmm3
145933e24:     	callq	0x1458cc950 <.text+0x58cb950>
145933e29:     	cmpl	$0x1, 0x20(%rsp)
145933e2e:     	jne	0x145933e38 <.text+0x5932e38>
145933e30:     	movss	0x2c(%rsp), %xmm0
145933e36:     	jmp	0x145933e40 <.text+0x5932e40>
145933e38:     	movss	0xb8(%rdi), %xmm0
145933e40:     	movlps	%xmm6, (%rsi)
145933e43:     	movss	%xmm0, 0x8(%rsi)
145933e48:     	movaps	0x30(%rsp), %xmm6
145933e4d:     	movaps	0x40(%rsp), %xmm7
145933e52:     	movaps	0x50(%rsp), %xmm8
145933e58:     	movaps	0x60(%rsp), %xmm9
145933e5e:     	movaps	0x70(%rsp), %xmm10
145933e64:     	movaps	0x80(%rsp), %xmm11
145933e6d:     	movaps	0x90(%rsp), %xmm12
145933e76:     	movaps	0xa0(%rsp), %xmm13
145933e7f:     	movaps	0xb0(%rsp), %xmm14
145933e88:     	movaps	0xc0(%rsp), %xmm15
145933e91:     	addq	$0xd0, %rsp
145933e98:     	popq	%rbx
145933e99:     	popq	%rbp
145933e9a:     	popq	%rdi
145933e9b:     	popq	%rsi
145933e9c:     	popq	%r12
145933e9e:     	popq	%r14
145933ea0:     	popq	%r15
145933ea2:     	retq
145933ea3:     	leaq	0x128be26(%rip), %r8    # 0x146bbfcd0
145933eaa:     	movq	%rax, %rcx
145933ead:     	callq	0x145d697e3 <.text+0x5d687e3>
145933eb2:     	ud2
