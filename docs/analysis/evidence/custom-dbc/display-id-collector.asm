AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bc2e0:     	pushq	%rbp
1458bc2e1:     	pushq	%r15
1458bc2e3:     	pushq	%r14
1458bc2e5:     	pushq	%r13
1458bc2e7:     	pushq	%r12
1458bc2e9:     	pushq	%rsi
1458bc2ea:     	pushq	%rdi
1458bc2eb:     	pushq	%rbx
1458bc2ec:     	subq	$0xa8, %rsp
1458bc2f3:     	leaq	0x80(%rsp), %rbp
1458bc2fb:     	movq	$-0x2, 0x20(%rbp)
1458bc303:     	movq	%rcx, -0x10(%rbp)
1458bc307:     	movq	$0x0, 0x8(%rbp)
1458bc30f:     	movq	$0x4, 0x10(%rbp)
1458bc317:     	movq	$0x0, 0x18(%rbp)
1458bc31f:     	xorl	%ebx, %ebx
1458bc321:     	leaq	0x8(%rbp), %rdi
1458bc325:     	xorl	%ecx, %ecx
1458bc327:     	jmp	0x1458bc334 <.text+0x58bb334>
1458bc329:     	nopl	(%rax)
1458bc330:     	movq	-0x8(%rbp), %rcx
1458bc334:     	cmpq	$0xab0, %rcx            # imm = 0xAB0
1458bc33b:     	je	0x1458bc465 <.text+0x58bb465>
1458bc341:     	leaq	0x1300de0(%rip), %rax   # 0x146bbd128
1458bc348:     	leaq	(%rax,%rcx), %rsi
1458bc34c:     	addq	$0x130, %rcx            # imm = 0x130
1458bc353:     	movq	%rcx, -0x8(%rbp)
1458bc357:     	movl	$0x88, %r13d
1458bc35d:     	nopl	(%rax)
1458bc360:     	cmpq	$0x128, %r13            # imm = 0x128
1458bc367:     	je	0x1458bc3d0 <.text+0x58bb3d0>
1458bc369:     	leaq	(%rsi,%r13), %r12
1458bc36d:     	leaq	(%rsi,%r13), %r14
1458bc371:     	addq	$0x20, %r14
1458bc375:     	addq	$0x20, %r13
1458bc379:     	nopl	(%rax)
1458bc380:     	cmpq	%r14, %r12
1458bc383:     	je	0x1458bc360 <.text+0x58bb360>
1458bc385:     	movl	(%r12), %r15d
1458bc389:     	addq	$0x4, %r12
1458bc38d:     	testl	%r15d, %r15d
1458bc390:     	je	0x1458bc380 <.text+0x58bb380>
1458bc392:     	cmpq	0x8(%rbp), %rbx
1458bc396:     	jne	0x1458bc3b9 <.text+0x58bb3b9>
1458bc398:     	movq	$0x4, 0x20(%rsp)
1458bc3a1:     	movl	$0x1, %r8d
1458bc3a7:     	movl	$0x4, %r9d
1458bc3ad:     	movq	%rdi, %rcx
1458bc3b0:     	movq	%rbx, %rdx
1458bc3b3:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc3b8:     	nop
1458bc3b9:     	movq	0x10(%rbp), %rax
1458bc3bd:     	movl	%r15d, (%rax,%rbx,4)
1458bc3c1:     	incq	%rbx
1458bc3c4:     	movq	%rbx, 0x18(%rbp)
1458bc3c8:     	jmp	0x1458bc380 <.text+0x58bb380>
1458bc3ca:     	nopw	(%rax,%rax)
1458bc3d0:     	movq	0x78(%rsi), %r12
1458bc3d4:     	movq	0x80(%rsi), %rax
1458bc3db:     	leaq	(%rax,%rax,8), %rsi
1458bc3df:     	shlq	$0x4, %rsi
1458bc3e3:     	addq	%r12, %rsi
1458bc3e6:     	cmpq	%rsi, %r12
1458bc3e9:     	je	0x1458bc330 <.text+0x58bb330>
1458bc3ef:     	nop
1458bc3f0:     	movl	0x88(%r12), %eax
1458bc3f8:     	movl	%eax, -0x30(%rbp)
1458bc3fb:     	movups	0x78(%r12), %xmm0
1458bc401:     	movaps	%xmm0, -0x40(%rbp)
1458bc405:     	movq	0x8(%rbp), %rax
1458bc409:     	subq	%rbx, %rax
1458bc40c:     	cmpq	$0x4, %rax
1458bc410:     	jbe	0x1458bc43e <.text+0x58bb43e>
1458bc412:     	movq	0x10(%rbp), %rax
1458bc416:     	movl	-0x30(%rbp), %ecx
1458bc419:     	movl	%ecx, 0x10(%rax,%rbx,4)
1458bc41d:     	movaps	-0x40(%rbp), %xmm0
1458bc421:     	movups	%xmm0, (%rax,%rbx,4)
1458bc425:     	addq	$0x5, %rbx
1458bc429:     	movq	%rbx, 0x18(%rbp)
1458bc42d:     	addq	$0x90, %r12
1458bc434:     	cmpq	%rsi, %r12
1458bc437:     	jne	0x1458bc3f0 <.text+0x58bb3f0>
1458bc439:     	jmp	0x1458bc330 <.text+0x58bb330>
1458bc43e:     	movq	$0x4, 0x20(%rsp)
1458bc447:     	movl	$0x5, %r8d
1458bc44d:     	movl	$0x4, %r9d
1458bc453:     	movq	%rdi, %rcx
1458bc456:     	movq	%rbx, %rdx
1458bc459:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc45e:     	nop
1458bc45f:     	movq	0x18(%rbp), %rbx
1458bc463:     	jmp	0x1458bc412 <.text+0x58bb412>
1458bc465:     	movq	$0x0, -0x8(%rbp)
1458bc46d:     	leaq	0x8(%rbp), %rdi
1458bc471:     	nopw	%cs:(%rax,%rax)
1458bc480:     	movq	-0x8(%rbp), %rax
1458bc484:     	cmpq	$0x438, %rax            # imm = 0x438
1458bc48a:     	je	0x1458bc5a5 <.text+0x58bb5a5>
1458bc490:     	leaq	0x1301c01(%rip), %rcx   # 0x146bbe098
1458bc497:     	leaq	(%rcx,%rax), %r12
1458bc49b:     	addq	$0x78, %rax
1458bc49f:     	movq	%rax, -0x8(%rbp)
1458bc4a3:     	movl	$0x30, %esi
1458bc4a8:     	nopl	(%rax,%rax)
1458bc4b0:     	cmpq	$0x70, %rsi
1458bc4b4:     	je	0x1458bc520 <.text+0x58bb520>
1458bc4b6:     	leaq	(%r12,%rsi), %rbx
1458bc4ba:     	leaq	(%r12,%rsi), %r14
1458bc4be:     	addq	$0x20, %r14
1458bc4c2:     	addq	$0x20, %rsi
1458bc4c6:     	jmp	0x1458bc4df <.text+0x58bb4df>
1458bc4c8:     	nopl	(%rax,%rax)
1458bc4d0:     	movq	0x10(%rbp), %rax
1458bc4d4:     	movl	%r13d, (%rax,%r15,4)
1458bc4d8:     	incq	%r15
1458bc4db:     	movq	%r15, 0x18(%rbp)
1458bc4df:     	cmpq	%r14, %rbx
1458bc4e2:     	je	0x1458bc4b0 <.text+0x58bb4b0>
1458bc4e4:     	movl	(%rbx), %r13d
1458bc4e7:     	addq	$0x4, %rbx
1458bc4eb:     	testl	%r13d, %r13d
1458bc4ee:     	je	0x1458bc4df <.text+0x58bb4df>
1458bc4f0:     	movq	0x18(%rbp), %r15
1458bc4f4:     	cmpq	0x8(%rbp), %r15
1458bc4f8:     	jne	0x1458bc4d0 <.text+0x58bb4d0>
1458bc4fa:     	movq	$0x4, 0x20(%rsp)
1458bc503:     	movl	$0x1, %r8d
1458bc509:     	movl	$0x4, %r9d
1458bc50f:     	movq	%rdi, %rcx
1458bc512:     	movq	%r15, %rdx
1458bc515:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc51a:     	nop
1458bc51b:     	jmp	0x1458bc4d0 <.text+0x58bb4d0>
1458bc51d:     	nopl	(%rax)
1458bc520:     	movq	0x20(%r12), %rax
1458bc525:     	movq	0x28(%r12), %r8
1458bc52a:     	leaq	(%r8,%r8,2), %rcx
1458bc52e:     	shlq	$0x4, %rcx
1458bc532:     	addq	%rax, %rcx
1458bc535:     	movq	%rax, -0x40(%rbp)
1458bc539:     	movq	%rcx, -0x38(%rbp)
1458bc53d:     	movq	$0x0, -0x30(%rbp)
1458bc545:     	movq	$0x0, -0x20(%rbp)
1458bc54d:     	addq	%r8, %r8
1458bc550:     	movq	0x8(%rbp), %rax
1458bc554:     	movq	0x18(%rbp), %rdx
1458bc558:     	subq	%rdx, %rax
1458bc55b:     	cmpq	%rax, %r8
1458bc55e:     	ja	0x1458bc587 <.text+0x58bb587>
1458bc560:     	movq	0x10(%rbp), %rax
1458bc564:     	movq	%rax, -0x48(%rbp)
1458bc568:     	leaq	0x18(%rbp), %rax
1458bc56c:     	movq	%rax, -0x58(%rbp)
1458bc570:     	movq	%rdx, -0x50(%rbp)
1458bc574:     	leaq	-0x40(%rbp), %rcx
1458bc578:     	leaq	-0x58(%rbp), %rdx
1458bc57c:     	callq	0x1459b0ea0 <.text+0x59afea0>
1458bc581:     	nop
1458bc582:     	jmp	0x1458bc480 <.text+0x58bb480>
1458bc587:     	movq	$0x4, 0x20(%rsp)
1458bc590:     	movl	$0x4, %r9d
1458bc596:     	movq	%rdi, %rcx
1458bc599:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc59e:     	nop
1458bc59f:     	movq	0x18(%rbp), %rdx
1458bc5a3:     	jmp	0x1458bc560 <.text+0x58bb560>
1458bc5a5:     	movq	0x8(%rbp), %rax
1458bc5a9:     	movq	0x18(%rbp), %rdx
1458bc5ad:     	subq	%rdx, %rax
1458bc5b0:     	cmpq	$0x41, %rax
1458bc5b4:     	jbe	0x1458bc811 <.text+0x58bb811>
1458bc5ba:     	movq	0x10(%rbp), %rax
1458bc5be:     	leaq	(%rax,%rdx,4), %rcx
1458bc5c2:     	leaq	(%rax,%rdx,4), %r8
1458bc5c6:     	addq	$0x108, %r8             # imm = 0x108
1458bc5cd:     	leaq	0x12fe95c(%rip), %r9    # 0x146bbaf30
1458bc5d4:     	cmpq	%r9, %rcx
1458bc5d7:     	setae	%r9b
1458bc5db:     	leaq	0x12fdf22(%rip), %rcx   # 0x146bba504
1458bc5e2:     	cmpq	%rcx, %r8
1458bc5e5:     	setbe	%cl
1458bc5e8:     	orb	%r9b, %cl
1458bc5eb:     	cmpb	$0x1, %cl
1458bc5ee:     	jne	0x1458bc6d7 <.text+0x58bb6d7>
1458bc5f4:     	movaps	0x12fcc05(%rip), %xmm0  # 0x146bb9200
1458bc5fb:     	movups	%xmm0, (%rax,%rdx,4)
1458bc5ff:     	movaps	0x12fcc0a(%rip), %xmm0  # 0x146bb9210
1458bc606:     	movups	%xmm0, 0x10(%rax,%rdx,4)
1458bc60b:     	movaps	0x12fcc0e(%rip), %xmm0  # 0x146bb9220
1458bc612:     	movups	%xmm0, 0x20(%rax,%rdx,4)
1458bc617:     	movaps	0x12fcc12(%rip), %xmm0  # 0x146bb9230
1458bc61e:     	movups	%xmm0, 0x30(%rax,%rdx,4)
1458bc623:     	movaps	0x12fcc16(%rip), %xmm0  # 0x146bb9240
1458bc62a:     	movups	%xmm0, 0x40(%rax,%rdx,4)
1458bc62f:     	movaps	0x12fcc1a(%rip), %xmm0  # 0x146bb9250
1458bc636:     	movups	%xmm0, 0x50(%rax,%rdx,4)
1458bc63b:     	movaps	0x12fcc1e(%rip), %xmm0  # 0x146bb9260
1458bc642:     	movups	%xmm0, 0x60(%rax,%rdx,4)
1458bc647:     	movaps	0x12fcc22(%rip), %xmm0  # 0x146bb9270
1458bc64e:     	movups	%xmm0, 0x70(%rax,%rdx,4)
1458bc653:     	movaps	0x12fcc26(%rip), %xmm0  # 0x146bb9280
1458bc65a:     	movups	%xmm0, 0x80(%rax,%rdx,4)
1458bc662:     	movaps	0x12fcc27(%rip), %xmm0  # 0x146bb9290
1458bc669:     	movups	%xmm0, 0x90(%rax,%rdx,4)
1458bc671:     	movaps	0x12fcc28(%rip), %xmm0  # 0x146bb92a0
1458bc678:     	movups	%xmm0, 0xa0(%rax,%rdx,4)
1458bc680:     	movaps	0x12fcc29(%rip), %xmm0  # 0x146bb92b0
1458bc687:     	movups	%xmm0, 0xb0(%rax,%rdx,4)
1458bc68f:     	movaps	0x12fcc2a(%rip), %xmm0  # 0x146bb92c0
1458bc696:     	movups	%xmm0, 0xc0(%rax,%rdx,4)
1458bc69e:     	movaps	0x12fcc2b(%rip), %xmm0  # 0x146bb92d0
1458bc6a5:     	movups	%xmm0, 0xd0(%rax,%rdx,4)
1458bc6ad:     	movaps	0x12fcc2c(%rip), %xmm0  # 0x146bb92e0
1458bc6b4:     	movups	%xmm0, 0xe0(%rax,%rdx,4)
1458bc6bc:     	movaps	0x12fcc2d(%rip), %xmm0  # 0x146bb92f0
1458bc6c3:     	movups	%xmm0, 0xf0(%rax,%rdx,4)
1458bc6cb:     	addq	$0x40, %rdx
1458bc6cf:     	movl	$0x40, %r10d
1458bc6d5:     	jmp	0x1458bc6da <.text+0x58bb6da>
1458bc6d7:     	xorl	%r10d, %r10d
1458bc6da:     	leaq	(,%rdx,4), %r11
1458bc6e2:     	leaq	(%r10,%r10,4), %r8
1458bc6e6:     	leaq	0x12fde03(%rip), %r9    # 0x146bba4f0
1458bc6ed:     	leaq	(%r9,%r8,8), %r8
1458bc6f1:     	addq	$0x8c, %r8
1458bc6f8:     	leaq	(%rax,%rdx,4), %rbx
1458bc6fc:     	movq	$-0xc, %rdi
1458bc703:     	xorl	%esi, %esi
1458bc705:     	movq	%rdx, %r9
1458bc708:     	nopl	(%rax,%rax)
1458bc710:     	movl	-0x78(%r8), %r14d
1458bc714:     	movl	%r14d, (%rbx,%rsi,4)
1458bc718:     	incq	%r9
1458bc71b:     	incq	%rsi
1458bc71e:     	addq	$0x28, %r8
1458bc722:     	addq	$-0x4, %rdi
1458bc726:     	cmpq	$0x2, %rsi
1458bc72a:     	jne	0x1458bc710 <.text+0x58bb710>
1458bc72c:     	testb	%cl, %cl
1458bc72e:     	je	0x1458bc735 <.text+0x58bb735>
1458bc730:     	addq	%rsi, %rdx
1458bc733:     	jmp	0x1458bc788 <.text+0x58bb788>
1458bc735:     	addq	%r11, %rax
1458bc738:     	subq	%rdi, %rax
1458bc73b:     	leaq	(%r10,%rsi), %rdx
1458bc73f:     	addq	$-0x42, %rdx
1458bc743:     	xorl	%ecx, %ecx
1458bc745:     	nopw	%cs:(%rax,%rax)
1458bc750:     	movl	-0x78(%r8), %r10d
1458bc754:     	movl	-0x50(%r8), %r11d
1458bc758:     	movl	%r10d, -0xc(%rax)
1458bc75c:     	movl	%r11d, -0x8(%rax)
1458bc760:     	movl	-0x28(%r8), %r10d
1458bc764:     	movl	%r10d, -0x4(%rax)
1458bc768:     	movl	(%r8), %r10d
1458bc76b:     	movl	%r10d, (%rax)
1458bc76e:     	addq	$0x10, %rax
1458bc772:     	addq	$-0x4, %rcx
1458bc776:     	addq	$0xa0, %r8
1458bc77d:     	cmpq	%rcx, %rdx
1458bc780:     	jne	0x1458bc750 <.text+0x58bb750>
1458bc782:     	subq	%rcx, %r9
1458bc785:     	movq	%r9, %rdx
1458bc788:     	movq	%rdx, 0x18(%rbp)
1458bc78c:     	movq	0x8(%rbp), %rax
1458bc790:     	subq	%rdx, %rax
1458bc793:     	cmpq	$0x13, %rax
1458bc797:     	jbe	0x1458bc839 <.text+0x58bb839>
1458bc79d:     	movq	0x10(%rbp), %rax
1458bc7a1:     	movaps	0x12fcb58(%rip), %xmm0  # 0x146bb9300
1458bc7a8:     	movups	%xmm0, (%rax,%rdx,4)
1458bc7ac:     	movaps	0x12fcb5d(%rip), %xmm0  # 0x146bb9310
1458bc7b3:     	movups	%xmm0, 0x10(%rax,%rdx,4)
1458bc7b8:     	movaps	0x12fcb61(%rip), %xmm0  # 0x146bb9320
1458bc7bf:     	movups	%xmm0, 0x20(%rax,%rdx,4)
1458bc7c4:     	movaps	0x12fcb65(%rip), %xmm0  # 0x146bb9330
1458bc7cb:     	movups	%xmm0, 0x30(%rax,%rdx,4)
1458bc7d0:     	movaps	0x12fcb69(%rip), %xmm0  # 0x146bb9340
1458bc7d7:     	movups	%xmm0, 0x40(%rax,%rdx,4)
1458bc7dc:     	addq	$0x14, %rdx
1458bc7e0:     	movq	%rdx, 0x18(%rbp)
1458bc7e4:     	cmpq	$0x2, %rdx
1458bc7e8:     	jae	0x1458bc861 <.text+0x58bb861>
1458bc7ea:     	movq	0x18(%rbp), %rcx
1458bc7ee:     	movq	-0x10(%rbp), %rax
1458bc7f2:     	movq	%rcx, 0x10(%rax)
1458bc7f6:     	movups	0x8(%rbp), %xmm0
1458bc7fa:     	movups	%xmm0, (%rax)
1458bc7fd:     	addq	$0xa8, %rsp
1458bc804:     	popq	%rbx
1458bc805:     	popq	%rdi
1458bc806:     	popq	%rsi
1458bc807:     	popq	%r12
1458bc809:     	popq	%r13
1458bc80b:     	popq	%r14
1458bc80d:     	popq	%r15
1458bc80f:     	popq	%rbp
1458bc810:     	retq
1458bc811:     	movq	$0x4, 0x20(%rsp)
1458bc81a:     	leaq	0x8(%rbp), %rcx
1458bc81e:     	movl	$0x42, %r8d
1458bc824:     	movl	$0x4, %r9d
1458bc82a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc82f:     	nop
1458bc830:     	movq	0x18(%rbp), %rdx
1458bc834:     	jmp	0x1458bc5ba <.text+0x58bb5ba>
1458bc839:     	movq	$0x4, 0x20(%rsp)
1458bc842:     	leaq	0x8(%rbp), %rcx
1458bc846:     	movl	$0x14, %r8d
1458bc84c:     	movl	$0x4, %r9d
1458bc852:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458bc857:     	nop
1458bc858:     	movq	0x18(%rbp), %rdx
1458bc85c:     	jmp	0x1458bc79d <.text+0x58bb79d>
1458bc861:     	movq	0x10(%rbp), %rcx
1458bc865:     	cmpq	$0x15, %rdx
1458bc869:     	jae	0x1458bc8ba <.text+0x58bb8ba>
1458bc86b:     	leaq	(%rcx,%rdx,4), %rax
1458bc86f:     	leaq	0x4(%rcx), %rdx
1458bc873:     	movl	$0x4, %r8d
1458bc879:     	jmp	0x1458bc88e <.text+0x58bb88e>
1458bc87b:     	movq	%rcx, %r10
1458bc87e:     	movl	%r9d, (%r10)
1458bc881:     	addq	$0x4, %rdx
1458bc885:     	addq	$0x4, %r8
1458bc889:     	cmpq	%rax, %rdx
1458bc88c:     	je	0x1458bc8c4 <.text+0x58bb8c4>
1458bc88e:     	movl	-0x4(%rdx), %r11d
1458bc892:     	movl	(%rdx), %r9d
1458bc895:     	cmpl	%r11d, %r9d
1458bc898:     	jae	0x1458bc881 <.text+0x58bb881>
1458bc89a:     	movq	%r8, %r10
1458bc89d:     	movl	%r11d, (%rcx,%r10)
1458bc8a1:     	cmpq	$0x4, %r10
1458bc8a5:     	je	0x1458bc87b <.text+0x58bb87b>
1458bc8a7:     	movl	-0x8(%rcx,%r10), %r11d
1458bc8ac:     	addq	$-0x4, %r10
1458bc8b0:     	cmpl	%r11d, %r9d
1458bc8b3:     	jb	0x1458bc89d <.text+0x58bb89d>
1458bc8b5:     	addq	%rcx, %r10
1458bc8b8:     	jmp	0x1458bc87e <.text+0x58bb87e>
1458bc8ba:     	leaq	0x7(%rbp), %r8
1458bc8be:     	callq	0x145ae9780 <.text+0x5ae8780>
1458bc8c3:     	nop
1458bc8c4:     	movq	0x18(%rbp), %rax
1458bc8c8:     	cmpq	$0x2, %rax
1458bc8cc:     	jb	0x1458bc7ea <.text+0x58bb7ea>
1458bc8d2:     	movq	0x10(%rbp), %rcx
1458bc8d6:     	leaq	-0x1(%rax), %rdx
1458bc8da:     	xorl	%r9d, %r9d
1458bc8dd:     	movl	0x4(%rcx,%r9,4), %r8d
1458bc8e2:     	cmpl	(%rcx,%r9,4), %r8d
1458bc8e6:     	je	0x1458bc8f5 <.text+0x58bb8f5>
1458bc8e8:     	incq	%r9
1458bc8eb:     	cmpq	%r9, %rdx
1458bc8ee:     	jne	0x1458bc8dd <.text+0x58bb8dd>
1458bc8f0:     	jmp	0x1458bc7ea <.text+0x58bb7ea>
1458bc8f5:     	leaq	0x2(%r9), %r8
1458bc8f9:     	leaq	0x1(%r9), %rdx
1458bc8fd:     	cmpq	%rax, %r8
1458bc900:     	jae	0x1458bc92f <.text+0x58bb92f>
1458bc902:     	movl	%eax, %r11d
1458bc905:     	subl	%r9d, %r11d
1458bc908:     	leaq	-0x3(%rax), %r10
1458bc90c:     	testb	$0x1, %r11b
1458bc910:     	je	0x1458bc92a <.text+0x58bb92a>
1458bc912:     	movl	0x8(%rcx,%r9,4), %r8d
1458bc917:     	cmpl	(%rcx,%r9,4), %r8d
1458bc91b:     	je	0x1458bc926 <.text+0x58bb926>
1458bc91d:     	movl	%r8d, 0x4(%rcx,%r9,4)
1458bc922:     	leaq	0x2(%r9), %rdx
1458bc926:     	leaq	0x3(%r9), %r8
1458bc92a:     	cmpq	%r9, %r10
1458bc92d:     	jne	0x1458bc941 <.text+0x58bb941>
1458bc92f:     	movq	%rdx, 0x18(%rbp)
1458bc933:     	jmp	0x1458bc7ea <.text+0x58bb7ea>
1458bc938:     	addq	$0x2, %r8
1458bc93c:     	cmpq	%r8, %rax
1458bc93f:     	je	0x1458bc92f <.text+0x58bb92f>
1458bc941:     	movl	(%rcx,%r8,4), %r9d
1458bc945:     	cmpl	-0x4(%rcx,%rdx,4), %r9d
1458bc94a:     	jne	0x1458bc95a <.text+0x58bb95a>
1458bc94c:     	movl	0x4(%rcx,%r8,4), %r9d
1458bc951:     	cmpl	-0x4(%rcx,%rdx,4), %r9d
1458bc956:     	je	0x1458bc938 <.text+0x58bb938>
1458bc958:     	jmp	0x1458bc96d <.text+0x58bb96d>
1458bc95a:     	movl	%r9d, (%rcx,%rdx,4)
1458bc95e:     	incq	%rdx
1458bc961:     	movl	0x4(%rcx,%r8,4), %r9d
1458bc966:     	cmpl	-0x4(%rcx,%rdx,4), %r9d
1458bc96b:     	je	0x1458bc938 <.text+0x58bb938>
1458bc96d:     	movl	%r9d, (%rcx,%rdx,4)
1458bc971:     	incq	%rdx
1458bc974:     	jmp	0x1458bc938 <.text+0x58bb938>
