
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145901dfa:     	movzbl	0xa73(%rcx), %eax
145901e01:     	testb	%al, %al
145901e03:     	jne	0x145901e27 <.text+0x5900e27>
145901e05:     	cmpb	$0x0, 0xa6b(%r13)
145901e0d:     	je	0x145901e27 <.text+0x5900e27>
145901e0f:     	movb	$0x0, 0xa6b(%r13)
145901e17:     	movq	%r13, %rcx
145901e1a:     	callq	0x145917cc0 <.text+0x5916cc0>
145901e1f:     	movzbl	0xa73(%r13), %eax
145901e27:     	cmpb	$0x1, %al
145901e29:     	movq	%r13, 0x378(%rbp)
145901e30:     	jne	0x14590ff9f <.text+0x590ef9f>
145901e36:     	movss	0x9ec(%r13), %xmm7
145901e3f:     	addss	%xmm6, %xmm7
