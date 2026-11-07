
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cddcf:     	movd	%r13d, %xmm9
1454cddd4:     	movq	0x58(%r12), %rax
1454cddd9:     	movq	0x60(%r12), %rsi
1454cddde:     	movq	%rsi, %rdi
1454cdde1:     	shlq	$0x4, %rdi
1454cdde5:     	xorl	%edx, %edx
1454cdde7:     	nopw	(%rax,%rax)
1454cddf0:     	cmpq	%rdx, %rdi
1454cddf3:     	je	0x1454cde9f <.text+0x54cce9f>
1454cddf9:     	leaq	0x10(%rdx), %rcx
1454cddfd:     	movq	0x208(%rbp), %r8
1454cde04:     	cmpq	%r8, (%rax,%rdx)
1454cde08:     	movq	%rcx, %rdx
1454cde0b:     	jne	0x1454cddf0 <.text+0x54ccdf0>
1454cde0d:     	ucomiss	-0x4(%rax,%rcx), %xmm11
1454cde13:     	jae	0x1454ce754 <.text+0x54cd754>
1454cde19:     	movl	-0x8(%rax,%rcx), %edx
1454cde1d:     	incl	%edx
1454cde1f:     	jmp	0x1454ce761 <.text+0x54cd761>
