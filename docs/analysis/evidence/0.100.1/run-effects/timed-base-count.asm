
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c9c9c:     	movq	%rcx, %rsi
1454c9c9f:     	leaq	0x148(%rcx), %rdx
1454c9ca6:     	leaq	-0x50(%rbp), %rcx
1454c9caa:     	callq	0x145451a00 <.text+0x5450a00>
1454c9caf:     	movq	-0x18(%rbp), %rdx
1454c9cb3:     	movq	-0x10(%rbp), %r15
1454c9cb7:     	movq	%r15, %r8
1454c9cba:     	shlq	$0x6, %r8
1454c9cbe:     	addq	%rdx, %r8
1454c9cc1:     	movb	$0x1, 0x196(%rbp)
1454c9cc8:     	leaq	0x110(%rbp), %rcx
1454c9ccf:     	callq	0x14553a530 <.text+0x5539530>
1454c9cd4:     	nop
1454c9cd5:     	movq	0x110(%rbp), %rax
1454c9cdc:     	movq	0x120(%rbp), %r12
1454c9ce3:     	testq	%rax, %rax
1454c9ce6:     	je	0x1454c9d02 <.text+0x54c8d02>
1454c9ce8:     	movq	0x118(%rbp), %rcx
1454c9cef:     	shlq	$0x3, %rax
1454c9cf3:     	leaq	(%rax,%rax,2), %rdx
1454c9cf7:     	movl	$0x8, %r8d
1454c9cfd:     	callq	0x1400021d0 <.text+0x11d0>
