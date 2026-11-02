
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d6716:     	movb	$0x0, 0x177(%rbp)
1454d671d:     	leaq	0x1520bd0(%rip), %rax   # 0x1469f72f4
1454d6724:     	movq	%rax, 0x20(%rsp)
1454d6729:     	movq	$0x8, 0x28(%rsp)
1454d6732:     	leaq	0x152039b(%rip), %r8    # 0x1469f6ad4
1454d6739:     	leaq	0xb8(%rbp), %rcx
1454d6740:     	leaq	0xf0(%rbp), %rdx
1454d6747:     	movl	$0x4, %r9d
1454d674d:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6752:     	nop
1454d6753:     	movb	$0x1, 0x173(%rbp)
1454d675a:     	movq	0x150(%rbp), %rcx
1454d6761:     	callq	0x145420100 <.text+0x541f100>
1454d6766:     	nop
1454d6767:     	movb	$0x0, 0x173(%rbp)
1454d676e:     	movq	%rdx, 0x28(%rsp)
1454d6773:     	movq	%rax, 0x20(%rsp)
1454d6778:     	leaq	0x152032a(%rip), %r8    # 0x1469f6aa9
1454d677f:     	leaq	0xf0(%rbp), %rcx
1454d6786:     	leaq	0xb8(%rbp), %rdx
1454d678d:     	movl	$0x4, %r9d
1454d6793:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6798:     	nop
1454d6799:     	movb	$0x0, 0x177(%rbp)
1454d67a0:     	leaq	0xb8(%rbp), %rcx
1454d67a7:     	leaq	0xf0(%rbp), %rdx
1454d67ae:     	callq	0x145456b70 <.text+0x5455b70>
1454d67b3:     	nop
1454d67b4:     	movq	0x578(%rsi), %r14
1454d67bb:     	cmpq	0x568(%rsi), %r14
1454d67c2:     	jne	0x1454d67ed <.text+0x54d57ed>
1454d67c4:     	leaq	0x568(%rsi), %rcx
1454d67cb:     	movq	0xb8(%rbp), %rax
1454d67d2:     	movq	%rax, 0x168(%rbp)
1454d67d9:     	movq	0xc0(%rbp), %rax
1454d67e0:     	movq	%rax, 0xe8(%rbp)
1454d67e7:     	callq	0x1457745c0 <.text+0x57735c0>
1454d67ec:     	nop
1454d67ed:     	movq	0x570(%rsi), %rax
1454d67f4:     	leaq	(%r14,%r14,2), %rcx
1454d67f8:     	movq	0xc8(%rbp), %rdx
1454d67ff:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454d6804:     	movups	0xb8(%rbp), %xmm0
1454d680b:     	movups	%xmm0, (%rax,%rcx,8)
1454d680f:     	incq	%r14
1454d6812:     	movq	%r14, 0x578(%rsi)
