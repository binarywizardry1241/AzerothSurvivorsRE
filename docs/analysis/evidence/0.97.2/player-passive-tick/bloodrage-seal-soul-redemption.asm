
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a0987:     	movq	0x298(%r13), %rax
1454a098e:     	movq	0x2a0(%r13), %rcx
1454a0995:     	imulq	$0x58, %rcx, %rdx
1454a0999:     	xorl	%r8d, %r8d
1454a099c:     	nopl	(%rax)
1454a09a0:     	cmpq	%r8, %rdx
1454a09a3:     	je	0x1454a3884 <.text+0x54a2884>
1454a09a9:     	movq	(%rax,%r8), %r9
1454a09ad:     	addq	$0x58, %r8
1454a09b1:     	cmpb	$0xb, 0x75(%r9)
1454a09b6:     	jne	0x1454a09a0 <.text+0x549f9a0>
1454a09b8:     	movss	0x8e4(%r13), %xmm8
1454a09c1:     	movss	%xmm8, 0x10(%rbp)
1454a09c7:     	movabsq	$0x6974706d65646572, %r13 # imm = 0x6974706D65646572
1454a09d1:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a09db:     	testq	%rcx, %rcx
1454a09de:     	je	0x1454a0e8e <.text+0x549fe8e>
1454a09e4:     	movq	0x368(%rbp), %rcx
1454a09eb:     	movss	0x460(%rcx), %xmm7
1454a09f3:     	leaq	(%rax,%rdx), %r8
1454a09f7:     	xorl	%r9d, %r9d
1454a09fa:     	jmp	0x1454a0a0d <.text+0x549fa0d>
1454a09fc:     	nopl	(%rax)
1454a0a00:     	addq	$0x58, %r9
1454a0a04:     	cmpq	%r9, %rdx
1454a0a07:     	je	0x1454a0b1f <.text+0x549fb1f>
1454a0a0d:     	movq	(%rax,%r9), %r10
1454a0a11:     	cmpq	$0x9, 0x8(%r10)
1454a0a16:     	jne	0x1454a0a00 <.text+0x549fa00>
1454a0a18:     	movq	(%r10), %rcx
1454a0a1b:     	movq	(%rcx), %r11
1454a0a1e:     	xorq	%r12, %r11
1454a0a21:     	movzbl	0x8(%rcx), %esi
1454a0a25:     	xorq	$0x65, %rsi
1454a0a29:     	orq	%r11, %rsi
1454a0a2c:     	jne	0x1454a0a00 <.text+0x549fa00>
1454a0a2e:     	movss	0x48(%r10), %xmm9
1454a0a34:     	mulss	0x458303(%rip), %xmm9   # 0x1458f8d40
1454a0a3d:     	mulss	0x14(%rax,%r9), %xmm9
1454a0a44:     	mulss	0x3c(%rax,%r9), %xmm9
1454a0a4b:     	movss	0x50(%rax,%r9), %xmm10
1454a0a52:     	mulss	%xmm7, %xmm9
1454a0a57:     	maxss	0x44c5b0(%rip), %xmm9   # 0x1458ed010
1454a0a60:     	movl	$0x9, %edx
1454a0a65:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454a0a6a:     	maxss	0x455bad(%rip), %xmm10  # 0x1458f6620
1454a0a73:     	maxss	%xmm9, %xmm0
1454a0a78:     	divss	%xmm10, %xmm0
1454a0a7d:     	movss	0x44aaa7(%rip), %xmm1   # 0x1458eb52c
1454a0a85:     	divss	%xmm0, %xmm1
1454a0a89:     	movaps	%xmm6, %xmm0
1454a0a8c:     	mulss	%xmm1, %xmm0
1454a0a90:     	movq	0x368(%rbp), %rsi
1454a0a97:     	addss	0x7c8(%rsi), %xmm0
1454a0a9f:     	mulss	0x44a9e1(%rip), %xmm1   # 0x1458eb488
1454a0aa7:     	maxss	0x455b75(%rip), %xmm1   # 0x1458f6624
1454a0aaf:     	minss	%xmm1, %xmm0
1454a0ab3:     	movss	%xmm0, 0x7c8(%rsi)
1454a0abb:     	subss	0x7cc(%rsi), %xmm8
1454a0ac4:     	ucomiss	0x455b60(%rip), %xmm8   # 0x1458f662c
1454a0acc:     	jbe	0x1454a0af1 <.text+0x549faf1>
1454a0ace:     	movss	0x49d79a(%rip), %xmm0   # 0x14593e270
1454a0ad6:     	mulss	%xmm6, %xmm0
1454a0ada:     	addss	0x7c4(%rsi), %xmm0
1454a0ae2:     	xorps	%xmm1, %xmm1
1454a0ae5:     	maxss	%xmm1, %xmm0
1454a0ae9:     	movss	%xmm0, 0x7c4(%rsi)
1454a0af1:     	movq	%rsi, %rcx
1454a0af4:     	callq	0x1454d69f0 <.text+0x54d59f0>
1454a0af9:     	movq	0x2a0(%rsi), %rcx
1454a0b00:     	testq	%rcx, %rcx
1454a0b03:     	je	0x1454a0e8e <.text+0x549fe8e>
1454a0b09:     	movq	0x368(%rbp), %rax
1454a0b10:     	movq	0x298(%rax), %rax
1454a0b17:     	imulq	$0x58, %rcx, %rdx
1454a0b1b:     	leaq	(%rax,%rdx), %r8
1454a0b1f:     	movabsq	$0x7461665f6c616573, %r10 # imm = 0x7461665F6C616573
1454a0b29:     	movq	%rax, %r9
1454a0b2c:     	jmp	0x1454a0b3d <.text+0x549fb3d>
1454a0b2e:     	nop
1454a0b30:     	addq	$0x58, %r9
1454a0b34:     	cmpq	%r8, %r9
1454a0b37:     	je	0x1454a0c0d <.text+0x549fc0d>
1454a0b3d:     	movq	(%r9), %r11
1454a0b40:     	cmpq	$0x9, 0x8(%r11)
1454a0b45:     	jne	0x1454a0b30 <.text+0x549fb30>
1454a0b47:     	movq	(%r11), %rcx
1454a0b4a:     	movq	(%rcx), %rsi
1454a0b4d:     	xorq	%r10, %rsi
1454a0b50:     	movzbl	0x8(%rcx), %edi
1454a0b54:     	xorq	$0x65, %rdi
1454a0b58:     	orq	%rsi, %rdi
1454a0b5b:     	jne	0x1454a0b30 <.text+0x549fb30>
1454a0b5d:     	movss	0x48(%r11), %xmm0
1454a0b63:     	mulss	0x4581d5(%rip), %xmm0   # 0x1458f8d40
1454a0b6b:     	mulss	0x14(%r9), %xmm0
1454a0b71:     	mulss	0x3c(%r9), %xmm0
1454a0b77:     	movss	0x50(%r9), %xmm8
1454a0b7d:     	mulss	%xmm0, %xmm7
1454a0b81:     	maxss	0x44c487(%rip), %xmm7   # 0x1458ed010
1454a0b89:     	movl	$0x9, %edx
1454a0b8e:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454a0b93:     	maxss	%xmm7, %xmm0
1454a0b97:     	maxss	0x455a80(%rip), %xmm8   # 0x1458f6620
1454a0ba0:     	divss	%xmm8, %xmm0
1454a0ba5:     	movss	0x458237(%rip), %xmm1   # 0x1458f8de4
1454a0bad:     	divss	%xmm0, %xmm1
1454a0bb1:     	movaps	%xmm6, %xmm0
1454a0bb4:     	mulss	%xmm1, %xmm0
1454a0bb8:     	movq	0x368(%rbp), %rsi
1454a0bbf:     	addss	0x7d4(%rsi), %xmm0
1454a0bc7:     	mulss	0x44a8b9(%rip), %xmm1   # 0x1458eb488
1454a0bcf:     	maxss	0x455a4d(%rip), %xmm1   # 0x1458f6624
1454a0bd7:     	minss	%xmm1, %xmm0
1454a0bdb:     	movss	%xmm0, 0x7d4(%rsi)
1454a0be3:     	movq	%rsi, %rcx
1454a0be6:     	callq	0x1454d7020 <.text+0x54d6020>
1454a0beb:     	movq	0x2a0(%rsi), %rcx
1454a0bf2:     	testq	%rcx, %rcx
1454a0bf5:     	je	0x1454a0e8e <.text+0x549fe8e>
1454a0bfb:     	movq	0x368(%rbp), %rax
1454a0c02:     	movq	0x298(%rax), %rax
1454a0c09:     	imulq	$0x58, %rcx, %rdx
1454a0c0d:     	leaq	(%rax,%rdx), %rcx
1454a0c11:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454a0c1b:     	movq	%rax, %r9
1454a0c1e:     	jmp	0x1454a0c2d <.text+0x549fc2d>
1454a0c20:     	addq	$0x58, %r9
1454a0c24:     	cmpq	%rcx, %r9
1454a0c27:     	je	0x1454a0e4e <.text+0x549fe4e>
1454a0c2d:     	movq	(%r9), %r10
1454a0c30:     	cmpq	$0x9, 0x8(%r10)
1454a0c35:     	jne	0x1454a0c20 <.text+0x549fc20>
1454a0c37:     	movq	(%r10), %r10
1454a0c3a:     	movq	(%r10), %r11
1454a0c3d:     	xorq	%r8, %r11
1454a0c40:     	movzbl	0x8(%r10), %r10d
1454a0c45:     	xorq	$0x65, %r10
1454a0c49:     	orq	%r11, %r10
1454a0c4c:     	jne	0x1454a0c20 <.text+0x549fc20>
1454a0c4e:     	movq	0x368(%rbp), %rsi
1454a0c55:     	movq	%rsi, %rcx
1454a0c58:     	callq	0x1454d5bd0 <.text+0x54d4bd0>
1454a0c5d:     	movss	0x8e4(%rsi), %xmm0
1454a0c65:     	movss	%xmm0, 0x2d8(%rbp)
1454a0c6d:     	leaq	0x738(%rsi), %rdi
1454a0c74:     	movq	0x738(%rsi), %rax
1454a0c7b:     	movq	0x740(%rsi), %rcx
1454a0c82:     	movq	0x748(%rsi), %rdx
1454a0c89:     	movq	$0x0, 0x738(%rsi)
1454a0c94:     	movq	$0x8, 0x740(%rsi)
1454a0c9f:     	movq	$0x0, 0x748(%rsi)
1454a0caa:     	leaq	(%rdx,%rdx,2), %rdx
1454a0cae:     	leaq	(%rcx,%rdx,8), %rdx
1454a0cb2:     	movq	%rcx, 0x230(%rbp)
1454a0cb9:     	movq	%rax, 0x240(%rbp)
1454a0cc0:     	movq	%rcx, 0x238(%rbp)
1454a0cc7:     	movq	%rdx, 0x248(%rbp)
1454a0cce:     	leaq	0xa0(%rbp), %rcx
1454a0cd5:     	leaq	0x230(%rbp), %rdx
1454a0cdc:     	leaq	0x2d8(%rbp), %r8
1454a0ce3:     	callq	0x1455464c0 <.text+0x55454c0>
1454a0ce8:     	movq	0xa0(%rbp), %rax
1454a0cef:     	movq	%rax, 0x340(%rbp)
1454a0cf6:     	movq	0xa8(%rbp), %r14
1454a0cfd:     	movq	0xb0(%rbp), %rbx
1454a0d04:     	movq	0xc8(%rbp), %rax
1454a0d0b:     	movq	%rax, 0x240(%rbp)
1454a0d12:     	movups	0xb8(%rbp), %xmm0
1454a0d19:     	movaps	%xmm0, 0x230(%rbp)
1454a0d20:     	movq	0x738(%rsi), %rax
1454a0d27:     	testq	%rax, %rax
1454a0d2a:     	je	0x1454a0d46 <.text+0x549fd46>
1454a0d2c:     	movq	0x740(%rsi), %rcx
1454a0d33:     	shlq	$0x3, %rax
1454a0d37:     	leaq	(%rax,%rax,2), %rdx
1454a0d3b:     	movl	$0x8, %r8d
1454a0d41:     	callq	0x1400021d0 <.text+0x11d0>
1454a0d46:     	movq	0x240(%rbp), %rax
1454a0d4d:     	movq	%rax, 0x10(%rdi)
1454a0d51:     	movaps	0x230(%rbp), %xmm0
1454a0d58:     	movups	%xmm0, (%rdi)
1454a0d5b:     	testq	%rbx, %rbx
1454a0d5e:     	je	0x1454a0e07 <.text+0x549fe07>
1454a0d64:     	shlq	$0x3, %rbx
1454a0d68:     	leaq	(%rbx,%rbx,2), %rdi
1454a0d6c:     	xorl	%ebx, %ebx
1454a0d6e:     	movq	%r14, 0x358(%rbp)
1454a0d75:     	nopw	%cs:(%rax,%rax)
1454a0d80:     	movzbl	0x10(%r14,%rbx), %eax
1454a0d86:     	cmpb	$0x2, %al
1454a0d88:     	je	0x1454a0e07 <.text+0x549fe07>
1454a0d8a:     	movss	0xc(%r14,%rbx), %xmm2
1454a0d91:     	movq	(%r14,%rbx), %rdx
1454a0d95:     	movq	0x368(%rbp), %r14
1454a0d9c:     	movb	0x111(%r14), %sil
1454a0da3:     	movb	$0x3, 0x111(%r14)
1454a0dab:     	movups	0x20(%r14), %xmm7
1454a0db0:     	movups	0x40(%r14), %xmm8
1454a0db5:     	movq	$0x0, 0x20(%r14)
1454a0dbd:     	movq	$0x0, 0x40(%r14)
1454a0dc5:     	movb	%al, 0x28(%rsp)
1454a0dc9:     	movb	$0x0, 0x30(%rsp)
1454a0dce:     	movb	$0x2, 0x20(%rsp)
1454a0dd3:     	movq	%r14, %rcx
1454a0dd6:     	movl	$0x18d1, %r9d           # imm = 0x18D1
1454a0ddc:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a0de1:     	nop
1454a0de2:     	movb	%sil, 0x111(%r14)
1454a0de9:     	movups	%xmm7, 0x20(%r14)
1454a0dee:     	movups	%xmm8, 0x40(%r14)
1454a0df3:     	addq	$0x18, %rbx
1454a0df7:     	cmpq	%rbx, %rdi
1454a0dfa:     	movq	0x358(%rbp), %r14
1454a0e01:     	jne	0x1454a0d80 <.text+0x549fd80>
1454a0e07:     	movq	0x340(%rbp), %rax
1454a0e0e:     	testq	%rax, %rax
1454a0e11:     	je	0x1454a0e29 <.text+0x549fe29>
1454a0e13:     	shlq	$0x3, %rax
1454a0e17:     	leaq	(%rax,%rax,2), %rdx
1454a0e1b:     	movl	$0x8, %r8d
1454a0e21:     	movq	%r14, %rcx
1454a0e24:     	callq	0x1400021d0 <.text+0x11d0>
1454a0e29:     	movq	0x368(%rbp), %rax
1454a0e30:     	movq	0x2a0(%rax), %rcx
1454a0e37:     	testq	%rcx, %rcx
1454a0e3a:     	je	0x1454a0e8e <.text+0x549fe8e>
1454a0e3c:     	movq	0x368(%rbp), %rax
1454a0e43:     	movq	0x298(%rax), %rax
1454a0e4a:     	imulq	$0x58, %rcx, %rdx
1454a0e4e:     	addq	%rax, %rdx
1454a0e51:     	jmp	0x1454a0e69 <.text+0x549fe69>
1454a0e53:     	nopw	%cs:(%rax,%rax)
1454a0e60:     	addq	$0x58, %rax
1454a0e64:     	cmpq	%rdx, %rax
1454a0e67:     	je	0x1454a0e8e <.text+0x549fe8e>
1454a0e69:     	movq	(%rax), %rcx
1454a0e6c:     	cmpq	$0xa, 0x8(%rcx)
1454a0e71:     	jne	0x1454a0e60 <.text+0x549fe60>
1454a0e73:     	movq	(%rcx), %rcx
1454a0e76:     	movq	(%rcx), %r8
1454a0e79:     	xorq	%r13, %r8
1454a0e7c:     	movzwl	0x8(%rcx), %ecx
1454a0e80:     	xorq	$0x6e6f, %rcx           # imm = 0x6E6F
1454a0e87:     	orq	%r8, %rcx
1454a0e8a:     	jne	0x1454a0e60 <.text+0x549fe60>
1454a0e8c:     	jmp	0x1454a0ea3 <.text+0x549fea3>
1454a0e8e:     	movq	0x368(%rbp), %rax
1454a0e95:     	cmpq	$0x0, 0x760(%rax)
1454a0e9d:     	je	0x1454a13ac <.text+0x54a03ac>
1454a0ea3:     	movq	0x368(%rbp), %rax
1454a0eaa:     	movss	0x8e4(%rax), %xmm7
1454a0eb2:     	leaq	0x538(%rax), %rbx
1454a0eb9:     	leaq	0x2b4(%rbp), %rsi
1454a0ec0:     	movss	0x75b54b(%rip), %xmm8   # 0x145bfc414
1454a0ec9:     	leaq	0x230(%rbp), %r15
1454a0ed0:     	movss	0x457e67(%rip), %xmm10  # 0x1458f8d40
1454a0ed9:     	movss	0x54a4de(%rip), %xmm12  # 0x1459eb3c0
1454a0ee2:     	movq	0x760(%rax), %rdi
1454a0ee9:     	testq	%rdi, %rdi
1454a0eec:     	je	0x1454a13ac <.text+0x54a03ac>
1454a0ef2:     	movq	0x368(%rbp), %rax
1454a0ef9:     	movq	0x758(%rax), %rax
1454a0f00:     	movq	%rdi, %r8
1454a0f03:     	shlq	$0x5, %r8
1454a0f07:     	xorl	%r9d, %r9d
1454a0f0a:     	nopw	(%rax,%rax)
1454a0f10:     	ucomiss	0x8(%rax,%r9), %xmm7
1454a0f16:     	jae	0x1454a0f26 <.text+0x549ff26>
1454a0f18:     	addq	$0x20, %r9
1454a0f1c:     	cmpq	%r9, %r8
1454a0f1f:     	jne	0x1454a0f10 <.text+0x549ff10>
1454a0f21:     	jmp	0x1454a13ac <.text+0x54a03ac>
1454a0f26:     	leaq	(%rax,%r9), %rcx
1454a0f2a:     	movq	(%rax,%r9), %r12
1454a0f2e:     	movups	0x8(%rax,%r9), %xmm0
1454a0f34:     	movaps	%xmm0, 0x2b0(%rbp)
1454a0f3b:     	movl	0x18(%rax,%r9), %r14d
1454a0f40:     	leaq	(%rax,%r9), %rdx
1454a0f44:     	addq	$0x20, %rdx
1454a0f48:     	subq	%r9, %r8
1454a0f4b:     	addq	$-0x20, %r8
1454a0f4f:     	callq	0x145756dd1 <.text+0x5755dd1>
1454a0f54:     	decq	%rdi
1454a0f57:     	movq	0x368(%rbp), %rax
1454a0f5e:     	movq	%rdi, 0x760(%rax)
1454a0f65:     	movq	0x2a0(%rax), %rcx
1454a0f6c:     	testq	%rcx, %rcx
1454a0f6f:     	je	0x1454a138b <.text+0x54a038b>
1454a0f75:     	movq	0x368(%rbp), %rax
1454a0f7c:     	movq	0x298(%rax), %rax
1454a0f83:     	imulq	$0x58, %rcx, %rdx
1454a0f87:     	xorl	%ecx, %ecx
1454a0f89:     	jmp	0x1454a0f9d <.text+0x549ff9d>
1454a0f8b:     	nopl	(%rax,%rax)
1454a0f90:     	addq	$0x58, %rcx
1454a0f94:     	cmpq	%rcx, %rdx
1454a0f97:     	je	0x1454a138b <.text+0x54a038b>
1454a0f9d:     	movq	(%rax,%rcx), %rdi
1454a0fa1:     	cmpq	$0xa, 0x8(%rdi)
1454a0fa6:     	jne	0x1454a0f90 <.text+0x549ff90>
1454a0fa8:     	movq	(%rdi), %r8
1454a0fab:     	movq	(%r8), %r9
1454a0fae:     	xorq	%r13, %r9
1454a0fb1:     	movzwl	0x8(%r8), %r8d
1454a0fb6:     	xorq	$0x6e6f, %r8            # imm = 0x6E6F
1454a0fbd:     	orq	%r9, %r8
1454a0fc0:     	jne	0x1454a0f90 <.text+0x549ff90>
1454a0fc2:     	movss	0x10(%rax,%rcx), %xmm15
1454a0fc9:     	movss	0x1c(%rax,%rcx), %xmm0
1454a0fcf:     	movss	0x38(%rax,%rcx), %xmm14
1454a0fd6:     	movss	0x4c(%rax,%rcx), %xmm9
1454a0fdd:     	movq	0x368(%rbp), %rdx
1454a0fe4:     	movss	0x458(%rdx), %xmm1
1454a0fec:     	movss	%xmm1, 0x338(%rbp)
1454a0ff4:     	movss	0x45c(%rdx), %xmm13
1454a0ffd:     	mulss	0x44(%rax,%rcx), %xmm0
1454a1003:     	movl	0x8(%rsi), %eax
1454a1006:     	movl	%eax, 0xa8(%rbp)
1454a100c:     	movq	(%rsi), %rax
1454a100f:     	movq	%rax, 0xa0(%rbp)
1454a1016:     	mulss	0x50(%rdi), %xmm0
1454a101b:     	movss	0x480(%rdx), %xmm1
1454a1023:     	mulss	%xmm1, %xmm0
1454a1027:     	ucomiss	%xmm0, %xmm8
1454a102b:     	jae	0x1454a1062 <.text+0x54a0062>
1454a102d:     	addss	0x14edb9b(%rip), %xmm0  # 0x14698ebd0
1454a1035:     	movaps	%xmm10, %xmm11
1454a1039:     	movaps	%xmm8, %xmm10
1454a103d:     	movss	0x457d9a(%rip), %xmm8   # 0x1458f8de0
1454a1046:     	divss	%xmm8, %xmm0
1454a104b:     	callq	0x145756f57 <.text+0x5755f57>
1454a1050:     	mulss	%xmm8, %xmm0
1454a1055:     	movaps	%xmm10, %xmm8
1454a1059:     	movaps	%xmm11, %xmm10
1454a105d:     	addss	%xmm8, %xmm0
1454a1062:     	movq	%r12, 0x2d8(%rbp)
1454a1069:     	leaq	0x2d8(%rbp), %rax
1454a1070:     	movq	%rax, 0x20(%rsp)
1454a1075:     	movq	$0x1, 0x28(%rsp)
1454a107e:     	movq	%r15, %rcx
1454a1081:     	movq	0x368(%rbp), %rsi
1454a1088:     	movq	%rsi, %rdx
1454a108b:     	leaq	0xa0(%rbp), %r8
1454a1092:     	movaps	%xmm0, %xmm3
1454a1095:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a109a:     	movq	0x4c8(%rsi), %rcx
1454a10a1:     	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454a10ac:     	nopl	(%rax)
1454a10b0:     	testq	%rax, %rax
1454a10b3:     	je	0x1454a118c <.text+0x54a018c>
1454a10b9:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454a10bf:     	cmpq	%r12, 0x88(%rcx)
1454a10c6:     	leaq	0x160(%rcx), %rcx
1454a10cd:     	jne	0x1454a10b0 <.text+0x54a00b0>
1454a10cf:     	movq	0x238(%rbp), %r9
1454a10d6:     	movq	0x240(%rbp), %rax
1454a10dd:     	movl	$0x2, 0x2d8(%rbp)
1454a10e7:     	movl	$0x0, 0x210(%rbp)
1454a10f1:     	movq	%r9, 0x18(%rbp)
1454a10f5:     	movb	$0x1, 0x326(%rbp)
1454a10fc:     	leaq	0x210(%rbp), %rcx
1454a1103:     	movq	%rcx, 0x30(%rsp)
1454a1108:     	leaq	0x2d8(%rbp), %rcx
1454a110f:     	movq	%rcx, 0x28(%rsp)
1454a1114:     	movq	%rax, 0x20(%rsp)
1454a1119:     	leaq	0xa0(%rbp), %rcx
1454a1120:     	movq	%r12, %rdx
1454a1123:     	movl	$0x3b85, %r8d           # imm = 0x3B85
1454a1129:     	movq	%r9, 0x358(%rbp)
1454a1130:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454a1135:     	nop
1454a1136:     	movq	0x368(%rbp), %rax
1454a113d:     	movq	0x548(%rax), %rsi
1454a1144:     	cmpq	0x538(%rax), %rsi
1454a114b:     	jne	0x1454a1156 <.text+0x54a0156>
1454a114d:     	movq	%rbx, %rcx
1454a1150:     	callq	0x1457580b0 <.text+0x57570b0>
1454a1155:     	nop
1454a1156:     	movq	0x368(%rbp), %rdx
1454a115d:     	movq	0x540(%rdx), %rax
1454a1164:     	movq	%rsi, %rcx
1454a1167:     	shlq	$0x5, %rcx
1454a116b:     	movups	0xa0(%rbp), %xmm0
1454a1172:     	movups	0xb0(%rbp), %xmm1
1454a1179:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a117e:     	movups	%xmm0, (%rax,%rcx)
1454a1182:     	incq	%rsi
1454a1185:     	movq	%rsi, 0x548(%rdx)
1454a118c:     	movq	%rbx, 0x348(%rbp)
1454a1193:     	movss	0x44(%rdi), %xmm0
1454a1198:     	movzbl	0x75(%rdi), %eax
1454a119c:     	addb	$-0x2, %al
1454a119e:     	movss	0x44a2da(%rip), %xmm1   # 0x1458eb480
1454a11a6:     	cmpb	$0x7, %al
1454a11a8:     	jae	0x1454a11b9 <.text+0x54a01b9>
1454a11aa:     	movzbl	%al, %eax
1454a11ad:     	leaq	0x150b8e8(%rip), %rcx   # 0x1469aca9c
1454a11b4:     	movss	(%rcx,%rax,4), %xmm1
1454a11b9:     	movaps	%xmm0, %xmm2
1454a11bc:     	movaps	%xmm10, %xmm11
1454a11c0:     	mulss	%xmm10, %xmm2
1454a11c5:     	movq	0x368(%rbp), %rsi
1454a11cc:     	movl	0x7e4(%rsi), %r12d
1454a11d3:     	movl	%r14d, 0x7e4(%rsi)
1454a11da:     	movq	0x230(%rbp), %rax
1454a11e1:     	movq	%rax, 0x340(%rbp)
1454a11e8:     	movq	0x238(%rbp), %rax
1454a11ef:     	movq	%rax, 0x358(%rbp)
1454a11f6:     	movq	0x240(%rbp), %r14
1454a11fd:     	testq	%r14, %r14
1454a1200:     	je	0x1454a1342 <.text+0x54a0342>
1454a1206:     	mulss	0x338(%rbp), %xmm9
1454a120f:     	xorps	%xmm3, %xmm3
1454a1212:     	cmpltss	%xmm0, %xmm3
1454a1217:     	andps	%xmm9, %xmm3
1454a121b:     	mulss	%xmm2, %xmm15
1454a1220:     	mulss	%xmm15, %xmm14
1454a1225:     	mulss	%xmm1, %xmm14
1454a122a:     	addss	%xmm3, %xmm14
1454a122f:     	mulss	%xmm14, %xmm13
1454a1234:     	shlq	$0x3, %r14
1454a1238:     	movzbl	0x111(%rsi), %r15d
1454a1240:     	movups	0x20(%rsi), %xmm9
1454a1245:     	movups	0x40(%rsi), %xmm10
1454a124a:     	xorl	%ebx, %ebx
1454a124c:     	nopl	(%rax)
1454a1250:     	movq	0x358(%rbp), %rax
1454a1257:     	movq	(%rax,%rbx), %rdx
1454a125b:     	movq	0x880(%rsi), %rax
1454a1262:     	movq	0x898(%rsi), %rcx
1454a1269:     	leaq	(%rcx,%rax), %r8
1454a126d:     	rolq	$0x17, %r8
1454a1271:     	addq	%rax, %r8
1454a1274:     	movq	0x888(%rsi), %r9
1454a127b:     	movq	%r9, %r10
1454a127e:     	shlq	$0x11, %r10
1454a1282:     	movq	0x890(%rsi), %r11
1454a1289:     	xorq	%rax, %r11
1454a128c:     	xorq	%r9, %rcx
1454a128f:     	xorq	%r11, %r9
1454a1292:     	movq	%r9, 0x888(%rsi)
1454a1299:     	xorq	%rcx, %rax
1454a129c:     	movq	%rax, 0x880(%rsi)
1454a12a3:     	xorq	%r10, %r11
1454a12a6:     	movq	%r11, 0x890(%rsi)
1454a12ad:     	rolq	$0x2d, %rcx
1454a12b1:     	movq	%rcx, 0x898(%rsi)
1454a12b8:     	shrq	$0x28, %r8
1454a12bc:     	xorps	%xmm0, %xmm0
1454a12bf:     	cvtsi2ss	%r8d, %xmm0
1454a12c4:     	mulss	%xmm12, %xmm0
1454a12c9:     	movss	0x464(%rsi), %xmm1
1454a12d1:     	movss	0x468(%rsi), %xmm2
1454a12d9:     	mulss	%xmm13, %xmm2
1454a12de:     	movl	0x40(%rdi), %r9d
1454a12e2:     	movzbl	0x74(%rdi), %eax
1454a12e6:     	movb	$0x3, 0x111(%rsi)
1454a12ed:     	movq	$0x0, 0x20(%rsi)
1454a12f5:     	movq	$0x0, 0x40(%rsi)
1454a12fd:     	ucomiss	%xmm0, %xmm1
1454a1300:     	ja	0x1454a1306 <.text+0x54a0306>
1454a1302:     	movaps	%xmm13, %xmm2
1454a1306:     	seta	0x28(%rsp)
1454a130b:     	movb	%al, 0x20(%rsp)
1454a130f:     	movb	$0x0, 0x30(%rsp)
1454a1314:     	movq	0x368(%rbp), %rsi
1454a131b:     	movq	%rsi, %rcx
1454a131e:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a1323:     	nop
1454a1324:     	movb	%r15b, 0x111(%rsi)
1454a132b:     	movups	%xmm9, 0x20(%rsi)
1454a1330:     	movups	%xmm10, 0x40(%rsi)
1454a1335:     	addq	$0x8, %rbx
1454a1339:     	cmpq	%rbx, %r14
1454a133c:     	jne	0x1454a1250 <.text+0x54a0250>
1454a1342:     	movq	0x340(%rbp), %rdx
1454a1349:     	testq	%rdx, %rdx
1454a134c:     	je	0x1454a1364 <.text+0x54a0364>
1454a134e:     	shlq	$0x3, %rdx
1454a1352:     	movl	$0x8, %r8d
1454a1358:     	movq	0x358(%rbp), %rcx
1454a135f:     	callq	0x1400021d0 <.text+0x11d0>
1454a1364:     	movq	0x368(%rbp), %rax
1454a136b:     	movl	%r12d, 0x7e4(%rax)
1454a1372:     	movq	0x348(%rbp), %rbx
1454a1379:     	leaq	0x2b4(%rbp), %rsi
1454a1380:     	leaq	0x230(%rbp), %r15
1454a1387:     	movaps	%xmm11, %xmm10
1454a138b:     	movq	0x368(%rbp), %rax
1454a1392:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a139c:     	movq	0x760(%rax), %rdi
1454a13a3:     	testq	%rdi, %rdi
1454a13a6:     	jne	0x1454a0ef2 <.text+0x549fef2>
