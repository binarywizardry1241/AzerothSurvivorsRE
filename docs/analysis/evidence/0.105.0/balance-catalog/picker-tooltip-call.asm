
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401ed765:     	movq	(%r13), %rsi
1401ed769:     	movq	0x8(%r13), %rdi
1401ed76d:     	movl	$0x15, %edx
1401ed772:     	leaq	0x5bcbe33(%rip), %rcx   # 0x145db95ac
1401ed779:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401ed77e:     	nop
1401ed77f:     	cmpb	$0x0, 0x868(%rbp)
1401ed786:     	movl	$0x0, %ecx
1401ed78b:     	cmoveq	%rcx, %rax
1401ed78f:     	movq	%rdx, 0x28(%rsp)
1401ed794:     	movq	%rax, 0x20(%rsp)
1401ed799:     	movq	%r12, %rcx
1401ed79c:     	movq	0x850(%rbp), %rdx
1401ed7a3:     	movq	%rsi, %r8
1401ed7a6:     	movq	%rdi, %r9
1401ed7a9:     	callq	0x14007e870 <.text+0x7d870>
