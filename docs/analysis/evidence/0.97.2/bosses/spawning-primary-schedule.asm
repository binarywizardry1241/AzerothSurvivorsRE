
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a92bd:     	movq	0x8b0(%r13), %rax
1454a92c4:     	cmpq	$0x5, %rax
1454a92c8:     	jae	0x1454a9310 <.text+0x54a8310>
1454a92ca:     	movq	0x338(%rbp), %rcx
1454a92d1:     	movq	0x88(%rcx), %rdx
1454a92d8:     	imulq	$0x58, %rax, %rcx
1454a92dc:     	movss	0x68(%rbp), %xmm1
1454a92e1:     	ucomiss	0x40(%rdx,%rcx), %xmm1
1454a92e6:     	jb	0x1454a93d6 <.text+0x54a83d6>
1454a92ec:     	addq	%rcx, %rdx
1454a92ef:     	incq	%rax
1454a92f2:     	movq	%rax, 0x8b0(%r13)
1454a92f9:     	movq	%r13, %rcx
1454a92fc:     	callq	0x1454bf100 <.text+0x54be100>
1454a9301:     	nop
1454a9302:     	movss	0x8e4(%r13), %xmm0
1454a930b:     	jmp	0x1454a93d6 <.text+0x54a83d6>
1454a9310:     	cmpb	$0x0, 0x952(%r13)
1454a9318:     	je	0x1454a93d6 <.text+0x54a83d6>
1454a931e:     	ucomiss	0x934(%r13), %xmm0
1454a9326:     	jb	0x1454a93d6 <.text+0x54a83d6>
1454a932c:     	movq	0x880(%r13), %r9
1454a9333:     	movq	0x888(%r13), %rcx
1454a933a:     	movq	0x898(%r13), %r10
1454a9341:     	movq	0x890(%r13), %r8
1454a9348:     	movl	$0x5, %r11d
1454a934e:     	nop
1454a9350:     	leaq	(%r9,%r10), %rax
1454a9354:     	rolq	$0x17, %rax
1454a9358:     	addq	%r9, %rax
1454a935b:     	movq	%rcx, %rdx
1454a935e:     	shlq	$0x11, %rdx
1454a9362:     	xorq	%r9, %r8
1454a9365:     	xorq	%rcx, %r10
1454a9368:     	xorq	%r8, %rcx
1454a936b:     	xorq	%r10, %r9
1454a936e:     	rolq	$0x2d, %r10
1454a9372:     	xorq	%rdx, %r8
1454a9375:     	mulq	%r11
1454a9378:     	shrq	$0x3d, %rax
1454a937c:     	cmpl	$0x4, %eax
1454a937f:     	ja	0x1454a9350 <.text+0x54a8350>
1454a9381:     	movq	%r9, 0x880(%r13)
1454a9388:     	movq	%r10, 0x898(%r13)
1454a938f:     	movq	%rcx, 0x888(%r13)
1454a9396:     	movq	%r8, 0x890(%r13)
1454a939d:     	imulq	$0x58, %rdx, %rdx
1454a93a1:     	movq	0x338(%rbp), %rax
1454a93a8:     	addq	0x88(%rax), %rdx
1454a93af:     	movq	%r13, %rcx
1454a93b2:     	callq	0x1454bf100 <.text+0x54be100>
1454a93b7:     	nop
1454a93b8:     	movss	0x8e4(%r13), %xmm0
1454a93c1:     	movss	0x51e6bb(%rip), %xmm1   # 0x1459c7a84
1454a93c9:     	addss	%xmm0, %xmm1
1454a93cd:     	movss	%xmm1, 0x934(%r13)
