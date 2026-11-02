
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c1b30:     	pushq	%rbp
1400c1b31:     	pushq	%r15
1400c1b33:     	pushq	%r14
1400c1b35:     	pushq	%r13
1400c1b37:     	pushq	%r12
1400c1b39:     	pushq	%rsi
1400c1b3a:     	pushq	%rdi
1400c1b3b:     	pushq	%rbx
1400c1b3c:     	subq	$0x6a8, %rsp            # imm = 0x6A8
1400c1b43:     	leaq	0x80(%rsp), %rbp
1400c1b4b:     	movaps	%xmm15, 0x610(%rbp)
1400c1b53:     	movaps	%xmm14, 0x600(%rbp)
1400c1b5b:     	movaps	%xmm13, 0x5f0(%rbp)
1400c1b63:     	movaps	%xmm12, 0x5e0(%rbp)
1400c1b6b:     	movaps	%xmm11, 0x5d0(%rbp)
1400c1b73:     	movaps	%xmm10, 0x5c0(%rbp)
1400c1b7b:     	movaps	%xmm9, 0x5b0(%rbp)
1400c1b83:     	movaps	%xmm8, 0x5a0(%rbp)
1400c1b8b:     	movaps	%xmm7, 0x590(%rbp)
1400c1b92:     	movaps	%xmm6, 0x580(%rbp)
1400c1b99:     	movq	$-0x2, 0x578(%rbp)
1400c1ba4:     	movq	0x6a8(%rbp), %r12
1400c1bab:     	movq	0x6c0(%rbp), %rax
1400c1bb2:     	movq	0x6b8(%rbp), %rcx
1400c1bb9:     	movq	0x6b0(%rbp), %r10
1400c1bc0:     	movq	0x6a0(%rbp), %r11
1400c1bc7:     	movq	0x698(%rbp), %rsi
1400c1bce:     	movq	0x690(%rbp), %rdi
1400c1bd5:     	movq	0x20(%rdx), %rbx
1400c1bd9:     	movq	%rbx, -0x20(%rbp)
1400c1bdd:     	movups	(%rdx), %xmm0
1400c1be0:     	movups	0x10(%rdx), %xmm1
1400c1be4:     	movaps	%xmm1, -0x30(%rbp)
1400c1be8:     	movaps	%xmm0, -0x40(%rbp)
1400c1bec:     	movups	(%r8), %xmm0
1400c1bf0:     	movups	0x10(%r8), %xmm1
1400c1bf5:     	movups	%xmm1, -0x8(%rbp)
1400c1bf9:     	movups	%xmm0, -0x18(%rbp)
1400c1bfd:     	movq	0x10(%r9), %rdx
1400c1c01:     	movq	%rdx, 0x18(%rbp)
1400c1c05:     	movups	(%r9), %xmm0
1400c1c09:     	movups	%xmm0, 0x8(%rbp)
1400c1c0d:     	movups	(%rdi), %xmm0
1400c1c10:     	movups	0x10(%rdi), %xmm1
1400c1c14:     	movups	%xmm1, 0xb8(%rbp)
1400c1c1b:     	movups	%xmm0, 0xa8(%rbp)
1400c1c22:     	movups	(%rsi), %xmm0
1400c1c25:     	movups	0x10(%rsi), %xmm1
1400c1c29:     	movaps	%xmm0, 0x20(%rbp)
1400c1c2d:     	movaps	%xmm1, 0x30(%rbp)
1400c1c31:     	movups	(%r11), %xmm0
1400c1c35:     	movups	0x10(%r11), %xmm1
1400c1c3a:     	movaps	%xmm0, 0x40(%rbp)
1400c1c3e:     	movaps	%xmm1, 0x50(%rbp)
1400c1c42:     	movq	%r12, 0x60(%rbp)
1400c1c46:     	movups	(%r10), %xmm0
1400c1c4a:     	movups	0x10(%r10), %xmm1
1400c1c4f:     	movups	%xmm1, 0x78(%rbp)
1400c1c53:     	movups	%xmm0, 0x68(%rbp)
1400c1c57:     	movups	(%rcx), %xmm0
1400c1c5a:     	movups	0x10(%rcx), %xmm1
1400c1c5e:     	movups	%xmm1, 0x98(%rbp)
1400c1c65:     	movups	%xmm0, 0x88(%rbp)
1400c1c6c:     	movups	(%rax), %xmm0
1400c1c6f:     	movups	0x10(%rax), %xmm1
1400c1c73:     	movups	%xmm1, 0xd8(%rbp)
1400c1c7a:     	movups	%xmm0, 0xc8(%rbp)
1400c1c81:     	movq	-0x18(%rbp), %rcx
1400c1c85:     	movq	0x8(%rbp), %rax
1400c1c89:     	movq	0x10(%rbp), %rbx
1400c1c8d:     	movq	0xf8(%rax), %r14
1400c1c94:     	movq	0x100(%rax), %rdx
1400c1c9b:     	movzbl	0x108(%rax), %eax
1400c1ca2:     	leaq	(,%rdx,4), %r8
1400c1caa:     	xorl	%r9d, %r9d
1400c1cad:     	testb	%al, %al
1400c1caf:     	je	0x1400c1cf0 <.text+0xc0cf0>
1400c1cb1:     	nopw	%cs:(%rax,%rax)
1400c1cc0:     	cmpq	%r9, %r8
1400c1cc3:     	je	0x1400c1d92 <.text+0xc0d92>
1400c1cc9:     	movl	(%r14,%r9), %r10d
1400c1ccd:     	movq	0x1a8(%rbx), %r11
1400c1cd4:     	leaq	(%r10,%r10,8), %r10
1400c1cd8:     	addq	$0x4, %r9
1400c1cdc:     	cmpq	$0x0, 0x10(%r11,%r10,8)
1400c1ce2:     	je	0x1400c1cc0 <.text+0xc0cc0>
1400c1ce4:     	jmp	0x1400c1d18 <.text+0xc0d18>
1400c1ce6:     	nopw	%cs:(%rax,%rax)
1400c1cf0:     	cmpq	%r9, %r8
1400c1cf3:     	je	0x1400c1d92 <.text+0xc0d92>
1400c1cf9:     	movl	(%r14,%r9), %r10d
1400c1cfd:     	movq	0x108(%rbx), %r11
1400c1d04:     	leaq	(%r10,%r10,4), %r10
1400c1d08:     	shlq	$0x5, %r10
1400c1d0c:     	addq	$0x4, %r9
1400c1d10:     	cmpq	$0x0, 0x58(%r11,%r10)
1400c1d16:     	je	0x1400c1cf0 <.text+0xc0cf0>
1400c1d18:     	movq	0xd8(%rbp), %r8
1400c1d1f:     	movl	0xe4(%rbp), %r9d
1400c1d26:     	movl	%r9d, %r10d
1400c1d29:     	subl	(%r8), %r10d
1400c1d2c:     	leaq	(%r14,%rdx,4), %r15
1400c1d30:     	subl	0xe0(%rbp), %r9d
1400c1d37:     	cmpl	$0xc233b000, %r9d       # imm = 0xC233B000
1400c1d3e:     	movl	$0xc233b000, %edx       # imm = 0xC233B000
1400c1d43:     	cmovbl	%r9d, %edx
1400c1d47:     	cmpl	%edx, %r10d
1400c1d4a:     	jae	0x1400c2027 <.text+0xc1027>
1400c1d50:     	movq	-0x30(%rbp), %rcx
1400c1d54:     	movq	%rcx, 0x568(%rbp)
1400c1d5b:     	movq	-0x20(%rbp), %r11
1400c1d5f:     	movq	-0x28(%rbp), %r12
1400c1d63:     	movq	-0x40(%rbp), %r9
1400c1d67:     	movq	-0x38(%rbp), %r10
1400c1d6b:     	movl	$0x8, %edi
1400c1d70:     	xorl	%esi, %esi
1400c1d72:     	testb	%al, %al
1400c1d74:     	je	0x1400c2073 <.text+0xc1073>
1400c1d7a:     	leaq	0x2f0(%rbp), %rcx
1400c1d81:     	xorl	%r13d, %r13d
1400c1d84:     	cmpl	%esi, %r13d
1400c1d87:     	je	0x1400c20b0 <.text+0xc10b0>
1400c1d8d:     	jmp	0x1400c2096 <.text+0xc1096>
1400c1d92:     	cmpb	$0x0, 0xd(%rcx)
1400c1d96:     	je	0x1400c313c <.text+0xc213c>
1400c1d9c:     	leaq	0x2f0(%rbp), %rsi
1400c1da3:     	movq	%rsi, %rcx
1400c1da6:     	callq	0x14542f910 <.text+0x542e910>
1400c1dab:     	movl	0xa4(%rbp), %eax
1400c1db1:     	movq	0x98(%rbp), %rcx
1400c1db8:     	movl	%eax, (%rcx)
1400c1dba:     	movq	0x88(%rbp), %r14
1400c1dc1:     	movq	%r14, %rcx
1400c1dc4:     	callq	0x1400a96c0 <.text+0xa86c0>
1400c1dc9:     	movl	$0x1d0, %r8d            # imm = 0x1D0
1400c1dcf:     	movq	%r14, %rcx
1400c1dd2:     	movq	%rsi, %rdx
1400c1dd5:     	callq	0x1457731ed <.text+0x57721ed>
1400c1dda:     	movq	0x68(%rbp), %rdi
1400c1dde:     	movb	0x38(%rdi), %r15b
1400c1de2:     	movb	0x39(%rdi), %r13b
1400c1de6:     	movb	0x3a(%rdi), %sil
1400c1dea:     	leaq	0xf0(%rbp), %rcx
1400c1df1:     	movq	%rdi, %rdx
1400c1df4:     	callq	0x145728850 <.text+0x5727850>
1400c1df9:     	leaq	0x18(%rdi), %rbx
1400c1dfd:     	leaq	0x110(%rbp), %rcx
1400c1e04:     	movq	%rbx, %rdx
1400c1e07:     	callq	0x145728850 <.text+0x5727850>
1400c1e0c:     	nop
1400c1e0d:     	movzbl	0x3f(%rdi), %eax
1400c1e11:     	movb	%al, 0x32f(%rbp)
1400c1e17:     	movl	0x3b(%rdi), %eax
1400c1e1a:     	movl	%eax, 0x32b(%rbp)
1400c1e20:     	movq	0x30(%rdi), %rax
1400c1e24:     	movb	%r15b, 0x328(%rbp)
1400c1e2b:     	movb	%r13b, 0x329(%rbp)
1400c1e32:     	movb	%sil, 0x32a(%rbp)
1400c1e39:     	movq	0x100(%rbp), %rcx
1400c1e40:     	movq	%rcx, 0x300(%rbp)
1400c1e47:     	movups	0xf0(%rbp), %xmm0
1400c1e4e:     	movaps	%xmm0, 0x2f0(%rbp)
1400c1e55:     	movq	0x120(%rbp), %rcx
1400c1e5c:     	movq	%rcx, 0x318(%rbp)
1400c1e63:     	movups	0x110(%rbp), %xmm0
1400c1e6a:     	movups	%xmm0, 0x308(%rbp)
1400c1e71:     	movq	%rax, 0x320(%rbp)
1400c1e78:     	leaq	0x298(%rbp), %rcx
1400c1e7f:     	leaq	0x2f0(%rbp), %r8
1400c1e86:     	movq	%r14, %rdx
1400c1e89:     	callq	0x14542e3f0 <.text+0x542d3f0>
1400c1e8e:     	movzbl	0x2d0(%rbp), %eax
1400c1e95:     	cmpb	0x38(%rdi), %al
1400c1e98:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1e9e:     	movzbl	0x2d1(%rbp), %eax
1400c1ea5:     	cmpb	0x39(%rdi), %al
1400c1ea8:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1eae:     	movzbl	0x2d2(%rbp), %eax
1400c1eb5:     	cmpb	0x3a(%rdi), %al
1400c1eb8:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1ebe:     	movq	0x2a8(%rbp), %r8
1400c1ec5:     	cmpq	0x10(%rdi), %r8
1400c1ec9:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1ecf:     	movq	0x8(%rdi), %rdx
1400c1ed3:     	movq	0x2a0(%rbp), %r14
1400c1eda:     	movq	%r14, %rcx
1400c1edd:     	callq	0x1457731e7 <.text+0x57721e7>
1400c1ee2:     	testl	%eax, %eax
1400c1ee4:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1eea:     	movq	0x2c0(%rbp), %r8
1400c1ef1:     	cmpq	0x28(%rdi), %r8
1400c1ef5:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1ef7:     	movq	0x20(%rdi), %rdx
1400c1efb:     	movq	0x2b8(%rbp), %rcx
1400c1f02:     	callq	0x1457731e7 <.text+0x57721e7>
1400c1f07:     	testl	%eax, %eax
1400c1f09:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1f0b:     	leaq	0x3b(%rdi), %rax
1400c1f0f:     	movl	0x2d3(%rbp), %ecx
1400c1f15:     	movzbl	0x2d7(%rbp), %edx
1400c1f1c:     	shlq	$0x20, %rdx
1400c1f20:     	orq	%rcx, %rdx
1400c1f23:     	movl	(%rax), %ecx
1400c1f25:     	movzbl	0x4(%rax), %eax
1400c1f29:     	shlq	$0x20, %rax
1400c1f2d:     	orq	%rcx, %rax
1400c1f30:     	cmpq	%rax, %rdx
1400c1f33:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1f35:     	movq	0x2c8(%rbp), %rax
1400c1f3c:     	cmpq	0x30(%rdi), %rax
1400c1f40:     	jne	0x1400c1f70 <.text+0xc0f70>
1400c1f42:     	movb	$0x1, %cl
1400c1f44:     	cmpq	$0x0, 0xa8(%rbp)
1400c1f4c:     	jne	0x1400c1fe5 <.text+0xc0fe5>
1400c1f52:     	movq	0x298(%rbp), %rdx
1400c1f59:     	testq	%rdx, %rdx
1400c1f5c:     	je	0x1400c311e <.text+0xc211e>
1400c1f62:     	movl	$0x1, %r8d
1400c1f68:     	movq	%r14, %rcx
1400c1f6b:     	jmp	0x1400c3119 <.text+0xc2119>
1400c1f70:     	movl	0x84(%rbp), %eax
1400c1f76:     	movq	0x78(%rbp), %rcx
1400c1f7a:     	movl	%eax, (%rcx)
1400c1f7c:     	movq	(%rdi), %rdx
1400c1f7f:     	testq	%rdx, %rdx
1400c1f82:     	je	0x1400c1f93 <.text+0xc0f93>
1400c1f84:     	movq	0x8(%rdi), %rcx
1400c1f88:     	movl	$0x1, %r8d
1400c1f8e:     	callq	0x1400021d0 <.text+0x11d0>
1400c1f93:     	movq	(%rbx), %rdx
1400c1f96:     	testq	%rdx, %rdx
1400c1f99:     	je	0x1400c1faa <.text+0xc0faa>
1400c1f9b:     	movq	0x20(%rdi), %rcx
1400c1f9f:     	movl	$0x1, %r8d
1400c1fa5:     	callq	0x1400021d0 <.text+0x11d0>
1400c1faa:     	movups	0x298(%rbp), %xmm0
1400c1fb1:     	movups	0x2a8(%rbp), %xmm1
1400c1fb8:     	movups	0x2b8(%rbp), %xmm2
1400c1fbf:     	movups	0x2c8(%rbp), %xmm3
1400c1fc6:     	movups	%xmm3, 0x30(%rdi)
1400c1fca:     	movups	%xmm2, 0x20(%rdi)
1400c1fce:     	movups	%xmm1, 0x10(%rdi)
1400c1fd2:     	movups	%xmm0, (%rdi)
1400c1fd5:     	cmpq	$0x0, 0xa8(%rbp)
1400c1fdd:     	je	0x1400c313c <.text+0xc213c>
1400c1fe3:     	xorl	%ecx, %ecx
1400c1fe5:     	leaq	0xa8(%rbp), %rax
1400c1fec:     	movups	(%rax), %xmm0
1400c1fef:     	movups	0x10(%rax), %xmm1
1400c1ff3:     	movaps	%xmm1, 0x100(%rbp)
1400c1ffa:     	movaps	%xmm0, 0xf0(%rbp)
1400c2001:     	movzbl	(%r12), %eax
1400c2006:     	cmpl	$0x2, %eax
1400c2009:     	movl	%ecx, 0x568(%rbp)
1400c200f:     	je	0x1400c245a <.text+0xc145a>
1400c2015:     	testl	%eax, %eax
1400c2017:     	jne	0x1400c25b0 <.text+0xc15b0>
1400c201d:     	movq	0x8(%r12), %rax
1400c2022:     	jmp	0x1400c259b <.text+0xc159b>
1400c2027:     	cmpb	$0x0, 0xd(%rcx)
1400c202b:     	jne	0x1400c313c <.text+0xc213c>
1400c2031:     	movq	-0x30(%rbp), %rcx
1400c2035:     	movq	%rcx, 0x568(%rbp)
1400c203c:     	movq	-0x20(%rbp), %r11
1400c2040:     	movq	-0x28(%rbp), %r12
1400c2044:     	movq	-0x40(%rbp), %r9
1400c2048:     	movq	-0x38(%rbp), %r10
1400c204c:     	xorl	%esi, %esi
1400c204e:     	movl	$0x8, %edi
1400c2053:     	testb	%al, %al
1400c2055:     	je	0x1400c226a <.text+0xc126a>
1400c205b:     	leaq	0x2f0(%rbp), %rcx
1400c2062:     	xorl	%r13d, %r13d
1400c2065:     	cmpl	%esi, %r13d
1400c2068:     	je	0x1400c22a0 <.text+0xc12a0>
1400c206e:     	jmp	0x1400c228d <.text+0xc128d>
1400c2073:     	leaq	0x587b496(%rip), %rdx   # 0x14593d510
1400c207a:     	xorl	%r13d, %r13d
1400c207d:     	cmpl	%esi, %r13d
1400c2080:     	jne	0x1400c2180 <.text+0xc1180>
1400c2086:     	jmp	0x1400c21a0 <.text+0xc11a0>
1400c208b:     	leaq	(%rax,%rdx,8), %rax
1400c208f:     	movq	0x8(%rax), %rdi
1400c2093:     	xorl	%r13d, %r13d
1400c2096:     	movl	%r13d, %eax
1400c2099:     	incl	%r13d
1400c209c:     	movq	(%rdi,%rax,8), %rax
1400c20a0:     	testl	%eax, %eax
1400c20a2:     	jne	0x1400c20d7 <.text+0xc10d7>
1400c20a4:     	cmpl	%esi, %r13d
1400c20a7:     	jne	0x1400c2096 <.text+0xc1096>
1400c20a9:     	nopl	(%rax)
1400c20b0:     	cmpq	%r15, %r14
1400c20b3:     	je	0x1400c313c <.text+0xc213c>
1400c20b9:     	movl	(%r14), %edx
1400c20bc:     	addq	$0x4, %r14
1400c20c0:     	movq	0x1a8(%rbx), %rax
1400c20c7:     	leaq	(%rdx,%rdx,8), %rdx
1400c20cb:     	movq	0x10(%rax,%rdx,8), %rsi
1400c20d0:     	testq	%rsi, %rsi
1400c20d3:     	je	0x1400c20b0 <.text+0xc10b0>
1400c20d5:     	jmp	0x1400c208b <.text+0xc108b>
1400c20d7:     	movq	0x568(%rbp), %rdx
1400c20de:     	testq	%rdx, %rdx
1400c20e1:     	movq	0x560(%rbp), %r8
1400c20e8:     	cmovneq	%r11, %r8
1400c20ec:     	movq	%rax, 0x2f0(%rbp)
1400c20f3:     	movq	%r9, 0x2f8(%rbp)
1400c20fa:     	movq	%r10, 0x300(%rbp)
1400c2101:     	movq	%rdx, 0x308(%rbp)
1400c2108:     	movq	%r12, 0x310(%rbp)
1400c210f:     	movq	%r8, 0x560(%rbp)
1400c2116:     	movq	%r8, 0x318(%rbp)
1400c211d:     	movq	%r11, 0x540(%rbp)
1400c2124:     	leaq	0x587b3e5(%rip), %rdx   # 0x14593d510
1400c212b:     	movq	%r12, 0x548(%rbp)
1400c2132:     	movq	%r9, 0x550(%rbp)
1400c2139:     	movq	%r10, 0x558(%rbp)
1400c2140:     	callq	0x144e74f30 <.text+0x4e73f30>
1400c2145:     	leaq	0x2f0(%rbp), %rcx
1400c214c:     	movq	0x558(%rbp), %r10
1400c2153:     	movq	0x550(%rbp), %r9
1400c215a:     	movq	0x548(%rbp), %r12
1400c2161:     	movq	0x540(%rbp), %r11
1400c2168:     	cmpl	%esi, %r13d
1400c216b:     	je	0x1400c20b0 <.text+0xc10b0>
1400c2171:     	jmp	0x1400c2096 <.text+0xc1096>
1400c2176:     	addq	%rcx, %rax
1400c2179:     	movq	0x50(%rax), %rdi
1400c217d:     	xorl	%r13d, %r13d
1400c2180:     	movl	%r13d, %eax
1400c2183:     	shlq	$0x4, %rax
1400c2187:     	incl	%r13d
1400c218a:     	movq	(%rdi,%rax), %rax
1400c218e:     	testl	%eax, %eax
1400c2190:     	jne	0x1400c21cb <.text+0xc11cb>
1400c2192:     	cmpl	%esi, %r13d
1400c2195:     	jne	0x1400c2180 <.text+0xc1180>
1400c2197:     	nopw	(%rax,%rax)
1400c21a0:     	cmpq	%r15, %r14
1400c21a3:     	je	0x1400c313c <.text+0xc213c>
1400c21a9:     	movl	(%r14), %ecx
1400c21ac:     	addq	$0x4, %r14
1400c21b0:     	movq	0x108(%rbx), %rax
1400c21b7:     	leaq	(%rcx,%rcx,4), %rcx
1400c21bb:     	shlq	$0x5, %rcx
1400c21bf:     	movq	0x58(%rax,%rcx), %rsi
1400c21c4:     	testq	%rsi, %rsi
1400c21c7:     	je	0x1400c21a0 <.text+0xc11a0>
1400c21c9:     	jmp	0x1400c2176 <.text+0xc1176>
1400c21cb:     	movq	0x568(%rbp), %r8
1400c21d2:     	testq	%r8, %r8
1400c21d5:     	movq	0x560(%rbp), %rcx
1400c21dc:     	cmovneq	%r11, %rcx
1400c21e0:     	movq	%rax, 0x2f0(%rbp)
1400c21e7:     	movq	%r9, 0x2f8(%rbp)
1400c21ee:     	movq	%r10, 0x300(%rbp)
1400c21f5:     	movq	%r8, 0x308(%rbp)
1400c21fc:     	movq	%r12, 0x310(%rbp)
1400c2203:     	movq	%rcx, 0x560(%rbp)
1400c220a:     	movq	%rcx, 0x318(%rbp)
1400c2211:     	leaq	0x2f0(%rbp), %rcx
1400c2218:     	movq	%r11, 0x540(%rbp)
1400c221f:     	movq	%r12, 0x548(%rbp)
1400c2226:     	movq	%r9, 0x550(%rbp)
1400c222d:     	movq	%r10, 0x558(%rbp)
1400c2234:     	callq	0x144e74f30 <.text+0x4e73f30>
1400c2239:     	leaq	0x587b2d0(%rip), %rdx   # 0x14593d510
1400c2240:     	movq	0x558(%rbp), %r10
1400c2247:     	movq	0x550(%rbp), %r9
1400c224e:     	movq	0x548(%rbp), %r12
1400c2255:     	movq	0x540(%rbp), %r11
1400c225c:     	cmpl	%esi, %r13d
1400c225f:     	je	0x1400c21a0 <.text+0xc11a0>
1400c2265:     	jmp	0x1400c2180 <.text+0xc1180>
1400c226a:     	leaq	0x587b1ef(%rip), %rdx   # 0x14593d460
1400c2271:     	xorl	%r13d, %r13d
1400c2274:     	cmpl	%esi, %r13d
1400c2277:     	jne	0x1400c2370 <.text+0xc1370>
1400c227d:     	jmp	0x1400c2390 <.text+0xc1390>
1400c2282:     	leaq	(%rax,%rdx,8), %rax
1400c2286:     	movq	0x8(%rax), %rdi
1400c228a:     	xorl	%r13d, %r13d
1400c228d:     	movl	%r13d, %eax
1400c2290:     	incl	%r13d
1400c2293:     	movq	(%rdi,%rax,8), %rax
1400c2297:     	testl	%eax, %eax
1400c2299:     	jne	0x1400c22c7 <.text+0xc12c7>
1400c229b:     	cmpl	%esi, %r13d
1400c229e:     	jne	0x1400c228d <.text+0xc128d>
1400c22a0:     	cmpq	%r15, %r14
1400c22a3:     	je	0x1400c313c <.text+0xc213c>
1400c22a9:     	movl	(%r14), %edx
1400c22ac:     	addq	$0x4, %r14
1400c22b0:     	movq	0x1a8(%rbx), %rax
1400c22b7:     	leaq	(%rdx,%rdx,8), %rdx
1400c22bb:     	movq	0x10(%rax,%rdx,8), %rsi
1400c22c0:     	testq	%rsi, %rsi
1400c22c3:     	je	0x1400c22a0 <.text+0xc12a0>
1400c22c5:     	jmp	0x1400c2282 <.text+0xc1282>
1400c22c7:     	movq	0x568(%rbp), %rdx
1400c22ce:     	testq	%rdx, %rdx
1400c22d1:     	movq	0x560(%rbp), %r8
1400c22d8:     	cmovneq	%r11, %r8
1400c22dc:     	movq	%rax, 0x2f0(%rbp)
1400c22e3:     	movq	%r9, 0x2f8(%rbp)
1400c22ea:     	movq	%r10, 0x300(%rbp)
1400c22f1:     	movq	%rdx, 0x308(%rbp)
1400c22f8:     	movq	%r12, 0x310(%rbp)
1400c22ff:     	movq	%r8, 0x560(%rbp)
1400c2306:     	movq	%r8, 0x318(%rbp)
1400c230d:     	movq	%r11, 0x540(%rbp)
1400c2314:     	leaq	0x587b145(%rip), %rdx   # 0x14593d460
1400c231b:     	movq	%r12, 0x548(%rbp)
1400c2322:     	movq	%r9, 0x550(%rbp)
1400c2329:     	movq	%r10, 0x558(%rbp)
1400c2330:     	callq	0x144e74f30 <.text+0x4e73f30>
1400c2335:     	leaq	0x2f0(%rbp), %rcx
1400c233c:     	movq	0x558(%rbp), %r10
1400c2343:     	movq	0x550(%rbp), %r9
1400c234a:     	movq	0x548(%rbp), %r12
1400c2351:     	movq	0x540(%rbp), %r11
1400c2358:     	cmpl	%esi, %r13d
1400c235b:     	je	0x1400c22a0 <.text+0xc12a0>
1400c2361:     	jmp	0x1400c228d <.text+0xc128d>
1400c2366:     	addq	%rcx, %rax
1400c2369:     	movq	0x50(%rax), %rdi
1400c236d:     	xorl	%r13d, %r13d
1400c2370:     	movl	%r13d, %eax
1400c2373:     	shlq	$0x4, %rax
1400c2377:     	incl	%r13d
1400c237a:     	movq	(%rdi,%rax), %rax
1400c237e:     	testl	%eax, %eax
1400c2380:     	jne	0x1400c23bb <.text+0xc13bb>
1400c2382:     	cmpl	%esi, %r13d
1400c2385:     	jne	0x1400c2370 <.text+0xc1370>
1400c2387:     	nopw	(%rax,%rax)
1400c2390:     	cmpq	%r15, %r14
1400c2393:     	je	0x1400c313c <.text+0xc213c>
1400c2399:     	movl	(%r14), %ecx
1400c239c:     	addq	$0x4, %r14
1400c23a0:     	movq	0x108(%rbx), %rax
1400c23a7:     	leaq	(%rcx,%rcx,4), %rcx
1400c23ab:     	shlq	$0x5, %rcx
1400c23af:     	movq	0x58(%rax,%rcx), %rsi
1400c23b4:     	testq	%rsi, %rsi
1400c23b7:     	je	0x1400c2390 <.text+0xc1390>
1400c23b9:     	jmp	0x1400c2366 <.text+0xc1366>
1400c23bb:     	movq	0x568(%rbp), %r8
1400c23c2:     	testq	%r8, %r8
1400c23c5:     	movq	0x560(%rbp), %rcx
1400c23cc:     	cmovneq	%r11, %rcx
1400c23d0:     	movq	%rax, 0x2f0(%rbp)
1400c23d7:     	movq	%r9, 0x2f8(%rbp)
1400c23de:     	movq	%r10, 0x300(%rbp)
1400c23e5:     	movq	%r8, 0x308(%rbp)
1400c23ec:     	movq	%r12, 0x310(%rbp)
1400c23f3:     	movq	%rcx, 0x560(%rbp)
1400c23fa:     	movq	%rcx, 0x318(%rbp)
1400c2401:     	leaq	0x2f0(%rbp), %rcx
1400c2408:     	movq	%r11, 0x540(%rbp)
1400c240f:     	movq	%r12, 0x548(%rbp)
1400c2416:     	movq	%r9, 0x550(%rbp)
1400c241d:     	movq	%r10, 0x558(%rbp)
1400c2424:     	callq	0x144e74f30 <.text+0x4e73f30>
1400c2429:     	leaq	0x587b030(%rip), %rdx   # 0x14593d460
1400c2430:     	movq	0x558(%rbp), %r10
1400c2437:     	movq	0x550(%rbp), %r9
1400c243e:     	movq	0x548(%rbp), %r12
1400c2445:     	movq	0x540(%rbp), %r11
1400c244c:     	cmpl	%esi, %r13d
1400c244f:     	je	0x1400c2390 <.text+0xc1390>
1400c2455:     	jmp	0x1400c2370 <.text+0xc1370>
1400c245a:     	movl	0x5c(%rbp), %eax
1400c245d:     	movq	0x50(%rbp), %rcx
1400c2461:     	movl	%eax, (%rcx)
1400c2463:     	movq	0x40(%rbp), %rdi
1400c2467:     	movq	$0x0, 0x2f0(%rbp)
1400c2472:     	movq	$0x0, 0x310(%rbp)
1400c247d:     	leaq	0x587b0fb(%rip), %rax   # 0x14593d57f
1400c2484:     	movq	%rax, 0x330(%rbp)
1400c248b:     	leaq	0x587b59d(%rip), %rax   # 0x14593da2f
1400c2492:     	movq	%rax, 0x338(%rbp)
1400c2499:     	leaq	0x518(%rbp), %rcx
1400c24a0:     	leaq	0x2f0(%rbp), %rbx
1400c24a7:     	movq	%rbx, %rdx
1400c24aa:     	callq	0x1401b0d60 <.text+0x1afd60>
1400c24af:     	nop
1400c24b0:     	movabsq	$0x1e00000028, %rax     # imm = 0x1E00000028
1400c24ba:     	movq	%rax, 0x500(%rbp)
1400c24c1:     	movl	$0x1, 0x508(%rbp)
1400c24cb:     	movl	$0x16, 0x2f0(%rbp)
1400c24d5:     	movq	%rbx, 0x20(%rsp)
1400c24da:     	movb	$0x2, 0x28(%rsp)
1400c24df:     	leaq	0x110(%rbp), %rcx
1400c24e6:     	leaq	0x500(%rbp), %rdx
1400c24ed:     	leaq	0x518(%rbp), %r9
1400c24f4:     	movl	$0x1, %r8d
1400c24fa:     	callq	0x1448dc3f0 <.text+0x48db3f0>
1400c24ff:     	nop
1400c2500:     	movq	0x50(%rdi), %rcx
1400c2504:     	addq	$0x10, %rcx
1400c2508:     	movb	$0x1, 0x576(%rbp)
1400c250f:     	callq	0x144978a10 <.text+0x4977a10>
1400c2514:     	nop
1400c2515:     	movl	%eax, %r14d
1400c2518:     	movl	%edx, %r15d
1400c251b:     	leaq	0x110(%rbp), %rdx
1400c2522:     	movl	$0xe0, %r8d
1400c2528:     	movq	%rbx, %rcx
1400c252b:     	callq	0x1457731ed <.text+0x57721ed>
1400c2530:     	movb	$0x0, 0x576(%rbp)
1400c2537:     	movq	%rbx, 0x20(%rsp)
1400c253c:     	leaq	0x518(%rbp), %rcx
1400c2543:     	movq	%rdi, %rdx
1400c2546:     	movl	%r14d, %r8d
1400c2549:     	movl	%r15d, %r9d
1400c254c:     	callq	0x1401f1cc0 <.text+0x1f0cc0>
1400c2551:     	nop
1400c2552:     	cmpl	$0x2, 0x518(%rbp)
1400c2559:     	jne	0x1400c319e <.text+0xc219e>
1400c255f:     	movq	$-0x1, 0x2f0(%rbp)
1400c256a:     	movb	$0x0, 0x576(%rbp)
1400c2571:     	movq	%rbx, 0x20(%rsp)
1400c2576:     	movq	$0x0, 0x28(%rsp)
1400c257f:     	movq	%rdi, %rcx
1400c2582:     	movl	%r14d, %edx
1400c2585:     	movl	%r15d, %r8d
1400c2588:     	xorl	%r9d, %r9d
1400c258b:     	callq	0x14498b590 <.text+0x498a590>
1400c2590:     	nop
1400c2591:     	movb	$0x0, (%r12)
1400c2596:     	movq	%rax, 0x8(%r12)
1400c259b:     	lock
1400c259c:     	incq	(%rax)
1400c259f:     	jle	0x1400c31f1 <.text+0xc21f1>
1400c25a5:     	movq	%rax, 0x508(%rbp)
1400c25ac:     	xorl	%eax, %eax
1400c25ae:     	jmp	0x1400c25bf <.text+0xc15bf>
1400c25b0:     	movups	0x1(%r12), %xmm0
1400c25b6:     	movups	%xmm0, 0x501(%rbp)
1400c25bd:     	movb	$0x1, %al
1400c25bf:     	movb	%al, 0x500(%rbp)
1400c25c5:     	movups	0x587a89c(%rip), %xmm6  # 0x14593ce68
1400c25cc:     	movaps	%xmm6, 0x110(%rbp)
1400c25d3:     	movq	$0x0, 0x120(%rbp)
1400c25de:     	movups	0x587a89b(%rip), %xmm0  # 0x14593ce80
1400c25e5:     	movups	%xmm0, 0x128(%rbp)
1400c25ec:     	movq	$0x0, 0x138(%rbp)
1400c25f7:     	movups	0x587a899(%rip), %xmm8  # 0x14593ce98
1400c25ff:     	movaps	%xmm8, 0x140(%rbp)
1400c2607:     	movq	$0x0, 0x150(%rbp)
1400c2612:     	movups	0x587a897(%rip), %xmm0  # 0x14593ceb0
1400c2619:     	movups	%xmm0, 0x158(%rbp)
1400c2620:     	movq	$0x0, 0x168(%rbp)
1400c262b:     	movaps	%xmm6, 0x2f0(%rbp)
1400c2632:     	movaps	%xmm8, 0x320(%rbp)
1400c263a:     	movq	0x120(%rbp), %rax
1400c2641:     	movq	%rax, 0x300(%rbp)
1400c2648:     	movq	0x128(%rbp), %rax
1400c264f:     	movq	%rax, 0x308(%rbp)
1400c2656:     	movq	0x130(%rbp), %rax
1400c265d:     	movq	%rax, 0x310(%rbp)
1400c2664:     	movq	0x138(%rbp), %rax
1400c266b:     	movq	%rax, 0x318(%rbp)
1400c2672:     	movq	0x150(%rbp), %rax
1400c2679:     	movq	%rax, 0x330(%rbp)
1400c2680:     	movq	0x158(%rbp), %rax
1400c2687:     	movq	%rax, 0x338(%rbp)
1400c268e:     	movaps	0x160(%rbp), %xmm0
1400c2695:     	movaps	%xmm0, 0x340(%rbp)
1400c269c:     	xorps	%xmm0, %xmm0
1400c269f:     	movaps	%xmm0, 0x360(%rbp)
1400c26a6:     	movaps	%xmm0, 0x350(%rbp)
1400c26ad:     	movq	$0x0, 0x370(%rbp)
1400c26b8:     	movaps	0x5850a71(%rip), %xmm1  # 0x145913130
1400c26bf:     	movups	%xmm1, 0x378(%rbp)
1400c26c6:     	movups	%xmm0, 0x398(%rbp)
1400c26cd:     	movups	%xmm0, 0x388(%rbp)
1400c26d4:     	movups	0x587a855(%rip), %xmm0  # 0x14593cf30
1400c26db:     	movups	%xmm0, 0x3b8(%rbp)
1400c26e2:     	movups	0x587a837(%rip), %xmm0  # 0x14593cf20
1400c26e9:     	movups	%xmm0, 0x3a8(%rbp)
1400c26f0:     	movups	0x587a859(%rip), %xmm0  # 0x14593cf50
1400c26f7:     	movups	%xmm0, 0x3d8(%rbp)
1400c26fe:     	movups	0x587a83b(%rip), %xmm0  # 0x14593cf40
1400c2705:     	movups	%xmm0, 0x3c8(%rbp)
1400c270c:     	movups	0x587a85c(%rip), %xmm14 # 0x14593cf70
1400c2714:     	movups	%xmm14, 0x3f8(%rbp)
1400c271c:     	movups	0x587a83d(%rip), %xmm7  # 0x14593cf60
1400c2723:     	movups	%xmm7, 0x3e8(%rbp)
1400c272a:     	movups	0x587a85e(%rip), %xmm9  # 0x14593cf90
1400c2732:     	movups	%xmm9, 0x418(%rbp)
1400c273a:     	movups	0x587a83e(%rip), %xmm10 # 0x14593cf80
1400c2742:     	movups	%xmm10, 0x408(%rbp)
1400c274a:     	movaps	0x5844d6e(%rip), %xmm15 # 0x1459074c0
1400c2752:     	movups	%xmm15, 0x428(%rbp)
1400c275a:     	movl	$0x1, 0x438(%rbp)
1400c2764:     	movq	$0x0, 0x43c(%rbp)
1400c276f:     	movb	$0x1, 0x444(%rbp)
1400c2776:     	movq	$0x0, 0x448(%rbp)
1400c2781:     	movl	$0x3f800000, 0x450(%rbp) # imm = 0x3F800000
1400c278b:     	movw	$0x101, 0x454(%rbp)     # imm = 0x101
1400c2794:     	movw	$0x0, 0x45a(%rbp)
1400c279d:     	movl	$0x10000, 0x456(%rbp)   # imm = 0x10000
1400c27a7:     	movw	$0x0, 0x460(%rbp)
1400c27b0:     	movl	$0x10000, 0x45c(%rbp)   # imm = 0x10000
1400c27ba:     	movw	$0x100, 0x462(%rbp)     # imm = 0x100
1400c27c3:     	movl	$0x0, 0x470(%rbp)
1400c27cd:     	movw	$0x0, 0x46c(%rbp)
1400c27d6:     	movq	$0x0, 0x464(%rbp)
1400c27e1:     	movaps	0x58561f8(%rip), %xmm0  # 0x1459189e0
1400c27e8:     	movups	%xmm0, 0x474(%rbp)
1400c27ef:     	movl	$0x1388, 0x484(%rbp)    # imm = 0x1388
1400c27f9:     	movw	$0x2, 0x488(%rbp)
1400c2802:     	movb	$0x1, 0x577(%rbp)
1400c2809:     	leaq	0x587ac68(%rip), %r9    # 0x14593d478
1400c2810:     	leaq	0x110(%rbp), %rcx
1400c2817:     	leaq	-0x40(%rbp), %rdx
1400c281b:     	leaq	0x2f0(%rbp), %r8
1400c2822:     	callq	0x1400ef1d0 <.text+0xee1d0>
1400c2827:     	nop
1400c2828:     	leaq	0x20(%rbp), %rdx
1400c282c:     	leaq	0x68(%rbp), %r8
1400c2830:     	movb	$0x1, 0x577(%rbp)
1400c2837:     	leaq	0x110(%rbp), %rcx
1400c283e:     	callq	0x14013cd30 <.text+0x13bd30>
1400c2843:     	nop
1400c2844:     	movaps	%xmm6, 0x110(%rbp)
1400c284b:     	movq	$0x0, 0x120(%rbp)
1400c2856:     	movups	0x587a623(%rip), %xmm0  # 0x14593ce80
1400c285d:     	movups	%xmm0, 0x128(%rbp)
1400c2864:     	movq	$0x0, 0x138(%rbp)
1400c286f:     	movaps	%xmm8, 0x140(%rbp)
1400c2877:     	movq	$0x0, 0x150(%rbp)
1400c2882:     	movups	0x587a627(%rip), %xmm0  # 0x14593ceb0
1400c2889:     	movups	%xmm0, 0x158(%rbp)
1400c2890:     	movq	$0x0, 0x168(%rbp)
1400c289b:     	movsd	0x585614d(%rip), %xmm0  # 0x1459189f0
1400c28a3:     	movsd	%xmm0, 0x470(%rbp)
1400c28ab:     	movl	$0x3f0ccccd, 0x478(%rbp) # imm = 0x3F0CCCCD
1400c28b5:     	movaps	%xmm6, 0x2f0(%rbp)
1400c28bc:     	movaps	%xmm8, 0x320(%rbp)
1400c28c4:     	movq	0x120(%rbp), %rax
1400c28cb:     	movq	%rax, 0x300(%rbp)
1400c28d2:     	movq	0x128(%rbp), %rax
1400c28d9:     	movq	%rax, 0x308(%rbp)
1400c28e0:     	movq	0x130(%rbp), %rax
1400c28e7:     	movq	%rax, 0x310(%rbp)
1400c28ee:     	movq	0x138(%rbp), %rax
1400c28f5:     	movq	%rax, 0x318(%rbp)
1400c28fc:     	movaps	0x150(%rbp), %xmm0
1400c2903:     	movaps	%xmm0, 0x330(%rbp)
1400c290a:     	movaps	0x160(%rbp), %xmm0
1400c2911:     	movaps	%xmm0, 0x340(%rbp)
1400c2918:     	xorps	%xmm0, %xmm0
1400c291b:     	movaps	%xmm0, 0x350(%rbp)
1400c2922:     	movaps	0x58560d7(%rip), %xmm1  # 0x145918a00
1400c2929:     	movaps	%xmm1, 0x360(%rbp)
1400c2930:     	movaps	%xmm0, 0x370(%rbp)
1400c2937:     	movaps	%xmm0, 0x380(%rbp)
1400c293e:     	movaps	%xmm0, 0x390(%rbp)
1400c2945:     	movq	$0x0, 0x3a0(%rbp)
1400c2950:     	movups	0x587a5c9(%rip), %xmm0  # 0x14593cf20
1400c2957:     	movups	%xmm0, 0x3a8(%rbp)
1400c295e:     	movups	0x587a5cb(%rip), %xmm0  # 0x14593cf30
1400c2965:     	movups	%xmm0, 0x3b8(%rbp)
1400c296c:     	movups	0x587a5cd(%rip), %xmm0  # 0x14593cf40
1400c2973:     	movups	%xmm0, 0x3c8(%rbp)
1400c297a:     	movups	0x587a5cf(%rip), %xmm0  # 0x14593cf50
1400c2981:     	movups	%xmm0, 0x3d8(%rbp)
1400c2988:     	movups	%xmm7, 0x3e8(%rbp)
1400c298f:     	movups	%xmm14, 0x3f8(%rbp)
1400c2997:     	movups	%xmm9, 0x418(%rbp)
1400c299f:     	movups	%xmm10, 0x408(%rbp)
1400c29a7:     	movups	%xmm15, 0x428(%rbp)
1400c29af:     	movl	$0x1, 0x438(%rbp)
1400c29b9:     	movss	0x5852e3f(%rip), %xmm0  # 0x145915800
1400c29c1:     	movlps	%xmm0, 0x43c(%rbp)
1400c29c8:     	movb	$0x1, 0x444(%rbp)
1400c29cf:     	movq	$0x0, 0x448(%rbp)
1400c29da:     	movl	$0x3f800000, 0x450(%rbp) # imm = 0x3F800000
1400c29e4:     	movw	$0x0, 0x454(%rbp)
1400c29ed:     	movl	$0x10000, 0x456(%rbp)   # imm = 0x10000
1400c29f7:     	movw	$0x0, 0x45a(%rbp)
1400c2a00:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
1400c2a0a:     	movq	%rax, 0x45c(%rbp)
1400c2a11:     	movw	$0x0, 0x46c(%rbp)
1400c2a1a:     	movq	$0x0, 0x464(%rbp)
1400c2a25:     	movl	$0x1389, 0x47c(%rbp)    # imm = 0x1389
1400c2a2f:     	movb	$0x1, 0x577(%rbp)
1400c2a36:     	leaq	0x587aa53(%rip), %r9    # 0x14593d490
1400c2a3d:     	leaq	0x110(%rbp), %rcx
1400c2a44:     	leaq	-0x40(%rbp), %rdx
1400c2a48:     	leaq	0x2f0(%rbp), %r8
1400c2a4f:     	callq	0x1400eec40 <.text+0xedc40>
1400c2a54:     	nop
1400c2a55:     	leaq	0xf0(%rbp), %rax
1400c2a5c:     	movq	%rax, 0x308(%rbp)
1400c2a63:     	movups	0x500(%rbp), %xmm0
1400c2a6a:     	movaps	%xmm0, 0x2f0(%rbp)
1400c2a71:     	movq	0x510(%rbp), %rax
1400c2a78:     	movq	%rax, 0x300(%rbp)
1400c2a7f:     	movb	$0x0, 0x577(%rbp)
1400c2a86:     	leaq	0x110(%rbp), %rcx
1400c2a8d:     	leaq	0x2f0(%rbp), %rdx
1400c2a94:     	callq	0x14013b1e0 <.text+0x13a1e0>
1400c2a99:     	nop
1400c2a9a:     	movw	$0x0, 0x274(%rbp)
1400c2aa3:     	movb	$0x1, 0x264(%rbp)
1400c2aaa:     	movabsq	$0x4160000000000001, %rax # imm = 0x4160000000000001
1400c2ab4:     	movq	%rax, 0x178(%rbp)
1400c2abb:     	xorps	%xmm0, %xmm0
1400c2abe:     	movaps	%xmm0, 0x180(%rbp)
1400c2ac5:     	movabsq	$0x4120000000000001, %rax # imm = 0x4120000000000001
1400c2acf:     	movq	%rax, 0x190(%rbp)
1400c2ad6:     	movq	$0x0, 0x170(%rbp)
1400c2ae1:     	movups	%xmm0, 0x198(%rbp)
1400c2ae8:     	movups	%xmm0, 0x1a8(%rbp)
1400c2aef:     	movups	%xmm0, 0x1b8(%rbp)
1400c2af6:     	movl	$0x0, 0x288(%rbp)
1400c2b00:     	movw	$0x0, 0x28c(%rbp)
1400c2b09:     	movups	0x587a410(%rip), %xmm0  # 0x14593cf20
1400c2b10:     	movups	%xmm0, 0x1c8(%rbp)
1400c2b17:     	movups	0x587a412(%rip), %xmm0  # 0x14593cf30
1400c2b1e:     	movups	%xmm0, 0x1d8(%rbp)
1400c2b25:     	movups	0x587a414(%rip), %xmm0  # 0x14593cf40
1400c2b2c:     	movups	%xmm0, 0x1e8(%rbp)
1400c2b33:     	movups	0x587a416(%rip), %xmm0  # 0x14593cf50
1400c2b3a:     	movups	%xmm0, 0x1f8(%rbp)
1400c2b41:     	movups	%xmm14, 0x218(%rbp)
1400c2b49:     	movups	%xmm7, 0x208(%rbp)
1400c2b50:     	movups	%xmm9, 0x238(%rbp)
1400c2b58:     	movups	%xmm10, 0x228(%rbp)
1400c2b60:     	movb	$0x0, 0x286(%rbp)
1400c2b67:     	movl	$0x100, 0x282(%rbp)     # imm = 0x100
1400c2b71:     	movq	$0x0, 0x268(%rbp)
1400c2b7c:     	movl	$0x3f800000, 0x270(%rbp) # imm = 0x3F800000
1400c2b86:     	movups	%xmm15, 0x248(%rbp)
1400c2b8e:     	movl	$0x1, 0x258(%rbp)
1400c2b98:     	movq	$0x0, 0x25c(%rbp)
1400c2ba3:     	movb	$0x0, 0x287(%rbp)
1400c2baa:     	movaps	%xmm6, 0x110(%rbp)
1400c2bb1:     	movq	$0x0, 0x120(%rbp)
1400c2bbc:     	movups	0x587a2bd(%rip), %xmm0  # 0x14593ce80
1400c2bc3:     	movups	%xmm0, 0x128(%rbp)
1400c2bca:     	movq	$0x0, 0x138(%rbp)
1400c2bd5:     	movaps	%xmm8, 0x140(%rbp)
1400c2bdd:     	movq	$0x0, 0x150(%rbp)
1400c2be8:     	movups	0x587a2c1(%rip), %xmm0  # 0x14593ceb0
1400c2bef:     	movups	%xmm0, 0x158(%rbp)
1400c2bf6:     	movq	$0x0, 0x168(%rbp)
1400c2c01:     	movw	$0x0, 0x27a(%rbp)
1400c2c0a:     	movl	$0x10000, 0x276(%rbp)   # imm = 0x10000
1400c2c14:     	movw	$0x0, 0x280(%rbp)
1400c2c1d:     	movl	$0x10000, 0x27c(%rbp)   # imm = 0x10000
1400c2c27:     	movq	0xf0(%rbp), %rbx
1400c2c2e:     	callq	0x140002200 <.text+0x1200>
1400c2c33:     	movl	$0x20, %ecx
1400c2c38:     	movl	$0x1, %edx
1400c2c3d:     	callq	0x1400021c0 <.text+0x11c0>
1400c2c42:     	testq	%rax, %rax
1400c2c45:     	je	0x1400c31e1 <.text+0xc21e1>
1400c2c4b:     	movq	%rax, %rsi
1400c2c4e:     	movups	0x587a877(%rip), %xmm0  # 0x14593d4cc
1400c2c55:     	movups	%xmm0, 0x10(%rax)
1400c2c59:     	movups	0x587a85c(%rip), %xmm0  # 0x14593d4bc
1400c2c60:     	movups	%xmm0, (%rax)
1400c2c63:     	cmpb	$0x1, (%rbx)
1400c2c66:     	jne	0x1400c2c88 <.text+0xc1c88>
1400c2c68:     	movl	0x1(%rbx), %eax
1400c2c6b:     	movl	0x4(%rbx), %ecx
1400c2c6e:     	movl	%ecx, 0x53b(%rbp)
1400c2c74:     	movl	%eax, 0x538(%rbp)
1400c2c7a:     	movq	0x8(%rbx), %r14
1400c2c7e:     	movzbl	0x10(%rbx), %r15d
1400c2c83:     	movb	$0x1, %r12b
1400c2c86:     	jmp	0x1400c2c99 <.text+0xc1c99>
1400c2c88:     	movq	0x8(%rbx), %r14
1400c2c8c:     	lock
1400c2c8d:     	incq	(%r14)
1400c2c90:     	jle	0x1400c31f1 <.text+0xc21f1>
1400c2c96:     	xorl	%r12d, %r12d
1400c2c99:     	movups	0x587a807(%rip), %xmm11 # 0x14593d4a8
1400c2ca1:     	movups	%xmm11, 0x519(%rbp)
1400c2ca9:     	movl	$0x3f800000, 0x529(%rbp) # imm = 0x3F800000
1400c2cb3:     	leaq	0x2f0(%rbp), %rdi
1400c2cba:     	leaq	0x110(%rbp), %rdx
1400c2cc1:     	movl	$0x180, %r8d            # imm = 0x180
1400c2cc7:     	movq	%rdi, %rcx
1400c2cca:     	callq	0x1457731ed <.text+0x57721ed>
1400c2ccf:     	movl	$0x1389, 0x470(%rbp)    # imm = 0x1389
1400c2cd9:     	movq	$0x20, 0x478(%rbp)
1400c2ce4:     	movq	%rsi, 0x480(%rbp)
1400c2ceb:     	movq	$0x20, 0x488(%rbp)
1400c2cf6:     	movq	$0x0, 0x490(%rbp)
1400c2d01:     	movq	$0x4, 0x498(%rbp)
1400c2d0c:     	movq	$0x0, 0x4a0(%rbp)
1400c2d17:     	movb	%r12b, 0x4a8(%rbp)
1400c2d1e:     	movl	0x538(%rbp), %eax
1400c2d24:     	movl	0x53b(%rbp), %ecx
1400c2d2a:     	movl	%eax, 0x4a9(%rbp)
1400c2d30:     	movl	%ecx, 0x4ac(%rbp)
1400c2d36:     	movq	%r14, 0x4b0(%rbp)
1400c2d3d:     	movq	%r15, 0x4b8(%rbp)
1400c2d44:     	movl	$0x41400000, 0x4c0(%rbp) # imm = 0x41400000
1400c2d4e:     	movw	$0x190, 0x4c4(%rbp)     # imm = 0x190
1400c2d57:     	movb	$0x1, 0x4c6(%rbp)
1400c2d5e:     	movups	0x518(%rbp), %xmm0
1400c2d65:     	movups	%xmm0, 0x4c7(%rbp)
1400c2d6c:     	movq	0x525(%rbp), %rax
1400c2d73:     	movq	%rax, 0x4d4(%rbp)
1400c2d7a:     	movups	0x58563ee(%rip), %xmm12 # 0x145919170
1400c2d82:     	movups	%xmm12, 0x4dc(%rbp)
1400c2d8a:     	movl	$0x3f59999a, 0x4ec(%rbp) # imm = 0x3F59999A
1400c2d94:     	movsd	0x5852a33(%rip), %xmm13 # 0x1459157d0
1400c2d9d:     	movsd	%xmm13, 0x4f0(%rbp)
1400c2da6:     	movb	$0x0, 0x577(%rbp)
1400c2dad:     	leaq	0x587a72c(%rip), %r9    # 0x14593d4e0
1400c2db4:     	leaq	0x110(%rbp), %rcx
1400c2dbb:     	leaq	-0x40(%rbp), %rdx
1400c2dbf:     	movq	%rdi, %r8
1400c2dc2:     	callq	0x1400eeef0 <.text+0xedef0>
1400c2dc7:     	nop
1400c2dc8:     	movw	$0x0, 0x274(%rbp)
1400c2dd1:     	movb	$0x1, 0x264(%rbp)
1400c2dd8:     	movaps	0x5855c31(%rip), %xmm0  # 0x145918a10
1400c2ddf:     	movups	%xmm0, 0x178(%rbp)
1400c2de6:     	movaps	0x5855c33(%rip), %xmm0  # 0x145918a20
1400c2ded:     	movups	%xmm0, 0x188(%rbp)
1400c2df4:     	movq	$0x0, 0x170(%rbp)
1400c2dff:     	xorps	%xmm0, %xmm0
1400c2e02:     	movups	%xmm0, 0x198(%rbp)
1400c2e09:     	movups	%xmm0, 0x1a8(%rbp)
1400c2e10:     	movups	%xmm0, 0x1b8(%rbp)
1400c2e17:     	movl	$0x0, 0x288(%rbp)
1400c2e21:     	movw	$0x0, 0x28c(%rbp)
1400c2e2a:     	movups	0x587a0ff(%rip), %xmm0  # 0x14593cf30
1400c2e31:     	movups	%xmm0, 0x1d8(%rbp)
1400c2e38:     	movups	0x587a0e1(%rip), %xmm0  # 0x14593cf20
1400c2e3f:     	movups	%xmm0, 0x1c8(%rbp)
1400c2e46:     	movups	0x587a0f3(%rip), %xmm0  # 0x14593cf40
1400c2e4d:     	movups	%xmm0, 0x1e8(%rbp)
1400c2e54:     	movups	0x587a0f5(%rip), %xmm0  # 0x14593cf50
1400c2e5b:     	movups	%xmm0, 0x1f8(%rbp)
1400c2e62:     	movups	%xmm14, 0x218(%rbp)
1400c2e6a:     	movups	%xmm7, 0x208(%rbp)
1400c2e71:     	movups	%xmm9, 0x238(%rbp)
1400c2e79:     	movups	%xmm10, 0x228(%rbp)
1400c2e81:     	movb	$0x0, 0x286(%rbp)
1400c2e88:     	movl	$0x100, 0x282(%rbp)     # imm = 0x100
1400c2e92:     	movq	$0x0, 0x268(%rbp)
1400c2e9d:     	movl	$0x3f800000, 0x270(%rbp) # imm = 0x3F800000
1400c2ea7:     	movups	%xmm15, 0x248(%rbp)
1400c2eaf:     	movl	$0x1, 0x258(%rbp)
1400c2eb9:     	movq	$0x0, 0x25c(%rbp)
1400c2ec4:     	movb	$0x0, 0x287(%rbp)
1400c2ecb:     	movaps	%xmm6, 0x110(%rbp)
1400c2ed2:     	movq	$0x0, 0x120(%rbp)
1400c2edd:     	movups	0x5879f9c(%rip), %xmm0  # 0x14593ce80
1400c2ee4:     	movups	%xmm0, 0x128(%rbp)
1400c2eeb:     	movq	$0x0, 0x138(%rbp)
1400c2ef6:     	movaps	%xmm8, 0x140(%rbp)
1400c2efe:     	movq	$0x0, 0x150(%rbp)
1400c2f09:     	movups	0x5879fa0(%rip), %xmm0  # 0x14593ceb0
1400c2f10:     	movups	%xmm0, 0x158(%rbp)
1400c2f17:     	movq	$0x0, 0x168(%rbp)
1400c2f22:     	movw	$0x0, 0x27a(%rbp)
1400c2f2b:     	movl	$0x10000, 0x276(%rbp)   # imm = 0x10000
1400c2f35:     	movw	$0x0, 0x280(%rbp)
1400c2f3e:     	movl	$0x10000, 0x27c(%rbp)   # imm = 0x10000
1400c2f48:     	leaq	0x587a5d9(%rip), %rax   # 0x14593d528
1400c2f4f:     	movq	%rax, 0x2d8(%rbp)
1400c2f56:     	movq	$0x8, 0x2e0(%rbp)
1400c2f61:     	leaq	0x587a5d0(%rip), %rax   # 0x14593d538
1400c2f68:     	movq	%rax, 0x2f0(%rbp)
1400c2f6f:     	leaq	-0xc0eb6(%rip), %rax    # 0x1400020c0 <.text+0x10c0>
1400c2f76:     	movq	%rax, 0x2f8(%rbp)
1400c2f7d:     	leaq	0x2d8(%rbp), %rcx
1400c2f84:     	movq	%rcx, 0x300(%rbp)
1400c2f8b:     	movq	%rax, 0x308(%rbp)
1400c2f92:     	leaq	0x587a5af(%rip), %rdx   # 0x14593d548
1400c2f99:     	leaq	0x518(%rbp), %rcx
1400c2fa0:     	leaq	0x2f0(%rbp), %r8
1400c2fa7:     	callq	0x145728390 <.text+0x5727390>
1400c2fac:     	nop
1400c2fad:     	cmpb	$0x1, (%rbx)
1400c2fb0:     	jne	0x1400c2fd1 <.text+0xc1fd1>
1400c2fb2:     	movl	0x1(%rbx), %eax
1400c2fb5:     	movl	0x4(%rbx), %ecx
1400c2fb8:     	movl	%ecx, 0x533(%rbp)
1400c2fbe:     	movl	%eax, 0x530(%rbp)
1400c2fc4:     	movq	0x8(%rbx), %rdi
1400c2fc8:     	movzbl	0x10(%rbx), %ebx
1400c2fcc:     	movb	$0x1, %r14b
1400c2fcf:     	jmp	0x1400c2fe2 <.text+0xc1fe2>
1400c2fd1:     	movq	0x8(%rbx), %rdi
1400c2fd5:     	lock
1400c2fd6:     	incq	(%rdi)
1400c2fd9:     	jle	0x1400c31f1 <.text+0xc21f1>
1400c2fdf:     	xorl	%r14d, %r14d
1400c2fe2:     	movq	0x528(%rbp), %rax
1400c2fe9:     	movq	%rax, 0x488(%rbp)
1400c2ff0:     	movups	0x518(%rbp), %xmm0
1400c2ff7:     	movups	%xmm0, 0x478(%rbp)
1400c2ffe:     	movups	%xmm11, 0x2d9(%rbp)
1400c3006:     	movl	$0x3f800000, 0x2e9(%rbp) # imm = 0x3F800000
1400c3010:     	leaq	0x2f0(%rbp), %rsi
1400c3017:     	leaq	0x110(%rbp), %rdx
1400c301e:     	movl	$0x180, %r8d            # imm = 0x180
1400c3024:     	movq	%rsi, %rcx
1400c3027:     	callq	0x1457731ed <.text+0x57721ed>
1400c302c:     	movl	$0x1389, 0x470(%rbp)    # imm = 0x1389
1400c3036:     	movq	$0x0, 0x490(%rbp)
1400c3041:     	movq	$0x4, 0x498(%rbp)
1400c304c:     	movq	$0x0, 0x4a0(%rbp)
1400c3057:     	movb	%r14b, 0x4a8(%rbp)
1400c305e:     	movl	0x530(%rbp), %eax
1400c3064:     	movl	0x533(%rbp), %ecx
1400c306a:     	movl	%eax, 0x4a9(%rbp)
1400c3070:     	movl	%ecx, 0x4ac(%rbp)
1400c3076:     	movq	%rdi, 0x4b0(%rbp)
1400c307d:     	movq	%rbx, 0x4b8(%rbp)
1400c3084:     	movl	$0x41400000, 0x4c0(%rbp) # imm = 0x41400000
1400c308e:     	movw	$0x190, 0x4c4(%rbp)     # imm = 0x190
1400c3097:     	movb	$0x1, 0x4c6(%rbp)
1400c309e:     	movups	0x2d8(%rbp), %xmm0
1400c30a5:     	movups	%xmm0, 0x4c7(%rbp)
1400c30ac:     	movq	0x2e5(%rbp), %rax
1400c30b3:     	movq	%rax, 0x4d4(%rbp)
1400c30ba:     	movups	%xmm12, 0x4dc(%rbp)
1400c30c2:     	movl	$0x3f59999a, 0x4ec(%rbp) # imm = 0x3F59999A
1400c30cc:     	movsd	%xmm13, 0x4f0(%rbp)
1400c30d5:     	movb	$0x0, 0x577(%rbp)
1400c30dc:     	leaq	0x587a415(%rip), %r9    # 0x14593d4f8
1400c30e3:     	leaq	0x110(%rbp), %rcx
1400c30ea:     	leaq	-0x40(%rbp), %rdx
1400c30ee:     	movq	%rsi, %r8
1400c30f1:     	callq	0x1400eeef0 <.text+0xedef0>
1400c30f6:     	nop
1400c30f7:     	cmpb	$0x0, 0x568(%rbp)
1400c30fe:     	je	0x1400c313c <.text+0xc213c>
1400c3100:     	movq	0x298(%rbp), %rdx
1400c3107:     	testq	%rdx, %rdx
1400c310a:     	je	0x1400c311e <.text+0xc211e>
1400c310c:     	movq	0x2a0(%rbp), %rcx
1400c3113:     	movl	$0x1, %r8d
1400c3119:     	callq	0x1400021d0 <.text+0x11d0>
1400c311e:     	movq	0x2b0(%rbp), %rdx
1400c3125:     	testq	%rdx, %rdx
1400c3128:     	je	0x1400c313c <.text+0xc213c>
1400c312a:     	movq	0x2b8(%rbp), %rcx
1400c3131:     	movl	$0x1, %r8d
1400c3137:     	callq	0x1400021d0 <.text+0x11d0>
1400c313c:     	movaps	0x580(%rbp), %xmm6
1400c3143:     	movaps	0x590(%rbp), %xmm7
1400c314a:     	movaps	0x5a0(%rbp), %xmm8
1400c3152:     	movaps	0x5b0(%rbp), %xmm9
1400c315a:     	movaps	0x5c0(%rbp), %xmm10
1400c3162:     	movaps	0x5d0(%rbp), %xmm11
1400c316a:     	movaps	0x5e0(%rbp), %xmm12
1400c3172:     	movaps	0x5f0(%rbp), %xmm13
1400c317a:     	movaps	0x600(%rbp), %xmm14
1400c3182:     	movaps	0x610(%rbp), %xmm15
1400c318a:     	addq	$0x6a8, %rsp            # imm = 0x6A8
1400c3191:     	popq	%rbx
1400c3192:     	popq	%rdi
1400c3193:     	popq	%rsi
1400c3194:     	popq	%r12
1400c3196:     	popq	%r13
1400c3198:     	popq	%r14
1400c319a:     	popq	%r15
1400c319c:     	popq	%rbp
1400c319d:     	retq
1400c319e:     	movups	0x518(%rbp), %xmm0
1400c31a5:     	movaps	%xmm0, 0x2f0(%rbp)
1400c31ac:     	movb	$0x0, 0x576(%rbp)
1400c31b3:     	leaq	0x5855e76(%rip), %rax   # 0x145919030
1400c31ba:     	movq	%rax, 0x20(%rsp)
1400c31bf:     	leaq	0x58794da(%rip), %rcx   # 0x14593c6a0
1400c31c6:     	leaq	0x5879523(%rip), %r9    # 0x14593c6f0
1400c31cd:     	leaq	0x2f0(%rbp), %r8
1400c31d4:     	movl	$0x2b, %edx
1400c31d9:     	callq	0x145903ab0 <.text+0x5902ab0>
1400c31de:     	nop
1400c31df:     	jmp	0x1400c31f1 <.text+0xc21f1>
1400c31e1:     	movl	$0x1, %ecx
1400c31e6:     	movl	$0x20, %edx
1400c31eb:     	callq	0x14590379b <.text+0x590279b>
1400c31f0:     	nop
1400c31f1:     	ud2
