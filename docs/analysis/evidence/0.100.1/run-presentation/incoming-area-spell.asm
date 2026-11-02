
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b5ba2:     	testl	%r15d, %r15d
1454b5ba5:     	movq	0x368(%rbp), %r14
1454b5bac:     	je	0x1454b5c5a <.text+0x54b4c5a>
1454b5bb2:     	movlps	%xmm11, 0x244(%rbp)
1454b5bba:     	movl	%r12d, 0x24c(%rbp)
1454b5bc1:     	movl	$0x1, 0x240(%rbp)
1454b5bcb:     	movl	$0x0, 0x220(%rbp)
1454b5bd5:     	leaq	0x220(%rbp), %rax
1454b5bdc:     	movq	%rax, 0x30(%rsp)
1454b5be1:     	leaq	0x240(%rbp), %rax
1454b5be8:     	movq	%rax, 0x28(%rsp)
1454b5bed:     	movq	$0x0, 0x20(%rsp)
1454b5bf6:     	movl	$0x8, %r9d
1454b5bfc:     	leaq	0xb0(%rbp), %rcx
1454b5c03:     	movq	%r13, %rdx
1454b5c06:     	movl	%r15d, %r8d
1454b5c09:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b5c0e:     	movq	0x560(%r14), %rsi
1454b5c15:     	cmpq	0x550(%r14), %rsi
1454b5c1c:     	jne	0x1454b5c2b <.text+0x54b4c2b>
1454b5c1e:     	movq	0x338(%rbp), %rcx
1454b5c25:     	callq	0x145774710 <.text+0x5773710>
1454b5c2a:     	nop
1454b5c2b:     	movq	0x558(%r14), %rax
1454b5c32:     	movq	%rsi, %rcx
1454b5c35:     	shlq	$0x5, %rcx
1454b5c39:     	movups	0xb0(%rbp), %xmm0
1454b5c40:     	movups	0xc0(%rbp), %xmm1
1454b5c47:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b5c4c:     	movups	%xmm0, (%rax,%rcx)
1454b5c50:     	incq	%rsi
1454b5c53:     	movq	%rsi, 0x560(%r14)
1454b5c5a:     	movsd	0x400(%r14), %xmm0
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
