
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fb70d:     	movq	0xb0(%rbp), %rax
1458fb714:     	cmpq	$-0x1, 0x388(%rax)
1458fb71c:     	je	0x1458fb99b <.text+0x58fa99b>
1458fb722:     	movq	%r14, 0xa8(%rbp)
1458fb729:     	movq	%r14, 0xc0(%rbp)
1458fb730:     	movq	%rdi, 0x70(%rbp)
1458fb734:     	movq	%rdi, 0xc8(%rbp)
1458fb73b:     	movq	0xb8(%rbp), %rax
1458fb742:     	movq	%rax, 0xd0(%rbp)
1458fb749:     	movb	%r12b, 0xd8(%rbp)
1458fb750:     	movl	0x78(%rbp), %eax
1458fb753:     	movl	0x7b(%rbp), %ecx
1458fb756:     	movl	%eax, 0xd9(%rbp)
1458fb75c:     	movl	%ecx, 0xdc(%rbp)
1458fb762:     	callq	0x140002200 <.text+0x1200>
1458fb767:     	movl	$0x1, %ecx
1458fb76c:     	movl	$0x1, %edx
1458fb771:     	callq	0x1400021c0 <.text+0x11c0>
1458fb776:     	testq	%rax, %rax
1458fb779:     	je	0x1458fd9f0 <.text+0x58fc9f0>
1458fb77f:     	movb	$0x7b, (%rax)
1458fb782:     	movq	$0x1, 0x140(%rbp)
1458fb78d:     	movq	%rax, 0x148(%rbp)
1458fb794:     	movq	$0x1, 0x150(%rbp)
1458fb79f:     	movb	$0x1, 0x158(%rbp)
1458fb7a6:     	movq	0xb0(%rbp), %rsi
1458fb7ad:     	movups	0x3a8(%rsi), %xmm0
1458fb7b4:     	movups	%xmm0, 0x20(%rsp)
1458fb7b9:     	leaq	0x157db7b(%rip), %r8    # 0x146e7933b
1458fb7c0:     	leaq	0xf0(%rbp), %rcx
1458fb7c7:     	leaq	0x140(%rbp), %rdx
1458fb7ce:     	movl	$0x4, %r9d
1458fb7d4:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fb7d9:     	nop
1458fb7da:     	movups	0x3d0(%rsi), %xmm0
1458fb7e1:     	movups	%xmm0, 0x20(%rsp)
1458fb7e6:     	leaq	0x157db52(%rip), %r8    # 0x146e7933f
1458fb7ed:     	leaq	0x140(%rbp), %rcx
1458fb7f4:     	leaq	0xf0(%rbp), %rdx
1458fb7fb:     	movl	$0x4, %r9d
1458fb801:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fb806:     	nop
1458fb807:     	leaq	0x157db44(%rip), %rax   # 0x146e79352
1458fb80e:     	movq	%rax, 0x20(%rsp)
1458fb813:     	movq	$0x6, 0x28(%rsp)
1458fb81c:     	leaq	0x157db2b(%rip), %r8    # 0x146e7934e
1458fb823:     	leaq	0xf0(%rbp), %rcx
1458fb82a:     	leaq	0x140(%rbp), %rdx
1458fb831:     	movl	$0x4, %r9d
1458fb837:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fb83c:     	nop
1458fb83d:     	movl	0x3f0(%rsi), %eax
1458fb843:     	movl	%eax, 0x20(%rsp)
1458fb847:     	leaq	0x157daf5(%rip), %r8    # 0x146e79343
1458fb84e:     	leaq	0x140(%rbp), %rcx
1458fb855:     	leaq	0xf0(%rbp), %rdx
1458fb85c:     	movl	$0x4, %r9d
1458fb862:     	callq	0x1458d6e20 <.text+0x58d5e20>
1458fb867:     	nop
1458fb868:     	movl	0x3e0(%rsi), %eax
1458fb86e:     	movl	%eax, 0x20(%rsp)
1458fb872:     	leaq	0x157dadf(%rip), %r8    # 0x146e79358
1458fb879:     	leaq	0xf0(%rbp), %rcx
1458fb880:     	leaq	0x140(%rbp), %rdx
1458fb887:     	movl	$0x6, %r9d
1458fb88d:     	callq	0x1458d6e20 <.text+0x58d5e20>
1458fb892:     	nop
1458fb893:     	leaq	0x388(%rsi), %rdx
1458fb89a:     	leaq	0x80(%rbp), %rcx
1458fb8a1:     	callq	0x14587b350 <.text+0x587a350>
1458fb8a6:     	nop
1458fb8a7:     	movq	0x88(%rbp), %rcx
1458fb8ae:     	movq	0x90(%rbp), %rax
1458fb8b5:     	movb	$0x1, 0x116(%rbp)
1458fb8bc:     	movq	%rax, 0x28(%rsp)
1458fb8c1:     	movq	%rcx, 0xb8(%rbp)
1458fb8c8:     	movq	%rcx, 0x20(%rsp)
1458fb8cd:     	leaq	0x157da8a(%rip), %r8    # 0x146e7935e
1458fb8d4:     	leaq	0x140(%rbp), %rcx
1458fb8db:     	leaq	0xf0(%rbp), %rdx
1458fb8e2:     	movl	$0x4, %r9d
1458fb8e8:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fb8ed:     	nop
1458fb8ee:     	movq	0x150(%rbp), %rsi
1458fb8f5:     	cmpq	%rsi, 0x140(%rbp)
1458fb8fc:     	je	0x1458fd7c2 <.text+0x58fc7c2>
1458fb902:     	movq	0x148(%rbp), %rax
1458fb909:     	movb	$0x7d, (%rax,%rsi)
1458fb90d:     	incq	%rsi
1458fb910:     	movq	%rsi, 0x100(%rbp)
1458fb917:     	movups	0x140(%rbp), %xmm0
1458fb91e:     	movaps	%xmm0, 0xf0(%rbp)
1458fb925:     	movb	$0x0, 0x116(%rbp)
1458fb92c:     	leaq	0x140(%rbp), %rcx
1458fb933:     	leaq	0xc0(%rbp), %rdx
1458fb93a:     	leaq	0xf0(%rbp), %r8
1458fb941:     	callq	0x1458d92b0 <.text+0x58d82b0>
1458fb946:     	nop
1458fb947:     	movq	0x140(%rbp), %r14
1458fb94e:     	movq	0x148(%rbp), %rdi
1458fb955:     	movq	0x150(%rbp), %rsi
1458fb95c:     	movzbl	0x158(%rbp), %r12d
1458fb964:     	movl	0x159(%rbp), %eax
1458fb96a:     	movl	%eax, 0x78(%rbp)
1458fb96d:     	movl	0x15c(%rbp), %eax
1458fb973:     	movl	%eax, 0x7b(%rbp)
1458fb976:     	movq	0x80(%rbp), %rdx
1458fb97d:     	testq	%rdx, %rdx
1458fb980:     	je	0x1458fb994 <.text+0x58fa994>
1458fb982:     	movl	$0x1, %r8d
1458fb988:     	movq	0xb8(%rbp), %rcx
1458fb98f:     	callq	0x1400021d0 <.text+0x11d0>
