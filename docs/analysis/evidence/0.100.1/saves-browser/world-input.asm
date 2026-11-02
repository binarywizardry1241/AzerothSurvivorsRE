
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140287fa0:     	pushq	%rbp
140287fa1:     	pushq	%r15
140287fa3:     	pushq	%r14
140287fa5:     	pushq	%r13
140287fa7:     	pushq	%r12
140287fa9:     	pushq	%rsi
140287faa:     	pushq	%rdi
140287fab:     	pushq	%rbx
140287fac:     	movl	$0x10f8, %eax           # imm = 0x10F8
140287fb1:     	callq	0x145772680 <.text+0x5771680>
140287fb6:     	subq	%rax, %rsp
140287fb9:     	leaq	0x80(%rsp), %rbp
140287fc1:     	movdqa	%xmm15, 0x1060(%rbp)
140287fca:     	movdqa	%xmm14, 0x1050(%rbp)
140287fd3:     	movdqa	%xmm13, 0x1040(%rbp)
140287fdc:     	movdqa	%xmm12, 0x1030(%rbp)
140287fe5:     	movdqa	%xmm11, 0x1020(%rbp)
140287fee:     	movdqa	%xmm10, 0x1010(%rbp)
140287ff7:     	movdqa	%xmm9, 0x1000(%rbp)
140288000:     	movdqa	%xmm8, 0xff0(%rbp)
140288009:     	movdqa	%xmm7, 0xfe0(%rbp)
140288011:     	movdqa	%xmm6, 0xfd0(%rbp)
140288019:     	movq	$-0x2, 0xfc8(%rbp)
140288024:     	cmpq	$0x0, 0x90(%rdx)
14028802c:     	je	0x1402881d2 <.text+0x2871d2>
140288032:     	movq	%rdx, %r12
140288035:     	leaq	0x78(%rdx), %r14
140288039:     	movq	0x78(%rdx), %rax
14028803d:     	movq	0x80(%rdx), %rcx
140288044:     	movabsq	$0x5824c802f396e770, %rdx # imm = 0x5824C802F396E770
14028804e:     	xorl	%r8d, %r8d
140288051:     	movdqa	0x568b137(%rip), %xmm6  # 0x145913190
140288059:     	pcmpeqd	%xmm0, %xmm0
14028805d:     	movdqa	0x56c921b(%rip), %xmm7  # 0x145951280
140288065:     	andq	%rcx, %rdx
140288068:     	movdqu	(%rax,%rdx), %xmm1
14028806d:     	movdqa	%xmm1, %xmm2
140288071:     	pcmpeqb	%xmm6, %xmm2
140288075:     	pmovmskb	%xmm2, %r9d
14028807a:     	testl	%r9d, %r9d
14028807d:     	je	0x1402880c0 <.text+0x2870c0>
14028807f:     	tzcntl	%r9d, %r10d
140288084:     	addq	%rdx, %r10
140288087:     	andq	%rcx, %r10
14028808a:     	negq	%r10
14028808d:     	leaq	(%r10,%r10,2), %r10
140288091:     	movdqu	-0x18(%rax,%r10,8), %xmm2
140288098:     	pcmpeqb	%xmm7, %xmm2
14028809c:     	pmovmskb	%xmm2, %r11d
1402880a1:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1402880a8:     	je	0x1402880df <.text+0x2870df>
1402880aa:     	leal	-0x1(%r9), %r10d
1402880ae:     	andw	%r9w, %r10w
1402880b2:     	movl	%r10d, %r9d
1402880b5:     	jne	0x14028807f <.text+0x28707f>
1402880b7:     	nopw	(%rax,%rax)
1402880c0:     	pcmpeqb	%xmm0, %xmm1
1402880c4:     	pmovmskb	%xmm1, %r9d
1402880c9:     	testl	%r9d, %r9d
1402880cc:     	jne	0x1402881d2 <.text+0x2871d2>
1402880d2:     	addq	%r8, %rdx
1402880d5:     	addq	$0x10, %rdx
1402880d9:     	addq	$0x10, %r8
1402880dd:     	jmp	0x140288065 <.text+0x287065>
1402880df:     	leaq	(%rax,%r10,8), %rdx
1402880e3:     	movq	-0x8(%rdx), %rdx
1402880e7:     	movq	0x218(%r12), %r8
1402880ef:     	cmpq	%r8, %rdx
1402880f2:     	jae	0x1402881d2 <.text+0x2871d2>
1402880f8:     	movq	0x210(%r12), %r9
140288100:     	movq	(%r9,%rdx,8), %r10
140288104:     	testq	%r10, %r10
140288107:     	je	0x1402881d2 <.text+0x2871d2>
14028810d:     	movq	0x1e0(%r12), %rdx
140288115:     	notq	%r10
140288118:     	imulq	$0x38, %r10, %r10
14028811c:     	cmpb	$0x0, 0x30(%rdx,%r10)
140288122:     	je	0x1402881d2 <.text+0x2871d2>
140288128:     	addq	%rdx, %r10
14028812b:     	movq	0x10(%r10), %r10
14028812f:     	cmpb	$0x1, 0x1a8(%r10)
140288137:     	jne	0x14028a52d <.text+0x28952d>
14028813d:     	cmpq	$-0x1, 0x98(%r10)
140288145:     	je	0x140288152 <.text+0x287152>
140288147:     	cmpq	$0x0, 0x28(%r10)
14028814c:     	je	0x14028a52d <.text+0x28952d>
140288152:     	leaq	0x1d8(%r12), %r15
14028815a:     	movabsq	$0x5824c802f396e770, %r10 # imm = 0x5824C802F396E770
140288164:     	xorl	%r11d, %r11d
140288167:     	pcmpeqd	%xmm0, %xmm0
14028816b:     	andq	%rcx, %r10
14028816e:     	movdqu	(%rax,%r10), %xmm1
140288174:     	movdqa	%xmm1, %xmm2
140288178:     	pcmpeqb	%xmm6, %xmm2
14028817c:     	pmovmskb	%xmm2, %esi
140288180:     	testl	%esi, %esi
140288182:     	je	0x1402881b5 <.text+0x2871b5>
140288184:     	tzcntl	%esi, %edi
140288188:     	addq	%r10, %rdi
14028818b:     	andq	%rcx, %rdi
14028818e:     	negq	%rdi
140288191:     	leaq	(%rdi,%rdi,2), %rdi
140288195:     	movdqu	-0x18(%rax,%rdi,8), %xmm2
14028819b:     	pcmpeqb	%xmm7, %xmm2
14028819f:     	pmovmskb	%xmm2, %ebx
1402881a3:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1402881a9:     	je	0x14028820a <.text+0x28720a>
1402881ab:     	leal	-0x1(%rsi), %edi
1402881ae:     	andw	%si, %di
1402881b1:     	movl	%edi, %esi
1402881b3:     	jne	0x140288184 <.text+0x287184>
1402881b5:     	pcmpeqb	%xmm0, %xmm1
1402881b9:     	pmovmskb	%xmm1, %esi
1402881bd:     	testl	%esi, %esi
1402881bf:     	jne	0x1402883d2 <.text+0x2873d2>
1402881c5:     	addq	%r11, %r10
1402881c8:     	addq	$0x10, %r10
1402881cc:     	addq	$0x10, %r11
1402881d0:     	jmp	0x14028816b <.text+0x28716b>
1402881d2:     	leaq	0xfc6(%rbp), %rax
1402881d9:     	movq	%rax, 0x360(%rbp)
1402881e0:     	leaq	0x4d83659(%rip), %rax   # 0x14500b840 <.text+0x500a840>
1402881e7:     	movq	%rax, 0x368(%rbp)
1402881ee:     	leaq	0x56c91cb(%rip), %rcx   # 0x1459513c0
1402881f5:     	leaq	0x56d03cc(%rip), %r8    # 0x1459585c8
1402881fc:     	leaq	0x360(%rbp), %rdx
140288203:     	callq	0x145903d10 <.text+0x5902d10>
140288208:     	ud2
14028820a:     	leaq	(%rax,%rdi,8), %rax
14028820e:     	movq	-0x8(%rax), %rax
140288212:     	cmpq	%r8, %rax
140288215:     	jae	0x1402883d2 <.text+0x2873d2>
14028821b:     	movq	(%r9,%rax,8), %rax
14028821f:     	testq	%rax, %rax
140288222:     	je	0x1402883d2 <.text+0x2873d2>
140288228:     	notq	%rax
14028822b:     	imulq	$0x38, %rax, %rax
14028822f:     	cmpb	$0x0, 0x30(%rdx,%rax)
140288234:     	je	0x1402883d2 <.text+0x2873d2>
14028823a:     	addq	%rax, %rdx
14028823d:     	movq	0x10(%rdx), %rax
140288241:     	movl	0x5b0(%r12), %ecx
140288249:     	movl	%ecx, 0x2c(%rdx)
14028824c:     	movq	0x28(%rax), %rcx
140288250:     	movq	%rcx, 0xe00(%rbp)
140288257:     	movdqu	0x18(%rax), %xmm0
14028825c:     	movdqa	%xmm0, 0xdf0(%rbp)
140288264:     	movq	$0x0, 0x18(%rax)
14028826c:     	movq	$0x8, 0x20(%rax)
140288274:     	movq	$0x0, 0x28(%rax)
14028827c:     	cmpq	$0x0, 0x90(%r12)
140288285:     	je	0x14028840a <.text+0x28740a>
14028828b:     	movq	0x78(%r12), %rax
140288290:     	movq	0x80(%r12), %rcx
140288298:     	movabsq	$0x5824c802f396e770, %rdx # imm = 0x5824C802F396E770
1402882a2:     	xorl	%r8d, %r8d
1402882a5:     	pcmpeqd	%xmm0, %xmm0
1402882a9:     	andq	%rcx, %rdx
1402882ac:     	movdqu	(%rax,%rdx), %xmm1
1402882b1:     	movdqa	%xmm1, %xmm2
1402882b5:     	pcmpeqb	%xmm6, %xmm2
1402882b9:     	pmovmskb	%xmm2, %r9d
1402882be:     	testl	%r9d, %r9d
1402882c1:     	je	0x1402882fb <.text+0x2872fb>
1402882c3:     	tzcntl	%r9d, %r10d
1402882c8:     	addq	%rdx, %r10
1402882cb:     	andq	%rcx, %r10
1402882ce:     	negq	%r10
1402882d1:     	leaq	(%r10,%r10,2), %r10
1402882d5:     	movdqu	-0x18(%rax,%r10,8), %xmm2
1402882dc:     	pcmpeqb	%xmm7, %xmm2
1402882e0:     	pmovmskb	%xmm2, %r11d
1402882e5:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1402882ec:     	je	0x14028831a <.text+0x28731a>
1402882ee:     	leal	-0x1(%r9), %r10d
1402882f2:     	andw	%r9w, %r10w
1402882f6:     	movl	%r10d, %r9d
1402882f9:     	jne	0x1402882c3 <.text+0x2872c3>
1402882fb:     	pcmpeqb	%xmm0, %xmm1
1402882ff:     	pmovmskb	%xmm1, %r9d
140288304:     	testl	%r9d, %r9d
140288307:     	jne	0x14028840a <.text+0x28740a>
14028830d:     	addq	%r8, %rdx
140288310:     	addq	$0x10, %rdx
140288314:     	addq	$0x10, %r8
140288318:     	jmp	0x1402882a9 <.text+0x2872a9>
14028831a:     	leaq	(%rax,%r10,8), %rax
14028831e:     	movq	-0x8(%rax), %rax
140288322:     	cmpq	0x218(%r12), %rax
14028832a:     	jae	0x14028840a <.text+0x28740a>
140288330:     	movq	0x210(%r12), %rcx
140288338:     	movq	(%rcx,%rax,8), %rcx
14028833c:     	testq	%rcx, %rcx
14028833f:     	je	0x14028840a <.text+0x28740a>
140288345:     	movq	0x1e0(%r12), %rax
14028834d:     	notq	%rcx
140288350:     	imulq	$0x38, %rcx, %rcx
140288354:     	cmpb	$0x0, 0x30(%rax,%rcx)
140288359:     	je	0x14028840a <.text+0x28740a>
14028835f:     	movq	%r14, 0xde8(%rbp)
140288366:     	addq	%rcx, %rax
140288369:     	movq	0x10(%rax), %rsi
14028836d:     	movl	0x5b0(%r12), %ecx
140288375:     	movl	%ecx, 0x2c(%rax)
140288378:     	leaq	0x98(%rsi), %rdx
14028837f:     	leaq	0xcf0(%rbp), %rcx
140288386:     	movl	$0xd8, %r8d
14028838c:     	callq	0x1457731ed <.text+0x57721ed>
140288391:     	movq	$-0x1, 0x98(%rsi)
14028839c:     	movq	0xcf0(%rbp), %rsi
1402883a3:     	leaq	0x56cc86e(%rip), %r14   # 0x145954c18
1402883aa:     	cmpq	$-0x1, %rsi
1402883ae:     	je	0x14028844d <.text+0x28744d>
1402883b4:     	leaq	0xcf8(%rbp), %rdx
1402883bb:     	leaq	0x360(%rbp), %rcx
1402883c2:     	movl	$0xd0, %r8d
1402883c8:     	callq	0x1457731ed <.text+0x57721ed>
1402883cd:     	jmp	0x140288747 <.text+0x287747>
1402883d2:     	leaq	0xfc6(%rbp), %rax
1402883d9:     	movq	%rax, 0x360(%rbp)
1402883e0:     	leaq	0x4d83459(%rip), %rax   # 0x14500b840 <.text+0x500a840>
1402883e7:     	movq	%rax, 0x368(%rbp)
1402883ee:     	leaq	0x56c8fcb(%rip), %rcx   # 0x1459513c0
1402883f5:     	leaq	0x56d01e4(%rip), %r8    # 0x1459585e0
1402883fc:     	leaq	0x360(%rbp), %rdx
140288403:     	callq	0x145903d10 <.text+0x5902d10>
140288408:     	ud2
14028840a:     	leaq	0xfc6(%rbp), %rax
140288411:     	movq	%rax, 0x360(%rbp)
140288418:     	leaq	0x4d83421(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14028841f:     	movq	%rax, 0x368(%rbp)
140288426:     	movb	$0x1, 0xfb4(%rbp)
14028842d:     	leaq	0x56c8f8c(%rip), %rcx   # 0x1459513c0
140288434:     	leaq	0x56d01bd(%rip), %r8    # 0x1459585f8
14028843b:     	leaq	0x360(%rbp), %rdx
140288442:     	callq	0x145903d10 <.text+0x5902d10>
140288447:     	nop
140288448:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028844d:     	movq	$0x0, 0xe30(%rbp)
140288458:     	movq	$0x8, 0xe38(%rbp)
140288463:     	movq	$0x0, 0xe40(%rbp)
14028846e:     	movq	%r14, 0x190(%rbp)
140288475:     	leaq	0x56d009c(%rip), %rax   # 0x145958518
14028847c:     	movq	%rax, 0x198(%rbp)
140288483:     	movq	%r12, 0x1a0(%rbp)
14028848a:     	callq	0x140002200 <.text+0x1200>
14028848f:     	movl	$0x900, %ecx            # imm = 0x900
140288494:     	movl	$0x8, %edx
140288499:     	callq	0x1400021c0 <.text+0x11c0>
14028849e:     	testq	%rax, %rax
1402884a1:     	je	0x14028a6b4 <.text+0x2896b4>
1402884a7:     	movq	$0x60, 0xa90(%rbp)
1402884b2:     	movq	%rax, 0xa98(%rbp)
1402884b9:     	leaq	0xaa0(%rbp), %rcx
1402884c0:     	movq	$0x0, 0xaa0(%rbp)
1402884cb:     	movq	%rax, 0x370(%rbp)
1402884d2:     	movq	%rcx, 0x360(%rbp)
1402884d9:     	movq	$0x0, 0x368(%rbp)
1402884e4:     	leaq	0x190(%rbp), %rcx
1402884eb:     	leaq	0x360(%rbp), %rdx
1402884f2:     	callq	0x140036490 <.text+0x35490>
1402884f7:     	nop
1402884f8:     	movdqu	0xa90(%rbp), %xmm0
140288500:     	movdqa	%xmm0, -0x40(%rbp)
140288505:     	movq	0xaa0(%rbp), %rax
14028850c:     	movq	%rax, -0x30(%rbp)
140288510:     	leaq	0x190(%rbp), %rcx
140288517:     	movq	%r12, %rdx
14028851a:     	callq	0x140649f30 <.text+0x648f30>
14028851f:     	nop
140288520:     	leaq	0xa90(%rbp), %rcx
140288527:     	callq	0x14064ba70 <.text+0x64aa70>
14028852c:     	nop
14028852d:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
140288532:     	nop
140288533:     	movq	%rax, %rbx
140288536:     	cmpb	$0x1, 0x10(%rax)
14028853a:     	jne	0x14028a643 <.text+0x289643>
140288540:     	movq	(%rbx), %rcx
140288543:     	movq	0x8(%rbx), %rax
140288547:     	movq	%rax, 0xfb8(%rbp)
14028854e:     	movq	%rcx, 0xf98(%rbp)
140288555:     	leaq	0x1(%rcx), %rax
140288559:     	movq	%rax, (%rbx)
14028855c:     	movq	0xe40(%rbp), %rax
140288563:     	movq	%rax, 0x370(%rbp)
14028856a:     	movups	0xe30(%rbp), %xmm0
140288571:     	movaps	%xmm0, 0x360(%rbp)
140288578:     	movaps	-0x40(%rbp), %xmm0
14028857c:     	movups	%xmm0, 0x378(%rbp)
140288583:     	movq	-0x30(%rbp), %rax
140288587:     	movq	%rax, 0x388(%rbp)
14028858e:     	movups	0x190(%rbp), %xmm0
140288595:     	movaps	%xmm0, 0x390(%rbp)
14028859c:     	movq	0x1a0(%rbp), %rax
1402885a3:     	movq	%rax, 0x3a0(%rbp)
1402885aa:     	movups	0xa90(%rbp), %xmm0
1402885b1:     	movups	%xmm0, 0x3a8(%rbp)
1402885b8:     	movq	0xaa0(%rbp), %rax
1402885bf:     	movq	%rax, 0x3b8(%rbp)
1402885c6:     	movq	0x3b0(%rbp), %rax
1402885cd:     	movq	%rax, 0xae0(%rbp)
1402885d4:     	movq	0x3b8(%rbp), %rax
1402885db:     	movq	%rax, 0xae8(%rbp)
1402885e2:     	movq	0x3a0(%rbp), %rax
1402885e9:     	movq	%rax, 0xad0(%rbp)
1402885f0:     	movq	0x3a8(%rbp), %rax
1402885f7:     	movq	%rax, 0xad8(%rbp)
1402885fe:     	movaps	0x380(%rbp), %xmm0
140288605:     	movaps	%xmm0, 0xab0(%rbp)
14028860c:     	movaps	0x360(%rbp), %xmm0
140288613:     	movaps	0x370(%rbp), %xmm1
14028861a:     	movaps	0x390(%rbp), %xmm2
140288621:     	movaps	%xmm2, 0xac0(%rbp)
140288628:     	movaps	%xmm1, 0xaa0(%rbp)
14028862f:     	movaps	%xmm0, 0xa90(%rbp)
140288636:     	leaq	0xcf0(%rbp), %rcx
14028863d:     	callq	0x1402682d0 <.text+0x2672d0>
140288642:     	nop
140288643:     	movaps	0xae0(%rbp), %xmm0
14028864a:     	movaps	%xmm0, 0xd40(%rbp)
140288651:     	movaps	0xad0(%rbp), %xmm0
140288658:     	movaps	%xmm0, 0xd30(%rbp)
14028865f:     	movaps	0xa90(%rbp), %xmm0
140288666:     	movdqa	0xaa0(%rbp), %xmm1
14028866e:     	movdqa	0xab0(%rbp), %xmm2
140288676:     	movaps	0xac0(%rbp), %xmm3
14028867d:     	movaps	%xmm3, 0xd20(%rbp)
140288684:     	movdqa	%xmm2, 0xd10(%rbp)
14028868c:     	movdqa	%xmm1, 0xd00(%rbp)
140288694:     	movaps	%xmm0, 0xcf0(%rbp)
14028869b:     	movq	$0x0, 0xd50(%rbp)
1402886a6:     	movq	$0x8, 0xd58(%rbp)
1402886b1:     	xorps	%xmm0, %xmm0
1402886b4:     	movaps	%xmm0, 0xd60(%rbp)
1402886bb:     	movq	$0x8, 0xd70(%rbp)
1402886c6:     	movups	%xmm0, 0xd78(%rbp)
1402886cd:     	movq	$0x8, 0xd88(%rbp)
1402886d8:     	movq	$0x0, 0xd90(%rbp)
1402886e3:     	movups	0x56c9b36(%rip), %xmm0  # 0x145952220
1402886ea:     	movups	%xmm0, 0xda8(%rbp)
1402886f1:     	movdqu	0x56c9b17(%rip), %xmm0  # 0x145952210
1402886f9:     	movdqu	%xmm0, 0xd98(%rbp)
140288701:     	movq	0xf98(%rbp), %rax
140288708:     	movq	%rax, 0xdb8(%rbp)
14028870f:     	movq	0xfb8(%rbp), %rax
140288716:     	movq	%rax, 0xdc0(%rbp)
14028871d:     	movq	0xcf0(%rbp), %rsi
140288724:     	leaq	0xcf8(%rbp), %rdx
14028872b:     	leaq	0x360(%rbp), %rcx
140288732:     	movl	$0xd0, %r8d
140288738:     	callq	0x1457731ed <.text+0x57721ed>
14028873d:     	cmpq	$-0x1, %rsi
140288741:     	je	0x14028a623 <.text+0x289623>
140288747:     	movq	%r15, 0xde0(%rbp)
14028874e:     	movq	%rsi, 0xe30(%rbp)
140288755:     	leaq	0xe38(%rbp), %rcx
14028875c:     	leaq	0x360(%rbp), %rdx
140288763:     	movl	$0xd0, %r8d
140288769:     	callq	0x1457731ed <.text+0x57721ed>
14028876e:     	movq	0xdf0(%rbp), %rax
140288775:     	movq	%rax, 0xf50(%rbp)
14028877c:     	movq	0xdf8(%rbp), %rax
140288783:     	imulq	$0x38, 0xe00(%rbp), %rdx
14028878b:     	leaq	(%rax,%rdx), %rcx
14028878f:     	movq	%rcx, 0xf30(%rbp)
140288796:     	leaq	0x40(%r12), %rcx
14028879b:     	movq	%rcx, 0xf38(%rbp)
1402887a2:     	leaq	0x5a8(%r12), %rcx
1402887aa:     	movq	%rcx, 0xe20(%rbp)
1402887b1:     	leaq	0x38(%rax), %rcx
1402887b5:     	addq	$-0x38, %rdx
1402887b9:     	movd	0x567ecce(%rip), %xmm8  # 0x145907490
1402887c2:     	pcmpeqd	%xmm9, %xmm9
1402887c7:     	movdqa	0x568a970(%rip), %xmm10 # 0x145913140
1402887d0:     	movdqa	0x568a977(%rip), %xmm11 # 0x145913150
1402887d9:     	movdqa	0x567ee4e(%rip), %xmm12 # 0x145907630
1402887e2:     	movdqa	0x568fff5(%rip), %xmm13 # 0x1459187e0
1402887eb:     	movdqa	0x568ffcc(%rip), %xmm14 # 0x1459187c0
1402887f4:     	movdqa	0x568ffd3(%rip), %xmm15 # 0x1459187d0
1402887fd:     	movq	%rax, 0xf40(%rbp)
140288804:     	movq	%rax, 0xf98(%rbp)
14028880b:     	movq	%r12, 0xf90(%rbp)
140288812:     	jmp	0x140288846 <.text+0x287846>
140288814:     	movq	0xf90(%rbp), %r12
14028881b:     	leaq	0x56cc3f6(%rip), %r14   # 0x145954c18
140288822:     	nopw	%cs:(%rax,%rax)
140288830:     	movq	0xf78(%rbp), %rcx
140288837:     	addq	$0x38, %rcx
14028883b:     	movq	0xe10(%rbp), %rdx
140288842:     	addq	$-0x38, %rdx
140288846:     	movq	0xf98(%rbp), %rax
14028884d:     	cmpq	0xf30(%rbp), %rax
140288854:     	je	0x140289d9d <.text+0x288d9d>
14028885a:     	leaq	0x38(%rax), %r8
14028885e:     	movq	%r8, 0xf98(%rbp)
140288865:     	movq	(%rax), %r13
140288868:     	cmpq	$-0x1, %r13
14028886c:     	je	0x140289da9 <.text+0x288da9>
140288872:     	movq	%rdx, 0xe10(%rbp)
140288879:     	movq	%rcx, 0xf78(%rbp)
140288880:     	movl	0x8(%rax), %ecx
140288883:     	movq	%rcx, 0xfb8(%rbp)
14028888a:     	movl	%ecx, %r8d
14028888d:     	shrl	$0x10, %r8d
140288891:     	movzbl	0xc(%rax), %r12d
140288896:     	movzbl	0xd(%rax), %ecx
14028889a:     	movzbl	0xe(%rax), %ebx
14028889e:     	movzbl	0xf(%rax), %esi
1402888a2:     	movq	0x10(%rax), %r10
1402888a6:     	movq	%r10, %r9
1402888a9:     	shrq	$0x20, %r9
1402888ad:     	movq	%r10, %rdx
1402888b0:     	shrq	$0x28, %rdx
1402888b4:     	movq	%r10, %rdi
1402888b7:     	shrq	$0x30, %rdi
1402888bb:     	movq	0x18(%rax), %r14
1402888bf:     	movq	%r14, 0xf80(%rbp)
1402888c6:     	movq	0x20(%rax), %r11
1402888ca:     	movq	%r11, 0xf58(%rbp)
1402888d1:     	movq	0x28(%rax), %r11
1402888d5:     	movq	%r11, 0xf48(%rbp)
1402888dc:     	movq	0x30(%rax), %rax
1402888e0:     	movq	%rax, 0xe18(%rbp)
1402888e7:     	movq	%r13, %r14
1402888ea:     	movabsq	$-0x8000000000000000, %r15 # imm = 0x8000000000000000
1402888f4:     	xorq	%r15, %r14
1402888f7:     	testq	%r13, %r13
1402888fa:     	movl	$0x2, %r15d
140288900:     	cmovnsq	%r15, %r14
140288904:     	leaq	0x56d2e6d(%rip), %r15   # 0x14595b778
14028890b:     	movq	%r13, %rax
14028890e:     	movslq	(%r15,%r14,4), %r13
140288912:     	addq	%r15, %r13
140288915:     	movb	%r12b, 0xf88(%rbp)
14028891c:     	movzbl	%r12b, %r12d
140288920:     	movzbl	%cl, %r15d
140288924:     	movzbl	%bl, %r14d
140288928:     	movzbl	%sil, %r11d
14028892c:     	movq	%r11, 0xfa8(%rbp)
140288933:     	jmpq	*%r13
140288936:     	shlq	$0x20, %r12
14028893a:     	shlq	$0x28, %r15
14028893e:     	orq	%r12, %r15
140288941:     	shlq	$0x30, %r14
140288945:     	orq	%r15, %r14
140288948:     	movq	0xfa8(%rbp), %rax
14028894f:     	shlq	$0x38, %rax
140288953:     	orq	%r14, %rax
140288956:     	addq	0xfb8(%rbp), %rax
14028895d:     	movq	%rax, 0xfa8(%rbp)
140288964:     	movq	0xf90(%rbp), %r12
14028896b:     	movq	%r12, %rcx
14028896e:     	movq	0xf58(%rbp), %rdx
140288975:     	movq	%r10, 0xfb8(%rbp)
14028897c:     	movq	%r10, %r8
14028897f:     	movq	0xf80(%rbp), %r9
140288986:     	callq	0x14027f270 <.text+0x27e270>
14028898b:     	nop
14028898c:     	movq	0xfa8(%rbp), %rdx
140288993:     	testq	%rdx, %rdx
140288996:     	leaq	0x56cc27b(%rip), %r14   # 0x145954c18
14028899d:     	jne	0x140288dac <.text+0x287dac>
1402889a3:     	jmp	0x140288830 <.text+0x287830>
1402889a8:     	movb	%sil, 0x30(%rsp)
1402889ad:     	movb	%bl, 0x28(%rsp)
1402889b1:     	movb	%cl, 0x20(%rsp)
1402889b5:     	leaq	0x360(%rbp), %rsi
1402889bc:     	movq	%rsi, %rcx
1402889bf:     	movq	0xfb8(%rbp), %rdx
1402889c6:     	movzbl	0xf88(%rbp), %r9d
1402889ce:     	callq	0x140649ad0 <.text+0x648ad0>
1402889d3:     	nop
1402889d4:     	movq	0xf90(%rbp), %r12
1402889db:     	leaq	0x56cc236(%rip), %r14   # 0x145954c18
1402889e2:     	movq	%r12, %rcx
1402889e5:     	leaq	0xe30(%rbp), %rdx
1402889ec:     	movq	%rsi, %r8
1402889ef:     	callq	0x140280460 <.text+0x27f460>
1402889f4:     	nop
1402889f5:     	jmp	0x140288830 <.text+0x287830>
1402889fa:     	movq	%rax, 0xf88(%rbp)
140288a01:     	shlq	$0x20, %r12
140288a05:     	shlq	$0x28, %r15
140288a09:     	orq	%r12, %r15
140288a0c:     	shlq	$0x30, %r14
140288a10:     	orq	%r15, %r14
140288a13:     	movq	0xfa8(%rbp), %rdx
140288a1a:     	shlq	$0x38, %rdx
140288a1e:     	orq	%r14, %rdx
140288a21:     	addq	0xfb8(%rbp), %rdx
140288a28:     	movq	0xf80(%rbp), %rax
140288a2f:     	movq	%rax, 0x360(%rbp)
140288a36:     	movq	0xf58(%rbp), %rax
140288a3d:     	movq	%rax, 0x368(%rbp)
140288a44:     	movq	0xf48(%rbp), %rax
140288a4b:     	movq	%rax, 0x370(%rbp)
140288a52:     	leaq	0x360(%rbp), %rcx
140288a59:     	movq	%rcx, 0x20(%rsp)
140288a5e:     	leaq	0xe78(%rbp), %rcx
140288a65:     	movq	%rdx, 0xfa8(%rbp)
140288a6c:     	movq	%r10, %r8
140288a6f:     	movq	0xe18(%rbp), %r9
140288a76:     	callq	0x14027d510 <.text+0x27c510>
140288a7b:     	nop
140288a7c:     	movq	0xe80(%rbp), %rcx
140288a83:     	movq	0xe88(%rbp), %rdx
140288a8a:     	callq	0x14064de30 <.text+0x64ce30>
140288a8f:     	nop
140288a90:     	movq	0xf88(%rbp), %rdx
140288a97:     	testq	%rdx, %rdx
140288a9a:     	movq	0xf90(%rbp), %r12
140288aa1:     	leaq	0x56cc170(%rip), %r14   # 0x145954c18
140288aa8:     	je	0x140288830 <.text+0x287830>
140288aae:     	movl	$0x1, %r8d
140288ab4:     	movq	0xfa8(%rbp), %rcx
140288abb:     	jmp	0x140288db9 <.text+0x287db9>
140288ac0:     	movq	0xfb8(%rbp), %rax
140288ac7:     	movw	%ax, 0xa90(%rbp)
140288ace:     	movw	%r8w, 0xa92(%rbp)
140288ad6:     	movzbl	0xf88(%rbp), %eax
140288add:     	movb	%al, 0xa94(%rbp)
140288ae3:     	movb	%cl, 0xa95(%rbp)
140288ae9:     	movb	%bl, 0xa96(%rbp)
140288aef:     	movb	%sil, 0xa97(%rbp)
140288af6:     	movl	%r10d, 0xa98(%rbp)
140288afd:     	andb	$0x1, %dil
140288b01:     	movb	%dil, 0x28(%rsp)
140288b06:     	andb	$0x1, %dl
140288b09:     	movb	%dl, 0x20(%rsp)
140288b0d:     	andb	$0x1, %r9b
140288b11:     	leaq	0x360(%rbp), %rsi
140288b18:     	movq	%rsi, %rcx
140288b1b:     	movq	0xf90(%rbp), %r12
140288b22:     	movq	%r12, %rdx
140288b25:     	leaq	0xa90(%rbp), %r8
140288b2c:     	callq	0x14064f060 <.text+0x64e060>
140288b31:     	nop
140288b32:     	leaq	0x56cc0df(%rip), %r14   # 0x145954c18
140288b39:     	movq	%r12, %rcx
140288b3c:     	leaq	0xe30(%rbp), %rdx
140288b43:     	movq	%rsi, %r8
140288b46:     	callq	0x140280460 <.text+0x27f460>
140288b4b:     	nop
140288b4c:     	jmp	0x140288830 <.text+0x287830>
140288b51:     	leaq	-0x40(%rbp), %rcx
140288b55:     	callq	0x14543a660 <.text+0x5439660>
140288b5a:     	nop
140288b5b:     	movq	0xf90(%rbp), %r12
140288b62:     	leaq	0x56cc0af(%rip), %r14   # 0x145954c18
140288b69:     	leaq	0x360(%rbp), %rdi
140288b70:     	movb	$0x1, 0xfb7(%rbp)
140288b77:     	movq	%rdi, %rcx
140288b7a:     	callq	0x14543a9c0 <.text+0x54399c0>
140288b7f:     	nop
140288b80:     	movq	0x360(%rbp), %rax
140288b87:     	cmpq	$-0x1, %rax
140288b8b:     	je	0x1402893de <.text+0x2883de>
140288b91:     	movq	%rax, 0xfa8(%rbp)
140288b98:     	movq	0x368(%rbp), %rax
140288b9f:     	movq	%rax, 0xfb8(%rbp)
140288ba6:     	movq	0x370(%rbp), %rbx
140288bad:     	movb	$0x1, 0xfb6(%rbp)
140288bb4:     	callq	0x1451415a0 <.text+0x51405a0>
140288bb9:     	nop
140288bba:     	movb	$0x1, 0xfb6(%rbp)
140288bc1:     	movq	%rdi, %rcx
140288bc4:     	movq	%rax, %rdx
140288bc7:     	callq	0x14543af80 <.text+0x5439f80>
140288bcc:     	nop
140288bcd:     	movq	%rdi, 0x190(%rbp)
140288bd4:     	leaq	-0x286afb(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
140288bdb:     	movq	%rax, 0x198(%rbp)
140288be2:     	leaq	0xa90(%rbp), %rcx
140288be9:     	leaq	0x56cfb98(%rip), %rdx   # 0x145958788
140288bf0:     	leaq	0x190(%rbp), %r8
140288bf7:     	callq	0x145728390 <.text+0x5727390>
140288bfc:     	nop
140288bfd:     	movq	0x360(%rbp), %rdx
140288c04:     	testq	%rdx, %rdx
140288c07:     	movq	0xfb8(%rbp), %rsi
140288c0e:     	je	0x140288c22 <.text+0x287c22>
140288c10:     	movq	0x368(%rbp), %rcx
140288c17:     	movl	$0x1, %r8d
140288c1d:     	callq	0x1400021d0 <.text+0x11d0>
140288c22:     	movdqu	0xa90(%rbp), %xmm0
140288c2a:     	movdqa	%xmm0, 0x190(%rbp)
140288c32:     	movq	0xaa0(%rbp), %rax
140288c39:     	movq	%rax, 0x1a0(%rbp)
140288c40:     	movq	0x198(%rbp), %r9
140288c47:     	movb	$0x1, 0xfa6(%rbp)
140288c4e:     	movq	%rax, 0x20(%rsp)
140288c53:     	leaq	0xa90(%rbp), %rcx
140288c5a:     	movq	%rsi, %rdx
140288c5d:     	movq	%rbx, %r8
140288c60:     	callq	0x145702c70 <.text+0x5701c70>
140288c65:     	nop
140288c66:     	movb	$0x1, 0x360(%rbp)
140288c6d:     	movb	$0x1, 0xfa5(%rbp)
140288c74:     	movq	%rdi, %rcx
140288c77:     	movq	%rsi, %rdx
140288c7a:     	movq	%rbx, %r8
140288c7d:     	callq	0x145709fb0 <.text+0x5708fb0>
140288c82:     	nop
140288c83:     	testq	%rax, %rax
140288c86:     	je	0x1402894e2 <.text+0x2884e2>
140288c8c:     	movq	-0x40(%rbp), %rdx
140288c90:     	testq	%rdx, %rdx
140288c93:     	je	0x14028951a <.text+0x28851a>
140288c99:     	movq	-0x38(%rbp), %rcx
140288c9d:     	movl	$0x1, %r8d
140288ca3:     	movq	%rax, %rsi
140288ca6:     	callq	0x1400021d0 <.text+0x11d0>
140288cab:     	movq	%rsi, %rax
140288cae:     	jmp	0x14028951a <.text+0x28851a>
140288cb3:     	movq	0xfb8(%rbp), %r15
140288cba:     	cmpb	$0x6, %r15b
140288cbe:     	jne	0x140288f1f <.text+0x287f1f>
140288cc4:     	leaq	0x360(%rbp), %rcx
140288ccb:     	callq	0x14064bf00 <.text+0x64af00>
140288cd0:     	nop
140288cd1:     	movq	0xf90(%rbp), %r12
140288cd8:     	leaq	0x56cbf39(%rip), %r14   # 0x145954c18
140288cdf:     	movq	0xe88(%rbp), %rsi
140288ce6:     	testq	%rsi, %rsi
140288ce9:     	je	0x1402891a8 <.text+0x2881a8>
140288cef:     	movq	0xe80(%rbp), %rdi
140288cf6:     	addq	$0x20, %rdi
140288cfa:     	jmp	0x140288d0d <.text+0x287d0d>
140288cfc:     	nopl	(%rax)
140288d00:     	addq	$0x30, %rdi
140288d04:     	decq	%rsi
140288d07:     	je	0x1402891a8 <.text+0x2881a8>
140288d0d:     	movq	-0x20(%rdi), %rdx
140288d11:     	testq	%rdx, %rdx
140288d14:     	je	0x140288d25 <.text+0x287d25>
140288d16:     	movq	-0x18(%rdi), %rcx
140288d1a:     	movl	$0x1, %r8d
140288d20:     	callq	0x1400021d0 <.text+0x11d0>
140288d25:     	movq	-0x8(%rdi), %rdx
140288d29:     	testq	%rdx, %rdx
140288d2c:     	je	0x140288d00 <.text+0x287d00>
140288d2e:     	movq	(%rdi), %rcx
140288d31:     	movl	$0x1, %r8d
140288d37:     	callq	0x1400021d0 <.text+0x11d0>
140288d3c:     	jmp	0x140288d00 <.text+0x287d00>
140288d3e:     	shlq	$0x20, %r12
140288d42:     	shlq	$0x28, %r15
140288d46:     	orq	%r12, %r15
140288d49:     	shlq	$0x30, %r14
140288d4d:     	orq	%r15, %r14
140288d50:     	movq	0xfa8(%rbp), %rax
140288d57:     	shlq	$0x38, %rax
140288d5b:     	orq	%r14, %rax
140288d5e:     	addq	0xfb8(%rbp), %rax
140288d65:     	movq	%rax, 0xfa8(%rbp)
140288d6c:     	movq	0xf58(%rbp), %r8
140288d73:     	andb	$0x1, %r8b
140288d77:     	movq	%r10, 0xfb8(%rbp)
140288d7e:     	movq	%r10, %rcx
140288d81:     	movq	0xf80(%rbp), %rdx
140288d88:     	callq	0x14064c9d0 <.text+0x64b9d0>
140288d8d:     	nop
140288d8e:     	movq	0xfa8(%rbp), %rdx
140288d95:     	testq	%rdx, %rdx
140288d98:     	movq	0xf90(%rbp), %r12
140288d9f:     	leaq	0x56cbe72(%rip), %r14   # 0x145954c18
140288da6:     	je	0x140288830 <.text+0x287830>
140288dac:     	movl	$0x1, %r8d
140288db2:     	movq	0xfb8(%rbp), %rcx
140288db9:     	callq	0x1400021d0 <.text+0x11d0>
140288dbe:     	jmp	0x140288830 <.text+0x287830>
140288dc3:     	movq	%r10, %r14
140288dc6:     	shrq	$0x38, %r14
140288dca:     	movq	0xfb8(%rbp), %rax
140288dd1:     	movw	%ax, 0xf60(%rbp)
140288dd8:     	movw	%r8w, 0xf62(%rbp)
140288de0:     	movzbl	0xf88(%rbp), %eax
140288de7:     	movb	%al, 0xf64(%rbp)
140288ded:     	movb	%cl, 0xf65(%rbp)
140288df3:     	movb	%bl, 0xf66(%rbp)
140288df9:     	movb	%sil, 0xf67(%rbp)
140288e00:     	movl	%r10d, 0xf68(%rbp)
140288e07:     	movb	%r9b, 0xf6c(%rbp)
140288e0e:     	movb	%dl, 0xf6d(%rbp)
140288e14:     	movb	%dil, 0xf6e(%rbp)
140288e1b:     	movb	%r14b, 0xf6f(%rbp)
140288e22:     	movq	0xf80(%rbp), %rax
140288e29:     	movq	%rax, 0xf70(%rbp)
140288e30:     	leaq	-0x40(%rbp), %rcx
140288e34:     	movq	0xf48(%rbp), %rdx
140288e3b:     	movq	0xe18(%rbp), %r8
140288e42:     	callq	0x14543a760 <.text+0x5439760>
140288e47:     	nop
140288e48:     	movq	0xf90(%rbp), %r12
140288e4f:     	movq	0xde0(%rbp), %rdi
140288e56:     	cmpq	$-0x1, -0x40(%rbp)
140288e5b:     	je	0x140289363 <.text+0x288363>
140288e61:     	movl	$0x1d0, %r8d            # imm = 0x1D0
140288e67:     	leaq	0x190(%rbp), %rcx
140288e6e:     	leaq	-0x40(%rbp), %rdx
140288e72:     	callq	0x1457731ed <.text+0x57721ed>
140288e77:     	cmpq	$0x0, 0x90(%r12)
140288e80:     	leaq	0x56cbd91(%rip), %r14   # 0x145954c18
140288e87:     	je	0x140289fe8 <.text+0x288fe8>
140288e8d:     	movq	0x78(%r12), %rax
140288e92:     	movq	0x80(%r12), %rcx
140288e9a:     	xorl	%edx, %edx
140288e9c:     	movabsq	$0x4a721453ca25c1be, %r8 # imm = 0x4A721453CA25C1BE
140288ea6:     	andq	%rcx, %r8
140288ea9:     	movdqu	(%rax,%r8), %xmm0
140288eaf:     	movdqa	%xmm0, %xmm1
140288eb3:     	pcmpeqb	%xmm10, %xmm1
140288eb8:     	pmovmskb	%xmm1, %r9d
140288ebd:     	testl	%r9d, %r9d
140288ec0:     	je	0x140288eff <.text+0x287eff>
140288ec2:     	tzcntl	%r9d, %r10d
140288ec7:     	addq	%r8, %r10
140288eca:     	andq	%rcx, %r10
140288ecd:     	negq	%r10
140288ed0:     	leaq	(%r10,%r10,2), %r10
140288ed4:     	movdqu	-0x18(%rax,%r10,8), %xmm1
140288edb:     	pcmpeqb	%xmm11, %xmm1
140288ee0:     	pmovmskb	%xmm1, %r11d
140288ee5:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140288eec:     	je	0x140289205 <.text+0x288205>
140288ef2:     	leal	-0x1(%r9), %r10d
140288ef6:     	andw	%r9w, %r10w
140288efa:     	movl	%r10d, %r9d
140288efd:     	jne	0x140288ec2 <.text+0x287ec2>
140288eff:     	pcmpeqb	%xmm9, %xmm0
140288f04:     	pmovmskb	%xmm0, %r9d
140288f09:     	testl	%r9d, %r9d
140288f0c:     	jne	0x140289fe8 <.text+0x288fe8>
140288f12:     	addq	%rdx, %r8
140288f15:     	addq	$0x10, %r8
140288f19:     	addq	$0x10, %rdx
140288f1d:     	jmp	0x140288ea6 <.text+0x287ea6>
140288f1f:     	xorl	%esi, %esi
140288f21:     	xorl	%r13d, %r13d
140288f24:     	movq	0xf90(%rbp), %r12
140288f2b:     	leaq	0x56cbce6(%rip), %r14   # 0x145954c18
140288f32:     	leaq	0x360(%rbp), %rdi
140288f39:     	nopl	(%rax)
140288f40:     	cmpq	$0x3900, %r13           # imm = 0x3900
140288f47:     	je	0x140288830 <.text+0x287830>
140288f4d:     	movq	%r13, %rax
140288f50:     	movq	%rsi, %rbx
140288f53:     	addq	$0x98, %r13
140288f5a:     	incq	%rsi
140288f5d:     	cmpb	%r15b, 0x91(%rax,%r14)
140288f65:     	jne	0x140288f40 <.text+0x287f40>
140288f67:     	movq	0x18(%rax,%r14), %rcx
140288f6c:     	leaq	0x56d2829(%rip), %rdx   # 0x14595b79c
140288f73:     	movslq	(%rdx,%rcx,4), %rcx
140288f77:     	addq	%rdx, %rcx
140288f7a:     	jmpq	*%rcx
140288f7c:     	movq	0x20(%rax,%r14), %r8
140288f81:     	movq	0x28(%rax,%r14), %r9
140288f86:     	movq	%rdi, %rcx
140288f89:     	movq	%r12, %rdx
140288f8c:     	callq	0x14064a9d0 <.text+0x6499d0>
140288f91:     	nop
140288f92:     	cmpq	$-0x1, 0x360(%rbp)
140288f9a:     	je	0x140289139 <.text+0x288139>
140288fa0:     	movq	0x370(%rbp), %rax
140288fa7:     	movq	%rax, 0xaa0(%rbp)
140288fae:     	movups	0x360(%rbp), %xmm0
140288fb5:     	movaps	%xmm0, 0xa90(%rbp)
140288fbc:     	jmp	0x140289160 <.text+0x288160>
140288fc1:     	callq	0x140002200 <.text+0x1200>
140288fc6:     	movl	$0x1, %ecx
140288fcb:     	movl	$0x1, %edx
140288fd0:     	callq	0x1400021c0 <.text+0x11c0>
140288fd5:     	testq	%rax, %rax
140288fd8:     	je	0x14028a6a2 <.text+0x2896a2>
140288fde:     	movb	$0x30, (%rax)
140288fe1:     	movq	$0x1, 0xa90(%rbp)
140288fec:     	movq	%rax, 0xa98(%rbp)
140288ff3:     	movq	$0x1, 0xaa0(%rbp)
140288ffe:     	jmp	0x140289160 <.text+0x288160>
140289003:     	movl	$0x5, %r9d
140289009:     	movq	%rdi, %rcx
14028900c:     	movq	%r12, %rdx
14028900f:     	leaq	0x56c9a1f(%rip), %r8    # 0x145952a35
140289016:     	callq	0x14064a9d0 <.text+0x6499d0>
14028901b:     	nop
14028901c:     	movq	0x360(%rbp), %rax
140289023:     	cmpq	$-0x1, %rax
140289027:     	je	0x140289115 <.text+0x288115>
14028902d:     	movq	%rax, 0xfa8(%rbp)
140289034:     	movq	0x368(%rbp), %rcx
14028903b:     	movq	0x370(%rbp), %rdx
140289042:     	movq	%rcx, 0xf80(%rbp)
140289049:     	callq	0x1457373e0 <.text+0x57363e0>
14028904e:     	nop
14028904f:     	movq	%rax, %r15
140289052:     	movq	0xfa8(%rbp), %rdx
140289059:     	testq	%rdx, %rdx
14028905c:     	je	0x140289070 <.text+0x288070>
14028905e:     	movl	$0x1, %r8d
140289064:     	movq	0xf80(%rbp), %rcx
14028906b:     	callq	0x1400021d0 <.text+0x11d0>
140289070:     	movdqa	%xmm8, %xmm0
140289075:     	testb	$0x1, %r15b
140289079:     	jne	0x14028911a <.text+0x28811a>
14028907f:     	shrq	$0x20, %r15
140289083:     	movd	%r15d, %xmm0
140289088:     	jmp	0x14028911a <.text+0x28811a>
14028908d:     	movq	0x30(%rax,%r14), %r15
140289092:     	movq	0x38(%rax,%r14), %r12
140289097:     	movq	$0x1, 0x20(%rsp)
1402890a0:     	movl	$0x1, %r9d
1402890a6:     	movq	%rdi, %rcx
1402890a9:     	movq	%r12, %rdx
1402890ac:     	xorl	%r8d, %r8d
1402890af:     	callq	0x140188f20 <.text+0x187f20>
1402890b4:     	movq	0x368(%rbp), %rdi
1402890bb:     	cmpb	$0x0, 0x360(%rbp)
1402890c2:     	jne	0x14028a60e <.text+0x28960e>
1402890c8:     	movq	0x370(%rbp), %r14
1402890cf:     	testq	%r12, %r12
1402890d2:     	je	0x1402890e2 <.text+0x2880e2>
1402890d4:     	movq	%r14, %rcx
1402890d7:     	movq	%r15, %rdx
1402890da:     	movq	%r12, %r8
1402890dd:     	callq	0x1457731ed <.text+0x57721ed>
1402890e2:     	movq	%rdi, 0xa90(%rbp)
1402890e9:     	movq	%r14, 0xa98(%rbp)
1402890f0:     	movq	%r12, 0xaa0(%rbp)
1402890f7:     	movq	0xf90(%rbp), %r12
1402890fe:     	leaq	0x56cbb13(%rip), %r14   # 0x145954c18
140289105:     	leaq	0x360(%rbp), %rdi
14028910c:     	movq	0xfb8(%rbp), %r15
140289113:     	jmp	0x140289160 <.text+0x288160>
140289115:     	movdqa	%xmm8, %xmm0
14028911a:     	movdqa	%xmm8, %xmm1
14028911f:     	subss	%xmm0, %xmm1
140289123:     	leaq	0xa90(%rbp), %rcx
14028912a:     	callq	0x14027dd60 <.text+0x27cd60>
14028912f:     	nop
140289130:     	movq	0xfb8(%rbp), %r15
140289137:     	jmp	0x140289160 <.text+0x288160>
140289139:     	movq	$0x0, 0xa90(%rbp)
140289144:     	movq	$0x1, 0xa98(%rbp)
14028914f:     	movq	$0x0, 0xaa0(%rbp)
14028915a:     	nopw	(%rax,%rax)
140289160:     	movq	0xa98(%rbp), %r8
140289167:     	movq	0xaa0(%rbp), %r9
14028916e:     	movq	%r12, %rcx
140289171:     	movq	%rbx, %rdx
140289174:     	movq	%r8, 0xfa8(%rbp)
14028917b:     	callq	0x14027f270 <.text+0x27e270>
140289180:     	nop
140289181:     	movq	0xa90(%rbp), %rdx
140289188:     	testq	%rdx, %rdx
14028918b:     	je	0x140288f40 <.text+0x287f40>
140289191:     	movl	$0x1, %r8d
140289197:     	movq	0xfa8(%rbp), %rcx
14028919e:     	callq	0x1400021d0 <.text+0x11d0>
1402891a3:     	jmp	0x140288f40 <.text+0x287f40>
1402891a8:     	movq	0xe78(%rbp), %rax
1402891af:     	testq	%rax, %rax
1402891b2:     	je	0x1402891ce <.text+0x2881ce>
1402891b4:     	movq	0xe80(%rbp), %rcx
1402891bb:     	shlq	$0x4, %rax
1402891bf:     	leaq	(%rax,%rax,2), %rdx
1402891c3:     	movl	$0x8, %r8d
1402891c9:     	callq	0x1400021d0 <.text+0x11d0>
1402891ce:     	movq	0x370(%rbp), %rax
1402891d5:     	leaq	0xe78(%rbp), %rcx
1402891dc:     	movq	%rax, 0x10(%rcx)
1402891e0:     	movdqu	0x360(%rbp), %xmm0
1402891e8:     	movdqu	%xmm0, (%rcx)
1402891ec:     	movq	0xe80(%rbp), %rcx
1402891f3:     	movq	0xe88(%rbp), %rdx
1402891fa:     	callq	0x14064de30 <.text+0x64ce30>
1402891ff:     	nop
140289200:     	jmp	0x140288830 <.text+0x287830>
140289205:     	leaq	(%rax,%r10,8), %rax
140289209:     	movq	-0x8(%rax), %rax
14028920d:     	cmpq	0x218(%r12), %rax
140289215:     	jae	0x140289fe8 <.text+0x288fe8>
14028921b:     	movq	0x210(%r12), %rcx
140289223:     	movq	(%rcx,%rax,8), %rcx
140289227:     	testq	%rcx, %rcx
14028922a:     	je	0x140289fe8 <.text+0x288fe8>
140289230:     	movq	0x1e0(%r12), %rax
140289238:     	notq	%rcx
14028923b:     	imulq	$0x38, %rcx, %rcx
14028923f:     	cmpb	$0x0, 0x30(%rax,%rcx)
140289244:     	je	0x140289fe8 <.text+0x288fe8>
14028924a:     	addq	%rcx, %rax
14028924d:     	movq	0x10(%rax), %rcx
140289251:     	movl	$0x10, 0x360(%rbp)
14028925b:     	movb	$0x1, 0xfc5(%rbp)
140289262:     	leaq	0x360(%rbp), %rdx
140289269:     	callq	0x140044cc0 <.text+0x43cc0>
14028926e:     	nop
14028926f:     	movl	$0x1d0, %r8d            # imm = 0x1D0
140289275:     	leaq	0xa90(%rbp), %rcx
14028927c:     	leaq	-0x40(%rbp), %rdx
140289280:     	callq	0x1457731ed <.text+0x57721ed>
140289285:     	movq	0xf38(%rbp), %rax
14028928c:     	movq	%rax, 0xf20(%rbp)
140289293:     	movq	0xe20(%rbp), %rax
14028929a:     	movq	%rax, 0xf28(%rbp)
1402892a1:     	movq	$0x0, 0xf08(%rbp)
1402892ac:     	movq	$0x8, 0xf10(%rbp)
1402892b7:     	movq	$0x0, 0xf18(%rbp)
1402892c2:     	cmpq	$0x0, 0x90(%r12)
1402892cb:     	je	0x140289443 <.text+0x288443>
1402892d1:     	movq	0x78(%r12), %rax
1402892d6:     	movq	0x80(%r12), %rcx
1402892de:     	xorl	%edx, %edx
1402892e0:     	movabsq	$-0x5ff054ddeddb2157, %r8 # imm = 0xA00FAB221224DEA9
1402892ea:     	andq	%rcx, %r8
1402892ed:     	movdqu	(%rax,%r8), %xmm0
1402892f3:     	movdqa	%xmm0, %xmm1
1402892f7:     	pcmpeqb	%xmm12, %xmm1
1402892fc:     	pmovmskb	%xmm1, %r9d
140289301:     	testl	%r9d, %r9d
140289304:     	je	0x140289343 <.text+0x288343>
140289306:     	tzcntl	%r9d, %r10d
14028930b:     	addq	%r8, %r10
14028930e:     	andq	%rcx, %r10
140289311:     	negq	%r10
140289314:     	leaq	(%r10,%r10,2), %r10
140289318:     	movdqu	-0x18(%rax,%r10,8), %xmm1
14028931f:     	pcmpeqb	%xmm13, %xmm1
140289324:     	pmovmskb	%xmm1, %r11d
140289329:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140289330:     	je	0x1402895c0 <.text+0x2885c0>
140289336:     	leal	-0x1(%r9), %r10d
14028933a:     	andw	%r9w, %r10w
14028933e:     	movl	%r10d, %r9d
140289341:     	jne	0x140289306 <.text+0x288306>
140289343:     	pcmpeqb	%xmm9, %xmm0
140289348:     	pmovmskb	%xmm0, %r9d
14028934d:     	testl	%r9d, %r9d
140289350:     	jne	0x140289443 <.text+0x288443>
140289356:     	addq	%rdx, %r8
140289359:     	addq	$0x10, %r8
14028935d:     	addq	$0x10, %rdx
140289361:     	jmp	0x1402892ea <.text+0x2882ea>
140289363:     	movq	-0x38(%rbp), %rcx
140289367:     	movq	-0x30(%rbp), %rdx
14028936b:     	callq	0x145457c00 <.text+0x5456c00>
140289370:     	nop
140289371:     	movq	%rax, 0xa90(%rbp)
140289378:     	movq	%rdx, 0xa98(%rbp)
14028937f:     	leaq	0xf60(%rbp), %rax
140289386:     	movq	%rax, 0x360(%rbp)
14028938d:     	leaq	-0x2872b4(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
140289394:     	movq	%rax, 0x368(%rbp)
14028939b:     	leaq	0xa90(%rbp), %rax
1402893a2:     	movq	%rax, 0x370(%rbp)
1402893a9:     	leaq	-0x2872f0(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
1402893b0:     	movq	%rax, 0x378(%rbp)
1402893b7:     	leaq	0xdc8(%rbp), %rcx
1402893be:     	leaq	0x56c95dd(%rip), %rdx   # 0x1459529a2
1402893c5:     	leaq	0x360(%rbp), %r8
1402893cc:     	callq	0x145728390 <.text+0x5727390>
1402893d1:     	nop
1402893d2:     	leaq	0x56cb83f(%rip), %r14   # 0x145954c18
1402893d9:     	jmp	0x140289a88 <.text+0x288a88>
1402893de:     	movb	$0x1, 0xfb7(%rbp)
1402893e5:     	movl	$0x18, %edx
1402893ea:     	leaq	0x56cf3d5(%rip), %rcx   # 0x1459587c6
1402893f1:     	callq	0x145457c00 <.text+0x5456c00>
1402893f6:     	nop
1402893f7:     	movq	%rdx, %rbx
1402893fa:     	testq	%rdx, %rdx
1402893fd:     	js	0x14028a075 <.text+0x289075>
140289403:     	testq	%rbx, %rbx
140289406:     	je	0x140289bf6 <.text+0x288bf6>
14028940c:     	movq	%rax, %rdi
14028940f:     	callq	0x140002200 <.text+0x1200>
140289414:     	movl	$0x1, %edx
140289419:     	movq	%rbx, %rcx
14028941c:     	callq	0x1400021c0 <.text+0x11c0>
140289421:     	testq	%rax, %rax
140289424:     	je	0x14028a6c6 <.text+0x2896c6>
14028942a:     	movq	%rax, %rcx
14028942d:     	movq	%rdi, %rdx
140289430:     	movq	%rax, %rsi
140289433:     	movq	%rbx, %r8
140289436:     	callq	0x1457731ed <.text+0x57721ed>
14028943b:     	movq	%rsi, %rax
14028943e:     	jmp	0x140289bfb <.text+0x288bfb>
140289443:     	movzbl	0xa0(%r12), %eax
14028944c:     	movq	0xe0(%r12), %rax
140289454:     	movq	0xe8(%r12), %rcx
14028945c:     	xorl	%r8d, %r8d
14028945f:     	movabsq	$-0x5ff054ddeddb2157, %r9 # imm = 0xA00FAB221224DEA9
140289469:     	andq	%rcx, %r9
14028946c:     	movdqu	(%rax,%r9), %xmm0
140289472:     	movdqa	%xmm0, %xmm1
140289476:     	pcmpeqb	%xmm12, %xmm1
14028947b:     	pmovmskb	%xmm1, %r11d
140289480:     	testl	%r11d, %r11d
140289483:     	je	0x1402894c4 <.text+0x2884c4>
140289485:     	tzcntl	%r11d, %r10d
14028948a:     	addq	%r9, %r10
14028948d:     	andq	%rcx, %r10
140289490:     	movq	%r10, %rsi
140289493:     	shlq	$0x7, %rsi
140289497:     	movq	%rax, %rdx
14028949a:     	subq	%rsi, %rdx
14028949d:     	movdqu	-0x80(%rdx), %xmm1
1402894a2:     	pcmpeqb	%xmm13, %xmm1
1402894a7:     	pmovmskb	%xmm1, %esi
1402894ab:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
1402894b1:     	je	0x1402895cd <.text+0x2885cd>
1402894b7:     	leal	-0x1(%r11), %edx
1402894bb:     	andw	%r11w, %dx
1402894bf:     	movl	%edx, %r11d
1402894c2:     	jne	0x140289485 <.text+0x288485>
1402894c4:     	pcmpeqb	%xmm9, %xmm0
1402894c9:     	pmovmskb	%xmm0, %edx
1402894cd:     	testl	%edx, %edx
1402894cf:     	jne	0x140289642 <.text+0x288642>
1402894d5:     	addq	%r8, %r9
1402894d8:     	addq	$0x10, %r9
1402894dc:     	addq	$0x10, %r8
1402894e0:     	jmp	0x140289469 <.text+0x288469>
1402894e2:     	movq	-0x30(%rbp), %rax
1402894e6:     	movq	%rax, 0x370(%rbp)
1402894ed:     	movdqu	-0x40(%rbp), %xmm0
1402894f2:     	movdqa	%xmm0, 0x360(%rbp)
1402894fa:     	movb	$0x0, 0xfa5(%rbp)
140289501:     	leaq	0xa90(%rbp), %rcx
140289508:     	movq	%rdi, %rdx
14028950b:     	callq	0x140199780 <.text+0x198780>
140289510:     	nop
140289511:     	testq	%rax, %rax
140289514:     	je	0x1402896e5 <.text+0x2886e5>
14028951a:     	movq	%rax, 0xf60(%rbp)
140289521:     	leaq	0x56cf248(%rip), %rax   # 0x145958770
140289528:     	movq	%rax, 0x360(%rbp)
14028952f:     	movq	$0x5, 0x368(%rbp)
14028953a:     	leaq	0xf60(%rbp), %rax
140289541:     	movq	%rax, 0x370(%rbp)
140289548:     	leaq	0x56cf201(%rip), %rax   # 0x145958750
14028954f:     	movq	%rax, 0x378(%rbp)
140289556:     	movq	$0x1, 0x20(%rsp)
14028955f:     	movl	$0x15, %r8d
140289565:     	leaq	0xf08(%rbp), %rcx
14028956c:     	leaq	0x56cf23e(%rip), %rdx   # 0x1459587b1
140289573:     	movq	%rdi, %r9
140289576:     	callq	0x145457c60 <.text+0x5456c60>
14028957b:     	nop
14028957c:     	movq	0xf60(%rbp), %rax
140289583:     	movl	%eax, %ecx
140289585:     	andl	$0x3, %ecx
140289588:     	leal	-0x2(%rcx), %edx
14028958b:     	cmpl	$0x2, %edx
14028958e:     	jb	0x140289740 <.text+0x288740>
140289594:     	testq	%rcx, %rcx
140289597:     	je	0x140289740 <.text+0x288740>
14028959d:     	decq	%rax
1402895a0:     	movq	%rax, 0x368(%rbp)
1402895a7:     	movb	$0x3, 0x360(%rbp)
1402895ae:     	leaq	0x368(%rbp), %rcx
1402895b5:     	callq	0x14573b330 <.text+0x573a330>
1402895ba:     	nop
1402895bb:     	jmp	0x140289740 <.text+0x288740>
1402895c0:     	leaq	(%rax,%r10,8), %rax
1402895c4:     	movq	-0x8(%rax), %rbx
1402895c8:     	jmp	0x1402897fd <.text+0x2887fd>
1402895cd:     	leaq	-0x10(%r10), %r8
1402895d1:     	andq	%rcx, %r8
1402895d4:     	movdqu	(%rax,%r8), %xmm0
1402895da:     	pcmpeqb	%xmm9, %xmm0
1402895df:     	pmovmskb	%xmm0, %ecx
1402895e3:     	movdqu	(%rax,%r10), %xmm0
1402895e9:     	pcmpeqb	%xmm9, %xmm0
1402895ee:     	pmovmskb	%xmm0, %r9d
1402895f3:     	movw	$0x1f, %r11w
1402895f8:     	bsrw	%cx, %r11w
1402895fd:     	xorl	$0xf, %r11d
140289601:     	orl	$0x10000, %r9d          # imm = 0x10000
140289608:     	tzcntl	%r9d, %r9d
14028960d:     	addl	%r11d, %r9d
140289610:     	movb	$-0x80, %cl
140289612:     	cmpw	$0xf, %r9w
140289617:     	ja	0x140289623 <.text+0x288623>
140289619:     	incq	0xf0(%r12)
140289621:     	movb	$-0x1, %cl
140289623:     	movb	%cl, (%rax,%r10)
140289627:     	movb	%cl, 0x10(%rax,%r8)
14028962c:     	decq	0xf8(%r12)
140289634:     	movq	-0x70(%rdx), %rax
140289638:     	cmpq	$0x2, %rax
14028963c:     	jne	0x1402897a1 <.text+0x2887a1>
140289642:     	movq	0xe20(%rbp), %rcx
140289649:     	movq	(%rcx), %rbx
14028964c:     	leaq	0x1(%rbx), %rax
140289650:     	movq	%rax, (%rcx)
140289653:     	movw	$0x100, 0x3b0(%rbp)     # imm = 0x100
14028965c:     	movq	$0x1, 0x360(%rbp)
140289667:     	movdqu	0x56c7ea1(%rip), %xmm0  # 0x145951510
14028966f:     	leaq	0x360(%rbp), %r8
140289676:     	movdqu	%xmm0, 0x8(%r8)
14028967c:     	movq	$0x8, 0x388(%rbp)
140289687:     	movq	$0x1d0, 0x390(%rbp)     # imm = 0x1D0
140289692:     	leaq	-0x217c9(%rip), %rax    # 0x140267ed0 <.text+0x266ed0>
140289699:     	movq	%rax, 0x3a8(%rbp)
1402896a0:     	movb	$0x1, 0x3b2(%rbp)
1402896a7:     	movq	$0x0, 0x378(%rbp)
1402896b2:     	movb	$0x2, 0x398(%rbp)
1402896b9:     	movq	0xf38(%rbp), %rcx
1402896c0:     	movq	%rbx, %rdx
1402896c3:     	callq	0x140044810 <.text+0x43810>
1402896c8:     	nop
1402896c9:     	movq	0xde8(%rbp), %rcx
1402896d0:     	leaq	0x56c7e39(%rip), %rdx   # 0x145951510
1402896d7:     	movq	%rbx, %r8
1402896da:     	callq	0x14000ecd0 <.text+0xdcd0>
1402896df:     	nop
1402896e0:     	jmp	0x1402897fd <.text+0x2887fd>
1402896e5:     	leaq	0x56c9239(%rip), %rax   # 0x145952925
1402896ec:     	movq	%rax, 0x360(%rbp)
1402896f3:     	movq	$0x4, 0x368(%rbp)
1402896fe:     	leaq	0x190(%rbp), %rax
140289705:     	movq	%rax, 0x370(%rbp)
14028970c:     	leaq	0x56c907d(%rip), %rax   # 0x145952790
140289713:     	movq	%rax, 0x378(%rbp)
14028971a:     	movq	$0x1, 0x20(%rsp)
140289723:     	movl	$0x10, %r8d
140289729:     	leaq	0xf08(%rbp), %rcx
140289730:     	leaq	0x56cf06a(%rip), %rdx   # 0x1459587a1
140289737:     	movq	%rdi, %r9
14028973a:     	callq	0x145457c60 <.text+0x5456c60>
14028973f:     	nop
140289740:     	movq	0xa90(%rbp), %rdx
140289747:     	testq	%rdx, %rdx
14028974a:     	movq	0xfb8(%rbp), %rsi
140289751:     	je	0x140289765 <.text+0x288765>
140289753:     	movq	0xa98(%rbp), %rcx
14028975a:     	movl	$0x1, %r8d
140289760:     	callq	0x1400021d0 <.text+0x11d0>
140289765:     	movq	0x190(%rbp), %rdx
14028976c:     	testq	%rdx, %rdx
14028976f:     	je	0x140289783 <.text+0x288783>
140289771:     	movq	0x198(%rbp), %rcx
140289778:     	movl	$0x1, %r8d
14028977e:     	callq	0x1400021d0 <.text+0x11d0>
140289783:     	movq	0xfa8(%rbp), %rdx
14028978a:     	testq	%rdx, %rdx
14028978d:     	je	0x140289c2f <.text+0x288c2f>
140289793:     	movl	$0x1, %r8d
140289799:     	movq	%rsi, %rcx
14028979c:     	jmp	0x140289c2a <.text+0x288c2a>
1402897a1:     	movq	-0x8(%rdx), %r8
1402897a5:     	leaq	0x360(%rbp), %rcx
1402897ac:     	movq	%r8, 0x68(%rcx)
1402897b0:     	movups	-0x18(%rdx), %xmm0
1402897b4:     	movups	%xmm0, 0x58(%rcx)
1402897b8:     	movups	-0x28(%rdx), %xmm0
1402897bc:     	movups	%xmm0, 0x48(%rcx)
1402897c0:     	movdqu	-0x68(%rdx), %xmm0
1402897c5:     	movdqu	-0x58(%rdx), %xmm1
1402897ca:     	movdqu	-0x48(%rdx), %xmm2
1402897cf:     	movups	-0x38(%rdx), %xmm3
1402897d3:     	movups	%xmm3, 0x38(%rcx)
1402897d7:     	movdqu	%xmm2, 0x28(%rcx)
1402897dc:     	movdqu	%xmm1, 0x18(%rcx)
1402897e1:     	movdqu	%xmm0, 0x8(%rcx)
1402897e6:     	movq	%rax, 0x360(%rbp)
1402897ed:     	leaq	0xf08(%rbp), %rdx
1402897f4:     	callq	0x144e17460 <.text+0x4e16460>
1402897f9:     	nop
1402897fa:     	movq	%rax, %rbx
1402897fd:     	movq	0xf08(%rbp), %rdx
140289804:     	testq	%rdx, %rdx
140289807:     	je	0x14028981f <.text+0x28881f>
140289809:     	movq	0xf10(%rbp), %rcx
140289810:     	shlq	$0x3, %rdx
140289814:     	movl	$0x8, %r8d
14028981a:     	callq	0x1400021d0 <.text+0x11d0>
14028981f:     	movl	$0x1d0, %r8d            # imm = 0x1D0
140289825:     	leaq	0x360(%rbp), %rcx
14028982c:     	leaq	-0x40(%rbp), %rdx
140289830:     	callq	0x1457731ed <.text+0x57721ed>
140289835:     	movl	0x5b0(%r12), %esi
14028983d:     	movb	$0x0, 0xfb5(%rbp)
140289844:     	movq	%r12, %rcx
140289847:     	callq	0x144e89050 <.text+0x4e88050>
14028984c:     	nop
14028984d:     	movq	%rbx, 0xf08(%rbp)
140289854:     	movb	$0x0, 0xfb5(%rbp)
14028985b:     	movq	%rdi, %rcx
14028985e:     	movq	%rbx, %rdx
140289861:     	movq	0xf38(%rbp), %r8
140289868:     	leaq	0xf08(%rbp), %r9
14028986f:     	callq	0x1401ed960 <.text+0x1ec960>
140289874:     	nop
140289875:     	movq	%rax, %rbx
140289878:     	cmpb	$0x1, 0x30(%rax)
14028987c:     	jne	0x140289899 <.text+0x288899>
14028987e:     	movb	$0x0, 0xfb5(%rbp)
140289885:     	movq	%rbx, %rcx
140289888:     	xorl	%edx, %edx
14028988a:     	leaq	0x360(%rbp), %r8
140289891:     	callq	0x144e73fa0 <.text+0x4e72fa0>
140289896:     	nop
140289897:     	jmp	0x1402898b4 <.text+0x2888b4>
140289899:     	movq	0x8(%rbx), %r8
14028989d:     	movq	0x10(%rbx), %rcx
1402898a1:     	leaq	0x360(%rbp), %rdx
1402898a8:     	callq	0x1457731e1 <.text+0x57721e1>
1402898ad:     	movl	%esi, 0x28(%rbx)
1402898b0:     	movb	$0x1, 0x30(%rbx)
1402898b4:     	movl	%esi, 0x2c(%rbx)
1402898b7:     	movb	$0x0, 0xfc5(%rbp)
1402898be:     	leaq	0x360(%rbp), %rcx
1402898c5:     	callq	0x1400ad370 <.text+0xac370>
1402898ca:     	nop
1402898cb:     	cmpq	$0x0, 0x90(%r12)
1402898d4:     	leaq	0x360(%rbp), %rdi
1402898db:     	je	0x14028a5d2 <.text+0x2895d2>
1402898e1:     	movq	0x78(%r12), %rax
1402898e6:     	movq	0x80(%r12), %rcx
1402898ee:     	xorl	%edx, %edx
1402898f0:     	movabsq	$0x7639a6ed3ccfc429, %r8 # imm = 0x7639A6ED3CCFC429
1402898fa:     	andq	%rcx, %r8
1402898fd:     	movdqu	(%rax,%r8), %xmm0
140289903:     	movdqa	%xmm0, %xmm1
140289907:     	pcmpeqb	%xmm14, %xmm1
14028990c:     	pmovmskb	%xmm1, %r9d
140289911:     	testl	%r9d, %r9d
140289914:     	je	0x14028994f <.text+0x28894f>
140289916:     	tzcntl	%r9d, %r10d
14028991b:     	addq	%r8, %r10
14028991e:     	andq	%rcx, %r10
140289921:     	negq	%r10
140289924:     	leaq	(%r10,%r10,2), %r10
140289928:     	movdqu	-0x18(%rax,%r10,8), %xmm1
14028992f:     	pcmpeqb	%xmm15, %xmm1
140289934:     	pmovmskb	%xmm1, %r11d
140289939:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140289940:     	je	0x14028996f <.text+0x28896f>
140289942:     	leal	-0x1(%r9), %r10d
140289946:     	andw	%r9w, %r10w
14028994a:     	movl	%r10d, %r9d
14028994d:     	jne	0x140289916 <.text+0x288916>
14028994f:     	pcmpeqb	%xmm9, %xmm0
140289954:     	pmovmskb	%xmm0, %r9d
140289959:     	testl	%r9d, %r9d
14028995c:     	jne	0x14028a5d2 <.text+0x2895d2>
140289962:     	addq	%rdx, %r8
140289965:     	addq	$0x10, %r8
140289969:     	addq	$0x10, %rdx
14028996d:     	jmp	0x1402898fa <.text+0x2888fa>
14028996f:     	leaq	(%rax,%r10,8), %rax
140289973:     	movq	-0x8(%rax), %rax
140289977:     	cmpq	0x218(%r12), %rax
14028997f:     	jae	0x14028a5d2 <.text+0x2895d2>
140289985:     	movq	0x210(%r12), %rcx
14028998d:     	movq	(%rcx,%rax,8), %rcx
140289991:     	testq	%rcx, %rcx
140289994:     	je	0x14028a5d2 <.text+0x2895d2>
14028999a:     	movq	0x1e0(%r12), %rax
1402899a2:     	notq	%rcx
1402899a5:     	imulq	$0x38, %rcx, %rcx
1402899a9:     	cmpb	$0x0, 0x30(%rax,%rcx)
1402899ae:     	je	0x14028a5d2 <.text+0x2895d2>
1402899b4:     	addq	%rcx, %rax
1402899b7:     	movq	0x10(%rax), %rsi
1402899bb:     	movl	0x5b0(%r12), %ecx
1402899c3:     	movl	%ecx, 0x2c(%rax)
1402899c6:     	movq	(%rsi), %rdx
1402899c9:     	testq	%rdx, %rdx
1402899cc:     	je	0x1402899dd <.text+0x2889dd>
1402899ce:     	movq	0x8(%rsi), %rcx
1402899d2:     	movl	$0x1, %r8d
1402899d8:     	callq	0x1400021d0 <.text+0x11d0>
1402899dd:     	movq	0x18(%rsi), %rdx
1402899e1:     	testq	%rdx, %rdx
1402899e4:     	je	0x1402899f5 <.text+0x2889f5>
1402899e6:     	movq	0x20(%rsi), %rcx
1402899ea:     	movl	$0x1, %r8d
1402899f0:     	callq	0x1400021d0 <.text+0x11d0>
1402899f5:     	movdqu	0x360(%rbp), %xmm0
1402899fd:     	movdqu	0x370(%rbp), %xmm1
140289a05:     	movdqu	0x380(%rbp), %xmm2
140289a0d:     	movups	0x390(%rbp), %xmm3
140289a14:     	movups	%xmm3, 0x30(%rsi)
140289a18:     	movdqu	%xmm2, 0x20(%rsi)
140289a1d:     	movdqu	%xmm1, 0x10(%rsi)
140289a22:     	movdqu	%xmm0, (%rsi)
140289a26:     	leaq	0x56c8ef8(%rip), %rax   # 0x145952925
140289a2d:     	movq	%rax, 0x360(%rbp)
140289a34:     	movq	$0x4, 0x368(%rbp)
140289a3f:     	leaq	0xf60(%rbp), %rax
140289a46:     	movq	%rax, 0x370(%rbp)
140289a4d:     	leaq	0x56c8d3c(%rip), %rax   # 0x145952790
140289a54:     	movq	%rax, 0x378(%rbp)
140289a5b:     	movb	$0x0, 0xfc5(%rbp)
140289a62:     	movq	$0x1, 0x20(%rsp)
140289a6b:     	movl	$0x10, %r8d
140289a71:     	leaq	0xdc8(%rbp), %rcx
140289a78:     	leaq	0x56cec09(%rip), %rdx   # 0x145958688
140289a7f:     	movq	%rdi, %r9
140289a82:     	callq	0x145457c60 <.text+0x5456c60>
140289a87:     	nop
140289a88:     	movq	0xdc8(%rbp), %r15
140289a8f:     	movq	0xdd0(%rbp), %r13
140289a96:     	cmpq	$0x0, 0x90(%r12)
140289a9f:     	je	0x14028a02b <.text+0x28902b>
140289aa5:     	movq	0xdd8(%rbp), %rsi
140289aac:     	movq	0x78(%r12), %rax
140289ab1:     	movq	0x80(%r12), %rcx
140289ab9:     	xorl	%edx, %edx
140289abb:     	movabsq	$0x5824c802f396e770, %r8 # imm = 0x5824C802F396E770
140289ac5:     	andq	%rcx, %r8
140289ac8:     	movdqu	(%rax,%r8), %xmm0
140289ace:     	movdqa	%xmm0, %xmm1
140289ad2:     	pcmpeqb	%xmm6, %xmm1
140289ad6:     	pmovmskb	%xmm1, %r9d
140289adb:     	testl	%r9d, %r9d
140289ade:     	je	0x140289b18 <.text+0x288b18>
140289ae0:     	tzcntl	%r9d, %r10d
140289ae5:     	addq	%r8, %r10
140289ae8:     	andq	%rcx, %r10
140289aeb:     	negq	%r10
140289aee:     	leaq	(%r10,%r10,2), %r10
140289af2:     	movdqu	-0x18(%rax,%r10,8), %xmm1
140289af9:     	pcmpeqb	%xmm7, %xmm1
140289afd:     	pmovmskb	%xmm1, %r11d
140289b02:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140289b09:     	je	0x140289b38 <.text+0x288b38>
140289b0b:     	leal	-0x1(%r9), %r10d
140289b0f:     	andw	%r9w, %r10w
140289b13:     	movl	%r10d, %r9d
140289b16:     	jne	0x140289ae0 <.text+0x288ae0>
140289b18:     	pcmpeqb	%xmm9, %xmm0
140289b1d:     	pmovmskb	%xmm0, %r9d
140289b22:     	testl	%r9d, %r9d
140289b25:     	jne	0x14028a02b <.text+0x28902b>
140289b2b:     	addq	%rdx, %r8
140289b2e:     	addq	$0x10, %r8
140289b32:     	addq	$0x10, %rdx
140289b36:     	jmp	0x140289ac5 <.text+0x288ac5>
140289b38:     	leaq	(%rax,%r10,8), %rax
140289b3c:     	movq	-0x8(%rax), %rax
140289b40:     	cmpq	0x218(%r12), %rax
140289b48:     	jae	0x14028a02b <.text+0x28902b>
140289b4e:     	movq	0x210(%r12), %rcx
140289b56:     	movq	(%rcx,%rax,8), %rcx
140289b5a:     	testq	%rcx, %rcx
140289b5d:     	je	0x14028a02b <.text+0x28902b>
140289b63:     	movq	0x1e0(%r12), %rax
140289b6b:     	notq	%rcx
140289b6e:     	imulq	$0x38, %rcx, %rcx
140289b72:     	cmpb	$0x0, 0x30(%rax,%rcx)
140289b77:     	je	0x14028a02b <.text+0x28902b>
140289b7d:     	addq	%rcx, %rax
140289b80:     	movq	0x10(%rax), %rdi
140289b84:     	movl	0x5b0(%r12), %ecx
140289b8c:     	movl	%ecx, 0x2c(%rax)
140289b8f:     	movq	0x60(%rdi), %rdx
140289b93:     	testq	%rdx, %rdx
140289b96:     	movq	0xf48(%rbp), %rbx
140289b9d:     	je	0x140289bae <.text+0x288bae>
140289b9f:     	movq	0x68(%rdi), %rcx
140289ba3:     	movl	$0x1, %r8d
140289ba9:     	callq	0x1400021d0 <.text+0x11d0>
140289bae:     	movq	%r15, 0x60(%rdi)
140289bb2:     	movq	%r13, 0x68(%rdi)
140289bb6:     	movq	%rsi, 0x70(%rdi)
140289bba:     	movq	0xf58(%rbp), %rdx
140289bc1:     	testq	%rdx, %rdx
140289bc4:     	je	0x140289bd4 <.text+0x288bd4>
140289bc6:     	movl	$0x1, %r8d
140289bcc:     	movq	%rbx, %rcx
140289bcf:     	callq	0x1400021d0 <.text+0x11d0>
140289bd4:     	movq	0xf60(%rbp), %rdx
140289bdb:     	testq	%rdx, %rdx
140289bde:     	je	0x140288830 <.text+0x287830>
140289be4:     	movq	0xf68(%rbp), %rcx
140289beb:     	movl	$0x1, %r8d
140289bf1:     	jmp	0x140288db9 <.text+0x287db9>
140289bf6:     	movl	$0x1, %eax
140289bfb:     	movq	%rbx, 0xf08(%rbp)
140289c02:     	movq	%rax, 0xe28(%rbp)
140289c09:     	movq	%rax, 0xf10(%rbp)
140289c10:     	movq	%rbx, 0xf18(%rbp)
140289c17:     	movq	-0x40(%rbp), %rdx
140289c1b:     	testq	%rdx, %rdx
140289c1e:     	je	0x140289c2f <.text+0x288c2f>
140289c20:     	movq	-0x38(%rbp), %rcx
140289c24:     	movl	$0x1, %r8d
140289c2a:     	callq	0x1400021d0 <.text+0x11d0>
140289c2f:     	movq	0xf08(%rbp), %rbx
140289c36:     	movq	0xf10(%rbp), %r15
140289c3d:     	cmpq	$0x0, 0x90(%r12)
140289c46:     	je	0x140289d53 <.text+0x288d53>
140289c4c:     	movq	0xf18(%rbp), %rsi
140289c53:     	movq	0x78(%r12), %rax
140289c58:     	movq	0x80(%r12), %rcx
140289c60:     	xorl	%edx, %edx
140289c62:     	movabsq	$0x5824c802f396e770, %r8 # imm = 0x5824C802F396E770
140289c6c:     	andq	%rcx, %r8
140289c6f:     	movdqu	(%rax,%r8), %xmm0
140289c75:     	movdqa	%xmm0, %xmm1
140289c79:     	pcmpeqb	%xmm6, %xmm1
140289c7d:     	pmovmskb	%xmm1, %r9d
140289c82:     	testl	%r9d, %r9d
140289c85:     	je	0x140289cbf <.text+0x288cbf>
140289c87:     	tzcntl	%r9d, %r10d
140289c8c:     	addq	%r8, %r10
140289c8f:     	andq	%rcx, %r10
140289c92:     	negq	%r10
140289c95:     	leaq	(%r10,%r10,2), %r10
140289c99:     	movdqu	-0x18(%rax,%r10,8), %xmm1
140289ca0:     	pcmpeqb	%xmm7, %xmm1
140289ca4:     	pmovmskb	%xmm1, %r11d
140289ca9:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140289cb0:     	je	0x140289cdf <.text+0x288cdf>
140289cb2:     	leal	-0x1(%r9), %r10d
140289cb6:     	andw	%r9w, %r10w
140289cba:     	movl	%r10d, %r9d
140289cbd:     	jne	0x140289c87 <.text+0x288c87>
140289cbf:     	pcmpeqb	%xmm9, %xmm0
140289cc4:     	pmovmskb	%xmm0, %r9d
140289cc9:     	testl	%r9d, %r9d
140289ccc:     	jne	0x140289d53 <.text+0x288d53>
140289cd2:     	addq	%rdx, %r8
140289cd5:     	addq	$0x10, %r8
140289cd9:     	addq	$0x10, %rdx
140289cdd:     	jmp	0x140289c6c <.text+0x288c6c>
140289cdf:     	leaq	(%rax,%r10,8), %rax
140289ce3:     	movq	-0x8(%rax), %rax
140289ce7:     	cmpq	0x218(%r12), %rax
140289cef:     	jae	0x140289d53 <.text+0x288d53>
140289cf1:     	movq	0x210(%r12), %rcx
140289cf9:     	movq	(%rcx,%rax,8), %rcx
140289cfd:     	testq	%rcx, %rcx
140289d00:     	je	0x140289d53 <.text+0x288d53>
140289d02:     	movq	0x1e0(%r12), %rax
140289d0a:     	notq	%rcx
140289d0d:     	imulq	$0x38, %rcx, %rcx
140289d11:     	cmpb	$0x0, 0x30(%rax,%rcx)
140289d16:     	je	0x140289d53 <.text+0x288d53>
140289d18:     	addq	%rcx, %rax
140289d1b:     	movq	0x10(%rax), %rdi
140289d1f:     	movl	0x5b0(%r12), %ecx
140289d27:     	movl	%ecx, 0x2c(%rax)
140289d2a:     	movq	0x60(%rdi), %rdx
140289d2e:     	testq	%rdx, %rdx
140289d31:     	je	0x140289d42 <.text+0x288d42>
140289d33:     	movq	0x68(%rdi), %rcx
140289d37:     	movl	$0x1, %r8d
140289d3d:     	callq	0x1400021d0 <.text+0x11d0>
140289d42:     	movq	%rbx, 0x60(%rdi)
140289d46:     	movq	%r15, 0x68(%rdi)
140289d4a:     	movq	%rsi, 0x70(%rdi)
140289d4e:     	jmp	0x140288830 <.text+0x287830>
140289d53:     	movq	%r15, 0xf98(%rbp)
140289d5a:     	movq	%rbx, 0xfb8(%rbp)
140289d61:     	leaq	0xfc6(%rbp), %rax
140289d68:     	movq	%rax, 0x360(%rbp)
140289d6f:     	leaq	0x4d81aca(%rip), %rax   # 0x14500b840 <.text+0x500a840>
140289d76:     	movq	%rax, 0x368(%rbp)
140289d7d:     	leaq	0x56c763c(%rip), %rcx   # 0x1459513c0
140289d84:     	leaq	0x56ce8b5(%rip), %r8    # 0x145958640
140289d8b:     	leaq	0x360(%rbp), %rdx
140289d92:     	callq	0x145903d10 <.text+0x5902d10>
140289d97:     	nop
140289d98:     	jmp	0x14028a6c4 <.text+0x2896c4>
140289d9d:     	movq	0xf30(%rbp), %rax
140289da4:     	movq	%rax, %rcx
140289da7:     	jmp	0x140289db7 <.text+0x288db7>
140289da9:     	movq	0xf30(%rbp), %rax
140289db0:     	movq	0xf98(%rbp), %rcx
140289db7:     	subq	%rcx, %rax
140289dba:     	shrq	$0x3, %rax
140289dbe:     	movabsq	$0x6db6db6db6db6db7, %rdx # imm = 0x6DB6DB6DB6DB6DB7
140289dc8:     	imulq	%rax, %rdx
140289dcc:     	movq	%rdx, 0xf78(%rbp)
140289dd3:     	movq	$0x0, 0xfb8(%rbp)
140289dde:     	movq	%rcx, 0xf98(%rbp)
140289de5:     	nopw	%cs:(%rax,%rax)
140289df0:     	movq	0xfb8(%rbp), %rax
140289df7:     	cmpq	%rax, 0xf78(%rbp)
140289dfe:     	je	0x140289e19 <.text+0x288e19>
140289e00:     	incq	%rax
140289e03:     	movq	%rax, 0xfb8(%rbp)
140289e0a:     	leaq	0x38(%rcx), %rsi
140289e0e:     	callq	0x140179d00 <.text+0x178d00>
140289e13:     	nop
140289e14:     	movq	%rsi, %rcx
140289e17:     	jmp	0x140289df0 <.text+0x288df0>
140289e19:     	movq	0xf50(%rbp), %rax
140289e20:     	testq	%rax, %rax
140289e23:     	je	0x140289e3b <.text+0x288e3b>
140289e25:     	imulq	$0x38, %rax, %rdx
140289e29:     	movl	$0x8, %r8d
140289e2f:     	movq	0xf40(%rbp), %rcx
140289e36:     	callq	0x1400021d0 <.text+0x11d0>
140289e3b:     	movb	$0x1, 0xfc7(%rbp)
140289e42:     	leaq	0x360(%rbp), %rcx
140289e49:     	callq	0x140649500 <.text+0x648500>
140289e4e:     	nop
140289e4f:     	movq	0xe98(%rbp), %rcx
140289e56:     	movq	0xea0(%rbp), %rax
140289e5d:     	movq	%rax, 0xf98(%rbp)
140289e64:     	movq	$0x0, 0xfb8(%rbp)
140289e6f:     	movq	%rcx, 0xf78(%rbp)
140289e76:     	nopw	%cs:(%rax,%rax)
140289e80:     	movq	0xfb8(%rbp), %rax
140289e87:     	cmpq	%rax, 0xf98(%rbp)
140289e8e:     	je	0x140289ea9 <.text+0x288ea9>
140289e90:     	incq	%rax
140289e93:     	movq	%rax, 0xfb8(%rbp)
140289e9a:     	leaq	0x68(%rcx), %rsi
140289e9e:     	callq	0x140198a70 <.text+0x197a70>
140289ea3:     	nop
140289ea4:     	movq	%rsi, %rcx
140289ea7:     	jmp	0x140289e80 <.text+0x288e80>
140289ea9:     	movq	0xe90(%rbp), %rax
140289eb0:     	testq	%rax, %rax
140289eb3:     	je	0x140289ecb <.text+0x288ecb>
140289eb5:     	movq	0xe98(%rbp), %rcx
140289ebc:     	imulq	$0x68, %rax, %rdx
140289ec0:     	movl	$0x8, %r8d
140289ec6:     	callq	0x1400021d0 <.text+0x11d0>
140289ecb:     	movq	0x370(%rbp), %rax
140289ed2:     	leaq	0xe90(%rbp), %rcx
140289ed9:     	movq	%rax, 0x10(%rcx)
140289edd:     	movdqu	0x360(%rbp), %xmm0
140289ee5:     	movdqu	%xmm0, (%rcx)
140289ee9:     	movb	$0x1, 0xfc7(%rbp)
140289ef0:     	leaq	0x190(%rbp), %rcx
140289ef7:     	callq	0x14543a9c0 <.text+0x54399c0>
140289efc:     	nop
140289efd:     	movq	0x190(%rbp), %rax
140289f04:     	cmpq	$-0x1, %rax
140289f08:     	je	0x140289fc2 <.text+0x288fc2>
140289f0e:     	movq	%rax, 0xfb8(%rbp)
140289f15:     	movq	0x198(%rbp), %rdx
140289f1c:     	movq	0x1a0(%rbp), %r8
140289f23:     	leaq	0x360(%rbp), %rcx
140289f2a:     	movq	%rdx, 0xf98(%rbp)
140289f31:     	callq	0x145712640 <.text+0x5711640>
140289f36:     	nop
140289f37:     	movq	0x360(%rbp), %rdi
140289f3e:     	movq	0x368(%rbp), %rsi
140289f45:     	cmpq	$0x2, %rdi
140289f49:     	je	0x140289f64 <.text+0x288f64>
140289f4b:     	leaq	0x370(%rbp), %rdx
140289f52:     	leaq	0xa90(%rbp), %rcx
140289f59:     	movl	$0x260, %r8d            # imm = 0x260
140289f5f:     	callq	0x1457731ed <.text+0x57721ed>
140289f64:     	movq	0xfb8(%rbp), %rdx
140289f6b:     	testq	%rdx, %rdx
140289f6e:     	je	0x140289f82 <.text+0x288f82>
140289f70:     	movl	$0x1, %r8d
140289f76:     	movq	0xf98(%rbp), %rcx
140289f7d:     	callq	0x1400021d0 <.text+0x11d0>
140289f82:     	cmpl	$0x2, %edi
140289f85:     	jne	0x14028a090 <.text+0x289090>
140289f8b:     	movl	%esi, %eax
140289f8d:     	andl	$0x3, %eax
140289f90:     	leal	-0x2(%rax), %ecx
140289f93:     	cmpl	$0x2, %ecx
140289f96:     	jb	0x140289fc2 <.text+0x288fc2>
140289f98:     	testq	%rax, %rax
140289f9b:     	je	0x140289fc2 <.text+0x288fc2>
140289f9d:     	decq	%rsi
140289fa0:     	leaq	0x368(%rbp), %rcx
140289fa7:     	movq	%rsi, 0x368(%rbp)
140289fae:     	movb	$0x3, 0x360(%rbp)
140289fb5:     	movb	$0x1, 0xfc7(%rbp)
140289fbc:     	callq	0x14573b330 <.text+0x573a330>
140289fc1:     	nop
140289fc2:     	movq	$0x0, 0x190(%rbp)
140289fcd:     	movq	$0x8, 0x198(%rbp)
140289fd8:     	movq	$0x0, 0x1a0(%rbp)
140289fe3:     	jmp	0x14028a15b <.text+0x28915b>
140289fe8:     	leaq	0xfc6(%rbp), %rax
140289fef:     	movq	%rax, 0x360(%rbp)
140289ff6:     	leaq	0x4d81843(%rip), %rax   # 0x14500b840 <.text+0x500a840>
140289ffd:     	movq	%rax, 0x368(%rbp)
14028a004:     	movb	$0x1, 0xfc5(%rbp)
14028a00b:     	leaq	0x56c73ae(%rip), %rcx   # 0x1459513c0
14028a012:     	leaq	0x56ce63f(%rip), %r8    # 0x145958658
14028a019:     	leaq	0x360(%rbp), %rdx
14028a020:     	callq	0x145903d10 <.text+0x5902d10>
14028a025:     	nop
14028a026:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a02b:     	movq	%r13, 0xf98(%rbp)
14028a032:     	movq	%r15, 0xfb8(%rbp)
14028a039:     	leaq	0xfc6(%rbp), %rax
14028a040:     	movq	%rax, 0x360(%rbp)
14028a047:     	leaq	0x4d817f2(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14028a04e:     	movq	%rax, 0x368(%rbp)
14028a055:     	leaq	0x56c7364(%rip), %rcx   # 0x1459513c0
14028a05c:     	leaq	0x56ce635(%rip), %r8    # 0x145958698
14028a063:     	leaq	0x360(%rbp), %rdx
14028a06a:     	callq	0x145903d10 <.text+0x5902d10>
14028a06f:     	nop
14028a070:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a075:     	xorl	%ecx, %ecx
14028a077:     	movb	$0x1, 0xfb7(%rbp)
14028a07e:     	movq	0xe28(%rbp), %rdx
14028a085:     	callq	0x14590379b <.text+0x590279b>
14028a08a:     	nop
14028a08b:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a090:     	movq	%rsi, 0x828(%rbp)
14028a097:     	leaq	0x830(%rbp), %rcx
14028a09e:     	leaq	0xa90(%rbp), %rdx
14028a0a5:     	movl	$0x260, %r8d            # imm = 0x260
14028a0ab:     	callq	0x1457731ed <.text+0x57721ed>
14028a0b0:     	movq	$0x0, 0x360(%rbp)
14028a0bb:     	movq	$0x0, 0x5c0(%rbp)
14028a0c6:     	movq	%rdi, 0x820(%rbp)
14028a0cd:     	movb	$0x1, 0xfc7(%rbp)
14028a0d4:     	leaq	0xa90(%rbp), %rcx
14028a0db:     	leaq	0x360(%rbp), %rdx
14028a0e2:     	callq	0x1401abbc0 <.text+0x1aabc0>
14028a0e7:     	nop
14028a0e8:     	movq	0xa98(%rbp), %rdi
14028a0ef:     	movq	0xaa0(%rbp), %rbx
14028a0f6:     	leaq	0xfc6(%rbp), %rax
14028a0fd:     	movq	%rax, 0x360(%rbp)
14028a104:     	cmpq	$0x2, %rbx
14028a108:     	jae	0x14028a669 <.text+0x289669>
14028a10e:     	movq	0xa90(%rbp), %rax
14028a115:     	leaq	(%rbx,%rbx,8), %rcx
14028a119:     	leaq	(%rdi,%rcx,8), %rcx
14028a11d:     	movq	%rdi, 0x360(%rbp)
14028a124:     	movq	%rdi, 0x368(%rbp)
14028a12b:     	movq	%rax, 0x370(%rbp)
14028a132:     	movq	%rcx, 0x378(%rbp)
14028a139:     	movb	$0x0, 0xfa7(%rbp)
14028a140:     	leaq	0x190(%rbp), %rcx
14028a147:     	leaq	0x360(%rbp), %rdx
14028a14e:     	callq	0x14017a6c0 <.text+0x1796c0>
14028a153:     	nop
14028a154:     	leaq	0x56caabd(%rip), %r14   # 0x145954c18
14028a15b:     	movq	0xeb8(%rbp), %rsi
14028a162:     	testq	%rsi, %rsi
14028a165:     	je	0x14028a1ba <.text+0x2891ba>
14028a167:     	movq	0xeb0(%rbp), %rdi
14028a16e:     	addq	$0x20, %rdi
14028a172:     	jmp	0x14028a189 <.text+0x289189>
14028a174:     	nopw	%cs:(%rax,%rax)
14028a180:     	addq	$0x38, %rdi
14028a184:     	decq	%rsi
14028a187:     	je	0x14028a1ba <.text+0x2891ba>
14028a189:     	movq	-0x20(%rdi), %rdx
14028a18d:     	testq	%rdx, %rdx
14028a190:     	je	0x14028a1a1 <.text+0x2891a1>
14028a192:     	movq	-0x18(%rdi), %rcx
14028a196:     	movl	$0x1, %r8d
14028a19c:     	callq	0x1400021d0 <.text+0x11d0>
14028a1a1:     	movq	-0x8(%rdi), %rdx
14028a1a5:     	testq	%rdx, %rdx
14028a1a8:     	je	0x14028a180 <.text+0x289180>
14028a1aa:     	movq	(%rdi), %rcx
14028a1ad:     	movl	$0x1, %r8d
14028a1b3:     	callq	0x1400021d0 <.text+0x11d0>
14028a1b8:     	jmp	0x14028a180 <.text+0x289180>
14028a1ba:     	leaq	0xea8(%rbp), %rsi
14028a1c1:     	movq	0xea8(%rbp), %rax
14028a1c8:     	testq	%rax, %rax
14028a1cb:     	je	0x14028a1e3 <.text+0x2891e3>
14028a1cd:     	movq	0xeb0(%rbp), %rcx
14028a1d4:     	imulq	$0x38, %rax, %rdx
14028a1d8:     	movl	$0x8, %r8d
14028a1de:     	callq	0x1400021d0 <.text+0x11d0>
14028a1e3:     	movq	0x1a0(%rbp), %rax
14028a1ea:     	movq	%rax, 0x10(%rsi)
14028a1ee:     	movdqu	0x190(%rbp), %xmm0
14028a1f6:     	movdqu	%xmm0, (%rsi)
14028a1fa:     	movq	0xed0(%rbp), %rsi
14028a201:     	testq	%rsi, %rsi
14028a204:     	je	0x14028a25a <.text+0x28925a>
14028a206:     	movq	0xec8(%rbp), %rdi
14028a20d:     	addq	$0x20, %rdi
14028a211:     	jmp	0x14028a229 <.text+0x289229>
14028a213:     	nopw	%cs:(%rax,%rax)
14028a220:     	addq	$0x30, %rdi
14028a224:     	decq	%rsi
14028a227:     	je	0x14028a25a <.text+0x28925a>
14028a229:     	movq	-0x20(%rdi), %rdx
14028a22d:     	testq	%rdx, %rdx
14028a230:     	je	0x14028a241 <.text+0x289241>
14028a232:     	movq	-0x18(%rdi), %rcx
14028a236:     	movl	$0x1, %r8d
14028a23c:     	callq	0x1400021d0 <.text+0x11d0>
14028a241:     	movq	-0x8(%rdi), %rdx
14028a245:     	testq	%rdx, %rdx
14028a248:     	je	0x14028a220 <.text+0x289220>
14028a24a:     	movq	(%rdi), %rcx
14028a24d:     	movl	$0x1, %r8d
14028a253:     	callq	0x1400021d0 <.text+0x11d0>
14028a258:     	jmp	0x14028a220 <.text+0x289220>
14028a25a:     	movq	0xec0(%rbp), %rax
14028a261:     	testq	%rax, %rax
14028a264:     	je	0x14028a280 <.text+0x289280>
14028a266:     	movq	0xec8(%rbp), %rcx
14028a26d:     	shlq	$0x4, %rax
14028a271:     	leaq	(%rax,%rax,2), %rdx
14028a275:     	movl	$0x8, %r8d
14028a27b:     	callq	0x1400021d0 <.text+0x11d0>
14028a280:     	movq	$0x0, 0xec0(%rbp)
14028a28b:     	movq	$0x8, 0xec8(%rbp)
14028a296:     	movq	$0x0, 0xed0(%rbp)
14028a2a1:     	movq	%r14, 0x360(%rbp)
14028a2a8:     	leaq	0x56ce269(%rip), %rax   # 0x145958518
14028a2af:     	movq	%rax, 0x368(%rbp)
14028a2b6:     	movq	%r12, 0x370(%rbp)
14028a2bd:     	movb	$0x1, 0xfc7(%rbp)
14028a2c4:     	leaq	0xa90(%rbp), %rcx
14028a2cb:     	leaq	0x360(%rbp), %rdx
14028a2d2:     	callq	0x1401af6f0 <.text+0x1ae6f0>
14028a2d7:     	nop
14028a2d8:     	movq	0xe40(%rbp), %rsi
14028a2df:     	testq	%rsi, %rsi
14028a2e2:     	je	0x14028a322 <.text+0x289322>
14028a2e4:     	movq	0xe38(%rbp), %rdi
14028a2eb:     	addq	$0x8, %rdi
14028a2ef:     	jmp	0x14028a309 <.text+0x289309>
14028a2f1:     	nopw	%cs:(%rax,%rax)
14028a300:     	addq	$0x18, %rdi
14028a304:     	decq	%rsi
14028a307:     	je	0x14028a322 <.text+0x289322>
14028a309:     	movq	-0x8(%rdi), %rdx
14028a30d:     	testq	%rdx, %rdx
14028a310:     	je	0x14028a300 <.text+0x289300>
14028a312:     	movq	(%rdi), %rcx
14028a315:     	movl	$0x1, %r8d
14028a31b:     	callq	0x1400021d0 <.text+0x11d0>
14028a320:     	jmp	0x14028a300 <.text+0x289300>
14028a322:     	movq	0xe30(%rbp), %rax
14028a329:     	testq	%rax, %rax
14028a32c:     	je	0x14028a348 <.text+0x289348>
14028a32e:     	movq	0xe38(%rbp), %rcx
14028a335:     	shlq	$0x3, %rax
14028a339:     	leaq	(%rax,%rax,2), %rdx
14028a33d:     	movl	$0x8, %r8d
14028a343:     	callq	0x1400021d0 <.text+0x11d0>
14028a348:     	movq	0xaa0(%rbp), %rax
14028a34f:     	movq	%rax, 0xe40(%rbp)
14028a356:     	movdqu	0xa90(%rbp), %xmm0
14028a35e:     	movdqa	%xmm0, 0xe30(%rbp)
14028a366:     	movq	0xe80(%rbp), %rax
14028a36d:     	movq	0xe88(%rbp), %rcx
14028a374:     	leaq	(%rcx,%rcx,2), %rcx
14028a378:     	shlq	$0x4, %rcx
14028a37c:     	addq	%rax, %rcx
14028a37f:     	movq	%rax, 0xa90(%rbp)
14028a386:     	movq	%rcx, 0xa98(%rbp)
14028a38d:     	movq	%r12, 0xaa0(%rbp)
14028a394:     	movb	$0x1, 0xfc7(%rbp)
14028a39b:     	leaq	0x360(%rbp), %rcx
14028a3a2:     	leaq	0xa90(%rbp), %rdx
14028a3a9:     	callq	0x14017fcf0 <.text+0x17ecf0>
14028a3ae:     	nop
14028a3af:     	leaq	0xed8(%rbp), %rcx
14028a3b6:     	callq	0x14002a540 <.text+0x29540>
14028a3bb:     	nop
14028a3bc:     	movdqu	0x360(%rbp), %xmm0
14028a3c4:     	movdqu	0x370(%rbp), %xmm1
14028a3cc:     	movdqu	0x380(%rbp), %xmm2
14028a3d4:     	leaq	0xed8(%rbp), %rax
14028a3db:     	movdqu	%xmm2, 0x20(%rax)
14028a3e0:     	movdqu	%xmm1, 0x10(%rax)
14028a3e5:     	movdqu	%xmm0, (%rax)
14028a3e9:     	cmpq	$0x0, 0x90(%r12)
14028a3f2:     	je	0x14028a58f <.text+0x28958f>
14028a3f8:     	movq	0x78(%r12), %rax
14028a3fd:     	movq	0x80(%r12), %rcx
14028a405:     	movabsq	$0x5824c802f396e770, %rdx # imm = 0x5824C802F396E770
14028a40f:     	xorl	%r8d, %r8d
14028a412:     	pcmpeqd	%xmm0, %xmm0
14028a416:     	andq	%rcx, %rdx
14028a419:     	movdqu	(%rax,%rdx), %xmm1
14028a41e:     	movdqa	%xmm1, %xmm2
14028a422:     	pcmpeqb	%xmm6, %xmm2
14028a426:     	pmovmskb	%xmm2, %r9d
14028a42b:     	testl	%r9d, %r9d
14028a42e:     	je	0x14028a468 <.text+0x289468>
14028a430:     	tzcntl	%r9d, %r10d
14028a435:     	addq	%rdx, %r10
14028a438:     	andq	%rcx, %r10
14028a43b:     	negq	%r10
14028a43e:     	leaq	(%r10,%r10,2), %r10
14028a442:     	movdqu	-0x18(%rax,%r10,8), %xmm2
14028a449:     	pcmpeqb	%xmm7, %xmm2
14028a44d:     	pmovmskb	%xmm2, %r11d
14028a452:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14028a459:     	je	0x14028a487 <.text+0x289487>
14028a45b:     	leal	-0x1(%r9), %r10d
14028a45f:     	andw	%r9w, %r10w
14028a463:     	movl	%r10d, %r9d
14028a466:     	jne	0x14028a430 <.text+0x289430>
14028a468:     	pcmpeqb	%xmm0, %xmm1
14028a46c:     	pmovmskb	%xmm1, %r9d
14028a471:     	testl	%r9d, %r9d
14028a474:     	jne	0x14028a58f <.text+0x28958f>
14028a47a:     	addq	%r8, %rdx
14028a47d:     	addq	$0x10, %rdx
14028a481:     	addq	$0x10, %r8
14028a485:     	jmp	0x14028a416 <.text+0x289416>
14028a487:     	leaq	(%rax,%r10,8), %rax
14028a48b:     	movq	-0x8(%rax), %rax
14028a48f:     	cmpq	0x218(%r12), %rax
14028a497:     	jae	0x14028a58f <.text+0x28958f>
14028a49d:     	movq	0x210(%r12), %rcx
14028a4a5:     	movq	(%rcx,%rax,8), %rax
14028a4a9:     	testq	%rax, %rax
14028a4ac:     	je	0x14028a58f <.text+0x28958f>
14028a4b2:     	movq	0x1e0(%r12), %rsi
14028a4ba:     	notq	%rax
14028a4bd:     	imulq	$0x38, %rax, %rax
14028a4c1:     	cmpb	$0x0, 0x30(%rsi,%rax)
14028a4c6:     	je	0x14028a58f <.text+0x28958f>
14028a4cc:     	addq	%rax, %rsi
14028a4cf:     	movq	0x10(%rsi), %rdi
14028a4d3:     	movl	0x5b0(%r12), %ebx
14028a4db:     	leaq	0x360(%rbp), %rcx
14028a4e2:     	leaq	0xe30(%rbp), %rdx
14028a4e9:     	movl	$0xd8, %r8d
14028a4ef:     	callq	0x1457731ed <.text+0x57721ed>
14028a4f4:     	movl	%ebx, 0x2c(%rsi)
14028a4f7:     	leaq	0x98(%rdi), %rcx
14028a4fe:     	movq	%rcx, 0xfb8(%rbp)
14028a505:     	callq	0x1402682d0 <.text+0x2672d0>
14028a50a:     	nop
14028a50b:     	leaq	0x360(%rbp), %rdx
14028a512:     	movl	$0xd8, %r8d
14028a518:     	leaq	0x98(%rdi), %rcx
14028a51f:     	callq	0x1457731ed <.text+0x57721ed>
14028a524:     	movl	%ebx, 0x2c(%rsi)
14028a527:     	incl	0x1a0(%rdi)
14028a52d:     	movaps	0xfd0(%rbp), %xmm6
14028a534:     	movaps	0xfe0(%rbp), %xmm7
14028a53b:     	movaps	0xff0(%rbp), %xmm8
14028a543:     	movaps	0x1000(%rbp), %xmm9
14028a54b:     	movaps	0x1010(%rbp), %xmm10
14028a553:     	movaps	0x1020(%rbp), %xmm11
14028a55b:     	movaps	0x1030(%rbp), %xmm12
14028a563:     	movaps	0x1040(%rbp), %xmm13
14028a56b:     	movaps	0x1050(%rbp), %xmm14
14028a573:     	movaps	0x1060(%rbp), %xmm15
14028a57b:     	addq	$0x10f8, %rsp           # imm = 0x10F8
14028a582:     	popq	%rbx
14028a583:     	popq	%rdi
14028a584:     	popq	%rsi
14028a585:     	popq	%r12
14028a587:     	popq	%r13
14028a589:     	popq	%r14
14028a58b:     	popq	%r15
14028a58d:     	popq	%rbp
14028a58e:     	retq
14028a58f:     	leaq	0xfc6(%rbp), %rax
14028a596:     	movq	%rax, 0x360(%rbp)
14028a59d:     	leaq	0x4d8129c(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14028a5a4:     	movq	%rax, 0x368(%rbp)
14028a5ab:     	movb	$0x1, 0xfc7(%rbp)
14028a5b2:     	leaq	0x56c6e07(%rip), %rcx   # 0x1459513c0
14028a5b9:     	leaq	0x56ce068(%rip), %r8    # 0x145958628
14028a5c0:     	leaq	0x360(%rbp), %rdx
14028a5c7:     	callq	0x145903d10 <.text+0x5902d10>
14028a5cc:     	nop
14028a5cd:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a5d2:     	leaq	0xfc6(%rbp), %rax
14028a5d9:     	movq	%rax, 0xa90(%rbp)
14028a5e0:     	leaq	0x4d81259(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14028a5e7:     	movq	%rax, 0xa98(%rbp)
14028a5ee:     	leaq	0x56c6dcb(%rip), %rcx   # 0x1459513c0
14028a5f5:     	leaq	0x56ce074(%rip), %r8    # 0x145958670
14028a5fc:     	leaq	0xa90(%rbp), %rdx
14028a603:     	callq	0x145903d10 <.text+0x5902d10>
14028a608:     	nop
14028a609:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a60e:     	movq	0x370(%rbp), %rdx
14028a615:     	movq	%rdi, %rcx
14028a618:     	callq	0x14590379b <.text+0x590279b>
14028a61d:     	nop
14028a61e:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a623:     	movb	$0x0, 0xfc4(%rbp)
14028a62a:     	movb	$0x1, 0xfc3(%rbp)
14028a631:     	leaq	0x56cdfd8(%rip), %rcx   # 0x145958610
14028a638:     	callq	0x145903a90 <.text+0x5902a90>
14028a63d:     	nop
14028a63e:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a643:     	callq	0x145712ca0 <.text+0x5711ca0>
14028a648:     	movq	%rdx, 0xfb8(%rbp)
14028a64f:     	movq	%rax, %rcx
14028a652:     	movq	%rax, (%rbx)
14028a655:     	movq	0xfb8(%rbp), %rax
14028a65c:     	movq	%rax, 0x8(%rbx)
14028a660:     	movb	$0x1, 0x10(%rbx)
14028a664:     	jmp	0x14028854e <.text+0x28754e>
14028a669:     	cmpq	$0x15, %rbx
14028a66d:     	jae	0x14028a6d7 <.text+0x2896d7>
14028a66f:     	leaq	(,%rbx,8), %rax
14028a677:     	leaq	(%rax,%rax,8), %rsi
14028a67b:     	movl	$0x48, %r14d
14028a681:     	movq	0xf90(%rbp), %r12
14028a688:     	leaq	(%rdi,%r14), %rdx
14028a68c:     	movq	%rdi, %rcx
14028a68f:     	callq	0x140230ff0 <.text+0x22fff0>
14028a694:     	addq	$0x48, %r14
14028a698:     	cmpq	%r14, %rsi
14028a69b:     	jne	0x14028a688 <.text+0x289688>
14028a69d:     	jmp	0x14028a10e <.text+0x28910e>
14028a6a2:     	movl	$0x1, %ecx
14028a6a7:     	movl	$0x1, %edx
14028a6ac:     	callq	0x14590379b <.text+0x590279b>
14028a6b1:     	nop
14028a6b2:     	jmp	0x14028a6c4 <.text+0x2896c4>
14028a6b4:     	movl	$0x8, %ecx
14028a6b9:     	movl	$0x900, %edx            # imm = 0x900
14028a6be:     	callq	0x14590379b <.text+0x590279b>
14028a6c3:     	nop
14028a6c4:     	ud2
14028a6c6:     	movq	%rbx, 0xe28(%rbp)
14028a6cd:     	movl	$0x1, %ecx
14028a6d2:     	jmp	0x14028a077 <.text+0x289077>
14028a6d7:     	movb	$0x1, 0xfa7(%rbp)
14028a6de:     	leaq	0x360(%rbp), %r8
14028a6e5:     	movq	%rdi, %rcx
14028a6e8:     	movq	%rbx, %rdx
14028a6eb:     	callq	0x14017b800 <.text+0x17a800>
14028a6f0:     	nop
14028a6f1:     	movq	0xf90(%rbp), %r12
14028a6f8:     	jmp	0x14028a10e <.text+0x28910e>
