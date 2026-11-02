
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a0520:     	pushq	%rbp
1454a0521:     	pushq	%r15
1454a0523:     	pushq	%r14
1454a0525:     	pushq	%r13
1454a0527:     	pushq	%r12
1454a0529:     	pushq	%rsi
1454a052a:     	pushq	%rdi
1454a052b:     	pushq	%rbx
1454a052c:     	subq	$0x58, %rsp
1454a0530:     	leaq	0x50(%rsp), %rbp
1454a0535:     	movq	$-0x2, (%rbp)
1454a053d:     	movzbl	0x129(%rdx), %eax
1454a0544:     	cmpb	$0x2, %al
1454a0546:     	jne	0x1454a0576 <.text+0x549f576>
1454a0548:     	movq	$-0x1, (%rcx)
1454a054f:     	leaq	0x15563c7(%rip), %rax   # 0x1469f691d
1454a0556:     	movq	%rax, 0x8(%rcx)
1454a055a:     	movq	$0x4, 0x10(%rcx)
1454a0562:     	movl	$0x18, %edx
1454a0567:     	leaq	0x15563b3(%rip), %rax   # 0x1469f6921
1454a056e:     	xorl	%r8d, %r8d
1454a0571:     	jmp	0x1454a0894 <.text+0x549f894>
1454a0576:     	cmpb	$0x3, %al
1454a0578:     	jne	0x1454a058f <.text+0x549f58f>
1454a057a:     	cmpl	$0x1, 0x20(%rdx)
1454a057e:     	jne	0x1454a05f3 <.text+0x549f5f3>
1454a0580:     	movq	0x28(%rdx), %r9
1454a0584:     	cmpq	0x730(%rdx), %r9
1454a058b:     	jb	0x1454a05a3 <.text+0x549f5a3>
1454a058d:     	jmp	0x1454a05f3 <.text+0x549f5f3>
1454a058f:     	cmpq	$0x0, 0x40(%rdx)
1454a0594:     	je	0x1454a05dc <.text+0x549f5dc>
1454a0596:     	movq	0x48(%rdx), %r9
1454a059a:     	cmpq	0x730(%rdx), %r9
1454a05a1:     	jae	0x1454a05f3 <.text+0x549f5f3>
1454a05a3:     	movq	0x728(%rdx), %r15
1454a05aa:     	leaq	(%r9,%r9,4), %r12
1454a05ae:     	movq	0x8(%r15,%r12,8), %rdi
1454a05b3:     	cmpq	$-0x1, (%r15,%r12,8)
1454a05b8:     	movq	0x10(%r15,%r12,8), %rsi
1454a05bd:     	je	0x1454a0642 <.text+0x549f642>
1454a05c3:     	testq	%rsi, %rsi
1454a05c6:     	jns	0x1454a0656 <.text+0x549f656>
1454a05cc:     	xorl	%r14d, %r14d
1454a05cf:     	movq	%r14, %rcx
1454a05d2:     	movq	%rsi, %rdx
1454a05d5:     	callq	0x14590379b <.text+0x590279b>
1454a05da:     	ud2
1454a05dc:     	cmpb	$0x1, %al
1454a05de:     	jne	0x1454a05f3 <.text+0x549f5f3>
1454a05e0:     	cmpl	$0x1, 0x30(%rdx)
1454a05e4:     	jne	0x1454a05f3 <.text+0x549f5f3>
1454a05e6:     	movq	0x38(%rdx), %r9
1454a05ea:     	cmpq	0x730(%rdx), %r9
1454a05f1:     	jb	0x1454a05a3 <.text+0x549f5a3>
1454a05f3:     	testl	%r8d, %r8d
1454a05f6:     	je	0x1454a0800 <.text+0x549f800>
1454a05fc:     	movq	0x2b0(%rdx), %r11
1454a0603:     	movq	0xb8(%rdx), %r9
1454a060a:     	movq	0xc0(%rdx), %r10
1454a0611:     	imulq	$0x58, 0x2b8(%rdx), %rdx
1454a0619:     	xorl	%esi, %esi
1454a061b:     	nopl	(%rax,%rax)
1454a0620:     	cmpq	%rsi, %rdx
1454a0623:     	je	0x1454a0699 <.text+0x549f699>
1454a0625:     	movq	(%r11,%rsi), %rbx
1454a0629:     	cmpl	%r8d, 0x40(%rbx)
1454a062d:     	je	0x1454a06cd <.text+0x549f6cd>
1454a0633:     	addq	$0x58, %rsi
1454a0637:     	cmpl	%r8d, 0x64(%rbx)
1454a063b:     	jne	0x1454a0620 <.text+0x549f620>
1454a063d:     	jmp	0x1454a06cd <.text+0x549f6cd>
1454a0642:     	movq	%rdi, 0x8(%rcx)
1454a0646:     	movq	%rsi, 0x10(%rcx)
1454a064a:     	movq	$-0x1, (%rcx)
1454a0651:     	jmp	0x1454a0768 <.text+0x549f768>
1454a0656:     	je	0x1454a0758 <.text+0x549f758>
1454a065c:     	movq	%rcx, %r13
1454a065f:     	callq	0x140002200 <.text+0x1200>
1454a0664:     	movl	$0x1, %r14d
1454a066a:     	movl	$0x1, %edx
1454a066f:     	movq	%rsi, %rcx
1454a0672:     	callq	0x1400021c0 <.text+0x11c0>
1454a0677:     	testq	%rax, %rax
1454a067a:     	je	0x1454a05cf <.text+0x549f5cf>
1454a0680:     	movq	%rax, %rbx
1454a0683:     	movq	%rax, %rcx
1454a0686:     	movq	%rdi, %rdx
1454a0689:     	movq	%rsi, %r8
1454a068c:     	callq	0x1457731ed <.text+0x57721ed>
1454a0691:     	movq	%r13, %rcx
1454a0694:     	jmp	0x1454a075d <.text+0x549f75d>
1454a0699:     	shlq	$0x5, %r10
1454a069d:     	leaq	(%r10,%r10,2), %rdx
1454a06a1:     	xorl	%r10d, %r10d
1454a06a4:     	nopw	%cs:(%rax,%rax)
1454a06b0:     	cmpq	%r10, %rdx
1454a06b3:     	je	0x1454a077c <.text+0x549f77c>
1454a06b9:     	movq	(%r9,%r10), %rbx
1454a06bd:     	cmpl	%r8d, 0x40(%rbx)
1454a06c1:     	je	0x1454a06cd <.text+0x549f6cd>
1454a06c3:     	addq	$0x60, %r10
1454a06c7:     	cmpl	%r8d, 0x64(%rbx)
1454a06cb:     	jne	0x1454a06b0 <.text+0x549f6b0>
1454a06cd:     	movq	%rcx, %r14
1454a06d0:     	movq	%rbx, -0x30(%rbp)
1454a06d4:     	leaq	-0x549e61b(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454a06db:     	movq	%rax, -0x28(%rbp)
1454a06df:     	leaq	0x128b221(%rip), %rdx   # 0x14672b907
1454a06e6:     	leaq	-0x20(%rbp), %rcx
1454a06ea:     	leaq	-0x30(%rbp), %r8
1454a06ee:     	callq	0x145728390 <.text+0x5727390>
1454a06f3:     	movq	-0x18(%rbp), %rcx
1454a06f7:     	movq	-0x10(%rbp), %rdx
1454a06fb:     	movq	0x10(%rbx), %r15
1454a06ff:     	movq	0x18(%rbx), %r12
1454a0703:     	movq	%rcx, -0x8(%rbp)
1454a0707:     	callq	0x145457cb0 <.text+0x5456cb0>
1454a070c:     	nop
1454a070d:     	movq	%rax, %rdi
1454a0710:     	movq	%rdx, %rsi
1454a0713:     	movq	-0x20(%rbp), %rdx
1454a0717:     	testq	%rdx, %rdx
1454a071a:     	je	0x1454a072b <.text+0x549f72b>
1454a071c:     	movl	$0x1, %r8d
1454a0722:     	movq	-0x8(%rbp), %rcx
1454a0726:     	callq	0x1400021d0 <.text+0x11d0>
1454a072b:     	testq	%rdi, %rdi
1454a072e:     	cmovneq	%rdi, %r15
1454a0732:     	cmoveq	%r12, %rsi
1454a0736:     	movq	0x20(%rbx), %rax
1454a073a:     	movq	0x28(%rbx), %rdx
1454a073e:     	movq	%r14, %rcx
1454a0741:     	movq	$-0x1, (%r14)
1454a0748:     	movq	%r15, 0x8(%r14)
1454a074c:     	movq	%rsi, 0x10(%r14)
1454a0750:     	xorl	%r8d, %r8d
1454a0753:     	jmp	0x1454a0894 <.text+0x549f894>
1454a0758:     	movl	$0x1, %ebx
1454a075d:     	movq	%rsi, (%rcx)
1454a0760:     	movq	%rbx, 0x8(%rcx)
1454a0764:     	movq	%rsi, 0x10(%rcx)
1454a0768:     	leaq	(%r15,%r12,8), %rdx
1454a076c:     	movq	0x18(%rdx), %rax
1454a0770:     	movq	0x20(%rdx), %rdx
1454a0774:     	movb	$0x1, %r8b
1454a0777:     	jmp	0x1454a0894 <.text+0x549f894>
1454a077c:     	leaq	0x12963c5(%rip), %rbx   # 0x146736b48
1454a0783:     	movl	$0x3480, %edx           # imm = 0x3480
1454a0788:     	testq	%rdx, %rdx
1454a078b:     	je	0x1454a07d0 <.text+0x549f7d0>
1454a078d:     	cmpl	%r8d, 0x40(%rbx)
1454a0791:     	je	0x1454a06cd <.text+0x549f6cd>
1454a0797:     	cmpl	%r8d, 0x64(%rbx)
1454a079b:     	je	0x1454a06cd <.text+0x549f6cd>
1454a07a1:     	cmpl	%r8d, 0xb8(%rbx)
1454a07a8:     	je	0x1454a0822 <.text+0x549f822>
1454a07aa:     	leaq	0xf0(%rbx), %r9
1454a07b1:     	addq	$-0xf0, %rdx
1454a07b8:     	cmpl	%r8d, 0xdc(%rbx)
1454a07bf:     	movq	%r9, %rbx
1454a07c2:     	jne	0x1454a0788 <.text+0x549f788>
1454a07c4:     	addq	$-0x78, %r9
1454a07c8:     	movq	%r9, %rbx
1454a07cb:     	jmp	0x1454a06cd <.text+0x549f6cd>
1454a07d0:     	movl	$0x13, %edx
1454a07d5:     	cmpl	$0x1d3, %r8d            # imm = 0x1D3
1454a07dc:     	je	0x1454a082b <.text+0x549f82b>
1454a07de:     	cmpl	$0x3b85, %r8d           # imm = 0x3B85
1454a07e5:     	jne	0x1454a0800 <.text+0x549f800>
1454a07e7:     	leaq	0x1556154(%rip), %rax   # 0x1469f6942
1454a07ee:     	movl	$0x9, %r10d
1454a07f4:     	leaq	0x155613e(%rip), %r9    # 0x1469f6939
1454a07fb:     	jmp	0x1454a0882 <.text+0x549f882>
1454a0800:     	cmpb	$0x3, %al
1454a0802:     	jne	0x1454a0848 <.text+0x549f848>
1454a0804:     	movb	$0x1, %r8b
1454a0807:     	movl	$0x14, %edx
1454a080c:     	leaq	0x1556162(%rip), %rax   # 0x1469f6975
1454a0813:     	movl	$0x7, %r10d
1454a0819:     	leaq	0x155614e(%rip), %r9    # 0x1469f696e
1454a0820:     	jmp	0x1454a0885 <.text+0x549f885>
1454a0822:     	addq	$0x78, %rbx
1454a0826:     	jmp	0x1454a06cd <.text+0x549f6cd>
1454a082b:     	cmpb	$0x3, %al
1454a082d:     	jne	0x1454a0848 <.text+0x549f848>
1454a082f:     	movb	$0x1, %r8b
1454a0832:     	leaq	0x1556122(%rip), %rax   # 0x1469f695b
1454a0839:     	movl	$0x6, %r10d
1454a083f:     	leaq	0x155610f(%rip), %r9    # 0x1469f6955
1454a0846:     	jmp	0x1454a0885 <.text+0x549f885>
1454a0848:     	xorl	%edx, %edx
1454a084a:     	testl	%r8d, %r8d
1454a084d:     	leaq	0x1556135(%rip), %rax   # 0x1469f6989
1454a0854:     	leaq	0x155613f(%rip), %r9    # 0x1469f699a
1454a085b:     	cmoveq	%rax, %r9
1454a085f:     	leaq	0x1556128(%rip), %r8    # 0x1469f698e
1454a0866:     	leaq	0x1556132(%rip), %rax   # 0x1469f699f
1454a086d:     	cmoveq	%r8, %rax
1454a0871:     	setne	%dl
1454a0874:     	leaq	(%rdx,%rdx,8), %rdx
1454a0878:     	addq	$0xc, %rdx
1454a087c:     	movl	$0x5, %r10d
1454a0882:     	xorl	%r8d, %r8d
1454a0885:     	movq	$-0x1, (%rcx)
1454a088c:     	movq	%r9, 0x8(%rcx)
1454a0890:     	movq	%r10, 0x10(%rcx)
1454a0894:     	movq	%rax, 0x18(%rcx)
1454a0898:     	movq	%rdx, 0x20(%rcx)
1454a089c:     	movb	%r8b, 0x28(%rcx)
1454a08a0:     	addq	$0x58, %rsp
1454a08a4:     	popq	%rbx
1454a08a5:     	popq	%rdi
1454a08a6:     	popq	%rsi
1454a08a7:     	popq	%r12
1454a08a9:     	popq	%r13
1454a08ab:     	popq	%r14
1454a08ad:     	popq	%r15
1454a08af:     	popq	%rbp
1454a08b0:     	retq
