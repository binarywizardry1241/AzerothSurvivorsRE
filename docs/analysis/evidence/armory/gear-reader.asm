
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453e0030:     	pushq	%rbp
1453e0031:     	pushq	%r15
1453e0033:     	pushq	%r14
1453e0035:     	pushq	%r13
1453e0037:     	pushq	%r12
1453e0039:     	pushq	%rsi
1453e003a:     	pushq	%rdi
1453e003b:     	pushq	%rbx
1453e003c:     	subq	$0x1a8, %rsp            # imm = 0x1A8
1453e0043:     	leaq	0x80(%rsp), %rbp
1453e004b:     	movq	$-0x2, 0x120(%rbp)
1453e0056:     	movl	%edx, %edi
1453e0058:     	movq	%rcx, %rsi
1453e005b:     	leal	-0x15f91(%rdi), %ecx
1453e0061:     	cmpl	$0x18, %ecx
1453e0064:     	setb	%al
1453e0067:     	movl	$0xfffc3f, %edx         # imm = 0xFFFC3F
1453e006c:     	shrl	%cl, %edx
1453e006e:     	andb	%al, %dl
1453e0070:     	cmpb	$0x1, %dl
1453e0073:     	jne	0x1453e0118 <.text+0x53df118>
1453e0079:     	movl	%ecx, %eax
1453e007b:     	leaq	0x12f98be(%rip), %rcx   # 0x1466d9940
1453e0082:     	movq	(%rcx,%rax,8), %r13
1453e0086:     	leaq	0x30(%r13), %rax
1453e008a:     	movl	0x30(%r13), %r12d
1453e008e:     	movq	%rax, 0xc0(%rbp)
1453e0095:     	leaq	0x2fbbc4(%rip), %rax    # 0x1456dbc60 <.text+0x56dac60>
1453e009c:     	movq	%rax, 0xc8(%rbp)
1453e00a3:     	leaq	0x12e937e(%rip), %rdx   # 0x1466c9428
1453e00aa:     	leaq	0x18(%rbp), %rcx
1453e00ae:     	leaq	0xc0(%rbp), %r8
1453e00b5:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453e00ba:     	movq	0x20(%rbp), %rcx
1453e00be:     	movq	0x28(%rbp), %rdx
1453e00c2:     	movq	(%r13), %rbx
1453e00c6:     	movq	0x8(%r13), %r15
1453e00ca:     	movq	%rcx, 0x110(%rbp)
1453e00d1:     	callq	0x14541f0e0 <.text+0x541e0e0>
1453e00d6:     	nop
1453e00d7:     	movq	%rax, %r14
1453e00da:     	movq	%rdx, %rdi
1453e00dd:     	movq	0x18(%rbp), %rdx
1453e00e1:     	testq	%rdx, %rdx
1453e00e4:     	je	0x1453e00f8 <.text+0x53df0f8>
1453e00e6:     	movl	$0x1, %r8d
1453e00ec:     	movq	0x110(%rbp), %rcx
1453e00f3:     	callq	0x1400021d0 <.text+0x11d0>
1453e00f8:     	testq	%r14, %r14
1453e00fb:     	cmovneq	%r14, %rbx
1453e00ff:     	cmoveq	%r15, %rdi
1453e0103:     	testq	%rdi, %rdi
1453e0106:     	jns	0x1453e0145 <.text+0x53df145>
1453e0108:     	xorl	%r15d, %r15d
1453e010b:     	movq	%r15, %rcx
1453e010e:     	movq	%rdi, %rdx
1453e0111:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1453e0116:     	ud2
1453e0118:     	leal	-0x1(%rdi), %eax
1453e011b:     	cmpl	$0x1869f, %eax          # imm = 0x1869F
1453e0120:     	jae	0x1453e0131 <.text+0x53df131>
1453e0122:     	movq	%rsi, %rcx
1453e0125:     	movl	%edi, %edx
1453e0127:     	callq	0x1453df730 <.text+0x53de730>
1453e012c:     	jmp	0x1453e0551 <.text+0x53df551>
1453e0131:     	cmpl	$0x186a0, %edi          # imm = 0x186A0
1453e0137:     	jae	0x1453e017e <.text+0x53df17e>
1453e0139:     	movq	$-0x1, (%rsi)
1453e0140:     	jmp	0x1453e0551 <.text+0x53df551>
1453e0145:     	je	0x1453e04ea <.text+0x53df4ea>
1453e014b:     	callq	0x140002200 <.text+0x1200>
1453e0150:     	movl	$0x1, %r15d
1453e0156:     	movl	$0x1, %edx
1453e015b:     	movq	%rdi, %rcx
1453e015e:     	callq	0x1400021c0 <.text+0x11c0>
1453e0163:     	testq	%rax, %rax
1453e0166:     	je	0x1453e010b <.text+0x53df10b>
1453e0168:     	movq	%rax, %r14
1453e016b:     	movq	%rax, %rcx
1453e016e:     	movq	%rbx, %rdx
1453e0171:     	movq	%rdi, %r8
1453e0174:     	callq	0x1457149fd <.text+0x57139fd>
1453e0179:     	jmp	0x1453e04f0 <.text+0x53df4f0>
1453e017e:     	leal	-0x186a0(%rdi), %eax
1453e0184:     	imulq	$0x51eb851f, %rax, %r15 # imm = 0x51EB851F
1453e018b:     	shrq	$0x25, %r15
1453e018f:     	imulq	$0x1999999a, %r15, %rcx # imm = 0x1999999A
1453e0196:     	shrq	$0x20, %rcx
1453e019a:     	addl	%ecx, %ecx
1453e019c:     	leal	(%rcx,%rcx,4), %ecx
1453e019f:     	subl	%ecx, %r15d
1453e01a2:     	movl	$0xcccccccd, %ebx       # imm = 0xCCCCCCCD
1453e01a7:     	imulq	%rax, %rbx
1453e01ab:     	shrq	$0x23, %rbx
1453e01af:     	imulq	$0x1999999a, %rbx, %rcx # imm = 0x1999999A
1453e01b6:     	shrq	$0x20, %rcx
1453e01ba:     	addl	%ecx, %ecx
1453e01bc:     	leal	(%rcx,%rcx,4), %ecx
1453e01bf:     	subl	%ecx, %ebx
1453e01c1:     	movq	%r15, -0x38(%rbp)
1453e01c5:     	movq	%rbx, 0xa0(%rbp)
1453e01cc:     	imull	$0xcccccccd, %eax, %ecx # imm = 0xCCCCCCCD
1453e01d2:     	rorl	%ecx
1453e01d4:     	cmpl	$0x19999999, %ecx       # imm = 0x19999999
1453e01da:     	ja	0x1453e0139 <.text+0x53df139>
1453e01e0:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
1453e01e5:     	ja	0x1453e0139 <.text+0x53df139>
1453e01eb:     	cmpl	$0x5, %ebx
1453e01ee:     	jae	0x1453e0139 <.text+0x53df139>
1453e01f4:     	imulq	$0x10624dd3, %rax, %rdx # imm = 0x10624DD3
1453e01fb:     	shrq	$0x26, %rdx
1453e01ff:     	leal	-0x1(%rdx), %eax
1453e0202:     	cmpb	$0xa, %al
1453e0204:     	ja	0x1453e0139 <.text+0x53df139>
1453e020a:     	movzbl	%al, %eax
1453e020d:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453e0212:     	btl	%eax, %ecx
1453e0215:     	jae	0x1453e0139 <.text+0x53df139>
1453e021b:     	leaq	0x12f9a1e(%rip), %rcx   # 0x1466d9c40
1453e0222:     	movq	(%rcx,%rax,8), %r14
1453e0226:     	movq	$0x0, (%rbp)
1453e022e:     	movq	$0x4, 0x8(%rbp)
1453e0236:     	movq	$0x0, 0x10(%rbp)
1453e023e:     	cmpl	$0x8, %r15d
1453e0242:     	movq	%rdx, -0x18(%rbp)
1453e0246:     	jae	0x1453e0568 <.text+0x53df568>
1453e024c:     	leaq	(%rbx,%rbx,2), %rax
1453e0250:     	movq	(%r14,%rax,8), %rcx
1453e0254:     	movq	%rcx, 0xb8(%rbp)
1453e025b:     	movq	0x8(%r14,%rax,8), %rcx
1453e0260:     	movq	%rcx, -0x8(%rbp)
1453e0264:     	movzbl	0x10(%r14,%rax,8), %eax
1453e026a:     	movb	%al, 0xfc(%rbp)
1453e0270:     	movzbl	0x128(%r14), %eax
1453e0278:     	decb	%al
1453e027a:     	movzbl	%al, %eax
1453e027d:     	shll	$0x3, %eax
1453e0280:     	leaq	0x12f9779(%rip), %rcx   # 0x1466d9a00
1453e0287:     	movq	(%rax,%rcx), %rcx
1453e028b:     	leaq	0x12f978e(%rip), %rdx   # 0x1466d9a20
1453e0292:     	movq	(%rax,%rdx), %rax
1453e0296:     	movq	%rcx, -0x28(%rbp)
1453e029a:     	movq	%rax, -0x20(%rbp)
1453e029e:     	leaq	-0x28(%rbp), %rax
1453e02a2:     	movq	%rax, 0x18(%rbp)
1453e02a6:     	leaq	-0x53de1ed(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1453e02ad:     	movq	%rax, 0x20(%rbp)
1453e02b1:     	leaq	-0x38(%rbp), %rax
1453e02b5:     	movq	%rax, 0x28(%rbp)
1453e02b9:     	leaq	0x2fc890(%rip), %rax    # 0x1456dcb50 <.text+0x56dbb50>
1453e02c0:     	movq	%rax, 0x30(%rbp)
1453e02c4:     	movb	$0x1, 0x11f(%rbp)
1453e02cb:     	movb	$0x1, 0x11e(%rbp)
1453e02d2:     	leaq	0x12ea8e4(%rip), %rdx   # 0x1466cabbd
1453e02d9:     	leaq	0xc0(%rbp), %rcx
1453e02e0:     	leaq	0x18(%rbp), %r8
1453e02e4:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453e02e9:     	nop
1453e02ea:     	movq	%r14, 0xb0(%rbp)
1453e02f1:     	movzbl	0x128(%r14), %eax
1453e02f9:     	decb	%al
1453e02fb:     	movzbl	%al, %eax
1453e02fe:     	shll	$0x3, %eax
1453e0301:     	leaq	0x12f9738(%rip), %rcx   # 0x1466d9a40
1453e0308:     	movq	(%rax,%rcx), %rcx
1453e030c:     	movq	%rcx, 0x110(%rbp)
1453e0313:     	leaq	0x12f9746(%rip), %rdx   # 0x1466d9a60
1453e031a:     	movq	(%rax,%rdx), %rcx
1453e031e:     	movq	%rcx, 0x100(%rbp)
1453e0325:     	leaq	0x12f9754(%rip), %r8    # 0x1466d9a80
1453e032c:     	movq	(%rax,%r8), %rcx
1453e0330:     	movq	%rcx, 0x108(%rbp)
1453e0337:     	leaq	0x12f9762(%rip), %r9    # 0x1466d9aa0
1453e033e:     	movq	(%rax,%r9), %rcx
1453e0342:     	movq	%rcx, 0xf0(%rbp)
1453e0349:     	leaq	0x12f9770(%rip), %r10   # 0x1466d9ac0
1453e0350:     	movq	(%rax,%r10), %rcx
1453e0354:     	movq	%rcx, 0xe8(%rbp)
1453e035b:     	leaq	0x12f977e(%rip), %r11   # 0x1466d9ae0
1453e0362:     	movq	(%rax,%r11), %rcx
1453e0366:     	movq	%rcx, 0xa8(%rbp)
1453e036d:     	leaq	0x12f978c(%rip), %r14   # 0x1466d9b00
1453e0374:     	movq	(%rax,%r14), %rcx
1453e0378:     	movq	%rcx, -0x10(%rbp)
1453e037c:     	leaq	0x12f979d(%rip), %r13   # 0x1466d9b20
1453e0383:     	movq	(%rax,%r13), %r13
1453e0387:     	leaq	0x12f97b2(%rip), %r12   # 0x1466d9b40
1453e038e:     	movq	(%rax,%r12), %r12
1453e0392:     	leaq	0x12f97c7(%rip), %rcx   # 0x1466d9b60
1453e0399:     	movq	(%rax,%rcx), %rcx
1453e039d:     	leaq	0x12f97dc(%rip), %rdx   # 0x1466d9b80
1453e03a4:     	movq	(%rax,%rdx), %rdx
1453e03a8:     	leaq	0x12f97f1(%rip), %r8    # 0x1466d9ba0
1453e03af:     	movq	(%rax,%r8), %r8
1453e03b3:     	leaq	0x12f9806(%rip), %r9    # 0x1466d9bc0
1453e03ba:     	movq	(%rax,%r9), %r9
1453e03be:     	leaq	0x12f981b(%rip), %r10   # 0x1466d9be0
1453e03c5:     	movq	(%rax,%r10), %r10
1453e03c9:     	leaq	0x12f9830(%rip), %r11   # 0x1466d9c00
1453e03d0:     	movq	(%rax,%r11), %r11
1453e03d4:     	leaq	0x12f9845(%rip), %r14   # 0x1466d9c20
1453e03db:     	movq	(%rax,%r14), %rax
1453e03df:     	movq	0x110(%rbp), %r14
1453e03e6:     	movq	%r14, 0x18(%rbp)
1453e03ea:     	movq	0x100(%rbp), %r14
1453e03f1:     	movq	%r14, 0x20(%rbp)
1453e03f5:     	movq	0x108(%rbp), %r14
1453e03fc:     	movq	%r14, 0x28(%rbp)
1453e0400:     	movq	0xf0(%rbp), %r14
1453e0407:     	movq	%r14, 0x30(%rbp)
1453e040b:     	movq	0xe8(%rbp), %r14
1453e0412:     	movq	%r14, 0x38(%rbp)
1453e0416:     	movq	0xa8(%rbp), %r14
1453e041d:     	movq	%r14, 0x40(%rbp)
1453e0421:     	movq	-0x10(%rbp), %r14
1453e0425:     	movq	%r14, 0x48(%rbp)
1453e0429:     	movq	%r13, 0x50(%rbp)
1453e042d:     	movq	%r12, 0x58(%rbp)
1453e0431:     	movq	%rcx, 0x60(%rbp)
1453e0435:     	movq	%rdx, 0x68(%rbp)
1453e0439:     	movq	%r8, 0x70(%rbp)
1453e043d:     	movq	0xc0(%rbp), %rcx
1453e0444:     	movq	%rcx, 0x110(%rbp)
1453e044b:     	movq	%r9, 0x78(%rbp)
1453e044f:     	movq	0xc8(%rbp), %rcx
1453e0456:     	movq	%r10, 0x80(%rbp)
1453e045d:     	movq	0xd0(%rbp), %rdx
1453e0464:     	movq	%r11, 0x88(%rbp)
1453e046b:     	movq	%rax, 0x90(%rbp)
1453e0472:     	movq	%r15, %rax
1453e0475:     	shlq	$0x4, %rax
1453e0479:     	movq	0x18(%rbp,%rax), %r14
1453e047e:     	movq	0x20(%rbp,%rax), %r13
1453e0483:     	movq	%rcx, 0x100(%rbp)
1453e048a:     	callq	0x14541f0e0 <.text+0x541e0e0>
1453e048f:     	nop
1453e0490:     	testq	%rax, %rax
1453e0493:     	cmovneq	%rax, %r14
1453e0497:     	cmoveq	%r13, %rdx
1453e049b:     	movq	%r14, -0x50(%rbp)
1453e049f:     	movq	%rdx, -0x48(%rbp)
1453e04a3:     	movq	0x110(%rbp), %rdx
1453e04aa:     	testq	%rdx, %rdx
1453e04ad:     	je	0x1453e04c1 <.text+0x53df4c1>
1453e04af:     	movl	$0x1, %r8d
1453e04b5:     	movq	0x100(%rbp), %rcx
1453e04bc:     	callq	0x1400021d0 <.text+0x11d0>
1453e04c1:     	movq	-0x18(%rbp), %rax
1453e04c5:     	addl	$-0x2, %eax
1453e04c8:     	cmpb	$0x9, %al
1453e04ca:     	movq	0xb0(%rbp), %r14
1453e04d1:     	ja	0x1453e05a0 <.text+0x53df5a0>
1453e04d7:     	movzbl	%al, %eax
1453e04da:     	leaq	0x12f99cf(%rip), %rcx   # 0x1466d9eb0
1453e04e1:     	movq	(%rcx,%rax,8), %rax
1453e04e5:     	jmp	0x1453e05a7 <.text+0x53df5a7>
1453e04ea:     	movl	$0x1, %r14d
1453e04f0:     	movl	0x34(%r13), %eax
1453e04f4:     	cmpq	$0x1, 0x20(%r13)
1453e04f9:     	movl	$0x2, %ecx
1453e04fe:     	sbbq	$0x0, %rcx
1453e0502:     	movq	%rdi, (%rsi)
1453e0505:     	movq	%r14, 0x8(%rsi)
1453e0509:     	movq	%rdi, 0x10(%rsi)
1453e050d:     	movq	$0x0, 0x18(%rsi)
1453e0515:     	movq	$0x4, 0x20(%rsi)
1453e051d:     	movq	$0x0, 0x28(%rsi)
1453e0525:     	movq	%rcx, 0x30(%rsi)
1453e0529:     	movq	$0x0, 0x38(%rsi)
1453e0531:     	movq	$0x0, 0x48(%rsi)
1453e0539:     	movl	%r12d, 0x50(%rsi)
1453e053d:     	movl	%eax, 0x54(%rsi)
1453e0540:     	movaps	0x12e8619(%rip), %xmm0  # 0x1466c8b60
1453e0547:     	movups	%xmm0, 0x58(%rsi)
1453e054b:     	movw	$0x12, 0x68(%rsi)
1453e0551:     	movq	%rsi, %rax
1453e0554:     	addq	$0x1a8, %rsp            # imm = 0x1A8
1453e055b:     	popq	%rbx
1453e055c:     	popq	%rdi
1453e055d:     	popq	%rsi
1453e055e:     	popq	%r12
1453e0560:     	popq	%r13
1453e0562:     	popq	%r14
1453e0564:     	popq	%r15
1453e0566:     	popq	%rbp
1453e0567:     	retq
1453e0568:     	leaq	-0x8(%r15), %rax
1453e056c:     	cmpq	0x80(%r14), %rax
1453e0573:     	jae	0x1453e0139 <.text+0x53df139>
1453e0579:     	leaq	(%rax,%rax,8), %r13
1453e057d:     	shlq	$0x4, %r13
1453e0581:     	leal	-0x2(%rdx), %ecx
1453e0584:     	cmpb	$0xa, %cl
1453e0587:     	jae	0x1453e08cf <.text+0x53df8cf>
1453e058d:     	movzbl	%cl, %ecx
1453e0590:     	leaq	0x12f9919(%rip), %rdx   # 0x1466d9eb0
1453e0597:     	movq	(%rdx,%rcx,8), %rcx
1453e059b:     	jmp	0x1453e08d6 <.text+0x53df8d6>
1453e05a0:     	leaq	0x12f42b1(%rip), %rax   # 0x1466d4858
1453e05a7:     	leaq	-0x53de4ee(%rip), %rcx  # 0x1400020c0 <.text+0x10c0>
1453e05ae:     	leaq	0x2fc59b(%rip), %rdx    # 0x1456dcb50 <.text+0x56dbb50>
1453e05b5:     	addq	$0x10, %rax
1453e05b9:     	movq	%rax, 0x18(%rbp)
1453e05bd:     	movq	%rcx, 0x20(%rbp)
1453e05c1:     	leaq	0xa0(%rbp), %r12
1453e05c8:     	movq	%r12, 0x28(%rbp)
1453e05cc:     	movq	%rdx, 0x30(%rbp)
1453e05d0:     	movb	$0x1, 0x11f(%rbp)
1453e05d7:     	movb	$0x1, 0x11e(%rbp)
1453e05de:     	leaq	0x12ea5ae(%rip), %rdx   # 0x1466cab93
1453e05e5:     	leaq	0xc0(%rbp), %rcx
1453e05ec:     	leaq	0x18(%rbp), %r8
1453e05f0:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453e05f5:     	nop
1453e05f6:     	movq	0xc0(%rbp), %rax
1453e05fd:     	movq	%rax, 0x110(%rbp)
1453e0604:     	movq	0xc8(%rbp), %rcx
1453e060b:     	movq	0xd0(%rbp), %rdx
1453e0612:     	movq	%rcx, 0x100(%rbp)
1453e0619:     	callq	0x14541f0e0 <.text+0x541e0e0>
1453e061e:     	nop
1453e061f:     	testq	%rax, %rax
1453e0622:     	movq	0xb8(%rbp), %rcx
1453e0629:     	cmovneq	%rax, %rcx
1453e062d:     	cmoveq	-0x8(%rbp), %rdx
1453e0632:     	movq	%rcx, -0x28(%rbp)
1453e0636:     	movq	%rdx, -0x20(%rbp)
1453e063a:     	movq	0x110(%rbp), %rdx
1453e0641:     	testq	%rdx, %rdx
1453e0644:     	je	0x1453e0658 <.text+0x53df658>
1453e0646:     	movl	$0x1, %r8d
1453e064c:     	movq	0x100(%rbp), %rcx
1453e0653:     	callq	0x1400021d0 <.text+0x11d0>
1453e0658:     	cmpb	$0x0, 0xfc(%rbp)
1453e065f:     	je	0x1453e06dd <.text+0x53df6dd>
1453e0661:     	leaq	0x12ec9f8(%rip), %rax   # 0x1466cd060
1453e0668:     	movq	%rax, 0x18(%rbp)
1453e066c:     	movq	$0x4, 0x20(%rbp)
1453e0674:     	leaq	-0x50(%rbp), %rax
1453e0678:     	movq	%rax, 0x28(%rbp)
1453e067c:     	leaq	0x12ec9bd(%rip), %rax   # 0x1466cd040
1453e0683:     	movq	%rax, 0x30(%rbp)
1453e0687:     	leaq	0x12ec9d6(%rip), %rcx   # 0x1466cd064
1453e068e:     	movq	%rcx, 0x38(%rbp)
1453e0692:     	movq	$0x3, 0x40(%rbp)
1453e069a:     	leaq	-0x28(%rbp), %rcx
1453e069e:     	movq	%rcx, 0x48(%rbp)
1453e06a2:     	movq	%rax, 0x50(%rbp)
1453e06a6:     	movb	$0x1, 0x11f(%rbp)
1453e06ad:     	movb	$0x1, 0x11e(%rbp)
1453e06b4:     	movq	$0x2, 0x20(%rsp)
1453e06bd:     	leaq	0x12ec9b3(%rip), %rdx   # 0x1466cd077
1453e06c4:     	leaq	0xc0(%rbp), %rcx
1453e06cb:     	leaq	0x18(%rbp), %r9
1453e06cf:     	movl	$0xc, %r8d
1453e06d5:     	callq	0x14541f090 <.text+0x541e090>
1453e06da:     	nop
1453e06db:     	jmp	0x1453e0757 <.text+0x53df757>
1453e06dd:     	leaq	0x12ec97c(%rip), %rax   # 0x1466cd060
1453e06e4:     	movq	%rax, 0x18(%rbp)
1453e06e8:     	movq	$0x4, 0x20(%rbp)
1453e06f0:     	leaq	-0x50(%rbp), %rax
1453e06f4:     	movq	%rax, 0x28(%rbp)
1453e06f8:     	leaq	0x12ec941(%rip), %rax   # 0x1466cd040
1453e06ff:     	movq	%rax, 0x30(%rbp)
1453e0703:     	leaq	0x12ec95a(%rip), %rcx   # 0x1466cd064
1453e070a:     	movq	%rcx, 0x38(%rbp)
1453e070e:     	movq	$0x3, 0x40(%rbp)
1453e0716:     	leaq	-0x28(%rbp), %rcx
1453e071a:     	movq	%rcx, 0x48(%rbp)
1453e071e:     	movq	%rax, 0x50(%rbp)
1453e0722:     	movb	$0x1, 0x11f(%rbp)
1453e0729:     	movb	$0x1, 0x11e(%rbp)
1453e0730:     	movq	$0x2, 0x20(%rsp)
1453e0739:     	leaq	0x12ec927(%rip), %rdx   # 0x1466cd067
1453e0740:     	leaq	0xc0(%rbp), %rcx
1453e0747:     	leaq	0x18(%rbp), %r9
1453e074b:     	movl	$0x10, %r8d
1453e0751:     	callq	0x14541f090 <.text+0x541e090>
1453e0756:     	nop
1453e0757:     	movq	0xc0(%rbp), %r13
1453e075e:     	movq	0xc8(%rbp), %rax
1453e0765:     	movq	0xd0(%rbp), %rcx
1453e076c:     	movq	%rcx, 0x110(%rbp)
1453e0773:     	movq	%r12, 0x18(%rbp)
1453e0777:     	movq	$0x0, 0x20(%rbp)
1453e077f:     	movq	$0x5, 0x28(%rbp)
1453e0787:     	leaq	0x30(%rbp), %rdx
1453e078b:     	movq	%r14, 0x30(%rbp)
1453e078f:     	leaq	-0x38(%rbp), %rcx
1453e0793:     	movq	%rcx, 0x38(%rbp)
1453e0797:     	movq	%rax, 0x108(%rbp)
1453e079e:     	movq	%rax, 0xe0(%rbp)
1453e07a5:     	movq	%r13, 0xd8(%rbp)
1453e07ac:     	movb	$0x0, 0x11f(%rbp)
1453e07b3:     	movb	$0x1, 0x11e(%rbp)
1453e07ba:     	leaq	0x18(%rbp), %rcx
1453e07be:     	callq	0x1454f0010 <.text+0x54ef010>
1453e07c3:     	nop
1453e07c4:     	movq	%r12, %r10
1453e07c7:     	xorl	%ecx, %ecx
1453e07c9:     	testb	$0x1, %al
1453e07cb:     	cmovnel	%edx, %ecx
1453e07ce:     	movzbl	0x128(%r14), %r12d
1453e07d6:     	cmpl	$0x2, %r15d
1453e07da:     	movl	%ecx, -0x10(%rbp)
1453e07dd:     	jne	0x1453e0875 <.text+0x53df875>
1453e07e3:     	cmpb	$0x1, %r12b
1453e07e7:     	jne	0x1453e0875 <.text+0x53df875>
1453e07ed:     	leaq	0x12ec8b0(%rip), %rax   # 0x1466cd0a4
1453e07f4:     	movzbl	(%r15,%rax), %eax
1453e07f9:     	movb	%al, 0xb0(%rbp)
1453e07ff:     	movl	$0x2, %eax
1453e0804:     	leaq	0x12ec8c1(%rip), %rcx   # 0x1466cd0cc
1453e080b:     	movl	$0x14, 0xfc(%rbp)
1453e0815:     	movq	0x108(%rbp), %rdx
1453e081c:     	leaq	(%rcx,%rax,8), %rax
1453e0820:     	movq	%rcx, 0x18(%rbp)
1453e0824:     	movq	%rax, 0x20(%rbp)
1453e0828:     	movq	%r10, 0x28(%rbp)
1453e082c:     	movq	%rdx, 0xe0(%rbp)
1453e0833:     	movq	%r13, 0xd8(%rbp)
1453e083a:     	movb	$0x0, 0x11f(%rbp)
1453e0841:     	movb	$0x1, 0x11e(%rbp)
1453e0848:     	movq	%rbp, %rcx
1453e084b:     	leaq	0x18(%rbp), %rdx
1453e084f:     	callq	0x1454d8ce0 <.text+0x54d7ce0>
1453e0854:     	nop
1453e0855:     	movzbl	%r12b, %eax
1453e0859:     	movl	%eax, -0x8(%rbp)
1453e085c:     	movl	$0x0, 0xb8(%rbp)
1453e0866:     	movl	$0x4, 0x9c(%rbp)
1453e0870:     	jmp	0x1453e0abc <.text+0x53dfabc>
1453e0875:     	leaq	0x12ec808(%rip), %rax   # 0x1466cd084
1453e087c:     	movl	(%rax,%r15,4), %r9d
1453e0880:     	leaq	0x12ec81d(%rip), %rax   # 0x1466cd0a4
1453e0887:     	movzbl	(%r15,%rax), %r8d
1453e088c:     	cmpl	$0x6, %r15d
1453e0890:     	movq	0x108(%rbp), %rdx
1453e0897:     	movb	%r8b, 0xb0(%rbp)
1453e089e:     	movl	%r9d, 0xfc(%rbp)
1453e08a5:     	ja	0x1453e0f31 <.text+0x53dff31>
1453e08ab:     	movl	%r15d, %eax
1453e08ae:     	leaq	0x12f9a73(%rip), %rcx   # 0x1466da328
1453e08b5:     	movslq	(%rcx,%rax,4), %rax
1453e08b9:     	addq	%rcx, %rax
1453e08bc:     	jmpq	*%rax
1453e08be:     	movl	$0x2, %eax
1453e08c3:     	leaq	0x12ec7e2(%rip), %rcx   # 0x1466cd0ac
1453e08ca:     	jmp	0x1453e081c <.text+0x53df81c>
1453e08cf:     	leaq	0x12f3f82(%rip), %rcx   # 0x1466d4858
1453e08d6:     	addq	0x78(%r14), %r13
1453e08da:     	addq	$0x10, %rcx
1453e08de:     	movq	%rax, -0x28(%rbp)
1453e08e2:     	movq	%rcx, 0x18(%rbp)
1453e08e6:     	leaq	-0x53de82d(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1453e08ed:     	movq	%rax, 0x20(%rbp)
1453e08f1:     	leaq	-0x28(%rbp), %rax
1453e08f5:     	movq	%rax, 0x28(%rbp)
1453e08f9:     	leaq	0x2fc250(%rip), %rax    # 0x1456dcb50 <.text+0x56dbb50>
1453e0900:     	movq	%rax, 0x30(%rbp)
1453e0904:     	leaq	0xa0(%rbp), %rcx
1453e090b:     	movq	%rcx, 0x38(%rbp)
1453e090f:     	movq	%rax, 0x40(%rbp)
1453e0913:     	movb	$0x1, 0x11f(%rbp)
1453e091a:     	movb	$0x1, 0x11e(%rbp)
1453e0921:     	leaq	0x12ea25b(%rip), %rdx   # 0x1466cab83
1453e0928:     	leaq	0xc0(%rbp), %rcx
1453e092f:     	leaq	0x18(%rbp), %r8
1453e0933:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453e0938:     	nop
1453e0939:     	movq	0xc0(%rbp), %rax
1453e0940:     	movq	%rax, 0x100(%rbp)
1453e0947:     	movq	0xc8(%rbp), %rcx
1453e094e:     	movq	0xd0(%rbp), %rdx
1453e0955:     	movq	%rbx, %rax
1453e0958:     	shlq	$0x4, %rax
1453e095c:     	movq	0x8(%r13,%rax), %r14
1453e0961:     	movq	0x10(%r13,%rax), %rax
1453e0966:     	movq	%rax, 0x110(%rbp)
1453e096d:     	movq	%rcx, 0xe8(%rbp)
1453e0974:     	callq	0x14541f0e0 <.text+0x541e0e0>
1453e0979:     	nop
1453e097a:     	movq	%rdx, %r12
1453e097d:     	testq	%rax, %rax
1453e0980:     	cmovneq	%rax, %r14
1453e0984:     	movq	%r14, 0x108(%rbp)
1453e098b:     	cmoveq	0x110(%rbp), %r12
1453e0993:     	movq	$0x1, 0x20(%rsp)
1453e099c:     	leaq	0x18(%rbp), %rcx
1453e09a0:     	movl	$0x1, %r9d
1453e09a6:     	movq	%r12, %rdx
1453e09a9:     	xorl	%r8d, %r8d
1453e09ac:     	callq	0x1401638b0 <.text+0x1628b0>
1453e09b1:     	movq	0x20(%rbp), %rax
1453e09b5:     	movq	%rax, 0xf0(%rbp)
1453e09bc:     	cmpl	$0x1, 0x18(%rbp)
1453e09c0:     	je	0x1453e0f75 <.text+0x53dff75>
1453e09c6:     	movq	0x28(%rbp), %r14
1453e09ca:     	testq	%r12, %r12
1453e09cd:     	je	0x1453e09e1 <.text+0x53df9e1>
1453e09cf:     	movq	%r14, %rcx
1453e09d2:     	movq	0x108(%rbp), %rdx
1453e09d9:     	movq	%r12, %r8
1453e09dc:     	callq	0x1457149fd <.text+0x57139fd>
1453e09e1:     	movq	%r12, 0x110(%rbp)
1453e09e8:     	movq	%r14, 0x108(%rbp)
1453e09ef:     	movq	0x100(%rbp), %rdx
1453e09f6:     	testq	%rdx, %rdx
1453e09f9:     	je	0x1453e0a0d <.text+0x53dfa0d>
1453e09fb:     	movl	$0x1, %r8d
1453e0a01:     	movq	0xe8(%rbp), %rcx
1453e0a08:     	callq	0x1400021d0 <.text+0x11d0>
1453e0a0d:     	cmpl	$0x4, %ebx
1453e0a10:     	jne	0x1453e0a29 <.text+0x53dfa29>
1453e0a12:     	cmpb	$0x0, (%r13)
1453e0a17:     	je	0x1453e0a29 <.text+0x53dfa29>
1453e0a19:     	leaq	0x4(%r13), %rax
1453e0a1d:     	movl	$0x1, 0xb8(%rbp)
1453e0a27:     	jmp	0x1453e0a37 <.text+0x53dfa37>
1453e0a29:     	leaq	0x6c(%r13), %rax
1453e0a2d:     	movl	0x74(%r13), %ecx
1453e0a31:     	movl	%ecx, 0xb8(%rbp)
1453e0a37:     	leaq	0xa0(%rbp), %rdx
1453e0a3e:     	movl	0x78(%r13,%rbx,4), %ecx
1453e0a43:     	movl	%ecx, -0x10(%rbp)
1453e0a46:     	movl	0x68(%r13), %ecx
1453e0a4a:     	movl	%ecx, 0x9c(%rbp)
1453e0a50:     	movl	(%rax), %eax
1453e0a52:     	movl	%eax, -0x8(%rbp)
1453e0a55:     	movl	0x70(%r13), %eax
1453e0a59:     	movl	%eax, 0xfc(%rbp)
1453e0a5f:     	movzbl	0x8c(%r13), %eax
1453e0a67:     	movb	%al, 0xb0(%rbp)
1453e0a6d:     	movq	0x58(%r13), %rax
1453e0a71:     	movq	0x60(%r13), %rcx
1453e0a75:     	leaq	(%rax,%rcx,8), %rcx
1453e0a79:     	movq	%rax, 0x18(%rbp)
1453e0a7d:     	movq	%rcx, 0x20(%rbp)
1453e0a81:     	movq	%rdx, 0x28(%rbp)
1453e0a85:     	movq	0x108(%rbp), %rax
1453e0a8c:     	movq	%rax, 0xe0(%rbp)
1453e0a93:     	movq	0xf0(%rbp), %r13
1453e0a9a:     	movq	%r13, 0xd8(%rbp)
1453e0aa1:     	movb	$0x0, 0x11f(%rbp)
1453e0aa8:     	movb	$0x1, 0x11e(%rbp)
1453e0aaf:     	movq	%rbp, %rcx
1453e0ab2:     	leaq	0x18(%rbp), %rdx
1453e0ab6:     	callq	0x1454d8d60 <.text+0x54d7d60>
1453e0abb:     	nop
1453e0abc:     	testl	%ebx, %ebx
1453e0abe:     	movq	-0x18(%rbp), %rax
1453e0ac2:     	movq	0x108(%rbp), %r8
1453e0ac9:     	movq	%r13, 0xf0(%rbp)
1453e0ad0:     	je	0x1453e0bd7 <.text+0x53dfbd7>
1453e0ad6:     	leal	(%rax,%rax,2), %r12d
1453e0ada:     	addl	%r15d, %r12d
1453e0add:     	andl	$0x7, %r12d
1453e0ae1:     	movl	%r12d, %eax
1453e0ae4:     	shll	$0x4, %eax
1453e0ae7:     	leaq	0x12ec636(%rip), %rcx   # 0x1466cd124
1453e0aee:     	leaq	(%rcx,%rax), %rdx
1453e0af2:     	addq	%rcx, %rax
1453e0af5:     	addq	$0x10, %rax
1453e0af9:     	movq	%rdx, 0x18(%rbp)
1453e0afd:     	movq	%rax, 0x20(%rbp)
1453e0b01:     	leaq	0xa0(%rbp), %rax
1453e0b08:     	movq	%rax, 0x28(%rbp)
1453e0b0c:     	movq	%r8, 0xe0(%rbp)
1453e0b13:     	movq	%r13, 0xd8(%rbp)
1453e0b1a:     	movb	$0x0, 0x11f(%rbp)
1453e0b21:     	movb	$0x1, 0x11e(%rbp)
1453e0b28:     	movq	%rbp, %rcx
1453e0b2b:     	leaq	0x18(%rbp), %rdx
1453e0b2f:     	callq	0x1454d8de0 <.text+0x54d7de0>
1453e0b34:     	nop
1453e0b35:     	movq	0x108(%rbp), %rax
1453e0b3c:     	movq	%rax, 0xe0(%rbp)
1453e0b43:     	movq	%r13, 0xd8(%rbp)
1453e0b4a:     	movb	$0x0, 0x11f(%rbp)
1453e0b51:     	movb	$0x1, 0x11e(%rbp)
1453e0b58:     	movq	-0x18(%rbp), %rcx
1453e0b5c:     	movq	%r12, %rdx
1453e0b5f:     	movq	%rbx, %r8
1453e0b62:     	callq	0x1453de5b0 <.text+0x53dd5b0>
1453e0b67:     	movq	%rax, -0x30(%rbp)
1453e0b6b:     	movq	%rdx, -0x40(%rbp)
1453e0b6f:     	movq	0x10(%rbp), %r14
1453e0b73:     	cmpl	$0x4, %ebx
1453e0b76:     	jne	0x1453e0be3 <.text+0x53dfbe3>
1453e0b78:     	cmpl	$0x8, %r15d
1453e0b7c:     	movabsq	$0x10000000b, %rax      # imm = 0x10000000B
1453e0b86:     	movabsq	$0x3d2c08310000000c, %r12 # imm = 0x3D2C08310000000C
1453e0b90:     	cmovaeq	%rax, %r12
1453e0b94:     	cmpq	(%rbp), %r14
1453e0b98:     	jne	0x1453e0bc6 <.text+0x53dfbc6>
1453e0b9a:     	movq	0x108(%rbp), %rax
1453e0ba1:     	movq	%rax, 0xe0(%rbp)
1453e0ba8:     	movq	%r13, 0xd8(%rbp)
1453e0baf:     	movb	$0x0, 0x11f(%rbp)
1453e0bb6:     	movb	$0x1, 0x11e(%rbp)
1453e0bbd:     	movq	%rbp, %rcx
1453e0bc0:     	callq	0x14573e0c0 <.text+0x573d0c0>
1453e0bc5:     	nop
1453e0bc6:     	movq	0x8(%rbp), %rax
1453e0bca:     	movq	%r12, (%rax,%r14,8)
1453e0bce:     	incq	%r14
1453e0bd1:     	movq	%r14, 0x10(%rbp)
1453e0bd5:     	jmp	0x1453e0be3 <.text+0x53dfbe3>
1453e0bd7:     	movq	0x10(%rbp), %r14
1453e0bdb:     	movq	$0x0, -0x30(%rbp)
1453e0be3:     	movq	(%rbp), %rax
1453e0be7:     	movq	%rax, 0xa8(%rbp)
1453e0bee:     	movq	0x8(%rbp), %rax
1453e0bf2:     	movq	%rax, 0xe8(%rbp)
1453e0bf9:     	movq	$0x0, 0x18(%rbp)
1453e0c01:     	movq	$0x4, 0x20(%rbp)
1453e0c09:     	movq	$0x0, 0x28(%rbp)
1453e0c11:     	testq	%r14, %r14
1453e0c14:     	movq	0x110(%rbp), %r12
1453e0c1b:     	je	0x1453e0e5b <.text+0x53dfe5b>
1453e0c21:     	movq	0xe8(%rbp), %r13
1453e0c28:     	leaq	(,%r14,8), %rax
1453e0c30:     	addq	%r13, %rax
1453e0c33:     	movq	%rax, 0x100(%rbp)
1453e0c3a:     	jmp	0x1453e0c5b <.text+0x53dfc5b>
1453e0c3c:     	movq	%r14, (%rax,%r12,8)
1453e0c40:     	incq	%r12
1453e0c43:     	movq	%r12, 0x28(%rbp)
1453e0c47:     	movq	0x110(%rbp), %r12
1453e0c4e:     	cmpq	0x100(%rbp), %r13
1453e0c55:     	je	0x1453e0e5b <.text+0x53dfe5b>
1453e0c5b:     	movq	(%r13), %r14
1453e0c5f:     	cmpl	$-0x1, %r14d
1453e0c63:     	je	0x1453e0e5b <.text+0x53dfe5b>
1453e0c69:     	addq	$0x8, %r13
1453e0c6d:     	movq	0x20(%rbp), %rax
1453e0c71:     	movq	0x28(%rbp), %r12
1453e0c75:     	leaq	(,%r12,8), %rdx
1453e0c7d:     	xorl	%r8d, %r8d
1453e0c80:     	cmpq	%r8, %rdx
1453e0c83:     	je	0x1453e0cca <.text+0x53dfcca>
1453e0c85:     	leaq	0x8(%r8), %rcx
1453e0c89:     	cmpl	%r14d, (%rax,%r8)
1453e0c8d:     	movq	%rcx, %r8
1453e0c90:     	jne	0x1453e0c80 <.text+0x53dfc80>
1453e0c92:     	movq	-0x8(%rax,%rcx), %r8
1453e0c97:     	movq	%r8, %rdx
1453e0c9a:     	shrq	$0x20, %rdx
1453e0c9e:     	movl	%r14d, %r9d
1453e0ca1:     	xorl	%r8d, %r9d
1453e0ca4:     	je	0x1453e0ce7 <.text+0x53dfce7>
1453e0ca6:     	movl	%r8d, %r8d
1453e0ca9:     	movq	0x110(%rbp), %r12
1453e0cb0:     	shlq	$0x20, %rdx
1453e0cb4:     	orq	%r8, %rdx
1453e0cb7:     	movq	%rdx, -0x8(%rax,%rcx)
1453e0cbc:     	cmpq	0x100(%rbp), %r13
1453e0cc3:     	jne	0x1453e0c5b <.text+0x53dfc5b>
1453e0cc5:     	jmp	0x1453e0e5b <.text+0x53dfe5b>
1453e0cca:     	cmpq	0x18(%rbp), %r12
1453e0cce:     	jne	0x1453e0c3c <.text+0x53dfc3c>
1453e0cd4:     	leaq	0x18(%rbp), %rcx
1453e0cd8:     	callq	0x14573e0c0 <.text+0x573d0c0>
1453e0cdd:     	nop
1453e0cde:     	movq	0x20(%rbp), %rax
1453e0ce2:     	jmp	0x1453e0c3c <.text+0x53dfc3c>
1453e0ce7:     	shrq	$0x20, %r14
1453e0ceb:     	movl	%r8d, %r8d
1453e0cee:     	leaq	0x12f964f(%rip), %r9    # 0x1466da344
1453e0cf5:     	movslq	(%r9,%r8,4), %r8
1453e0cf9:     	addq	%r9, %r8
1453e0cfc:     	movq	0x110(%rbp), %r12
1453e0d03:     	jmpq	*%r8
1453e0d06:     	movd	%edx, %xmm0
1453e0d0a:     	movd	%r14d, %xmm1
1453e0d0f:     	addss	%xmm0, %xmm1
1453e0d13:     	movd	%xmm1, %edx
1453e0d17:     	xorl	%r8d, %r8d
1453e0d1a:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d1c:     	addl	%r14d, %edx
1453e0d1f:     	movl	$0xb, %r8d
1453e0d25:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d27:     	movd	%edx, %xmm0
1453e0d2b:     	movd	%r14d, %xmm1
1453e0d30:     	addss	%xmm0, %xmm1
1453e0d34:     	movd	%xmm1, %edx
1453e0d38:     	movl	$0x4, %r8d
1453e0d3e:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d43:     	movd	%edx, %xmm0
1453e0d47:     	movd	%r14d, %xmm1
1453e0d4c:     	addss	%xmm0, %xmm1
1453e0d50:     	movd	%xmm1, %edx
1453e0d54:     	movl	$0xc, %r8d
1453e0d5a:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d5f:     	movd	%edx, %xmm0
1453e0d63:     	movd	%r14d, %xmm1
1453e0d68:     	addss	%xmm0, %xmm1
1453e0d6c:     	movd	%xmm1, %edx
1453e0d70:     	movl	$0x9, %r8d
1453e0d76:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d7b:     	movd	%edx, %xmm0
1453e0d7f:     	movd	%r14d, %xmm1
1453e0d84:     	addss	%xmm0, %xmm1
1453e0d88:     	movd	%xmm1, %edx
1453e0d8c:     	movl	$0x2, %r8d
1453e0d92:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0d97:     	movd	%edx, %xmm0
1453e0d9b:     	movd	%r14d, %xmm1
1453e0da0:     	addss	%xmm0, %xmm1
1453e0da4:     	movd	%xmm1, %edx
1453e0da8:     	movl	$0x3, %r8d
1453e0dae:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0db3:     	movd	%edx, %xmm0
1453e0db7:     	movd	%r14d, %xmm1
1453e0dbc:     	addss	%xmm0, %xmm1
1453e0dc0:     	movd	%xmm1, %edx
1453e0dc4:     	movl	$0x7, %r8d
1453e0dca:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0dcf:     	movd	%edx, %xmm0
1453e0dd3:     	movd	%r14d, %xmm1
1453e0dd8:     	addss	%xmm0, %xmm1
1453e0ddc:     	movd	%xmm1, %edx
1453e0de0:     	movl	$0x1, %r8d
1453e0de6:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0deb:     	movd	%edx, %xmm0
1453e0def:     	movd	%r14d, %xmm1
1453e0df4:     	addss	%xmm0, %xmm1
1453e0df8:     	movd	%xmm1, %edx
1453e0dfc:     	movl	$0x5, %r8d
1453e0e02:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0e07:     	movd	%edx, %xmm0
1453e0e0b:     	movd	%r14d, %xmm1
1453e0e10:     	addss	%xmm0, %xmm1
1453e0e14:     	movd	%xmm1, %edx
1453e0e18:     	movl	$0x6, %r8d
1453e0e1e:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0e23:     	movd	%edx, %xmm0
1453e0e27:     	movd	%r14d, %xmm1
1453e0e2c:     	addss	%xmm0, %xmm1
1453e0e30:     	movd	%xmm1, %edx
1453e0e34:     	movl	$0xa, %r8d
1453e0e3a:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0e3f:     	movd	%edx, %xmm0
1453e0e43:     	movd	%r14d, %xmm1
1453e0e48:     	addss	%xmm0, %xmm1
1453e0e4c:     	movd	%xmm1, %edx
1453e0e50:     	movl	$0x8, %r8d
1453e0e56:     	jmp	0x1453e0cb0 <.text+0x53dfcb0>
1453e0e5b:     	movq	0xa8(%rbp), %rdx
1453e0e62:     	testq	%rdx, %rdx
1453e0e65:     	je	0x1453e0e7d <.text+0x53dfe7d>
1453e0e67:     	shlq	$0x3, %rdx
1453e0e6b:     	movl	$0x4, %r8d
1453e0e71:     	movq	0xe8(%rbp), %rcx
1453e0e78:     	callq	0x1400021d0 <.text+0x11d0>
1453e0e7d:     	movq	0x28(%rbp), %rax
1453e0e81:     	movq	%rax, 0x28(%rsi)
1453e0e85:     	movups	0x18(%rbp), %xmm0
1453e0e89:     	movups	%xmm0, 0x18(%rsi)
1453e0e8d:     	movq	0xf0(%rbp), %rax
1453e0e94:     	movq	%rax, (%rsi)
1453e0e97:     	movq	0x108(%rbp), %rax
1453e0e9e:     	movq	%rax, 0x8(%rsi)
1453e0ea2:     	movq	%r12, 0x10(%rsi)
1453e0ea6:     	movq	%rbx, 0x30(%rsi)
1453e0eaa:     	movq	-0x30(%rbp), %rax
1453e0eae:     	movq	%rax, 0x38(%rsi)
1453e0eb2:     	movq	-0x40(%rbp), %rax
1453e0eb6:     	movq	%rax, 0x40(%rsi)
1453e0eba:     	movq	%r15, 0x48(%rsi)
1453e0ebe:     	movl	%edi, 0x50(%rsi)
1453e0ec1:     	movl	-0x10(%rbp), %eax
1453e0ec4:     	movl	%eax, 0x54(%rsi)
1453e0ec7:     	movl	0x9c(%rbp), %eax
1453e0ecd:     	movl	%eax, 0x58(%rsi)
1453e0ed0:     	movl	-0x8(%rbp), %eax
1453e0ed3:     	movl	%eax, 0x5c(%rsi)
1453e0ed6:     	movl	0xfc(%rbp), %eax
1453e0edc:     	movl	%eax, 0x60(%rsi)
1453e0edf:     	movl	0xb8(%rbp), %eax
1453e0ee5:     	movl	%eax, 0x64(%rsi)
1453e0ee8:     	movzbl	0xb0(%rbp), %eax
1453e0eef:     	movb	%al, 0x68(%rsi)
1453e0ef2:     	movq	-0x18(%rbp), %rax
1453e0ef6:     	movb	%al, 0x69(%rsi)
1453e0ef9:     	jmp	0x1453e0551 <.text+0x53df551>
1453e0efe:     	movl	$0x2, %eax
1453e0f03:     	leaq	0x12ec1e2(%rip), %rcx   # 0x1466cd0ec
1453e0f0a:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f0f:     	movl	$0x2, %eax
1453e0f14:     	leaq	0x12ec1b1(%rip), %rcx   # 0x1466cd0cc
1453e0f1b:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f20:     	movl	$0x2, %eax
1453e0f25:     	leaq	0x12ec1b0(%rip), %rcx   # 0x1466cd0dc
1453e0f2c:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f31:     	movl	$0x3, %eax
1453e0f36:     	leaq	0x12ec1cf(%rip), %rcx   # 0x1466cd10c
1453e0f3d:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f42:     	movl	$0x2, %eax
1453e0f47:     	leaq	0x12ec16e(%rip), %rcx   # 0x1466cd0bc
1453e0f4e:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f53:     	movl	$0x1, %eax
1453e0f58:     	leaq	0x12ec19d(%rip), %rcx   # 0x1466cd0fc
1453e0f5f:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f64:     	movl	$0x1, %eax
1453e0f69:     	leaq	0x12ec194(%rip), %rcx   # 0x1466cd104
1453e0f70:     	jmp	0x1453e081c <.text+0x53df81c>
1453e0f75:     	movq	0x28(%rbp), %rdx
1453e0f79:     	movq	0xf0(%rbp), %rcx
1453e0f80:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1453e0f85:     	nop
1453e0f86:     	ud2
