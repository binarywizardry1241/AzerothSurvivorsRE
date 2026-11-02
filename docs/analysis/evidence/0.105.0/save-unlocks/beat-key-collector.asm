
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145996570:     	pushq	%r15
145996572:     	pushq	%r14
145996574:     	pushq	%r13
145996576:     	pushq	%r12
145996578:     	pushq	%rsi
145996579:     	pushq	%rdi
14599657a:     	pushq	%rbp
14599657b:     	pushq	%rbx
14599657c:     	subq	$0x68, %rsp
145996580:     	movq	%rdx, %rsi
145996583:     	movq	%rcx, 0x50(%rsp)
145996588:     	movq	0x30(%rdx), %r14
14599658c:     	movq	0x20(%rdx), %rax
145996590:     	movzbl	0x40(%rdx), %ecx
145996594:     	movb	%cl, 0x37(%rsp)
145996598:     	movzbl	%cl, %edi
14599659b:     	movq	0x18(%rdx), %rbx
14599659f:     	movzbl	0x48(%rdx), %ecx
1459965a3:     	movb	%cl, 0x36(%rsp)
1459965a7:     	movq	0x10(%rdx), %rcx
1459965ab:     	movq	%rcx, 0x40(%rsp)
1459965b0:     	movq	(%rdx), %rcx
1459965b3:     	movq	%rcx, 0x58(%rsp)
1459965b8:     	movq	0x8(%rdx), %rcx
1459965bc:     	movq	%rcx, 0x38(%rsp)
1459965c1:     	movq	0x28(%rdx), %r13
1459965c5:     	movq	%rax, 0x48(%rsp)
1459965ca:     	cmpq	%rax, %r14
1459965cd:     	jbe	0x14599665b <.text+0x599565b>
1459965d3:     	movzbl	0x49(%rsi), %eax
1459965d7:     	movq	0x40(%rsp), %r8
1459965dc:     	subq	0x38(%rsp), %r8
1459965e1:     	setne	%cl
1459965e4:     	orb	0x36(%rsp), %cl
1459965e8:     	cmpb	$0x1, %cl
1459965eb:     	jne	0x145996847 <.text+0x5995847>
1459965f1:     	testb	$0x1, %al
1459965f3:     	jne	0x14599684f <.text+0x599584f>
1459965f9:     	movq	0x38(%rsp), %rax
1459965fe:     	leaq	(%rbx,%rax), %rdx
145996602:     	movb	$0x1, 0x49(%rsi)
145996606:     	leaq	0x60(%rsp), %rcx
14599660b:     	callq	0x1458d6970 <.text+0x58d5970>
145996610:     	testb	$0x1, %al
145996612:     	je	0x14599684f <.text+0x599584f>
145996618:     	movq	0x58(%rsp), %rax
14599661d:     	movzbl	(%rax), %ebp
145996620:     	movq	0x50(%rsp), %rcx
145996625:     	movq	0x10(%rcx), %r12
145996629:     	cmpq	(%rcx), %r12
14599662c:     	je	0x14599681a <.text+0x599581a>
145996632:     	movq	0x8(%rcx), %rax
145996636:     	movq	%r12, %r8
145996639:     	shlq	$0x4, %r8
14599663d:     	movb	%bpl, (%rax,%r8)
145996641:     	movq	%rdx, 0x8(%rax,%r8)
145996646:     	incq	%r12
145996649:     	movq	%r12, 0x10(%rcx)
14599664d:     	movq	0x48(%rsp), %rax
145996652:     	cmpq	%rax, %r14
145996655:     	ja	0x1459965d3 <.text+0x59955d3>
14599665b:     	movq	0x38(%rsp), %r15
145996660:     	jmp	0x145996693 <.text+0x5995693>
145996662:     	nopw	%cs:(%rax,%rax)
145996670:     	movq	%r15, %rbp
145996673:     	movq	0x40(%rsp), %r12
145996678:     	leaq	(%rbx,%r15), %rdx
14599667c:     	subq	%r15, %r12
14599667f:     	leaq	0x60(%rsp), %rcx
145996684:     	movq	%r12, %r8
145996687:     	callq	0x1458d6970 <.text+0x58d5970>
14599668c:     	movq	%rbp, %r15
14599668f:     	testb	$0x1, %al
145996691:     	jne	0x145996618 <.text+0x5995618>
145996693:     	cmpb	$0x0, 0x49(%rsi)
145996697:     	jne	0x14599684f <.text+0x599584f>
14599669d:     	cmpq	%r13, %r14
1459966a0:     	jb	0x1459967ef <.text+0x59957ef>
1459966a6:     	leaq	0x38(%rsi), %rax
1459966aa:     	movzbl	-0x1(%rax,%rdi), %ebp
1459966af:     	cmpb	$0x5, 0x37(%rsp)
1459966b4:     	jb	0x145996749 <.text+0x5995749>
1459966ba:     	movq	%r14, %r8
1459966bd:     	subq	%r13, %r8
1459966c0:     	leaq	(%rbx,%r13), %rax
1459966c4:     	cmpq	$0xf, %r8
1459966c8:     	ja	0x1459966f5 <.text+0x59956f5>
1459966ca:     	xorl	%edx, %edx
1459966cc:     	testq	%r8, %r8
1459966cf:     	je	0x145996701 <.text+0x5995701>
1459966d1:     	nopw	%cs:(%rax,%rax)
1459966e0:     	cmpb	%bpl, (%rax,%rdx)
1459966e4:     	je	0x145996705 <.text+0x5995705>
1459966e6:     	incq	%rdx
1459966e9:     	cmpq	%rdx, %r8
1459966ec:     	jne	0x1459966e0 <.text+0x59956e0>
1459966ee:     	movq	%r8, %rdx
1459966f1:     	xorl	%eax, %eax
1459966f3:     	jmp	0x14599670a <.text+0x599570a>
1459966f5:     	movl	%ebp, %ecx
1459966f7:     	movq	%rax, %rdx
1459966fa:     	callq	0x145ba4f00 <.text+0x5ba3f00>
1459966ff:     	jmp	0x14599670a <.text+0x599570a>
145996701:     	xorl	%eax, %eax
145996703:     	jmp	0x14599670a <.text+0x599570a>
145996705:     	movl	$0x1, %eax
14599670a:     	cmpq	$0x1, %rax
14599670e:     	jne	0x1459967e8 <.text+0x59957e8>
145996714:     	addq	%rdx, %r13
145996717:     	incq	%r13
14599671a:     	movq	%r13, 0x28(%rsi)
14599671e:     	cmpq	%rdi, %r13
145996721:     	setb	%al
145996724:     	cmpq	0x48(%rsp), %r13
145996729:     	seta	%cl
14599672c:     	orb	%al, %cl
14599672e:     	je	0x145996860 <.text+0x5995860>
145996734:     	cmpq	%r13, %r14
145996737:     	jae	0x1459966ba <.text+0x59956ba>
145996739:     	jmp	0x1459967ef <.text+0x59957ef>
14599673e:     	nop
145996740:     	cmpq	%r13, %r14
145996743:     	jb	0x1459967ef <.text+0x59957ef>
145996749:     	movq	%r14, %r8
14599674c:     	subq	%r13, %r8
14599674f:     	leaq	(%rbx,%r13), %rax
145996753:     	cmpq	$0x10, %r8
145996757:     	jae	0x145996780 <.text+0x5995780>
145996759:     	xorl	%edx, %edx
14599675b:     	testq	%r8, %r8
14599675e:     	je	0x145996771 <.text+0x5995771>
145996760:     	cmpb	%bpl, (%rax,%rdx)
145996764:     	je	0x145996792 <.text+0x5995792>
145996766:     	incq	%rdx
145996769:     	cmpq	%rdx, %r8
14599676c:     	jne	0x145996760 <.text+0x5995760>
14599676e:     	movq	%r8, %rdx
145996771:     	xorl	%eax, %eax
145996773:     	cmpq	$0x1, %rax
145996777:     	je	0x1459967a0 <.text+0x59957a0>
145996779:     	jmp	0x1459967e8 <.text+0x59957e8>
14599677b:     	nopl	(%rax,%rax)
145996780:     	movl	%ebp, %ecx
145996782:     	movq	%rax, %rdx
145996785:     	callq	0x145ba4f00 <.text+0x5ba3f00>
14599678a:     	cmpq	$0x1, %rax
14599678e:     	je	0x1459967a0 <.text+0x59957a0>
145996790:     	jmp	0x1459967e8 <.text+0x59957e8>
145996792:     	movl	$0x1, %eax
145996797:     	cmpq	$0x1, %rax
14599679b:     	jne	0x1459967e8 <.text+0x59957e8>
14599679d:     	nopl	(%rax)
1459967a0:     	addq	%rdx, %r13
1459967a3:     	incq	%r13
1459967a6:     	movq	%r13, 0x28(%rsi)
1459967aa:     	movq	%r13, %r12
1459967ad:     	subq	%rdi, %r12
1459967b0:     	setb	%al
1459967b3:     	cmpq	0x48(%rsp), %r13
1459967b8:     	seta	%cl
1459967bb:     	orb	%al, %cl
1459967bd:     	jne	0x145996740 <.text+0x5995740>
1459967bf:     	leaq	(%rbx,%r12), %rcx
1459967c3:     	leaq	0x38(%rsi), %rdx
1459967c7:     	movq	%rdi, %r8
1459967ca:     	callq	0x145bc9787 <.text+0x5bc8787>
1459967cf:     	testl	%eax, %eax
1459967d1:     	jne	0x145996740 <.text+0x5995740>
1459967d7:     	movq	%r13, 0x8(%rsi)
1459967db:     	movq	%r13, 0x38(%rsp)
1459967e0:     	movq	%r13, %rbp
1459967e3:     	jmp	0x145996678 <.text+0x5995678>
1459967e8:     	movq	%r14, 0x28(%rsi)
1459967ec:     	movq	%r14, %r13
1459967ef:     	cmpb	$0x0, 0x49(%rsi)
1459967f3:     	jne	0x14599684f <.text+0x599584f>
1459967f5:     	movb	$0x1, 0x49(%rsi)
1459967f9:     	cmpb	$0x0, 0x36(%rsp)
1459967fe:     	jne	0x145996670 <.text+0x5995670>
145996804:     	movq	%r15, %rbp
145996807:     	movq	0x40(%rsp), %rax
14599680c:     	movq	%rax, %r12
14599680f:     	cmpq	%r15, %rax
145996812:     	jne	0x145996678 <.text+0x5995678>
145996818:     	jmp	0x14599684f <.text+0x599584f>
14599681a:     	movq	$0x10, 0x20(%rsp)
145996823:     	movl	$0x1, %r8d
145996829:     	movl	$0x8, %r9d
14599682f:     	movq	%rdx, %r15
145996832:     	movq	%r12, %rdx
145996835:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599683a:     	movq	%r15, %rdx
14599683d:     	movq	0x50(%rsp), %rcx
145996842:     	jmp	0x145996632 <.text+0x5995632>
145996847:     	testb	$0x1, %al
145996849:     	jne	0x14599684f <.text+0x599584f>
14599684b:     	movb	$0x1, 0x49(%rsi)
14599684f:     	addq	$0x68, %rsp
145996853:     	popq	%rbx
145996854:     	popq	%rbp
145996855:     	popq	%rdi
145996856:     	popq	%rsi
145996857:     	popq	%r12
145996859:     	popq	%r13
14599685b:     	popq	%r14
14599685d:     	popq	%r15
14599685f:     	retq
145996860:     	leaq	0x181e821(%rip), %r9    # 0x1471b5088
145996867:     	movl	$0x4, %r8d
14599686d:     	xorl	%ecx, %ecx
14599686f:     	movq	%rdi, %rdx
145996872:     	callq	0x145d699f0 <.text+0x5d689f0>
145996877:     	ud2
