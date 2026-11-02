
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14593f9cc:     	movb	$0x0, 0x29f(%rbp)
14593f9d3:     	movl	$0x18, %edx
14593f9d8:     	leaq	0x153a2a7(%rip), %rcx   # 0x146e79c86
14593f9df:     	callq	0x1458da590 <.text+0x58d9590>
14593f9e4:     	nop
14593f9e5:     	testq	%rax, %rax
14593f9e8:     	leaq	0x153a297(%rip), %rcx   # 0x146e79c86
14593f9ef:     	cmoveq	%rcx, %rax
14593f9f3:     	movl	$0x18, %ecx
14593f9f8:     	cmoveq	%rcx, %rdx
14593f9fc:     	movb	$0x0, 0x29f(%rbp)
14593fa03:     	movq	%rdx, 0x28(%rsp)
14593fa08:     	movq	%rax, 0x20(%rsp)
14593fa0d:     	leaq	0x1f0(%rbp), %rcx
14593fa14:     	movq	%r13, %rdx
14593fa17:     	movq	%r12, %r8
14593fa1a:     	movq	%rbx, %r9
14593fa1d:     	callq	0x1458aae00 <.text+0x58a9e00>
14593fa22:     	nop
14593fa23:     	movq	0x2a0(%rbp), %rdi
14593fa2a:     	movq	0x5e0(%rdi), %rsi
14593fa31:     	cmpq	0x5d0(%rdi), %rsi
14593fa38:     	jne	0x14593f59a <.text+0x593e59a>
14593fa3e:     	movq	0x290(%rbp), %rcx
14593fa45:     	callq	0x145bcb530 <.text+0x5bca530>
14593fa4a:     	nop
