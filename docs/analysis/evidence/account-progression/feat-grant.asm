
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552f770:     	pushq	%rbp
14552f771:     	pushq	%r15
14552f773:     	pushq	%r14
14552f775:     	pushq	%r13
14552f777:     	pushq	%r12
14552f779:     	pushq	%rsi
14552f77a:     	pushq	%rdi
14552f77b:     	pushq	%rbx
14552f77c:     	subq	$0xd8, %rsp
14552f783:     	leaq	0x80(%rsp), %rbp
14552f78b:     	movaps	%xmm6, 0x40(%rbp)
14552f78f:     	movq	$-0x2, 0x38(%rbp)
14552f797:     	movq	%r8, %rbx
14552f79a:     	movq	%rdx, %r14
14552f79d:     	movq	%rcx, -0x20(%rbp)
14552f7a1:     	movq	$0x0, 0x8(%rbp)
14552f7a9:     	movq	$0x8, 0x10(%rbp)
14552f7b1:     	movq	$0x0, 0x18(%rbp)
14552f7b9:     	movq	0x250ad20(%rip), %rax   # 0x147a3a4e0
14552f7c0:     	cmpq	$0xd, %rax
14552f7c4:     	movl	$0xd, %ecx
14552f7c9:     	cmovbq	%rax, %rcx
14552f7cd:     	shll	$0x5, %ecx
14552f7d0:     	leaq	0x25082c9(%rip), %rax   # 0x147a37aa0
14552f7d7:     	leaq	(%rax,%rcx), %rsi
14552f7db:     	movl	0x18(%rcx,%rax), %eax
14552f7df:     	testl	%eax, %eax
14552f7e1:     	jne	0x14552fa6f <.text+0x552ea6f>
14552f7e7:     	movq	0x8(%rsi), %r15
14552f7eb:     	imulq	$0x70, 0x10(%rsi), %rsi
14552f7f0:     	addq	%r15, %rsi
14552f7f3:     	movzbl	0x10(%rbx), %eax
14552f7f7:     	movb	%al, 0x37(%rbp)
14552f7fa:     	movzbl	0x12(%rbx), %eax
14552f7fe:     	movb	%al, 0x33(%rbp)
14552f801:     	cmpl	$0x0, 0xc(%rbx)
14552f805:     	sete	0x34(%rbp)
14552f809:     	movzbl	0x11(%rbx), %eax
14552f80d:     	movb	%al, 0x35(%rbp)
14552f810:     	movss	(%rbx), %xmm6
14552f814:     	movl	0x8(%rbx), %eax
14552f817:     	movl	%eax, (%rbp)
14552f81a:     	movss	0x4b507a(%rip), %xmm0   # 0x1459e489c
14552f822:     	ucomiss	%xmm6, %xmm0
14552f825:     	setae	0x36(%rbp)
14552f829:     	movl	0x4(%rbx), %eax
14552f82c:     	movl	%eax, 0x4(%rbp)
14552f82f:     	movq	%rsi, -0x28(%rbp)
14552f833:     	movq	%r14, -0x30(%rbp)
14552f837:     	jmp	0x14552f850 <.text+0x552e850>
14552f839:     	movq	0x10(%rbp), %rax
14552f83d:     	movq	%r12, (%rax,%rdi,8)
14552f841:     	incq	%rdi
14552f844:     	movq	%rdi, 0x18(%rbp)
14552f848:     	nopl	(%rax,%rax)
14552f850:     	cmpq	%rsi, %r15
14552f853:     	je	0x14552fa44 <.text+0x552ea44>
14552f859:     	movq	%r15, %r12
14552f85c:     	addq	$0x70, %r15
14552f860:     	cmpb	$0x9, 0x48(%r12)
14552f866:     	jne	0x14552f850 <.text+0x552e850>
14552f868:     	movl	0x4c(%r12), %ecx
14552f86d:     	movl	0x50(%r12), %eax
14552f872:     	movl	%eax, 0x2c(%rbp)
14552f875:     	movq	0x8(%r12), %rdi
14552f87a:     	movq	0x10(%r12), %rax
14552f87f:     	movq	%rax, 0x20(%rbp)
14552f883:     	movq	0xb8(%r14), %rbx
14552f88a:     	testq	%rbx, %rbx
14552f88d:     	je	0x14552f94e <.text+0x552e94e>
14552f893:     	movq	%r12, -0x38(%rbp)
14552f897:     	movq	0xb0(%r14), %r15
14552f89e:     	cmpq	$0x1, %rbx
14552f8a2:     	movl	%ecx, -0x4(%rbp)
14552f8a5:     	movq	%rdi, -0x10(%rbp)
14552f8a9:     	jne	0x14552f8b4 <.text+0x552e8b4>
14552f8ab:     	xorl	%r14d, %r14d
14552f8ae:     	movq	0x20(%rbp), %r13
14552f8b2:     	jmp	0x14552f905 <.text+0x552e905>
14552f8b4:     	xorl	%r14d, %r14d
14552f8b7:     	movq	0x20(%rbp), %r13
14552f8bb:     	nopl	(%rax,%rax)
14552f8c0:     	movq	%r14, %rdi
14552f8c3:     	movq	%rbx, %r12
14552f8c6:     	shrq	%r12
14552f8c9:     	addq	%r12, %r14
14552f8cc:     	leaq	(%r14,%r14,2), %rax
14552f8d0:     	movq	0x8(%r15,%rax,8), %rcx
14552f8d5:     	movq	0x10(%r15,%rax,8), %r8
14552f8da:     	movq	%r8, %rsi
14552f8dd:     	subq	%r13, %rsi
14552f8e0:     	cmovaeq	%r13, %r8
14552f8e4:     	movq	-0x10(%rbp), %rdx
14552f8e8:     	callq	0x1457731e7 <.text+0x57721e7>
14552f8ed:     	cltq
14552f8ef:     	testl	%eax, %eax
14552f8f1:     	cmovneq	%rax, %rsi
14552f8f5:     	testq	%rsi, %rsi
14552f8f8:     	cmovgq	%rdi, %r14
14552f8fc:     	subq	%r12, %rbx
14552f8ff:     	cmpq	$0x1, %rbx
14552f903:     	ja	0x14552f8c0 <.text+0x552e8c0>
14552f905:     	leaq	(%r14,%r14,2), %rax
14552f909:     	movq	0x8(%r15,%rax,8), %rcx
14552f90e:     	movq	0x10(%r15,%rax,8), %r8
14552f913:     	movq	%r8, %rsi
14552f916:     	subq	%r13, %rsi
14552f919:     	cmovaeq	%r13, %r8
14552f91d:     	movq	-0x10(%rbp), %rdi
14552f921:     	movq	%rdi, %rdx
14552f924:     	callq	0x1457731e7 <.text+0x57721e7>
14552f929:     	cltq
14552f92b:     	testl	%eax, %eax
14552f92d:     	cmovneq	%rax, %rsi
14552f931:     	testq	%rsi, %rsi
14552f934:     	movq	-0x30(%rbp), %r14
14552f938:     	movq	-0x28(%rbp), %rsi
14552f93c:     	movq	-0x38(%rbp), %r12
14552f940:     	leaq	0x70(%r12), %r15
14552f945:     	movl	-0x4(%rbp), %ecx
14552f948:     	je	0x14552f850 <.text+0x552e850>
14552f94e:     	movl	%ecx, %eax
14552f950:     	leaq	0x180649d(%rip), %rcx   # 0x146d35df4
14552f957:     	movslq	(%rcx,%rax,4), %rax
14552f95b:     	addq	%rcx, %rax
14552f95e:     	jmpq	*%rax
14552f960:     	movl	0x2c(%rbp), %eax
14552f963:     	cmpl	%eax, 0x4(%rbp)
14552f966:     	jmp	0x14552f990 <.text+0x552e990>
14552f968:     	movzbl	0x34(%rbp), %eax
14552f96c:     	cmpb	$0x0, 0x37(%rbp)
14552f970:     	je	0x14552f850 <.text+0x552e850>
14552f976:     	jmp	0x14552f9d0 <.text+0x552e9d0>
14552f978:     	cmpb	$0x0, 0x37(%rbp)
14552f97c:     	je	0x14552f850 <.text+0x552e850>
14552f982:     	movl	0x2c(%rbp), %eax
14552f985:     	xorps	%xmm0, %xmm0
14552f988:     	cvtsi2ss	%rax, %xmm0
14552f98d:     	ucomiss	%xmm0, %xmm6
14552f990:     	setae	%al
14552f993:     	jmp	0x14552f9d0 <.text+0x552e9d0>
14552f995:     	movzbl	0x35(%rbp), %eax
14552f999:     	cmpb	$0x0, 0x37(%rbp)
14552f99d:     	je	0x14552f850 <.text+0x552e850>
14552f9a3:     	jmp	0x14552f9d0 <.text+0x552e9d0>
14552f9a5:     	movzbl	0x36(%rbp), %eax
14552f9a9:     	cmpl	$0x3, (%rbp)
14552f9ad:     	jbe	0x14552f850 <.text+0x552e850>
14552f9b3:     	jmp	0x14552f9d0 <.text+0x552e9d0>
14552f9b5:     	movzbl	0x33(%rbp), %eax
14552f9b9:     	cmpb	$0x0, 0x37(%rbp)
14552f9bd:     	je	0x14552f850 <.text+0x552e850>
14552f9c3:     	nopw	%cs:(%rax,%rax)
14552f9d0:     	testb	%al, %al
14552f9d2:     	je	0x14552f850 <.text+0x552e850>
14552f9d8:     	callq	0x145703e20 <.text+0x5702e20>
14552f9dd:     	nop
14552f9de:     	movl	%eax, -0x18(%rbp)
14552f9e1:     	movl	%edx, -0x14(%rbp)
14552f9e4:     	leaq	-0x50(%rbp), %rcx
14552f9e8:     	leaq	-0x18(%rbp), %rdx
14552f9ec:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
14552f9f2:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
14552f9f8:     	callq	0x145703dd0 <.text+0x5702dd0>
14552f9fd:     	nop
14552f9fe:     	cmpb	$0x0, -0x50(%rbp)
14552fa02:     	movq	0x20(%rbp), %r8
14552fa06:     	jne	0x14552fa0e <.text+0x552ea0e>
14552fa08:     	movq	-0x48(%rbp), %rax
14552fa0c:     	jmp	0x14552fa10 <.text+0x552ea10>
14552fa0e:     	xorl	%eax, %eax
14552fa10:     	movq	%rax, 0x20(%rsp)
14552fa15:     	movl	$0x1, %r9d
14552fa1b:     	movq	%r14, %rcx
14552fa1e:     	movq	%rdi, %rdx
14552fa21:     	callq	0x14542e180 <.text+0x542d180>
14552fa26:     	nop
14552fa27:     	movq	0x18(%rbp), %rdi
14552fa2b:     	cmpq	0x8(%rbp), %rdi
14552fa2f:     	jne	0x14552f839 <.text+0x552e839>
14552fa35:     	leaq	0x8(%rbp), %rcx
14552fa39:     	callq	0x145774550 <.text+0x5773550>
14552fa3e:     	nop
14552fa3f:     	jmp	0x14552f839 <.text+0x552e839>
14552fa44:     	movq	0x18(%rbp), %rcx
14552fa48:     	movq	-0x20(%rbp), %rax
14552fa4c:     	movq	%rcx, 0x10(%rax)
14552fa50:     	movups	0x8(%rbp), %xmm0
14552fa54:     	movups	%xmm0, (%rax)
14552fa57:     	movaps	0x40(%rbp), %xmm6
14552fa5b:     	addq	$0xd8, %rsp
14552fa62:     	popq	%rbx
14552fa63:     	popq	%rdi
14552fa64:     	popq	%rsi
14552fa65:     	popq	%r12
14552fa67:     	popq	%r13
14552fa69:     	popq	%r14
14552fa6b:     	popq	%r15
14552fa6d:     	popq	%rbp
14552fa6e:     	retq
14552fa6f:     	movq	%rsi, %rcx
14552fa72:     	callq	0x1458e9ead <.text+0x58e8ead>
14552fa77:     	nop
14552fa78:     	jmp	0x14552f7e7 <.text+0x552e7e7>
