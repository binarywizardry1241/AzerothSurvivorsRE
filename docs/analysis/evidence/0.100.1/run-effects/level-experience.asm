
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c69e0:     	pushq	%rbp
1454c69e1:     	pushq	%r15
1454c69e3:     	pushq	%r14
1454c69e5:     	pushq	%r13
1454c69e7:     	pushq	%r12
1454c69e9:     	pushq	%rsi
1454c69ea:     	pushq	%rdi
1454c69eb:     	pushq	%rbx
1454c69ec:     	subq	$0x1d8, %rsp            # imm = 0x1D8
1454c69f3:     	leaq	0x80(%rsp), %rbp
1454c69fb:     	movaps	%xmm15, 0x140(%rbp)
1454c6a03:     	movaps	%xmm14, 0x130(%rbp)
1454c6a0b:     	movaps	%xmm13, 0x120(%rbp)
1454c6a13:     	movaps	%xmm12, 0x110(%rbp)
1454c6a1b:     	movaps	%xmm11, 0x100(%rbp)
1454c6a23:     	movaps	%xmm10, 0xf0(%rbp)
1454c6a2b:     	movaps	%xmm9, 0xe0(%rbp)
1454c6a33:     	movaps	%xmm8, 0xd0(%rbp)
1454c6a3b:     	movaps	%xmm7, 0xc0(%rbp)
1454c6a42:     	movaps	%xmm6, 0xb0(%rbp)
1454c6a49:     	movq	$-0x2, 0xa8(%rbp)
1454c6a54:     	movl	%edx, %edi
1454c6a56:     	movq	%rcx, %rsi
1454c6a59:     	addl	0x414(%rcx), %edi
1454c6a5f:     	movl	%edi, 0x414(%rcx)
1454c6a65:     	leaq	0x8d8(%rcx), %r15
1454c6a6c:     	movss	0x440a94(%rip), %xmm7   # 0x145907508
1454c6a74:     	movss	0x451dc3(%rip), %xmm8   # 0x145918840
1454c6a7d:     	movss	0x440a92(%rip), %xmm9   # 0x145907518
1454c6a86:     	xorps	%xmm10, %xmm10
1454c6a8a:     	movss	0x440a99(%rip), %xmm11  # 0x14590752c
1454c6a93:     	movq	%rbp, %r14
1454c6a96:     	leaq	0x20(%rbp), %r13
1454c6a9a:     	movss	0x440a99(%rip), %xmm12  # 0x14590753c
1454c6aa3:     	movss	0x440a70(%rip), %xmm13  # 0x14590751c
1454c6aac:     	jmp	0x1454c6aba <.text+0x54c5aba>
1454c6aae:     	nop
1454c6ab0:     	movl	%edi, 0x8(%rax,%rdx,4)
1454c6ab4:     	movl	0x414(%rsi), %edi
1454c6aba:     	movl	0x410(%rsi), %r12d
1454c6ac1:     	cmpl	$0x1, %r12d
1454c6ac5:     	movl	%r12d, %eax
1454c6ac8:     	adcl	$-0x1, %eax
1454c6acb:     	xorps	%xmm1, %xmm1
1454c6ace:     	cvtsi2ss	%rax, %xmm1
1454c6ad3:     	movaps	%xmm1, %xmm0
1454c6ad6:     	mulss	%xmm9, %xmm0
1454c6adb:     	mulss	%xmm1, %xmm0
1454c6adf:     	mulss	%xmm7, %xmm1
1454c6ae3:     	addss	%xmm8, %xmm1
1454c6ae8:     	addss	%xmm1, %xmm0
1454c6aec:     	callq	0x14577322f <.text+0x577222f>
1454c6af1:     	cvttss2si	%xmm0, %rax
1454c6af6:     	ucomiss	%xmm10, %xmm0
1454c6afa:     	movl	$0x0, %ecx
1454c6aff:     	cmovbl	%ecx, %eax
1454c6b02:     	ucomiss	%xmm11, %xmm0
1454c6b06:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454c6b0b:     	cmoval	%ecx, %eax
1454c6b0e:     	cmpl	$0x62, %r12d
1454c6b12:     	ja	0x1454c727b <.text+0x54c627b>
1454c6b18:     	movl	%edi, %ecx
1454c6b1a:     	subl	%eax, %ecx
1454c6b1c:     	jb	0x1454c727b <.text+0x54c627b>
1454c6b22:     	movl	%ecx, 0x414(%rsi)
1454c6b28:     	incl	%r12d
1454c6b2b:     	movl	%r12d, 0x410(%rsi)
1454c6b32:     	incl	0x93c(%rsi)
1454c6b38:     	movq	0x8d8(%rsi), %rax
1454c6b3f:     	testq	%rax, %rax
1454c6b42:     	je	0x1454c6bd0 <.text+0x54c5bd0>
1454c6b48:     	movq	0x8e0(%rsi), %rcx
1454c6b4f:     	movw	$0x22, %r11w
1454c6b54:     	movzwl	0x36(%rax), %r8d
1454c6b59:     	movl	%r8d, %r9d
1454c6b5c:     	addl	%r9d, %r9d
1454c6b5f:     	movq	$-0x1, %rdx
1454c6b66:     	nopw	%cs:(%rax,%rax)
1454c6b70:     	testq	%r9, %r9
1454c6b73:     	je	0x1454c6bb0 <.text+0x54c5bb0>
1454c6b75:     	cmpw	0x3a(%rax,%rdx,2), %r11w
1454c6b7b:     	seta	%r10b
1454c6b7f:     	sbbb	$0x0, %r10b
1454c6b83:     	incq	%rdx
1454c6b86:     	addq	$-0x2, %r9
1454c6b8a:     	cmpb	$0x1, %r10b
1454c6b8e:     	je	0x1454c6b70 <.text+0x54c5b70>
1454c6b90:     	movzbl	%r10b, %r8d
1454c6b94:     	testl	%r8d, %r8d
1454c6b97:     	je	0x1454c6bc0 <.text+0x54c5bc0>
1454c6b99:     	subq	$0x1, %rcx
1454c6b9d:     	jae	0x1454c6bb9 <.text+0x54c5bb9>
1454c6b9f:     	jmp	0x1454c6bd2 <.text+0x54c5bd2>
1454c6ba1:     	nopw	%cs:(%rax,%rax)
1454c6bb0:     	movq	%r8, %rdx
1454c6bb3:     	subq	$0x1, %rcx
1454c6bb7:     	jb	0x1454c6bd2 <.text+0x54c5bd2>
1454c6bb9:     	movq	0x50(%rax,%rdx,8), %rax
1454c6bbe:     	jmp	0x1454c6b54 <.text+0x54c5b54>
1454c6bc0:     	movl	%r12d, 0x8(%rax,%rdx,4)
1454c6bc5:     	jmp	0x1454c6bfc <.text+0x54c5bfc>
1454c6bc7:     	nopw	(%rax,%rax)
1454c6bd0:     	xorl	%eax, %eax
1454c6bd2:     	movq	%r15, 0x20(%rbp)
1454c6bd6:     	movq	%rax, 0x28(%rbp)
1454c6bda:     	movq	$0x0, 0x30(%rbp)
1454c6be2:     	movq	%rdx, 0x38(%rbp)
1454c6be6:     	movq	$0x22, 0x40(%rbp)
1454c6bee:     	movq	%r14, %rcx
1454c6bf1:     	movq	%r13, %rdx
1454c6bf4:     	movl	%r12d, %r8d
1454c6bf7:     	callq	0x14552a730 <.text+0x5529730>
1454c6bfc:     	movq	%r14, %r15
1454c6bff:     	movss	0x470(%rsi), %xmm14
1454c6c08:     	movss	0x474(%rsi), %xmm15
1454c6c11:     	movss	0x494(%rsi), %xmm6
1454c6c19:     	movl	0x4b4(%rsi), %eax
1454c6c1f:     	movl	%eax, -0x4(%rbp)
1454c6c22:     	movq	%rsi, %rcx
1454c6c25:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454c6c2a:     	movl	$0x58, %edx
1454c6c2f:     	leaq	0x152ffb5(%rip), %r14   # 0x1469f6beb
1454c6c36:     	movq	%r14, %rcx
1454c6c39:     	callq	0x145457cb0 <.text+0x5456cb0>
1454c6c3e:     	movq	%rax, %rdi
1454c6c41:     	movq	%rdx, %r12
1454c6c44:     	testq	%rax, %rax
1454c6c47:     	cmoveq	%r14, %rdi
1454c6c4b:     	movl	$0x58, %eax
1454c6c50:     	cmoveq	%rax, %r12
1454c6c54:     	movss	0x474(%rsi), %xmm0
1454c6c5c:     	subss	%xmm15, %xmm0
1454c6c61:     	mulss	%xmm12, %xmm0
1454c6c66:     	movss	%xmm0, 0x80(%rbp)
1454c6c6e:     	leaq	0x80(%rbp), %r14
1454c6c75:     	movq	%r14, (%rbp)
1454c6c79:     	leaq	0x272a70(%rip), %rbx    # 0x1457396f0 <.text+0x57386f0>
1454c6c80:     	movq	%rbx, 0x8(%rbp)
1454c6c84:     	movq	%r13, %rcx
1454c6c87:     	movq	%r13, %r14
1454c6c8a:     	leaq	0x152ffb2(%rip), %r13   # 0x1469f6c43
1454c6c91:     	movq	%r13, %rdx
1454c6c94:     	movq	%r15, %r8
1454c6c97:     	callq	0x145728390 <.text+0x5727390>
1454c6c9c:     	movups	0x20(%rbp), %xmm0
1454c6ca0:     	movaps	%xmm0, -0x40(%rbp)
1454c6ca4:     	movq	0x30(%rbp), %rax
1454c6ca8:     	movq	%rax, -0x30(%rbp)
1454c6cac:     	movss	0x470(%rsi), %xmm0
1454c6cb4:     	subss	%xmm14, %xmm0
1454c6cb9:     	movss	%xmm0, 0x80(%rbp)
1454c6cc1:     	leaq	0x80(%rbp), %rax
1454c6cc8:     	movq	%rax, (%rbp)
1454c6ccc:     	movq	%rbx, 0x8(%rbp)
1454c6cd0:     	movq	%r14, %rcx
1454c6cd3:     	movq	%r13, %rdx
1454c6cd6:     	movq	%r15, %r8
1454c6cd9:     	callq	0x145728390 <.text+0x5727390>
1454c6cde:     	nop
1454c6cdf:     	movups	0x20(%rbp), %xmm0
1454c6ce3:     	movaps	%xmm0, -0x20(%rbp)
1454c6ce7:     	movq	0x30(%rbp), %rax
1454c6ceb:     	movq	%rax, -0x10(%rbp)
1454c6cef:     	movq	%rsi, %r13
1454c6cf2:     	movss	0x494(%rsi), %xmm0
1454c6cfa:     	subss	%xmm6, %xmm0
1454c6cfe:     	movss	%xmm0, 0x80(%rbp)
1454c6d06:     	leaq	0x80(%rbp), %rsi
1454c6d0d:     	movq	%rsi, (%rbp)
1454c6d11:     	movq	%rbx, 0x8(%rbp)
1454c6d15:     	movq	%r14, %rcx
1454c6d18:     	leaq	0x152ff57(%rip), %rdx   # 0x1469f6c76
1454c6d1f:     	movq	%r15, %r8
1454c6d22:     	callq	0x145728390 <.text+0x5727390>
1454c6d27:     	nop
1454c6d28:     	movq	%r15, %rbx
1454c6d2b:     	movq	%r14, %r15
1454c6d2e:     	movups	0x20(%rbp), %xmm0
1454c6d32:     	movaps	%xmm0, 0x80(%rbp)
1454c6d39:     	movq	0x30(%rbp), %rax
1454c6d3d:     	movq	%rax, 0x90(%rbp)
1454c6d44:     	leaq	0x152fde9(%rip), %rax   # 0x1469f6b34
1454c6d4b:     	movq	%rax, 0x20(%rbp)
1454c6d4f:     	movq	$0x6, 0x28(%rbp)
1454c6d57:     	leaq	-0x40(%rbp), %rax
1454c6d5b:     	movq	%rax, 0x30(%rbp)
1454c6d5f:     	leaq	0x152feea(%rip), %rax   # 0x1469f6c50
1454c6d66:     	movq	%rax, 0x38(%rbp)
1454c6d6a:     	leaq	0x152feff(%rip), %rcx   # 0x1469f6c70
1454c6d71:     	movq	%rcx, 0x40(%rbp)
1454c6d75:     	movq	$0x6, 0x48(%rbp)
1454c6d7d:     	leaq	-0x20(%rbp), %rcx
1454c6d81:     	movq	%rcx, 0x50(%rbp)
1454c6d85:     	movq	%rax, 0x58(%rbp)
1454c6d89:     	leaq	0x152fdc0(%rip), %rcx   # 0x1469f6b50
1454c6d90:     	movq	%rcx, 0x60(%rbp)
1454c6d94:     	movq	$0x5, 0x68(%rbp)
1454c6d9c:     	movq	%rsi, 0x70(%rbp)
1454c6da0:     	movq	%rax, 0x78(%rbp)
1454c6da4:     	movq	$0x3, 0x20(%rsp)
1454c6dad:     	leaq	-0x58(%rbp), %rcx
1454c6db1:     	movq	%rdi, %rdx
1454c6db4:     	movq	%r12, %r8
1454c6db7:     	movq	%r14, %r9
1454c6dba:     	callq	0x145458060 <.text+0x5457060>
1454c6dbf:     	nop
1454c6dc0:     	movq	%rsi, %r14
1454c6dc3:     	movq	-0x50(%rbp), %rdx
1454c6dc7:     	movq	-0x48(%rbp), %r8
1454c6dcb:     	movq	%rbx, %rcx
1454c6dce:     	movq	%rdx, 0xa0(%rbp)
1454c6dd5:     	callq	0x14545dc90 <.text+0x545cc90>
1454c6dda:     	nop
1454c6ddb:     	movq	%r13, %rsi
1454c6dde:     	movq	0x560(%r13), %rdi
1454c6de5:     	cmpq	0x550(%r13), %rdi
1454c6dec:     	jne	0x1454c6dfb <.text+0x54c5dfb>
1454c6dee:     	leaq	0x550(%rsi), %rcx
1454c6df5:     	callq	0x145774710 <.text+0x5773710>
1454c6dfa:     	nop
1454c6dfb:     	movq	0x558(%rsi), %rax
1454c6e02:     	movq	%rdi, %rcx
1454c6e05:     	shlq	$0x5, %rcx
1454c6e09:     	movups	(%rbp), %xmm0
1454c6e0d:     	movups	0x10(%rbp), %xmm1
1454c6e11:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c6e16:     	movups	%xmm0, (%rax,%rcx)
1454c6e1a:     	incq	%rdi
1454c6e1d:     	movq	%rdi, 0x560(%rsi)
1454c6e24:     	movq	-0x58(%rbp), %rdx
1454c6e28:     	testq	%rdx, %rdx
1454c6e2b:     	je	0x1454c6e3f <.text+0x54c5e3f>
1454c6e2d:     	movl	$0x1, %r8d
1454c6e33:     	movq	0xa0(%rbp), %rcx
1454c6e3a:     	callq	0x1400021d0 <.text+0x11d0>
1454c6e3f:     	movq	0x80(%rbp), %rdx
1454c6e46:     	testq	%rdx, %rdx
1454c6e49:     	je	0x1454c6e5d <.text+0x54c5e5d>
1454c6e4b:     	movq	0x88(%rbp), %rcx
1454c6e52:     	movl	$0x1, %r8d
1454c6e58:     	callq	0x1400021d0 <.text+0x11d0>
1454c6e5d:     	movq	-0x20(%rbp), %rdx
1454c6e61:     	testq	%rdx, %rdx
1454c6e64:     	je	0x1454c6e75 <.text+0x54c5e75>
1454c6e66:     	movq	-0x18(%rbp), %rcx
1454c6e6a:     	movl	$0x1, %r8d
1454c6e70:     	callq	0x1400021d0 <.text+0x11d0>
1454c6e75:     	movq	-0x40(%rbp), %rdx
1454c6e79:     	testq	%rdx, %rdx
1454c6e7c:     	je	0x1454c6e8d <.text+0x54c5e8d>
1454c6e7e:     	movq	-0x38(%rbp), %rcx
1454c6e82:     	movl	$0x1, %r8d
1454c6e88:     	callq	0x1400021d0 <.text+0x11d0>
1454c6e8d:     	movq	0x2b0(%rsi), %rax
1454c6e94:     	imulq	$0x58, 0x2b8(%rsi), %rcx
1454c6e9c:     	xorl	%edx, %edx
1454c6e9e:     	nop
1454c6ea0:     	cmpq	%rdx, %rcx
1454c6ea3:     	je	0x1454c6fd0 <.text+0x54c5fd0>
1454c6ea9:     	movq	(%rax,%rdx), %r8
1454c6ead:     	addq	$0x58, %rdx
1454c6eb1:     	cmpb	$0x6, 0x75(%r8)
1454c6eb6:     	jne	0x1454c6ea0 <.text+0x54c5ea0>
1454c6eb8:     	movl	-0x4(%rbp), %eax
1454c6ebb:     	cmpl	%eax, 0x4b4(%rsi)
1454c6ec1:     	jbe	0x1454c6fd0 <.text+0x54c5fd0>
1454c6ec7:     	movl	$0x3e, %edx
1454c6ecc:     	leaq	0x152fdab(%rip), %rdi   # 0x1469f6c7e
1454c6ed3:     	movq	%rdi, %rcx
1454c6ed6:     	callq	0x145457cb0 <.text+0x5456cb0>
1454c6edb:     	movq	%rdx, %r8
1454c6ede:     	testq	%rax, %rax
1454c6ee1:     	cmoveq	%rdi, %rax
1454c6ee5:     	movl	$0x3e, %ecx
1454c6eea:     	cmoveq	%rcx, %r8
1454c6eee:     	movl	0x4b4(%rsi), %ecx
1454c6ef4:     	cmpl	$0x3, %ecx
1454c6ef7:     	movl	$0x3, %edx
1454c6efc:     	cmovael	%edx, %ecx
1454c6eff:     	incl	%ecx
1454c6f01:     	movq	%rcx, -0x20(%rbp)
1454c6f05:     	leaq	0x152f564(%rip), %rcx   # 0x1469f6470
1454c6f0c:     	movq	%rcx, 0x20(%rbp)
1454c6f10:     	movq	$0x1, 0x28(%rbp)
1454c6f18:     	leaq	-0x20(%rbp), %rcx
1454c6f1c:     	movq	%rcx, 0x30(%rbp)
1454c6f20:     	leaq	0x152fd99(%rip), %rcx   # 0x1469f6cc0
1454c6f27:     	movq	%rcx, 0x38(%rbp)
1454c6f2b:     	movq	$0x1, 0x20(%rsp)
1454c6f34:     	movq	%r14, %rcx
1454c6f37:     	movq	%rax, %rdx
1454c6f3a:     	movq	%r15, %r9
1454c6f3d:     	callq	0x145458060 <.text+0x5457060>
1454c6f42:     	movq	0x88(%rbp), %rdx
1454c6f49:     	movq	0x90(%rbp), %r8
1454c6f50:     	movq	%rbx, %rcx
1454c6f53:     	movq	%rdx, 0xa0(%rbp)
1454c6f5a:     	callq	0x14545dc90 <.text+0x545cc90>
1454c6f5f:     	nop
1454c6f60:     	movq	0x560(%rsi), %rdi
1454c6f67:     	cmpq	0x550(%rsi), %rdi
1454c6f6e:     	jne	0x1454c6f7d <.text+0x54c5f7d>
1454c6f70:     	leaq	0x550(%rsi), %rcx
1454c6f77:     	callq	0x145774710 <.text+0x5773710>
1454c6f7c:     	nop
1454c6f7d:     	movq	0x558(%rsi), %rax
1454c6f84:     	movq	%rdi, %rcx
1454c6f87:     	shlq	$0x5, %rcx
1454c6f8b:     	movups	(%rbp), %xmm0
1454c6f8f:     	movups	0x10(%rbp), %xmm1
1454c6f93:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c6f98:     	movups	%xmm0, (%rax,%rcx)
1454c6f9c:     	incq	%rdi
1454c6f9f:     	movq	%rdi, 0x560(%rsi)
1454c6fa6:     	movq	0x80(%rbp), %rdx
1454c6fad:     	testq	%rdx, %rdx
1454c6fb0:     	je	0x1454c6fd0 <.text+0x54c5fd0>
1454c6fb2:     	movl	$0x1, %r8d
1454c6fb8:     	movq	0xa0(%rbp), %rcx
1454c6fbf:     	callq	0x1400021d0 <.text+0x11d0>
1454c6fc4:     	nopw	%cs:(%rax,%rax)
1454c6fd0:     	movq	%r15, %r13
1454c6fd3:     	movq	%rbx, %r14
1454c6fd6:     	movss	0x470(%rsi), %xmm14
1454c6fdf:     	mulss	%xmm13, %xmm14
1454c6fe4:     	movl	$0x8, %edx
1454c6fe9:     	leaq	0x152fcf0(%rip), %rcx   # 0x1469f6ce0
1454c6ff0:     	callq	0x145457cb0 <.text+0x5456cb0>
1454c6ff5:     	movss	0x418(%rsi), %xmm2
1454c6ffd:     	movss	0x470(%rsi), %xmm6
1454c7005:     	addss	%xmm2, %xmm14
1454c700a:     	movaps	%xmm14, %xmm1
1454c700e:     	minss	%xmm6, %xmm1
1454c7012:     	movaps	%xmm1, %xmm0
1454c7015:     	cmpunordss	%xmm1, %xmm0
1454c701a:     	andps	%xmm0, %xmm14
1454c701e:     	andnps	%xmm1, %xmm0
1454c7021:     	orps	%xmm14, %xmm0
1454c7025:     	movss	%xmm0, 0x418(%rsi)
1454c702d:     	movaps	%xmm0, %xmm1
1454c7030:     	subss	%xmm2, %xmm1
1454c7034:     	ucomiss	%xmm1, %xmm10
1454c7038:     	jae	0x1454c709e <.text+0x54c609e>
1454c703a:     	testq	%rax, %rax
1454c703d:     	movl	$0x8, %ecx
1454c7042:     	cmoveq	%rcx, %rdx
1454c7046:     	leaq	0x152fc93(%rip), %rcx   # 0x1469f6ce0
1454c704d:     	cmoveq	%rcx, %rax
1454c7051:     	movq	$-0x1, 0x20(%rbp)
1454c7059:     	movq	%rax, 0x28(%rbp)
1454c705d:     	movq	%rdx, 0x30(%rbp)
1454c7061:     	leaq	0x152fc80(%rip), %rax   # 0x1469f6ce8
1454c7068:     	movq	%rax, 0x38(%rbp)
1454c706c:     	movq	$0x13, 0x40(%rbp)
1454c7074:     	movb	$0x0, 0x48(%rbp)
1454c7078:     	xorps	%xmm2, %xmm2
1454c707b:     	cvtss2sd	%xmm1, %xmm2
1454c707f:     	leaq	0x5f8(%rsi), %rcx
1454c7086:     	movq	%r13, %rdx
1454c7089:     	callq	0x1455021b0 <.text+0x55011b0>
1454c708e:     	movss	0x418(%rsi), %xmm0
1454c7096:     	movss	0x470(%rsi), %xmm6
1454c709e:     	maxss	%xmm10, %xmm0
1454c70a3:     	callq	0x14577327d <.text+0x577227d>
1454c70a8:     	cvttss2si	%xmm0, %r12
1454c70ad:     	ucomiss	%xmm10, %xmm0
1454c70b1:     	movl	$0x0, %r15d
1454c70b7:     	cmovbl	%r15d, %r12d
1454c70bb:     	ucomiss	%xmm11, %xmm0
1454c70bf:     	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
1454c70c4:     	cmoval	%ebx, %r12d
1454c70c8:     	movaps	%xmm6, %xmm0
1454c70cb:     	callq	0x14577327d <.text+0x577227d>
1454c70d0:     	cvttss2si	%xmm0, %rdi
1454c70d5:     	ucomiss	%xmm10, %xmm0
1454c70d9:     	cmovbl	%r15d, %edi
1454c70dd:     	ucomiss	%xmm11, %xmm0
1454c70e1:     	cmoval	%ebx, %edi
1454c70e4:     	leaq	0x8d8(%rsi), %r15
1454c70eb:     	movq	(%r15), %rax
1454c70ee:     	testq	%rax, %rax
1454c70f1:     	je	0x1454c7200 <.text+0x54c6200>
1454c70f7:     	movq	0x8e0(%rsi), %rcx
1454c70fe:     	movw	$0x1c, %bx
1454c7102:     	movw	$0x16, %r11w
1454c7107:     	movzwl	0x36(%rax), %r8d
1454c710c:     	movl	%r8d, %r9d
1454c710f:     	addl	%r9d, %r9d
1454c7112:     	movq	$-0x1, %rdx
1454c7119:     	nopl	(%rax)
1454c7120:     	testq	%r9, %r9
1454c7123:     	je	0x1454c7160 <.text+0x54c6160>
1454c7125:     	cmpw	0x3a(%rax,%rdx,2), %r11w
1454c712b:     	seta	%r10b
1454c712f:     	sbbb	$0x0, %r10b
1454c7133:     	incq	%rdx
1454c7136:     	addq	$-0x2, %r9
1454c713a:     	cmpb	$0x1, %r10b
1454c713e:     	je	0x1454c7120 <.text+0x54c6120>
1454c7140:     	movzbl	%r10b, %r8d
1454c7144:     	testl	%r8d, %r8d
1454c7147:     	je	0x1454c7180 <.text+0x54c6180>
1454c7149:     	subq	$0x1, %rcx
1454c714d:     	jae	0x1454c716d <.text+0x54c616d>
1454c714f:     	jmp	0x1454c7276 <.text+0x54c6276>
1454c7154:     	nopw	%cs:(%rax,%rax)
1454c7160:     	movq	%r8, %rdx
1454c7163:     	subq	$0x1, %rcx
1454c7167:     	jb	0x1454c7276 <.text+0x54c6276>
1454c716d:     	movq	0x50(%rax,%rdx,8), %rax
1454c7172:     	jmp	0x1454c7107 <.text+0x54c6107>
1454c7174:     	nopw	%cs:(%rax,%rax)
1454c7180:     	movl	%r12d, 0x8(%rax,%rdx,4)
1454c7185:     	movq	(%r15), %rax
1454c7188:     	testq	%rax, %rax
1454c718b:     	je	0x1454c723f <.text+0x54c623f>
1454c7191:     	movq	0x8e0(%rsi), %rcx
1454c7198:     	movzwl	0x36(%rax), %r8d
1454c719d:     	movl	%r8d, %r9d
1454c71a0:     	addl	%r9d, %r9d
1454c71a3:     	movq	$-0x1, %rdx
1454c71aa:     	nopw	(%rax,%rax)
1454c71b0:     	testq	%r9, %r9
1454c71b3:     	je	0x1454c71f0 <.text+0x54c61f0>
1454c71b5:     	cmpw	0x3a(%rax,%rdx,2), %bx
1454c71ba:     	seta	%r10b
1454c71be:     	sbbb	$0x0, %r10b
1454c71c2:     	incq	%rdx
1454c71c5:     	addq	$-0x2, %r9
1454c71c9:     	cmpb	$0x1, %r10b
1454c71cd:     	je	0x1454c71b0 <.text+0x54c61b0>
1454c71cf:     	movzbl	%r10b, %r8d
1454c71d3:     	testl	%r8d, %r8d
1454c71d6:     	je	0x1454c6ab0 <.text+0x54c5ab0>
1454c71dc:     	subq	$0x1, %rcx
1454c71e0:     	jae	0x1454c71f9 <.text+0x54c61f9>
1454c71e2:     	jmp	0x1454c7241 <.text+0x54c6241>
1454c71e4:     	nopw	%cs:(%rax,%rax)
1454c71f0:     	movq	%r8, %rdx
1454c71f3:     	subq	$0x1, %rcx
1454c71f7:     	jb	0x1454c7241 <.text+0x54c6241>
1454c71f9:     	movq	0x50(%rax,%rdx,8), %rax
1454c71fe:     	jmp	0x1454c7198 <.text+0x54c6198>
1454c7200:     	xorl	%eax, %eax
1454c7202:     	movq	%r14, %rcx
1454c7205:     	movw	$0x1c, %bx
1454c7209:     	movq	%r15, 0x20(%rbp)
1454c720d:     	movq	%rax, 0x28(%rbp)
1454c7211:     	movq	$0x0, 0x30(%rbp)
1454c7219:     	movq	%rdx, 0x38(%rbp)
1454c721d:     	movq	$0x16, 0x40(%rbp)
1454c7225:     	movq	%rcx, %r14
1454c7228:     	movq	%r13, %rdx
1454c722b:     	movl	%r12d, %r8d
1454c722e:     	callq	0x14552a730 <.text+0x5529730>
1454c7233:     	movq	(%r15), %rax
1454c7236:     	testq	%rax, %rax
1454c7239:     	jne	0x1454c7191 <.text+0x54c6191>
1454c723f:     	xorl	%eax, %eax
1454c7241:     	movq	%r15, 0x20(%rbp)
1454c7245:     	movq	%rax, 0x28(%rbp)
1454c7249:     	movq	$0x0, 0x30(%rbp)
1454c7251:     	movq	%rdx, 0x38(%rbp)
1454c7255:     	movq	$0x1c, 0x40(%rbp)
1454c725d:     	movq	%r14, %rcx
1454c7260:     	movq	%r13, %rdx
1454c7263:     	movl	%edi, %r8d
1454c7266:     	callq	0x14552a730 <.text+0x5529730>
1454c726b:     	movl	0x414(%rsi), %edi
1454c7271:     	jmp	0x1454c6aba <.text+0x54c5aba>
1454c7276:     	movq	%r14, %rcx
1454c7279:     	jmp	0x1454c7209 <.text+0x54c6209>
1454c727b:     	movq	(%r15), %rax
1454c727e:     	testq	%rax, %rax
1454c7281:     	je	0x1454c72f7 <.text+0x54c62f7>
1454c7283:     	movq	0x8e0(%rsi), %rcx
1454c728a:     	movl	$0x2cc, %edx            # imm = 0x2CC
1454c728f:     	movzwl	0x36(%rax), %r9d
1454c7294:     	movl	%r9d, %r10d
1454c7297:     	addl	%r10d, %r10d
1454c729a:     	movq	$-0x1, %r8
1454c72a1:     	nopw	%cs:(%rax,%rax)
1454c72b0:     	testq	%r10, %r10
1454c72b3:     	je	0x1454c72e0 <.text+0x54c62e0>
1454c72b5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c72bb:     	cmpl	%r11d, %edx
1454c72be:     	seta	%r11b
1454c72c2:     	sbbb	$0x0, %r11b
1454c72c6:     	incq	%r8
1454c72c9:     	addq	$-0x2, %r10
1454c72cd:     	cmpb	$0x1, %r11b
1454c72d1:     	je	0x1454c72b0 <.text+0x54c62b0>
1454c72d3:     	movzbl	%r11b, %r9d
1454c72d7:     	testl	%r9d, %r9d
1454c72da:     	je	0x1454c72f0 <.text+0x54c62f0>
1454c72dc:     	jmp	0x1454c72e3 <.text+0x54c62e3>
1454c72de:     	nop
1454c72e0:     	movq	%r9, %r8
1454c72e3:     	subq	$0x1, %rcx
1454c72e7:     	jb	0x1454c72f9 <.text+0x54c62f9>
1454c72e9:     	movq	0x50(%rax,%r8,8), %rax
1454c72ee:     	jmp	0x1454c728f <.text+0x54c628f>
1454c72f0:     	movl	%edi, 0x8(%rax,%r8,4)
1454c72f5:     	jmp	0x1454c7324 <.text+0x54c6324>
1454c72f7:     	xorl	%eax, %eax
1454c72f9:     	movq	%r15, 0x20(%rbp)
1454c72fd:     	movq	%rax, 0x28(%rbp)
1454c7301:     	movq	$0x0, 0x30(%rbp)
1454c7309:     	movq	%r8, 0x38(%rbp)
1454c730d:     	movq	$0x2cc, 0x40(%rbp)      # imm = 0x2CC
1454c7315:     	movq	%rbp, %rcx
1454c7318:     	leaq	0x20(%rbp), %rdx
1454c731c:     	movl	%edi, %r8d
1454c731f:     	callq	0x14552a730 <.text+0x5529730>
1454c7324:     	movl	0x410(%rsi), %eax
1454c732a:     	cmpl	$0x1, %eax
1454c732d:     	adcl	$-0x1, %eax
1454c7330:     	xorps	%xmm1, %xmm1
1454c7333:     	cvtsi2ss	%rax, %xmm1
1454c7338:     	movss	0x4401c8(%rip), %xmm2   # 0x145907508
1454c7340:     	mulss	%xmm1, %xmm2
1454c7344:     	addss	0x4514f4(%rip), %xmm2   # 0x145918840
1454c734c:     	movss	0x4401c4(%rip), %xmm0   # 0x145907518
1454c7354:     	mulss	%xmm1, %xmm0
1454c7358:     	mulss	%xmm1, %xmm0
1454c735c:     	addss	%xmm2, %xmm0
1454c7360:     	callq	0x14577322f <.text+0x577222f>
1454c7365:     	cvttss2si	%xmm0, %rax
1454c736a:     	xorl	%ecx, %ecx
1454c736c:     	xorps	%xmm1, %xmm1
1454c736f:     	ucomiss	%xmm1, %xmm0
1454c7372:     	cmovbl	%ecx, %eax
1454c7375:     	ucomiss	0x4401b0(%rip), %xmm0   # 0x14590752c
1454c737c:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454c7382:     	cmovbel	%eax, %r8d
1454c7386:     	movq	0x8d8(%rsi), %rax
1454c738d:     	testq	%rax, %rax
1454c7390:     	je	0x1454c7400 <.text+0x54c6400>
1454c7392:     	movq	0x8e0(%rsi), %rcx
1454c7399:     	movl	$0x2cd, %edx            # imm = 0x2CD
1454c739e:     	movzwl	0x36(%rax), %r10d
1454c73a3:     	movl	%r10d, %r11d
1454c73a6:     	addl	%r11d, %r11d
1454c73a9:     	movq	$-0x1, %r9
1454c73b0:     	testq	%r11, %r11
1454c73b3:     	je	0x1454c73e0 <.text+0x54c63e0>
1454c73b5:     	movzwl	0x3a(%rax,%r9,2), %edi
1454c73bb:     	cmpl	%edi, %edx
1454c73bd:     	seta	%bl
1454c73c0:     	sbbb	$0x0, %bl
1454c73c3:     	incq	%r9
1454c73c6:     	addq	$-0x2, %r11
1454c73ca:     	cmpb	$0x1, %bl
1454c73cd:     	je	0x1454c73b0 <.text+0x54c63b0>
1454c73cf:     	movzbl	%bl, %r10d
1454c73d3:     	testl	%r10d, %r10d
1454c73d6:     	je	0x1454c73f0 <.text+0x54c63f0>
1454c73d8:     	jmp	0x1454c73e3 <.text+0x54c63e3>
1454c73da:     	nopw	(%rax,%rax)
1454c73e0:     	movq	%r10, %r9
1454c73e3:     	subq	$0x1, %rcx
1454c73e7:     	jb	0x1454c7402 <.text+0x54c6402>
1454c73e9:     	movq	0x50(%rax,%r9,8), %rax
1454c73ee:     	jmp	0x1454c739e <.text+0x54c639e>
1454c73f0:     	movl	%r8d, 0x8(%rax,%r9,4)
1454c73f5:     	cmpl	$0x0, 0x93c(%rsi)
1454c73fc:     	jne	0x1454c7433 <.text+0x54c6433>
1454c73fe:     	jmp	0x1454c7464 <.text+0x54c6464>
1454c7400:     	xorl	%eax, %eax
1454c7402:     	movq	%r15, 0x20(%rbp)
1454c7406:     	movq	%rax, 0x28(%rbp)
1454c740a:     	movq	$0x0, 0x30(%rbp)
1454c7412:     	movq	%r9, 0x38(%rbp)
1454c7416:     	movq	$0x2cd, 0x40(%rbp)      # imm = 0x2CD
1454c741e:     	movq	%rbp, %rcx
1454c7421:     	leaq	0x20(%rbp), %rdx
1454c7425:     	callq	0x14552a730 <.text+0x5529730>
1454c742a:     	cmpl	$0x0, 0x93c(%rsi)
1454c7431:     	je	0x1454c7464 <.text+0x54c6464>
1454c7433:     	cmpb	$0x1, 0x9b9(%rsi)
1454c743a:     	jne	0x1454c7464 <.text+0x54c6464>
1454c743c:     	cmpb	$0x0, 0x9b2(%rsi)
1454c7443:     	jne	0x1454c7464 <.text+0x54c6464>
1454c7445:     	cmpb	$0x1, 0x9ae(%rsi)
1454c744c:     	jne	0x1454c7457 <.text+0x54c6457>
1454c744e:     	cmpb	$0x0, 0x9af(%rsi)
1454c7455:     	je	0x1454c7464 <.text+0x54c6464>
1454c7457:     	movq	%rsi, %rcx
1454c745a:     	xorl	%edx, %edx
1454c745c:     	movb	$0x1, %r8b
1454c745f:     	callq	0x1454ec7a0 <.text+0x54eb7a0>
1454c7464:     	movaps	0xb0(%rbp), %xmm6
1454c746b:     	movaps	0xc0(%rbp), %xmm7
1454c7472:     	movaps	0xd0(%rbp), %xmm8
1454c747a:     	movaps	0xe0(%rbp), %xmm9
1454c7482:     	movaps	0xf0(%rbp), %xmm10
1454c748a:     	movaps	0x100(%rbp), %xmm11
1454c7492:     	movaps	0x110(%rbp), %xmm12
1454c749a:     	movaps	0x120(%rbp), %xmm13
1454c74a2:     	movaps	0x130(%rbp), %xmm14
1454c74aa:     	movaps	0x140(%rbp), %xmm15
1454c74b2:     	addq	$0x1d8, %rsp            # imm = 0x1D8
1454c74b9:     	popq	%rbx
1454c74ba:     	popq	%rdi
1454c74bb:     	popq	%rsi
1454c74bc:     	popq	%r12
1454c74be:     	popq	%r13
1454c74c0:     	popq	%r14
1454c74c2:     	popq	%r15
1454c74c4:     	popq	%rbp
1454c74c5:     	retq
