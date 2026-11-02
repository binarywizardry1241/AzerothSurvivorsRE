
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d64d4:     	movb	$0x0, 0x177(%rbp)
1454d64db:     	leaq	0x151fdac(%rip), %rax   # 0x1469f628e
1454d64e2:     	movq	%rax, 0x20(%rsp)
1454d64e7:     	movq	$0x8, 0x28(%rsp)
1454d64f0:     	leaq	0x15205dd(%rip), %r8    # 0x1469f6ad4
1454d64f7:     	leaq	0xb8(%rbp), %rcx
1454d64fe:     	leaq	0xf0(%rbp), %rdx
1454d6505:     	movl	$0x4, %r9d
1454d650b:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6510:     	nop
1454d6511:     	movb	$0x0, 0x177(%rbp)
1454d6518:     	movq	0xe8(%rbp), %rax
1454d651f:     	movq	%rax, 0x28(%rsp)
1454d6524:     	movq	0x168(%rbp), %rax
1454d652b:     	movq	%rax, 0x20(%rsp)
1454d6530:     	leaq	0x1520572(%rip), %r8    # 0x1469f6aa9
1454d6537:     	leaq	0xf0(%rbp), %rcx
1454d653e:     	leaq	0xb8(%rbp), %rdx
1454d6545:     	movl	$0x4, %r9d
1454d654b:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6550:     	nop
1454d6551:     	movb	$0x0, 0x177(%rbp)
1454d6558:     	leaq	0xb8(%rbp), %rcx
1454d655f:     	leaq	0xf0(%rbp), %rdx
1454d6566:     	callq	0x145456b70 <.text+0x5455b70>
1454d656b:     	nop
1454d656c:     	movq	0x578(%rsi), %r14
1454d6573:     	cmpq	0x568(%rsi), %r14
1454d657a:     	jne	0x1454d65a5 <.text+0x54d55a5>
1454d657c:     	leaq	0x568(%rsi), %rcx
1454d6583:     	movq	0xb8(%rbp), %rax
1454d658a:     	movq	%rax, 0x150(%rbp)
1454d6591:     	movq	0xc0(%rbp), %rax
1454d6598:     	movq	%rax, 0x168(%rbp)
1454d659f:     	callq	0x1457745c0 <.text+0x57735c0>
1454d65a4:     	nop
1454d65a5:     	movq	0x570(%rsi), %rax
1454d65ac:     	leaq	(%r14,%r14,2), %rcx
1454d65b0:     	movq	0xc8(%rbp), %rdx
1454d65b7:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454d65bc:     	movups	0xb8(%rbp), %xmm0
1454d65c3:     	movups	%xmm0, (%rax,%rcx,8)
1454d65c7:     	incq	%r14
1454d65ca:     	movq	%r14, 0x578(%rsi)
1454d65d1:     	movl	0x67c(%rsi), %eax
