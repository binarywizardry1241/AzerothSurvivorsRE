
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145949470:     	pushq	%rbp
145949471:     	pushq	%r15
145949473:     	pushq	%r14
145949475:     	pushq	%r12
145949477:     	pushq	%rsi
145949478:     	pushq	%rdi
145949479:     	pushq	%rbx
14594947a:     	subq	$0x140, %rsp            # imm = 0x140
145949481:     	leaq	0x80(%rsp), %rbp
145949489:     	movaps	%xmm9, 0xb0(%rbp)
145949491:     	movaps	%xmm8, 0xa0(%rbp)
145949499:     	movaps	%xmm7, 0x90(%rbp)
1459494a0:     	movaps	%xmm6, 0x80(%rbp)
1459494a7:     	movq	$-0x2, 0x78(%rbp)
1459494af:     	movq	0x320(%rcx), %rax
1459494b6:     	testq	%rax, %rax
1459494b9:     	je	0x1459497da <.text+0x59487da>
1459494bf:     	movq	0x318(%rcx), %r9
1459494c6:     	imulq	$0x68, %rax, %r11
1459494ca:     	xorl	%r10d, %r10d
1459494cd:     	movabsq	$0x5f666f5f6c6c6163, %rsi # imm = 0x5F666F5F6C6C6163
1459494d7:     	movabsq	$0x656d616c665f666f, %rdi # imm = 0x656D616C665F666F
1459494e1:     	jmp	0x1459494fd <.text+0x59484fd>
1459494e3:     	nopw	%cs:(%rax,%rax)
1459494f0:     	addq	$0x68, %r10
1459494f4:     	cmpq	%r10, %r11
1459494f7:     	je	0x1459497da <.text+0x59487da>
1459494fd:     	movq	(%r9,%r10), %r14
145949501:     	cmpq	$0xd, 0x8(%r14)
145949506:     	jne	0x1459494f0 <.text+0x59484f0>
145949508:     	movq	(%r14), %rax
14594950b:     	movq	(%rax), %rbx
14594950e:     	xorq	%rsi, %rbx
145949511:     	movq	0x5(%rax), %r15
145949515:     	xorq	%rdi, %r15
145949518:     	orq	%rbx, %r15
14594951b:     	jne	0x1459494f0 <.text+0x59484f0>
14594951d:     	movl	0x20(%r9,%r10), %r11d
145949522:     	movss	0x2c(%r9,%r10), %xmm0
145949529:     	movl	0x30(%r9,%r10), %esi
14594952e:     	movq	0x18(%r9,%r10), %rdi
145949533:     	movq	%rdi, -0x20(%rbp)
145949537:     	movups	0x8(%r9,%r10), %xmm1
14594953d:     	movups	%xmm1, -0x30(%rbp)
145949541:     	movups	0x44(%r9,%r10), %xmm1
145949547:     	movups	0x54(%r9,%r10), %xmm2
14594954d:     	movups	%xmm1, 0xc(%rbp)
145949551:     	movups	%xmm2, 0x1c(%rbp)
145949555:     	movl	0x64(%r9,%r10), %edi
14594955a:     	movl	%edi, 0x2c(%rbp)
14594955d:     	movq	%r14, -0x38(%rbp)
145949561:     	movl	%r11d, -0x18(%rbp)
145949565:     	movss	0x28(%r9,%r10), %xmm6
14594956c:     	movsd	0x24(%r9,%r10), %xmm1
145949573:     	movsd	%xmm1, -0x14(%rbp)
145949578:     	movss	%xmm0, -0xc(%rbp)
14594957d:     	movl	%esi, -0x8(%rbp)
145949580:     	movups	0x34(%r9,%r10), %xmm0
145949586:     	movups	%xmm0, -0x4(%rbp)
14594958a:     	movss	0x9ec(%rcx), %xmm1
145949592:     	movq	0x7e0(%rcx), %r10
145949599:     	movss	0x53876f(%rip), %xmm2   # 0x145e81d10
1459495a1:     	testq	%r10, %r10
1459495a4:     	je	0x1459495ef <.text+0x59485ef>
1459495a6:     	movq	0x7d8(%rcx), %r9
1459495ad:     	shlq	$0x3, %r10
1459495b1:     	leaq	(%r10,%r10,2), %r11
1459495b5:     	xorl	%r10d, %r10d
1459495b8:     	jmp	0x1459495c9 <.text+0x59485c9>
1459495ba:     	nopw	(%rax,%rax)
1459495c0:     	addq	$0x18, %r10
1459495c4:     	cmpq	%r10, %r11
1459495c7:     	je	0x1459495ef <.text+0x59485ef>
1459495c9:     	cmpq	$0xd, 0x8(%r9,%r10)
1459495cf:     	jne	0x1459495c0 <.text+0x59485c0>
1459495d1:     	movq	(%r9,%r10), %rsi
1459495d5:     	movq	(%rsi), %rdi
1459495d8:     	xorq	(%rax), %rdi
1459495db:     	movq	0x5(%rsi), %rsi
1459495df:     	xorq	0x5(%rax), %rsi
1459495e3:     	orq	%rdi, %rsi
1459495e6:     	jne	0x1459495c0 <.text+0x59485c0>
1459495e8:     	movss	0x10(%r9,%r10), %xmm2
1459495ef:     	ucomiss	%xmm2, %xmm1
1459495f2:     	jb	0x1459497da <.text+0x59487da>
1459495f8:     	movss	0x478(%rcx), %xmm8
145949601:     	mulss	0x18(%rbp), %xmm0
145949606:     	mulss	0x50(%r14), %xmm0
14594960c:     	mulss	0x4a0(%rcx), %xmm0
145949614:     	movq	%rcx, %rbx
145949617:     	movss	0x47c(%rcx), %xmm7
14594961f:     	movss	0x71d269(%rip), %xmm1   # 0x146066890
145949627:     	movq	%rdx, %rsi
14594962a:     	ucomiss	%xmm0, %xmm1
14594962d:     	jae	0x14594965d <.text+0x594865d>
14594962f:     	addss	0x152ee31(%rip), %xmm0  # 0x146e78468
145949637:     	movss	0x424010(%rip), %xmm9   # 0x145d6d650
145949640:     	divss	%xmm9, %xmm0
145949645:     	movq	%r8, %rdi
145949648:     	callq	0x145bc98dd <.text+0x5bc88dd>
14594964d:     	movq	%rdi, %r8
145949650:     	mulss	%xmm9, %xmm0
145949655:     	addss	0x71d233(%rip), %xmm0   # 0x146066890
14594965d:     	movq	$0x0, 0x28(%rsp)
145949666:     	movq	$0x8, 0x20(%rsp)
14594966f:     	leaq	0x60(%rbp), %rcx
145949673:     	movq	%rbx, %rdx
145949676:     	movaps	%xmm0, %xmm3
145949679:     	callq	0x145925c80 <.text+0x5924c80>
14594967e:     	movq	0x70(%rbp), %r15
145949682:     	testq	%r15, %r15
145949685:     	je	0x145949749 <.text+0x5948749>
14594968b:     	leaq	-0x38(%rbp), %rdx
14594968f:     	movq	%rbx, %rcx
145949692:     	callq	0x145946220 <.text+0x5945220>
145949697:     	nop
145949698:     	movq	0x68(%rbp), %rdi
14594969c:     	movl	$0x2, -0x48(%rbp)
1459496a3:     	movl	$0x0, 0x54(%rbp)
1459496aa:     	leaq	0x54(%rbp), %rax
1459496ae:     	movq	%rax, 0x30(%rsp)
1459496b3:     	leaq	-0x48(%rbp), %rax
1459496b7:     	movq	%rax, 0x28(%rsp)
1459496bc:     	movq	%r15, 0x20(%rsp)
1459496c1:     	leaq	0x30(%rbp), %rcx
1459496c5:     	movq	%rsi, %rdx
1459496c8:     	movl	$0x209d, %r8d           # imm = 0x209D
1459496ce:     	movq	%rdi, %r9
1459496d1:     	callq	0x1458b5100 <.text+0x58b4100>
1459496d6:     	nop
1459496d7:     	movq	%rbx, %rcx
1459496da:     	movq	0x5e0(%rbx), %r12
1459496e1:     	cmpq	0x5d0(%rbx), %r12
1459496e8:     	jne	0x1459496f9 <.text+0x59486f9>
1459496ea:     	addq	$0x5d0, %rcx            # imm = 0x5D0
1459496f1:     	callq	0x145bcb530 <.text+0x5bca530>
1459496f6:     	movq	%rbx, %rcx
1459496f9:     	movq	0x5d8(%rcx), %rax
145949700:     	movq	%r12, %rdx
145949703:     	shlq	$0x5, %rdx
145949707:     	movups	0x30(%rbp), %xmm0
14594970b:     	movups	0x40(%rbp), %xmm1
14594970f:     	movups	%xmm1, 0x10(%rax,%rdx)
145949714:     	movups	%xmm0, (%rax,%rdx)
145949718:     	incq	%r12
14594971b:     	movq	%r12, 0x5e0(%rcx)
145949722:     	movss	0x44(%r14), %xmm1
145949728:     	movss	0xc(%rbp), %xmm0
14594972d:     	movzbl	0x75(%r14), %eax
145949732:     	addb	$-0x2, %al
145949734:     	cmpb	$0x6, %al
145949736:     	ja	0x145949766 <.text+0x5948766>
145949738:     	movzbl	%al, %eax
14594973b:     	leaq	0x1531a32(%rip), %rdx   # 0x146e7b174
145949742:     	movss	(%rdx,%rax,4), %xmm2
145949747:     	jmp	0x14594976e <.text+0x594876e>
145949749:     	movq	0x60(%rbp), %rdx
14594974d:     	testq	%rdx, %rdx
145949750:     	je	0x1459497da <.text+0x59487da>
145949756:     	movq	0x68(%rbp), %rcx
14594975a:     	shlq	$0x3, %rdx
14594975e:     	movl	$0x8, %r8d
145949764:     	jmp	0x1459497d5 <.text+0x59487d5>
145949766:     	movss	0x423bfe(%rip), %xmm2   # 0x145d6d36c
14594976e:     	mulss	0x20(%rbp), %xmm8
145949774:     	xorps	%xmm3, %xmm3
145949777:     	cmpltss	%xmm1, %xmm3
14594977c:     	andps	%xmm8, %xmm3
145949780:     	mulss	0x42a5b8(%rip), %xmm1   # 0x145d73d40
145949788:     	mulss	%xmm1, %xmm6
14594978c:     	mulss	%xmm6, %xmm0
145949790:     	mulss	%xmm2, %xmm0
145949794:     	addss	%xmm3, %xmm0
145949798:     	mulss	%xmm0, %xmm7
14594979c:     	movq	%r15, 0x28(%rsp)
1459497a1:     	movq	%rdi, 0x20(%rsp)
1459497a6:     	movss	%xmm7, 0x30(%rsp)
1459497ac:     	leaq	-0x38(%rbp), %rdx
1459497b0:     	movq	%rsi, %r8
1459497b3:     	movl	$0x209d, %r9d           # imm = 0x209D
1459497b9:     	callq	0x145945c10 <.text+0x5944c10>
1459497be:     	nop
1459497bf:     	movq	0x60(%rbp), %rdx
1459497c3:     	testq	%rdx, %rdx
1459497c6:     	je	0x1459497da <.text+0x59487da>
1459497c8:     	shlq	$0x3, %rdx
1459497cc:     	movl	$0x8, %r8d
1459497d2:     	movq	%rdi, %rcx
1459497d5:     	callq	0x1400021d0 <.text+0x11d0>
1459497da:     	movaps	0x80(%rbp), %xmm6
1459497e1:     	movaps	0x90(%rbp), %xmm7
1459497e8:     	movaps	0xa0(%rbp), %xmm8
1459497f0:     	movaps	0xb0(%rbp), %xmm9
1459497f8:     	addq	$0x140, %rsp            # imm = 0x140
1459497ff:     	popq	%rbx
145949800:     	popq	%rdi
145949801:     	popq	%rsi
145949802:     	popq	%r12
145949804:     	popq	%r14
145949806:     	popq	%r15
145949808:     	popq	%rbp
145949809:     	retq
