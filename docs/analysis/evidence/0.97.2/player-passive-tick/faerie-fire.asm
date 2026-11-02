
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a16f4:     	movabsq	$0x665f656972656166, %rcx # imm = 0x665F656972656166
1454a16fe:     	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1454a1708:     	jmp	0x1454a171d <.text+0x54a071d>
1454a170a:     	nopw	(%rax,%rax)
1454a1710:     	addq	$0x58, %r9
1454a1714:     	cmpq	%r9, %r10
1454a1717:     	je	0x1454a1f08 <.text+0x54a0f08>
1454a171d:     	movq	(%rax,%r9), %r11
1454a1721:     	cmpq	$0xb, 0x8(%r11)
1454a1726:     	jne	0x1454a1710 <.text+0x54a0710>
1454a1728:     	movq	(%r11), %r11
1454a172b:     	movq	(%r11), %rsi
1454a172e:     	xorq	%rcx, %rsi
1454a1731:     	movq	0x3(%r11), %r11
1454a1735:     	xorq	%rdx, %r11
1454a1738:     	orq	%rsi, %r11
1454a173b:     	jne	0x1454a1710 <.text+0x54a0710>
1454a173d:     	movq	0x778(%r13), %r9
1454a1744:     	testq	%r9, %r9
1454a1747:     	je	0x1454a184f <.text+0x54a084f>
1454a174d:     	movq	0x770(%r13), %rax
1454a1754:     	shlq	$0x4, %r9
1454a1758:     	movss	0x449d98(%rip), %xmm0   # 0x1458eb4f8
1454a1760:     	mulss	%xmm6, %xmm0
1454a1764:     	leaq	-0x10(%r9), %r10
1454a1768:     	movq	%rax, %r8
1454a176b:     	cmpq	$0x40, %r10
1454a176f:     	jb	0x1454a1809 <.text+0x54a0809>
1454a1775:     	shrq	$0x4, %r10
1454a1779:     	incq	%r10
1454a177c:     	movl	%r10d, %r8d
1454a177f:     	andl	$0x3, %r8d
1454a1783:     	movl	$0x4, %r11d
1454a1789:     	cmovneq	%r8, %r11
1454a178d:     	subq	%r11, %r10
1454a1790:     	movq	%r10, %r8
1454a1793:     	shlq	$0x4, %r8
1454a1797:     	addq	%rax, %r8
1454a179a:     	movaps	%xmm0, %xmm1
1454a179d:     	shufps	$0x0, %xmm0, %xmm1      # xmm1 = xmm1[0,0],xmm0[0,0]
1454a17a1:     	leaq	0x38(%rax), %r11
1454a17a5:     	movaps	0x1508c24(%rip), %xmm2  # 0x1469aa3d0
1454a17ac:     	nopl	(%rax)
1454a17b0:     	movss	-0x30(%r11), %xmm3
1454a17b6:     	movss	-0x20(%r11), %xmm4
1454a17bc:     	unpcklps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
1454a17bf:     	movss	-0x10(%r11), %xmm4
1454a17c5:     	movss	(%r11), %xmm5
1454a17ca:     	unpcklps	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
1454a17cd:     	movlhps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0]
1454a17d0:     	addps	%xmm1, %xmm3
1454a17d3:     	minps	%xmm2, %xmm3
1454a17d6:     	movaps	%xmm3, %xmm4
1454a17d9:     	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
1454a17dd:     	movaps	%xmm3, %xmm7
1454a17e0:     	unpckhpd	%xmm3, %xmm7            # xmm7 = xmm7[1],xmm3[1]
1454a17e4:     	shufps	$0xff, %xmm3, %xmm3     # xmm3 = xmm3[3,3,3,3]
1454a17e8:     	movss	%xmm4, -0x30(%r11)
1454a17ee:     	movss	%xmm5, -0x20(%r11)
1454a17f4:     	movss	%xmm7, -0x10(%r11)
1454a17fa:     	movss	%xmm3, (%r11)
1454a17ff:     	addq	$0x40, %r11
1454a1803:     	addq	$-0x4, %r10
1454a1807:     	jne	0x1454a17b0 <.text+0x54a07b0>
1454a1809:     	addq	%r9, %rax
1454a180c:     	movss	0x449ce4(%rip), %xmm1   # 0x1458eb4f8
1454a1814:     	nopw	%cs:(%rax,%rax)
1454a1820:     	movss	0x8(%r8), %xmm2
1454a1826:     	addss	%xmm0, %xmm2
1454a182a:     	minss	%xmm1, %xmm2
1454a182e:     	movss	%xmm2, 0x8(%r8)
1454a1834:     	addq	$0x10, %r8
1454a1838:     	cmpq	%rax, %r8
1454a183b:     	jne	0x1454a1820 <.text+0x54a0820>
1454a183d:     	movq	0x298(%r13), %rax
1454a1844:     	movq	0x2a0(%r13), %r8
1454a184b:     	imulq	$0x58, %r8, %r10
1454a184f:     	testq	%r8, %r8
1454a1852:     	je	0x1454a2239 <.text+0x54a1239>
1454a1858:     	xorl	%r9d, %r9d
1454a185b:     	jmp	0x1454a186d <.text+0x54a086d>
1454a185d:     	nopl	(%rax)
1454a1860:     	addq	$0x58, %r9
1454a1864:     	cmpq	%r9, %r10
1454a1867:     	je	0x1454a1f08 <.text+0x54a0f08>
1454a186d:     	movq	(%rax,%r9), %rdi
1454a1871:     	cmpq	$0xb, 0x8(%rdi)
1454a1876:     	jne	0x1454a1860 <.text+0x54a0860>
1454a1878:     	movq	(%rdi), %r11
1454a187b:     	movq	(%r11), %rsi
1454a187e:     	xorq	%rcx, %rsi
1454a1881:     	movq	0x3(%r11), %r11
1454a1885:     	xorq	%rdx, %r11
1454a1888:     	orq	%rsi, %r11
1454a188b:     	jne	0x1454a1860 <.text+0x54a0860>
1454a188d:     	movl	0x18(%rax,%r9), %r14d
1454a1892:     	movl	0x40(%rax,%r9), %ebx
1454a1897:     	movss	0x4c(%rdi), %xmm0
1454a189c:     	movss	%xmm0, 0x2b0(%rbp)
1454a18a4:     	movq	0x770(%r13), %rax
1454a18ab:     	movq	0x778(%r13), %rcx
1454a18b2:     	shlq	$0x4, %rcx
1454a18b6:     	addq	%rax, %rcx
1454a18b9:     	movq	%rax, 0xa0(%rbp)
1454a18c0:     	movq	%rcx, 0xa8(%rbp)
1454a18c7:     	movq	%r13, 0xb0(%rbp)
1454a18ce:     	leaq	0x2b0(%rbp), %rax
1454a18d5:     	movq	%rax, 0xb8(%rbp)
1454a18dc:     	leaq	0x2d8(%rbp), %rcx
1454a18e3:     	leaq	0xa0(%rbp), %rdx
1454a18ea:     	callq	0x145532030 <.text+0x5531030>
1454a18ef:     	movq	0x2d8(%rbp), %rax
1454a18f6:     	movq	%rax, 0x340(%rbp)
1454a18fd:     	movq	0x2e0(%rbp), %rax
1454a1904:     	movq	%rax, 0x358(%rbp)
1454a190b:     	movq	0x2e8(%rbp), %rax
1454a1912:     	testq	%rax, %rax
1454a1915:     	je	0x1454a1a22 <.text+0x54a0a22>
1454a191b:     	movq	0x358(%rbp), %r12
1454a1922:     	leaq	(%r12,%rax,8), %r15
1454a1926:     	movq	(%r12), %rdx
1454a192a:     	movq	0x778(%r13), %rax
1454a1931:     	testq	%rax, %rax
1454a1934:     	je	0x1454a1962 <.text+0x54a0962>
1454a1936:     	movq	0x770(%r13), %rcx
1454a193d:     	leaq	0x10(%rcx), %r9
1454a1941:     	xorl	%r8d, %r8d
1454a1944:     	nopw	%cs:(%rax,%rax)
1454a1950:     	cmpq	%rdx, -0x10(%r9)
1454a1954:     	je	0x1454a1982 <.text+0x54a0982>
1454a1956:     	incq	%r8
1454a1959:     	addq	$0x10, %r9
1454a195d:     	cmpq	%r8, %rax
1454a1960:     	jne	0x1454a1950 <.text+0x54a0950>
1454a1962:     	movq	%r13, %rcx
1454a1965:     	movl	$0x302, %r8d            # imm = 0x302
1454a196b:     	xorl	%r9d, %r9d
1454a196e:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1973:     	nop
1454a1974:     	addq	$0x8, %r12
1454a1978:     	cmpq	%r15, %r12
1454a197b:     	jne	0x1454a1926 <.text+0x54a0926>
1454a197d:     	jmp	0x1454a1a22 <.text+0x54a0a22>
1454a1982:     	leaq	0x1(%r8), %r10
1454a1986:     	cmpq	%rax, %r10
1454a1989:     	jae	0x1454a19bd <.text+0x54a09bd>
1454a198b:     	leal	(%rax,%r8), %esi
1454a198f:     	movq	%r8, %r11
1454a1992:     	testb	$0x1, %sil
1454a1996:     	jne	0x1454a19b1 <.text+0x54a09b1>
1454a1998:     	movq	%r8, %r11
1454a199b:     	cmpq	%rdx, (%r9)
1454a199e:     	je	0x1454a19ad <.text+0x54a09ad>
1454a19a0:     	movups	(%r9), %xmm0
1454a19a4:     	movups	%xmm0, -0x10(%r9)
1454a19a9:     	leaq	0x1(%r8), %r11
1454a19ad:     	leaq	0x2(%r8), %r10
1454a19b1:     	leaq	-0x2(%rax), %r9
1454a19b5:     	cmpq	%r8, %r9
1454a19b8:     	movq	%r11, %r8
1454a19bb:     	jne	0x1454a19c6 <.text+0x54a09c6>
1454a19bd:     	movq	%r8, 0x778(%r13)
1454a19c4:     	jmp	0x1454a1962 <.text+0x54a0962>
1454a19c6:     	subq	%r10, %rax
1454a19c9:     	shlq	$0x4, %r10
1454a19cd:     	leaq	(%rcx,%r10), %r9
1454a19d1:     	addq	$0x10, %r9
1454a19d5:     	movq	%r11, %r8
1454a19d8:     	jmp	0x1454a19e4 <.text+0x54a09e4>
1454a19da:     	addq	$0x20, %r9
1454a19de:     	addq	$-0x2, %rax
1454a19e2:     	je	0x1454a19bd <.text+0x54a09bd>
1454a19e4:     	cmpq	%rdx, -0x10(%r9)
1454a19e8:     	jne	0x1454a19f1 <.text+0x54a09f1>
1454a19ea:     	cmpq	%rdx, (%r9)
1454a19ed:     	je	0x1454a19da <.text+0x54a09da>
1454a19ef:     	jmp	0x1454a1a0d <.text+0x54a0a0d>
1454a19f1:     	leaq	-0x10(%r9), %r10
1454a19f5:     	movq	%r8, %r11
1454a19f8:     	shlq	$0x4, %r11
1454a19fc:     	movups	(%r10), %xmm0
1454a1a00:     	movups	%xmm0, (%rcx,%r11)
1454a1a05:     	incq	%r8
1454a1a08:     	cmpq	%rdx, (%r9)
1454a1a0b:     	je	0x1454a19da <.text+0x54a09da>
1454a1a0d:     	movq	%r8, %r10
1454a1a10:     	shlq	$0x4, %r10
1454a1a14:     	movups	(%r9), %xmm0
1454a1a18:     	movups	%xmm0, (%rcx,%r10)
1454a1a1d:     	incq	%r8
1454a1a20:     	jmp	0x1454a19da <.text+0x54a09da>
1454a1a22:     	movq	0x340(%rbp), %rdx
1454a1a29:     	testq	%rdx, %rdx
1454a1a2c:     	je	0x1454a1a44 <.text+0x54a0a44>
1454a1a2e:     	shlq	$0x3, %rdx
1454a1a32:     	movl	$0x8, %r8d
1454a1a38:     	movq	0x358(%rbp), %rcx
1454a1a3f:     	callq	0x1400021d0 <.text+0x11d0>
1454a1a44:     	movl	0x54(%rdi), %eax
1454a1a47:     	testl	%eax, %eax
1454a1a49:     	je	0x1454a1a66 <.text+0x54a0a66>
1454a1a4b:     	addl	%r14d, %ebx
1454a1a4e:     	addl	%eax, %ebx
1454a1a50:     	addl	0x48c(%r13), %ebx
1454a1a57:     	cmpl	$0x3, %ebx
1454a1a5a:     	movl	$0x3, %eax
1454a1a5f:     	cmovbl	%ebx, %eax
1454a1a62:     	testl	%ebx, %ebx
1454a1a64:     	jne	0x1454a1a6b <.text+0x54a0a6b>
1454a1a66:     	movl	$0x1, %eax
1454a1a6b:     	movl	%eax, %r15d
1454a1a6e:     	cmpq	%r15, 0x778(%r13)
1454a1a75:     	jae	0x1454a1bc6 <.text+0x54a0bc6>
1454a1a7b:     	leaq	0x3e8(%r13), %r12
1454a1a82:     	leaq	0xa0(%rbp), %rdi
1454a1a89:     	leaq	0x230(%rbp), %rbx
1454a1a90:     	jmp	0x1454a1aaa <.text+0x54a0aaa>
1454a1a92:     	movq	%r13, %rcx
1454a1a95:     	movq	%r14, %rdx
1454a1a98:     	callq	0x1454d7810 <.text+0x54d6810>
1454a1a9d:     	cmpq	%r15, 0x778(%r13)
1454a1aa4:     	jae	0x1454a1bc6 <.text+0x54a0bc6>
1454a1aaa:     	movl	0x8(%r12), %eax
1454a1aaf:     	movl	%eax, 0x238(%rbp)
1454a1ab5:     	movq	(%r12), %rax
1454a1ab9:     	movq	%rax, 0x230(%rbp)
1454a1ac0:     	movss	0x2b0(%rbp), %xmm3
1454a1ac8:     	movq	%rdi, %rcx
1454a1acb:     	movq	%r13, %rdx
1454a1ace:     	movq	%rbx, %r8
1454a1ad1:     	callq	0x1454d5950 <.text+0x54d4950>
1454a1ad6:     	movq	0xa8(%rbp), %rcx
1454a1add:     	cmpq	$0x0, 0xb0(%rbp)
1454a1ae5:     	je	0x1454a1bab <.text+0x54a0bab>
1454a1aeb:     	movq	(%rcx), %r14
1454a1aee:     	movq	0xa0(%rbp), %rdx
1454a1af5:     	testq	%rdx, %rdx
1454a1af8:     	je	0x1454a1a92 <.text+0x54a0a92>
1454a1afa:     	shlq	$0x3, %rdx
1454a1afe:     	movl	$0x8, %r8d
1454a1b04:     	callq	0x1400021d0 <.text+0x11d0>
1454a1b09:     	jmp	0x1454a1a92 <.text+0x54a0a92>
1454a1b0b:     	leaq	0x1(%r8), %r11
1454a1b0f:     	cmpq	%rax, %r11
1454a1b12:     	jae	0x1454a2043 <.text+0x54a1043>
1454a1b18:     	movq	%r8, %rdx
1454a1b1b:     	subq	%rax, %rdx
1454a1b1e:     	leaq	0x2(%rdx), %r10
1454a1b22:     	testb	$0x1, %dl
1454a1b25:     	jne	0x1454a2058 <.text+0x54a1058>
1454a1b2b:     	movss	(%r9), %xmm0
1454a1b30:     	ucomiss	%xmm7, %xmm0
1454a1b33:     	movq	%r8, %rdx
1454a1b36:     	jbe	0x1454a1b50 <.text+0x54a0b50>
1454a1b38:     	leaq	-0x10(%r9), %rdx
1454a1b3c:     	movq	0x10(%rdx), %r11
1454a1b40:     	movq	%r11, -0x18(%r9)
1454a1b44:     	movups	(%rdx), %xmm0
1454a1b47:     	movups	%xmm0, -0x28(%r9)
1454a1b4c:     	leaq	0x1(%r8), %rdx
1454a1b50:     	addq	$0x2, %r8
1454a1b54:     	movq	%r8, %r11
1454a1b57:     	movq	%rdx, %r8
1454a1b5a:     	jmp	0x1454a2058 <.text+0x54a1058>
1454a1b5f:     	leaq	0x1(%r8), %r11
1454a1b63:     	cmpq	%rcx, %r11
1454a1b66:     	jae	0x1454a204f <.text+0x54a104f>
1454a1b6c:     	movq	%r8, %rdx
1454a1b6f:     	subq	%rcx, %rdx
1454a1b72:     	leaq	0x2(%rdx), %r10
1454a1b76:     	testb	$0x1, %dl
1454a1b79:     	jne	0x1454a20e0 <.text+0x54a10e0>
1454a1b7f:     	movss	(%r9), %xmm1
1454a1b84:     	ucomiss	%xmm0, %xmm1
1454a1b87:     	movq	%r8, %rdx
1454a1b8a:     	jbe	0x1454a1b9c <.text+0x54a0b9c>
1454a1b8c:     	leaq	-0xc(%r9), %rdx
1454a1b90:     	movups	(%rdx), %xmm1
1454a1b93:     	movups	%xmm1, -0x1c(%r9)
1454a1b98:     	leaq	0x1(%r8), %rdx
1454a1b9c:     	addq	$0x2, %r8
1454a1ba0:     	movq	%r8, %r11
1454a1ba3:     	movq	%rdx, %r8
1454a1ba6:     	jmp	0x1454a20e0 <.text+0x54a10e0>
1454a1bab:     	movq	0xa0(%rbp), %rdx
1454a1bb2:     	testq	%rdx, %rdx
1454a1bb5:     	je	0x1454a1bc6 <.text+0x54a0bc6>
1454a1bb7:     	shlq	$0x3, %rdx
1454a1bbb:     	movl	$0x8, %r8d
1454a1bc1:     	callq	0x1400021d0 <.text+0x11d0>
1454a1bc6:     	movl	0x3f0(%r13), %eax
1454a1bcd:     	movl	%eax, 0xa8(%rbp)
1454a1bd3:     	movq	0x3e8(%r13), %rax
1454a1bda:     	movq	%rax, 0xa0(%rbp)
1454a1be1:     	movss	0x2b0(%rbp), %xmm3
1454a1be9:     	leaq	0x230(%rbp), %rcx
1454a1bf0:     	leaq	0xa0(%rbp), %r8
1454a1bf7:     	movq	%r13, %rdx
1454a1bfa:     	callq	0x1454d5950 <.text+0x54d4950>
1454a1bff:     	movq	0x238(%rbp), %rcx
1454a1c06:     	cmpq	$0x0, 0x240(%rbp)
1454a1c0e:     	je	0x1454a1e30 <.text+0x54a0e30>
1454a1c14:     	movq	%r13, %rax
1454a1c17:     	addq	$0x3e8, %r13            # imm = 0x3E8
1454a1c1e:     	leaq	0x768(%rax), %rdi
1454a1c25:     	leaq	0xa0(%rbp), %rbx
1454a1c2c:     	leaq	0x230(%rbp), %r14
1454a1c33:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1c3d:     	movq	(%rcx), %r15
1454a1c40:     	movq	0x368(%rbp), %r9
1454a1c47:     	movq	0x770(%r9), %rax
1454a1c4e:     	movq	0x778(%r9), %r8
1454a1c55:     	movq	%r8, %rdx
1454a1c58:     	shlq	$0x4, %rdx
1454a1c5c:     	addq	%rax, %rdx
1454a1c5f:     	movq	%rdx, 0xa8(%rbp)
1454a1c66:     	movq	%r9, 0xb0(%rbp)
1454a1c6d:     	testq	%r8, %r8
1454a1c70:     	je	0x1454a1e3a <.text+0x54a0e3a>
1454a1c76:     	leaq	0x10(%rax), %rdx
1454a1c7a:     	movq	%rdx, 0xa0(%rbp)
1454a1c81:     	movq	(%rax), %r8
1454a1c84:     	movq	0x4c8(%r9), %rax
1454a1c8b:     	imulq	$0x160, 0x4d0(%r9), %rdx # imm = 0x160
1454a1c96:     	xorl	%r10d, %r10d
1454a1c99:     	movq	%rax, %r9
1454a1c9c:     	movq	%rcx, 0x358(%rbp)
1454a1ca3:     	cmpq	%r10, %rdx
1454a1ca6:     	je	0x1454a1cd4 <.text+0x54a0cd4>
1454a1ca8:     	addq	$0x160, %r10            # imm = 0x160
1454a1caf:     	cmpq	%r8, 0x88(%r9)
1454a1cb6:     	leaq	0x160(%r9), %r9
1454a1cbd:     	jne	0x1454a1ca3 <.text+0x54a0ca3>
1454a1cbf:     	cmpq	$-0x1, -0x148(%rax,%r10)
1454a1cc8:     	setne	%dl
1454a1ccb:     	addb	%dl, %dl
1454a1ccd:     	orb	-0x8(%rax,%r10), %dl
1454a1cd2:     	jmp	0x1454a1cd6 <.text+0x54a0cd6>
1454a1cd4:     	xorl	%edx, %edx
1454a1cd6:     	movq	%rbx, %rcx
1454a1cd9:     	callq	0x145512d50 <.text+0x5511d50>
1454a1cde:     	nop
1454a1cdf:     	movq	0x368(%rbp), %rcx
1454a1ce6:     	movq	0x4c8(%rcx), %rax
1454a1ced:     	imulq	$0x160, 0x4d0(%rcx), %r11 # imm = 0x160
1454a1cf8:     	xorl	%r9d, %r9d
1454a1cfb:     	movq	%rax, %r8
1454a1cfe:     	cmpq	%r9, %r11
1454a1d01:     	je	0x1454a1d31 <.text+0x54a0d31>
1454a1d03:     	addq	$0x160, %r9             # imm = 0x160
1454a1d0a:     	cmpq	%rdx, 0x88(%r8)
1454a1d11:     	leaq	0x160(%r8), %r8
1454a1d18:     	jne	0x1454a1cfe <.text+0x54a0cfe>
1454a1d1a:     	cmpq	$-0x1, -0x148(%rax,%r9)
1454a1d23:     	setne	%r8b
1454a1d27:     	addb	%r8b, %r8b
1454a1d2a:     	orb	-0x8(%rax,%r9), %r8b
1454a1d2f:     	jmp	0x1454a1d34 <.text+0x54a0d34>
1454a1d31:     	xorl	%r8d, %r8d
1454a1d34:     	xorl	%r9d, %r9d
1454a1d37:     	movq	%rax, %r10
1454a1d3a:     	movq	0x358(%rbp), %rcx
1454a1d41:     	cmpq	%r9, %r11
1454a1d44:     	je	0x1454a1e3a <.text+0x54a0e3a>
1454a1d4a:     	addq	$0x160, %r9             # imm = 0x160
1454a1d51:     	cmpq	%r15, 0x88(%r10)
1454a1d58:     	leaq	0x160(%r10), %r10
1454a1d5f:     	jne	0x1454a1d41 <.text+0x54a0d41>
1454a1d61:     	cmpq	$-0x1, -0x148(%rax,%r9)
1454a1d6a:     	setne	%r10b
1454a1d6e:     	addb	%r10b, %r10b
1454a1d71:     	orb	-0x8(%rax,%r9), %r10b
1454a1d76:     	cmpb	%r10b, %r8b
1454a1d79:     	jae	0x1454a1e3a <.text+0x54a0e3a>
1454a1d7f:     	movq	%rdx, 0xa0(%rbp)
1454a1d86:     	movq	%rdi, %rcx
1454a1d89:     	movq	%rdx, %r12
1454a1d8c:     	movq	%rbx, %rdx
1454a1d8f:     	callq	0x145524320 <.text+0x5523320>
1454a1d94:     	nop
1454a1d95:     	movq	0x368(%rbp), %rcx
1454a1d9c:     	movq	%r12, %rdx
1454a1d9f:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1da9:     	movl	$0x302, %r8d            # imm = 0x302
1454a1daf:     	xorl	%r9d, %r9d
1454a1db2:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1db7:     	nop
1454a1db8:     	movq	0x368(%rbp), %rcx
1454a1dbf:     	movq	%r15, %rdx
1454a1dc2:     	callq	0x1454d7810 <.text+0x54d6810>
1454a1dc7:     	nop
1454a1dc8:     	movq	0x230(%rbp), %rdx
1454a1dcf:     	testq	%rdx, %rdx
1454a1dd2:     	je	0x1454a1dea <.text+0x54a0dea>
1454a1dd4:     	shlq	$0x3, %rdx
1454a1dd8:     	movl	$0x8, %r8d
1454a1dde:     	movq	0x358(%rbp), %rcx
1454a1de5:     	callq	0x1400021d0 <.text+0x11d0>
1454a1dea:     	movl	0x8(%r13), %eax
1454a1dee:     	movl	%eax, 0xa8(%rbp)
1454a1df4:     	movq	(%r13), %rax
1454a1df8:     	movq	%rax, 0xa0(%rbp)
1454a1dff:     	movss	0x2b0(%rbp), %xmm3
1454a1e07:     	movq	%r14, %rcx
1454a1e0a:     	movq	0x368(%rbp), %rdx
1454a1e11:     	movq	%rbx, %r8
1454a1e14:     	callq	0x1454d5950 <.text+0x54d4950>
1454a1e19:     	movq	0x238(%rbp), %rcx
1454a1e20:     	cmpq	$0x0, 0x240(%rbp)
1454a1e28:     	jne	0x1454a1c3d <.text+0x54a0c3d>
1454a1e2e:     	jmp	0x1454a1e3a <.text+0x54a0e3a>
1454a1e30:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1e3a:     	movq	0x230(%rbp), %rdx
1454a1e41:     	testq	%rdx, %rdx
1454a1e44:     	je	0x1454a1e55 <.text+0x54a0e55>
1454a1e46:     	shlq	$0x3, %rdx
1454a1e4a:     	movl	$0x8, %r8d
1454a1e50:     	callq	0x1400021d0 <.text+0x11d0>
1454a1e55:     	movq	0x368(%rbp), %r13
1454a1e5c:     	movq	0x770(%r13), %rdx
1454a1e63:     	movq	0x778(%r13), %r8
1454a1e6a:     	shlq	$0x4, %r8
1454a1e6e:     	addq	%rdx, %r8
1454a1e71:     	leaq	0xa0(%rbp), %rcx
1454a1e78:     	callq	0x1455376f0 <.text+0x55366f0>
1454a1e7d:     	movq	0xa0(%rbp), %rax
1454a1e84:     	movq	%rax, 0x340(%rbp)
1454a1e8b:     	movq	0xa8(%rbp), %rax
1454a1e92:     	movq	%rax, 0x358(%rbp)
1454a1e99:     	movq	0xb0(%rbp), %rdi
1454a1ea0:     	shlq	$0x3, %rdi
1454a1ea4:     	xorl	%ebx, %ebx
1454a1ea6:     	nopw	%cs:(%rax,%rax)
1454a1eb0:     	cmpq	%rbx, %rdi
1454a1eb3:     	je	0x1454a1ed8 <.text+0x54a0ed8>
1454a1eb5:     	movq	0x358(%rbp), %rax
1454a1ebc:     	movq	(%rax,%rbx), %rdx
1454a1ec0:     	addq	$0x8, %rbx
1454a1ec4:     	movq	%r13, %rcx
1454a1ec7:     	movl	$0x302, %r8d            # imm = 0x302
1454a1ecd:     	movb	$0x1, %r9b
1454a1ed0:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1ed5:     	nop
1454a1ed6:     	jmp	0x1454a1eb0 <.text+0x54a0eb0>
1454a1ed8:     	movq	0x340(%rbp), %rdx
1454a1edf:     	testq	%rdx, %rdx
1454a1ee2:     	je	0x1454a1efa <.text+0x54a0efa>
1454a1ee4:     	shlq	$0x3, %rdx
1454a1ee8:     	movl	$0x8, %r8d
1454a1eee:     	movq	0x358(%rbp), %rcx
1454a1ef5:     	callq	0x1400021d0 <.text+0x11d0>
1454a1efa:     	movq	0x298(%r13), %rax
1454a1f01:     	movq	0x2a0(%r13), %r8
1454a1f08:     	testq	%r8, %r8
1454a1f0b:     	je	0x1454a2239 <.text+0x54a1239>
1454a1f11:     	imulq	$0x58, %r8, %rcx
1454a1f15:     	xorl	%r8d, %r8d
