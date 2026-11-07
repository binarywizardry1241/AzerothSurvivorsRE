
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455294b0:     	pushq	%rbp
1455294b1:     	pushq	%r15
1455294b3:     	pushq	%r14
1455294b5:     	pushq	%r13
1455294b7:     	pushq	%r12
1455294b9:     	pushq	%rsi
1455294ba:     	pushq	%rdi
1455294bb:     	pushq	%rbx
1455294bc:     	subq	$0x128, %rsp            # imm = 0x128
1455294c3:     	leaq	0x80(%rsp), %rbp
1455294cb:     	movq	$-0x2, 0xa0(%rbp)
1455294d6:     	movq	%rcx, %rsi
1455294d9:     	movq	(%rdx), %r13
1455294dc:     	movq	0x8(%rdx), %r12
1455294e0:     	cmpq	%r12, %r13
1455294e3:     	je	0x145529698 <.text+0x5528698>
1455294e9:     	movq	0x10(%rdx), %r15
1455294ed:     	movq	(%r15), %rax
1455294f0:     	addq	$0x50, %r13
1455294f4:     	nopw	%cs:(%rax,%rax)
145529500:     	cmpq	%rax, -0x10(%r13)
145529504:     	je	0x145529514 <.text+0x5528514>
145529506:     	cmpq	%r12, %r13
145529509:     	leaq	0x50(%r13), %r13
14552950d:     	jne	0x145529500 <.text+0x5528500>
14552950f:     	jmp	0x145529698 <.text+0x5528698>
145529514:     	movq	%r13, (%rdx)
145529517:     	leaq	-0x50(%r13), %rdx
14552951b:     	leaq	0x18(%rbp), %rcx
14552951f:     	callq	0x145413de0 <.text+0x5412de0>
145529524:     	cmpq	$-0x1, 0x18(%rbp)
145529529:     	je	0x145529698 <.text+0x5528698>
14552952f:     	callq	0x140002200 <.text+0x1200>
145529534:     	movl	$0x1c0, %ecx            # imm = 0x1C0
145529539:     	movl	$0x8, %edx
14552953e:     	callq	0x1400021c0 <.text+0x11c0>
145529543:     	testq	%rax, %rax
145529546:     	je	0x1455296c6 <.text+0x55286c6>
14552954c:     	movq	%rax, %rdi
14552954f:     	movups	0x78(%rbp), %xmm0
145529553:     	movups	%xmm0, 0x60(%rax)
145529557:     	movups	0x68(%rbp), %xmm0
14552955b:     	movups	%xmm0, 0x50(%rax)
14552955f:     	movups	0x58(%rbp), %xmm0
145529563:     	movups	%xmm0, 0x40(%rax)
145529567:     	movups	0x18(%rbp), %xmm0
14552956b:     	movups	0x28(%rbp), %xmm1
14552956f:     	movups	0x38(%rbp), %xmm2
145529573:     	movups	0x48(%rbp), %xmm3
145529577:     	movups	%xmm3, 0x30(%rax)
14552957b:     	movups	%xmm2, 0x20(%rax)
14552957f:     	movups	%xmm1, 0x10(%rax)
145529583:     	movups	%xmm0, (%rax)
145529586:     	movq	$0x4, 0x88(%rbp)
145529591:     	movq	%rax, 0x90(%rbp)
145529598:     	movq	$0x1, 0x98(%rbp)
1455295a3:     	cmpq	%r12, %r13
1455295a6:     	je	0x145529676 <.text+0x5528676>
1455295ac:     	movl	$0x1, %ebx
1455295b1:     	leaq	-0x58(%rbp), %r14
1455295b5:     	movq	(%r15), %rax
1455295b8:     	addq	$0x50, %r13
1455295bc:     	nopl	(%rax)
1455295c0:     	cmpq	%rax, -0x10(%r13)
1455295c4:     	je	0x1455295d4 <.text+0x55285d4>
1455295c6:     	cmpq	%r12, %r13
1455295c9:     	leaq	0x50(%r13), %r13
1455295cd:     	jne	0x1455295c0 <.text+0x55285c0>
1455295cf:     	jmp	0x145529676 <.text+0x5528676>
1455295d4:     	leaq	-0x50(%r13), %rdx
1455295d8:     	movq	%r14, %rcx
1455295db:     	callq	0x145413de0 <.text+0x5412de0>
1455295e0:     	nop
1455295e1:     	cmpq	$-0x1, -0x58(%rbp)
1455295e6:     	je	0x145529676 <.text+0x5528676>
1455295ec:     	cmpq	0x88(%rbp), %rbx
1455295f3:     	jne	0x145529621 <.text+0x5528621>
1455295f5:     	movq	$0x70, 0x20(%rsp)
1455295fe:     	movl	$0x1, %r8d
145529604:     	movl	$0x8, %r9d
14552960a:     	leaq	0x88(%rbp), %rcx
145529611:     	movq	%rbx, %rdx
145529614:     	callq	0x145757d40 <.text+0x5756d40>
145529619:     	nop
14552961a:     	movq	0x90(%rbp), %rdi
145529621:     	imulq	$0x70, %rbx, %rax
145529625:     	movups	0x8(%rbp), %xmm0
145529629:     	movups	%xmm0, 0x60(%rdi,%rax)
14552962e:     	movups	-0x8(%rbp), %xmm0
145529632:     	movups	%xmm0, 0x50(%rdi,%rax)
145529637:     	movups	-0x18(%rbp), %xmm0
14552963b:     	movups	%xmm0, 0x40(%rdi,%rax)
145529640:     	movups	-0x58(%rbp), %xmm0
145529644:     	movups	-0x48(%rbp), %xmm1
145529648:     	movups	-0x38(%rbp), %xmm2
14552964c:     	movups	-0x28(%rbp), %xmm3
145529650:     	movups	%xmm3, 0x30(%rdi,%rax)
145529655:     	movups	%xmm2, 0x20(%rdi,%rax)
14552965a:     	movups	%xmm1, 0x10(%rdi,%rax)
14552965f:     	movups	%xmm0, (%rdi,%rax)
145529663:     	incq	%rbx
145529666:     	movq	%rbx, 0x98(%rbp)
14552966d:     	cmpq	%r12, %r13
145529670:     	jne	0x1455295b5 <.text+0x55285b5>
145529676:     	movq	0x98(%rbp), %rax
14552967d:     	movq	%rax, 0x10(%rsi)
145529681:     	movq	0x88(%rbp), %rax
145529688:     	movq	%rax, (%rsi)
14552968b:     	movq	0x90(%rbp), %rax
145529692:     	movq	%rax, 0x8(%rsi)
145529696:     	jmp	0x1455296af <.text+0x55286af>
145529698:     	movq	$0x0, (%rsi)
14552969f:     	movq	$0x8, 0x8(%rsi)
1455296a7:     	movq	$0x0, 0x10(%rsi)
1455296af:     	movq	%rsi, %rax
1455296b2:     	addq	$0x128, %rsp            # imm = 0x128
1455296b9:     	popq	%rbx
1455296ba:     	popq	%rdi
1455296bb:     	popq	%rsi
1455296bc:     	popq	%r12
1455296be:     	popq	%r13
1455296c0:     	popq	%r14
1455296c2:     	popq	%r15
1455296c4:     	popq	%rbp
1455296c5:     	retq
1455296c6:     	movl	$0x8, %ecx
1455296cb:     	movl	$0x1c0, %edx            # imm = 0x1C0
1455296d0:     	callq	0x1458e721b <.text+0x58e621b>
1455296d5:     	nop
1455296d6:     	ud2
