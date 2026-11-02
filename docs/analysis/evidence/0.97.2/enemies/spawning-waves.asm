
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a792f:     	movq	0x368(%rbp), %r13
1454a7936:     	movss	0x8e4(%r13), %xmm0
1454a793f:     	ucomiss	0x924(%r13), %xmm0
1454a7947:     	jb	0x1454a7c18 <.text+0x54a6c18>
1454a794d:     	movq	%rdi, 0xa0(%rbp)
1454a7954:     	movq	0x318(%rbp), %rax
1454a795b:     	movq	%rax, 0xa8(%rbp)
1454a7962:     	movq	$0x0, 0xb0(%rbp)
1454a796d:     	leaq	0x68(%rbp), %rax
1454a7971:     	movq	%rax, 0xb8(%rbp)
1454a7978:     	leaq	0x230(%rbp), %rcx
1454a797f:     	leaq	0xa0(%rbp), %rdx
1454a7986:     	callq	0x14552f110 <.text+0x552e110>
1454a798b:     	nop
1454a798c:     	movq	%r13, %rax
1454a798f:     	movq	0x238(%rbp), %rcx
1454a7996:     	movq	%rcx, 0x318(%rbp)
1454a799d:     	movq	0x240(%rbp), %r8
1454a79a4:     	cmpq	$0x1, %r8
1454a79a8:     	movq	%r8, %r9
1454a79ab:     	adcq	$0x0, %r9
1454a79af:     	bsrq	%r9, %rcx
1454a79b3:     	notl	%ecx
1454a79b5:     	movq	%r9, %r10
1454a79b8:     	shlq	%cl, %r10
1454a79bb:     	decq	%r10
1454a79be:     	movq	0x880(%r13), %rbx
1454a79c5:     	movq	0x888(%r13), %rcx
1454a79cc:     	movq	0x898(%r13), %r13
1454a79d3:     	movq	0x890(%rax), %r11
1454a79da:     	nopw	(%rax,%rax)
1454a79e0:     	leaq	(%rbx,%r13), %rax
1454a79e4:     	rolq	$0x17, %rax
1454a79e8:     	addq	%rbx, %rax
1454a79eb:     	movq	%rcx, %rsi
1454a79ee:     	shlq	$0x11, %rsi
1454a79f2:     	xorq	%rbx, %r11
1454a79f5:     	xorq	%rcx, %r13
1454a79f8:     	xorq	%r13, %rbx
1454a79fb:     	rolq	$0x2d, %r13
1454a79ff:     	xorq	%r11, %rcx
1454a7a02:     	mulq	%r9
1454a7a05:     	xorq	%rsi, %r11
1454a7a08:     	cmpq	%rax, %r10
1454a7a0b:     	jb	0x1454a79e0 <.text+0x54a69e0>
1454a7a0d:     	movq	0x368(%rbp), %rax
1454a7a14:     	movq	%rbx, 0x880(%rax)
1454a7a1b:     	movq	%r13, 0x898(%rax)
1454a7a22:     	movq	%rax, %r13
1454a7a25:     	movq	%rcx, 0x888(%rax)
1454a7a2c:     	movq	%r11, 0x890(%rax)
1454a7a33:     	cmpq	$0x1, %r8
1454a7a37:     	movq	%r8, %rax
1454a7a3a:     	adcq	$-0x1, %rax
1454a7a3e:     	cmpq	%rdx, %rax
1454a7a41:     	cmovaeq	%rdx, %rax
1454a7a45:     	cmpq	%r8, %rax
1454a7a48:     	jae	0x1454a7bba <.text+0x54a6bba>
1454a7a4e:     	movq	0x318(%rbp), %rcx
1454a7a55:     	movq	(%rcx,%rax,8), %rbx
1454a7a59:     	movl	$0x0, 0xa0(%rbp)
1454a7a63:     	leaq	0xa0(%rbp), %r8
1454a7a6a:     	movq	%r13, %rcx
1454a7a6d:     	movq	%rbx, %rdx
1454a7a70:     	callq	0x1454c2040 <.text+0x54c1040>
1454a7a75:     	nop
1454a7a76:     	movq	0x348(%rbp), %rdx
1454a7a7d:     	cmpq	%rdx, %rbx
1454a7a80:     	jae	0x1454aaef4 <.text+0x54a9ef4>
1454a7a86:     	leaq	(%rbx,%rbx,4), %rsi
1454a7a8a:     	shlq	$0x4, %rsi
1454a7a8e:     	leaq	(%rdi,%rsi), %rax
1454a7a92:     	addq	$0x20, %rax
1454a7a96:     	movq	%rax, 0x2d8(%rbp)
1454a7a9d:     	leaq	0x27659c(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a7aa4:     	movq	%rax, 0x2e0(%rbp)
1454a7aab:     	leaq	0x1266eb4(%rip), %rdx   # 0x14670e966
1454a7ab2:     	leaq	0xa0(%rbp), %rcx
1454a7ab9:     	leaq	0x2d8(%rbp), %r8
1454a7ac0:     	callq	0x14570bf80 <.text+0x570af80>
1454a7ac5:     	nop
1454a7ac6:     	addq	%rsi, %rdi
1454a7ac9:     	movq	0xa8(%rbp), %rcx
1454a7ad0:     	movq	0xb0(%rbp), %rdx
1454a7ad7:     	movq	0x10(%rdi), %rbx
1454a7adb:     	movq	0x18(%rdi), %rax
1454a7adf:     	movq	%rax, 0x348(%rbp)
1454a7ae6:     	movq	%rcx, 0x310(%rbp)
1454a7aed:     	callq	0x145452400 <.text+0x5451400>
1454a7af2:     	nop
1454a7af3:     	movq	%rax, %rsi
1454a7af6:     	movq	%rdx, %r15
1454a7af9:     	movq	0xa0(%rbp), %rdx
1454a7b00:     	testq	%rdx, %rdx
1454a7b03:     	je	0x1454a7b18 <.text+0x54a6b18>
1454a7b05:     	movl	$0x1, %r8d
1454a7b0b:     	movq	0x310(%rbp), %rcx
1454a7b12:     	callq	0x1400021d0 <.text+0x11d0>
1454a7b17:     	nop
1454a7b18:     	leaq	0x1503cf1(%rip), %rdi   # 0x1469ab810
1454a7b1f:     	movl	$0xe, %edx
1454a7b24:     	movq	%rdi, %rcx
1454a7b27:     	callq	0x145452400 <.text+0x5451400>
1454a7b2c:     	nop
1454a7b2d:     	movq	0x368(%rbp), %r13
1454a7b34:     	testq	%rsi, %rsi
1454a7b37:     	cmoveq	0x348(%rbp), %r15
1454a7b3f:     	cmovneq	%rsi, %rbx
1454a7b43:     	testq	%rax, %rax
1454a7b46:     	cmovneq	%rax, %rdi
1454a7b4a:     	movl	$0xe, %eax
1454a7b4f:     	cmoveq	%rax, %rdx
1454a7b53:     	movq	%rdx, 0x20(%rsp)
1454a7b58:     	leaq	0xa0(%rbp), %rcx
1454a7b5f:     	movq	%rbx, %rdx
1454a7b62:     	movq	%r15, %r8
1454a7b65:     	movq	%rdi, %r9
1454a7b68:     	callq	0x14543f640 <.text+0x543e640>
1454a7b6d:     	nop
1454a7b6e:     	movq	0x548(%r13), %rsi
1454a7b75:     	cmpq	0x538(%r13), %rsi
1454a7b7c:     	jne	0x1454a7b8b <.text+0x54a6b8b>
1454a7b7e:     	movq	0x340(%rbp), %rcx
1454a7b85:     	callq	0x1457580b0 <.text+0x57570b0>
1454a7b8a:     	nop
1454a7b8b:     	movq	0x540(%r13), %rax
1454a7b92:     	movq	%rsi, %rcx
1454a7b95:     	shlq	$0x5, %rcx
1454a7b99:     	movups	0xa0(%rbp), %xmm0
1454a7ba0:     	movups	0xb0(%rbp), %xmm1
1454a7ba7:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a7bac:     	movups	%xmm0, (%rax,%rcx)
1454a7bb0:     	incq	%rsi
1454a7bb3:     	movq	%rsi, 0x548(%r13)
1454a7bba:     	movss	0x8e4(%r13), %xmm0
1454a7bc3:     	movss	0x68(%rbp), %xmm1
1454a7bc8:     	mulss	0x51fe54(%rip), %xmm1   # 0x1459c7a24
1454a7bd0:     	addss	0x569b94(%rip), %xmm1   # 0x145a1176c
1454a7bd8:     	maxss	0x51fdbc(%rip), %xmm1   # 0x1459c799c
1454a7be0:     	addss	%xmm0, %xmm1
1454a7be4:     	movss	%xmm1, 0x924(%r13)
1454a7bed:     	movq	0x230(%rbp), %rdx
1454a7bf4:     	testq	%rdx, %rdx
1454a7bf7:     	je	0x1454a7c18 <.text+0x54a6c18>
1454a7bf9:     	shlq	$0x3, %rdx
1454a7bfd:     	movl	$0x8, %r8d
1454a7c03:     	movq	0x318(%rbp), %rcx
1454a7c0a:     	callq	0x1400021d0 <.text+0x11d0>
1454a7c0f:     	movss	0x8e4(%r13), %xmm0
1454a7c18:     	ucomiss	0x914(%r13), %xmm0
1454a7c20:     	jb	0x1454a92bd <.text+0x54a82bd>
1454a7c26:     	movss	0x68(%rbp), %xmm6
1454a7c2b:     	testq	%r14, %r14
1454a7c2e:     	je	0x1454a9298 <.text+0x54a8298>
1454a7c34:     	leaq	0x95e(%r13), %rax
1454a7c3b:     	movq	$0x0, 0xa8(%rbp)
1454a7c46:     	movq	$0x4, 0xb0(%rbp)
1454a7c51:     	movl	$0x3020100, 0xb8(%rbp)  # imm = 0x3020100
1454a7c5b:     	movq	%rax, 0xa0(%rbp)
1454a7c62:     	leaq	0x2d8(%rbp), %rcx
1454a7c69:     	leaq	0xa0(%rbp), %rdx
1454a7c70:     	callq	0x145529990 <.text+0x5528990>
1454a7c75:     	nop
1454a7c76:     	movq	0x2e8(%rbp), %r9
1454a7c7d:     	testq	%r9, %r9
1454a7c80:     	je	0x1454aa9bc <.text+0x54a99bc>
1454a7c86:     	bsrq	%r9, %rcx
1454a7c8a:     	notl	%ecx
1454a7c8c:     	movq	%r9, %r8
1454a7c8f:     	shlq	%cl, %r8
1454a7c92:     	decq	%r8
1454a7c95:     	movq	0x368(%rbp), %r13
1454a7c9c:     	movq	0x880(%r13), %r11
1454a7ca3:     	movq	0x888(%r13), %rcx
1454a7caa:     	movq	0x898(%r13), %rdi
1454a7cb1:     	movq	0x890(%r13), %r10
1454a7cb8:     	nopl	(%rax,%rax)
1454a7cc0:     	leaq	(%r11,%rdi), %rax
1454a7cc4:     	rolq	$0x17, %rax
1454a7cc8:     	addq	%r11, %rax
1454a7ccb:     	movq	%rcx, %rsi
1454a7cce:     	shlq	$0x11, %rsi
1454a7cd2:     	xorq	%r11, %r10
1454a7cd5:     	xorq	%rcx, %rdi
1454a7cd8:     	xorq	%rdi, %r11
1454a7cdb:     	rolq	$0x2d, %rdi
1454a7cdf:     	xorq	%r10, %rcx
1454a7ce2:     	mulq	%r9
1454a7ce5:     	xorq	%rsi, %r10
1454a7ce8:     	cmpq	%rax, %r8
1454a7ceb:     	jb	0x1454a7cc0 <.text+0x54a6cc0>
1454a7ced:     	movq	%r11, 0x880(%r13)
1454a7cf4:     	movq	%rdi, 0x898(%r13)
1454a7cfb:     	movq	%rcx, 0x888(%r13)
1454a7d02:     	movq	%r10, 0x890(%r13)
1454a7d09:     	cmpq	%rdx, %r9
1454a7d0c:     	jbe	0x1454aaea8 <.text+0x54a9ea8>
1454a7d12:     	movq	0x2e0(%rbp), %rax
1454a7d19:     	movq	%rax, 0x298(%rbp)
1454a7d20:     	movzbl	(%rax,%rdx), %edi
1454a7d24:     	movb	%dil, 0x95e(%r13)
1454a7d2b:     	movq	0x210(%r13), %rcx
1454a7d32:     	movq	0x218(%r13), %rdx
1454a7d39:     	callq	0x14540e820 <.text+0x540d820>
1454a7d3e:     	imulq	$0xf0, %rax, %rax
1454a7d45:     	movzwl	0x230(%r13), %r15d
1454a7d4d:     	movq	0x358(%rbp), %r8
1454a7d54:     	leaq	(%r8,%r14,8), %rcx
1454a7d58:     	movq	0x78(%rax,%r12), %rdx
1454a7d5d:     	movq	0x80(%rax,%r12), %rsi
1454a7d65:     	movq	%r8, 0xa0(%rbp)
1454a7d6c:     	movq	%rcx, 0xa8(%rbp)
1454a7d73:     	movq	%rdx, 0x290(%rbp)
1454a7d7a:     	movq	%rdx, 0xb0(%rbp)
1454a7d81:     	movq	%rsi, 0xb8(%rbp)
1454a7d88:     	leaq	0x230(%rbp), %rcx
1454a7d8f:     	leaq	0xa0(%rbp), %rdx
1454a7d96:     	callq	0x14552f4d0 <.text+0x552e4d0>
1454a7d9b:     	nop
1454a7d9c:     	movq	0x240(%rbp), %r9
1454a7da3:     	testq	%r9, %r9
1454a7da6:     	je	0x1454a7dd6 <.text+0x54a6dd6>
1454a7da8:     	movl	%edi, 0x318(%rbp)
1454a7dae:     	movq	%rsi, 0x80(%rbp)
1454a7db5:     	movq	0x230(%rbp), %rax
1454a7dbc:     	movq	%rax, 0x228(%rbp)
1454a7dc3:     	movq	0x238(%rbp), %rax
1454a7dca:     	movq	%rax, 0x328(%rbp)
1454a7dd1:     	jmp	0x1454a7e80 <.text+0x54a6e80>
1454a7dd6:     	leaq	(,%r14,8), %rbx
1454a7dde:     	movq	%r14, %rax
1454a7de1:     	shrq	$0x3d, %rax
1454a7de5:     	setne	%al
1454a7de8:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454a7df2:     	cmpq	%rcx, %rbx
1454a7df5:     	seta	%cl
1454a7df8:     	orb	%al, %cl
1454a7dfa:     	je	0x1454a7e0f <.text+0x54a6e0f>
1454a7dfc:     	xorl	%edi, %edi
1454a7dfe:     	movq	%rdi, %rcx
1454a7e01:     	movq	%rbx, %rdx
1454a7e04:     	callq	0x1458e721b <.text+0x58e621b>
1454a7e09:     	nop
1454a7e0a:     	jmp	0x1454aaf58 <.text+0x54a9f58>
1454a7e0f:     	movl	%edi, 0x318(%rbp)
1454a7e15:     	movq	%rsi, 0x80(%rbp)
1454a7e1c:     	callq	0x140002200 <.text+0x1200>
1454a7e21:     	movl	$0x8, %edi
1454a7e26:     	movl	$0x8, %edx
1454a7e2b:     	movq	%rbx, %rcx
1454a7e2e:     	callq	0x1400021c0 <.text+0x11c0>
1454a7e33:     	testq	%rax, %rax
1454a7e36:     	je	0x1454a7dfe <.text+0x54a6dfe>
1454a7e38:     	movq	%rax, %rsi
1454a7e3b:     	movq	%rax, %rcx
1454a7e3e:     	movq	0x358(%rbp), %rdx
1454a7e45:     	movq	%rbx, %r8
1454a7e48:     	callq	0x145756ddd <.text+0x5755ddd>
1454a7e4d:     	movq	0x230(%rbp), %rdx
1454a7e54:     	testq	%rdx, %rdx
1454a7e57:     	movq	%rsi, 0x328(%rbp)
1454a7e5e:     	je	0x1454a7e76 <.text+0x54a6e76>
1454a7e60:     	movq	0x238(%rbp), %rcx
1454a7e67:     	shlq	$0x3, %rdx
1454a7e6b:     	movl	$0x8, %r8d
1454a7e71:     	callq	0x1400021d0 <.text+0x11d0>
1454a7e76:     	movq	%r14, 0x228(%rbp)
1454a7e7d:     	movq	%r14, %r9
1454a7e80:     	cvtsi2ss	%r15d, %xmm7
1454a7e85:     	divss	0x44369f(%rip), %xmm7   # 0x1458eb52c
1454a7e8d:     	mulss	0x44368f(%rip), %xmm7   # 0x1458eb524
1454a7e95:     	bsrq	%r9, %rcx
1454a7e99:     	notl	%ecx
1454a7e9b:     	movq	%r9, %r8
1454a7e9e:     	shlq	%cl, %r8
1454a7ea1:     	decq	%r8
1454a7ea4:     	movq	0x880(%r13), %rbx
1454a7eab:     	movq	0x888(%r13), %r15
1454a7eb2:     	movq	0x898(%r13), %rdi
1454a7eb9:     	movq	0x890(%r13), %r13
1454a7ec0:     	leaq	(%rbx,%rdi), %rax
1454a7ec4:     	rolq	$0x17, %rax
1454a7ec8:     	addq	%rbx, %rax
1454a7ecb:     	movq	%r15, %rcx
1454a7ece:     	shlq	$0x11, %rcx
1454a7ed2:     	xorq	%rbx, %r13
1454a7ed5:     	xorq	%r15, %rdi
1454a7ed8:     	xorq	%rdi, %rbx
1454a7edb:     	rolq	$0x2d, %rdi
1454a7edf:     	xorq	%r13, %r15
1454a7ee2:     	mulq	%r9
1454a7ee5:     	xorq	%rcx, %r13
1454a7ee8:     	cmpq	%rax, %r8
1454a7eeb:     	jb	0x1454a7ec0 <.text+0x54a6ec0>
1454a7eed:     	movq	0x368(%rbp), %rax
1454a7ef4:     	movq	%rbx, 0x880(%rax)
1454a7efb:     	movq	%rdi, 0x898(%rax)
1454a7f02:     	movq	%r15, 0x888(%rax)
1454a7f09:     	movq	%r13, 0x890(%rax)
1454a7f10:     	cmpq	%rdx, %r9
1454a7f13:     	jbe	0x1454aaedf <.text+0x54a9edf>
1454a7f19:     	movq	0x328(%rbp), %rax
1454a7f20:     	movq	(%rax,%rdx,8), %rax
1454a7f24:     	movq	%rax, 0x348(%rbp)
1454a7f2b:     	movl	0x318(%rbp), %eax
1454a7f31:     	leaq	0x1504d38(%rip), %rcx   # 0x1469acc70
1454a7f38:     	movslq	(%rcx,%rax,4), %rax
1454a7f3c:     	addq	%rcx, %rax
1454a7f3f:     	jmpq	*%rax
1454a7f41:     	mulss	0x496ce7(%rip), %xmm6   # 0x14593ec30
1454a7f49:     	addss	0x4435af(%rip), %xmm6   # 0x1458eb500
1454a7f51:     	mulss	%xmm7, %xmm6
1454a7f55:     	cvttss2si	%xmm6, %rax
1454a7f5a:     	movq	%rax, %rcx
1454a7f5d:     	sarq	$0x3f, %rcx
1454a7f61:     	movaps	%xmm6, %xmm0
1454a7f64:     	subss	0x443274(%rip), %xmm0   # 0x1458eb1e0
1454a7f6c:     	cvttss2si	%xmm0, %rdx
1454a7f71:     	andq	%rcx, %rdx
1454a7f74:     	orq	%rax, %rdx
1454a7f77:     	xorl	%r13d, %r13d
1454a7f7a:     	xorps	%xmm0, %xmm0
1454a7f7d:     	ucomiss	%xmm0, %xmm6
1454a7f80:     	cmovbq	%r13, %rdx
1454a7f84:     	ucomiss	0x443259(%rip), %xmm6   # 0x1458eb1e4
1454a7f8b:     	movq	$-0x1, %rax
1454a7f92:     	cmovaq	%rax, %rdx
1454a7f96:     	cmpq	$0x1, %rdx
1454a7f9a:     	adcq	$0x0, %rdx
1454a7f9e:     	js	0x1454a844f <.text+0x54a744f>
1454a7fa4:     	xorps	%xmm0, %xmm0
1454a7fa7:     	cvtsi2ss	%rdx, %xmm0
1454a7fac:     	jmp	0x1454a8469 <.text+0x54a7469>
1454a7fb1:     	addss	%xmm6, %xmm6
1454a7fb5:     	addss	0x450e23(%rip), %xmm6   # 0x1458f8de0
1454a7fbd:     	mulss	%xmm7, %xmm6
1454a7fc1:     	cvttss2si	%xmm6, %rax
1454a7fc6:     	movq	%rax, %rcx
1454a7fc9:     	sarq	$0x3f, %rcx
1454a7fcd:     	movaps	%xmm6, %xmm0
1454a7fd0:     	subss	0x443208(%rip), %xmm0   # 0x1458eb1e0
1454a7fd8:     	cvttss2si	%xmm0, %rdx
1454a7fdd:     	andq	%rcx, %rdx
1454a7fe0:     	orq	%rax, %rdx
1454a7fe3:     	xorl	%eax, %eax
1454a7fe5:     	xorps	%xmm0, %xmm0
1454a7fe8:     	ucomiss	%xmm0, %xmm6
1454a7feb:     	cmovaeq	%rdx, %rax
1454a7fef:     	ucomiss	0x4431ee(%rip), %xmm6   # 0x1458eb1e4
1454a7ff6:     	movq	$-0x1, %rsi
1454a7ffd:     	cmovbeq	%rax, %rsi
1454a8001:     	cmpq	$0x1, %rsi
1454a8005:     	adcq	$0x0, %rsi
1454a8009:     	movq	0x368(%rbp), %rax
1454a8010:     	movsd	0x8a8(%rax), %xmm1
1454a8018:     	movaps	%xmm1, %xmm0
1454a801b:     	mulps	%xmm1, %xmm0
1454a801e:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454a8022:     	addss	%xmm0, %xmm2
1454a8026:     	ucomiss	0x4434cb(%rip), %xmm2   # 0x1458eb4f8
1454a802d:     	movq	%rsi, 0x318(%rbp)
1454a8034:     	jbe	0x1454a8416 <.text+0x54a7416>
1454a803a:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454a803e:     	callq	0x145756e37 <.text+0x5755e37>
1454a8043:     	movss	%xmm0, 0x358(%rbp)
1454a804b:     	jmp	0x1454a8439 <.text+0x54a7439>
1454a8050:     	movq	0x368(%rbp), %rcx
1454a8057:     	movq	0x358(%rbp), %rdx
1454a805e:     	movq	%r14, %r8
1454a8061:     	movaps	%xmm6, %xmm3
1454a8064:     	callq	0x1454beef0 <.text+0x54bdef0>
1454a8069:     	movq	%rax, 0x348(%rbp)
1454a8070:     	mulss	0x44e5b0(%rip), %xmm6   # 0x1458f6628
1454a8078:     	addss	0x450d64(%rip), %xmm6   # 0x1458f8de4
1454a8080:     	mulss	%xmm7, %xmm6
1454a8084:     	cvttss2si	%xmm6, %rax
1454a8089:     	movq	%rax, %rcx
1454a808c:     	sarq	$0x3f, %rcx
1454a8090:     	movaps	%xmm6, %xmm0
1454a8093:     	subss	0x443145(%rip), %xmm0   # 0x1458eb1e0
1454a809b:     	cvttss2si	%xmm0, %rdx
1454a80a0:     	andq	%rcx, %rdx
1454a80a3:     	orq	%rax, %rdx
1454a80a6:     	xorl	%eax, %eax
1454a80a8:     	xorps	%xmm0, %xmm0
1454a80ab:     	ucomiss	%xmm0, %xmm6
1454a80ae:     	cmovaeq	%rdx, %rax
1454a80b2:     	ucomiss	0x44312b(%rip), %xmm6   # 0x1458eb1e4
1454a80b9:     	movq	$-0x1, %rcx
1454a80c0:     	cmovbeq	%rax, %rcx
1454a80c4:     	cmpq	$0x3, %rcx
1454a80c8:     	movl	$0x2, %edi
1454a80cd:     	cmovaeq	%rcx, %rdi
1454a80d1:     	movss	0x444f3b(%rip), %xmm2   # 0x1458ed014
1454a80d9:     	xorps	%xmm1, %xmm1
1454a80dc:     	movq	0x60(%rbp), %rcx
1454a80e0:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454a80e5:     	nop
1454a80e6:     	movq	0x368(%rbp), %r13
1454a80ed:     	movss	0x3e8(%r13), %xmm8
1454a80f6:     	movss	0x3ec(%r13), %xmm9
1454a80ff:     	movaps	%xmm0, %xmm7
1454a8102:     	callq	0x145756e31 <.text+0x5755e31>
1454a8107:     	movaps	%xmm0, %xmm6
1454a810a:     	movaps	%xmm7, %xmm0
1454a810d:     	callq	0x145756e2b <.text+0x5755e2b>
1454a8112:     	movaps	%xmm0, %xmm7
1454a8115:     	movss	0x51f6c2(%rip), %xmm10  # 0x1459c77e0
1454a811e:     	leaq	0xa0(%rbp), %rbx
1454a8125:     	movss	0x454bba(%rip), %xmm11  # 0x1458fcce8
1454a812e:     	movss	0x454cad(%rip), %xmm12  # 0x1458fcde4
1454a8137:     	nopw	(%rax,%rax)
1454a8140:     	movaps	%xmm6, %xmm2
1454a8143:     	mulss	%xmm10, %xmm2
1454a8148:     	addss	%xmm8, %xmm2
1454a814d:     	movaps	%xmm7, %xmm3
1454a8150:     	mulss	%xmm10, %xmm3
1454a8155:     	addss	%xmm9, %xmm3
1454a815a:     	movq	%rbx, %rcx
1454a815d:     	movq	%r13, %rdx
1454a8160:     	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8165:     	nop
1454a8166:     	cmpb	$0x0, 0xa0(%rbp)
1454a816d:     	jne	0x1454a82b2 <.text+0x54a72b2>
1454a8173:     	addss	%xmm11, %xmm10
1454a8178:     	ucomiss	%xmm12, %xmm10
1454a817c:     	movq	0x368(%rbp), %r13
1454a8183:     	jae	0x1454a8140 <.text+0x54a7140>
1454a8185:     	jmp	0x1454a924a <.text+0x54a824a>
1454a818a:     	movq	0x328(%rbp), %r14
1454a8191:     	cmpq	$0x1, %r9
1454a8195:     	jne	0x1454a8899 <.text+0x54a7899>
1454a819b:     	addss	%xmm6, %xmm6
1454a819f:     	addss	0x450c39(%rip), %xmm6   # 0x1458f8de0
1454a81a7:     	mulss	%xmm7, %xmm6
1454a81ab:     	cvttss2si	%xmm6, %rax
1454a81b0:     	movq	%rax, %rcx
1454a81b3:     	sarq	$0x3f, %rcx
1454a81b7:     	movaps	%xmm6, %xmm0
1454a81ba:     	subss	0x44301e(%rip), %xmm0   # 0x1458eb1e0
1454a81c2:     	cvttss2si	%xmm0, %r8
1454a81c7:     	andq	%rcx, %r8
1454a81ca:     	orq	%rax, %r8
1454a81cd:     	xorl	%eax, %eax
1454a81cf:     	xorps	%xmm0, %xmm0
1454a81d2:     	ucomiss	%xmm0, %xmm6
1454a81d5:     	cmovaeq	%r8, %rax
1454a81d9:     	ucomiss	0x443004(%rip), %xmm6   # 0x1458eb1e4
1454a81e0:     	movq	$-0x1, %rcx
1454a81e7:     	cmovbeq	%rax, %rcx
1454a81eb:     	movq	(%r14), %rax
1454a81ee:     	movq	%rax, 0x348(%rbp)
1454a81f5:     	cmpq	$0x1, %rcx
1454a81f9:     	adcq	$0x0, %rcx
1454a81fd:     	movq	%rcx, %r14
1454a8200:     	movq	0x368(%rbp), %rsi
1454a8207:     	movsd	0x8a8(%rsi), %xmm1
1454a820f:     	movaps	%xmm1, %xmm0
1454a8212:     	mulps	%xmm1, %xmm0
1454a8215:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454a8219:     	addss	%xmm0, %xmm2
1454a821d:     	ucomiss	0x4432d4(%rip), %xmm2   # 0x1458eb4f8
1454a8224:     	jbe	0x1454a8d93 <.text+0x54a7d93>
1454a822a:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454a822e:     	callq	0x145756e37 <.text+0x5755e37>
1454a8233:     	movaps	%xmm0, %xmm7
1454a8236:     	movq	%r15, %rax
1454a8239:     	shlq	$0x11, %rax
1454a823d:     	xorq	%rbx, %r13
1454a8240:     	movq	%r13, %rcx
1454a8243:     	xorq	%r15, %rcx
1454a8246:     	xorq	%rdi, %r15
1454a8249:     	movq	%rcx, 0x888(%rsi)
1454a8250:     	movq	%r15, %rcx
1454a8253:     	xorq	%rbx, %rcx
1454a8256:     	movq	%rcx, 0x880(%rsi)
1454a825d:     	xorq	%rax, %r13
1454a8260:     	movq	%r13, 0x890(%rsi)
1454a8267:     	rolq	$0x2d, %r15
1454a826b:     	movq	%r15, 0x898(%rsi)
1454a8272:     	movss	0x712076(%rip), %xmm1   # 0x145bba2f0
1454a827a:     	movss	0x462c7a(%rip), %xmm2   # 0x14590aefc
1454a8282:     	movq	0x60(%rbp), %rcx
1454a8286:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454a828b:     	nop
1454a828c:     	movq	%r14, %r15
1454a828f:     	addq	%rbx, %rdi
1454a8292:     	rolq	$0x17, %rdi
1454a8296:     	addq	%rbx, %rdi
1454a8299:     	shrq	$0x3f, %rdi
1454a829d:     	leaq	0x150216c(%rip), %rax   # 0x1469aa410
1454a82a4:     	addss	(%rax,%rdi,4), %xmm7
1454a82a9:     	addss	%xmm0, %xmm7
1454a82ad:     	jmp	0x1454a8dae <.text+0x54a7dae>
1454a82b2:     	movsd	0xa4(%rbp), %xmm9
1454a82bb:     	movshdup	%xmm9, %xmm10           # xmm10 = xmm9[1,1,3,3]
1454a82c0:     	movl	0xac(%rbp), %r14d
1454a82c7:     	xorl	%r15d, %r15d
1454a82ca:     	movss	0x454b15(%rip), %xmm11  # 0x1458fcde8
1454a82d3:     	movss	0x1278ca4(%rip), %xmm12 # 0x146720f80
1454a82dc:     	movss	0x44319b(%rip), %xmm13  # 0x1458eb480
1454a82e5:     	leaq	0xa0(%rbp), %rbx
1454a82ec:     	movq	0x368(%rbp), %rsi
1454a82f3:     	cmpq	%rdi, %r15
1454a82f6:     	jae	0x1454a83f7 <.text+0x54a73f7>
1454a82fc:     	nopl	(%rax)
1454a8300:     	testq	%r15, %r15
1454a8303:     	js	0x1454a830f <.text+0x54a730f>
1454a8305:     	xorps	%xmm6, %xmm6
1454a8308:     	cvtsi2ss	%r15, %xmm6
1454a830d:     	jmp	0x1454a832a <.text+0x54a732a>
1454a830f:     	movq	%r15, %rax
1454a8312:     	shrq	%rax
1454a8315:     	movl	%r15d, %ecx
1454a8318:     	andl	$0x1, %ecx
1454a831b:     	orq	%rax, %rcx
1454a831e:     	xorps	%xmm6, %xmm6
1454a8321:     	cvtsi2ss	%rcx, %xmm6
1454a8326:     	addss	%xmm6, %xmm6
1454a832a:     	xorps	%xmm7, %xmm7
1454a832d:     	sqrtss	%xmm6, %xmm7
1454a8331:     	mulss	%xmm11, %xmm6
1454a8336:     	mulss	%xmm12, %xmm7
1454a833b:     	addss	%xmm13, %xmm7
1454a8340:     	movaps	%xmm6, %xmm0
1454a8343:     	callq	0x145756e31 <.text+0x5755e31>
1454a8348:     	movaps	%xmm0, %xmm8
1454a834c:     	mulss	%xmm7, %xmm8
1454a8351:     	addss	%xmm9, %xmm8
1454a8356:     	movaps	%xmm6, %xmm0
1454a8359:     	callq	0x145756e2b <.text+0x5755e2b>
1454a835e:     	mulss	%xmm0, %xmm7
1454a8362:     	addss	%xmm10, %xmm7
1454a8367:     	movq	%rbx, %rcx
1454a836a:     	movq	%rsi, %rdx
1454a836d:     	movaps	%xmm8, %xmm2
1454a8371:     	movaps	%xmm7, %xmm3
1454a8374:     	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8379:     	nop
1454a837a:     	movl	0xa0(%rbp), %ecx
1454a8380:     	movl	%r14d, %eax
1454a8383:     	testl	%ecx, %ecx
1454a8385:     	je	0x1454a838d <.text+0x54a738d>
1454a8387:     	movl	0xac(%rbp), %eax
1454a838d:     	movq	0xa4(%rbp), %xmm0
1454a8395:     	movd	%ecx, %xmm1
1454a8399:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454a839e:     	pslld	$0x1f, %xmm1
1454a83a3:     	psrad	$0x1f, %xmm1
1454a83a8:     	pand	%xmm1, %xmm0
1454a83ac:     	pandn	%xmm9, %xmm1
1454a83b1:     	por	%xmm0, %xmm1
1454a83b5:     	movq	%xmm1, 0xa4(%rbp)
1454a83bd:     	movl	%eax, 0xac(%rbp)
1454a83c3:     	movl	$0x1, 0xa0(%rbp)
1454a83cd:     	movq	0x368(%rbp), %rcx
1454a83d4:     	movq	0x348(%rbp), %rdx
1454a83db:     	movq	%rbx, %r8
1454a83de:     	callq	0x1454c2040 <.text+0x54c1040>
1454a83e3:     	nop
1454a83e4:     	incq	%r15
1454a83e7:     	movq	0x368(%rbp), %rsi
1454a83ee:     	cmpq	%rdi, %r15
1454a83f1:     	jb	0x1454a8300 <.text+0x54a7300>
1454a83f7:     	leaq	0x1503306(%rip), %rdi   # 0x1469ab704
1454a83fe:     	movl	$0x11, %esi
1454a8403:     	movl	$0x11, %edx
1454a8408:     	movq	%rdi, %rcx
1454a840b:     	callq	0x145452400 <.text+0x5451400>
1454a8410:     	nop
1454a8411:     	jmp	0x1454a910a <.text+0x54a810a>
1454a8416:     	movss	0x444bf6(%rip), %xmm2   # 0x1458ed014
1454a841e:     	xorps	%xmm1, %xmm1
1454a8421:     	movq	0x60(%rbp), %rcx
1454a8425:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454a842a:     	movss	%xmm0, 0x358(%rbp)
1454a8432:     	movq	0x318(%rbp), %rsi
1454a8439:     	testq	%rsi, %rsi
1454a843c:     	js	0x1454a8928 <.text+0x54a7928>
1454a8442:     	xorps	%xmm0, %xmm0
1454a8445:     	cvtsi2ss	%rsi, %xmm0
1454a844a:     	jmp	0x1454a8942 <.text+0x54a7942>
1454a844f:     	movq	%rdx, %rax
1454a8452:     	shrq	%rax
1454a8455:     	movl	%edx, %ecx
1454a8457:     	andl	$0x1, %ecx
1454a845a:     	orq	%rax, %rcx
1454a845d:     	xorps	%xmm0, %xmm0
1454a8460:     	cvtsi2ss	%rcx, %xmm0
1454a8465:     	addss	%xmm0, %xmm0
1454a8469:     	movss	%xmm0, 0x358(%rbp)
1454a8471:     	leaq	0x1501f90(%rip), %r15   # 0x1469aa408
1454a8478:     	xorl	%edi, %edi
1454a847a:     	movq	%rdx, 0x318(%rbp)
1454a8481:     	jmp	0x1454a84c8 <.text+0x54a74c8>
1454a8483:     	movlps	%xmm8, 0xa4(%rbp)
1454a848b:     	movss	%xmm0, 0xac(%rbp)
1454a8493:     	movl	$0x1, 0xa0(%rbp)
1454a849d:     	movq	0x368(%rbp), %rcx
1454a84a4:     	movq	0x348(%rbp), %rdx
1454a84ab:     	leaq	0xa0(%rbp), %r8
1454a84b2:     	callq	0x1454c2040 <.text+0x54c1040>
1454a84b7:     	nop
1454a84b8:     	movss	0x49605f(%rip), %xmm12  # 0x14593e520
1454a84c1:     	movq	0x318(%rbp), %rdx
1454a84c8:     	cmpq	%rdx, %r13
1454a84cb:     	jae	0x1454a887a <.text+0x54a787a>
1454a84d1:     	testq	%r13, %r13
1454a84d4:     	js	0x1454a84f0 <.text+0x54a74f0>
1454a84d6:     	xorps	%xmm8, %xmm8
1454a84da:     	cvtsi2ss	%r13, %xmm8
1454a84df:     	jmp	0x1454a850d <.text+0x54a750d>
1454a84e1:     	nopw	%cs:(%rax,%rax)
1454a84f0:     	movq	%r13, %rax
1454a84f3:     	shrq	%rax
1454a84f6:     	movl	%r13d, %ecx
1454a84f9:     	andl	$0x1, %ecx
1454a84fc:     	orq	%rax, %rcx
1454a84ff:     	xorps	%xmm8, %xmm8
1454a8503:     	cvtsi2ss	%rcx, %xmm8
1454a8508:     	addss	%xmm8, %xmm8
1454a850d:     	divss	0x358(%rbp), %xmm8
1454a8516:     	incq	%r13
1454a8519:     	mulss	0x444af2(%rip), %xmm8   # 0x1458ed014
1454a8522:     	movq	0x2a0(%rbp), %rax
1454a8529:     	movsd	(%rax), %xmm7
1454a852d:     	movaps	%xmm8, %xmm0
1454a8531:     	callq	0x145756e31 <.text+0x5755e31>
1454a8536:     	movaps	%xmm0, %xmm6
1454a8539:     	movaps	%xmm8, %xmm0
1454a853d:     	callq	0x145756e2b <.text+0x5755e2b>
1454a8542:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454a8545:     	jmp	0x1454a8571 <.text+0x54a7571>
1454a8547:     	nopw	(%rax,%rax)
1454a8550:     	movl	$0x0, 0xa0(%rbp)
1454a855a:     	addss	0x454785(%rip), %xmm12  # 0x1458fcce8
1454a8563:     	ucomiss	0x450895(%rip), %xmm12  # 0x1458f8e00
1454a856b:     	jb	0x1454a84b8 <.text+0x54a74b8>
1454a8571:     	movsldup	%xmm12, %xmm8           # xmm8 = xmm12[0,0,2,2]
1454a8576:     	mulps	%xmm6, %xmm8
1454a857a:     	addps	%xmm7, %xmm8
1454a857e:     	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454a8583:     	movq	0x368(%rbp), %rbx
1454a858a:     	movq	0x210(%rbx), %rcx
1454a8591:     	movq	0x218(%rbx), %rdx
1454a8598:     	callq	0x14540e820 <.text+0x540d820>
1454a859d:     	imulq	$0xf0, %rax, %rsi
1454a85a4:     	movss	0x3e8(%rbx), %xmm14
1454a85ad:     	movss	0x3ec(%rbx), %xmm13
1454a85b6:     	movaps	%xmm8, %xmm0
1454a85ba:     	subss	0xc8(%rsi,%r12), %xmm0
1454a85c4:     	movss	0x3f0(%rbx), %xmm11
1454a85cd:     	movaps	%xmm9, %xmm1
1454a85d1:     	subss	0xcc(%rsi,%r12), %xmm1
1454a85db:     	callq	0x145756e67 <.text+0x5755e67>
1454a85e0:     	movaps	%xmm0, %xmm10
1454a85e4:     	movss	0xd8(%rsi,%r12), %xmm15
1454a85ee:     	movaps	%xmm15, %xmm0
1454a85f2:     	addss	0x450996(%rip), %xmm0   # 0x1458f8f90
1454a85fa:     	ucomiss	%xmm0, %xmm10
1454a85fe:     	ja	0x1454a8550 <.text+0x54a7550>
1454a8604:     	movq	0x368(%rbp), %rax
1454a860b:     	movq	0x878(%rax), %rbx
1454a8612:     	leaq	0x10(%rbx), %rcx
1454a8616:     	movaps	%xmm8, %xmm1
1454a861a:     	movaps	%xmm9, %xmm2
1454a861e:     	callq	0x1454627f0 <.text+0x54617f0>
1454a8623:     	nop
1454a8624:     	testb	$0x1, %al
1454a8626:     	je	0x1454a8550 <.text+0x54a7550>
1454a862c:     	xorl	%eax, %eax
1454a862e:     	ucomiss	%xmm15, %xmm10
1454a8632:     	seta	%al
1454a8635:     	movaps	%xmm0, %xmm1
1454a8638:     	subss	%xmm11, %xmm1
1454a863d:     	andps	0x4628ec(%rip), %xmm1   # 0x14590af30
1454a8644:     	ucomiss	(%r15,%rax,4), %xmm1
1454a8649:     	ja	0x1454a8550 <.text+0x54a7550>
1454a864f:     	cmpq	$-0x1, 0x40(%rbx)
1454a8654:     	je	0x1454a8483 <.text+0x54a7483>
1454a865a:     	movsd	0x60(%rbx), %xmm2
1454a865f:     	movaps	%xmm8, %xmm1
1454a8663:     	subps	%xmm2, %xmm1
1454a8666:     	movaps	%xmm1, %xmm2
1454a8669:     	xorps	%xmm3, %xmm3
1454a866c:     	cmpltps	%xmm3, %xmm2
1454a8670:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454a8673:     	movmskpd	%xmm2, %eax
1454a8677:     	testl	%eax, %eax
1454a8679:     	jne	0x1454a872e <.text+0x54a772e>
1454a867f:     	movaps	%xmm1, %xmm2
1454a8682:     	movss	0x442b56(%rip), %xmm3   # 0x1458eb1e0
1454a868a:     	subss	%xmm3, %xmm2
1454a868e:     	cvttss2si	%xmm2, %rcx
1454a8693:     	cvttss2si	%xmm1, %rdx
1454a8698:     	movq	%rdx, %rax
1454a869b:     	sarq	$0x3f, %rax
1454a869f:     	andq	%rcx, %rax
1454a86a2:     	orq	%rdx, %rax
1454a86a5:     	xorps	%xmm5, %xmm5
1454a86a8:     	ucomiss	%xmm5, %xmm1
1454a86ab:     	cmovbq	%rdi, %rax
1454a86af:     	movss	0x442b2d(%rip), %xmm4   # 0x1458eb1e4
1454a86b7:     	ucomiss	%xmm4, %xmm1
1454a86ba:     	movq	$-0x1, %r9
1454a86c1:     	cmovaq	%r9, %rax
1454a86c5:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454a86c9:     	movaps	%xmm1, %xmm2
1454a86cc:     	subss	%xmm3, %xmm2
1454a86d0:     	cvttss2si	%xmm2, %rcx
1454a86d5:     	cvttss2si	%xmm1, %r8
1454a86da:     	movq	%r8, %rdx
1454a86dd:     	sarq	$0x3f, %rdx
1454a86e1:     	andq	%rcx, %rdx
1454a86e4:     	orq	%r8, %rdx
1454a86e7:     	ucomiss	%xmm5, %xmm1
1454a86ea:     	cmovbq	%rdi, %rdx
1454a86ee:     	ucomiss	%xmm4, %xmm1
1454a86f1:     	cmovaq	%r9, %rdx
1454a86f5:     	movq	0x58(%rbx), %rcx
1454a86f9:     	cmpq	%rcx, %rax
1454a86fc:     	setae	%r8b
1454a8700:     	cmpq	%rcx, %rdx
1454a8703:     	setae	%r9b
1454a8707:     	orb	%r8b, %r9b
1454a870a:     	jne	0x1454a872e <.text+0x54a772e>
1454a870c:     	imulq	%rdx, %rcx
1454a8710:     	addq	%rax, %rcx
1454a8713:     	movq	0x50(%rbx), %rdx
1454a8717:     	cmpq	%rdx, %rcx
1454a871a:     	jae	0x1454aad8b <.text+0x54a9d8b>
1454a8720:     	movq	0x48(%rbx), %rax
1454a8724:     	cmpb	$0x0, (%rax,%rcx)
1454a8728:     	jne	0x1454a8550 <.text+0x54a7550>
1454a872e:     	movq	0x368(%rbp), %rax
1454a8735:     	movq	0x8a0(%rax), %r14
1454a873c:     	testq	%r14, %r14
1454a873f:     	je	0x1454a8483 <.text+0x54a7483>
1454a8745:     	cmpq	$0x191, 0x30(%r14)      # imm = 0x191
1454a874d:     	jb	0x1454a8483 <.text+0x54a7483>
1454a8753:     	movaps	%xmm8, %xmm2
1454a8757:     	subss	%xmm14, %xmm2
1454a875c:     	movaps	%xmm9, %xmm1
1454a8760:     	subss	%xmm13, %xmm1
1454a8765:     	movaps	%xmm0, %xmm10
1454a8769:     	movaps	%xmm2, %xmm0
1454a876c:     	callq	0x145756e67 <.text+0x5755e67>
1454a8771:     	movss	0x60(%rbx), %xmm3
1454a8776:     	movaps	%xmm8, %xmm2
1454a877a:     	subss	%xmm3, %xmm2
1454a877e:     	xorps	%xmm3, %xmm3
1454a8781:     	ucomiss	%xmm2, %xmm3
1454a8784:     	ja	0x1454a8550 <.text+0x54a7550>
1454a878a:     	subss	0x64(%rbx), %xmm9
1454a8790:     	ucomiss	%xmm9, %xmm3
1454a8794:     	ja	0x1454a8550 <.text+0x54a7550>
1454a879a:     	movaps	%xmm2, %xmm3
1454a879d:     	movss	0x442a3b(%rip), %xmm4   # 0x1458eb1e0
1454a87a5:     	subss	%xmm4, %xmm3
1454a87a9:     	cvttss2si	%xmm3, %rcx
1454a87ae:     	cvttss2si	%xmm2, %rdx
1454a87b3:     	movq	%rdx, %rax
1454a87b6:     	sarq	$0x3f, %rax
1454a87ba:     	andq	%rcx, %rax
1454a87bd:     	orq	%rdx, %rax
1454a87c0:     	xorps	%xmm5, %xmm5
1454a87c3:     	ucomiss	%xmm5, %xmm2
1454a87c6:     	cmovbq	%rdi, %rax
1454a87ca:     	movss	0x442a12(%rip), %xmm3   # 0x1458eb1e4
1454a87d2:     	ucomiss	%xmm3, %xmm2
1454a87d5:     	movq	$-0x1, %r9
1454a87dc:     	cmovaq	%r9, %rax
1454a87e0:     	movaps	%xmm9, %xmm2
1454a87e4:     	subss	%xmm4, %xmm2
1454a87e8:     	cvttss2si	%xmm2, %rcx
1454a87ed:     	cvttss2si	%xmm9, %r8
1454a87f2:     	movq	%r8, %rdx
1454a87f5:     	sarq	$0x3f, %rdx
1454a87f9:     	andq	%rcx, %rdx
1454a87fc:     	orq	%r8, %rdx
1454a87ff:     	ucomiss	%xmm5, %xmm9
1454a8803:     	cmovbq	%rdi, %rdx
1454a8807:     	ucomiss	%xmm3, %xmm9
1454a880b:     	cmovaq	%r9, %rdx
1454a880f:     	movq	0x58(%rbx), %rcx
1454a8813:     	cmpq	%rcx, %rax
1454a8816:     	jae	0x1454a8550 <.text+0x54a7550>
1454a881c:     	cmpq	%rcx, %rdx
1454a881f:     	jae	0x1454a8550 <.text+0x54a7550>
1454a8825:     	imulq	%rdx, %rcx
1454a8829:     	addq	%rax, %rcx
1454a882c:     	movq	0x20(%r14), %rdx
1454a8830:     	cmpq	%rdx, %rcx
1454a8833:     	jae	0x1454aadbe <.text+0x54a9dbe>
1454a8839:     	movq	0x18(%r14), %rax
1454a883d:     	movzwl	(%rax,%rcx,2), %eax
1454a8841:     	cmpw	$-0x1, %ax
1454a8845:     	je	0x1454a8550 <.text+0x54a7550>
1454a884b:     	movaps	%xmm0, %xmm1
1454a884e:     	movaps	%xmm10, %xmm0
1454a8852:     	movzwl	%ax, %eax
1454a8855:     	xorps	%xmm2, %xmm2
1454a8858:     	cvtsi2ss	%eax, %xmm2
1454a885c:     	mulss	0x4543d4(%rip), %xmm1   # 0x1458fcc38
1454a8864:     	addss	0x442c94(%rip), %xmm1   # 0x1458eb500
1454a886c:     	ucomiss	%xmm1, %xmm2
1454a886f:     	ja	0x1454a8550 <.text+0x54a7550>
1454a8875:     	jmp	0x1454a8483 <.text+0x54a7483>
1454a887a:     	leaq	0x1502e1f(%rip), %rdi   # 0x1469ab6a0
1454a8881:     	movl	$0x14, %esi
1454a8886:     	movl	$0x14, %edx
1454a888b:     	movq	%rdi, %rcx
1454a888e:     	callq	0x145452400 <.text+0x5451400>
1454a8893:     	nop
1454a8894:     	jmp	0x1454a910a <.text+0x54a810a>
1454a8899:     	movq	0x328(%rbp), %r14
1454a88a0:     	leaq	0x8(%r14), %r8
1454a88a4:     	decq	%r9
1454a88a7:     	movabsq	$0x1fffffffffffffff, %r10 # imm = 0x1FFFFFFFFFFFFFFF
1454a88b1:     	andq	%r9, %r10
1454a88b4:     	movq	(%r14), %rcx
1454a88b7:     	movq	0x80(%rbp), %rdx
1454a88be:     	jmp	0x1454a88cd <.text+0x54a78cd>
1454a88c0:     	addq	$0x8, %r8
1454a88c4:     	decq	%r10
1454a88c7:     	je	0x1454a819b <.text+0x54a719b>
1454a88cd:     	cmpq	%rdx, %rcx
1454a88d0:     	jae	0x1454aae04 <.text+0x54a9e04>
1454a88d6:     	movq	(%r8), %rax
1454a88d9:     	cmpq	%rdx, %rax
1454a88dc:     	jae	0x1454aae16 <.text+0x54a9e16>
1454a88e2:     	leaq	(%rcx,%rcx,4), %r9
1454a88e6:     	shlq	$0x4, %r9
1454a88ea:     	leaq	(%rax,%rax,4), %r11
1454a88ee:     	shlq	$0x4, %r11
1454a88f2:     	movq	0x290(%rbp), %rsi
1454a88f9:     	movl	0x3c(%rsi,%r9), %r9d
1454a88fe:     	movl	0x3c(%rsi,%r11), %r11d
1454a8903:     	movl	%r9d, %esi
1454a8906:     	sarl	$0x1f, %esi
1454a8909:     	shrl	%esi
1454a890b:     	xorl	%r9d, %esi
1454a890e:     	movl	%r11d, %r9d
1454a8911:     	sarl	$0x1f, %r9d
1454a8915:     	shrl	%r9d
1454a8918:     	xorl	%r11d, %r9d
1454a891b:     	cmpl	%r9d, %esi
1454a891e:     	jg	0x1454a88c0 <.text+0x54a78c0>
1454a8920:     	movq	%rax, %rcx
1454a8923:     	movq	%r8, %r14
1454a8926:     	jmp	0x1454a88c0 <.text+0x54a78c0>
1454a8928:     	movq	%rsi, %rax
1454a892b:     	shrq	%rax
1454a892e:     	movl	%esi, %ecx
1454a8930:     	andl	$0x1, %ecx
1454a8933:     	orq	%rax, %rcx
1454a8936:     	xorps	%xmm0, %xmm0
1454a8939:     	cvtsi2ss	%rcx, %xmm0
1454a893e:     	addss	%xmm0, %xmm0
1454a8942:     	movss	%xmm0, 0x310(%rbp)
1454a894a:     	movss	0x358(%rbp), %xmm0
1454a8952:     	addss	0x1501aa6(%rip), %xmm0  # 0x1469aa400
1454a895a:     	movss	%xmm0, 0x358(%rbp)
1454a8962:     	leaq	0x1501a9f(%rip), %r14   # 0x1469aa408
1454a8969:     	movq	$-0x1, %r15
1454a8970:     	xorl	%edi, %edi
1454a8972:     	jmp	0x1454a89b0 <.text+0x54a79b0>
1454a8974:     	movlps	%xmm8, 0xa4(%rbp)
1454a897c:     	movss	%xmm0, 0xac(%rbp)
1454a8984:     	movl	$0x1, 0xa0(%rbp)
1454a898e:     	movq	0x368(%rbp), %rcx
1454a8995:     	movq	0x348(%rbp), %rdx
1454a899c:     	leaq	0xa0(%rbp), %r8
1454a89a3:     	callq	0x1454c2040 <.text+0x54c1040>
1454a89a8:     	nop
1454a89a9:     	movq	0x318(%rbp), %rsi
1454a89b0:     	cmpq	%rsi, %rdi
1454a89b3:     	jae	0x1454a8d74 <.text+0x54a7d74>
1454a89b9:     	testq	%rdi, %rdi
1454a89bc:     	js	0x1454a89d0 <.text+0x54a79d0>
1454a89be:     	xorps	%xmm8, %xmm8
1454a89c2:     	cvtsi2ss	%rdi, %xmm8
1454a89c7:     	jmp	0x1454a89ec <.text+0x54a79ec>
1454a89c9:     	nopl	(%rax)
1454a89d0:     	movq	%rdi, %rax
1454a89d3:     	shrq	%rax
1454a89d6:     	movl	%edi, %ecx
1454a89d8:     	andl	$0x1, %ecx
1454a89db:     	orq	%rax, %rcx
1454a89de:     	xorps	%xmm8, %xmm8
1454a89e2:     	cvtsi2ss	%rcx, %xmm8
1454a89e7:     	addss	%xmm8, %xmm8
1454a89ec:     	incq	%rdi
1454a89ef:     	addss	0x442a90(%rip), %xmm8   # 0x1458eb488
1454a89f8:     	mulss	0x4543e7(%rip), %xmm8   # 0x1458fcde8
1454a8a01:     	divss	0x310(%rbp), %xmm8
1454a8a0a:     	addss	0x358(%rbp), %xmm8
1454a8a13:     	movq	0x2a0(%rbp), %rax
1454a8a1a:     	movsd	(%rax), %xmm12
1454a8a1f:     	movaps	%xmm8, %xmm0
1454a8a23:     	callq	0x145756e31 <.text+0x5755e31>
1454a8a28:     	movaps	%xmm0, %xmm7
1454a8a2b:     	movaps	%xmm8, %xmm0
1454a8a2f:     	callq	0x145756e2b <.text+0x5755e2b>
1454a8a34:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454a8a37:     	movss	0x44dbc0(%rip), %xmm13  # 0x1458f6600
1454a8a40:     	jmp	0x1454a8a71 <.text+0x54a7a71>
1454a8a42:     	nopw	%cs:(%rax,%rax)
1454a8a50:     	movl	$0x0, 0xa0(%rbp)
1454a8a5a:     	addss	0x454285(%rip), %xmm13  # 0x1458fcce8
1454a8a63:     	ucomiss	0x450375(%rip), %xmm13  # 0x1458f8de0
1454a8a6b:     	jb	0x1454a89a9 <.text+0x54a79a9>
1454a8a71:     	movsldup	%xmm13, %xmm8           # xmm8 = xmm13[0,0,2,2]
1454a8a76:     	mulps	%xmm7, %xmm8
1454a8a7a:     	addps	%xmm12, %xmm8
1454a8a7e:     	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454a8a83:     	movq	0x368(%rbp), %rbx
1454a8a8a:     	movq	0x210(%rbx), %rcx
1454a8a91:     	movq	0x218(%rbx), %rdx
1454a8a98:     	callq	0x14540e820 <.text+0x540d820>
1454a8a9d:     	imulq	$0xf0, %rax, %rsi
1454a8aa4:     	movss	0x3e8(%rbx), %xmm11
1454a8aad:     	movss	0x3ec(%rbx), %xmm6
1454a8ab5:     	movaps	%xmm8, %xmm0
1454a8ab9:     	subss	0xc8(%rsi,%r12), %xmm0
1454a8ac3:     	movss	0x3f0(%rbx), %xmm14
1454a8acc:     	movaps	%xmm9, %xmm1
1454a8ad0:     	subss	0xcc(%rsi,%r12), %xmm1
1454a8ada:     	callq	0x145756e67 <.text+0x5755e67>
1454a8adf:     	movaps	%xmm0, %xmm10
1454a8ae3:     	movss	0xd8(%rsi,%r12), %xmm15
1454a8aed:     	movaps	%xmm15, %xmm0
1454a8af1:     	addss	0x450497(%rip), %xmm0   # 0x1458f8f90
1454a8af9:     	ucomiss	%xmm0, %xmm10
1454a8afd:     	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8b03:     	movq	0x368(%rbp), %rax
1454a8b0a:     	movq	0x878(%rax), %rbx
1454a8b11:     	leaq	0x10(%rbx), %rcx
1454a8b15:     	movaps	%xmm8, %xmm1
1454a8b19:     	movaps	%xmm9, %xmm2
1454a8b1d:     	callq	0x1454627f0 <.text+0x54617f0>
1454a8b22:     	nop
1454a8b23:     	testb	$0x1, %al
1454a8b25:     	je	0x1454a8a50 <.text+0x54a7a50>
1454a8b2b:     	xorl	%eax, %eax
1454a8b2d:     	ucomiss	%xmm15, %xmm10
1454a8b31:     	seta	%al
1454a8b34:     	movaps	%xmm0, %xmm1
1454a8b37:     	subss	%xmm14, %xmm1
1454a8b3c:     	andps	0x4623ed(%rip), %xmm1   # 0x14590af30
1454a8b43:     	ucomiss	(%r14,%rax,4), %xmm1
1454a8b48:     	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8b4e:     	cmpq	$-0x1, 0x40(%rbx)
1454a8b53:     	je	0x1454a8974 <.text+0x54a7974>
1454a8b59:     	movsd	0x60(%rbx), %xmm2
1454a8b5e:     	movaps	%xmm8, %xmm1
1454a8b62:     	subps	%xmm2, %xmm1
1454a8b65:     	movaps	%xmm1, %xmm2
1454a8b68:     	xorps	%xmm3, %xmm3
1454a8b6b:     	cmpltps	%xmm3, %xmm2
1454a8b6f:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454a8b72:     	movmskpd	%xmm2, %eax
1454a8b76:     	testl	%eax, %eax
1454a8b78:     	jne	0x1454a8c2c <.text+0x54a7c2c>
1454a8b7e:     	movaps	%xmm1, %xmm2
1454a8b81:     	movss	0x442657(%rip), %xmm3   # 0x1458eb1e0
1454a8b89:     	subss	%xmm3, %xmm2
1454a8b8d:     	cvttss2si	%xmm2, %rcx
1454a8b92:     	cvttss2si	%xmm1, %rdx
1454a8b97:     	movq	%rdx, %rax
1454a8b9a:     	sarq	$0x3f, %rax
1454a8b9e:     	andq	%rcx, %rax
1454a8ba1:     	orq	%rdx, %rax
1454a8ba4:     	xorps	%xmm5, %xmm5
1454a8ba7:     	ucomiss	%xmm5, %xmm1
1454a8baa:     	movl	$0x0, %r9d
1454a8bb0:     	cmovbq	%r9, %rax
1454a8bb4:     	movss	0x442628(%rip), %xmm4   # 0x1458eb1e4
1454a8bbc:     	ucomiss	%xmm4, %xmm1
1454a8bbf:     	cmovaq	%r15, %rax
1454a8bc3:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454a8bc7:     	movaps	%xmm1, %xmm2
1454a8bca:     	subss	%xmm3, %xmm2
1454a8bce:     	cvttss2si	%xmm2, %rcx
1454a8bd3:     	cvttss2si	%xmm1, %r8
1454a8bd8:     	movq	%r8, %rdx
1454a8bdb:     	sarq	$0x3f, %rdx
1454a8bdf:     	andq	%rcx, %rdx
1454a8be2:     	orq	%r8, %rdx
1454a8be5:     	ucomiss	%xmm5, %xmm1
1454a8be8:     	cmovbq	%r9, %rdx
1454a8bec:     	ucomiss	%xmm4, %xmm1
1454a8bef:     	cmovaq	%r15, %rdx
1454a8bf3:     	movq	0x58(%rbx), %rcx
1454a8bf7:     	cmpq	%rcx, %rax
1454a8bfa:     	setae	%r8b
1454a8bfe:     	cmpq	%rcx, %rdx
1454a8c01:     	setae	%r9b
1454a8c05:     	orb	%r8b, %r9b
1454a8c08:     	jne	0x1454a8c2c <.text+0x54a7c2c>
1454a8c0a:     	imulq	%rdx, %rcx
1454a8c0e:     	addq	%rax, %rcx
1454a8c11:     	movq	0x50(%rbx), %rdx
1454a8c15:     	cmpq	%rdx, %rcx
1454a8c18:     	jae	0x1454aad9d <.text+0x54a9d9d>
1454a8c1e:     	movq	0x48(%rbx), %rax
1454a8c22:     	cmpb	$0x0, (%rax,%rcx)
1454a8c26:     	jne	0x1454a8a50 <.text+0x54a7a50>
1454a8c2c:     	movq	0x368(%rbp), %rax
1454a8c33:     	movq	0x8a0(%rax), %r13
1454a8c3a:     	testq	%r13, %r13
1454a8c3d:     	je	0x1454a8974 <.text+0x54a7974>
1454a8c43:     	cmpq	$0x191, 0x30(%r13)      # imm = 0x191
1454a8c4b:     	jb	0x1454a8974 <.text+0x54a7974>
1454a8c51:     	movaps	%xmm8, %xmm2
1454a8c55:     	subss	%xmm11, %xmm2
1454a8c5a:     	movaps	%xmm9, %xmm1
1454a8c5e:     	subss	%xmm6, %xmm1
1454a8c62:     	movaps	%xmm0, %xmm6
1454a8c65:     	movaps	%xmm2, %xmm0
1454a8c68:     	callq	0x145756e67 <.text+0x5755e67>
1454a8c6d:     	movss	0x60(%rbx), %xmm3
1454a8c72:     	movaps	%xmm8, %xmm2
1454a8c76:     	subss	%xmm3, %xmm2
1454a8c7a:     	xorps	%xmm3, %xmm3
1454a8c7d:     	ucomiss	%xmm2, %xmm3
1454a8c80:     	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8c86:     	subss	0x64(%rbx), %xmm9
1454a8c8c:     	ucomiss	%xmm9, %xmm3
1454a8c90:     	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8c96:     	movaps	%xmm2, %xmm3
1454a8c99:     	movss	0x44253f(%rip), %xmm4   # 0x1458eb1e0
1454a8ca1:     	subss	%xmm4, %xmm3
1454a8ca5:     	cvttss2si	%xmm3, %rcx
1454a8caa:     	cvttss2si	%xmm2, %rdx
1454a8caf:     	movq	%rdx, %rax
1454a8cb2:     	sarq	$0x3f, %rax
1454a8cb6:     	andq	%rcx, %rax
1454a8cb9:     	orq	%rdx, %rax
1454a8cbc:     	xorps	%xmm5, %xmm5
1454a8cbf:     	ucomiss	%xmm5, %xmm2
1454a8cc2:     	movl	$0x0, %r9d
1454a8cc8:     	cmovbq	%r9, %rax
1454a8ccc:     	movss	0x442510(%rip), %xmm3   # 0x1458eb1e4
1454a8cd4:     	ucomiss	%xmm3, %xmm2
1454a8cd7:     	cmovaq	%r15, %rax
1454a8cdb:     	movaps	%xmm9, %xmm2
1454a8cdf:     	subss	%xmm4, %xmm2
1454a8ce3:     	cvttss2si	%xmm2, %rcx
1454a8ce8:     	cvttss2si	%xmm9, %r8
1454a8ced:     	movq	%r8, %rdx
1454a8cf0:     	sarq	$0x3f, %rdx
1454a8cf4:     	andq	%rcx, %rdx
1454a8cf7:     	orq	%r8, %rdx
1454a8cfa:     	ucomiss	%xmm5, %xmm9
1454a8cfe:     	cmovbq	%r9, %rdx
1454a8d02:     	ucomiss	%xmm3, %xmm9
1454a8d06:     	cmovaq	%r15, %rdx
1454a8d0a:     	movq	0x58(%rbx), %rcx
1454a8d0e:     	cmpq	%rcx, %rax
1454a8d11:     	jae	0x1454a8a50 <.text+0x54a7a50>
1454a8d17:     	cmpq	%rcx, %rdx
1454a8d1a:     	jae	0x1454a8a50 <.text+0x54a7a50>
1454a8d20:     	imulq	%rdx, %rcx
1454a8d24:     	addq	%rax, %rcx
1454a8d27:     	movq	0x20(%r13), %rdx
1454a8d2b:     	cmpq	%rdx, %rcx
1454a8d2e:     	jae	0x1454aadd0 <.text+0x54a9dd0>
1454a8d34:     	movq	0x18(%r13), %rax
1454a8d38:     	movzwl	(%rax,%rcx,2), %eax
1454a8d3c:     	cmpw	$-0x1, %ax
1454a8d40:     	je	0x1454a8a50 <.text+0x54a7a50>
1454a8d46:     	movaps	%xmm0, %xmm1
1454a8d49:     	movaps	%xmm6, %xmm0
1454a8d4c:     	movzwl	%ax, %eax
1454a8d4f:     	xorps	%xmm2, %xmm2
1454a8d52:     	cvtsi2ss	%eax, %xmm2
1454a8d56:     	mulss	0x453eda(%rip), %xmm1   # 0x1458fcc38
1454a8d5e:     	addss	0x44279a(%rip), %xmm1   # 0x1458eb500
1454a8d66:     	ucomiss	%xmm1, %xmm2
1454a8d69:     	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8d6f:     	jmp	0x1454a8974 <.text+0x54a7974>
1454a8d74:     	leaq	0x1502970(%rip), %rdi   # 0x1469ab6eb
1454a8d7b:     	movl	$0x19, %esi
1454a8d80:     	movl	$0x19, %edx
1454a8d85:     	movq	%rdi, %rcx
1454a8d88:     	callq	0x145452400 <.text+0x5451400>
1454a8d8d:     	nop
1454a8d8e:     	jmp	0x1454a910a <.text+0x54a810a>
1454a8d93:     	movss	0x444279(%rip), %xmm2   # 0x1458ed014
1454a8d9b:     	xorps	%xmm1, %xmm1
1454a8d9e:     	movq	0x60(%rbp), %rcx
1454a8da2:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454a8da7:     	nop
1454a8da8:     	movaps	%xmm0, %xmm7
1454a8dab:     	movq	%r14, %r15
1454a8dae:     	movss	0x462151(%rip), %xmm8   # 0x14590af08
1454a8db7:     	addss	%xmm7, %xmm8
1454a8dbc:     	movq	0x368(%rbp), %r13
1454a8dc3:     	movss	0x3e8(%r13), %xmm9
1454a8dcc:     	movss	0x3ec(%r13), %xmm10
1454a8dd5:     	movaps	%xmm8, %xmm0
1454a8dd9:     	callq	0x145756e31 <.text+0x5755e31>
1454a8dde:     	movaps	%xmm0, %xmm6
1454a8de1:     	movaps	%xmm8, %xmm0
1454a8de5:     	callq	0x145756e2b <.text+0x5755e2b>
1454a8dea:     	movaps	%xmm0, %xmm8
1454a8dee:     	movss	0x4954d9(%rip), %xmm11  # 0x14593e2d0
1454a8df7:     	leaq	0xa0(%rbp), %rbx
1454a8dfe:     	movss	0x453ee1(%rip), %xmm12  # 0x1458fcce8
1454a8e07:     	movss	0x453fd4(%rip), %xmm13  # 0x1458fcde4
1454a8e10:     	movaps	%xmm6, %xmm2
1454a8e13:     	mulss	%xmm11, %xmm2
1454a8e18:     	addss	%xmm9, %xmm2
1454a8e1d:     	movaps	%xmm8, %xmm3
1454a8e21:     	mulss	%xmm11, %xmm3
1454a8e26:     	addss	%xmm10, %xmm3
1454a8e2b:     	movq	%rbx, %rcx
1454a8e2e:     	movq	%r13, %rdx
1454a8e31:     	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8e36:     	nop
1454a8e37:     	cmpb	$0x0, 0xa0(%rbp)
1454a8e3e:     	jne	0x1454a8e57 <.text+0x54a7e57>
1454a8e40:     	addss	%xmm12, %xmm11
1454a8e45:     	ucomiss	%xmm13, %xmm11
1454a8e49:     	movq	0x368(%rbp), %r13
1454a8e50:     	jae	0x1454a8e10 <.text+0x54a7e10>
1454a8e52:     	jmp	0x1454a924a <.text+0x54a824a>
1454a8e57:     	movss	0xa4(%rbp), %xmm9
1454a8e60:     	movss	0xa8(%rbp), %xmm10
1454a8e69:     	movaps	%xmm7, %xmm0
1454a8e6c:     	callq	0x145756e31 <.text+0x5755e31>
1454a8e71:     	movaps	%xmm0, %xmm6
1454a8e74:     	movaps	%xmm7, %xmm0
1454a8e77:     	callq	0x145756e2b <.text+0x5755e2b>
1454a8e7c:     	movaps	%xmm9, %xmm2
1454a8e80:     	movq	0x368(%rbp), %rsi
1454a8e87:     	subss	0x3e8(%rsi), %xmm2
1454a8e8f:     	movaps	%xmm0, %xmm7
1454a8e92:     	movaps	%xmm10, %xmm1
1454a8e96:     	subss	0x3ec(%rsi), %xmm1
1454a8e9e:     	movaps	%xmm2, %xmm0
1454a8ea1:     	callq	0x145756e67 <.text+0x5755e67>
1454a8ea6:     	movq	0x348(%rbp), %rcx
1454a8ead:     	cmpq	0x80(%rbp), %rcx
1454a8eb4:     	jae	0x1454aaf44 <.text+0x54a9f44>
1454a8eba:     	movaps	%xmm0, %xmm8
1454a8ebe:     	addss	%xmm0, %xmm8
1454a8ec3:     	addss	0x442634(%rip), %xmm8   # 0x1458eb500
1454a8ecc:     	leaq	(%rcx,%rcx,4), %rax
1454a8ed0:     	shlq	$0x4, %rax
1454a8ed4:     	movq	0x290(%rbp), %rcx
1454a8edb:     	movss	0x3c(%rcx,%rax), %xmm1
1454a8ee1:     	movzwl	0x236(%rsi), %eax
1454a8ee8:     	xorps	%xmm0, %xmm0
1454a8eeb:     	cvtsi2ss	%eax, %xmm0
1454a8eef:     	mulss	0x5816a1(%rip), %xmm1   # 0x145a2a598
1454a8ef7:     	divss	0x44262d(%rip), %xmm0   # 0x1458eb52c
1454a8eff:     	mulss	%xmm1, %xmm0
1454a8f03:     	mulss	0x44fe35(%rip), %xmm0   # 0x1458f8d40
1454a8f0b:     	movq	%r15, %rax
1454a8f0e:     	shrq	%rax
1454a8f11:     	movq	%r15, %rdi
1454a8f14:     	subq	%rax, %rdi
1454a8f17:     	js	0x1454a8f24 <.text+0x54a7f24>
1454a8f19:     	xorps	%xmm11, %xmm11
1454a8f1d:     	cvtsi2ss	%rdi, %xmm11
1454a8f22:     	jmp	0x1454a8f40 <.text+0x54a7f40>
1454a8f24:     	movq	%rdi, %rax
1454a8f27:     	shrq	%rax
1454a8f2a:     	movl	%edi, %ecx
1454a8f2c:     	andl	$0x1, %ecx
1454a8f2f:     	orq	%rax, %rcx
1454a8f32:     	xorps	%xmm11, %xmm11
1454a8f36:     	cvtsi2ss	%rcx, %xmm11
1454a8f3b:     	addss	%xmm11, %xmm11
1454a8f40:     	addss	0x4425b3(%rip), %xmm11  # 0x1458eb4fc
1454a8f49:     	mulss	0x442536(%rip), %xmm11  # 0x1458eb488
1454a8f52:     	movaps	%xmm6, %xmm1
1454a8f55:     	unpcklps	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
1454a8f58:     	movsldup	%xmm8, %xmm12           # xmm12 = xmm8[0,0,2,2]
1454a8f5d:     	mulps	%xmm1, %xmm12
1454a8f61:     	maxss	0x442517(%rip), %xmm0   # 0x1458eb480
1454a8f69:     	divss	%xmm0, %xmm8
1454a8f6e:     	xorl	%ebx, %ebx
1454a8f70:     	movss	0x453ebb(%rip), %xmm13  # 0x1458fce34
1454a8f79:     	leaq	0x210(%rbp), %r14
1454a8f80:     	cmpq	%r15, %rbx
1454a8f83:     	jae	0x1454a90f0 <.text+0x54a80f0>
1454a8f89:     	movq	%rbx, %rax
1454a8f8c:     	orq	%rdi, %rax
1454a8f8f:     	shrq	$0x20, %rax
1454a8f93:     	je	0x1454a8fac <.text+0x54a7fac>
1454a8f95:     	movq	%rbx, %rax
1454a8f98:     	xorl	%edx, %edx
1454a8f9a:     	divq	%rdi
1454a8f9d:     	testq	%rax, %rax
1454a8fa0:     	js	0x1454a8fb7 <.text+0x54a7fb7>
1454a8fa2:     	xorps	%xmm0, %xmm0
1454a8fa5:     	cvtsi2ss	%rax, %xmm0
1454a8faa:     	jmp	0x1454a8fcf <.text+0x54a7fcf>
1454a8fac:     	movl	%ebx, %eax
1454a8fae:     	xorl	%edx, %edx
1454a8fb0:     	divl	%edi
1454a8fb2:     	testq	%rax, %rax
1454a8fb5:     	jns	0x1454a8fa2 <.text+0x54a7fa2>
1454a8fb7:     	movq	%rax, %rcx
1454a8fba:     	shrq	%rcx
1454a8fbd:     	andl	$0x1, %eax
1454a8fc0:     	orq	%rcx, %rax
1454a8fc3:     	xorps	%xmm0, %xmm0
1454a8fc6:     	cvtsi2ss	%rax, %xmm0
1454a8fcb:     	addss	%xmm0, %xmm0
1454a8fcf:     	xorps	%xmm3, %xmm3
1454a8fd2:     	cvtsi2ss	%rdx, %xmm3
1454a8fd7:     	subss	%xmm11, %xmm3
1454a8fdc:     	mulss	%xmm13, %xmm3
1454a8fe1:     	movaps	%xmm7, %xmm1
1454a8fe4:     	mulss	%xmm3, %xmm1
1454a8fe8:     	movaps	%xmm9, %xmm2
1454a8fec:     	subss	%xmm1, %xmm2
1454a8ff0:     	movaps	%xmm6, %xmm1
1454a8ff3:     	mulss	%xmm0, %xmm1
1454a8ff7:     	movss	0x44d62d(%rip), %xmm4   # 0x1458f662c
1454a8fff:     	mulss	%xmm4, %xmm1
1454a9003:     	subss	%xmm1, %xmm2
1454a9007:     	mulss	%xmm6, %xmm3
1454a900b:     	addss	%xmm10, %xmm3
1454a9010:     	mulss	%xmm7, %xmm0
1454a9014:     	mulss	%xmm4, %xmm0
1454a9018:     	subss	%xmm0, %xmm3
1454a901c:     	movq	%r14, %rcx
1454a901f:     	movq	%rsi, %rdx
1454a9022:     	callq	0x1454d1b70 <.text+0x54d0b70>
1454a9027:     	nop
1454a9028:     	incq	%rbx
1454a902b:     	cmpl	$0x1, 0x210(%rbp)
1454a9032:     	movq	0x368(%rbp), %rsi
1454a9039:     	jne	0x1454a8f80 <.text+0x54a7f80>
1454a903f:     	movsd	0x214(%rbp), %xmm14
1454a9048:     	movq	%rsi, %rcx
1454a904b:     	movq	0x348(%rbp), %rdx
1454a9052:     	movq	%r14, %r8
1454a9055:     	callq	0x1454c2040 <.text+0x54c1040>
1454a905a:     	nop
1454a905b:     	cmpq	$0x1, %rax
1454a905f:     	movq	0x368(%rbp), %rsi
1454a9066:     	jne	0x1454a8f80 <.text+0x54a7f80>
1454a906c:     	addps	%xmm12, %xmm14
1454a9070:     	movss	0x8e4(%rsi), %xmm0
1454a9078:     	addss	%xmm8, %xmm0
1454a907d:     	addss	0x44d5a7(%rip), %xmm0   # 0x1458f662c
1454a9085:     	movq	0x4c8(%rsi), %rax
1454a908c:     	imulq	$0x160, 0x4d0(%rsi), %r8 # imm = 0x160
1454a9097:     	xorl	%ecx, %ecx
1454a9099:     	movq	%rax, %r9
1454a909c:     	nopl	(%rax)
1454a90a0:     	cmpq	%rcx, %r8
1454a90a3:     	je	0x1454a8f80 <.text+0x54a7f80>
1454a90a9:     	addq	$0x160, %rcx            # imm = 0x160
1454a90b0:     	cmpq	%rdx, 0x88(%r9)
1454a90b7:     	leaq	0x160(%r9), %r9
1454a90be:     	jne	0x1454a90a0 <.text+0x54a80a0>
1454a90c0:     	movl	$0x1, -0xe8(%rax,%rcx)
1454a90cb:     	movlps	%xmm14, -0xe4(%rax,%rcx)
1454a90d4:     	movss	%xmm0, -0xdc(%rax,%rcx)
1454a90dd:     	movss	0x8e4(%rsi), %xmm0
1454a90e5:     	movss	%xmm0, -0x34(%rax,%rcx)
1454a90eb:     	jmp	0x1454a8f80 <.text+0x54a7f80>
1454a90f0:     	leaq	0x15025d9(%rip), %rdi   # 0x1469ab6d0
1454a90f7:     	movl	$0x1b, %esi
1454a90fc:     	movl	$0x1b, %edx
1454a9101:     	movq	%rdi, %rcx
1454a9104:     	callq	0x145452400 <.text+0x5451400>
1454a9109:     	nop
1454a910a:     	movq	%rdx, %r14
1454a910d:     	testq	%rax, %rax
1454a9110:     	cmoveq	%rsi, %r14
1454a9114:     	cmovneq	%rax, %rdi
1454a9118:     	movq	0x80(%rbp), %rdx
1454a911f:     	movq	0x348(%rbp), %rcx
1454a9126:     	cmpq	%rdx, %rcx
1454a9129:     	jae	0x1454aaf06 <.text+0x54a9f06>
1454a912f:     	leaq	(%rcx,%rcx,4), %rsi
1454a9133:     	shlq	$0x4, %rsi
1454a9137:     	movq	0x290(%rbp), %rax
1454a913e:     	addq	%rsi, %rax
1454a9141:     	addq	$0x20, %rax
1454a9145:     	movq	%rax, 0x230(%rbp)
1454a914c:     	leaq	0x274eed(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9153:     	movq	%rax, 0x238(%rbp)
1454a915a:     	leaq	0x1265805(%rip), %rdx   # 0x14670e966
1454a9161:     	leaq	0xa0(%rbp), %rcx
1454a9168:     	leaq	0x230(%rbp), %r8
1454a916f:     	callq	0x14570bf80 <.text+0x570af80>
1454a9174:     	nop
1454a9175:     	movq	%rdi, 0x358(%rbp)
1454a917c:     	movq	0x290(%rbp), %rax
1454a9183:     	addq	%rsi, %rax
1454a9186:     	movq	0xa8(%rbp), %rcx
1454a918d:     	movq	0xb0(%rbp), %rdx
1454a9194:     	movq	0x10(%rax), %r15
1454a9198:     	movq	0x18(%rax), %rbx
1454a919c:     	movq	%rcx, 0x348(%rbp)
1454a91a3:     	callq	0x145452400 <.text+0x5451400>
1454a91a8:     	nop
1454a91a9:     	movq	%rax, %rdi
1454a91ac:     	movq	%rdx, %r13
1454a91af:     	movq	0xa0(%rbp), %rdx
1454a91b6:     	testq	%rdx, %rdx
1454a91b9:     	je	0x1454a91cd <.text+0x54a81cd>
1454a91bb:     	movl	$0x1, %r8d
1454a91c1:     	movq	0x348(%rbp), %rcx
1454a91c8:     	callq	0x1400021d0 <.text+0x11d0>
1454a91cd:     	testq	%rdi, %rdi
1454a91d0:     	cmovneq	%rdi, %r15
1454a91d4:     	cmoveq	%rbx, %r13
1454a91d8:     	movq	%r14, 0x20(%rsp)
1454a91dd:     	leaq	0xa0(%rbp), %rcx
1454a91e4:     	movq	%r15, %rdx
1454a91e7:     	movq	%r13, %r8
1454a91ea:     	movq	0x358(%rbp), %r9
1454a91f1:     	callq	0x14543f640 <.text+0x543e640>
1454a91f6:     	nop
1454a91f7:     	movq	0x368(%rbp), %r13
1454a91fe:     	movq	0x548(%r13), %rsi
1454a9205:     	cmpq	0x538(%r13), %rsi
1454a920c:     	jne	0x1454a921b <.text+0x54a821b>
1454a920e:     	movq	0x340(%rbp), %rcx
1454a9215:     	callq	0x1457580b0 <.text+0x57570b0>
1454a921a:     	nop
1454a921b:     	movq	0x540(%r13), %rax
1454a9222:     	movq	%rsi, %rcx
1454a9225:     	shlq	$0x5, %rcx
1454a9229:     	movups	0xa0(%rbp), %xmm0
1454a9230:     	movups	0xb0(%rbp), %xmm1
1454a9237:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a923c:     	movups	%xmm0, (%rax,%rcx)
1454a9240:     	incq	%rsi
1454a9243:     	movq	%rsi, 0x548(%r13)
1454a924a:     	movq	0x228(%rbp), %rdx
1454a9251:     	testq	%rdx, %rdx
1454a9254:     	movq	0x328(%rbp), %rcx
1454a925b:     	je	0x1454a926c <.text+0x54a826c>
1454a925d:     	shlq	$0x3, %rdx
1454a9261:     	movl	$0x8, %r8d
1454a9267:     	callq	0x1400021d0 <.text+0x11d0>
1454a926c:     	movq	0x2d8(%rbp), %rdx
1454a9273:     	testq	%rdx, %rdx
1454a9276:     	je	0x1454a928a <.text+0x54a828a>
1454a9278:     	movl	$0x1, %r8d
1454a927e:     	movq	0x298(%rbp), %rcx
1454a9285:     	callq	0x1400021d0 <.text+0x11d0>
1454a928a:     	movss	0x8e4(%r13), %xmm0
1454a9293:     	movss	0x68(%rbp), %xmm6
1454a9298:     	mulss	0x5985d4(%rip), %xmm6   # 0x145a41874
1454a92a0:     	addss	0x487c58(%rip), %xmm6   # 0x145930f00
1454a92a8:     	maxss	0x51e738(%rip), %xmm6   # 0x1459c79e8
1454a92b0:     	addss	%xmm0, %xmm6
1454a92b4:     	movss	%xmm6, 0x914(%r13)
