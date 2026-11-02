Disassembly of section .text:

0000000140001000 <.text>:
140001779:     	movq	0xf0(%rbp), %rdx
140001780:     	xorl	%eax, %eax
140001782:     	cmpq	$-0x2, %rdx
140001786:     	jne	0x14000179f <.text+0x79f>
140001788:     	cmpq	$0x1, 0x108(%rbp)
140001790:     	jne	0x14000179f <.text+0x79f>
140001792:     	movq	0x100(%rbp), %rax
140001799:     	cmpb	$0x31, (%rax)
14000179c:     	sete	%al
