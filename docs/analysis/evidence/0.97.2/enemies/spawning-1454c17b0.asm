
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c17b0:     	pushq	%r15
1454c17b2:     	pushq	%r14
1454c17b4:     	pushq	%r13
1454c17b6:     	pushq	%r12
1454c17b8:     	pushq	%rsi
1454c17b9:     	pushq	%rdi
1454c17ba:     	pushq	%rbp
1454c17bb:     	pushq	%rbx
1454c17bc:     	subq	$0xf8, %rsp
1454c17c3:     	movaps	%xmm15, 0xe0(%rsp)
1454c17cc:     	movaps	%xmm14, 0xd0(%rsp)
1454c17d5:     	movaps	%xmm13, 0xc0(%rsp)
1454c17de:     	movaps	%xmm12, 0xb0(%rsp)
1454c17e7:     	movaps	%xmm11, 0xa0(%rsp)
1454c17f0:     	movaps	%xmm10, 0x90(%rsp)
1454c17f9:     	movaps	%xmm9, 0x80(%rsp)
1454c1802:     	movaps	%xmm8, 0x70(%rsp)
1454c1808:     	movaps	%xmm7, 0x60(%rsp)
1454c180d:     	movaps	%xmm6, 0x50(%rsp)
1454c1812:     	movss	%xmm3, 0x28(%rsp)
1454c1818:     	movss	%xmm2, 0x24(%rsp)
1454c181e:     	movq	%rdx, %rdi
1454c1821:     	movq	%rcx, 0x38(%rsp)
1454c1826:     	movss	0x160(%rsp), %xmm0
1454c182f:     	movss	%xmm0, 0x34(%rsp)
1454c1835:     	movsd	0x8a8(%rdx), %xmm1
1454c183d:     	movaps	%xmm1, %xmm0
1454c1840:     	mulps	%xmm1, %xmm0
1454c1843:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454c1847:     	addss	%xmm0, %xmm2
1454c184b:     	movaps	%xmm2, 0x40(%rsp)
1454c1850:     	ucomiss	0x429ca1(%rip), %xmm2   # 0x1458eb4f8
1454c1857:     	jbe	0x1454c1868 <.text+0x54c0868>
1454c1859:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454c185d:     	callq	0x145756e37 <.text+0x5755e37>
1454c1862:     	movss	%xmm0, 0x30(%rsp)
1454c1868:     	movss	0x429c8b(%rip), %xmm8   # 0x1458eb4fc
1454c1871:     	movss	0x43b56f(%rip), %xmm2   # 0x1458fcde8
1454c1879:     	movss	0x14e8b7f(%rip), %xmm3  # 0x1469aa400
1454c1881:     	movss	0x43b563(%rip), %xmm4   # 0x1458fcdec
1454c1889:     	movss	0x429c6e(%rip), %xmm15  # 0x1458eb500
1454c1892:     	leaq	0x1254b9f(%rip), %rbp   # 0x146716438
1454c1899:     	movss	0x42b773(%rip), %xmm7   # 0x1458ed014
1454c18a1:     	xorl	%r13d, %r13d
1454c18a4:     	jmp	0x1454c18d5 <.text+0x54c08d5>
1454c18a6:     	nopw	%cs:(%rax,%rax)
1454c18b0:     	incl	%r13d
1454c18b3:     	cmpl	$0x10, %r13d
1454c18b7:     	movss	0x43b529(%rip), %xmm2   # 0x1458fcde8
1454c18bf:     	movss	0x14e8b39(%rip), %xmm3  # 0x1469aa400
1454c18c7:     	movss	0x43b51d(%rip), %xmm4   # 0x1458fcdec
1454c18cf:     	je	0x1454c1f9e <.text+0x54c0f9e>
1454c18d5:     	movaps	0x40(%rsp), %xmm0
1454c18da:     	ucomiss	0x429c17(%rip), %xmm0   # 0x1458eb4f8
1454c18e1:     	movq	0x880(%rdi), %rdx
1454c18e8:     	movq	0x888(%rdi), %rax
1454c18ef:     	movq	0x898(%rdi), %r8
1454c18f6:     	movq	0x890(%rdi), %rcx
1454c18fd:     	jbe	0x1454c19c0 <.text+0x54c09c0>
1454c1903:     	leaq	(%r8,%rdx), %r9
1454c1907:     	rolq	$0x17, %r9
1454c190b:     	addq	%rdx, %r9
1454c190e:     	movq	%rax, %r10
1454c1911:     	shlq	$0x11, %r10
1454c1915:     	xorq	%rdx, %rcx
1454c1918:     	xorq	%rax, %r8
1454c191b:     	xorq	%rcx, %rax
1454c191e:     	xorq	%r8, %rdx
1454c1921:     	rolq	$0x2d, %r8
1454c1925:     	shrq	$0x28, %r9
1454c1929:     	xorps	%xmm0, %xmm0
1454c192c:     	cvtsi2ss	%r9d, %xmm0
1454c1931:     	xorq	%r10, %rcx
1454c1934:     	mulss	0x529a84(%rip), %xmm0   # 0x1459eb3c0
1454c193c:     	movss	0x34(%rsp), %xmm1
1454c1942:     	ucomiss	%xmm0, %xmm1
1454c1945:     	jbe	0x1454c19c0 <.text+0x54c09c0>
1454c1947:     	nopw	(%rax,%rax)
1454c1950:     	leaq	(%rdx,%r8), %r9
1454c1954:     	rolq	$0x17, %r9
1454c1958:     	addq	%rdx, %r9
1454c195b:     	movq	%rax, %r10
1454c195e:     	shlq	$0x11, %r10
1454c1962:     	xorq	%rdx, %rcx
1454c1965:     	xorq	%rax, %r8
1454c1968:     	xorq	%rcx, %rax
1454c196b:     	xorq	%r8, %rdx
1454c196e:     	xorq	%r10, %rcx
1454c1971:     	rolq	$0x2d, %r8
1454c1975:     	shrq	$0x29, %r9
1454c1979:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454c1980:     	movd	%r9d, %xmm11
1454c1985:     	addss	%xmm8, %xmm11
1454c198a:     	mulss	%xmm2, %xmm11
1454c198f:     	addss	%xmm3, %xmm11
1454c1994:     	ucomiss	%xmm11, %xmm4
1454c1998:     	jbe	0x1454c1950 <.text+0x54c0950>
1454c199a:     	movq	%rdx, 0x880(%rdi)
1454c19a1:     	movq	%r8, 0x898(%rdi)
1454c19a8:     	movq	%rax, 0x888(%rdi)
1454c19af:     	movq	%rcx, 0x890(%rdi)
1454c19b6:     	addss	0x30(%rsp), %xmm11
1454c19bd:     	jmp	0x1454c1a29 <.text+0x54c0a29>
1454c19bf:     	nop
1454c19c0:     	leaq	(%rdx,%r8), %r9
1454c19c4:     	rolq	$0x17, %r9
1454c19c8:     	addq	%rdx, %r9
1454c19cb:     	movq	%rax, %r10
1454c19ce:     	shlq	$0x11, %r10
1454c19d2:     	xorq	%rdx, %rcx
1454c19d5:     	xorq	%rax, %r8
1454c19d8:     	xorq	%rcx, %rax
1454c19db:     	xorq	%r8, %rdx
1454c19de:     	rolq	$0x2d, %r8
1454c19e2:     	xorq	%r10, %rcx
1454c19e5:     	shrq	$0x29, %r9
1454c19e9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454c19f0:     	movd	%r9d, %xmm11
1454c19f5:     	addss	%xmm8, %xmm11
1454c19fa:     	mulss	%xmm7, %xmm11
1454c19ff:     	ucomiss	%xmm11, %xmm7
1454c1a03:     	jbe	0x1454c19c0 <.text+0x54c09c0>
1454c1a05:     	xorps	%xmm0, %xmm0
1454c1a08:     	addss	%xmm0, %xmm11
1454c1a0d:     	movq	%rdx, 0x880(%rdi)
1454c1a14:     	movq	%r8, 0x898(%rdi)
1454c1a1b:     	movq	%rax, 0x888(%rdi)
1454c1a22:     	movq	%rcx, 0x890(%rdi)
1454c1a29:     	leaq	0x880(%rdi), %rcx
1454c1a30:     	movss	0x24(%rsp), %xmm1
1454c1a36:     	movss	0x28(%rsp), %xmm2
1454c1a3c:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454c1a41:     	ucomiss	%xmm15, %xmm0
1454c1a45:     	jb	0x1454c18b0 <.text+0x54c08b0>
1454c1a4b:     	movaps	%xmm0, %xmm9
1454c1a4f:     	movsd	0x3e8(%rdi), %xmm6
1454c1a57:     	movaps	%xmm11, %xmm0
1454c1a5b:     	callq	0x145756e31 <.text+0x5755e31>
1454c1a60:     	movaps	%xmm0, %xmm10
1454c1a64:     	movaps	%xmm11, %xmm0
1454c1a68:     	callq	0x145756e2b <.text+0x5755e2b>
1454c1a6d:     	movq	0x210(%rdi), %r14
1454c1a74:     	movq	0x218(%rdi), %r15
1454c1a7b:     	movss	0x3f0(%rdi), %xmm1
1454c1a83:     	movss	%xmm1, 0x2c(%rsp)
1454c1a89:     	movq	0x878(%rdi), %rbx
1454c1a90:     	movq	0x8a0(%rdi), %rsi
1454c1a97:     	unpcklps	%xmm0, %xmm10           # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
1454c1a9b:     	testq	%rsi, %rsi
1454c1a9e:     	jne	0x1454c1ac3 <.text+0x54c0ac3>
1454c1aa0:     	jmp	0x1454c1da3 <.text+0x54c0da3>
1454c1aa5:     	nopw	%cs:(%rax,%rax)
1454c1ab0:     	addss	0x43b22f(%rip), %xmm9   # 0x1458fcce8
1454c1ab9:     	ucomiss	%xmm15, %xmm9
1454c1abd:     	jb	0x1454c18b0 <.text+0x54c08b0>
1454c1ac3:     	movsldup	%xmm9, %xmm11           # xmm11 = xmm9[0,0,2,2]
1454c1ac8:     	mulps	%xmm10, %xmm11
1454c1acc:     	addps	%xmm6, %xmm11
1454c1ad0:     	movshdup	%xmm11, %xmm12          # xmm12 = xmm11[1,1,3,3]
1454c1ad5:     	movq	%r14, %rcx
1454c1ad8:     	movq	%r15, %rdx
1454c1adb:     	callq	0x14540e820 <.text+0x540d820>
1454c1ae0:     	imulq	$0xf0, %rax, %r12
1454c1ae7:     	movss	0xc8(%r12,%rbp), %xmm1
1454c1af1:     	movaps	%xmm11, %xmm0
1454c1af5:     	subss	%xmm1, %xmm0
1454c1af9:     	movss	0xcc(%r12,%rbp), %xmm2
1454c1b03:     	movaps	%xmm12, %xmm1
1454c1b07:     	subss	%xmm2, %xmm1
1454c1b0b:     	callq	0x145756e67 <.text+0x5755e67>
1454c1b10:     	movaps	%xmm0, %xmm13
1454c1b14:     	movss	0xd8(%r12,%rbp), %xmm14
1454c1b1e:     	movaps	%xmm14, %xmm0
1454c1b22:     	addss	0x437466(%rip), %xmm0   # 0x1458f8f90
1454c1b2a:     	ucomiss	%xmm0, %xmm13
1454c1b2e:     	ja	0x1454c1ab0 <.text+0x54c0ab0>
1454c1b30:     	leaq	0x10(%rbx), %rcx
1454c1b34:     	movaps	%xmm11, %xmm1
1454c1b38:     	movaps	%xmm12, %xmm2
1454c1b3c:     	callq	0x1454627f0 <.text+0x54617f0>
1454c1b41:     	testb	$0x1, %al
1454c1b43:     	je	0x1454c1ab0 <.text+0x54c0ab0>
1454c1b49:     	xorl	%eax, %eax
1454c1b4b:     	ucomiss	%xmm14, %xmm13
1454c1b4f:     	seta	%al
1454c1b52:     	movaps	%xmm0, %xmm1
1454c1b55:     	subss	0x2c(%rsp), %xmm1
1454c1b5b:     	andps	0x4493ce(%rip), %xmm1   # 0x14590af30
1454c1b62:     	leaq	0x14e889f(%rip), %rcx   # 0x1469aa408
1454c1b69:     	ucomiss	(%rcx,%rax,4), %xmm1
1454c1b6d:     	ja	0x1454c1ab0 <.text+0x54c0ab0>
1454c1b73:     	cmpq	$-0x1, 0x40(%rbx)
1454c1b78:     	je	0x1454c1f2d <.text+0x54c0f2d>
1454c1b7e:     	movsd	0x60(%rbx), %xmm2
1454c1b83:     	movaps	%xmm11, %xmm1
1454c1b87:     	subps	%xmm2, %xmm1
1454c1b8a:     	movaps	%xmm1, %xmm2
1454c1b8d:     	xorps	%xmm3, %xmm3
1454c1b90:     	cmpltps	%xmm3, %xmm2
1454c1b94:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454c1b97:     	movmskpd	%xmm2, %eax
1454c1b9b:     	testl	%eax, %eax
1454c1b9d:     	jne	0x1454c1c58 <.text+0x54c0c58>
1454c1ba3:     	movaps	%xmm1, %xmm2
1454c1ba6:     	movss	0x429632(%rip), %xmm3   # 0x1458eb1e0
1454c1bae:     	subss	%xmm3, %xmm2
1454c1bb2:     	cvttss2si	%xmm2, %rcx
1454c1bb7:     	cvttss2si	%xmm1, %rdx
1454c1bbc:     	movq	%rdx, %rax
1454c1bbf:     	sarq	$0x3f, %rax
1454c1bc3:     	andq	%rcx, %rax
1454c1bc6:     	orq	%rdx, %rax
1454c1bc9:     	xorps	%xmm4, %xmm4
1454c1bcc:     	ucomiss	%xmm4, %xmm1
1454c1bcf:     	movl	$0x0, %r9d
1454c1bd5:     	cmovbq	%r9, %rax
1454c1bd9:     	movss	0x429603(%rip), %xmm5   # 0x1458eb1e4
1454c1be1:     	ucomiss	%xmm5, %xmm1
1454c1be4:     	movq	$-0x1, %r10
1454c1beb:     	cmovaq	%r10, %rax
1454c1bef:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454c1bf3:     	movaps	%xmm1, %xmm2
1454c1bf6:     	subss	%xmm3, %xmm2
1454c1bfa:     	cvttss2si	%xmm2, %rcx
1454c1bff:     	cvttss2si	%xmm1, %r8
1454c1c04:     	movq	%r8, %rdx
1454c1c07:     	sarq	$0x3f, %rdx
1454c1c0b:     	andq	%rcx, %rdx
1454c1c0e:     	orq	%r8, %rdx
1454c1c11:     	ucomiss	%xmm4, %xmm1
1454c1c14:     	cmovbq	%r9, %rdx
1454c1c18:     	ucomiss	%xmm5, %xmm1
1454c1c1b:     	cmovaq	%r10, %rdx
1454c1c1f:     	movq	0x58(%rbx), %rcx
1454c1c23:     	cmpq	%rcx, %rax
1454c1c26:     	setae	%r8b
1454c1c2a:     	cmpq	%rcx, %rdx
1454c1c2d:     	setae	%r9b
1454c1c31:     	orb	%r8b, %r9b
1454c1c34:     	jne	0x1454c1c58 <.text+0x54c0c58>
1454c1c36:     	imulq	%rdx, %rcx
1454c1c3a:     	addq	%rax, %rcx
1454c1c3d:     	movq	0x50(%rbx), %rdx
1454c1c41:     	cmpq	%rdx, %rcx
1454c1c44:     	jae	0x1454c2019 <.text+0x54c1019>
1454c1c4a:     	movq	0x48(%rbx), %rax
1454c1c4e:     	cmpb	$0x0, (%rax,%rcx)
1454c1c52:     	jne	0x1454c1ab0 <.text+0x54c0ab0>
1454c1c58:     	cmpq	$0x191, 0x30(%rsi)      # imm = 0x191
1454c1c60:     	jb	0x1454c1f2d <.text+0x54c0f2d>
1454c1c66:     	movaps	%xmm11, %xmm2
1454c1c6a:     	subps	%xmm6, %xmm2
1454c1c6d:     	movshdup	%xmm2, %xmm1            # xmm1 = xmm2[1,1,3,3]
1454c1c71:     	movaps	%xmm0, %xmm13
1454c1c75:     	movaps	%xmm2, %xmm0
1454c1c78:     	callq	0x145756e67 <.text+0x5755e67>
1454c1c7d:     	movss	0x60(%rbx), %xmm3
1454c1c82:     	movaps	%xmm11, %xmm2
1454c1c86:     	subss	%xmm3, %xmm2
1454c1c8a:     	xorps	%xmm3, %xmm3
1454c1c8d:     	ucomiss	%xmm2, %xmm3
1454c1c90:     	ja	0x1454c1ab0 <.text+0x54c0ab0>
1454c1c96:     	subss	0x64(%rbx), %xmm12
1454c1c9c:     	ucomiss	%xmm12, %xmm3
1454c1ca0:     	ja	0x1454c1ab0 <.text+0x54c0ab0>
1454c1ca6:     	movaps	%xmm2, %xmm3
1454c1ca9:     	movss	0x42952f(%rip), %xmm4   # 0x1458eb1e0
1454c1cb1:     	subss	%xmm4, %xmm3
1454c1cb5:     	cvttss2si	%xmm3, %rcx
1454c1cba:     	cvttss2si	%xmm2, %rdx
1454c1cbf:     	movq	%rdx, %rax
1454c1cc2:     	sarq	$0x3f, %rax
1454c1cc6:     	andq	%rcx, %rax
1454c1cc9:     	orq	%rdx, %rax
1454c1ccc:     	xorps	%xmm3, %xmm3
1454c1ccf:     	ucomiss	%xmm3, %xmm2
1454c1cd2:     	movl	$0x0, %r9d
1454c1cd8:     	cmovbq	%r9, %rax
1454c1cdc:     	movss	0x429500(%rip), %xmm5   # 0x1458eb1e4
1454c1ce4:     	ucomiss	%xmm5, %xmm2
1454c1ce7:     	movq	$-0x1, %r10
1454c1cee:     	cmovaq	%r10, %rax
1454c1cf2:     	movaps	%xmm12, %xmm2
1454c1cf6:     	subss	%xmm4, %xmm2
1454c1cfa:     	cvttss2si	%xmm2, %rcx
1454c1cff:     	cvttss2si	%xmm12, %r8
1454c1d04:     	movq	%r8, %rdx
1454c1d07:     	sarq	$0x3f, %rdx
1454c1d0b:     	andq	%rcx, %rdx
1454c1d0e:     	orq	%r8, %rdx
1454c1d11:     	ucomiss	%xmm3, %xmm12
1454c1d15:     	cmovbq	%r9, %rdx
1454c1d19:     	ucomiss	%xmm5, %xmm12
1454c1d1d:     	cmovaq	%r10, %rdx
1454c1d21:     	movq	0x58(%rbx), %rcx
1454c1d25:     	cmpq	%rcx, %rax
1454c1d28:     	jae	0x1454c1ab0 <.text+0x54c0ab0>
1454c1d2e:     	cmpq	%rcx, %rdx
1454c1d31:     	jae	0x1454c1ab0 <.text+0x54c0ab0>
1454c1d37:     	imulq	%rdx, %rcx
1454c1d3b:     	addq	%rax, %rcx
1454c1d3e:     	movq	0x20(%rsi), %rdx
1454c1d42:     	cmpq	%rdx, %rcx
1454c1d45:     	jae	0x1454c2027 <.text+0x54c1027>
1454c1d4b:     	movq	0x18(%rsi), %rax
1454c1d4f:     	movzwl	(%rax,%rcx,2), %eax
1454c1d53:     	cmpw	$-0x1, %ax
1454c1d57:     	je	0x1454c1ab0 <.text+0x54c0ab0>
1454c1d5d:     	movaps	%xmm0, %xmm1
1454c1d60:     	movaps	%xmm13, %xmm0
1454c1d64:     	movzwl	%ax, %eax
1454c1d67:     	xorps	%xmm2, %xmm2
1454c1d6a:     	cvtsi2ss	%eax, %xmm2
1454c1d6e:     	mulss	0x43aec2(%rip), %xmm1   # 0x1458fcc38
1454c1d76:     	addss	%xmm15, %xmm1
1454c1d7b:     	ucomiss	%xmm1, %xmm2
1454c1d7e:     	ja	0x1454c1ab0 <.text+0x54c0ab0>
1454c1d84:     	jmp	0x1454c1f2d <.text+0x54c0f2d>
1454c1d89:     	nopl	(%rax)
1454c1d90:     	addss	0x43af4f(%rip), %xmm9   # 0x1458fcce8
1454c1d99:     	ucomiss	%xmm15, %xmm9
1454c1d9d:     	jb	0x1454c18b0 <.text+0x54c08b0>
1454c1da3:     	movsldup	%xmm9, %xmm11           # xmm11 = xmm9[0,0,2,2]
1454c1da8:     	mulps	%xmm10, %xmm11
1454c1dac:     	addps	%xmm6, %xmm11
1454c1db0:     	movshdup	%xmm11, %xmm12          # xmm12 = xmm11[1,1,3,3]
1454c1db5:     	movq	%r14, %rcx
1454c1db8:     	movq	%r15, %rdx
1454c1dbb:     	callq	0x14540e820 <.text+0x540d820>
1454c1dc0:     	imulq	$0xf0, %rax, %rsi
1454c1dc7:     	movss	0xc8(%rsi,%rbp), %xmm1
1454c1dd0:     	movaps	%xmm11, %xmm0
1454c1dd4:     	subss	%xmm1, %xmm0
1454c1dd8:     	movss	0xcc(%rsi,%rbp), %xmm2
1454c1de1:     	movaps	%xmm12, %xmm1
1454c1de5:     	subss	%xmm2, %xmm1
1454c1de9:     	callq	0x145756e67 <.text+0x5755e67>
1454c1dee:     	movaps	%xmm0, %xmm13
1454c1df2:     	movss	0xd8(%rsi,%rbp), %xmm14
1454c1dfc:     	movaps	%xmm14, %xmm0
1454c1e00:     	addss	0x437188(%rip), %xmm0   # 0x1458f8f90
1454c1e08:     	ucomiss	%xmm0, %xmm13
1454c1e0c:     	ja	0x1454c1d90 <.text+0x54c0d90>
1454c1e0e:     	leaq	0x10(%rbx), %rcx
1454c1e12:     	movaps	%xmm11, %xmm1
1454c1e16:     	movaps	%xmm12, %xmm2
1454c1e1a:     	callq	0x1454627f0 <.text+0x54617f0>
1454c1e1f:     	testb	$0x1, %al
1454c1e21:     	je	0x1454c1d90 <.text+0x54c0d90>
1454c1e27:     	xorl	%eax, %eax
1454c1e29:     	ucomiss	%xmm14, %xmm13
1454c1e2d:     	seta	%al
1454c1e30:     	movaps	%xmm0, %xmm1
1454c1e33:     	subss	0x2c(%rsp), %xmm1
1454c1e39:     	andps	0x4490f0(%rip), %xmm1   # 0x14590af30
1454c1e40:     	leaq	0x14e85c1(%rip), %rcx   # 0x1469aa408
1454c1e47:     	ucomiss	(%rcx,%rax,4), %xmm1
1454c1e4b:     	ja	0x1454c1d90 <.text+0x54c0d90>
1454c1e51:     	cmpq	$-0x1, 0x40(%rbx)
1454c1e56:     	je	0x1454c1f2d <.text+0x54c0f2d>
1454c1e5c:     	movsd	0x60(%rbx), %xmm2
1454c1e61:     	movaps	%xmm11, %xmm1
1454c1e65:     	subps	%xmm2, %xmm1
1454c1e68:     	movaps	%xmm1, %xmm2
1454c1e6b:     	xorps	%xmm3, %xmm3
1454c1e6e:     	cmpltps	%xmm3, %xmm2
1454c1e72:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454c1e75:     	movmskpd	%xmm2, %eax
1454c1e79:     	testl	%eax, %eax
1454c1e7b:     	jne	0x1454c1f2d <.text+0x54c0f2d>
1454c1e81:     	movaps	%xmm1, %xmm2
1454c1e84:     	movss	0x429354(%rip), %xmm3   # 0x1458eb1e0
1454c1e8c:     	subss	%xmm3, %xmm2
1454c1e90:     	cvttss2si	%xmm2, %rcx
1454c1e95:     	cvttss2si	%xmm1, %rdx
1454c1e9a:     	movq	%rdx, %rax
1454c1e9d:     	sarq	$0x3f, %rax
1454c1ea1:     	andq	%rcx, %rax
1454c1ea4:     	orq	%rdx, %rax
1454c1ea7:     	xorps	%xmm4, %xmm4
1454c1eaa:     	ucomiss	%xmm4, %xmm1
1454c1ead:     	movl	$0x0, %r9d
1454c1eb3:     	cmovbq	%r9, %rax
1454c1eb7:     	movss	0x429325(%rip), %xmm5   # 0x1458eb1e4
1454c1ebf:     	ucomiss	%xmm5, %xmm1
1454c1ec2:     	movq	$-0x1, %r10
1454c1ec9:     	cmovaq	%r10, %rax
1454c1ecd:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454c1ed1:     	movaps	%xmm1, %xmm2
1454c1ed4:     	subss	%xmm3, %xmm2
1454c1ed8:     	cvttss2si	%xmm2, %rcx
1454c1edd:     	cvttss2si	%xmm1, %r8
1454c1ee2:     	movq	%r8, %rdx
1454c1ee5:     	sarq	$0x3f, %rdx
1454c1ee9:     	andq	%rcx, %rdx
1454c1eec:     	orq	%r8, %rdx
1454c1eef:     	ucomiss	%xmm4, %xmm1
1454c1ef2:     	cmovbq	%r9, %rdx
1454c1ef6:     	ucomiss	%xmm5, %xmm1
1454c1ef9:     	cmovaq	%r10, %rdx
1454c1efd:     	movq	0x58(%rbx), %rcx
1454c1f01:     	cmpq	%rcx, %rax
1454c1f04:     	jae	0x1454c1f2d <.text+0x54c0f2d>
1454c1f06:     	cmpq	%rcx, %rdx
1454c1f09:     	jae	0x1454c1f2d <.text+0x54c0f2d>
1454c1f0b:     	imulq	%rdx, %rcx
1454c1f0f:     	addq	%rax, %rcx
1454c1f12:     	movq	0x50(%rbx), %rdx
1454c1f16:     	cmpq	%rdx, %rcx
1454c1f19:     	jae	0x1454c2019 <.text+0x54c1019>
1454c1f1f:     	movq	0x48(%rbx), %rax
1454c1f23:     	cmpb	$0x1, (%rax,%rcx)
1454c1f27:     	je	0x1454c1d90 <.text+0x54c0d90>
1454c1f2d:     	movq	0x38(%rsp), %rax
1454c1f32:     	movlps	%xmm11, (%rax)
1454c1f36:     	movss	%xmm0, 0x8(%rax)
1454c1f3b:     	movaps	0x50(%rsp), %xmm6
1454c1f40:     	movaps	0x60(%rsp), %xmm7
1454c1f45:     	movaps	0x70(%rsp), %xmm8
1454c1f4b:     	movaps	0x80(%rsp), %xmm9
1454c1f54:     	movaps	0x90(%rsp), %xmm10
1454c1f5d:     	movaps	0xa0(%rsp), %xmm11
1454c1f66:     	movaps	0xb0(%rsp), %xmm12
1454c1f6f:     	movaps	0xc0(%rsp), %xmm13
1454c1f78:     	movaps	0xd0(%rsp), %xmm14
1454c1f81:     	movaps	0xe0(%rsp), %xmm15
1454c1f8a:     	addq	$0xf8, %rsp
1454c1f91:     	popq	%rbx
1454c1f92:     	popq	%rbp
1454c1f93:     	popq	%rdi
1454c1f94:     	popq	%rsi
1454c1f95:     	popq	%r12
1454c1f97:     	popq	%r13
1454c1f99:     	popq	%r14
1454c1f9b:     	popq	%r15
1454c1f9d:     	retq
1454c1f9e:     	movq	0x38(%rsp), %rcx
1454c1fa3:     	movq	%rdi, %rdx
1454c1fa6:     	movss	0x24(%rsp), %xmm2
1454c1fac:     	movss	0x28(%rsp), %xmm3
1454c1fb2:     	movaps	0x50(%rsp), %xmm6
1454c1fb7:     	movaps	0x60(%rsp), %xmm7
1454c1fbc:     	movaps	0x70(%rsp), %xmm8
1454c1fc2:     	movaps	0x80(%rsp), %xmm9
1454c1fcb:     	movaps	0x90(%rsp), %xmm10
1454c1fd4:     	movaps	0xa0(%rsp), %xmm11
1454c1fdd:     	movaps	0xb0(%rsp), %xmm12
1454c1fe6:     	movaps	0xc0(%rsp), %xmm13
1454c1fef:     	movaps	0xd0(%rsp), %xmm14
1454c1ff8:     	movaps	0xe0(%rsp), %xmm15
1454c2001:     	addq	$0xf8, %rsp
1454c2008:     	popq	%rbx
1454c2009:     	popq	%rbp
1454c200a:     	popq	%rdi
1454c200b:     	popq	%rsi
1454c200c:     	popq	%r12
1454c200e:     	popq	%r13
1454c2010:     	popq	%r14
1454c2012:     	popq	%r15
1454c2014:     	jmp	0x1454c2a20 <.text+0x54c1a20>
1454c2019:     	leaq	0x14c9cd8(%rip), %r8    # 0x14698bcf8
1454c2020:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454c2025:     	ud2
1454c2027:     	leaq	0x14cadda(%rip), %r8    # 0x14698ce08
1454c202e:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454c2033:     	ud2
