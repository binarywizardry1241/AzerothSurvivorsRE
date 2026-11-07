
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145476fe0:     	pushq	%rbp
145476fe1:     	pushq	%r15
145476fe3:     	pushq	%r14
145476fe5:     	pushq	%r13
145476fe7:     	pushq	%r12
145476fe9:     	pushq	%rsi
145476fea:     	pushq	%rdi
145476feb:     	pushq	%rbx
145476fec:     	subq	$0x318, %rsp            # imm = 0x318
145476ff3:     	leaq	0x80(%rsp), %rbp
145476ffb:     	movaps	%xmm14, 0x280(%rbp)
145477003:     	movaps	%xmm13, 0x270(%rbp)
14547700b:     	movaps	%xmm12, 0x260(%rbp)
145477013:     	movaps	%xmm11, 0x250(%rbp)
14547701b:     	movaps	%xmm10, 0x240(%rbp)
145477023:     	movaps	%xmm9, 0x230(%rbp)
14547702b:     	movaps	%xmm8, 0x220(%rbp)
145477033:     	movaps	%xmm7, 0x210(%rbp)
14547703a:     	movaps	%xmm6, 0x200(%rbp)
145477041:     	movq	$-0x2, 0x1f8(%rbp)
14547704c:     	movq	%r8, %r12
14547704f:     	movq	%rcx, 0x8(%rbp)
145477053:     	movq	(%rdx), %rdi
145477056:     	movss	(%r8), %xmm6
14547705b:     	movss	0x4(%r8), %xmm8
145477061:     	movss	0x44(%rdi), %xmm7
145477066:     	movss	0x10(%rdx), %xmm11
14547706c:     	movq	%rdx, 0x1b8(%rbp)
145477073:     	movss	0x38(%rdx), %xmm10
145477079:     	movzbl	0x75(%rdi), %eax
14547707d:     	addb	$-0x2, %al
14547707f:     	cmpb	$0x6, %al
145477081:     	ja	0x145477094 <.text+0x5476094>
145477083:     	movzbl	%al, %eax
145477086:     	leaq	0x1532ee7(%rip), %rcx   # 0x1469a9f74
14547708d:     	movss	(%rcx,%rax,4), %xmm0
145477092:     	jmp	0x14547709c <.text+0x547609c>
145477094:     	movss	0x4743e4(%rip), %xmm0   # 0x1458eb480
14547709c:     	movq	0x1b8(%rbp), %rax
1454770a3:     	movss	0x4c(%rax), %xmm1
1454770a8:     	mulss	%xmm6, %xmm1
1454770ac:     	xorps	%xmm2, %xmm2
1454770af:     	cmpltss	%xmm7, %xmm2
1454770b4:     	andps	%xmm1, %xmm2
1454770b7:     	mulss	0x481c81(%rip), %xmm7   # 0x1458f8d40
1454770bf:     	mulss	%xmm11, %xmm7
1454770c4:     	mulss	%xmm10, %xmm7
1454770c9:     	mulss	%xmm0, %xmm7
1454770cd:     	addss	%xmm2, %xmm7
1454770d1:     	mulss	%xmm8, %xmm7
1454770d6:     	leaq	0x1531dd9(%rip), %rbx   # 0x1469a8eb6
1454770dd:     	movl	$0x15, %r15d
1454770e3:     	movl	$0x15, %edx
1454770e8:     	movq	%rbx, %rcx
1454770eb:     	callq	0x145452400 <.text+0x5451400>
1454770f0:     	movq	%rax, %r14
1454770f3:     	movq	%rdx, %rsi
1454770f6:     	leaq	0x1e0(%rbp), %r13
1454770fd:     	movq	%r13, %rcx
145477100:     	movaps	%xmm7, %xmm1
145477103:     	callq	0x14547ccf0 <.text+0x547bcf0>
145477108:     	movzbl	0x74(%rdi), %ecx
14547710c:     	callq	0x145476f40 <.text+0x5475f40>
145477111:     	nop
145477112:     	testq	%r14, %r14
145477115:     	cmoveq	%r15, %rsi
145477119:     	cmovneq	%r14, %rbx
14547711d:     	movq	%rax, 0x1c0(%rbp)
145477124:     	movq	%rdx, 0x1c8(%rbp)
14547712b:     	leaq	0x1531d99(%rip), %r14   # 0x1469a8ecb
145477132:     	movq	%r14, 0xb0(%rbp)
145477139:     	movq	$0x3, 0xb8(%rbp)
145477144:     	movq	%r13, 0xc0(%rbp)
14547714b:     	leaq	0x1517b56(%rip), %rax   # 0x14698eca8
145477152:     	movq	%rax, 0xc8(%rbp)
145477159:     	leaq	0x1531d6e(%rip), %rax   # 0x1469a8ece
145477160:     	movq	%rax, 0xd0(%rbp)
145477167:     	movq	$0x6, 0xd8(%rbp)
145477172:     	leaq	0x1c0(%rbp), %rax
145477179:     	movq	%rax, 0xe0(%rbp)
145477180:     	leaq	0x1517bf1(%rip), %rax   # 0x14698ed78
145477187:     	movq	%rax, 0xe8(%rbp)
14547718e:     	movq	$0x2, 0x20(%rsp)
145477197:     	leaq	-0x40(%rbp), %r15
14547719b:     	leaq	0xb0(%rbp), %r9
1454771a2:     	movq	%r15, %rcx
1454771a5:     	movq	%rbx, %rdx
1454771a8:     	movq	%rsi, %r8
1454771ab:     	callq	0x145452790 <.text+0x5451790>
1454771b0:     	nop
1454771b1:     	movq	0x1e0(%rbp), %rdx
1454771b8:     	testq	%rdx, %rdx
1454771bb:     	je	0x1454771cf <.text+0x54761cf>
1454771bd:     	movq	0x1e8(%rbp), %rcx
1454771c4:     	movl	$0x1, %r8d
1454771ca:     	callq	0x1400021d0 <.text+0x11d0>
1454771cf:     	movl	0x54(%rdi), %eax
1454771d2:     	testl	%eax, %eax
1454771d4:     	je	0x1454771f2 <.text+0x54761f2>
1454771d6:     	movq	0x1b8(%rbp), %rcx
1454771dd:     	addl	0x18(%rcx), %eax
1454771e0:     	addl	0x40(%rcx), %eax
1454771e3:     	movl	0x34(%r12), %ecx
1454771e8:     	leal	(%rax,%rcx), %edx
1454771eb:     	cmpl	$0x1, %edx
1454771ee:     	adcl	%ecx, %eax
1454771f0:     	jmp	0x1454771f7 <.text+0x54761f7>
1454771f2:     	movl	$0x1, %eax
1454771f7:     	movl	%eax, 0x1dc(%rbp)
1454771fd:     	movss	0x4c(%rdi), %xmm1
145477202:     	leaq	0x18(%rbp), %rcx
145477206:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547720b:     	nop
14547720c:     	movq	0x1b8(%rbp), %rax
145477213:     	movss	0x1c(%rax), %xmm12
145477219:     	mulss	0x44(%rax), %xmm12
14547721f:     	movss	0x50(%rdi), %xmm0
145477224:     	mulss	%xmm12, %xmm0
145477229:     	movss	0x28(%r12), %xmm9
145477230:     	mulss	%xmm9, %xmm0
145477235:     	movss	0x7851d6(%rip), %xmm13  # 0x145bfc414
14547723e:     	ucomiss	%xmm0, %xmm13
145477242:     	jae	0x14547726c <.text+0x547626c>
145477244:     	addss	0x1517984(%rip), %xmm0  # 0x14698ebd0
14547724c:     	movss	0x481b8b(%rip), %xmm14  # 0x1458f8de0
145477255:     	divss	%xmm14, %xmm0
14547725a:     	callq	0x145756f57 <.text+0x5755f57>
14547725f:     	mulss	%xmm14, %xmm0
145477264:     	addss	0x7851a8(%rip), %xmm0   # 0x145bfc414
14547726c:     	leaq	-0x58(%rbp), %r13
145477270:     	movq	%r13, %rcx
145477273:     	movaps	%xmm0, %xmm1
145477276:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547727b:     	nop
14547727c:     	leaq	0x1531c51(%rip), %rsi   # 0x1469a8ed4
145477283:     	movl	$0x26, %ebx
145477288:     	movl	$0x26, %edx
14547728d:     	movq	%rsi, %rcx
145477290:     	callq	0x145452400 <.text+0x5451400>
145477295:     	nop
145477296:     	testq	%rax, %rax
145477299:     	cmovneq	%rax, %rsi
14547729d:     	cmoveq	%rbx, %rdx
1454772a1:     	movq	%rsi, 0x38(%rbp)
1454772a5:     	movq	%rdx, 0x40(%rbp)
1454772a9:     	movzbl	0x75(%rdi), %eax
1454772ad:     	leaq	0x1532e6c(%rip), %rcx   # 0x1469aa120
1454772b4:     	movslq	(%rcx,%rax,4), %rax
1454772b8:     	addq	%rcx, %rax
1454772bb:     	jmpq	*%rax
1454772bd:     	movl	$0x1, %ebx
1454772c2:     	cmpq	$0xa, 0x8(%rdi)
1454772c7:     	jne	0x1454772ec <.text+0x54762ec>
1454772c9:     	movq	(%rdi), %rax
1454772cc:     	movabsq	$0x68735f64656d6961, %rcx # imm = 0x68735F64656D6961
1454772d6:     	xorq	(%rax), %rcx
1454772d9:     	movzwl	0x8(%rax), %eax
1454772dd:     	xorq	$0x746f, %rax           # imm = 0x746F
1454772e3:     	orq	%rcx, %rax
1454772e6:     	je	0x145478905 <.text+0x5477905>
1454772ec:     	xorl	%edx, %edx
1454772ee:     	movq	%rbx, 0x1c0(%rbp)
1454772f5:     	movq	%rdx, 0x1c8(%rbp)
1454772fc:     	cmpl	$0x1, 0x1dc(%rbp)
145477303:     	jbe	0x145478945 <.text+0x5477945>
145477309:     	leaq	0x1531c72(%rip), %r12   # 0x1469a8f82
145477310:     	movl	$0x40, %edx
145477315:     	movq	%r12, %rcx
145477318:     	callq	0x145452400 <.text+0x5451400>
14547731d:     	nop
14547731e:     	movq	%rax, %rsi
145477321:     	movq	%rdx, %rbx
145477324:     	movl	0x1dc(%rbp), %edx
14547732a:     	leaq	0x1e0(%rbp), %r14
145477331:     	movq	%r14, %rcx
145477334:     	xorl	%r8d, %r8d
145477337:     	callq	0x145484c20 <.text+0x5483c20>
14547733c:     	nop
14547733d:     	testq	%rsi, %rsi
145477340:     	movl	$0x40, %eax
145477345:     	cmoveq	%rax, %rbx
145477349:     	cmovneq	%rsi, %r12
14547734d:     	leaq	0x1531c16(%rip), %rax   # 0x1469a8f6a
145477354:     	movq	%rax, 0xb0(%rbp)
14547735b:     	movq	$0x7, 0xb8(%rbp)
145477366:     	movq	%r14, 0xc0(%rbp)
14547736d:     	leaq	0x1517934(%rip), %rcx   # 0x14698eca8
145477374:     	movq	%rcx, 0xc8(%rbp)
14547737b:     	leaq	0x1531bef(%rip), %rax   # 0x1469a8f71
145477382:     	movq	%rax, 0xd0(%rbp)
145477389:     	movq	$0x5, 0xd8(%rbp)
145477394:     	leaq	0x18(%rbp), %rax
145477398:     	movq	%rax, 0xe0(%rbp)
14547739f:     	movq	%rcx, 0xe8(%rbp)
1454773a6:     	leaq	0x1531bc9(%rip), %rax   # 0x1469a8f76
1454773ad:     	movq	%rax, 0xf0(%rbp)
1454773b4:     	movq	$0x3, 0xf8(%rbp)
1454773bf:     	movq	%r15, 0x100(%rbp)
1454773c6:     	movq	%rcx, 0x108(%rbp)
1454773cd:     	leaq	0x1531ba5(%rip), %rax   # 0x1469a8f79
1454773d4:     	movq	%rax, 0x110(%rbp)
1454773db:     	movq	$0x5, 0x118(%rbp)
1454773e6:     	leaq	0x38(%rbp), %rax
1454773ea:     	movq	%rax, 0x120(%rbp)
1454773f1:     	leaq	0x1517980(%rip), %rcx   # 0x14698ed78
1454773f8:     	movq	%rcx, 0x128(%rbp)
1454773ff:     	leaq	0x1531b78(%rip), %rax   # 0x1469a8f7e
145477406:     	movq	%rax, 0x130(%rbp)
14547740d:     	movq	$0x4, 0x138(%rbp)
145477418:     	leaq	0x1c0(%rbp), %rax
14547741f:     	movq	%rax, 0x140(%rbp)
145477426:     	movq	%rcx, 0x148(%rbp)
14547742d:     	movq	$0x5, 0x20(%rsp)
145477436:     	leaq	0x90(%rbp), %rcx
14547743d:     	leaq	0xb0(%rbp), %r9
145477444:     	movq	%r12, %rdx
145477447:     	movq	%rbx, %r8
14547744a:     	callq	0x145452790 <.text+0x5451790>
14547744f:     	nop
145477450:     	jmp	0x145478a8c <.text+0x5477a8c>
145477455:     	leaq	0x90(%rbp), %rcx
14547745c:     	movq	0x1b8(%rbp), %rdx
145477463:     	movq	%r12, %r8
145477466:     	callq	0x1454d7be0 <.text+0x54d6be0>
14547746b:     	nop
14547746c:     	jmp	0x145479236 <.text+0x5478236>
145477471:     	leaq	0x1531de3(%rip), %rbx   # 0x1469a925b
145477478:     	movl	$0x90, %esi
14547747d:     	movl	$0x90, %edx
145477482:     	movq	%rbx, %rcx
145477485:     	callq	0x145452400 <.text+0x5451400>
14547748a:     	nop
14547748b:     	movq	%rdx, %r8
14547748e:     	testq	%rax, %rax
145477491:     	cmovneq	%rax, %rbx
145477495:     	cmoveq	%rsi, %r8
145477499:     	movl	0x1dc(%rbp), %eax
14547749f:     	decl	%eax
1454774a1:     	movl	%eax, 0x1c0(%rbp)
1454774a7:     	leaq	0x1531ac3(%rip), %rax   # 0x1469a8f71
1454774ae:     	movq	%rax, 0xb0(%rbp)
1454774b5:     	movq	$0x5, 0xb8(%rbp)
1454774c0:     	leaq	0x18(%rbp), %rax
1454774c4:     	movq	%rax, 0xc0(%rbp)
1454774cb:     	leaq	0x15177d6(%rip), %rcx   # 0x14698eca8
1454774d2:     	movq	%rcx, 0xc8(%rbp)
1454774d9:     	leaq	0x1531a96(%rip), %rax   # 0x1469a8f76
1454774e0:     	movq	%rax, 0xd0(%rbp)
1454774e7:     	movq	$0x3, 0xd8(%rbp)
1454774f2:     	movq	%r15, 0xe0(%rbp)
1454774f9:     	movq	%rcx, 0xe8(%rbp)
145477500:     	leaq	0x15177c1(%rip), %rax   # 0x14698ecc8
145477507:     	movq	%rax, 0xf0(%rbp)
14547750e:     	movq	$0x1, 0xf8(%rbp)
145477519:     	leaq	0x1c0(%rbp), %rax
145477520:     	movq	%rax, 0x100(%rbp)
145477527:     	leaq	0x1531942(%rip), %rax   # 0x1469a8e70
14547752e:     	movq	%rax, 0x108(%rbp)
145477535:     	leaq	0x1531c13(%rip), %rax   # 0x1469a914f
14547753c:     	movq	%rax, 0x110(%rbp)
145477543:     	movq	$0x1, 0x118(%rbp)
14547754e:     	movq	%r13, 0x120(%rbp)
145477555:     	movq	%rcx, 0x128(%rbp)
14547755c:     	movq	$0x4, 0x20(%rsp)
145477565:     	leaq	0x1e0(%rbp), %rcx
14547756c:     	leaq	0xb0(%rbp), %r9
145477573:     	movq	%rbx, %rdx
145477576:     	callq	0x145452790 <.text+0x5451790>
14547757b:     	nop
14547757c:     	movq	0x38(%rbp), %r14
145477580:     	movq	0x40(%rbp), %rbx
145477584:     	movq	0x1e0(%rbp), %rax
14547758b:     	movq	0x1f0(%rbp), %rsi
145477592:     	subq	%rsi, %rax
145477595:     	cmpq	%rax, %rbx
145477598:     	ja	0x14547a04c <.text+0x547904c>
14547759e:     	testq	%rbx, %rbx
1454775a1:     	je	0x1454775b8 <.text+0x54765b8>
1454775a3:     	movq	0x1e8(%rbp), %rcx
1454775aa:     	addq	%rsi, %rcx
1454775ad:     	movq	%r14, %rdx
1454775b0:     	movq	%rbx, %r8
1454775b3:     	callq	0x145756ddd <.text+0x5755ddd>
1454775b8:     	addq	%rbx, %rsi
1454775bb:     	movups	0x1e0(%rbp), %xmm0
1454775c2:     	movaps	%xmm0, 0x90(%rbp)
1454775c9:     	movq	%rsi, 0xa0(%rbp)
1454775d0:     	jmp	0x145479236 <.text+0x5478236>
1454775d5:     	movss	0x58(%rdi), %xmm1
1454775da:     	mulss	0x48175e(%rip), %xmm1   # 0x1458f8d40
1454775e2:     	movq	0x1b8(%rbp), %rax
1454775e9:     	mulss	0x20(%rax), %xmm1
1454775ee:     	mulss	0x48(%rax), %xmm1
1454775f3:     	leaq	0x60(%rbp), %r14
1454775f7:     	movq	%r14, %rcx
1454775fa:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454775ff:     	nop
145477600:     	leaq	0x15325cf(%rip), %rsi   # 0x1469a9bd6
145477607:     	movl	$0x24, %ebx
14547760c:     	movl	$0x24, %edx
145477611:     	movq	%rsi, %rcx
145477614:     	callq	0x145452400 <.text+0x5451400>
145477619:     	nop
14547761a:     	testq	%rax, %rax
14547761d:     	cmovneq	%rax, %rsi
145477621:     	cmoveq	%rbx, %rdx
145477625:     	movq	%rsi, 0x48(%rbp)
145477629:     	movq	%rdx, 0x50(%rbp)
14547762d:     	movl	0x68(%rdi), %eax
145477630:     	leal	-0x1(%rax), %ecx
145477633:     	cmpl	$0x9, %ecx
145477636:     	ja	0x145478ae4 <.text+0x5477ae4>
14547763c:     	movq	0x1b8(%rbp), %rdx
145477643:     	movss	0x50(%rdx), %xmm7
145477648:     	leaq	0x1532b01(%rip), %rdx   # 0x1469aa150
14547764f:     	movslq	(%rdx,%rcx,4), %rcx
145477653:     	addq	%rdx, %rcx
145477656:     	jmpq	*%rcx
145477658:     	leaq	0x15327a0(%rip), %rsi   # 0x1469a9dff
14547765f:     	movl	$0x10, %ebx
145477664:     	movl	$0x10, %edx
145477669:     	movq	%rsi, %rcx
14547766c:     	callq	0x145452400 <.text+0x5451400>
145477671:     	nop
145477672:     	movq	%rdx, %r8
145477675:     	testq	%rax, %rax
145477678:     	cmovneq	%rax, %rsi
14547767c:     	cmoveq	%rbx, %r8
145477680:     	leaq	0x1531bcc(%rip), %rax   # 0x1469a9253
145477687:     	movq	%rax, 0xb0(%rbp)
14547768e:     	movq	$0x3, 0xb8(%rbp)
145477699:     	movq	%r14, 0xc0(%rbp)
1454776a0:     	leaq	0x1517601(%rip), %rax   # 0x14698eca8
1454776a7:     	movq	%rax, 0xc8(%rbp)
1454776ae:     	movq	$0x1, 0x20(%rsp)
1454776b7:     	leaq	0x90(%rbp), %rcx
1454776be:     	leaq	0xb0(%rbp), %r9
1454776c5:     	movq	%rsi, %rdx
1454776c8:     	callq	0x145452790 <.text+0x5451790>
1454776cd:     	nop
1454776ce:     	jmp	0x14547886c <.text+0x547786c>
1454776d3:     	leaq	0x1531a45(%rip), %rsi   # 0x1469a911f
1454776da:     	movl	$0x30, %ebx
1454776df:     	movl	$0x30, %edx
1454776e4:     	movq	%rsi, %rcx
1454776e7:     	callq	0x145452400 <.text+0x5451400>
1454776ec:     	nop
1454776ed:     	movq	%rdx, %r8
1454776f0:     	testq	%rax, %rax
1454776f3:     	cmovneq	%rax, %rsi
1454776f7:     	cmoveq	%rbx, %r8
1454776fb:     	leaq	0x1531a4d(%rip), %rax   # 0x1469a914f
145477702:     	movq	%rax, 0xb0(%rbp)
145477709:     	movq	$0x1, 0xb8(%rbp)
145477714:     	movq	%r13, 0xc0(%rbp)
14547771b:     	leaq	0x1517586(%rip), %rcx   # 0x14698eca8
145477722:     	movq	%rcx, 0xc8(%rbp)
145477729:     	leaq	0x1531846(%rip), %rax   # 0x1469a8f76
145477730:     	movq	%rax, 0xd0(%rbp)
145477737:     	movq	$0x3, 0xd8(%rbp)
145477742:     	movq	%r15, 0xe0(%rbp)
145477749:     	movq	%rcx, 0xe8(%rbp)
145477750:     	movq	$0x2, 0x20(%rsp)
145477759:     	leaq	0x90(%rbp), %rcx
145477760:     	leaq	0xb0(%rbp), %r9
145477767:     	movq	%rsi, %rdx
14547776a:     	callq	0x145452790 <.text+0x5451790>
14547776f:     	nop
145477770:     	jmp	0x145479236 <.text+0x5478236>
145477775:     	movss	0x58(%rdi), %xmm1
14547777a:     	movss	0x4815bd(%rip), %xmm8   # 0x1458f8d40
145477783:     	mulss	%xmm1, %xmm8
145477788:     	movq	0x1b8(%rbp), %rax
14547778f:     	mulss	0x20(%rax), %xmm8
145477795:     	mulss	0x48(%rax), %xmm8
14547779b:     	movl	0x5c(%rdi), %eax
14547779e:     	cmpl	$0x1, %eax
1454777a1:     	adcl	$0x0, %eax
1454777a4:     	cvtsi2ss	%rax, %xmm10
1454777a9:     	movaps	%xmm8, %xmm0
1454777ad:     	mulss	%xmm10, %xmm0
1454777b2:     	maxss	0x4d7b56(%rip), %xmm1   # 0x14594f310
1454777ba:     	divss	%xmm1, %xmm0
1454777be:     	callq	0x145756e1f <.text+0x5755e1f>
1454777c3:     	movaps	%xmm0, %xmm9
1454777c7:     	xorps	%xmm0, %xmm0
1454777ca:     	ucomiss	0x4c(%rdi), %xmm0
1454777ce:     	jae	0x14547806e <.text+0x547706e>
1454777d4:     	leaq	0x1531975(%rip), %rsi   # 0x1469a9150
1454777db:     	movl	$0x38, %ebx
1454777e0:     	movl	$0x38, %edx
1454777e5:     	movq	%rsi, %rcx
1454777e8:     	callq	0x145452400 <.text+0x5451400>
1454777ed:     	nop
1454777ee:     	movq	%rdx, %r8
1454777f1:     	testq	%rax, %rax
1454777f4:     	cmovneq	%rax, %rsi
1454777f8:     	cmoveq	%rbx, %r8
1454777fc:     	leaq	0x153176e(%rip), %rax   # 0x1469a8f71
145477803:     	movq	%rax, 0xb0(%rbp)
14547780a:     	movq	$0x5, 0xb8(%rbp)
145477815:     	leaq	0x18(%rbp), %rax
145477819:     	movq	%rax, 0xc0(%rbp)
145477820:     	leaq	0x1517481(%rip), %rax   # 0x14698eca8
145477827:     	movq	%rax, 0xc8(%rbp)
14547782e:     	movq	$0x1, 0x20(%rsp)
145477837:     	leaq	0x48(%rbp), %rcx
14547783b:     	leaq	0xb0(%rbp), %r9
145477842:     	movq	%rsi, %rdx
145477845:     	callq	0x145452790 <.text+0x5451790>
14547784a:     	nop
14547784b:     	jmp	0x1454780e1 <.text+0x54770e1>
145477850:     	leaq	0x1531c5b(%rip), %r12   # 0x1469a94b2
145477857:     	movl	$0xb0, %esi
14547785c:     	movl	$0xb0, %edx
145477861:     	movq	%r12, %rcx
145477864:     	callq	0x145452400 <.text+0x5451400>
145477869:     	nop
14547786a:     	movq	%rdx, %r13
14547786d:     	testq	%rax, %rax
145477870:     	cmovneq	%rax, %r12
145477874:     	cmoveq	%rsi, %r13
145477878:     	cmpl	$0x1, 0x1dc(%rbp)
14547787f:     	jne	0x145478539 <.text+0x5477539>
145477885:     	leaq	0x1531cd6(%rip), %rsi   # 0x1469a9562
14547788c:     	movl	$0x8, %edx
145477891:     	movq	%rsi, %rcx
145477894:     	callq	0x145452400 <.text+0x5451400>
145477899:     	nop
14547789a:     	movq	%rdx, %rbx
14547789d:     	testq	%rax, %rax
1454778a0:     	cmovneq	%rax, %rsi
1454778a4:     	movl	$0x8, %eax
1454778a9:     	cmoveq	%rax, %rbx
1454778ad:     	testq	%rbx, %rbx
1454778b0:     	jns	0x1454788c6 <.text+0x54778c6>
1454778b6:     	xorl	%ecx, %ecx
1454778b8:     	movq	%rbx, %rdx
1454778bb:     	callq	0x1458e721b <.text+0x58e621b>
1454778c0:     	nop
1454778c1:     	jmp	0x14547a0ca <.text+0x54790ca>
1454778c6:     	cmpl	$0x1, 0x1dc(%rbp)
1454778cd:     	jne	0x145478323 <.text+0x5477323>
1454778d3:     	leaq	0x15316e8(%rip), %rsi   # 0x1469a8fc2
1454778da:     	movl	$0x33, %ebx
1454778df:     	movl	$0x33, %edx
1454778e4:     	movq	%rsi, %rcx
1454778e7:     	callq	0x145452400 <.text+0x5451400>
1454778ec:     	nop
1454778ed:     	movq	%rdx, %r8
1454778f0:     	testq	%rax, %rax
1454778f3:     	cmovneq	%rax, %rsi
1454778f7:     	cmoveq	%rbx, %r8
1454778fb:     	leaq	0x153166f(%rip), %rax   # 0x1469a8f71
145477902:     	movq	%rax, 0xb0(%rbp)
145477909:     	movq	$0x5, 0xb8(%rbp)
145477914:     	leaq	0x18(%rbp), %rax
145477918:     	movq	%rax, 0xc0(%rbp)
14547791f:     	leaq	0x1517382(%rip), %rcx   # 0x14698eca8
145477926:     	movq	%rcx, 0xc8(%rbp)
14547792d:     	leaq	0x1531642(%rip), %rax   # 0x1469a8f76
145477934:     	movq	%rax, 0xd0(%rbp)
14547793b:     	movq	$0x3, 0xd8(%rbp)
145477946:     	movq	%r15, 0xe0(%rbp)
14547794d:     	movq	%rcx, 0xe8(%rbp)
145477954:     	movq	$0x2, 0x20(%rsp)
14547795d:     	leaq	0x90(%rbp), %rcx
145477964:     	leaq	0xb0(%rbp), %r9
14547796b:     	movq	%rsi, %rdx
14547796e:     	callq	0x145452790 <.text+0x5451790>
145477973:     	nop
145477974:     	jmp	0x145479236 <.text+0x5478236>
145477979:     	cmpl	$0x1, 0x1dc(%rbp)
145477980:     	jne	0x14547842c <.text+0x547742c>
145477986:     	leaq	0x153195e(%rip), %rsi   # 0x1469a92eb
14547798d:     	movl	$0x3d, %ebx
145477992:     	movl	$0x3d, %edx
145477997:     	movq	%rsi, %rcx
14547799a:     	callq	0x145452400 <.text+0x5451400>
14547799f:     	nop
1454779a0:     	movq	%rdx, %r8
1454779a3:     	testq	%rax, %rax
1454779a6:     	cmovneq	%rax, %rsi
1454779aa:     	cmoveq	%rbx, %r8
1454779ae:     	leaq	0x15315bc(%rip), %rax   # 0x1469a8f71
1454779b5:     	movq	%rax, 0xb0(%rbp)
1454779bc:     	movq	$0x5, 0xb8(%rbp)
1454779c7:     	leaq	0x18(%rbp), %rax
1454779cb:     	movq	%rax, 0xc0(%rbp)
1454779d2:     	leaq	0x15172cf(%rip), %rcx   # 0x14698eca8
1454779d9:     	movq	%rcx, 0xc8(%rbp)
1454779e0:     	leaq	0x153158f(%rip), %rax   # 0x1469a8f76
1454779e7:     	movq	%rax, 0xd0(%rbp)
1454779ee:     	movq	$0x3, 0xd8(%rbp)
1454779f9:     	movq	%r15, 0xe0(%rbp)
145477a00:     	movq	%rcx, 0xe8(%rbp)
145477a07:     	leaq	0x153156b(%rip), %rax   # 0x1469a8f79
145477a0e:     	movq	%rax, 0xf0(%rbp)
145477a15:     	movq	$0x5, 0xf8(%rbp)
145477a20:     	leaq	0x38(%rbp), %rax
145477a24:     	movq	%rax, 0x100(%rbp)
145477a2b:     	leaq	0x1517346(%rip), %rax   # 0x14698ed78
145477a32:     	movq	%rax, 0x108(%rbp)
145477a39:     	movq	$0x3, 0x20(%rsp)
145477a42:     	leaq	0x90(%rbp), %rcx
145477a49:     	leaq	0xb0(%rbp), %r9
145477a50:     	movq	%rsi, %rdx
145477a53:     	callq	0x145452790 <.text+0x5451790>
145477a58:     	nop
145477a59:     	jmp	0x145479236 <.text+0x5478236>
145477a5e:     	movss	0x58(%rdi), %xmm12
145477a64:     	movss	0x4812d3(%rip), %xmm13  # 0x1458f8d40
145477a6d:     	mulss	%xmm12, %xmm13
145477a72:     	movq	0x1b8(%rbp), %rax
145477a79:     	mulss	0x20(%rax), %xmm13
145477a7f:     	mulss	0x48(%rax), %xmm13
145477a85:     	movss	0x4d7882(%rip), %xmm14  # 0x14594f310
145477a8e:     	movl	0x5c(%rdi), %eax
145477a91:     	cmpl	$0x1, %eax
145477a94:     	adcl	$0x0, %eax
145477a97:     	movss	0x4739e0(%rip), %xmm10  # 0x1458eb480
145477aa0:     	xorps	%xmm0, %xmm0
145477aa3:     	cvtsi2ss	%rax, %xmm0
145477aa8:     	movss	0x48(%r12), %xmm9
145477aaf:     	addss	%xmm10, %xmm9
145477ab4:     	movaps	%xmm12, %xmm11
145477ab8:     	divss	%xmm0, %xmm11
145477abd:     	movaps	%xmm11, %xmm1
145477ac1:     	maxss	%xmm14, %xmm1
145477ac6:     	movaps	%xmm13, %xmm0
145477aca:     	divss	%xmm1, %xmm0
145477ace:     	callq	0x145756e1f <.text+0x5755e1f>
145477ad3:     	movaps	%xmm0, %xmm8
145477ad7:     	maxss	%xmm10, %xmm8
145477adc:     	movaps	%xmm9, %xmm0
145477ae0:     	mulss	%xmm8, %xmm0
145477ae5:     	callq	0x145756e1f <.text+0x5755e1f>
145477aea:     	movaps	%xmm0, %xmm10
145477aee:     	cvttss2si	%xmm0, %rax
145477af3:     	xorl	%ecx, %ecx
145477af5:     	xorps	%xmm0, %xmm0
145477af8:     	ucomiss	%xmm0, %xmm10
145477afc:     	cmovael	%eax, %ecx
145477aff:     	ucomiss	0x473a15(%rip), %xmm10  # 0x1458eb51c
145477b07:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145477b0c:     	cmovbel	%ecx, %eax
145477b0f:     	movl	0x44(%r12), %ecx
145477b14:     	cmpl	$0x3, %ecx
145477b17:     	movl	$0x3, %edx
145477b1c:     	cmovbl	%ecx, %edx
145477b1f:     	movl	%eax, 0x34(%rbp)
145477b22:     	incl	%edx
145477b24:     	movq	%rdx, -0x28(%rbp)
145477b28:     	testl	%ecx, %ecx
145477b2a:     	je	0x145478882 <.text+0x5477882>
145477b30:     	leaq	0x1531852(%rip), %rsi   # 0x1469a9389
145477b37:     	movl	$0x80, %ebx
145477b3c:     	movl	$0x80, %edx
145477b41:     	movq	%rsi, %rcx
145477b44:     	callq	0x145452400 <.text+0x5451400>
145477b49:     	nop
145477b4a:     	movq	%rdx, %r8
145477b4d:     	testq	%rax, %rax
145477b50:     	cmovneq	%rax, %rsi
145477b54:     	cmoveq	%rbx, %r8
145477b58:     	leaq	0x15318d1(%rip), %rax   # 0x1469a9430
145477b5f:     	movq	%rax, 0xb0(%rbp)
145477b66:     	movq	$0x3, 0xb8(%rbp)
145477b71:     	leaq	-0x28(%rbp), %rax
145477b75:     	movq	%rax, 0xc0(%rbp)
145477b7c:     	leaq	0x153188d(%rip), %rax   # 0x1469a9410
145477b83:     	movq	%rax, 0xc8(%rbp)
145477b8a:     	movq	$0x1, 0x20(%rsp)
145477b93:     	leaq	-0x20(%rbp), %rcx
145477b97:     	leaq	0xb0(%rbp), %r9
145477b9e:     	movq	%rsi, %rdx
145477ba1:     	callq	0x145452790 <.text+0x5451790>
145477ba6:     	nop
145477ba7:     	movl	$0x1, %r13d
145477bad:     	xorl	%r12d, %r12d
145477bb0:     	movq	%r12, 0x48(%rbp)
145477bb4:     	movq	%r13, 0x50(%rbp)
145477bb8:     	movq	%r12, 0x58(%rbp)
145477bbc:     	movq	-0x10(%rbp), %rax
145477bc0:     	movq	%rax, 0x70(%rbp)
145477bc4:     	movq	-0x20(%rbp), %rax
145477bc8:     	movq	%rax, 0x60(%rbp)
145477bcc:     	movq	-0x18(%rbp), %rax
145477bd0:     	movq	%rax, 0x68(%rbp)
145477bd4:     	leaq	0x1531858(%rip), %r15   # 0x1469a9433
145477bdb:     	movl	$0x6d, %esi
145477be0:     	movl	$0x6d, %edx
145477be5:     	movq	%r15, %rcx
145477be8:     	callq	0x145452400 <.text+0x5451400>
145477bed:     	nop
145477bee:     	movq	%rdx, %r12
145477bf1:     	testq	%rax, %rax
145477bf4:     	cmovneq	%rax, %r15
145477bf8:     	cmoveq	%rsi, %r12
145477bfc:     	movl	0x1dc(%rbp), %edx
145477c02:     	leaq	0x78(%rbp), %r13
145477c06:     	movq	%r13, %rcx
145477c09:     	movb	$0x1, %r8b
145477c0c:     	callq	0x145484c20 <.text+0x5483c20>
145477c11:     	nop
145477c12:     	mulss	%xmm13, %xmm7
145477c17:     	maxss	%xmm14, %xmm12
145477c1c:     	divss	%xmm12, %xmm7
145477c21:     	mulss	%xmm7, %xmm9
145477c26:     	leaq	0x1c0(%rbp), %rbx
145477c2d:     	movq	%rbx, %rcx
145477c30:     	movaps	%xmm9, %xmm1
145477c34:     	callq	0x14547ccf0 <.text+0x547bcf0>
145477c39:     	nop
145477c3a:     	movzbl	0x74(%rdi), %ecx
145477c3e:     	callq	0x145476f40 <.text+0x5475f40>
145477c43:     	nop
145477c44:     	mulss	%xmm8, %xmm11
145477c49:     	divss	%xmm10, %xmm11
145477c4e:     	movq	%rax, -0x8(%rbp)
145477c52:     	movq	%rdx, (%rbp)
145477c56:     	movl	0x34(%rbp), %eax
145477c59:     	xorps	%xmm1, %xmm1
145477c5c:     	cvtsi2ss	%rax, %xmm1
145477c61:     	mulss	%xmm11, %xmm1
145477c66:     	leaq	0x1e0(%rbp), %rsi
145477c6d:     	movq	%rsi, %rcx
145477c70:     	callq	0x14547ccf0 <.text+0x547bcf0>
145477c75:     	nop
145477c76:     	leaq	0x15312ed(%rip), %rax   # 0x1469a8f6a
145477c7d:     	movq	%rax, 0xb0(%rbp)
145477c84:     	movq	$0x7, 0xb8(%rbp)
145477c8f:     	movq	%r13, 0xc0(%rbp)
145477c96:     	leaq	0x151700b(%rip), %rcx   # 0x14698eca8
145477c9d:     	movq	%rcx, 0xc8(%rbp)
145477ca4:     	leaq	0x15312c6(%rip), %rax   # 0x1469a8f71
145477cab:     	movq	%rax, 0xd0(%rbp)
145477cb2:     	movq	$0x5, 0xd8(%rbp)
145477cbd:     	leaq	0x18(%rbp), %rax
145477cc1:     	movq	%rax, 0xe0(%rbp)
145477cc8:     	movq	%rcx, 0xe8(%rbp)
145477ccf:     	leaq	0x15317ca(%rip), %rax   # 0x1469a94a0
145477cd6:     	movq	%rax, 0xf0(%rbp)
145477cdd:     	movq	$0x4, 0xf8(%rbp)
145477ce8:     	leaq	0x48(%rbp), %rax
145477cec:     	movq	%rax, 0x100(%rbp)
145477cf3:     	movq	%rcx, 0x108(%rbp)
145477cfa:     	leaq	0x1531555(%rip), %rax   # 0x1469a9256
145477d01:     	movq	%rax, 0x110(%rbp)
145477d08:     	movq	$0x5, 0x118(%rbp)
145477d13:     	movq	%rbx, 0x120(%rbp)
145477d1a:     	movq	%rcx, 0x128(%rbp)
145477d21:     	leaq	0x15311a6(%rip), %rax   # 0x1469a8ece
145477d28:     	movq	%rax, 0x130(%rbp)
145477d2f:     	movq	$0x6, 0x138(%rbp)
145477d3a:     	leaq	-0x8(%rbp), %rax
145477d3e:     	movq	%rax, 0x140(%rbp)
145477d45:     	leaq	0x151702c(%rip), %rax   # 0x14698ed78
145477d4c:     	movq	%rax, 0x148(%rbp)
145477d53:     	leaq	0x153174a(%rip), %rax   # 0x1469a94a4
145477d5a:     	movq	%rax, 0x150(%rbp)
145477d61:     	movq	$0x4, 0x158(%rbp)
145477d6c:     	movq	%rsi, 0x160(%rbp)
145477d73:     	movq	%rcx, 0x168(%rbp)
145477d7a:     	leaq	0x1531727(%rip), %rax   # 0x1469a94a8
145477d81:     	movq	%rax, 0x170(%rbp)
145477d88:     	movq	$0x5, 0x178(%rbp)
145477d93:     	leaq	0x34(%rbp), %rax
145477d97:     	movq	%rax, 0x180(%rbp)
145477d9e:     	leaq	0x15310cb(%rip), %rax   # 0x1469a8e70
145477da5:     	movq	%rax, 0x188(%rbp)
145477dac:     	leaq	0x15316fa(%rip), %rax   # 0x1469a94ad
145477db3:     	movq	%rax, 0x190(%rbp)
145477dba:     	movq	$0x5, 0x198(%rbp)
145477dc5:     	leaq	0x60(%rbp), %rax
145477dc9:     	movq	%rax, 0x1a0(%rbp)
145477dd0:     	movq	%rcx, 0x1a8(%rbp)
145477dd7:     	movq	$0x8, 0x20(%rsp)
145477de0:     	leaq	0x90(%rbp), %rcx
145477de7:     	leaq	0xb0(%rbp), %r9
145477dee:     	movq	%r15, %rdx
145477df1:     	movq	%r12, %r8
145477df4:     	callq	0x145452790 <.text+0x5451790>
145477df9:     	nop
145477dfa:     	movq	0x60(%rbp), %rdx
145477dfe:     	testq	%rdx, %rdx
145477e01:     	je	0x145477e12 <.text+0x5476e12>
145477e03:     	movq	0x68(%rbp), %rcx
145477e07:     	movl	$0x1, %r8d
145477e0d:     	callq	0x1400021d0 <.text+0x11d0>
145477e12:     	movq	0x48(%rbp), %rdx
145477e16:     	testq	%rdx, %rdx
145477e19:     	je	0x145477e2a <.text+0x5476e2a>
145477e1b:     	movq	0x50(%rbp), %rcx
145477e1f:     	movl	$0x1, %r8d
145477e25:     	callq	0x1400021d0 <.text+0x11d0>
145477e2a:     	movq	0x1e0(%rbp), %rdx
145477e31:     	testq	%rdx, %rdx
145477e34:     	je	0x145477e48 <.text+0x5476e48>
145477e36:     	movq	0x1e8(%rbp), %rcx
145477e3d:     	movl	$0x1, %r8d
145477e43:     	callq	0x1400021d0 <.text+0x11d0>
145477e48:     	movq	0x1c0(%rbp), %rdx
145477e4f:     	testq	%rdx, %rdx
145477e52:     	je	0x145477e66 <.text+0x5476e66>
145477e54:     	movq	0x1c8(%rbp), %rcx
145477e5b:     	movl	$0x1, %r8d
145477e61:     	callq	0x1400021d0 <.text+0x11d0>
145477e66:     	movq	0x78(%rbp), %rdx
145477e6a:     	testq	%rdx, %rdx
145477e6d:     	je	0x145479236 <.text+0x5478236>
145477e73:     	movq	0x80(%rbp), %rcx
145477e7a:     	jmp	0x14547922b <.text+0x547822b>
145477e7f:     	movss	0x58(%rdi), %xmm1
145477e84:     	movss	0x480eb4(%rip), %xmm7   # 0x1458f8d40
145477e8c:     	mulss	%xmm1, %xmm7
145477e90:     	movq	0x1b8(%rbp), %rax
145477e97:     	mulss	0x20(%rax), %xmm7
145477e9c:     	mulss	0x48(%rax), %xmm7
145477ea1:     	movl	0x5c(%rdi), %eax
145477ea4:     	cmpl	$0x1, %eax
145477ea7:     	adcl	$0x0, %eax
145477eaa:     	xorps	%xmm0, %xmm0
145477ead:     	cvtsi2ss	%rax, %xmm0
145477eb2:     	divss	%xmm0, %xmm1
145477eb6:     	leaq	0x60(%rbp), %r12
145477eba:     	movq	%r12, %rcx
145477ebd:     	callq	0x14547ccf0 <.text+0x547bcf0>
145477ec2:     	nop
145477ec3:     	movss	0x50(%rdi), %xmm0
145477ec8:     	xorps	%xmm1, %xmm1
145477ecb:     	ucomiss	%xmm1, %xmm0
145477ece:     	jbe	0x1454785bb <.text+0x54775bb>
145477ed4:     	leaq	0x1531716(%rip), %rsi   # 0x1469a95f1
145477edb:     	movl	$0x2e, %ebx
145477ee0:     	movl	$0x2e, %edx
145477ee5:     	movq	%rsi, %rcx
145477ee8:     	callq	0x145452400 <.text+0x5451400>
145477eed:     	nop
145477eee:     	movq	%rdx, %r8
145477ef1:     	testq	%rax, %rax
145477ef4:     	cmovneq	%rax, %rsi
145477ef8:     	cmoveq	%rbx, %r8
145477efc:     	leaq	0x1531073(%rip), %rax   # 0x1469a8f76
145477f03:     	movq	%rax, 0xb0(%rbp)
145477f0a:     	movq	$0x3, 0xb8(%rbp)
145477f15:     	movq	%r15, 0xc0(%rbp)
145477f1c:     	leaq	0x1516d85(%rip), %rcx   # 0x14698eca8
145477f23:     	movq	%rcx, 0xc8(%rbp)
145477f2a:     	leaq	0x153121e(%rip), %rax   # 0x1469a914f
145477f31:     	movq	%rax, 0xd0(%rbp)
145477f38:     	movq	$0x1, 0xd8(%rbp)
145477f43:     	movq	%r13, 0xe0(%rbp)
145477f4a:     	movq	%rcx, 0xe8(%rbp)
145477f51:     	movq	$0x2, 0x20(%rsp)
145477f5a:     	leaq	0x78(%rbp), %rcx
145477f5e:     	leaq	0xb0(%rbp), %r9
145477f65:     	movq	%rsi, %rdx
145477f68:     	callq	0x145452790 <.text+0x5451790>
145477f6d:     	nop
145477f6e:     	jmp	0x1454786be <.text+0x54776be>
145477f73:     	leaq	0x1531608(%rip), %r14   # 0x1469a9582
145477f7a:     	movl	$0x3f, %esi
145477f7f:     	movl	$0x3f, %edx
145477f84:     	movq	%r14, %rcx
145477f87:     	callq	0x145452400 <.text+0x5451400>
145477f8c:     	nop
145477f8d:     	movq	%rdx, %r12
145477f90:     	testq	%rax, %rax
145477f93:     	cmovneq	%rax, %r14
145477f97:     	cmoveq	%rsi, %r12
145477f9b:     	mulss	0x4c(%rdi), %xmm12
145477fa1:     	mulss	%xmm12, %xmm9
145477fa6:     	ucomiss	%xmm9, %xmm13
145477faa:     	jae	0x145477fdd <.text+0x5476fdd>
145477fac:     	addss	0x1516c1b(%rip), %xmm9  # 0x14698ebd0
145477fb5:     	movss	0x480e23(%rip), %xmm7   # 0x1458f8de0
145477fbd:     	divss	%xmm7, %xmm9
145477fc2:     	movaps	%xmm9, %xmm0
145477fc6:     	callq	0x145756f57 <.text+0x5755f57>
145477fcb:     	movaps	%xmm0, %xmm9
145477fcf:     	mulss	%xmm7, %xmm9
145477fd4:     	addss	0x784437(%rip), %xmm9   # 0x145bfc414
145477fdd:     	leaq	0x1e0(%rbp), %rsi
145477fe4:     	movq	%rsi, %rcx
145477fe7:     	movaps	%xmm9, %xmm1
145477feb:     	callq	0x14547ccf0 <.text+0x547bcf0>
145477ff0:     	nop
145477ff1:     	leaq	0x15315c9(%rip), %rax   # 0x1469a95c1
145477ff8:     	movq	%rax, 0xb0(%rbp)
145477fff:     	movq	$0x4, 0xb8(%rbp)
14547800a:     	movq	%rsi, 0xc0(%rbp)
145478011:     	leaq	0x1516c90(%rip), %rcx   # 0x14698eca8
145478018:     	movq	%rcx, 0xc8(%rbp)
14547801f:     	leaq	0x1530f50(%rip), %rax   # 0x1469a8f76
145478026:     	movq	%rax, 0xd0(%rbp)
14547802d:     	movq	$0x3, 0xd8(%rbp)
145478038:     	movq	%r15, 0xe0(%rbp)
14547803f:     	movq	%rcx, 0xe8(%rbp)
145478046:     	movq	$0x2, 0x20(%rsp)
14547804f:     	leaq	0x90(%rbp), %rcx
145478056:     	leaq	0xb0(%rbp), %r9
14547805d:     	movq	%r14, %rdx
145478060:     	movq	%r12, %r8
145478063:     	callq	0x145452790 <.text+0x5451790>
145478068:     	nop
145478069:     	jmp	0x145478a8c <.text+0x5477a8c>
14547806e:     	leaq	0x1531113(%rip), %rsi   # 0x1469a9188
145478075:     	movl	$0x40, %ebx
14547807a:     	movl	$0x40, %edx
14547807f:     	movq	%rsi, %rcx
145478082:     	callq	0x145452400 <.text+0x5451400>
145478087:     	nop
145478088:     	movq	%rdx, %r8
14547808b:     	testq	%rax, %rax
14547808e:     	cmovneq	%rax, %rsi
145478092:     	cmoveq	%rbx, %r8
145478096:     	leaq	0x15310b2(%rip), %rax   # 0x1469a914f
14547809d:     	movq	%rax, 0xb0(%rbp)
1454780a4:     	movq	$0x1, 0xb8(%rbp)
1454780af:     	movq	%r13, 0xc0(%rbp)
1454780b6:     	leaq	0x1516beb(%rip), %rax   # 0x14698eca8
1454780bd:     	movq	%rax, 0xc8(%rbp)
1454780c4:     	movq	$0x1, 0x20(%rsp)
1454780cd:     	leaq	0x48(%rbp), %rcx
1454780d1:     	leaq	0xb0(%rbp), %r9
1454780d8:     	movq	%rsi, %rdx
1454780db:     	callq	0x145452790 <.text+0x5451790>
1454780e0:     	nop
1454780e1:     	leaq	0x15310e0(%rip), %r14   # 0x1469a91c8
1454780e8:     	movl	$0x7d, %esi
1454780ed:     	movl	$0x7d, %edx
1454780f2:     	movq	%r14, %rcx
1454780f5:     	callq	0x145452400 <.text+0x5451400>
1454780fa:     	nop
1454780fb:     	movq	%rdx, %r15
1454780fe:     	divss	%xmm10, %xmm7
145478103:     	testq	%rax, %rax
145478106:     	cmovneq	%rax, %r14
14547810a:     	cmoveq	%rsi, %r15
14547810e:     	leaq	0x60(%rbp), %rcx
145478112:     	movaps	%xmm7, %xmm1
145478115:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547811a:     	nop
14547811b:     	movzbl	0x74(%rdi), %ecx
14547811f:     	callq	0x145476f40 <.text+0x5475f40>
145478124:     	nop
145478125:     	maxss	0x473352(%rip), %xmm9   # 0x1458eb480
14547812e:     	movq	%rax, -0x8(%rbp)
145478132:     	movq	%rdx, (%rbp)
145478136:     	movaps	%xmm8, %xmm1
14547813a:     	divss	%xmm9, %xmm1
14547813f:     	leaq	0x78(%rbp), %rbx
145478143:     	movq	%rbx, %rcx
145478146:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547814b:     	nop
14547814c:     	leaq	0x1c0(%rbp), %rsi
145478153:     	movq	%rsi, %rcx
145478156:     	movaps	%xmm8, %xmm1
14547815a:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547815f:     	nop
145478160:     	mulss	%xmm9, %xmm7
145478165:     	leaq	0x1e0(%rbp), %r12
14547816c:     	movq	%r12, %rcx
14547816f:     	movaps	%xmm7, %xmm1
145478172:     	callq	0x14547ccf0 <.text+0x547bcf0>
145478177:     	nop
145478178:     	leaq	0x15310c6(%rip), %rax   # 0x1469a9245
14547817f:     	movq	%rax, 0xb0(%rbp)
145478186:     	movq	$0x5, 0xb8(%rbp)
145478191:     	leaq	0x48(%rbp), %rax
145478195:     	movq	%rax, 0xc0(%rbp)
14547819c:     	leaq	0x1516b05(%rip), %rcx   # 0x14698eca8
1454781a3:     	movq	%rcx, 0xc8(%rbp)
1454781aa:     	leaq	0x1530f9e(%rip), %rax   # 0x1469a914f
1454781b1:     	movq	%rax, 0xd0(%rbp)
1454781b8:     	movq	$0x1, 0xd8(%rbp)
1454781c3:     	movq	%r13, 0xe0(%rbp)
1454781ca:     	movq	%rcx, 0xe8(%rbp)
1454781d1:     	leaq	0x1531072(%rip), %rax   # 0x1469a924a
1454781d8:     	movq	%rax, 0xf0(%rbp)
1454781df:     	movq	$0x4, 0xf8(%rbp)
1454781ea:     	leaq	0x60(%rbp), %rax
1454781ee:     	movq	%rax, 0x100(%rbp)
1454781f5:     	movq	%rcx, 0x108(%rbp)
1454781fc:     	leaq	0x1530ccb(%rip), %rax   # 0x1469a8ece
145478203:     	movq	%rax, 0x110(%rbp)
14547820a:     	movq	$0x6, 0x118(%rbp)
145478215:     	leaq	-0x8(%rbp), %rax
145478219:     	movq	%rax, 0x120(%rbp)
145478220:     	leaq	0x1516b51(%rip), %rax   # 0x14698ed78
145478227:     	movq	%rax, 0x128(%rbp)
14547822e:     	leaq	0x1531019(%rip), %rax   # 0x1469a924e
145478235:     	movq	%rax, 0x130(%rbp)
14547823c:     	movq	$0x5, 0x138(%rbp)
145478247:     	movq	%rbx, 0x140(%rbp)
14547824e:     	movq	%rcx, 0x148(%rbp)
145478255:     	leaq	0x1530ff7(%rip), %rax   # 0x1469a9253
14547825c:     	movq	%rax, 0x150(%rbp)
145478263:     	movq	$0x3, 0x158(%rbp)
14547826e:     	movq	%rsi, 0x160(%rbp)
145478275:     	movq	%rcx, 0x168(%rbp)
14547827c:     	leaq	0x1530fd3(%rip), %rax   # 0x1469a9256
145478283:     	movq	%rax, 0x170(%rbp)
14547828a:     	movq	$0x5, 0x178(%rbp)
145478295:     	movq	%r12, 0x180(%rbp)
14547829c:     	movq	%rcx, 0x188(%rbp)
1454782a3:     	movq	$0x7, 0x20(%rsp)
1454782ac:     	leaq	0x90(%rbp), %rcx
1454782b3:     	leaq	0xb0(%rbp), %r9
1454782ba:     	movq	%r14, %rdx
1454782bd:     	movq	%r15, %r8
1454782c0:     	callq	0x145452790 <.text+0x5451790>
1454782c5:     	nop
1454782c6:     	movq	0x48(%rbp), %rdx
1454782ca:     	testq	%rdx, %rdx
1454782cd:     	je	0x1454782de <.text+0x54772de>
1454782cf:     	movq	0x50(%rbp), %rcx
1454782d3:     	movl	$0x1, %r8d
1454782d9:     	callq	0x1400021d0 <.text+0x11d0>
1454782de:     	movq	0x1e0(%rbp), %rdx
1454782e5:     	testq	%rdx, %rdx
1454782e8:     	je	0x1454782fc <.text+0x54772fc>
1454782ea:     	movq	0x1e8(%rbp), %rcx
1454782f1:     	movl	$0x1, %r8d
1454782f7:     	callq	0x1400021d0 <.text+0x11d0>
1454782fc:     	movq	0x1c0(%rbp), %rdx
145478303:     	testq	%rdx, %rdx
145478306:     	je	0x145478851 <.text+0x5477851>
14547830c:     	movq	0x1c8(%rbp), %rcx
145478313:     	movl	$0x1, %r8d
145478319:     	callq	0x1400021d0 <.text+0x11d0>
14547831e:     	jmp	0x145478851 <.text+0x5477851>
145478323:     	cmpq	$0xf, 0x8(%rdi)
145478328:     	jne	0x145478351 <.text+0x5477351>
14547832a:     	movq	(%rdi), %rax
14547832d:     	movabsq	$0x6d5f656e61637261, %rcx # imm = 0x6D5F656E61637261
145478337:     	xorq	(%rax), %rcx
14547833a:     	movabsq	$0x73656c697373696d, %rdx # imm = 0x73656C697373696D
145478344:     	xorq	0x7(%rax), %rdx
145478348:     	orq	%rcx, %rdx
14547834b:     	je	0x145479024 <.text+0x5478024>
145478351:     	leaq	0x1530c9d(%rip), %rsi   # 0x1469a8ff5
145478358:     	movl	$0x7b, %ebx
14547835d:     	movl	$0x7b, %edx
145478362:     	movq	%rsi, %rcx
145478365:     	callq	0x145452400 <.text+0x5451400>
14547836a:     	nop
14547836b:     	movq	%rdx, %r8
14547836e:     	testq	%rax, %rax
145478371:     	cmovneq	%rax, %rsi
145478375:     	cmoveq	%rbx, %r8
145478379:     	leaq	0x1516948(%rip), %rax   # 0x14698ecc8
145478380:     	movq	%rax, 0xb0(%rbp)
145478387:     	movq	$0x1, 0xb8(%rbp)
145478392:     	leaq	0x1dc(%rbp), %rax
145478399:     	movq	%rax, 0xc0(%rbp)
1454783a0:     	leaq	0x1530ac9(%rip), %rax   # 0x1469a8e70
1454783a7:     	movq	%rax, 0xc8(%rbp)
1454783ae:     	leaq	0x1530bbc(%rip), %rax   # 0x1469a8f71
1454783b5:     	movq	%rax, 0xd0(%rbp)
1454783bc:     	movq	$0x5, 0xd8(%rbp)
1454783c7:     	leaq	0x18(%rbp), %rax
1454783cb:     	movq	%rax, 0xe0(%rbp)
1454783d2:     	leaq	0x15168cf(%rip), %rcx   # 0x14698eca8
1454783d9:     	movq	%rcx, 0xe8(%rbp)
1454783e0:     	leaq	0x1530b8f(%rip), %rax   # 0x1469a8f76
1454783e7:     	movq	%rax, 0xf0(%rbp)
1454783ee:     	movq	$0x3, 0xf8(%rbp)
1454783f9:     	movq	%r15, 0x100(%rbp)
145478400:     	movq	%rcx, 0x108(%rbp)
145478407:     	movq	$0x3, 0x20(%rsp)
145478410:     	leaq	0x90(%rbp), %rcx
145478417:     	leaq	0xb0(%rbp), %r9
14547841e:     	movq	%rsi, %rdx
145478421:     	callq	0x145452790 <.text+0x5451790>
145478426:     	nop
145478427:     	jmp	0x145479236 <.text+0x5478236>
14547842c:     	leaq	0x1530ef5(%rip), %rsi   # 0x1469a9328
145478433:     	movl	$0x42, %ebx
145478438:     	movl	$0x42, %edx
14547843d:     	movq	%rsi, %rcx
145478440:     	callq	0x145452400 <.text+0x5451400>
145478445:     	nop
145478446:     	movq	%rdx, %r8
145478449:     	testq	%rax, %rax
14547844c:     	cmovneq	%rax, %rsi
145478450:     	cmoveq	%rbx, %r8
145478454:     	leaq	0x151686d(%rip), %rax   # 0x14698ecc8
14547845b:     	movq	%rax, 0xb0(%rbp)
145478462:     	movq	$0x1, 0xb8(%rbp)
14547846d:     	leaq	0x1dc(%rbp), %rax
145478474:     	movq	%rax, 0xc0(%rbp)
14547847b:     	leaq	0x15309ee(%rip), %rax   # 0x1469a8e70
145478482:     	movq	%rax, 0xc8(%rbp)
145478489:     	leaq	0x1530ae1(%rip), %rax   # 0x1469a8f71
145478490:     	movq	%rax, 0xd0(%rbp)
145478497:     	movq	$0x5, 0xd8(%rbp)
1454784a2:     	leaq	0x18(%rbp), %rax
1454784a6:     	movq	%rax, 0xe0(%rbp)
1454784ad:     	leaq	0x15167f4(%rip), %rcx   # 0x14698eca8
1454784b4:     	movq	%rcx, 0xe8(%rbp)
1454784bb:     	leaq	0x1530ab4(%rip), %rax   # 0x1469a8f76
1454784c2:     	movq	%rax, 0xf0(%rbp)
1454784c9:     	movq	$0x3, 0xf8(%rbp)
1454784d4:     	movq	%r15, 0x100(%rbp)
1454784db:     	movq	%rcx, 0x108(%rbp)
1454784e2:     	leaq	0x1530a90(%rip), %rax   # 0x1469a8f79
1454784e9:     	movq	%rax, 0x110(%rbp)
1454784f0:     	movq	$0x5, 0x118(%rbp)
1454784fb:     	leaq	0x38(%rbp), %rax
1454784ff:     	movq	%rax, 0x120(%rbp)
145478506:     	leaq	0x151686b(%rip), %rax   # 0x14698ed78
14547850d:     	movq	%rax, 0x128(%rbp)
145478514:     	movq	$0x4, 0x20(%rsp)
14547851d:     	leaq	0x90(%rbp), %rcx
145478524:     	leaq	0xb0(%rbp), %r9
14547852b:     	movq	%rsi, %rdx
14547852e:     	callq	0x145452790 <.text+0x5451790>
145478533:     	nop
145478534:     	jmp	0x145479236 <.text+0x5478236>
145478539:     	leaq	0x153102a(%rip), %rsi   # 0x1469a956a
145478540:     	movl	$0x11, %ebx
145478545:     	movl	$0x11, %edx
14547854a:     	movq	%rsi, %rcx
14547854d:     	callq	0x145452400 <.text+0x5451400>
145478552:     	nop
145478553:     	movq	%rdx, %r8
145478556:     	testq	%rax, %rax
145478559:     	cmovneq	%rax, %rsi
14547855d:     	cmoveq	%rbx, %r8
145478561:     	leaq	0x1516760(%rip), %rax   # 0x14698ecc8
145478568:     	movq	%rax, 0xb0(%rbp)
14547856f:     	movq	$0x1, 0xb8(%rbp)
14547857a:     	leaq	0x1dc(%rbp), %rax
145478581:     	movq	%rax, 0xc0(%rbp)
145478588:     	leaq	0x15308e1(%rip), %rax   # 0x1469a8e70
14547858f:     	movq	%rax, 0xc8(%rbp)
145478596:     	movq	$0x1, 0x20(%rsp)
14547859f:     	leaq	0x1c0(%rbp), %rcx
1454785a6:     	leaq	0xb0(%rbp), %r9
1454785ad:     	movq	%rsi, %rdx
1454785b0:     	callq	0x145452790 <.text+0x5451790>
1454785b5:     	nop
1454785b6:     	jmp	0x145479119 <.text+0x5478119>
1454785bb:     	leaq	0x1531003(%rip), %rbx   # 0x1469a95c5
1454785c2:     	movl	$0x2c, %edx
1454785c7:     	movq	%rbx, %rcx
1454785ca:     	callq	0x145452400 <.text+0x5451400>
1454785cf:     	nop
1454785d0:     	movq	%rax, %r13
1454785d3:     	movq	%rdx, %rsi
1454785d6:     	movl	0x1dc(%rbp), %edx
1454785dc:     	leaq	0x1e0(%rbp), %r14
1454785e3:     	movq	%r14, %rcx
1454785e6:     	xorl	%r8d, %r8d
1454785e9:     	callq	0x145484c20 <.text+0x5483c20>
1454785ee:     	nop
1454785ef:     	testq	%r13, %r13
1454785f2:     	movl	$0x2c, %eax
1454785f7:     	cmoveq	%rax, %rsi
1454785fb:     	cmovneq	%r13, %rbx
1454785ff:     	leaq	0x1530964(%rip), %rax   # 0x1469a8f6a
145478606:     	movq	%rax, 0xb0(%rbp)
14547860d:     	movq	$0x7, 0xb8(%rbp)
145478618:     	movq	%r14, 0xc0(%rbp)
14547861f:     	leaq	0x1516682(%rip), %rcx   # 0x14698eca8
145478626:     	movq	%rcx, 0xc8(%rbp)
14547862d:     	leaq	0x153093d(%rip), %rax   # 0x1469a8f71
145478634:     	movq	%rax, 0xd0(%rbp)
14547863b:     	movq	$0x5, 0xd8(%rbp)
145478646:     	leaq	0x18(%rbp), %rax
14547864a:     	movq	%rax, 0xe0(%rbp)
145478651:     	movq	%rcx, 0xe8(%rbp)
145478658:     	leaq	0x1530917(%rip), %rax   # 0x1469a8f76
14547865f:     	movq	%rax, 0xf0(%rbp)
145478666:     	movq	$0x3, 0xf8(%rbp)
145478671:     	movq	%r15, 0x100(%rbp)
145478678:     	movq	%rcx, 0x108(%rbp)
14547867f:     	movq	$0x3, 0x20(%rsp)
145478688:     	leaq	0x78(%rbp), %rcx
14547868c:     	leaq	0xb0(%rbp), %r9
145478693:     	movq	%rbx, %rdx
145478696:     	movq	%rsi, %r8
145478699:     	callq	0x145452790 <.text+0x5451790>
14547869e:     	nop
14547869f:     	movq	0x1e0(%rbp), %rdx
1454786a6:     	testq	%rdx, %rdx
1454786a9:     	je	0x1454786be <.text+0x54776be>
1454786ab:     	movq	0x1e8(%rbp), %rcx
1454786b2:     	movl	$0x1, %r8d
1454786b8:     	callq	0x1400021d0 <.text+0x11d0>
1454786bd:     	nop
1454786be:     	leaq	0x1530f5a(%rip), %rbx   # 0x1469a961f
1454786c5:     	movl	$0x62, %edx
1454786ca:     	movq	%rbx, %rcx
1454786cd:     	callq	0x145452400 <.text+0x5451400>
1454786d2:     	nop
1454786d3:     	movq	%rax, %r14
1454786d6:     	movq	%rdx, %rsi
1454786d9:     	leaq	0x1e0(%rbp), %r15
1454786e0:     	movq	%r15, %rcx
1454786e3:     	movaps	%xmm7, %xmm1
1454786e6:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454786eb:     	nop
1454786ec:     	testq	%r14, %r14
1454786ef:     	movl	$0x62, %eax
1454786f4:     	cmoveq	%rax, %rsi
1454786f8:     	cmovneq	%r14, %rbx
1454786fc:     	leaq	0x1530b50(%rip), %rax   # 0x1469a9253
145478703:     	movq	%rax, 0xb0(%rbp)
14547870a:     	movq	$0x3, 0xb8(%rbp)
145478715:     	movq	%r15, 0xc0(%rbp)
14547871c:     	leaq	0x1516585(%rip), %rcx   # 0x14698eca8
145478723:     	movq	%rcx, 0xc8(%rbp)
14547872a:     	leaq	0x1530b1d(%rip), %rax   # 0x1469a924e
145478731:     	movq	%rax, 0xd0(%rbp)
145478738:     	movq	$0x5, 0xd8(%rbp)
145478743:     	movq	%r12, 0xe0(%rbp)
14547874a:     	movq	%rcx, 0xe8(%rbp)
145478751:     	leaq	0x1530f29(%rip), %rax   # 0x1469a9681
145478758:     	movq	%rax, 0xf0(%rbp)
14547875f:     	movq	$0x4, 0xf8(%rbp)
14547876a:     	leaq	0x78(%rbp), %rax
14547876e:     	movq	%rax, 0x100(%rbp)
145478775:     	movq	%rcx, 0x108(%rbp)
14547877c:     	movq	$0x3, 0x20(%rsp)
145478785:     	leaq	0x1c0(%rbp), %rcx
14547878c:     	leaq	0xb0(%rbp), %r9
145478793:     	movq	%rbx, %rdx
145478796:     	movq	%rsi, %r8
145478799:     	callq	0x145452790 <.text+0x5451790>
14547879e:     	nop
14547879f:     	movq	0x1e0(%rbp), %rdx
1454787a6:     	testq	%rdx, %rdx
1454787a9:     	je	0x1454787bd <.text+0x54777bd>
1454787ab:     	movq	0x1e8(%rbp), %rcx
1454787b2:     	movl	$0x1, %r8d
1454787b8:     	callq	0x1400021d0 <.text+0x11d0>
1454787bd:     	movss	0x50(%rdi), %xmm0
1454787c2:     	xorps	%xmm1, %xmm1
1454787c5:     	ucomiss	%xmm1, %xmm0
1454787c8:     	jbe	0x1454787e8 <.text+0x54777e8>
1454787ca:     	movq	0x1d0(%rbp), %rax
1454787d1:     	movq	%rax, 0xa0(%rbp)
1454787d8:     	movups	0x1c0(%rbp), %xmm0
1454787df:     	movaps	%xmm0, 0x90(%rbp)
1454787e6:     	jmp	0x145478851 <.text+0x5477851>
1454787e8:     	movups	0x1c0(%rbp), %xmm0
1454787ef:     	movaps	%xmm0, 0xb0(%rbp)
1454787f6:     	movq	0x1d0(%rbp), %rsi
1454787fd:     	movq	%rsi, 0xc0(%rbp)
145478804:     	movq	0x38(%rbp), %r14
145478808:     	movq	0x40(%rbp), %rbx
14547880c:     	movq	0xb0(%rbp), %rax
145478813:     	subq	%rsi, %rax
145478816:     	cmpq	%rax, %rbx
145478819:     	ja	0x14547a07a <.text+0x547907a>
14547881f:     	testq	%rbx, %rbx
145478822:     	je	0x145478839 <.text+0x5477839>
145478824:     	movq	0xb8(%rbp), %rcx
14547882b:     	addq	%rsi, %rcx
14547882e:     	movq	%r14, %rdx
145478831:     	movq	%rbx, %r8
145478834:     	callq	0x145756ddd <.text+0x5755ddd>
145478839:     	addq	%rbx, %rsi
14547883c:     	movaps	0xb0(%rbp), %xmm0
145478843:     	movaps	%xmm0, 0x90(%rbp)
14547884a:     	movq	%rsi, 0xa0(%rbp)
145478851:     	movq	0x78(%rbp), %rdx
145478855:     	testq	%rdx, %rdx
145478858:     	je	0x14547886c <.text+0x547786c>
14547885a:     	movq	0x80(%rbp), %rcx
145478861:     	movl	$0x1, %r8d
145478867:     	callq	0x1400021d0 <.text+0x11d0>
14547886c:     	movq	0x60(%rbp), %rdx
145478870:     	testq	%rdx, %rdx
145478873:     	je	0x145479236 <.text+0x5478236>
145478879:     	movq	0x68(%rbp), %rcx
14547887d:     	jmp	0x14547922b <.text+0x547822b>
145478882:     	leaq	0x1530ae1(%rip), %rsi   # 0x1469a936a
145478889:     	movl	$0x1f, %ebx
14547888e:     	movl	$0x1f, %edx
145478893:     	movq	%rsi, %rcx
145478896:     	callq	0x145452400 <.text+0x5451400>
14547889b:     	nop
14547889c:     	testq	%rax, %rax
14547889f:     	cmovneq	%rax, %rsi
1454788a3:     	cmoveq	%rbx, %rdx
1454788a7:     	testq	%rdx, %rdx
1454788aa:     	movq	%rdx, %r12
1454788ad:     	jns	0x145478aa8 <.text+0x5477aa8>
1454788b3:     	xorl	%ebx, %ebx
1454788b5:     	movq	%rbx, %rcx
1454788b8:     	movq	%r12, %rdx
1454788bb:     	callq	0x1458e721b <.text+0x58e621b>
1454788c0:     	nop
1454788c1:     	jmp	0x14547a0ca <.text+0x54790ca>
1454788c6:     	je	0x1454790ff <.text+0x54780ff>
1454788cc:     	callq	0x140002200 <.text+0x1200>
1454788d1:     	movl	$0x1, %edx
1454788d6:     	movq	%rbx, %rcx
1454788d9:     	callq	0x1400021c0 <.text+0x11c0>
1454788de:     	movl	$0x1, %ecx
1454788e3:     	testq	%rax, %rax
1454788e6:     	je	0x1454778b8 <.text+0x54768b8>
1454788ec:     	movq	%rax, %rcx
1454788ef:     	movq	%rsi, %rdx
1454788f2:     	movq	%rbx, %r8
1454788f5:     	movq	%rax, %rsi
1454788f8:     	callq	0x145756ddd <.text+0x5755ddd>
1454788fd:     	movq	%rsi, %rax
145478900:     	jmp	0x145479104 <.text+0x5478104>
145478905:     	leaq	0x15305ee(%rip), %rbx   # 0x1469a8efa
14547890c:     	movl	$0x35, %esi
145478911:     	movl	$0x35, %edx
145478916:     	movq	%rbx, %rcx
145478919:     	callq	0x145452400 <.text+0x5451400>
14547891e:     	nop
14547891f:     	testq	%rax, %rax
145478922:     	cmovneq	%rax, %rbx
145478926:     	cmoveq	%rsi, %rdx
14547892a:     	movq	%rbx, 0x1c0(%rbp)
145478931:     	movq	%rdx, 0x1c8(%rbp)
145478938:     	cmpl	$0x1, 0x1dc(%rbp)
14547893f:     	ja	0x145477309 <.text+0x5476309>
145478945:     	leaq	0x15305e3(%rip), %r12   # 0x1469a8f2f
14547894c:     	movl	$0x3b, %edx
145478951:     	movq	%r12, %rcx
145478954:     	callq	0x145452400 <.text+0x5451400>
145478959:     	nop
14547895a:     	movq	%rax, %rsi
14547895d:     	movq	%rdx, %rbx
145478960:     	movl	0x1dc(%rbp), %edx
145478966:     	leaq	0x1e0(%rbp), %r14
14547896d:     	movq	%r14, %rcx
145478970:     	xorl	%r8d, %r8d
145478973:     	callq	0x145484c20 <.text+0x5483c20>
145478978:     	nop
145478979:     	testq	%rsi, %rsi
14547897c:     	movl	$0x3b, %eax
145478981:     	cmoveq	%rax, %rbx
145478985:     	cmovneq	%rsi, %r12
145478989:     	leaq	0x15305da(%rip), %rax   # 0x1469a8f6a
145478990:     	movq	%rax, 0xb0(%rbp)
145478997:     	movq	$0x7, 0xb8(%rbp)
1454789a2:     	movq	%r14, 0xc0(%rbp)
1454789a9:     	leaq	0x15162f8(%rip), %rcx   # 0x14698eca8
1454789b0:     	movq	%rcx, 0xc8(%rbp)
1454789b7:     	leaq	0x15305b3(%rip), %rax   # 0x1469a8f71
1454789be:     	movq	%rax, 0xd0(%rbp)
1454789c5:     	movq	$0x5, 0xd8(%rbp)
1454789d0:     	leaq	0x18(%rbp), %rax
1454789d4:     	movq	%rax, 0xe0(%rbp)
1454789db:     	movq	%rcx, 0xe8(%rbp)
1454789e2:     	leaq	0x153058d(%rip), %rax   # 0x1469a8f76
1454789e9:     	movq	%rax, 0xf0(%rbp)
1454789f0:     	movq	$0x3, 0xf8(%rbp)
1454789fb:     	movq	%r15, 0x100(%rbp)
145478a02:     	movq	%rcx, 0x108(%rbp)
145478a09:     	leaq	0x1530569(%rip), %rax   # 0x1469a8f79
145478a10:     	movq	%rax, 0x110(%rbp)
145478a17:     	movq	$0x5, 0x118(%rbp)
145478a22:     	leaq	0x38(%rbp), %rax
145478a26:     	movq	%rax, 0x120(%rbp)
145478a2d:     	leaq	0x1516344(%rip), %rcx   # 0x14698ed78
145478a34:     	movq	%rcx, 0x128(%rbp)
145478a3b:     	leaq	0x153053c(%rip), %rax   # 0x1469a8f7e
145478a42:     	movq	%rax, 0x130(%rbp)
145478a49:     	movq	$0x4, 0x138(%rbp)
145478a54:     	leaq	0x1c0(%rbp), %rax
145478a5b:     	movq	%rax, 0x140(%rbp)
145478a62:     	movq	%rcx, 0x148(%rbp)
145478a69:     	movq	$0x5, 0x20(%rsp)
145478a72:     	leaq	0x90(%rbp), %rcx
145478a79:     	leaq	0xb0(%rbp), %r9
145478a80:     	movq	%r12, %rdx
145478a83:     	movq	%rbx, %r8
145478a86:     	callq	0x145452790 <.text+0x5451790>
145478a8b:     	nop
145478a8c:     	movq	0x1e0(%rbp), %rdx
145478a93:     	testq	%rdx, %rdx
145478a96:     	je	0x145479236 <.text+0x5478236>
145478a9c:     	movq	0x1e8(%rbp), %rcx
145478aa3:     	jmp	0x14547922b <.text+0x547822b>
145478aa8:     	je	0x145479b04 <.text+0x5478b04>
145478aae:     	callq	0x140002200 <.text+0x1200>
145478ab3:     	movl	$0x1, %ebx
145478ab8:     	movl	$0x1, %edx
145478abd:     	movq	%r12, %rcx
145478ac0:     	callq	0x1400021c0 <.text+0x11c0>
145478ac5:     	testq	%rax, %rax
145478ac8:     	je	0x1454788b5 <.text+0x54778b5>
145478ace:     	movq	%rax, %r13
145478ad1:     	movq	%rax, %rcx
145478ad4:     	movq	%rsi, %rdx
145478ad7:     	movq	%r12, %r8
145478ada:     	callq	0x145756ddd <.text+0x5755ddd>
145478adf:     	jmp	0x145479b0a <.text+0x5478b0a>
145478ae4:     	movss	0x6c(%rdi), %xmm9
145478aea:     	cmpl	$0x6, %eax
145478aed:     	je	0x145479d11 <.text+0x5478d11>
145478af3:     	cmpl	$0xb, %eax
145478af6:     	je	0x145479c96 <.text+0x5478c96>
145478afc:     	cmpl	$0xc, %eax
145478aff:     	jne	0x145477658 <.text+0x5476658>
145478b05:     	leaq	0x15312ac(%rip), %r15   # 0x1469a9db8
145478b0c:     	movl	$0x47, %edx
145478b11:     	movq	%r15, %rcx
145478b14:     	callq	0x145452400 <.text+0x5451400>
145478b19:     	nop
145478b1a:     	movq	%rax, %rsi
145478b1d:     	movq	%rdx, %rbx
145478b20:     	mulss	%xmm9, %xmm11
145478b25:     	mulss	%xmm11, %xmm10
145478b2a:     	movss	0x40(%r12), %xmm0
145478b31:     	addss	0x472947(%rip), %xmm0   # 0x1458eb480
145478b39:     	mulss	%xmm10, %xmm0
145478b3e:     	mulss	%xmm0, %xmm8
145478b43:     	leaq	0x1e0(%rbp), %r12
145478b4a:     	movq	%r12, %rcx
145478b4d:     	movaps	%xmm8, %xmm1
145478b51:     	callq	0x14547ccf0 <.text+0x547bcf0>
145478b56:     	nop
145478b57:     	testq	%rsi, %rsi
145478b5a:     	movl	$0x47, %eax
145478b5f:     	cmoveq	%rax, %rbx
145478b63:     	cmovneq	%rsi, %r15
145478b67:     	leaq	0x15306e5(%rip), %rax   # 0x1469a9253
145478b6e:     	movq	%rax, 0xb0(%rbp)
145478b75:     	movq	$0x3, 0xb8(%rbp)
145478b80:     	movq	%r14, 0xc0(%rbp)
145478b87:     	leaq	0x151611a(%rip), %rcx   # 0x14698eca8
145478b8e:     	movq	%rcx, 0xc8(%rbp)
145478b95:     	leaq	0x151612c(%rip), %rax   # 0x14698ecc8
145478b9c:     	movq	%rax, 0xd0(%rbp)
145478ba3:     	movq	$0x1, 0xd8(%rbp)
145478bae:     	movq	%r12, 0xe0(%rbp)
145478bb5:     	movq	%rcx, 0xe8(%rbp)
145478bbc:     	leaq	0x1531160(%rip), %rax   # 0x1469a9d23
145478bc3:     	movq	%rax, 0xf0(%rbp)
145478bca:     	movq	$0x8, 0xf8(%rbp)
145478bd5:     	leaq	0x48(%rbp), %rax
145478bd9:     	movq	%rax, 0x100(%rbp)
145478be0:     	leaq	0x1516191(%rip), %rax   # 0x14698ed78
145478be7:     	movq	%rax, 0x108(%rbp)
145478bee:     	movq	$0x3, 0x20(%rsp)
145478bf7:     	leaq	0x90(%rbp), %rcx
145478bfe:     	leaq	0xb0(%rbp), %r9
145478c05:     	movq	%r15, %rdx
145478c08:     	movq	%rbx, %r8
145478c0b:     	callq	0x145452790 <.text+0x5451790>
145478c10:     	nop
145478c11:     	jmp	0x145478e95 <.text+0x5477e95>
145478c16:     	movss	0x6c(%rdi), %xmm8
145478c1c:     	leaq	0x15310c6(%rip), %r15   # 0x1469a9ce9
145478c23:     	movl	$0x3a, %edx
145478c28:     	movq	%r15, %rcx
145478c2b:     	callq	0x145452400 <.text+0x5451400>
145478c30:     	nop
145478c31:     	movq	%rax, %rsi
145478c34:     	movq	%rdx, %r13
145478c37:     	movss	0x40(%r12), %xmm0
145478c3e:     	addss	0x47283a(%rip), %xmm0   # 0x1458eb480
145478c46:     	mulss	%xmm8, %xmm7
145478c4b:     	mulss	%xmm7, %xmm0
145478c4f:     	mulss	0x4728d5(%rip), %xmm0   # 0x1458eb52c
145478c57:     	movss	%xmm0, 0x1c0(%rbp)
145478c5f:     	leaq	0x1c0(%rbp), %rax
145478c66:     	movq	%rax, 0xb0(%rbp)
145478c6d:     	leaq	0x2a466c(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145478c74:     	movq	%rax, 0xb8(%rbp)
145478c7b:     	leaq	0x1530a03(%rip), %rdx   # 0x1469a9685
145478c82:     	leaq	0x1e0(%rbp), %rbx
145478c89:     	leaq	0xb0(%rbp), %r8
145478c90:     	movq	%rbx, %rcx
145478c93:     	callq	0x14570bf80 <.text+0x570af80>
145478c98:     	nop
145478c99:     	testq	%rsi, %rsi
145478c9c:     	movl	$0x3a, %eax
145478ca1:     	cmoveq	%rax, %r13
145478ca5:     	cmovneq	%rsi, %r15
145478ca9:     	leaq	0x1530180(%rip), %rax   # 0x1469a8e30
145478cb0:     	movq	%rax, 0xb0(%rbp)
145478cb7:     	movq	$0x1, 0xb8(%rbp)
145478cc2:     	movq	%rbx, 0xc0(%rbp)
145478cc9:     	leaq	0x1515fd8(%rip), %rcx   # 0x14698eca8
145478cd0:     	movq	%rcx, 0xc8(%rbp)
145478cd7:     	leaq	0x1530575(%rip), %rax   # 0x1469a9253
145478cde:     	movq	%rax, 0xd0(%rbp)
145478ce5:     	movq	$0x3, 0xd8(%rbp)
145478cf0:     	movq	%r14, 0xe0(%rbp)
145478cf7:     	movq	%rcx, 0xe8(%rbp)
145478cfe:     	leaq	0x153101e(%rip), %rax   # 0x1469a9d23
145478d05:     	movq	%rax, 0xf0(%rbp)
145478d0c:     	movq	$0x8, 0xf8(%rbp)
145478d17:     	leaq	0x48(%rbp), %rax
145478d1b:     	movq	%rax, 0x100(%rbp)
145478d22:     	leaq	0x151604f(%rip), %rax   # 0x14698ed78
145478d29:     	movq	%rax, 0x108(%rbp)
145478d30:     	movq	$0x3, 0x20(%rsp)
145478d39:     	leaq	0x90(%rbp), %rcx
145478d40:     	leaq	0xb0(%rbp), %r9
145478d47:     	movq	%r15, %rdx
145478d4a:     	movq	%r13, %r8
145478d4d:     	callq	0x145452790 <.text+0x5451790>
145478d52:     	nop
145478d53:     	jmp	0x145478e95 <.text+0x5477e95>
145478d58:     	movss	0x6c(%rdi), %xmm8
145478d5e:     	leaq	0x1530fc6(%rip), %r15   # 0x1469a9d2b
145478d65:     	movl	$0x3b, %edx
145478d6a:     	movq	%r15, %rcx
145478d6d:     	callq	0x145452400 <.text+0x5451400>
145478d72:     	nop
145478d73:     	movq	%rax, %rsi
145478d76:     	movq	%rdx, %r13
145478d79:     	movss	0x40(%r12), %xmm0
145478d80:     	addss	0x4726f8(%rip), %xmm0   # 0x1458eb480
145478d88:     	mulss	%xmm8, %xmm7
145478d8d:     	mulss	%xmm7, %xmm0
145478d91:     	mulss	0x472793(%rip), %xmm0   # 0x1458eb52c
145478d99:     	movss	%xmm0, 0x1c0(%rbp)
145478da1:     	leaq	0x1c0(%rbp), %rax
145478da8:     	movq	%rax, 0xb0(%rbp)
145478daf:     	leaq	0x2a452a(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145478db6:     	movq	%rax, 0xb8(%rbp)
145478dbd:     	leaq	0x15308c1(%rip), %rdx   # 0x1469a9685
145478dc4:     	leaq	0x1e0(%rbp), %rbx
145478dcb:     	leaq	0xb0(%rbp), %r8
145478dd2:     	movq	%rbx, %rcx
145478dd5:     	callq	0x14570bf80 <.text+0x570af80>
145478dda:     	nop
145478ddb:     	testq	%rsi, %rsi
145478dde:     	movl	$0x3b, %eax
145478de3:     	cmoveq	%rax, %r13
145478de7:     	cmovneq	%rsi, %r15
145478deb:     	leaq	0x153003e(%rip), %rax   # 0x1469a8e30
145478df2:     	movq	%rax, 0xb0(%rbp)
145478df9:     	movq	$0x1, 0xb8(%rbp)
145478e04:     	movq	%rbx, 0xc0(%rbp)
145478e0b:     	leaq	0x1515e96(%rip), %rcx   # 0x14698eca8
145478e12:     	movq	%rcx, 0xc8(%rbp)
145478e19:     	leaq	0x1530433(%rip), %rax   # 0x1469a9253
145478e20:     	movq	%rax, 0xd0(%rbp)
145478e27:     	movq	$0x3, 0xd8(%rbp)
145478e32:     	movq	%r14, 0xe0(%rbp)
145478e39:     	movq	%rcx, 0xe8(%rbp)
145478e40:     	leaq	0x1530edc(%rip), %rax   # 0x1469a9d23
145478e47:     	movq	%rax, 0xf0(%rbp)
145478e4e:     	movq	$0x8, 0xf8(%rbp)
145478e59:     	leaq	0x48(%rbp), %rax
145478e5d:     	movq	%rax, 0x100(%rbp)
145478e64:     	leaq	0x1515f0d(%rip), %rax   # 0x14698ed78
145478e6b:     	movq	%rax, 0x108(%rbp)
145478e72:     	movq	$0x3, 0x20(%rsp)
145478e7b:     	leaq	0x90(%rbp), %rcx
145478e82:     	leaq	0xb0(%rbp), %r9
145478e89:     	movq	%r15, %rdx
145478e8c:     	movq	%r13, %r8
145478e8f:     	callq	0x145452790 <.text+0x5451790>
145478e94:     	nop
145478e95:     	movq	0x1e0(%rbp), %rdx
145478e9c:     	testq	%rdx, %rdx
145478e9f:     	je	0x14547886c <.text+0x547786c>
145478ea5:     	movq	0x1e8(%rbp), %rcx
145478eac:     	jmp	0x145478861 <.text+0x5477861>
145478eb1:     	mulss	0x6c(%rdi), %xmm7
145478eb6:     	leaq	0x1530dc2(%rip), %r14   # 0x1469a9c7f
145478ebd:     	movl	$0x6a, %esi
145478ec2:     	movl	$0x6a, %edx
145478ec7:     	movq	%r14, %rcx
145478eca:     	callq	0x145452400 <.text+0x5451400>
145478ecf:     	nop
145478ed0:     	movq	%rdx, %r15
145478ed3:     	testq	%rax, %rax
145478ed6:     	cmovneq	%rax, %r14
145478eda:     	cmoveq	%rsi, %r15
145478ede:     	movaps	%xmm6, %xmm1
145478ee1:     	mulss	%xmm7, %xmm1
145478ee5:     	mulss	%xmm10, %xmm11
145478eea:     	sqrtss	%xmm11, %xmm8
145478eef:     	mulss	0x47fe48(%rip), %xmm8   # 0x1458f8d40
145478ef8:     	mulss	%xmm8, %xmm1
145478efd:     	movss	0x40(%r12), %xmm9
145478f04:     	addss	0x472573(%rip), %xmm9   # 0x1458eb480
145478f0d:     	mulss	%xmm9, %xmm1
145478f12:     	leaq	0x1c0(%rbp), %rsi
145478f19:     	movq	%rsi, %rcx
145478f1c:     	callq	0x14547ccf0 <.text+0x547bcf0>
145478f21:     	nop
145478f22:     	mulss	%xmm7, %xmm8
145478f27:     	mulss	%xmm9, %xmm8
145478f2c:     	mulss	0x4725f7(%rip), %xmm8   # 0x1458eb52c
145478f35:     	movss	%xmm8, 0x78(%rbp)
145478f3b:     	leaq	0x78(%rbp), %rax
145478f3f:     	movq	%rax, 0xb0(%rbp)
145478f46:     	leaq	0x2a4393(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145478f4d:     	movq	%rax, 0xb8(%rbp)
145478f54:     	leaq	0x153072a(%rip), %rdx   # 0x1469a9685
145478f5b:     	leaq	0x1e0(%rbp), %rbx
145478f62:     	leaq	0xb0(%rbp), %r8
145478f69:     	movq	%rbx, %rcx
145478f6c:     	callq	0x14570bf80 <.text+0x570af80>
145478f71:     	nop
145478f72:     	leaq	0x1530cf7(%rip), %rax   # 0x1469a9c70
145478f79:     	movq	%rax, 0xb0(%rbp)
145478f80:     	movq	$0x6, 0xb8(%rbp)
145478f8b:     	movq	%rsi, 0xc0(%rbp)
145478f92:     	leaq	0x1515d0f(%rip), %rcx   # 0x14698eca8
145478f99:     	movq	%rcx, 0xc8(%rbp)
145478fa0:     	leaq	0x1530ccf(%rip), %rax   # 0x1469a9c76
145478fa7:     	movq	%rax, 0xd0(%rbp)
145478fae:     	movq	$0x5, 0xd8(%rbp)
145478fb9:     	movq	%rbx, 0xe0(%rbp)
145478fc0:     	movq	%rcx, 0xe8(%rbp)
145478fc7:     	movq	$0x2, 0x20(%rsp)
145478fd0:     	leaq	0x90(%rbp), %rcx
145478fd7:     	leaq	0xb0(%rbp), %r9
145478fde:     	movq	%r14, %rdx
145478fe1:     	movq	%r15, %r8
145478fe4:     	callq	0x145452790 <.text+0x5451790>
145478fe9:     	nop
145478fea:     	movq	0x1e0(%rbp), %rdx
145478ff1:     	testq	%rdx, %rdx
145478ff4:     	je	0x145479008 <.text+0x5478008>
145478ff6:     	movq	0x1e8(%rbp), %rcx
145478ffd:     	movl	$0x1, %r8d
145479003:     	callq	0x1400021d0 <.text+0x11d0>
145479008:     	movq	0x1c0(%rbp), %rdx
14547900f:     	testq	%rdx, %rdx
145479012:     	je	0x14547886c <.text+0x547786c>
145479018:     	movq	0x1c8(%rbp), %rcx
14547901f:     	jmp	0x145478861 <.text+0x5477861>
145479024:     	leaq	0x1530045(%rip), %rsi   # 0x1469a9070
14547902b:     	movl	$0xaf, %ebx
145479030:     	movl	$0xaf, %edx
145479035:     	movq	%rsi, %rcx
145479038:     	callq	0x145452400 <.text+0x5451400>
14547903d:     	nop
14547903e:     	movq	%rdx, %r8
145479041:     	testq	%rax, %rax
145479044:     	cmovneq	%rax, %rsi
145479048:     	cmoveq	%rbx, %r8
14547904c:     	leaq	0x1515c75(%rip), %rax   # 0x14698ecc8
145479053:     	movq	%rax, 0xb0(%rbp)
14547905a:     	movq	$0x1, 0xb8(%rbp)
145479065:     	leaq	0x1dc(%rbp), %rax
14547906c:     	movq	%rax, 0xc0(%rbp)
145479073:     	leaq	0x152fdf6(%rip), %rax   # 0x1469a8e70
14547907a:     	movq	%rax, 0xc8(%rbp)
145479081:     	leaq	0x152fee9(%rip), %rax   # 0x1469a8f71
145479088:     	movq	%rax, 0xd0(%rbp)
14547908f:     	movq	$0x5, 0xd8(%rbp)
14547909a:     	leaq	0x18(%rbp), %rax
14547909e:     	movq	%rax, 0xe0(%rbp)
1454790a5:     	leaq	0x1515bfc(%rip), %rcx   # 0x14698eca8
1454790ac:     	movq	%rcx, 0xe8(%rbp)
1454790b3:     	leaq	0x152febc(%rip), %rax   # 0x1469a8f76
1454790ba:     	movq	%rax, 0xf0(%rbp)
1454790c1:     	movq	$0x3, 0xf8(%rbp)
1454790cc:     	movq	%r15, 0x100(%rbp)
1454790d3:     	movq	%rcx, 0x108(%rbp)
1454790da:     	movq	$0x3, 0x20(%rsp)
1454790e3:     	leaq	0x90(%rbp), %rcx
1454790ea:     	leaq	0xb0(%rbp), %r9
1454790f1:     	movq	%rsi, %rdx
1454790f4:     	callq	0x145452790 <.text+0x5451790>
1454790f9:     	nop
1454790fa:     	jmp	0x145479236 <.text+0x5478236>
1454790ff:     	movl	$0x1, %eax
145479104:     	movq	%rbx, 0x1c0(%rbp)
14547910b:     	movq	%rax, 0x1c8(%rbp)
145479112:     	movq	%rbx, 0x1d0(%rbp)
145479119:     	addss	%xmm7, %xmm7
14547911d:     	leaq	0x1e0(%rbp), %rsi
145479124:     	movq	%rsi, %rcx
145479127:     	movaps	%xmm7, %xmm1
14547912a:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547912f:     	nop
145479130:     	leaq	0x1530444(%rip), %rax   # 0x1469a957b
145479137:     	movq	%rax, 0xb0(%rbp)
14547913e:     	movq	$0x7, 0xb8(%rbp)
145479149:     	leaq	0x1c0(%rbp), %rax
145479150:     	movq	%rax, 0xc0(%rbp)
145479157:     	leaq	0x1515b4a(%rip), %rcx   # 0x14698eca8
14547915e:     	movq	%rcx, 0xc8(%rbp)
145479165:     	leaq	0x152fe05(%rip), %rax   # 0x1469a8f71
14547916c:     	movq	%rax, 0xd0(%rbp)
145479173:     	movq	$0x5, 0xd8(%rbp)
14547917e:     	leaq	0x18(%rbp), %rax
145479182:     	movq	%rax, 0xe0(%rbp)
145479189:     	movq	%rcx, 0xe8(%rbp)
145479190:     	leaq	0x152fddf(%rip), %rax   # 0x1469a8f76
145479197:     	movq	%rax, 0xf0(%rbp)
14547919e:     	movq	$0x3, 0xf8(%rbp)
1454791a9:     	movq	%r15, 0x100(%rbp)
1454791b0:     	movq	%rcx, 0x108(%rbp)
1454791b7:     	movq	%r14, 0x110(%rbp)
1454791be:     	movq	$0x3, 0x118(%rbp)
1454791c9:     	movq	%rsi, 0x120(%rbp)
1454791d0:     	movq	%rcx, 0x128(%rbp)
1454791d7:     	movq	$0x4, 0x20(%rsp)
1454791e0:     	leaq	0x90(%rbp), %rcx
1454791e7:     	leaq	0xb0(%rbp), %r9
1454791ee:     	movq	%r12, %rdx
1454791f1:     	movq	%r13, %r8
1454791f4:     	callq	0x145452790 <.text+0x5451790>
1454791f9:     	nop
1454791fa:     	movq	0x1e0(%rbp), %rdx
145479201:     	testq	%rdx, %rdx
145479204:     	je	0x145479218 <.text+0x5478218>
145479206:     	movq	0x1e8(%rbp), %rcx
14547920d:     	movl	$0x1, %r8d
145479213:     	callq	0x1400021d0 <.text+0x11d0>
145479218:     	movq	0x1c0(%rbp), %rdx
14547921f:     	testq	%rdx, %rdx
145479222:     	je	0x145479236 <.text+0x5478236>
145479224:     	movq	0x1c8(%rbp), %rcx
14547922b:     	movl	$0x1, %r8d
145479231:     	callq	0x1400021d0 <.text+0x11d0>
145479236:     	movzbl	0x75(%rdi), %eax
14547923a:     	orl	$0x2, %eax
14547923d:     	cmpl	$0xb, %eax
145479240:     	jne	0x145479305 <.text+0x5478305>
145479246:     	movq	0xa0(%rbp), %rax
14547924d:     	movq	0x8(%rbp), %rcx
145479251:     	movq	%rax, 0x10(%rcx)
145479255:     	movaps	0x90(%rbp), %xmm0
14547925c:     	movups	%xmm0, (%rcx)
14547925f:     	movq	-0x58(%rbp), %rdx
145479263:     	testq	%rdx, %rdx
145479266:     	je	0x145479277 <.text+0x5478277>
145479268:     	movq	-0x50(%rbp), %rcx
14547926c:     	movl	$0x1, %r8d
145479272:     	callq	0x1400021d0 <.text+0x11d0>
145479277:     	movq	0x18(%rbp), %rdx
14547927b:     	testq	%rdx, %rdx
14547927e:     	je	0x14547928f <.text+0x547828f>
145479280:     	movq	0x20(%rbp), %rcx
145479284:     	movl	$0x1, %r8d
14547928a:     	callq	0x1400021d0 <.text+0x11d0>
14547928f:     	movq	-0x40(%rbp), %rdx
145479293:     	testq	%rdx, %rdx
145479296:     	je	0x1454792a7 <.text+0x54782a7>
145479298:     	movq	-0x38(%rbp), %rcx
14547929c:     	movl	$0x1, %r8d
1454792a2:     	callq	0x1400021d0 <.text+0x11d0>
1454792a7:     	movq	0x8(%rbp), %rax
1454792ab:     	movaps	0x200(%rbp), %xmm6
1454792b2:     	movaps	0x210(%rbp), %xmm7
1454792b9:     	movaps	0x220(%rbp), %xmm8
1454792c1:     	movaps	0x230(%rbp), %xmm9
1454792c9:     	movaps	0x240(%rbp), %xmm10
1454792d1:     	movaps	0x250(%rbp), %xmm11
1454792d9:     	movaps	0x260(%rbp), %xmm12
1454792e1:     	movaps	0x270(%rbp), %xmm13
1454792e9:     	movaps	0x280(%rbp), %xmm14
1454792f1:     	addq	$0x318, %rsp            # imm = 0x318
1454792f8:     	popq	%rbx
1454792f9:     	popq	%rdi
1454792fa:     	popq	%rsi
1454792fb:     	popq	%r12
1454792fd:     	popq	%r13
1454792ff:     	popq	%r14
145479301:     	popq	%r15
145479303:     	popq	%rbp
145479304:     	retq
145479305:     	leaq	0x15305fa(%rip), %rsi   # 0x1469a9906
14547930c:     	movl	$0x1f, %ebx
145479311:     	movl	$0x1f, %edx
145479316:     	movq	%rsi, %rcx
145479319:     	callq	0x145452400 <.text+0x5451400>
14547931e:     	nop
14547931f:     	testq	%rax, %rax
145479322:     	cmovneq	%rax, %rsi
145479326:     	cmoveq	%rbx, %rdx
14547932a:     	movq	%rsi, 0x60(%rbp)
14547932e:     	movq	%rdx, 0x68(%rbp)
145479332:     	movl	0x68(%rdi), %eax
145479335:     	leal	-0x1(%rax), %ecx
145479338:     	cmpl	$0x9, %ecx
14547933b:     	movq	0x1b8(%rbp), %r8
145479342:     	ja	0x145479470 <.text+0x5478470>
145479348:     	movss	0x50(%r8), %xmm7
14547934e:     	leaq	0x1530e23(%rip), %rdx   # 0x1469aa178
145479355:     	movslq	(%rdx,%rcx,4), %rcx
145479359:     	addq	%rdx, %rcx
14547935c:     	jmpq	*%rcx
14547935e:     	movss	0x6c(%rdi), %xmm7
145479363:     	movss	0x70(%rdi), %xmm6
145479368:     	mulss	0x48(%r8), %xmm6
14547936e:     	leaq	0x15305b0(%rip), %rdi   # 0x1469a9925
145479375:     	movl	$0x1f, %edx
14547937a:     	movq	%rdi, %rcx
14547937d:     	callq	0x145452400 <.text+0x5451400>
145479382:     	nop
145479383:     	movq	%rax, %rsi
145479386:     	movq	%rdx, %rbx
145479389:     	mulss	0x47219b(%rip), %xmm7   # 0x1458eb52c
145479391:     	movss	%xmm7, 0x1e0(%rbp)
145479399:     	leaq	0x1e0(%rbp), %rax
1454793a0:     	movq	%rax, 0xb0(%rbp)
1454793a7:     	leaq	0x2a3f32(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
1454793ae:     	movq	%rax, 0xb8(%rbp)
1454793b5:     	leaq	0x15302c9(%rip), %rdx   # 0x1469a9685
1454793bc:     	leaq	0x1c0(%rbp), %r14
1454793c3:     	leaq	0xb0(%rbp), %r8
1454793ca:     	movq	%r14, %rcx
1454793cd:     	callq	0x14570bf80 <.text+0x570af80>
1454793d2:     	nop
1454793d3:     	leaq	0x1e0(%rbp), %r15
1454793da:     	movq	%r15, %rcx
1454793dd:     	movaps	%xmm6, %xmm1
1454793e0:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454793e5:     	nop
1454793e6:     	testq	%rsi, %rsi
1454793e9:     	movl	$0x1f, %eax
1454793ee:     	cmoveq	%rax, %rbx
1454793f2:     	cmovneq	%rsi, %rdi
1454793f6:     	leaq	0x152fa33(%rip), %rax   # 0x1469a8e30
1454793fd:     	movq	%rax, 0xb0(%rbp)
145479404:     	movq	$0x1, 0xb8(%rbp)
14547940f:     	movq	%r14, 0xc0(%rbp)
145479416:     	leaq	0x151588b(%rip), %rcx   # 0x14698eca8
14547941d:     	movq	%rcx, 0xc8(%rbp)
145479424:     	leaq	0x1530519(%rip), %rax   # 0x1469a9944
14547942b:     	movq	%rax, 0xd0(%rbp)
145479432:     	movq	$0x1, 0xd8(%rbp)
14547943d:     	movq	%r15, 0xe0(%rbp)
145479444:     	movq	%rcx, 0xe8(%rbp)
14547944b:     	movq	$0x2, 0x20(%rsp)
145479454:     	leaq	0x78(%rbp), %rcx
145479458:     	leaq	0xb0(%rbp), %r9
14547945f:     	movq	%rdi, %rdx
145479462:     	movq	%rbx, %r8
145479465:     	callq	0x145452790 <.text+0x5451790>
14547946a:     	nop
14547946b:     	jmp	0x145479715 <.text+0x5478715>
145479470:     	movss	0x6c(%rdi), %xmm7
145479475:     	movl	%eax, %eax
145479477:     	leaq	0x1530d22(%rip), %rcx   # 0x1469aa1a0
14547947e:     	movslq	(%rcx,%rax,4), %rax
145479482:     	addq	%rcx, %rax
145479485:     	jmpq	*%rax
145479487:     	leaq	0x15304f3(%rip), %rsi   # 0x1469a9981
14547948e:     	movl	$0x2d, %edx
145479493:     	movq	%rsi, %rcx
145479496:     	callq	0x145452400 <.text+0x5451400>
14547949b:     	nop
14547949c:     	movq	%rax, %rbx
14547949f:     	movq	%rdx, %rdi
1454794a2:     	leaq	0x1e0(%rbp), %r14
1454794a9:     	movq	%r14, %rcx
1454794ac:     	movaps	%xmm7, %xmm1
1454794af:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454794b4:     	nop
1454794b5:     	testq	%rbx, %rbx
1454794b8:     	movl	$0x2d, %eax
1454794bd:     	cmoveq	%rax, %rdi
1454794c1:     	cmovneq	%rbx, %rsi
1454794c5:     	leaq	0x1530478(%rip), %rax   # 0x1469a9944
1454794cc:     	movq	%rax, 0xb0(%rbp)
1454794d3:     	movq	$0x1, 0xb8(%rbp)
1454794de:     	movq	%r14, 0xc0(%rbp)
1454794e5:     	leaq	0x15157bc(%rip), %rax   # 0x14698eca8
1454794ec:     	movq	%rax, 0xc8(%rbp)
1454794f3:     	movq	$0x1, 0x20(%rsp)
1454794fc:     	leaq	0x78(%rbp), %rcx
145479500:     	leaq	0xb0(%rbp), %r9
145479507:     	movq	%rsi, %rdx
14547950a:     	movq	%rdi, %r8
14547950d:     	callq	0x145452790 <.text+0x5451790>
145479512:     	nop
145479513:     	jmp	0x1454798e2 <.text+0x54788e2>
145479518:     	movss	0x6c(%rdi), %xmm8
14547951e:     	leaq	0x153051e(%rip), %rdi   # 0x1469a9a43
145479525:     	movl	$0x51, %edx
14547952a:     	movq	%rdi, %rcx
14547952d:     	callq	0x145452400 <.text+0x5451400>
145479532:     	nop
145479533:     	movq	%rax, %rsi
145479536:     	movq	%rdx, %rbx
145479539:     	mulss	%xmm8, %xmm7
14547953e:     	mulss	%xmm7, %xmm6
145479542:     	leaq	0x1c0(%rbp), %r14
145479549:     	movq	%r14, %rcx
14547954c:     	movaps	%xmm6, %xmm1
14547954f:     	callq	0x14547ccf0 <.text+0x547bcf0>
145479554:     	nop
145479555:     	mulss	0x47f887(%rip), %xmm6   # 0x1458f8de4
14547955d:     	leaq	0x1e0(%rbp), %r15
145479564:     	movq	%r15, %rcx
145479567:     	movaps	%xmm6, %xmm1
14547956a:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547956f:     	nop
145479570:     	testq	%rsi, %rsi
145479573:     	movl	$0x51, %eax
145479578:     	cmoveq	%rax, %rbx
14547957c:     	cmovneq	%rsi, %rdi
145479580:     	leaq	0x1515741(%rip), %rax   # 0x14698ecc8
145479587:     	movq	%rax, 0xb0(%rbp)
14547958e:     	movq	$0x1, 0xb8(%rbp)
145479599:     	movq	%r14, 0xc0(%rbp)
1454795a0:     	leaq	0x1515701(%rip), %rcx   # 0x14698eca8
1454795a7:     	movq	%rcx, 0xc8(%rbp)
1454795ae:     	leaq	0x15304df(%rip), %rax   # 0x1469a9a94
1454795b5:     	movq	%rax, 0xd0(%rbp)
1454795bc:     	movq	$0x3, 0xd8(%rbp)
1454795c7:     	movq	%r15, 0xe0(%rbp)
1454795ce:     	movq	%rcx, 0xe8(%rbp)
1454795d5:     	movq	$0x2, 0x20(%rsp)
1454795de:     	leaq	0x78(%rbp), %rcx
1454795e2:     	leaq	0xb0(%rbp), %r9
1454795e9:     	movq	%rdi, %rdx
1454795ec:     	movq	%rbx, %r8
1454795ef:     	callq	0x145452790 <.text+0x5451790>
1454795f4:     	nop
1454795f5:     	jmp	0x145479715 <.text+0x5478715>
1454795fa:     	movss	0x6c(%rdi), %xmm8
145479600:     	movss	0x70(%rdi), %xmm6
145479605:     	mulss	0x48(%r8), %xmm6
14547960b:     	leaq	0x1530485(%rip), %rdi   # 0x1469a9a97
145479612:     	movl	$0x2e, %edx
145479617:     	movq	%rdi, %rcx
14547961a:     	callq	0x145452400 <.text+0x5451400>
14547961f:     	nop
145479620:     	movq	%rax, %rsi
145479623:     	movq	%rdx, %r14
145479626:     	mulss	%xmm8, %xmm7
14547962b:     	minss	0x471ee1(%rip), %xmm7   # 0x1458eb514
145479633:     	mulss	0x471ef1(%rip), %xmm7   # 0x1458eb52c
14547963b:     	movss	%xmm7, 0x1e0(%rbp)
145479643:     	leaq	0x1e0(%rbp), %rax
14547964a:     	movq	%rax, 0xb0(%rbp)
145479651:     	leaq	0x2a3c88(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145479658:     	movq	%rax, 0xb8(%rbp)
14547965f:     	leaq	0x153001f(%rip), %rdx   # 0x1469a9685
145479666:     	leaq	0x1c0(%rbp), %rbx
14547966d:     	leaq	0xb0(%rbp), %r8
145479674:     	movq	%rbx, %rcx
145479677:     	callq	0x14570bf80 <.text+0x570af80>
14547967c:     	nop
14547967d:     	leaq	0x1e0(%rbp), %r15
145479684:     	movq	%r15, %rcx
145479687:     	movaps	%xmm6, %xmm1
14547968a:     	callq	0x14547ccf0 <.text+0x547bcf0>
14547968f:     	nop
145479690:     	testq	%rsi, %rsi
145479693:     	movl	$0x2e, %eax
145479698:     	cmoveq	%rax, %r14
14547969c:     	cmovneq	%rsi, %rdi
1454796a0:     	leaq	0x152f789(%rip), %rax   # 0x1469a8e30
1454796a7:     	movq	%rax, 0xb0(%rbp)
1454796ae:     	movq	$0x1, 0xb8(%rbp)
1454796b9:     	movq	%rbx, 0xc0(%rbp)
1454796c0:     	leaq	0x15155e1(%rip), %rcx   # 0x14698eca8
1454796c7:     	movq	%rcx, 0xc8(%rbp)
1454796ce:     	leaq	0x153026f(%rip), %rax   # 0x1469a9944
1454796d5:     	movq	%rax, 0xd0(%rbp)
1454796dc:     	movq	$0x1, 0xd8(%rbp)
1454796e7:     	movq	%r15, 0xe0(%rbp)
1454796ee:     	movq	%rcx, 0xe8(%rbp)
1454796f5:     	movq	$0x2, 0x20(%rsp)
1454796fe:     	leaq	0x78(%rbp), %rcx
145479702:     	leaq	0xb0(%rbp), %r9
145479709:     	movq	%rdi, %rdx
14547970c:     	movq	%r14, %r8
14547970f:     	callq	0x145452790 <.text+0x5451790>
145479714:     	nop
145479715:     	movq	0x1e0(%rbp), %rdx
14547971c:     	testq	%rdx, %rdx
14547971f:     	je	0x145479733 <.text+0x5478733>
145479721:     	movq	0x1e8(%rbp), %rcx
145479728:     	movl	$0x1, %r8d
14547972e:     	callq	0x1400021d0 <.text+0x11d0>
145479733:     	movq	0x1c0(%rbp), %rdx
14547973a:     	testq	%rdx, %rdx
14547973d:     	je	0x145479900 <.text+0x5478900>
145479743:     	movq	0x1c8(%rbp), %rcx
14547974a:     	jmp	0x1454798f5 <.text+0x54788f5>
14547974f:     	movss	0x6c(%rdi), %xmm6
145479754:     	leaq	0x15301ea(%rip), %rsi   # 0x1469a9945
14547975b:     	movl	$0x1c, %edx
145479760:     	movq	%rsi, %rcx
145479763:     	callq	0x145452400 <.text+0x5451400>
145479768:     	nop
145479769:     	movq	%rax, %rbx
14547976c:     	movq	%rdx, %rdi
14547976f:     	mulss	%xmm6, %xmm7
145479773:     	leaq	0x1e0(%rbp), %r14
14547977a:     	movq	%r14, %rcx
14547977d:     	movaps	%xmm7, %xmm1
145479780:     	callq	0x14547ccf0 <.text+0x547bcf0>
145479785:     	nop
145479786:     	testq	%rbx, %rbx
145479789:     	movl	$0x1c, %eax
14547978e:     	cmoveq	%rax, %rdi
145479792:     	cmovneq	%rbx, %rsi
145479796:     	leaq	0x15301a7(%rip), %rax   # 0x1469a9944
14547979d:     	movq	%rax, 0xb0(%rbp)
1454797a4:     	movq	$0x1, 0xb8(%rbp)
1454797af:     	movq	%r14, 0xc0(%rbp)
1454797b6:     	leaq	0x15154eb(%rip), %rax   # 0x14698eca8
1454797bd:     	movq	%rax, 0xc8(%rbp)
1454797c4:     	leaq	0x1530196(%rip), %rax   # 0x1469a9961
1454797cb:     	movq	%rax, 0xd0(%rbp)
1454797d2:     	movq	$0x4, 0xd8(%rbp)
1454797dd:     	leaq	0x60(%rbp), %rax
1454797e1:     	movq	%rax, 0xe0(%rbp)
1454797e8:     	leaq	0x1515589(%rip), %rax   # 0x14698ed78
1454797ef:     	movq	%rax, 0xe8(%rbp)
1454797f6:     	movq	$0x2, 0x20(%rsp)
1454797ff:     	leaq	0x78(%rbp), %rcx
145479803:     	leaq	0xb0(%rbp), %r9
14547980a:     	movq	%rsi, %rdx
14547980d:     	movq	%rdi, %r8
145479810:     	callq	0x145452790 <.text+0x5451790>
145479815:     	nop
145479816:     	jmp	0x1454798e2 <.text+0x54788e2>
14547981b:     	movss	0x6c(%rdi), %xmm6
145479820:     	leaq	0x153013e(%rip), %rsi   # 0x1469a9965
145479827:     	movl	$0x1c, %edx
14547982c:     	movq	%rsi, %rcx
14547982f:     	callq	0x145452400 <.text+0x5451400>
145479834:     	nop
145479835:     	movq	%rax, %rbx
145479838:     	movq	%rdx, %rdi
14547983b:     	mulss	%xmm6, %xmm7
14547983f:     	leaq	0x1e0(%rbp), %r14
145479846:     	movq	%r14, %rcx
145479849:     	movaps	%xmm7, %xmm1
14547984c:     	callq	0x14547ccf0 <.text+0x547bcf0>
145479851:     	nop
145479852:     	testq	%rbx, %rbx
145479855:     	movl	$0x1c, %eax
14547985a:     	cmoveq	%rax, %rdi
14547985e:     	cmovneq	%rbx, %rsi
145479862:     	leaq	0x15300db(%rip), %rax   # 0x1469a9944
145479869:     	movq	%rax, 0xb0(%rbp)
145479870:     	movq	$0x1, 0xb8(%rbp)
14547987b:     	movq	%r14, 0xc0(%rbp)
145479882:     	leaq	0x151541f(%rip), %rax   # 0x14698eca8
145479889:     	movq	%rax, 0xc8(%rbp)
145479890:     	leaq	0x15300ca(%rip), %rax   # 0x1469a9961
145479897:     	movq	%rax, 0xd0(%rbp)
14547989e:     	movq	$0x4, 0xd8(%rbp)
1454798a9:     	leaq	0x60(%rbp), %rax
1454798ad:     	movq	%rax, 0xe0(%rbp)
1454798b4:     	leaq	0x15154bd(%rip), %rax   # 0x14698ed78
1454798bb:     	movq	%rax, 0xe8(%rbp)
1454798c2:     	movq	$0x2, 0x20(%rsp)
1454798cb:     	leaq	0x78(%rbp), %rcx
1454798cf:     	leaq	0xb0(%rbp), %r9
1454798d6:     	movq	%rsi, %rdx
1454798d9:     	movq	%rdi, %r8
1454798dc:     	callq	0x145452790 <.text+0x5451790>
1454798e1:     	nop
1454798e2:     	movq	0x1e0(%rbp), %rdx
1454798e9:     	testq	%rdx, %rdx
1454798ec:     	je	0x145479900 <.text+0x5478900>
1454798ee:     	movq	0x1e8(%rbp), %rcx
1454798f5:     	movl	$0x1, %r8d
1454798fb:     	callq	0x1400021d0 <.text+0x11d0>
145479900:     	movq	0x78(%rbp), %r14
145479904:     	cmpq	$-0x1, %r14
145479908:     	je	0x145479246 <.text+0x5478246>
14547990e:     	movq	0x80(%rbp), %r15
145479915:     	movq	0x88(%rbp), %rdi
14547991c:     	movq	0x90(%rbp), %rax
145479923:     	movq	0xa0(%rbp), %rbx
14547992a:     	cmpq	%rbx, %rax
14547992d:     	je	0x145479fba <.text+0x5478fba>
145479933:     	movq	0x98(%rbp), %rcx
14547993a:     	movb	$0x20, (%rcx,%rbx)
14547993e:     	incq	%rbx
145479941:     	movq	%rbx, 0xa0(%rbp)
145479948:     	subq	%rbx, %rax
14547994b:     	cmpq	%rax, %rdi
14547994e:     	ja	0x14547a001 <.text+0x5479001>
145479954:     	testq	%rdi, %rdi
145479957:     	je	0x145479967 <.text+0x5478967>
145479959:     	addq	%rbx, %rcx
14547995c:     	movq	%r15, %rdx
14547995f:     	movq	%rdi, %r8
145479962:     	callq	0x145756ddd <.text+0x5755ddd>
145479967:     	addq	%rdi, %rbx
14547996a:     	movq	%rbx, 0xa0(%rbp)
145479971:     	testq	%r14, %r14
145479974:     	je	0x145479246 <.text+0x5478246>
14547997a:     	movl	$0x1, %r8d
145479980:     	movq	%r15, %rcx
145479983:     	movq	%r14, %rdx
145479986:     	callq	0x1400021d0 <.text+0x11d0>
14547998b:     	jmp	0x145479246 <.text+0x5478246>
145479990:     	cmpb	$0x2, 0x75(%rdi)
145479994:     	mulss	%xmm7, %xmm6
145479998:     	jne	0x145479b6f <.text+0x5478b6f>
14547999e:     	leaq	0x1530053(%rip), %rsi   # 0x1469a99f8
1454799a5:     	movl	$0x30, %edx
1454799aa:     	movq	%rsi, %rcx
1454799ad:     	callq	0x145452400 <.text+0x5451400>
1454799b2:     	nop
1454799b3:     	movq	%rax, %rbx
1454799b6:     	movq	%rdx, %rdi
1454799b9:     	leaq	0x1e0(%rbp), %r14
1454799c0:     	movq	%r14, %rcx
1454799c3:     	movaps	%xmm6, %xmm1
1454799c6:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454799cb:     	nop
1454799cc:     	testq	%rbx, %rbx
1454799cf:     	movl	$0x30, %eax
1454799d4:     	cmoveq	%rax, %rdi
1454799d8:     	cmovneq	%rbx, %rsi
1454799dc:     	leaq	0x15152e5(%rip), %rax   # 0x14698ecc8
1454799e3:     	movq	%rax, 0xb0(%rbp)
1454799ea:     	movq	$0x1, 0xb8(%rbp)
1454799f5:     	movq	%r14, 0xc0(%rbp)
1454799fc:     	leaq	0x15152a5(%rip), %rax   # 0x14698eca8
145479a03:     	movq	%rax, 0xc8(%rbp)
145479a0a:     	movq	$0x1, 0x20(%rsp)
145479a13:     	leaq	0x78(%rbp), %rcx
145479a17:     	leaq	0xb0(%rbp), %r9
145479a1e:     	movq	%rsi, %rdx
145479a21:     	movq	%rdi, %r8
145479a24:     	callq	0x145452790 <.text+0x5451790>
145479a29:     	nop
145479a2a:     	jmp	0x1454798e2 <.text+0x54788e2>
145479a2f:     	ucomiss	0x471a4a(%rip), %xmm7   # 0x1458eb480
145479a36:     	jae	0x145479c00 <.text+0x5478c00>
145479a3c:     	leaq	0x152ff6b(%rip), %rsi   # 0x1469a99ae
145479a43:     	movl	$0x27, %edx
145479a48:     	movq	%rsi, %rcx
145479a4b:     	callq	0x145452400 <.text+0x5451400>
145479a50:     	nop
145479a51:     	movq	%rax, %rbx
145479a54:     	movq	%rdx, %rdi
145479a57:     	mulss	0x471acd(%rip), %xmm7   # 0x1458eb52c
145479a5f:     	movss	%xmm7, 0x1c0(%rbp)
145479a67:     	leaq	0x1c0(%rbp), %rax
145479a6e:     	movq	%rax, 0xb0(%rbp)
145479a75:     	leaq	0x2a3864(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145479a7c:     	movq	%rax, 0xb8(%rbp)
145479a83:     	leaq	0x152fbfb(%rip), %rdx   # 0x1469a9685
145479a8a:     	leaq	0x1e0(%rbp), %r14
145479a91:     	leaq	0xb0(%rbp), %r8
145479a98:     	movq	%r14, %rcx
145479a9b:     	callq	0x14570bf80 <.text+0x570af80>
145479aa0:     	nop
145479aa1:     	testq	%rbx, %rbx
145479aa4:     	movl	$0x27, %eax
145479aa9:     	cmoveq	%rax, %rdi
145479aad:     	cmovneq	%rbx, %rsi
145479ab1:     	leaq	0x152f378(%rip), %rax   # 0x1469a8e30
145479ab8:     	movq	%rax, 0xb0(%rbp)
145479abf:     	movq	$0x1, 0xb8(%rbp)
145479aca:     	movq	%r14, 0xc0(%rbp)
145479ad1:     	leaq	0x15151d0(%rip), %rax   # 0x14698eca8
145479ad8:     	movq	%rax, 0xc8(%rbp)
145479adf:     	movq	$0x1, 0x20(%rsp)
145479ae8:     	leaq	0x78(%rbp), %rcx
145479aec:     	leaq	0xb0(%rbp), %r9
145479af3:     	movq	%rsi, %rdx
145479af6:     	movq	%rdi, %r8
145479af9:     	callq	0x145452790 <.text+0x5451790>
145479afe:     	nop
145479aff:     	jmp	0x1454798e2 <.text+0x54788e2>
145479b04:     	movl	$0x1, %r13d
145479b0a:     	movq	0x40(%rbp), %rbx
145479b0e:     	testq	%rbx, %rbx
145479b11:     	jns	0x145479b32 <.text+0x5478b32>
145479b13:     	xorl	%r15d, %r15d
145479b16:     	movq	%r13, 0x8(%rbp)
145479b1a:     	movq	%r15, %rcx
145479b1d:     	movq	%rbx, %rdx
145479b20:     	movq	%r12, 0x1b8(%rbp)
145479b27:     	callq	0x1458e721b <.text+0x58e621b>
145479b2c:     	nop
145479b2d:     	jmp	0x14547a0ca <.text+0x54790ca>
145479b32:     	je	0x145479c80 <.text+0x5478c80>
145479b38:     	movq	0x38(%rbp), %r14
145479b3c:     	callq	0x140002200 <.text+0x1200>
145479b41:     	movl	$0x1, %r15d
145479b47:     	movl	$0x1, %edx
145479b4c:     	movq	%rbx, %rcx
145479b4f:     	callq	0x1400021c0 <.text+0x11c0>
145479b54:     	testq	%rax, %rax
145479b57:     	je	0x145479b16 <.text+0x5478b16>
145479b59:     	movq	%rax, %rsi
145479b5c:     	movq	%rax, %rcx
145479b5f:     	movq	%r14, %rdx
145479b62:     	movq	%rbx, %r8
145479b65:     	callq	0x145756ddd <.text+0x5755ddd>
145479b6a:     	jmp	0x145479c85 <.text+0x5478c85>
145479b6f:     	leaq	0x152feb2(%rip), %rsi   # 0x1469a9a28
145479b76:     	movl	$0x1b, %edx
145479b7b:     	movq	%rsi, %rcx
145479b7e:     	callq	0x145452400 <.text+0x5451400>
145479b83:     	nop
145479b84:     	movq	%rax, %rbx
145479b87:     	movq	%rdx, %rdi
145479b8a:     	leaq	0x1e0(%rbp), %r14
145479b91:     	movq	%r14, %rcx
145479b94:     	movaps	%xmm6, %xmm1
145479b97:     	callq	0x14547ccf0 <.text+0x547bcf0>
145479b9c:     	nop
145479b9d:     	testq	%rbx, %rbx
145479ba0:     	movl	$0x1b, %eax
145479ba5:     	cmoveq	%rax, %rdi
145479ba9:     	cmovneq	%rbx, %rsi
145479bad:     	leaq	0x1515114(%rip), %rax   # 0x14698ecc8
145479bb4:     	movq	%rax, 0xb0(%rbp)
145479bbb:     	movq	$0x1, 0xb8(%rbp)
145479bc6:     	movq	%r14, 0xc0(%rbp)
145479bcd:     	leaq	0x15150d4(%rip), %rax   # 0x14698eca8
145479bd4:     	movq	%rax, 0xc8(%rbp)
145479bdb:     	movq	$0x1, 0x20(%rsp)
145479be4:     	leaq	0x78(%rbp), %rcx
145479be8:     	leaq	0xb0(%rbp), %r9
145479bef:     	movq	%rsi, %rdx
145479bf2:     	movq	%rdi, %r8
145479bf5:     	callq	0x145452790 <.text+0x5451790>
145479bfa:     	nop
145479bfb:     	jmp	0x1454798e2 <.text+0x54788e2>
145479c00:     	leaq	0x152fdce(%rip), %rsi   # 0x1469a99d5
145479c07:     	movl	$0x23, %ebx
145479c0c:     	movl	$0x23, %edx
145479c11:     	movq	%rsi, %rcx
145479c14:     	callq	0x145452400 <.text+0x5451400>
145479c19:     	nop
145479c1a:     	movq	%rdx, %rdi
145479c1d:     	testq	%rax, %rax
145479c20:     	cmovneq	%rax, %rsi
145479c24:     	cmoveq	%rbx, %rdi
145479c28:     	movq	$0x1, 0x20(%rsp)
145479c31:     	leaq	0xb0(%rbp), %rcx
145479c38:     	movl	$0x1, %r9d
145479c3e:     	movq	%rdi, %rdx
145479c41:     	xorl	%r8d, %r8d
145479c44:     	callq	0x14003bf90 <.text+0x3af90>
145479c49:     	movq	0xb8(%rbp), %r14
145479c50:     	cmpb	$0x0, 0xb0(%rbp)
145479c57:     	jne	0x14547a0a8 <.text+0x54790a8>
145479c5d:     	movq	0xc0(%rbp), %r15
145479c64:     	testq	%rdi, %rdi
145479c67:     	je	0x14547991c <.text+0x547891c>
145479c6d:     	movq	%r15, %rcx
145479c70:     	movq	%rsi, %rdx
145479c73:     	movq	%rdi, %r8
145479c76:     	callq	0x145756ddd <.text+0x5755ddd>
145479c7b:     	jmp	0x14547991c <.text+0x547891c>
145479c80:     	movl	$0x1, %esi
145479c85:     	movq	%rbx, -0x20(%rbp)
145479c89:     	movq	%rsi, -0x18(%rbp)
145479c8d:     	movq	%rbx, -0x10(%rbp)
145479c91:     	jmp	0x145477bb0 <.text+0x5476bb0>
145479c96:     	leaq	0x15300c9(%rip), %rsi   # 0x1469a9d66
145479c9d:     	movl	$0x52, %ebx
145479ca2:     	movl	$0x52, %edx
145479ca7:     	movq	%rsi, %rcx
145479caa:     	callq	0x145452400 <.text+0x5451400>
145479caf:     	nop
145479cb0:     	movq	%rdx, %r8
145479cb3:     	testq	%rax, %rax
145479cb6:     	cmovneq	%rax, %rsi
145479cba:     	cmoveq	%rbx, %r8
145479cbe:     	leaq	0x152f58e(%rip), %rax   # 0x1469a9253
145479cc5:     	movq	%rax, 0xb0(%rbp)
145479ccc:     	movq	$0x3, 0xb8(%rbp)
145479cd7:     	movq	%r14, 0xc0(%rbp)
145479cde:     	leaq	0x1514fc3(%rip), %rax   # 0x14698eca8
145479ce5:     	movq	%rax, 0xc8(%rbp)
145479cec:     	movq	$0x1, 0x20(%rsp)
145479cf5:     	leaq	0x90(%rbp), %rcx
145479cfc:     	leaq	0xb0(%rbp), %r9
145479d03:     	movq	%rsi, %rdx
145479d06:     	callq	0x145452790 <.text+0x5451790>
145479d0b:     	nop
145479d0c:     	jmp	0x14547886c <.text+0x547786c>
145479d11:     	mulss	%xmm10, %xmm11
145479d16:     	xorps	%xmm7, %xmm7
145479d19:     	sqrtss	%xmm11, %xmm7
145479d1e:     	mulss	0x47f01a(%rip), %xmm7   # 0x1458f8d40
145479d26:     	movaps	%xmm7, %xmm0
145479d29:     	mulss	%xmm9, %xmm0
145479d2e:     	mulss	0x4717f6(%rip), %xmm0   # 0x1458eb52c
145479d36:     	movss	%xmm0, 0x1e0(%rbp)
145479d3e:     	leaq	0x1e0(%rbp), %rax
145479d45:     	movq	%rax, 0xb0(%rbp)
145479d4c:     	leaq	0x2a358d(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145479d53:     	movq	%rax, 0xb8(%rbp)
145479d5a:     	leaq	0x152f924(%rip), %rdx   # 0x1469a9685
145479d61:     	leaq	0x78(%rbp), %r15
145479d65:     	leaq	0xb0(%rbp), %r8
145479d6c:     	movq	%r15, %rcx
145479d6f:     	callq	0x14570bf80 <.text+0x570af80>
145479d74:     	nop
145479d75:     	movss	0x58(%rdi), %xmm0
145479d7a:     	xorps	%xmm1, %xmm1
145479d7d:     	ucomiss	%xmm1, %xmm0
145479d80:     	jbe	0x145479dfd <.text+0x5478dfd>
145479d82:     	leaq	0x152fe78(%rip), %rsi   # 0x1469a9c01
145479d89:     	movl	$0xe, %ebx
145479d8e:     	movl	$0xe, %edx
145479d93:     	movq	%rsi, %rcx
145479d96:     	callq	0x145452400 <.text+0x5451400>
145479d9b:     	nop
145479d9c:     	movq	%rdx, %r8
145479d9f:     	testq	%rax, %rax
145479da2:     	cmovneq	%rax, %rsi
145479da6:     	cmoveq	%rbx, %r8
145479daa:     	leaq	0x152f4a2(%rip), %rax   # 0x1469a9253
145479db1:     	movq	%rax, 0xb0(%rbp)
145479db8:     	movq	$0x3, 0xb8(%rbp)
145479dc3:     	movq	%r14, 0xc0(%rbp)
145479dca:     	leaq	0x1514ed7(%rip), %rax   # 0x14698eca8
145479dd1:     	movq	%rax, 0xc8(%rbp)
145479dd8:     	movq	$0x1, 0x20(%rsp)
145479de1:     	leaq	0x1c0(%rbp), %rcx
145479de8:     	leaq	0xb0(%rbp), %r9
145479def:     	movq	%rsi, %rdx
145479df2:     	callq	0x145452790 <.text+0x5451790>
145479df7:     	nop
145479df8:     	jmp	0x145479e8a <.text+0x5478e8a>
145479dfd:     	leaq	0x152fdf6(%rip), %rsi   # 0x1469a9bfa
145479e04:     	movl	$0x7, %r14d
145479e0a:     	movl	$0x7, %edx
145479e0f:     	movq	%rsi, %rcx
145479e12:     	callq	0x145452400 <.text+0x5451400>
145479e17:     	nop
145479e18:     	movq	%rdx, %rbx
145479e1b:     	testq	%rax, %rax
145479e1e:     	cmovneq	%rax, %rsi
145479e22:     	cmoveq	%r14, %rbx
145479e26:     	movq	$0x1, 0x20(%rsp)
145479e2f:     	leaq	0xb0(%rbp), %rcx
145479e36:     	movl	$0x1, %r9d
145479e3c:     	movq	%rbx, %rdx
145479e3f:     	xorl	%r8d, %r8d
145479e42:     	callq	0x14003bf90 <.text+0x3af90>
145479e47:     	movq	0xb8(%rbp), %r14
145479e4e:     	cmpl	$0x1, 0xb0(%rbp)
145479e55:     	je	0x14547a0ba <.text+0x54790ba>
145479e5b:     	movq	0xc0(%rbp), %r12
145479e62:     	testq	%rbx, %rbx
145479e65:     	je	0x145479e75 <.text+0x5478e75>
145479e67:     	movq	%r12, %rcx
145479e6a:     	movq	%rsi, %rdx
145479e6d:     	movq	%rbx, %r8
145479e70:     	callq	0x145756ddd <.text+0x5755ddd>
145479e75:     	movq	%r14, 0x1c0(%rbp)
145479e7c:     	movq	%r12, 0x1c8(%rbp)
145479e83:     	movq	%rbx, 0x1d0(%rbp)
145479e8a:     	leaq	0x152fd7e(%rip), %rbx   # 0x1469a9c0f
145479e91:     	movl	$0x61, %edx
145479e96:     	movq	%rbx, %rcx
145479e99:     	callq	0x145452400 <.text+0x5451400>
145479e9e:     	nop
145479e9f:     	movq	%rax, %r14
145479ea2:     	movq	%rdx, %rsi
145479ea5:     	mulss	%xmm6, %xmm9
145479eaa:     	mulss	%xmm9, %xmm7
145479eaf:     	leaq	0x1e0(%rbp), %r12
145479eb6:     	movq	%r12, %rcx
145479eb9:     	movaps	%xmm7, %xmm1
145479ebc:     	callq	0x14547ccf0 <.text+0x547bcf0>
145479ec1:     	nop
145479ec2:     	testq	%r14, %r14
145479ec5:     	movl	$0x61, %eax
145479eca:     	cmoveq	%rax, %rsi
145479ece:     	cmovneq	%r14, %rbx
145479ed2:     	leaq	0x152fd97(%rip), %rax   # 0x1469a9c70
145479ed9:     	movq	%rax, 0xb0(%rbp)
145479ee0:     	movq	$0x6, 0xb8(%rbp)
145479eeb:     	movq	%r12, 0xc0(%rbp)
145479ef2:     	leaq	0x1514daf(%rip), %rcx   # 0x14698eca8
145479ef9:     	movq	%rcx, 0xc8(%rbp)
145479f00:     	leaq	0x152fd6f(%rip), %rax   # 0x1469a9c76
145479f07:     	movq	%rax, 0xd0(%rbp)
145479f0e:     	movq	$0x5, 0xd8(%rbp)
145479f19:     	movq	%r15, 0xe0(%rbp)
145479f20:     	movq	%rcx, 0xe8(%rbp)
145479f27:     	leaq	0x152fd4d(%rip), %rax   # 0x1469a9c7b
145479f2e:     	movq	%rax, 0xf0(%rbp)
145479f35:     	movq	$0x4, 0xf8(%rbp)
145479f40:     	leaq	0x1c0(%rbp), %rax
145479f47:     	movq	%rax, 0x100(%rbp)
145479f4e:     	movq	%rcx, 0x108(%rbp)
145479f55:     	movq	$0x3, 0x20(%rsp)
145479f5e:     	leaq	0x90(%rbp), %rcx
145479f65:     	leaq	0xb0(%rbp), %r9
145479f6c:     	movq	%rbx, %rdx
145479f6f:     	movq	%rsi, %r8
145479f72:     	callq	0x145452790 <.text+0x5451790>
145479f77:     	nop
145479f78:     	movq	0x1c0(%rbp), %rdx
145479f7f:     	testq	%rdx, %rdx
145479f82:     	je	0x145479f96 <.text+0x5478f96>
145479f84:     	movq	0x1c8(%rbp), %rcx
145479f8b:     	movl	$0x1, %r8d
145479f91:     	callq	0x1400021d0 <.text+0x11d0>
145479f96:     	movq	0x78(%rbp), %rdx
145479f9a:     	testq	%rdx, %rdx
145479f9d:     	je	0x145478e95 <.text+0x5477e95>
145479fa3:     	movq	0x80(%rbp), %rcx
145479faa:     	movl	$0x1, %r8d
145479fb0:     	callq	0x1400021d0 <.text+0x11d0>
145479fb5:     	jmp	0x145478e95 <.text+0x5477e95>
145479fba:     	movq	%r15, 0x10(%rbp)
145479fbe:     	movq	%r14, 0x1b8(%rbp)
145479fc5:     	movq	$0x1, 0x20(%rsp)
145479fce:     	leaq	0x90(%rbp), %rcx
145479fd5:     	movl	$0x1, %r8d
145479fdb:     	movl	$0x1, %r9d
145479fe1:     	movq	%rbx, %rdx
145479fe4:     	callq	0x145757d40 <.text+0x5756d40>
145479fe9:     	nop
145479fea:     	movq	0x90(%rbp), %rax
145479ff1:     	movq	0x1b8(%rbp), %r14
145479ff8:     	movq	0x10(%rbp), %r15
145479ffc:     	jmp	0x145479933 <.text+0x5478933>
14547a001:     	movq	%r15, 0x10(%rbp)
14547a005:     	movq	%r14, 0x1b8(%rbp)
14547a00c:     	movq	$0x1, 0x20(%rsp)
14547a015:     	leaq	0x90(%rbp), %rcx
14547a01c:     	movl	$0x1, %r9d
14547a022:     	movq	%rbx, %rdx
14547a025:     	movq	%rdi, %r8
14547a028:     	callq	0x145757d40 <.text+0x5756d40>
14547a02d:     	nop
14547a02e:     	movq	0x98(%rbp), %rcx
14547a035:     	movq	0xa0(%rbp), %rbx
14547a03c:     	movq	0x1b8(%rbp), %r14
14547a043:     	movq	0x10(%rbp), %r15
14547a047:     	jmp	0x145479959 <.text+0x5478959>
14547a04c:     	movq	$0x1, 0x20(%rsp)
14547a055:     	leaq	0x1e0(%rbp), %rcx
14547a05c:     	movl	$0x1, %r9d
14547a062:     	movq	%rsi, %rdx
14547a065:     	movq	%rbx, %r8
14547a068:     	callq	0x145757d40 <.text+0x5756d40>
14547a06d:     	nop
14547a06e:     	movq	0x1f0(%rbp), %rsi
14547a075:     	jmp	0x1454775a3 <.text+0x54765a3>
14547a07a:     	movq	$0x1, 0x20(%rsp)
14547a083:     	leaq	0xb0(%rbp), %rcx
14547a08a:     	movl	$0x1, %r9d
14547a090:     	movq	%rsi, %rdx
14547a093:     	movq	%rbx, %r8
14547a096:     	callq	0x145757d40 <.text+0x5756d40>
14547a09b:     	nop
14547a09c:     	movq	0xc0(%rbp), %rsi
14547a0a3:     	jmp	0x145478824 <.text+0x5477824>
14547a0a8:     	movq	0xc0(%rbp), %rdx
14547a0af:     	movq	%r14, %rcx
14547a0b2:     	callq	0x1458e721b <.text+0x58e621b>
14547a0b7:     	nop
14547a0b8:     	jmp	0x14547a0ca <.text+0x54790ca>
14547a0ba:     	movq	0xc0(%rbp), %rdx
14547a0c1:     	movq	%r14, %rcx
14547a0c4:     	callq	0x1458e721b <.text+0x58e621b>
14547a0c9:     	nop
14547a0ca:     	ud2
