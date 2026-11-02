
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408395f0:     	pushq	%r15
1408395f2:     	pushq	%r14
1408395f4:     	pushq	%rsi
1408395f5:     	pushq	%rdi
1408395f6:     	pushq	%rbp
1408395f7:     	pushq	%rbx
1408395f8:     	subq	$0x28, %rsp
1408395fc:     	movq	0x80(%rsp), %rcx
140839604:     	movq	(%rdx), %rdx
140839607:     	movq	(%r9), %rax
14083960a:     	movq	(%rcx), %rsi
14083960d:     	movq	0x8(%rcx), %rdi
140839611:     	movl	0x14(%rcx), %ebx
140839614:     	cmpb	$0x3, (%rdx)
140839617:     	je	0x140839622 <.text+0x838622>
140839619:     	movq	(%r8), %rcx
14083961c:     	cmpb	$0x1, 0x58(%rcx)
140839620:     	jne	0x14083962e <.text+0x83862e>
140839622:     	movl	(%rax), %ecx
140839624:     	addl	$-0x3, %ecx
140839627:     	movb	$0x1, %al
140839629:     	cmpl	$-0x2, %ecx
14083962c:     	jb	0x140839633 <.text+0x838633>
14083962e:     	callq	0x1406cc520 <.text+0x6cb520>
140839633:     	movq	0xf8(%rsi), %rcx
14083963a:     	movq	0x100(%rsi), %rdx
140839641:     	leaq	(%rcx,%rdx,4), %rdx
140839645:     	cmpb	$0x0, 0x108(%rsi)
14083964c:     	je	0x1408396db <.text+0x8386db>
140839652:     	xorl	%r8d, %r8d
140839655:     	xorl	%r10d, %r10d
140839658:     	xorl	%r11d, %r11d
14083965b:     	cmpl	%r8d, %r11d
14083965e:     	jne	0x1408396b4 <.text+0x8386b4>
140839660:     	cmpq	%rdx, %rcx
140839663:     	je	0x140839797 <.text+0x838797>
140839669:     	movl	(%rcx), %r8d
14083966c:     	addq	$0x4, %rcx
140839670:     	movq	0x1a8(%rdi), %r9
140839677:     	leaq	(%r8,%r8,8), %r10
14083967b:     	movq	0x10(%r9,%r10,8), %r8
140839680:     	testq	%r8, %r8
140839683:     	je	0x140839660 <.text+0x838660>
140839685:     	leaq	(%r9,%r10,8), %r9
140839689:     	movq	0x110(%rsi), %r10
140839690:     	movq	0x18(%r9), %r11
140839694:     	movq	0x38(%r9), %r9
140839698:     	movq	(%r9,%r10,8), %r9
14083969c:     	notq	%r9
14083969f:     	leaq	(%r9,%r9,2), %r9
1408396a3:     	shlq	$0x4, %r9
1408396a7:     	movq	0x10(%r11,%r9), %r10
1408396ac:     	movq	0x28(%r11,%r9), %r9
1408396b1:     	xorl	%r11d, %r11d
1408396b4:     	movl	%r11d, %r14d
1408396b7:     	incl	%r11d
1408396ba:     	imulq	$0x110, %r14, %r15      # imm = 0x110
1408396c1:     	cmpb	0x100(%r10,%r15), %al
1408396c9:     	je	0x14083965b <.text+0x83865b>
1408396cb:     	addq	%r10, %r15
1408396ce:     	movl	%ebx, (%r9,%r14,4)
1408396d2:     	movb	%al, 0x100(%r15)
1408396d9:     	jmp	0x14083965b <.text+0x83865b>
1408396db:     	xorl	%r8d, %r8d
1408396de:     	movl	$0x8, %r9d
1408396e4:     	xorl	%r11d, %r11d
1408396e7:     	xorl	%ebp, %ebp
1408396e9:     	cmpl	%r8d, %ebp
1408396ec:     	jne	0x14083975e <.text+0x83875e>
1408396ee:     	nop
1408396f0:     	cmpq	%rdx, %rcx
1408396f3:     	je	0x140839797 <.text+0x838797>
1408396f9:     	movl	(%rcx), %r8d
1408396fc:     	addq	$0x4, %rcx
140839700:     	movq	0x108(%rdi), %r9
140839707:     	leaq	(%r8,%r8,4), %r10
14083970b:     	shlq	$0x5, %r10
14083970f:     	movq	0x58(%r9,%r10), %r8
140839714:     	testq	%r8, %r8
140839717:     	je	0x1408396f0 <.text+0x8386f0>
140839719:     	addq	%r10, %r9
14083971c:     	movl	0x94(%r9), %r10d
140839723:     	movq	0x1a8(%rdi), %r11
14083972a:     	leaq	(%r10,%r10,8), %r10
14083972e:     	movq	0x110(%rsi), %r14
140839735:     	movq	0x18(%r11,%r10,8), %r15
14083973a:     	movq	0x38(%r11,%r10,8), %r10
14083973f:     	movq	(%r10,%r14,8), %r10
140839743:     	notq	%r10
140839746:     	leaq	(%r10,%r10,2), %r10
14083974a:     	shlq	$0x4, %r10
14083974e:     	movq	0x10(%r15,%r10), %r11
140839753:     	movq	0x28(%r15,%r10), %r10
140839758:     	movq	0x50(%r9), %r9
14083975c:     	xorl	%ebp, %ebp
14083975e:     	movl	%ebp, %r14d
140839761:     	shlq	$0x4, %r14
140839765:     	incl	%ebp
140839767:     	movl	0x8(%r9,%r14), %r14d
14083976c:     	notl	%r14d
14083976f:     	imulq	$0x110, %r14, %r15      # imm = 0x110
140839776:     	cmpb	0x100(%r11,%r15), %al
14083977e:     	je	0x1408396e9 <.text+0x8386e9>
140839784:     	addq	%r11, %r15
140839787:     	movl	%ebx, (%r10,%r14,4)
14083978b:     	movb	%al, 0x100(%r15)
140839792:     	jmp	0x1408396e9 <.text+0x8386e9>
140839797:     	addq	$0x28, %rsp
14083979b:     	popq	%rbx
14083979c:     	popq	%rbp
14083979d:     	popq	%rdi
14083979e:     	popq	%rsi
14083979f:     	popq	%r14
1408397a1:     	popq	%r15
1408397a3:     	retq
