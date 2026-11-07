
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e2c50:     	pushq	%rbp
1458e2c51:     	pushq	%r15
1458e2c53:     	pushq	%r14
1458e2c55:     	pushq	%r13
1458e2c57:     	pushq	%r12
1458e2c59:     	pushq	%rsi
1458e2c5a:     	pushq	%rdi
1458e2c5b:     	pushq	%rbx
1458e2c5c:     	subq	$0x138, %rsp            # imm = 0x138
1458e2c63:     	leaq	0x80(%rsp), %rbp
1458e2c6b:     	movq	$-0x2, 0xb0(%rbp)
1458e2c76:     	movl	%r9d, 0x7c(%rbp)
1458e2c7a:     	movq	%rcx, %rsi
1458e2c7d:     	movb	%r8b, 0xae(%rbp)
1458e2c84:     	cmpb	$0xb, %r8b
1458e2c88:     	ja	0x1458e338a <.text+0x58e238a>
1458e2c8e:     	movzbl	%r8b, %eax
1458e2c92:     	movl	$0xbbe, %ecx            # imm = 0xBBE
1458e2c97:     	btl	%eax, %ecx
1458e2c9a:     	jae	0x1458e338a <.text+0x58e238a>
1458e2ca0:     	movq	0x8(%rdx), %rcx
1458e2ca4:     	movq	%rdx, 0x38(%rbp)
1458e2ca8:     	movq	0x10(%rdx), %rax
1458e2cac:     	shlq	$0x4, %rax
1458e2cb0:     	addq	%rcx, %rax
1458e2cb3:     	movq	%rcx, 0x40(%rbp)
1458e2cb7:     	movq	%rcx, -0x10(%rbp)
1458e2cbb:     	movq	%rax, -0x8(%rbp)
1458e2cbf:     	leaq	0xae(%rbp), %rax
1458e2cc6:     	movq	%rax, (%rbp)
1458e2cca:     	leaq	-0x58(%rbp), %rcx
1458e2cce:     	leaq	-0x10(%rbp), %rdx
1458e2cd2:     	callq	0x14599f9f0 <.text+0x599e9f0>
1458e2cd7:     	nop
1458e2cd8:     	movq	-0x50(%rbp), %rax
1458e2cdc:     	movq	%rax, 0x88(%rbp)
1458e2ce3:     	movq	-0x48(%rbp), %rbx
1458e2ce7:     	leaq	0x97(%rbp), %rax
1458e2cee:     	movq	%rax, -0x10(%rbp)
1458e2cf2:     	cmpq	$0x2, %rbx
1458e2cf6:     	jae	0x1458e33bc <.text+0x58e23bc>
1458e2cfc:     	movq	%rsi, -0x18(%rbp)
1458e2d00:     	movq	$0x0, 0x60(%rbp)
1458e2d08:     	movq	$0x8, 0x68(%rbp)
1458e2d10:     	movq	$0x0, 0x70(%rbp)
1458e2d18:     	movq	-0x58(%rbp), %rax
1458e2d1c:     	movq	%rax, 0x50(%rbp)
1458e2d20:     	testq	%rbx, %rbx
1458e2d23:     	je	0x1458e331e <.text+0x58e231e>
1458e2d29:     	leaq	(%rbx,%rbx,2), %rax
1458e2d2d:     	movq	0x88(%rbp), %rcx
1458e2d34:     	leaq	(%rcx,%rax,8), %rax
1458e2d38:     	movq	%rax, -0x20(%rbp)
1458e2d3c:     	movl	$0x5df, %r12d           # imm = 0x5DF
1458e2d42:     	jmp	0x1458e2d62 <.text+0x58e1d62>
1458e2d44:     	nopw	%cs:(%rax,%rax)
1458e2d50:     	movq	-0x28(%rbp), %rcx
1458e2d54:     	addq	$0x18, %rcx
1458e2d58:     	cmpq	-0x20(%rbp), %rcx
1458e2d5c:     	je	0x1458e331e <.text+0x58e231e>
1458e2d62:     	movq	(%rcx), %rax
1458e2d65:     	movq	%rax, -0x38(%rbp)
1458e2d69:     	testq	%rax, %rax
1458e2d6c:     	je	0x1458e331e <.text+0x58e231e>
1458e2d72:     	movq	%rcx, -0x28(%rbp)
1458e2d76:     	movzbl	0x10(%rcx), %eax
1458e2d7a:     	movb	%al, 0xac(%rbp)
1458e2d80:     	testb	%al, %al
1458e2d82:     	je	0x1458e2d50 <.text+0x58e1d50>
1458e2d84:     	xorl	%eax, %eax
1458e2d86:     	jmp	0x1458e2dad <.text+0x58e1dad>
1458e2d88:     	movq	%rsi, (%r15,%r14)
1458e2d8c:     	movb	$0x1, 0x8(%r15,%r14)
1458e2d92:     	incq	%rbx
1458e2d95:     	movq	%rbx, 0x70(%rbp)
1458e2d99:     	nopl	(%rax)
1458e2da0:     	movl	0x4c(%rbp), %eax
1458e2da3:     	incb	%al
1458e2da5:     	cmpb	0xac(%rbp), %al
1458e2dab:     	je	0x1458e2d50 <.text+0x58e1d50>
1458e2dad:     	movl	%eax, 0x4c(%rbp)
1458e2db0:     	movzbl	0xae(%rbp), %eax
1458e2db7:     	movq	%rax, 0x20(%rbp)
1458e2dbb:     	decl	%eax
1458e2dbd:     	movl	%eax, 0x98(%rbp)
1458e2dc3:     	cmpb	$0xa, %al
1458e2dc5:     	ja	0x1458e2da0 <.text+0x58e1da0>
1458e2dc7:     	movzbl	0x98(%rbp), %ecx
1458e2dce:     	btl	%ecx, %r12d
1458e2dd2:     	jae	0x1458e2da0 <.text+0x58e1da0>
1458e2dd4:     	movq	-0x38(%rbp), %rax
1458e2dd8:     	movq	0x20(%rax), %rbx
1458e2ddc:     	movq	0x28(%rax), %r13
1458e2de0:     	leaq	0x15951d9(%rip), %rax   # 0x146e77fc0
1458e2de7:     	movq	%rcx, 0xa0(%rbp)
1458e2dee:     	movq	(%rax,%rcx,8), %rsi
1458e2df2:     	movq	0x38(%rsi), %rax
1458e2df6:     	testq	%rax, %rax
1458e2df9:     	je	0x1458e2e41 <.text+0x58e1e41>
1458e2dfb:     	movq	0x30(%rsi), %r15
1458e2dff:     	imulq	$0x78, %rax, %rdi
1458e2e03:     	jmp	0x1458e2e1a <.text+0x58e1e1a>
1458e2e05:     	nopw	%cs:(%rax,%rax)
1458e2e10:     	addq	$0x78, %r15
1458e2e14:     	addq	$-0x78, %rdi
1458e2e18:     	je	0x1458e2e41 <.text+0x58e1e41>
1458e2e1a:     	cmpq	%r13, 0x28(%r15)
1458e2e1e:     	jne	0x1458e2e10 <.text+0x58e1e10>
1458e2e20:     	movq	0x20(%r15), %rcx
1458e2e24:     	movq	%rbx, %rdx
1458e2e27:     	movq	%r13, %r8
1458e2e2a:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2e2f:     	testl	%eax, %eax
1458e2e31:     	jne	0x1458e2e10 <.text+0x58e1e10>
1458e2e33:     	xorl	%esi, %esi
1458e2e35:     	movq	0xa0(%rbp), %rdi
1458e2e3c:     	jmp	0x1458e2eec <.text+0x58e1eec>
1458e2e41:     	movq	0x78(%rsi), %rax
1458e2e45:     	testq	%rax, %rax
1458e2e48:     	je	0x1458e2e91 <.text+0x58e1e91>
1458e2e4a:     	movq	0x70(%rsi), %r15
1458e2e4e:     	imulq	$0x78, %rax, %rdi
1458e2e52:     	jmp	0x1458e2e6a <.text+0x58e1e6a>
1458e2e54:     	nopw	%cs:(%rax,%rax)
1458e2e60:     	addq	$0x78, %r15
1458e2e64:     	addq	$-0x78, %rdi
1458e2e68:     	je	0x1458e2e91 <.text+0x58e1e91>
1458e2e6a:     	cmpq	%r13, 0x28(%r15)
1458e2e6e:     	jne	0x1458e2e60 <.text+0x58e1e60>
1458e2e70:     	movq	0x20(%r15), %rcx
1458e2e74:     	movq	%rbx, %rdx
1458e2e77:     	movq	%r13, %r8
1458e2e7a:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2e7f:     	testl	%eax, %eax
1458e2e81:     	jne	0x1458e2e60 <.text+0x58e1e60>
1458e2e83:     	movl	$0x1, %esi
1458e2e88:     	movq	0xa0(%rbp), %rdi
1458e2e8f:     	jmp	0x1458e2eec <.text+0x58e1eec>
1458e2e91:     	movq	0xb8(%rsi), %rax
1458e2e98:     	testq	%rax, %rax
1458e2e9b:     	movq	0xa0(%rbp), %rdi
1458e2ea2:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e2ea8:     	movq	0xb0(%rsi), %r15
1458e2eaf:     	imulq	$0x78, %rax, %rsi
1458e2eb3:     	jmp	0x1458e2ece <.text+0x58e1ece>
1458e2eb5:     	nopw	%cs:(%rax,%rax)
1458e2ec0:     	addq	$0x78, %r15
1458e2ec4:     	addq	$-0x78, %rsi
1458e2ec8:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e2ece:     	cmpq	%r13, 0x28(%r15)
1458e2ed2:     	jne	0x1458e2ec0 <.text+0x58e1ec0>
1458e2ed4:     	movq	0x20(%r15), %rcx
1458e2ed8:     	movq	%rbx, %rdx
1458e2edb:     	movq	%r13, %r8
1458e2ede:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2ee3:     	testl	%eax, %eax
1458e2ee5:     	jne	0x1458e2ec0 <.text+0x58e1ec0>
1458e2ee7:     	movl	$0x2, %esi
1458e2eec:     	movq	0x68(%rbp), %rax
1458e2ef0:     	movq	%rax, 0x80(%rbp)
1458e2ef7:     	movq	0x70(%rbp), %r8
1458e2efb:     	testq	%r8, %r8
1458e2efe:     	movq	%r8, 0x58(%rbp)
1458e2f02:     	je	0x1458e2f16 <.text+0x58e1f16>
1458e2f04:     	movl	%r8d, %eax
1458e2f07:     	andl	$0x3, %eax
1458e2f0a:     	cmpq	$0x4, %r8
1458e2f0e:     	jae	0x1458e2f31 <.text+0x58e1f31>
1458e2f10:     	xorl	%edx, %edx
1458e2f12:     	xorl	%ecx, %ecx
1458e2f14:     	jmp	0x1458e2f81 <.text+0x58e1f81>
1458e2f16:     	cmpl	$0x0, 0x7c(%rbp)
1458e2f1a:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e2f20:     	xorl	%eax, %eax
1458e2f22:     	cmpb	0x72(%r15), %al
1458e2f26:     	jae	0x1458e2da0 <.text+0x58e1da0>
1458e2f2c:     	jmp	0x1458e3021 <.text+0x58e2021>
1458e2f31:     	andq	$-0x4, %r8
1458e2f35:     	movq	0x80(%rbp), %rcx
1458e2f3c:     	leaq	0x38(%rcx), %r9
1458e2f40:     	xorl	%edx, %edx
1458e2f42:     	xorl	%ecx, %ecx
1458e2f44:     	nopw	%cs:(%rax,%rax)
1458e2f50:     	movzbl	-0x30(%r9), %r10d
1458e2f55:     	addl	%ecx, %r10d
1458e2f58:     	movzbl	-0x20(%r9), %ecx
1458e2f5d:     	movzbl	-0x10(%r9), %r11d
1458e2f62:     	addl	%ecx, %r11d
1458e2f65:     	addl	%r10d, %r11d
1458e2f68:     	movzbl	(%r9), %ecx
1458e2f6c:     	addl	%r11d, %ecx
1458e2f6f:     	addq	$0x4, %rdx
1458e2f73:     	addq	$0x40, %r9
1458e2f77:     	cmpq	%rdx, %r8
1458e2f7a:     	jne	0x1458e2f50 <.text+0x58e1f50>
1458e2f7c:     	testq	%rax, %rax
1458e2f7f:     	je	0x1458e2fb1 <.text+0x58e1fb1>
1458e2f81:     	shlq	$0x4, %rdx
1458e2f85:     	movq	0x80(%rbp), %r8
1458e2f8c:     	addq	%r8, %rdx
1458e2f8f:     	addq	$0x8, %rdx
1458e2f93:     	shll	$0x4, %eax
1458e2f96:     	xorl	%r8d, %r8d
1458e2f99:     	nopl	(%rax)
1458e2fa0:     	movzbl	(%rdx,%r8), %r9d
1458e2fa5:     	addl	%r9d, %ecx
1458e2fa8:     	addq	$0x10, %r8
1458e2fac:     	cmpq	%r8, %rax
1458e2faf:     	jne	0x1458e2fa0 <.text+0x58e1fa0>
1458e2fb1:     	cmpl	0x7c(%rbp), %ecx
1458e2fb4:     	jae	0x1458e2da0 <.text+0x58e1da0>
1458e2fba:     	movq	%rsi, %r14
1458e2fbd:     	movq	0x58(%rbp), %rsi
1458e2fc1:     	shlq	$0x4, %rsi
1458e2fc5:     	xorl	%edi, %edi
1458e2fc7:     	jmp	0x1458e2fd9 <.text+0x58e1fd9>
1458e2fc9:     	nopl	(%rax)
1458e2fd0:     	addq	$0x10, %rdi
1458e2fd4:     	cmpq	%rdi, %rsi
1458e2fd7:     	je	0x1458e300b <.text+0x58e200b>
1458e2fd9:     	movq	0x80(%rbp), %rax
1458e2fe0:     	movq	(%rax,%rdi), %rax
1458e2fe4:     	cmpq	%r13, 0x28(%rax)
1458e2fe8:     	jne	0x1458e2fd0 <.text+0x58e1fd0>
1458e2fea:     	movq	0x20(%rax), %rcx
1458e2fee:     	movq	%rbx, %rdx
1458e2ff1:     	movq	%r13, %r8
1458e2ff4:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2ff9:     	testl	%eax, %eax
1458e2ffb:     	jne	0x1458e2fd0 <.text+0x58e1fd0>
1458e2ffd:     	movq	0x80(%rbp), %rax
1458e3004:     	movzbl	0x8(%rax,%rdi), %eax
1458e3009:     	jmp	0x1458e300d <.text+0x58e200d>
1458e300b:     	xorl	%eax, %eax
1458e300d:     	movq	0xa0(%rbp), %rdi
1458e3014:     	movq	%r14, %rsi
1458e3017:     	cmpb	0x72(%r15), %al
1458e301b:     	jae	0x1458e2da0 <.text+0x58e1da0>
1458e3021:     	movq	%rbx, 0x30(%rbp)
1458e3025:     	movzbl	0x70(%r15), %r9d
1458e302a:     	movl	$0x0, 0x9c(%rbp)
1458e3034:     	movl	0x98(%rbp), %ecx
1458e303a:     	cmpb	$0xa, %cl
1458e303d:     	ja	0x1458e305d <.text+0x58e205d>
1458e303f:     	movq	0x58(%rbp), %r8
1458e3043:     	testq	%r8, %r8
1458e3046:     	sete	%al
1458e3049:     	movl	$0x5df, %edx            # imm = 0x5DF
1458e304e:     	shrl	%cl, %edx
1458e3050:     	notb	%dl
1458e3052:     	orb	%al, %dl
1458e3054:     	testb	$0x1, %dl
1458e3057:     	je	0x1458e314c <.text+0x58e214c>
1458e305d:     	movzbl	%r9b, %eax
1458e3061:     	leal	(%rax,%rax,4), %eax
1458e3064:     	cmpl	%eax, 0x9c(%rbp)
1458e306a:     	movq	0x30(%rbp), %r14
1458e306e:     	jb	0x1458e2da0 <.text+0x58e1da0>
1458e3074:     	leaq	0x60(%rbp), %rcx
1458e3078:     	movq	0x20(%rbp), %rdx
1458e307c:     	movq	%r14, %r8
1458e307f:     	movq	%r13, %r9
1458e3082:     	callq	0x1458e2070 <.text+0x58e1070>
1458e3087:     	testq	%rax, %rax
1458e308a:     	jne	0x1458e2da0 <.text+0x58e1da0>
1458e3090:     	movq	0x20(%rbp), %rax
1458e3094:     	movb	%al, 0xab(%rbp)
1458e309a:     	movq	(%r15), %rax
1458e309d:     	testq	%rax, %rax
1458e30a0:     	je	0x1458e30e4 <.text+0x58e20e4>
1458e30a2:     	movq	0x8(%r15), %rcx
1458e30a6:     	movups	0x10(%r15), %xmm0
1458e30ab:     	movq	$0x1, -0x10(%rbp)
1458e30b3:     	movq	%rax, -0x8(%rbp)
1458e30b7:     	movq	%rcx, (%rbp)
1458e30bb:     	movq	$0x1, 0x8(%rbp)
1458e30c3:     	movups	%xmm0, 0x10(%rbp)
1458e30c7:     	leaq	-0x10(%rbp), %rcx
1458e30cb:     	leaq	0xab(%rbp), %rdx
1458e30d2:     	leaq	0x60(%rbp), %r8
1458e30d6:     	callq	0x1458b9220 <.text+0x58b8220>
1458e30db:     	nop
1458e30dc:     	testb	%al, %al
1458e30de:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e30e4:     	cmpb	$0xa, 0x98(%rbp)
1458e30eb:     	ja	0x1458e2da0 <.text+0x58e1da0>
1458e30f1:     	btl	%edi, %r12d
1458e30f5:     	jae	0x1458e2da0 <.text+0x58e1da0>
1458e30fb:     	leaq	0x1594ebe(%rip), %rax   # 0x146e77fc0
1458e3102:     	movq	(%rax,%rdi,8), %rbx
1458e3106:     	movq	0x38(%rbx), %rax
1458e310a:     	testq	%rax, %rax
1458e310d:     	je	0x1458e3228 <.text+0x58e2228>
1458e3113:     	movq	0x30(%rbx), %rsi
1458e3117:     	imulq	$0x78, %rax, %rdi
1458e311b:     	jmp	0x1458e312e <.text+0x58e212e>
1458e311d:     	nopl	(%rax)
1458e3120:     	addq	$0x78, %rsi
1458e3124:     	addq	$-0x78, %rdi
1458e3128:     	je	0x1458e3228 <.text+0x58e2228>
1458e312e:     	cmpq	%r13, 0x28(%rsi)
1458e3132:     	jne	0x1458e3120 <.text+0x58e2120>
1458e3134:     	movq	0x20(%rsi), %rcx
1458e3138:     	movq	%r14, %rdx
1458e313b:     	movq	%r13, %r8
1458e313e:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e3143:     	testl	%eax, %eax
1458e3145:     	jne	0x1458e3120 <.text+0x58e2120>
1458e3147:     	jmp	0x1458e32b7 <.text+0x58e22b7>
1458e314c:     	shll	$0x6, %esi
1458e314f:     	leaq	0x1594e6a(%rip), %rax   # 0x146e77fc0
1458e3156:     	addq	(%rax,%rdi,8), %rsi
1458e315a:     	xorl	%r14d, %r14d
1458e315d:     	movl	$0x0, 0x9c(%rbp)
1458e3167:     	movq	%rsi, 0x28(%rbp)
1458e316b:     	movb	%r9b, 0xaf(%rbp)
1458e3172:     	jmp	0x1458e31a9 <.text+0x58e21a9>
1458e3174:     	nopw	%cs:(%rax,%rax)
1458e3180:     	movl	$0x5df, %r12d           # imm = 0x5DF
1458e3186:     	movq	0xa0(%rbp), %rdi
1458e318d:     	movq	0x28(%rbp), %rsi
1458e3191:     	movq	0x58(%rbp), %r8
1458e3195:     	movzbl	0xaf(%rbp), %r9d
1458e319d:     	incq	%r14
1458e31a0:     	cmpq	%r8, %r14
1458e31a3:     	je	0x1458e305d <.text+0x58e205d>
1458e31a9:     	movq	%r14, %rdx
1458e31ac:     	shlq	$0x4, %rdx
1458e31b0:     	movq	0x80(%rbp), %rax
1458e31b7:     	movq	(%rax,%rdx), %rax
1458e31bb:     	cmpb	%r9b, 0x70(%rax)
1458e31bf:     	jae	0x1458e319d <.text+0x58e219d>
1458e31c1:     	movq	0x38(%rsi), %rcx
1458e31c5:     	testq	%rcx, %rcx
1458e31c8:     	je	0x1458e319d <.text+0x58e219d>
1458e31ca:     	addq	0x80(%rbp), %rdx
1458e31d1:     	movq	%rdx, -0x30(%rbp)
1458e31d5:     	movq	0x30(%rsi), %rdi
1458e31d9:     	imulq	$0x78, %rcx, %r12
1458e31dd:     	movq	0x20(%rax), %rcx
1458e31e1:     	movq	%rcx, -0x40(%rbp)
1458e31e5:     	movq	0x28(%rax), %rsi
1458e31e9:     	xorl	%ebx, %ebx
1458e31eb:     	jmp	0x1458e31f9 <.text+0x58e21f9>
1458e31ed:     	nopl	(%rax)
1458e31f0:     	addq	$0x78, %rbx
1458e31f4:     	cmpq	%rbx, %r12
1458e31f7:     	je	0x1458e3180 <.text+0x58e2180>
1458e31f9:     	cmpq	%rsi, 0x28(%rdi,%rbx)
1458e31fe:     	jne	0x1458e31f0 <.text+0x58e21f0>
1458e3200:     	movq	0x20(%rdi,%rbx), %rcx
1458e3205:     	movq	-0x40(%rbp), %rdx
1458e3209:     	movq	%rsi, %r8
1458e320c:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e3211:     	testl	%eax, %eax
1458e3213:     	jne	0x1458e31f0 <.text+0x58e21f0>
1458e3215:     	movq	-0x30(%rbp), %rax
1458e3219:     	movzbl	0x8(%rax), %eax
1458e321d:     	addl	%eax, 0x9c(%rbp)
1458e3223:     	jmp	0x1458e3180 <.text+0x58e2180>
1458e3228:     	movq	0x78(%rbx), %rax
1458e322c:     	testq	%rax, %rax
1458e322f:     	je	0x1458e3265 <.text+0x58e2265>
1458e3231:     	movq	0x70(%rbx), %rsi
1458e3235:     	imulq	$0x78, %rax, %rdi
1458e3239:     	jmp	0x1458e324a <.text+0x58e224a>
1458e323b:     	nopl	(%rax,%rax)
1458e3240:     	addq	$0x78, %rsi
1458e3244:     	addq	$-0x78, %rdi
1458e3248:     	je	0x1458e3265 <.text+0x58e2265>
1458e324a:     	cmpq	%r13, 0x28(%rsi)
1458e324e:     	jne	0x1458e3240 <.text+0x58e2240>
1458e3250:     	movq	0x20(%rsi), %rcx
1458e3254:     	movq	%r14, %rdx
1458e3257:     	movq	%r13, %r8
1458e325a:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e325f:     	testl	%eax, %eax
1458e3261:     	jne	0x1458e3240 <.text+0x58e2240>
1458e3263:     	jmp	0x1458e32b7 <.text+0x58e22b7>
1458e3265:     	movq	0xb8(%rbx), %rax
1458e326c:     	testq	%rax, %rax
1458e326f:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e3275:     	movq	0xb0(%rbx), %rsi
1458e327c:     	imulq	$0x78, %rax, %rdi
1458e3280:     	jmp	0x1458e329e <.text+0x58e229e>
1458e3282:     	nopw	%cs:(%rax,%rax)
1458e3290:     	addq	$0x78, %rsi
1458e3294:     	addq	$-0x78, %rdi
1458e3298:     	je	0x1458e2da0 <.text+0x58e1da0>
1458e329e:     	cmpq	%r13, 0x28(%rsi)
1458e32a2:     	jne	0x1458e3290 <.text+0x58e2290>
1458e32a4:     	movq	0x20(%rsi), %rcx
1458e32a8:     	movq	%r14, %rdx
1458e32ab:     	movq	%r13, %r8
1458e32ae:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e32b3:     	testl	%eax, %eax
1458e32b5:     	jne	0x1458e3290 <.text+0x58e2290>
1458e32b7:     	movq	0x68(%rbp), %r15
1458e32bb:     	movq	0x70(%rbp), %rbx
1458e32bf:     	movq	%rbx, %r14
1458e32c2:     	shlq	$0x4, %r14
1458e32c6:     	testq	%rbx, %rbx
1458e32c9:     	je	0x1458e3301 <.text+0x58e2301>
1458e32cb:     	xorl	%edi, %edi
1458e32cd:     	jmp	0x1458e32d9 <.text+0x58e22d9>
1458e32cf:     	nop
1458e32d0:     	addq	$0x10, %rdi
1458e32d4:     	cmpq	%rdi, %r14
1458e32d7:     	je	0x1458e3301 <.text+0x58e2301>
1458e32d9:     	movq	(%r15,%rdi), %rax
1458e32dd:     	cmpq	%r13, 0x28(%rax)
1458e32e1:     	jne	0x1458e32d0 <.text+0x58e22d0>
1458e32e3:     	movq	0x20(%rax), %rcx
1458e32e7:     	movq	0x30(%rbp), %rdx
1458e32eb:     	movq	%r13, %r8
1458e32ee:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e32f3:     	testl	%eax, %eax
1458e32f5:     	jne	0x1458e32d0 <.text+0x58e22d0>
1458e32f7:     	incb	0x8(%r15,%rdi)
1458e32fc:     	jmp	0x1458e2da0 <.text+0x58e1da0>
1458e3301:     	cmpq	0x60(%rbp), %rbx
1458e3305:     	jne	0x1458e2d88 <.text+0x58e1d88>
1458e330b:     	leaq	0x60(%rbp), %rcx
1458e330f:     	callq	0x145bcb680 <.text+0x5bca680>
1458e3314:     	nop
1458e3315:     	movq	0x68(%rbp), %r15
1458e3319:     	jmp	0x1458e2d88 <.text+0x58e1d88>
1458e331e:     	movq	0x50(%rbp), %rax
1458e3322:     	testq	%rax, %rax
1458e3325:     	je	0x1458e3341 <.text+0x58e2341>
1458e3327:     	shlq	$0x3, %rax
1458e332b:     	leaq	(%rax,%rax,2), %rdx
1458e332f:     	movl	$0x8, %r8d
1458e3335:     	movq	0x88(%rbp), %rcx
1458e333c:     	callq	0x1400021d0 <.text+0x11d0>
1458e3341:     	movq	0x70(%rbp), %rax
1458e3345:     	movq	-0x18(%rbp), %rsi
1458e3349:     	movq	%rax, 0x10(%rsi)
1458e334d:     	movups	0x60(%rbp), %xmm0
1458e3351:     	movups	%xmm0, (%rsi)
1458e3354:     	movq	0x38(%rbp), %rax
1458e3358:     	movq	(%rax), %rdx
1458e335b:     	testq	%rdx, %rdx
1458e335e:     	je	0x1458e3373 <.text+0x58e2373>
1458e3360:     	shlq	$0x4, %rdx
1458e3364:     	movl	$0x8, %r8d
1458e336a:     	movq	0x40(%rbp), %rcx
1458e336e:     	callq	0x1400021d0 <.text+0x11d0>
1458e3373:     	movq	%rsi, %rax
1458e3376:     	addq	$0x138, %rsp            # imm = 0x138
1458e337d:     	popq	%rbx
1458e337e:     	popq	%rdi
1458e337f:     	popq	%rsi
1458e3380:     	popq	%r12
1458e3382:     	popq	%r13
1458e3384:     	popq	%r14
1458e3386:     	popq	%r15
1458e3388:     	popq	%rbp
1458e3389:     	retq
1458e338a:     	movq	$0x0, (%rsi)
1458e3391:     	movq	$0x8, 0x8(%rsi)
1458e3399:     	movq	$0x0, 0x10(%rsi)
1458e33a1:     	movq	%rdx, %rax
1458e33a4:     	movq	(%rdx), %rdx
1458e33a7:     	testq	%rdx, %rdx
1458e33aa:     	je	0x1458e3373 <.text+0x58e2373>
1458e33ac:     	movq	0x8(%rax), %rcx
1458e33b0:     	shlq	$0x4, %rdx
1458e33b4:     	movl	$0x8, %r8d
1458e33ba:     	jmp	0x1458e336e <.text+0x58e236e>
1458e33bc:     	cmpq	$0x15, %rbx
1458e33c0:     	jae	0x1458e33e0 <.text+0x58e23e0>
1458e33c2:     	leaq	-0x10(%rbp), %r9
1458e33c6:     	movl	$0x1, %r8d
1458e33cc:     	movq	0x88(%rbp), %rcx
1458e33d3:     	movq	%rbx, %rdx
1458e33d6:     	callq	0x1459822f0 <.text+0x59812f0>
1458e33db:     	jmp	0x1458e2cfc <.text+0x58e1cfc>
1458e33e0:     	movb	$0x1, 0xad(%rbp)
1458e33e7:     	leaq	-0x10(%rbp), %r8
1458e33eb:     	movq	0x88(%rbp), %rcx
1458e33f2:     	movq	%rbx, %rdx
1458e33f5:     	callq	0x145988a30 <.text+0x5987a30>
1458e33fa:     	nop
1458e33fb:     	jmp	0x1458e2cfc <.text+0x58e1cfc>
