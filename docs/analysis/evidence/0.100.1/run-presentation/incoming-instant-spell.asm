
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454df26a:     	movq	%rax, %r9
1454df26d:     	movq	0x2a0(%rbp), %rax
1454df274:     	movq	0x3e8(%rax), %rax
1454df27b:     	movq	%rax, (%r9)
1454df27e:     	movl	$0x1, %ecx
1454df283:     	movl	$0x2, 0x190(%rbp)
1454df28d:     	movl	$0x0, 0x1b8(%rbp)
1454df297:     	movb	%bl, 0x1b0(%rbp)
1454df29d:     	movb	%bl, 0x283(%rbp)
1454df2a3:     	leaq	0x1b8(%rbp), %rax
1454df2aa:     	movq	%rax, 0x30(%rsp)
1454df2af:     	leaq	0x190(%rbp), %rax
1454df2b6:     	movq	%rax, 0x28(%rsp)
1454df2bb:     	movq	%rcx, 0x170(%rbp)
1454df2c2:     	movq	%rcx, 0x20(%rsp)
1454df2c7:     	leaq	0x1f0(%rbp), %rcx
1454df2ce:     	movq	%r13, %rdx
1454df2d1:     	movl	%r15d, %r8d
1454df2d4:     	movq	%r9, 0x240(%rbp)
1454df2db:     	callq	0x145466ab0 <.text+0x5465ab0>
1454df2e0:     	nop
1454df2e1:     	movq	0x2a0(%rbp), %rax
1454df2e8:     	movq	0x560(%rax), %rsi
1454df2ef:     	cmpq	0x550(%rax), %rsi
1454df2f6:     	jne	0x1454df305 <.text+0x54de305>
1454df2f8:     	movq	0x290(%rbp), %rcx
1454df2ff:     	callq	0x145774710 <.text+0x5773710>
1454df304:     	nop
1454df305:     	movq	%rsi, %rax
1454df308:     	shlq	$0x5, %rax
1454df30c:     	incq	%rsi
1454df30f:     	ucomiss	%xmm6, %xmm9
1454df313:     	movq	0x2a0(%rbp), %rcx
1454df31a:     	movq	0x558(%rcx), %rdx
1454df321:     	movups	0x1f0(%rbp), %xmm0
1454df328:     	movups	0x200(%rbp), %xmm1
1454df32f:     	movups	%xmm1, 0x10(%rdx,%rax)
1454df334:     	movups	%xmm0, (%rdx,%rax)
1454df338:     	movq	%rsi, 0x560(%rcx)
1454df33f:     	jb	0x1454ded60 <.text+0x54ddd60>
1454df345:     	mulss	%xmm7, %xmm8
1454df34a:     	movb	$0x0, 0x283(%rbp)
1454df351:     	movaps	%xmm8, %xmm1
1454df355:     	movq	%r13, %r8
1454df358:     	xorl	%r9d, %r9d
1454df35b:     	callq	0x1454a0910 <.text+0x549f910>
