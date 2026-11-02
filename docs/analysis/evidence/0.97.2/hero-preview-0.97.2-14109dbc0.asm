
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14109dbc0:     	pushq	%rbp
14109dbc1:     	pushq	%r15
14109dbc3:     	pushq	%r14
14109dbc5:     	pushq	%rsi
14109dbc6:     	pushq	%rdi
14109dbc7:     	pushq	%rbx
14109dbc8:     	subq	$0x58, %rsp
14109dbcc:     	leaq	0x50(%rsp), %rbp
14109dbd1:     	movq	$-0x2, (%rbp)
14109dbd9:     	movq	0x8(%rdx), %r14
14109dbdd:     	subq	(%rdx), %r14
14109dbe0:     	movabsq	$0x787878787878780, %rax # imm = 0x787878787878780
14109dbea:     	cmpq	%rax, %r14
14109dbed:     	jbe	0x14109dbfe <.text+0x109cbfe>
14109dbef:     	xorl	%ebx, %ebx
14109dbf1:     	movq	%rbx, %rcx
14109dbf4:     	movq	%rdi, %rdx
14109dbf7:     	callq	0x1458e721b <.text+0x58e621b>
14109dbfc:     	ud2
14109dbfe:     	movq	%rcx, %rsi
14109dc01:     	movq	%r14, %rdi
14109dc04:     	shlq	$0x4, %rdi
14109dc08:     	addq	%r14, %rdi
14109dc0b:     	je	0x14109dc35 <.text+0x109cc35>
14109dc0d:     	movq	%rdx, %r15
14109dc10:     	callq	0x140002200 <.text+0x1200>
14109dc15:     	movl	$0x8, %ebx
14109dc1a:     	movl	$0x8, %edx
14109dc1f:     	movq	%rdi, %rcx
14109dc22:     	callq	0x1400021c0 <.text+0x11c0>
14109dc27:     	testq	%rax, %rax
14109dc2a:     	je	0x14109dbf1 <.text+0x109cbf1>
14109dc2c:     	shrq	$0x3, %r14
14109dc30:     	movq	%r15, %rdx
14109dc33:     	jmp	0x14109dc3d <.text+0x109cc3d>
14109dc35:     	movl	$0x8, %eax
14109dc3a:     	xorl	%r14d, %r14d
14109dc3d:     	movq	%r14, -0x18(%rbp)
14109dc41:     	movq	%rax, -0x10(%rbp)
14109dc45:     	leaq	-0x8(%rbp), %rcx
14109dc49:     	movq	$0x0, -0x8(%rbp)
14109dc51:     	movq	%rax, -0x20(%rbp)
14109dc55:     	movq	%rcx, -0x30(%rbp)
14109dc59:     	movq	$0x0, -0x28(%rbp)
14109dc61:     	leaq	-0x30(%rbp), %rax
14109dc65:     	movq	%rdx, %rcx
14109dc68:     	movq	%rax, %rdx
14109dc6b:     	callq	0x14061b100 <.text+0x61a100>
14109dc70:     	nop
14109dc71:     	movq	-0x8(%rbp), %rax
14109dc75:     	movq	%rax, 0x10(%rsi)
14109dc79:     	movups	-0x18(%rbp), %xmm0
14109dc7d:     	movups	%xmm0, (%rsi)
14109dc80:     	movq	%rsi, %rax
14109dc83:     	addq	$0x58, %rsp
14109dc87:     	popq	%rbx
14109dc88:     	popq	%rdi
14109dc89:     	popq	%rsi
14109dc8a:     	popq	%r14
14109dc8c:     	popq	%r15
14109dc8e:     	popq	%rbp
14109dc8f:     	retq
