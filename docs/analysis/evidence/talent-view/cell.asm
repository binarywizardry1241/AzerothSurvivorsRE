
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140129140:     	pushq	%rbp
140129141:     	pushq	%r15
140129143:     	pushq	%r14
140129145:     	pushq	%r13
140129147:     	pushq	%r12
140129149:     	pushq	%rsi
14012914a:     	pushq	%rdi
14012914b:     	pushq	%rbx
14012914c:     	subq	$0x8a8, %rsp            # imm = 0x8A8
140129153:     	leaq	0x80(%rsp), %rbp
14012915b:     	movaps	%xmm9, 0x810(%rbp)
140129163:     	movaps	%xmm8, 0x800(%rbp)
14012916b:     	movaps	%xmm7, 0x7f0(%rbp)
140129172:     	movaps	%xmm6, 0x7e0(%rbp)
140129179:     	movq	$-0x2, 0x7d8(%rbp)
140129184:     	movq	%r9, 0x7c8(%rbp)
14012918b:     	movq	%r8, 0x798(%rbp)
140129192:     	movq	%rdx, 0x7a8(%rbp)
140129199:     	movq	%rcx, 0x7a0(%rbp)
1401291a0:     	movq	0x8a0(%rbp), %rbx
1401291a7:     	movq	0x898(%rbp), %rax
1401291ae:     	movzbl	0x890(%rbp), %r14d
1401291b6:     	movq	0x20(%rax), %r15
1401291ba:     	movq	0x28(%rax), %rsi
1401291be:     	movq	%rbx, %rcx
1401291c1:     	movq	%r15, %rdx
1401291c4:     	movq	%rsi, %r8
1401291c7:     	callq	0x1458e1f90 <.text+0x58e0f90>
1401291cc:     	movl	%eax, %r12d
1401291cf:     	movb	%al, 0x7d6(%rbp)
1401291d5:     	cmpb	$0x0, 0x8b0(%rbp)
1401291dc:     	je	0x1401291ee <.text+0x1281ee>
1401291de:     	movq	%rbx, %rdi
1401291e1:     	movl	%r14d, %ebx
1401291e4:     	movq	%rsi, %r14
1401291e7:     	movq	%r15, %r13
1401291ea:     	xorl	%eax, %eax
1401291ec:     	jmp	0x140129215 <.text+0x128215>
1401291ee:     	movl	0x8a8(%rbp), %eax
1401291f4:     	movl	%eax, 0x20(%rsp)
1401291f8:     	movq	%rbx, %rdi
1401291fb:     	movq	%rbx, %rcx
1401291fe:     	movl	%r14d, %ebx
140129201:     	movl	%r14d, %edx
140129204:     	movq	%r15, %r13
140129207:     	movq	%r15, %r8
14012920a:     	movq	%rsi, %r14
14012920d:     	movq	%rsi, %r9
140129210:     	callq	0x1458e27c0 <.text+0x58e17c0>
140129215:     	movb	%al, 0x7d7(%rbp)
14012921b:     	testb	%r12b, %r12b
14012921e:     	setne	%r15b
140129222:     	orb	%al, %r15b
140129225:     	testb	$0x1, %r15b
140129229:     	movq	0x898(%rbp), %rsi
140129230:     	jne	0x140129258 <.text+0x128258>
140129232:     	movl	$0xffffffff, 0x20(%rsp) # imm = 0xFFFFFFFF
14012923a:     	movq	%rdi, %rcx
14012923d:     	movl	%ebx, %edx
14012923f:     	movq	%r13, %r8
140129242:     	movq	%r14, %r9
140129245:     	callq	0x1458e27c0 <.text+0x58e17c0>
14012924a:     	testb	%al, %al
14012924c:     	jne	0x140129258 <.text+0x128258>
14012924e:     	movss	0x5c4457a(%rip), %xmm7  # 0x145d6d7d0
140129256:     	jmp	0x140129260 <.text+0x128260>
140129258:     	movss	0x5c4ad64(%rip), %xmm7  # 0x145d73fc4
140129260:     	movq	0x7c8(%rbp), %rax
140129267:     	movzbl	0x72(%rsi), %ebx
14012926b:     	cmpb	%bl, %r12b
14012926e:     	setae	0x7d5(%rbp)
140129275:     	movq	0x58(%rax), %rcx
140129279:     	testq	%rcx, %rcx
14012927c:     	je	0x140129293 <.text+0x128293>
14012927e:     	cmpq	%r14, 0x60(%rax)
140129282:     	jne	0x140129293 <.text+0x128293>
140129284:     	movq	%r13, %rdx
140129287:     	movq	%r14, %r8
14012928a:     	callq	0x145bc9787 <.text+0x5bc8787>
14012928f:     	testl	%eax, %eax
140129291:     	je	0x1401292d4 <.text+0x1282d4>
140129293:     	cmpb	%bl, %r12b
140129296:     	jb	0x1401292a1 <.text+0x1282a1>
140129298:     	movups	0x5c81051(%rip), %xmm0  # 0x145daa2f0
14012929f:     	jmp	0x1401292f6 <.text+0x1282f6>
1401292a1:     	testb	$0x1, %r15b
1401292a5:     	je	0x1401292b0 <.text+0x1282b0>
1401292a7:     	movups	0x5c8153a(%rip), %xmm0  # 0x145daa7e8
1401292ae:     	jmp	0x1401292f6 <.text+0x1282f6>
1401292b0:     	movq	%rsi, %rcx
1401292b3:     	callq	0x1458e13b0 <.text+0x58e03b0>
1401292b8:     	testb	%al, %al
1401292ba:     	je	0x1401292ef <.text+0x1282ef>
1401292bc:     	movups	0x5c81709(%rip), %xmm0  # 0x145daa9cc
1401292c3:     	movaps	%xmm0, 0x7b0(%rbp)
1401292ca:     	movss	0x5c4ad36(%rip), %xmm6  # 0x145d74008
1401292d2:     	jmp	0x140129305 <.text+0x128305>
1401292d4:     	movups	0x5c81529(%rip), %xmm0  # 0x145daa804
1401292db:     	movaps	%xmm0, 0x7b0(%rbp)
1401292e2:     	movb	$0x1, %dil
1401292e5:     	movss	0x5c4407f(%rip), %xmm6  # 0x145d6d36c
1401292ed:     	jmp	0x140129307 <.text+0x128307>
1401292ef:     	movups	0x5c81026(%rip), %xmm0  # 0x145daa31c
1401292f6:     	movaps	%xmm0, 0x7b0(%rbp)
1401292fd:     	movss	0x5c44067(%rip), %xmm6  # 0x145d6d36c
140129305:     	xorl	%edi, %edi
140129307:     	movzbl	0x71(%rsi), %eax
14012930b:     	cvtsi2ss	%eax, %xmm8
140129310:     	movss	0x5c4443c(%rip), %xmm0  # 0x145d6d754
140129318:     	addss	%xmm0, %xmm8
14012931d:     	mulss	0x5c7fc1a(%rip), %xmm8  # 0x145da8f40
140129326:     	movss	0x5c4442e(%rip), %xmm1  # 0x145d6d75c
14012932e:     	addss	%xmm1, %xmm8
140129333:     	movzbl	0x70(%rsi), %eax
140129337:     	cvtsi2ss	%eax, %xmm9
14012933c:     	addss	%xmm0, %xmm9
140129341:     	mulss	0x5c7fbfa(%rip), %xmm9  # 0x145da8f44
14012934a:     	addss	%xmm1, %xmm9
14012934f:     	movq	%rsi, %rcx
140129352:     	callq	0x1458e13b0 <.text+0x58e03b0>
140129357:     	testb	%al, %al
140129359:     	jne	0x140129365 <.text+0x128365>
14012935b:     	movss	0x5c4aaad(%rip), %xmm0  # 0x145d73e10
140129363:     	jmp	0x14012936d <.text+0x12836d>
140129365:     	movss	0x5c442e3(%rip), %xmm0  # 0x145d6d650
14012936d:     	movw	$0x0, 0x6c4(%rbp)
140129376:     	movb	$0x1, 0x6b4(%rbp)
14012937d:     	movl	$0x1, 0x5c8(%rbp)
140129387:     	movss	%xmm8, 0x5cc(%rbp)
140129390:     	movq	$0x0, 0x5d0(%rbp)
14012939b:     	movl	$0x1, 0x5d8(%rbp)
1401293a5:     	movss	%xmm9, 0x5dc(%rbp)
1401293ae:     	movaps	0x5c7fb9b(%rip), %xmm1  # 0x145da8f50
1401293b5:     	movaps	%xmm1, 0x5e0(%rbp)
1401293bc:     	movabsq	$0x4238000000000001, %rax # imm = 0x4238000000000001
1401293c6:     	movq	%rax, 0x5f0(%rbp)
1401293cd:     	movq	$0x0, 0x5c0(%rbp)
1401293d8:     	xorps	%xmm1, %xmm1
1401293db:     	movups	%xmm1, 0x5f8(%rbp)
1401293e2:     	movups	%xmm1, 0x608(%rbp)
1401293e9:     	movw	$0x0, 0x6dc(%rbp)
1401293f2:     	movl	$0x0, 0x6d8(%rbp)
1401293fc:     	movups	0x5c80a75(%rip), %xmm1  # 0x145da9e78
140129403:     	movups	%xmm1, 0x618(%rbp)
14012940a:     	movups	0x5c80a77(%rip), %xmm1  # 0x145da9e88
140129411:     	movups	%xmm1, 0x628(%rbp)
140129418:     	movups	0x5c80a89(%rip), %xmm1  # 0x145da9ea8
14012941f:     	movups	%xmm1, 0x648(%rbp)
140129426:     	movups	0x5c80a6b(%rip), %xmm1  # 0x145da9e98
14012942d:     	movups	%xmm1, 0x638(%rbp)
140129434:     	movaps	0x5c43fc5(%rip), %xmm1  # 0x145d6d400
14012943b:     	movups	%xmm1, 0x658(%rbp)
140129442:     	movups	%xmm1, 0x668(%rbp)
140129449:     	movl	$0x1, 0x678(%rbp)
140129453:     	movss	%xmm0, 0x67c(%rbp)
14012945b:     	movl	$0x1, 0x680(%rbp)
140129465:     	movss	%xmm0, 0x684(%rbp)
14012946d:     	movl	$0x1, 0x688(%rbp)
140129477:     	movss	%xmm0, 0x68c(%rbp)
14012947f:     	movl	$0x1, 0x690(%rbp)
140129489:     	movss	%xmm0, 0x694(%rbp)
140129491:     	movb	$0x0, 0x6d6(%rbp)
140129498:     	movl	$0x100, 0x6d2(%rbp)     # imm = 0x100
1401294a2:     	movq	$0x0, 0x6b8(%rbp)
1401294ad:     	movl	$0x3f800000, 0x6c0(%rbp) # imm = 0x3F800000
1401294b7:     	movaps	0x5c43da2(%rip), %xmm0  # 0x145d6d260
1401294be:     	movups	%xmm0, 0x698(%rbp)
1401294c5:     	movl	$0x1, 0x6a8(%rbp)
1401294cf:     	movq	$0x0, 0x6ac(%rbp)
1401294da:     	movb	$0x0, 0x6d7(%rbp)
1401294e1:     	movups	0x5c808d8(%rip), %xmm0  # 0x145da9dc0
1401294e8:     	movaps	%xmm0, 0x560(%rbp)
1401294ef:     	movq	$0x0, 0x570(%rbp)
1401294fa:     	movups	0x5c808d7(%rip), %xmm0  # 0x145da9dd8
140129501:     	movups	%xmm0, 0x578(%rbp)
140129508:     	movq	$0x0, 0x588(%rbp)
140129513:     	movups	0x5c808d6(%rip), %xmm0  # 0x145da9df0
14012951a:     	movaps	%xmm0, 0x590(%rbp)
140129521:     	movq	$0x0, 0x5a0(%rbp)
14012952c:     	movups	0x5c808d5(%rip), %xmm0  # 0x145da9e08
140129533:     	movups	%xmm0, 0x5a8(%rbp)
14012953a:     	movq	$0x0, 0x5b8(%rbp)
140129545:     	movw	$0x0, 0x6ca(%rbp)
14012954e:     	movl	$0x10000, 0x6c6(%rbp)   # imm = 0x10000
140129558:     	movw	$0x0, 0x6d0(%rbp)
140129561:     	movl	$0x10000, 0x6cc(%rbp)   # imm = 0x10000
14012956b:     	movq	0x40(%rsi), %r8
14012956f:     	movq	0x48(%rsi), %r9
140129573:     	leaq	0x1e8(%rbp), %rcx
14012957a:     	movq	0x798(%rbp), %rdx
140129581:     	callq	0x1400123b0 <.text+0x113b0>
140129586:     	nop
140129587:     	testb	%r12b, %r12b
14012958a:     	setne	%al
14012958d:     	orb	0x7d7(%rbp), %al
140129593:     	movzbl	%al, %ecx
140129596:     	movl	%ecx, %eax
140129598:     	andl	$0x1, %eax
14012959b:     	testb	$0x1, %cl
14012959e:     	je	0x1401295a8 <.text+0x1285a8>
1401295a0:     	movss	0x5c43dc4(%rip), %xmm7  # 0x145d6d36c
1401295a8:     	movups	0x5c813a1(%rip), %xmm0  # 0x145daa950
1401295af:     	movups	%xmm0, 0x720(%rbp)
1401295b6:     	movabsq	$0x23f800000, %rcx      # imm = 0x23F800000
1401295c0:     	movq	%rcx, 0x730(%rbp)
1401295c7:     	movups	0x5c8139a(%rip), %xmm0  # 0x145daa968
1401295ce:     	movups	%xmm0, 0x708(%rbp)
1401295d5:     	movq	$0x46, 0x718(%rbp)
1401295e0:     	movb	$0x2, 0x6e8(%rbp)
1401295e7:     	movw	$0x0, 0x76c(%rbp)
1401295f0:     	movl	$0x0, 0x758(%rbp)
1401295fa:     	movl	%eax, 0x508(%rbp)
140129600:     	movaps	0x5c43cf9(%rip), %xmm0  # 0x145d6d300
140129607:     	movss	%xmm7, %xmm0            # xmm0 = xmm7[0],xmm0[1,2,3]
14012960b:     	shufps	$0x40, %xmm0, %xmm0     # xmm0 = xmm0[0,0,0,1]
14012960f:     	movups	%xmm0, 0x50c(%rbp)
140129616:     	movups	0x1e8(%rbp), %xmm0
14012961d:     	movaps	%xmm0, 0x4f0(%rbp)
140129624:     	movq	0x1f8(%rbp), %rax
14012962b:     	movq	%rax, 0x500(%rbp)
140129632:     	movups	0x6f8(%rbp), %xmm0
140129639:     	movaps	%xmm0, 0x4e0(%rbp)
140129640:     	movzbl	0x6e8(%rbp), %eax
140129647:     	movb	%al, 0x4d0(%rbp)
14012964d:     	movq	0x6e9(%rbp), %rax
140129654:     	movq	%rax, 0x4d1(%rbp)
14012965b:     	movl	0x6f1(%rbp), %eax
140129661:     	movl	%eax, 0x4d9(%rbp)
140129667:     	movzwl	0x6f5(%rbp), %eax
14012966e:     	movw	%ax, 0x4dd(%rbp)
140129675:     	movzbl	0x6f7(%rbp), %eax
14012967c:     	movb	%al, 0x4df(%rbp)
140129682:     	movw	$0x0, 0x554(%rbp)
14012968b:     	movups	0x758(%rbp), %xmm0
140129692:     	movaps	%xmm0, 0x540(%rbp)
140129699:     	movl	0x768(%rbp), %eax
14012969f:     	movl	%eax, 0x550(%rbp)
1401296a5:     	movups	0x734(%rbp), %xmm0
1401296ac:     	movups	%xmm0, 0x51c(%rbp)
1401296b3:     	movups	0x744(%rbp), %xmm0
1401296ba:     	movups	%xmm0, 0x52c(%rbp)
1401296c1:     	movl	0x754(%rbp), %eax
1401296c7:     	movl	%eax, 0x53c(%rbp)
1401296cd:     	movq	%rsi, %rcx
1401296d0:     	callq	0x1458e13b0 <.text+0x58e03b0>
1401296d5:     	nop
1401296d6:     	testb	%al, %al
1401296d8:     	je	0x140129700 <.text+0x128700>
1401296da:     	xorl	%eax, %eax
1401296dc:     	testb	%r12b, %r12b
1401296df:     	setne	%al
1401296e2:     	leaq	0x5c7f877(%rip), %rcx   # 0x145da8f60
1401296e9:     	movss	(%rcx,%rax,4), %xmm0
1401296ee:     	movups	0x5c812d7(%rip), %xmm1  # 0x145daa9cc
1401296f5:     	movaps	%xmm1, -0x30(%rbp)
1401296f9:     	movss	%xmm0, -0x20(%rbp)
1401296fe:     	jmp	0x14012972b <.text+0x12872b>
140129700:     	testb	%dil, %dil
140129703:     	je	0x140129719 <.text+0x128719>
140129705:     	movups	0x5c80be4(%rip), %xmm0  # 0x145daa2f0
14012970c:     	movaps	%xmm0, -0x30(%rbp)
140129710:     	movl	$0x3f4ccccd, -0x20(%rbp) # imm = 0x3F4CCCCD
140129717:     	jmp	0x14012972b <.text+0x12872b>
140129719:     	movups	0x5c81020(%rip), %xmm0  # 0x145daa740
140129720:     	movaps	%xmm0, -0x30(%rbp)
140129724:     	movl	$0x3f59999a, -0x20(%rbp) # imm = 0x3F59999A
14012972b:     	movq	%rsi, %rcx
14012972e:     	callq	0x1458e13b0 <.text+0x58e03b0>
140129733:     	nop
140129734:     	movb	%al, %bl
140129736:     	movq	%rsi, %rcx
140129739:     	callq	0x1458e13b0 <.text+0x58e03b0>
14012973e:     	nop
14012973f:     	movb	%al, %dil
140129742:     	leaq	0x770(%rbp), %rcx
140129749:     	leaq	-0x30(%rbp), %rdx
14012974d:     	callq	0x144c67100 <.text+0x4c66100>
140129752:     	nop
140129753:     	testb	%dil, %dil
140129756:     	jne	0x140129769 <.text+0x128769>
140129758:     	movss	0x5c4a6b0(%rip), %xmm0  # 0x145d73e10
140129760:     	xorps	%xmm1, %xmm1
140129763:     	testb	%bl, %bl
140129765:     	jne	0x140129778 <.text+0x128778>
140129767:     	jmp	0x140129780 <.text+0x128780>
140129769:     	movss	0x5c43aff(%rip), %xmm0  # 0x145d6d270
140129771:     	xorps	%xmm1, %xmm1
140129774:     	testb	%bl, %bl
140129776:     	je	0x140129780 <.text+0x128780>
140129778:     	movss	0x5c43cac(%rip), %xmm1  # 0x145d6d42c
140129780:     	movaps	0x770(%rbp), %xmm2
140129787:     	movups	%xmm2, 0x1ec(%rbp)
14012978e:     	movl	$0x1, 0x1e8(%rbp)
140129798:     	movss	%xmm0, 0x48(%rsp)
14012979e:     	movss	%xmm1, 0x38(%rsp)
1401297a4:     	movl	$0x1, 0x40(%rsp)
1401297ac:     	movl	$0x1, 0x30(%rsp)
1401297b4:     	movl	$0x0, 0x28(%rsp)
1401297bc:     	movl	$0x1, 0x20(%rsp)
1401297c4:     	leaq	0x4b8(%rbp), %rcx
1401297cb:     	leaq	0x1e8(%rbp), %rdx
1401297d2:     	xorps	%xmm3, %xmm3
1401297d5:     	movl	$0x1, %r8d
1401297db:     	callq	0x142633750 <.text+0x2632750>
1401297e0:     	nop
1401297e1:     	movaps	0x7b0(%rbp), %xmm0
1401297e8:     	movups	%xmm0, 0x458(%rbp)
1401297ef:     	leaq	-0x30(%rbp), %rdi
1401297f3:     	leaq	0x560(%rbp), %rdx
1401297fa:     	movl	$0x180, %r8d            # imm = 0x180
140129800:     	movq	%rdi, %rcx
140129803:     	callq	0x145bc977b <.text+0x5bc877b>
140129808:     	movaps	0x7b0(%rbp), %xmm0
14012980f:     	movups	%xmm0, 0x1d8(%rbp)
140129816:     	movups	%xmm0, 0x40c(%rbp)
14012981d:     	movups	%xmm0, 0x420(%rbp)
140129824:     	movups	%xmm0, 0x434(%rbp)
14012982b:     	leaq	0x150(%rbp), %rcx
140129832:     	leaq	0x4d0(%rbp), %rdx
140129839:     	movl	$0x88, %r8d
14012983f:     	callq	0x145bc977b <.text+0x5bc877b>
140129844:     	movups	0x4b8(%rbp), %xmm0
14012984b:     	movups	%xmm0, 0x777(%rbp)
140129852:     	movq	0x4c8(%rbp), %rax
140129859:     	movq	%rax, 0x787(%rbp)
140129860:     	movq	0x7a0(%rbp), %r15
140129867:     	movq	(%r15), %rbx
14012986a:     	addq	$0x8, %r15
14012986e:     	leaq	0x1f0(%rbp), %rcx
140129875:     	movl	$0x218, %r8d            # imm = 0x218
14012987b:     	movq	%rdi, %rdx
14012987e:     	callq	0x145bc977b <.text+0x5bc877b>
140129883:     	movss	%xmm6, 0x408(%rbp)
14012988b:     	movss	%xmm6, 0x41c(%rbp)
140129893:     	movss	%xmm6, 0x430(%rbp)
14012989b:     	movss	%xmm6, 0x444(%rbp)
1401298a3:     	movq	%r13, 0x448(%rbp)
1401298aa:     	movq	%r14, 0x450(%rbp)
1401298b1:     	movss	%xmm6, 0x468(%rbp)
1401298b9:     	movups	0x5c80f44(%rip), %xmm0  # 0x145daa804
1401298c0:     	movups	%xmm0, 0x46c(%rbp)
1401298c7:     	movq	$0x3f800000, 0x47c(%rbp) # imm = 0x3F800000
1401298d2:     	movups	0x5c8104f(%rip), %xmm0  # 0x145daa928
1401298d9:     	movups	%xmm0, 0x484(%rbp)
1401298e0:     	movl	$0x3f800000, 0x494(%rbp) # imm = 0x3F800000
1401298ea:     	movb	$0x2, 0x498(%rbp)
1401298f1:     	movups	0x770(%rbp), %xmm0
1401298f8:     	movups	0x77f(%rbp), %xmm1
1401298ff:     	movups	%xmm0, 0x499(%rbp)
140129906:     	movups	%xmm1, 0x4a8(%rbp)
14012990d:     	movq	%rbx, 0x1e8(%rbp)
140129914:     	leaq	0x5c44695(%rip), %r9    # 0x145d6dfb0
14012991b:     	leaq	0x560(%rbp), %rcx
140129922:     	leaq	0x1e8(%rbp), %r8
140129929:     	movq	%r15, %rdx
14012992c:     	callq	0x14019ddd0 <.text+0x19cdd0>
140129931:     	nop
140129932:     	cmpb	$0x0, 0x708(%rbp)
140129939:     	jne	0x140129954 <.text+0x128954>
14012993b:     	movq	0x710(%rbp), %rax
140129942:     	lock
140129943:     	decq	(%rax)
140129946:     	jne	0x140129954 <.text+0x128954>
140129948:     	leaq	0x710(%rbp), %rcx
14012994f:     	callq	0x14496e3f0 <.text+0x496d3f0>
140129954:     	cmpb	$0x0, 0x8b0(%rbp)
14012995b:     	jne	0x1401299bf <.text+0x1289bf>
14012995d:     	movq	0x578(%rbp), %rdi
140129964:     	testq	%rdi, %rdi
140129967:     	jne	0x140129970 <.text+0x128970>
140129969:     	movq	0x580(%rbp), %rdi
140129970:     	movq	0x560(%rbp), %r15
140129977:     	movq	(%rdi), %rax
14012997a:     	movq	0x10(%rdi), %rbx
14012997e:     	subq	%rbx, %rax
140129981:     	cmpq	$0x2f, %rax
140129985:     	jbe	0x140129a43 <.text+0x128a43>
14012998b:     	movq	0x8(%rdi), %rax
14012998f:     	leaq	0x101e0a(%rip), %rcx    # 0x14022b7a0 <.text+0x22a7a0>
140129996:     	movq	%rcx, (%rax,%rbx)
14012999a:     	movq	$0x0, 0x8(%rax,%rbx)
1401299a3:     	movq	%r13, 0x10(%rax,%rbx)
1401299a8:     	movq	%r14, 0x18(%rax,%rbx)
1401299ad:     	movb	$0x0, 0x20(%rax,%rbx)
1401299b2:     	movq	%r15, 0x28(%rax,%rbx)
1401299b7:     	addq	$0x30, %rbx
1401299bb:     	movq	%rbx, 0x10(%rdi)
1401299bf:     	movq	0x7a8(%rbp), %rax
1401299c6:     	movq	%rax, 0x1e8(%rbp)
1401299cd:     	leaq	0x7d5(%rbp), %rax
1401299d4:     	movq	%rax, 0x1f0(%rbp)
1401299db:     	leaq	0x7d6(%rbp), %rax
1401299e2:     	movq	%rax, 0x1f8(%rbp)
1401299e9:     	leaq	0x7d7(%rbp), %rax
1401299f0:     	movq	%rax, 0x200(%rbp)
1401299f7:     	movq	%rsi, 0x208(%rbp)
1401299fe:     	leaq	0x560(%rbp), %rcx
140129a05:     	leaq	0x1e8(%rbp), %rdx
140129a0c:     	callq	0x140216f90 <.text+0x215f90>
140129a11:     	movaps	0x7e0(%rbp), %xmm6
140129a18:     	movaps	0x7f0(%rbp), %xmm7
140129a1f:     	movaps	0x800(%rbp), %xmm8
140129a27:     	movaps	0x810(%rbp), %xmm9
140129a2f:     	addq	$0x8a8, %rsp            # imm = 0x8A8
140129a36:     	popq	%rbx
140129a37:     	popq	%rdi
140129a38:     	popq	%rsi
140129a39:     	popq	%r12
140129a3b:     	popq	%r13
140129a3d:     	popq	%r14
140129a3f:     	popq	%r15
140129a41:     	popq	%rbp
140129a42:     	retq
140129a43:     	movq	$0x1, 0x20(%rsp)
140129a4c:     	movl	$0x30, %r8d
140129a52:     	movl	$0x1, %r9d
140129a58:     	movq	%rdi, %rcx
140129a5b:     	movq	%rbx, %rdx
140129a5e:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140129a63:     	jmp	0x14012998b <.text+0x12898b>
