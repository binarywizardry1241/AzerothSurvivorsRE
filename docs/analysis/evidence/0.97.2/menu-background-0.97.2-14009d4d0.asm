
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14009d4d0:     	pushq	%rbp
14009d4d1:     	pushq	%r15
14009d4d3:     	pushq	%r14
14009d4d5:     	pushq	%r13
14009d4d7:     	pushq	%r12
14009d4d9:     	pushq	%rsi
14009d4da:     	pushq	%rdi
14009d4db:     	pushq	%rbx
14009d4dc:     	subq	$0x128, %rsp            # imm = 0x128
14009d4e3:     	leaq	0x80(%rsp), %rbp
14009d4eb:     	movaps	%xmm10, 0x90(%rbp)
14009d4f3:     	movaps	%xmm9, 0x80(%rbp)
14009d4fb:     	movaps	%xmm8, 0x70(%rbp)
14009d500:     	movaps	%xmm7, 0x60(%rbp)
14009d504:     	movaps	%xmm6, 0x50(%rbp)
14009d508:     	movq	$-0x2, 0x48(%rbp)
14009d510:     	movq	0x128(%rbp), %rax
14009d517:     	movq	0x120(%rbp), %rcx
14009d51e:     	movq	0x118(%rbp), %r10
14009d525:     	movq	0x110(%rbp), %r11
14009d52c:     	movq	(%rdx), %r12
14009d52f:     	movq	0x10(%rdx), %rsi
14009d533:     	movq	%rsi, 0x40(%rbp)
14009d537:     	movl	0x1c(%rdx), %edx
14009d53a:     	movl	%edx, 0x30(%rbp)
14009d53d:     	movq	(%r11), %rbx
14009d540:     	movq	(%r10), %rsi
14009d543:     	movq	(%rcx), %rdx
14009d546:     	movq	%rdx, 0x28(%rbp)
14009d54a:     	movq	0x8(%rcx), %r13
14009d54e:     	movl	0x14(%rcx), %ecx
14009d551:     	movl	%ecx, -0xc(%rbp)
14009d554:     	movq	(%rax), %rcx
14009d557:     	movq	%rcx, -0x58(%rbp)
14009d55b:     	movq	0x8(%rax), %r15
14009d55f:     	movl	0x14(%rax), %eax
14009d562:     	movl	%eax, -0x10(%rbp)
14009d565:     	movss	0x5c(%rsi), %xmm6
14009d56a:     	cmpb	$0x1, 0x1c(%r12)
14009d570:     	movq	%rsi, -0x20(%rbp)
14009d574:     	movq	%rbx, -0x60(%rbp)
14009d578:     	jne	0x14009d58e <.text+0x9c58e>
14009d57a:     	movq	(%r8), %rax
14009d57d:     	cmpb	$0x1, 0xd(%rax)
14009d581:     	jne	0x14009d58e <.text+0x9c58e>
14009d583:     	cmpb	$0x1, 0xe(%rax)
14009d587:     	jne	0x14009d58e <.text+0x9c58e>
14009d589:     	cmpb	$0x0, (%rax)
14009d58c:     	je	0x14009d608 <.text+0x9c608>
14009d58e:     	xorl	%ebx, %ebx
14009d590:     	movq	(%r12), %rsi
14009d594:     	testq	%rsi, %rsi
14009d597:     	movq	%r15, 0x20(%rbp)
14009d59b:     	je	0x14009d70f <.text+0x9c70f>
14009d5a1:     	movq	0x8(%r12), %rdi
14009d5a6:     	testq	%rbx, %rbx
14009d5a9:     	setne	%al
14009d5ac:     	cmpq	%r14, %rdi
14009d5af:     	sete	%cl
14009d5b2:     	testb	%cl, %al
14009d5b4:     	je	0x14009d5cc <.text+0x9c5cc>
14009d5b6:     	movq	%rsi, %rcx
14009d5b9:     	movq	%rbx, %rdx
14009d5bc:     	movq	%r14, %r8
14009d5bf:     	callq	0x145756dd7 <.text+0x5755dd7>
14009d5c4:     	testl	%eax, %eax
14009d5c6:     	je	0x14009d734 <.text+0x9c734>
14009d5cc:     	xorps	%xmm0, %xmm0
14009d5cf:     	ucomiss	0x18(%r12), %xmm0
14009d5d5:     	jb	0x14009d737 <.text+0x9c737>
14009d5db:     	movq	0x40(%rbp), %rax
14009d5df:     	movl	0x30(%rbp), %ecx
14009d5e2:     	movl	%ecx, (%rax)
14009d5e4:     	movq	%rbx, (%r12)
14009d5e8:     	movq	%r14, 0x8(%r12)
14009d5ed:     	movss	%xmm6, 0x10(%r12)
14009d5f4:     	movq	%rbx, %rsi
14009d5f7:     	movq	%r14, %rdi
14009d5fa:     	testq	%rbx, %rbx
14009d5fd:     	jne	0x14009d737 <.text+0x9c737>
14009d603:     	jmp	0x14009d9ba <.text+0x9c9ba>
14009d608:     	movq	(%r9), %rax
14009d60b:     	movq	0x20(%rax), %rdi
14009d60f:     	movq	0x28(%rax), %r14
14009d613:     	leaq	0x585daa6(%rip), %rdx   # 0x1458fb0c0
14009d61a:     	leaq	-0x50(%rbp), %rcx
14009d61e:     	movl	$0x12, %r8d
14009d624:     	callq	0x1456fcac0 <.text+0x56fbac0>
14009d629:     	movq	-0x50(%rbp), %rdx
14009d62d:     	cmpq	$-0x2, %rdx
14009d631:     	movq	%r14, 0x20(%rbp)
14009d635:     	je	0x14009d65e <.text+0x9c65e>
14009d637:     	cmpq	$-0x1, %rdx
14009d63b:     	je	0x14009d6e7 <.text+0x9c6e7>
14009d641:     	testq	%rdx, %rdx
14009d644:     	je	0x14009d6e7 <.text+0x9c6e7>
14009d64a:     	movq	-0x48(%rbp), %rcx
14009d64e:     	movl	$0x1, %r8d
14009d654:     	callq	0x1400021d0 <.text+0x11d0>
14009d659:     	jmp	0x14009d6e7 <.text+0x9c6e7>
14009d65e:     	movq	-0x48(%rbp), %rdx
14009d662:     	cmpq	$-0x1, %rdx
14009d666:     	je	0x14009d6e7 <.text+0x9c6e7>
14009d668:     	movq	-0x40(%rbp), %rbx
14009d66c:     	movq	0x794920d(%rip), %rax   # 0x1479e6880
14009d673:     	movq	0x8(%rax), %rcx
14009d677:     	testq	%rcx, %rcx
14009d67a:     	je	0x14009d6cc <.text+0x9c6cc>
14009d67c:     	movq	%rdx, -0x18(%rbp)
14009d680:     	movq	%r12, 0x38(%rbp)
14009d684:     	movq	-0x38(%rbp), %rsi
14009d688:     	movq	(%rax), %r14
14009d68b:     	imulq	$0xf0, %rcx, %r12
14009d692:     	jmp	0x14009d6a4 <.text+0x9c6a4>
14009d694:     	addq	$0xf0, %r14
14009d69b:     	addq	$-0xf0, %r12
14009d6a2:     	je	0x14009d6bf <.text+0x9c6bf>
14009d6a4:     	cmpq	%rsi, 0x10(%r14)
14009d6a8:     	jne	0x14009d694 <.text+0x9c694>
14009d6aa:     	movq	0x8(%r14), %rcx
14009d6ae:     	movq	%rbx, %rdx
14009d6b1:     	movq	%rsi, %r8
14009d6b4:     	callq	0x145756dd7 <.text+0x5755dd7>
14009d6b9:     	testl	%eax, %eax
14009d6bb:     	jne	0x14009d694 <.text+0x9c694>
14009d6bd:     	jmp	0x14009d6c2 <.text+0x9c6c2>
14009d6bf:     	xorl	%r14d, %r14d
14009d6c2:     	movq	0x38(%rbp), %r12
14009d6c6:     	movq	-0x18(%rbp), %rdx
14009d6ca:     	jmp	0x14009d6cf <.text+0x9c6cf>
14009d6cc:     	xorl	%r14d, %r14d
14009d6cf:     	testq	%rdx, %rdx
14009d6d2:     	je	0x14009d6e2 <.text+0x9c6e2>
14009d6d4:     	movl	$0x1, %r8d
14009d6da:     	movq	%rbx, %rcx
14009d6dd:     	callq	0x1400021d0 <.text+0x11d0>
14009d6e2:     	testq	%r14, %r14
14009d6e5:     	jne	0x14009d6f6 <.text+0x9c6f6>
14009d6e7:     	movq	%rdi, %rcx
14009d6ea:     	movq	0x20(%rbp), %rdx
14009d6ee:     	callq	0x14540e950 <.text+0x540d950>
14009d6f3:     	movq	%rax, %r14
14009d6f6:     	movq	0x8(%r14), %rbx
14009d6fa:     	movq	0x10(%r14), %r14
14009d6fe:     	movq	(%r12), %rsi
14009d702:     	testq	%rsi, %rsi
14009d705:     	movq	%r15, 0x20(%rbp)
14009d709:     	jne	0x14009d5a1 <.text+0x9c5a1>
14009d70f:     	testq	%rbx, %rbx
14009d712:     	je	0x14009d9ba <.text+0x9c9ba>
14009d718:     	movq	0x40(%rbp), %rax
14009d71c:     	movl	0x30(%rbp), %ecx
14009d71f:     	movl	%ecx, (%rax)
14009d721:     	movq	%rbx, (%r12)
14009d725:     	movq	%r14, 0x8(%r12)
14009d72a:     	movss	%xmm6, 0x10(%r12)
14009d731:     	movq	%rbx, %rsi
14009d734:     	movq	%r14, %rdi
14009d737:     	xorl	%eax, %eax
14009d739:     	testq	%rbx, %rbx
14009d73c:     	je	0x14009d756 <.text+0x9c756>
14009d73e:     	cmpq	%r14, %rdi
14009d741:     	jne	0x14009d756 <.text+0x9c756>
14009d743:     	movq	%rsi, %rcx
14009d746:     	movq	%rbx, %rdx
14009d749:     	movq	%r14, %r8
14009d74c:     	callq	0x145756dd7 <.text+0x5755dd7>
14009d751:     	testl	%eax, %eax
14009d753:     	sete	%al
14009d756:     	movl	%eax, -0x18(%rbp)
14009d759:     	subss	0x10(%r12), %xmm6
14009d760:     	movq	%rsi, %rcx
14009d763:     	movq	%rdi, %rdx
14009d766:     	callq	0x14540e950 <.text+0x540d950>
14009d76b:     	movq	%rax, %rbx
14009d76e:     	leaq	-0x50(%rbp), %rcx
14009d772:     	movq	%rax, %rdx
14009d775:     	callq	0x145509c20 <.text+0x5508c20>
14009d77a:     	leaq	0x585d951(%rip), %rdx   # 0x1458fb0d2
14009d781:     	movq	%rbp, %rcx
14009d784:     	movl	$0x18, %r8d
14009d78a:     	callq	0x1456fcac0 <.text+0x56fbac0>
14009d78f:     	movq	(%rbp), %rdx
14009d793:     	cmpq	$-0x2, %rdx
14009d797:     	je	0x14009d7b5 <.text+0x9c7b5>
14009d799:     	cmpq	$-0x1, %rdx
14009d79d:     	je	0x14009d803 <.text+0x9c803>
14009d79f:     	testq	%rdx, %rdx
14009d7a2:     	je	0x14009d803 <.text+0x9c803>
14009d7a4:     	movq	0x8(%rbp), %rcx
14009d7a8:     	movl	$0x1, %r8d
14009d7ae:     	callq	0x1400021d0 <.text+0x11d0>
14009d7b3:     	jmp	0x14009d803 <.text+0x9c803>
14009d7b5:     	movq	0x8(%rbp), %rax
14009d7b9:     	movq	%rax, 0x38(%rbp)
14009d7bd:     	cmpq	$-0x1, %rax
14009d7c1:     	je	0x14009d803 <.text+0x9c803>
14009d7c3:     	movq	0x10(%rbp), %rcx
14009d7c7:     	movq	0x18(%rbp), %rdx
14009d7cb:     	movq	%rcx, -0x8(%rbp)
14009d7cf:     	callq	0x14571afd0 <.text+0x5719fd0>
14009d7d4:     	nop
14009d7d5:     	movq	%rax, %r14
14009d7d8:     	movq	0x38(%rbp), %rdx
14009d7dc:     	testq	%rdx, %rdx
14009d7df:     	je	0x14009d7f0 <.text+0x9c7f0>
14009d7e1:     	movl	$0x1, %r8d
14009d7e7:     	movq	-0x8(%rbp), %rcx
14009d7eb:     	callq	0x1400021d0 <.text+0x11d0>
14009d7f0:     	testb	$0x1, %r14b
14009d7f4:     	jne	0x14009d803 <.text+0x9c803>
14009d7f6:     	shrq	$0x20, %r14
14009d7fa:     	movd	%r14d, %xmm0
14009d7ff:     	mulss	%xmm0, %xmm6
14009d803:     	movl	0xc0(%rbx), %ebx
14009d809:     	movq	0x7949070(%rip), %rax   # 0x1479e6880
14009d810:     	movq	0x8(%rax), %rcx
14009d814:     	testq	%rcx, %rcx
14009d817:     	je	0x14009d87f <.text+0x9c87f>
14009d819:     	movl	%ebx, -0x8(%rbp)
14009d81c:     	movq	%r12, 0x38(%rbp)
14009d820:     	movq	(%rax), %rbx
14009d823:     	imulq	$0xf0, %rcx, %r12
14009d82a:     	xorl	%r14d, %r14d
14009d82d:     	xorl	%r15d, %r15d
14009d830:     	jmp	0x14009d84f <.text+0x9c84f>
14009d832:     	nopw	%cs:(%rax,%rax)
14009d840:     	decq	%r14
14009d843:     	addq	$0xf0, %r15
14009d84a:     	cmpq	%r15, %r12
14009d84d:     	je	0x14009d86f <.text+0x9c86f>
14009d84f:     	cmpq	%rdi, 0x10(%rbx,%r15)
14009d854:     	jne	0x14009d840 <.text+0x9c840>
14009d856:     	movq	0x8(%rbx,%r15), %rcx
14009d85b:     	movq	%rsi, %rdx
14009d85e:     	movq	%rdi, %r8
14009d861:     	callq	0x145756dd7 <.text+0x5755dd7>
14009d866:     	testl	%eax, %eax
14009d868:     	jne	0x14009d840 <.text+0x9c840>
14009d86a:     	negl	%r14d
14009d86d:     	jmp	0x14009d872 <.text+0x9c872>
14009d86f:     	xorl	%r14d, %r14d
14009d872:     	movq	0x20(%rbp), %r15
14009d876:     	movq	0x38(%rbp), %r12
14009d87a:     	movl	-0x8(%rbp), %ebx
14009d87d:     	jmp	0x14009d882 <.text+0x9c882>
14009d87f:     	xorl	%r14d, %r14d
14009d882:     	movss	-0x38(%rbp), %xmm8
14009d888:     	movss	0x584f783(%rip), %xmm9  # 0x1458ed014
14009d891:     	mulss	%xmm9, %xmm6
14009d896:     	divss	-0x34(%rbp), %xmm6
14009d89b:     	movaps	%xmm6, %xmm0
14009d89e:     	callq	0x145756e2b <.text+0x5755e2b>
14009d8a3:     	movaps	%xmm0, %xmm7
14009d8a6:     	cmpnless	%xmm8, %xmm9
14009d8ac:     	mulss	%xmm0, %xmm8
14009d8b1:     	movaps	%xmm9, %xmm0
14009d8b5:     	andnps	%xmm6, %xmm0
14009d8b8:     	andps	%xmm9, %xmm8
14009d8bc:     	orps	%xmm0, %xmm8
14009d8c0:     	movss	-0x44(%rbp), %xmm10
14009d8c6:     	movss	-0x48(%rbp), %xmm9
14009d8cc:     	addss	-0x3c(%rbp), %xmm8
14009d8d2:     	movaps	%xmm8, %xmm0
14009d8d6:     	callq	0x145756e2b <.text+0x5755e2b>
14009d8db:     	movaps	%xmm0, %xmm6
14009d8de:     	mulss	-0x28(%rbp), %xmm7
14009d8e3:     	addss	%xmm10, %xmm7
14009d8e8:     	movaps	%xmm8, %xmm0
14009d8ec:     	callq	0x145756e31 <.text+0x5755e31>
14009d8f1:     	movaps	%xmm7, %xmm1
14009d8f4:     	mulss	%xmm0, %xmm1
14009d8f8:     	mulss	-0x30(%rbp), %xmm10
14009d8fe:     	movss	-0x2c(%rbp), %xmm2
14009d903:     	addss	%xmm9, %xmm2
14009d908:     	movss	-0x24(%rbp), %xmm3
14009d90d:     	movsd	-0x50(%rbp), %xmm4
14009d912:     	addss	%xmm4, %xmm1
14009d916:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
14009d919:     	movss	-0x40(%rbp), %xmm5
14009d91e:     	unpcklps	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
14009d921:     	movlhps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0]
14009d924:     	movss	0x584db54(%rip), %xmm0  # 0x1458eb480
14009d92c:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
14009d92f:     	shufps	$0x4, %xmm10, %xmm6     # xmm6 = xmm6[0,1],xmm10[0,0]
14009d934:     	mulps	%xmm7, %xmm6
14009d937:     	movddup	%xmm4, %xmm0            # xmm0 = xmm4[0,0]
14009d93b:     	shufps	$0xd4, %xmm4, %xmm9     # xmm9 = xmm9[0,1],xmm4[1,3]
14009d940:     	shufps	$0x42, %xmm4, %xmm9     # xmm9 = xmm9[2,0],xmm4[0,1]
14009d945:     	addps	%xmm6, %xmm9
14009d949:     	subps	%xmm6, %xmm0
14009d94c:     	movsd	%xmm9, %xmm0            # xmm0 = xmm9[0],xmm0[1]
14009d951:     	movl	%ebx, -0x4c(%rbp)
14009d954:     	movl	%r14d, -0x48(%rbp)
14009d958:     	movss	%xmm1, -0x44(%rbp)
14009d95d:     	movupd	%xmm0, -0x40(%rbp)
14009d962:     	movss	%xmm2, -0x30(%rbp)
14009d967:     	movss	%xmm3, -0x2c(%rbp)
14009d96c:     	movl	$0x1, -0x50(%rbp)
14009d973:     	leaq	-0x50(%rbp), %rcx
14009d977:     	callq	0x1406cc3f0 <.text+0x6cb3f0>
14009d97c:     	movq	-0x60(%rbp), %rax
14009d980:     	movzbl	0x72(%rax), %ecx
14009d984:     	callq	0x1406cc240 <.text+0x6cb240>
14009d989:     	cmpb	$0x0, -0x18(%rbp)
14009d98d:     	movq	-0x20(%rbp), %rsi
14009d991:     	je	0x14009d9db <.text+0x9c9db>
14009d993:     	callq	0x1406cc600 <.text+0x6cb600>
14009d998:     	movss	0x58(%rsi), %xmm0
14009d99d:     	testb	%al, %al
14009d99f:     	je	0x14009d9e0 <.text+0x9c9e0>
14009d9a1:     	divss	0x585b397(%rip), %xmm0  # 0x1458f8d40
14009d9a9:     	addss	0x18(%r12), %xmm0
14009d9b0:     	minss	0x584dac8(%rip), %xmm0  # 0x1458eb480
14009d9b8:     	jmp	0x14009d9f6 <.text+0x9c9f6>
14009d9ba:     	movl	$0x0, -0x50(%rbp)
14009d9c1:     	leaq	-0x50(%rbp), %rcx
14009d9c5:     	callq	0x1406cc3f0 <.text+0x6cb3f0>
14009d9ca:     	movq	-0x60(%rbp), %rax
14009d9ce:     	movzbl	0x72(%rax), %ecx
14009d9d2:     	callq	0x1406cc240 <.text+0x6cb240>
14009d9d7:     	movq	-0x20(%rbp), %rsi
14009d9db:     	movss	0x58(%rsi), %xmm0
14009d9e0:     	divss	0x584db08(%rip), %xmm0  # 0x1458eb4f0
14009d9e8:     	addss	0x18(%r12), %xmm0
14009d9ef:     	xorps	%xmm1, %xmm1
14009d9f2:     	maxss	%xmm1, %xmm0
14009d9f6:     	movq	0x40(%rbp), %rax
14009d9fa:     	movl	0x30(%rbp), %ecx
14009d9fd:     	movl	%ecx, (%rax)
14009d9ff:     	movss	%xmm0, 0x18(%r12)
14009da06:     	movaps	%xmm0, %xmm1
14009da09:     	mulss	%xmm0, %xmm1
14009da0d:     	addss	%xmm0, %xmm0
14009da11:     	movss	0x5858c13(%rip), %xmm2  # 0x1458f662c
14009da19:     	subss	%xmm0, %xmm2
14009da1d:     	mulss	%xmm1, %xmm2
14009da21:     	movss	0x584da57(%rip), %xmm6  # 0x1458eb480
14009da29:     	subss	%xmm2, %xmm6
14009da2d:     	cmpb	$0x0, 0x1c(%r12)
14009da33:     	movaps	%xmm6, %xmm7
14009da36:     	jne	0x14009da3b <.text+0x9ca3b>
14009da38:     	xorps	%xmm7, %xmm7
14009da3b:     	movq	0x28(%rbp), %rcx
14009da3f:     	movq	0xf8(%rcx), %rbx
14009da46:     	movq	0x100(%rcx), %rax
14009da4d:     	leaq	(%rbx,%rax,4), %r14
14009da51:     	cmpb	$0x0, 0x108(%rcx)
14009da58:     	je	0x14009db51 <.text+0x9cb51>
14009da5e:     	xorl	%r12d, %r12d
14009da61:     	movsd	0x585b576(%rip), %xmm8  # 0x1458f8fe0
14009da6a:     	movq	$0x0, 0x40(%rbp)
14009da72:     	xorl	%esi, %esi
14009da74:     	jmp	0x14009da86 <.text+0x9ca86>
14009da76:     	nopw	%cs:(%rax,%rax)
14009da80:     	incl	%esi
14009da82:     	movq	0x20(%rbp), %r15
14009da86:     	cmpl	%r12d, %esi
14009da89:     	jne	0x14009daee <.text+0x9caee>
14009da8b:     	nopl	(%rax,%rax)
14009da90:     	cmpq	%r14, %rbx
14009da93:     	je	0x14009dc7e <.text+0x9cc7e>
14009da99:     	movl	(%rbx), %ecx
14009da9b:     	addq	$0x4, %rbx
14009da9f:     	movq	0x1a8(%r13), %rax
14009daa6:     	leaq	(%rcx,%rcx,8), %rcx
14009daaa:     	movq	0x10(%rax,%rcx,8), %r12
14009daaf:     	testq	%r12, %r12
14009dab2:     	je	0x14009da90 <.text+0x9ca90>
14009dab4:     	leaq	(%rax,%rcx,8), %rax
14009dab8:     	movq	0x28(%rbp), %rcx
14009dabc:     	movq	0x110(%rcx), %rcx
14009dac3:     	movq	0x18(%rax), %rdx
14009dac7:     	movq	0x38(%rax), %rax
14009dacb:     	movq	(%rax,%rcx,8), %rax
14009dacf:     	notq	%rax
14009dad2:     	leaq	(%rax,%rax,2), %rax
14009dad6:     	shlq	$0x4, %rax
14009dada:     	movq	0x10(%rdx,%rax), %rcx
14009dadf:     	movq	%rcx, 0x40(%rbp)
14009dae3:     	movq	0x28(%rdx,%rax), %rax
14009dae8:     	movq	%rax, 0x30(%rbp)
14009daec:     	xorl	%esi, %esi
14009daee:     	movl	%esi, %r15d
14009daf1:     	movq	%r15, %rax
14009daf4:     	shlq	$0x7, %rax
14009daf8:     	leaq	(%rax,%r15,8), %rax
14009dafc:     	movsd	%xmm8, 0x4(%rbp)
14009db02:     	movl	$0x3eb851ec, 0xc(%rbp)  # imm = 0x3EB851EC
14009db09:     	movss	%xmm7, 0x10(%rbp)
14009db0e:     	movl	$0x0, (%rbp)
14009db15:     	movq	0x40(%rbp), %rcx
14009db19:     	leaq	(%rcx,%rax), %rdi
14009db1d:     	addq	$0x38, %rdi
14009db21:     	movq	%rdi, %rcx
14009db24:     	movq	%rbp, %rdx
14009db27:     	callq	0x1400afc10 <.text+0xaec10>
14009db2c:     	testb	%al, %al
14009db2e:     	jne	0x14009da80 <.text+0x9ca80>
14009db34:     	movl	-0xc(%rbp), %eax
14009db37:     	movq	0x30(%rbp), %rcx
14009db3b:     	movl	%eax, (%rcx,%r15,4)
14009db3f:     	movl	0x10(%rbp), %eax
14009db42:     	movl	%eax, 0x10(%rdi)
14009db45:     	movups	(%rbp), %xmm0
14009db49:     	movups	%xmm0, (%rdi)
14009db4c:     	jmp	0x14009da80 <.text+0x9ca80>
14009db51:     	xorl	%r12d, %r12d
14009db54:     	movl	$0x8, %eax
14009db59:     	movq	%rax, 0x40(%rbp)
14009db5d:     	movsd	0x585b47a(%rip), %xmm8  # 0x1458f8fe0
14009db66:     	movq	$0x0, 0x30(%rbp)
14009db6e:     	xorl	%esi, %esi
14009db70:     	jmp	0x14009db86 <.text+0x9cb86>
14009db72:     	nopw	%cs:(%rax,%rax)
14009db80:     	incl	%esi
14009db82:     	movq	0x20(%rbp), %r15
14009db86:     	cmpl	%r12d, %esi
14009db89:     	jne	0x14009dc0c <.text+0x9cc0c>
14009db8f:     	nop
14009db90:     	cmpq	%r14, %rbx
14009db93:     	je	0x14009dc7e <.text+0x9cc7e>
14009db99:     	movl	(%rbx), %ecx
14009db9b:     	addq	$0x4, %rbx
14009db9f:     	movq	0x108(%r13), %rax
14009dba6:     	leaq	(%rcx,%rcx,4), %rcx
14009dbaa:     	shlq	$0x5, %rcx
14009dbae:     	movq	0x58(%rax,%rcx), %r12
14009dbb3:     	testq	%r12, %r12
14009dbb6:     	je	0x14009db90 <.text+0x9cb90>
14009dbb8:     	addq	%rcx, %rax
14009dbbb:     	movl	0x94(%rax), %ecx
14009dbc1:     	movq	0x1a8(%r13), %rdx
14009dbc8:     	leaq	(%rcx,%rcx,8), %rcx
14009dbcc:     	movq	0x28(%rbp), %r8
14009dbd0:     	movq	0x110(%r8), %r8
14009dbd7:     	movq	0x18(%rdx,%rcx,8), %r9
14009dbdc:     	movq	0x38(%rdx,%rcx,8), %rcx
14009dbe1:     	movq	(%rcx,%r8,8), %rcx
14009dbe5:     	notq	%rcx
14009dbe8:     	leaq	(%rcx,%rcx,2), %rcx
14009dbec:     	shlq	$0x4, %rcx
14009dbf0:     	movq	0x10(%r9,%rcx), %rdx
14009dbf5:     	movq	%rdx, 0x30(%rbp)
14009dbf9:     	movq	0x28(%r9,%rcx), %rcx
14009dbfe:     	movq	%rcx, -0x20(%rbp)
14009dc02:     	movq	0x50(%rax), %rax
14009dc06:     	movq	%rax, 0x40(%rbp)
14009dc0a:     	xorl	%esi, %esi
14009dc0c:     	movl	%esi, %eax
14009dc0e:     	shlq	$0x4, %rax
14009dc12:     	movq	0x40(%rbp), %rcx
14009dc16:     	movl	0x8(%rcx,%rax), %r15d
14009dc1b:     	notl	%r15d
14009dc1e:     	movq	%r15, %rax
14009dc21:     	shlq	$0x7, %rax
14009dc25:     	leaq	(%rax,%r15,8), %rax
14009dc29:     	movsd	%xmm8, 0x4(%rbp)
14009dc2f:     	movl	$0x3eb851ec, 0xc(%rbp)  # imm = 0x3EB851EC
14009dc36:     	movss	%xmm7, 0x10(%rbp)
14009dc3b:     	movl	$0x0, (%rbp)
14009dc42:     	movq	0x30(%rbp), %rcx
14009dc46:     	leaq	(%rcx,%rax), %rdi
14009dc4a:     	addq	$0x38, %rdi
14009dc4e:     	movq	%rdi, %rcx
14009dc51:     	movq	%rbp, %rdx
14009dc54:     	callq	0x1400afc10 <.text+0xaec10>
14009dc59:     	testb	%al, %al
14009dc5b:     	jne	0x14009db80 <.text+0x9cb80>
14009dc61:     	movl	-0xc(%rbp), %eax
14009dc64:     	movq	-0x20(%rbp), %rcx
14009dc68:     	movl	%eax, (%rcx,%r15,4)
14009dc6c:     	movl	0x10(%rbp), %eax
14009dc6f:     	movl	%eax, 0x10(%rdi)
14009dc72:     	movups	(%rbp), %xmm0
14009dc76:     	movups	%xmm0, (%rdi)
14009dc79:     	jmp	0x14009db80 <.text+0x9cb80>
14009dc7e:     	movq	-0x58(%rbp), %rcx
14009dc82:     	movq	0xf8(%rcx), %rbx
14009dc89:     	movq	0x100(%rcx), %rax
14009dc90:     	leaq	(%rbx,%rax,4), %r14
14009dc94:     	cmpb	$0x0, 0x108(%rcx)
14009dc9b:     	je	0x14009dd7e <.text+0x9cd7e>
14009dca1:     	xorl	%r12d, %r12d
14009dca4:     	movsd	0x585b344(%rip), %xmm7  # 0x1458f8ff0
14009dcac:     	xorl	%esi, %esi
14009dcae:     	xorl	%r13d, %r13d
14009dcb1:     	jmp	0x14009dcc7 <.text+0x9ccc7>
14009dcb3:     	nopw	%cs:(%rax,%rax)
14009dcc0:     	incl	%r13d
14009dcc3:     	movq	0x20(%rbp), %r15
14009dcc7:     	cmpl	%r12d, %r13d
14009dcca:     	jne	0x14009dd2b <.text+0x9cd2b>
14009dccc:     	nopl	(%rax)
14009dcd0:     	cmpq	%r14, %rbx
14009dcd3:     	je	0x14009de8c <.text+0x9ce8c>
14009dcd9:     	movl	(%rbx), %ecx
14009dcdb:     	addq	$0x4, %rbx
14009dcdf:     	movq	0x1a8(%r15), %rax
14009dce6:     	leaq	(%rcx,%rcx,8), %rcx
14009dcea:     	movq	0x10(%rax,%rcx,8), %r12
14009dcef:     	testq	%r12, %r12
14009dcf2:     	je	0x14009dcd0 <.text+0x9ccd0>
14009dcf4:     	leaq	(%rax,%rcx,8), %rax
14009dcf8:     	movq	-0x58(%rbp), %rcx
14009dcfc:     	movq	0x110(%rcx), %rcx
14009dd03:     	movq	0x18(%rax), %rdx
14009dd07:     	movq	0x38(%rax), %rax
14009dd0b:     	movq	(%rax,%rcx,8), %rax
14009dd0f:     	notq	%rax
14009dd12:     	leaq	(%rax,%rax,2), %rax
14009dd16:     	shlq	$0x4, %rax
14009dd1a:     	movq	0x10(%rdx,%rax), %rsi
14009dd1f:     	movq	0x28(%rdx,%rax), %rax
14009dd24:     	movq	%rax, 0x28(%rbp)
14009dd28:     	xorl	%r13d, %r13d
14009dd2b:     	movl	%r13d, %r15d
14009dd2e:     	leaq	(%r15,%r15,4), %rax
14009dd32:     	leaq	(%rsi,%rax,4), %rdi
14009dd36:     	movsd	%xmm7, 0x4(%rbp)
14009dd3b:     	movl	$0x3c449ba6, 0xc(%rbp)  # imm = 0x3C449BA6
14009dd42:     	movss	%xmm6, 0x10(%rbp)
14009dd47:     	movl	$0x0, (%rbp)
14009dd4e:     	movq	%rdi, %rcx
14009dd51:     	movq	%rbp, %rdx
14009dd54:     	callq	0x1400afc10 <.text+0xaec10>
14009dd59:     	testb	%al, %al
14009dd5b:     	jne	0x14009dcc0 <.text+0x9ccc0>
14009dd61:     	movl	-0x10(%rbp), %eax
14009dd64:     	movq	0x28(%rbp), %rcx
14009dd68:     	movl	%eax, (%rcx,%r15,4)
14009dd6c:     	movl	0x10(%rbp), %eax
14009dd6f:     	movl	%eax, 0x10(%rdi)
14009dd72:     	movups	(%rbp), %xmm0
14009dd76:     	movups	%xmm0, (%rdi)
14009dd79:     	jmp	0x14009dcc0 <.text+0x9ccc0>
14009dd7e:     	xorl	%r12d, %r12d
14009dd81:     	movl	$0x8, %eax
14009dd86:     	movq	%rax, 0x28(%rbp)
14009dd8a:     	movsd	0x585b25e(%rip), %xmm7  # 0x1458f8ff0
14009dd92:     	xorl	%esi, %esi
14009dd94:     	xorl	%r13d, %r13d
14009dd97:     	jmp	0x14009dda7 <.text+0x9cda7>
14009dd99:     	nopl	(%rax)
14009dda0:     	incl	%r13d
14009dda3:     	movq	0x20(%rbp), %r15
14009dda7:     	cmpl	%r12d, %r13d
14009ddaa:     	jne	0x14009de29 <.text+0x9ce29>
14009ddac:     	nopl	(%rax)
14009ddb0:     	cmpq	%r14, %rbx
14009ddb3:     	je	0x14009de8c <.text+0x9ce8c>
14009ddb9:     	movl	(%rbx), %ecx
14009ddbb:     	addq	$0x4, %rbx
14009ddbf:     	movq	0x108(%r15), %rax
14009ddc6:     	leaq	(%rcx,%rcx,4), %rcx
14009ddca:     	shlq	$0x5, %rcx
14009ddce:     	movq	0x58(%rax,%rcx), %r12
14009ddd3:     	testq	%r12, %r12
14009ddd6:     	je	0x14009ddb0 <.text+0x9cdb0>
14009ddd8:     	addq	%rcx, %rax
14009dddb:     	movl	0x94(%rax), %ecx
14009dde1:     	movq	0x1a8(%r15), %rdx
14009dde8:     	leaq	(%rcx,%rcx,8), %rcx
14009ddec:     	movq	-0x58(%rbp), %r8
14009ddf0:     	movq	0x110(%r8), %r8
14009ddf7:     	movq	0x18(%rdx,%rcx,8), %r9
14009ddfc:     	movq	0x38(%rdx,%rcx,8), %rcx
14009de01:     	movq	(%rcx,%r8,8), %rcx
14009de05:     	notq	%rcx
14009de08:     	leaq	(%rcx,%rcx,2), %rcx
14009de0c:     	shlq	$0x4, %rcx
14009de10:     	movq	0x10(%r9,%rcx), %rsi
14009de15:     	movq	0x28(%r9,%rcx), %rcx
14009de1a:     	movq	%rcx, 0x40(%rbp)
14009de1e:     	movq	0x50(%rax), %rax
14009de22:     	movq	%rax, 0x28(%rbp)
14009de26:     	xorl	%r13d, %r13d
14009de29:     	movl	%r13d, %eax
14009de2c:     	shlq	$0x4, %rax
14009de30:     	movq	0x28(%rbp), %rcx
14009de34:     	movl	0x8(%rcx,%rax), %r15d
14009de39:     	notl	%r15d
14009de3c:     	leaq	(%r15,%r15,4), %rax
14009de40:     	leaq	(%rsi,%rax,4), %rdi
14009de44:     	movsd	%xmm7, 0x4(%rbp)
14009de49:     	movl	$0x3c449ba6, 0xc(%rbp)  # imm = 0x3C449BA6
14009de50:     	movss	%xmm6, 0x10(%rbp)
14009de55:     	movl	$0x0, (%rbp)
14009de5c:     	movq	%rdi, %rcx
14009de5f:     	movq	%rbp, %rdx
14009de62:     	callq	0x1400afc10 <.text+0xaec10>
14009de67:     	testb	%al, %al
14009de69:     	jne	0x14009dda0 <.text+0x9cda0>
14009de6f:     	movl	-0x10(%rbp), %eax
14009de72:     	movq	0x40(%rbp), %rcx
14009de76:     	movl	%eax, (%rcx,%r15,4)
14009de7a:     	movl	0x10(%rbp), %eax
14009de7d:     	movl	%eax, 0x10(%rdi)
14009de80:     	movups	(%rbp), %xmm0
14009de84:     	movups	%xmm0, (%rdi)
14009de87:     	jmp	0x14009dda0 <.text+0x9cda0>
14009de8c:     	movaps	0x50(%rbp), %xmm6
14009de90:     	movaps	0x60(%rbp), %xmm7
14009de94:     	movaps	0x70(%rbp), %xmm8
14009de99:     	movaps	0x80(%rbp), %xmm9
14009dea1:     	movaps	0x90(%rbp), %xmm10
14009dea9:     	addq	$0x128, %rsp            # imm = 0x128
14009deb0:     	popq	%rbx
14009deb1:     	popq	%rdi
14009deb2:     	popq	%rsi
14009deb3:     	popq	%r12
14009deb5:     	popq	%r13
14009deb7:     	popq	%r14
14009deb9:     	popq	%r15
14009debb:     	popq	%rbp
14009debc:     	retq
