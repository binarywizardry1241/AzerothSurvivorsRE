
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145951622:     	movl	0x54(%rcx), %r8d
145951626:     	addl	%r8d, %edx
145951629:     	movl	0x4ac(%rbx), %r9d
145951630:     	leal	(%rdx,%r9), %r10d
145951634:     	cmpl	$0x1, %r10d
145951638:     	adcl	%r9d, %edx
14595163b:     	addl	$0x2, %edx
14595163e:     	testl	%r8d, %r8d
145951641:     	movl	$0x3, %r8d
145951647:     	cmovnel	%edx, %r8d
14595164b:     	movq	%r8, 0x8(%rbp)
