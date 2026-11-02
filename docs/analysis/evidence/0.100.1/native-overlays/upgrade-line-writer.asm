
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14554d6e0:     	pushq	%rbp
14554d6e1:     	pushq	%r15
14554d6e3:     	pushq	%r14
14554d6e5:     	pushq	%r13
14554d6e7:     	pushq	%r12
14554d6e9:     	pushq	%rsi
14554d6ea:     	pushq	%rdi
14554d6eb:     	pushq	%rbx
14554d6ec:     	subq	$0x108, %rsp            # imm = 0x108
14554d6f3:     	leaq	0x80(%rsp), %rbp
14554d6fb:     	movaps	%xmm9, 0x70(%rbp)
14554d700:     	movaps	%xmm8, 0x60(%rbp)
14554d705:     	movaps	%xmm7, 0x50(%rbp)
14554d709:     	movaps	%xmm6, 0x40(%rbp)
14554d70d:     	movq	$-0x2, 0x38(%rbp)
14554d715:     	movq	(%rcx), %r14
14554d718:     	movq	0x8(%rcx), %rbx
14554d71c:     	movq	(%rdx), %rax
14554d71f:     	movq	%rax, -0x28(%rbp)
14554d723:     	movq	0x8(%rdx), %r8
14554d727:     	cmpq	%rbx, %r14
14554d72a:     	je	0x14554dab1 <.text+0x554cab1>
14554d730:     	movq	0x10(%rcx), %rsi
14554d734:     	movq	0x18(%rcx), %rax
14554d738:     	movq	%rax, -0x58(%rbp)
14554d73c:     	movq	0x20(%rcx), %rax
14554d740:     	movq	%rax, -0x50(%rbp)
14554d744:     	movq	0x10(%rdx), %r15
14554d748:     	subq	%r14, %rbx
14554d74b:     	movss	0x3b9de9(%rip), %xmm7   # 0x14590753c
14554d753:     	xorps	%xmm8, %xmm8
14554d757:     	movss	0x3b9dcc(%rip), %xmm9   # 0x14590752c
14554d760:     	xorl	%r13d, %r13d
14554d763:     	jmp	0x14554d79e <.text+0x554c79e>
14554d765:     	movq	(%rsi), %rdx
14554d768:     	leaq	-0x20(%rbp), %rcx
14554d76c:     	movaps	%xmm6, %xmm2
14554d76f:     	callq	0x145420ad0 <.text+0x541fad0>
14554d774:     	nop
14554d775:     	movq	-0x30(%rbp), %r8
14554d779:     	leaq	(%r8,%r8,2), %rax
14554d77d:     	movq	-0x10(%rbp), %rcx
14554d781:     	movq	%rcx, 0x10(%r15,%rax,8)
14554d786:     	movaps	-0x20(%rbp), %xmm0
14554d78a:     	movups	%xmm0, (%r15,%rax,8)
14554d78f:     	incq	%r8
14554d792:     	incq	%r13
14554d795:     	cmpq	%rbx, %r13
14554d798:     	je	0x14554dab1 <.text+0x554cab1>
14554d79e:     	movq	%r8, -0x30(%rbp)
14554d7a2:     	movb	(%r14,%r13), %dil
14554d7a6:     	movq	-0x58(%rbp), %rax
14554d7aa:     	movq	(%rax), %r8
14554d7ad:     	movq	%rsi, %rcx
14554d7b0:     	movl	%edi, %edx
14554d7b2:     	callq	0x14550c1f0 <.text+0x550b1f0>
14554d7b7:     	nop
14554d7b8:     	movaps	%xmm0, %xmm6
14554d7bb:     	movzbl	%dil, %eax
14554d7bf:     	movl	%eax, %eax
14554d7c1:     	leaq	0x17e9e44(%rip), %rcx   # 0x146d3760c
14554d7c8:     	movslq	(%rcx,%rax,4), %rax
14554d7cc:     	addq	%rcx, %rax
14554d7cf:     	jmpq	*%rax
14554d7d1:     	leaq	-0x48(%rbp), %rcx
14554d7d5:     	movq	%rsi, %rdx
14554d7d8:     	movq	-0x50(%rbp), %r8
14554d7dc:     	movaps	%xmm6, %xmm3
14554d7df:     	callq	0x1454531a0 <.text+0x54521a0>
14554d7e4:     	nop
14554d7e5:     	cmpq	$-0x1, -0x48(%rbp)
14554d7ea:     	je	0x14554d9e1 <.text+0x554c9e1>
14554d7f0:     	movq	-0x38(%rbp), %rax
14554d7f4:     	movq	%rax, -0x10(%rbp)
14554d7f8:     	movups	-0x48(%rbp), %xmm0
14554d7fc:     	movaps	%xmm0, -0x20(%rbp)
14554d800:     	jmp	0x14554d775 <.text+0x554c775>
14554d805:     	movl	$0xe, %edx
14554d80a:     	leaq	0x17e92da(%rip), %rcx   # 0x146d36aeb
14554d811:     	callq	0x145457cb0 <.text+0x5456cb0>
14554d816:     	nop
14554d817:     	movq	%rax, %r12
14554d81a:     	movq	%rdx, %rdi
14554d81d:     	mulss	%xmm7, %xmm6
14554d821:     	movss	%xmm6, -0x48(%rbp)
14554d826:     	leaq	-0x48(%rbp), %rax
14554d82a:     	movq	%rax, 0x18(%rbp)
14554d82e:     	leaq	0x1ebebb(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14554d835:     	movq	%rax, 0x20(%rbp)
14554d839:     	movq	%rbp, %rcx
14554d83c:     	leaq	0x17e884b(%rip), %rdx   # 0x146d3608e
14554d843:     	leaq	0x18(%rbp), %r8
14554d847:     	callq	0x145728390 <.text+0x5727390>
14554d84c:     	nop
14554d84d:     	testq	%r12, %r12
14554d850:     	movl	$0xe, %eax
14554d855:     	cmoveq	%rax, %rdi
14554d859:     	leaq	0x17e928b(%rip), %rax   # 0x146d36aeb
14554d860:     	cmoveq	%rax, %r12
14554d864:     	leaq	0x17e884d(%rip), %rax   # 0x146d360b8
14554d86b:     	movq	%rax, 0x18(%rbp)
14554d86f:     	movq	$0x1, 0x20(%rbp)
14554d877:     	movq	%rbp, %rax
14554d87a:     	movq	%rax, 0x28(%rbp)
14554d87e:     	leaq	0x17e8813(%rip), %rax   # 0x146d36098
14554d885:     	movq	%rax, 0x30(%rbp)
14554d889:     	movq	$0x1, 0x20(%rsp)
14554d892:     	leaq	-0x20(%rbp), %rcx
14554d896:     	movq	%r12, %rdx
14554d899:     	movq	%rdi, %r8
14554d89c:     	leaq	0x18(%rbp), %r9
14554d8a0:     	callq	0x145458060 <.text+0x5457060>
14554d8a5:     	nop
14554d8a6:     	jmp	0x14554da90 <.text+0x554ca90>
14554d8ab:     	movl	$0xc, %edx
14554d8b0:     	leaq	0x17e91fb(%rip), %rcx   # 0x146d36ab2
14554d8b7:     	callq	0x145457cb0 <.text+0x5456cb0>
14554d8bc:     	nop
14554d8bd:     	movq	%rdx, %r8
14554d8c0:     	testq	%rax, %rax
14554d8c3:     	leaq	0x17e91e8(%rip), %rcx   # 0x146d36ab2
14554d8ca:     	cmoveq	%rcx, %rax
14554d8ce:     	movl	$0xc, %ecx
14554d8d3:     	cmoveq	%rcx, %r8
14554d8d7:     	cvttss2si	%xmm6, %rcx
14554d8dc:     	ucomiss	%xmm8, %xmm6
14554d8e0:     	movl	$0x0, %edx
14554d8e5:     	cmovbl	%edx, %ecx
14554d8e8:     	ucomiss	%xmm9, %xmm6
14554d8ec:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
14554d8f1:     	cmoval	%edx, %ecx
14554d8f4:     	movl	%ecx, (%rbp)
14554d8f7:     	leaq	0x17e91e2(%rip), %rcx   # 0x146d36ae0
14554d8fe:     	movq	%rcx, 0x18(%rbp)
14554d902:     	movq	$0x1, 0x20(%rbp)
14554d90a:     	movq	%rbp, %rcx
14554d90d:     	movq	%rcx, 0x28(%rbp)
14554d911:     	leaq	0x17e91a8(%rip), %rcx   # 0x146d36ac0
14554d918:     	movq	%rcx, 0x30(%rbp)
14554d91c:     	movq	$0x1, 0x20(%rsp)
14554d925:     	leaq	-0x20(%rbp), %rcx
14554d929:     	movq	%rax, %rdx
14554d92c:     	leaq	0x18(%rbp), %r9
14554d930:     	callq	0x145458060 <.text+0x5457060>
14554d935:     	nop
14554d936:     	jmp	0x14554d775 <.text+0x554c775>
14554d93b:     	movl	$0xa, %edx
14554d940:     	leaq	0x17e919a(%rip), %rcx   # 0x146d36ae1
14554d947:     	callq	0x145457cb0 <.text+0x5456cb0>
14554d94c:     	nop
14554d94d:     	movq	%rax, %r12
14554d950:     	movq	%rdx, %rdi
14554d953:     	mulss	%xmm7, %xmm6
14554d957:     	movss	%xmm6, -0x48(%rbp)
14554d95c:     	leaq	-0x48(%rbp), %rax
14554d960:     	movq	%rax, 0x18(%rbp)
14554d964:     	leaq	0x1ebd85(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14554d96b:     	movq	%rax, 0x20(%rbp)
14554d96f:     	movq	%rbp, %rcx
14554d972:     	leaq	0x17e8715(%rip), %rdx   # 0x146d3608e
14554d979:     	leaq	0x18(%rbp), %r8
14554d97d:     	callq	0x145728390 <.text+0x5727390>
14554d982:     	nop
14554d983:     	testq	%r12, %r12
14554d986:     	movl	$0xa, %eax
14554d98b:     	cmoveq	%rax, %rdi
14554d98f:     	leaq	0x17e914b(%rip), %rax   # 0x146d36ae1
14554d996:     	cmoveq	%rax, %r12
14554d99a:     	leaq	0x17e8717(%rip), %rax   # 0x146d360b8
14554d9a1:     	movq	%rax, 0x18(%rbp)
14554d9a5:     	movq	$0x1, 0x20(%rbp)
14554d9ad:     	movq	%rbp, %rax
14554d9b0:     	movq	%rax, 0x28(%rbp)
14554d9b4:     	leaq	0x17e86dd(%rip), %rax   # 0x146d36098
14554d9bb:     	movq	%rax, 0x30(%rbp)
14554d9bf:     	movq	$0x1, 0x20(%rsp)
14554d9c8:     	leaq	-0x20(%rbp), %rcx
14554d9cc:     	movq	%r12, %rdx
14554d9cf:     	movq	%rdi, %r8
14554d9d2:     	leaq	0x18(%rbp), %r9
14554d9d6:     	callq	0x145458060 <.text+0x5457060>
14554d9db:     	nop
14554d9dc:     	jmp	0x14554da90 <.text+0x554ca90>
14554d9e1:     	movl	$0xe, %edx
14554d9e6:     	leaq	0x17e8693(%rip), %rcx   # 0x146d36080
14554d9ed:     	callq	0x145457cb0 <.text+0x5456cb0>
14554d9f2:     	nop
14554d9f3:     	movq	%rax, %r12
14554d9f6:     	movq	%rdx, %rdi
14554d9f9:     	mulss	%xmm7, %xmm6
14554d9fd:     	movss	%xmm6, -0x20(%rbp)
14554da02:     	leaq	-0x20(%rbp), %rax
14554da06:     	movq	%rax, 0x18(%rbp)
14554da0a:     	leaq	0x1ebcdf(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14554da11:     	movq	%rax, 0x20(%rbp)
14554da15:     	movq	%rbp, %rcx
14554da18:     	leaq	0x17e866f(%rip), %rdx   # 0x146d3608e
14554da1f:     	leaq	0x18(%rbp), %r8
14554da23:     	callq	0x145728390 <.text+0x5727390>
14554da28:     	nop
14554da29:     	testq	%r12, %r12
14554da2c:     	movl	$0xe, %eax
14554da31:     	cmoveq	%rax, %rdi
14554da35:     	leaq	0x17e8644(%rip), %rax   # 0x146d36080
14554da3c:     	cmoveq	%rax, %r12
14554da40:     	leaq	0x17e8671(%rip), %rax   # 0x146d360b8
14554da47:     	movq	%rax, 0x18(%rbp)
14554da4b:     	movq	$0x1, 0x20(%rbp)
14554da53:     	movq	%rbp, %rax
14554da56:     	movq	%rax, 0x28(%rbp)
14554da5a:     	leaq	0x17e8637(%rip), %rax   # 0x146d36098
14554da61:     	movq	%rax, 0x30(%rbp)
14554da65:     	movq	$0x1, 0x20(%rsp)
14554da6e:     	leaq	-0x20(%rbp), %rcx
14554da72:     	movq	%r12, %rdx
14554da75:     	movq	%rdi, %r8
14554da78:     	leaq	0x18(%rbp), %r9
14554da7c:     	callq	0x145458060 <.text+0x5457060>
14554da81:     	nop
14554da82:     	nopw	%cs:(%rax,%rax)
14554da90:     	movq	(%rbp), %rdx
14554da94:     	testq	%rdx, %rdx
14554da97:     	je	0x14554d775 <.text+0x554c775>
14554da9d:     	movq	0x8(%rbp), %rcx
14554daa1:     	movl	$0x1, %r8d
14554daa7:     	callq	0x1400021d0 <.text+0x11d0>
14554daac:     	jmp	0x14554d775 <.text+0x554c775>
14554dab1:     	movq	-0x28(%rbp), %rax
14554dab5:     	movq	%r8, (%rax)
14554dab8:     	movaps	0x40(%rbp), %xmm6
14554dabc:     	movaps	0x50(%rbp), %xmm7
14554dac0:     	movaps	0x60(%rbp), %xmm8
14554dac5:     	movaps	0x70(%rbp), %xmm9
14554daca:     	addq	$0x108, %rsp            # imm = 0x108
14554dad1:     	popq	%rbx
14554dad2:     	popq	%rdi
14554dad3:     	popq	%rsi
14554dad4:     	popq	%r12
14554dad6:     	popq	%r13
14554dad8:     	popq	%r14
14554dada:     	popq	%r15
14554dadc:     	popq	%rbp
14554dadd:     	retq
