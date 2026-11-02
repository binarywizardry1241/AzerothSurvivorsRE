
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592ea80:     	pushq	%rbp
14592ea81:     	pushq	%r15
14592ea83:     	pushq	%r14
14592ea85:     	pushq	%r12
14592ea87:     	pushq	%rsi
14592ea88:     	pushq	%rdi
14592ea89:     	pushq	%rbx
14592ea8a:     	subq	$0x100, %rsp            # imm = 0x100
14592ea91:     	leaq	0x80(%rsp), %rbp
14592ea99:     	movaps	%xmm13, 0x70(%rbp)
14592ea9e:     	movaps	%xmm12, 0x60(%rbp)
14592eaa3:     	movaps	%xmm11, 0x50(%rbp)
14592eaa8:     	movaps	%xmm10, 0x40(%rbp)
14592eaad:     	movaps	%xmm9, 0x30(%rbp)
14592eab2:     	movaps	%xmm8, 0x20(%rbp)
14592eab7:     	movaps	%xmm7, 0x10(%rbp)
14592eabb:     	movaps	%xmm6, (%rbp)
14592eabf:     	movq	$-0x2, -0x8(%rbp)
14592eac7:     	movq	%rdx, %rsi
14592eaca:     	movq	0xd8(%rcx), %rdx
14592ead1:     	cmpq	%rdx, %rsi
14592ead4:     	jae	0x14592ed58 <.text+0x592dd58>
14592eada:     	movaps	%xmm3, %xmm6
14592eadd:     	movaps	%xmm2, %xmm7
14592eae0:     	movq	%rcx, %rdi
14592eae3:     	movss	0x9ec(%rcx), %xmm11
14592eaec:     	movq	0xd0(%rcx), %r15
14592eaf3:     	imulq	$0x78, %rsi, %r14
14592eaf7:     	movq	0x950(%rcx), %r12
14592eafe:     	leaq	0x10(%r12), %rbx
14592eb03:     	movss	0x5c(%r15,%r14), %xmm1
14592eb0a:     	addq	%r14, %r15
14592eb0d:     	xorps	%xmm0, %xmm0
14592eb10:     	ucomiss	%xmm1, %xmm0
14592eb13:     	jae	0x14592eb6c <.text+0x592db6c>
14592eb15:     	movaps	%xmm11, %xmm2
14592eb19:     	subss	0x58(%r15), %xmm2
14592eb1f:     	divss	%xmm1, %xmm2
14592eb23:     	maxss	%xmm2, %xmm0
14592eb27:     	movss	0x43e83d(%rip), %xmm1   # 0x145d6d36c
14592eb2f:     	minss	%xmm0, %xmm1
14592eb33:     	movsd	0x40(%r15), %xmm0
14592eb39:     	movsd	0x4c(%r15), %xmm2
14592eb3f:     	subps	%xmm0, %xmm2
14592eb42:     	movsldup	%xmm1, %xmm8            # xmm8 = xmm1[0,0,2,2]
14592eb47:     	mulps	%xmm2, %xmm8
14592eb4b:     	addps	%xmm0, %xmm8
14592eb4f:     	movss	0x48(%r15), %xmm0
14592eb55:     	movss	0x54(%r15), %xmm10
14592eb5b:     	subss	%xmm0, %xmm10
14592eb60:     	mulss	%xmm1, %xmm10
14592eb65:     	addss	%xmm0, %xmm10
14592eb6a:     	jmp	0x14592eb78 <.text+0x592db78>
14592eb6c:     	movsd	0x4c(%r15), %xmm8
14592eb72:     	movss	0x54(%r15), %xmm10
14592eb78:     	movshdup	%xmm8, %xmm2            # xmm2 = xmm8[1,1,3,3]
14592eb7d:     	movq	%rbx, %rcx
14592eb80:     	movaps	%xmm8, %xmm1
14592eb84:     	callq	0x1458c7b60 <.text+0x58c6b60>
14592eb89:     	movaps	%xmm0, %xmm9
14592eb8d:     	testb	$0x1, %al
14592eb8f:     	jne	0x14592eb95 <.text+0x592db95>
14592eb91:     	movaps	%xmm10, %xmm9
14592eb95:     	movaps	%xmm7, %xmm0
14592eb98:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
14592eb9b:     	movaps	%xmm8, %xmm1
14592eb9f:     	subps	%xmm0, %xmm1
14592eba2:     	mulps	%xmm1, %xmm1
14592eba5:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
14592eba9:     	addss	%xmm1, %xmm0
14592ebad:     	sqrtss	%xmm0, %xmm12
14592ebb2:     	movss	0x43eb8e(%rip), %xmm0   # 0x145d6d748
14592ebba:     	ucomiss	%xmm12, %xmm0
14592ebbe:     	ja	0x14592ed20 <.text+0x592dd20>
14592ebc4:     	movss	0xe0(%rbp), %xmm13
14592ebcd:     	movq	%rbx, %rcx
14592ebd0:     	movaps	%xmm7, %xmm1
14592ebd3:     	movaps	%xmm6, %xmm2
14592ebd6:     	callq	0x1458c7b60 <.text+0x58c6b60>
14592ebdb:     	testb	$0x1, %al
14592ebdd:     	je	0x14592ebe5 <.text+0x592dbe5>
14592ebdf:     	movaps	%xmm0, %xmm10
14592ebe3:     	jmp	0x14592ec19 <.text+0x592dc19>
14592ebe5:     	cmpq	$-0x1, 0x68(%r12)
14592ebeb:     	je	0x14592ec0f <.text+0x592dc0f>
14592ebed:     	leaq	0x68(%r12), %rdx
14592ebf2:     	leaq	-0x38(%rbp), %rcx
14592ebf6:     	movaps	%xmm7, %xmm2
14592ebf9:     	movaps	%xmm6, %xmm3
14592ebfc:     	callq	0x1458cc950 <.text+0x58cb950>
14592ec01:     	cmpl	$0x1, -0x38(%rbp)
14592ec05:     	jne	0x14592ec0f <.text+0x592dc0f>
14592ec07:     	movss	-0x2c(%rbp), %xmm10
14592ec0d:     	jmp	0x14592ec19 <.text+0x592dc19>
14592ec0f:     	movss	0xb8(%r12), %xmm10
14592ec19:     	divss	%xmm13, %xmm12
14592ec1e:     	movq	0x20(%r15), %rdx
14592ec22:     	movl	0xa10(%rdi), %eax
14592ec28:     	incl	%eax
14592ec2a:     	movl	%eax, 0xa10(%rdi)
14592ec30:     	movss	0x49096c(%rip), %xmm0   # 0x145dbf5a4
14592ec38:     	mulss	%xmm12, %xmm0
14592ec3d:     	cvttss2si	%xmm0, %rcx
14592ec42:     	xorl	%r8d, %r8d
14592ec45:     	xorps	%xmm1, %xmm1
14592ec48:     	ucomiss	%xmm1, %xmm0
14592ec4b:     	cmovael	%ecx, %r8d
14592ec4f:     	ucomiss	0x43ec1e(%rip), %xmm0   # 0x145d6d874
14592ec56:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14592ec5b:     	cmovbel	%r8d, %ecx
14592ec5f:     	movlps	%xmm8, -0x48(%rbp)
14592ec64:     	movss	%xmm9, -0x40(%rbp)
14592ec6a:     	movss	%xmm7, -0x14(%rbp)
14592ec6f:     	movss	%xmm6, -0x10(%rbp)
14592ec74:     	movss	%xmm10, -0xc(%rbp)
14592ec7a:     	movl	%ecx, 0x28(%rsp)
14592ec7e:     	movl	%eax, 0x20(%rsp)
14592ec82:     	leaq	-0x38(%rbp), %rcx
14592ec86:     	leaq	-0x48(%rbp), %r8
14592ec8a:     	leaq	-0x14(%rbp), %r9
14592ec8e:     	callq	0x1458aa9e0 <.text+0x58a99e0>
14592ec93:     	movq	0x5e0(%rdi), %rbx
14592ec9a:     	cmpq	0x5d0(%rdi), %rbx
14592eca1:     	jne	0x14592ecb0 <.text+0x592dcb0>
14592eca3:     	leaq	0x5d0(%rdi), %rcx
14592ecaa:     	callq	0x145bcb530 <.text+0x5bca530>
14592ecaf:     	nop
14592ecb0:     	movq	0x5d8(%rdi), %rax
14592ecb7:     	movq	%rbx, %rcx
14592ecba:     	shlq	$0x5, %rcx
14592ecbe:     	movups	-0x38(%rbp), %xmm0
14592ecc2:     	movups	-0x28(%rbp), %xmm1
14592ecc6:     	movups	%xmm1, 0x10(%rax,%rcx)
14592eccb:     	movups	%xmm0, (%rax,%rcx)
14592eccf:     	incq	%rbx
14592ecd2:     	movq	%rbx, 0x5e0(%rdi)
14592ecd9:     	movq	0xd8(%rdi), %rdx
14592ece0:     	cmpq	%rdx, %rsi
14592ece3:     	jae	0x14592ed69 <.text+0x592dd69>
14592ece9:     	movq	0xd0(%rdi), %rax
14592ecf0:     	movlps	%xmm8, 0x40(%rax,%r14)
14592ecf6:     	movss	%xmm9, 0x48(%rax,%r14)
14592ecfd:     	movss	%xmm7, 0x4c(%rax,%r14)
14592ed04:     	movss	%xmm6, 0x50(%rax,%r14)
14592ed0b:     	movss	%xmm10, 0x54(%rax,%r14)
14592ed12:     	movss	%xmm11, 0x58(%rax,%r14)
14592ed19:     	movss	%xmm12, 0x5c(%rax,%r14)
14592ed20:     	movaps	(%rbp), %xmm6
14592ed24:     	movaps	0x10(%rbp), %xmm7
14592ed28:     	movaps	0x20(%rbp), %xmm8
14592ed2d:     	movaps	0x30(%rbp), %xmm9
14592ed32:     	movaps	0x40(%rbp), %xmm10
14592ed37:     	movaps	0x50(%rbp), %xmm11
14592ed3c:     	movaps	0x60(%rbp), %xmm12
14592ed41:     	movaps	0x70(%rbp), %xmm13
14592ed46:     	addq	$0x100, %rsp            # imm = 0x100
14592ed4d:     	popq	%rbx
14592ed4e:     	popq	%rdi
14592ed4f:     	popq	%rsi
14592ed50:     	popq	%r12
14592ed52:     	popq	%r14
14592ed54:     	popq	%r15
14592ed56:     	popq	%rbp
14592ed57:     	retq
14592ed58:     	leaq	0x154aa41(%rip), %r8    # 0x146e797a0
14592ed5f:     	movq	%rsi, %rcx
14592ed62:     	callq	0x145d697e3 <.text+0x5d687e3>
14592ed67:     	ud2
14592ed69:     	leaq	0x154aa48(%rip), %r8    # 0x146e797b8
14592ed70:     	movq	%rsi, %rcx
14592ed73:     	callq	0x145d697e3 <.text+0x5d687e3>
14592ed78:     	ud2
