
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145414300:     	pushq	%rbp
145414301:     	pushq	%r15
145414303:     	pushq	%r14
145414305:     	pushq	%r13
145414307:     	pushq	%r12
145414309:     	pushq	%rsi
14541430a:     	pushq	%rdi
14541430b:     	pushq	%rbx
14541430c:     	subq	$0xd8, %rsp
145414313:     	leaq	0x80(%rsp), %rbp
14541431b:     	movaps	%xmm6, 0x40(%rbp)
14541431f:     	movq	$-0x2, 0x38(%rbp)
145414327:     	movq	%rdx, %rdi
14541432a:     	movq	%rcx, %r13
14541432d:     	movq	(%rdx), %r14
145414330:     	movq	0x8(%rdx), %r15
145414334:     	movq	$0x0, 0x20(%rbp)
14541433c:     	movq	$0x8, 0x28(%rbp)
145414344:     	movq	$0x0, 0x30(%rbp)
14541434c:     	movzbl	0x75(%rdx), %eax
145414350:     	leaq	0x130c2fd(%rip), %rcx   # 0x146720654
145414357:     	movslq	(%rcx,%rax,4), %rax
14541435b:     	addq	%rcx, %rax
14541435e:     	jmpq	*%rax
145414360:     	cmpl	$0x0, 0x54(%rdi)
145414364:     	je	0x145414dfb <.text+0x5413dfb>
14541436a:     	leaq	0x20(%rbp), %rcx
14541436e:     	callq	0x145764080 <.text+0x5763080>
145414373:     	nop
145414374:     	movq	0x28(%rbp), %rax
145414378:     	movb	$0x1f, (%rax)
14541437b:     	movb	$0x1, 0x8(%rax)
14541437f:     	movq	%r14, 0x10(%rax)
145414383:     	movq	%r15, 0x18(%rax)
145414387:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
14541438e:     	movb	$0x2, 0x24(%rax)
145414392:     	movq	$0x1, 0x30(%rbp)
14541439a:     	movl	$0x1, %esi
14541439f:     	cmpq	$0x1, 0x20(%rbp)
1454143a4:     	je	0x145414dfd <.text+0x5413dfd>
1454143aa:     	jmp	0x145414e07 <.text+0x5413e07>
1454143af:     	leaq	0x20(%rbp), %rcx
1454143b3:     	callq	0x145764080 <.text+0x5763080>
1454143b8:     	nop
1454143b9:     	movq	0x28(%rbp), %rax
1454143bd:     	movb	$0x1f, (%rax)
1454143c0:     	movb	$0x1, 0x8(%rax)
1454143c4:     	movq	%r14, 0x10(%rax)
1454143c8:     	movq	%r15, 0x18(%rax)
1454143cc:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
1454143d3:     	movb	$0x0, 0x24(%rax)
1454143d7:     	movq	$0x1, 0x30(%rbp)
1454143df:     	movq	0x30(%rdi), %rax
1454143e3:     	movq	0x38(%rdi), %rcx
1454143e7:     	xorl	%edx, %edx
1454143e9:     	nopl	(%rax)
1454143f0:     	cmpq	%rdx, %rcx
1454143f3:     	je	0x145414cab <.text+0x5413cab>
1454143f9:     	cmpb	$0x3, (%rax,%rdx)
1454143fd:     	leaq	0x1(%rdx), %rdx
145414401:     	jne	0x1454143f0 <.text+0x54133f0>
145414403:     	cmpq	$0x1, 0x20(%rbp)
145414408:     	jne	0x145414414 <.text+0x5413414>
14541440a:     	leaq	0x20(%rbp), %rcx
14541440e:     	callq	0x145764080 <.text+0x5763080>
145414413:     	nop
145414414:     	movq	0x28(%rbp), %rax
145414418:     	movb	$0x1f, 0x40(%rax)
14541441c:     	movb	$0x1, 0x48(%rax)
145414420:     	movq	%r14, 0x50(%rax)
145414424:     	movq	%r15, 0x58(%rax)
145414428:     	movl	$0x3ecccccd, 0x60(%rax) # imm = 0x3ECCCCCD
14541442f:     	movb	$0x3, 0x64(%rax)
145414433:     	movq	$0x2, 0x30(%rbp)
14541443b:     	movl	$0x2, %ebx
145414440:     	jmp	0x145414cb0 <.text+0x5413cb0>
145414445:     	cmpl	$0x0, 0x54(%rdi)
145414449:     	je	0x145414d65 <.text+0x5413d65>
14541444f:     	leaq	0x20(%rbp), %rcx
145414453:     	callq	0x145764080 <.text+0x5763080>
145414458:     	nop
145414459:     	movq	0x28(%rbp), %rax
14541445d:     	movb	$0x1f, (%rax)
145414460:     	movb	$0x1, 0x8(%rax)
145414464:     	movq	%r14, 0x10(%rax)
145414468:     	movq	%r15, 0x18(%rax)
14541446c:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
145414473:     	movb	$0x2, 0x24(%rax)
145414477:     	movq	$0x1, 0x30(%rbp)
14541447f:     	movl	$0x1, %esi
145414484:     	cmpq	$0x1, 0x20(%rbp)
145414489:     	je	0x145414d67 <.text+0x5413d67>
14541448f:     	jmp	0x145414d71 <.text+0x5413d71>
145414494:     	movss	0x58(%rdi), %xmm6
145414499:     	xorps	%xmm0, %xmm0
14541449c:     	ucomiss	%xmm0, %xmm6
14541449f:     	setbe	%al
1454144a2:     	movl	0x68(%rdi), %r12d
1454144a6:     	movl	%r12d, %ecx
1454144a9:     	andl	$0xe, %ecx
1454144ac:     	cmpl	$0x6, %ecx
1454144af:     	sete	%cl
1454144b2:     	orb	%al, %cl
1454144b4:     	jne	0x145414bc3 <.text+0x5413bc3>
1454144ba:     	cmpl	$0xc, %r12d
1454144be:     	ja	0x1454144d5 <.text+0x54134d5>
1454144c0:     	movl	$0x1300, %eax           # imm = 0x1300
1454144c5:     	btl	%r12d, %eax
1454144c9:     	jae	0x1454144d5 <.text+0x54134d5>
1454144cb:     	ucomiss	0x48(%rdi), %xmm6
1454144cf:     	jae	0x145414bc3 <.text+0x5413bc3>
1454144d5:     	leaq	0x20(%rbp), %rcx
1454144d9:     	callq	0x145764080 <.text+0x5763080>
1454144de:     	nop
1454144df:     	movq	0x28(%rbp), %rax
1454144e3:     	movb	$0x1f, (%rax)
1454144e6:     	movb	$0x1, 0x8(%rax)
1454144ea:     	movq	%r14, 0x10(%rax)
1454144ee:     	movq	%r15, 0x18(%rax)
1454144f2:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
1454144f9:     	movb	$0x4, 0x24(%rax)
1454144fd:     	movq	$0x1, 0x30(%rbp)
145414505:     	movl	$0x1, %ebx
14541450a:     	jmp	0x145414bc5 <.text+0x5413bc5>
14541450f:     	leaq	0x20(%rbp), %rcx
145414513:     	callq	0x145764080 <.text+0x5763080>
145414518:     	nop
145414519:     	movq	0x28(%rbp), %rax
14541451d:     	movb	$0x1f, (%rax)
145414520:     	movb	$0x1, 0x8(%rax)
145414524:     	movq	%r14, 0x10(%rax)
145414528:     	movq	%r15, 0x18(%rax)
14541452c:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
145414533:     	movb	$0x3, 0x24(%rax)
145414537:     	movq	$0x1, 0x30(%rbp)
14541453f:     	movq	0x20(%rbp), %rcx
145414543:     	cmpq	$0x1, %rcx
145414547:     	jne	0x145414557 <.text+0x5413557>
145414549:     	leaq	0x20(%rbp), %rcx
14541454d:     	callq	0x145764080 <.text+0x5763080>
145414552:     	nop
145414553:     	movq	0x20(%rbp), %rcx
145414557:     	movq	0x28(%rbp), %rax
14541455b:     	movb	$0x1f, 0x40(%rax)
14541455f:     	movb	$0x1, 0x48(%rax)
145414563:     	movq	%r14, 0x50(%rax)
145414567:     	movq	%r15, 0x58(%rax)
14541456b:     	movl	$0x3eb33333, 0x60(%rax) # imm = 0x3EB33333
145414572:     	movb	$0x0, 0x64(%rax)
145414576:     	movq	$0x2, 0x30(%rbp)
14541457e:     	cmpq	$0x2, %rcx
145414582:     	jne	0x145414592 <.text+0x5413592>
145414584:     	leaq	0x20(%rbp), %rcx
145414588:     	callq	0x145764080 <.text+0x5763080>
14541458d:     	nop
14541458e:     	movq	0x28(%rbp), %rax
145414592:     	movb	$0x8, 0x80(%rax)
145414599:     	movabsq	$0x33f800000, %rcx      # imm = 0x33F800000
1454145a3:     	movq	%rcx, 0x84(%rax)
1454145aa:     	movl	$0x3fc00000, 0x8c(%rax) # imm = 0x3FC00000
1454145b4:     	movl	$0x0, 0x98(%rax)
1454145be:     	movb	$0x1, 0xa0(%rax)
1454145c5:     	movq	%r14, 0xa8(%rax)
1454145cc:     	movq	%r15, 0xb0(%rax)
1454145d3:     	movq	$0x3, 0x30(%rbp)
1454145db:     	cmpl	$0xa, 0x68(%rdi)
1454145df:     	jne	0x14541462b <.text+0x541362b>
1454145e1:     	cmpq	$0x3, 0x20(%rbp)
1454145e6:     	jne	0x1454145f6 <.text+0x54135f6>
1454145e8:     	leaq	0x20(%rbp), %rcx
1454145ec:     	callq	0x145764080 <.text+0x5763080>
1454145f1:     	nop
1454145f2:     	movq	0x28(%rbp), %rax
1454145f6:     	movb	$0x1f, 0xc0(%rax)
1454145fd:     	movb	$0x1, 0xc8(%rax)
145414604:     	movq	%r14, 0xd0(%rax)
14541460b:     	movq	%r15, 0xd8(%rax)
145414612:     	movl	$0x3eb33333, 0xe0(%rax) # imm = 0x3EB33333
14541461c:     	movb	$0x6, 0xe4(%rax)
145414623:     	movq	$0x4, 0x30(%rbp)
14541462b:     	leaq	0x1308f93(%rip), %rbx   # 0x14671d5c5
145414632:     	movl	$0x18, %esi
145414637:     	movl	$0x18, %edx
14541463c:     	movq	%rbx, %rcx
14541463f:     	callq	0x145452400 <.text+0x5451400>
145414644:     	nop
145414645:     	testq	%rax, %rax
145414648:     	cmoveq	%rsi, %rdx
14541464c:     	cmovneq	%rax, %rbx
145414650:     	movl	$0x20, %esi
145414655:     	leaq	0x1308f81(%rip), %rax   # 0x14671d5dd
14541465c:     	jmp	0x145415620 <.text+0x5414620>
145414661:     	leaq	0x20(%rbp), %rcx
145414665:     	callq	0x145764080 <.text+0x5763080>
14541466a:     	nop
14541466b:     	movq	0x28(%rbp), %rax
14541466f:     	movb	$0x1f, (%rax)
145414672:     	movb	$0x1, 0x8(%rax)
145414676:     	movq	%r14, 0x10(%rax)
14541467a:     	movq	%r15, 0x18(%rax)
14541467e:     	movl	$0x3f000000, 0x20(%rax) # imm = 0x3F000000
145414685:     	movb	$0x3, 0x24(%rax)
145414689:     	movq	$0x1, 0x30(%rbp)
145414691:     	movq	0x20(%rbp), %rcx
145414695:     	cmpq	$0x1, %rcx
145414699:     	jne	0x1454146a9 <.text+0x54136a9>
14541469b:     	leaq	0x20(%rbp), %rcx
14541469f:     	callq	0x145764080 <.text+0x5763080>
1454146a4:     	nop
1454146a5:     	movq	0x20(%rbp), %rcx
1454146a9:     	movq	0x28(%rbp), %rax
1454146ad:     	movb	$0x1f, 0x40(%rax)
1454146b1:     	movb	$0x1, 0x48(%rax)
1454146b5:     	movq	%r14, 0x50(%rax)
1454146b9:     	movq	%r15, 0x58(%rax)
1454146bd:     	movl	$0x3f800000, 0x60(%rax) # imm = 0x3F800000
1454146c4:     	movb	$0x4, 0x64(%rax)
1454146c8:     	movq	$0x2, 0x30(%rbp)
1454146d0:     	cmpq	$0x2, %rcx
1454146d4:     	jne	0x1454146e8 <.text+0x54136e8>
1454146d6:     	leaq	0x20(%rbp), %rcx
1454146da:     	callq	0x145764080 <.text+0x5763080>
1454146df:     	nop
1454146e0:     	movq	0x20(%rbp), %rcx
1454146e4:     	movq	0x28(%rbp), %rax
1454146e8:     	movb	$0x1f, 0x80(%rax)
1454146ef:     	movb	$0x1, 0x88(%rax)
1454146f6:     	movq	%r14, 0x90(%rax)
1454146fd:     	movq	%r15, 0x98(%rax)
145414704:     	movl	$0x3f000000, 0xa0(%rax) # imm = 0x3F000000
14541470e:     	movb	$0x0, 0xa4(%rax)
145414715:     	movq	$0x3, 0x30(%rbp)
14541471d:     	cmpq	$0x3, %rcx
145414721:     	jne	0x145414731 <.text+0x5413731>
145414723:     	leaq	0x20(%rbp), %rcx
145414727:     	callq	0x145764080 <.text+0x5763080>
14541472c:     	nop
14541472d:     	movq	0x28(%rbp), %rax
145414731:     	movw	$0xb, 0xc0(%rax)
14541473a:     	movsd	0x1308b0e(%rip), %xmm0  # 0x14671d250
145414742:     	movsd	%xmm0, 0xc4(%rax)
14541474a:     	movabsq	$0x200002b69, %rcx      # imm = 0x200002B69
145414754:     	movq	%rcx, 0xcc(%rax)
14541475b:     	movb	$0x1, 0xd8(%rax)
145414762:     	movq	%r14, 0xe0(%rax)
145414769:     	movq	%r15, 0xe8(%rax)
145414770:     	movq	$0x4, 0x30(%rbp)
145414778:     	leaq	0x1308e7e(%rip), %rbx   # 0x14671d5fd
14541477f:     	movl	$0x15, %esi
145414784:     	movl	$0x15, %edx
145414789:     	movq	%rbx, %rcx
14541478c:     	callq	0x145452400 <.text+0x5451400>
145414791:     	nop
145414792:     	testq	%rax, %rax
145414795:     	cmoveq	%rsi, %rdx
145414799:     	cmovneq	%rax, %rbx
14541479d:     	movl	$0x20, %esi
1454147a2:     	leaq	0x1308e69(%rip), %rax   # 0x14671d612
1454147a9:     	jmp	0x145415620 <.text+0x5414620>
1454147ae:     	leaq	0x20(%rbp), %rcx
1454147b2:     	callq	0x145764080 <.text+0x5763080>
1454147b7:     	nop
1454147b8:     	movq	0x28(%rbp), %rax
1454147bc:     	movb	$0x1f, (%rax)
1454147bf:     	movb	$0x1, 0x8(%rax)
1454147c3:     	movq	%r14, 0x10(%rax)
1454147c7:     	movq	%r15, 0x18(%rax)
1454147cb:     	movl	$0x3ee66666, 0x20(%rax) # imm = 0x3EE66666
1454147d2:     	movb	$0x0, 0x24(%rax)
1454147d6:     	movq	$0x1, 0x30(%rbp)
1454147de:     	movq	0x20(%rbp), %rcx
1454147e2:     	cmpq	$0x1, %rcx
1454147e6:     	jne	0x1454147f6 <.text+0x54137f6>
1454147e8:     	leaq	0x20(%rbp), %rcx
1454147ec:     	callq	0x145764080 <.text+0x5763080>
1454147f1:     	nop
1454147f2:     	movq	0x20(%rbp), %rcx
1454147f6:     	movq	0x28(%rbp), %rax
1454147fa:     	movb	$0xa, 0x40(%rax)
1454147fe:     	movl	$0x3f000000, 0x44(%rax) # imm = 0x3F000000
145414805:     	movb	$0x1, 0x48(%rax)
145414809:     	movq	%r14, 0x50(%rax)
14541480d:     	movq	%r15, 0x58(%rax)
145414811:     	movq	$0x2, 0x30(%rbp)
145414819:     	cmpq	$0x2, %rcx
14541481d:     	jne	0x14541482d <.text+0x541382d>
14541481f:     	leaq	0x20(%rbp), %rcx
145414823:     	callq	0x145764080 <.text+0x5763080>
145414828:     	nop
145414829:     	movq	0x28(%rbp), %rax
14541482d:     	movb	$0x4, 0x80(%rax)
145414834:     	movsd	0x13089f4(%rip), %xmm0  # 0x14671d230
14541483c:     	movsd	%xmm0, 0x84(%rax)
145414844:     	xorps	%xmm0, %xmm0
145414847:     	movups	%xmm0, 0x8c(%rax)
14541484e:     	movb	$0x1, 0xa0(%rax)
145414855:     	movq	%r14, 0xa8(%rax)
14541485c:     	movq	%r15, 0xb0(%rax)
145414863:     	movq	$0x3, 0x30(%rbp)
14541486b:     	leaq	0x1308e5e(%rip), %rbx   # 0x14671d6d0
145414872:     	movl	$0x13, %esi
145414877:     	movl	$0x13, %edx
14541487c:     	movq	%rbx, %rcx
14541487f:     	callq	0x145452400 <.text+0x5451400>
145414884:     	nop
145414885:     	testq	%rax, %rax
145414888:     	cmoveq	%rsi, %rdx
14541488c:     	cmovneq	%rax, %rbx
145414890:     	movl	$0x20, %esi
145414895:     	leaq	0x1308e47(%rip), %rax   # 0x14671d6e3
14541489c:     	jmp	0x145415620 <.text+0x5414620>
1454148a1:     	cmpl	$0x0, 0x54(%rdi)
1454148a5:     	je	0x145414eb7 <.text+0x5413eb7>
1454148ab:     	leaq	0x20(%rbp), %rcx
1454148af:     	callq	0x145764080 <.text+0x5763080>
1454148b4:     	nop
1454148b5:     	movq	0x28(%rbp), %rax
1454148b9:     	movb	$0x1f, (%rax)
1454148bc:     	movb	$0x1, 0x8(%rax)
1454148c0:     	movq	%r14, 0x10(%rax)
1454148c4:     	movq	%r15, 0x18(%rax)
1454148c8:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
1454148cf:     	movb	$0x2, 0x24(%rax)
1454148d3:     	movq	$0x1, 0x30(%rbp)
1454148db:     	movl	$0x1, %esi
1454148e0:     	cmpq	$0x1, 0x20(%rbp)
1454148e5:     	je	0x145414eb9 <.text+0x5413eb9>
1454148eb:     	jmp	0x145414ec3 <.text+0x5413ec3>
1454148f0:     	cmpl	$0x0, 0x54(%rdi)
1454148f4:     	je	0x145414f68 <.text+0x5413f68>
1454148fa:     	leaq	0x20(%rbp), %rcx
1454148fe:     	callq	0x145764080 <.text+0x5763080>
145414903:     	nop
145414904:     	movq	0x28(%rbp), %rax
145414908:     	movb	$0x1f, (%rax)
14541490b:     	movb	$0x1, 0x8(%rax)
14541490f:     	movq	%r14, 0x10(%rax)
145414913:     	movq	%r15, 0x18(%rax)
145414917:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
14541491e:     	movb	$0x2, 0x24(%rax)
145414922:     	movq	$0x1, 0x30(%rbp)
14541492a:     	movl	$0x1, %ebx
14541492f:     	cmpq	$0x1, 0x20(%rbp)
145414934:     	je	0x145414f6a <.text+0x5413f6a>
14541493a:     	jmp	0x145414f74 <.text+0x5413f74>
14541493f:     	cmpl	$0x0, 0x54(%rdi)
145414943:     	je	0x145415007 <.text+0x5414007>
145414949:     	leaq	0x20(%rbp), %rcx
14541494d:     	callq	0x145764080 <.text+0x5763080>
145414952:     	nop
145414953:     	movq	0x28(%rbp), %rax
145414957:     	movb	$0x1f, (%rax)
14541495a:     	movb	$0x1, 0x8(%rax)
14541495e:     	movq	%r14, 0x10(%rax)
145414962:     	movq	%r15, 0x18(%rax)
145414966:     	movl	$0x40400000, 0x20(%rax) # imm = 0x40400000
14541496d:     	movb	$0x2, 0x24(%rax)
145414971:     	movq	$0x1, 0x30(%rbp)
145414979:     	movl	$0x1, %esi
14541497e:     	cmpq	$0x1, 0x20(%rbp)
145414983:     	je	0x145415009 <.text+0x5414009>
145414989:     	jmp	0x145415013 <.text+0x5414013>
14541498e:     	leaq	0x20(%rbp), %rcx
145414992:     	callq	0x145764080 <.text+0x5763080>
145414997:     	nop
145414998:     	movq	0x28(%rbp), %rax
14541499c:     	movb	$0x1f, (%rax)
14541499f:     	movb	$0x1, 0x8(%rax)
1454149a3:     	movq	%r14, 0x10(%rax)
1454149a7:     	movq	%r15, 0x18(%rax)
1454149ab:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
1454149b2:     	movb	$0x4, 0x24(%rax)
1454149b6:     	movq	$0x1, 0x30(%rbp)
1454149be:     	movss	0x50(%rdi), %xmm0
1454149c3:     	xorps	%xmm6, %xmm6
1454149c6:     	ucomiss	%xmm6, %xmm0
1454149c9:     	movl	$0x1, %esi
1454149ce:     	movq	0x20(%rbp), %rax
1454149d2:     	jbe	0x145414a14 <.text+0x5413a14>
1454149d4:     	cmpq	$0x1, %rax
1454149d8:     	jne	0x1454149e8 <.text+0x54139e8>
1454149da:     	leaq	0x20(%rbp), %rcx
1454149de:     	callq	0x145764080 <.text+0x5763080>
1454149e3:     	nop
1454149e4:     	movq	0x20(%rbp), %rax
1454149e8:     	movq	0x28(%rbp), %rcx
1454149ec:     	movb	$0x1f, 0x40(%rcx)
1454149f0:     	movb	$0x1, 0x48(%rcx)
1454149f4:     	movq	%r14, 0x50(%rcx)
1454149f8:     	movq	%r15, 0x58(%rcx)
1454149fc:     	movl	$0x3f000000, 0x60(%rcx) # imm = 0x3F000000
145414a03:     	movb	$0x3, 0x64(%rcx)
145414a07:     	movq	$0x2, 0x30(%rbp)
145414a0f:     	movl	$0x2, %esi
145414a14:     	movss	0x44(%rdi), %xmm0
145414a19:     	ucomiss	%xmm6, %xmm0
145414a1c:     	jbe	0x145414a61 <.text+0x5413a61>
145414a1e:     	cmpq	%rax, %rsi
145414a21:     	jne	0x145414a2d <.text+0x5413a2d>
145414a23:     	leaq	0x20(%rbp), %rcx
145414a27:     	callq	0x145764080 <.text+0x5763080>
145414a2c:     	nop
145414a2d:     	movq	0x28(%rbp), %rax
145414a31:     	movl	%esi, %ecx
145414a33:     	shll	$0x6, %ecx
145414a36:     	movb	$0x1f, (%rax,%rcx)
145414a3a:     	movb	$0x1, 0x8(%rax,%rcx)
145414a3f:     	movq	%r14, 0x10(%rax,%rcx)
145414a44:     	movq	%r15, 0x18(%rax,%rcx)
145414a49:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
145414a51:     	movb	$0x0, 0x24(%rax,%rcx)
145414a56:     	incq	%rsi
145414a59:     	movq	%rsi, 0x30(%rbp)
145414a5d:     	movq	0x20(%rbp), %rax
145414a61:     	cmpq	%rax, %rsi
145414a64:     	jne	0x145414a70 <.text+0x5413a70>
145414a66:     	leaq	0x20(%rbp), %rcx
145414a6a:     	callq	0x145764080 <.text+0x5763080>
145414a6f:     	nop
145414a70:     	movq	0x28(%rbp), %rax
145414a74:     	movl	%esi, %ecx
145414a76:     	shll	$0x6, %ecx
145414a79:     	movb	$0x16, (%rax,%rcx)
145414a7d:     	movl	$0x3c23d70a, 0x4(%rax,%rcx) # imm = 0x3C23D70A
145414a85:     	incq	%rsi
145414a88:     	movq	%rsi, 0x30(%rbp)
145414a8c:     	leaq	0x1308ccc(%rip), %rbx   # 0x14671d75f
145414a93:     	movl	$0x16, %esi
145414a98:     	movl	$0x16, %edx
145414a9d:     	movq	%rbx, %rcx
145414aa0:     	callq	0x145452400 <.text+0x5451400>
145414aa5:     	nop
145414aa6:     	testq	%rax, %rax
145414aa9:     	cmoveq	%rsi, %rdx
145414aad:     	cmovneq	%rax, %rbx
145414ab1:     	movl	$0x17, %esi
145414ab6:     	leaq	0x1308cb8(%rip), %rax   # 0x14671d775
145414abd:     	jmp	0x145415620 <.text+0x5414620>
145414ac2:     	leaq	0x20(%rbp), %rcx
145414ac6:     	callq	0x145764080 <.text+0x5763080>
145414acb:     	nop
145414acc:     	movq	0x28(%rbp), %rax
145414ad0:     	movb	$0x1f, (%rax)
145414ad3:     	movb	$0x1, 0x8(%rax)
145414ad7:     	movq	%r14, 0x10(%rax)
145414adb:     	movq	%r15, 0x18(%rax)
145414adf:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
145414ae6:     	movb	$0x3, 0x24(%rax)
145414aea:     	movq	$0x1, 0x30(%rbp)
145414af2:     	movq	0x20(%rbp), %rcx
145414af6:     	cmpq	$0x1, %rcx
145414afa:     	jne	0x145414b0a <.text+0x5413b0a>
145414afc:     	leaq	0x20(%rbp), %rcx
145414b00:     	callq	0x145764080 <.text+0x5763080>
145414b05:     	nop
145414b06:     	movq	0x20(%rbp), %rcx
145414b0a:     	movq	0x28(%rbp), %rax
145414b0e:     	movb	$0x1f, 0x40(%rax)
145414b12:     	movb	$0x1, 0x48(%rax)
145414b16:     	movq	%r14, 0x50(%rax)
145414b1a:     	movq	%r15, 0x58(%rax)
145414b1e:     	movl	$0x3e99999a, 0x60(%rax) # imm = 0x3E99999A
145414b25:     	movb	$0x0, 0x64(%rax)
145414b29:     	movq	$0x2, 0x30(%rbp)
145414b31:     	cmpq	$0x2, %rcx
145414b35:     	jne	0x145414b45 <.text+0x5413b45>
145414b37:     	leaq	0x20(%rbp), %rcx
145414b3b:     	callq	0x145764080 <.text+0x5763080>
145414b40:     	nop
145414b41:     	movq	0x28(%rbp), %rax
145414b45:     	movb	$0x9, 0x80(%rax)
145414b4c:     	movl	$0x316e, 0x84(%rax)     # imm = 0x316E
145414b56:     	movsd	0x13086c2(%rip), %xmm0  # 0x14671d220
145414b5e:     	movsd	%xmm0, 0x88(%rax)
145414b66:     	movl	$0x0, 0x90(%rax)
145414b70:     	movb	$0x1, 0x98(%rax)
145414b77:     	movq	%r14, 0xa0(%rax)
145414b7e:     	movq	%r15, 0xa8(%rax)
145414b85:     	movq	$0x3, 0x30(%rbp)
145414b8d:     	leaq	0x1308b6f(%rip), %rbx   # 0x14671d703
145414b94:     	movl	$0x1a, %esi
145414b99:     	movl	$0x1a, %edx
145414b9e:     	movq	%rbx, %rcx
145414ba1:     	callq	0x145452400 <.text+0x5451400>
145414ba6:     	nop
145414ba7:     	testq	%rax, %rax
145414baa:     	cmoveq	%rsi, %rdx
145414bae:     	cmovneq	%rax, %rbx
145414bb2:     	movl	$0x17, %esi
145414bb7:     	leaq	0x1308b5f(%rip), %rax   # 0x14671d71d
145414bbe:     	jmp	0x145415620 <.text+0x5414620>
145414bc3:     	xorl	%ebx, %ebx
145414bc5:     	cmpl	$0xc, %r12d
145414bc9:     	ja	0x145414c16 <.text+0x5413c16>
145414bcb:     	movl	$0x10c0, %eax           # imm = 0x10C0
145414bd0:     	btl	%r12d, %eax
145414bd4:     	jae	0x145414c16 <.text+0x5413c16>
145414bd6:     	cmpq	0x20(%rbp), %rbx
145414bda:     	jne	0x145414be6 <.text+0x5413be6>
145414bdc:     	leaq	0x20(%rbp), %rcx
145414be0:     	callq	0x145764080 <.text+0x5763080>
145414be5:     	nop
145414be6:     	movq	0x28(%rbp), %rax
145414bea:     	movl	%ebx, %ecx
145414bec:     	shll	$0x6, %ecx
145414bef:     	movb	$0x1f, (%rax,%rcx)
145414bf3:     	movb	$0x1, 0x8(%rax,%rcx)
145414bf8:     	movq	%r14, 0x10(%rax,%rcx)
145414bfd:     	movq	%r15, 0x18(%rax,%rcx)
145414c02:     	movl	$0x3f19999a, 0x20(%rax,%rcx) # imm = 0x3F19999A
145414c0a:     	movb	$0x0, 0x24(%rax,%rcx)
145414c0f:     	incq	%rbx
145414c12:     	movq	%rbx, 0x30(%rbp)
145414c16:     	cmpl	$0xc, %r12d
145414c1a:     	ja	0x145414c2d <.text+0x5413c2d>
145414c1c:     	movl	$0x1300, %eax           # imm = 0x1300
145414c21:     	btl	%r12d, %eax
145414c25:     	jae	0x145414c2d <.text+0x5413c2d>
145414c27:     	ucomiss	0x48(%rdi), %xmm6
145414c2b:     	jae	0x145414c6d <.text+0x5413c6d>
145414c2d:     	cmpq	0x20(%rbp), %rbx
145414c31:     	jne	0x145414c3d <.text+0x5413c3d>
145414c33:     	leaq	0x20(%rbp), %rcx
145414c37:     	callq	0x145764080 <.text+0x5763080>
145414c3c:     	nop
145414c3d:     	movq	0x28(%rbp), %rax
145414c41:     	movl	%ebx, %ecx
145414c43:     	shll	$0x6, %ecx
145414c46:     	movb	$0x1f, (%rax,%rcx)
145414c4a:     	movb	$0x1, 0x8(%rax,%rcx)
145414c4f:     	movq	%r14, 0x10(%rax,%rcx)
145414c54:     	movq	%r15, 0x18(%rax,%rcx)
145414c59:     	movl	$0x3eb33333, 0x20(%rax,%rcx) # imm = 0x3EB33333
145414c61:     	movb	$0x1, 0x24(%rax,%rcx)
145414c66:     	incq	%rbx
145414c69:     	movq	%rbx, 0x30(%rbp)
145414c6d:     	leaq	-0xb(%r15), %rax
145414c71:     	cmpq	$0x4, %rax
145414c75:     	ja	0x1454152f3 <.text+0x54142f3>
145414c7b:     	leaq	0x130ba16(%rip), %rcx   # 0x146720698
145414c82:     	movslq	(%rcx,%rax,4), %rax
145414c86:     	addq	%rcx, %rax
145414c89:     	jmpq	*%rax
145414c8b:     	movabsq	$0x727261625f656369, %rax # imm = 0x727261625F656369
145414c95:     	xorq	(%r14), %rax
145414c98:     	movabsq	$0x726569727261625f, %rcx # imm = 0x726569727261625F
145414ca2:     	xorq	0x3(%r14), %rcx
145414ca6:     	jmp	0x1454152ae <.text+0x54142ae>
145414cab:     	movl	$0x1, %ebx
145414cb0:     	leaq	-0x9(%r15), %rax
145414cb4:     	cmpq	$0x4, %rax
145414cb8:     	ja	0x1454155f4 <.text+0x54145f4>
145414cbe:     	leaq	0x130b9bf(%rip), %rcx   # 0x146720684
145414cc5:     	movslq	(%rcx,%rax,4), %rax
145414cc9:     	addq	%rcx, %rax
145414ccc:     	jmpq	*%rax
145414cce:     	movabsq	$0x676172646f6f6c62, %rax # imm = 0x676172646F6F6C62
145414cd8:     	xorq	(%r14), %rax
145414cdb:     	movzbl	0x8(%r14), %ecx
145414ce0:     	xorq	$0x65, %rcx
145414ce4:     	orq	%rax, %rcx
145414ce7:     	je	0x1454154a2 <.text+0x54144a2>
145414ced:     	movabsq	$0x7461665f6c616573, %rax # imm = 0x7461665F6C616573
145414cf7:     	xorq	(%r14), %rax
145414cfa:     	movzbl	0x8(%r14), %ecx
145414cff:     	xorq	$0x65, %rcx
145414d03:     	orq	%rax, %rcx
145414d06:     	je	0x1454155b0 <.text+0x54145b0>
145414d0c:     	movabsq	$0x7269665f6c756f73, %rax # imm = 0x7269665F6C756F73
145414d16:     	xorq	(%r14), %rax
145414d19:     	movzbl	0x8(%r14), %ecx
145414d1e:     	xorq	$0x65, %rcx
145414d22:     	orq	%rax, %rcx
145414d25:     	je	0x1454155b0 <.text+0x54145b0>
145414d2b:     	movabsq	$0x6c6577746867696c, %rax # imm = 0x6C6577746867696C
145414d35:     	xorq	(%r14), %rax
145414d38:     	movzbl	0x8(%r14), %ecx
145414d3d:     	xorq	$0x6c, %rcx
145414d41:     	orq	%rax, %rcx
145414d44:     	je	0x145415807 <.text+0x5414807>
145414d4a:     	movabsq	$0x70726f6d796c6f70, %rax # imm = 0x70726F6D796C6F70
145414d54:     	xorq	(%r14), %rax
145414d57:     	movzbl	0x8(%r14), %ecx
145414d5c:     	xorq	$0x68, %rcx
145414d60:     	jmp	0x1454154f6 <.text+0x54144f6>
145414d65:     	xorl	%esi, %esi
145414d67:     	leaq	0x20(%rbp), %rcx
145414d6b:     	callq	0x145764080 <.text+0x5763080>
145414d70:     	nop
145414d71:     	movq	0x28(%rbp), %rax
145414d75:     	movl	%esi, %ecx
145414d77:     	shll	$0x6, %ecx
145414d7a:     	movb	$0x1f, (%rax,%rcx)
145414d7e:     	movb	$0x1, 0x8(%rax,%rcx)
145414d83:     	movq	%r14, 0x10(%rax,%rcx)
145414d88:     	movq	%r15, 0x18(%rax,%rcx)
145414d8d:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
145414d95:     	movb	$0x0, 0x24(%rax,%rcx)
145414d9a:     	leaq	0x1(%rsi), %rbx
145414d9e:     	movq	%rbx, 0x30(%rbp)
145414da2:     	cmpq	0x20(%rbp), %rbx
145414da6:     	jne	0x145414db2 <.text+0x5413db2>
145414da8:     	leaq	0x20(%rbp), %rcx
145414dac:     	callq	0x145764080 <.text+0x5763080>
145414db1:     	nop
145414db2:     	movq	0x28(%rbp), %rax
145414db6:     	shll	$0x6, %ebx
145414db9:     	movb	$0x17, (%rax,%rbx)
145414dbd:     	orq	$0x2, %rsi
145414dc1:     	movq	%rsi, 0x30(%rbp)
145414dc5:     	leaq	0x1308866(%rip), %rbx   # 0x14671d632
145414dcc:     	movl	$0x17, %esi
145414dd1:     	movl	$0x17, %edx
145414dd6:     	movq	%rbx, %rcx
145414dd9:     	callq	0x145452400 <.text+0x5451400>
145414dde:     	nop
145414ddf:     	testq	%rax, %rax
145414de2:     	cmoveq	%rsi, %rdx
145414de6:     	cmovneq	%rax, %rbx
145414dea:     	movl	$0x20, %esi
145414def:     	leaq	0x1308853(%rip), %rax   # 0x14671d649
145414df6:     	jmp	0x145415620 <.text+0x5414620>
145414dfb:     	xorl	%esi, %esi
145414dfd:     	leaq	0x20(%rbp), %rcx
145414e01:     	callq	0x145764080 <.text+0x5763080>
145414e06:     	nop
145414e07:     	movq	0x28(%rbp), %rax
145414e0b:     	movl	%esi, %ecx
145414e0d:     	shll	$0x6, %ecx
145414e10:     	movb	$0x1f, (%rax,%rcx)
145414e14:     	movb	$0x1, 0x8(%rax,%rcx)
145414e19:     	movq	%r14, 0x10(%rax,%rcx)
145414e1e:     	movq	%r15, 0x18(%rax,%rcx)
145414e23:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
145414e2b:     	movb	$0x0, 0x24(%rax,%rcx)
145414e30:     	leaq	0x1(%rsi), %rbx
145414e34:     	movq	%rbx, 0x30(%rbp)
145414e38:     	cmpq	0x20(%rbp), %rbx
145414e3c:     	jne	0x145414e48 <.text+0x5413e48>
145414e3e:     	leaq	0x20(%rbp), %rcx
145414e42:     	callq	0x145764080 <.text+0x5763080>
145414e47:     	nop
145414e48:     	movq	0x28(%rbp), %rax
145414e4c:     	shll	$0x6, %ebx
145414e4f:     	movb	$0x6, (%rax,%rbx)
145414e53:     	movabsq	$0x3e99999a00000002, %rcx # imm = 0x3E99999A00000002
145414e5d:     	movq	%rcx, 0x4(%rax,%rbx)
145414e62:     	movl	$0x0, 0x10(%rax,%rbx)
145414e6a:     	movb	$0x1, 0x18(%rax,%rbx)
145414e6f:     	movq	%r14, 0x20(%rax,%rbx)
145414e74:     	movq	%r15, 0x28(%rax,%rbx)
145414e79:     	orq	$0x2, %rsi
145414e7d:     	movq	%rsi, 0x30(%rbp)
145414e81:     	leaq	0x13086da(%rip), %rbx   # 0x14671d562
145414e88:     	movl	$0x18, %esi
145414e8d:     	movl	$0x18, %edx
145414e92:     	movq	%rbx, %rcx
145414e95:     	callq	0x145452400 <.text+0x5451400>
145414e9a:     	nop
145414e9b:     	testq	%rax, %rax
145414e9e:     	cmoveq	%rsi, %rdx
145414ea2:     	cmovneq	%rax, %rbx
145414ea6:     	movl	$0x17, %esi
145414eab:     	leaq	0x13086c8(%rip), %rax   # 0x14671d57a
145414eb2:     	jmp	0x145415620 <.text+0x5414620>
145414eb7:     	xorl	%esi, %esi
145414eb9:     	leaq	0x20(%rbp), %rcx
145414ebd:     	callq	0x145764080 <.text+0x5763080>
145414ec2:     	nop
145414ec3:     	movq	0x28(%rbp), %rax
145414ec7:     	movl	%esi, %ecx
145414ec9:     	shll	$0x6, %ecx
145414ecc:     	movb	$0x1f, (%rax,%rcx)
145414ed0:     	movb	$0x1, 0x8(%rax,%rcx)
145414ed5:     	movq	%r14, 0x10(%rax,%rcx)
145414eda:     	movq	%r15, 0x18(%rax,%rcx)
145414edf:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
145414ee7:     	movb	$0x0, 0x24(%rax,%rcx)
145414eec:     	leaq	0x1(%rsi), %rbx
145414ef0:     	movq	%rbx, 0x30(%rbp)
145414ef4:     	cmpq	0x20(%rbp), %rbx
145414ef8:     	jne	0x145414f04 <.text+0x5413f04>
145414efa:     	leaq	0x20(%rbp), %rcx
145414efe:     	callq	0x145764080 <.text+0x5763080>
145414f03:     	nop
145414f04:     	movq	0x28(%rbp), %rax
145414f08:     	shll	$0x6, %ebx
145414f0b:     	movb	$0x7, (%rax,%rbx)
145414f0f:     	movaps	0x130834a(%rip), %xmm0  # 0x14671d260
145414f16:     	movups	%xmm0, 0x4(%rax,%rbx)
145414f1b:     	movb	$0x1, 0x18(%rax,%rbx)
145414f20:     	movq	%r14, 0x20(%rax,%rbx)
145414f25:     	movq	%r15, 0x28(%rax,%rbx)
145414f2a:     	orq	$0x2, %rsi
145414f2e:     	movq	%rsi, 0x30(%rbp)
145414f32:     	leaq	0x1308658(%rip), %rbx   # 0x14671d591
145414f39:     	movl	$0x14, %esi
145414f3e:     	movl	$0x14, %edx
145414f43:     	movq	%rbx, %rcx
145414f46:     	callq	0x145452400 <.text+0x5451400>
145414f4b:     	nop
145414f4c:     	testq	%rax, %rax
145414f4f:     	cmoveq	%rsi, %rdx
145414f53:     	cmovneq	%rax, %rbx
145414f57:     	movl	$0x20, %esi
145414f5c:     	leaq	0x1308642(%rip), %rax   # 0x14671d5a5
145414f63:     	jmp	0x145415620 <.text+0x5414620>
145414f68:     	xorl	%ebx, %ebx
145414f6a:     	leaq	0x20(%rbp), %rcx
145414f6e:     	callq	0x145764080 <.text+0x5763080>
145414f73:     	nop
145414f74:     	movq	0x28(%rbp), %rax
145414f78:     	movl	%ebx, %ecx
145414f7a:     	shll	$0x6, %ecx
145414f7d:     	movb	$0x1f, (%rax,%rcx)
145414f81:     	movb	$0x1, 0x8(%rax,%rcx)
145414f86:     	movq	%r14, 0x10(%rax,%rcx)
145414f8b:     	movq	%r15, 0x18(%rax,%rcx)
145414f90:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
145414f98:     	movb	$0x0, 0x24(%rax,%rcx)
145414f9d:     	leaq	0x1(%rbx), %r12
145414fa1:     	movq	%r12, 0x30(%rbp)
145414fa5:     	movl	0x68(%rdi), %eax
145414fa8:     	orl	$0x4, %eax
145414fab:     	cmpl	$0x7, %eax
145414fae:     	jne	0x1454150cd <.text+0x54140cd>
145414fb4:     	cmpq	0x20(%rbp), %r12
145414fb8:     	jne	0x145414fc4 <.text+0x5413fc4>
145414fba:     	leaq	0x20(%rbp), %rcx
145414fbe:     	callq	0x145764080 <.text+0x5763080>
145414fc3:     	nop
145414fc4:     	movq	0x28(%rbp), %rax
145414fc8:     	shll	$0x6, %r12d
145414fcc:     	movb	$0x1f, (%rax,%r12)
145414fd1:     	movb	$0x1, 0x8(%rax,%r12)
145414fd7:     	movq	%r14, 0x10(%rax,%r12)
145414fdc:     	movq	%r15, 0x18(%rax,%r12)
145414fe1:     	movl	$0x3f800000, 0x20(%rax,%r12) # imm = 0x3F800000
145414fea:     	movb	$0x6, 0x24(%rax,%r12)
145414ff0:     	leaq	0x2(%rbx), %r12
145414ff4:     	movq	%r12, 0x30(%rbp)
145414ff8:     	cmpq	$0x5, %r15
145414ffc:     	jne	0x145415147 <.text+0x5414147>
145415002:     	jmp	0x1454151c4 <.text+0x54141c4>
145415007:     	xorl	%esi, %esi
145415009:     	leaq	0x20(%rbp), %rcx
14541500d:     	callq	0x145764080 <.text+0x5763080>
145415012:     	nop
145415013:     	movq	0x28(%rbp), %rax
145415017:     	movl	%esi, %ecx
145415019:     	shll	$0x6, %ecx
14541501c:     	movb	$0x1f, (%rax,%rcx)
145415020:     	movb	$0x1, 0x8(%rax,%rcx)
145415025:     	movq	%r14, 0x10(%rax,%rcx)
14541502a:     	movq	%r15, 0x18(%rax,%rcx)
14541502f:     	movl	$0x3f666666, 0x20(%rax,%rcx) # imm = 0x3F666666
145415037:     	movb	$0x0, 0x24(%rax,%rcx)
14541503c:     	leaq	0x1(%rsi), %rbx
145415040:     	movq	%rbx, 0x30(%rbp)
145415044:     	movl	0x40(%rdi), %r12d
145415048:     	cmpq	0x20(%rbp), %rbx
14541504c:     	jne	0x145415058 <.text+0x5414058>
14541504e:     	leaq	0x20(%rbp), %rcx
145415052:     	callq	0x145764080 <.text+0x5763080>
145415057:     	nop
145415058:     	movq	0x28(%rbp), %rax
14541505c:     	shll	$0x6, %ebx
14541505f:     	movw	$0x10b, (%rax,%rbx)     # imm = 0x10B
145415065:     	movsd	0x13081a3(%rip), %xmm0  # 0x14671d210
14541506d:     	movsd	%xmm0, 0x4(%rax,%rbx)
145415073:     	movl	%r12d, 0xc(%rax,%rbx)
145415078:     	movl	$0x2, 0x10(%rax,%rbx)
145415080:     	movb	$0x1, 0x18(%rax,%rbx)
145415085:     	movq	%r14, 0x20(%rax,%rbx)
14541508a:     	movq	%r15, 0x28(%rax,%rbx)
14541508f:     	orq	$0x2, %rsi
145415093:     	movq	%rsi, 0x30(%rbp)
145415097:     	leaq	0x13085fd(%rip), %rbx   # 0x14671d69b
14541509e:     	movl	$0x15, %esi
1454150a3:     	movl	$0x15, %edx
1454150a8:     	movq	%rbx, %rcx
1454150ab:     	callq	0x145452400 <.text+0x5451400>
1454150b0:     	nop
1454150b1:     	testq	%rax, %rax
1454150b4:     	cmoveq	%rsi, %rdx
1454150b8:     	cmovneq	%rax, %rbx
1454150bc:     	movl	$0x20, %esi
1454150c1:     	leaq	0x13085e8(%rip), %rax   # 0x14671d6b0
1454150c8:     	jmp	0x145415620 <.text+0x5414620>
1454150cd:     	cmpq	$0x5, %r15
1454150d1:     	jne	0x1454150eb <.text+0x54140eb>
1454150d3:     	movl	$0x65726873, %eax       # imm = 0x65726873
1454150d8:     	xorl	(%r14), %eax
1454150db:     	movzbl	0x4(%r14), %ecx
1454150e0:     	xorl	$0x64, %ecx
1454150e3:     	orl	%eax, %ecx
1454150e5:     	je	0x1454151c4 <.text+0x54141c4>
1454150eb:     	cmpq	0x20(%rbp), %r12
1454150ef:     	jne	0x1454150fb <.text+0x54140fb>
1454150f1:     	leaq	0x20(%rbp), %rcx
1454150f5:     	callq	0x145764080 <.text+0x5763080>
1454150fa:     	nop
1454150fb:     	movq	0x28(%rbp), %rax
1454150ff:     	shll	$0x6, %r12d
145415103:     	movb	$0x9, (%rax,%r12)
145415108:     	movl	$0x31b1, 0x4(%rax,%r12) # imm = 0x31B1
145415111:     	movsd	0x1308127(%rip), %xmm0  # 0x14671d240
145415119:     	movsd	%xmm0, 0x8(%rax,%r12)
145415120:     	movl	$0x0, 0x10(%rax,%r12)
145415129:     	movb	$0x1, 0x18(%rax,%r12)
14541512f:     	movq	%r14, 0x20(%rax,%r12)
145415134:     	movq	%r15, 0x28(%rax,%r12)
145415139:     	leaq	0x2(%rbx), %r12
14541513d:     	movq	%r12, 0x30(%rbp)
145415141:     	cmpq	$0x5, %r15
145415145:     	je	0x1454151c4 <.text+0x54141c4>
145415147:     	cmpq	$0xb, %r15
14541514b:     	jne	0x145415226 <.text+0x5414226>
145415151:     	movabsq	$0x696874646f6f6c62, %rax # imm = 0x696874646F6F6C62
14541515b:     	xorq	(%r14), %rax
14541515e:     	movabsq	$0x747372696874646f, %rcx # imm = 0x747372696874646F
145415168:     	xorq	0x3(%r14), %rcx
14541516c:     	orq	%rax, %rcx
14541516f:     	jne	0x145415226 <.text+0x5414226>
145415175:     	cmpq	0x20(%rbp), %r12
145415179:     	jne	0x145415185 <.text+0x5414185>
14541517b:     	leaq	0x20(%rbp), %rcx
14541517f:     	callq	0x145764080 <.text+0x5763080>
145415184:     	nop
145415185:     	movq	0x28(%rbp), %rax
145415189:     	shll	$0x6, %r12d
14541518d:     	movb	$0x12, (%rax,%r12)
145415192:     	movsd	0x529716(%rip), %xmm0   # 0x14593e8b0
14541519a:     	movsd	%xmm0, 0x4(%rax,%r12)
1454151a1:     	movl	$0x1, 0x10(%rax,%r12)
1454151aa:     	movb	$0x1, 0x18(%rax,%r12)
1454151b0:     	movq	%r14, 0x20(%rax,%r12)
1454151b5:     	movq	$0xb, 0x28(%rax,%r12)
1454151be:     	addq	$0x3, %rbx
1454151c2:     	jmp	0x145415222 <.text+0x5414222>
1454151c4:     	movl	$0x65726873, %eax       # imm = 0x65726873
1454151c9:     	xorl	(%r14), %eax
1454151cc:     	movzbl	0x4(%r14), %ecx
1454151d1:     	xorl	$0x64, %ecx
1454151d4:     	orl	%eax, %ecx
1454151d6:     	jne	0x145415226 <.text+0x5414226>
1454151d8:     	cmpq	0x20(%rbp), %r12
1454151dc:     	jne	0x1454151e8 <.text+0x54141e8>
1454151de:     	leaq	0x20(%rbp), %rcx
1454151e2:     	callq	0x145764080 <.text+0x5763080>
1454151e7:     	nop
1454151e8:     	movq	0x28(%rbp), %rax
1454151ec:     	movl	%r12d, %ecx
1454151ef:     	shll	$0x6, %ecx
1454151f2:     	movb	$0x6, (%rax,%rcx)
1454151f6:     	movabsq	$0x3f00000000000002, %rdx # imm = 0x3F00000000000002
145415200:     	movq	%rdx, 0x4(%rax,%rcx)
145415205:     	movl	$0x0, 0x10(%rax,%rcx)
14541520d:     	movb	$0x1, 0x18(%rax,%rcx)
145415212:     	movq	%r14, 0x20(%rax,%rcx)
145415217:     	movq	%r15, 0x28(%rax,%rcx)
14541521c:     	incq	%r12
14541521f:     	movq	%r12, %rbx
145415222:     	movq	%rbx, 0x30(%rbp)
145415226:     	leaq	0x130843c(%rip), %rbx   # 0x14671d669
14541522d:     	movl	$0x1b, %esi
145415232:     	movl	$0x1b, %edx
145415237:     	movq	%rbx, %rcx
14541523a:     	callq	0x145452400 <.text+0x5451400>
14541523f:     	nop
145415240:     	testq	%rax, %rax
145415243:     	cmoveq	%rsi, %rdx
145415247:     	cmovneq	%rax, %rbx
14541524b:     	movl	$0x17, %esi
145415250:     	leaq	0x130842d(%rip), %rax   # 0x14671d684
145415257:     	jmp	0x145415620 <.text+0x5414620>
14541525c:     	movabsq	$0x6e615f6563696c73, %rax # imm = 0x6E615F6563696C73
145415266:     	xorq	(%r14), %rax
145415269:     	movabsq	$0x656369645f646e61, %rcx # imm = 0x656369645F646E61
145415273:     	xorq	0x6(%r14), %rcx
145415277:     	jmp	0x1454152ae <.text+0x54142ae>
145415279:     	movabsq	$0x735f656c74746162, %rax # imm = 0x735F656C74746162
145415283:     	xorq	(%r14), %rax
145415286:     	movl	0x8(%r14), %ecx
14541528a:     	xorq	$0x74756f68, %rcx       # imm = 0x74756F68
145415291:     	jmp	0x1454152ae <.text+0x54142ae>
145415293:     	movabsq	$0x696c616e65726461, %rax # imm = 0x696C616E65726461
14541529d:     	xorq	(%r14), %rax
1454152a0:     	movabsq	$0x687375725f656e69, %rcx # imm = 0x687375725F656E69
1454152aa:     	xorq	0x7(%r14), %rcx
1454152ae:     	orq	%rax, %rcx
1454152b1:     	jne	0x1454152f3 <.text+0x54142f3>
1454152b3:     	cmpq	0x20(%rbp), %rbx
1454152b7:     	jne	0x1454152c3 <.text+0x54142c3>
1454152b9:     	leaq	0x20(%rbp), %rcx
1454152bd:     	callq	0x145764080 <.text+0x5763080>
1454152c2:     	nop
1454152c3:     	movq	0x28(%rbp), %rax
1454152c7:     	movl	%ebx, %ecx
1454152c9:     	shll	$0x6, %ecx
1454152cc:     	movb	$0x1f, (%rax,%rcx)
1454152d0:     	movb	$0x1, 0x8(%rax,%rcx)
1454152d5:     	movq	%r14, 0x10(%rax,%rcx)
1454152da:     	movq	%r15, 0x18(%rax,%rcx)
1454152df:     	movl	$0x3f800000, 0x20(%rax,%rcx) # imm = 0x3F800000
1454152e7:     	movb	$0x6, 0x24(%rax,%rcx)
1454152ec:     	incq	%rbx
1454152ef:     	movq	%rbx, 0x30(%rbp)
1454152f3:     	leal	-0x6(%r12), %eax
1454152f8:     	cmpl	$0x6, %eax
1454152fb:     	ja	0x145415584 <.text+0x5414584>
145415301:     	leaq	0x130b3a4(%rip), %rcx   # 0x1467206ac
145415308:     	movslq	(%rcx,%rax,4), %rax
14541530c:     	addq	%rcx, %rax
14541530f:     	jmpq	*%rax
145415311:     	xorps	%xmm0, %xmm0
145415314:     	ucomiss	%xmm0, %xmm6
145415317:     	movq	0x20(%rbp), %rax
14541531b:     	ja	0x145415533 <.text+0x5414533>
145415321:     	cmpq	%rax, %rbx
145415324:     	jne	0x145415330 <.text+0x5414330>
145415326:     	leaq	0x20(%rbp), %rcx
14541532a:     	callq	0x145764080 <.text+0x5763080>
14541532f:     	nop
145415330:     	movq	0x28(%rbp), %rax
145415334:     	movl	%ebx, %ecx
145415336:     	shll	$0x6, %ecx
145415339:     	movb	$0x12, (%rax,%rcx)
14541533d:     	movsd	0x7a4f1b(%rip), %xmm0   # 0x145bba260
145415345:     	movsd	%xmm0, 0x4(%rax,%rcx)
14541534b:     	jmp	0x145415566 <.text+0x5414566>
145415350:     	cmpb	$0x1, 0x74(%rdi)
145415354:     	je	0x1454153c6 <.text+0x54143c6>
145415356:     	jmp	0x145415584 <.text+0x5414584>
14541535b:     	movzbl	0x74(%rdi), %esi
14541535f:     	cmpb	$0x1, %sil
145415363:     	movl	$0x3b85, %eax           # imm = 0x3B85
145415368:     	movl	$0x5a9, %ecx            # imm = 0x5A9
14541536d:     	cmovel	%eax, %ecx
145415370:     	cmpb	$0x4, %sil
145415374:     	movl	$0x7a, %r12d
14541537a:     	cmovnel	%ecx, %r12d
14541537e:     	cmpq	0x20(%rbp), %rbx
145415382:     	jne	0x14541538e <.text+0x541438e>
145415384:     	leaq	0x20(%rbp), %rcx
145415388:     	callq	0x145764080 <.text+0x5763080>
14541538d:     	nop
14541538e:     	movq	0x28(%rbp), %rax
145415392:     	movl	%ebx, %ecx
145415394:     	shll	$0x6, %ecx
145415397:     	movb	$0x3, (%rax,%rcx)
14541539b:     	movb	%sil, 0x1(%rax,%rcx)
1454153a0:     	movsd	0x1307e58(%rip), %xmm0  # 0x14671d200
1454153a8:     	movsd	%xmm0, 0x4(%rax,%rcx)
1454153ae:     	movl	%r12d, 0xc(%rax,%rcx)
1454153b3:     	movl	$0x9, 0x10(%rax,%rcx)
1454153bb:     	jmp	0x14541557d <.text+0x541457d>
1454153c0:     	cmpb	$0x1, 0x74(%rdi)
1454153c4:     	jne	0x145415418 <.text+0x5414418>
1454153c6:     	movl	0x40(%rdi), %esi
1454153c9:     	cmpq	0x20(%rbp), %rbx
1454153cd:     	jne	0x1454153d9 <.text+0x54143d9>
1454153cf:     	leaq	0x20(%rbp), %rcx
1454153d3:     	callq	0x145764080 <.text+0x5763080>
1454153d8:     	nop
1454153d9:     	movq	0x28(%rbp), %rax
1454153dd:     	movl	%ebx, %ecx
1454153df:     	shll	$0x6, %ecx
1454153e2:     	movb	$0xc, (%rax,%rcx)
1454153e6:     	movl	%esi, 0x4(%rax,%rcx)
1454153ea:     	movsd	0x1307e1e(%rip), %xmm0  # 0x14671d210
1454153f2:     	movsd	%xmm0, 0x8(%rax,%rcx)
1454153f8:     	movabsq	$0x200003b85, %rdx      # imm = 0x200003B85
145415402:     	movq	%rdx, 0x10(%rax,%rcx)
145415407:     	incq	%rbx
14541540a:     	movq	%rbx, 0x30(%rbp)
14541540e:     	cmpl	$0xc, %r12d
145415412:     	jne	0x145415584 <.text+0x5414584>
145415418:     	ucomiss	0x48(%rdi), %xmm6
14541541c:     	jb	0x145415584 <.text+0x5414584>
145415422:     	cmpq	0x20(%rbp), %rbx
145415426:     	jne	0x145415432 <.text+0x5414432>
145415428:     	leaq	0x20(%rbp), %rcx
14541542c:     	callq	0x145764080 <.text+0x5763080>
145415431:     	nop
145415432:     	movq	0x28(%rbp), %rax
145415436:     	movl	%ebx, %ecx
145415438:     	shll	$0x6, %ecx
14541543b:     	movb	$0x8, (%rax,%rcx)
14541543f:     	movabsq	$0x33e800000, %rdx      # imm = 0x33E800000
145415449:     	movq	%rdx, 0x4(%rax,%rcx)
14541544e:     	movl	$0x3fc00000, 0xc(%rax,%rcx) # imm = 0x3FC00000
145415456:     	movl	$0x7, 0x18(%rax,%rcx)
14541545e:     	jmp	0x14541557d <.text+0x541457d>
145415463:     	movabsq	$0x665f656972656166, %rax # imm = 0x665F656972656166
14541546d:     	xorq	(%r14), %rax
145415470:     	movabsq	$0x657269665f656972, %rcx # imm = 0x657269665F656972
14541547a:     	xorq	0x3(%r14), %rcx
14541547e:     	jmp	0x1454154f6 <.text+0x54144f6>
145415480:     	movabsq	$0x6974706d65646572, %rax # imm = 0x6974706D65646572
14541548a:     	xorq	(%r14), %rax
14541548d:     	movzwl	0x8(%r14), %ecx
145415492:     	xorq	$0x6e6f, %rcx           # imm = 0x6E6F
145415499:     	orq	%rax, %rcx
14541549c:     	jne	0x1454155f4 <.text+0x54145f4>
1454154a2:     	cmpq	0x20(%rbp), %rbx
1454154a6:     	jne	0x1454154b2 <.text+0x54144b2>
1454154a8:     	leaq	0x20(%rbp), %rcx
1454154ac:     	callq	0x145764080 <.text+0x5763080>
1454154b1:     	nop
1454154b2:     	movq	0x28(%rbp), %rax
1454154b6:     	movl	%ebx, %ecx
1454154b8:     	shll	$0x6, %ecx
1454154bb:     	movb	$0x1f, (%rax,%rcx)
1454154bf:     	movb	$0x1, 0x8(%rax,%rcx)
1454154c4:     	movq	%r14, 0x10(%rax,%rcx)
1454154c9:     	movq	%r15, 0x18(%rax,%rcx)
1454154ce:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
1454154d6:     	jmp	0x1454155e8 <.text+0x54145e8>
1454154db:     	movabsq	$0x5f666f5f6c6c6163, %rax # imm = 0x5F666F5F6C6C6163
1454154e5:     	xorq	(%r14), %rax
1454154e8:     	movabsq	$0x656d616c665f666f, %rcx # imm = 0x656D616C665F666F
1454154f2:     	xorq	0x5(%r14), %rcx
1454154f6:     	orq	%rax, %rcx
1454154f9:     	jne	0x1454155f4 <.text+0x54145f4>
1454154ff:     	cmpq	0x20(%rbp), %rbx
145415503:     	jne	0x14541550f <.text+0x541450f>
145415505:     	leaq	0x20(%rbp), %rcx
145415509:     	callq	0x145764080 <.text+0x5763080>
14541550e:     	nop
14541550f:     	movq	0x28(%rbp), %rax
145415513:     	movl	%ebx, %ecx
145415515:     	shll	$0x6, %ecx
145415518:     	movb	$0xd, (%rax,%rcx)
14541551c:     	movl	$0x3f000000, 0x4(%rax,%rcx) # imm = 0x3F000000
145415524:     	movq	%r14, 0x8(%rax,%rcx)
145415529:     	movq	%r15, 0x10(%rax,%rcx)
14541552e:     	jmp	0x1454155ed <.text+0x54145ed>
145415533:     	cmpq	%rax, %rbx
145415536:     	jne	0x145415542 <.text+0x5414542>
145415538:     	leaq	0x20(%rbp), %rcx
14541553c:     	callq	0x145764080 <.text+0x5763080>
145415541:     	nop
145415542:     	movq	0x28(%rbp), %rax
145415546:     	movl	%ebx, %ecx
145415548:     	shll	$0x6, %ecx
14541554b:     	movw	$0xe0f, (%rax,%rcx)     # imm = 0xE0F
145415551:     	movabsq	$0x13d4ccccd, %rdx      # imm = 0x13D4CCCCD
14541555b:     	movq	%rdx, 0x4(%rax,%rcx)
145415560:     	movss	%xmm6, 0xc(%rax,%rcx)
145415566:     	movl	$0x6, 0x10(%rax,%rcx)
14541556e:     	movb	$0x1, 0x18(%rax,%rcx)
145415573:     	movq	%r14, 0x20(%rax,%rcx)
145415578:     	movq	%r15, 0x28(%rax,%rcx)
14541557d:     	incq	%rbx
145415580:     	movq	%rbx, 0x30(%rbp)
145415584:     	leaq	0x13081a9(%rip), %rbx   # 0x14671d734
14541558b:     	movl	$0x14, %esi
145415590:     	movl	$0x14, %edx
145415595:     	movq	%rbx, %rcx
145415598:     	callq	0x145452400 <.text+0x5451400>
14541559d:     	nop
14541559e:     	testq	%rax, %rax
1454155a1:     	cmoveq	%rsi, %rdx
1454155a5:     	cmovneq	%rax, %rbx
1454155a9:     	movl	$0x17, %esi
1454155ae:     	jmp	0x145415619 <.text+0x5414619>
1454155b0:     	cmpq	0x20(%rbp), %rbx
1454155b4:     	jne	0x1454155c0 <.text+0x54145c0>
1454155b6:     	leaq	0x20(%rbp), %rcx
1454155ba:     	callq	0x145764080 <.text+0x5763080>
1454155bf:     	nop
1454155c0:     	movq	0x28(%rbp), %rax
1454155c4:     	movl	%ebx, %ecx
1454155c6:     	shll	$0x6, %ecx
1454155c9:     	movb	$0x1f, (%rax,%rcx)
1454155cd:     	movb	$0x1, 0x8(%rax,%rcx)
1454155d2:     	movq	%r14, 0x10(%rax,%rcx)
1454155d7:     	movq	$0x9, 0x18(%rax,%rcx)
1454155e0:     	movl	$0x3f800000, 0x20(%rax,%rcx) # imm = 0x3F800000
1454155e8:     	movb	$0x6, 0x24(%rax,%rcx)
1454155ed:     	incq	%rbx
1454155f0:     	movq	%rbx, 0x30(%rbp)
1454155f4:     	leaq	0x13081a6(%rip), %rbx   # 0x14671d7a1
1454155fb:     	movl	$0x17, %esi
145415600:     	movl	$0x17, %edx
145415605:     	movq	%rbx, %rcx
145415608:     	callq	0x145452400 <.text+0x5451400>
14541560d:     	nop
14541560e:     	testq	%rax, %rax
145415611:     	cmoveq	%rsi, %rdx
145415615:     	cmovneq	%rax, %rbx
145415619:     	leaq	0x1308128(%rip), %rax   # 0x14671d748
145415620:     	movq	%rax, 0x18(%rbp)
145415624:     	movq	%rbx, -0x48(%rbp)
145415628:     	movq	%rdx, -0x40(%rbp)
14541562c:     	movq	%rdi, 0x8(%rbp)
145415630:     	leaq	-0x5413577(%rip), %r12  # 0x1400020c0 <.text+0x10c0>
145415637:     	movq	%r12, 0x10(%rbp)
14541563b:     	leaq	0x1308176(%rip), %rdx   # 0x14671d7b8
145415642:     	leaq	-0x20(%rbp), %rcx
145415646:     	leaq	0x8(%rbp), %rbx
14541564a:     	movq	%rbx, %r8
14541564d:     	callq	0x14570bf80 <.text+0x570af80>
145415652:     	nop
145415653:     	movq	%rsi, -0x38(%rbp)
145415657:     	movq	-0x20(%rbp), %rax
14541565b:     	movq	%rax, (%rbp)
14541565f:     	movq	-0x18(%rbp), %rax
145415663:     	movq	%rax, -0x30(%rbp)
145415667:     	movq	-0x10(%rbp), %rsi
14541566b:     	cmpq	$0xc, %r15
14541566f:     	je	0x1454156ab <.text+0x54146ab>
145415671:     	cmpq	$0x5, %r15
145415675:     	jne	0x1454156c8 <.text+0x54146c8>
145415677:     	movl	$0x656e6572, %eax       # imm = 0x656E6572
14541567c:     	xorl	(%r14), %eax
14541567f:     	movzbl	0x4(%r14), %ecx
145415684:     	xorl	$0x77, %ecx
145415687:     	orl	%eax, %ecx
145415689:     	jne	0x1454156c8 <.text+0x54146c8>
14541568b:     	leaq	0x1308148(%rip), %r14   # 0x14671d7da
145415692:     	movl	$0xe, %r15d
145415698:     	movl	$0xe, %edx
14541569d:     	movq	%r14, %rcx
1454156a0:     	callq	0x145452400 <.text+0x5451400>
1454156a5:     	nop
1454156a6:     	jmp	0x14541574f <.text+0x541474f>
1454156ab:     	movabsq	$0x616e6576756a6572, %rax # imm = 0x616E6576756A6572
1454156b5:     	xorq	(%r14), %rax
1454156b8:     	movl	0x8(%r14), %ecx
1454156bc:     	xorq	$0x6e6f6974, %rcx       # imm = 0x6E6F6974
1454156c3:     	orq	%rax, %rcx
1454156c6:     	je	0x145415734 <.text+0x5414734>
1454156c8:     	movq	%rdi, 0x8(%rbp)
1454156cc:     	movq	%r12, 0x10(%rbp)
1454156d0:     	leaq	0x12f927e(%rip), %rdx   # 0x14670e955
1454156d7:     	leaq	-0x20(%rbp), %rcx
1454156db:     	leaq	0x8(%rbp), %r8
1454156df:     	callq	0x14570bf80 <.text+0x570af80>
1454156e4:     	nop
1454156e5:     	movq	%r13, %rbx
1454156e8:     	movq	-0x18(%rbp), %rcx
1454156ec:     	movq	-0x10(%rbp), %rdx
1454156f0:     	movq	0x10(%rdi), %r14
1454156f4:     	movq	0x18(%rdi), %r13
1454156f8:     	movq	%rcx, -0x28(%rbp)
1454156fc:     	callq	0x145452400 <.text+0x5451400>
145415701:     	nop
145415702:     	movq	%rax, %r15
145415705:     	movq	%rdx, %rdi
145415708:     	movq	-0x20(%rbp), %rdx
14541570c:     	testq	%rdx, %rdx
14541570f:     	je	0x145415720 <.text+0x5414720>
145415711:     	movl	$0x1, %r8d
145415717:     	movq	-0x28(%rbp), %rcx
14541571b:     	callq	0x1400021d0 <.text+0x11d0>
145415720:     	testq	%r15, %r15
145415723:     	cmoveq	%r13, %rdi
145415727:     	cmovneq	%r15, %r14
14541572b:     	movq	%rbx, %r13
14541572e:     	leaq	0x8(%rbp), %rbx
145415732:     	jmp	0x14541575d <.text+0x541475d>
145415734:     	leaq	0x130808a(%rip), %r14   # 0x14671d7c5
14541573b:     	movl	$0x15, %r15d
145415741:     	movl	$0x15, %edx
145415746:     	movq	%r14, %rcx
145415749:     	callq	0x145452400 <.text+0x5451400>
14541574e:     	nop
14541574f:     	movq	%rdx, %rdi
145415752:     	testq	%rax, %rax
145415755:     	cmoveq	%r15, %rdi
145415759:     	cmovneq	%rax, %r14
14541575d:     	movq	%r14, 0x8(%rbp)
145415761:     	movq	%rdi, 0x10(%rbp)
145415765:     	leaq	-0x48(%rbp), %rax
145415769:     	movq	%rax, -0x20(%rbp)
14541576d:     	movq	%r12, -0x18(%rbp)
145415771:     	movq	%rbx, -0x10(%rbp)
145415775:     	movq	%r12, -0x8(%rbp)
145415779:     	leaq	0x1308068(%rip), %rdx   # 0x14671d7e8
145415780:     	leaq	-0x60(%rbp), %rcx
145415784:     	leaq	-0x20(%rbp), %r8
145415788:     	callq	0x14570bf80 <.text+0x570af80>
14541578d:     	nop
14541578e:     	movq	0x30(%rbp), %rax
145415792:     	movq	%rax, 0x40(%r13)
145415796:     	movups	0x20(%rbp), %xmm0
14541579a:     	movups	%xmm0, 0x30(%r13)
14541579f:     	movq	(%rbp), %rax
1454157a3:     	movq	%rax, (%r13)
1454157a7:     	movq	-0x30(%rbp), %rax
1454157ab:     	movq	%rax, 0x8(%r13)
1454157af:     	movq	%rsi, 0x10(%r13)
1454157b3:     	movups	-0x60(%rbp), %xmm0
1454157b7:     	movups	%xmm0, 0x18(%r13)
1454157bc:     	movq	-0x50(%rbp), %rax
1454157c0:     	movq	%rax, 0x28(%r13)
1454157c4:     	movq	0x18(%rbp), %rax
1454157c8:     	movq	%rax, 0x48(%r13)
1454157cc:     	movq	-0x38(%rbp), %rax
1454157d0:     	movq	%rax, 0x50(%r13)
1454157d4:     	movq	$0x4, 0x58(%r13)
1454157dc:     	movq	$0x4, 0x60(%r13)
1454157e4:     	movl	$0x1, 0x68(%r13)
1454157ec:     	movq	%r13, %rax
1454157ef:     	movaps	0x40(%rbp), %xmm6
1454157f3:     	addq	$0xd8, %rsp
1454157fa:     	popq	%rbx
1454157fb:     	popq	%rdi
1454157fc:     	popq	%rsi
1454157fd:     	popq	%r12
1454157ff:     	popq	%r13
145415801:     	popq	%r14
145415803:     	popq	%r15
145415805:     	popq	%rbp
145415806:     	retq
145415807:     	cmpq	0x20(%rbp), %rbx
14541580b:     	jne	0x145415817 <.text+0x5414817>
14541580d:     	leaq	0x20(%rbp), %rcx
145415811:     	callq	0x145764080 <.text+0x5763080>
145415816:     	nop
145415817:     	movq	0x28(%rbp), %rax
14541581b:     	movl	%ebx, %ecx
14541581d:     	shll	$0x6, %ecx
145415820:     	movb	$0x6, (%rax,%rcx)
145415824:     	movabsq	$0x3e99999a00000003, %rdx # imm = 0x3E99999A00000003
14541582e:     	movq	%rdx, 0x4(%rax,%rcx)
145415833:     	movl	$0x0, 0x10(%rax,%rcx)
14541583b:     	movb	$0x1, 0x18(%rax,%rcx)
145415840:     	movq	%r14, 0x20(%rax,%rcx)
145415845:     	movq	$0x9, 0x28(%rax,%rcx)
14541584e:     	jmp	0x1454155ed <.text+0x54145ed>
