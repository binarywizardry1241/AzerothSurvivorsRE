
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454502d0:     	pushq	%r15
1454502d2:     	pushq	%r14
1454502d4:     	pushq	%r13
1454502d6:     	pushq	%r12
1454502d8:     	pushq	%rsi
1454502d9:     	pushq	%rdi
1454502da:     	pushq	%rbp
1454502db:     	pushq	%rbx
1454502dc:     	pushq	%rax
1454502dd:     	movb	$0x2, %al
1454502df:     	cmpl	$0x2, 0x10(%rdx)
1454502e3:     	je	0x1454504e9 <.text+0x544f4e9>
1454502e9:     	cmpq	$0xffffff, 0xf80(%rdx)  # imm = 0xFFFFFF
1454502f4:     	je	0x1454504e9 <.text+0x544f4e9>
1454502fa:     	cmpb	$0x0, 0x9c2(%rdx)
145450301:     	jne	0x1454504e9 <.text+0x544f4e9>
145450307:     	cmpb	$0x0, 0x9c9(%rdx)
14545030e:     	je	0x1454504e9 <.text+0x544f4e9>
145450314:     	movl	0x684(%rdx), %eax
14545031a:     	movq	0x258(%rdx), %xmm1
145450322:     	pxor	%xmm0, %xmm0
145450326:     	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
14545032a:     	cvtdq2ps	%xmm1, %xmm2
14545032d:     	cvtsi2ss	%rax, %xmm3
145450332:     	movaps	%xmm2, %xmm1
145450335:     	divss	0x4b71ff(%rip), %xmm2   # 0x14590753c
14545033d:     	divss	%xmm2, %xmm3
145450341:     	cvttss2si	%xmm3, %rax
145450346:     	xorl	%r8d, %r8d
145450349:     	xorps	%xmm2, %xmm2
14545034c:     	ucomiss	%xmm2, %xmm3
14545034f:     	cmovael	%eax, %r8d
145450353:     	movl	0x264(%rdx), %r9d
14545035a:     	ucomiss	0x4b71cb(%rip), %xmm3   # 0x14590752c
145450361:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145450366:     	cmovbel	%r8d, %eax
14545036a:     	movl	%eax, 0x4(%rsp)
14545036e:     	orl	0x260(%rdx), %r9d
145450375:     	orl	0x268(%rdx), %r9d
14545037c:     	sete	%r9b
145450380:     	movdqu	0x26c(%rdx), %xmm2
145450388:     	movdqu	0x27c(%rdx), %xmm3
145450390:     	movdqu	0x28c(%rdx), %xmm4
145450398:     	movdqu	0x29c(%rdx), %xmm5
1454503a0:     	pcmpeqd	%xmm0, %xmm5
1454503a4:     	pcmpeqd	%xmm0, %xmm4
1454503a8:     	packssdw	%xmm5, %xmm4
1454503ac:     	pcmpeqd	%xmm0, %xmm3
1454503b0:     	pcmpeqd	%xmm0, %xmm2
1454503b4:     	packssdw	%xmm3, %xmm2
1454503b8:     	packsswb	%xmm4, %xmm2
1454503bc:     	pmovmskb	%xmm2, %esi
1454503c0:     	movl	%esi, %r10d
1454503c3:     	shrl	$0xf, %r10d
1454503c7:     	movl	%esi, %r11d
1454503ca:     	shrl	$0xe, %r11d
1454503ce:     	movl	%esi, %edi
1454503d0:     	shrl	$0xd, %edi
1454503d3:     	movl	%esi, %ebx
1454503d5:     	shrl	$0xc, %ebx
1454503d8:     	movl	%esi, %ebp
1454503da:     	shrl	$0xb, %ebp
1454503dd:     	movl	%esi, %r8d
1454503e0:     	shrl	$0xa, %r8d
1454503e4:     	movl	%esi, %r15d
1454503e7:     	shrl	$0x9, %r15d
1454503eb:     	movl	%esi, %r12d
1454503ee:     	shrl	$0x8, %r12d
1454503f2:     	testb	%sil, %sil
1454503f5:     	sets	%al
1454503f8:     	movl	%esi, %r14d
1454503fb:     	andl	$0x10, %r14d
1454503ff:     	shrb	$0x4, %r14b
145450403:     	movl	%esi, %r13d
145450406:     	shrb	$0x3, %r13b
14545040a:     	andb	%r14b, %r13b
14545040d:     	movl	%esi, %r14d
145450410:     	shrb	$0x6, %r14b
145450414:     	andb	%al, %r14b
145450417:     	andb	%r12b, %r14b
14545041a:     	andb	%r15b, %r14b
14545041d:     	movl	%esi, %eax
14545041f:     	shrb	$0x5, %al
145450422:     	andb	%al, %r13b
145450425:     	andb	%sil, %r9b
145450428:     	movl	%esi, %eax
14545042a:     	shrb	$0x2, %al
14545042d:     	andl	$0x2, %esi
145450430:     	shrb	%sil
145450433:     	andb	%al, %sil
145450436:     	andb	%r9b, %sil
145450439:     	andb	%r13b, %sil
14545043c:     	andb	%sil, %r14b
14545043f:     	andb	%bpl, %r8b
145450442:     	andb	%bl, %r8b
145450445:     	andb	%dil, %r8b
145450448:     	andb	%r11b, %r8b
14545044b:     	andb	%r10b, %r8b
14545044e:     	movss	0x944(%rdx), %xmm2
145450456:     	movss	%xmm2, (%rcx)
14545045a:     	movl	0x4(%rsp), %eax
14545045e:     	movl	%eax, 0x4(%rcx)
145450461:     	movd	0x25c(%rdx), %xmm2
145450469:     	movdqu	0x68c(%rdx), %xmm3
145450471:     	movzbl	0x880(%rdx), %eax
145450478:     	andb	%r14b, %r8b
14545047b:     	pshufd	$0xec, %xmm3, %xmm3     # xmm3 = xmm3[0,3,2,3]
145450480:     	movq	%xmm3, 0x8(%rcx)
145450485:     	movb	%al, 0x10(%rcx)
145450488:     	movaps	0x12eda51(%rip), %xmm3  # 0x14673dee0
14545048f:     	addps	%xmm3, %xmm1
145450492:     	movaps	0x11f4a47(%rip), %xmm4  # 0x146644ee0
145450499:     	divps	%xmm4, %xmm1
14545049c:     	mulps	0x12eda4d(%rip), %xmm1  # 0x14673def0
1454504a3:     	movb	%r8b, 0x11(%rcx)
1454504a7:     	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
1454504ab:     	cvtdq2ps	%xmm2, %xmm0
1454504ae:     	addps	%xmm3, %xmm0
1454504b1:     	divps	%xmm4, %xmm0
1454504b4:     	mulps	0x12eda45(%rip), %xmm0  # 0x14673df00
1454504bb:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454504bf:     	addss	%xmm1, %xmm2
1454504c3:     	addss	%xmm0, %xmm2
1454504c7:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
1454504cb:     	addss	%xmm2, %xmm0
1454504cf:     	addss	0x4b6fb9(%rip), %xmm0   # 0x145907490
1454504d7:     	minss	0x4c2e15(%rip), %xmm0   # 0x1459132f4
1454504df:     	ucomiss	0x12eda2a(%rip), %xmm0  # 0x14673df10
1454504e6:     	setae	%al
1454504e9:     	movb	%al, 0x12(%rcx)
1454504ec:     	addq	$0x8, %rsp
1454504f0:     	popq	%rbx
1454504f1:     	popq	%rbp
1454504f2:     	popq	%rdi
1454504f3:     	popq	%rsi
1454504f4:     	popq	%r12
1454504f6:     	popq	%r13
1454504f8:     	popq	%r14
1454504fa:     	popq	%r15
1454504fc:     	retq
