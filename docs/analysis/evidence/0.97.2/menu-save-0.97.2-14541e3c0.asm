
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541e3c0:     	pushq	%rbp
14541e3c1:     	pushq	%r15
14541e3c3:     	pushq	%r14
14541e3c5:     	pushq	%rsi
14541e3c6:     	pushq	%rdi
14541e3c7:     	pushq	%rbx
14541e3c8:     	subq	$0xa8, %rsp
14541e3cf:     	leaq	0x80(%rsp), %rbp
14541e3d7:     	movq	$-0x2, 0x20(%rbp)
14541e3df:     	movq	%rcx, %rsi
14541e3e2:     	leaq	-0x10(%rbp), %rcx
14541e3e6:     	callq	0x145454d30 <.text+0x5453d30>
14541e3eb:     	movq	-0x10(%rbp), %rax
14541e3ef:     	cmpq	$-0x1, %rax
14541e3f3:     	je	0x14541e48d <.text+0x541d48d>
14541e3f9:     	movq	%rax, 0x8(%rbp)
14541e3fd:     	movq	-0x8(%rbp), %rcx
14541e401:     	movq	(%rbp), %rdi
14541e405:     	movq	%rcx, 0x18(%rbp)
14541e409:     	movq	%rdi, %rdx
14541e40c:     	callq	0x140a9db30 <.text+0xa9cb30>
14541e411:     	nop
14541e412:     	cmpq	$0x5, %rdx
14541e416:     	jb	0x14541e435 <.text+0x541d435>
14541e418:     	movl	0x158f776(%rip), %ecx   # 0x1469adb94
14541e41e:     	xorl	(%rax), %ecx
14541e420:     	movzbl	0x158f771(%rip), %edx   # 0x1469adb98
14541e427:     	xorb	0x4(%rax), %dl
14541e42a:     	movzbl	%dl, %eax
14541e42d:     	orl	%ecx, %eax
14541e42f:     	je	0x14541e5f2 <.text+0x541d5f2>
14541e435:     	movq	0x18(%rbp), %rcx
14541e439:     	movq	%rdi, %rdx
14541e43c:     	callq	0x1400e9d30 <.text+0xe8d30>
14541e441:     	nop
14541e442:     	testq	%rdx, %rdx
14541e445:     	je	0x14541e5b7 <.text+0x541d5b7>
14541e44b:     	leaq	0x130257e(%rip), %rdx   # 0x1467209d0
14541e452:     	leaq	-0x10(%rbp), %rcx
14541e456:     	movl	$0x11, %r8d
14541e45c:     	callq	0x145455020 <.text+0x5454020>
14541e461:     	nop
14541e462:     	movq	-0x10(%rbp), %rdx
14541e466:     	cmpq	$-0x1, %rdx
14541e46a:     	je	0x14541e59e <.text+0x541d59e>
14541e470:     	testq	%rdx, %rdx
14541e473:     	je	0x14541e5b7 <.text+0x541d5b7>
14541e479:     	movq	-0x8(%rbp), %rcx
14541e47d:     	movl	$0x1, %r8d
14541e483:     	callq	0x1400021d0 <.text+0x11d0>
14541e488:     	jmp	0x14541e5b7 <.text+0x541d5b7>
14541e48d:     	xorps	%xmm0, %xmm0
14541e490:     	movups	%xmm0, 0x198(%rsi)
14541e497:     	movups	%xmm0, 0x188(%rsi)
14541e49e:     	movups	%xmm0, 0x178(%rsi)
14541e4a5:     	movq	$0x0, 0x1a8(%rsi)
14541e4b0:     	movq	$0x0, (%rsi)
14541e4b7:     	movq	$0x8, 0x8(%rsi)
14541e4bf:     	movups	%xmm0, 0x10(%rsi)
14541e4c3:     	movq	$-0x1, 0x138(%rsi)
14541e4ce:     	movq	$0x8, 0x20(%rsi)
14541e4d6:     	movups	%xmm0, 0x28(%rsi)
14541e4da:     	movq	$0x4, 0x38(%rsi)
14541e4e2:     	movups	%xmm0, 0x40(%rsi)
14541e4e6:     	movq	$0x4, 0x50(%rsi)
14541e4ee:     	movups	%xmm0, 0x58(%rsi)
14541e4f2:     	movq	$0x8, 0x68(%rsi)
14541e4fa:     	movups	%xmm0, 0x70(%rsi)
14541e4fe:     	movq	$0x8, 0x80(%rsi)
14541e509:     	movups	%xmm0, 0x88(%rsi)
14541e510:     	movq	$0x8, 0x98(%rsi)
14541e51b:     	movups	%xmm0, 0xa0(%rsi)
14541e522:     	movq	$0x8, 0xb0(%rsi)
14541e52d:     	movups	%xmm0, 0xb8(%rsi)
14541e534:     	movq	$0x8, 0xc8(%rsi)
14541e53f:     	movups	%xmm0, 0xd0(%rsi)
14541e546:     	movq	$0x8, 0xe0(%rsi)
14541e551:     	movups	%xmm0, 0xe8(%rsi)
14541e558:     	movq	$0x4, 0xf8(%rsi)
14541e563:     	movl	$0x0, 0x1b0(%rsi)
14541e56d:     	movups	%xmm0, 0x100(%rsi)
14541e574:     	movq	$0x8, 0x110(%rsi)
14541e57f:     	movups	%xmm0, 0x118(%rsi)
14541e586:     	movq	$0x1, 0x128(%rsi)
14541e591:     	movq	$0x0, 0x130(%rsi)
14541e59c:     	jmp	0x14541e5df <.text+0x541d5df>
14541e59e:     	leaq	0x130242b(%rip), %rcx   # 0x1467209d0
14541e5a5:     	movl	$0x11, %edx
14541e5aa:     	movq	0x18(%rbp), %r8
14541e5ae:     	movq	%rdi, %r9
14541e5b1:     	callq	0x1454546f0 <.text+0x54536f0>
14541e5b6:     	nop
14541e5b7:     	movq	%rsi, %rcx
14541e5ba:     	movq	0x18(%rbp), %rdx
14541e5be:     	movq	%rdi, %r8
14541e5c1:     	callq	0x14541f1c0 <.text+0x541e1c0>
14541e5c6:     	nop
14541e5c7:     	movq	0x8(%rbp), %rdx
14541e5cb:     	testq	%rdx, %rdx
14541e5ce:     	je	0x14541e5df <.text+0x541d5df>
14541e5d0:     	movl	$0x1, %r8d
14541e5d6:     	movq	0x18(%rbp), %rcx
14541e5da:     	callq	0x1400021d0 <.text+0x11d0>
14541e5df:     	movq	%rsi, %rax
14541e5e2:     	addq	$0xa8, %rsp
14541e5e9:     	popq	%rbx
14541e5ea:     	popq	%rdi
14541e5eb:     	popq	%rsi
14541e5ec:     	popq	%r14
14541e5ee:     	popq	%r15
14541e5f0:     	popq	%rbp
14541e5f1:     	retq
14541e5f2:     	leaq	-0x58(%rbp), %rcx
14541e5f6:     	movq	0x18(%rbp), %rdx
14541e5fa:     	movq	%rdi, %r8
14541e5fd:     	callq	0x145502290 <.text+0x5501290>
14541e602:     	nop
14541e603:     	movq	-0x58(%rbp), %rax
14541e607:     	cmpq	$-0x1, %rax
14541e60b:     	je	0x14541e646 <.text+0x541d646>
14541e60d:     	movq	%rax, 0x10(%rbp)
14541e611:     	movq	-0x50(%rbp), %rdx
14541e615:     	movq	-0x48(%rbp), %r8
14541e619:     	movq	%rsi, %rcx
14541e61c:     	movq	%rdx, -0x18(%rbp)
14541e620:     	callq	0x14541f1c0 <.text+0x541e1c0>
14541e625:     	nop
14541e626:     	movq	0x10(%rbp), %rdx
14541e62a:     	testq	%rdx, %rdx
14541e62d:     	movq	0x8(%rbp), %rdi
14541e631:     	je	0x14541eba1 <.text+0x541dba1>
14541e637:     	movl	$0x1, %r8d
14541e63d:     	movq	-0x18(%rbp), %rcx
14541e641:     	jmp	0x14541eb9c <.text+0x541db9c>
14541e646:     	movl	$0x1, %r8d
14541e64c:     	movq	0x18(%rbp), %rcx
14541e650:     	movq	%rdi, %rdx
14541e653:     	callq	0x14541d190 <.text+0x541c190>
14541e658:     	nop
14541e659:     	testb	$0x1, %al
14541e65b:     	jne	0x14541e977 <.text+0x541d977>
14541e661:     	movl	$0x2, %r8d
14541e667:     	movq	0x18(%rbp), %rcx
14541e66b:     	movq	%rdi, %rdx
14541e66e:     	callq	0x14541d190 <.text+0x541c190>
14541e673:     	nop
14541e674:     	testb	$0x1, %al
14541e676:     	jne	0x14541e977 <.text+0x541d977>
14541e67c:     	movl	$0x3, %r8d
14541e682:     	movq	0x18(%rbp), %rcx
14541e686:     	movq	%rdi, %rdx
14541e689:     	callq	0x14541d190 <.text+0x541c190>
14541e68e:     	nop
14541e68f:     	testb	$0x1, %al
14541e691:     	jne	0x14541e977 <.text+0x541d977>
14541e697:     	movl	$0x4, %r8d
14541e69d:     	movq	0x18(%rbp), %rcx
14541e6a1:     	movq	%rdi, %rdx
14541e6a4:     	callq	0x14541d190 <.text+0x541c190>
14541e6a9:     	nop
14541e6aa:     	testb	$0x1, %al
14541e6ac:     	jne	0x14541e977 <.text+0x541d977>
14541e6b2:     	movl	$0x5, %r8d
14541e6b8:     	movq	0x18(%rbp), %rcx
14541e6bc:     	movq	%rdi, %rdx
14541e6bf:     	callq	0x14541d190 <.text+0x541c190>
14541e6c4:     	nop
14541e6c5:     	testb	$0x1, %al
14541e6c7:     	jne	0x14541e977 <.text+0x541d977>
14541e6cd:     	movl	$0x6, %r8d
14541e6d3:     	movq	0x18(%rbp), %rcx
14541e6d7:     	movq	%rdi, %rdx
14541e6da:     	callq	0x14541d190 <.text+0x541c190>
14541e6df:     	nop
14541e6e0:     	testb	$0x1, %al
14541e6e2:     	jne	0x14541e977 <.text+0x541d977>
14541e6e8:     	movl	$0x7, %r8d
14541e6ee:     	movq	0x18(%rbp), %rcx
14541e6f2:     	movq	%rdi, %rdx
14541e6f5:     	callq	0x14541d190 <.text+0x541c190>
14541e6fa:     	nop
14541e6fb:     	testb	$0x1, %al
14541e6fd:     	jne	0x14541e977 <.text+0x541d977>
14541e703:     	movl	$0x8, %r8d
14541e709:     	movq	0x18(%rbp), %rcx
14541e70d:     	movq	%rdi, %rdx
14541e710:     	callq	0x14541d190 <.text+0x541c190>
14541e715:     	nop
14541e716:     	testb	$0x1, %al
14541e718:     	jne	0x14541e977 <.text+0x541d977>
14541e71e:     	movl	$0x9, %r8d
14541e724:     	movq	0x18(%rbp), %rcx
14541e728:     	movq	%rdi, %rdx
14541e72b:     	callq	0x14541d190 <.text+0x541c190>
14541e730:     	nop
14541e731:     	testb	$0x1, %al
14541e733:     	jne	0x14541e977 <.text+0x541d977>
14541e739:     	movl	$0xa, %r8d
14541e73f:     	movq	0x18(%rbp), %rcx
14541e743:     	movq	%rdi, %rdx
14541e746:     	callq	0x14541d190 <.text+0x541c190>
14541e74b:     	nop
14541e74c:     	testb	$0x1, %al
14541e74e:     	jne	0x14541e977 <.text+0x541d977>
14541e754:     	movl	$0xb, %r8d
14541e75a:     	movq	0x18(%rbp), %rcx
14541e75e:     	movq	%rdi, %rdx
14541e761:     	callq	0x14541d190 <.text+0x541c190>
14541e766:     	nop
14541e767:     	testb	$0x1, %al
14541e769:     	jne	0x14541e977 <.text+0x541d977>
14541e76f:     	movl	$0xc, %r8d
14541e775:     	movq	0x18(%rbp), %rcx
14541e779:     	movq	%rdi, %rdx
14541e77c:     	callq	0x14541d190 <.text+0x541c190>
14541e781:     	nop
14541e782:     	testb	$0x1, %al
14541e784:     	jne	0x14541e977 <.text+0x541d977>
14541e78a:     	movl	$0xd, %r8d
14541e790:     	movq	0x18(%rbp), %rcx
14541e794:     	movq	%rdi, %rdx
14541e797:     	callq	0x14541d190 <.text+0x541c190>
14541e79c:     	nop
14541e79d:     	testb	$0x1, %al
14541e79f:     	jne	0x14541e977 <.text+0x541d977>
14541e7a5:     	movl	$0xe, %r8d
14541e7ab:     	movq	0x18(%rbp), %rcx
14541e7af:     	movq	%rdi, %rdx
14541e7b2:     	callq	0x14541d190 <.text+0x541c190>
14541e7b7:     	nop
14541e7b8:     	testb	$0x1, %al
14541e7ba:     	jne	0x14541e977 <.text+0x541d977>
14541e7c0:     	movl	$0xf, %r8d
14541e7c6:     	movq	0x18(%rbp), %rcx
14541e7ca:     	movq	%rdi, %rdx
14541e7cd:     	callq	0x14541d190 <.text+0x541c190>
14541e7d2:     	nop
14541e7d3:     	testb	$0x1, %al
14541e7d5:     	jne	0x14541e977 <.text+0x541d977>
14541e7db:     	movl	$0x10, %r8d
14541e7e1:     	movq	0x18(%rbp), %rcx
14541e7e5:     	movq	%rdi, %rdx
14541e7e8:     	callq	0x14541d190 <.text+0x541c190>
14541e7ed:     	nop
14541e7ee:     	testb	$0x1, %al
14541e7f0:     	jne	0x14541e977 <.text+0x541d977>
14541e7f6:     	movl	$0x11, %r8d
14541e7fc:     	movq	0x18(%rbp), %rcx
14541e800:     	movq	%rdi, %rdx
14541e803:     	callq	0x14541d190 <.text+0x541c190>
14541e808:     	nop
14541e809:     	testb	$0x1, %al
14541e80b:     	jne	0x14541e977 <.text+0x541d977>
14541e811:     	movl	$0x12, %r8d
14541e817:     	movq	0x18(%rbp), %rcx
14541e81b:     	movq	%rdi, %rdx
14541e81e:     	callq	0x14541d190 <.text+0x541c190>
14541e823:     	nop
14541e824:     	testb	$0x1, %al
14541e826:     	jne	0x14541e977 <.text+0x541d977>
14541e82c:     	movl	$0x13, %r8d
14541e832:     	movq	0x18(%rbp), %rcx
14541e836:     	movq	%rdi, %rdx
14541e839:     	callq	0x14541d190 <.text+0x541c190>
14541e83e:     	nop
14541e83f:     	testb	$0x1, %al
14541e841:     	jne	0x14541e977 <.text+0x541d977>
14541e847:     	movl	$0x14, %r8d
14541e84d:     	movq	0x18(%rbp), %rcx
14541e851:     	movq	%rdi, %rdx
14541e854:     	callq	0x14541d190 <.text+0x541c190>
14541e859:     	nop
14541e85a:     	testb	$0x1, %al
14541e85c:     	jne	0x14541e977 <.text+0x541d977>
14541e862:     	movl	$0x15, %r8d
14541e868:     	movq	0x18(%rbp), %rcx
14541e86c:     	movq	%rdi, %rdx
14541e86f:     	callq	0x14541d190 <.text+0x541c190>
14541e874:     	nop
14541e875:     	testb	$0x1, %al
14541e877:     	jne	0x14541e977 <.text+0x541d977>
14541e87d:     	movl	$0x16, %r8d
14541e883:     	movq	0x18(%rbp), %rcx
14541e887:     	movq	%rdi, %rdx
14541e88a:     	callq	0x14541d190 <.text+0x541c190>
14541e88f:     	nop
14541e890:     	testb	$0x1, %al
14541e892:     	jne	0x14541e977 <.text+0x541d977>
14541e898:     	movl	$0x17, %r8d
14541e89e:     	movq	0x18(%rbp), %rcx
14541e8a2:     	movq	%rdi, %rdx
14541e8a5:     	callq	0x14541d190 <.text+0x541c190>
14541e8aa:     	nop
14541e8ab:     	testb	$0x1, %al
14541e8ad:     	jne	0x14541e977 <.text+0x541d977>
14541e8b3:     	movl	$0x18, %r8d
14541e8b9:     	movq	0x18(%rbp), %rcx
14541e8bd:     	movq	%rdi, %rdx
14541e8c0:     	callq	0x14541d190 <.text+0x541c190>
14541e8c5:     	nop
14541e8c6:     	testb	$0x1, %al
14541e8c8:     	jne	0x14541e977 <.text+0x541d977>
14541e8ce:     	movl	$0x19, %r8d
14541e8d4:     	movq	0x18(%rbp), %rcx
14541e8d8:     	movq	%rdi, %rdx
14541e8db:     	callq	0x14541d190 <.text+0x541c190>
14541e8e0:     	nop
14541e8e1:     	testb	$0x1, %al
14541e8e3:     	jne	0x14541e977 <.text+0x541d977>
14541e8e9:     	movl	$0x1a, %r8d
14541e8ef:     	movq	0x18(%rbp), %rcx
14541e8f3:     	movq	%rdi, %rdx
14541e8f6:     	callq	0x14541d190 <.text+0x541c190>
14541e8fb:     	nop
14541e8fc:     	testb	$0x1, %al
14541e8fe:     	jne	0x14541e977 <.text+0x541d977>
14541e900:     	movl	$0x1b, %r8d
14541e906:     	movq	0x18(%rbp), %rcx
14541e90a:     	movq	%rdi, %rdx
14541e90d:     	callq	0x14541d190 <.text+0x541c190>
14541e912:     	nop
14541e913:     	testb	$0x1, %al
14541e915:     	jne	0x14541e977 <.text+0x541d977>
14541e917:     	movl	$0x1c, %r8d
14541e91d:     	movq	0x18(%rbp), %rcx
14541e921:     	movq	%rdi, %rdx
14541e924:     	callq	0x14541d190 <.text+0x541c190>
14541e929:     	nop
14541e92a:     	testb	$0x1, %al
14541e92c:     	jne	0x14541e977 <.text+0x541d977>
14541e92e:     	movl	$0x1d, %r8d
14541e934:     	movq	0x18(%rbp), %rcx
14541e938:     	movq	%rdi, %rdx
14541e93b:     	callq	0x14541d190 <.text+0x541c190>
14541e940:     	nop
14541e941:     	testb	$0x1, %al
14541e943:     	jne	0x14541e977 <.text+0x541d977>
14541e945:     	movl	$0x1e, %r8d
14541e94b:     	movq	0x18(%rbp), %rcx
14541e94f:     	movq	%rdi, %rdx
14541e952:     	callq	0x14541d190 <.text+0x541c190>
14541e957:     	nop
14541e958:     	testb	$0x1, %al
14541e95a:     	jne	0x14541e977 <.text+0x541d977>
14541e95c:     	movl	$0x1f, %r8d
14541e962:     	movq	0x18(%rbp), %rcx
14541e966:     	movq	%rdi, %rdx
14541e969:     	callq	0x14541d190 <.text+0x541c190>
14541e96e:     	nop
14541e96f:     	testb	$0x1, %al
14541e971:     	je	0x14541ebbc <.text+0x541dbbc>
14541e977:     	movq	%rdx, %rbx
14541e97a:     	movq	%rbx, -0x28(%rbp)
14541e97e:     	leaq	-0x28(%rbp), %r14
14541e982:     	movq	%r14, -0x40(%rbp)
14541e986:     	leaq	0x3005a3(%rip), %r15    # 0x14571ef30 <.text+0x571df30>
14541e98d:     	movq	%r15, -0x38(%rbp)
14541e991:     	leaq	0x1301fc0(%rip), %rdx   # 0x146720958
14541e998:     	leaq	-0x10(%rbp), %rcx
14541e99c:     	leaq	-0x40(%rbp), %r8
14541e9a0:     	callq	0x14570bf80 <.text+0x570af80>
14541e9a5:     	nop
14541e9a6:     	movq	-0x8(%rbp), %rcx
14541e9aa:     	movq	(%rbp), %rdx
14541e9ae:     	movq	%rcx, 0x10(%rbp)
14541e9b2:     	movq	0x18(%rbp), %r8
14541e9b6:     	movq	%rdi, %r9
14541e9b9:     	callq	0x1454546f0 <.text+0x54536f0>
14541e9be:     	nop
14541e9bf:     	movq	-0x10(%rbp), %rdx
14541e9c3:     	testq	%rdx, %rdx
14541e9c6:     	je	0x14541e9d7 <.text+0x541d9d7>
14541e9c8:     	movl	$0x1, %r8d
14541e9ce:     	movq	0x10(%rbp), %rcx
14541e9d2:     	callq	0x1400021d0 <.text+0x11d0>
14541e9d7:     	movq	%rbx, -0x28(%rbp)
14541e9db:     	movq	%r14, -0x10(%rbp)
14541e9df:     	movq	%r15, -0x8(%rbp)
14541e9e3:     	leaq	0x1301f6e(%rip), %rdx   # 0x146720958
14541e9ea:     	leaq	-0x40(%rbp), %rdi
14541e9ee:     	leaq	-0x10(%rbp), %r8
14541e9f2:     	movq	%rdi, %rcx
14541e9f5:     	callq	0x14570bf80 <.text+0x570af80>
14541e9fa:     	nop
14541e9fb:     	movq	%rdi, -0x28(%rbp)
14541e9ff:     	leaq	-0x541c926(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14541ea06:     	movq	%rax, -0x20(%rbp)
14541ea0a:     	leaq	0x1301fd0(%rip), %rdx   # 0x1467209e1
14541ea11:     	leaq	-0x10(%rbp), %rcx
14541ea15:     	leaq	-0x28(%rbp), %rdi
14541ea19:     	movq	%rdi, %r8
14541ea1c:     	callq	0x14570bf80 <.text+0x570af80>
14541ea21:     	nop
14541ea22:     	movq	-0x10(%rbp), %rax
14541ea26:     	movq	%rax, 0x10(%rbp)
14541ea2a:     	movq	-0x8(%rbp), %rcx
14541ea2e:     	movq	(%rbp), %rax
14541ea32:     	movq	%rcx, -0x18(%rbp)
14541ea36:     	movq	%rcx, -0x28(%rbp)
14541ea3a:     	movq	%rax, -0x20(%rbp)
14541ea3e:     	movq	%rdi, -0x10(%rbp)
14541ea42:     	leaq	-0x541c989(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14541ea49:     	movq	%rax, -0x8(%rbp)
14541ea4d:     	leaq	0x1304532(%rip), %rcx   # 0x146722f86
14541ea54:     	leaq	-0x10(%rbp), %rdx
14541ea58:     	callq	0x1456f5b80 <.text+0x56f4b80>
14541ea5d:     	nop
14541ea5e:     	movq	0x10(%rbp), %rdx
14541ea62:     	testq	%rdx, %rdx
14541ea65:     	je	0x14541ea76 <.text+0x541da76>
14541ea67:     	movl	$0x1, %r8d
14541ea6d:     	movq	-0x18(%rbp), %rcx
14541ea71:     	callq	0x1400021d0 <.text+0x11d0>
14541ea76:     	xorps	%xmm0, %xmm0
14541ea79:     	movups	%xmm0, 0x198(%rsi)
14541ea80:     	movups	%xmm0, 0x188(%rsi)
14541ea87:     	movups	%xmm0, 0x178(%rsi)
14541ea8e:     	movq	$0x0, 0x1a8(%rsi)
14541ea99:     	movq	$0x0, (%rsi)
14541eaa0:     	movq	$0x8, 0x8(%rsi)
14541eaa8:     	movups	%xmm0, 0x10(%rsi)
14541eaac:     	movq	$-0x1, 0x138(%rsi)
14541eab7:     	movq	$0x8, 0x20(%rsi)
14541eabf:     	movups	%xmm0, 0x28(%rsi)
14541eac3:     	movq	$0x4, 0x38(%rsi)
14541eacb:     	movups	%xmm0, 0x40(%rsi)
14541eacf:     	movq	$0x4, 0x50(%rsi)
14541ead7:     	movups	%xmm0, 0x58(%rsi)
14541eadb:     	movq	$0x8, 0x68(%rsi)
14541eae3:     	movups	%xmm0, 0x70(%rsi)
14541eae7:     	movq	$0x8, 0x80(%rsi)
14541eaf2:     	movups	%xmm0, 0x88(%rsi)
14541eaf9:     	movq	$0x8, 0x98(%rsi)
14541eb04:     	movups	%xmm0, 0xa0(%rsi)
14541eb0b:     	movq	$0x8, 0xb0(%rsi)
14541eb16:     	movups	%xmm0, 0xb8(%rsi)
14541eb1d:     	movq	$0x8, 0xc8(%rsi)
14541eb28:     	movups	%xmm0, 0xd0(%rsi)
14541eb2f:     	movq	$0x8, 0xe0(%rsi)
14541eb3a:     	movups	%xmm0, 0xe8(%rsi)
14541eb41:     	movq	$0x4, 0xf8(%rsi)
14541eb4c:     	movl	$0x0, 0x1b0(%rsi)
14541eb56:     	movups	%xmm0, 0x100(%rsi)
14541eb5d:     	movq	$0x8, 0x110(%rsi)
14541eb68:     	movups	%xmm0, 0x118(%rsi)
14541eb6f:     	movq	$0x1, 0x128(%rsi)
14541eb7a:     	movq	$0x0, 0x130(%rsi)
14541eb85:     	movq	-0x40(%rbp), %rdx
14541eb89:     	testq	%rdx, %rdx
14541eb8c:     	movq	0x8(%rbp), %rdi
14541eb90:     	je	0x14541eba1 <.text+0x541dba1>
14541eb92:     	movq	-0x38(%rbp), %rcx
14541eb96:     	movl	$0x1, %r8d
14541eb9c:     	callq	0x1400021d0 <.text+0x11d0>
14541eba1:     	testq	%rdi, %rdi
14541eba4:     	je	0x14541e5df <.text+0x541d5df>
14541ebaa:     	movl	$0x1, %r8d
14541ebb0:     	movq	0x18(%rbp), %rcx
14541ebb4:     	movq	%rdi, %rdx
14541ebb7:     	jmp	0x14541e5da <.text+0x541d5da>
14541ebbc:     	movl	$0x20, %ebx
14541ebc1:     	movl	$0x20, %r8d
14541ebc7:     	movq	0x18(%rbp), %rcx
14541ebcb:     	movq	%rdi, %rdx
14541ebce:     	callq	0x14541d190 <.text+0x541c190>
14541ebd3:     	nop
14541ebd4:     	testb	$0x1, %al
14541ebd6:     	cmovneq	%rdx, %rbx
14541ebda:     	jmp	0x14541e97a <.text+0x541d97a>
