
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145499df4:     	testl	%r8d, %r8d
145499df7:     	je	0x145499e12 <.text+0x5498e12>
145499df9:     	movb	$0x0, 0x187(%rbp)
145499e00:     	leaq	0xc8(%rbp), %r9
145499e07:     	movq	%rsi, %rcx
145499e0a:     	xorl	%edx, %edx
145499e0c:     	callq	0x14549d330 <.text+0x549c330>
145499e11:     	nop
145499e12:     	movq	0xc0(%rbp), %r11
145499e19:     	cmpb	$0x0, 0x4c(%r11)
145499e1e:     	jne	0x145499e2b <.text+0x5498e2b>
145499e20:     	mulss	0x41ad07(%rip), %xmm8   # 0x1458b4b30
145499e29:     	jmp	0x145499e34 <.text+0x5498e34>
145499e2b:     	movss	0x40e5ec(%rip), %xmm8   # 0x1458a8420
145499e34:     	movq	0x888(%rsi), %rax
145499e3b:     	movq	0x870(%rsi), %rcx
145499e42:     	leaq	(%rax,%rcx), %rdx
145499e46:     	rolq	$0x17, %rdx
145499e4a:     	movq	0x878(%rsi), %r8
145499e51:     	addq	%rcx, %rdx
145499e54:     	movq	%r8, %r9
145499e57:     	shlq	$0x11, %r9
145499e5b:     	movq	0x880(%rsi), %r10
145499e62:     	xorq	%rcx, %r10
145499e65:     	xorq	%r8, %rax
145499e68:     	xorq	%r10, %r8
145499e6b:     	movq	%r8, 0x878(%rsi)
145499e72:     	xorq	%rax, %rcx
145499e75:     	movq	%rcx, 0x870(%rsi)
145499e7c:     	xorq	%r9, %r10
145499e7f:     	movq	%r10, 0x880(%rsi)
145499e86:     	rolq	$0x2d, %rax
145499e8a:     	movq	%rax, 0x888(%rsi)
145499e91:     	shrq	$0x28, %rdx
145499e95:     	xorps	%xmm0, %xmm0
145499e98:     	cvtsi2ss	%edx, %xmm0
145499e9c:     	mulss	0x4ea67c(%rip), %xmm0   # 0x145984520
145499ea4:     	ucomiss	%xmm0, %xmm8
145499ea8:     	jbe	0x145499f23 <.text+0x5498f23>
145499eaa:     	movl	$0xf, %r8d
145499eb0:     	cmpb	$0x0, 0x4c(%r11)
145499eb5:     	jne	0x145499eda <.text+0x5498eda>
145499eb7:     	leaq	0x870(%rsi), %rcx
145499ebe:     	movb	$0x0, 0x187(%rbp)
145499ec5:     	xorl	%edx, %edx
145499ec7:     	movl	$0x3, %r8d
145499ecd:     	callq	0x1454d7440 <.text+0x54d6440>
145499ed2:     	nop
145499ed3:     	movl	%eax, %r8d
145499ed6:     	addl	$0x2, %r8d
145499eda:     	movsd	0xc8(%rbp), %xmm0
145499ee2:     	addps	0x510e47(%rip), %xmm0   # 0x1459aad30
145499ee9:     	movss	0xd0(%rbp), %xmm1
145499ef1:     	movlps	%xmm0, 0x110(%rbp)
145499ef8:     	movss	%xmm1, 0x118(%rbp)
145499f00:     	movb	$0x0, 0x187(%rbp)
145499f07:     	leaq	0x110(%rbp), %r9
145499f0e:     	movq	%rsi, %rcx
145499f11:     	movl	$0x1, %edx
145499f16:     	callq	0x14549d330 <.text+0x549c330>
145499f1b:     	nop
145499f1c:     	movq	0xc0(%rbp), %r11
145499f23:     	cmpb	$0x0, 0x4c(%r11)
145499f28:     	je	0x145499f8d <.text+0x5498f8d>
145499f2a:     	movsd	0xc8(%rbp), %xmm7
145499f32:     	addps	0x1614d37(%rip), %xmm7  # 0x146aaec70
145499f39:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
145499f3d:     	movq	0x868(%rsi), %r14
145499f44:     	leaq	0x10(%r14), %rcx
145499f48:     	movb	$0x0, 0x187(%rbp)
145499f4f:     	movaps	%xmm7, %xmm1
145499f52:     	callq	0x1453f66f0 <.text+0x53f56f0>
145499f57:     	nop
145499f58:     	testb	$0x1, %al
145499f5a:     	jne	0x145499f62 <.text+0x5498f62>
145499f5c:     	movss	0x68(%r14), %xmm0
145499f62:     	movlps	%xmm7, 0x110(%rbp)
145499f69:     	movss	%xmm0, 0x118(%rbp)
145499f71:     	movb	$0x0, 0x187(%rbp)
145499f78:     	leaq	0x110(%rbp), %r9
145499f7f:     	movq	%rsi, %rcx
145499f82:     	movl	$0x2, %edx
145499f87:     	callq	0x14549d330 <.text+0x549c330>
145499f8c:     	nop
