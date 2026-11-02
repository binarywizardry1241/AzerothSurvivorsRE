
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587c1e3:     	xorl	%ebx, %ebx
14587c1e5:     	cmpl	$0xd, %r12d
14587c1e9:     	ja	0x14587c236 <.text+0x587b236>
14587c1eb:     	movl	$0x24c0, %eax           # imm = 0x24C0
14587c1f0:     	btl	%r12d, %eax
14587c1f4:     	jae	0x14587c236 <.text+0x587b236>
14587c1f6:     	cmpq	0x30(%rbp), %rbx
14587c1fa:     	jne	0x14587c206 <.text+0x587b206>
14587c1fc:     	leaq	0x30(%rbp), %rcx
14587c200:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c205:     	nop
14587c206:     	movq	0x38(%rbp), %rax
14587c20a:     	movl	%ebx, %ecx
14587c20c:     	shll	$0x6, %ecx
14587c20f:     	movb	$0x24, (%rax,%rcx)
14587c213:     	movb	$0x1, 0x8(%rax,%rcx)
14587c218:     	movq	%r14, 0x10(%rax,%rcx)
14587c21d:     	movq	%r15, 0x18(%rax,%rcx)
14587c222:     	movl	$0x3f19999a, 0x20(%rax,%rcx) # imm = 0x3F19999A
14587c22a:     	movb	$0x0, 0x24(%rax,%rcx)
14587c22f:     	incq	%rbx
14587c232:     	movq	%rbx, 0x40(%rbp)
14587c236:     	cmpl	$0xd, %r12d
14587c23a:     	ja	0x14587c24d <.text+0x587b24d>
14587c23c:     	movl	$0x2700, %eax           # imm = 0x2700
14587c241:     	btl	%r12d, %eax
14587c245:     	jae	0x14587c24d <.text+0x587b24d>
14587c247:     	ucomiss	0x48(%rdi), %xmm6
14587c24b:     	jae	0x14587c28d <.text+0x587b28d>
14587c24d:     	cmpq	0x30(%rbp), %rbx
14587c251:     	jne	0x14587c25d <.text+0x587b25d>
14587c253:     	leaq	0x30(%rbp), %rcx
14587c257:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c25c:     	nop
14587c25d:     	movq	0x38(%rbp), %rax
14587c261:     	movl	%ebx, %ecx
14587c263:     	shll	$0x6, %ecx
14587c266:     	movb	$0x24, (%rax,%rcx)
14587c26a:     	movb	$0x1, 0x8(%rax,%rcx)
14587c26f:     	movq	%r14, 0x10(%rax,%rcx)
14587c274:     	movq	%r15, 0x18(%rax,%rcx)
14587c279:     	movl	$0x3eb33333, 0x20(%rax,%rcx) # imm = 0x3EB33333
14587c281:     	movb	%sil, 0x24(%rax,%rcx)
14587c286:     	incq	%rbx
14587c289:     	movq	%rbx, 0x40(%rbp)
