
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454aefa0:     	pushq	%rbp
1454aefa1:     	pushq	%r15
1454aefa3:     	pushq	%r14
1454aefa5:     	pushq	%r13
1454aefa7:     	pushq	%r12
1454aefa9:     	pushq	%rsi
1454aefaa:     	pushq	%rdi
1454aefab:     	pushq	%rbx
1454aefac:     	subq	$0x4a8, %rsp            # imm = 0x4A8
1454aefb3:     	leaq	0x80(%rsp), %rbp
1454aefbb:     	movaps	%xmm15, 0x410(%rbp)
1454aefc3:     	movaps	%xmm14, 0x400(%rbp)
1454aefcb:     	movaps	%xmm13, 0x3f0(%rbp)
1454aefd3:     	movaps	%xmm12, 0x3e0(%rbp)
1454aefdb:     	movaps	%xmm11, 0x3d0(%rbp)
1454aefe3:     	movaps	%xmm10, 0x3c0(%rbp)
1454aefeb:     	movaps	%xmm9, 0x3b0(%rbp)
1454aeff3:     	movaps	%xmm8, 0x3a0(%rbp)
1454aeffb:     	movaps	%xmm7, 0x390(%rbp)
1454af002:     	movaps	%xmm6, 0x380(%rbp)
1454af009:     	movq	$-0x2, 0x378(%rbp)
1454af014:     	movaps	%xmm1, %xmm6
1454af017:     	movq	%rcx, %r13
1454af01a:     	movzbl	0x9b9(%rcx), %eax
1454af021:     	testb	%al, %al
1454af023:     	jne	0x1454af047 <.text+0x54ae047>
1454af025:     	cmpb	$0x0, 0x9b1(%r13)
1454af02d:     	je	0x1454af047 <.text+0x54ae047>
1454af02f:     	movb	$0x0, 0x9b1(%r13)
1454af037:     	movq	%r13, %rcx
1454af03a:     	callq	0x1454c2890 <.text+0x54c1890>
1454af03f:     	movzbl	0x9b9(%r13), %eax
1454af047:     	cmpb	$0x1, %al
1454af049:     	movq	%r13, 0x368(%rbp)
1454af050:     	jne	0x1454bc015 <.text+0x54bb015>
1454af056:     	movss	0x934(%r13), %xmm7
1454af05f:     	addss	%xmm6, %xmm7
1454af063:     	movss	%xmm7, 0x934(%r13)
1454af06c:     	cmpb	$0x0, 0x9b2(%r13)
1454af074:     	je	0x1454af3da <.text+0x54ae3da>
1454af07a:     	movss	0x470(%r13), %xmm0
1454af083:     	movss	%xmm0, 0x418(%r13)
1454af08c:     	movl	$0x0, 0x93c(%r13)
1454af097:     	ucomiss	0x994(%r13), %xmm7
1454af09f:     	jb	0x1454af3da <.text+0x54ae3da>
1454af0a5:     	addss	0x458463(%rip), %xmm7   # 0x145907510
1454af0ad:     	movss	%xmm7, 0x994(%r13)
1454af0b6:     	movq	0x228(%r13), %rcx
1454af0bd:     	movq	0x230(%r13), %rdx
1454af0c4:     	callq	0x145420480 <.text+0x541f480>
1454af0c9:     	imulq	$0xf0, %rax, %rax
1454af0d0:     	leaq	0x1284441(%rip), %rcx   # 0x146733518
1454af0d7:     	movq	0x80(%rax,%rcx), %r14
1454af0df:     	testq	%r14, %r14
1454af0e2:     	js	0x1454af0eb <.text+0x54ae0eb>
1454af0e4:     	cvtsi2ss	%r14, %xmm11
1454af0e9:     	jmp	0x1454af104 <.text+0x54ae104>
1454af0eb:     	movq	%r14, %rax
1454af0ee:     	shrq	%rax
1454af0f1:     	movl	%r14d, %ecx
1454af0f4:     	andl	$0x1, %ecx
1454af0f7:     	orq	%rax, %rcx
1454af0fa:     	cvtsi2ss	%rcx, %xmm11
1454af0ff:     	addss	%xmm11, %xmm11
1454af104:     	movsd	0x400(%r13), %xmm10
1454af10d:     	movss	0x408(%r13), %xmm9
1454af116:     	xorl	%ebx, %ebx
1454af118:     	movss	0x45a4c3(%rip), %xmm12  # 0x1459095e4
1454af121:     	movaps	0x1546b67(%rip), %xmm13 # 0x1469f5c90
1454af129:     	leaq	0xb0(%rbp), %rdi
1454af130:     	jmp	0x1454af180 <.text+0x54ae180>
1454af132:     	nopw	%cs:(%rax,%rax)
1454af140:     	movss	0xb8(%r15), %xmm0
1454af149:     	leaq	0x1(%rbx), %rsi
1454af14d:     	movlps	%xmm7, 0xb4(%rbp)
1454af154:     	movss	%xmm0, 0xbc(%rbp)
1454af15c:     	movl	$0x1, 0xb0(%rbp)
1454af166:     	movq	%r13, %rcx
1454af169:     	movq	%rbx, %rdx
1454af16c:     	movq	%rdi, %r8
1454af16f:     	callq	0x1454d4130 <.text+0x54d3130>
1454af174:     	movq	%rsi, %rbx
1454af177:     	cmpq	%rsi, %r14
1454af17a:     	je	0x1454af232 <.text+0x54ae232>
1454af180:     	testq	%rbx, %rbx
1454af183:     	js	0x1454af190 <.text+0x54ae190>
1454af185:     	xorps	%xmm8, %xmm8
1454af189:     	cvtsi2ss	%rbx, %xmm8
1454af18e:     	jmp	0x1454af1ac <.text+0x54ae1ac>
1454af190:     	movq	%rbx, %rax
1454af193:     	shrq	%rax
1454af196:     	movl	%ebx, %ecx
1454af198:     	andl	$0x1, %ecx
1454af19b:     	orq	%rax, %rcx
1454af19e:     	xorps	%xmm8, %xmm8
1454af1a2:     	cvtsi2ss	%rcx, %xmm8
1454af1a7:     	addss	%xmm8, %xmm8
1454af1ac:     	divss	%xmm11, %xmm8
1454af1b1:     	mulss	%xmm12, %xmm8
1454af1b6:     	movaps	%xmm8, %xmm0
1454af1ba:     	callq	0x145773247 <.text+0x5772247>
1454af1bf:     	movaps	%xmm0, %xmm7
1454af1c2:     	movaps	%xmm8, %xmm0
1454af1c6:     	callq	0x145773235 <.text+0x5772235>
1454af1cb:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454af1ce:     	mulps	%xmm13, %xmm7
1454af1d2:     	addps	%xmm10, %xmm7
1454af1d6:     	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
1454af1db:     	movq	0x898(%r13), %r15
1454af1e2:     	leaq	0x10(%r15), %rcx
1454af1e6:     	movaps	%xmm7, %xmm1
1454af1e9:     	movaps	%xmm8, %xmm2
1454af1ed:     	callq	0x14552a140 <.text+0x5529140>
1454af1f2:     	testb	$0x1, %al
1454af1f4:     	jne	0x1454af149 <.text+0x54ae149>
1454af1fa:     	cmpq	$-0x1, 0x68(%r15)
1454af1ff:     	je	0x1454af140 <.text+0x54ae140>
1454af205:     	leaq	0x68(%r15), %rdx
1454af209:     	movq	%rdi, %rcx
1454af20c:     	movaps	%xmm7, %xmm2
1454af20f:     	movaps	%xmm8, %xmm3
1454af213:     	callq	0x14552d220 <.text+0x552c220>
1454af218:     	cmpl	$0x1, 0xb0(%rbp)
1454af21f:     	jne	0x1454af140 <.text+0x54ae140>
1454af225:     	movss	0xbc(%rbp), %xmm0
1454af22d:     	jmp	0x1454af149 <.text+0x54ae149>
1454af232:     	movss	0x535762(%rip), %xmm0   # 0x1459e499c
1454af23a:     	addps	%xmm10, %xmm0
1454af23e:     	movlps	%xmm0, 0xb0(%rbp)
1454af245:     	movss	%xmm9, 0xb8(%rbp)
1454af24e:     	leaq	0xb0(%rbp), %rdi
1454af255:     	movq	%r13, %rcx
1454af258:     	xorl	%edx, %edx
1454af25a:     	movl	$0x1, %r8d
1454af260:     	movq	%rdi, %r9
1454af263:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af268:     	movsd	0x1546a30(%rip), %xmm0  # 0x1469f5ca0
1454af270:     	addps	%xmm10, %xmm0
1454af274:     	movlps	%xmm0, 0xb0(%rbp)
1454af27b:     	movss	%xmm9, 0xb8(%rbp)
1454af284:     	movq	%r13, %rcx
1454af287:     	xorl	%edx, %edx
1454af289:     	movl	$0x5, %r8d
1454af28f:     	movq	%rdi, %r9
1454af292:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af297:     	movsd	0x1546a11(%rip), %xmm0  # 0x1469f5cb0
1454af29f:     	addps	%xmm10, %xmm0
1454af2a3:     	movlps	%xmm0, 0xb0(%rbp)
1454af2aa:     	movss	%xmm9, 0xb8(%rbp)
1454af2b3:     	movq	%r13, %rcx
1454af2b6:     	xorl	%edx, %edx
1454af2b8:     	movl	$0x1e, %r8d
1454af2be:     	movq	%rdi, %r9
1454af2c1:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af2c6:     	movsd	0x15469f2(%rip), %xmm0  # 0x1469f5cc0
1454af2ce:     	addps	%xmm10, %xmm0
1454af2d2:     	movlps	%xmm0, 0xb0(%rbp)
1454af2d9:     	movss	%xmm9, 0xb8(%rbp)
1454af2e2:     	movq	%r13, %rcx
1454af2e5:     	movl	$0x1, %edx
1454af2ea:     	movl	$0x1, %r8d
1454af2f0:     	movq	%rdi, %r9
1454af2f3:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af2f8:     	movsd	0x15469d0(%rip), %xmm0  # 0x1469f5cd0
1454af300:     	addps	%xmm10, %xmm0
1454af304:     	movlps	%xmm0, 0xb0(%rbp)
1454af30b:     	movss	%xmm9, 0xb8(%rbp)
1454af314:     	movq	%r13, %rcx
1454af317:     	movl	$0x2, %edx
1454af31c:     	movq	%rdi, %r9
1454af31f:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af324:     	movsd	0x15469b4(%rip), %xmm0  # 0x1469f5ce0
1454af32c:     	addps	%xmm10, %xmm0
1454af330:     	movlps	%xmm0, 0xb0(%rbp)
1454af337:     	movss	%xmm9, 0xb8(%rbp)
1454af340:     	movq	%r13, %rcx
1454af343:     	movl	$0x3, %edx
1454af348:     	movq	%rdi, %r9
1454af34b:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af350:     	movsd	0x1546998(%rip), %xmm0  # 0x1469f5cf0
1454af358:     	addps	%xmm10, %xmm0
1454af35c:     	movlps	%xmm0, 0xb0(%rbp)
1454af363:     	movss	%xmm9, 0xb8(%rbp)
1454af36c:     	movq	%r13, %rcx
1454af36f:     	movl	$0x4, %edx
1454af374:     	movq	%rdi, %r9
1454af377:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af37c:     	movsd	0x154697c(%rip), %xmm0  # 0x1469f5d00
1454af384:     	addps	%xmm10, %xmm0
1454af388:     	movlps	%xmm0, 0xb0(%rbp)
1454af38f:     	movss	%xmm9, 0xb8(%rbp)
1454af398:     	movq	%r13, %rcx
1454af39b:     	movl	$0x5, %edx
1454af3a0:     	movq	%rdi, %r9
1454af3a3:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af3a8:     	addps	0x1546960(%rip), %xmm10 # 0x1469f5d10
1454af3b0:     	movlps	%xmm10, 0xb0(%rbp)
1454af3b8:     	movss	%xmm9, 0xb8(%rbp)
1454af3c1:     	movq	%r13, %rcx
1454af3c4:     	movl	$0x6, %edx
1454af3c9:     	movq	%rdi, %r9
1454af3cc:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454af3d1:     	movss	0x934(%r13), %xmm7
1454af3da:     	leaq	0x934(%r13), %rax
1454af3e1:     	movq	%rax, 0xa8(%rbp)
1454af3e8:     	cmpl	$0x1, 0x890(%r13)
1454af3f0:     	jne	0x1454af732 <.text+0x54ae732>
1454af3f6:     	movss	0x998(%r13), %xmm0
1454af3ff:     	ucomiss	%xmm7, %xmm0
1454af402:     	ja	0x1454af732 <.text+0x54ae732>
1454af408:     	addss	0x894(%r13), %xmm7
1454af411:     	movss	%xmm7, 0x998(%r13)
1454af41a:     	leaq	0x1547158(%rip), %rdx   # 0x1469f6579
1454af421:     	leaq	0xb0(%rbp), %rcx
1454af428:     	movl	$0x11, %r8d
1454af42e:     	callq	0x145718ed0 <.text+0x5717ed0>
1454af433:     	movl	$0x1, %esi
1454af438:     	movq	0xb0(%rbp), %rdx
1454af43f:     	cmpq	$-0x1, %rdx
1454af443:     	je	0x1454af480 <.text+0x54ae480>
1454af445:     	cmpq	$-0x2, %rdx
1454af449:     	jne	0x1454af469 <.text+0x54ae469>
1454af44b:     	movq	0xb8(%rbp), %rax
1454af452:     	movq	%rax, 0x358(%rbp)
1454af459:     	movq	0xc0(%rbp), %rsi
1454af460:     	movq	0xc8(%rbp), %rax
1454af467:     	jmp	0x1454af48d <.text+0x54ae48d>
1454af469:     	testq	%rdx, %rdx
1454af46c:     	je	0x1454af480 <.text+0x54ae480>
1454af46e:     	movq	0xb8(%rbp), %rcx
1454af475:     	movl	$0x1, %r8d
1454af47b:     	callq	0x1400021d0 <.text+0x11d0>
1454af480:     	movq	$0x0, 0x358(%rbp)
1454af48b:     	xorl	%eax, %eax
1454af48d:     	movq	$0x0, 0xb0(%rbp)
1454af498:     	movq	%rax, 0xb8(%rbp)
1454af49f:     	movq	%rsi, 0x340(%rbp)
1454af4a6:     	movq	%rsi, 0xc0(%rbp)
1454af4ad:     	movq	%rax, 0xc8(%rbp)
1454af4b4:     	movq	$0x0, 0xd0(%rbp)
1454af4bf:     	movq	%rax, 0xd8(%rbp)
1454af4c6:     	movabsq	$0x3b0000003b, %rax     # imm = 0x3B0000003B
1454af4d0:     	movq	%rax, 0xe0(%rbp)
1454af4d7:     	movb	$0x1, 0xe8(%rbp)
1454af4de:     	movw	$0x1, 0xf0(%rbp)
1454af4e7:     	leaq	0x240(%rbp), %rcx
1454af4ee:     	leaq	0xb0(%rbp), %rdx
1454af4f5:     	callq	0x145534e60 <.text+0x5533e60>
1454af4fa:     	nop
1454af4fb:     	movq	0x358(%rbp), %rdx
1454af502:     	testq	%rdx, %rdx
1454af505:     	je	0x1454af519 <.text+0x54ae519>
1454af507:     	movl	$0x1, %r8d
1454af50d:     	movq	0x340(%rbp), %rcx
1454af514:     	callq	0x1400021d0 <.text+0x11d0>
1454af519:     	leaq	0x400(%r13), %rdi
1454af520:     	movq	0x250(%rbp), %r9
1454af527:     	testq	%r9, %r9
1454af52a:     	je	0x1454af550 <.text+0x54ae550>
1454af52c:     	movq	0x248(%rbp), %r8
1454af533:     	movq	0x8f0(%r13), %rcx
1454af53a:     	movq	%rcx, %rax
1454af53d:     	orq	%r9, %rax
1454af540:     	shrq	$0x20, %rax
1454af544:     	je	0x1454af563 <.text+0x54ae563>
1454af546:     	movq	%rcx, %rax
1454af549:     	xorl	%edx, %edx
1454af54b:     	divq	%r9
1454af54e:     	jmp	0x1454af56a <.text+0x54ae56a>
1454af550:     	leaq	0x404(%r13), %rax
1454af557:     	movq	0x8f0(%r13), %rcx
1454af55e:     	movq	%rdi, %r9
1454af561:     	jmp	0x1454af576 <.text+0x54ae576>
1454af563:     	movl	%ecx, %eax
1454af565:     	xorl	%edx, %edx
1454af567:     	divl	%r9d
1454af56a:     	leaq	(%r8,%rdx,8), %r9
1454af56e:     	leaq	(%r8,%rdx,8), %rax
1454af572:     	addq	$0x4, %rax
1454af576:     	movss	(%r9), %xmm7
1454af57b:     	movss	(%rax), %xmm8
1454af580:     	incq	%rcx
1454af583:     	movq	%rcx, 0x8f0(%r13)
1454af58a:     	movq	0x898(%r13), %rcx
1454af591:     	cmpq	$-0x1, 0x68(%rcx)
1454af596:     	je	0x1454af705 <.text+0x54ae705>
1454af59c:     	addq	$0x68, %rcx
1454af5a0:     	movaps	%xmm7, %xmm1
1454af5a3:     	movaps	%xmm8, %xmm2
1454af5a7:     	callq	0x14552b4e0 <.text+0x552a4e0>
1454af5ac:     	nop
1454af5ad:     	testb	$0x1, %al
1454af5af:     	je	0x1454af705 <.text+0x54ae705>
1454af5b5:     	addss	0x49f057(%rip), %xmm0   # 0x14594e614
1454af5bd:     	movss	%xmm7, 0x2f0(%rbp)
1454af5c5:     	movss	%xmm8, 0x2f4(%rbp)
1454af5ce:     	movss	%xmm0, 0x2f8(%rbp)
1454af5d6:     	leaq	0x934(%r13), %rax
1454af5dd:     	movq	%rax, 0xb0(%rbp)
1454af5e4:     	leaq	0x28a105(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1454af5eb:     	movq	%rax, 0xb8(%rbp)
1454af5f2:     	leaq	0x2f0(%rbp), %rax
1454af5f9:     	movq	%rax, 0xc0(%rbp)
1454af600:     	leaq	0xab329(%rip), %rax     # 0x14555a930 <.text+0x5559930>
1454af607:     	movq	%rax, 0xc8(%rbp)
1454af60e:     	leaq	0x1546f75(%rip), %rcx   # 0x1469f658a
1454af615:     	leaq	0xb0(%rbp), %rdx
1454af61c:     	callq	0x145711f90 <.text+0x5710f90>
1454af621:     	nop
1454af622:     	movl	0x4cc(%r13), %r8d
1454af629:     	leal	0x1(%r8), %eax
1454af62d:     	movl	%eax, 0x4cc(%r13)
1454af634:     	movq	0x3e8(%r13), %rdx
1454af63b:     	movss	0x40c(%r13), %xmm0
1454af644:     	movl	0x2f8(%rbp), %eax
1454af64a:     	movl	%eax, 0x2c0(%rbp)
1454af650:     	movq	0x2f0(%rbp), %rax
1454af657:     	movq	%rax, 0x2b8(%rbp)
1454af65e:     	movss	%xmm0, 0x20(%rsp)
1454af664:     	leaq	0xb0(%rbp), %rcx
1454af66b:     	leaq	0x2b8(%rbp), %r9
1454af672:     	callq	0x145467450 <.text+0x5466450>
1454af677:     	nop
1454af678:     	movq	0x560(%r13), %rsi
1454af67f:     	cmpq	0x550(%r13), %rsi
1454af686:     	jne	0x1454af695 <.text+0x54ae695>
1454af688:     	leaq	0x550(%r13), %rcx
1454af68f:     	callq	0x145774710 <.text+0x5773710>
1454af694:     	nop
1454af695:     	movq	0x558(%r13), %rax
1454af69c:     	movq	%rsi, %rcx
1454af69f:     	shlq	$0x5, %rcx
1454af6a3:     	movups	0xb0(%rbp), %xmm0
1454af6aa:     	movups	0xc0(%rbp), %xmm1
1454af6b1:     	movups	%xmm1, 0x10(%rax,%rcx)
1454af6b6:     	movups	%xmm0, (%rax,%rcx)
1454af6ba:     	incq	%rsi
1454af6bd:     	movq	%rsi, 0x560(%r13)
1454af6c4:     	movl	$0x1, 0x8f8(%r13)
1454af6cf:     	movq	0x2f0(%rbp), %rax
1454af6d6:     	movq	%rax, 0x8fc(%r13)
1454af6dd:     	movl	0x2f8(%rbp), %eax
1454af6e3:     	movl	%eax, 0x904(%r13)
1454af6ea:     	movb	$0xc, 0x908(%r13)
1454af6f2:     	movl	0x2f8(%rbp), %eax
1454af6f8:     	movl	%eax, 0x8(%rdi)
1454af6fb:     	movq	0x2f0(%rbp), %rax
1454af702:     	movq	%rax, (%rdi)
1454af705:     	movq	0x240(%rbp), %rdx
1454af70c:     	testq	%rdx, %rdx
1454af70f:     	je	0x1454af727 <.text+0x54ae727>
1454af711:     	movq	0x248(%rbp), %rcx
1454af718:     	shlq	$0x3, %rdx
1454af71c:     	movl	$0x4, %r8d
1454af722:     	callq	0x1400021d0 <.text+0x11d0>
1454af727:     	leaq	0x934(%r13), %rax
1454af72e:     	movss	(%rax), %xmm7
1454af732:     	movq	$0x0, 0x2f0(%rbp)
1454af73d:     	movq	$0x4, 0x2f8(%rbp)
1454af748:     	movq	$0x0, 0x300(%rbp)
1454af753:     	movq	$0x0, 0x2b8(%rbp)
1454af75e:     	movq	$0x4, 0x2c0(%rbp)
1454af769:     	movq	$0x0, 0x2c8(%rbp)
1454af774:     	movq	0x310(%r13), %r14
1454af77b:     	movq	0x318(%r13), %rax
1454af782:     	leaq	(%rax,%rax,2), %rax
1454af786:     	leaq	(%r14,%rax,8), %rdi
1454af78a:     	xorps	%xmm9, %xmm9
1454af78e:     	xorps	%xmm8, %xmm8
1454af792:     	jmp	0x1454af7b4 <.text+0x54ae7b4>
1454af794:     	nopw	%cs:(%rax,%rax)
1454af7a0:     	movq	0x2c0(%rbp), %rax
1454af7a7:     	movl	%ebx, (%rax,%rsi,4)
1454af7aa:     	incq	%rsi
1454af7ad:     	movq	%rsi, 0x2c8(%rbp)
1454af7b4:     	cmpq	%rdi, %r14
1454af7b7:     	je	0x1454af899 <.text+0x54ae899>
1454af7bd:     	movq	%r14, %rbx
1454af7c0:     	movss	0x14(%r14), %xmm0
1454af7c6:     	ucomiss	%xmm9, %xmm0
1454af7ca:     	jbe	0x1454af85b <.text+0x54ae85b>
1454af7d0:     	movss	0x10(%rbx), %xmm1
1454af7d5:     	subss	%xmm7, %xmm1
1454af7d9:     	movaps	%xmm1, %xmm2
1454af7dc:     	maxss	%xmm6, %xmm2
1454af7e0:     	movaps	%xmm2, %xmm3
1454af7e3:     	cmpunordss	%xmm2, %xmm3
1454af7e8:     	andps	%xmm3, %xmm1
1454af7eb:     	andnps	%xmm2, %xmm3
1454af7ee:     	orps	%xmm1, %xmm3
1454af7f1:     	movaps	%xmm6, %xmm10
1454af7f5:     	divss	%xmm3, %xmm10
1454af7fa:     	minss	0x457c8d(%rip), %xmm10  # 0x145907490
1454af803:     	mulss	%xmm0, %xmm10
1454af808:     	subss	%xmm10, %xmm0
1454af80d:     	movss	%xmm0, 0x14(%rbx)
1454af812:     	movl	0xc(%rbx), %r14d
1454af816:     	movq	0x300(%rbp), %rsi
1454af81d:     	cmpq	0x2f0(%rbp), %rsi
1454af824:     	jne	0x1454af83a <.text+0x54ae83a>
1454af826:     	movb	$0x1, 0x377(%rbp)
1454af82d:     	leaq	0x2f0(%rbp), %rcx
1454af834:     	callq	0x145780180 <.text+0x577f180>
1454af839:     	nop
1454af83a:     	addss	%xmm10, %xmm8
1454af83f:     	movq	0x2f8(%rbp), %rax
1454af846:     	movl	%r14d, (%rax,%rsi,8)
1454af84a:     	movss	%xmm10, 0x4(%rax,%rsi,8)
1454af851:     	incq	%rsi
1454af854:     	movq	%rsi, 0x300(%rbp)
1454af85b:     	leaq	0x18(%rbx), %r14
1454af85f:     	ucomiss	0x10(%rbx), %xmm7
1454af863:     	jb	0x1454af7b4 <.text+0x54ae7b4>
1454af869:     	movl	0xc(%rbx), %ebx
1454af86c:     	movq	0x2c8(%rbp), %rsi
1454af873:     	cmpq	0x2b8(%rbp), %rsi
1454af87a:     	jne	0x1454af7a0 <.text+0x54ae7a0>
1454af880:     	movb	$0x1, 0x377(%rbp)
1454af887:     	leaq	0x2b8(%rbp), %rcx
1454af88e:     	callq	0x145777a50 <.text+0x5776a50>
1454af893:     	nop
1454af894:     	jmp	0x1454af7a0 <.text+0x54ae7a0>
1454af899:     	movq	0x2c8(%rbp), %rax
1454af8a0:     	testq	%rax, %rax
1454af8a3:     	je	0x1454af9ee <.text+0x54ae9ee>
1454af8a9:     	movl	0x3f0(%r13), %ecx
1454af8b0:     	testl	%ecx, %ecx
1454af8b2:     	je	0x1454af987 <.text+0x54ae987>
1454af8b8:     	movss	0x3f4(%r13), %xmm0
1454af8c1:     	movq	0x2c0(%rbp), %r8
1454af8c8:     	movabsq	$0x1ffffffffffffff0, %r9 # imm = 0x1FFFFFFFFFFFFFF0
1454af8d2:     	andq	%rax, %r9
1454af8d5:     	leaq	(%r8,%r9,4), %rdx
1454af8d9:     	andl	$0xf, %eax
1454af8dc:     	movd	%ecx, %xmm1
1454af8e0:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454af8e5:     	xorl	%r10d, %r10d
1454af8e8:     	nopl	(%rax,%rax)
1454af8f0:     	cmpq	%r10, %r9
1454af8f3:     	je	0x1454af93c <.text+0x54ae93c>
1454af8f5:     	movdqu	(%r8,%r10,4), %xmm2
1454af8fb:     	movdqu	0x10(%r8,%r10,4), %xmm3
1454af902:     	movdqu	0x20(%r8,%r10,4), %xmm4
1454af909:     	movdqu	0x30(%r8,%r10,4), %xmm5
1454af910:     	pcmpeqd	%xmm1, %xmm3
1454af914:     	pcmpeqd	%xmm1, %xmm2
1454af918:     	packssdw	%xmm3, %xmm2
1454af91c:     	pcmpeqd	%xmm1, %xmm4
1454af920:     	pcmpeqd	%xmm1, %xmm5
1454af924:     	packssdw	%xmm5, %xmm4
1454af928:     	packsswb	%xmm4, %xmm2
1454af92c:     	pmovmskb	%xmm2, %r11d
1454af931:     	addq	$0x10, %r10
1454af935:     	testl	%r11d, %r11d
1454af938:     	je	0x1454af8f0 <.text+0x54ae8f0>
1454af93a:     	jmp	0x1454af95f <.text+0x54ae95f>
1454af93c:     	shll	$0x2, %eax
1454af93f:     	xorl	%r8d, %r8d
1454af942:     	nopw	%cs:(%rax,%rax)
1454af950:     	cmpq	%r8, %rax
1454af953:     	je	0x1454af987 <.text+0x54ae987>
1454af955:     	cmpl	%ecx, (%rdx,%r8)
1454af959:     	leaq	0x4(%r8), %r8
1454af95d:     	jne	0x1454af950 <.text+0x54ae950>
1454af95f:     	movss	0x41c(%r13), %xmm1
1454af968:     	subss	%xmm0, %xmm1
1454af96c:     	xorps	%xmm0, %xmm0
1454af96f:     	maxss	%xmm0, %xmm1
1454af973:     	movss	%xmm1, 0x41c(%r13)
1454af97c:     	movq	$0x0, 0x3f0(%r13)
1454af987:     	movq	0x318(%r13), %rax
1454af98e:     	testq	%rax, %rax
1454af991:     	je	0x1454af9ce <.text+0x54ae9ce>
1454af993:     	movq	0x310(%r13), %rcx
1454af99a:     	leaq	0x28(%rcx), %r9
1454af99e:     	movq	%rax, %rdx
1454af9a1:     	negq	%rdx
1454af9a4:     	xorl	%r8d, %r8d
1454af9a7:     	nopw	(%rax,%rax)
1454af9b0:     	movss	-0x18(%r9), %xmm0
1454af9b6:     	ucomiss	%xmm7, %xmm0
1454af9b9:     	jbe	0x1454b38db <.text+0x54b28db>
1454af9bf:     	incq	%r8
1454af9c2:     	addq	$0x18, %r9
1454af9c6:     	movq	%rdx, %r10
1454af9c9:     	addq	%r8, %r10
1454af9cc:     	jne	0x1454af9b0 <.text+0x54ae9b0>
1454af9ce:     	movb	$0x1, 0x377(%rbp)
1454af9d5:     	movq	%r13, %rcx
1454af9d8:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454af9dd:     	nop
1454af9de:     	movb	$0x1, 0x377(%rbp)
1454af9e5:     	movq	%r13, %rcx
1454af9e8:     	callq	0x14549e650 <.text+0x549d650>
1454af9ed:     	nop
1454af9ee:     	movss	0x494(%r13), %xmm9
1454af9f7:     	mulss	%xmm6, %xmm9
1454af9fc:     	movss	0x418(%r13), %xmm10
1454afa05:     	movss	0x470(%r13), %xmm7
1454afa0e:     	ucomiss	%xmm10, %xmm7
1454afa12:     	movaps	%xmm10, %xmm11
1454afa16:     	jbe	0x1454afc20 <.text+0x54aec20>
1454afa1c:     	movaps	%xmm9, %xmm1
1454afa20:     	addss	%xmm10, %xmm1
1454afa25:     	addss	%xmm8, %xmm1
1454afa2a:     	movaps	%xmm1, %xmm2
1454afa2d:     	minss	%xmm7, %xmm2
1454afa31:     	movaps	%xmm2, %xmm0
1454afa34:     	cmpunordss	%xmm2, %xmm0
1454afa39:     	andps	%xmm0, %xmm1
1454afa3c:     	andnps	%xmm2, %xmm0
1454afa3f:     	orps	%xmm1, %xmm0
1454afa42:     	movss	%xmm0, 0x418(%r13)
1454afa4b:     	xorps	%xmm11, %xmm11
1454afa4f:     	maxss	%xmm11, %xmm0
1454afa54:     	callq	0x14577327d <.text+0x577227d>
1454afa59:     	cvttss2si	%xmm0, %rax
1454afa5e:     	xorl	%ecx, %ecx
1454afa60:     	ucomiss	%xmm11, %xmm0
1454afa64:     	cmovbl	%ecx, %eax
1454afa67:     	ucomiss	0x457abe(%rip), %xmm0   # 0x14590752c
1454afa6e:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454afa74:     	cmovbel	%eax, %r8d
1454afa78:     	leaq	0x8d8(%r13), %rdi
1454afa7f:     	movq	0x8d8(%r13), %rax
1454afa86:     	testq	%rax, %rax
1454afa89:     	je	0x1454afaef <.text+0x54aeaef>
1454afa8b:     	movq	0x8e0(%r13), %rcx
1454afa92:     	movw	$0x16, %dx
1454afa96:     	movzwl	0x36(%rax), %r10d
1454afa9b:     	movl	%r10d, %r11d
1454afa9e:     	addl	%r11d, %r11d
1454afaa1:     	movq	$-0x1, %r9
1454afaa8:     	nopl	(%rax,%rax)
1454afab0:     	testq	%r11, %r11
1454afab3:     	je	0x1454afad8 <.text+0x54aead8>
1454afab5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454afabb:     	seta	%bl
1454afabe:     	sbbb	$0x0, %bl
1454afac1:     	incq	%r9
1454afac4:     	addq	$-0x2, %r11
1454afac8:     	cmpb	$0x1, %bl
1454afacb:     	je	0x1454afab0 <.text+0x54aeab0>
1454afacd:     	movzbl	%bl, %r10d
1454afad1:     	testl	%r10d, %r10d
1454afad4:     	jne	0x1454afadb <.text+0x54aeadb>
1454afad6:     	jmp	0x1454afae8 <.text+0x54aeae8>
1454afad8:     	movq	%r10, %r9
1454afadb:     	subq	$0x1, %rcx
1454afadf:     	jb	0x1454afaf1 <.text+0x54aeaf1>
1454afae1:     	movq	0x50(%rax,%r9,8), %rax
1454afae6:     	jmp	0x1454afa96 <.text+0x54aea96>
1454afae8:     	movl	%r8d, 0x8(%rax,%r9,4)
1454afaed:     	jmp	0x1454afb37 <.text+0x54aeb37>
1454afaef:     	xorl	%eax, %eax
1454afaf1:     	movq	%rdi, 0xb0(%rbp)
1454afaf8:     	movq	%rax, 0xb8(%rbp)
1454afaff:     	movq	$0x0, 0xc0(%rbp)
1454afb0a:     	movq	%r9, 0xc8(%rbp)
1454afb11:     	movq	$0x16, 0xd0(%rbp)
1454afb1c:     	movb	$0x1, 0x377(%rbp)
1454afb23:     	leaq	0x240(%rbp), %rcx
1454afb2a:     	leaq	0xb0(%rbp), %rdx
1454afb31:     	callq	0x14552a730 <.text+0x5529730>
1454afb36:     	nop
1454afb37:     	movaps	%xmm7, %xmm0
1454afb3a:     	callq	0x14577327d <.text+0x577227d>
1454afb3f:     	cvttss2si	%xmm0, %rax
1454afb44:     	xorl	%ecx, %ecx
1454afb46:     	xorps	%xmm1, %xmm1
1454afb49:     	ucomiss	%xmm1, %xmm0
1454afb4c:     	cmovbl	%ecx, %eax
1454afb4f:     	ucomiss	0x4579d6(%rip), %xmm0   # 0x14590752c
1454afb56:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454afb5c:     	cmovbel	%eax, %r8d
1454afb60:     	movq	(%rdi), %rax
1454afb63:     	testq	%rax, %rax
1454afb66:     	je	0x1454afbcf <.text+0x54aebcf>
1454afb68:     	movq	0x8e0(%r13), %rcx
1454afb6f:     	movw	$0x1c, %dx
1454afb73:     	movzwl	0x36(%rax), %r10d
1454afb78:     	movl	%r10d, %r11d
1454afb7b:     	addl	%r11d, %r11d
1454afb7e:     	movq	$-0x1, %r9
1454afb85:     	nopw	%cs:(%rax,%rax)
1454afb90:     	testq	%r11, %r11
1454afb93:     	je	0x1454afbb8 <.text+0x54aebb8>
1454afb95:     	cmpw	0x3a(%rax,%r9,2), %dx
1454afb9b:     	seta	%bl
1454afb9e:     	sbbb	$0x0, %bl
1454afba1:     	incq	%r9
1454afba4:     	addq	$-0x2, %r11
1454afba8:     	cmpb	$0x1, %bl
1454afbab:     	je	0x1454afb90 <.text+0x54aeb90>
1454afbad:     	movzbl	%bl, %r10d
1454afbb1:     	testl	%r10d, %r10d
1454afbb4:     	jne	0x1454afbbb <.text+0x54aebbb>
1454afbb6:     	jmp	0x1454afbc8 <.text+0x54aebc8>
1454afbb8:     	movq	%r10, %r9
1454afbbb:     	subq	$0x1, %rcx
1454afbbf:     	jb	0x1454afbd1 <.text+0x54aebd1>
1454afbc1:     	movq	0x50(%rax,%r9,8), %rax
1454afbc6:     	jmp	0x1454afb73 <.text+0x54aeb73>
1454afbc8:     	movl	%r8d, 0x8(%rax,%r9,4)
1454afbcd:     	jmp	0x1454afc17 <.text+0x54aec17>
1454afbcf:     	xorl	%eax, %eax
1454afbd1:     	movq	%rdi, 0xb0(%rbp)
1454afbd8:     	movq	%rax, 0xb8(%rbp)
1454afbdf:     	movq	$0x0, 0xc0(%rbp)
1454afbea:     	movq	%r9, 0xc8(%rbp)
1454afbf1:     	movq	$0x1c, 0xd0(%rbp)
1454afbfc:     	movb	$0x1, 0x377(%rbp)
1454afc03:     	leaq	0x240(%rbp), %rcx
1454afc0a:     	leaq	0xb0(%rbp), %rdx
1454afc11:     	callq	0x14552a730 <.text+0x5529730>
1454afc16:     	nop
1454afc17:     	movss	0x418(%r13), %xmm11
1454afc20:     	movb	$0x1, 0x377(%rbp)
1454afc27:     	leaq	0x1546cca(%rip), %rdi   # 0x1469f68f8
1454afc2e:     	movl	$0xc, %edx
1454afc33:     	movq	%rdi, %rcx
1454afc36:     	callq	0x145457cb0 <.text+0x5456cb0>
1454afc3b:     	nop
1454afc3c:     	subss	%xmm10, %xmm11
1454afc41:     	xorps	%xmm7, %xmm7
1454afc44:     	maxss	%xmm7, %xmm11
1454afc49:     	movaps	%xmm9, %xmm0
1454afc4d:     	minss	%xmm11, %xmm0
1454afc52:     	ucomiss	%xmm0, %xmm7
1454afc55:     	jae	0x1454afcc2 <.text+0x54aecc2>
1454afc57:     	testq	%rax, %rax
1454afc5a:     	movl	$0xc, %ecx
1454afc5f:     	cmoveq	%rcx, %rdx
1454afc63:     	cmovneq	%rax, %rdi
1454afc67:     	movq	$-0x1, 0xb0(%rbp)
1454afc72:     	movq	%rdi, 0xb8(%rbp)
1454afc79:     	movq	%rdx, 0xc0(%rbp)
1454afc80:     	leaq	0x1546c7d(%rip), %rax   # 0x1469f6904
1454afc87:     	movq	%rax, 0xc8(%rbp)
1454afc8e:     	movq	$0x19, 0xd0(%rbp)
1454afc99:     	movb	$0x0, 0xd8(%rbp)
1454afca0:     	leaq	0x5f8(%r13), %rcx
1454afca7:     	xorps	%xmm2, %xmm2
1454afcaa:     	cvtss2sd	%xmm0, %xmm2
1454afcae:     	movb	$0x1, 0x377(%rbp)
1454afcb5:     	leaq	0xb0(%rbp), %rdx
1454afcbc:     	callq	0x1455021b0 <.text+0x55011b0>
1454afcc1:     	nop
1454afcc2:     	movb	$0x1, %r12b
1454afcc5:     	ucomiss	%xmm7, %xmm8
1454afcc9:     	jbe	0x1454aff2d <.text+0x54aef2d>
1454afccf:     	movss	0x418(%r13), %xmm0
1454afcd8:     	subss	%xmm10, %xmm0
1454afcdd:     	subss	%xmm9, %xmm0
1454afce2:     	xorps	%xmm9, %xmm9
1454afce6:     	xorps	%xmm1, %xmm1
1454afce9:     	maxss	%xmm0, %xmm1
1454afced:     	movaps	%xmm8, %xmm7
1454afcf1:     	minss	%xmm1, %xmm7
1454afcf5:     	movq	0x2f0(%rbp), %rax
1454afcfc:     	movq	%rax, 0x340(%rbp)
1454afd03:     	movq	0x2f8(%rbp), %rax
1454afd0a:     	movq	%rax, 0x358(%rbp)
1454afd11:     	movq	0x300(%rbp), %rax
1454afd18:     	testq	%rax, %rax
1454afd1b:     	je	0x1454afdfd <.text+0x54aedfd>
1454afd21:     	movq	0x358(%rbp), %r12
1454afd28:     	leaq	(%r12,%rax,8), %rbx
1454afd2c:     	movq	0x368(%rbp), %rax
1454afd33:     	leaq	0x5f8(%rax), %rdi
1454afd3a:     	leaq	0x1546d17(%rip), %r14   # 0x1469f6a58
1454afd41:     	movl	$0x5, %esi
1454afd46:     	leaq	0x1546d10(%rip), %r13   # 0x1469f6a5d
1454afd4d:     	leaq	0xb0(%rbp), %r15
1454afd54:     	jmp	0x1454afd8d <.text+0x54aed8d>
1454afd56:     	nopw	%cs:(%rax,%rax)
1454afd60:     	movq	%r15, %rcx
1454afd63:     	movq	0x368(%rbp), %rdx
1454afd6a:     	callq	0x1454a0520 <.text+0x549f520>
1454afd6f:     	nop
1454afd70:     	xorps	%xmm2, %xmm2
1454afd73:     	cvtss2sd	%xmm10, %xmm2
1454afd78:     	movq	%rdi, %rcx
1454afd7b:     	movq	%r15, %rdx
1454afd7e:     	callq	0x1455021b0 <.text+0x55011b0>
1454afd83:     	nop
1454afd84:     	addq	$0x8, %r12
1454afd88:     	cmpq	%rbx, %r12
1454afd8b:     	je	0x1454afdfd <.text+0x54aedfd>
1454afd8d:     	movss	0x4(%r12), %xmm10
1454afd94:     	mulss	%xmm7, %xmm10
1454afd99:     	divss	%xmm8, %xmm10
1454afd9e:     	ucomiss	%xmm10, %xmm9
1454afda2:     	jae	0x1454afd84 <.text+0x54aed84>
1454afda4:     	movl	(%r12), %r8d
1454afda8:     	testl	%r8d, %r8d
1454afdab:     	jne	0x1454afd60 <.text+0x54aed60>
1454afdad:     	movl	$0x5, %edx
1454afdb2:     	movq	%r14, %rcx
1454afdb5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454afdba:     	nop
1454afdbb:     	testq	%rax, %rax
1454afdbe:     	cmoveq	%r14, %rax
1454afdc2:     	cmoveq	%rsi, %rdx
1454afdc6:     	movq	$-0x1, 0xb0(%rbp)
1454afdd1:     	movq	%rax, 0xb8(%rbp)
1454afdd8:     	movq	%rdx, 0xc0(%rbp)
1454afddf:     	movq	%r13, 0xc8(%rbp)
1454afde6:     	movq	$0x18, 0xd0(%rbp)
1454afdf1:     	movb	$0x0, 0xd8(%rbp)
1454afdf8:     	jmp	0x1454afd70 <.text+0x54aed70>
1454afdfd:     	movq	0x340(%rbp), %rdx
1454afe04:     	testq	%rdx, %rdx
1454afe07:     	je	0x1454afe1f <.text+0x54aee1f>
1454afe09:     	shlq	$0x3, %rdx
1454afe0d:     	movl	$0x4, %r8d
1454afe13:     	movq	0x358(%rbp), %rcx
1454afe1a:     	callq	0x1400021d0 <.text+0x11d0>
1454afe1f:     	subss	%xmm7, %xmm8
1454afe24:     	xorps	%xmm0, %xmm0
1454afe27:     	ucomiss	%xmm0, %xmm8
1454afe2b:     	movq	0x368(%rbp), %r13
1454afe32:     	jbe	0x1454afeb8 <.text+0x54aeeb8>
1454afe38:     	movq	0x710(%r13), %rcx
1454afe3f:     	movq	0x718(%r13), %rdx
1454afe46:     	shlq	$0x6, %rdx
1454afe4a:     	xorl	%eax, %eax
1454afe4c:     	xorl	%r8d, %r8d
1454afe4f:     	nop
1454afe50:     	cmpq	%r8, %rdx
1454afe53:     	je	0x1454afe76 <.text+0x54aee76>
1454afe55:     	leaq	0x40(%r8), %r9
1454afe59:     	cmpb	$0x14, (%rcx,%r8)
1454afe5e:     	movq	%r9, %r8
1454afe61:     	jne	0x1454afe50 <.text+0x54aee50>
1454afe63:     	movss	-0x3c(%rcx,%r9), %xmm1
1454afe6a:     	movl	$0x1, %eax
1454afe6f:     	cmpl	$0x1, %eax
1454afe72:     	je	0x1454afe7b <.text+0x54aee7b>
1454afe74:     	jmp	0x1454afeb8 <.text+0x54aeeb8>
1454afe76:     	cmpl	$0x1, %eax
1454afe79:     	jne	0x1454afeb8 <.text+0x54aeeb8>
1454afe7b:     	mulss	0x470(%r13), %xmm1
1454afe84:     	movss	0x41c(%r13), %xmm2
1454afe8d:     	ucomiss	%xmm2, %xmm1
1454afe90:     	jbe	0x1454afeb8 <.text+0x54aeeb8>
1454afe92:     	addss	%xmm8, %xmm2
1454afe97:     	movaps	%xmm2, %xmm3
1454afe9a:     	minss	%xmm1, %xmm3
1454afe9e:     	movaps	%xmm3, %xmm1
1454afea1:     	cmpunordss	%xmm3, %xmm1
1454afea6:     	andps	%xmm1, %xmm2
1454afea9:     	andnps	%xmm3, %xmm1
1454afeac:     	orps	%xmm2, %xmm1
1454afeaf:     	movss	%xmm1, 0x41c(%r13)
1454afeb8:     	addss	%xmm8, %xmm7
1454afebd:     	ucomiss	%xmm0, %xmm7
1454afec0:     	jbe	0x1454aff2a <.text+0x54aef2a>
1454afec2:     	movq	0x710(%r13), %rax
1454afec9:     	movq	0x718(%r13), %rcx
1454afed0:     	shlq	$0x6, %rcx
1454afed4:     	xorl	%edx, %edx
1454afed6:     	nopw	%cs:(%rax,%rax)
1454afee0:     	cmpq	%rdx, %rcx
1454afee3:     	je	0x1454aff01 <.text+0x54aef01>
1454afee5:     	cmpb	$0x15, (%rax,%rdx)
1454afee9:     	leaq	0x40(%rdx), %rdx
1454afeed:     	jne	0x1454afee0 <.text+0x54aeee0>
1454afeef:     	addss	0x120(%r13), %xmm7
1454afef8:     	movss	%xmm7, 0x120(%r13)
1454aff01:     	xorl	%r12d, %r12d
1454aff04:     	movzbl	0x29c(%r13), %eax
1454aff0c:     	addb	$-0x2, %al
1454aff0e:     	cmpb	$0x9, %al
1454aff10:     	jbe	0x1454aff3b <.text+0x54aef3b>
1454aff12:     	leaq	0x128592f(%rip), %rax   # 0x146735848
1454aff19:     	testb	$0x1, (%rax)
1454aff1c:     	movl	%r12d, 0x340(%rbp)
1454aff23:     	jne	0x1454aff59 <.text+0x54aef59>
1454aff25:     	jmp	0x1454b021b <.text+0x54af21b>
1454aff2a:     	xorl	%r12d, %r12d
1454aff2d:     	movzbl	0x29c(%r13), %eax
1454aff35:     	addb	$-0x2, %al
1454aff37:     	cmpb	$0x9, %al
1454aff39:     	ja	0x1454aff12 <.text+0x54aef12>
1454aff3b:     	movzbl	%al, %eax
1454aff3e:     	leaq	0x154857b(%rip), %rcx   # 0x1469f84c0
1454aff45:     	movq	(%rcx,%rax,8), %rax
1454aff49:     	testb	$0x1, (%rax)
1454aff4c:     	movl	%r12d, 0x340(%rbp)
1454aff53:     	je	0x1454b021b <.text+0x54af21b>
1454aff59:     	movq	0x6e8(%r13), %r8
1454aff60:     	testq	%r8, %r8
1454aff63:     	je	0x1454aff7e <.text+0x54aef7e>
1454aff65:     	movq	0x6e0(%r13), %rcx
1454aff6c:     	cmpq	$0x1, %r8
1454aff70:     	jne	0x1454aff88 <.text+0x54aef88>
1454aff72:     	movss	0x4633d2(%rip), %xmm7   # 0x14591334c
1454aff7a:     	xorl	%edx, %edx
1454aff7c:     	jmp	0x1454affdb <.text+0x54aefdb>
1454aff7e:     	movss	0x45750a(%rip), %xmm7   # 0x145907490
1454aff86:     	jmp	0x1454affef <.text+0x54aefef>
1454aff88:     	movq	%r8, %r9
1454aff8b:     	andq	$-0x2, %r9
1454aff8f:     	movss	0x4633b5(%rip), %xmm7   # 0x14591334c
1454aff97:     	xorl	%edx, %edx
1454aff99:     	jmp	0x1454affa9 <.text+0x54aefa9>
1454aff9b:     	nopl	(%rax,%rax)
1454affa0:     	addq	$0x2, %rdx
1454affa4:     	cmpq	%rdx, %r9
1454affa7:     	je	0x1454affd5 <.text+0x54aefd5>
1454affa9:     	cmpb	$0x10, (%rcx,%rdx,8)
1454affad:     	je	0x1454affc0 <.text+0x54aefc0>
1454affaf:     	cmpb	$0x10, 0x8(%rcx,%rdx,8)
1454affb4:     	jne	0x1454affa0 <.text+0x54aefa0>
1454affb6:     	jmp	0x1454affcd <.text+0x54aefcd>
1454affb8:     	nopl	(%rax,%rax)
1454affc0:     	addss	0x4(%rcx,%rdx,8), %xmm7
1454affc6:     	cmpb	$0x10, 0x8(%rcx,%rdx,8)
1454affcb:     	jne	0x1454affa0 <.text+0x54aefa0>
1454affcd:     	addss	0xc(%rcx,%rdx,8), %xmm7
1454affd3:     	jmp	0x1454affa0 <.text+0x54aefa0>
1454affd5:     	testb	$0x1, %r8b
1454affd9:     	je	0x1454affe7 <.text+0x54aefe7>
1454affdb:     	cmpb	$0x10, (%rcx,%rdx,8)
1454affdf:     	jne	0x1454affe7 <.text+0x54aefe7>
1454affe1:     	addss	0x4(%rcx,%rdx,8), %xmm7
1454affe7:     	addss	0x4574a1(%rip), %xmm7   # 0x145907490
1454affef:     	movss	0x8(%rax), %xmm8
1454afff5:     	movss	0xc(%rax), %xmm3
1454afffa:     	movss	0x4(%rax), %xmm9
1454b0000:     	movss	0x4bc(%r13), %xmm0
1454b0009:     	subss	%xmm6, %xmm0
1454b000d:     	movss	%xmm0, 0x4bc(%r13)
1454b0016:     	xorps	%xmm1, %xmm1
1454b0019:     	ucomiss	%xmm0, %xmm1
1454b001c:     	jb	0x1454b021b <.text+0x54af21b>
1454b0022:     	movl	0x408(%r13), %eax
1454b0029:     	movl	%eax, 0xb8(%rbp)
1454b002f:     	movq	0x400(%r13), %rax
1454b0036:     	movq	%rax, 0xb0(%rbp)
1454b003d:     	movb	%r12b, 0x377(%rbp)
1454b0044:     	leaq	0x240(%rbp), %rcx
1454b004b:     	leaq	0xb0(%rbp), %r8
1454b0052:     	movq	%r13, %rdx
1454b0055:     	callq	0x1455004d0 <.text+0x54ff4d0>
1454b005a:     	nop
1454b005b:     	movq	0x248(%rbp), %rcx
1454b0062:     	cmpq	$0x0, 0x250(%rbp)
1454b006a:     	je	0x1454b12d1 <.text+0x54b02d1>
1454b0070:     	mulss	0x49b35f(%rip), %xmm9   # 0x14594b3d8
1454b0079:     	mulss	%xmm9, %xmm7
1454b007e:     	movq	0x8a0(%r13), %rdx
1454b0085:     	movq	0x8b8(%r13), %rax
1454b008c:     	leaq	(%rax,%rdx), %r11
1454b0090:     	rolq	$0x17, %r11
1454b0094:     	movq	%rcx, 0x358(%rbp)
1454b009b:     	movq	(%rcx), %rdi
1454b009e:     	addq	%rdx, %r11
1454b00a1:     	movq	0x8a8(%r13), %r8
1454b00a8:     	movq	%r8, %r9
1454b00ab:     	shlq	$0x11, %r9
1454b00af:     	movq	0x8b0(%r13), %r10
1454b00b6:     	xorq	%rdx, %r10
1454b00b9:     	xorq	%r8, %rax
1454b00bc:     	xorq	%r10, %r8
1454b00bf:     	movq	%r8, 0x8a8(%r13)
1454b00c6:     	xorq	%rax, %rdx
1454b00c9:     	movq	%rdx, 0x8a0(%r13)
1454b00d0:     	xorq	%r9, %r10
1454b00d3:     	movq	%r10, 0x8b0(%r13)
1454b00da:     	rolq	$0x2d, %rax
1454b00de:     	shrq	$0x28, %r11
1454b00e2:     	xorps	%xmm9, %xmm9
1454b00e6:     	cvtsi2ss	%r11d, %xmm9
1454b00eb:     	movq	%rax, 0x8b8(%r13)
1454b00f2:     	mulss	0x5582a5(%rip), %xmm9   # 0x145a083a0
1454b00fb:     	movss	0x47c(%r13), %xmm10
1454b0104:     	ucomiss	%xmm9, %xmm10
1454b0108:     	mulss	0x474(%r13), %xmm7
1454b0111:     	jbe	0x1454b011c <.text+0x54af11c>
1454b0113:     	mulss	0x480(%r13), %xmm7
1454b011c:     	movq	0x3e8(%r13), %rdx
1454b0123:     	ucomiss	%xmm9, %xmm10
1454b0127:     	seta	0x20(%rsp)
1454b012c:     	cvttss2si	%xmm7, %rax
1454b0131:     	xorl	%ecx, %ecx
1454b0133:     	xorps	%xmm0, %xmm0
1454b0136:     	ucomiss	%xmm0, %xmm7
1454b0139:     	cmovael	%eax, %ecx
1454b013c:     	ucomiss	0x4573e9(%rip), %xmm7   # 0x14590752c
1454b0143:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
1454b0149:     	cmovbel	%ecx, %r9d
1454b014d:     	leaq	0xb0(%rbp), %rcx
1454b0154:     	movq	%rdi, %r8
1454b0157:     	callq	0x14545c690 <.text+0x545b690>
1454b015c:     	nop
1454b015d:     	movq	0x560(%r13), %rsi
1454b0164:     	cmpq	0x550(%r13), %rsi
1454b016b:     	jne	0x1454b017a <.text+0x54af17a>
1454b016d:     	leaq	0x550(%r13), %rcx
1454b0174:     	callq	0x145774710 <.text+0x5773710>
1454b0179:     	nop
1454b017a:     	movq	0x558(%r13), %rax
1454b0181:     	movq	%rsi, %rcx
1454b0184:     	shlq	$0x5, %rcx
1454b0188:     	movups	0xb0(%rbp), %xmm0
1454b018f:     	movups	0xc0(%rbp), %xmm1
1454b0196:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b019b:     	movups	%xmm0, (%rax,%rcx)
1454b019f:     	incq	%rsi
1454b01a2:     	movq	%rsi, 0x560(%r13)
1454b01a9:     	ucomiss	%xmm9, %xmm10
1454b01ad:     	seta	0x28(%rsp)
1454b01b2:     	movb	$0x1, 0x30(%rsp)
1454b01b7:     	movb	$0x0, 0x20(%rsp)
1454b01bc:     	movq	%r13, %rcx
1454b01bf:     	movq	%rdi, %rdx
1454b01c2:     	movaps	%xmm7, %xmm2
1454b01c5:     	xorl	%r9d, %r9d
1454b01c8:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b01cd:     	nop
1454b01ce:     	mulss	0x497d25(%rip), %xmm8   # 0x145947efc
1454b01d7:     	movss	0x478(%r13), %xmm0
1454b01e0:     	sqrtss	%xmm0, %xmm0
1454b01e4:     	mulss	%xmm8, %xmm0
1454b01e9:     	movl	0x340(%rbp), %r12d
1454b01f0:     	movq	0x358(%rbp), %rcx
1454b01f7:     	movss	%xmm0, 0x4bc(%r13)
1454b0200:     	movq	0x240(%rbp), %rdx
1454b0207:     	testq	%rdx, %rdx
1454b020a:     	je	0x1454b021b <.text+0x54af21b>
1454b020c:     	shlq	$0x3, %rdx
1454b0210:     	movl	$0x8, %r8d
1454b0216:     	callq	0x1400021d0 <.text+0x11d0>
1454b021b:     	movq	0x2b8(%r13), %rsi
1454b0222:     	testq	%rsi, %rsi
1454b0225:     	je	0x1454b0b4b <.text+0x54afb4b>
1454b022b:     	leaq	0x550(%r13), %rax
1454b0232:     	movq	%rax, 0x348(%rbp)
1454b0239:     	leaq	0x400(%r13), %rax
1454b0240:     	movq	%rax, 0x2a8(%rbp)
1454b0247:     	movss	0x4684a0(%rip), %xmm8   # 0x1459186f0
1454b0250:     	movss	0x459387(%rip), %xmm9   # 0x1459095e0
1454b0259:     	xorps	%xmm10, %xmm10
1454b025d:     	movss	0x4656b2(%rip), %xmm11  # 0x145915918
1454b0266:     	movss	0x4572bd(%rip), %xmm12  # 0x14590752c
1454b026f:     	movss	0x558128(%rip), %xmm13  # 0x145a083a0
1454b0278:     	movss	0x46306f(%rip), %xmm14  # 0x1459132f0
1454b0281:     	xorl	%edi, %edi
1454b0283:     	movq	%rsi, 0x338(%rbp)
1454b028a:     	jmp	0x1454b02a6 <.text+0x54af2a6>
1454b028c:     	nopl	(%rax)
1454b0290:     	maxss	%xmm10, %xmm0
1454b0295:     	movss	%xmm0, 0xc(%rax)
1454b029a:     	incq	%rdi
1454b029d:     	cmpq	%rsi, %rdi
1454b02a0:     	je	0x1454b0b4b <.text+0x54afb4b>
1454b02a6:     	movq	0x2b8(%r13), %rdx
1454b02ad:     	cmpq	%rdx, %rdi
1454b02b0:     	jae	0x1454bc818 <.text+0x54bb818>
1454b02b6:     	movq	0x2b0(%r13), %rax
1454b02bd:     	imulq	$0x58, %rdi, %r14
1454b02c1:     	movss	0xc(%rax,%r14), %xmm0
1454b02c8:     	movaps	%xmm0, %xmm1
1454b02cb:     	subss	%xmm6, %xmm1
1454b02cf:     	movss	%xmm1, 0xc(%rax,%r14)
1454b02d6:     	movq	0x2b8(%r13), %rdx
1454b02dd:     	cmpq	%rdx, %rdi
1454b02e0:     	jae	0x1454bc7fc <.text+0x54bb7fc>
1454b02e6:     	movq	0x2b0(%r13), %rcx
1454b02ed:     	movq	(%rcx,%r14), %rax
1454b02f1:     	cmpl	$0xb, 0x68(%rax)
1454b02f5:     	jne	0x1454b0520 <.text+0x54af520>
1454b02fb:     	addq	%r14, %rcx
1454b02fe:     	movss	0x48(%rax), %xmm1
1454b0303:     	mulss	%xmm8, %xmm1
1454b0308:     	mulss	0x14(%rcx), %xmm1
1454b030d:     	mulss	0x3c(%rcx), %xmm1
1454b0312:     	mulss	0x478(%r13), %xmm1
1454b031b:     	maxss	%xmm9, %xmm1
1454b0320:     	ucomiss	%xmm1, %xmm0
1454b0323:     	jbe	0x1454b0520 <.text+0x54af520>
1454b0329:     	movss	0xc(%rcx), %xmm7
1454b032e:     	ucomiss	%xmm7, %xmm1
1454b0331:     	jb	0x1454b0520 <.text+0x54af520>
1454b0337:     	ucomiss	%xmm10, %xmm7
1454b033b:     	jbe	0x1454b0520 <.text+0x54af520>
1454b0341:     	movl	0x40(%rax), %ebx
1454b0344:     	movq	0x3e8(%r13), %rsi
1454b034b:     	callq	0x140002200 <.text+0x1200>
1454b0350:     	movl	$0x20, %ecx
1454b0355:     	movl	$0x1, %edx
1454b035a:     	callq	0x1400021c0 <.text+0x11c0>
1454b035f:     	testq	%rax, %rax
1454b0362:     	je	0x1454bca2a <.text+0x54bba2a>
1454b0368:     	movl	%ebx, (%rax)
1454b036a:     	movq	%rax, 0x358(%rbp)
1454b0371:     	movq	%rsi, 0x4(%rax)
1454b0375:     	movq	0x560(%r13), %r15
1454b037c:     	cmpq	0x550(%r13), %r15
1454b0383:     	jne	0x1454b0392 <.text+0x54af392>
1454b0385:     	movq	0x348(%rbp), %rcx
1454b038c:     	callq	0x145774710 <.text+0x5773710>
1454b0391:     	nop
1454b0392:     	movq	0x558(%r13), %rax
1454b0399:     	movq	%r15, %rcx
1454b039c:     	shlq	$0x5, %rcx
1454b03a0:     	movq	$0x20, (%rax,%rcx)
1454b03a8:     	movq	0x358(%rbp), %rdx
1454b03af:     	movq	%rdx, 0x8(%rax,%rcx)
1454b03b4:     	movq	$0xc, 0x10(%rax,%rcx)
1454b03bd:     	movw	$0x1de, 0x18(%rax,%rcx) # imm = 0x1DE
1454b03c4:     	incq	%r15
1454b03c7:     	mulss	%xmm11, %xmm7
1454b03cc:     	cvttss2si	%xmm7, %rax
1454b03d1:     	ucomiss	%xmm10, %xmm7
1454b03d5:     	movl	$0x0, %ecx
1454b03da:     	cmovbl	%ecx, %eax
1454b03dd:     	ucomiss	%xmm12, %xmm7
1454b03e1:     	movq	%r15, 0x560(%r13)
1454b03e8:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b03ed:     	cmoval	%ecx, %eax
1454b03f0:     	movq	0x3e8(%r13), %rdx
1454b03f7:     	movl	%ebx, 0x240(%rbp)
1454b03fd:     	movl	%eax, 0x244(%rbp)
1454b0403:     	movl	0x340(%rbp), %eax
1454b0409:     	movb	%al, 0x377(%rbp)
1454b040f:     	movl	$0x1, %r9d
1454b0415:     	leaq	0xb0(%rbp), %rcx
1454b041c:     	leaq	0x240(%rbp), %r8
1454b0423:     	callq	0x14545d760 <.text+0x545c760>
1454b0428:     	nop
1454b0429:     	movq	0x560(%r13), %rsi
1454b0430:     	cmpq	0x550(%r13), %rsi
1454b0437:     	jne	0x1454b0446 <.text+0x54af446>
1454b0439:     	movq	0x348(%rbp), %rcx
1454b0440:     	callq	0x145774710 <.text+0x5773710>
1454b0445:     	nop
1454b0446:     	movq	0x558(%r13), %rax
1454b044d:     	movq	%rsi, %rcx
1454b0450:     	shlq	$0x5, %rcx
1454b0454:     	movups	0xb0(%rbp), %xmm0
1454b045b:     	movups	0xc0(%rbp), %xmm1
1454b0462:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b0467:     	movups	%xmm0, (%rax,%rcx)
1454b046b:     	incq	%rsi
1454b046e:     	movq	%rsi, 0x560(%r13)
1454b0475:     	movq	0x3e8(%r13), %rsi
1454b047c:     	callq	0x140002200 <.text+0x1200>
1454b0481:     	movl	$0x20, %ecx
1454b0486:     	movl	$0x1, %edx
1454b048b:     	callq	0x1400021c0 <.text+0x11c0>
1454b0490:     	testq	%rax, %rax
1454b0493:     	je	0x1454bca09 <.text+0x54bba09>
1454b0499:     	movl	%ebx, (%rax)
1454b049b:     	movq	%rax, 0x358(%rbp)
1454b04a2:     	movq	%rsi, 0x4(%rax)
1454b04a6:     	movq	0x560(%r13), %rsi
1454b04ad:     	cmpq	0x550(%r13), %rsi
1454b04b4:     	jne	0x1454b04c3 <.text+0x54af4c3>
1454b04b6:     	movq	0x348(%rbp), %rcx
1454b04bd:     	callq	0x145774710 <.text+0x5773710>
1454b04c2:     	nop
1454b04c3:     	movq	0x558(%r13), %rax
1454b04ca:     	movq	%rsi, %rcx
1454b04cd:     	shlq	$0x5, %rcx
1454b04d1:     	movq	$0x20, (%rax,%rcx)
1454b04d9:     	movq	0x358(%rbp), %rdx
1454b04e0:     	movq	%rdx, 0x8(%rax,%rcx)
1454b04e5:     	movq	$0xc, 0x10(%rax,%rcx)
1454b04ee:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454b04f5:     	incq	%rsi
1454b04f8:     	movq	%rsi, 0x560(%r13)
1454b04ff:     	movq	0x2b8(%r13), %rdx
1454b0506:     	movl	0x340(%rbp), %r12d
1454b050d:     	movq	0x338(%rbp), %rsi
1454b0514:     	nopw	%cs:(%rax,%rax)
1454b0520:     	cmpq	%rdx, %rdi
1454b0523:     	jae	0x1454bc856 <.text+0x54bb856>
1454b0529:     	movq	0x2b0(%r13), %rcx
1454b0530:     	leaq	(%rcx,%r14), %rax
1454b0534:     	movq	(%rcx,%r14), %rdx
1454b0538:     	cmpb	$0xb, 0x75(%rdx)
1454b053c:     	movss	0xc(%rcx,%r14), %xmm0
1454b0543:     	je	0x1454b0290 <.text+0x54af290>
1454b0549:     	ucomiss	%xmm10, %xmm0
1454b054d:     	ja	0x1454b029a <.text+0x54af29a>
1454b0553:     	movl	$0x7f800000, 0xc(%rax)  # imm = 0x7F800000
1454b055a:     	movq	0x2b8(%r13), %rdx
1454b0561:     	cmpq	%rdx, %rdi
1454b0564:     	jae	0x1454bc97c <.text+0x54bb97c>
1454b056a:     	movq	0x2b0(%r13), %rax
1454b0571:     	movq	(%rax,%r14), %rcx
1454b0575:     	movl	0x8(%rax,%r14), %edx
1454b057a:     	movss	0x14(%rax,%r14), %xmm0
1454b0581:     	movl	0x18(%rax,%r14), %r8d
1454b0586:     	movl	0x34(%rax,%r14), %r9d
1454b058b:     	leaq	0xd4(%rbp), %r10
1454b0592:     	movl	%r9d, 0x10(%r10)
1454b0596:     	movups	0x24(%rax,%r14), %xmm1
1454b059c:     	movups	%xmm1, (%r10)
1454b05a0:     	movups	0x38(%rax,%r14), %xmm1
1454b05a6:     	movups	0x44(%rax,%r14), %xmm2
1454b05ac:     	movups	%xmm2, 0x20(%r10)
1454b05b1:     	movups	%xmm1, 0x14(%r10)
1454b05b6:     	movq	%rcx, 0xb0(%rbp)
1454b05bd:     	movl	%edx, 0xb8(%rbp)
1454b05c3:     	movsd	0xc(%rax,%r14), %xmm1
1454b05ca:     	movsd	%xmm1, 0xbc(%rbp)
1454b05d2:     	movss	%xmm0, 0xc4(%rbp)
1454b05da:     	movl	%r8d, 0xc8(%rbp)
1454b05e1:     	movsd	0x1c(%rax,%r14), %xmm0
1454b05e8:     	movsd	%xmm0, 0xcc(%rbp)
1454b05f0:     	movb	%r12b, 0x377(%rbp)
1454b05f7:     	movq	%r13, %rcx
1454b05fa:     	leaq	0xb0(%rbp), %rdx
1454b0601:     	callq	0x1454f9bf0 <.text+0x54f8bf0>
1454b0606:     	movb	%al, 0x358(%rbp)
1454b060c:     	movzbl	0x358(%rbp), %r8d
1454b0614:     	testb	%r8b, %r8b
1454b0617:     	je	0x1454b0968 <.text+0x54af968>
1454b061d:     	movq	0x2b8(%r13), %rdx
1454b0624:     	cmpq	%rdx, %rdi
1454b0627:     	jae	0x1454bca4b <.text+0x54bba4b>
1454b062d:     	cmpl	$0x0, 0x11c(%r13)
1454b0635:     	jne	0x1454b06cf <.text+0x54af6cf>
1454b063b:     	cmpq	$0x0, 0x718(%r13)
1454b0643:     	je	0x1454b06cf <.text+0x54af6cf>
1454b0649:     	movq	0x2b0(%r13), %rax
1454b0650:     	movq	(%rax,%r14), %rax
1454b0654:     	movl	0x40(%rax), %ecx
1454b0657:     	movzbl	0x74(%rax), %eax
1454b065b:     	movq	0x2a8(%rbp), %r9
1454b0662:     	movl	0x8(%r9), %edx
1454b0666:     	leaq	0xd4(%rbp), %r8
1454b066d:     	movl	%edx, -0x10(%r8)
1454b0671:     	movq	(%r9), %rdx
1454b0674:     	movq	%rdx, -0x18(%r8)
1454b0678:     	movb	$0x3, 0xcd(%rbp)
1454b067f:     	movl	%ecx, 0xb8(%rbp)
1454b0685:     	movb	%al, 0xcc(%rbp)
1454b068b:     	movq	$0x0, 0xb0(%rbp)
1454b0696:     	movl	$0x0, 0xc8(%rbp)
1454b06a0:     	movb	$0x0, -0x2(%r8)
1454b06a5:     	movl	$0x0, -0x6(%r8)
1454b06ad:     	movb	%r12b, 0x377(%rbp)
1454b06b4:     	movq	%r13, %rcx
1454b06b7:     	leaq	0xb0(%rbp), %rdx
1454b06be:     	xorl	%r8d, %r8d
1454b06c1:     	callq	0x1454cba10 <.text+0x54caa10>
1454b06c6:     	nop
1454b06c7:     	movzbl	0x358(%rbp), %r8d
1454b06cf:     	movss	0x4a8(%r13), %xmm7
1454b06d8:     	ucomiss	%xmm10, %xmm7
1454b06dc:     	jbe	0x1454b0968 <.text+0x54af968>
1454b06e2:     	movaps	%xmm7, %xmm0
1454b06e5:     	callq	0x145773265 <.text+0x5772265>
1454b06ea:     	cvttss2si	%xmm0, %r15
1454b06ef:     	xorl	%ebx, %ebx
1454b06f1:     	ucomiss	%xmm10, %xmm0
1454b06f5:     	cmovbl	%ebx, %r15d
1454b06f9:     	ucomiss	%xmm12, %xmm0
1454b06fd:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b0702:     	cmoval	%eax, %r15d
1454b0706:     	movq	0x718(%r13), %r8
1454b070d:     	testq	%r8, %r8
1454b0710:     	je	0x1454b072a <.text+0x54af72a>
1454b0712:     	movq	0x710(%r13), %rcx
1454b0719:     	xorl	%eax, %eax
1454b071b:     	cmpq	$0x1, %r8
1454b071f:     	jne	0x1454b0734 <.text+0x54af734>
1454b0721:     	xorl	%edx, %edx
1454b0723:     	xorl	%ebx, %ebx
1454b0725:     	jmp	0x1454b07ad <.text+0x54af7ad>
1454b072a:     	movl	$0x1, %eax
1454b072f:     	jmp	0x1454b07c5 <.text+0x54af7c5>
1454b0734:     	movq	%r8, %r9
1454b0737:     	andq	$-0x2, %r9
1454b073b:     	leaq	0x44(%rcx), %r10
1454b073f:     	xorl	%edx, %edx
1454b0741:     	xorl	%ebx, %ebx
1454b0743:     	jmp	0x1454b0762 <.text+0x54af762>
1454b0745:     	nopw	%cs:(%rax,%rax)
1454b0750:     	addl	%r11d, %ebx
1454b0753:     	addl	%esi, %ebx
1454b0755:     	addq	$0x2, %rdx
1454b0759:     	subq	$-0x80, %r10
1454b075d:     	cmpq	%rdx, %r9
1454b0760:     	je	0x1454b0784 <.text+0x54af784>
1454b0762:     	cmpb	$0x18, -0x44(%r10)
1454b0767:     	movl	$0x0, %r11d
1454b076d:     	jne	0x1454b0773 <.text+0x54af773>
1454b076f:     	movl	-0x40(%r10), %r11d
1454b0773:     	cmpb	$0x18, -0x4(%r10)
1454b0778:     	movl	$0x0, %esi
1454b077d:     	jne	0x1454b0750 <.text+0x54af750>
1454b077f:     	movl	(%r10), %esi
1454b0782:     	jmp	0x1454b0750 <.text+0x54af750>
1454b0784:     	testb	$0x1, %r8b
1454b0788:     	movq	0x338(%rbp), %rsi
1454b078f:     	jne	0x1454b07ad <.text+0x54af7ad>
1454b0791:     	movl	%ebx, %eax
1454b0793:     	incl	%eax
1454b0795:     	jne	0x1454b07c5 <.text+0x54af7c5>
1454b0797:     	movb	$0x1, 0x804(%r13)
1454b079f:     	testl	%r15d, %r15d
1454b07a2:     	jne	0x1454b0899 <.text+0x54af899>
1454b07a8:     	jmp	0x1454b0958 <.text+0x54af958>
1454b07ad:     	shlq	$0x6, %rdx
1454b07b1:     	cmpb	$0x18, (%rcx,%rdx)
1454b07b5:     	jne	0x1454b07bb <.text+0x54af7bb>
1454b07b7:     	movl	0x4(%rcx,%rdx), %eax
1454b07bb:     	addl	%ebx, %eax
1454b07bd:     	movl	%eax, %ebx
1454b07bf:     	movl	%ebx, %eax
1454b07c1:     	incl	%eax
1454b07c3:     	je	0x1454b0797 <.text+0x54af797>
1454b07c5:     	movl	%eax, 0x318(%rbp)
1454b07cb:     	movq	%r13, %rsi
1454b07ce:     	movq	0x8a0(%r13), %r13
1454b07d5:     	movq	0x8a8(%rsi), %r12
1454b07dc:     	movaps	%xmm7, %xmm0
1454b07df:     	callq	0x145773241 <.text+0x5772241>
1454b07e4:     	movl	0x318(%rbp), %r9d
1454b07eb:     	subss	%xmm0, %xmm7
1454b07ef:     	movq	0x8b8(%rsi), %rcx
1454b07f6:     	movq	0x8b0(%rsi), %rax
1454b07fd:     	addl	%r15d, %r9d
1454b0800:     	incl	%ebx
1454b0802:     	nopw	%cs:(%rax,%rax)
1454b0810:     	leaq	(%rcx,%r13), %rdx
1454b0814:     	rolq	$0x17, %rdx
1454b0818:     	addq	%r13, %rdx
1454b081b:     	movq	%r12, %r8
1454b081e:     	shlq	$0x11, %r8
1454b0822:     	xorq	%r13, %rax
1454b0825:     	xorq	%r12, %rcx
1454b0828:     	xorq	%rax, %r12
1454b082b:     	xorq	%rcx, %r13
1454b082e:     	rolq	$0x2d, %rcx
1454b0832:     	shrq	$0x28, %rdx
1454b0836:     	xorps	%xmm0, %xmm0
1454b0839:     	cvtsi2ss	%edx, %xmm0
1454b083d:     	xorq	%r8, %rax
1454b0840:     	mulss	%xmm13, %xmm0
1454b0845:     	ucomiss	%xmm7, %xmm0
1454b0848:     	jae	0x1454b0854 <.text+0x54af854>
1454b084a:     	incl	%r15d
1454b084d:     	decl	%ebx
1454b084f:     	jne	0x1454b0810 <.text+0x54af810>
1454b0851:     	movl	%r9d, %r15d
1454b0854:     	movq	0x368(%rbp), %rdx
1454b085b:     	movq	%rcx, 0x8b8(%rdx)
1454b0862:     	movq	%r12, 0x8a8(%rdx)
1454b0869:     	movq	%rax, 0x8b0(%rdx)
1454b0870:     	movq	%r13, 0x8a0(%rdx)
1454b0877:     	movq	%rdx, %r13
1454b087a:     	movl	0x340(%rbp), %r12d
1454b0881:     	movq	0x338(%rbp), %rsi
1454b0888:     	movb	$0x1, 0x804(%r13)
1454b0890:     	testl	%r15d, %r15d
1454b0893:     	je	0x1454b0958 <.text+0x54af958>
1454b0899:     	xorl	%ebx, %ebx
1454b089b:     	nopl	(%rax,%rax)
1454b08a0:     	movq	0x2b8(%r13), %rdx
1454b08a7:     	cmpq	%rdx, %rdi
1454b08aa:     	jae	0x1454bc7e0 <.text+0x54bb7e0>
1454b08b0:     	movq	0x2b0(%r13), %rax
1454b08b7:     	movq	(%rax,%r14), %rcx
1454b08bb:     	movl	0x8(%rax,%r14), %edx
1454b08c0:     	movss	0x14(%rax,%r14), %xmm0
1454b08c7:     	movl	0x18(%rax,%r14), %r8d
1454b08cc:     	movl	0x34(%rax,%r14), %r9d
1454b08d1:     	leaq	0xd4(%rbp), %r10
1454b08d8:     	movl	%r9d, 0x10(%r10)
1454b08dc:     	movups	0x24(%rax,%r14), %xmm1
1454b08e2:     	movups	%xmm1, (%r10)
1454b08e6:     	movups	0x38(%rax,%r14), %xmm1
1454b08ec:     	movups	0x44(%rax,%r14), %xmm2
1454b08f2:     	movups	%xmm2, 0x20(%r10)
1454b08f7:     	movups	%xmm1, 0x14(%r10)
1454b08fc:     	movq	%rcx, 0xb0(%rbp)
1454b0903:     	movl	%edx, 0xb8(%rbp)
1454b0909:     	movsd	0xc(%rax,%r14), %xmm1
1454b0910:     	movsd	%xmm1, 0xbc(%rbp)
1454b0918:     	movss	%xmm0, 0xc4(%rbp)
1454b0920:     	movl	%r8d, 0xc8(%rbp)
1454b0927:     	movsd	0x1c(%rax,%r14), %xmm0
1454b092e:     	movsd	%xmm0, 0xcc(%rbp)
1454b0936:     	movb	%r12b, 0x377(%rbp)
1454b093d:     	movq	%r13, %rcx
1454b0940:     	leaq	0xb0(%rbp), %rdx
1454b0947:     	callq	0x1454f9bf0 <.text+0x54f8bf0>
1454b094c:     	nop
1454b094d:     	incl	%ebx
1454b094f:     	cmpl	%r15d, %ebx
1454b0952:     	jne	0x1454b08a0 <.text+0x54af8a0>
1454b0958:     	movb	$0x0, 0x804(%r13)
1454b0960:     	movzbl	0x358(%rbp), %r8d
1454b0968:     	movq	0x2b8(%r13), %rdx
1454b096f:     	cmpq	%rdx, %rdi
1454b0972:     	jae	0x1454bc960 <.text+0x54bb960>
1454b0978:     	movq	0x2b0(%r13), %rcx
1454b097f:     	movq	(%rcx,%r14), %rax
1454b0983:     	movss	0x48(%rax), %xmm0
1454b0988:     	mulss	%xmm8, %xmm0
1454b098d:     	mulss	0x14(%rcx,%r14), %xmm0
1454b0994:     	mulss	0x3c(%rcx,%r14), %xmm0
1454b099b:     	mulss	0x478(%r13), %xmm0
1454b09a4:     	addq	%r14, %rcx
1454b09a7:     	maxss	%xmm9, %xmm0
1454b09ac:     	cmpl	$0xb, 0x68(%rax)
1454b09b0:     	jne	0x1454b09cf <.text+0x54af9cf>
1454b09b2:     	movss	0x58(%rax), %xmm1
1454b09b7:     	mulss	%xmm8, %xmm1
1454b09bc:     	mulss	0x20(%rcx), %xmm1
1454b09c1:     	mulss	0x48(%rcx), %xmm1
1454b09c6:     	maxss	%xmm14, %xmm1
1454b09cb:     	addss	%xmm1, %xmm0
1454b09cf:     	testb	%r8b, %r8b
1454b09d2:     	je	0x1454b0b3f <.text+0x54afb3f>
1454b09d8:     	movss	0xc(%rcx), %xmm1
1454b09dd:     	movaps	%xmm1, %xmm2
1454b09e0:     	minss	%xmm0, %xmm2
1454b09e4:     	movaps	%xmm2, %xmm0
1454b09e7:     	cmpunordss	%xmm2, %xmm0
1454b09ec:     	movaps	%xmm0, %xmm3
1454b09ef:     	andnps	%xmm2, %xmm3
1454b09f2:     	andps	%xmm1, %xmm0
1454b09f5:     	orps	%xmm3, %xmm0
1454b09f8:     	movss	%xmm0, 0xc(%rcx)
1454b09fd:     	mulss	%xmm11, %xmm0
1454b0a02:     	cvttss2si	%xmm0, %rcx
1454b0a07:     	ucomiss	%xmm10, %xmm0
1454b0a0b:     	movl	$0x0, %edx
1454b0a10:     	cmovbl	%edx, %ecx
1454b0a13:     	ucomiss	%xmm12, %xmm0
1454b0a17:     	movl	0x40(%rax), %ebx
1454b0a1a:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b0a1f:     	cmoval	%eax, %ecx
1454b0a22:     	movq	0x3e8(%r13), %rdx
1454b0a29:     	movl	%ebx, 0x240(%rbp)
1454b0a2f:     	movl	%ecx, 0x244(%rbp)
1454b0a35:     	movb	%r12b, 0x377(%rbp)
1454b0a3c:     	movl	$0x1, %r9d
1454b0a42:     	leaq	0xb0(%rbp), %rcx
1454b0a49:     	leaq	0x240(%rbp), %r8
1454b0a50:     	callq	0x14545d760 <.text+0x545c760>
1454b0a55:     	nop
1454b0a56:     	movq	0x560(%r13), %rsi
1454b0a5d:     	cmpq	0x550(%r13), %rsi
1454b0a64:     	jne	0x1454b0a73 <.text+0x54afa73>
1454b0a66:     	movq	0x348(%rbp), %rcx
1454b0a6d:     	callq	0x145774710 <.text+0x5773710>
1454b0a72:     	nop
1454b0a73:     	movq	0x558(%r13), %rax
1454b0a7a:     	movq	%rsi, %rcx
1454b0a7d:     	shlq	$0x5, %rcx
1454b0a81:     	movups	0xb0(%rbp), %xmm0
1454b0a88:     	movups	0xc0(%rbp), %xmm1
1454b0a8f:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b0a94:     	movups	%xmm0, (%rax,%rcx)
1454b0a98:     	incq	%rsi
1454b0a9b:     	movq	%rsi, 0x560(%r13)
1454b0aa2:     	movq	0x3e8(%r13), %rsi
1454b0aa9:     	callq	0x140002200 <.text+0x1200>
1454b0aae:     	movl	$0x20, %ecx
1454b0ab3:     	movl	$0x1, %edx
1454b0ab8:     	callq	0x1400021c0 <.text+0x11c0>
1454b0abd:     	testq	%rax, %rax
1454b0ac0:     	je	0x1454bc9e8 <.text+0x54bb9e8>
1454b0ac6:     	movl	%ebx, (%rax)
1454b0ac8:     	movq	%rax, 0x358(%rbp)
1454b0acf:     	movq	%rsi, 0x4(%rax)
1454b0ad3:     	movq	0x560(%r13), %rsi
1454b0ada:     	cmpq	0x550(%r13), %rsi
1454b0ae1:     	jne	0x1454b0af0 <.text+0x54afaf0>
1454b0ae3:     	movq	0x348(%rbp), %rcx
1454b0aea:     	callq	0x145774710 <.text+0x5773710>
1454b0aef:     	nop
1454b0af0:     	movq	0x558(%r13), %rax
1454b0af7:     	movq	%rsi, %rcx
1454b0afa:     	shlq	$0x5, %rcx
1454b0afe:     	movq	$0x20, (%rax,%rcx)
1454b0b06:     	movq	0x358(%rbp), %rdx
1454b0b0d:     	movq	%rdx, 0x8(%rax,%rcx)
1454b0b12:     	movq	$0xc, 0x10(%rax,%rcx)
1454b0b1b:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454b0b22:     	incq	%rsi
1454b0b25:     	movq	%rsi, 0x560(%r13)
1454b0b2c:     	movl	0x340(%rbp), %r12d
1454b0b33:     	movq	0x338(%rbp), %rsi
1454b0b3a:     	jmp	0x1454b029a <.text+0x54af29a>
1454b0b3f:     	movl	$0x3e4ccccd, 0xc(%rcx)  # imm = 0x3E4CCCCD
1454b0b46:     	jmp	0x1454b029a <.text+0x54af29a>
1454b0b4b:     	movss	0x39c(%r13), %xmm0
1454b0b54:     	subss	%xmm6, %xmm0
1454b0b58:     	movss	%xmm0, 0x39c(%r13)
1454b0b61:     	xorps	%xmm1, %xmm1
1454b0b64:     	ucomiss	%xmm0, %xmm1
1454b0b67:     	jb	0x1454b0d93 <.text+0x54afd93>
1454b0b6d:     	movq	0x390(%r13), %rax
1454b0b74:     	movl	0x398(%r13), %ecx
1454b0b7b:     	movl	0x3a8(%r13), %edx
1454b0b82:     	movl	0x3c4(%r13), %r8d
1454b0b89:     	movl	%r8d, 0xe4(%rbp)
1454b0b90:     	movups	0x3b4(%r13), %xmm1
1454b0b98:     	movups	%xmm1, 0xd4(%rbp)
1454b0b9f:     	movups	0x3c8(%r13), %xmm1
1454b0ba7:     	movups	0x3d4(%r13), %xmm2
1454b0baf:     	movups	%xmm2, 0xf4(%rbp)
1454b0bb6:     	movups	%xmm1, 0xe8(%rbp)
1454b0bbd:     	movq	%rax, 0xb0(%rbp)
1454b0bc4:     	movl	%ecx, 0xb8(%rbp)
1454b0bca:     	movss	%xmm0, 0xbc(%rbp)
1454b0bd2:     	movsd	0x3a0(%r13), %xmm0
1454b0bdb:     	movsd	%xmm0, 0xc0(%rbp)
1454b0be3:     	movl	%edx, 0xc8(%rbp)
1454b0be9:     	movsd	0x3ac(%r13), %xmm0
1454b0bf2:     	movsd	%xmm0, 0xcc(%rbp)
1454b0bfa:     	movb	%r12b, 0x377(%rbp)
1454b0c01:     	leaq	0xb0(%rbp), %rdx
1454b0c08:     	movq	%r13, %rcx
1454b0c0b:     	callq	0x1454f9bf0 <.text+0x54f8bf0>
1454b0c10:     	nop
1454b0c11:     	testb	%al, %al
1454b0c13:     	je	0x1454b12b1 <.text+0x54b02b1>
1454b0c19:     	movq	0x390(%r13), %rax
1454b0c20:     	movss	0x48(%rax), %xmm0
1454b0c25:     	mulss	0x467ac3(%rip), %xmm0   # 0x1459186f0
1454b0c2d:     	mulss	0x3a4(%r13), %xmm0
1454b0c36:     	mulss	0x3cc(%r13), %xmm0
1454b0c3f:     	mulss	0x478(%r13), %xmm0
1454b0c48:     	maxss	0x458990(%rip), %xmm0   # 0x1459095e0
1454b0c50:     	movss	%xmm0, 0x39c(%r13)
1454b0c59:     	mulss	0x464cb7(%rip), %xmm0   # 0x145915918
1454b0c61:     	cvttss2si	%xmm0, %rcx
1454b0c66:     	xorl	%edx, %edx
1454b0c68:     	xorps	%xmm1, %xmm1
1454b0c6b:     	ucomiss	%xmm1, %xmm0
1454b0c6e:     	cmovael	%ecx, %edx
1454b0c71:     	movl	0x40(%rax), %ebx
1454b0c74:     	ucomiss	0x4568b1(%rip), %xmm0   # 0x14590752c
1454b0c7b:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b0c80:     	cmovbel	%edx, %eax
1454b0c83:     	movq	0x3e8(%r13), %rdx
1454b0c8a:     	movl	%ebx, 0x220(%rbp)
1454b0c90:     	movl	%eax, 0x224(%rbp)
1454b0c96:     	movb	%r12b, 0x377(%rbp)
1454b0c9d:     	leaq	0x240(%rbp), %rcx
1454b0ca4:     	leaq	0x220(%rbp), %r8
1454b0cab:     	movl	$0x1, %r9d
1454b0cb1:     	callq	0x14545d760 <.text+0x545c760>
1454b0cb6:     	nop
1454b0cb7:     	leaq	0x550(%r13), %rdi
1454b0cbe:     	movq	0x560(%r13), %rsi
1454b0cc5:     	cmpq	0x550(%r13), %rsi
1454b0ccc:     	jne	0x1454b0cd7 <.text+0x54afcd7>
1454b0cce:     	movq	%rdi, %rcx
1454b0cd1:     	callq	0x145774710 <.text+0x5773710>
1454b0cd6:     	nop
1454b0cd7:     	movq	0x558(%r13), %rax
1454b0cde:     	movq	%rsi, %rcx
1454b0ce1:     	shlq	$0x5, %rcx
1454b0ce5:     	movups	0x240(%rbp), %xmm0
1454b0cec:     	movups	0x250(%rbp), %xmm1
1454b0cf3:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b0cf8:     	movups	%xmm0, (%rax,%rcx)
1454b0cfc:     	incq	%rsi
1454b0cff:     	movq	%rsi, 0x560(%r13)
1454b0d06:     	movq	0x3e8(%r13), %rsi
1454b0d0d:     	callq	0x140002200 <.text+0x1200>
1454b0d12:     	movl	$0x20, %ecx
1454b0d17:     	movl	$0x1, %edx
1454b0d1c:     	callq	0x1400021c0 <.text+0x11c0>
1454b0d21:     	testq	%rax, %rax
1454b0d24:     	je	0x1454bcc46 <.text+0x54bbc46>
1454b0d2a:     	movl	%ebx, (%rax)
1454b0d2c:     	movq	%rax, 0x358(%rbp)
1454b0d33:     	movq	%rsi, 0x4(%rax)
1454b0d37:     	movq	0x560(%r13), %rsi
1454b0d3e:     	cmpq	0x550(%r13), %rsi
1454b0d45:     	jne	0x1454b0d50 <.text+0x54afd50>
1454b0d47:     	movq	%rdi, %rcx
1454b0d4a:     	callq	0x145774710 <.text+0x5773710>
1454b0d4f:     	nop
1454b0d50:     	movq	0x558(%r13), %rax
1454b0d57:     	movq	%rsi, %rcx
1454b0d5a:     	shlq	$0x5, %rcx
1454b0d5e:     	movq	$0x20, (%rax,%rcx)
1454b0d66:     	movq	0x358(%rbp), %rdx
1454b0d6d:     	movq	%rdx, 0x8(%rax,%rcx)
1454b0d72:     	movq	$0xc, 0x10(%rax,%rcx)
1454b0d7b:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454b0d82:     	incq	%rsi
1454b0d85:     	movq	%rsi, 0x560(%r13)
1454b0d8c:     	movl	0x340(%rbp), %r12d
1454b0d93:     	movq	0x2b8(%rbp), %rdx
1454b0d9a:     	testq	%rdx, %rdx
1454b0d9d:     	je	0x1454b0db5 <.text+0x54afdb5>
1454b0d9f:     	movq	0x2c0(%rbp), %rcx
1454b0da6:     	shlq	$0x2, %rdx
1454b0daa:     	movl	$0x4, %r8d
1454b0db0:     	callq	0x1400021d0 <.text+0x11d0>
1454b0db5:     	testb	%r12b, %r12b
1454b0db8:     	je	0x1454b0ddc <.text+0x54afddc>
1454b0dba:     	movq	0x2f0(%rbp), %rdx
1454b0dc1:     	testq	%rdx, %rdx
1454b0dc4:     	je	0x1454b0ddc <.text+0x54afddc>
1454b0dc6:     	movq	0x2f8(%rbp), %rcx
1454b0dcd:     	shlq	$0x3, %rdx
1454b0dd1:     	movl	$0x4, %r8d
1454b0dd7:     	callq	0x1400021d0 <.text+0x11d0>
1454b0ddc:     	leaq	0x470(%r13), %rax
1454b0de3:     	movq	%rax, 0x298(%rbp)
1454b0dea:     	movss	0x934(%r13), %xmm0
1454b0df3:     	movq	0x58(%r13), %rax
1454b0df7:     	movq	0x60(%r13), %rcx
1454b0dfb:     	movq	%rcx, %rdx
1454b0dfe:     	shlq	$0x4, %rdx
1454b0e02:     	movq	%rax, %r8
1454b0e05:     	nopw	%cs:(%rax,%rax)
1454b0e10:     	testq	%rdx, %rdx
1454b0e13:     	je	0x1454b0e66 <.text+0x54afe66>
1454b0e15:     	addq	$-0x10, %rdx
1454b0e19:     	ucomiss	0xc(%r8), %xmm0
1454b0e1e:     	leaq	0x10(%r8), %r8
1454b0e22:     	jb	0x1454b0e10 <.text+0x54afe10>
1454b0e24:     	testq	%rcx, %rcx
1454b0e27:     	je	0x1454b0e5e <.text+0x54afe5e>
1454b0e29:     	leaq	0x1c(%rax), %r9
1454b0e2d:     	movq	%rcx, %rdx
1454b0e30:     	negq	%rdx
1454b0e33:     	xorl	%r8d, %r8d
1454b0e36:     	nopw	%cs:(%rax,%rax)
1454b0e40:     	movss	-0x10(%r9), %xmm1
1454b0e46:     	ucomiss	%xmm0, %xmm1
1454b0e49:     	jbe	0x1454b392f <.text+0x54b292f>
1454b0e4f:     	incq	%r8
1454b0e52:     	addq	$0x10, %r9
1454b0e56:     	movq	%rdx, %r10
1454b0e59:     	addq	%r8, %r10
1454b0e5c:     	jne	0x1454b0e40 <.text+0x54afe40>
1454b0e5e:     	movq	%r13, %rcx
1454b0e61:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454b0e66:     	movq	0xc0(%r13), %rbx
1454b0e6d:     	testq	%rbx, %rbx
1454b0e70:     	je	0x1454b1105 <.text+0x54b0105>
1454b0e76:     	leaq	0x264(%rbp), %r13
1454b0e7d:     	leaq	0xd4(%rbp), %r14
1454b0e84:     	movq	0x368(%rbp), %rax
1454b0e8b:     	addq	$0x400, %rax            # imm = 0x400
1454b0e91:     	movq	%rax, 0x358(%rbp)
1454b0e98:     	xorl	%edi, %edi
1454b0e9a:     	xorps	%xmm7, %xmm7
1454b0e9d:     	movss	0x46784a(%rip), %xmm8   # 0x1459186f0
1454b0ea6:     	movss	0x458731(%rip), %xmm9   # 0x1459095e0
1454b0eaf:     	xorl	%r15d, %r15d
1454b0eb2:     	movq	0x368(%rbp), %rsi
1454b0eb9:     	jmp	0x1454b0ed0 <.text+0x54afed0>
1454b0ebb:     	nopl	(%rax,%rax)
1454b0ec0:     	incq	%rdi
1454b0ec3:     	addq	$0x60, %r15
1454b0ec7:     	cmpq	%rdi, %rbx
1454b0eca:     	je	0x1454b1105 <.text+0x54b0105>
1454b0ed0:     	movq	0xc0(%rsi), %rdx
1454b0ed7:     	cmpq	%rdx, %rdi
1454b0eda:     	jae	0x1454bc845 <.text+0x54bb845>
1454b0ee0:     	movq	0xb8(%rsi), %rax
1454b0ee7:     	movss	0xc(%rax,%r15), %xmm0
1454b0eee:     	subss	%xmm6, %xmm0
1454b0ef2:     	movss	%xmm0, 0xc(%rax,%r15)
1454b0ef9:     	movq	0xc0(%rsi), %rdx
1454b0f00:     	cmpq	%rdx, %rdi
1454b0f03:     	jae	0x1454bc834 <.text+0x54bb834>
1454b0f09:     	movq	0xb8(%rsi), %rax
1454b0f10:     	movss	0xc(%rax,%r15), %xmm11
1454b0f17:     	ucomiss	%xmm7, %xmm11
1454b0f1b:     	ja	0x1454b0ec0 <.text+0x54afec0>
1454b0f1d:     	movq	(%rax,%r15), %r12
1454b0f21:     	movss	0x58(%rax,%r15), %xmm10
1454b0f28:     	leaq	0x240(%rbp), %rcx
1454b0f2f:     	movq	%rsi, %rdx
1454b0f32:     	movq	%r12, %r8
1454b0f35:     	callq	0x1454d08d0 <.text+0x54cf8d0>
1454b0f3a:     	movq	0x240(%rbp), %rax
1454b0f41:     	movl	0x248(%rbp), %ecx
1454b0f47:     	movl	0x258(%rbp), %edx
1454b0f4d:     	movl	0x10(%r13), %r8d
1454b0f51:     	movl	%r8d, 0x10(%r14)
1454b0f55:     	movups	(%r13), %xmm0
1454b0f5a:     	movups	%xmm0, (%r14)
1454b0f5e:     	movl	0x278(%rbp), %r8d
1454b0f65:     	movss	0x27c(%rbp), %xmm0
1454b0f6d:     	movl	0x2c(%r13), %r9d
1454b0f71:     	movl	%r9d, 0x2c(%r14)
1454b0f75:     	movups	0x1c(%r13), %xmm1
1454b0f7a:     	movups	%xmm1, 0x1c(%r14)
1454b0f7f:     	movsd	0x250(%rbp), %xmm1
1454b0f87:     	movss	0x48(%rax), %xmm12
1454b0f8d:     	mulss	%xmm8, %xmm12
1454b0f92:     	mulss	0x254(%rbp), %xmm12
1454b0f9b:     	movsd	0x25c(%rbp), %xmm2
1454b0fa3:     	mulss	%xmm0, %xmm12
1454b0fa8:     	mulss	0x478(%rsi), %xmm12
1454b0fb1:     	movq	%rax, 0xb0(%rbp)
1454b0fb8:     	movl	%ecx, 0xb8(%rbp)
1454b0fbe:     	movss	%xmm11, 0xbc(%rbp)
1454b0fc7:     	movsd	%xmm1, 0xc0(%rbp)
1454b0fcf:     	movl	%edx, 0xc8(%rbp)
1454b0fd5:     	movsd	%xmm2, 0xcc(%rbp)
1454b0fdd:     	movl	%r8d, 0xe8(%rbp)
1454b0fe4:     	movss	%xmm0, 0xec(%rbp)
1454b0fec:     	movq	%rsi, %rcx
1454b0fef:     	leaq	0xb0(%rbp), %rdx
1454b0ff6:     	callq	0x1454f9bf0 <.text+0x54f8bf0>
1454b0ffb:     	xorps	%xmm0, %xmm0
1454b0ffe:     	cmpltss	%xmm10, %xmm0
1454b1004:     	mulss	0x478(%rsi), %xmm10
1454b100d:     	andps	%xmm0, %xmm10
1454b1011:     	andnps	%xmm12, %xmm0
1454b1015:     	orps	%xmm0, %xmm10
1454b1019:     	maxss	%xmm9, %xmm10
1454b101e:     	movq	0xc0(%rsi), %rdx
1454b1025:     	testb	%al, %al
1454b1027:     	je	0x1454b10e0 <.text+0x54b00e0>
1454b102d:     	cmpq	%rdx, %rdi
1454b1030:     	jae	0x1454bc8b8 <.text+0x54bb8b8>
1454b1036:     	movq	0x368(%rbp), %rcx
1454b103d:     	movq	0xb8(%rcx), %rax
1454b1044:     	movss	%xmm10, 0xc(%rax,%r15)
1454b104b:     	cmpl	$0x0, 0x11c(%rcx)
1454b1052:     	jne	0x1454b0ec0 <.text+0x54afec0>
1454b1058:     	cmpq	$0x0, 0x718(%rcx)
1454b1060:     	je	0x1454b0ec0 <.text+0x54afec0>
1454b1066:     	movl	0x40(%r12), %eax
1454b106b:     	movzbl	0x74(%r12), %r8d
1454b1071:     	movq	0x358(%rbp), %r9
1454b1078:     	movl	0x8(%r9), %edx
1454b107c:     	movl	%edx, -0x10(%r14)
1454b1080:     	movq	(%r9), %rdx
1454b1083:     	movq	%rdx, -0x18(%r14)
1454b1087:     	movb	$0x3, 0xcd(%rbp)
1454b108e:     	movl	%eax, 0xb8(%rbp)
1454b1094:     	movb	%r8b, 0xcc(%rbp)
1454b109b:     	movq	$0x0, 0xb0(%rbp)
1454b10a6:     	movl	$0x0, 0xc8(%rbp)
1454b10b0:     	movb	$0x0, -0x2(%r14)
1454b10b5:     	movl	$0x0, -0x6(%r14)
1454b10bd:     	leaq	0xb0(%rbp), %rdx
1454b10c4:     	xorl	%r8d, %r8d
1454b10c7:     	callq	0x1454cba10 <.text+0x54caa10>
1454b10cc:     	jmp	0x1454b0ec0 <.text+0x54afec0>
1454b10d1:     	nopw	%cs:(%rax,%rax)
1454b10e0:     	cmpq	%rdx, %rdi
1454b10e3:     	jae	0x1454bc8b8 <.text+0x54bb8b8>
1454b10e9:     	movq	0x368(%rbp), %rax
1454b10f0:     	movq	0xb8(%rax), %rax
1454b10f7:     	movl	$0x3e99999a, 0xc(%rax,%r15) # imm = 0x3E99999A
1454b1100:     	jmp	0x1454b0ec0 <.text+0x54afec0>
1454b1105:     	movq	0x368(%rbp), %r13
1454b110c:     	movq	0x718(%r13), %rdx
1454b1113:     	testq	%rdx, %rdx
1454b1116:     	je	0x1454b13bb <.text+0x54b03bb>
1454b111c:     	movss	0x934(%r13), %xmm0
1454b1125:     	movq	0x710(%r13), %rax
1454b112c:     	shlq	$0x6, %rdx
1454b1130:     	xorl	%ecx, %ecx
1454b1132:     	xorl	%ebx, %ebx
1454b1134:     	nopw	%cs:(%rax,%rax)
1454b1140:     	cmpb	$0x15, (%rax,%rcx)
1454b1144:     	je	0x1454b1157 <.text+0x54b0157>
1454b1146:     	incq	%rbx
1454b1149:     	addq	$0x40, %rcx
1454b114d:     	cmpq	%rcx, %rdx
1454b1150:     	jne	0x1454b1140 <.text+0x54b0140>
1454b1152:     	jmp	0x1454b13bb <.text+0x54b03bb>
1454b1157:     	movss	0x124(%r13), %xmm1
1454b1160:     	ucomiss	%xmm0, %xmm1
1454b1163:     	ja	0x1454b13bb <.text+0x54b03bb>
1454b1169:     	movss	0x120(%r13), %xmm8
1454b1172:     	movss	0x456316(%rip), %xmm1   # 0x145907490
1454b117a:     	ucomiss	%xmm8, %xmm1
1454b117e:     	ja	0x1454b13bb <.text+0x54b03bb>
1454b1184:     	movss	0x4(%rax,%rcx), %xmm7
1454b118a:     	movl	0xc(%rax,%rcx), %edi
1454b118e:     	movss	0x8(%rax,%rcx), %xmm3
1454b1194:     	addss	0x4562f4(%rip), %xmm0   # 0x145907490
1454b119c:     	movss	%xmm0, 0x124(%r13)
1454b11a5:     	movl	$0x0, 0x120(%r13)
1454b11b0:     	movl	0x408(%r13), %eax
1454b11b7:     	movl	%eax, 0xb8(%rbp)
1454b11bd:     	movq	0x400(%r13), %rax
1454b11c4:     	movq	%rax, 0xb0(%rbp)
1454b11cb:     	movq	$0x0, 0x28(%rsp)
1454b11d4:     	movq	$0x8, 0x20(%rsp)
1454b11dd:     	leaq	0x240(%rbp), %rcx
1454b11e4:     	leaq	0xb0(%rbp), %r8
1454b11eb:     	movq	%r13, %rdx
1454b11ee:     	callq	0x145500300 <.text+0x54ff300>
1454b11f3:     	testl	%edi, %edi
1454b11f5:     	je	0x1454b12f7 <.text+0x54b02f7>
1454b11fb:     	movq	0x3e8(%r13), %rdx
1454b1202:     	movq	0x248(%rbp), %r9
1454b1209:     	movq	0x250(%rbp), %r14
1454b1210:     	movl	$0x2, 0x2b8(%rbp)
1454b121a:     	movl	$0x0, 0x2f0(%rbp)
1454b1224:     	movq	%r9, 0x20(%rbp)
1454b1228:     	movb	$0x1, 0x327(%rbp)
1454b122f:     	leaq	0x2f0(%rbp), %rax
1454b1236:     	movq	%rax, 0x30(%rsp)
1454b123b:     	leaq	0x2b8(%rbp), %rax
1454b1242:     	movq	%rax, 0x28(%rsp)
1454b1247:     	movq	%r14, 0x20(%rsp)
1454b124c:     	leaq	0xb0(%rbp), %rcx
1454b1253:     	movl	%edi, %r8d
1454b1256:     	movq	%r9, 0x358(%rbp)
1454b125d:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b1262:     	nop
1454b1263:     	movq	0x560(%r13), %rsi
1454b126a:     	cmpq	0x550(%r13), %rsi
1454b1271:     	jne	0x1454b1280 <.text+0x54b0280>
1454b1273:     	leaq	0x550(%r13), %rcx
1454b127a:     	callq	0x145774710 <.text+0x5773710>
1454b127f:     	nop
1454b1280:     	movq	0x558(%r13), %rax
1454b1287:     	movq	%rsi, %rcx
1454b128a:     	shlq	$0x5, %rcx
1454b128e:     	movups	0xb0(%rbp), %xmm0
1454b1295:     	movups	0xc0(%rbp), %xmm1
1454b129c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b12a1:     	movups	%xmm0, (%rax,%rcx)
1454b12a5:     	incq	%rsi
1454b12a8:     	movq	%rsi, 0x560(%r13)
1454b12af:     	jmp	0x1454b130c <.text+0x54b030c>
1454b12b1:     	movl	$0x3f000000, 0x39c(%r13) # imm = 0x3F000000
1454b12bc:     	movq	0x2b8(%rbp), %rdx
1454b12c3:     	testq	%rdx, %rdx
1454b12c6:     	jne	0x1454b0d9f <.text+0x54afd9f>
1454b12cc:     	jmp	0x1454b0db5 <.text+0x54afdb5>
1454b12d1:     	movss	0x45625f(%rip), %xmm0   # 0x145907538
1454b12d9:     	movss	%xmm0, 0x4bc(%r13)
1454b12e2:     	movq	0x240(%rbp), %rdx
1454b12e9:     	testq	%rdx, %rdx
1454b12ec:     	jne	0x1454b020c <.text+0x54af20c>
1454b12f2:     	jmp	0x1454b021b <.text+0x54af21b>
1454b12f7:     	movq	0x248(%rbp), %rax
1454b12fe:     	movq	%rax, 0x358(%rbp)
1454b1305:     	movq	0x250(%rbp), %r14
1454b130c:     	movups	0x20(%r13), %xmm9
1454b1311:     	movq	$0x1, 0x20(%r13)
1454b1319:     	movq	%rbx, 0x28(%r13)
1454b131d:     	movq	0x240(%rbp), %rax
1454b1324:     	movq	%rax, 0x340(%rbp)
1454b132b:     	testq	%r14, %r14
1454b132e:     	je	0x1454b1394 <.text+0x54b0394>
1454b1330:     	shlq	$0x3, %r14
1454b1334:     	mulss	%xmm8, %xmm7
1454b1339:     	movzbl	0x129(%r13), %ebx
1454b1341:     	xorl	%edi, %edi
1454b1343:     	nopw	%cs:(%rax,%rax)
1454b1350:     	movq	0x358(%rbp), %rax
1454b1357:     	movq	(%rax,%rdi), %rdx
1454b135b:     	movb	$0x3, 0x129(%r13)
1454b1363:     	movb	$0x0, 0x30(%rsp)
1454b1368:     	movb	$0x0, 0x28(%rsp)
1454b136d:     	movb	$0x3, 0x20(%rsp)
1454b1372:     	movq	%r13, %rcx
1454b1375:     	movaps	%xmm7, %xmm2
1454b1378:     	movl	$0x2e4, %r9d            # imm = 0x2E4
1454b137e:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b1383:     	nop
1454b1384:     	movb	%bl, 0x129(%r13)
1454b138b:     	addq	$0x8, %rdi
1454b138f:     	cmpq	%rdi, %r14
1454b1392:     	jne	0x1454b1350 <.text+0x54b0350>
1454b1394:     	movq	0x340(%rbp), %rdx
1454b139b:     	testq	%rdx, %rdx
1454b139e:     	je	0x1454b13b6 <.text+0x54b03b6>
1454b13a0:     	shlq	$0x3, %rdx
1454b13a4:     	movl	$0x8, %r8d
1454b13aa:     	movq	0x358(%rbp), %rcx
1454b13b1:     	callq	0x1400021d0 <.text+0x11d0>
1454b13b6:     	movups	%xmm9, 0x20(%r13)
1454b13bb:     	cmpb	$0x1, 0x9b9(%r13)
1454b13c3:     	jne	0x1454b2757 <.text+0x54b1757>
1454b13c9:     	movss	0x934(%r13), %xmm0
1454b13d2:     	movss	%xmm0, 0x98(%rbp)
1454b13da:     	movq	0xd0(%r13), %rax
1454b13e1:     	movq	0xd8(%r13), %rcx
1454b13e8:     	leaq	(%rcx,%rcx,2), %rcx
1454b13ec:     	shlq	$0x5, %rcx
1454b13f0:     	addq	%rax, %rcx
1454b13f3:     	movq	%rax, 0xb0(%rbp)
1454b13fa:     	movq	%rcx, 0xb8(%rbp)
1454b1401:     	leaq	0x98(%rbp), %rax
1454b1408:     	movq	%rax, 0xc0(%rbp)
1454b140f:     	leaq	0x240(%rbp), %rcx
1454b1416:     	leaq	0xb0(%rbp), %rdx
1454b141d:     	callq	0x145540a80 <.text+0x553fa80>
1454b1422:     	movq	0x250(%rbp), %rbx
1454b1429:     	testq	%rbx, %rbx
1454b142c:     	je	0x1454b154c <.text+0x54b054c>
1454b1432:     	leaq	0xc8(%r13), %rcx
1454b1439:     	movb	$0x1, 0x367(%rbp)
1454b1440:     	leaq	0x240(%rbp), %rdx
1454b1447:     	callq	0x145531c10 <.text+0x5530c10>
1454b144c:     	nop
1454b144d:     	movq	0x240(%rbp), %rax
1454b1454:     	movq	%rax, 0x348(%rbp)
1454b145b:     	movq	0x248(%rbp), %rax
1454b1462:     	movq	%rax, 0x340(%rbp)
1454b1469:     	shlq	$0x3, %rbx
1454b146d:     	movq	0x368(%rbp), %r13
1454b1474:     	leaq	0x550(%r13), %rdi
1454b147b:     	xorl	%r14d, %r14d
1454b147e:     	jmp	0x1454b14c5 <.text+0x54b04c5>
1454b1480:     	movq	0x558(%r13), %rax
1454b1487:     	movq	%rsi, %rcx
1454b148a:     	shlq	$0x5, %rcx
1454b148e:     	movq	$0x20, (%rax,%rcx)
1454b1496:     	movq	0x358(%rbp), %rdx
1454b149d:     	movq	%rdx, 0x8(%rax,%rcx)
1454b14a2:     	movq	$0x8, 0x10(%rax,%rcx)
1454b14ab:     	movw	$0xaa, 0x18(%rax,%rcx)
1454b14b2:     	incq	%rsi
1454b14b5:     	movq	%rsi, 0x560(%r13)
1454b14bc:     	addq	$0x8, %r14
1454b14c0:     	cmpq	%r14, %rbx
1454b14c3:     	je	0x1454b151e <.text+0x54b051e>
1454b14c5:     	movq	0x340(%rbp), %rax
1454b14cc:     	movq	(%rax,%r14), %rsi
1454b14d0:     	testq	%rsi, %rsi
1454b14d3:     	je	0x1454b14bc <.text+0x54b04bc>
1454b14d5:     	callq	0x140002200 <.text+0x1200>
1454b14da:     	movl	$0x20, %ecx
1454b14df:     	movl	$0x1, %edx
1454b14e4:     	callq	0x1400021c0 <.text+0x11c0>
1454b14e9:     	testq	%rax, %rax
1454b14ec:     	je	0x1454bc8fe <.text+0x54bb8fe>
1454b14f2:     	movq	%rax, 0x358(%rbp)
1454b14f9:     	movq	%rsi, (%rax)
1454b14fc:     	movq	0x560(%r13), %rsi
1454b1503:     	cmpq	0x550(%r13), %rsi
1454b150a:     	jne	0x1454b1480 <.text+0x54b0480>
1454b1510:     	movq	%rdi, %rcx
1454b1513:     	callq	0x145774710 <.text+0x5773710>
1454b1518:     	nop
1454b1519:     	jmp	0x1454b1480 <.text+0x54b0480>
1454b151e:     	movq	0x348(%rbp), %rdx
1454b1525:     	testq	%rdx, %rdx
1454b1528:     	je	0x1454b1540 <.text+0x54b0540>
1454b152a:     	shlq	$0x3, %rdx
1454b152e:     	movl	$0x8, %r8d
1454b1534:     	movq	0x340(%rbp), %rcx
1454b153b:     	callq	0x1400021d0 <.text+0x11d0>
1454b1540:     	movl	$0x0, 0x348(%rbp)
1454b154a:     	jmp	0x1454b1554 <.text+0x54b0554>
1454b154c:     	movb	$0x1, %al
1454b154e:     	movl	%eax, 0x348(%rbp)
1454b1554:     	movsd	0x400(%r13), %xmm12
1454b155d:     	movss	0x46430f(%rip), %xmm0   # 0x145915874
1454b1565:     	movss	0x484(%r13), %xmm13
1454b156e:     	mulss	%xmm0, %xmm13
1454b1573:     	movq	0xd8(%r13), %rax
1454b157a:     	movq	%rax, 0x340(%rbp)
1454b1581:     	movaps	%xmm13, %xmm1
1454b1585:     	maxss	%xmm0, %xmm1
1454b1589:     	movss	0x154478f(%rip), %xmm0  # 0x1469f5d20
1454b1591:     	mulss	%xmm1, %xmm0
1454b1595:     	movss	%xmm0, 0x318(%rbp)
1454b159d:     	leaq	0x550(%r13), %rax
1454b15a4:     	movq	%rax, 0x328(%rbp)
1454b15ab:     	mulss	0x496949(%rip), %xmm1   # 0x145947efc
1454b15b3:     	movss	%xmm1, 0x2a8(%rbp)
1454b15bb:     	movss	0x57d0f5(%rip), %xmm0   # 0x145a2e6b8
1454b15c3:     	mulss	%xmm13, %xmm0
1454b15c8:     	maxss	0x48e440(%rip), %xmm0   # 0x14593fa10
1454b15d0:     	movss	%xmm0, 0x60(%rbp)
1454b15d5:     	mulss	0x461d1e(%rip), %xmm13  # 0x1459132fc
1454b15de:     	leaq	0x508(%r13), %rax
1454b15e5:     	movq	%rax, 0x238(%rbp)
1454b15ec:     	xorps	%xmm7, %xmm7
1454b15ef:     	movq	$0x0, 0x358(%rbp)
1454b15fa:     	jmp	0x1454b1628 <.text+0x54b0628>
1454b15fc:     	nopl	(%rax)
1454b1600:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b1605:     	movl	0x348(%rbp), %eax
1454b160b:     	movb	%al, 0x367(%rbp)
1454b1611:     	movss	%xmm13, 0x20(%rsp)
1454b1618:     	movq	%rsi, %rcx
1454b161b:     	movq	%r14, %rdx
1454b161e:     	movaps	%xmm9, %xmm2
1454b1622:     	callq	0x1454d0510 <.text+0x54cf510>
1454b1627:     	nop
1454b1628:     	movq	0x358(%rbp), %r14
1454b162f:     	cmpq	0x340(%rbp), %r14
1454b1636:     	jae	0x1454b2725 <.text+0x54b1725>
1454b163c:     	movq	0x368(%rbp), %rax
1454b1643:     	movq	0xd8(%rax), %rdx
1454b164a:     	cmpq	%rdx, %r14
1454b164d:     	jae	0x1454bc897 <.text+0x54bb897>
1454b1653:     	leaq	0x1(%r14), %rcx
1454b1657:     	movq	%rcx, 0x358(%rbp)
1454b165e:     	movq	0xd0(%rax), %rax
1454b1665:     	leaq	(%r14,%r14,2), %rbx
1454b1669:     	shlq	$0x5, %rbx
1454b166d:     	movss	0x54(%rax,%rbx), %xmm1
1454b1673:     	movss	0x98(%rbp), %xmm0
1454b167b:     	ucomiss	%xmm0, %xmm1
1454b167e:     	ja	0x1454b1628 <.text+0x54b0628>
1454b1680:     	addq	%rbx, %rax
1454b1683:     	addss	0x457f55(%rip), %xmm0   # 0x1459095e0
1454b168b:     	movss	%xmm0, 0x54(%rax)
1454b1690:     	movq	0x368(%rbp), %rsi
1454b1697:     	movq	0xd8(%rsi), %rdi
1454b169e:     	cmpq	%rdi, %r14
1454b16a1:     	jae	0x1454bc8da <.text+0x54bb8da>
1454b16a7:     	movq	0xd0(%rsi), %rax
1454b16ae:     	leaq	(%rax,%rbx), %r15
1454b16b2:     	movq	0x18(%rax,%rbx), %r13
1454b16b7:     	movss	0x98(%rbp), %xmm8
1454b16c0:     	movss	0x4c(%rax,%rbx), %xmm0
1454b16c6:     	ucomiss	%xmm0, %xmm7
1454b16c9:     	movss	0x455dbf(%rip), %xmm2   # 0x145907490
1454b16d1:     	jae	0x1454b1740 <.text+0x54b0740>
1454b16d3:     	movaps	%xmm8, %xmm1
1454b16d7:     	subss	0x48(%r15), %xmm1
1454b16dd:     	divss	%xmm0, %xmm1
1454b16e1:     	xorps	%xmm0, %xmm0
1454b16e4:     	maxss	%xmm1, %xmm0
1454b16e8:     	movaps	%xmm2, %xmm1
1454b16eb:     	minss	%xmm0, %xmm1
1454b16ef:     	movsd	0x30(%r15), %xmm0
1454b16f5:     	movsd	0x3c(%r15), %xmm2
1454b16fb:     	subps	%xmm0, %xmm2
1454b16fe:     	movsldup	%xmm1, %xmm14           # xmm14 = xmm1[0,0,2,2]
1454b1703:     	mulps	%xmm2, %xmm14
1454b1707:     	addps	%xmm0, %xmm14
1454b170b:     	movss	0x38(%r15), %xmm0
1454b1711:     	movss	0x44(%r15), %xmm2
1454b1717:     	subss	%xmm0, %xmm2
1454b171b:     	mulss	%xmm1, %xmm2
1454b171f:     	addss	%xmm0, %xmm2
1454b1723:     	movlps	%xmm14, 0x220(%rbp)
1454b172b:     	movss	%xmm2, 0x228(%rbp)
1454b1733:     	jmp	0x1454b175e <.text+0x54b075e>
1454b1735:     	nopw	%cs:(%rax,%rax)
1454b1740:     	movq	0x3c(%r15), %rax
1454b1744:     	movq	%rax, 0x220(%rbp)
1454b174b:     	movl	0x44(%r15), %eax
1454b174f:     	movl	%eax, 0x228(%rbp)
1454b1755:     	movsd	0x220(%rbp), %xmm14
1454b175e:     	movss	0x58(%r15), %xmm10
1454b1764:     	addss	0x40c(%rsi), %xmm10
1454b176d:     	movaps	%xmm10, %xmm0
1454b1771:     	callq	0x145773247 <.text+0x5772247>
1454b1776:     	movaps	%xmm0, %xmm9
1454b177a:     	movaps	%xmm10, %xmm0
1454b177e:     	callq	0x145773235 <.text+0x5772235>
1454b1783:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454b1787:     	mulps	0x1544641(%rip), %xmm9  # 0x1469f5dd0
1454b178f:     	addps	%xmm12, %xmm9
1454b1793:     	movaps	%xmm14, %xmm0
1454b1797:     	subps	%xmm12, %xmm0
1454b179b:     	mulps	%xmm0, %xmm0
1454b179e:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b17a2:     	addss	%xmm0, %xmm1
1454b17a6:     	xorps	%xmm0, %xmm0
1454b17a9:     	sqrtss	%xmm1, %xmm0
1454b17ad:     	ucomiss	0x461b9c(%rip), %xmm0   # 0x145913350
1454b17b4:     	ja	0x1454b1600 <.text+0x54b0600>
1454b17ba:     	cmpl	$0x0, 0x24(%r13)
1454b17bf:     	je	0x1454b1946 <.text+0x54b0946>
1454b17c5:     	subps	%xmm9, %xmm14
1454b17c9:     	mulps	%xmm14, %xmm14
1454b17cd:     	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
1454b17d2:     	addss	%xmm14, %xmm0
1454b17d7:     	sqrtss	%xmm0, %xmm0
1454b17db:     	ucomiss	0x77fd02(%rip), %xmm0   # 0x145c314e4
1454b17e2:     	jbe	0x1454b1821 <.text+0x54b0821>
1454b17e4:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b17e9:     	movl	0x348(%rbp), %eax
1454b17ef:     	movb	%al, 0x367(%rbp)
1454b17f5:     	movss	0x318(%rbp), %xmm0
1454b17fd:     	movss	%xmm0, 0x20(%rsp)
1454b1803:     	movq	%rsi, %rcx
1454b1806:     	movq	%r14, %rdx
1454b1809:     	movaps	%xmm9, %xmm2
1454b180d:     	callq	0x1454d0510 <.text+0x54cf510>
1454b1812:     	nop
1454b1813:     	movq	0x368(%rbp), %rsi
1454b181a:     	movq	0xd8(%rsi), %rdi
1454b1821:     	cmpq	%rdi, %r14
1454b1824:     	jae	0x1454bca67 <.text+0x54bba67>
1454b182a:     	movq	0xd0(%rsi), %rax
1454b1831:     	movss	0x98(%rbp), %xmm0
1454b1839:     	ucomiss	0x50(%rax,%rbx), %xmm0
1454b183e:     	jb	0x1454b1628 <.text+0x54b0628>
1454b1844:     	movl	0x348(%rbp), %eax
1454b184a:     	movb	%al, 0x367(%rbp)
1454b1850:     	leaq	0xb0(%rbp), %rcx
1454b1857:     	movq	0x368(%rbp), %rdx
1454b185e:     	leaq	0x220(%rbp), %r8
1454b1865:     	movss	0x49fa03(%rip), %xmm3   # 0x145951270
1454b186d:     	callq	0x1455004d0 <.text+0x54ff4d0>
1454b1872:     	nop
1454b1873:     	movq	0xb0(%rbp), %r9
1454b187a:     	movq	0xb8(%rbp), %rax
1454b1881:     	movq	%rax, 0x338(%rbp)
1454b1888:     	cmpq	$0x0, 0xc0(%rbp)
1454b1890:     	movq	0x368(%rbp), %r8
1454b1897:     	movss	0x455bf1(%rip), %xmm4   # 0x145907490
1454b189f:     	je	0x1454b26fe <.text+0x54b16fe>
1454b18a5:     	movq	0xd8(%r8), %rdx
1454b18ac:     	cmpq	%rdx, %r14
1454b18af:     	jae	0x1454bcaf1 <.text+0x54bbaf1>
1454b18b5:     	movq	0x338(%rbp), %rax
1454b18bc:     	movq	(%rax), %rdi
1454b18bf:     	movss	0x20(%r13), %xmm0
1454b18c5:     	addss	0x98(%rbp), %xmm0
1454b18cd:     	movq	0xd0(%r8), %rax
1454b18d4:     	movss	%xmm0, 0x50(%rax,%rbx)
1454b18da:     	movq	0xd8(%r8), %rdx
1454b18e1:     	cmpq	%rdx, %r14
1454b18e4:     	jae	0x1454bcb0d <.text+0x54bbb0d>
1454b18ea:     	movq	0xd0(%r8), %rax
1454b18f1:     	leaq	(%rax,%rbx), %rcx
1454b18f5:     	movss	0x934(%r8), %xmm0
1454b18fe:     	movss	0x4c(%rax,%rbx), %xmm1
1454b1904:     	ucomiss	%xmm1, %xmm7
1454b1907:     	jae	0x1454b19f2 <.text+0x54b09f2>
1454b190d:     	movaps	%xmm0, %xmm2
1454b1910:     	subss	0x48(%rcx), %xmm2
1454b1915:     	divss	%xmm1, %xmm2
1454b1919:     	xorps	%xmm1, %xmm1
1454b191c:     	maxss	%xmm2, %xmm1
1454b1920:     	movaps	%xmm4, %xmm2
1454b1923:     	minss	%xmm1, %xmm2
1454b1927:     	movsd	0x30(%rcx), %xmm1
1454b192c:     	movsd	0x3c(%rcx), %xmm3
1454b1931:     	subps	%xmm1, %xmm3
1454b1934:     	movsldup	%xmm2, %xmm9            # xmm9 = xmm2[0,0,2,2]
1454b1939:     	mulps	%xmm3, %xmm9
1454b193d:     	addps	%xmm1, %xmm9
1454b1941:     	jmp	0x1454b19f8 <.text+0x54b09f8>
1454b1946:     	movq	0x28(%r15), %r15
1454b194a:     	movq	0x4e8(%rsi), %rcx
1454b1951:     	testq	%rcx, %rcx
1454b1954:     	je	0x1454b1c37 <.text+0x54b0c37>
1454b195a:     	movq	0x4e0(%rsi), %rax
1454b1961:     	imulq	$0x160, %rcx, %rdx      # imm = 0x160
1454b1968:     	xorl	%ecx, %ecx
1454b196a:     	movss	0x455b1e(%rip), %xmm1   # 0x145907490
1454b1972:     	jmp	0x1454b1990 <.text+0x54b0990>
1454b1974:     	nopw	%cs:(%rax,%rax)
1454b1980:     	addq	$0x160, %rcx            # imm = 0x160
1454b1987:     	cmpq	%rcx, %rdx
1454b198a:     	je	0x1454b1c37 <.text+0x54b0c37>
1454b1990:     	cmpq	%r15, 0x88(%rax,%rcx)
1454b1998:     	jne	0x1454b1980 <.text+0x54b0980>
1454b199a:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454b199f:     	je	0x1454b1980 <.text+0x54b0980>
1454b19a1:     	movss	0x128(%rax,%rcx), %xmm0
1454b19aa:     	ucomiss	%xmm0, %xmm7
1454b19ad:     	jae	0x1454b1bee <.text+0x54b0bee>
1454b19b3:     	subss	0x124(%rax,%rcx), %xmm8
1454b19bd:     	divss	%xmm0, %xmm8
1454b19c2:     	xorps	%xmm0, %xmm0
1454b19c5:     	maxss	%xmm8, %xmm0
1454b19ca:     	minss	%xmm0, %xmm1
1454b19ce:     	movsd	0x10c(%rax,%rcx), %xmm2
1454b19d7:     	movsd	0x118(%rax,%rcx), %xmm3
1454b19e0:     	subps	%xmm2, %xmm3
1454b19e3:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454b19e7:     	mulps	%xmm3, %xmm0
1454b19ea:     	addps	%xmm2, %xmm0
1454b19ed:     	jmp	0x1454b1bf7 <.text+0x54b0bf7>
1454b19f2:     	movsd	0x3c(%rcx), %xmm9
1454b19f8:     	movq	0x18(%rax,%rbx), %r14
1454b19fd:     	movq	0x20(%rax,%rbx), %rdx
1454b1a02:     	movq	0x4e0(%r8), %rax
1454b1a09:     	imulq	$0x160, 0x4e8(%r8), %r10 # imm = 0x160
1454b1a14:     	xorl	%ecx, %ecx
1454b1a16:     	movq	%rax, %r8
1454b1a19:     	nopl	(%rax)
1454b1a20:     	cmpq	%rcx, %r10
1454b1a23:     	je	0x1454b26fe <.text+0x54b16fe>
1454b1a29:     	addq	$0x160, %rcx            # imm = 0x160
1454b1a30:     	cmpq	%rdi, 0x88(%r8)
1454b1a37:     	leaq	0x160(%r8), %r8
1454b1a3e:     	jne	0x1454b1a20 <.text+0x54b0a20>
1454b1a40:     	movss	-0x38(%rax,%rcx), %xmm1
1454b1a46:     	ucomiss	%xmm1, %xmm7
1454b1a49:     	movq	%r9, 0x310(%rbp)
1454b1a50:     	jae	0x1454b1a88 <.text+0x54b0a88>
1454b1a52:     	subss	-0x3c(%rax,%rcx), %xmm0
1454b1a58:     	divss	%xmm1, %xmm0
1454b1a5c:     	xorps	%xmm1, %xmm1
1454b1a5f:     	maxss	%xmm0, %xmm1
1454b1a63:     	movaps	%xmm4, %xmm0
1454b1a66:     	minss	%xmm1, %xmm0
1454b1a6a:     	movsd	-0x54(%rax,%rcx), %xmm1
1454b1a70:     	movsd	-0x48(%rax,%rcx), %xmm2
1454b1a76:     	subps	%xmm1, %xmm2
1454b1a79:     	movsldup	%xmm0, %xmm10           # xmm10 = xmm0[0,0,2,2]
1454b1a7e:     	mulps	%xmm2, %xmm10
1454b1a82:     	addps	%xmm1, %xmm10
1454b1a86:     	jmp	0x1454b1a8f <.text+0x54b0a8f>
1454b1a88:     	movsd	-0x48(%rax,%rcx), %xmm10
1454b1a8f:     	movl	0x24(%r14), %r8d
1454b1a93:     	movq	%rdi, 0x68(%rbp)
1454b1a97:     	movq	%rdi, 0x2c0(%rbp)
1454b1a9e:     	movl	$0x0, 0x2b8(%rbp)
1454b1aa8:     	movl	$0x0, 0x2f0(%rbp)
1454b1ab2:     	leaq	0x2f0(%rbp), %rax
1454b1ab9:     	movq	%rax, 0x30(%rsp)
1454b1abe:     	leaq	0x2b8(%rbp), %rax
1454b1ac5:     	movq	%rax, 0x28(%rsp)
1454b1aca:     	movq	$0x1, 0x20(%rsp)
1454b1ad3:     	leaq	0xb0(%rbp), %rcx
1454b1ada:     	movq	%rdx, 0x80(%rbp)
1454b1ae1:     	leaq	0x68(%rbp), %r9
1454b1ae5:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b1aea:     	nop
1454b1aeb:     	movq	0x368(%rbp), %r13
1454b1af2:     	movq	0x560(%r13), %rsi
1454b1af9:     	cmpq	0x550(%r13), %rsi
1454b1b00:     	jne	0x1454b1b0f <.text+0x54b0b0f>
1454b1b02:     	movq	0x328(%rbp), %rcx
1454b1b09:     	callq	0x145774710 <.text+0x5773710>
1454b1b0e:     	nop
1454b1b0f:     	movq	0x558(%r13), %rax
1454b1b16:     	movq	%rsi, %rcx
1454b1b19:     	shlq	$0x5, %rcx
1454b1b1d:     	movups	0xb0(%rbp), %xmm0
1454b1b24:     	movups	0xc0(%rbp), %xmm1
1454b1b2b:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b1b30:     	movups	%xmm0, (%rax,%rcx)
1454b1b34:     	incq	%rsi
1454b1b37:     	movq	%rsi, 0x560(%r13)
1454b1b3e:     	movss	0x1c(%r14), %xmm14
1454b1b44:     	movq	0x8a0(%r13), %rax
1454b1b4b:     	movq	0x8b8(%r13), %rcx
1454b1b52:     	leaq	(%rcx,%rax), %rdx
1454b1b56:     	rolq	$0x17, %rdx
1454b1b5a:     	addq	%rax, %rdx
1454b1b5d:     	movq	0x8a8(%r13), %r8
1454b1b64:     	movq	%r8, %r9
1454b1b67:     	shlq	$0x11, %r9
1454b1b6b:     	movq	0x8b0(%r13), %r10
1454b1b72:     	xorq	%rax, %r10
1454b1b75:     	xorq	%r8, %rcx
1454b1b78:     	xorq	%r10, %r8
1454b1b7b:     	movq	%r8, 0x8a8(%r13)
1454b1b82:     	xorq	%rcx, %rax
1454b1b85:     	movq	%rax, 0x8a0(%r13)
1454b1b8c:     	xorq	%r9, %r10
1454b1b8f:     	movq	%r10, 0x8b0(%r13)
1454b1b96:     	rolq	$0x2d, %rcx
1454b1b9a:     	movq	%rcx, 0x8b8(%r13)
1454b1ba1:     	shrq	$0x28, %rdx
1454b1ba5:     	cvtsi2ss	%edx, %xmm11
1454b1baa:     	mulss	0x5567ed(%rip), %xmm11  # 0x145a083a0
1454b1bb3:     	movq	0x6e8(%r13), %rdx
1454b1bba:     	movss	0x4558ce(%rip), %xmm2   # 0x145907490
1454b1bc2:     	movaps	%xmm2, %xmm0
1454b1bc5:     	testq	%rdx, %rdx
1454b1bc8:     	je	0x1454b2182 <.text+0x54b1182>
1454b1bce:     	movq	0x6e0(%r13), %rax
1454b1bd5:     	cmpq	$0x1, %rdx
1454b1bd9:     	jne	0x1454b211c <.text+0x54b111c>
1454b1bdf:     	xorl	%ecx, %ecx
1454b1be1:     	movss	0x461763(%rip), %xmm0   # 0x14591334c
1454b1be9:     	jmp	0x1454b216a <.text+0x54b116a>
1454b1bee:     	movsd	0x118(%rax,%rcx), %xmm0
1454b1bf7:     	subps	%xmm12, %xmm0
1454b1bfb:     	mulps	%xmm0, %xmm0
1454b1bfe:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b1c02:     	addss	%xmm0, %xmm1
1454b1c06:     	xorps	%xmm0, %xmm0
1454b1c09:     	sqrtss	%xmm1, %xmm0
1454b1c0d:     	movss	0x532bcb(%rip), %xmm1   # 0x1459e47e0
1454b1c15:     	ucomiss	%xmm0, %xmm1
1454b1c18:     	jbe	0x1454b1c37 <.text+0x54b0c37>
1454b1c1a:     	cmpq	$-0x1, 0x18(%rax,%rcx)
1454b1c20:     	setne	%dl
1454b1c23:     	addb	%dl, %dl
1454b1c25:     	orb	0x158(%rax,%rcx), %dl
1454b1c2c:     	movb	%dl, 0x338(%rbp)
1454b1c32:     	movb	$0x1, %r12b
1454b1c35:     	jmp	0x1454b1c3a <.text+0x54b0c3a>
1454b1c37:     	xorl	%r12d, %r12d
1454b1c3a:     	movl	0x228(%rbp), %eax
1454b1c40:     	movl	%eax, 0x2c0(%rbp)
1454b1c46:     	movq	0x220(%rbp), %rax
1454b1c4d:     	movq	%rax, 0x2b8(%rbp)
1454b1c54:     	movl	0x348(%rbp), %eax
1454b1c5a:     	movb	%al, 0x367(%rbp)
1454b1c60:     	leaq	0xb0(%rbp), %rcx
1454b1c67:     	movq	%rsi, %rdx
1454b1c6a:     	leaq	0x2b8(%rbp), %r8
1454b1c71:     	movss	0x48dff7(%rip), %xmm3   # 0x14593fc70
1454b1c79:     	callq	0x1455004d0 <.text+0x54ff4d0>
1454b1c7e:     	nop
1454b1c7f:     	movq	0xb8(%rbp), %rcx
1454b1c86:     	movq	0xc0(%rbp), %rax
1454b1c8d:     	testq	%rax, %rax
1454b1c90:     	je	0x1454b1f9d <.text+0x54b0f9d>
1454b1c96:     	leaq	(%rcx,%rax,8), %rax
1454b1c9a:     	movq	0x368(%rbp), %r8
1454b1ca1:     	movss	0x934(%r8), %xmm0
1454b1caa:     	movq	0x4e0(%r8), %rdx
1454b1cb1:     	imulq	$0x160, 0x4e8(%r8), %r8 # imm = 0x160
1454b1cbc:     	movq	%rcx, %r9
1454b1cbf:     	movss	0x4557c8(%rip), %xmm8   # 0x145907490
1454b1cc8:     	movss	0x49f5a0(%rip), %xmm5   # 0x145951270
1454b1cd0:     	jmp	0x1454b1d0b <.text+0x54b0d0b>
1454b1cd2:     	nopw	%cs:(%rax,%rax)
1454b1ce0:     	movsd	-0x48(%rdx,%r10), %xmm1
1454b1ce7:     	subps	%xmm12, %xmm1
1454b1ceb:     	mulps	%xmm1, %xmm1
1454b1cee:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454b1cf2:     	addss	%xmm1, %xmm2
1454b1cf6:     	xorps	%xmm1, %xmm1
1454b1cf9:     	sqrtss	%xmm2, %xmm1
1454b1cfd:     	ucomiss	%xmm1, %xmm5
1454b1d00:     	ja	0x1454b1fc1 <.text+0x54b0fc1>
1454b1d06:     	cmpq	%rax, %r9
1454b1d09:     	je	0x1454b1d85 <.text+0x54b0d85>
1454b1d0b:     	movq	(%r9), %rdi
1454b1d0e:     	addq	$0x8, %r9
1454b1d12:     	xorl	%r10d, %r10d
1454b1d15:     	movq	%rdx, %r11
1454b1d18:     	nopl	(%rax,%rax)
1454b1d20:     	cmpq	%r10, %r8
1454b1d23:     	je	0x1454b1d06 <.text+0x54b0d06>
1454b1d25:     	addq	$0x160, %r10            # imm = 0x160
1454b1d2c:     	cmpq	%rdi, 0x88(%r11)
1454b1d33:     	leaq	0x160(%r11), %r11
1454b1d3a:     	jne	0x1454b1d20 <.text+0x54b0d20>
1454b1d3c:     	movss	-0x38(%rdx,%r10), %xmm1
1454b1d43:     	ucomiss	%xmm1, %xmm7
1454b1d46:     	jae	0x1454b1ce0 <.text+0x54b0ce0>
1454b1d48:     	movaps	%xmm0, %xmm2
1454b1d4b:     	subss	-0x3c(%rdx,%r10), %xmm2
1454b1d52:     	divss	%xmm1, %xmm2
1454b1d56:     	xorps	%xmm1, %xmm1
1454b1d59:     	maxss	%xmm2, %xmm1
1454b1d5d:     	movaps	%xmm8, %xmm2
1454b1d61:     	minss	%xmm1, %xmm2
1454b1d65:     	movsd	-0x54(%rdx,%r10), %xmm3
1454b1d6c:     	movsd	-0x48(%rdx,%r10), %xmm4
1454b1d73:     	subps	%xmm3, %xmm4
1454b1d76:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
1454b1d7a:     	mulps	%xmm4, %xmm1
1454b1d7d:     	addps	%xmm3, %xmm1
1454b1d80:     	jmp	0x1454b1ce7 <.text+0x54b0ce7>
1454b1d85:     	movq	%r13, %rsi
1454b1d88:     	xorl	%r13d, %r13d
1454b1d8b:     	movq	0xb0(%rbp), %rdx
1454b1d92:     	testq	%rdx, %rdx
1454b1d95:     	je	0x1454b1da6 <.text+0x54b0da6>
1454b1d97:     	shlq	$0x3, %rdx
1454b1d9b:     	movl	$0x8, %r8d
1454b1da1:     	callq	0x1400021d0 <.text+0x11d0>
1454b1da6:     	movb	$0x1, %al
1454b1da8:     	testb	%r13b, %r13b
1454b1dab:     	je	0x1454b1e14 <.text+0x54b0e14>
1454b1dad:     	movq	0x368(%rbp), %rdx
1454b1db4:     	movq	0x4e0(%rdx), %rcx
1454b1dbb:     	imulq	$0x160, 0x4e8(%rdx), %r8 # imm = 0x160
1454b1dc6:     	xorl	%edx, %edx
1454b1dc8:     	movq	%rcx, %r9
1454b1dcb:     	movzbl	0x338(%rbp), %r10d
1454b1dd3:     	nopw	%cs:(%rax,%rax)
1454b1de0:     	cmpq	%rdx, %r8
1454b1de3:     	je	0x1454b1e14 <.text+0x54b0e14>
1454b1de5:     	addq	$0x160, %rdx            # imm = 0x160
1454b1dec:     	cmpq	%rdi, 0x88(%r9)
1454b1df3:     	leaq	0x160(%r9), %r9
1454b1dfa:     	jne	0x1454b1de0 <.text+0x54b0de0>
1454b1dfc:     	cmpq	$-0x1, -0x148(%rcx,%rdx)
1454b1e05:     	setne	%al
1454b1e08:     	addb	%al, %al
1454b1e0a:     	orb	-0x8(%rcx,%rdx), %al
1454b1e0e:     	cmpb	%al, %r10b
1454b1e11:     	setae	%al
1454b1e14:     	andb	%al, %r12b
1454b1e17:     	orb	%r12b, %r13b
1454b1e1a:     	testb	%r12b, %r12b
1454b1e1d:     	cmovneq	%r15, %rdi
1454b1e21:     	movq	0x368(%rbp), %rax
1454b1e28:     	movq	0xd8(%rax), %rdx
1454b1e2f:     	cmpb	$0x1, %r13b
1454b1e33:     	jne	0x1454b1f22 <.text+0x54b0f22>
1454b1e39:     	cmpq	%rdx, %r14
1454b1e3c:     	jae	0x1454bcb29 <.text+0x54bbb29>
1454b1e42:     	movq	0x368(%rbp), %r12
1454b1e49:     	movq	0xd0(%r12), %rax
1454b1e51:     	movq	%rdi, 0x28(%rax,%rbx)
1454b1e56:     	movq	0x4e0(%r12), %rax
1454b1e5e:     	imulq	$0x160, 0x4e8(%r12), %rdx # imm = 0x160
1454b1e6a:     	xorl	%ecx, %ecx
1454b1e6c:     	movq	%rax, %r8
1454b1e6f:     	nop
1454b1e70:     	cmpq	%rcx, %rdx
1454b1e73:     	je	0x1454b1628 <.text+0x54b0628>
1454b1e79:     	addq	$0x160, %rcx            # imm = 0x160
1454b1e80:     	cmpq	%rdi, 0x88(%r8)
1454b1e87:     	leaq	0x160(%r8), %r8
1454b1e8e:     	jne	0x1454b1e70 <.text+0x54b0e70>
1454b1e90:     	movss	0x98(%rbp), %xmm0
1454b1e98:     	movss	-0x38(%rax,%rcx), %xmm1
1454b1e9e:     	ucomiss	%xmm1, %xmm7
1454b1ea1:     	jae	0x1454b1fdc <.text+0x54b0fdc>
1454b1ea7:     	movsldup	%xmm0, %xmm2            # xmm2 = xmm0[0,0,2,2]
1454b1eab:     	addps	0x5bf54e(%rip), %xmm2   # 0x145a71400
1454b1eb2:     	movss	-0x3c(%rax,%rcx), %xmm3
1454b1eb8:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
1454b1ebc:     	subps	%xmm3, %xmm2
1454b1ebf:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454b1ec3:     	divps	%xmm1, %xmm2
1454b1ec6:     	xorps	%xmm1, %xmm1
1454b1ec9:     	maxps	%xmm2, %xmm1
1454b1ecc:     	movaps	0x45567d(%rip), %xmm2   # 0x145907550
1454b1ed3:     	cmpltps	%xmm1, %xmm2
1454b1ed7:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454b1eda:     	movmskpd	%xmm2, %edx
1454b1ede:     	movaps	%xmm8, %xmm2
1454b1ee2:     	testb	$0x2, %dl
1454b1ee5:     	jne	0x1454b1eeb <.text+0x54b0eeb>
1454b1ee7:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454b1eeb:     	movaps	%xmm8, %xmm3
1454b1eef:     	testb	$0x1, %dl
1454b1ef2:     	jne	0x1454b1ef7 <.text+0x54b0ef7>
1454b1ef4:     	movaps	%xmm1, %xmm3
1454b1ef7:     	movsd	-0x54(%rax,%rcx), %xmm4
1454b1efd:     	movsd	-0x48(%rax,%rcx), %xmm5
1454b1f03:     	subps	%xmm4, %xmm5
1454b1f06:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
1454b1f0a:     	mulps	%xmm5, %xmm1
1454b1f0d:     	addps	%xmm4, %xmm1
1454b1f10:     	movsldup	%xmm3, %xmm9            # xmm9 = xmm3[0,0,2,2]
1454b1f15:     	mulps	%xmm5, %xmm9
1454b1f19:     	addps	%xmm4, %xmm9
1454b1f1d:     	jmp	0x1454b1fe7 <.text+0x54b0fe7>
1454b1f22:     	cmpq	%rdx, %r14
1454b1f25:     	jae	0x1454bcb4a <.text+0x54bbb4a>
1454b1f2b:     	movq	0x368(%rbp), %rax
1454b1f32:     	movq	0xd0(%rax), %rax
1454b1f39:     	movq	$0x0, 0x28(%rax,%rbx)
1454b1f42:     	subps	%xmm9, %xmm14
1454b1f46:     	mulps	%xmm14, %xmm14
1454b1f4a:     	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
1454b1f4f:     	addss	%xmm14, %xmm0
1454b1f54:     	sqrtss	%xmm0, %xmm0
1454b1f58:     	ucomiss	0x4555a9(%rip), %xmm0   # 0x145907508
1454b1f5f:     	jbe	0x1454b1628 <.text+0x54b0628>
1454b1f65:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b1f6a:     	movl	0x348(%rbp), %eax
1454b1f70:     	movb	%al, 0x367(%rbp)
1454b1f76:     	movss	0x2a8(%rbp), %xmm0
1454b1f7e:     	movss	%xmm0, 0x20(%rsp)
1454b1f84:     	movq	0x368(%rbp), %rcx
1454b1f8b:     	movq	%r14, %rdx
1454b1f8e:     	movaps	%xmm9, %xmm2
1454b1f92:     	callq	0x1454d0510 <.text+0x54cf510>
1454b1f97:     	nop
1454b1f98:     	jmp	0x1454b1628 <.text+0x54b0628>
1454b1f9d:     	movq	%r13, %rsi
1454b1fa0:     	xorl	%r13d, %r13d
1454b1fa3:     	movss	0x4554e4(%rip), %xmm8   # 0x145907490
1454b1fac:     	movq	0xb0(%rbp), %rdx
1454b1fb3:     	testq	%rdx, %rdx
1454b1fb6:     	jne	0x1454b1d97 <.text+0x54b0d97>
1454b1fbc:     	jmp	0x1454b1da6 <.text+0x54b0da6>
1454b1fc1:     	movq	%r13, %rsi
1454b1fc4:     	movb	$0x1, %r13b
1454b1fc7:     	movq	0xb0(%rbp), %rdx
1454b1fce:     	testq	%rdx, %rdx
1454b1fd1:     	jne	0x1454b1d97 <.text+0x54b0d97>
1454b1fd7:     	jmp	0x1454b1da6 <.text+0x54b0da6>
1454b1fdc:     	movsd	-0x48(%rax,%rcx), %xmm9
1454b1fe3:     	movaps	%xmm9, %xmm1
1454b1fe7:     	movaps	%xmm14, %xmm2
1454b1feb:     	subps	%xmm1, %xmm2
1454b1fee:     	mulps	%xmm2, %xmm2
1454b1ff1:     	movshdup	%xmm2, %xmm1            # xmm1 = xmm2[1,1,3,3]
1454b1ff5:     	addss	%xmm2, %xmm1
1454b1ff9:     	sqrtss	%xmm1, %xmm1
1454b1ffd:     	movss	0x77f4df(%rip), %xmm2   # 0x145c314e4
1454b2005:     	ucomiss	%xmm1, %xmm2
1454b2008:     	jb	0x1454b2568 <.text+0x54b1568>
1454b200e:     	movq	0xd8(%r12), %rdx
1454b2016:     	cmpq	%rdx, %r14
1454b2019:     	jae	0x1454bcc67 <.text+0x54bbc67>
1454b201f:     	movq	0xd0(%r12), %rax
1454b2027:     	ucomiss	0x50(%rax,%rbx), %xmm0
1454b202c:     	jb	0x1454b2568 <.text+0x54b1568>
1454b2032:     	addss	0x20(%rsi), %xmm0
1454b2037:     	addq	%rbx, %rax
1454b203a:     	movss	%xmm0, 0x50(%rax)
1454b203f:     	movq	0xd8(%r12), %rdx
1454b2047:     	cmpq	%rdx, %r14
1454b204a:     	jae	0x1454bccf5 <.text+0x54bbcf5>
1454b2050:     	movq	0xd0(%r12), %rax
1454b2058:     	movq	0x18(%rax,%rbx), %r15
1454b205d:     	movq	0x20(%rax,%rbx), %rdx
1454b2062:     	movss	0x1c(%r15), %xmm10
1454b2068:     	movq	0x8a0(%r12), %rax
1454b2070:     	movq	0x8b8(%r12), %rcx
1454b2078:     	leaq	(%rcx,%rax), %r8
1454b207c:     	rolq	$0x17, %r8
1454b2080:     	addq	%rax, %r8
1454b2083:     	movq	0x8a8(%r12), %r9
1454b208b:     	movq	%r9, %r10
1454b208e:     	shlq	$0x11, %r10
1454b2092:     	movq	0x8b0(%r12), %r11
1454b209a:     	xorq	%rax, %r11
1454b209d:     	xorq	%r9, %rcx
1454b20a0:     	xorq	%r11, %r9
1454b20a3:     	movq	%r9, 0x8a8(%r12)
1454b20ab:     	xorq	%rcx, %rax
1454b20ae:     	movq	%rax, 0x8a0(%r12)
1454b20b6:     	xorq	%r10, %r11
1454b20b9:     	movq	%r11, 0x8b0(%r12)
1454b20c1:     	rolq	$0x2d, %rcx
1454b20c5:     	movq	%rcx, 0x8b8(%r12)
1454b20cd:     	shrq	$0x28, %r8
1454b20d1:     	cvtsi2ss	%r8d, %xmm8
1454b20d6:     	mulss	0x5562c1(%rip), %xmm8   # 0x145a083a0
1454b20df:     	movq	0x6e8(%r12), %r8
1454b20e7:     	movss	0x4553a1(%rip), %xmm2   # 0x145907490
1454b20ef:     	movaps	%xmm2, %xmm0
1454b20f2:     	testq	%r8, %r8
1454b20f5:     	je	0x1454b2423 <.text+0x54b1423>
1454b20fb:     	movq	0x6e0(%r12), %rax
1454b2103:     	cmpq	$0x1, %r8
1454b2107:     	jne	0x1454b23af <.text+0x54b13af>
1454b210d:     	xorl	%ecx, %ecx
1454b210f:     	movss	0x461235(%rip), %xmm0   # 0x14591334c
1454b2117:     	jmp	0x1454b240b <.text+0x54b140b>
1454b211c:     	movq	%rdx, %r8
1454b211f:     	andq	$-0x2, %r8
1454b2123:     	xorl	%ecx, %ecx
1454b2125:     	movss	0x46121f(%rip), %xmm0   # 0x14591334c
1454b212d:     	jmp	0x1454b2139 <.text+0x54b1139>
1454b212f:     	nop
1454b2130:     	addq	$0x2, %rcx
1454b2134:     	cmpq	%rcx, %r8
1454b2137:     	je	0x1454b2165 <.text+0x54b1165>
1454b2139:     	cmpb	$0x11, (%rax,%rcx,8)
1454b213d:     	je	0x1454b2150 <.text+0x54b1150>
1454b213f:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454b2144:     	jne	0x1454b2130 <.text+0x54b1130>
1454b2146:     	jmp	0x1454b215d <.text+0x54b115d>
1454b2148:     	nopl	(%rax,%rax)
1454b2150:     	addss	0x4(%rax,%rcx,8), %xmm0
1454b2156:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454b215b:     	jne	0x1454b2130 <.text+0x54b1130>
1454b215d:     	addss	0xc(%rax,%rcx,8), %xmm0
1454b2163:     	jmp	0x1454b2130 <.text+0x54b1130>
1454b2165:     	testb	$0x1, %dl
1454b2168:     	je	0x1454b2176 <.text+0x54b1176>
1454b216a:     	cmpb	$0x11, (%rax,%rcx,8)
1454b216e:     	jne	0x1454b2176 <.text+0x54b1176>
1454b2170:     	addss	0x4(%rax,%rcx,8), %xmm0
1454b2176:     	movss	0x455312(%rip), %xmm2   # 0x145907490
1454b217e:     	addss	%xmm2, %xmm0
1454b2182:     	movl	0x410(%r13), %eax
1454b2189:     	xorps	%xmm1, %xmm1
1454b218c:     	cvtsi2ss	%rax, %xmm1
1454b2191:     	movss	0x47c(%r13), %xmm15
1454b219a:     	addss	0x45536a(%rip), %xmm1   # 0x14590750c
1454b21a2:     	mulss	0x455386(%rip), %xmm1   # 0x145907530
1454b21aa:     	addss	%xmm2, %xmm1
1454b21ae:     	mulss	%xmm1, %xmm14
1454b21b3:     	mulss	0x474(%r13), %xmm14
1454b21bc:     	mulss	%xmm0, %xmm14
1454b21c1:     	movss	0x480(%r13), %xmm8
1454b21ca:     	mulss	%xmm14, %xmm8
1454b21cf:     	movl	0x24(%r14), %r15d
1454b21d3:     	cmpl	$0xe15, %r15d           # imm = 0xE15
1454b21da:     	jle	0x1454b222a <.text+0x54b122a>
1454b21dc:     	cmpl	$0x1b04, %r15d          # imm = 0x1B04
1454b21e3:     	jle	0x1454b2270 <.text+0x54b1270>
1454b21e9:     	cmpl	$0x2c65, %r15d          # imm = 0x2C65
1454b21f0:     	jg	0x1454b22f3 <.text+0x54b12f3>
1454b21f6:     	cmpl	$0x1b05, %r15d          # imm = 0x1B05
1454b21fd:     	je	0x1454b2395 <.text+0x54b1395>
1454b2203:     	cmpl	$0x1c65, %r15d          # imm = 0x1C65
1454b220a:     	je	0x1454b22e6 <.text+0x54b12e6>
1454b2210:     	movss	0x455278(%rip), %xmm0   # 0x145907490
1454b2218:     	cmpl	$0x27c5, %r15d          # imm = 0x27C5
1454b221f:     	je	0x1454b236a <.text+0x54b136a>
1454b2225:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b222a:     	cmpl	$0x5e5, %r15d           # imm = 0x5E5
1454b2231:     	jg	0x1454b22a9 <.text+0x54b12a9>
1454b2233:     	cmpl	$0x84, %r15d
1454b223a:     	jle	0x1454b2352 <.text+0x54b1352>
1454b2240:     	cmpl	$0x85, %r15d
1454b2247:     	je	0x1454b2322 <.text+0x54b1322>
1454b224d:     	cmpl	$0x193, %r15d           # imm = 0x193
1454b2254:     	je	0x1454b22e6 <.text+0x54b12e6>
1454b225a:     	movss	0x45522e(%rip), %xmm0   # 0x145907490
1454b2262:     	cmpl	$0x2ae, %r15d           # imm = 0x2AE
1454b2269:     	je	0x1454b22e6 <.text+0x54b12e6>
1454b226b:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b2270:     	cmpl	$0x1437, %r15d          # imm = 0x1437
1454b2277:     	jle	0x1454b232f <.text+0x54b132f>
1454b227d:     	cmpl	$0x1438, %r15d          # imm = 0x1438
1454b2284:     	je	0x1454b22e6 <.text+0x54b12e6>
1454b2286:     	cmpl	$0x18d1, %r15d          # imm = 0x18D1
1454b228d:     	je	0x1454b2322 <.text+0x54b1322>
1454b2293:     	movss	0x4551f5(%rip), %xmm0   # 0x145907490
1454b229b:     	cmpl	$0x1a85, %r15d          # imm = 0x1A85
1454b22a2:     	je	0x1454b2322 <.text+0x54b1322>
1454b22a4:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b22a9:     	cmpl	$0xa52, %r15d           # imm = 0xA52
1454b22b0:     	jle	0x1454b2377 <.text+0x54b1377>
1454b22b6:     	cmpl	$0xa53, %r15d           # imm = 0xA53
1454b22bd:     	je	0x1454b23a2 <.text+0x54b13a2>
1454b22c3:     	cmpl	$0xafc, %r15d           # imm = 0xAFC
1454b22ca:     	je	0x1454b22e6 <.text+0x54b12e6>
1454b22cc:     	movss	0x4551bc(%rip), %xmm0   # 0x145907490
1454b22d4:     	cmpl	$0xbe4, %r15d           # imm = 0xBE4
1454b22db:     	je	0x1454b2395 <.text+0x54b1395>
1454b22e1:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b22e6:     	movss	0x4635ea(%rip), %xmm0   # 0x1459158d8
1454b22ee:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b22f3:     	cmpl	$0x5ed3, %r15d          # imm = 0x5ED3
1454b22fa:     	je	0x1454b25ee <.text+0x54b15ee>
1454b2300:     	cmpl	$0x4bea, %r15d          # imm = 0x4BEA
1454b2307:     	je	0x1454b2395 <.text+0x54b1395>
1454b230d:     	movss	0x45517b(%rip), %xmm0   # 0x145907490
1454b2315:     	cmpl	$0x2c66, %r15d          # imm = 0x2C66
1454b231c:     	jne	0x1454b2600 <.text+0x54b1600>
1454b2322:     	movss	0x48d5fa(%rip), %xmm0   # 0x14593f924
1454b232a:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b232f:     	cmpl	$0xe16, %r15d           # imm = 0xE16
1454b2336:     	je	0x1454b25f8 <.text+0x54b15f8>
1454b233c:     	movss	0x45514c(%rip), %xmm0   # 0x145907490
1454b2344:     	cmpl	$0x13fc, %r15d          # imm = 0x13FC
1454b234b:     	je	0x1454b2395 <.text+0x54b1395>
1454b234d:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b2352:     	cmpl	$0x4b, %r15d
1454b2356:     	je	0x1454b2395 <.text+0x54b1395>
1454b2358:     	movss	0x455130(%rip), %xmm0   # 0x145907490
1454b2360:     	cmpl	$0x74, %r15d
1454b2364:     	jne	0x1454b2600 <.text+0x54b1600>
1454b236a:     	movss	0x49eefe(%rip), %xmm0   # 0x145951270
1454b2372:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b2377:     	cmpl	$0x5e6, %r15d           # imm = 0x5E6
1454b237e:     	je	0x1454b23a2 <.text+0x54b13a2>
1454b2380:     	movss	0x455108(%rip), %xmm0   # 0x145907490
1454b2388:     	cmpl	$0x7ba, %r15d           # imm = 0x7BA
1454b238f:     	jne	0x1454b2600 <.text+0x54b1600>
1454b2395:     	movss	0x460fb3(%rip), %xmm0   # 0x145913350
1454b239d:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b23a2:     	movss	0x460f16(%rip), %xmm0   # 0x1459132c0
1454b23aa:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b23af:     	movq	%r8, %r9
1454b23b2:     	andq	$-0x2, %r9
1454b23b6:     	xorl	%ecx, %ecx
1454b23b8:     	movss	0x460f8c(%rip), %xmm0   # 0x14591334c
1454b23c0:     	jmp	0x1454b23d9 <.text+0x54b13d9>
1454b23c2:     	nopw	%cs:(%rax,%rax)
1454b23d0:     	addq	$0x2, %rcx
1454b23d4:     	cmpq	%rcx, %r9
1454b23d7:     	je	0x1454b2405 <.text+0x54b1405>
1454b23d9:     	cmpb	$0x11, (%rax,%rcx,8)
1454b23dd:     	je	0x1454b23f0 <.text+0x54b13f0>
1454b23df:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454b23e4:     	jne	0x1454b23d0 <.text+0x54b13d0>
1454b23e6:     	jmp	0x1454b23fd <.text+0x54b13fd>
1454b23e8:     	nopl	(%rax,%rax)
1454b23f0:     	addss	0x4(%rax,%rcx,8), %xmm0
1454b23f6:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454b23fb:     	jne	0x1454b23d0 <.text+0x54b13d0>
1454b23fd:     	addss	0xc(%rax,%rcx,8), %xmm0
1454b2403:     	jmp	0x1454b23d0 <.text+0x54b13d0>
1454b2405:     	testb	$0x1, %r8b
1454b2409:     	je	0x1454b2417 <.text+0x54b1417>
1454b240b:     	cmpb	$0x11, (%rax,%rcx,8)
1454b240f:     	jne	0x1454b2417 <.text+0x54b1417>
1454b2411:     	addss	0x4(%rax,%rcx,8), %xmm0
1454b2417:     	movss	0x455071(%rip), %xmm2   # 0x145907490
1454b241f:     	addss	%xmm2, %xmm0
1454b2423:     	movss	0x47c(%r12), %xmm11
1454b242d:     	ucomiss	%xmm8, %xmm11
1454b2431:     	movl	0x410(%r12), %eax
1454b2439:     	xorps	%xmm1, %xmm1
1454b243c:     	cvtsi2ss	%rax, %xmm1
1454b2441:     	addss	0x4550c3(%rip), %xmm1   # 0x14590750c
1454b2449:     	mulss	0x4550df(%rip), %xmm1   # 0x145907530
1454b2451:     	addss	%xmm2, %xmm1
1454b2455:     	mulss	%xmm1, %xmm10
1454b245a:     	mulss	0x474(%r12), %xmm10
1454b2464:     	mulss	%xmm0, %xmm10
1454b2469:     	jbe	0x1454b2475 <.text+0x54b1475>
1454b246b:     	mulss	0x480(%r12), %xmm10
1454b2475:     	movl	0x348(%rbp), %eax
1454b247b:     	movb	%al, 0x367(%rbp)
1454b2481:     	ucomiss	%xmm8, %xmm11
1454b2485:     	seta	0x20(%rsp)
1454b248a:     	cvttss2si	%xmm10, %r9
1454b248f:     	ucomiss	%xmm7, %xmm10
1454b2493:     	movl	$0x0, %eax
1454b2498:     	cmovbl	%eax, %r9d
1454b249c:     	ucomiss	0x455088(%rip), %xmm10  # 0x14590752c
1454b24a4:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b24a9:     	cmoval	%eax, %r9d
1454b24ad:     	leaq	0xb0(%rbp), %rcx
1454b24b4:     	movq	%rdi, %r8
1454b24b7:     	callq	0x14545c690 <.text+0x545b690>
1454b24bc:     	nop
1454b24bd:     	movq	0x368(%rbp), %r12
1454b24c4:     	movq	0x560(%r12), %rsi
1454b24cc:     	cmpq	0x550(%r12), %rsi
1454b24d4:     	jne	0x1454b24e3 <.text+0x54b14e3>
1454b24d6:     	movq	0x328(%rbp), %rcx
1454b24dd:     	callq	0x145774710 <.text+0x5773710>
1454b24e2:     	nop
1454b24e3:     	movq	0x558(%r12), %rax
1454b24eb:     	movq	%rsi, %rcx
1454b24ee:     	shlq	$0x5, %rcx
1454b24f2:     	movups	0xb0(%rbp), %xmm0
1454b24f9:     	movups	0xc0(%rbp), %xmm1
1454b2500:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b2505:     	movups	%xmm0, (%rax,%rcx)
1454b2509:     	incq	%rsi
1454b250c:     	movq	%rsi, 0x560(%r12)
1454b2514:     	movb	0x129(%r12), %bl
1454b251c:     	movb	$0x2, 0x129(%r12)
1454b2525:     	movzbl	0x28(%r15), %eax
1454b252a:     	movl	0x348(%rbp), %ecx
1454b2530:     	movb	%cl, 0x367(%rbp)
1454b2536:     	ucomiss	%xmm8, %xmm11
1454b253a:     	seta	0x28(%rsp)
1454b253f:     	movb	%al, 0x20(%rsp)
1454b2543:     	movb	$0x1, 0x30(%rsp)
1454b2548:     	movq	%r12, %rcx
1454b254b:     	movq	%rdi, %rdx
1454b254e:     	movaps	%xmm10, %xmm2
1454b2552:     	xorl	%r9d, %r9d
1454b2555:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b255a:     	nop
1454b255b:     	movq	0x368(%rbp), %rax
1454b2562:     	movb	%bl, 0x129(%rax)
1454b2568:     	movaps	%xmm14, %xmm0
1454b256c:     	subps	%xmm9, %xmm0
1454b2570:     	mulps	%xmm0, %xmm0
1454b2573:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b2577:     	addss	%xmm0, %xmm1
1454b257b:     	xorps	%xmm0, %xmm0
1454b257e:     	sqrtss	%xmm1, %xmm0
1454b2582:     	ucomiss	0x463333(%rip), %xmm0   # 0x1459158bc
1454b2589:     	jbe	0x1454b1628 <.text+0x54b0628>
1454b258f:     	movaps	%xmm0, %xmm1
1454b2592:     	addss	0x1543856(%rip), %xmm1  # 0x1469f5df0
1454b259a:     	divss	%xmm0, %xmm1
1454b259e:     	subps	%xmm14, %xmm9
1454b25a2:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b25a7:     	mulss	%xmm1, %xmm9
1454b25ac:     	addss	%xmm14, %xmm9
1454b25b1:     	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
1454b25b6:     	mulss	%xmm1, %xmm3
1454b25ba:     	addss	%xmm0, %xmm3
1454b25be:     	movl	0x348(%rbp), %eax
1454b25c4:     	movb	%al, 0x367(%rbp)
1454b25ca:     	movss	0x60(%rbp), %xmm0
1454b25cf:     	movss	%xmm0, 0x20(%rsp)
1454b25d5:     	movq	0x368(%rbp), %rcx
1454b25dc:     	movq	%r14, %rdx
1454b25df:     	movaps	%xmm9, %xmm2
1454b25e3:     	callq	0x1454d0510 <.text+0x54cf510>
1454b25e8:     	nop
1454b25e9:     	jmp	0x1454b1628 <.text+0x54b0628>
1454b25ee:     	movss	0x5323f2(%rip), %xmm0   # 0x1459e49e8
1454b25f6:     	jmp	0x1454b2600 <.text+0x54b1600>
1454b25f8:     	movss	0x532420(%rip), %xmm0   # 0x1459e4a20
1454b2600:     	ucomiss	%xmm11, %xmm15
1454b2604:     	seta	%r12b
1454b2608:     	subps	%xmm10, %xmm9
1454b260c:     	mulps	%xmm9, %xmm9
1454b2610:     	movshdup	%xmm9, %xmm1            # xmm1 = xmm9[1,1,3,3]
1454b2615:     	addss	%xmm9, %xmm1
1454b261a:     	xorps	%xmm9, %xmm9
1454b261e:     	sqrtss	%xmm1, %xmm9
1454b2623:     	divss	%xmm0, %xmm9
1454b2628:     	addss	0x934(%r13), %xmm9
1454b2631:     	movzbl	0x28(%r14), %r14d
1454b2636:     	xorl	%ebx, %ebx
1454b2638:     	cmpb	$0x4, %r14b
1454b263c:     	sete	%sil
1454b2640:     	movq	%r13, %rax
1454b2643:     	movq	0x518(%r13), %r13
1454b264a:     	cmpq	0x508(%rax), %r13
1454b2651:     	jne	0x1454b2660 <.text+0x54b1660>
1454b2653:     	movq	0x238(%rbp), %rcx
1454b265a:     	callq	0x145780650 <.text+0x577f650>
1454b265f:     	nop
1454b2660:     	cmpltss	%xmm15, %xmm11
1454b2666:     	movaps	%xmm11, %xmm0
1454b266a:     	andnps	%xmm14, %xmm0
1454b266e:     	andps	%xmm8, %xmm11
1454b2672:     	orps	%xmm0, %xmm11
1454b2676:     	movb	%sil, %bl
1454b2679:     	movq	0x368(%rbp), %rdx
1454b2680:     	movq	0x510(%rdx), %rax
1454b2687:     	leaq	(,%r13,4), %rcx
1454b268f:     	addq	%r13, %rcx
1454b2692:     	shlq	$0x4, %rcx
1454b2696:     	movq	$0x0, (%rax,%rcx)
1454b269e:     	movl	$0x0, 0x10(%rax,%rcx)
1454b26a6:     	movq	%rdi, 0x20(%rax,%rcx)
1454b26ab:     	movq	0x80(%rbp), %r8
1454b26b2:     	movq	%r8, 0x28(%rax,%rcx)
1454b26b7:     	movl	%ebx, 0x30(%rax,%rcx)
1454b26bb:     	movsd	0x154371d(%rip), %xmm0  # 0x1469f5de0
1454b26c3:     	movsd	%xmm0, 0x34(%rax,%rcx)
1454b26c9:     	movss	%xmm9, 0x3c(%rax,%rcx)
1454b26d0:     	movl	%r15d, 0x40(%rax,%rcx)
1454b26d5:     	movss	%xmm11, 0x44(%rax,%rcx)
1454b26dc:     	movb	%r12b, 0x48(%rax,%rcx)
1454b26e1:     	movw	$0x0, 0x49(%rax,%rcx)
1454b26e8:     	movb	%r14b, 0x4b(%rax,%rcx)
1454b26ed:     	incq	%r13
1454b26f0:     	movq	%r13, 0x518(%rdx)
1454b26f7:     	movq	0x310(%rbp), %r9
1454b26fe:     	testq	%r9, %r9
1454b2701:     	je	0x1454b1628 <.text+0x54b0628>
1454b2707:     	movq	%r9, %rdx
1454b270a:     	shlq	$0x3, %rdx
1454b270e:     	movl	$0x8, %r8d
1454b2714:     	movq	0x338(%rbp), %rcx
1454b271b:     	callq	0x1400021d0 <.text+0x11d0>
1454b2720:     	jmp	0x1454b1628 <.text+0x54b0628>
1454b2725:     	cmpb	$0x0, 0x348(%rbp)
1454b272c:     	movq	0x368(%rbp), %r13
1454b2733:     	je	0x1454b2757 <.text+0x54b1757>
1454b2735:     	movq	0x240(%rbp), %rdx
1454b273c:     	testq	%rdx, %rdx
1454b273f:     	je	0x1454b2757 <.text+0x54b1757>
1454b2741:     	movq	0x248(%rbp), %rcx
1454b2748:     	shlq	$0x3, %rdx
1454b274c:     	movl	$0x8, %r8d
1454b2752:     	callq	0x1400021d0 <.text+0x11d0>
1454b2757:     	movq	0x2b0(%r13), %rax
1454b275e:     	movq	0x2b8(%r13), %rcx
1454b2765:     	imulq	$0x58, %rcx, %rdx
1454b2769:     	xorl	%r8d, %r8d
1454b276c:     	nopl	(%rax)
1454b2770:     	cmpq	%r8, %rdx
1454b2773:     	je	0x1454b5654 <.text+0x54b4654>
1454b2779:     	movq	(%rax,%r8), %r9
1454b277d:     	addq	$0x58, %r8
1454b2781:     	cmpb	$0xb, 0x75(%r9)
1454b2786:     	jne	0x1454b2770 <.text+0x54b1770>
1454b2788:     	movss	0x934(%r13), %xmm8
1454b2791:     	movss	%xmm8, 0x10(%rbp)
1454b2797:     	movabsq	$0x6974706d65646572, %r13 # imm = 0x6974706D65646572
1454b27a1:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b27ab:     	testq	%rcx, %rcx
1454b27ae:     	je	0x1454b2c5e <.text+0x54b1c5e>
1454b27b4:     	movq	0x368(%rbp), %rcx
1454b27bb:     	movss	0x478(%rcx), %xmm7
1454b27c3:     	leaq	(%rax,%rdx), %r8
1454b27c7:     	xorl	%r9d, %r9d
1454b27ca:     	jmp	0x1454b27dd <.text+0x54b17dd>
1454b27cc:     	nopl	(%rax)
1454b27d0:     	addq	$0x58, %r9
1454b27d4:     	cmpq	%r9, %rdx
1454b27d7:     	je	0x1454b28ef <.text+0x54b18ef>
1454b27dd:     	movq	(%rax,%r9), %r10
1454b27e1:     	cmpq	$0x9, 0x8(%r10)
1454b27e6:     	jne	0x1454b27d0 <.text+0x54b17d0>
1454b27e8:     	movq	(%r10), %rcx
1454b27eb:     	movq	(%rcx), %r11
1454b27ee:     	xorq	%r12, %r11
1454b27f1:     	movzbl	0x8(%rcx), %esi
1454b27f5:     	xorq	$0x65, %rsi
1454b27f9:     	orq	%r11, %rsi
1454b27fc:     	jne	0x1454b27d0 <.text+0x54b17d0>
1454b27fe:     	movss	0x48(%r10), %xmm9
1454b2804:     	mulss	0x465ee3(%rip), %xmm9   # 0x1459186f0
1454b280d:     	mulss	0x14(%rax,%r9), %xmm9
1454b2814:     	mulss	0x3c(%rax,%r9), %xmm9
1454b281b:     	movss	0x50(%rax,%r9), %xmm10
1454b2822:     	mulss	%xmm7, %xmm9
1454b2827:     	maxss	0x456db0(%rip), %xmm9   # 0x1459095e0
1454b2830:     	movl	$0x9, %edx
1454b2835:     	callq	0x1454536c0 <.text+0x54526c0>
1454b283a:     	maxss	0x460aad(%rip), %xmm10  # 0x1459132f0
1454b2843:     	maxss	%xmm9, %xmm0
1454b2848:     	divss	%xmm10, %xmm0
1454b284d:     	movss	0x454ce7(%rip), %xmm1   # 0x14590753c
1454b2855:     	divss	%xmm0, %xmm1
1454b2859:     	movaps	%xmm6, %xmm0
1454b285c:     	mulss	%xmm1, %xmm0
1454b2860:     	movq	0x368(%rbp), %rsi
1454b2867:     	addss	0x7e0(%rsi), %xmm0
1454b286f:     	mulss	0x454c21(%rip), %xmm1   # 0x145907498
1454b2877:     	maxss	0x460a75(%rip), %xmm1   # 0x1459132f4
1454b287f:     	minss	%xmm1, %xmm0
1454b2883:     	movss	%xmm0, 0x7e0(%rsi)
1454b288b:     	subss	0x7e4(%rsi), %xmm8
1454b2894:     	ucomiss	0x460a60(%rip), %xmm8   # 0x1459132fc
1454b289c:     	jbe	0x1454b28c1 <.text+0x54b18c1>
1454b289e:     	movss	0x48d02a(%rip), %xmm0   # 0x14593f8d0
1454b28a6:     	mulss	%xmm6, %xmm0
1454b28aa:     	addss	0x7dc(%rsi), %xmm0
1454b28b2:     	xorps	%xmm1, %xmm1
1454b28b5:     	maxss	%xmm1, %xmm0
1454b28b9:     	movss	%xmm0, 0x7dc(%rsi)
1454b28c1:     	movq	%rsi, %rcx
1454b28c4:     	callq	0x1454e8ba0 <.text+0x54e7ba0>
1454b28c9:     	movq	0x2b8(%rsi), %rcx
1454b28d0:     	testq	%rcx, %rcx
1454b28d3:     	je	0x1454b2c5e <.text+0x54b1c5e>
1454b28d9:     	movq	0x368(%rbp), %rax
1454b28e0:     	movq	0x2b0(%rax), %rax
1454b28e7:     	imulq	$0x58, %rcx, %rdx
1454b28eb:     	leaq	(%rax,%rdx), %r8
1454b28ef:     	movabsq	$0x7461665f6c616573, %r10 # imm = 0x7461665F6C616573
1454b28f9:     	movq	%rax, %r9
1454b28fc:     	jmp	0x1454b290d <.text+0x54b190d>
1454b28fe:     	nop
1454b2900:     	addq	$0x58, %r9
1454b2904:     	cmpq	%r8, %r9
1454b2907:     	je	0x1454b29dd <.text+0x54b19dd>
1454b290d:     	movq	(%r9), %r11
1454b2910:     	cmpq	$0x9, 0x8(%r11)
1454b2915:     	jne	0x1454b2900 <.text+0x54b1900>
1454b2917:     	movq	(%r11), %rcx
1454b291a:     	movq	(%rcx), %rsi
1454b291d:     	xorq	%r10, %rsi
1454b2920:     	movzbl	0x8(%rcx), %edi
1454b2924:     	xorq	$0x65, %rdi
1454b2928:     	orq	%rsi, %rdi
1454b292b:     	jne	0x1454b2900 <.text+0x54b1900>
1454b292d:     	movss	0x48(%r11), %xmm0
1454b2933:     	mulss	0x465db5(%rip), %xmm0   # 0x1459186f0
1454b293b:     	mulss	0x14(%r9), %xmm0
1454b2941:     	mulss	0x3c(%r9), %xmm0
1454b2947:     	movss	0x50(%r9), %xmm8
1454b294d:     	mulss	%xmm0, %xmm7
1454b2951:     	maxss	0x456c87(%rip), %xmm7   # 0x1459095e0
1454b2959:     	movl	$0x9, %edx
1454b295e:     	callq	0x1454536c0 <.text+0x54526c0>
1454b2963:     	maxss	%xmm7, %xmm0
1454b2967:     	maxss	0x460980(%rip), %xmm8   # 0x1459132f0
1454b2970:     	divss	%xmm8, %xmm0
1454b2975:     	movss	0x465ec3(%rip), %xmm1   # 0x145918840
1454b297d:     	divss	%xmm0, %xmm1
1454b2981:     	movaps	%xmm6, %xmm0
1454b2984:     	mulss	%xmm1, %xmm0
1454b2988:     	movq	0x368(%rbp), %rsi
1454b298f:     	addss	0x7ec(%rsi), %xmm0
1454b2997:     	mulss	0x454af9(%rip), %xmm1   # 0x145907498
1454b299f:     	maxss	0x46094d(%rip), %xmm1   # 0x1459132f4
1454b29a7:     	minss	%xmm1, %xmm0
1454b29ab:     	movss	%xmm0, 0x7ec(%rsi)
1454b29b3:     	movq	%rsi, %rcx
1454b29b6:     	callq	0x1454e91d0 <.text+0x54e81d0>
1454b29bb:     	movq	0x2b8(%rsi), %rcx
1454b29c2:     	testq	%rcx, %rcx
1454b29c5:     	je	0x1454b2c5e <.text+0x54b1c5e>
1454b29cb:     	movq	0x368(%rbp), %rax
1454b29d2:     	movq	0x2b0(%rax), %rax
1454b29d9:     	imulq	$0x58, %rcx, %rdx
1454b29dd:     	leaq	(%rax,%rdx), %rcx
1454b29e1:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454b29eb:     	movq	%rax, %r9
1454b29ee:     	jmp	0x1454b29fd <.text+0x54b19fd>
1454b29f0:     	addq	$0x58, %r9
1454b29f4:     	cmpq	%rcx, %r9
1454b29f7:     	je	0x1454b2c1e <.text+0x54b1c1e>
1454b29fd:     	movq	(%r9), %r10
1454b2a00:     	cmpq	$0x9, 0x8(%r10)
1454b2a05:     	jne	0x1454b29f0 <.text+0x54b19f0>
1454b2a07:     	movq	(%r10), %r10
1454b2a0a:     	movq	(%r10), %r11
1454b2a0d:     	xorq	%r8, %r11
1454b2a10:     	movzbl	0x8(%r10), %r10d
1454b2a15:     	xorq	$0x65, %r10
1454b2a19:     	orq	%r11, %r10
1454b2a1c:     	jne	0x1454b29f0 <.text+0x54b19f0>
1454b2a1e:     	movq	0x368(%rbp), %rsi
1454b2a25:     	movq	%rsi, %rcx
1454b2a28:     	callq	0x1454e7d80 <.text+0x54e6d80>
1454b2a2d:     	movss	0x934(%rsi), %xmm0
1454b2a35:     	movss	%xmm0, 0x2b8(%rbp)
1454b2a3d:     	leaq	0x750(%rsi), %rdi
1454b2a44:     	movq	0x750(%rsi), %rax
1454b2a4b:     	movq	0x758(%rsi), %rcx
1454b2a52:     	movq	0x760(%rsi), %rdx
1454b2a59:     	movq	$0x0, 0x750(%rsi)
1454b2a64:     	movq	$0x8, 0x758(%rsi)
1454b2a6f:     	movq	$0x0, 0x760(%rsi)
1454b2a7a:     	leaq	(%rdx,%rdx,2), %rdx
1454b2a7e:     	leaq	(%rcx,%rdx,8), %rdx
1454b2a82:     	movq	%rcx, 0x240(%rbp)
1454b2a89:     	movq	%rax, 0x250(%rbp)
1454b2a90:     	movq	%rcx, 0x248(%rbp)
1454b2a97:     	movq	%rdx, 0x258(%rbp)
1454b2a9e:     	leaq	0xb0(%rbp), %rcx
1454b2aa5:     	leaq	0x240(%rbp), %rdx
1454b2aac:     	leaq	0x2b8(%rbp), %r8
1454b2ab3:     	callq	0x14555a430 <.text+0x5559430>
1454b2ab8:     	movq	0xb0(%rbp), %rax
1454b2abf:     	movq	%rax, 0x340(%rbp)
1454b2ac6:     	movq	0xb8(%rbp), %r14
1454b2acd:     	movq	0xc0(%rbp), %rbx
1454b2ad4:     	movq	0xd8(%rbp), %rax
1454b2adb:     	movq	%rax, 0x250(%rbp)
1454b2ae2:     	movups	0xc8(%rbp), %xmm0
1454b2ae9:     	movaps	%xmm0, 0x240(%rbp)
1454b2af0:     	movq	0x750(%rsi), %rax
1454b2af7:     	testq	%rax, %rax
1454b2afa:     	je	0x1454b2b16 <.text+0x54b1b16>
1454b2afc:     	movq	0x758(%rsi), %rcx
1454b2b03:     	shlq	$0x3, %rax
1454b2b07:     	leaq	(%rax,%rax,2), %rdx
1454b2b0b:     	movl	$0x8, %r8d
1454b2b11:     	callq	0x1400021d0 <.text+0x11d0>
1454b2b16:     	movq	0x250(%rbp), %rax
1454b2b1d:     	movq	%rax, 0x10(%rdi)
1454b2b21:     	movaps	0x240(%rbp), %xmm0
1454b2b28:     	movups	%xmm0, (%rdi)
1454b2b2b:     	testq	%rbx, %rbx
1454b2b2e:     	je	0x1454b2bd7 <.text+0x54b1bd7>
1454b2b34:     	shlq	$0x3, %rbx
1454b2b38:     	leaq	(%rbx,%rbx,2), %rdi
1454b2b3c:     	xorl	%ebx, %ebx
1454b2b3e:     	movq	%r14, 0x358(%rbp)
1454b2b45:     	nopw	%cs:(%rax,%rax)
1454b2b50:     	movzbl	0x10(%r14,%rbx), %eax
1454b2b56:     	cmpb	$0x2, %al
1454b2b58:     	je	0x1454b2bd7 <.text+0x54b1bd7>
1454b2b5a:     	movss	0xc(%r14,%rbx), %xmm2
1454b2b61:     	movq	(%r14,%rbx), %rdx
1454b2b65:     	movq	0x368(%rbp), %r14
1454b2b6c:     	movb	0x129(%r14), %sil
1454b2b73:     	movb	$0x3, 0x129(%r14)
1454b2b7b:     	movups	0x20(%r14), %xmm7
1454b2b80:     	movups	0x40(%r14), %xmm8
1454b2b85:     	movq	$0x0, 0x20(%r14)
1454b2b8d:     	movq	$0x0, 0x40(%r14)
1454b2b95:     	movb	%al, 0x28(%rsp)
1454b2b99:     	movb	$0x0, 0x30(%rsp)
1454b2b9e:     	movb	$0x2, 0x20(%rsp)
1454b2ba3:     	movq	%r14, %rcx
1454b2ba6:     	movl	$0x18d1, %r9d           # imm = 0x18D1
1454b2bac:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b2bb1:     	nop
1454b2bb2:     	movb	%sil, 0x129(%r14)
1454b2bb9:     	movups	%xmm7, 0x20(%r14)
1454b2bbe:     	movups	%xmm8, 0x40(%r14)
1454b2bc3:     	addq	$0x18, %rbx
1454b2bc7:     	cmpq	%rbx, %rdi
1454b2bca:     	movq	0x358(%rbp), %r14
1454b2bd1:     	jne	0x1454b2b50 <.text+0x54b1b50>
1454b2bd7:     	movq	0x340(%rbp), %rax
1454b2bde:     	testq	%rax, %rax
1454b2be1:     	je	0x1454b2bf9 <.text+0x54b1bf9>
1454b2be3:     	shlq	$0x3, %rax
1454b2be7:     	leaq	(%rax,%rax,2), %rdx
1454b2beb:     	movl	$0x8, %r8d
1454b2bf1:     	movq	%r14, %rcx
1454b2bf4:     	callq	0x1400021d0 <.text+0x11d0>
1454b2bf9:     	movq	0x368(%rbp), %rax
1454b2c00:     	movq	0x2b8(%rax), %rcx
1454b2c07:     	testq	%rcx, %rcx
1454b2c0a:     	je	0x1454b2c5e <.text+0x54b1c5e>
1454b2c0c:     	movq	0x368(%rbp), %rax
1454b2c13:     	movq	0x2b0(%rax), %rax
1454b2c1a:     	imulq	$0x58, %rcx, %rdx
1454b2c1e:     	addq	%rax, %rdx
1454b2c21:     	jmp	0x1454b2c39 <.text+0x54b1c39>
1454b2c23:     	nopw	%cs:(%rax,%rax)
1454b2c30:     	addq	$0x58, %rax
1454b2c34:     	cmpq	%rdx, %rax
1454b2c37:     	je	0x1454b2c5e <.text+0x54b1c5e>
1454b2c39:     	movq	(%rax), %rcx
1454b2c3c:     	cmpq	$0xa, 0x8(%rcx)
1454b2c41:     	jne	0x1454b2c30 <.text+0x54b1c30>
1454b2c43:     	movq	(%rcx), %rcx
1454b2c46:     	movq	(%rcx), %r8
1454b2c49:     	xorq	%r13, %r8
1454b2c4c:     	movzwl	0x8(%rcx), %ecx
1454b2c50:     	xorq	$0x6e6f, %rcx           # imm = 0x6E6F
1454b2c57:     	orq	%r8, %rcx
1454b2c5a:     	jne	0x1454b2c30 <.text+0x54b1c30>
1454b2c5c:     	jmp	0x1454b2c73 <.text+0x54b1c73>
1454b2c5e:     	movq	0x368(%rbp), %rax
1454b2c65:     	cmpq	$0x0, 0x778(%rax)
1454b2c6d:     	je	0x1454b317c <.text+0x54b217c>
1454b2c73:     	movq	0x368(%rbp), %rax
1454b2c7a:     	movss	0x934(%rax), %xmm7
1454b2c82:     	leaq	0x550(%rax), %rbx
1454b2c89:     	leaq	0x2f4(%rbp), %rsi
1454b2c90:     	movss	0x76674b(%rip), %xmm8   # 0x145c193e4
1454b2c99:     	leaq	0x240(%rbp), %r15
1454b2ca0:     	movss	0x465a47(%rip), %xmm10  # 0x1459186f0
1454b2ca9:     	movss	0x5556ee(%rip), %xmm12  # 0x145a083a0
1454b2cb2:     	movq	0x778(%rax), %rdi
1454b2cb9:     	testq	%rdi, %rdi
1454b2cbc:     	je	0x1454b317c <.text+0x54b217c>
1454b2cc2:     	movq	0x368(%rbp), %rax
1454b2cc9:     	movq	0x770(%rax), %rax
1454b2cd0:     	movq	%rdi, %r8
1454b2cd3:     	shlq	$0x5, %r8
1454b2cd7:     	xorl	%r9d, %r9d
1454b2cda:     	nopw	(%rax,%rax)
1454b2ce0:     	ucomiss	0x8(%rax,%r9), %xmm7
1454b2ce6:     	jae	0x1454b2cf6 <.text+0x54b1cf6>
1454b2ce8:     	addq	$0x20, %r9
1454b2cec:     	cmpq	%r9, %r8
1454b2cef:     	jne	0x1454b2ce0 <.text+0x54b1ce0>
1454b2cf1:     	jmp	0x1454b317c <.text+0x54b217c>
1454b2cf6:     	leaq	(%rax,%r9), %rcx
1454b2cfa:     	movq	(%rax,%r9), %r12
1454b2cfe:     	movups	0x8(%rax,%r9), %xmm0
1454b2d04:     	movaps	%xmm0, 0x2f0(%rbp)
1454b2d0b:     	movl	0x18(%rax,%r9), %r14d
1454b2d10:     	leaq	(%rax,%r9), %rdx
1454b2d14:     	addq	$0x20, %rdx
1454b2d18:     	subq	%r9, %r8
1454b2d1b:     	addq	$-0x20, %r8
1454b2d1f:     	callq	0x1457731e1 <.text+0x57721e1>
1454b2d24:     	decq	%rdi
1454b2d27:     	movq	0x368(%rbp), %rax
1454b2d2e:     	movq	%rdi, 0x778(%rax)
1454b2d35:     	movq	0x2b8(%rax), %rcx
1454b2d3c:     	testq	%rcx, %rcx
1454b2d3f:     	je	0x1454b315b <.text+0x54b215b>
1454b2d45:     	movq	0x368(%rbp), %rax
1454b2d4c:     	movq	0x2b0(%rax), %rax
1454b2d53:     	imulq	$0x58, %rcx, %rdx
1454b2d57:     	xorl	%ecx, %ecx
1454b2d59:     	jmp	0x1454b2d6d <.text+0x54b1d6d>
1454b2d5b:     	nopl	(%rax,%rax)
1454b2d60:     	addq	$0x58, %rcx
1454b2d64:     	cmpq	%rcx, %rdx
1454b2d67:     	je	0x1454b315b <.text+0x54b215b>
1454b2d6d:     	movq	(%rax,%rcx), %rdi
1454b2d71:     	cmpq	$0xa, 0x8(%rdi)
1454b2d76:     	jne	0x1454b2d60 <.text+0x54b1d60>
1454b2d78:     	movq	(%rdi), %r8
1454b2d7b:     	movq	(%r8), %r9
1454b2d7e:     	xorq	%r13, %r9
1454b2d81:     	movzwl	0x8(%r8), %r8d
1454b2d86:     	xorq	$0x6e6f, %r8            # imm = 0x6E6F
1454b2d8d:     	orq	%r9, %r8
1454b2d90:     	jne	0x1454b2d60 <.text+0x54b1d60>
1454b2d92:     	movss	0x10(%rax,%rcx), %xmm15
1454b2d99:     	movss	0x1c(%rax,%rcx), %xmm0
1454b2d9f:     	movss	0x38(%rax,%rcx), %xmm14
1454b2da6:     	movss	0x4c(%rax,%rcx), %xmm9
1454b2dad:     	movq	0x368(%rbp), %rdx
1454b2db4:     	movss	0x470(%rdx), %xmm1
1454b2dbc:     	movss	%xmm1, 0x338(%rbp)
1454b2dc4:     	movss	0x474(%rdx), %xmm13
1454b2dcd:     	mulss	0x44(%rax,%rcx), %xmm0
1454b2dd3:     	movl	0x8(%rsi), %eax
1454b2dd6:     	movl	%eax, 0xb8(%rbp)
1454b2ddc:     	movq	(%rsi), %rax
1454b2ddf:     	movq	%rax, 0xb0(%rbp)
1454b2de6:     	mulss	0x50(%rdi), %xmm0
1454b2deb:     	movss	0x498(%rdx), %xmm1
1454b2df3:     	mulss	%xmm1, %xmm0
1454b2df7:     	ucomiss	%xmm0, %xmm8
1454b2dfb:     	jae	0x1454b2e32 <.text+0x54b1e32>
1454b2dfd:     	addss	0x15273fb(%rip), %xmm0  # 0x1469da200
1454b2e05:     	movaps	%xmm10, %xmm11
1454b2e09:     	movaps	%xmm8, %xmm10
1454b2e0d:     	movss	0x4629ea(%rip), %xmm8   # 0x145915800
1454b2e16:     	divss	%xmm8, %xmm0
1454b2e1b:     	callq	0x145773367 <.text+0x5772367>
1454b2e20:     	mulss	%xmm8, %xmm0
1454b2e25:     	movaps	%xmm10, %xmm8
1454b2e29:     	movaps	%xmm11, %xmm10
1454b2e2d:     	addss	%xmm8, %xmm0
1454b2e32:     	movq	%r12, 0x2b8(%rbp)
1454b2e39:     	leaq	0x2b8(%rbp), %rax
1454b2e40:     	movq	%rax, 0x20(%rsp)
1454b2e45:     	movq	$0x1, 0x28(%rsp)
1454b2e4e:     	movq	%r15, %rcx
1454b2e51:     	movq	0x368(%rbp), %rsi
1454b2e58:     	movq	%rsi, %rdx
1454b2e5b:     	leaq	0xb0(%rbp), %r8
1454b2e62:     	movaps	%xmm0, %xmm3
1454b2e65:     	callq	0x145500300 <.text+0x54ff300>
1454b2e6a:     	movq	0x4e0(%rsi), %rcx
1454b2e71:     	imulq	$0x160, 0x4e8(%rsi), %rax # imm = 0x160
1454b2e7c:     	nopl	(%rax)
1454b2e80:     	testq	%rax, %rax
1454b2e83:     	je	0x1454b2f5c <.text+0x54b1f5c>
1454b2e89:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454b2e8f:     	cmpq	%r12, 0x88(%rcx)
1454b2e96:     	leaq	0x160(%rcx), %rcx
1454b2e9d:     	jne	0x1454b2e80 <.text+0x54b1e80>
1454b2e9f:     	movq	0x248(%rbp), %r9
1454b2ea6:     	movq	0x250(%rbp), %rax
1454b2ead:     	movl	$0x2, 0x2b8(%rbp)
1454b2eb7:     	movl	$0x0, 0x220(%rbp)
1454b2ec1:     	movq	%r9, 0x18(%rbp)
1454b2ec5:     	movb	$0x1, 0x326(%rbp)
1454b2ecc:     	leaq	0x220(%rbp), %rcx
1454b2ed3:     	movq	%rcx, 0x30(%rsp)
1454b2ed8:     	leaq	0x2b8(%rbp), %rcx
1454b2edf:     	movq	%rcx, 0x28(%rsp)
1454b2ee4:     	movq	%rax, 0x20(%rsp)
1454b2ee9:     	leaq	0xb0(%rbp), %rcx
1454b2ef0:     	movq	%r12, %rdx
1454b2ef3:     	movl	$0x3b85, %r8d           # imm = 0x3B85
1454b2ef9:     	movq	%r9, 0x358(%rbp)
1454b2f00:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b2f05:     	nop
1454b2f06:     	movq	0x368(%rbp), %rax
1454b2f0d:     	movq	0x560(%rax), %rsi
1454b2f14:     	cmpq	0x550(%rax), %rsi
1454b2f1b:     	jne	0x1454b2f26 <.text+0x54b1f26>
1454b2f1d:     	movq	%rbx, %rcx
1454b2f20:     	callq	0x145774710 <.text+0x5773710>
1454b2f25:     	nop
1454b2f26:     	movq	0x368(%rbp), %rdx
1454b2f2d:     	movq	0x558(%rdx), %rax
1454b2f34:     	movq	%rsi, %rcx
1454b2f37:     	shlq	$0x5, %rcx
1454b2f3b:     	movups	0xb0(%rbp), %xmm0
1454b2f42:     	movups	0xc0(%rbp), %xmm1
1454b2f49:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b2f4e:     	movups	%xmm0, (%rax,%rcx)
1454b2f52:     	incq	%rsi
1454b2f55:     	movq	%rsi, 0x560(%rdx)
1454b2f5c:     	movq	%rbx, 0x348(%rbp)
1454b2f63:     	movss	0x44(%rdi), %xmm0
1454b2f68:     	movzbl	0x75(%rdi), %eax
1454b2f6c:     	addb	$-0x2, %al
1454b2f6e:     	movss	0x45451a(%rip), %xmm1   # 0x145907490
1454b2f76:     	cmpb	$0x7, %al
1454b2f78:     	jae	0x1454b2f89 <.text+0x54b1f89>
1454b2f7a:     	movzbl	%al, %eax
1454b2f7d:     	leaq	0x15455b0(%rip), %rcx   # 0x1469f8534
1454b2f84:     	movss	(%rcx,%rax,4), %xmm1
1454b2f89:     	movaps	%xmm0, %xmm2
1454b2f8c:     	movaps	%xmm10, %xmm11
1454b2f90:     	mulss	%xmm10, %xmm2
1454b2f95:     	movq	0x368(%rbp), %rsi
1454b2f9c:     	movl	0x7fc(%rsi), %r12d
1454b2fa3:     	movl	%r14d, 0x7fc(%rsi)
1454b2faa:     	movq	0x240(%rbp), %rax
1454b2fb1:     	movq	%rax, 0x340(%rbp)
1454b2fb8:     	movq	0x248(%rbp), %rax
1454b2fbf:     	movq	%rax, 0x358(%rbp)
1454b2fc6:     	movq	0x250(%rbp), %r14
1454b2fcd:     	testq	%r14, %r14
1454b2fd0:     	je	0x1454b3112 <.text+0x54b2112>
1454b2fd6:     	mulss	0x338(%rbp), %xmm9
1454b2fdf:     	xorps	%xmm3, %xmm3
1454b2fe2:     	cmpltss	%xmm0, %xmm3
1454b2fe7:     	andps	%xmm9, %xmm3
1454b2feb:     	mulss	%xmm2, %xmm15
1454b2ff0:     	mulss	%xmm15, %xmm14
1454b2ff5:     	mulss	%xmm1, %xmm14
1454b2ffa:     	addss	%xmm3, %xmm14
1454b2fff:     	mulss	%xmm14, %xmm13
1454b3004:     	shlq	$0x3, %r14
1454b3008:     	movzbl	0x129(%rsi), %r15d
1454b3010:     	movups	0x20(%rsi), %xmm9
1454b3015:     	movups	0x40(%rsi), %xmm10
1454b301a:     	xorl	%ebx, %ebx
1454b301c:     	nopl	(%rax)
1454b3020:     	movq	0x358(%rbp), %rax
1454b3027:     	movq	(%rax,%rbx), %rdx
1454b302b:     	movq	0x8a0(%rsi), %rax
1454b3032:     	movq	0x8b8(%rsi), %rcx
1454b3039:     	leaq	(%rcx,%rax), %r8
1454b303d:     	rolq	$0x17, %r8
1454b3041:     	addq	%rax, %r8
1454b3044:     	movq	0x8a8(%rsi), %r9
1454b304b:     	movq	%r9, %r10
1454b304e:     	shlq	$0x11, %r10
1454b3052:     	movq	0x8b0(%rsi), %r11
1454b3059:     	xorq	%rax, %r11
1454b305c:     	xorq	%r9, %rcx
1454b305f:     	xorq	%r11, %r9
1454b3062:     	movq	%r9, 0x8a8(%rsi)
1454b3069:     	xorq	%rcx, %rax
1454b306c:     	movq	%rax, 0x8a0(%rsi)
1454b3073:     	xorq	%r10, %r11
1454b3076:     	movq	%r11, 0x8b0(%rsi)
1454b307d:     	rolq	$0x2d, %rcx
1454b3081:     	movq	%rcx, 0x8b8(%rsi)
1454b3088:     	shrq	$0x28, %r8
1454b308c:     	xorps	%xmm0, %xmm0
1454b308f:     	cvtsi2ss	%r8d, %xmm0
1454b3094:     	mulss	%xmm12, %xmm0
1454b3099:     	movss	0x47c(%rsi), %xmm1
1454b30a1:     	movss	0x480(%rsi), %xmm2
1454b30a9:     	mulss	%xmm13, %xmm2
1454b30ae:     	movl	0x40(%rdi), %r9d
1454b30b2:     	movzbl	0x74(%rdi), %eax
1454b30b6:     	movb	$0x3, 0x129(%rsi)
1454b30bd:     	movq	$0x0, 0x20(%rsi)
1454b30c5:     	movq	$0x0, 0x40(%rsi)
1454b30cd:     	ucomiss	%xmm0, %xmm1
1454b30d0:     	ja	0x1454b30d6 <.text+0x54b20d6>
1454b30d2:     	movaps	%xmm13, %xmm2
1454b30d6:     	seta	0x28(%rsp)
1454b30db:     	movb	%al, 0x20(%rsp)
1454b30df:     	movb	$0x0, 0x30(%rsp)
1454b30e4:     	movq	0x368(%rbp), %rsi
1454b30eb:     	movq	%rsi, %rcx
1454b30ee:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b30f3:     	nop
1454b30f4:     	movb	%r15b, 0x129(%rsi)
1454b30fb:     	movups	%xmm9, 0x20(%rsi)
1454b3100:     	movups	%xmm10, 0x40(%rsi)
1454b3105:     	addq	$0x8, %rbx
1454b3109:     	cmpq	%rbx, %r14
1454b310c:     	jne	0x1454b3020 <.text+0x54b2020>
1454b3112:     	movq	0x340(%rbp), %rdx
1454b3119:     	testq	%rdx, %rdx
1454b311c:     	je	0x1454b3134 <.text+0x54b2134>
1454b311e:     	shlq	$0x3, %rdx
1454b3122:     	movl	$0x8, %r8d
1454b3128:     	movq	0x358(%rbp), %rcx
1454b312f:     	callq	0x1400021d0 <.text+0x11d0>
1454b3134:     	movq	0x368(%rbp), %rax
1454b313b:     	movl	%r12d, 0x7fc(%rax)
1454b3142:     	movq	0x348(%rbp), %rbx
1454b3149:     	leaq	0x2f4(%rbp), %rsi
1454b3150:     	leaq	0x240(%rbp), %r15
1454b3157:     	movaps	%xmm11, %xmm10
1454b315b:     	movq	0x368(%rbp), %rax
1454b3162:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b316c:     	movq	0x778(%rax), %rdi
1454b3173:     	testq	%rdi, %rdi
1454b3176:     	jne	0x1454b2cc2 <.text+0x54b1cc2>
1454b317c:     	movq	0x368(%rbp), %r13
1454b3183:     	movq	0x2b8(%r13), %rcx
1454b318a:     	testq	%rcx, %rcx
1454b318d:     	je	0x1454b4009 <.text+0x54b3009>
1454b3193:     	movq	0x2b0(%r13), %rax
1454b319a:     	imulq	$0x58, %rcx, %rcx
1454b319e:     	xorl	%r8d, %r8d
1454b31a1:     	movabsq	$0x5f737265746e7568, %rdx # imm = 0x5F737265746E7568
1454b31ab:     	jmp	0x1454b31bd <.text+0x54b21bd>
1454b31ad:     	nopl	(%rax)
1454b31b0:     	addq	$0x58, %r8
1454b31b4:     	cmpq	%r8, %rcx
1454b31b7:     	je	0x1454b34a6 <.text+0x54b24a6>
1454b31bd:     	movq	(%rax,%r8), %r9
1454b31c1:     	cmpq	$0xc, 0x8(%r9)
1454b31c6:     	jne	0x1454b31b0 <.text+0x54b21b0>
1454b31c8:     	movq	(%r9), %r9
1454b31cb:     	movq	(%r9), %r10
1454b31ce:     	xorq	%rdx, %r10
1454b31d1:     	movl	0x8(%r9), %r9d
1454b31d5:     	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454b31dc:     	orq	%r10, %r9
1454b31df:     	jne	0x1454b31b0 <.text+0x54b21b0>
1454b31e1:     	xorl	%r8d, %r8d
1454b31e4:     	jmp	0x1454b31fd <.text+0x54b21fd>
1454b31e6:     	nopw	%cs:(%rax,%rax)
1454b31f0:     	addq	$0x58, %r8
1454b31f4:     	cmpq	%r8, %rcx
1454b31f7:     	je	0x1454b34a6 <.text+0x54b24a6>
1454b31fd:     	movq	(%rax,%r8), %rbx
1454b3201:     	cmpq	$0xc, 0x8(%rbx)
1454b3206:     	jne	0x1454b31f0 <.text+0x54b21f0>
1454b3208:     	movq	(%rbx), %r9
1454b320b:     	movq	(%r9), %r10
1454b320e:     	xorq	%rdx, %r10
1454b3211:     	movl	0x8(%r9), %r9d
1454b3215:     	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454b321c:     	orq	%r10, %r9
1454b321f:     	jne	0x1454b31f0 <.text+0x54b21f0>
1454b3221:     	movss	0x10(%rax,%r8), %xmm0
1454b3228:     	mulss	0x38(%rax,%r8), %xmm0
1454b322f:     	movss	0x934(%r13), %xmm8
1454b3238:     	xorps	%xmm7, %xmm7
1454b323b:     	sqrtss	%xmm0, %xmm7
1454b323f:     	mulss	0x4542d5(%rip), %xmm7   # 0x14590751c
1454b3247:     	minss	0x48ca25(%rip), %xmm7   # 0x14593fc74
1454b324f:     	movq	0x7c8(%r13), %r14
1454b3256:     	movss	0x4c(%rbx), %xmm1
1454b325b:     	movl	$0x8, %r8d
1454b3261:     	movq	%r13, %rcx
1454b3264:     	xorl	%r9d, %r9d
1454b3267:     	callq	0x1454e78f0 <.text+0x54e68f0>
1454b326c:     	movq	%rax, %r15
1454b326f:     	movq	%rdx, %rdi
1454b3272:     	testq	%r14, %r14
1454b3275:     	je	0x1454b338a <.text+0x54b238a>
1454b327b:     	movq	%r12, %rsi
1454b327e:     	movss	0x4c(%rbx), %xmm9
1454b3284:     	movss	0x934(%r13), %xmm2
1454b328d:     	movq	0x4e0(%r13), %r12
1454b3294:     	movq	0x4e8(%r13), %r13
1454b329b:     	leaq	-0x160(%r12), %rcx
1454b32a3:     	imulq	$0x160, %r13, %rax      # imm = 0x160
1454b32aa:     	testq	%rax, %rax
1454b32ad:     	je	0x1454b3333 <.text+0x54b2333>
1454b32b3:     	leaq	0x160(%rcx), %rdx
1454b32ba:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454b32c0:     	cmpq	%r14, 0x1e8(%rcx)
1454b32c7:     	movq	%rdx, %rcx
1454b32ca:     	jne	0x1454b32aa <.text+0x54b22aa>
1454b32cc:     	cmpl	$0x0, 0x68(%rdx)
1454b32d0:     	jne	0x1454b3333 <.text+0x54b2333>
1454b32d2:     	ucomiss	0x140(%rdx), %xmm2
1454b32d9:     	jb	0x1454b3333 <.text+0x54b2333>
1454b32db:     	cmpq	$-0x1, 0x40(%rdx)
1454b32e0:     	je	0x1454b32e8 <.text+0x54b22e8>
1454b32e2:     	cmpb	$0x0, 0x60(%rdx)
1454b32e6:     	je	0x1454b3333 <.text+0x54b2333>
1454b32e8:     	leaq	0xb0(%rbp), %rcx
1454b32ef:     	callq	0x145450a50 <.text+0x544fa50>
1454b32f4:     	movq	0x368(%rbp), %rax
1454b32fb:     	movsd	0x400(%rax), %xmm0
1454b3303:     	movsd	0xb0(%rbp), %xmm1
1454b330b:     	subps	%xmm1, %xmm0
1454b330e:     	mulps	%xmm0, %xmm0
1454b3311:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b3315:     	addss	%xmm0, %xmm1
1454b3319:     	xorps	%xmm0, %xmm0
1454b331c:     	sqrtss	%xmm1, %xmm0
1454b3320:     	mulss	0x4980af(%rip), %xmm9   # 0x14594b3d8
1454b3329:     	ucomiss	%xmm0, %xmm9
1454b332d:     	jae	0x1454b3f2a <.text+0x54b2f2a>
1454b3333:     	imulq	$0x160, %r13, %rcx      # imm = 0x160
1454b333a:     	xorl	%eax, %eax
1454b333c:     	movq	%r12, %rdx
1454b333f:     	movq	0x368(%rbp), %r13
1454b3346:     	cmpq	%rax, %rcx
1454b3349:     	je	0x1454b336a <.text+0x54b236a>
1454b334b:     	addq	$0x160, %rax            # imm = 0x160
1454b3351:     	cmpq	%r14, 0x88(%rdx)
1454b3358:     	leaq	0x160(%rdx), %rdx
1454b335f:     	jne	0x1454b3346 <.text+0x54b2346>
1454b3361:     	movl	$0x0, -0x24(%r12,%rax)
1454b336a:     	movl	0x40(%rbx), %r8d
1454b336e:     	movq	%r13, %rcx
1454b3371:     	movq	%r14, %rdx
1454b3374:     	xorl	%r9d, %r9d
1454b3377:     	callq	0x1454e3550 <.text+0x54e2550>
1454b337c:     	movq	$0x0, 0x7c8(%r13)
1454b3387:     	movq	%rsi, %r12
1454b338a:     	movss	0x800(%r13), %xmm0
1454b3393:     	ucomiss	%xmm8, %xmm0
1454b3397:     	ja	0x1454b34a6 <.text+0x54b24a6>
1454b339d:     	testb	$0x1, %r15b
1454b33a1:     	je	0x1454b34a6 <.text+0x54b24a6>
1454b33a7:     	movq	0x4e0(%r13), %rax
1454b33ae:     	imulq	$0x160, 0x4e8(%r13), %rdx # imm = 0x160
1454b33b9:     	xorl	%ecx, %ecx
1454b33bb:     	movq	%rax, %r8
1454b33be:     	cmpq	%rcx, %rdx
1454b33c1:     	je	0x1454b33e0 <.text+0x54b23e0>
1454b33c3:     	addq	$0x160, %rcx            # imm = 0x160
1454b33ca:     	cmpq	%rdi, 0x88(%r8)
1454b33d1:     	leaq	0x160(%r8), %r8
1454b33d8:     	jne	0x1454b33be <.text+0x54b23be>
1454b33da:     	movss	%xmm7, -0x24(%rax,%rcx)
1454b33e0:     	movq	%rdi, 0x7c8(%r13)
1454b33e7:     	movq	0x3e8(%r13), %rdx
1454b33ee:     	movl	0x40(%rbx), %r8d
1454b33f2:     	movq	%rdi, 0x2f0(%rbp)
1454b33f9:     	movq	%rdi, 0x248(%rbp)
1454b3400:     	movl	$0x0, 0x240(%rbp)
1454b340a:     	movl	$0x0, 0x2b8(%rbp)
1454b3414:     	leaq	0x2b8(%rbp), %rax
1454b341b:     	movq	%rax, 0x30(%rsp)
1454b3420:     	leaq	0x240(%rbp), %rax
1454b3427:     	movq	%rax, 0x28(%rsp)
1454b342c:     	movq	$0x1, 0x20(%rsp)
1454b3435:     	leaq	0xb0(%rbp), %rcx
1454b343c:     	leaq	0x2f0(%rbp), %r9
1454b3443:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b3448:     	movq	0x560(%r13), %rsi
1454b344f:     	cmpq	0x550(%r13), %rsi
1454b3456:     	jne	0x1454b3465 <.text+0x54b2465>
1454b3458:     	leaq	0x550(%r13), %rcx
1454b345f:     	callq	0x145774710 <.text+0x5773710>
1454b3464:     	nop
1454b3465:     	movq	0x558(%r13), %rax
1454b346c:     	movq	%rsi, %rcx
1454b346f:     	shlq	$0x5, %rcx
1454b3473:     	movups	0xb0(%rbp), %xmm0
1454b347a:     	movups	0xc0(%rbp), %xmm1
1454b3481:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b3486:     	movups	%xmm0, (%rax,%rcx)
1454b348a:     	incq	%rsi
1454b348d:     	movq	%rsi, 0x560(%r13)
1454b3494:     	movl	0x40(%rbx), %r8d
1454b3498:     	movq	%r13, %rcx
1454b349b:     	movq	%rdi, %rdx
1454b349e:     	movb	$0x1, %r9b
1454b34a1:     	callq	0x1454e3550 <.text+0x54e2550>
1454b34a6:     	movq	0x2b8(%r13), %r8
1454b34ad:     	testq	%r8, %r8
1454b34b0:     	je	0x1454b4009 <.text+0x54b3009>
1454b34b6:     	movq	0x2b0(%r13), %rax
1454b34bd:     	imulq	$0x58, %r8, %r10
1454b34c1:     	xorl	%r9d, %r9d
1454b34c4:     	movabsq	$0x665f656972656166, %rcx # imm = 0x665F656972656166
1454b34ce:     	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1454b34d8:     	jmp	0x1454b34ed <.text+0x54b24ed>
1454b34da:     	nopw	(%rax,%rax)
1454b34e0:     	addq	$0x58, %r9
1454b34e4:     	cmpq	%r9, %r10
1454b34e7:     	je	0x1454b3cd8 <.text+0x54b2cd8>
1454b34ed:     	movq	(%rax,%r9), %r11
1454b34f1:     	cmpq	$0xb, 0x8(%r11)
1454b34f6:     	jne	0x1454b34e0 <.text+0x54b24e0>
1454b34f8:     	movq	(%r11), %r11
1454b34fb:     	movq	(%r11), %rsi
1454b34fe:     	xorq	%rcx, %rsi
1454b3501:     	movq	0x3(%r11), %r11
1454b3505:     	xorq	%rdx, %r11
1454b3508:     	orq	%rsi, %r11
1454b350b:     	jne	0x1454b34e0 <.text+0x54b24e0>
1454b350d:     	movq	0x790(%r13), %r9
1454b3514:     	testq	%r9, %r9
1454b3517:     	je	0x1454b361f <.text+0x54b261f>
1454b351d:     	movq	0x788(%r13), %rax
1454b3524:     	shlq	$0x4, %r9
1454b3528:     	movss	0x453fd8(%rip), %xmm0   # 0x145907508
1454b3530:     	mulss	%xmm6, %xmm0
1454b3534:     	leaq	-0x10(%r9), %r10
1454b3538:     	movq	%rax, %r8
1454b353b:     	cmpq	$0x40, %r10
1454b353f:     	jb	0x1454b35d9 <.text+0x54b25d9>
1454b3545:     	shrq	$0x4, %r10
1454b3549:     	incq	%r10
1454b354c:     	movl	%r10d, %r8d
1454b354f:     	andl	$0x3, %r8d
1454b3553:     	movl	$0x4, %r11d
1454b3559:     	cmovneq	%r8, %r11
1454b355d:     	subq	%r11, %r10
1454b3560:     	movq	%r10, %r8
1454b3563:     	shlq	$0x4, %r8
1454b3567:     	addq	%rax, %r8
1454b356a:     	movaps	%xmm0, %xmm1
1454b356d:     	shufps	$0x0, %xmm0, %xmm1      # xmm1 = xmm1[0,0],xmm0[0,0]
1454b3571:     	leaq	0x38(%rax), %r11
1454b3575:     	movaps	0x15427b4(%rip), %xmm2  # 0x1469f5d30
1454b357c:     	nopl	(%rax)
1454b3580:     	movss	-0x30(%r11), %xmm3
1454b3586:     	movss	-0x20(%r11), %xmm4
1454b358c:     	unpcklps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
1454b358f:     	movss	-0x10(%r11), %xmm4
1454b3595:     	movss	(%r11), %xmm5
1454b359a:     	unpcklps	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
1454b359d:     	movlhps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0]
1454b35a0:     	addps	%xmm1, %xmm3
1454b35a3:     	minps	%xmm2, %xmm3
1454b35a6:     	movaps	%xmm3, %xmm4
1454b35a9:     	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
1454b35ad:     	movaps	%xmm3, %xmm7
1454b35b0:     	unpckhpd	%xmm3, %xmm7            # xmm7 = xmm7[1],xmm3[1]
1454b35b4:     	shufps	$0xff, %xmm3, %xmm3     # xmm3 = xmm3[3,3,3,3]
1454b35b8:     	movss	%xmm4, -0x30(%r11)
1454b35be:     	movss	%xmm5, -0x20(%r11)
1454b35c4:     	movss	%xmm7, -0x10(%r11)
1454b35ca:     	movss	%xmm3, (%r11)
1454b35cf:     	addq	$0x40, %r11
1454b35d3:     	addq	$-0x4, %r10
1454b35d7:     	jne	0x1454b3580 <.text+0x54b2580>
1454b35d9:     	addq	%r9, %rax
1454b35dc:     	movss	0x453f24(%rip), %xmm1   # 0x145907508
1454b35e4:     	nopw	%cs:(%rax,%rax)
1454b35f0:     	movss	0x8(%r8), %xmm2
1454b35f6:     	addss	%xmm0, %xmm2
1454b35fa:     	minss	%xmm1, %xmm2
1454b35fe:     	movss	%xmm2, 0x8(%r8)
1454b3604:     	addq	$0x10, %r8
1454b3608:     	cmpq	%rax, %r8
1454b360b:     	jne	0x1454b35f0 <.text+0x54b25f0>
1454b360d:     	movq	0x2b0(%r13), %rax
1454b3614:     	movq	0x2b8(%r13), %r8
1454b361b:     	imulq	$0x58, %r8, %r10
1454b361f:     	testq	%r8, %r8
1454b3622:     	je	0x1454b4009 <.text+0x54b3009>
1454b3628:     	xorl	%r9d, %r9d
1454b362b:     	jmp	0x1454b363d <.text+0x54b263d>
1454b362d:     	nopl	(%rax)
1454b3630:     	addq	$0x58, %r9
1454b3634:     	cmpq	%r9, %r10
1454b3637:     	je	0x1454b3cd8 <.text+0x54b2cd8>
1454b363d:     	movq	(%rax,%r9), %rdi
1454b3641:     	cmpq	$0xb, 0x8(%rdi)
1454b3646:     	jne	0x1454b3630 <.text+0x54b2630>
1454b3648:     	movq	(%rdi), %r11
1454b364b:     	movq	(%r11), %rsi
1454b364e:     	xorq	%rcx, %rsi
1454b3651:     	movq	0x3(%r11), %r11
1454b3655:     	xorq	%rdx, %r11
1454b3658:     	orq	%rsi, %r11
1454b365b:     	jne	0x1454b3630 <.text+0x54b2630>
1454b365d:     	movl	0x18(%rax,%r9), %r14d
1454b3662:     	movl	0x40(%rax,%r9), %ebx
1454b3667:     	movss	0x4c(%rdi), %xmm0
1454b366c:     	movss	%xmm0, 0x2f0(%rbp)
1454b3674:     	movq	0x788(%r13), %rax
1454b367b:     	movq	0x790(%r13), %rcx
1454b3682:     	shlq	$0x4, %rcx
1454b3686:     	addq	%rax, %rcx
1454b3689:     	movq	%rax, 0xb0(%rbp)
1454b3690:     	movq	%rcx, 0xb8(%rbp)
1454b3697:     	movq	%r13, 0xc0(%rbp)
1454b369e:     	leaq	0x2f0(%rbp), %rax
1454b36a5:     	movq	%rax, 0xc8(%rbp)
1454b36ac:     	leaq	0x2b8(%rbp), %rcx
1454b36b3:     	leaq	0xb0(%rbp), %rdx
1454b36ba:     	callq	0x145540fc0 <.text+0x553ffc0>
1454b36bf:     	movq	0x2b8(%rbp), %rax
1454b36c6:     	movq	%rax, 0x340(%rbp)
1454b36cd:     	movq	0x2c0(%rbp), %rax
1454b36d4:     	movq	%rax, 0x358(%rbp)
1454b36db:     	movq	0x2c8(%rbp), %rax
1454b36e2:     	testq	%rax, %rax
1454b36e5:     	je	0x1454b37f2 <.text+0x54b27f2>
1454b36eb:     	movq	0x358(%rbp), %r12
1454b36f2:     	leaq	(%r12,%rax,8), %r15
1454b36f6:     	movq	(%r12), %rdx
1454b36fa:     	movq	0x790(%r13), %rax
1454b3701:     	testq	%rax, %rax
1454b3704:     	je	0x1454b3732 <.text+0x54b2732>
1454b3706:     	movq	0x788(%r13), %rcx
1454b370d:     	leaq	0x10(%rcx), %r9
1454b3711:     	xorl	%r8d, %r8d
1454b3714:     	nopw	%cs:(%rax,%rax)
1454b3720:     	cmpq	%rdx, -0x10(%r9)
1454b3724:     	je	0x1454b3752 <.text+0x54b2752>
1454b3726:     	incq	%r8
1454b3729:     	addq	$0x10, %r9
1454b372d:     	cmpq	%r8, %rax
1454b3730:     	jne	0x1454b3720 <.text+0x54b2720>
1454b3732:     	movq	%r13, %rcx
1454b3735:     	movl	$0x302, %r8d            # imm = 0x302
1454b373b:     	xorl	%r9d, %r9d
1454b373e:     	callq	0x1454e3550 <.text+0x54e2550>
1454b3743:     	nop
1454b3744:     	addq	$0x8, %r12
1454b3748:     	cmpq	%r15, %r12
1454b374b:     	jne	0x1454b36f6 <.text+0x54b26f6>
1454b374d:     	jmp	0x1454b37f2 <.text+0x54b27f2>
1454b3752:     	leaq	0x1(%r8), %r10
1454b3756:     	cmpq	%rax, %r10
1454b3759:     	jae	0x1454b378d <.text+0x54b278d>
1454b375b:     	leal	(%rax,%r8), %esi
1454b375f:     	movq	%r8, %r11
1454b3762:     	testb	$0x1, %sil
1454b3766:     	jne	0x1454b3781 <.text+0x54b2781>
1454b3768:     	movq	%r8, %r11
1454b376b:     	cmpq	%rdx, (%r9)
1454b376e:     	je	0x1454b377d <.text+0x54b277d>
1454b3770:     	movups	(%r9), %xmm0
1454b3774:     	movups	%xmm0, -0x10(%r9)
1454b3779:     	leaq	0x1(%r8), %r11
1454b377d:     	leaq	0x2(%r8), %r10
1454b3781:     	leaq	-0x2(%rax), %r9
1454b3785:     	cmpq	%r8, %r9
1454b3788:     	movq	%r11, %r8
1454b378b:     	jne	0x1454b3796 <.text+0x54b2796>
1454b378d:     	movq	%r8, 0x790(%r13)
1454b3794:     	jmp	0x1454b3732 <.text+0x54b2732>
1454b3796:     	subq	%r10, %rax
1454b3799:     	shlq	$0x4, %r10
1454b379d:     	leaq	(%rcx,%r10), %r9
1454b37a1:     	addq	$0x10, %r9
1454b37a5:     	movq	%r11, %r8
1454b37a8:     	jmp	0x1454b37b4 <.text+0x54b27b4>
1454b37aa:     	addq	$0x20, %r9
1454b37ae:     	addq	$-0x2, %rax
1454b37b2:     	je	0x1454b378d <.text+0x54b278d>
1454b37b4:     	cmpq	%rdx, -0x10(%r9)
1454b37b8:     	jne	0x1454b37c1 <.text+0x54b27c1>
1454b37ba:     	cmpq	%rdx, (%r9)
1454b37bd:     	je	0x1454b37aa <.text+0x54b27aa>
1454b37bf:     	jmp	0x1454b37dd <.text+0x54b27dd>
1454b37c1:     	leaq	-0x10(%r9), %r10
1454b37c5:     	movq	%r8, %r11
1454b37c8:     	shlq	$0x4, %r11
1454b37cc:     	movups	(%r10), %xmm0
1454b37d0:     	movups	%xmm0, (%rcx,%r11)
1454b37d5:     	incq	%r8
1454b37d8:     	cmpq	%rdx, (%r9)
1454b37db:     	je	0x1454b37aa <.text+0x54b27aa>
1454b37dd:     	movq	%r8, %r10
1454b37e0:     	shlq	$0x4, %r10
1454b37e4:     	movups	(%r9), %xmm0
1454b37e8:     	movups	%xmm0, (%rcx,%r10)
1454b37ed:     	incq	%r8
1454b37f0:     	jmp	0x1454b37aa <.text+0x54b27aa>
1454b37f2:     	movq	0x340(%rbp), %rdx
1454b37f9:     	testq	%rdx, %rdx
1454b37fc:     	je	0x1454b3814 <.text+0x54b2814>
1454b37fe:     	shlq	$0x3, %rdx
1454b3802:     	movl	$0x8, %r8d
1454b3808:     	movq	0x358(%rbp), %rcx
1454b380f:     	callq	0x1400021d0 <.text+0x11d0>
1454b3814:     	movl	0x54(%rdi), %eax
1454b3817:     	testl	%eax, %eax
1454b3819:     	je	0x1454b3836 <.text+0x54b2836>
1454b381b:     	addl	%r14d, %ebx
1454b381e:     	addl	%eax, %ebx
1454b3820:     	addl	0x4a4(%r13), %ebx
1454b3827:     	cmpl	$0x3, %ebx
1454b382a:     	movl	$0x3, %eax
1454b382f:     	cmovbl	%ebx, %eax
1454b3832:     	testl	%ebx, %ebx
1454b3834:     	jne	0x1454b383b <.text+0x54b283b>
1454b3836:     	movl	$0x1, %eax
1454b383b:     	movl	%eax, %r15d
1454b383e:     	cmpq	%r15, 0x790(%r13)
1454b3845:     	jae	0x1454b3996 <.text+0x54b2996>
1454b384b:     	leaq	0x400(%r13), %r12
1454b3852:     	leaq	0xb0(%rbp), %rdi
1454b3859:     	leaq	0x240(%rbp), %rbx
1454b3860:     	jmp	0x1454b387a <.text+0x54b287a>
1454b3862:     	movq	%r13, %rcx
1454b3865:     	movq	%r14, %rdx
1454b3868:     	callq	0x1454e99c0 <.text+0x54e89c0>
1454b386d:     	cmpq	%r15, 0x790(%r13)
1454b3874:     	jae	0x1454b3996 <.text+0x54b2996>
1454b387a:     	movl	0x8(%r12), %eax
1454b387f:     	movl	%eax, 0x248(%rbp)
1454b3885:     	movq	(%r12), %rax
1454b3889:     	movq	%rax, 0x240(%rbp)
1454b3890:     	movss	0x2f0(%rbp), %xmm3
1454b3898:     	movq	%rdi, %rcx
1454b389b:     	movq	%r13, %rdx
1454b389e:     	movq	%rbx, %r8
1454b38a1:     	callq	0x1454e7b00 <.text+0x54e6b00>
1454b38a6:     	movq	0xb8(%rbp), %rcx
1454b38ad:     	cmpq	$0x0, 0xc0(%rbp)
1454b38b5:     	je	0x1454b397b <.text+0x54b297b>
1454b38bb:     	movq	(%rcx), %r14
1454b38be:     	movq	0xb0(%rbp), %rdx
1454b38c5:     	testq	%rdx, %rdx
1454b38c8:     	je	0x1454b3862 <.text+0x54b2862>
1454b38ca:     	shlq	$0x3, %rdx
1454b38ce:     	movl	$0x8, %r8d
1454b38d4:     	callq	0x1400021d0 <.text+0x11d0>
1454b38d9:     	jmp	0x1454b3862 <.text+0x54b2862>
1454b38db:     	leaq	0x1(%r8), %r11
1454b38df:     	cmpq	%rax, %r11
1454b38e2:     	jae	0x1454b3e13 <.text+0x54b2e13>
1454b38e8:     	movq	%r8, %rdx
1454b38eb:     	subq	%rax, %rdx
1454b38ee:     	leaq	0x2(%rdx), %r10
1454b38f2:     	testb	$0x1, %dl
1454b38f5:     	jne	0x1454b3e28 <.text+0x54b2e28>
1454b38fb:     	movss	(%r9), %xmm0
1454b3900:     	ucomiss	%xmm7, %xmm0
1454b3903:     	movq	%r8, %rdx
1454b3906:     	jbe	0x1454b3920 <.text+0x54b2920>
1454b3908:     	leaq	-0x10(%r9), %rdx
1454b390c:     	movq	0x10(%rdx), %r11
1454b3910:     	movq	%r11, -0x18(%r9)
1454b3914:     	movups	(%rdx), %xmm0
1454b3917:     	movups	%xmm0, -0x28(%r9)
1454b391c:     	leaq	0x1(%r8), %rdx
1454b3920:     	addq	$0x2, %r8
1454b3924:     	movq	%r8, %r11
1454b3927:     	movq	%rdx, %r8
1454b392a:     	jmp	0x1454b3e28 <.text+0x54b2e28>
1454b392f:     	leaq	0x1(%r8), %r11
1454b3933:     	cmpq	%rcx, %r11
1454b3936:     	jae	0x1454b3e1f <.text+0x54b2e1f>
1454b393c:     	movq	%r8, %rdx
1454b393f:     	subq	%rcx, %rdx
1454b3942:     	leaq	0x2(%rdx), %r10
1454b3946:     	testb	$0x1, %dl
1454b3949:     	jne	0x1454b3eb0 <.text+0x54b2eb0>
1454b394f:     	movss	(%r9), %xmm1
1454b3954:     	ucomiss	%xmm0, %xmm1
1454b3957:     	movq	%r8, %rdx
1454b395a:     	jbe	0x1454b396c <.text+0x54b296c>
1454b395c:     	leaq	-0xc(%r9), %rdx
1454b3960:     	movups	(%rdx), %xmm1
1454b3963:     	movups	%xmm1, -0x1c(%r9)
1454b3968:     	leaq	0x1(%r8), %rdx
1454b396c:     	addq	$0x2, %r8
1454b3970:     	movq	%r8, %r11
1454b3973:     	movq	%rdx, %r8
1454b3976:     	jmp	0x1454b3eb0 <.text+0x54b2eb0>
1454b397b:     	movq	0xb0(%rbp), %rdx
1454b3982:     	testq	%rdx, %rdx
1454b3985:     	je	0x1454b3996 <.text+0x54b2996>
1454b3987:     	shlq	$0x3, %rdx
1454b398b:     	movl	$0x8, %r8d
1454b3991:     	callq	0x1400021d0 <.text+0x11d0>
1454b3996:     	movl	0x408(%r13), %eax
1454b399d:     	movl	%eax, 0xb8(%rbp)
1454b39a3:     	movq	0x400(%r13), %rax
1454b39aa:     	movq	%rax, 0xb0(%rbp)
1454b39b1:     	movss	0x2f0(%rbp), %xmm3
1454b39b9:     	leaq	0x240(%rbp), %rcx
1454b39c0:     	leaq	0xb0(%rbp), %r8
1454b39c7:     	movq	%r13, %rdx
1454b39ca:     	callq	0x1454e7b00 <.text+0x54e6b00>
1454b39cf:     	movq	0x248(%rbp), %rcx
1454b39d6:     	cmpq	$0x0, 0x250(%rbp)
1454b39de:     	je	0x1454b3c00 <.text+0x54b2c00>
1454b39e4:     	movq	%r13, %rax
1454b39e7:     	addq	$0x400, %r13            # imm = 0x400
1454b39ee:     	leaq	0x780(%rax), %rdi
1454b39f5:     	leaq	0xb0(%rbp), %rbx
1454b39fc:     	leaq	0x240(%rbp), %r14
1454b3a03:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b3a0d:     	movq	(%rcx), %r15
1454b3a10:     	movq	0x368(%rbp), %r9
1454b3a17:     	movq	0x788(%r9), %rax
1454b3a1e:     	movq	0x790(%r9), %r8
1454b3a25:     	movq	%r8, %rdx
1454b3a28:     	shlq	$0x4, %rdx
1454b3a2c:     	addq	%rax, %rdx
1454b3a2f:     	movq	%rdx, 0xb8(%rbp)
1454b3a36:     	movq	%r9, 0xc0(%rbp)
1454b3a3d:     	testq	%r8, %r8
1454b3a40:     	je	0x1454b3c0a <.text+0x54b2c0a>
1454b3a46:     	leaq	0x10(%rax), %rdx
1454b3a4a:     	movq	%rdx, 0xb0(%rbp)
1454b3a51:     	movq	(%rax), %r8
1454b3a54:     	movq	0x4e0(%r9), %rax
1454b3a5b:     	imulq	$0x160, 0x4e8(%r9), %rdx # imm = 0x160
1454b3a66:     	xorl	%r10d, %r10d
1454b3a69:     	movq	%rax, %r9
1454b3a6c:     	movq	%rcx, 0x358(%rbp)
1454b3a73:     	cmpq	%r10, %rdx
1454b3a76:     	je	0x1454b3aa4 <.text+0x54b2aa4>
1454b3a78:     	addq	$0x160, %r10            # imm = 0x160
1454b3a7f:     	cmpq	%r8, 0x88(%r9)
1454b3a86:     	leaq	0x160(%r9), %r9
1454b3a8d:     	jne	0x1454b3a73 <.text+0x54b2a73>
1454b3a8f:     	cmpq	$-0x1, -0x148(%rax,%r10)
1454b3a98:     	setne	%dl
1454b3a9b:     	addb	%dl, %dl
1454b3a9d:     	orb	-0x8(%rax,%r10), %dl
1454b3aa2:     	jmp	0x1454b3aa6 <.text+0x54b2aa6>
1454b3aa4:     	xorl	%edx, %edx
1454b3aa6:     	movq	%rbx, %rcx
1454b3aa9:     	callq	0x145547500 <.text+0x5546500>
1454b3aae:     	nop
1454b3aaf:     	movq	0x368(%rbp), %rcx
1454b3ab6:     	movq	0x4e0(%rcx), %rax
1454b3abd:     	imulq	$0x160, 0x4e8(%rcx), %r11 # imm = 0x160
1454b3ac8:     	xorl	%r9d, %r9d
1454b3acb:     	movq	%rax, %r8
1454b3ace:     	cmpq	%r9, %r11
1454b3ad1:     	je	0x1454b3b01 <.text+0x54b2b01>
1454b3ad3:     	addq	$0x160, %r9             # imm = 0x160
1454b3ada:     	cmpq	%rdx, 0x88(%r8)
1454b3ae1:     	leaq	0x160(%r8), %r8
1454b3ae8:     	jne	0x1454b3ace <.text+0x54b2ace>
1454b3aea:     	cmpq	$-0x1, -0x148(%rax,%r9)
1454b3af3:     	setne	%r8b
1454b3af7:     	addb	%r8b, %r8b
1454b3afa:     	orb	-0x8(%rax,%r9), %r8b
1454b3aff:     	jmp	0x1454b3b04 <.text+0x54b2b04>
1454b3b01:     	xorl	%r8d, %r8d
1454b3b04:     	xorl	%r9d, %r9d
1454b3b07:     	movq	%rax, %r10
1454b3b0a:     	movq	0x358(%rbp), %rcx
1454b3b11:     	cmpq	%r9, %r11
1454b3b14:     	je	0x1454b3c0a <.text+0x54b2c0a>
1454b3b1a:     	addq	$0x160, %r9             # imm = 0x160
1454b3b21:     	cmpq	%r15, 0x88(%r10)
1454b3b28:     	leaq	0x160(%r10), %r10
1454b3b2f:     	jne	0x1454b3b11 <.text+0x54b2b11>
1454b3b31:     	cmpq	$-0x1, -0x148(%rax,%r9)
1454b3b3a:     	setne	%r10b
1454b3b3e:     	addb	%r10b, %r10b
1454b3b41:     	orb	-0x8(%rax,%r9), %r10b
1454b3b46:     	cmpb	%r10b, %r8b
1454b3b49:     	jae	0x1454b3c0a <.text+0x54b2c0a>
1454b3b4f:     	movq	%rdx, 0xb0(%rbp)
1454b3b56:     	movq	%rdi, %rcx
1454b3b59:     	movq	%rdx, %r12
1454b3b5c:     	movq	%rbx, %rdx
1454b3b5f:     	callq	0x145532640 <.text+0x5531640>
1454b3b64:     	nop
1454b3b65:     	movq	0x368(%rbp), %rcx
1454b3b6c:     	movq	%r12, %rdx
1454b3b6f:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b3b79:     	movl	$0x302, %r8d            # imm = 0x302
1454b3b7f:     	xorl	%r9d, %r9d
1454b3b82:     	callq	0x1454e3550 <.text+0x54e2550>
1454b3b87:     	nop
1454b3b88:     	movq	0x368(%rbp), %rcx
1454b3b8f:     	movq	%r15, %rdx
1454b3b92:     	callq	0x1454e99c0 <.text+0x54e89c0>
1454b3b97:     	nop
1454b3b98:     	movq	0x240(%rbp), %rdx
1454b3b9f:     	testq	%rdx, %rdx
1454b3ba2:     	je	0x1454b3bba <.text+0x54b2bba>
1454b3ba4:     	shlq	$0x3, %rdx
1454b3ba8:     	movl	$0x8, %r8d
1454b3bae:     	movq	0x358(%rbp), %rcx
1454b3bb5:     	callq	0x1400021d0 <.text+0x11d0>
1454b3bba:     	movl	0x8(%r13), %eax
1454b3bbe:     	movl	%eax, 0xb8(%rbp)
1454b3bc4:     	movq	(%r13), %rax
1454b3bc8:     	movq	%rax, 0xb0(%rbp)
1454b3bcf:     	movss	0x2f0(%rbp), %xmm3
1454b3bd7:     	movq	%r14, %rcx
1454b3bda:     	movq	0x368(%rbp), %rdx
1454b3be1:     	movq	%rbx, %r8
1454b3be4:     	callq	0x1454e7b00 <.text+0x54e6b00>
1454b3be9:     	movq	0x248(%rbp), %rcx
1454b3bf0:     	cmpq	$0x0, 0x250(%rbp)
1454b3bf8:     	jne	0x1454b3a0d <.text+0x54b2a0d>
1454b3bfe:     	jmp	0x1454b3c0a <.text+0x54b2c0a>
1454b3c00:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b3c0a:     	movq	0x240(%rbp), %rdx
1454b3c11:     	testq	%rdx, %rdx
1454b3c14:     	je	0x1454b3c25 <.text+0x54b2c25>
1454b3c16:     	shlq	$0x3, %rdx
1454b3c1a:     	movl	$0x8, %r8d
1454b3c20:     	callq	0x1400021d0 <.text+0x11d0>
1454b3c25:     	movq	0x368(%rbp), %r13
1454b3c2c:     	movq	0x788(%r13), %rdx
1454b3c33:     	movq	0x790(%r13), %r8
1454b3c3a:     	shlq	$0x4, %r8
1454b3c3e:     	addq	%rdx, %r8
1454b3c41:     	leaq	0xb0(%rbp), %rcx
1454b3c48:     	callq	0x1455466c0 <.text+0x55456c0>
1454b3c4d:     	movq	0xb0(%rbp), %rax
1454b3c54:     	movq	%rax, 0x340(%rbp)
1454b3c5b:     	movq	0xb8(%rbp), %rax
1454b3c62:     	movq	%rax, 0x358(%rbp)
1454b3c69:     	movq	0xc0(%rbp), %rdi
1454b3c70:     	shlq	$0x3, %rdi
1454b3c74:     	xorl	%ebx, %ebx
1454b3c76:     	nopw	%cs:(%rax,%rax)
1454b3c80:     	cmpq	%rbx, %rdi
1454b3c83:     	je	0x1454b3ca8 <.text+0x54b2ca8>
1454b3c85:     	movq	0x358(%rbp), %rax
1454b3c8c:     	movq	(%rax,%rbx), %rdx
1454b3c90:     	addq	$0x8, %rbx
1454b3c94:     	movq	%r13, %rcx
1454b3c97:     	movl	$0x302, %r8d            # imm = 0x302
1454b3c9d:     	movb	$0x1, %r9b
1454b3ca0:     	callq	0x1454e3550 <.text+0x54e2550>
1454b3ca5:     	nop
1454b3ca6:     	jmp	0x1454b3c80 <.text+0x54b2c80>
1454b3ca8:     	movq	0x340(%rbp), %rdx
1454b3caf:     	testq	%rdx, %rdx
1454b3cb2:     	je	0x1454b3cca <.text+0x54b2cca>
1454b3cb4:     	shlq	$0x3, %rdx
1454b3cb8:     	movl	$0x8, %r8d
1454b3cbe:     	movq	0x358(%rbp), %rcx
1454b3cc5:     	callq	0x1400021d0 <.text+0x11d0>
1454b3cca:     	movq	0x2b0(%r13), %rax
1454b3cd1:     	movq	0x2b8(%r13), %r8
1454b3cd8:     	testq	%r8, %r8
1454b3cdb:     	je	0x1454b4009 <.text+0x54b3009>
1454b3ce1:     	imulq	$0x58, %r8, %rcx
1454b3ce5:     	xorl	%r8d, %r8d
1454b3ce8:     	movabsq	$0x6c6577746867696c, %rdx # imm = 0x6C6577746867696C
1454b3cf2:     	jmp	0x1454b3d09 <.text+0x54b2d09>
1454b3cf4:     	nopw	%cs:(%rax,%rax)
1454b3d00:     	addq	$0x58, %r8
1454b3d04:     	cmpq	%r8, %rcx
1454b3d07:     	je	0x1454b3d2d <.text+0x54b2d2d>
1454b3d09:     	movq	(%rax,%r8), %r9
1454b3d0d:     	cmpq	$0x9, 0x8(%r9)
1454b3d12:     	jne	0x1454b3d00 <.text+0x54b2d00>
1454b3d14:     	movq	(%r9), %r9
1454b3d17:     	movq	(%r9), %r10
1454b3d1a:     	xorq	%rdx, %r10
1454b3d1d:     	movzbl	0x8(%r9), %r9d
1454b3d22:     	xorq	$0x6c, %r9
1454b3d26:     	orq	%r10, %r9
1454b3d29:     	jne	0x1454b3d00 <.text+0x54b2d00>
1454b3d2b:     	jmp	0x1454b3d3b <.text+0x54b2d3b>
1454b3d2d:     	cmpq	$0x0, 0x7a8(%r13)
1454b3d35:     	je	0x1454b5037 <.text+0x54b4037>
1454b3d3b:     	movq	0xa8(%rbp), %r8
1454b3d42:     	movss	(%r8), %xmm0
1454b3d47:     	movss	%xmm0, 0x210(%rbp)
1454b3d4f:     	xorl	%r8d, %r8d
1454b3d52:     	jmp	0x1454b3d6d <.text+0x54b2d6d>
1454b3d54:     	nopw	%cs:(%rax,%rax)
1454b3d60:     	addq	$0x58, %r8
1454b3d64:     	cmpq	%r8, %rcx
1454b3d67:     	je	0x1454b402a <.text+0x54b302a>
1454b3d6d:     	movq	(%rax,%r8), %r9
1454b3d71:     	cmpq	$0x9, 0x8(%r9)
1454b3d76:     	jne	0x1454b3d60 <.text+0x54b2d60>
1454b3d78:     	movq	(%r9), %r10
1454b3d7b:     	movq	(%r10), %r11
1454b3d7e:     	xorq	%rdx, %r11
1454b3d81:     	movzbl	0x8(%r10), %r10d
1454b3d86:     	xorq	$0x6c, %r10
1454b3d8a:     	orq	%r11, %r10
1454b3d8d:     	jne	0x1454b3d60 <.text+0x54b2d60>
1454b3d8f:     	movl	0x8(%rax,%r8), %ecx
1454b3d94:     	movss	0x14(%rax,%r8), %xmm0
1454b3d9b:     	movl	0x18(%rax,%r8), %edx
1454b3da0:     	movsd	0xc(%rax,%r8), %xmm1
1454b3da7:     	movsd	0x1c(%rax,%r8), %xmm2
1454b3dae:     	movl	0x34(%rax,%r8), %r10d
1454b3db3:     	movl	%r10d, 0x274(%rbp)
1454b3dba:     	movups	0x24(%rax,%r8), %xmm3
1454b3dc0:     	movups	%xmm3, 0x264(%rbp)
1454b3dc7:     	movups	0x38(%rax,%r8), %xmm3
1454b3dcd:     	movdqu	0x44(%rax,%r8), %xmm4
1454b3dd4:     	movdqu	%xmm4, 0x284(%rbp)
1454b3ddc:     	movups	%xmm3, 0x278(%rbp)
1454b3de3:     	movq	%r9, 0x240(%rbp)
1454b3dea:     	movl	%ecx, 0x248(%rbp)
1454b3df0:     	movsd	%xmm1, 0x24c(%rbp)
1454b3df8:     	movss	%xmm0, 0x254(%rbp)
1454b3e00:     	movl	%edx, 0x258(%rbp)
1454b3e06:     	movsd	%xmm2, 0x25c(%rbp)
1454b3e0e:     	jmp	0x1454b4035 <.text+0x54b3035>
1454b3e13:     	movq	%r8, 0x318(%r13)
1454b3e1a:     	jmp	0x1454af9ce <.text+0x54ae9ce>
1454b3e1f:     	movq	%r8, 0x60(%r13)
1454b3e23:     	jmp	0x1454b0e5e <.text+0x54afe5e>
1454b3e28:     	testq	%r10, %r10
1454b3e2b:     	je	0x1454b3ea4 <.text+0x54b2ea4>
1454b3e2d:     	leaq	(%r11,%r11,2), %rdx
1454b3e31:     	leaq	(%rcx,%rdx,8), %r9
1454b3e35:     	addq	$0x28, %r9
1454b3e39:     	subq	%r11, %rax
1454b3e3c:     	movq	%r8, %rdx
1454b3e3f:     	jmp	0x1454b3e4b <.text+0x54b2e4b>
1454b3e41:     	addq	$0x30, %r9
1454b3e45:     	addq	$-0x2, %rax
1454b3e49:     	je	0x1454b3ea4 <.text+0x54b2ea4>
1454b3e4b:     	movss	-0x18(%r9), %xmm0
1454b3e51:     	ucomiss	%xmm7, %xmm0
1454b3e54:     	jbe	0x1454b3e7f <.text+0x54b2e7f>
1454b3e56:     	leaq	-0x28(%r9), %r8
1454b3e5a:     	leaq	(%rdx,%rdx,2), %r10
1454b3e5e:     	movq	0x10(%r8), %r11
1454b3e62:     	movq	%r11, 0x10(%rcx,%r10,8)
1454b3e67:     	movups	(%r8), %xmm0
1454b3e6b:     	movups	%xmm0, (%rcx,%r10,8)
1454b3e70:     	incq	%rdx
1454b3e73:     	movss	(%r9), %xmm0
1454b3e78:     	ucomiss	%xmm7, %xmm0
1454b3e7b:     	jbe	0x1454b3e41 <.text+0x54b2e41>
1454b3e7d:     	jmp	0x1454b3e89 <.text+0x54b2e89>
1454b3e7f:     	movss	(%r9), %xmm0
1454b3e84:     	ucomiss	%xmm7, %xmm0
1454b3e87:     	jbe	0x1454b3e41 <.text+0x54b2e41>
1454b3e89:     	leaq	(%rdx,%rdx,2), %r8
1454b3e8d:     	movq	(%r9), %r10
1454b3e90:     	movq	%r10, 0x10(%rcx,%r8,8)
1454b3e95:     	movups	-0x10(%r9), %xmm0
1454b3e9a:     	movups	%xmm0, (%rcx,%r8,8)
1454b3e9f:     	incq	%rdx
1454b3ea2:     	jmp	0x1454b3e41 <.text+0x54b2e41>
1454b3ea4:     	movq	%rdx, 0x318(%r13)
1454b3eab:     	jmp	0x1454af9ce <.text+0x54ae9ce>
1454b3eb0:     	testq	%r10, %r10
1454b3eb3:     	je	0x1454b3f21 <.text+0x54b2f21>
1454b3eb5:     	subq	%r11, %rcx
1454b3eb8:     	shlq	$0x4, %r11
1454b3ebc:     	leaq	(%r11,%rax), %r9
1454b3ec0:     	addq	$0x1c, %r9
1454b3ec4:     	movq	%r8, %rdx
1454b3ec7:     	jmp	0x1454b3ed3 <.text+0x54b2ed3>
1454b3ec9:     	addq	$0x20, %r9
1454b3ecd:     	addq	$-0x2, %rcx
1454b3ed1:     	je	0x1454b3f21 <.text+0x54b2f21>
1454b3ed3:     	movss	-0x10(%r9), %xmm1
1454b3ed9:     	ucomiss	%xmm0, %xmm1
1454b3edc:     	jbe	0x1454b3f01 <.text+0x54b2f01>
1454b3ede:     	leaq	-0x1c(%r9), %r8
1454b3ee2:     	movq	%rdx, %r10
1454b3ee5:     	shlq	$0x4, %r10
1454b3ee9:     	movups	(%r8), %xmm1
1454b3eed:     	movups	%xmm1, (%rax,%r10)
1454b3ef2:     	incq	%rdx
1454b3ef5:     	movss	(%r9), %xmm1
1454b3efa:     	ucomiss	%xmm0, %xmm1
1454b3efd:     	jbe	0x1454b3ec9 <.text+0x54b2ec9>
1454b3eff:     	jmp	0x1454b3f0b <.text+0x54b2f0b>
1454b3f01:     	movss	(%r9), %xmm1
1454b3f06:     	ucomiss	%xmm0, %xmm1
1454b3f09:     	jbe	0x1454b3ec9 <.text+0x54b2ec9>
1454b3f0b:     	movq	%rdx, %r8
1454b3f0e:     	shlq	$0x4, %r8
1454b3f12:     	movups	-0xc(%r9), %xmm1
1454b3f17:     	movups	%xmm1, (%rax,%r8)
1454b3f1c:     	incq	%rdx
1454b3f1f:     	jmp	0x1454b3ec9 <.text+0x54b2ec9>
1454b3f21:     	movq	%rdx, 0x60(%r13)
1454b3f25:     	jmp	0x1454b0e5e <.text+0x54afe5e>
1454b3f2a:     	cmpq	$0x1, %r15
1454b3f2e:     	jne	0x1454b3faf <.text+0x54b2faf>
1454b3f30:     	imulq	$0x160, %r13, %rax      # imm = 0x160
1454b3f37:     	xorl	%edx, %edx
1454b3f39:     	movq	%r12, %rcx
1454b3f3c:     	cmpq	%rdx, %rax
1454b3f3f:     	je	0x1454b3f6d <.text+0x54b2f6d>
1454b3f41:     	addq	$0x160, %rdx            # imm = 0x160
1454b3f48:     	cmpq	%rdi, 0x88(%rcx)
1454b3f4f:     	leaq	0x160(%rcx), %rcx
1454b3f56:     	jne	0x1454b3f3c <.text+0x54b2f3c>
1454b3f58:     	cmpq	$-0x1, -0x148(%r12,%rdx)
1454b3f61:     	setne	%cl
1454b3f64:     	addb	%cl, %cl
1454b3f66:     	orb	-0x8(%r12,%rdx), %cl
1454b3f6b:     	jmp	0x1454b3f6f <.text+0x54b2f6f>
1454b3f6d:     	xorl	%ecx, %ecx
1454b3f6f:     	xorl	%edx, %edx
1454b3f71:     	movq	%r12, %r8
1454b3f74:     	cmpq	%rdx, %rax
1454b3f77:     	je	0x1454b3fa5 <.text+0x54b2fa5>
1454b3f79:     	addq	$0x160, %rdx            # imm = 0x160
1454b3f80:     	cmpq	%r14, 0x88(%r8)
1454b3f87:     	leaq	0x160(%r8), %r8
1454b3f8e:     	jne	0x1454b3f74 <.text+0x54b2f74>
1454b3f90:     	cmpq	$-0x1, -0x148(%r12,%rdx)
1454b3f99:     	setne	%al
1454b3f9c:     	addb	%al, %al
1454b3f9e:     	orb	-0x8(%r12,%rdx), %al
1454b3fa3:     	jmp	0x1454b3fa7 <.text+0x54b2fa7>
1454b3fa5:     	xorl	%eax, %eax
1454b3fa7:     	cmpb	%al, %cl
1454b3fa9:     	ja	0x1454b3333 <.text+0x54b2333>
1454b3faf:     	imulq	$0x160, %r13, %rcx      # imm = 0x160
1454b3fb6:     	xorl	%eax, %eax
1454b3fb8:     	movq	%r12, %rdx
1454b3fbb:     	movq	0x368(%rbp), %r13
1454b3fc2:     	cmpq	%rax, %rcx
1454b3fc5:     	je	0x1454b3fe4 <.text+0x54b2fe4>
1454b3fc7:     	addq	$0x160, %rax            # imm = 0x160
1454b3fcd:     	cmpq	%r14, 0x88(%rdx)
1454b3fd4:     	leaq	0x160(%rdx), %rdx
1454b3fdb:     	jne	0x1454b3fc2 <.text+0x54b2fc2>
1454b3fdd:     	movss	%xmm7, -0x24(%r12,%rax)
1454b3fe4:     	movl	0x40(%rbx), %r8d
1454b3fe8:     	movq	%r13, %rcx
1454b3feb:     	movq	%r14, %rdx
1454b3fee:     	movb	$0x1, %r9b
1454b3ff1:     	callq	0x1454e3550 <.text+0x54e2550>
1454b3ff6:     	movq	%rsi, %r12
1454b3ff9:     	movq	0x2b8(%r13), %r8
1454b4000:     	testq	%r8, %r8
1454b4003:     	jne	0x1454b34b6 <.text+0x54b24b6>
1454b4009:     	cmpq	$0x0, 0x7a8(%r13)
1454b4011:     	je	0x1454b5037 <.text+0x54b4037>
1454b4017:     	movq	0xa8(%rbp), %rax
1454b401e:     	movss	(%rax), %xmm0
1454b4022:     	movss	%xmm0, 0x210(%rbp)
1454b402a:     	movq	$0x0, 0x240(%rbp)
1454b4035:     	leaq	0x798(%r13), %rsi
1454b403c:     	movq	0x7a0(%r13), %rax
1454b4043:     	movq	0x7a8(%r13), %rcx
1454b404a:     	shlq	$0x5, %rcx
1454b404e:     	addq	%rax, %rcx
1454b4051:     	movq	%rax, 0xb0(%rbp)
1454b4058:     	movq	%rcx, 0xb8(%rbp)
1454b405f:     	leaq	0x210(%rbp), %r15
1454b4066:     	movq	%r15, 0xc0(%rbp)
1454b406d:     	leaq	0x240(%rbp), %rax
1454b4074:     	movq	%rax, 0xc8(%rbp)
1454b407b:     	leaq	0x68(%rbp), %rcx
1454b407f:     	leaq	0xb0(%rbp), %rdx
1454b4086:     	callq	0x1455408b0 <.text+0x553f8b0>
1454b408b:     	movq	0x78(%rbp), %rbx
1454b408f:     	testq	%rbx, %rbx
1454b4092:     	movq	%rsi, -0x8(%rbp)
1454b4096:     	je	0x1454b41b2 <.text+0x54b31b2>
1454b409c:     	movb	$0x1, 0x357(%rbp)
1454b40a3:     	leaq	0x68(%rbp), %rdx
1454b40a7:     	movq	%rsi, %rcx
1454b40aa:     	callq	0x145531970 <.text+0x5530970>
1454b40af:     	nop
1454b40b0:     	movq	0x68(%rbp), %rax
1454b40b4:     	movq	%rax, 0x348(%rbp)
1454b40bb:     	movq	0x70(%rbp), %rax
1454b40bf:     	movq	%rax, 0x340(%rbp)
1454b40c6:     	shlq	$0x3, %rbx
1454b40ca:     	leaq	0x550(%r13), %rdi
1454b40d1:     	xorl	%r14d, %r14d
1454b40d4:     	jmp	0x1454b4125 <.text+0x54b3125>
1454b40d6:     	nopw	%cs:(%rax,%rax)
1454b40e0:     	movq	0x558(%r13), %rax
1454b40e7:     	movq	%rsi, %rcx
1454b40ea:     	shlq	$0x5, %rcx
1454b40ee:     	movq	$0x20, (%rax,%rcx)
1454b40f6:     	movq	0x358(%rbp), %rdx
1454b40fd:     	movq	%rdx, 0x8(%rax,%rcx)
1454b4102:     	movq	$0x8, 0x10(%rax,%rcx)
1454b410b:     	movw	$0xaa, 0x18(%rax,%rcx)
1454b4112:     	incq	%rsi
1454b4115:     	movq	%rsi, 0x560(%r13)
1454b411c:     	addq	$0x8, %r14
1454b4120:     	cmpq	%r14, %rbx
1454b4123:     	je	0x1454b417e <.text+0x54b317e>
1454b4125:     	movq	0x340(%rbp), %rax
1454b412c:     	movq	(%rax,%r14), %rsi
1454b4130:     	testq	%rsi, %rsi
1454b4133:     	je	0x1454b411c <.text+0x54b311c>
1454b4135:     	callq	0x140002200 <.text+0x1200>
1454b413a:     	movl	$0x20, %ecx
1454b413f:     	movl	$0x1, %edx
1454b4144:     	callq	0x1400021c0 <.text+0x11c0>
1454b4149:     	testq	%rax, %rax
1454b414c:     	je	0x1454bc9a9 <.text+0x54bb9a9>
1454b4152:     	movq	%rax, 0x358(%rbp)
1454b4159:     	movq	%rsi, (%rax)
1454b415c:     	movq	0x560(%r13), %rsi
1454b4163:     	cmpq	0x550(%r13), %rsi
1454b416a:     	jne	0x1454b40e0 <.text+0x54b30e0>
1454b4170:     	movq	%rdi, %rcx
1454b4173:     	callq	0x145774710 <.text+0x5773710>
1454b4178:     	nop
1454b4179:     	jmp	0x1454b40e0 <.text+0x54b30e0>
1454b417e:     	movq	0x348(%rbp), %rdx
1454b4185:     	testq	%rdx, %rdx
1454b4188:     	je	0x1454b41a0 <.text+0x54b31a0>
1454b418a:     	shlq	$0x3, %rdx
1454b418e:     	movl	$0x8, %r8d
1454b4194:     	movq	0x340(%rbp), %rcx
1454b419b:     	callq	0x1400021d0 <.text+0x11d0>
1454b41a0:     	cmpq	$0x0, 0x240(%rbp)
1454b41a8:     	je	0x1454b5037 <.text+0x54b4037>
1454b41ae:     	xorl	%esi, %esi
1454b41b0:     	jmp	0x1454b41c3 <.text+0x54b31c3>
1454b41b2:     	movb	$0x1, %sil
1454b41b5:     	cmpq	$0x0, 0x240(%rbp)
1454b41bd:     	je	0x1454b501b <.text+0x54b401b>
1454b41c3:     	movq	0x290(%rbp), %rax
1454b41ca:     	movq	%rax, 0x100(%rbp)
1454b41d1:     	movups	0x280(%rbp), %xmm0
1454b41d8:     	movaps	%xmm0, 0xf0(%rbp)
1454b41df:     	movups	0x240(%rbp), %xmm0
1454b41e6:     	movups	0x250(%rbp), %xmm1
1454b41ed:     	movups	0x260(%rbp), %xmm2
1454b41f4:     	movups	0x270(%rbp), %xmm3
1454b41fb:     	movaps	%xmm3, 0xe0(%rbp)
1454b4202:     	movaps	%xmm2, 0xd0(%rbp)
1454b4209:     	movaps	%xmm1, 0xc0(%rbp)
1454b4210:     	movaps	%xmm0, 0xb0(%rbp)
1454b4217:     	movss	0x470(%r13), %xmm0
1454b4220:     	movss	%xmm0, 0x238(%rbp)
1454b4228:     	movss	0x474(%r13), %xmm0
1454b4231:     	movss	%xmm0, 0x60(%rbp)
1454b4236:     	movl	0x4a4(%r13), %eax
1454b423d:     	movl	%eax, 0x14(%rbp)
1454b4240:     	movq	0x7a8(%r13), %rdi
1454b4247:     	leaq	0x4d8(%r13), %r14
1454b424e:     	leaq	0x550(%r13), %rax
1454b4255:     	movq	%rax, 0x318(%rbp)
1454b425c:     	xorl	%ebx, %ebx
1454b425e:     	movss	0x453229(%rip), %xmm9   # 0x145907490
1454b4267:     	xorps	%xmm10, %xmm10
1454b426b:     	movss	0x55412c(%rip), %xmm12  # 0x145a083a0
1454b4274:     	movl	%esi, 0x328(%rbp)
1454b427a:     	movq	0x7a0(%r13), %rax
1454b4281:     	movq	0x7a8(%r13), %rdx
1454b4288:     	movss	0x210(%rbp), %xmm0
1454b4290:     	movq	%rbx, %rcx
1454b4293:     	shlq	$0x5, %rcx
1454b4297:     	addq	%rcx, %rax
1454b429a:     	addq	$-0x20, %rax
1454b429e:     	nop
1454b42a0:     	cmpq	%rdi, %rbx
1454b42a3:     	jae	0x1454b4c27 <.text+0x54b3c27>
1454b42a9:     	cmpq	%rdx, %rbx
1454b42ac:     	jae	0x1454bc913 <.text+0x54bb913>
1454b42b2:     	incq	%rbx
1454b42b5:     	movss	0x38(%rax), %xmm1
1454b42ba:     	addq	$0x20, %rax
1454b42be:     	ucomiss	%xmm0, %xmm1
1454b42c1:     	ja	0x1454b42a0 <.text+0x54b32a0>
1454b42c3:     	movq	%rdi, 0x48(%rbp)
1454b42c7:     	movq	(%rax), %rcx
1454b42ca:     	movq	%rcx, 0x338(%rbp)
1454b42d1:     	addss	%xmm9, %xmm1
1454b42d6:     	movss	%xmm1, 0x18(%rax)
1454b42db:     	movq	0xb0(%rbp), %rcx
1454b42e2:     	movq	%rcx, 0x358(%rbp)
1454b42e9:     	movl	0x54(%rcx), %edi
1454b42ec:     	testl	%edi, %edi
1454b42ee:     	je	0x1454b4301 <.text+0x54b3301>
1454b42f0:     	addl	0x14(%rbp), %edi
1454b42f3:     	addl	0xc8(%rbp), %edi
1454b42f9:     	addl	0xf0(%rbp), %edi
1454b42ff:     	jmp	0x1454b4303 <.text+0x54b3303>
1454b4301:     	xorl	%edi, %edi
1454b4303:     	leaq	0x2b8(%rbp), %r12
1454b430a:     	addq	$0x8, %rax
1454b430e:     	movl	0x8(%rax), %ecx
1454b4311:     	movl	%ecx, 0x2f8(%rbp)
1454b4317:     	movq	(%rax), %rax
1454b431a:     	movq	%rax, 0x2f0(%rbp)
1454b4321:     	movq	0x358(%rbp), %rax
1454b4328:     	movss	0x4c(%rax), %xmm3
1454b432d:     	movb	%sil, 0x357(%rbp)
1454b4334:     	movq	%r12, %rcx
1454b4337:     	movq	%r13, %rdx
1454b433a:     	leaq	0x2f0(%rbp), %r8
1454b4341:     	callq	0x1455004d0 <.text+0x54ff4d0>
1454b4346:     	nop
1454b4347:     	cmpl	$0x3, %edi
1454b434a:     	movl	$0x3, %eax
1454b434f:     	cmovbl	%edi, %eax
1454b4352:     	testl	%edi, %edi
1454b4354:     	movl	$0x1, %ecx
1454b4359:     	cmovel	%ecx, %eax
1454b435c:     	movq	0x2b8(%rbp), %rcx
1454b4363:     	movq	0x2c0(%rbp), %rdx
1454b436a:     	movq	0x2c8(%rbp), %r8
1454b4371:     	leaq	(%rdx,%r8,8), %r8
1454b4375:     	movq	%rdx, 0x2b8(%rbp)
1454b437c:     	movq	%rdx, 0x2c0(%rbp)
1454b4383:     	movq	%rcx, 0x2c8(%rbp)
1454b438a:     	movq	%r8, 0x2d0(%rbp)
1454b4391:     	movq	%r14, 0x2d8(%rbp)
1454b4398:     	movq	%r15, 0x2e0(%rbp)
1454b439f:     	movq	%rax, 0x2e8(%rbp)
1454b43a6:     	movb	%sil, 0x357(%rbp)
1454b43ad:     	leaq	0x220(%rbp), %rcx
1454b43b4:     	movq	%r12, %rdx
1454b43b7:     	callq	0x145558e30 <.text+0x5557e30>
1454b43bc:     	nop
1454b43bd:     	movq	%r14, 0x30(%rbp)
1454b43c1:     	movq	%rbx, 0x58(%rbp)
1454b43c5:     	movq	0x358(%rbp), %rax
1454b43cc:     	movzbl	0x75(%rax), %eax
1454b43d0:     	addb	$-0x2, %al
1454b43d2:     	movaps	%xmm9, %xmm0
1454b43d6:     	cmpb	$0x6, %al
1454b43d8:     	ja	0x1454b43e9 <.text+0x54b33e9>
1454b43da:     	movzbl	%al, %eax
1454b43dd:     	leaq	0x1544150(%rip), %rcx   # 0x1469f8534
1454b43e4:     	movss	(%rcx,%rax,4), %xmm0
1454b43e9:     	movq	0x358(%rbp), %rax
1454b43f0:     	movss	0x44(%rax), %xmm15
1454b43f6:     	movss	0xfc(%rbp), %xmm1
1454b43fe:     	mulss	0x238(%rbp), %xmm1
1454b4406:     	xorps	%xmm2, %xmm2
1454b4409:     	cmpltss	%xmm15, %xmm2
1454b440f:     	andps	%xmm1, %xmm2
1454b4412:     	mulss	0x4642d5(%rip), %xmm15  # 0x1459186f0
1454b441b:     	mulss	0xc0(%rbp), %xmm15
1454b4424:     	mulss	0xe8(%rbp), %xmm15
1454b442d:     	mulss	%xmm0, %xmm15
1454b4432:     	addss	%xmm2, %xmm15
1454b4437:     	mulss	0x60(%rbp), %xmm15
1454b443d:     	movq	0x220(%rbp), %rax
1454b4444:     	movq	%rax, 0x2a0(%rbp)
1454b444b:     	movq	0x228(%rbp), %rcx
1454b4452:     	movq	0x230(%rbp), %rax
1454b4459:     	leaq	(%rcx,%rax,8), %rax
1454b445d:     	movq	%rax, 0x348(%rbp)
1454b4464:     	movq	%rcx, (%rbp)
1454b4468:     	movq	%rcx, 0x340(%rbp)
1454b446f:     	nop
1454b4470:     	movq	0x340(%rbp), %r14
1454b4477:     	cmpq	0x348(%rbp), %r14
1454b447e:     	je	0x1454b4bd9 <.text+0x54b3bd9>
1454b4484:     	movq	(%r14), %r13
1454b4487:     	movq	%r13, -0x10(%rbp)
1454b448b:     	movq	%r13, 0x2f8(%rbp)
1454b4492:     	movl	$0x0, 0x2f0(%rbp)
1454b449c:     	movl	$0x0, 0x98(%rbp)
1454b44a6:     	leaq	0x98(%rbp), %rax
1454b44ad:     	movq	%rax, 0x30(%rsp)
1454b44b2:     	leaq	0x2f0(%rbp), %rax
1454b44b9:     	movq	%rax, 0x28(%rsp)
1454b44be:     	movq	$0x1, 0x20(%rsp)
1454b44c7:     	leaq	0x2b8(%rbp), %rcx
1454b44ce:     	movq	0x338(%rbp), %rdx
1454b44d5:     	movl	$0x6538, %r8d           # imm = 0x6538
1454b44db:     	leaq	-0x10(%rbp), %r9
1454b44df:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b44e4:     	nop
1454b44e5:     	movq	0x368(%rbp), %rax
1454b44ec:     	movq	0x560(%rax), %rdi
1454b44f3:     	cmpq	0x550(%rax), %rdi
1454b44fa:     	jne	0x1454b4509 <.text+0x54b3509>
1454b44fc:     	movq	0x318(%rbp), %rcx
1454b4503:     	callq	0x145774710 <.text+0x5773710>
1454b4508:     	nop
1454b4509:     	addq	$0x8, %r14
1454b450d:     	movq	0x368(%rbp), %rdx
1454b4514:     	movq	0x558(%rdx), %rax
1454b451b:     	movq	%rdi, %rcx
1454b451e:     	shlq	$0x5, %rcx
1454b4522:     	movups	0x2b8(%rbp), %xmm0
1454b4529:     	movups	0x2c8(%rbp), %xmm1
1454b4530:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4535:     	movups	%xmm0, (%rax,%rcx)
1454b4539:     	incq	%rdi
1454b453c:     	movq	%rdi, 0x560(%rdx)
1454b4543:     	movss	0x934(%rdx), %xmm0
1454b454b:     	movq	0x4e0(%rdx), %rax
1454b4552:     	imulq	$0x160, 0x4e8(%rdx), %r12 # imm = 0x160
1454b455d:     	xorl	%ecx, %ecx
1454b455f:     	movq	%rax, %rdx
1454b4562:     	nopw	%cs:(%rax,%rax)
1454b4570:     	movq	%rcx, %rdi
1454b4573:     	cmpq	%rcx, %r12
1454b4576:     	je	0x1454b460e <.text+0x54b360e>
1454b457c:     	leaq	0x160(%rdi), %rcx
1454b4583:     	cmpq	%r13, 0x88(%rdx)
1454b458a:     	leaq	0x160(%rdx), %rdx
1454b4591:     	jne	0x1454b4570 <.text+0x54b3570>
1454b4593:     	movss	-0x38(%rax,%rcx), %xmm1
1454b4599:     	ucomiss	%xmm1, %xmm10
1454b459d:     	jae	0x1454b4600 <.text+0x54b3600>
1454b459f:     	subss	-0x3c(%rax,%rcx), %xmm0
1454b45a5:     	divss	%xmm1, %xmm0
1454b45a9:     	xorps	%xmm1, %xmm1
1454b45ac:     	maxss	%xmm0, %xmm1
1454b45b0:     	movaps	%xmm9, %xmm0
1454b45b4:     	minss	%xmm1, %xmm0
1454b45b8:     	movsd	-0x54(%rax,%rcx), %xmm1
1454b45be:     	movsd	-0x48(%rax,%rcx), %xmm2
1454b45c4:     	subps	%xmm1, %xmm2
1454b45c7:     	movsldup	%xmm0, %xmm13           # xmm13 = xmm0[0,0,2,2]
1454b45cc:     	mulps	%xmm2, %xmm13
1454b45d0:     	addps	%xmm1, %xmm13
1454b45d4:     	movss	-0x4c(%rax,%rcx), %xmm1
1454b45da:     	movss	-0x40(%rax,%rcx), %xmm14
1454b45e1:     	subss	%xmm1, %xmm14
1454b45e6:     	mulss	%xmm0, %xmm14
1454b45eb:     	addss	%xmm1, %xmm14
1454b45f0:     	jmp	0x1454b460e <.text+0x54b360e>
1454b45f2:     	nopw	%cs:(%rax,%rax)
1454b4600:     	movsd	-0x48(%rax,%rcx), %xmm13
1454b4607:     	movss	-0x40(%rax,%rcx), %xmm14
1454b460e:     	movq	0x368(%rbp), %r11
1454b4615:     	movq	0x8a0(%r11), %rax
1454b461c:     	movq	0x8b8(%r11), %rcx
1454b4623:     	leaq	(%rcx,%rax), %rdx
1454b4627:     	rolq	$0x17, %rdx
1454b462b:     	addq	%rax, %rdx
1454b462e:     	movq	0x8a8(%r11), %r8
1454b4635:     	movq	%r8, %r9
1454b4638:     	shlq	$0x11, %r9
1454b463c:     	movq	0x8b0(%r11), %r10
1454b4643:     	xorq	%rax, %r10
1454b4646:     	xorq	%r8, %rcx
1454b4649:     	xorq	%r10, %r8
1454b464c:     	movq	%r8, 0x8a8(%r11)
1454b4653:     	xorq	%rcx, %rax
1454b4656:     	movq	%rax, 0x8a0(%r11)
1454b465d:     	xorq	%r9, %r10
1454b4660:     	movq	%r10, 0x8b0(%r11)
1454b4667:     	rolq	$0x2d, %rcx
1454b466b:     	movq	%rcx, 0x8b8(%r11)
1454b4672:     	shrq	$0x28, %rdx
1454b4676:     	xorps	%xmm0, %xmm0
1454b4679:     	cvtsi2ss	%edx, %xmm0
1454b467d:     	mulss	%xmm12, %xmm0
1454b4682:     	movss	0x47c(%r11), %xmm1
1454b468b:     	movss	0x480(%r11), %xmm2
1454b4694:     	mulss	%xmm15, %xmm2
1454b4699:     	movq	0x358(%rbp), %rax
1454b46a0:     	movl	0x40(%rax), %r9d
1454b46a4:     	movzbl	0x74(%rax), %eax
1454b46a8:     	movzbl	0x129(%r11), %ebx
1454b46b0:     	movb	$0x3, 0x129(%r11)
1454b46b8:     	movups	0x20(%r11), %xmm11
1454b46bd:     	movups	0x40(%r11), %xmm7
1454b46c2:     	movq	$0x0, 0x20(%r11)
1454b46ca:     	movq	$0x0, 0x40(%r11)
1454b46d2:     	ucomiss	%xmm0, %xmm1
1454b46d5:     	ja	0x1454b46db <.text+0x54b36db>
1454b46d7:     	movaps	%xmm15, %xmm2
1454b46db:     	seta	0x28(%rsp)
1454b46e0:     	movb	%al, 0x20(%rsp)
1454b46e4:     	movb	$0x0, 0x30(%rsp)
1454b46e9:     	movq	0x368(%rbp), %rsi
1454b46f0:     	movq	%rsi, %rcx
1454b46f3:     	movq	%r13, %rdx
1454b46f6:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b46fb:     	nop
1454b46fc:     	movq	%r14, 0x340(%rbp)
1454b4703:     	movb	%bl, 0x129(%rsi)
1454b4709:     	movups	%xmm11, 0x20(%rsi)
1454b470e:     	movups	%xmm7, 0x40(%rsi)
1454b4712:     	movq	0x718(%rsi), %r14
1454b4719:     	testq	%r14, %r14
1454b471c:     	je	0x1454b4470 <.text+0x54b3470>
1454b4722:     	movq	0x358(%rbp), %rax
1454b4729:     	movq	(%rax), %rsi
1454b472c:     	movq	0x8(%rax), %r15
1454b4730:     	movq	0x368(%rbp), %rax
1454b4737:     	movq	0x710(%rax), %rbx
1454b473e:     	cmpb	$0x6, (%rbx)
1454b4741:     	jne	0x1454b4770 <.text+0x54b3770>
1454b4743:     	cmpl	$0x0, 0x10(%rbx)
1454b4747:     	jne	0x1454b4770 <.text+0x54b3770>
1454b4749:     	cmpb	$0x1, 0x18(%rbx)
1454b474d:     	jne	0x1454b4770 <.text+0x54b3770>
1454b474f:     	cmpq	%r15, 0x28(%rbx)
1454b4753:     	jne	0x1454b4770 <.text+0x54b3770>
1454b4755:     	movq	0x20(%rbx), %rcx
1454b4759:     	movq	%rsi, %rdx
1454b475c:     	movq	%r15, %r8
1454b475f:     	callq	0x1457731e7 <.text+0x57721e7>
1454b4764:     	testl	%eax, %eax
1454b4766:     	je	0x1454b47c8 <.text+0x54b37c8>
1454b4768:     	nopl	(%rax,%rax)
1454b4770:     	cmpq	$0x1, %r14
1454b4774:     	je	0x1454b4470 <.text+0x54b3470>
1454b477a:     	shlq	$0x6, %r14
1454b477e:     	addq	$0x40, %rbx
1454b4782:     	addq	$-0x40, %r14
1454b4786:     	jmp	0x1454b479e <.text+0x54b379e>
1454b4788:     	nopl	(%rax,%rax)
1454b4790:     	addq	$0x40, %rbx
1454b4794:     	addq	$-0x40, %r14
1454b4798:     	je	0x1454b4470 <.text+0x54b3470>
1454b479e:     	cmpb	$0x6, (%rbx)
1454b47a1:     	jne	0x1454b4790 <.text+0x54b3790>
1454b47a3:     	cmpl	$0x0, 0x10(%rbx)
1454b47a7:     	jne	0x1454b4790 <.text+0x54b3790>
1454b47a9:     	cmpb	$0x1, 0x18(%rbx)
1454b47ad:     	jne	0x1454b4790 <.text+0x54b3790>
1454b47af:     	cmpq	%r15, 0x28(%rbx)
1454b47b3:     	jne	0x1454b4790 <.text+0x54b3790>
1454b47b5:     	movq	0x20(%rbx), %rcx
1454b47b9:     	movq	%rsi, %rdx
1454b47bc:     	movq	%r15, %r8
1454b47bf:     	callq	0x1457731e7 <.text+0x57721e7>
1454b47c4:     	testl	%eax, %eax
1454b47c6:     	jne	0x1454b4790 <.text+0x54b3790>
1454b47c8:     	cmpq	%rdi, %r12
1454b47cb:     	je	0x1454b4470 <.text+0x54b3470>
1454b47d1:     	movl	0x4(%rbx), %edi
1454b47d4:     	movss	0x8(%rbx), %xmm11
1454b47da:     	movlps	%xmm13, -0x20(%rbp)
1454b47df:     	movss	%xmm14, -0x18(%rbp)
1454b47e5:     	movq	%r13, 0x98(%rbp)
1454b47ec:     	movq	0x368(%rbp), %rcx
1454b47f3:     	movss	0x934(%rcx), %xmm0
1454b47fb:     	movss	%xmm0, 0xc(%rbp)
1454b4800:     	movl	$0x42c80000, 0x28(%rbp) # imm = 0x42C80000
1454b4807:     	movq	0x4e0(%rcx), %rax
1454b480e:     	imulq	$0x160, 0x4e8(%rcx), %rcx # imm = 0x160
1454b4819:     	addq	%rax, %rcx
1454b481c:     	movq	%rax, 0x2b8(%rbp)
1454b4823:     	movq	%rcx, 0x2c0(%rbp)
1454b482a:     	leaq	0x98(%rbp), %rax
1454b4831:     	movq	%rax, 0x2c8(%rbp)
1454b4838:     	movq	$0x1, 0x2d0(%rbp)
1454b4843:     	leaq	0xc(%rbp), %rax
1454b4847:     	movq	%rax, 0x2d8(%rbp)
1454b484e:     	leaq	-0x20(%rbp), %rax
1454b4852:     	movq	%rax, 0x2e0(%rbp)
1454b4859:     	leaq	0x28(%rbp), %rax
1454b485d:     	movq	%rax, 0x2e8(%rbp)
1454b4864:     	leaq	0x2f0(%rbp), %rcx
1454b486b:     	leaq	0x2b8(%rbp), %rdx
1454b4872:     	callq	0x14553a880 <.text+0x5539880>
1454b4877:     	nop
1454b4878:     	movq	0x2f8(%rbp), %rcx
1454b487f:     	movq	0x300(%rbp), %r14
1454b4886:     	leaq	0x57(%rbp), %rax
1454b488a:     	movq	%rax, 0x2b8(%rbp)
1454b4891:     	cmpq	$0x2, %r14
1454b4895:     	movq	%rcx, 0x310(%rbp)
1454b489c:     	jae	0x1454b4b92 <.text+0x54b3b92>
1454b48a2:     	movq	0x2f0(%rbp), %rax
1454b48a9:     	movq	%rax, 0x2a8(%rbp)
1454b48b0:     	testq	%r14, %r14
1454b48b3:     	je	0x1454b4941 <.text+0x54b3941>
1454b48b9:     	leaq	-0x1(%r14), %rdx
1454b48bd:     	movl	%r14d, %eax
1454b48c0:     	andl	$0x3, %eax
1454b48c3:     	cmpq	$0x3, %rdx
1454b48c7:     	jae	0x1454b48ce <.text+0x54b38ce>
1454b48c9:     	xorl	%r10d, %r10d
1454b48cc:     	jmp	0x1454b4914 <.text+0x54b3914>
1454b48ce:     	movq	%r14, %rdx
1454b48d1:     	andq	$-0x4, %rdx
1454b48d5:     	leaq	0x38(%rcx), %r8
1454b48d9:     	xorl	%r10d, %r10d
1454b48dc:     	nopl	(%rax)
1454b48e0:     	movq	-0x30(%r8), %r9
1454b48e4:     	movq	%r9, (%rcx,%r10,8)
1454b48e8:     	movq	-0x20(%r8), %r9
1454b48ec:     	movq	%r9, 0x8(%rcx,%r10,8)
1454b48f1:     	movq	-0x10(%r8), %r9
1454b48f5:     	movq	%r9, 0x10(%rcx,%r10,8)
1454b48fa:     	movq	(%r8), %r9
1454b48fd:     	movq	%r9, 0x18(%rcx,%r10,8)
1454b4902:     	addq	$0x4, %r10
1454b4906:     	addq	$0x40, %r8
1454b490a:     	cmpq	%r10, %rdx
1454b490d:     	jne	0x1454b48e0 <.text+0x54b38e0>
1454b490f:     	testq	%rax, %rax
1454b4912:     	je	0x1454b4941 <.text+0x54b3941>
1454b4914:     	leaq	(%rcx,%r10,8), %rdx
1454b4918:     	shlq	$0x4, %r10
1454b491c:     	addq	%rcx, %r10
1454b491f:     	addq	$0x8, %r10
1454b4923:     	shll	$0x3, %eax
1454b4926:     	xorl	%r8d, %r8d
1454b4929:     	nopl	(%rax)
1454b4930:     	movq	(%r10,%r8,2), %r9
1454b4934:     	movq	%r9, (%rdx,%r8)
1454b4938:     	addq	$0x8, %r8
1454b493c:     	cmpq	%r8, %rax
1454b493f:     	jne	0x1454b4930 <.text+0x54b3930>
1454b4941:     	movq	%rcx, %r15
1454b4944:     	testl	%edi, %edi
1454b4946:     	movq	0x318(%rbp), %r12
1454b494d:     	je	0x1454b4984 <.text+0x54b3984>
1454b494f:     	leaq	(%rcx,%r14,8), %r15
1454b4953:     	shlq	$0x3, %rdi
1454b4957:     	shlq	$0x3, %r14
1454b495b:     	xorl	%eax, %eax
1454b495d:     	nopl	(%rax)
1454b4960:     	cmpq	%rax, %r14
1454b4963:     	je	0x1454b497d <.text+0x54b397d>
1454b4965:     	addq	$0x8, %rax
1454b4969:     	cmpq	%rax, %rdi
1454b496c:     	jne	0x1454b4960 <.text+0x54b3960>
1454b496e:     	movq	0x310(%rbp), %rcx
1454b4975:     	addq	%rcx, %rax
1454b4978:     	movq	%rax, %r15
1454b497b:     	jmp	0x1454b4984 <.text+0x54b3984>
1454b497d:     	movq	0x310(%rbp), %rcx
1454b4984:     	movq	0x2a8(%rbp), %rax
1454b498b:     	shlq	$0x4, %rax
1454b498f:     	movq	%rax, 0x80(%rbp)
1454b4996:     	mulss	%xmm15, %xmm11
1454b499b:     	movq	%rcx, %rdi
1454b499e:     	cmpq	%r15, %rdi
1454b49a1:     	je	0x1454b4b66 <.text+0x54b3b66>
1454b49a7:     	nopw	(%rax,%rax)
1454b49b0:     	movq	(%rdi), %r14
1454b49b3:     	movq	%r14, 0x28(%rbp)
1454b49b7:     	movq	%r14, 0x2f8(%rbp)
1454b49be:     	movl	$0x0, 0x2f0(%rbp)
1454b49c8:     	movl	$0x0, 0x98(%rbp)
1454b49d2:     	leaq	0x98(%rbp), %rax
1454b49d9:     	movq	%rax, 0x30(%rsp)
1454b49de:     	leaq	0x2f0(%rbp), %rax
1454b49e5:     	movq	%rax, 0x28(%rsp)
1454b49ea:     	movq	$0x1, 0x20(%rsp)
1454b49f3:     	leaq	0x2b8(%rbp), %rcx
1454b49fa:     	movq	%r13, %rdx
1454b49fd:     	movl	$0x6538, %r8d           # imm = 0x6538
1454b4a03:     	leaq	0x28(%rbp), %r9
1454b4a07:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b4a0c:     	nop
1454b4a0d:     	movq	0x368(%rbp), %rax
1454b4a14:     	movq	0x560(%rax), %rbx
1454b4a1b:     	cmpq	0x550(%rax), %rbx
1454b4a22:     	jne	0x1454b4a2d <.text+0x54b3a2d>
1454b4a24:     	movq	%r12, %rcx
1454b4a27:     	callq	0x145774710 <.text+0x5773710>
1454b4a2c:     	nop
1454b4a2d:     	addq	$0x8, %rdi
1454b4a31:     	movq	0x368(%rbp), %r11
1454b4a38:     	movq	0x558(%r11), %rax
1454b4a3f:     	movq	%rbx, %rcx
1454b4a42:     	shlq	$0x5, %rcx
1454b4a46:     	movups	0x2b8(%rbp), %xmm0
1454b4a4d:     	movups	0x2c8(%rbp), %xmm1
1454b4a54:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4a59:     	movups	%xmm0, (%rax,%rcx)
1454b4a5d:     	incq	%rbx
1454b4a60:     	movq	%rbx, 0x560(%r11)
1454b4a67:     	movq	0x8a0(%r11), %rax
1454b4a6e:     	movq	0x8b8(%r11), %rcx
1454b4a75:     	leaq	(%rcx,%rax), %rdx
1454b4a79:     	rolq	$0x17, %rdx
1454b4a7d:     	addq	%rax, %rdx
1454b4a80:     	movq	0x8a8(%r11), %r8
1454b4a87:     	movq	%r8, %r9
1454b4a8a:     	shlq	$0x11, %r9
1454b4a8e:     	movq	0x8b0(%r11), %r10
1454b4a95:     	xorq	%rax, %r10
1454b4a98:     	xorq	%r8, %rcx
1454b4a9b:     	xorq	%r10, %r8
1454b4a9e:     	movq	%r8, 0x8a8(%r11)
1454b4aa5:     	xorq	%rcx, %rax
1454b4aa8:     	movq	%rax, 0x8a0(%r11)
1454b4aaf:     	xorq	%r9, %r10
1454b4ab2:     	movq	%r10, 0x8b0(%r11)
1454b4ab9:     	rolq	$0x2d, %rcx
1454b4abd:     	movq	%rcx, 0x8b8(%r11)
1454b4ac4:     	shrq	$0x28, %rdx
1454b4ac8:     	xorps	%xmm0, %xmm0
1454b4acb:     	cvtsi2ss	%edx, %xmm0
1454b4acf:     	mulss	%xmm12, %xmm0
1454b4ad4:     	movss	0x47c(%r11), %xmm1
1454b4add:     	movss	0x480(%r11), %xmm2
1454b4ae6:     	mulss	%xmm11, %xmm2
1454b4aeb:     	movq	0x358(%rbp), %rax
1454b4af2:     	movl	0x40(%rax), %r9d
1454b4af6:     	movzbl	0x74(%rax), %eax
1454b4afa:     	movzbl	0x129(%r11), %ebx
1454b4b02:     	movb	$0x3, 0x129(%r11)
1454b4b0a:     	movups	0x20(%r11), %xmm7
1454b4b0f:     	movups	0x40(%r11), %xmm8
1454b4b14:     	movq	$0x0, 0x20(%r11)
1454b4b1c:     	movq	$0x0, 0x40(%r11)
1454b4b24:     	ucomiss	%xmm0, %xmm1
1454b4b27:     	ja	0x1454b4b2d <.text+0x54b3b2d>
1454b4b29:     	movaps	%xmm11, %xmm2
1454b4b2d:     	seta	0x28(%rsp)
1454b4b32:     	movb	%al, 0x20(%rsp)
1454b4b36:     	movb	$0x0, 0x30(%rsp)
1454b4b3b:     	movq	0x368(%rbp), %rsi
1454b4b42:     	movq	%rsi, %rcx
1454b4b45:     	movq	%r14, %rdx
1454b4b48:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b4b4d:     	nop
1454b4b4e:     	movb	%bl, 0x129(%rsi)
1454b4b54:     	movups	%xmm7, 0x20(%rsi)
1454b4b58:     	movups	%xmm8, 0x40(%rsi)
1454b4b5d:     	cmpq	%r15, %rdi
1454b4b60:     	jne	0x1454b49b0 <.text+0x54b39b0>
1454b4b66:     	cmpq	$0x0, 0x2a8(%rbp)
1454b4b6e:     	je	0x1454b4470 <.text+0x54b3470>
1454b4b74:     	movl	$0x8, %r8d
1454b4b7a:     	movq	0x310(%rbp), %rcx
1454b4b81:     	movq	0x80(%rbp), %rdx
1454b4b88:     	callq	0x1400021d0 <.text+0x11d0>
1454b4b8d:     	jmp	0x1454b4470 <.text+0x54b3470>
1454b4b92:     	cmpq	$0x15, %r14
1454b4b96:     	jae	0x1454b4bc7 <.text+0x54b3bc7>
1454b4b98:     	movl	$0x1, %r8d
1454b4b9e:     	movq	%r14, %rdx
1454b4ba1:     	leaq	0x2b8(%rbp), %r9
1454b4ba8:     	callq	0x14193aca0 <.text+0x1939ca0>
1454b4bad:     	movq	0x2f0(%rbp), %rax
1454b4bb4:     	movq	%rax, 0x2a8(%rbp)
1454b4bbb:     	movq	0x310(%rbp), %rcx
1454b4bc2:     	jmp	0x1454b48b9 <.text+0x54b38b9>
1454b4bc7:     	movq	%r14, %rdx
1454b4bca:     	leaq	0x2b8(%rbp), %r8
1454b4bd1:     	callq	0x145481680 <.text+0x5480680>
1454b4bd6:     	nop
1454b4bd7:     	jmp	0x1454b4bad <.text+0x54b3bad>
1454b4bd9:     	movq	0x2a0(%rbp), %rdx
1454b4be0:     	testq	%rdx, %rdx
1454b4be3:     	movl	0x328(%rbp), %esi
1454b4be9:     	movq	0x58(%rbp), %rbx
1454b4bed:     	movq	0x48(%rbp), %rdi
1454b4bf1:     	je	0x1454b4c06 <.text+0x54b3c06>
1454b4bf3:     	shlq	$0x3, %rdx
1454b4bf7:     	movl	$0x8, %r8d
1454b4bfd:     	movq	(%rbp), %rcx
1454b4c01:     	callq	0x1400021d0 <.text+0x11d0>
1454b4c06:     	movq	0x368(%rbp), %r13
1454b4c0d:     	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454b4c17:     	leaq	0x210(%rbp), %r15
1454b4c1e:     	movq	0x30(%rbp), %r14
1454b4c22:     	jmp	0x1454b427a <.text+0x54b327a>
1454b4c27:     	movq	0xb0(%rbp), %r14
1454b4c2e:     	movq	0x748(%r13), %rax
1454b4c35:     	movss	0x553673(%rip), %xmm7   # 0x145a082b0
1454b4c3d:     	testq	%rax, %rax
1454b4c40:     	je	0x1454b4c9a <.text+0x54b3c9a>
1454b4c42:     	movq	%r12, %rsi
1454b4c45:     	movq	(%r14), %rdi
1454b4c48:     	movq	0x8(%r14), %rbx
1454b4c4c:     	movq	0x740(%r13), %r15
1454b4c53:     	shlq	$0x3, %rax
1454b4c57:     	leaq	(%rax,%rax,2), %r13
1454b4c5b:     	xorl	%r12d, %r12d
1454b4c5e:     	jmp	0x1454b4c69 <.text+0x54b3c69>
1454b4c60:     	addq	$0x18, %r12
1454b4c64:     	cmpq	%r12, %r13
1454b4c67:     	je	0x1454b4c8a <.text+0x54b3c8a>
1454b4c69:     	cmpq	%rbx, 0x8(%r15,%r12)
1454b4c6e:     	jne	0x1454b4c60 <.text+0x54b3c60>
1454b4c70:     	movq	(%r15,%r12), %rcx
1454b4c74:     	movq	%rdi, %rdx
1454b4c77:     	movq	%rbx, %r8
1454b4c7a:     	callq	0x1457731e7 <.text+0x57721e7>
1454b4c7f:     	testl	%eax, %eax
1454b4c81:     	jne	0x1454b4c60 <.text+0x54b3c60>
1454b4c83:     	movss	0x10(%r15,%r12), %xmm7
1454b4c8a:     	movq	0x368(%rbp), %r13
1454b4c91:     	movq	%rsi, %r12
1454b4c94:     	movl	0x328(%rbp), %esi
1454b4c9a:     	movq	0xa8(%rbp), %rax
1454b4ca1:     	movss	(%rax), %xmm0
1454b4ca5:     	ucomiss	%xmm7, %xmm0
1454b4ca8:     	jb	0x1454b5016 <.text+0x54b4016>
1454b4cae:     	movl	0x408(%r13), %eax
1454b4cb5:     	movl	%eax, 0x2f8(%rbp)
1454b4cbb:     	movq	0x400(%r13), %rax
1454b4cc2:     	movq	%rax, 0x2f0(%rbp)
1454b4cc9:     	movb	%sil, 0x357(%rbp)
1454b4cd0:     	movq	$0x0, 0x28(%rsp)
1454b4cd9:     	movq	$0x8, 0x20(%rsp)
1454b4ce2:     	leaq	0x2b8(%rbp), %rcx
1454b4ce9:     	leaq	0x2f0(%rbp), %rdi
1454b4cf0:     	movss	0x52fca4(%rip), %xmm3   # 0x1459e499c
1454b4cf8:     	movq	%r13, %rdx
1454b4cfb:     	movq	%rdi, %r8
1454b4cfe:     	callq	0x145500300 <.text+0x54ff300>
1454b4d03:     	nop
1454b4d04:     	cmpq	$0x0, 0x2c8(%rbp)
1454b4d0c:     	je	0x1454b4d88 <.text+0x54b3d88>
1454b4d0e:     	movq	0x2b8(%rbp), %rdx
1454b4d15:     	testq	%rdx, %rdx
1454b4d18:     	je	0x1454b4d30 <.text+0x54b3d30>
1454b4d1a:     	movq	0x2c0(%rbp), %rcx
1454b4d21:     	shlq	$0x3, %rdx
1454b4d25:     	movl	$0x8, %r8d
1454b4d2b:     	callq	0x1400021d0 <.text+0x11d0>
1454b4d30:     	movss	0x58(%r14), %xmm10
1454b4d36:     	mulss	0x4639b1(%rip), %xmm10  # 0x1459186f0
1454b4d3f:     	mulss	0xd0(%rbp), %xmm10
1454b4d48:     	mulss	0xf8(%rbp), %xmm10
1454b4d51:     	movsd	0x400(%r13), %xmm7
1454b4d5a:     	movshdup	%xmm7, %xmm9            # xmm9 = xmm7[1,1,3,3]
1454b4d5f:     	movq	0x898(%r13), %rbx
1454b4d66:     	leaq	0x10(%rbx), %rcx
1454b4d6a:     	movb	%sil, 0x357(%rbp)
1454b4d71:     	movaps	%xmm7, %xmm1
1454b4d74:     	movaps	%xmm9, %xmm2
1454b4d78:     	callq	0x14552a140 <.text+0x5529140>
1454b4d7d:     	nop
1454b4d7e:     	testb	$0x1, %al
1454b4d80:     	je	0x1454b4db3 <.text+0x54b3db3>
1454b4d82:     	movaps	%xmm0, %xmm8
1454b4d86:     	jmp	0x1454b4df6 <.text+0x54b3df6>
1454b4d88:     	movq	0x2b8(%rbp), %rdx
1454b4d8f:     	testq	%rdx, %rdx
1454b4d92:     	je	0x1454b5016 <.text+0x54b4016>
1454b4d98:     	movq	0x2c0(%rbp), %rcx
1454b4d9f:     	shlq	$0x3, %rdx
1454b4da3:     	movl	$0x8, %r8d
1454b4da9:     	callq	0x1400021d0 <.text+0x11d0>
1454b4dae:     	jmp	0x1454b5016 <.text+0x54b4016>
1454b4db3:     	cmpq	$-0x1, 0x68(%rbx)
1454b4db8:     	je	0x1454b4ded <.text+0x54b3ded>
1454b4dba:     	leaq	0x68(%rbx), %rdx
1454b4dbe:     	movb	%sil, 0x357(%rbp)
1454b4dc5:     	leaq	0x2b8(%rbp), %rcx
1454b4dcc:     	movaps	%xmm7, %xmm2
1454b4dcf:     	movaps	%xmm9, %xmm3
1454b4dd3:     	callq	0x14552d220 <.text+0x552c220>
1454b4dd8:     	nop
1454b4dd9:     	cmpl	$0x1, 0x2b8(%rbp)
1454b4de0:     	jne	0x1454b4ded <.text+0x54b3ded>
1454b4de2:     	movss	0x2c4(%rbp), %xmm8
1454b4deb:     	jmp	0x1454b4df6 <.text+0x54b3df6>
1454b4ded:     	movss	0xb8(%rbx), %xmm8
1454b4df6:     	movb	%sil, 0x357(%rbp)
1454b4dfd:     	leaq	0xb0(%rbp), %rdx
1454b4e04:     	movq	%r13, %rcx
1454b4e07:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454b4e0c:     	nop
1454b4e0d:     	movq	0x3e8(%r13), %rdx
1454b4e14:     	movl	0x40(%r14), %r8d
1454b4e18:     	movlps	%xmm7, 0x2f4(%rbp)
1454b4e1f:     	movss	%xmm8, 0x2fc(%rbp)
1454b4e28:     	movl	$0x1, 0x2f0(%rbp)
1454b4e32:     	movl	$0x0, 0x220(%rbp)
1454b4e3c:     	movb	%sil, 0x357(%rbp)
1454b4e43:     	leaq	0x220(%rbp), %rax
1454b4e4a:     	movq	%rax, 0x30(%rsp)
1454b4e4f:     	movq	%rdi, 0x28(%rsp)
1454b4e54:     	movq	$0x0, 0x20(%rsp)
1454b4e5d:     	leaq	0x2b8(%rbp), %rcx
1454b4e64:     	movl	$0x8, %r9d
1454b4e6a:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b4e6f:     	nop
1454b4e70:     	movq	0x560(%r13), %rsi
1454b4e77:     	cmpq	0x550(%r13), %rsi
1454b4e7e:     	jne	0x1454b4e8d <.text+0x54b3e8d>
1454b4e80:     	movq	0x318(%rbp), %rcx
1454b4e87:     	callq	0x145774710 <.text+0x5773710>
1454b4e8c:     	nop
1454b4e8d:     	movq	0x558(%r13), %rax
1454b4e94:     	movq	%rsi, %rcx
1454b4e97:     	shlq	$0x5, %rcx
1454b4e9b:     	movups	0x2b8(%rbp), %xmm0
1454b4ea2:     	movups	0x2c8(%rbp), %xmm1
1454b4ea9:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4eae:     	movups	%xmm0, (%rax,%rcx)
1454b4eb2:     	incq	%rsi
1454b4eb5:     	movq	%rsi, 0x560(%r13)
1454b4ebc:     	cmpq	$0x3, 0x7a8(%r13)
1454b4ec4:     	movl	0x328(%rbp), %esi
1454b4eca:     	jb	0x1454b4f64 <.text+0x54b3f64>
1454b4ed0:     	movb	%sil, 0x357(%rbp)
1454b4ed7:     	leaq	0x1542e6a(%rip), %r9    # 0x1469f7d48
1454b4ede:     	leaq	0x2f0(%rbp), %rcx
1454b4ee5:     	movq	-0x8(%rbp), %rdx
1454b4ee9:     	xorl	%r8d, %r8d
1454b4eec:     	callq	0x145533fc0 <.text+0x5532fc0>
1454b4ef1:     	nop
1454b4ef2:     	movq	0x2f0(%rbp), %rdx
1454b4ef9:     	testq	%rdx, %rdx
1454b4efc:     	je	0x1454b4f64 <.text+0x54b3f64>
1454b4efe:     	movb	%sil, 0x357(%rbp)
1454b4f05:     	leaq	0x2b8(%rbp), %rcx
1454b4f0c:     	callq	0x14545cef0 <.text+0x545bef0>
1454b4f11:     	nop
1454b4f12:     	movq	0x560(%r13), %rsi
1454b4f19:     	cmpq	0x550(%r13), %rsi
1454b4f20:     	jne	0x1454b4f2f <.text+0x54b3f2f>
1454b4f22:     	movq	0x318(%rbp), %rcx
1454b4f29:     	callq	0x145774710 <.text+0x5773710>
1454b4f2e:     	nop
1454b4f2f:     	movq	0x558(%r13), %rax
1454b4f36:     	movq	%rsi, %rcx
1454b4f39:     	shlq	$0x5, %rcx
1454b4f3d:     	movups	0x2b8(%rbp), %xmm0
1454b4f44:     	movups	0x2c8(%rbp), %xmm1
1454b4f4b:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4f50:     	movups	%xmm0, (%rax,%rcx)
1454b4f54:     	incq	%rsi
1454b4f57:     	movq	%rsi, 0x560(%r13)
1454b4f5e:     	movl	0x328(%rbp), %esi
1454b4f64:     	movlps	%xmm7, 0x2b8(%rbp)
1454b4f6b:     	movss	%xmm8, 0x2c0(%rbp)
1454b4f74:     	movb	%sil, 0x357(%rbp)
1454b4f7b:     	movl	$0x10, 0x20(%rsp)
1454b4f83:     	leaq	0x1542dd6(%rip), %rdx   # 0x1469f7d60
1454b4f8a:     	leaq	0x2b8(%rbp), %r8
1454b4f91:     	movq	%r13, %rcx
1454b4f94:     	movl	$0x5, %r9d
1454b4f9a:     	callq	0x1454e4a00 <.text+0x54e3a00>
1454b4f9f:     	nop
1454b4fa0:     	movq	%rax, %rdi
1454b4fa3:     	movaps	0x210(%rbp), %xmm9
1454b4fab:     	movq	0x7a8(%r13), %rbx
1454b4fb2:     	cmpq	0x798(%r13), %rbx
1454b4fb9:     	jne	0x1454b4fcc <.text+0x54b3fcc>
1454b4fbb:     	movb	%sil, 0x357(%rbp)
1454b4fc2:     	movq	-0x8(%rbp), %rcx
1454b4fc6:     	callq	0x145774710 <.text+0x5773710>
1454b4fcb:     	nop
1454b4fcc:     	movaps	0x5796ed(%rip), %xmm0   # 0x145a2e6c0
1454b4fd3:     	movss	%xmm10, %xmm0           # xmm0 = xmm10[0],xmm0[1,2,3]
1454b4fd8:     	shufps	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
1454b4fdd:     	addps	%xmm0, %xmm9
1454b4fe1:     	movq	0x7a0(%r13), %rax
1454b4fe8:     	movq	%rbx, %rcx
1454b4feb:     	shlq	$0x5, %rcx
1454b4fef:     	movq	%rdi, (%rax,%rcx)
1454b4ff3:     	movlps	%xmm7, 0x8(%rax,%rcx)
1454b4ff8:     	movss	%xmm8, 0x10(%rax,%rcx)
1454b4fff:     	movlps	%xmm9, 0x14(%rax,%rcx)
1454b5005:     	movss	%xmm10, 0x1c(%rax,%rcx)
1454b500c:     	incq	%rbx
1454b500f:     	movq	%rbx, 0x7a8(%r13)
1454b5016:     	testb	%sil, %sil
1454b5019:     	je	0x1454b5037 <.text+0x54b4037>
1454b501b:     	movq	0x68(%rbp), %rdx
1454b501f:     	testq	%rdx, %rdx
1454b5022:     	je	0x1454b5037 <.text+0x54b4037>
1454b5024:     	movq	0x70(%rbp), %rcx
1454b5028:     	shlq	$0x3, %rdx
1454b502c:     	movl	$0x8, %r8d
1454b5032:     	callq	0x1400021d0 <.text+0x11d0>
1454b5037:     	movq	0x7c0(%r13), %rax
1454b503e:     	testq	%rax, %rax
1454b5041:     	je	0x1454b5261 <.text+0x54b4261>
1454b5047:     	movq	0x7b8(%r13), %rcx
1454b504e:     	leaq	(%rcx,%rax,8), %rax
1454b5052:     	leaq	0x4d8(%r13), %rdx
1454b5059:     	movq	%rcx, 0xb0(%rbp)
1454b5060:     	movq	%rax, 0xb8(%rbp)
1454b5067:     	movq	%rdx, 0xc0(%rbp)
1454b506e:     	leaq	0x10(%rbp), %rax
1454b5072:     	movq	%rax, 0xc8(%rbp)
1454b5079:     	leaq	0x240(%rbp), %rcx
1454b5080:     	leaq	0xb0(%rbp), %rdx
1454b5087:     	callq	0x145541390 <.text+0x5540390>
1454b508c:     	movq	0x240(%rbp), %rax
1454b5093:     	movq	%rax, 0x340(%rbp)
1454b509a:     	movq	0x248(%rbp), %rax
1454b50a1:     	movq	%rax, 0x358(%rbp)
1454b50a8:     	movq	0x250(%rbp), %rax
1454b50af:     	testq	%rax, %rax
1454b50b2:     	je	0x1454b523f <.text+0x54b423f>
1454b50b8:     	movq	0x358(%rbp), %r14
1454b50bf:     	leaq	(%r14,%rax,8), %rbx
1454b50c3:     	jmp	0x1454b50e9 <.text+0x54b40e9>
1454b50c5:     	movq	%r13, %rcx
1454b50c8:     	movq	%rdi, %rdx
1454b50cb:     	movl	$0x76, %r8d
1454b50d1:     	xorl	%r9d, %r9d
1454b50d4:     	callq	0x1454e3550 <.text+0x54e2550>
1454b50d9:     	nop
1454b50da:     	nopw	(%rax,%rax)
1454b50e0:     	cmpq	%rbx, %r14
1454b50e3:     	je	0x1454b523f <.text+0x54b423f>
1454b50e9:     	movq	(%r14), %rdi
1454b50ec:     	movq	0x7c0(%r13), %rax
1454b50f3:     	testq	%rax, %rax
1454b50f6:     	je	0x1454b5122 <.text+0x54b4122>
1454b50f8:     	movq	0x7b8(%r13), %rcx
1454b50ff:     	xorl	%r8d, %r8d
1454b5102:     	nopw	%cs:(%rax,%rax)
1454b5110:     	cmpq	%rdi, (%rcx,%r8,8)
1454b5114:     	je	0x1454b51c1 <.text+0x54b41c1>
1454b511a:     	incq	%r8
1454b511d:     	cmpq	%r8, %rax
1454b5120:     	jne	0x1454b5110 <.text+0x54b4110>
1454b5122:     	addq	$0x8, %r14
1454b5126:     	movss	0x934(%r13), %xmm0
1454b512f:     	movq	0x4e0(%r13), %rax
1454b5136:     	imulq	$0x160, 0x4e8(%r13), %rdx # imm = 0x160
1454b5141:     	xorl	%ecx, %ecx
1454b5143:     	movq	%rax, %r8
1454b5146:     	nopw	%cs:(%rax,%rax)
1454b5150:     	cmpq	%rcx, %rdx
1454b5153:     	je	0x1454b50e0 <.text+0x54b40e0>
1454b5155:     	addq	$0x160, %rcx            # imm = 0x160
1454b515c:     	cmpq	%rdi, 0x88(%r8)
1454b5163:     	leaq	0x160(%r8), %r8
1454b516a:     	jne	0x1454b5150 <.text+0x54b4150>
1454b516c:     	movl	$0x0, -0x20(%rax,%rcx)
1454b5174:     	movss	%xmm0, -0x34(%rax,%rcx)
1454b517a:     	movl	-0xf8(%rax,%rcx), %r8d
1454b5182:     	movq	-0xd0(%rax,%rcx), %rdx
1454b518a:     	testq	%rdx, %rdx
1454b518d:     	je	0x1454b51b3 <.text+0x54b41b3>
1454b518f:     	testl	%r8d, %r8d
1454b5192:     	jne	0x1454b50e0 <.text+0x54b40e0>
1454b5198:     	movss	-0x58(%rax,%rcx), %xmm3
1454b519e:     	movl	0x24(%rdx), %r8d
1454b51a2:     	movq	%r13, %rcx
1454b51a5:     	movq	%rdi, %rdx
1454b51a8:     	callq	0x1454e75f0 <.text+0x54e65f0>
1454b51ad:     	nop
1454b51ae:     	jmp	0x1454b50c5 <.text+0x54b40c5>
1454b51b3:     	testl	%r8d, %r8d
1454b51b6:     	jne	0x1454b50e0 <.text+0x54b40e0>
1454b51bc:     	jmp	0x1454b50c5 <.text+0x54b40c5>
1454b51c1:     	leaq	0x1(%r8), %rdx
1454b51c5:     	cmpq	%rax, %rdx
1454b51c8:     	jae	0x1454b51fc <.text+0x54b41fc>
1454b51ca:     	leal	(%rax,%r8), %r10d
1454b51ce:     	movq	%r8, %r9
1454b51d1:     	testb	$0x1, %r10b
1454b51d5:     	jne	0x1454b51f0 <.text+0x54b41f0>
1454b51d7:     	movq	0x8(%rcx,%r8,8), %rdx
1454b51dc:     	movq	%r8, %r9
1454b51df:     	cmpq	%rdi, %rdx
1454b51e2:     	je	0x1454b51ec <.text+0x54b41ec>
1454b51e4:     	movq	%rdx, (%rcx,%r8,8)
1454b51e8:     	leaq	0x1(%r8), %r9
1454b51ec:     	leaq	0x2(%r8), %rdx
1454b51f0:     	leaq	-0x2(%rax), %r10
1454b51f4:     	cmpq	%r8, %r10
1454b51f7:     	movq	%r9, %r8
1454b51fa:     	jne	0x1454b521c <.text+0x54b421c>
1454b51fc:     	movq	%r8, 0x7c0(%r13)
1454b5203:     	jmp	0x1454b5122 <.text+0x54b4122>
1454b5208:     	nopl	(%rax,%rax)
1454b5210:     	addq	$0x2, %rdx
1454b5214:     	movq	%r9, %r8
1454b5217:     	cmpq	%rdx, %rax
1454b521a:     	je	0x1454b51fc <.text+0x54b41fc>
1454b521c:     	movq	(%rcx,%rdx,8), %r8
1454b5220:     	cmpq	%rdi, %r8
1454b5223:     	je	0x1454b522c <.text+0x54b422c>
1454b5225:     	movq	%r8, (%rcx,%r9,8)
1454b5229:     	incq	%r9
1454b522c:     	movq	0x8(%rcx,%rdx,8), %r8
1454b5231:     	cmpq	%rdi, %r8
1454b5234:     	je	0x1454b5210 <.text+0x54b4210>
1454b5236:     	movq	%r8, (%rcx,%r9,8)
1454b523a:     	incq	%r9
1454b523d:     	jmp	0x1454b5210 <.text+0x54b4210>
1454b523f:     	movq	0x340(%rbp), %rdx
1454b5246:     	testq	%rdx, %rdx
1454b5249:     	je	0x1454b5261 <.text+0x54b4261>
1454b524b:     	shlq	$0x3, %rdx
1454b524f:     	movl	$0x8, %r8d
1454b5255:     	movq	0x358(%rbp), %rcx
1454b525c:     	callq	0x1400021d0 <.text+0x11d0>
1454b5261:     	movss	0x934(%r13), %xmm8
1454b526a:     	movq	0x298(%rbp), %rax
1454b5271:     	movups	0x3c(%rax), %xmm0
1454b5275:     	movups	%xmm0, 0x27c(%rbp)
1454b527c:     	movups	(%rax), %xmm0
1454b527f:     	movups	0x10(%rax), %xmm1
1454b5283:     	movups	0x20(%rax), %xmm2
1454b5287:     	movups	0x30(%rax), %xmm3
1454b528b:     	movaps	%xmm3, 0x270(%rbp)
1454b5292:     	movaps	%xmm2, 0x260(%rbp)
1454b5299:     	movaps	%xmm1, 0x250(%rbp)
1454b52a0:     	movaps	%xmm0, 0x240(%rbp)
1454b52a7:     	movq	0x2b8(%r13), %rcx
1454b52ae:     	testq	%rcx, %rcx
1454b52b1:     	je	0x1454b5654 <.text+0x54b4654>
1454b52b7:     	movq	0x2b0(%r13), %rax
1454b52be:     	imulq	$0x58, %rcx, %rcx
1454b52c2:     	xorl	%edx, %edx
1454b52c4:     	jmp	0x1454b52d9 <.text+0x54b42d9>
1454b52c6:     	nopw	%cs:(%rax,%rax)
1454b52d0:     	addq	$0x58, %rdx
1454b52d4:     	cmpq	%rdx, %rcx
1454b52d7:     	je	0x1454b5336 <.text+0x54b4336>
1454b52d9:     	movq	(%rax,%rdx), %r8
1454b52dd:     	cmpq	$0x9, 0x8(%r8)
1454b52e2:     	jne	0x1454b52d0 <.text+0x54b42d0>
1454b52e4:     	movq	(%r8), %r8
1454b52e7:     	movq	(%r8), %r9
1454b52ea:     	xorq	%r12, %r9
1454b52ed:     	movzbl	0x8(%r8), %r8d
1454b52f2:     	xorq	$0x65, %r8
1454b52f6:     	orq	%r9, %r8
1454b52f9:     	jne	0x1454b52d0 <.text+0x54b42d0>
1454b52fb:     	movss	0x7dc(%r13), %xmm0
1454b5304:     	mulss	0x4604f4(%rip), %xmm0   # 0x145915800
1454b530c:     	cvttss2si	%xmm0, %rax
1454b5311:     	xorl	%ecx, %ecx
1454b5313:     	xorps	%xmm1, %xmm1
1454b5316:     	ucomiss	%xmm1, %xmm0
1454b5319:     	cmovael	%eax, %ecx
1454b531c:     	ucomiss	0x452209(%rip), %xmm0   # 0x14590752c
1454b5323:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454b5329:     	cmovbel	%ecx, %r8d
1454b532d:     	movw	$0x18, %ax
1454b5331:     	jmp	0x1454b5562 <.text+0x54b4562>
1454b5336:     	xorl	%edx, %edx
1454b5338:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454b5342:     	jmp	0x1454b5359 <.text+0x54b4359>
1454b5344:     	nopw	%cs:(%rax,%rax)
1454b5350:     	addq	$0x58, %rdx
1454b5354:     	cmpq	%rdx, %rcx
1454b5357:     	je	0x1454b5392 <.text+0x54b4392>
1454b5359:     	movq	(%rax,%rdx), %r9
1454b535d:     	cmpq	$0x9, 0x8(%r9)
1454b5362:     	jne	0x1454b5350 <.text+0x54b4350>
1454b5364:     	movq	(%r9), %r9
1454b5367:     	movq	(%r9), %r10
1454b536a:     	xorq	%r8, %r10
1454b536d:     	movzbl	0x8(%r9), %r9d
1454b5372:     	xorq	$0x65, %r9
1454b5376:     	orq	%r10, %r9
1454b5379:     	jne	0x1454b5350 <.text+0x54b4350>
1454b537b:     	movl	0x7e8(%r13), %eax
1454b5382:     	shll	$0x2, %eax
1454b5385:     	leal	(%rax,%rax,4), %r8d
1454b5389:     	movw	$0x1a, %ax
1454b538d:     	jmp	0x1454b5562 <.text+0x54b4562>
1454b5392:     	xorl	%edx, %edx
1454b5394:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454b539e:     	jmp	0x1454b53a9 <.text+0x54b43a9>
1454b53a0:     	addq	$0x58, %rdx
1454b53a4:     	cmpq	%rdx, %rcx
1454b53a7:     	je	0x1454b53de <.text+0x54b43de>
1454b53a9:     	movq	(%rax,%rdx), %r9
1454b53ad:     	cmpq	$0x9, 0x8(%r9)
1454b53b2:     	jne	0x1454b53a0 <.text+0x54b43a0>
1454b53b4:     	movq	(%r9), %r9
1454b53b7:     	movq	(%r9), %r10
1454b53ba:     	xorq	%r8, %r10
1454b53bd:     	movzbl	0x8(%r9), %r9d
1454b53c2:     	xorq	$0x65, %r9
1454b53c6:     	orq	%r10, %r9
1454b53c9:     	jne	0x1454b53a0 <.text+0x54b43a0>
1454b53cb:     	movl	0x7f0(%r13), %eax
1454b53d2:     	shll	$0x2, %eax
1454b53d5:     	leal	(%rax,%rax,4), %r8d
1454b53d9:     	jmp	0x1454b555e <.text+0x54b455e>
1454b53de:     	xorl	%edx, %edx
1454b53e0:     	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
1454b53ea:     	jmp	0x1454b53fd <.text+0x54b43fd>
1454b53ec:     	nopl	(%rax)
1454b53f0:     	addq	$0x58, %rdx
1454b53f4:     	cmpq	%rdx, %rcx
1454b53f7:     	je	0x1454b5654 <.text+0x54b4654>
1454b53fd:     	movq	(%rax,%rdx), %r8
1454b5401:     	cmpq	$0x9, 0x8(%r8)
1454b5406:     	jne	0x1454b53f0 <.text+0x54b43f0>
1454b5408:     	movq	(%r8), %rdi
1454b540b:     	movq	(%rdi), %r10
1454b540e:     	xorq	%r9, %r10
1454b5411:     	movzbl	0x8(%rdi), %r11d
1454b5416:     	xorq	$0x6c, %r11
1454b541a:     	orq	%r10, %r11
1454b541d:     	jne	0x1454b53f0 <.text+0x54b43f0>
1454b541f:     	movl	0x8(%rax,%rdx), %ecx
1454b5423:     	movss	0x14(%rax,%rdx), %xmm0
1454b5429:     	movl	0x18(%rax,%rdx), %r9d
1454b542e:     	movl	0x34(%rax,%rdx), %r10d
1454b5433:     	movl	%r10d, 0xe4(%rbp)
1454b543a:     	movups	0x24(%rax,%rdx), %xmm1
1454b543f:     	movups	%xmm1, 0xd4(%rbp)
1454b5446:     	movups	0x38(%rax,%rdx), %xmm1
1454b544b:     	movups	0x44(%rax,%rdx), %xmm2
1454b5450:     	movups	%xmm1, 0xe8(%rbp)
1454b5457:     	movups	%xmm2, 0xf4(%rbp)
1454b545e:     	movq	%r8, 0xb0(%rbp)
1454b5465:     	movl	%ecx, 0xb8(%rbp)
1454b546b:     	movsd	0xc(%rax,%rdx), %xmm1
1454b5471:     	movsd	%xmm1, 0xbc(%rbp)
1454b5479:     	movss	%xmm0, 0xc4(%rbp)
1454b5481:     	movl	%r9d, 0xc8(%rbp)
1454b5488:     	movsd	0x1c(%rax,%rdx), %xmm0
1454b548e:     	movsd	%xmm0, 0xcc(%rbp)
1454b5496:     	movq	0x7a8(%r13), %rax
1454b549d:     	testq	%rax, %rax
1454b54a0:     	je	0x1454b54cc <.text+0x54b44cc>
1454b54a2:     	movq	0x7a0(%r13), %rcx
1454b54a9:     	shlq	$0x5, %rax
1454b54ad:     	movss	-0xc(%rcx,%rax), %xmm1
1454b54b3:     	movss	-0x4(%rcx,%rax), %xmm0
1454b54b9:     	subss	%xmm8, %xmm1
1454b54be:     	maxss	0x45de2a(%rip), %xmm0   # 0x1459132f0
1454b54c6:     	divss	%xmm0, %xmm1
1454b54ca:     	jmp	0x1454b5522 <.text+0x54b4522>
1454b54cc:     	leaq	0x738(%r13), %rbx
1454b54d3:     	leaq	0xb0(%rbp), %rcx
1454b54da:     	leaq	0x240(%rbp), %rdx
1454b54e1:     	callq	0x1454537e0 <.text+0x54527e0>
1454b54e6:     	movaps	%xmm0, %xmm7
1454b54e9:     	testb	$0x1, %al
1454b54eb:     	jne	0x1454b54f5 <.text+0x54b44f5>
1454b54ed:     	movss	0x4603e3(%rip), %xmm7   # 0x1459158d8
1454b54f5:     	movl	$0x9, %r8d
1454b54fb:     	movq	%rbx, %rcx
1454b54fe:     	movq	%rdi, %rdx
1454b5501:     	callq	0x145451250 <.text+0x5450250>
1454b5506:     	subss	%xmm8, %xmm0
1454b550b:     	xorps	%xmm1, %xmm1
1454b550e:     	maxss	%xmm1, %xmm0
1454b5512:     	divss	%xmm7, %xmm0
1454b5516:     	movss	0x451f72(%rip), %xmm1   # 0x145907490
1454b551e:     	subss	%xmm0, %xmm1
1454b5522:     	xorps	%xmm0, %xmm0
1454b5525:     	maxss	%xmm1, %xmm0
1454b5529:     	movss	0x451f5f(%rip), %xmm1   # 0x145907490
1454b5531:     	minss	%xmm0, %xmm1
1454b5535:     	mulss	0x451fff(%rip), %xmm1   # 0x14590753c
1454b553d:     	xorps	%xmm0, %xmm0
1454b5540:     	cvttss2si	%xmm1, %rax
1454b5545:     	xorl	%ecx, %ecx
1454b5547:     	ucomiss	%xmm0, %xmm1
1454b554a:     	cmovael	%eax, %ecx
1454b554d:     	ucomiss	0x451fd8(%rip), %xmm1   # 0x14590752c
1454b5554:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454b555a:     	cmovbel	%ecx, %r8d
1454b555e:     	movw	$0x17, %ax
1454b5562:     	cmpl	$0x1, 0x7d0(%r13)
1454b556a:     	jne	0x1454b5583 <.text+0x54b4583>
1454b556c:     	cmpw	%ax, 0x7d4(%r13)
1454b5574:     	jne	0x1454b5583 <.text+0x54b4583>
1454b5576:     	cmpl	%r8d, 0x7d8(%r13)
1454b557d:     	je	0x1454b5654 <.text+0x54b4654>
1454b5583:     	movl	$0x1, 0x7d0(%r13)
1454b558e:     	movw	%ax, 0x7d4(%r13)
1454b5596:     	movl	%r8d, 0x7d8(%r13)
1454b559d:     	movq	0x8d8(%r13), %rcx
1454b55a4:     	testq	%rcx, %rcx
1454b55a7:     	je	0x1454b560e <.text+0x54b460e>
1454b55a9:     	movq	0x8e0(%r13), %r9
1454b55b0:     	movzwl	0x36(%rcx), %r10d
1454b55b5:     	movl	%r10d, %r11d
1454b55b8:     	addl	%r11d, %r11d
1454b55bb:     	movq	$-0x1, %rdx
1454b55c2:     	nopw	%cs:(%rax,%rax)
1454b55d0:     	testq	%r11, %r11
1454b55d3:     	je	0x1454b55f7 <.text+0x54b45f7>
1454b55d5:     	cmpw	0x3a(%rcx,%rdx,2), %ax
1454b55da:     	seta	%bl
1454b55dd:     	sbbb	$0x0, %bl
1454b55e0:     	incq	%rdx
1454b55e3:     	addq	$-0x2, %r11
1454b55e7:     	cmpb	$0x1, %bl
1454b55ea:     	je	0x1454b55d0 <.text+0x54b45d0>
1454b55ec:     	movzbl	%bl, %r10d
1454b55f0:     	testl	%r10d, %r10d
1454b55f3:     	jne	0x1454b55fa <.text+0x54b45fa>
1454b55f5:     	jmp	0x1454b5607 <.text+0x54b4607>
1454b55f7:     	movq	%r10, %rdx
1454b55fa:     	subq	$0x1, %r9
1454b55fe:     	jb	0x1454b5610 <.text+0x54b4610>
1454b5600:     	movq	0x50(%rcx,%rdx,8), %rcx
1454b5605:     	jmp	0x1454b55b0 <.text+0x54b45b0>
1454b5607:     	movl	%r8d, 0x8(%rcx,%rdx,4)
1454b560c:     	jmp	0x1454b5654 <.text+0x54b4654>
1454b560e:     	xorl	%ecx, %ecx
1454b5610:     	leaq	0x8d8(%r13), %r9
1454b5617:     	movzwl	%ax, %eax
1454b561a:     	movq	%r9, 0xb0(%rbp)
1454b5621:     	movq	%rcx, 0xb8(%rbp)
1454b5628:     	movq	$0x0, 0xc0(%rbp)
1454b5633:     	movq	%rdx, 0xc8(%rbp)
1454b563a:     	movq	%rax, 0xd0(%rbp)
1454b5641:     	leaq	0x2b8(%rbp), %rcx
1454b5648:     	leaq	0xb0(%rbp), %rdx
1454b564f:     	callq	0x14552a730 <.text+0x5529730>
1454b5654:     	movss	0x934(%r13), %xmm0
1454b565d:     	movss	%xmm0, 0x2b8(%rbp)
1454b5665:     	leaq	0x508(%r13), %rax
1454b566c:     	movq	%rax, 0x310(%rbp)
1454b5673:     	movq	0x508(%r13), %rax
1454b567a:     	movq	0x510(%r13), %rcx
1454b5681:     	movq	0x518(%r13), %rdx
1454b5688:     	movq	$0x0, 0x508(%r13)
1454b5693:     	movq	$0x8, 0x510(%r13)
1454b569e:     	movq	$0x0, 0x518(%r13)
1454b56a9:     	leaq	(%rdx,%rdx,4), %rdx
1454b56ad:     	shlq	$0x4, %rdx
1454b56b1:     	addq	%rcx, %rdx
1454b56b4:     	movq	%rcx, 0x240(%rbp)
1454b56bb:     	movq	%rax, 0x250(%rbp)
1454b56c2:     	movq	%rcx, 0x248(%rbp)
1454b56c9:     	movq	%rdx, 0x258(%rbp)
1454b56d0:     	leaq	0xb0(%rbp), %rcx
1454b56d7:     	leaq	0x240(%rbp), %rdx
1454b56de:     	leaq	0x2b8(%rbp), %r8
1454b56e5:     	callq	0x14555a190 <.text+0x5559190>
1454b56ea:     	movq	0xb0(%rbp), %rax
1454b56f1:     	movq	%rax, 0x348(%rbp)
1454b56f8:     	movq	0xb8(%rbp), %rax
1454b56ff:     	movq	%rax, 0x340(%rbp)
1454b5706:     	movq	0xc0(%rbp), %rdi
1454b570d:     	movq	0xd8(%rbp), %rax
1454b5714:     	movq	%rax, 0x250(%rbp)
1454b571b:     	movups	0xc8(%rbp), %xmm0
1454b5722:     	movaps	%xmm0, 0x240(%rbp)
1454b5729:     	movq	0x508(%r13), %rax
1454b5730:     	testq	%rax, %rax
1454b5733:     	je	0x1454b574f <.text+0x54b474f>
1454b5735:     	movq	0x510(%r13), %rcx
1454b573c:     	shlq	$0x4, %rax
1454b5740:     	leaq	(%rax,%rax,4), %rdx
1454b5744:     	movl	$0x8, %r8d
1454b574a:     	callq	0x1400021d0 <.text+0x11d0>
1454b574f:     	movq	0x250(%rbp), %rax
1454b5756:     	movq	0x310(%rbp), %rcx
1454b575d:     	movq	%rax, 0x10(%rcx)
1454b5761:     	movaps	0x240(%rbp), %xmm0
1454b5768:     	movups	%xmm0, (%rcx)
1454b576b:     	testq	%rdi, %rdi
1454b576e:     	je	0x1454b5a7a <.text+0x54b4a7a>
1454b5774:     	leaq	(%rdi,%rdi,4), %rsi
1454b5778:     	shlq	$0x4, %rsi
1454b577c:     	movq	0x340(%rbp), %r13
1454b5783:     	addq	%r13, %rsi
1454b5786:     	leaq	0xb8(%rbp), %r12
1454b578d:     	xorps	%xmm8, %xmm8
1454b5791:     	jmp	0x1454b57cc <.text+0x54b47cc>
1454b5793:     	nopw	%cs:(%rax,%rax)
1454b57a0:     	movss	0xf4(%rbp), %xmm1
1454b57a8:     	movq	0xd8(%rbp), %r8
1454b57af:     	movq	0x368(%rbp), %rcx
1454b57b6:     	xorl	%r9d, %r9d
1454b57b9:     	callq	0x1454a0910 <.text+0x549f910>
1454b57be:     	nop
1454b57bf:     	addq	$0x50, %r13
1454b57c3:     	cmpq	%rsi, %r13
1454b57c6:     	je	0x1454b5a7a <.text+0x54b4a7a>
1454b57cc:     	movq	(%r13), %rax
1454b57d0:     	cmpq	$0x2, %rax
1454b57d4:     	je	0x1454b5a7a <.text+0x54b4a7a>
1454b57da:     	movq	%rax, 0xb0(%rbp)
1454b57e1:     	movq	0x48(%r13), %rcx
1454b57e5:     	movq	%rcx, 0x40(%r12)
1454b57ea:     	movups	0x8(%r13), %xmm0
1454b57ef:     	movups	0x18(%r13), %xmm1
1454b57f4:     	movups	0x28(%r13), %xmm2
1454b57f9:     	movups	0x38(%r13), %xmm3
1454b57fe:     	movups	%xmm3, 0x30(%r12)
1454b5804:     	movups	%xmm2, 0x20(%r12)
1454b580a:     	movups	%xmm1, 0x10(%r12)
1454b5810:     	movups	%xmm0, (%r12)
1454b5815:     	cmpb	$0x0, 0xf9(%rbp)
1454b581c:     	jne	0x1454b57a0 <.text+0x54b47a0>
1454b581e:     	movq	0xd8(%rbp), %rcx
1454b5825:     	testq	%rcx, %rcx
1454b5828:     	je	0x1454b5870 <.text+0x54b4870>
1454b582a:     	movq	0x368(%rbp), %r8
1454b5831:     	movq	0xd0(%r8), %rdx
1454b5838:     	movq	0xd8(%r8), %r8
1454b583f:     	shlq	$0x5, %r8
1454b5843:     	leaq	(%r8,%r8,2), %r8
1454b5847:     	nopw	(%rax,%rax)
1454b5850:     	testq	%r8, %r8
1454b5853:     	je	0x1454b5870 <.text+0x54b4870>
1454b5855:     	addq	$-0x60, %r8
1454b5859:     	cmpq	%rcx, 0x20(%rdx)
1454b585d:     	leaq	0x60(%rdx), %rdx
1454b5861:     	jne	0x1454b5850 <.text+0x54b4850>
1454b5863:     	movb	$0x2, %cl
1454b5865:     	jmp	0x1454b5872 <.text+0x54b4872>
1454b5867:     	nopw	(%rax,%rax)
1454b5870:     	xorl	%ecx, %ecx
1454b5872:     	movq	0x368(%rbp), %rdx
1454b5879:     	movzbl	0x129(%rdx), %r8d
1454b5881:     	movb	%r8b, 0x358(%rbp)
1454b5888:     	movb	%cl, 0x129(%rdx)
1454b588e:     	movq	0xb8(%rbp), %rcx
1454b5895:     	movups	0x40(%rdx), %xmm9
1454b589a:     	movq	%rax, 0x40(%rdx)
1454b589e:     	movq	%rcx, 0x48(%rdx)
1454b58a2:     	movzbl	0xfa(%rbp), %eax
1454b58a9:     	movzbl	0x804(%rdx), %r15d
1454b58b1:     	movb	%al, 0x804(%rdx)
1454b58b7:     	movss	0x934(%rdx), %xmm10
1454b58c0:     	movss	0xf4(%rbp), %xmm7
1454b58c8:     	ucomiss	%xmm8, %xmm7
1454b58cc:     	jbe	0x1454b5907 <.text+0x54b4907>
1454b58ce:     	movq	0xd0(%rbp), %rdx
1454b58d5:     	movl	0xf0(%rbp), %r9d
1454b58dc:     	movzbl	0xfb(%rbp), %eax
1454b58e3:     	movzbl	0xf8(%rbp), %ecx
1454b58ea:     	movb	%cl, 0x28(%rsp)
1454b58ee:     	movb	%al, 0x20(%rsp)
1454b58f2:     	movb	$0x0, 0x30(%rsp)
1454b58f7:     	movq	0x368(%rbp), %rcx
1454b58fe:     	movaps	%xmm7, %xmm2
1454b5901:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b5906:     	nop
1454b5907:     	cmpb	$0x0, 0xc0(%rbp)
1454b590e:     	je	0x1454b5920 <.text+0x54b4920>
1454b5910:     	movl	0xe0(%rbp), %edi
1454b5916:     	cmpl	$0x5, %edi
1454b5919:     	je	0x1454b5933 <.text+0x54b4933>
1454b591b:     	xorps	%xmm0, %xmm0
1454b591e:     	jmp	0x1454b593b <.text+0x54b493b>
1454b5920:     	movq	0xd0(%rbp), %rbx
1454b5927:     	movl	0xf0(%rbp), %r14d
1454b592e:     	jmp	0x1454b5a2e <.text+0x54b4a2e>
1454b5933:     	movss	0xe4(%rbp), %xmm0
1454b593b:     	movq	0x368(%rbp), %rcx
1454b5942:     	movl	0x4b4(%rcx), %eax
1454b5948:     	cmpl	$0x3, %eax
1454b594b:     	movl	$0x3, %edx
1454b5950:     	cmovael	%edx, %eax
1454b5953:     	movq	0x4e8(%rcx), %rdx
1454b595a:     	movq	0xd0(%rbp), %rbx
1454b5961:     	testq	%rdx, %rdx
1454b5964:     	je	0x1454b59f9 <.text+0x54b49f9>
1454b596a:     	movss	0xc4(%rbp), %xmm3
1454b5972:     	movss	0xc8(%rbp), %xmm1
1454b597a:     	movl	0xcc(%rbp), %r9d
1454b5981:     	incl	%eax
1454b5983:     	movq	0x368(%rbp), %rcx
1454b598a:     	movq	0x4e0(%rcx), %rcx
1454b5991:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1454b5998:     	jmp	0x1454b59b0 <.text+0x54b49b0>
1454b599a:     	nopw	(%rax,%rax)
1454b59a0:     	addq	$0x160, %rcx            # imm = 0x160
1454b59a7:     	addq	$-0x160, %rdx           # imm = 0xFEA0
1454b59ae:     	je	0x1454b59f9 <.text+0x54b49f9>
1454b59b0:     	cmpq	%rbx, 0x88(%rcx)
1454b59b7:     	jne	0x1454b59a0 <.text+0x54b49a0>
1454b59b9:     	cmpl	$0x1, 0x68(%rcx)
1454b59bd:     	je	0x1454b59a0 <.text+0x54b49a0>
1454b59bf:     	movl	0xf0(%rbp), %edx
1454b59c5:     	movzbl	0xfb(%rbp), %r8d
1454b59cd:     	movss	%xmm10, 0x50(%rsp)
1454b59d4:     	movq	%rax, 0x48(%rsp)
1454b59d9:     	movss	%xmm0, 0x30(%rsp)
1454b59df:     	movl	%r9d, 0x28(%rsp)
1454b59e4:     	movss	%xmm1, 0x20(%rsp)
1454b59ea:     	movq	$0x0, 0x38(%rsp)
1454b59f3:     	callq	0x145450c80 <.text+0x544fc80>
1454b59f8:     	nop
1454b59f9:     	movl	0xf0(%rbp), %r14d
1454b5a00:     	movq	0x368(%rbp), %rcx
1454b5a07:     	movq	%rbx, %rdx
1454b5a0a:     	movl	%r14d, %r8d
1454b5a0d:     	movb	$0x1, %r9b
1454b5a10:     	callq	0x1454e3550 <.text+0x54e2550>
1454b5a15:     	nop
1454b5a16:     	movq	0x368(%rbp), %rcx
1454b5a1d:     	movq	%rbx, %rdx
1454b5a20:     	movl	%r14d, %r8d
1454b5a23:     	callq	0x1454e3ff0 <.text+0x54e2ff0>
1454b5a28:     	nop
1454b5a29:     	cmpl	$0x5, %edi
1454b5a2c:     	je	0x1454b5a4d <.text+0x54b4a4d>
1454b5a2e:     	movl	%r14d, 0x20(%rsp)
1454b5a33:     	movq	0x368(%rbp), %rcx
1454b5a3a:     	movq	%rbx, %rdx
1454b5a3d:     	leaq	0xe0(%rbp), %r8
1454b5a44:     	movaps	%xmm7, %xmm3
1454b5a47:     	callq	0x1454ff860 <.text+0x54fe860>
1454b5a4c:     	nop
1454b5a4d:     	movq	0x368(%rbp), %rax
1454b5a54:     	movb	%r15b, 0x804(%rax)
1454b5a5b:     	movups	%xmm9, 0x40(%rax)
1454b5a60:     	movzbl	0x358(%rbp), %ecx
1454b5a67:     	movb	%cl, 0x129(%rax)
1454b5a6d:     	addq	$0x50, %r13
1454b5a71:     	cmpq	%rsi, %r13
1454b5a74:     	jne	0x1454b57cc <.text+0x54b47cc>
1454b5a7a:     	movq	0x348(%rbp), %rax
1454b5a81:     	testq	%rax, %rax
1454b5a84:     	je	0x1454b5aa0 <.text+0x54b4aa0>
1454b5a86:     	shlq	$0x4, %rax
1454b5a8a:     	leaq	(%rax,%rax,4), %rdx
1454b5a8e:     	movl	$0x8, %r8d
1454b5a94:     	movq	0x340(%rbp), %rcx
1454b5a9b:     	callq	0x1400021d0 <.text+0x11d0>
1454b5aa0:     	movq	0x368(%rbp), %r13
1454b5aa7:     	movq	0x500(%r13), %r14
1454b5aae:     	testq	%r14, %r14
1454b5ab1:     	je	0x1454b5f4d <.text+0x54b4f4d>
1454b5ab7:     	movss	0x934(%r13), %xmm8
1454b5ac0:     	leaq	0x550(%r13), %rax
1454b5ac7:     	movq	%rax, 0x338(%rbp)
1454b5ace:     	movss	0x5528c9(%rip), %xmm9   # 0x145a083a0
1454b5ad7:     	xorl	%r12d, %r12d
1454b5ada:     	jmp	0x1454b5af9 <.text+0x54b4af9>
1454b5adc:     	nopl	(%rax)
1454b5ae0:     	addq	%rbx, %rax
1454b5ae3:     	cmpq	$0x0, (%rax)
1454b5ae7:     	je	0x1454b5d60 <.text+0x54b4d60>
1454b5aed:     	incq	%r12
1454b5af0:     	cmpq	%r14, %r12
1454b5af3:     	jae	0x1454b5f4d <.text+0x54b4f4d>
1454b5af9:     	movq	0x4f8(%r13), %rax
1454b5b00:     	imulq	$0x58, %r12, %rbx
1454b5b04:     	ucomiss	0x50(%rax,%rbx), %xmm8
1454b5b0a:     	jb	0x1454b5ae0 <.text+0x54b4ae0>
1454b5b0c:     	movq	%r12, %rcx
1454b5b0f:     	notq	%rcx
1454b5b12:     	movq	%rcx, 0x348(%rbp)
1454b5b19:     	nopl	(%rax)
1454b5b20:     	movq	%r12, %rdi
1454b5b23:     	cmpq	%r14, %r12
1454b5b26:     	jae	0x1454bc883 <.text+0x54bb883>
1454b5b2c:     	leaq	(%rax,%rbx), %rcx
1454b5b30:     	movq	(%rax,%rbx), %rsi
1454b5b34:     	movq	0x8(%rax,%rbx), %r13
1454b5b39:     	movl	0x10(%rax,%rbx), %r15d
1454b5b3e:     	movq	0x18(%rax,%rbx), %rdx
1454b5b43:     	movq	%rdx, 0x358(%rbp)
1454b5b4a:     	movsd	0x2c(%rax,%rbx), %xmm11
1454b5b51:     	movl	0x34(%rax,%rbx), %r12d
1454b5b56:     	movss	0x38(%rax,%rbx), %xmm10
1454b5b5d:     	movss	0x4c(%rax,%rbx), %xmm7
1454b5b63:     	leaq	(%rax,%rbx), %rdx
1454b5b67:     	addq	$0x58, %rdx
1454b5b6b:     	movq	0x348(%rbp), %rax
1454b5b72:     	addq	%r14, %rax
1454b5b75:     	imulq	$0x58, %rax, %r8
1454b5b79:     	callq	0x1457731e1 <.text+0x57721e1>
1454b5b7e:     	decq	%r14
1454b5b81:     	movq	0x368(%rbp), %rax
1454b5b88:     	movq	%r14, 0x500(%rax)
1454b5b8f:     	testq	%rsi, %rsi
1454b5b92:     	je	0x1454b5c94 <.text+0x54b4c94>
1454b5b98:     	cmpq	$0x2, %rsi
1454b5b9c:     	je	0x1454bc883 <.text+0x54bb883>
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
1454b5c94:     	movq	0x358(%rbp), %rsi
1454b5c9b:     	testq	%rsi, %rsi
1454b5c9e:     	movq	0x368(%rbp), %r13
1454b5ca5:     	movq	%rdi, %r12
1454b5ca8:     	je	0x1454b5d2e <.text+0x54b4d2e>
1454b5cae:     	callq	0x140002200 <.text+0x1200>
1454b5cb3:     	movl	$0x20, %ecx
1454b5cb8:     	movl	$0x1, %edx
1454b5cbd:     	callq	0x1400021c0 <.text+0x11c0>
1454b5cc2:     	testq	%rax, %rax
1454b5cc5:     	je	0x1454bc7ba <.text+0x54bb7ba>
1454b5ccb:     	movq	%rax, 0x340(%rbp)
1454b5cd2:     	movq	%rsi, (%rax)
1454b5cd5:     	movq	0x560(%r13), %rsi
1454b5cdc:     	cmpq	0x550(%r13), %rsi
1454b5ce3:     	jne	0x1454b5cf2 <.text+0x54b4cf2>
1454b5ce5:     	movq	0x338(%rbp), %rcx
1454b5cec:     	callq	0x145774710 <.text+0x5773710>
1454b5cf1:     	nop
1454b5cf2:     	movq	0x558(%r13), %rax
1454b5cf9:     	movq	%rsi, %rcx
1454b5cfc:     	shlq	$0x5, %rcx
1454b5d00:     	movq	$0x20, (%rax,%rcx)
1454b5d08:     	movq	0x340(%rbp), %rdx
1454b5d0f:     	movq	%rdx, 0x8(%rax,%rcx)
1454b5d14:     	movq	$0x8, 0x10(%rax,%rcx)
1454b5d1d:     	movw	$0xaa, 0x18(%rax,%rcx)
1454b5d24:     	incq	%rsi
1454b5d27:     	movq	%rsi, 0x560(%r13)
1454b5d2e:     	movq	0x500(%r13), %r14
1454b5d35:     	cmpq	%r14, %r12
1454b5d38:     	jae	0x1454b5f4d <.text+0x54b4f4d>
1454b5d3e:     	movq	0x4f8(%r13), %rax
1454b5d45:     	ucomiss	0x50(%rax,%rbx), %xmm8
1454b5d4b:     	jae	0x1454b5b20 <.text+0x54b4b20>
1454b5d51:     	jmp	0x1454b5ae0 <.text+0x54b4ae0>
1454b5d56:     	nopw	%cs:(%rax,%rax)
1454b5d60:     	movl	0x48(%rax), %ecx
1454b5d63:     	testl	%ecx, %ecx
1454b5d65:     	je	0x1454b5aed <.text+0x54b4aed>
1454b5d6b:     	movss	0x40(%rax), %xmm0
1454b5d70:     	ucomiss	%xmm0, %xmm8
1454b5d74:     	jb	0x1454b5aed <.text+0x54b4aed>
1454b5d7a:     	decl	%ecx
1454b5d7c:     	movl	%ecx, 0x48(%rax)
1454b5d7f:     	addss	0x44(%rax), %xmm0
1454b5d84:     	movss	%xmm0, 0x40(%rax)
1454b5d89:     	movl	0x34(%rax), %ecx
1454b5d8c:     	movl	%ecx, 0x2f8(%rbp)
1454b5d92:     	movq	0x2c(%rax), %rcx
1454b5d96:     	movq	%rcx, 0x2f0(%rbp)
1454b5d9d:     	movss	0x38(%rax), %xmm3
1454b5da2:     	movl	0x3c(%rax), %r14d
1454b5da6:     	movss	0x4c(%rax), %xmm10
1454b5dac:     	movzbl	0x54(%rax), %ebx
1454b5db0:     	movl	0x28(%rax), %ecx
1454b5db3:     	movl	%ecx, 0x2c0(%rbp)
1454b5db9:     	movq	0x20(%rax), %rax
1454b5dbd:     	movq	%rax, 0x2b8(%rbp)
1454b5dc4:     	movq	$0x0, 0x28(%rsp)
1454b5dcd:     	movq	$0x8, 0x20(%rsp)
1454b5dd6:     	leaq	0xb0(%rbp), %rcx
1454b5ddd:     	movq	%r13, %rdx
1454b5de0:     	leaq	0x2f0(%rbp), %r8
1454b5de7:     	callq	0x145500300 <.text+0x54ff300>
1454b5dec:     	movq	0xb0(%rbp), %rax
1454b5df3:     	movq	%rax, 0x340(%rbp)
1454b5dfa:     	movq	0xb8(%rbp), %rax
1454b5e01:     	movq	%rax, 0x358(%rbp)
1454b5e08:     	movq	0xc0(%rbp), %rdi
1454b5e0f:     	testq	%rdi, %rdi
1454b5e12:     	je	0x1454b5f18 <.text+0x54b4f18>
1454b5e18:     	shlq	$0x3, %rdi
1454b5e1c:     	xorl	%r15d, %r15d
1454b5e1f:     	nop
1454b5e20:     	movq	0x358(%rbp), %rax
1454b5e27:     	movq	(%rax,%r15), %r13
1454b5e2b:     	movq	0x368(%rbp), %rsi
1454b5e32:     	movq	0x8a0(%rsi), %rax
1454b5e39:     	movq	0x8b8(%rsi), %rcx
1454b5e40:     	leaq	(%rcx,%rax), %rdx
1454b5e44:     	rolq	$0x17, %rdx
1454b5e48:     	addq	%rax, %rdx
1454b5e4b:     	movq	0x8a8(%rsi), %r8
1454b5e52:     	movq	%r8, %r9
1454b5e55:     	shlq	$0x11, %r9
1454b5e59:     	movq	0x8b0(%rsi), %r10
1454b5e60:     	xorq	%rax, %r10
1454b5e63:     	xorq	%r8, %rcx
1454b5e66:     	xorq	%r10, %r8
1454b5e69:     	movq	%r8, 0x8a8(%rsi)
1454b5e70:     	xorq	%rcx, %rax
1454b5e73:     	movq	%rax, 0x8a0(%rsi)
1454b5e7a:     	xorq	%r9, %r10
1454b5e7d:     	movq	%r10, 0x8b0(%rsi)
1454b5e84:     	rolq	$0x2d, %rcx
1454b5e88:     	movq	%rcx, 0x8b8(%rsi)
1454b5e8f:     	shrq	$0x28, %rdx
1454b5e93:     	xorps	%xmm0, %xmm0
1454b5e96:     	cvtsi2ss	%edx, %xmm0
1454b5e9a:     	mulss	%xmm9, %xmm0
1454b5e9f:     	movss	0x47c(%rsi), %xmm1
1454b5ea7:     	ucomiss	%xmm0, %xmm1
1454b5eaa:     	ja	0x1454b5ec0 <.text+0x54b4ec0>
1454b5eac:     	movaps	%xmm10, %xmm7
1454b5eb0:     	jmp	0x1454b5ecd <.text+0x54b4ecd>
1454b5eb2:     	nopw	%cs:(%rax,%rax)
1454b5ec0:     	movss	0x480(%rsi), %xmm7
1454b5ec8:     	mulss	%xmm10, %xmm7
1454b5ecd:     	ucomiss	%xmm0, %xmm1
1454b5ed0:     	seta	0x28(%rsp)
1454b5ed5:     	movb	%bl, 0x20(%rsp)
1454b5ed9:     	movb	$0x0, 0x30(%rsp)
1454b5ede:     	movq	%rsi, %rcx
1454b5ee1:     	movq	%r13, %rdx
1454b5ee4:     	movaps	%xmm7, %xmm2
1454b5ee7:     	movl	%r14d, %r9d
1454b5eea:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b5eef:     	nop
1454b5ef0:     	movl	%r14d, 0x20(%rsp)
1454b5ef5:     	movq	%rsi, %rcx
1454b5ef8:     	movq	%r13, %rdx
1454b5efb:     	leaq	0x2b8(%rbp), %r8
1454b5f02:     	movaps	%xmm7, %xmm3
1454b5f05:     	callq	0x1454ff860 <.text+0x54fe860>
1454b5f0a:     	nop
1454b5f0b:     	addq	$0x8, %r15
1454b5f0f:     	cmpq	%r15, %rdi
1454b5f12:     	jne	0x1454b5e20 <.text+0x54b4e20>
1454b5f18:     	movq	0x340(%rbp), %rdx
1454b5f1f:     	testq	%rdx, %rdx
1454b5f22:     	je	0x1454b5f3a <.text+0x54b4f3a>
1454b5f24:     	shlq	$0x3, %rdx
1454b5f28:     	movl	$0x8, %r8d
1454b5f2e:     	movq	0x358(%rbp), %rcx
1454b5f35:     	callq	0x1400021d0 <.text+0x11d0>
1454b5f3a:     	movq	0x368(%rbp), %r13
1454b5f41:     	movq	0x500(%r13), %r14
1454b5f48:     	jmp	0x1454b5aed <.text+0x54b4aed>
1454b5f4d:     	movss	0x934(%r13), %xmm8
1454b5f56:     	leaq	0x550(%r13), %rax
1454b5f5d:     	movq	%rax, 0x340(%rbp)
1454b5f64:     	leaq	0x5f8(%r13), %rax
1454b5f6b:     	movq	%rax, 0x80(%rbp)
1454b5f72:     	leaq	0x8d8(%r13), %rax
1454b5f79:     	movq	%rax, 0x318(%rbp)
1454b5f80:     	leaq	0x8a0(%r13), %rax
1454b5f87:     	movq	%rax, 0x60(%rbp)
1454b5f8b:     	xorps	%xmm15, %xmm15
1454b5f8f:     	movss	0x462758(%rip), %xmm12  # 0x1459186f0
1454b5f98:     	movss	0x763443(%rip), %xmm14  # 0x145c193e4
1454b5fa1:     	movss	0x451582(%rip), %xmm13  # 0x14590752c
1454b5faa:     	xorl	%r15d, %r15d
1454b5fad:     	movq	%r15, %r12
1454b5fb0:     	notq	%r12
1454b5fb3:     	imulq	$0x78, %r15, %r14
1454b5fb7:     	movq	%r15, 0x348(%rbp)
1454b5fbe:     	jmp	0x1454b5ffc <.text+0x54b4ffc>
1454b5fc0:     	movq	0x558(%r13), %rax
1454b5fc7:     	movq	%rsi, %rcx
1454b5fca:     	shlq	$0x5, %rcx
1454b5fce:     	movq	$0x20, (%rax,%rcx)
1454b5fd6:     	movq	0x358(%rbp), %rdx
1454b5fdd:     	movq	%rdx, 0x8(%rax,%rcx)
1454b5fe2:     	movq	$0x8, 0x10(%rax,%rcx)
1454b5feb:     	movw	$0xaa, 0x18(%rax,%rcx)
1454b5ff2:     	incq	%rsi
1454b5ff5:     	movq	%rsi, 0x560(%r13)
1454b5ffc:     	movq	0x530(%r13), %rbx
1454b6003:     	cmpq	%rbx, %r15
1454b6006:     	jae	0x1454b70cc <.text+0x54b60cc>
1454b600c:     	movq	0x528(%r13), %rax
1454b6013:     	leaq	(%rax,%r14), %rcx
1454b6017:     	ucomiss	0x6c(%rax,%r14), %xmm8
1454b601d:     	jb	0x1454b6470 <.text+0x54b5470>
1454b6023:     	movq	0x58(%rcx), %rdi
1454b6027:     	movq	0x60(%rcx), %rax
1454b602b:     	movl	0x68(%rcx), %edx
1454b602e:     	movq	(%rcx), %rsi
1454b6031:     	movl	%edx, 0xb8(%rbp)
1454b6037:     	movq	%rax, 0xb0(%rbp)
1454b603e:     	leaq	0x78(%rcx), %rdx
1454b6042:     	leaq	(%rbx,%r12), %rax
1454b6046:     	imulq	$0x78, %rax, %r8
1454b604a:     	callq	0x1457731e1 <.text+0x57721e1>
1454b604f:     	decq	%rbx
1454b6052:     	movq	%rbx, 0x530(%r13)
1454b6059:     	testq	%rsi, %rsi
1454b605c:     	je	0x1454bcd3a <.text+0x54bbd3a>
1454b6062:     	movl	0xb8(%rbp), %eax
1454b6068:     	movl	%eax, 0xa0(%rbp)
1454b606e:     	movq	0xb0(%rbp), %rax
1454b6075:     	movq	%rax, 0x98(%rbp)
1454b607c:     	movq	0x2b8(%r13), %rax
1454b6083:     	testq	%rax, %rax
1454b6086:     	movabsq	$0x5f666f5f6c6c6163, %r11 # imm = 0x5F666F5F6C6C6163
1454b6090:     	movabsq	$0x656d616c665f666f, %rsi # imm = 0x656D616C665F666F
1454b609a:     	je	0x1454b61e0 <.text+0x54b51e0>
1454b60a0:     	movq	0x2b0(%r13), %rcx
1454b60a7:     	imulq	$0x58, %rax, %r8
1454b60ab:     	xorl	%edx, %edx
1454b60ad:     	jmp	0x1454b60bd <.text+0x54b50bd>
1454b60af:     	nop
1454b60b0:     	addq	$0x58, %rdx
1454b60b4:     	cmpq	%rdx, %r8
1454b60b7:     	je	0x1454b61e0 <.text+0x54b51e0>
1454b60bd:     	movq	(%rcx,%rdx), %r15
1454b60c1:     	cmpq	$0xd, 0x8(%r15)
1454b60c6:     	jne	0x1454b60b0 <.text+0x54b50b0>
1454b60c8:     	movq	(%r15), %rax
1454b60cb:     	movq	(%rax), %r9
1454b60ce:     	xorq	%r11, %r9
1454b60d1:     	movq	0x5(%rax), %r10
1454b60d5:     	xorq	%rsi, %r10
1454b60d8:     	orq	%r9, %r10
1454b60db:     	jne	0x1454b60b0 <.text+0x54b50b0>
1454b60dd:     	movl	0x8(%rcx,%rdx), %r8d
1454b60e2:     	movss	0x14(%rcx,%rdx), %xmm0
1454b60e8:     	movl	0x18(%rcx,%rdx), %r9d
1454b60ed:     	movl	0x34(%rcx,%rdx), %r10d
1454b60f2:     	leaq	0xd4(%rbp), %r11
1454b60f9:     	movl	%r10d, 0x10(%r11)
1454b60fd:     	movups	0x24(%rcx,%rdx), %xmm1
1454b6102:     	movups	%xmm1, (%r11)
1454b6106:     	movups	0x38(%rcx,%rdx), %xmm1
1454b610b:     	movups	0x44(%rcx,%rdx), %xmm2
1454b6110:     	movups	%xmm2, 0x20(%r11)
1454b6115:     	movups	%xmm1, 0x14(%r11)
1454b611a:     	movq	%r15, 0xb0(%rbp)
1454b6121:     	movl	%r8d, 0xb8(%rbp)
1454b6128:     	movss	0x10(%rcx,%rdx), %xmm7
1454b612e:     	movsd	0xc(%rcx,%rdx), %xmm1
1454b6134:     	movsd	%xmm1, 0xbc(%rbp)
1454b613c:     	movss	%xmm0, 0xc4(%rbp)
1454b6144:     	movl	%r9d, 0xc8(%rbp)
1454b614b:     	movsd	0x1c(%rcx,%rdx), %xmm0
1454b6151:     	movsd	%xmm0, 0xcc(%rbp)
1454b6159:     	movq	0x748(%r13), %rdx
1454b6160:     	movss	0x552148(%rip), %xmm1   # 0x145a082b0
1454b6168:     	testq	%rdx, %rdx
1454b616b:     	je	0x1454b61c3 <.text+0x54b51c3>
1454b616d:     	movq	0x740(%r13), %rcx
1454b6174:     	shlq	$0x3, %rdx
1454b6178:     	leaq	(%rdx,%rdx,2), %rdx
1454b617c:     	xorl	%r8d, %r8d
1454b617f:     	jmp	0x1454b619d <.text+0x54b519d>
1454b6181:     	nopw	%cs:(%rax,%rax)
1454b6190:     	addq	$0x18, %r8
1454b6194:     	cmpq	%r8, %rdx
1454b6197:     	je	0x1454b623d <.text+0x54b523d>
1454b619d:     	cmpq	$0xd, 0x8(%rcx,%r8)
1454b61a3:     	jne	0x1454b6190 <.text+0x54b5190>
1454b61a5:     	movq	(%rcx,%r8), %r9
1454b61a9:     	movq	(%r9), %r10
1454b61ac:     	xorq	(%rax), %r10
1454b61af:     	movq	0x5(%r9), %r9
1454b61b3:     	xorq	0x5(%rax), %r9
1454b61b7:     	orq	%r10, %r9
1454b61ba:     	jne	0x1454b6190 <.text+0x54b5190>
1454b61bc:     	movss	0x10(%rcx,%r8), %xmm1
1454b61c3:     	movss	0x934(%r13), %xmm2
1454b61cc:     	ucomiss	%xmm1, %xmm2
1454b61cf:     	jae	0x1454b6253 <.text+0x54b5253>
1454b61d5:     	nopw	%cs:(%rax,%rax)
1454b61e0:     	testq	%rdi, %rdi
1454b61e3:     	movq	0x348(%rbp), %r15
1454b61ea:     	je	0x1454b5ffc <.text+0x54b4ffc>
1454b61f0:     	callq	0x140002200 <.text+0x1200>
1454b61f5:     	movl	$0x20, %ecx
1454b61fa:     	movl	$0x1, %edx
1454b61ff:     	callq	0x1400021c0 <.text+0x11c0>
1454b6204:     	testq	%rax, %rax
1454b6207:     	je	0x1454bc7ba <.text+0x54bb7ba>
1454b620d:     	movq	%rax, 0x358(%rbp)
1454b6214:     	movq	%rdi, (%rax)
1454b6217:     	movq	0x560(%r13), %rsi
1454b621e:     	cmpq	0x550(%r13), %rsi
1454b6225:     	jne	0x1454b5fc0 <.text+0x54b4fc0>
1454b622b:     	movq	0x340(%rbp), %rcx
1454b6232:     	callq	0x145774710 <.text+0x5773710>
1454b6237:     	nop
1454b6238:     	jmp	0x1454b5fc0 <.text+0x54b4fc0>
1454b623d:     	movss	0x55206b(%rip), %xmm1   # 0x145a082b0
1454b6245:     	movss	0x934(%r13), %xmm2
1454b624e:     	ucomiss	%xmm1, %xmm2
1454b6251:     	jb	0x1454b61e0 <.text+0x54b51e0>
1454b6253:     	movss	0x470(%r13), %xmm10
1454b625c:     	movss	0x474(%r13), %xmm9
1454b6265:     	mulss	0xf4(%rbp), %xmm0
1454b626d:     	mulss	0x50(%r15), %xmm0
1454b6273:     	mulss	0x498(%r13), %xmm0
1454b627c:     	ucomiss	%xmm0, %xmm14
1454b6280:     	jae	0x1454b62a7 <.text+0x54b52a7>
1454b6282:     	addss	0x1523f76(%rip), %xmm0  # 0x1469da200
1454b628a:     	movss	0x45f56d(%rip), %xmm11  # 0x145915800
1454b6293:     	divss	%xmm11, %xmm0
1454b6298:     	callq	0x145773367 <.text+0x5772367>
1454b629d:     	mulss	%xmm11, %xmm0
1454b62a2:     	addss	%xmm14, %xmm0
1454b62a7:     	movq	$0x0, 0x28(%rsp)
1454b62b0:     	movq	$0x8, 0x20(%rsp)
1454b62b9:     	leaq	0x2b8(%rbp), %rcx
1454b62c0:     	movq	%r13, %rdx
1454b62c3:     	leaq	0x98(%rbp), %r8
1454b62ca:     	movaps	%xmm0, %xmm3
1454b62cd:     	callq	0x145500300 <.text+0x54ff300>
1454b62d2:     	movq	0x2c8(%rbp), %r13
1454b62d9:     	testq	%r13, %r13
1454b62dc:     	je	0x1454b642a <.text+0x54b542a>
1454b62e2:     	movq	0x368(%rbp), %rcx
1454b62e9:     	leaq	0xb0(%rbp), %rdx
1454b62f0:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454b62f5:     	nop
1454b62f6:     	movq	0x2c0(%rbp), %rbx
1454b62fd:     	movl	$0x2, 0x2f0(%rbp)
1454b6307:     	movl	$0x0, 0x220(%rbp)
1454b6311:     	leaq	0x220(%rbp), %rax
1454b6318:     	movq	%rax, 0x30(%rsp)
1454b631d:     	leaq	0x2f0(%rbp), %rax
1454b6324:     	movq	%rax, 0x28(%rsp)
1454b6329:     	movq	%r13, 0x20(%rsp)
1454b632e:     	leaq	0x240(%rbp), %rcx
1454b6335:     	movq	%rdi, %rdx
1454b6338:     	movl	$0x209d, %r8d           # imm = 0x209D
1454b633e:     	movq	%rbx, %r9
1454b6341:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b6346:     	nop
1454b6347:     	movq	0x368(%rbp), %rax
1454b634e:     	movq	0x560(%rax), %rsi
1454b6355:     	cmpq	0x550(%rax), %rsi
1454b635c:     	jne	0x1454b636b <.text+0x54b536b>
1454b635e:     	movq	0x340(%rbp), %rcx
1454b6365:     	callq	0x145774710 <.text+0x5773710>
1454b636a:     	nop
1454b636b:     	movq	0x368(%rbp), %rdx
1454b6372:     	movq	0x558(%rdx), %rax
1454b6379:     	movq	%rsi, %rcx
1454b637c:     	shlq	$0x5, %rcx
1454b6380:     	movups	0x240(%rbp), %xmm0
1454b6387:     	movups	0x250(%rbp), %xmm1
1454b638e:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b6393:     	movups	%xmm0, (%rax,%rcx)
1454b6397:     	incq	%rsi
1454b639a:     	movq	%rsi, 0x560(%rdx)
1454b63a1:     	movzbl	0x75(%r15), %eax
1454b63a6:     	addb	$-0x2, %al
1454b63a8:     	movss	0x4510e0(%rip), %xmm0   # 0x145907490
1454b63b0:     	cmpb	$0x6, %al
1454b63b2:     	ja	0x1454b63c3 <.text+0x54b53c3>
1454b63b4:     	movzbl	%al, %eax
1454b63b7:     	leaq	0x1542176(%rip), %rcx   # 0x1469f8534
1454b63be:     	movss	(%rcx,%rax,4), %xmm0
1454b63c3:     	movss	0x44(%r15), %xmm1
1454b63c9:     	mulss	0xfc(%rbp), %xmm10
1454b63d2:     	xorps	%xmm2, %xmm2
1454b63d5:     	cmpltss	%xmm1, %xmm2
1454b63da:     	mulss	%xmm12, %xmm1
1454b63df:     	mulss	%xmm1, %xmm7
1454b63e3:     	mulss	0xe8(%rbp), %xmm7
1454b63eb:     	andps	%xmm10, %xmm2
1454b63ef:     	mulss	%xmm0, %xmm7
1454b63f3:     	addss	%xmm2, %xmm7
1454b63f7:     	mulss	%xmm7, %xmm9
1454b63fc:     	movq	%r13, 0x28(%rsp)
1454b6401:     	movq	%rbx, 0x20(%rsp)
1454b6406:     	movss	%xmm9, 0x30(%rsp)
1454b640d:     	movq	0x368(%rbp), %rcx
1454b6414:     	leaq	0xb0(%rbp), %rdx
1454b641b:     	movq	%rdi, %r8
1454b641e:     	movl	$0x209d, %r9d           # imm = 0x209D
1454b6424:     	callq	0x1454e6580 <.text+0x54e5580>
1454b6429:     	nop
1454b642a:     	movq	0x2b8(%rbp), %rdx
1454b6431:     	testq	%rdx, %rdx
1454b6434:     	je	0x1454b644c <.text+0x54b544c>
1454b6436:     	movq	0x2c0(%rbp), %rcx
1454b643d:     	shlq	$0x3, %rdx
1454b6441:     	movl	$0x8, %r8d
1454b6447:     	callq	0x1400021d0 <.text+0x11d0>
1454b644c:     	movq	0x368(%rbp), %r13
1454b6453:     	testq	%rdi, %rdi
1454b6456:     	movq	0x348(%rbp), %r15
1454b645d:     	jne	0x1454b61f0 <.text+0x54b51f0>
1454b6463:     	jmp	0x1454b5ffc <.text+0x54b4ffc>
1454b6468:     	nopl	(%rax,%rax)
1454b6470:     	movss	0x70(%rcx), %xmm0
1454b6475:     	ucomiss	%xmm0, %xmm8
1454b6479:     	jae	0x1454b6490 <.text+0x54b5490>
1454b647b:     	incq	%r15
1454b647e:     	jmp	0x1454b5fad <.text+0x54b4fad>
1454b6483:     	nopw	%cs:(%rax,%rax)
1454b6490:     	addss	0x74(%rcx), %xmm0
1454b6495:     	movss	%xmm0, 0x70(%rcx)
1454b649a:     	movq	0x530(%r13), %rdx
1454b64a1:     	cmpq	%rdx, %r15
1454b64a4:     	movw	$0x16, %r12w
1454b64a9:     	jae	0x1454bcc12 <.text+0x54bbc12>
1454b64af:     	movq	0x528(%r13), %rcx
1454b64b6:     	leaq	(%rcx,%r14), %r15
1454b64ba:     	movq	0x58(%rcx,%r14), %rax
1454b64bf:     	movq	%rax, 0x338(%rbp)
1454b64c6:     	movq	0x60(%rcx,%r14), %rax
1454b64cb:     	movl	0x68(%rcx,%r14), %edx
1454b64d0:     	movl	%edx, 0x70(%rbp)
1454b64d3:     	movq	%rax, 0x68(%rbp)
1454b64d7:     	movq	0x2b8(%r13), %rax
1454b64de:     	movq	(%rcx,%r14), %rsi
1454b64e2:     	testq	%rax, %rax
1454b64e5:     	je	0x1454b654b <.text+0x54b554b>
1454b64e7:     	movq	0x2b0(%r13), %rdi
1454b64ee:     	imulq	$0x58, %rax, %r12
1454b64f2:     	movq	(%rsi), %rbx
1454b64f5:     	movq	%rsi, 0x358(%rbp)
1454b64fc:     	movq	0x8(%rsi), %r14
1454b6500:     	jmp	0x1454b651a <.text+0x54b551a>
1454b6502:     	nopw	%cs:(%rax,%rax)
1454b6510:     	addq	$0x58, %rdi
1454b6514:     	addq	$-0x58, %r12
1454b6518:     	je	0x1454b653f <.text+0x54b553f>
1454b651a:     	movq	(%rdi), %rsi
1454b651d:     	cmpq	%r14, 0x8(%rsi)
1454b6521:     	jne	0x1454b6510 <.text+0x54b5510>
1454b6523:     	movq	(%rsi), %rcx
1454b6526:     	movq	%rbx, %rdx
1454b6529:     	movq	%r14, %r8
1454b652c:     	callq	0x1457731e7 <.text+0x57721e7>
1454b6531:     	testl	%eax, %eax
1454b6533:     	jne	0x1454b6510 <.text+0x54b5510>
1454b6535:     	movq	%rdi, %r15
1454b6538:     	movw	$0x16, %r12w
1454b653d:     	jmp	0x1454b654b <.text+0x54b554b>
1454b653f:     	movw	$0x16, %r12w
1454b6544:     	movq	0x358(%rbp), %rsi
1454b654b:     	movss	0x10(%r15), %xmm9
1454b6551:     	movl	0x18(%r15), %edi
1454b6555:     	movss	0x4c(%r15), %xmm10
1454b655b:     	movss	0x44(%r15), %xmm11
1454b6561:     	movl	0x40(%r15), %ebx
1454b6565:     	movss	0x38(%r15), %xmm12
1454b656b:     	movss	0x1c(%r15), %xmm4
1454b6571:     	movq	0x718(%r13), %rax
1454b6578:     	testq	%rax, %rax
1454b657b:     	movw	$0x1c, %r15w
1454b6580:     	movq	%rsi, 0x358(%rbp)
1454b6587:     	je	0x1454b69e0 <.text+0x54b59e0>
1454b658d:     	movq	0x710(%r13), %rcx
1454b6594:     	cmpq	$0x1, %rax
1454b6598:     	jne	0x1454b65a6 <.text+0x54b55a6>
1454b659a:     	xorl	%edx, %edx
1454b659c:     	movss	0x45cda8(%rip), %xmm7   # 0x14591334c
1454b65a4:     	jmp	0x1454b65f8 <.text+0x54b55f8>
1454b65a6:     	movq	%rax, %r8
1454b65a9:     	andq	$-0x2, %r8
1454b65ad:     	leaq	0x44(%rcx), %r9
1454b65b1:     	xorl	%edx, %edx
1454b65b3:     	movss	0x45cd91(%rip), %xmm7   # 0x14591334c
1454b65bb:     	jmp	0x1454b65cd <.text+0x54b55cd>
1454b65bd:     	nopl	(%rax)
1454b65c0:     	addq	$0x2, %rdx
1454b65c4:     	subq	$-0x80, %r9
1454b65c8:     	cmpq	%rdx, %r8
1454b65cb:     	je	0x1454b65f4 <.text+0x54b55f4>
1454b65cd:     	cmpb	$0x16, -0x44(%r9)
1454b65d2:     	je	0x1454b65e0 <.text+0x54b55e0>
1454b65d4:     	cmpb	$0x16, -0x4(%r9)
1454b65d9:     	jne	0x1454b65c0 <.text+0x54b55c0>
1454b65db:     	jmp	0x1454b65ed <.text+0x54b55ed>
1454b65dd:     	nopl	(%rax)
1454b65e0:     	addss	-0x40(%r9), %xmm7
1454b65e6:     	cmpb	$0x16, -0x4(%r9)
1454b65eb:     	jne	0x1454b65c0 <.text+0x54b55c0>
1454b65ed:     	addss	(%r9), %xmm7
1454b65f2:     	jmp	0x1454b65c0 <.text+0x54b55c0>
1454b65f4:     	testb	$0x1, %al
1454b65f6:     	je	0x1454b6608 <.text+0x54b5608>
1454b65f8:     	shlq	$0x6, %rdx
1454b65fc:     	cmpb	$0x16, (%rcx,%rdx)
1454b6600:     	jne	0x1454b6608 <.text+0x54b5608>
1454b6602:     	addss	0x4(%rcx,%rdx), %xmm7
1454b6608:     	ucomiss	%xmm15, %xmm7
1454b660c:     	jbe	0x1454b69e0 <.text+0x54b59e0>
1454b6612:     	movl	%edi, 0x328(%rbp)
1454b6618:     	movaps	%xmm11, %xmm14
1454b661c:     	shlq	$0x6, %rax
1454b6620:     	movq	0x298(%rbp), %rdx
1454b6627:     	movss	(%rdx), %xmm11
1454b662c:     	mulss	%xmm11, %xmm7
1454b6631:     	xorl	%edx, %edx
1454b6633:     	xorl	%edi, %edi
1454b6635:     	xorl	%r8d, %r8d
1454b6638:     	movss	%xmm4, 0x2a8(%rbp)
1454b6640:     	cmpb	$0x16, (%rcx,%rdx)
1454b6644:     	je	0x1454b6658 <.text+0x54b5658>
1454b6646:     	incq	%r8
1454b6649:     	addq	$0x28, %rdi
1454b664d:     	addq	$0x40, %rdx
1454b6651:     	cmpq	%rdx, %rax
1454b6654:     	jne	0x1454b6640 <.text+0x54b5640>
1454b6656:     	jmp	0x1454b6694 <.text+0x54b5694>
1454b6658:     	cmpq	0x730(%r13), %r8
1454b665f:     	jae	0x1454b6694 <.text+0x54b5694>
1454b6661:     	movq	0x728(%r13), %rsi
1454b6668:     	leaq	(%rsi,%rdi), %rdx
1454b666c:     	leaq	0x240(%rbp), %rcx
1454b6673:     	callq	0x140a40230 <.text+0xa3f230>
1454b6678:     	movups	0x18(%rsi,%rdi), %xmm0
1454b667d:     	movups	%xmm0, 0x258(%rbp)
1454b6684:     	movb	$0x1, 0x268(%rbp)
1454b668b:     	movq	0x240(%rbp), %rdx
1454b6692:     	jmp	0x1454b66a6 <.text+0x54b56a6>
1454b6694:     	movq	$-0x2, 0x240(%rbp)
1454b669f:     	movq	$-0x2, %rdx
1454b66a6:     	movss	0x418(%r13), %xmm0
1454b66af:     	addss	%xmm0, %xmm7
1454b66b3:     	movaps	%xmm7, %xmm1
1454b66b6:     	minss	%xmm11, %xmm1
1454b66bb:     	movaps	%xmm1, %xmm11
1454b66bf:     	cmpunordss	%xmm1, %xmm11
1454b66c5:     	andps	%xmm11, %xmm7
1454b66c9:     	andnps	%xmm1, %xmm11
1454b66cd:     	orps	%xmm7, %xmm11
1454b66d1:     	movss	%xmm11, 0x418(%r13)
1454b66da:     	subss	%xmm0, %xmm11
1454b66df:     	ucomiss	%xmm11, %xmm15
1454b66e3:     	jae	0x1454b6746 <.text+0x54b5746>
1454b66e5:     	cmpq	$-0x2, %rdx
1454b66e9:     	jne	0x1454b6765 <.text+0x54b5765>
1454b66eb:     	movl	$0x5, %edx
1454b66f0:     	leaq	0x1540361(%rip), %rsi   # 0x1469f6a58
1454b66f7:     	movq	%rsi, %rcx
1454b66fa:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b66ff:     	testq	%rax, %rax
1454b6702:     	cmoveq	%rsi, %rax
1454b6706:     	movl	$0x5, %ecx
1454b670b:     	cmoveq	%rcx, %rdx
1454b670f:     	movq	%rax, 0xb8(%rbp)
1454b6716:     	movq	%rdx, 0xc0(%rbp)
1454b671d:     	leaq	0x1540339(%rip), %rax   # 0x1469f6a5d
1454b6724:     	movq	%rax, 0xc8(%rbp)
1454b672b:     	movq	$0x18, 0xd0(%rbp)
1454b6736:     	movb	$0x0, 0xd8(%rbp)
1454b673d:     	movq	$-0x1, %rdx
1454b6744:     	jmp	0x1454b678c <.text+0x54b578c>
1454b6746:     	cmpq	$-0x3, %rdx
1454b674a:     	ja	0x1454b67ab <.text+0x54b57ab>
1454b674c:     	testq	%rdx, %rdx
1454b674f:     	je	0x1454b67ab <.text+0x54b57ab>
1454b6751:     	movq	0x248(%rbp), %rcx
1454b6758:     	movl	$0x1, %r8d
1454b675e:     	callq	0x1400021d0 <.text+0x11d0>
1454b6763:     	jmp	0x1454b67ab <.text+0x54b57ab>
1454b6765:     	leaq	0x248(%rbp), %r8
1454b676c:     	movq	0x20(%r8), %rax
1454b6770:     	leaq	0xd4(%rbp), %rcx
1454b6777:     	movq	%rax, 0x4(%rcx)
1454b677b:     	movups	(%r8), %xmm0
1454b677f:     	movups	0x10(%r8), %xmm1
1454b6784:     	movups	%xmm1, -0xc(%rcx)
1454b6788:     	movups	%xmm0, -0x1c(%rcx)
1454b678c:     	movq	%rdx, 0xb0(%rbp)
1454b6793:     	cvtss2sd	%xmm11, %xmm2
1454b6798:     	movq	0x80(%rbp), %rcx
1454b679f:     	leaq	0xb0(%rbp), %rdx
1454b67a6:     	callq	0x1455021b0 <.text+0x55011b0>
1454b67ab:     	movss	0x418(%r13), %xmm0
1454b67b4:     	movss	0x470(%r13), %xmm7
1454b67bd:     	xorps	%xmm11, %xmm11
1454b67c1:     	maxss	%xmm11, %xmm0
1454b67c6:     	callq	0x14577327d <.text+0x577227d>
1454b67cb:     	cvttss2si	%xmm0, %r14
1454b67d0:     	ucomiss	%xmm11, %xmm0
1454b67d4:     	movl	$0x0, %esi
1454b67d9:     	cmovbl	%esi, %r14d
1454b67dd:     	ucomiss	%xmm13, %xmm0
1454b67e1:     	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454b67e6:     	cmoval	%edi, %r14d
1454b67ea:     	movaps	%xmm7, %xmm0
1454b67ed:     	callq	0x14577327d <.text+0x577227d>
1454b67f2:     	cvttss2si	%xmm0, %r8
1454b67f7:     	xorps	%xmm15, %xmm15
1454b67fb:     	ucomiss	%xmm11, %xmm0
1454b67ff:     	cmovbl	%esi, %r8d
1454b6803:     	ucomiss	%xmm13, %xmm0
1454b6807:     	cmoval	%edi, %r8d
1454b680b:     	movq	0x8d8(%r13), %rax
1454b6812:     	testq	%rax, %rax
1454b6815:     	je	0x1454b6919 <.text+0x54b5919>
1454b681b:     	movq	0x8e0(%r13), %rcx
1454b6822:     	movaps	%xmm14, %xmm11
1454b6826:     	movl	0x328(%rbp), %edi
1454b682c:     	movss	0x2a8(%rbp), %xmm4
1454b6834:     	movzwl	0x36(%rax), %r11d
1454b6839:     	movl	%r11d, %r9d
1454b683c:     	addl	%r9d, %r9d
1454b683f:     	movq	$-0x1, %rdx
1454b6846:     	nopw	%cs:(%rax,%rax)
1454b6850:     	testq	%r9, %r9
1454b6853:     	je	0x1454b687b <.text+0x54b587b>
1454b6855:     	cmpw	0x3a(%rax,%rdx,2), %r12w
1454b685b:     	seta	%r10b
1454b685f:     	sbbb	$0x0, %r10b
1454b6863:     	incq	%rdx
1454b6866:     	addq	$-0x2, %r9
1454b686a:     	cmpb	$0x1, %r10b
1454b686e:     	je	0x1454b6850 <.text+0x54b5850>
1454b6870:     	movzbl	%r10b, %r9d
1454b6874:     	testl	%r9d, %r9d
1454b6877:     	jne	0x1454b687e <.text+0x54b587e>
1454b6879:     	jmp	0x1454b688f <.text+0x54b588f>
1454b687b:     	movq	%r11, %rdx
1454b687e:     	subq	$0x1, %rcx
1454b6882:     	jb	0x1454b70b8 <.text+0x54b60b8>
1454b6888:     	movq	0x50(%rax,%rdx,8), %rax
1454b688d:     	jmp	0x1454b6834 <.text+0x54b5834>
1454b688f:     	movl	%r14d, 0x8(%rax,%rdx,4)
1454b6894:     	movq	0x318(%rbp), %rsi
1454b689b:     	movq	(%rsi), %rax
1454b689e:     	testq	%rax, %rax
1454b68a1:     	je	0x1454b6987 <.text+0x54b5987>
1454b68a7:     	movq	0x8e0(%r13), %rcx
1454b68ae:     	movq	0x358(%rbp), %rsi
1454b68b5:     	movzwl	0x36(%rax), %r11d
1454b68ba:     	movl	%r11d, %r9d
1454b68bd:     	addl	%r9d, %r9d
1454b68c0:     	movq	$-0x1, %rdx
1454b68c7:     	nopw	(%rax,%rax)
1454b68d0:     	testq	%r9, %r9
1454b68d3:     	je	0x1454b68fb <.text+0x54b58fb>
1454b68d5:     	cmpw	0x3a(%rax,%rdx,2), %r15w
1454b68db:     	seta	%r10b
1454b68df:     	sbbb	$0x0, %r10b
1454b68e3:     	incq	%rdx
1454b68e6:     	addq	$-0x2, %r9
1454b68ea:     	cmpb	$0x1, %r10b
1454b68ee:     	je	0x1454b68d0 <.text+0x54b58d0>
1454b68f0:     	movzbl	%r10b, %r9d
1454b68f4:     	testl	%r9d, %r9d
1454b68f7:     	jne	0x1454b68fe <.text+0x54b58fe>
1454b68f9:     	jmp	0x1454b690f <.text+0x54b590f>
1454b68fb:     	movq	%r11, %rdx
1454b68fe:     	subq	$0x1, %rcx
1454b6902:     	jb	0x1454b70c0 <.text+0x54b60c0>
1454b6908:     	movq	0x50(%rax,%rdx,8), %rax
1454b690d:     	jmp	0x1454b68b5 <.text+0x54b58b5>
1454b690f:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b6914:     	jmp	0x1454b69e0 <.text+0x54b59e0>
1454b6919:     	movq	%r8, %r12
1454b691c:     	xorl	%eax, %eax
1454b691e:     	movaps	%xmm14, %xmm11
1454b6922:     	movl	0x328(%rbp), %edi
1454b6928:     	movq	0x318(%rbp), %rsi
1454b692f:     	movq	%rsi, 0xb0(%rbp)
1454b6936:     	movq	%rax, 0xb8(%rbp)
1454b693d:     	movq	$0x0, 0xc0(%rbp)
1454b6948:     	movq	%rdx, 0xc8(%rbp)
1454b694f:     	movq	$0x16, 0xd0(%rbp)
1454b695a:     	leaq	0x2b8(%rbp), %rcx
1454b6961:     	leaq	0xb0(%rbp), %rdx
1454b6968:     	movl	%r14d, %r8d
1454b696b:     	callq	0x14552a730 <.text+0x5529730>
1454b6970:     	movss	0x2a8(%rbp), %xmm4
1454b6978:     	movq	%r12, %r8
1454b697b:     	movq	(%rsi), %rax
1454b697e:     	testq	%rax, %rax
1454b6981:     	jne	0x1454b68a7 <.text+0x54b58a7>
1454b6987:     	xorl	%eax, %eax
1454b6989:     	movq	%rsi, 0xb0(%rbp)
1454b6990:     	movq	%rax, 0xb8(%rbp)
1454b6997:     	movq	$0x0, 0xc0(%rbp)
1454b69a2:     	movq	%rdx, 0xc8(%rbp)
1454b69a9:     	movq	$0x1c, 0xd0(%rbp)
1454b69b4:     	leaq	0x2b8(%rbp), %rcx
1454b69bb:     	leaq	0xb0(%rbp), %rdx
1454b69c2:     	callq	0x14552a730 <.text+0x5529730>
1454b69c7:     	movq	0x358(%rbp), %rsi
1454b69ce:     	movss	0x2a8(%rbp), %xmm4
1454b69d6:     	nopw	%cs:(%rax,%rax)
1454b69e0:     	movss	0x470(%r13), %xmm2
1454b69e9:     	movss	0x474(%r13), %xmm14
1454b69f2:     	movss	0x498(%r13), %xmm0
1454b69fb:     	movl	0x4a4(%r13), %eax
1454b6a02:     	movss	0x44(%rsi), %xmm1
1454b6a07:     	movzbl	0x75(%rsi), %ecx
1454b6a0b:     	addb	$-0x2, %cl
1454b6a0e:     	movss	0x450a7a(%rip), %xmm3   # 0x145907490
1454b6a16:     	cmpb	$0x6, %cl
1454b6a19:     	ja	0x1454b6a2a <.text+0x54b5a2a>
1454b6a1b:     	movzbl	%cl, %ecx
1454b6a1e:     	leaq	0x1541b0f(%rip), %rdx   # 0x1469f8534
1454b6a25:     	movss	(%rdx,%rcx,4), %xmm3
1454b6a2a:     	mulss	%xmm2, %xmm10
1454b6a2f:     	xorps	%xmm2, %xmm2
1454b6a32:     	cmpltss	%xmm1, %xmm2
1454b6a37:     	andps	%xmm10, %xmm2
1454b6a3b:     	mulss	0x461cad(%rip), %xmm1   # 0x1459186f0
1454b6a43:     	mulss	%xmm1, %xmm9
1454b6a48:     	mulss	%xmm9, %xmm12
1454b6a4d:     	mulss	%xmm3, %xmm12
1454b6a52:     	addss	%xmm2, %xmm12
1454b6a57:     	mulss	%xmm12, %xmm14
1454b6a5c:     	movss	0x50(%rsi), %xmm1
1454b6a61:     	ucomiss	%xmm15, %xmm1
1454b6a65:     	movq	0x348(%rbp), %r15
1454b6a6c:     	jbe	0x1454b6c8d <.text+0x54b5c8d>
1454b6a72:     	mulss	%xmm4, %xmm11
1454b6a77:     	mulss	%xmm1, %xmm11
1454b6a7c:     	mulss	%xmm11, %xmm0
1454b6a81:     	movss	0x76295a(%rip), %xmm9   # 0x145c193e4
1454b6a8a:     	ucomiss	%xmm0, %xmm9
1454b6a8e:     	movss	0x551909(%rip), %xmm10  # 0x145a083a0
1454b6a97:     	jae	0x1454b6abb <.text+0x54b5abb>
1454b6a99:     	addss	0x152375f(%rip), %xmm0  # 0x1469da200
1454b6aa1:     	movss	0x45ed57(%rip), %xmm7   # 0x145915800
1454b6aa9:     	divss	%xmm7, %xmm0
1454b6aad:     	callq	0x145773367 <.text+0x5772367>
1454b6ab2:     	mulss	%xmm7, %xmm0
1454b6ab6:     	addss	%xmm9, %xmm0
1454b6abb:     	movq	$0x0, 0x28(%rsp)
1454b6ac4:     	movq	$0x8, 0x20(%rsp)
1454b6acd:     	leaq	0x240(%rbp), %rcx
1454b6ad4:     	movq	%r13, %rdx
1454b6ad7:     	leaq	0x68(%rbp), %r8
1454b6adb:     	movaps	%xmm0, %xmm3
1454b6ade:     	callq	0x145500300 <.text+0x54ff300>
1454b6ae3:     	movl	0x64(%rsi), %r8d
1454b6ae7:     	movq	0x248(%rbp), %r9
1454b6aee:     	movq	0x250(%rbp), %rbx
1454b6af5:     	movl	$0x2, 0x2b8(%rbp)
1454b6aff:     	movl	$0x0, 0x2f0(%rbp)
1454b6b09:     	movb	$0x1, 0x325(%rbp)
1454b6b10:     	leaq	0x2f0(%rbp), %rax
1454b6b17:     	movq	%rax, 0x30(%rsp)
1454b6b1c:     	leaq	0x2b8(%rbp), %rax
1454b6b23:     	movq	%rax, 0x28(%rsp)
1454b6b28:     	movq	%rbx, 0x20(%rsp)
1454b6b2d:     	leaq	0xb0(%rbp), %rcx
1454b6b34:     	movq	0x338(%rbp), %rdx
1454b6b3b:     	movq	%r9, 0x338(%rbp)
1454b6b42:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b6b47:     	nop
1454b6b48:     	movq	0x560(%r13), %rsi
1454b6b4f:     	cmpq	0x550(%r13), %rsi
1454b6b56:     	jne	0x1454b6b65 <.text+0x54b5b65>
1454b6b58:     	movq	0x340(%rbp), %rcx
1454b6b5f:     	callq	0x145774710 <.text+0x5773710>
1454b6b64:     	nop
1454b6b65:     	movq	0x558(%r13), %rax
1454b6b6c:     	movq	%rsi, %rcx
1454b6b6f:     	shlq	$0x5, %rcx
1454b6b73:     	movups	0xb0(%rbp), %xmm0
1454b6b7a:     	movups	0xc0(%rbp), %xmm1
1454b6b81:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b6b86:     	movups	%xmm0, (%rax,%rcx)
1454b6b8a:     	incq	%rsi
1454b6b8d:     	movq	%rsi, 0x560(%r13)
1454b6b94:     	movq	0x240(%rbp), %rax
1454b6b9b:     	movq	%rax, 0x2a8(%rbp)
1454b6ba2:     	shlq	$0x3, %rbx
1454b6ba6:     	xorl	%r14d, %r14d
1454b6ba9:     	movq	0x358(%rbp), %rsi
1454b6bb0:     	jmp	0x1454b6be3 <.text+0x54b5be3>
1454b6bb2:     	nopw	%cs:(%rax,%rax)
1454b6bc0:     	movaps	%xmm14, %xmm2
1454b6bc4:     	movl	0x64(%rsi), %r9d
1454b6bc8:     	movzbl	0x74(%rsi), %eax
1454b6bcc:     	seta	0x28(%rsp)
1454b6bd1:     	movb	%al, 0x20(%rsp)
1454b6bd5:     	movb	$0x0, 0x30(%rsp)
1454b6bda:     	movq	%r13, %rcx
1454b6bdd:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b6be2:     	nop
1454b6be3:     	cmpq	%r14, %rbx
1454b6be6:     	je	0x1454b707c <.text+0x54b607c>
1454b6bec:     	movq	0x8a0(%r13), %r8
1454b6bf3:     	movq	0x8b8(%r13), %rax
1454b6bfa:     	leaq	(%rax,%r8), %rcx
1454b6bfe:     	rolq	$0x17, %rcx
1454b6c02:     	movq	0x338(%rbp), %rdx
1454b6c09:     	movq	(%rdx,%r14), %rdx
1454b6c0d:     	addq	%r8, %rcx
1454b6c10:     	movq	0x8a8(%r13), %r9
1454b6c17:     	movq	%r9, %r10
1454b6c1a:     	shlq	$0x11, %r10
1454b6c1e:     	movq	0x8b0(%r13), %r11
1454b6c25:     	xorq	%r8, %r11
1454b6c28:     	xorq	%r9, %rax
1454b6c2b:     	xorq	%r11, %r9
1454b6c2e:     	movq	%r9, 0x8a8(%r13)
1454b6c35:     	xorq	%rax, %r8
1454b6c38:     	movq	%r8, 0x8a0(%r13)
1454b6c3f:     	xorq	%r10, %r11
1454b6c42:     	movq	%r11, 0x8b0(%r13)
1454b6c49:     	rolq	$0x2d, %rax
1454b6c4d:     	shrq	$0x28, %rcx
1454b6c51:     	xorps	%xmm0, %xmm0
1454b6c54:     	cvtsi2ss	%ecx, %xmm0
1454b6c58:     	movq	%rax, 0x8b8(%r13)
1454b6c5f:     	mulss	%xmm10, %xmm0
1454b6c64:     	movss	0x47c(%r13), %xmm1
1454b6c6d:     	addq	$0x8, %r14
1454b6c71:     	ucomiss	%xmm0, %xmm1
1454b6c74:     	jbe	0x1454b6bc0 <.text+0x54b5bc0>
1454b6c7a:     	movss	0x480(%r13), %xmm2
1454b6c83:     	mulss	%xmm14, %xmm2
1454b6c88:     	jmp	0x1454b6bc4 <.text+0x54b5bc4>
1454b6c8d:     	movl	0x54(%rsi), %ecx
1454b6c90:     	addl	%edi, %ebx
1454b6c92:     	addl	%eax, %ebx
1454b6c94:     	leal	(%rbx,%rcx), %eax
1454b6c97:     	cmpl	$0x1, %eax
1454b6c9a:     	adcl	%ecx, %ebx
1454b6c9c:     	testl	%ecx, %ecx
1454b6c9e:     	movl	$0x1, %eax
1454b6ca3:     	cmovel	%eax, %ebx
1454b6ca6:     	movss	0x4c(%rsi), %xmm3
1454b6cab:     	movl	0x70(%rbp), %eax
1454b6cae:     	movl	%eax, 0x248(%rbp)
1454b6cb4:     	movq	0x68(%rbp), %rax
1454b6cb8:     	movq	%rax, 0x240(%rbp)
1454b6cbf:     	leaq	0xb0(%rbp), %rcx
1454b6cc6:     	movq	%r13, %rdx
1454b6cc9:     	leaq	0x240(%rbp), %r8
1454b6cd0:     	callq	0x1455004d0 <.text+0x54ff4d0>
1454b6cd5:     	movq	0xb0(%rbp), %rdx
1454b6cdc:     	movq	0xb8(%rbp), %r12
1454b6ce3:     	movq	0xc0(%rbp), %rax
1454b6cea:     	leaq	(%r12,%rax,8), %r9
1454b6cee:     	shlq	$0x3, %rax
1454b6cf2:     	shlq	$0x3, %rbx
1454b6cf6:     	xorl	%ecx, %ecx
1454b6cf8:     	movq	%rdx, 0x328(%rbp)
1454b6cff:     	nop
1454b6d00:     	cmpq	%rcx, %rax
1454b6d03:     	je	0x1454b6d14 <.text+0x54b5d14>
1454b6d05:     	addq	$0x8, %rcx
1454b6d09:     	cmpq	%rcx, %rbx
1454b6d0c:     	jne	0x1454b6d00 <.text+0x54b5d00>
1454b6d0e:     	addq	%r12, %rcx
1454b6d11:     	movq	%rcx, %r9
1454b6d14:     	movss	0x68(%rbp), %xmm9
1454b6d1a:     	movss	0x6c(%rbp), %xmm10
1454b6d20:     	movq	%r12, 0x238(%rbp)
1454b6d27:     	movq	%r9, 0x2a8(%rbp)
1454b6d2e:     	jmp	0x1454b6dee <.text+0x54b5dee>
1454b6d33:     	nopw	%cs:(%rax,%rax)
1454b6d40:     	movaps	%xmm9, %xmm0
1454b6d44:     	subss	%xmm12, %xmm0
1454b6d49:     	movshdup	%xmm12, %xmm1           # xmm1 = xmm12[1,1,3,3]
1454b6d4e:     	movaps	%xmm10, %xmm2
1454b6d52:     	subss	%xmm1, %xmm2
1454b6d56:     	mulss	%xmm0, %xmm0
1454b6d5a:     	mulss	%xmm2, %xmm2
1454b6d5e:     	addss	%xmm0, %xmm2
1454b6d62:     	xorps	%xmm0, %xmm0
1454b6d65:     	sqrtss	%xmm2, %xmm0
1454b6d69:     	divss	%xmm7, %xmm0
1454b6d6d:     	addss	%xmm8, %xmm0
1454b6d72:     	movq	0x368(%rbp), %rdx
1454b6d79:     	movq	0x510(%rdx), %rax
1454b6d80:     	leaq	(%rdi,%rdi,4), %rcx
1454b6d84:     	shlq	$0x4, %rcx
1454b6d88:     	movq	$0x0, (%rax,%rcx)
1454b6d90:     	movl	$0x0, 0x10(%rax,%rcx)
1454b6d98:     	movq	%r15, 0x20(%rax,%rcx)
1454b6d9d:     	movq	0x338(%rbp), %r8
1454b6da4:     	movq	%r8, 0x28(%rax,%rcx)
1454b6da9:     	movl	$0x0, 0x30(%rax,%rcx)
1454b6db1:     	movss	%xmm0, 0x3c(%rax,%rcx)
1454b6db7:     	movl	%ebx, 0x40(%rax,%rcx)
1454b6dbb:     	movss	%xmm11, 0x44(%rax,%rcx)
1454b6dc2:     	movb	%r13b, 0x48(%rax,%rcx)
1454b6dc7:     	movq	%rdx, %r13
1454b6dca:     	movw	$0x0, 0x49(%rax,%rcx)
1454b6dd1:     	movb	%r14b, 0x4b(%rax,%rcx)
1454b6dd6:     	incq	%rdi
1454b6dd9:     	movq	%rdi, 0x518(%rdx)
1454b6de0:     	movq	0x358(%rbp), %rsi
1454b6de7:     	movq	0x2a8(%rbp), %r9
1454b6dee:     	cmpq	%r9, %r12
1454b6df1:     	je	0x1454b7035 <.text+0x54b6035>
1454b6df7:     	movq	(%r12), %r15
1454b6dfb:     	addq	$0x8, %r12
1454b6dff:     	movss	0x934(%r13), %xmm0
1454b6e08:     	movq	0x4e0(%r13), %rax
1454b6e0f:     	imulq	$0x160, 0x4e8(%r13), %rdx # imm = 0x160
1454b6e1a:     	xorl	%ecx, %ecx
1454b6e1c:     	movq	%rax, %r8
1454b6e1f:     	nop
1454b6e20:     	cmpq	%rcx, %rdx
1454b6e23:     	je	0x1454b6dee <.text+0x54b5dee>
1454b6e25:     	addq	$0x160, %rcx            # imm = 0x160
1454b6e2c:     	cmpq	%r15, 0x88(%r8)
1454b6e33:     	leaq	0x160(%r8), %r8
1454b6e3a:     	jne	0x1454b6e20 <.text+0x54b5e20>
1454b6e3c:     	movss	-0x38(%rax,%rcx), %xmm1
1454b6e42:     	ucomiss	%xmm1, %xmm15
1454b6e46:     	jae	0x1454b6e90 <.text+0x54b5e90>
1454b6e48:     	subss	-0x3c(%rax,%rcx), %xmm0
1454b6e4e:     	divss	%xmm1, %xmm0
1454b6e52:     	xorps	%xmm1, %xmm1
1454b6e55:     	maxss	%xmm0, %xmm1
1454b6e59:     	movss	0x45062f(%rip), %xmm0   # 0x145907490
1454b6e61:     	minss	%xmm1, %xmm0
1454b6e65:     	movsd	-0x54(%rax,%rcx), %xmm1
1454b6e6b:     	movsd	-0x48(%rax,%rcx), %xmm2
1454b6e71:     	subps	%xmm1, %xmm2
1454b6e74:     	movsldup	%xmm0, %xmm12           # xmm12 = xmm0[0,0,2,2]
1454b6e79:     	mulps	%xmm2, %xmm12
1454b6e7d:     	addps	%xmm1, %xmm12
1454b6e81:     	jmp	0x1454b6e97 <.text+0x54b5e97>
1454b6e83:     	nopw	%cs:(%rax,%rax)
1454b6e90:     	movsd	-0x48(%rax,%rcx), %xmm12
1454b6e97:     	movl	0x64(%rsi), %r8d
1454b6e9b:     	movq	%r15, 0x2f0(%rbp)
1454b6ea2:     	movq	%r15, 0x248(%rbp)
1454b6ea9:     	movl	$0x0, 0x240(%rbp)
1454b6eb3:     	movl	$0x0, 0x2b8(%rbp)
1454b6ebd:     	leaq	0x2b8(%rbp), %rax
1454b6ec4:     	movq	%rax, 0x30(%rsp)
1454b6ec9:     	leaq	0x240(%rbp), %rax
1454b6ed0:     	movq	%rax, 0x28(%rsp)
1454b6ed5:     	movq	$0x1, 0x20(%rsp)
1454b6ede:     	leaq	0xb0(%rbp), %rcx
1454b6ee5:     	movq	0x338(%rbp), %rdx
1454b6eec:     	leaq	0x2f0(%rbp), %r9
1454b6ef3:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b6ef8:     	nop
1454b6ef9:     	movq	0x368(%rbp), %rdi
1454b6f00:     	movq	0x560(%rdi), %rsi
1454b6f07:     	cmpq	0x550(%rdi), %rsi
1454b6f0e:     	jne	0x1454b6f1d <.text+0x54b5f1d>
1454b6f10:     	movq	0x340(%rbp), %rcx
1454b6f17:     	callq	0x145774710 <.text+0x5773710>
1454b6f1c:     	nop
1454b6f1d:     	movq	0x558(%rdi), %rax
1454b6f24:     	movq	%rsi, %rcx
1454b6f27:     	shlq	$0x5, %rcx
1454b6f2b:     	movups	0xb0(%rbp), %xmm0
1454b6f32:     	movups	0xc0(%rbp), %xmm1
1454b6f39:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b6f3e:     	movups	%xmm0, (%rax,%rcx)
1454b6f42:     	incq	%rsi
1454b6f45:     	movq	%rsi, 0x560(%rdi)
1454b6f4c:     	movq	0x8a0(%rdi), %rcx
1454b6f53:     	movq	0x8b8(%rdi), %rax
1454b6f5a:     	leaq	(%rax,%rcx), %rdx
1454b6f5e:     	rolq	$0x17, %rdx
1454b6f62:     	addq	%rcx, %rdx
1454b6f65:     	movq	0x8a8(%rdi), %r8
1454b6f6c:     	movq	%r8, %r9
1454b6f6f:     	shlq	$0x11, %r9
1454b6f73:     	movq	0x8b0(%rdi), %r10
1454b6f7a:     	xorq	%rcx, %r10
1454b6f7d:     	xorq	%r8, %rax
1454b6f80:     	xorq	%r10, %r8
1454b6f83:     	movq	%r8, 0x8a8(%rdi)
1454b6f8a:     	xorq	%rax, %rcx
1454b6f8d:     	movq	%rcx, 0x8a0(%rdi)
1454b6f94:     	xorq	%r9, %r10
1454b6f97:     	rolq	$0x2d, %rax
1454b6f9b:     	shrq	$0x28, %rdx
1454b6f9f:     	xorps	%xmm0, %xmm0
1454b6fa2:     	cvtsi2ss	%edx, %xmm0
1454b6fa6:     	movq	%r10, 0x8b0(%rdi)
1454b6fad:     	movq	%rax, 0x8b8(%rdi)
1454b6fb4:     	mulss	0x5513e4(%rip), %xmm0   # 0x145a083a0
1454b6fbc:     	movss	0x47c(%rdi), %xmm1
1454b6fc4:     	ucomiss	%xmm0, %xmm1
1454b6fc7:     	movq	%rdi, %rsi
1454b6fca:     	seta	%r13b
1454b6fce:     	ja	0x1454b6fe0 <.text+0x54b5fe0>
1454b6fd0:     	movaps	%xmm14, %xmm11
1454b6fd4:     	jmp	0x1454b6fee <.text+0x54b5fee>
1454b6fd6:     	nopw	%cs:(%rax,%rax)
1454b6fe0:     	movss	0x480(%rsi), %xmm11
1454b6fe9:     	mulss	%xmm14, %xmm11
1454b6fee:     	movq	0x358(%rbp), %rdi
1454b6ff5:     	movl	0x64(%rdi), %ebx
1454b6ff8:     	movl	%ebx, %ecx
1454b6ffa:     	callq	0x145502b00 <.text+0x5501b00>
1454b6fff:     	movaps	%xmm0, %xmm7
1454b7002:     	maxss	0x450486(%rip), %xmm7   # 0x145907490
1454b700a:     	movzbl	0x74(%rdi), %r14d
1454b700f:     	movq	0x518(%rsi), %rdi
1454b7016:     	cmpq	0x508(%rsi), %rdi
1454b701d:     	jne	0x1454b6d40 <.text+0x54b5d40>
1454b7023:     	movq	0x310(%rbp), %rcx
1454b702a:     	callq	0x145780650 <.text+0x577f650>
1454b702f:     	nop
1454b7030:     	jmp	0x1454b6d40 <.text+0x54b5d40>
1454b7035:     	movq	0x328(%rbp), %rdx
1454b703c:     	testq	%rdx, %rdx
1454b703f:     	movss	0x4616a8(%rip), %xmm12  # 0x1459186f0
1454b7048:     	movss	0x762393(%rip), %xmm14  # 0x145c193e4
1454b7051:     	movq	0x348(%rbp), %r15
1454b7058:     	je	0x1454b647b <.text+0x54b547b>
1454b705e:     	shlq	$0x3, %rdx
1454b7062:     	movl	$0x8, %r8d
1454b7068:     	movq	0x238(%rbp), %rcx
1454b706f:     	callq	0x1400021d0 <.text+0x11d0>
1454b7074:     	incq	%r15
1454b7077:     	jmp	0x1454b5fad <.text+0x54b4fad>
1454b707c:     	movq	0x2a8(%rbp), %rdx
1454b7083:     	testq	%rdx, %rdx
1454b7086:     	je	0x1454b709e <.text+0x54b609e>
1454b7088:     	shlq	$0x3, %rdx
1454b708c:     	movl	$0x8, %r8d
1454b7092:     	movq	0x338(%rbp), %rcx
1454b7099:     	callq	0x1400021d0 <.text+0x11d0>
1454b709e:     	movss	0x461649(%rip), %xmm12  # 0x1459186f0
1454b70a7:     	movss	0x762334(%rip), %xmm14  # 0x145c193e4
1454b70b0:     	incq	%r15
1454b70b3:     	jmp	0x1454b5fad <.text+0x54b4fad>
1454b70b8:     	movq	%r8, %r12
1454b70bb:     	jmp	0x1454b6928 <.text+0x54b5928>
1454b70c0:     	movq	0x318(%rbp), %rsi
1454b70c7:     	jmp	0x1454b6989 <.text+0x54b5989>
1454b70cc:     	movq	%r13, %rcx
1454b70cf:     	movaps	%xmm6, %xmm1
1454b70d2:     	callq	0x1454db6c0 <.text+0x54da6c0>
1454b70d7:     	movsd	0x400(%r13), %xmm7
1454b70e0:     	movl	0x408(%r13), %eax
1454b70e7:     	movl	%eax, 0x358(%rbp)
1454b70ed:     	movss	0x934(%r13), %xmm8
1454b70f6:     	movss	0x488(%r13), %xmm9
1454b70ff:     	movq	$0x0, 0x220(%rbp)
1454b710a:     	movq	$0x8, 0x228(%rbp)
1454b7115:     	movq	$0x0, 0x230(%rbp)
1454b7120:     	movq	0x540(%r13), %rax
1454b7127:     	movq	0x548(%r13), %rcx
1454b712e:     	leaq	(%rcx,%rcx,8), %rcx
1454b7132:     	leaq	(%rax,%rcx,8), %rcx
1454b7136:     	movq	%rax, 0xb0(%rbp)
1454b713d:     	movq	%rcx, 0xb8(%rbp)
1454b7144:     	movq	%r13, 0xc0(%rbp)
1454b714b:     	movb	$0x1, 0x2b7(%rbp)
1454b7152:     	leaq	0x2f0(%rbp), %rcx
1454b7159:     	leaq	0xb0(%rbp), %rdx
1454b7160:     	callq	0x1455401a0 <.text+0x553f1a0>
1454b7165:     	nop
1454b7166:     	leaq	0x400(%r13), %rax
1454b716d:     	movq	%rax, 0x2a8(%rbp)
1454b7174:     	movq	0x540(%r13), %r12
1454b717b:     	movq	0x548(%r13), %rax
1454b7182:     	leaq	(%rax,%rax,8), %rax
1454b7186:     	leaq	(%r12,%rax,8), %rdi
1454b718a:     	movq	0x2f8(%rbp), %r9
1454b7191:     	movq	0x300(%rbp), %rbx
1454b7198:     	movabsq	$0xffffffffffffff8, %rax # imm = 0xFFFFFFFFFFFFFF8
1454b71a2:     	movq	%rbx, %r14
1454b71a5:     	andq	%rax, %r14
1454b71a8:     	shll	$0x3, %ebx
1454b71ab:     	andl	$0x38, %ebx
1454b71ae:     	movss	0x488629(%rip), %xmm10  # 0x14593f7e0
1454b71b7:     	movss	0x52d620(%rip), %xmm11  # 0x1459e47e0
1454b71c0:     	movss	0x48875b(%rip), %xmm12  # 0x14593f924
1454b71c9:     	movss	0x45035e(%rip), %xmm14  # 0x145907530
1454b71d2:     	leaq	0x220(%rbp), %r13
1454b71d9:     	movq	%r9, 0x338(%rbp)
1454b71e0:     	jmp	0x1454b7220 <.text+0x54b6220>
1454b71e2:     	movq	0x228(%rbp), %rax
1454b71e9:     	leaq	(%rsi,%rsi,2), %rcx
1454b71ed:     	movq	%r15, (%rax,%rcx,8)
1454b71f1:     	movq	0xb0(%rbp), %rdx
1454b71f8:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454b71fd:     	movl	0xb8(%rbp), %edx
1454b7203:     	movl	%edx, 0x10(%rax,%rcx,8)
1454b7207:     	movss	%xmm15, 0x14(%rax,%rcx,8)
1454b720e:     	incq	%rsi
1454b7211:     	movq	%rsi, 0x230(%rbp)
1454b7218:     	movq	0x338(%rbp), %r9
1454b721f:     	nop
1454b7220:     	cmpq	%rdi, %r12
1454b7223:     	setne	%r10b
1454b7227:     	je	0x1454b7441 <.text+0x54b6441>
1454b722d:     	movq	%r12, %rax
1454b7230:     	movaps	%xmm8, %xmm0
1454b7234:     	subss	0x40(%r12), %xmm0
1454b723b:     	ucomiss	%xmm10, %xmm0
1454b723f:     	jbe	0x1454b72a0 <.text+0x54b62a0>
1454b7241:     	movq	0x28(%rax), %rdx
1454b7245:     	xorl	%r8d, %r8d
1454b7248:     	nopl	(%rax,%rax)
1454b7250:     	cmpq	%r8, %r14
1454b7253:     	je	0x1454b7360 <.text+0x54b6360>
1454b7259:     	xorl	%ecx, %ecx
1454b725b:     	cmpq	%rdx, (%r9,%r8,8)
1454b725f:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7261:     	cmpq	%rdx, 0x8(%r9,%r8,8)
1454b7266:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7268:     	cmpq	%rdx, 0x10(%r9,%r8,8)
1454b726d:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b726f:     	cmpq	%rdx, 0x18(%r9,%r8,8)
1454b7274:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7276:     	cmpq	%rdx, 0x20(%r9,%r8,8)
1454b727b:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b727d:     	cmpq	%rdx, 0x28(%r9,%r8,8)
1454b7282:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7284:     	cmpq	%rdx, 0x30(%r9,%r8,8)
1454b7289:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b728b:     	cmpq	%rdx, 0x38(%r9,%r8,8)
1454b7290:     	leaq	0x8(%r8), %r8
1454b7294:     	jne	0x1454b7250 <.text+0x54b6250>
1454b7296:     	jmp	0x1454b72a2 <.text+0x54b62a2>
1454b7298:     	nopl	(%rax,%rax)
1454b72a0:     	xorl	%ecx, %ecx
1454b72a2:     	leaq	0x48(%rax), %r12
1454b72a6:     	cmpl	$0x0, 0x20(%rax)
1454b72aa:     	jne	0x1454b7220 <.text+0x54b6220>
1454b72b0:     	cmpb	$0x0, 0x18(%rax)
1454b72b4:     	jne	0x1454b7220 <.text+0x54b6220>
1454b72ba:     	movsd	0x34(%rax), %xmm0
1454b72bf:     	subps	%xmm7, %xmm0
1454b72c2:     	mulps	%xmm0, %xmm0
1454b72c5:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b72c9:     	addss	%xmm0, %xmm1
1454b72cd:     	xorps	%xmm15, %xmm15
1454b72d1:     	sqrtss	%xmm1, %xmm15
1454b72d6:     	ucomiss	%xmm15, %xmm9
1454b72da:     	setb	%dl
1454b72dd:     	movl	%ecx, %r8d
1454b72e0:     	notb	%r8b
1454b72e3:     	testb	%dl, %r8b
1454b72e6:     	jne	0x1454b7220 <.text+0x54b6220>
1454b72ec:     	movb	%r10b, 0x310(%rbp)
1454b72f3:     	movaps	%xmm11, %xmm0
1454b72f7:     	testb	$0x1, %cl
1454b72fa:     	jne	0x1454b7300 <.text+0x54b6300>
1454b72fc:     	movaps	%xmm12, %xmm0
1454b7300:     	leaq	0x34(%rax), %rcx
1454b7304:     	divss	%xmm0, %xmm15
1454b7309:     	maxss	%xmm14, %xmm15
1454b730e:     	movaps	%xmm8, %xmm0
1454b7312:     	addss	%xmm15, %xmm0
1454b7317:     	movl	$0x1, 0x18(%rax)
1454b731e:     	movss	%xmm0, 0x1c(%rax)
1454b7323:     	movq	0x28(%rax), %r15
1454b7327:     	movl	0x8(%rcx), %eax
1454b732a:     	movl	%eax, 0xb8(%rbp)
1454b7330:     	movq	(%rcx), %rax
1454b7333:     	movq	%rax, 0xb0(%rbp)
1454b733a:     	movq	0x230(%rbp), %rsi
1454b7341:     	cmpq	0x220(%rbp), %rsi
1454b7348:     	jne	0x1454b71e2 <.text+0x54b61e2>
1454b734e:     	movq	%r13, %rcx
1454b7351:     	callq	0x1457745c0 <.text+0x57735c0>
1454b7356:     	nop
1454b7357:     	jmp	0x1454b71e2 <.text+0x54b61e2>
1454b735c:     	nopl	(%rax)
1454b7360:     	testq	%rbx, %rbx
1454b7363:     	je	0x1454b743a <.text+0x54b643a>
1454b7369:     	movq	(%r9,%r14,8), %r8
1454b736d:     	cmpq	%rdx, %r8
1454b7370:     	setne	%cl
1454b7373:     	negb	%cl
1454b7375:     	cmpq	%rdx, %r8
1454b7378:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b737e:     	cmpl	$0x8, %ebx
1454b7381:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7387:     	movq	0x8(%r9,%r14,8), %r8
1454b738c:     	cmpq	%rdx, %r8
1454b738f:     	setne	%cl
1454b7392:     	negb	%cl
1454b7394:     	cmpq	%rdx, %r8
1454b7397:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b739d:     	cmpl	$0x10, %ebx
1454b73a0:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73a6:     	movq	0x10(%r9,%r14,8), %r8
1454b73ab:     	cmpq	%rdx, %r8
1454b73ae:     	setne	%cl
1454b73b1:     	negb	%cl
1454b73b3:     	cmpq	%rdx, %r8
1454b73b6:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73bc:     	cmpl	$0x18, %ebx
1454b73bf:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73c5:     	movq	0x18(%r9,%r14,8), %r8
1454b73ca:     	cmpq	%rdx, %r8
1454b73cd:     	setne	%cl
1454b73d0:     	negb	%cl
1454b73d2:     	cmpq	%rdx, %r8
1454b73d5:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73db:     	cmpl	$0x20, %ebx
1454b73de:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73e4:     	movq	0x20(%r9,%r14,8), %r8
1454b73e9:     	cmpq	%rdx, %r8
1454b73ec:     	setne	%cl
1454b73ef:     	negb	%cl
1454b73f1:     	cmpq	%rdx, %r8
1454b73f4:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b73fa:     	cmpl	$0x28, %ebx
1454b73fd:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7403:     	movq	0x28(%r9,%r14,8), %r8
1454b7408:     	cmpq	%rdx, %r8
1454b740b:     	setne	%cl
1454b740e:     	negb	%cl
1454b7410:     	cmpq	%rdx, %r8
1454b7413:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7419:     	cmpl	$0x30, %ebx
1454b741c:     	je	0x1454b72a2 <.text+0x54b62a2>
1454b7422:     	cmpq	$0x38, %rbx
1454b7426:     	sete	%r8b
1454b742a:     	cmpq	%rdx, 0x30(%r9,%r14,8)
1454b742f:     	setne	%cl
1454b7432:     	andb	%r8b, %cl
1454b7435:     	jmp	0x1454b72a2 <.text+0x54b62a2>
1454b743a:     	movb	$0x1, %cl
1454b743c:     	jmp	0x1454b72a2 <.text+0x54b62a2>
1454b7441:     	movb	%r10b, 0x310(%rbp)
1454b7448:     	movq	0x220(%rbp), %rax
1454b744f:     	movq	%rax, 0x348(%rbp)
1454b7456:     	movq	0x228(%rbp), %r15
1454b745d:     	movq	0x230(%rbp), %rax
1454b7464:     	leaq	(%rax,%rax,2), %rax
1454b7468:     	leaq	(%r15,%rax,8), %r12
1454b746c:     	movss	0x45e4a3(%rip), %xmm10  # 0x145915918
1454b7475:     	xorl	%r13d, %r13d
1454b7478:     	xorps	%xmm11, %xmm11
1454b747c:     	leaq	0xb0(%rbp), %rdi
1454b7483:     	leaq	0x2b8(%rbp), %rbx
1454b748a:     	leaq	0x240(%rbp), %r14
1454b7491:     	movq	%r15, 0x298(%rbp)
1454b7498:     	jmp	0x1454b74da <.text+0x54b64da>
1454b749a:     	nopw	(%rax,%rax)
1454b74a0:     	addq	$0x18, %r15
1454b74a4:     	movq	0x368(%rbp), %rdx
1454b74ab:     	movq	0x558(%rdx), %rax
1454b74b2:     	movq	%rsi, %rcx
1454b74b5:     	shlq	$0x5, %rcx
1454b74b9:     	movups	0xb0(%rbp), %xmm0
1454b74c0:     	movups	0xc0(%rbp), %xmm1
1454b74c7:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b74cc:     	movups	%xmm0, (%rax,%rcx)
1454b74d0:     	incq	%rsi
1454b74d3:     	movq	%rsi, 0x560(%rdx)
1454b74da:     	cmpq	%r12, %r15
1454b74dd:     	je	0x1454b7591 <.text+0x54b6591>
1454b74e3:     	movq	(%r15), %rdx
1454b74e6:     	movl	0x10(%r15), %eax
1454b74ea:     	movl	%eax, 0x2c0(%rbp)
1454b74f0:     	movq	0x8(%r15), %rax
1454b74f4:     	movq	%rax, 0x2b8(%rbp)
1454b74fb:     	movss	0x14(%r15), %xmm0
1454b7501:     	movq	0x368(%rbp), %r8
1454b7508:     	movl	0x958(%r8), %eax
1454b750f:     	incl	%eax
1454b7511:     	mulss	%xmm10, %xmm0
1454b7516:     	cvttss2si	%xmm0, %rcx
1454b751b:     	ucomiss	%xmm11, %xmm0
1454b751f:     	cmovbl	%r13d, %ecx
1454b7523:     	movl	%eax, 0x958(%r8)
1454b752a:     	ucomiss	%xmm13, %xmm0
1454b752e:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454b7534:     	ja	0x1454b7539 <.text+0x54b6539>
1454b7536:     	movl	%ecx, %r8d
1454b7539:     	movlps	%xmm7, 0x240(%rbp)
1454b7540:     	movl	0x358(%rbp), %ecx
1454b7546:     	movl	%ecx, 0x248(%rbp)
1454b754c:     	movl	%r8d, 0x28(%rsp)
1454b7551:     	movl	%eax, 0x20(%rsp)
1454b7555:     	movq	%rdi, %rcx
1454b7558:     	movq	%rbx, %r8
1454b755b:     	movq	%r14, %r9
1454b755e:     	callq	0x14545b540 <.text+0x545a540>
1454b7563:     	nop
1454b7564:     	movq	0x368(%rbp), %rax
1454b756b:     	movq	0x560(%rax), %rsi
1454b7572:     	cmpq	0x550(%rax), %rsi
1454b7579:     	jne	0x1454b74a0 <.text+0x54b64a0>
1454b757f:     	movq	0x340(%rbp), %rcx
1454b7586:     	callq	0x145774710 <.text+0x5773710>
1454b758b:     	nop
1454b758c:     	jmp	0x1454b74a0 <.text+0x54b64a0>
1454b7591:     	movq	0x348(%rbp), %rax
1454b7598:     	testq	%rax, %rax
1454b759b:     	je	0x1454b75b7 <.text+0x54b65b7>
1454b759d:     	shlq	$0x3, %rax
1454b75a1:     	leaq	(%rax,%rax,2), %rdx
1454b75a5:     	movl	$0x8, %r8d
1454b75ab:     	movq	0x298(%rbp), %rcx
1454b75b2:     	callq	0x1400021d0 <.text+0x11d0>
1454b75b7:     	movq	$0x0, 0x2b8(%rbp)
1454b75c2:     	movq	$0x8, 0x2c0(%rbp)
1454b75cd:     	movq	$0x0, 0x2c8(%rbp)
1454b75d8:     	movq	0x368(%rbp), %rax
1454b75df:     	movq	0x540(%rax), %rcx
1454b75e6:     	movq	0x548(%rax), %rax
1454b75ed:     	leaq	(%rax,%rax,8), %rax
1454b75f1:     	leaq	(%rcx,%rax,8), %rdx
1454b75f5:     	xorl	%ebx, %ebx
1454b75f7:     	leaq	0x2b8(%rbp), %rdi
1454b75fe:     	movss	0x45bcf5(%rip), %xmm10  # 0x1459132fc
1454b7607:     	xorl	%r14d, %r14d
1454b760a:     	movq	%rdx, 0x328(%rbp)
1454b7611:     	cmpq	%rdx, %rcx
1454b7614:     	jne	0x1454b7650 <.text+0x54b6650>
1454b7616:     	jmp	0x1454b76d5 <.text+0x54b66d5>
1454b761b:     	nopl	(%rax,%rax)
1454b7620:     	movsd	0x34(%rcx), %xmm0
1454b7625:     	subps	%xmm7, %xmm0
1454b7628:     	mulps	%xmm0, %xmm0
1454b762b:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b762f:     	addss	%xmm0, %xmm1
1454b7633:     	xorps	%xmm0, %xmm0
1454b7636:     	sqrtss	%xmm1, %xmm0
1454b763a:     	ucomiss	%xmm0, %xmm10
1454b763e:     	jae	0x1454b7689 <.text+0x54b6689>
1454b7640:     	addq	$0x48, %rcx
1454b7644:     	incq	%r14
1454b7647:     	cmpq	%rdx, %rcx
1454b764a:     	je	0x1454b76d5 <.text+0x54b66d5>
1454b7650:     	movl	0x20(%rcx), %eax
1454b7653:     	testl	%eax, %eax
1454b7655:     	je	0x1454b767c <.text+0x54b667c>
1454b7657:     	cmpl	$0x1, %eax
1454b765a:     	jne	0x1454b7620 <.text+0x54b6620>
1454b765c:     	movsd	0x34(%rcx), %xmm0
1454b7661:     	subps	%xmm7, %xmm0
1454b7664:     	mulps	%xmm0, %xmm0
1454b7667:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b766b:     	addss	%xmm0, %xmm1
1454b766f:     	xorps	%xmm0, %xmm0
1454b7672:     	sqrtss	%xmm1, %xmm0
1454b7676:     	ucomiss	%xmm0, %xmm9
1454b767a:     	jae	0x1454b7689 <.text+0x54b6689>
1454b767c:     	cmpl	$0x1, 0x18(%rcx)
1454b7680:     	jne	0x1454b7640 <.text+0x54b6640>
1454b7682:     	ucomiss	0x1c(%rcx), %xmm8
1454b7687:     	jb	0x1454b7640 <.text+0x54b6640>
1454b7689:     	movq	%rcx, 0x298(%rbp)
1454b7690:     	cmpq	0x2b8(%rbp), %rbx
1454b7697:     	jne	0x1454b76a2 <.text+0x54b66a2>
1454b7699:     	movq	%rdi, %rcx
1454b769c:     	callq	0x145774550 <.text+0x5773550>
1454b76a1:     	nop
1454b76a2:     	movq	0x298(%rbp), %rcx
1454b76a9:     	addq	$0x48, %rcx
1454b76ad:     	movq	0x2c0(%rbp), %rax
1454b76b4:     	movq	%r14, (%rax,%rbx,8)
1454b76b8:     	incq	%r14
1454b76bb:     	incq	%rbx
1454b76be:     	movq	%rbx, 0x2c8(%rbp)
1454b76c5:     	movq	0x328(%rbp), %rdx
1454b76cc:     	cmpq	%rdx, %rcx
1454b76cf:     	jne	0x1454b7650 <.text+0x54b6650>
1454b76d5:     	movq	%rcx, 0x298(%rbp)
1454b76dc:     	movq	0x2b8(%rbp), %rax
1454b76e3:     	movq	%rax, 0x80(%rbp)
1454b76ea:     	movq	0x2c0(%rbp), %rax
1454b76f1:     	movq	%rax, 0x358(%rbp)
1454b76f8:     	leaq	(%rax,%rbx,8), %r15
1454b76fc:     	leaq	0x1540fe9(%rip), %r13   # 0x1469f86ec
1454b7703:     	xorps	%xmm7, %xmm7
1454b7706:     	movl	$0x498, %edi            # imm = 0x498
1454b770b:     	movss	0x44fe24(%rip), %xmm8   # 0x145907538
1454b7714:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7716:     	movl	%r14d, %eax
1454b7719:     	xorps	%xmm0, %xmm0
1454b771c:     	cvtsi2ss	%rax, %xmm0
1454b7721:     	movq	0x368(%rbp), %rsi
1454b7728:     	mulss	0x48c(%rsi), %xmm0
1454b7730:     	callq	0x14577322f <.text+0x577222f>
1454b7735:     	maxss	0x44fd53(%rip), %xmm0   # 0x145907490
1454b773d:     	cvttss2si	%xmm0, %rdx
1454b7742:     	ucomiss	%xmm7, %xmm0
1454b7745:     	movl	$0x0, %eax
1454b774a:     	cmovbl	%eax, %edx
1454b774d:     	ucomiss	%xmm13, %xmm0
1454b7751:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b7756:     	cmoval	%eax, %edx
1454b7759:     	movq	%rsi, %rcx
1454b775c:     	callq	0x1454c69e0 <.text+0x54c59e0>
1454b7761:     	nop
1454b7762:     	nopw	%cs:(%rax,%rax)
1454b7770:     	cmpq	%r15, 0x358(%rbp)
1454b7777:     	je	0x1454b7c0d <.text+0x54b6c0d>
1454b777d:     	movq	-0x8(%r15), %r12
1454b7781:     	movq	0x368(%rbp), %rax
1454b7788:     	movq	0x548(%rax), %rdx
1454b778f:     	cmpq	%rdx, %r12
1454b7792:     	jae	0x1454bc7cb <.text+0x54bb7cb>
1454b7798:     	addq	$-0x8, %r15
1454b779c:     	movq	0x540(%rax), %rax
1454b77a3:     	leaq	(%r12,%r12,8), %rcx
1454b77a7:     	movl	0x20(%rax,%rcx,8), %ebx
1454b77ab:     	movl	0x24(%rax,%rcx,8), %r14d
1454b77b0:     	cmpl	$0x2, %ebx
1454b77b3:     	jne	0x1454b7830 <.text+0x54b6830>
1454b77b5:     	movq	0x368(%rbp), %rcx
1454b77bc:     	cmpb	$0x0, 0x9ad(%rcx)
1454b77c3:     	je	0x1454b7820 <.text+0x54b6820>
1454b77c5:     	cmpb	$0x0, 0x9b0(%rcx)
1454b77cc:     	movb	$0x1, 0x9b0(%rcx)
1454b77d3:     	jne	0x1454b7770 <.text+0x54b6770>
1454b77d5:     	movl	$0x1e, %edx
1454b77da:     	leaq	0x153fa1f(%rip), %rcx   # 0x1469f7200
1454b77e1:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b77e6:     	nop
1454b77e7:     	movq	%rdx, %r8
1454b77ea:     	testq	%rax, %rax
1454b77ed:     	leaq	0x153fa0c(%rip), %rcx   # 0x1469f7200
1454b77f4:     	cmoveq	%rcx, %rax
1454b77f8:     	movl	$0x1e, %ecx
1454b77fd:     	cmoveq	%rcx, %r8
1454b7801:     	movq	0x368(%rbp), %rcx
1454b7808:     	movq	%rax, %rdx
1454b780b:     	callq	0x1454e4340 <.text+0x54e3340>
1454b7810:     	nop
1454b7811:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7816:     	nopw	%cs:(%rax,%rax)
1454b7820:     	callq	0x1454e5660 <.text+0x54e4660>
1454b7825:     	nop
1454b7826:     	testb	%al, %al
1454b7828:     	je	0x1454b7770 <.text+0x54b6770>
1454b782e:     	nop
1454b7830:     	movq	0x368(%rbp), %rcx
1454b7837:     	movq	%r12, %rdx
1454b783a:     	callq	0x1454e3210 <.text+0x54e2210>
1454b783f:     	nop
1454b7840:     	movl	%ebx, %eax
1454b7842:     	movslq	(%r13,%rax,4), %rax
1454b7847:     	addq	%r13, %rax
1454b784a:     	jmpq	*%rax
1454b784c:     	movq	0x368(%rbp), %rcx
1454b7853:     	movl	%ebx, %edx
1454b7855:     	callq	0x1454e5b40 <.text+0x54e4b40>
1454b785a:     	nop
1454b785b:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7860:     	callq	0x140002200 <.text+0x1200>
1454b7865:     	movl	$0x20, %ecx
1454b786a:     	movl	$0x1, %edx
1454b786f:     	callq	0x1400021c0 <.text+0x11c0>
1454b7874:     	testq	%rax, %rax
1454b7877:     	je	0x1454bc9d3 <.text+0x54bb9d3>
1454b787d:     	movq	%rax, 0x348(%rbp)
1454b7884:     	movl	$0x4b4, (%rax)          # imm = 0x4B4
1454b788a:     	movq	0x368(%rbp), %rax
1454b7891:     	movq	0x560(%rax), %rsi
1454b7898:     	cmpq	0x550(%rax), %rsi
1454b789f:     	jne	0x1454b78ae <.text+0x54b68ae>
1454b78a1:     	movq	0x340(%rbp), %rcx
1454b78a8:     	callq	0x145774710 <.text+0x5773710>
1454b78ad:     	nop
1454b78ae:     	movq	0x368(%rbp), %rdx
1454b78b5:     	movq	0x558(%rdx), %rax
1454b78bc:     	movq	%rsi, %rcx
1454b78bf:     	shlq	$0x5, %rcx
1454b78c3:     	movq	$0x20, (%rax,%rcx)
1454b78cb:     	movq	0x348(%rbp), %r8
1454b78d2:     	movq	%r8, 0x8(%rax,%rcx)
1454b78d7:     	movq	$0x4, 0x10(%rax,%rcx)
1454b78e0:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454b78e7:     	incq	%rsi
1454b78ea:     	movq	%rsi, 0x560(%rdx)
1454b78f1:     	cmpb	$0x1, 0x9b9(%rdx)
1454b78f8:     	jne	0x1454b7770 <.text+0x54b6770>
1454b78fe:     	movq	0x368(%rbp), %rax
1454b7905:     	cmpl	$0x0, 0x940(%rax)
1454b790c:     	je	0x1454b7770 <.text+0x54b6770>
1454b7912:     	movq	0x368(%rbp), %rax
1454b7919:     	cmpb	$0x0, 0x9b2(%rax)
1454b7920:     	jne	0x1454b7770 <.text+0x54b6770>
1454b7926:     	movq	0x368(%rbp), %rcx
1454b792d:     	movb	$0x1, %dl
1454b792f:     	movb	$0x1, %r8b
1454b7932:     	callq	0x1454ec7a0 <.text+0x54eb7a0>
1454b7937:     	nop
1454b7938:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b793d:     	movq	0x368(%rbp), %rcx
1454b7944:     	incl	0x68c(%rcx)
1454b794a:     	callq	0x1454e4530 <.text+0x54e3530>
1454b794f:     	nop
1454b7950:     	movq	0x368(%rbp), %rax
1454b7957:     	movq	0x548(%rax), %rcx
1454b795e:     	testq	%rcx, %rcx
1454b7961:     	je	0x1454b7ae4 <.text+0x54b6ae4>
1454b7967:     	movq	0x368(%rbp), %rax
1454b796e:     	movss	0x400(%rax), %xmm0
1454b7976:     	movss	0x404(%rax), %xmm1
1454b797e:     	movss	0x934(%rax), %xmm2
1454b7986:     	movq	0x540(%rax), %rax
1454b798d:     	shlq	$0x3, %rcx
1454b7991:     	leaq	(%rcx,%rcx,8), %rcx
1454b7995:     	xorl	%edx, %edx
1454b7997:     	jmp	0x1454b79ad <.text+0x54b69ad>
1454b7999:     	nopl	(%rax)
1454b79a0:     	addq	$0x48, %rdx
1454b79a4:     	cmpq	%rdx, %rcx
1454b79a7:     	je	0x1454b7ae4 <.text+0x54b6ae4>
1454b79ad:     	cmpl	$0x1, 0x20(%rax,%rdx)
1454b79b2:     	jne	0x1454b79a0 <.text+0x54b69a0>
1454b79b4:     	cmpl	$0x0, 0x18(%rax,%rdx)
1454b79b9:     	jne	0x1454b79a0 <.text+0x54b69a0>
1454b79bb:     	movss	0x34(%rax,%rdx), %xmm3
1454b79c1:     	subss	%xmm0, %xmm3
1454b79c5:     	movss	0x38(%rax,%rdx), %xmm4
1454b79cb:     	subss	%xmm1, %xmm4
1454b79cf:     	mulss	%xmm3, %xmm3
1454b79d3:     	mulss	%xmm4, %xmm4
1454b79d7:     	addss	%xmm3, %xmm4
1454b79db:     	xorps	%xmm3, %xmm3
1454b79de:     	sqrtss	%xmm4, %xmm3
1454b79e2:     	divss	0x45b966(%rip), %xmm3   # 0x145913350
1454b79ea:     	maxss	%xmm8, %xmm3
1454b79ef:     	addss	%xmm2, %xmm3
1454b79f3:     	movl	$0x1, 0x18(%rax,%rdx)
1454b79fb:     	movss	%xmm3, 0x1c(%rax,%rdx)
1454b7a01:     	jmp	0x1454b79a0 <.text+0x54b69a0>
1454b7a03:     	movl	%r14d, %eax
1454b7a06:     	xorps	%xmm0, %xmm0
1454b7a09:     	cvtsi2ss	%rax, %xmm0
1454b7a0e:     	movq	0x368(%rbp), %rsi
1454b7a15:     	mulss	0x4a0(%rsi), %xmm0
1454b7a1d:     	callq	0x14577322f <.text+0x577222f>
1454b7a22:     	cvttss2si	%xmm0, %rax
1454b7a27:     	ucomiss	%xmm7, %xmm0
1454b7a2a:     	movl	$0x0, %ecx
1454b7a2f:     	cmovbl	%ecx, %eax
1454b7a32:     	ucomiss	%xmm13, %xmm0
1454b7a36:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b7a3b:     	cmoval	%ecx, %eax
1454b7a3e:     	movl	0x420(%rsi), %ecx
1454b7a44:     	addl	%eax, %ecx
1454b7a46:     	movl	%ecx, 0x420(%rsi)
1454b7a4c:     	addl	%eax, 0x684(%rsi)
1454b7a52:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454b7a59:     	movq	0x8d8(%rsi), %rax
1454b7a60:     	testq	%rax, %rax
1454b7a63:     	je	0x1454b7bc0 <.text+0x54b6bc0>
1454b7a69:     	movq	0x8e0(%rsi), %rcx
1454b7a70:     	movzwl	0x36(%rax), %r9d
1454b7a75:     	movl	%r9d, %r10d
1454b7a78:     	addl	%r10d, %r10d
1454b7a7b:     	movq	$-0x1, %rdx
1454b7a82:     	nopw	%cs:(%rax,%rax)
1454b7a90:     	testq	%r10, %r10
1454b7a93:     	je	0x1454b7ad0 <.text+0x54b6ad0>
1454b7a95:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454b7a9b:     	cmpl	%r11d, %edi
1454b7a9e:     	seta	%r11b
1454b7aa2:     	sbbb	$0x0, %r11b
1454b7aa6:     	incq	%rdx
1454b7aa9:     	addq	$-0x2, %r10
1454b7aad:     	cmpb	$0x1, %r11b
1454b7ab1:     	je	0x1454b7a90 <.text+0x54b6a90>
1454b7ab3:     	movzbl	%r11b, %r9d
1454b7ab7:     	testl	%r9d, %r9d
1454b7aba:     	je	0x1454b7bb6 <.text+0x54b6bb6>
1454b7ac0:     	subq	$0x1, %rcx
1454b7ac4:     	jae	0x1454b7add <.text+0x54b6add>
1454b7ac6:     	jmp	0x1454b7bc2 <.text+0x54b6bc2>
1454b7acb:     	nopl	(%rax,%rax)
1454b7ad0:     	movq	%r9, %rdx
1454b7ad3:     	subq	$0x1, %rcx
1454b7ad7:     	jb	0x1454b7bc2 <.text+0x54b6bc2>
1454b7add:     	movq	0x50(%rax,%rdx,8), %rax
1454b7ae2:     	jmp	0x1454b7a70 <.text+0x54b6a70>
1454b7ae4:     	callq	0x140002200 <.text+0x1200>
1454b7ae9:     	movl	$0x20, %ecx
1454b7aee:     	movl	$0x1, %edx
1454b7af3:     	callq	0x1400021c0 <.text+0x11c0>
1454b7af8:     	testq	%rax, %rax
1454b7afb:     	je	0x1454bc9be <.text+0x54bb9be>
1454b7b01:     	movq	%rax, 0x348(%rbp)
1454b7b08:     	movl	$0x78, (%rax)
1454b7b0e:     	movq	0x368(%rbp), %rax
1454b7b15:     	movq	0x560(%rax), %rsi
1454b7b1c:     	cmpq	0x550(%rax), %rsi
1454b7b23:     	jne	0x1454b7b32 <.text+0x54b6b32>
1454b7b25:     	movq	0x340(%rbp), %rcx
1454b7b2c:     	callq	0x145774710 <.text+0x5773710>
1454b7b31:     	nop
1454b7b32:     	movq	0x368(%rbp), %rdx
1454b7b39:     	movq	0x558(%rdx), %rax
1454b7b40:     	movq	%rsi, %rcx
1454b7b43:     	shlq	$0x5, %rcx
1454b7b47:     	movq	$0x20, (%rax,%rcx)
1454b7b4f:     	movq	0x348(%rbp), %r8
1454b7b56:     	movq	%r8, 0x8(%rax,%rcx)
1454b7b5b:     	movq	$0x4, 0x10(%rax,%rcx)
1454b7b64:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454b7b6b:     	incq	%rsi
1454b7b6e:     	movq	%rsi, 0x560(%rdx)
1454b7b75:     	movl	$0x2d, %edx
1454b7b7a:     	leaq	0x153f52f(%rip), %rcx   # 0x1469f70b0
1454b7b81:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b7b86:     	nop
1454b7b87:     	movq	%rdx, %r8
1454b7b8a:     	testq	%rax, %rax
1454b7b8d:     	leaq	0x153f51c(%rip), %rcx   # 0x1469f70b0
1454b7b94:     	cmoveq	%rcx, %rax
1454b7b98:     	movl	$0x2d, %ecx
1454b7b9d:     	cmoveq	%rcx, %r8
1454b7ba1:     	movq	0x368(%rbp), %rcx
1454b7ba8:     	movq	%rax, %rdx
1454b7bab:     	callq	0x1454e4340 <.text+0x54e3340>
1454b7bb0:     	nop
1454b7bb1:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7bb6:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b7bbb:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7bc0:     	xorl	%eax, %eax
1454b7bc2:     	movq	0x318(%rbp), %rcx
1454b7bc9:     	movq	%rcx, 0xb0(%rbp)
1454b7bd0:     	movq	%rax, 0xb8(%rbp)
1454b7bd7:     	movq	$0x0, 0xc0(%rbp)
1454b7be2:     	movq	%rdx, 0xc8(%rbp)
1454b7be9:     	movq	$0x498, 0xd0(%rbp)      # imm = 0x498
1454b7bf4:     	leaq	0x240(%rbp), %rcx
1454b7bfb:     	leaq	0xb0(%rbp), %rdx
1454b7c02:     	callq	0x14552a730 <.text+0x5529730>
1454b7c07:     	nop
1454b7c08:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7c0d:     	movq	0x80(%rbp), %rdx
1454b7c14:     	testq	%rdx, %rdx
1454b7c17:     	je	0x1454b7c2f <.text+0x54b6c2f>
1454b7c19:     	shlq	$0x3, %rdx
1454b7c1d:     	movl	$0x8, %r8d
1454b7c23:     	movq	0x358(%rbp), %rcx
1454b7c2a:     	callq	0x1400021d0 <.text+0x11d0>
1454b7c2f:     	movq	0x2f0(%rbp), %rdx
1454b7c36:     	testq	%rdx, %rdx
1454b7c39:     	movq	0x368(%rbp), %r13
1454b7c40:     	movq	0x338(%rbp), %rcx
1454b7c47:     	je	0x1454b7c58 <.text+0x54b6c58>
1454b7c49:     	shlq	$0x3, %rdx
1454b7c4d:     	movl	$0x8, %r8d
1454b7c53:     	callq	0x1400021d0 <.text+0x11d0>
1454b7c58:     	cmpb	$0x1, 0x9b9(%r13)
1454b7c60:     	jne	0x1454b8dea <.text+0x54b7dea>
1454b7c66:     	movq	0x848(%r13), %r12
1454b7c6d:     	testq	%r12, %r12
1454b7c70:     	je	0x1454b8dea <.text+0x54b7dea>
1454b7c76:     	movss	0x934(%r13), %xmm8
1454b7c7f:     	movsd	0x400(%r13), %xmm7
1454b7c88:     	movshdup	%xmm7, %xmm0            # xmm0 = xmm7[1,1,3,3]
1454b7c8c:     	movaps	%xmm0, 0x80(%rbp)
1454b7c93:     	movzbl	0x225(%r13), %eax
1454b7c9b:     	movss	0x484(%r13), %xmm1
1454b7ca4:     	xorps	%xmm0, %xmm0
1454b7ca7:     	cvtsi2ss	%eax, %xmm0
1454b7cab:     	mulss	0x44f869(%rip), %xmm0   # 0x14590751c
1454b7cb3:     	movss	0x44f7d4(%rip), %xmm12  # 0x145907490
1454b7cbc:     	addss	%xmm12, %xmm0
1454b7cc1:     	mulss	0x45dbef(%rip), %xmm0   # 0x1459158b8
1454b7cc9:     	maxss	%xmm12, %xmm1
1454b7cce:     	mulss	%xmm0, %xmm1
1454b7cd2:     	movss	0x451905(%rip), %xmm14  # 0x1459095e0
1454b7cdb:     	addss	%xmm8, %xmm14
1454b7ce0:     	movss	0x45b614(%rip), %xmm0   # 0x1459132fc
1454b7ce8:     	movss	%xmm1, 0x298(%rbp)
1454b7cf0:     	mulss	%xmm1, %xmm0
1454b7cf4:     	movss	%xmm0, 0x238(%rbp)
1454b7cfc:     	xorps	%xmm11, %xmm11
1454b7d00:     	movl	$0x498, %r14d           # imm = 0x498
1454b7d06:     	xorl	%ebx, %ebx
1454b7d08:     	movq	%r12, 0x348(%rbp)
1454b7d0f:     	movss	%xmm14, 0x328(%rbp)
1454b7d18:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b7d1a:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b7d1f:     	movss	0x238(%rbp), %xmm0
1454b7d27:     	movss	%xmm0, 0x20(%rsp)
1454b7d2d:     	movq	%rsi, %rcx
1454b7d30:     	movq	%r15, %rdx
1454b7d33:     	movaps	%xmm9, %xmm2
1454b7d37:     	callq	0x1454d0c20 <.text+0x54cfc20>
1454b7d3c:     	nopl	(%rax)
1454b7d40:     	cmpq	%r12, %rbx
1454b7d43:     	movq	0x368(%rbp), %r13
1454b7d4a:     	jae	0x1454b8dea <.text+0x54b7dea>
1454b7d50:     	movq	%rbx, %r15
1454b7d53:     	movq	0x848(%r13), %rdx
1454b7d5a:     	cmpq	%rdx, %rbx
1454b7d5d:     	jae	0x1454bc8c9 <.text+0x54bb8c9>
1454b7d63:     	movq	0x840(%r13), %rax
1454b7d6a:     	imulq	$0x68, %r15, %r13
1454b7d6e:     	movss	0x5c(%rax,%r13), %xmm0
1454b7d75:     	addq	%r13, %rax
1454b7d78:     	ucomiss	%xmm0, %xmm11
1454b7d7c:     	jae	0x1454b7f80 <.text+0x54b6f80>
1454b7d82:     	movaps	%xmm8, %xmm1
1454b7d86:     	subss	0x58(%rax), %xmm1
1454b7d8b:     	divss	%xmm0, %xmm1
1454b7d8f:     	xorps	%xmm0, %xmm0
1454b7d92:     	maxss	%xmm1, %xmm0
1454b7d96:     	movaps	%xmm12, %xmm1
1454b7d9a:     	minss	%xmm0, %xmm1
1454b7d9e:     	movsd	0x40(%rax), %xmm0
1454b7da3:     	movsd	0x4c(%rax), %xmm2
1454b7da8:     	subps	%xmm0, %xmm2
1454b7dab:     	movsldup	%xmm1, %xmm15           # xmm15 = xmm1[0,0,2,2]
1454b7db0:     	mulps	%xmm2, %xmm15
1454b7db4:     	addps	%xmm0, %xmm15
1454b7db8:     	leaq	0x1(%r15), %rbx
1454b7dbc:     	movl	0x18(%rax), %ecx
1454b7dbf:     	testl	%ecx, %ecx
1454b7dc1:     	je	0x1454b7f95 <.text+0x54b6f95>
1454b7dc7:     	cmpl	$0x1, %ecx
1454b7dca:     	jne	0x1454b8030 <.text+0x54b7030>
1454b7dd0:     	movq	%rbx, 0x358(%rbp)
1454b7dd7:     	movq	0x368(%rbp), %rcx
1454b7dde:     	movq	0x548(%rcx), %rcx
1454b7de5:     	testq	%rcx, %rcx
1454b7de8:     	je	0x1454b8090 <.text+0x54b7090>
1454b7dee:     	movq	0x20(%rax), %r12
1454b7df2:     	movq	0x368(%rbp), %rdx
1454b7df9:     	movq	0x540(%rdx), %rdi
1454b7e00:     	shlq	$0x3, %rcx
1454b7e04:     	leaq	(%rcx,%rcx,8), %rdx
1454b7e08:     	leaq	(%rdi,%rdx), %rbx
1454b7e0c:     	xorl	%ecx, %ecx
1454b7e0e:     	jmp	0x1454b7e1d <.text+0x54b6e1d>
1454b7e10:     	addq	$0x48, %rcx
1454b7e14:     	cmpq	%rcx, %rdx
1454b7e17:     	je	0x1454b8090 <.text+0x54b7090>
1454b7e1d:     	cmpq	%r12, 0x28(%rdi,%rcx)
1454b7e22:     	jne	0x1454b7e10 <.text+0x54b6e10>
1454b7e24:     	cmpl	$0x1, 0x18(%rdi,%rcx)
1454b7e29:     	je	0x1454b7e10 <.text+0x54b6e10>
1454b7e2b:     	movq	0x34(%rdi,%rcx), %rdx
1454b7e30:     	movq	%rdx, 0x2f0(%rbp)
1454b7e37:     	movl	0x3c(%rdi,%rcx), %ecx
1454b7e3b:     	movl	%ecx, 0x2f8(%rbp)
1454b7e41:     	movsd	0x2f0(%rbp), %xmm0
1454b7e49:     	subps	%xmm0, %xmm15
1454b7e4d:     	mulps	%xmm15, %xmm15
1454b7e51:     	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454b7e56:     	addss	%xmm15, %xmm0
1454b7e5b:     	sqrtss	%xmm0, %xmm0
1454b7e5f:     	ucomiss	0x490096(%rip), %xmm0   # 0x145947efc
1454b7e66:     	jbe	0x1454b7e7c <.text+0x54b6e7c>
1454b7e68:     	movss	0x58(%rax), %xmm0
1454b7e6d:     	addss	0x5c(%rax), %xmm0
1454b7e72:     	ucomiss	%xmm0, %xmm8
1454b7e76:     	jb	0x1454b809d <.text+0x54b709d>
1454b7e7c:     	movq	%r12, 0x220(%rbp)
1454b7e83:     	movzbl	0x30(%rax), %esi
1454b7e87:     	callq	0x140002200 <.text+0x1200>
1454b7e8c:     	movl	$0x8, %ecx
1454b7e91:     	movl	$0x8, %edx
1454b7e96:     	callq	0x1400021c0 <.text+0x11c0>
1454b7e9b:     	testq	%rax, %rax
1454b7e9e:     	je	0x1454bc78b <.text+0x54bb78b>
1454b7ea4:     	movq	%r12, (%rax)
1454b7ea7:     	movq	$0x1, 0x2b8(%rbp)
1454b7eb2:     	movq	%rax, 0x2c0(%rbp)
1454b7eb9:     	movq	$0x1, 0x2c8(%rbp)
1454b7ec4:     	movl	$0x1, %r12d
1454b7eca:     	cmpb	$0x2, %sil
1454b7ece:     	jne	0x1454b880a <.text+0x54b780a>
1454b7ed4:     	movq	%rax, %rsi
1454b7ed7:     	movq	%rdi, 0xb0(%rbp)
1454b7ede:     	movq	%rbx, 0xb8(%rbp)
1454b7ee5:     	leaq	0x220(%rbp), %rax
1454b7eec:     	movq	%rax, 0xc0(%rbp)
1454b7ef3:     	leaq	0x2f0(%rbp), %rax
1454b7efa:     	movq	%rax, 0xc8(%rbp)
1454b7f01:     	movq	$0x2, 0xd0(%rbp)
1454b7f0c:     	movb	$0x1, 0x324(%rbp)
1454b7f13:     	leaq	0x240(%rbp), %rcx
1454b7f1a:     	leaq	0xb0(%rbp), %rdx
1454b7f21:     	callq	0x14553fb80 <.text+0x553eb80>
1454b7f26:     	nop
1454b7f27:     	movq	0x240(%rbp), %rdx
1454b7f2e:     	movq	0x248(%rbp), %rcx
1454b7f35:     	movq	0x250(%rbp), %rdi
1454b7f3c:     	testq	%rdi, %rdi
1454b7f3f:     	jne	0x1454b8d6a <.text+0x54b7d6a>
1454b7f45:     	addq	%rdi, %r12
1454b7f48:     	movq	%r12, 0x2c8(%rbp)
1454b7f4f:     	testq	%rdx, %rdx
1454b7f52:     	je	0x1454b7f63 <.text+0x54b6f63>
1454b7f54:     	shlq	$0x3, %rdx
1454b7f58:     	movl	$0x8, %r8d
1454b7f5e:     	callq	0x1400021d0 <.text+0x11d0>
1454b7f63:     	movq	0x2b8(%rbp), %rax
1454b7f6a:     	movq	%rax, 0x338(%rbp)
1454b7f71:     	movq	%rsi, %rax
1454b7f74:     	jmp	0x1454b8816 <.text+0x54b7816>
1454b7f79:     	nopl	(%rax)
1454b7f80:     	movsd	0x4c(%rax), %xmm15
1454b7f86:     	leaq	0x1(%r15), %rbx
1454b7f8a:     	movl	0x18(%rax), %ecx
1454b7f8d:     	testl	%ecx, %ecx
1454b7f8f:     	jne	0x1454b7dc7 <.text+0x54b6dc7>
1454b7f95:     	movss	0x60(%rax), %xmm0
1454b7f9a:     	ucomiss	%xmm8, %xmm0
1454b7f9e:     	ja	0x1454b7d40 <.text+0x54b6d40>
1454b7fa4:     	movss	0x1c(%rax), %xmm0
1454b7fa9:     	movss	%xmm14, 0x60(%rax)
1454b7faf:     	ucomiss	%xmm0, %xmm8
1454b7fb3:     	jb	0x1454b874e <.text+0x54b774e>
1454b7fb9:     	movq	0x368(%rbp), %rsi
1454b7fc0:     	movq	0x848(%rsi), %rdx
1454b7fc7:     	cmpq	%rdx, %r15
1454b7fca:     	jae	0x1454bcae0 <.text+0x54bbae0>
1454b7fd0:     	movq	0x840(%rsi), %rax
1454b7fd7:     	leaq	(%rax,%r13), %rcx
1454b7fdb:     	movss	0x5c(%rax,%r13), %xmm0
1454b7fe2:     	ucomiss	%xmm0, %xmm11
1454b7fe6:     	jae	0x1454b84f4 <.text+0x54b74f4>
1454b7fec:     	movss	0x934(%rsi), %xmm1
1454b7ff4:     	subss	0x58(%rcx), %xmm1
1454b7ff9:     	divss	%xmm0, %xmm1
1454b7ffd:     	xorps	%xmm0, %xmm0
1454b8000:     	maxss	%xmm1, %xmm0
1454b8004:     	movaps	%xmm12, %xmm1
1454b8008:     	minss	%xmm0, %xmm1
1454b800c:     	movsd	0x40(%rcx), %xmm0
1454b8011:     	movsd	0x4c(%rcx), %xmm2
1454b8016:     	subps	%xmm0, %xmm2
1454b8019:     	movsldup	%xmm1, %xmm9            # xmm9 = xmm1[0,0,2,2]
1454b801e:     	mulps	%xmm2, %xmm9
1454b8022:     	addps	%xmm0, %xmm9
1454b8026:     	jmp	0x1454b84fa <.text+0x54b74fa>
1454b802b:     	nopl	(%rax,%rax)
1454b8030:     	subps	%xmm7, %xmm15
1454b8034:     	mulps	%xmm15, %xmm15
1454b8038:     	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454b803d:     	addss	%xmm15, %xmm0
1454b8042:     	sqrtss	%xmm0, %xmm0
1454b8046:     	movss	0x488422(%rip), %xmm1   # 0x145940470
1454b804e:     	ucomiss	%xmm0, %xmm1
1454b8051:     	jae	0x1454b80b0 <.text+0x54b70b0>
1454b8053:     	ucomiss	0x60(%rax), %xmm8
1454b8058:     	jb	0x1454b7d40 <.text+0x54b6d40>
1454b805e:     	movss	%xmm14, 0x60(%rax)
1454b8064:     	movss	0x298(%rbp), %xmm0
1454b806c:     	movss	%xmm0, 0x20(%rsp)
1454b8072:     	movq	0x368(%rbp), %rcx
1454b8079:     	movq	%r15, %rdx
1454b807c:     	movaps	%xmm7, %xmm2
1454b807f:     	movaps	0x80(%rbp), %xmm3
1454b8086:     	callq	0x1454d0c20 <.text+0x54cfc20>
1454b808b:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b8090:     	movl	$0x0, 0x18(%rax)
1454b8097:     	movss	%xmm8, 0x1c(%rax)
1454b809d:     	movq	0x348(%rbp), %r12
1454b80a4:     	movq	0x358(%rbp), %rbx
1454b80ab:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b80b0:     	movzbl	0x30(%rax), %edi
1454b80b4:     	movq	(%rax), %rcx
1454b80b7:     	movq	%rcx, 0x338(%rbp)
1454b80be:     	movq	0x8(%rax), %rcx
1454b80c2:     	movq	%rcx, 0x358(%rbp)
1454b80c9:     	movq	0x10(%rax), %rcx
1454b80cd:     	movq	$0x0, (%rax)
1454b80d4:     	movq	$0x4, 0x8(%rax)
1454b80dc:     	movq	$0x0, 0x10(%rax)
1454b80e4:     	testq	%rcx, %rcx
1454b80e7:     	je	0x1454b8464 <.text+0x54b7464>
1454b80ed:     	movq	0x358(%rbp), %r12
1454b80f4:     	leaq	(%r12,%rcx,8), %rbx
1454b80f8:     	movq	%r13, 0x310(%rbp)
1454b80ff:     	jmp	0x1454b812a <.text+0x54b712a>
1454b8101:     	nopw	%cs:(%rax,%rax)
1454b8110:     	movq	0x368(%rbp), %rcx
1454b8117:     	callq	0x1454e5b40 <.text+0x54e4b40>
1454b811c:     	nop
1454b811d:     	addq	$0x8, %r12
1454b8121:     	cmpq	%rbx, %r12
1454b8124:     	je	0x1454b8464 <.text+0x54b7464>
1454b812a:     	movl	(%r12), %edx
1454b812e:     	leal	-0x3(%rdx), %eax
1454b8131:     	cmpl	$0x3, %eax
1454b8134:     	jb	0x1454b8110 <.text+0x54b7110>
1454b8136:     	movl	0x4(%r12), %eax
1454b813b:     	testl	%edx, %edx
1454b813d:     	je	0x1454b8294 <.text+0x54b7294>
1454b8143:     	cmpl	$0x1, %edx
1454b8146:     	jne	0x1454b811d <.text+0x54b711d>
1454b8148:     	movl	%eax, %eax
1454b814a:     	xorps	%xmm9, %xmm9
1454b814e:     	cvtsi2ss	%rax, %xmm9
1454b8153:     	cmpb	$0x1, %dil
1454b8157:     	jne	0x1454b82e2 <.text+0x54b72e2>
1454b815d:     	mulss	0x58f41a(%rip), %xmm9   # 0x145a47580
1454b8166:     	movq	0x368(%rbp), %rsi
1454b816d:     	addss	0x9a4(%rsi), %xmm9
1454b8176:     	movaps	%xmm9, %xmm0
1454b817a:     	callq	0x145773265 <.text+0x5772265>
1454b817f:     	subss	%xmm0, %xmm9
1454b8184:     	movss	%xmm9, 0x9a4(%rsi)
1454b818d:     	ucomiss	%xmm11, %xmm0
1454b8191:     	jbe	0x1454b811d <.text+0x54b711d>
1454b8193:     	movl	%edi, %r13d
1454b8196:     	cvttss2si	%xmm0, %rax
1454b819b:     	movl	$0x0, %edi
1454b81a0:     	cmovbl	%edi, %eax
1454b81a3:     	ucomiss	%xmm13, %xmm0
1454b81a7:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454b81ad:     	cmoval	%r14d, %eax
1454b81b1:     	xorps	%xmm0, %xmm0
1454b81b4:     	cvtsi2ss	%rax, %xmm0
1454b81b9:     	movq	0x368(%rbp), %rsi
1454b81c0:     	mulss	0x4a0(%rsi), %xmm0
1454b81c8:     	callq	0x14577322f <.text+0x577222f>
1454b81cd:     	cvttss2si	%xmm0, %rax
1454b81d2:     	ucomiss	%xmm11, %xmm0
1454b81d6:     	cmovbl	%edi, %eax
1454b81d9:     	ucomiss	%xmm13, %xmm0
1454b81dd:     	cmoval	%r14d, %eax
1454b81e1:     	movl	0x420(%rsi), %ecx
1454b81e7:     	addl	%eax, %ecx
1454b81e9:     	movl	%ecx, 0x420(%rsi)
1454b81ef:     	addl	%eax, 0x684(%rsi)
1454b81f5:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454b81fc:     	movq	0x8d8(%rsi), %rax
1454b8203:     	testq	%rax, %rax
1454b8206:     	je	0x1454b8407 <.text+0x54b7407>
1454b820c:     	movq	0x8e0(%rsi), %rcx
1454b8213:     	movl	$0x498, %r14d           # imm = 0x498
1454b8219:     	movl	%r13d, %edi
1454b821c:     	movq	0x310(%rbp), %r13
1454b8223:     	movzwl	0x36(%rax), %r9d
1454b8228:     	movl	%r9d, %r10d
1454b822b:     	addl	%r10d, %r10d
1454b822e:     	movq	$-0x1, %rdx
1454b8235:     	nopw	%cs:(%rax,%rax)
1454b8240:     	testq	%r10, %r10
1454b8243:     	je	0x1454b8280 <.text+0x54b7280>
1454b8245:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454b824b:     	cmpl	%r11d, %r14d
1454b824e:     	seta	%r11b
1454b8252:     	sbbb	$0x0, %r11b
1454b8256:     	incq	%rdx
1454b8259:     	addq	$-0x2, %r10
1454b825d:     	cmpb	$0x1, %r11b
1454b8261:     	je	0x1454b8240 <.text+0x54b7240>
1454b8263:     	movzbl	%r11b, %r9d
1454b8267:     	testl	%r9d, %r9d
1454b826a:     	jne	0x1454b8283 <.text+0x54b7283>
1454b826c:     	jmp	0x1454b83b0 <.text+0x54b73b0>
1454b8271:     	nopw	%cs:(%rax,%rax)
1454b8280:     	movq	%r9, %rdx
1454b8283:     	subq	$0x1, %rcx
1454b8287:     	jb	0x1454b8419 <.text+0x54b7419>
1454b828d:     	movq	0x50(%rax,%rdx,8), %rax
1454b8292:     	jmp	0x1454b8223 <.text+0x54b7223>
1454b8294:     	movl	%eax, %eax
1454b8296:     	xorps	%xmm0, %xmm0
1454b8299:     	cvtsi2ss	%rax, %xmm0
1454b829e:     	movq	0x368(%rbp), %rsi
1454b82a5:     	mulss	0x48c(%rsi), %xmm0
1454b82ad:     	callq	0x14577322f <.text+0x577222f>
1454b82b2:     	maxss	%xmm12, %xmm0
1454b82b7:     	cvttss2si	%xmm0, %rdx
1454b82bc:     	ucomiss	%xmm11, %xmm0
1454b82c0:     	movl	$0x0, %eax
1454b82c5:     	cmovbl	%eax, %edx
1454b82c8:     	ucomiss	%xmm13, %xmm0
1454b82cc:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b82d1:     	cmoval	%eax, %edx
1454b82d4:     	movq	%rsi, %rcx
1454b82d7:     	callq	0x1454c69e0 <.text+0x54c59e0>
1454b82dc:     	nop
1454b82dd:     	jmp	0x1454b811d <.text+0x54b711d>
1454b82e2:     	movq	0x368(%rbp), %rsi
1454b82e9:     	mulss	0x4a0(%rsi), %xmm9
1454b82f2:     	movaps	%xmm9, %xmm0
1454b82f6:     	callq	0x14577322f <.text+0x577222f>
1454b82fb:     	cvttss2si	%xmm0, %rax
1454b8300:     	ucomiss	%xmm11, %xmm0
1454b8304:     	movl	$0x0, %ecx
1454b8309:     	cmovbl	%ecx, %eax
1454b830c:     	ucomiss	%xmm13, %xmm0
1454b8310:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b8315:     	cmoval	%ecx, %eax
1454b8318:     	movl	0x420(%rsi), %ecx
1454b831e:     	addl	%eax, %ecx
1454b8320:     	movl	%ecx, 0x420(%rsi)
1454b8326:     	addl	%eax, 0x684(%rsi)
1454b832c:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454b8333:     	movq	0x8d8(%rsi), %rax
1454b833a:     	testq	%rax, %rax
1454b833d:     	je	0x1454b83ba <.text+0x54b73ba>
1454b833f:     	movq	0x8e0(%rsi), %rcx
1454b8346:     	movzwl	0x36(%rax), %r9d
1454b834b:     	movl	%r9d, %r10d
1454b834e:     	addl	%r10d, %r10d
1454b8351:     	movq	$-0x1, %rdx
1454b8358:     	nopl	(%rax,%rax)
1454b8360:     	testq	%r10, %r10
1454b8363:     	je	0x1454b83a0 <.text+0x54b73a0>
1454b8365:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454b836b:     	cmpl	%r11d, %r14d
1454b836e:     	seta	%r11b
1454b8372:     	sbbb	$0x0, %r11b
1454b8376:     	incq	%rdx
1454b8379:     	addq	$-0x2, %r10
1454b837d:     	cmpb	$0x1, %r11b
1454b8381:     	je	0x1454b8360 <.text+0x54b7360>
1454b8383:     	movzbl	%r11b, %r9d
1454b8387:     	testl	%r9d, %r9d
1454b838a:     	je	0x1454b83b0 <.text+0x54b73b0>
1454b838c:     	subq	$0x1, %rcx
1454b8390:     	jae	0x1454b83a9 <.text+0x54b73a9>
1454b8392:     	jmp	0x1454b83bc <.text+0x54b73bc>
1454b8394:     	nopw	%cs:(%rax,%rax)
1454b83a0:     	movq	%r9, %rdx
1454b83a3:     	subq	$0x1, %rcx
1454b83a7:     	jb	0x1454b83bc <.text+0x54b73bc>
1454b83a9:     	movq	0x50(%rax,%rdx,8), %rax
1454b83ae:     	jmp	0x1454b8346 <.text+0x54b7346>
1454b83b0:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b83b5:     	jmp	0x1454b811d <.text+0x54b711d>
1454b83ba:     	xorl	%eax, %eax
1454b83bc:     	movq	0x318(%rbp), %rcx
1454b83c3:     	movq	%rcx, 0xb0(%rbp)
1454b83ca:     	movq	%rax, 0xb8(%rbp)
1454b83d1:     	movq	$0x0, 0xc0(%rbp)
1454b83dc:     	movq	%rdx, 0xc8(%rbp)
1454b83e3:     	movq	$0x498, 0xd0(%rbp)      # imm = 0x498
1454b83ee:     	leaq	0x240(%rbp), %rcx
1454b83f5:     	leaq	0xb0(%rbp), %rdx
1454b83fc:     	callq	0x14552a730 <.text+0x5529730>
1454b8401:     	nop
1454b8402:     	jmp	0x1454b811d <.text+0x54b711d>
1454b8407:     	xorl	%eax, %eax
1454b8409:     	movl	$0x498, %r14d           # imm = 0x498
1454b840f:     	movl	%r13d, %edi
1454b8412:     	movq	0x310(%rbp), %r13
1454b8419:     	movq	0x318(%rbp), %rcx
1454b8420:     	movq	%rcx, 0xb0(%rbp)
1454b8427:     	movq	%rax, 0xb8(%rbp)
1454b842e:     	movq	$0x0, 0xc0(%rbp)
1454b8439:     	movq	%rdx, 0xc8(%rbp)
1454b8440:     	movq	$0x498, 0xd0(%rbp)      # imm = 0x498
1454b844b:     	leaq	0x240(%rbp), %rcx
1454b8452:     	leaq	0xb0(%rbp), %rdx
1454b8459:     	callq	0x14552a730 <.text+0x5529730>
1454b845e:     	nop
1454b845f:     	jmp	0x1454b811d <.text+0x54b711d>
1454b8464:     	movq	0x338(%rbp), %rdx
1454b846b:     	testq	%rdx, %rdx
1454b846e:     	je	0x1454b8486 <.text+0x54b7486>
1454b8470:     	shlq	$0x3, %rdx
1454b8474:     	movl	$0x4, %r8d
1454b847a:     	movq	0x358(%rbp), %rcx
1454b8481:     	callq	0x1400021d0 <.text+0x11d0>
1454b8486:     	movq	0x368(%rbp), %rcx
1454b848d:     	movq	0x848(%rcx), %rdx
1454b8494:     	cmpq	%rdx, %r15
1454b8497:     	movq	0x348(%rbp), %r12
1454b849e:     	leaq	0x1(%r15), %rbx
1454b84a2:     	jae	0x1454bca8b <.text+0x54bba8b>
1454b84a8:     	movzbl	0x225(%rcx), %eax
1454b84af:     	movaps	0x153d88a(%rip), %xmm0  # 0x1469f5d40
1454b84b6:     	movaps	%xmm0, 0xb0(%rbp)
1454b84bd:     	cmpb	$0x3, %al
1454b84bf:     	movl	$0x3, %edx
1454b84c4:     	cmovael	%edx, %eax
1454b84c7:     	movzbl	%al, %eax
1454b84ca:     	movss	0xb0(%rbp,%rax,4), %xmm0
1454b84d3:     	addss	%xmm8, %xmm0
1454b84d8:     	movq	0x840(%rcx), %rax
1454b84df:     	movl	$0x0, 0x18(%rax,%r13)
1454b84e8:     	movss	%xmm0, 0x1c(%rax,%r13)
1454b84ef:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b84f4:     	movsd	0x4c(%rcx), %xmm9
1454b84fa:     	movsd	0x400(%rsi), %xmm10
1454b8503:     	movss	0x488(%rsi), %xmm14
1454b850c:     	movzbl	0x224(%rsi), %r8d
1454b8514:     	xorps	%xmm12, %xmm12
1454b8518:     	cvtsi2ss	%r8d, %xmm12
1454b851d:     	mulss	0x45d2da(%rip), %xmm12  # 0x145915800
1454b8526:     	addss	0x52c46d(%rip), %xmm12  # 0x1459e499c
1454b852f:     	movzbl	0x30(%rcx), %ecx
1454b8533:     	movb	%cl, 0x358(%rbp)
1454b8539:     	imulq	$0x68, %rdx, %r8
1454b853d:     	addq	%rax, %r8
1454b8540:     	leaq	0x240(%rbp), %rcx
1454b8547:     	movq	%rax, %rdx
1454b854a:     	callq	0x14553f990 <.text+0x553e990>
1454b854f:     	movq	0x548(%rsi), %rcx
1454b8556:     	movq	%rcx, 0x338(%rbp)
1454b855d:     	testq	%rcx, %rcx
1454b8560:     	je	0x1454b8716 <.text+0x54b7716>
1454b8566:     	addss	%xmm14, %xmm12
1454b856b:     	movq	0x368(%rbp), %rax
1454b8572:     	movq	0x540(%rax), %rsi
1454b8579:     	movq	0x338(%rbp), %rax
1454b8580:     	leaq	(%rax,%rax,8), %rax
1454b8584:     	leaq	(%rsi,%rax,8), %rdx
1454b8588:     	movq	0x248(%rbp), %rcx
1454b858f:     	movq	0x250(%rbp), %r9
1454b8596:     	movq	%r9, %r10
1454b8599:     	movabsq	$0xffffffffffffff8, %rax # imm = 0xFFFFFFFFFFFFFF8
1454b85a3:     	andq	%rax, %r10
1454b85a6:     	shll	$0x3, %r9d
1454b85aa:     	andl	$0x38, %r9d
1454b85ae:     	movq	%rsi, %r11
1454b85b1:     	jmp	0x1454b85c9 <.text+0x54b75c9>
1454b85b3:     	nopw	%cs:(%rax,%rax)
1454b85c0:     	cmpq	%rdx, %r11
1454b85c3:     	je	0x1454b8716 <.text+0x54b7716>
1454b85c9:     	movq	%r11, %rbx
1454b85cc:     	addq	$0x48, %r11
1454b85d0:     	cmpb	$0x0, 0x18(%rbx)
1454b85d4:     	jne	0x1454b85c0 <.text+0x54b75c0>
1454b85d6:     	movq	0x28(%rbx), %rdi
1454b85da:     	xorl	%eax, %eax
1454b85dc:     	nopl	(%rax)
1454b85e0:     	cmpq	%rax, %r10
1454b85e3:     	je	0x1454b8622 <.text+0x54b7622>
1454b85e5:     	cmpq	%rdi, (%rcx,%rax,8)
1454b85e9:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b85eb:     	cmpq	%rdi, 0x8(%rcx,%rax,8)
1454b85f0:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b85f2:     	cmpq	%rdi, 0x10(%rcx,%rax,8)
1454b85f7:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b85f9:     	cmpq	%rdi, 0x18(%rcx,%rax,8)
1454b85fe:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b8600:     	cmpq	%rdi, 0x20(%rcx,%rax,8)
1454b8605:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b8607:     	cmpq	%rdi, 0x28(%rcx,%rax,8)
1454b860c:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b860e:     	cmpq	%rdi, 0x30(%rcx,%rax,8)
1454b8613:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b8615:     	cmpq	%rdi, 0x38(%rcx,%rax,8)
1454b861a:     	leaq	0x8(%rax), %rax
1454b861e:     	jne	0x1454b85e0 <.text+0x54b75e0>
1454b8620:     	jmp	0x1454b85c0 <.text+0x54b75c0>
1454b8622:     	testq	%r9, %r9
1454b8625:     	je	0x1454b8633 <.text+0x54b7633>
1454b8627:     	cmpq	%rdi, (%rcx,%r10,8)
1454b862b:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b862d:     	cmpl	$0x8, %r9d
1454b8631:     	jne	0x1454b8697 <.text+0x54b7697>
1454b8633:     	movsd	0x34(%rbx), %xmm0
1454b8638:     	movaps	%xmm0, %xmm1
1454b863b:     	subps	%xmm10, %xmm1
1454b863f:     	mulps	%xmm1, %xmm1
1454b8642:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454b8646:     	addss	%xmm1, %xmm2
1454b864a:     	xorps	%xmm1, %xmm1
1454b864d:     	sqrtss	%xmm2, %xmm1
1454b8651:     	ucomiss	%xmm1, %xmm12
1454b8655:     	jb	0x1454b85c0 <.text+0x54b75c0>
1454b865b:     	ucomiss	%xmm14, %xmm1
1454b865f:     	jbe	0x1454b85c0 <.text+0x54b75c0>
1454b8665:     	movl	0x20(%rbx), %eax
1454b8668:     	testl	%eax, %eax
1454b866a:     	je	0x1454b897a <.text+0x54b797a>
1454b8670:     	cmpl	$0x1, %eax
1454b8673:     	je	0x1454b8987 <.text+0x54b7987>
1454b8679:     	cmpb	$0x3, 0x358(%rbp)
1454b8680:     	jne	0x1454b85c0 <.text+0x54b75c0>
1454b8686:     	addl	$-0x3, %eax
1454b8689:     	cmpl	$0x3, %eax
1454b868c:     	jae	0x1454b85c0 <.text+0x54b75c0>
1454b8692:     	jmp	0x1454b8983 <.text+0x54b7983>
1454b8697:     	cmpq	%rdi, 0x8(%rcx,%r10,8)
1454b869c:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b86a2:     	cmpl	$0x10, %r9d
1454b86a6:     	je	0x1454b8633 <.text+0x54b7633>
1454b86a8:     	cmpq	%rdi, 0x10(%rcx,%r10,8)
1454b86ad:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b86b3:     	cmpl	$0x18, %r9d
1454b86b7:     	je	0x1454b8633 <.text+0x54b7633>
1454b86bd:     	cmpq	%rdi, 0x18(%rcx,%r10,8)
1454b86c2:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b86c8:     	cmpl	$0x20, %r9d
1454b86cc:     	je	0x1454b8633 <.text+0x54b7633>
1454b86d2:     	cmpq	%rdi, 0x20(%rcx,%r10,8)
1454b86d7:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b86dd:     	cmpl	$0x28, %r9d
1454b86e1:     	je	0x1454b8633 <.text+0x54b7633>
1454b86e7:     	cmpq	%rdi, 0x28(%rcx,%r10,8)
1454b86ec:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b86f2:     	cmpl	$0x30, %r9d
1454b86f6:     	je	0x1454b8633 <.text+0x54b7633>
1454b86fc:     	cmpq	%rdi, 0x30(%rcx,%r10,8)
1454b8701:     	je	0x1454b85c0 <.text+0x54b75c0>
1454b8707:     	cmpl	$0x38, %r9d
1454b870b:     	je	0x1454b8633 <.text+0x54b7633>
1454b8711:     	jmp	0x1454b85c0 <.text+0x54b75c0>
1454b8716:     	movq	0x240(%rbp), %rdx
1454b871d:     	testq	%rdx, %rdx
1454b8720:     	je	0x1454b8738 <.text+0x54b7738>
1454b8722:     	movq	0x248(%rbp), %rcx
1454b8729:     	shlq	$0x3, %rdx
1454b872d:     	movl	$0x8, %r8d
1454b8733:     	callq	0x1400021d0 <.text+0x11d0>
1454b8738:     	movss	0x44ed4f(%rip), %xmm12  # 0x145907490
1454b8741:     	movss	0x328(%rbp), %xmm14
1454b874a:     	leaq	0x1(%r15), %rbx
1454b874e:     	movq	0x368(%rbp), %rsi
1454b8755:     	movq	0x848(%rsi), %rdx
1454b875c:     	cmpq	%rdx, %r15
1454b875f:     	jae	0x1454bca9c <.text+0x54bba9c>
1454b8765:     	movq	0x840(%rsi), %rax
1454b876c:     	movss	0x40c(%rsi), %xmm10
1454b8775:     	addss	0x64(%rax,%r13), %xmm10
1454b877c:     	movaps	%xmm10, %xmm0
1454b8780:     	callq	0x145773247 <.text+0x5772247>
1454b8785:     	movaps	%xmm0, %xmm9
1454b8789:     	movaps	%xmm10, %xmm0
1454b878d:     	callq	0x145773235 <.text+0x5772235>
1454b8792:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454b8796:     	mulps	0x153d5b2(%rip), %xmm9  # 0x1469f5d50
1454b879e:     	addps	%xmm7, %xmm9
1454b87a2:     	movaps	%xmm15, %xmm0
1454b87a6:     	subps	%xmm7, %xmm0
1454b87a9:     	mulps	%xmm0, %xmm0
1454b87ac:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b87b0:     	addss	%xmm0, %xmm1
1454b87b4:     	xorps	%xmm0, %xmm0
1454b87b7:     	sqrtss	%xmm1, %xmm0
1454b87bb:     	ucomiss	0x45d0e2(%rip), %xmm0   # 0x1459158a4
1454b87c2:     	ja	0x1454b7d1a <.text+0x54b6d1a>
1454b87c8:     	subps	%xmm9, %xmm15
1454b87cc:     	mulps	%xmm15, %xmm15
1454b87d0:     	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454b87d5:     	addss	%xmm15, %xmm0
1454b87da:     	sqrtss	%xmm0, %xmm0
1454b87de:     	ucomiss	0x778cff(%rip), %xmm0   # 0x145c314e4
1454b87e5:     	jbe	0x1454b7d40 <.text+0x54b6d40>
1454b87eb:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454b87f0:     	movss	0x298(%rbp), %xmm0
1454b87f8:     	movss	%xmm0, 0x20(%rsp)
1454b87fe:     	movq	0x368(%rbp), %rcx
1454b8805:     	jmp	0x1454b7d30 <.text+0x54b6d30>
1454b880a:     	movl	$0x1, %ecx
1454b880f:     	movq	%rcx, 0x338(%rbp)
1454b8816:     	leaq	(%rax,%r12,8), %rbx
1454b881a:     	movq	%rax, 0x2a0(%rbp)
1454b8821:     	movq	%rax, %r12
1454b8824:     	jmp	0x1454b8840 <.text+0x54b7840>
1454b8826:     	nopw	%cs:(%rax,%rax)
1454b8830:     	movq	0x8(%rdi), %rax
1454b8834:     	movlps	%xmm9, (%rax,%rsi,8)
1454b8839:     	incq	%rsi
1454b883c:     	movq	%rsi, 0x10(%rdi)
1454b8840:     	cmpq	%rbx, %r12
1454b8843:     	je	0x1454b8903 <.text+0x54b7903>
1454b8849:     	movq	%r12, %rax
1454b884c:     	addq	$0x8, %r12
1454b8850:     	movq	0x368(%rbp), %rcx
1454b8857:     	movq	0x548(%rcx), %rdx
1454b885e:     	testq	%rdx, %rdx
1454b8861:     	je	0x1454b8840 <.text+0x54b7840>
1454b8863:     	movq	(%rax), %rcx
1454b8866:     	movq	0x368(%rbp), %rax
1454b886d:     	movq	0x540(%rax), %rax
1454b8874:     	shlq	$0x3, %rdx
1454b8878:     	leaq	(%rdx,%rdx,8), %r8
1454b887c:     	xorl	%r9d, %r9d
1454b887f:     	xorl	%edx, %edx
1454b8881:     	nopw	%cs:(%rax,%rax)
1454b8890:     	cmpq	%rcx, 0x28(%rax,%r9)
1454b8895:     	je	0x1454b88b0 <.text+0x54b78b0>
1454b8897:     	incq	%rdx
1454b889a:     	addq	$0x48, %r9
1454b889e:     	cmpq	%r9, %r8
1454b88a1:     	jne	0x1454b8890 <.text+0x54b7890>
1454b88a3:     	jmp	0x1454b8840 <.text+0x54b7840>
1454b88a5:     	nopw	%cs:(%rax,%rax)
1454b88b0:     	movsd	0x20(%rax,%r9), %xmm9
1454b88b7:     	movq	0x368(%rbp), %rcx
1454b88be:     	callq	0x1454e3210 <.text+0x54e2210>
1454b88c3:     	nop
1454b88c4:     	movq	0x368(%rbp), %rax
1454b88cb:     	movq	0x848(%rax), %rdx
1454b88d2:     	cmpq	%rdx, %r15
1454b88d5:     	jae	0x1454bc94b <.text+0x54bb94b>
1454b88db:     	movq	0x840(%rax), %rax
1454b88e2:     	leaq	(%rax,%r13), %rdi
1454b88e6:     	movq	0x10(%rax,%r13), %rsi
1454b88eb:     	cmpq	(%rax,%r13), %rsi
1454b88ef:     	jne	0x1454b8830 <.text+0x54b7830>
1454b88f5:     	movq	%rdi, %rcx
1454b88f8:     	callq	0x145780180 <.text+0x577f180>
1454b88fd:     	nop
1454b88fe:     	jmp	0x1454b8830 <.text+0x54b7830>
1454b8903:     	movq	0x338(%rbp), %rdx
1454b890a:     	testq	%rdx, %rdx
1454b890d:     	je	0x1454b8925 <.text+0x54b7925>
1454b890f:     	shlq	$0x3, %rdx
1454b8913:     	movl	$0x8, %r8d
1454b8919:     	movq	0x2a0(%rbp), %rcx
1454b8920:     	callq	0x1400021d0 <.text+0x11d0>
1454b8925:     	movq	0x368(%rbp), %rcx
1454b892c:     	movq	0x848(%rcx), %rdx
1454b8933:     	cmpq	%rdx, %r15
1454b8936:     	movq	0x348(%rbp), %r12
1454b893d:     	leaq	0x1(%r15), %rbx
1454b8941:     	jae	0x1454bcbc2 <.text+0x54bbbc2>
1454b8947:     	movq	0x840(%rcx), %rax
1454b894e:     	movl	$0x2, 0x18(%rax,%r13)
1454b8957:     	movq	0x848(%rcx), %rdx
1454b895e:     	cmpq	%rdx, %r15
1454b8961:     	jae	0x1454bcbd3 <.text+0x54bbbd3>
1454b8967:     	movq	0x840(%rcx), %rax
1454b896e:     	movss	%xmm8, 0x60(%rax,%r13)
1454b8975:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b897a:     	cmpb	$0x2, 0x358(%rbp)
1454b8981:     	jne	0x1454b8990 <.text+0x54b7990>
1454b8983:     	xorl	%eax, %eax
1454b8985:     	jmp	0x1454b8992 <.text+0x54b7992>
1454b8987:     	cmpb	$0x1, 0x358(%rbp)
1454b898e:     	je	0x1454b8983 <.text+0x54b7983>
1454b8990:     	movb	$0x1, %al
1454b8992:     	cmpq	%rdx, %r11
1454b8995:     	je	0x1454b8c91 <.text+0x54b7c91>
1454b899b:     	movl	%eax, 0x48(%rbp)
1454b899e:     	subps	%xmm9, %xmm0
1454b89a2:     	mulps	%xmm0, %xmm0
1454b89a5:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b89a9:     	addss	%xmm0, %xmm1
1454b89ad:     	xorps	%xmm0, %xmm0
1454b89b0:     	sqrtss	%xmm1, %xmm0
1454b89b4:     	movss	%xmm0, 0x2a0(%rbp)
1454b89bc:     	subq	%r11, %rdx
1454b89bf:     	shrq	$0x3, %rdx
1454b89c3:     	movabsq	$-0x71c71c71c71c71c7, %rax # imm = 0x8E38E38E38E38E39
1454b89cd:     	imulq	%rax, %rdx
1454b89d1:     	xorl	%r12d, %r12d
1454b89d4:     	movq	%rsi, 0x30(%rbp)
1454b89d8:     	nopl	(%rax,%rax)
1454b89e0:     	leaq	(%r12,%r12,8), %rax
1454b89e4:     	cmpb	$0x0, 0x18(%r11,%rax,8)
1454b89ea:     	je	0x1454b8a30 <.text+0x54b7a30>
1454b89ec:     	movzbl	0x2f2(%rbp), %eax
1454b89f3:     	movb	%al, 0x2ba(%rbp)
1454b89f9:     	movzwl	0x2f0(%rbp), %eax
1454b8a00:     	movw	%ax, 0x2b8(%rbp)
1454b8a07:     	movzbl	0x2ba(%rbp), %eax
1454b8a0e:     	movb	%al, 0x2f2(%rbp)
1454b8a14:     	movzwl	0x2b8(%rbp), %eax
1454b8a1b:     	movw	%ax, 0x2f0(%rbp)
1454b8a22:     	incq	%r12
1454b8a25:     	cmpq	%rdx, %r12
1454b8a28:     	jne	0x1454b89e0 <.text+0x54b79e0>
1454b8a2a:     	jmp	0x1454b8c91 <.text+0x54b7c91>
1454b8a2f:     	nop
1454b8a30:     	leaq	(%r11,%rax,8), %rax
1454b8a34:     	movq	0x28(%rax), %rbx
1454b8a38:     	xorl	%r8d, %r8d
1454b8a3b:     	nopl	(%rax,%rax)
1454b8a40:     	cmpq	%r8, %r10
1454b8a43:     	je	0x1454b8a8d <.text+0x54b7a8d>
1454b8a45:     	cmpq	%rbx, (%rcx,%r8,8)
1454b8a49:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a4b:     	cmpq	%rbx, 0x8(%rcx,%r8,8)
1454b8a50:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a52:     	cmpq	%rbx, 0x10(%rcx,%r8,8)
1454b8a57:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a59:     	cmpq	%rbx, 0x18(%rcx,%r8,8)
1454b8a5e:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a60:     	cmpq	%rbx, 0x20(%rcx,%r8,8)
1454b8a65:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a67:     	cmpq	%rbx, 0x28(%rcx,%r8,8)
1454b8a6c:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a72:     	cmpq	%rbx, 0x30(%rcx,%r8,8)
1454b8a77:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a7d:     	cmpq	%rbx, 0x38(%rcx,%r8,8)
1454b8a82:     	leaq	0x8(%r8), %r8
1454b8a86:     	jne	0x1454b8a40 <.text+0x54b7a40>
1454b8a88:     	jmp	0x1454b89ec <.text+0x54b79ec>
1454b8a8d:     	testq	%r9, %r9
1454b8a90:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8a92:     	cmpq	%rbx, (%rcx,%r10,8)
1454b8a96:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8a9c:     	cmpl	$0x8, %r9d
1454b8aa0:     	jne	0x1454b8afa <.text+0x54b7afa>
1454b8aa2:     	movsd	0x34(%rax), %xmm0
1454b8aa7:     	movaps	%xmm0, %xmm1
1454b8aaa:     	subps	%xmm10, %xmm1
1454b8aae:     	mulps	%xmm1, %xmm1
1454b8ab1:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454b8ab5:     	addss	%xmm1, %xmm2
1454b8ab9:     	xorps	%xmm1, %xmm1
1454b8abc:     	sqrtss	%xmm2, %xmm1
1454b8ac0:     	ucomiss	%xmm1, %xmm12
1454b8ac4:     	jb	0x1454b89ec <.text+0x54b79ec>
1454b8aca:     	ucomiss	%xmm14, %xmm1
1454b8ace:     	jbe	0x1454b89ec <.text+0x54b79ec>
1454b8ad4:     	movl	0x20(%rax), %eax
1454b8ad7:     	testl	%eax, %eax
1454b8ad9:     	je	0x1454b8b75 <.text+0x54b7b75>
1454b8adf:     	cmpl	$0x1, %eax
1454b8ae2:     	jne	0x1454b8b85 <.text+0x54b7b85>
1454b8ae8:     	cmpb	$0x1, 0x358(%rbp)
1454b8aef:     	jne	0x1454b8b7e <.text+0x54b7b7e>
1454b8af5:     	jmp	0x1454b8b9e <.text+0x54b7b9e>
1454b8afa:     	cmpq	%rbx, 0x8(%rcx,%r10,8)
1454b8aff:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b05:     	cmpl	$0x10, %r9d
1454b8b09:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b0b:     	cmpq	%rbx, 0x10(%rcx,%r10,8)
1454b8b10:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b16:     	cmpl	$0x18, %r9d
1454b8b1a:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b1c:     	cmpq	%rbx, 0x18(%rcx,%r10,8)
1454b8b21:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b27:     	cmpl	$0x20, %r9d
1454b8b2b:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b31:     	cmpq	%rbx, 0x20(%rcx,%r10,8)
1454b8b36:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b3c:     	cmpl	$0x28, %r9d
1454b8b40:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b46:     	cmpq	%rbx, 0x28(%rcx,%r10,8)
1454b8b4b:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b51:     	cmpl	$0x30, %r9d
1454b8b55:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b5b:     	cmpq	%rbx, 0x30(%rcx,%r10,8)
1454b8b60:     	je	0x1454b89ec <.text+0x54b79ec>
1454b8b66:     	cmpl	$0x38, %r9d
1454b8b6a:     	je	0x1454b8aa2 <.text+0x54b7aa2>
1454b8b70:     	jmp	0x1454b89ec <.text+0x54b79ec>
1454b8b75:     	cmpb	$0x2, 0x358(%rbp)
1454b8b7c:     	je	0x1454b8b9e <.text+0x54b7b9e>
1454b8b7e:     	movb	$0x1, %al
1454b8b80:     	movl	%eax, 0x58(%rbp)
1454b8b83:     	jmp	0x1454b8ba5 <.text+0x54b7ba5>
1454b8b85:     	cmpb	$0x3, 0x358(%rbp)
1454b8b8c:     	jne	0x1454b89ec <.text+0x54b79ec>
1454b8b92:     	addl	$-0x3, %eax
1454b8b95:     	cmpl	$0x3, %eax
1454b8b98:     	jae	0x1454b89ec <.text+0x54b79ec>
1454b8b9e:     	movl	$0x0, 0x58(%rbp)
1454b8ba5:     	leaq	0xb5(%rbp), %rax
1454b8bac:     	movl	0x2a0(%rbp), %r8d
1454b8bb3:     	movl	%r8d, 0x2a0(%rbp)
1454b8bba:     	subps	%xmm9, %xmm0
1454b8bbe:     	mulps	%xmm0, %xmm0
1454b8bc1:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454b8bc5:     	addss	%xmm0, %xmm1
1454b8bc9:     	xorps	%xmm0, %xmm0
1454b8bcc:     	sqrtss	%xmm1, %xmm0
1454b8bd0:     	movl	%r8d, 0xb0(%rbp)
1454b8bd7:     	movl	0x48(%rbp), %esi
1454b8bda:     	movb	%sil, 0xb4(%rbp)
1454b8be1:     	movzbl	0x2f2(%rbp), %r8d
1454b8be9:     	movb	%r8b, 0x2(%rax)
1454b8bed:     	movzwl	0x2f0(%rbp), %r8d
1454b8bf5:     	movw	%r8w, (%rax)
1454b8bf9:     	movl	%esi, 0x48(%rbp)
1454b8bfc:     	movd	%xmm0, %eax
1454b8c00:     	movl	0x58(%rbp), %r8d
1454b8c04:     	subb	%r8b, %sil
1454b8c07:     	jne	0x1454b8c3a <.text+0x54b7c3a>
1454b8c09:     	movl	0x2a0(%rbp), %r8d
1454b8c10:     	movl	%r8d, %esi
1454b8c13:     	sarl	$0x1f, %esi
1454b8c16:     	shrl	%esi
1454b8c18:     	xorl	%r8d, %esi
1454b8c1b:     	movl	%eax, %r8d
1454b8c1e:     	sarl	$0x1f, %r8d
1454b8c22:     	shrl	%r8d
1454b8c25:     	xorl	%eax, %r8d
1454b8c28:     	cmpl	%r8d, %esi
1454b8c2b:     	setl	%r8b
1454b8c2f:     	setg	%sil
1454b8c33:     	subb	%r8b, %sil
1454b8c36:     	movl	0x58(%rbp), %r8d
1454b8c3a:     	testb	%sil, %sil
1454b8c3d:     	movl	0x2a0(%rbp), %esi
1454b8c43:     	cmovgl	%eax, %esi
1454b8c46:     	movl	%esi, 0x2a0(%rbp)
1454b8c4c:     	movzbl	0x48(%rbp), %eax
1454b8c50:     	movzbl	%r8b, %r8d
1454b8c54:     	cmovlel	%eax, %r8d
1454b8c58:     	movl	%r8d, 0x48(%rbp)
1454b8c5c:     	leaq	0xc5(%rbp), %rax
1454b8c63:     	leaq	0xb5(%rbp), %r8
1454b8c6a:     	cmovleq	%r8, %rax
1454b8c6e:     	movzbl	0x2(%rax), %r8d
1454b8c73:     	movb	%r8b, 0x2ba(%rbp)
1454b8c7a:     	movzwl	(%rax), %eax
1454b8c7d:     	movw	%ax, 0x2b8(%rbp)
1454b8c84:     	cmovgq	%rbx, %rdi
1454b8c88:     	movq	0x30(%rbp), %rsi
1454b8c8c:     	jmp	0x1454b8a07 <.text+0x54b7a07>
1454b8c91:     	movq	0x240(%rbp), %rdx
1454b8c98:     	testq	%rdx, %rdx
1454b8c9b:     	je	0x1454b8cc8 <.text+0x54b7cc8>
1454b8c9d:     	shlq	$0x3, %rdx
1454b8ca1:     	movl	$0x8, %r8d
1454b8ca7:     	callq	0x1400021d0 <.text+0x11d0>
1454b8cac:     	movq	0x368(%rbp), %rax
1454b8cb3:     	movq	0x540(%rax), %rsi
1454b8cba:     	movq	0x548(%rax), %rax
1454b8cc1:     	movq	%rax, 0x338(%rbp)
1454b8cc8:     	movq	0x338(%rbp), %rax
1454b8ccf:     	shlq	$0x3, %rax
1454b8cd3:     	leaq	(%rax,%rax,8), %rcx
1454b8cd7:     	xorl	%eax, %eax
1454b8cd9:     	movq	%rsi, %rdx
1454b8cdc:     	movq	0x348(%rbp), %r12
1454b8ce3:     	movss	0x44e7a4(%rip), %xmm12  # 0x145907490
1454b8cec:     	movss	0x328(%rbp), %xmm14
1454b8cf5:     	leaq	0x1(%r15), %rbx
1454b8cf9:     	nopl	(%rax)
1454b8d00:     	cmpq	%rax, %rcx
1454b8d03:     	je	0x1454b874e <.text+0x54b774e>
1454b8d09:     	addq	$0x48, %rax
1454b8d0d:     	cmpq	%rdi, 0x28(%rdx)
1454b8d11:     	leaq	0x48(%rdx), %rdx
1454b8d15:     	jne	0x1454b8d00 <.text+0x54b7d00>
1454b8d17:     	movq	0x368(%rbp), %rcx
1454b8d1e:     	movq	0x848(%rcx), %rdx
1454b8d25:     	cmpq	%rdx, %r15
1454b8d28:     	jae	0x1454bcd13 <.text+0x54bbd13>
1454b8d2e:     	movss	-0x14(%rsi,%rax), %xmm2
1454b8d34:     	movss	-0x10(%rsi,%rax), %xmm3
1454b8d3a:     	movq	0x840(%rcx), %rax
1454b8d41:     	movl	$0x1, 0x18(%rax,%r13)
1454b8d4a:     	movq	%rdi, 0x20(%rax,%r13)
1454b8d4f:     	movss	0x298(%rbp), %xmm0
1454b8d57:     	movss	%xmm0, 0x20(%rsp)
1454b8d5d:     	movq	%r15, %rdx
1454b8d60:     	callq	0x1454d0c20 <.text+0x54cfc20>
1454b8d65:     	jmp	0x1454b7d40 <.text+0x54b6d40>
1454b8d6a:     	movq	%rcx, 0x2a0(%rbp)
1454b8d71:     	movq	%rdx, 0x338(%rbp)
1454b8d78:     	movq	$0x8, 0x20(%rsp)
1454b8d81:     	movl	$0x1, %edx
1454b8d86:     	movl	$0x8, %r9d
1454b8d8c:     	leaq	0x2b8(%rbp), %rcx
1454b8d93:     	movq	%rdi, %r8
1454b8d96:     	callq	0x1457744b0 <.text+0x57734b0>
1454b8d9b:     	nop
1454b8d9c:     	leaq	(,%rdi,8), %r8
1454b8da4:     	movq	0x2c0(%rbp), %rax
1454b8dab:     	movq	0x2c8(%rbp), %r12
1454b8db2:     	movq	%rax, %rsi
1454b8db5:     	leaq	(%rax,%r12,8), %rcx
1454b8db9:     	movq	0x2a0(%rbp), %rbx
1454b8dc0:     	movq	%rbx, %rdx
1454b8dc3:     	callq	0x1457731ed <.text+0x57721ed>
1454b8dc8:     	movq	%rbx, %rcx
1454b8dcb:     	movq	0x338(%rbp), %rdx
1454b8dd2:     	addq	%rdi, %r12
1454b8dd5:     	movq	%r12, 0x2c8(%rbp)
1454b8ddc:     	testq	%rdx, %rdx
1454b8ddf:     	jne	0x1454b7f54 <.text+0x54b6f54>
1454b8de5:     	jmp	0x1454b7f63 <.text+0x54b6f63>
1454b8dea:     	cmpb	$0x0, 0x9b5(%r13)
1454b8df2:     	jne	0x1454bbee3 <.text+0x54baee3>
1454b8df8:     	movss	0x934(%r13), %xmm0
1454b8e01:     	divss	0x45ca9b(%rip), %xmm0   # 0x1459158a4
1454b8e09:     	movss	%xmm0, 0x68(%rbp)
1454b8e0e:     	movq	0x228(%r13), %rcx
1454b8e15:     	movq	0x230(%r13), %rdx
1454b8e1c:     	callq	0x145420480 <.text+0x541f480>
1454b8e21:     	imulq	$0xf0, %rax, %rax
1454b8e28:     	movq	%rax, 0x338(%rbp)
1454b8e2f:     	leaq	0x127a6e2(%rip), %r12   # 0x146733518
1454b8e36:     	movsd	0x400(%r13), %xmm8
1454b8e3f:     	movl	0x408(%r13), %edi
1454b8e46:     	xorps	%xmm0, %xmm0
1454b8e49:     	ucomiss	%xmm0, %xmm6
1454b8e4c:     	jbe	0x1454b8eb7 <.text+0x54b7eb7>
1454b8e4e:     	movsd	0x968(%r13), %xmm0
1454b8e57:     	movaps	%xmm8, %xmm7
1454b8e5b:     	subps	%xmm0, %xmm7
1454b8e5e:     	movsldup	%xmm6, %xmm0            # xmm0 = xmm6[0,0,2,2]
1454b8e62:     	divps	%xmm0, %xmm7
1454b8e65:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454b8e69:     	movaps	%xmm7, %xmm0
1454b8e6c:     	callq	0x145773277 <.text+0x5772277>
1454b8e71:     	movss	0x45a4d7(%rip), %xmm1   # 0x145913350
1454b8e79:     	ucomiss	%xmm0, %xmm1
1454b8e7c:     	jbe	0x1454b8eb7 <.text+0x54b7eb7>
1454b8e7e:     	movaps	0x45fbbb(%rip), %xmm0   # 0x145918a40
1454b8e85:     	xorps	%xmm6, %xmm0
1454b8e88:     	callq	0x145773259 <.text+0x5772259>
1454b8e8d:     	movss	0x44e5fb(%rip), %xmm1   # 0x145907490
1454b8e95:     	subss	%xmm0, %xmm1
1454b8e99:     	movsd	0x8c8(%r13), %xmm0
1454b8ea2:     	subps	%xmm0, %xmm7
1454b8ea5:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454b8ea9:     	mulps	%xmm7, %xmm1
1454b8eac:     	addps	%xmm0, %xmm1
1454b8eaf:     	movlps	%xmm1, 0x8c8(%r13)
1454b8eb7:     	addq	%r12, 0x338(%rbp)
1454b8ebe:     	movlps	%xmm8, 0x968(%r13)
1454b8ec6:     	movl	%edi, 0x970(%r13)
1454b8ecd:     	movss	0x934(%r13), %xmm0
1454b8ed6:     	movss	%xmm0, 0x220(%rbp)
1454b8ede:     	movq	0x2a8(%rbp), %rcx
1454b8ee5:     	movl	0x8(%rcx), %eax
1454b8ee8:     	movl	%eax, 0x2f8(%rbp)
1454b8eee:     	movq	(%rcx), %rax
1454b8ef1:     	movq	%rax, 0x2f0(%rbp)
1454b8ef8:     	movq	0x4e0(%r13), %rax
1454b8eff:     	imulq	$0x160, 0x4e8(%r13), %rcx # imm = 0x160
1454b8f0a:     	addq	%rax, %rcx
1454b8f0d:     	movq	%rax, 0xb0(%rbp)
1454b8f14:     	movq	%rcx, 0xb8(%rbp)
1454b8f1b:     	leaq	0x220(%rbp), %rax
1454b8f22:     	movq	%rax, 0xc0(%rbp)
1454b8f29:     	leaq	0x2f0(%rbp), %rax
1454b8f30:     	movq	%rax, 0xc8(%rbp)
1454b8f37:     	movq	$0x4, 0xd0(%rbp)
1454b8f42:     	leaq	0x240(%rbp), %rcx
1454b8f49:     	leaq	0xb0(%rbp), %rbx
1454b8f50:     	movq	%rbx, %rdx
1454b8f53:     	callq	0x145540c40 <.text+0x553fc40>
1454b8f58:     	movq	0x240(%rbp), %rax
1454b8f5f:     	movq	%rax, 0x358(%rbp)
1454b8f66:     	movq	0x248(%rbp), %r15
1454b8f6d:     	movq	0x250(%rbp), %rax
1454b8f74:     	leaq	(%r15,%rax,8), %rdi
1454b8f78:     	leaq	0x2b8(%rbp), %rsi
1454b8f7f:     	movss	0x486ce8(%rip), %xmm12  # 0x14593fc70
1454b8f88:     	movss	0x48ef07(%rip), %xmm8   # 0x145947e98
1454b8f91:     	movq	%r15, 0x348(%rbp)
1454b8f98:     	movss	0x45a35b(%rip), %xmm9   # 0x1459132fc
1454b8fa1:     	movss	0x44e4e6(%rip), %xmm10  # 0x145907490
1454b8faa:     	jmp	0x1454b8fe2 <.text+0x54b7fe2>
1454b8fac:     	nopl	(%rax)
1454b8fb0:     	movq	0x558(%r13), %rax
1454b8fb7:     	movq	%rsi, %rcx
1454b8fba:     	shlq	$0x5, %rcx
1454b8fbe:     	movups	0xb0(%rbp), %xmm0
1454b8fc5:     	movups	0xc0(%rbp), %xmm1
1454b8fcc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b8fd1:     	movups	%xmm0, (%rax,%rcx)
1454b8fd5:     	incq	%rsi
1454b8fd8:     	movq	%rsi, 0x560(%r13)
1454b8fdf:     	movq	%r14, %rsi
1454b8fe2:     	cmpq	%rdi, %r15
1454b8fe5:     	je	0x1454b90e7 <.text+0x54b80e7>
1454b8feb:     	movq	(%r15), %r14
1454b8fee:     	movl	$0x3f800000, 0x20(%rsp) # imm = 0x3F800000
1454b8ff6:     	movq	%rsi, %rcx
1454b8ff9:     	movq	%r13, %rdx
1454b8ffc:     	movaps	%xmm12, %xmm2
1454b9000:     	movaps	%xmm8, %xmm3
1454b9004:     	callq	0x1454d38a0 <.text+0x54d28a0>
1454b9009:     	nop
1454b900a:     	addq	$0x8, %r15
1454b900e:     	movq	0x4e0(%r13), %rax
1454b9015:     	imulq	$0x160, 0x4e8(%r13), %rdx # imm = 0x160
1454b9020:     	xorl	%ecx, %ecx
1454b9022:     	movq	%rax, %r8
1454b9025:     	nopw	%cs:(%rax,%rax)
1454b9030:     	cmpq	%rcx, %rdx
1454b9033:     	je	0x1454b8fe2 <.text+0x54b7fe2>
1454b9035:     	addq	$0x160, %rcx            # imm = 0x160
1454b903c:     	cmpq	%r14, 0x88(%r8)
1454b9043:     	leaq	0x160(%r8), %r8
1454b904a:     	jne	0x1454b9030 <.text+0x54b8030>
1454b904c:     	movl	0x2c0(%rbp), %edx
1454b9052:     	movl	%edx, -0x4c(%rax,%rcx)
1454b9056:     	movq	0x2b8(%rbp), %rdx
1454b905d:     	movq	%rdx, -0x54(%rax,%rcx)
1454b9062:     	movq	0x2b8(%rbp), %rdx
1454b9069:     	movq	%rdx, -0x48(%rax,%rcx)
1454b906e:     	movl	0x2c0(%rbp), %edx
1454b9074:     	movl	%edx, -0x40(%rax,%rcx)
1454b9078:     	movss	0x220(%rbp), %xmm0
1454b9080:     	movss	0x220(%rbp), %xmm1
1454b9088:     	movlps	%xmm1, -0x3c(%rax,%rcx)
1454b908d:     	movss	%xmm0, -0x34(%rax,%rcx)
1454b9093:     	movl	$0x0, -0xf0(%rax,%rcx)
1454b909e:     	movl	0x958(%r13), %r9d
1454b90a5:     	incl	%r9d
1454b90a8:     	movl	%r9d, 0x958(%r13)
1454b90af:     	movq	%rbx, %rcx
1454b90b2:     	movq	%r14, %rdx
1454b90b5:     	movq	%rsi, %r8
1454b90b8:     	callq	0x14545ff20 <.text+0x545ef20>
1454b90bd:     	nop
1454b90be:     	movq	%rsi, %r14
1454b90c1:     	movq	0x560(%r13), %rsi
1454b90c8:     	cmpq	0x550(%r13), %rsi
1454b90cf:     	jne	0x1454b8fb0 <.text+0x54b7fb0>
1454b90d5:     	movq	0x340(%rbp), %rcx
1454b90dc:     	callq	0x145774710 <.text+0x5773710>
1454b90e1:     	nop
1454b90e2:     	jmp	0x1454b8fb0 <.text+0x54b7fb0>
1454b90e7:     	movq	0x358(%rbp), %rdx
1454b90ee:     	testq	%rdx, %rdx
1454b90f1:     	je	0x1454b9109 <.text+0x54b8109>
1454b90f3:     	shlq	$0x3, %rdx
1454b90f7:     	movl	$0x8, %r8d
1454b90fd:     	movq	0x348(%rbp), %rcx
1454b9104:     	callq	0x1400021d0 <.text+0x11d0>
1454b9109:     	movaps	%xmm6, %xmm0
1454b910c:     	divss	0x45f974(%rip), %xmm0   # 0x145918a88
1454b9114:     	callq	0x145773259 <.text+0x5772259>
1454b9119:     	mulss	0x960(%r13), %xmm0
1454b9122:     	movss	%xmm0, 0x960(%r13)
1454b912b:     	movss	0x934(%r13), %xmm1
1454b9134:     	movzwl	0x248(%r13), %r8d
1454b913c:     	movq	0x4e0(%r13), %rax
1454b9143:     	movq	0x4e8(%r13), %rdx
1454b914a:     	imulq	$0x160, %rdx, %rcx      # imm = 0x160
1454b9151:     	addq	%rax, %rcx
1454b9154:     	testq	%rdx, %rdx
1454b9157:     	je	0x1454b91ad <.text+0x54b81ad>
1454b9159:     	movss	0x44e32e(%rip), %xmm10  # 0x145907490
1454b9162:     	movss	0x45c766(%rip), %xmm2   # 0x1459158d0
1454b916a:     	movss	0x44e3ae(%rip), %xmm3   # 0x145907520
1454b9172:     	movq	%rax, %r9
1454b9175:     	jmp	0x1454b918c <.text+0x54b818c>
1454b9177:     	minss	%xmm4, %xmm10
1454b917c:     	nopl	(%rax)
1454b9180:     	addq	$0x160, %r9             # imm = 0x160
1454b9187:     	cmpq	%rcx, %r9
1454b918a:     	je	0x1454b91ad <.text+0x54b81ad>
1454b918c:     	cmpb	$0x0, 0x68(%r9)
1454b9191:     	jne	0x1454b9180 <.text+0x54b8180>
1454b9193:     	cmpq	$-0x1, 0x18(%r9)
1454b9198:     	je	0x1454b9180 <.text+0x54b8180>
1454b919a:     	movq	0x30(%r9), %r10
1454b919e:     	cmpb	$0x0, 0x54(%r10)
1454b91a3:     	movaps	%xmm2, %xmm4
1454b91a6:     	jne	0x1454b9177 <.text+0x54b8177>
1454b91a8:     	movaps	%xmm3, %xmm4
1454b91ab:     	jmp	0x1454b9177 <.text+0x54b8177>
1454b91ad:     	movaps	%xmm1, %xmm2
1454b91b0:     	divss	0x45c6ec(%rip), %xmm2   # 0x1459158a4
1454b91b8:     	movss	0x486da0(%rip), %xmm3   # 0x14593ff60
1454b91c0:     	mulss	%xmm2, %xmm3
1454b91c4:     	addss	0x44e358(%rip), %xmm3   # 0x145907524
1454b91cc:     	movss	0x53b0dc(%rip), %xmm4   # 0x1459f42b0
1454b91d4:     	mulss	%xmm2, %xmm4
1454b91d8:     	mulss	%xmm2, %xmm4
1454b91dc:     	addss	%xmm3, %xmm4
1454b91e0:     	movzwl	%r8w, %r8d
1454b91e4:     	xorps	%xmm2, %xmm2
1454b91e7:     	cvtsi2ss	%r8d, %xmm2
1454b91ec:     	mulss	0x44e340(%rip), %xmm4   # 0x145907534
1454b91f4:     	divss	0x44e340(%rip), %xmm2   # 0x14590753c
1454b91fc:     	mulss	%xmm4, %xmm2
1454b9200:     	mulss	%xmm2, %xmm10
1454b9205:     	movzbl	0x9aa(%r13), %r8d
1454b920d:     	cmpb	$0x1, %r8b
1454b9211:     	jne	0x1454b9257 <.text+0x54b8257>
1454b9213:     	cmpl	$0x1, 0x870(%r13)
1454b921b:     	jne	0x1454b924a <.text+0x54b824a>
1454b921d:     	movaps	%xmm1, %xmm3
1454b9220:     	subss	0x874(%r13), %xmm3
1454b9229:     	divss	0x45c673(%rip), %xmm3   # 0x1459158a4
1454b9231:     	xorps	%xmm4, %xmm4
1454b9234:     	maxss	%xmm4, %xmm3
1454b9238:     	mulss	0x45a0b0(%rip), %xmm3   # 0x1459132f0
1454b9240:     	addss	0x492190(%rip), %xmm3   # 0x14594b3d8
1454b9248:     	jmp	0x1454b9252 <.text+0x54b8252>
1454b924a:     	movss	0x492186(%rip), %xmm3   # 0x14594b3d8
1454b9252:     	mulss	%xmm3, %xmm10
1454b9257:     	movss	0x44e231(%rip), %xmm3   # 0x145907490
1454b925f:     	testq	%rdx, %rdx
1454b9262:     	je	0x1454b92aa <.text+0x54b82aa>
1454b9264:     	movss	0x45c664(%rip), %xmm4   # 0x1459158d0
1454b926c:     	movss	0x44e2ac(%rip), %xmm5   # 0x145907520
1454b9274:     	jmp	0x1454b928b <.text+0x54b828b>
1454b9276:     	minss	%xmm7, %xmm3
1454b927a:     	nopw	(%rax,%rax)
1454b9280:     	addq	$0x160, %rax            # imm = 0x160
1454b9286:     	cmpq	%rcx, %rax
1454b9289:     	je	0x1454b92aa <.text+0x54b82aa>
1454b928b:     	cmpb	$0x0, 0x68(%rax)
1454b928f:     	jne	0x1454b9280 <.text+0x54b8280>
1454b9291:     	cmpq	$-0x1, 0x18(%rax)
1454b9296:     	je	0x1454b9280 <.text+0x54b8280>
1454b9298:     	movq	0x30(%rax), %rdx
1454b929c:     	cmpb	$0x0, 0x54(%rdx)
1454b92a0:     	movaps	%xmm4, %xmm7
1454b92a3:     	jne	0x1454b9276 <.text+0x54b8276>
1454b92a5:     	movaps	%xmm5, %xmm7
1454b92a8:     	jmp	0x1454b9276 <.text+0x54b8276>
1454b92aa:     	mulss	%xmm3, %xmm2
1454b92ae:     	testb	%r8b, %r8b
1454b92b1:     	je	0x1454b92f3 <.text+0x54b82f3>
1454b92b3:     	cmpl	$0x1, 0x870(%r13)
1454b92bb:     	jne	0x1454b92e7 <.text+0x54b82e7>
1454b92bd:     	subss	0x874(%r13), %xmm1
1454b92c6:     	divss	0x45c5d6(%rip), %xmm1   # 0x1459158a4
1454b92ce:     	xorps	%xmm3, %xmm3
1454b92d1:     	maxss	%xmm3, %xmm1
1454b92d5:     	mulss	0x45a013(%rip), %xmm1   # 0x1459132f0
1454b92dd:     	addss	0x4920f3(%rip), %xmm1   # 0x14594b3d8
1454b92e5:     	jmp	0x1454b92ef <.text+0x54b82ef>
1454b92e7:     	movss	0x4920e9(%rip), %xmm1   # 0x14594b3d8
1454b92ef:     	mulss	%xmm1, %xmm2
1454b92f3:     	divss	0x44e215(%rip), %xmm0   # 0x145907510
1454b92fb:     	mulss	0x55b1c1(%rip), %xmm0   # 0x145a144c4
1454b9303:     	maxss	0x45a04d(%rip), %xmm2   # 0x145913358
1454b930b:     	divss	%xmm2, %xmm0
1454b930f:     	movss	0x44e178(%rip), %xmm8   # 0x145907490
1454b9318:     	movaps	%xmm8, %xmm1
1454b931c:     	maxss	%xmm0, %xmm1
1454b9320:     	movaps	%xmm9, %xmm0
1454b9324:     	minss	%xmm1, %xmm0
1454b9328:     	mulss	%xmm0, %xmm10
1454b932d:     	mulss	%xmm10, %xmm6
1454b9332:     	addss	0x95c(%r13), %xmm6
1454b933b:     	movss	%xmm6, 0x95c(%r13)
1454b9344:     	movq	0x338(%rbp), %rax
1454b934b:     	movq	0x78(%rax), %rdi
1454b934f:     	movq	0x80(%rax), %rax
1454b9356:     	movq	%rax, 0x348(%rbp)
1454b935d:     	leaq	(%rax,%rax,4), %rax
1454b9361:     	shlq	$0x4, %rax
1454b9365:     	addq	%rdi, %rax
1454b9368:     	movq	%rdi, 0xb0(%rbp)
1454b936f:     	movq	%rax, 0x318(%rbp)
1454b9376:     	movq	%rax, 0xb8(%rbp)
1454b937d:     	movq	$0x0, 0xc0(%rbp)
1454b9388:     	leaq	0x68(%rbp), %rax
1454b938c:     	movq	%rax, 0xc8(%rbp)
1454b9393:     	leaq	0x2f0(%rbp), %rcx
1454b939a:     	leaq	0xb0(%rbp), %rbx
1454b93a1:     	movq	%rbx, %rdx
1454b93a4:     	callq	0x14553dec0 <.text+0x553cec0>
1454b93a9:     	movss	0x95c(%r13), %xmm0
1454b93b2:     	movq	0x2f8(%rbp), %rax
1454b93b9:     	movq	%rax, 0x358(%rbp)
1454b93c0:     	movq	0x300(%rbp), %r14
1454b93c7:     	xorl	%r13d, %r13d
1454b93ca:     	movq	0x368(%rbp), %rsi
1454b93d1:     	ucomiss	%xmm8, %xmm0
1454b93d5:     	jb	0x1454b9496 <.text+0x54b8496>
1454b93db:     	nopl	(%rax,%rax)
1454b93e0:     	cmpl	$0x8, %r13d
1454b93e4:     	jae	0x1454b9496 <.text+0x54b8496>
1454b93ea:     	movss	0x68(%rbp), %xmm3
1454b93ef:     	movq	0x368(%rbp), %rcx
1454b93f6:     	movq	0x358(%rbp), %rdx
1454b93fd:     	movq	%r14, %r8
1454b9400:     	callq	0x1454d0fe0 <.text+0x54cffe0>
1454b9405:     	nop
1454b9406:     	cmpq	0x348(%rbp), %rax
1454b940d:     	jae	0x1454bc92f <.text+0x54bb92f>
1454b9413:     	leaq	(%rax,%rax,4), %rcx
1454b9417:     	shlq	$0x4, %rcx
1454b941b:     	movss	0x44(%rdi,%rcx), %xmm6
1454b9421:     	movq	0x368(%rbp), %rcx
1454b9428:     	ucomiss	0x95c(%rcx), %xmm6
1454b942f:     	ja	0x1454b9496 <.text+0x54b8496>
1454b9431:     	movl	$0x0, 0xb0(%rbp)
1454b943b:     	movq	%rsi, %rcx
1454b943e:     	movq	%rax, %rdx
1454b9441:     	movq	%rbx, %r8
1454b9444:     	callq	0x1454d4130 <.text+0x54d3130>
1454b9449:     	nop
1454b944a:     	movss	0x95c(%rsi), %xmm0
1454b9452:     	cmpq	$0x1, %rax
1454b9456:     	jne	0x1454b9473 <.text+0x54b8473>
1454b9458:     	incl	%r13d
1454b945b:     	subss	%xmm6, %xmm0
1454b945f:     	movss	%xmm0, 0x95c(%rsi)
1454b9467:     	ucomiss	%xmm8, %xmm0
1454b946b:     	jae	0x1454b93e0 <.text+0x54b83e0>
1454b9471:     	jmp	0x1454b9496 <.text+0x54b8496>
1454b9473:     	movaps	%xmm0, %xmm1
1454b9476:     	minss	%xmm6, %xmm1
1454b947a:     	movaps	%xmm1, %xmm2
1454b947d:     	cmpunordss	%xmm1, %xmm2
1454b9482:     	movaps	%xmm2, %xmm3
1454b9485:     	andnps	%xmm1, %xmm3
1454b9488:     	andps	%xmm0, %xmm2
1454b948b:     	orps	%xmm3, %xmm2
1454b948e:     	movss	%xmm2, 0x95c(%rsi)
1454b9496:     	movq	0x368(%rbp), %rcx
1454b949d:     	movzwl	0x248(%rcx), %eax
1454b94a4:     	xorps	%xmm0, %xmm0
1454b94a7:     	cvtsi2ss	%eax, %xmm0
1454b94ab:     	divss	0x44e089(%rip), %xmm0   # 0x14590753c
1454b94b3:     	movss	0x68(%rbp), %xmm1
1454b94b8:     	movq	0x4e8(%rcx), %rdx
1454b94bf:     	testq	%rdx, %rdx
1454b94c2:     	je	0x1454b94f3 <.text+0x54b84f3>
1454b94c4:     	movq	0x4e0(%rcx), %rcx
1454b94cb:     	imulq	$0x160, %rdx, %rax      # imm = 0x160
1454b94d2:     	addq	%rcx, %rax
1454b94d5:     	movss	0x44dfb2(%rip), %xmm8   # 0x145907490
1454b94de:     	movss	0x45c3ea(%rip), %xmm2   # 0x1459158d0
1454b94e6:     	movss	0x44e032(%rip), %xmm3   # 0x145907520
1454b94ee:     	movq	%rcx, %r8
1454b94f1:     	jmp	0x1454b950c <.text+0x54b850c>
1454b94f3:     	xorl	%eax, %eax
1454b94f5:     	jmp	0x1454b95dd <.text+0x54b85dd>
1454b94fa:     	minss	%xmm4, %xmm8
1454b94ff:     	nop
1454b9500:     	addq	$0x160, %r8             # imm = 0x160
1454b9507:     	cmpq	%rax, %r8
1454b950a:     	je	0x1454b952d <.text+0x54b852d>
1454b950c:     	cmpb	$0x0, 0x68(%r8)
1454b9511:     	jne	0x1454b9500 <.text+0x54b8500>
1454b9513:     	cmpq	$-0x1, 0x18(%r8)
1454b9518:     	je	0x1454b9500 <.text+0x54b8500>
1454b951a:     	movq	0x30(%r8), %r9
1454b951e:     	cmpb	$0x0, 0x54(%r9)
1454b9523:     	movaps	%xmm2, %xmm4
1454b9526:     	jne	0x1454b94fa <.text+0x54b84fa>
1454b9528:     	movaps	%xmm3, %xmm4
1454b952b:     	jmp	0x1454b94fa <.text+0x54b84fa>
1454b952d:     	cmpq	$0x1, %rdx
1454b9531:     	jne	0x1454b953a <.text+0x54b853a>
1454b9533:     	xorl	%r8d, %r8d
1454b9536:     	xorl	%eax, %eax
1454b9538:     	jmp	0x1454b95b1 <.text+0x54b85b1>
1454b953a:     	movq	%rdx, %r9
1454b953d:     	andq	$-0x2, %r9
1454b9541:     	leaq	0x1f0(%rcx), %r10
1454b9548:     	xorl	%r8d, %r8d
1454b954b:     	xorl	%eax, %eax
1454b954d:     	jmp	0x1454b956e <.text+0x54b856e>
1454b954f:     	nop
1454b9550:     	movzbl	0x4c(%rsi), %esi
1454b9554:     	xorq	$0x1, %rsi
1454b9558:     	addq	%r11, %rax
1454b955b:     	addq	%rsi, %rax
1454b955e:     	addq	$0x2, %r8
1454b9562:     	addq	$0x2c0, %r10            # imm = 0x2C0
1454b9569:     	cmpq	%r8, %r9
1454b956c:     	je	0x1454b95ac <.text+0x54b85ac>
1454b956e:     	movq	-0x160(%r10), %r11
1454b9575:     	testq	%r11, %r11
1454b9578:     	sete	%bl
1454b957b:     	orb	-0x188(%r10), %bl
1454b9582:     	je	0x1454b9590 <.text+0x54b8590>
1454b9584:     	xorl	%r11d, %r11d
1454b9587:     	jmp	0x1454b9599 <.text+0x54b8599>
1454b9589:     	nopl	(%rax)
1454b9590:     	movzbl	0x4c(%r11), %r11d
1454b9595:     	xorq	$0x1, %r11
1454b9599:     	movq	(%r10), %rsi
1454b959c:     	testq	%rsi, %rsi
1454b959f:     	sete	%bl
1454b95a2:     	orb	-0x28(%r10), %bl
1454b95a6:     	je	0x1454b9550 <.text+0x54b8550>
1454b95a8:     	xorl	%esi, %esi
1454b95aa:     	jmp	0x1454b9558 <.text+0x54b8558>
1454b95ac:     	testb	$0x1, %dl
1454b95af:     	je	0x1454b95dd <.text+0x54b85dd>
1454b95b1:     	imulq	$0x160, %r8, %r8        # imm = 0x160
1454b95b8:     	movq	0x90(%rcx,%r8), %rdx
1454b95c0:     	testq	%rdx, %rdx
1454b95c3:     	sete	%r9b
1454b95c7:     	orb	0x68(%rcx,%r8), %r9b
1454b95cc:     	je	0x1454b95d2 <.text+0x54b85d2>
1454b95ce:     	xorl	%ecx, %ecx
1454b95d0:     	jmp	0x1454b95da <.text+0x54b85da>
1454b95d2:     	movzbl	0x4c(%rdx), %ecx
1454b95d6:     	xorq	$0x1, %rcx
1454b95da:     	addq	%rcx, %rax
1454b95dd:     	mulss	0x12848eb(%rip), %xmm1  # 0x14673ded0
1454b95e5:     	addss	0x44df1b(%rip), %xmm1   # 0x145907508
1454b95ed:     	mulss	%xmm0, %xmm1
1454b95f1:     	mulss	%xmm8, %xmm1
1454b95f6:     	movss	0x48e89a(%rip), %xmm2   # 0x145947e98
1454b95fe:     	mulss	%xmm0, %xmm2
1454b9602:     	movaps	%xmm1, %xmm3
1454b9605:     	minss	%xmm2, %xmm3
1454b9609:     	movaps	%xmm3, %xmm2
1454b960c:     	cmpunordss	%xmm3, %xmm2
1454b9611:     	andps	%xmm2, %xmm1
1454b9614:     	andnps	%xmm3, %xmm2
1454b9617:     	orps	%xmm1, %xmm2
1454b961a:     	cvttss2si	%xmm2, %rcx
1454b961f:     	movq	%rcx, %rdx
1454b9622:     	sarq	$0x3f, %rdx
1454b9626:     	movss	0x44dbb2(%rip), %xmm7   # 0x1459071e0
1454b962e:     	movaps	%xmm2, %xmm1
1454b9631:     	subss	%xmm7, %xmm1
1454b9635:     	cvttss2si	%xmm1, %r13
1454b963a:     	andq	%rdx, %r13
1454b963d:     	orq	%rcx, %r13
1454b9640:     	xorl	%ebx, %ebx
1454b9642:     	xorps	%xmm6, %xmm6
1454b9645:     	ucomiss	%xmm6, %xmm2
1454b9648:     	cmovbq	%rbx, %r13
1454b964c:     	movss	0x44db8f(%rip), %xmm8   # 0x1459071e4
1454b9655:     	ucomiss	%xmm8, %xmm2
1454b9659:     	movq	$-0x1, %rsi
1454b9660:     	cmovaq	%rsi, %r13
1454b9664:     	subq	%rax, %r13
1454b9667:     	cmovbq	%rbx, %r13
1454b966b:     	callq	0x14577327d <.text+0x577227d>
1454b9670:     	movaps	%xmm0, %xmm1
1454b9673:     	subss	%xmm7, %xmm1
1454b9677:     	cvttss2si	%xmm1, %rax
1454b967c:     	cvttss2si	%xmm0, %rcx
1454b9681:     	movq	%rcx, %rdx
1454b9684:     	sarq	$0x3f, %rdx
1454b9688:     	andq	%rax, %rdx
1454b968b:     	orq	%rcx, %rdx
1454b968e:     	ucomiss	%xmm6, %xmm0
1454b9691:     	cmovbq	%rbx, %rdx
1454b9695:     	ucomiss	%xmm8, %xmm0
1454b9699:     	cmovaq	%rsi, %rdx
1454b969d:     	leaq	(%rdx,%rdx,2), %rax
1454b96a1:     	cmpq	%r13, %rax
1454b96a4:     	cmovbq	%rax, %r13
1454b96a8:     	testq	%r13, %r13
1454b96ab:     	je	0x1454b96ff <.text+0x54b86ff>
1454b96ad:     	xorl	%r15d, %r15d
1454b96b0:     	leaq	0xb0(%rbp), %rbx
1454b96b7:     	movq	0x368(%rbp), %rsi
1454b96be:     	nop
1454b96c0:     	movss	0x68(%rbp), %xmm3
1454b96c5:     	movq	%rsi, %rcx
1454b96c8:     	movq	0x358(%rbp), %rdx
1454b96cf:     	movq	%r14, %r8
1454b96d2:     	callq	0x1454d0fe0 <.text+0x54cffe0>
1454b96d7:     	nop
1454b96d8:     	movl	$0x0, 0xb0(%rbp)
1454b96e2:     	movq	%rsi, %rcx
1454b96e5:     	movq	%rax, %rdx
1454b96e8:     	movq	%rbx, %r8
1454b96eb:     	callq	0x1454d4130 <.text+0x54d3130>
1454b96f0:     	nop
1454b96f1:     	cmpq	$0x1, %rax
1454b96f5:     	jne	0x1454b96ff <.text+0x54b86ff>
1454b96f7:     	incq	%r15
1454b96fa:     	cmpq	%r13, %r15
1454b96fd:     	jb	0x1454b96c0 <.text+0x54b86c0>
1454b96ff:     	movq	0x368(%rbp), %r13
1454b9706:     	movss	0x934(%r13), %xmm0
1454b970f:     	ucomiss	0x974(%r13), %xmm0
1454b9717:     	jb	0x1454b99ea <.text+0x54b89ea>
1454b971d:     	movq	%rdi, 0xb0(%rbp)
1454b9724:     	movq	0x318(%rbp), %rax
1454b972b:     	movq	%rax, 0xb8(%rbp)
1454b9732:     	movq	$0x0, 0xc0(%rbp)
1454b973d:     	leaq	0x68(%rbp), %rax
1454b9741:     	movq	%rax, 0xc8(%rbp)
1454b9748:     	leaq	0x240(%rbp), %rcx
1454b974f:     	leaq	0xb0(%rbp), %rdx
1454b9756:     	callq	0x14553e0a0 <.text+0x553d0a0>
1454b975b:     	nop
1454b975c:     	movq	%r13, %rax
1454b975f:     	movq	0x248(%rbp), %rcx
1454b9766:     	movq	%rcx, 0x318(%rbp)
1454b976d:     	movq	0x250(%rbp), %r8
1454b9774:     	cmpq	$0x1, %r8
1454b9778:     	movq	%r8, %r9
1454b977b:     	adcq	$0x0, %r9
1454b977f:     	bsrq	%r9, %rcx
1454b9783:     	notl	%ecx
1454b9785:     	movq	%r9, %r10
1454b9788:     	shlq	%cl, %r10
1454b978b:     	decq	%r10
1454b978e:     	movq	0x8a0(%r13), %rbx
1454b9795:     	movq	0x8a8(%r13), %rcx
1454b979c:     	movq	0x8b8(%r13), %r13
1454b97a3:     	movq	0x8b0(%rax), %r11
1454b97aa:     	nopw	(%rax,%rax)
1454b97b0:     	leaq	(%rbx,%r13), %rax
1454b97b4:     	rolq	$0x17, %rax
1454b97b8:     	addq	%rbx, %rax
1454b97bb:     	movq	%rcx, %rsi
1454b97be:     	shlq	$0x11, %rsi
1454b97c2:     	xorq	%rbx, %r11
1454b97c5:     	xorq	%rcx, %r13
1454b97c8:     	xorq	%r13, %rbx
1454b97cb:     	rolq	$0x2d, %r13
1454b97cf:     	xorq	%r11, %rcx
1454b97d2:     	mulq	%r9
1454b97d5:     	xorq	%rsi, %r11
1454b97d8:     	cmpq	%rax, %r10
1454b97db:     	jb	0x1454b97b0 <.text+0x54b87b0>
1454b97dd:     	movq	0x368(%rbp), %rax
1454b97e4:     	movq	%rbx, 0x8a0(%rax)
1454b97eb:     	movq	%r13, 0x8b8(%rax)
1454b97f2:     	movq	%rax, %r13
1454b97f5:     	movq	%rcx, 0x8a8(%rax)
1454b97fc:     	movq	%r11, 0x8b0(%rax)
1454b9803:     	cmpq	$0x1, %r8
1454b9807:     	movq	%r8, %rax
1454b980a:     	adcq	$-0x1, %rax
1454b980e:     	cmpq	%rdx, %rax
1454b9811:     	cmovaeq	%rdx, %rax
1454b9815:     	cmpq	%r8, %rax
1454b9818:     	jae	0x1454b998a <.text+0x54b898a>
1454b981e:     	movq	0x318(%rbp), %rcx
1454b9825:     	movq	(%rcx,%rax,8), %rbx
1454b9829:     	movl	$0x0, 0xb0(%rbp)
1454b9833:     	leaq	0xb0(%rbp), %r8
1454b983a:     	movq	%r13, %rcx
1454b983d:     	movq	%rbx, %rdx
1454b9840:     	callq	0x1454d4130 <.text+0x54d3130>
1454b9845:     	nop
1454b9846:     	movq	0x348(%rbp), %rdx
1454b984d:     	cmpq	%rdx, %rbx
1454b9850:     	jae	0x1454bccd4 <.text+0x54bbcd4>
1454b9856:     	leaq	(%rbx,%rbx,4), %rsi
1454b985a:     	shlq	$0x4, %rsi
1454b985e:     	leaq	(%rdi,%rsi), %rax
1454b9862:     	addq	$0x20, %rax
1454b9866:     	movq	%rax, 0x2b8(%rbp)
1454b986d:     	leaq	0x280bdc(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454b9874:     	movq	%rax, 0x2c0(%rbp)
1454b987b:     	leaq	0x1272096(%rip), %rdx   # 0x14672b918
1454b9882:     	leaq	0xb0(%rbp), %rcx
1454b9889:     	leaq	0x2b8(%rbp), %r8
1454b9890:     	callq	0x145728390 <.text+0x5727390>
1454b9895:     	nop
1454b9896:     	addq	%rsi, %rdi
1454b9899:     	movq	0xb8(%rbp), %rcx
1454b98a0:     	movq	0xc0(%rbp), %rdx
1454b98a7:     	movq	0x10(%rdi), %rbx
1454b98ab:     	movq	0x18(%rdi), %rax
1454b98af:     	movq	%rax, 0x348(%rbp)
1454b98b6:     	movq	%rcx, 0x310(%rbp)
1454b98bd:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b98c2:     	nop
1454b98c3:     	movq	%rax, %rsi
1454b98c6:     	movq	%rdx, %r15
1454b98c9:     	movq	0xb0(%rbp), %rdx
1454b98d0:     	testq	%rdx, %rdx
1454b98d3:     	je	0x1454b98e8 <.text+0x54b88e8>
1454b98d5:     	movl	$0x1, %r8d
1454b98db:     	movq	0x310(%rbp), %rcx
1454b98e2:     	callq	0x1400021d0 <.text+0x11d0>
1454b98e7:     	nop
1454b98e8:     	leaq	0x153d991(%rip), %rdi   # 0x1469f7280
1454b98ef:     	movl	$0xe, %edx
1454b98f4:     	movq	%rdi, %rcx
1454b98f7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b98fc:     	nop
1454b98fd:     	movq	0x368(%rbp), %r13
1454b9904:     	testq	%rsi, %rsi
1454b9907:     	cmoveq	0x348(%rbp), %r15
1454b990f:     	cmovneq	%rsi, %rbx
1454b9913:     	testq	%rax, %rax
1454b9916:     	cmovneq	%rax, %rdi
1454b991a:     	movl	$0xe, %eax
1454b991f:     	cmoveq	%rax, %rdx
1454b9923:     	movq	%rdx, 0x20(%rsp)
1454b9928:     	leaq	0xb0(%rbp), %rcx
1454b992f:     	movq	%rbx, %rdx
1454b9932:     	movq	%r15, %r8
1454b9935:     	movq	%rdi, %r9
1454b9938:     	callq	0x145459d40 <.text+0x5458d40>
1454b993d:     	nop
1454b993e:     	movq	0x560(%r13), %rsi
1454b9945:     	cmpq	0x550(%r13), %rsi
1454b994c:     	jne	0x1454b995b <.text+0x54b895b>
1454b994e:     	movq	0x340(%rbp), %rcx
1454b9955:     	callq	0x145774710 <.text+0x5773710>
1454b995a:     	nop
1454b995b:     	movq	0x558(%r13), %rax
1454b9962:     	movq	%rsi, %rcx
1454b9965:     	shlq	$0x5, %rcx
1454b9969:     	movups	0xb0(%rbp), %xmm0
1454b9970:     	movups	0xc0(%rbp), %xmm1
1454b9977:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b997c:     	movups	%xmm0, (%rax,%rcx)
1454b9980:     	incq	%rsi
1454b9983:     	movq	%rsi, 0x560(%r13)
1454b998a:     	movss	0x934(%r13), %xmm0
1454b9993:     	movss	0x68(%rbp), %xmm1
1454b9998:     	mulss	0x52b084(%rip), %xmm1   # 0x1459e4a24
1454b99a0:     	addss	0x574da4(%rip), %xmm1   # 0x145a2e74c
1454b99a8:     	maxss	0x52afec(%rip), %xmm1   # 0x1459e499c
1454b99b0:     	addss	%xmm0, %xmm1
1454b99b4:     	movss	%xmm1, 0x974(%r13)
1454b99bd:     	movq	0x240(%rbp), %rdx
1454b99c4:     	testq	%rdx, %rdx
1454b99c7:     	je	0x1454b99ea <.text+0x54b89ea>
1454b99c9:     	shlq	$0x3, %rdx
1454b99cd:     	movl	$0x8, %r8d
1454b99d3:     	movq	0x318(%rbp), %rcx
1454b99da:     	callq	0x1400021d0 <.text+0x11d0>
1454b99df:     	movq	0xa8(%rbp), %rax
1454b99e6:     	movss	(%rax), %xmm0
1454b99ea:     	ucomiss	0x964(%r13), %xmm0
1454b99f2:     	jb	0x1454bb092 <.text+0x54ba092>
1454b99f8:     	movss	0x68(%rbp), %xmm6
1454b99fd:     	testq	%r14, %r14
1454b9a00:     	je	0x1454bb06d <.text+0x54ba06d>
1454b9a06:     	leaq	0x9b8(%r13), %rax
1454b9a0d:     	movq	$0x0, 0xb8(%rbp)
1454b9a18:     	movq	$0x4, 0xc0(%rbp)
1454b9a23:     	movl	$0x3020100, 0xc8(%rbp)  # imm = 0x3020100
1454b9a2d:     	movq	%rax, 0xb0(%rbp)
1454b9a34:     	leaq	0x2b8(%rbp), %rcx
1454b9a3b:     	leaq	0xb0(%rbp), %rdx
1454b9a42:     	callq	0x145538920 <.text+0x5537920>
1454b9a47:     	nop
1454b9a48:     	movq	0x2c8(%rbp), %r9
1454b9a4f:     	testq	%r9, %r9
1454b9a52:     	je	0x1454bc79c <.text+0x54bb79c>
1454b9a58:     	bsrq	%r9, %rcx
1454b9a5c:     	notl	%ecx
1454b9a5e:     	movq	%r9, %r8
1454b9a61:     	shlq	%cl, %r8
1454b9a64:     	decq	%r8
1454b9a67:     	movq	0x368(%rbp), %r13
1454b9a6e:     	movq	0x8a0(%r13), %r11
1454b9a75:     	movq	0x8a8(%r13), %rcx
1454b9a7c:     	movq	0x8b8(%r13), %rdi
1454b9a83:     	movq	0x8b0(%r13), %r10
1454b9a8a:     	nopw	(%rax,%rax)
1454b9a90:     	leaq	(%r11,%rdi), %rax
1454b9a94:     	rolq	$0x17, %rax
1454b9a98:     	addq	%r11, %rax
1454b9a9b:     	movq	%rcx, %rsi
1454b9a9e:     	shlq	$0x11, %rsi
1454b9aa2:     	xorq	%r11, %r10
1454b9aa5:     	xorq	%rcx, %rdi
1454b9aa8:     	xorq	%rdi, %r11
1454b9aab:     	rolq	$0x2d, %rdi
1454b9aaf:     	xorq	%r10, %rcx
1454b9ab2:     	mulq	%r9
1454b9ab5:     	xorq	%rsi, %r10
1454b9ab8:     	cmpq	%rax, %r8
1454b9abb:     	jb	0x1454b9a90 <.text+0x54b8a90>
1454b9abd:     	movq	%r11, 0x8a0(%r13)
1454b9ac4:     	movq	%rdi, 0x8b8(%r13)
1454b9acb:     	movq	%rcx, 0x8a8(%r13)
1454b9ad2:     	movq	%r10, 0x8b0(%r13)
1454b9ad9:     	cmpq	%rdx, %r9
1454b9adc:     	jbe	0x1454bcc88 <.text+0x54bbc88>
1454b9ae2:     	movq	0x2c0(%rbp), %rax
1454b9ae9:     	movq	%rax, 0x2a0(%rbp)
1454b9af0:     	movzbl	(%rax,%rdx), %edi
1454b9af4:     	movb	%dil, 0x9b8(%r13)
1454b9afb:     	movq	0x228(%r13), %rcx
1454b9b02:     	movq	0x230(%r13), %rdx
1454b9b09:     	callq	0x145420480 <.text+0x541f480>
1454b9b0e:     	imulq	$0xf0, %rax, %rax
1454b9b15:     	movzwl	0x248(%r13), %r15d
1454b9b1d:     	movq	0x358(%rbp), %r8
1454b9b24:     	leaq	(%r8,%r14,8), %rcx
1454b9b28:     	movq	0x78(%rax,%r12), %rdx
1454b9b2d:     	movq	0x80(%rax,%r12), %rsi
1454b9b35:     	movq	%r8, 0xb0(%rbp)
1454b9b3c:     	movq	%rcx, 0xb8(%rbp)
1454b9b43:     	movq	%rdx, 0x298(%rbp)
1454b9b4a:     	movq	%rdx, 0xc0(%rbp)
1454b9b51:     	movq	%rsi, 0xc8(%rbp)
1454b9b58:     	leaq	0x240(%rbp), %rcx
1454b9b5f:     	leaq	0xb0(%rbp), %rdx
1454b9b66:     	callq	0x14553e460 <.text+0x553d460>
1454b9b6b:     	nop
1454b9b6c:     	movq	0x250(%rbp), %r9
1454b9b73:     	testq	%r9, %r9
1454b9b76:     	je	0x1454b9ba6 <.text+0x54b8ba6>
1454b9b78:     	movl	%edi, 0x318(%rbp)
1454b9b7e:     	movq	%rsi, 0x80(%rbp)
1454b9b85:     	movq	0x240(%rbp), %rax
1454b9b8c:     	movq	%rax, 0x238(%rbp)
1454b9b93:     	movq	0x248(%rbp), %rax
1454b9b9a:     	movq	%rax, 0x328(%rbp)
1454b9ba1:     	jmp	0x1454b9c50 <.text+0x54b8c50>
1454b9ba6:     	leaq	(,%r14,8), %rbx
1454b9bae:     	movq	%r14, %rax
1454b9bb1:     	shrq	$0x3d, %rax
1454b9bb5:     	setne	%al
1454b9bb8:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454b9bc2:     	cmpq	%rcx, %rbx
1454b9bc5:     	seta	%cl
1454b9bc8:     	orb	%al, %cl
1454b9bca:     	je	0x1454b9bdf <.text+0x54b8bdf>
1454b9bcc:     	xorl	%edi, %edi
1454b9bce:     	movq	%rdi, %rcx
1454b9bd1:     	movq	%rbx, %rdx
1454b9bd4:     	callq	0x14590379b <.text+0x590279b>
1454b9bd9:     	nop
1454b9bda:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454b9bdf:     	movl	%edi, 0x318(%rbp)
1454b9be5:     	movq	%rsi, 0x80(%rbp)
1454b9bec:     	callq	0x140002200 <.text+0x1200>
1454b9bf1:     	movl	$0x8, %edi
1454b9bf6:     	movl	$0x8, %edx
1454b9bfb:     	movq	%rbx, %rcx
1454b9bfe:     	callq	0x1400021c0 <.text+0x11c0>
1454b9c03:     	testq	%rax, %rax
1454b9c06:     	je	0x1454b9bce <.text+0x54b8bce>
1454b9c08:     	movq	%rax, %rsi
1454b9c0b:     	movq	%rax, %rcx
1454b9c0e:     	movq	0x358(%rbp), %rdx
1454b9c15:     	movq	%rbx, %r8
1454b9c18:     	callq	0x1457731ed <.text+0x57721ed>
1454b9c1d:     	movq	0x240(%rbp), %rdx
1454b9c24:     	testq	%rdx, %rdx
1454b9c27:     	movq	%rsi, 0x328(%rbp)
1454b9c2e:     	je	0x1454b9c46 <.text+0x54b8c46>
1454b9c30:     	movq	0x248(%rbp), %rcx
1454b9c37:     	shlq	$0x3, %rdx
1454b9c3b:     	movl	$0x8, %r8d
1454b9c41:     	callq	0x1400021d0 <.text+0x11d0>
1454b9c46:     	movq	%r14, 0x238(%rbp)
1454b9c4d:     	movq	%r14, %r9
1454b9c50:     	cvtsi2ss	%r15d, %xmm7
1454b9c55:     	divss	0x44d8df(%rip), %xmm7   # 0x14590753c
1454b9c5d:     	mulss	0x44d8cf(%rip), %xmm7   # 0x145907534
1454b9c65:     	bsrq	%r9, %rcx
1454b9c69:     	notl	%ecx
1454b9c6b:     	movq	%r9, %r8
1454b9c6e:     	shlq	%cl, %r8
1454b9c71:     	decq	%r8
1454b9c74:     	movq	0x8a0(%r13), %rbx
1454b9c7b:     	movq	0x8a8(%r13), %r15
1454b9c82:     	movq	0x8b8(%r13), %rdi
1454b9c89:     	movq	0x8b0(%r13), %r13
1454b9c90:     	leaq	(%rbx,%rdi), %rax
1454b9c94:     	rolq	$0x17, %rax
1454b9c98:     	addq	%rbx, %rax
1454b9c9b:     	movq	%r15, %rcx
1454b9c9e:     	shlq	$0x11, %rcx
1454b9ca2:     	xorq	%rbx, %r13
1454b9ca5:     	xorq	%r15, %rdi
1454b9ca8:     	xorq	%rdi, %rbx
1454b9cab:     	rolq	$0x2d, %rdi
1454b9caf:     	xorq	%r13, %r15
1454b9cb2:     	mulq	%r9
1454b9cb5:     	xorq	%rcx, %r13
1454b9cb8:     	cmpq	%rax, %r8
1454b9cbb:     	jb	0x1454b9c90 <.text+0x54b8c90>
1454b9cbd:     	movq	0x368(%rbp), %rax
1454b9cc4:     	movq	%rbx, 0x8a0(%rax)
1454b9ccb:     	movq	%rdi, 0x8b8(%rax)
1454b9cd2:     	movq	%r15, 0x8a8(%rax)
1454b9cd9:     	movq	%r13, 0x8b0(%rax)
1454b9ce0:     	cmpq	%rdx, %r9
1454b9ce3:     	jbe	0x1454bccbf <.text+0x54bbcbf>
1454b9ce9:     	movq	0x328(%rbp), %rax
1454b9cf0:     	movq	(%rax,%rdx,8), %rax
1454b9cf4:     	movq	%rax, 0x348(%rbp)
1454b9cfb:     	movl	0x318(%rbp), %eax
1454b9d01:     	leaq	0x153ea00(%rip), %rcx   # 0x1469f8708
1454b9d08:     	movslq	(%rcx,%rax,4), %rax
1454b9d0c:     	addq	%rcx, %rax
1454b9d0f:     	jmpq	*%rax
1454b9d11:     	mulss	0x486757(%rip), %xmm6   # 0x145940470
1454b9d19:     	addss	0x44d7ef(%rip), %xmm6   # 0x145907510
1454b9d21:     	mulss	%xmm7, %xmm6
1454b9d25:     	cvttss2si	%xmm6, %rax
1454b9d2a:     	movq	%rax, %rcx
1454b9d2d:     	sarq	$0x3f, %rcx
1454b9d31:     	movaps	%xmm6, %xmm0
1454b9d34:     	subss	0x44d4a4(%rip), %xmm0   # 0x1459071e0
1454b9d3c:     	cvttss2si	%xmm0, %rdx
1454b9d41:     	andq	%rcx, %rdx
1454b9d44:     	orq	%rax, %rdx
1454b9d47:     	xorl	%r13d, %r13d
1454b9d4a:     	xorps	%xmm0, %xmm0
1454b9d4d:     	ucomiss	%xmm0, %xmm6
1454b9d50:     	cmovbq	%r13, %rdx
1454b9d54:     	ucomiss	0x44d489(%rip), %xmm6   # 0x1459071e4
1454b9d5b:     	movq	$-0x1, %rax
1454b9d62:     	cmovaq	%rax, %rdx
1454b9d66:     	cmpq	$0x1, %rdx
1454b9d6a:     	adcq	$0x0, %rdx
1454b9d6e:     	js	0x1454ba21f <.text+0x54b921f>
1454b9d74:     	xorps	%xmm0, %xmm0
1454b9d77:     	cvtsi2ss	%rdx, %xmm0
1454b9d7c:     	jmp	0x1454ba239 <.text+0x54b9239>
1454b9d81:     	addss	%xmm6, %xmm6
1454b9d85:     	addss	0x45ba73(%rip), %xmm6   # 0x145915800
1454b9d8d:     	mulss	%xmm7, %xmm6
1454b9d91:     	cvttss2si	%xmm6, %rax
1454b9d96:     	movq	%rax, %rcx
1454b9d99:     	sarq	$0x3f, %rcx
1454b9d9d:     	movaps	%xmm6, %xmm0
1454b9da0:     	subss	0x44d438(%rip), %xmm0   # 0x1459071e0
1454b9da8:     	cvttss2si	%xmm0, %rdx
1454b9dad:     	andq	%rcx, %rdx
1454b9db0:     	orq	%rax, %rdx
1454b9db3:     	xorl	%eax, %eax
1454b9db5:     	xorps	%xmm0, %xmm0
1454b9db8:     	ucomiss	%xmm0, %xmm6
1454b9dbb:     	cmovaeq	%rdx, %rax
1454b9dbf:     	ucomiss	0x44d41e(%rip), %xmm6   # 0x1459071e4
1454b9dc6:     	movq	$-0x1, %rsi
1454b9dcd:     	cmovbeq	%rax, %rsi
1454b9dd1:     	cmpq	$0x1, %rsi
1454b9dd5:     	adcq	$0x0, %rsi
1454b9dd9:     	movq	0x368(%rbp), %rax
1454b9de0:     	movsd	0x8c8(%rax), %xmm1
1454b9de8:     	movaps	%xmm1, %xmm0
1454b9deb:     	mulps	%xmm1, %xmm0
1454b9dee:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454b9df2:     	addss	%xmm0, %xmm2
1454b9df6:     	ucomiss	0x44d70b(%rip), %xmm2   # 0x145907508
1454b9dfd:     	movq	%rsi, 0x318(%rbp)
1454b9e04:     	jbe	0x1454ba1e6 <.text+0x54b91e6>
1454b9e0a:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454b9e0e:     	callq	0x14577324d <.text+0x577224d>
1454b9e13:     	movss	%xmm0, 0x358(%rbp)
1454b9e1b:     	jmp	0x1454ba209 <.text+0x54b9209>
1454b9e20:     	movq	0x368(%rbp), %rcx
1454b9e27:     	movq	0x358(%rbp), %rdx
1454b9e2e:     	movq	%r14, %r8
1454b9e31:     	movaps	%xmm6, %xmm3
1454b9e34:     	callq	0x1454d0fe0 <.text+0x54cffe0>
1454b9e39:     	movq	%rax, 0x348(%rbp)
1454b9e40:     	mulss	0x4594b0(%rip), %xmm6   # 0x1459132f8
1454b9e48:     	addss	0x45e9f0(%rip), %xmm6   # 0x145918840
1454b9e50:     	mulss	%xmm7, %xmm6
1454b9e54:     	cvttss2si	%xmm6, %rax
1454b9e59:     	movq	%rax, %rcx
1454b9e5c:     	sarq	$0x3f, %rcx
1454b9e60:     	movaps	%xmm6, %xmm0
1454b9e63:     	subss	0x44d375(%rip), %xmm0   # 0x1459071e0
1454b9e6b:     	cvttss2si	%xmm0, %rdx
1454b9e70:     	andq	%rcx, %rdx
1454b9e73:     	orq	%rax, %rdx
1454b9e76:     	xorl	%eax, %eax
1454b9e78:     	xorps	%xmm0, %xmm0
1454b9e7b:     	ucomiss	%xmm0, %xmm6
1454b9e7e:     	cmovaeq	%rdx, %rax
1454b9e82:     	ucomiss	0x44d35b(%rip), %xmm6   # 0x1459071e4
1454b9e89:     	movq	$-0x1, %rcx
1454b9e90:     	cmovbeq	%rax, %rcx
1454b9e94:     	cmpq	$0x3, %rcx
1454b9e98:     	movl	$0x2, %edi
1454b9e9d:     	cmovaeq	%rcx, %rdi
1454b9ea1:     	movss	0x44f73b(%rip), %xmm2   # 0x1459095e4
1454b9ea9:     	xorps	%xmm1, %xmm1
1454b9eac:     	movq	0x60(%rbp), %rcx
1454b9eb0:     	callq	0x14550d590 <.text+0x550c590>
1454b9eb5:     	nop
1454b9eb6:     	movq	0x368(%rbp), %r13
1454b9ebd:     	movss	0x400(%r13), %xmm8
1454b9ec6:     	movss	0x404(%r13), %xmm9
1454b9ecf:     	movaps	%xmm0, %xmm7
1454b9ed2:     	callq	0x145773247 <.text+0x5772247>
1454b9ed7:     	movaps	%xmm0, %xmm6
1454b9eda:     	movaps	%xmm7, %xmm0
1454b9edd:     	callq	0x145773235 <.text+0x5772235>
1454b9ee2:     	movaps	%xmm0, %xmm7
1454b9ee5:     	movss	0x52a8f2(%rip), %xmm10  # 0x1459e47e0
1454b9eee:     	leaq	0xb0(%rbp), %rbx
1454b9ef5:     	movss	0x491546(%rip), %xmm11  # 0x14594b444
1454b9efe:     	movss	0x45b9b1(%rip), %xmm12  # 0x1459158b8
1454b9f07:     	nopw	(%rax,%rax)
1454b9f10:     	movaps	%xmm6, %xmm2
1454b9f13:     	mulss	%xmm10, %xmm2
1454b9f18:     	addss	%xmm8, %xmm2
1454b9f1d:     	movaps	%xmm7, %xmm3
1454b9f20:     	mulss	%xmm10, %xmm3
1454b9f25:     	addss	%xmm9, %xmm3
1454b9f2a:     	movq	%rbx, %rcx
1454b9f2d:     	movq	%r13, %rdx
1454b9f30:     	callq	0x1454e3d20 <.text+0x54e2d20>
1454b9f35:     	nop
1454b9f36:     	cmpb	$0x0, 0xb0(%rbp)
1454b9f3d:     	jne	0x1454ba082 <.text+0x54b9082>
1454b9f43:     	addss	%xmm11, %xmm10
1454b9f48:     	ucomiss	%xmm12, %xmm10
1454b9f4c:     	movq	0x368(%rbp), %r13
1454b9f53:     	jae	0x1454b9f10 <.text+0x54b8f10>
1454b9f55:     	jmp	0x1454bb01d <.text+0x54ba01d>
1454b9f5a:     	movq	0x328(%rbp), %r14
1454b9f61:     	cmpq	$0x1, %r9
1454b9f65:     	jne	0x1454ba669 <.text+0x54b9669>
1454b9f6b:     	addss	%xmm6, %xmm6
1454b9f6f:     	addss	0x45b889(%rip), %xmm6   # 0x145915800
1454b9f77:     	mulss	%xmm7, %xmm6
1454b9f7b:     	cvttss2si	%xmm6, %rax
1454b9f80:     	movq	%rax, %rcx
1454b9f83:     	sarq	$0x3f, %rcx
1454b9f87:     	movaps	%xmm6, %xmm0
1454b9f8a:     	subss	0x44d24e(%rip), %xmm0   # 0x1459071e0
1454b9f92:     	cvttss2si	%xmm0, %r8
1454b9f97:     	andq	%rcx, %r8
1454b9f9a:     	orq	%rax, %r8
1454b9f9d:     	xorl	%eax, %eax
1454b9f9f:     	xorps	%xmm0, %xmm0
1454b9fa2:     	ucomiss	%xmm0, %xmm6
1454b9fa5:     	cmovaeq	%r8, %rax
1454b9fa9:     	ucomiss	0x44d234(%rip), %xmm6   # 0x1459071e4
1454b9fb0:     	movq	$-0x1, %rcx
1454b9fb7:     	cmovbeq	%rax, %rcx
1454b9fbb:     	movq	(%r14), %rax
1454b9fbe:     	movq	%rax, 0x348(%rbp)
1454b9fc5:     	cmpq	$0x1, %rcx
1454b9fc9:     	adcq	$0x0, %rcx
1454b9fcd:     	movq	%rcx, %r14
1454b9fd0:     	movq	0x368(%rbp), %rsi
1454b9fd7:     	movsd	0x8c8(%rsi), %xmm1
1454b9fdf:     	movaps	%xmm1, %xmm0
1454b9fe2:     	mulps	%xmm1, %xmm0
1454b9fe5:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454b9fe9:     	addss	%xmm0, %xmm2
1454b9fed:     	ucomiss	0x44d514(%rip), %xmm2   # 0x145907508
1454b9ff4:     	jbe	0x1454bab63 <.text+0x54b9b63>
1454b9ffa:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454b9ffe:     	callq	0x14577324d <.text+0x577224d>
1454ba003:     	movaps	%xmm0, %xmm7
1454ba006:     	movq	%r15, %rax
1454ba009:     	shlq	$0x11, %rax
1454ba00d:     	xorq	%rbx, %r13
1454ba010:     	movq	%r13, %rcx
1454ba013:     	xorq	%r15, %rcx
1454ba016:     	xorq	%rdi, %r15
1454ba019:     	movq	%rcx, 0x8a8(%rsi)
1454ba020:     	movq	%r15, %rcx
1454ba023:     	xorq	%rbx, %rcx
1454ba026:     	movq	%rcx, 0x8a0(%rsi)
1454ba02d:     	xorq	%rax, %r13
1454ba030:     	movq	%r13, 0x8b0(%rsi)
1454ba037:     	rolq	$0x2d, %r15
1454ba03b:     	movq	%r15, 0x8b8(%rsi)
1454ba042:     	movss	0x71d286(%rip), %xmm1   # 0x145bd72d0
1454ba04a:     	movss	0x485c22(%rip), %xmm2   # 0x14593fc74
1454ba052:     	movq	0x60(%rbp), %rcx
1454ba056:     	callq	0x14550d590 <.text+0x550c590>
1454ba05b:     	nop
1454ba05c:     	movq	%r14, %r15
1454ba05f:     	addq	%rbx, %rdi
1454ba062:     	rolq	$0x17, %rdi
1454ba066:     	addq	%rbx, %rdi
1454ba069:     	shrq	$0x3f, %rdi
1454ba06d:     	leaq	0x153bcfc(%rip), %rax   # 0x1469f5d70
1454ba074:     	addss	(%rax,%rdi,4), %xmm7
1454ba079:     	addss	%xmm0, %xmm7
1454ba07d:     	jmp	0x1454bab7e <.text+0x54b9b7e>
1454ba082:     	movsd	0xb4(%rbp), %xmm9
1454ba08b:     	movshdup	%xmm9, %xmm10           # xmm10 = xmm9[1,1,3,3]
1454ba090:     	movl	0xbc(%rbp), %r14d
1454ba097:     	xorl	%r15d, %r15d
1454ba09a:     	movss	0x48de4d(%rip), %xmm11  # 0x145947ef0
1454ba0a3:     	movss	0x1283e24(%rip), %xmm12 # 0x14673ded0
1454ba0ac:     	movss	0x44d3db(%rip), %xmm13  # 0x145907490
1454ba0b5:     	leaq	0xb0(%rbp), %rbx
1454ba0bc:     	movq	0x368(%rbp), %rsi
1454ba0c3:     	cmpq	%rdi, %r15
1454ba0c6:     	jae	0x1454ba1c7 <.text+0x54b91c7>
1454ba0cc:     	nopl	(%rax)
1454ba0d0:     	testq	%r15, %r15
1454ba0d3:     	js	0x1454ba0df <.text+0x54b90df>
1454ba0d5:     	xorps	%xmm6, %xmm6
1454ba0d8:     	cvtsi2ss	%r15, %xmm6
1454ba0dd:     	jmp	0x1454ba0fa <.text+0x54b90fa>
1454ba0df:     	movq	%r15, %rax
1454ba0e2:     	shrq	%rax
1454ba0e5:     	movl	%r15d, %ecx
1454ba0e8:     	andl	$0x1, %ecx
1454ba0eb:     	orq	%rax, %rcx
1454ba0ee:     	xorps	%xmm6, %xmm6
1454ba0f1:     	cvtsi2ss	%rcx, %xmm6
1454ba0f6:     	addss	%xmm6, %xmm6
1454ba0fa:     	xorps	%xmm7, %xmm7
1454ba0fd:     	sqrtss	%xmm6, %xmm7
1454ba101:     	mulss	%xmm11, %xmm6
1454ba106:     	mulss	%xmm12, %xmm7
1454ba10b:     	addss	%xmm13, %xmm7
1454ba110:     	movaps	%xmm6, %xmm0
1454ba113:     	callq	0x145773247 <.text+0x5772247>
1454ba118:     	movaps	%xmm0, %xmm8
1454ba11c:     	mulss	%xmm7, %xmm8
1454ba121:     	addss	%xmm9, %xmm8
1454ba126:     	movaps	%xmm6, %xmm0
1454ba129:     	callq	0x145773235 <.text+0x5772235>
1454ba12e:     	mulss	%xmm0, %xmm7
1454ba132:     	addss	%xmm10, %xmm7
1454ba137:     	movq	%rbx, %rcx
1454ba13a:     	movq	%rsi, %rdx
1454ba13d:     	movaps	%xmm8, %xmm2
1454ba141:     	movaps	%xmm7, %xmm3
1454ba144:     	callq	0x1454e3d20 <.text+0x54e2d20>
1454ba149:     	nop
1454ba14a:     	movl	0xb0(%rbp), %ecx
1454ba150:     	movl	%r14d, %eax
1454ba153:     	testl	%ecx, %ecx
1454ba155:     	je	0x1454ba15d <.text+0x54b915d>
1454ba157:     	movl	0xbc(%rbp), %eax
1454ba15d:     	movq	0xb4(%rbp), %xmm0
1454ba165:     	movd	%ecx, %xmm1
1454ba169:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454ba16e:     	pslld	$0x1f, %xmm1
1454ba173:     	psrad	$0x1f, %xmm1
1454ba178:     	pand	%xmm1, %xmm0
1454ba17c:     	pandn	%xmm9, %xmm1
1454ba181:     	por	%xmm0, %xmm1
1454ba185:     	movq	%xmm1, 0xb4(%rbp)
1454ba18d:     	movl	%eax, 0xbc(%rbp)
1454ba193:     	movl	$0x1, 0xb0(%rbp)
1454ba19d:     	movq	0x368(%rbp), %rcx
1454ba1a4:     	movq	0x348(%rbp), %rdx
1454ba1ab:     	movq	%rbx, %r8
1454ba1ae:     	callq	0x1454d4130 <.text+0x54d3130>
1454ba1b3:     	nop
1454ba1b4:     	incq	%r15
1454ba1b7:     	movq	0x368(%rbp), %rsi
1454ba1be:     	cmpq	%rdi, %r15
1454ba1c1:     	jb	0x1454ba0d0 <.text+0x54b90d0>
1454ba1c7:     	leaq	0x153cfa6(%rip), %rdi   # 0x1469f7174
1454ba1ce:     	movl	$0x11, %esi
1454ba1d3:     	movl	$0x11, %edx
1454ba1d8:     	movq	%rdi, %rcx
1454ba1db:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ba1e0:     	nop
1454ba1e1:     	jmp	0x1454baedd <.text+0x54b9edd>
1454ba1e6:     	movss	0x44f3f6(%rip), %xmm2   # 0x1459095e4
1454ba1ee:     	xorps	%xmm1, %xmm1
1454ba1f1:     	movq	0x60(%rbp), %rcx
1454ba1f5:     	callq	0x14550d590 <.text+0x550c590>
1454ba1fa:     	movss	%xmm0, 0x358(%rbp)
1454ba202:     	movq	0x318(%rbp), %rsi
1454ba209:     	testq	%rsi, %rsi
1454ba20c:     	js	0x1454ba6f8 <.text+0x54b96f8>
1454ba212:     	xorps	%xmm0, %xmm0
1454ba215:     	cvtsi2ss	%rsi, %xmm0
1454ba21a:     	jmp	0x1454ba712 <.text+0x54b9712>
1454ba21f:     	movq	%rdx, %rax
1454ba222:     	shrq	%rax
1454ba225:     	movl	%edx, %ecx
1454ba227:     	andl	$0x1, %ecx
1454ba22a:     	orq	%rax, %rcx
1454ba22d:     	xorps	%xmm0, %xmm0
1454ba230:     	cvtsi2ss	%rcx, %xmm0
1454ba235:     	addss	%xmm0, %xmm0
1454ba239:     	movss	%xmm0, 0x358(%rbp)
1454ba241:     	leaq	0x153bb20(%rip), %r15   # 0x1469f5d68
1454ba248:     	xorl	%edi, %edi
1454ba24a:     	movq	%rdx, 0x318(%rbp)
1454ba251:     	jmp	0x1454ba298 <.text+0x54b9298>
1454ba253:     	movlps	%xmm8, 0xb4(%rbp)
1454ba25b:     	movss	%xmm0, 0xbc(%rbp)
1454ba263:     	movl	$0x1, 0xb0(%rbp)
1454ba26d:     	movq	0x368(%rbp), %rcx
1454ba274:     	movq	0x348(%rbp), %rdx
1454ba27b:     	leaq	0xb0(%rbp), %r8
1454ba282:     	callq	0x1454d4130 <.text+0x54d3130>
1454ba287:     	nop
1454ba288:     	movss	0x4859df(%rip), %xmm12  # 0x14593fc70
1454ba291:     	movq	0x318(%rbp), %rdx
1454ba298:     	cmpq	%rdx, %r13
1454ba29b:     	jae	0x1454ba64a <.text+0x54b964a>
1454ba2a1:     	testq	%r13, %r13
1454ba2a4:     	js	0x1454ba2c0 <.text+0x54b92c0>
1454ba2a6:     	xorps	%xmm8, %xmm8
1454ba2aa:     	cvtsi2ss	%r13, %xmm8
1454ba2af:     	jmp	0x1454ba2dd <.text+0x54b92dd>
1454ba2b1:     	nopw	%cs:(%rax,%rax)
1454ba2c0:     	movq	%r13, %rax
1454ba2c3:     	shrq	%rax
1454ba2c6:     	movl	%r13d, %ecx
1454ba2c9:     	andl	$0x1, %ecx
1454ba2cc:     	orq	%rax, %rcx
1454ba2cf:     	xorps	%xmm8, %xmm8
1454ba2d3:     	cvtsi2ss	%rcx, %xmm8
1454ba2d8:     	addss	%xmm8, %xmm8
1454ba2dd:     	divss	0x358(%rbp), %xmm8
1454ba2e6:     	incq	%r13
1454ba2e9:     	mulss	0x44f2f2(%rip), %xmm8   # 0x1459095e4
1454ba2f2:     	movq	0x2a8(%rbp), %rax
1454ba2f9:     	movsd	(%rax), %xmm7
1454ba2fd:     	movaps	%xmm8, %xmm0
1454ba301:     	callq	0x145773247 <.text+0x5772247>
1454ba306:     	movaps	%xmm0, %xmm6
1454ba309:     	movaps	%xmm8, %xmm0
1454ba30d:     	callq	0x145773235 <.text+0x5772235>
1454ba312:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454ba315:     	jmp	0x1454ba341 <.text+0x54b9341>
1454ba317:     	nopw	(%rax,%rax)
1454ba320:     	movl	$0x0, 0xb0(%rbp)
1454ba32a:     	addss	0x491111(%rip), %xmm12  # 0x14594b444
1454ba333:     	ucomiss	0x45b599(%rip), %xmm12  # 0x1459158d4
1454ba33b:     	jb	0x1454ba288 <.text+0x54b9288>
1454ba341:     	movsldup	%xmm12, %xmm8           # xmm8 = xmm12[0,0,2,2]
1454ba346:     	mulps	%xmm6, %xmm8
1454ba34a:     	addps	%xmm7, %xmm8
1454ba34e:     	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454ba353:     	movq	0x368(%rbp), %rbx
1454ba35a:     	movq	0x228(%rbx), %rcx
1454ba361:     	movq	0x230(%rbx), %rdx
1454ba368:     	callq	0x145420480 <.text+0x541f480>
1454ba36d:     	imulq	$0xf0, %rax, %rsi
1454ba374:     	movss	0x400(%rbx), %xmm14
1454ba37d:     	movss	0x404(%rbx), %xmm13
1454ba386:     	movaps	%xmm8, %xmm0
1454ba38a:     	subss	0xc8(%rsi,%r12), %xmm0
1454ba394:     	movss	0x408(%rbx), %xmm11
1454ba39d:     	movaps	%xmm9, %xmm1
1454ba3a1:     	subss	0xcc(%rsi,%r12), %xmm1
1454ba3ab:     	callq	0x145773277 <.text+0x5772277>
1454ba3b0:     	movaps	%xmm0, %xmm10
1454ba3b4:     	movss	0xd8(%rsi,%r12), %xmm15
1454ba3be:     	movaps	%xmm15, %xmm0
1454ba3c2:     	addss	0x45e6b6(%rip), %xmm0   # 0x145918a80
1454ba3ca:     	ucomiss	%xmm0, %xmm10
1454ba3ce:     	ja	0x1454ba320 <.text+0x54b9320>
1454ba3d4:     	movq	0x368(%rbp), %rax
1454ba3db:     	movq	0x898(%rax), %rbx
1454ba3e2:     	leaq	0x10(%rbx), %rcx
1454ba3e6:     	movaps	%xmm8, %xmm1
1454ba3ea:     	movaps	%xmm9, %xmm2
1454ba3ee:     	callq	0x14552a140 <.text+0x5529140>
1454ba3f3:     	nop
1454ba3f4:     	testb	$0x1, %al
1454ba3f6:     	je	0x1454ba320 <.text+0x54b9320>
1454ba3fc:     	xorl	%eax, %eax
1454ba3fe:     	ucomiss	%xmm15, %xmm10
1454ba402:     	seta	%al
1454ba405:     	movaps	%xmm0, %xmm1
1454ba408:     	subss	%xmm11, %xmm1
1454ba40d:     	andps	0x45b36c(%rip), %xmm1   # 0x145915780
1454ba414:     	ucomiss	(%r15,%rax,4), %xmm1
1454ba419:     	ja	0x1454ba320 <.text+0x54b9320>
1454ba41f:     	cmpq	$-0x1, 0x40(%rbx)
1454ba424:     	je	0x1454ba253 <.text+0x54b9253>
1454ba42a:     	movsd	0x60(%rbx), %xmm2
1454ba42f:     	movaps	%xmm8, %xmm1
1454ba433:     	subps	%xmm2, %xmm1
1454ba436:     	movaps	%xmm1, %xmm2
1454ba439:     	xorps	%xmm3, %xmm3
1454ba43c:     	cmpltps	%xmm3, %xmm2
1454ba440:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454ba443:     	movmskpd	%xmm2, %eax
1454ba447:     	testl	%eax, %eax
1454ba449:     	jne	0x1454ba4fe <.text+0x54b94fe>
1454ba44f:     	movaps	%xmm1, %xmm2
1454ba452:     	movss	0x44cd86(%rip), %xmm3   # 0x1459071e0
1454ba45a:     	subss	%xmm3, %xmm2
1454ba45e:     	cvttss2si	%xmm2, %rcx
1454ba463:     	cvttss2si	%xmm1, %rdx
1454ba468:     	movq	%rdx, %rax
1454ba46b:     	sarq	$0x3f, %rax
1454ba46f:     	andq	%rcx, %rax
1454ba472:     	orq	%rdx, %rax
1454ba475:     	xorps	%xmm5, %xmm5
1454ba478:     	ucomiss	%xmm5, %xmm1
1454ba47b:     	cmovbq	%rdi, %rax
1454ba47f:     	movss	0x44cd5d(%rip), %xmm4   # 0x1459071e4
1454ba487:     	ucomiss	%xmm4, %xmm1
1454ba48a:     	movq	$-0x1, %r9
1454ba491:     	cmovaq	%r9, %rax
1454ba495:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454ba499:     	movaps	%xmm1, %xmm2
1454ba49c:     	subss	%xmm3, %xmm2
1454ba4a0:     	cvttss2si	%xmm2, %rcx
1454ba4a5:     	cvttss2si	%xmm1, %r8
1454ba4aa:     	movq	%r8, %rdx
1454ba4ad:     	sarq	$0x3f, %rdx
1454ba4b1:     	andq	%rcx, %rdx
1454ba4b4:     	orq	%r8, %rdx
1454ba4b7:     	ucomiss	%xmm5, %xmm1
1454ba4ba:     	cmovbq	%rdi, %rdx
1454ba4be:     	ucomiss	%xmm4, %xmm1
1454ba4c1:     	cmovaq	%r9, %rdx
1454ba4c5:     	movq	0x58(%rbx), %rcx
1454ba4c9:     	cmpq	%rcx, %rax
1454ba4cc:     	setae	%r8b
1454ba4d0:     	cmpq	%rcx, %rdx
1454ba4d3:     	setae	%r9b
1454ba4d7:     	orb	%r8b, %r9b
1454ba4da:     	jne	0x1454ba4fe <.text+0x54b94fe>
1454ba4dc:     	imulq	%rdx, %rcx
1454ba4e0:     	addq	%rax, %rcx
1454ba4e3:     	movq	0x50(%rbx), %rdx
1454ba4e7:     	cmpq	%rdx, %rcx
1454ba4ea:     	jae	0x1454bcb6b <.text+0x54bbb6b>
1454ba4f0:     	movq	0x48(%rbx), %rax
1454ba4f4:     	cmpb	$0x0, (%rax,%rcx)
1454ba4f8:     	jne	0x1454ba320 <.text+0x54b9320>
1454ba4fe:     	movq	0x368(%rbp), %rax
1454ba505:     	movq	0x8c0(%rax), %r14
1454ba50c:     	testq	%r14, %r14
1454ba50f:     	je	0x1454ba253 <.text+0x54b9253>
1454ba515:     	cmpq	$0x191, 0x30(%r14)      # imm = 0x191
1454ba51d:     	jb	0x1454ba253 <.text+0x54b9253>
1454ba523:     	movaps	%xmm8, %xmm2
1454ba527:     	subss	%xmm14, %xmm2
1454ba52c:     	movaps	%xmm9, %xmm1
1454ba530:     	subss	%xmm13, %xmm1
1454ba535:     	movaps	%xmm0, %xmm10
1454ba539:     	movaps	%xmm2, %xmm0
1454ba53c:     	callq	0x145773277 <.text+0x5772277>
1454ba541:     	movss	0x60(%rbx), %xmm3
1454ba546:     	movaps	%xmm8, %xmm2
1454ba54a:     	subss	%xmm3, %xmm2
1454ba54e:     	xorps	%xmm3, %xmm3
1454ba551:     	ucomiss	%xmm2, %xmm3
1454ba554:     	ja	0x1454ba320 <.text+0x54b9320>
1454ba55a:     	subss	0x64(%rbx), %xmm9
1454ba560:     	ucomiss	%xmm9, %xmm3
1454ba564:     	ja	0x1454ba320 <.text+0x54b9320>
1454ba56a:     	movaps	%xmm2, %xmm3
1454ba56d:     	movss	0x44cc6b(%rip), %xmm4   # 0x1459071e0
1454ba575:     	subss	%xmm4, %xmm3
1454ba579:     	cvttss2si	%xmm3, %rcx
1454ba57e:     	cvttss2si	%xmm2, %rdx
1454ba583:     	movq	%rdx, %rax
1454ba586:     	sarq	$0x3f, %rax
1454ba58a:     	andq	%rcx, %rax
1454ba58d:     	orq	%rdx, %rax
1454ba590:     	xorps	%xmm5, %xmm5
1454ba593:     	ucomiss	%xmm5, %xmm2
1454ba596:     	cmovbq	%rdi, %rax
1454ba59a:     	movss	0x44cc42(%rip), %xmm3   # 0x1459071e4
1454ba5a2:     	ucomiss	%xmm3, %xmm2
1454ba5a5:     	movq	$-0x1, %r9
1454ba5ac:     	cmovaq	%r9, %rax
1454ba5b0:     	movaps	%xmm9, %xmm2
1454ba5b4:     	subss	%xmm4, %xmm2
1454ba5b8:     	cvttss2si	%xmm2, %rcx
1454ba5bd:     	cvttss2si	%xmm9, %r8
1454ba5c2:     	movq	%r8, %rdx
1454ba5c5:     	sarq	$0x3f, %rdx
1454ba5c9:     	andq	%rcx, %rdx
1454ba5cc:     	orq	%r8, %rdx
1454ba5cf:     	ucomiss	%xmm5, %xmm9
1454ba5d3:     	cmovbq	%rdi, %rdx
1454ba5d7:     	ucomiss	%xmm3, %xmm9
1454ba5db:     	cmovaq	%r9, %rdx
1454ba5df:     	movq	0x58(%rbx), %rcx
1454ba5e3:     	cmpq	%rcx, %rax
1454ba5e6:     	jae	0x1454ba320 <.text+0x54b9320>
1454ba5ec:     	cmpq	%rcx, %rdx
1454ba5ef:     	jae	0x1454ba320 <.text+0x54b9320>
1454ba5f5:     	imulq	%rdx, %rcx
1454ba5f9:     	addq	%rax, %rcx
1454ba5fc:     	movq	0x20(%r14), %rdx
1454ba600:     	cmpq	%rdx, %rcx
1454ba603:     	jae	0x1454bcb9e <.text+0x54bbb9e>
1454ba609:     	movq	0x18(%r14), %rax
1454ba60d:     	movzwl	(%rax,%rcx,2), %eax
1454ba611:     	cmpw	$-0x1, %ax
1454ba615:     	je	0x1454ba320 <.text+0x54b9320>
1454ba61b:     	movaps	%xmm0, %xmm1
1454ba61e:     	movaps	%xmm10, %xmm0
1454ba622:     	movzwl	%ax, %eax
1454ba625:     	xorps	%xmm2, %xmm2
1454ba628:     	cvtsi2ss	%eax, %xmm2
1454ba62c:     	mulss	0x490da4(%rip), %xmm1   # 0x14594b3d8
1454ba634:     	addss	0x44ced4(%rip), %xmm1   # 0x145907510
1454ba63c:     	ucomiss	%xmm1, %xmm2
1454ba63f:     	ja	0x1454ba320 <.text+0x54b9320>
1454ba645:     	jmp	0x1454ba253 <.text+0x54b9253>
1454ba64a:     	leaq	0x153cabf(%rip), %rdi   # 0x1469f7110
1454ba651:     	movl	$0x14, %esi
1454ba656:     	movl	$0x14, %edx
1454ba65b:     	movq	%rdi, %rcx
1454ba65e:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ba663:     	nop
1454ba664:     	jmp	0x1454baedd <.text+0x54b9edd>
1454ba669:     	movq	0x328(%rbp), %r14
1454ba670:     	leaq	0x8(%r14), %r8
1454ba674:     	decq	%r9
1454ba677:     	movabsq	$0x1fffffffffffffff, %r10 # imm = 0x1FFFFFFFFFFFFFFF
1454ba681:     	andq	%r9, %r10
1454ba684:     	movq	(%r14), %rcx
1454ba687:     	movq	0x80(%rbp), %rdx
1454ba68e:     	jmp	0x1454ba69d <.text+0x54b969d>
1454ba690:     	addq	$0x8, %r8
1454ba694:     	decq	%r10
1454ba697:     	je	0x1454b9f6b <.text+0x54b8f6b>
1454ba69d:     	cmpq	%rdx, %rcx
1454ba6a0:     	jae	0x1454bcbe4 <.text+0x54bbbe4>
1454ba6a6:     	movq	(%r8), %rax
1454ba6a9:     	cmpq	%rdx, %rax
1454ba6ac:     	jae	0x1454bcbf6 <.text+0x54bbbf6>
1454ba6b2:     	leaq	(%rcx,%rcx,4), %r9
1454ba6b6:     	shlq	$0x4, %r9
1454ba6ba:     	leaq	(%rax,%rax,4), %r11
1454ba6be:     	shlq	$0x4, %r11
1454ba6c2:     	movq	0x298(%rbp), %rsi
1454ba6c9:     	movl	0x3c(%rsi,%r9), %r9d
1454ba6ce:     	movl	0x3c(%rsi,%r11), %r11d
1454ba6d3:     	movl	%r9d, %esi
1454ba6d6:     	sarl	$0x1f, %esi
1454ba6d9:     	shrl	%esi
1454ba6db:     	xorl	%r9d, %esi
1454ba6de:     	movl	%r11d, %r9d
1454ba6e1:     	sarl	$0x1f, %r9d
1454ba6e5:     	shrl	%r9d
1454ba6e8:     	xorl	%r11d, %r9d
1454ba6eb:     	cmpl	%r9d, %esi
1454ba6ee:     	jg	0x1454ba690 <.text+0x54b9690>
1454ba6f0:     	movq	%rax, %rcx
1454ba6f3:     	movq	%r8, %r14
1454ba6f6:     	jmp	0x1454ba690 <.text+0x54b9690>
1454ba6f8:     	movq	%rsi, %rax
1454ba6fb:     	shrq	%rax
1454ba6fe:     	movl	%esi, %ecx
1454ba700:     	andl	$0x1, %ecx
1454ba703:     	orq	%rax, %rcx
1454ba706:     	xorps	%xmm0, %xmm0
1454ba709:     	cvtsi2ss	%rcx, %xmm0
1454ba70e:     	addss	%xmm0, %xmm0
1454ba712:     	movss	%xmm0, 0x310(%rbp)
1454ba71a:     	movss	0x358(%rbp), %xmm0
1454ba722:     	addss	0x153b636(%rip), %xmm0  # 0x1469f5d60
1454ba72a:     	movss	%xmm0, 0x358(%rbp)
1454ba732:     	leaq	0x153b62f(%rip), %r14   # 0x1469f5d68
1454ba739:     	movq	$-0x1, %r15
1454ba740:     	xorl	%edi, %edi
1454ba742:     	jmp	0x1454ba780 <.text+0x54b9780>
1454ba744:     	movlps	%xmm8, 0xb4(%rbp)
1454ba74c:     	movss	%xmm0, 0xbc(%rbp)
1454ba754:     	movl	$0x1, 0xb0(%rbp)
1454ba75e:     	movq	0x368(%rbp), %rcx
1454ba765:     	movq	0x348(%rbp), %rdx
1454ba76c:     	leaq	0xb0(%rbp), %r8
1454ba773:     	callq	0x1454d4130 <.text+0x54d3130>
1454ba778:     	nop
1454ba779:     	movq	0x318(%rbp), %rsi
1454ba780:     	cmpq	%rsi, %rdi
1454ba783:     	jae	0x1454bab44 <.text+0x54b9b44>
1454ba789:     	testq	%rdi, %rdi
1454ba78c:     	js	0x1454ba7a0 <.text+0x54b97a0>
1454ba78e:     	xorps	%xmm8, %xmm8
1454ba792:     	cvtsi2ss	%rdi, %xmm8
1454ba797:     	jmp	0x1454ba7bc <.text+0x54b97bc>
1454ba799:     	nopl	(%rax)
1454ba7a0:     	movq	%rdi, %rax
1454ba7a3:     	shrq	%rax
1454ba7a6:     	movl	%edi, %ecx
1454ba7a8:     	andl	$0x1, %ecx
1454ba7ab:     	orq	%rax, %rcx
1454ba7ae:     	xorps	%xmm8, %xmm8
1454ba7b2:     	cvtsi2ss	%rcx, %xmm8
1454ba7b7:     	addss	%xmm8, %xmm8
1454ba7bc:     	incq	%rdi
1454ba7bf:     	addss	0x44ccd0(%rip), %xmm8   # 0x145907498
1454ba7c8:     	mulss	0x48d71f(%rip), %xmm8   # 0x145947ef0
1454ba7d1:     	divss	0x310(%rbp), %xmm8
1454ba7da:     	addss	0x358(%rbp), %xmm8
1454ba7e3:     	movq	0x2a8(%rbp), %rax
1454ba7ea:     	movsd	(%rax), %xmm12
1454ba7ef:     	movaps	%xmm8, %xmm0
1454ba7f3:     	callq	0x145773247 <.text+0x5772247>
1454ba7f8:     	movaps	%xmm0, %xmm7
1454ba7fb:     	movaps	%xmm8, %xmm0
1454ba7ff:     	callq	0x145773235 <.text+0x5772235>
1454ba804:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454ba807:     	movss	0x458ab0(%rip), %xmm13  # 0x1459132c0
1454ba810:     	jmp	0x1454ba841 <.text+0x54b9841>
1454ba812:     	nopw	%cs:(%rax,%rax)
1454ba820:     	movl	$0x0, 0xb0(%rbp)
1454ba82a:     	addss	0x490c11(%rip), %xmm13  # 0x14594b444
1454ba833:     	ucomiss	0x45afc5(%rip), %xmm13  # 0x145915800
1454ba83b:     	jb	0x1454ba779 <.text+0x54b9779>
1454ba841:     	movsldup	%xmm13, %xmm8           # xmm8 = xmm13[0,0,2,2]
1454ba846:     	mulps	%xmm7, %xmm8
1454ba84a:     	addps	%xmm12, %xmm8
1454ba84e:     	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454ba853:     	movq	0x368(%rbp), %rbx
1454ba85a:     	movq	0x228(%rbx), %rcx
1454ba861:     	movq	0x230(%rbx), %rdx
1454ba868:     	callq	0x145420480 <.text+0x541f480>
1454ba86d:     	imulq	$0xf0, %rax, %rsi
1454ba874:     	movss	0x400(%rbx), %xmm11
1454ba87d:     	movss	0x404(%rbx), %xmm6
1454ba885:     	movaps	%xmm8, %xmm0
1454ba889:     	subss	0xc8(%rsi,%r12), %xmm0
1454ba893:     	movss	0x408(%rbx), %xmm14
1454ba89c:     	movaps	%xmm9, %xmm1
1454ba8a0:     	subss	0xcc(%rsi,%r12), %xmm1
1454ba8aa:     	callq	0x145773277 <.text+0x5772277>
1454ba8af:     	movaps	%xmm0, %xmm10
1454ba8b3:     	movss	0xd8(%rsi,%r12), %xmm15
1454ba8bd:     	movaps	%xmm15, %xmm0
1454ba8c1:     	addss	0x45e1b7(%rip), %xmm0   # 0x145918a80
1454ba8c9:     	ucomiss	%xmm0, %xmm10
1454ba8cd:     	ja	0x1454ba820 <.text+0x54b9820>
1454ba8d3:     	movq	0x368(%rbp), %rax
1454ba8da:     	movq	0x898(%rax), %rbx
1454ba8e1:     	leaq	0x10(%rbx), %rcx
1454ba8e5:     	movaps	%xmm8, %xmm1
1454ba8e9:     	movaps	%xmm9, %xmm2
1454ba8ed:     	callq	0x14552a140 <.text+0x5529140>
1454ba8f2:     	nop
1454ba8f3:     	testb	$0x1, %al
1454ba8f5:     	je	0x1454ba820 <.text+0x54b9820>
1454ba8fb:     	xorl	%eax, %eax
1454ba8fd:     	ucomiss	%xmm15, %xmm10
1454ba901:     	seta	%al
1454ba904:     	movaps	%xmm0, %xmm1
1454ba907:     	subss	%xmm14, %xmm1
1454ba90c:     	andps	0x45ae6d(%rip), %xmm1   # 0x145915780
1454ba913:     	ucomiss	(%r14,%rax,4), %xmm1
1454ba918:     	ja	0x1454ba820 <.text+0x54b9820>
1454ba91e:     	cmpq	$-0x1, 0x40(%rbx)
1454ba923:     	je	0x1454ba744 <.text+0x54b9744>
1454ba929:     	movsd	0x60(%rbx), %xmm2
1454ba92e:     	movaps	%xmm8, %xmm1
1454ba932:     	subps	%xmm2, %xmm1
1454ba935:     	movaps	%xmm1, %xmm2
1454ba938:     	xorps	%xmm3, %xmm3
1454ba93b:     	cmpltps	%xmm3, %xmm2
1454ba93f:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454ba942:     	movmskpd	%xmm2, %eax
1454ba946:     	testl	%eax, %eax
1454ba948:     	jne	0x1454ba9fc <.text+0x54b99fc>
1454ba94e:     	movaps	%xmm1, %xmm2
1454ba951:     	movss	0x44c887(%rip), %xmm3   # 0x1459071e0
1454ba959:     	subss	%xmm3, %xmm2
1454ba95d:     	cvttss2si	%xmm2, %rcx
1454ba962:     	cvttss2si	%xmm1, %rdx
1454ba967:     	movq	%rdx, %rax
1454ba96a:     	sarq	$0x3f, %rax
1454ba96e:     	andq	%rcx, %rax
1454ba971:     	orq	%rdx, %rax
1454ba974:     	xorps	%xmm5, %xmm5
1454ba977:     	ucomiss	%xmm5, %xmm1
1454ba97a:     	movl	$0x0, %r9d
1454ba980:     	cmovbq	%r9, %rax
1454ba984:     	movss	0x44c858(%rip), %xmm4   # 0x1459071e4
1454ba98c:     	ucomiss	%xmm4, %xmm1
1454ba98f:     	cmovaq	%r15, %rax
1454ba993:     	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454ba997:     	movaps	%xmm1, %xmm2
1454ba99a:     	subss	%xmm3, %xmm2
1454ba99e:     	cvttss2si	%xmm2, %rcx
1454ba9a3:     	cvttss2si	%xmm1, %r8
1454ba9a8:     	movq	%r8, %rdx
1454ba9ab:     	sarq	$0x3f, %rdx
1454ba9af:     	andq	%rcx, %rdx
1454ba9b2:     	orq	%r8, %rdx
1454ba9b5:     	ucomiss	%xmm5, %xmm1
1454ba9b8:     	cmovbq	%r9, %rdx
1454ba9bc:     	ucomiss	%xmm4, %xmm1
1454ba9bf:     	cmovaq	%r15, %rdx
1454ba9c3:     	movq	0x58(%rbx), %rcx
1454ba9c7:     	cmpq	%rcx, %rax
1454ba9ca:     	setae	%r8b
1454ba9ce:     	cmpq	%rcx, %rdx
1454ba9d1:     	setae	%r9b
1454ba9d5:     	orb	%r8b, %r9b
1454ba9d8:     	jne	0x1454ba9fc <.text+0x54b99fc>
1454ba9da:     	imulq	%rdx, %rcx
1454ba9de:     	addq	%rax, %rcx
1454ba9e1:     	movq	0x50(%rbx), %rdx
1454ba9e5:     	cmpq	%rdx, %rcx
1454ba9e8:     	jae	0x1454bcb7d <.text+0x54bbb7d>
1454ba9ee:     	movq	0x48(%rbx), %rax
1454ba9f2:     	cmpb	$0x0, (%rax,%rcx)
1454ba9f6:     	jne	0x1454ba820 <.text+0x54b9820>
1454ba9fc:     	movq	0x368(%rbp), %rax
1454baa03:     	movq	0x8c0(%rax), %r13
1454baa0a:     	testq	%r13, %r13
1454baa0d:     	je	0x1454ba744 <.text+0x54b9744>
1454baa13:     	cmpq	$0x191, 0x30(%r13)      # imm = 0x191
1454baa1b:     	jb	0x1454ba744 <.text+0x54b9744>
1454baa21:     	movaps	%xmm8, %xmm2
1454baa25:     	subss	%xmm11, %xmm2
1454baa2a:     	movaps	%xmm9, %xmm1
1454baa2e:     	subss	%xmm6, %xmm1
1454baa32:     	movaps	%xmm0, %xmm6
1454baa35:     	movaps	%xmm2, %xmm0
1454baa38:     	callq	0x145773277 <.text+0x5772277>
1454baa3d:     	movss	0x60(%rbx), %xmm3
1454baa42:     	movaps	%xmm8, %xmm2
1454baa46:     	subss	%xmm3, %xmm2
1454baa4a:     	xorps	%xmm3, %xmm3
1454baa4d:     	ucomiss	%xmm2, %xmm3
1454baa50:     	ja	0x1454ba820 <.text+0x54b9820>
1454baa56:     	subss	0x64(%rbx), %xmm9
1454baa5c:     	ucomiss	%xmm9, %xmm3
1454baa60:     	ja	0x1454ba820 <.text+0x54b9820>
1454baa66:     	movaps	%xmm2, %xmm3
1454baa69:     	movss	0x44c76f(%rip), %xmm4   # 0x1459071e0
1454baa71:     	subss	%xmm4, %xmm3
1454baa75:     	cvttss2si	%xmm3, %rcx
1454baa7a:     	cvttss2si	%xmm2, %rdx
1454baa7f:     	movq	%rdx, %rax
1454baa82:     	sarq	$0x3f, %rax
1454baa86:     	andq	%rcx, %rax
1454baa89:     	orq	%rdx, %rax
1454baa8c:     	xorps	%xmm5, %xmm5
1454baa8f:     	ucomiss	%xmm5, %xmm2
1454baa92:     	movl	$0x0, %r9d
1454baa98:     	cmovbq	%r9, %rax
1454baa9c:     	movss	0x44c740(%rip), %xmm3   # 0x1459071e4
1454baaa4:     	ucomiss	%xmm3, %xmm2
1454baaa7:     	cmovaq	%r15, %rax
1454baaab:     	movaps	%xmm9, %xmm2
1454baaaf:     	subss	%xmm4, %xmm2
1454baab3:     	cvttss2si	%xmm2, %rcx
1454baab8:     	cvttss2si	%xmm9, %r8
1454baabd:     	movq	%r8, %rdx
1454baac0:     	sarq	$0x3f, %rdx
1454baac4:     	andq	%rcx, %rdx
1454baac7:     	orq	%r8, %rdx
1454baaca:     	ucomiss	%xmm5, %xmm9
1454baace:     	cmovbq	%r9, %rdx
1454baad2:     	ucomiss	%xmm3, %xmm9
1454baad6:     	cmovaq	%r15, %rdx
1454baada:     	movq	0x58(%rbx), %rcx
1454baade:     	cmpq	%rcx, %rax
1454baae1:     	jae	0x1454ba820 <.text+0x54b9820>
1454baae7:     	cmpq	%rcx, %rdx
1454baaea:     	jae	0x1454ba820 <.text+0x54b9820>
1454baaf0:     	imulq	%rdx, %rcx
1454baaf4:     	addq	%rax, %rcx
1454baaf7:     	movq	0x20(%r13), %rdx
1454baafb:     	cmpq	%rdx, %rcx
1454baafe:     	jae	0x1454bcbb0 <.text+0x54bbbb0>
1454bab04:     	movq	0x18(%r13), %rax
1454bab08:     	movzwl	(%rax,%rcx,2), %eax
1454bab0c:     	cmpw	$-0x1, %ax
1454bab10:     	je	0x1454ba820 <.text+0x54b9820>
1454bab16:     	movaps	%xmm0, %xmm1
1454bab19:     	movaps	%xmm6, %xmm0
1454bab1c:     	movzwl	%ax, %eax
1454bab1f:     	xorps	%xmm2, %xmm2
1454bab22:     	cvtsi2ss	%eax, %xmm2
1454bab26:     	mulss	0x4908aa(%rip), %xmm1   # 0x14594b3d8
1454bab2e:     	addss	0x44c9da(%rip), %xmm1   # 0x145907510
1454bab36:     	ucomiss	%xmm1, %xmm2
1454bab39:     	ja	0x1454ba820 <.text+0x54b9820>
1454bab3f:     	jmp	0x1454ba744 <.text+0x54b9744>
1454bab44:     	leaq	0x153c610(%rip), %rdi   # 0x1469f715b
1454bab4b:     	movl	$0x19, %esi
1454bab50:     	movl	$0x19, %edx
1454bab55:     	movq	%rdi, %rcx
1454bab58:     	callq	0x145457cb0 <.text+0x5456cb0>
1454bab5d:     	nop
1454bab5e:     	jmp	0x1454baedd <.text+0x54b9edd>
1454bab63:     	movss	0x44ea79(%rip), %xmm2   # 0x1459095e4
1454bab6b:     	xorps	%xmm1, %xmm1
1454bab6e:     	movq	0x60(%rbp), %rcx
1454bab72:     	callq	0x14550d590 <.text+0x550c590>
1454bab77:     	nop
1454bab78:     	movaps	%xmm0, %xmm7
1454bab7b:     	movq	%r14, %r15
1454bab7e:     	movss	0x48d349(%rip), %xmm8   # 0x145947ed0
1454bab87:     	addss	%xmm7, %xmm8
1454bab8c:     	movq	0x368(%rbp), %r13
1454bab93:     	movss	0x400(%r13), %xmm9
1454bab9c:     	movss	0x404(%r13), %xmm10
1454baba5:     	movaps	%xmm8, %xmm0
1454baba9:     	callq	0x145773247 <.text+0x5772247>
1454babae:     	movaps	%xmm0, %xmm6
1454babb1:     	movaps	%xmm8, %xmm0
1454babb5:     	callq	0x145773235 <.text+0x5772235>
1454babba:     	movaps	%xmm0, %xmm8
1454babbe:     	movss	0x484db9(%rip), %xmm11  # 0x14593f980
1454babc7:     	leaq	0xb0(%rbp), %rbx
1454babce:     	movss	0x49086d(%rip), %xmm12  # 0x14594b444
1454babd7:     	movss	0x45acd8(%rip), %xmm13  # 0x1459158b8
1454babe0:     	movaps	%xmm6, %xmm2
1454babe3:     	mulss	%xmm11, %xmm2
1454babe8:     	addss	%xmm9, %xmm2
1454babed:     	movaps	%xmm8, %xmm3
1454babf1:     	mulss	%xmm11, %xmm3
1454babf6:     	addss	%xmm10, %xmm3
1454babfb:     	movq	%rbx, %rcx
1454babfe:     	movq	%r13, %rdx
1454bac01:     	callq	0x1454e3d20 <.text+0x54e2d20>
1454bac06:     	nop
1454bac07:     	cmpb	$0x0, 0xb0(%rbp)
1454bac0e:     	jne	0x1454bac27 <.text+0x54b9c27>
1454bac10:     	addss	%xmm12, %xmm11
1454bac15:     	ucomiss	%xmm13, %xmm11
1454bac19:     	movq	0x368(%rbp), %r13
1454bac20:     	jae	0x1454babe0 <.text+0x54b9be0>
1454bac22:     	jmp	0x1454bb01d <.text+0x54ba01d>
1454bac27:     	movss	0xb4(%rbp), %xmm9
1454bac30:     	movss	0xb8(%rbp), %xmm10
1454bac39:     	movaps	%xmm7, %xmm0
1454bac3c:     	callq	0x145773247 <.text+0x5772247>
1454bac41:     	movaps	%xmm0, %xmm6
1454bac44:     	movaps	%xmm7, %xmm0
1454bac47:     	callq	0x145773235 <.text+0x5772235>
1454bac4c:     	movaps	%xmm9, %xmm2
1454bac50:     	movq	0x368(%rbp), %rsi
1454bac57:     	subss	0x400(%rsi), %xmm2
1454bac5f:     	movaps	%xmm0, %xmm7
1454bac62:     	movaps	%xmm10, %xmm1
1454bac66:     	subss	0x404(%rsi), %xmm1
1454bac6e:     	movaps	%xmm2, %xmm0
1454bac71:     	callq	0x145773277 <.text+0x5772277>
1454bac76:     	movq	0x348(%rbp), %rcx
1454bac7d:     	cmpq	0x80(%rbp), %rcx
1454bac84:     	jae	0x1454bcd24 <.text+0x54bbd24>
1454bac8a:     	movaps	%xmm0, %xmm8
1454bac8e:     	addss	%xmm0, %xmm8
1454bac93:     	addss	0x44c874(%rip), %xmm8   # 0x145907510
1454bac9c:     	leaq	(%rcx,%rcx,4), %rax
1454baca0:     	shlq	$0x4, %rax
1454baca4:     	movq	0x298(%rbp), %rcx
1454bacab:     	movss	0x3c(%rcx,%rax), %xmm1
1454bacb1:     	movzwl	0x24e(%rsi), %eax
1454bacb8:     	xorps	%xmm0, %xmm0
1454bacbb:     	cvtsi2ss	%eax, %xmm0
1454bacbf:     	mulss	0x58c8b1(%rip), %xmm1   # 0x145a47578
1454bacc7:     	divss	0x44c86d(%rip), %xmm0   # 0x14590753c
1454baccf:     	mulss	%xmm1, %xmm0
1454bacd3:     	mulss	0x45da15(%rip), %xmm0   # 0x1459186f0
1454bacdb:     	movq	%r15, %rax
1454bacde:     	shrq	%rax
1454bace1:     	movq	%r15, %rdi
1454bace4:     	subq	%rax, %rdi
1454bace7:     	js	0x1454bacf4 <.text+0x54b9cf4>
1454bace9:     	xorps	%xmm11, %xmm11
1454baced:     	cvtsi2ss	%rdi, %xmm11
1454bacf2:     	jmp	0x1454bad10 <.text+0x54b9d10>
1454bacf4:     	movq	%rdi, %rax
1454bacf7:     	shrq	%rax
1454bacfa:     	movl	%edi, %ecx
1454bacfc:     	andl	$0x1, %ecx
1454bacff:     	orq	%rax, %rcx
1454bad02:     	xorps	%xmm11, %xmm11
1454bad06:     	cvtsi2ss	%rcx, %xmm11
1454bad0b:     	addss	%xmm11, %xmm11
1454bad10:     	addss	0x44c7f3(%rip), %xmm11  # 0x14590750c
1454bad19:     	mulss	0x44c776(%rip), %xmm11  # 0x145907498
1454bad22:     	movaps	%xmm6, %xmm1
1454bad25:     	unpcklps	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
1454bad28:     	movsldup	%xmm8, %xmm12           # xmm12 = xmm8[0,0,2,2]
1454bad2d:     	mulps	%xmm1, %xmm12
1454bad31:     	maxss	0x44c757(%rip), %xmm0   # 0x145907490
1454bad39:     	divss	%xmm0, %xmm8
1454bad3e:     	xorl	%ebx, %ebx
1454bad40:     	movss	0x45ab73(%rip), %xmm13  # 0x1459158bc
1454bad49:     	leaq	0x220(%rbp), %r14
1454bad50:     	cmpq	%r15, %rbx
1454bad53:     	jae	0x1454baec3 <.text+0x54b9ec3>
1454bad59:     	movq	%rbx, %rax
1454bad5c:     	orq	%rdi, %rax
1454bad5f:     	shrq	$0x20, %rax
1454bad63:     	je	0x1454bad7c <.text+0x54b9d7c>
1454bad65:     	movq	%rbx, %rax
1454bad68:     	xorl	%edx, %edx
1454bad6a:     	divq	%rdi
1454bad6d:     	testq	%rax, %rax
1454bad70:     	js	0x1454bad87 <.text+0x54b9d87>
1454bad72:     	xorps	%xmm0, %xmm0
1454bad75:     	cvtsi2ss	%rax, %xmm0
1454bad7a:     	jmp	0x1454bad9f <.text+0x54b9d9f>
1454bad7c:     	movl	%ebx, %eax
1454bad7e:     	xorl	%edx, %edx
1454bad80:     	divl	%edi
1454bad82:     	testq	%rax, %rax
1454bad85:     	jns	0x1454bad72 <.text+0x54b9d72>
1454bad87:     	movq	%rax, %rcx
1454bad8a:     	shrq	%rcx
1454bad8d:     	andl	$0x1, %eax
1454bad90:     	orq	%rcx, %rax
1454bad93:     	xorps	%xmm0, %xmm0
1454bad96:     	cvtsi2ss	%rax, %xmm0
1454bad9b:     	addss	%xmm0, %xmm0
1454bad9f:     	xorps	%xmm3, %xmm3
1454bada2:     	cvtsi2ss	%rdx, %xmm3
1454bada7:     	subss	%xmm11, %xmm3
1454badac:     	mulss	%xmm13, %xmm3
1454badb1:     	movaps	%xmm7, %xmm1
1454badb4:     	mulss	%xmm3, %xmm1
1454badb8:     	movaps	%xmm9, %xmm2
1454badbc:     	subss	%xmm1, %xmm2
1454badc0:     	movaps	%xmm6, %xmm1
1454badc3:     	mulss	%xmm0, %xmm1
1454badc7:     	movss	0x45852d(%rip), %xmm4   # 0x1459132fc
1454badcf:     	mulss	%xmm4, %xmm1
1454badd3:     	subss	%xmm1, %xmm2
1454badd7:     	mulss	%xmm6, %xmm3
1454baddb:     	addss	%xmm10, %xmm3
1454bade0:     	mulss	%xmm7, %xmm0
1454bade4:     	mulss	%xmm4, %xmm0
1454bade8:     	subss	%xmm0, %xmm3
1454badec:     	movq	%r14, %rcx
1454badef:     	movq	%rsi, %rdx
1454badf2:     	callq	0x1454e3d20 <.text+0x54e2d20>
1454badf7:     	nop
1454badf8:     	incq	%rbx
1454badfb:     	cmpl	$0x1, 0x220(%rbp)
1454bae02:     	movq	0x368(%rbp), %rsi
1454bae09:     	jne	0x1454bad50 <.text+0x54b9d50>
1454bae0f:     	movsd	0x224(%rbp), %xmm14
1454bae18:     	movq	%rsi, %rcx
1454bae1b:     	movq	0x348(%rbp), %rdx
1454bae22:     	movq	%r14, %r8
1454bae25:     	callq	0x1454d4130 <.text+0x54d3130>
1454bae2a:     	nop
1454bae2b:     	cmpq	$0x1, %rax
1454bae2f:     	movq	0x368(%rbp), %rsi
1454bae36:     	jne	0x1454bad50 <.text+0x54b9d50>
1454bae3c:     	addps	%xmm12, %xmm14
1454bae40:     	movss	0x934(%rsi), %xmm0
1454bae48:     	addss	%xmm8, %xmm0
1454bae4d:     	addss	0x4584a7(%rip), %xmm0   # 0x1459132fc
1454bae55:     	movq	0x4e0(%rsi), %rax
1454bae5c:     	imulq	$0x160, 0x4e8(%rsi), %r8 # imm = 0x160
1454bae67:     	xorl	%ecx, %ecx
1454bae69:     	movq	%rax, %r9
1454bae6c:     	nopl	(%rax)
1454bae70:     	cmpq	%rcx, %r8
1454bae73:     	je	0x1454bad50 <.text+0x54b9d50>
1454bae79:     	addq	$0x160, %rcx            # imm = 0x160
1454bae80:     	cmpq	%rdx, 0x88(%r9)
1454bae87:     	leaq	0x160(%r9), %r9
1454bae8e:     	jne	0x1454bae70 <.text+0x54b9e70>
1454bae90:     	movl	$0x1, -0xe8(%rax,%rcx)
1454bae9b:     	movlps	%xmm14, -0xe4(%rax,%rcx)
1454baea4:     	movss	%xmm0, -0xdc(%rax,%rcx)
1454baead:     	movq	0xa8(%rbp), %rdx
1454baeb4:     	movss	(%rdx), %xmm0
1454baeb8:     	movss	%xmm0, -0x34(%rax,%rcx)
1454baebe:     	jmp	0x1454bad50 <.text+0x54b9d50>
1454baec3:     	leaq	0x153c276(%rip), %rdi   # 0x1469f7140
1454baeca:     	movl	$0x1b, %esi
1454baecf:     	movl	$0x1b, %edx
1454baed4:     	movq	%rdi, %rcx
1454baed7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454baedc:     	nop
1454baedd:     	movq	%rdx, %r14
1454baee0:     	testq	%rax, %rax
1454baee3:     	cmoveq	%rsi, %r14
1454baee7:     	cmovneq	%rax, %rdi
1454baeeb:     	movq	0x80(%rbp), %rdx
1454baef2:     	movq	0x348(%rbp), %rcx
1454baef9:     	cmpq	%rdx, %rcx
1454baefc:     	jae	0x1454bcce6 <.text+0x54bbce6>
1454baf02:     	leaq	(%rcx,%rcx,4), %rsi
1454baf06:     	shlq	$0x4, %rsi
1454baf0a:     	movq	0x298(%rbp), %rax
1454baf11:     	addq	%rsi, %rax
1454baf14:     	addq	$0x20, %rax
1454baf18:     	movq	%rax, 0x240(%rbp)
1454baf1f:     	leaq	0x27f52a(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454baf26:     	movq	%rax, 0x248(%rbp)
1454baf2d:     	leaq	0x12709e4(%rip), %rdx   # 0x14672b918
1454baf34:     	leaq	0xb0(%rbp), %rcx
1454baf3b:     	leaq	0x240(%rbp), %r8
1454baf42:     	callq	0x145728390 <.text+0x5727390>
1454baf47:     	nop
1454baf48:     	movq	%rdi, 0x358(%rbp)
1454baf4f:     	movq	0x298(%rbp), %rax
1454baf56:     	addq	%rsi, %rax
1454baf59:     	movq	0xb8(%rbp), %rcx
1454baf60:     	movq	0xc0(%rbp), %rdx
1454baf67:     	movq	0x10(%rax), %r15
1454baf6b:     	movq	0x18(%rax), %rbx
1454baf6f:     	movq	%rcx, 0x348(%rbp)
1454baf76:     	callq	0x145457cb0 <.text+0x5456cb0>
1454baf7b:     	nop
1454baf7c:     	movq	%rax, %rdi
1454baf7f:     	movq	%rdx, %r13
1454baf82:     	movq	0xb0(%rbp), %rdx
1454baf89:     	testq	%rdx, %rdx
1454baf8c:     	je	0x1454bafa0 <.text+0x54b9fa0>
1454baf8e:     	movl	$0x1, %r8d
1454baf94:     	movq	0x348(%rbp), %rcx
1454baf9b:     	callq	0x1400021d0 <.text+0x11d0>
1454bafa0:     	testq	%rdi, %rdi
1454bafa3:     	cmovneq	%rdi, %r15
1454bafa7:     	cmoveq	%rbx, %r13
1454bafab:     	movq	%r14, 0x20(%rsp)
1454bafb0:     	leaq	0xb0(%rbp), %rcx
1454bafb7:     	movq	%r15, %rdx
1454bafba:     	movq	%r13, %r8
1454bafbd:     	movq	0x358(%rbp), %r9
1454bafc4:     	callq	0x145459d40 <.text+0x5458d40>
1454bafc9:     	nop
1454bafca:     	movq	0x368(%rbp), %r13
1454bafd1:     	movq	0x560(%r13), %rsi
1454bafd8:     	cmpq	0x550(%r13), %rsi
1454bafdf:     	jne	0x1454bafee <.text+0x54b9fee>
1454bafe1:     	movq	0x340(%rbp), %rcx
1454bafe8:     	callq	0x145774710 <.text+0x5773710>
1454bafed:     	nop
1454bafee:     	movq	0x558(%r13), %rax
1454baff5:     	movq	%rsi, %rcx
1454baff8:     	shlq	$0x5, %rcx
1454baffc:     	movups	0xb0(%rbp), %xmm0
1454bb003:     	movups	0xc0(%rbp), %xmm1
1454bb00a:     	movups	%xmm1, 0x10(%rax,%rcx)
1454bb00f:     	movups	%xmm0, (%rax,%rcx)
1454bb013:     	incq	%rsi
1454bb016:     	movq	%rsi, 0x560(%r13)
1454bb01d:     	movq	0x238(%rbp), %rdx
1454bb024:     	testq	%rdx, %rdx
1454bb027:     	movq	0x328(%rbp), %rcx
1454bb02e:     	je	0x1454bb03f <.text+0x54ba03f>
1454bb030:     	shlq	$0x3, %rdx
1454bb034:     	movl	$0x8, %r8d
1454bb03a:     	callq	0x1400021d0 <.text+0x11d0>
1454bb03f:     	movq	0x2b8(%rbp), %rdx
1454bb046:     	testq	%rdx, %rdx
1454bb049:     	je	0x1454bb05d <.text+0x54ba05d>
1454bb04b:     	movl	$0x1, %r8d
1454bb051:     	movq	0x2a0(%rbp), %rcx
1454bb058:     	callq	0x1400021d0 <.text+0x11d0>
1454bb05d:     	movq	0xa8(%rbp), %rax
1454bb064:     	movss	(%rax), %xmm0
1454bb068:     	movss	0x68(%rbp), %xmm6
1454bb06d:     	mulss	0x5a37df(%rip), %xmm6   # 0x145a5e854
1454bb075:     	addss	0x45a827(%rip), %xmm6   # 0x1459158a4
1454bb07d:     	maxss	0x529963(%rip), %xmm6   # 0x1459e49e8
1454bb085:     	addss	%xmm0, %xmm6
1454bb089:     	movss	%xmm6, 0x964(%r13)
1454bb092:     	movq	0x8d0(%r13), %rax
1454bb099:     	cmpq	$0x5, %rax
1454bb09d:     	jae	0x1454bb0e7 <.text+0x54ba0e7>
1454bb09f:     	movq	0x338(%rbp), %rcx
1454bb0a6:     	movq	0x88(%rcx), %rdx
1454bb0ad:     	imulq	$0x58, %rax, %rcx
1454bb0b1:     	movss	0x68(%rbp), %xmm1
1454bb0b6:     	ucomiss	0x40(%rdx,%rcx), %xmm1
1454bb0bb:     	jb	0x1454bb1b6 <.text+0x54ba1b6>
1454bb0c1:     	addq	%rcx, %rdx
1454bb0c4:     	incq	%rax
1454bb0c7:     	movq	%rax, 0x8d0(%r13)
1454bb0ce:     	movq	%r13, %rcx
1454bb0d1:     	callq	0x1454d11f0 <.text+0x54d01f0>
1454bb0d6:     	nop
1454bb0d7:     	movq	0xa8(%rbp), %rax
1454bb0de:     	movss	(%rax), %xmm0
1454bb0e2:     	jmp	0x1454bb1b6 <.text+0x54ba1b6>
1454bb0e7:     	cmpb	$0x0, 0x9aa(%r13)
1454bb0ef:     	je	0x1454bb1b6 <.text+0x54ba1b6>
1454bb0f5:     	ucomiss	0x984(%r13), %xmm0
1454bb0fd:     	jb	0x1454bb1b6 <.text+0x54ba1b6>
1454bb103:     	movq	0x8a0(%r13), %r9
1454bb10a:     	movq	0x8a8(%r13), %rcx
1454bb111:     	movq	0x8b8(%r13), %r10
1454bb118:     	movq	0x8b0(%r13), %r8
1454bb11f:     	movl	$0x5, %r11d
1454bb125:     	nopw	%cs:(%rax,%rax)
1454bb130:     	leaq	(%r9,%r10), %rax
1454bb134:     	rolq	$0x17, %rax
1454bb138:     	addq	%r9, %rax
1454bb13b:     	movq	%rcx, %rdx
1454bb13e:     	shlq	$0x11, %rdx
1454bb142:     	xorq	%r9, %r8
1454bb145:     	xorq	%rcx, %r10
1454bb148:     	xorq	%r8, %rcx
1454bb14b:     	xorq	%r10, %r9
1454bb14e:     	rolq	$0x2d, %r10
1454bb152:     	xorq	%rdx, %r8
1454bb155:     	mulq	%r11
1454bb158:     	shrq	$0x3d, %rax
1454bb15c:     	cmpl	$0x4, %eax
1454bb15f:     	ja	0x1454bb130 <.text+0x54ba130>
1454bb161:     	movq	%r9, 0x8a0(%r13)
1454bb168:     	movq	%r10, 0x8b8(%r13)
1454bb16f:     	movq	%rcx, 0x8a8(%r13)
1454bb176:     	movq	%r8, 0x8b0(%r13)
1454bb17d:     	imulq	$0x58, %rdx, %rdx
1454bb181:     	movq	0x338(%rbp), %rax
1454bb188:     	addq	0x88(%rax), %rdx
1454bb18f:     	movq	%r13, %rcx
1454bb192:     	callq	0x1454d11f0 <.text+0x54d01f0>
1454bb197:     	nop
1454bb198:     	movss	0x934(%r13), %xmm0
1454bb1a1:     	movss	0x5298db(%rip), %xmm1   # 0x1459e4a84
1454bb1a9:     	addss	%xmm0, %xmm1
1454bb1ad:     	movss	%xmm1, 0x984(%r13)
1454bb1b6:     	ucomiss	0x978(%r13), %xmm0
1454bb1be:     	jb	0x1454bb3be <.text+0x54ba3be>
1454bb1c4:     	movss	0x72df64(%rip), %xmm1   # 0x145be9130
1454bb1cc:     	addss	%xmm0, %xmm1
1454bb1d0:     	movss	%xmm1, 0x978(%r13)
1454bb1d9:     	movq	0x548(%r13), %rax
1454bb1e0:     	testq	%rax, %rax
1454bb1e3:     	je	0x1454bb2ef <.text+0x54ba2ef>
1454bb1e9:     	movq	0x540(%r13), %rcx
1454bb1f0:     	cmpq	$0x4, %rax
1454bb1f4:     	jae	0x1454bb200 <.text+0x54ba200>
1454bb1f6:     	xorl	%edx, %edx
1454bb1f8:     	xorl	%r8d, %r8d
1454bb1fb:     	jmp	0x1454bb2c1 <.text+0x54ba2c1>
1454bb200:     	movq	%rax, %rdx
1454bb203:     	andq	$-0x4, %rdx
1454bb207:     	leaq	0xf8(%rcx), %r8
1454bb20e:     	xorps	%xmm1, %xmm1
1454bb211:     	movdqa	0x153ab67(%rip), %xmm2  # 0x1469f5d80
1454bb219:     	movdqa	0x45d81f(%rip), %xmm3   # 0x145918a40
1454bb221:     	movdqa	0x153ab67(%rip), %xmm4  # 0x1469f5d90
1454bb229:     	movdqa	0x45a6cf(%rip), %xmm5   # 0x145915900
1454bb231:     	movq	%rdx, %r9
1454bb234:     	xorps	%xmm6, %xmm6
1454bb237:     	nopw	(%rax,%rax)
1454bb240:     	movd	-0x90(%r8), %xmm7
1454bb249:     	movd	-0xd8(%r8), %xmm8
1454bb252:     	punpcklqdq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0]
1454bb257:     	movd	(%r8), %xmm7
1454bb25c:     	movd	-0x48(%r8), %xmm9
1454bb262:     	punpcklqdq	%xmm7, %xmm9    # xmm9 = xmm9[0],xmm7[0]
1454bb267:     	paddd	%xmm2, %xmm8
1454bb26c:     	pxor	%xmm3, %xmm8
1454bb271:     	movdqa	%xmm4, %xmm7
1454bb275:     	pcmpgtd	%xmm8, %xmm7
1454bb27a:     	pand	%xmm5, %xmm7
1454bb27e:     	paddq	%xmm7, %xmm6
1454bb282:     	paddd	%xmm2, %xmm9
1454bb287:     	pxor	%xmm3, %xmm9
1454bb28c:     	movdqa	%xmm4, %xmm7
1454bb290:     	pcmpgtd	%xmm9, %xmm7
1454bb295:     	pand	%xmm5, %xmm7
1454bb299:     	paddq	%xmm7, %xmm1
1454bb29d:     	addq	$0x120, %r8             # imm = 0x120
1454bb2a4:     	addq	$-0x4, %r9
1454bb2a8:     	jne	0x1454bb240 <.text+0x54ba240>
1454bb2aa:     	paddq	%xmm6, %xmm1
1454bb2ae:     	pshufd	$0xee, %xmm1, %xmm2     # xmm2 = xmm1[2,3,2,3]
1454bb2b3:     	paddq	%xmm1, %xmm2
1454bb2b7:     	movq	%xmm2, %r8
1454bb2bc:     	cmpq	%rdx, %rax
1454bb2bf:     	je	0x1454bb2e5 <.text+0x54ba2e5>
1454bb2c1:     	subq	%rdx, %rax
1454bb2c4:     	leaq	(%rdx,%rdx,8), %rdx
1454bb2c8:     	leaq	(%rcx,%rdx,8), %rcx
1454bb2cc:     	addq	$0x20, %rcx
1454bb2d0:     	movl	(%rcx), %edx
1454bb2d2:     	addl	$-0x3, %edx
1454bb2d5:     	cmpl	$0x3, %edx
1454bb2d8:     	adcq	$0x0, %r8
1454bb2dc:     	addq	$0x48, %rcx
1454bb2e0:     	decq	%rax
1454bb2e3:     	jne	0x1454bb2d0 <.text+0x54ba2d0>
1454bb2e5:     	cmpq	$0x1, %r8
1454bb2e9:     	ja	0x1454bb3be <.text+0x54ba3be>
1454bb2ef:     	movq	0x8a0(%r13), %rdx
1454bb2f6:     	movq	0x8a8(%r13), %rax
1454bb2fd:     	movq	0x8b8(%r13), %r8
1454bb304:     	movq	0x8b0(%r13), %rcx
1454bb30b:     	nopl	(%rax,%rax)
1454bb310:     	leaq	(%rdx,%r8), %r9
1454bb314:     	rolq	$0x17, %r9
1454bb318:     	addq	%rdx, %r9
1454bb31b:     	movq	%rax, %r10
1454bb31e:     	shlq	$0x11, %r10
1454bb322:     	xorq	%rdx, %rcx
1454bb325:     	xorq	%rax, %r8
1454bb328:     	xorq	%rcx, %rax
1454bb32b:     	xorq	%r8, %rdx
1454bb32e:     	xorq	%r10, %rcx
1454bb331:     	rolq	$0x2d, %r8
1454bb335:     	shrq	$0x20, %r9
1454bb339:     	leaq	(%r9,%r9,2), %rdi
1454bb33d:     	movl	%edi, %r9d
1454bb340:     	notl	%r9d
1454bb343:     	testl	$0xc0000000, %r9d       # imm = 0xC0000000
1454bb34a:     	je	0x1454bb310 <.text+0x54ba310>
1454bb34c:     	movq	%rdx, 0x8a0(%r13)
1454bb353:     	movq	%r8, 0x8b8(%r13)
1454bb35a:     	movq	%rax, 0x8a8(%r13)
1454bb361:     	movq	%rcx, 0x8b0(%r13)
1454bb368:     	leaq	0xb0(%rbp), %rcx
1454bb36f:     	movd	0x485149(%rip), %xmm2   # 0x1459404c0
1454bb377:     	movd	0x457fd1(%rip), %xmm3   # 0x145913350
1454bb37f:     	movq	%r13, %rdx
1454bb382:     	callq	0x1454d4b60 <.text+0x54d3b60>
1454bb387:     	nop
1454bb388:     	shrq	$0x20, %rdi
1454bb38c:     	xorl	%eax, %eax
1454bb38e:     	cmpq	$0x1, %rdi
1454bb392:     	sete	%al
1454bb395:     	xorl	$0x5, %eax
1454bb398:     	testq	%rdi, %rdi
1454bb39b:     	movl	$0x3, %edx
1454bb3a0:     	cmovnel	%eax, %edx
1454bb3a3:     	leaq	0xb0(%rbp), %r9
1454bb3aa:     	movq	%r13, %rcx
1454bb3ad:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454bb3b2:     	nop
1454bb3b3:     	movq	0xa8(%rbp), %rax
1454bb3ba:     	movss	(%rax), %xmm0
1454bb3be:     	ucomiss	0x97c(%r13), %xmm0
1454bb3c6:     	jb	0x1454bb4ef <.text+0x54ba4ef>
1454bb3cc:     	addss	0x75e010(%rip), %xmm0   # 0x145c193e4
1454bb3d4:     	movss	%xmm0, 0x97c(%r13)
1454bb3dd:     	movq	0x548(%r13), %rax
1454bb3e4:     	testq	%rax, %rax
1454bb3e7:     	je	0x1454bb4ba <.text+0x54ba4ba>
1454bb3ed:     	movq	0x540(%r13), %rcx
1454bb3f4:     	cmpq	$0x4, %rax
1454bb3f8:     	jae	0x1454bb404 <.text+0x54ba404>
1454bb3fa:     	xorl	%edx, %edx
1454bb3fc:     	xorl	%r8d, %r8d
1454bb3ff:     	jmp	0x1454bb491 <.text+0x54ba491>
1454bb404:     	movq	%rax, %rdx
1454bb407:     	andq	$-0x4, %rdx
1454bb40b:     	leaq	0xf8(%rcx), %r8
1454bb412:     	xorps	%xmm0, %xmm0
1454bb415:     	movdqa	0x153a983(%rip), %xmm1  # 0x1469f5da0
1454bb41d:     	movdqa	0x45a4db(%rip), %xmm2   # 0x145915900
1454bb425:     	movq	%rdx, %r9
1454bb428:     	pxor	%xmm3, %xmm3
1454bb42c:     	nopl	(%rax)
1454bb430:     	movd	-0x90(%r8), %xmm4
1454bb439:     	movd	-0xd8(%r8), %xmm5
1454bb442:     	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
1454bb446:     	movd	(%r8), %xmm4
1454bb44b:     	movd	-0x48(%r8), %xmm6
1454bb451:     	punpcklqdq	%xmm4, %xmm6    # xmm6 = xmm6[0],xmm4[0]
1454bb455:     	pcmpeqd	%xmm1, %xmm5
1454bb459:     	pand	%xmm2, %xmm5
1454bb45d:     	paddq	%xmm5, %xmm3
1454bb461:     	pcmpeqd	%xmm1, %xmm6
1454bb465:     	pand	%xmm2, %xmm6
1454bb469:     	paddq	%xmm6, %xmm0
1454bb46d:     	addq	$0x120, %r8             # imm = 0x120
1454bb474:     	addq	$-0x4, %r9
1454bb478:     	jne	0x1454bb430 <.text+0x54ba430>
1454bb47a:     	paddq	%xmm3, %xmm0
1454bb47e:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454bb483:     	paddq	%xmm0, %xmm1
1454bb487:     	movq	%xmm1, %r8
1454bb48c:     	cmpq	%rdx, %rax
1454bb48f:     	je	0x1454bb4b4 <.text+0x54ba4b4>
1454bb491:     	subq	%rdx, %rax
1454bb494:     	leaq	(%rdx,%rdx,8), %rdx
1454bb498:     	leaq	(%rcx,%rdx,8), %rcx
1454bb49c:     	addq	$0x20, %rcx
1454bb4a0:     	xorl	%edx, %edx
1454bb4a2:     	cmpl	$0x2, (%rcx)
1454bb4a5:     	sete	%dl
1454bb4a8:     	addq	%rdx, %r8
1454bb4ab:     	addq	$0x48, %rcx
1454bb4af:     	decq	%rax
1454bb4b2:     	jne	0x1454bb4a0 <.text+0x54ba4a0>
1454bb4b4:     	cmpq	$0x2, %r8
1454bb4b8:     	ja	0x1454bb4ef <.text+0x54ba4ef>
1454bb4ba:     	leaq	0xb0(%rbp), %rcx
1454bb4c1:     	movd	0x45d5b7(%rip), %xmm2   # 0x145918a80
1454bb4c9:     	movd	0x5293e3(%rip), %xmm3   # 0x1459e48b4
1454bb4d1:     	movq	%r13, %rdx
1454bb4d4:     	callq	0x1454d4b60 <.text+0x54d3b60>
1454bb4d9:     	nop
1454bb4da:     	leaq	0xb0(%rbp), %r9
1454bb4e1:     	movq	%r13, %rcx
1454bb4e4:     	movl	$0x2, %edx
1454bb4e9:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454bb4ee:     	nop
1454bb4ef:     	movq	0x6a0(%r13), %rsi
1454bb4f6:     	testq	%rsi, %rsi
1454bb4f9:     	je	0x1454bb59d <.text+0x54ba59d>
1454bb4ff:     	movq	0x698(%r13), %rcx
1454bb506:     	movss	0x934(%r13), %xmm0
1454bb50f:     	ucomiss	0x4(%rcx), %xmm0
1454bb513:     	jb	0x1454bb59d <.text+0x54ba59d>
1454bb519:     	leaq	0x8(%rcx), %rdx
1454bb51d:     	leaq	-0x8(,%rsi,8), %r8
1454bb525:     	decq	%rsi
1454bb528:     	callq	0x1457731e1 <.text+0x57721e1>
1454bb52d:     	movq	%rsi, 0x6a0(%r13)
1454bb534:     	leaq	0xb0(%rbp), %rcx
1454bb53b:     	movss	0x529459(%rip), %xmm2   # 0x1459e499c
1454bb543:     	movss	0x529369(%rip), %xmm3   # 0x1459e48b4
1454bb54b:     	movq	%r13, %rdx
1454bb54e:     	callq	0x1454d4b60 <.text+0x54d3b60>
1454bb553:     	nop
1454bb554:     	leaq	0xb0(%rbp), %r9
1454bb55b:     	movq	%r13, %rcx
1454bb55e:     	movl	$0x6, %edx
1454bb563:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454bb568:     	nop
1454bb569:     	leaq	0x153bd1e(%rip), %rdi   # 0x1469f728e
1454bb570:     	movl	$0x34, %esi
1454bb575:     	movl	$0x34, %edx
1454bb57a:     	movq	%rdi, %rcx
1454bb57d:     	callq	0x145457cb0 <.text+0x5456cb0>
1454bb582:     	nop
1454bb583:     	movq	%rdx, %r8
1454bb586:     	testq	%rax, %rax
1454bb589:     	cmovneq	%rax, %rdi
1454bb58d:     	cmoveq	%rsi, %r8
1454bb591:     	movq	%r13, %rcx
1454bb594:     	movq	%rdi, %rdx
1454bb597:     	callq	0x1454e4340 <.text+0x54e3340>
1454bb59c:     	nop
1454bb59d:     	movq	0x2f0(%rbp), %rdx
1454bb5a4:     	testq	%rdx, %rdx
1454bb5a7:     	je	0x1454bb5bf <.text+0x54ba5bf>
1454bb5a9:     	movq	0x2f8(%rbp), %rcx
1454bb5b0:     	shlq	$0x3, %rdx
1454bb5b4:     	movl	$0x8, %r8d
1454bb5ba:     	callq	0x1400021d0 <.text+0x11d0>
1454bb5bf:     	cmpb	$0x0, 0x9b2(%r13)
1454bb5c7:     	jne	0x1454bbee3 <.text+0x54baee3>
1454bb5cd:     	movq	0x5a8(%r13), %rcx
1454bb5d4:     	testq	%rcx, %rcx
1454bb5d7:     	je	0x1454bbbc5 <.text+0x54babc5>
1454bb5dd:     	leaq	0x4d8(%r13), %rax
1454bb5e4:     	movq	%rax, 0x338(%rbp)
1454bb5eb:     	xorl	%r14d, %r14d
1454bb5ee:     	movss	0x44bf15(%rip), %xmm9   # 0x14590750c
1454bb5f7:     	movss	0x44dfe4(%rip), %xmm10  # 0x1459095e4
1454bb600:     	xorps	%xmm11, %xmm11
1454bb604:     	movq	%rcx, 0x348(%rbp)
1454bb60b:     	jmp	0x1454bb65c <.text+0x54ba65c>
1454bb60d:     	movq	0x558(%r13), %rax
1454bb614:     	movq	%rsi, %rcx
1454bb617:     	shlq	$0x5, %rcx
1454bb61b:     	movups	0xb0(%rbp), %xmm0
1454bb622:     	movdqu	0xc0(%rbp), %xmm1
1454bb62a:     	movdqu	%xmm1, 0x10(%rax,%rcx)
1454bb630:     	movups	%xmm0, (%rax,%rcx)
1454bb634:     	incq	%rsi
1454bb637:     	movq	%rsi, 0x560(%r13)
1454bb63e:     	movq	0x348(%rbp), %rcx
1454bb645:     	nopw	%cs:(%rax,%rax)
1454bb650:     	incq	%r14
1454bb653:     	cmpq	%rcx, %r14
1454bb656:     	je	0x1454bbbbc <.text+0x54babbc>
1454bb65c:     	movq	0x5a8(%r13), %rdx
1454bb663:     	cmpq	%rdx, %r14
1454bb666:     	jae	0x1454bc998 <.text+0x54bb998>
1454bb66c:     	movq	0x5a0(%r13), %rax
1454bb673:     	leaq	(%r14,%r14,4), %rdx
1454bb677:     	cmpq	$0x0, (%rax,%rdx,8)
1454bb67c:     	jne	0x1454bb650 <.text+0x54ba650>
1454bb67e:     	leaq	(%rax,%rdx,8), %rsi
1454bb682:     	movq	0xa8(%rbp), %rax
1454bb689:     	movss	(%rax), %xmm0
1454bb68d:     	ucomiss	0x24(%rsi), %xmm0
1454bb691:     	jb	0x1454bb650 <.text+0x54ba650>
1454bb693:     	movq	0x228(%r13), %rcx
1454bb69a:     	movq	0x230(%r13), %rdx
1454bb6a1:     	callq	0x145420480 <.text+0x541f480>
1454bb6a6:     	imulq	$0xf0, %rax, %rax
1454bb6ad:     	movl	0x20(%rsi), %ecx
1454bb6b0:     	movl	%ecx, 0x40(%rbp)
1454bb6b3:     	movq	0x18(%rsi), %rcx
1454bb6b7:     	movq	%rcx, 0x38(%rbp)
1454bb6bb:     	movq	0x10(%rsi), %rdi
1454bb6bf:     	movq	0x80(%rax,%r12), %rdx
1454bb6c7:     	cmpq	%rdx, %rdi
1454bb6ca:     	jae	0x1454bcaad <.text+0x54bbaad>
1454bb6d0:     	movq	%r13, %rsi
1454bb6d3:     	addq	%r12, %rax
1454bb6d6:     	movq	0x78(%rax), %r13
1454bb6da:     	leaq	(%rdi,%rdi,4), %rbx
1454bb6de:     	shlq	$0x4, %rbx
1454bb6e2:     	leaq	(%rbx,%r13), %rax
1454bb6e6:     	movq	%rax, 0x358(%rbp)
1454bb6ed:     	movq	%rsi, %rcx
1454bb6f0:     	movq	%rdi, %rdx
1454bb6f3:     	callq	0x145501c20 <.text+0x5500c20>
1454bb6f8:     	movaps	%xmm0, %xmm6
1454bb6fb:     	movq	%rsi, %rcx
1454bb6fe:     	movq	%rdi, %rdx
1454bb701:     	callq	0x145502020 <.text+0x5501020>
1454bb706:     	movaps	%xmm0, %xmm7
1454bb709:     	movss	0x28(%r13,%rbx), %xmm13
1454bb710:     	mulss	0x153a697(%rip), %xmm13 # 0x1469f5db0
1454bb719:     	movl	0x20(%r13,%rbx), %r8d
1454bb71e:     	movl	0x954(%rsi), %r15d
1454bb725:     	incl	%r15d
1454bb728:     	movl	%r15d, 0x954(%rsi)
1454bb72f:     	movl	%r8d, %eax
1454bb732:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454bb737:     	shlq	$0x18, %rax
1454bb73b:     	andl	$0xffffff, %r15d        # imm = 0xFFFFFF
1454bb742:     	orq	%rax, %r15
1454bb745:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454bb74f:     	orq	%rax, %r15
1454bb752:     	movl	0x24(%r13,%rbx), %r9d
1454bb757:     	leaq	0x38(%rbp), %rax
1454bb75b:     	movq	%rax, 0x38(%rsp)
1454bb760:     	movss	%xmm6, 0x28(%rsp)
1454bb766:     	movss	%xmm13, 0x20(%rsp)
1454bb76d:     	movb	$0x1, 0x30(%rsp)
1454bb772:     	movq	%rsi, %rcx
1454bb775:     	movq	%r15, %rdx
1454bb778:     	callq	0x1454d2910 <.text+0x54d1910>
1454bb77d:     	movss	0x934(%rsi), %xmm14
1454bb786:     	movss	0x38(%r13,%rbx), %xmm15
1454bb78d:     	movss	0x3c(%r13,%rbx), %xmm8
1454bb794:     	movzbl	0x4c(%r13,%rbx), %ebx
1454bb79a:     	movzwl	0x24e(%rsi), %edi
1454bb7a1:     	movq	0x8a0(%rsi), %r8
1454bb7a8:     	movq	0x8b8(%rsi), %rdx
1454bb7af:     	movq	0x8a8(%rsi), %rcx
1454bb7b6:     	movq	0x8b0(%rsi), %rax
1454bb7bd:     	movq	%rsi, %r13
1454bb7c0:     	leaq	(%r8,%rdx), %r9
1454bb7c4:     	rolq	$0x17, %r9
1454bb7c8:     	addq	%r8, %r9
1454bb7cb:     	movq	%rcx, %r10
1454bb7ce:     	shlq	$0x11, %r10
1454bb7d2:     	xorq	%r8, %rax
1454bb7d5:     	xorq	%rcx, %rdx
1454bb7d8:     	xorq	%rax, %rcx
1454bb7db:     	xorq	%rdx, %r8
1454bb7de:     	rolq	$0x2d, %rdx
1454bb7e2:     	xorq	%r10, %rax
1454bb7e5:     	shrq	$0x29, %r9
1454bb7e9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454bb7f0:     	movd	%r9d, %xmm12
1454bb7f5:     	addss	%xmm9, %xmm12
1454bb7fa:     	mulss	%xmm10, %xmm12
1454bb7ff:     	ucomiss	%xmm12, %xmm10
1454bb803:     	jbe	0x1454bb7c0 <.text+0x54ba7c0>
1454bb805:     	movq	%r8, 0x8a0(%r13)
1454bb80c:     	movq	%rdx, 0x8b8(%r13)
1454bb813:     	movq	%rcx, 0x8a8(%r13)
1454bb81a:     	movq	%rax, 0x8b0(%r13)
1454bb821:     	callq	0x140002200 <.text+0x1200>
1454bb826:     	movl	$0xc, %ecx
1454bb82b:     	movl	$0x4, %edx
1454bb830:     	callq	0x1400021c0 <.text+0x11c0>
1454bb835:     	testq	%rax, %rax
1454bb838:     	je	0x1454bcacf <.text+0x54bbacf>
1454bb83e:     	xorps	%xmm0, %xmm0
1454bb841:     	addss	%xmm0, %xmm12
1454bb846:     	movzwl	%di, %ecx
1454bb849:     	xorps	%xmm0, %xmm0
1454bb84c:     	cvtsi2ss	%ecx, %xmm0
1454bb850:     	divss	0x44bce4(%rip), %xmm0   # 0x14590753c
1454bb858:     	mulss	%xmm0, %xmm8
1454bb85d:     	movaps	%xmm13, %xmm1
1454bb861:     	mulss	0x48c693(%rip), %xmm1   # 0x145947efc
1454bb869:     	addss	0x572e47(%rip), %xmm1   # 0x145a2e6b8
1454bb871:     	movaps	%xmm15, %xmm0
1454bb875:     	mulss	0x44bc1b(%rip), %xmm0   # 0x145907498
1454bb87d:     	movq	0x153a53b(%rip), %xmm2  # 0x1469f5dc0
1454bb885:     	movq	%xmm2, (%rax)
1454bb889:     	movl	$0x41000000, 0x8(%rax)  # imm = 0x41000000
1454bb890:     	movq	$0x0, 0xb0(%rbp)
1454bb89b:     	movq	$0x8, 0xb8(%rbp)
1454bb8a6:     	movq	$0x0, 0xc0(%rbp)
1454bb8b1:     	movq	$-0x1, 0xc8(%rbp)
1454bb8bc:     	movq	$0x3, 0xf0(%rbp)
1454bb8c7:     	movq	%rax, 0xf8(%rbp)
1454bb8ce:     	movq	$0x3, 0x100(%rbp)
1454bb8d9:     	movq	%r14, 0x108(%rbp)
1454bb8e0:     	movb	$0x0, 0x110(%rbp)
1454bb8e7:     	movl	$0x0, 0x118(%rbp)
1454bb8f1:     	movl	$0x0, 0x120(%rbp)
1454bb8fb:     	movl	$0x0, 0x128(%rbp)
1454bb905:     	movq	%r15, 0x138(%rbp)
1454bb90c:     	movq	0x358(%rbp), %rax
1454bb913:     	movq	%rax, 0x140(%rbp)
1454bb91a:     	leaq	0x148(%rbp), %rcx
1454bb921:     	movups	%xmm11, 0x40(%rcx)
1454bb926:     	movups	%xmm11, 0x30(%rcx)
1454bb92b:     	movups	%xmm11, 0x20(%rcx)
1454bb930:     	movups	%xmm11, 0x10(%rcx)
1454bb935:     	movups	%xmm11, (%rcx)
1454bb939:     	movq	$0x0, 0x50(%rcx)
1454bb941:     	movss	%xmm6, 0x1a0(%rbp)
1454bb949:     	movss	%xmm6, 0x1a4(%rbp)
1454bb951:     	movss	%xmm7, 0x1a8(%rbp)
1454bb959:     	movss	%xmm8, 0x1ac(%rbp)
1454bb962:     	movss	%xmm15, 0x1b0(%rbp)
1454bb96b:     	movss	%xmm1, 0x1b4(%rbp)
1454bb973:     	movss	%xmm13, 0x1b8(%rbp)
1454bb97c:     	movl	0x40(%rbp), %eax
1454bb97f:     	movl	%eax, 0x7c(%rcx)
1454bb982:     	movq	0x38(%rbp), %rax
1454bb986:     	movq	%rax, 0x74(%rcx)
1454bb98a:     	movl	0x40(%rbp), %eax
1454bb98d:     	movl	%eax, 0x88(%rcx)
1454bb993:     	movq	0x38(%rbp), %rax
1454bb997:     	movq	%rax, 0x80(%rcx)
1454bb99e:     	xorps	%xmm1, %xmm1
1454bb9a1:     	movss	%xmm14, %xmm1           # xmm1 = xmm14[0],xmm1[1,2,3]
1454bb9a6:     	movlps	%xmm1, 0x1d4(%rbp)
1454bb9ad:     	movss	%xmm14, 0x1dc(%rbp)
1454bb9b6:     	movss	%xmm0, 0x1e0(%rbp)
1454bb9be:     	movups	%xmm11, 0xac(%rcx)
1454bb9c6:     	movups	%xmm11, 0x9c(%rcx)
1454bb9ce:     	movss	%xmm12, 0x204(%rbp)
1454bb9d7:     	movb	%bl, 0x208(%rbp)
1454bb9dd:     	movq	0x4e8(%r13), %rdi
1454bb9e4:     	cmpq	0x4d8(%r13), %rdi
1454bb9eb:     	jne	0x1454bb9fa <.text+0x54ba9fa>
1454bb9ed:     	movq	0x338(%rbp), %rcx
1454bb9f4:     	callq	0x145827b30 <.text+0x5826b30>
1454bb9f9:     	nop
1454bb9fa:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454bba01:     	addq	0x4e0(%r13), %rcx
1454bba08:     	movl	$0x160, %r8d            # imm = 0x160
1454bba0e:     	leaq	0xb0(%rbp), %rdx
1454bba15:     	callq	0x1457731ed <.text+0x57721ed>
1454bba1a:     	incq	%rdi
1454bba1d:     	movq	%rdi, 0x4e8(%r13)
1454bba24:     	movq	0x5a8(%r13), %rdx
1454bba2b:     	cmpq	%rdx, %r14
1454bba2e:     	jae	0x1454bcabe <.text+0x54bbabe>
1454bba34:     	movq	0x5a0(%r13), %rax
1454bba3b:     	leaq	(%r14,%r14,4), %rsi
1454bba3f:     	movq	$0x1, (%rax,%rsi,8)
1454bba47:     	movq	%r15, 0x8(%rax,%rsi,8)
1454bba4c:     	movq	$0x0, (%r13)
1454bba54:     	movss	0x934(%r13), %xmm0
1454bba5d:     	ucomiss	0x5291ec(%rip), %xmm0   # 0x1459e4c50
1454bba64:     	movq	0x348(%rbp), %rcx
1454bba6b:     	jbe	0x1454bb650 <.text+0x54ba650>
1454bba71:     	movq	0x228(%r13), %rcx
1454bba78:     	movq	0x230(%r13), %rdx
1454bba7f:     	callq	0x145420480 <.text+0x541f480>
1454bba84:     	movq	0x5a8(%r13), %rdx
1454bba8b:     	cmpq	%rdx, %r14
1454bba8e:     	jae	0x1454bcc27 <.text+0x54bbc27>
1454bba94:     	imulq	$0xf0, %rax, %rax
1454bba9b:     	addq	%r12, %rax
1454bba9e:     	movq	0x5a0(%r13), %rcx
1454bbaa5:     	movq	0x10(%rcx,%rsi,8), %rcx
1454bbaaa:     	movq	0x80(%rax), %rdx
1454bbab1:     	cmpq	%rdx, %rcx
1454bbab4:     	jae	0x1454bcc38 <.text+0x54bbc38>
1454bbaba:     	movq	0x78(%rax), %rsi
1454bbabe:     	leaq	(%rcx,%rcx,4), %rdi
1454bbac2:     	shlq	$0x4, %rdi
1454bbac6:     	leaq	(%rsi,%rdi), %rax
1454bbaca:     	addq	$0x20, %rax
1454bbace:     	movq	%rax, 0x240(%rbp)
1454bbad5:     	leaq	0x27e974(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454bbadc:     	movq	%rax, 0x248(%rbp)
1454bbae3:     	leaq	0xb0(%rbp), %rcx
1454bbaea:     	leaq	0x126fe27(%rip), %rdx   # 0x14672b918
1454bbaf1:     	leaq	0x240(%rbp), %r8
1454bbaf8:     	callq	0x145728390 <.text+0x5727390>
1454bbafd:     	movq	0xb8(%rbp), %rcx
1454bbb04:     	movq	0xc0(%rbp), %rdx
1454bbb0b:     	movq	0x10(%rsi,%rdi), %rbx
1454bbb10:     	movq	0x18(%rsi,%rdi), %r13
1454bbb15:     	movq	%rcx, 0x358(%rbp)
1454bbb1c:     	callq	0x145457cb0 <.text+0x5456cb0>
1454bbb21:     	nop
1454bbb22:     	movq	%rax, %rdi
1454bbb25:     	movq	%rdx, %r15
1454bbb28:     	movq	0xb0(%rbp), %rdx
1454bbb2f:     	testq	%rdx, %rdx
1454bbb32:     	je	0x1454bbb46 <.text+0x54bab46>
1454bbb34:     	movl	$0x1, %r8d
1454bbb3a:     	movq	0x358(%rbp), %rcx
1454bbb41:     	callq	0x1400021d0 <.text+0x11d0>
1454bbb46:     	testq	%rdi, %rdi
1454bbb49:     	cmovneq	%rdi, %rbx
1454bbb4d:     	cmoveq	%r13, %r15
1454bbb51:     	movl	$0x1d, %edx
1454bbb56:     	leaq	0x153c73b(%rip), %rsi   # 0x1469f8298
1454bbb5d:     	movq	%rsi, %rcx
1454bbb60:     	callq	0x145457cb0 <.text+0x5456cb0>
1454bbb65:     	testq	%rax, %rax
1454bbb68:     	cmoveq	%rsi, %rax
1454bbb6c:     	movl	$0x1d, %ecx
1454bbb71:     	cmoveq	%rcx, %rdx
1454bbb75:     	movq	%rdx, 0x20(%rsp)
1454bbb7a:     	leaq	0xb0(%rbp), %rcx
1454bbb81:     	movq	%rbx, %rdx
1454bbb84:     	movq	%r15, %r8
1454bbb87:     	movq	%rax, %r9
1454bbb8a:     	callq	0x145459d40 <.text+0x5458d40>
1454bbb8f:     	movq	0x368(%rbp), %r13
1454bbb96:     	movq	0x560(%r13), %rsi
1454bbb9d:     	cmpq	0x550(%r13), %rsi
1454bbba4:     	jne	0x1454bb60d <.text+0x54ba60d>
1454bbbaa:     	movq	0x340(%rbp), %rcx
1454bbbb1:     	callq	0x145774710 <.text+0x5773710>
1454bbbb6:     	nop
1454bbbb7:     	jmp	0x1454bb60d <.text+0x54ba60d>
1454bbbbc:     	movq	0x5a8(%r13), %r9
1454bbbc3:     	jmp	0x1454bbbc8 <.text+0x54babc8>
1454bbbc5:     	xorl	%r9d, %r9d
1454bbbc8:     	movsd	0x400(%r13), %xmm0
1454bbbd1:     	movq	0x5a0(%r13), %r14
1454bbbd8:     	leaq	(,%r9,8), %rax
1454bbbe0:     	leaq	(%rax,%rax,4), %rax
1454bbbe4:     	xorl	%r8d, %r8d
1454bbbe7:     	xorl	%ecx, %ecx
1454bbbe9:     	nopl	(%rax)
1454bbbf0:     	cmpq	%rcx, %rax
1454bbbf3:     	je	0x1454bbca2 <.text+0x54baca2>
1454bbbf9:     	leaq	0x28(%rcx), %rdx
1454bbbfd:     	decq	%r8
1454bbc00:     	cmpq	$0x0, (%r14,%rcx)
1454bbc05:     	movq	%rdx, %rcx
1454bbc08:     	je	0x1454bbbf0 <.text+0x54babf0>
1454bbc0a:     	movq	%r8, %rcx
1454bbc0d:     	notq	%rcx
1454bbc10:     	subq	%rdx, %rax
1454bbc13:     	je	0x1454bbcb7 <.text+0x54bacb7>
1454bbc19:     	leaq	(%r14,%rdx), %r10
1454bbc1d:     	leaq	(%r14,%rdx), %r11
1454bbc21:     	addq	$-0x28, %r11
1454bbc25:     	movabsq	$-0x3333333333333333, %rdx # imm = 0xCCCCCCCCCCCCCCCD
1454bbc2f:     	mulq	%rdx
1454bbc32:     	shrq	$0x5, %rdx
1454bbc36:     	negq	%r8
1454bbc39:     	xorl	%eax, %eax
1454bbc3b:     	jmp	0x1454bbc4c <.text+0x54bac4c>
1454bbc3d:     	nopl	(%rax)
1454bbc40:     	incq	%rax
1454bbc43:     	addq	$0x28, %r10
1454bbc47:     	cmpq	%rax, %rdx
1454bbc4a:     	je	0x1454bbcb7 <.text+0x54bacb7>
1454bbc4c:     	cmpq	$0x0, (%r10)
1454bbc50:     	je	0x1454bbc40 <.text+0x54bac40>
1454bbc52:     	movsd	0x18(%r11), %xmm1
1454bbc58:     	subps	%xmm0, %xmm1
1454bbc5b:     	mulps	%xmm1, %xmm1
1454bbc5e:     	movsd	0x18(%r10), %xmm2
1454bbc64:     	subps	%xmm0, %xmm2
1454bbc67:     	mulps	%xmm2, %xmm2
1454bbc6a:     	haddps	%xmm2, %xmm1
1454bbc6e:     	shufps	$0xe8, %xmm1, %xmm1     # xmm1 = xmm1[0,2,2,3]
1454bbc72:     	sqrtps	%xmm1, %xmm1
1454bbc75:     	movaps	%xmm1, %xmm2
1454bbc78:     	psrad	$0x1f, %xmm2
1454bbc7d:     	psrld	$0x1, %xmm2
1454bbc82:     	pxor	%xmm1, %xmm2
1454bbc86:     	pshufd	$0x55, %xmm2, %xmm1     # xmm1 = xmm2[1,1,1,1]
1454bbc8b:     	pcmpgtd	%xmm1, %xmm2
1454bbc8f:     	movd	%xmm2, %esi
1454bbc93:     	testb	$0x1, %sil
1454bbc97:     	je	0x1454bbc40 <.text+0x54bac40>
1454bbc99:     	leaq	(%r8,%rax), %rcx
1454bbc9d:     	movq	%r10, %r11
1454bbca0:     	jmp	0x1454bbc40 <.text+0x54bac40>
1454bbca2:     	testq	%r9, %r9
1454bbca5:     	je	0x1454bbee3 <.text+0x54baee3>
1454bbcab:     	cmpq	$0x1, %r9
1454bbcaf:     	jne	0x1454bc6dd <.text+0x54bb6dd>
1454bbcb5:     	xorl	%ecx, %ecx
1454bbcb7:     	movss	0x934(%r13), %xmm0
1454bbcc0:     	cmpl	$0x1, (%r13)
1454bbcc5:     	jne	0x1454bbce6 <.text+0x54bace6>
1454bbcc7:     	cmpq	%rcx, 0x8(%r13)
1454bbccb:     	jne	0x1454bbce6 <.text+0x54bace6>
1454bbccd:     	movaps	%xmm0, %xmm1
1454bbcd0:     	subss	0x94c(%r13), %xmm1
1454bbcd9:     	ucomiss	0x528da4(%rip), %xmm1   # 0x1459e4a84
1454bbce0:     	jbe	0x1454bbee3 <.text+0x54baee3>
1454bbce6:     	movq	$0x1, (%r13)
1454bbcee:     	movq	%rcx, 0x8(%r13)
1454bbcf2:     	movss	%xmm0, 0x94c(%r13)
1454bbcfb:     	cmpq	%r9, %rcx
1454bbcfe:     	jae	0x1454bcca0 <.text+0x54bbca0>
1454bbd04:     	leaq	(%rcx,%rcx,4), %r15
1454bbd08:     	movq	0x228(%r13), %rcx
1454bbd0f:     	movq	0x230(%r13), %rdx
1454bbd16:     	callq	0x145420480 <.text+0x541f480>
1454bbd1b:     	imulq	$0xf0, %rax, %rax
1454bbd22:     	movq	0x10(%r14,%r15,8), %rcx
1454bbd27:     	movq	0x80(%rax,%r12), %rdx
1454bbd2f:     	cmpq	%rdx, %rcx
1454bbd32:     	jae	0x1454bccb1 <.text+0x54bbcb1>
1454bbd38:     	addq	%rax, %r12
1454bbd3b:     	movq	0x78(%r12), %rsi
1454bbd40:     	leaq	(%rcx,%rcx,4), %rdi
1454bbd44:     	shlq	$0x4, %rdi
1454bbd48:     	leaq	(%rsi,%rdi), %rax
1454bbd4c:     	addq	$0x20, %rax
1454bbd50:     	movq	%rax, 0x240(%rbp)
1454bbd57:     	leaq	0x27e6f2(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454bbd5e:     	movq	%rax, 0x248(%rbp)
1454bbd65:     	leaq	0x126fbac(%rip), %rdx   # 0x14672b918
1454bbd6c:     	leaq	0xb0(%rbp), %rcx
1454bbd73:     	leaq	0x240(%rbp), %r8
1454bbd7a:     	callq	0x145728390 <.text+0x5727390>
1454bbd7f:     	movq	0xb8(%rbp), %rcx
1454bbd86:     	movq	0xc0(%rbp), %rdx
1454bbd8d:     	movq	0x10(%rsi,%rdi), %r12
1454bbd92:     	movq	0x18(%rsi,%rdi), %r13
1454bbd97:     	movq	%rcx, 0x358(%rbp)
1454bbd9e:     	callq	0x145457cb0 <.text+0x5456cb0>
1454bbda3:     	nop
1454bbda4:     	movq	%rax, %rbx
1454bbda7:     	movq	%rdx, %rdi
1454bbdaa:     	leaq	(%r14,%r15,8), %r14
1454bbdae:     	movq	0xb0(%rbp), %rdx
1454bbdb5:     	testq	%rdx, %rdx
1454bbdb8:     	leaq	0x2b8(%rbp), %rsi
1454bbdbf:     	je	0x1454bbdd3 <.text+0x54badd3>
1454bbdc1:     	movl	$0x1, %r8d
1454bbdc7:     	movq	0x358(%rbp), %rcx
1454bbdce:     	callq	0x1400021d0 <.text+0x11d0>
1454bbdd3:     	testq	%rbx, %rbx
1454bbdd6:     	cmovneq	%rbx, %r12
1454bbdda:     	cmoveq	%r13, %rdi
1454bbdde:     	movq	%r12, 0x2b8(%rbp)
1454bbde5:     	movq	%rdi, 0x2c0(%rbp)
1454bbdec:     	cmpq	$0x0, (%r14)
1454bbdf0:     	je	0x1454bbe10 <.text+0x54bae10>
1454bbdf2:     	movq	%rsi, 0xb0(%rbp)
1454bbdf9:     	leaq	-0x54b9d40(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454bbe00:     	movq	%rax, 0xb8(%rbp)
1454bbe07:     	leaq	0x153c422(%rip), %rdx   # 0x1469f8230
1454bbe0e:     	jmp	0x1454bbe2c <.text+0x54bae2c>
1454bbe10:     	movq	%rsi, 0xb0(%rbp)
1454bbe17:     	leaq	-0x54b9d5e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454bbe1e:     	movq	%rax, 0xb8(%rbp)
1454bbe25:     	leaq	0x153c412(%rip), %rdx   # 0x1469f823e
1454bbe2c:     	leaq	0x240(%rbp), %rcx
1454bbe33:     	leaq	0xb0(%rbp), %r8
1454bbe3a:     	callq	0x145728390 <.text+0x5727390>
1454bbe3f:     	movq	0x368(%rbp), %r13
1454bbe46:     	movss	0x18(%r14), %xmm1
1454bbe4c:     	movss	0x1c(%r14), %xmm2
1454bbe52:     	movq	0x248(%rbp), %r9
1454bbe59:     	movq	0x250(%rbp), %rax
1454bbe60:     	movq	%rax, 0x20(%rsp)
1454bbe65:     	leaq	0xb0(%rbp), %rcx
1454bbe6c:     	movq	%r9, 0x358(%rbp)
1454bbe73:     	callq	0x14545a3e0 <.text+0x54593e0>
1454bbe78:     	nop
1454bbe79:     	movq	0x560(%r13), %rsi
1454bbe80:     	cmpq	0x550(%r13), %rsi
1454bbe87:     	jne	0x1454bbe96 <.text+0x54bae96>
1454bbe89:     	movq	0x340(%rbp), %rcx
1454bbe90:     	callq	0x145774710 <.text+0x5773710>
1454bbe95:     	nop
1454bbe96:     	movq	0x558(%r13), %rax
1454bbe9d:     	movq	%rsi, %rcx
1454bbea0:     	shlq	$0x5, %rcx
1454bbea4:     	movups	0xb0(%rbp), %xmm0
1454bbeab:     	movups	0xc0(%rbp), %xmm1
1454bbeb2:     	movups	%xmm1, 0x10(%rax,%rcx)
1454bbeb7:     	movups	%xmm0, (%rax,%rcx)
1454bbebb:     	incq	%rsi
1454bbebe:     	movq	%rsi, 0x560(%r13)
1454bbec5:     	movq	0x240(%rbp), %rdx
1454bbecc:     	testq	%rdx, %rdx
1454bbecf:     	je	0x1454bbee3 <.text+0x54baee3>
1454bbed1:     	movl	$0x1, %r8d
1454bbed7:     	movq	0x358(%rbp), %rcx
1454bbede:     	callq	0x1400021d0 <.text+0x11d0>
1454bbee3:     	cmpl	$0x0, 0x870(%r13)
1454bbeeb:     	movzbl	0x9b9(%r13), %eax
1454bbef3:     	je	0x1454bc015 <.text+0x54bb015>
1454bbef9:     	cmpb	$0x1, %al
1454bbefb:     	jne	0x1454bc015 <.text+0x54bb015>
1454bbf01:     	cmpb	$0x0, 0x9aa(%r13)
1454bbf09:     	jne	0x1454bc015 <.text+0x54bb015>
1454bbf0f:     	movb	$0x5, 0x9b9(%r13)
1454bbf17:     	movq	%r13, %rcx
1454bbf1a:     	callq	0x1454a44d0 <.text+0x54a34d0>
1454bbf1f:     	movq	0x3e8(%r13), %rdx
1454bbf26:     	movl	0x4cc(%r13), %r8d
1454bbf2d:     	leaq	0xb0(%rbp), %rcx
1454bbf34:     	callq	0x14545a270 <.text+0x5459270>
1454bbf39:     	movq	0x560(%r13), %rsi
1454bbf40:     	cmpq	0x550(%r13), %rsi
1454bbf47:     	jne	0x1454bbf56 <.text+0x54baf56>
1454bbf49:     	movq	0x340(%rbp), %rcx
1454bbf50:     	callq	0x145774710 <.text+0x5773710>
1454bbf55:     	nop
1454bbf56:     	movq	0x558(%r13), %rax
1454bbf5d:     	movq	%rsi, %rcx
1454bbf60:     	shlq	$0x5, %rcx
1454bbf64:     	movups	0xb0(%rbp), %xmm0
1454bbf6b:     	movups	0xc0(%rbp), %xmm1
1454bbf72:     	movups	%xmm1, 0x10(%rax,%rcx)
1454bbf77:     	movups	%xmm0, (%rax,%rcx)
1454bbf7b:     	incq	%rsi
1454bbf7e:     	movq	%rsi, 0x560(%r13)
1454bbf85:     	incl	0x4cc(%r13)
1454bbf8c:     	leaq	0x153a19c(%rip), %r8    # 0x1469f612f
1454bbf93:     	leaq	0xb0(%rbp), %rcx
1454bbf9a:     	movl	$0x7, %r9d
1454bbfa0:     	movq	%r13, %rdx
1454bbfa3:     	callq	0x1454c86f0 <.text+0x54c76f0>
1454bbfa8:     	movq	0x578(%r13), %rsi
1454bbfaf:     	cmpq	0x568(%r13), %rsi
1454bbfb6:     	jne	0x1454bbfe1 <.text+0x54bafe1>
1454bbfb8:     	leaq	0x568(%r13), %rcx
1454bbfbf:     	movq	0xb0(%rbp), %rax
1454bbfc6:     	movq	%rax, 0x358(%rbp)
1454bbfcd:     	movq	0xb8(%rbp), %rax
1454bbfd4:     	movq	%rax, 0x340(%rbp)
1454bbfdb:     	callq	0x1457745c0 <.text+0x57735c0>
1454bbfe0:     	nop
1454bbfe1:     	movq	0x570(%r13), %rax
1454bbfe8:     	leaq	(%rsi,%rsi,2), %rcx
1454bbfec:     	movq	0xc0(%rbp), %rdx
1454bbff3:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454bbff8:     	movups	0xb0(%rbp), %xmm0
1454bbfff:     	movups	%xmm0, (%rax,%rcx,8)
1454bc003:     	incq	%rsi
1454bc006:     	movq	%rsi, 0x578(%r13)
1454bc00d:     	movzbl	0x9b9(%r13), %eax
1454bc015:     	movl	0x948(%r13), %edi
1454bc01c:     	testl	%edi, %edi
1454bc01e:     	je	0x1454bc12c <.text+0x54bb12c>
1454bc024:     	cmpb	$0x1, %al
1454bc026:     	jne	0x1454bc12c <.text+0x54bb12c>
1454bc02c:     	movl	$0x0, 0x948(%r13)
1454bc037:     	movss	0x44b4c9(%rip), %xmm6   # 0x145907508
1454bc03f:     	movss	0x45c7f9(%rip), %xmm7   # 0x145918840
1454bc047:     	movss	0x44b4c8(%rip), %xmm8   # 0x145907518
1454bc050:     	xorps	%xmm9, %xmm9
1454bc054:     	movss	0x44b4cf(%rip), %xmm10  # 0x14590752c
1454bc05d:     	jmp	0x1454bc076 <.text+0x54bb076>
1454bc05f:     	nop
1454bc060:     	cmpl	$0x1, %edx
1454bc063:     	adcl	$0x0, %edx
1454bc066:     	movq	%r13, %rcx
1454bc069:     	callq	0x1454c69e0 <.text+0x54c59e0>
1454bc06e:     	decl	%edi
1454bc070:     	je	0x1454bc101 <.text+0x54bb101>
1454bc076:     	incl	0x944(%r13)
1454bc07d:     	movl	0x410(%r13), %eax
1454bc084:     	cmpl	$0x1, %eax
1454bc087:     	adcl	$-0x1, %eax
1454bc08a:     	xorps	%xmm1, %xmm1
1454bc08d:     	cvtsi2ss	%rax, %xmm1
1454bc092:     	movaps	%xmm1, %xmm0
1454bc095:     	mulss	%xmm8, %xmm0
1454bc09a:     	mulss	%xmm1, %xmm0
1454bc09e:     	mulss	%xmm6, %xmm1
1454bc0a2:     	addss	%xmm7, %xmm1
1454bc0a6:     	addss	%xmm1, %xmm0
1454bc0aa:     	callq	0x14577322f <.text+0x577222f>
1454bc0af:     	xorl	%edx, %edx
1454bc0b1:     	ucomiss	%xmm9, %xmm0
1454bc0b5:     	movl	$0x0, %eax
1454bc0ba:     	jb	0x1454bc0e0 <.text+0x54bb0e0>
1454bc0bc:     	cvttss2si	%xmm0, %rax
1454bc0c1:     	ucomiss	%xmm10, %xmm0
1454bc0c5:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454bc0ca:     	jbe	0x1454bc0eb <.text+0x54bb0eb>
1454bc0cc:     	subl	0x414(%r13), %ecx
1454bc0d3:     	jb	0x1454bc060 <.text+0x54bb060>
1454bc0d5:     	jmp	0x1454bc0fa <.text+0x54bb0fa>
1454bc0d7:     	nopw	(%rax,%rax)
1454bc0e0:     	ucomiss	%xmm10, %xmm0
1454bc0e4:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454bc0e9:     	ja	0x1454bc0cc <.text+0x54bb0cc>
1454bc0eb:     	movl	%eax, %ecx
1454bc0ed:     	subl	0x414(%r13), %ecx
1454bc0f4:     	jb	0x1454bc060 <.text+0x54bb060>
1454bc0fa:     	movl	%ecx, %edx
1454bc0fc:     	jmp	0x1454bc060 <.text+0x54bb060>
1454bc101:     	cmpl	$0x0, 0x944(%r13)
1454bc109:     	je	0x1454bc12c <.text+0x54bb12c>
1454bc10b:     	cmpb	$0x0, 0x9b2(%r13)
1454bc113:     	jne	0x1454bc12c <.text+0x54bb12c>
1454bc115:     	cmpb	$0x1, 0x9b9(%r13)
1454bc11d:     	jne	0x1454bc12c <.text+0x54bb12c>
1454bc11f:     	movq	%r13, %rcx
1454bc122:     	movb	$0x2, %dl
1454bc124:     	movb	$0x1, %r8b
1454bc127:     	callq	0x1454ec7a0 <.text+0x54eb7a0>
1454bc12c:     	movq	%r13, %rcx
1454bc12f:     	callq	0x14549e650 <.text+0x549d650>
1454bc134:     	movzbl	0x9ac(%r13), %r15d
1454bc13c:     	cmpb	$0x1, 0x9b9(%r13)
1454bc144:     	sete	0x340(%rbp)
1454bc14b:     	sete	0x9ac(%r13)
1454bc153:     	movss	0x934(%r13), %xmm6
1454bc15c:     	movq	%r13, %rax
1454bc15f:     	movq	0x6b8(%r13), %r13
1454bc166:     	movq	0x6d0(%rax), %r12
1454bc16d:     	cmpq	%r13, %r12
1454bc170:     	je	0x1454bc289 <.text+0x54bb289>
1454bc176:     	testq	%r13, %r13
1454bc179:     	je	0x1454bc23a <.text+0x54bb23a>
1454bc17f:     	movq	%r13, %rbx
1454bc182:     	shlq	$0x4, %rbx
1454bc186:     	callq	0x140002200 <.text+0x1200>
1454bc18b:     	movl	$0x4, %edx
1454bc190:     	movq	%rbx, %rcx
1454bc193:     	callq	0x1400021c0 <.text+0x11c0>
1454bc198:     	testq	%rax, %rax
1454bc19b:     	je	0x1454bcb8f <.text+0x54bbb8f>
1454bc1a1:     	movq	%rax, %rdi
1454bc1a4:     	movl	$0x1, %ebx
1454bc1a9:     	cmpq	$0x1, %r13
1454bc1ad:     	je	0x1454bc232 <.text+0x54bb232>
1454bc1b3:     	leaq	-0x1(%r13), %rdx
1454bc1b7:     	leaq	-0x2(%r13), %r8
1454bc1bb:     	movl	%edx, %ecx
1454bc1bd:     	andl	$0x7, %ecx
1454bc1c0:     	movq	%rdi, %rax
1454bc1c3:     	cmpq	$0x7, %r8
1454bc1c7:     	jb	0x1454bc220 <.text+0x54bb220>
1454bc1c9:     	andq	$-0x8, %rdx
1454bc1cd:     	movq	%rdi, %rax
1454bc1d0:     	movl	$0x0, (%rax)
1454bc1d6:     	movl	$0x0, 0x10(%rax)
1454bc1dd:     	movl	$0x0, 0x20(%rax)
1454bc1e4:     	movl	$0x0, 0x30(%rax)
1454bc1eb:     	movl	$0x0, 0x40(%rax)
1454bc1f2:     	movl	$0x0, 0x50(%rax)
1454bc1f9:     	movl	$0x0, 0x60(%rax)
1454bc200:     	movl	$0x0, 0x70(%rax)
1454bc207:     	subq	$-0x80, %rax
1454bc20b:     	addq	$-0x8, %rdx
1454bc20f:     	jne	0x1454bc1d0 <.text+0x54bb1d0>
1454bc211:     	movq	%r13, %rbx
1454bc214:     	testq	%rcx, %rcx
1454bc217:     	je	0x1454bc232 <.text+0x54bb232>
1454bc219:     	nopl	(%rax)
1454bc220:     	movl	$0x0, (%rax)
1454bc226:     	addq	$0x10, %rax
1454bc22a:     	decq	%rcx
1454bc22d:     	jne	0x1454bc220 <.text+0x54bb220>
1454bc22f:     	movq	%r13, %rbx
1454bc232:     	movl	$0x0, (%rax)
1454bc238:     	jmp	0x1454bc241 <.text+0x54bb241>
1454bc23a:     	movl	$0x4, %edi
1454bc23f:     	xorl	%ebx, %ebx
1454bc241:     	movq	0x368(%rbp), %rsi
1454bc248:     	movq	0x6c0(%rsi), %rdx
1454bc24f:     	movq	%r13, %r12
1454bc252:     	testq	%rdx, %rdx
1454bc255:     	je	0x1454bc274 <.text+0x54bb274>
1454bc257:     	movq	0x6c8(%rsi), %rcx
1454bc25e:     	shlq	$0x4, %rdx
1454bc262:     	movl	$0x4, %r8d
1454bc268:     	callq	0x1400021d0 <.text+0x11d0>
1454bc26d:     	movq	0x6b8(%rsi), %r12
1454bc274:     	movq	%rbx, 0x6c0(%rsi)
1454bc27b:     	movq	%rdi, 0x6c8(%rsi)
1454bc282:     	movq	%r13, 0x6d0(%rsi)
1454bc289:     	testq	%r12, %r12
1454bc28c:     	je	0x1454bc497 <.text+0x54bb497>
1454bc292:     	xorb	$0x1, %r15b
1454bc296:     	andb	%r15b, 0x340(%rbp)
1454bc29d:     	movq	0x368(%rbp), %rax
1454bc2a4:     	movq	0x6b0(%rax), %r15
1454bc2ab:     	shlq	$0x4, %r12
1454bc2af:     	addq	$0x550, %rax            # imm = 0x550
1454bc2b5:     	movq	%rax, 0x348(%rbp)
1454bc2bc:     	xorl	%r13d, %r13d
1454bc2bf:     	xorps	%xmm7, %xmm7
1454bc2c2:     	movss	0x45964d(%rip), %xmm8   # 0x145915918
1454bc2cb:     	movss	0x44b258(%rip), %xmm9   # 0x14590752c
1454bc2d4:     	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454bc2d9:     	xorl	%r14d, %r14d
1454bc2dc:     	xorl	%ebx, %ebx
1454bc2de:     	jmp	0x1454bc333 <.text+0x54bb333>
1454bc2e0:     	movq	0x368(%rbp), %rdx
1454bc2e7:     	movq	0x558(%rdx), %rax
1454bc2ee:     	movq	%rsi, %rcx
1454bc2f1:     	shlq	$0x5, %rcx
1454bc2f5:     	movq	$0x20, (%rax,%rcx)
1454bc2fd:     	movq	0x358(%rbp), %r8
1454bc304:     	movq	%r8, 0x8(%rax,%rcx)
1454bc309:     	movq	$0x5, 0x10(%rax,%rcx)
1454bc312:     	movw	$0x137, 0x18(%rax,%rcx) # imm = 0x137
1454bc319:     	incq	%rsi
1454bc31c:     	movq	%rsi, 0x560(%rdx)
1454bc323:     	addq	$0x10, %r14
1454bc327:     	incq	%rbx
1454bc32a:     	cmpq	%r14, %r12
1454bc32d:     	je	0x1454bc425 <.text+0x54bb425>
1454bc333:     	cmpl	$0x1, (%r15,%r14)
1454bc338:     	jne	0x1454bc323 <.text+0x54bb323>
1454bc33a:     	movq	0x368(%rbp), %rax
1454bc341:     	movq	0x6d0(%rax), %rdx
1454bc348:     	cmpq	%rdx, %rbx
1454bc34b:     	jae	0x1454bc872 <.text+0x54bb872>
1454bc351:     	movq	0x6c8(%rax), %rax
1454bc358:     	testb	$0x1, (%rax,%r14)
1454bc35d:     	je	0x1454bc390 <.text+0x54bb390>
1454bc35f:     	movl	0x4(%rax,%r14), %ecx
1454bc364:     	cmpl	0x4(%r15,%r14), %ecx
1454bc369:     	jne	0x1454bc390 <.text+0x54bb390>
1454bc36b:     	movss	0x8(%rax,%r14), %xmm0
1454bc372:     	ucomiss	0x8(%r15,%r14), %xmm0
1454bc378:     	setp	%al
1454bc37b:     	setne	%cl
1454bc37e:     	orb	%al, %cl
1454bc380:     	orb	0x340(%rbp), %cl
1454bc386:     	testb	$0x1, %cl
1454bc389:     	je	0x1454bc323 <.text+0x54bb323>
1454bc38b:     	nopl	(%rax,%rax)
1454bc390:     	movd	0x8(%r15,%r14), %xmm10
1454bc397:     	movd	%xmm10, %eax
1454bc39c:     	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
1454bc3a1:     	cmpl	$0x7f7fffff, %eax       # imm = 0x7F7FFFFF
1454bc3a6:     	jg	0x1454bc323 <.text+0x54bb323>
1454bc3ac:     	callq	0x140002200 <.text+0x1200>
1454bc3b1:     	movl	$0x20, %ecx
1454bc3b6:     	movl	$0x1, %edx
1454bc3bb:     	callq	0x1400021c0 <.text+0x11c0>
1454bc3c0:     	testq	%rax, %rax
1454bc3c3:     	je	0x1454bc7ba <.text+0x54bb7ba>
1454bc3c9:     	subss	%xmm6, %xmm10
1454bc3ce:     	maxss	%xmm7, %xmm10
1454bc3d3:     	mulss	%xmm8, %xmm10
1454bc3d8:     	cvttss2si	%xmm10, %rcx
1454bc3dd:     	ucomiss	%xmm7, %xmm10
1454bc3e1:     	cmovbl	%r13d, %ecx
1454bc3e5:     	ucomiss	%xmm9, %xmm10
1454bc3e9:     	cmoval	%edi, %ecx
1454bc3ec:     	movb	%bl, (%rax)
1454bc3ee:     	movq	%rax, 0x358(%rbp)
1454bc3f5:     	movl	%ecx, 0x1(%rax)
1454bc3f8:     	movq	0x368(%rbp), %rax
1454bc3ff:     	movq	0x560(%rax), %rsi
1454bc406:     	cmpq	0x550(%rax), %rsi
1454bc40d:     	jne	0x1454bc2e0 <.text+0x54bb2e0>
1454bc413:     	movq	0x348(%rbp), %rcx
1454bc41a:     	callq	0x145774710 <.text+0x5773710>
1454bc41f:     	nop
1454bc420:     	jmp	0x1454bc2e0 <.text+0x54bb2e0>
1454bc425:     	movq	0x368(%rbp), %r14
1454bc42c:     	movq	0x6b0(%r14), %rdx
1454bc433:     	movq	0x6b8(%r14), %rdi
1454bc43a:     	movq	$0x0, 0x6d0(%r14)
1454bc445:     	cmpq	0x6c0(%r14), %rdi
1454bc44c:     	ja	0x1454bc759 <.text+0x54bb759>
1454bc452:     	xorl	%eax, %eax
1454bc454:     	movl	$0x0, %ebx
1454bc459:     	testq	%rdi, %rdi
1454bc45c:     	je	0x1454bc47e <.text+0x54bb47e>
1454bc45e:     	movq	%rax, %rbx
1454bc461:     	movq	%rdi, %r8
1454bc464:     	shlq	$0x4, %r8
1454bc468:     	movq	%rax, %rcx
1454bc46b:     	shlq	$0x4, %rcx
1454bc46f:     	addq	0x6c8(%r14), %rcx
1454bc476:     	callq	0x1457731ed <.text+0x57721ed>
1454bc47b:     	movq	%rdi, %rax
1454bc47e:     	addq	%rbx, %rax
1454bc481:     	movq	%rax, 0x6d0(%r14)
1454bc488:     	cmpq	$0x0, 0x8e8(%r14)
1454bc490:     	jne	0x1454bc4c5 <.text+0x54bb4c5>
1454bc492:     	jmp	0x1454bc64a <.text+0x54bb64a>
1454bc497:     	movq	0x368(%rbp), %r14
1454bc49e:     	movq	$0x0, 0x6d0(%r14)
1454bc4a9:     	xorl	%eax, %eax
1454bc4ab:     	xorl	%ebx, %ebx
1454bc4ad:     	addq	%rbx, %rax
1454bc4b0:     	movq	%rax, 0x6d0(%r14)
1454bc4b7:     	cmpq	$0x0, 0x8e8(%r14)
1454bc4bf:     	je	0x1454bc64a <.text+0x54bb64a>
1454bc4c5:     	movq	0x8e8(%r14), %rax
1454bc4cc:     	movq	%rax, 0x300(%rbp)
1454bc4d3:     	movups	0x8d8(%r14), %xmm0
1454bc4db:     	movaps	%xmm0, 0x2f0(%rbp)
1454bc4e2:     	movq	$0x0, 0x8d8(%r14)
1454bc4ed:     	movq	$0x0, 0x8e8(%r14)
1454bc4f8:     	movl	$0x0, 0x2d0(%rbp)
1454bc502:     	movq	$0x0, 0x2b8(%rbp)
1454bc50d:     	movq	$0x1, 0x2c0(%rbp)
1454bc518:     	movq	$0x0, 0x2c8(%rbp)
1454bc523:     	cmpq	$0x0, 0x300(%rbp)
1454bc52b:     	je	0x1454bc595 <.text+0x54bb595>
1454bc52d:     	movq	0x3e8(%r14), %rdi
1454bc534:     	movb	$0x1, 0x337(%rbp)
1454bc53b:     	leaq	0x2b8(%rbp), %rcx
1454bc542:     	callq	0x145903690 <.text+0x5902690>
1454bc547:     	nop
1454bc548:     	movq	0x2c0(%rbp), %rax
1454bc54f:     	movb	$0x0, (%rax)
1454bc552:     	movq	$0x1, 0x2c8(%rbp)
1454bc55d:     	movb	$0x1, 0x337(%rbp)
1454bc564:     	leaq	0x2b8(%rbp), %rdx
1454bc56b:     	movq	%rdi, %rcx
1454bc56e:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454bc573:     	nop
1454bc574:     	movb	$0x1, 0x337(%rbp)
1454bc57b:     	leaq	0x2f0(%rbp), %rcx
1454bc582:     	leaq	0x2b8(%rbp), %rdx
1454bc589:     	callq	0x145513880 <.text+0x5512880>
1454bc58e:     	nop
1454bc58f:     	incl	0x2d0(%rbp)
1454bc595:     	movq	0x2b8(%rbp), %rax
1454bc59c:     	movq	0x2c0(%rbp), %rcx
1454bc5a3:     	movq	0x2c8(%rbp), %rdx
1454bc5aa:     	movq	%rdx, 0xc0(%rbp)
1454bc5b1:     	movl	0x2d0(%rbp), %edx
1454bc5b7:     	movl	%edx, 0xc8(%rbp)
1454bc5bd:     	movl	0x2d4(%rbp), %edx
1454bc5c3:     	movl	%edx, 0xcc(%rbp)
1454bc5c9:     	movq	%rax, 0xb0(%rbp)
1454bc5d0:     	movq	%rcx, 0xb8(%rbp)
1454bc5d7:     	movb	$0x0, 0x337(%rbp)
1454bc5de:     	leaq	0x240(%rbp), %rcx
1454bc5e5:     	leaq	0xb0(%rbp), %rdx
1454bc5ec:     	callq	0x145512ef0 <.text+0x5511ef0>
1454bc5f1:     	nop
1454bc5f2:     	movq	0x560(%r14), %rsi
1454bc5f9:     	cmpq	0x550(%r14), %rsi
1454bc600:     	jne	0x1454bc60f <.text+0x54bb60f>
1454bc602:     	leaq	0x550(%r14), %rcx
1454bc609:     	callq	0x145774710 <.text+0x5773710>
1454bc60e:     	nop
1454bc60f:     	movq	0x558(%r14), %rax
1454bc616:     	movq	%rsi, %rcx
1454bc619:     	shlq	$0x5, %rcx
1454bc61d:     	movups	0x240(%rbp), %xmm0
1454bc624:     	movups	0x250(%rbp), %xmm1
1454bc62b:     	movups	%xmm1, 0x10(%rax,%rcx)
1454bc630:     	movups	%xmm0, (%rax,%rcx)
1454bc634:     	incq	%rsi
1454bc637:     	movq	%rsi, 0x560(%r14)
1454bc63e:     	leaq	0x2f0(%rbp), %rcx
1454bc645:     	callq	0x14550cd20 <.text+0x550bd20>
1454bc64a:     	movss	0x934(%r14), %xmm0
1454bc653:     	movaps	%xmm0, %xmm1
1454bc656:     	subss	0x988(%r14), %xmm1
1454bc65f:     	ucomiss	0x44cf7a(%rip), %xmm1   # 0x1459095e0
1454bc666:     	jae	0x1454bc672 <.text+0x54bb672>
1454bc668:     	cmpb	$0x1, 0x9b9(%r14)
1454bc670:     	je	0x1454bc67b <.text+0x54bb67b>
1454bc672:     	movss	%xmm0, 0x988(%r14)
1454bc67b:     	movaps	0x380(%rbp), %xmm6
1454bc682:     	movaps	0x390(%rbp), %xmm7
1454bc689:     	movaps	0x3a0(%rbp), %xmm8
1454bc691:     	movaps	0x3b0(%rbp), %xmm9
1454bc699:     	movaps	0x3c0(%rbp), %xmm10
1454bc6a1:     	movaps	0x3d0(%rbp), %xmm11
1454bc6a9:     	movaps	0x3e0(%rbp), %xmm12
1454bc6b1:     	movaps	0x3f0(%rbp), %xmm13
1454bc6b9:     	movaps	0x400(%rbp), %xmm14
1454bc6c1:     	movaps	0x410(%rbp), %xmm15
1454bc6c9:     	addq	$0x4a8, %rsp            # imm = 0x4A8
1454bc6d0:     	popq	%rbx
1454bc6d1:     	popq	%rdi
1454bc6d2:     	popq	%rsi
1454bc6d3:     	popq	%r12
1454bc6d5:     	popq	%r13
1454bc6d7:     	popq	%r14
1454bc6d9:     	popq	%r15
1454bc6db:     	popq	%rbp
1454bc6dc:     	retq
1454bc6dd:     	leaq	0x28(%r14), %rdx
1454bc6e1:     	addq	$-0x28, %rax
1454bc6e5:     	shrq	$0x3, %rax
1454bc6e9:     	movabsq	$-0x3333333333333333, %r8 # imm = 0xCCCCCCCCCCCCCCCD
1454bc6f3:     	imulq	%rax, %r8
1454bc6f7:     	negq	%r8
1454bc6fa:     	movl	$0x1, %eax
1454bc6ff:     	xorl	%r10d, %r10d
1454bc702:     	movq	%r14, %r11
1454bc705:     	jmp	0x1454bc72e <.text+0x54bb72e>
1454bc707:     	nopw	(%rax,%rax)
1454bc710:     	leaq	(%r8,%rax), %rdi
1454bc714:     	incq	%rdi
1454bc717:     	incq	%rax
1454bc71a:     	addq	$0x28, %rdx
1454bc71e:     	movq	%rsi, %r11
1454bc721:     	movq	%rcx, %r10
1454bc724:     	cmpq	$0x1, %rdi
1454bc728:     	je	0x1454bbcb7 <.text+0x54bacb7>
1454bc72e:     	movl	0x24(%r11), %ecx
1454bc732:     	movl	0x24(%rdx), %esi
1454bc735:     	movl	%ecx, %edi
1454bc737:     	sarl	$0x1f, %edi
1454bc73a:     	shrl	%edi
1454bc73c:     	xorl	%ecx, %edi
1454bc73e:     	movl	%esi, %ebx
1454bc740:     	sarl	$0x1f, %ebx
1454bc743:     	shrl	%ebx
1454bc745:     	xorl	%esi, %ebx
1454bc747:     	movq	%rdx, %rsi
1454bc74a:     	movq	%rax, %rcx
1454bc74d:     	cmpl	%ebx, %edi
1454bc74f:     	jg	0x1454bc710 <.text+0x54bb710>
1454bc751:     	movq	%r11, %rsi
1454bc754:     	movq	%r10, %rcx
1454bc757:     	jmp	0x1454bc710 <.text+0x54bb710>
1454bc759:     	leaq	0x6c0(%r14), %rcx
1454bc760:     	movq	$0x10, 0x20(%rsp)
1454bc769:     	movl	$0x4, %r9d
1454bc76f:     	movq	%rdx, %rsi
1454bc772:     	xorl	%edx, %edx
1454bc774:     	movq	%rdi, %r8
1454bc777:     	callq	0x1457744b0 <.text+0x57734b0>
1454bc77c:     	movq	%rsi, %rdx
1454bc77f:     	movq	0x6d0(%r14), %rax
1454bc786:     	jmp	0x1454bc45e <.text+0x54bb45e>
1454bc78b:     	movl	$0x8, %ecx
1454bc790:     	movl	$0x8, %edx
1454bc795:     	callq	0x145903781 <.text+0x5902781>
1454bc79a:     	ud2
1454bc79c:     	leaq	0x153cac2(%rip), %rcx   # 0x1469f9265
1454bc7a3:     	leaq	0x153cb36(%rip), %r8    # 0x1469f92e0
1454bc7aa:     	movl	$0x19, %edx
1454bc7af:     	callq	0x145903cf0 <.text+0x5902cf0>
1454bc7b4:     	nop
1454bc7b5:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc7ba:     	movl	$0x1, %ecx
1454bc7bf:     	movl	$0x20, %edx
1454bc7c4:     	callq	0x14590379b <.text+0x590279b>
1454bc7c9:     	ud2
1454bc7cb:     	leaq	0x153aa16(%rip), %r8    # 0x1469f71e8
1454bc7d2:     	movq	%r12, %rcx
1454bc7d5:     	callq	0x145903b33 <.text+0x5902b33>
1454bc7da:     	nop
1454bc7db:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc7e0:     	movb	%r12b, 0x377(%rbp)
1454bc7e7:     	leaq	0x153b9ca(%rip), %r8    # 0x1469f81b8
1454bc7ee:     	movq	%rdi, %rcx
1454bc7f1:     	callq	0x145903b33 <.text+0x5902b33>
1454bc7f6:     	nop
1454bc7f7:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc7fc:     	movb	%r12b, 0x377(%rbp)
1454bc803:     	leaq	0x153b94e(%rip), %r8    # 0x1469f8158
1454bc80a:     	movq	%rdi, %rcx
1454bc80d:     	callq	0x145903b33 <.text+0x5902b33>
1454bc812:     	nop
1454bc813:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc818:     	movb	%r12b, 0x377(%rbp)
1454bc81f:     	leaq	0x153b91a(%rip), %r8    # 0x1469f8140
1454bc826:     	movq	%rdi, %rcx
1454bc829:     	callq	0x145903b33 <.text+0x5902b33>
1454bc82e:     	nop
1454bc82f:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc834:     	leaq	0x153a535(%rip), %r8    # 0x1469f6d70
1454bc83b:     	movq	%rdi, %rcx
1454bc83e:     	callq	0x145903b33 <.text+0x5902b33>
1454bc843:     	ud2
1454bc845:     	leaq	0x153a50c(%rip), %r8    # 0x1469f6d58
1454bc84c:     	movq	%rdi, %rcx
1454bc84f:     	callq	0x145903b33 <.text+0x5902b33>
1454bc854:     	ud2
1454bc856:     	movb	%r12b, 0x377(%rbp)
1454bc85d:     	leaq	0x153b90c(%rip), %r8    # 0x1469f8170
1454bc864:     	movq	%rdi, %rcx
1454bc867:     	callq	0x145903b33 <.text+0x5902b33>
1454bc86c:     	nop
1454bc86d:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc872:     	leaq	0x153a20f(%rip), %r8    # 0x1469f6a88
1454bc879:     	movq	%rbx, %rcx
1454bc87c:     	callq	0x145903b33 <.text+0x5902b33>
1454bc881:     	ud2
1454bc883:     	leaq	0x153b86e(%rip), %r8    # 0x1469f80f8
1454bc88a:     	movq	%rdi, %rcx
1454bc88d:     	movq	%r14, %rdx
1454bc890:     	callq	0x14590386b <.text+0x590286b>
1454bc895:     	ud2
1454bc897:     	movl	0x348(%rbp), %eax
1454bc89d:     	movb	%al, 0x367(%rbp)
1454bc8a3:     	leaq	0x153a596(%rip), %r8    # 0x1469f6e40
1454bc8aa:     	movq	%r14, %rcx
1454bc8ad:     	callq	0x145903b33 <.text+0x5902b33>
1454bc8b2:     	nop
1454bc8b3:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc8b8:     	leaq	0x153a4c9(%rip), %r8    # 0x1469f6d88
1454bc8bf:     	movq	%rdi, %rcx
1454bc8c2:     	callq	0x145903b33 <.text+0x5902b33>
1454bc8c7:     	ud2
1454bc8c9:     	leaq	0x153a690(%rip), %r8    # 0x1469f6f60
1454bc8d0:     	movq	%r15, %rcx
1454bc8d3:     	callq	0x145903b33 <.text+0x5902b33>
1454bc8d8:     	ud2
1454bc8da:     	movl	0x348(%rbp), %eax
1454bc8e0:     	movb	%al, 0x367(%rbp)
1454bc8e6:     	leaq	0x153a56b(%rip), %r8    # 0x1469f6e58
1454bc8ed:     	movq	%r14, %rcx
1454bc8f0:     	movq	%rdi, %rdx
1454bc8f3:     	callq	0x145903b33 <.text+0x5902b33>
1454bc8f8:     	nop
1454bc8f9:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc8fe:     	movl	$0x1, %ecx
1454bc903:     	movl	$0x20, %edx
1454bc908:     	callq	0x14590379b <.text+0x590279b>
1454bc90d:     	nop
1454bc90e:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc913:     	movb	%sil, 0x357(%rbp)
1454bc91a:     	leaq	0x153b44f(%rip), %r8    # 0x1469f7d70
1454bc921:     	movq	%rbx, %rcx
1454bc924:     	callq	0x145903b33 <.text+0x5902b33>
1454bc929:     	nop
1454bc92a:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc92f:     	leaq	0x153a91a(%rip), %r8    # 0x1469f7250
1454bc936:     	movq	%rax, %rcx
1454bc939:     	movq	0x348(%rbp), %rdx
1454bc940:     	callq	0x145903b33 <.text+0x5902b33>
1454bc945:     	nop
1454bc946:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc94b:     	leaq	0x153a5c6(%rip), %r8    # 0x1469f6f18
1454bc952:     	movq	%r15, %rcx
1454bc955:     	callq	0x145903b33 <.text+0x5902b33>
1454bc95a:     	nop
1454bc95b:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc960:     	movb	%r12b, 0x377(%rbp)
1454bc967:     	leaq	0x153b832(%rip), %r8    # 0x1469f81a0
1454bc96e:     	movq	%rdi, %rcx
1454bc971:     	callq	0x145903b33 <.text+0x5902b33>
1454bc976:     	nop
1454bc977:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc97c:     	movb	%r12b, 0x377(%rbp)
1454bc983:     	leaq	0x153b82e(%rip), %r8    # 0x1469f81b8
1454bc98a:     	movq	%rdi, %rcx
1454bc98d:     	callq	0x145903b33 <.text+0x5902b33>
1454bc992:     	nop
1454bc993:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc998:     	leaq	0x153b8b1(%rip), %r8    # 0x1469f8250
1454bc99f:     	movq	%r14, %rcx
1454bc9a2:     	callq	0x145903b33 <.text+0x5902b33>
1454bc9a7:     	ud2
1454bc9a9:     	movl	$0x1, %ecx
1454bc9ae:     	movl	$0x20, %edx
1454bc9b3:     	callq	0x14590379b <.text+0x590279b>
1454bc9b8:     	nop
1454bc9b9:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc9be:     	movl	$0x1, %ecx
1454bc9c3:     	movl	$0x20, %edx
1454bc9c8:     	callq	0x14590379b <.text+0x590279b>
1454bc9cd:     	nop
1454bc9ce:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc9d3:     	movl	$0x1, %ecx
1454bc9d8:     	movl	$0x20, %edx
1454bc9dd:     	callq	0x14590379b <.text+0x590279b>
1454bc9e2:     	nop
1454bc9e3:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bc9e8:     	movl	0x340(%rbp), %eax
1454bc9ee:     	movb	%al, 0x377(%rbp)
1454bc9f4:     	movl	$0x1, %ecx
1454bc9f9:     	movl	$0x20, %edx
1454bc9fe:     	callq	0x14590379b <.text+0x590279b>
1454bca03:     	nop
1454bca04:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bca09:     	movl	0x340(%rbp), %eax
1454bca0f:     	movb	%al, 0x377(%rbp)
1454bca15:     	movl	$0x1, %ecx
1454bca1a:     	movl	$0x20, %edx
1454bca1f:     	callq	0x14590379b <.text+0x590279b>
1454bca24:     	nop
1454bca25:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bca2a:     	movl	0x340(%rbp), %eax
1454bca30:     	movb	%al, 0x377(%rbp)
1454bca36:     	movl	$0x1, %ecx
1454bca3b:     	movl	$0x20, %edx
1454bca40:     	callq	0x14590379b <.text+0x590279b>
1454bca45:     	nop
1454bca46:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bca4b:     	movb	%r12b, 0x377(%rbp)
1454bca52:     	leaq	0x153b72f(%rip), %r8    # 0x1469f8188
1454bca59:     	movq	%rdi, %rcx
1454bca5c:     	callq	0x145903b33 <.text+0x5902b33>
1454bca61:     	nop
1454bca62:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bca67:     	movl	0x348(%rbp), %eax
1454bca6d:     	movb	%al, 0x367(%rbp)
1454bca73:     	leaq	0x153a43e(%rip), %r8    # 0x1469f6eb8
1454bca7a:     	movq	%r14, %rcx
1454bca7d:     	movq	%rdi, %rdx
1454bca80:     	callq	0x145903b33 <.text+0x5902b33>
1454bca85:     	nop
1454bca86:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bca8b:     	leaq	0x153a546(%rip), %r8    # 0x1469f6fd8
1454bca92:     	movq	%r15, %rcx
1454bca95:     	callq	0x145903b33 <.text+0x5902b33>
1454bca9a:     	ud2
1454bca9c:     	leaq	0x153a4ed(%rip), %r8    # 0x1469f6f90
1454bcaa3:     	movq	%r15, %rcx
1454bcaa6:     	callq	0x145903b33 <.text+0x5902b33>
1454bcaab:     	ud2
1454bcaad:     	leaq	0x153b8dc(%rip), %r8    # 0x1469f8390
1454bcab4:     	movq	%rdi, %rcx
1454bcab7:     	callq	0x145903b33 <.text+0x5902b33>
1454bcabc:     	ud2
1454bcabe:     	leaq	0x153b8e3(%rip), %r8    # 0x1469f83a8
1454bcac5:     	movq	%r14, %rcx
1454bcac8:     	callq	0x145903b33 <.text+0x5902b33>
1454bcacd:     	ud2
1454bcacf:     	movl	$0x4, %ecx
1454bcad4:     	movl	$0xc, %edx
1454bcad9:     	callq	0x14590379b <.text+0x590279b>
1454bcade:     	ud2
1454bcae0:     	leaq	0x153a509(%rip), %r8    # 0x1469f6ff0
1454bcae7:     	movq	%r15, %rcx
1454bcaea:     	callq	0x145903b33 <.text+0x5902b33>
1454bcaef:     	ud2
1454bcaf1:     	movq	%r9, 0x310(%rbp)
1454bcaf8:     	leaq	0x153a3d1(%rip), %r8    # 0x1469f6ed0
1454bcaff:     	movq	%r14, %rcx
1454bcb02:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb07:     	nop
1454bcb08:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb0d:     	movq	%r9, 0x310(%rbp)
1454bcb14:     	leaq	0x153a30d(%rip), %r8    # 0x1469f6e28
1454bcb1b:     	movq	%r14, %rcx
1454bcb1e:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb23:     	nop
1454bcb24:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb29:     	movl	0x348(%rbp), %eax
1454bcb2f:     	movb	%al, 0x367(%rbp)
1454bcb35:     	leaq	0x153a334(%rip), %r8    # 0x1469f6e70
1454bcb3c:     	movq	%r14, %rcx
1454bcb3f:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb44:     	nop
1454bcb45:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb4a:     	movl	0x348(%rbp), %eax
1454bcb50:     	movb	%al, 0x367(%rbp)
1454bcb56:     	leaq	0x153a343(%rip), %r8    # 0x1469f6ea0
1454bcb5d:     	movq	%r14, %rcx
1454bcb60:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb65:     	nop
1454bcb66:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb6b:     	leaq	0x187816e(%rip), %r8    # 0x146d34ce0
1454bcb72:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb77:     	nop
1454bcb78:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb7d:     	leaq	0x187815c(%rip), %r8    # 0x146d34ce0
1454bcb84:     	callq	0x145903b33 <.text+0x5902b33>
1454bcb89:     	nop
1454bcb8a:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcb8f:     	movl	$0x4, %ecx
1454bcb94:     	movq	%rbx, %rdx
1454bcb97:     	callq	0x14590379b <.text+0x590279b>
1454bcb9c:     	ud2
1454bcb9e:     	leaq	0x18782e3(%rip), %r8    # 0x146d34e88
1454bcba5:     	callq	0x145903b33 <.text+0x5902b33>
1454bcbaa:     	nop
1454bcbab:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcbb0:     	leaq	0x18782d1(%rip), %r8    # 0x146d34e88
1454bcbb7:     	callq	0x145903b33 <.text+0x5902b33>
1454bcbbc:     	nop
1454bcbbd:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcbc2:     	leaq	0x153a3df(%rip), %r8    # 0x1469f6fa8
1454bcbc9:     	movq	%r15, %rcx
1454bcbcc:     	callq	0x145903b33 <.text+0x5902b33>
1454bcbd1:     	ud2
1454bcbd3:     	leaq	0x153a3e6(%rip), %r8    # 0x1469f6fc0
1454bcbda:     	movq	%r15, %rcx
1454bcbdd:     	callq	0x145903b33 <.text+0x5902b33>
1454bcbe2:     	ud2
1454bcbe4:     	leaq	0x12813c5(%rip), %r8    # 0x14673dfb0
1454bcbeb:     	callq	0x145903b33 <.text+0x5902b33>
1454bcbf0:     	nop
1454bcbf1:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcbf6:     	leaq	0x12813cb(%rip), %r8    # 0x14673dfc8
1454bcbfd:     	movq	%rax, %rcx
1454bcc00:     	movq	0x80(%rbp), %rdx
1454bcc07:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc0c:     	nop
1454bcc0d:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcc12:     	leaq	0x153b4f7(%rip), %r8    # 0x1469f8110
1454bcc19:     	movq	0x348(%rbp), %rcx
1454bcc20:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc25:     	ud2
1454bcc27:     	leaq	0x153b63a(%rip), %r8    # 0x1469f8268
1454bcc2e:     	movq	%r14, %rcx
1454bcc31:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc36:     	ud2
1454bcc38:     	leaq	0x153b641(%rip), %r8    # 0x1469f8280
1454bcc3f:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc44:     	ud2
1454bcc46:     	movl	0x340(%rbp), %eax
1454bcc4c:     	movb	%al, 0x377(%rbp)
1454bcc52:     	movl	$0x1, %ecx
1454bcc57:     	movl	$0x20, %edx
1454bcc5c:     	callq	0x14590379b <.text+0x590279b>
1454bcc61:     	nop
1454bcc62:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcc67:     	movl	0x348(%rbp), %eax
1454bcc6d:     	movb	%al, 0x367(%rbp)
1454bcc73:     	leaq	0x153a20e(%rip), %r8    # 0x1469f6e88
1454bcc7a:     	movq	%r14, %rcx
1454bcc7d:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc82:     	nop
1454bcc83:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcc88:     	leaq	0x153a6c1(%rip), %r8    # 0x1469f7350
1454bcc8f:     	movq	%rdx, %rcx
1454bcc92:     	movq	%r9, %rdx
1454bcc95:     	callq	0x145903b33 <.text+0x5902b33>
1454bcc9a:     	nop
1454bcc9b:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcca0:     	leaq	0x153b559(%rip), %r8    # 0x1469f8200
1454bcca7:     	movq	%r9, %rdx
1454bccaa:     	callq	0x145903b33 <.text+0x5902b33>
1454bccaf:     	ud2
1454bccb1:     	leaq	0x153b560(%rip), %r8    # 0x1469f8218
1454bccb8:     	callq	0x145903b33 <.text+0x5902b33>
1454bccbd:     	ud2
1454bccbf:     	leaq	0x153a432(%rip), %r8    # 0x1469f70f8
1454bccc6:     	movq	%rdx, %rcx
1454bccc9:     	movq	%r9, %rdx
1454bcccc:     	callq	0x145903b33 <.text+0x5902b33>
1454bccd1:     	nop
1454bccd2:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bccd4:     	leaq	0x153a58d(%rip), %r8    # 0x1469f7268
1454bccdb:     	movq	%rbx, %rcx
1454bccde:     	callq	0x145903b33 <.text+0x5902b33>
1454bcce3:     	nop
1454bcce4:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcce6:     	leaq	0x153a49b(%rip), %r8    # 0x1469f7188
1454bcced:     	callq	0x145903b33 <.text+0x5902b33>
1454bccf2:     	nop
1454bccf3:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bccf5:     	movl	0x348(%rbp), %eax
1454bccfb:     	movb	%al, 0x367(%rbp)
1454bcd01:     	leaq	0x153a108(%rip), %r8    # 0x1469f6e10
1454bcd08:     	movq	%r14, %rcx
1454bcd0b:     	callq	0x145903b33 <.text+0x5902b33>
1454bcd10:     	nop
1454bcd11:     	jmp	0x1454bcd38 <.text+0x54bbd38>
1454bcd13:     	leaq	0x153a25e(%rip), %r8    # 0x1469f6f78
1454bcd1a:     	movq	%r15, %rcx
1454bcd1d:     	callq	0x145903b33 <.text+0x5902b33>
1454bcd22:     	ud2
1454bcd24:     	leaq	0x153a3fd(%rip), %r8    # 0x1469f7128
1454bcd2b:     	movq	0x80(%rbp), %rdx
1454bcd32:     	callq	0x145903b33 <.text+0x5902b33>
1454bcd37:     	nop
1454bcd38:     	ud2
1454bcd3a:     	leaq	0x153b3e7(%rip), %r8    # 0x1469f8128
1454bcd41:     	movq	0x348(%rbp), %rcx
1454bcd48:     	movq	%rbx, %rdx
1454bcd4b:     	callq	0x14590386b <.text+0x590286b>
1454bcd50:     	ud2
