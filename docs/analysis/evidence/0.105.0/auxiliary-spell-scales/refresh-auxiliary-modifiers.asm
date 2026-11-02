
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459286e8:     	movq	0xb8(%rsi), %r14
1459286ef:     	imulq	$0x70, 0xc0(%rsi), %rdi
1459286f7:     	addq	%r14, %rdi
1459286fa:     	leaq	0x120(%rbp), %rbx
145928701:     	cmpq	%rdi, %r14
145928704:     	je	0x145928751 <.text+0x5927751>
145928706:     	nopw	%cs:(%rax,%rax)
145928710:     	movq	(%r14), %r8
145928713:     	movb	$0x0, 0x1a7(%rbp)
14592871a:     	movq	%rbx, %rcx
14592871d:     	movq	%r15, %rdx
145928720:     	callq	0x1458e3a30 <.text+0x58e2a30>
145928725:     	nop
145928726:     	movl	0x140(%rbp), %eax
14592872c:     	movl	%eax, 0x64(%r14)
145928730:     	movups	0x120(%rbp), %xmm0
145928737:     	movups	0x130(%rbp), %xmm1
14592873e:     	movups	%xmm1, 0x54(%r14)
145928743:     	movups	%xmm0, 0x44(%r14)
145928748:     	addq	$0x70, %r14
14592874c:     	cmpq	%rdi, %r14
14592874f:     	jne	0x145928710 <.text+0x5927710>
