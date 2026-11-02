
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140930a20:     	pushq	%rbp
140930a21:     	pushq	%r15
140930a23:     	pushq	%r14
140930a25:     	pushq	%r12
140930a27:     	pushq	%rsi
140930a28:     	pushq	%rdi
140930a29:     	pushq	%rbx
140930a2a:     	subq	$0x660, %rsp            # imm = 0x660
140930a31:     	leaq	0x80(%rsp), %rbp
140930a39:     	movq	$-0x2, 0x5d8(%rbp)
140930a44:     	movq	%rdx, %rsi
140930a47:     	leaq	0x40(%rdx), %rdi
140930a4b:     	leaq	0x5a8(%rdx), %r12
140930a52:     	movq	%rdi, 0x5b8(%rbp)
140930a59:     	movq	%r12, 0x5c0(%rbp)
140930a60:     	movq	$0x0, 0x5a0(%rbp)
140930a6b:     	movq	$0x8, 0x5a8(%rbp)
140930a76:     	movq	$0x0, 0x5b0(%rbp)
140930a81:     	cmpq	$0x0, 0x90(%rdx)
140930a89:     	je	0x140930b3b <.text+0x92fb3b>
140930a8f:     	movabsq	$0x3e96bbc955e649b6, %rcx # imm = 0x3E96BBC955E649B6
140930a99:     	movq	0x78(%rsi), %rax
140930a9d:     	movq	0x80(%rsi), %rdx
140930aa4:     	xorl	%r8d, %r8d
140930aa7:     	movdqa	0x4fe27d1(%rip), %xmm0  # 0x145913280
140930aaf:     	pcmpeqd	%xmm1, %xmm1
140930ab3:     	movdqa	0x50c3525(%rip), %xmm2  # 0x1459f3fe0
140930abb:     	andq	%rdx, %rcx
140930abe:     	movdqu	(%rax,%rcx), %xmm3
140930ac3:     	movdqa	%xmm3, %xmm4
140930ac7:     	pcmpeqb	%xmm0, %xmm4
140930acb:     	pmovmskb	%xmm4, %r9d
140930ad0:     	testl	%r9d, %r9d
140930ad3:     	je	0x140930b20 <.text+0x92fb20>
140930ad5:     	tzcntl	%r9d, %r10d
140930ada:     	addq	%rcx, %r10
140930add:     	andq	%rdx, %r10
140930ae0:     	negq	%r10
140930ae3:     	leaq	(%r10,%r10,2), %r10
140930ae7:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140930aee:     	pcmpeqb	%xmm2, %xmm4
140930af2:     	pmovmskb	%xmm4, %r11d
140930af7:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140930afe:     	je	0x140930bef <.text+0x92fbef>
140930b04:     	leal	-0x1(%r9), %r10d
140930b08:     	andw	%r9w, %r10w
140930b0c:     	movl	%r10d, %r9d
140930b0f:     	jne	0x140930ad5 <.text+0x92fad5>
140930b11:     	nopw	%cs:(%rax,%rax)
140930b20:     	pcmpeqb	%xmm1, %xmm3
140930b24:     	pmovmskb	%xmm3, %r9d
140930b29:     	testl	%r9d, %r9d
140930b2c:     	jne	0x140930b3b <.text+0x92fb3b>
140930b2e:     	addq	%r8, %rcx
140930b31:     	addq	$0x10, %rcx
140930b35:     	addq	$0x10, %r8
140930b39:     	jmp	0x140930abb <.text+0x92fabb>
140930b3b:     	movzbl	0xa0(%rsi), %eax
140930b42:     	movq	0xe0(%rsi), %rax
140930b49:     	movq	0xe8(%rsi), %rcx
140930b50:     	movabsq	$0x3e96bbc955e649b6, %rdx # imm = 0x3E96BBC955E649B6
140930b5a:     	xorl	%r8d, %r8d
140930b5d:     	movdqa	0x4fe271b(%rip), %xmm0  # 0x145913280
140930b65:     	pcmpeqd	%xmm1, %xmm1
140930b69:     	movdqa	0x50c346f(%rip), %xmm2  # 0x1459f3fe0
140930b71:     	andq	%rcx, %rdx
140930b74:     	movdqu	(%rax,%rdx), %xmm3
140930b79:     	movdqa	%xmm3, %xmm4
140930b7d:     	pcmpeqb	%xmm0, %xmm4
140930b81:     	pmovmskb	%xmm4, %r11d
140930b86:     	testl	%r11d, %r11d
140930b89:     	je	0x140930bd0 <.text+0x92fbd0>
140930b8b:     	tzcntl	%r11d, %r10d
140930b90:     	addq	%rdx, %r10
140930b93:     	andq	%rcx, %r10
140930b96:     	movq	%r10, %rbx
140930b99:     	shlq	$0x7, %rbx
140930b9d:     	movq	%rax, %r9
140930ba0:     	subq	%rbx, %r9
140930ba3:     	movdqu	-0x80(%r9), %xmm4
140930ba9:     	pcmpeqb	%xmm2, %xmm4
140930bad:     	pmovmskb	%xmm4, %ebx
140930bb1:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
140930bb7:     	je	0x140930c0c <.text+0x92fc0c>
140930bb9:     	leal	-0x1(%r11), %r9d
140930bbd:     	andw	%r11w, %r9w
140930bc1:     	movl	%r9d, %r11d
140930bc4:     	jne	0x140930b8b <.text+0x92fb8b>
140930bc6:     	nopw	%cs:(%rax,%rax)
140930bd0:     	pcmpeqb	%xmm1, %xmm3
140930bd4:     	pmovmskb	%xmm3, %r9d
140930bd9:     	testl	%r9d, %r9d
140930bdc:     	jne	0x140930c7f <.text+0x92fc7f>
140930be2:     	addq	%r8, %rdx
140930be5:     	addq	$0x10, %rdx
140930be9:     	addq	$0x10, %r8
140930bed:     	jmp	0x140930b71 <.text+0x92fb71>
140930bef:     	leaq	(%rax,%r10,8), %rax
140930bf3:     	movq	-0x8(%rax), %r14
140930bf7:     	movq	0x5a0(%rbp), %rdx
140930bfe:     	testq	%rdx, %rdx
140930c01:     	jne	0x140930dcf <.text+0x92fdcf>
140930c07:     	jmp	0x140930de5 <.text+0x92fde5>
140930c0c:     	leaq	-0x10(%r10), %rdx
140930c10:     	andq	%rcx, %rdx
140930c13:     	movdqu	(%rax,%rdx), %xmm0
140930c18:     	pcmpeqd	%xmm1, %xmm1
140930c1c:     	pcmpeqb	%xmm1, %xmm0
140930c20:     	pmovmskb	%xmm0, %ecx
140930c24:     	movdqu	(%rax,%r10), %xmm0
140930c2a:     	pcmpeqb	%xmm1, %xmm0
140930c2e:     	pmovmskb	%xmm0, %r8d
140930c33:     	movw	$0x1f, %r11w
140930c38:     	bsrw	%cx, %r11w
140930c3d:     	xorl	$0xf, %r11d
140930c41:     	orl	$0x10000, %r8d          # imm = 0x10000
140930c48:     	tzcntl	%r8d, %r8d
140930c4d:     	addl	%r11d, %r8d
140930c50:     	movb	$-0x80, %cl
140930c52:     	cmpw	$0xf, %r8w
140930c57:     	ja	0x140930c62 <.text+0x92fc62>
140930c59:     	incq	0xf0(%rsi)
140930c60:     	movb	$-0x1, %cl
140930c62:     	movb	%cl, (%rax,%r10)
140930c66:     	movb	%cl, 0x10(%rax,%rdx)
140930c6a:     	decq	0xf8(%rsi)
140930c71:     	movq	-0x70(%r9), %rax
140930c75:     	cmpq	$0x2, %rax
140930c79:     	jne	0x140931265 <.text+0x930265>
140930c7f:     	movq	(%r12), %r14
140930c83:     	leaq	0x1(%r14), %rbx
140930c87:     	movq	%rbx, (%r12)
140930c8b:     	movw	$0x100, 0x580(%rbp)     # imm = 0x100
140930c94:     	movq	$0x1, 0x530(%rbp)
140930c9f:     	movdqu	0x50fe0a1(%rip), %xmm0  # 0x145a2ed48
140930ca7:     	movdqu	%xmm0, 0x538(%rbp)
140930caf:     	movq	$0x8, 0x558(%rbp)
140930cba:     	movq	$0x60, 0x560(%rbp)
140930cc5:     	leaq	-0x42b52c(%rip), %rax   # 0x1405057a0 <.text+0x5047a0>
140930ccc:     	movq	%rax, 0x578(%rbp)
140930cd3:     	movb	$0x1, 0x582(%rbp)
140930cda:     	movq	$0x0, 0x548(%rbp)
140930ce5:     	movb	$0x2, 0x568(%rbp)
140930cec:     	leaq	-0x60(%rbp), %rcx
140930cf0:     	leaq	0x530(%rbp), %r8
140930cf7:     	movq	%r14, %rdx
140930cfa:     	callq	0x144e52a20 <.text+0x4e51a20>
140930cff:     	nop
140930d00:     	cmpq	%rbx, 0x50(%rsi)
140930d04:     	jae	0x140930d19 <.text+0x92fd19>
140930d06:     	movb	$0x1, 0x5d7(%rbp)
140930d0d:     	movq	%rdi, %rcx
140930d10:     	movq	%rbx, %rdx
140930d13:     	callq	0x140196060 <.text+0x195060>
140930d18:     	nop
140930d19:     	movq	0x48(%rsi), %rax
140930d1d:     	imulq	$0x130, %r14, %rcx      # imm = 0x130
140930d24:     	leaq	(%rax,%rcx), %rbx
140930d28:     	cmpl	$0x2, (%rax,%rcx)
140930d2c:     	je	0x140930d9d <.text+0x92fd9d>
140930d2e:     	movq	%rbx, 0x5c8(%rbp)
140930d35:     	leaq	0x58(%rbx), %rcx
140930d39:     	callq	0x1408c5c50 <.text+0x8c4c50>
140930d3e:     	nop
140930d3f:     	movq	0x5c8(%rbp), %rbx
140930d46:     	movq	0xe8(%rbx), %rax
140930d4d:     	testq	%rax, %rax
140930d50:     	je	0x140930d7b <.text+0x92fd7b>
140930d52:     	movq	0xe0(%rbx), %rcx
140930d59:     	leaq	0x17(,%rax,8), %r8
140930d61:     	andq	$-0x10, %r8
140930d65:     	leaq	(%rax,%r8), %rdx
140930d69:     	addq	$0x11, %rdx
140930d6d:     	subq	%r8, %rcx
140930d70:     	movl	$0x10, %r8d
140930d76:     	callq	0x1400021d0 <.text+0x11d0>
140930d7b:     	movq	0xc8(%rbx), %rdx
140930d82:     	testq	%rdx, %rdx
140930d85:     	je	0x140930d9d <.text+0x92fd9d>
140930d87:     	movq	0xd0(%rbx), %rcx
140930d8e:     	shlq	$0x4, %rdx
140930d92:     	movl	$0x8, %r8d
140930d98:     	callq	0x1400021d0 <.text+0x11d0>
140930d9d:     	leaq	-0x60(%rbp), %rdx
140930da1:     	movl	$0x130, %r8d            # imm = 0x130
140930da7:     	movq	%rbx, %rcx
140930daa:     	callq	0x1457731ed <.text+0x57721ed>
140930daf:     	leaq	0x78(%rsi), %rcx
140930db3:     	leaq	0x50fdf8e(%rip), %rdx   # 0x145a2ed48
140930dba:     	movq	%r14, %r8
140930dbd:     	callq	0x14000ecd0 <.text+0xdcd0>
140930dc2:     	nop
140930dc3:     	movq	0x5a0(%rbp), %rdx
140930dca:     	testq	%rdx, %rdx
140930dcd:     	je	0x140930de5 <.text+0x92fde5>
140930dcf:     	movq	0x5a8(%rbp), %rcx
140930dd6:     	shlq	$0x3, %rdx
140930dda:     	movl	$0x8, %r8d
140930de0:     	callq	0x1400021d0 <.text+0x11d0>
140930de5:     	leaq	0x1d8(%rsi), %rbx
140930dec:     	cmpq	0x218(%rsi), %r14
140930df3:     	jae	0x140930e1e <.text+0x92fe1e>
140930df5:     	movq	0x210(%rsi), %rax
140930dfc:     	movq	(%rax,%r14,8), %rax
140930e00:     	testq	%rax, %rax
140930e03:     	je	0x140930e1e <.text+0x92fe1e>
140930e05:     	movq	0x1e0(%rsi), %rcx
140930e0c:     	notq	%rax
140930e0f:     	imulq	$0x38, %rax, %rax
140930e13:     	cmpb	$0x0, 0x30(%rcx,%rax)
140930e18:     	jne	0x140930f06 <.text+0x92ff06>
140930e1e:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
140930e23:     	movq	%rax, %r15
140930e26:     	cmpb	$0x1, 0x10(%rax)
140930e2a:     	jne	0x1409315ed <.text+0x9305ed>
140930e30:     	movq	(%r15), %rax
140930e33:     	movq	0x8(%r15), %rdx
140930e37:     	leaq	0x1(%rax), %rcx
140930e3b:     	movq	%rcx, (%r15)
140930e3e:     	movdqu	0x50ffd4a(%rip), %xmm0  # 0x145a30b90
140930e46:     	movdqu	%xmm0, 0x54c(%rbp)
140930e4e:     	movups	0x50ffd2b(%rip), %xmm1  # 0x145a30b80
140930e55:     	movups	%xmm1, 0x53c(%rbp)
140930e5c:     	movl	$0x0, -0x60(%rbp)
140930e63:     	movl	$0x0, -0x58(%rbp)
140930e6a:     	movups	0x530(%rbp), %xmm1
140930e71:     	movups	%xmm1, -0x54(%rbp)
140930e75:     	movdqu	0x540(%rbp), %xmm1
140930e7d:     	movdqu	%xmm1, -0x44(%rbp)
140930e82:     	movdqu	%xmm0, -0x38(%rbp)
140930e87:     	movq	%rax, -0x28(%rbp)
140930e8b:     	movq	%rdx, -0x20(%rbp)
140930e8f:     	pxor	%xmm0, %xmm0
140930e93:     	movdqu	%xmm0, -0x18(%rbp)
140930e98:     	movq	$0x0, -0xb(%rbp)
140930ea0:     	movb	$0x2, -0x3(%rbp)
140930ea4:     	movl	0x5b0(%rsi), %r15d
140930eab:     	movq	%rsi, %rcx
140930eae:     	callq	0x144e89050 <.text+0x4e88050>
140930eb3:     	movq	%r14, 0x5a0(%rbp)
140930eba:     	leaq	0x5a0(%rbp), %r9
140930ec1:     	movq	%rbx, %rcx
140930ec4:     	movq	%r14, %rdx
140930ec7:     	movq	%rdi, %r8
140930eca:     	callq	0x140ab2340 <.text+0xab1340>
140930ecf:     	movq	%rax, %r14
140930ed2:     	cmpb	$0x1, 0x30(%rax)
140930ed6:     	jne	0x140930ee8 <.text+0x92fee8>
140930ed8:     	leaq	-0x60(%rbp), %r8
140930edc:     	movq	%r14, %rcx
140930edf:     	xorl	%edx, %edx
140930ee1:     	callq	0x144e73fa0 <.text+0x4e72fa0>
140930ee6:     	jmp	0x140930f02 <.text+0x92ff02>
140930ee8:     	movq	0x8(%r14), %r8
140930eec:     	movq	0x10(%r14), %rcx
140930ef0:     	leaq	-0x60(%rbp), %rdx
140930ef4:     	callq	0x1457731e1 <.text+0x57721e1>
140930ef9:     	movl	%r15d, 0x28(%r14)
140930efd:     	movb	$0x1, 0x30(%r14)
140930f02:     	movl	%r15d, 0x2c(%r14)
140930f06:     	movq	%rdi, 0x5b8(%rbp)
140930f0d:     	movq	%r12, 0x5c0(%rbp)
140930f14:     	movq	$0x0, 0x5a0(%rbp)
140930f1f:     	movq	$0x8, 0x5a8(%rbp)
140930f2a:     	movq	$0x0, 0x5b0(%rbp)
140930f35:     	cmpq	$0x0, 0x90(%rsi)
140930f3d:     	je	0x140930feb <.text+0x92ffeb>
140930f43:     	movabsq	$-0x10c7a9fe0341267f, %rcx # imm = 0xEF385601FCBED981
140930f4d:     	movq	0x78(%rsi), %rax
140930f51:     	movq	0x80(%rsi), %rdx
140930f58:     	xorl	%r8d, %r8d
140930f5b:     	movdqa	0x501a68d(%rip), %xmm0  # 0x14594b5f0
140930f63:     	pcmpeqd	%xmm1, %xmm1
140930f67:     	movdqa	0x50c3461(%rip), %xmm2  # 0x1459f43d0
140930f6f:     	andq	%rdx, %rcx
140930f72:     	movdqu	(%rax,%rcx), %xmm3
140930f77:     	movdqa	%xmm3, %xmm4
140930f7b:     	pcmpeqb	%xmm0, %xmm4
140930f7f:     	pmovmskb	%xmm4, %r9d
140930f84:     	testl	%r9d, %r9d
140930f87:     	je	0x140930fd0 <.text+0x92ffd0>
140930f89:     	tzcntl	%r9d, %r10d
140930f8e:     	addq	%rcx, %r10
140930f91:     	andq	%rdx, %r10
140930f94:     	negq	%r10
140930f97:     	leaq	(%r10,%r10,2), %r10
140930f9b:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140930fa2:     	pcmpeqb	%xmm2, %xmm4
140930fa6:     	pmovmskb	%xmm4, %r11d
140930fab:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140930fb2:     	je	0x14093109f <.text+0x93009f>
140930fb8:     	leal	-0x1(%r9), %r10d
140930fbc:     	andw	%r9w, %r10w
140930fc0:     	movl	%r10d, %r9d
140930fc3:     	jne	0x140930f89 <.text+0x92ff89>
140930fc5:     	nopw	%cs:(%rax,%rax)
140930fd0:     	pcmpeqb	%xmm1, %xmm3
140930fd4:     	pmovmskb	%xmm3, %r9d
140930fd9:     	testl	%r9d, %r9d
140930fdc:     	jne	0x140930feb <.text+0x92ffeb>
140930fde:     	addq	%r8, %rcx
140930fe1:     	addq	$0x10, %rcx
140930fe5:     	addq	$0x10, %r8
140930fe9:     	jmp	0x140930f6f <.text+0x92ff6f>
140930feb:     	movzbl	0xa0(%rsi), %eax
140930ff2:     	movq	0xe0(%rsi), %rax
140930ff9:     	movq	0xe8(%rsi), %rcx
140931000:     	movabsq	$-0x10c7a9fe0341267f, %rdx # imm = 0xEF385601FCBED981
14093100a:     	xorl	%r8d, %r8d
14093100d:     	movdqa	0x501a5db(%rip), %xmm0  # 0x14594b5f0
140931015:     	pcmpeqd	%xmm1, %xmm1
140931019:     	movdqa	0x50c33af(%rip), %xmm2  # 0x1459f43d0
140931021:     	andq	%rcx, %rdx
140931024:     	movdqu	(%rax,%rdx), %xmm3
140931029:     	movdqa	%xmm3, %xmm4
14093102d:     	pcmpeqb	%xmm0, %xmm4
140931031:     	pmovmskb	%xmm4, %r11d
140931036:     	testl	%r11d, %r11d
140931039:     	je	0x140931080 <.text+0x930080>
14093103b:     	tzcntl	%r11d, %r10d
140931040:     	addq	%rdx, %r10
140931043:     	andq	%rcx, %r10
140931046:     	movq	%r10, %r14
140931049:     	shlq	$0x7, %r14
14093104d:     	movq	%rax, %r9
140931050:     	subq	%r14, %r9
140931053:     	movdqu	-0x80(%r9), %xmm4
140931059:     	pcmpeqb	%xmm2, %xmm4
14093105d:     	pmovmskb	%xmm4, %r14d
140931062:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
140931069:     	je	0x1409310ac <.text+0x9300ac>
14093106b:     	leal	-0x1(%r11), %r9d
14093106f:     	andw	%r11w, %r9w
140931073:     	movl	%r9d, %r11d
140931076:     	jne	0x14093103b <.text+0x93003b>
140931078:     	nopl	(%rax,%rax)
140931080:     	pcmpeqb	%xmm1, %xmm3
140931084:     	pmovmskb	%xmm3, %r9d
140931089:     	testl	%r9d, %r9d
14093108c:     	jne	0x14093111f <.text+0x93011f>
140931092:     	addq	%r8, %rdx
140931095:     	addq	$0x10, %rdx
140931099:     	addq	$0x10, %r8
14093109d:     	jmp	0x140931021 <.text+0x930021>
14093109f:     	leaq	(%rax,%r10,8), %rax
1409310a3:     	movq	-0x8(%rax), %r14
1409310a7:     	jmp	0x140931358 <.text+0x930358>
1409310ac:     	leaq	-0x10(%r10), %rdx
1409310b0:     	andq	%rcx, %rdx
1409310b3:     	movdqu	(%rax,%rdx), %xmm0
1409310b8:     	pcmpeqd	%xmm1, %xmm1
1409310bc:     	pcmpeqb	%xmm1, %xmm0
1409310c0:     	pmovmskb	%xmm0, %ecx
1409310c4:     	movdqu	(%rax,%r10), %xmm0
1409310ca:     	pcmpeqb	%xmm1, %xmm0
1409310ce:     	pmovmskb	%xmm0, %r8d
1409310d3:     	movw	$0x1f, %r11w
1409310d8:     	bsrw	%cx, %r11w
1409310dd:     	xorl	$0xf, %r11d
1409310e1:     	orl	$0x10000, %r8d          # imm = 0x10000
1409310e8:     	tzcntl	%r8d, %r8d
1409310ed:     	addl	%r11d, %r8d
1409310f0:     	movb	$-0x80, %cl
1409310f2:     	cmpw	$0xf, %r8w
1409310f7:     	ja	0x140931102 <.text+0x930102>
1409310f9:     	incq	0xf0(%rsi)
140931100:     	movb	$-0x1, %cl
140931102:     	movb	%cl, (%rax,%r10)
140931106:     	movb	%cl, 0x10(%rax,%rdx)
14093110a:     	decq	0xf8(%rsi)
140931111:     	movq	-0x70(%r9), %rax
140931115:     	cmpq	$0x2, %rax
140931119:     	jne	0x1409312d8 <.text+0x9302d8>
14093111f:     	movq	(%r12), %r14
140931123:     	leaq	0x1(%r14), %r15
140931127:     	movq	%r15, (%r12)
14093112b:     	movw	$0x100, 0x580(%rbp)     # imm = 0x100
140931134:     	movq	$0x1, 0x530(%rbp)
14093113f:     	movdqu	0x50fdbf1(%rip), %xmm0  # 0x145a2ed38
140931147:     	movdqu	%xmm0, 0x538(%rbp)
14093114f:     	movq	$0x4, 0x558(%rbp)
14093115a:     	movq	$0x4, 0x560(%rbp)
140931165:     	movq	$0x0, 0x578(%rbp)
140931170:     	movb	$0x1, 0x582(%rbp)
140931177:     	movq	$0x0, 0x548(%rbp)
140931182:     	movb	$0x2, 0x568(%rbp)
140931189:     	leaq	-0x60(%rbp), %rcx
14093118d:     	leaq	0x530(%rbp), %r8
140931194:     	movq	%r14, %rdx
140931197:     	callq	0x144e52a20 <.text+0x4e51a20>
14093119c:     	nop
14093119d:     	cmpq	%r15, 0x50(%rsi)
1409311a1:     	jae	0x1409311b6 <.text+0x9301b6>
1409311a3:     	movb	$0x1, 0x5d6(%rbp)
1409311aa:     	movq	%rdi, %rcx
1409311ad:     	movq	%r15, %rdx
1409311b0:     	callq	0x140196060 <.text+0x195060>
1409311b5:     	nop
1409311b6:     	movq	0x48(%rsi), %rax
1409311ba:     	imulq	$0x130, %r14, %rcx      # imm = 0x130
1409311c1:     	leaq	(%rax,%rcx), %r15
1409311c5:     	cmpl	$0x2, (%rax,%rcx)
1409311c9:     	je	0x14093123a <.text+0x93023a>
1409311cb:     	movq	%r15, 0x5c8(%rbp)
1409311d2:     	leaq	0x58(%r15), %rcx
1409311d6:     	callq	0x1408c5c50 <.text+0x8c4c50>
1409311db:     	nop
1409311dc:     	movq	0x5c8(%rbp), %r15
1409311e3:     	movq	0xe8(%r15), %rax
1409311ea:     	testq	%rax, %rax
1409311ed:     	je	0x140931218 <.text+0x930218>
1409311ef:     	movq	0xe0(%r15), %rcx
1409311f6:     	leaq	0x17(,%rax,8), %r8
1409311fe:     	andq	$-0x10, %r8
140931202:     	leaq	(%rax,%r8), %rdx
140931206:     	addq	$0x11, %rdx
14093120a:     	subq	%r8, %rcx
14093120d:     	movl	$0x10, %r8d
140931213:     	callq	0x1400021d0 <.text+0x11d0>
140931218:     	movq	0xc8(%r15), %rdx
14093121f:     	testq	%rdx, %rdx
140931222:     	je	0x14093123a <.text+0x93023a>
140931224:     	movq	0xd0(%r15), %rcx
14093122b:     	shlq	$0x4, %rdx
14093122f:     	movl	$0x8, %r8d
140931235:     	callq	0x1400021d0 <.text+0x11d0>
14093123a:     	leaq	-0x60(%rbp), %rdx
14093123e:     	movl	$0x130, %r8d            # imm = 0x130
140931244:     	movq	%r15, %rcx
140931247:     	callq	0x1457731ed <.text+0x57721ed>
14093124c:     	leaq	0x78(%rsi), %rcx
140931250:     	leaq	0x50fdae1(%rip), %rdx   # 0x145a2ed38
140931257:     	movq	%r14, %r8
14093125a:     	callq	0x14000ecd0 <.text+0xdcd0>
14093125f:     	nop
140931260:     	jmp	0x140931358 <.text+0x930358>
140931265:     	movq	-0x8(%r9), %rcx
140931269:     	movq	%rcx, 0x8(%rbp)
14093126d:     	movups	-0x18(%r9), %xmm0
140931272:     	movups	%xmm0, -0x8(%rbp)
140931276:     	movups	-0x28(%r9), %xmm0
14093127b:     	movups	%xmm0, -0x18(%rbp)
14093127f:     	movdqu	-0x68(%r9), %xmm0
140931285:     	movdqu	-0x58(%r9), %xmm1
14093128b:     	movdqu	-0x48(%r9), %xmm2
140931291:     	movdqu	-0x38(%r9), %xmm3
140931297:     	movdqu	%xmm3, -0x28(%rbp)
14093129c:     	movdqu	%xmm2, -0x38(%rbp)
1409312a1:     	movdqu	%xmm1, -0x48(%rbp)
1409312a6:     	movdqu	%xmm0, -0x58(%rbp)
1409312ab:     	movq	%rax, -0x60(%rbp)
1409312af:     	leaq	-0x60(%rbp), %rcx
1409312b3:     	leaq	0x5a0(%rbp), %rdx
1409312ba:     	callq	0x144e17460 <.text+0x4e16460>
1409312bf:     	nop
1409312c0:     	movq	%rax, %r14
1409312c3:     	movq	0x5a0(%rbp), %rdx
1409312ca:     	testq	%rdx, %rdx
1409312cd:     	jne	0x140930dcf <.text+0x92fdcf>
1409312d3:     	jmp	0x140930de5 <.text+0x92fde5>
1409312d8:     	movq	-0x8(%r9), %rcx
1409312dc:     	movq	%rcx, 0x8(%rbp)
1409312e0:     	movups	-0x18(%r9), %xmm0
1409312e5:     	movups	%xmm0, -0x8(%rbp)
1409312e9:     	movups	-0x28(%r9), %xmm0
1409312ee:     	movups	%xmm0, -0x18(%rbp)
1409312f2:     	movdqu	-0x68(%r9), %xmm0
1409312f8:     	movdqu	-0x58(%r9), %xmm1
1409312fe:     	movdqu	-0x48(%r9), %xmm2
140931304:     	movdqu	-0x38(%r9), %xmm3
14093130a:     	movdqu	%xmm3, -0x28(%rbp)
14093130f:     	movdqu	%xmm2, -0x38(%rbp)
140931314:     	movdqu	%xmm1, -0x48(%rbp)
140931319:     	movdqu	%xmm0, -0x58(%rbp)
14093131e:     	movq	%rax, -0x60(%rbp)
140931322:     	leaq	-0x60(%rbp), %rcx
140931326:     	leaq	0x5a0(%rbp), %rdx
14093132d:     	callq	0x144e17460 <.text+0x4e16460>
140931332:     	nop
140931333:     	movq	%rax, %r14
140931336:     	movq	0x5a0(%rbp), %rdx
14093133d:     	testq	%rdx, %rdx
140931340:     	je	0x140931358 <.text+0x930358>
140931342:     	movq	0x5a8(%rbp), %rcx
140931349:     	shlq	$0x3, %rdx
14093134d:     	movl	$0x8, %r8d
140931353:     	callq	0x1400021d0 <.text+0x11d0>
140931358:     	cmpq	0x218(%rsi), %r14
14093135f:     	jae	0x140931386 <.text+0x930386>
140931361:     	movq	0x210(%rsi), %rax
140931368:     	movq	(%rax,%r14,8), %rax
14093136c:     	testq	%rax, %rax
14093136f:     	je	0x140931386 <.text+0x930386>
140931371:     	movq	0x1e0(%rsi), %rcx
140931378:     	notq	%rax
14093137b:     	imulq	$0x38, %rax, %rax
14093137f:     	cmpb	$0x0, 0x30(%rcx,%rax)
140931384:     	jne	0x1409313f1 <.text+0x9303f1>
140931386:     	movl	$0x0, 0x530(%rbp)
140931390:     	movl	0x5b0(%rsi), %r15d
140931397:     	movq	%rsi, %rcx
14093139a:     	callq	0x144e89050 <.text+0x4e88050>
14093139f:     	movq	%r14, -0x60(%rbp)
1409313a3:     	leaq	-0x60(%rbp), %r9
1409313a7:     	movq	%rbx, %rcx
1409313aa:     	movq	%r14, %rdx
1409313ad:     	movq	%rdi, %r8
1409313b0:     	callq	0x140ab2340 <.text+0xab1340>
1409313b5:     	movq	%rax, %rdi
1409313b8:     	cmpb	$0x1, 0x30(%rax)
1409313bc:     	jne	0x1409313d1 <.text+0x9303d1>
1409313be:     	leaq	0x530(%rbp), %r8
1409313c5:     	movq	%rdi, %rcx
1409313c8:     	xorl	%edx, %edx
1409313ca:     	callq	0x144e73fa0 <.text+0x4e72fa0>
1409313cf:     	jmp	0x1409313ed <.text+0x9303ed>
1409313d1:     	movq	0x8(%rdi), %r8
1409313d5:     	movq	0x10(%rdi), %rcx
1409313d9:     	leaq	0x530(%rbp), %rdx
1409313e0:     	callq	0x1457731e1 <.text+0x57721e1>
1409313e5:     	movl	%r15d, 0x28(%rdi)
1409313e9:     	movb	$0x1, 0x30(%rdi)
1409313ed:     	movl	%r15d, 0x2c(%rdi)
1409313f1:     	movq	%rsi, %rcx
1409313f4:     	callq	0x140f30c10 <.text+0xf2fc10>
1409313f9:     	callq	0x140002200 <.text+0x1200>
1409313fe:     	movl	$0x58, %ecx
140931403:     	movl	$0x8, %edx
140931408:     	callq	0x1400021c0 <.text+0x11c0>
14093140d:     	testq	%rax, %rax
140931410:     	je	0x1409315ca <.text+0x9305ca>
140931416:     	movq	$-0x1, (%rax)
14093141d:     	movl	$0x0, 0x50(%rax)
140931424:     	movb	$0x0, 0x54(%rax)
140931428:     	leaq	0x510f6e1(%rip), %r8    # 0x145a40b10
14093142f:     	leaq	-0x60(%rbp), %rcx
140931433:     	movq	%rax, %rdx
140931436:     	callq	0x144e2e170 <.text+0x4e2d170>
14093143b:     	nop
14093143c:     	movq	0x70ff70d(%rip), %rcx   # 0x147a30b50
140931443:     	leaq	0x51d387e(%rip), %r8    # 0x145b04cc8
14093144a:     	leaq	0x5d5(%rbp), %rdx
140931451:     	callq	0x140fa6c00 <.text+0xfa5c00>
140931456:     	nop
140931457:     	movq	%rdx, %r8
14093145a:     	leaq	-0x60(%rbp), %rcx
14093145e:     	movq	%rax, %rdx
140931461:     	callq	0x1401f1a30 <.text+0x1f0a30>
140931466:     	nop
140931467:     	movups	(%rbp), %xmm0
14093146b:     	movaps	%xmm0, 0x590(%rbp)
140931472:     	movups	-0x10(%rbp), %xmm0
140931476:     	movaps	%xmm0, 0x580(%rbp)
14093147d:     	movups	-0x20(%rbp), %xmm0
140931481:     	movaps	%xmm0, 0x570(%rbp)
140931488:     	movups	-0x60(%rbp), %xmm0
14093148c:     	movups	-0x50(%rbp), %xmm1
140931490:     	movups	-0x40(%rbp), %xmm2
140931494:     	movups	-0x30(%rbp), %xmm3
140931498:     	movaps	%xmm3, 0x560(%rbp)
14093149f:     	movaps	%xmm2, 0x550(%rbp)
1409314a6:     	movaps	%xmm1, 0x540(%rbp)
1409314ad:     	movaps	%xmm0, 0x530(%rbp)
1409314b4:     	leaq	0x530(%rbp), %rdx
1409314bb:     	movq	%rsi, %rcx
1409314be:     	callq	0x140f3b820 <.text+0xf3a820>
1409314c3:     	movq	$-0x1, -0x20(%rbp)
1409314cb:     	movl	$0x0, 0x528(%rbp)
1409314d5:     	movb	$0x0, 0x52c(%rbp)
1409314dc:     	callq	0x140002200 <.text+0x1200>
1409314e1:     	movl	$0x590, %ecx            # imm = 0x590
1409314e6:     	movl	$0x8, %edx
1409314eb:     	callq	0x1400021c0 <.text+0x11c0>
1409314f0:     	testq	%rax, %rax
1409314f3:     	je	0x1409315db <.text+0x9305db>
1409314f9:     	movq	%rax, %rdi
1409314fc:     	leaq	-0x60(%rbp), %rdx
140931500:     	movl	$0x590, %r8d            # imm = 0x590
140931506:     	movq	%rax, %rcx
140931509:     	callq	0x1457731ed <.text+0x57721ed>
14093150e:     	leaq	0x510f553(%rip), %r8    # 0x145a40a68
140931515:     	leaq	-0x60(%rbp), %rcx
140931519:     	movq	%rdi, %rdx
14093151c:     	callq	0x144e2e170 <.text+0x4e2d170>
140931521:     	movb	$0x3, 0x5a0(%rbp)
140931528:     	movq	0x70ff621(%rip), %rcx   # 0x147a30b50
14093152f:     	leaq	0x523cb0a(%rip), %r8    # 0x145b6e040
140931536:     	leaq	0x5a0(%rbp), %rdx
14093153d:     	callq	0x140fa6c00 <.text+0xfa5c00>
140931542:     	nop
140931543:     	movq	%rdx, %r8
140931546:     	leaq	-0x60(%rbp), %rcx
14093154a:     	movq	%rax, %rdx
14093154d:     	callq	0x1401f1c30 <.text+0x1f0c30>
140931552:     	nop
140931553:     	movups	(%rbp), %xmm0
140931557:     	movaps	%xmm0, 0x590(%rbp)
14093155e:     	movups	-0x10(%rbp), %xmm0
140931562:     	movaps	%xmm0, 0x580(%rbp)
140931569:     	movups	-0x20(%rbp), %xmm0
14093156d:     	movaps	%xmm0, 0x570(%rbp)
140931574:     	movups	-0x60(%rbp), %xmm0
140931578:     	movups	-0x50(%rbp), %xmm1
14093157c:     	movups	-0x40(%rbp), %xmm2
140931580:     	movups	-0x30(%rbp), %xmm3
140931584:     	movaps	%xmm3, 0x560(%rbp)
14093158b:     	movaps	%xmm2, 0x550(%rbp)
140931592:     	movaps	%xmm1, 0x540(%rbp)
140931599:     	movaps	%xmm0, 0x530(%rbp)
1409315a0:     	leaq	0x530(%rbp), %rdx
1409315a7:     	movq	%rsi, %rcx
1409315aa:     	callq	0x140f3b620 <.text+0xf3a620>
1409315af:     	movq	%rsi, %rcx
1409315b2:     	callq	0x1409e9f40 <.text+0x9e8f40>
1409315b7:     	nop
1409315b8:     	addq	$0x660, %rsp            # imm = 0x660
1409315bf:     	popq	%rbx
1409315c0:     	popq	%rdi
1409315c1:     	popq	%rsi
1409315c2:     	popq	%r12
1409315c4:     	popq	%r14
1409315c6:     	popq	%r15
1409315c8:     	popq	%rbp
1409315c9:     	retq
1409315ca:     	movl	$0x8, %ecx
1409315cf:     	movl	$0x58, %edx
1409315d4:     	callq	0x145903781 <.text+0x5902781>
1409315d9:     	ud2
1409315db:     	movl	$0x8, %ecx
1409315e0:     	movl	$0x590, %edx            # imm = 0x590
1409315e5:     	callq	0x145903781 <.text+0x5902781>
1409315ea:     	nop
1409315eb:     	ud2
1409315ed:     	callq	0x145712ca0 <.text+0x5711ca0>
1409315f2:     	movq	%rax, (%r15)
1409315f5:     	movq	%rdx, 0x8(%r15)
1409315f9:     	movb	$0x1, 0x10(%r15)
1409315fe:     	jmp	0x140930e37 <.text+0x92fe37>
