1454b5c63:     	subps	%xmm11, %xmm0
1454b5c67:     	mulps	%xmm0, %xmm0
1454b5c6a:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b5c6e:     	addss	%xmm0, %xmm1
1454b5c72:     	xorps	%xmm0, %xmm0
1454b5c75:     	sqrtss	%xmm1, %xmm0
1454b5c79:     	ucomiss	%xmm0, %xmm10
1454b5c7d:     	jb	0x1454b5c94 <.text+0x54b4c94>
1454b5c7f:     	movq	0x368(%rbp), %rcx
1454b5c86:     	movaps	%xmm7, %xmm1
1454b5c89:     	xorl	%r8d, %r8d
1454b5c8c:     	xorl	%r9d, %r9d
1454b5c8f:     	callq	0x1454a0910 <.text+0x549f910>
1454b5c94:     	movq	0x358(%rbp), %rsi
1454b5c9b:     	testq	%rsi, %rsi
1454b5c9e:     	movq	0x368(%rbp), %r13
1454b5ca5:     	movq	%rdi, %r12
