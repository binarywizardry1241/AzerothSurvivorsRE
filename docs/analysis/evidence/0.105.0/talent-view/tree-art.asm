
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140128540:     	pushq	%rbp
140128541:     	pushq	%r15
140128543:     	pushq	%r14
140128545:     	pushq	%r13
140128547:     	pushq	%r12
140128549:     	pushq	%rsi
14012854a:     	pushq	%rdi
14012854b:     	pushq	%rbx
14012854c:     	subq	$0x6b8, %rsp            # imm = 0x6B8
140128553:     	leaq	0x80(%rsp), %rbp
14012855b:     	movaps	%xmm15, 0x620(%rbp)
140128563:     	movaps	%xmm14, 0x610(%rbp)
14012856b:     	movaps	%xmm13, 0x600(%rbp)
140128573:     	movaps	%xmm12, 0x5f0(%rbp)
14012857b:     	movaps	%xmm11, 0x5e0(%rbp)
140128583:     	movaps	%xmm10, 0x5d0(%rbp)
14012858b:     	movaps	%xmm9, 0x5c0(%rbp)
140128593:     	movaps	%xmm8, 0x5b0(%rbp)
14012859b:     	movaps	%xmm7, 0x5a0(%rbp)
1401285a2:     	movaps	%xmm6, 0x590(%rbp)
1401285a9:     	movq	$-0x2, 0x588(%rbp)
1401285b4:     	movq	%r9, %rdi
1401285b7:     	movq	%r8, 0x558(%rbp)
1401285be:     	movq	%rdx, 0x540(%rbp)
1401285c5:     	leaq	0x468(%rbp), %rdx
1401285cc:     	leaq	0x5c823ad(%rip), %rax   # 0x145daa980
1401285d3:     	movq	%rax, 0x468(%rbp)
1401285da:     	movq	$0x7, 0x470(%rbp)
1401285e5:     	movaps	0x5c808f4(%rip), %xmm0  # 0x145da8ee0
1401285ec:     	movups	%xmm0, 0x478(%rbp)
1401285f3:     	leaq	0x5c8238d(%rip), %rax   # 0x145daa987
1401285fa:     	movq	%rax, 0x488(%rbp)
140128601:     	movq	$0x8, 0x490(%rbp)
14012860c:     	movaps	0x5c808dd(%rip), %xmm0  # 0x145da8ef0
140128613:     	movups	%xmm0, 0x498(%rbp)
14012861a:     	leaq	0x5c8236e(%rip), %rax   # 0x145daa98f
140128621:     	movq	%rax, 0x4a8(%rbp)
140128628:     	movq	$0xa, 0x4b0(%rbp)
140128633:     	movaps	0x5c808c6(%rip), %xmm0  # 0x145da8f00
14012863a:     	movups	%xmm0, 0x4b8(%rbp)
140128641:     	leaq	0x5c82351(%rip), %rax   # 0x145daa999
140128648:     	movq	%rax, 0x4c8(%rbp)
14012864f:     	movq	$0xb, 0x4d0(%rbp)
14012865a:     	movdqa	0x5c808ae(%rip), %xmm0  # 0x145da8f10
140128662:     	movdqu	%xmm0, 0x4d8(%rbp)
14012866a:     	leaq	0x2d8(%rbp), %r15
140128671:     	movq	%rcx, 0x548(%rbp)
140128678:     	leaq	0x8(%rcx), %rax
14012867c:     	movq	%rax, 0x550(%rbp)
140128683:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
14012868d:     	andq	%r9, %rax
140128690:     	movq	%rax, 0x580(%rbp)
140128697:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1401286a1:     	andq	%r9, %rax
1401286a4:     	movq	%rax, 0x560(%rbp)
1401286ab:     	xorl	%r14d, %r14d
1401286ae:     	movss	0x5c8086a(%rip), %xmm6  # 0x145da8f20
1401286b6:     	movss	0x5c80865(%rip), %xmm10 # 0x145da8f24
1401286bf:     	movss	0x5c727d4(%rip), %xmm9  # 0x145d9ae9c
1401286c8:     	pxor	%xmm4, %xmm4
1401286cc:     	movaps	0x5c44b8c(%rip), %xmm8  # 0x145d6d260
1401286d4:     	leaq	0x568(%rbp), %r13
1401286db:     	movdqa	0x5c44afc(%rip), %xmm12 # 0x145d6d1e0
1401286e4:     	movdqa	0x5c44b03(%rip), %xmm13 # 0x145d6d1f0
1401286ed:     	movdqa	0x5c44b0a(%rip), %xmm14 # 0x145d6d200
1401286f6:     	movdqa	0x5c44a61(%rip), %xmm15 # 0x145d6d160
1401286ff:     	movdqa	0x5c44a68(%rip), %xmm11 # 0x145d6d170
140128708:     	movdqa	0x5c44a70(%rip), %xmm7  # 0x145d6d180
140128710:     	leaq	0x500(%rbp), %r12
140128717:     	cmpq	$0x4, %r14
14012871b:     	je	0x140128c2f <.text+0x127c2f>
140128721:     	movq	%r14, %rcx
140128724:     	shlq	$0x5, %rcx
140128728:     	movq	(%rdx,%rcx), %rax
14012872c:     	testq	%rax, %rax
14012872f:     	je	0x140128c2f <.text+0x127c2f>
140128735:     	addq	%rdx, %rcx
140128738:     	movq	0x8(%rcx), %rdx
14012873c:     	movss	0x10(%rcx), %xmm0
140128741:     	mulss	%xmm6, %xmm0
140128745:     	movss	0x14(%rcx), %xmm1
14012874a:     	mulss	%xmm6, %xmm1
14012874e:     	movss	0x18(%rcx), %xmm2
140128753:     	mulss	%xmm6, %xmm2
140128757:     	movss	0x1c(%rcx), %xmm3
14012875c:     	mulss	%xmm6, %xmm3
140128760:     	movq	%rax, 0x530(%rbp)
140128767:     	movq	%rdx, 0x538(%rbp)
14012876e:     	addss	%xmm10, %xmm0
140128773:     	addss	%xmm9, %xmm2
140128778:     	addss	%xmm9, %xmm3
14012877d:     	movw	$0x0, 0x3a4(%rbp)
140128786:     	movb	$0x1, 0x394(%rbp)
14012878d:     	movl	$0x1, 0x2a8(%rbp)
140128797:     	movss	%xmm0, 0x2ac(%rbp)
14012879f:     	movq	$0x0, 0x2b0(%rbp)
1401287aa:     	movl	$0x1, 0x2b8(%rbp)
1401287b4:     	movss	%xmm1, 0x2bc(%rbp)
1401287bc:     	movq	$0x0, 0x2c0(%rbp)
1401287c7:     	movl	$0x1, 0x2c8(%rbp)
1401287d1:     	movss	%xmm2, 0x2cc(%rbp)
1401287d9:     	movl	$0x1, 0x2d0(%rbp)
1401287e3:     	movss	%xmm3, 0x2d4(%rbp)
1401287eb:     	movq	$0x0, 0x2a0(%rbp)
1401287f6:     	movdqu	%xmm4, 0x10(%r15)
1401287fc:     	movdqu	%xmm4, (%r15)
140128801:     	movw	$0x0, 0xe4(%r15)
14012880b:     	movl	$0x0, 0xe0(%r15)
140128816:     	movups	0x5c8166b(%rip), %xmm0  # 0x145da9e88
14012881d:     	movups	%xmm0, 0x30(%r15)
140128822:     	movups	0x5c8164f(%rip), %xmm0  # 0x145da9e78
140128829:     	movups	%xmm0, 0x20(%r15)
14012882e:     	movups	0x5c81673(%rip), %xmm0  # 0x145da9ea8
140128835:     	movups	%xmm0, 0x50(%r15)
14012883a:     	movups	0x5c81657(%rip), %xmm0  # 0x145da9e98
140128841:     	movups	%xmm0, 0x40(%r15)
140128846:     	movups	0x5c8167b(%rip), %xmm0  # 0x145da9ec8
14012884d:     	movups	%xmm0, 0x70(%r15)
140128852:     	movups	0x5c8165f(%rip), %xmm0  # 0x145da9eb8
140128859:     	movups	%xmm0, 0x60(%r15)
14012885e:     	movups	0x5c81683(%rip), %xmm0  # 0x145da9ee8
140128865:     	movups	%xmm0, 0x90(%r15)
14012886d:     	movups	0x5c81664(%rip), %xmm0  # 0x145da9ed8
140128874:     	movups	%xmm0, 0x80(%r15)
14012887c:     	movw	$0x0, 0x3b6(%rbp)
140128885:     	movl	$0x100, 0x3b2(%rbp)     # imm = 0x100
14012888f:     	movq	$0x0, 0x398(%rbp)
14012889a:     	movl	$0x3f800000, 0x3a0(%rbp) # imm = 0x3F800000
1401288a4:     	movups	%xmm8, 0x378(%rbp)
1401288ac:     	movl	$0x1, 0x388(%rbp)
1401288b6:     	movq	$0x0, 0x38c(%rbp)
1401288c1:     	movups	0x5c814f8(%rip), %xmm0  # 0x145da9dc0
1401288c8:     	movaps	%xmm0, 0x240(%rbp)
1401288cf:     	movq	$0x0, 0x250(%rbp)
1401288da:     	movups	0x5c814f7(%rip), %xmm0  # 0x145da9dd8
1401288e1:     	movups	%xmm0, -0x80(%r15)
1401288e6:     	movq	$0x0, -0x70(%r15)
1401288ee:     	movups	0x5c814fb(%rip), %xmm0  # 0x145da9df0
1401288f5:     	movups	%xmm0, -0x68(%r15)
1401288fa:     	movq	$0x0, -0x58(%r15)
140128902:     	movdqu	0x5c814fe(%rip), %xmm0  # 0x145da9e08
14012890a:     	movdqu	%xmm0, -0x50(%r15)
140128910:     	movq	$0x0, -0x40(%r15)
140128918:     	movl	$0x10000, 0xce(%r15)    # imm = 0x10000
140128923:     	movw	$0x0, 0xd2(%r15)
14012892d:     	movw	$0x0, 0xd8(%r15)
140128937:     	movl	$0x10000, 0xd4(%r15)    # imm = 0x10000
140128942:     	testq	%rdi, %rdi
140128945:     	js	0x140128c91 <.text+0x127c91>
14012894b:     	je	0x1401289a2 <.text+0x1279a2>
14012894d:     	movq	%r12, %rbx
140128950:     	movq	%r14, %r12
140128953:     	movq	%r13, %r14
140128956:     	callq	0x140002200 <.text+0x1200>
14012895b:     	movl	$0x1, %r13d
140128961:     	movl	$0x1, %edx
140128966:     	movq	%rdi, %rcx
140128969:     	callq	0x1400021c0 <.text+0x11c0>
14012896e:     	testq	%rax, %rax
140128971:     	je	0x140128ca2 <.text+0x127ca2>
140128977:     	movq	%rax, %rsi
14012897a:     	movq	%rax, %rcx
14012897d:     	movq	0x558(%rbp), %rdx
140128984:     	movq	%rdi, %r8
140128987:     	callq	0x145bc977b <.text+0x5bc877b>
14012898c:     	cmpq	$0x8, %rdi
140128990:     	jae	0x1401289ac <.text+0x1279ac>
140128992:     	xorl	%eax, %eax
140128994:     	movq	%r14, %r13
140128997:     	movq	%r12, %r14
14012899a:     	movq	%rbx, %r12
14012899d:     	jmp	0x140128a90 <.text+0x127a90>
1401289a2:     	movl	$0x1, %esi
1401289a7:     	jmp	0x140128aad <.text+0x127aad>
1401289ac:     	cmpq	$0x20, %rdi
1401289b0:     	movq	%r14, %r13
1401289b3:     	jae	0x1401289c2 <.text+0x1279c2>
1401289b5:     	xorl	%ecx, %ecx
1401289b7:     	movq	%r12, %r14
1401289ba:     	movq	%rbx, %r12
1401289bd:     	jmp	0x140128a43 <.text+0x127a43>
1401289c2:     	xorl	%eax, %eax
1401289c4:     	movq	%r12, %r14
1401289c7:     	movq	0x580(%rbp), %rcx
1401289ce:     	nop
1401289d0:     	movdqu	(%rsi,%rax), %xmm0
1401289d5:     	movdqu	0x10(%rsi,%rax), %xmm1
1401289db:     	movdqa	%xmm0, %xmm2
1401289df:     	paddb	%xmm15, %xmm2
1401289e4:     	movdqa	%xmm1, %xmm3
1401289e8:     	paddb	%xmm15, %xmm3
1401289ed:     	movdqa	%xmm2, %xmm4
1401289f1:     	pminub	%xmm11, %xmm4
1401289f6:     	pcmpeqb	%xmm2, %xmm4
1401289fa:     	pand	%xmm7, %xmm4
1401289fe:     	movdqa	%xmm3, %xmm2
140128a02:     	pminub	%xmm11, %xmm2
140128a07:     	pcmpeqb	%xmm3, %xmm2
140128a0b:     	pand	%xmm7, %xmm2
140128a0f:     	por	%xmm0, %xmm4
140128a13:     	por	%xmm1, %xmm2
140128a17:     	movdqu	%xmm4, (%rsi,%rax)
140128a1c:     	movdqu	%xmm2, 0x10(%rsi,%rax)
140128a22:     	addq	$0x20, %rax
140128a26:     	cmpq	%rax, %rcx
140128a29:     	jne	0x1401289d0 <.text+0x1279d0>
140128a2b:     	cmpq	%rcx, %rdi
140128a2e:     	movq	%rbx, %r12
140128a31:     	je	0x140128aad <.text+0x127aad>
140128a33:     	movq	0x580(%rbp), %rax
140128a3a:     	movq	%rax, %rcx
140128a3d:     	testb	$0x18, %dil
140128a41:     	je	0x140128a90 <.text+0x127a90>
140128a43:     	movq	0x560(%rbp), %rdx
140128a4a:     	nopw	(%rax,%rax)
140128a50:     	movq	(%rsi,%rcx), %xmm0
140128a55:     	movdqa	%xmm0, %xmm1
140128a59:     	paddb	%xmm12, %xmm1
140128a5e:     	movdqa	%xmm1, %xmm2
140128a62:     	pmaxub	%xmm13, %xmm2
140128a67:     	pcmpeqb	%xmm1, %xmm2
140128a6b:     	pandn	%xmm14, %xmm2
140128a70:     	por	%xmm0, %xmm2
140128a74:     	movq	%xmm2, (%rsi,%rcx)
140128a79:     	addq	$0x8, %rcx
140128a7d:     	cmpq	%rcx, %rdx
140128a80:     	jne	0x140128a50 <.text+0x127a50>
140128a82:     	movq	%rdx, %rax
140128a85:     	cmpq	%rdx, %rdi
140128a88:     	je	0x140128aad <.text+0x127aad>
140128a8a:     	nopw	(%rax,%rax)
140128a90:     	movzbl	(%rsi,%rax), %ecx
140128a94:     	leal	-0x41(%rcx), %edx
140128a97:     	cmpb	$0x1a, %dl
140128a9a:     	setb	%dl
140128a9d:     	shlb	$0x5, %dl
140128aa0:     	orb	%cl, %dl
140128aa2:     	movb	%dl, (%rsi,%rax)
140128aa5:     	incq	%rax
140128aa8:     	cmpq	%rax, %rdi
140128aab:     	jne	0x140128a90 <.text+0x127a90>
140128aad:     	movq	%rdi, 0x568(%rbp)
140128ab4:     	movq	%rsi, 0x570(%rbp)
140128abb:     	movq	%rdi, 0x578(%rbp)
140128ac2:     	movq	%r13, 0x500(%rbp)
140128ac9:     	leaq	-0x1269f0(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
140128ad0:     	movq	%rax, 0x508(%rbp)
140128ad7:     	leaq	0x530(%rbp), %rax
140128ade:     	movq	%rax, 0x510(%rbp)
140128ae5:     	leaq	-0x126a2c(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
140128aec:     	movq	%rax, 0x518(%rbp)
140128af3:     	leaq	0x4e8(%rbp), %rcx
140128afa:     	leaq	0x5c81ea3(%rip), %rdx   # 0x145daa9a4
140128b01:     	movq	%r12, %r8
140128b04:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
140128b09:     	nop
140128b0a:     	movq	0x568(%rbp), %rdx
140128b11:     	testq	%rdx, %rdx
140128b14:     	je	0x140128b28 <.text+0x127b28>
140128b16:     	movq	0x570(%rbp), %rcx
140128b1d:     	movl	$0x1, %r8d
140128b23:     	callq	0x1400021d0 <.text+0x11d0>
140128b28:     	movq	0x4f8(%rbp), %rax
140128b2f:     	movq	%rax, 0x510(%rbp)
140128b36:     	movups	0x4e8(%rbp), %xmm0
140128b3d:     	movaps	%xmm0, 0x500(%rbp)
140128b44:     	leaq	0x5c842fd(%rip), %rax   # 0x145dace48
140128b4b:     	movq	%rax, 0x20(%rsp)
140128b50:     	movl	$0x1, %r9d
140128b56:     	movq	%r13, %rcx
140128b59:     	movq	0x540(%rbp), %rdx
140128b60:     	movq	%r12, %rbx
140128b63:     	movq	%r12, %r8
140128b66:     	callq	0x1401471a0 <.text+0x1461a0>
140128b6b:     	nop
140128b6c:     	leaq	0x1b8(%rbp), %r12
140128b73:     	movq	%r12, %rcx
140128b76:     	movq	%r13, %rdx
140128b79:     	callq	0x1426d6630 <.text+0x26d5630>
140128b7e:     	nop
140128b7f:     	incq	%r14
140128b82:     	movl	$0x0, 0x1f0(%rbp)
140128b8c:     	movdqa	0x5c8039c(%rip), %xmm0  # 0x145da8f30
140128b94:     	movdqu	%xmm0, 0x1f4(%rbp)
140128b9c:     	movl	$0x180, %r8d            # imm = 0x180
140128ba2:     	leaq	-0x50(%rbp), %rcx
140128ba6:     	leaq	0x240(%rbp), %rdx
140128bad:     	callq	0x145bc977b <.text+0x5bc877b>
140128bb2:     	movl	$0x88, %r8d
140128bb8:     	leaq	0x130(%rbp), %rcx
140128bbf:     	movq	%r12, %rdx
140128bc2:     	callq	0x145bc977b <.text+0x5bc877b>
140128bc7:     	movq	0x548(%rbp), %rax
140128bce:     	movq	%r14, %r12
140128bd1:     	movq	%r13, %r14
140128bd4:     	movq	(%rax), %r13
140128bd7:     	movl	$0x208, %r8d            # imm = 0x208
140128bdd:     	leaq	0x248(%rbp), %rcx
140128be4:     	leaq	-0x50(%rbp), %rdx
140128be8:     	callq	0x145bc977b <.text+0x5bc877b>
140128bed:     	movq	%r13, 0x240(%rbp)
140128bf4:     	movq	%r14, %r13
140128bf7:     	movq	%r12, %r14
140128bfa:     	movq	%rbx, %r12
140128bfd:     	movq	%rbx, %rcx
140128c00:     	movq	0x550(%rbp), %rdx
140128c07:     	leaq	0x240(%rbp), %r8
140128c0e:     	leaq	0x5c4539b(%rip), %r9    # 0x145d6dfb0
140128c15:     	callq	0x14018db20 <.text+0x18cb20>
140128c1a:     	leaq	0x468(%rbp), %rdx
140128c21:     	pxor	%xmm4, %xmm4
140128c25:     	cmpq	$0x4, %r14
140128c29:     	jne	0x140128721 <.text+0x127721>
140128c2f:     	movaps	0x590(%rbp), %xmm6
140128c36:     	movaps	0x5a0(%rbp), %xmm7
140128c3d:     	movaps	0x5b0(%rbp), %xmm8
140128c45:     	movaps	0x5c0(%rbp), %xmm9
140128c4d:     	movaps	0x5d0(%rbp), %xmm10
140128c55:     	movaps	0x5e0(%rbp), %xmm11
140128c5d:     	movaps	0x5f0(%rbp), %xmm12
140128c65:     	movaps	0x600(%rbp), %xmm13
140128c6d:     	movaps	0x610(%rbp), %xmm14
140128c75:     	movaps	0x620(%rbp), %xmm15
140128c7d:     	addq	$0x6b8, %rsp            # imm = 0x6B8
140128c84:     	popq	%rbx
140128c85:     	popq	%rdi
140128c86:     	popq	%rsi
140128c87:     	popq	%r12
140128c89:     	popq	%r13
140128c8b:     	popq	%r14
140128c8d:     	popq	%r15
140128c8f:     	popq	%rbp
140128c90:     	retq
140128c91:     	xorl	%r13d, %r13d
140128c94:     	movq	%r13, %rcx
140128c97:     	movq	%rsi, %rdx
140128c9a:     	callq	0x145d6944b <.text+0x5d6844b>
140128c9f:     	nop
140128ca0:     	ud2
140128ca2:     	movq	%rdi, %rsi
140128ca5:     	jmp	0x140128c94 <.text+0x127c94>
