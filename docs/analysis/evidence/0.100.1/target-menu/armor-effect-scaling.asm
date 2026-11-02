
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14554c7c0:     	pushq	%rbp
14554c7c1:     	pushq	%r15
14554c7c3:     	pushq	%r14
14554c7c5:     	pushq	%r13
14554c7c7:     	pushq	%r12
14554c7c9:     	pushq	%rsi
14554c7ca:     	pushq	%rdi
14554c7cb:     	pushq	%rbx
14554c7cc:     	subq	$0x58, %rsp
14554c7d0:     	leaq	0x50(%rsp), %rbp
14554c7d5:     	movaps	%xmm6, -0x10(%rbp)
14554c7d9:     	movq	$-0x2, -0x18(%rbp)
14554c7e1:     	movq	(%rcx), %rsi
14554c7e4:     	movq	0x8(%rcx), %rdi
14554c7e8:     	movq	(%rdx), %rax
14554c7eb:     	movq	0x8(%rdx), %r8
14554c7ef:     	cmpq	%rdi, %rsi
14554c7f2:     	je	0x14554c981 <.text+0x554b981>
14554c7f8:     	movq	%rax, -0x28(%rbp)
14554c7fc:     	movq	0x10(%rcx), %rbx
14554c800:     	movq	0x10(%rdx), %rax
14554c804:     	subq	%rsi, %rdi
14554c807:     	shrq	$0x3, %rdi
14554c80b:     	movq	%r8, -0x20(%rbp)
14554c80f:     	leaq	(%rax,%r8,8), %r15
14554c813:     	xorl	%r14d, %r14d
14554c816:     	leaq	0x17ea323(%rip), %r12   # 0x146d36b40
14554c81d:     	movss	0x3fb6af(%rip), %xmm6   # 0x145947ed4
14554c825:     	leaq	0x17ead44(%rip), %r13   # 0x146d37570
14554c82c:     	jmp	0x14554c847 <.text+0x554b847>
14554c82e:     	movl	%edx, %ecx
14554c830:     	shlq	$0x20, %rax
14554c834:     	orq	%rcx, %rax
14554c837:     	movq	%rax, (%r15,%r14,8)
14554c83b:     	incq	%r14
14554c83e:     	cmpq	%r14, %rdi
14554c841:     	je	0x14554c976 <.text+0x554b976>
14554c847:     	movq	(%rbx), %rcx
14554c84a:     	cmpq	$0x5, %rcx
14554c84e:     	ja	0x14554c999 <.text+0x554b999>
14554c854:     	movq	(%rsi,%r14,8), %rdx
14554c858:     	movss	(%r12,%rcx,4), %xmm0
14554c85e:     	mulss	%xmm6, %xmm0
14554c862:     	movq	%rdx, %rax
14554c865:     	shrq	$0x20, %rax
14554c869:     	movl	%edx, %ecx
14554c86b:     	movslq	(%r13,%rcx,4), %rcx
14554c870:     	addq	%r13, %rcx
14554c873:     	jmpq	*%rcx
14554c875:     	movd	%eax, %xmm1
14554c879:     	mulss	%xmm1, %xmm0
14554c87d:     	movd	%xmm0, %eax
14554c881:     	xorl	%ecx, %ecx
14554c883:     	jmp	0x14554c830 <.text+0x554b830>
14554c885:     	movd	%eax, %xmm1
14554c889:     	mulss	%xmm1, %xmm0
14554c88d:     	movd	%xmm0, %eax
14554c891:     	movl	$0x4, %ecx
14554c896:     	jmp	0x14554c830 <.text+0x554b830>
14554c898:     	movd	%eax, %xmm1
14554c89c:     	mulss	%xmm1, %xmm0
14554c8a0:     	movd	%xmm0, %eax
14554c8a4:     	movl	$0xc, %ecx
14554c8a9:     	jmp	0x14554c830 <.text+0x554b830>
14554c8ab:     	movd	%eax, %xmm1
14554c8af:     	mulss	%xmm1, %xmm0
14554c8b3:     	movd	%xmm0, %eax
14554c8b7:     	movl	$0x9, %ecx
14554c8bc:     	jmp	0x14554c830 <.text+0x554b830>
14554c8c1:     	movd	%eax, %xmm1
14554c8c5:     	mulss	%xmm1, %xmm0
14554c8c9:     	callq	0x14577322f <.text+0x577222f>
14554c8ce:     	movd	%xmm0, %eax
14554c8d2:     	movl	$0x2, %ecx
14554c8d7:     	jmp	0x14554c830 <.text+0x554b830>
14554c8dc:     	movd	%eax, %xmm1
14554c8e0:     	mulss	%xmm1, %xmm0
14554c8e4:     	movd	%xmm0, %eax
14554c8e8:     	movl	$0x3, %ecx
14554c8ed:     	jmp	0x14554c830 <.text+0x554b830>
14554c8f2:     	movd	%eax, %xmm1
14554c8f6:     	mulss	%xmm1, %xmm0
14554c8fa:     	movd	%xmm0, %eax
14554c8fe:     	movl	$0x7, %ecx
14554c903:     	jmp	0x14554c830 <.text+0x554b830>
14554c908:     	movd	%eax, %xmm1
14554c90c:     	mulss	%xmm1, %xmm0
14554c910:     	movd	%xmm0, %eax
14554c914:     	movl	$0x1, %ecx
14554c919:     	jmp	0x14554c830 <.text+0x554b830>
14554c91e:     	movd	%eax, %xmm1
14554c922:     	mulss	%xmm1, %xmm0
14554c926:     	movd	%xmm0, %eax
14554c92a:     	movl	$0x5, %ecx
14554c92f:     	jmp	0x14554c830 <.text+0x554b830>
14554c934:     	movd	%eax, %xmm1
14554c938:     	mulss	%xmm1, %xmm0
14554c93c:     	movd	%xmm0, %eax
14554c940:     	movl	$0x6, %ecx
14554c945:     	jmp	0x14554c830 <.text+0x554b830>
14554c94a:     	movd	%eax, %xmm1
14554c94e:     	mulss	%xmm1, %xmm0
14554c952:     	movd	%xmm0, %eax
14554c956:     	movl	$0xa, %ecx
14554c95b:     	jmp	0x14554c830 <.text+0x554b830>
14554c960:     	movd	%eax, %xmm1
14554c964:     	mulss	%xmm1, %xmm0
14554c968:     	movd	%xmm0, %eax
14554c96c:     	movl	$0x8, %ecx
14554c971:     	jmp	0x14554c830 <.text+0x554b830>
14554c976:     	movq	-0x20(%rbp), %r8
14554c97a:     	addq	%r14, %r8
14554c97d:     	movq	-0x28(%rbp), %rax
14554c981:     	movq	%r8, (%rax)
14554c984:     	movaps	-0x10(%rbp), %xmm6
14554c988:     	addq	$0x58, %rsp
14554c98c:     	popq	%rbx
14554c98d:     	popq	%rdi
14554c98e:     	popq	%rsi
14554c98f:     	popq	%r12
14554c991:     	popq	%r13
14554c993:     	popq	%r14
14554c995:     	popq	%r15
14554c997:     	popq	%rbp
14554c998:     	retq
14554c999:     	addq	%r14, -0x20(%rbp)
14554c99d:     	leaq	0x17ea1dc(%rip), %r8    # 0x146d36b80
14554c9a4:     	movl	$0x6, %edx
14554c9a9:     	callq	0x145903b33 <.text+0x5902b33>
14554c9ae:     	nop
14554c9af:     	ud2
