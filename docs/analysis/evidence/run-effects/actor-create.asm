
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d2910:     	pushq	%rbp
1454d2911:     	pushq	%r15
1454d2913:     	pushq	%r14
1454d2915:     	pushq	%r12
1454d2917:     	pushq	%rsi
1454d2918:     	pushq	%rdi
1454d2919:     	pushq	%rbx
1454d291a:     	subq	$0x100, %rsp            # imm = 0x100
1454d2921:     	leaq	0x80(%rsp), %rbp
1454d2929:     	movdqa	%xmm6, 0x70(%rbp)
1454d292e:     	movq	$-0x2, 0x68(%rbp)
1454d2936:     	movl	%r9d, %r14d
1454d2939:     	movl	%r8d, %r12d
1454d293c:     	movq	%rdx, %rdi
1454d293f:     	movq	%rcx, %rsi
1454d2942:     	movzbl	0xf0(%rbp), %eax
1454d2949:     	leal	(%rax,%rax,2), %eax
1454d294c:     	addl	0x410(%rcx), %eax
1454d2952:     	cmpl	$0x3f, %eax
1454d2955:     	movl	$0x3f, %r15d
1454d295b:     	cmovbl	%eax, %r15d
1454d295f:     	movq	$0x0, 0x18(%rbp)
1454d2967:     	movq	$0x0, 0x28(%rbp)
1454d296f:     	leaq	0x18(%rbp), %rbx
1454d2973:     	movq	%rbx, %rcx
1454d2976:     	xorl	%edx, %edx
1454d2978:     	movq	%rdi, %r8
1454d297b:     	callq	0x145513710 <.text+0x5512710>
1454d2980:     	nop
1454d2981:     	movq	0x18(%rbp), %rax
1454d2985:     	testq	%rax, %rax
1454d2988:     	je	0x1454d29fb <.text+0x54d19fb>
1454d298a:     	movq	0x20(%rbp), %rcx
1454d298e:     	movw	$0x2, %dx
1454d2992:     	movzwl	0x36(%rax), %r9d
1454d2997:     	movl	%r9d, %r10d
1454d299a:     	addl	%r10d, %r10d
1454d299d:     	movq	$-0x1, %r8
1454d29a4:     	nopw	%cs:(%rax,%rax)
1454d29b0:     	testq	%r10, %r10
1454d29b3:     	je	0x1454d29e0 <.text+0x54d19e0>
1454d29b5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d29bb:     	seta	%r11b
1454d29bf:     	sbbb	$0x0, %r11b
1454d29c3:     	incq	%r8
1454d29c6:     	addq	$-0x2, %r10
1454d29ca:     	cmpb	$0x1, %r11b
1454d29ce:     	je	0x1454d29b0 <.text+0x54d19b0>
1454d29d0:     	movzbl	%r11b, %r9d
1454d29d4:     	testl	%r9d, %r9d
1454d29d7:     	je	0x1454d29f0 <.text+0x54d19f0>
1454d29d9:     	jmp	0x1454d29e3 <.text+0x54d19e3>
1454d29db:     	nopl	(%rax,%rax)
1454d29e0:     	movq	%r9, %r8
1454d29e3:     	subq	$0x1, %rcx
1454d29e7:     	jb	0x1454d29fd <.text+0x54d19fd>
1454d29e9:     	movq	0x50(%rax,%r8,8), %rax
1454d29ee:     	jmp	0x1454d2992 <.text+0x54d1992>
1454d29f0:     	movl	$0x9, 0x8(%rax,%r8,4)
1454d29f9:     	jmp	0x1454d2a2d <.text+0x54d1a2d>
1454d29fb:     	xorl	%eax, %eax
1454d29fd:     	movq	%rbx, 0x30(%rbp)
1454d2a01:     	movq	%rax, 0x38(%rbp)
1454d2a05:     	movq	$0x0, 0x40(%rbp)
1454d2a0d:     	movq	%r8, 0x48(%rbp)
1454d2a11:     	movq	$0x2, 0x50(%rbp)
1454d2a19:     	leaq	-0x8(%rbp), %rcx
1454d2a1d:     	leaq	0x30(%rbp), %rdx
1454d2a21:     	movl	$0x9, %r8d
1454d2a27:     	callq	0x14552a730 <.text+0x5529730>
1454d2a2c:     	nop
1454d2a2d:     	movq	0x18(%rbp), %rax
1454d2a31:     	testq	%rax, %rax
1454d2a34:     	je	0x1454d2a97 <.text+0x54d1a97>
1454d2a36:     	movq	0x20(%rbp), %rcx
1454d2a3a:     	movw	$0x3, %dx
1454d2a3e:     	movzwl	0x36(%rax), %r9d
1454d2a43:     	movl	%r9d, %r10d
1454d2a46:     	addl	%r10d, %r10d
1454d2a49:     	movq	$-0x1, %r8
1454d2a50:     	testq	%r10, %r10
1454d2a53:     	je	0x1454d2a80 <.text+0x54d1a80>
1454d2a55:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2a5b:     	seta	%r11b
1454d2a5f:     	sbbb	$0x0, %r11b
1454d2a63:     	incq	%r8
1454d2a66:     	addq	$-0x2, %r10
1454d2a6a:     	cmpb	$0x1, %r11b
1454d2a6e:     	je	0x1454d2a50 <.text+0x54d1a50>
1454d2a70:     	movzbl	%r11b, %r9d
1454d2a74:     	testl	%r9d, %r9d
1454d2a77:     	je	0x1454d2a90 <.text+0x54d1a90>
1454d2a79:     	jmp	0x1454d2a83 <.text+0x54d1a83>
1454d2a7b:     	nopl	(%rax,%rax)
1454d2a80:     	movq	%r9, %r8
1454d2a83:     	subq	$0x1, %rcx
1454d2a87:     	jb	0x1454d2a99 <.text+0x54d1a99>
1454d2a89:     	movq	0x50(%rax,%r8,8), %rax
1454d2a8e:     	jmp	0x1454d2a3e <.text+0x54d1a3e>
1454d2a90:     	movl	%r12d, 0x8(%rax,%r8,4)
1454d2a95:     	jmp	0x1454d2ac6 <.text+0x54d1ac6>
1454d2a97:     	xorl	%eax, %eax
1454d2a99:     	movq	%rbx, 0x30(%rbp)
1454d2a9d:     	movq	%rax, 0x38(%rbp)
1454d2aa1:     	movq	$0x0, 0x40(%rbp)
1454d2aa9:     	movq	%r8, 0x48(%rbp)
1454d2aad:     	movq	$0x3, 0x50(%rbp)
1454d2ab5:     	leaq	-0x8(%rbp), %rcx
1454d2ab9:     	leaq	0x30(%rbp), %rdx
1454d2abd:     	movl	%r12d, %r8d
1454d2ac0:     	callq	0x14552a730 <.text+0x5529730>
1454d2ac5:     	nop
1454d2ac6:     	movd	0xe0(%rbp), %xmm6
1454d2ace:     	movq	0x18(%rbp), %rax
1454d2ad2:     	testq	%rax, %rax
1454d2ad5:     	je	0x1454d2b49 <.text+0x54d1b49>
1454d2ad7:     	movq	0x20(%rbp), %rcx
1454d2adb:     	movw	$0x4, %dx
1454d2adf:     	movzwl	0x36(%rax), %r8d
1454d2ae4:     	movl	%r8d, %r10d
1454d2ae7:     	addl	%r10d, %r10d
1454d2aea:     	movq	$-0x1, %r9
1454d2af1:     	nopw	%cs:(%rax,%rax)
1454d2b00:     	testq	%r10, %r10
1454d2b03:     	je	0x1454d2b30 <.text+0x54d1b30>
1454d2b05:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2b0b:     	seta	%r11b
1454d2b0f:     	sbbb	$0x0, %r11b
1454d2b13:     	incq	%r9
1454d2b16:     	addq	$-0x2, %r10
1454d2b1a:     	cmpb	$0x1, %r11b
1454d2b1e:     	je	0x1454d2b00 <.text+0x54d1b00>
1454d2b20:     	movzbl	%r11b, %r8d
1454d2b24:     	testl	%r8d, %r8d
1454d2b27:     	je	0x1454d2b40 <.text+0x54d1b40>
1454d2b29:     	jmp	0x1454d2b33 <.text+0x54d1b33>
1454d2b2b:     	nopl	(%rax,%rax)
1454d2b30:     	movq	%r8, %r9
1454d2b33:     	subq	$0x1, %rcx
1454d2b37:     	jb	0x1454d2b4b <.text+0x54d1b4b>
1454d2b39:     	movq	0x50(%rax,%r9,8), %rax
1454d2b3e:     	jmp	0x1454d2adf <.text+0x54d1adf>
1454d2b40:     	movd	%xmm6, 0x8(%rax,%r9,4)
1454d2b47:     	jmp	0x1454d2b7a <.text+0x54d1b7a>
1454d2b49:     	xorl	%eax, %eax
1454d2b4b:     	movd	%xmm6, %r8d
1454d2b50:     	movq	%rbx, 0x30(%rbp)
1454d2b54:     	movq	%rax, 0x38(%rbp)
1454d2b58:     	movq	$0x0, 0x40(%rbp)
1454d2b60:     	movq	%r9, 0x48(%rbp)
1454d2b64:     	movq	$0x4, 0x50(%rbp)
1454d2b6c:     	leaq	-0x8(%rbp), %rcx
1454d2b70:     	leaq	0x30(%rbp), %rdx
1454d2b74:     	callq	0x14552a730 <.text+0x5529730>
1454d2b79:     	nop
1454d2b7a:     	movss	0xe8(%rbp), %xmm0
1454d2b82:     	callq	0x14577327d <.text+0x577227d>
1454d2b87:     	cvttss2si	%xmm0, %rax
1454d2b8c:     	xorl	%ecx, %ecx
1454d2b8e:     	xorps	%xmm1, %xmm1
1454d2b91:     	ucomiss	%xmm1, %xmm0
1454d2b94:     	cmovbl	%ecx, %eax
1454d2b97:     	ucomiss	0x43498e(%rip), %xmm0   # 0x14590752c
1454d2b9e:     	movl	$0xffffffff, %r12d      # imm = 0xFFFFFFFF
1454d2ba4:     	cmovbel	%eax, %r12d
1454d2ba8:     	movq	0x18(%rbp), %rax
1454d2bac:     	testq	%rax, %rax
1454d2baf:     	je	0x1454d2c17 <.text+0x54d1c17>
1454d2bb1:     	movq	0x20(%rbp), %rcx
1454d2bb5:     	movw	$0x16, %dx
1454d2bb9:     	movzwl	0x36(%rax), %r9d
1454d2bbe:     	movl	%r9d, %r10d
1454d2bc1:     	addl	%r10d, %r10d
1454d2bc4:     	movq	$-0x1, %r8
1454d2bcb:     	nopl	(%rax,%rax)
1454d2bd0:     	testq	%r10, %r10
1454d2bd3:     	je	0x1454d2c00 <.text+0x54d1c00>
1454d2bd5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2bdb:     	seta	%r11b
1454d2bdf:     	sbbb	$0x0, %r11b
1454d2be3:     	incq	%r8
1454d2be6:     	addq	$-0x2, %r10
1454d2bea:     	cmpb	$0x1, %r11b
1454d2bee:     	je	0x1454d2bd0 <.text+0x54d1bd0>
1454d2bf0:     	movzbl	%r11b, %r9d
1454d2bf4:     	testl	%r9d, %r9d
1454d2bf7:     	je	0x1454d2c10 <.text+0x54d1c10>
1454d2bf9:     	jmp	0x1454d2c03 <.text+0x54d1c03>
1454d2bfb:     	nopl	(%rax,%rax)
1454d2c00:     	movq	%r9, %r8
1454d2c03:     	subq	$0x1, %rcx
1454d2c07:     	jb	0x1454d2c19 <.text+0x54d1c19>
1454d2c09:     	movq	0x50(%rax,%r8,8), %rax
1454d2c0e:     	jmp	0x1454d2bb9 <.text+0x54d1bb9>
1454d2c10:     	movl	%r12d, 0x8(%rax,%r8,4)
1454d2c15:     	jmp	0x1454d2c46 <.text+0x54d1c46>
1454d2c17:     	xorl	%eax, %eax
1454d2c19:     	movq	%rbx, 0x30(%rbp)
1454d2c1d:     	movq	%rax, 0x38(%rbp)
1454d2c21:     	movq	$0x0, 0x40(%rbp)
1454d2c29:     	movq	%r8, 0x48(%rbp)
1454d2c2d:     	movq	$0x16, 0x50(%rbp)
1454d2c35:     	leaq	-0x8(%rbp), %rcx
1454d2c39:     	leaq	0x30(%rbp), %rdx
1454d2c3d:     	movl	%r12d, %r8d
1454d2c40:     	callq	0x14552a730 <.text+0x5529730>
1454d2c45:     	nop
1454d2c46:     	movq	0x18(%rbp), %rax
1454d2c4a:     	testq	%rax, %rax
1454d2c4d:     	je	0x1454d2cb7 <.text+0x54d1cb7>
1454d2c4f:     	movq	0x20(%rbp), %rcx
1454d2c53:     	movw	$0x1c, %dx
1454d2c57:     	movzwl	0x36(%rax), %r9d
1454d2c5c:     	movl	%r9d, %r10d
1454d2c5f:     	addl	%r10d, %r10d
1454d2c62:     	movq	$-0x1, %r8
1454d2c69:     	nopl	(%rax)
1454d2c70:     	testq	%r10, %r10
1454d2c73:     	je	0x1454d2ca0 <.text+0x54d1ca0>
1454d2c75:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2c7b:     	seta	%r11b
1454d2c7f:     	sbbb	$0x0, %r11b
1454d2c83:     	incq	%r8
1454d2c86:     	addq	$-0x2, %r10
1454d2c8a:     	cmpb	$0x1, %r11b
1454d2c8e:     	je	0x1454d2c70 <.text+0x54d1c70>
1454d2c90:     	movzbl	%r11b, %r9d
1454d2c94:     	testl	%r9d, %r9d
1454d2c97:     	je	0x1454d2cb0 <.text+0x54d1cb0>
1454d2c99:     	jmp	0x1454d2ca3 <.text+0x54d1ca3>
1454d2c9b:     	nopl	(%rax,%rax)
1454d2ca0:     	movq	%r9, %r8
1454d2ca3:     	subq	$0x1, %rcx
1454d2ca7:     	jb	0x1454d2cb9 <.text+0x54d1cb9>
1454d2ca9:     	movq	0x50(%rax,%r8,8), %rax
1454d2cae:     	jmp	0x1454d2c57 <.text+0x54d1c57>
1454d2cb0:     	movl	%r12d, 0x8(%rax,%r8,4)
1454d2cb5:     	jmp	0x1454d2ce6 <.text+0x54d1ce6>
1454d2cb7:     	xorl	%eax, %eax
1454d2cb9:     	movq	%rbx, 0x30(%rbp)
1454d2cbd:     	movq	%rax, 0x38(%rbp)
1454d2cc1:     	movq	$0x0, 0x40(%rbp)
1454d2cc9:     	movq	%r8, 0x48(%rbp)
1454d2ccd:     	movq	$0x1c, 0x50(%rbp)
1454d2cd5:     	leaq	-0x8(%rbp), %rcx
1454d2cd9:     	leaq	0x30(%rbp), %rdx
1454d2cdd:     	movl	%r12d, %r8d
1454d2ce0:     	callq	0x14552a730 <.text+0x5529730>
1454d2ce5:     	nop
1454d2ce6:     	movq	0x18(%rbp), %rax
1454d2cea:     	testq	%rax, %rax
1454d2ced:     	je	0x1454d2d57 <.text+0x54d1d57>
1454d2cef:     	movq	0x20(%rbp), %rcx
1454d2cf3:     	movw	$0x22, %dx
1454d2cf7:     	movzwl	0x36(%rax), %r9d
1454d2cfc:     	movl	%r9d, %r10d
1454d2cff:     	addl	%r10d, %r10d
1454d2d02:     	movq	$-0x1, %r8
1454d2d09:     	nopl	(%rax)
1454d2d10:     	testq	%r10, %r10
1454d2d13:     	je	0x1454d2d40 <.text+0x54d1d40>
1454d2d15:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2d1b:     	seta	%r11b
1454d2d1f:     	sbbb	$0x0, %r11b
1454d2d23:     	incq	%r8
1454d2d26:     	addq	$-0x2, %r10
1454d2d2a:     	cmpb	$0x1, %r11b
1454d2d2e:     	je	0x1454d2d10 <.text+0x54d1d10>
1454d2d30:     	movzbl	%r11b, %r9d
1454d2d34:     	testl	%r9d, %r9d
1454d2d37:     	je	0x1454d2d50 <.text+0x54d1d50>
1454d2d39:     	jmp	0x1454d2d43 <.text+0x54d1d43>
1454d2d3b:     	nopl	(%rax,%rax)
1454d2d40:     	movq	%r9, %r8
1454d2d43:     	subq	$0x1, %rcx
1454d2d47:     	jb	0x1454d2d59 <.text+0x54d1d59>
1454d2d49:     	movq	0x50(%rax,%r8,8), %rax
1454d2d4e:     	jmp	0x1454d2cf7 <.text+0x54d1cf7>
1454d2d50:     	movl	%r15d, 0x8(%rax,%r8,4)
1454d2d55:     	jmp	0x1454d2d86 <.text+0x54d1d86>
1454d2d57:     	xorl	%eax, %eax
1454d2d59:     	movq	%rbx, 0x30(%rbp)
1454d2d5d:     	movq	%rax, 0x38(%rbp)
1454d2d61:     	movq	$0x0, 0x40(%rbp)
1454d2d69:     	movq	%r8, 0x48(%rbp)
1454d2d6d:     	movq	$0x22, 0x50(%rbp)
1454d2d75:     	leaq	-0x8(%rbp), %rcx
1454d2d79:     	leaq	0x30(%rbp), %rdx
1454d2d7d:     	movl	%r15d, %r8d
1454d2d80:     	callq	0x14552a730 <.text+0x5529730>
1454d2d85:     	nop
1454d2d86:     	movq	0x18(%rbp), %rax
1454d2d8a:     	testq	%rax, %rax
1454d2d8d:     	je	0x1454d2dfb <.text+0x54d1dfb>
1454d2d8f:     	movq	0x20(%rbp), %rcx
1454d2d93:     	movw	$0x23, %dx
1454d2d97:     	movzwl	0x36(%rax), %r9d
1454d2d9c:     	movl	%r9d, %r10d
1454d2d9f:     	addl	%r10d, %r10d
1454d2da2:     	movq	$-0x1, %r8
1454d2da9:     	nopl	(%rax)
1454d2db0:     	testq	%r10, %r10
1454d2db3:     	je	0x1454d2de0 <.text+0x54d1de0>
1454d2db5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2dbb:     	seta	%r11b
1454d2dbf:     	sbbb	$0x0, %r11b
1454d2dc3:     	incq	%r8
1454d2dc6:     	addq	$-0x2, %r10
1454d2dca:     	cmpb	$0x1, %r11b
1454d2dce:     	je	0x1454d2db0 <.text+0x54d1db0>
1454d2dd0:     	movzbl	%r11b, %r9d
1454d2dd4:     	testl	%r9d, %r9d
1454d2dd7:     	je	0x1454d2df0 <.text+0x54d1df0>
1454d2dd9:     	jmp	0x1454d2de3 <.text+0x54d1de3>
1454d2ddb:     	nopl	(%rax,%rax)
1454d2de0:     	movq	%r9, %r8
1454d2de3:     	subq	$0x1, %rcx
1454d2de7:     	jb	0x1454d2dfd <.text+0x54d1dfd>
1454d2de9:     	movq	0x50(%rax,%r8,8), %rax
1454d2dee:     	jmp	0x1454d2d97 <.text+0x54d1d97>
1454d2df0:     	movl	$0xe, 0x8(%rax,%r8,4)
1454d2df9:     	jmp	0x1454d2e2d <.text+0x54d1e2d>
1454d2dfb:     	xorl	%eax, %eax
1454d2dfd:     	movq	%rbx, 0x30(%rbp)
1454d2e01:     	movq	%rax, 0x38(%rbp)
1454d2e05:     	movq	$0x0, 0x40(%rbp)
1454d2e0d:     	movq	%r8, 0x48(%rbp)
1454d2e11:     	movq	$0x23, 0x50(%rbp)
1454d2e19:     	leaq	-0x8(%rbp), %rcx
1454d2e1d:     	leaq	0x30(%rbp), %rdx
1454d2e21:     	movl	$0xe, %r8d
1454d2e27:     	callq	0x14552a730 <.text+0x5529730>
1454d2e2c:     	nop
1454d2e2d:     	movq	0x18(%rbp), %rax
1454d2e31:     	testq	%rax, %rax
1454d2e34:     	je	0x1454d2e9b <.text+0x54d1e9b>
1454d2e36:     	movq	0x20(%rbp), %rcx
1454d2e3a:     	movw	$0x24, %dx
1454d2e3e:     	movzwl	0x36(%rax), %r9d
1454d2e43:     	movl	%r9d, %r10d
1454d2e46:     	addl	%r10d, %r10d
1454d2e49:     	movq	$-0x1, %r8
1454d2e50:     	testq	%r10, %r10
1454d2e53:     	je	0x1454d2e80 <.text+0x54d1e80>
1454d2e55:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2e5b:     	seta	%r11b
1454d2e5f:     	sbbb	$0x0, %r11b
1454d2e63:     	incq	%r8
1454d2e66:     	addq	$-0x2, %r10
1454d2e6a:     	cmpb	$0x1, %r11b
1454d2e6e:     	je	0x1454d2e50 <.text+0x54d1e50>
1454d2e70:     	movzbl	%r11b, %r9d
1454d2e74:     	testl	%r9d, %r9d
1454d2e77:     	je	0x1454d2e90 <.text+0x54d1e90>
1454d2e79:     	jmp	0x1454d2e83 <.text+0x54d1e83>
1454d2e7b:     	nopl	(%rax,%rax)
1454d2e80:     	movq	%r9, %r8
1454d2e83:     	subq	$0x1, %rcx
1454d2e87:     	jb	0x1454d2e9d <.text+0x54d1e9d>
1454d2e89:     	movq	0x50(%rax,%r8,8), %rax
1454d2e8e:     	jmp	0x1454d2e3e <.text+0x54d1e3e>
1454d2e90:     	movl	$0x100, 0x8(%rax,%r8,4) # imm = 0x100
1454d2e99:     	jmp	0x1454d2ecd <.text+0x54d1ecd>
1454d2e9b:     	xorl	%eax, %eax
1454d2e9d:     	movq	%rbx, 0x30(%rbp)
1454d2ea1:     	movq	%rax, 0x38(%rbp)
1454d2ea5:     	movq	$0x0, 0x40(%rbp)
1454d2ead:     	movq	%r8, 0x48(%rbp)
1454d2eb1:     	movq	$0x24, 0x50(%rbp)
1454d2eb9:     	leaq	-0x8(%rbp), %rcx
1454d2ebd:     	leaq	0x30(%rbp), %rdx
1454d2ec1:     	movl	$0x100, %r8d            # imm = 0x100
1454d2ec7:     	callq	0x14552a730 <.text+0x5529730>
1454d2ecc:     	nop
1454d2ecd:     	movq	0x18(%rbp), %rax
1454d2ed1:     	testq	%rax, %rax
1454d2ed4:     	je	0x1454d2f3b <.text+0x54d1f3b>
1454d2ed6:     	movq	0x20(%rbp), %rcx
1454d2eda:     	movw	$0x2e, %dx
1454d2ede:     	movzwl	0x36(%rax), %r9d
1454d2ee3:     	movl	%r9d, %r10d
1454d2ee6:     	addl	%r10d, %r10d
1454d2ee9:     	movq	$-0x1, %r8
1454d2ef0:     	testq	%r10, %r10
1454d2ef3:     	je	0x1454d2f20 <.text+0x54d1f20>
1454d2ef5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2efb:     	seta	%r11b
1454d2eff:     	sbbb	$0x0, %r11b
1454d2f03:     	incq	%r8
1454d2f06:     	addq	$-0x2, %r10
1454d2f0a:     	cmpb	$0x1, %r11b
1454d2f0e:     	je	0x1454d2ef0 <.text+0x54d1ef0>
1454d2f10:     	movzbl	%r11b, %r9d
1454d2f14:     	testl	%r9d, %r9d
1454d2f17:     	je	0x1454d2f30 <.text+0x54d1f30>
1454d2f19:     	jmp	0x1454d2f23 <.text+0x54d1f23>
1454d2f1b:     	nopl	(%rax,%rax)
1454d2f20:     	movq	%r9, %r8
1454d2f23:     	subq	$0x1, %rcx
1454d2f27:     	jb	0x1454d2f3d <.text+0x54d1f3d>
1454d2f29:     	movq	0x50(%rax,%r8,8), %rax
1454d2f2e:     	jmp	0x1454d2ede <.text+0x54d1ede>
1454d2f30:     	movl	$0x0, 0x8(%rax,%r8,4)
1454d2f39:     	jmp	0x1454d2f6a <.text+0x54d1f6a>
1454d2f3b:     	xorl	%eax, %eax
1454d2f3d:     	movq	%rbx, 0x30(%rbp)
1454d2f41:     	movq	%rax, 0x38(%rbp)
1454d2f45:     	movq	$0x0, 0x40(%rbp)
1454d2f4d:     	movq	%r8, 0x48(%rbp)
1454d2f51:     	movq	$0x2e, 0x50(%rbp)
1454d2f59:     	leaq	-0x8(%rbp), %rcx
1454d2f5d:     	leaq	0x30(%rbp), %rdx
1454d2f61:     	xorl	%r8d, %r8d
1454d2f64:     	callq	0x14552a730 <.text+0x5529730>
1454d2f69:     	nop
1454d2f6a:     	movq	0x18(%rbp), %rax
1454d2f6e:     	testq	%rax, %rax
1454d2f71:     	je	0x1454d2fdb <.text+0x54d1fdb>
1454d2f73:     	movq	0x20(%rbp), %rcx
1454d2f77:     	movw	$0x7e, %dx
1454d2f7b:     	movzwl	0x36(%rax), %r9d
1454d2f80:     	movl	%r9d, %r10d
1454d2f83:     	addl	%r10d, %r10d
1454d2f86:     	movq	$-0x1, %r8
1454d2f8d:     	nopl	(%rax)
1454d2f90:     	testq	%r10, %r10
1454d2f93:     	je	0x1454d2fc0 <.text+0x54d1fc0>
1454d2f95:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2f9b:     	seta	%r11b
1454d2f9f:     	sbbb	$0x0, %r11b
1454d2fa3:     	incq	%r8
1454d2fa6:     	addq	$-0x2, %r10
1454d2faa:     	cmpb	$0x1, %r11b
1454d2fae:     	je	0x1454d2f90 <.text+0x54d1f90>
1454d2fb0:     	movzbl	%r11b, %r9d
1454d2fb4:     	testl	%r9d, %r9d
1454d2fb7:     	je	0x1454d2fd0 <.text+0x54d1fd0>
1454d2fb9:     	jmp	0x1454d2fc3 <.text+0x54d1fc3>
1454d2fbb:     	nopl	(%rax,%rax)
1454d2fc0:     	movq	%r9, %r8
1454d2fc3:     	subq	$0x1, %rcx
1454d2fc7:     	jb	0x1454d2fdd <.text+0x54d1fdd>
1454d2fc9:     	movq	0x50(%rax,%r8,8), %rax
1454d2fce:     	jmp	0x1454d2f7b <.text+0x54d1f7b>
1454d2fd0:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
1454d2fd9:     	jmp	0x1454d300d <.text+0x54d200d>
1454d2fdb:     	xorl	%eax, %eax
1454d2fdd:     	movq	%rbx, 0x30(%rbp)
1454d2fe1:     	movq	%rax, 0x38(%rbp)
1454d2fe5:     	movq	$0x0, 0x40(%rbp)
1454d2fed:     	movq	%r8, 0x48(%rbp)
1454d2ff1:     	movq	$0x7e, 0x50(%rbp)
1454d2ff9:     	leaq	-0x8(%rbp), %rcx
1454d2ffd:     	leaq	0x30(%rbp), %rdx
1454d3001:     	movl	$0x7d0, %r8d            # imm = 0x7D0
1454d3007:     	callq	0x14552a730 <.text+0x5529730>
1454d300c:     	nop
1454d300d:     	movq	0x18(%rbp), %rax
1454d3011:     	testq	%rax, %rax
1454d3014:     	je	0x1454d307b <.text+0x54d207b>
1454d3016:     	movq	0x20(%rbp), %rcx
1454d301a:     	movw	$0x7f, %dx
1454d301e:     	movzwl	0x36(%rax), %r9d
1454d3023:     	movl	%r9d, %r10d
1454d3026:     	addl	%r10d, %r10d
1454d3029:     	movq	$-0x1, %r8
1454d3030:     	testq	%r10, %r10
1454d3033:     	je	0x1454d3060 <.text+0x54d2060>
1454d3035:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d303b:     	seta	%r11b
1454d303f:     	sbbb	$0x0, %r11b
1454d3043:     	incq	%r8
1454d3046:     	addq	$-0x2, %r10
1454d304a:     	cmpb	$0x1, %r11b
1454d304e:     	je	0x1454d3030 <.text+0x54d2030>
1454d3050:     	movzbl	%r11b, %r9d
1454d3054:     	testl	%r9d, %r9d
1454d3057:     	je	0x1454d3070 <.text+0x54d2070>
1454d3059:     	jmp	0x1454d3063 <.text+0x54d2063>
1454d305b:     	nopl	(%rax,%rax)
1454d3060:     	movq	%r9, %r8
1454d3063:     	subq	$0x1, %rcx
1454d3067:     	jb	0x1454d307d <.text+0x54d207d>
1454d3069:     	movq	0x50(%rax,%r8,8), %rax
1454d306e:     	jmp	0x1454d301e <.text+0x54d201e>
1454d3070:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
1454d3079:     	jmp	0x1454d30ad <.text+0x54d20ad>
1454d307b:     	xorl	%eax, %eax
1454d307d:     	movq	%rbx, 0x30(%rbp)
1454d3081:     	movq	%rax, 0x38(%rbp)
1454d3085:     	movq	$0x0, 0x40(%rbp)
1454d308d:     	movq	%r8, 0x48(%rbp)
1454d3091:     	movq	$0x7f, 0x50(%rbp)
1454d3099:     	leaq	-0x8(%rbp), %rcx
1454d309d:     	leaq	0x30(%rbp), %rdx
1454d30a1:     	movl	$0x7d0, %r8d            # imm = 0x7D0
1454d30a7:     	callq	0x14552a730 <.text+0x5529730>
1454d30ac:     	nop
1454d30ad:     	movss	0x4343e3(%rip), %xmm0   # 0x145907498
1454d30b5:     	mulss	%xmm6, %xmm0
1454d30b9:     	movq	0x18(%rbp), %rax
1454d30bd:     	testq	%rax, %rax
1454d30c0:     	je	0x1454d3129 <.text+0x54d2129>
1454d30c2:     	movq	0x20(%rbp), %rcx
1454d30c6:     	movl	$0x81, %edx
1454d30cb:     	movzwl	0x36(%rax), %r8d
1454d30d0:     	movl	%r8d, %r10d
1454d30d3:     	addl	%r10d, %r10d
1454d30d6:     	movq	$-0x1, %r9
1454d30dd:     	nopl	(%rax)
1454d30e0:     	testq	%r10, %r10
1454d30e3:     	je	0x1454d3110 <.text+0x54d2110>
1454d30e5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454d30eb:     	cmpl	%r11d, %edx
1454d30ee:     	seta	%r11b
1454d30f2:     	sbbb	$0x0, %r11b
1454d30f6:     	incq	%r9
1454d30f9:     	addq	$-0x2, %r10
1454d30fd:     	cmpb	$0x1, %r11b
1454d3101:     	je	0x1454d30e0 <.text+0x54d20e0>
1454d3103:     	movzbl	%r11b, %r8d
1454d3107:     	testl	%r8d, %r8d
1454d310a:     	je	0x1454d3120 <.text+0x54d2120>
1454d310c:     	jmp	0x1454d3113 <.text+0x54d2113>
1454d310e:     	nop
1454d3110:     	movq	%r8, %r9
1454d3113:     	subq	$0x1, %rcx
1454d3117:     	jb	0x1454d312b <.text+0x54d212b>
1454d3119:     	movq	0x50(%rax,%r9,8), %rax
1454d311e:     	jmp	0x1454d30cb <.text+0x54d20cb>
1454d3120:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454d3127:     	jmp	0x1454d315a <.text+0x54d215a>
1454d3129:     	xorl	%eax, %eax
1454d312b:     	movd	%xmm0, %r8d
1454d3130:     	movq	%rbx, 0x30(%rbp)
1454d3134:     	movq	%rax, 0x38(%rbp)
1454d3138:     	movq	$0x0, 0x40(%rbp)
1454d3140:     	movq	%r9, 0x48(%rbp)
1454d3144:     	movq	$0x81, 0x50(%rbp)
1454d314c:     	leaq	-0x8(%rbp), %rcx
1454d3150:     	leaq	0x30(%rbp), %rdx
1454d3154:     	callq	0x14552a730 <.text+0x5529730>
1454d3159:     	nop
1454d315a:     	mulss	0x478276(%rip), %xmm6   # 0x14594b3d8
1454d3162:     	movq	0x18(%rbp), %rax
1454d3166:     	testq	%rax, %rax
1454d3169:     	je	0x1454d31d9 <.text+0x54d21d9>
1454d316b:     	movq	0x20(%rbp), %rcx
1454d316f:     	movl	$0x82, %edx
1454d3174:     	movzwl	0x36(%rax), %r8d
1454d3179:     	movl	%r8d, %r10d
1454d317c:     	addl	%r10d, %r10d
1454d317f:     	movq	$-0x1, %r9
1454d3186:     	nopw	%cs:(%rax,%rax)
1454d3190:     	testq	%r10, %r10
1454d3193:     	je	0x1454d31c0 <.text+0x54d21c0>
1454d3195:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454d319b:     	cmpl	%r11d, %edx
1454d319e:     	seta	%r11b
1454d31a2:     	sbbb	$0x0, %r11b
1454d31a6:     	incq	%r9
1454d31a9:     	addq	$-0x2, %r10
1454d31ad:     	cmpb	$0x1, %r11b
1454d31b1:     	je	0x1454d3190 <.text+0x54d2190>
1454d31b3:     	movzbl	%r11b, %r8d
1454d31b7:     	testl	%r8d, %r8d
1454d31ba:     	je	0x1454d31d0 <.text+0x54d21d0>
1454d31bc:     	jmp	0x1454d31c3 <.text+0x54d21c3>
1454d31be:     	nop
1454d31c0:     	movq	%r8, %r9
1454d31c3:     	subq	$0x1, %rcx
1454d31c7:     	jb	0x1454d31db <.text+0x54d21db>
1454d31c9:     	movq	0x50(%rax,%r9,8), %rax
1454d31ce:     	jmp	0x1454d3174 <.text+0x54d2174>
1454d31d0:     	movss	%xmm6, 0x8(%rax,%r9,4)
1454d31d7:     	jmp	0x1454d320a <.text+0x54d220a>
1454d31d9:     	xorl	%eax, %eax
1454d31db:     	movd	%xmm6, %r8d
1454d31e0:     	movq	%rbx, 0x30(%rbp)
1454d31e4:     	movq	%rax, 0x38(%rbp)
1454d31e8:     	movq	$0x0, 0x40(%rbp)
1454d31f0:     	movq	%r9, 0x48(%rbp)
1454d31f4:     	movq	$0x82, 0x50(%rbp)
1454d31fc:     	leaq	-0x8(%rbp), %rcx
1454d3200:     	leaq	0x30(%rbp), %rdx
1454d3204:     	callq	0x14552a730 <.text+0x5529730>
1454d3209:     	nop
1454d320a:     	movq	0x18(%rbp), %rax
1454d320e:     	testq	%rax, %rax
1454d3211:     	je	0x1454d3277 <.text+0x54d2277>
1454d3213:     	movq	0x20(%rbp), %rcx
1454d3217:     	movl	$0x83, %edx
1454d321c:     	movzwl	0x36(%rax), %r9d
1454d3221:     	movl	%r9d, %r10d
1454d3224:     	addl	%r10d, %r10d
1454d3227:     	movq	$-0x1, %r8
1454d322e:     	nop
1454d3230:     	testq	%r10, %r10
1454d3233:     	je	0x1454d3260 <.text+0x54d2260>
1454d3235:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454d323b:     	cmpl	%r11d, %edx
1454d323e:     	seta	%r11b
1454d3242:     	sbbb	$0x0, %r11b
1454d3246:     	incq	%r8
1454d3249:     	addq	$-0x2, %r10
1454d324d:     	cmpb	$0x1, %r11b
1454d3251:     	je	0x1454d3230 <.text+0x54d2230>
1454d3253:     	movzbl	%r11b, %r9d
1454d3257:     	testl	%r9d, %r9d
1454d325a:     	je	0x1454d3270 <.text+0x54d2270>
1454d325c:     	jmp	0x1454d3263 <.text+0x54d2263>
1454d325e:     	nop
1454d3260:     	movq	%r9, %r8
1454d3263:     	subq	$0x1, %rcx
1454d3267:     	jb	0x1454d3279 <.text+0x54d2279>
1454d3269:     	movq	0x50(%rax,%r8,8), %rax
1454d326e:     	jmp	0x1454d321c <.text+0x54d221c>
1454d3270:     	movl	%r14d, 0x8(%rax,%r8,4)
1454d3275:     	jmp	0x1454d32a6 <.text+0x54d22a6>
1454d3277:     	xorl	%eax, %eax
1454d3279:     	movq	%rbx, 0x30(%rbp)
1454d327d:     	movq	%rax, 0x38(%rbp)
1454d3281:     	movq	$0x0, 0x40(%rbp)
1454d3289:     	movq	%r8, 0x48(%rbp)
1454d328d:     	movq	$0x83, 0x50(%rbp)
1454d3295:     	leaq	-0x8(%rbp), %rcx
1454d3299:     	leaq	0x30(%rbp), %rdx
1454d329d:     	movl	%r14d, %r8d
1454d32a0:     	callq	0x14552a730 <.text+0x5529730>
1454d32a5:     	nop
1454d32a6:     	movq	0x18(%rbp), %rax
1454d32aa:     	testq	%rax, %rax
1454d32ad:     	je	0x1454d3317 <.text+0x54d2317>
1454d32af:     	movq	0x20(%rbp), %rcx
1454d32b3:     	movl	$0x84, %edx
1454d32b8:     	movzwl	0x36(%rax), %r9d
1454d32bd:     	movl	%r9d, %r10d
1454d32c0:     	addl	%r10d, %r10d
1454d32c3:     	movq	$-0x1, %r8
1454d32ca:     	nopw	(%rax,%rax)
1454d32d0:     	testq	%r10, %r10
1454d32d3:     	je	0x1454d3300 <.text+0x54d2300>
1454d32d5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454d32db:     	cmpl	%r11d, %edx
1454d32de:     	seta	%r11b
1454d32e2:     	sbbb	$0x0, %r11b
1454d32e6:     	incq	%r8
1454d32e9:     	addq	$-0x2, %r10
1454d32ed:     	cmpb	$0x1, %r11b
1454d32f1:     	je	0x1454d32d0 <.text+0x54d22d0>
1454d32f3:     	movzbl	%r11b, %r9d
1454d32f7:     	testl	%r9d, %r9d
1454d32fa:     	je	0x1454d3310 <.text+0x54d2310>
1454d32fc:     	jmp	0x1454d3303 <.text+0x54d2303>
1454d32fe:     	nop
1454d3300:     	movq	%r9, %r8
1454d3303:     	subq	$0x1, %rcx
1454d3307:     	jb	0x1454d3319 <.text+0x54d2319>
1454d3309:     	movq	0x50(%rax,%r8,8), %rax
1454d330e:     	jmp	0x1454d32b8 <.text+0x54d22b8>
1454d3310:     	movl	%r14d, 0x8(%rax,%r8,4)
1454d3315:     	jmp	0x1454d3346 <.text+0x54d2346>
1454d3317:     	xorl	%eax, %eax
1454d3319:     	movq	%rbx, 0x30(%rbp)
1454d331d:     	movq	%rax, 0x38(%rbp)
1454d3321:     	movq	$0x0, 0x40(%rbp)
1454d3329:     	movq	%r8, 0x48(%rbp)
1454d332d:     	movq	$0x84, 0x50(%rbp)
1454d3335:     	leaq	-0x8(%rbp), %rcx
1454d3339:     	leaq	0x30(%rbp), %rdx
1454d333d:     	movl	%r14d, %r8d
1454d3340:     	callq	0x14552a730 <.text+0x5529730>
1454d3345:     	nop
1454d3346:     	movq	0x18(%rbp), %rax
1454d334a:     	testq	%rax, %rax
1454d334d:     	je	0x1454d33bb <.text+0x54d23bb>
1454d334f:     	movq	0x20(%rbp), %rcx
1454d3353:     	movl	$0x86, %edx
1454d3358:     	movzwl	0x36(%rax), %r9d
1454d335d:     	movl	%r9d, %r10d
1454d3360:     	addl	%r10d, %r10d
1454d3363:     	movq	$-0x1, %r8
1454d336a:     	nopw	(%rax,%rax)
1454d3370:     	testq	%r10, %r10
1454d3373:     	je	0x1454d33a0 <.text+0x54d23a0>
1454d3375:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454d337b:     	cmpl	%r11d, %edx
1454d337e:     	seta	%r11b
1454d3382:     	sbbb	$0x0, %r11b
1454d3386:     	incq	%r8
1454d3389:     	addq	$-0x2, %r10
1454d338d:     	cmpb	$0x1, %r11b
1454d3391:     	je	0x1454d3370 <.text+0x54d2370>
1454d3393:     	movzbl	%r11b, %r9d
1454d3397:     	testl	%r9d, %r9d
1454d339a:     	je	0x1454d33b0 <.text+0x54d23b0>
1454d339c:     	jmp	0x1454d33a3 <.text+0x54d23a3>
1454d339e:     	nop
1454d33a0:     	movq	%r9, %r8
1454d33a3:     	subq	$0x1, %rcx
1454d33a7:     	jb	0x1454d33bd <.text+0x54d23bd>
1454d33a9:     	movq	0x50(%rax,%r8,8), %rax
1454d33ae:     	jmp	0x1454d3358 <.text+0x54d2358>
1454d33b0:     	movl	$0x40a00000, 0x8(%rax,%r8,4) # imm = 0x40A00000
1454d33b9:     	jmp	0x1454d33ed <.text+0x54d23ed>
1454d33bb:     	xorl	%eax, %eax
1454d33bd:     	movq	%rbx, 0x30(%rbp)
1454d33c1:     	movq	%rax, 0x38(%rbp)
1454d33c5:     	movq	$0x0, 0x40(%rbp)
1454d33cd:     	movq	%r8, 0x48(%rbp)
1454d33d1:     	movq	$0x86, 0x50(%rbp)
1454d33d9:     	leaq	-0x8(%rbp), %rcx
1454d33dd:     	leaq	0x30(%rbp), %rdx
1454d33e1:     	movl	$0x40a00000, %r8d       # imm = 0x40A00000
1454d33e7:     	callq	0x14552a730 <.text+0x5529730>
1454d33ec:     	nop
1454d33ed:     	movq	0x18(%rbp), %rax
1454d33f1:     	testq	%rax, %rax
1454d33f4:     	je	0x1454d346b <.text+0x54d246b>
1454d33f6:     	movq	0x20(%rbp), %rcx
1454d33fa:     	movl	$0x87, %edx
1454d33ff:     	movzwl	0x36(%rax), %r9d
1454d3404:     	movl	%r9d, %r10d
1454d3407:     	addl	%r10d, %r10d
1454d340a:     	movq	$-0x1, %r8
1454d3411:     	nopw	%cs:(%rax,%rax)
1454d3420:     	testq	%r10, %r10
1454d3423:     	je	0x1454d3450 <.text+0x54d2450>
1454d3425:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454d342b:     	cmpl	%r11d, %edx
1454d342e:     	seta	%r11b
1454d3432:     	sbbb	$0x0, %r11b
1454d3436:     	incq	%r8
1454d3439:     	addq	$-0x2, %r10
1454d343d:     	cmpb	$0x1, %r11b
1454d3441:     	je	0x1454d3420 <.text+0x54d2420>
1454d3443:     	movzbl	%r11b, %r9d
1454d3447:     	testl	%r9d, %r9d
1454d344a:     	je	0x1454d3460 <.text+0x54d2460>
1454d344c:     	jmp	0x1454d3453 <.text+0x54d2453>
1454d344e:     	nop
1454d3450:     	movq	%r9, %r8
1454d3453:     	subq	$0x1, %rcx
1454d3457:     	jb	0x1454d346d <.text+0x54d246d>
1454d3459:     	movq	0x50(%rax,%r8,8), %rax
1454d345e:     	jmp	0x1454d33ff <.text+0x54d23ff>
1454d3460:     	movl	$0x41200000, 0x8(%rax,%r8,4) # imm = 0x41200000
1454d3469:     	jmp	0x1454d349d <.text+0x54d249d>
1454d346b:     	xorl	%eax, %eax
1454d346d:     	movq	%rbx, 0x30(%rbp)
1454d3471:     	movq	%rax, 0x38(%rbp)
1454d3475:     	movq	$0x0, 0x40(%rbp)
1454d347d:     	movq	%r8, 0x48(%rbp)
1454d3481:     	movq	$0x87, 0x50(%rbp)
1454d3489:     	leaq	-0x8(%rbp), %rcx
1454d348d:     	leaq	0x30(%rbp), %rdx
1454d3491:     	movl	$0x41200000, %r8d       # imm = 0x41200000
1454d3497:     	callq	0x14552a730 <.text+0x5529730>
1454d349c:     	nop
1454d349d:     	movq	0x18(%rbp), %rax
1454d34a1:     	testq	%rax, %rax
1454d34a4:     	je	0x1454d351b <.text+0x54d251b>
1454d34a6:     	movq	0x20(%rbp), %rcx
1454d34aa:     	movl	$0x91, %edx
1454d34af:     	movzwl	0x36(%rax), %r9d
1454d34b4:     	movl	%r9d, %r10d
1454d34b7:     	addl	%r10d, %r10d
1454d34ba:     	movq	$-0x1, %r8
1454d34c1:     	nopw	%cs:(%rax,%rax)
1454d34d0:     	testq	%r10, %r10
1454d34d3:     	je	0x1454d3500 <.text+0x54d2500>
1454d34d5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454d34db:     	cmpl	%r11d, %edx
1454d34de:     	seta	%r11b
1454d34e2:     	sbbb	$0x0, %r11b
1454d34e6:     	incq	%r8
1454d34e9:     	addq	$-0x2, %r10
1454d34ed:     	cmpb	$0x1, %r11b
1454d34f1:     	je	0x1454d34d0 <.text+0x54d24d0>
1454d34f3:     	movzbl	%r11b, %r9d
1454d34f7:     	testl	%r9d, %r9d
1454d34fa:     	je	0x1454d3510 <.text+0x54d2510>
1454d34fc:     	jmp	0x1454d3503 <.text+0x54d2503>
1454d34fe:     	nop
1454d3500:     	movq	%r9, %r8
1454d3503:     	subq	$0x1, %rcx
1454d3507:     	jb	0x1454d351d <.text+0x54d251d>
1454d3509:     	movq	0x50(%rax,%r8,8), %rax
1454d350e:     	jmp	0x1454d34af <.text+0x54d24af>
1454d3510:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454d3519:     	jmp	0x1454d354d <.text+0x54d254d>
1454d351b:     	xorl	%eax, %eax
1454d351d:     	movq	%rbx, 0x30(%rbp)
1454d3521:     	movq	%rax, 0x38(%rbp)
1454d3525:     	movq	$0x0, 0x40(%rbp)
1454d352d:     	movq	%r8, 0x48(%rbp)
1454d3531:     	movq	$0x91, 0x50(%rbp)
1454d3539:     	leaq	-0x8(%rbp), %rcx
1454d353d:     	leaq	0x30(%rbp), %rdx
1454d3541:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454d3547:     	callq	0x14552a730 <.text+0x5529730>
1454d354c:     	nop
1454d354d:     	movq	0x3e8(%rsi), %r8
1454d3554:     	leaq	0x18(%rbp), %rbx
1454d3558:     	movq	%rbx, %rcx
1454d355b:     	movw	$0x10, %dx
1454d355f:     	callq	0x145513710 <.text+0x5512710>
1454d3564:     	nop
1454d3565:     	movq	0xf8(%rbp), %r14
1454d356c:     	movss	0x400(%rsi), %xmm1
1454d3574:     	movss	0x404(%rsi), %xmm0
1454d357c:     	subss	0x4(%r14), %xmm0
1454d3582:     	subss	(%r14), %xmm1
1454d3587:     	callq	0x14577324d <.text+0x577224d>
1454d358c:     	movl	$0x0, -0x10(%rbp)
1454d3593:     	movq	$0x0, -0x28(%rbp)
1454d359b:     	movq	$0x1, -0x20(%rbp)
1454d35a3:     	movq	$0x0, -0x18(%rbp)
1454d35ab:     	movups	0x1523456(%rip), %xmm1  # 0x1469f6a08
1454d35b2:     	movaps	%xmm1, -0x40(%rbp)
1454d35b6:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
1454d35c0:     	movq	%rax, -0x30(%rbp)
1454d35c4:     	movl	$0x40e00000, -0x3c(%rbp) # imm = 0x40E00000
1454d35cb:     	movb	$0x1, 0x67(%rbp)
1454d35cf:     	movq	%rbx, 0x38(%rsp)
1454d35d4:     	leaq	-0x40(%rbp), %rax
1454d35d8:     	movq	%rax, 0x30(%rsp)
1454d35dd:     	movss	%xmm0, 0x28(%rsp)
1454d35e3:     	movq	%r14, 0x20(%rsp)
1454d35e8:     	leaq	-0x28(%rbp), %rcx
1454d35ec:     	movq	%rdi, %rdx
1454d35ef:     	movb	$0x3, %r8b
1454d35f2:     	xorl	%r9d, %r9d
1454d35f5:     	callq	0x145512720 <.text+0x5511720>
1454d35fa:     	nop
1454d35fb:     	movups	-0x28(%rbp), %xmm0
1454d35ff:     	movups	-0x18(%rbp), %xmm1
1454d3603:     	movaps	%xmm1, 0x40(%rbp)
1454d3607:     	movaps	%xmm0, 0x30(%rbp)
1454d360b:     	movb	$0x0, 0x67(%rbp)
1454d360f:     	leaq	-0x8(%rbp), %rcx
1454d3613:     	leaq	0x30(%rbp), %rdx
1454d3617:     	callq	0x145512ef0 <.text+0x5511ef0>
1454d361c:     	nop
1454d361d:     	movq	0x560(%rsi), %rdi
1454d3624:     	cmpq	0x550(%rsi), %rdi
1454d362b:     	jne	0x1454d363a <.text+0x54d263a>
1454d362d:     	leaq	0x550(%rsi), %rcx
1454d3634:     	callq	0x145774710 <.text+0x5773710>
1454d3639:     	nop
1454d363a:     	movq	0x558(%rsi), %rax
1454d3641:     	movq	%rdi, %rcx
1454d3644:     	shlq	$0x5, %rcx
1454d3648:     	movups	-0x8(%rbp), %xmm0
1454d364c:     	movups	0x8(%rbp), %xmm1
1454d3650:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d3655:     	movups	%xmm0, (%rax,%rcx)
1454d3659:     	incq	%rdi
1454d365c:     	movq	%rdi, 0x560(%rsi)
1454d3663:     	leaq	0x18(%rbp), %rcx
1454d3667:     	callq	0x14550cd20 <.text+0x550bd20>
1454d366c:     	movaps	0x70(%rbp), %xmm6
1454d3670:     	addq	$0x100, %rsp            # imm = 0x100
1454d3677:     	popq	%rbx
1454d3678:     	popq	%rdi
1454d3679:     	popq	%rsi
1454d367a:     	popq	%r12
1454d367c:     	popq	%r14
1454d367e:     	popq	%r15
1454d3680:     	popq	%rbp
1454d3681:     	retq
