
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f96f0:     	pushq	%rbp
1458f96f1:     	pushq	%r15
1458f96f3:     	pushq	%r14
1458f96f5:     	pushq	%r13
1458f96f7:     	pushq	%r12
1458f96f9:     	pushq	%rsi
1458f96fa:     	pushq	%rdi
1458f96fb:     	pushq	%rbx
1458f96fc:     	subq	$0x1d8, %rsp            # imm = 0x1D8
1458f9703:     	leaq	0x80(%rsp), %rbp
1458f970b:     	movaps	%xmm15, 0x140(%rbp)
1458f9713:     	movaps	%xmm14, 0x130(%rbp)
1458f971b:     	movaps	%xmm13, 0x120(%rbp)
1458f9723:     	movaps	%xmm12, 0x110(%rbp)
1458f972b:     	movaps	%xmm11, 0x100(%rbp)
1458f9733:     	movaps	%xmm10, 0xf0(%rbp)
1458f973b:     	movaps	%xmm9, 0xe0(%rbp)
1458f9743:     	movaps	%xmm8, 0xd0(%rbp)
1458f974b:     	movaps	%xmm7, 0xc0(%rbp)
1458f9752:     	movaps	%xmm6, 0xb0(%rbp)
1458f9759:     	movq	$-0x2, 0xa8(%rbp)
1458f9764:     	movq	%rcx, %r12
1458f9767:     	movzbl	0x304(%rcx), %eax
1458f976e:     	addb	$-0x2, %al
1458f9770:     	cmpb	$0x9, %al
1458f9772:     	ja	0x1458f979a <.text+0x58f879a>
1458f9774:     	movzbl	%al, %eax
1458f9777:     	leaq	0x1581a12(%rip), %rcx   # 0x146e7b190
1458f977e:     	movq	(%rcx,%rax,8), %rsi
1458f9782:     	movzbl	0x305(%r12), %eax
1458f978b:     	addb	$-0x2, %al
1458f978d:     	cmpb	$0x6, %al
1458f978f:     	jbe	0x1458f97b0 <.text+0x58f87b0>
1458f9791:     	leaq	0x12b0e78(%rip), %rdx   # 0x146baa610
1458f9798:     	jmp	0x1458f97be <.text+0x58f87be>
1458f979a:     	leaq	0x12b2007(%rip), %rsi   # 0x146bab7a8
1458f97a1:     	movzbl	0x305(%r12), %eax
1458f97aa:     	addb	$-0x2, %al
1458f97ac:     	cmpb	$0x6, %al
1458f97ae:     	ja	0x1458f9791 <.text+0x58f8791>
1458f97b0:     	movzbl	%al, %eax
1458f97b3:     	leaq	0x1581966(%rip), %rcx   # 0x146e7b120
1458f97ba:     	movq	(%rcx,%rax,8), %rdx
1458f97be:     	movq	0x780(%r12), %r15
1458f97c6:     	leaq	(,%r15,8), %rdi
1458f97ce:     	movq	%r15, %rax
1458f97d1:     	shrq	$0x3d, %rax
1458f97d5:     	setne	%al
1458f97d8:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
1458f97e2:     	cmpq	%rcx, %rdi
1458f97e5:     	seta	%cl
1458f97e8:     	orb	%al, %cl
1458f97ea:     	je	0x1458f97fc <.text+0x58f87fc>
1458f97ec:     	xorl	%r14d, %r14d
1458f97ef:     	movq	%r14, %rcx
1458f97f2:     	movq	%rdi, %rdx
1458f97f5:     	callq	0x145d6944b <.text+0x5d6844b>
1458f97fa:     	ud2
1458f97fc:     	movq	%rdx, 0x90(%rbp)
1458f9803:     	movq	0x778(%r12), %rbx
1458f980b:     	testq	%rdi, %rdi
1458f980e:     	je	0x1458f9835 <.text+0x58f8835>
1458f9810:     	callq	0x140002200 <.text+0x1200>
1458f9815:     	movl	$0x4, %r14d
1458f981b:     	movl	$0x4, %edx
1458f9820:     	movq	%rdi, %rcx
1458f9823:     	callq	0x1400021c0 <.text+0x11c0>
1458f9828:     	testq	%rax, %rax
1458f982b:     	je	0x1458f97ef <.text+0x58f87ef>
1458f982d:     	movq	%rax, %r13
1458f9830:     	movq	%r15, %rax
1458f9833:     	jmp	0x1458f983d <.text+0x58f883d>
1458f9835:     	movl	$0x4, %r13d
1458f983b:     	xorl	%eax, %eax
1458f983d:     	movq	%rsi, 0x30(%rbp)
1458f9841:     	movq	%rax, 0x60(%rbp)
1458f9845:     	movq	%r13, 0x68(%rbp)
1458f9849:     	movq	$0x0, 0x70(%rbp)
1458f9851:     	testq	%r15, %r15
1458f9854:     	je	0x1458f986e <.text+0x58f886e>
1458f9856:     	movq	%r13, %rcx
1458f9859:     	movq	%rax, %rsi
1458f985c:     	movq	%rbx, %rdx
1458f985f:     	movq	%rdi, %r8
1458f9862:     	callq	0x145bc977b <.text+0x5bc877b>
1458f9867:     	movq	%rsi, %rax
1458f986a:     	movq	%r15, 0x70(%rbp)
1458f986e:     	movq	0x60(%r12), %rbx
1458f9873:     	testq	%rbx, %rbx
1458f9876:     	je	0x1458f9925 <.text+0x58f8925>
1458f987c:     	movss	0x9ec(%r12), %xmm6
1458f9886:     	movq	0x58(%r12), %r14
1458f988b:     	shlq	$0x4, %rbx
1458f988f:     	addq	%r14, %rbx
1458f9892:     	movq	%r12, %rax
1458f9895:     	movq	0x7a8(%r12), %r12
1458f989d:     	movq	%rax, 0x50(%rbp)
1458f98a1:     	movq	0x7b0(%rax), %rsi
1458f98a8:     	leaq	0x60(%rbp), %rdi
1458f98ac:     	jmp	0x1458f98cf <.text+0x58f88cf>
1458f98ae:     	nop
1458f98b0:     	movq	0x68(%rbp), %rax
1458f98b4:     	movb	%r13b, (%rax,%r15,8)
1458f98b8:     	movss	%xmm7, 0x4(%rax,%r15,8)
1458f98bf:     	incq	%r15
1458f98c2:     	movq	%r15, 0x70(%rbp)
1458f98c6:     	addq	$0x10, %r14
1458f98ca:     	cmpq	%rbx, %r14
1458f98cd:     	je	0x1458f9913 <.text+0x58f8913>
1458f98cf:     	ucomiss	0xc(%r14), %xmm6
1458f98d4:     	jae	0x1458f98c6 <.text+0x58f88c6>
1458f98d6:     	movq	(%r14), %rax
1458f98d9:     	cmpq	%rsi, %rax
1458f98dc:     	jae	0x1458f98c6 <.text+0x58f88c6>
1458f98de:     	shlq	$0x6, %rax
1458f98e2:     	cmpb	$0xf, (%r12,%rax)
1458f98e7:     	jne	0x1458f98c6 <.text+0x58f88c6>
1458f98e9:     	addq	%r12, %rax
1458f98ec:     	movzbl	0x1(%rax), %r13d
1458f98f1:     	movl	0x8(%r14), %ecx
1458f98f5:     	xorps	%xmm7, %xmm7
1458f98f8:     	cvtsi2ss	%rcx, %xmm7
1458f98fd:     	mulss	0x4(%rax), %xmm7
1458f9902:     	cmpq	0x60(%rbp), %r15
1458f9906:     	jne	0x1458f98b0 <.text+0x58f88b0>
1458f9908:     	movq	%rdi, %rcx
1458f990b:     	callq	0x145bfb120 <.text+0x5bfa120>
1458f9910:     	nop
1458f9911:     	jmp	0x1458f98b0 <.text+0x58f88b0>
1458f9913:     	movq	0x60(%rbp), %rax
1458f9917:     	movq	%rax, 0x48(%rbp)
1458f991b:     	movq	0x68(%rbp), %r13
1458f991f:     	movq	0x50(%rbp), %r12
1458f9923:     	jmp	0x1458f9929 <.text+0x58f8929>
1458f9925:     	movq	%rax, 0x48(%rbp)
1458f9929:     	movl	0x4d8(%r12), %eax
1458f9931:     	cvtsi2ss	%rax, %xmm5
1458f9936:     	addss	0x47a3d6(%rip), %xmm5   # 0x145d73d14
1458f993e:     	movss	0x4a1559(%rip), %xmm13  # 0x145d9aea0
1458f9947:     	movss	0x4c5c50(%rip), %xmm12  # 0x145dbf5a0
1458f9950:     	mulss	%xmm5, %xmm12
1458f9955:     	movss	0x473a0f(%rip), %xmm0   # 0x145d6d36c
1458f995d:     	movaps	%xmm0, 0x10(%rbp)
1458f9961:     	addss	%xmm0, %xmm12
1458f9966:     	movq	0x30(%rbp), %rsi
1458f996a:     	movss	0x84(%rsi), %xmm4
1458f9972:     	movss	0x4772c6(%rip), %xmm0   # 0x145d70c40
1458f997a:     	cvttss2si	%xmm5, %rcx
1458f997f:     	xorl	%eax, %eax
1458f9981:     	xorps	%xmm3, %xmm3
1458f9984:     	xorps	%xmm2, %xmm2
1458f9987:     	movaps	%xmm2, (%rbp)
1458f998b:     	ucomiss	%xmm3, %xmm5
1458f998e:     	movaps	%xmm5, %xmm3
1458f9991:     	cmovbl	%eax, %ecx
1458f9994:     	mulss	%xmm5, %xmm0
1458f9998:     	ucomiss	0x473ed5(%rip), %xmm5   # 0x145d6d874
1458f999f:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1458f99a4:     	cmovbel	%ecx, %edx
1458f99a7:     	addss	0x477289(%rip), %xmm0   # 0x145d70c38
1458f99af:     	incl	%edx
1458f99b1:     	movl	$0x88888889, %r8d       # imm = 0x88888889
1458f99b7:     	imulq	%rdx, %r8
1458f99bb:     	shrq	$0x23, %r8
1458f99bf:     	cmpl	$0x3, %r8d
1458f99c3:     	movl	$0x3, %ecx
1458f99c8:     	cmovbl	%r8d, %ecx
1458f99cc:     	movq	0x90(%rbp), %rdx
1458f99d3:     	movq	0x28(%rdx), %r8
1458f99d7:     	testq	%r8, %r8
1458f99da:     	je	0x1458f9ac4 <.text+0x58f8ac4>
1458f99e0:     	movaps	%xmm13, %xmm14
1458f99e4:     	movq	0x20(%rdx), %rdx
1458f99e8:     	leaq	(%rdx,%r8,8), %r8
1458f99ec:     	movss	0x4a14ab(%rip), %xmm13  # 0x145d9aea0
1458f99f5:     	movss	0x47a34b(%rip), %xmm1   # 0x145d73d48
1458f99fd:     	movaps	%xmm1, 0x90(%rbp)
1458f9a04:     	xorps	%xmm6, %xmm6
1458f9a07:     	movss	0x47395d(%rip), %xmm7   # 0x145d6d36c
1458f9a0f:     	leaq	0x158184e(%rip), %r9    # 0x146e7b264
1458f9a16:     	movaps	%xmm7, %xmm8
1458f9a1a:     	movaps	%xmm7, %xmm11
1458f9a1e:     	movaps	%xmm7, %xmm9
1458f9a22:     	xorps	%xmm10, %xmm10
1458f9a26:     	movaps	%xmm7, 0x50(%rbp)
1458f9a2a:     	movaps	%xmm2, 0x20(%rbp)
1458f9a2e:     	jmp	0x1458f9a4d <.text+0x58f8a4d>
1458f9a30:     	movaps	0x20(%rbp), %xmm5
1458f9a34:     	addss	%xmm2, %xmm5
1458f9a38:     	movaps	%xmm5, 0x20(%rbp)
1458f9a3c:     	nopl	(%rax)
1458f9a40:     	addq	$0x8, %rdx
1458f9a44:     	cmpq	%r8, %rdx
1458f9a47:     	je	0x1458f9af8 <.text+0x58f8af8>
1458f9a4d:     	movl	(%rdx), %r10d
1458f9a50:     	movss	0x4(%rdx), %xmm2
1458f9a55:     	movslq	(%r9,%r10,4), %r10
1458f9a59:     	addq	%r9, %r10
1458f9a5c:     	jmpq	*%r10
1458f9a5f:     	addss	%xmm2, %xmm8
1458f9a64:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9a66:     	movaps	0x90(%rbp), %xmm1
1458f9a6d:     	addss	%xmm2, %xmm1
1458f9a71:     	movaps	%xmm1, 0x90(%rbp)
1458f9a78:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9a7a:     	movaps	0x50(%rbp), %xmm1
1458f9a7e:     	addss	%xmm2, %xmm1
1458f9a82:     	movaps	%xmm1, 0x50(%rbp)
1458f9a86:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9a88:     	addss	%xmm2, %xmm6
1458f9a8c:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9a8e:     	addss	%xmm2, %xmm11
1458f9a93:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9a95:     	addss	%xmm7, %xmm2
1458f9a99:     	mulss	%xmm2, %xmm13
1458f9a9e:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9aa0:     	addss	%xmm2, %xmm12
1458f9aa5:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9aa7:     	addss	%xmm2, %xmm4
1458f9aab:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9aad:     	addss	%xmm2, %xmm0
1458f9ab1:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9ab3:     	addss	%xmm2, %xmm10
1458f9ab8:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9aba:     	addss	%xmm2, %xmm9
1458f9abf:     	jmp	0x1458f9a40 <.text+0x58f8a40>
1458f9ac4:     	movss	0x47a27c(%rip), %xmm1   # 0x145d73d48
1458f9acc:     	movaps	%xmm1, 0x90(%rbp)
1458f9ad3:     	movaps	%xmm2, 0x20(%rbp)
1458f9ad7:     	movss	0x47388c(%rip), %xmm8   # 0x145d6d36c
1458f9ae0:     	movaps	%xmm8, 0x50(%rbp)
1458f9ae5:     	xorps	%xmm10, %xmm10
1458f9ae9:     	movaps	%xmm8, %xmm9
1458f9aed:     	movaps	%xmm13, %xmm14
1458f9af1:     	movaps	%xmm8, %xmm11
1458f9af5:     	xorps	%xmm6, %xmm6
1458f9af8:     	mulss	%xmm14, %xmm3
1458f9afd:     	movq	0x368(%r12), %rdx
1458f9b05:     	testq	%rdx, %rdx
1458f9b08:     	je	0x1458f9b53 <.text+0x58f8b53>
1458f9b0a:     	movq	0x360(%r12), %r8
1458f9b12:     	shlq	$0x3, %rdx
1458f9b16:     	xorl	%eax, %eax
1458f9b18:     	movss	0x47384c(%rip), %xmm2   # 0x145d6d36c
1458f9b20:     	movaps	%xmm2, 0x10(%rbp)
1458f9b24:     	movss	0x473900(%rip), %xmm7   # 0x145d6d42c
1458f9b2c:     	xorps	%xmm2, %xmm2
1458f9b2f:     	movaps	%xmm2, (%rbp)
1458f9b33:     	movl	(%r8,%rax), %r10d
1458f9b37:     	leaq	0x1581756(%rip), %r9    # 0x146e7b294
1458f9b3e:     	movslq	(%r9,%r10,4), %r11
1458f9b42:     	addq	%r9, %r11
1458f9b45:     	movss	%xmm2, 0xa0(%rbp)
1458f9b4d:     	xorl	%r10d, %r10d
1458f9b50:     	jmpq	*%r11
1458f9b53:     	movss	0x4738d1(%rip), %xmm7   # 0x145d6d42c
1458f9b5b:     	xorps	%xmm2, %xmm2
1458f9b5e:     	movss	%xmm2, 0xa0(%rbp)
1458f9b66:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9b68:     	addss	0x80(%rsi), %xmm3
1458f9b70:     	movss	%xmm3, -0x4(%rbp)
1458f9b75:     	movq	0x338(%r12), %r8
1458f9b7d:     	testq	%r8, %r8
1458f9b80:     	je	0x1458f9bc1 <.text+0x58f8bc1>
1458f9b82:     	movaps	%xmm9, 0x30(%rbp)
1458f9b87:     	movq	0x330(%r12), %rdx
1458f9b8f:     	shlq	$0x3, %r8
1458f9b93:     	leaq	(%r8,%r8,2), %r8
1458f9b97:     	xorps	%xmm15, %xmm15
1458f9b9b:     	xorl	%r9d, %r9d
1458f9b9e:     	movss	0x10(%rdx,%r9), %xmm9
1458f9ba5:     	movq	(%rdx,%r9), %r11
1458f9ba9:     	movzbl	0x44(%r11), %esi
1458f9bae:     	leaq	0x1581713(%rip), %r10   # 0x146e7b2c8
1458f9bb5:     	movslq	(%r10,%rsi,4), %rsi
1458f9bb9:     	addq	%r10, %rsi
1458f9bbc:     	xorps	%xmm3, %xmm3
1458f9bbf:     	jmpq	*%rsi
1458f9bc1:     	xorps	%xmm15, %xmm15
1458f9bc5:     	xorps	%xmm3, %xmm3
1458f9bc8:     	jmp	0x1458f9d5b <.text+0x58f8d5b>
1458f9bcd:     	addss	0x4(%r8,%r10), %xmm12
1458f9bd4:     	addq	$0x8, %r10
1458f9bd8:     	cmpq	%r10, %rdx
1458f9bdb:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9be1:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9be3:     	addss	0x4(%r8,%r10), %xmm6
1458f9bea:     	addq	$0x8, %r10
1458f9bee:     	cmpq	%r10, %rdx
1458f9bf1:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9bf7:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9bfc:     	movss	0xa0(%rbp), %xmm2
1458f9c04:     	addss	0x4(%r8,%r10), %xmm2
1458f9c0b:     	movss	%xmm2, 0xa0(%rbp)
1458f9c13:     	addq	$0x8, %r10
1458f9c17:     	cmpq	%r10, %rdx
1458f9c1a:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9c20:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9c25:     	movaps	0x90(%rbp), %xmm1
1458f9c2c:     	addss	0x4(%r8,%r10), %xmm1
1458f9c33:     	movaps	%xmm1, 0x90(%rbp)
1458f9c3a:     	addq	$0x8, %r10
1458f9c3e:     	cmpq	%r10, %rdx
1458f9c41:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9c47:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9c4c:     	addss	0x4(%r8,%r10), %xmm7
1458f9c53:     	addq	$0x8, %r10
1458f9c57:     	cmpq	%r10, %rdx
1458f9c5a:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9c60:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9c65:     	addss	0x4(%r8,%r10), %xmm11
1458f9c6c:     	addq	$0x8, %r10
1458f9c70:     	cmpq	%r10, %rdx
1458f9c73:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9c79:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9c7e:     	addss	0x4(%r8,%r10), %xmm4
1458f9c85:     	addq	$0x8, %r10
1458f9c89:     	cmpq	%r10, %rdx
1458f9c8c:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9c92:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9c97:     	addss	0x4(%r8,%r10), %xmm0
1458f9c9e:     	addq	$0x8, %r10
1458f9ca2:     	cmpq	%r10, %rdx
1458f9ca5:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9cab:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9cb0:     	movaps	%xmm13, %xmm2
1458f9cb4:     	movss	0x4(%r8,%r10), %xmm13
1458f9cbb:     	addss	0x4736a8(%rip), %xmm13  # 0x145d6d36c
1458f9cc4:     	mulss	%xmm2, %xmm13
1458f9cc9:     	addq	$0x8, %r10
1458f9ccd:     	cmpq	%r10, %rdx
1458f9cd0:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9cd2:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9cd7:     	movaps	0x50(%rbp), %xmm1
1458f9cdb:     	addss	0x4(%r8,%r10), %xmm1
1458f9ce2:     	movaps	%xmm1, 0x50(%rbp)
1458f9ce6:     	addq	$0x8, %r10
1458f9cea:     	cmpq	%r10, %rdx
1458f9ced:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9cef:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9cf4:     	movaps	0x10(%rbp), %xmm2
1458f9cf8:     	addss	0x4(%r8,%r10), %xmm2
1458f9cff:     	movaps	%xmm2, 0x10(%rbp)
1458f9d03:     	addq	$0x8, %r10
1458f9d07:     	cmpq	%r10, %rdx
1458f9d0a:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9d0c:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9d11:     	addl	0x4(%r8,%r10), %eax
1458f9d16:     	addq	$0x8, %r10
1458f9d1a:     	cmpq	%r10, %rdx
1458f9d1d:     	jne	0x1458f9d40 <.text+0x58f8d40>
1458f9d1f:     	jmp	0x1458f9b68 <.text+0x58f8b68>
1458f9d24:     	movaps	(%rbp), %xmm2
1458f9d28:     	addss	0x4(%r8,%r10), %xmm2
1458f9d2f:     	movaps	%xmm2, (%rbp)
1458f9d33:     	addq	$0x8, %r10
1458f9d37:     	cmpq	%r10, %rdx
1458f9d3a:     	je	0x1458f9b68 <.text+0x58f8b68>
1458f9d40:     	movl	(%r8,%r10), %r11d
1458f9d44:     	movslq	(%r9,%r11,4), %r11
1458f9d48:     	addq	%r9, %r11
1458f9d4b:     	jmpq	*%r11
1458f9d4e:     	minss	0x4a11b6(%rip), %xmm3   # 0x145d9af0c
1458f9d56:     	movaps	0x30(%rbp), %xmm9
1458f9d5b:     	movaps	%xmm10, -0x20(%rbp)
1458f9d60:     	movss	0x47a29f(%rip), %xmm10  # 0x145d74008
1458f9d69:     	testq	%r15, %r15
1458f9d6c:     	movaps	%xmm3, -0x40(%rbp)
1458f9d70:     	je	0x1458f9dae <.text+0x58f8dae>
1458f9d72:     	shlq	$0x3, %r15
1458f9d76:     	movss	0x47a28a(%rip), %xmm5   # 0x145d74008
1458f9d7e:     	xorps	%xmm14, %xmm14
1458f9d82:     	xorl	%edx, %edx
1458f9d84:     	movzbl	(%r13,%rdx), %r9d
1458f9d8a:     	leaq	0x1581583(%rip), %r8    # 0x146e7b314
1458f9d91:     	movslq	(%r8,%r9,4), %r9
1458f9d95:     	addq	%r8, %r9
1458f9d98:     	xorps	%xmm1, %xmm1
1458f9d9b:     	movss	%xmm1, 0xa4(%rbp)
1458f9da3:     	movss	%xmm1, 0x8c(%rbp)
1458f9dab:     	jmpq	*%r9
1458f9dae:     	movaps	%xmm7, %xmm3
1458f9db1:     	movaps	%xmm13, -0x30(%rbp)
1458f9db6:     	movaps	0x90(%rbp), %xmm5
1458f9dbd:     	movaps	%xmm9, 0x30(%rbp)
1458f9dc2:     	xorps	%xmm1, %xmm1
1458f9dc5:     	movss	%xmm1, 0xa4(%rbp)
1458f9dcd:     	xorps	%xmm13, %xmm13
1458f9dd1:     	xorps	%xmm14, %xmm14
1458f9dd5:     	movss	0x9ec(%r12), %xmm2
1458f9ddf:     	movq	0x378(%r12), %r8
1458f9de7:     	movq	0x380(%r12), %rdx
1458f9def:     	leaq	(%rdx,%rdx,2), %rdx
1458f9df3:     	leaq	(%r8,%rdx,8), %rdx
1458f9df7:     	movss	0x47356c(%rip), %xmm9   # 0x145d6d36c
1458f9e00:     	addss	%xmm15, %xmm9
1458f9e05:     	movss	0x473947(%rip), %xmm7   # 0x145d6d754
1458f9e0d:     	movq	%r8, %r9
1458f9e10:     	cmpq	%rdx, %r9
1458f9e13:     	je	0x1458f9e9f <.text+0x58f8e9f>
1458f9e19:     	leaq	0x18(%r9), %r8
1458f9e1d:     	ucomiss	0x10(%r9), %xmm2
1458f9e22:     	movq	%r8, %r9
1458f9e25:     	jae	0x1458f9e10 <.text+0x58f8e10>
1458f9e27:     	movl	-0x18(%r8), %r9d
1458f9e2b:     	cmpl	$0x8, %r9d
1458f9e2f:     	je	0x1458f9e70 <.text+0x58f8e70>
1458f9e31:     	cmpl	$0x9, %r9d
1458f9e35:     	jne	0x1458f9e4f <.text+0x58f8e4f>
1458f9e37:     	movaps	%xmm15, %xmm1
1458f9e3b:     	movss	-0x14(%r8), %xmm15
1458f9e41:     	mulss	%xmm9, %xmm15
1458f9e46:     	addss	%xmm15, %xmm6
1458f9e4b:     	movaps	%xmm1, %xmm15
1458f9e4f:     	movl	-0xc(%r8), %r9d
1458f9e53:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
1458f9e5a:     	je	0x1458f9e95 <.text+0x58f8e95>
1458f9e5c:     	cmpl	$0x5b9b, %r9d           # imm = 0x5B9B
1458f9e63:     	jne	0x1458f9e0d <.text+0x58f8e0d>
1458f9e65:     	addss	0x47a19a(%rip), %xmm11  # 0x145d74008
1458f9e6e:     	jmp	0x1458f9e0d <.text+0x58f8e0d>
1458f9e70:     	movaps	%xmm15, %xmm1
1458f9e74:     	movss	-0x14(%r8), %xmm15
1458f9e7a:     	mulss	%xmm9, %xmm15
1458f9e7f:     	addss	%xmm15, %xmm12
1458f9e84:     	movaps	%xmm1, %xmm15
1458f9e88:     	movl	-0xc(%r8), %r9d
1458f9e8c:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
1458f9e93:     	jne	0x1458f9e5c <.text+0x58f8e5c>
1458f9e95:     	addss	%xmm7, %xmm12
1458f9e9a:     	jmp	0x1458f9e0d <.text+0x58f8e0d>
1458f9e9f:     	movss	0xa0(%rbp), %xmm7
1458f9ea7:     	movss	-0x4(%rbp), %xmm9
1458f9ead:     	addss	%xmm9, %xmm7
1458f9eb2:     	mulss	%xmm8, %xmm7
1458f9eb7:     	movss	0x4734ad(%rip), %xmm2   # 0x145d6d36c
1458f9ebf:     	maxss	%xmm2, %xmm9
1458f9ec4:     	movaps	%xmm15, %xmm8
1458f9ec8:     	movaps	%xmm7, %xmm15
1458f9ecc:     	divss	%xmm9, %xmm15
1458f9ed1:     	mulss	%xmm7, %xmm13
1458f9ed6:     	addss	%xmm13, %xmm0
1458f9edb:     	addss	%xmm2, %xmm6
1458f9edf:     	xorl	%edx, %edx
1458f9ee1:     	ucomiss	%xmm2, %xmm5
1458f9ee4:     	movaps	%xmm2, %xmm9
1458f9ee8:     	divss	%xmm6, %xmm9
1458f9eed:     	movaps	%xmm7, %xmm6
1458f9ef0:     	movaps	%xmm4, %xmm7
1458f9ef3:     	subss	%xmm10, %xmm7
1458f9ef8:     	xorps	%xmm2, %xmm2
1458f9efb:     	maxss	%xmm2, %xmm7
1458f9eff:     	mulss	%xmm7, %xmm14
1458f9f04:     	movaps	%xmm4, %xmm7
1458f9f07:     	minss	%xmm10, %xmm7
1458f9f0c:     	movaps	%xmm7, %xmm10
1458f9f10:     	cmpunordss	%xmm7, %xmm10
1458f9f16:     	movaps	%xmm10, %xmm13
1458f9f1a:     	andnps	%xmm7, %xmm13
1458f9f1e:     	andps	%xmm4, %xmm10
1458f9f22:     	orps	%xmm13, %xmm10
1458f9f26:     	movaps	%xmm10, %xmm7
1458f9f2a:     	mulss	0xa4(%rbp), %xmm10
1458f9f33:     	divss	0x473714(%rip), %xmm10  # 0x145d6d650
1458f9f3c:     	addss	%xmm14, %xmm10
1458f9f41:     	addss	%xmm12, %xmm10
1458f9f46:     	movaps	%xmm6, %xmm4
1458f9f49:     	subss	0x478(%r12), %xmm4
1458f9f53:     	movss	%xmm6, 0x478(%r12)
1458f9f5d:     	movss	%xmm10, 0x47c(%r12)
1458f9f67:     	movss	%xmm9, 0x480(%r12)
1458f9f71:     	movss	0x479d9a(%rip), %xmm9   # 0x145d73d14
1458f9f7a:     	addss	%xmm9, %xmm15
1458f9f7f:     	addss	%xmm5, %xmm9
1458f9f84:     	addss	%xmm3, %xmm9
1458f9f89:     	movaps	0x666adf(%rip), %xmm10  # 0x145f60a70
1458f9f91:     	unpcklps	%xmm9, %xmm10           # xmm10 = xmm10[0],xmm9[0],xmm10[1],xmm9[1]
1458f9f95:     	unpcklps	%xmm3, %xmm5            # xmm5 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
1458f9f98:     	seta	%dl
1458f9f9b:     	movd	%edx, %xmm9
1458f9fa0:     	pshufd	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
1458f9fa6:     	pslld	$0x1f, %xmm9
1458f9fac:     	psrad	$0x1f, %xmm9
1458f9fb2:     	andps	%xmm9, %xmm10
1458f9fb6:     	andnps	%xmm5, %xmm9
1458f9fba:     	orps	%xmm10, %xmm9
1458f9fbe:     	movlps	%xmm9, 0x484(%r12)
1458f9fc7:     	minss	0x157e3b8(%rip), %xmm11 # 0x146e78388
1458f9fd0:     	movaps	%xmm11, %xmm5
1458f9fd4:     	movss	%xmm11, 0x48c(%r12)
1458f9fde:     	movaps	-0x30(%rbp), %xmm3
1458f9fe2:     	movss	%xmm3, 0x490(%r12)
1458f9fec:     	movaps	0x30(%rbp), %xmm3
1458f9ff0:     	movss	%xmm3, 0x494(%r12)
1458f9ffa:     	movss	%xmm7, 0x498(%r12)
1458fa004:     	movss	%xmm0, 0x49c(%r12)
1458fa00e:     	movaps	0x10(%rbp), %xmm0
1458fa012:     	movss	%xmm0, 0x4a0(%r12)
1458fa01c:     	movaps	-0x20(%rbp), %xmm0
1458fa020:     	movss	%xmm0, 0x4a4(%r12)
1458fa02a:     	movaps	0x50(%rbp), %xmm0
1458fa02e:     	movss	%xmm0, 0x4a8(%r12)
1458fa038:     	movl	%eax, 0x4ac(%r12)
1458fa040:     	movaps	(%rbp), %xmm0
1458fa044:     	movss	%xmm0, 0x4b0(%r12)
1458fa04e:     	movaps	0x20(%rbp), %xmm0
1458fa052:     	movss	%xmm0, 0x4b4(%r12)
1458fa05c:     	movss	%xmm8, 0x4b8(%r12)
1458fa066:     	movl	%ecx, 0x4bc(%r12)
1458fa06e:     	movaps	-0x40(%rbp), %xmm0
1458fa072:     	movss	%xmm0, 0x4c0(%r12)
1458fa07c:     	movss	%xmm15, 0x4c4(%r12)
1458fa086:     	ucomiss	%xmm2, %xmm4
1458fa089:     	movss	0x4e0(%r12), %xmm1
1458fa093:     	jbe	0x1458fa0a3 <.text+0x58f90a3>
1458fa095:     	addss	%xmm4, %xmm1
1458fa099:     	movss	%xmm1, 0x4e0(%r12)
1458fa0a3:     	movq	%r13, 0x90(%rbp)
1458fa0aa:     	movaps	%xmm1, %xmm2
1458fa0ad:     	minss	%xmm6, %xmm2
1458fa0b1:     	movaps	%xmm2, %xmm0
1458fa0b4:     	cmpunordss	%xmm2, %xmm0
1458fa0b9:     	movaps	%xmm0, %xmm4
1458fa0bc:     	andnps	%xmm2, %xmm4
1458fa0bf:     	andps	%xmm1, %xmm0
1458fa0c2:     	orps	%xmm4, %xmm0
1458fa0c5:     	movss	%xmm0, 0x4e0(%r12)
1458fa0cf:     	movaps	%xmm5, %xmm3
1458fa0d2:     	mulss	0x4c4566(%rip), %xmm3   # 0x145dbe640
1458fa0da:     	movaps	%xmm3, %xmm1
1458fa0dd:     	subss	0x54c(%r12), %xmm1
1458fa0e7:     	andps	0x4a0e52(%rip), %xmm1   # 0x145d9af40
1458fa0ee:     	ucomiss	0x4a0d9b(%rip), %xmm1   # 0x145d9ae90
1458fa0f5:     	jbe	0x1458fa18a <.text+0x58f918a>
1458fa0fb:     	movss	%xmm3, 0x54c(%r12)
1458fa105:     	movl	0x548(%r12), %r8d
1458fa10d:     	leal	0x1(%r8), %eax
1458fa111:     	movl	%eax, 0x548(%r12)
1458fa119:     	movq	0x460(%r12), %rdx
1458fa121:     	leaq	0x60(%rbp), %rcx
1458fa125:     	callq	0x1458ad310 <.text+0x58ac310>
1458fa12a:     	nop
1458fa12b:     	movq	0x5e0(%r12), %rsi
1458fa133:     	cmpq	0x5d0(%r12), %rsi
1458fa13b:     	jne	0x1458fa14b <.text+0x58f914b>
1458fa13d:     	leaq	0x5d0(%r12), %rcx
1458fa145:     	callq	0x145bcb530 <.text+0x5bca530>
1458fa14a:     	nop
1458fa14b:     	movq	0x5d8(%r12), %rax
1458fa153:     	movq	%rsi, %rcx
1458fa156:     	shlq	$0x5, %rcx
1458fa15a:     	movups	0x60(%rbp), %xmm0
1458fa15e:     	movups	0x70(%rbp), %xmm1
1458fa162:     	movups	%xmm1, 0x10(%rax,%rcx)
1458fa167:     	movups	%xmm0, (%rax,%rcx)
1458fa16b:     	incq	%rsi
1458fa16e:     	movq	%rsi, 0x5e0(%r12)
1458fa176:     	movss	0x478(%r12), %xmm6
1458fa180:     	movss	0x4e0(%r12), %xmm0
1458fa18a:     	xorps	%xmm7, %xmm7
1458fa18d:     	maxss	%xmm7, %xmm0
1458fa191:     	callq	0x145bc981d <.text+0x5bc881d>
1458fa196:     	cvttss2si	%xmm0, %rax
1458fa19b:     	xorl	%ecx, %ecx
1458fa19d:     	ucomiss	%xmm7, %xmm0
1458fa1a0:     	cmovbl	%ecx, %eax
1458fa1a3:     	ucomiss	0x4736ca(%rip), %xmm0   # 0x145d6d874
1458fa1aa:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1458fa1b0:     	cmovbel	%eax, %r8d
1458fa1b4:     	leaq	0x990(%r12), %rdi
1458fa1bc:     	movq	0x990(%r12), %rax
1458fa1c4:     	testq	%rax, %rax
1458fa1c7:     	je	0x1458fa237 <.text+0x58f9237>
1458fa1c9:     	movq	0x998(%r12), %rcx
1458fa1d1:     	movw	$0x16, %dx
1458fa1d5:     	movzwl	0x36(%rax), %r10d
1458fa1da:     	movl	%r10d, %r11d
1458fa1dd:     	addl	%r11d, %r11d
1458fa1e0:     	movq	$-0x1, %r9
1458fa1e7:     	nopw	(%rax,%rax)
1458fa1f0:     	testq	%r11, %r11
1458fa1f3:     	je	0x1458fa220 <.text+0x58f9220>
1458fa1f5:     	cmpw	0x3a(%rax,%r9,2), %dx
1458fa1fb:     	seta	%bl
1458fa1fe:     	sbbb	$0x0, %bl
1458fa201:     	incq	%r9
1458fa204:     	addq	$-0x2, %r11
1458fa208:     	cmpb	$0x1, %bl
1458fa20b:     	je	0x1458fa1f0 <.text+0x58f91f0>
1458fa20d:     	movzbl	%bl, %r10d
1458fa211:     	testl	%r10d, %r10d
1458fa214:     	je	0x1458fa230 <.text+0x58f9230>
1458fa216:     	jmp	0x1458fa223 <.text+0x58f9223>
1458fa218:     	nopl	(%rax,%rax)
1458fa220:     	movq	%r10, %r9
1458fa223:     	subq	$0x1, %rcx
1458fa227:     	jb	0x1458fa239 <.text+0x58f9239>
1458fa229:     	movq	0x50(%rax,%r9,8), %rax
1458fa22e:     	jmp	0x1458fa1d5 <.text+0x58f91d5>
1458fa230:     	movl	%r8d, 0x8(%rax,%r9,4)
1458fa235:     	jmp	0x1458fa266 <.text+0x58f9266>
1458fa237:     	xorl	%eax, %eax
1458fa239:     	movq	%rdi, 0x60(%rbp)
1458fa23d:     	movq	%rax, 0x68(%rbp)
1458fa241:     	movq	$0x0, 0x70(%rbp)
1458fa249:     	movq	%r9, 0x78(%rbp)
1458fa24d:     	movq	$0x16, 0x80(%rbp)
1458fa258:     	leaq	-0x60(%rbp), %rcx
1458fa25c:     	leaq	0x60(%rbp), %rdx
1458fa260:     	callq	0x1458e1710 <.text+0x58e0710>
1458fa265:     	nop
1458fa266:     	movaps	%xmm6, %xmm0
1458fa269:     	callq	0x145bc981d <.text+0x5bc881d>
1458fa26e:     	cvttss2si	%xmm0, %rax
1458fa273:     	xorl	%ecx, %ecx
1458fa275:     	xorps	%xmm1, %xmm1
1458fa278:     	ucomiss	%xmm1, %xmm0
1458fa27b:     	cmovbl	%ecx, %eax
1458fa27e:     	ucomiss	0x4735ef(%rip), %xmm0   # 0x145d6d874
1458fa285:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1458fa28b:     	cmovbel	%eax, %r8d
1458fa28f:     	movq	(%rdi), %rax
1458fa292:     	testq	%rax, %rax
1458fa295:     	je	0x1458fa307 <.text+0x58f9307>
1458fa297:     	movq	0x998(%r12), %rcx
1458fa29f:     	movw	$0x1c, %dx
1458fa2a3:     	movzwl	0x36(%rax), %r10d
1458fa2a8:     	movl	%r10d, %r11d
1458fa2ab:     	addl	%r11d, %r11d
1458fa2ae:     	movq	$-0x1, %r9
1458fa2b5:     	nopw	%cs:(%rax,%rax)
1458fa2c0:     	testq	%r11, %r11
1458fa2c3:     	je	0x1458fa2f0 <.text+0x58f92f0>
1458fa2c5:     	cmpw	0x3a(%rax,%r9,2), %dx
1458fa2cb:     	seta	%bl
1458fa2ce:     	sbbb	$0x0, %bl
1458fa2d1:     	incq	%r9
1458fa2d4:     	addq	$-0x2, %r11
1458fa2d8:     	cmpb	$0x1, %bl
1458fa2db:     	je	0x1458fa2c0 <.text+0x58f92c0>
1458fa2dd:     	movzbl	%bl, %r10d
1458fa2e1:     	testl	%r10d, %r10d
1458fa2e4:     	je	0x1458fa300 <.text+0x58f9300>
1458fa2e6:     	jmp	0x1458fa2f3 <.text+0x58f92f3>
1458fa2e8:     	nopl	(%rax,%rax)
1458fa2f0:     	movq	%r10, %r9
1458fa2f3:     	subq	$0x1, %rcx
1458fa2f7:     	jb	0x1458fa309 <.text+0x58f9309>
1458fa2f9:     	movq	0x50(%rax,%r9,8), %rax
1458fa2fe:     	jmp	0x1458fa2a3 <.text+0x58f92a3>
1458fa300:     	movl	%r8d, 0x8(%rax,%r9,4)
1458fa305:     	jmp	0x1458fa336 <.text+0x58f9336>
1458fa307:     	xorl	%eax, %eax
1458fa309:     	movq	%rdi, 0x60(%rbp)
1458fa30d:     	movq	%rax, 0x68(%rbp)
1458fa311:     	movq	$0x0, 0x70(%rbp)
1458fa319:     	movq	%r9, 0x78(%rbp)
1458fa31d:     	movq	$0x1c, 0x80(%rbp)
1458fa328:     	leaq	-0x60(%rbp), %rcx
1458fa32c:     	leaq	0x60(%rbp), %rdx
1458fa330:     	callq	0x1458e1710 <.text+0x58e0710>
1458fa335:     	nop
1458fa336:     	movss	0x484(%r12), %xmm0
1458fa340:     	mulss	0x473158(%rip), %xmm0   # 0x145d6d4a0
1458fa348:     	movq	0x990(%r12), %rax
1458fa350:     	testq	%rax, %rax
1458fa353:     	je	0x1458fa445 <.text+0x58f9445>
1458fa359:     	movq	0x998(%r12), %rsi
1458fa361:     	movl	$0x455, %edx            # imm = 0x455
1458fa366:     	movq	0x90(%rbp), %rcx
1458fa36d:     	movzwl	0x36(%rax), %r8d
1458fa372:     	movl	%r8d, %r10d
1458fa375:     	addl	%r10d, %r10d
1458fa378:     	movq	$-0x1, %r9
1458fa37f:     	nop
1458fa380:     	testq	%r10, %r10
1458fa383:     	je	0x1458fa3b0 <.text+0x58f93b0>
1458fa385:     	movzwl	0x3a(%rax,%r9,2), %r11d
1458fa38b:     	cmpl	%r11d, %edx
1458fa38e:     	seta	%r11b
1458fa392:     	sbbb	$0x0, %r11b
1458fa396:     	incq	%r9
1458fa399:     	addq	$-0x2, %r10
1458fa39d:     	cmpb	$0x1, %r11b
1458fa3a1:     	je	0x1458fa380 <.text+0x58f9380>
1458fa3a3:     	movzbl	%r11b, %r8d
1458fa3a7:     	testl	%r8d, %r8d
1458fa3aa:     	je	0x1458fa3c4 <.text+0x58f93c4>
1458fa3ac:     	jmp	0x1458fa3b3 <.text+0x58f93b3>
1458fa3ae:     	nop
1458fa3b0:     	movq	%r8, %r9
1458fa3b3:     	subq	$0x1, %rsi
1458fa3b7:     	jb	0x1458fa447 <.text+0x58f9447>
1458fa3bd:     	movq	0x50(%rax,%r9,8), %rax
1458fa3c2:     	jmp	0x1458fa36d <.text+0x58f936d>
1458fa3c4:     	movss	%xmm0, 0x8(%rax,%r9,4)
1458fa3cb:     	movq	0x48(%rbp), %rdx
1458fa3cf:     	testq	%rdx, %rdx
1458fa3d2:     	je	0x1458fa3e3 <.text+0x58f93e3>
1458fa3d4:     	shlq	$0x3, %rdx
1458fa3d8:     	movl	$0x4, %r8d
1458fa3de:     	callq	0x1400021d0 <.text+0x11d0>
1458fa3e3:     	movaps	0xb0(%rbp), %xmm6
1458fa3ea:     	movaps	0xc0(%rbp), %xmm7
1458fa3f1:     	movaps	0xd0(%rbp), %xmm8
1458fa3f9:     	movaps	0xe0(%rbp), %xmm9
1458fa401:     	movaps	0xf0(%rbp), %xmm10
1458fa409:     	movaps	0x100(%rbp), %xmm11
1458fa411:     	movaps	0x110(%rbp), %xmm12
1458fa419:     	movaps	0x120(%rbp), %xmm13
1458fa421:     	movaps	0x130(%rbp), %xmm14
1458fa429:     	movaps	0x140(%rbp), %xmm15
1458fa431:     	addq	$0x1d8, %rsp            # imm = 0x1D8
1458fa438:     	popq	%rbx
1458fa439:     	popq	%rdi
1458fa43a:     	popq	%rsi
1458fa43b:     	popq	%r12
1458fa43d:     	popq	%r13
1458fa43f:     	popq	%r14
1458fa441:     	popq	%r15
1458fa443:     	popq	%rbp
1458fa444:     	retq
1458fa445:     	xorl	%eax, %eax
1458fa447:     	movd	%xmm0, %r8d
1458fa44c:     	movq	%rdi, 0x60(%rbp)
1458fa450:     	movq	%rax, 0x68(%rbp)
1458fa454:     	movq	$0x0, 0x70(%rbp)
1458fa45c:     	movq	%r9, 0x78(%rbp)
1458fa460:     	movq	$0x455, 0x80(%rbp)      # imm = 0x455
1458fa46b:     	leaq	-0x60(%rbp), %rcx
1458fa46f:     	leaq	0x60(%rbp), %rdx
1458fa473:     	callq	0x1458e1710 <.text+0x58e0710>
1458fa478:     	nop
1458fa479:     	movq	0x90(%rbp), %rcx
1458fa480:     	movq	0x48(%rbp), %rdx
1458fa484:     	testq	%rdx, %rdx
1458fa487:     	jne	0x1458fa3d4 <.text+0x58f93d4>
1458fa48d:     	jmp	0x1458fa3e3 <.text+0x58f93e3>
1458fa492:     	addss	%xmm9, %xmm12
1458fa497:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa49c:     	addss	%xmm9, %xmm6
1458fa4a1:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa4a6:     	addss	%xmm9, %xmm8
1458fa4ab:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa4b0:     	movaps	0x90(%rbp), %xmm1
1458fa4b7:     	addss	%xmm9, %xmm1
1458fa4bc:     	movaps	%xmm1, 0x90(%rbp)
1458fa4c3:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa4c8:     	addss	%xmm9, %xmm7
1458fa4cd:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa4d2:     	movaps	%xmm4, %xmm2
1458fa4d5:     	movaps	%xmm3, %xmm1
1458fa4d8:     	movaps	%xmm12, %xmm3
1458fa4dc:     	movaps	%xmm7, %xmm12
1458fa4e0:     	movss	0x40(%r11), %xmm7
1458fa4e6:     	mulss	0x47674e(%rip), %xmm7   # 0x145d70c3c
1458fa4ee:     	movaps	%xmm15, %xmm5
1458fa4f2:     	movaps	%xmm8, %xmm15
1458fa4f6:     	movaps	%xmm6, %xmm8
1458fa4fa:     	movaps	%xmm10, %xmm6
1458fa4fe:     	movaps	%xmm9, %xmm10
1458fa502:     	minss	%xmm7, %xmm10
1458fa507:     	movaps	%xmm10, %xmm4
1458fa50b:     	cmpunordss	%xmm10, %xmm4
1458fa511:     	movaps	%xmm4, %xmm7
1458fa514:     	andnps	%xmm10, %xmm7
1458fa518:     	movaps	%xmm6, %xmm10
1458fa51c:     	movaps	%xmm8, %xmm6
1458fa520:     	movaps	%xmm15, %xmm8
1458fa524:     	movaps	%xmm5, %xmm15
1458fa528:     	andps	%xmm9, %xmm4
1458fa52c:     	orps	%xmm7, %xmm4
1458fa52f:     	movaps	%xmm12, %xmm7
1458fa533:     	movaps	%xmm3, %xmm12
1458fa537:     	movaps	%xmm1, %xmm3
1458fa53a:     	addss	%xmm2, %xmm4
1458fa53e:     	mulss	0x4a0985(%rip), %xmm9   # 0x145d9aecc
1458fa547:     	addss	%xmm9, %xmm8
1458fa54c:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa54e:     	addss	%xmm9, %xmm0
1458fa553:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa555:     	movaps	0x10(%rbp), %xmm2
1458fa559:     	addss	%xmm9, %xmm2
1458fa55e:     	movaps	%xmm2, 0x10(%rbp)
1458fa562:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa564:     	movaps	(%rbp), %xmm2
1458fa568:     	addss	%xmm9, %xmm2
1458fa56d:     	movaps	%xmm2, (%rbp)
1458fa571:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa573:     	addss	%xmm9, %xmm11
1458fa578:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa57a:     	addss	0x472de9(%rip), %xmm9   # 0x145d6d36c
1458fa583:     	mulss	%xmm9, %xmm13
1458fa588:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa58a:     	movaps	0x30(%rbp), %xmm2
1458fa58e:     	addss	%xmm9, %xmm2
1458fa593:     	movaps	%xmm2, 0x30(%rbp)
1458fa597:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa599:     	movaps	0x50(%rbp), %xmm1
1458fa59d:     	addss	%xmm9, %xmm1
1458fa5a2:     	movaps	%xmm1, 0x50(%rbp)
1458fa5a6:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa5a8:     	addss	%xmm9, %xmm10
1458fa5ad:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa5af:     	movaps	0x20(%rbp), %xmm2
1458fa5b3:     	addss	%xmm9, %xmm2
1458fa5b8:     	movaps	%xmm2, 0x20(%rbp)
1458fa5bc:     	nopl	(%rax)
1458fa5c0:     	addq	$0x18, %r9
1458fa5c4:     	cmpq	%r9, %r8
1458fa5c7:     	je	0x1458f9d4e <.text+0x58f8d4e>
1458fa5cd:     	movss	0x10(%rdx,%r9), %xmm9
1458fa5d4:     	movq	(%rdx,%r9), %r11
1458fa5d8:     	movzbl	0x44(%r11), %esi
1458fa5dd:     	movslq	(%r10,%rsi,4), %rsi
1458fa5e1:     	addq	%r10, %rsi
1458fa5e4:     	jmpq	*%rsi
1458fa5e6:     	addss	%xmm9, %xmm15
1458fa5eb:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa5ed:     	addss	%xmm9, %xmm3
1458fa5f2:     	jmp	0x1458fa5c0 <.text+0x58f95c0>
1458fa5f4:     	nopw	%cs:(%rax,%rax)
1458fa600:     	addq	$0x8, %rdx
1458fa604:     	cmpq	%rdx, %r15
1458fa607:     	je	0x1458fa622 <.text+0x58f9622>
1458fa609:     	movzbl	(%r13,%rdx), %r9d
1458fa60f:     	movslq	(%r8,%r9,4), %r9
1458fa613:     	addq	%r8, %r9
1458fa616:     	jmpq	*%r9
1458fa619:     	addss	0x4(%r13,%rdx), %xmm12
1458fa620:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa622:     	movaps	%xmm5, %xmm10
1458fa626:     	movaps	%xmm7, %xmm3
1458fa629:     	movaps	%xmm13, -0x30(%rbp)
1458fa62e:     	movaps	0x90(%rbp), %xmm5
1458fa635:     	movaps	%xmm9, 0x30(%rbp)
1458fa63a:     	movss	0x8c(%rbp), %xmm13
1458fa643:     	jmp	0x1458f9dd5 <.text+0x58f8dd5>
1458fa648:     	movss	0xa4(%rbp), %xmm1
1458fa650:     	addss	0x4(%r13,%rdx), %xmm1
1458fa657:     	movss	%xmm1, 0xa4(%rbp)
1458fa65f:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa661:     	addss	0x4(%r13,%rdx), %xmm15
1458fa668:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa66a:     	movaps	-0x20(%rbp), %xmm2
1458fa66e:     	addss	0x4(%r13,%rdx), %xmm2
1458fa675:     	movaps	%xmm2, -0x20(%rbp)
1458fa679:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa67b:     	addss	0x4(%r13,%rdx), %xmm4
1458fa682:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa687:     	movaps	(%rbp), %xmm2
1458fa68b:     	addss	0x4(%r13,%rdx), %xmm2
1458fa692:     	movaps	%xmm2, (%rbp)
1458fa696:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa69b:     	addss	0x4(%r13,%rdx), %xmm9
1458fa6a2:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa6a7:     	movaps	0x90(%rbp), %xmm1
1458fa6ae:     	addss	0x4(%r13,%rdx), %xmm1
1458fa6b5:     	movaps	%xmm1, 0x90(%rbp)
1458fa6bc:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa6c1:     	movss	0x8c(%rbp), %xmm1
1458fa6c9:     	addss	0x4(%r13,%rdx), %xmm1
1458fa6d0:     	movss	%xmm1, 0x8c(%rbp)
1458fa6d8:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa6dd:     	addss	0x4(%r13,%rdx), %xmm7
1458fa6e4:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa6e9:     	movaps	0x10(%rbp), %xmm2
1458fa6ed:     	addss	0x4(%r13,%rdx), %xmm2
1458fa6f4:     	movaps	%xmm2, 0x10(%rbp)
1458fa6f8:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa6fd:     	addss	0x4(%r13,%rdx), %xmm6
1458fa704:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa709:     	addss	0x4(%r13,%rdx), %xmm8
1458fa710:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa715:     	addss	0x4(%r13,%rdx), %xmm14
1458fa71c:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa721:     	addss	0x4(%r13,%rdx), %xmm0
1458fa728:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa72d:     	movaps	0x20(%rbp), %xmm2
1458fa731:     	addss	0x4(%r13,%rdx), %xmm2
1458fa738:     	movaps	%xmm2, 0x20(%rbp)
1458fa73c:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa741:     	addss	0x4(%r13,%rdx), %xmm11
1458fa748:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa74d:     	addss	0x4(%r13,%rdx), %xmm5
1458fa754:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa759:     	movaps	0x50(%rbp), %xmm1
1458fa75d:     	addss	0x4(%r13,%rdx), %xmm1
1458fa764:     	movaps	%xmm1, 0x50(%rbp)
1458fa768:     	jmp	0x1458fa600 <.text+0x58f9600>
1458fa76d:     	movaps	%xmm13, %xmm2
1458fa771:     	movss	0x4(%r13,%rdx), %xmm13
1458fa778:     	addss	0x472beb(%rip), %xmm13  # 0x145d6d36c
1458fa781:     	mulss	%xmm2, %xmm13
1458fa786:     	jmp	0x1458fa600 <.text+0x58f9600>
