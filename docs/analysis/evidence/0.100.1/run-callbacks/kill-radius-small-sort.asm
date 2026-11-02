
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14193aca0:     	pushq	%rsi
14193aca1:     	pushq	%rdi
14193aca2:     	pushq	%rbx
14193aca3:     	leaq	-0x1(%r8), %rax
14193aca7:     	cmpq	%rdx, %rax
14193acaa:     	jae	0x14193ad4a <.text+0x1939d4a>
14193acb0:     	cmpq	%rdx, %r8
14193acb3:     	jne	0x14193acb9 <.text+0x1939cb9>
14193acb5:     	popq	%rbx
14193acb6:     	popq	%rdi
14193acb7:     	popq	%rsi
14193acb8:     	retq
14193acb9:     	shlq	$0x4, %rdx
14193acbd:     	addq	%rcx, %rdx
14193acc0:     	shlq	$0x4, %r8
14193acc4:     	leaq	(%rcx,%r8), %rax
14193acc8:     	jmp	0x14193ace7 <.text+0x1939ce7>
14193acca:     	nopw	(%rax,%rax)
14193acd0:     	movq	%rcx, %rsi
14193acd3:     	movl	%r9d, (%rsi)
14193acd6:     	movq	%r11, 0x8(%rsi)
14193acda:     	addq	$0x10, %rax
14193acde:     	addq	$0x10, %r8
14193ace2:     	cmpq	%rdx, %rax
14193ace5:     	je	0x14193acb5 <.text+0x1939cb5>
14193ace7:     	movl	-0x10(%rax), %r11d
14193aceb:     	movl	(%rax), %r9d
14193acee:     	movl	%r9d, %r10d
14193acf1:     	sarl	$0x1f, %r10d
14193acf5:     	shrl	%r10d
14193acf8:     	xorl	%r9d, %r10d
14193acfb:     	movl	%r11d, %esi
14193acfe:     	sarl	$0x1f, %esi
14193ad01:     	shrl	%esi
14193ad03:     	xorl	%r11d, %esi
14193ad06:     	cmpl	%esi, %r10d
14193ad09:     	jge	0x14193acda <.text+0x1939cda>
14193ad0b:     	movq	0x8(%rax), %r11
14193ad0f:     	movq	%r8, %rsi
14193ad12:     	nopw	%cs:(%rax,%rax)
14193ad20:     	movups	-0x10(%rcx,%rsi), %xmm0
14193ad25:     	movups	%xmm0, (%rcx,%rsi)
14193ad29:     	cmpq	$0x10, %rsi
14193ad2d:     	je	0x14193acd0 <.text+0x1939cd0>
14193ad2f:     	movl	-0x20(%rcx,%rsi), %edi
14193ad33:     	movl	%edi, %ebx
14193ad35:     	sarl	$0x1f, %ebx
14193ad38:     	shrl	%ebx
14193ad3a:     	xorl	%edi, %ebx
14193ad3c:     	addq	$-0x10, %rsi
14193ad40:     	cmpl	%ebx, %r10d
14193ad43:     	jl	0x14193ad20 <.text+0x1939d20>
14193ad45:     	addq	%rcx, %rsi
14193ad48:     	jmp	0x14193acd3 <.text+0x1939cd3>
14193ad4a:     	ud2
