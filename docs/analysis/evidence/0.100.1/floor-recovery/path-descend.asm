
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552a810:     	pushq	%r15
14552a812:     	pushq	%r14
14552a814:     	pushq	%r13
14552a816:     	pushq	%r12
14552a818:     	pushq	%rsi
14552a819:     	pushq	%rdi
14552a81a:     	pushq	%rbp
14552a81b:     	pushq	%rbx
14552a81c:     	subq	$0xb8, %rsp
14552a823:     	movq	%rcx, 0x20(%rsp)
14552a828:     	testq	%r8, %r8
14552a82b:     	je	0x14552a9b8 <.text+0x55299b8>
14552a831:     	movq	%rdx, %r10
14552a834:     	movq	%r9, %rax
14552a837:     	orq	%r8, %rax
14552a83a:     	shrq	$0x20, %rax
14552a83e:     	je	0x14552a84a <.text+0x552984a>
14552a840:     	movq	%r9, %rax
14552a843:     	xorl	%edx, %edx
14552a845:     	divq	%r8
14552a848:     	jmp	0x14552a852 <.text+0x5529852>
14552a84a:     	movl	%r9d, %eax
14552a84d:     	xorl	%edx, %edx
14552a84f:     	divl	%r8d
14552a852:     	movups	0x180a5ef(%rip), %xmm0  # 0x146d34e48
14552a859:     	movups	%xmm0, 0xa8(%rsp)
14552a861:     	movups	0x180a5d0(%rip), %xmm0  # 0x146d34e38
14552a868:     	movups	%xmm0, 0x98(%rsp)
14552a870:     	movups	0x180a5b1(%rip), %xmm0  # 0x146d34e28
14552a877:     	movups	%xmm0, 0x88(%rsp)
14552a87f:     	movups	0x180a592(%rip), %xmm0  # 0x146d34e18
14552a886:     	movups	%xmm0, 0x78(%rsp)
14552a88b:     	movups	0x180a576(%rip), %xmm0  # 0x146d34e08
14552a892:     	movups	%xmm0, 0x68(%rsp)
14552a897:     	movups	0x180a55a(%rip), %xmm0  # 0x146d34df8
14552a89e:     	movups	%xmm0, 0x58(%rsp)
14552a8a3:     	movups	0x180a53e(%rip), %xmm0  # 0x146d34de8
14552a8aa:     	movups	%xmm0, 0x48(%rsp)
14552a8af:     	movups	0x180a522(%rip), %xmm0  # 0x146d34dd8
14552a8b6:     	movups	%xmm0, 0x38(%rsp)
14552a8bb:     	leaq	0x40(%rsp), %r14
14552a8c0:     	xorl	%edi, %edi
14552a8c2:     	xorl	%r15d, %r15d
14552a8c5:     	movq	%r15, %r12
14552a8c8:     	shlq	$0x4, %r12
14552a8cc:     	addq	%r14, %r12
14552a8cf:     	jmp	0x14552a8f1 <.text+0x55298f1>
14552a8d1:     	nopw	%cs:(%rax,%rax)
14552a8e0:     	incq	%r15
14552a8e3:     	addq	$0x10, %r12
14552a8e7:     	cmpq	$0x8, %r15
14552a8eb:     	je	0x14552a996 <.text+0x5529996>
14552a8f1:     	movq	(%r12), %rcx
14552a8f5:     	addq	%rax, %rcx
14552a8f8:     	cmpq	%r8, %rcx
14552a8fb:     	jge	0x14552a8e0 <.text+0x55298e0>
14552a8fd:     	movq	-0x8(%r12), %r13
14552a902:     	addq	%rdx, %r13
14552a905:     	cmpq	%r8, %r13
14552a908:     	jge	0x14552a8e0 <.text+0x55298e0>
14552a90a:     	movq	%rcx, %rsi
14552a90d:     	orq	%r13, %rsi
14552a910:     	js	0x14552a8e0 <.text+0x55298e0>
14552a912:     	imulq	%r8, %rcx
14552a916:     	addq	%r13, %rcx
14552a919:     	movq	%r10, %rbx
14552a91c:     	cmpq	%r10, %rcx
14552a91f:     	jae	0x14552a9c6 <.text+0x55299c6>
14552a925:     	movq	0x20(%rsp), %r10
14552a92a:     	movzwl	(%r10,%rcx,2), %r12d
14552a92f:     	cmpw	%bp, %r12w
14552a933:     	setae	%sil
14552a937:     	andb	%dil, %sil
14552a93a:     	cmpw	$-0x1, %r12w
14552a93f:     	sete	%r13b
14552a943:     	movl	$0x1, %r10d
14552a949:     	cmovneq	%r10, %rdi
14552a94d:     	orb	%sil, %r13b
14552a950:     	cmovnel	%ebp, %r12d
14552a954:     	cmoveq	%rcx, %r11
14552a958:     	movl	%r12d, %ebp
14552a95b:     	cmpq	$0x7, %r15
14552a95f:     	leaq	0x1(%r15), %r15
14552a963:     	movq	%rbx, %r10
14552a966:     	jne	0x14552a8c5 <.text+0x55298c5>
14552a96c:     	cmpq	$0x1, %rdi
14552a970:     	jne	0x14552a99f <.text+0x552999f>
14552a972:     	cmpq	%r10, %r9
14552a975:     	jae	0x14552a9d7 <.text+0x55299d7>
14552a977:     	movq	0x20(%rsp), %rax
14552a97c:     	movzwl	(%rax,%r9,2), %eax
14552a981:     	cmpw	$-0x1, %ax
14552a985:     	sete	%cl
14552a988:     	cmpw	%ax, %r12w
14552a98c:     	setb	%al
14552a98f:     	orb	%cl, %al
14552a991:     	movzbl	%al, %eax
14552a994:     	jmp	0x14552a9a1 <.text+0x55299a1>
14552a996:     	movl	%ebp, %r12d
14552a999:     	cmpq	$0x1, %rdi
14552a99d:     	je	0x14552a972 <.text+0x5529972>
14552a99f:     	xorl	%eax, %eax
14552a9a1:     	movq	%r11, %rdx
14552a9a4:     	addq	$0xb8, %rsp
14552a9ab:     	popq	%rbx
14552a9ac:     	popq	%rbp
14552a9ad:     	popq	%rdi
14552a9ae:     	popq	%rsi
14552a9af:     	popq	%r12
14552a9b1:     	popq	%r13
14552a9b3:     	popq	%r14
14552a9b5:     	popq	%r15
14552a9b7:     	retq
14552a9b8:     	leaq	0x180a401(%rip), %rcx   # 0x146d34dc0
14552a9bf:     	callq	0x145903e30 <.text+0x5902e30>
14552a9c4:     	ud2
14552a9c6:     	leaq	0x180a4a3(%rip), %r8    # 0x146d34e70
14552a9cd:     	movq	%rbx, %rdx
14552a9d0:     	callq	0x145903b33 <.text+0x5902b33>
14552a9d5:     	ud2
14552a9d7:     	leaq	0x180a47a(%rip), %r8    # 0x146d34e58
14552a9de:     	movq	%r9, %rcx
14552a9e1:     	movq	%r10, %rdx
14552a9e4:     	callq	0x145903b33 <.text+0x5902b33>
14552a9e9:     	ud2
