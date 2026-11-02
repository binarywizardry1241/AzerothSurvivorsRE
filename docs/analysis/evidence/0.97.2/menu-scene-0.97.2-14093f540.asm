
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14093f540:     	pushq	%r15
14093f542:     	pushq	%r14
14093f544:     	pushq	%rsi
14093f545:     	pushq	%rdi
14093f546:     	pushq	%rbp
14093f547:     	pushq	%rbx
14093f548:     	subq	$0x28, %rsp
14093f54c:     	movq	(%rdx), %rax
14093f54f:     	movq	(%r8), %rsi
14093f552:     	movq	0x8(%r8), %rdi
14093f556:     	movl	0x14(%r8), %ebx
14093f55a:     	cmpb	$0x0, 0x58(%rax)
14093f55e:     	jne	0x14093f569 <.text+0x93e569>
14093f560:     	callq	0x1406cc6e0 <.text+0x6cb6e0>
14093f565:     	testb	%al, %al
14093f567:     	je	0x14093f56d <.text+0x93e56d>
14093f569:     	movb	$0x1, %al
14093f56b:     	jmp	0x14093f56f <.text+0x93e56f>
14093f56d:     	xorl	%eax, %eax
14093f56f:     	movq	0xf8(%rsi), %rcx
14093f576:     	movq	0x100(%rsi), %rdx
14093f57d:     	leaq	(%rcx,%rdx,4), %rdx
14093f581:     	cmpb	$0x0, 0x108(%rsi)
14093f588:     	je	0x14093f60a <.text+0x93e60a>
14093f58e:     	xorl	%r8d, %r8d
14093f591:     	xorl	%r10d, %r10d
14093f594:     	xorl	%r11d, %r11d
14093f597:     	cmpl	%r8d, %r11d
14093f59a:     	jne	0x14093f5f4 <.text+0x93e5f4>
14093f59c:     	nopl	(%rax)
14093f5a0:     	cmpq	%rdx, %rcx
14093f5a3:     	je	0x14093f6b6 <.text+0x93e6b6>
14093f5a9:     	movl	(%rcx), %r8d
14093f5ac:     	addq	$0x4, %rcx
14093f5b0:     	movq	0x1a8(%rdi), %r9
14093f5b7:     	leaq	(%r8,%r8,8), %r10
14093f5bb:     	movq	0x10(%r9,%r10,8), %r8
14093f5c0:     	testq	%r8, %r8
14093f5c3:     	je	0x14093f5a0 <.text+0x93e5a0>
14093f5c5:     	leaq	(%r9,%r10,8), %r9
14093f5c9:     	movq	0x110(%rsi), %r10
14093f5d0:     	movq	0x18(%r9), %r11
14093f5d4:     	movq	0x38(%r9), %r9
14093f5d8:     	movq	(%r9,%r10,8), %r9
14093f5dc:     	notq	%r9
14093f5df:     	leaq	(%r9,%r9,2), %r9
14093f5e3:     	shlq	$0x4, %r9
14093f5e7:     	movq	0x10(%r11,%r9), %r10
14093f5ec:     	movq	0x28(%r11,%r9), %r9
14093f5f1:     	xorl	%r11d, %r11d
14093f5f4:     	movl	%r11d, %r14d
14093f5f7:     	incl	%r11d
14093f5fa:     	cmpb	%al, (%r10,%r14)
14093f5fe:     	je	0x14093f597 <.text+0x93e597>
14093f600:     	movl	%ebx, (%r9,%r14,4)
14093f604:     	movb	%al, (%r10,%r14)
14093f608:     	jmp	0x14093f597 <.text+0x93e597>
14093f60a:     	xorl	%r8d, %r8d
14093f60d:     	movl	$0x8, %r9d
14093f613:     	xorl	%r11d, %r11d
14093f616:     	xorl	%ebp, %ebp
14093f618:     	cmpl	%r8d, %ebp
14093f61b:     	jne	0x14093f68e <.text+0x93e68e>
14093f61d:     	nopl	(%rax)
14093f620:     	cmpq	%rdx, %rcx
14093f623:     	je	0x14093f6b6 <.text+0x93e6b6>
14093f629:     	movl	(%rcx), %r8d
14093f62c:     	addq	$0x4, %rcx
14093f630:     	movq	0x108(%rdi), %r9
14093f637:     	leaq	(%r8,%r8,4), %r10
14093f63b:     	shlq	$0x5, %r10
14093f63f:     	movq	0x58(%r9,%r10), %r8
14093f644:     	testq	%r8, %r8
14093f647:     	je	0x14093f620 <.text+0x93e620>
14093f649:     	addq	%r10, %r9
14093f64c:     	movl	0x94(%r9), %r10d
14093f653:     	movq	0x1a8(%rdi), %r11
14093f65a:     	leaq	(%r10,%r10,8), %r10
14093f65e:     	movq	0x110(%rsi), %r14
14093f665:     	movq	0x18(%r11,%r10,8), %r15
14093f66a:     	movq	0x38(%r11,%r10,8), %r10
14093f66f:     	movq	(%r10,%r14,8), %r10
14093f673:     	notq	%r10
14093f676:     	leaq	(%r10,%r10,2), %r10
14093f67a:     	shlq	$0x4, %r10
14093f67e:     	movq	0x10(%r15,%r10), %r11
14093f683:     	movq	0x28(%r15,%r10), %r10
14093f688:     	movq	0x50(%r9), %r9
14093f68c:     	xorl	%ebp, %ebp
14093f68e:     	movl	%ebp, %r14d
14093f691:     	shlq	$0x4, %r14
14093f695:     	incl	%ebp
14093f697:     	movl	0x8(%r9,%r14), %r14d
14093f69c:     	notl	%r14d
14093f69f:     	cmpb	%al, (%r11,%r14)
14093f6a3:     	je	0x14093f618 <.text+0x93e618>
14093f6a9:     	movl	%ebx, (%r10,%r14,4)
14093f6ad:     	movb	%al, (%r11,%r14)
14093f6b1:     	jmp	0x14093f618 <.text+0x93e618>
14093f6b6:     	addq	$0x28, %rsp
14093f6ba:     	popq	%rbx
14093f6bb:     	popq	%rbp
14093f6bc:     	popq	%rdi
14093f6bd:     	popq	%rsi
14093f6be:     	popq	%r14
14093f6c0:     	popq	%r15
14093f6c2:     	retq
