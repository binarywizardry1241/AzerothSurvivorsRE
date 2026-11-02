
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145542df0:     	pushq	%rbp
145542df1:     	pushq	%r15
145542df3:     	pushq	%r14
145542df5:     	pushq	%rsi
145542df6:     	pushq	%rdi
145542df7:     	pushq	%rbx
145542df8:     	subq	$0x68, %rsp
145542dfc:     	leaq	0x60(%rsp), %rbp
145542e01:     	movq	$-0x2, (%rbp)
145542e09:     	movq	%rcx, %rsi
145542e0c:     	movq	0x8(%rdx), %rax
145542e10:     	movq	0x28(%rdx), %r14
145542e14:     	subq	(%rdx), %rax
145542e17:     	shrq	$0x3, %rax
145542e1b:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
145542e25:     	subq	0x18(%rdx), %r14
145542e29:     	imulq	%rcx, %rax
145542e2d:     	shrq	$0x3, %r14
145542e31:     	imulq	%rcx, %r14
145542e35:     	cmpq	%rax, %r14
145542e38:     	cmovaeq	%rax, %r14
145542e3c:     	movabsq	$0x555555555555555, %rax # imm = 0x555555555555555
145542e46:     	cmpq	%rax, %r14
145542e49:     	movq	%rdx, -0x28(%rbp)
145542e4d:     	jbe	0x145542e63 <.text+0x5541e63>
145542e4f:     	xorl	%ebx, %ebx
145542e51:     	movb	$0x1, -0x1(%rbp)
145542e55:     	movq	%rbx, %rcx
145542e58:     	movq	%rdi, %rdx
145542e5b:     	callq	0x14590379b <.text+0x590279b>
145542e60:     	nop
145542e61:     	ud2
145542e63:     	movq	%rdx, %r15
145542e66:     	testq	%r14, %r14
145542e69:     	je	0x145542e95 <.text+0x5541e95>
145542e6b:     	leaq	(,%r14,8), %rax
145542e73:     	leaq	(%rax,%rax,2), %rdi
145542e77:     	callq	0x140002200 <.text+0x1200>
145542e7c:     	movl	$0x8, %ebx
145542e81:     	movl	$0x8, %edx
145542e86:     	movq	%rdi, %rcx
145542e89:     	callq	0x1400021c0 <.text+0x11c0>
145542e8e:     	testq	%rax, %rax
145542e91:     	jne	0x145542e9a <.text+0x5541e9a>
145542e93:     	jmp	0x145542e51 <.text+0x5541e51>
145542e95:     	movl	$0x8, %eax
145542e9a:     	movq	%r14, -0x20(%rbp)
145542e9e:     	movq	%rax, -0x18(%rbp)
145542ea2:     	leaq	-0x10(%rbp), %rcx
145542ea6:     	movq	$0x0, -0x10(%rbp)
145542eae:     	movq	%rax, -0x30(%rbp)
145542eb2:     	movq	%rcx, -0x40(%rbp)
145542eb6:     	movq	$0x0, -0x38(%rbp)
145542ebe:     	leaq	-0x40(%rbp), %rdx
145542ec2:     	movq	%r15, %rcx
145542ec5:     	callq	0x145548750 <.text+0x5547750>
145542eca:     	nop
145542ecb:     	movq	-0x10(%rbp), %rax
145542ecf:     	movq	%rax, 0x10(%rsi)
145542ed3:     	movups	-0x20(%rbp), %xmm0
145542ed7:     	movups	%xmm0, (%rsi)
145542eda:     	movq	%rsi, %rax
145542edd:     	addq	$0x68, %rsp
145542ee1:     	popq	%rbx
145542ee2:     	popq	%rdi
145542ee3:     	popq	%rsi
145542ee4:     	popq	%r14
145542ee6:     	popq	%r15
145542ee8:     	popq	%rbp
145542ee9:     	retq
