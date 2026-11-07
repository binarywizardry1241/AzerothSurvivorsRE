
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590fa5f:     	ucomiss	0xa30(%r13), %xmm0
14590fa67:     	jb	0x14590fc5e <.text+0x590ec5e>
14590fa6d:     	movss	0x76c0ff(%rip), %xmm1   # 0x14607bb74
14590fa75:     	addss	%xmm0, %xmm1
14590fa79:     	movss	%xmm1, 0xa30(%r13)
14590fa82:     	movq	0x5c8(%r13), %rax
14590fa89:     	testq	%rax, %rax
14590fa8c:     	je	0x14590fb8f <.text+0x590eb8f>
14590fa92:     	movq	0x5c0(%r13), %rcx
14590fa99:     	cmpq	$0x4, %rax
14590fa9d:     	jae	0x14590faa9 <.text+0x590eaa9>
14590fa9f:     	xorl	%edx, %edx
14590faa1:     	xorl	%r8d, %r8d
14590faa4:     	jmp	0x14590fb61 <.text+0x590eb61>
14590faa9:     	movq	%rax, %rdx
14590faac:     	andq	$-0x4, %rdx
14590fab0:     	leaq	0xf8(%rcx), %r8
14590fab7:     	xorps	%xmm1, %xmm1
14590faba:     	movdqa	0x15689fe(%rip), %xmm2  # 0x146e784c0
14590fac2:     	movdqa	0x45dd16(%rip), %xmm3   # 0x145d6d7e0
14590faca:     	movdqa	0x15689fe(%rip), %xmm4  # 0x146e784d0
14590fad2:     	movdqa	0x45d836(%rip), %xmm5   # 0x145d6d310
14590fada:     	movq	%rdx, %r9
14590fadd:     	xorps	%xmm6, %xmm6
14590fae0:     	movd	-0x90(%r8), %xmm7
14590fae9:     	movd	-0xd8(%r8), %xmm8
14590faf2:     	punpcklqdq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0]
14590faf7:     	movd	(%r8), %xmm7
14590fafc:     	movd	-0x48(%r8), %xmm9
14590fb02:     	punpcklqdq	%xmm7, %xmm9    # xmm9 = xmm9[0],xmm7[0]
14590fb07:     	paddd	%xmm2, %xmm8
14590fb0c:     	pxor	%xmm3, %xmm8
14590fb11:     	movdqa	%xmm4, %xmm7
14590fb15:     	pcmpgtd	%xmm8, %xmm7
14590fb1a:     	pand	%xmm5, %xmm7
14590fb1e:     	paddq	%xmm7, %xmm6
14590fb22:     	paddd	%xmm2, %xmm9
14590fb27:     	pxor	%xmm3, %xmm9
14590fb2c:     	movdqa	%xmm4, %xmm7
14590fb30:     	pcmpgtd	%xmm9, %xmm7
14590fb35:     	pand	%xmm5, %xmm7
14590fb39:     	paddq	%xmm7, %xmm1
14590fb3d:     	addq	$0x120, %r8             # imm = 0x120
14590fb44:     	addq	$-0x4, %r9
14590fb48:     	jne	0x14590fae0 <.text+0x590eae0>
14590fb4a:     	paddq	%xmm6, %xmm1
14590fb4e:     	pshufd	$0xee, %xmm1, %xmm2     # xmm2 = xmm1[2,3,2,3]
14590fb53:     	paddq	%xmm1, %xmm2
14590fb57:     	movq	%xmm2, %r8
14590fb5c:     	cmpq	%rdx, %rax
14590fb5f:     	je	0x14590fb85 <.text+0x590eb85>
14590fb61:     	subq	%rdx, %rax
14590fb64:     	leaq	(%rdx,%rdx,8), %rdx
14590fb68:     	leaq	(%rcx,%rdx,8), %rcx
14590fb6c:     	addq	$0x20, %rcx
14590fb70:     	movl	(%rcx), %edx
14590fb72:     	addl	$-0x3, %edx
14590fb75:     	cmpl	$0x3, %edx
14590fb78:     	adcq	$0x0, %r8
14590fb7c:     	addq	$0x48, %rcx
14590fb80:     	decq	%rax
14590fb83:     	jne	0x14590fb70 <.text+0x590eb70>
14590fb85:     	cmpq	$0x1, %r8
14590fb89:     	ja	0x14590fc5e <.text+0x590ec5e>
14590fb8f:     	movq	0x958(%r13), %rdx
14590fb96:     	movq	0x960(%r13), %rax
14590fb9d:     	movq	0x970(%r13), %r8
14590fba4:     	movq	0x968(%r13), %rcx
14590fbab:     	nopl	(%rax,%rax)
14590fbb0:     	leaq	(%rdx,%r8), %r9
14590fbb4:     	rolq	$0x17, %r9
14590fbb8:     	addq	%rdx, %r9
14590fbbb:     	movq	%rax, %r10
14590fbbe:     	shlq	$0x11, %r10
14590fbc2:     	xorq	%rdx, %rcx
14590fbc5:     	xorq	%rax, %r8
14590fbc8:     	xorq	%rcx, %rax
14590fbcb:     	xorq	%r8, %rdx
14590fbce:     	xorq	%r10, %rcx
14590fbd1:     	rolq	$0x2d, %r8
14590fbd5:     	shrq	$0x20, %r9
14590fbd9:     	leaq	(%r9,%r9,2), %rdi
14590fbdd:     	movl	%edi, %r9d
14590fbe0:     	notl	%r9d
14590fbe3:     	testl	$0xc0000000, %r9d       # imm = 0xC0000000
14590fbea:     	je	0x14590fbb0 <.text+0x590ebb0>
14590fbec:     	movq	%rdx, 0x958(%r13)
14590fbf3:     	movq	%r8, 0x970(%r13)
14590fbfa:     	movq	%rax, 0x960(%r13)
14590fc01:     	movq	%rcx, 0x968(%r13)
14590fc08:     	leaq	0xa0(%rbp), %rcx
14590fc0f:     	movd	0x48e251(%rip), %xmm2   # 0x145d9de68
14590fc17:     	movd	0x461055(%rip), %xmm3   # 0x145d70c74
14590fc1f:     	movq	%r13, %rdx
14590fc22:     	callq	0x145933a30 <.text+0x5932a30>
14590fc27:     	nop
14590fc28:     	shrq	$0x20, %rdi
14590fc2c:     	xorl	%eax, %eax
14590fc2e:     	cmpq	$0x1, %rdi
14590fc32:     	sete	%al
14590fc35:     	xorl	$0x5, %eax
14590fc38:     	testq	%rdi, %rdi
14590fc3b:     	movl	$0x3, %edx
14590fc40:     	cmovnel	%eax, %edx
14590fc43:     	leaq	0xa0(%rbp), %r9
14590fc4a:     	movq	%r13, %rcx
14590fc4d:     	callq	0x145939820 <.text+0x5938820>
14590fc52:     	nop
14590fc53:     	movq	0x80(%rbp), %rax
14590fc5a:     	movss	(%rax), %xmm0
