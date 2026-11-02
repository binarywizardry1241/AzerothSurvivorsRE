
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14000ff00:     	pushq	%rbp
14000ff01:     	pushq	%r15
14000ff03:     	pushq	%r14
14000ff05:     	pushq	%rsi
14000ff06:     	pushq	%rdi
14000ff07:     	pushq	%rbx
14000ff08:     	subq	$0xa8, %rsp
14000ff0f:     	leaq	0x80(%rsp), %rbp
14000ff17:     	movq	$-0x2, 0x20(%rbp)
14000ff1f:     	movq	%rdx, %rdi
14000ff22:     	movq	%rcx, %rsi
14000ff25:     	cmpq	$-0x1, (%rdx)
14000ff29:     	je	0x14000ff4d <.text+0xef4d>
14000ff2b:     	movq	0x8(%rdi), %r14
14000ff2f:     	movq	0x10(%rdi), %rbx
14000ff33:     	cmpq	$-0x1, 0x18(%rdi)
14000ff38:     	jne	0x14000ff5b <.text+0xef5b>
14000ff3a:     	movq	%r14, %rcx
14000ff3d:     	movq	%rbx, %rdx
14000ff40:     	callq	0x1458b8140 <.text+0x58b7140>
14000ff45:     	movq	%rdx, %r8
14000ff48:     	jmp	0x140010047 <.text+0xf047>
14000ff4d:     	cmpq	$-0x1, 0x18(%rdi)
14000ff52:     	je	0x14001003f <.text+0xf03f>
14000ff58:     	xorl	%r14d, %r14d
14000ff5b:     	movq	0x20(%rdi), %rdx
14000ff5f:     	xorl	%eax, %eax
14000ff61:     	cmpq	$-0x1, 0x30(%rdi)
14000ff66:     	movq	0x28(%rdi), %r8
14000ff6a:     	cmovneq	0x40(%rdi), %rax
14000ff6f:     	movl	$0x1, %r15d
14000ff75:     	movq	0x38(%rdi), %r9
14000ff79:     	cmoveq	%r15, %r9
14000ff7d:     	movq	%rax, 0x20(%rsp)
14000ff82:     	leaq	-0x20(%rbp), %rcx
14000ff86:     	callq	0x1458b6e90 <.text+0x58b5e90>
