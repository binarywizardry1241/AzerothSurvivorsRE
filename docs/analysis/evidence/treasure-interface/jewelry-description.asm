
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145424a90:     	pushq	%rbp
145424a91:     	pushq	%r15
145424a93:     	pushq	%r14
145424a95:     	pushq	%r13
145424a97:     	pushq	%r12
145424a99:     	pushq	%rsi
145424a9a:     	pushq	%rdi
145424a9b:     	pushq	%rbx
145424a9c:     	subq	$0xc8, %rsp
145424aa3:     	leaq	0x80(%rsp), %rbp
145424aab:     	movq	$-0x2, 0x40(%rbp)
145424ab3:     	movq	%rdx, %rdi
145424ab6:     	movq	%rcx, %rsi
145424ab9:     	movss	%xmm2, 0x24(%rbp)
145424abe:     	movzbl	0x44(%rdx), %r13d
145424ac3:     	leal	-0x5(%r13), %eax
145424ac7:     	cmpl	$0xc, %eax
145424aca:     	ja	0x145424ae5 <.text+0x5423ae5>
145424acc:     	leaq	0x13189e1(%rip), %rcx   # 0x14673d4b4
145424ad3:     	movslq	(%rcx,%rax,4), %rax
145424ad7:     	addq	%rcx, %rax
145424ada:     	jmpq	*%rax
145424adc:     	leaq	0x24(%rbp), %rax
145424ae0:     	jmp	0x145424ba7 <.text+0x5423ba7>
145424ae5:     	mulss	0x4e2a4f(%rip), %xmm2   # 0x14590753c
145424aed:     	movss	%xmm2, (%rbp)
145424af2:     	movq	%rbp, %rax
145424af5:     	jmp	0x145424b7f <.text+0x5423b7f>
145424afa:     	movss	0x40(%rdi), %xmm0
145424aff:     	mulss	0x4ee7f5(%rip), %xmm0   # 0x1459132fc
145424b07:     	movaps	%xmm2, %xmm1
145424b0a:     	minss	%xmm0, %xmm1
145424b0e:     	movaps	%xmm1, %xmm0
145424b11:     	cmpunordss	%xmm1, %xmm0
145424b16:     	movaps	%xmm0, %xmm3
145424b19:     	andnps	%xmm1, %xmm3
145424b1c:     	andps	%xmm2, %xmm0
145424b1f:     	orps	%xmm3, %xmm0
145424b22:     	mulss	0x4e2a12(%rip), %xmm0   # 0x14590753c
145424b2a:     	movss	%xmm0, -0x20(%rbp)
145424b2f:     	leaq	-0x20(%rbp), %rax
145424b33:     	movq	%rax, (%rbp)
145424b37:     	leaq	0x314bb2(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145424b3e:     	movq	%rax, 0x8(%rbp)
145424b42:     	leaq	0x1315933(%rip), %rdx   # 0x14673a47c
145424b49:     	leaq	0x28(%rbp), %rcx
145424b4d:     	movq	%rbp, %r8
145424b50:     	callq	0x145728390 <.text+0x5727390>
145424b55:     	movq	0x38(%rbp), %rbx
145424b59:     	movq	%rbx, 0x10(%rbp)
145424b5d:     	movups	0x28(%rbp), %xmm0
145424b61:     	movaps	%xmm0, (%rbp)
145424b65:     	movq	0x8(%rbp), %r14
145424b69:     	cmpq	$0x2, %rbx
145424b6d:     	jae	0x145424da5 <.text+0x5423da5>
145424b73:     	xorl	%r15d, %r15d
145424b76:     	jmp	0x145424db1 <.text+0x5423db1>
145424b7b:     	leaq	0x24(%rbp), %rax
145424b7f:     	movq	%rax, 0x28(%rbp)
145424b83:     	leaq	0x314b66(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145424b8a:     	movq	%rax, 0x30(%rbp)
145424b8e:     	leaq	0x13158ef(%rip), %rdx   # 0x14673a484
145424b95:     	jmp	0x145424bbd <.text+0x5423bbd>
145424b97:     	mulss	0x4e299d(%rip), %xmm2   # 0x14590753c
145424b9f:     	movss	%xmm2, (%rbp)
145424ba4:     	movq	%rbp, %rax
145424ba7:     	movq	%rax, 0x28(%rbp)
145424bab:     	leaq	0x314b3e(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145424bb2:     	movq	%rax, 0x30(%rbp)
145424bb6:     	leaq	0x13158bf(%rip), %rdx   # 0x14673a47c
145424bbd:     	leaq	-0x20(%rbp), %rcx
145424bc1:     	leaq	0x28(%rbp), %r8
145424bc5:     	callq	0x145728390 <.text+0x5727390>
145424bca:     	movss	0x24(%rbp), %xmm0
145424bcf:     	mulss	0x4e2931(%rip), %xmm0   # 0x145907508
145424bd7:     	mulss	0x4e295d(%rip), %xmm0   # 0x14590753c
145424bdf:     	movss	%xmm0, -0x34(%rbp)
145424be4:     	leaq	-0x34(%rbp), %rax
145424be8:     	movq	%rax, (%rbp)
145424bec:     	leaq	0x314afd(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145424bf3:     	movq	%rax, 0x8(%rbp)
145424bf7:     	leaq	0x1315886(%rip), %rdx   # 0x14673a484
145424bfe:     	leaq	0x28(%rbp), %rcx
145424c02:     	movq	%rbp, %r8
145424c05:     	callq	0x145728390 <.text+0x5727390>
145424c0a:     	nop
145424c0b:     	movq	0x28(%rbp), %rax
145424c0f:     	movq	%rax, 0x18(%rbp)
145424c13:     	movq	0x30(%rbp), %rax
145424c17:     	movq	%rax, -0x28(%rbp)
145424c1b:     	movq	0x38(%rbp), %r12
145424c1f:     	movl	$0x1, %ebx
145424c24:     	cmpb	$0x5, %r13b
145424c28:     	jne	0x145424c49 <.text+0x5423c49>
145424c2a:     	movss	0x40(%rdi), %xmm0
145424c2f:     	mulss	0x4ee6c5(%rip), %xmm0   # 0x1459132fc
145424c37:     	addss	0x931411(%rip), %xmm0   # 0x145d56050
145424c3f:     	movss	0x24(%rbp), %xmm1
145424c44:     	ucomiss	%xmm0, %xmm1
145424c47:     	jae	0x145424c4e <.text+0x5423c4e>
145424c49:     	xorl	%r14d, %r14d
145424c4c:     	jmp	0x145424c77 <.text+0x5423c77>
145424c4e:     	leaq	0x1315835(%rip), %rbx   # 0x14673a48a
145424c55:     	movl	$0x6, %r15d
145424c5b:     	movl	$0x6, %edx
145424c60:     	movq	%rbx, %rcx
145424c63:     	callq	0x145457cb0 <.text+0x5456cb0>
145424c68:     	nop
145424c69:     	movq	%rdx, %r14
145424c6c:     	testq	%rax, %rax
145424c6f:     	cmovneq	%rax, %rbx
145424c73:     	cmoveq	%r15, %r14
145424c77:     	movq	0x30(%rdi), %r15
145424c7b:     	movq	0x38(%rdi), %rdi
145424c7f:     	movq	%r15, %rcx
145424c82:     	movq	%rdi, %rdx
145424c85:     	callq	0x145457cb0 <.text+0x5456cb0>
145424c8a:     	nop
145424c8b:     	movq	%rdx, %r8
145424c8e:     	testq	%rax, %rax
145424c91:     	cmovneq	%rax, %r15
145424c95:     	cmoveq	%rdi, %r8
145424c99:     	movq	-0x18(%rbp), %rcx
145424c9d:     	movq	-0x10(%rbp), %rax
145424ca1:     	movq	%rax, 0x30(%rsp)
145424ca6:     	movq	%rcx, -0x30(%rbp)
145424caa:     	movq	%rcx, 0x28(%rsp)
145424caf:     	movq	$0x3, 0x20(%rsp)
145424cb8:     	leaq	0x13157d1(%rip), %r9    # 0x14673a490
145424cbf:     	leaq	0x28(%rbp), %rcx
145424cc3:     	movq	%r15, %rdx
145424cc6:     	callq	0x1454210d0 <.text+0x54200d0>
145424ccb:     	nop
145424ccc:     	movq	0x30(%rbp), %rdx
145424cd0:     	movq	0x38(%rbp), %r8
145424cd4:     	movq	%r12, 0x30(%rsp)
145424cd9:     	movq	-0x28(%rbp), %rax
145424cdd:     	movq	%rax, 0x28(%rsp)
145424ce2:     	movq	$0x3, 0x20(%rsp)
145424ceb:     	leaq	0x13157a1(%rip), %r9    # 0x14673a493
145424cf2:     	movq	%rbp, %rcx
145424cf5:     	movq	%rdx, -0x48(%rbp)
145424cf9:     	callq	0x1454210d0 <.text+0x54200d0>
145424cfe:     	nop
145424cff:     	movq	0x8(%rbp), %rdx
145424d03:     	movq	0x10(%rbp), %r8
145424d07:     	movq	%r14, 0x30(%rsp)
145424d0c:     	movq	%rbx, 0x28(%rsp)
145424d11:     	movq	$0x5, 0x20(%rsp)
145424d1a:     	leaq	0x1315775(%rip), %r9    # 0x14673a496
145424d21:     	movq	%rsi, %rcx
145424d24:     	movq	%rdx, -0x40(%rbp)
145424d28:     	callq	0x1454210d0 <.text+0x54200d0>
145424d2d:     	nop
145424d2e:     	movq	0x18(%rbp), %rdx
145424d32:     	testq	%rdx, %rdx
145424d35:     	je	0x145424d46 <.text+0x5423d46>
145424d37:     	movl	$0x1, %r8d
145424d3d:     	movq	-0x28(%rbp), %rcx
145424d41:     	callq	0x1400021d0 <.text+0x11d0>
145424d46:     	movq	-0x20(%rbp), %rdx
145424d4a:     	testq	%rdx, %rdx
145424d4d:     	je	0x145424d5e <.text+0x5423d5e>
145424d4f:     	movl	$0x1, %r8d
145424d55:     	movq	-0x30(%rbp), %rcx
145424d59:     	callq	0x1400021d0 <.text+0x11d0>
145424d5e:     	movq	(%rbp), %rdx
145424d62:     	testq	%rdx, %rdx
145424d65:     	je	0x145424d76 <.text+0x5423d76>
145424d67:     	movl	$0x1, %r8d
145424d6d:     	movq	-0x40(%rbp), %rcx
145424d71:     	callq	0x1400021d0 <.text+0x11d0>
145424d76:     	movq	0x28(%rbp), %rdx
145424d7a:     	testq	%rdx, %rdx
145424d7d:     	je	0x145424d8e <.text+0x5423d8e>
145424d7f:     	movl	$0x1, %r8d
145424d85:     	movq	-0x48(%rbp), %rcx
145424d89:     	callq	0x1400021d0 <.text+0x11d0>
145424d8e:     	movq	%rsi, %rax
145424d91:     	addq	$0xc8, %rsp
145424d98:     	popq	%rbx
145424d99:     	popq	%rdi
145424d9a:     	popq	%rsi
145424d9b:     	popq	%r12
145424d9d:     	popq	%r13
145424d9f:     	popq	%r14
145424da1:     	popq	%r15
145424da3:     	popq	%rbp
145424da4:     	retq
145424da5:     	cmpw	$0x302e, -0x2(%r14,%rbx) # imm = 0x302E
145424dad:     	sete	%r15b
145424db1:     	leaq	0x28(%rbp), %rcx
145424db5:     	movq	%rbp, %rdx
145424db8:     	callq	0x145728850 <.text+0x5727850>
145424dbd:     	nop
145424dbe:     	testb	%r15b, %r15b
145424dc1:     	je	0x145424ddd <.text+0x5423ddd>
145424dc3:     	addq	$-0x2, %rbx
145424dc7:     	testq	%rbx, %rbx
145424dca:     	jns	0x145424def <.text+0x5423def>
145424dcc:     	xorl	%r12d, %r12d
145424dcf:     	movq	%r12, %rcx
145424dd2:     	movq	%rbx, %rdx
145424dd5:     	callq	0x14590379b <.text+0x590279b>
145424dda:     	nop
145424ddb:     	ud2
145424ddd:     	movq	0x38(%rbp), %rax
145424de1:     	movq	%rax, -0x10(%rbp)
145424de5:     	movups	0x28(%rbp), %xmm0
145424de9:     	movaps	%xmm0, -0x20(%rbp)
145424ded:     	jmp	0x145424e4b <.text+0x5423e4b>
145424def:     	je	0x145424e21 <.text+0x5423e21>
145424df1:     	callq	0x140002200 <.text+0x1200>
145424df6:     	movl	$0x1, %r12d
145424dfc:     	movl	$0x1, %edx
145424e01:     	movq	%rbx, %rcx
145424e04:     	callq	0x1400021c0 <.text+0x11c0>
145424e09:     	testq	%rax, %rax
145424e0c:     	je	0x145424dcf <.text+0x5423dcf>
145424e0e:     	movq	%rax, %r15
145424e11:     	movq	%rax, %rcx
145424e14:     	movq	%r14, %rdx
145424e17:     	movq	%rbx, %r8
145424e1a:     	callq	0x1457731ed <.text+0x57721ed>
145424e1f:     	jmp	0x145424e27 <.text+0x5423e27>
145424e21:     	movl	$0x1, %r15d
145424e27:     	movq	%rbx, -0x20(%rbp)
145424e2b:     	movq	%r15, -0x18(%rbp)
145424e2f:     	movq	%rbx, -0x10(%rbp)
145424e33:     	movq	0x28(%rbp), %rdx
145424e37:     	testq	%rdx, %rdx
145424e3a:     	je	0x145424e4b <.text+0x5423e4b>
145424e3c:     	movq	0x30(%rbp), %rcx
145424e40:     	movl	$0x1, %r8d
145424e46:     	callq	0x1400021d0 <.text+0x11d0>
145424e4b:     	movq	(%rbp), %rdx
145424e4f:     	testq	%rdx, %rdx
145424e52:     	je	0x145424bca <.text+0x5423bca>
145424e58:     	movq	0x8(%rbp), %rcx
145424e5c:     	movl	$0x1, %r8d
145424e62:     	callq	0x1400021d0 <.text+0x11d0>
145424e67:     	jmp	0x145424bca <.text+0x5423bca>
