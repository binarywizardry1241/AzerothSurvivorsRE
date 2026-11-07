
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e8ba0:     	pushq	%rbp
1454e8ba1:     	pushq	%r15
1454e8ba3:     	pushq	%r14
1454e8ba5:     	pushq	%rsi
1454e8ba6:     	pushq	%rdi
1454e8ba7:     	pushq	%rbx
1454e8ba8:     	subq	$0x158, %rsp            # imm = 0x158
1454e8baf:     	leaq	0x80(%rsp), %rbp
1454e8bb7:     	movaps	%xmm9, 0xc0(%rbp)
1454e8bbf:     	movaps	%xmm8, 0xb0(%rbp)
1454e8bc7:     	movaps	%xmm7, 0xa0(%rbp)
1454e8bce:     	movaps	%xmm6, 0x90(%rbp)
1454e8bd5:     	movq	$-0x2, 0x88(%rbp)
1454e8be0:     	movss	0x41e954(%rip), %xmm0   # 0x14590753c
1454e8be8:     	ucomiss	0x7dc(%rcx), %xmm0
1454e8bef:     	ja	0x1454e9031 <.text+0x54e8031>
1454e8bf5:     	movq	%rcx, %rsi
1454e8bf8:     	movss	0x934(%rcx), %xmm0
1454e8c00:     	movq	0x748(%rcx), %rcx
1454e8c07:     	movss	0x51f6a1(%rip), %xmm1   # 0x145a082b0
1454e8c0f:     	testq	%rcx, %rcx
1454e8c12:     	je	0x1454e8c6f <.text+0x54e7c6f>
1454e8c14:     	movq	0x740(%rsi), %rax
1454e8c1b:     	shlq	$0x3, %rcx
1454e8c1f:     	leaq	(%rcx,%rcx,2), %rdx
1454e8c23:     	xorl	%ecx, %ecx
1454e8c25:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454e8c2f:     	jmp	0x1454e8c49 <.text+0x54e7c49>
1454e8c31:     	nopw	%cs:(%rax,%rax)
1454e8c40:     	addq	$0x18, %rcx
1454e8c44:     	cmpq	%rcx, %rdx
1454e8c47:     	je	0x1454e8c6f <.text+0x54e7c6f>
1454e8c49:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454e8c4f:     	jne	0x1454e8c40 <.text+0x54e7c40>
1454e8c51:     	movq	(%rax,%rcx), %r9
1454e8c55:     	movq	(%r9), %r10
1454e8c58:     	xorq	%r8, %r10
1454e8c5b:     	movzbl	0x8(%r9), %r9d
1454e8c60:     	xorq	$0x65, %r9
1454e8c64:     	orq	%r10, %r9
1454e8c67:     	jne	0x1454e8c40 <.text+0x54e7c40>
1454e8c69:     	movss	0x10(%rax,%rcx), %xmm1
1454e8c6f:     	ucomiss	%xmm1, %xmm0
1454e8c72:     	jb	0x1454e9031 <.text+0x54e8031>
1454e8c78:     	movq	0x2b8(%rsi), %rcx
1454e8c7f:     	testq	%rcx, %rcx
1454e8c82:     	je	0x1454e9031 <.text+0x54e8031>
1454e8c88:     	movq	0x2b0(%rsi), %rax
1454e8c8f:     	imulq	$0x58, %rcx, %rdx
1454e8c93:     	xorl	%ecx, %ecx
1454e8c95:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454e8c9f:     	jmp	0x1454e8cbd <.text+0x54e7cbd>
1454e8ca1:     	nopw	%cs:(%rax,%rax)
1454e8cb0:     	addq	$0x58, %rcx
1454e8cb4:     	cmpq	%rcx, %rdx
1454e8cb7:     	je	0x1454e9031 <.text+0x54e8031>
1454e8cbd:     	movq	(%rax,%rcx), %rdi
1454e8cc1:     	cmpq	$0x9, 0x8(%rdi)
1454e8cc6:     	jne	0x1454e8cb0 <.text+0x54e7cb0>
1454e8cc8:     	movq	(%rdi), %r9
1454e8ccb:     	movq	(%r9), %r10
1454e8cce:     	xorq	%r8, %r10
1454e8cd1:     	movzbl	0x8(%r9), %r9d
1454e8cd6:     	xorq	$0x65, %r9
1454e8cda:     	orq	%r10, %r9
1454e8cdd:     	jne	0x1454e8cb0 <.text+0x54e7cb0>
1454e8cdf:     	movl	0x8(%rax,%rcx), %edx
1454e8ce3:     	movss	0x14(%rax,%rcx), %xmm0
1454e8ce9:     	movl	0x18(%rax,%rcx), %r8d
1454e8cee:     	movl	0x34(%rax,%rcx), %r9d
1454e8cf3:     	movl	%r9d, 0x4(%rbp)
1454e8cf7:     	movups	0x24(%rax,%rcx), %xmm1
1454e8cfc:     	movups	%xmm1, -0xc(%rbp)
1454e8d00:     	movups	0x38(%rax,%rcx), %xmm1
1454e8d05:     	movups	0x44(%rax,%rcx), %xmm2
1454e8d0a:     	movups	%xmm1, 0x8(%rbp)
1454e8d0e:     	movups	%xmm2, 0x14(%rbp)
1454e8d12:     	movq	%rdi, -0x30(%rbp)
1454e8d16:     	movl	%edx, -0x28(%rbp)
1454e8d19:     	movss	0x10(%rax,%rcx), %xmm7
1454e8d1f:     	movsd	0xc(%rax,%rcx), %xmm1
1454e8d25:     	movsd	%xmm1, -0x24(%rbp)
1454e8d2a:     	movss	%xmm0, -0x1c(%rbp)
1454e8d2f:     	movl	%r8d, -0x18(%rbp)
1454e8d33:     	movsd	0x1c(%rax,%rcx), %xmm0
1454e8d39:     	movsd	%xmm0, -0x14(%rbp)
1454e8d3e:     	movss	0x470(%rsi), %xmm8
1454e8d47:     	movss	0x474(%rsi), %xmm6
1454e8d4f:     	movss	0x498(%rsi), %xmm1
1454e8d57:     	movl	0x408(%rsi), %eax
1454e8d5d:     	movl	%eax, 0x40(%rbp)
1454e8d60:     	movq	0x400(%rsi), %rax
1454e8d67:     	movq	%rax, 0x38(%rbp)
1454e8d6b:     	mulss	0x14(%rbp), %xmm0
1454e8d70:     	mulss	0x50(%rdi), %xmm0
1454e8d75:     	mulss	%xmm1, %xmm0
1454e8d79:     	movss	0x730663(%rip), %xmm1   # 0x145c193e4
1454e8d81:     	ucomiss	%xmm0, %xmm1
1454e8d84:     	jae	0x1454e8dae <.text+0x54e7dae>
1454e8d86:     	addss	0x14f1472(%rip), %xmm0  # 0x1469da200
1454e8d8e:     	movss	0x42ca69(%rip), %xmm9   # 0x145915800
1454e8d97:     	divss	%xmm9, %xmm0
1454e8d9c:     	callq	0x145773367 <.text+0x5772367>
1454e8da1:     	mulss	%xmm9, %xmm0
1454e8da6:     	addss	0x730636(%rip), %xmm0   # 0x145c193e4
1454e8dae:     	movq	$0x0, 0x28(%rsp)
1454e8db7:     	movq	$0x8, 0x20(%rsp)
1454e8dc0:     	leaq	0x58(%rbp), %rcx
1454e8dc4:     	leaq	0x38(%rbp), %r8
1454e8dc8:     	movq	%rsi, %rdx
1454e8dcb:     	movaps	%xmm0, %xmm3
1454e8dce:     	callq	0x145500300 <.text+0x54ff300>
1454e8dd3:     	movq	0x68(%rbp), %rbx
1454e8dd7:     	testq	%rbx, %rbx
1454e8dda:     	je	0x1454e8eb4 <.text+0x54e7eb4>
1454e8de0:     	movl	$0x0, 0x7dc(%rsi)
1454e8dea:     	movb	$0x1, 0x87(%rbp)
1454e8df1:     	leaq	-0x30(%rbp), %rdx
1454e8df5:     	movq	%rsi, %rcx
1454e8df8:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454e8dfd:     	nop
1454e8dfe:     	movq	0x3e8(%rsi), %rdx
1454e8e05:     	movq	0x60(%rbp), %r9
1454e8e09:     	movl	$0x2, -0x40(%rbp)
1454e8e10:     	movl	$0x0, 0x2c(%rbp)
1454e8e17:     	movb	$0x1, 0x87(%rbp)
1454e8e1e:     	leaq	0x2c(%rbp), %rax
1454e8e22:     	movq	%rax, 0x30(%rsp)
1454e8e27:     	leaq	-0x40(%rbp), %rax
1454e8e2b:     	movq	%rax, 0x28(%rsp)
1454e8e30:     	movq	%rbx, 0x20(%rsp)
1454e8e35:     	leaq	0x38(%rbp), %rcx
1454e8e39:     	movl	$0x147e, %r8d           # imm = 0x147E
1454e8e3f:     	movq	%r9, 0x78(%rbp)
1454e8e43:     	callq	0x145466ab0 <.text+0x5465ab0>
1454e8e48:     	nop
1454e8e49:     	movq	0x560(%rsi), %r14
1454e8e50:     	cmpq	0x550(%rsi), %r14
1454e8e57:     	jne	0x1454e8e66 <.text+0x54e7e66>
1454e8e59:     	leaq	0x550(%rsi), %rcx
1454e8e60:     	callq	0x145774710 <.text+0x5773710>
1454e8e65:     	nop
1454e8e66:     	movq	0x558(%rsi), %rax
1454e8e6d:     	movq	%r14, %rcx
1454e8e70:     	shlq	$0x5, %rcx
1454e8e74:     	movups	0x38(%rbp), %xmm0
1454e8e78:     	movups	0x48(%rbp), %xmm1
1454e8e7c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e8e81:     	movups	%xmm0, (%rax,%rcx)
1454e8e85:     	incq	%r14
1454e8e88:     	movq	%r14, 0x560(%rsi)
1454e8e8f:     	movss	0x44(%rdi), %xmm1
1454e8e94:     	movss	0x8(%rbp), %xmm0
1454e8e99:     	movzbl	0x75(%rdi), %eax
1454e8e9d:     	addb	$-0x2, %al
1454e8e9f:     	cmpb	$0x6, %al
1454e8ea1:     	ja	0x1454e8ece <.text+0x54e7ece>
1454e8ea3:     	movzbl	%al, %eax
1454e8ea6:     	leaq	0x150f687(%rip), %rcx   # 0x1469f8534
1454e8ead:     	movss	(%rcx,%rax,4), %xmm2
1454e8eb2:     	jmp	0x1454e8ed6 <.text+0x54e7ed6>
1454e8eb4:     	movq	0x58(%rbp), %rdx
1454e8eb8:     	testq	%rdx, %rdx
1454e8ebb:     	je	0x1454e9031 <.text+0x54e8031>
1454e8ec1:     	movq	0x60(%rbp), %rax
1454e8ec5:     	movq	%rax, 0x78(%rbp)
1454e8ec9:     	jmp	0x1454e901e <.text+0x54e801e>
1454e8ece:     	movss	0x41e5ba(%rip), %xmm2   # 0x145907490
1454e8ed6:     	mulss	0x1c(%rbp), %xmm8
1454e8edc:     	xorps	%xmm3, %xmm3
1454e8edf:     	cmpltss	%xmm1, %xmm3
1454e8ee4:     	andps	%xmm8, %xmm3
1454e8ee8:     	mulss	0x42f800(%rip), %xmm1   # 0x1459186f0
1454e8ef0:     	mulss	%xmm1, %xmm7
1454e8ef4:     	mulss	%xmm7, %xmm0
1454e8ef8:     	mulss	%xmm2, %xmm0
1454e8efc:     	addss	%xmm3, %xmm0
1454e8f00:     	mulss	%xmm0, %xmm6
1454e8f04:     	movq	0x58(%rbp), %rax
1454e8f08:     	movq	%rax, 0x70(%rbp)
1454e8f0c:     	shlq	$0x3, %rbx
1454e8f10:     	movzbl	0x129(%rsi), %r14d
1454e8f18:     	movups	0x20(%rsi), %xmm7
1454e8f1c:     	movups	0x40(%rsi), %xmm8
1454e8f21:     	xorl	%r15d, %r15d
1454e8f24:     	movss	0x51f473(%rip), %xmm9   # 0x145a083a0
1454e8f2d:     	nopl	(%rax)
1454e8f30:     	movq	0x78(%rbp), %rax
1454e8f34:     	movq	(%rax,%r15), %rdx
1454e8f38:     	movq	0x8a0(%rsi), %rax
1454e8f3f:     	movq	0x8b8(%rsi), %rcx
1454e8f46:     	leaq	(%rcx,%rax), %r8
1454e8f4a:     	rolq	$0x17, %r8
1454e8f4e:     	addq	%rax, %r8
1454e8f51:     	movq	0x8a8(%rsi), %r9
1454e8f58:     	movq	%r9, %r10
1454e8f5b:     	shlq	$0x11, %r10
1454e8f5f:     	movq	0x8b0(%rsi), %r11
1454e8f66:     	xorq	%rax, %r11
1454e8f69:     	xorq	%r9, %rcx
1454e8f6c:     	xorq	%r11, %r9
1454e8f6f:     	movq	%r9, 0x8a8(%rsi)
1454e8f76:     	xorq	%rcx, %rax
1454e8f79:     	movq	%rax, 0x8a0(%rsi)
1454e8f80:     	xorq	%r10, %r11
1454e8f83:     	movq	%r11, 0x8b0(%rsi)
1454e8f8a:     	rolq	$0x2d, %rcx
1454e8f8e:     	movq	%rcx, 0x8b8(%rsi)
1454e8f95:     	shrq	$0x28, %r8
1454e8f99:     	xorps	%xmm0, %xmm0
1454e8f9c:     	cvtsi2ss	%r8d, %xmm0
1454e8fa1:     	mulss	%xmm9, %xmm0
1454e8fa6:     	movss	0x47c(%rsi), %xmm1
1454e8fae:     	movss	0x480(%rsi), %xmm2
1454e8fb6:     	mulss	%xmm6, %xmm2
1454e8fba:     	movl	0x40(%rdi), %r9d
1454e8fbe:     	movzbl	0x74(%rdi), %eax
1454e8fc2:     	movb	$0x3, 0x129(%rsi)
1454e8fc9:     	movq	$0x0, 0x20(%rsi)
1454e8fd1:     	movq	$0x0, 0x40(%rsi)
1454e8fd9:     	ucomiss	%xmm0, %xmm1
1454e8fdc:     	ja	0x1454e8fe1 <.text+0x54e7fe1>
1454e8fde:     	movaps	%xmm6, %xmm2
1454e8fe1:     	seta	0x28(%rsp)
1454e8fe6:     	movb	%al, 0x20(%rsp)
1454e8fea:     	movb	$0x0, 0x30(%rsp)
1454e8fef:     	movq	%rsi, %rcx
1454e8ff2:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454e8ff7:     	nop
1454e8ff8:     	movb	%r14b, 0x129(%rsi)
1454e8fff:     	movups	%xmm7, 0x20(%rsi)
1454e9003:     	movups	%xmm8, 0x40(%rsi)
1454e9008:     	addq	$0x8, %r15
1454e900c:     	cmpq	%r15, %rbx
1454e900f:     	jne	0x1454e8f30 <.text+0x54e7f30>
1454e9015:     	movq	0x70(%rbp), %rdx
1454e9019:     	testq	%rdx, %rdx
1454e901c:     	je	0x1454e9031 <.text+0x54e8031>
1454e901e:     	shlq	$0x3, %rdx
1454e9022:     	movl	$0x8, %r8d
1454e9028:     	movq	0x78(%rbp), %rcx
1454e902c:     	callq	0x1400021d0 <.text+0x11d0>
1454e9031:     	movaps	0x90(%rbp), %xmm6
1454e9038:     	movaps	0xa0(%rbp), %xmm7
1454e903f:     	movaps	0xb0(%rbp), %xmm8
1454e9047:     	movaps	0xc0(%rbp), %xmm9
1454e904f:     	addq	$0x158, %rsp            # imm = 0x158
1454e9056:     	popq	%rbx
1454e9057:     	popq	%rdi
1454e9058:     	popq	%rsi
1454e9059:     	popq	%r14
1454e905b:     	popq	%r15
1454e905d:     	popq	%rbp
1454e905e:     	retq
