
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d23c5:     	movq	%rcx, %rsi
1454d23c8:     	movsd	0x3e8(%rcx), %xmm6
1454d23d0:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1454d23d4:     	movl	0x3f0(%rcx), %eax
1454d23da:     	movl	%eax, 0x2c(%rbp)
1454d23dd:     	movss	0x8e4(%rcx), %xmm8
1454d23e6:     	movq	$0x0, 0x10(%rbp)
1454d23ee:     	movq	$0x8, 0x18(%rbp)
1454d23f6:     	movq	$0x0, 0x20(%rbp)
1454d23fe:     	movq	0x528(%rcx), %rbx
1454d2405:     	movq	0x530(%rcx), %rax
1454d240c:     	leaq	(%rax,%rax,8), %rax
1454d2410:     	leaq	(%rbx,%rax,8), %rax
1454d2414:     	xorl	%r14d, %r14d
1454d2417:     	movss	0x424260(%rip), %xmm9   # 0x1458f6680
1454d2420:     	movss	0x4190ff(%rip), %xmm10  # 0x1458eb528
1454d2429:     	leaq	0x10(%rbp), %rdi
1454d242d:     	movq	%rax, (%rbp)
1454d2431:     	nopw	%cs:(%rax,%rax)
1454d2440:     	addq	$0x48, %rbx
1454d2444:     	leaq	-0x48(%rbx), %rcx
1454d2448:     	cmpq	%rax, %rcx
1454d244b:     	je	0x1454d24fb <.text+0x54d14fb>
1454d2451:     	cmpl	$0x0, 0x20(%rcx)
1454d2455:     	jne	0x1454d2440 <.text+0x54d1440>
1454d2457:     	cmpl	$0x0, -0x30(%rbx)
1454d245b:     	jne	0x1454d2440 <.text+0x54d1440>
1454d245d:     	movq	%rcx, 0x8(%rbp)
1454d2461:     	movss	-0x14(%rbx), %xmm0
1454d2466:     	movss	-0x10(%rbx), %xmm1
1454d246b:     	subss	%xmm6, %xmm0
1454d246f:     	subss	%xmm7, %xmm1
1454d2473:     	mulss	%xmm0, %xmm0
1454d2477:     	mulss	%xmm1, %xmm1
1454d247b:     	addss	%xmm0, %xmm1
1454d247f:     	xorps	%xmm11, %xmm11
1454d2483:     	sqrtss	%xmm1, %xmm11
1454d2488:     	divss	%xmm9, %xmm11
1454d248d:     	maxss	%xmm10, %xmm11
1454d2492:     	movaps	%xmm8, %xmm0
1454d2496:     	addss	%xmm11, %xmm0
1454d249b:     	movl	$0x1, -0x30(%rbx)
1454d24a2:     	movss	%xmm0, -0x2c(%rbx)
1454d24a7:     	movq	-0x20(%rbx), %r15
1454d24ab:     	movq	-0x14(%rbx), %rax
1454d24af:     	movl	-0xc(%rbx), %ecx
1454d24b2:     	movl	%ecx, -0x20(%rbp)
1454d24b5:     	movq	%rax, -0x28(%rbp)
1454d24b9:     	cmpq	0x10(%rbp), %r14
1454d24bd:     	jne	0x1454d24c8 <.text+0x54d14c8>
1454d24bf:     	movq	%rdi, %rcx
1454d24c2:     	callq	0x145757f60 <.text+0x5756f60>
1454d24c7:     	nop
1454d24c8:     	movq	0x18(%rbp), %rax
1454d24cc:     	leaq	(%r14,%r14,2), %rcx
1454d24d0:     	movq	%r15, (%rax,%rcx,8)
1454d24d4:     	movq	-0x28(%rbp), %rdx
1454d24d8:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454d24dd:     	movl	-0x20(%rbp), %edx
1454d24e0:     	movl	%edx, 0x10(%rax,%rcx,8)
1454d24e4:     	movss	%xmm11, 0x14(%rax,%rcx,8)
1454d24eb:     	incq	%r14
1454d24ee:     	movq	%r14, 0x20(%rbp)
1454d24f2:     	movq	(%rbp), %rax
1454d24f6:     	jmp	0x1454d2440 <.text+0x54d1440>
