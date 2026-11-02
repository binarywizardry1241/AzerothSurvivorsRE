
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14593dd8c:     	cmpl	$0x3d4, %r15d           # imm = 0x3D4
14593dd93:     	movb	%r8b, 0x260(%rbp)
14593dd9a:     	jne	0x14593de80 <.text+0x593ce80>
14593dda0:     	movq	0x2a0(%rbp), %rax
14593dda7:     	movq	0x560(%rax), %rcx
14593ddae:     	imulq	$0x160, 0x568(%rax), %rax # imm = 0x160
14593ddb9:     	nopl	(%rax)
14593ddc0:     	testq	%rax, %rax
14593ddc3:     	je	0x14593de80 <.text+0x593ce80>
14593ddc9:     	movq	%rcx, %rdx
14593ddcc:     	addq	$0x160, %rcx            # imm = 0x160
14593ddd3:     	addq	$-0x160, %rax           # imm = 0xFEA0
14593ddd9:     	cmpq	%r14, 0x88(%rdx)
14593dde0:     	jne	0x14593ddc0 <.text+0x593cdc0>
14593dde2:     	movss	0x158(%rdx), %xmm0
14593ddea:     	ucomiss	%xmm6, %xmm0
14593dded:     	jbe	0x14593ddc0 <.text+0x593cdc0>
14593ddef:     	movq	0x2a0(%rbp), %r11
14593ddf6:     	movq	0x958(%r11), %rax
14593ddfd:     	movq	0x970(%r11), %rcx
14593de04:     	leaq	(%rcx,%rax), %rdx
14593de08:     	rolq	$0x17, %rdx
14593de0c:     	addq	%rax, %rdx
14593de0f:     	movq	0x960(%r11), %r8
14593de16:     	movq	%r8, %r9
14593de19:     	shlq	$0x11, %r9
14593de1d:     	movq	0x968(%r11), %r10
14593de24:     	xorq	%rax, %r10
14593de27:     	xorq	%r8, %rcx
14593de2a:     	xorq	%r10, %r8
14593de2d:     	movq	%r8, 0x960(%r11)
14593de34:     	xorq	%rcx, %rax
14593de37:     	movq	%rax, 0x958(%r11)
14593de3e:     	xorq	%r9, %r10
14593de41:     	movq	%r10, 0x968(%r11)
14593de48:     	rolq	$0x2d, %rcx
14593de4c:     	movq	%rcx, 0x970(%r11)
14593de53:     	shrq	$0x28, %rdx
14593de57:     	xorps	%xmm0, %xmm0
14593de5a:     	cvtsi2ss	%edx, %xmm0
14593de5e:     	mulss	%xmm8, %xmm0
14593de63:     	movss	0x484(%r11), %xmm1
14593de6c:     	ucomiss	%xmm0, %xmm1
14593de6f:     	jbe	0x14593de80 <.text+0x593ce80>
14593de71:     	mulss	0x488(%r11), %xmm7
14593de7a:     	movb	$0x1, %r12b
14593de7d:     	jmp	0x14593de83 <.text+0x593ce83>
14593de7f:     	nop
14593de80:     	xorl	%r12d, %r12d
