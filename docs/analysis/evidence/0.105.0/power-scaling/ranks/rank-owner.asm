
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e17f0:     	pushq	%rbp
1458e17f1:     	pushq	%r15
1458e17f3:     	pushq	%r14
1458e17f5:     	pushq	%r13
1458e17f7:     	pushq	%r12
1458e17f9:     	pushq	%rsi
1458e17fa:     	pushq	%rdi
1458e17fb:     	pushq	%rbx
1458e17fc:     	subq	$0x178, %rsp            # imm = 0x178
1458e1803:     	leaq	0x80(%rsp), %rbp
1458e180b:     	movaps	%xmm13, 0xe0(%rbp)
1458e1813:     	movaps	%xmm12, 0xd0(%rbp)
1458e181b:     	movaps	%xmm11, 0xc0(%rbp)
1458e1823:     	movaps	%xmm10, 0xb0(%rbp)
1458e182b:     	movaps	%xmm9, 0xa0(%rbp)
1458e1833:     	movaps	%xmm8, 0x90(%rbp)
1458e183b:     	movaps	%xmm7, 0x80(%rbp)
1458e1842:     	movaps	%xmm6, 0x70(%rbp)
1458e1846:     	movq	$-0x2, 0x68(%rbp)
1458e184e:     	movq	%rcx, -0x48(%rbp)
1458e1852:     	movq	$0x0, -0x18(%rbp)
1458e185a:     	movq	$0x8, -0x10(%rbp)
1458e1862:     	movq	$0x0, -0x8(%rbp)
1458e186a:     	movq	0x10(%rdx), %rcx
1458e186e:     	testq	%rcx, %rcx
1458e1871:     	je	0x1458e1d94 <.text+0x58e0d94>
1458e1877:     	movq	%rcx, %rax
1458e187a:     	movq	0x8(%rdx), %rdx
1458e187e:     	shlq	$0x4, %rax
1458e1882:     	addq	%rdx, %rax
1458e1885:     	movq	%rax, -0x50(%rbp)
1458e1889:     	xorl	%r12d, %r12d
1458e188c:     	movss	0x48bad8(%rip), %xmm6   # 0x145d6d36c
1458e1894:     	movss	0x48f3a0(%rip), %xmm7   # 0x145d70c3c
1458e189c:     	movss	0x49279b(%rip), %xmm8   # 0x145d74040
1458e18a5:     	movl	%eax, 0x4(%rbp)
1458e18a8:     	jmp	0x1458e18be <.text+0x58e08be>
1458e18aa:     	nopw	(%rax,%rax)
1458e18b0:     	addq	$0x10, %rdx
1458e18b4:     	cmpq	-0x50(%rbp), %rdx
1458e18b8:     	je	0x1458e1d94 <.text+0x58e0d94>
1458e18be:     	movq	(%rdx), %rax
1458e18c1:     	movq	0x58(%rax), %r8
1458e18c5:     	testq	%r8, %r8
1458e18c8:     	je	0x1458e18b0 <.text+0x58e08b0>
1458e18ca:     	movzbl	0x8(%rdx), %ecx
1458e18ce:     	cvtsi2ss	%ecx, %xmm10
1458e18d3:     	movq	0x50(%rax), %rdi
1458e18d7:     	shlq	$0x6, %r8
1458e18db:     	movq	%r8, -0x58(%rbp)
1458e18df:     	leaq	(%r12,%r12,8), %rax
1458e18e3:     	leaq	0x2d(,%rax,8), %rsi
1458e18eb:     	addq	$0x25, %rdi
1458e18ef:     	xorl	%r13d, %r13d
1458e18f2:     	movq	%rdx, -0x20(%rbp)
1458e18f6:     	jmp	0x1458e1987 <.text+0x58e0987>
1458e18fb:     	nopl	(%rax,%rax)
1458e1900:     	movq	-0x10(%rbp), %rax
1458e1904:     	movq	-0x60(%rbp), %rcx
1458e1908:     	movq	%rcx, -0x2d(%rax,%rsi)
1458e190d:     	movb	%r15b, -0x25(%rax,%rsi)
1458e1912:     	movl	0x4(%rbp), %ecx
1458e1915:     	movb	%cl, -0x24(%rax,%rsi)
1458e1919:     	movzwl	0x26(%rbp), %ecx
1458e191d:     	movw	%cx, -0x23(%rax,%rsi)
1458e1922:     	movss	%xmm9, -0x21(%rax,%rsi)
1458e1929:     	movb	%r14b, -0x1d(%rax,%rsi)
1458e192e:     	movl	0x58(%rbp), %ecx
1458e1931:     	movl	0x5b(%rbp), %edx
1458e1934:     	movl	%ecx, -0x1c(%rax,%rsi)
1458e1938:     	movl	%edx, -0x19(%rax,%rsi)
1458e193c:     	movq	%rbx, -0x15(%rax,%rsi)
1458e1941:     	movq	0x28(%rbp), %rcx
1458e1945:     	movq	%rcx, -0xd(%rax,%rsi)
1458e194a:     	movss	%xmm11, -0x5(%rax,%rsi)
1458e1951:     	movzbl	0x63(%rbp), %ecx
1458e1955:     	movb	%cl, -0x1(%rax,%rsi)
1458e1959:     	movaps	0x30(%rbp), %xmm0
1458e195d:     	movups	%xmm0, (%rax,%rsi)
1458e1961:     	movups	0x3b(%rbp), %xmm0
1458e1965:     	movups	%xmm0, 0xb(%rax,%rsi)
1458e196a:     	incq	%r12
1458e196d:     	movq	%r12, -0x8(%rbp)
1458e1971:     	addq	$0x48, %rsi
1458e1975:     	addq	$0x40, %r13
1458e1979:     	cmpq	%r13, -0x58(%rbp)
1458e197d:     	movq	-0x20(%rbp), %rdx
1458e1981:     	je	0x1458e18b0 <.text+0x58e08b0>
1458e1987:     	movq	(%rdx), %rax
1458e198a:     	movq	%rax, -0x60(%rbp)
1458e198e:     	movzbl	-0x25(%rdi,%r13), %r15d
1458e1994:     	leal	-0x23(%r15), %eax
1458e1998:     	cmpl	$0x23, %r15d
1458e199c:     	movzbl	%al, %eax
1458e199f:     	movl	$0x2, %ecx
1458e19a4:     	cmovbl	%ecx, %eax
1458e19a7:     	testb	%al, %al
1458e19a9:     	je	0x1458e1a00 <.text+0x58e0a00>
1458e19ab:     	movzbl	%al, %eax
1458e19ae:     	cmpl	$0x1, %eax
1458e19b1:     	jne	0x1458e1a20 <.text+0x58e0a20>
1458e19b3:     	movzbl	-0x1d(%rdi,%r13), %r14d
1458e19b9:     	movl	-0x19(%rdi,%r13), %eax
1458e19be:     	movl	%eax, 0xb(%rbp)
1458e19c1:     	movl	-0x1c(%rdi,%r13), %eax
1458e19c6:     	movl	%eax, 0x8(%rbp)
1458e19c9:     	movq	-0x15(%rdi,%r13), %rbx
1458e19ce:     	movq	-0xd(%rdi,%r13), %rax
1458e19d3:     	movq	%rax, 0x28(%rbp)
1458e19d7:     	movzbl	-0x1(%rdi,%r13), %eax
1458e19dd:     	movb	%al, 0x63(%rbp)
1458e19e0:     	movss	-0x5(%rdi,%r13), %xmm11
1458e19e7:     	mulss	%xmm10, %xmm11
1458e19ec:     	movb	$0x24, %r15b
1458e19ef:     	jmp	0x1458e1d5f <.text+0x58e0d5f>
1458e19f4:     	nopw	%cs:(%rax,%rax)
1458e1a00:     	movzbl	-0x1d(%rdi,%r13), %r14d
1458e1a06:     	movss	-0x21(%rdi,%r13), %xmm9
1458e1a0d:     	mulss	%xmm10, %xmm9
1458e1a12:     	movb	$0x23, %r15b
1458e1a15:     	jmp	0x1458e1d5f <.text+0x58e0d5f>
1458e1a1a:     	nopw	(%rax,%rax)
1458e1a20:     	leaq	(%rdi,%r13), %rcx
1458e1a24:     	movzbl	-0x24(%rdi,%r13), %r10d
1458e1a2a:     	movzwl	-0x23(%rdi,%r13), %r11d
1458e1a30:     	movss	-0x21(%rdi,%r13), %xmm9
1458e1a37:     	movq	-0x1d(%rdi,%r13), %r14
1458e1a3c:     	movq	-0x15(%rdi,%r13), %rbx
1458e1a41:     	movq	-0xd(%rdi,%r13), %rdx
1458e1a46:     	movq	%rdx, 0x28(%rbp)
1458e1a4a:     	movss	-0x5(%rdi,%r13), %xmm11
1458e1a51:     	movzbl	-0x1(%rdi,%r13), %edx
1458e1a57:     	movb	%dl, 0x63(%rbp)
1458e1a5a:     	movq	-0x20(%rbp), %rdx
1458e1a5e:     	movl	0x8(%rdx), %edx
1458e1a61:     	cmpb	$0x1, %dl
1458e1a64:     	adcl	$0x0, %edx
1458e1a67:     	cmpl	$0x22, %r15d
1458e1a6b:     	ja	0x1458e1aeb <.text+0x58e0aeb>
1458e1a6d:     	movzbl	%dl, %edx
1458e1a70:     	xorps	%xmm0, %xmm0
1458e1a73:     	cvtsi2ss	%edx, %xmm0
1458e1a77:     	movq	%r14, %rdx
1458e1a7a:     	shrq	$0x20, %rdx
1458e1a7e:     	movd	%r14d, %xmm1
1458e1a83:     	movl	%r15d, %r8d
1458e1a86:     	leaq	0x15966a3(%rip), %r9    # 0x146e78130
1458e1a8d:     	movslq	(%r9,%r8,4), %r8
1458e1a91:     	addq	%r9, %r8
1458e1a94:     	jmpq	*%r8
1458e1a97:     	movl	0x7(%rcx), %edx
1458e1a9a:     	movl	%edx, 0x37(%rbp)
1458e1a9d:     	movq	(%rcx), %rcx
1458e1aa0:     	movq	%rcx, 0x30(%rbp)
1458e1aa4:     	jmp	0x1458e1c33 <.text+0x58e0c33>
1458e1aa9:     	movl	0x7(%rcx), %edx
1458e1aac:     	movl	%edx, 0x37(%rbp)
1458e1aaf:     	movq	(%rcx), %rcx
1458e1ab2:     	movq	%rcx, 0x30(%rbp)
1458e1ab6:     	mulss	%xmm0, %xmm9
1458e1abb:     	movq	%r14, 0x58(%rbp)
1458e1abf:     	movl	%r10d, %edx
1458e1ac2:     	jmp	0x1458e1cf0 <.text+0x58e0cf0>
1458e1ac7:     	movl	0xf(%rcx), %edx
1458e1aca:     	movl	%edx, 0x3f(%rbp)
1458e1acd:     	movups	(%rcx), %xmm1
1458e1ad0:     	movaps	%xmm1, 0x30(%rbp)
1458e1ad4:     	jmp	0x1458e1c16 <.text+0x58e0c16>
1458e1ad9:     	mulss	%xmm0, %xmm9
1458e1ade:     	movzbl	0x67(%rbp), %eax
1458e1ae2:     	movl	%eax, %edx
1458e1ae4:     	movzwl	0x64(%rbp), %r8d
1458e1ae9:     	jmp	0x1458e1b33 <.text+0x58e0b33>
1458e1aeb:     	movq	%r14, 0x58(%rbp)
1458e1aef:     	movups	(%rcx), %xmm0
1458e1af2:     	movups	0xb(%rcx), %xmm1
1458e1af6:     	movaps	%xmm0, 0x30(%rbp)
1458e1afa:     	movups	%xmm1, 0x3b(%rbp)
1458e1afe:     	movl	%r10d, %edx
1458e1b01:     	movl	%r11d, %r8d
1458e1b04:     	jmp	0x1458e1cf5 <.text+0x58e0cf5>
1458e1b09:     	movaps	%xmm6, %xmm1
1458e1b0c:     	maxss	%xmm0, %xmm1
1458e1b10:     	movaps	%xmm7, %xmm0
1458e1b13:     	minss	%xmm1, %xmm0
1458e1b17:     	xorps	%xmm1, %xmm1
1458e1b1a:     	maxss	%xmm0, %xmm1
1458e1b1e:     	movaps	%xmm8, %xmm0
1458e1b22:     	minss	%xmm1, %xmm0
1458e1b26:     	cvttss2si	%xmm0, %edx
1458e1b2a:     	movzwl	0x64(%rbp), %r8d
1458e1b2f:     	movaps	%xmm13, %xmm9
1458e1b33:     	movq	0x10(%rbp), %rax
1458e1b37:     	movq	%rax, 0x28(%rbp)
1458e1b3b:     	movaps	%xmm12, %xmm11
1458e1b3f:     	movzbl	0x62(%rbp), %eax
1458e1b43:     	movb	%al, 0x63(%rbp)
1458e1b46:     	movq	0x18(%rbp), %rbx
1458e1b4a:     	jmp	0x1458e1cf5 <.text+0x58e0cf5>
1458e1b4f:     	movl	0x7(%rcx), %edx
1458e1b52:     	movl	%edx, 0x37(%rbp)
1458e1b55:     	movq	(%rcx), %rcx
1458e1b58:     	movq	%rcx, 0x30(%rbp)
1458e1b5c:     	mulss	%xmm0, %xmm9
1458e1b61:     	movq	%r14, 0x58(%rbp)
1458e1b65:     	movl	%ebx, %eax
1458e1b67:     	movabsq	$-0x100000000, %rcx     # imm = 0xFFFFFFFF00000000
1458e1b71:     	movl	%r10d, %edx
1458e1b74:     	movq	0x18(%rbp), %rbx
1458e1b78:     	andq	%rcx, %rbx
1458e1b7b:     	orq	%rax, %rbx
1458e1b7e:     	jmp	0x1458e1cf0 <.text+0x58e0cf0>
1458e1b83:     	mulss	%xmm0, %xmm9
1458e1b88:     	movq	%r14, 0x58(%rbp)
1458e1b8c:     	jmp	0x1458e1bbb <.text+0x58e0bbb>
1458e1b8e:     	movq	%r14, 0x58(%rbp)
1458e1b92:     	movzwl	(%rcx), %edx
1458e1b95:     	movw	%dx, 0x30(%rbp)
1458e1b99:     	movzbl	0x2(%rcx), %ecx
1458e1b9d:     	movb	%cl, 0x32(%rbp)
1458e1ba0:     	mulss	%xmm0, %xmm9
1458e1ba5:     	jmp	0x1458e1cea <.text+0x58e0cea>
1458e1baa:     	mulss	%xmm0, %xmm1
1458e1bae:     	movss	%xmm1, 0x58(%rbp)
1458e1bb3:     	movl	%edx, 0x5c(%rbp)
1458e1bb6:     	movd	%xmm1, %r14d
1458e1bbb:     	movzbl	0x67(%rbp), %eax
1458e1bbf:     	movl	%eax, %edx
1458e1bc1:     	jmp	0x1458e1bdf <.text+0x58e0bdf>
1458e1bc3:     	maxss	%xmm6, %xmm0
1458e1bc7:     	pxor	%xmm1, %xmm1
1458e1bcb:     	maxss	%xmm0, %xmm1
1458e1bcf:     	movaps	%xmm8, %xmm0
1458e1bd3:     	minss	%xmm1, %xmm0
1458e1bd7:     	cvttss2si	%xmm0, %edx
1458e1bdb:     	movl	%r14d, 0x58(%rbp)
1458e1bdf:     	movzwl	0x64(%rbp), %r8d
1458e1be4:     	movq	0x10(%rbp), %rax
1458e1be8:     	movq	%rax, 0x28(%rbp)
1458e1bec:     	jmp	0x1458e1cb0 <.text+0x58e0cb0>
1458e1bf1:     	movl	0x7(%rcx), %edx
1458e1bf4:     	movl	%edx, 0x37(%rbp)
1458e1bf7:     	movq	(%rcx), %rcx
1458e1bfa:     	movq	%rcx, 0x30(%rbp)
1458e1bfe:     	mulss	%xmm0, %xmm1
1458e1c02:     	movss	%xmm1, 0x58(%rbp)
1458e1c07:     	jmp	0x1458e1c5c <.text+0x58e0c5c>
1458e1c09:     	movl	0x7(%rcx), %edx
1458e1c0c:     	movl	%edx, 0x37(%rbp)
1458e1c0f:     	movq	(%rcx), %rcx
1458e1c12:     	movq	%rcx, 0x30(%rbp)
1458e1c16:     	mulss	%xmm0, %xmm9
1458e1c1b:     	movq	%r14, 0x58(%rbp)
1458e1c1f:     	jmp	0x1458e1cea <.text+0x58e0cea>
1458e1c24:     	movups	(%rcx), %xmm1
1458e1c27:     	movups	0xb(%rcx), %xmm2
1458e1c2b:     	movups	%xmm2, 0x3b(%rbp)
1458e1c2f:     	movaps	%xmm1, 0x30(%rbp)
1458e1c33:     	mulss	%xmm0, %xmm9
1458e1c38:     	movl	%r14d, 0x58(%rbp)
1458e1c3c:     	jmp	0x1458e1cea <.text+0x58e0cea>
1458e1c41:     	movl	0x7(%rcx), %r8d
1458e1c45:     	movl	%r8d, 0x37(%rbp)
1458e1c49:     	movq	(%rcx), %rcx
1458e1c4c:     	movq	%rcx, 0x30(%rbp)
1458e1c50:     	mulss	%xmm0, %xmm1
1458e1c54:     	movss	%xmm1, 0x58(%rbp)
1458e1c59:     	movl	%edx, 0x5c(%rbp)
1458e1c5c:     	movd	%xmm1, %r14d
1458e1c61:     	jmp	0x1458e1cea <.text+0x58e0cea>
1458e1c66:     	movl	0xf(%rcx), %r8d
1458e1c6a:     	movl	%r8d, 0x3f(%rbp)
1458e1c6e:     	movups	(%rcx), %xmm1
1458e1c71:     	movaps	%xmm1, 0x30(%rbp)
1458e1c75:     	cmpl	$-0x1, %r14d
1458e1c79:     	je	0x1458e1cbd <.text+0x58e0cbd>
1458e1c7b:     	movq	%r14, 0x58(%rbp)
1458e1c7f:     	movl	%ebx, %eax
1458e1c81:     	movabsq	$-0x100000000, %rcx     # imm = 0xFFFFFFFF00000000
1458e1c8b:     	movq	0x18(%rbp), %rbx
1458e1c8f:     	andq	%rcx, %rbx
1458e1c92:     	orq	%rax, %rbx
1458e1c95:     	mulss	%xmm0, %xmm9
1458e1c9a:     	jmp	0x1458e1cea <.text+0x58e0cea>
1458e1c9c:     	mulss	%xmm0, %xmm9
1458e1ca1:     	movq	%r14, 0x58(%rbp)
1458e1ca5:     	movzbl	0x67(%rbp), %eax
1458e1ca9:     	movl	%eax, %edx
1458e1cab:     	movzwl	0x64(%rbp), %r8d
1458e1cb0:     	movaps	%xmm12, %xmm11
1458e1cb4:     	movzbl	0x62(%rbp), %eax
1458e1cb8:     	movb	%al, 0x63(%rbp)
1458e1cbb:     	jmp	0x1458e1cf5 <.text+0x58e0cf5>
1458e1cbd:     	movd	%edx, %xmm1
1458e1cc1:     	mulss	%xmm0, %xmm1
1458e1cc5:     	movl	$0xffffffff, 0x58(%rbp) # imm = 0xFFFFFFFF
1458e1ccc:     	movss	%xmm1, 0x5c(%rbp)
1458e1cd1:     	movl	%ebx, %eax
1458e1cd3:     	movabsq	$-0x100000000, %rcx     # imm = 0xFFFFFFFF00000000
1458e1cdd:     	movq	0x18(%rbp), %rbx
1458e1ce1:     	andq	%rcx, %rbx
1458e1ce4:     	orq	%rax, %rbx
1458e1ce7:     	movb	$-0x1, %r14b
1458e1cea:     	movzbl	0x67(%rbp), %eax
1458e1cee:     	movl	%eax, %edx
1458e1cf0:     	movzwl	0x64(%rbp), %r8d
1458e1cf5:     	leaq	0x59(%rbp), %rcx
1458e1cf9:     	movl	(%rcx), %eax
1458e1cfb:     	movl	0x3(%rcx), %ecx
1458e1cfe:     	movl	%ecx, 0xb(%rbp)
1458e1d01:     	movl	%eax, 0x8(%rbp)
1458e1d04:     	movzwl	0x30(%rbp), %eax
1458e1d08:     	movw	%ax, -0x40(%rbp)
1458e1d0c:     	movzbl	0x32(%rbp), %eax
1458e1d10:     	movb	%al, -0x3e(%rbp)
1458e1d13:     	movl	0x33(%rbp), %eax
1458e1d16:     	movl	%eax, -0x3d(%rbp)
1458e1d19:     	movl	0x37(%rbp), %eax
1458e1d1c:     	movl	%eax, -0x39(%rbp)
1458e1d1f:     	movl	0x3b(%rbp), %eax
1458e1d22:     	movl	%eax, -0x35(%rbp)
1458e1d25:     	movzbl	0x3f(%rbp), %eax
1458e1d29:     	movb	%al, -0x31(%rbp)
1458e1d2c:     	movups	0x3b(%rbp), %xmm0
1458e1d30:     	movups	%xmm0, -0x35(%rbp)
1458e1d34:     	movl	%edx, 0x4(%rbp)
1458e1d37:     	movb	%dl, 0x67(%rbp)
1458e1d3a:     	movw	%r8w, 0x26(%rbp)
1458e1d3f:     	movw	%r8w, 0x64(%rbp)
1458e1d44:     	movaps	%xmm9, %xmm13
1458e1d48:     	movq	0x28(%rbp), %rax
1458e1d4c:     	movq	%rax, 0x10(%rbp)
1458e1d50:     	movaps	%xmm11, %xmm12
1458e1d54:     	movzbl	0x63(%rbp), %eax
1458e1d58:     	movb	%al, 0x62(%rbp)
1458e1d5b:     	movq	%rbx, 0x18(%rbp)
1458e1d5f:     	movl	0x8(%rbp), %eax
1458e1d62:     	movl	0xb(%rbp), %ecx
1458e1d65:     	movl	%ecx, 0x5b(%rbp)
1458e1d68:     	movl	%eax, 0x58(%rbp)
1458e1d6b:     	movaps	-0x40(%rbp), %xmm0
1458e1d6f:     	movaps	%xmm0, 0x30(%rbp)
1458e1d73:     	movups	-0x35(%rbp), %xmm0
1458e1d77:     	movups	%xmm0, 0x3b(%rbp)
1458e1d7b:     	cmpq	-0x18(%rbp), %r12
1458e1d7f:     	jne	0x1458e1900 <.text+0x58e0900>
1458e1d85:     	leaq	-0x18(%rbp), %rcx
1458e1d89:     	callq	0x145bcb450 <.text+0x5bca450>
1458e1d8e:     	nop
1458e1d8f:     	jmp	0x1458e1900 <.text+0x58e0900>
1458e1d94:     	movq	-0x8(%rbp), %rcx
1458e1d98:     	movq	-0x48(%rbp), %rax
1458e1d9c:     	movq	%rcx, 0x10(%rax)
1458e1da0:     	movq	-0x18(%rbp), %rcx
1458e1da4:     	movq	%rcx, (%rax)
1458e1da7:     	movq	-0x10(%rbp), %rcx
1458e1dab:     	movq	%rcx, 0x8(%rax)
1458e1daf:     	movaps	0x70(%rbp), %xmm6
1458e1db3:     	movaps	0x80(%rbp), %xmm7
1458e1dba:     	movaps	0x90(%rbp), %xmm8
1458e1dc2:     	movaps	0xa0(%rbp), %xmm9
1458e1dca:     	movaps	0xb0(%rbp), %xmm10
1458e1dd2:     	movaps	0xc0(%rbp), %xmm11
1458e1dda:     	movaps	0xd0(%rbp), %xmm12
1458e1de2:     	movaps	0xe0(%rbp), %xmm13
1458e1dea:     	addq	$0x178, %rsp            # imm = 0x178
1458e1df1:     	popq	%rbx
1458e1df2:     	popq	%rdi
1458e1df3:     	popq	%rsi
1458e1df4:     	popq	%r12
1458e1df6:     	popq	%r13
1458e1df8:     	popq	%r14
1458e1dfa:     	popq	%r15
1458e1dfc:     	popq	%rbp
1458e1dfd:     	retq
