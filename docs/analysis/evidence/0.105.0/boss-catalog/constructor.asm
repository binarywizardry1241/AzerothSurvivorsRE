
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592ff90:     	pushq	%rbp
14592ff91:     	pushq	%r15
14592ff93:     	pushq	%r14
14592ff95:     	pushq	%r13
14592ff97:     	pushq	%r12
14592ff99:     	pushq	%rsi
14592ff9a:     	pushq	%rdi
14592ff9b:     	pushq	%rbx
14592ff9c:     	subq	$0x288, %rsp            # imm = 0x288
14592ffa3:     	leaq	0x80(%rsp), %rbp
14592ffab:     	movaps	%xmm10, 0x1f0(%rbp)
14592ffb3:     	movaps	%xmm9, 0x1e0(%rbp)
14592ffbb:     	movaps	%xmm8, 0x1d0(%rbp)
14592ffc3:     	movdqa	%xmm7, 0x1c0(%rbp)
14592ffcb:     	movaps	%xmm6, 0x1b0(%rbp)
14592ffd2:     	movq	$-0x2, 0x1a8(%rbp)
14592ffdd:     	movq	%rdx, %r13
14592ffe0:     	movq	%rcx, %rsi
14592ffe3:     	movq	0x290(%rcx), %rcx
14592ffea:     	movq	0x298(%rsi), %rdx
14592fff1:     	callq	0x1458753b0 <.text+0x58743b0>
14592fff6:     	movq	%rax, %rbx
14592fff9:     	imulq	$0xf0, %rax, %rax
145930000:     	leaq	0x1279449(%rip), %rdi   # 0x146ba9450
145930007:     	movl	0x4d0(%rsi), %ecx
14593000d:     	movl	%ecx, 0x130(%rbp)
145930013:     	movq	0x4c8(%rsi), %rcx
14593001a:     	movq	%rcx, 0x128(%rbp)
145930021:     	leaq	0x128(%rbp), %rcx
145930028:     	movq	%rcx, 0x148(%rbp)
14593002f:     	movq	0x68(%rax,%rdi), %r14
145930034:     	movq	0x70(%rax,%rdi), %r12
145930039:     	leaq	(%r14,%r12,8), %rax
14593003d:     	movq	%r14, -0x38(%rbp)
145930041:     	movq	%rax, -0x30(%rbp)
145930045:     	leaq	0x148(%rbp), %rax
14593004c:     	movq	%rax, -0x28(%rbp)
145930050:     	leaq	0x160(%rbp), %rcx
145930057:     	leaq	-0x38(%rbp), %rdx
14593005b:     	callq	0x14599ca00 <.text+0x599ba00>
145930060:     	movq	0x170(%rbp), %r9
145930067:     	testq	%r9, %r9
14593006a:     	je	0x145930321 <.text+0x592f321>
145930070:     	bsrq	%r9, %rcx
145930074:     	notl	%ecx
145930076:     	movq	%r9, %r8
145930079:     	shlq	%cl, %r8
14593007c:     	decq	%r8
14593007f:     	movq	0x958(%rsi), %r11
145930086:     	movq	0x960(%rsi), %rcx
14593008d:     	movq	0x970(%rsi), %rbx
145930094:     	movq	0x968(%rsi), %r10
14593009b:     	nopl	(%rax,%rax)
1459300a0:     	leaq	(%r11,%rbx), %rax
1459300a4:     	rolq	$0x17, %rax
1459300a8:     	addq	%r11, %rax
1459300ab:     	movq	%rcx, %r14
1459300ae:     	shlq	$0x11, %r14
1459300b2:     	xorq	%r11, %r10
1459300b5:     	xorq	%rcx, %rbx
1459300b8:     	xorq	%rbx, %r11
1459300bb:     	rolq	$0x2d, %rbx
1459300bf:     	xorq	%r10, %rcx
1459300c2:     	mulq	%r9
1459300c5:     	xorq	%r14, %r10
1459300c8:     	cmpq	%rax, %r8
1459300cb:     	jb	0x1459300a0 <.text+0x592f0a0>
1459300cd:     	movq	%r11, 0x958(%rsi)
1459300d4:     	movq	%rbx, 0x970(%rsi)
1459300db:     	movq	%rcx, 0x960(%rsi)
1459300e2:     	movq	%r10, 0x968(%rsi)
1459300e9:     	cmpq	%rdx, %r9
1459300ec:     	jbe	0x145930dce <.text+0x592fdce>
1459300f2:     	movq	0x168(%rbp), %rax
1459300f9:     	movq	(%rax,%rdx,8), %r14
1459300fd:     	movsd	(%r14), %xmm6
145930102:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
145930107:     	movq	0x950(%rsi), %rbx
14593010e:     	leaq	0x10(%rbx), %rcx
145930112:     	movaps	%xmm6, %xmm1
145930115:     	movaps	%xmm8, %xmm2
145930119:     	callq	0x1458c7b60 <.text+0x58c6b60>
14593011e:     	nop
14593011f:     	testb	$0x1, %al
145930121:     	je	0x1459302dd <.text+0x592f2dd>
145930127:     	movdqa	%xmm0, %xmm7
14593012b:     	movq	0x160(%rbp), %rdx
145930132:     	testq	%rdx, %rdx
145930135:     	je	0x14593014d <.text+0x592f14d>
145930137:     	movq	0x168(%rbp), %rcx
14593013e:     	shlq	$0x3, %rdx
145930142:     	movl	$0x8, %r8d
145930148:     	callq	0x1400021d0 <.text+0x11d0>
14593014d:     	movlps	%xmm6, 0x150(%rbp)
145930154:     	movd	%xmm7, 0x158(%rbp)
14593015c:     	movq	0x290(%rsi), %rcx
145930163:     	movq	0x298(%rsi), %rdx
14593016a:     	callq	0x1458753b0 <.text+0x58743b0>
14593016f:     	imulq	$0xf0, %rax, %rax
145930176:     	addq	%rax, %rdi
145930179:     	xorps	%xmm6, %xmm6
14593017c:     	cmpl	$0x1, 0x928(%rsi)
145930183:     	jne	0x1459301ae <.text+0x592f1ae>
145930185:     	cmpb	$0x0, 0xa64(%rsi)
14593018c:     	je	0x1459301ae <.text+0x592f1ae>
14593018e:     	movss	0x9ec(%rsi), %xmm6
145930196:     	subss	0x92c(%rsi), %xmm6
14593019e:     	divss	0x48f3da(%rip), %xmm6   # 0x145dbf580
1459301a6:     	pxor	%xmm0, %xmm0
1459301aa:     	maxss	%xmm0, %xmm6
1459301ae:     	movzwl	0x2b2(%rsi), %ebx
1459301b5:     	movd	0x2b4(%rsi), %xmm8
1459301be:     	movss	0x44(%r13), %xmm7
1459301c4:     	mulss	0x1548444(%rip), %xmm7  # 0x146e78610
1459301cc:     	movss	0xe0(%rdi), %xmm10
1459301d5:     	mulss	%xmm10, %xmm7
1459301da:     	mulss	0xa54(%rsi), %xmm7
1459301e2:     	movss	0x154842a(%rip), %xmm0  # 0x146e78614
1459301ea:     	movaps	%xmm6, %xmm1
1459301ed:     	callq	0x145bc9805 <.text+0x5bc8805>
1459301f2:     	mulss	%xmm7, %xmm0
1459301f6:     	xorps	%xmm7, %xmm7
1459301f9:     	cvtsi2ss	%ebx, %xmm7
1459301fd:     	divss	0x43d29b(%rip), %xmm7   # 0x145d6d4a0
145930205:     	mulss	%xmm0, %xmm7
145930209:     	movl	0x30(%r13), %r8d
14593020d:     	movl	0xa0c(%rsi), %eax
145930213:     	incl	%eax
145930215:     	movl	%eax, 0xa0c(%rsi)
14593021b:     	movl	%r8d, %ecx
14593021e:     	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
145930224:     	shlq	$0x18, %rcx
145930228:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
14593022d:     	orq	%rcx, %rax
145930230:     	movabsq	$-0xed0000000000000, %rbx # imm = 0xF130000000000000
14593023a:     	orq	%rax, %rbx
14593023d:     	movl	0x34(%r13), %r9d
145930241:     	movss	0x38(%r13), %xmm9
145930247:     	leaq	0x150(%rbp), %rax
14593024e:     	movq	%rax, 0x38(%rsp)
145930253:     	movss	%xmm7, 0x28(%rsp)
145930259:     	movss	%xmm9, 0x20(%rsp)
145930260:     	movb	$0x1, 0x30(%rsp)
145930265:     	movq	%rsi, %rcx
145930268:     	movq	%rbx, %rdx
14593026b:     	callq	0x1459317c0 <.text+0x59307c0>
145930270:     	movq	0x18(%r13), %rdi
145930274:     	testq	%rdi, %rdi
145930277:     	je	0x1459303c8 <.text+0x592f3c8>
14593027d:     	movq	0x10(%r13), %r15
145930281:     	leaq	(,%rdi,4), %r14
145930289:     	callq	0x140002200 <.text+0x1200>
14593028e:     	movl	$0x4, %edx
145930293:     	movq	%r14, %rcx
145930296:     	callq	0x1400021c0 <.text+0x11c0>
14593029b:     	testq	%rax, %rax
14593029e:     	je	0x145930de3 <.text+0x592fde3>
1459302a4:     	cmpq	$0xc, %rdi
1459302a8:     	jbe	0x1459302d6 <.text+0x592f2d6>
1459302aa:     	leaq	(%rax,%rdi,4), %rcx
1459302ae:     	leaq	0x18(%r15), %rdx
1459302b2:     	leaq	(%rdi,%rdi,8), %r8
1459302b6:     	leaq	(%r8,%r8,2), %r8
1459302ba:     	addq	%r15, %r8
1459302bd:     	addq	%rdi, %r8
1459302c0:     	cmpq	%r8, %rax
1459302c3:     	setb	%r8b
1459302c7:     	cmpq	%rcx, %rdx
1459302ca:     	setb	%cl
1459302cd:     	testb	%cl, %r8b
1459302d0:     	je	0x1459303ef <.text+0x592f3ef>
1459302d6:     	xorl	%ecx, %ecx
1459302d8:     	jmp	0x145930483 <.text+0x592f483>
1459302dd:     	cmpq	$-0x1, 0x68(%rbx)
1459302e2:     	je	0x1459303d2 <.text+0x592f3d2>
1459302e8:     	leaq	0x68(%rbx), %rdx
1459302ec:     	leaq	-0x38(%rbp), %rcx
1459302f0:     	movaps	%xmm6, %xmm2
1459302f3:     	movaps	%xmm8, %xmm3
1459302f7:     	callq	0x1458cc950 <.text+0x58cb950>
1459302fc:     	nop
1459302fd:     	cmpl	$0x1, -0x38(%rbp)
145930301:     	jne	0x1459303d2 <.text+0x592f3d2>
145930307:     	movd	-0x2c(%rbp), %xmm7
14593030c:     	movq	0x160(%rbp), %rdx
145930313:     	testq	%rdx, %rdx
145930316:     	jne	0x145930137 <.text+0x592f137>
14593031c:     	jmp	0x14593014d <.text+0x592f14d>
145930321:     	cmpl	$0xb, %ebx
145930324:     	je	0x14593032f <.text+0x592f32f>
145930326:     	cmpl	$0x7, %ebx
145930329:     	jne	0x145930d05 <.text+0x592fd05>
14593032f:     	leaq	0x8(%r14), %rbx
145930333:     	decq	%r12
145930336:     	movabsq	$0x1fffffffffffffff, %r15 # imm = 0x1FFFFFFFFFFFFFFF
145930340:     	andq	%r12, %r15
145930343:     	jmp	0x14593035d <.text+0x592f35d>
145930345:     	nopw	%cs:(%rax,%rax)
145930350:     	addq	$0x8, %rbx
145930354:     	decq	%r15
145930357:     	je	0x1459300fd <.text+0x592f0fd>
14593035d:     	movq	0x148(%rbp), %rax
145930364:     	movss	(%r14), %xmm0
145930369:     	movss	0x4(%r14), %xmm1
14593036f:     	subss	(%rax), %xmm0
145930373:     	subss	0x4(%rax), %xmm1
145930378:     	callq	0x145bc97f9 <.text+0x5bc87f9>
14593037d:     	movaps	%xmm0, %xmm6
145930380:     	movq	0x148(%rbp), %rax
145930387:     	movss	(%rbx), %xmm0
14593038b:     	movss	0x4(%rbx), %xmm1
145930390:     	subss	(%rax), %xmm0
145930394:     	subss	0x4(%rax), %xmm1
145930399:     	callq	0x145bc97f9 <.text+0x5bc87f9>
14593039e:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1459303a1:     	movaps	%xmm6, %xmm0
1459303a4:     	psrad	$0x1f, %xmm0
1459303a9:     	psrld	$0x1, %xmm0
1459303ae:     	pxor	%xmm6, %xmm0
1459303b2:     	pshufd	$0x55, %xmm0, %xmm1     # xmm1 = xmm0[1,1,1,1]
1459303b7:     	pcmpgtd	%xmm1, %xmm0
1459303bb:     	movd	%xmm0, %eax
1459303bf:     	testb	$0x1, %al
1459303c1:     	jne	0x145930350 <.text+0x592f350>
1459303c3:     	movq	%rbx, %r14
1459303c6:     	jmp	0x145930350 <.text+0x592f350>
1459303c8:     	movl	$0x4, %eax
1459303cd:     	jmp	0x145930547 <.text+0x592f547>
1459303d2:     	movd	0xb8(%rbx), %xmm7
1459303da:     	movq	0x160(%rbp), %rdx
1459303e1:     	testq	%rdx, %rdx
1459303e4:     	jne	0x145930137 <.text+0x592f137>
1459303ea:     	jmp	0x14593014d <.text+0x592f14d>
1459303ef:     	movl	%edi, %ecx
1459303f1:     	andl	$0x7, %ecx
1459303f4:     	movl	$0x8, %edx
1459303f9:     	cmovneq	%rcx, %rdx
1459303fd:     	movq	%rdi, %rcx
145930400:     	subq	%rdx, %rcx
145930403:     	leaq	0xdc(%r15), %rdx
14593040a:     	xorl	%r8d, %r8d
14593040d:     	movaps	0x154820c(%rip), %xmm0  # 0x146e78620
145930414:     	nopw	%cs:(%rax,%rax)
145930420:     	movss	-0xc4(%rdx), %xmm1
145930428:     	movss	-0xa8(%rdx), %xmm2
145930430:     	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
145930433:     	movss	-0x8c(%rdx), %xmm2
14593043b:     	movss	-0x70(%rdx), %xmm3
145930440:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
145930443:     	movlhps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0]
145930446:     	movss	(%rdx), %xmm2
14593044a:     	movss	-0x1c(%rdx), %xmm3
14593044f:     	unpcklps	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
145930452:     	movss	-0x38(%rdx), %xmm2
145930457:     	movss	-0x54(%rdx), %xmm4
14593045c:     	unpcklps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
14593045f:     	movlhps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0]
145930462:     	mulps	%xmm0, %xmm1
145930465:     	mulps	%xmm0, %xmm4
145930468:     	movups	%xmm1, (%rax,%r8,4)
14593046d:     	movups	%xmm4, 0x10(%rax,%r8,4)
145930473:     	addq	$0x8, %r8
145930477:     	addq	$0xe0, %rdx
14593047e:     	cmpq	%r8, %rcx
145930481:     	jne	0x145930420 <.text+0x592f420>
145930483:     	movl	%edi, %r10d
145930486:     	subl	%ecx, %r10d
145930489:     	movq	%rcx, %rdx
14593048c:     	andl	$0x3, %r10d
145930490:     	je	0x1459304db <.text+0x592f4db>
145930492:     	leaq	(%rcx,%rcx,8), %rdx
145930496:     	leaq	(%rdx,%rdx,2), %rdx
14593049a:     	addq	%rcx, %rdx
14593049d:     	leaq	(%r15,%rdx), %r8
1459304a1:     	addq	$0x18, %r8
1459304a5:     	leaq	(,%r10,8), %r9
1459304ad:     	subq	%r10, %r9
1459304b0:     	xorl	%r10d, %r10d
1459304b3:     	movss	0x443b4d(%rip), %xmm0   # 0x145d74008
1459304bb:     	movq	%rcx, %rdx
1459304be:     	nop
1459304c0:     	movss	(%r8,%r10,4), %xmm1
1459304c6:     	mulss	%xmm0, %xmm1
1459304ca:     	movss	%xmm1, (%rax,%rdx,4)
1459304cf:     	incq	%rdx
1459304d2:     	addq	$0x7, %r10
1459304d6:     	cmpq	%r10, %r9
1459304d9:     	jne	0x1459304c0 <.text+0x592f4c0>
1459304db:     	subq	%rdi, %rcx
1459304de:     	cmpq	$-0x4, %rcx
1459304e2:     	ja	0x145930547 <.text+0x592f547>
1459304e4:     	leaq	(%rdx,%rdx,8), %rcx
1459304e8:     	leaq	(%rcx,%rcx,2), %rcx
1459304ec:     	addq	%rdx, %rcx
1459304ef:     	addq	%r15, %rcx
1459304f2:     	addq	$0x6c, %rcx
1459304f6:     	movss	0x443b0a(%rip), %xmm0   # 0x145d74008
1459304fe:     	nop
145930500:     	movss	-0x54(%rcx), %xmm1
145930505:     	mulss	%xmm0, %xmm1
145930509:     	movss	%xmm1, (%rax,%rdx,4)
14593050e:     	movss	-0x38(%rcx), %xmm1
145930513:     	mulss	%xmm0, %xmm1
145930517:     	movss	%xmm1, 0x4(%rax,%rdx,4)
14593051d:     	movss	-0x1c(%rcx), %xmm1
145930522:     	mulss	%xmm0, %xmm1
145930526:     	movss	%xmm1, 0x8(%rax,%rdx,4)
14593052c:     	movss	(%rcx), %xmm1
145930530:     	mulss	%xmm0, %xmm1
145930534:     	movss	%xmm1, 0xc(%rax,%rdx,4)
14593053a:     	addq	$0x4, %rdx
14593053e:     	addq	$0x70, %rcx
145930542:     	cmpq	%rdx, %rdi
145930545:     	jne	0x145930500 <.text+0x592f500>
145930547:     	movq	%rdi, -0x20(%rbp)
14593054b:     	movq	%rax, -0x18(%rbp)
14593054f:     	mulss	0xa54(%rsi), %xmm10
145930558:     	movq	%rdi, -0x10(%rbp)
14593055c:     	sqrtss	%xmm10, %xmm10
145930561:     	mulss	0x48(%r13), %xmm10
145930567:     	movss	0x15480c1(%rip), %xmm0  # 0x146e78630
14593056f:     	movaps	%xmm6, %xmm1
145930572:     	callq	0x145bc9805 <.text+0x5bc8805>
145930577:     	mulss	%xmm10, %xmm0
14593057c:     	xorps	%xmm1, %xmm1
14593057f:     	punpcklwd	%xmm1, %xmm8    # xmm8 = xmm8[0],xmm1[0],xmm8[1],xmm1[1],xmm8[2],xmm1[2],xmm8[3],xmm1[3]
145930584:     	cvtdq2ps	%xmm8, %xmm5
145930588:     	movss	0x46a90c(%rip), %xmm2   # 0x145d9ae9c
145930590:     	movaps	%xmm9, %xmm6
145930594:     	mulss	%xmm2, %xmm6
145930598:     	addss	0x76d7a4(%rip), %xmm6   # 0x14609dd44
1459305a0:     	minss	0x46a8f8(%rip), %xmm6   # 0x145d9aea0
1459305a8:     	movss	0x9ec(%rsi), %xmm3
1459305b0:     	movss	0x43cdb4(%rip), %xmm4   # 0x145d6d36c
1459305b8:     	addss	%xmm3, %xmm4
1459305bc:     	addss	%xmm3, %xmm2
1459305c0:     	movss	0x4c(%r13), %xmm8
1459305c6:     	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
1459305ca:     	movups	%xmm1, 0xa8(%rbp)
1459305d1:     	movups	%xmm1, 0x98(%rbp)
1459305d8:     	movups	%xmm1, 0x88(%rbp)
1459305df:     	movups	%xmm1, 0x78(%rbp)
1459305e3:     	movq	%rbx, 0x50(%rbp)
1459305e7:     	movq	$0x0, 0x58(%rbp)
1459305ef:     	movq	%r13, -0x8(%rbp)
1459305f3:     	movb	$0x0, (%rbp)
1459305f7:     	movss	%xmm7, 0xb8(%rbp)
1459305ff:     	movss	%xmm7, 0xbc(%rbp)
145930607:     	divps	0x1184eb2(%rip), %xmm5  # 0x146ab54c0
14593060e:     	mulps	%xmm0, %xmm5
145930611:     	movlps	%xmm5, 0xc0(%rbp)
145930618:     	movl	$0x40000000, 0xc8(%rbp) # imm = 0x40000000
145930622:     	movss	%xmm6, 0xcc(%rbp)
14593062a:     	movss	%xmm9, 0xd0(%rbp)
145930633:     	movq	0x150(%rbp), %rax
14593063a:     	movq	%rax, 0xd4(%rbp)
145930641:     	movl	0x158(%rbp), %eax
145930647:     	movl	%eax, 0xdc(%rbp)
14593064d:     	movl	0x158(%rbp), %eax
145930653:     	movl	%eax, 0xe8(%rbp)
145930659:     	movq	0x150(%rbp), %rax
145930660:     	movq	%rax, 0xe0(%rbp)
145930667:     	movss	%xmm3, 0xec(%rbp)
14593066f:     	movl	$0x0, 0xf0(%rbp)
145930679:     	movss	%xmm4, 0xf4(%rbp)
145930681:     	movl	$0x40000000, 0xf8(%rbp) # imm = 0x40000000
14593068b:     	movups	%xmm1, 0x60(%rbp)
14593068f:     	movq	$0x0, 0x70(%rbp)
145930697:     	movups	%xmm1, 0xfc(%rbp)
14593069e:     	movss	%xmm2, 0x10c(%rbp)
1459306a6:     	movss	%xmm3, 0x110(%rbp)
1459306ae:     	movq	$0x0, -0x38(%rbp)
1459306b6:     	movq	$0x8, -0x30(%rbp)
1459306be:     	movq	$0x0, -0x28(%rbp)
1459306c6:     	movl	$0x0, 0x30(%rbp)
1459306cd:     	movl	$0x0, 0x38(%rbp)
1459306d4:     	movb	$0x1, 0x124(%rbp)
1459306db:     	movq	$-0x1, 0x8(%rbp)
1459306e3:     	movl	$0x0, 0x40(%rbp)
1459306ea:     	movups	%xmm1, 0x114(%rbp)
1459306f1:     	movq	0x568(%rsi), %rdi
1459306f8:     	cmpq	0x558(%rsi), %rdi
1459306ff:     	jne	0x14593070e <.text+0x592f70e>
145930701:     	leaq	0x558(%rsi), %rcx
145930708:     	callq	0x145c824e0 <.text+0x5c814e0>
14593070d:     	nop
14593070e:     	leaq	0x30(%r13), %r14
145930712:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
145930719:     	addq	0x560(%rsi), %rcx
145930720:     	leaq	-0x38(%rbp), %rdx
145930724:     	movl	$0x160, %r8d            # imm = 0x160
14593072a:     	callq	0x145bc977b <.text+0x5bc877b>
14593072f:     	incq	%rdi
145930732:     	movq	%rdi, 0x568(%rsi)
145930739:     	movq	%r14, 0x190(%rbp)
145930740:     	movq	%r14, 0x160(%rbp)
145930747:     	leaq	0x27d832(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14593074e:     	movq	%rax, 0x168(%rbp)
145930755:     	leaq	0x127060d(%rip), %rdx   # 0x146ba0d69
14593075c:     	leaq	-0x38(%rbp), %rcx
145930760:     	leaq	0x160(%rbp), %r8
145930767:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14593076c:     	movq	-0x30(%rbp), %rcx
145930770:     	movq	-0x28(%rbp), %rdx
145930774:     	movq	(%r13), %rdi
145930778:     	movq	0x8(%r13), %r14
14593077c:     	movq	%rcx, 0x188(%rbp)
145930783:     	callq	0x1458da590 <.text+0x58d9590>
145930788:     	nop
145930789:     	movq	%rax, %r15
14593078c:     	movq	%rdx, %r12
14593078f:     	movq	%rbx, 0x198(%rbp)
145930796:     	movq	-0x38(%rbp), %rdx
14593079a:     	testq	%rdx, %rdx
14593079d:     	je	0x1459307b1 <.text+0x592f7b1>
14593079f:     	movl	$0x1, %r8d
1459307a5:     	movq	0x188(%rbp), %rcx
1459307ac:     	callq	0x1400021d0 <.text+0x11d0>
1459307b1:     	testq	%r15, %r15
1459307b4:     	movq	%rdi, 0x188(%rbp)
1459307bb:     	cmoveq	%rdi, %r15
1459307bf:     	movq	%r14, 0x138(%rbp)
1459307c6:     	cmoveq	%r14, %r12
1459307ca:     	leaq	0x30(%r13), %rax
1459307ce:     	movq	%rax, 0x160(%rbp)
1459307d5:     	leaq	0x27d7a4(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1459307dc:     	movq	%rax, 0x168(%rbp)
1459307e3:     	leaq	0x127058d(%rip), %rdx   # 0x146ba0d77
1459307ea:     	leaq	-0x38(%rbp), %rcx
1459307ee:     	leaq	0x160(%rbp), %r8
1459307f5:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459307fa:     	movq	-0x30(%rbp), %rcx
1459307fe:     	movq	-0x28(%rbp), %rdx
145930802:     	movq	0x20(%r13), %rbx
145930806:     	movq	%r13, -0x40(%rbp)
14593080a:     	movq	0x28(%r13), %rdi
14593080e:     	movq	%rcx, 0x140(%rbp)
145930815:     	callq	0x1458da590 <.text+0x58d9590>
14593081a:     	nop
14593081b:     	movq	%rax, %r14
14593081e:     	movq	%rdx, %r13
145930821:     	movq	-0x38(%rbp), %rdx
145930825:     	testq	%rdx, %rdx
145930828:     	je	0x14593083c <.text+0x592f83c>
14593082a:     	movl	$0x1, %r8d
145930830:     	movq	0x140(%rbp), %rcx
145930837:     	callq	0x1400021d0 <.text+0x11d0>
14593083c:     	leaq	0x5d0(%rsi), %rax
145930843:     	testq	%r14, %r14
145930846:     	cmovneq	%r14, %rbx
14593084a:     	cmoveq	%rdi, %r13
14593084e:     	movq	%r13, 0x28(%rsp)
145930853:     	movq	%rax, %r13
145930856:     	movq	%rbx, 0x20(%rsp)
14593085b:     	leaq	-0x38(%rbp), %rcx
14593085f:     	movq	0x198(%rbp), %rdx
145930866:     	movq	%r15, %r8
145930869:     	movq	%r12, %r9
14593086c:     	callq	0x1458aae00 <.text+0x58a9e00>
145930871:     	movq	0x5e0(%rsi), %rdi
145930878:     	cmpq	0x5d0(%rsi), %rdi
14593087f:     	jne	0x14593088a <.text+0x592f88a>
145930881:     	movq	%r13, %rcx
145930884:     	callq	0x145bcb530 <.text+0x5bca530>
145930889:     	nop
14593088a:     	movq	0x5d8(%rsi), %rax
145930891:     	movq	%rdi, %rcx
145930894:     	shlq	$0x5, %rcx
145930898:     	movups	-0x38(%rbp), %xmm0
14593089c:     	movups	-0x28(%rbp), %xmm1
1459308a0:     	movups	%xmm1, 0x10(%rax,%rcx)
1459308a5:     	movups	%xmm0, (%rax,%rcx)
1459308a9:     	incq	%rdi
1459308ac:     	movq	%rdi, 0x5e0(%rsi)
1459308b3:     	movq	0x190(%rbp), %rax
1459308ba:     	movq	%rax, 0x160(%rbp)
1459308c1:     	leaq	0x27d6b8(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1459308c8:     	movq	%rax, 0x168(%rbp)
1459308cf:     	leaq	0x1270493(%rip), %rdx   # 0x146ba0d69
1459308d6:     	leaq	-0x38(%rbp), %rcx
1459308da:     	leaq	0x160(%rbp), %r8
1459308e1:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459308e6:     	movq	-0x30(%rbp), %rcx
1459308ea:     	movq	-0x28(%rbp), %rdx
1459308ee:     	movq	%rcx, 0x198(%rbp)
1459308f5:     	callq	0x1458da590 <.text+0x58d9590>
1459308fa:     	nop
1459308fb:     	movq	-0x40(%rbp), %r12
1459308ff:     	movq	0x188(%rbp), %rdi
145930906:     	movq	0x138(%rbp), %r14
14593090d:     	movq	%rax, %rbx
145930910:     	movq	%rdx, %r15
145930913:     	movq	-0x38(%rbp), %rdx
145930917:     	testq	%rdx, %rdx
14593091a:     	je	0x14593092e <.text+0x592f92e>
14593091c:     	movl	$0x1, %r8d
145930922:     	movq	0x198(%rbp), %rcx
145930929:     	callq	0x1400021d0 <.text+0x11d0>
14593092e:     	testq	%rbx, %rbx
145930931:     	cmoveq	%rdi, %rbx
145930935:     	cmoveq	%r14, %r15
145930939:     	leaq	0x1549188(%rip), %r14   # 0x146e79ac8
145930940:     	movl	$0x1a, %edi
145930945:     	movl	$0x1a, %edx
14593094a:     	movq	%r14, %rcx
14593094d:     	callq	0x1458da590 <.text+0x58d9590>
145930952:     	testq	%rax, %rax
145930955:     	cmovneq	%rax, %r14
145930959:     	cmoveq	%rdi, %rdx
14593095d:     	movq	%rdx, 0x20(%rsp)
145930962:     	leaq	-0x38(%rbp), %rcx
145930966:     	movq	%rbx, %rdx
145930969:     	movq	%r15, %r8
14593096c:     	movq	%r14, %r9
14593096f:     	callq	0x1458a9500 <.text+0x58a8500>
145930974:     	movq	0x5e0(%rsi), %rdi
14593097b:     	cmpq	0x5d0(%rsi), %rdi
145930982:     	jne	0x14593098d <.text+0x592f98d>
145930984:     	movq	%r13, %rcx
145930987:     	callq	0x145bcb530 <.text+0x5bca530>
14593098c:     	nop
14593098d:     	movq	0x5d8(%rsi), %rax
145930994:     	movq	%rdi, %rcx
145930997:     	shlq	$0x5, %rcx
14593099b:     	movups	-0x38(%rbp), %xmm0
14593099f:     	movups	-0x28(%rbp), %xmm1
1459309a3:     	movups	%xmm1, 0x10(%rax,%rcx)
1459309a8:     	movups	%xmm0, (%rax,%rcx)
1459309ac:     	incq	%rdi
1459309af:     	movq	%rdi, 0x5e0(%rsi)
1459309b6:     	callq	0x140002200 <.text+0x1200>
1459309bb:     	movl	$0x20, %ecx
1459309c0:     	movl	$0x1, %edx
1459309c5:     	callq	0x1400021c0 <.text+0x11c0>
1459309ca:     	testq	%rax, %rax
1459309cd:     	je	0x145930dac <.text+0x592fdac>
1459309d3:     	movq	%rax, 0x198(%rbp)
1459309da:     	movl	$0x1fee, (%rax)         # imm = 0x1FEE
1459309e0:     	movq	0x5e0(%rsi), %rdi
1459309e7:     	cmpq	0x5d0(%rsi), %rdi
1459309ee:     	jne	0x1459309f9 <.text+0x592f9f9>
1459309f0:     	movq	%r13, %rcx
1459309f3:     	callq	0x145bcb530 <.text+0x5bca530>
1459309f8:     	nop
1459309f9:     	movq	0x5d8(%rsi), %rax
145930a00:     	movq	%rdi, %rcx
145930a03:     	shlq	$0x5, %rcx
145930a07:     	movq	$0x20, (%rax,%rcx)
145930a0f:     	movq	0x198(%rbp), %rdx
145930a16:     	movq	%rdx, 0x8(%rax,%rcx)
145930a1b:     	movq	$0x4, 0x10(%rax,%rcx)
145930a24:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
145930a2b:     	incq	%rdi
145930a2e:     	movq	%rdi, 0x5e0(%rsi)
145930a35:     	movl	0x50(%r12), %edi
145930a3a:     	testl	%edi, %edi
145930a3c:     	je	0x145930ab9 <.text+0x592fab9>
145930a3e:     	callq	0x140002200 <.text+0x1200>
145930a43:     	movl	$0x20, %ecx
145930a48:     	movl	$0x1, %edx
145930a4d:     	callq	0x1400021c0 <.text+0x11c0>
145930a52:     	testq	%rax, %rax
145930a55:     	je	0x145930dac <.text+0x592fdac>
145930a5b:     	movq	%rax, 0x198(%rbp)
145930a62:     	movl	%edi, (%rax)
145930a64:     	movq	0x5e0(%rsi), %rdi
145930a6b:     	cmpq	0x5d0(%rsi), %rdi
145930a72:     	jne	0x145930a7d <.text+0x592fa7d>
145930a74:     	movq	%r13, %rcx
145930a77:     	callq	0x145bcb530 <.text+0x5bca530>
145930a7c:     	nop
145930a7d:     	movq	0x5d8(%rsi), %rax
145930a84:     	movq	%rdi, %rcx
145930a87:     	shlq	$0x5, %rcx
145930a8b:     	movq	$0x20, (%rax,%rcx)
145930a93:     	movq	0x198(%rbp), %rdx
145930a9a:     	movq	%rdx, 0x8(%rax,%rcx)
145930a9f:     	movq	$0x4, 0x10(%rax,%rcx)
145930aa8:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
145930aaf:     	incq	%rdi
145930ab2:     	movq	%rdi, 0x5e0(%rsi)
145930ab9:     	callq	0x140002200 <.text+0x1200>
145930abe:     	movl	$0x1, %ecx
145930ac3:     	movl	$0x1, %edx
145930ac8:     	callq	0x1400021c0 <.text+0x11c0>
145930acd:     	testq	%rax, %rax
145930ad0:     	je	0x145930dbd <.text+0x592fdbd>
145930ad6:     	movb	$0x7b, (%rax)
145930ad9:     	movq	$0x1, -0x38(%rbp)
145930ae1:     	movq	%rax, -0x30(%rbp)
145930ae5:     	movq	$0x1, -0x28(%rbp)
145930aed:     	movb	$0x1, -0x20(%rbp)
145930af1:     	leaq	0x1548016(%rip), %rax   # 0x146e78b0e
145930af8:     	movq	%rax, 0x20(%rsp)
145930afd:     	movq	$0x4, 0x28(%rsp)
145930b06:     	leaq	0x1548855(%rip), %r8    # 0x146e79362
145930b0d:     	leaq	0x160(%rbp), %rcx
145930b14:     	leaq	-0x38(%rbp), %rdx
145930b18:     	movl	$0x4, %r9d
145930b1e:     	callq	0x1458d97b0 <.text+0x58d87b0>
145930b23:     	movq	0x190(%rbp), %rax
145930b2a:     	movq	%rax, 0x128(%rbp)
145930b31:     	leaq	0x27d448(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
145930b38:     	movq	%rax, 0x130(%rbp)
145930b3f:     	movb	$0x1, 0x1a7(%rbp)
145930b46:     	leaq	0x127021c(%rip), %rdx   # 0x146ba0d69
145930b4d:     	leaq	-0x38(%rbp), %rcx
145930b51:     	leaq	0x128(%rbp), %r8
145930b58:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145930b5d:     	nop
145930b5e:     	movq	-0x30(%rbp), %rcx
145930b62:     	movq	-0x28(%rbp), %rdx
145930b66:     	movq	%rcx, 0x190(%rbp)
145930b6d:     	callq	0x1458da590 <.text+0x58d9590>
145930b72:     	nop
145930b73:     	movq	%rax, %r14
145930b76:     	movq	%rdx, %rbx
145930b79:     	movq	-0x38(%rbp), %rdx
145930b7d:     	testq	%rdx, %rdx
145930b80:     	je	0x145930b94 <.text+0x592fb94>
145930b82:     	movl	$0x1, %r8d
145930b88:     	movq	0x190(%rbp), %rcx
145930b8f:     	callq	0x1400021d0 <.text+0x11d0>
145930b94:     	testq	%r14, %r14
145930b97:     	movq	0x188(%rbp), %rax
145930b9e:     	cmovneq	%r14, %rax
145930ba2:     	cmoveq	0x138(%rbp), %rbx
145930baa:     	movb	$0x0, 0x1a7(%rbp)
145930bb1:     	movq	%rbx, 0x28(%rsp)
145930bb6:     	movq	%rax, 0x20(%rsp)
145930bbb:     	leaq	0x1548779(%rip), %r8    # 0x146e7933b
145930bc2:     	leaq	-0x38(%rbp), %rcx
145930bc6:     	leaq	0x160(%rbp), %rdx
145930bcd:     	movl	$0x4, %r9d
145930bd3:     	callq	0x1458d97b0 <.text+0x58d87b0>
145930bd8:     	nop
145930bd9:     	movb	0x54(%r12), %bl
145930bde:     	leaq	0x1547f2d(%rip), %rdx   # 0x146e78b12
145930be5:     	leaq	-0x38(%rbp), %rcx
145930be9:     	movl	$0x5, %r8d
145930bef:     	callq	0x1458d9500 <.text+0x58d8500>
145930bf4:     	nop
145930bf5:     	movzbl	%bl, %edi
145930bf8:     	xorq	$0x5, %rdi
145930bfc:     	movq	-0x38(%rbp), %rax
145930c00:     	movq	-0x28(%rbp), %rcx
145930c04:     	subq	%rcx, %rax
145930c07:     	cmpq	%rax, %rdi
145930c0a:     	ja	0x145930d53 <.text+0x592fd53>
145930c10:     	leaq	0x1292218(%rip), %rax   # 0x146bc2e2f
145930c17:     	leaq	0x129220c(%rip), %rdx   # 0x146bc2e2a
145930c1e:     	testb	%bl, %bl
145930c20:     	cmovneq	%rax, %rdx
145930c24:     	addq	-0x30(%rbp), %rcx
145930c28:     	movq	%rdi, %r8
145930c2b:     	callq	0x145bc977b <.text+0x5bc877b>
145930c30:     	addq	%rdi, -0x28(%rbp)
145930c34:     	movups	-0x38(%rbp), %xmm0
145930c38:     	movaps	%xmm0, 0x160(%rbp)
145930c3f:     	movups	-0x28(%rbp), %xmm0
145930c43:     	movaps	%xmm0, 0x170(%rbp)
145930c4a:     	movq	0x170(%rbp), %rdi
145930c51:     	movq	0x160(%rbp), %rax
145930c58:     	cmpq	%rdi, %rax
145930c5b:     	je	0x145930d7b <.text+0x592fd7b>
145930c61:     	movq	%rax, 0x190(%rbp)
145930c68:     	movq	0x168(%rbp), %rax
145930c6f:     	movq	%rax, 0x188(%rbp)
145930c76:     	movb	$0x7d, (%rax,%rdi)
145930c7a:     	movq	0x5f8(%rsi), %rbx
145930c81:     	cmpq	0x5e8(%rsi), %rbx
145930c88:     	jne	0x145930c97 <.text+0x592fc97>
145930c8a:     	leaq	0x5e8(%rsi), %rcx
145930c91:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
145930c96:     	nop
145930c97:     	incq	%rdi
145930c9a:     	movq	0x5f0(%rsi), %rax
145930ca1:     	leaq	(%rbx,%rbx,2), %rcx
145930ca5:     	movq	0x190(%rbp), %rdx
145930cac:     	movq	%rdx, (%rax,%rcx,8)
145930cb0:     	movq	0x188(%rbp), %rdx
145930cb7:     	movq	%rdx, 0x8(%rax,%rcx,8)
145930cbc:     	movq	%rdi, 0x10(%rax,%rcx,8)
145930cc1:     	incq	%rbx
145930cc4:     	movq	%rbx, 0x5f8(%rsi)
145930ccb:     	movaps	0x1b0(%rbp), %xmm6
145930cd2:     	movaps	0x1c0(%rbp), %xmm7
145930cd9:     	movaps	0x1d0(%rbp), %xmm8
145930ce1:     	movaps	0x1e0(%rbp), %xmm9
145930ce9:     	movaps	0x1f0(%rbp), %xmm10
145930cf1:     	addq	$0x288, %rsp            # imm = 0x288
145930cf8:     	popq	%rbx
145930cf9:     	popq	%rdi
145930cfa:     	popq	%rsi
145930cfb:     	popq	%r12
145930cfd:     	popq	%r13
145930cff:     	popq	%r14
145930d01:     	popq	%r15
145930d03:     	popq	%rbp
145930d04:     	retq
145930d05:     	movq	0x160(%rbp), %rdx
145930d0c:     	testq	%rdx, %rdx
145930d0f:     	je	0x145930d27 <.text+0x592fd27>
145930d11:     	movq	0x168(%rbp), %rcx
145930d18:     	shlq	$0x3, %rdx
145930d1c:     	movl	$0x8, %r8d
145930d22:     	callq	0x1400021d0 <.text+0x11d0>
145930d27:     	movl	$0x0, 0x20(%rsp)
145930d2f:     	leaq	0x150(%rbp), %rcx
145930d36:     	movss	0x486f66(%rip), %xmm2   # 0x145db7ca4
145930d3e:     	movss	0x46d0da(%rip), %xmm3   # 0x145d9de20
145930d46:     	movq	%rsi, %rdx
145930d49:     	callq	0x145932750 <.text+0x5931750>
145930d4e:     	jmp	0x14593015c <.text+0x592f15c>
145930d53:     	movq	$0x1, 0x20(%rsp)
145930d5c:     	movq	%rcx, %rdx
145930d5f:     	leaq	-0x38(%rbp), %rcx
145930d63:     	movl	$0x1, %r9d
145930d69:     	movq	%rdi, %r8
145930d6c:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145930d71:     	nop
145930d72:     	movq	-0x28(%rbp), %rcx
145930d76:     	jmp	0x145930c10 <.text+0x592fc10>
145930d7b:     	movq	$0x1, 0x20(%rsp)
145930d84:     	leaq	0x160(%rbp), %rcx
145930d8b:     	movl	$0x1, %r8d
145930d91:     	movl	$0x1, %r9d
145930d97:     	movq	%rdi, %rdx
145930d9a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145930d9f:     	nop
145930da0:     	movq	0x160(%rbp), %rax
145930da7:     	jmp	0x145930c61 <.text+0x592fc61>
145930dac:     	movl	$0x1, %ecx
145930db1:     	movl	$0x20, %edx
145930db6:     	callq	0x145d6944b <.text+0x5d6844b>
145930dbb:     	ud2
145930dbd:     	movl	$0x1, %ecx
145930dc2:     	movl	$0x1, %edx
145930dc7:     	callq	0x145d6944b <.text+0x5d6844b>
145930dcc:     	ud2
145930dce:     	leaq	0x1548f9b(%rip), %r8    # 0x146e79d70
145930dd5:     	movq	%rdx, %rcx
145930dd8:     	movq	%r9, %rdx
145930ddb:     	callq	0x145d697e3 <.text+0x5d687e3>
145930de0:     	nop
145930de1:     	ud2
145930de3:     	movl	$0x4, %ecx
145930de8:     	movq	%r14, %rdx
145930deb:     	callq	0x145d6944b <.text+0x5d6844b>
145930df0:     	ud2
