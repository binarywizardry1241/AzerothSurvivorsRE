
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454560a0:     	pushq	%r15
1454560a2:     	pushq	%r14
1454560a4:     	pushq	%r13
1454560a6:     	pushq	%r12
1454560a8:     	pushq	%rsi
1454560a9:     	pushq	%rdi
1454560aa:     	pushq	%rbp
1454560ab:     	pushq	%rbx
1454560ac:     	subq	$0x88, %rsp
1454560b3:     	movq	%rcx, 0x48(%rsp)
1454560b8:     	testq	%r8, %r8
1454560bb:     	je	0x14545630b <.text+0x545530b>
1454560c1:     	movq	%r8, %rsi
1454560c4:     	movq	%rdx, %rdi
1454560c7:     	xorl	%r12d, %r12d
1454560ca:     	jmp	0x1454560e2 <.text+0x54550e2>
1454560cc:     	nopl	(%rax)
1454560d0:     	addq	%r13, %rdi
1454560d3:     	subq	%r13, %rsi
1454560d6:     	incq	%r12
1454560d9:     	testq	%rsi, %rsi
1454560dc:     	je	0x14545630b <.text+0x545530b>
1454560e2:     	cmpq	$0x14, %rsi
1454560e6:     	movl	$0x14, %r13d
1454560ec:     	cmovbq	%rsi, %r13
1454560f0:     	movq	%r12, 0x50(%rsp)
1454560f5:     	leaq	0x145cd0c(%rip), %rax   # 0x1468b2e08
1454560fc:     	movq	%rax, 0x58(%rsp)
145456101:     	movq	$0x2, 0x60(%rsp)
14545610a:     	movq	0x48(%rsp), %rax
14545610f:     	movq	%rax, 0x68(%rsp)
145456114:     	movq	$0x10, 0x70(%rsp)
14545611d:     	leaq	0x50(%rsp), %rax
145456122:     	movq	%rax, 0x78(%rsp)
145456127:     	movq	$0x8, 0x80(%rsp)
145456133:     	leaq	0x34(%rsp), %rcx
145456138:     	leaq	0x58(%rsp), %rdx
14545613d:     	callq	0x145456320 <.text+0x5455320>
145456142:     	movzbl	0x34(%rsp), %r14d
145456148:     	movzbl	0x35(%rsp), %ebp
14545614d:     	movzbl	0x36(%rsp), %r11d
145456153:     	movzbl	0x37(%rsp), %r10d
145456159:     	movzbl	0x38(%rsp), %r9d
14545615f:     	movzbl	0x39(%rsp), %edx
145456164:     	movzbl	0x3a(%rsp), %r8d
14545616a:     	movzbl	0x3b(%rsp), %ecx
14545616f:     	movzbl	0x3c(%rsp), %eax
145456174:     	movzbl	0x3d(%rsp), %ebx
145456179:     	movzbl	0x3e(%rsp), %r15d
14545617f:     	movb	%r15b, 0x33(%rsp)
145456184:     	movzbl	0x3f(%rsp), %r15d
14545618a:     	movb	%r15b, 0x32(%rsp)
14545618f:     	movzbl	0x40(%rsp), %r15d
145456195:     	movb	%r15b, 0x31(%rsp)
14545619a:     	movzbl	0x41(%rsp), %r15d
1454561a0:     	movb	%r15b, 0x30(%rsp)
1454561a5:     	movzbl	0x42(%rsp), %r15d
1454561ab:     	movb	%r15b, 0x2f(%rsp)
1454561b0:     	movzbl	0x43(%rsp), %r15d
1454561b6:     	movb	%r15b, 0x2e(%rsp)
1454561bb:     	movzbl	0x44(%rsp), %r15d
1454561c1:     	movb	%r15b, 0x2d(%rsp)
1454561c6:     	xorb	%r14b, (%rdi)
1454561c9:     	movzbl	0x45(%rsp), %r15d
1454561cf:     	movzbl	0x46(%rsp), %r14d
1454561d5:     	movb	%r14b, 0x2c(%rsp)
1454561da:     	movzbl	0x47(%rsp), %r14d
1454561e0:     	cmpq	$0x1, %rsi
1454561e4:     	je	0x1454560d0 <.text+0x54550d0>
1454561ea:     	xorb	%bpl, 0x1(%rdi)
1454561ee:     	cmpq	$0x2, %rsi
1454561f2:     	je	0x1454560d0 <.text+0x54550d0>
1454561f8:     	xorb	%r11b, 0x2(%rdi)
1454561fc:     	cmpq	$0x3, %rsi
145456200:     	je	0x1454560d0 <.text+0x54550d0>
145456206:     	xorb	%r10b, 0x3(%rdi)
14545620a:     	cmpq	$0x4, %rsi
14545620e:     	je	0x1454560d0 <.text+0x54550d0>
145456214:     	xorb	%r9b, 0x4(%rdi)
145456218:     	cmpq	$0x5, %rsi
14545621c:     	je	0x1454560d0 <.text+0x54550d0>
145456222:     	xorb	%dl, 0x5(%rdi)
145456225:     	cmpq	$0x6, %rsi
145456229:     	je	0x1454560d0 <.text+0x54550d0>
14545622f:     	xorb	%r8b, 0x6(%rdi)
145456233:     	cmpq	$0x7, %rsi
145456237:     	je	0x1454560d0 <.text+0x54550d0>
14545623d:     	xorb	%cl, 0x7(%rdi)
145456240:     	cmpq	$0x8, %rsi
145456244:     	je	0x1454560d0 <.text+0x54550d0>
14545624a:     	xorb	%al, 0x8(%rdi)
14545624d:     	cmpq	$0x9, %rsi
145456251:     	je	0x1454560d0 <.text+0x54550d0>
145456257:     	xorb	%bl, 0x9(%rdi)
14545625a:     	cmpq	$0xa, %rsi
14545625e:     	je	0x1454560d0 <.text+0x54550d0>
145456264:     	movzbl	0x33(%rsp), %eax
145456269:     	xorb	%al, 0xa(%rdi)
14545626c:     	cmpq	$0xb, %rsi
145456270:     	je	0x1454560d0 <.text+0x54550d0>
145456276:     	movzbl	0x32(%rsp), %eax
14545627b:     	xorb	%al, 0xb(%rdi)
14545627e:     	cmpq	$0xc, %rsi
145456282:     	je	0x1454560d0 <.text+0x54550d0>
145456288:     	movzbl	0x31(%rsp), %eax
14545628d:     	xorb	%al, 0xc(%rdi)
145456290:     	cmpq	$0xd, %rsi
145456294:     	je	0x1454560d0 <.text+0x54550d0>
14545629a:     	movzbl	0x30(%rsp), %eax
14545629f:     	xorb	%al, 0xd(%rdi)
1454562a2:     	cmpq	$0xe, %rsi
1454562a6:     	je	0x1454560d0 <.text+0x54550d0>
1454562ac:     	movzbl	0x2f(%rsp), %eax
1454562b1:     	xorb	%al, 0xe(%rdi)
1454562b4:     	cmpq	$0xf, %rsi
1454562b8:     	je	0x1454560d0 <.text+0x54550d0>
1454562be:     	movzbl	0x2e(%rsp), %eax
1454562c3:     	xorb	%al, 0xf(%rdi)
1454562c6:     	cmpq	$0x10, %rsi
1454562ca:     	je	0x1454560d0 <.text+0x54550d0>
1454562d0:     	movzbl	0x2d(%rsp), %eax
1454562d5:     	xorb	%al, 0x10(%rdi)
1454562d8:     	cmpq	$0x11, %rsi
1454562dc:     	je	0x1454560d0 <.text+0x54550d0>
1454562e2:     	xorb	%r15b, 0x11(%rdi)
1454562e6:     	cmpq	$0x12, %rsi
1454562ea:     	je	0x1454560d0 <.text+0x54550d0>
1454562f0:     	movzbl	0x2c(%rsp), %eax
1454562f5:     	xorb	%al, 0x12(%rdi)
1454562f8:     	cmpq	$0x13, %rsi
1454562fc:     	je	0x1454560d0 <.text+0x54550d0>
145456302:     	xorb	%r14b, 0x13(%rdi)
145456306:     	jmp	0x1454560d0 <.text+0x54550d0>
14545630b:     	addq	$0x88, %rsp
145456312:     	popq	%rbx
145456313:     	popq	%rbp
145456314:     	popq	%rdi
145456315:     	popq	%rsi
145456316:     	popq	%r12
145456318:     	popq	%r13
14545631a:     	popq	%r14
14545631c:     	popq	%r15
14545631e:     	retq
14545631f:     	int3
145456320:     	pushq	%r15
145456322:     	pushq	%r14
145456324:     	pushq	%r13
145456326:     	pushq	%r12
145456328:     	pushq	%rsi
145456329:     	pushq	%rdi
14545632a:     	pushq	%rbp
14545632b:     	pushq	%rbx
14545632c:     	subq	$0x1e8, %rsp            # imm = 0x1E8
145456333:     	movaps	%xmm7, 0x1d0(%rsp)
14545633b:     	movaps	%xmm6, 0x1c0(%rsp)
145456343:     	movq	%rdx, %r15
145456346:     	movq	%rcx, %rsi
145456349:     	leaq	0xd0(%rsp), %rbx
145456351:     	xorps	%xmm0, %xmm0
145456354:     	movups	%xmm0, 0x100(%rsp)
14545635c:     	movups	%xmm0, 0xf0(%rsp)
145456364:     	movups	%xmm0, 0xe0(%rsp)
14545636c:     	movups	%xmm0, 0xd0(%rsp)
145456374:     	leaq	0xb8(%rsp), %r14
14545637c:     	movaps	0xd0675d(%rip), %xmm6   # 0x14615cae0
145456383:     	movups	%xmm6, 0xb8(%rsp)
14545638b:     	movl	$0xc3d2e1f0, 0xc8(%rsp) # imm = 0xC3D2E1F0
145456396:     	movb	$0x0, 0x110(%rsp)
14545639e:     	movaps	0x145c59b(%rip), %xmm0  # 0x1468b2940
1454563a5:     	movaps	%xmm0, 0x40(%rsp)
1454563aa:     	movaps	0x145c59f(%rip), %xmm0  # 0x1468b2950
1454563b1:     	movaps	%xmm0, 0x50(%rsp)
1454563b6:     	movaps	0x145c5a3(%rip), %xmm0  # 0x1468b2960
1454563bd:     	movaps	%xmm0, 0x60(%rsp)
1454563c2:     	movaps	0x4aa887(%rip), %xmm0   # 0x145900c50
1454563c9:     	movaps	%xmm0, 0x70(%rsp)
1454563ce:     	movq	$0x1, 0xb0(%rsp)
1454563da:     	leaq	0x40(%rsp), %rdx
1454563df:     	movl	$0x1, %r8d
1454563e5:     	movq	%r14, %rcx
1454563e8:     	callq	0x14556dbc0 <.text+0x556cbc0>
1454563ed:     	movb	$0x0, 0x110(%rsp)
1454563f5:     	movq	(%r15), %rdx
1454563f8:     	movq	0x8(%r15), %r13
1454563fc:     	movabsq	$0x7fffffffffffffc0, %rdi # imm = 0x7FFFFFFFFFFFFFC0
145456406:     	cmpq	$0x40, %r13
14545640a:     	jae	0x145456419 <.text+0x5455419>
14545640c:     	movq	%rbx, %rcx
14545640f:     	movq	%r13, %r8
145456412:     	callq	0x1457149fd <.text+0x57139fd>
145456417:     	jmp	0x145456450 <.text+0x5455450>
145456419:     	movq	%r13, %r12
14545641c:     	andq	%rdi, %r12
14545641f:     	movl	%r13d, %ebp
145456422:     	andl	$0x3f, %ebp
145456425:     	addq	%rdx, %r12
145456428:     	shrq	$0x6, %r13
14545642c:     	addq	%r13, 0xb0(%rsp)
145456434:     	movq	%r14, %rcx
145456437:     	movq	%r13, %r8
14545643a:     	callq	0x14556dbc0 <.text+0x556cbc0>
14545643f:     	movq	%rbx, %rcx
145456442:     	movq	%r12, %rdx
145456445:     	movq	%rbp, %r8
145456448:     	callq	0x1457149fd <.text+0x57139fd>
14545644d:     	movq	%rbp, %r13
145456450:     	movb	%r13b, 0x110(%rsp)
145456458:     	movq	0x10(%r15), %rdx
14545645c:     	movq	0x18(%r15), %rbp
145456460:     	movl	$0x40, %r8d
145456466:     	subq	%r13, %r8
145456469:     	movq	%rbp, %r12
14545646c:     	subq	%r8, %r12
14545646f:     	jae	0x145456485 <.text+0x5455485>
145456471:     	leaq	(%rbx,%r13), %rcx
145456475:     	movq	%rbp, %r8
145456478:     	callq	0x1457149fd <.text+0x57139fd>
14545647d:     	addq	%r13, %rbp
145456480:     	movq	%rbp, %r12
145456483:     	jmp	0x1454564f1 <.text+0x54554f1>
145456485:     	testq	%r13, %r13
145456488:     	je	0x1454564b7 <.text+0x54554b7>
14545648a:     	leaq	(%rdx,%r8), %rbp
14545648e:     	addq	%rbx, %r13
145456491:     	movq	%r13, %rcx
145456494:     	callq	0x1457149fd <.text+0x57139fd>
145456499:     	incq	0xb0(%rsp)
1454564a1:     	movl	$0x1, %r8d
1454564a7:     	movq	%r14, %rcx
1454564aa:     	movq	%rbx, %rdx
1454564ad:     	callq	0x14556dbc0 <.text+0x556cbc0>
1454564b2:     	movq	%rbp, %rdx
1454564b5:     	jmp	0x1454564ba <.text+0x54554ba>
1454564b7:     	movq	%rbp, %r12
1454564ba:     	movq	%r12, %r8
1454564bd:     	shrq	$0x6, %r8
1454564c1:     	movq	%r12, %r13
1454564c4:     	andq	%rdi, %r13
1454564c7:     	andl	$0x3f, %r12d
1454564cb:     	addq	%rdx, %r13
1454564ce:     	testq	%r8, %r8
1454564d1:     	je	0x1454564e3 <.text+0x54554e3>
1454564d3:     	addq	%r8, 0xb0(%rsp)
1454564db:     	movq	%r14, %rcx
1454564de:     	callq	0x14556dbc0 <.text+0x556cbc0>
1454564e3:     	movq	%rbx, %rcx
1454564e6:     	movq	%r13, %rdx
1454564e9:     	movq	%r12, %r8
1454564ec:     	callq	0x1457149fd <.text+0x57139fd>
1454564f1:     	movb	%r12b, 0x110(%rsp)
1454564f9:     	movq	0x20(%r15), %rdx
1454564fd:     	movq	0x28(%r15), %r13
145456501:     	movl	$0x40, %r8d
145456507:     	subq	%r12, %r8
14545650a:     	movq	%r13, %r15
14545650d:     	subq	%r8, %r15
145456510:     	jae	0x145456528 <.text+0x5455528>
145456512:     	addq	%r12, %rbx
145456515:     	movq	%rbx, %rcx
145456518:     	movq	%r13, %r8
14545651b:     	callq	0x1457149fd <.text+0x57139fd>
145456520:     	addq	%r12, %r13
145456523:     	movq	%r13, %r15
145456526:     	jmp	0x145456594 <.text+0x5455594>
145456528:     	testq	%r12, %r12
14545652b:     	je	0x14545655a <.text+0x545555a>
14545652d:     	leaq	(%rdx,%r8), %r13
145456531:     	addq	%rbx, %r12
145456534:     	movq	%r12, %rcx
145456537:     	callq	0x1457149fd <.text+0x57139fd>
14545653c:     	incq	0xb0(%rsp)
145456544:     	movl	$0x1, %r8d
14545654a:     	movq	%r14, %rcx
14545654d:     	movq	%rbx, %rdx
145456550:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456555:     	movq	%r13, %rdx
145456558:     	jmp	0x14545655d <.text+0x545555d>
14545655a:     	movq	%r13, %r15
14545655d:     	movq	%r15, %r8
145456560:     	shrq	$0x6, %r8
145456564:     	movq	%r15, %r12
145456567:     	andq	%rdi, %r12
14545656a:     	andl	$0x3f, %r15d
14545656e:     	addq	%rdx, %r12
145456571:     	testq	%r8, %r8
145456574:     	je	0x145456586 <.text+0x5455586>
145456576:     	addq	%r8, 0xb0(%rsp)
14545657e:     	movq	%r14, %rcx
145456581:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456586:     	movq	%rbx, %rcx
145456589:     	movq	%r12, %rdx
14545658c:     	movq	%r15, %r8
14545658f:     	callq	0x1457149fd <.text+0x57139fd>
145456594:     	movb	%r15b, 0x110(%rsp)
14545659c:     	xorps	%xmm7, %xmm7
14545659f:     	movups	%xmm7, 0x168(%rsp)
1454565a7:     	movups	%xmm7, 0x158(%rsp)
1454565af:     	movups	%xmm7, 0x148(%rsp)
1454565b7:     	movups	%xmm7, 0x138(%rsp)
1454565bf:     	leaq	0x120(%rsp), %rbx
1454565c7:     	movups	%xmm6, 0x120(%rsp)
1454565cf:     	movl	$0xc3d2e1f0, 0x130(%rsp) # imm = 0xC3D2E1F0
1454565da:     	movb	$0x0, 0x178(%rsp)
1454565e2:     	movaps	0x145c387(%rip), %xmm0  # 0x1468b2970
1454565e9:     	movaps	%xmm0, 0x40(%rsp)
1454565ee:     	movaps	0x145c38b(%rip), %xmm0  # 0x1468b2980
1454565f5:     	movaps	%xmm0, 0x50(%rsp)
1454565fa:     	movaps	0x145c38f(%rip), %xmm0  # 0x1468b2990
145456601:     	movaps	%xmm0, 0x60(%rsp)
145456606:     	movaps	0x4aa8d3(%rip), %xmm0   # 0x145900ee0
14545660d:     	movaps	%xmm0, 0x70(%rsp)
145456612:     	movq	$0x1, 0x118(%rsp)
14545661e:     	leaq	0x40(%rsp), %rdx
145456623:     	movl	$0x1, %r8d
145456629:     	movq	%rbx, %rcx
14545662c:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456631:     	movb	$0x0, 0x178(%rsp)
145456639:     	movups	0xb0(%rsp), %xmm0
145456641:     	movups	0xc0(%rsp), %xmm1
145456649:     	movups	0xd0(%rsp), %xmm2
145456651:     	movups	0xe0(%rsp), %xmm3
145456659:     	movaps	%xmm0, 0x40(%rsp)
14545665e:     	movq	0x110(%rsp), %rax
145456666:     	movq	%rax, 0xa0(%rsp)
14545666e:     	movups	0x100(%rsp), %xmm0
145456676:     	movaps	%xmm0, 0x90(%rsp)
14545667e:     	movups	0xf0(%rsp), %xmm0
145456686:     	movaps	%xmm0, 0x80(%rsp)
14545668e:     	movaps	%xmm3, 0x70(%rsp)
145456693:     	movaps	%xmm2, 0x60(%rsp)
145456698:     	movaps	%xmm1, 0x50(%rsp)
14545669d:     	leaq	0x60(%rsp), %r14
1454566a2:     	movzbl	%al, %ecx
1454566a5:     	movq	0x40(%rsp), %rdx
1454566aa:     	shlq	$0x9, %rdx
1454566ae:     	leal	(,%rcx,8), %r12d
1454566b6:     	orq	%rdx, %r12
1454566b9:     	movzbl	%al, %r15d
1454566bd:     	movl	0xc8(%rsp), %eax
1454566c4:     	movl	%eax, 0x30(%rsp)
1454566c8:     	movdqu	0xb8(%rsp), %xmm0
1454566d1:     	movdqa	%xmm0, 0x20(%rsp)
1454566d7:     	bswapq	%r12
1454566da:     	movb	$-0x80, 0x60(%rsp,%r15)
1454566e0:     	cmpl	$0x3f, %ecx
1454566e3:     	je	0x145456708 <.text+0x5455708>
1454566e5:     	leaq	(%rsp,%r15), %rcx
1454566e9:     	addq	$0x60, %rcx
1454566ed:     	incq	%rcx
1454566f0:     	movq	%r15, %r8
1454566f3:     	xorq	$0x3f, %r8
1454566f7:     	xorl	%edx, %edx
1454566f9:     	callq	0x1457149eb <.text+0x57139eb>
1454566fe:     	xorl	$0x38, %r15d
145456702:     	cmpl	$0x7, %r15d
145456706:     	ja	0x14545675d <.text+0x545575d>
145456708:     	leaq	0x20(%rsp), %r15
14545670d:     	movl	$0x1, %r8d
145456713:     	movq	%r15, %rcx
145456716:     	movq	%r14, %rdx
145456719:     	callq	0x14556dbc0 <.text+0x556cbc0>
14545671e:     	movaps	%xmm7, 0x1a0(%rsp)
145456726:     	movaps	%xmm7, 0x190(%rsp)
14545672e:     	movaps	%xmm7, 0x180(%rsp)
145456736:     	movq	$0x0, 0x1b0(%rsp)
145456742:     	movq	%r12, 0x1b8(%rsp)
14545674a:     	leaq	0x180(%rsp), %rdx
145456752:     	movl	$0x1, %r8d
145456758:     	movq	%r15, %rcx
14545675b:     	jmp	0x145456773 <.text+0x5455773>
14545675d:     	movq	%r12, 0x98(%rsp)
145456765:     	leaq	0x20(%rsp), %rcx
14545676a:     	movl	$0x1, %r8d
145456770:     	movq	%r14, %rdx
145456773:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456778:     	leaq	0x138(%rsp), %r14
145456780:     	movl	0x30(%rsp), %eax
145456784:     	bswapl	%eax
145456786:     	pxor	%xmm0, %xmm0
14545678a:     	movdqa	0x20(%rsp), %xmm1
145456790:     	movdqa	%xmm1, %xmm2
145456794:     	punpckhbw	%xmm0, %xmm2    # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
145456798:     	pshuflw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[3,2,1,0,4,5,6,7]
14545679d:     	pshufhw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[0,1,2,3,7,6,5,4]
1454567a2:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
1454567a6:     	pshuflw	$0x1b, %xmm1, %xmm0     # xmm0 = xmm1[3,2,1,0,4,5,6,7]
1454567ab:     	pshufhw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[0,1,2,3,7,6,5,4]
1454567b0:     	packuswb	%xmm2, %xmm0
1454567b4:     	movdqa	%xmm0, 0x40(%rsp)
1454567ba:     	movl	%eax, 0x50(%rsp)
1454567be:     	movzbl	0x178(%rsp), %r15d
1454567c7:     	cmpq	$0x2c, %r15
1454567cb:     	jae	0x1454567e8 <.text+0x54557e8>
1454567cd:     	movl	0x50(%rsp), %eax
1454567d1:     	movl	%eax, 0x10(%r14,%r15)
1454567d6:     	movdqa	0x40(%rsp), %xmm0
1454567dc:     	movdqu	%xmm0, (%r14,%r15)
1454567e2:     	addq	$0x14, %r15
1454567e6:     	jmp	0x145456838 <.text+0x5455838>
1454567e8:     	movl	$0x40, %r8d
1454567ee:     	subq	%r15, %r8
1454567f1:     	leaq	(%rsp,%r8), %r12
1454567f5:     	addq	$0x40, %r12
1454567f9:     	leaq	(%r14,%r15), %rcx
1454567fd:     	addq	$-0x2c, %r15
145456801:     	leaq	0x40(%rsp), %rdx
145456806:     	callq	0x1457149fd <.text+0x57139fd>
14545680b:     	incq	0x118(%rsp)
145456813:     	movl	$0x1, %r8d
145456819:     	movq	%rbx, %rcx
14545681c:     	movq	%r14, %rdx
14545681f:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456824:     	andq	%r15, %rdi
145456827:     	addq	%r12, %rdi
14545682a:     	movq	%r14, %rcx
14545682d:     	movq	%rdi, %rdx
145456830:     	movq	%r15, %r8
145456833:     	callq	0x1457149fd <.text+0x57139fd>
145456838:     	movb	%r15b, 0x178(%rsp)
145456840:     	movups	0x118(%rsp), %xmm0
145456848:     	movups	0x128(%rsp), %xmm1
145456850:     	movups	0x138(%rsp), %xmm2
145456858:     	movups	0x148(%rsp), %xmm3
145456860:     	movaps	%xmm0, 0x40(%rsp)
145456865:     	movq	0x178(%rsp), %rax
14545686d:     	movq	%rax, 0xa0(%rsp)
145456875:     	movups	0x168(%rsp), %xmm0
14545687d:     	movaps	%xmm0, 0x90(%rsp)
145456885:     	movups	0x158(%rsp), %xmm0
14545688d:     	movaps	%xmm0, 0x80(%rsp)
145456895:     	movaps	%xmm3, 0x70(%rsp)
14545689a:     	movaps	%xmm2, 0x60(%rsp)
14545689f:     	movaps	%xmm1, 0x50(%rsp)
1454568a4:     	leaq	0x60(%rsp), %rdi
1454568a9:     	movzbl	%al, %ecx
1454568ac:     	movq	0x40(%rsp), %rdx
1454568b1:     	shlq	$0x9, %rdx
1454568b5:     	leal	(,%rcx,8), %r14d
1454568bd:     	orq	%rdx, %r14
1454568c0:     	movzbl	%al, %ebx
1454568c3:     	movl	0x130(%rsp), %eax
1454568ca:     	movl	%eax, 0x30(%rsp)
1454568ce:     	movdqu	0x120(%rsp), %xmm0
1454568d7:     	movdqa	%xmm0, 0x20(%rsp)
1454568dd:     	bswapq	%r14
1454568e0:     	movb	$-0x80, 0x60(%rsp,%rbx)
1454568e5:     	cmpl	$0x3f, %ecx
1454568e8:     	je	0x14545690b <.text+0x545590b>
1454568ea:     	leaq	(%rsp,%rbx), %rcx
1454568ee:     	addq	$0x60, %rcx
1454568f2:     	incq	%rcx
1454568f5:     	movq	%rbx, %r8
1454568f8:     	xorq	$0x3f, %r8
1454568fc:     	xorl	%edx, %edx
1454568fe:     	callq	0x1457149eb <.text+0x57139eb>
145456903:     	xorl	$0x38, %ebx
145456906:     	cmpl	$0x7, %ebx
145456909:     	ja	0x145456967 <.text+0x5455967>
14545690b:     	leaq	0x20(%rsp), %rbx
145456910:     	movl	$0x1, %r8d
145456916:     	movq	%rbx, %rcx
145456919:     	movq	%rdi, %rdx
14545691c:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456921:     	pxor	%xmm0, %xmm0
145456925:     	movdqa	%xmm0, 0x1a0(%rsp)
14545692e:     	movdqa	%xmm0, 0x190(%rsp)
145456937:     	movdqa	%xmm0, 0x180(%rsp)
145456940:     	movq	$0x0, 0x1b0(%rsp)
14545694c:     	movq	%r14, 0x1b8(%rsp)
145456954:     	leaq	0x180(%rsp), %rdx
14545695c:     	movl	$0x1, %r8d
145456962:     	movq	%rbx, %rcx
145456965:     	jmp	0x14545697d <.text+0x545597d>
145456967:     	movq	%r14, 0x98(%rsp)
14545696f:     	leaq	0x20(%rsp), %rcx
145456974:     	movl	$0x1, %r8d
14545697a:     	movq	%rdi, %rdx
14545697d:     	callq	0x14556dbc0 <.text+0x556cbc0>
145456982:     	movl	0x30(%rsp), %eax
145456986:     	bswapl	%eax
145456988:     	pxor	%xmm0, %xmm0
14545698c:     	movdqa	0x20(%rsp), %xmm1
145456992:     	movdqa	%xmm1, %xmm2
145456996:     	punpckhbw	%xmm0, %xmm2    # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
14545699a:     	pshuflw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[3,2,1,0,4,5,6,7]
14545699f:     	pshufhw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[0,1,2,3,7,6,5,4]
1454569a4:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
1454569a8:     	pshuflw	$0x1b, %xmm1, %xmm0     # xmm0 = xmm1[3,2,1,0,4,5,6,7]
1454569ad:     	pshufhw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[0,1,2,3,7,6,5,4]
1454569b2:     	packuswb	%xmm2, %xmm0
1454569b6:     	movdqu	%xmm0, (%rsi)
1454569ba:     	movl	%eax, 0x10(%rsi)
1454569bd:     	movaps	0x1c0(%rsp), %xmm6
1454569c5:     	movaps	0x1d0(%rsp), %xmm7
1454569cd:     	addq	$0x1e8, %rsp            # imm = 0x1E8
1454569d4:     	popq	%rbx
1454569d5:     	popq	%rbp
1454569d6:     	popq	%rdi
1454569d7:     	popq	%rsi
1454569d8:     	popq	%r12
1454569da:     	popq	%r13
1454569dc:     	popq	%r14
1454569de:     	popq	%r15
1454569e0:     	retq
