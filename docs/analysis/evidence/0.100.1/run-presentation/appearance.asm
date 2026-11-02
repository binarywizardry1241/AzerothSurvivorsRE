
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e75f0:     	pushq	%rbp
1454e75f1:     	pushq	%rsi
1454e75f2:     	pushq	%rdi
1454e75f3:     	pushq	%rbx
1454e75f4:     	subq	$0xd8, %rsp
1454e75fb:     	leaq	0x80(%rsp), %rbp
1454e7603:     	movaps	%xmm6, 0x40(%rbp)
1454e7607:     	movq	$-0x2, 0x38(%rbp)
1454e760f:     	movdqa	%xmm3, %xmm6
1454e7613:     	movq	%rdx, %rdi
1454e7616:     	movq	%rcx, %rsi
1454e7619:     	movq	$0x0, -0x38(%rbp)
1454e7621:     	movq	$0x0, -0x28(%rbp)
1454e7629:     	leaq	-0x38(%rbp), %rbx
1454e762d:     	movq	%rbx, -0x20(%rbp)
1454e7631:     	xorps	%xmm0, %xmm0
1454e7634:     	movups	%xmm0, -0x18(%rbp)
1454e7638:     	movq	$0x83, (%rbp)
1454e7640:     	leaq	-0x58(%rbp), %rcx
1454e7644:     	leaq	-0x20(%rbp), %rdx
1454e7648:     	callq	0x14552a730 <.text+0x5529730>
1454e764d:     	nop
1454e764e:     	movq	-0x38(%rbp), %rax
1454e7652:     	testq	%rax, %rax
1454e7655:     	je	0x1454e76c9 <.text+0x54e66c9>
1454e7657:     	movq	-0x30(%rbp), %rcx
1454e765b:     	movw	$0x4, %dx
1454e765f:     	movzwl	0x36(%rax), %r8d
1454e7664:     	movl	%r8d, %r10d
1454e7667:     	addl	%r10d, %r10d
1454e766a:     	movq	$-0x1, %r9
1454e7671:     	nopw	%cs:(%rax,%rax)
1454e7680:     	testq	%r10, %r10
1454e7683:     	je	0x1454e76b0 <.text+0x54e66b0>
1454e7685:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e768b:     	seta	%r11b
1454e768f:     	sbbb	$0x0, %r11b
1454e7693:     	incq	%r9
1454e7696:     	addq	$-0x2, %r10
1454e769a:     	cmpb	$0x1, %r11b
1454e769e:     	je	0x1454e7680 <.text+0x54e6680>
1454e76a0:     	movzbl	%r11b, %r8d
1454e76a4:     	testl	%r8d, %r8d
1454e76a7:     	je	0x1454e76c0 <.text+0x54e66c0>
1454e76a9:     	jmp	0x1454e76b3 <.text+0x54e66b3>
1454e76ab:     	nopl	(%rax,%rax)
1454e76b0:     	movq	%r8, %r9
1454e76b3:     	subq	$0x1, %rcx
1454e76b7:     	jb	0x1454e76cb <.text+0x54e66cb>
1454e76b9:     	movq	0x50(%rax,%r9,8), %rax
1454e76be:     	jmp	0x1454e765f <.text+0x54e665f>
1454e76c0:     	movd	%xmm6, 0x8(%rax,%r9,4)
1454e76c7:     	jmp	0x1454e76fa <.text+0x54e66fa>
1454e76c9:     	xorl	%eax, %eax
1454e76cb:     	movd	%xmm6, %r8d
1454e76d0:     	movq	%rbx, -0x20(%rbp)
1454e76d4:     	movq	%rax, -0x18(%rbp)
1454e76d8:     	movq	$0x0, -0x10(%rbp)
1454e76e0:     	movq	%r9, -0x8(%rbp)
1454e76e4:     	movq	$0x4, (%rbp)
1454e76ec:     	leaq	-0x58(%rbp), %rcx
1454e76f0:     	leaq	-0x20(%rbp), %rdx
1454e76f4:     	callq	0x14552a730 <.text+0x5529730>
1454e76f9:     	nop
1454e76fa:     	movl	$0x0, 0x28(%rbp)
1454e7701:     	movq	$0x0, 0x10(%rbp)
1454e7709:     	movq	$0x1, 0x18(%rbp)
1454e7711:     	movq	$0x0, 0x20(%rbp)
1454e7719:     	cmpq	$0x0, -0x28(%rbp)
1454e771e:     	je	0x1454e7763 <.text+0x54e6763>
1454e7720:     	movb	$0x1, 0x37(%rbp)
1454e7724:     	leaq	0x10(%rbp), %rcx
1454e7728:     	callq	0x145903690 <.text+0x5902690>
1454e772d:     	nop
1454e772e:     	movq	0x18(%rbp), %rax
1454e7732:     	movb	$0x0, (%rax)
1454e7735:     	movq	$0x1, 0x20(%rbp)
1454e773d:     	movb	$0x1, 0x37(%rbp)
1454e7741:     	leaq	0x10(%rbp), %rdx
1454e7745:     	movq	%rdi, %rcx
1454e7748:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454e774d:     	nop
1454e774e:     	movb	$0x1, 0x37(%rbp)
1454e7752:     	leaq	-0x38(%rbp), %rcx
1454e7756:     	leaq	0x10(%rbp), %rdx
1454e775a:     	callq	0x145513880 <.text+0x5512880>
1454e775f:     	nop
1454e7760:     	incl	0x28(%rbp)
1454e7763:     	movq	0x10(%rbp), %rax
1454e7767:     	movq	0x18(%rbp), %rcx
1454e776b:     	movq	0x20(%rbp), %rdx
1454e776f:     	movq	%rdx, -0x10(%rbp)
1454e7773:     	movl	0x28(%rbp), %edx
1454e7776:     	movl	%edx, -0x8(%rbp)
1454e7779:     	movl	0x2c(%rbp), %edx
1454e777c:     	movl	%edx, -0x4(%rbp)
1454e777f:     	movq	%rax, -0x20(%rbp)
1454e7783:     	movq	%rcx, -0x18(%rbp)
1454e7787:     	movb	$0x0, 0x37(%rbp)
1454e778b:     	leaq	-0x58(%rbp), %rcx
1454e778f:     	leaq	-0x20(%rbp), %rdx
1454e7793:     	callq	0x145512ef0 <.text+0x5511ef0>
1454e7798:     	nop
1454e7799:     	movq	0x560(%rsi), %rdi
1454e77a0:     	cmpq	0x550(%rsi), %rdi
1454e77a7:     	jne	0x1454e77b6 <.text+0x54e67b6>
1454e77a9:     	leaq	0x550(%rsi), %rcx
1454e77b0:     	callq	0x145774710 <.text+0x5773710>
1454e77b5:     	nop
1454e77b6:     	movq	0x558(%rsi), %rax
1454e77bd:     	movq	%rdi, %rcx
1454e77c0:     	shlq	$0x5, %rcx
1454e77c4:     	movups	-0x58(%rbp), %xmm0
1454e77c8:     	movups	-0x48(%rbp), %xmm1
1454e77cc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e77d1:     	movups	%xmm0, (%rax,%rcx)
1454e77d5:     	incq	%rdi
1454e77d8:     	movq	%rdi, 0x560(%rsi)
1454e77df:     	leaq	-0x38(%rbp), %rcx
1454e77e3:     	callq	0x14550cd20 <.text+0x550bd20>
1454e77e8:     	movaps	0x40(%rbp), %xmm6
1454e77ec:     	addq	$0xd8, %rsp
1454e77f3:     	popq	%rbx
1454e77f4:     	popq	%rdi
1454e77f5:     	popq	%rsi
1454e77f6:     	popq	%rbp
1454e77f7:     	retq
