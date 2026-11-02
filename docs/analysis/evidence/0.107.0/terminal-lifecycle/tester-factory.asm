Disassembly of section .text:

0000000140001000 <.text>:
1458aa470:     	pushq	%rbp
1458aa471:     	pushq	%r15
1458aa473:     	pushq	%r14
1458aa475:     	pushq	%r13
1458aa477:     	pushq	%r12
1458aa479:     	pushq	%rsi
1458aa47a:     	pushq	%rdi
1458aa47b:     	pushq	%rbx
1458aa47c:     	subq	$0x88, %rsp
1458aa483:     	leaq	0x80(%rsp), %rbp
1458aa48b:     	movq	$-0x2, (%rbp)
1458aa493:     	movq	%r9, %rdi
1458aa496:     	movq	%rcx, -0x30(%rbp)
1458aa49a:     	movb	$0x1, %al
1458aa49c:     	cmpq	$0xf, %r8
1458aa4a0:     	ja	0x1458ab115 <.text+0x58aa115>
1458aa4a6:     	cmpq	$0x7, %r8
1458aa4aa:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa4b0:     	movzbl	0x132e159(%rip), %ecx   # 0x146bd8610
1458aa4b7:     	leal	-0x41(%rcx), %r9d
1458aa4bb:     	cmpb	$0x1a, %r9b
1458aa4bf:     	setb	%r9b
1458aa4c3:     	shlb	$0x5, %r9b
1458aa4c7:     	orb	%cl, %r9b
1458aa4ca:     	movzbl	(%rdx), %ecx
1458aa4cd:     	leal	-0x41(%rcx), %r10d
1458aa4d1:     	cmpb	$0x1a, %r10b
1458aa4d5:     	setb	%r10b
1458aa4d9:     	shlb	$0x5, %r10b
1458aa4dd:     	orb	%cl, %r10b
1458aa4e0:     	cmpb	%r10b, %r9b
1458aa4e3:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa4e9:     	movzbl	0x132e121(%rip), %ecx   # 0x146bd8611
1458aa4f0:     	leal	-0x41(%rcx), %r9d
1458aa4f4:     	cmpb	$0x1a, %r9b
1458aa4f8:     	setb	%r9b
1458aa4fc:     	shlb	$0x5, %r9b
1458aa500:     	orb	%cl, %r9b
1458aa503:     	movzbl	0x1(%rdx), %ecx
1458aa507:     	leal	-0x41(%rcx), %r10d
1458aa50b:     	cmpb	$0x1a, %r10b
1458aa50f:     	setb	%r10b
1458aa513:     	shlb	$0x5, %r10b
1458aa517:     	orb	%cl, %r10b
1458aa51a:     	cmpb	%r10b, %r9b
1458aa51d:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa523:     	movzbl	0x132e0e8(%rip), %ecx   # 0x146bd8612
1458aa52a:     	leal	-0x41(%rcx), %r9d
1458aa52e:     	cmpb	$0x1a, %r9b
1458aa532:     	setb	%r9b
1458aa536:     	shlb	$0x5, %r9b
1458aa53a:     	orb	%cl, %r9b
1458aa53d:     	movzbl	0x2(%rdx), %ecx
1458aa541:     	leal	-0x41(%rcx), %r10d
1458aa545:     	cmpb	$0x1a, %r10b
1458aa549:     	setb	%r10b
1458aa54d:     	shlb	$0x5, %r10b
1458aa551:     	orb	%cl, %r10b
1458aa554:     	cmpb	%r10b, %r9b
1458aa557:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa55d:     	movzbl	0x132e0af(%rip), %ecx   # 0x146bd8613
1458aa564:     	leal	-0x41(%rcx), %r9d
1458aa568:     	cmpb	$0x1a, %r9b
1458aa56c:     	setb	%r9b
1458aa570:     	shlb	$0x5, %r9b
1458aa574:     	orb	%cl, %r9b
1458aa577:     	movzbl	0x3(%rdx), %ecx
1458aa57b:     	leal	-0x41(%rcx), %r10d
1458aa57f:     	cmpb	$0x1a, %r10b
1458aa583:     	setb	%r10b
1458aa587:     	shlb	$0x5, %r10b
1458aa58b:     	orb	%cl, %r10b
1458aa58e:     	cmpb	%r10b, %r9b
1458aa591:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa597:     	movzbl	0x132e076(%rip), %ecx   # 0x146bd8614
1458aa59e:     	leal	-0x41(%rcx), %r9d
1458aa5a2:     	cmpb	$0x1a, %r9b
1458aa5a6:     	setb	%r9b
1458aa5aa:     	shlb	$0x5, %r9b
1458aa5ae:     	orb	%cl, %r9b
1458aa5b1:     	movzbl	0x4(%rdx), %ecx
1458aa5b5:     	leal	-0x41(%rcx), %r10d
1458aa5b9:     	cmpb	$0x1a, %r10b
1458aa5bd:     	setb	%r10b
1458aa5c1:     	shlb	$0x5, %r10b
1458aa5c5:     	orb	%cl, %r10b
1458aa5c8:     	cmpb	%r10b, %r9b
1458aa5cb:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa5cd:     	movzbl	0x132e041(%rip), %ecx   # 0x146bd8615
1458aa5d4:     	leal	-0x41(%rcx), %r9d
1458aa5d8:     	cmpb	$0x1a, %r9b
1458aa5dc:     	setb	%r9b
1458aa5e0:     	shlb	$0x5, %r9b
1458aa5e4:     	orb	%cl, %r9b
1458aa5e7:     	movzbl	0x5(%rdx), %ecx
1458aa5eb:     	leal	-0x41(%rcx), %r10d
1458aa5ef:     	cmpb	$0x1a, %r10b
1458aa5f3:     	setb	%r10b
1458aa5f7:     	shlb	$0x5, %r10b
1458aa5fb:     	orb	%cl, %r10b
1458aa5fe:     	cmpb	%r10b, %r9b
1458aa601:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa603:     	movzbl	0x132e00c(%rip), %ecx   # 0x146bd8616
1458aa60a:     	leal	-0x41(%rcx), %r9d
1458aa60e:     	cmpb	$0x1a, %r9b
1458aa612:     	setb	%r9b
1458aa616:     	shlb	$0x5, %r9b
1458aa61a:     	orb	%cl, %r9b
1458aa61d:     	movzbl	0x6(%rdx), %ecx
1458aa621:     	leal	-0x41(%rcx), %r10d
1458aa625:     	cmpb	$0x1a, %r10b
1458aa629:     	setb	%r10b
1458aa62d:     	shlb	$0x5, %r10b
1458aa631:     	orb	%cl, %r10b
1458aa634:     	cmpb	%r10b, %r9b
1458aa637:     	jne	0x1458aa647 <.text+0x58a9647>
1458aa639:     	leaq	0x132eea8(%rip), %rcx   # 0x146bd94e8
1458aa640:     	xorl	%eax, %eax
1458aa642:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aa647:     	movzbl	0x132e159(%rip), %ecx   # 0x146bd87a7
1458aa64e:     	leal	-0x41(%rcx), %r9d
1458aa652:     	cmpb	$0x1a, %r9b
1458aa656:     	setb	%r9b
1458aa65a:     	shlb	$0x5, %r9b
1458aa65e:     	orb	%cl, %r9b
1458aa661:     	movzbl	(%rdx), %ecx
1458aa664:     	leal	-0x41(%rcx), %r10d
1458aa668:     	cmpb	$0x1a, %r10b
1458aa66c:     	setb	%r10b
1458aa670:     	shlb	$0x5, %r10b
1458aa674:     	orb	%cl, %r10b
1458aa677:     	cmpb	%r10b, %r9b
1458aa67a:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa680:     	movzbl	0x132e121(%rip), %ecx   # 0x146bd87a8
1458aa687:     	leal	-0x41(%rcx), %r9d
1458aa68b:     	cmpb	$0x1a, %r9b
1458aa68f:     	setb	%r9b
1458aa693:     	shlb	$0x5, %r9b
1458aa697:     	orb	%cl, %r9b
1458aa69a:     	movzbl	0x1(%rdx), %ecx
1458aa69e:     	leal	-0x41(%rcx), %r10d
1458aa6a2:     	cmpb	$0x1a, %r10b
1458aa6a6:     	setb	%r10b
1458aa6aa:     	shlb	$0x5, %r10b
1458aa6ae:     	orb	%cl, %r10b
1458aa6b1:     	cmpb	%r10b, %r9b
1458aa6b4:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa6ba:     	movzbl	0x132e0e8(%rip), %ecx   # 0x146bd87a9
1458aa6c1:     	leal	-0x41(%rcx), %r9d
1458aa6c5:     	cmpb	$0x1a, %r9b
1458aa6c9:     	setb	%r9b
1458aa6cd:     	shlb	$0x5, %r9b
1458aa6d1:     	orb	%cl, %r9b
1458aa6d4:     	movzbl	0x2(%rdx), %ecx
1458aa6d8:     	leal	-0x41(%rcx), %r10d
1458aa6dc:     	cmpb	$0x1a, %r10b
1458aa6e0:     	setb	%r10b
1458aa6e4:     	shlb	$0x5, %r10b
1458aa6e8:     	orb	%cl, %r10b
1458aa6eb:     	cmpb	%r10b, %r9b
1458aa6ee:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa6f4:     	movzbl	0x132e0af(%rip), %ecx   # 0x146bd87aa
1458aa6fb:     	leal	-0x41(%rcx), %r9d
1458aa6ff:     	cmpb	$0x1a, %r9b
1458aa703:     	setb	%r9b
1458aa707:     	shlb	$0x5, %r9b
1458aa70b:     	orb	%cl, %r9b
1458aa70e:     	movzbl	0x3(%rdx), %ecx
1458aa712:     	leal	-0x41(%rcx), %r10d
1458aa716:     	cmpb	$0x1a, %r10b
1458aa71a:     	setb	%r10b
1458aa71e:     	shlb	$0x5, %r10b
1458aa722:     	orb	%cl, %r10b
1458aa725:     	cmpb	%r10b, %r9b
1458aa728:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa72e:     	movzbl	0x132e076(%rip), %ecx   # 0x146bd87ab
1458aa735:     	leal	-0x41(%rcx), %r9d
1458aa739:     	cmpb	$0x1a, %r9b
1458aa73d:     	setb	%r9b
1458aa741:     	shlb	$0x5, %r9b
1458aa745:     	orb	%cl, %r9b
1458aa748:     	movzbl	0x4(%rdx), %ecx
1458aa74c:     	leal	-0x41(%rcx), %r10d
1458aa750:     	cmpb	$0x1a, %r10b
1458aa754:     	setb	%r10b
1458aa758:     	shlb	$0x5, %r10b
1458aa75c:     	orb	%cl, %r10b
1458aa75f:     	cmpb	%r10b, %r9b
1458aa762:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa764:     	movzbl	0x132e041(%rip), %ecx   # 0x146bd87ac
1458aa76b:     	leal	-0x41(%rcx), %r9d
1458aa76f:     	cmpb	$0x1a, %r9b
1458aa773:     	setb	%r9b
1458aa777:     	shlb	$0x5, %r9b
1458aa77b:     	orb	%cl, %r9b
1458aa77e:     	movzbl	0x5(%rdx), %ecx
1458aa782:     	leal	-0x41(%rcx), %r10d
1458aa786:     	cmpb	$0x1a, %r10b
1458aa78a:     	setb	%r10b
1458aa78e:     	shlb	$0x5, %r10b
1458aa792:     	orb	%cl, %r10b
1458aa795:     	cmpb	%r10b, %r9b
1458aa798:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa79a:     	movzbl	0x132e00c(%rip), %ecx   # 0x146bd87ad
1458aa7a1:     	leal	-0x41(%rcx), %r9d
1458aa7a5:     	cmpb	$0x1a, %r9b
1458aa7a9:     	setb	%r9b
1458aa7ad:     	shlb	$0x5, %r9b
1458aa7b1:     	orb	%cl, %r9b
1458aa7b4:     	movzbl	0x6(%rdx), %ecx
1458aa7b8:     	leal	-0x41(%rcx), %r10d
1458aa7bc:     	cmpb	$0x1a, %r10b
1458aa7c0:     	setb	%r10b
1458aa7c4:     	shlb	$0x5, %r10b
1458aa7c8:     	orb	%cl, %r10b
1458aa7cb:     	cmpb	%r10b, %r9b
1458aa7ce:     	jne	0x1458aa7de <.text+0x58a97de>
1458aa7d0:     	leaq	0x132eda1(%rip), %rcx   # 0x146bd9578
1458aa7d7:     	xorl	%eax, %eax
1458aa7d9:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aa7de:     	cmpq	$0x6, %r8
1458aa7e2:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa7e8:     	movzbl	0x132e166(%rip), %ecx   # 0x146bd8955
1458aa7ef:     	leal	-0x41(%rcx), %r9d
1458aa7f3:     	cmpb	$0x1a, %r9b
1458aa7f7:     	setb	%r9b
1458aa7fb:     	shlb	$0x5, %r9b
1458aa7ff:     	orb	%cl, %r9b
1458aa802:     	movzbl	(%rdx), %ecx
1458aa805:     	leal	-0x41(%rcx), %r10d
1458aa809:     	cmpb	$0x1a, %r10b
1458aa80d:     	setb	%r10b
1458aa811:     	shlb	$0x5, %r10b
1458aa815:     	orb	%cl, %r10b
1458aa818:     	cmpb	%r10b, %r9b
1458aa81b:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa821:     	movzbl	0x132e12e(%rip), %ecx   # 0x146bd8956
1458aa828:     	leal	-0x41(%rcx), %r9d
1458aa82c:     	cmpb	$0x1a, %r9b
1458aa830:     	setb	%r9b
1458aa834:     	shlb	$0x5, %r9b
1458aa838:     	orb	%cl, %r9b
1458aa83b:     	movzbl	0x1(%rdx), %ecx
1458aa83f:     	leal	-0x41(%rcx), %r10d
1458aa843:     	cmpb	$0x1a, %r10b
1458aa847:     	setb	%r10b
1458aa84b:     	shlb	$0x5, %r10b
1458aa84f:     	orb	%cl, %r10b
1458aa852:     	cmpb	%r10b, %r9b
1458aa855:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa85b:     	movzbl	0x132e0f5(%rip), %ecx   # 0x146bd8957
1458aa862:     	leal	-0x41(%rcx), %r9d
1458aa866:     	cmpb	$0x1a, %r9b
1458aa86a:     	setb	%r9b
1458aa86e:     	shlb	$0x5, %r9b
1458aa872:     	orb	%cl, %r9b
1458aa875:     	movzbl	0x2(%rdx), %ecx
1458aa879:     	leal	-0x41(%rcx), %r10d
1458aa87d:     	cmpb	$0x1a, %r10b
1458aa881:     	setb	%r10b
1458aa885:     	shlb	$0x5, %r10b
1458aa889:     	orb	%cl, %r10b
1458aa88c:     	cmpb	%r10b, %r9b
1458aa88f:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa895:     	movzbl	0x132e0bc(%rip), %ecx   # 0x146bd8958
1458aa89c:     	leal	-0x41(%rcx), %r9d
1458aa8a0:     	cmpb	$0x1a, %r9b
1458aa8a4:     	setb	%r9b
1458aa8a8:     	shlb	$0x5, %r9b
1458aa8ac:     	orb	%cl, %r9b
1458aa8af:     	movzbl	0x3(%rdx), %ecx
1458aa8b3:     	leal	-0x41(%rcx), %r10d
1458aa8b7:     	cmpb	$0x1a, %r10b
1458aa8bb:     	setb	%r10b
1458aa8bf:     	shlb	$0x5, %r10b
1458aa8c3:     	orb	%cl, %r10b
1458aa8c6:     	cmpb	%r10b, %r9b
1458aa8c9:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa8cb:     	movzbl	0x132e087(%rip), %ecx   # 0x146bd8959
1458aa8d2:     	leal	-0x41(%rcx), %r9d
1458aa8d6:     	cmpb	$0x1a, %r9b
1458aa8da:     	setb	%r9b
1458aa8de:     	shlb	$0x5, %r9b
1458aa8e2:     	orb	%cl, %r9b
1458aa8e5:     	movzbl	0x4(%rdx), %ecx
1458aa8e9:     	leal	-0x41(%rcx), %r10d
1458aa8ed:     	cmpb	$0x1a, %r10b
1458aa8f1:     	setb	%r10b
1458aa8f5:     	shlb	$0x5, %r10b
1458aa8f9:     	orb	%cl, %r10b
1458aa8fc:     	cmpb	%r10b, %r9b
1458aa8ff:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa901:     	movzbl	0x132e052(%rip), %ecx   # 0x146bd895a
1458aa908:     	leal	-0x41(%rcx), %r9d
1458aa90c:     	cmpb	$0x1a, %r9b
1458aa910:     	setb	%r9b
1458aa914:     	shlb	$0x5, %r9b
1458aa918:     	orb	%cl, %r9b
1458aa91b:     	movzbl	0x5(%rdx), %ecx
1458aa91f:     	leal	-0x41(%rcx), %r10d
1458aa923:     	cmpb	$0x1a, %r10b
1458aa927:     	setb	%r10b
1458aa92b:     	shlb	$0x5, %r10b
1458aa92f:     	orb	%cl, %r10b
1458aa932:     	cmpb	%r10b, %r9b
1458aa935:     	jne	0x1458aa945 <.text+0x58a9945>
1458aa937:     	leaq	0x132ecca(%rip), %rcx   # 0x146bd9608
1458aa93e:     	xorl	%eax, %eax
1458aa940:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aa945:     	cmpq	$0x5, %r8
1458aa949:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aa94f:     	movzbl	0x132e1a1(%rip), %ecx   # 0x146bd8af7
1458aa956:     	leal	-0x41(%rcx), %r9d
1458aa95a:     	cmpb	$0x1a, %r9b
1458aa95e:     	setb	%r9b
1458aa962:     	shlb	$0x5, %r9b
1458aa966:     	orb	%cl, %r9b
1458aa969:     	movzbl	(%rdx), %ecx
1458aa96c:     	leal	-0x41(%rcx), %r10d
1458aa970:     	cmpb	$0x1a, %r10b
1458aa974:     	setb	%r10b
1458aa978:     	shlb	$0x5, %r10b
1458aa97c:     	orb	%cl, %r10b
1458aa97f:     	cmpb	%r10b, %r9b
1458aa982:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aa988:     	movzbl	0x132e169(%rip), %ecx   # 0x146bd8af8
1458aa98f:     	leal	-0x41(%rcx), %r9d
1458aa993:     	cmpb	$0x1a, %r9b
1458aa997:     	setb	%r9b
1458aa99b:     	shlb	$0x5, %r9b
1458aa99f:     	orb	%cl, %r9b
1458aa9a2:     	movzbl	0x1(%rdx), %ecx
1458aa9a6:     	leal	-0x41(%rcx), %r10d
1458aa9aa:     	cmpb	$0x1a, %r10b
1458aa9ae:     	setb	%r10b
1458aa9b2:     	shlb	$0x5, %r10b
1458aa9b6:     	orb	%cl, %r10b
1458aa9b9:     	cmpb	%r10b, %r9b
1458aa9bc:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aa9c2:     	movzbl	0x132e130(%rip), %ecx   # 0x146bd8af9
1458aa9c9:     	leal	-0x41(%rcx), %r9d
1458aa9cd:     	cmpb	$0x1a, %r9b
1458aa9d1:     	setb	%r9b
1458aa9d5:     	shlb	$0x5, %r9b
1458aa9d9:     	orb	%cl, %r9b
1458aa9dc:     	movzbl	0x2(%rdx), %ecx
1458aa9e0:     	leal	-0x41(%rcx), %r10d
1458aa9e4:     	cmpb	$0x1a, %r10b
1458aa9e8:     	setb	%r10b
1458aa9ec:     	shlb	$0x5, %r10b
1458aa9f0:     	orb	%cl, %r10b
1458aa9f3:     	cmpb	%r10b, %r9b
1458aa9f6:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aa9f8:     	movzbl	0x132e0fb(%rip), %ecx   # 0x146bd8afa
1458aa9ff:     	leal	-0x41(%rcx), %r9d
1458aaa03:     	cmpb	$0x1a, %r9b
1458aaa07:     	setb	%r9b
1458aaa0b:     	shlb	$0x5, %r9b
1458aaa0f:     	orb	%cl, %r9b
1458aaa12:     	movzbl	0x3(%rdx), %ecx
1458aaa16:     	leal	-0x41(%rcx), %r10d
1458aaa1a:     	cmpb	$0x1a, %r10b
1458aaa1e:     	setb	%r10b
1458aaa22:     	shlb	$0x5, %r10b
1458aaa26:     	orb	%cl, %r10b
1458aaa29:     	cmpb	%r10b, %r9b
1458aaa2c:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aaa2e:     	movzbl	0x132e0c6(%rip), %ecx   # 0x146bd8afb
1458aaa35:     	leal	-0x41(%rcx), %r9d
1458aaa39:     	cmpb	$0x1a, %r9b
1458aaa3d:     	setb	%r9b
1458aaa41:     	shlb	$0x5, %r9b
1458aaa45:     	orb	%cl, %r9b
1458aaa48:     	movzbl	0x4(%rdx), %ecx
1458aaa4c:     	leal	-0x41(%rcx), %r10d
1458aaa50:     	cmpb	$0x1a, %r10b
1458aaa54:     	setb	%r10b
1458aaa58:     	shlb	$0x5, %r10b
1458aaa5c:     	orb	%cl, %r10b
1458aaa5f:     	cmpb	%r10b, %r9b
1458aaa62:     	jne	0x1458aaa72 <.text+0x58a9a72>
1458aaa64:     	leaq	0x132ec2d(%rip), %rcx   # 0x146bd9698
1458aaa6b:     	xorl	%eax, %eax
1458aaa6d:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aaa72:     	cmpq	$0x6, %r8
1458aaa76:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aaa7c:     	movzbl	0x132e213(%rip), %ecx   # 0x146bd8c96
1458aaa83:     	leal	-0x41(%rcx), %r9d
1458aaa87:     	cmpb	$0x1a, %r9b
1458aaa8b:     	setb	%r9b
1458aaa8f:     	shlb	$0x5, %r9b
1458aaa93:     	orb	%cl, %r9b
1458aaa96:     	movzbl	(%rdx), %ecx
1458aaa99:     	leal	-0x41(%rcx), %r10d
1458aaa9d:     	cmpb	$0x1a, %r10b
1458aaaa1:     	setb	%r10b
1458aaaa5:     	shlb	$0x5, %r10b
1458aaaa9:     	orb	%cl, %r10b
1458aaaac:     	cmpb	%r10b, %r9b
1458aaaaf:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aaab5:     	movzbl	0x132e1db(%rip), %ecx   # 0x146bd8c97
1458aaabc:     	leal	-0x41(%rcx), %r9d
1458aaac0:     	cmpb	$0x1a, %r9b
1458aaac4:     	setb	%r9b
1458aaac8:     	shlb	$0x5, %r9b
1458aaacc:     	orb	%cl, %r9b
1458aaacf:     	movzbl	0x1(%rdx), %ecx
1458aaad3:     	leal	-0x41(%rcx), %r10d
1458aaad7:     	cmpb	$0x1a, %r10b
1458aaadb:     	setb	%r10b
1458aaadf:     	shlb	$0x5, %r10b
1458aaae3:     	orb	%cl, %r10b
1458aaae6:     	cmpb	%r10b, %r9b
1458aaae9:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aaaef:     	movzbl	0x132e1a2(%rip), %ecx   # 0x146bd8c98
1458aaaf6:     	leal	-0x41(%rcx), %r9d
1458aaafa:     	cmpb	$0x1a, %r9b
1458aaafe:     	setb	%r9b
1458aab02:     	shlb	$0x5, %r9b
1458aab06:     	orb	%cl, %r9b
1458aab09:     	movzbl	0x2(%rdx), %ecx
1458aab0d:     	leal	-0x41(%rcx), %r10d
1458aab11:     	cmpb	$0x1a, %r10b
1458aab15:     	setb	%r10b
1458aab19:     	shlb	$0x5, %r10b
1458aab1d:     	orb	%cl, %r10b
1458aab20:     	cmpb	%r10b, %r9b
1458aab23:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aab29:     	movzbl	0x132e169(%rip), %ecx   # 0x146bd8c99
1458aab30:     	leal	-0x41(%rcx), %r9d
1458aab34:     	cmpb	$0x1a, %r9b
1458aab38:     	setb	%r9b
1458aab3c:     	shlb	$0x5, %r9b
1458aab40:     	orb	%cl, %r9b
1458aab43:     	movzbl	0x3(%rdx), %ecx
1458aab47:     	leal	-0x41(%rcx), %r10d
1458aab4b:     	cmpb	$0x1a, %r10b
1458aab4f:     	setb	%r10b
1458aab53:     	shlb	$0x5, %r10b
1458aab57:     	orb	%cl, %r10b
1458aab5a:     	cmpb	%r10b, %r9b
1458aab5d:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aab5f:     	movzbl	0x132e134(%rip), %ecx   # 0x146bd8c9a
1458aab66:     	leal	-0x41(%rcx), %r9d
1458aab6a:     	cmpb	$0x1a, %r9b
1458aab6e:     	setb	%r9b
1458aab72:     	shlb	$0x5, %r9b
1458aab76:     	orb	%cl, %r9b
1458aab79:     	movzbl	0x4(%rdx), %ecx
1458aab7d:     	leal	-0x41(%rcx), %r10d
1458aab81:     	cmpb	$0x1a, %r10b
1458aab85:     	setb	%r10b
1458aab89:     	shlb	$0x5, %r10b
1458aab8d:     	orb	%cl, %r10b
1458aab90:     	cmpb	%r10b, %r9b
1458aab93:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aab95:     	movzbl	0x132e0ff(%rip), %ecx   # 0x146bd8c9b
1458aab9c:     	leal	-0x41(%rcx), %r9d
1458aaba0:     	cmpb	$0x1a, %r9b
1458aaba4:     	setb	%r9b
1458aaba8:     	shlb	$0x5, %r9b
1458aabac:     	orb	%cl, %r9b
1458aabaf:     	movzbl	0x5(%rdx), %ecx
1458aabb3:     	leal	-0x41(%rcx), %r10d
1458aabb7:     	cmpb	$0x1a, %r10b
1458aabbb:     	setb	%r10b
1458aabbf:     	shlb	$0x5, %r10b
1458aabc3:     	orb	%cl, %r10b
1458aabc6:     	cmpb	%r10b, %r9b
1458aabc9:     	jne	0x1458aabd9 <.text+0x58a9bd9>
1458aabcb:     	leaq	0x132eb56(%rip), %rcx   # 0x146bd9728
1458aabd2:     	xorl	%eax, %eax
1458aabd4:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aabd9:     	movzbl	0x132e23b(%rip), %ecx   # 0x146bd8e1b
1458aabe0:     	leal	-0x41(%rcx), %r9d
1458aabe4:     	cmpb	$0x1a, %r9b
1458aabe8:     	setb	%r9b
1458aabec:     	shlb	$0x5, %r9b
1458aabf0:     	orb	%cl, %r9b
1458aabf3:     	movzbl	(%rdx), %ecx
1458aabf6:     	leal	-0x41(%rcx), %r10d
1458aabfa:     	cmpb	$0x1a, %r10b
1458aabfe:     	setb	%r10b
1458aac02:     	shlb	$0x5, %r10b
1458aac06:     	orb	%cl, %r10b
1458aac09:     	cmpb	%r10b, %r9b
1458aac0c:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aac12:     	movzbl	0x132e203(%rip), %ecx   # 0x146bd8e1c
1458aac19:     	leal	-0x41(%rcx), %r9d
1458aac1d:     	cmpb	$0x1a, %r9b
1458aac21:     	setb	%r9b
1458aac25:     	shlb	$0x5, %r9b
1458aac29:     	orb	%cl, %r9b
1458aac2c:     	movzbl	0x1(%rdx), %ecx
1458aac30:     	leal	-0x41(%rcx), %r10d
1458aac34:     	cmpb	$0x1a, %r10b
1458aac38:     	setb	%r10b
1458aac3c:     	shlb	$0x5, %r10b
1458aac40:     	orb	%cl, %r10b
1458aac43:     	cmpb	%r10b, %r9b
1458aac46:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aac4c:     	movzbl	0x132e1ca(%rip), %ecx   # 0x146bd8e1d
1458aac53:     	leal	-0x41(%rcx), %r9d
1458aac57:     	cmpb	$0x1a, %r9b
1458aac5b:     	setb	%r9b
1458aac5f:     	shlb	$0x5, %r9b
1458aac63:     	orb	%cl, %r9b
1458aac66:     	movzbl	0x2(%rdx), %ecx
1458aac6a:     	leal	-0x41(%rcx), %r10d
1458aac6e:     	cmpb	$0x1a, %r10b
1458aac72:     	setb	%r10b
1458aac76:     	shlb	$0x5, %r10b
1458aac7a:     	orb	%cl, %r10b
1458aac7d:     	cmpb	%r10b, %r9b
1458aac80:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aac86:     	movzbl	0x132e191(%rip), %ecx   # 0x146bd8e1e
1458aac8d:     	leal	-0x41(%rcx), %r9d
1458aac91:     	cmpb	$0x1a, %r9b
1458aac95:     	setb	%r9b
1458aac99:     	shlb	$0x5, %r9b
1458aac9d:     	orb	%cl, %r9b
1458aaca0:     	movzbl	0x3(%rdx), %ecx
1458aaca4:     	leal	-0x41(%rcx), %r10d
1458aaca8:     	cmpb	$0x1a, %r10b
1458aacac:     	setb	%r10b
1458aacb0:     	shlb	$0x5, %r10b
1458aacb4:     	orb	%cl, %r10b
1458aacb7:     	cmpb	%r10b, %r9b
1458aacba:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aacbc:     	movzbl	0x132e15c(%rip), %ecx   # 0x146bd8e1f
1458aacc3:     	leal	-0x41(%rcx), %r9d
1458aacc7:     	cmpb	$0x1a, %r9b
1458aaccb:     	setb	%r9b
1458aaccf:     	shlb	$0x5, %r9b
1458aacd3:     	orb	%cl, %r9b
1458aacd6:     	movzbl	0x4(%rdx), %ecx
1458aacda:     	leal	-0x41(%rcx), %r10d
1458aacde:     	cmpb	$0x1a, %r10b
1458aace2:     	setb	%r10b
1458aace6:     	shlb	$0x5, %r10b
1458aacea:     	orb	%cl, %r10b
1458aaced:     	cmpb	%r10b, %r9b
1458aacf0:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aacf2:     	movzbl	0x132e127(%rip), %ecx   # 0x146bd8e20
1458aacf9:     	leal	-0x41(%rcx), %r9d
1458aacfd:     	cmpb	$0x1a, %r9b
1458aad01:     	setb	%r9b
1458aad05:     	shlb	$0x5, %r9b
1458aad09:     	orb	%cl, %r9b
1458aad0c:     	movzbl	0x5(%rdx), %ecx
1458aad10:     	leal	-0x41(%rcx), %r10d
1458aad14:     	cmpb	$0x1a, %r10b
1458aad18:     	setb	%r10b
1458aad1c:     	shlb	$0x5, %r10b
1458aad20:     	orb	%cl, %r10b
1458aad23:     	cmpb	%r10b, %r9b
1458aad26:     	jne	0x1458aad36 <.text+0x58a9d36>
1458aad28:     	leaq	0x132ea89(%rip), %rcx   # 0x146bd97b8
1458aad2f:     	xorl	%eax, %eax
1458aad31:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aad36:     	cmpq	$0x4, %r8
1458aad3a:     	jne	0x1458aae29 <.text+0x58a9e29>
1458aad40:     	movzbl	0x132e279(%rip), %ecx   # 0x146bd8fc0
1458aad47:     	leal	-0x41(%rcx), %r9d
1458aad4b:     	cmpb	$0x1a, %r9b
1458aad4f:     	setb	%r9b
1458aad53:     	shlb	$0x5, %r9b
1458aad57:     	orb	%cl, %r9b
1458aad5a:     	movzbl	(%rdx), %ecx
1458aad5d:     	leal	-0x41(%rcx), %r10d
1458aad61:     	cmpb	$0x1a, %r10b
1458aad65:     	setb	%r10b
1458aad69:     	shlb	$0x5, %r10b
1458aad6d:     	orb	%cl, %r10b
1458aad70:     	cmpb	%r10b, %r9b
1458aad73:     	jne	0x1458aae29 <.text+0x58a9e29>
1458aad79:     	movzbl	0x132e241(%rip), %ecx   # 0x146bd8fc1
1458aad80:     	leal	-0x41(%rcx), %r9d
1458aad84:     	cmpb	$0x1a, %r9b
1458aad88:     	setb	%r9b
1458aad8c:     	shlb	$0x5, %r9b
1458aad90:     	orb	%cl, %r9b
1458aad93:     	movzbl	0x1(%rdx), %ecx
1458aad97:     	leal	-0x41(%rcx), %r10d
1458aad9b:     	cmpb	$0x1a, %r10b
1458aad9f:     	setb	%r10b
1458aada3:     	shlb	$0x5, %r10b
1458aada7:     	orb	%cl, %r10b
1458aadaa:     	cmpb	%r10b, %r9b
1458aadad:     	jne	0x1458aae29 <.text+0x58a9e29>
1458aadaf:     	movzbl	0x132e20c(%rip), %ecx   # 0x146bd8fc2
1458aadb6:     	leal	-0x41(%rcx), %r9d
1458aadba:     	cmpb	$0x1a, %r9b
1458aadbe:     	setb	%r9b
1458aadc2:     	shlb	$0x5, %r9b
1458aadc6:     	orb	%cl, %r9b
1458aadc9:     	movzbl	0x2(%rdx), %ecx
1458aadcd:     	leal	-0x41(%rcx), %r10d
1458aadd1:     	cmpb	$0x1a, %r10b
1458aadd5:     	setb	%r10b
1458aadd9:     	shlb	$0x5, %r10b
1458aaddd:     	orb	%cl, %r10b
1458aade0:     	cmpb	%r10b, %r9b
1458aade3:     	jne	0x1458aae29 <.text+0x58a9e29>
1458aade5:     	movzbl	0x132e1d7(%rip), %ecx   # 0x146bd8fc3
1458aadec:     	leal	-0x41(%rcx), %r9d
1458aadf0:     	cmpb	$0x1a, %r9b
1458aadf4:     	setb	%r9b
1458aadf8:     	shlb	$0x5, %r9b
1458aadfc:     	orb	%cl, %r9b
1458aadff:     	movzbl	0x3(%rdx), %ecx
1458aae03:     	leal	-0x41(%rcx), %r10d
1458aae07:     	cmpb	$0x1a, %r10b
1458aae0b:     	setb	%r10b
1458aae0f:     	shlb	$0x5, %r10b
1458aae13:     	orb	%cl, %r10b
1458aae16:     	cmpb	%r10b, %r9b
1458aae19:     	jne	0x1458aae29 <.text+0x58a9e29>
1458aae1b:     	leaq	0x132ea26(%rip), %rcx   # 0x146bd9848
1458aae22:     	xorl	%eax, %eax
1458aae24:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aae29:     	cmpq	$0x7, %r8
1458aae2d:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aae33:     	movzbl	0x132e352(%rip), %ecx   # 0x146bd918c
1458aae3a:     	leal	-0x41(%rcx), %r9d
1458aae3e:     	cmpb	$0x1a, %r9b
1458aae42:     	setb	%r9b
1458aae46:     	shlb	$0x5, %r9b
1458aae4a:     	orb	%cl, %r9b
1458aae4d:     	movzbl	(%rdx), %ecx
1458aae50:     	leal	-0x41(%rcx), %r10d
1458aae54:     	cmpb	$0x1a, %r10b
1458aae58:     	setb	%r10b
1458aae5c:     	shlb	$0x5, %r10b
1458aae60:     	orb	%cl, %r10b
1458aae63:     	cmpb	%r10b, %r9b
1458aae66:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aae6c:     	movzbl	0x132e31a(%rip), %ecx   # 0x146bd918d
1458aae73:     	leal	-0x41(%rcx), %r9d
1458aae77:     	cmpb	$0x1a, %r9b
1458aae7b:     	setb	%r9b
1458aae7f:     	shlb	$0x5, %r9b
1458aae83:     	orb	%cl, %r9b
1458aae86:     	movzbl	0x1(%rdx), %ecx
1458aae8a:     	leal	-0x41(%rcx), %r10d
1458aae8e:     	cmpb	$0x1a, %r10b
1458aae92:     	setb	%r10b
1458aae96:     	shlb	$0x5, %r10b
1458aae9a:     	orb	%cl, %r10b
1458aae9d:     	cmpb	%r10b, %r9b
1458aaea0:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aaea6:     	movzbl	0x132e2e1(%rip), %ecx   # 0x146bd918e
1458aaead:     	leal	-0x41(%rcx), %r9d
1458aaeb1:     	cmpb	$0x1a, %r9b
1458aaeb5:     	setb	%r9b
1458aaeb9:     	shlb	$0x5, %r9b
1458aaebd:     	orb	%cl, %r9b
1458aaec0:     	movzbl	0x2(%rdx), %ecx
1458aaec4:     	leal	-0x41(%rcx), %r10d
1458aaec8:     	cmpb	$0x1a, %r10b
1458aaecc:     	setb	%r10b
1458aaed0:     	shlb	$0x5, %r10b
1458aaed4:     	orb	%cl, %r10b
1458aaed7:     	cmpb	%r10b, %r9b
1458aaeda:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aaee0:     	movzbl	0x132e2a8(%rip), %ecx   # 0x146bd918f
1458aaee7:     	leal	-0x41(%rcx), %r9d
1458aaeeb:     	cmpb	$0x1a, %r9b
1458aaeef:     	setb	%r9b
1458aaef3:     	shlb	$0x5, %r9b
1458aaef7:     	orb	%cl, %r9b
1458aaefa:     	movzbl	0x3(%rdx), %ecx
1458aaefe:     	leal	-0x41(%rcx), %r10d
1458aaf02:     	cmpb	$0x1a, %r10b
1458aaf06:     	setb	%r10b
1458aaf0a:     	shlb	$0x5, %r10b
1458aaf0e:     	orb	%cl, %r10b
1458aaf11:     	cmpb	%r10b, %r9b
1458aaf14:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aaf1a:     	movzbl	0x132e26f(%rip), %ecx   # 0x146bd9190
1458aaf21:     	leal	-0x41(%rcx), %r9d
1458aaf25:     	cmpb	$0x1a, %r9b
1458aaf29:     	setb	%r9b
1458aaf2d:     	shlb	$0x5, %r9b
1458aaf31:     	orb	%cl, %r9b
1458aaf34:     	movzbl	0x4(%rdx), %ecx
1458aaf38:     	leal	-0x41(%rcx), %r10d
1458aaf3c:     	cmpb	$0x1a, %r10b
1458aaf40:     	setb	%r10b
1458aaf44:     	shlb	$0x5, %r10b
1458aaf48:     	orb	%cl, %r10b
1458aaf4b:     	cmpb	%r10b, %r9b
1458aaf4e:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aaf54:     	movzbl	0x132e236(%rip), %ecx   # 0x146bd9191
1458aaf5b:     	leal	-0x41(%rcx), %r9d
1458aaf5f:     	cmpb	$0x1a, %r9b
1458aaf63:     	setb	%r9b
1458aaf67:     	shlb	$0x5, %r9b
1458aaf6b:     	orb	%cl, %r9b
1458aaf6e:     	movzbl	0x5(%rdx), %ecx
1458aaf72:     	leal	-0x41(%rcx), %r10d
1458aaf76:     	cmpb	$0x1a, %r10b
1458aaf7a:     	setb	%r10b
1458aaf7e:     	shlb	$0x5, %r10b
1458aaf82:     	orb	%cl, %r10b
1458aaf85:     	cmpb	%r10b, %r9b
1458aaf88:     	jne	0x1458aafeb <.text+0x58a9feb>
1458aaf8a:     	cmpq	$0x5, %r8
1458aaf8e:     	setne	%r8b
1458aaf92:     	movzbl	0x132e1f9(%rip), %ecx   # 0x146bd9192
1458aaf99:     	leal	-0x41(%rcx), %r9d
1458aaf9d:     	cmpb	$0x1a, %r9b
1458aafa1:     	setb	%r9b
1458aafa5:     	shlb	$0x5, %r9b
1458aafa9:     	orb	%cl, %r9b
1458aafac:     	movzbl	0x6(%rdx), %ecx
1458aafb0:     	leal	-0x41(%rcx), %r10d
1458aafb4:     	cmpb	$0x1a, %r10b
1458aafb8:     	setb	%r10b
1458aafbc:     	shlb	$0x5, %r10b
1458aafc0:     	orb	%cl, %r10b
1458aafc3:     	xorl	%ecx, %ecx
1458aafc5:     	cmpb	%r10b, %r9b
1458aafc8:     	setne	%r9b
1458aafcc:     	sete	%r10b
1458aafd0:     	leaq	0x132e901(%rip), %r11   # 0x146bd98d8
1458aafd7:     	cmoveq	%r11, %rcx
1458aafdb:     	orb	%r8b, %r10b
1458aafde:     	je	0x1458aaff5 <.text+0x58a9ff5>
1458aafe0:     	negb	%r9b
1458aafe3:     	movl	%r9d, %eax
1458aafe6:     	jmp	0x1458ab117 <.text+0x58aa117>
1458aafeb:     	cmpq	$0x5, %r8
1458aafef:     	jne	0x1458ab115 <.text+0x58aa115>
1458aaff5:     	movzbl	0x132e34c(%rip), %ecx   # 0x146bd9348
1458aaffc:     	leal	-0x41(%rcx), %r8d
1458ab000:     	cmpb	$0x1a, %r8b
1458ab004:     	setb	%r8b
1458ab008:     	shlb	$0x5, %r8b
1458ab00c:     	orb	%cl, %r8b
1458ab00f:     	movzbl	(%rdx), %ecx
1458ab012:     	leal	-0x41(%rcx), %r9d
1458ab016:     	cmpb	$0x1a, %r9b
1458ab01a:     	setb	%r9b
1458ab01e:     	shlb	$0x5, %r9b
1458ab022:     	orb	%cl, %r9b
1458ab025:     	cmpb	%r9b, %r8b
1458ab028:     	jne	0x1458ab115 <.text+0x58aa115>
1458ab02e:     	movzbl	0x132e314(%rip), %ecx   # 0x146bd9349
1458ab035:     	leal	-0x41(%rcx), %r8d
1458ab039:     	cmpb	$0x1a, %r8b
1458ab03d:     	setb	%r8b
1458ab041:     	shlb	$0x5, %r8b
1458ab045:     	orb	%cl, %r8b
1458ab048:     	movzbl	0x1(%rdx), %ecx
1458ab04c:     	leal	-0x41(%rcx), %r9d
1458ab050:     	cmpb	$0x1a, %r9b
1458ab054:     	setb	%r9b
1458ab058:     	shlb	$0x5, %r9b
1458ab05c:     	orb	%cl, %r9b
1458ab05f:     	cmpb	%r9b, %r8b
1458ab062:     	jne	0x1458ab115 <.text+0x58aa115>
1458ab068:     	movzbl	0x132e2db(%rip), %ecx   # 0x146bd934a
1458ab06f:     	leal	-0x41(%rcx), %r8d
1458ab073:     	cmpb	$0x1a, %r8b
1458ab077:     	setb	%r8b
1458ab07b:     	shlb	$0x5, %r8b
1458ab07f:     	orb	%cl, %r8b
1458ab082:     	movzbl	0x2(%rdx), %ecx
1458ab086:     	leal	-0x41(%rcx), %r9d
1458ab08a:     	cmpb	$0x1a, %r9b
1458ab08e:     	setb	%r9b
1458ab092:     	shlb	$0x5, %r9b
1458ab096:     	orb	%cl, %r9b
1458ab099:     	cmpb	%r9b, %r8b
1458ab09c:     	jne	0x1458ab115 <.text+0x58aa115>
1458ab09e:     	movzbl	0x132e2a6(%rip), %ecx   # 0x146bd934b
1458ab0a5:     	leal	-0x41(%rcx), %r8d
1458ab0a9:     	cmpb	$0x1a, %r8b
1458ab0ad:     	setb	%r8b
1458ab0b1:     	shlb	$0x5, %r8b
1458ab0b5:     	orb	%cl, %r8b
1458ab0b8:     	movzbl	0x3(%rdx), %ecx
1458ab0bc:     	leal	-0x41(%rcx), %r9d
1458ab0c0:     	cmpb	$0x1a, %r9b
1458ab0c4:     	setb	%r9b
1458ab0c8:     	shlb	$0x5, %r9b
1458ab0cc:     	orb	%cl, %r9b
1458ab0cf:     	cmpb	%r9b, %r8b
1458ab0d2:     	jne	0x1458ab115 <.text+0x58aa115>
1458ab0d4:     	movzbl	0x132e271(%rip), %eax   # 0x146bd934c
1458ab0db:     	leal	-0x41(%rax), %ecx
1458ab0de:     	cmpb	$0x1a, %cl
1458ab0e1:     	setb	%r8b
1458ab0e5:     	shlb	$0x5, %r8b
1458ab0e9:     	orb	%al, %r8b
1458ab0ec:     	movzbl	0x4(%rdx), %eax
1458ab0f0:     	leal	-0x41(%rax), %ecx
1458ab0f3:     	cmpb	$0x1a, %cl
1458ab0f6:     	setb	%dl
1458ab0f9:     	shlb	$0x5, %dl
1458ab0fc:     	orb	%al, %dl
1458ab0fe:     	xorl	%ecx, %ecx
1458ab100:     	cmpb	%dl, %r8b
1458ab103:     	setne	%al
1458ab106:     	leaq	0x132e85b(%rip), %rdx   # 0x146bd9968
1458ab10d:     	cmoveq	%rdx, %rcx
1458ab111:     	negb	%al
1458ab113:     	jmp	0x1458ab117 <.text+0x58aa117>
1458ab115:     	xorl	%ecx, %ecx
1458ab117:     	leaq	0x132e3ca(%rip), %rdx   # 0x146bd94e8
1458ab11e:     	testb	$0x1, %al
1458ab120:     	cmoveq	%rcx, %rdx
1458ab124:     	movq	%rdx, -0x28(%rbp)
1458ab128:     	movzbl	0x8c(%rdx), %eax
1458ab12f:     	decb	%al
1458ab131:     	cmpb	$0xa, %al
1458ab133:     	ja	0x1458ab153 <.text+0x58aa153>
1458ab135:     	leaq	0x133c55c(%rip), %rcx   # 0x146be7698
1458ab13c:     	movzbl	%al, %eax
1458ab13f:     	movslq	(%rcx,%rax,4), %rbx
1458ab143:     	addq	%rcx, %rbx
1458ab146:     	leaq	0x133c57b(%rip), %rcx   # 0x146be76c8
1458ab14d:     	movq	(%rcx,%rax,8), %r15
1458ab151:     	jmp	0x1458ab160 <.text+0x58aa160>
1458ab153:     	movl	$0x1, %r15d
1458ab159:     	leaq	0x133c3c0(%rip), %rbx   # 0x146be7520
1458ab160:     	xorl	%eax, %eax
1458ab162:     	movq	%rdi, -0x48(%rbp)
1458ab166:     	movq	%rbx, -0x40(%rbp)
1458ab16a:     	movq	%r15, -0x38(%rbp)
1458ab16e:     	jmp	0x1458ab180 <.text+0x58aa180>
1458ab170:     	movq	-0x58(%rbp), %rax
1458ab174:     	cmpq	$0x2c0, %rax            # imm = 0x2C0
1458ab17a:     	je	0x1458ab43f <.text+0x58aa43f>
1458ab180:     	leaq	0x132d1c9(%rip), %rcx   # 0x146bd8350
1458ab187:     	leaq	(%rcx,%rax), %rdx
1458ab18b:     	movq	%rdx, -0x50(%rbp)
1458ab18f:     	movq	(%rax,%rcx), %r15
1458ab193:     	movq	0x8(%rax,%rcx), %r14
1458ab198:     	addq	$0x58, %rax
1458ab19c:     	movq	%rax, -0x58(%rbp)
1458ab1a0:     	movq	$0x0, -0x20(%rbp)
1458ab1a8:     	movq	$0x1, -0x18(%rbp)
1458ab1b0:     	xorl	%r12d, %r12d
1458ab1b3:     	xorl	%edi, %edi
1458ab1b5:     	movq	%r12, -0x10(%rbp)
1458ab1b9:     	movq	%r14, %rbx
1458ab1bc:     	movq	%rdi, -0x8(%rbp)
1458ab1c0:     	subq	%rdi, %rbx
1458ab1c3:     	jb	0x1458ab2e0 <.text+0x58aa2e0>
1458ab1c9:     	movq	-0x8(%rbp), %r13
1458ab1cd:     	jmp	0x1458ab1dc <.text+0x58aa1dc>
1458ab1cf:     	nop
1458ab1d0:     	movq	%rdi, %r13
1458ab1d3:     	cmpq	%r14, %rdi
1458ab1d6:     	ja	0x1458ab2e0 <.text+0x58aa2e0>
1458ab1dc:     	movq	%r14, %r8
1458ab1df:     	subq	%r13, %r8
1458ab1e2:     	leaq	(%r15,%r13), %rdx
1458ab1e6:     	cmpq	$0x10, %r8
1458ab1ea:     	jae	0x1458ab220 <.text+0x58aa220>
1458ab1ec:     	xorl	%esi, %esi
1458ab1ee:     	testq	%r8, %r8
1458ab1f1:     	je	0x1458ab211 <.text+0x58aa211>
1458ab1f3:     	nopw	%cs:(%rax,%rax)
1458ab200:     	cmpb	$0x20, (%rdx,%rsi)
1458ab204:     	je	0x1458ab236 <.text+0x58aa236>
1458ab206:     	incq	%rsi
1458ab209:     	cmpq	%rsi, %r8
1458ab20c:     	jne	0x1458ab200 <.text+0x58aa200>
1458ab20e:     	movq	%r8, %rsi
1458ab211:     	xorl	%eax, %eax
1458ab213:     	cmpq	$0x1, %rax
1458ab217:     	je	0x1458ab250 <.text+0x58aa250>
1458ab219:     	jmp	0x1458ab2e0 <.text+0x58aa2e0>
1458ab21e:     	nop
1458ab220:     	movb	$0x20, %cl
1458ab222:     	callq	0x145bcd4c0 <.text+0x5bcc4c0>
1458ab227:     	nop
1458ab228:     	movq	%rdx, %rsi
1458ab22b:     	cmpq	$0x1, %rax
1458ab22f:     	je	0x1458ab250 <.text+0x58aa250>
1458ab231:     	jmp	0x1458ab2e0 <.text+0x58aa2e0>
1458ab236:     	movl	$0x1, %eax
1458ab23b:     	cmpq	$0x1, %rax
1458ab23f:     	jne	0x1458ab2e0 <.text+0x58aa2e0>
1458ab245:     	nopw	%cs:(%rax,%rax)
1458ab250:     	leaq	(%rsi,%r13), %rdi
1458ab254:     	incq	%rdi
1458ab257:     	addq	%r13, %rsi
1458ab25a:     	cmpq	%r14, %rsi
1458ab25d:     	jae	0x1458ab1d0 <.text+0x58aa1d0>
1458ab263:     	cmpb	$0x20, (%r15,%rsi)
1458ab268:     	jne	0x1458ab1d0 <.text+0x58aa1d0>
1458ab26e:     	movq	%rsi, %rbx
1458ab271:     	subq	-0x8(%rbp), %rbx
1458ab275:     	movq	-0x20(%rbp), %rax
1458ab279:     	subq	%r12, %rax
1458ab27c:     	cmpq	%rax, %rbx
1458ab27f:     	ja	0x1458ab2a8 <.text+0x58aa2a8>
1458ab281:     	movq	-0x8(%rbp), %rdx
1458ab285:     	cmpq	%rdx, %rsi
1458ab288:     	je	0x1458ab29c <.text+0x58aa29c>
1458ab28a:     	addq	%r15, %rdx
1458ab28d:     	movq	-0x18(%rbp), %rcx
1458ab291:     	addq	%r12, %rcx
1458ab294:     	movq	%rbx, %r8
1458ab297:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458ab29c:     	addq	%rbx, %r12
1458ab29f:     	movq	%r12, -0x10(%rbp)
1458ab2a3:     	jmp	0x1458ab1b5 <.text+0x58aa1b5>
1458ab2a8:     	movq	$0x1, 0x20(%rsp)
1458ab2b1:     	movl	$0x1, %r9d
1458ab2b7:     	leaq	-0x20(%rbp), %rcx
1458ab2bb:     	movq	%r12, %rdx
1458ab2be:     	movq	%rbx, %r8
1458ab2c1:     	callq	0x145bf3940 <.text+0x5bf2940>
1458ab2c6:     	nop
1458ab2c7:     	movq	-0x10(%rbp), %r12
1458ab2cb:     	movq	-0x8(%rbp), %rdx
1458ab2cf:     	cmpq	%rdx, %rsi
1458ab2d2:     	jne	0x1458ab28a <.text+0x58aa28a>
1458ab2d4:     	jmp	0x1458ab29c <.text+0x58aa29c>
1458ab2d6:     	nopw	%cs:(%rax,%rax)
1458ab2e0:     	movq	-0x20(%rbp), %rax
1458ab2e4:     	subq	%r12, %rax
1458ab2e7:     	cmpq	%rax, %rbx
1458ab2ea:     	ja	0x1458ab3ff <.text+0x58aa3ff>
1458ab2f0:     	movq	-0x18(%rbp), %rsi
1458ab2f4:     	movq	-0x8(%rbp), %rax
1458ab2f8:     	cmpq	%rax, %r14
1458ab2fb:     	je	0x1458ab30f <.text+0x58aa30f>
1458ab2fd:     	addq	%rax, %r15
1458ab300:     	leaq	(%rsi,%r12), %rcx
1458ab304:     	movq	%r15, %rdx
1458ab307:     	movq	%rbx, %r8
1458ab30a:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458ab30f:     	addq	%rbx, %r12
1458ab312:     	movq	-0x20(%rbp), %r14
1458ab316:     	movq	0x70(%rbp), %r9
1458ab31a:     	cmpq	%r9, %r12
1458ab31d:     	movq	-0x48(%rbp), %rdi
1458ab321:     	movq	-0x40(%rbp), %rbx
1458ab325:     	movq	-0x38(%rbp), %r15
1458ab329:     	jne	0x1458ab3e0 <.text+0x58aa3e0>
1458ab32f:     	cmpq	$0xf, %r9
1458ab333:     	jbe	0x1458ab390 <.text+0x58aa390>
1458ab335:     	movq	%rsi, %rcx
1458ab338:     	movq	%r9, %rdx
1458ab33b:     	movq	%rdi, %r8
1458ab33e:     	callq	0x140502660 <.text+0x501660>
1458ab343:     	testb	%al, %al
1458ab345:     	je	0x1458ab3e0 <.text+0x58aa3e0>
1458ab34b:     	testq	%r14, %r14
1458ab34e:     	je	0x1458ab361 <.text+0x58aa361>
1458ab350:     	movl	$0x1, %r8d
1458ab356:     	movq	%rsi, %rcx
1458ab359:     	movq	%r14, %rdx
1458ab35c:     	callq	0x1400021d0 <.text+0x11d0>
1458ab361:     	movq	-0x50(%rbp), %rdx
1458ab365:     	movzbl	0x50(%rdx), %eax
1458ab369:     	xorl	%ecx, %ecx
1458ab36b:     	nopl	(%rax,%rax)
1458ab370:     	cmpb	%al, (%rbx,%rcx)
1458ab373:     	je	0x1458ab438 <.text+0x58aa438>
1458ab379:     	incq	%rcx
1458ab37c:     	cmpq	%rcx, %r15
1458ab37f:     	jne	0x1458ab370 <.text+0x58aa370>
1458ab381:     	jmp	0x1458ab170 <.text+0x58aa170>
1458ab386:     	nopw	%cs:(%rax,%rax)
1458ab390:     	xorl	%eax, %eax
1458ab392:     	nopw	%cs:(%rax,%rax)
1458ab3a0:     	cmpq	%rax, %r9
1458ab3a3:     	je	0x1458ab34b <.text+0x58aa34b>
1458ab3a5:     	movzbl	(%rsi,%rax), %ecx
1458ab3a9:     	leal	-0x41(%rcx), %edx
1458ab3ac:     	cmpb	$0x1a, %dl
1458ab3af:     	setb	%dl
1458ab3b2:     	shlb	$0x5, %dl
1458ab3b5:     	orb	%cl, %dl
1458ab3b7:     	movzbl	(%rdi,%rax), %ecx
1458ab3bb:     	leal	-0x41(%rcx), %r8d
1458ab3bf:     	cmpb	$0x1a, %r8b
1458ab3c3:     	setb	%r8b
1458ab3c7:     	shlb	$0x5, %r8b
1458ab3cb:     	orb	%cl, %r8b
1458ab3ce:     	incq	%rax
1458ab3d1:     	cmpb	%r8b, %dl
1458ab3d4:     	je	0x1458ab3a0 <.text+0x58aa3a0>
1458ab3d6:     	nopw	%cs:(%rax,%rax)
1458ab3e0:     	testq	%r14, %r14
1458ab3e3:     	je	0x1458ab170 <.text+0x58aa170>
1458ab3e9:     	movl	$0x1, %r8d
1458ab3ef:     	movq	%rsi, %rcx
1458ab3f2:     	movq	%r14, %rdx
1458ab3f5:     	callq	0x1400021d0 <.text+0x11d0>
1458ab3fa:     	jmp	0x1458ab170 <.text+0x58aa170>
1458ab3ff:     	movq	$0x1, 0x20(%rsp)
1458ab408:     	movl	$0x1, %r9d
1458ab40e:     	leaq	-0x20(%rbp), %rcx
1458ab412:     	movq	%r12, %rdx
1458ab415:     	movq	%rbx, %r8
1458ab418:     	callq	0x145bf3940 <.text+0x5bf2940>
1458ab41d:     	nop
1458ab41e:     	movq	-0x10(%rbp), %r12
1458ab422:     	movq	-0x18(%rbp), %rsi
1458ab426:     	movq	-0x8(%rbp), %rax
1458ab42a:     	cmpq	%rax, %r14
1458ab42d:     	jne	0x1458ab2fd <.text+0x58aa2fd>
1458ab433:     	jmp	0x1458ab30f <.text+0x58aa30f>
1458ab438:     	addq	$0x50, %rdx
1458ab43c:     	movq	%rdx, %rbx
1458ab43f:     	movzbl	(%rbx), %ebx
1458ab442:     	callq	0x140002200 <.text+0x1200>
1458ab447:     	movl	$0x6, %ecx
1458ab44c:     	movl	$0x1, %edx
1458ab451:     	callq	0x1400021c0 <.text+0x11c0>
1458ab456:     	testq	%rax, %rax
1458ab459:     	je	0x1458ab4c9 <.text+0x58aa4c9>
1458ab45b:     	movw	$0x7265, 0x4(%rax)      # imm = 0x7265
1458ab461:     	movl	$0x74736554, (%rax)     # imm = 0x74736554
1458ab467:     	movq	-0x28(%rbp), %rcx
1458ab46b:     	movzbl	0x8c(%rcx), %ecx
1458ab472:     	movq	-0x30(%rbp), %rdx
1458ab476:     	movb	$0x0, 0x37(%rdx)
1458ab47a:     	movl	$0x0, 0x33(%rdx)
1458ab481:     	movq	$0xffffff, 0x18(%rdx)   # imm = 0xFFFFFF
1458ab489:     	movq	$0x6, (%rdx)
1458ab490:     	movq	%rax, 0x8(%rdx)
1458ab494:     	movq	$0x6, 0x10(%rdx)
1458ab49c:     	movb	%bl, 0x30(%rdx)
1458ab49f:     	movb	%cl, 0x31(%rdx)
1458ab4a2:     	movb	$0x0, 0x32(%rdx)
1458ab4a6:     	movss	0x544512(%rip), %xmm0   # 0x145def9c0
1458ab4ae:     	movups	%xmm0, 0x20(%rdx)
1458ab4b2:     	movq	%rdx, %rax
1458ab4b5:     	addq	$0x88, %rsp
1458ab4bc:     	popq	%rbx
1458ab4bd:     	popq	%rdi
1458ab4be:     	popq	%rsi
1458ab4bf:     	popq	%r12
1458ab4c1:     	popq	%r13
1458ab4c3:     	popq	%r14
1458ab4c5:     	popq	%r15
1458ab4c7:     	popq	%rbp
1458ab4c8:     	retq
1458ab4c9:     	movl	$0x1, %ecx
1458ab4ce:     	movl	$0x6, %edx
1458ab4d3:     	callq	0x145d9370b <.text+0x5d9270b>
1458ab4d8:     	ud2
