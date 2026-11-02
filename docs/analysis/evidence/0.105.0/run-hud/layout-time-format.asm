
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140012ba0:     	pushq	%rsi
140012ba1:     	subq	$0x50, %rsp
140012ba5:     	movq	%rcx, %rsi
140012ba8:     	xorpd	%xmm0, %xmm0
140012bac:     	maxsd	%xmm0, %xmm1
140012bb0:     	cvttsd2si	%xmm1, %rax
140012bb5:     	movq	%rax, %rcx
140012bb8:     	movapd	%xmm1, %xmm2
140012bbc:     	subsd	0x5d5a6b4(%rip), %xmm2  # 0x145d6d278
140012bc4:     	cvttsd2si	%xmm2, %rdx
140012bc9:     	sarq	$0x3f, %rcx
140012bcd:     	andq	%rcx, %rdx
140012bd0:     	orq	%rax, %rdx
140012bd3:     	xorl	%eax, %eax
140012bd5:     	ucomisd	%xmm0, %xmm1
140012bd9:     	cmovaeq	%rdx, %rax
140012bdd:     	ucomisd	0x5d5a69b(%rip), %xmm1  # 0x145d6d280
140012be5:     	movq	$-0x1, %rcx
140012bec:     	cmovbeq	%rax, %rcx
140012bf0:     	movabsq	$-0x7777777777777777, %rdx # imm = 0x8888888888888889
140012bfa:     	movq	%rcx, %rax
140012bfd:     	mulq	%rdx
140012c00:     	shrq	$0x5, %rdx
140012c04:     	movq	%rdx, 0x20(%rsp)
140012c09:     	imulq	$0x3c, %rdx, %rax
140012c0d:     	subq	%rax, %rcx
140012c10:     	movq	%rcx, 0x28(%rsp)
140012c15:     	leaq	0x20(%rsp), %rax
140012c1a:     	movq	%rax, 0x30(%rsp)
140012c1f:     	leaq	0x5b9c24a(%rip), %rax   # 0x145baee70 <.text+0x5bade70>
140012c26:     	movq	%rax, 0x38(%rsp)
140012c2b:     	leaq	0x28(%rsp), %rcx
140012c30:     	movq	%rcx, 0x40(%rsp)
140012c35:     	movq	%rax, 0x48(%rsp)
140012c3a:     	leaq	0x5d5c316(%rip), %rdx   # 0x145d6ef57
140012c41:     	leaq	0x30(%rsp), %r8
140012c46:     	movq	%rsi, %rcx
140012c49:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
140012c4e:     	movq	%rsi, %rax
140012c51:     	addq	$0x50, %rsp
140012c55:     	popq	%rsi
140012c56:     	retq
