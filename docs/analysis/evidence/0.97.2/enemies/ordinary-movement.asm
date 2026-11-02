
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cbaf5:     	movshdup	%xmm10, %xmm1           # xmm1 = xmm10[1,1,3,3]
1454cbafa:     	movaps	%xmm10, %xmm0
1454cbafe:     	callq	0x145756e67 <.text+0x5755e67>
1454cbb03:     	maxss	0x483805(%rip), %xmm0   # 0x14594f310
1454cbb0b:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454cbb0f:     	divps	%xmm0, %xmm10
1454cbb13:     	movsldup	%xmm12, %xmm0           # xmm0 = xmm12[0,0,2,2]
1454cbb18:     	mulps	%xmm10, %xmm0
1454cbb1c:     	movaps	0x260(%rbp), %xmm9
1454cbb24:     	addps	%xmm0, %xmm9
1454cbb28:     	movlps	%xmm9, 0xa8(%rbp)
1454cbb30:     	movss	0x18c(%rbp), %xmm0
1454cbb38:     	movss	%xmm0, 0xb0(%rbp)
1454cbb40:     	movaps	%xmm13, %xmm0
1454cbb44:     	subps	%xmm9, %xmm0
1454cbb48:     	mulps	%xmm0, %xmm0
1454cbb4b:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454cbb4f:     	addss	%xmm0, %xmm1
1454cbb53:     	xorps	%xmm0, %xmm0
1454cbb56:     	sqrtss	%xmm1, %xmm0
1454cbb5a:     	movss	0x431282(%rip), %xmm1   # 0x1458fcde4
1454cbb62:     	ucomiss	%xmm1, %xmm0
1454cbb65:     	jbe	0x1454cbb97 <.text+0x54cab97>
1454cbb67:     	divss	%xmm0, %xmm1
1454cbb6b:     	subps	%xmm13, %xmm9
1454cbb6f:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454cbb73:     	mulps	%xmm9, %xmm0
1454cbb77:     	addps	%xmm13, %xmm0
1454cbb7b:     	movss	0x278(%rbp), %xmm10
1454cbb84:     	movaps	%xmm0, %xmm9
1454cbb88:     	cmpq	$-0x1, 0x98(%rbp)
1454cbb90:     	jne	0x1454cbbae <.text+0x54cabae>
1454cbb92:     	jmp	0x1454cbc77 <.text+0x54cac77>
1454cbb97:     	movss	0x18c(%rbp), %xmm10
1454cbba0:     	cmpq	$-0x1, 0x98(%rbp)
1454cbba8:     	je	0x1454cbc77 <.text+0x54cac77>
1454cbbae:     	movq	0xb8(%rbp), %rdx
1454cbbb5:     	testq	%rdx, %rdx
1454cbbb8:     	je	0x1454cbc77 <.text+0x54cac77>
1454cbbbe:     	addq	$0x10, %rdx
1454cbbc2:     	movb	$0x1, 0x2b7(%rbp)
1454cbbc9:     	movb	$0x1, 0x2b6(%rbp)
1454cbbd0:     	movb	$0x1, 0x2b5(%rbp)
1454cbbd7:     	movb	$0x1, 0x2b4(%rbp)
1454cbbde:     	movb	$0x1, 0x2b3(%rbp)
1454cbbe5:     	movb	$0x1, 0x2b2(%rbp)
1454cbbec:     	movb	$0x1, 0x2b1(%rbp)
1454cbbf3:     	movb	$0x1, 0x2b0(%rbp)
1454cbbfa:     	movb	$0x1, 0x2af(%rbp)
1454cbc01:     	leaq	0xa8(%rbp), %rax
1454cbc08:     	movq	%rax, 0x20(%rsp)
1454cbc0d:     	movl	$0x41600000, 0x28(%rsp) # imm = 0x41600000
1454cbc15:     	leaq	0x1f0(%rbp), %rcx
1454cbc1c:     	movq	0xa0(%rbp), %r8
1454cbc23:     	leaq	0x270(%rbp), %r9
1454cbc2a:     	callq	0x1454654b0 <.text+0x54644b0>
1454cbc2f:     	nop
1454cbc30:     	movl	0x1f0(%rbp), %eax
1454cbc36:     	testl	%eax, %eax
1454cbc38:     	je	0x1454cbc43 <.text+0x54cac43>
1454cbc3a:     	movss	0x278(%rbp), %xmm10
1454cbc43:     	movq	0x290(%rbp), %rdi
1454cbc4a:     	movq	0x1f4(%rbp), %xmm0
1454cbc52:     	movd	%eax, %xmm1
1454cbc56:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454cbc5b:     	pslld	$0x1f, %xmm1
1454cbc60:     	psrad	$0x1f, %xmm1
1454cbc65:     	pand	%xmm1, %xmm0
1454cbc69:     	pandn	%xmm9, %xmm1
1454cbc6e:     	por	%xmm0, %xmm1
1454cbc72:     	movdqa	%xmm1, %xmm9
1454cbc77:     	movaps	%xmm11, %xmm0
1454cbc7b:     	subss	0x98(%rdi), %xmm0
1454cbc83:     	movss	0xfc(%rdi), %xmm2
1454cbc8b:     	movaps	%xmm6, %xmm1
1454cbc8e:     	cmpltss	0x9c(%rdi), %xmm1
1454cbc97:     	mulss	%xmm2, %xmm0
1454cbc9b:     	andps	%xmm1, %xmm0
1454cbc9e:     	andnps	%xmm2, %xmm1
1454cbca1:     	orps	%xmm0, %xmm1
1454cbca4:     	movaps	%xmm1, %xmm0
1454cbca7:     	mulss	0x52b825(%rip), %xmm0   # 0x1459f74d4
1454cbcaf:     	testb	$0x1, 0x38(%rdi)
1454cbcb3:     	jne	0x1454cbcb8 <.text+0x54cacb8>
1454cbcb5:     	movaps	%xmm1, %xmm0
1454cbcb8:     	cmpq	$-0x1, 0x18(%rdi)
1454cbcbd:     	jne	0x1454cbcc2 <.text+0x54cacc2>
1454cbcbf:     	movaps	%xmm1, %xmm0
1454cbcc2:     	subps	%xmm9, %xmm13
1454cbcc6:     	mulps	%xmm13, %xmm13
1454cbcca:     	movshdup	%xmm13, %xmm1           # xmm1 = xmm13[1,1,3,3]
1454cbccf:     	addss	%xmm13, %xmm1
1454cbcd4:     	xorps	%xmm12, %xmm12
1454cbcd8:     	sqrtss	%xmm1, %xmm12
1454cbcdd:     	maxss	0x41f7a3(%rip), %xmm0   # 0x1458eb488
1454cbce5:     	divss	%xmm0, %xmm12
1454cbcea:     	movq	0x270(%rbp), %rax
1454cbcf1:     	movq	%rax, 0x10c(%rdi)
1454cbcf8:     	movl	0x278(%rbp), %eax
1454cbcfe:     	movl	%eax, 0x114(%rdi)
1454cbd04:     	movlpd	%xmm9, 0x118(%rdi)
1454cbd0d:     	movss	%xmm10, 0x120(%rdi)
1454cbd16:     	movss	%xmm6, 0x124(%rdi)
1454cbd1e:     	movss	%xmm12, 0x128(%rdi)
1454cbd27:     	movss	0x4212e1(%rip), %xmm0   # 0x1458ed010
1454cbd2f:     	maxss	%xmm12, %xmm0
1454cbd34:     	movss	0x43f1d0(%rip), %xmm1   # 0x14590af0c
1454cbd3c:     	minss	%xmm0, %xmm1
1454cbd40:     	addss	%xmm6, %xmm1
1454cbd44:     	movss	%xmm1, 0x12c(%rdi)
1454cbd4c:     	movq	0x88(%rdi), %rdi
1454cbd53:     	movq	0x1e8(%rbp), %rsi
1454cbd5a:     	cmpq	0x1d8(%rbp), %rsi
1454cbd61:     	jne	0x1454cbdaf <.text+0x54cadaf>
1454cbd63:     	movb	$0x1, 0x2b7(%rbp)
1454cbd6a:     	movb	$0x1, 0x2b6(%rbp)
1454cbd71:     	movb	$0x1, 0x2b5(%rbp)
1454cbd78:     	movb	$0x1, 0x2b4(%rbp)
1454cbd7f:     	movb	$0x1, 0x2b3(%rbp)
1454cbd86:     	movb	$0x1, 0x2b2(%rbp)
1454cbd8d:     	movb	$0x1, 0x2b1(%rbp)
1454cbd94:     	movb	$0x1, 0x2b0(%rbp)
1454cbd9b:     	movb	$0x1, 0x2af(%rbp)
1454cbda2:     	leaq	0x1d8(%rbp), %rcx
1454cbda9:     	callq	0x145758120 <.text+0x5757120>
1454cbdae:     	nop
1454cbdaf:     	movq	0x1e0(%rbp), %rax
1454cbdb6:     	leaq	(%rsi,%rsi,4), %rcx
1454cbdba:     	movq	%rdi, (%rax,%rcx,8)
1454cbdbe:     	movq	0x270(%rbp), %rdx
1454cbdc5:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454cbdca:     	movl	0x278(%rbp), %edx
1454cbdd0:     	movl	%edx, 0x10(%rax,%rcx,8)
1454cbdd4:     	movlpd	%xmm9, 0x14(%rax,%rcx,8)
1454cbddb:     	movss	%xmm10, 0x1c(%rax,%rcx,8)
1454cbde2:     	movss	%xmm12, 0x20(%rax,%rcx,8)
1454cbde9:     	incq	%rsi
1454cbdec:     	movq	%rsi, 0x1e8(%rbp)
1454cbdf3:     	movq	0x2a0(%rbp), %r12
1454cbdfa:     	jmp	0x1454c9a4c <.text+0x54c8a4c>
