
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140247090:     	pushq	%rbp
140247091:     	pushq	%r15
140247093:     	pushq	%r14
140247095:     	pushq	%r13
140247097:     	pushq	%r12
140247099:     	pushq	%rsi
14024709a:     	pushq	%rdi
14024709b:     	pushq	%rbx
14024709c:     	subq	$0x938, %rsp            # imm = 0x938
1402470a3:     	leaq	0x80(%rsp), %rbp
1402470ab:     	movaps	%xmm9, 0x8a0(%rbp)
1402470b3:     	movaps	%xmm8, 0x890(%rbp)
1402470bb:     	movdqa	%xmm7, 0x880(%rbp)
1402470c3:     	movdqa	%xmm6, 0x870(%rbp)
1402470cb:     	movq	$-0x2, 0x868(%rbp)
1402470d6:     	movq	%r9, %r15
1402470d9:     	movq	%r8, %r14
1402470dc:     	movq	%rdx, %rsi
1402470df:     	movq	%rcx, %rdi
1402470e2:     	movss	0x930(%rbp), %xmm8
1402470eb:     	movl	0x928(%rbp), %ebx
1402470f1:     	movq	0x920(%rbp), %r12
1402470f8:     	movq	0x118(%r12), %rax
140247100:     	movzbl	0x39(%rax), %edx
140247104:     	movl	%ebx, %ecx
140247106:     	callq	0x145471640 <.text+0x5470640>
14024710b:     	leaq	0x1f0(%rbp), %rcx
140247112:     	movl	%eax, %edx
140247114:     	callq	0x14546f110 <.text+0x546e110>
140247119:     	cmpq	$-0x1, 0x1f0(%rbp)
140247121:     	je	0x1402479bb <.text+0x2469bb>
140247127:     	movups	0x250(%rbp), %xmm0
14024712e:     	movaps	%xmm0, 0x6e0(%rbp)
140247135:     	movups	0x240(%rbp), %xmm0
14024713c:     	movaps	%xmm0, 0x6d0(%rbp)
140247143:     	movups	0x230(%rbp), %xmm0
14024714a:     	movaps	%xmm0, 0x6c0(%rbp)
140247151:     	movdqu	0x1f0(%rbp), %xmm0
140247159:     	movdqu	0x200(%rbp), %xmm1
140247161:     	movdqu	0x210(%rbp), %xmm2
140247169:     	movups	0x220(%rbp), %xmm3
140247170:     	movaps	%xmm3, 0x6b0(%rbp)
140247177:     	movdqa	%xmm2, 0x6a0(%rbp)
14024717f:     	movdqa	%xmm1, 0x690(%rbp)
140247187:     	movdqa	%xmm0, 0x680(%rbp)
14024718f:     	movq	0x120(%r12), %rcx
140247197:     	movl	%ebx, %edx
140247199:     	callq	0x14542f520 <.text+0x542e520>
14024719e:     	nop
14024719f:     	cmpl	%ebx, 0x4c(%r15)
1402471a3:     	sete	%r13b
1402471a7:     	andb	0x48(%r15), %r13b
1402471ab:     	movb	%al, 0x867(%rbp)
1402471b1:     	movq	0x6b0(%rbp), %rcx
1402471b8:     	decq	%rcx
1402471bb:     	cmpq	$0x4, %rcx
1402471bf:     	ja	0x140247254 <.text+0x246254>
1402471c5:     	leaq	0x5709cb0(%rip), %rdx   # 0x145950e7c
1402471cc:     	movslq	(%rdx,%rcx,4), %rcx
1402471d0:     	addq	%rdx, %rcx
1402471d3:     	jmpq	*%rcx
1402471d5:     	movsd	0x56f8b53(%rip), %xmm2  # 0x14593fd30
1402471dd:     	movq	0x57040ab(%rip), %xmm1  # 0x14594b290
1402471e5:     	xorps	%xmm3, %xmm3
1402471e8:     	pxor	%xmm0, %xmm0
1402471ec:     	jmp	0x140247273 <.text+0x246273>
1402471f1:     	cmpl	$0x2, 0x6d8(%rbp)
1402471f8:     	jne	0x140247218 <.text+0x246218>
1402471fa:     	movsd	0x56f870e(%rip), %xmm2  # 0x14593f910
140247202:     	movq	0x5704006(%rip), %xmm1  # 0x14594b210
14024720a:     	pxor	%xmm0, %xmm0
14024720e:     	movss	0x56f870a(%rip), %xmm3  # 0x14593f920
140247216:     	jmp	0x140247273 <.text+0x246273>
140247218:     	movsd	0x56f8af0(%rip), %xmm2  # 0x14593fd10
140247220:     	movq	0x5704018(%rip), %xmm1  # 0x14594b240
140247228:     	movd	0x5704020(%rip), %xmm0  # 0x14594b250
140247230:     	jmp	0x14024724a <.text+0x24624a>
140247232:     	movsd	0x56f8ae6(%rip), %xmm2  # 0x14593fd20
14024723a:     	movq	0x570402e(%rip), %xmm1  # 0x14594b270
140247242:     	movd	0x56f8d96(%rip), %xmm0  # 0x14593ffe0
14024724a:     	movss	0x56c023e(%rip), %xmm3  # 0x145907490
140247252:     	jmp	0x140247273 <.text+0x246273>
140247254:     	movaps	0x56f8aa5(%rip), %xmm2  # 0x14593fd00
14024725b:     	movdqa	0x5703f8d(%rip), %xmm1  # 0x14594b1f0
140247263:     	movd	0x56cc0d9(%rip), %xmm0  # 0x145913344
14024726b:     	movss	0x56f86bd(%rip), %xmm3  # 0x14593f930
140247273:     	movl	$0x0, 0x850(%rbp)
14024727d:     	movlps	%xmm2, 0x854(%rbp)
140247284:     	movss	%xmm3, 0x85c(%rbp)
14024728c:     	movl	$0x3f800000, 0x860(%rbp) # imm = 0x3F800000
140247296:     	testb	%r13b, %r13b
140247299:     	jne	0x1402472df <.text+0x2462df>
14024729b:     	movd	0x56f903d(%rip), %xmm7  # 0x1459402e0
1402472a3:     	movzbl	%r13b, %ecx
1402472a7:     	movd	%ecx, %xmm2
1402472ab:     	testb	%al, %al
1402472ad:     	jne	0x1402472f3 <.text+0x2462f3>
1402472af:     	pshufd	$0x0, %xmm2, %xmm6      # xmm6 = xmm2[0,0,0,0]
1402472b4:     	pslld	$0x1f, %xmm6
1402472b9:     	psrad	$0x1f, %xmm6
1402472be:     	movdqa	%xmm6, %xmm0
1402472c2:     	pandn	0x57072b6(%rip), %xmm0  # 0x14594e580
1402472ca:     	pand	0x56f8cfe(%rip), %xmm6  # 0x14593ffd0
1402472d2:     	por	%xmm0, %xmm6
1402472d6:     	leaq	0x57084a7(%rip), %rax   # 0x14594f784
1402472dd:     	jmp	0x140247333 <.text+0x246333>
1402472df:     	movd	0x5703f69(%rip), %xmm7  # 0x14594b250
1402472e7:     	movzbl	%r13b, %ecx
1402472eb:     	movd	%ecx, %xmm2
1402472ef:     	testb	%al, %al
1402472f1:     	je	0x1402472af <.text+0x2462af>
1402472f3:     	pshufd	$0x44, %xmm2, %xmm2     # xmm2 = xmm2[0,1,0,1]
1402472f8:     	pshufd	$0xe8, %xmm2, %xmm6     # xmm6 = xmm2[0,2,2,3]
1402472fd:     	pslld	$0x1f, %xmm6
140247302:     	psrad	$0x1f, %xmm6
140247307:     	movdqa	%xmm6, %xmm2
14024730b:     	pandn	%xmm1, %xmm2
14024730f:     	pand	0x56f8cb9(%rip), %xmm6  # 0x14593ffd0
140247317:     	testb	%r13b, %r13b
14024731a:     	je	0x140247324 <.text+0x246324>
14024731c:     	movd	0x5703f2c(%rip), %xmm0  # 0x14594b250
140247324:     	por	%xmm2, %xmm6
140247328:     	leaq	0x850(%rbp), %rax
14024732f:     	movdqa	%xmm0, %xmm7
140247333:     	movl	0x10(%rax), %ecx
140247336:     	movl	%ecx, 0x810(%rbp)
14024733c:     	movups	(%rax), %xmm0
14024733f:     	movaps	%xmm0, 0x800(%rbp)
140247346:     	movw	$0x0, 0x644(%rbp)
14024734f:     	movb	$0x1, 0x634(%rbp)
140247356:     	xorps	%xmm0, %xmm0
140247359:     	movups	%xmm0, 0x548(%rbp)
140247360:     	movups	%xmm0, 0x558(%rbp)
140247367:     	movl	$0x1, 0x568(%rbp)
140247371:     	movss	%xmm8, 0x56c(%rbp)
14024737a:     	movl	$0x1, 0x570(%rbp)
140247384:     	movss	%xmm8, 0x574(%rbp)
14024738d:     	movq	$0x0, 0x540(%rbp)
140247398:     	movups	%xmm0, 0x578(%rbp)
14024739f:     	movups	%xmm0, 0x588(%rbp)
1402473a6:     	movl	$0x5000005, 0x65a(%rbp) # imm = 0x5000005
1402473b0:     	movups	0x5708259(%rip), %xmm0  # 0x14594f610
1402473b7:     	movups	%xmm0, 0x598(%rbp)
1402473be:     	movups	0x570825b(%rip), %xmm0  # 0x14594f620
1402473c5:     	movups	%xmm0, 0x5a8(%rbp)
1402473cc:     	movups	0x570825d(%rip), %xmm0  # 0x14594f630
1402473d3:     	movups	%xmm0, 0x5b8(%rbp)
1402473da:     	movups	0x570825f(%rip), %xmm0  # 0x14594f640
1402473e1:     	movups	%xmm0, 0x5c8(%rbp)
1402473e8:     	movaps	0x56f8401(%rip), %xmm0  # 0x14593f7f0
1402473ef:     	movups	%xmm0, 0x5d8(%rbp)
1402473f6:     	movups	%xmm0, 0x5e8(%rbp)
1402473fd:     	movaps	0x56bfefc(%rip), %xmm0  # 0x145907300
140247404:     	movups	%xmm0, 0x5f8(%rbp)
14024740b:     	movups	%xmm0, 0x608(%rbp)
140247412:     	movq	$0x0, 0x638(%rbp)
14024741d:     	movl	$0x0, 0x640(%rbp)
140247427:     	movaps	0x56c0092(%rip), %xmm0  # 0x1459074c0
14024742e:     	movups	%xmm0, 0x618(%rbp)
140247435:     	movl	$0x1, 0x628(%rbp)
14024743f:     	movq	$0x0, 0x62c(%rbp)
14024744a:     	movq	$0x0, 0x652(%rbp)
140247455:     	movups	0x57080fc(%rip), %xmm0  # 0x14594f558
14024745c:     	movaps	%xmm0, 0x4e0(%rbp)
140247463:     	movq	$0x0, 0x4f0(%rbp)
14024746e:     	movups	0x57080fb(%rip), %xmm0  # 0x14594f570
140247475:     	movups	%xmm0, 0x4f8(%rbp)
14024747c:     	movq	$0x0, 0x508(%rbp)
140247487:     	movups	0x57080fa(%rip), %xmm0  # 0x14594f588
14024748e:     	movaps	%xmm0, 0x510(%rbp)
140247495:     	movq	$0x0, 0x520(%rbp)
1402474a0:     	movdqu	0x57080f8(%rip), %xmm0  # 0x14594f5a0
1402474a8:     	movdqu	%xmm0, 0x528(%rbp)
1402474b0:     	movq	$0x0, 0x538(%rbp)
1402474bb:     	movw	$0x0, 0x64a(%rbp)
1402474c4:     	movl	$0x10000, 0x646(%rbp)   # imm = 0x10000
1402474ce:     	movw	$0x0, 0x650(%rbp)
1402474d7:     	movl	$0x10000, 0x64c(%rbp)   # imm = 0x10000
1402474e1:     	movl	0x6d4(%rbp), %ecx
1402474e7:     	callq	0x1454709b0 <.text+0x546f9b0>
1402474ec:     	nop
1402474ed:     	movq	%rdx, %r9
1402474f0:     	testq	%rax, %rax
1402474f3:     	cmoveq	%rax, %r9
1402474f7:     	movl	$0x1, %r8d
1402474fd:     	cmovneq	%rax, %r8
140247501:     	leaq	0x1f0(%rbp), %rcx
140247508:     	movq	%r14, %rdx
14024750b:     	callq	0x1400b6b20 <.text+0xb5b20>
140247510:     	nop
140247511:     	movzbl	0x867(%rbp), %eax
140247518:     	movss	0x56bff70(%rip), %xmm0  # 0x145907490
140247520:     	movaps	%xmm0, %xmm1
140247523:     	testl	%eax, %eax
140247525:     	jne	0x14024752f <.text+0x24652f>
140247527:     	movss	0x5707061(%rip), %xmm1  # 0x14594e590
14024752f:     	jne	0x140247539 <.text+0x246539>
140247531:     	movss	0x56bffff(%rip), %xmm0  # 0x145907538
140247539:     	movups	0x570826c(%rip), %xmm2  # 0x14594f7ac
140247540:     	movups	%xmm2, 0x7b0(%rbp)
140247547:     	movabsq	$0x23f800000, %rcx      # imm = 0x23F800000
140247551:     	movq	%rcx, 0x7c0(%rbp)
140247558:     	movups	0x5708261(%rip), %xmm2  # 0x14594f7c0
14024755f:     	movups	%xmm2, 0x798(%rbp)
140247566:     	movq	$0x46, 0x7a8(%rbp)
140247571:     	movb	$0x2, 0x778(%rbp)
140247578:     	movw	$0x0, 0x7fc(%rbp)
140247581:     	movl	$0x0, 0x7e8(%rbp)
14024758b:     	movl	%eax, 0x728(%rbp)
140247591:     	movss	%xmm1, 0x72c(%rbp)
140247599:     	movss	%xmm0, 0x730(%rbp)
1402475a1:     	movss	%xmm0, 0x734(%rbp)
1402475a9:     	movl	$0x3f800000, 0x738(%rbp) # imm = 0x3F800000
1402475b3:     	movups	0x1f0(%rbp), %xmm0
1402475ba:     	movaps	%xmm0, 0x710(%rbp)
1402475c1:     	movq	0x200(%rbp), %rcx
1402475c8:     	movq	%rcx, 0x720(%rbp)
1402475cf:     	movzbl	0x778(%rbp), %ecx
1402475d6:     	movb	%cl, 0x6f0(%rbp)
1402475dc:     	movq	0x779(%rbp), %rcx
1402475e3:     	movq	%rcx, 0x6f1(%rbp)
1402475ea:     	movl	0x781(%rbp), %ecx
1402475f0:     	movl	%ecx, 0x6f9(%rbp)
1402475f6:     	movzwl	0x785(%rbp), %ecx
1402475fd:     	movw	%cx, 0x6fd(%rbp)
140247604:     	movzbl	0x787(%rbp), %ecx
14024760b:     	movb	%cl, 0x6ff(%rbp)
140247611:     	movups	0x788(%rbp), %xmm0
140247618:     	movdqu	0x7c4(%rbp), %xmm1
140247620:     	movdqu	0x7d4(%rbp), %xmm2
140247628:     	movaps	%xmm0, 0x700(%rbp)
14024762f:     	movw	$0x0, 0x774(%rbp)
140247638:     	movups	0x7e8(%rbp), %xmm0
14024763f:     	movaps	%xmm0, 0x760(%rbp)
140247646:     	movl	0x7f8(%rbp), %ecx
14024764c:     	movl	%ecx, 0x770(%rbp)
140247652:     	movdqu	%xmm1, 0x73c(%rbp)
14024765a:     	movdqu	%xmm2, 0x74c(%rbp)
140247662:     	movl	0x7e4(%rbp), %ecx
140247668:     	movl	%ecx, 0x75c(%rbp)
14024766e:     	testb	%r13b, %r13b
140247671:     	je	0x14024769b <.text+0x24669b>
140247673:     	movdqu	0x5708071(%rip), %xmm0  # 0x14594f6ec
14024767b:     	movdqa	%xmm0, -0x30(%rbp)
140247680:     	movl	$0x3f4ccccd, -0x20(%rbp) # imm = 0x3F4CCCCD
140247687:     	movss	0x56cbc64(%rip), %xmm8  # 0x1459132f4
140247690:     	movss	0x56ce21f(%rip), %xmm9  # 0x1459158b8
140247699:     	jmp	0x1402476d6 <.text+0x2466d6>
14024769b:     	testb	%al, %al
14024769d:     	je	0x1402476b5 <.text+0x2466b5>
14024769f:     	movdqu	0x850(%rbp), %xmm0
1402476a7:     	movdqa	%xmm0, -0x30(%rbp)
1402476ac:     	movl	$0x3e800000, -0x20(%rbp) # imm = 0x3E800000
1402476b3:     	jmp	0x1402476c9 <.text+0x2466c9>
1402476b5:     	movdqu	0x570811b(%rip), %xmm0  # 0x14594f7d8
1402476bd:     	movdqa	%xmm0, -0x30(%rbp)
1402476c2:     	movl	$0x3f59999a, -0x20(%rbp) # imm = 0x3F59999A
1402476c9:     	xorps	%xmm8, %xmm8
1402476cd:     	movss	0x56f810a(%rip), %xmm9  # 0x14593f7e0
1402476d6:     	leaq	0x820(%rbp), %rcx
1402476dd:     	leaq	-0x30(%rbp), %rdx
1402476e1:     	callq	0x144c8c290 <.text+0x4c8b290>
1402476e6:     	nop
1402476e7:     	movdqa	0x820(%rbp), %xmm0
1402476ef:     	movdqu	%xmm0, 0x1f4(%rbp)
1402476f7:     	movl	$0x1, 0x1f0(%rbp)
140247701:     	movss	%xmm9, 0x48(%rsp)
140247708:     	movss	%xmm8, 0x38(%rsp)
14024770f:     	movl	$0x1, 0x40(%rsp)
140247717:     	movl	$0x1, 0x30(%rsp)
14024771f:     	movl	$0x0, 0x28(%rsp)
140247727:     	movl	$0x1, 0x20(%rsp)
14024772f:     	leaq	0x668(%rbp), %rcx
140247736:     	leaq	0x1f0(%rbp), %rdx
14024773d:     	xorps	%xmm3, %xmm3
140247740:     	movl	$0x1, %r8d
140247746:     	callq	0x14265f6a0 <.text+0x265e6a0>
14024774b:     	nop
14024774c:     	movl	0x810(%rbp), %eax
140247752:     	movl	%eax, 0x49c(%rbp)
140247758:     	movaps	0x800(%rbp), %xmm0
14024775f:     	movups	%xmm0, 0x48c(%rbp)
140247766:     	leaq	-0x30(%rbp), %r14
14024776a:     	leaq	0x4e0(%rbp), %rdx
140247771:     	movl	$0x180, %r8d            # imm = 0x180
140247777:     	movq	%r14, %rcx
14024777a:     	callq	0x1457731ed <.text+0x57721ed>
14024777f:     	leaq	0x168(%rbp), %rcx
140247786:     	leaq	0x6f0(%rbp), %rdx
14024778d:     	movl	$0x88, %r8d
140247793:     	callq	0x1457731ed <.text+0x57721ed>
140247798:     	movups	0x668(%rbp), %xmm0
14024779f:     	movups	%xmm0, 0x150(%rbp)
1402477a6:     	movq	0x678(%rbp), %rax
1402477ad:     	movq	%rax, 0x160(%rbp)
1402477b4:     	movups	0x5708031(%rip), %xmm0  # 0x14594f7ec
1402477bb:     	movups	%xmm0, 0x823(%rbp)
1402477c2:     	movups	0x5708033(%rip), %xmm0  # 0x14594f7fc
1402477c9:     	movups	%xmm0, 0x833(%rbp)
1402477d0:     	movq	(%rdi), %r15
1402477d3:     	addq	$0x8, %rdi
1402477d7:     	leaq	0x1f8(%rbp), %rcx
1402477de:     	movl	$0x220, %r8d            # imm = 0x220
1402477e4:     	movq	%r14, %rdx
1402477e7:     	callq	0x1457731ed <.text+0x57721ed>
1402477ec:     	movl	$0x0, 0x418(%rbp)
1402477f6:     	movq	%xmm6, 0x41c(%rbp)
1402477fe:     	movd	%xmm7, 0x424(%rbp)
140247806:     	movq	$0x3f800000, 0x428(%rbp) # imm = 0x3F800000
140247811:     	movq	%xmm6, 0x430(%rbp)
140247819:     	movd	%xmm7, 0x438(%rbp)
140247821:     	movq	$0x3f800000, 0x43c(%rbp) # imm = 0x3F800000
14024782c:     	movq	%xmm6, 0x444(%rbp)
140247834:     	movd	%xmm7, 0x44c(%rbp)
14024783c:     	movq	$0x3f800000, 0x450(%rbp) # imm = 0x3F800000
140247847:     	movq	%xmm6, 0x458(%rbp)
14024784f:     	movd	%xmm7, 0x460(%rbp)
140247857:     	movabsq	$0x63f800000, %rax      # imm = 0x63F800000
140247861:     	movq	%rax, 0x464(%rbp)
140247868:     	movl	%ebx, 0x46c(%rbp)
14024786e:     	movl	$0x0, 0x478(%rbp)
140247878:     	movq	%xmm6, 0x47c(%rbp)
140247880:     	movd	%xmm7, 0x484(%rbp)
140247888:     	movl	$0x3f800000, 0x488(%rbp) # imm = 0x3F800000
140247892:     	movl	$0x40000000, 0x4a0(%rbp) # imm = 0x40000000
14024789c:     	movups	0x5707ef5(%rip), %xmm0  # 0x14594f798
1402478a3:     	movups	%xmm0, 0x4a4(%rbp)
1402478aa:     	movl	$0x3f800000, 0x4b4(%rbp) # imm = 0x3F800000
1402478b4:     	movb	$0x2, 0x4b8(%rbp)
1402478bb:     	movdqu	0x820(%rbp), %xmm0
1402478c3:     	movdqu	0x830(%rbp), %xmm1
1402478cb:     	movdqu	%xmm0, 0x4b9(%rbp)
1402478d3:     	movdqu	%xmm1, 0x4c9(%rbp)
1402478db:     	movl	0x83f(%rbp), %eax
1402478e1:     	movl	%eax, 0x4d8(%rbp)
1402478e7:     	movq	%r15, 0x1f0(%rbp)
1402478ee:     	leaq	0x57042f3(%rip), %r9    # 0x14594bbe8
1402478f5:     	leaq	0x4e0(%rbp), %rcx
1402478fc:     	leaq	0x1f0(%rbp), %r8
140247903:     	movq	%rdi, %rdx
140247906:     	callq	0x1400e32f0 <.text+0xe22f0>
14024790b:     	nop
14024790c:     	leaq	0x867(%rbp), %rax
140247913:     	movq	%rax, 0x1f0(%rbp)
14024791a:     	movq	%rsi, 0x1f8(%rbp)
140247921:     	leaq	0x930(%rbp), %rax
140247928:     	movq	%rax, 0x200(%rbp)
14024792f:     	movq	%r12, 0x208(%rbp)
140247936:     	leaq	0x928(%rbp), %rax
14024793d:     	movq	%rax, 0x210(%rbp)
140247944:     	leaq	0x4e0(%rbp), %rcx
14024794b:     	leaq	0x1f0(%rbp), %rdx
140247952:     	callq	0x140128200 <.text+0x127200>
140247957:     	nop
140247958:     	cmpb	$0x0, 0x798(%rbp)
14024795f:     	jne	0x14024797b <.text+0x24697b>
140247961:     	movq	0x7a0(%rbp), %rax
140247968:     	lock
140247969:     	decq	(%rax)
14024796c:     	jne	0x14024797b <.text+0x24697b>
14024796e:     	leaq	0x7a0(%rbp), %rcx
140247975:     	callq	0x1449aac80 <.text+0x49a9c80>
14024797a:     	nop
14024797b:     	movq	0x680(%rbp), %rdx
140247982:     	testq	%rdx, %rdx
140247985:     	je	0x140247999 <.text+0x246999>
140247987:     	movq	0x688(%rbp), %rcx
14024798e:     	movl	$0x1, %r8d
140247994:     	callq	0x1400021d0 <.text+0x11d0>
140247999:     	movq	0x698(%rbp), %rdx
1402479a0:     	testq	%rdx, %rdx
1402479a3:     	je	0x1402479bb <.text+0x2469bb>
1402479a5:     	movq	0x6a0(%rbp), %rcx
1402479ac:     	shlq	$0x3, %rdx
1402479b0:     	movl	$0x4, %r8d
1402479b6:     	callq	0x1400021d0 <.text+0x11d0>
1402479bb:     	movaps	0x870(%rbp), %xmm6
1402479c2:     	movaps	0x880(%rbp), %xmm7
1402479c9:     	movaps	0x890(%rbp), %xmm8
1402479d1:     	movaps	0x8a0(%rbp), %xmm9
1402479d9:     	addq	$0x938, %rsp            # imm = 0x938
1402479e0:     	popq	%rbx
1402479e1:     	popq	%rdi
1402479e2:     	popq	%rsi
1402479e3:     	popq	%r12
1402479e5:     	popq	%r13
1402479e7:     	popq	%r14
1402479e9:     	popq	%r15
1402479eb:     	popq	%rbp
1402479ec:     	retq
