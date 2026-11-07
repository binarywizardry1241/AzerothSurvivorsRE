
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592b5e3:     	movq	0x208(%rbp), %rax
14592b5ea:     	movl	%eax, 0x158(%rbp)
14592b5f0:     	movl	%r9d, 0x15c(%rbp)
14592b5f7:     	movq	%rdi, 0x160(%rbp)
14592b5fe:     	movq	%r15, 0x168(%rbp)
14592b605:     	movq	%rsi, 0x170(%rbp)
14592b60c:     	leaq	0x158(%rbp), %rdx
14592b613:     	movq	0x1c8(%rbp), %r8
14592b61a:     	callq	0x145929aa0 <.text+0x5928aa0>
14592b61f:     	nop
14592b620:     	testb	%al, %al
14592b622:     	movl	0x214(%rbp), %r9d
14592b629:     	movq	0x1d8(%rbp), %r8
14592b630:     	movq	0x218(%rbp), %rcx
14592b637:     	je	0x145929e10 <.text+0x5928e10>
14592b63d:     	movq	0x568(%rcx), %rdx
14592b644:     	testq	%rdx, %rdx
14592b647:     	je	0x145929e10 <.text+0x5928e10>
14592b64d:     	movss	0x1f0(%rbp), %xmm2
14592b655:     	movq	0x560(%rcx), %rax
14592b65c:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
14592b663:     	xorl	%r10d, %r10d
14592b666:     	jmp	0x14592b680 <.text+0x592a680>
14592b668:     	nopl	(%rax,%rax)
14592b670:     	addq	$0x160, %r10            # imm = 0x160
14592b677:     	cmpq	%r10, %rdx
14592b67a:     	je	0x145929e10 <.text+0x5928e10>
14592b680:     	cmpq	%r8, 0x88(%rax,%r10)
14592b688:     	jne	0x14592b670 <.text+0x592a670>
14592b68a:     	cmpl	$0x1, 0x68(%rax,%r10)
14592b690:     	je	0x14592b670 <.text+0x592a670>
14592b692:     	mulss	0xf4(%rax,%r10), %xmm2
14592b69c:     	movq	%r8, %rdx
14592b69f:     	movb	0x195(%rcx), %bl
14592b6a5:     	movb	$0x3, 0x195(%rcx)
14592b6ac:     	testl	%r9d, %r9d
14592b6af:     	sete	0x30(%rsp)
14592b6b4:     	movzbl	0x227(%rbp), %eax
14592b6bb:     	movb	%al, 0x20(%rsp)
14592b6bf:     	movb	$0x0, 0x28(%rsp)
14592b6c4:     	callq	0x145933ec0 <.text+0x5932ec0>
14592b6c9:     	nop
14592b6ca:     	movq	0x218(%rbp), %rax
14592b6d1:     	movb	%bl, 0x195(%rax)
14592b6d7:     	jmp	0x145929e10 <.text+0x5928e10>
