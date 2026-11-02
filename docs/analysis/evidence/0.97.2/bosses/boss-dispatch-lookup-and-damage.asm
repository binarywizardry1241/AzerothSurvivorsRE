
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ccbb0:     	cmpq	0x260(%rbp), %rdi
1454ccbb7:     	je	0x1454cdd10 <.text+0x54ccd10>
1454ccbbd:     	movq	%rdi, %rax
1454ccbc0:     	movl	0x8(%rdi), %edx
1454ccbc3:     	cmpl	$-0x1, %edx
1454ccbc6:     	je	0x1454cdd10 <.text+0x54ccd10>
1454ccbcc:     	leaq	0x20(%rax), %rdi
1454ccbd0:     	movq	(%rax), %r12
1454ccbd3:     	movq	0x2a0(%rbp), %r8
1454ccbda:     	cmpq	0x4d0(%r8), %r12
1454ccbe1:     	jae	0x1454ccbb0 <.text+0x54cbbb0>
1454ccbe3:     	movq	0x4c8(%r8), %rcx
1454ccbea:     	imulq	$0x160, %r12, %rbx      # imm = 0x160
1454ccbf1:     	cmpb	$0x0, 0x68(%rcx,%rbx)
1454ccbf6:     	jne	0x1454ccbb0 <.text+0x54cbbb0>
1454ccbf8:     	movss	0x8e4(%r8), %xmm3
1454ccc01:     	addq	%rbx, %rcx
1454ccc04:     	movss	0x128(%rcx), %xmm0
1454ccc0c:     	xorps	%xmm1, %xmm1
1454ccc0f:     	ucomiss	%xmm0, %xmm1
1454ccc12:     	jae	0x1454ccc71 <.text+0x54cbc71>
1454ccc14:     	movaps	%xmm3, %xmm1
1454ccc17:     	subss	0x124(%rcx), %xmm1
1454ccc1f:     	divss	%xmm0, %xmm1
1454ccc23:     	xorps	%xmm0, %xmm0
1454ccc26:     	maxss	%xmm1, %xmm0
1454ccc2a:     	movaps	%xmm12, %xmm1
1454ccc2e:     	minss	%xmm0, %xmm1
1454ccc32:     	movsd	0x10c(%rcx), %xmm0
1454ccc3a:     	movsd	0x118(%rcx), %xmm2
1454ccc42:     	subps	%xmm0, %xmm2
1454ccc45:     	movsldup	%xmm1, %xmm6            # xmm6 = xmm1[0,0,2,2]
1454ccc49:     	mulps	%xmm2, %xmm6
1454ccc4c:     	addps	%xmm0, %xmm6
1454ccc4f:     	movss	0x114(%rcx), %xmm0
1454ccc57:     	movss	0x120(%rcx), %xmm11
1454ccc60:     	subss	%xmm0, %xmm11
1454ccc65:     	mulss	%xmm1, %xmm11
1454ccc6a:     	addss	%xmm0, %xmm11
1454ccc6f:     	jmp	0x1454ccc82 <.text+0x54cbc82>
1454ccc71:     	movsd	0x118(%rcx), %xmm6
1454ccc79:     	movss	0x120(%rcx), %xmm11
1454ccc82:     	movaps	%xmm12, %xmm1
1454ccc86:     	subss	0xa0(%rcx), %xmm1
1454ccc8e:     	movss	0xf8(%rcx), %xmm2
1454ccc96:     	movaps	%xmm3, %xmm0
1454ccc99:     	cmpltss	0xa4(%rcx), %xmm0
1454ccca2:     	mulss	%xmm2, %xmm1
1454ccca6:     	andps	%xmm0, %xmm1
1454ccca9:     	andnps	%xmm2, %xmm0
1454cccac:     	orps	%xmm1, %xmm0
1454cccaf:     	movaps	%xmm0, %xmm7
1454cccb2:     	mulss	0x42c086(%rip), %xmm7   # 0x1458f8d40
1454cccba:     	testb	$0x1, 0x38(%rcx)
1454cccbe:     	jne	0x1454cccc3 <.text+0x54cbcc3>
1454cccc0:     	movaps	%xmm0, %xmm7
1454cccc3:     	cmpq	$-0x1, 0x18(%rcx)
1454cccc8:     	jne	0x1454ccccd <.text+0x54cbccd>
1454cccca:     	movaps	%xmm0, %xmm7
1454ccccd:     	movl	0xc(%rax), %r15d
1454cccd1:     	movl	0x10(%rax), %r14d
1454cccd5:     	movss	0x14(%rax), %xmm8
1454cccdb:     	movq	0x88(%rcx), %r13
1454ccce2:     	movq	0x2a0(%rbp), %rsi
1454ccce9:     	movsd	0x3e8(%rsi), %xmm1
1454cccf1:     	movl	%edx, %edx
1454cccf3:     	leaq	0x14e00c6(%rip), %r8    # 0x1469acdc0
1454cccfa:     	movslq	(%r8,%rdx,4), %rdx
1454cccfe:     	addq	%r8, %rdx
1454ccd01:     	movaps	%xmm3, 0x240(%rbp)
1454ccd08:     	jmpq	*%rdx
