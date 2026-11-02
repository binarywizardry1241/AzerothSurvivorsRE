
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145900230:     	pushq	%rbp
145900231:     	pushq	%r15
145900233:     	pushq	%r14
145900235:     	pushq	%r13
145900237:     	pushq	%r12
145900239:     	pushq	%rsi
14590023a:     	pushq	%rdi
14590023b:     	pushq	%rbx
14590023c:     	subq	$0xe78, %rsp            # imm = 0xE78
145900243:     	leaq	0x80(%rsp), %rbp
14590024b:     	movaps	%xmm15, 0xde0(%rbp)
145900253:     	movaps	%xmm14, 0xdd0(%rbp)
14590025b:     	movaps	%xmm13, 0xdc0(%rbp)
145900263:     	movaps	%xmm12, 0xdb0(%rbp)
14590026b:     	movaps	%xmm11, 0xda0(%rbp)
145900273:     	movaps	%xmm10, 0xd90(%rbp)
14590027b:     	movaps	%xmm9, 0xd80(%rbp)
145900283:     	movaps	%xmm8, 0xd70(%rbp)
14590028b:     	movaps	%xmm7, 0xd60(%rbp)
145900292:     	movaps	%xmm6, 0xd50(%rbp)
145900299:     	movq	$-0x2, 0xd48(%rbp)
1459002a4:     	movq	%r8, 0xd20(%rbp)
1459002ab:     	movq	%rdx, %rsi
1459002ae:     	movq	%r8, 0xc78(%rbp)
1459002b5:     	movzbl	0x16c(%rdx), %edx
1459002bc:     	leal	-0x2(%rdx), %eax
1459002bf:     	cmpb	$0x9, %al
1459002c1:     	movq	%rcx, 0xbe8(%rbp)
1459002c8:     	movq	%rdx, 0xd28(%rbp)
1459002cf:     	ja	0x1459002e1 <.text+0x58ff2e1>
1459002d1:     	movzbl	%al, %eax
1459002d4:     	leaq	0x157aeb5(%rip), %rcx   # 0x146e7b190
1459002db:     	movq	(%rcx,%rax,8), %rbx
1459002df:     	jmp	0x1459002e8 <.text+0x58ff2e8>
1459002e1:     	leaq	0x12ab4c0(%rip), %rbx   # 0x146bab7a8
1459002e8:     	movl	0xec(%rsi), %r12d
1459002ef:     	movq	0xf8(%rsi), %rcx
1459002f6:     	movq	0x100(%rsi), %rdx
1459002fd:     	callq	0x1458753b0 <.text+0x58743b0>
145900302:     	movq	%rax, %r14
145900305:     	movq	%rsi, 0xd38(%rbp)
14590030c:     	leaq	0x18(%rsi), %rdx
145900310:     	movb	$0x1, 0xd44(%rbp)
145900317:     	leaq	-0x50(%rbp), %rcx
14590031b:     	callq	0x1458e3800 <.text+0x58e2800>
145900320:     	nop
145900321:     	imulq	$0xf0, %r14, %rax
145900328:     	leaq	0x12a9121(%rip), %rdi   # 0x146ba9450
14590032f:     	addq	%rax, %rdi
145900332:     	movq	0x40(%rbx), %r14
145900336:     	movq	0x48(%rbx), %r15
14590033a:     	movq	%r14, 0xc90(%rbp)
145900341:     	movq	%r15, 0xc98(%rbp)
145900348:     	xorl	%r13d, %r13d
14590034b:     	leaq	0x12ac786(%rip), %rsi   # 0x146bacad8
145900352:     	jmp	0x145900371 <.text+0x58ff371>
145900354:     	nopw	%cs:(%rax,%rax)
145900360:     	addq	$0x78, %r13
145900364:     	cmpq	$0x34f8, %r13           # imm = 0x34F8
14590036b:     	je	0x14590167f <.text+0x590067f>
145900371:     	cmpq	%r15, 0x8(%r13,%rsi)
145900376:     	jne	0x145900360 <.text+0x58ff360>
145900378:     	movq	(%r13,%rsi), %rcx
14590037d:     	movq	%r14, %rdx
145900380:     	movq	%r15, %r8
145900383:     	callq	0x145bc9787 <.text+0x5bc8787>
145900388:     	testl	%eax, %eax
14590038a:     	jne	0x145900360 <.text+0x58ff360>
14590038c:     	movq	0xd38(%rbp), %rax
145900393:     	movzbl	0x16d(%rax), %r14d
14590039b:     	leal	-0x2(%r14), %eax
14590039f:     	cmpb	$0x6, %al
1459003a1:     	movq	%rbx, 0xd30(%rbp)
1459003a8:     	movl	%r12d, 0xc8c(%rbp)
1459003af:     	ja	0x1459003c1 <.text+0x58ff3c1>
1459003b1:     	movzbl	%al, %eax
1459003b4:     	leaq	0x157ad65(%rip), %rcx   # 0x146e7b120
1459003bb:     	movq	(%rcx,%rax,8), %rax
1459003bf:     	jmp	0x1459003c8 <.text+0x58ff3c8>
1459003c1:     	leaq	0x12aa248(%rip), %rax   # 0x146baa610
1459003c8:     	addq	%rsi, %r13
1459003cb:     	movq	0x30(%rax), %r15
1459003cf:     	movq	0x38(%rax), %r12
1459003d3:     	movq	%r15, 0xc90(%rbp)
1459003da:     	movq	%r12, 0xc98(%rbp)
1459003e1:     	xorl	%ebx, %ebx
1459003e3:     	jmp	0x145900401 <.text+0x58ff401>
1459003e5:     	nopw	%cs:(%rax,%rax)
1459003f0:     	addq	$0x78, %rbx
1459003f4:     	cmpq	$0x34f8, %rbx           # imm = 0x34F8
1459003fb:     	je	0x1459016bd <.text+0x59006bd>
145900401:     	cmpq	%r12, 0x8(%rbx,%rsi)
145900406:     	jne	0x1459003f0 <.text+0x58ff3f0>
145900408:     	movq	(%rbx,%rsi), %rcx
14590040c:     	movq	%r15, %rdx
14590040f:     	movq	%r12, %r8
145900412:     	callq	0x145bc9787 <.text+0x5bc8787>
145900417:     	testl	%eax, %eax
145900419:     	jne	0x1459003f0 <.text+0x58ff3f0>
14590041b:     	movsd	0xc8(%rdi), %xmm6
145900423:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
145900428:     	movq	0xd20(%rbp), %r15
14590042f:     	leaq	0x10(%r15), %rcx
145900433:     	movb	$0x1, 0xd46(%rbp)
14590043a:     	movb	$0x1, 0xd45(%rbp)
145900441:     	movaps	%xmm6, %xmm1
145900444:     	movaps	%xmm8, %xmm2
145900448:     	callq	0x1458c7b60 <.text+0x58c6b60>
14590044d:     	nop
14590044e:     	testb	$0x1, %al
145900450:     	je	0x145900457 <.text+0x58ff457>
145900452:     	movaps	%xmm0, %xmm7
145900455:     	jmp	0x145900497 <.text+0x58ff497>
145900457:     	cmpq	$-0x1, 0x68(%r15)
14590045c:     	je	0x14590048e <.text+0x58ff48e>
14590045e:     	leaq	0x68(%r15), %rdx
145900462:     	movb	$0x1, 0xd46(%rbp)
145900469:     	movb	$0x1, 0xd45(%rbp)
145900470:     	leaq	0x30(%rbp), %rcx
145900474:     	movaps	%xmm6, %xmm2
145900477:     	movaps	%xmm8, %xmm3
14590047b:     	callq	0x1458cc950 <.text+0x58cb950>
145900480:     	nop
145900481:     	cmpl	$0x1, 0x30(%rbp)
145900485:     	jne	0x14590048e <.text+0x58ff48e>
145900487:     	movss	0x3c(%rbp), %xmm7
14590048c:     	jmp	0x145900497 <.text+0x58ff497>
14590048e:     	movss	0xb8(%r15), %xmm7
145900497:     	movq	0xd38(%rbp), %rax
14590049e:     	movq	0x110(%rax), %rdx
1459004a5:     	movb	$0x1, 0xd46(%rbp)
1459004ac:     	movb	$0x1, 0xd45(%rbp)
1459004b3:     	leaq	0x10(%rbp), %rcx
1459004b7:     	callq	0x14597d0c0 <.text+0x597c0c0>
1459004bc:     	nop
1459004bd:     	movq	0xd38(%rbp), %r15
1459004c4:     	movq	0x108(%r15), %r12
1459004cb:     	movss	0xd4(%rdi), %xmm10
1459004d4:     	movq	0xd30(%rbp), %rax
1459004db:     	movss	0x80(%rax), %xmm9
1459004e4:     	callq	0x140002200 <.text+0x1200>
1459004e9:     	movl	$0x68, %ecx
1459004ee:     	movl	$0x8, %edx
1459004f3:     	callq	0x1400021c0 <.text+0x11c0>
1459004f8:     	testq	%rax, %rax
1459004fb:     	je	0x145901647 <.text+0x5900647>
145900501:     	movq	%r13, (%rax)
145900504:     	xorps	%xmm0, %xmm0
145900507:     	movups	%xmm0, 0x8(%rax)
14590050b:     	movq	$0x0, 0x18(%rax)
145900513:     	movl	$0x1, 0x20(%rax)
14590051a:     	movsd	0x4737fe(%rip), %xmm0   # 0x145d73d20
145900522:     	movsd	%xmm0, 0x24(%rax)
145900527:     	movq	$0x3f800000, 0x2c(%rax) # imm = 0x3F800000
14590052f:     	movsd	0x470768(%rip), %xmm14  # 0x145d70ca0
145900538:     	movups	%xmm14, 0x34(%rax)
14590053d:     	movsd	0x47075a(%rip), %xmm12  # 0x145d70ca0
145900546:     	movsd	%xmm12, 0x44(%rax)
14590054c:     	movl	$0x0, 0x4c(%rax)
145900553:     	movaps	0x4737d5(%rip), %xmm11  # 0x145d73d30
14590055b:     	movups	%xmm11, 0x50(%rax)
145900560:     	movq	%rax, 0xc80(%rbp)
145900567:     	movsd	%xmm12, 0x60(%rax)
14590056d:     	movq	$0x0, 0xc48(%rbp)
145900578:     	movq	$0x8, 0xc50(%rbp)
145900583:     	movq	$0x0, 0xc58(%rbp)
14590058e:     	movq	%r15, %rax
145900591:     	addq	$0x120, %r15            # imm = 0x120
145900598:     	addq	$0x30, %rax
14590059c:     	movq	%rax, 0x20(%rsp)
1459005a1:     	leaq	0xc90(%rbp), %rcx
1459005a8:     	movl	%r14d, %edx
1459005ab:     	movq	0xd28(%rbp), %r8
1459005b2:     	movq	%r15, %r9
1459005b5:     	callq	0x1458bd260 <.text+0x58bc260>
1459005ba:     	nop
1459005bb:     	leaq	0xcf8(%rbp), %rcx
1459005c2:     	movq	%r15, %rdx
1459005c5:     	callq	0x1458beb10 <.text+0x58bdb10>
1459005ca:     	nop
1459005cb:     	addq	%rbx, %rsi
1459005ce:     	movq	0xd30(%rbp), %rbx
1459005d5:     	movss	0x80(%rbx), %xmm13
1459005de:     	movss	0x84(%rbx), %xmm15
1459005e7:     	movq	0xd38(%rbp), %rdx
1459005ee:     	movl	0xe8(%rdx), %edi
1459005f4:     	addl	$0x3, %edi
1459005f7:     	movq	$-0x1, 0x3b8(%rbp)
145900602:     	movups	0xc48(%rbp), %xmm0
145900609:     	movups	%xmm0, 0x370(%rbp)
145900610:     	movq	0xc58(%rbp), %rax
145900617:     	movq	%rax, 0x380(%rbp)
14590061e:     	movups	0xc90(%rbp), %xmm0
145900625:     	movups	0xca0(%rbp), %xmm1
14590062c:     	movups	0xcb0(%rbp), %xmm2
145900633:     	movups	0xcc0(%rbp), %xmm3
14590063a:     	movaps	%xmm0, 0xbf0(%rbp)
145900641:     	movaps	%xmm1, 0xc00(%rbp)
145900648:     	movaps	%xmm2, 0xc10(%rbp)
14590064f:     	movaps	%xmm3, 0xc20(%rbp)
145900656:     	movups	0xccc(%rbp), %xmm0
14590065d:     	movups	%xmm0, 0xc2c(%rbp)
145900664:     	movups	0xcf8(%rbp), %xmm0
14590066b:     	movups	%xmm0, 0x388(%rbp)
145900672:     	movq	0xd08(%rbp), %rax
145900679:     	movq	%rax, 0x398(%rbp)
145900680:     	xorps	%xmm8, %xmm8
145900684:     	movups	%xmm8, 0x430(%rbp)
14590068c:     	movq	$0x0, 0x440(%rbp)
145900697:     	leaq	0x1c8(%rbp), %rcx
14590069e:     	movl	$0x178, %r8d            # imm = 0x178
1459006a4:     	callq	0x145bc977b <.text+0x5bc877b>
1459006a9:     	movaps	%xmm8, 0xbd0(%rbp)
1459006b1:     	movq	$0x0, 0xbe0(%rbp)
1459006bc:     	movups	%xmm8, 0xab0(%rbp)
1459006c4:     	movups	%xmm8, 0xc4c(%rbp)
1459006cc:     	movups	%xmm8, 0xc58(%rbp)
1459006d4:     	movaps	%xmm8, 0xbb0(%rbp)
1459006dc:     	movaps	%xmm8, 0xbc0(%rbp)
1459006e4:     	movl	$0x0, 0xc70(%rbp)
1459006ee:     	movq	$0x0, 0xc68(%rbp)
1459006f9:     	movups	(%rbp), %xmm0
1459006fd:     	movaps	%xmm0, 0xce0(%rbp)
145900704:     	movups	-0x10(%rbp), %xmm0
145900708:     	movaps	%xmm0, 0xcd0(%rbp)
14590070f:     	movups	-0x50(%rbp), %xmm0
145900713:     	movups	-0x40(%rbp), %xmm1
145900717:     	movups	-0x30(%rbp), %xmm2
14590071b:     	movups	-0x20(%rbp), %xmm3
14590071f:     	movaps	%xmm3, 0xcc0(%rbp)
145900726:     	movaps	%xmm2, 0xcb0(%rbp)
14590072d:     	movaps	%xmm1, 0xca0(%rbp)
145900734:     	movaps	%xmm0, 0xc90(%rbp)
14590073b:     	movaps	%xmm8, 0xb20(%rbp)
145900743:     	movaps	%xmm8, 0xb30(%rbp)
14590074b:     	movaps	%xmm8, 0xb40(%rbp)
145900753:     	movaps	%xmm8, 0xb50(%rbp)
14590075b:     	movaps	%xmm8, 0xb60(%rbp)
145900763:     	movaps	%xmm8, 0xb70(%rbp)
14590076b:     	movaps	%xmm8, 0xb80(%rbp)
145900773:     	movaps	%xmm8, 0xb90(%rbp)
14590077b:     	movaps	%xmm8, 0xba0(%rbp)
145900783:     	movaps	%xmm8, 0xac0(%rbp)
14590078b:     	movups	%xmm8, 0xd00(%rbp)
145900793:     	movups	%xmm8, 0xd10(%rbp)
14590079b:     	movaps	%xmm8, 0xad0(%rbp)
1459007a3:     	movaps	%xmm8, 0xae0(%rbp)
1459007ab:     	movaps	%xmm8, 0xaf0(%rbp)
1459007b3:     	movaps	%xmm8, 0xb00(%rbp)
1459007bb:     	movaps	%xmm8, 0xb10(%rbp)
1459007c3:     	movups	0x10(%rbp), %xmm0
1459007c7:     	movups	0x20(%rbp), %xmm1
1459007cb:     	movups	%xmm1, 0x998(%rbp)
1459007d2:     	movups	%xmm0, 0x988(%rbp)
1459007d9:     	movb	$0x0, 0xaa3(%rbp)
1459007e0:     	movq	$0x1, 0x340(%rbp)
1459007eb:     	movq	0xc80(%rbp), %rax
1459007f2:     	movq	%rax, 0x348(%rbp)
1459007f9:     	movq	$0x1, 0x350(%rbp)
145900804:     	movq	$0x0, 0x358(%rbp)
14590080f:     	movq	$0x8, 0x360(%rbp)
14590081a:     	movq	$0x0, 0x368(%rbp)
145900825:     	movq	$0x0, 0x3a0(%rbp)
145900830:     	movq	$0x4, 0x3a8(%rbp)
14590083b:     	movq	$0x0, 0x3b0(%rbp)
145900846:     	movq	%rsi, 0x428(%rbp)
14590084d:     	movl	$0x1, 0x448(%rbp)
145900857:     	movsd	0x4734c1(%rip), %xmm0   # 0x145d73d20
14590085f:     	movsd	%xmm0, 0x44c(%rbp)
145900867:     	movq	$0x3f800000, 0x454(%rbp) # imm = 0x3F800000
145900872:     	movups	%xmm14, 0x45c(%rbp)
14590087a:     	movsd	%xmm12, 0x46c(%rbp)
145900883:     	movl	$0x0, 0x474(%rbp)
14590088d:     	movups	%xmm11, 0x478(%rbp)
145900895:     	movsd	%xmm12, 0x488(%rbp)
14590089e:     	movq	%r12, 0x490(%rbp)
1459008a5:     	movl	$0x0, 0x498(%rbp)
1459008af:     	movsd	0x5d6f89(%rip), %xmm0   # 0x145ed7840
1459008b7:     	movsd	%xmm0, 0x49c(%rbp)
1459008bf:     	movl	$0x0, 0x4a4(%rbp)
1459008c9:     	movss	%xmm13, 0x4a8(%rbp)
1459008d2:     	movaps	0x1577ab7(%rip), %xmm1  # 0x146e78390
1459008d9:     	movups	%xmm1, 0x4ac(%rbp)
1459008e0:     	movsd	0x1577ab8(%rip), %xmm1  # 0x146e783a0
1459008e8:     	movsd	%xmm1, 0x4bc(%rbp)
1459008f0:     	movl	$0x3f800000, 0x4c4(%rbp) # imm = 0x3F800000
1459008fa:     	movss	%xmm15, 0x4c8(%rbp)
145900903:     	movups	%xmm11, 0x4cc(%rbp)
14590090b:     	movups	%xmm8, 0x4e8(%rbp)
145900913:     	movups	%xmm8, 0x4dc(%rbp)
14590091b:     	movlps	%xmm6, 0x4f8(%rbp)
145900922:     	movss	%xmm7, 0x500(%rbp)
14590092a:     	movss	%xmm10, 0x504(%rbp)
145900933:     	movq	$0x1, 0x508(%rbp)
14590093e:     	movss	%xmm9, 0x510(%rbp)
145900947:     	movq	$0x0, 0x514(%rbp)
145900952:     	movaps	0xbf0(%rbp), %xmm1
145900959:     	movaps	0xc00(%rbp), %xmm2
145900960:     	movaps	0xc10(%rbp), %xmm3
145900967:     	movaps	0xc20(%rbp), %xmm4
14590096e:     	movups	%xmm1, 0x51c(%rbp)
145900975:     	movups	%xmm2, 0x52c(%rbp)
14590097c:     	movups	%xmm3, 0x53c(%rbp)
145900983:     	movups	%xmm4, 0x54c(%rbp)
14590098a:     	movups	0xc2c(%rbp), %xmm1
145900991:     	movups	%xmm1, 0x558(%rbp)
145900998:     	movq	$0x0, 0x568(%rbp)
1459009a3:     	movl	%edi, 0x570(%rbp)
1459009a9:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
1459009b3:     	movq	%rax, 0x574(%rbp)
1459009ba:     	movsd	0x15779ee(%rip), %xmm1  # 0x146e783b0
1459009c2:     	movsd	%xmm1, 0x57c(%rbp)
1459009ca:     	movq	$0x0, 0x588(%rbp)
1459009d5:     	movq	$0x8, 0x590(%rbp)
1459009e0:     	movups	%xmm8, 0x598(%rbp)
1459009e8:     	movq	$0x8, 0x5a8(%rbp)
1459009f3:     	movups	%xmm8, 0x5b0(%rbp)
1459009fb:     	movq	$0x8, 0x5c0(%rbp)
145900a06:     	movups	%xmm8, 0x5c8(%rbp)
145900a0e:     	movq	$0x8, 0x5d8(%rbp)
145900a19:     	movups	%xmm8, 0x5e0(%rbp)
145900a21:     	movq	$0x8, 0x5f0(%rbp)
145900a2c:     	movq	$0x0, 0x5f8(%rbp)
145900a37:     	movq	0xd20(%rbp), %rax
145900a3e:     	movq	%rax, 0x980(%rbp)
145900a45:     	movq	$0x0, 0x9a8(%rbp)
145900a50:     	movq	$0x0, 0xa1c(%rbp)
145900a5b:     	movq	$0x0, 0x600(%rbp)
145900a66:     	movq	$0x8, 0x608(%rbp)
145900a71:     	movups	%xmm8, 0x610(%rbp)
145900a79:     	movq	$0x8, 0x620(%rbp)
145900a84:     	movups	%xmm8, 0x628(%rbp)
145900a8c:     	movq	$0x8, 0x638(%rbp)
145900a97:     	movups	%xmm8, 0x640(%rbp)
145900a9f:     	movups	%xmm8, 0xa24(%rbp)
145900aa7:     	movq	$0x8, 0x650(%rbp)
145900ab2:     	movups	%xmm8, 0x658(%rbp)
145900aba:     	movq	$0x0, 0x30(%rbp)
145900ac2:     	movl	$0x0, 0xa34(%rbp)
145900acc:     	movq	$0x4, 0x668(%rbp)
145900ad7:     	movups	%xmm8, 0x670(%rbp)
145900adf:     	movq	$0x8, 0x680(%rbp)
145900aea:     	movq	$0x0, 0x688(%rbp)
145900af5:     	movq	$0x0, 0x40(%rbp)
145900afd:     	movl	$0x2328, 0xa38(%rbp)    # imm = 0x2328
145900b07:     	movl	$0x0, 0x938(%rbp)
145900b11:     	movq	$0x0, 0x940(%rbp)
145900b1c:     	movq	$0x1, 0x948(%rbp)
145900b27:     	movq	$0x0, 0x950(%rbp)
145900b32:     	movq	$0x0, 0x690(%rbp)
145900b3d:     	movq	$0x8, 0x698(%rbp)
145900b48:     	movaps	0xbb0(%rbp), %xmm1
145900b4f:     	movups	%xmm1, 0x6a0(%rbp)
145900b56:     	movq	$0x8, 0x6b0(%rbp)
145900b61:     	movaps	0xbc0(%rbp), %xmm1
145900b68:     	movups	%xmm1, 0x6b8(%rbp)
145900b6f:     	movq	$0x8, 0x6c8(%rbp)
145900b7a:     	movups	%xmm8, 0x6d0(%rbp)
145900b82:     	movq	$0x4, 0x6e0(%rbp)
145900b8d:     	movq	$0x0, 0x6e8(%rbp)
145900b98:     	movaps	0xbd0(%rbp), %xmm1
145900b9f:     	movups	%xmm1, 0x6f0(%rbp)
145900ba6:     	movq	0xbe0(%rbp), %rax
145900bad:     	movq	%rax, 0x700(%rbp)
145900bb4:     	movq	0xab8(%rbp), %rax
145900bbb:     	movq	%rax, 0x718(%rbp)
145900bc2:     	movups	0xaa8(%rbp), %xmm1
145900bc9:     	movups	%xmm1, 0x708(%rbp)
145900bd0:     	movq	$0x0, 0x728(%rbp)
145900bdb:     	movl	$0x2, 0x734(%rbp)
145900be5:     	movups	0xc48(%rbp), %xmm1
145900bec:     	movups	0xc58(%rbp), %xmm2
145900bf3:     	movups	%xmm2, 0x748(%rbp)
145900bfa:     	movups	%xmm1, 0x738(%rbp)
145900c01:     	movabsq	$0x10000000a, %rax      # imm = 0x10000000A
145900c0b:     	movq	%rax, 0xa3c(%rbp)
145900c12:     	movss	0x470022(%rip), %xmm1   # 0x145d70c3c
145900c1a:     	movlps	%xmm1, 0xa44(%rbp)
145900c21:     	movl	$0x42700000, 0xa4c(%rbp) # imm = 0x42700000
145900c2b:     	movb	$-0x1, 0xaa2(%rbp)
145900c32:     	movq	$0x0, 0x9b0(%rbp)
145900c3d:     	movl	0xc70(%rbp), %eax
145900c43:     	movl	%eax, 0xa58(%rbp)
145900c49:     	movq	0xc68(%rbp), %rax
145900c50:     	movq	%rax, 0xa50(%rbp)
145900c57:     	movsd	0x1577761(%rip), %xmm1  # 0x146e783c0
145900c5f:     	movsd	%xmm1, 0xa5c(%rbp)
145900c67:     	movl	$0x42700000, 0xa64(%rbp) # imm = 0x42700000
145900c71:     	movq	$0x0, 0x758(%rbp)
145900c7c:     	movq	$0x4, 0x760(%rbp)
145900c87:     	movq	$0x0, 0x768(%rbp)
145900c92:     	movl	$0x14, 0xa68(%rbp)
145900c9c:     	movl	$0x0, 0x958(%rbp)
145900ca6:     	movl	$0x0, 0x960(%rbp)
145900cb0:     	movl	$0x1, 0xa90(%rbp)
145900cba:     	movq	$0x0, 0x9d0(%rbp)
145900cc5:     	movb	$0x0, 0xa94(%rbp)
145900ccc:     	movups	%xmm8, 0x9b8(%rbp)
145900cd4:     	movsd	%xmm0, 0xa6c(%rbp)
145900cdc:     	movq	$0x0, 0x770(%rbp)
145900ce7:     	movq	$0x4, 0x778(%rbp)
145900cf2:     	movups	%xmm8, 0x780(%rbp)
145900cfa:     	movq	$0x4, 0x790(%rbp)
145900d05:     	movq	$0x0, 0x798(%rbp)
145900d10:     	movw	$0x0, 0xa95(%rbp)
145900d19:     	movl	$0xc1200000, 0xa74(%rbp) # imm = 0xC1200000
145900d23:     	movl	$0x0, 0x9e0(%rbp)
145900d2d:     	movl	$0x0, 0x968(%rbp)
145900d37:     	movl	$0x0, 0x970(%rbp)
145900d41:     	movl	$0x0, 0xa78(%rbp)
145900d4b:     	movl	$0x0, 0x9f4(%rbp)
145900d55:     	movl	$0x0, 0xa08(%rbp)
145900d5f:     	movl	$0x0, 0x978(%rbp)
145900d69:     	movl	$0x0, 0xa9a(%rbp)
145900d73:     	movl	$0x0, 0xa97(%rbp)
145900d7d:     	movsd	0x4b703b(%rip), %xmm0   # 0x145db7dc0
145900d85:     	movsd	%xmm0, 0xa7c(%rbp)
145900d8d:     	movq	$0x0, 0x9d8(%rbp)
145900d98:     	movaps	0xce0(%rbp), %xmm0
145900d9f:     	movups	%xmm0, 0x7f0(%rbp)
145900da6:     	movaps	0xcd0(%rbp), %xmm0
145900dad:     	movups	%xmm0, 0x7e0(%rbp)
145900db4:     	movaps	0xc90(%rbp), %xmm0
145900dbb:     	movaps	0xca0(%rbp), %xmm1
145900dc2:     	movaps	0xcb0(%rbp), %xmm2
145900dc9:     	movaps	0xcc0(%rbp), %xmm3
145900dd0:     	movups	%xmm3, 0x7d0(%rbp)
145900dd7:     	movups	%xmm2, 0x7c0(%rbp)
145900dde:     	movups	%xmm1, 0x7b0(%rbp)
145900de5:     	movups	%xmm0, 0x7a0(%rbp)
145900dec:     	movq	$0x0, 0x50(%rbp)
145900df4:     	movq	$0x0, 0x60(%rbp)
145900dfc:     	movq	$0x0, 0x70(%rbp)
145900e04:     	movq	$0x0, 0x80(%rbp)
145900e0f:     	movq	$0x8, 0x88(%rbp)
145900e1a:     	movaps	0xb20(%rbp), %xmm0
145900e21:     	movups	%xmm0, 0x90(%rbp)
145900e28:     	movq	$0x4, 0xa0(%rbp)
145900e33:     	movaps	0xb30(%rbp), %xmm0
145900e3a:     	movups	%xmm0, 0xa8(%rbp)
145900e41:     	movq	$0x4, 0xb8(%rbp)
145900e4c:     	movaps	0xb40(%rbp), %xmm0
145900e53:     	movups	%xmm0, 0xc0(%rbp)
145900e5a:     	movq	$0x8, 0xd0(%rbp)
145900e65:     	movaps	0xb50(%rbp), %xmm0
145900e6c:     	movups	%xmm0, 0xd8(%rbp)
145900e73:     	movq	$0x8, 0xe8(%rbp)
145900e7e:     	movaps	0xb60(%rbp), %xmm0
145900e85:     	movups	%xmm0, 0xf0(%rbp)
145900e8c:     	movq	$0x8, 0x100(%rbp)
145900e97:     	movaps	0xb70(%rbp), %xmm0
145900e9e:     	movups	%xmm0, 0x108(%rbp)
145900ea5:     	movq	$0x4, 0x118(%rbp)
145900eb0:     	movaps	0xb80(%rbp), %xmm0
145900eb7:     	movups	%xmm0, 0x120(%rbp)
145900ebe:     	movq	$0x4, 0x130(%rbp)
145900ec9:     	movaps	0xb90(%rbp), %xmm0
145900ed0:     	movups	%xmm0, 0x138(%rbp)
145900ed7:     	movq	$0x4, 0x148(%rbp)
145900ee2:     	movaps	0xba0(%rbp), %xmm0
145900ee9:     	movups	%xmm0, 0x150(%rbp)
145900ef0:     	movq	$0x4, 0x160(%rbp)
145900efb:     	movq	$0x0, 0x168(%rbp)
145900f06:     	movb	$0x2, 0x198(%rbp)
145900f0d:     	movq	$0x0, 0x800(%rbp)
145900f18:     	movups	%xmm8, 0x1b0(%rbp)
145900f20:     	movups	%xmm8, 0x1a0(%rbp)
145900f28:     	movq	$0x0, 0x1be(%rbp)
145900f33:     	movq	$0x8, 0x808(%rbp)
145900f3e:     	movaps	0xac0(%rbp), %xmm0
145900f45:     	movups	%xmm0, 0x810(%rbp)
145900f4c:     	movq	$0x4, 0x820(%rbp)
145900f57:     	movaps	0xad0(%rbp), %xmm0
145900f5e:     	movups	%xmm0, 0x828(%rbp)
145900f65:     	movq	$0x8, 0x838(%rbp)
145900f70:     	movaps	0xae0(%rbp), %xmm0
145900f77:     	movups	%xmm0, 0x840(%rbp)
145900f7e:     	movq	$0x8, 0x850(%rbp)
145900f89:     	movaps	0xaf0(%rbp), %xmm0
145900f90:     	movups	%xmm0, 0x858(%rbp)
145900f97:     	movq	$0x8, 0x868(%rbp)
145900fa2:     	movaps	0xb00(%rbp), %xmm0
145900fa9:     	movups	%xmm0, 0x870(%rbp)
145900fb0:     	movq	$0x8, 0x880(%rbp)
145900fbb:     	movaps	0xb10(%rbp), %xmm0
145900fc2:     	movups	%xmm0, 0x888(%rbp)
145900fc9:     	movq	$0x8, 0x898(%rbp)
145900fd4:     	movups	%xmm8, 0x8a0(%rbp)
145900fdc:     	movl	$0x0, 0x8b0(%rbp)
145900fe6:     	movq	0xd18(%rbp), %rax
145900fed:     	movq	%rax, 0x8d4(%rbp)
145900ff4:     	movups	0xcf8(%rbp), %xmm0
145900ffb:     	movups	0xd08(%rbp), %xmm1
145901002:     	movups	%xmm1, 0x8c4(%rbp)
145901009:     	movups	%xmm0, 0x8b4(%rbp)
145901010:     	movq	$0x0, 0x8e1(%rbp)
14590101b:     	movq	$0x0, 0x8dc(%rbp)
145901026:     	movl	$0x3f800000, 0xa84(%rbp) # imm = 0x3F800000
145901030:     	movq	$0x0, 0x8f0(%rbp)
14590103b:     	movq	$0x8, 0x8f8(%rbp)
145901046:     	movups	%xmm8, 0x900(%rbp)
14590104e:     	movq	$0x8, 0x910(%rbp)
145901059:     	movq	$0x0, 0x918(%rbp)
145901064:     	movl	0xc8c(%rbp), %eax
14590106a:     	movl	%eax, 0xa88(%rbp)
145901070:     	movl	$0xff000000, 0xa9e(%rbp) # imm = 0xFF000000
14590107a:     	movq	$0x0, 0x920(%rbp)
145901085:     	movq	$0x8, 0x928(%rbp)
145901090:     	movq	$0x0, 0x930(%rbp)
14590109b:     	movl	$0x0, 0xa8c(%rbp)
1459010a5:     	callq	0x140002200 <.text+0x1200>
1459010aa:     	movl	$0x10, %ecx
1459010af:     	movl	$0x8, %edx
1459010b4:     	callq	0x1400021c0 <.text+0x11c0>
1459010b9:     	testq	%rax, %rax
1459010bc:     	je	0x14590166a <.text+0x590066a>
1459010c2:     	movq	0x7d8(%rbp), %rdx
1459010c9:     	movq	0x7e0(%rbp), %rcx
1459010d0:     	movq	%rcx, %r8
1459010d3:     	shlq	$0x6, %r8
1459010d7:     	testq	%rcx, %rcx
1459010da:     	je	0x14590110b <.text+0x590010b>
1459010dc:     	xorl	%ecx, %ecx
1459010de:     	xorl	%r9d, %r9d
1459010e1:     	nopw	%cs:(%rax,%rax)
1459010f0:     	cmpb	$0x1c, (%rdx,%r9)
1459010f5:     	je	0x14590162f <.text+0x590062f>
1459010fb:     	addq	$0x40, %r9
1459010ff:     	cmpq	%r9, %r8
145901102:     	jne	0x1459010f0 <.text+0x59000f0>
145901104:     	testq	%rcx, %rcx
145901107:     	je	0x145901112 <.text+0x5900112>
145901109:     	jmp	0x14590111a <.text+0x590011a>
14590110b:     	xorl	%ecx, %ecx
14590110d:     	testq	%rcx, %rcx
145901110:     	jne	0x14590111a <.text+0x590011a>
145901112:     	movq	0x40(%rbx), %rcx
145901116:     	movq	0x48(%rbx), %r9
14590111a:     	movq	%rcx, (%rax)
14590111d:     	movq	%r9, 0x8(%rax)
145901121:     	movq	$0x1, 0xcf8(%rbp)
14590112c:     	movq	%rax, 0xd00(%rbp)
145901133:     	movq	$0x1, 0xd08(%rbp)
14590113e:     	addq	%rdx, %r8
145901141:     	movb	$0x1, 0xd47(%rbp)
145901148:     	leaq	0xc90(%rbp), %rcx
14590114f:     	callq	0x14599d990 <.text+0x599c990>
145901154:     	nop
145901155:     	movq	0xc90(%rbp), %rax
14590115c:     	movq	%rax, 0xd28(%rbp)
145901163:     	movq	0xc98(%rbp), %rax
14590116a:     	movq	%rax, 0xd30(%rbp)
145901171:     	movq	0xca0(%rbp), %rcx
145901178:     	testq	%rcx, %rcx
14590117b:     	je	0x145901248 <.text+0x5900248>
145901181:     	movq	%rcx, %rax
145901184:     	shlq	$0x4, %rax
145901188:     	movq	0xd30(%rbp), %r12
14590118f:     	addq	%r12, %rax
145901192:     	movq	%rax, 0xd20(%rbp)
145901199:     	movq	0xd08(%rbp), %r15
1459011a0:     	jmp	0x1459011d0 <.text+0x59001d0>
1459011a2:     	nopw	%cs:(%rax,%rax)
1459011b0:     	movq	%rbx, (%rdi,%r13)
1459011b4:     	movq	%r14, 0x8(%rdi,%r13)
1459011b9:     	incq	%r15
1459011bc:     	movq	%r15, 0xd08(%rbp)
1459011c3:     	addq	$0x10, %r12
1459011c7:     	cmpq	0xd20(%rbp), %r12
1459011ce:     	je	0x145901248 <.text+0x5900248>
1459011d0:     	movq	(%r12), %rbx
1459011d4:     	movq	0x8(%r12), %r14
1459011d9:     	movq	0xd00(%rbp), %rdi
1459011e0:     	movq	%r15, %r13
1459011e3:     	shlq	$0x4, %r13
1459011e7:     	testq	%r15, %r15
1459011ea:     	je	0x145901226 <.text+0x5900226>
1459011ec:     	xorl	%esi, %esi
1459011ee:     	jmp	0x1459011f9 <.text+0x59001f9>
1459011f0:     	addq	$0x10, %rsi
1459011f4:     	cmpq	%rsi, %r13
1459011f7:     	je	0x145901220 <.text+0x5900220>
1459011f9:     	cmpq	%r14, 0x8(%rdi,%rsi)
1459011fe:     	jne	0x1459011f0 <.text+0x59001f0>
145901200:     	movq	(%rdi,%rsi), %rcx
145901204:     	movq	%rbx, %rdx
145901207:     	movq	%r14, %r8
14590120a:     	callq	0x145bc9787 <.text+0x5bc8787>
14590120f:     	testl	%eax, %eax
145901211:     	jne	0x1459011f0 <.text+0x59001f0>
145901213:     	jmp	0x1459011c3 <.text+0x59001c3>
145901215:     	nopw	%cs:(%rax,%rax)
145901220:     	cmpq	$0x5, %r15
145901224:     	ja	0x1459011c3 <.text+0x59001c3>
145901226:     	cmpq	0xcf8(%rbp), %r15
14590122d:     	jne	0x1459011b0 <.text+0x59001b0>
14590122f:     	leaq	0xcf8(%rbp), %rcx
145901236:     	callq	0x145bcb680 <.text+0x5bca680>
14590123b:     	nop
14590123c:     	movq	0xd00(%rbp), %rdi
145901243:     	jmp	0x1459011b0 <.text+0x59001b0>
145901248:     	movq	0xd28(%rbp), %rdx
14590124f:     	testq	%rdx, %rdx
145901252:     	je	0x14590126a <.text+0x590026a>
145901254:     	shlq	$0x4, %rdx
145901258:     	movl	$0x8, %r8d
14590125e:     	movq	0xd30(%rbp), %rcx
145901265:     	callq	0x1400021d0 <.text+0x11d0>
14590126a:     	movq	0xcf8(%rbp), %rax
145901271:     	movq	0xd00(%rbp), %rcx
145901278:     	movq	0xd08(%rbp), %rdx
14590127f:     	shlq	$0x4, %rdx
145901283:     	addq	%rcx, %rdx
145901286:     	movq	%rcx, 0xc90(%rbp)
14590128d:     	movq	%rcx, 0xc98(%rbp)
145901294:     	movq	%rax, 0xca0(%rbp)
14590129b:     	movq	%rdx, 0xca8(%rbp)
1459012a2:     	leaq	0x30(%rbp), %rsi
1459012a6:     	movq	%rsi, 0xcb0(%rbp)
1459012ad:     	movb	$0x0, 0xd47(%rbp)
1459012b4:     	leaq	0xbf0(%rbp), %rcx
1459012bb:     	leaq	0xc90(%rbp), %rdx
1459012c2:     	callq	0x1459a9580 <.text+0x59a8580>
1459012c7:     	nop
1459012c8:     	leaq	0x340(%rbp), %rdi
1459012cf:     	movq	0x340(%rbp), %rax
1459012d6:     	testq	%rax, %rax
1459012d9:     	je	0x1459012f1 <.text+0x59002f1>
1459012db:     	movq	0x348(%rbp), %rcx
1459012e2:     	imulq	$0x68, %rax, %rdx
1459012e6:     	movl	$0x8, %r8d
1459012ec:     	callq	0x1400021d0 <.text+0x11d0>
1459012f1:     	movq	0xc00(%rbp), %rax
1459012f8:     	movq	%rax, 0x10(%rdi)
1459012fc:     	movups	0xbf0(%rbp), %xmm0
145901303:     	movups	%xmm0, (%rdi)
145901306:     	movq	0x7e0(%rbp), %rdi
14590130d:     	leaq	(,%rdi,4), %rbx
145901315:     	testq	%rdi, %rdi
145901318:     	je	0x1459015f9 <.text+0x59005f9>
14590131e:     	callq	0x140002200 <.text+0x1200>
145901323:     	movl	$0x4, %edx
145901328:     	movq	%rbx, %rcx
14590132b:     	callq	0x1400021f0 <.text+0x11f0>
145901330:     	testq	%rax, %rax
145901333:     	je	0x1459016fb <.text+0x59006fb>
145901339:     	movq	%rax, %r14
14590133c:     	movq	0x98(%rbp), %rdx
145901343:     	testq	%rdx, %rdx
145901346:     	je	0x14590135e <.text+0x590035e>
145901348:     	movq	0xa0(%rbp), %rcx
14590134f:     	shlq	$0x2, %rdx
145901353:     	movl	$0x4, %r8d
145901359:     	callq	0x1400021d0 <.text+0x11d0>
14590135e:     	movq	%rdi, 0x98(%rbp)
145901365:     	movq	%r14, 0xa0(%rbp)
14590136c:     	movq	%rdi, 0xa8(%rbp)
145901373:     	testq	%rdi, %rdi
145901376:     	je	0x145901614 <.text+0x5900614>
14590137c:     	callq	0x140002200 <.text+0x1200>
145901381:     	movl	$0x4, %edx
145901386:     	movq	%rbx, %rcx
145901389:     	callq	0x1400021f0 <.text+0x11f0>
14590138e:     	testq	%rax, %rax
145901391:     	je	0x145901712 <.text+0x5900712>
145901397:     	movq	%rax, %r14
14590139a:     	movq	0xb0(%rbp), %rdx
1459013a1:     	testq	%rdx, %rdx
1459013a4:     	je	0x1459013bc <.text+0x59003bc>
1459013a6:     	movq	0xb8(%rbp), %rcx
1459013ad:     	shlq	$0x2, %rdx
1459013b1:     	movl	$0x4, %r8d
1459013b7:     	callq	0x1400021d0 <.text+0x11d0>
1459013bc:     	movq	%rdi, 0xb0(%rbp)
1459013c3:     	movq	%r14, 0xb8(%rbp)
1459013ca:     	movq	%rdi, 0xc0(%rbp)
1459013d1:     	movq	$0x0, 0xc90(%rbp)
1459013dc:     	movq	$0x4, 0xc98(%rbp)
1459013e7:     	movq	$0x0, 0xca0(%rbp)
1459013f2:     	movb	$0x0, 0xd47(%rbp)
1459013f9:     	leaq	0xbf0(%rbp), %rcx
145901400:     	leaq	0xc90(%rbp), %rdx
145901407:     	movq	%rdi, %r8
14590140a:     	callq	0x1459975f0 <.text+0x59965f0>
14590140f:     	nop
145901410:     	movq	0xd8(%rbp), %rdi
145901417:     	testq	%rdi, %rdi
14590141a:     	je	0x145901456 <.text+0x5900456>
14590141c:     	movq	0xd0(%rbp), %rbx
145901423:     	addq	$0x8, %rbx
145901427:     	jmp	0x145901439 <.text+0x5900439>
145901429:     	nopl	(%rax)
145901430:     	addq	$0x18, %rbx
145901434:     	decq	%rdi
145901437:     	je	0x145901456 <.text+0x5900456>
145901439:     	movq	-0x8(%rbx), %rdx
14590143d:     	testq	%rdx, %rdx
145901440:     	je	0x145901430 <.text+0x5900430>
145901442:     	movq	(%rbx), %rcx
145901445:     	shlq	$0x2, %rdx
145901449:     	movl	$0x4, %r8d
14590144f:     	callq	0x1400021d0 <.text+0x11d0>
145901454:     	jmp	0x145901430 <.text+0x5900430>
145901456:     	leaq	0xc8(%rbp), %rdi
14590145d:     	movq	0xc8(%rbp), %rax
145901464:     	testq	%rax, %rax
145901467:     	je	0x145901483 <.text+0x5900483>
145901469:     	movq	0xd0(%rbp), %rcx
145901470:     	shlq	$0x3, %rax
145901474:     	leaq	(%rax,%rax,2), %rdx
145901478:     	movl	$0x8, %r8d
14590147e:     	callq	0x1400021d0 <.text+0x11d0>
145901483:     	movq	0xc00(%rbp), %rax
14590148a:     	movq	%rax, 0x10(%rdi)
14590148e:     	movups	0xbf0(%rbp), %xmm0
145901495:     	movups	%xmm0, (%rdi)
145901498:     	movq	0x7d8(%rbp), %rdx
14590149f:     	movq	0x7e0(%rbp), %r8
1459014a6:     	shlq	$0x6, %r8
1459014aa:     	addq	%rdx, %r8
1459014ad:     	movb	$0x0, 0xd47(%rbp)
1459014b4:     	leaq	0xc90(%rbp), %rcx
1459014bb:     	callq	0x14599e640 <.text+0x599d640>
1459014c0:     	nop
1459014c1:     	movq	0xc90(%rbp), %rax
1459014c8:     	movq	0xc98(%rbp), %rcx
1459014cf:     	movq	0xca0(%rbp), %rdx
1459014d6:     	leaq	(%rdx,%rdx,2), %rdx
1459014da:     	leaq	(%rcx,%rdx,8), %rdx
1459014de:     	movq	%rcx, 0xc90(%rbp)
1459014e5:     	movq	%rcx, 0xc98(%rbp)
1459014ec:     	movq	%rax, 0xca0(%rbp)
1459014f3:     	movq	%rdx, 0xca8(%rbp)
1459014fa:     	movq	%rsi, 0xcb0(%rbp)
145901501:     	movb	$0x0, 0xd47(%rbp)
145901508:     	leaq	0xbf0(%rbp), %rcx
14590150f:     	leaq	0xc90(%rbp), %rdx
145901516:     	callq	0x1459a9920 <.text+0x59a8920>
14590151b:     	nop
14590151c:     	leaq	0xe0(%rbp), %rsi
145901523:     	movq	0xe0(%rbp), %rax
14590152a:     	testq	%rax, %rax
14590152d:     	je	0x145901545 <.text+0x5900545>
14590152f:     	movq	0xe8(%rbp), %rcx
145901536:     	imulq	$0x70, %rax, %rdx
14590153a:     	movl	$0x8, %r8d
145901540:     	callq	0x1400021d0 <.text+0x11d0>
145901545:     	movq	0xc00(%rbp), %rax
14590154c:     	movq	%rax, 0x10(%rsi)
145901550:     	movups	0xbf0(%rbp), %xmm0
145901557:     	movups	%xmm0, (%rsi)
14590155a:     	movb	$0x0, 0xd47(%rbp)
145901561:     	leaq	0x30(%rbp), %rcx
145901565:     	callq	0x1458f96f0 <.text+0x58f86f0>
14590156a:     	nop
14590156b:     	movss	0x4a8(%rbp), %xmm0
145901573:     	movss	%xmm0, 0x510(%rbp)
14590157b:     	leaq	0x30(%rbp), %rdx
14590157f:     	movl	$0xa78, %r8d            # imm = 0xA78
145901585:     	movq	0xbe8(%rbp), %rsi
14590158c:     	movq	%rsi, %rcx
14590158f:     	callq	0x145bc977b <.text+0x5bc877b>
145901594:     	movq	%rsi, %rax
145901597:     	movaps	0xd50(%rbp), %xmm6
14590159e:     	movaps	0xd60(%rbp), %xmm7
1459015a5:     	movaps	0xd70(%rbp), %xmm8
1459015ad:     	movaps	0xd80(%rbp), %xmm9
1459015b5:     	movaps	0xd90(%rbp), %xmm10
1459015bd:     	movaps	0xda0(%rbp), %xmm11
1459015c5:     	movaps	0xdb0(%rbp), %xmm12
1459015cd:     	movaps	0xdc0(%rbp), %xmm13
1459015d5:     	movaps	0xdd0(%rbp), %xmm14
1459015dd:     	movaps	0xde0(%rbp), %xmm15
1459015e5:     	addq	$0xe78, %rsp            # imm = 0xE78
1459015ec:     	popq	%rbx
1459015ed:     	popq	%rdi
1459015ee:     	popq	%rsi
1459015ef:     	popq	%r12
1459015f1:     	popq	%r13
1459015f3:     	popq	%r14
1459015f5:     	popq	%r15
1459015f7:     	popq	%rbp
1459015f8:     	retq
1459015f9:     	movl	$0x4, %r14d
1459015ff:     	movq	0x98(%rbp), %rdx
145901606:     	testq	%rdx, %rdx
145901609:     	jne	0x145901348 <.text+0x5900348>
14590160f:     	jmp	0x14590135e <.text+0x590035e>
145901614:     	movl	$0x4, %r14d
14590161a:     	movq	0xb0(%rbp), %rdx
145901621:     	testq	%rdx, %rdx
145901624:     	jne	0x1459013a6 <.text+0x59003a6>
14590162a:     	jmp	0x1459013bc <.text+0x59003bc>
14590162f:     	movq	0x8(%rdx,%r9), %rcx
145901634:     	movq	0x10(%rdx,%r9), %r9
145901639:     	testq	%rcx, %rcx
14590163c:     	je	0x145901112 <.text+0x5900112>
145901642:     	jmp	0x14590111a <.text+0x590011a>
145901647:     	movb	$0x1, 0xd46(%rbp)
14590164e:     	movb	$0x1, 0xd45(%rbp)
145901655:     	movl	$0x8, %ecx
14590165a:     	movl	$0x68, %edx
14590165f:     	callq	0x145d69431 <.text+0x5d68431>
145901664:     	nop
145901665:     	jmp	0x145901727 <.text+0x5900727>
14590166a:     	movl	$0x8, %ecx
14590166f:     	movl	$0x10, %edx
145901674:     	callq	0x145d69431 <.text+0x5d68431>
145901679:     	nop
14590167a:     	jmp	0x145901727 <.text+0x5900727>
14590167f:     	leaq	0xc90(%rbp), %rax
145901686:     	movq	%rax, 0x30(%rbp)
14590168a:     	leaq	-0x58ff5d1(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145901691:     	movq	%rax, 0x38(%rbp)
145901695:     	movb	$0x1, 0xd46(%rbp)
14590169c:     	movb	$0x1, 0xd45(%rbp)
1459016a3:     	leaq	0x12aa60e(%rip), %rcx   # 0x146babcb8
1459016aa:     	leaq	0x12aa617(%rip), %r8    # 0x146babcc8
1459016b1:     	leaq	0x30(%rbp), %rdx
1459016b5:     	callq	0x145d699c0 <.text+0x5d689c0>
1459016ba:     	nop
1459016bb:     	jmp	0x145901727 <.text+0x5900727>
1459016bd:     	leaq	0xc90(%rbp), %rax
1459016c4:     	movq	%rax, 0x30(%rbp)
1459016c8:     	leaq	-0x58ff60f(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1459016cf:     	movq	%rax, 0x38(%rbp)
1459016d3:     	movb	$0x1, 0xd46(%rbp)
1459016da:     	movb	$0x1, 0xd45(%rbp)
1459016e1:     	leaq	0x12aa5d0(%rip), %rcx   # 0x146babcb8
1459016e8:     	leaq	0x12aa5d9(%rip), %r8    # 0x146babcc8
1459016ef:     	leaq	0x30(%rbp), %rdx
1459016f3:     	callq	0x145d699c0 <.text+0x5d689c0>
1459016f8:     	nop
1459016f9:     	jmp	0x145901727 <.text+0x5900727>
1459016fb:     	movb	$0x0, 0xd47(%rbp)
145901702:     	movl	$0x4, %ecx
145901707:     	movq	%rbx, %rdx
14590170a:     	callq	0x145d6944b <.text+0x5d6844b>
14590170f:     	nop
145901710:     	jmp	0x145901727 <.text+0x5900727>
145901712:     	movb	$0x0, 0xd47(%rbp)
145901719:     	movl	$0x4, %ecx
14590171e:     	movq	%rbx, %rdx
145901721:     	callq	0x145d6944b <.text+0x5d6844b>
145901726:     	nop
145901727:     	ud2
