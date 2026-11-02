
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b6620:     	pushq	%rbp
1454b6621:     	pushq	%r15
1454b6623:     	pushq	%r14
1454b6625:     	pushq	%r13
1454b6627:     	pushq	%r12
1454b6629:     	pushq	%rsi
1454b662a:     	pushq	%rdi
1454b662b:     	pushq	%rbx
1454b662c:     	subq	$0xa8, %rsp
1454b6633:     	leaq	0x80(%rsp), %rbp
1454b663b:     	movq	$-0x2, 0x20(%rbp)
1454b6643:     	movq	%r9, %r14
1454b6646:     	movq	%r8, %rbx
1454b6649:     	movq	%rdx, %rdi
1454b664c:     	movq	%rcx, %rsi
1454b664f:     	callq	0x140002200 <.text+0x1200>
1454b6654:     	movl	$0x1, %ecx
1454b6659:     	movl	$0x1, %edx
1454b665e:     	callq	0x1400021c0 <.text+0x11c0>
1454b6663:     	testq	%rax, %rax
1454b6666:     	je	0x1454b6af4 <.text+0x54b5af4>
1454b666c:     	movb	$0x7b, (%rax)
1454b666f:     	movq	$0x1, -0x10(%rbp)
1454b6677:     	movq	%rax, -0x8(%rbp)
1454b667b:     	movq	$0x1, (%rbp)
1454b6683:     	movb	$0x1, 0x8(%rbp)
1454b6687:     	movq	%r14, 0x28(%rsp)
1454b668c:     	movq	%rbx, 0x20(%rsp)
1454b6691:     	leaq	0x14f49b9(%rip), %r8    # 0x1469ab051
1454b6698:     	leaq	-0x30(%rbp), %rbx
1454b669c:     	leaq	-0x10(%rbp), %rdx
1454b66a0:     	movl	$0x4, %r9d
1454b66a6:     	movq	%rbx, %rcx
1454b66a9:     	callq	0x145451620 <.text+0x5450620>
1454b66ae:     	movss	0x8e4(%rdi), %xmm0
1454b66b6:     	movss	%xmm0, 0x20(%rsp)
1454b66bc:     	leaq	0x14f499a(%rip), %r8    # 0x1469ab05d
1454b66c3:     	leaq	-0x10(%rbp), %r14
1454b66c7:     	movl	$0x4, %r9d
1454b66cd:     	movq	%r14, %rcx
1454b66d0:     	movq	%rbx, %rdx
1454b66d3:     	callq	0x14544e640 <.text+0x544d640>
1454b66d8:     	movl	0x3f8(%rdi), %eax
1454b66de:     	movl	%eax, 0x20(%rsp)
1454b66e2:     	leaq	0x14f4978(%rip), %r8    # 0x1469ab061
1454b66e9:     	movl	$0x5, %r9d
1454b66ef:     	movq	%rbx, %rcx
1454b66f2:     	movq	%r14, %rdx
1454b66f5:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b66fa:     	movl	0x65c(%rdi), %eax
1454b6700:     	movl	%eax, 0x20(%rsp)
1454b6704:     	leaq	0x14f497d(%rip), %r8    # 0x1469ab088
1454b670b:     	movl	$0x5, %r9d
1454b6711:     	movq	%r14, %rcx
1454b6714:     	movq	%rbx, %rdx
1454b6717:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b671c:     	movl	0x660(%rdi), %eax
1454b6722:     	movl	%eax, 0x20(%rsp)
1454b6726:     	leaq	0x14f4b5e(%rip), %r8    # 0x1469ab28b
1454b672d:     	movl	$0x6, %r9d
1454b6733:     	movq	%rbx, %rcx
1454b6736:     	movq	%r14, %rdx
1454b6739:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b673e:     	movl	0x664(%rdi), %eax
1454b6744:     	movl	%eax, 0x20(%rsp)
1454b6748:     	leaq	0x14f4b42(%rip), %r8    # 0x1469ab291
1454b674f:     	movl	$0x9, %r9d
1454b6755:     	movq	%r14, %rcx
1454b6758:     	movq	%rbx, %rdx
1454b675b:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b6760:     	movl	0x668(%rdi), %eax
1454b6766:     	movl	%eax, 0x20(%rsp)
1454b676a:     	leaq	0x14f4992(%rip), %r8    # 0x1469ab103
1454b6771:     	movl	$0x6, %r9d
1454b6777:     	movq	%rbx, %rcx
1454b677a:     	movq	%r14, %rdx
1454b677d:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b6782:     	movsd	0x610(%rdi), %xmm0
1454b678a:     	movsd	%xmm0, 0x20(%rsp)
1454b6790:     	leaq	0x14f490e(%rip), %r8    # 0x1469ab0a5
1454b6797:     	movl	$0x6, %r9d
1454b679d:     	movq	%r14, %rcx
1454b67a0:     	movq	%rbx, %rdx
1454b67a3:     	callq	0x14544e4c0 <.text+0x544d4c0>
1454b67a8:     	movsd	0x618(%rdi), %xmm0
1454b67b0:     	movsd	%xmm0, 0x20(%rsp)
1454b67b6:     	leaq	0x14f4add(%rip), %r8    # 0x1469ab29a
1454b67bd:     	movl	$0x5, %r9d
1454b67c3:     	movq	%rbx, %rcx
1454b67c6:     	movq	%r14, %rdx
1454b67c9:     	callq	0x14544e4c0 <.text+0x544d4c0>
1454b67ce:     	movl	0x66c(%rdi), %eax
1454b67d4:     	movl	%eax, 0x20(%rsp)
1454b67d8:     	leaq	0x14f489c(%rip), %r8    # 0x1469ab07b
1454b67df:     	movl	$0x4, %r9d
1454b67e5:     	movq	%r14, %rcx
1454b67e8:     	movq	%rbx, %rdx
1454b67eb:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b67f0:     	movl	0x670(%rdi), %eax
1454b67f6:     	movl	%eax, 0x20(%rsp)
1454b67fa:     	leaq	0x14f4a9e(%rip), %r8    # 0x1469ab29f
1454b6801:     	leaq	-0x30(%rbp), %rcx
1454b6805:     	movl	$0x6, %r9d
1454b680b:     	movq	%r14, %rdx
1454b680e:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454b6813:     	movzbl	0x284(%rdi), %eax
1454b681a:     	addb	$-0x2, %al
1454b681c:     	cmpb	$0x9, %al
1454b681e:     	ja	0x1454b6830 <.text+0x54b5830>
1454b6820:     	movzbl	%al, %eax
1454b6823:     	leaq	0x14f61fe(%rip), %rcx   # 0x1469aca28
1454b682a:     	movq	(%rcx,%rax,8), %rbx
1454b682e:     	jmp	0x1454b6837 <.text+0x54b5837>
1454b6830:     	leaq	0x1261f31(%rip), %rbx   # 0x146718768
1454b6837:     	leaq	0x10(%rbx), %rax
1454b683b:     	movq	%rax, -0x48(%rbp)
1454b683f:     	leaq	-0x54b4786(%rip), %r15  # 0x1400020c0 <.text+0x10c0>
1454b6846:     	movq	%r15, -0x40(%rbp)
1454b684a:     	movb	$0x1, 0x1f(%rbp)
1454b684e:     	leaq	0x12580d3(%rip), %rdx   # 0x14670e928
1454b6855:     	leaq	-0x10(%rbp), %rcx
1454b6859:     	leaq	-0x48(%rbp), %r8
1454b685d:     	callq	0x14570bf80 <.text+0x570af80>
1454b6862:     	nop
1454b6863:     	movq	-0x8(%rbp), %rcx
1454b6867:     	movq	(%rbp), %rdx
1454b686b:     	movq	0x20(%rbx), %r12
1454b686f:     	movq	0x28(%rbx), %r13
1454b6873:     	movq	%rcx, -0x38(%rbp)
1454b6877:     	callq	0x145452400 <.text+0x5451400>
1454b687c:     	nop
1454b687d:     	movq	%rax, %r14
1454b6880:     	movq	%rdx, %rbx
1454b6883:     	movq	-0x10(%rbp), %rdx
1454b6887:     	testq	%rdx, %rdx
1454b688a:     	je	0x1454b689b <.text+0x54b589b>
1454b688c:     	movl	$0x1, %r8d
1454b6892:     	movq	-0x38(%rbp), %rcx
1454b6896:     	callq	0x1400021d0 <.text+0x11d0>
1454b689b:     	testq	%r14, %r14
1454b689e:     	cmovneq	%r14, %r12
1454b68a2:     	cmoveq	%r13, %rbx
1454b68a6:     	movb	$0x0, 0x1f(%rbp)
1454b68aa:     	movq	%rbx, 0x28(%rsp)
1454b68af:     	movq	%r12, 0x20(%rsp)
1454b68b4:     	leaq	0x14f49ea(%rip), %r8    # 0x1469ab2a5
1454b68bb:     	leaq	-0x10(%rbp), %rcx
1454b68bf:     	leaq	-0x30(%rbp), %rdx
1454b68c3:     	movl	$0x5, %r9d
1454b68c9:     	callq	0x145451620 <.text+0x5450620>
1454b68ce:     	nop
1454b68cf:     	movups	0x120(%rdi), %xmm0
1454b68d6:     	movups	%xmm0, 0x20(%rsp)
1454b68db:     	leaq	0x14f49c8(%rip), %r8    # 0x1469ab2aa
1454b68e2:     	leaq	-0x30(%rbp), %rcx
1454b68e6:     	leaq	-0x10(%rbp), %rdx
1454b68ea:     	movl	$0x4, %r9d
1454b68f0:     	callq	0x145451620 <.text+0x5450620>
1454b68f5:     	movzbl	0x285(%rdi), %eax
1454b68fc:     	addb	$-0x2, %al
1454b68fe:     	cmpb	$0x6, %al
1454b6900:     	ja	0x1454b6912 <.text+0x54b5912>
1454b6902:     	movzbl	%al, %eax
1454b6905:     	leaq	0x14f60e4(%rip), %rcx   # 0x1469ac9f0
1454b690c:     	movq	(%rcx,%rax,8), %rcx
1454b6910:     	jmp	0x1454b6919 <.text+0x54b5919>
1454b6912:     	leaq	0x1260cdf(%rip), %rcx   # 0x1467175f8
1454b6919:     	movb	$0x1, 0x1d(%rbp)
1454b691d:     	callq	0x14540dd20 <.text+0x540cd20>
1454b6922:     	nop
1454b6923:     	movb	$0x0, 0x1d(%rbp)
1454b6927:     	movq	%rdx, 0x28(%rsp)
1454b692c:     	movq	%rax, 0x20(%rsp)
1454b6931:     	leaq	0x14f4976(%rip), %r8    # 0x1469ab2ae
1454b6938:     	leaq	-0x10(%rbp), %rcx
1454b693c:     	leaq	-0x30(%rbp), %rdx
1454b6940:     	movl	$0x4, %r9d
1454b6946:     	callq	0x145451620 <.text+0x5450620>
1454b694b:     	nop
1454b694c:     	movq	0x210(%rdi), %rcx
1454b6953:     	movq	0x218(%rdi), %rdx
1454b695a:     	callq	0x14540e820 <.text+0x540d820>
1454b695f:     	imulq	$0xf0, %rax, %r14
1454b6966:     	leaq	0x125facb(%rip), %rbx   # 0x146716438
1454b696d:     	leaq	(%r14,%rbx), %rax
1454b6971:     	addq	$0x8, %rax
1454b6975:     	movq	%rax, -0x48(%rbp)
1454b6979:     	movq	%r15, -0x40(%rbp)
1454b697d:     	movb	$0x1, 0x1e(%rbp)
1454b6981:     	leaq	0x1258015(%rip), %rdx   # 0x14670e99d
1454b6988:     	leaq	-0x30(%rbp), %rcx
1454b698c:     	leaq	-0x48(%rbp), %r8
1454b6990:     	callq	0x14570bf80 <.text+0x570af80>
1454b6995:     	nop
1454b6996:     	addq	%r14, %rbx
1454b6999:     	movq	-0x28(%rbp), %rcx
1454b699d:     	movq	-0x20(%rbp), %rdx
1454b69a1:     	movq	0x18(%rbx), %r15
1454b69a5:     	movq	0x20(%rbx), %r12
1454b69a9:     	movq	%rcx, -0x38(%rbp)
1454b69ad:     	callq	0x145452400 <.text+0x5451400>
1454b69b2:     	nop
1454b69b3:     	movq	%rax, %r14
1454b69b6:     	movq	%rdx, %rbx
1454b69b9:     	movq	-0x30(%rbp), %rdx
1454b69bd:     	testq	%rdx, %rdx
1454b69c0:     	je	0x1454b69d1 <.text+0x54b59d1>
1454b69c2:     	movl	$0x1, %r8d
1454b69c8:     	movq	-0x38(%rbp), %rcx
1454b69cc:     	callq	0x1400021d0 <.text+0x11d0>
1454b69d1:     	testq	%r14, %r14
1454b69d4:     	cmovneq	%r14, %r15
1454b69d8:     	cmoveq	%r12, %rbx
1454b69dc:     	movb	$0x0, 0x1e(%rbp)
1454b69e0:     	movq	%rbx, 0x28(%rsp)
1454b69e5:     	movq	%r15, 0x20(%rsp)
1454b69ea:     	leaq	0x14f48c1(%rip), %r8    # 0x1469ab2b2
1454b69f1:     	leaq	-0x30(%rbp), %rcx
1454b69f5:     	leaq	-0x10(%rbp), %rdx
1454b69f9:     	movl	$0x2, %r9d
1454b69ff:     	callq	0x145451620 <.text+0x5450620>
1454b6a04:     	nop
1454b6a05:     	movb	0x951(%rdi), %bl
1454b6a0b:     	leaq	0x14f463b(%rip), %rdx   # 0x1469ab04d
1454b6a12:     	leaq	-0x30(%rbp), %rcx
1454b6a16:     	movl	$0x4, %r8d
1454b6a1c:     	callq	0x145451370 <.text+0x5450370>
1454b6a21:     	nop
1454b6a22:     	movzbl	%bl, %edi
1454b6a25:     	xorq	$0x5, %rdi
1454b6a29:     	movq	-0x30(%rbp), %rax
1454b6a2d:     	movq	-0x20(%rbp), %rcx
1454b6a31:     	subq	%rcx, %rax
1454b6a34:     	cmpq	%rax, %rdi
1454b6a37:     	ja	0x1454b6aa8 <.text+0x54b5aa8>
1454b6a39:     	leaq	0x126c7ae(%rip), %rax   # 0x1467231ee
1454b6a40:     	leaq	0x126c7a2(%rip), %rdx   # 0x1467231e9
1454b6a47:     	testb	%bl, %bl
1454b6a49:     	cmovneq	%rax, %rdx
1454b6a4d:     	addq	-0x28(%rbp), %rcx
1454b6a51:     	movq	%rdi, %r8
1454b6a54:     	callq	0x145756ddd <.text+0x5755ddd>
1454b6a59:     	addq	%rdi, -0x20(%rbp)
1454b6a5d:     	movups	-0x30(%rbp), %xmm0
1454b6a61:     	movaps	%xmm0, -0x10(%rbp)
1454b6a65:     	movups	-0x20(%rbp), %xmm0
1454b6a69:     	movaps	%xmm0, (%rbp)
