
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a97df:     	cmpb	$0x0, 0x958(%r13)
1454a97e7:     	jne	0x1454aa103 <.text+0x54a9103>
1454a97ed:     	movq	0x590(%r13), %rcx
1454a97f4:     	testq	%rcx, %rcx
1454a97f7:     	je	0x1454a9de5 <.text+0x54a8de5>
1454a97fd:     	leaq	0x4c0(%r13), %rax
1454a9804:     	movq	%rax, 0x338(%rbp)
1454a980b:     	xorl	%r14d, %r14d
1454a980e:     	movss	0x441ce5(%rip), %xmm9   # 0x1458eb4fc
1454a9817:     	movss	0x4437f4(%rip), %xmm10  # 0x1458ed014
1454a9820:     	xorps	%xmm11, %xmm11
1454a9824:     	movq	%rcx, 0x348(%rbp)
1454a982b:     	jmp	0x1454a987c <.text+0x54a887c>
1454a982d:     	movq	0x540(%r13), %rax
1454a9834:     	movq	%rsi, %rcx
1454a9837:     	shlq	$0x5, %rcx
1454a983b:     	movups	0xa0(%rbp), %xmm0
1454a9842:     	movdqu	0xb0(%rbp), %xmm1
1454a984a:     	movdqu	%xmm1, 0x10(%rax,%rcx)
1454a9850:     	movups	%xmm0, (%rax,%rcx)
1454a9854:     	incq	%rsi
1454a9857:     	movq	%rsi, 0x548(%r13)
1454a985e:     	movq	0x348(%rbp), %rcx
1454a9865:     	nopw	%cs:(%rax,%rax)
1454a9870:     	incq	%r14
1454a9873:     	cmpq	%rcx, %r14
1454a9876:     	je	0x1454a9ddc <.text+0x54a8ddc>
1454a987c:     	movq	0x590(%r13), %rdx
1454a9883:     	cmpq	%rdx, %r14
1454a9886:     	jae	0x1454aabb8 <.text+0x54a9bb8>
1454a988c:     	movq	0x588(%r13), %rax
1454a9893:     	leaq	(%r14,%r14,4), %rdx
1454a9897:     	cmpq	$0x0, (%rax,%rdx,8)
1454a989c:     	jne	0x1454a9870 <.text+0x54a8870>
1454a989e:     	leaq	(%rax,%rdx,8), %rsi
1454a98a2:     	movss	0x8e4(%r13), %xmm0
1454a98ab:     	ucomiss	0x24(%rsi), %xmm0
1454a98af:     	jb	0x1454a9870 <.text+0x54a8870>
1454a98b1:     	movq	0x210(%r13), %rcx
1454a98b8:     	movq	0x218(%r13), %rdx
1454a98bf:     	callq	0x14540e820 <.text+0x540d820>
1454a98c4:     	imulq	$0xf0, %rax, %rax
1454a98cb:     	movl	0x20(%rsi), %ecx
1454a98ce:     	movl	%ecx, 0x40(%rbp)
1454a98d1:     	movq	0x18(%rsi), %rcx
1454a98d5:     	movq	%rcx, 0x38(%rbp)
1454a98d9:     	movq	0x10(%rsi), %rdi
1454a98dd:     	movq	0x80(%rax,%r12), %rdx
1454a98e5:     	cmpq	%rdx, %rdi
1454a98e8:     	jae	0x1454aaccd <.text+0x54a9ccd>
1454a98ee:     	movq	%r13, %rsi
1454a98f1:     	addq	%r12, %rax
1454a98f4:     	movq	0x78(%rax), %r13
1454a98f8:     	leaq	(%rdi,%rdi,4), %rbx
1454a98fc:     	shlq	$0x4, %rbx
1454a9900:     	leaq	(%rbx,%r13), %rax
1454a9904:     	movq	%rax, 0x358(%rbp)
1454a990b:     	movq	%rsi, %rcx
1454a990e:     	movq	%rdi, %rdx
1454a9911:     	callq	0x1454ef9f0 <.text+0x54ee9f0>
1454a9916:     	movaps	%xmm0, %xmm6
1454a9919:     	movq	%rsi, %rcx
1454a991c:     	movq	%rdi, %rdx
1454a991f:     	callq	0x1454efdf0 <.text+0x54eedf0>
1454a9924:     	movaps	%xmm0, %xmm7
1454a9927:     	movss	0x28(%r13,%rbx), %xmm13
1454a992e:     	mulss	0x1500b19(%rip), %xmm13 # 0x1469aa450
1454a9937:     	movl	0x20(%r13,%rbx), %r8d
1454a993c:     	movl	0x904(%rsi), %r15d
1454a9943:     	incl	%r15d
1454a9946:     	movl	%r15d, 0x904(%rsi)
1454a994d:     	movl	%r8d, %eax
1454a9950:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454a9955:     	shlq	$0x18, %rax
1454a9959:     	andl	$0xffffff, %r15d        # imm = 0xFFFFFF
1454a9960:     	orq	%rax, %r15
1454a9963:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454a996d:     	orq	%rax, %r15
1454a9970:     	movl	0x24(%r13,%rbx), %r9d
1454a9975:     	leaq	0x38(%rbp), %rax
1454a9979:     	movq	%rax, 0x38(%rsp)
1454a997e:     	movss	%xmm6, 0x28(%rsp)
1454a9984:     	movss	%xmm13, 0x20(%rsp)
1454a998b:     	movb	$0x1, 0x30(%rsp)
1454a9990:     	movq	%rsi, %rcx
1454a9993:     	movq	%r15, %rdx
1454a9996:     	callq	0x1454c0820 <.text+0x54bf820>
1454a999b:     	movss	0x8e4(%rsi), %xmm14
1454a99a4:     	movss	0x38(%r13,%rbx), %xmm15
1454a99ab:     	movss	0x3c(%r13,%rbx), %xmm8
1454a99b2:     	movzbl	0x4c(%r13,%rbx), %ebx
1454a99b8:     	movzwl	0x236(%rsi), %edi
1454a99bf:     	movq	0x880(%rsi), %r8
1454a99c6:     	movq	0x898(%rsi), %rdx
1454a99cd:     	movq	0x888(%rsi), %rcx
1454a99d4:     	movq	0x890(%rsi), %rax
1454a99db:     	movq	%rsi, %r13
1454a99de:     	nop
1454a99e0:     	leaq	(%r8,%rdx), %r9
1454a99e4:     	rolq	$0x17, %r9
1454a99e8:     	addq	%r8, %r9
1454a99eb:     	movq	%rcx, %r10
1454a99ee:     	shlq	$0x11, %r10
1454a99f2:     	xorq	%r8, %rax
1454a99f5:     	xorq	%rcx, %rdx
1454a99f8:     	xorq	%rax, %rcx
1454a99fb:     	xorq	%rdx, %r8
1454a99fe:     	rolq	$0x2d, %rdx
1454a9a02:     	xorq	%r10, %rax
1454a9a05:     	shrq	$0x29, %r9
1454a9a09:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454a9a10:     	movd	%r9d, %xmm12
1454a9a15:     	addss	%xmm9, %xmm12
1454a9a1a:     	mulss	%xmm10, %xmm12
1454a9a1f:     	ucomiss	%xmm12, %xmm10
1454a9a23:     	jbe	0x1454a99e0 <.text+0x54a89e0>
1454a9a25:     	movq	%r8, 0x880(%r13)
1454a9a2c:     	movq	%rdx, 0x898(%r13)
1454a9a33:     	movq	%rcx, 0x888(%r13)
1454a9a3a:     	movq	%rax, 0x890(%r13)
1454a9a41:     	callq	0x140002200 <.text+0x1200>
1454a9a46:     	movl	$0xc, %ecx
1454a9a4b:     	movl	$0x4, %edx
1454a9a50:     	callq	0x1400021c0 <.text+0x11c0>
1454a9a55:     	testq	%rax, %rax
1454a9a58:     	je	0x1454aacef <.text+0x54a9cef>
1454a9a5e:     	xorps	%xmm0, %xmm0
1454a9a61:     	addss	%xmm0, %xmm12
1454a9a66:     	movzwl	%di, %ecx
1454a9a69:     	xorps	%xmm0, %xmm0
1454a9a6c:     	cvtsi2ss	%ecx, %xmm0
1454a9a70:     	divss	0x441ab4(%rip), %xmm0   # 0x1458eb52c
1454a9a78:     	mulss	%xmm0, %xmm8
1454a9a7d:     	movaps	%xmm13, %xmm1
1454a9a81:     	mulss	0x453363(%rip), %xmm1   # 0x1458fcdec
1454a9a89:     	addss	0x567c47(%rip), %xmm1   # 0x145a116d8
1454a9a91:     	movaps	%xmm15, %xmm0
1454a9a95:     	mulss	0x4419eb(%rip), %xmm0   # 0x1458eb488
1454a9a9d:     	movq	0x15009bb(%rip), %xmm2  # 0x1469aa460
1454a9aa5:     	movq	%xmm2, (%rax)
1454a9aa9:     	movl	$0x41000000, 0x8(%rax)  # imm = 0x41000000
1454a9ab0:     	movq	$0x0, 0xa0(%rbp)
1454a9abb:     	movq	$0x8, 0xa8(%rbp)
1454a9ac6:     	movq	$0x0, 0xb0(%rbp)
1454a9ad1:     	movq	$-0x1, 0xb8(%rbp)
1454a9adc:     	movq	$0x3, 0xe0(%rbp)
1454a9ae7:     	movq	%rax, 0xe8(%rbp)
1454a9aee:     	movq	$0x3, 0xf0(%rbp)
1454a9af9:     	movq	%r14, 0xf8(%rbp)
1454a9b00:     	movb	$0x0, 0x100(%rbp)
1454a9b07:     	movl	$0x0, 0x108(%rbp)
1454a9b11:     	movl	$0x0, 0x110(%rbp)
1454a9b1b:     	movl	$0x0, 0x118(%rbp)
1454a9b25:     	movq	%r15, 0x128(%rbp)
1454a9b2c:     	movq	0x358(%rbp), %rax
1454a9b33:     	movq	%rax, 0x130(%rbp)
1454a9b3a:     	leaq	0x138(%rbp), %rcx
1454a9b41:     	movups	%xmm11, 0x40(%rcx)
1454a9b46:     	movups	%xmm11, 0x30(%rcx)
1454a9b4b:     	movups	%xmm11, 0x20(%rcx)
1454a9b50:     	movups	%xmm11, 0x10(%rcx)
1454a9b55:     	movups	%xmm11, (%rcx)
1454a9b59:     	movq	$0x0, 0x50(%rcx)
1454a9b61:     	movss	%xmm6, 0x190(%rbp)
1454a9b69:     	movss	%xmm6, 0x194(%rbp)
1454a9b71:     	movss	%xmm7, 0x198(%rbp)
1454a9b79:     	movss	%xmm8, 0x19c(%rbp)
1454a9b82:     	movss	%xmm15, 0x1a0(%rbp)
1454a9b8b:     	movss	%xmm1, 0x1a4(%rbp)
1454a9b93:     	movss	%xmm13, 0x1a8(%rbp)
1454a9b9c:     	movl	0x40(%rbp), %eax
1454a9b9f:     	movl	%eax, 0x7c(%rcx)
1454a9ba2:     	movq	0x38(%rbp), %rax
1454a9ba6:     	movq	%rax, 0x74(%rcx)
1454a9baa:     	movl	0x40(%rbp), %eax
1454a9bad:     	movl	%eax, 0x88(%rcx)
1454a9bb3:     	movq	0x38(%rbp), %rax
1454a9bb7:     	movq	%rax, 0x80(%rcx)
1454a9bbe:     	xorps	%xmm1, %xmm1
1454a9bc1:     	movss	%xmm14, %xmm1           # xmm1 = xmm14[0],xmm1[1,2,3]
1454a9bc6:     	movlps	%xmm1, 0x1c4(%rbp)
1454a9bcd:     	movss	%xmm14, 0x1cc(%rbp)
1454a9bd6:     	movss	%xmm0, 0x1d0(%rbp)
1454a9bde:     	movups	%xmm11, 0xac(%rcx)
1454a9be6:     	movups	%xmm11, 0x9c(%rcx)
1454a9bee:     	movss	%xmm12, 0x1f4(%rbp)
1454a9bf7:     	movb	%bl, 0x1f8(%rbp)
1454a9bfd:     	movq	0x4d0(%r13), %rdi
1454a9c04:     	cmpq	0x4c0(%r13), %rdi
1454a9c0b:     	jne	0x1454a9c1a <.text+0x54a8c1a>
1454a9c0d:     	movq	0x338(%rbp), %rcx
1454a9c14:     	callq	0x14580b6b0 <.text+0x580a6b0>
1454a9c19:     	nop
1454a9c1a:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454a9c21:     	addq	0x4c8(%r13), %rcx
1454a9c28:     	movl	$0x160, %r8d            # imm = 0x160
1454a9c2e:     	leaq	0xa0(%rbp), %rdx
1454a9c35:     	callq	0x145756ddd <.text+0x5755ddd>
1454a9c3a:     	incq	%rdi
1454a9c3d:     	movq	%rdi, 0x4d0(%r13)
1454a9c44:     	movq	0x590(%r13), %rdx
1454a9c4b:     	cmpq	%rdx, %r14
1454a9c4e:     	jae	0x1454aacde <.text+0x54a9cde>
1454a9c54:     	movq	0x588(%r13), %rax
1454a9c5b:     	leaq	(%r14,%r14,4), %rsi
1454a9c5f:     	movq	$0x1, (%rax,%rsi,8)
1454a9c67:     	movq	%r15, 0x8(%rax,%rsi,8)
1454a9c6c:     	movq	$0x0, (%r13)
1454a9c74:     	movss	0x8e4(%r13), %xmm0
1454a9c7d:     	ucomiss	0x51dfcc(%rip), %xmm0   # 0x1459c7c50
1454a9c84:     	movq	0x348(%rbp), %rcx
1454a9c8b:     	jbe	0x1454a9870 <.text+0x54a8870>
1454a9c91:     	movq	0x210(%r13), %rcx
1454a9c98:     	movq	0x218(%r13), %rdx
1454a9c9f:     	callq	0x14540e820 <.text+0x540d820>
1454a9ca4:     	movq	0x590(%r13), %rdx
1454a9cab:     	cmpq	%rdx, %r14
1454a9cae:     	jae	0x1454aae47 <.text+0x54a9e47>
1454a9cb4:     	imulq	$0xf0, %rax, %rax
1454a9cbb:     	addq	%r12, %rax
1454a9cbe:     	movq	0x588(%r13), %rcx
1454a9cc5:     	movq	0x10(%rcx,%rsi,8), %rcx
1454a9cca:     	movq	0x80(%rax), %rdx
1454a9cd1:     	cmpq	%rdx, %rcx
1454a9cd4:     	jae	0x1454aae58 <.text+0x54a9e58>
1454a9cda:     	movq	0x78(%rax), %rsi
1454a9cde:     	leaq	(%rcx,%rcx,4), %rdi
1454a9ce2:     	shlq	$0x4, %rdi
1454a9ce6:     	leaq	(%rsi,%rdi), %rax
1454a9cea:     	addq	$0x20, %rax
1454a9cee:     	movq	%rax, 0x230(%rbp)
1454a9cf5:     	leaq	0x274344(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9cfc:     	movq	%rax, 0x238(%rbp)
1454a9d03:     	leaq	0xa0(%rbp), %rcx
1454a9d0a:     	leaq	0x1264c55(%rip), %rdx   # 0x14670e966
1454a9d11:     	leaq	0x230(%rbp), %r8
1454a9d18:     	callq	0x14570bf80 <.text+0x570af80>
1454a9d1d:     	movq	0xa8(%rbp), %rcx
1454a9d24:     	movq	0xb0(%rbp), %rdx
1454a9d2b:     	movq	0x10(%rsi,%rdi), %rbx
1454a9d30:     	movq	0x18(%rsi,%rdi), %r13
1454a9d35:     	movq	%rcx, 0x358(%rbp)
1454a9d3c:     	callq	0x145452400 <.text+0x5451400>
1454a9d41:     	nop
1454a9d42:     	movq	%rax, %rdi
1454a9d45:     	movq	%rdx, %r15
1454a9d48:     	movq	0xa0(%rbp), %rdx
1454a9d4f:     	testq	%rdx, %rdx
1454a9d52:     	je	0x1454a9d66 <.text+0x54a8d66>
1454a9d54:     	movl	$0x1, %r8d
1454a9d5a:     	movq	0x358(%rbp), %rcx
1454a9d61:     	callq	0x1400021d0 <.text+0x11d0>
1454a9d66:     	testq	%rdi, %rdi
1454a9d69:     	cmovneq	%rdi, %rbx
1454a9d6d:     	cmoveq	%r13, %r15
1454a9d71:     	movl	$0x1d, %edx
1454a9d76:     	leaq	0x1502aab(%rip), %rsi   # 0x1469ac828
1454a9d7d:     	movq	%rsi, %rcx
1454a9d80:     	callq	0x145452400 <.text+0x5451400>
1454a9d85:     	testq	%rax, %rax
1454a9d88:     	cmoveq	%rsi, %rax
1454a9d8c:     	movl	$0x1d, %ecx
1454a9d91:     	cmoveq	%rcx, %rdx
1454a9d95:     	movq	%rdx, 0x20(%rsp)
1454a9d9a:     	leaq	0xa0(%rbp), %rcx
1454a9da1:     	movq	%rbx, %rdx
1454a9da4:     	movq	%r15, %r8
1454a9da7:     	movq	%rax, %r9
1454a9daa:     	callq	0x14543f640 <.text+0x543e640>
1454a9daf:     	movq	0x368(%rbp), %r13
1454a9db6:     	movq	0x548(%r13), %rsi
1454a9dbd:     	cmpq	0x538(%r13), %rsi
1454a9dc4:     	jne	0x1454a982d <.text+0x54a882d>
1454a9dca:     	movq	0x340(%rbp), %rcx
1454a9dd1:     	callq	0x1457580b0 <.text+0x57570b0>
1454a9dd6:     	nop
1454a9dd7:     	jmp	0x1454a982d <.text+0x54a882d>
