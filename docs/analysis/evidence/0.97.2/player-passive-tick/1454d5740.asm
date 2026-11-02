
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d5740:     	pushq	%r15
1454d5742:     	pushq	%r14
1454d5744:     	pushq	%rsi
1454d5745:     	pushq	%rdi
1454d5746:     	pushq	%rbp
1454d5747:     	pushq	%rbx
1454d5748:     	subq	$0x78, %rsp
1454d574c:     	movaps	%xmm6, 0x60(%rsp)
1454d5751:     	movq	%rcx, %rsi
1454d5754:     	movss	0x8e4(%rcx), %xmm6
1454d575c:     	movl	0x3f0(%rcx), %eax
1454d5762:     	movl	%eax, 0x40(%rsp)
1454d5766:     	movq	0x3e8(%rcx), %rax
1454d576d:     	movq	%rax, 0x38(%rsp)
1454d5772:     	movq	%r9, 0x28(%rsp)
1454d5777:     	movq	%r8, 0x20(%rsp)
1454d577c:     	leaq	0x48(%rsp), %rcx
1454d5781:     	leaq	0x38(%rsp), %r8
1454d5786:     	movq	%rsi, %rdx
1454d5789:     	movaps	%xmm1, %xmm3
1454d578c:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454d5791:     	movq	0x48(%rsp), %rdx
1454d5796:     	movq	0x50(%rsp), %rcx
1454d579b:     	movq	0x58(%rsp), %rax
1454d57a0:     	testq	%rax, %rax
1454d57a3:     	je	0x1454d581e <.text+0x54d481e>
1454d57a5:     	leaq	(%rcx,%rax,8), %rax
1454d57a9:     	movq	0x4c8(%rsi), %r8
1454d57b0:     	movq	0x4d0(%rsi), %r10
1454d57b7:     	leaq	-0x160(%r8), %r11
1454d57be:     	imulq	$0x160, %r10, %rdi      # imm = 0x160
1454d57c5:     	movq	%rcx, %r9
1454d57c8:     	jmp	0x1454d57de <.text+0x54d47de>
1454d57ca:     	nopw	(%rax,%rax)
1454d57d0:     	ucomiss	0x140(%rsi), %xmm6
1454d57d7:     	jae	0x1454d5846 <.text+0x54d4846>
1454d57d9:     	cmpq	%rax, %r9
1454d57dc:     	je	0x1454d581e <.text+0x54d481e>
1454d57de:     	movq	(%r9), %rbx
1454d57e1:     	addq	$0x8, %r9
1454d57e5:     	movq	%rdi, %r14
1454d57e8:     	movq	%r11, %r15
1454d57eb:     	nopl	(%rax,%rax)
1454d57f0:     	testq	%r14, %r14
1454d57f3:     	je	0x1454d57d9 <.text+0x54d47d9>
1454d57f5:     	leaq	0x160(%r15), %rsi
1454d57fc:     	addq	$-0x160, %r14           # imm = 0xFEA0
1454d5803:     	cmpq	%rbx, 0x1e8(%r15)
1454d580a:     	movq	%rsi, %r15
1454d580d:     	jne	0x1454d57f0 <.text+0x54d47f0>
1454d580f:     	cmpq	$-0x1, 0x40(%rsi)
1454d5814:     	je	0x1454d57d0 <.text+0x54d47d0>
1454d5816:     	cmpb	$0x1, 0x60(%rsi)
1454d581a:     	je	0x1454d57d0 <.text+0x54d47d0>
1454d581c:     	jmp	0x1454d57d9 <.text+0x54d47d9>
1454d581e:     	testq	%rdx, %rdx
1454d5821:     	je	0x1454d5832 <.text+0x54d4832>
1454d5823:     	shlq	$0x3, %rdx
1454d5827:     	movl	$0x8, %r8d
1454d582d:     	callq	0x1400021d0 <.text+0x11d0>
1454d5832:     	xorl	%eax, %eax
1454d5834:     	movaps	0x60(%rsp), %xmm6
1454d5839:     	addq	$0x78, %rsp
1454d583d:     	popq	%rbx
1454d583e:     	popq	%rbp
1454d583f:     	popq	%rdi
1454d5840:     	popq	%rsi
1454d5841:     	popq	%r14
1454d5843:     	popq	%r15
1454d5845:     	retq
1454d5846:     	cmpq	%rax, %r9
1454d5849:     	je	0x1454d591f <.text+0x54d491f>
1454d584f:     	addq	$-0x160, %r8            # imm = 0xFEA0
1454d5856:     	imulq	$0x160, %r10, %r10      # imm = 0x160
1454d585d:     	jmp	0x1454d5879 <.text+0x54d4879>
1454d585f:     	testb	%bl, %bl
1454d5861:     	cmoveq	%r11, %rsi
1454d5865:     	nopw	%cs:(%rax,%rax)
1454d5870:     	cmpq	%rax, %r9
1454d5873:     	je	0x1454d591f <.text+0x54d491f>
1454d5879:     	movq	(%r9), %rdi
1454d587c:     	addq	$0x8, %r9
1454d5880:     	movq	%r10, %rbx
1454d5883:     	movq	%r8, %r14
1454d5886:     	nopw	%cs:(%rax,%rax)
1454d5890:     	testq	%rbx, %rbx
1454d5893:     	je	0x1454d5870 <.text+0x54d4870>
1454d5895:     	leaq	0x160(%r14), %r11
1454d589c:     	addq	$-0x160, %rbx           # imm = 0xFEA0
1454d58a3:     	cmpq	%rdi, 0x1e8(%r14)
1454d58aa:     	movq	%r11, %r14
1454d58ad:     	jne	0x1454d5890 <.text+0x54d4890>
1454d58af:     	cmpq	$-0x1, 0x40(%r11)
1454d58b4:     	je	0x1454d58bd <.text+0x54d48bd>
1454d58b6:     	cmpb	$0x0, 0x60(%r11)
1454d58bb:     	je	0x1454d5870 <.text+0x54d4870>
1454d58bd:     	ucomiss	0x140(%r11), %xmm6
1454d58c5:     	jb	0x1454d5870 <.text+0x54d4870>
1454d58c7:     	cmpq	$-0x1, 0x18(%rsi)
1454d58cc:     	setne	%bl
1454d58cf:     	addb	%bl, %bl
1454d58d1:     	orb	0x158(%rsi), %bl
1454d58d7:     	cmpq	$-0x1, 0x18(%r11)
1454d58dc:     	setne	%dil
1454d58e0:     	addb	%dil, %dil
1454d58e3:     	orb	0x158(%r11), %dil
1454d58ea:     	cmpb	%dil, %bl
1454d58ed:     	seta	%bl
1454d58f0:     	jne	0x1454d585f <.text+0x54d485f>
1454d58f6:     	movl	0xf0(%rsi), %edi
1454d58fc:     	movl	%edi, %ebx
1454d58fe:     	sarl	$0x1f, %ebx
1454d5901:     	shrl	%ebx
1454d5903:     	xorl	%edi, %ebx
1454d5905:     	movl	0xf0(%r11), %edi
1454d590c:     	movl	%edi, %ebp
1454d590e:     	sarl	$0x1f, %ebp
1454d5911:     	shrl	%ebp
1454d5913:     	xorl	%edi, %ebp
1454d5915:     	cmpl	%ebp, %ebx
1454d5917:     	setg	%bl
1454d591a:     	jmp	0x1454d585f <.text+0x54d485f>
1454d591f:     	testq	%rdx, %rdx
1454d5922:     	je	0x1454d5933 <.text+0x54d4933>
1454d5924:     	shlq	$0x3, %rdx
1454d5928:     	movl	$0x8, %r8d
1454d592e:     	callq	0x1400021d0 <.text+0x11d0>
1454d5933:     	movq	0x88(%rsi), %rdx
1454d593a:     	movl	$0x1, %eax
1454d593f:     	jmp	0x1454d5834 <.text+0x54d4834>
