
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ca1d9:     	cmpq	0xc0(%rsi), %r12
1454ca1e0:     	ja	0x1454ca1e9 <.text+0x54c91e9>
1454ca1e2:     	movq	%r12, 0xc0(%rsi)
1454ca1e9:     	movq	0x710(%rsi), %rdx
1454ca1f0:     	movq	0x718(%rsi), %r8
1454ca1f7:     	shlq	$0x6, %r8
1454ca1fb:     	addq	%rdx, %r8
1454ca1fe:     	movb	$0x0, 0x197(%rbp)
1454ca205:     	leaq	0x110(%rbp), %rcx
1454ca20c:     	callq	0x14553a530 <.text+0x5539530>
1454ca211:     	nop
1454ca212:     	movq	0x110(%rbp), %rax
1454ca219:     	movq	%rax, 0x180(%rbp)
1454ca220:     	movq	0x118(%rbp), %rax
1454ca227:     	movq	%rax, 0x188(%rbp)
1454ca22e:     	movq	0x120(%rbp), %rcx
1454ca235:     	xorl	%eax, %eax
1454ca237:     	movq	%rcx, %rdx
1454ca23a:     	subq	%r12, %rdx
1454ca23d:     	cmovaeq	%rdx, %rax
1454ca241:     	movq	%r12, %rdx
1454ca244:     	subq	%rcx, %rdx
1454ca247:     	jae	0x1454ca511 <.text+0x54c9511>
1454ca24d:     	movl	%eax, %ecx
1454ca24f:     	andl	$0x3, %ecx
1454ca252:     	cmpq	$-0x4, %rdx
1454ca256:     	jbe	0x1454ca2aa <.text+0x54c92aa>
1454ca258:     	xorl	%edx, %edx
1454ca25a:     	movq	0x188(%rbp), %rdi
1454ca261:     	jmp	0x1454ca330 <.text+0x54c9330>
1454ca266:     	leaq	(%rax,%rax,2), %rax
1454ca26a:     	leaq	(%rcx,%rax,8), %rbx
1454ca26e:     	addq	$0x8, %rbx
1454ca272:     	jmp	0x1454ca28d <.text+0x54c928d>
1454ca274:     	nopw	%cs:(%rax,%rax)
1454ca280:     	addq	$0x18, %rbx
1454ca284:     	decq	%rdi
1454ca287:     	je	0x1454ca1a1 <.text+0x54c91a1>
1454ca28d:     	movq	-0x8(%rbx), %rdx
1454ca291:     	testq	%rdx, %rdx
1454ca294:     	je	0x1454ca280 <.text+0x54c9280>
1454ca296:     	movq	(%rbx), %rcx
1454ca299:     	shlq	$0x2, %rdx
1454ca29d:     	movl	$0x4, %r8d
1454ca2a3:     	callq	0x1400021d0 <.text+0x11d0>
1454ca2a8:     	jmp	0x1454ca280 <.text+0x54c9280>
1454ca2aa:     	movabsq	$0x7fffffffffffffc, %r8 # imm = 0x7FFFFFFFFFFFFFC
1454ca2b4:     	andq	%rax, %r8
1454ca2b7:     	leaq	(,%r12,8), %rdx
1454ca2bf:     	leaq	(%rdx,%rdx,2), %r9
1454ca2c3:     	xorl	%edx, %edx
1454ca2c5:     	movq	0x188(%rbp), %rdi
1454ca2cc:     	movq	%rdi, %r10
1454ca2cf:     	nop
1454ca2d0:     	movups	(%r10,%r9), %xmm0
1454ca2d5:     	movq	0x10(%r10,%r9), %r11
1454ca2da:     	movq	%r11, 0x10(%r10)
1454ca2de:     	movups	%xmm0, (%r10)
1454ca2e2:     	movups	0x18(%r10,%r9), %xmm0
1454ca2e8:     	movq	0x28(%r10,%r9), %r11
1454ca2ed:     	movq	%r11, 0x28(%r10)
1454ca2f1:     	movups	%xmm0, 0x18(%r10)
1454ca2f6:     	movups	0x30(%r10,%r9), %xmm0
1454ca2fc:     	movq	0x40(%r10,%r9), %r11
1454ca301:     	movq	%r11, 0x40(%r10)
1454ca305:     	movups	%xmm0, 0x30(%r10)
1454ca30a:     	addq	$0x4, %rdx
1454ca30e:     	movups	0x48(%r10,%r9), %xmm0
1454ca314:     	movq	0x58(%r10,%r9), %r11
1454ca319:     	movq	%r11, 0x58(%r10)
1454ca31d:     	movups	%xmm0, 0x48(%r10)
1454ca322:     	addq	$0x60, %r10
1454ca326:     	cmpq	%rdx, %r8
1454ca329:     	jne	0x1454ca2d0 <.text+0x54c92d0>
1454ca32b:     	testq	%rcx, %rcx
1454ca32e:     	je	0x1454ca35a <.text+0x54c935a>
1454ca330:     	leaq	(%rdx,%rdx,2), %rdx
1454ca334:     	leaq	(%rdi,%rdx,8), %rdx
1454ca338:     	shlq	$0x3, %r12
1454ca33c:     	leaq	(%r12,%r12,2), %r8
1454ca340:     	movups	(%rdx,%r8), %xmm0
1454ca345:     	movq	0x10(%rdx,%r8), %r9
1454ca34a:     	movq	%r9, 0x10(%rdx)
1454ca34e:     	movups	%xmm0, (%rdx)
1454ca351:     	addq	$0x18, %rdx
1454ca355:     	decq	%rcx
1454ca358:     	jne	0x1454ca340 <.text+0x54c9340>
1454ca35a:     	leaq	(%rax,%rax,2), %rax
1454ca35e:     	leaq	(%rdi,%rax,8), %rax
1454ca362:     	movq	%rax, 0x178(%rbp)
1454ca369:     	leaq	0x126c7d8(%rip), %r14   # 0x146736b48
1454ca370:     	xorps	%xmm6, %xmm6
1454ca373:     	movsd	0x44e355(%rip), %xmm7   # 0x1459186d0
1454ca37b:     	movsd	0x43d1cc(%rip), %xmm8   # 0x145907550
1454ca384:     	movaps	0x44e354(%rip), %xmm9   # 0x1459186e0
1454ca38c:     	movq	%rdi, %rax
1454ca38f:     	jmp	0x1454ca414 <.text+0x54c9414>
1454ca394:     	nopw	%cs:(%rax,%rax)
1454ca3a0:     	movq	0xb8(%rsi), %rax
1454ca3a7:     	leaq	(%r15,%r15,2), %rcx
1454ca3ab:     	shlq	$0x5, %rcx
1454ca3af:     	movq	0xc0(%rbp), %rdx
1454ca3b6:     	movq	%rdx, 0x50(%rax,%rcx)
1454ca3bb:     	movups	0xb0(%rbp), %xmm0
1454ca3c2:     	movups	%xmm0, 0x40(%rax,%rcx)
1454ca3c7:     	movups	0x70(%rbp), %xmm0
1454ca3cb:     	movups	0x80(%rbp), %xmm1
1454ca3d2:     	movups	0x90(%rbp), %xmm2
1454ca3d9:     	movups	0xa0(%rbp), %xmm3
1454ca3e0:     	movups	%xmm3, 0x30(%rax,%rcx)
1454ca3e5:     	movups	%xmm2, 0x20(%rax,%rcx)
1454ca3ea:     	movups	%xmm1, 0x10(%rax,%rcx)
1454ca3ef:     	movups	%xmm0, (%rax,%rcx)
1454ca3f3:     	movss	%xmm10, 0x58(%rax,%rcx)
1454ca3fa:     	incq	%r15
1454ca3fd:     	movq	%r15, 0xc0(%rsi)
1454ca404:     	movq	%rdi, %rax
1454ca407:     	cmpq	0x178(%rbp), %rdi
1454ca40e:     	je	0x1454ca511 <.text+0x54c9511>
1454ca414:     	movq	(%rax), %r12
1454ca417:     	testq	%r12, %r12
1454ca41a:     	je	0x1454ca511 <.text+0x54c9511>
1454ca420:     	movq	%r13, %rbx
1454ca423:     	leaq	0x18(%rax), %rdi
1454ca427:     	movss	0x10(%rax), %xmm10
1454ca42d:     	movq	0x8(%rax), %r13
1454ca431:     	movq	%r12, 0xe0(%rbp)
1454ca438:     	movq	%r13, 0xe8(%rbp)
1454ca43f:     	xorl	%r15d, %r15d
1454ca442:     	jmp	0x1454ca461 <.text+0x54c9461>
1454ca444:     	nopw	%cs:(%rax,%rax)
1454ca450:     	addq	$0x78, %r15
1454ca454:     	cmpq	$0x3480, %r15           # imm = 0x3480
1454ca45b:     	je	0x1454ca75b <.text+0x54c975b>
1454ca461:     	cmpq	%r13, 0x8(%r15,%r14)
1454ca466:     	jne	0x1454ca450 <.text+0x54c9450>
1454ca468:     	movq	(%r15,%r14), %rcx
1454ca46c:     	movq	%r12, %rdx
1454ca46f:     	movq	%r13, %r8
1454ca472:     	callq	0x1457731e7 <.text+0x57721e7>
1454ca477:     	testl	%eax, %eax
1454ca479:     	jne	0x1454ca450 <.text+0x54c9450>
1454ca47b:     	leaq	0x94(%rbp), %rax
1454ca482:     	movups	%xmm6, (%rax)
1454ca485:     	movl	$0x0, 0x10(%rax)
1454ca48c:     	addq	%r14, %r15
1454ca48f:     	movq	%r15, 0x70(%rbp)
1454ca493:     	movl	$0x1, 0x78(%rbp)
1454ca49a:     	movsd	%xmm7, 0x7c(%rbp)
1454ca49f:     	movq	$0x3f800000, 0x84(%rbp) # imm = 0x3F800000
1454ca4aa:     	movsd	%xmm8, 0x8c(%rbp)
1454ca4b3:     	movsd	%xmm8, 0xa8(%rbp)
1454ca4bc:     	movl	$0x0, 0xb0(%rbp)
1454ca4c6:     	movups	%xmm9, 0xb4(%rbp)
1454ca4ce:     	leaq	0xa8(%rbp), %rcx
1454ca4d5:     	movq	%rbx, %r13
1454ca4d8:     	movq	%rbx, %rdx
1454ca4db:     	movq	%r15, %r8
1454ca4de:     	callq	0x145451c30 <.text+0x5450c30>
1454ca4e3:     	nop
1454ca4e4:     	movl	$0x3f800000, 0x7c(%rbp) # imm = 0x3F800000
1454ca4eb:     	movq	0xc0(%rsi), %r15
1454ca4f2:     	cmpq	0xb0(%rsi), %r15
1454ca4f9:     	jne	0x1454ca3a0 <.text+0x54c93a0>
1454ca4ff:     	leaq	0xb0(%rsi), %rcx
1454ca506:     	callq	0x145780110 <.text+0x577f110>
1454ca50b:     	nop
1454ca50c:     	jmp	0x1454ca3a0 <.text+0x54c93a0>
