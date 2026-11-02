
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dec1a:     	movq	0x150(%rbp), %rax
1454dec21:     	movq	%rax, 0x260(%rbp)
1454dec28:     	movq	0x158(%rbp), %rax
1454dec2f:     	movq	0x160(%rbp), %rsi
1454dec36:     	shlq	$0x4, %rsi
1454dec3a:     	movq	%rax, 0x240(%rbp)
1454dec41:     	nopw	%cs:(%rax,%rax)
1454dec50:     	testq	%rsi, %rsi
1454dec53:     	je	0x1454dec75 <.text+0x54ddc75>
1454dec55:     	leaq	0x10(%rax), %rdi
1454dec59:     	movq	(%rax), %rdx
1454dec5c:     	movl	0x8(%rax), %r8d
1454dec60:     	addq	$-0x10, %rsi
1454dec64:     	movq	%r13, %rcx
1454dec67:     	xorl	%r9d, %r9d
1454dec6a:     	callq	0x1454e3550 <.text+0x54e2550>
1454dec6f:     	nop
1454dec70:     	movq	%rdi, %rax
1454dec73:     	jmp	0x1454dec50 <.text+0x54ddc50>
