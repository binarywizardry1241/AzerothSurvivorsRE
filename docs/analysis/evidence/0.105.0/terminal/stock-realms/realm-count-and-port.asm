
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458967e6:     	movzwl	%cx, %eax
1458967e9:     	cmpl	$0xe8c, %eax            # imm = 0xE8C
1458967ee:     	jne	0x145896880 <.text+0x5895880>
1458967f4:     	movq	%r14, %rcx
1458967f7:     	movq	%r15, %r14
1458967fa:     	movb	$0x1, 0x537(%rbp)
145896801:     	movq	%rcx, %r12
145896804:     	movq	0x528(%rbp), %rdx
14589680b:     	callq	0x1458a4730 <.text+0x58a3730>
145896810:     	nop
145896811:     	movq	0xa8(%rbp), %rax
145896818:     	movq	%rax, 0x520(%rbp)
14589681f:     	movq	0xb0(%rbp), %r15
145896826:     	cmpq	$0xff, %r15
14589682d:     	movl	$0xff, %eax
145896832:     	cmovbq	%r15, %rax
145896836:     	movb	%al, 0x10(%rbp)
145896839:     	testq	%r15, %r15
14589683c:     	je	0x145896a60 <.text+0x5895a60>
145896842:     	movq	0x520(%rbp), %rax
145896849:     	leaq	0x8(%rax), %rsi
14589684d:     	jmp	0x14589685d <.text+0x589585d>
14589684f:     	nop
145896850:     	addq	$0x38, %rsi
145896854:     	decq	%r15
145896857:     	je	0x145896a60 <.text+0x5895a60>
14589685d:     	movq	-0x8(%rsi), %rdx
145896861:     	testq	%rdx, %rdx
145896864:     	je	0x145896850 <.text+0x5895850>
145896866:     	movq	(%rsi), %rcx
145896869:     	movl	$0x1, %r8d
14589686f:     	callq	0x1400021d0 <.text+0x11d0>
145896874:     	jmp	0x145896850 <.text+0x5895850>
145896876:     	nopw	%cs:(%rax,%rax)
145896880:     	subw	$0x1f95, %cx            # imm = 0x1F95
145896885:     	movl	$0x0, %eax
14589688a:     	cmovbl	%eax, %ecx
14589688d:     	cmpw	$0xc, %cx
145896891:     	cmovael	%eax, %ecx
145896894:     	movzwl	%cx, %eax
145896897:     	imulq	$0xf0, %rax, %rax
14589689e:     	leaq	0x1312bab(%rip), %rcx   # 0x146ba9450
1458968a5:     	movups	0x8(%rax,%rcx), %xmm0
1458968aa:     	movq	%rbx, 0x408(%rbp)
1458968b1:     	movq	%r13, 0x410(%rbp)
1458968b8:     	movq	$0x0, 0x380(%rbp)
1458968c3:     	movq	$0x0, 0x398(%rbp)
1458968ce:     	movq	$0x1, 0x3a0(%rbp)
1458968d9:     	movq	$0x0, 0x3a8(%rbp)
1458968e4:     	movb	$0x0, 0x3b0(%rbp)
1458968eb:     	movups	%xmm0, 0x418(%rbp)
1458968f2:     	movb	$0x0, 0x428(%rbp)
