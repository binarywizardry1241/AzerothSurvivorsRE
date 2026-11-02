
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14109cea0:     	pushq	%rbp
14109cea1:     	pushq	%r15
14109cea3:     	pushq	%r14
14109cea5:     	pushq	%rsi
14109cea6:     	pushq	%rdi
14109cea7:     	pushq	%rbx
14109cea8:     	subq	$0x58, %rsp
14109ceac:     	leaq	0x50(%rsp), %rbp
14109ceb1:     	movq	$-0x2, (%rbp)
14109ceb9:     	movq	0x8(%rdx), %r14
14109cebd:     	subq	(%rdx), %r14
14109cec0:     	movabsq	$0x924924924924920, %rax # imm = 0x924924924924920
14109ceca:     	cmpq	%rax, %r14
14109cecd:     	jbe	0x14109cede <.text+0x109bede>
14109cecf:     	xorl	%ebx, %ebx
14109ced1:     	movq	%rbx, %rcx
14109ced4:     	movq	%rdi, %rdx
14109ced7:     	callq	0x1458e721b <.text+0x58e621b>
14109cedc:     	ud2
14109cede:     	movq	%rcx, %rsi
14109cee1:     	shrq	$0x3, %r14
14109cee5:     	imulq	$0x70, %r14, %rdi
14109cee9:     	testq	%rdi, %rdi
14109ceec:     	je	0x14109cf12 <.text+0x109bf12>
14109ceee:     	movq	%rdx, %r15
14109cef1:     	callq	0x140002200 <.text+0x1200>
14109cef6:     	movl	$0x8, %ebx
14109cefb:     	movl	$0x8, %edx
14109cf00:     	movq	%rdi, %rcx
14109cf03:     	callq	0x1400021c0 <.text+0x11c0>
14109cf08:     	testq	%rax, %rax
14109cf0b:     	je	0x14109ced1 <.text+0x109bed1>
14109cf0d:     	movq	%r15, %rdx
14109cf10:     	jmp	0x14109cf1a <.text+0x109bf1a>
14109cf12:     	movl	$0x8, %eax
14109cf17:     	xorl	%r14d, %r14d
14109cf1a:     	movq	%r14, -0x18(%rbp)
14109cf1e:     	movq	%rax, -0x10(%rbp)
14109cf22:     	leaq	-0x8(%rbp), %rcx
14109cf26:     	movq	$0x0, -0x8(%rbp)
14109cf2e:     	movq	%rax, -0x20(%rbp)
14109cf32:     	movq	%rcx, -0x30(%rbp)
14109cf36:     	movq	$0x0, -0x28(%rbp)
14109cf3e:     	leaq	-0x30(%rbp), %rax
14109cf42:     	movq	%rdx, %rcx
14109cf45:     	movq	%rax, %rdx
14109cf48:     	callq	0x14061b5e0 <.text+0x61a5e0>
14109cf4d:     	nop
14109cf4e:     	movq	-0x8(%rbp), %rax
14109cf52:     	movq	%rax, 0x10(%rsi)
14109cf56:     	movups	-0x18(%rbp), %xmm0
14109cf5a:     	movups	%xmm0, (%rsi)
14109cf5d:     	movq	%rsi, %rax
14109cf60:     	addq	$0x58, %rsp
14109cf64:     	popq	%rbx
14109cf65:     	popq	%rdi
14109cf66:     	popq	%rsi
14109cf67:     	popq	%r14
14109cf69:     	popq	%r15
14109cf6b:     	popq	%rbp
14109cf6c:     	retq
