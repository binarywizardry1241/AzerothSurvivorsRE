
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14593e5a3:     	callq	0x1458dfb70 <.text+0x58deb70>
14593e5a8:     	nop
14593e5a9:     	movq	%rax, %rbx
14593e5ac:     	movq	%rdx, %r14
14593e5af:     	movl	$0xf, %edx
14593e5b4:     	leaq	0x153b7cd(%rip), %rcx   # 0x146e79d88
14593e5bb:     	callq	0x1458da590 <.text+0x58d9590>
14593e5c0:     	nop
14593e5c1:     	testq	%rax, %rax
14593e5c4:     	leaq	0x153b7bd(%rip), %rcx   # 0x146e79d88
14593e5cb:     	cmoveq	%rcx, %rax
14593e5cf:     	movl	$0xf, %ecx
14593e5d4:     	cmoveq	%rcx, %rdx
14593e5d8:     	movq	%rdx, 0x28(%rsp)
14593e5dd:     	movq	%rax, 0x20(%rsp)
14593e5e2:     	leaq	0x1f0(%rbp), %rcx
14593e5e9:     	movq	%r13, %rdx
14593e5ec:     	movq	%rbx, %r8
14593e5ef:     	movq	%r14, %r9
14593e5f2:     	callq	0x1458aae00 <.text+0x58a9e00>
14593e5f7:     	nop
14593e5f8:     	movq	0x2a0(%rbp), %rbx
14593e5ff:     	movq	0x5e0(%rbx), %rsi
14593e606:     	cmpq	0x5d0(%rbx), %rsi
14593e60d:     	jne	0x14593e61c <.text+0x593d61c>
14593e60f:     	movq	0x290(%rbp), %rcx
14593e616:     	callq	0x145bcb530 <.text+0x5bca530>
14593e61b:     	nop
14593e61c:     	movq	0x5d8(%rbx), %rax
14593e623:     	movq	%rsi, %rcx
14593e626:     	shlq	$0x5, %rcx
14593e62a:     	movups	0x1f0(%rbp), %xmm0
14593e631:     	movups	0x200(%rbp), %xmm1
14593e638:     	movups	%xmm1, 0x10(%rax,%rcx)
14593e63d:     	movups	%xmm0, (%rax,%rcx)
14593e641:     	incq	%rsi
14593e644:     	movq	%rsi, 0x5e0(%rbx)
