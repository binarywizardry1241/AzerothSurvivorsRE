
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544d6de:     	movq	%rsi, %rcx
14544d6e1:     	callq	0x14544a260 <.text+0x5449260>
14544d6e6:     	movq	0x10(%rsi), %rax
14544d6ea:     	movq	$0x2, 0x10(%rsi)
14544d6f2:     	cmpq	$0x2, %rax
14544d6f6:     	je	0x14544ec0b <.text+0x544dc0b>
14544d6fc:     	leaq	0x18(%rsi), %rdx
14544d700:     	movq	%rax, -0x50(%rbp)
14544d704:     	leaq	-0x48(%rbp), %rcx
14544d708:     	movl	$0x9b8, %r8d            # imm = 0x9B8
14544d70e:     	callq	0x1457731ed <.text+0x57721ed>
