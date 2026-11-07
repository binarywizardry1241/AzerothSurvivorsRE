
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e1d00:     	pushq	%rbp
1454e1d01:     	pushq	%r15
1454e1d03:     	pushq	%r14
1454e1d05:     	pushq	%r13
1454e1d07:     	pushq	%r12
1454e1d09:     	pushq	%rsi
1454e1d0a:     	pushq	%rdi
1454e1d0b:     	pushq	%rbx
1454e1d0c:     	subq	$0x318, %rsp            # imm = 0x318
1454e1d13:     	leaq	0x80(%rsp), %rbp
1454e1d1b:     	movaps	%xmm15, 0x280(%rbp)
1454e1d23:     	movaps	%xmm14, 0x270(%rbp)
1454e1d2b:     	movaps	%xmm13, 0x260(%rbp)
1454e1d33:     	movaps	%xmm12, 0x250(%rbp)
1454e1d3b:     	movaps	%xmm11, 0x240(%rbp)
1454e1d43:     	movaps	%xmm10, 0x230(%rbp)
1454e1d4b:     	movaps	%xmm9, 0x220(%rbp)
1454e1d53:     	movaps	%xmm8, 0x210(%rbp)
1454e1d5b:     	movaps	%xmm7, 0x200(%rbp)
1454e1d62:     	movaps	%xmm6, 0x1f0(%rbp)
1454e1d69:     	movq	$-0x2, 0x1e8(%rbp)
1454e1d74:     	movss	%xmm2, 0x154(%rbp)
1454e1d7c:     	movq	%rdx, %rbx
1454e1d7f:     	movq	$0x0, 0x1a0(%rbp)
1454e1d8a:     	movq	$0x8, 0x1a8(%rbp)
1454e1d95:     	movq	$0x0, 0x1b0(%rbp)
1454e1da0:     	movq	0x2b8(%rdx), %rdi
1454e1da7:     	testq	%rdi, %rdi
1454e1daa:     	movq	%rcx, 0x50(%rbp)
1454e1dae:     	je	0x1454e1dc3 <.text+0x54e0dc3>
1454e1db0:     	movq	0x2b0(%rbx), %rax
1454e1db7:     	cmpq	$0x1, %rdi
1454e1dbb:     	jne	0x1454e1dd6 <.text+0x54e0dd6>
1454e1dbd:     	xorl	%edx, %edx
1454e1dbf:     	xorl	%ecx, %ecx
1454e1dc1:     	jmp	0x1454e1e22 <.text+0x54e0e22>
1454e1dc3:     	movq	$0x0, 0x1c0(%rbp)
1454e1dce:     	xorl	%r14d, %r14d
1454e1dd1:     	jmp	0x1454e1ed5 <.text+0x54e0ed5>
1454e1dd6:     	movq	%rdi, %r8
1454e1dd9:     	andq	$-0x2, %r8
1454e1ddd:     	xorl	%edx, %edx
1454e1ddf:     	movq	%rax, %r9
1454e1de2:     	xorl	%ecx, %ecx
1454e1de4:     	nopw	%cs:(%rax,%rax)
1454e1df0:     	movq	(%r9), %r10
1454e1df3:     	movq	0x18(%r9), %r11
1454e1df7:     	movzbl	0x45(%r10), %r10d
1454e1dfc:     	xorq	$0x1, %r10
1454e1e00:     	addq	%rcx, %r10
1454e1e03:     	movzbl	0x45(%r11), %ecx
1454e1e08:     	xorq	$0x1, %rcx
1454e1e0c:     	addq	%r10, %rcx
1454e1e0f:     	addq	$0x2, %rdx
1454e1e13:     	addq	$0x30, %r9
1454e1e17:     	cmpq	%rdx, %r8
1454e1e1a:     	jne	0x1454e1df0 <.text+0x54e0df0>
1454e1e1c:     	testb	$0x1, %dil
1454e1e20:     	je	0x1454e1e38 <.text+0x54e0e38>
1454e1e22:     	movq	%rcx, %r8
1454e1e25:     	leaq	(%rdx,%rdx,2), %rdx
1454e1e29:     	movq	(%rax,%rdx,8), %rdx
1454e1e2d:     	movzbl	0x45(%rdx), %ecx
1454e1e31:     	xorq	$0x1, %rcx
1454e1e35:     	addq	%r8, %rcx
1454e1e38:     	movl	%edi, %edx
1454e1e3a:     	andl	$0x3, %edx
1454e1e3d:     	cmpq	$0x4, %rdi
1454e1e41:     	movq	%rcx, 0x1c0(%rbp)
1454e1e48:     	jae	0x1454e1e52 <.text+0x54e0e52>
1454e1e4a:     	xorl	%r8d, %r8d
1454e1e4d:     	xorl	%r14d, %r14d
1454e1e50:     	jmp	0x1454e1ea0 <.text+0x54e0ea0>
1454e1e52:     	andq	$-0x4, %rdi
1454e1e56:     	xorl	%r8d, %r8d
1454e1e59:     	movq	%rax, %r9
1454e1e5c:     	xorl	%r14d, %r14d
1454e1e5f:     	nop
1454e1e60:     	movq	(%r9), %r10
1454e1e63:     	movq	0x18(%r9), %r11
1454e1e67:     	movzbl	0x45(%r10), %r10d
1454e1e6c:     	addq	%r14, %r10
1454e1e6f:     	movzbl	0x45(%r11), %r11d
1454e1e74:     	movq	0x30(%r9), %rsi
1454e1e78:     	movzbl	0x45(%rsi), %esi
1454e1e7c:     	addq	%r11, %rsi
1454e1e7f:     	addq	%r10, %rsi
1454e1e82:     	movq	0x48(%r9), %r10
1454e1e86:     	movzbl	0x45(%r10), %r14d
1454e1e8b:     	addq	%rsi, %r14
1454e1e8e:     	addq	$0x4, %r8
1454e1e92:     	addq	$0x60, %r9
1454e1e96:     	cmpq	%r8, %rdi
1454e1e99:     	jne	0x1454e1e60 <.text+0x54e0e60>
1454e1e9b:     	testq	%rdx, %rdx
1454e1e9e:     	je	0x1454e1ed5 <.text+0x54e0ed5>
1454e1ea0:     	leaq	(%r8,%r8,2), %rcx
1454e1ea4:     	leaq	(%rax,%rcx,8), %rax
1454e1ea8:     	shll	$0x3, %edx
1454e1eab:     	leaq	(%rdx,%rdx,2), %rcx
1454e1eaf:     	xorl	%edx, %edx
1454e1eb1:     	nopw	%cs:(%rax,%rax)
1454e1ec0:     	movq	(%rax,%rdx), %r8
1454e1ec4:     	movzbl	0x45(%r8), %r8d
1454e1ec9:     	addq	%r8, %r14
1454e1ecc:     	addq	$0x18, %rdx
1454e1ed0:     	cmpq	%rdx, %rcx
1454e1ed3:     	jne	0x1454e1ec0 <.text+0x54e0ec0>
1454e1ed5:     	movq	0x298(%rbx), %rax
1454e1edc:     	movq	0x2a0(%rbx), %rdx
1454e1ee3:     	imulq	$0x58, %rdx, %r10
1454e1ee7:     	movq	0x378(%rbx), %rcx
1454e1eee:     	cmpb	$0x9, 0x75(%rcx)
1454e1ef2:     	jne	0x1454e1f14 <.text+0x54e0f14>
1454e1ef4:     	movl	0x68(%rcx), %ecx
1454e1ef7:     	addl	$-0x7, %ecx
1454e1efa:     	cmpl	$0x6, %ecx
1454e1efd:     	setb	%r8b
1454e1f01:     	movb	$0x27, %r9b
1454e1f04:     	shrb	%cl, %r9b
1454e1f07:     	movb	$0x1, %cl
1454e1f09:     	movl	%ecx, 0x1d0(%rbp)
1454e1f0f:     	testb	%r9b, %r8b
1454e1f12:     	jne	0x1454e1f5f <.text+0x54e0f5f>
1454e1f14:     	testq	%rdx, %rdx
1454e1f17:     	je	0x1454e1f55 <.text+0x54e0f55>
1454e1f19:     	xorl	%edx, %edx
1454e1f1b:     	jmp	0x1454e1f29 <.text+0x54e0f29>
1454e1f1d:     	nopl	(%rax)
1454e1f20:     	addq	$0x58, %rdx
1454e1f24:     	cmpq	%rdx, %r10
1454e1f27:     	je	0x1454e1f55 <.text+0x54e0f55>
1454e1f29:     	movq	(%rax,%rdx), %rcx
1454e1f2d:     	cmpb	$0x9, 0x75(%rcx)
1454e1f31:     	jne	0x1454e1f20 <.text+0x54e0f20>
1454e1f33:     	movl	0x68(%rcx), %ecx
1454e1f36:     	addl	$-0x7, %ecx
1454e1f39:     	cmpl	$0x6, %ecx
1454e1f3c:     	setb	%r8b
1454e1f40:     	movb	$0x27, %r9b
1454e1f43:     	shrb	%cl, %r9b
1454e1f46:     	testb	%r9b, %r8b
1454e1f49:     	je	0x1454e1f20 <.text+0x54e0f20>
1454e1f4b:     	movb	$0x1, %cl
1454e1f4d:     	movl	%ecx, 0x1d0(%rbp)
1454e1f53:     	jmp	0x1454e1f5f <.text+0x54e0f5f>
1454e1f55:     	movl	$0x0, 0x1d0(%rbp)
1454e1f5f:     	xorl	%ecx, %ecx
1454e1f61:     	nopw	%cs:(%rax,%rax)
1454e1f70:     	movq	%rcx, %r8
1454e1f73:     	cmpq	%rcx, %r10
1454e1f76:     	je	0x1454e1f86 <.text+0x54e0f86>
1454e1f78:     	movq	(%rax,%r8), %rdx
1454e1f7c:     	leaq	0x58(%r8), %rcx
1454e1f80:     	cmpb	$0x6, 0x75(%rdx)
1454e1f84:     	jne	0x1454e1f70 <.text+0x54e0f70>
1454e1f86:     	movq	%r8, 0x120(%rbp)
1454e1f8d:     	movq	%r10, 0x1b8(%rbp)
1454e1f94:     	movq	%r14, 0x128(%rbp)
1454e1f9b:     	movq	$0x0, 0x130(%rbp)
1454e1fa6:     	movl	0x1d0(%rbp), %eax
1454e1fac:     	notb	%al
1454e1fae:     	movl	%eax, 0x1d0(%rbp)
1454e1fb4:     	movss	0x4094cc(%rip), %xmm7   # 0x1458eb488
1454e1fbc:     	movss	0x41465f(%rip), %xmm8   # 0x1458f6624
1454e1fc5:     	movss	0x45c5c6(%rip), %xmm9   # 0x14593e594
1454e1fce:     	movss	0x416e0d(%rip), %xmm10  # 0x1458f8de4
1454e1fd7:     	movss	0x409534(%rip), %xmm11  # 0x1458eb514
1454e1fe0:     	movss	0x414643(%rip), %xmm12  # 0x1458f662c
1454e1fe9:     	movss	0x14c8626(%rip), %xmm13 # 0x1469aa618
1454e1ff2:     	movss	0x4094fd(%rip), %xmm14  # 0x1458eb4f8
1454e1ffb:     	xorl	%r14d, %r14d
1454e1ffe:     	movq	%rbx, 0x168(%rbp)
1454e2005:     	movq	0x810(%rbx), %r15
1454e200c:     	movq	0x818(%rbx), %rax
1454e2013:     	movq	%rax, 0x158(%rbp)
1454e201a:     	leaq	(,%rax,8), %rax
1454e2022:     	leaq	(%rax,%rax,2), %rsi
1454e2026:     	movq	0x2b0(%rbx), %r12
1454e202d:     	movq	0x2b8(%rbx), %rax
1454e2034:     	movq	%rax, 0x160(%rbp)
1454e203b:     	leaq	(,%rax,8), %rax
1454e2043:     	leaq	(%rax,%rax,2), %rdi
1454e2047:     	movl	0x4a8(%rbx), %eax
1454e204d:     	movl	%eax, 0x104(%rbp)
1454e2053:     	jmp	0x1454e2070 <.text+0x54e1070>
1454e2055:     	cmpl	$0x2, 0x104(%rbp)
1454e205c:     	movq	0x1c8(%rbp), %r14
1454e2063:     	jb	0x1454e2245 <.text+0x54e1245>
1454e2069:     	nopl	(%rax)
1454e2070:     	cmpq	$0x630, %r14            # imm = 0x630
1454e2077:     	je	0x1454e22ec <.text+0x54e12ec>
1454e207d:     	leaq	0x123c474(%rip), %rax   # 0x14671e4f8
1454e2084:     	addq	%r14, %rax
1454e2087:     	movq	%rax, 0x1d8(%rbp)
1454e208e:     	addq	$0x48, %r14
1454e2092:     	movq	%r14, 0x1c8(%rbp)
1454e2099:     	cmpq	$0x0, 0x158(%rbp)
1454e20a1:     	je	0x1454e20f0 <.text+0x54e10f0>
1454e20a3:     	movq	0x1d8(%rbp), %rax
1454e20aa:     	movq	(%rax), %rbx
1454e20ad:     	movq	0x8(%rax), %r14
1454e20b1:     	xorl	%r13d, %r13d
1454e20b4:     	jmp	0x1454e20c9 <.text+0x54e10c9>
1454e20b6:     	nopw	%cs:(%rax,%rax)
1454e20c0:     	addq	$0x18, %r13
1454e20c4:     	cmpq	%r13, %rsi
1454e20c7:     	je	0x1454e20f0 <.text+0x54e10f0>
1454e20c9:     	cmpq	%r14, 0x10(%r15,%r13)
1454e20ce:     	jne	0x1454e20c0 <.text+0x54e10c0>
1454e20d0:     	movq	0x8(%r15,%r13), %rcx
1454e20d5:     	movq	%rbx, %rdx
1454e20d8:     	movq	%r14, %r8
1454e20db:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e20e0:     	testl	%eax, %eax
1454e20e2:     	jne	0x1454e20c0 <.text+0x54e10c0>
1454e20e4:     	movq	0x1c8(%rbp), %r14
1454e20eb:     	jmp	0x1454e2070 <.text+0x54e1070>
1454e20ed:     	nopl	(%rax)
1454e20f0:     	cmpq	$0x0, 0x160(%rbp)
1454e20f8:     	je	0x1454e21a0 <.text+0x54e11a0>
1454e20fe:     	movq	0x1d8(%rbp), %rax
1454e2105:     	movq	(%rax), %rbx
1454e2108:     	movq	0x8(%rax), %r14
1454e210c:     	xorl	%r13d, %r13d
1454e210f:     	jmp	0x1454e2129 <.text+0x54e1129>
1454e2111:     	nopw	%cs:(%rax,%rax)
1454e2120:     	addq	$0x18, %r13
1454e2124:     	cmpq	%r13, %rdi
1454e2127:     	je	0x1454e21a0 <.text+0x54e11a0>
1454e2129:     	movq	(%r12,%r13), %rax
1454e212d:     	cmpq	%r14, 0x8(%rax)
1454e2131:     	jne	0x1454e2120 <.text+0x54e1120>
1454e2133:     	movq	(%rax), %rcx
1454e2136:     	movq	%rbx, %rdx
1454e2139:     	movq	%r14, %r8
1454e213c:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e2141:     	testl	%eax, %eax
1454e2143:     	jne	0x1454e2120 <.text+0x54e1120>
1454e2145:     	movq	0x1d8(%rbp), %rax
1454e214c:     	movzbl	0x44(%rax), %eax
1454e2150:     	cmpl	$0xf, %eax
1454e2153:     	je	0x1454e2055 <.text+0x54e1055>
1454e2159:     	movaps	%xmm10, %xmm0
1454e215d:     	cmpl	$0x12, %eax
1454e2160:     	movq	0x1c8(%rbp), %r14
1454e2167:     	ja	0x1454e2225 <.text+0x54e1225>
1454e216d:     	movl	%eax, %eax
1454e216f:     	leaq	0x14cacf6(%rip), %rcx   # 0x1469ace6c
1454e2176:     	movslq	(%rcx,%rax,4), %rax
1454e217a:     	addq	%rcx, %rax
1454e217d:     	movaps	%xmm9, %xmm1
1454e2181:     	movaps	%xmm10, %xmm0
1454e2185:     	jmpq	*%rax
1454e2187:     	ucomiss	0x10(%r12,%r13), %xmm1
1454e218d:     	jbe	0x1454e2070 <.text+0x54e1070>
1454e2193:     	jmp	0x1454e2245 <.text+0x54e1245>
1454e2198:     	nopl	(%rax,%rax)
1454e21a0:     	movq	0x120(%rbp), %rax
1454e21a7:     	cmpq	%rax, 0x1b8(%rbp)
1454e21ae:     	setne	%al
1454e21b1:     	movq	0x1d8(%rbp), %rcx
1454e21b8:     	movzbl	0x44(%rcx), %ecx
1454e21bc:     	cmpb	$0x10, %cl
1454e21bf:     	sete	%dl
1454e21c2:     	cmpb	$0x12, %cl
1454e21c5:     	setne	%cl
1454e21c8:     	testb	%dl, 0x1d0(%rbp)
1454e21ce:     	movq	0x1c8(%rbp), %r14
1454e21d5:     	jne	0x1454e2070 <.text+0x54e1070>
1454e21db:     	orb	%cl, %al
1454e21dd:     	je	0x1454e2070 <.text+0x54e1070>
1454e21e3:     	movq	0x1d8(%rbp), %rax
1454e21ea:     	cmpb	$0x0, 0x45(%rax)
1454e21ee:     	movq	0x1c0(%rbp), %rax
1454e21f5:     	cmovneq	0x128(%rbp), %rax
1454e21fd:     	cmpq	$0x1, %rax
1454e2201:     	ja	0x1454e2070 <.text+0x54e1070>
1454e2207:     	jmp	0x1454e2280 <.text+0x54e1280>
1454e2209:     	movaps	%xmm12, %xmm0
1454e220d:     	jmp	0x1454e2225 <.text+0x54e1225>
1454e220f:     	movaps	%xmm13, %xmm1
1454e2213:     	ucomiss	0x10(%r12,%r13), %xmm1
1454e2219:     	jbe	0x1454e2070 <.text+0x54e1070>
1454e221f:     	jmp	0x1454e2245 <.text+0x54e1245>
1454e2221:     	movaps	%xmm14, %xmm0
1454e2225:     	movq	0x1d8(%rbp), %rax
1454e222c:     	mulss	0x40(%rax), %xmm0
1454e2231:     	mulss	%xmm11, %xmm0
1454e2236:     	movaps	%xmm0, %xmm1
1454e2239:     	ucomiss	0x10(%r12,%r13), %xmm1
1454e223f:     	jbe	0x1454e2070 <.text+0x54e1070>
1454e2245:     	movaps	%xmm8, %xmm0
1454e2249:     	movq	0x130(%rbp), %rsi
1454e2250:     	cmpq	0x1a0(%rbp), %rsi
1454e2257:     	movq	0x168(%rbp), %rbx
1454e225e:     	jne	0x1454e22b1 <.text+0x54e12b1>
1454e2260:     	movb	$0x1, 0x1e7(%rbp)
1454e2267:     	leaq	0x1a0(%rbp), %rcx
1454e226e:     	callq	0x145757f60 <.text+0x5756f60>
1454e2273:     	nop
1454e2274:     	movaps	%xmm8, %xmm0
1454e2278:     	jmp	0x1454e22b1 <.text+0x54e12b1>
1454e227a:     	nopw	(%rax,%rax)
1454e2280:     	movaps	%xmm7, %xmm0
1454e2283:     	movq	0x130(%rbp), %rsi
1454e228a:     	cmpq	0x1a0(%rbp), %rsi
1454e2291:     	movq	0x168(%rbp), %rbx
1454e2298:     	jne	0x1454e22b1 <.text+0x54e12b1>
1454e229a:     	movb	$0x1, 0x1e7(%rbp)
1454e22a1:     	leaq	0x1a0(%rbp), %rcx
1454e22a8:     	callq	0x145757f60 <.text+0x5756f60>
1454e22ad:     	nop
1454e22ae:     	movaps	%xmm7, %xmm0
1454e22b1:     	movq	0x1a8(%rbp), %rax
1454e22b8:     	leaq	(%rsi,%rsi,2), %rcx
1454e22bc:     	movss	%xmm0, (%rax,%rcx,8)
1454e22c1:     	movq	$0x0, 0x8(%rax,%rcx,8)
1454e22ca:     	movq	0x1d8(%rbp), %rdx
1454e22d1:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454e22d6:     	incq	%rsi
1454e22d9:     	movq	%rsi, 0x130(%rbp)
1454e22e0:     	movq	%rsi, 0x1b0(%rbp)
1454e22e7:     	jmp	0x1454e2005 <.text+0x54e1005>
1454e22ec:     	movq	0x130(%rbp), %rdi
1454e22f3:     	cmpq	0x1a0(%rbp), %rdi
1454e22fa:     	movq	0x168(%rbp), %rsi
1454e2301:     	jne	0x1454e2317 <.text+0x54e1317>
1454e2303:     	movb	$0x1, 0x1e7(%rbp)
1454e230a:     	leaq	0x1a0(%rbp), %rcx
1454e2311:     	callq	0x145757f60 <.text+0x5756f60>
1454e2316:     	nop
1454e2317:     	movq	0x1a8(%rbp), %rax
1454e231e:     	leaq	(%rdi,%rdi,2), %rcx
1454e2322:     	movl	$0x40200000, (%rax,%rcx,8) # imm = 0x40200000
1454e2329:     	movq	$0x1, 0x8(%rax,%rcx,8)
1454e2332:     	leaq	0x1(%rdi), %rbx
1454e2336:     	movq	%rbx, 0x1b0(%rbp)
1454e233d:     	cmpq	$-0x1, 0x308(%rsi)
1454e2345:     	je	0x1454e238d <.text+0x54e138d>
1454e2347:     	cmpq	0x1a0(%rbp), %rbx
1454e234e:     	jne	0x1454e2364 <.text+0x54e1364>
1454e2350:     	movb	$0x1, 0x1e7(%rbp)
1454e2357:     	leaq	0x1a0(%rbp), %rcx
1454e235e:     	callq	0x145757f60 <.text+0x5756f60>
1454e2363:     	nop
1454e2364:     	movq	0x1a8(%rbp), %rax
1454e236b:     	leaq	(%rbx,%rbx,2), %rcx
1454e236f:     	movl	$0x3f800000, (%rax,%rcx,8) # imm = 0x3F800000
1454e2376:     	movq	$0x2, 0x8(%rax,%rcx,8)
1454e237f:     	addq	$0x2, %rdi
1454e2383:     	movq	%rdi, 0x1b0(%rbp)
1454e238a:     	movq	%rdi, %rbx
1454e238d:     	leaq	0x308(%rsi), %rax
1454e2394:     	movq	%rax, 0x1d0(%rbp)
1454e239b:     	movq	0x1a0(%rbp), %rax
1454e23a2:     	movq	%rax, 0x1b8(%rbp)
1454e23a9:     	movq	0x1a8(%rbp), %rcx
1454e23b0:     	movq	$0x0, 0x60(%rbp)
1454e23b8:     	movq	$0x8, 0x68(%rbp)
1454e23c0:     	movq	$0x0, 0x70(%rbp)
1454e23c8:     	leaq	0x880(%rsi), %rax
1454e23cf:     	movq	%rax, 0x158(%rbp)
1454e23d6:     	leaq	(,%rbx,8), %rax
1454e23de:     	leaq	(%rax,%rax,2), %r12
1454e23e2:     	xorl	%eax, %eax
1454e23e4:     	movss	0x414290(%rip), %xmm7   # 0x1458f667c
1454e23ec:     	movss	0x51599b(%rip), %xmm8   # 0x1459f7d90
1454e23f5:     	movl	%ebx, %r13d
1454e23f8:     	movq	%rbx, %r15
1454e23fb:     	xorl	%edi, %edi
1454e23fd:     	movq	%rbx, 0x160(%rbp)
1454e2404:     	movq	%rcx, 0x1d8(%rbp)
1454e240b:     	jmp	0x1454e2459 <.text+0x54e1459>
1454e240d:     	nopl	(%rax)
1454e2410:     	movq	0x68(%rbp), %rax
1454e2414:     	movq	%rbx, %rcx
1454e2417:     	shlq	$0x4, %rcx
1454e241b:     	movq	%rdi, (%rax,%rcx)
1454e241f:     	movq	%rsi, 0x8(%rax,%rcx)
1454e2424:     	leaq	0x1(%rbx), %rdi
1454e2428:     	movq	%rdi, 0x70(%rbp)
1454e242c:     	movq	0x1c8(%rbp), %rax
1454e2433:     	incq	%rax
1454e2436:     	addb	$0x3, %r13b
1454e243a:     	addq	$-0x18, %r12
1454e243e:     	movq	%r14, %r15
1454e2441:     	cmpq	$0x2, %rbx
1454e2445:     	movq	0x1d8(%rbp), %rcx
1454e244c:     	movq	0x160(%rbp), %rbx
1454e2453:     	jge	0x1454e259d <.text+0x54e159d>
1454e2459:     	testq	%r15, %r15
1454e245c:     	je	0x1454e259d <.text+0x54e159d>
1454e2462:     	movq	%rax, 0x1c8(%rbp)
1454e2469:     	subq	%rbx, %rax
1454e246c:     	cmpq	$-0x4, %rax
1454e2470:     	jbe	0x1454e2480 <.text+0x54e1480>
1454e2472:     	xorl	%eax, %eax
1454e2474:     	movaps	%xmm7, %xmm2
1454e2477:     	jmp	0x1454e24c6 <.text+0x54e14c6>
1454e2479:     	nopl	(%rax)
1454e2480:     	movq	%r15, %r8
1454e2483:     	movabsq	$0x7fffffffffffffc, %rax # imm = 0x7FFFFFFFFFFFFFC
1454e248d:     	andq	%rax, %r8
1454e2490:     	movq	%rcx, %rdx
1454e2493:     	xorl	%eax, %eax
1454e2495:     	movaps	%xmm7, %xmm2
1454e2498:     	nopl	(%rax,%rax)
1454e24a0:     	addss	(%rdx), %xmm2
1454e24a4:     	addss	0x18(%rdx), %xmm2
1454e24a9:     	addss	0x30(%rdx), %xmm2
1454e24ae:     	addss	0x48(%rdx), %xmm2
1454e24b3:     	addq	$0x4, %rax
1454e24b7:     	addq	$0x60, %rdx
1454e24bb:     	cmpq	%rax, %r8
1454e24be:     	jne	0x1454e24a0 <.text+0x54e14a0>
1454e24c0:     	testb	$0x3, %r15b
1454e24c4:     	je	0x1454e24ee <.text+0x54e14ee>
1454e24c6:     	movzbl	%r13b, %edx
1454e24ca:     	andl	$0x3, %edx
1454e24cd:     	shll	$0x3, %edx
1454e24d0:     	leaq	(%rdx,%rdx,2), %r8
1454e24d4:     	leaq	(%rax,%rax,2), %rax
1454e24d8:     	leaq	(%rcx,%rax,8), %rax
1454e24dc:     	xorl	%edx, %edx
1454e24de:     	nop
1454e24e0:     	addss	(%rax,%rdx), %xmm2
1454e24e5:     	addq	$0x18, %rdx
1454e24e9:     	cmpq	%rdx, %r8
1454e24ec:     	jne	0x1454e24e0 <.text+0x54e14e0>
1454e24ee:     	maxss	%xmm8, %xmm2
1454e24f3:     	xorps	%xmm1, %xmm1
1454e24f6:     	movq	0x158(%rbp), %rcx
1454e24fd:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454e2502:     	nop
1454e2503:     	leaq	-0x1(%r15), %r14
1454e2507:     	xorl	%eax, %eax
1454e2509:     	xorl	%ebx, %ebx
1454e250b:     	movq	0x1d8(%rbp), %rdx
1454e2512:     	nopw	%cs:(%rax,%rax)
1454e2520:     	movss	(%rdx,%rax), %xmm1
1454e2525:     	ucomiss	%xmm0, %xmm1
1454e2528:     	ja	0x1454e253d <.text+0x54e153d>
1454e252a:     	incq	%rbx
1454e252d:     	subss	%xmm1, %xmm0
1454e2531:     	addq	$0x18, %rax
1454e2535:     	cmpq	%rax, %r12
1454e2538:     	jne	0x1454e2520 <.text+0x54e1520>
1454e253a:     	movq	%r14, %rbx
1454e253d:     	cmpq	%r15, %rbx
1454e2540:     	jae	0x1454e31bb <.text+0x54e21bb>
1454e2546:     	leaq	(%rbx,%rbx,2), %rax
1454e254a:     	leaq	(%rdx,%rax,8), %rcx
1454e254e:     	movq	0x8(%rdx,%rax,8), %rdi
1454e2553:     	movq	0x10(%rdx,%rax,8), %rsi
1454e2558:     	leaq	(%rdx,%rax,8), %rdx
1454e255c:     	addq	$0x18, %rdx
1454e2560:     	movq	%rbx, %rax
1454e2563:     	notq	%rax
1454e2566:     	addq	%rax, %r15
1454e2569:     	shlq	$0x3, %r15
1454e256d:     	leaq	(%r15,%r15,2), %r8
1454e2571:     	callq	0x145756dd1 <.text+0x5755dd1>
1454e2576:     	cmpq	$-0x1, %rdi
1454e257a:     	je	0x1454e31b8 <.text+0x54e21b8>
1454e2580:     	movq	0x70(%rbp), %rbx
1454e2584:     	cmpq	0x60(%rbp), %rbx
1454e2588:     	jne	0x1454e2410 <.text+0x54e1410>
1454e258e:     	leaq	0x60(%rbp), %rcx
1454e2592:     	callq	0x145758200 <.text+0x5757200>
1454e2597:     	nop
1454e2598:     	jmp	0x1454e2410 <.text+0x54e1410>
1454e259d:     	movq	0x60(%rbp), %rax
1454e25a1:     	movq	%rax, 0x120(%rbp)
1454e25a8:     	movq	0x68(%rbp), %r13
1454e25ac:     	movq	0x1b8(%rbp), %rax
1454e25b3:     	testq	%rax, %rax
1454e25b6:     	je	0x1454e25cb <.text+0x54e15cb>
1454e25b8:     	shlq	$0x3, %rax
1454e25bc:     	leaq	(%rax,%rax,2), %rdx
1454e25c0:     	movl	$0x8, %r8d
1454e25c6:     	callq	0x1400021d0 <.text+0x11d0>
1454e25cb:     	movq	$0x0, 0x138(%rbp)
1454e25d6:     	movq	$0x8, 0x140(%rbp)
1454e25e1:     	movq	$0x0, 0x148(%rbp)
1454e25ec:     	shlq	$0x4, %rdi
1454e25f0:     	addq	%r13, %rdi
1454e25f3:     	movss	0x408e8d(%rip), %xmm7   # 0x1458eb488
1454e25fb:     	addss	0x154(%rbp), %xmm7
1454e2603:     	movq	0x168(%rbp), %r14
1454e260a:     	leaq	0x808(%r14), %rax
1454e2611:     	movq	%rax, 0x160(%rbp)
1454e2618:     	leaq	0x320(%r14), %rax
1454e261f:     	movq	%rax, 0x1b8(%rbp)
1454e2626:     	movss	0x408e51(%rip), %xmm10  # 0x1458eb480
1454e262f:     	movss	0x4e5364(%rip), %xmm11  # 0x1459c799c
1454e2638:     	movss	0x41679f(%rip), %xmm12  # 0x1458f8de0
1454e2641:     	movss	0x408eae(%rip), %xmm13  # 0x1458eb4f8
1454e264a:     	movss	0x44e8ad(%rip), %xmm14  # 0x145930f00
1454e2653:     	leaq	0x60(%rbp), %rbx
1454e2657:     	leaq	0x170(%rbp), %r12
1454e265e:     	xorl	%esi, %esi
1454e2660:     	movq	%r13, 0x128(%rbp)
1454e2667:     	movq	0x1d0(%rbp), %r15
1454e266e:     	movq	%rdi, 0x1c8(%rbp)
1454e2675:     	jmp	0x1454e26ac <.text+0x54e16ac>
1454e2677:     	nopw	(%rax,%rax)
1454e2680:     	addq	$0x10, %r13
1454e2684:     	leaq	(%rsi,%rsi,4), %rcx
1454e2688:     	shlq	$0x5, %rcx
1454e268c:     	addq	0x140(%rbp), %rcx
1454e2693:     	movl	$0xa0, %r8d
1454e2699:     	leaq	-0x50(%rbp), %rdx
1454e269d:     	callq	0x145756ddd <.text+0x5755ddd>
1454e26a2:     	incq	%rsi
1454e26a5:     	movq	%rsi, 0x148(%rbp)
1454e26ac:     	cmpq	%rdi, %r13
1454e26af:     	je	0x1454e303f <.text+0x54e203f>
1454e26b5:     	movq	(%r13), %rax
1454e26b9:     	testq	%rax, %rax
1454e26bc:     	je	0x1454e2780 <.text+0x54e1780>
1454e26c2:     	cmpl	$0x1, %eax
1454e26c5:     	jne	0x1454e2830 <.text+0x54e1830>
1454e26cb:     	movl	0x3f8(%r14), %eax
1454e26d2:     	xorps	%xmm0, %xmm0
1454e26d5:     	cvtsi2ss	%rax, %xmm0
1454e26da:     	mulss	0x46cc2e(%rip), %xmm0   # 0x14594f310
1454e26e2:     	minss	0x42875a(%rip), %xmm0   # 0x14590ae44
1454e26ea:     	movss	0x484(%r14), %xmm15
1454e26f3:     	addss	%xmm10, %xmm15
1454e26f8:     	addss	%xmm0, %xmm15
1454e26fd:     	addss	%xmm7, %xmm15
1454e2702:     	movaps	%xmm15, %xmm9
1454e2706:     	mulss	%xmm11, %xmm9
1454e270b:     	movaps	%xmm15, %xmm6
1454e270f:     	mulss	%xmm15, %xmm6
1454e2714:     	movaps	%xmm6, %xmm8
1454e2718:     	mulss	%xmm12, %xmm8
1454e271d:     	mulss	%xmm6, %xmm15
1454e2722:     	mulss	%xmm6, %xmm6
1454e2726:     	mulss	%xmm13, %xmm15
1454e272b:     	movaps	%xmm9, %xmm2
1454e272f:     	addss	%xmm14, %xmm2
1454e2734:     	addss	%xmm8, %xmm2
1454e2739:     	addss	%xmm15, %xmm2
1454e273e:     	addss	%xmm6, %xmm2
1454e2742:     	xorps	%xmm1, %xmm1
1454e2745:     	movq	0x158(%rbp), %rcx
1454e274c:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454e2751:     	nop
1454e2752:     	ucomiss	%xmm0, %xmm14
1454e2756:     	jbe	0x1454e2a51 <.text+0x54e1a51>
1454e275c:     	xorl	%esi, %esi
1454e275e:     	cmpq	$-0x1, (%r15)
1454e2762:     	jne	0x1454e2aaa <.text+0x54e1aaa>
1454e2768:     	movq	$-0x1, 0x108(%rbp)
1454e2773:     	jmp	0x1454e2aba <.text+0x54e1aba>
1454e2778:     	nopl	(%rax,%rax)
1454e2780:     	movq	0x8(%r13), %rdi
1454e2784:     	movl	0x3f8(%r14), %eax
1454e278b:     	xorps	%xmm0, %xmm0
1454e278e:     	cvtsi2ss	%rax, %xmm0
1454e2793:     	mulss	0x46cb75(%rip), %xmm0   # 0x14594f310
1454e279b:     	minss	0x4286a1(%rip), %xmm0   # 0x14590ae44
1454e27a3:     	movss	0x484(%r14), %xmm15
1454e27ac:     	addss	%xmm10, %xmm15
1454e27b1:     	addss	%xmm0, %xmm15
1454e27b6:     	addss	0x154(%rbp), %xmm15
1454e27bf:     	movaps	%xmm15, %xmm9
1454e27c3:     	mulss	%xmm11, %xmm9
1454e27c8:     	movaps	%xmm15, %xmm6
1454e27cc:     	mulss	%xmm15, %xmm6
1454e27d1:     	movaps	%xmm6, %xmm8
1454e27d5:     	mulss	%xmm12, %xmm8
1454e27da:     	mulss	%xmm6, %xmm15
1454e27df:     	mulss	%xmm6, %xmm6
1454e27e3:     	mulss	%xmm13, %xmm15
1454e27e8:     	movaps	%xmm9, %xmm2
1454e27ec:     	addss	%xmm14, %xmm2
1454e27f1:     	addss	%xmm8, %xmm2
1454e27f6:     	addss	%xmm15, %xmm2
1454e27fb:     	addss	%xmm6, %xmm2
1454e27ff:     	xorps	%xmm1, %xmm1
1454e2802:     	movq	0x158(%rbp), %rcx
1454e2809:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454e280e:     	nop
1454e280f:     	ucomiss	%xmm0, %xmm14
1454e2813:     	jbe	0x1454e2dcf <.text+0x54e1dcf>
1454e2819:     	xorl	%r9d, %r9d
1454e281c:     	jmp	0x1454e2e20 <.text+0x54e1e20>
1454e2821:     	nopw	%cs:(%rax,%rax)
1454e2830:     	cmpq	$-0x1, (%r15)
1454e2834:     	je	0x1454e3177 <.text+0x54e2177>
1454e283a:     	leaq	0x108(%rbp), %rcx
1454e2841:     	movq	%r15, %rdx
1454e2844:     	callq	0x14570c440 <.text+0x570b440>
1454e2849:     	nop
1454e284a:     	movq	%rbx, %rcx
1454e284d:     	movq	0x1b8(%rbp), %rdx
1454e2854:     	callq	0x14570c440 <.text+0x570b440>
1454e2859:     	nop
1454e285a:     	movq	0x348(%r14), %rsi
1454e2861:     	movq	%rsi, %rbx
1454e2864:     	shlq	$0x6, %rbx
1454e2868:     	movq	%rsi, %rax
1454e286b:     	shrq	$0x3a, %rax
1454e286f:     	setne	%al
1454e2872:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454e287c:     	cmpq	%rcx, %rbx
1454e287f:     	seta	%cl
1454e2882:     	orb	%al, %cl
1454e2884:     	jne	0x1454e302b <.text+0x54e202b>
1454e288a:     	movq	0x350(%r14), %rax
1454e2891:     	movq	%rax, 0x1d8(%rbp)
1454e2898:     	movq	0x360(%r14), %rax
1454e289f:     	movq	%rax, 0x1c0(%rbp)
1454e28a6:     	movups	0x358(%r14), %xmm15
1454e28ae:     	movq	0x368(%r14), %rdi
1454e28b5:     	movq	0x340(%r14), %r12
1454e28bc:     	testq	%rbx, %rbx
1454e28bf:     	je	0x1454e2fe2 <.text+0x54e1fe2>
1454e28c5:     	callq	0x140002200 <.text+0x1200>
1454e28ca:     	movl	$0x8, %r14d
1454e28d0:     	movl	$0x8, %edx
1454e28d5:     	movq	%rbx, %rcx
1454e28d8:     	callq	0x1400021c0 <.text+0x11c0>
1454e28dd:     	testq	%rax, %rax
1454e28e0:     	je	0x1454e302e <.text+0x54e202e>
1454e28e6:     	movq	%rax, %r15
1454e28e9:     	movq	%rsi, %r14
1454e28ec:     	testq	%rsi, %rsi
1454e28ef:     	je	0x1454e28ff <.text+0x54e18ff>
1454e28f1:     	movq	%r15, %rcx
1454e28f4:     	movq	%r12, %rdx
1454e28f7:     	movq	%rbx, %r8
1454e28fa:     	callq	0x145756ddd <.text+0x5755ddd>
1454e28ff:     	movq	0x168(%rbp), %rbx
1454e2906:     	movl	0x370(%rbx), %eax
1454e290c:     	movq	0x118(%rbp), %rcx
1454e2913:     	movq	%rcx, 0x180(%rbp)
1454e291a:     	movups	0x108(%rbp), %xmm0
1454e2921:     	movaps	%xmm0, 0x170(%rbp)
1454e2928:     	movq	0x70(%rbp), %rcx
1454e292c:     	leaq	0x188(%rbp), %rdx
1454e2933:     	movq	%rcx, 0x10(%rdx)
1454e2937:     	movups	0x60(%rbp), %xmm0
1454e293b:     	movups	%xmm0, (%rdx)
1454e293e:     	movaps	0x170(%rbp), %xmm0
1454e2945:     	movq	0x180(%rbp), %rcx
1454e294c:     	movq	0x188(%rbp), %rdx
1454e2953:     	movaps	0x190(%rbp), %xmm1
1454e295a:     	movaps	%xmm0, 0x60(%rbp)
1454e295e:     	movq	%rcx, 0x70(%rbp)
1454e2962:     	movq	%rdx, 0x78(%rbp)
1454e2966:     	movaps	%xmm1, 0x80(%rbp)
1454e296d:     	movq	%r14, 0x90(%rbp)
1454e2974:     	movq	%r15, 0x98(%rbp)
1454e297b:     	movq	%rsi, 0xa0(%rbp)
1454e2982:     	movq	0x1d8(%rbp), %rcx
1454e2989:     	movq	%rcx, 0xa8(%rbp)
1454e2990:     	movaps	%xmm15, 0xb0(%rbp)
1454e2998:     	movq	%rdi, 0xc0(%rbp)
1454e299f:     	movl	%eax, 0xc8(%rbp)
1454e29a5:     	callq	0x140002200 <.text+0x1200>
1454e29aa:     	movl	$0x70, %ecx
1454e29af:     	movl	$0x8, %edx
1454e29b4:     	callq	0x1400021c0 <.text+0x11c0>
1454e29b9:     	testq	%rax, %rax
1454e29bc:     	je	0x1454e31a6 <.text+0x54e21a6>
1454e29c2:     	movaps	0xc0(%rbp), %xmm0
1454e29c9:     	movups	%xmm0, 0x60(%rax)
1454e29cd:     	movaps	0xb0(%rbp), %xmm0
1454e29d4:     	movups	%xmm0, 0x50(%rax)
1454e29d8:     	movaps	0xa0(%rbp), %xmm0
1454e29df:     	movups	%xmm0, 0x40(%rax)
1454e29e3:     	movaps	0x60(%rbp), %xmm0
1454e29e7:     	movaps	0x70(%rbp), %xmm1
1454e29eb:     	movaps	0x80(%rbp), %xmm2
1454e29f2:     	movaps	0x90(%rbp), %xmm3
1454e29f9:     	movups	%xmm3, 0x30(%rax)
1454e29fd:     	movups	%xmm2, 0x20(%rax)
1454e2a01:     	movups	%xmm1, 0x10(%rax)
1454e2a05:     	movups	%xmm0, (%rax)
1454e2a08:     	movq	%rax, 0x178(%rbp)
1454e2a0f:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454e2a19:     	movq	%rax, 0x170(%rbp)
1454e2a20:     	leaq	-0x50(%rbp), %rcx
1454e2a24:     	movq	%rbx, %rdx
1454e2a27:     	leaq	0x170(%rbp), %r12
1454e2a2e:     	movq	%r12, %r8
1454e2a31:     	movq	0x1c0(%rbp), %r9
1454e2a38:     	callq	0x1454ded40 <.text+0x54ddd40>
1454e2a3d:     	nop
1454e2a3e:     	movq	%rbx, %r14
1454e2a41:     	movq	0x1d0(%rbp), %r15
1454e2a48:     	leaq	0x60(%rbp), %rbx
1454e2a4c:     	jmp	0x1454e2fb5 <.text+0x54e1fb5>
1454e2a51:     	addss	0x4e543f(%rip), %xmm0   # 0x1459c7e98
1454e2a59:     	movl	$0x1, %esi
1454e2a5e:     	ucomiss	%xmm0, %xmm9
1454e2a62:     	ja	0x1454e2aa0 <.text+0x54e1aa0>
1454e2a64:     	subss	%xmm9, %xmm0
1454e2a69:     	movl	$0x2, %esi
1454e2a6e:     	ucomiss	%xmm0, %xmm8
1454e2a72:     	ja	0x1454e2aa0 <.text+0x54e1aa0>
1454e2a74:     	subss	%xmm8, %xmm0
1454e2a79:     	movl	$0x3, %esi
1454e2a7e:     	ucomiss	%xmm0, %xmm15
1454e2a82:     	ja	0x1454e2aa0 <.text+0x54e1aa0>
1454e2a84:     	subss	%xmm15, %xmm0
1454e2a89:     	ucomiss	%xmm0, %xmm6
1454e2a8c:     	jbe	0x1454e275c <.text+0x54e175c>
1454e2a92:     	movl	$0x4, %esi
1454e2a97:     	nopw	(%rax,%rax)
1454e2aa0:     	cmpq	$-0x1, (%r15)
1454e2aa4:     	je	0x1454e2768 <.text+0x54e1768>
1454e2aaa:     	leaq	0x108(%rbp), %rcx
1454e2ab1:     	movq	%r15, %rdx
1454e2ab4:     	callq	0x14570c440 <.text+0x570b440>
1454e2ab9:     	nop
1454e2aba:     	movq	%rsi, 0x58(%rbp)
1454e2abe:     	leaq	0x123cceb(%rip), %rax   # 0x14671f7b0
1454e2ac5:     	movq	%rax, 0x60(%rbp)
1454e2ac9:     	leaq	0x123d230(%rip), %rax   # 0x14671fd00
1454e2ad0:     	movq	%rax, 0x68(%rbp)
1454e2ad4:     	leaq	0x58(%rbp), %rax
1454e2ad8:     	movq	%rax, 0x70(%rbp)
1454e2adc:     	movq	%r12, %rcx
1454e2adf:     	movq	%rbx, %rdx
1454e2ae2:     	callq	0x1455294b0 <.text+0x55284b0>
1454e2ae7:     	nop
1454e2ae8:     	cmpq	$0x4, 0x58(%rbp)
1454e2aed:     	jne	0x1454e2bc8 <.text+0x54e1bc8>
1454e2af3:     	movq	0x298(%r14), %rdi
1454e2afa:     	movq	0x2a0(%r14), %r12
1454e2b01:     	movq	0x170(%rbp), %rax
1454e2b08:     	movq	0x180(%rbp), %rdx
1454e2b0f:     	subq	%rdx, %rax
1454e2b12:     	cmpq	%rax, %r12
1454e2b15:     	ja	0x1454e2ff9 <.text+0x54e1ff9>
1454e2b1b:     	testq	%r12, %r12
1454e2b1e:     	je	0x1454e2bba <.text+0x54e1bba>
1454e2b24:     	movq	0x178(%rbp), %rax
1454e2b2b:     	movq	%rdx, 0x1c0(%rbp)
1454e2b32:     	imulq	$0x70, %rdx, %rsi
1454e2b36:     	addq	%rax, %rsi
1454e2b39:     	negq	%r12
1454e2b3c:     	xorl	%eax, %eax
1454e2b3e:     	nop
1454e2b40:     	movq	%rax, 0x1d8(%rbp)
1454e2b47:     	movq	(%rdi), %rdx
1454e2b4a:     	movq	%rbx, %rcx
1454e2b4d:     	callq	0x145414300 <.text+0x5413300>
1454e2b52:     	nop
1454e2b53:     	movups	0xc0(%rbp), %xmm0
1454e2b5a:     	movups	%xmm0, 0x60(%rsi)
1454e2b5e:     	movups	0xb0(%rbp), %xmm0
1454e2b65:     	movups	%xmm0, 0x50(%rsi)
1454e2b69:     	movups	0xa0(%rbp), %xmm0
1454e2b70:     	movups	%xmm0, 0x40(%rsi)
1454e2b74:     	movups	0x60(%rbp), %xmm0
1454e2b78:     	movups	0x70(%rbp), %xmm1
1454e2b7c:     	movups	0x80(%rbp), %xmm2
1454e2b83:     	movups	0x90(%rbp), %xmm3
1454e2b8a:     	movups	%xmm3, 0x30(%rsi)
1454e2b8e:     	movups	%xmm2, 0x20(%rsi)
1454e2b92:     	movups	%xmm1, 0x10(%rsi)
1454e2b96:     	movups	%xmm0, (%rsi)
1454e2b99:     	movq	0x1d8(%rbp), %rax
1454e2ba0:     	decq	%rax
1454e2ba3:     	addq	$0x70, %rsi
1454e2ba7:     	addq	$0x58, %rdi
1454e2bab:     	cmpq	%rax, %r12
1454e2bae:     	jne	0x1454e2b40 <.text+0x54e1b40>
1454e2bb0:     	movq	0x1c0(%rbp), %rdx
1454e2bb7:     	subq	%rax, %rdx
1454e2bba:     	movq	%rdx, 0x180(%rbp)
1454e2bc1:     	leaq	0x170(%rbp), %r12
1454e2bc8:     	movq	%r12, %rcx
1454e2bcb:     	leaq	0x108(%rbp), %rdx
1454e2bd2:     	movq	0x160(%rbp), %r8
1454e2bd9:     	callq	0x145523330 <.text+0x5522330>
1454e2bde:     	nop
1454e2bdf:     	movq	0x180(%rbp), %r12
1454e2be6:     	testq	%r12, %r12
1454e2be9:     	je	0x1454e2e47 <.text+0x54e1e47>
1454e2bef:     	bsrq	%r12, %rcx
1454e2bf3:     	notl	%ecx
1454e2bf5:     	movq	%r12, %r8
1454e2bf8:     	shlq	%cl, %r8
1454e2bfb:     	decq	%r8
1454e2bfe:     	movq	0x880(%r14), %r10
1454e2c05:     	movq	0x888(%r14), %rcx
1454e2c0c:     	movq	0x898(%r14), %r11
1454e2c13:     	movq	0x890(%r14), %r9
1454e2c1a:     	nopw	(%rax,%rax)
1454e2c20:     	leaq	(%r10,%r11), %rax
1454e2c24:     	rolq	$0x17, %rax
1454e2c28:     	addq	%r10, %rax
1454e2c2b:     	movq	%rcx, %rsi
1454e2c2e:     	shlq	$0x11, %rsi
1454e2c32:     	xorq	%r10, %r9
1454e2c35:     	xorq	%rcx, %r11
1454e2c38:     	xorq	%r11, %r10
1454e2c3b:     	rolq	$0x2d, %r11
1454e2c3f:     	xorq	%r9, %rcx
1454e2c42:     	mulq	%r12
1454e2c45:     	xorq	%rsi, %r9
1454e2c48:     	cmpq	%rax, %r8
1454e2c4b:     	jb	0x1454e2c20 <.text+0x54e1c20>
1454e2c4d:     	movq	%r10, 0x880(%r14)
1454e2c54:     	movq	%r11, 0x898(%r14)
1454e2c5b:     	movq	%rcx, 0x888(%r14)
1454e2c62:     	movq	%r9, 0x890(%r14)
1454e2c69:     	cmpq	%rdx, %r12
1454e2c6c:     	jbe	0x1454e3198 <.text+0x54e2198>
1454e2c72:     	movq	0x178(%rbp), %rdi
1454e2c79:     	imulq	$0x70, %rdx, %rax
1454e2c7d:     	movups	(%rdi,%rax), %xmm0
1454e2c81:     	movups	0x10(%rdi,%rax), %xmm1
1454e2c86:     	movups	0x20(%rdi,%rax), %xmm2
1454e2c8b:     	movups	0x30(%rdi,%rax), %xmm3
1454e2c90:     	movaps	%xmm0, 0x60(%rbp)
1454e2c94:     	movaps	%xmm1, 0x70(%rbp)
1454e2c98:     	movaps	%xmm2, 0x80(%rbp)
1454e2c9f:     	movaps	%xmm3, 0x90(%rbp)
1454e2ca6:     	movups	0x40(%rdi,%rax), %xmm0
1454e2cab:     	movaps	%xmm0, 0xa0(%rbp)
1454e2cb2:     	movups	0x50(%rdi,%rax), %xmm0
1454e2cb7:     	movaps	%xmm0, 0xb0(%rbp)
1454e2cbe:     	movups	0x60(%rdi,%rax), %xmm0
1454e2cc3:     	movaps	%xmm0, 0xc0(%rbp)
1454e2cca:     	decq	%r12
1454e2ccd:     	imulq	$0x70, %r12, %rcx
1454e2cd1:     	movups	0x60(%rdi,%rcx), %xmm0
1454e2cd6:     	movups	0x50(%rdi,%rcx), %xmm1
1454e2cdb:     	movups	0x40(%rdi,%rcx), %xmm2
1454e2ce0:     	movups	(%rdi,%rcx), %xmm3
1454e2ce4:     	movups	0x10(%rdi,%rcx), %xmm4
1454e2ce9:     	movups	0x20(%rdi,%rcx), %xmm5
1454e2cee:     	movups	0x30(%rdi,%rcx), %xmm6
1454e2cf3:     	movups	%xmm3, (%rdi,%rax)
1454e2cf7:     	movups	%xmm4, 0x10(%rdi,%rax)
1454e2cfc:     	movups	%xmm5, 0x20(%rdi,%rax)
1454e2d01:     	movups	%xmm6, 0x30(%rdi,%rax)
1454e2d06:     	movups	%xmm2, 0x40(%rdi,%rax)
1454e2d0b:     	movups	%xmm1, 0x50(%rdi,%rax)
1454e2d10:     	movups	%xmm0, 0x60(%rdi,%rax)
1454e2d15:     	movq	%r12, 0x180(%rbp)
1454e2d1c:     	testq	%r12, %r12
1454e2d1f:     	je	0x1454e2d90 <.text+0x54e1d90>
1454e2d21:     	addq	$0x38, %rdi
1454e2d25:     	jmp	0x1454e2d39 <.text+0x54e1d39>
1454e2d27:     	nopw	(%rax,%rax)
1454e2d30:     	addq	$0x70, %rdi
1454e2d34:     	decq	%r12
1454e2d37:     	je	0x1454e2d90 <.text+0x54e1d90>
1454e2d39:     	movq	-0x38(%rdi), %rdx
1454e2d3d:     	testq	%rdx, %rdx
1454e2d40:     	je	0x1454e2d51 <.text+0x54e1d51>
1454e2d42:     	movq	-0x30(%rdi), %rcx
1454e2d46:     	movl	$0x1, %r8d
1454e2d4c:     	callq	0x1400021d0 <.text+0x11d0>
1454e2d51:     	movq	-0x20(%rdi), %rdx
1454e2d55:     	testq	%rdx, %rdx
1454e2d58:     	je	0x1454e2d69 <.text+0x54e1d69>
1454e2d5a:     	movq	-0x18(%rdi), %rcx
1454e2d5e:     	movl	$0x1, %r8d
1454e2d64:     	callq	0x1400021d0 <.text+0x11d0>
1454e2d69:     	movq	-0x8(%rdi), %rdx
1454e2d6d:     	testq	%rdx, %rdx
1454e2d70:     	je	0x1454e2d30 <.text+0x54e1d30>
1454e2d72:     	movq	(%rdi), %rcx
1454e2d75:     	shlq	$0x6, %rdx
1454e2d79:     	movl	$0x8, %r8d
1454e2d7f:     	callq	0x1400021d0 <.text+0x11d0>
1454e2d84:     	jmp	0x1454e2d30 <.text+0x54e1d30>
1454e2d86:     	nopw	%cs:(%rax,%rax)
1454e2d90:     	movq	0x170(%rbp), %rax
1454e2d97:     	testq	%rax, %rax
1454e2d9a:     	je	0x1454e2db2 <.text+0x54e1db2>
1454e2d9c:     	movq	0x178(%rbp), %rcx
1454e2da3:     	imulq	$0x70, %rax, %rdx
1454e2da7:     	movl	$0x8, %r8d
1454e2dad:     	callq	0x1400021d0 <.text+0x11d0>
1454e2db2:     	movq	0x108(%rbp), %rdx
1454e2db9:     	cmpq	$-0x1, %rdx
1454e2dbd:     	leaq	0x170(%rbp), %r12
1454e2dc4:     	jne	0x1454e2f05 <.text+0x54e1f05>
1454e2dca:     	jmp	0x1454e2f1c <.text+0x54e1f1c>
1454e2dcf:     	addss	0x4e50c1(%rip), %xmm0   # 0x1459c7e98
1454e2dd7:     	movl	$0x1, %r9d
1454e2ddd:     	ucomiss	%xmm0, %xmm9
1454e2de1:     	ja	0x1454e2e20 <.text+0x54e1e20>
1454e2de3:     	subss	%xmm9, %xmm0
1454e2de8:     	movl	$0x2, %r9d
1454e2dee:     	ucomiss	%xmm0, %xmm8
1454e2df2:     	ja	0x1454e2e20 <.text+0x54e1e20>
1454e2df4:     	subss	%xmm8, %xmm0
1454e2df9:     	movl	$0x3, %r9d
1454e2dff:     	ucomiss	%xmm0, %xmm15
1454e2e03:     	ja	0x1454e2e20 <.text+0x54e1e20>
1454e2e05:     	subss	%xmm15, %xmm0
1454e2e0a:     	ucomiss	%xmm0, %xmm6
1454e2e0d:     	jbe	0x1454e2819 <.text+0x54e1819>
1454e2e13:     	movl	$0x4, %r9d
1454e2e19:     	nopl	(%rax)
1454e2e20:     	movq	%rdi, 0x68(%rbp)
1454e2e24:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
1454e2e2e:     	movq	%rax, 0x60(%rbp)
1454e2e32:     	leaq	-0x50(%rbp), %rcx
1454e2e36:     	movq	%r14, %rdx
1454e2e39:     	movq	%rbx, %r8
1454e2e3c:     	callq	0x1454ded40 <.text+0x54ddd40>
1454e2e41:     	nop
1454e2e42:     	jmp	0x1454e2fb5 <.text+0x54e1fb5>
1454e2e47:     	movq	%rbx, %rcx
1454e2e4a:     	leaq	0x123c95f(%rip), %rdx   # 0x14671f7b0
1454e2e51:     	callq	0x145413de0 <.text+0x5412de0>
1454e2e56:     	nop
1454e2e57:     	movq	0x180(%rbp), %rsi
1454e2e5e:     	testq	%rsi, %rsi
1454e2e61:     	leaq	0x170(%rbp), %r12
1454e2e68:     	je	0x1454e2ed6 <.text+0x54e1ed6>
1454e2e6a:     	movq	0x178(%rbp), %rdi
1454e2e71:     	addq	$0x38, %rdi
1454e2e75:     	jmp	0x1454e2e89 <.text+0x54e1e89>
1454e2e77:     	nopw	(%rax,%rax)
1454e2e80:     	addq	$0x70, %rdi
1454e2e84:     	decq	%rsi
1454e2e87:     	je	0x1454e2ed6 <.text+0x54e1ed6>
1454e2e89:     	movq	-0x38(%rdi), %rdx
1454e2e8d:     	testq	%rdx, %rdx
1454e2e90:     	je	0x1454e2ea1 <.text+0x54e1ea1>
1454e2e92:     	movq	-0x30(%rdi), %rcx
1454e2e96:     	movl	$0x1, %r8d
1454e2e9c:     	callq	0x1400021d0 <.text+0x11d0>
1454e2ea1:     	movq	-0x20(%rdi), %rdx
1454e2ea5:     	testq	%rdx, %rdx
1454e2ea8:     	je	0x1454e2eb9 <.text+0x54e1eb9>
1454e2eaa:     	movq	-0x18(%rdi), %rcx
1454e2eae:     	movl	$0x1, %r8d
1454e2eb4:     	callq	0x1400021d0 <.text+0x11d0>
1454e2eb9:     	movq	-0x8(%rdi), %rdx
1454e2ebd:     	testq	%rdx, %rdx
1454e2ec0:     	je	0x1454e2e80 <.text+0x54e1e80>
1454e2ec2:     	movq	(%rdi), %rcx
1454e2ec5:     	shlq	$0x6, %rdx
1454e2ec9:     	movl	$0x8, %r8d
1454e2ecf:     	callq	0x1400021d0 <.text+0x11d0>
1454e2ed4:     	jmp	0x1454e2e80 <.text+0x54e1e80>
1454e2ed6:     	movq	0x170(%rbp), %rax
1454e2edd:     	testq	%rax, %rax
1454e2ee0:     	je	0x1454e2ef8 <.text+0x54e1ef8>
1454e2ee2:     	movq	0x178(%rbp), %rcx
1454e2ee9:     	imulq	$0x70, %rax, %rdx
1454e2eed:     	movl	$0x8, %r8d
1454e2ef3:     	callq	0x1400021d0 <.text+0x11d0>
1454e2ef8:     	movq	0x108(%rbp), %rdx
1454e2eff:     	cmpq	$-0x1, %rdx
1454e2f03:     	je	0x1454e2f1c <.text+0x54e1f1c>
1454e2f05:     	testq	%rdx, %rdx
1454e2f08:     	je	0x1454e2f1c <.text+0x54e1f1c>
1454e2f0a:     	movq	0x110(%rbp), %rcx
1454e2f11:     	movl	$0x1, %r8d
1454e2f17:     	callq	0x1400021d0 <.text+0x11d0>
1454e2f1c:     	movq	0xb8(%rbp), %rbx
1454e2f23:     	callq	0x140002200 <.text+0x1200>
1454e2f28:     	movl	$0x70, %ecx
1454e2f2d:     	movl	$0x8, %edx
1454e2f32:     	callq	0x1400021c0 <.text+0x11c0>
1454e2f37:     	testq	%rax, %rax
1454e2f3a:     	je	0x1454e3186 <.text+0x54e2186>
1454e2f40:     	movaps	0xc0(%rbp), %xmm0
1454e2f47:     	movups	%xmm0, 0x60(%rax)
1454e2f4b:     	movaps	0xb0(%rbp), %xmm0
1454e2f52:     	movups	%xmm0, 0x50(%rax)
1454e2f56:     	movaps	0xa0(%rbp), %xmm0
1454e2f5d:     	movups	%xmm0, 0x40(%rax)
1454e2f61:     	movaps	0x60(%rbp), %xmm0
1454e2f65:     	movaps	0x70(%rbp), %xmm1
1454e2f69:     	movaps	0x80(%rbp), %xmm2
1454e2f70:     	movaps	0x90(%rbp), %xmm3
1454e2f77:     	movups	%xmm3, 0x30(%rax)
1454e2f7b:     	movups	%xmm2, 0x20(%rax)
1454e2f7f:     	movups	%xmm1, 0x10(%rax)
1454e2f83:     	movups	%xmm0, (%rax)
1454e2f86:     	movq	%rax, 0x178(%rbp)
1454e2f8d:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454e2f97:     	movq	%rax, 0x170(%rbp)
1454e2f9e:     	leaq	-0x50(%rbp), %rcx
1454e2fa2:     	movq	%r14, %rdx
1454e2fa5:     	movq	%r12, %r8
1454e2fa8:     	movq	%rbx, %r9
1454e2fab:     	callq	0x1454ded40 <.text+0x54ddd40>
1454e2fb0:     	nop
1454e2fb1:     	leaq	0x60(%rbp), %rbx
1454e2fb5:     	movq	0x148(%rbp), %rsi
1454e2fbc:     	cmpq	0x138(%rbp), %rsi
1454e2fc3:     	movq	0x1c8(%rbp), %rdi
1454e2fca:     	jne	0x1454e2680 <.text+0x54e1680>
1454e2fd0:     	leaq	0x138(%rbp), %rcx
1454e2fd7:     	callq	0x1457a4a40 <.text+0x57a3a40>
1454e2fdc:     	nop
1454e2fdd:     	jmp	0x1454e2680 <.text+0x54e1680>
1454e2fe2:     	movl	$0x8, %r15d
1454e2fe8:     	xorl	%r14d, %r14d
1454e2feb:     	testq	%rsi, %rsi
1454e2fee:     	jne	0x1454e28f1 <.text+0x54e18f1>
1454e2ff4:     	jmp	0x1454e28ff <.text+0x54e18ff>
1454e2ff9:     	movq	$0x70, 0x20(%rsp)
1454e3002:     	movl	$0x8, %r9d
1454e3008:     	leaq	0x170(%rbp), %rcx
1454e300f:     	movq	%r12, %r8
1454e3012:     	callq	0x145757d40 <.text+0x5756d40>
1454e3017:     	nop
1454e3018:     	movq	0x178(%rbp), %rax
1454e301f:     	movq	0x180(%rbp), %rdx
1454e3026:     	jmp	0x1454e2b2b <.text+0x54e1b2b>
1454e302b:     	xorl	%r14d, %r14d
1454e302e:     	movq	%r14, %rcx
1454e3031:     	movq	%rbx, %rdx
1454e3034:     	callq	0x1458e721b <.text+0x58e621b>
1454e3039:     	nop
1454e303a:     	jmp	0x1454e31ce <.text+0x54e21ce>
1454e303f:     	movq	0x120(%rbp), %rdx
1454e3046:     	testq	%rdx, %rdx
1454e3049:     	je	0x1454e3068 <.text+0x54e2068>
1454e304b:     	shlq	$0x4, %rdx
1454e304f:     	movl	$0x8, %r8d
1454e3055:     	movq	0x128(%rbp), %rcx
1454e305c:     	callq	0x1400021d0 <.text+0x11d0>
1454e3061:     	movq	0x148(%rbp), %rsi
1454e3068:     	cmpq	$0x3, %rsi
1454e306c:     	jae	0x1454e30fc <.text+0x54e20fc>
1454e3072:     	movl	0x930(%r14), %eax
1454e3079:     	shrl	%eax
1454e307b:     	cmpl	$0x3d, %eax
1454e307e:     	movl	$0x3c, %ecx
1454e3083:     	cmovael	%eax, %ecx
1454e3086:     	movl	%ecx, 0x178(%rbp)
1454e308c:     	movabsq	$-0x7ffffffffffffffc, %rax # imm = 0x8000000000000004
1454e3096:     	movq	%rax, 0x170(%rbp)
1454e309d:     	leaq	0x60(%rbp), %rcx
1454e30a1:     	leaq	0x170(%rbp), %r8
1454e30a8:     	movl	$0x2, %r9d
1454e30ae:     	movq	%r14, %rdx
1454e30b1:     	callq	0x1454ded40 <.text+0x54ddd40>
1454e30b6:     	nop
1454e30b7:     	movq	0x148(%rbp), %rsi
1454e30be:     	cmpq	0x138(%rbp), %rsi
1454e30c5:     	jne	0x1454e30d4 <.text+0x54e20d4>
1454e30c7:     	leaq	0x138(%rbp), %rcx
1454e30ce:     	callq	0x1457a4a40 <.text+0x57a3a40>
1454e30d3:     	nop
1454e30d4:     	leaq	(%rsi,%rsi,4), %rcx
1454e30d8:     	shlq	$0x5, %rcx
1454e30dc:     	addq	0x140(%rbp), %rcx
1454e30e3:     	leaq	0x60(%rbp), %rdx
1454e30e7:     	movl	$0xa0, %r8d
1454e30ed:     	callq	0x145756ddd <.text+0x5755ddd>
1454e30f2:     	incq	%rsi
1454e30f5:     	movq	%rsi, 0x148(%rbp)
1454e30fc:     	movq	0x148(%rbp), %rax
1454e3103:     	movq	0x50(%rbp), %rcx
1454e3107:     	movq	%rax, 0x10(%rcx)
1454e310b:     	movups	0x138(%rbp), %xmm0
1454e3112:     	movups	%xmm0, (%rcx)
1454e3115:     	movaps	0x1f0(%rbp), %xmm6
1454e311c:     	movaps	0x200(%rbp), %xmm7
1454e3123:     	movaps	0x210(%rbp), %xmm8
1454e312b:     	movaps	0x220(%rbp), %xmm9
1454e3133:     	movaps	0x230(%rbp), %xmm10
1454e313b:     	movaps	0x240(%rbp), %xmm11
1454e3143:     	movaps	0x250(%rbp), %xmm12
1454e314b:     	movaps	0x260(%rbp), %xmm13
1454e3153:     	movaps	0x270(%rbp), %xmm14
1454e315b:     	movaps	0x280(%rbp), %xmm15
1454e3163:     	addq	$0x318, %rsp            # imm = 0x318
1454e316a:     	popq	%rbx
1454e316b:     	popq	%rdi
1454e316c:     	popq	%rsi
1454e316d:     	popq	%r12
1454e316f:     	popq	%r13
1454e3171:     	popq	%r14
1454e3173:     	popq	%r15
1454e3175:     	popq	%rbp
1454e3176:     	retq
1454e3177:     	leaq	0x14c94a2(%rip), %rcx   # 0x1469ac620
1454e317e:     	callq	0x1458e7510 <.text+0x58e6510>
1454e3183:     	nop
1454e3184:     	jmp	0x1454e31ce <.text+0x54e21ce>
1454e3186:     	movl	$0x8, %ecx
1454e318b:     	movl	$0x70, %edx
1454e3190:     	callq	0x1458e7201 <.text+0x58e6201>
1454e3195:     	nop
1454e3196:     	jmp	0x1454e31ce <.text+0x54e21ce>
1454e3198:     	movq	%rdx, %rcx
1454e319b:     	movq	%r12, %rdx
1454e319e:     	callq	0x1458e72a4 <.text+0x58e62a4>
1454e31a3:     	nop
1454e31a4:     	jmp	0x1454e31ce <.text+0x54e21ce>
1454e31a6:     	movl	$0x8, %ecx
1454e31ab:     	movl	$0x70, %edx
1454e31b0:     	callq	0x1458e7201 <.text+0x58e6201>
1454e31b5:     	nop
1454e31b6:     	jmp	0x1454e31ce <.text+0x54e21ce>
1454e31b8:     	movq	%r14, %r15
1454e31bb:     	leaq	0x14c74ae(%rip), %r8    # 0x1469aa670
1454e31c2:     	movq	%rbx, %rcx
1454e31c5:     	movq	%r15, %rdx
1454e31c8:     	callq	0x1458e72eb <.text+0x58e62eb>
1454e31cd:     	nop
1454e31ce:     	ud2
