
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140816b50:     	pushq	%rbp
140816b51:     	pushq	%r15
140816b53:     	pushq	%r14
140816b55:     	pushq	%r13
140816b57:     	pushq	%r12
140816b59:     	pushq	%rsi
140816b5a:     	pushq	%rdi
140816b5b:     	pushq	%rbx
140816b5c:     	subq	$0x228, %rsp            # imm = 0x228
140816b63:     	leaq	0x80(%rsp), %rbp
140816b6b:     	movq	$-0x2, 0x1a0(%rbp)
140816b76:     	movq	0x218(%rbp), %rax
140816b7d:     	movq	0x210(%rbp), %rcx
140816b84:     	movq	(%rdx), %r13
140816b87:     	movq	0x10(%rdx), %r10
140816b8b:     	movq	%r10, 0x50(%rbp)
140816b8f:     	movl	0x1c(%rdx), %edx
140816b92:     	movl	%edx, 0x124(%rbp)
140816b98:     	movq	(%r8), %rsi
140816b9b:     	movq	0x10(%r8), %rdx
140816b9f:     	movq	%rdx, 0x48(%rbp)
140816ba3:     	movl	0x1c(%r8), %edx
140816ba7:     	movl	%edx, 0xf0(%rbp)
140816bad:     	movq	(%r9), %rbx
140816bb0:     	movq	(%rcx), %rdi
140816bb3:     	movq	0x10(%rcx), %rdx
140816bb7:     	movq	%rdx, 0x118(%rbp)
140816bbe:     	movl	0x1c(%rcx), %ecx
140816bc1:     	movl	%ecx, 0x180(%rbp)
140816bc7:     	movq	(%rax), %r15
140816bca:     	movl	0x7188f78(%rip), %eax   # 0x14799fb48
140816bd0:     	testl	%eax, %eax
140816bd2:     	jne	0x140817dd1 <.text+0x816dd1>
140816bd8:     	movq	%rsi, 0x40(%rbp)
140816bdc:     	movb	$0x1, %cl
140816bde:     	xorl	%eax, %eax
140816be0:     	lock
140816be1:     	cmpxchgb	%cl, 0x7188e80(%rip)    # 0x14799fa68
140816be8:     	jne	0x140817de2 <.text+0x816de2>
140816bee:     	movq	0x71d01b3(%rip), %r12   # 0x1479e6da8
140816bf5:     	movq	(%r12), %rax
140816bf9:     	shlq	%rax
140816bfc:     	testq	%rax, %rax
140816bff:     	jne	0x140817df3 <.text+0x816df3>
140816c05:     	movl	$0x0, 0x130(%rbp)
140816c0f:     	movzbl	0x7188e53(%rip), %eax   # 0x14799fa69
140816c16:     	cmpb	$0x2, 0x7188e53(%rip)   # 0x14799fa70
140816c1d:     	jne	0x140816f21 <.text+0x815f21>
140816c23:     	movb	$0x1, %sil
140816c26:     	cmpq	$0x0, 0x18(%rbx)
140816c2b:     	je	0x140816f23 <.text+0x815f23>
140816c31:     	leaq	0x20(%rbx), %rcx
140816c35:     	leaq	0x51e454c(%rip), %rdx   # 0x1459fb188
140816c3c:     	movl	$0x7, %r8d
140816c42:     	callq	0x1400bcfb0 <.text+0xbbfb0>
140816c47:     	movq	%rax, %rcx
140816c4a:     	shrq	$0x39, %rcx
140816c4e:     	movq	(%rbx), %rdx
140816c51:     	movq	0x8(%rbx), %r8
140816c55:     	movd	%ecx, %xmm0
140816c59:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140816c5d:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140816c62:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140816c67:     	xorl	%r9d, %r9d
140816c6a:     	pcmpeqd	%xmm1, %xmm1
140816c6e:     	andq	%r8, %rax
140816c71:     	movdqu	(%rdx,%rax), %xmm2
140816c76:     	movdqa	%xmm2, %xmm3
140816c7a:     	pcmpeqb	%xmm0, %xmm3
140816c7e:     	pmovmskb	%xmm3, %ebx
140816c82:     	testl	%ebx, %ebx
140816c84:     	je	0x140816cd9 <.text+0x815cd9>
140816c86:     	tzcntl	%ebx, %ecx
140816c8a:     	addq	%rax, %rcx
140816c8d:     	andq	%r8, %rcx
140816c90:     	negq	%rcx
140816c93:     	imulq	$0x38, %rcx, %rcx
140816c97:     	cmpq	$0x7, -0x28(%rdx,%rcx)
140816c9d:     	jne	0x140816ccf <.text+0x815ccf>
140816c9f:     	addq	%rdx, %rcx
140816ca2:     	movq	%rdi, %r10
140816ca5:     	movq	-0x30(%rcx), %rdi
140816ca9:     	movq	%r12, %r14
140816cac:     	movl	(%rdi), %r12d
140816caf:     	movl	$0x73657264, %r11d      # imm = 0x73657264
140816cb5:     	xorl	%r11d, %r12d
140816cb8:     	movl	$0x70757373, %r11d      # imm = 0x70757373
140816cbe:     	movl	0x3(%rdi), %edi
140816cc1:     	xorl	%r11d, %edi
140816cc4:     	orl	%r12d, %edi
140816cc7:     	movq	%r10, %rdi
140816cca:     	movq	%r14, %r12
140816ccd:     	je	0x140816cf9 <.text+0x815cf9>
140816ccf:     	leal	-0x1(%rbx), %ecx
140816cd2:     	andw	%bx, %cx
140816cd5:     	movl	%ecx, %ebx
140816cd7:     	jne	0x140816c86 <.text+0x815c86>
140816cd9:     	pcmpeqb	%xmm1, %xmm2
140816cdd:     	pmovmskb	%xmm2, %ecx
140816ce1:     	testl	%ecx, %ecx
140816ce3:     	jne	0x140816f23 <.text+0x815f23>
140816ce9:     	addq	%r9, %rax
140816cec:     	addq	$0x10, %rax
140816cf0:     	addq	$0x10, %r9
140816cf4:     	jmp	0x140816c6e <.text+0x815c6e>
140816cf9:     	cmpb	$0x0, -0x20(%rcx)
140816cfd:     	jne	0x140816f23 <.text+0x815f23>
140816d03:     	cmpb	$0x1, -0x18(%rcx)
140816d07:     	jne	0x140816e32 <.text+0x815e32>
140816d0d:     	pxor	%xmm0, %xmm0
140816d11:     	cmpq	$0x0, 0x90(%rdi)
140816d19:     	je	0x140816e86 <.text+0x815e86>
140816d1f:     	movzwl	-0x17(%rcx), %eax
140816d23:     	movzbl	-0x15(%rcx), %edx
140816d27:     	shll	$0x10, %edx
140816d2a:     	orq	%rax, %rdx
140816d2d:     	movl	-0x14(%rcx), %eax
140816d30:     	movl	-0x10(%rcx), %r8d
140816d34:     	movzbl	-0x8(%rcx), %r9d
140816d39:     	movl	-0xc(%rcx), %r11d
140816d3d:     	shlq	$0x18, %rax
140816d41:     	orq	%rdx, %rax
140816d44:     	movl	%r8d, %edx
140816d47:     	shrl	$0x8, %edx
140816d4a:     	shlq	$0x38, %r8
140816d4e:     	orq	%rax, %r8
140816d51:     	shlq	$0x18, %r11
140816d55:     	shlq	$0x38, %r9
140816d59:     	orq	%r11, %r9
140816d5c:     	orq	%rdx, %r9
140816d5f:     	movabsq	$-0x210e623f01a31098, %rdx # imm = 0xDEF19DC0FE5CEF68
140816d69:     	xorq	%r8, %rdx
140816d6c:     	movabsq	$0x3f84d5b5b5470917, %rax # imm = 0x3F84D5B5B5470917
140816d76:     	xorq	%r9, %rax
140816d79:     	mulq	%rdx
140816d7c:     	xorq	%rax, %rdx
140816d7f:     	movq	%rdx, %r11
140816d82:     	shrq	$0x39, %r11
140816d86:     	movq	0x78(%rdi), %rax
140816d8a:     	movq	0x80(%rdi), %rbx
140816d91:     	movd	%r11d, %xmm1
140816d96:     	punpcklbw	%xmm1, %xmm1    # xmm1 = xmm1[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140816d9a:     	pshuflw	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0,4,5,6,7]
140816d9f:     	pshufd	$0x44, %xmm1, %xmm1     # xmm1 = xmm1[0,1,0,1]
140816da4:     	xorl	%r11d, %r11d
140816da7:     	pcmpeqd	%xmm2, %xmm2
140816dab:     	andq	%rbx, %rdx
140816dae:     	movdqu	(%rax,%rdx), %xmm3
140816db3:     	movdqa	%xmm3, %xmm4
140816db7:     	pcmpeqb	%xmm1, %xmm4
140816dbb:     	pmovmskb	%xmm4, %esi
140816dbf:     	testl	%esi, %esi
140816dc1:     	je	0x140816e16 <.text+0x815e16>
140816dc3:     	movq	%r11, 0x128(%rbp)
140816dca:     	tzcntl	%esi, %edi
140816dce:     	addq	%rdx, %rdi
140816dd1:     	andq	%rbx, %rdi
140816dd4:     	negq	%rdi
140816dd7:     	movq	%rbx, %r11
140816dda:     	imulq	$0xf0, %rdi, %rbx
140816de1:     	movq	-0xe8(%rax,%rbx), %rdi
140816de9:     	xorq	%r9, %rdi
140816dec:     	movq	-0xf0(%rax,%rbx), %r12
140816df4:     	xorq	%r8, %r12
140816df7:     	orq	%rdi, %r12
140816dfa:     	je	0x140816e6f <.text+0x815e6f>
140816dfc:     	leal	-0x1(%rsi), %edi
140816dff:     	andw	%si, %di
140816e02:     	movl	%edi, %esi
140816e04:     	movq	%r14, %r12
140816e07:     	movq	%r10, %rdi
140816e0a:     	movq	%r11, %rbx
140816e0d:     	movq	0x128(%rbp), %r11
140816e14:     	jne	0x140816dca <.text+0x815dca>
140816e16:     	pcmpeqb	%xmm2, %xmm3
140816e1a:     	pmovmskb	%xmm3, %esi
140816e1e:     	testl	%esi, %esi
140816e20:     	jne	0x140816e86 <.text+0x815e86>
140816e22:     	addq	%r11, %rdx
140816e25:     	addq	$0x10, %rdx
140816e29:     	addq	$0x10, %r11
140816e2d:     	jmp	0x140816dab <.text+0x815dab>
140816e32:     	movq	-0x10(%rcx), %rdx
140816e36:     	movl	0x6c(%rdx), %r8d
140816e3a:     	pxor	%xmm0, %xmm0
140816e3e:     	cmpq	%r8, 0x48(%rdi)
140816e42:     	jbe	0x140816e86 <.text+0x815e86>
140816e44:     	movq	0x40(%rdi), %rax
140816e48:     	imulq	$0xe8, %r8, %r8
140816e4f:     	movq	(%rax,%r8), %r9
140816e53:     	cmpq	$-0x3, %r9
140816e57:     	je	0x140816e86 <.text+0x815e86>
140816e59:     	cmpq	$-0x2, %r9
140816e5d:     	je	0x140816e86 <.text+0x815e86>
140816e5f:     	movl	0x68(%rdx), %edx
140816e62:     	addq	%r8, %rax
140816e65:     	cmpl	%edx, 0xe0(%rax)
140816e6b:     	je	0x140816e7e <.text+0x815e7e>
140816e6d:     	jmp	0x140816e86 <.text+0x815e86>
140816e6f:     	addq	%rbx, %rax
140816e72:     	addq	$-0xe0, %rax
140816e78:     	movq	%r14, %r12
140816e7b:     	movq	%r10, %rdi
140816e7e:     	movq	0xa0(%rax), %xmm0
140816e86:     	movq	%xmm0, 0x7188c02(%rip)  # 0x14799fa90
140816e8e:     	cmpb	$0x1, -0x18(%rcx)
140816e92:     	jne	0x140816eac <.text+0x815eac>
140816e94:     	movzbl	-0x8(%rcx), %eax
140816e98:     	movq	-0x10(%rcx), %r8
140816e9c:     	movl	-0x17(%rcx), %edx
140816e9f:     	movl	-0x14(%rcx), %ecx
140816ea2:     	movl	%ecx, 0x5b(%rbp)
140816ea5:     	movl	%edx, 0x58(%rbp)
140816ea8:     	movb	$0x1, %cl
140816eaa:     	jmp	0x140816efb <.text+0x815efb>
140816eac:     	movq	-0x10(%rcx), %rax
140816eb0:     	lock
140816eb1:     	incq	(%rax)
140816eb4:     	jle	0x140817e3a <.text+0x816e3a>
140816eba:     	movzbl	0x7188baf(%rip), %eax   # 0x14799fa70
140816ec1:     	movq	-0x10(%rcx), %r8
140816ec5:     	cmpb	$0x2, %al
140816ec7:     	je	0x140816ef9 <.text+0x815ef9>
140816ec9:     	testb	%al, %al
140816ecb:     	jne	0x140816ef9 <.text+0x815ef9>
140816ecd:     	movq	0x7188ba4(%rip), %rax   # 0x14799fa78
140816ed4:     	lock
140816ed5:     	decq	(%rax)
140816ed8:     	jne	0x140816ef9 <.text+0x815ef9>
140816eda:     	movq	%r8, 0x128(%rbp)
140816ee1:     	leaq	0x7188b90(%rip), %rcx   # 0x14799fa78
140816ee8:     	callq	0x1449886d0 <.text+0x49876d0>
140816eed:     	nop
140816eee:     	xorl	%ecx, %ecx
140816ef0:     	movq	0x128(%rbp), %r8
140816ef7:     	jmp	0x140816efb <.text+0x815efb>
140816ef9:     	xorl	%ecx, %ecx
140816efb:     	movb	%cl, 0x7188b6f(%rip)    # 0x14799fa70
140816f01:     	movl	0x58(%rbp), %ecx
140816f04:     	movl	0x5b(%rbp), %edx
140816f07:     	movl	%ecx, 0x7188b64(%rip)   # 0x14799fa71
140816f0d:     	movl	%edx, 0x7188b61(%rip)   # 0x14799fa74
140816f13:     	movq	%r8, 0x7188b5e(%rip)    # 0x14799fa78
140816f1a:     	movq	%rax, 0x7188b5f(%rip)   # 0x14799fa80
140816f21:     	xorl	%esi, %esi
140816f23:     	movq	0x220(%rbp), %rbx
140816f2a:     	cmpb	$0x0, 0x7188b67(%rip)   # 0x14799fa98
140816f31:     	je	0x140817b43 <.text+0x816b43>
140816f37:     	leaq	0x7188b5e(%rip), %rdx   # 0x14799fa9c
140816f3e:     	leaq	-0x58(%rbp), %rcx
140816f42:     	movl	$0x98, %r8d
140816f48:     	callq	0x145756ddd <.text+0x5755ddd>
140816f4d:     	movzbl	0x7188be0(%rip), %eax   # 0x14799fb34
140816f54:     	movb	%al, 0x128(%rbp)
140816f5a:     	movzbl	0x7188bd4(%rip), %eax   # 0x14799fb35
140816f61:     	movb	%al, 0x19f(%rbp)
140816f67:     	movzbl	0x7188bc8(%rip), %eax   # 0x14799fb36
140816f6e:     	movb	%al, 0x188(%rbp)
140816f74:     	movzbl	0x7188bbc(%rip), %eax   # 0x14799fb37
140816f7b:     	movb	%al, 0x189(%rbp)
140816f81:     	movzbl	0x7188bb0(%rip), %eax   # 0x14799fb38
140816f88:     	movb	%al, 0x18a(%rbp)
140816f8e:     	movzbl	0x7188ba4(%rip), %eax   # 0x14799fb39
140816f95:     	movb	%al, 0x18b(%rbp)
140816f9b:     	movzbl	0x7188b98(%rip), %eax   # 0x14799fb3a
140816fa2:     	movb	%al, 0x18c(%rbp)
140816fa8:     	testb	%sil, %sil
140816fab:     	je	0x140817c11 <.text+0x816c11>
140816fb1:     	testq	%r15, %r15
140816fb4:     	je	0x140817bd4 <.text+0x816bd4>
140816fba:     	movq	%r15, %rcx
140816fbd:     	movzbl	0x128(%rbp), %edx
140816fc4:     	movzbl	0x19f(%rbp), %r8d
140816fcc:     	callq	0x145620bc0 <.text+0x561fbc0>
140816fd1:     	nop
140816fd2:     	testb	$0x1, %al
140816fd4:     	je	0x140817bd4 <.text+0x816bd4>
140816fda:     	movl	%edx, %edi
140816fdc:     	movb	$0x1, (%rbx)
140816fdf:     	leaq	0x58(%rbp), %rcx
140816fe3:     	leaq	-0x58(%rbp), %rdx
140816fe7:     	callq	0x140bab170 <.text+0xbaa170>
140816fec:     	nop
140816fed:     	movq	%r12, %rbx
140816ff0:     	movl	0x58(%rbp), %eax
140816ff3:     	movl	%eax, 0x118(%rbp)
140816ff9:     	movzbl	0x5c(%rbp), %eax
140816ffd:     	movb	%al, 0x180(%rbp)
140817003:     	movzwl	0x5d(%rbp), %eax
140817007:     	movw	%ax, 0x134(%rbp)
14081700e:     	movzbl	0x5f(%rbp), %eax
140817012:     	movb	%al, 0x136(%rbp)
140817018:     	movl	0x60(%rbp), %eax
14081701b:     	movl	%eax, 0xf4(%rbp)
140817021:     	movzbl	0x64(%rbp), %eax
140817025:     	movb	%al, 0x18d(%rbp)
14081702b:     	movzwl	0x65(%rbp), %eax
14081702f:     	movw	%ax, 0x138(%rbp)
140817036:     	movzbl	0x67(%rbp), %eax
14081703a:     	movb	%al, 0x13a(%rbp)
140817040:     	movl	0x68(%rbp), %eax
140817043:     	movl	%eax, 0xf8(%rbp)
140817049:     	movzbl	0x6c(%rbp), %eax
14081704d:     	movb	%al, 0x18e(%rbp)
140817053:     	movzbl	0x6f(%rbp), %eax
140817057:     	movb	%al, 0x13e(%rbp)
14081705d:     	movzwl	0x6d(%rbp), %eax
140817061:     	movw	%ax, 0x13c(%rbp)
140817068:     	movl	0x70(%rbp), %eax
14081706b:     	movl	%eax, 0xfc(%rbp)
140817071:     	movzbl	0x74(%rbp), %eax
140817075:     	movb	%al, 0x18f(%rbp)
14081707b:     	movzwl	0x75(%rbp), %eax
14081707f:     	movw	%ax, 0x140(%rbp)
140817086:     	movzbl	0x77(%rbp), %eax
14081708a:     	movb	%al, 0x142(%rbp)
140817090:     	movl	0x78(%rbp), %eax
140817093:     	movl	%eax, 0x100(%rbp)
140817099:     	movzbl	0x7c(%rbp), %eax
14081709d:     	movb	%al, 0x190(%rbp)
1408170a3:     	movzwl	0x7d(%rbp), %eax
1408170a7:     	movw	%ax, 0x144(%rbp)
1408170ae:     	movzbl	0x7f(%rbp), %eax
1408170b2:     	movb	%al, 0x146(%rbp)
1408170b8:     	movzbl	0x84(%rbp), %eax
1408170bf:     	movb	%al, 0x191(%rbp)
1408170c5:     	movzwl	0x85(%rbp), %eax
1408170cc:     	movw	%ax, 0x148(%rbp)
1408170d3:     	movzbl	0x87(%rbp), %eax
1408170da:     	movb	%al, 0x14a(%rbp)
1408170e0:     	movzbl	0x8c(%rbp), %eax
1408170e7:     	movb	%al, 0x192(%rbp)
1408170ed:     	movzbl	0x8f(%rbp), %eax
1408170f4:     	movb	%al, 0x14e(%rbp)
1408170fa:     	movzwl	0x8d(%rbp), %eax
140817101:     	movw	%ax, 0x14c(%rbp)
140817108:     	movzbl	0x94(%rbp), %eax
14081710f:     	movb	%al, 0x193(%rbp)
140817115:     	movzbl	0x97(%rbp), %eax
14081711c:     	movb	%al, 0x152(%rbp)
140817122:     	movzwl	0x95(%rbp), %eax
140817129:     	movw	%ax, 0x150(%rbp)
140817130:     	movzbl	0x9c(%rbp), %eax
140817137:     	movb	%al, 0x194(%rbp)
14081713d:     	movzbl	0x9f(%rbp), %eax
140817144:     	movb	%al, 0x156(%rbp)
14081714a:     	movzwl	0x9d(%rbp), %eax
140817151:     	movw	%ax, 0x154(%rbp)
140817158:     	movzbl	0xa4(%rbp), %eax
14081715f:     	movb	%al, 0x195(%rbp)
140817165:     	movzbl	0xa7(%rbp), %eax
14081716c:     	movb	%al, 0x15a(%rbp)
140817172:     	movzwl	0xa5(%rbp), %eax
140817179:     	movw	%ax, 0x158(%rbp)
140817180:     	movzbl	0xac(%rbp), %eax
140817187:     	movb	%al, 0x196(%rbp)
14081718d:     	movzbl	0xaf(%rbp), %eax
140817194:     	movb	%al, 0x15e(%rbp)
14081719a:     	movzwl	0xad(%rbp), %eax
1408171a1:     	movw	%ax, 0x15c(%rbp)
1408171a8:     	movzbl	0xb4(%rbp), %eax
1408171af:     	movb	%al, 0x197(%rbp)
1408171b5:     	movzbl	0xb7(%rbp), %eax
1408171bc:     	movb	%al, 0x162(%rbp)
1408171c2:     	movzwl	0xb5(%rbp), %eax
1408171c9:     	movw	%ax, 0x160(%rbp)
1408171d0:     	movzbl	0xbc(%rbp), %eax
1408171d7:     	movb	%al, 0x198(%rbp)
1408171dd:     	movzbl	0xbf(%rbp), %eax
1408171e4:     	movb	%al, 0x166(%rbp)
1408171ea:     	movzwl	0xbd(%rbp), %eax
1408171f1:     	movw	%ax, 0x164(%rbp)
1408171f8:     	movzbl	0xc4(%rbp), %eax
1408171ff:     	movb	%al, 0x199(%rbp)
140817205:     	movzbl	0xc7(%rbp), %eax
14081720c:     	movb	%al, 0x16a(%rbp)
140817212:     	movzwl	0xc5(%rbp), %eax
140817219:     	movw	%ax, 0x168(%rbp)
140817220:     	movzwl	0xcd(%rbp), %eax
140817227:     	movw	%ax, 0x16c(%rbp)
14081722e:     	movzwl	0xd5(%rbp), %eax
140817235:     	movw	%ax, 0x170(%rbp)
14081723c:     	movzwl	0xdd(%rbp), %eax
140817243:     	movw	%ax, 0x174(%rbp)
14081724a:     	movzwl	0xe5(%rbp), %eax
140817251:     	movw	%ax, 0x178(%rbp)
140817258:     	movzwl	0xed(%rbp), %eax
14081725f:     	movw	%ax, 0x17c(%rbp)
140817266:     	movzbl	0xcc(%rbp), %eax
14081726d:     	movb	%al, 0x19a(%rbp)
140817273:     	movzbl	0xcf(%rbp), %eax
14081727a:     	movb	%al, 0x16e(%rbp)
140817280:     	movzbl	0xd7(%rbp), %eax
140817287:     	movb	%al, 0x172(%rbp)
14081728d:     	movzbl	0xdf(%rbp), %eax
140817294:     	movb	%al, 0x176(%rbp)
14081729a:     	movzbl	0xe7(%rbp), %eax
1408172a1:     	movb	%al, 0x17a(%rbp)
1408172a7:     	movzbl	0xef(%rbp), %eax
1408172ae:     	movb	%al, 0x17e(%rbp)
1408172b4:     	movzbl	0xd4(%rbp), %eax
1408172bb:     	movb	%al, 0x19b(%rbp)
1408172c1:     	movl	0x80(%rbp), %ecx
1408172c7:     	movl	0x88(%rbp), %edx
1408172cd:     	movl	0x90(%rbp), %r8d
1408172d4:     	movl	0x98(%rbp), %r9d
1408172db:     	movl	0xa0(%rbp), %r10d
1408172e2:     	movl	0xa8(%rbp), %r14d
1408172e9:     	movl	0xb0(%rbp), %r11d
1408172f0:     	movl	0xb8(%rbp), %r15d
1408172f7:     	movl	0xc0(%rbp), %r12d
1408172fe:     	movl	0xc8(%rbp), %eax
140817304:     	movl	%eax, 0x114(%rbp)
14081730a:     	movl	0xd0(%rbp), %eax
140817310:     	movl	%eax, 0x110(%rbp)
140817316:     	movl	0xd8(%rbp), %eax
14081731c:     	movl	%eax, 0x10c(%rbp)
140817322:     	movl	0xe0(%rbp), %eax
140817328:     	movl	%eax, 0x108(%rbp)
14081732e:     	movl	0xe8(%rbp), %eax
140817334:     	movl	%eax, 0x104(%rbp)
14081733a:     	movl	(%r13), %eax
14081733e:     	movzbl	0xdc(%rbp), %esi
140817345:     	movb	%sil, 0x19e(%rbp)
14081734c:     	movzbl	0xe4(%rbp), %esi
140817353:     	movb	%sil, 0x19d(%rbp)
14081735a:     	movzbl	0xec(%rbp), %esi
140817361:     	movb	%sil, 0x19c(%rbp)
140817368:     	cmpl	$0x2, %eax
14081736b:     	je	0x140817668 <.text+0x816668>
140817371:     	cmpl	%edi, 0x18(%r13)
140817375:     	jne	0x140817668 <.text+0x816668>
14081737b:     	movzbl	0x128(%rbp), %esi
140817382:     	cmpb	%sil, 0xb4(%r13)
140817389:     	jne	0x140817668 <.text+0x816668>
14081738f:     	movzbl	0x19f(%rbp), %esi
140817396:     	cmpb	%sil, 0xb5(%r13)
14081739d:     	jne	0x140817668 <.text+0x816668>
1408173a3:     	movzbl	0x188(%rbp), %esi
1408173aa:     	cmpb	%sil, 0xb6(%r13)
1408173b1:     	jne	0x140817668 <.text+0x816668>
1408173b7:     	movzbl	0x189(%rbp), %esi
1408173be:     	cmpb	%sil, 0xb7(%r13)
1408173c5:     	jne	0x140817668 <.text+0x816668>
1408173cb:     	movzbl	0x18a(%rbp), %esi
1408173d2:     	cmpb	%sil, 0xb8(%r13)
1408173d9:     	jne	0x140817668 <.text+0x816668>
1408173df:     	movzbl	0x18b(%rbp), %esi
1408173e6:     	cmpb	%sil, 0xb9(%r13)
1408173ed:     	jne	0x140817668 <.text+0x816668>
1408173f3:     	movzbl	0x18c(%rbp), %esi
1408173fa:     	cmpb	%sil, 0xba(%r13)
140817401:     	jne	0x140817668 <.text+0x816668>
140817407:     	movl	0x118(%rbp), %esi
14081740d:     	cmpl	%esi, 0x1c(%r13)
140817411:     	jne	0x140817668 <.text+0x816668>
140817417:     	movzbl	0x180(%rbp), %esi
14081741e:     	cmpb	%sil, 0x20(%r13)
140817422:     	jne	0x140817668 <.text+0x816668>
140817428:     	movl	0xf4(%rbp), %esi
14081742e:     	cmpl	%esi, 0x24(%r13)
140817432:     	jne	0x140817668 <.text+0x816668>
140817438:     	movzbl	0x18d(%rbp), %esi
14081743f:     	cmpb	%sil, 0x28(%r13)
140817443:     	jne	0x140817668 <.text+0x816668>
140817449:     	movl	0xf8(%rbp), %esi
14081744f:     	cmpl	%esi, 0x2c(%r13)
140817453:     	jne	0x140817668 <.text+0x816668>
140817459:     	movzbl	0x18e(%rbp), %esi
140817460:     	cmpb	%sil, 0x30(%r13)
140817464:     	jne	0x140817668 <.text+0x816668>
14081746a:     	movl	0xfc(%rbp), %esi
140817470:     	cmpl	%esi, 0x34(%r13)
140817474:     	jne	0x140817668 <.text+0x816668>
14081747a:     	movzbl	0x18f(%rbp), %esi
140817481:     	cmpb	%sil, 0x38(%r13)
140817485:     	jne	0x140817668 <.text+0x816668>
14081748b:     	movl	0x100(%rbp), %esi
140817491:     	cmpl	%esi, 0x3c(%r13)
140817495:     	jne	0x140817668 <.text+0x816668>
14081749b:     	movzbl	0x190(%rbp), %esi
1408174a2:     	cmpb	%sil, 0x40(%r13)
1408174a6:     	jne	0x140817668 <.text+0x816668>
1408174ac:     	cmpl	%ecx, 0x44(%r13)
1408174b0:     	jne	0x140817668 <.text+0x816668>
1408174b6:     	movzbl	0x191(%rbp), %esi
1408174bd:     	cmpb	%sil, 0x48(%r13)
1408174c1:     	jne	0x140817668 <.text+0x816668>
1408174c7:     	cmpl	%edx, 0x4c(%r13)
1408174cb:     	jne	0x140817668 <.text+0x816668>
1408174d1:     	movzbl	0x192(%rbp), %esi
1408174d8:     	cmpb	%sil, 0x50(%r13)
1408174dc:     	jne	0x140817668 <.text+0x816668>
1408174e2:     	cmpl	%r8d, 0x54(%r13)
1408174e6:     	jne	0x140817668 <.text+0x816668>
1408174ec:     	movzbl	0x193(%rbp), %esi
1408174f3:     	cmpb	%sil, 0x58(%r13)
1408174f7:     	jne	0x140817668 <.text+0x816668>
1408174fd:     	cmpl	%r9d, 0x5c(%r13)
140817501:     	jne	0x140817668 <.text+0x816668>
140817507:     	movzbl	0x194(%rbp), %esi
14081750e:     	cmpb	%sil, 0x60(%r13)
140817512:     	jne	0x140817668 <.text+0x816668>
140817518:     	cmpl	%r10d, 0x64(%r13)
14081751c:     	jne	0x140817668 <.text+0x816668>
140817522:     	movzbl	0x195(%rbp), %esi
140817529:     	cmpb	%sil, 0x68(%r13)
14081752d:     	jne	0x140817668 <.text+0x816668>
140817533:     	cmpl	%r14d, 0x6c(%r13)
140817537:     	jne	0x140817668 <.text+0x816668>
14081753d:     	movzbl	0x196(%rbp), %esi
140817544:     	cmpb	%sil, 0x70(%r13)
140817548:     	jne	0x140817668 <.text+0x816668>
14081754e:     	cmpl	%r11d, 0x74(%r13)
140817552:     	jne	0x140817668 <.text+0x816668>
140817558:     	movzbl	0x197(%rbp), %esi
14081755f:     	cmpb	%sil, 0x78(%r13)
140817563:     	jne	0x140817668 <.text+0x816668>
140817569:     	cmpl	%r15d, 0x7c(%r13)
14081756d:     	jne	0x140817668 <.text+0x816668>
140817573:     	movzbl	0x198(%rbp), %esi
14081757a:     	cmpb	%sil, 0x80(%r13)
140817581:     	jne	0x140817668 <.text+0x816668>
140817587:     	cmpl	%r12d, 0x84(%r13)
14081758e:     	jne	0x140817668 <.text+0x816668>
140817594:     	movzbl	0x199(%rbp), %esi
14081759b:     	cmpb	%sil, 0x88(%r13)
1408175a2:     	jne	0x140817668 <.text+0x816668>
1408175a8:     	movl	0x114(%rbp), %esi
1408175ae:     	cmpl	%esi, 0x8c(%r13)
1408175b5:     	jne	0x140817668 <.text+0x816668>
1408175bb:     	movzbl	0x19a(%rbp), %esi
1408175c2:     	cmpb	%sil, 0x90(%r13)
1408175c9:     	jne	0x140817668 <.text+0x816668>
1408175cf:     	movl	0x110(%rbp), %esi
1408175d5:     	cmpl	%esi, 0x94(%r13)
1408175dc:     	jne	0x140817668 <.text+0x816668>
1408175e2:     	movzbl	0x19b(%rbp), %esi
1408175e9:     	cmpb	%sil, 0x98(%r13)
1408175f0:     	jne	0x140817668 <.text+0x816668>
1408175f2:     	movl	0x10c(%rbp), %esi
1408175f8:     	cmpl	%esi, 0x9c(%r13)
1408175ff:     	jne	0x140817668 <.text+0x816668>
140817601:     	movzbl	0x19e(%rbp), %esi
140817608:     	cmpb	%sil, 0xa0(%r13)
14081760f:     	jne	0x140817668 <.text+0x816668>
140817611:     	movl	0x108(%rbp), %esi
140817617:     	cmpl	%esi, 0xa4(%r13)
14081761e:     	jne	0x140817668 <.text+0x816668>
140817620:     	movzbl	0x19d(%rbp), %esi
140817627:     	cmpb	%sil, 0xa8(%r13)
14081762e:     	jne	0x140817668 <.text+0x816668>
140817630:     	movl	0x104(%rbp), %esi
140817636:     	cmpl	%esi, 0xac(%r13)
14081763d:     	setne	0x187(%rbp)
140817644:     	movzbl	0x19c(%rbp), %esi
14081764b:     	cmpb	%sil, 0xb0(%r13)
140817652:     	setne	%sil
140817656:     	orb	0x187(%rbp), %sil
14081765d:     	orb	%sil, %al
140817660:     	testb	$0x1, %al
140817662:     	je	0x140817a41 <.text+0x816a41>
140817668:     	movq	0x50(%rbp), %rax
14081766c:     	movl	0x124(%rbp), %esi
140817672:     	movl	%esi, (%rax)
140817674:     	movl	$0x0, (%r13)
14081767c:     	movl	%edi, 0x18(%r13)
140817680:     	movl	0x118(%rbp), %eax
140817686:     	movl	%eax, 0x1c(%r13)
14081768a:     	movzbl	0x180(%rbp), %eax
140817691:     	movb	%al, 0x20(%r13)
140817695:     	movzwl	0x134(%rbp), %eax
14081769c:     	movw	%ax, 0x21(%r13)
1408176a1:     	movzbl	0x136(%rbp), %eax
1408176a8:     	movb	%al, 0x23(%r13)
1408176ac:     	movl	0xf4(%rbp), %eax
1408176b2:     	movl	%eax, 0x24(%r13)
1408176b6:     	movzbl	0x18d(%rbp), %eax
1408176bd:     	movb	%al, 0x28(%r13)
1408176c1:     	movzwl	0x138(%rbp), %eax
1408176c8:     	movw	%ax, 0x29(%r13)
1408176cd:     	movzbl	0x13a(%rbp), %eax
1408176d4:     	movb	%al, 0x2b(%r13)
1408176d8:     	movl	0xf8(%rbp), %eax
1408176de:     	movl	%eax, 0x2c(%r13)
1408176e2:     	movzbl	0x18e(%rbp), %eax
1408176e9:     	movb	%al, 0x30(%r13)
1408176ed:     	movzwl	0x13c(%rbp), %eax
1408176f4:     	movw	%ax, 0x31(%r13)
1408176f9:     	movzbl	0x13e(%rbp), %eax
140817700:     	movb	%al, 0x33(%r13)
140817704:     	movl	0xfc(%rbp), %eax
14081770a:     	movl	%eax, 0x34(%r13)
14081770e:     	movzbl	0x18f(%rbp), %eax
140817715:     	movb	%al, 0x38(%r13)
140817719:     	movzwl	0x140(%rbp), %eax
140817720:     	movw	%ax, 0x39(%r13)
140817725:     	movzbl	0x142(%rbp), %eax
14081772c:     	movb	%al, 0x3b(%r13)
140817730:     	movl	0x100(%rbp), %eax
140817736:     	movl	%eax, 0x3c(%r13)
14081773a:     	movzbl	0x190(%rbp), %eax
140817741:     	movb	%al, 0x40(%r13)
140817745:     	movzbl	0x146(%rbp), %eax
14081774c:     	movb	%al, 0x43(%r13)
140817750:     	movzwl	0x144(%rbp), %eax
140817757:     	movw	%ax, 0x41(%r13)
14081775c:     	movl	%ecx, 0x44(%r13)
140817760:     	movzbl	0x191(%rbp), %eax
140817767:     	movb	%al, 0x48(%r13)
14081776b:     	movzbl	0x14a(%rbp), %eax
140817772:     	movb	%al, 0x4b(%r13)
140817776:     	movzwl	0x148(%rbp), %eax
14081777d:     	movw	%ax, 0x49(%r13)
140817782:     	movl	%edx, 0x4c(%r13)
140817786:     	movzbl	0x192(%rbp), %eax
14081778d:     	movb	%al, 0x50(%r13)
140817791:     	movzbl	0x14e(%rbp), %eax
140817798:     	movb	%al, 0x53(%r13)
14081779c:     	movzwl	0x14c(%rbp), %eax
1408177a3:     	movw	%ax, 0x51(%r13)
1408177a8:     	movl	%r8d, 0x54(%r13)
1408177ac:     	movzbl	0x193(%rbp), %eax
1408177b3:     	movb	%al, 0x58(%r13)
1408177b7:     	movzbl	0x152(%rbp), %eax
1408177be:     	movb	%al, 0x5b(%r13)
1408177c2:     	movzwl	0x150(%rbp), %eax
1408177c9:     	movw	%ax, 0x59(%r13)
1408177ce:     	movl	%r9d, 0x5c(%r13)
1408177d2:     	movzbl	0x194(%rbp), %eax
1408177d9:     	movb	%al, 0x60(%r13)
1408177dd:     	movzbl	0x156(%rbp), %eax
1408177e4:     	movb	%al, 0x63(%r13)
1408177e8:     	movzwl	0x154(%rbp), %eax
1408177ef:     	movw	%ax, 0x61(%r13)
1408177f4:     	movl	%r10d, 0x64(%r13)
1408177f8:     	movzbl	0x195(%rbp), %eax
1408177ff:     	movb	%al, 0x68(%r13)
140817803:     	movzbl	0x15a(%rbp), %eax
14081780a:     	movb	%al, 0x6b(%r13)
14081780e:     	movzwl	0x158(%rbp), %eax
140817815:     	movw	%ax, 0x69(%r13)
14081781a:     	movl	%r14d, 0x6c(%r13)
14081781e:     	movzbl	0x196(%rbp), %eax
140817825:     	movb	%al, 0x70(%r13)
140817829:     	movzbl	0x15e(%rbp), %eax
140817830:     	movb	%al, 0x73(%r13)
140817834:     	movzwl	0x15c(%rbp), %eax
14081783b:     	movw	%ax, 0x71(%r13)
140817840:     	movl	%r11d, 0x74(%r13)
140817844:     	movzbl	0x197(%rbp), %eax
14081784b:     	movb	%al, 0x78(%r13)
14081784f:     	movzbl	0x162(%rbp), %eax
140817856:     	movb	%al, 0x7b(%r13)
14081785a:     	movzwl	0x160(%rbp), %eax
140817861:     	movw	%ax, 0x79(%r13)
140817866:     	movl	%r15d, 0x7c(%r13)
14081786a:     	movzbl	0x198(%rbp), %eax
140817871:     	movb	%al, 0x80(%r13)
140817878:     	movzbl	0x166(%rbp), %eax
14081787f:     	movb	%al, 0x83(%r13)
140817886:     	movzwl	0x164(%rbp), %eax
14081788d:     	movw	%ax, 0x81(%r13)
140817895:     	movl	%r12d, 0x84(%r13)
14081789c:     	movzbl	0x199(%rbp), %eax
1408178a3:     	movb	%al, 0x88(%r13)
1408178aa:     	movzbl	0x16a(%rbp), %eax
1408178b1:     	movb	%al, 0x8b(%r13)
1408178b8:     	movzwl	0x168(%rbp), %eax
1408178bf:     	movw	%ax, 0x89(%r13)
1408178c7:     	movl	0x114(%rbp), %eax
1408178cd:     	movl	%eax, 0x8c(%r13)
1408178d4:     	movzbl	0x19a(%rbp), %eax
1408178db:     	movb	%al, 0x90(%r13)
1408178e2:     	movzbl	0x16e(%rbp), %eax
1408178e9:     	movb	%al, 0x93(%r13)
1408178f0:     	movzwl	0x16c(%rbp), %eax
1408178f7:     	movw	%ax, 0x91(%r13)
1408178ff:     	movl	0x110(%rbp), %eax
140817905:     	movl	%eax, 0x94(%r13)
14081790c:     	movzbl	0x19b(%rbp), %eax
140817913:     	movb	%al, 0x98(%r13)
14081791a:     	movzbl	0x172(%rbp), %eax
140817921:     	movb	%al, 0x9b(%r13)
140817928:     	movzwl	0x170(%rbp), %eax
14081792f:     	movw	%ax, 0x99(%r13)
140817937:     	movl	0x10c(%rbp), %eax
14081793d:     	movl	%eax, 0x9c(%r13)
140817944:     	movzbl	0x19e(%rbp), %eax
14081794b:     	movb	%al, 0xa0(%r13)
140817952:     	movzbl	0x176(%rbp), %eax
140817959:     	movb	%al, 0xa3(%r13)
140817960:     	movzwl	0x174(%rbp), %eax
140817967:     	movw	%ax, 0xa1(%r13)
14081796f:     	movl	0x108(%rbp), %eax
140817975:     	movl	%eax, 0xa4(%r13)
14081797c:     	movzbl	0x19d(%rbp), %eax
140817983:     	movb	%al, 0xa8(%r13)
14081798a:     	movzbl	0x17a(%rbp), %eax
140817991:     	movb	%al, 0xab(%r13)
140817998:     	movzwl	0x178(%rbp), %eax
14081799f:     	movw	%ax, 0xa9(%r13)
1408179a7:     	movl	0x104(%rbp), %eax
1408179ad:     	movl	%eax, 0xac(%r13)
1408179b4:     	movzbl	0x19c(%rbp), %eax
1408179bb:     	movb	%al, 0xb0(%r13)
1408179c2:     	movzbl	0x17e(%rbp), %eax
1408179c9:     	movb	%al, 0xb3(%r13)
1408179d0:     	movzwl	0x17c(%rbp), %eax
1408179d7:     	movw	%ax, 0xb1(%r13)
1408179df:     	movzbl	0x128(%rbp), %eax
1408179e6:     	movb	%al, 0xb4(%r13)
1408179ed:     	movzbl	0x19f(%rbp), %eax
1408179f4:     	movb	%al, 0xb5(%r13)
1408179fb:     	movzbl	0x188(%rbp), %eax
140817a02:     	movb	%al, 0xb6(%r13)
140817a09:     	movzbl	0x189(%rbp), %eax
140817a10:     	movb	%al, 0xb7(%r13)
140817a17:     	movzbl	0x18a(%rbp), %eax
140817a1e:     	movb	%al, 0xb8(%r13)
140817a25:     	movzbl	0x18b(%rbp), %eax
140817a2c:     	movb	%al, 0xb9(%r13)
140817a33:     	movzbl	0x18c(%rbp), %eax
140817a3a:     	movb	%al, 0xba(%r13)
140817a41:     	movss	0xbc(%r13), %xmm1
140817a4a:     	movss	0x71880ea(%rip), %xmm0  # 0x14799fb3c
140817a52:     	ucomiss	%xmm0, %xmm1
140817a55:     	movq	%rbx, %r14
140817a58:     	jne	0x140817a5c <.text+0x816a5c>
140817a5a:     	jnp	0x140817a71 <.text+0x816a71>
140817a5c:     	movq	0x50(%rbp), %rax
140817a60:     	movl	0x124(%rbp), %ecx
140817a66:     	movl	%ecx, (%rax)
140817a68:     	movss	%xmm0, 0xbc(%r13)
140817a71:     	movq	0x40(%rbp), %r15
140817a75:     	cmpq	$0x0, 0x18(%r15)
140817a7a:     	je	0x140817d3d <.text+0x816d3d>
140817a80:     	leaq	0x20(%r15), %rcx
140817a84:     	leaq	0x51e36fd(%rip), %rdx   # 0x1459fb188
140817a8b:     	movl	$0x7, %r8d
140817a91:     	callq	0x1400bcfb0 <.text+0xbbfb0>
140817a96:     	movq	%rax, %r8
140817a99:     	shrq	$0x39, %r8
140817a9d:     	movq	(%r15), %rcx
140817aa0:     	movq	0x8(%r15), %rdx
140817aa4:     	movd	%r8d, %xmm0
140817aa9:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140817aad:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140817ab2:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140817ab7:     	xorl	%r8d, %r8d
140817aba:     	pcmpeqd	%xmm1, %xmm1
140817abe:     	movl	$0x73657264, %r9d       # imm = 0x73657264
140817ac4:     	movl	$0x70757373, %r10d      # imm = 0x70757373
140817aca:     	andq	%rdx, %rax
140817acd:     	movdqu	(%rcx,%rax), %xmm2
140817ad2:     	movdqa	%xmm2, %xmm3
140817ad6:     	pcmpeqb	%xmm0, %xmm3
140817ada:     	pmovmskb	%xmm3, %r11d
140817adf:     	testl	%r11d, %r11d
140817ae2:     	je	0x140817b24 <.text+0x816b24>
140817ae4:     	tzcntl	%r11d, %edi
140817ae9:     	addq	%rax, %rdi
140817aec:     	andq	%rdx, %rdi
140817aef:     	shlq	$0x5, %rdi
140817af3:     	movq	%rcx, %rsi
140817af6:     	subq	%rdi, %rsi
140817af9:     	cmpq	$0x7, -0x10(%rsi)
140817afe:     	jne	0x140817b17 <.text+0x816b17>
140817b00:     	movq	-0x18(%rsi), %rdi
140817b04:     	movl	(%rdi), %ebx
140817b06:     	xorl	%r9d, %ebx
140817b09:     	movl	0x3(%rdi), %edi
140817b0c:     	xorl	%r10d, %edi
140817b0f:     	orl	%ebx, %edi
140817b11:     	je	0x140817d2d <.text+0x816d2d>
140817b17:     	leal	-0x1(%r11), %esi
140817b1b:     	andw	%r11w, %si
140817b1f:     	movl	%esi, %r11d
140817b22:     	jne	0x140817ae4 <.text+0x816ae4>
140817b24:     	pcmpeqb	%xmm1, %xmm2
140817b28:     	pmovmskb	%xmm2, %r11d
140817b2d:     	testl	%r11d, %r11d
140817b30:     	jne	0x140817d3d <.text+0x816d3d>
140817b36:     	addq	%r8, %rax
140817b39:     	addq	$0x10, %rax
140817b3d:     	addq	$0x10, %r8
140817b41:     	jmp	0x140817aca <.text+0x816aca>
140817b43:     	cmpb	$0x0, (%rbx)
140817b46:     	je	0x140817bd4 <.text+0x816bd4>
140817b4c:     	movb	$0x0, (%rbx)
140817b4f:     	movq	0x50(%rbp), %rax
140817b53:     	movl	0x124(%rbp), %ecx
140817b59:     	movl	%ecx, (%rax)
140817b5b:     	movl	$0x2, (%r13)
140817b63:     	movq	0x48(%rbp), %rax
140817b67:     	movl	0xf0(%rbp), %ecx
140817b6d:     	movl	%ecx, (%rax)
140817b6f:     	movq	0x40(%rbp), %rsi
140817b73:     	leaq	0x20(%rsi), %rcx
140817b77:     	leaq	0x51e360a(%rip), %rbx   # 0x1459fb188
140817b7e:     	movl	$0x7, %r8d
140817b84:     	movq	%rbx, %rdx
140817b87:     	callq	0x1400bcfb0 <.text+0xbbfb0>
140817b8c:     	nop
140817b8d:     	movq	$0x7, 0x20(%rsp)
140817b96:     	leaq	0x58(%rbp), %rcx
140817b9a:     	movq	%rsi, %rdx
140817b9d:     	movq	%rax, %r8
140817ba0:     	movq	%rbx, %r9
140817ba3:     	callq	0x140f75e50 <.text+0xf74e50>
140817ba8:     	nop
140817ba9:     	movq	0x58(%rbp), %rdx
140817bad:     	cmpq	$-0x1, %rdx
140817bb1:     	je	0x140817bc7 <.text+0x816bc7>
140817bb3:     	testq	%rdx, %rdx
140817bb6:     	je	0x140817bc7 <.text+0x816bc7>
140817bb8:     	movq	0x60(%rbp), %rcx
140817bbc:     	movl	$0x1, %r8d
140817bc2:     	callq	0x1400021d0 <.text+0x11d0>
140817bc7:     	cmpb	$0x2, 0x7187ea2(%rip)   # 0x14799fa70
140817bce:     	jne	0x140817ca1 <.text+0x816ca1>
140817bd4:     	cmpb	$0x0, 0x130(%rbp)
140817bdb:     	jne	0x140817bed <.text+0x816bed>
140817bdd:     	movq	(%r12), %rax
140817be1:     	shlq	%rax
140817be4:     	testq	%rax, %rax
140817be7:     	jne	0x140817db8 <.text+0x816db8>
140817bed:     	xorl	%eax, %eax
140817bef:     	xchgb	%al, 0x7187e73(%rip)    # 0x14799fa68
140817bf5:     	cmpb	$0x2, %al
140817bf7:     	je	0x140817e19 <.text+0x816e19>
140817bfd:     	addq	$0x228, %rsp            # imm = 0x228
140817c04:     	popq	%rbx
140817c05:     	popq	%rdi
140817c06:     	popq	%rsi
140817c07:     	popq	%r12
140817c09:     	popq	%r13
140817c0b:     	popq	%r14
140817c0d:     	popq	%r15
140817c0f:     	popq	%rbp
140817c10:     	retq
140817c11:     	movq	0x118(%rbp), %rax
140817c18:     	movl	0x180(%rbp), %ecx
140817c1e:     	movl	%ecx, (%rax)
140817c20:     	movl	0x7187e62(%rip), %esi   # 0x14799fa88
140817c26:     	testl	%esi, %esi
140817c28:     	je	0x140816fb1 <.text+0x815fb1>
140817c2e:     	movl	0x7187e57(%rip), %r14d  # 0x14799fa8c
140817c35:     	testl	%r14d, %r14d
140817c38:     	je	0x140816fb1 <.text+0x815fb1>
140817c3e:     	leaq	0x7187e2b(%rip), %rdx   # 0x14799fa70
140817c45:     	movq	%rdi, %rcx
140817c48:     	callq	0x14099f210 <.text+0x99e210>
140817c4d:     	nop
140817c4e:     	testq	%rax, %rax
140817c51:     	je	0x140817c68 <.text+0x816c68>
140817c53:     	cmpl	%esi, 0xa0(%rax)
140817c59:     	jne	0x140817c68 <.text+0x816c68>
140817c5b:     	cmpl	%r14d, 0xa4(%rax)
140817c62:     	je	0x140816fb1 <.text+0x815fb1>
140817c68:     	leaq	0x7187e01(%rip), %rdx   # 0x14799fa70
140817c6f:     	movq	%rdi, %rcx
140817c72:     	callq	0x140f75080 <.text+0xf74080>
140817c77:     	nop
140817c78:     	testq	%rax, %rax
140817c7b:     	je	0x140816fb1 <.text+0x815fb1>
140817c81:     	movl	%esi, 0x58(%rbp)
140817c84:     	movl	%r14d, 0x5c(%rbp)
140817c88:     	movl	$0x1, 0x60(%rbp)
140817c8f:     	leaq	0x58(%rbp), %rdx
140817c93:     	movq	%rax, %rcx
140817c96:     	callq	0x1448c9dd0 <.text+0x48c8dd0>
140817c9b:     	nop
140817c9c:     	jmp	0x140816fb1 <.text+0x815fb1>
140817ca1:     	movq	0x118(%rbp), %rax
140817ca8:     	movl	0x180(%rbp), %ecx
140817cae:     	movl	%ecx, (%rax)
140817cb0:     	movl	0x7187dda(%rip), %esi   # 0x14799fa90
140817cb6:     	testl	%esi, %esi
140817cb8:     	je	0x140817bd4 <.text+0x816bd4>
140817cbe:     	movl	0x7187dd0(%rip), %ebx   # 0x14799fa94
140817cc4:     	testl	%ebx, %ebx
140817cc6:     	je	0x140817bd4 <.text+0x816bd4>
140817ccc:     	leaq	0x7187d9d(%rip), %rdx   # 0x14799fa70
140817cd3:     	movq	%rdi, %rcx
140817cd6:     	callq	0x14099f210 <.text+0x99e210>
140817cdb:     	nop
140817cdc:     	testq	%rax, %rax
140817cdf:     	je	0x140817cf5 <.text+0x816cf5>
140817ce1:     	cmpl	%esi, 0xa0(%rax)
140817ce7:     	jne	0x140817cf5 <.text+0x816cf5>
140817ce9:     	cmpl	%ebx, 0xa4(%rax)
140817cef:     	je	0x140817bd4 <.text+0x816bd4>
140817cf5:     	leaq	0x7187d74(%rip), %rdx   # 0x14799fa70
140817cfc:     	movq	%rdi, %rcx
140817cff:     	callq	0x140f75080 <.text+0xf74080>
140817d04:     	nop
140817d05:     	testq	%rax, %rax
140817d08:     	je	0x140817bd4 <.text+0x816bd4>
140817d0e:     	movl	%esi, 0x58(%rbp)
140817d11:     	movl	%ebx, 0x5c(%rbp)
140817d14:     	movl	$0x1, 0x60(%rbp)
140817d1b:     	leaq	0x58(%rbp), %rdx
140817d1f:     	movq	%rax, %rcx
140817d22:     	callq	0x1448c9dd0 <.text+0x48c8dd0>
140817d27:     	nop
140817d28:     	jmp	0x140817bd4 <.text+0x816bd4>
140817d2d:     	movss	-0x8(%rsi), %xmm0
140817d32:     	ucomiss	0x7187e07(%rip), %xmm0  # 0x14799fb40
140817d39:     	jne	0x140817d3d <.text+0x816d3d>
140817d3b:     	jnp	0x140817d9c <.text+0x816d9c>
140817d3d:     	movq	0x48(%rbp), %rax
140817d41:     	movl	0xf0(%rbp), %ecx
140817d47:     	movl	%ecx, (%rax)
140817d49:     	callq	0x140002200 <.text+0x1200>
140817d4e:     	movl	$0x7, %ecx
140817d53:     	movl	$0x1, %edx
140817d58:     	callq	0x1400021c0 <.text+0x11c0>
140817d5d:     	testq	%rax, %rax
140817d60:     	je	0x140817e2a <.text+0x816e2a>
140817d66:     	movl	$0x70757373, 0x3(%rax)  # imm = 0x70757373
140817d6d:     	movl	$0x73657264, (%rax)     # imm = 0x73657264
140817d73:     	movq	$0x7, 0x58(%rbp)
140817d7b:     	movq	%rax, 0x60(%rbp)
140817d7f:     	movq	$0x7, 0x68(%rbp)
140817d87:     	movd	0x7187db1(%rip), %xmm2  # 0x14799fb40
140817d8f:     	leaq	0x58(%rbp), %rdx
140817d93:     	movq	%r15, %rcx
140817d96:     	callq	0x140bcb030 <.text+0xbca030>
140817d9b:     	nop
140817d9c:     	cmpb	$0x0, 0x130(%rbp)
140817da3:     	jne	0x140817bed <.text+0x816bed>
140817da9:     	movq	(%r14), %rax
140817dac:     	shlq	%rax
140817daf:     	testq	%rax, %rax
140817db2:     	je	0x140817bed <.text+0x816bed>
140817db8:     	callq	0x1458e6650 <.text+0x58e5650>
140817dbd:     	testb	%al, %al
140817dbf:     	jne	0x140817bed <.text+0x816bed>
140817dc5:     	movb	$0x1, 0x7187c9d(%rip)   # 0x14799fa69
140817dcc:     	jmp	0x140817bed <.text+0x816bed>
140817dd1:     	leaq	0x7187c90(%rip), %rcx   # 0x14799fa68
140817dd8:     	callq	0x145762bfa <.text+0x5761bfa>
140817ddd:     	jmp	0x140816bd8 <.text+0x815bd8>
140817de2:     	leaq	0x7187c7f(%rip), %rcx   # 0x14799fa68
140817de9:     	callq	0x1458e58c0 <.text+0x58e48c0>
140817dee:     	jmp	0x140816bee <.text+0x815bee>
140817df3:     	callq	0x1458e6650 <.text+0x58e5650>
140817df8:     	xorb	$0x1, %al
140817dfa:     	movl	%eax, 0x130(%rbp)
140817e00:     	movzbl	0x7187c62(%rip), %eax   # 0x14799fa69
140817e07:     	cmpb	$0x2, 0x7187c62(%rip)   # 0x14799fa70
140817e0e:     	je	0x140816c23 <.text+0x815c23>
140817e14:     	jmp	0x140816f21 <.text+0x815f21>
140817e19:     	leaq	0x7187c48(%rip), %rcx   # 0x14799fa68
140817e20:     	callq	0x1458e5980 <.text+0x58e4980>
140817e25:     	jmp	0x140817bfd <.text+0x816bfd>
140817e2a:     	movl	$0x1, %ecx
140817e2f:     	movl	$0x7, %edx
140817e34:     	callq	0x1458e721b <.text+0x58e621b>
140817e39:     	nop
140817e3a:     	ud2
