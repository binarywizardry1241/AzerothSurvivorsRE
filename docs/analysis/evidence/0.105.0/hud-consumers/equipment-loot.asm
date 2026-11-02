
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458971b7:     	testq	%rax, %rax
1458971ba:     	je	0x145897bf6 <.text+0x5896bf6>
1458971c0:     	movq	0x528(%rbp), %rcx
1458971c7:     	movq	0x1050(%rcx), %rdx
1458971ce:     	movq	%rdx, 0x4f0(%rbp)
1458971d5:     	movzbl	0x315(%rcx), %r13d
1458971dd:     	movq	0x520(%rbp), %rdi
1458971e4:     	leaq	(%rdi,%rax,4), %r12
1458971e8:     	leaq	0xad0(%rcx), %rax
1458971ef:     	movq	%rax, 0x478(%rbp)
1458971f6:     	leaq	0x5e0(%rcx), %rax
1458971fd:     	movq	%rax, 0x480(%rbp)
145897204:     	leaq	0xb00(%rcx), %rax
14589720b:     	movq	%rax, 0x490(%rbp)
145897212:     	leaq	0x5f8(%rcx), %rax
145897219:     	movq	%rax, 0x488(%rbp)
145897220:     	movq	$0x0, 0x510(%rbp)
14589722b:     	leaq	0xa0(%rbp), %r15
145897232:     	nopw	%cs:(%rax,%rax)
145897240:     	cmpq	%r12, %rdi
145897243:     	je	0x145897aeb <.text+0x5896aeb>
145897249:     	movl	(%rdi), %ebx
14589724b:     	movl	%ebx, %edx
14589724d:     	cmpl	$0x8, %r13d
145897251:     	ja	0x14589726e <.text+0x589626e>
145897253:     	movl	$0x164, %eax            # imm = 0x164
145897258:     	btl	%r13d, %eax
14589725c:     	movl	%ebx, %edx
14589725e:     	jae	0x14589726e <.text+0x589626e>
145897260:     	movl	%ebx, %edx
145897262:     	cmpl	$0x186a0, %ebx          # imm = 0x186A0
145897268:     	jae	0x145897330 <.text+0x5896330>
14589726e:     	movq	%r15, %rcx
145897271:     	callq	0x1458bd6f0 <.text+0x58bc6f0>
145897276:     	nop
145897277:     	addq	$0x4, %rdi
14589727b:     	cmpq	$-0x1, 0xa0(%rbp)
145897283:     	je	0x145897240 <.text+0x5896240>
145897285:     	movups	0x100(%rbp), %xmm0
14589728c:     	movaps	%xmm0, 0x3e0(%rbp)
145897293:     	movups	0xf0(%rbp), %xmm0
14589729a:     	movaps	%xmm0, 0x3d0(%rbp)
1458972a1:     	movups	0xe0(%rbp), %xmm0
1458972a8:     	movaps	%xmm0, 0x3c0(%rbp)
1458972af:     	movups	0xa0(%rbp), %xmm0
1458972b6:     	movups	0xb0(%rbp), %xmm1
1458972bd:     	movups	0xc0(%rbp), %xmm2
1458972c4:     	movups	0xd0(%rbp), %xmm3
1458972cb:     	movaps	%xmm3, 0x3b0(%rbp)
1458972d2:     	movaps	%xmm2, 0x3a0(%rbp)
1458972d9:     	movaps	%xmm1, 0x390(%rbp)
1458972e0:     	movaps	%xmm0, 0x380(%rbp)
1458972e7:     	cmpq	$0xffffff, 0x4f0(%rbp)  # imm = 0xFFFFFF
1458972f2:     	je	0x145897393 <.text+0x5896393>
1458972f8:     	movq	0x528(%rbp), %rcx
1458972ff:     	movq	0xb08(%rcx), %rax
145897306:     	movq	0xb10(%rcx), %rsi
14589730d:     	movq	%rsi, %r14
145897310:     	testq	%rsi, %rsi
145897313:     	je	0x14589741c <.text+0x589641c>
145897319:     	cmpq	$0x1, %rsi
14589731d:     	jne	0x1458973e8 <.text+0x58963e8>
145897323:     	xorl	%r14d, %r14d
145897326:     	jmp	0x14589740d <.text+0x589640d>
14589732b:     	nopl	(%rax,%rax)
145897330:     	leal	-0x186a0(%rbx), %eax
145897336:     	movl	%ebx, %edx
145897338:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
14589733d:     	ja	0x14589726e <.text+0x589626e>
145897343:     	movq	%rax, %rcx
145897346:     	movl	$0xcccccccd, %edx       # imm = 0xCCCCCCCD
14589734b:     	imulq	%rdx, %rcx
14589734f:     	shrq	$0x23, %rcx
145897353:     	addl	%ecx, %ecx
145897355:     	leal	(%rcx,%rcx,4), %ecx
145897358:     	movl	%eax, %r8d
14589735b:     	movl	%ebx, %edx
14589735d:     	subl	%ecx, %r8d
145897360:     	jne	0x14589726e <.text+0x589626e>
145897366:     	imull	$0xcccd, %eax, %eax     # imm = 0xCCCD
14589736c:     	shrl	$0x13, %eax
14589736f:     	imull	$0xffffcccd, %eax, %eax # imm = 0xFFFFCCCD
145897375:     	decl	%eax
145897377:     	rorw	%ax
14589737a:     	movzwl	%ax, %eax
14589737d:     	cmpl	$0x199a, %eax           # imm = 0x199A
145897382:     	jb	0x14589738b <.text+0x589638b>
145897384:     	movl	%ebx, %edx
145897386:     	jmp	0x14589726e <.text+0x589626e>
14589738b:     	leal	0xa(%rbx), %edx
14589738e:     	jmp	0x14589726e <.text+0x589626e>
145897393:     	movq	0x528(%rbp), %rax
14589739a:     	movq	0xb10(%rax), %rcx
1458973a1:     	testq	%rcx, %rcx
1458973a4:     	je	0x145897478 <.text+0x5896478>
1458973aa:     	movq	0xb08(%rax), %rax
1458973b1:     	xorl	%edx, %edx
1458973b3:     	cmpq	$0x1, %rcx
1458973b7:     	je	0x1458973dc <.text+0x58963dc>
1458973b9:     	nopl	(%rax)
1458973c0:     	movq	%rdx, %r8
1458973c3:     	movq	%rcx, %r9
1458973c6:     	shrq	%r9
1458973c9:     	addq	%r9, %rdx
1458973cc:     	cmpl	%ebx, (%rax,%rdx,4)
1458973cf:     	cmovaq	%r8, %rdx
1458973d3:     	subq	%r9, %rcx
1458973d6:     	cmpq	$0x1, %rcx
1458973da:     	ja	0x1458973c0 <.text+0x58963c0>
1458973dc:     	cmpl	%ebx, (%rax,%rdx,4)
1458973df:     	setne	%r14b
1458973e3:     	jmp	0x14589747b <.text+0x589647b>
1458973e8:     	movq	%rsi, %rcx
1458973eb:     	xorl	%r14d, %r14d
1458973ee:     	nop
1458973f0:     	movq	%r14, %rdx
1458973f3:     	movq	%rcx, %r8
1458973f6:     	shrq	%r8
1458973f9:     	addq	%r8, %r14
1458973fc:     	cmpl	%ebx, (%rax,%r14,4)
145897400:     	cmovaq	%rdx, %r14
145897404:     	subq	%r8, %rcx
145897407:     	cmpq	$0x1, %rcx
14589740b:     	ja	0x1458973f0 <.text+0x58963f0>
14589740d:     	cmpl	%ebx, (%rax,%r14,4)
145897411:     	jne	0x145897418 <.text+0x5896418>
145897413:     	xorl	%r14d, %r14d
145897416:     	jmp	0x14589747b <.text+0x589647b>
145897418:     	adcq	$0x0, %r14
14589741c:     	movq	0x490(%rbp), %rcx
145897423:     	cmpq	(%rcx), %rsi
145897426:     	jne	0x145897443 <.text+0x5896443>
145897428:     	movq	0x490(%rbp), %rcx
14589742f:     	callq	0x145bcdda0 <.text+0x5bccda0>
145897434:     	nop
145897435:     	movq	0x528(%rbp), %rax
14589743c:     	movq	0xb08(%rax), %rax
145897443:     	leaq	(%rax,%r14,4), %rax
145897447:     	movq	%rsi, %r8
14589744a:     	subq	%r14, %r8
14589744d:     	jbe	0x145897465 <.text+0x5896465>
14589744f:     	leaq	0x4(%rax), %rcx
145897453:     	shlq	$0x2, %r8
145897457:     	movq	%rax, %r14
14589745a:     	movq	%rax, %rdx
14589745d:     	callq	0x145bc978d <.text+0x5bc878d>
145897462:     	movq	%r14, %rax
145897465:     	movl	%ebx, (%rax)
145897467:     	incq	%rsi
14589746a:     	movq	0x528(%rbp), %rax
145897471:     	movq	%rsi, 0xb10(%rax)
145897478:     	movb	$0x1, %r14b
14589747b:     	cmpq	$0xffffff, 0x4f0(%rbp)  # imm = 0xFFFFFF
145897486:     	setne	%bl
145897489:     	movq	0x4c8(%rbp), %rax
145897490:     	cmpl	$0x2, (%rax)
145897493:     	je	0x145897baf <.text+0x5896baf>
145897499:     	movl	$0x11, %edx
14589749e:     	leaq	0x131fe2b(%rip), %rcx   # 0x146bb72d0
1458974a5:     	callq	0x1458da590 <.text+0x58d9590>
1458974aa:     	nop
1458974ab:     	testq	%rax, %rax
1458974ae:     	leaq	0x131fe1b(%rip), %rcx   # 0x146bb72d0
1458974b5:     	cmoveq	%rcx, %rax
1458974b9:     	movl	$0x11, %ecx
1458974be:     	cmoveq	%rcx, %rdx
1458974c2:     	movq	%rax, 0x10(%rbp)
1458974c6:     	movq	%rdx, 0x18(%rbp)
1458974ca:     	movq	0x3b0(%rbp), %rcx
1458974d1:     	cmpq	$0x5, %rcx
1458974d5:     	je	0x1458974eb <.text+0x58964eb>
1458974d7:     	cmpq	$0x4, %rcx
1458974db:     	jne	0x1458974f2 <.text+0x58964f2>
1458974dd:     	movl	$0x4, %ecx
1458974e2:     	cmpl	$0x2, 0x3d8(%rbp)
1458974e9:     	je	0x1458974fc <.text+0x58964fc>
1458974eb:     	movl	$0x3, %ecx
1458974f0:     	jmp	0x1458974fc <.text+0x58964fc>
1458974f2:     	cmpq	$0x5, %rcx
1458974f6:     	ja	0x1458995d1 <.text+0x58985d1>
1458974fc:     	shlq	$0x4, %rcx
145897500:     	leaq	0x1322b21(%rip), %rax   # 0x146bba028
145897507:     	addq	%rax, %rcx
14589750a:     	movq	%rcx, 0xa0(%rbp)
145897511:     	leaq	-0x5895458(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145897518:     	movq	%rax, 0xa8(%rbp)
14589751f:     	leaq	0x380(%rbp), %rax
145897526:     	movq	%rax, 0xb0(%rbp)
14589752d:     	leaq	-0x5895454(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145897534:     	movq	%rax, 0xb8(%rbp)
14589753b:     	leaq	0x498(%rbp), %rcx
145897542:     	leaq	0x1322b3f(%rip), %rdx   # 0x146bba088
145897549:     	movq	%r15, %r8
14589754c:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145897551:     	nop
145897552:     	testb	%r14b, %r14b
145897555:     	je	0x1458975c3 <.text+0x58965c3>
145897557:     	movl	$0x17, %edx
14589755c:     	leaq	0x131fda2(%rip), %rcx   # 0x146bb7305
145897563:     	callq	0x1458da590 <.text+0x58d9590>
145897568:     	nop
145897569:     	testq	%rax, %rax
14589756c:     	leaq	0x131fd92(%rip), %rcx   # 0x146bb7305
145897573:     	cmoveq	%rcx, %rax
145897577:     	movl	$0x17, %ecx
14589757c:     	cmoveq	%rcx, %rdx
145897580:     	movq	%rax, 0x368(%rbp)
145897587:     	movq	%rdx, 0x370(%rbp)
14589758e:     	leaq	0x368(%rbp), %rax
145897595:     	movq	%rax, 0x4d0(%rbp)
14589759c:     	leaq	-0x58954e3(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458975a3:     	movq	%rax, 0x4d8(%rbp)
1458975aa:     	movq	%r15, %rcx
1458975ad:     	leaq	0x131fd68(%rip), %rdx   # 0x146bb731c
1458975b4:     	leaq	0x4d0(%rbp), %r8
1458975bb:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458975c0:     	nop
1458975c1:     	jmp	0x14589762d <.text+0x589662d>
1458975c3:     	movl	$0x11, %edx
1458975c8:     	leaq	0x131fd12(%rip), %rcx   # 0x146bb72e1
1458975cf:     	callq	0x1458da590 <.text+0x58d9590>
1458975d4:     	nop
1458975d5:     	testq	%rax, %rax
1458975d8:     	leaq	0x131fd02(%rip), %rcx   # 0x146bb72e1
1458975df:     	cmoveq	%rcx, %rax
1458975e3:     	movl	$0x11, %ecx
1458975e8:     	cmoveq	%rcx, %rdx
1458975ec:     	movq	%rax, 0x368(%rbp)
1458975f3:     	movq	%rdx, 0x370(%rbp)
1458975fa:     	leaq	0x368(%rbp), %rax
145897601:     	movq	%rax, 0x4d0(%rbp)
145897608:     	leaq	-0x589554f(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14589760f:     	movq	%rax, 0x4d8(%rbp)
145897616:     	movq	%r15, %rcx
145897619:     	leaq	0x131fcd2(%rip), %rdx   # 0x146bb72f2
145897620:     	leaq	0x4d0(%rbp), %r8
145897627:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14589762c:     	nop
14589762d:     	movups	0xa0(%rbp), %xmm0
145897634:     	movaps	%xmm0, 0x4d0(%rbp)
14589763b:     	movq	0xb0(%rbp), %rax
145897642:     	movq	%rax, 0x4e0(%rbp)
145897649:     	leaq	0x10(%rbp), %rax
14589764d:     	movq	%rax, 0xa0(%rbp)
145897654:     	leaq	-0x589559b(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14589765b:     	movq	%rax, 0xa8(%rbp)
145897662:     	leaq	0x498(%rbp), %rax
145897669:     	movq	%rax, 0xb0(%rbp)
145897670:     	leaq	-0x5895597(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
145897677:     	movq	%rcx, 0xb8(%rbp)
14589767e:     	leaq	0x4d0(%rbp), %rax
145897685:     	movq	%rax, 0xc0(%rbp)
14589768c:     	movq	%rcx, 0xc8(%rbp)
145897693:     	leaq	0x368(%rbp), %rcx
14589769a:     	leaq	0x131fc8c(%rip), %rdx   # 0x146bb732d
1458976a1:     	movq	%r15, %r8
1458976a4:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458976a9:     	nop
1458976aa:     	movq	0x4d0(%rbp), %rdx
1458976b1:     	testq	%rdx, %rdx
1458976b4:     	je	0x1458976c8 <.text+0x58966c8>
1458976b6:     	movq	0x4d8(%rbp), %rcx
1458976bd:     	movl	$0x1, %r8d
1458976c3:     	callq	0x1400021d0 <.text+0x11d0>
1458976c8:     	movq	0x498(%rbp), %rdx
1458976cf:     	testq	%rdx, %rdx
1458976d2:     	je	0x1458976e6 <.text+0x58966e6>
1458976d4:     	movq	0x4a0(%rbp), %rcx
1458976db:     	movl	$0x1, %r8d
1458976e1:     	callq	0x1400021d0 <.text+0x11d0>
1458976e6:     	movq	0x368(%rbp), %rax
1458976ed:     	movq	%rax, 0x4c0(%rbp)
1458976f4:     	movq	0x370(%rbp), %rdx
1458976fb:     	movq	0x378(%rbp), %r8
145897702:     	movq	%r15, %rcx
145897705:     	movq	%rdx, 0x4b8(%rbp)
14589770c:     	callq	0x1458ad060 <.text+0x58ac060>
145897711:     	nop
145897712:     	movq	0x528(%rbp), %rax
145897719:     	movq	0x5f0(%rax), %rsi
145897720:     	cmpq	0x5e0(%rax), %rsi
145897727:     	jne	0x145897736 <.text+0x5896736>
145897729:     	movq	0x480(%rbp), %rcx
145897730:     	callq	0x145bcb530 <.text+0x5bca530>
145897735:     	nop
145897736:     	movq	0x528(%rbp), %rdx
14589773d:     	movq	0x5e8(%rdx), %rax
145897744:     	movq	%rsi, %rcx
145897747:     	shlq	$0x5, %rcx
14589774b:     	movups	0xa0(%rbp), %xmm0
145897752:     	movups	0xb0(%rbp), %xmm1
145897759:     	movups	%xmm1, 0x10(%rax,%rcx)
14589775e:     	movups	%xmm0, (%rax,%rcx)
145897762:     	incq	%rsi
145897765:     	movq	%rsi, 0x5f0(%rdx)
14589776c:     	movq	0x4c0(%rbp), %rdx
145897773:     	testq	%rdx, %rdx
145897776:     	je	0x14589778a <.text+0x589678a>
145897778:     	movl	$0x1, %r8d
14589777e:     	movq	0x4b8(%rbp), %rcx
145897785:     	callq	0x1400021d0 <.text+0x11d0>
14589778a:     	callq	0x140002200 <.text+0x1200>
14589778f:     	movl	$0x1, %ecx
145897794:     	movl	$0x1, %edx
145897799:     	callq	0x1400021c0 <.text+0x11c0>
14589779e:     	testq	%rax, %rax
1458977a1:     	je	0x1458995bf <.text+0x58985bf>
1458977a7:     	movb	$0x7b, (%rax)
1458977aa:     	movq	$0x1, 0xa0(%rbp)
1458977b5:     	movq	%rax, 0xa8(%rbp)
1458977bc:     	movq	$0x1, 0xb0(%rbp)
1458977c7:     	movb	$0x1, 0xb8(%rbp)
1458977ce:     	leaq	0x131fb62(%rip), %rax   # 0x146bb7337
1458977d5:     	movq	%rax, 0x20(%rsp)
1458977da:     	movq	$0x4, 0x28(%rsp)
1458977e3:     	movl	$0x4, %r9d
1458977e9:     	leaq	0x4d0(%rbp), %rcx
1458977f0:     	movq	%r15, %rdx
1458977f3:     	leaq	0x131fb39(%rip), %r8    # 0x146bb7333
1458977fa:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458977ff:     	nop
145897800:     	movups	0x388(%rbp), %xmm0
145897807:     	movups	%xmm0, 0x20(%rsp)
14589780c:     	movl	$0x4, %r9d
145897812:     	movq	%r15, %rcx
145897815:     	leaq	0x4d0(%rbp), %rdx
14589781c:     	leaq	0x131fb18(%rip), %r8    # 0x146bb733b
145897823:     	callq	0x1458d97b0 <.text+0x58d87b0>
145897828:     	nop
145897829:     	movl	$0x3, %eax
14589782e:     	movq	0x3b0(%rbp), %rcx
145897835:     	cmpq	$0x4, %rcx
145897839:     	je	0x145897a77 <.text+0x5896a77>
14589783f:     	cmpq	$0x5, %rcx
145897843:     	je	0x145897847 <.text+0x5896847>
145897845:     	movl	%ecx, %eax
145897847:     	movl	%eax, 0x20(%rsp)
14589784b:     	movl	$0x6, %r9d
145897851:     	leaq	0x4d0(%rbp), %rcx
145897858:     	movq	%r15, %rdx
14589785b:     	leaq	0x131fadd(%rip), %r8    # 0x146bb733f
145897862:     	callq	0x1458d6e20 <.text+0x58d5e20>
145897867:     	nop
145897868:     	movl	0x3d4(%rbp), %ecx
14589786e:     	movb	$0x1, 0x4fe(%rbp)
145897875:     	callq	0x1458bef90 <.text+0x58bdf90>
14589787a:     	nop
14589787b:     	testq	%rax, %rax
14589787e:     	cmoveq	%rax, %rdx
145897882:     	movl	$0x1, %ecx
145897887:     	cmoveq	%rcx, %rax
14589788b:     	movb	$0x0, 0x4fe(%rbp)
145897892:     	movq	%rdx, 0x28(%rsp)
145897897:     	movq	%rax, 0x20(%rsp)
14589789c:     	movl	$0x4, %r9d
1458978a2:     	movq	%r15, %rcx
1458978a5:     	leaq	0x4d0(%rbp), %rdx
1458978ac:     	leaq	0x131fa92(%rip), %r8    # 0x146bb7345
1458978b3:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458978b8:     	nop
1458978b9:     	movzbl	0x3e8(%rbp), %ecx
1458978c0:     	movb	$0x1, 0x4fd(%rbp)
1458978c7:     	callq	0x1458bfc90 <.text+0x58bec90>
1458978cc:     	nop
1458978cd:     	leaq	0x4d0(%rbp), %rsi
1458978d4:     	movb	$0x0, 0x4fd(%rbp)
1458978db:     	movq	%rdx, 0x28(%rsp)
1458978e0:     	movq	%rax, 0x20(%rsp)
1458978e5:     	movl	$0x4, %r9d
1458978eb:     	movq	%rsi, %rcx
1458978ee:     	movq	%r15, %rdx
1458978f1:     	leaq	0x131fa51(%rip), %r8    # 0x146bb7349
1458978f8:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458978fd:     	nop
1458978fe:     	movl	$0x3, %r8d
145897904:     	movq	%rsi, %rcx
145897907:     	leaq	0x131fa3f(%rip), %rdx   # 0x146bb734d
14589790e:     	callq	0x1458d9500 <.text+0x58d8500>
145897913:     	nop
145897914:     	movzbl	%r14b, %esi
145897918:     	xorq	$0x5, %rsi
14589791c:     	movq	0x4d0(%rbp), %rax
145897923:     	movq	0x4e0(%rbp), %rcx
14589792a:     	subq	%rcx, %rax
14589792d:     	cmpq	%rax, %rsi
145897930:     	movl	%r14d, 0x4b0(%rbp)
145897937:     	ja	0x145897a89 <.text+0x5896a89>
14589793d:     	movl	%ebx, %r14d
145897940:     	cmpb	$0x0, 0x4b0(%rbp)
145897947:     	leaq	0x132b4dc(%rip), %rdx   # 0x146bc2e2a
14589794e:     	leaq	0x132b4da(%rip), %rax   # 0x146bc2e2f
145897955:     	cmovneq	%rax, %rdx
145897959:     	addq	0x4d8(%rbp), %rcx
145897960:     	movq	%rsi, %r8
145897963:     	callq	0x145bc977b <.text+0x5bc877b>
145897968:     	addq	%rsi, 0x4e0(%rbp)
14589796f:     	movups	0x4d0(%rbp), %xmm0
145897976:     	movaps	%xmm0, 0xa0(%rbp)
14589797d:     	movups	0x4e0(%rbp), %xmm0
145897984:     	movaps	%xmm0, 0xb0(%rbp)
14589798b:     	movq	0xb0(%rbp), %rsi
145897992:     	movq	0xa0(%rbp), %rax
145897999:     	movq	%rax, 0x4c0(%rbp)
1458979a0:     	cmpq	%rsi, %rax
1458979a3:     	je	0x145897ab7 <.text+0x5896ab7>
1458979a9:     	movq	0xa8(%rbp), %rax
1458979b0:     	movq	%rax, 0x4b8(%rbp)
1458979b7:     	movb	$0x7d, (%rax,%rsi)
1458979bb:     	movq	0x528(%rbp), %rax
1458979c2:     	movq	0x608(%rax), %rbx
1458979c9:     	cmpq	0x5f8(%rax), %rbx
1458979d0:     	jne	0x1458979df <.text+0x58969df>
1458979d2:     	movq	0x488(%rbp), %rcx
1458979d9:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
1458979de:     	nop
1458979df:     	incq	%rsi
1458979e2:     	movq	0x528(%rbp), %rdx
1458979e9:     	movq	0x600(%rdx), %rax
1458979f0:     	leaq	(%rbx,%rbx,2), %rcx
1458979f4:     	movq	0x4c0(%rbp), %r8
1458979fb:     	movq	%r8, (%rax,%rcx,8)
1458979ff:     	movq	0x4b8(%rbp), %r8
145897a06:     	movq	%r8, 0x8(%rax,%rcx,8)
145897a0b:     	movq	%rsi, 0x10(%rax,%rcx,8)
145897a10:     	incq	%rbx
145897a13:     	movq	%rbx, 0x608(%rdx)
145897a1a:     	movq	0x380(%rbp), %rdx
145897a21:     	testq	%rdx, %rdx
145897a24:     	je	0x145897a38 <.text+0x5896a38>
145897a26:     	movq	0x388(%rbp), %rcx
145897a2d:     	movl	$0x1, %r8d
145897a33:     	callq	0x1400021d0 <.text+0x11d0>
145897a38:     	movq	0x398(%rbp), %rdx
145897a3f:     	testq	%rdx, %rdx
145897a42:     	je	0x145897a5a <.text+0x5896a5a>
145897a44:     	movq	0x3a0(%rbp), %rcx
145897a4b:     	shlq	$0x3, %rdx
145897a4f:     	movl	$0x4, %r8d
145897a55:     	callq	0x1400021d0 <.text+0x11d0>
145897a5a:     	andb	0x4b0(%rbp), %r14b
145897a61:     	movq	0x510(%rbp), %rax
145897a68:     	orb	%r14b, %al
145897a6b:     	movq	%rax, 0x510(%rbp)
