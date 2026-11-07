
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ce754:     	movl	$0x0, -0x8(%rax,%rcx)
1454ce75c:     	movl	$0x1, %edx
1454ce761:     	movq	0x200(%rbp), %r8
1454ce768:     	movq	%rbx, %rdi
1454ce76b:     	cmpl	%edx, %r8d
1454ce76e:     	cmovbl	%r8d, %edx
1454ce772:     	movl	%edx, -0x8(%rax,%rcx)
1454ce776:     	addss	%xmm11, %xmm9
1454ce77b:     	movss	%xmm9, -0x4(%rax,%rcx)
1454ce782:     	movb	$0x1, %al
1454ce784:     	movq	%rax, 0x70(%rbp)
