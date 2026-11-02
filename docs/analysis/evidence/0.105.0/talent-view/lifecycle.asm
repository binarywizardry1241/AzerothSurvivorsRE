
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140130956:     	movq	0xf8(%rsp), %rax
14013095e:     	cmpb	$0x0, (%rax)
140130961:     	je	0x14013098a <.text+0x12f98a>
140130963:     	movq	0xd8(%rsp), %rcx
14013096b:     	movb	$0x1, %bl
14013096d:     	cmpb	$0x0, 0xe8(%rcx)
140130974:     	jne	0x14013098c <.text+0x12f98c>
140130976:     	movl	0x114(%rsp), %ecx
14013097d:     	movq	0x108(%rsp), %rdx
140130985:     	movl	%ecx, (%rdx)
140130987:     	movb	$0x0, (%rax)
14013098a:     	xorl	%ebx, %ebx
