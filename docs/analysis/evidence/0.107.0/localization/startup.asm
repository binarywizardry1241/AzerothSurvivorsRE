
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bf0c0:     	pushq	%rbp
1458bf0c1:     	pushq	%r15
1458bf0c3:     	pushq	%r14
1458bf0c5:     	pushq	%r13
1458bf0c7:     	pushq	%r12
1458bf0c9:     	pushq	%rsi
1458bf0ca:     	pushq	%rdi
1458bf0cb:     	pushq	%rbx
1458bf0cc:     	subq	$0x88, %rsp
1458bf0d3:     	leaq	0x80(%rsp), %rbp
1458bf0db:     	movdqa	%xmm7, -0x10(%rbp)
1458bf0e0:     	movdqa	%xmm6, -0x20(%rbp)
1458bf0e5:     	movq	$-0x2, -0x28(%rbp)
1458bf0ed:     	leaq	0x132a8f4(%rip), %rdx   # 0x146be99e8
1458bf0f4:     	leaq	-0x58(%rbp), %rcx
1458bf0f8:     	movl	$0x8, %r8d
1458bf0fe:     	callq	0x1458d1c90 <.text+0x58d0c90>
1458bf103:     	movq	-0x58(%rbp), %rax
1458bf107:     	cmpq	$-0x1, %rax
1458bf10b:     	je	0x1458bf250 <.text+0x58be250>
1458bf111:     	movq	%rax, -0x30(%rbp)
1458bf115:     	movq	-0x50(%rbp), %rcx
1458bf119:     	movq	-0x48(%rbp), %rdx
1458bf11d:     	movq	%rcx, -0x38(%rbp)
1458bf121:     	callq	0x1400f2b10 <.text+0xf1b10>
1458bf126:     	nop
1458bf127:     	movq	%rdx, %rsi
1458bf12a:     	testq	%rdx, %rdx
1458bf12d:     	jns	0x1458bf143 <.text+0x58be143>
1458bf12f:     	xorl	%r14d, %r14d
1458bf132:     	movq	%r14, %rcx
1458bf135:     	movq	%rsi, %rdx
1458bf138:     	callq	0x145d9370b <.text+0x5d9270b>
1458bf13d:     	nop
1458bf13e:     	jmp	0x1458bf729 <.text+0x58be729>
1458bf143:     	testq	%rsi, %rsi
1458bf146:     	je	0x1458bf452 <.text+0x58be452>
1458bf14c:     	movq	%rax, %rbx
1458bf14f:     	callq	0x140002200 <.text+0x1200>
1458bf154:     	movl	$0x1, %r14d
1458bf15a:     	movl	$0x1, %edx
1458bf15f:     	movq	%rsi, %rcx
1458bf162:     	callq	0x1400021c0 <.text+0x11c0>
1458bf167:     	testq	%rax, %rax
1458bf16a:     	je	0x1458bf132 <.text+0x58be132>
1458bf16c:     	movq	%rax, %rdi
1458bf16f:     	movq	%rax, %rcx
1458bf172:     	movq	%rbx, %rdx
1458bf175:     	movq	%rsi, %r8
1458bf178:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458bf17d:     	movq	-0x30(%rbp), %rdx
1458bf181:     	testq	%rdx, %rdx
1458bf184:     	je	0x1458bf195 <.text+0x58be195>
1458bf186:     	movl	$0x1, %r8d
1458bf18c:     	movq	-0x38(%rbp), %rcx
1458bf190:     	callq	0x1400021d0 <.text+0x11d0>
1458bf195:     	cmpq	$0x2, %rsi
1458bf199:     	jne	0x1458bf23a <.text+0x58be23a>
1458bf19f:     	cmpw	$0x6e65, (%rdi)         # imm = 0x6E65
1458bf1a4:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1aa:     	cmpw	$0x6c70, (%rdi)         # imm = 0x6C70
1458bf1af:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1b5:     	cmpw	$0x7363, (%rdi)         # imm = 0x7363
1458bf1ba:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1c0:     	cmpw	$0x6564, (%rdi)         # imm = 0x6564
1458bf1c5:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1cb:     	cmpw	$0x7470, (%rdi)         # imm = 0x7470
1458bf1d0:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1d6:     	cmpw	$0x7365, (%rdi)         # imm = 0x7365
1458bf1db:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1e1:     	cmpw	$0x7266, (%rdi)         # imm = 0x7266
1458bf1e6:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1ec:     	cmpw	$0x6f72, (%rdi)         # imm = 0x6F72
1458bf1f1:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf1f7:     	cmpw	$0x7274, (%rdi)         # imm = 0x7274
1458bf1fc:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf202:     	cmpw	$0x7572, (%rdi)         # imm = 0x7572
1458bf207:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf20d:     	cmpw	$0x6b75, (%rdi)         # imm = 0x6B75
1458bf212:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf218:     	cmpw	$0x687a, (%rdi)         # imm = 0x687A
1458bf21d:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf223:     	cmpw	$0x616a, (%rdi)         # imm = 0x616A
1458bf228:     	je	0x1458bf7e9 <.text+0x58be7e9>
1458bf22e:     	cmpw	$0x6f6b, (%rdi)         # imm = 0x6F6B
1458bf233:     	jne	0x1458bf23f <.text+0x58be23f>
1458bf235:     	jmp	0x1458bf7e9 <.text+0x58be7e9>
1458bf23a:     	testq	%rsi, %rsi
1458bf23d:     	je	0x1458bf250 <.text+0x58be250>
1458bf23f:     	movl	$0x1, %r8d
1458bf245:     	movq	%rdi, %rcx
1458bf248:     	movq	%rsi, %rdx
1458bf24b:     	callq	0x1400021d0 <.text+0x11d0>
1458bf250:     	leaq	0x132a6ae(%rip), %rdx   # 0x146be9905
1458bf257:     	leaq	-0x58(%rbp), %rcx
1458bf25b:     	movl	$0x6, %r8d
1458bf261:     	callq	0x145bb55d0 <.text+0x5bb45d0>
1458bf266:     	movq	-0x58(%rbp), %rdx
1458bf26a:     	leaq	0x1(%rdx), %rax
1458bf26e:     	cmpq	$0x2, %rax
1458bf272:     	jb	0x1458bf2b7 <.text+0x58be2b7>
1458bf274:     	cmpq	$-0x2, %rdx
1458bf278:     	jne	0x1458bf2a8 <.text+0x58be2a8>
1458bf27a:     	movq	-0x50(%rbp), %r12
1458bf27e:     	cmpq	$-0x1, %r12
1458bf282:     	je	0x1458bf2b7 <.text+0x58be2b7>
1458bf284:     	movq	-0x48(%rbp), %r13
1458bf288:     	movq	-0x40(%rbp), %rax
1458bf28c:     	testq	%rax, %rax
1458bf28f:     	jne	0x1458bf36b <.text+0x58be36b>
1458bf295:     	testq	%r12, %r12
1458bf298:     	je	0x1458bf2b7 <.text+0x58be2b7>
1458bf29a:     	movl	$0x1, %r8d
1458bf2a0:     	movq	%r13, %rcx
1458bf2a3:     	movq	%r12, %rdx
1458bf2a6:     	jmp	0x1458bf2b2 <.text+0x58be2b2>
1458bf2a8:     	movq	-0x50(%rbp), %rcx
1458bf2ac:     	movl	$0x1, %r8d
1458bf2b2:     	callq	0x1400021d0 <.text+0x11d0>
1458bf2b7:     	leaq	0x132a64d(%rip), %rdx   # 0x146be990b
1458bf2be:     	leaq	-0x58(%rbp), %rcx
1458bf2c2:     	movl	$0xb, %r8d
1458bf2c8:     	callq	0x145bb55d0 <.text+0x5bb45d0>
1458bf2cd:     	movq	-0x58(%rbp), %rdx
1458bf2d1:     	leaq	0x1(%rdx), %rax
1458bf2d5:     	cmpq	$0x2, %rax
1458bf2d9:     	jb	0x1458bf31a <.text+0x58be31a>
1458bf2db:     	cmpq	$-0x2, %rdx
1458bf2df:     	jne	0x1458bf30b <.text+0x58be30b>
1458bf2e1:     	movq	-0x50(%rbp), %r12
1458bf2e5:     	cmpq	$-0x1, %r12
1458bf2e9:     	je	0x1458bf31a <.text+0x58be31a>
1458bf2eb:     	movq	-0x48(%rbp), %r13
1458bf2ef:     	movq	-0x40(%rbp), %rax
1458bf2f3:     	testq	%rax, %rax
1458bf2f6:     	jne	0x1458bf36b <.text+0x58be36b>
1458bf2f8:     	testq	%r12, %r12
1458bf2fb:     	je	0x1458bf31a <.text+0x58be31a>
1458bf2fd:     	movl	$0x1, %r8d
1458bf303:     	movq	%r13, %rcx
1458bf306:     	movq	%r12, %rdx
1458bf309:     	jmp	0x1458bf315 <.text+0x58be315>
1458bf30b:     	movq	-0x50(%rbp), %rcx
1458bf30f:     	movl	$0x1, %r8d
1458bf315:     	callq	0x1400021d0 <.text+0x11d0>
1458bf31a:     	leaq	0x132a5f5(%rip), %rdx   # 0x146be9916
1458bf321:     	leaq	-0x58(%rbp), %rcx
1458bf325:     	movl	$0x4, %r8d
1458bf32b:     	callq	0x145bb55d0 <.text+0x5bb45d0>
1458bf330:     	movq	-0x58(%rbp), %rdx
1458bf334:     	leaq	0x1(%rdx), %rax
1458bf338:     	cmpq	$0x2, %rax
1458bf33c:     	jb	0x1458bf7c8 <.text+0x58be7c8>
1458bf342:     	cmpq	$-0x2, %rdx
1458bf346:     	jne	0x1458bf469 <.text+0x58be469>
1458bf34c:     	movq	-0x50(%rbp), %r12
1458bf350:     	cmpq	$-0x1, %r12
1458bf354:     	je	0x1458bf7c8 <.text+0x58be7c8>
1458bf35a:     	movq	-0x48(%rbp), %r13
1458bf35e:     	movq	-0x40(%rbp), %rax
1458bf362:     	testq	%rax, %rax
1458bf365:     	je	0x1458bf5b3 <.text+0x58be5b3>
1458bf36b:     	leaq	(%rax,%r13), %rcx
1458bf36f:     	xorl	%r11d, %r11d
1458bf372:     	movabsq	$0x4000000000003, %rdx  # imm = 0x4000000000003
1458bf37c:     	movq	%r13, %r10
1458bf37f:     	nop
1458bf380:     	cmpq	%rcx, %r10
1458bf383:     	je	0x1458bf47d <.text+0x58be47d>
1458bf389:     	movq	%r10, %r8
1458bf38c:     	movq	%r11, %rsi
1458bf38f:     	movzbl	(%r10), %r10d
1458bf393:     	movzbl	%r10b, %r9d
1458bf397:     	testb	%r9b, %r9b
1458bf39a:     	js	0x1458bf3b0 <.text+0x58be3b0>
1458bf39c:     	leaq	0x1(%r8), %r10
1458bf3a0:     	jmp	0x1458bf420 <.text+0x58be420>
1458bf3a2:     	nopw	%cs:(%rax,%rax)
1458bf3b0:     	movl	%r9d, %r11d
1458bf3b3:     	andl	$0x1f, %r11d
1458bf3b7:     	movzbl	0x1(%r8), %edi
1458bf3bc:     	andl	$0x3f, %edi
1458bf3bf:     	cmpb	$-0x21, %r9b
1458bf3c3:     	jbe	0x1458bf3fd <.text+0x58be3fd>
1458bf3c5:     	movzbl	0x2(%r8), %r9d
1458bf3ca:     	shll	$0x6, %edi
1458bf3cd:     	andl	$0x3f, %r9d
1458bf3d1:     	orl	%edi, %r9d
1458bf3d4:     	cmpb	$-0x10, %r10b
1458bf3d8:     	jb	0x1458bf40d <.text+0x58be40d>
1458bf3da:     	leaq	0x4(%r8), %r10
1458bf3de:     	movzbl	0x3(%r8), %edi
1458bf3e3:     	andl	$0x7, %r11d
1458bf3e7:     	shll	$0x12, %r11d
1458bf3eb:     	shll	$0x6, %r9d
1458bf3ef:     	andl	$0x3f, %edi
1458bf3f2:     	orl	%r9d, %edi
1458bf3f5:     	orl	%r11d, %edi
1458bf3f8:     	movl	%edi, %r9d
1458bf3fb:     	jmp	0x1458bf420 <.text+0x58be420>
1458bf3fd:     	leaq	0x2(%r8), %r10
1458bf401:     	shll	$0x6, %r11d
1458bf405:     	orl	%edi, %r11d
1458bf408:     	movl	%r11d, %r9d
1458bf40b:     	jmp	0x1458bf420 <.text+0x58be420>
1458bf40d:     	leaq	0x3(%r8), %r10
1458bf411:     	shll	$0xc, %r11d
1458bf415:     	orl	%r11d, %r9d
1458bf418:     	nopl	(%rax,%rax)
1458bf420:     	movq	%rsi, %r11
1458bf423:     	subq	%r8, %r11
1458bf426:     	addq	%r10, %r11
1458bf429:     	addl	$-0x2d, %r9d
1458bf42d:     	cmpl	$0x32, %r9d
1458bf431:     	ja	0x1458bf380 <.text+0x58be380>
1458bf437:     	btq	%r9, %rdx
1458bf43b:     	jae	0x1458bf380 <.text+0x58be380>
1458bf441:     	testq	%rsi, %rsi
1458bf444:     	jne	0x1458bf480 <.text+0x58be480>
1458bf446:     	movq	$-0x1, %rbx
1458bf44d:     	jmp	0x1458bf780 <.text+0x58be780>
1458bf452:     	movl	$0x1, %edi
1458bf457:     	movq	-0x30(%rbp), %rdx
1458bf45b:     	testq	%rdx, %rdx
1458bf45e:     	jne	0x1458bf186 <.text+0x58be186>
1458bf464:     	jmp	0x1458bf195 <.text+0x58be195>
1458bf469:     	movq	-0x50(%rbp), %rcx
1458bf46d:     	movl	$0x1, %r8d
1458bf473:     	callq	0x1400021d0 <.text+0x11d0>
1458bf478:     	jmp	0x1458bf7c8 <.text+0x58be7c8>
1458bf47d:     	movq	%rax, %rsi
1458bf480:     	callq	0x140002200 <.text+0x1200>
1458bf485:     	movl	$0x1, %edx
1458bf48a:     	movq	%rsi, %rcx
1458bf48d:     	callq	0x1400021c0 <.text+0x11c0>
1458bf492:     	testq	%rax, %rax
1458bf495:     	je	0x1458bf5cd <.text+0x58be5cd>
1458bf49b:     	movq	%rax, %r14
1458bf49e:     	movq	%rax, %rcx
1458bf4a1:     	movq	%r13, %rdx
1458bf4a4:     	movq	%rsi, %r8
1458bf4a7:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458bf4ac:     	cmpq	$0x8, %rsi
1458bf4b0:     	jae	0x1458bf4b9 <.text+0x58be4b9>
1458bf4b2:     	xorl	%eax, %eax
1458bf4b4:     	jmp	0x1458bf5e8 <.text+0x58be5e8>
1458bf4b9:     	cmpq	$0x20, %rsi
1458bf4bd:     	jae	0x1458bf4c6 <.text+0x58be4c6>
1458bf4bf:     	xorl	%eax, %eax
1458bf4c1:     	jmp	0x1458bf55e <.text+0x58be55e>
1458bf4c6:     	movq	%rsi, %rax
1458bf4c9:     	andq	$-0x20, %rax
1458bf4cd:     	xorl	%ecx, %ecx
1458bf4cf:     	movdqa	0x4d7d99(%rip), %xmm0   # 0x145d97270
1458bf4d7:     	movdqa	0x4d7da1(%rip), %xmm1   # 0x145d97280
1458bf4df:     	movdqa	0x4d7da9(%rip), %xmm2   # 0x145d97290
1458bf4e7:     	nopw	(%rax,%rax)
1458bf4f0:     	movdqu	(%r14,%rcx), %xmm3
1458bf4f6:     	movdqu	0x10(%r14,%rcx), %xmm4
1458bf4fd:     	movdqa	%xmm3, %xmm5
1458bf501:     	paddb	%xmm0, %xmm5
1458bf505:     	movdqa	%xmm4, %xmm6
1458bf509:     	paddb	%xmm0, %xmm6
1458bf50d:     	movdqa	%xmm5, %xmm7
1458bf511:     	pminub	%xmm1, %xmm7
1458bf515:     	pcmpeqb	%xmm5, %xmm7
1458bf519:     	pand	%xmm2, %xmm7
1458bf51d:     	movdqa	%xmm6, %xmm5
1458bf521:     	pminub	%xmm1, %xmm5
1458bf525:     	pcmpeqb	%xmm6, %xmm5
1458bf529:     	pand	%xmm2, %xmm5
1458bf52d:     	por	%xmm3, %xmm7
1458bf531:     	por	%xmm4, %xmm5
1458bf535:     	movdqu	%xmm7, (%r14,%rcx)
1458bf53b:     	movdqu	%xmm5, 0x10(%r14,%rcx)
1458bf542:     	addq	$0x20, %rcx
1458bf546:     	cmpq	%rcx, %rax
1458bf549:     	jne	0x1458bf4f0 <.text+0x58be4f0>
1458bf54b:     	cmpq	%rax, %rsi
1458bf54e:     	je	0x1458bf607 <.text+0x58be607>
1458bf554:     	testb	$0x18, %sil
1458bf558:     	je	0x1458bf5e8 <.text+0x58be5e8>
1458bf55e:     	movq	%rax, %rcx
1458bf561:     	movq	%rsi, %rax
1458bf564:     	andq	$-0x8, %rax
1458bf568:     	movdqa	0x4d7d30(%rip), %xmm0   # 0x145d972a0
1458bf570:     	movdqa	0x4d7d38(%rip), %xmm1   # 0x145d972b0
1458bf578:     	movdqa	0x4d7d40(%rip), %xmm2   # 0x145d972c0
1458bf580:     	movq	(%r14,%rcx), %xmm3
1458bf586:     	movdqa	%xmm3, %xmm4
1458bf58a:     	paddb	%xmm0, %xmm4
1458bf58e:     	movdqa	%xmm4, %xmm5
1458bf592:     	pmaxub	%xmm1, %xmm5
1458bf596:     	pcmpeqb	%xmm4, %xmm5
1458bf59a:     	pandn	%xmm2, %xmm5
1458bf59e:     	por	%xmm3, %xmm5
1458bf5a2:     	movq	%xmm5, (%r14,%rcx)
1458bf5a8:     	addq	$0x8, %rcx
1458bf5ac:     	cmpq	%rcx, %rax
1458bf5af:     	jne	0x1458bf580 <.text+0x58be580>
1458bf5b1:     	jmp	0x1458bf602 <.text+0x58be602>
1458bf5b3:     	testq	%r12, %r12
1458bf5b6:     	je	0x1458bf7c8 <.text+0x58be7c8>
1458bf5bc:     	movl	$0x1, %r8d
1458bf5c2:     	movq	%r13, %rcx
1458bf5c5:     	movq	%r12, %rdx
1458bf5c8:     	jmp	0x1458bf473 <.text+0x58be473>
1458bf5cd:     	movq	%r13, -0x60(%rbp)
1458bf5d1:     	movq	%r12, -0x38(%rbp)
1458bf5d5:     	movl	$0x1, %ecx
1458bf5da:     	movq	%rsi, %rdx
1458bf5dd:     	callq	0x145d9370b <.text+0x5d9270b>
1458bf5e2:     	nop
1458bf5e3:     	jmp	0x1458bf729 <.text+0x58be729>
1458bf5e8:     	movzbl	(%r14,%rax), %ecx
1458bf5ed:     	leal	-0x41(%rcx), %edx
1458bf5f0:     	cmpb	$0x1a, %dl
1458bf5f3:     	setb	%dl
1458bf5f6:     	shlb	$0x5, %dl
1458bf5f9:     	orb	%cl, %dl
1458bf5fb:     	movb	%dl, (%r14,%rax)
1458bf5ff:     	incq	%rax
1458bf602:     	cmpq	%rax, %rsi
1458bf605:     	jne	0x1458bf5e8 <.text+0x58be5e8>
1458bf607:     	movq	$-0x1, %rbx
1458bf60e:     	cmpq	$0x2, %rsi
1458bf612:     	jne	0x1458bf684 <.text+0x58be684>
1458bf614:     	cmpw	$0x6e65, (%r14)         # imm = 0x6E65
1458bf61a:     	je	0x1458bf689 <.text+0x58be689>
1458bf61c:     	cmpw	$0x6c70, (%r14)         # imm = 0x6C70
1458bf622:     	je	0x1458bf692 <.text+0x58be692>
1458bf624:     	cmpw	$0x7363, (%r14)         # imm = 0x7363
1458bf62a:     	je	0x1458bf69b <.text+0x58be69b>
1458bf62c:     	cmpw	$0x6564, (%r14)         # imm = 0x6564
1458bf632:     	je	0x1458bf6a4 <.text+0x58be6a4>
1458bf634:     	cmpw	$0x7470, (%r14)         # imm = 0x7470
1458bf63a:     	je	0x1458bf6ad <.text+0x58be6ad>
1458bf63c:     	cmpw	$0x7365, (%r14)         # imm = 0x7365
1458bf642:     	je	0x1458bf6b6 <.text+0x58be6b6>
1458bf644:     	cmpw	$0x7266, (%r14)         # imm = 0x7266
1458bf64a:     	je	0x1458bf6bf <.text+0x58be6bf>
1458bf64c:     	cmpw	$0x6f72, (%r14)         # imm = 0x6F72
1458bf652:     	je	0x1458bf6c8 <.text+0x58be6c8>
1458bf654:     	cmpw	$0x7274, (%r14)         # imm = 0x7274
1458bf65a:     	je	0x1458bf6d1 <.text+0x58be6d1>
1458bf65c:     	cmpw	$0x7572, (%r14)         # imm = 0x7572
1458bf662:     	je	0x1458bf6da <.text+0x58be6da>
1458bf664:     	cmpw	$0x6b75, (%r14)         # imm = 0x6B75
1458bf66a:     	je	0x1458bf6e3 <.text+0x58be6e3>
1458bf66c:     	cmpw	$0x687a, (%r14)         # imm = 0x687A
1458bf672:     	je	0x1458bf6ec <.text+0x58be6ec>
1458bf674:     	cmpw	$0x616a, (%r14)         # imm = 0x616A
1458bf67a:     	je	0x1458bf6f5 <.text+0x58be6f5>
1458bf67c:     	cmpw	$0x6f6b, (%r14)         # imm = 0x6F6B
1458bf682:     	je	0x1458bf6fe <.text+0x58be6fe>
1458bf684:     	jmp	0x1458bf76f <.text+0x58be76f>
1458bf689:     	leaq	0x15d44f8(%rip), %rax   # 0x146e93b88
1458bf690:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf692:     	leaq	0x15d4527(%rip), %rax   # 0x146e93bc0
1458bf699:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf69b:     	leaq	0x15d4556(%rip), %rax   # 0x146e93bf8
1458bf6a2:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6a4:     	leaq	0x15d4585(%rip), %rax   # 0x146e93c30
1458bf6ab:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6ad:     	leaq	0x15d45b4(%rip), %rax   # 0x146e93c68
1458bf6b4:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6b6:     	leaq	0x15d45e3(%rip), %rax   # 0x146e93ca0
1458bf6bd:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6bf:     	leaq	0x15d4612(%rip), %rax   # 0x146e93cd8
1458bf6c6:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6c8:     	leaq	0x15d4641(%rip), %rax   # 0x146e93d10
1458bf6cf:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6d1:     	leaq	0x15d4670(%rip), %rax   # 0x146e93d48
1458bf6d8:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6da:     	leaq	0x15d469f(%rip), %rax   # 0x146e93d80
1458bf6e1:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6e3:     	leaq	0x15d46ce(%rip), %rax   # 0x146e93db8
1458bf6ea:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6ec:     	leaq	0x15d46fd(%rip), %rax   # 0x146e93df0
1458bf6f3:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6f5:     	leaq	0x15d472c(%rip), %rax   # 0x146e93e28
1458bf6fc:     	jmp	0x1458bf705 <.text+0x58be705>
1458bf6fe:     	leaq	0x15d475b(%rip), %rax   # 0x146e93e60
1458bf705:     	movq	0x8(%rax), %rbx
1458bf709:     	testq	%rbx, %rbx
1458bf70c:     	jns	0x1458bf72b <.text+0x58be72b>
1458bf70e:     	movq	%r14, -0x30(%rbp)
1458bf712:     	xorl	%r15d, %r15d
1458bf715:     	movq	%r13, -0x60(%rbp)
1458bf719:     	movq	%r12, -0x38(%rbp)
1458bf71d:     	movq	%r15, %rcx
1458bf720:     	movq	%rbx, %rdx
1458bf723:     	callq	0x145d9370b <.text+0x5d9270b>
1458bf728:     	nop
1458bf729:     	ud2
1458bf72b:     	je	0x1458bf768 <.text+0x58be768>
1458bf72d:     	movq	%r14, -0x30(%rbp)
1458bf731:     	movq	(%rax), %r14
1458bf734:     	callq	0x140002200 <.text+0x1200>
1458bf739:     	movl	$0x1, %r15d
1458bf73f:     	movl	$0x1, %edx
1458bf744:     	movq	%rbx, %rcx
1458bf747:     	callq	0x1400021c0 <.text+0x11c0>
1458bf74c:     	testq	%rax, %rax
1458bf74f:     	je	0x1458bf715 <.text+0x58be715>
1458bf751:     	movq	%rax, %rdi
1458bf754:     	movq	%rax, %rcx
1458bf757:     	movq	%r14, %rdx
1458bf75a:     	movq	%rbx, %r8
1458bf75d:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458bf762:     	movq	-0x30(%rbp), %r14
1458bf766:     	jmp	0x1458bf76f <.text+0x58be76f>
1458bf768:     	movl	$0x1, %edi
1458bf76d:     	xorl	%ebx, %ebx
1458bf76f:     	movl	$0x1, %r8d
1458bf775:     	movq	%r14, %rcx
1458bf778:     	movq	%rsi, %rdx
1458bf77b:     	callq	0x1400021d0 <.text+0x11d0>
1458bf780:     	testq	%r12, %r12
1458bf783:     	je	0x1458bf796 <.text+0x58be796>
1458bf785:     	movl	$0x1, %r8d
1458bf78b:     	movq	%r13, %rcx
1458bf78e:     	movq	%r12, %rdx
1458bf791:     	callq	0x1400021d0 <.text+0x11d0>
1458bf796:     	cmpq	$-0x1, %rbx
1458bf79a:     	je	0x1458bf7c8 <.text+0x58be7c8>
1458bf79c:     	movq	%rdi, %rcx
1458bf79f:     	movq	%rbx, %rdx
1458bf7a2:     	callq	0x1458be970 <.text+0x58bd970>
1458bf7a7:     	testq	%rbx, %rbx
1458bf7aa:     	jne	0x1458bf7fb <.text+0x58be7fb>
1458bf7ac:     	movaps	-0x20(%rbp), %xmm6
1458bf7b0:     	movaps	-0x10(%rbp), %xmm7
1458bf7b4:     	addq	$0x88, %rsp
1458bf7bb:     	popq	%rbx
1458bf7bc:     	popq	%rdi
1458bf7bd:     	popq	%rsi
1458bf7be:     	popq	%r12
1458bf7c0:     	popq	%r13
1458bf7c2:     	popq	%r14
1458bf7c4:     	popq	%r15
1458bf7c6:     	popq	%rbp
1458bf7c7:     	retq
1458bf7c8:     	callq	0x140002200 <.text+0x1200>
1458bf7cd:     	movl	$0x2, %ecx
1458bf7d2:     	movl	$0x1, %edx
1458bf7d7:     	callq	0x1400021c0 <.text+0x11c0>
1458bf7dc:     	testq	%rax, %rax
1458bf7df:     	je	0x1458bf827 <.text+0x58be827>
1458bf7e1:     	movq	%rax, %rdi
1458bf7e4:     	movw	$0x6e65, (%rax)         # imm = 0x6E65
1458bf7e9:     	movl	$0x2, %ebx
1458bf7ee:     	movl	$0x2, %edx
1458bf7f3:     	movq	%rdi, %rcx
1458bf7f6:     	callq	0x1458be970 <.text+0x58bd970>
1458bf7fb:     	movl	$0x1, %r8d
1458bf801:     	movq	%rdi, %rcx
1458bf804:     	movq	%rbx, %rdx
1458bf807:     	movaps	-0x20(%rbp), %xmm6
1458bf80b:     	movaps	-0x10(%rbp), %xmm7
1458bf80f:     	addq	$0x88, %rsp
1458bf816:     	popq	%rbx
1458bf817:     	popq	%rdi
1458bf818:     	popq	%rsi
1458bf819:     	popq	%r12
1458bf81b:     	popq	%r13
1458bf81d:     	popq	%r14
1458bf81f:     	popq	%r15
1458bf821:     	popq	%rbp
1458bf822:     	jmp	0x1400021d0 <.text+0x11d0>
1458bf827:     	movl	$0x1, %ecx
1458bf82c:     	movl	$0x2, %edx
1458bf831:     	callq	0x145d9370b <.text+0x5d9270b>
1458bf836:     	ud2
