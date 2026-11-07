
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590f7b3:     	leaq	0x156a3ee(%rip), %rdi   # 0x146e79ba8
14590f7ba:     	movl	$0x1b, %esi
14590f7bf:     	movl	$0x1b, %edx
14590f7c4:     	movq	%rdi, %rcx
14590f7c7:     	callq	0x1458da590 <.text+0x58d9590>
14590f7cc:     	nop
14590f7cd:     	movq	%rdx, %r15
14590f7d0:     	testq	%rax, %rax
14590f7d3:     	cmoveq	%rsi, %r15
14590f7d7:     	cmovneq	%rax, %rdi
14590f7db:     	movq	0x330(%rbp), %rdx
14590f7e2:     	movq	0x360(%rbp), %rcx
14590f7e9:     	cmpq	%rdx, %rcx
14590f7ec:     	jae	0x14591194e <.text+0x591094e>
14590f7f2:     	leaq	(%rcx,%rcx,4), %rsi
14590f7f6:     	shlq	$0x4, %rsi
14590f7fa:     	movq	0x328(%rbp), %rax
14590f801:     	addq	%rsi, %rax
14590f804:     	addq	$0x20, %rax
14590f808:     	movq	%rax, 0x230(%rbp)
14590f80f:     	leaq	0x29e76a(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14590f816:     	movq	%rax, 0x238(%rbp)
14590f81d:     	leaq	0x129153c(%rip), %rdx   # 0x146ba0d60
14590f824:     	leaq	0xa0(%rbp), %rcx
14590f82b:     	leaq	0x230(%rbp), %r8
14590f832:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14590f837:     	nop
14590f838:     	movq	%rdi, 0x370(%rbp)
14590f83f:     	movq	0x328(%rbp), %rax
14590f846:     	addq	%rsi, %rax
14590f849:     	movq	0xa8(%rbp), %rcx
14590f850:     	movq	0xb0(%rbp), %rdx
14590f857:     	movq	0x10(%rax), %r14
14590f85b:     	movq	0x18(%rax), %rbx
14590f85f:     	movq	%rcx, 0x360(%rbp)
14590f866:     	callq	0x1458da590 <.text+0x58d9590>
14590f86b:     	nop
14590f86c:     	movq	%rax, %rdi
14590f86f:     	movq	%rdx, %r13
14590f872:     	movq	0xa0(%rbp), %rdx
14590f879:     	testq	%rdx, %rdx
14590f87c:     	je	0x14590f890 <.text+0x590e890>
14590f87e:     	movl	$0x1, %r8d
14590f884:     	movq	0x360(%rbp), %rcx
14590f88b:     	callq	0x1400021d0 <.text+0x11d0>
14590f890:     	testq	%rdi, %rdi
14590f893:     	cmovneq	%rdi, %r14
14590f897:     	cmoveq	%rbx, %r13
14590f89b:     	movq	%r15, 0x20(%rsp)
14590f8a0:     	leaq	0xa0(%rbp), %rcx
14590f8a7:     	movq	%r14, %rdx
14590f8aa:     	movq	%r13, %r8
14590f8ad:     	movq	0x370(%rbp), %r9
14590f8b4:     	callq	0x1458a9500 <.text+0x58a8500>
14590f8b9:     	nop
14590f8ba:     	movq	0x378(%rbp), %r13
14590f8c1:     	movq	0x5e0(%r13), %rsi
14590f8c8:     	cmpq	0x5d0(%r13), %rsi
14590f8cf:     	movq	0x348(%rbp), %rdi
14590f8d6:     	jne	0x14590f8e5 <.text+0x590e8e5>
14590f8d8:     	movq	0x350(%rbp), %rcx
14590f8df:     	callq	0x145bcb530 <.text+0x5bca530>
14590f8e4:     	nop
14590f8e5:     	movq	0x5d8(%r13), %rax
14590f8ec:     	movq	%rsi, %rcx
14590f8ef:     	shlq	$0x5, %rcx
14590f8f3:     	movups	0xa0(%rbp), %xmm0
14590f8fa:     	movups	0xb0(%rbp), %xmm1
14590f901:     	movups	%xmm1, 0x10(%rax,%rcx)
14590f906:     	movups	%xmm0, (%rax,%rcx)
14590f90a:     	incq	%rsi
14590f90d:     	movq	%rsi, 0x5e0(%r13)
