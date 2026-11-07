
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543fe5c:     	cmpb	$0x0, 0x128(%rbp)
14543fe63:     	leaq	0x490(%rbp), %r13
14543fe6a:     	je	0x14543fef6 <.text+0x543eef6>
14543fe70:     	movq	0x4f8(%rbp), %rcx
14543fe77:     	callq	0x14544a260 <.text+0x5449260>
14543fe7c:     	nop
14543fe7d:     	movq	0x488(%rbp), %rax
14543fe84:     	cmpl	$0x2, (%rax)
14543fe87:     	je	0x14543fe96 <.text+0x543ee96>
14543fe89:     	movq	0x488(%rbp), %rcx
14543fe90:     	callq	0x14543d7e0 <.text+0x543c7e0>
14543fe95:     	nop
14543fe96:     	movq	0x4f8(%rbp), %rsi
14543fe9d:     	movq	$0x2, 0x10(%rsi)
