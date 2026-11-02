
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145962c70:     	movq	0x210(%rbp), %rax
145962c77:     	subq	%rsi, %rax
145962c7a:     	cmpq	$0x1, %rax
145962c7e:     	jbe	0x145963d56 <.text+0x5962d56>
145962c84:     	movq	0x218(%rbp), %rax
145962c8b:     	movw	$0x0, (%rax,%rsi)
145962c91:     	addq	$0x2, 0x220(%rbp)
145962c99:     	movq	0x2c8(%rbp), %rsi
145962ca0:     	cmpq	0x2b8(%rbp), %rsi
145962ca7:     	jne	0x145962cb6 <.text+0x5961cb6>
145962ca9:     	leaq	0x2b8(%rbp), %rcx
145962cb0:     	callq	0x145d69340 <.text+0x5d68340>
145962cb5:     	nop
145962cb6:     	movq	0x2c0(%rbp), %rax
145962cbd:     	movb	$0x10, (%rax,%rsi)
145962cc1:     	incq	%rsi
145962cc4:     	movq	%rsi, 0x2c8(%rbp)
145962ccb:     	movq	0x220(%rbp), %rdi
145962cd2:     	movq	0x2b8(%rbp), %rax
145962cd9:     	subq	%rsi, %rax
145962cdc:     	cmpq	$0x1, %rax
145962ce0:     	jbe	0x145963d83 <.text+0x5962d83>
145962ce6:     	movq	0x2c0(%rbp), %rax
145962ced:     	movw	%di, (%rax,%rsi)
145962cf1:     	movq	0x2b8(%rbp), %rax
145962cf8:     	movq	0x2c8(%rbp), %rdx
145962cff:     	addq	$0x2, %rdx
145962d03:     	movq	%rdx, 0x2c8(%rbp)
145962d0a:     	movq	0x218(%rbp), %rbx
145962d11:     	movq	0x220(%rbp), %rsi
145962d18:     	subq	%rdx, %rax
145962d1b:     	cmpq	%rax, %rsi
145962d1e:     	ja	0x145963db4 <.text+0x5962db4>
145962d24:     	testq	%rsi, %rsi
145962d27:     	je	0x145962d45 <.text+0x5961d45>
145962d29:     	addq	0x2c0(%rbp), %rdx
145962d30:     	movq	%rdx, %rcx
145962d33:     	movq	%rbx, %rdx
145962d36:     	movq	%rsi, %r8
145962d39:     	callq	0x145bc977b <.text+0x5bc877b>
