
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402129f0:     	pushq	%rbp
1402129f1:     	pushq	%r15
1402129f3:     	pushq	%r14
1402129f5:     	pushq	%r13
1402129f7:     	pushq	%r12
1402129f9:     	pushq	%rsi
1402129fa:     	pushq	%rdi
1402129fb:     	pushq	%rbx
1402129fc:     	subq	$0x128, %rsp            # imm = 0x128
140212a03:     	leaq	0x80(%rsp), %rbp
140212a0b:     	movq	$-0x2, 0xa0(%rbp)
140212a16:     	movups	(%rdx), %xmm0
140212a19:     	movups	0x10(%rdx), %xmm1
140212a1d:     	movaps	%xmm1, 0x20(%rbp)
140212a21:     	movaps	%xmm0, 0x10(%rbp)
140212a25:     	movb	%ch, 0x9a(%rbp)
140212a2b:     	movl	%ecx, 0x8c(%rbp)
140212a31:     	movl	%ecx, %eax
140212a33:     	shrl	$0x10, %eax
140212a36:     	andb	$0x1, %al
140212a38:     	movb	%al, 0x9b(%rbp)
140212a3e:     	movl	0x20(%rbp), %r14d
140212a42:     	testl	%r14d, %r14d
140212a45:     	je	0x14021350f <.text+0x21250f>
140212a4b:     	movl	0x24(%rbp), %r15d
140212a4f:     	movl	0x28(%rbp), %r12d
140212a53:     	movl	0x2c(%rbp), %r13d
140212a57:     	movq	0x10(%rbp), %rbx
140212a5b:     	movl	0x5b0(%rbx), %esi
140212a61:     	leaq	0x40(%rbx), %rax
140212a65:     	leaq	0x5a8(%rbx), %rcx
140212a6c:     	movq	%rax, -0x38(%rbp)
140212a70:     	movq	%rcx, -0x30(%rbp)
140212a74:     	movq	$0x0, -0x50(%rbp)
140212a7c:     	movq	$0x8, -0x48(%rbp)
140212a84:     	movq	$0x0, -0x40(%rbp)
140212a8c:     	leaq	0x268(%rbx), %rcx
140212a93:     	leaq	0x158(%rbx), %r8
140212a9a:     	leaq	-0x50(%rbp), %rdx
140212a9e:     	callq	0x14034f960 <.text+0x34e960>
140212aa3:     	nop
140212aa4:     	movq	%rax, %rdi
140212aa7:     	movl	%r13d, 0x3c(%rbp)
140212aab:     	movl	%r15d, 0x9c(%rbp)
140212ab2:     	movl	%r14d, 0x48(%rbp)
140212ab6:     	movq	-0x50(%rbp), %rdx
140212aba:     	testq	%rdx, %rdx
140212abd:     	je	0x140212ad2 <.text+0x211ad2>
140212abf:     	movq	-0x48(%rbp), %rcx
140212ac3:     	shlq	$0x3, %rdx
140212ac7:     	movl	$0x8, %r8d
140212acd:     	callq	0x1400021d0 <.text+0x11d0>
140212ad2:     	movl	%esi, 0x20(%rsp)
140212ad6:     	leaq	-0x50(%rbp), %rcx
140212ada:     	movq	%rbx, 0x8(%rbp)
140212ade:     	movq	%rbx, %rdx
140212ae1:     	movl	%r12d, 0x38(%rbp)
140212ae5:     	movl	%r12d, %r8d
140212ae8:     	movq	%rdi, %r9
140212aeb:     	callq	0x1401f13a0 <.text+0x1f03a0>
140212af0:     	movq	0x18(%rbp), %rax
140212af4:     	movq	%rax, 0x90(%rbp)
140212afb:     	movq	-0x30(%rbp), %rdi
140212aff:     	movq	-0x28(%rbp), %r15
140212b03:     	movq	-0x20(%rbp), %rsi
140212b07:     	movq	-0x18(%rbp), %rax
140212b0b:     	movq	%rax, 0x60(%rbp)
140212b0f:     	testb	$0x1, 0x8c(%rbp)
140212b16:     	jne	0x140212bae <.text+0x211bae>
140212b1c:     	movl	0x98(%rsi), %eax
140212b22:     	testb	%al, %al
140212b24:     	jns	0x140212b99 <.text+0x211b99>
140212b26:     	movq	0x90(%rbp), %rax
140212b2d:     	movq	%rax, 0x58(%rbp)
140212b31:     	movq	0x28(%rdi), %rax
140212b35:     	movq	0x30(%rdi), %rcx
140212b39:     	subq	%rcx, %rax
140212b3c:     	shlq	$0x3, %rcx
140212b40:     	addq	0x20(%rdi), %rcx
140212b44:     	movq	%rcx, 0x70(%rbp)
140212b48:     	movq	%rax, 0x78(%rbp)
140212b4c:     	movq	0x60(%rbp), %rbx
140212b50:     	leaq	0x388(%rbx), %rcx
140212b57:     	movl	$0x2, %edx
140212b5c:     	callq	0x144e14720 <.text+0x4e13720>
140212b61:     	testq	%rax, %rax
140212b64:     	je	0x140212b93 <.text+0x211b93>
140212b66:     	movq	$0x2, 0x40(%rbp)
140212b6e:     	movq	0x58(%rbp), %rcx
140212b72:     	leaq	0x40(%rbp), %rdx
140212b76:     	movq	%rdx, 0x28(%rsp)
140212b7b:     	movq	%rcx, 0x20(%rsp)
140212b80:     	leaq	0x70(%rbp), %rcx
140212b84:     	leaq	0x58(%rbp), %r9
140212b88:     	movq	%rbx, %rdx
140212b8b:     	movq	%rax, %r8
140212b8e:     	callq	0x144e8adb0 <.text+0x4e89db0>
140212b93:     	movl	0x98(%rsi), %eax
140212b99:     	testb	$0x4, %al
140212b9b:     	je	0x140212bae <.text+0x211bae>
140212b9d:     	movq	0x28(%rdi), %r14
140212ba1:     	movq	0x30(%rdi), %r12
140212ba5:     	cmpq	%r14, %r12
140212ba8:     	jne	0x140212e97 <.text+0x211e97>
140212bae:     	movq	-0x50(%rbp), %rax
140212bb2:     	testq	%rax, %rax
140212bb5:     	movq	%rdi, 0x30(%rbp)
140212bb9:     	je	0x140212ce7 <.text+0x211ce7>
140212bbf:     	cmpl	$0x1, %eax
140212bc2:     	movl	0x48(%rbp), %r10d
140212bc6:     	movl	%r10d, %ecx
140212bc9:     	notl	%ecx
140212bcb:     	jne	0x140212cf7 <.text+0x211cf7>
140212bd1:     	movq	0x58(%rsi), %rdx
140212bd5:     	cmpq	%rcx, %rdx
140212bd8:     	jbe	0x140213521 <.text+0x212521>
140212bde:     	movq	-0x48(%rbp), %rax
140212be2:     	movq	%rax, 0x68(%rbp)
140212be6:     	decq	%rdx
140212be9:     	movq	0x50(%rsi), %rax
140212bed:     	movq	%rcx, %r8
140212bf0:     	shlq	$0x4, %r8
140212bf4:     	movq	%rdx, %r9
140212bf7:     	shlq	$0x4, %r9
140212bfb:     	movl	0x8(%rax,%r8), %r11d
140212c00:     	movups	(%rax,%r9), %xmm0
140212c05:     	movups	%xmm0, (%rax,%r8)
140212c0a:     	movq	%rdx, 0x58(%rsi)
140212c0e:     	cmpq	%rcx, %rdx
140212c11:     	movq	0x90(%rbp), %rbx
140212c18:     	je	0x140212c60 <.text+0x211c60>
140212c1a:     	jbe	0x140213528 <.text+0x212528>
140212c20:     	addq	%r8, %rax
140212c23:     	movl	(%rax), %eax
140212c25:     	testl	%eax, %eax
140212c27:     	je	0x140212c60 <.text+0x211c60>
140212c29:     	notl	%eax
140212c2b:     	movq	0x60(%rbp), %rcx
140212c2f:     	cmpq	%rax, 0x10(%rcx)
140212c33:     	movq	0x8(%rcx), %rcx
140212c37:     	leaq	(%rax,%rax,2), %rax
140212c3b:     	leaq	(%rcx,%rax,8), %rdx
140212c3f:     	leaq	0x57399a2(%rip), %r8    # 0x14594c5e8
140212c46:     	cmovaq	%rdx, %r8
140212c4a:     	movq	0x4(%r8), %rdx
140212c4e:     	movl	0xc(%r8), %r8d
140212c52:     	movl	%r10d, (%rcx,%rax,8)
140212c56:     	movq	%rdx, 0x4(%rcx,%rax,8)
140212c5b:     	movl	%r8d, 0xc(%rcx,%rax,8)
140212c60:     	movl	%r11d, 0x9c(%rbp)
140212c67:     	movq	0x68(%rbp), %r14
140212c6b:     	movq	0x58(%r14), %rsi
140212c6f:     	movl	%esi, %r13d
140212c72:     	notl	%r13d
140212c75:     	cmpq	0x48(%r14), %rsi
140212c79:     	jne	0x140212c84 <.text+0x211c84>
140212c7b:     	leaq	0x48(%r14), %rcx
140212c7f:     	callq	0x145774860 <.text+0x5773860>
140212c84:     	movq	0x50(%r14), %rax
140212c88:     	movq	%rsi, %rcx
140212c8b:     	shlq	$0x4, %rcx
140212c8f:     	movq	%rbx, (%rax,%rcx)
140212c93:     	movl	%ebx, %edx
140212c95:     	notl	%edx
140212c97:     	movl	0x9c(%rbp), %r8d
140212c9e:     	movl	%r8d, 0x8(%rax,%rcx)
140212ca3:     	incq	%rsi
140212ca6:     	movq	%rsi, 0x58(%r14)
140212caa:     	movl	0x90(%r14), %r9d
140212cb1:     	movl	0x94(%r14), %r10d
140212cb8:     	movq	0x60(%rbp), %rax
140212cbc:     	movq	0x8(%rax), %rax
140212cc0:     	leaq	(%rdx,%rdx,2), %rcx
140212cc4:     	movl	%r13d, (%rax,%rcx,8)
140212cc8:     	movl	%r8d, 0x4(%rax,%rcx,8)
140212ccd:     	movl	%r9d, 0x38(%rbp)
140212cd1:     	movl	%r9d, 0x8(%rax,%rcx,8)
140212cd6:     	movl	%r10d, 0x3c(%rbp)
140212cda:     	movl	%r10d, 0xc(%rax,%rcx,8)
140212cdf:     	movq	%r15, %rbx
140212ce2:     	jmp	0x140212f43 <.text+0x211f43>
140212ce7:     	movq	%rsi, 0x68(%rbp)
140212ceb:     	movl	0x48(%rbp), %r13d
140212cef:     	movq	%r15, %rbx
140212cf2:     	jmp	0x140212f43 <.text+0x211f43>
140212cf7:     	movq	0x58(%rsi), %rdx
140212cfb:     	cmpq	%rcx, %rdx
140212cfe:     	jbe	0x140213521 <.text+0x212521>
140212d04:     	movq	%r15, %r11
140212d07:     	movq	-0x48(%rbp), %r15
140212d0b:     	movq	-0x40(%rbp), %r9
140212d0f:     	movq	0x60(%rbp), %r14
140212d13:     	movq	0x108(%r14), %rbx
140212d1a:     	decq	%rdx
140212d1d:     	movq	0x50(%rsi), %rax
140212d21:     	movq	%rcx, %r8
140212d24:     	shlq	$0x4, %r8
140212d28:     	movq	%rdx, %rdi
140212d2b:     	shlq	$0x4, %rdi
140212d2f:     	movl	0x8(%rax,%r8), %r12d
140212d34:     	movups	(%rax,%rdi), %xmm0
140212d38:     	movups	%xmm0, (%rax,%r8)
140212d3d:     	movq	%rdx, 0x58(%rsi)
140212d41:     	cmpq	%rcx, %rdx
140212d44:     	je	0x140212d88 <.text+0x211d88>
140212d46:     	jbe	0x140213528 <.text+0x212528>
140212d4c:     	addq	%r8, %rax
140212d4f:     	movl	(%rax), %eax
140212d51:     	testl	%eax, %eax
140212d53:     	je	0x140212d88 <.text+0x211d88>
140212d55:     	notl	%eax
140212d57:     	cmpq	%rax, 0x10(%r14)
140212d5b:     	movq	0x8(%r14), %rcx
140212d5f:     	leaq	(%rax,%rax,2), %rax
140212d63:     	leaq	(%rcx,%rax,8), %rdx
140212d67:     	leaq	0x573987a(%rip), %r8    # 0x14594c5e8
140212d6e:     	cmovaq	%rdx, %r8
140212d72:     	movq	0x4(%r8), %rdx
140212d76:     	movl	0xc(%r8), %r8d
140212d7a:     	movl	%r10d, (%rcx,%rax,8)
140212d7e:     	movq	%rdx, 0x4(%rcx,%rax,8)
140212d83:     	movl	%r8d, 0xc(%rcx,%rax,8)
140212d88:     	movq	%rbx, 0x50(%rbp)
140212d8c:     	leaq	0x70(%rbp), %rcx
140212d90:     	movq	%r11, %rdx
140212d93:     	movl	%r12d, %r8d
140212d96:     	movq	%r9, 0x48(%rbp)
140212d9a:     	callq	0x144e5d270 <.text+0x4e5c270>
140212d9f:     	movl	0x78(%rbp), %eax
140212da2:     	movl	%eax, 0x9c(%rbp)
140212da8:     	movq	0x58(%r15), %rbx
140212dac:     	movl	%ebx, %r13d
140212daf:     	notl	%r13d
140212db2:     	cmpq	0x48(%r15), %rbx
140212db6:     	jne	0x140212dc1 <.text+0x211dc1>
140212db8:     	leaq	0x48(%r15), %rcx
140212dbc:     	callq	0x145774860 <.text+0x5773860>
140212dc1:     	movq	0x50(%r15), %rax
140212dc5:     	movq	%rbx, %rcx
140212dc8:     	shlq	$0x4, %rcx
140212dcc:     	movq	0x90(%rbp), %rdx
140212dd3:     	movq	%rdx, (%rax,%rcx)
140212dd7:     	notl	%edx
140212dd9:     	movl	0x9c(%rbp), %r8d
140212de0:     	movl	%r8d, 0x8(%rax,%rcx)
140212de5:     	incq	%rbx
140212de8:     	movq	%rbx, 0x58(%r15)
140212dec:     	movl	0x90(%r15), %r9d
140212df3:     	movq	%r15, 0x68(%rbp)
140212df7:     	movl	0x94(%r15), %r10d
140212dfe:     	movq	0x8(%r14), %rax
140212e02:     	leaq	(%rdx,%rdx,2), %rcx
140212e06:     	movl	%r13d, (%rax,%rcx,8)
140212e0a:     	movl	%r8d, 0x4(%rax,%rcx,8)
140212e0f:     	movl	%r9d, 0x38(%rbp)
140212e13:     	movl	%r9d, 0x8(%rax,%rcx,8)
140212e18:     	movl	%r10d, 0x3c(%rbp)
140212e1c:     	movl	%r10d, 0xc(%rax,%rcx,8)
140212e21:     	movl	0x70(%rbp), %eax
140212e24:     	testl	%eax, %eax
140212e26:     	movq	0x30(%rbp), %rdi
140212e2a:     	je	0x140212f3f <.text+0x211f3f>
140212e30:     	movq	0x8(%r14), %rdx
140212e34:     	notl	%eax
140212e36:     	cmpq	%rax, 0x10(%r14)
140212e3a:     	leaq	(%rax,%rax,2), %r8
140212e3e:     	leaq	(%rdx,%r8,8), %rax
140212e42:     	leaq	0x573979f(%rip), %r9    # 0x14594c5e8
140212e49:     	cmovaq	%rax, %r9
140212e4d:     	movl	(%r9), %ecx
140212e50:     	movq	0x4(%r9), %rax
140212e54:     	shrq	$0x20, %rax
140212e58:     	movl	0xc(%r9), %r9d
140212e5c:     	movl	%ecx, (%rdx,%r8,8)
140212e60:     	movl	%r12d, 0x4(%rdx,%r8,8)
140212e65:     	movl	%eax, 0x8(%rdx,%r8,8)
140212e6a:     	movl	%r9d, 0xc(%rdx,%r8,8)
140212e6f:     	notl	%ecx
140212e71:     	cmpl	%eax, 0x90(%rsi)
140212e77:     	jne	0x140212efb <.text+0x211efb>
140212e7d:     	movq	0x58(%rsi), %rdx
140212e81:     	cmpq	%rcx, %rdx
140212e84:     	jbe	0x140213536 <.text+0x212536>
140212e8a:     	shlq	$0x4, %rcx
140212e8e:     	addq	0x50(%rsi), %rcx
140212e92:     	jmp	0x140212f3b <.text+0x211f3b>
140212e97:     	movq	0x20(%rdi), %r13
140212e9b:     	shlq	$0x3, %r14
140212e9f:     	shlq	$0x3, %r12
140212ea3:     	leaq	0x70(%rbp), %rbx
140212ea7:     	jmp	0x140212ebd <.text+0x211ebd>
140212ea9:     	nopl	(%rax)
140212eb0:     	addq	$0x8, %r12
140212eb4:     	cmpq	%r12, %r14
140212eb7:     	je	0x140212bae <.text+0x211bae>
140212ebd:     	movq	(%r13,%r12), %r8
140212ec2:     	movq	0x60(%rbp), %rcx
140212ec6:     	movq	0x48(%rcx), %rax
140212eca:     	imulq	$0x130, %r8, %rdx       # imm = 0x130
140212ed1:     	movq	0x118(%rax,%rdx), %rax
140212ed9:     	testq	%rax, %rax
140212edc:     	je	0x140212eb0 <.text+0x211eb0>
140212ede:     	movq	0x90(%rbp), %rdx
140212ee5:     	movq	%rdx, 0x70(%rbp)
140212ee9:     	movq	%r8, 0x78(%rbp)
140212eed:     	movb	$0x0, 0x80(%rbp)
140212ef4:     	movq	%rbx, %rdx
140212ef7:     	callq	*%rax
140212ef9:     	jmp	0x140212eb0 <.text+0x211eb0>
140212efb:     	movq	0x68(%rbp), %r8
140212eff:     	cmpl	%eax, 0x90(%r8)
140212f06:     	jne	0x140212f16 <.text+0x211f16>
140212f08:     	movq	0x58(%r8), %rdx
140212f0c:     	cmpq	%rcx, %rdx
140212f0f:     	ja	0x140212f33 <.text+0x211f33>
140212f11:     	jmp	0x140213536 <.text+0x212536>
140212f16:     	leaq	(%rax,%rax,4), %rax
140212f1a:     	shlq	$0x5, %rax
140212f1e:     	movq	0x50(%rbp), %r8
140212f22:     	movq	0x58(%r8,%rax), %rdx
140212f27:     	cmpq	%rcx, %rdx
140212f2a:     	jbe	0x140213536 <.text+0x212536>
140212f30:     	addq	%rax, %r8
140212f33:     	shlq	$0x4, %rcx
140212f37:     	addq	0x50(%r8), %rcx
140212f3b:     	movl	%r12d, 0x8(%rcx)
140212f3f:     	movq	0x48(%rbp), %rbx
140212f43:     	movq	-0x38(%rbp), %rax
140212f47:     	movq	(%rdi), %rcx
140212f4a:     	movq	(%rax), %rax
140212f4d:     	movq	%rax, (%rbp)
140212f51:     	movq	(%rax), %rax
140212f54:     	movq	%rcx, -0x8(%rbp)
140212f58:     	movzbl	(%rcx), %ecx
140212f5b:     	movq	0x40(%rbx), %r8
140212f5f:     	cmpq	%r8, %rax
140212f62:     	movl	%r13d, 0x48(%rbp)
140212f66:     	jae	0x140212f86 <.text+0x211f86>
140212f68:     	movq	0x38(%rbx), %rdx
140212f6c:     	movq	(%rdx,%rax,8), %rdx
140212f70:     	testq	%rdx, %rdx
140212f73:     	je	0x140212f86 <.text+0x211f86>
140212f75:     	notq	%rdx
140212f78:     	leaq	(%rdx,%rdx,2), %r14
140212f7c:     	shlq	$0x4, %r14
140212f80:     	addq	0x18(%rbx), %r14
140212f84:     	jmp	0x140212f89 <.text+0x211f89>
140212f86:     	xorl	%r14d, %r14d
140212f89:     	movq	0x18(%rdi), %rsi
140212f8d:     	leaq	0x9b(%rbp), %r15
140212f94:     	movq	0x10(%rdi), %r12
140212f98:     	movl	-0x10(%rbp), %r13d
140212f9c:     	testb	%cl, %cl
140212f9e:     	movq	%rbx, 0x50(%rbp)
140212fa2:     	movq	%r8, %rdi
140212fa5:     	je	0x140212fe2 <.text+0x211fe2>
140212fa7:     	testb	$0x1, 0x8c(%rbp)
140212fae:     	je	0x14021300d <.text+0x21200d>
140212fb0:     	cmpq	%r8, %rax
140212fb3:     	jae	0x140213034 <.text+0x212034>
140212fb5:     	movq	0x38(%rbx), %rcx
140212fb9:     	movq	(%rcx,%rax,8), %rax
140212fbd:     	testq	%rax, %rax
140212fc0:     	je	0x140213034 <.text+0x212034>
140212fc2:     	movq	0x18(%rbx), %rcx
140212fc6:     	notq	%rax
140212fc9:     	leaq	(%rax,%rax,2), %rax
140212fcd:     	shlq	$0x4, %rax
140212fd1:     	movq	0x18(%rcx,%rax), %rax
140212fd6:     	testq	%rax, %rax
140212fd9:     	je	0x140213034 <.text+0x212034>
140212fdb:     	movq	%r15, %rcx
140212fde:     	callq	*%rax
140212fe0:     	jmp	0x140213031 <.text+0x212031>
140212fe2:     	movl	0x9c(%rbp), %eax
140212fe8:     	movl	%eax, %ebx
140212fea:     	notl	%ebx
140212fec:     	movq	0x8(%r14), %r8
140212ff0:     	movq	%r8, %rcx
140212ff3:     	imulq	%rbx, %rcx
140212ff7:     	addq	0x10(%r14), %rcx
140212ffb:     	movq	%r15, %rdx
140212ffe:     	callq	0x1457731e1 <.text+0x57721e1>
140213003:     	movq	0x20(%r14), %rax
140213007:     	movl	%r13d, (%rax,%rbx,4)
14021300b:     	jmp	0x140213025 <.text+0x212025>
14021300d:     	movl	0x9c(%rbp), %eax
140213013:     	movl	%eax, %ebx
140213015:     	notl	%ebx
140213017:     	movq	%r14, %rcx
14021301a:     	movq	%rbx, %rdx
14021301d:     	movq	%r15, %r8
140213020:     	callq	0x144e73fa0 <.text+0x4e72fa0>
140213025:     	movq	0x28(%r14), %rax
140213029:     	movl	%r13d, (%rax,%rbx,4)
14021302d:     	movq	0x50(%rbp), %rbx
140213031:     	movq	%rdi, %r8
140213034:     	movq	(%rbp), %rax
140213038:     	movq	0x8(%rax), %rax
14021303c:     	movq	-0x8(%rbp), %rcx
140213040:     	movzbl	0x1(%rcx), %ecx
140213044:     	cmpq	%r8, %rax
140213047:     	jae	0x140213098 <.text+0x212098>
140213049:     	movq	0x38(%rbx), %rdx
14021304d:     	movq	(%rdx,%rax,8), %rdx
140213051:     	testq	%rdx, %rdx
140213054:     	je	0x140213098 <.text+0x212098>
140213056:     	notq	%rdx
140213059:     	leaq	(%rdx,%rdx,2), %r14
14021305d:     	shlq	$0x4, %r14
140213061:     	addq	0x18(%rbx), %r14
140213065:     	testb	%cl, %cl
140213067:     	jne	0x14021309f <.text+0x21209f>
140213069:     	movl	0x9c(%rbp), %eax
14021306f:     	movl	%eax, %ebx
140213071:     	notl	%ebx
140213073:     	movq	0x8(%r14), %r8
140213077:     	movq	%r8, %rcx
14021307a:     	imulq	%rbx, %rcx
14021307e:     	addq	0x10(%r14), %rcx
140213082:     	leaq	0x9a(%rbp), %rdx
140213089:     	callq	0x1457731e1 <.text+0x57721e1>
14021308e:     	movq	0x20(%r14), %rax
140213092:     	movl	%r13d, (%rax,%rbx,4)
140213096:     	jmp	0x1402130fa <.text+0x2120fa>
140213098:     	xorl	%r14d, %r14d
14021309b:     	testb	%cl, %cl
14021309d:     	je	0x140213069 <.text+0x212069>
14021309f:     	testb	$0x1, 0x8c(%rbp)
1402130a6:     	je	0x1402130de <.text+0x2120de>
1402130a8:     	cmpq	%r8, %rax
1402130ab:     	jae	0x140213109 <.text+0x212109>
1402130ad:     	movq	0x38(%rbx), %rcx
1402130b1:     	movq	(%rcx,%rax,8), %rax
1402130b5:     	testq	%rax, %rax
1402130b8:     	je	0x140213109 <.text+0x212109>
1402130ba:     	movq	0x18(%rbx), %rcx
1402130be:     	notq	%rax
1402130c1:     	leaq	(%rax,%rax,2), %rax
1402130c5:     	shlq	$0x4, %rax
1402130c9:     	movq	0x18(%rcx,%rax), %rax
1402130ce:     	testq	%rax, %rax
1402130d1:     	je	0x140213109 <.text+0x212109>
1402130d3:     	leaq	0x9a(%rbp), %rcx
1402130da:     	callq	*%rax
1402130dc:     	jmp	0x140213106 <.text+0x212106>
1402130de:     	movl	0x9c(%rbp), %eax
1402130e4:     	movl	%eax, %ebx
1402130e6:     	notl	%ebx
1402130e8:     	leaq	0x9a(%rbp), %r8
1402130ef:     	movq	%r14, %rcx
1402130f2:     	movq	%rbx, %rdx
1402130f5:     	callq	0x144e73fa0 <.text+0x4e72fa0>
1402130fa:     	movq	0x28(%r14), %rax
1402130fe:     	movl	%r13d, (%rax,%rbx,4)
140213102:     	movq	0x50(%rbp), %rbx
140213106:     	movq	%rdi, %r8
140213109:     	movq	(%rbp), %rax
14021310d:     	movq	0x10(%rax), %rax
140213111:     	movq	-0x8(%rbp), %rcx
140213115:     	movzbl	0x2(%rcx), %ecx
140213119:     	cmpq	%r8, %rax
14021311c:     	jae	0x140213169 <.text+0x212169>
14021311e:     	movq	0x38(%rbx), %rdx
140213122:     	movq	(%rdx,%rax,8), %rdx
140213126:     	testq	%rdx, %rdx
140213129:     	je	0x140213169 <.text+0x212169>
14021312b:     	notq	%rdx
14021312e:     	leaq	(%rdx,%rdx,2), %r14
140213132:     	shlq	$0x4, %r14
140213136:     	addq	0x18(%rbx), %r14
14021313a:     	testb	%cl, %cl
14021313c:     	jne	0x140213170 <.text+0x212170>
14021313e:     	movl	0x9c(%rbp), %eax
140213144:     	movl	%eax, %ebx
140213146:     	notl	%ebx
140213148:     	movq	0x8(%r14), %r8
14021314c:     	movq	%r8, %rcx
14021314f:     	imulq	%rbx, %rcx
140213153:     	addq	0x10(%r14), %rcx
140213157:     	movq	%r15, %rdx
14021315a:     	callq	0x1457731e1 <.text+0x57721e1>
14021315f:     	movq	0x20(%r14), %rax
140213163:     	movl	%r13d, (%rax,%rbx,4)
140213167:     	jmp	0x1402131cb <.text+0x2121cb>
140213169:     	xorl	%r14d, %r14d
14021316c:     	testb	%cl, %cl
14021316e:     	je	0x14021313e <.text+0x21213e>
140213170:     	testb	$0x1, 0x8c(%rbp)
140213177:     	je	0x1402131b3 <.text+0x2121b3>
140213179:     	cmpq	%r8, %rax
14021317c:     	jae	0x1402131d3 <.text+0x2121d3>
14021317e:     	movq	0x50(%rbp), %rcx
140213182:     	movq	0x38(%rcx), %rcx
140213186:     	movq	(%rcx,%rax,8), %rax
14021318a:     	testq	%rax, %rax
14021318d:     	je	0x1402131d3 <.text+0x2121d3>
14021318f:     	movq	0x50(%rbp), %rcx
140213193:     	movq	0x18(%rcx), %rcx
140213197:     	notq	%rax
14021319a:     	leaq	(%rax,%rax,2), %rax
14021319e:     	shlq	$0x4, %rax
1402131a2:     	movq	0x18(%rcx,%rax), %rax
1402131a7:     	testq	%rax, %rax
1402131aa:     	je	0x1402131d3 <.text+0x2121d3>
1402131ac:     	movq	%r15, %rcx
1402131af:     	callq	*%rax
1402131b1:     	jmp	0x1402131d3 <.text+0x2121d3>
1402131b3:     	movl	0x9c(%rbp), %eax
1402131b9:     	movl	%eax, %ebx
1402131bb:     	notl	%ebx
1402131bd:     	movq	%r14, %rcx
1402131c0:     	movq	%rbx, %rdx
1402131c3:     	movq	%r15, %r8
1402131c6:     	callq	0x144e73fa0 <.text+0x4e72fa0>
1402131cb:     	movq	0x28(%r14), %rax
1402131cf:     	movl	%r13d, (%rax,%rbx,4)
1402131d3:     	testq	%rsi, %rsi
1402131d6:     	movq	0x90(%rbp), %r14
1402131dd:     	movl	0x9c(%rbp), %r15d
1402131e4:     	movq	0x50(%rbp), %rdi
1402131e8:     	je	0x140213225 <.text+0x212225>
1402131ea:     	movq	0x60(%rbp), %rax
1402131ee:     	leaq	0x158(%rax), %rbx
1402131f5:     	shlq	$0x4, %rsi
1402131f9:     	nopl	(%rax)
140213200:     	movq	%r14, 0x28(%rsp)
140213205:     	movl	%r15d, 0x20(%rsp)
14021320a:     	movq	%r12, %rcx
14021320d:     	movq	%rdi, %rdx
140213210:     	movq	%rbx, %r8
140213213:     	movl	%r13d, %r9d
140213216:     	callq	0x144e998e0 <.text+0x4e988e0>
14021321b:     	addq	$0x10, %r12
14021321f:     	addq	$-0x10, %rsi
140213223:     	jne	0x140213200 <.text+0x212200>
140213225:     	movq	0x68(%rbp), %r15
140213229:     	movl	0x98(%r15), %eax
140213230:     	testb	$0x1, %al
140213232:     	jne	0x140213249 <.text+0x212249>
140213234:     	movq	0x8(%rbp), %r12
140213238:     	movl	0x48(%rbp), %r13d
14021323c:     	movq	0x30(%rbp), %rbx
140213240:     	movq	0x60(%rbp), %rdi
140213244:     	jmp	0x1402132db <.text+0x2122db>
140213249:     	movq	0x30(%rbp), %rbx
14021324d:     	movq	0x30(%rbx), %rsi
140213251:     	testq	%rsi, %rsi
140213254:     	movq	0x8(%rbp), %r12
140213258:     	movl	0x48(%rbp), %r13d
14021325c:     	movq	0x60(%rbp), %rdi
140213260:     	je	0x1402132db <.text+0x2122db>
140213262:     	movq	0x20(%rbx), %r14
140213266:     	shlq	$0x3, %rsi
14021326a:     	xorl	%r15d, %r15d
14021326d:     	leaq	0x70(%rbp), %rbx
140213271:     	jmp	0x140213289 <.text+0x212289>
140213273:     	nopw	%cs:(%rax,%rax)
140213280:     	addq	$0x8, %r15
140213284:     	cmpq	%r15, %rsi
140213287:     	je	0x1402132c5 <.text+0x2122c5>
140213289:     	movq	(%r14,%r15), %rcx
14021328d:     	movq	0x48(%rdi), %rax
140213291:     	imulq	$0x130, %rcx, %rdx      # imm = 0x130
140213298:     	movq	0x108(%rax,%rdx), %rax
1402132a0:     	testq	%rax, %rax
1402132a3:     	je	0x140213280 <.text+0x212280>
1402132a5:     	movq	0x90(%rbp), %rdx
1402132ac:     	movq	%rdx, 0x70(%rbp)
1402132b0:     	movq	%rcx, 0x78(%rbp)
1402132b4:     	movb	$0x0, 0x80(%rbp)
1402132bb:     	movq	%rdi, %rcx
1402132be:     	movq	%rbx, %rdx
1402132c1:     	callq	*%rax
1402132c3:     	jmp	0x140213280 <.text+0x212280>
1402132c5:     	movq	0x68(%rbp), %r15
1402132c9:     	movl	0x98(%r15), %eax
1402132d0:     	movq	0x90(%rbp), %r14
1402132d7:     	movq	0x30(%rbp), %rbx
1402132db:     	testb	$0x20, %al
1402132dd:     	je	0x14021332f <.text+0x21232f>
1402132df:     	movq	%r14, 0x58(%rbp)
1402132e3:     	movq	0x20(%rbx), %rax
1402132e7:     	movq	0x30(%rbx), %rcx
1402132eb:     	movq	%rax, 0x70(%rbp)
1402132ef:     	movq	%rcx, 0x78(%rbp)
1402132f3:     	leaq	0x388(%rdi), %rcx
1402132fa:     	xorl	%edx, %edx
1402132fc:     	callq	0x144e14720 <.text+0x4e13720>
140213301:     	testq	%rax, %rax
140213304:     	je	0x14021332f <.text+0x21232f>
140213306:     	movq	$0x0, 0x40(%rbp)
14021330e:     	leaq	0x40(%rbp), %rcx
140213312:     	movq	%rcx, 0x28(%rsp)
140213317:     	movq	%r14, 0x20(%rsp)
14021331c:     	leaq	0x70(%rbp), %rcx
140213320:     	leaq	0x58(%rbp), %r9
140213324:     	movq	%rdi, %rdx
140213327:     	movq	%rax, %r8
14021332a:     	callq	0x144e8adb0 <.text+0x4e89db0>
14021332f:     	testb	$0x1, 0x8c(%rbp)
140213336:     	je	0x1402133b9 <.text+0x2123b9>
14021333c:     	movl	0x98(%r15), %eax
140213343:     	testb	$0x2, %al
140213345:     	je	0x14021344a <.text+0x21244a>
14021334b:     	movq	0x30(%rbx), %rsi
14021334f:     	testq	%rsi, %rsi
140213352:     	je	0x14021344a <.text+0x21244a>
140213358:     	movq	0x20(%rbx), %r14
14021335c:     	shlq	$0x3, %rsi
140213360:     	xorl	%r15d, %r15d
140213363:     	leaq	0x70(%rbp), %rbx
140213367:     	jmp	0x14021337d <.text+0x21237d>
140213369:     	nopl	(%rax)
140213370:     	addq	$0x8, %r15
140213374:     	cmpq	%r15, %rsi
140213377:     	je	0x140213435 <.text+0x212435>
14021337d:     	movq	(%r14,%r15), %rcx
140213381:     	movq	0x48(%rdi), %rax
140213385:     	imulq	$0x130, %rcx, %rdx      # imm = 0x130
14021338c:     	movq	0x110(%rax,%rdx), %rax
140213394:     	testq	%rax, %rax
140213397:     	je	0x140213370 <.text+0x212370>
140213399:     	movq	0x90(%rbp), %rdx
1402133a0:     	movq	%rdx, 0x70(%rbp)
1402133a4:     	movq	%rcx, 0x78(%rbp)
1402133a8:     	movb	$0x0, 0x80(%rbp)
1402133af:     	movq	%rdi, %rcx
1402133b2:     	movq	%rbx, %rdx
1402133b5:     	callq	*%rax
1402133b7:     	jmp	0x140213370 <.text+0x212370>
1402133b9:     	movl	0x98(%r15), %eax
1402133c0:     	testb	$0x2, %al
1402133c2:     	je	0x140213479 <.text+0x212479>
1402133c8:     	movq	0x28(%rbx), %rsi
1402133cc:     	testq	%rsi, %rsi
1402133cf:     	je	0x140213479 <.text+0x212479>
1402133d5:     	movq	0x20(%rbx), %r14
1402133d9:     	shlq	$0x3, %rsi
1402133dd:     	xorl	%r15d, %r15d
1402133e0:     	leaq	0x70(%rbp), %rbx
1402133e4:     	jmp	0x1402133f9 <.text+0x2123f9>
1402133e6:     	nopw	%cs:(%rax,%rax)
1402133f0:     	addq	$0x8, %r15
1402133f4:     	cmpq	%r15, %rsi
1402133f7:     	je	0x140213464 <.text+0x212464>
1402133f9:     	movq	(%r14,%r15), %rcx
1402133fd:     	movq	0x48(%rdi), %rax
140213401:     	imulq	$0x130, %rcx, %rdx      # imm = 0x130
140213408:     	movq	0x110(%rax,%rdx), %rax
140213410:     	testq	%rax, %rax
140213413:     	je	0x1402133f0 <.text+0x2123f0>
140213415:     	movq	0x90(%rbp), %rdx
14021341c:     	movq	%rdx, 0x70(%rbp)
140213420:     	movq	%rcx, 0x78(%rbp)
140213424:     	movb	$0x0, 0x80(%rbp)
14021342b:     	movq	%rdi, %rcx
14021342e:     	movq	%rbx, %rdx
140213431:     	callq	*%rax
140213433:     	jmp	0x1402133f0 <.text+0x2123f0>
140213435:     	movq	0x68(%rbp), %rax
140213439:     	movl	0x98(%rax), %eax
14021343f:     	movq	0x90(%rbp), %r14
140213446:     	movq	0x30(%rbp), %rbx
14021344a:     	testb	$0x40, %al
14021344c:     	je	0x1402134c8 <.text+0x2124c8>
14021344e:     	movq	%r14, 0x58(%rbp)
140213452:     	movq	0x20(%rbx), %rax
140213456:     	movq	0x30(%rbx), %rcx
14021345a:     	movq	%rax, 0x70(%rbp)
14021345e:     	movq	%rcx, 0x78(%rbp)
140213462:     	jmp	0x140213489 <.text+0x212489>
140213464:     	movq	0x68(%rbp), %rax
140213468:     	movl	0x98(%rax), %eax
14021346e:     	movq	0x90(%rbp), %r14
140213475:     	movq	0x30(%rbp), %rbx
140213479:     	testb	$0x40, %al
14021347b:     	je	0x1402134c8 <.text+0x2124c8>
14021347d:     	movq	%r14, 0x58(%rbp)
140213481:     	movups	0x20(%rbx), %xmm0
140213485:     	movups	%xmm0, 0x70(%rbp)
140213489:     	leaq	0x388(%rdi), %rcx
140213490:     	movl	$0x1, %edx
140213495:     	callq	0x144e14720 <.text+0x4e13720>
14021349a:     	testq	%rax, %rax
14021349d:     	je	0x1402134c8 <.text+0x2124c8>
14021349f:     	movq	$0x1, 0x40(%rbp)
1402134a7:     	leaq	0x40(%rbp), %rcx
1402134ab:     	movq	%rcx, 0x28(%rsp)
1402134b0:     	movq	%r14, 0x20(%rsp)
1402134b5:     	leaq	0x70(%rbp), %rcx
1402134b9:     	leaq	0x58(%rbp), %r9
1402134bd:     	movq	%rdi, %rdx
1402134c0:     	movq	%rax, %r8
1402134c3:     	callq	0x144e8adb0 <.text+0x4e89db0>
1402134c8:     	movl	%r13d, 0x20(%rbp)
1402134cc:     	movl	0x9c(%rbp), %eax
1402134d2:     	movl	%eax, 0x24(%rbp)
1402134d5:     	movl	0x38(%rbp), %eax
1402134d8:     	movl	%eax, 0x28(%rbp)
1402134db:     	movl	0x3c(%rbp), %eax
1402134de:     	movl	%eax, 0x2c(%rbp)
1402134e1:     	movq	%r12, %rcx
1402134e4:     	callq	0x144e89050 <.text+0x4e88050>
1402134e9:     	movq	%r12, %rcx
1402134ec:     	callq	0x144e89000 <.text+0x4e88000>
1402134f1:     	leaq	0x10(%rbp), %rcx
1402134f5:     	callq	0x144e731e0 <.text+0x4e721e0>
1402134fa:     	nop
1402134fb:     	addq	$0x128, %rsp            # imm = 0x128
140213502:     	popq	%rbx
140213503:     	popq	%rdi
140213504:     	popq	%rsi
140213505:     	popq	%r12
140213507:     	popq	%r13
140213509:     	popq	%r14
14021350b:     	popq	%r15
14021350d:     	popq	%rbp
14021350e:     	retq
14021350f:     	leaq	0x573839a(%rip), %rdx   # 0x14594b8b0
140213516:     	leaq	0x10(%rbp), %rcx
14021351a:     	callq	0x1458c9fc0 <.text+0x58c8fc0>
14021351f:     	ud2
140213521:     	callq	0x145903824 <.text+0x5902824>
140213526:     	ud2
140213528:     	leaq	0x5739029(%rip), %r8    # 0x14594c558
14021352f:     	callq	0x145903b33 <.text+0x5902b33>
140213534:     	ud2
140213536:     	leaq	0x573825b(%rip), %r8    # 0x14594b798
14021353d:     	callq	0x145903b33 <.text+0x5902b33>
140213542:     	ud2
