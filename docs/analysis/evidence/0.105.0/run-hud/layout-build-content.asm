
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401b5a90:     	pushq	%rbp
1401b5a91:     	pushq	%r15
1401b5a93:     	pushq	%r14
1401b5a95:     	pushq	%r13
1401b5a97:     	pushq	%r12
1401b5a99:     	pushq	%rsi
1401b5a9a:     	pushq	%rdi
1401b5a9b:     	pushq	%rbx
1401b5a9c:     	subq	$0x938, %rsp            # imm = 0x938
1401b5aa3:     	leaq	0x80(%rsp), %rbp
1401b5aab:     	movaps	%xmm15, 0x8a0(%rbp)
1401b5ab3:     	movaps	%xmm14, 0x890(%rbp)
1401b5abb:     	movaps	%xmm13, 0x880(%rbp)
1401b5ac3:     	movaps	%xmm12, 0x870(%rbp)
1401b5acb:     	movdqa	%xmm11, 0x860(%rbp)
1401b5ad4:     	movaps	%xmm10, 0x850(%rbp)
1401b5adc:     	movaps	%xmm9, 0x840(%rbp)
1401b5ae4:     	movaps	%xmm8, 0x830(%rbp)
1401b5aec:     	movaps	%xmm7, 0x820(%rbp)
1401b5af3:     	movaps	%xmm6, 0x810(%rbp)
1401b5afa:     	movq	$-0x2, 0x808(%rbp)
1401b5b05:     	movq	%rdx, %r12
1401b5b08:     	movq	(%rcx), %rsi
1401b5b0b:     	movq	0x28(%rcx), %rax
1401b5b0f:     	movq	%rsi, 0x768(%rbp)
1401b5b16:     	leaq	0x770(%rbp), %r14
1401b5b1d:     	movups	0x8(%rcx), %xmm0
1401b5b21:     	movups	%xmm0, 0x770(%rbp)
1401b5b28:     	movq	%rcx, 0x7f0(%rbp)
1401b5b2f:     	movups	0x18(%rcx), %xmm0
1401b5b33:     	movups	%xmm0, 0x780(%rbp)
1401b5b3a:     	movq	%rax, 0x790(%rbp)
1401b5b41:     	movq	(%r8), %rax
1401b5b44:     	movq	%rax, 0x7c8(%rbp)
1401b5b4b:     	leaq	0x4c8(%rbp), %r15
1401b5b52:     	leaq	0x6e4(%rbp), %rbx
1401b5b59:     	leaq	0x2b8(%rbp), %rax
1401b5b60:     	leaq	0x468(%rbp), %r13
1401b5b67:     	xorl	%r9d, %r9d
1401b5b6a:     	pxor	%xmm11, %xmm11
1401b5b6f:     	movdqu	0x5c02dd1(%rip), %xmm0  # 0x145db8948
1401b5b77:     	movdqu	0x5c02db9(%rip), %xmm1  # 0x145db8938
1401b5b7f:     	movdqu	0x5c02de1(%rip), %xmm2  # 0x145db8968
1401b5b87:     	movdqu	0x5c02dc9(%rip), %xmm3  # 0x145db8958
1401b5b8f:     	movdqu	0x5c02df1(%rip), %xmm4  # 0x145db8988
1401b5b97:     	movdqu	0x5c02dd9(%rip), %xmm5  # 0x145db8978
1401b5b9f:     	movdqu	0x5c02e01(%rip), %xmm7  # 0x145db89a8
1401b5ba7:     	movdqu	0x5c02de8(%rip), %xmm8  # 0x145db8998
1401b5bb0:     	movups	0x5c02cc8(%rip), %xmm14 # 0x145db8880
1401b5bb8:     	movups	0x5c02cd8(%rip), %xmm9  # 0x145db8898
1401b5bc0:     	movups	0x5c02ce8(%rip), %xmm10 # 0x145db88b0
1401b5bc8:     	movups	0x5c02cf9(%rip), %xmm6  # 0x145db88c8
1401b5bcf:     	movaps	0x5bb7689(%rip), %xmm15 # 0x145d6d260
1401b5bd7:     	movd	0x5bbb05c(%rip), %xmm12 # 0x145d70c3c
1401b5be0:     	leaq	0x200(%rbp), %rdx
1401b5be7:     	leaq	0x738(%rbp), %rdi
1401b5bee:     	movdqa	0x5bb7589(%rip), %xmm13 # 0x145d6d180
1401b5bf7:     	movq	%r9, 0x7f8(%rbp)
1401b5bfe:     	movdqu	%xmm11, -0x18(%rax)
1401b5c04:     	movdqu	%xmm11, -0x28(%rax)
1401b5c0a:     	movdqu	%xmm11, -0x38(%rax)
1401b5c10:     	movdqu	%xmm11, -0x48(%rax)
1401b5c16:     	movdqu	%xmm11, -0x58(%rax)
1401b5c1c:     	movq	$0x0, -0x8(%rax)
1401b5c24:     	movw	$0x0, 0x11c(%r15)
1401b5c2e:     	movl	$0x0, 0x118(%r15)
1401b5c39:     	movdqu	%xmm0, 0x10(%rax)
1401b5c3e:     	movdqu	%xmm1, (%rax)
1401b5c42:     	movdqu	%xmm2, 0x30(%rax)
1401b5c47:     	movdqu	%xmm3, 0x20(%rax)
1401b5c4c:     	movdqu	%xmm4, 0x50(%rax)
1401b5c51:     	movdqu	%xmm5, 0x40(%rax)
1401b5c56:     	movdqu	%xmm7, 0x70(%rax)
1401b5c5b:     	movdqu	%xmm8, 0x60(%rax)
1401b5c61:     	movaps	%xmm14, 0x200(%rbp)
1401b5c69:     	movq	$0x0, 0x210(%rbp)
1401b5c74:     	movups	%xmm9, -0xa0(%rax)
1401b5c7c:     	movq	$0x0, -0x90(%rax)
1401b5c87:     	movups	%xmm10, -0x88(%rax)
1401b5c8f:     	movq	$0x0, -0x78(%rax)
1401b5c97:     	movups	%xmm6, -0x70(%rax)
1401b5c9b:     	movq	$0x0, -0x60(%rax)
1401b5ca3:     	movl	$0x138, %r8d            # imm = 0x138
1401b5ca9:     	movq	%r13, %rcx
1401b5cac:     	movdqa	%xmm1, %xmm7
1401b5cb0:     	movdqa	%xmm3, %xmm8
1401b5cb5:     	callq	0x145bc977b <.text+0x5bc877b>
1401b5cba:     	movups	%xmm15, 0x5a0(%rbp)
1401b5cc2:     	movl	$0x1, 0x5b0(%rbp)
1401b5ccc:     	movq	%xmm12, 0x5b4(%rbp)
1401b5cd5:     	movb	$0x1, 0x5bc(%rbp)
1401b5cdc:     	movq	$0x0, 0x5c0(%rbp)
1401b5ce7:     	movl	$0x3f800000, 0x5c8(%rbp) # imm = 0x3F800000
1401b5cf1:     	movw	$0x0, 0x5cc(%rbp)
1401b5cfa:     	movl	$0x10000, 0x106(%r15)   # imm = 0x10000
1401b5d05:     	movw	$0x0, 0x10a(%r15)
1401b5d0f:     	movw	$0x0, 0x110(%r15)
1401b5d19:     	movl	$0x10000, 0x10c(%r15)   # imm = 0x10000
1401b5d24:     	movw	$0x0, 0x116(%r15)
1401b5d2e:     	movl	$0x0, 0x112(%r15)
1401b5d39:     	movq	%rsi, %r15
1401b5d3c:     	movq	%rsi, 0x460(%rbp)
1401b5d43:     	movq	%rdi, %rcx
1401b5d46:     	movq	%r14, %rdx
1401b5d49:     	leaq	0x460(%rbp), %r8
1401b5d50:     	callq	0x140189f40 <.text+0x188f40>
1401b5d55:     	movdqa	%xmm8, %xmm3
1401b5d5a:     	movdqu	0x5c02c06(%rip), %xmm2  # 0x145db8968
1401b5d62:     	movdqa	%xmm7, %xmm1
1401b5d66:     	movdqu	0x5c02bda(%rip), %xmm0  # 0x145db8948
1401b5d6e:     	movq	0x7f8(%rbp), %r9
1401b5d75:     	movq	0x10(%r12,%r9), %rax
1401b5d7a:     	testq	%rax, %rax
1401b5d7d:     	movaps	%xmm10, %xmm9
1401b5d81:     	movaps	%xmm6, %xmm10
1401b5d85:     	xorps	%xmm6, %xmm6
1401b5d88:     	movaps	0x5bf3110(%rip), %xmm14 # 0x145da8ea0
1401b5d90:     	movl	$0x15, %r8d
1401b5d96:     	movdqa	0x5bb74f1(%rip), %xmm11 # 0x145d6d290
1401b5d9f:     	movdqa	0x5bb7898(%rip), %xmm12 # 0x145d6d640
1401b5da8:     	je	0x1401b6410 <.text+0x1b5410>
1401b5dae:     	movq	0x738(%rbp), %rdx
1401b5db5:     	movq	%rdx, 0x7b8(%rbp)
1401b5dbc:     	movq	0x748(%rbp), %rdx
1401b5dc3:     	movq	%rdx, 0x7c0(%rbp)
1401b5dca:     	movq	0x750(%rbp), %rdx
1401b5dd1:     	movq	%rdx, 0x7b0(%rbp)
1401b5dd8:     	movq	0x758(%rbp), %rdx
1401b5ddf:     	movq	%rdx, 0x7e8(%rbp)
1401b5de6:     	movq	0x8(%r12,%r9), %rdx
1401b5deb:     	leaq	(%rax,%rax,2), %rax
1401b5def:     	leaq	(%rdx,%rax,8), %rax
1401b5df3:     	movw	$0x0, 0x5c4(%rbp)
1401b5dfc:     	movb	$0x1, 0x5b4(%rbp)
1401b5e03:     	leaq	0x4c8(%rbp), %rcx
1401b5e0a:     	movups	%xmm6, 0x10(%rcx)
1401b5e0e:     	movups	%xmm6, (%rcx)
1401b5e11:     	movups	%xmm14, 0x4e8(%rbp)
1401b5e19:     	movq	$0x0, 0x4c0(%rbp)
1401b5e24:     	movups	%xmm6, 0x40(%rcx)
1401b5e28:     	movups	%xmm6, 0x30(%rcx)
1401b5e2c:     	movw	$0x0, 0x114(%rcx)
1401b5e35:     	movl	$0x0, 0x110(%rcx)
1401b5e3f:     	movdqu	%xmm0, 0x60(%rcx)
1401b5e44:     	movdqu	%xmm1, 0x50(%rcx)
1401b5e49:     	movdqu	%xmm3, 0x70(%rcx)
1401b5e4e:     	movdqu	%xmm2, 0x80(%rcx)
1401b5e56:     	movdqu	%xmm11, 0x558(%rbp)
1401b5e5f:     	movdqu	%xmm11, 0x568(%rbp)
1401b5e68:     	movdqu	%xmm12, 0x578(%rbp)
1401b5e71:     	movdqu	%xmm12, 0x588(%rbp)
1401b5e7a:     	movw	$0x0, 0x5d6(%rbp)
1401b5e83:     	movl	$0x0, 0x5d2(%rbp)
1401b5e8d:     	movq	$0x0, 0x5b8(%rbp)
1401b5e98:     	movl	$0x3f800000, 0x5c0(%rbp) # imm = 0x3F800000
1401b5ea2:     	movups	%xmm15, 0x598(%rbp)
1401b5eaa:     	movl	$0x1, 0x5a8(%rbp)
1401b5eb4:     	movq	$0x0, 0x5ac(%rbp)
1401b5ebf:     	movups	0x5c029ba(%rip), %xmm0  # 0x145db8880
1401b5ec6:     	movaps	%xmm0, 0x460(%rbp)
1401b5ecd:     	movq	$0x0, 0x470(%rbp)
1401b5ed8:     	movups	0x5c029b9(%rip), %xmm0  # 0x145db8898
1401b5edf:     	movups	%xmm0, -0x50(%rcx)
1401b5ee3:     	movq	$0x0, -0x40(%rcx)
1401b5eeb:     	movups	%xmm9, -0x38(%rcx)
1401b5ef0:     	movq	$0x0, -0x28(%rcx)
1401b5ef8:     	movups	%xmm10, -0x20(%rcx)
1401b5efd:     	movq	$0x0, -0x10(%rcx)
1401b5f05:     	movl	$0x10000, 0xfe(%rcx)    # imm = 0x10000
1401b5f0f:     	movw	$0x0, 0x102(%rcx)
1401b5f18:     	movw	$0x0, 0x108(%rcx)
1401b5f21:     	movl	$0x10000, 0x104(%rcx)   # imm = 0x10000
1401b5f2b:     	movdqu	0x5c02c15(%rip), %xmm0  # 0x145db8b48
1401b5f33:     	movdqa	%xmm0, 0x6d0(%rbp)
1401b5f3b:     	movl	$0x3f800000, 0x6e0(%rbp) # imm = 0x3F800000
1401b5f45:     	movdqu	%xmm0, (%rbx)
1401b5f49:     	movl	$0x3f800000, 0x10(%rbx) # imm = 0x3F800000
1401b5f50:     	movdqu	%xmm0, 0x14(%rbx)
1401b5f55:     	movl	$0x3f800000, 0x24(%rbx) # imm = 0x3F800000
1401b5f5c:     	movdqu	%xmm0, 0x28(%rbx)
1401b5f61:     	movl	$0x3f800000, 0x38(%rbx) # imm = 0x3F800000
1401b5f68:     	movq	0x10(%rdx), %rsi
1401b5f6c:     	testq	%rsi, %rsi
1401b5f6f:     	movq	%rsi, %rbx
1401b5f72:     	cmoveq	%r8, %rbx
1401b5f76:     	testq	%rbx, %rbx
1401b5f79:     	js	0x1401b64ed <.text+0x1b54ed>
1401b5f7f:     	movq	%rax, 0x7e0(%rbp)
1401b5f86:     	movq	%r15, 0x7d8(%rbp)
1401b5f8d:     	movq	%r12, 0x7d0(%rbp)
1401b5f94:     	movq	%rdx, %r14
1401b5f97:     	movq	0x8(%rdx), %r12
1401b5f9b:     	callq	0x140002200 <.text+0x1200>
1401b5fa0:     	movl	$0x1, %edi
1401b5fa5:     	movl	$0x1, %edx
1401b5faa:     	movq	%rbx, %rcx
1401b5fad:     	callq	0x1400021c0 <.text+0x11c0>
1401b5fb2:     	testq	%rax, %rax
1401b5fb5:     	je	0x1401b64ef <.text+0x1b54ef>
1401b5fbb:     	movq	%rax, %r13
1401b5fbe:     	testq	%rsi, %rsi
1401b5fc1:     	leaq	0x5bb8f5c(%rip), %rax   # 0x145d6ef24
1401b5fc8:     	cmoveq	%rax, %r12
1401b5fcc:     	movq	%r13, %rcx
1401b5fcf:     	movq	%r12, %rdx
1401b5fd2:     	movq	%rbx, %r8
1401b5fd5:     	callq	0x145bc977b <.text+0x5bc877b>
1401b5fda:     	cmpq	$0x8, %rbx
1401b5fde:     	jae	0x1401b6000 <.text+0x1b5000>
1401b5fe0:     	xorl	%eax, %eax
1401b5fe2:     	leaq	0x200(%rbp), %rdi
1401b5fe9:     	leaq	0x798(%rbp), %r12
1401b5ff0:     	jmp	0x1401b6140 <.text+0x1b5140>
1401b5ff5:     	nopw	%cs:(%rax,%rax)
1401b6000:     	cmpq	$0x20, %rbx
1401b6004:     	leaq	0x200(%rbp), %rdi
1401b600b:     	leaq	0x798(%rbp), %r12
1401b6012:     	movdqa	0x5bb71e6(%rip), %xmm5  # 0x145d6d200
1401b601a:     	jae	0x1401b6023 <.text+0x1b5023>
1401b601c:     	xorl	%eax, %eax
1401b601e:     	jmp	0x1401b60d3 <.text+0x1b50d3>
1401b6023:     	movq	%rbx, %rax
1401b6026:     	movabsq	$0x7fffffffffffffe0, %rcx # imm = 0x7FFFFFFFFFFFFFE0
1401b6030:     	andq	%rcx, %rax
1401b6033:     	xorl	%ecx, %ecx
1401b6035:     	movdqa	0x5bb7122(%rip), %xmm12 # 0x145d6d160
1401b603e:     	movdqa	0x5bb7129(%rip), %xmm11 # 0x145d6d170
1401b6047:     	nopw	(%rax,%rax)
1401b6050:     	movdqu	(%r13,%rcx), %xmm0
1401b6057:     	movdqu	0x10(%r13,%rcx), %xmm1
1401b605e:     	movdqa	%xmm0, %xmm2
1401b6062:     	paddb	%xmm12, %xmm2
1401b6067:     	movdqa	%xmm1, %xmm3
1401b606b:     	paddb	%xmm12, %xmm3
1401b6070:     	movdqa	%xmm2, %xmm4
1401b6074:     	pminub	%xmm11, %xmm4
1401b6079:     	pcmpeqb	%xmm2, %xmm4
1401b607d:     	pand	%xmm13, %xmm4
1401b6082:     	movdqa	%xmm3, %xmm2
1401b6086:     	pminub	%xmm11, %xmm2
1401b608b:     	pcmpeqb	%xmm3, %xmm2
1401b608f:     	pand	%xmm13, %xmm2
1401b6094:     	por	%xmm0, %xmm4
1401b6098:     	por	%xmm1, %xmm2
1401b609c:     	movdqu	%xmm4, (%r13,%rcx)
1401b60a3:     	movdqu	%xmm2, 0x10(%r13,%rcx)
1401b60aa:     	addq	$0x20, %rcx
1401b60ae:     	cmpq	%rcx, %rax
1401b60b1:     	jne	0x1401b6050 <.text+0x1b5050>
1401b60b3:     	cmpq	%rax, %rbx
1401b60b6:     	movdqa	0x5bb71d1(%rip), %xmm11 # 0x145d6d290
1401b60bf:     	movdqa	0x5bb7578(%rip), %xmm12 # 0x145d6d640
1401b60c8:     	je	0x1401b6161 <.text+0x1b5161>
1401b60ce:     	testb	$0x18, %bl
1401b60d1:     	je	0x1401b6140 <.text+0x1b5140>
1401b60d3:     	movq	%rax, %rcx
1401b60d6:     	movq	%rbx, %rax
1401b60d9:     	movabsq	$0x7ffffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFFF8
1401b60e3:     	andq	%rdx, %rax
1401b60e6:     	movdqa	0x5bb70f2(%rip), %xmm3  # 0x145d6d1e0
1401b60ee:     	movdqa	0x5bb70fa(%rip), %xmm4  # 0x145d6d1f0
1401b60f6:     	nopw	%cs:(%rax,%rax)
1401b6100:     	movq	(%r13,%rcx), %xmm0
1401b6107:     	movdqa	%xmm0, %xmm1
1401b610b:     	paddb	%xmm3, %xmm1
1401b610f:     	movdqa	%xmm1, %xmm2
1401b6113:     	pmaxub	%xmm4, %xmm2
1401b6117:     	pcmpeqb	%xmm1, %xmm2
1401b611b:     	pandn	%xmm5, %xmm2
1401b611f:     	por	%xmm0, %xmm2
1401b6123:     	movq	%xmm2, (%r13,%rcx)
1401b612a:     	addq	$0x8, %rcx
1401b612e:     	cmpq	%rcx, %rax
1401b6131:     	jne	0x1401b6100 <.text+0x1b5100>
1401b6133:     	jmp	0x1401b615c <.text+0x1b515c>
1401b6135:     	nopw	%cs:(%rax,%rax)
1401b6140:     	movzbl	(%r13,%rax), %ecx
1401b6146:     	leal	-0x41(%rcx), %edx
1401b6149:     	cmpb	$0x1a, %dl
1401b614c:     	setb	%dl
1401b614f:     	shlb	$0x5, %dl
1401b6152:     	orb	%cl, %dl
1401b6154:     	movb	%dl, (%r13,%rax)
1401b6159:     	incq	%rax
1401b615c:     	cmpq	%rax, %rbx
1401b615f:     	jne	0x1401b6140 <.text+0x1b5140>
1401b6161:     	movq	%rbx, 0x200(%rbp)
1401b6168:     	movq	%r13, 0x208(%rbp)
1401b616f:     	movq	%rbx, 0x210(%rbp)
1401b6176:     	movq	%rdi, 0x798(%rbp)
1401b617d:     	leaq	-0x1b40a4(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1401b6184:     	movq	%rax, 0x7a0(%rbp)
1401b618b:     	leaq	0x720(%rbp), %rcx
1401b6192:     	leaq	0x5bb8da0(%rip), %rdx   # 0x145d6ef39
1401b6199:     	movq	%r12, %r8
1401b619c:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401b61a1:     	nop
1401b61a2:     	movq	0x200(%rbp), %rdx
1401b61a9:     	testq	%rdx, %rdx
1401b61ac:     	leaq	0x460(%rbp), %rsi
1401b61b3:     	movq	0x7b0(%rbp), %r13
1401b61ba:     	je	0x1401b61ce <.text+0x1b51ce>
1401b61bc:     	movq	0x208(%rbp), %rcx
1401b61c3:     	movl	$0x1, %r8d
1401b61c9:     	callq	0x1400021d0 <.text+0x11d0>
1401b61ce:     	movq	0x730(%rbp), %rax
1401b61d5:     	movq	%rax, 0x210(%rbp)
1401b61dc:     	movdqu	0x720(%rbp), %xmm0
1401b61e4:     	movdqa	%xmm0, 0x200(%rbp)
1401b61ec:     	leaq	0x5bf6c55(%rip), %rax   # 0x145dace48
1401b61f3:     	movq	%rax, 0x20(%rsp)
1401b61f8:     	movl	$0x1, %r9d
1401b61fe:     	movq	%r12, %rcx
1401b6201:     	movq	0x7c8(%rbp), %rdx
1401b6208:     	movq	%rdi, %r8
1401b620b:     	callq	0x1401471a0 <.text+0x1461a0>
1401b6210:     	nop
1401b6211:     	movq	%rdi, %rcx
1401b6214:     	movq	%r12, %rdx
1401b6217:     	callq	0x1426d6630 <.text+0x26d5630>
1401b621c:     	nop
1401b621d:     	movl	$0x180, %r8d            # imm = 0x180
1401b6223:     	leaq	-0x58(%rbp), %rbx
1401b6227:     	movq	%rbx, %rcx
1401b622a:     	movq	%rsi, %rdx
1401b622d:     	callq	0x145bc977b <.text+0x5bc877b>
1401b6232:     	movaps	0x6d0(%rbp), %xmm0
1401b6239:     	movaps	0x6e0(%rbp), %xmm1
1401b6240:     	movaps	0x6f0(%rbp), %xmm2
1401b6247:     	movaps	0x700(%rbp), %xmm3
1401b624e:     	leaq	0x128(%rbp), %rax
1401b6255:     	movups	%xmm0, (%rax)
1401b6258:     	movups	%xmm1, 0x10(%rax)
1401b625c:     	movups	%xmm2, 0x20(%rax)
1401b6260:     	movups	%xmm3, 0x30(%rax)
1401b6264:     	movaps	0x710(%rbp), %xmm0
1401b626b:     	movups	%xmm0, 0x40(%rax)
1401b626f:     	movl	$0x88, %r8d
1401b6275:     	leaq	0x178(%rbp), %rcx
1401b627c:     	movq	%rdi, %rdx
1401b627f:     	callq	0x145bc977b <.text+0x5bc877b>
1401b6284:     	movl	$0x258, %r8d            # imm = 0x258
1401b628a:     	leaq	0x208(%rbp), %rcx
1401b6291:     	movq	%rbx, %rdx
1401b6294:     	callq	0x145bc977b <.text+0x5bc877b>
1401b6299:     	movq	0x7b8(%rbp), %rax
1401b62a0:     	movq	%rax, 0x200(%rbp)
1401b62a7:     	movb	$0x1, 0x807(%rbp)
1401b62ae:     	movq	0x7c0(%rbp), %rcx
1401b62b5:     	callq	0x144e07d20 <.text+0x4e06d20>
1401b62ba:     	nop
1401b62bb:     	movq	%rax, %rbx
1401b62be:     	movl	$0x260, %r8d            # imm = 0x260
1401b62c4:     	movq	%rsi, %rcx
1401b62c7:     	movq	%rdi, %rdx
1401b62ca:     	testq	%r13, %r13
1401b62cd:     	je	0x1401b62fc <.text+0x1b52fc>
1401b62cf:     	callq	0x145bc977b <.text+0x5bc877b>
1401b62d4:     	movq	%rbx, 0x6c0(%rbp)
1401b62db:     	movq	(%r13), %rax
1401b62df:     	movq	%r13, %r12
1401b62e2:     	movq	0x10(%r13), %r13
1401b62e6:     	subq	%r13, %rax
1401b62e9:     	cmpq	$0x26f, %rax            # imm = 0x26F
1401b62ef:     	jbe	0x1401b63c3 <.text+0x1b53c3>
1401b62f5:     	movq	0x8(%r12), %rsi
1401b62fa:     	jmp	0x1401b632c <.text+0x1b532c>
1401b62fc:     	callq	0x145bc977b <.text+0x5bc877b>
1401b6301:     	movq	%rbx, 0x6c0(%rbp)
1401b6308:     	movq	0x7e8(%rbp), %rsi
1401b630f:     	movq	(%rsi), %rax
1401b6312:     	movq	0x10(%rsi), %r13
1401b6316:     	subq	%r13, %rax
1401b6319:     	cmpq	$0x26f, %rax            # imm = 0x26F
1401b631f:     	jbe	0x1401b63e9 <.text+0x1b53e9>
1401b6325:     	movq	%rsi, %r12
1401b6328:     	movq	0x8(%rsi), %rsi
1401b632c:     	leaq	0x6e3ed(%rip), %rax     # 0x140224720 <.text+0x223720>
1401b6333:     	movq	%rax, (%rsi,%r13)
1401b6337:     	leaq	(%rsi,%r13), %rcx
1401b633b:     	addq	$0x8, %rcx
1401b633f:     	movl	$0x260, %r8d            # imm = 0x260
1401b6345:     	movq	%rdi, %rdx
1401b6348:     	callq	0x145bc977b <.text+0x5bc877b>
1401b634d:     	movq	%rbx, 0x268(%rsi,%r13)
1401b6355:     	addq	$0x270, %r13            # imm = 0x270
1401b635c:     	movq	%r13, 0x10(%r12)
1401b6361:     	movq	%r14, %rdx
1401b6364:     	addq	$0x18, %rdx
1401b6368:     	movq	0x7e0(%rbp), %rax
1401b636f:     	cmpq	%rax, %rdx
1401b6372:     	movq	0x7d0(%rbp), %r12
1401b6379:     	movq	0x7d8(%rbp), %r15
1401b6380:     	leaq	0x770(%rbp), %r14
1401b6387:     	leaq	0x6e4(%rbp), %rbx
1401b638e:     	leaq	0x468(%rbp), %r13
1401b6395:     	movq	0x7f8(%rbp), %r9
1401b639c:     	movdqu	0x5c025a4(%rip), %xmm0  # 0x145db8948
1401b63a4:     	movdqa	%xmm7, %xmm1
1401b63a8:     	movdqu	0x5c025b8(%rip), %xmm2  # 0x145db8968
1401b63b0:     	movdqa	%xmm8, %xmm3
1401b63b5:     	movl	$0x15, %r8d
1401b63bb:     	jne	0x1401b5df3 <.text+0x1b4df3>
1401b63c1:     	jmp	0x1401b6410 <.text+0x1b5410>
1401b63c3:     	movq	$0x1, 0x20(%rsp)
1401b63cc:     	movl	$0x270, %r8d            # imm = 0x270
1401b63d2:     	movl	$0x1, %r9d
1401b63d8:     	movq	%r12, %rcx
1401b63db:     	movq	%r13, %rdx
1401b63de:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b63e3:     	nop
1401b63e4:     	jmp	0x1401b62f5 <.text+0x1b52f5>
1401b63e9:     	movq	$0x1, 0x20(%rsp)
1401b63f2:     	movl	$0x270, %r8d            # imm = 0x270
1401b63f8:     	movl	$0x1, %r9d
1401b63fe:     	movq	%rsi, %rcx
1401b6401:     	movq	%r13, %rdx
1401b6404:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b6409:     	nop
1401b640a:     	jmp	0x1401b6325 <.text+0x1b5325>
1401b640f:     	nop
1401b6410:     	addq	$0x18, %r9
1401b6414:     	cmpq	$0x30, %r9
1401b6418:     	movdqu	0x5c02568(%rip), %xmm4  # 0x145db8988
1401b6420:     	movdqu	0x5c02550(%rip), %xmm5  # 0x145db8978
1401b6428:     	movdqu	0x5c02578(%rip), %xmm7  # 0x145db89a8
1401b6430:     	movdqu	0x5c0255f(%rip), %xmm8  # 0x145db8998
1401b6439:     	movups	0x5c0243f(%rip), %xmm14 # 0x145db8880
1401b6441:     	movd	0x5bba7f2(%rip), %xmm12 # 0x145d70c3c
1401b644a:     	pxor	%xmm11, %xmm11
1401b644f:     	movaps	%xmm10, %xmm6
1401b6453:     	movaps	%xmm9, %xmm10
1401b6457:     	movups	0x5c02439(%rip), %xmm9  # 0x145db8898
1401b645f:     	leaq	0x200(%rbp), %rdx
1401b6466:     	leaq	0x738(%rbp), %rdi
1401b646d:     	leaq	0x2b8(%rbp), %rax
1401b6474:     	movq	%r15, %rsi
1401b6477:     	leaq	0x4c8(%rbp), %r15
1401b647e:     	jne	0x1401b5bf7 <.text+0x1b4bf7>
1401b6484:     	movq	0x7f0(%rbp), %rax
1401b648b:     	movaps	0x810(%rbp), %xmm6
1401b6492:     	movaps	0x820(%rbp), %xmm7
1401b6499:     	movaps	0x830(%rbp), %xmm8
1401b64a1:     	movaps	0x840(%rbp), %xmm9
1401b64a9:     	movaps	0x850(%rbp), %xmm10
1401b64b1:     	movaps	0x860(%rbp), %xmm11
1401b64b9:     	movaps	0x870(%rbp), %xmm12
1401b64c1:     	movaps	0x880(%rbp), %xmm13
1401b64c9:     	movaps	0x890(%rbp), %xmm14
1401b64d1:     	movaps	0x8a0(%rbp), %xmm15
1401b64d9:     	addq	$0x938, %rsp            # imm = 0x938
1401b64e0:     	popq	%rbx
1401b64e1:     	popq	%rdi
1401b64e2:     	popq	%rsi
1401b64e3:     	popq	%r12
1401b64e5:     	popq	%r13
1401b64e7:     	popq	%r14
1401b64e9:     	popq	%r15
1401b64eb:     	popq	%rbp
1401b64ec:     	retq
1401b64ed:     	xorl	%edi, %edi
1401b64ef:     	movq	%rdi, %rcx
1401b64f2:     	movq	%rbx, %rdx
1401b64f5:     	callq	0x145d6944b <.text+0x5d6844b>
1401b64fa:     	nop
1401b64fb:     	ud2
