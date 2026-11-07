
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145474190:     	pushq	%rbp
145474191:     	pushq	%r15
145474193:     	pushq	%r14
145474195:     	pushq	%r13
145474197:     	pushq	%r12
145474199:     	pushq	%rsi
14547419a:     	pushq	%rdi
14547419b:     	pushq	%rbx
14547419c:     	subq	$0x478, %rsp            # imm = 0x478
1454741a3:     	leaq	0x80(%rsp), %rbp
1454741ab:     	movaps	%xmm15, 0x3e0(%rbp)
1454741b3:     	movaps	%xmm14, 0x3d0(%rbp)
1454741bb:     	movaps	%xmm13, 0x3c0(%rbp)
1454741c3:     	movaps	%xmm12, 0x3b0(%rbp)
1454741cb:     	movaps	%xmm11, 0x3a0(%rbp)
1454741d3:     	movaps	%xmm10, 0x390(%rbp)
1454741db:     	movaps	%xmm9, 0x380(%rbp)
1454741e3:     	movaps	%xmm8, 0x370(%rbp)
1454741eb:     	movaps	%xmm7, 0x360(%rbp)
1454741f2:     	movaps	%xmm6, 0x350(%rbp)
1454741f9:     	movq	$-0x2, 0x348(%rbp)
145474204:     	movaps	%xmm1, %xmm6
145474207:     	movq	%rcx, %r13
14547420a:     	movzbl	0x94e(%rcx), %eax
145474211:     	testb	%al, %al
145474213:     	jne	0x145474237 <.text+0x5473237>
145474215:     	cmpb	$0x0, 0x946(%r13)
14547421d:     	je	0x145474237 <.text+0x5473237>
14547421f:     	movb	$0x0, 0x946(%r13)
145474227:     	movq	%r13, %rcx
14547422a:     	callq	0x1454872d0 <.text+0x54862d0>
14547422f:     	movzbl	0x94e(%r13), %eax
145474237:     	cmpb	$0x1, %al
145474239:     	movq	%r13, 0x338(%rbp)
145474240:     	jne	0x145480d39 <.text+0x547fd39>
145474246:     	movss	0x8d4(%r13), %xmm7
14547424f:     	addss	%xmm6, %xmm7
145474253:     	movss	%xmm7, 0x8d4(%r13)
14547425c:     	cmpb	$0x0, 0x947(%r13)
145474264:     	je	0x145474519 <.text+0x5473519>
14547426a:     	movss	0x458(%r13), %xmm0
145474273:     	movss	%xmm0, 0x400(%r13)
14547427c:     	movl	$0x0, 0x8dc(%r13)
145474287:     	ucomiss	0x930(%r13), %xmm7
14547428f:     	jb	0x145474519 <.text+0x5473519>
145474295:     	addss	0x434083(%rip), %xmm7   # 0x1458a8320
14547429d:     	movss	%xmm7, 0x930(%r13)
1454742a6:     	movsd	0x3e8(%r13), %xmm10
1454742af:     	movss	0x3f0(%r13), %xmm9
1454742b8:     	xorl	%ebx, %ebx
1454742ba:     	movss	0x43405d(%rip), %xmm11  # 0x1458a8320
1454742c3:     	movss	0x44b3b4(%rip), %xmm12  # 0x1458bf680
1454742cc:     	movaps	0x163a71c(%rip), %xmm13 # 0x146aae9f0
1454742d4:     	leaq	0x90(%rbp), %rdi
1454742db:     	jmp	0x145474314 <.text+0x5473314>
1454742dd:     	nopl	(%rax)
1454742e0:     	leaq	0x1(%rbx), %rsi
1454742e4:     	movlps	%xmm7, 0x94(%rbp)
1454742eb:     	movss	%xmm0, 0x9c(%rbp)
1454742f3:     	movl	$0x1, 0x90(%rbp)
1454742fd:     	movq	%r13, %rcx
145474300:     	movq	%rbx, %rdx
145474303:     	movq	%rdi, %r8
145474306:     	callq	0x145497340 <.text+0x5496340>
14547430b:     	movq	%rsi, %rbx
14547430e:     	cmpq	$0xc, %rsi
145474312:     	je	0x145474371 <.text+0x5473371>
145474314:     	xorps	%xmm8, %xmm8
145474318:     	cvtsi2ss	%rbx, %xmm8
14547431d:     	divss	%xmm11, %xmm8
145474322:     	mulss	%xmm12, %xmm8
145474327:     	movaps	%xmm8, %xmm0
14547432b:     	callq	0x145714a63 <.text+0x5713a63>
145474330:     	movaps	%xmm0, %xmm7
145474333:     	movaps	%xmm8, %xmm0
145474337:     	callq	0x145714a4b <.text+0x5713a4b>
14547433c:     	movq	0x868(%r13), %r14
145474343:     	leaq	0x10(%r14), %rcx
145474347:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
14547434a:     	mulps	%xmm13, %xmm7
14547434e:     	addps	%xmm10, %xmm7
145474352:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
145474356:     	movaps	%xmm7, %xmm1
145474359:     	callq	0x1453f66f0 <.text+0x53f56f0>
14547435e:     	testb	$0x1, %al
145474360:     	jne	0x1454742e0 <.text+0x54732e0>
145474366:     	movss	0x68(%r14), %xmm0
14547436c:     	jmp	0x1454742e0 <.text+0x54732e0>
145474371:     	movss	0x565c1f(%rip), %xmm0   # 0x1459d9f98
145474379:     	addps	%xmm10, %xmm0
14547437d:     	movlps	%xmm0, 0x90(%rbp)
145474384:     	movss	%xmm9, 0x98(%rbp)
14547438d:     	leaq	0x90(%rbp), %rdi
145474394:     	movq	%r13, %rcx
145474397:     	xorl	%edx, %edx
145474399:     	movl	$0x1, %r8d
14547439f:     	movq	%rdi, %r9
1454743a2:     	callq	0x14549d330 <.text+0x549c330>
1454743a7:     	movsd	0x163a651(%rip), %xmm0  # 0x146aaea00
1454743af:     	addps	%xmm10, %xmm0
1454743b3:     	movlps	%xmm0, 0x90(%rbp)
1454743ba:     	movss	%xmm9, 0x98(%rbp)
1454743c3:     	movq	%r13, %rcx
1454743c6:     	xorl	%edx, %edx
1454743c8:     	movl	$0x5, %r8d
1454743ce:     	movq	%rdi, %r9
1454743d1:     	callq	0x14549d330 <.text+0x549c330>
1454743d6:     	movsd	0x163a632(%rip), %xmm0  # 0x146aaea10
1454743de:     	addps	%xmm10, %xmm0
1454743e2:     	movlps	%xmm0, 0x90(%rbp)
1454743e9:     	movss	%xmm9, 0x98(%rbp)
1454743f2:     	movq	%r13, %rcx
1454743f5:     	xorl	%edx, %edx
1454743f7:     	movl	$0x1e, %r8d
1454743fd:     	movq	%rdi, %r9
145474400:     	callq	0x14549d330 <.text+0x549c330>
145474405:     	movsd	0x163a613(%rip), %xmm0  # 0x146aaea20
14547440d:     	addps	%xmm10, %xmm0
145474411:     	movlps	%xmm0, 0x90(%rbp)
145474418:     	movss	%xmm9, 0x98(%rbp)
145474421:     	movq	%r13, %rcx
145474424:     	movl	$0x1, %edx
145474429:     	movl	$0x1, %r8d
14547442f:     	movq	%rdi, %r9
145474432:     	callq	0x14549d330 <.text+0x549c330>
145474437:     	movsd	0x163a5f1(%rip), %xmm0  # 0x146aaea30
14547443f:     	addps	%xmm10, %xmm0
145474443:     	movlps	%xmm0, 0x90(%rbp)
14547444a:     	movss	%xmm9, 0x98(%rbp)
145474453:     	movq	%r13, %rcx
145474456:     	movl	$0x2, %edx
14547445b:     	movq	%rdi, %r9
14547445e:     	callq	0x14549d330 <.text+0x549c330>
145474463:     	movsd	0x163a5d5(%rip), %xmm0  # 0x146aaea40
14547446b:     	addps	%xmm10, %xmm0
14547446f:     	movlps	%xmm0, 0x90(%rbp)
145474476:     	movss	%xmm9, 0x98(%rbp)
14547447f:     	movq	%r13, %rcx
145474482:     	movl	$0x3, %edx
145474487:     	movq	%rdi, %r9
14547448a:     	callq	0x14549d330 <.text+0x549c330>
14547448f:     	movsd	0x163a5b9(%rip), %xmm0  # 0x146aaea50
145474497:     	addps	%xmm10, %xmm0
14547449b:     	movlps	%xmm0, 0x90(%rbp)
1454744a2:     	movss	%xmm9, 0x98(%rbp)
1454744ab:     	movq	%r13, %rcx
1454744ae:     	movl	$0x4, %edx
1454744b3:     	movq	%rdi, %r9
1454744b6:     	callq	0x14549d330 <.text+0x549c330>
1454744bb:     	movsd	0x163a59d(%rip), %xmm0  # 0x146aaea60
1454744c3:     	addps	%xmm10, %xmm0
1454744c7:     	movlps	%xmm0, 0x90(%rbp)
1454744ce:     	movss	%xmm9, 0x98(%rbp)
1454744d7:     	movq	%r13, %rcx
1454744da:     	movl	$0x5, %edx
1454744df:     	movq	%rdi, %r9
1454744e2:     	callq	0x14549d330 <.text+0x549c330>
1454744e7:     	addps	0x163a581(%rip), %xmm10 # 0x146aaea70
1454744ef:     	movlps	%xmm10, 0x90(%rbp)
1454744f7:     	movss	%xmm9, 0x98(%rbp)
145474500:     	movq	%r13, %rcx
145474503:     	movl	$0x6, %edx
145474508:     	movq	%rdi, %r9
14547450b:     	callq	0x14549d330 <.text+0x549c330>
145474510:     	movss	0x8d4(%r13), %xmm7
