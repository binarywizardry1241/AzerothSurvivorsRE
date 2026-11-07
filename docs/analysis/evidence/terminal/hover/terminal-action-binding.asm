
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140286380:     	pushq	%rbp
140286381:     	pushq	%r15
140286383:     	pushq	%r14
140286385:     	pushq	%r13
140286387:     	pushq	%r12
140286389:     	pushq	%rsi
14028638a:     	pushq	%rdi
14028638b:     	pushq	%rbx
14028638c:     	subq	$0x298, %rsp            # imm = 0x298
140286393:     	leaq	0x80(%rsp), %rbp
14028639b:     	movq	$-0x2, 0x210(%rbp)
1402863a6:     	movq	%r8, %rdi
1402863a9:     	movq	%rcx, %rsi
1402863ac:     	cmpq	$-0x1, 0x100(%rdx)
1402863b4:     	je	0x1402863fe <.text+0x2853fe>
1402863b6:     	movq	0x5a0(%rdi), %rax
1402863bd:     	movq	%rax, 0xe0(%rbp)
1402863c4:     	cmpq	%rax, 0x8(%rdx)
1402863c8:     	je	0x1402864d3 <.text+0x2854d3>
1402863ce:     	addq	$0x8, %rdx
1402863d2:     	leaq	0x5b3b2ff(%rip), %rax   # 0x145dc16d8
1402863d9:     	movq	%rax, 0x28(%rsp)
1402863de:     	movq	$0x83, 0x20(%rsp)
1402863e7:     	leaq	0x5b3b2a2(%rip), %r9    # 0x145dc1690
1402863ee:     	leaq	0xe0(%rbp), %r8
1402863f5:     	xorl	%ecx, %ecx
1402863f7:     	callq	0x145d18b6d <.text+0x5d17b6d>
1402863fc:     	ud2
1402863fe:     	movq	%rdx, %r13
140286401:     	leaq	0xe0(%rbp), %rcx
140286408:     	movq	%rdi, %rdx
14028640b:     	callq	0x140397ce0 <.text+0x396ce0>
140286410:     	nop
140286411:     	movq	%rdi, %rcx
140286414:     	callq	0x140029490 <.text+0x28490>
140286419:     	nop
14028641a:     	movq	%rax, %rbx
14028641d:     	leaq	0x40(%rdi), %rax
140286421:     	leaq	0x5a8(%rdi), %rcx
140286428:     	movq	%rax, -0x38(%rbp)
14028642c:     	movq	%rcx, -0x30(%rbp)
140286430:     	movq	$0x0, -0x50(%rbp)
140286438:     	movq	$0x8, -0x48(%rbp)
140286440:     	movq	$0x0, -0x40(%rbp)
140286448:     	leaq	0x5ae7fe1(%rip), %rdx   # 0x145d6e430
14028644f:     	leaq	-0x50(%rbp), %rcx
140286453:     	callq	0x140005280 <.text+0x4280>
140286458:     	nop
140286459:     	movq	%rax, %r14
14028645c:     	movq	-0x50(%rbp), %rdx
140286460:     	testq	%rdx, %rdx
140286463:     	je	0x140286479 <.text+0x285479>
140286465:     	movq	-0x48(%rbp), %rcx
140286469:     	shlq	$0x3, %rdx
14028646d:     	movl	$0x8, %r8d
140286473:     	callq	0x1400021d0 <.text+0x11d0>
140286478:     	nop
140286479:     	movq	%rdi, %rcx
14028647c:     	callq	0x140027ff0 <.text+0x26ff0>
140286481:     	nop
140286482:     	movq	%rax, %r15
140286485:     	leaq	-0x50(%rbp), %r12
140286489:     	leaq	0xe0(%rbp), %rdx
140286490:     	movl	$0x130, %r8d            # imm = 0x130
140286496:     	movq	%r12, %rcx
140286499:     	callq	0x145bc977b <.text+0x5bc877b>
14028649e:     	movq	0x5a0(%rdi), %rax
1402864a5:     	movq	%rax, 0x8(%r13)
1402864a9:     	leaq	0x10(%r13), %rcx
1402864ad:     	movl	$0x130, %r8d            # imm = 0x130
1402864b3:     	movq	%r12, %rdx
1402864b6:     	callq	0x145bc977b <.text+0x5bc877b>
1402864bb:     	movq	%r13, %rdx
1402864be:     	movq	%rbx, 0x140(%r13)
1402864c5:     	movq	%r14, 0x148(%r13)
1402864cc:     	movq	%r15, 0x150(%r13)
1402864d3:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1402864d8:     	addl	0x5b0(%rdi), %eax
1402864de:     	movl	%eax, (%rdx)
1402864e0:     	movq	$0x10, 0xf8(%rbp)
1402864eb:     	xorps	%xmm0, %xmm0
1402864ee:     	movups	%xmm0, 0x100(%rbp)
1402864f5:     	movq	$0x10, 0x110(%rbp)
140286500:     	movups	%xmm0, 0x118(%rbp)
140286507:     	movq	$0x10, 0x128(%rbp)
140286512:     	movups	%xmm0, 0x130(%rbp)
140286519:     	movq	$0x10, 0x140(%rbp)
140286524:     	movups	%xmm0, 0x148(%rbp)
14028652b:     	movq	$0x10, 0x158(%rbp)
140286536:     	movq	$0x0, 0xe0(%rbp)
140286541:     	movups	%xmm0, 0x160(%rbp)
140286548:     	movl	$0x0, 0x170(%rbp)
140286552:     	movq	$0x8, 0xe8(%rbp)
14028655d:     	movq	$0x0, 0xf0(%rbp)
140286568:     	leaq	0x10(%rdx), %rcx
14028656c:     	leaq	0xe0(%rbp), %r8
140286573:     	movq	%rdi, %r9
140286576:     	callq	0x1400bd590 <.text+0xbc590>
14028657b:     	nop
14028657c:     	leaq	0xe0(%rbp), %rdx
140286583:     	movl	$0x98, %r8d
140286589:     	movq	%rsi, %rcx
14028658c:     	callq	0x145bc977b <.text+0x5bc877b>
140286591:     	movq	%rsi, %rax
140286594:     	addq	$0x298, %rsp            # imm = 0x298
14028659b:     	popq	%rbx
14028659c:     	popq	%rdi
14028659d:     	popq	%rsi
14028659e:     	popq	%r12
1402865a0:     	popq	%r13
1402865a2:     	popq	%r14
1402865a4:     	popq	%r15
1402865a6:     	popq	%rbp
1402865a7:     	retq
1402865a8:     	nopl	(%rax,%rax)
1402865b0:     	movq	%rdx, 0x10(%rsp)
1402865b5:     	pushq	%rbp
1402865b6:     	pushq	%r15
1402865b8:     	pushq	%r14
1402865ba:     	pushq	%r13
1402865bc:     	pushq	%r12
1402865be:     	pushq	%rsi
1402865bf:     	pushq	%rdi
1402865c0:     	pushq	%rbx
1402865c1:     	subq	$0x38, %rsp
1402865c5:     	leaq	0x80(%rdx), %rbp
1402865cc:     	leaq	0xe0(%rbp), %rcx
1402865d3:     	callq	0x14003b160 <.text+0x3a160>
1402865d8:     	nop
1402865d9:     	addq	$0x38, %rsp
1402865dd:     	popq	%rbx
1402865de:     	popq	%rdi
1402865df:     	popq	%rsi
1402865e0:     	popq	%r12
1402865e2:     	popq	%r13
1402865e4:     	popq	%r14
1402865e6:     	popq	%r15
1402865e8:     	popq	%rbp
1402865e9:     	retq
1402865ea:     	nopw	(%rax,%rax)
1402865f0:     	movq	%rdx, 0x10(%rsp)
1402865f5:     	pushq	%rbp
1402865f6:     	pushq	%r15
1402865f8:     	pushq	%r14
1402865fa:     	pushq	%r13
1402865fc:     	pushq	%r12
1402865fe:     	pushq	%rsi
1402865ff:     	pushq	%rdi
140286600:     	pushq	%rbx
140286601:     	subq	$0x38, %rsp
140286605:     	leaq	0x80(%rdx), %rbp
14028660c:     	movq	-0x50(%rbp), %rdx
140286610:     	testq	%rdx, %rdx
140286613:     	je	0x140286629 <.text+0x285629>
140286615:     	movq	-0x48(%rbp), %rcx
140286619:     	shlq	$0x3, %rdx
14028661d:     	movl	$0x8, %r8d
140286623:     	callq	0x1400021d0 <.text+0x11d0>
140286628:     	nop
140286629:     	addq	$0x38, %rsp
14028662d:     	popq	%rbx
14028662e:     	popq	%rdi
14028662f:     	popq	%rsi
140286630:     	popq	%r12
140286632:     	popq	%r13
140286634:     	popq	%r14
140286636:     	popq	%r15
140286638:     	popq	%rbp
140286639:     	retq
14028663a:     	nopw	(%rax,%rax)
140286640:     	movq	%rdx, 0x10(%rsp)
140286645:     	pushq	%rbp
140286646:     	pushq	%r15
140286648:     	pushq	%r14
14028664a:     	pushq	%r13
14028664c:     	pushq	%r12
14028664e:     	pushq	%rsi
14028664f:     	pushq	%rdi
140286650:     	pushq	%rbx
140286651:     	subq	$0x38, %rsp
140286655:     	leaq	0x80(%rdx), %rbp
14028665c:     	leaq	0xe0(%rbp), %rcx
140286663:     	callq	0x14003c7e0 <.text+0x3b7e0>
140286668:     	nop
140286669:     	addq	$0x38, %rsp
14028666d:     	popq	%rbx
14028666e:     	popq	%rdi
14028666f:     	popq	%rsi
140286670:     	popq	%r12
140286672:     	popq	%r13
140286674:     	popq	%r14
140286676:     	popq	%r15
140286678:     	popq	%rbp
140286679:     	retq
14028667a:     	int3
14028667b:     	int3
14028667c:     	int3
14028667d:     	int3
14028667e:     	int3
14028667f:     	int3
140286680:     	pushq	%r15
140286682:     	pushq	%r14
140286684:     	pushq	%r13
140286686:     	pushq	%r12
140286688:     	pushq	%rsi
140286689:     	pushq	%rdi
14028668a:     	pushq	%rbp
14028668b:     	pushq	%rbx
14028668c:     	subq	$0xb8, %rsp
140286693:     	movl	$0x1, %ebp
140286698:     	lock
140286699:     	xaddl	%ebp, 0x5b0(%r8)
1402866a1:     	cmpq	$-0x1, 0x100(%rdx)
1402866a9:     	je	0x140286881 <.text+0x285881>
1402866af:     	movq	%r8, %rbx
1402866b2:     	movq	%rdx, %rsi
1402866b5:     	movq	0x5a0(%r8), %rax
1402866bc:     	movq	%rax, 0x40(%rsp)
1402866c1:     	cmpq	%rax, 0x8(%rdx)
1402866c5:     	jne	0x14028689b <.text+0x28589b>
1402866cb:     	movq	%rcx, %rdi
1402866ce:     	leaq	0x10(%rsi), %rcx
1402866d2:     	movl	(%rsi), %r15d
1402866d5:     	movq	%rbx, %rdx
1402866d8:     	callq	0x1403970d0 <.text+0x3960d0>
1402866dd:     	movq	0x140(%rsi), %rax
1402866e4:     	movq	0x218(%rbx), %rcx
1402866eb:     	cmpq	%rcx, %rax
1402866ee:     	jae	0x1402868cc <.text+0x2858cc>
1402866f4:     	movq	0x210(%rbx), %r8
1402866fb:     	movq	(%r8,%rax,8), %rax
1402866ff:     	testq	%rax, %rax
140286702:     	je	0x1402868cc <.text+0x2858cc>
140286708:     	movq	0x1e0(%rbx), %rdx
14028670f:     	notq	%rax
140286712:     	imulq	$0x38, %rax, %rax
140286716:     	cmpb	$0x0, 0x30(%rdx,%rax)
14028671b:     	je	0x1402868cc <.text+0x2858cc>
140286721:     	movq	0x148(%rsi), %r9
140286728:     	cmpq	%rcx, %r9
14028672b:     	jae	0x14028690a <.text+0x28590a>
140286731:     	movq	(%r8,%r9,8), %rcx
140286735:     	testq	%rcx, %rcx
140286738:     	je	0x14028690a <.text+0x28590a>
14028673e:     	notq	%rcx
140286741:     	imulq	$0x38, %rcx, %rcx
140286745:     	cmpb	$0x0, 0x30(%rdx,%rcx)
14028674a:     	je	0x14028690a <.text+0x28590a>
140286750:     	addq	%rdx, %rax
140286753:     	movq	0x10(%rax), %r9
140286757:     	addq	%rdx, %rcx
14028675a:     	movq	0x10(%rcx), %rdx
14028675e:     	movl	0x5b0(%rbx), %r8d
140286765:     	movq	0x150(%rsi), %r8
14028676c:     	cmpq	0x218(%rbx), %r8
140286773:     	jae	0x1402868cc <.text+0x2858cc>
140286779:     	movq	0x210(%rbx), %r10
140286780:     	movq	(%r10,%r8,8), %r8
140286784:     	testq	%r8, %r8
140286787:     	je	0x1402868cc <.text+0x2858cc>
14028678d:     	movq	0x1e0(%rbx), %r10
140286794:     	notq	%r8
140286797:     	imulq	$0x38, %r8, %r8
14028679b:     	cmpb	$0x0, 0x30(%r10,%r8)
1402867a1:     	je	0x1402868cc <.text+0x2858cc>
1402867a7:     	addq	%r8, %r10
1402867aa:     	leaq	0x2c(%rcx), %r11
1402867ae:     	addq	$0x28, %rcx
1402867b2:     	leaq	0x2c(%rax), %r12
1402867b6:     	addq	$0x28, %rax
1402867ba:     	movq	0x10(%r10), %r13
1402867be:     	leaq	0x28(%r10), %r14
1402867c2:     	addq	$0x2c, %r10
1402867c6:     	leaq	0x10(%rsi), %r8
1402867ca:     	movq	%r8, 0x40(%rsp)
1402867cf:     	movq	%rbx, 0x48(%rsp)
1402867d4:     	movl	%r15d, 0x50(%rsp)
1402867d9:     	movl	%ebp, 0x54(%rsp)
1402867dd:     	leaq	0x58(%rsp), %r8
1402867e2:     	movq	%r9, 0x58(%rsp)
1402867e7:     	movq	%rax, 0x60(%rsp)
1402867ec:     	movq	%r12, 0x68(%rsp)
1402867f1:     	movl	%r15d, 0x70(%rsp)
1402867f6:     	movl	%ebp, 0x74(%rsp)
1402867fa:     	leaq	0x78(%rsp), %r9
1402867ff:     	movq	%rdx, 0x78(%rsp)
140286804:     	movq	%rcx, 0x80(%rsp)
14028680c:     	movq	%r11, 0x88(%rsp)
140286814:     	movl	%r15d, 0x90(%rsp)
14028681c:     	movl	%ebp, 0x94(%rsp)
140286823:     	leaq	0x98(%rsp), %rax
14028682b:     	movq	%r13, 0x98(%rsp)
140286833:     	movq	%r14, 0xa0(%rsp)
14028683b:     	movq	%r10, 0xa8(%rsp)
140286843:     	movl	%r15d, 0xb0(%rsp)
14028684b:     	movl	%ebp, 0xb4(%rsp)
140286852:     	movq	%rax, 0x20(%rsp)
140286857:     	leaq	0x40(%rsp), %rdx
14028685c:     	callq	0x140275bc0 <.text+0x274bc0>
140286861:     	movl	%ebp, (%rsi)
140286863:     	movq	$-0x3, (%rdi)
14028686a:     	movq	%rdi, %rax
14028686d:     	addq	$0xb8, %rsp
140286874:     	popq	%rbx
140286875:     	popq	%rbp
140286876:     	popq	%rdi
140286877:     	popq	%rsi
140286878:     	popq	%r12
14028687a:     	popq	%r13
14028687c:     	popq	%r14
14028687e:     	popq	%r15
140286880:     	retq
140286881:     	leaq	0x5b3ae68(%rip), %rcx   # 0x145dc16f0
140286888:     	leaq	0x5b3aec1(%rip), %r8    # 0x145dc1750
14028688f:     	movl	$0x59, %edx
140286894:     	callq	0x145d69700 <.text+0x5d68700>
140286899:     	ud2
14028689b:     	addq	$0x8, %rsi
14028689f:     	leaq	0x5b3af32(%rip), %rax   # 0x145dc17d8
1402868a6:     	movq	%rax, 0x28(%rsp)
1402868ab:     	movq	$0xdf, 0x20(%rsp)
1402868b4:     	leaq	0x5b3aead(%rip), %r9    # 0x145dc1768
1402868bb:     	leaq	0x40(%rsp), %r8
1402868c0:     	xorl	%ecx, %ecx
1402868c2:     	movq	%rsi, %rdx
1402868c5:     	callq	0x145d18b6d <.text+0x5d17b6d>
1402868ca:     	ud2
1402868cc:     	addq	$0x4, %rsi
1402868d0:     	movq	%rsi, 0x40(%rsp)
1402868d5:     	leaq	0x4d5fd94(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
1402868dc:     	movq	%rax, 0x48(%rsp)
1402868e1:     	leaq	0x3f(%rsp), %rcx
1402868e6:     	movq	%rcx, 0x50(%rsp)
1402868eb:     	movq	%rax, 0x58(%rsp)
1402868f0:     	leaq	0x5b3aa61(%rip), %rcx   # 0x145dc1358
1402868f7:     	leaq	0x5b3aafa(%rip), %r8    # 0x145dc13f8
1402868fe:     	leaq	0x40(%rsp), %rdx
140286903:     	callq	0x145d699c0 <.text+0x5d689c0>
140286908:     	ud2
14028690a:     	addq	$0x4, %rsi
14028690e:     	movq	%rsi, 0x40(%rsp)
140286913:     	leaq	0x4d5fd56(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
14028691a:     	movq	%rax, 0x48(%rsp)
14028691f:     	leaq	0x3f(%rsp), %rcx
140286924:     	movq	%rcx, 0x50(%rsp)
140286929:     	movq	%rax, 0x58(%rsp)
14028692e:     	leaq	0x5b3aa23(%rip), %rcx   # 0x145dc1358
140286935:     	leaq	0x5b3aad4(%rip), %r8    # 0x145dc1410
14028693c:     	leaq	0x40(%rsp), %rdx
140286941:     	callq	0x145d699c0 <.text+0x5d689c0>
140286946:     	ud2
