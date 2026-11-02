
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c0820:     	pushq	%rbp
1454c0821:     	pushq	%r15
1454c0823:     	pushq	%r14
1454c0825:     	pushq	%r12
1454c0827:     	pushq	%rsi
1454c0828:     	pushq	%rdi
1454c0829:     	pushq	%rbx
1454c082a:     	subq	$0x100, %rsp            # imm = 0x100
1454c0831:     	leaq	0x80(%rsp), %rbp
1454c0839:     	movdqa	%xmm6, 0x70(%rbp)
1454c083e:     	movq	$-0x2, 0x68(%rbp)
1454c0846:     	movl	%r9d, %r14d
1454c0849:     	movl	%r8d, %r12d
1454c084c:     	movq	%rdx, %rdi
1454c084f:     	movq	%rcx, %rsi
1454c0852:     	movzbl	0xf0(%rbp), %eax
1454c0859:     	leal	(%rax,%rax,2), %eax
1454c085c:     	addl	0x3f8(%rcx), %eax
1454c0862:     	cmpl	$0x3f, %eax
1454c0865:     	movl	$0x3f, %r15d
1454c086b:     	cmovbl	%eax, %r15d
