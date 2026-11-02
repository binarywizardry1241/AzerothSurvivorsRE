
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14026f450:     	pushq	%rbp
14026f451:     	pushq	%r15
14026f453:     	pushq	%r14
14026f455:     	pushq	%r13
14026f457:     	pushq	%r12
14026f459:     	pushq	%rsi
14026f45a:     	pushq	%rdi
14026f45b:     	pushq	%rbx
14026f45c:     	subq	$0x368, %rsp            # imm = 0x368
14026f463:     	leaq	0x80(%rsp), %rbp
14026f46b:     	movapd	%xmm10, 0x2d0(%rbp)
14026f474:     	movapd	%xmm9, 0x2c0(%rbp)
14026f47d:     	movapd	%xmm8, 0x2b0(%rbp)
14026f486:     	movapd	%xmm7, 0x2a0(%rbp)
14026f48e:     	movapd	%xmm6, 0x290(%rbp)
14026f496:     	movq	$-0x2, 0x288(%rbp)
14026f4a1:     	movq	%rdx, %rbx
14026f4a4:     	movq	%rcx, %r12
14026f4a7:     	movq	0x390(%rbp), %rdx
14026f4ae:     	movq	0x360(%rbp), %rax
14026f4b5:     	cmpb	$0x0, 0xe8(%rbx)
14026f4bc:     	je	0x14026f539 <.text+0x26e539>
14026f4be:     	cmpq	$0x0, (%r8)
14026f4c2:     	je	0x14026fac3 <.text+0x26eac3>
14026f4c8:     	movupd	(%r8), %xmm0
14026f4cd:     	movupd	0x10(%r8), %xmm1
14026f4d3:     	movapd	%xmm1, -0x30(%rbp)
14026f4d8:     	movapd	%xmm0, -0x40(%rbp)
14026f4dd:     	movq	(%rax), %r8
14026f4e0:     	movq	0x8(%rax), %rax
14026f4e4:     	movq	0xf8(%r8), %rcx
14026f4eb:     	movq	0x100(%r8), %rdx
14026f4f2:     	cmpb	$0x0, 0x108(%r8)
14026f4fa:     	je	0x14026f596 <.text+0x26e596>
14026f500:     	shlq	$0x2, %rdx
14026f504:     	xorl	%r8d, %r8d
14026f507:     	nopw	(%rax,%rax)
14026f510:     	cmpq	%r8, %rdx
14026f513:     	je	0x14026f742 <.text+0x26e742>
14026f519:     	movl	(%rcx,%r8), %r10d
14026f51d:     	movq	0x1a8(%rax), %r11
14026f524:     	leaq	(%r10,%r10,8), %r10
14026f528:     	addq	$0x4, %r8
14026f52c:     	cmpq	$0x0, 0x10(%r11,%r10,8)
14026f532:     	je	0x14026f510 <.text+0x26e510>
14026f534:     	jmp	0x14026f5c8 <.text+0x26e5c8>
14026f539:     	movq	(%rax), %rcx
14026f53c:     	movq	0x8(%rax), %rbx
14026f540:     	movq	0xf8(%rcx), %r14
14026f547:     	movq	0x100(%rcx), %rax
14026f54e:     	leaq	(%r14,%rax,4), %r15
14026f552:     	movzbl	0x108(%rcx), %r8d
14026f55a:     	movq	0x20(%r12), %r9
14026f55f:     	movupd	(%r12), %xmm6
14026f565:     	movupd	0x10(%r12), %xmm7
14026f56c:     	movq	0x10(%r12), %r10
14026f571:     	movl	$0x8, %edi
14026f576:     	xorl	%r12d, %r12d
14026f579:     	leaq	0x5b511c0(%rip), %r11   # 0x145dc0740
14026f580:     	xorl	%esi, %esi
14026f582:     	movl	$0x8, %r13d
14026f588:     	testb	%r8b, %r8b
14026f58b:     	je	0x14026fa30 <.text+0x26ea30>
14026f591:     	jmp	0x14026fa8a <.text+0x26ea8a>
14026f596:     	shlq	$0x2, %rdx
14026f59a:     	xorl	%r8d, %r8d
14026f59d:     	nopl	(%rax)
14026f5a0:     	cmpq	%r8, %rdx
14026f5a3:     	je	0x14026f742 <.text+0x26e742>
14026f5a9:     	movl	(%rcx,%r8), %r10d
14026f5ad:     	movq	0x108(%rax), %r11
14026f5b4:     	leaq	(%r10,%r10,4), %r10
14026f5b8:     	shlq	$0x5, %r10
14026f5bc:     	addq	$0x4, %r8
14026f5c0:     	cmpq	$0x0, 0x58(%r11,%r10)
14026f5c6:     	je	0x14026f5a0 <.text+0x26e5a0>
14026f5c8:     	cmpb	$-0x1, 0x60(%rbx)
14026f5cc:     	je	0x14026fac3 <.text+0x26eac3>
14026f5d2:     	movq	%r9, -0x18(%rbp)
14026f5d6:     	movq	0x368(%rbp), %rax
14026f5dd:     	movq	(%rax), %rsi
14026f5e0:     	movq	0x8(%rax), %rdx
14026f5e4:     	movl	0x18(%rax), %eax
14026f5e7:     	movl	%eax, 0x254(%rbp)
14026f5ed:     	movq	%rsi, %rcx
14026f5f0:     	movq	%rdx, 0x280(%rbp)
14026f5f7:     	callq	0x140376e00 <.text+0x375e00>
14026f5fc:     	movq	0xf8(%rsi), %rcx
14026f603:     	movq	0x100(%rsi), %rdx
14026f60a:     	movq	%rsi, 0x278(%rbp)
14026f611:     	movzbl	0x108(%rsi), %r8d
14026f619:     	testb	%r8b, %r8b
14026f61c:     	movq	%rbx, 0x270(%rbp)
14026f623:     	leaq	(,%rdx,4), %r10
14026f62b:     	movq	%rcx, %rax
14026f62e:     	je	0x14026f6a0 <.text+0x26e6a0>
14026f630:     	testq	%r10, %r10
14026f633:     	je	0x14026fafd <.text+0x26eafd>
14026f639:     	movl	(%rax), %r9d
14026f63c:     	addq	$0x4, %rax
14026f640:     	movq	0x280(%rbp), %r11
14026f647:     	movq	0x1a8(%r11), %r11
14026f64e:     	leaq	(%r9,%r9,8), %rsi
14026f652:     	movq	0x10(%r11,%rsi,8), %r9
14026f657:     	addq	$-0x4, %r10
14026f65b:     	testq	%r9, %r9
14026f65e:     	je	0x14026f630 <.text+0x26e630>
14026f660:     	leaq	(%r11,%rsi,8), %r10
14026f664:     	movq	0x278(%rbp), %r11
14026f66b:     	movq	0x110(%r11), %r11
14026f672:     	movq	0x18(%r10), %rdi
14026f676:     	movq	0x38(%r10), %r10
14026f67a:     	movq	(%r10,%r11,8), %r10
14026f67e:     	notq	%r10
14026f681:     	leaq	(%r10,%r10,2), %r10
14026f685:     	shlq	$0x4, %r10
14026f689:     	movq	0x10(%rdi,%r10), %rsi
14026f68e:     	movq	0x28(%rdi,%r10), %rdi
14026f693:     	movl	$0x1, %r10d
14026f699:     	jmp	0x14026fb16 <.text+0x26eb16>
14026f69e:     	nop
14026f6a0:     	testq	%r10, %r10
14026f6a3:     	je	0x14026fb07 <.text+0x26eb07>
14026f6a9:     	movl	(%rax), %r9d
14026f6ac:     	addq	$0x4, %rax
14026f6b0:     	movq	0x280(%rbp), %r11
14026f6b7:     	movq	0x108(%r11), %r11
14026f6be:     	leaq	(%r9,%r9,4), %rsi
14026f6c2:     	shlq	$0x5, %rsi
14026f6c6:     	movq	0x58(%r11,%rsi), %r9
14026f6cb:     	addq	$-0x4, %r10
14026f6cf:     	testq	%r9, %r9
14026f6d2:     	je	0x14026f6a0 <.text+0x26e6a0>
14026f6d4:     	addq	%rsi, %r11
14026f6d7:     	movl	0x94(%r11), %r10d
14026f6de:     	movq	0x280(%rbp), %rsi
14026f6e5:     	movq	0x1a8(%rsi), %rsi
14026f6ec:     	leaq	(%r10,%r10,8), %r10
14026f6f0:     	movq	0x278(%rbp), %rdi
14026f6f7:     	movq	0x110(%rdi), %rdi
14026f6fe:     	movq	0x18(%rsi,%r10,8), %rbx
14026f703:     	movq	0x38(%rsi,%r10,8), %r10
14026f708:     	movq	(%r10,%rdi,8), %r10
14026f70c:     	notq	%r10
14026f70f:     	movq	0x50(%r11), %r11
14026f713:     	movl	0x8(%r11), %edi
14026f717:     	leaq	(%r10,%r10,2), %r10
14026f71b:     	shlq	$0x4, %r10
14026f71f:     	notl	%edi
14026f721:     	leaq	(%rdi,%rdi,2), %rsi
14026f725:     	shlq	$0x3, %rsi
14026f729:     	addq	0x10(%rbx,%r10), %rsi
14026f72e:     	shlq	$0x2, %rdi
14026f732:     	addq	0x28(%rbx,%r10), %rdi
14026f737:     	movl	$0x1, %r10d
14026f73d:     	jmp	0x14026fb0f <.text+0x26eb0f>
14026f742:     	movq	0x350(%rbp), %rax
14026f749:     	movq	-0x40(%rbp), %rdi
14026f74d:     	movq	(%r9), %rbx
14026f750:     	movzbl	0x38(%rax), %eax
14026f754:     	movb	%al, 0x230(%rbp)
14026f75a:     	movups	0x5b50caf(%rip), %xmm0  # 0x145dc0410
14026f761:     	movaps	%xmm0, 0x190(%rbp)
14026f768:     	movq	$0x0, 0x1a0(%rbp)
14026f773:     	movups	0x5b50cae(%rip), %xmm1  # 0x145dc0428
14026f77a:     	movups	%xmm1, 0x1a8(%rbp)
14026f781:     	movq	$0x0, 0x1b8(%rbp)
14026f78c:     	movups	0x5b50cad(%rip), %xmm1  # 0x145dc0440
14026f793:     	movaps	%xmm1, 0x1c0(%rbp)
14026f79a:     	movq	$0x0, 0x1d0(%rbp)
14026f7a5:     	movupd	0x5b50cab(%rip), %xmm2  # 0x145dc0458
14026f7ad:     	movupd	%xmm2, 0x1d8(%rbp)
14026f7b5:     	movq	$0x0, 0x1e8(%rbp)
14026f7c0:     	movaps	%xmm0, -0x10(%rbp)
14026f7c4:     	movaps	%xmm1, 0x20(%rbp)
14026f7c8:     	movq	0x1a0(%rbp), %rax
14026f7cf:     	movq	%rax, (%rbp)
14026f7d3:     	movq	0x1a8(%rbp), %rax
14026f7da:     	movq	%rax, 0x8(%rbp)
14026f7de:     	movq	0x1b0(%rbp), %rax
14026f7e5:     	movq	%rax, 0x10(%rbp)
14026f7e9:     	movq	0x1b8(%rbp), %rax
14026f7f0:     	movq	%rax, 0x18(%rbp)
14026f7f4:     	movq	0x1d0(%rbp), %rax
14026f7fb:     	movq	%rax, 0x30(%rbp)
14026f7ff:     	movq	0x1d8(%rbp), %rax
14026f806:     	movq	%rax, 0x38(%rbp)
14026f80a:     	movaps	0x1e0(%rbp), %xmm0
14026f811:     	movaps	%xmm0, 0x40(%rbp)
14026f815:     	xorps	%xmm0, %xmm0
14026f818:     	movaps	%xmm0, 0x60(%rbp)
14026f81c:     	movaps	%xmm0, 0x50(%rbp)
14026f820:     	movq	$0x0, 0x70(%rbp)
14026f828:     	movapd	0x5afdfd0(%rip), %xmm1  # 0x145d6d800
14026f830:     	movupd	%xmm1, 0x78(%rbp)
14026f835:     	movups	%xmm0, 0x98(%rbp)
14026f83c:     	movups	%xmm0, 0x88(%rbp)
14026f843:     	movups	0x5b50c8e(%rip), %xmm0  # 0x145dc04d8
14026f84a:     	movups	%xmm0, 0xb8(%rbp)
14026f851:     	movups	0x5b50c70(%rip), %xmm0  # 0x145dc04c8
14026f858:     	movups	%xmm0, 0xa8(%rbp)
14026f85f:     	movups	0x5b50c92(%rip), %xmm0  # 0x145dc04f8
14026f866:     	movups	%xmm0, 0xd8(%rbp)
14026f86d:     	movups	0x5b50c74(%rip), %xmm0  # 0x145dc04e8
14026f874:     	movups	%xmm0, 0xc8(%rbp)
14026f87b:     	movups	0x5b50c96(%rip), %xmm0  # 0x145dc0518
14026f882:     	movups	%xmm0, 0xf8(%rbp)
14026f889:     	movups	0x5b50c78(%rip), %xmm0  # 0x145dc0508
14026f890:     	movups	%xmm0, 0xe8(%rbp)
14026f897:     	movups	0x5b50c9a(%rip), %xmm0  # 0x145dc0538
14026f89e:     	movups	%xmm0, 0x118(%rbp)
14026f8a5:     	movups	0x5b50c7c(%rip), %xmm0  # 0x145dc0528
14026f8ac:     	movups	%xmm0, 0x108(%rbp)
14026f8b3:     	movapd	0x5afd9a5(%rip), %xmm0  # 0x145d6d260
14026f8bb:     	movupd	%xmm0, 0x128(%rbp)
14026f8c3:     	movl	$0x1, 0x138(%rbp)
14026f8cd:     	movq	$0x0, 0x13c(%rbp)
14026f8d8:     	movb	$0x1, 0x144(%rbp)
14026f8df:     	movq	$0x0, 0x148(%rbp)
14026f8ea:     	movl	$0x3f800000, 0x150(%rbp) # imm = 0x3F800000
14026f8f4:     	movw	$0x0, 0x154(%rbp)
14026f8fd:     	movw	$0x0, 0x15a(%rbp)
14026f906:     	movl	$0x10000, 0x156(%rbp)   # imm = 0x10000
14026f910:     	movw	$0x0, 0x160(%rbp)
14026f919:     	movl	$0x10000, 0x15c(%rbp)   # imm = 0x10000
14026f923:     	movw	$0x100, 0x162(%rbp)     # imm = 0x100
14026f92c:     	movw	$0x0, 0x16c(%rbp)
14026f935:     	movq	$0x0, 0x164(%rbp)
14026f940:     	movl	$0xfa0, 0x170(%rbp)     # imm = 0xFA0
14026f94a:     	movw	$0x0, 0x174(%rbp)
14026f953:     	leaq	0x5b50eee(%rip), %r9    # 0x145dc0848
14026f95a:     	leaq	0x190(%rbp), %rsi
14026f961:     	leaq	-0x10(%rbp), %r8
14026f965:     	movq	%rsi, %rcx
14026f968:     	movq	%r12, %rdx
14026f96b:     	callq	0x14019fe30 <.text+0x19ee30>
14026f970:     	movq	%rdi, -0x10(%rbp)
14026f974:     	movq	%rbx, -0x8(%rbp)
14026f978:     	leaq	0x230(%rbp), %rax
14026f97f:     	movq	%rax, (%rbp)
14026f983:     	leaq	-0x10(%rbp), %rdx
14026f987:     	movq	%rsi, %rcx
14026f98a:     	callq	0x1401b8700 <.text+0x1b7700>
14026f98f:     	jmp	0x14026fac3 <.text+0x26eac3>
14026f994:     	testq	%r10, %r10
14026f997:     	movq	0x260(%rbp), %rcx
14026f99e:     	cmovneq	%r9, %rcx
14026f9a2:     	movq	%rax, -0x10(%rbp)
14026f9a6:     	movupd	%xmm6, -0x8(%rbp)
14026f9ab:     	movupd	%xmm7, 0x8(%rbp)
14026f9b0:     	movq	%rcx, 0x260(%rbp)
14026f9b7:     	movq	%rcx, 0x18(%rbp)
14026f9bb:     	leaq	-0x10(%rbp), %rcx
14026f9bf:     	movq	%r11, %rdx
14026f9c2:     	movb	%r8b, 0x280(%rbp)
14026f9c9:     	movq	%r9, 0x278(%rbp)
14026f9d0:     	movq	%r10, 0x270(%rbp)
14026f9d7:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
14026f9dc:     	leaq	0x5b50d5d(%rip), %r11   # 0x145dc0740
14026f9e3:     	movq	0x270(%rbp), %r10
14026f9ea:     	movq	0x278(%rbp), %r9
14026f9f1:     	movzbl	0x280(%rbp), %r8d
14026f9f9:     	movq	0x390(%rbp), %rdx
14026fa00:     	testb	%r8b, %r8b
14026fa03:     	je	0x14026fa30 <.text+0x26ea30>
14026fa05:     	jmp	0x14026fa8a <.text+0x26ea8a>
14026fa0a:     	nopw	(%rax,%rax)
14026fa10:     	addq	%rcx, %rax
14026fa13:     	movq	0x50(%rax), %rdi
14026fa17:     	xorl	%r12d, %r12d
14026fa1a:     	movl	%r12d, %eax
14026fa1d:     	shlq	$0x4, %rax
14026fa21:     	incl	%r12d
14026fa24:     	movq	(%rdi,%rax), %rax
14026fa28:     	testl	%eax, %eax
14026fa2a:     	jne	0x14026fab3 <.text+0x26eab3>
14026fa30:     	cmpl	%esi, %r12d
14026fa33:     	jne	0x14026fa1a <.text+0x26ea1a>
14026fa35:     	nopw	%cs:(%rax,%rax)
14026fa40:     	cmpq	%r15, %r14
14026fa43:     	je	0x14026fabb <.text+0x26eabb>
14026fa45:     	movl	(%r14), %ecx
14026fa48:     	addq	$0x4, %r14
14026fa4c:     	movq	0x108(%rbx), %rax
14026fa53:     	leaq	(%rcx,%rcx,4), %rcx
14026fa57:     	shlq	$0x5, %rcx
14026fa5b:     	movq	0x58(%rax,%rcx), %rsi
14026fa60:     	testq	%rsi, %rsi
14026fa63:     	je	0x14026fa40 <.text+0x26ea40>
14026fa65:     	jmp	0x14026fa10 <.text+0x26ea10>
14026fa67:     	nopw	(%rax,%rax)
14026fa70:     	leaq	(%rax,%rcx,8), %rax
14026fa74:     	movq	0x8(%rax), %r13
14026fa78:     	xorl	%r12d, %r12d
14026fa7b:     	movl	%r12d, %eax
14026fa7e:     	incl	%r12d
14026fa81:     	movq	(%r13,%rax,8), %rax
14026fa86:     	testl	%eax, %eax
14026fa88:     	jne	0x14026fab3 <.text+0x26eab3>
14026fa8a:     	cmpl	%esi, %r12d
14026fa8d:     	jne	0x14026fa7b <.text+0x26ea7b>
14026fa8f:     	nop
14026fa90:     	cmpq	%r15, %r14
14026fa93:     	je	0x14026fabb <.text+0x26eabb>
14026fa95:     	movl	(%r14), %ecx
14026fa98:     	addq	$0x4, %r14
14026fa9c:     	movq	0x1a8(%rbx), %rax
14026faa3:     	leaq	(%rcx,%rcx,8), %rcx
14026faa7:     	movq	0x10(%rax,%rcx,8), %rsi
14026faac:     	testq	%rsi, %rsi
14026faaf:     	je	0x14026fa90 <.text+0x26ea90>
14026fab1:     	jmp	0x14026fa70 <.text+0x26ea70>
14026fab3:     	testl	%eax, %eax
14026fab5:     	jne	0x14026f994 <.text+0x26e994>
14026fabb:     	movq	$0x0, 0x10(%rdx)
14026fac3:     	movaps	0x290(%rbp), %xmm6
14026faca:     	movaps	0x2a0(%rbp), %xmm7
14026fad1:     	movaps	0x2b0(%rbp), %xmm8
14026fad9:     	movaps	0x2c0(%rbp), %xmm9
14026fae1:     	movaps	0x2d0(%rbp), %xmm10
14026fae9:     	addq	$0x368, %rsp            # imm = 0x368
14026faf0:     	popq	%rbx
14026faf1:     	popq	%rdi
14026faf2:     	popq	%rsi
14026faf3:     	popq	%r12
14026faf5:     	popq	%r13
14026faf7:     	popq	%r14
14026faf9:     	popq	%r15
14026fafb:     	popq	%rbp
14026fafc:     	retq
14026fafd:     	xorl	%r10d, %r10d
14026fb00:     	xorl	%r9d, %r9d
14026fb03:     	xorl	%esi, %esi
14026fb05:     	jmp	0x14026fb16 <.text+0x26eb16>
14026fb07:     	xorl	%r10d, %r10d
14026fb0a:     	xorl	%r9d, %r9d
14026fb0d:     	xorl	%esi, %esi
14026fb0f:     	movq	0x270(%rbp), %rbx
14026fb16:     	leaq	0x60(%rbx), %r11
14026fb1a:     	movq	%r11, 0x208(%rbp)
14026fb21:     	leaq	(%rcx,%rdx,4), %rcx
14026fb25:     	testb	%r8b, %r8b
14026fb28:     	je	0x14026fb6a <.text+0x26eb6a>
14026fb2a:     	cmpl	%r9d, %r10d
14026fb2d:     	jne	0x14026fd04 <.text+0x26ed04>
14026fb33:     	nopw	%cs:(%rax,%rax)
14026fb40:     	cmpq	%rcx, %rax
14026fb43:     	je	0x14026fbae <.text+0x26ebae>
14026fb45:     	movl	(%rax), %edx
14026fb47:     	addq	$0x4, %rax
14026fb4b:     	movq	0x280(%rbp), %r8
14026fb52:     	movq	0x1a8(%r8), %r8
14026fb59:     	leaq	(%rdx,%rdx,8), %rdx
14026fb5d:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
14026fb63:     	je	0x14026fb40 <.text+0x26eb40>
14026fb65:     	jmp	0x14026fd04 <.text+0x26ed04>
14026fb6a:     	cmpl	%r9d, %r10d
14026fb6d:     	jne	0x14026fd04 <.text+0x26ed04>
14026fb73:     	nopw	%cs:(%rax,%rax)
14026fb80:     	cmpq	%rcx, %rax
14026fb83:     	je	0x14026fbae <.text+0x26ebae>
14026fb85:     	movl	(%rax), %edx
14026fb87:     	addq	$0x4, %rax
14026fb8b:     	movq	0x280(%rbp), %r8
14026fb92:     	movq	0x108(%r8), %r8
14026fb99:     	leaq	(%rdx,%rdx,4), %rdx
14026fb9d:     	shlq	$0x5, %rdx
14026fba1:     	cmpq	$0x0, 0x58(%r8,%rdx)
14026fba7:     	je	0x14026fb80 <.text+0x26eb80>
14026fba9:     	jmp	0x14026fd04 <.text+0x26ed04>
14026fbae:     	testq	%rsi, %rsi
14026fbb1:     	je	0x14026fd04 <.text+0x26ed04>
14026fbb7:     	leaq	0x5b507a2(%rip), %rcx   # 0x145dc0360
14026fbbe:     	movl	$0x4, %edx
14026fbc3:     	leaq	0x60(%rbx), %r8
14026fbc7:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14026fbcc:     	testq	%rax, %rax
14026fbcf:     	jne	0x14026fbd8 <.text+0x26ebd8>
14026fbd1:     	movq	0x7d6a6b8(%rip), %rax   # 0x147fda290
14026fbd8:     	xorpd	%xmm0, %xmm0
14026fbdc:     	cmpb	$0x2, (%rax)
14026fbdf:     	xorpd	%xmm1, %xmm1
14026fbe3:     	jne	0x14026fc25 <.text+0x26ec25>
14026fbe5:     	movq	0x8(%rax), %rcx
14026fbe9:     	testq	%rcx, %rcx
14026fbec:     	je	0x14026fbfe <.text+0x26ebfe>
14026fbee:     	cmpl	$0x1, %ecx
14026fbf1:     	jne	0x14026fc20 <.text+0x26ec20>
14026fbf3:     	xorps	%xmm1, %xmm1
14026fbf6:     	cvtsi2sdq	0x10(%rax), %xmm1
14026fbfc:     	jmp	0x14026fc25 <.text+0x26ec25>
14026fbfe:     	movsd	0x10(%rax), %xmm2
14026fc03:     	unpcklps	0x5b04466(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x145d74070
14026fc0a:     	subpd	0x5b0446e(%rip), %xmm2  # 0x145d74080
14026fc12:     	movapd	%xmm2, %xmm1
14026fc16:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
14026fc1a:     	addsd	%xmm2, %xmm1
14026fc1e:     	jmp	0x14026fc25 <.text+0x26ec25>
14026fc20:     	movsd	0x10(%rax), %xmm1
14026fc25:     	maxsd	%xmm0, %xmm1
14026fc29:     	cvttsd2si	%xmm1, %rax
14026fc2e:     	movq	%rax, %rcx
14026fc31:     	movapd	%xmm1, %xmm2
14026fc35:     	subsd	0x5afd63b(%rip), %xmm2  # 0x145d6d278
14026fc3d:     	cvttsd2si	%xmm2, %rdx
14026fc42:     	sarq	$0x3f, %rcx
14026fc46:     	andq	%rcx, %rdx
14026fc49:     	orq	%rax, %rdx
14026fc4c:     	xorl	%eax, %eax
14026fc4e:     	ucomisd	%xmm0, %xmm1
14026fc52:     	cmovaeq	%rdx, %rax
14026fc56:     	ucomisd	0x5afd622(%rip), %xmm1  # 0x145d6d280
14026fc5e:     	movq	$-0x1, %rcx
14026fc65:     	cmovbeq	%rax, %rcx
14026fc69:     	movabsq	$-0x7777777777777777, %rdx # imm = 0x8888888888888889
14026fc73:     	movq	%rcx, %rax
14026fc76:     	mulq	%rdx
14026fc79:     	shrq	$0x5, %rdx
14026fc7d:     	movq	%rdx, 0x1f0(%rbp)
14026fc84:     	imulq	$0x3c, %rdx, %rax
14026fc88:     	subq	%rax, %rcx
14026fc8b:     	movq	%rcx, 0x230(%rbp)
14026fc92:     	leaq	0x1f0(%rbp), %rax
14026fc99:     	movq	%rax, -0x10(%rbp)
14026fc9d:     	leaq	0x593f1cc(%rip), %rax   # 0x145baee70 <.text+0x5bade70>
14026fca4:     	movq	%rax, -0x8(%rbp)
14026fca8:     	leaq	0x230(%rbp), %rcx
14026fcaf:     	movq	%rcx, (%rbp)
14026fcb3:     	movq	%rax, 0x8(%rbp)
14026fcb7:     	leaq	0x5aff299(%rip), %rdx   # 0x145d6ef57
14026fcbe:     	leaq	0x190(%rbp), %rcx
14026fcc5:     	leaq	-0x10(%rbp), %r8
14026fcc9:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14026fcce:     	movl	0x254(%rbp), %eax
14026fcd4:     	movl	%eax, (%rdi)
14026fcd6:     	movq	(%rsi), %rdx
14026fcd9:     	testq	%rdx, %rdx
14026fcdc:     	je	0x14026fced <.text+0x26eced>
14026fcde:     	movq	0x8(%rsi), %rcx
14026fce2:     	movl	$0x1, %r8d
14026fce8:     	callq	0x1400021d0 <.text+0x11d0>
14026fced:     	movq	0x1a0(%rbp), %rax
14026fcf4:     	movq	%rax, 0x10(%rsi)
14026fcf8:     	movupd	0x190(%rbp), %xmm0
14026fd00:     	movupd	%xmm0, (%rsi)
14026fd04:     	movq	0x278(%rbp), %rsi
14026fd0b:     	leaq	0x120(%rsi), %rcx
14026fd12:     	movq	0x280(%rbp), %rdx
14026fd19:     	callq	0x140376e00 <.text+0x375e00>
14026fd1e:     	movq	0x218(%rsi), %rcx
14026fd25:     	movq	0x220(%rsi), %rdx
14026fd2c:     	movzbl	0x228(%rsi), %r8d
14026fd34:     	leaq	(,%rdx,4), %r10
14026fd3c:     	movq	%rcx, %rax
14026fd3f:     	testb	%r8b, %r8b
14026fd42:     	je	0x14026fdc0 <.text+0x26edc0>
14026fd44:     	nopw	%cs:(%rax,%rax)
14026fd50:     	testq	%r10, %r10
14026fd53:     	je	0x14026feae <.text+0x26eeae>
14026fd59:     	movl	(%rax), %r9d
14026fd5c:     	addq	$0x4, %rax
14026fd60:     	movq	0x280(%rbp), %r11
14026fd67:     	movq	0x1a8(%r11), %r11
14026fd6e:     	leaq	(%r9,%r9,8), %rsi
14026fd72:     	movq	0x10(%r11,%rsi,8), %r9
14026fd77:     	addq	$-0x4, %r10
14026fd7b:     	testq	%r9, %r9
14026fd7e:     	je	0x14026fd50 <.text+0x26ed50>
14026fd80:     	leaq	(%r11,%rsi,8), %r10
14026fd84:     	movq	0x278(%rbp), %r11
14026fd8b:     	movq	0x230(%r11), %r11
14026fd92:     	movq	0x18(%r10), %rsi
14026fd96:     	movq	0x38(%r10), %r10
14026fd9a:     	movq	(%r10,%r11,8), %r10
14026fd9e:     	notq	%r10
14026fda1:     	leaq	(%r10,%r10,2), %r10
14026fda5:     	shlq	$0x4, %r10
14026fda9:     	movq	0x10(%rsi,%r10), %rdi
14026fdae:     	movq	0x28(%rsi,%r10), %r14
14026fdb3:     	jmp	0x14026fe5f <.text+0x26ee5f>
14026fdb8:     	nopl	(%rax,%rax)
14026fdc0:     	testq	%r10, %r10
14026fdc3:     	je	0x14026feae <.text+0x26eeae>
14026fdc9:     	movl	(%rax), %r9d
14026fdcc:     	addq	$0x4, %rax
14026fdd0:     	movq	0x280(%rbp), %r11
14026fdd7:     	movq	0x108(%r11), %r11
14026fdde:     	leaq	(%r9,%r9,4), %rsi
14026fde2:     	shlq	$0x5, %rsi
14026fde6:     	movq	0x58(%r11,%rsi), %r9
14026fdeb:     	addq	$-0x4, %r10
14026fdef:     	testq	%r9, %r9
14026fdf2:     	je	0x14026fdc0 <.text+0x26edc0>
14026fdf4:     	addq	%rsi, %r11
14026fdf7:     	movl	0x94(%r11), %r10d
14026fdfe:     	movq	0x280(%rbp), %rsi
14026fe05:     	movq	0x1a8(%rsi), %rsi
14026fe0c:     	leaq	(%r10,%r10,8), %r10
14026fe10:     	movq	0x278(%rbp), %rdi
14026fe17:     	movq	0x230(%rdi), %rdi
14026fe1e:     	movq	0x18(%rsi,%r10,8), %rbx
14026fe23:     	movq	0x38(%rsi,%r10,8), %r10
14026fe28:     	movq	(%r10,%rdi,8), %r10
14026fe2c:     	notq	%r10
14026fe2f:     	movq	0x50(%r11), %r11
14026fe33:     	movl	0x8(%r11), %r14d
14026fe37:     	leaq	(%r10,%r10,2), %r10
14026fe3b:     	shlq	$0x4, %r10
14026fe3f:     	notl	%r14d
14026fe42:     	leaq	(%r14,%r14,2), %rdi
14026fe46:     	shlq	$0x3, %rdi
14026fe4a:     	addq	0x10(%rbx,%r10), %rdi
14026fe4f:     	shlq	$0x2, %r14
14026fe53:     	addq	0x28(%rbx,%r10), %r14
14026fe58:     	movq	0x270(%rbp), %rbx
14026fe5f:     	movl	$0x1, %r10d
14026fe65:     	leaq	(%rcx,%rdx,4), %rcx
14026fe69:     	testb	%r8b, %r8b
14026fe6c:     	movq	%r12, 0x178(%rbp)
14026fe73:     	jne	0x14026fec6 <.text+0x26eec6>
14026fe75:     	cmpl	%r9d, %r10d
14026fe78:     	jne	0x1402700e8 <.text+0x26f0e8>
14026fe7e:     	nop
14026fe80:     	cmpq	%rcx, %rax
14026fe83:     	je	0x14026fefa <.text+0x26eefa>
14026fe85:     	movl	(%rax), %edx
14026fe87:     	addq	$0x4, %rax
14026fe8b:     	movq	0x280(%rbp), %r8
14026fe92:     	movq	0x108(%r8), %r8
14026fe99:     	leaq	(%rdx,%rdx,4), %rdx
14026fe9d:     	shlq	$0x5, %rdx
14026fea1:     	cmpq	$0x0, 0x58(%r8,%rdx)
14026fea7:     	je	0x14026fe80 <.text+0x26ee80>
14026fea9:     	jmp	0x1402700e8 <.text+0x26f0e8>
14026feae:     	xorl	%r9d, %r9d
14026feb1:     	xorl	%r10d, %r10d
14026feb4:     	xorl	%edi, %edi
14026feb6:     	leaq	(%rcx,%rdx,4), %rcx
14026feba:     	testb	%r8b, %r8b
14026febd:     	movq	%r12, 0x178(%rbp)
14026fec4:     	je	0x14026fe75 <.text+0x26ee75>
14026fec6:     	cmpl	%r9d, %r10d
14026fec9:     	jne	0x1402700e8 <.text+0x26f0e8>
14026fecf:     	nop
14026fed0:     	cmpq	%rcx, %rax
14026fed3:     	je	0x14026fefa <.text+0x26eefa>
14026fed5:     	movl	(%rax), %edx
14026fed7:     	addq	$0x4, %rax
14026fedb:     	movq	0x280(%rbp), %r8
14026fee2:     	movq	0x1a8(%r8), %r8
14026fee9:     	leaq	(%rdx,%rdx,8), %rdx
14026feed:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
14026fef3:     	je	0x14026fed0 <.text+0x26eed0>
14026fef5:     	jmp	0x1402700e8 <.text+0x26f0e8>
14026fefa:     	testq	%rdi, %rdi
14026fefd:     	je	0x1402700e8 <.text+0x26f0e8>
14026ff03:     	leaq	0x5b5084e(%rip), %rcx   # 0x145dc0758
14026ff0a:     	movl	$0x8, %edx
14026ff0f:     	leaq	0x60(%rbx), %r8
14026ff13:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14026ff18:     	testq	%rax, %rax
14026ff1b:     	jne	0x14026ff24 <.text+0x26ef24>
14026ff1d:     	movq	0x7d6a36c(%rip), %rax   # 0x147fda290
14026ff24:     	cmpb	$0x2, (%rax)
14026ff27:     	jne	0x14026ff4a <.text+0x26ef4a>
14026ff29:     	movq	0x8(%rax), %rcx
14026ff2d:     	testq	%rcx, %rcx
14026ff30:     	je	0x140270014 <.text+0x26f014>
14026ff36:     	cmpl	$0x1, %ecx
14026ff39:     	jne	0x140270036 <.text+0x26f036>
14026ff3f:     	cvtsi2sdq	0x10(%rax), %xmm1
14026ff45:     	jmp	0x14027003b <.text+0x26f03b>
14026ff4a:     	leaq	0x5b5083c(%rip), %rcx   # 0x145dc078d
14026ff51:     	movl	$0x7, %edx
14026ff56:     	leaq	0x60(%rbx), %r8
14026ff5a:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14026ff5f:     	testq	%rax, %rax
14026ff62:     	jne	0x14026ff6b <.text+0x26ef6b>
14026ff64:     	movq	0x7d6a325(%rip), %rax   # 0x147fda290
14026ff6b:     	cmpb	$0x1, (%rax)
14026ff6e:     	jne	0x14026ffee <.text+0x26efee>
14026ff70:     	cmpb	$0x0, 0x1(%rax)
14026ff74:     	je	0x14026ffee <.text+0x26efee>
14026ff76:     	leaq	0x5b50817(%rip), %rcx   # 0x145dc0794
14026ff7d:     	movl	$0xb, %edx
14026ff82:     	callq	0x1458da4e0 <.text+0x58d94e0>
14026ff87:     	movq	%rax, %r15
14026ff8a:     	movq	%rdx, %rsi
14026ff8d:     	movq	$0x1, 0x20(%rsp)
14026ff96:     	leaq	-0x10(%rbp), %rcx
14026ff9a:     	movl	$0x1, %r9d
14026ffa0:     	xorl	%r8d, %r8d
14026ffa3:     	callq	0x14023ff50 <.text+0x23ef50>
14026ffa8:     	movq	-0x8(%rbp), %r13
14026ffac:     	cmpl	$0x1, -0x10(%rbp)
14026ffb0:     	je	0x140271d0a <.text+0x270d0a>
14026ffb6:     	movq	(%rbp), %rbx
14026ffba:     	testq	%rsi, %rsi
14026ffbd:     	je	0x14026ffcd <.text+0x26efcd>
14026ffbf:     	movq	%rbx, %rcx
14026ffc2:     	movq	%r15, %rdx
14026ffc5:     	movq	%rsi, %r8
14026ffc8:     	callq	0x145bc977b <.text+0x5bc877b>
14026ffcd:     	movq	%r13, 0x230(%rbp)
14026ffd4:     	movq	%rbx, 0x238(%rbp)
14026ffdb:     	movq	%rsi, 0x240(%rbp)
14026ffe2:     	movq	0x270(%rbp), %rbx
14026ffe9:     	jmp	0x1402700b1 <.text+0x26f0b1>
14026ffee:     	movq	$0x0, 0x230(%rbp)
14026fff9:     	movq	$0x1, 0x238(%rbp)
140270004:     	movq	$0x0, 0x240(%rbp)
14027000f:     	jmp	0x1402700b1 <.text+0x26f0b1>
140270014:     	movsd	0x10(%rax), %xmm0
140270019:     	unpcklps	0x5b04050(%rip), %xmm0  # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0x145d74070
140270020:     	subpd	0x5b04058(%rip), %xmm0  # 0x145d74080
140270028:     	movapd	%xmm0, %xmm1
14027002c:     	unpckhpd	%xmm0, %xmm1            # xmm1 = xmm1[1],xmm0[1]
140270030:     	addsd	%xmm0, %xmm1
140270034:     	jmp	0x14027003b <.text+0x26f03b>
140270036:     	movsd	0x10(%rax), %xmm1
14027003b:     	leaq	0x190(%rbp), %rsi
140270042:     	movq	%rsi, %rcx
140270045:     	callq	0x140012ba0 <.text+0x11ba0>
14027004a:     	leaq	0x5b5030f(%rip), %rax   # 0x145dc0360
140270051:     	movq	%rax, -0x10(%rbp)
140270055:     	movq	$0x4, -0x8(%rbp)
14027005d:     	movq	%rsi, (%rbp)
140270061:     	leaq	0x5b506f8(%rip), %rax   # 0x145dc0760
140270068:     	movq	%rax, 0x8(%rbp)
14027006c:     	movq	$0x1, 0x20(%rsp)
140270075:     	leaq	0x5b50704(%rip), %rdx   # 0x145dc0780
14027007c:     	leaq	0x230(%rbp), %rcx
140270083:     	leaq	-0x10(%rbp), %r9
140270087:     	movl	$0xd, %r8d
14027008d:     	callq	0x1458da540 <.text+0x58d9540>
140270092:     	nop
140270093:     	movq	0x190(%rbp), %rdx
14027009a:     	testq	%rdx, %rdx
14027009d:     	je	0x1402700b1 <.text+0x26f0b1>
14027009f:     	movq	0x198(%rbp), %rcx
1402700a6:     	movl	$0x1, %r8d
1402700ac:     	callq	0x1400021d0 <.text+0x11d0>
1402700b1:     	movl	0x254(%rbp), %eax
1402700b7:     	movl	%eax, (%r14)
1402700ba:     	movq	(%rdi), %rdx
1402700bd:     	testq	%rdx, %rdx
1402700c0:     	je	0x1402700d1 <.text+0x26f0d1>
1402700c2:     	movq	0x8(%rdi), %rcx
1402700c6:     	movl	$0x1, %r8d
1402700cc:     	callq	0x1400021d0 <.text+0x11d0>
1402700d1:     	movq	0x240(%rbp), %rax
1402700d8:     	movq	%rax, 0x10(%rdi)
1402700dc:     	movupd	0x230(%rbp), %xmm0
1402700e4:     	movupd	%xmm0, (%rdi)
1402700e8:     	leaq	0x5b502c3(%rip), %rcx   # 0x145dc03b2
1402700ef:     	movl	$0x6, %edx
1402700f4:     	leaq	0x60(%rbx), %r8
1402700f8:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1402700fd:     	testq	%rax, %rax
140270100:     	jne	0x140270109 <.text+0x26f109>
140270102:     	movq	0x7d6a187(%rip), %rax   # 0x147fda290
140270109:     	cmpb	$0x4, (%rax)
14027010c:     	jne	0x140270142 <.text+0x26f142>
14027010e:     	movq	0x10(%rax), %rcx
140270112:     	movq	0x18(%rax), %rax
140270116:     	shlq	$0x5, %rax
14027011a:     	addq	%rcx, %rax
14027011d:     	movq	%rcx, -0x10(%rbp)
140270121:     	movq	%rax, -0x8(%rbp)
140270125:     	movq	$0x4, (%rbp)
14027012d:     	leaq	0x1f0(%rbp), %rcx
140270134:     	leaq	-0x10(%rbp), %rdx
140270138:     	callq	0x140263da0 <.text+0x262da0>
14027013d:     	jmp	0x1402701cf <.text+0x26f1cf>
140270142:     	leaq	0x5b4fdc7(%rip), %rcx   # 0x145dbff10
140270149:     	movl	$0x4, %edx
14027014e:     	leaq	0x60(%rbx), %r8
140270152:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140270157:     	testq	%rax, %rax
14027015a:     	jne	0x140270163 <.text+0x26f163>
14027015c:     	movq	0x7d6a12d(%rip), %rax   # 0x147fda290
140270163:     	cmpb	$0x5, (%rax)
140270166:     	jne	0x1402701b3 <.text+0x26f1b3>
140270168:     	leaq	0x5b4fda1(%rip), %rcx   # 0x145dbff10
14027016f:     	movl	$0x4, %edx
140270174:     	leaq	0x60(%rbx), %r8
140270178:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14027017d:     	movq	%rax, %rsi
140270180:     	callq	0x140002200 <.text+0x1200>
140270185:     	movl	$0x8, %ecx
14027018a:     	movl	$0x8, %edx
14027018f:     	callq	0x1400021c0 <.text+0x11c0>
140270194:     	testq	%rax, %rax
140270197:     	je	0x140271d18 <.text+0x270d18>
14027019d:     	testq	%rsi, %rsi
1402701a0:     	jne	0x1402701a9 <.text+0x26f1a9>
1402701a2:     	movq	0x7d6a0e7(%rip), %rsi   # 0x147fda290
1402701a9:     	movq	%rsi, (%rax)
1402701ac:     	movl	$0x1, %ecx
1402701b1:     	jmp	0x1402701ba <.text+0x26f1ba>
1402701b3:     	movl	$0x8, %eax
1402701b8:     	xorl	%ecx, %ecx
1402701ba:     	movq	%rcx, 0x1f0(%rbp)
1402701c1:     	movq	%rax, 0x1f8(%rbp)
1402701c8:     	movq	%rcx, 0x200(%rbp)
1402701cf:     	movq	0x370(%rbp), %rax
1402701d6:     	movq	(%rax), %r9
1402701d9:     	movq	0x8(%rax), %rax
1402701dd:     	movq	0xf8(%r9), %rdx
1402701e4:     	movq	0x100(%r9), %rcx
1402701eb:     	leaq	(%rdx,%rcx,4), %rcx
1402701ef:     	movzbl	0x108(%r9), %r8d
1402701f7:     	movb	%r8b, 0x260(%rbp)
1402701fe:     	testb	%r8b, %r8b
140270201:     	je	0x1402702d9 <.text+0x26f2d9>
140270207:     	movl	$0x8, %r14d
14027020d:     	xorl	%r12d, %r12d
140270210:     	xorl	%ebx, %ebx
140270212:     	xorl	%esi, %esi
140270214:     	xorl	%r10d, %r10d
140270217:     	cmpl	%esi, %r10d
14027021a:     	jne	0x140270287 <.text+0x26f287>
14027021c:     	nopl	(%rax)
140270220:     	cmpq	%rcx, %rdx
140270223:     	je	0x140270401 <.text+0x26f401>
140270229:     	movl	(%rdx), %r11d
14027022c:     	addq	$0x4, %rdx
140270230:     	movq	0x1a8(%rax), %r10
140270237:     	leaq	(%r11,%r11,8), %rdi
14027023b:     	movq	0x10(%r10,%rdi,8), %r11
140270240:     	testq	%r11, %r11
140270243:     	je	0x140270220 <.text+0x26f220>
140270245:     	leaq	(%r10,%rdi,8), %rsi
140270249:     	movq	0x110(%r9), %rdi
140270250:     	xorl	%r10d, %r10d
140270253:     	cmpq	0x40(%rsi), %rdi
140270257:     	jae	0x14027027e <.text+0x26f27e>
140270259:     	movq	0x38(%rsi), %rbx
14027025d:     	movq	(%rbx,%rdi,8), %rdi
140270261:     	testq	%rdi, %rdi
140270264:     	je	0x14027027e <.text+0x26f27e>
140270266:     	movq	0x18(%rsi), %rbx
14027026a:     	notq	%rdi
14027026d:     	leaq	(%rdi,%rdi,2), %rdi
140270271:     	shlq	$0x4, %rdi
140270275:     	movq	0x10(%rbx,%rdi), %r12
14027027a:     	movb	$0x1, %bl
14027027c:     	jmp	0x140270280 <.text+0x26f280>
14027027e:     	xorl	%ebx, %ebx
140270280:     	movq	0x8(%rsi), %r14
140270284:     	movl	%r11d, %esi
140270287:     	movl	%r10d, %r11d
14027028a:     	incl	%r10d
14027028d:     	movq	(%r14,%r11,8), %rdi
140270291:     	leaq	(%r11,%r11,2), %r11
140270295:     	leaq	(%r12,%r11,8), %r11
140270299:     	testb	$0x1, %bl
14027029c:     	movl	$0x0, %r15d
1402702a2:     	cmoveq	%r15, %r11
1402702a6:     	movq	%rdi, %r15
1402702a9:     	shrq	$0x20, %r15
1402702ad:     	testl	%edi, %edi
1402702af:     	cmovel	%r13d, %r15d
1402702b3:     	cmoveq	%r8, %r11
1402702b7:     	movl	%r15d, %r13d
1402702ba:     	movq	%r11, %r8
1402702bd:     	je	0x140270217 <.text+0x26f217>
1402702c3:     	movl	%r15d, %r13d
1402702c6:     	movq	%r11, %r8
1402702c9:     	je	0x140270217 <.text+0x26f217>
1402702cf:     	movl	$0x8, %ebx
1402702d4:     	jmp	0x1402703f9 <.text+0x26f3f9>
1402702d9:     	movl	$0x8, %ebx
1402702de:     	xorl	%r12d, %r12d
1402702e1:     	xorl	%r14d, %r14d
1402702e4:     	xorl	%esi, %esi
1402702e6:     	xorl	%r10d, %r10d
1402702e9:     	cmpl	%esi, %r10d
1402702ec:     	jne	0x14027039e <.text+0x26f39e>
1402702f2:     	nopw	%cs:(%rax,%rax)
140270300:     	cmpq	%rcx, %rdx
140270303:     	je	0x14027040a <.text+0x26f40a>
140270309:     	movl	(%rdx), %r10d
14027030c:     	addq	$0x4, %rdx
140270310:     	movq	0x108(%rax), %r11
140270317:     	leaq	(%r10,%r10,4), %r10
14027031b:     	shlq	$0x5, %r10
14027031f:     	movq	0x58(%r11,%r10), %rdi
140270324:     	testq	%rdi, %rdi
140270327:     	je	0x140270300 <.text+0x26f300>
140270329:     	addq	%r10, %r11
14027032c:     	movq	0x110(%r9), %rsi
140270333:     	xorl	%r10d, %r10d
140270336:     	cmpq	0x88(%r11), %rsi
14027033d:     	jae	0x140270390 <.text+0x26f390>
14027033f:     	movq	0x80(%r11), %rbx
140270346:     	cmpq	$0x0, (%rbx,%rsi,8)
14027034b:     	je	0x140270390 <.text+0x26f390>
14027034d:     	movl	0x94(%r11), %r14d
140270354:     	movq	0x1a8(%rax), %rbx
14027035b:     	leaq	(%r14,%r14,8), %r15
14027035f:     	movb	$0x1, %r14b
140270362:     	cmpq	0x40(%rbx,%r15,8), %rsi
140270367:     	jae	0x140270395 <.text+0x26f395>
140270369:     	leaq	(%rbx,%r15,8), %rbx
14027036d:     	movq	0x38(%rbx), %r15
140270371:     	movq	(%r15,%rsi,8), %rsi
140270375:     	testq	%rsi, %rsi
140270378:     	je	0x140270395 <.text+0x26f395>
14027037a:     	movq	0x18(%rbx), %rbx
14027037e:     	notq	%rsi
140270381:     	leaq	(%rsi,%rsi,2), %rsi
140270385:     	shlq	$0x4, %rsi
140270389:     	movq	0x10(%rbx,%rsi), %r12
14027038e:     	jmp	0x140270398 <.text+0x26f398>
140270390:     	xorl	%r14d, %r14d
140270393:     	jmp	0x140270398 <.text+0x26f398>
140270395:     	xorl	%r12d, %r12d
140270398:     	movq	0x50(%r11), %rbx
14027039c:     	movl	%edi, %esi
14027039e:     	movl	%r10d, %r11d
1402703a1:     	shlq	$0x4, %r11
1402703a5:     	incl	%r10d
1402703a8:     	movq	(%rbx,%r11), %rdi
1402703ac:     	movl	0x8(%rbx,%r11), %r11d
1402703b1:     	notl	%r11d
1402703b4:     	leaq	(%r11,%r11,2), %r11
1402703b8:     	leaq	(%r12,%r11,8), %r11
1402703bc:     	testb	$0x1, %r14b
1402703c0:     	movl	$0x0, %r15d
1402703c6:     	cmoveq	%r15, %r11
1402703ca:     	movq	%rdi, %r15
1402703cd:     	shrq	$0x20, %r15
1402703d1:     	testl	%edi, %edi
1402703d3:     	cmovel	%r13d, %r15d
1402703d7:     	cmoveq	%r8, %r11
1402703db:     	movl	%r15d, %r13d
1402703de:     	movq	%r11, %r8
1402703e1:     	je	0x1402702e9 <.text+0x26f2e9>
1402703e7:     	movl	%r15d, %r13d
1402703ea:     	movq	%r11, %r8
1402703ed:     	je	0x1402702e9 <.text+0x26f2e9>
1402703f3:     	movl	$0x8, %r14d
1402703f9:     	movl	%r15d, %r13d
1402703fc:     	movq	%r11, %r8
1402703ff:     	jmp	0x140270418 <.text+0x26f418>
140270401:     	xorl	%edi, %edi
140270403:     	movl	$0x8, %ebx
140270408:     	jmp	0x140270412 <.text+0x26f412>
14027040a:     	xorl	%edi, %edi
14027040c:     	movl	$0x8, %r14d
140270412:     	movq	%rcx, %rdx
140270415:     	movl	%esi, %r10d
140270418:     	cmpb	$0x0, 0x260(%rbp)
14027041f:     	jne	0x140270441 <.text+0x26f441>
140270421:     	jmp	0x1402704a2 <.text+0x26f4a2>
140270423:     	leaq	(%r9,%r10,8), %r9
140270427:     	movq	0x8(%r9), %r14
14027042b:     	xorl	%r10d, %r10d
14027042e:     	movl	%r10d, %r9d
140270431:     	incl	%r10d
140270434:     	movl	(%r14,%r9,8), %r11d
140270438:     	testq	%r11, %r11
14027043b:     	jne	0x1402704da <.text+0x26f4da>
140270441:     	cmpl	%esi, %r10d
140270444:     	jne	0x14027042e <.text+0x26f42e>
140270446:     	nopw	%cs:(%rax,%rax)
140270450:     	cmpq	%rcx, %rdx
140270453:     	je	0x1402704d7 <.text+0x26f4d7>
140270459:     	movl	(%rdx), %r10d
14027045c:     	addq	$0x4, %rdx
140270460:     	movq	0x1a8(%rax), %r9
140270467:     	leaq	(%r10,%r10,8), %r10
14027046b:     	movq	0x10(%r9,%r10,8), %rsi
140270470:     	testq	%rsi, %rsi
140270473:     	je	0x140270450 <.text+0x26f450>
140270475:     	jmp	0x140270423 <.text+0x26f423>
140270477:     	addq	%r11, %r10
14027047a:     	movq	0x110(%r9), %r11
140270481:     	cmpq	0x88(%r10), %r11
140270488:     	movq	0x50(%r10), %rbx
14027048c:     	xorl	%r10d, %r10d
14027048f:     	movl	%r10d, %r11d
140270492:     	shlq	$0x4, %r11
140270496:     	incl	%r10d
140270499:     	movl	(%rbx,%r11), %r11d
14027049d:     	testq	%r11, %r11
1402704a0:     	jne	0x1402704da <.text+0x26f4da>
1402704a2:     	cmpl	%esi, %r10d
1402704a5:     	jne	0x14027048f <.text+0x26f48f>
1402704a7:     	nopw	(%rax,%rax)
1402704b0:     	cmpq	%rcx, %rdx
1402704b3:     	je	0x1402704d7 <.text+0x26f4d7>
1402704b5:     	movl	(%rdx), %r11d
1402704b8:     	addq	$0x4, %rdx
1402704bc:     	movq	0x108(%rax), %r10
1402704c3:     	leaq	(%r11,%r11,4), %r11
1402704c7:     	shlq	$0x5, %r11
1402704cb:     	movq	0x58(%r10,%r11), %rsi
1402704d0:     	testq	%rsi, %rsi
1402704d3:     	je	0x1402704b0 <.text+0x26f4b0>
1402704d5:     	jmp	0x140270477 <.text+0x26f477>
1402704d7:     	xorl	%r11d, %r11d
1402704da:     	testl	%edi, %edi
1402704dc:     	je	0x1402705d9 <.text+0x26f5d9>
1402704e2:     	testq	%r11, %r11
1402704e5:     	jne	0x1402705d9 <.text+0x26f5d9>
1402704eb:     	testq	%r8, %r8
1402704ee:     	je	0x140270502 <.text+0x26f502>
1402704f0:     	movq	0x10(%r8), %rax
1402704f4:     	cmpq	0x200(%rbp), %rax
1402704fb:     	jne	0x140270511 <.text+0x26f511>
1402704fd:     	jmp	0x1402705d9 <.text+0x26f5d9>
140270502:     	xorl	%eax, %eax
140270504:     	cmpq	0x200(%rbp), %rax
14027050b:     	je	0x1402705d9 <.text+0x26f5d9>
140270511:     	movq	0x178(%rbp), %rax
140270518:     	movq	0x10(%rax), %r14
14027051c:     	testq	%r14, %r14
14027051f:     	movq	0x20(%rax), %r15
140270523:     	movq	0x18(%rax), %r12
140270527:     	movupd	(%rax), %xmm6
14027052b:     	movq	%r14, %rsi
14027052e:     	cmoveq	%r12, %rsi
140270532:     	movq	(%rsi), %rax
140270535:     	movq	0x10(%rsi), %rbx
140270539:     	subq	%rbx, %rax
14027053c:     	cmpq	$0xf, %rax
140270540:     	jbe	0x140271ce4 <.text+0x270ce4>
140270546:     	movl	%edi, %eax
140270548:     	shlq	$0x20, %r13
14027054c:     	orq	%rax, %r13
14027054f:     	movq	0x8(%rsi), %rax
140270553:     	leaq	-0x4518a(%rip), %rcx    # 0x14022b3d0 <.text+0x22a3d0>
14027055a:     	movq	%rcx, (%rax,%rbx)
14027055e:     	movq	%r13, 0x8(%rax,%rbx)
140270563:     	addq	$0x10, %rbx
140270567:     	movq	%rbx, 0x10(%rsi)
14027056b:     	xorl	%eax, %eax
14027056d:     	cmpq	$0x2, 0x200(%rbp)
140270575:     	setae	%al
140270578:     	leaq	0x5b4ef69(%rip), %rcx   # 0x145dbf4e8
14027057f:     	movss	(%rcx,%rax,4), %xmm0
140270584:     	movss	%xmm0, 0x230(%rbp)
14027058c:     	movq	%r13, -0x10(%rbp)
140270590:     	movupd	%xmm6, -0x8(%rbp)
140270595:     	movq	%r14, 0x8(%rbp)
140270599:     	movq	%r12, 0x10(%rbp)
14027059d:     	movq	%r15, 0x18(%rbp)
1402705a1:     	leaq	0x1f0(%rbp), %rax
1402705a8:     	movq	%rax, 0x190(%rbp)
1402705af:     	leaq	-0x40(%rbp), %rax
1402705b3:     	movq	%rax, 0x198(%rbp)
1402705ba:     	leaq	0x230(%rbp), %rax
1402705c1:     	movq	%rax, 0x1a0(%rbp)
1402705c8:     	leaq	-0x10(%rbp), %rcx
1402705cc:     	leaq	0x190(%rbp), %rdx
1402705d3:     	callq	0x1401b5730 <.text+0x1b4730>
1402705d8:     	nop
1402705d9:     	movq	0x278(%rbp), %rax
1402705e0:     	leaq	0x240(%rax), %rcx
1402705e7:     	movq	0x280(%rbp), %rdx
1402705ee:     	callq	0x140376e00 <.text+0x375e00>
1402705f3:     	nop
1402705f4:     	movq	0x278(%rbp), %rcx
1402705fb:     	movq	0x338(%rcx), %r12
140270602:     	movq	0x340(%rcx), %rax
140270609:     	leaq	(%r12,%rax,4), %rsi
14027060d:     	movzbl	0x348(%rcx), %r11d
140270615:     	movl	$0x8, %eax
14027061a:     	movq	%rax, 0x210(%rbp)
140270621:     	xorl	%edx, %edx
140270623:     	xorl	%edi, %edi
140270625:     	xorl	%r9d, %r9d
140270628:     	xorl	%r8d, %r8d
14027062b:     	movb	%r11b, 0x228(%rbp)
140270632:     	testb	%r11b, %r11b
140270635:     	je	0x1402706b3 <.text+0x26f6b3>
140270637:     	cmpl	%edi, %edx
140270639:     	jne	0x140270779 <.text+0x26f779>
14027063f:     	nop
140270640:     	cmpq	%rsi, %r12
140270643:     	je	0x14027096c <.text+0x26f96c>
140270649:     	movl	(%r12), %ecx
14027064d:     	addq	$0x4, %r12
140270651:     	movq	0x280(%rbp), %rax
140270658:     	movq	0x1a8(%rax), %rax
14027065f:     	leaq	(%rcx,%rcx,8), %rcx
140270663:     	movq	0x10(%rax,%rcx,8), %rdi
140270668:     	testq	%rdi, %rdi
14027066b:     	je	0x140270640 <.text+0x26f640>
14027066d:     	leaq	(%rax,%rcx,8), %r8
140270671:     	movq	0x278(%rbp), %rax
140270678:     	movq	0x358(%rax), %rdx
14027067f:     	movq	0x18(%r8), %rax
140270683:     	movq	0x38(%r8), %rcx
140270687:     	cmpq	0x40(%r8), %rdx
14027068b:     	jae	0x140270746 <.text+0x26f746>
140270691:     	movq	(%rcx,%rdx,8), %rdx
140270695:     	testq	%rdx, %rdx
140270698:     	je	0x140270746 <.text+0x26f746>
14027069e:     	notq	%rdx
1402706a1:     	leaq	(%rdx,%rdx,2), %rdx
1402706a5:     	shlq	$0x4, %rdx
1402706a9:     	movq	0x10(%rax,%rdx), %r9
1402706ae:     	jmp	0x140270749 <.text+0x26f749>
1402706b3:     	cmpl	%edi, %edx
1402706b5:     	jne	0x1402707bb <.text+0x26f7bb>
1402706bb:     	nopl	(%rax,%rax)
1402706c0:     	cmpq	%rsi, %r12
1402706c3:     	je	0x14027096c <.text+0x26f96c>
1402706c9:     	movl	(%r12), %ecx
1402706cd:     	addq	$0x4, %r12
1402706d1:     	movq	0x280(%rbp), %rax
1402706d8:     	movq	0x108(%rax), %rax
1402706df:     	leaq	(%rcx,%rcx,4), %rcx
1402706e3:     	shlq	$0x5, %rcx
1402706e7:     	movq	0x58(%rax,%rcx), %rdi
1402706ec:     	testq	%rdi, %rdi
1402706ef:     	je	0x1402706c0 <.text+0x26f6c0>
1402706f1:     	addq	%rcx, %rax
1402706f4:     	movl	0x94(%rax), %ecx
1402706fa:     	movq	0x280(%rbp), %rdx
140270701:     	movq	0x1a8(%rdx), %r9
140270708:     	leaq	(%rcx,%rcx,8), %r10
14027070c:     	movq	0x278(%rbp), %rcx
140270713:     	movq	0x358(%rcx), %r8
14027071a:     	movq	0x18(%r9,%r10,8), %rcx
14027071f:     	movq	0x38(%r9,%r10,8), %rdx
140270724:     	cmpq	0x40(%r9,%r10,8), %r8
140270729:     	jae	0x14027077d <.text+0x26f77d>
14027072b:     	movq	(%rdx,%r8,8), %r8
14027072f:     	testq	%r8, %r8
140270732:     	je	0x14027077d <.text+0x26f77d>
140270734:     	notq	%r8
140270737:     	leaq	(%r8,%r8,2), %r8
14027073b:     	shlq	$0x4, %r8
14027073f:     	movq	0x10(%rcx,%r8), %r9
140270744:     	jmp	0x140270780 <.text+0x26f780>
140270746:     	xorl	%r9d, %r9d
140270749:     	movq	0x278(%rbp), %rdx
140270750:     	movq	0x350(%rdx), %rdx
140270757:     	movq	(%rcx,%rdx,8), %rcx
14027075b:     	notq	%rcx
14027075e:     	leaq	(%rcx,%rcx,2), %rcx
140270762:     	shlq	$0x4, %rcx
140270766:     	movq	0x10(%rax,%rcx), %r8
14027076b:     	movq	0x28(%rax,%rcx), %rax
140270770:     	movq	%rax, 0x260(%rbp)
140270777:     	xorl	%edx, %edx
140270779:     	movl	%edx, %eax
14027077b:     	jmp	0x1402707ce <.text+0x26f7ce>
14027077d:     	xorl	%r9d, %r9d
140270780:     	movq	0x278(%rbp), %r8
140270787:     	movq	0x350(%r8), %r8
14027078e:     	movq	(%rdx,%r8,8), %rdx
140270792:     	notq	%rdx
140270795:     	leaq	(%rdx,%rdx,2), %rdx
140270799:     	shlq	$0x4, %rdx
14027079d:     	movq	0x10(%rcx,%rdx), %r8
1402707a2:     	movq	0x28(%rcx,%rdx), %rcx
1402707a7:     	movq	%rcx, 0x260(%rbp)
1402707ae:     	movq	0x50(%rax), %rax
1402707b2:     	movq	%rax, 0x210(%rbp)
1402707b9:     	xorl	%edx, %edx
1402707bb:     	movl	%edx, %eax
1402707bd:     	shlq	$0x4, %rax
1402707c1:     	movq	0x210(%rbp), %rcx
1402707c8:     	movl	0x8(%rcx,%rax), %eax
1402707cc:     	notl	%eax
1402707ce:     	leaq	(%rax,%rax,2), %rcx
1402707d2:     	leaq	(%r8,%rcx,8), %r14
1402707d6:     	movq	0x260(%rbp), %rcx
1402707dd:     	leaq	(%rcx,%rax,4), %rcx
1402707e1:     	movq	%rcx, 0x188(%rbp)
1402707e8:     	leaq	(%r9,%rax,8), %rax
1402707ec:     	incl	%edx
1402707ee:     	movq	(%rax), %rax
1402707f1:     	cmpq	0x200(%rbp), %rax
1402707f8:     	jae	0x140270632 <.text+0x26f632>
1402707fe:     	movl	%edx, 0x220(%rbp)
140270804:     	movq	%r14, 0x258(%rbp)
14027080b:     	movq	%r8, %rbx
14027080e:     	movq	%r9, %r13
140270811:     	movq	0x1f8(%rbp), %rcx
140270818:     	movq	(%rcx,%rax,8), %r8
14027081c:     	movl	$0x4, %edx
140270821:     	leaq	0x5b4f6e4(%rip), %rcx   # 0x145dbff0c
140270828:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14027082d:     	nop
14027082e:     	testq	%rax, %rax
140270831:     	jne	0x14027083a <.text+0x26f83a>
140270833:     	movq	0x7d69a56(%rip), %rax   # 0x147fda290
14027083a:     	cmpb	$0x3, (%rax)
14027083d:     	movzbl	0x228(%rbp), %r11d
140270845:     	movq	%r13, %r9
140270848:     	movq	%rbx, %r8
14027084b:     	movq	0x258(%rbp), %rcx
140270852:     	movl	0x220(%rbp), %edx
140270858:     	jne	0x140270632 <.text+0x26f632>
14027085e:     	movq	0x10(%rax), %r15
140270862:     	movq	0x18(%rax), %r10
140270866:     	cmpq	%r10, 0x10(%rcx)
14027086a:     	jne	0x1402708aa <.text+0x26f8aa>
14027086c:     	movq	0x8(%rcx), %rcx
140270870:     	movq	%r15, %rdx
140270873:     	movq	%r10, %r8
140270876:     	movq	%r15, %r14
140270879:     	movq	%r10, %r15
14027087c:     	callq	0x145bc9787 <.text+0x5bc8787>
140270881:     	movq	%r15, %r10
140270884:     	movq	%r14, %r15
140270887:     	movl	0x220(%rbp), %edx
14027088d:     	movq	0x258(%rbp), %rcx
140270894:     	movq	%rbx, %r8
140270897:     	movq	%r13, %r9
14027089a:     	movzbl	0x228(%rbp), %r11d
1402708a2:     	testl	%eax, %eax
1402708a4:     	je	0x140270632 <.text+0x26f632>
1402708aa:     	testq	%r10, %r10
1402708ad:     	js	0x140271cd3 <.text+0x270cd3>
1402708b3:     	je	0x140270902 <.text+0x26f902>
1402708b5:     	movq	%r10, %r14
1402708b8:     	callq	0x140002200 <.text+0x1200>
1402708bd:     	movl	$0x1, %edx
1402708c2:     	movq	%r14, %rcx
1402708c5:     	callq	0x1400021c0 <.text+0x11c0>
1402708ca:     	testq	%rax, %rax
1402708cd:     	je	0x140271d29 <.text+0x270d29>
1402708d3:     	movq	%rax, 0x218(%rbp)
1402708da:     	movq	%rax, %rcx
1402708dd:     	movq	%r15, %rdx
1402708e0:     	movq	%r14, %r8
1402708e3:     	callq	0x145bc977b <.text+0x5bc877b>
1402708e8:     	movzbl	0x228(%rbp), %r11d
1402708f0:     	movq	%r13, %r9
1402708f3:     	movq	%rbx, %r8
1402708f6:     	movq	0x258(%rbp), %rcx
1402708fd:     	movq	%r14, %r10
140270900:     	jmp	0x14027090e <.text+0x26f90e>
140270902:     	movl	$0x1, %eax
140270907:     	movq	%rax, 0x218(%rbp)
14027090e:     	movl	0x254(%rbp), %eax
140270914:     	movq	0x188(%rbp), %rdx
14027091b:     	movl	%eax, (%rdx)
14027091d:     	movq	(%rcx), %rdx
140270920:     	testq	%rdx, %rdx
140270923:     	je	0x14027094f <.text+0x26f94f>
140270925:     	movq	0x8(%rcx), %rcx
140270929:     	movl	$0x1, %r8d
14027092f:     	movq	%r10, %r15
140270932:     	callq	0x1400021d0 <.text+0x11d0>
140270937:     	movq	%r15, %r10
14027093a:     	movq	0x258(%rbp), %rcx
140270941:     	movq	%rbx, %r8
140270944:     	movq	%r13, %r9
140270947:     	movzbl	0x228(%rbp), %r11d
14027094f:     	movq	%r10, (%rcx)
140270952:     	movq	0x218(%rbp), %rax
140270959:     	movq	%rax, 0x8(%rcx)
14027095d:     	movq	%r10, 0x10(%rcx)
140270961:     	movl	0x220(%rbp), %edx
140270967:     	jmp	0x140270632 <.text+0x26f632>
14027096c:     	movq	0x378(%rbp), %rax
140270973:     	movq	(%rax), %r11
140270976:     	movq	0x8(%rax), %r13
14027097a:     	movl	0x14(%rax), %eax
14027097d:     	movl	%eax, 0x184(%rbp)
140270983:     	movq	0xf8(%r11), %rsi
14027098a:     	movq	0x100(%r11), %rax
140270991:     	leaq	(%rsi,%rax,4), %r14
140270995:     	movzbl	0x108(%r11), %r15d
14027099d:     	movl	$0x8, %r9d
1402709a3:     	xorl	%edx, %edx
1402709a5:     	movsd	0x5b036c3(%rip), %xmm6  # 0x145d74070
1402709ad:     	movapd	0x5b036cb(%rip), %xmm7  # 0x145d74080
1402709b5:     	movsd	0x5b2d3f2(%rip), %xmm8  # 0x145d9ddb0
1402709be:     	movsd	0x5b2d3f1(%rip), %xmm9  # 0x145d9ddb8
1402709c7:     	xorl	%edi, %edi
1402709c9:     	xorl	%r10d, %r10d
1402709cc:     	xorl	%r8d, %r8d
1402709cf:     	movq	%r11, 0x218(%rbp)
1402709d6:     	movb	%r15b, 0x26f(%rbp)
1402709dd:     	testb	%r15b, %r15b
1402709e0:     	je	0x140270a53 <.text+0x26fa53>
1402709e2:     	cmpl	%edi, %edx
1402709e4:     	jne	0x140270afb <.text+0x26fafb>
1402709ea:     	nopw	(%rax,%rax)
1402709f0:     	cmpq	%r14, %rsi
1402709f3:     	je	0x140270cec <.text+0x26fcec>
1402709f9:     	movl	(%rsi), %ecx
1402709fb:     	addq	$0x4, %rsi
1402709ff:     	movq	0x1a8(%r13), %rax
140270a06:     	leaq	(%rcx,%rcx,8), %rcx
140270a0a:     	movq	0x10(%rax,%rcx,8), %rdi
140270a0f:     	testq	%rdi, %rdi
140270a12:     	je	0x1402709f0 <.text+0x26f9f0>
140270a14:     	leaq	(%rax,%rcx,8), %r8
140270a18:     	movq	0x118(%r11), %rdx
140270a1f:     	movq	0x18(%r8), %rax
140270a23:     	movq	0x38(%r8), %rcx
140270a27:     	cmpq	0x40(%r8), %rdx
140270a2b:     	jae	0x140270acf <.text+0x26facf>
140270a31:     	movq	(%rcx,%rdx,8), %rdx
140270a35:     	testq	%rdx, %rdx
140270a38:     	je	0x140270acf <.text+0x26facf>
140270a3e:     	notq	%rdx
140270a41:     	leaq	(%rdx,%rdx,2), %rdx
140270a45:     	shlq	$0x4, %rdx
140270a49:     	movq	0x10(%rax,%rdx), %r10
140270a4e:     	jmp	0x140270ad2 <.text+0x26fad2>
140270a53:     	cmpl	%edi, %edx
140270a55:     	jne	0x140270b2f <.text+0x26fb2f>
140270a5b:     	nopl	(%rax,%rax)
140270a60:     	cmpq	%r14, %rsi
140270a63:     	je	0x140270cec <.text+0x26fcec>
140270a69:     	movl	(%rsi), %ecx
140270a6b:     	addq	$0x4, %rsi
140270a6f:     	movq	0x108(%r13), %rax
140270a76:     	leaq	(%rcx,%rcx,4), %rcx
140270a7a:     	shlq	$0x5, %rcx
140270a7e:     	movq	0x58(%rax,%rcx), %rdi
140270a83:     	testq	%rdi, %rdi
140270a86:     	je	0x140270a60 <.text+0x26fa60>
140270a88:     	addq	%rcx, %rax
140270a8b:     	movl	0x94(%rax), %ecx
140270a91:     	movq	0x1a8(%r13), %r9
140270a98:     	leaq	(%rcx,%rcx,8), %r10
140270a9c:     	movq	0x118(%r11), %r8
140270aa3:     	movq	0x18(%r9,%r10,8), %rcx
140270aa8:     	movq	0x38(%r9,%r10,8), %rdx
140270aad:     	cmpq	0x40(%r9,%r10,8), %r8
140270ab2:     	jae	0x140270aff <.text+0x26faff>
140270ab4:     	movq	(%rdx,%r8,8), %r8
140270ab8:     	testq	%r8, %r8
140270abb:     	je	0x140270aff <.text+0x26faff>
140270abd:     	notq	%r8
140270ac0:     	leaq	(%r8,%r8,2), %r8
140270ac4:     	shlq	$0x4, %r8
140270ac8:     	movq	0x10(%rcx,%r8), %r10
140270acd:     	jmp	0x140270b02 <.text+0x26fb02>
140270acf:     	xorl	%r10d, %r10d
140270ad2:     	movq	0x110(%r11), %rdx
140270ad9:     	movq	(%rcx,%rdx,8), %rcx
140270add:     	notq	%rcx
140270ae0:     	leaq	(%rcx,%rcx,2), %rcx
140270ae4:     	shlq	$0x4, %rcx
140270ae8:     	movq	0x10(%rax,%rcx), %r8
140270aed:     	movq	0x28(%rax,%rcx), %rax
140270af2:     	movq	%rax, 0x260(%rbp)
140270af9:     	xorl	%edx, %edx
140270afb:     	movl	%edx, %eax
140270afd:     	jmp	0x140270b3c <.text+0x26fb3c>
140270aff:     	xorl	%r10d, %r10d
140270b02:     	movq	0x110(%r11), %r8
140270b09:     	movq	(%rdx,%r8,8), %rdx
140270b0d:     	notq	%rdx
140270b10:     	leaq	(%rdx,%rdx,2), %rdx
140270b14:     	shlq	$0x4, %rdx
140270b18:     	movq	0x10(%rcx,%rdx), %r8
140270b1d:     	movq	0x28(%rcx,%rdx), %rcx
140270b22:     	movq	%rcx, 0x260(%rbp)
140270b29:     	movq	0x50(%rax), %r9
140270b2d:     	xorl	%edx, %edx
140270b2f:     	movl	%edx, %eax
140270b31:     	shlq	$0x4, %rax
140270b35:     	movl	0x8(%r9,%rax), %eax
140270b3a:     	notl	%eax
140270b3c:     	leaq	(%rax,%rax,2), %r12
140270b40:     	shlq	$0x7, %r12
140270b44:     	addq	%r8, %r12
140270b47:     	movq	0x260(%rbp), %rcx
140270b4e:     	leaq	(%rcx,%rax,4), %rcx
140270b52:     	leaq	(%r10,%rax,8), %rax
140270b56:     	incl	%edx
140270b58:     	movq	(%rax), %rbx
140270b5b:     	cmpq	0x200(%rbp), %rbx
140270b62:     	jae	0x1402709dd <.text+0x26f9dd>
140270b68:     	movq	%rcx, 0x258(%rbp)
140270b6f:     	movq	%r8, 0x188(%rbp)
140270b76:     	movq	%rdx, 0x210(%rbp)
140270b7d:     	movq	%r10, 0x228(%rbp)
140270b84:     	movq	%r9, 0x220(%rbp)
140270b8b:     	movq	0x1f8(%rbp), %r15
140270b92:     	movq	(%r15,%rbx,8), %r8
140270b96:     	movl	$0x2, %edx
140270b9b:     	leaq	0x5b4fc2d(%rip), %rcx   # 0x145dc07cf
140270ba2:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140270ba7:     	nop
140270ba8:     	testq	%rax, %rax
140270bab:     	jne	0x140270bb4 <.text+0x26fbb4>
140270bad:     	movq	0x7d696dc(%rip), %rax   # 0x147fda290
140270bb4:     	xorpd	%xmm10, %xmm10
140270bb9:     	cmpb	$0x2, (%rax)
140270bbc:     	jne	0x140270bfc <.text+0x26fbfc>
140270bbe:     	movq	0x8(%rax), %rcx
140270bc2:     	cmpq	$0x2, %rcx
140270bc6:     	je	0x140270bd9 <.text+0x26fbd9>
140270bc8:     	cmpl	$0x1, %ecx
140270bcb:     	jne	0x140270be1 <.text+0x26fbe1>
140270bcd:     	xorps	%xmm10, %xmm10
140270bd1:     	cvtsi2sdq	0x10(%rax), %xmm10
140270bd7:     	jmp	0x140270bfc <.text+0x26fbfc>
140270bd9:     	movsd	0x10(%rax), %xmm10
140270bdf:     	jmp	0x140270bfc <.text+0x26fbfc>
140270be1:     	movsd	0x10(%rax), %xmm0
140270be6:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
140270be9:     	subpd	%xmm7, %xmm0
140270bed:     	movapd	%xmm0, %xmm10
140270bf2:     	unpckhpd	%xmm0, %xmm10           # xmm10 = xmm10[1],xmm0[1]
140270bf7:     	addsd	%xmm0, %xmm10
140270bfc:     	movq	(%r15,%rbx,8), %r8
140270c00:     	movl	$0x5, %edx
140270c05:     	leaq	0x5b4fbc5(%rip), %rcx   # 0x145dc07d1
140270c0c:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140270c11:     	nop
140270c12:     	testq	%rax, %rax
140270c15:     	movq	0x258(%rbp), %rcx
140270c1c:     	jne	0x140270c25 <.text+0x26fc25>
140270c1e:     	movq	0x7d6966b(%rip), %rax   # 0x147fda290
140270c25:     	cmpb	$0x2, (%rax)
140270c28:     	movapd	%xmm8, %xmm0
140270c2d:     	movq	0x218(%rbp), %r11
140270c34:     	movzbl	0x26f(%rbp), %r15d
140270c3c:     	movq	0x220(%rbp), %r9
140270c43:     	movq	0x228(%rbp), %r10
140270c4a:     	movq	0x210(%rbp), %rdx
140270c51:     	movq	0x188(%rbp), %r8
140270c58:     	jne	0x140270ca6 <.text+0x26fca6>
140270c5a:     	movq	0x8(%rax), %rcx
140270c5e:     	cmpq	$0x2, %rcx
140270c62:     	je	0x140270c74 <.text+0x26fc74>
140270c64:     	cmpl	$0x1, %ecx
140270c67:     	jne	0x140270c82 <.text+0x26fc82>
140270c69:     	xorps	%xmm0, %xmm0
140270c6c:     	cvtsi2sdq	0x10(%rax), %xmm0
140270c72:     	jmp	0x140270c79 <.text+0x26fc79>
140270c74:     	movsd	0x10(%rax), %xmm0
140270c79:     	movq	0x258(%rbp), %rcx
140270c80:     	jmp	0x140270ca1 <.text+0x26fca1>
140270c82:     	movq	0x258(%rbp), %rcx
140270c89:     	movsd	0x10(%rax), %xmm1
140270c8e:     	unpcklps	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
140270c91:     	subpd	%xmm7, %xmm1
140270c95:     	movapd	%xmm1, %xmm0
140270c99:     	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
140270c9d:     	addsd	%xmm1, %xmm0
140270ca1:     	maxsd	%xmm8, %xmm0
140270ca6:     	divsd	%xmm0, %xmm10
140270cab:     	mulsd	%xmm9, %xmm10
140270cb0:     	xorpd	%xmm0, %xmm0
140270cb4:     	maxsd	%xmm10, %xmm0
140270cb9:     	movapd	%xmm9, %xmm1
140270cbe:     	minsd	%xmm0, %xmm1
140270cc2:     	xorps	%xmm0, %xmm0
140270cc5:     	cvtsd2ss	%xmm1, %xmm0
140270cc9:     	movl	0x184(%rbp), %eax
140270ccf:     	movl	%eax, (%rcx)
140270cd1:     	movl	$0x2, 0x88(%r12)
140270cdd:     	movss	%xmm0, 0x8c(%r12)
140270ce7:     	jmp	0x1402709dd <.text+0x26f9dd>
140270cec:     	movq	0x278(%rbp), %rax
140270cf3:     	leaq	0x360(%rax), %rcx
140270cfa:     	movq	0x280(%rbp), %rdx
140270d01:     	callq	0x140376e00 <.text+0x375e00>
140270d06:     	nop
140270d07:     	movq	0x278(%rbp), %rax
140270d0e:     	movq	0x458(%rax), %rcx
140270d15:     	movq	0x460(%rax), %rdx
140270d1c:     	movzbl	0x468(%rax), %r8d
140270d24:     	leaq	(,%rdx,4), %r10
140270d2c:     	movq	%rcx, %rax
140270d2f:     	testb	%r8b, %r8b
140270d32:     	je	0x140270dc0 <.text+0x26fdc0>
140270d38:     	movq	0x270(%rbp), %rbx
140270d3f:     	nop
140270d40:     	testq	%r10, %r10
140270d43:     	je	0x140270e6f <.text+0x26fe6f>
140270d49:     	movl	(%rax), %r9d
140270d4c:     	addq	$0x4, %rax
140270d50:     	movq	0x280(%rbp), %r11
140270d57:     	movq	0x1a8(%r11), %r11
140270d5e:     	leaq	(%r9,%r9,8), %rsi
140270d62:     	movq	0x10(%r11,%rsi,8), %r9
140270d67:     	addq	$-0x4, %r10
140270d6b:     	testq	%r9, %r9
140270d6e:     	je	0x140270d40 <.text+0x26fd40>
140270d70:     	leaq	(%r11,%rsi,8), %r10
140270d74:     	movq	0x278(%rbp), %r11
140270d7b:     	movq	0x470(%r11), %r11
140270d82:     	movq	0x18(%r10), %rdi
140270d86:     	movq	0x38(%r10), %r10
140270d8a:     	movq	(%r10,%r11,8), %r10
140270d8e:     	notq	%r10
140270d91:     	leaq	(%r10,%r10,2), %r10
140270d95:     	shlq	$0x4, %r10
140270d99:     	movq	0x10(%rdi,%r10), %rsi
140270d9e:     	movq	0x28(%rdi,%r10), %rdi
140270da3:     	movl	$0x1, %r10d
140270da9:     	leaq	(%rcx,%rdx,4), %rcx
140270dad:     	testb	%r8b, %r8b
140270db0:     	je	0x140270e80 <.text+0x26fe80>
140270db6:     	jmp	0x140270ed6 <.text+0x26fed6>
140270dbb:     	nopl	(%rax,%rax)
140270dc0:     	testq	%r10, %r10
140270dc3:     	je	0x140270ebe <.text+0x26febe>
140270dc9:     	movl	(%rax), %r9d
140270dcc:     	addq	$0x4, %rax
140270dd0:     	movq	0x280(%rbp), %r11
140270dd7:     	movq	0x108(%r11), %r11
140270dde:     	leaq	(%r9,%r9,4), %rsi
140270de2:     	shlq	$0x5, %rsi
140270de6:     	movq	0x58(%r11,%rsi), %r9
140270deb:     	addq	$-0x4, %r10
140270def:     	testq	%r9, %r9
140270df2:     	je	0x140270dc0 <.text+0x26fdc0>
140270df4:     	addq	%rsi, %r11
140270df7:     	movl	0x94(%r11), %r10d
140270dfe:     	movq	0x280(%rbp), %rsi
140270e05:     	movq	0x1a8(%rsi), %rsi
140270e0c:     	leaq	(%r10,%r10,8), %r10
140270e10:     	movq	0x278(%rbp), %rdi
140270e17:     	movq	0x470(%rdi), %rdi
140270e1e:     	movq	0x18(%rsi,%r10,8), %rbx
140270e23:     	movq	0x38(%rsi,%r10,8), %r10
140270e28:     	movq	(%r10,%rdi,8), %r10
140270e2c:     	notq	%r10
140270e2f:     	movq	0x50(%r11), %r11
140270e33:     	movl	0x8(%r11), %edi
140270e37:     	leaq	(%r10,%r10,2), %r10
140270e3b:     	shlq	$0x4, %r10
140270e3f:     	notl	%edi
140270e41:     	leaq	(%rdi,%rdi,2), %rsi
140270e45:     	shlq	$0x3, %rsi
140270e49:     	addq	0x10(%rbx,%r10), %rsi
140270e4e:     	shlq	$0x2, %rdi
140270e52:     	addq	0x28(%rbx,%r10), %rdi
140270e57:     	movl	$0x1, %r10d
140270e5d:     	movq	0x270(%rbp), %rbx
140270e64:     	leaq	(%rcx,%rdx,4), %rcx
140270e68:     	testb	%r8b, %r8b
140270e6b:     	je	0x140270e80 <.text+0x26fe80>
140270e6d:     	jmp	0x140270ed6 <.text+0x26fed6>
140270e6f:     	xorl	%r9d, %r9d
140270e72:     	xorl	%r10d, %r10d
140270e75:     	xorl	%esi, %esi
140270e77:     	leaq	(%rcx,%rdx,4), %rcx
140270e7b:     	testb	%r8b, %r8b
140270e7e:     	jne	0x140270ed6 <.text+0x26fed6>
140270e80:     	cmpl	%r9d, %r10d
140270e83:     	jne	0x140271025 <.text+0x270025>
140270e89:     	nopl	(%rax)
140270e90:     	cmpq	%rcx, %rax
140270e93:     	je	0x140270f0a <.text+0x26ff0a>
140270e95:     	movl	(%rax), %edx
140270e97:     	addq	$0x4, %rax
140270e9b:     	movq	0x280(%rbp), %r8
140270ea2:     	movq	0x108(%r8), %r8
140270ea9:     	leaq	(%rdx,%rdx,4), %rdx
140270ead:     	shlq	$0x5, %rdx
140270eb1:     	cmpq	$0x0, 0x58(%r8,%rdx)
140270eb7:     	je	0x140270e90 <.text+0x26fe90>
140270eb9:     	jmp	0x140271025 <.text+0x270025>
140270ebe:     	xorl	%r9d, %r9d
140270ec1:     	xorl	%r10d, %r10d
140270ec4:     	xorl	%esi, %esi
140270ec6:     	movq	0x270(%rbp), %rbx
140270ecd:     	leaq	(%rcx,%rdx,4), %rcx
140270ed1:     	testb	%r8b, %r8b
140270ed4:     	je	0x140270e80 <.text+0x26fe80>
140270ed6:     	cmpl	%r9d, %r10d
140270ed9:     	jne	0x140271025 <.text+0x270025>
140270edf:     	nop
140270ee0:     	cmpq	%rcx, %rax
140270ee3:     	je	0x140270f0a <.text+0x26ff0a>
140270ee5:     	movl	(%rax), %edx
140270ee7:     	addq	$0x4, %rax
140270eeb:     	movq	0x280(%rbp), %r8
140270ef2:     	movq	0x1a8(%r8), %r8
140270ef9:     	leaq	(%rdx,%rdx,8), %rdx
140270efd:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140270f03:     	je	0x140270ee0 <.text+0x26fee0>
140270f05:     	jmp	0x140271025 <.text+0x270025>
140270f0a:     	testq	%rsi, %rsi
140270f0d:     	je	0x140271025 <.text+0x270025>
140270f13:     	leaq	0x5b4f463(%rip), %rcx   # 0x145dc037d
140270f1a:     	movl	$0x5, %edx
140270f1f:     	leaq	0x60(%rbx), %r8
140270f23:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140270f28:     	nop
140270f29:     	testq	%rax, %rax
140270f2c:     	jne	0x140270f35 <.text+0x26ff35>
140270f2e:     	movq	0x7d6935b(%rip), %rax   # 0x147fda290
140270f35:     	xorpd	%xmm0, %xmm0
140270f39:     	cmpb	$0x2, (%rax)
140270f3c:     	xorpd	%xmm1, %xmm1
140270f40:     	jne	0x140270f83 <.text+0x26ff83>
140270f42:     	movq	0x8(%rax), %rcx
140270f46:     	cmpq	$0x2, %rcx
140270f4a:     	je	0x140270f5c <.text+0x26ff5c>
140270f4c:     	cmpl	$0x1, %ecx
140270f4f:     	jne	0x140270f63 <.text+0x26ff63>
140270f51:     	xorps	%xmm1, %xmm1
140270f54:     	cvtsi2sdq	0x10(%rax), %xmm1
140270f5a:     	jmp	0x140270f83 <.text+0x26ff83>
140270f5c:     	movsd	0x10(%rax), %xmm1
140270f61:     	jmp	0x140270f83 <.text+0x26ff83>
140270f63:     	movsd	0x10(%rax), %xmm2
140270f68:     	unpcklps	0x5b03101(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x145d74070
140270f6f:     	subpd	0x5b03109(%rip), %xmm2  # 0x145d74080
140270f77:     	movapd	%xmm2, %xmm1
140270f7b:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
140270f7f:     	addsd	%xmm2, %xmm1
140270f83:     	cvttsd2si	%xmm1, %rax
140270f88:     	movq	%rax, %rcx
140270f8b:     	movapd	%xmm1, %xmm2
140270f8f:     	subsd	0x5afc2e1(%rip), %xmm2  # 0x145d6d278
140270f97:     	cvttsd2si	%xmm2, %rdx
140270f9c:     	sarq	$0x3f, %rcx
140270fa0:     	andq	%rcx, %rdx
140270fa3:     	orq	%rax, %rdx
140270fa6:     	xorl	%eax, %eax
140270fa8:     	ucomisd	%xmm0, %xmm1
140270fac:     	cmovaeq	%rdx, %rax
140270fb0:     	ucomisd	0x5afc2c8(%rip), %xmm1  # 0x145d6d280
140270fb8:     	movq	$-0x1, %rcx
140270fbf:     	cmovbeq	%rax, %rcx
140270fc3:     	movq	%rcx, 0x190(%rbp)
140270fca:     	leaq	0x190(%rbp), %rax
140270fd1:     	movq	%rax, -0x10(%rbp)
140270fd5:     	leaq	0x593de94(%rip), %rax   # 0x145baee70 <.text+0x5bade70>
140270fdc:     	movq	%rax, -0x8(%rbp)
140270fe0:     	leaq	0x5b4f38b(%rip), %rdx   # 0x145dc0372
140270fe7:     	leaq	-0x58(%rbp), %rcx
140270feb:     	leaq	-0x10(%rbp), %r8
140270fef:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
140270ff4:     	nop
140270ff5:     	movl	0x254(%rbp), %eax
140270ffb:     	movl	%eax, (%rdi)
140270ffd:     	movq	(%rsi), %rdx
140271000:     	testq	%rdx, %rdx
140271003:     	je	0x140271014 <.text+0x270014>
140271005:     	movq	0x8(%rsi), %rcx
140271009:     	movl	$0x1, %r8d
14027100f:     	callq	0x1400021d0 <.text+0x11d0>
140271014:     	movq	-0x48(%rbp), %rax
140271018:     	movq	%rax, 0x10(%rsi)
14027101c:     	movupd	-0x58(%rbp), %xmm0
140271021:     	movupd	%xmm0, (%rsi)
140271025:     	movq	0x278(%rbp), %rax
14027102c:     	leaq	0x480(%rax), %rcx
140271033:     	movq	0x280(%rbp), %rdx
14027103a:     	callq	0x140376e00 <.text+0x375e00>
14027103f:     	nop
140271040:     	movq	0x278(%rbp), %rax
140271047:     	movq	0x578(%rax), %rcx
14027104e:     	movq	0x580(%rax), %rdx
140271055:     	movzbl	0x588(%rax), %r8d
14027105d:     	leaq	(,%rdx,4), %r10
140271065:     	movq	%rcx, %rax
140271068:     	testb	%r8b, %r8b
14027106b:     	je	0x140271100 <.text+0x270100>
140271071:     	nopw	%cs:(%rax,%rax)
140271080:     	testq	%r10, %r10
140271083:     	je	0x1402711de <.text+0x2701de>
140271089:     	movl	(%rax), %r9d
14027108c:     	addq	$0x4, %rax
140271090:     	movq	0x280(%rbp), %r11
140271097:     	movq	0x1a8(%r11), %r11
14027109e:     	leaq	(%r9,%r9,8), %rsi
1402710a2:     	movq	0x10(%r11,%rsi,8), %r9
1402710a7:     	addq	$-0x4, %r10
1402710ab:     	testq	%r9, %r9
1402710ae:     	je	0x140271080 <.text+0x270080>
1402710b0:     	leaq	(%r11,%rsi,8), %r10
1402710b4:     	movq	0x278(%rbp), %r11
1402710bb:     	movq	0x590(%r11), %r11
1402710c2:     	movq	0x18(%r10), %rsi
1402710c6:     	movq	0x38(%r10), %r10
1402710ca:     	movq	(%r10,%r11,8), %r10
1402710ce:     	notq	%r10
1402710d1:     	leaq	(%r10,%r10,2), %r10
1402710d5:     	shlq	$0x4, %r10
1402710d9:     	movq	0x10(%rsi,%r10), %rdi
1402710de:     	movq	0x28(%rsi,%r10), %rbx
1402710e3:     	movl	$0x1, %r10d
1402710e9:     	leaq	(%rcx,%rdx,4), %rcx
1402710ed:     	testb	%r8b, %r8b
1402710f0:     	jne	0x1402711ef <.text+0x2701ef>
1402710f6:     	jmp	0x1402711a6 <.text+0x2701a6>
1402710fb:     	nopl	(%rax,%rax)
140271100:     	testq	%r10, %r10
140271103:     	je	0x1402711de <.text+0x2701de>
140271109:     	movl	(%rax), %r9d
14027110c:     	addq	$0x4, %rax
140271110:     	movq	0x280(%rbp), %r11
140271117:     	movq	0x108(%r11), %r11
14027111e:     	leaq	(%r9,%r9,4), %rsi
140271122:     	shlq	$0x5, %rsi
140271126:     	movq	0x58(%r11,%rsi), %r9
14027112b:     	addq	$-0x4, %r10
14027112f:     	testq	%r9, %r9
140271132:     	je	0x140271100 <.text+0x270100>
140271134:     	addq	%rsi, %r11
140271137:     	movl	0x94(%r11), %r10d
14027113e:     	movq	0x280(%rbp), %rsi
140271145:     	movq	0x1a8(%rsi), %rsi
14027114c:     	leaq	(%r10,%r10,8), %r10
140271150:     	movq	0x278(%rbp), %rdi
140271157:     	movq	0x590(%rdi), %rdi
14027115e:     	movq	0x18(%rsi,%r10,8), %r14
140271163:     	movq	0x38(%rsi,%r10,8), %r10
140271168:     	movq	(%r10,%rdi,8), %r10
14027116c:     	notq	%r10
14027116f:     	movq	0x50(%r11), %r11
140271173:     	movl	0x8(%r11), %ebx
140271177:     	leaq	(%r10,%r10,2), %r10
14027117b:     	shlq	$0x4, %r10
14027117f:     	notl	%ebx
140271181:     	leaq	(%rbx,%rbx,2), %rdi
140271185:     	shlq	$0x3, %rdi
140271189:     	addq	0x10(%r14,%r10), %rdi
14027118e:     	shlq	$0x2, %rbx
140271192:     	addq	0x28(%r14,%r10), %rbx
140271197:     	movl	$0x1, %r10d
14027119d:     	leaq	(%rcx,%rdx,4), %rcx
1402711a1:     	testb	%r8b, %r8b
1402711a4:     	jne	0x1402711ef <.text+0x2701ef>
1402711a6:     	cmpl	%r9d, %r10d
1402711a9:     	jne	0x14027144d <.text+0x27044d>
1402711af:     	nop
1402711b0:     	cmpq	%rcx, %rax
1402711b3:     	je	0x14027122a <.text+0x27022a>
1402711b5:     	movl	(%rax), %edx
1402711b7:     	addq	$0x4, %rax
1402711bb:     	movq	0x280(%rbp), %r8
1402711c2:     	movq	0x108(%r8), %r8
1402711c9:     	leaq	(%rdx,%rdx,4), %rdx
1402711cd:     	shlq	$0x5, %rdx
1402711d1:     	cmpq	$0x0, 0x58(%r8,%rdx)
1402711d7:     	je	0x1402711b0 <.text+0x2701b0>
1402711d9:     	jmp	0x14027144d <.text+0x27044d>
1402711de:     	xorl	%r9d, %r9d
1402711e1:     	xorl	%r10d, %r10d
1402711e4:     	xorl	%edi, %edi
1402711e6:     	leaq	(%rcx,%rdx,4), %rcx
1402711ea:     	testb	%r8b, %r8b
1402711ed:     	je	0x1402711a6 <.text+0x2701a6>
1402711ef:     	cmpl	%r9d, %r10d
1402711f2:     	jne	0x14027144d <.text+0x27044d>
1402711f8:     	nopl	(%rax,%rax)
140271200:     	cmpq	%rcx, %rax
140271203:     	je	0x14027122a <.text+0x27022a>
140271205:     	movl	(%rax), %edx
140271207:     	addq	$0x4, %rax
14027120b:     	movq	0x280(%rbp), %r8
140271212:     	movq	0x1a8(%r8), %r8
140271219:     	leaq	(%rdx,%rdx,8), %rdx
14027121d:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140271223:     	je	0x140271200 <.text+0x270200>
140271225:     	jmp	0x14027144d <.text+0x27044d>
14027122a:     	testq	%rdi, %rdi
14027122d:     	je	0x14027144d <.text+0x27044d>
140271233:     	leaq	0x5b4f1b8(%rip), %rsi   # 0x145dc03f2
14027123a:     	movl	$0x4, %edx
14027123f:     	movq	%rsi, %rcx
140271242:     	movq	0x270(%rbp), %rax
140271249:     	leaq	0x60(%rax), %r8
14027124d:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140271252:     	nop
140271253:     	testq	%rax, %rax
140271256:     	jne	0x14027125f <.text+0x27025f>
140271258:     	movq	0x7d69031(%rip), %rax   # 0x147fda290
14027125f:     	xorpd	%xmm0, %xmm0
140271263:     	cmpb	$0x2, (%rax)
140271266:     	xorpd	%xmm1, %xmm1
14027126a:     	jne	0x1402712ad <.text+0x2702ad>
14027126c:     	movq	0x8(%rax), %rcx
140271270:     	cmpq	$0x2, %rcx
140271274:     	je	0x140271286 <.text+0x270286>
140271276:     	cmpl	$0x1, %ecx
140271279:     	jne	0x14027128d <.text+0x27028d>
14027127b:     	xorps	%xmm1, %xmm1
14027127e:     	cvtsi2sdq	0x10(%rax), %xmm1
140271284:     	jmp	0x1402712ad <.text+0x2702ad>
140271286:     	movsd	0x10(%rax), %xmm1
14027128b:     	jmp	0x1402712ad <.text+0x2702ad>
14027128d:     	movsd	0x10(%rax), %xmm2
140271292:     	unpcklps	0x5b02dd7(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x145d74070
140271299:     	subpd	0x5b02ddf(%rip), %xmm2  # 0x145d74080
1402712a1:     	movapd	%xmm2, %xmm1
1402712a5:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
1402712a9:     	addsd	%xmm2, %xmm1
1402712ad:     	cvttsd2si	%xmm1, %rax
1402712b2:     	movq	%rax, %rcx
1402712b5:     	movapd	%xmm1, %xmm2
1402712b9:     	subsd	0x5afbfb7(%rip), %xmm2  # 0x145d6d278
1402712c1:     	cvttsd2si	%xmm2, %rdx
1402712c6:     	sarq	$0x3f, %rcx
1402712ca:     	andq	%rcx, %rdx
1402712cd:     	orq	%rax, %rdx
1402712d0:     	xorl	%eax, %eax
1402712d2:     	ucomisd	%xmm0, %xmm1
1402712d6:     	cmovaeq	%rdx, %rax
1402712da:     	ucomisd	0x5afbf9e(%rip), %xmm1  # 0x145d6d280
1402712e2:     	movq	$-0x1, %rcx
1402712e9:     	cmovbeq	%rax, %rcx
1402712ed:     	movq	%rcx, -0x20(%rbp)
1402712f1:     	leaq	0x5b4f4a7(%rip), %rcx   # 0x145dc079f
1402712f8:     	movl	$0x9, %edx
1402712fd:     	movq	0x270(%rbp), %rax
140271304:     	leaq	0x60(%rax), %r8
140271308:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14027130d:     	nop
14027130e:     	testq	%rax, %rax
140271311:     	jne	0x14027131a <.text+0x27031a>
140271313:     	movq	0x7d68f76(%rip), %rax   # 0x147fda290
14027131a:     	xorpd	%xmm0, %xmm0
14027131e:     	cmpb	$0x2, (%rax)
140271321:     	xorpd	%xmm1, %xmm1
140271325:     	jne	0x140271368 <.text+0x270368>
140271327:     	movq	0x8(%rax), %rcx
14027132b:     	cmpq	$0x2, %rcx
14027132f:     	je	0x140271341 <.text+0x270341>
140271331:     	cmpl	$0x1, %ecx
140271334:     	jne	0x140271348 <.text+0x270348>
140271336:     	xorps	%xmm1, %xmm1
140271339:     	cvtsi2sdq	0x10(%rax), %xmm1
14027133f:     	jmp	0x140271368 <.text+0x270368>
140271341:     	movsd	0x10(%rax), %xmm1
140271346:     	jmp	0x140271368 <.text+0x270368>
140271348:     	movsd	0x10(%rax), %xmm2
14027134d:     	unpcklps	0x5b02d1c(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x145d74070
140271354:     	subpd	0x5b02d24(%rip), %xmm2  # 0x145d74080
14027135c:     	movapd	%xmm2, %xmm1
140271360:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
140271364:     	addsd	%xmm2, %xmm1
140271368:     	cvttsd2si	%xmm1, %rax
14027136d:     	movq	%rax, %rcx
140271370:     	movapd	%xmm1, %xmm2
140271374:     	subsd	0x5afbefc(%rip), %xmm2  # 0x145d6d278
14027137c:     	cvttsd2si	%xmm2, %rdx
140271381:     	sarq	$0x3f, %rcx
140271385:     	andq	%rcx, %rdx
140271388:     	orq	%rax, %rdx
14027138b:     	xorl	%eax, %eax
14027138d:     	ucomisd	%xmm0, %xmm1
140271391:     	cmovaeq	%rdx, %rax
140271395:     	ucomisd	0x5afbee3(%rip), %xmm1  # 0x145d6d280
14027139d:     	movq	$-0x1, %rcx
1402713a4:     	cmovbeq	%rax, %rcx
1402713a8:     	movq	%rcx, 0x230(%rbp)
1402713af:     	movq	%rsi, -0x10(%rbp)
1402713b3:     	movq	$0x4, -0x8(%rbp)
1402713bb:     	leaq	-0x20(%rbp), %rax
1402713bf:     	movq	%rax, (%rbp)
1402713c3:     	leaq	0x5b4f32e(%rip), %rax   # 0x145dc06f8
1402713ca:     	movq	%rax, 0x8(%rbp)
1402713ce:     	leaq	0x5b4f3d3(%rip), %rcx   # 0x145dc07a8
1402713d5:     	movq	%rcx, 0x10(%rbp)
1402713d9:     	movq	$0x4, 0x18(%rbp)
1402713e1:     	leaq	0x230(%rbp), %rcx
1402713e8:     	movq	%rcx, 0x20(%rbp)
1402713ec:     	movq	%rax, 0x28(%rbp)
1402713f0:     	movq	$0x2, 0x20(%rsp)
1402713f9:     	leaq	0x5b4f3ac(%rip), %rdx   # 0x145dc07ac
140271400:     	leaq	0x190(%rbp), %rcx
140271407:     	leaq	-0x10(%rbp), %r9
14027140b:     	movl	$0xe, %r8d
140271411:     	callq	0x1458da540 <.text+0x58d9540>
140271416:     	nop
140271417:     	movl	0x254(%rbp), %eax
14027141d:     	movl	%eax, (%rbx)
14027141f:     	movq	(%rdi), %rdx
140271422:     	testq	%rdx, %rdx
140271425:     	je	0x140271436 <.text+0x270436>
140271427:     	movq	0x8(%rdi), %rcx
14027142b:     	movl	$0x1, %r8d
140271431:     	callq	0x1400021d0 <.text+0x11d0>
140271436:     	movq	0x1a0(%rbp), %rax
14027143d:     	movq	%rax, 0x10(%rdi)
140271441:     	movupd	0x190(%rbp), %xmm0
140271449:     	movupd	%xmm0, (%rdi)
14027144d:     	movb	$0x3, %al
14027144f:     	movq	0x270(%rbp), %rcx
140271456:     	cmpb	$0x0, 0xe9(%rcx)
14027145d:     	jne	0x1402714b1 <.text+0x2704b1>
14027145f:     	leaq	0x5b4f354(%rip), %rcx   # 0x145dc07ba
140271466:     	movl	$0x5, %edx
14027146b:     	movq	0x208(%rbp), %r8
140271472:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140271477:     	nop
140271478:     	testq	%rax, %rax
14027147b:     	jne	0x140271484 <.text+0x270484>
14027147d:     	movq	0x7d68e0c(%rip), %rax   # 0x147fda290
140271484:     	cmpb	$0x3, (%rax)
140271487:     	jne	0x1402714af <.text+0x2704af>
140271489:     	cmpq	$0x7, 0x18(%rax)
14027148e:     	jne	0x1402714af <.text+0x2704af>
140271490:     	movq	0x10(%rax), %rax
140271494:     	movl	$0x79616c70, %ecx       # imm = 0x79616C70
140271499:     	xorl	(%rax), %ecx
14027149b:     	movl	$0x676e6979, %edx       # imm = 0x676E6979
1402714a0:     	xorl	0x3(%rax), %edx
1402714a3:     	xorl	%eax, %eax
1402714a5:     	orl	%ecx, %edx
1402714a7:     	sete	%al
1402714aa:     	leal	(%rax,%rax,2), %eax
1402714ad:     	jmp	0x1402714b1 <.text+0x2704b1>
1402714af:     	xorl	%eax, %eax
1402714b1:     	movq	0x380(%rbp), %rcx
1402714b8:     	movq	(%rcx), %rsi
1402714bb:     	movq	0x8(%rcx), %rcx
1402714bf:     	movq	0xf8(%rsi), %r8
1402714c6:     	movq	0x100(%rsi), %r9
1402714cd:     	movzbl	0x108(%rsi), %r10d
1402714d5:     	testb	%r10b, %r10b
1402714d8:     	je	0x14027156a <.text+0x27056a>
1402714de:     	leaq	(,%r9,4), %rdi
1402714e6:     	movq	%r8, %rdx
1402714e9:     	nopl	(%rax)
1402714f0:     	testq	%rdi, %rdi
1402714f3:     	je	0x140271637 <.text+0x270637>
1402714f9:     	movl	(%rdx), %r11d
1402714fc:     	addq	$0x4, %rdx
140271500:     	movq	0x1a8(%rcx), %rbx
140271507:     	leaq	(%r11,%r11,8), %r14
14027150b:     	movq	0x10(%rbx,%r14,8), %r11
140271510:     	addq	$-0x4, %rdi
140271514:     	testq	%r11, %r11
140271517:     	je	0x1402714f0 <.text+0x2704f0>
140271519:     	leaq	(%rbx,%r14,8), %rdi
14027151d:     	movq	0x110(%rsi), %rbx
140271524:     	movq	0x118(%rsi), %rsi
14027152b:     	movq	0x18(%rdi), %r15
14027152f:     	movq	0x38(%rdi), %rdi
140271533:     	movq	(%rdi,%rbx,8), %rbx
140271537:     	notq	%rbx
14027153a:     	leaq	(%rbx,%rbx,2), %r14
14027153e:     	shlq	$0x4, %r14
140271542:     	movq	0x10(%r15,%r14), %rbx
140271547:     	movq	0x28(%r15,%r14), %r14
14027154c:     	movq	(%rdi,%rsi,8), %rsi
140271550:     	notq	%rsi
140271553:     	leaq	(%rsi,%rsi,2), %rsi
140271557:     	shlq	$0x4, %rsi
14027155b:     	movq	0x10(%r15,%rsi), %rdi
140271560:     	movq	0x28(%r15,%rsi), %rsi
140271565:     	jmp	0x14027162f <.text+0x27062f>
14027156a:     	leaq	(,%r9,4), %rbx
140271572:     	movq	%r8, %rdx
140271575:     	nopw	%cs:(%rax,%rax)
140271580:     	testq	%rbx, %rbx
140271583:     	je	0x140271637 <.text+0x270637>
140271589:     	movl	(%rdx), %r11d
14027158c:     	addq	$0x4, %rdx
140271590:     	movq	0x108(%rcx), %rdi
140271597:     	leaq	(%r11,%r11,4), %r14
14027159b:     	shlq	$0x5, %r14
14027159f:     	movq	0x58(%rdi,%r14), %r11
1402715a4:     	addq	$-0x4, %rbx
1402715a8:     	testq	%r11, %r11
1402715ab:     	je	0x140271580 <.text+0x270580>
1402715ad:     	addq	%r14, %rdi
1402715b0:     	movl	0x94(%rdi), %ebx
1402715b6:     	movq	0x1a8(%rcx), %r14
1402715bd:     	leaq	(%rbx,%rbx,8), %rbx
1402715c1:     	movq	0x110(%rsi), %r12
1402715c8:     	movq	0x118(%rsi), %rsi
1402715cf:     	movq	0x18(%r14,%rbx,8), %r15
1402715d4:     	movq	0x38(%r14,%rbx,8), %rbx
1402715d9:     	movq	(%rbx,%r12,8), %r14
1402715dd:     	notq	%r14
1402715e0:     	leaq	(%r14,%r14,2), %r14
1402715e4:     	shlq	$0x4, %r14
1402715e8:     	movq	(%rbx,%rsi,8), %rsi
1402715ec:     	notq	%rsi
1402715ef:     	movq	0x50(%rdi), %rdi
1402715f3:     	movl	0x8(%rdi), %edi
1402715f6:     	leaq	(%rsi,%rsi,2), %r12
1402715fa:     	shlq	$0x4, %r12
1402715fe:     	notl	%edi
140271600:     	leaq	(%rdi,%rdi,2), %rbx
140271604:     	shlq	$0x7, %rbx
140271608:     	addq	0x10(%r15,%r14), %rbx
14027160d:     	leaq	(,%rdi,4), %rsi
140271615:     	movq	0x28(%r15,%r14), %r14
14027161a:     	leaq	(%rdi,%rdi,4), %rdi
14027161e:     	shlq	$0x2, %rdi
140271622:     	addq	0x10(%r15,%r12), %rdi
140271627:     	addq	%rsi, %r14
14027162a:     	addq	0x28(%r15,%r12), %rsi
14027162f:     	movl	$0x1, %r12d
140271635:     	jmp	0x14027163f <.text+0x27063f>
140271637:     	xorl	%r11d, %r11d
14027163a:     	xorl	%r12d, %r12d
14027163d:     	xorl	%ebx, %ebx
14027163f:     	movq	0x380(%rbp), %r15
140271646:     	movl	0x14(%r15), %r15d
14027164a:     	leaq	(%r8,%r9,4), %r8
14027164e:     	testb	%r10b, %r10b
140271651:     	je	0x140271684 <.text+0x270684>
140271653:     	cmpl	%r11d, %r12d
140271656:     	jne	0x140271707 <.text+0x270707>
14027165c:     	nopl	(%rax)
140271660:     	cmpq	%r8, %rdx
140271663:     	je	0x1402716b5 <.text+0x2706b5>
140271665:     	movl	(%rdx), %r9d
140271668:     	addq	$0x4, %rdx
14027166c:     	movq	0x1a8(%rcx), %r10
140271673:     	leaq	(%r9,%r9,8), %r9
140271677:     	cmpq	$0x0, 0x10(%r10,%r9,8)
14027167d:     	je	0x140271660 <.text+0x270660>
14027167f:     	jmp	0x140271707 <.text+0x270707>
140271684:     	cmpl	%r11d, %r12d
140271687:     	jne	0x140271707 <.text+0x270707>
14027168d:     	nopl	(%rax)
140271690:     	cmpq	%r8, %rdx
140271693:     	je	0x1402716b5 <.text+0x2706b5>
140271695:     	movl	(%rdx), %r9d
140271698:     	addq	$0x4, %rdx
14027169c:     	movq	0x108(%rcx), %r10
1402716a3:     	leaq	(%r9,%r9,4), %r9
1402716a7:     	shlq	$0x5, %r9
1402716ab:     	cmpq	$0x0, 0x58(%r10,%r9)
1402716b1:     	je	0x140271690 <.text+0x270690>
1402716b3:     	jmp	0x140271707 <.text+0x270707>
1402716b5:     	testq	%rbx, %rbx
1402716b8:     	je	0x140271707 <.text+0x270707>
1402716ba:     	movl	%r15d, (%r14)
1402716bd:     	movb	%al, 0x175(%rbx)
1402716c3:     	movq	0x358(%rbp), %rax
1402716ca:     	movss	0x5c(%rax), %xmm0
1402716cf:     	mulss	0x5b4de19(%rip), %xmm0  # 0x145dbf4f0
1402716d7:     	callq	0x145bc97bd <.text+0x5bc87bd>
1402716dc:     	andps	0x5b2985d(%rip), %xmm0  # 0x145d9af40
1402716e3:     	mulss	0x5afc0b9(%rip), %xmm0  # 0x145d6d7a4
1402716eb:     	addss	0x5b028d1(%rip), %xmm0  # 0x145d73fc4
1402716f3:     	movl	%r15d, (%rsi)
1402716f6:     	movupd	0x5b4efd6(%rip), %xmm1  # 0x145dc06d4
1402716fe:     	movupd	%xmm1, (%rdi)
140271702:     	movss	%xmm0, 0x10(%rdi)
140271707:     	leaq	0x5b4f0b1(%rip), %rcx   # 0x145dc07bf
14027170e:     	movl	$0x9, %edx
140271713:     	movq	0x208(%rbp), %r8
14027171a:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14027171f:     	nop
140271720:     	testq	%rax, %rax
140271723:     	jne	0x14027172c <.text+0x27072c>
140271725:     	movq	0x7d68b64(%rip), %rax   # 0x147fda290
14027172c:     	cmpb	$0x4, (%rax)
14027172f:     	movq	0x178(%rbp), %r12
140271736:     	jne	0x14027177b <.text+0x27077b>
140271738:     	movq	0x10(%rax), %rsi
14027173c:     	movq	0x18(%rax), %rdi
140271740:     	testq	%rdi, %rdi
140271743:     	je	0x14027179e <.text+0x27079e>
140271745:     	leaq	(,%rdi,8), %rax
14027174d:     	leaq	(%rax,%rax,2), %rbx
140271751:     	callq	0x140002200 <.text+0x1200>
140271756:     	movl	$0x8, %edx
14027175b:     	movq	%rbx, %rcx
14027175e:     	callq	0x1400021c0 <.text+0x11c0>
140271763:     	testq	%rax, %rax
140271766:     	jne	0x1402717a3 <.text+0x2707a3>
140271768:     	movl	$0x8, %ecx
14027176d:     	movq	%rbx, %rdx
140271770:     	callq	0x145d6944b <.text+0x5d6844b>
140271775:     	nop
140271776:     	jmp	0x140271ce2 <.text+0x270ce2>
14027177b:     	movq	$0x0, 0x230(%rbp)
140271786:     	movq	$0x8, 0x238(%rbp)
140271791:     	movq	$0x0, 0x240(%rbp)
14027179c:     	jmp	0x140271808 <.text+0x270808>
14027179e:     	movl	$0x8, %eax
1402717a3:     	movq	%rdi, %rdx
1402717a6:     	shlq	$0x5, %rdx
1402717aa:     	addq	%rsi, %rdx
1402717ad:     	movq	%rdi, 0x190(%rbp)
1402717b4:     	movq	%rax, 0x198(%rbp)
1402717bb:     	leaq	0x1a0(%rbp), %rcx
1402717c2:     	movq	$0x0, 0x1a0(%rbp)
1402717cd:     	movq	%rax, (%rbp)
1402717d1:     	movq	%rcx, -0x10(%rbp)
1402717d5:     	movq	$0x0, -0x8(%rbp)
1402717dd:     	leaq	-0x10(%rbp), %r8
1402717e1:     	movq	%rsi, %rcx
1402717e4:     	callq	0x14014acf0 <.text+0x149cf0>
1402717e9:     	nop
1402717ea:     	movupd	0x190(%rbp), %xmm0
1402717f2:     	movapd	%xmm0, 0x230(%rbp)
1402717fa:     	movq	0x1a0(%rbp), %rax
140271801:     	movq	%rax, 0x240(%rbp)
140271808:     	leaq	0x5b4efb9(%rip), %rcx   # 0x145dc07c8
14027180f:     	movl	$0x7, %edx
140271814:     	movq	0x208(%rbp), %r8
14027181b:     	callq	0x142ad39e0 <.text+0x2ad29e0>
140271820:     	nop
140271821:     	testq	%rax, %rax
140271824:     	jne	0x14027182d <.text+0x27082d>
140271826:     	movq	0x7d68a63(%rip), %rax   # 0x147fda290
14027182d:     	cmpb	$0x4, (%rax)
140271830:     	jne	0x140271875 <.text+0x270875>
140271832:     	movq	0x10(%rax), %rsi
140271836:     	movq	0x18(%rax), %rdi
14027183a:     	testq	%rdi, %rdi
14027183d:     	je	0x140271880 <.text+0x270880>
14027183f:     	leaq	(,%rdi,8), %rax
140271847:     	leaq	(%rax,%rax,2), %rbx
14027184b:     	callq	0x140002200 <.text+0x1200>
140271850:     	movl	$0x8, %edx
140271855:     	movq	%rbx, %rcx
140271858:     	callq	0x1400021c0 <.text+0x11c0>
14027185d:     	testq	%rax, %rax
140271860:     	jne	0x140271885 <.text+0x270885>
140271862:     	movl	$0x8, %ecx
140271867:     	movq	%rbx, %rdx
14027186a:     	callq	0x145d6944b <.text+0x5d6844b>
14027186f:     	nop
140271870:     	jmp	0x140271ce2 <.text+0x270ce2>
140271875:     	movl	$0x8, %eax
14027187a:     	xorl	%ecx, %ecx
14027187c:     	xorl	%edx, %edx
14027187e:     	jmp	0x1402718e1 <.text+0x2708e1>
140271880:     	movl	$0x8, %eax
140271885:     	movq	%rdi, %rdx
140271888:     	shlq	$0x5, %rdx
14027188c:     	addq	%rsi, %rdx
14027188f:     	movq	%rdi, 0x190(%rbp)
140271896:     	movq	%rax, 0x198(%rbp)
14027189d:     	leaq	0x1a0(%rbp), %rcx
1402718a4:     	movq	$0x0, 0x1a0(%rbp)
1402718af:     	movq	%rax, (%rbp)
1402718b3:     	movq	%rcx, -0x10(%rbp)
1402718b7:     	movq	$0x0, -0x8(%rbp)
1402718bf:     	leaq	-0x10(%rbp), %r8
1402718c3:     	movq	%rsi, %rcx
1402718c6:     	callq	0x14014acf0 <.text+0x149cf0>
1402718cb:     	nop
1402718cc:     	movq	0x190(%rbp), %rdx
1402718d3:     	movq	0x198(%rbp), %rax
1402718da:     	movq	0x1a0(%rbp), %rcx
1402718e1:     	movq	0x240(%rbp), %r8
1402718e8:     	movq	%r8, 0x1a0(%rbp)
1402718ef:     	movapd	0x230(%rbp), %xmm0
1402718f7:     	movapd	%xmm0, 0x190(%rbp)
1402718ff:     	movq	%rdx, 0x1a8(%rbp)
140271906:     	movq	%rax, 0x1b0(%rbp)
14027190d:     	movq	%rcx, 0x1b8(%rbp)
140271914:     	leaq	0x190(%rbp), %rax
14027191b:     	movq	%rax, 0x230(%rbp)
140271922:     	leaq	-0x9719(%rip), %rax     # 0x140268210 <.text+0x267210>
140271929:     	movq	%rax, 0x238(%rbp)
140271930:     	leaq	0x5b4ea3b(%rip), %rdx   # 0x145dc0372
140271937:     	leaq	-0x10(%rbp), %rcx
14027193b:     	leaq	0x230(%rbp), %r8
140271942:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
140271947:     	nop
140271948:     	movq	-0x10(%rbp), %rsi
14027194c:     	movq	-0x8(%rbp), %rbx
140271950:     	movq	(%rbp), %r14
140271954:     	movq	0x390(%rbp), %rcx
14027195b:     	cmpq	%r14, 0x10(%rcx)
14027195f:     	jne	0x14027197f <.text+0x27097f>
140271961:     	movq	0x8(%rcx), %rcx
140271965:     	movq	%rbx, %rdx
140271968:     	movq	%r14, %r8
14027196b:     	callq	0x145bc9787 <.text+0x5bc8787>
140271970:     	movq	0x390(%rbp), %rcx
140271977:     	testl	%eax, %eax
140271979:     	je	0x140271bb8 <.text+0x270bb8>
14027197f:     	movq	(%rcx), %rdx
140271982:     	testq	%rdx, %rdx
140271985:     	je	0x14027199d <.text+0x27099d>
140271987:     	movq	0x8(%rcx), %rcx
14027198b:     	movl	$0x1, %r8d
140271991:     	callq	0x1400021d0 <.text+0x11d0>
140271996:     	movq	0x390(%rbp), %rcx
14027199d:     	movq	%rsi, (%rcx)
1402719a0:     	movq	%rbx, 0x8(%rcx)
1402719a4:     	movq	%r14, 0x10(%rcx)
1402719a8:     	movq	0x388(%rbp), %rcx
1402719af:     	movq	(%rcx), %rax
1402719b2:     	movq	0x8(%rcx), %rbx
1402719b6:     	movq	0xf8(%rax), %r14
1402719bd:     	movq	0x100(%rax), %rcx
1402719c4:     	leaq	(%r14,%rcx,4), %r15
1402719c8:     	movzbl	0x108(%rax), %edx
1402719cf:     	movq	0x10(%r12), %r8
1402719d4:     	movq	0x20(%r12), %rax
1402719d9:     	movq	%rax, 0x280(%rbp)
1402719e0:     	movq	0x18(%r12), %rax
1402719e5:     	movq	%rax, 0x278(%rbp)
1402719ec:     	movq	(%r12), %r11
1402719f0:     	movq	0x8(%r12), %r9
1402719f5:     	xorl	%r13d, %r13d
1402719f8:     	movl	$0x8, %ecx
1402719fd:     	leaq	-0x10(%rbp), %r10
140271a01:     	movl	$0x8, %esi
140271a06:     	xorl	%r12d, %r12d
140271a09:     	testb	%dl, %dl
140271a0b:     	jne	0x140271a84 <.text+0x270a84>
140271a0d:     	movq	%rcx, 0x270(%rbp)
140271a14:     	jmp	0x140271a36 <.text+0x270a36>
140271a16:     	addq	%rcx, %rax
140271a19:     	movq	0x50(%rax), %rsi
140271a1d:     	xorl	%r12d, %r12d
140271a20:     	movl	%r12d, %eax
140271a23:     	shlq	$0x4, %rax
140271a27:     	incl	%r12d
140271a2a:     	movq	(%rsi,%rax), %rdi
140271a2e:     	testl	%edi, %edi
140271a30:     	jne	0x140271abe <.text+0x270abe>
140271a36:     	cmpl	%r13d, %r12d
140271a39:     	jne	0x140271a20 <.text+0x270a20>
140271a3b:     	nopl	(%rax,%rax)
140271a40:     	cmpq	%r15, %r14
140271a43:     	je	0x140271bce <.text+0x270bce>
140271a49:     	movl	(%r14), %ecx
140271a4c:     	addq	$0x4, %r14
140271a50:     	movq	0x108(%rbx), %rax
140271a57:     	leaq	(%rcx,%rcx,4), %rcx
140271a5b:     	shlq	$0x5, %rcx
140271a5f:     	movq	0x58(%rax,%rcx), %r13
140271a64:     	testq	%r13, %r13
140271a67:     	je	0x140271a40 <.text+0x270a40>
140271a69:     	jmp	0x140271a16 <.text+0x270a16>
140271a6b:     	leaq	(%rax,%rcx,8), %rax
140271a6f:     	movq	0x8(%rax), %rcx
140271a73:     	xorl	%r12d, %r12d
140271a76:     	movl	%r12d, %eax
140271a79:     	incl	%r12d
140271a7c:     	movq	(%rcx,%rax,8), %rdi
140271a80:     	testl	%edi, %edi
140271a82:     	jne	0x140271ab7 <.text+0x270ab7>
140271a84:     	cmpl	%r13d, %r12d
140271a87:     	jne	0x140271a76 <.text+0x270a76>
140271a89:     	nopl	(%rax)
140271a90:     	cmpq	%r15, %r14
140271a93:     	je	0x140271bce <.text+0x270bce>
140271a99:     	movl	(%r14), %ecx
140271a9c:     	addq	$0x4, %r14
140271aa0:     	movq	0x1a8(%rbx), %rax
140271aa7:     	leaq	(%rcx,%rcx,8), %rcx
140271aab:     	movq	0x10(%rax,%rcx,8), %r13
140271ab0:     	testq	%r13, %r13
140271ab3:     	je	0x140271a90 <.text+0x270a90>
140271ab5:     	jmp	0x140271a6b <.text+0x270a6b>
140271ab7:     	movq	%rcx, 0x270(%rbp)
140271abe:     	testl	%edi, %edi
140271ac0:     	je	0x140271bce <.text+0x270bce>
140271ac6:     	movb	%dl, 0x228(%rbp)
140271acc:     	testq	%r8, %r8
140271acf:     	movq	0x208(%rbp), %rax
140271ad6:     	cmovneq	0x280(%rbp), %rax
140271ade:     	movq	%rdi, -0x10(%rbp)
140271ae2:     	movq	%r11, -0x8(%rbp)
140271ae6:     	movq	%r9, 0x260(%rbp)
140271aed:     	movq	%r9, (%rbp)
140271af1:     	movq	%r8, 0x8(%rbp)
140271af5:     	movq	0x278(%rbp), %rcx
140271afc:     	movq	%rcx, 0x10(%rbp)
140271b00:     	movq	%rax, 0x208(%rbp)
140271b07:     	movq	%rax, 0x18(%rbp)
140271b0b:     	movq	%r10, %rcx
140271b0e:     	movq	%r8, 0x220(%rbp)
140271b15:     	movq	%r11, 0x258(%rbp)
140271b1c:     	callq	0x1401a3a10 <.text+0x1a2a10>
140271b21:     	nop
140271b22:     	movq	0x220(%rbp), %rdx
140271b29:     	testq	%rdx, %rdx
140271b2c:     	movq	0x210(%rbp), %rax
140271b33:     	cmovneq	0x280(%rbp), %rax
140271b3b:     	movq	%rdi, -0x10(%rbp)
140271b3f:     	movq	0x258(%rbp), %rcx
140271b46:     	movq	%rcx, -0x8(%rbp)
140271b4a:     	movq	0x260(%rbp), %rcx
140271b51:     	movq	%rcx, (%rbp)
140271b55:     	movq	%rdx, 0x8(%rbp)
140271b59:     	movq	0x278(%rbp), %rcx
140271b60:     	movq	%rcx, 0x10(%rbp)
140271b64:     	movq	%rax, 0x210(%rbp)
140271b6b:     	movq	%rax, 0x18(%rbp)
140271b6f:     	leaq	-0x10(%rbp), %rcx
140271b73:     	leaq	0x190(%rbp), %rdx
140271b7a:     	movq	-0x18(%rbp), %r8
140271b7e:     	callq	0x1401b5a90 <.text+0x1b4a90>
140271b83:     	nop
140271b84:     	movzbl	0x228(%rbp), %edx
140271b8b:     	movq	0x220(%rbp), %r8
140271b92:     	movq	0x258(%rbp), %r11
140271b99:     	movq	0x260(%rbp), %r9
140271ba0:     	leaq	-0x10(%rbp), %r10
140271ba4:     	movq	0x270(%rbp), %rcx
140271bab:     	testb	%dl, %dl
140271bad:     	je	0x140271a0d <.text+0x270a0d>
140271bb3:     	jmp	0x140271a84 <.text+0x270a84>
140271bb8:     	testq	%rsi, %rsi
140271bbb:     	je	0x140271bce <.text+0x270bce>
140271bbd:     	movl	$0x1, %r8d
140271bc3:     	movq	%rbx, %rcx
140271bc6:     	movq	%rsi, %rdx
140271bc9:     	callq	0x1400021d0 <.text+0x11d0>
140271bce:     	movq	0x1a0(%rbp), %rsi
140271bd5:     	testq	%rsi, %rsi
140271bd8:     	je	0x140271c12 <.text+0x270c12>
140271bda:     	movq	0x198(%rbp), %rdi
140271be1:     	addq	$0x8, %rdi
140271be5:     	jmp	0x140271bf9 <.text+0x270bf9>
140271be7:     	nopw	(%rax,%rax)
140271bf0:     	addq	$0x18, %rdi
140271bf4:     	decq	%rsi
140271bf7:     	je	0x140271c12 <.text+0x270c12>
140271bf9:     	movq	-0x8(%rdi), %rdx
140271bfd:     	testq	%rdx, %rdx
140271c00:     	je	0x140271bf0 <.text+0x270bf0>
140271c02:     	movq	(%rdi), %rcx
140271c05:     	movl	$0x1, %r8d
140271c0b:     	callq	0x1400021d0 <.text+0x11d0>
140271c10:     	jmp	0x140271bf0 <.text+0x270bf0>
140271c12:     	movq	0x190(%rbp), %rax
140271c19:     	testq	%rax, %rax
140271c1c:     	je	0x140271c38 <.text+0x270c38>
140271c1e:     	movq	0x198(%rbp), %rcx
140271c25:     	shlq	$0x3, %rax
140271c29:     	leaq	(%rax,%rax,2), %rdx
140271c2d:     	movl	$0x8, %r8d
140271c33:     	callq	0x1400021d0 <.text+0x11d0>
140271c38:     	movq	0x1b8(%rbp), %rsi
140271c3f:     	testq	%rsi, %rsi
140271c42:     	je	0x140271c82 <.text+0x270c82>
140271c44:     	movq	0x1b0(%rbp), %rdi
140271c4b:     	addq	$0x8, %rdi
140271c4f:     	jmp	0x140271c69 <.text+0x270c69>
140271c51:     	nopw	%cs:(%rax,%rax)
140271c60:     	addq	$0x18, %rdi
140271c64:     	decq	%rsi
140271c67:     	je	0x140271c82 <.text+0x270c82>
140271c69:     	movq	-0x8(%rdi), %rdx
140271c6d:     	testq	%rdx, %rdx
140271c70:     	je	0x140271c60 <.text+0x270c60>
140271c72:     	movq	(%rdi), %rcx
140271c75:     	movl	$0x1, %r8d
140271c7b:     	callq	0x1400021d0 <.text+0x11d0>
140271c80:     	jmp	0x140271c60 <.text+0x270c60>
140271c82:     	movq	0x1a8(%rbp), %rax
140271c89:     	testq	%rax, %rax
140271c8c:     	je	0x140271ca8 <.text+0x270ca8>
140271c8e:     	movq	0x1b0(%rbp), %rcx
140271c95:     	shlq	$0x3, %rax
140271c99:     	leaq	(%rax,%rax,2), %rdx
140271c9d:     	movl	$0x8, %r8d
140271ca3:     	callq	0x1400021d0 <.text+0x11d0>
140271ca8:     	movq	0x1f0(%rbp), %rdx
140271caf:     	testq	%rdx, %rdx
140271cb2:     	je	0x14026fac3 <.text+0x26eac3>
140271cb8:     	movq	0x1f8(%rbp), %rcx
140271cbf:     	shlq	$0x3, %rdx
140271cc3:     	movl	$0x8, %r8d
140271cc9:     	callq	0x1400021d0 <.text+0x11d0>
140271cce:     	jmp	0x14026fac3 <.text+0x26eac3>
140271cd3:     	xorl	%ecx, %ecx
140271cd5:     	movq	0x218(%rbp), %rdx
140271cdc:     	callq	0x145d6944b <.text+0x5d6844b>
140271ce1:     	nop
140271ce2:     	ud2
140271ce4:     	movq	$0x1, 0x20(%rsp)
140271ced:     	movl	$0x10, %r8d
140271cf3:     	movl	$0x1, %r9d
140271cf9:     	movq	%rsi, %rcx
140271cfc:     	movq	%rbx, %rdx
140271cff:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140271d04:     	nop
140271d05:     	jmp	0x140270546 <.text+0x26f546>
140271d0a:     	movq	(%rbp), %rdx
140271d0e:     	movq	%r13, %rcx
140271d11:     	callq	0x145d6944b <.text+0x5d6844b>
140271d16:     	ud2
140271d18:     	movl	$0x8, %ecx
140271d1d:     	movl	$0x8, %edx
140271d22:     	callq	0x145d6944b <.text+0x5d6844b>
140271d27:     	ud2
140271d29:     	movq	%r14, 0x218(%rbp)
140271d30:     	movl	$0x1, %ecx
140271d35:     	jmp	0x140271cd5 <.text+0x270cd5>
