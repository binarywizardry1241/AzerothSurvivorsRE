
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c8110:     	pushq	%rbp
1454c8111:     	pushq	%r15
1454c8113:     	pushq	%r14
1454c8115:     	pushq	%r13
1454c8117:     	pushq	%r12
1454c8119:     	pushq	%rsi
1454c811a:     	pushq	%rdi
1454c811b:     	pushq	%rbx
1454c811c:     	subq	$0x168, %rsp            # imm = 0x168
1454c8123:     	leaq	0x80(%rsp), %rbp
1454c812b:     	movdqa	%xmm9, 0xd0(%rbp)
1454c8134:     	movaps	%xmm8, 0xc0(%rbp)
1454c813c:     	movaps	%xmm7, 0xb0(%rbp)
1454c8143:     	movaps	%xmm6, 0xa0(%rbp)
1454c814a:     	movq	$-0x2, 0x98(%rbp)
1454c8155:     	movq	%r9, %r14
1454c8158:     	movl	%r8d, %r12d
1454c815b:     	movl	%edx, %r15d
1454c815e:     	movq	%rcx, %rdi
1454c8161:     	movq	0x210(%rcx), %rcx
1454c8168:     	movq	0x218(%rdi), %rdx
1454c816f:     	callq	0x14540e820 <.text+0x540d820>
1454c8174:     	imulq	$0xf0, %rax, %rsi
1454c817b:     	leaq	0x124e2b6(%rip), %rbx   # 0x146716438
1454c8182:     	movsd	(%r14), %xmm6
1454c8187:     	movsd	0xc8(%rsi,%rbx), %xmm7
1454c8190:     	movaps	%xmm6, %xmm8
1454c8194:     	subps	%xmm7, %xmm8
1454c8198:     	movshdup	%xmm8, %xmm1            # xmm1 = xmm8[1,1,3,3]
1454c819d:     	movaps	%xmm8, %xmm0
1454c81a1:     	callq	0x145756e67 <.text+0x5755e67>
1454c81a6:     	movss	0xd8(%rsi,%rbx), %xmm1
1454c81af:     	addss	0x434b31(%rip), %xmm1   # 0x1458fcce8
1454c81b7:     	maxss	0x4232c1(%rip), %xmm1   # 0x1458eb480
1454c81bf:     	ucomiss	%xmm0, %xmm1
1454c81c2:     	jae	0x1454c8215 <.text+0x54c7215>
1454c81c4:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454c81c8:     	divps	%xmm0, %xmm8
1454c81cc:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454c81d0:     	mulps	%xmm8, %xmm0
1454c81d4:     	addps	%xmm0, %xmm7
1454c81d7:     	movshdup	%xmm7, %xmm6            # xmm6 = xmm7[1,1,3,3]
1454c81db:     	movq	0x878(%rdi), %r14
1454c81e2:     	leaq	0x10(%r14), %rcx
1454c81e6:     	movaps	%xmm7, %xmm1
1454c81e9:     	movaps	%xmm6, %xmm2
1454c81ec:     	callq	0x1454627f0 <.text+0x54617f0>
1454c81f1:     	testb	$0x1, %al
1454c81f3:     	jne	0x1454c8212 <.text+0x54c7212>
1454c81f5:     	cmpq	$-0x1, 0x68(%r14)
1454c81fa:     	je	0x1454c8212 <.text+0x54c7212>
1454c81fc:     	addq	$0x68, %r14
1454c8200:     	leaq	0x60(%rbp), %rcx
1454c8204:     	movq	%r14, %rdx
1454c8207:     	movaps	%xmm7, %xmm2
1454c820a:     	movaps	%xmm6, %xmm3
1454c820d:     	callq	0x145467bf0 <.text+0x5466bf0>
1454c8212:     	movaps	%xmm7, %xmm6
1454c8215:     	movl	$0x5, %r14d
1454c821b:     	movl	%r15d, %eax
1454c821e:     	leaq	0x14e4b7f(%rip), %rcx   # 0x1469acda4
1454c8225:     	movslq	(%rcx,%rax,4), %rax
1454c8229:     	addq	%rcx, %rax
1454c822c:     	jmpq	*%rax
1454c822e:     	movq	0x530(%rdi), %rax
1454c8235:     	testq	%rax, %rax
1454c8238:     	je	0x1454c84e9 <.text+0x54c74e9>
1454c823e:     	movq	0x528(%rdi), %rcx
1454c8245:     	xorl	%edx, %edx
1454c8247:     	cmpq	$0x1, %rax
1454c824b:     	jne	0x1454c8415 <.text+0x54c7415>
1454c8251:     	xorl	%r9d, %r9d
1454c8254:     	xorl	%r8d, %r8d
1454c8257:     	jmp	0x1454c8469 <.text+0x54c7469>
1454c825c:     	movl	%r15d, %r13d
1454c825f:     	movq	0x530(%rdi), %rax
1454c8266:     	movl	$0x3, %r14d
1454c826c:     	movl	$0x232d, 0x5c(%rbp)     # imm = 0x232D
1454c8273:     	movabsq	$0x3f80000000000103, %r15 # imm = 0x3F80000000000103
1454c827d:     	testq	%rax, %rax
1454c8280:     	je	0x1454c8fad <.text+0x54c7fad>
1454c8286:     	movq	0x528(%rdi), %rcx
1454c828d:     	cmpq	$0x4, %rax
1454c8291:     	jae	0x1454c829d <.text+0x54c729d>
1454c8293:     	xorl	%edx, %edx
1454c8295:     	xorl	%r8d, %r8d
1454c8298:     	jmp	0x1454c8331 <.text+0x54c7331>
1454c829d:     	movq	%rax, %rdx
1454c82a0:     	andq	$-0x4, %rdx
1454c82a4:     	leaq	0xf8(%rcx), %r8
1454c82ab:     	xorps	%xmm0, %xmm0
1454c82ae:     	movdqa	0x14e218a(%rip), %xmm1  # 0x1469aa440
1454c82b6:     	movdqa	0x434822(%rip), %xmm2   # 0x1458fcae0
1454c82be:     	movq	%rdx, %r9
1454c82c1:     	xorps	%xmm3, %xmm3
1454c82c4:     	nopw	%cs:(%rax,%rax)
1454c82d0:     	movd	-0x90(%r8), %xmm4
1454c82d9:     	movd	-0xd8(%r8), %xmm5
1454c82e2:     	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
1454c82e6:     	movd	(%r8), %xmm4
1454c82eb:     	movd	-0x48(%r8), %xmm7
1454c82f1:     	punpcklqdq	%xmm4, %xmm7    # xmm7 = xmm7[0],xmm4[0]
1454c82f5:     	pcmpeqd	%xmm1, %xmm5
1454c82f9:     	pand	%xmm2, %xmm5
1454c82fd:     	paddq	%xmm5, %xmm3
1454c8301:     	pcmpeqd	%xmm1, %xmm7
1454c8305:     	pand	%xmm2, %xmm7
1454c8309:     	paddq	%xmm7, %xmm0
1454c830d:     	addq	$0x120, %r8             # imm = 0x120
1454c8314:     	addq	$-0x4, %r9
1454c8318:     	jne	0x1454c82d0 <.text+0x54c72d0>
1454c831a:     	paddq	%xmm3, %xmm0
1454c831e:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454c8323:     	paddq	%xmm0, %xmm1
1454c8327:     	movq	%xmm1, %r8
1454c832c:     	cmpq	%rdx, %rax
1454c832f:     	je	0x1454c8366 <.text+0x54c7366>
1454c8331:     	movq	%rax, %r9
1454c8334:     	subq	%rdx, %r9
1454c8337:     	leaq	(%rdx,%rdx,8), %rdx
1454c833b:     	leaq	(%rcx,%rdx,8), %rdx
1454c833f:     	addq	$0x20, %rdx
1454c8343:     	nopw	%cs:(%rax,%rax)
1454c8350:     	xorl	%r10d, %r10d
1454c8353:     	cmpl	$0x2, (%rdx)
1454c8356:     	sete	%r10b
1454c835a:     	addq	%r10, %r8
1454c835d:     	addq	$0x48, %rdx
1454c8361:     	decq	%r9
1454c8364:     	jne	0x1454c8350 <.text+0x54c7350>
1454c8366:     	cmpq	$0x5, %r8
1454c836a:     	jb	0x1454c8fad <.text+0x54c7fad>
1454c8370:     	shlq	$0x3, %rax
1454c8374:     	leaq	(%rax,%rax,8), %rax
1454c8378:     	xorl	%r9d, %r9d
1454c837b:     	xorl	%r8d, %r8d
1454c837e:     	nop
1454c8380:     	cmpq	%r8, %rax
1454c8383:     	je	0x1454c8fad <.text+0x54c7fad>
1454c8389:     	leaq	0x48(%r8), %rdx
1454c838d:     	decq	%r9
1454c8390:     	cmpl	$0x2, 0x20(%rcx,%r8)
1454c8396:     	movq	%rdx, %r8
1454c8399:     	jne	0x1454c8380 <.text+0x54c7380>
1454c839b:     	movq	%r9, %r8
1454c839e:     	notq	%r8
1454c83a1:     	subq	%rdx, %rax
1454c83a4:     	je	0x1454c8fa2 <.text+0x54c7fa2>
1454c83aa:     	leaq	(%rcx,%rdx), %r10
1454c83ae:     	addq	%rdx, %rcx
1454c83b1:     	addq	$-0x48, %rcx
1454c83b5:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
1454c83bf:     	mulq	%rdx
1454c83c2:     	shrq	$0x6, %rdx
1454c83c6:     	negq	%r9
1454c83c9:     	xorl	%eax, %eax
1454c83cb:     	jmp	0x1454c83e0 <.text+0x54c73e0>
1454c83cd:     	nopl	(%rax)
1454c83d0:     	incq	%rax
1454c83d3:     	addq	$0x48, %r10
1454c83d7:     	cmpq	%rax, %rdx
1454c83da:     	je	0x1454c8fa2 <.text+0x54c7fa2>
1454c83e0:     	cmpl	$0x2, 0x20(%r10)
1454c83e5:     	jne	0x1454c83d0 <.text+0x54c73d0>
1454c83e7:     	movl	0x40(%rcx), %r11d
1454c83eb:     	movl	0x40(%r10), %esi
1454c83ef:     	movl	%r11d, %ebx
1454c83f2:     	sarl	$0x1f, %ebx
1454c83f5:     	shrl	%ebx
1454c83f7:     	xorl	%r11d, %ebx
1454c83fa:     	movl	%esi, %r11d
1454c83fd:     	sarl	$0x1f, %r11d
1454c8401:     	shrl	%r11d
1454c8404:     	xorl	%esi, %r11d
1454c8407:     	cmpl	%r11d, %ebx
1454c840a:     	jle	0x1454c83d0 <.text+0x54c73d0>
1454c840c:     	leaq	(%r9,%rax), %r8
1454c8410:     	movq	%r10, %rcx
1454c8413:     	jmp	0x1454c83d0 <.text+0x54c73d0>
1454c8415:     	movq	%rax, %r10
1454c8418:     	andq	$-0x2, %r10
1454c841c:     	leaq	0x68(%rcx), %r11
1454c8420:     	xorl	%r9d, %r9d
1454c8423:     	xorl	%r8d, %r8d
1454c8426:     	nopw	%cs:(%rax,%rax)
1454c8430:     	movl	-0x50(%r11), %esi
1454c8434:     	xorl	$0x1, %esi
1454c8437:     	cmpl	$0x0, -0x48(%r11)
1454c843c:     	cmovnel	%edx, %esi
1454c843f:     	addq	%r8, %rsi
1454c8442:     	movl	-0x8(%r11), %r8d
1454c8446:     	xorl	$0x1, %r8d
1454c844a:     	cmpl	$0x0, (%r11)
1454c844e:     	cmovnel	%edx, %r8d
1454c8452:     	addq	%rsi, %r8
1454c8455:     	addq	$0x2, %r9
1454c8459:     	addq	$0x90, %r11
1454c8460:     	cmpq	%r9, %r10
1454c8463:     	jne	0x1454c8430 <.text+0x54c7430>
1454c8465:     	testb	$0x1, %al
1454c8467:     	je	0x1454c8483 <.text+0x54c7483>
1454c8469:     	leaq	(%r9,%r9,8), %r9
1454c846d:     	movl	0x18(%rcx,%r9,8), %r10d
1454c8472:     	xorl	$0x1, %r10d
1454c8476:     	cmpl	$0x0, 0x20(%rcx,%r9,8)
1454c847c:     	cmovel	%r10d, %edx
1454c8480:     	addq	%rdx, %r8
1454c8483:     	cmpq	$0x2d, %r8
1454c8487:     	jb	0x1454c84e9 <.text+0x54c74e9>
1454c8489:     	shlq	$0x3, %rax
1454c848d:     	leaq	(%rax,%rax,8), %rax
1454c8491:     	xorl	%edx, %edx
1454c8493:     	jmp	0x1454c84a9 <.text+0x54c74a9>
1454c8495:     	nopw	%cs:(%rax,%rax)
1454c84a0:     	addq	$0x48, %rdx
1454c84a4:     	cmpq	%rdx, %rax
1454c84a7:     	je	0x1454c84e9 <.text+0x54c74e9>
1454c84a9:     	cmpl	$0x0, 0x20(%rcx,%rdx)
1454c84ae:     	jne	0x1454c84a0 <.text+0x54c74a0>
1454c84b0:     	cmpl	$0x1, 0x18(%rcx,%rdx)
1454c84b5:     	je	0x1454c84a0 <.text+0x54c74a0>
1454c84b7:     	leaq	-0x48(%rax), %r9
1454c84bb:     	leaq	(%rcx,%rdx), %r8
1454c84bf:     	cmpq	%rdx, %r9
1454c84c2:     	je	0x1454c9249 <.text+0x54c8249>
1454c84c8:     	subq	%rdx, %rax
1454c84cb:     	addq	$-0x48, %rax
1454c84cf:     	addq	%rdx, %rcx
1454c84d2:     	addq	$0x48, %rcx
1454c84d6:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
1454c84e0:     	mulq	%rdx
1454c84e3:     	shrq	$0x6, %rdx
1454c84e7:     	jmp	0x1454c8550 <.text+0x54c7550>
1454c84e9:     	movl	0x904(%rdi), %ebx
1454c84ef:     	incl	%ebx
1454c84f1:     	movl	%ebx, 0x904(%rdi)
1454c84f7:     	andl	$0xffffff, %ebx         # imm = 0xFFFFFF
1454c84fd:     	movabsq	$-0xecfffdcd7000000, %rax # imm = 0xF130002329000000
1454c8507:     	xorl	%ecx, %ecx
1454c8509:     	cmpl	$0x4, %r12d
1454c850d:     	setae	%dl
1454c8510:     	cmpl	$0x14, %r12d
1454c8514:     	movl	$0x40cb, %r8d           # imm = 0x40CB
1454c851a:     	movl	$0x721, %r14d           # imm = 0x721
1454c8520:     	cmovael	%r8d, %r14d
1454c8524:     	jae	0x1454c85a8 <.text+0x54c75a8>
1454c852a:     	movb	%dl, %cl
1454c852c:     	leaq	0x14e208d(%rip), %rdx   # 0x1469aa5c0
1454c8533:     	movd	(%rdx,%rcx,4), %xmm9
1454c8539:     	jmp	0x1454c85b1 <.text+0x54c75b1>
1454c853b:     	nopl	(%rax,%rax)
1454c8540:     	movq	%rax, %r8
1454c8543:     	addq	$0x48, %rcx
1454c8547:     	decq	%rdx
1454c854a:     	je	0x1454c9242 <.text+0x54c8242>
1454c8550:     	cmpl	$0x0, 0x20(%rcx)
1454c8554:     	jne	0x1454c8543 <.text+0x54c7543>
1454c8556:     	cmpb	$0x0, 0x18(%rcx)
1454c855a:     	jne	0x1454c8543 <.text+0x54c7543>
1454c855c:     	movsd	0x34(%r8), %xmm0
1454c8562:     	subps	%xmm6, %xmm0
1454c8565:     	mulps	%xmm0, %xmm0
1454c8568:     	movsd	0x34(%rcx), %xmm1
1454c856d:     	subps	%xmm6, %xmm1
1454c8570:     	mulps	%xmm1, %xmm1
1454c8573:     	haddps	%xmm1, %xmm0
1454c8577:     	shufps	$0xe8, %xmm0, %xmm0     # xmm0 = xmm0[0,2,2,3]
1454c857b:     	movaps	%xmm0, %xmm1
1454c857e:     	psrad	$0x1f, %xmm1
1454c8583:     	psrld	$0x1, %xmm1
1454c8588:     	pxor	%xmm0, %xmm1
1454c858c:     	pshufd	$0x55, %xmm1, %xmm0     # xmm0 = xmm1[1,1,1,1]
1454c8591:     	pcmpgtd	%xmm0, %xmm1
1454c8595:     	movd	%xmm1, %r9d
1454c859a:     	movq	%rcx, %rax
1454c859d:     	testb	$0x1, %r9b
1454c85a1:     	jne	0x1454c8540 <.text+0x54c7540>
1454c85a3:     	movq	%r8, %rax
1454c85a6:     	jmp	0x1454c8540 <.text+0x54c7540>
1454c85a8:     	movd	0x422f63(%rip), %xmm9   # 0x1458eb514
1454c85b1:     	orq	%rax, %rbx
1454c85b4:     	movq	0x878(%rdi), %rsi
1454c85bb:     	leaq	0x10(%rsi), %rcx
1454c85bf:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454c85c4:     	movaps	%xmm6, %xmm1
1454c85c7:     	movaps	%xmm8, %xmm2
1454c85cb:     	callq	0x1454627f0 <.text+0x54617f0>
1454c85d0:     	testb	$0x1, %al
1454c85d2:     	je	0x1454c85d9 <.text+0x54c75d9>
1454c85d4:     	movaps	%xmm0, %xmm7
1454c85d7:     	jmp	0x1454c8609 <.text+0x54c7609>
1454c85d9:     	cmpq	$-0x1, 0x68(%rsi)
1454c85de:     	je	0x1454c8601 <.text+0x54c7601>
1454c85e0:     	leaq	0x68(%rsi), %rdx
1454c85e4:     	leaq	0x60(%rbp), %rcx
1454c85e8:     	movaps	%xmm6, %xmm2
1454c85eb:     	movaps	%xmm8, %xmm3
1454c85ef:     	callq	0x145467bf0 <.text+0x5466bf0>
1454c85f4:     	cmpl	$0x1, 0x60(%rbp)
1454c85f8:     	jne	0x1454c8601 <.text+0x54c7601>
1454c85fa:     	movss	0x6c(%rbp), %xmm7
1454c85ff:     	jmp	0x1454c8609 <.text+0x54c7609>
1454c8601:     	movss	0x90(%rsi), %xmm7
1454c8609:     	movq	$0x0, 0x40(%rbp)
1454c8611:     	movq	$0x0, 0x50(%rbp)
1454c8619:     	leaq	0x40(%rbp), %r15
1454c861d:     	movq	%r15, %rcx
1454c8620:     	xorl	%edx, %edx
1454c8622:     	movq	%rbx, %r8
1454c8625:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454c862a:     	nop
1454c862b:     	movq	0x40(%rbp), %rax
1454c862f:     	testq	%rax, %rax
1454c8632:     	je	0x1454c8696 <.text+0x54c7696>
1454c8634:     	movq	0x48(%rbp), %rcx
1454c8638:     	movw	$0x2, %dx
1454c863c:     	movzwl	0x36(%rax), %r9d
1454c8641:     	movl	%r9d, %r10d
1454c8644:     	addl	%r10d, %r10d
1454c8647:     	movq	$-0x1, %r8
1454c864e:     	nop
1454c8650:     	testq	%r10, %r10
1454c8653:     	je	0x1454c867b <.text+0x54c767b>
1454c8655:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c865b:     	seta	%r11b
1454c865f:     	sbbb	$0x0, %r11b
1454c8663:     	incq	%r8
1454c8666:     	addq	$-0x2, %r10
1454c866a:     	cmpb	$0x1, %r11b
1454c866e:     	je	0x1454c8650 <.text+0x54c7650>
1454c8670:     	movzbl	%r11b, %r9d
1454c8674:     	testl	%r9d, %r9d
1454c8677:     	jne	0x1454c867e <.text+0x54c767e>
1454c8679:     	jmp	0x1454c868b <.text+0x54c768b>
1454c867b:     	movq	%r9, %r8
1454c867e:     	subq	$0x1, %rcx
1454c8682:     	jb	0x1454c8698 <.text+0x54c7698>
1454c8684:     	movq	0x50(%rax,%r8,8), %rax
1454c8689:     	jmp	0x1454c863c <.text+0x54c763c>
1454c868b:     	movl	$0x9, 0x8(%rax,%r8,4)
1454c8694:     	jmp	0x1454c86cb <.text+0x54c76cb>
1454c8696:     	xorl	%eax, %eax
1454c8698:     	movq	%r15, 0x60(%rbp)
1454c869c:     	movq	%rax, 0x68(%rbp)
1454c86a0:     	movq	$0x0, 0x70(%rbp)
1454c86a8:     	movq	%r8, 0x78(%rbp)
1454c86ac:     	movq	$0x2, 0x80(%rbp)
1454c86b7:     	leaq	0x20(%rbp), %rcx
1454c86bb:     	leaq	0x60(%rbp), %rdx
1454c86bf:     	movl	$0x9, %r8d
1454c86c5:     	callq	0x145427a50 <.text+0x5426a50>
1454c86ca:     	nop
1454c86cb:     	movq	0x40(%rbp), %rax
1454c86cf:     	testq	%rax, %rax
1454c86d2:     	je	0x1454c8736 <.text+0x54c7736>
1454c86d4:     	movq	0x48(%rbp), %rcx
1454c86d8:     	movw	$0x3, %dx
1454c86dc:     	movzwl	0x36(%rax), %r9d
1454c86e1:     	movl	%r9d, %r10d
1454c86e4:     	addl	%r10d, %r10d
1454c86e7:     	movq	$-0x1, %r8
1454c86ee:     	nop
1454c86f0:     	testq	%r10, %r10
1454c86f3:     	je	0x1454c871b <.text+0x54c771b>
1454c86f5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c86fb:     	seta	%r11b
1454c86ff:     	sbbb	$0x0, %r11b
1454c8703:     	incq	%r8
1454c8706:     	addq	$-0x2, %r10
1454c870a:     	cmpb	$0x1, %r11b
1454c870e:     	je	0x1454c86f0 <.text+0x54c76f0>
1454c8710:     	movzbl	%r11b, %r9d
1454c8714:     	testl	%r9d, %r9d
1454c8717:     	jne	0x1454c871e <.text+0x54c771e>
1454c8719:     	jmp	0x1454c872b <.text+0x54c772b>
1454c871b:     	movq	%r9, %r8
1454c871e:     	subq	$0x1, %rcx
1454c8722:     	jb	0x1454c8738 <.text+0x54c7738>
1454c8724:     	movq	0x50(%rax,%r8,8), %rax
1454c8729:     	jmp	0x1454c86dc <.text+0x54c76dc>
1454c872b:     	movl	$0x2329, 0x8(%rax,%r8,4) # imm = 0x2329
1454c8734:     	jmp	0x1454c876b <.text+0x54c776b>
1454c8736:     	xorl	%eax, %eax
1454c8738:     	movq	%r15, 0x60(%rbp)
1454c873c:     	movq	%rax, 0x68(%rbp)
1454c8740:     	movq	$0x0, 0x70(%rbp)
1454c8748:     	movq	%r8, 0x78(%rbp)
1454c874c:     	movq	$0x3, 0x80(%rbp)
1454c8757:     	leaq	0x20(%rbp), %rcx
1454c875b:     	leaq	0x60(%rbp), %rdx
1454c875f:     	movl	$0x2329, %r8d           # imm = 0x2329
1454c8765:     	callq	0x145427a50 <.text+0x5426a50>
1454c876a:     	nop
1454c876b:     	movq	0x40(%rbp), %rax
1454c876f:     	testq	%rax, %rax
1454c8772:     	je	0x1454c87d4 <.text+0x54c77d4>
1454c8774:     	movq	0x48(%rbp), %rcx
1454c8778:     	movw	$0x4, %dx
1454c877c:     	movzwl	0x36(%rax), %r8d
1454c8781:     	movl	%r8d, %r10d
1454c8784:     	addl	%r10d, %r10d
1454c8787:     	movq	$-0x1, %r9
1454c878e:     	nop
1454c8790:     	testq	%r10, %r10
1454c8793:     	je	0x1454c87bb <.text+0x54c77bb>
1454c8795:     	cmpw	0x3a(%rax,%r9,2), %dx
1454c879b:     	seta	%r11b
1454c879f:     	sbbb	$0x0, %r11b
1454c87a3:     	incq	%r9
1454c87a6:     	addq	$-0x2, %r10
1454c87aa:     	cmpb	$0x1, %r11b
1454c87ae:     	je	0x1454c8790 <.text+0x54c7790>
1454c87b0:     	movzbl	%r11b, %r8d
1454c87b4:     	testl	%r8d, %r8d
1454c87b7:     	jne	0x1454c87be <.text+0x54c77be>
1454c87b9:     	jmp	0x1454c87cb <.text+0x54c77cb>
1454c87bb:     	movq	%r8, %r9
1454c87be:     	subq	$0x1, %rcx
1454c87c2:     	jb	0x1454c87d6 <.text+0x54c77d6>
1454c87c4:     	movq	0x50(%rax,%r9,8), %rax
1454c87c9:     	jmp	0x1454c877c <.text+0x54c777c>
1454c87cb:     	movd	%xmm9, 0x8(%rax,%r9,4)
1454c87d2:     	jmp	0x1454c8808 <.text+0x54c7808>
1454c87d4:     	xorl	%eax, %eax
1454c87d6:     	movd	%xmm9, %r8d
1454c87db:     	movq	%r15, 0x60(%rbp)
1454c87df:     	movq	%rax, 0x68(%rbp)
1454c87e3:     	movq	$0x0, 0x70(%rbp)
1454c87eb:     	movq	%r9, 0x78(%rbp)
1454c87ef:     	movq	$0x4, 0x80(%rbp)
1454c87fa:     	leaq	0x20(%rbp), %rcx
1454c87fe:     	leaq	0x60(%rbp), %rdx
1454c8802:     	callq	0x145427a50 <.text+0x5426a50>
1454c8807:     	nop
1454c8808:     	movq	0x40(%rbp), %rax
1454c880c:     	testq	%rax, %rax
1454c880f:     	je	0x1454c8876 <.text+0x54c7876>
1454c8811:     	movq	0x48(%rbp), %rcx
1454c8815:     	movw	$0x16, %dx
1454c8819:     	movzwl	0x36(%rax), %r9d
1454c881e:     	movl	%r9d, %r10d
1454c8821:     	addl	%r10d, %r10d
1454c8824:     	movq	$-0x1, %r8
1454c882b:     	nopl	(%rax,%rax)
1454c8830:     	testq	%r10, %r10
1454c8833:     	je	0x1454c885b <.text+0x54c785b>
1454c8835:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c883b:     	seta	%r11b
1454c883f:     	sbbb	$0x0, %r11b
1454c8843:     	incq	%r8
1454c8846:     	addq	$-0x2, %r10
1454c884a:     	cmpb	$0x1, %r11b
1454c884e:     	je	0x1454c8830 <.text+0x54c7830>
1454c8850:     	movzbl	%r11b, %r9d
1454c8854:     	testl	%r9d, %r9d
1454c8857:     	jne	0x1454c885e <.text+0x54c785e>
1454c8859:     	jmp	0x1454c886b <.text+0x54c786b>
1454c885b:     	movq	%r9, %r8
1454c885e:     	subq	$0x1, %rcx
1454c8862:     	jb	0x1454c8878 <.text+0x54c7878>
1454c8864:     	movq	0x50(%rax,%r8,8), %rax
1454c8869:     	jmp	0x1454c8819 <.text+0x54c7819>
1454c886b:     	movl	$0x1, 0x8(%rax,%r8,4)
1454c8874:     	jmp	0x1454c88ab <.text+0x54c78ab>
1454c8876:     	xorl	%eax, %eax
1454c8878:     	movq	%r15, 0x60(%rbp)
1454c887c:     	movq	%rax, 0x68(%rbp)
1454c8880:     	movq	$0x0, 0x70(%rbp)
1454c8888:     	movq	%r8, 0x78(%rbp)
1454c888c:     	movq	$0x16, 0x80(%rbp)
1454c8897:     	leaq	0x20(%rbp), %rcx
1454c889b:     	leaq	0x60(%rbp), %rdx
1454c889f:     	movl	$0x1, %r8d
1454c88a5:     	callq	0x145427a50 <.text+0x5426a50>
1454c88aa:     	nop
1454c88ab:     	movq	0x40(%rbp), %rax
1454c88af:     	testq	%rax, %rax
1454c88b2:     	je	0x1454c8916 <.text+0x54c7916>
1454c88b4:     	movq	0x48(%rbp), %rcx
1454c88b8:     	movw	$0x1c, %dx
1454c88bc:     	movzwl	0x36(%rax), %r9d
1454c88c1:     	movl	%r9d, %r10d
1454c88c4:     	addl	%r10d, %r10d
1454c88c7:     	movq	$-0x1, %r8
1454c88ce:     	nop
1454c88d0:     	testq	%r10, %r10
1454c88d3:     	je	0x1454c88fb <.text+0x54c78fb>
1454c88d5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c88db:     	seta	%r11b
1454c88df:     	sbbb	$0x0, %r11b
1454c88e3:     	incq	%r8
1454c88e6:     	addq	$-0x2, %r10
1454c88ea:     	cmpb	$0x1, %r11b
1454c88ee:     	je	0x1454c88d0 <.text+0x54c78d0>
1454c88f0:     	movzbl	%r11b, %r9d
1454c88f4:     	testl	%r9d, %r9d
1454c88f7:     	jne	0x1454c88fe <.text+0x54c78fe>
1454c88f9:     	jmp	0x1454c890b <.text+0x54c790b>
1454c88fb:     	movq	%r9, %r8
1454c88fe:     	subq	$0x1, %rcx
1454c8902:     	jb	0x1454c8918 <.text+0x54c7918>
1454c8904:     	movq	0x50(%rax,%r8,8), %rax
1454c8909:     	jmp	0x1454c88bc <.text+0x54c78bc>
1454c890b:     	movl	$0x1, 0x8(%rax,%r8,4)
1454c8914:     	jmp	0x1454c894b <.text+0x54c794b>
1454c8916:     	xorl	%eax, %eax
1454c8918:     	movq	%r15, 0x60(%rbp)
1454c891c:     	movq	%rax, 0x68(%rbp)
1454c8920:     	movq	$0x0, 0x70(%rbp)
1454c8928:     	movq	%r8, 0x78(%rbp)
1454c892c:     	movq	$0x1c, 0x80(%rbp)
1454c8937:     	leaq	0x20(%rbp), %rcx
1454c893b:     	leaq	0x60(%rbp), %rdx
1454c893f:     	movl	$0x1, %r8d
1454c8945:     	callq	0x145427a50 <.text+0x5426a50>
1454c894a:     	nop
1454c894b:     	movq	0x40(%rbp), %rax
1454c894f:     	testq	%rax, %rax
1454c8952:     	je	0x1454c89b6 <.text+0x54c79b6>
1454c8954:     	movq	0x48(%rbp), %rcx
1454c8958:     	movw	$0x22, %dx
1454c895c:     	movzwl	0x36(%rax), %r9d
1454c8961:     	movl	%r9d, %r10d
1454c8964:     	addl	%r10d, %r10d
1454c8967:     	movq	$-0x1, %r8
1454c896e:     	nop
1454c8970:     	testq	%r10, %r10
1454c8973:     	je	0x1454c899b <.text+0x54c799b>
1454c8975:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c897b:     	seta	%r11b
1454c897f:     	sbbb	$0x0, %r11b
1454c8983:     	incq	%r8
1454c8986:     	addq	$-0x2, %r10
1454c898a:     	cmpb	$0x1, %r11b
1454c898e:     	je	0x1454c8970 <.text+0x54c7970>
1454c8990:     	movzbl	%r11b, %r9d
1454c8994:     	testl	%r9d, %r9d
1454c8997:     	jne	0x1454c899e <.text+0x54c799e>
1454c8999:     	jmp	0x1454c89ab <.text+0x54c79ab>
1454c899b:     	movq	%r9, %r8
1454c899e:     	subq	$0x1, %rcx
1454c89a2:     	jb	0x1454c89b8 <.text+0x54c79b8>
1454c89a4:     	movq	0x50(%rax,%r8,8), %rax
1454c89a9:     	jmp	0x1454c895c <.text+0x54c795c>
1454c89ab:     	movl	$0x1, 0x8(%rax,%r8,4)
1454c89b4:     	jmp	0x1454c89eb <.text+0x54c79eb>
1454c89b6:     	xorl	%eax, %eax
1454c89b8:     	movq	%r15, 0x60(%rbp)
1454c89bc:     	movq	%rax, 0x68(%rbp)
1454c89c0:     	movq	$0x0, 0x70(%rbp)
1454c89c8:     	movq	%r8, 0x78(%rbp)
1454c89cc:     	movq	$0x22, 0x80(%rbp)
1454c89d7:     	leaq	0x20(%rbp), %rcx
1454c89db:     	leaq	0x60(%rbp), %rdx
1454c89df:     	movl	$0x1, %r8d
1454c89e5:     	callq	0x145427a50 <.text+0x5426a50>
1454c89ea:     	nop
1454c89eb:     	movq	0x40(%rbp), %rax
1454c89ef:     	testq	%rax, %rax
1454c89f2:     	je	0x1454c8a56 <.text+0x54c7a56>
1454c89f4:     	movq	0x48(%rbp), %rcx
1454c89f8:     	movw	$0x23, %dx
1454c89fc:     	movzwl	0x36(%rax), %r9d
1454c8a01:     	movl	%r9d, %r10d
1454c8a04:     	addl	%r10d, %r10d
1454c8a07:     	movq	$-0x1, %r8
1454c8a0e:     	nop
1454c8a10:     	testq	%r10, %r10
1454c8a13:     	je	0x1454c8a3b <.text+0x54c7a3b>
1454c8a15:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c8a1b:     	seta	%r11b
1454c8a1f:     	sbbb	$0x0, %r11b
1454c8a23:     	incq	%r8
1454c8a26:     	addq	$-0x2, %r10
1454c8a2a:     	cmpb	$0x1, %r11b
1454c8a2e:     	je	0x1454c8a10 <.text+0x54c7a10>
1454c8a30:     	movzbl	%r11b, %r9d
1454c8a34:     	testl	%r9d, %r9d
1454c8a37:     	jne	0x1454c8a3e <.text+0x54c7a3e>
1454c8a39:     	jmp	0x1454c8a4b <.text+0x54c7a4b>
1454c8a3b:     	movq	%r9, %r8
1454c8a3e:     	subq	$0x1, %rcx
1454c8a42:     	jb	0x1454c8a58 <.text+0x54c7a58>
1454c8a44:     	movq	0x50(%rax,%r8,8), %rax
1454c8a49:     	jmp	0x1454c89fc <.text+0x54c79fc>
1454c8a4b:     	movl	$0x23, 0x8(%rax,%r8,4)
1454c8a54:     	jmp	0x1454c8a8b <.text+0x54c7a8b>
1454c8a56:     	xorl	%eax, %eax
1454c8a58:     	movq	%r15, 0x60(%rbp)
1454c8a5c:     	movq	%rax, 0x68(%rbp)
1454c8a60:     	movq	$0x0, 0x70(%rbp)
1454c8a68:     	movq	%r8, 0x78(%rbp)
1454c8a6c:     	movq	$0x23, 0x80(%rbp)
1454c8a77:     	leaq	0x20(%rbp), %rcx
1454c8a7b:     	leaq	0x60(%rbp), %rdx
1454c8a7f:     	movl	$0x23, %r8d
1454c8a85:     	callq	0x145427a50 <.text+0x5426a50>
1454c8a8a:     	nop
1454c8a8b:     	movq	0x40(%rbp), %rax
1454c8a8f:     	testq	%rax, %rax
1454c8a92:     	je	0x1454c8af6 <.text+0x54c7af6>
1454c8a94:     	movq	0x48(%rbp), %rcx
1454c8a98:     	movw	$0x2e, %dx
1454c8a9c:     	movzwl	0x36(%rax), %r9d
1454c8aa1:     	movl	%r9d, %r10d
1454c8aa4:     	addl	%r10d, %r10d
1454c8aa7:     	movq	$-0x1, %r8
1454c8aae:     	nop
1454c8ab0:     	testq	%r10, %r10
1454c8ab3:     	je	0x1454c8adb <.text+0x54c7adb>
1454c8ab5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c8abb:     	seta	%r11b
1454c8abf:     	sbbb	$0x0, %r11b
1454c8ac3:     	incq	%r8
1454c8ac6:     	addq	$-0x2, %r10
1454c8aca:     	cmpb	$0x1, %r11b
1454c8ace:     	je	0x1454c8ab0 <.text+0x54c7ab0>
1454c8ad0:     	movzbl	%r11b, %r9d
1454c8ad4:     	testl	%r9d, %r9d
1454c8ad7:     	jne	0x1454c8ade <.text+0x54c7ade>
1454c8ad9:     	jmp	0x1454c8aeb <.text+0x54c7aeb>
1454c8adb:     	movq	%r9, %r8
1454c8ade:     	subq	$0x1, %rcx
1454c8ae2:     	jb	0x1454c8af8 <.text+0x54c7af8>
1454c8ae4:     	movq	0x50(%rax,%r8,8), %rax
1454c8ae9:     	jmp	0x1454c8a9c <.text+0x54c7a9c>
1454c8aeb:     	movl	$0x2000002, 0x8(%rax,%r8,4) # imm = 0x2000002
1454c8af4:     	jmp	0x1454c8b2b <.text+0x54c7b2b>
1454c8af6:     	xorl	%eax, %eax
1454c8af8:     	movq	%r15, 0x60(%rbp)
1454c8afc:     	movq	%rax, 0x68(%rbp)
1454c8b00:     	movq	$0x0, 0x70(%rbp)
1454c8b08:     	movq	%r8, 0x78(%rbp)
1454c8b0c:     	movq	$0x2e, 0x80(%rbp)
1454c8b17:     	leaq	0x20(%rbp), %rcx
1454c8b1b:     	leaq	0x60(%rbp), %rdx
1454c8b1f:     	movl	$0x2000002, %r8d        # imm = 0x2000002
1454c8b25:     	callq	0x145427a50 <.text+0x5426a50>
1454c8b2a:     	nop
1454c8b2b:     	movq	0x40(%rbp), %rax
1454c8b2f:     	testq	%rax, %rax
1454c8b32:     	je	0x1454c8b99 <.text+0x54c7b99>
1454c8b34:     	movq	0x48(%rbp), %rcx
1454c8b38:     	movl	$0x81, %edx
1454c8b3d:     	movzwl	0x36(%rax), %r9d
1454c8b42:     	movl	%r9d, %r10d
1454c8b45:     	addl	%r10d, %r10d
1454c8b48:     	movq	$-0x1, %r8
1454c8b4f:     	nop
1454c8b50:     	testq	%r10, %r10
1454c8b53:     	je	0x1454c8b7e <.text+0x54c7b7e>
1454c8b55:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c8b5b:     	cmpl	%r11d, %edx
1454c8b5e:     	seta	%r11b
1454c8b62:     	sbbb	$0x0, %r11b
1454c8b66:     	incq	%r8
1454c8b69:     	addq	$-0x2, %r10
1454c8b6d:     	cmpb	$0x1, %r11b
1454c8b71:     	je	0x1454c8b50 <.text+0x54c7b50>
1454c8b73:     	movzbl	%r11b, %r9d
1454c8b77:     	testl	%r9d, %r9d
1454c8b7a:     	jne	0x1454c8b81 <.text+0x54c7b81>
1454c8b7c:     	jmp	0x1454c8b8e <.text+0x54c7b8e>
1454c8b7e:     	movq	%r9, %r8
1454c8b81:     	subq	$0x1, %rcx
1454c8b85:     	jb	0x1454c8b9b <.text+0x54c7b9b>
1454c8b87:     	movq	0x50(%rax,%r8,8), %rax
1454c8b8c:     	jmp	0x1454c8b3d <.text+0x54c7b3d>
1454c8b8e:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
1454c8b97:     	jmp	0x1454c8bce <.text+0x54c7bce>
1454c8b99:     	xorl	%eax, %eax
1454c8b9b:     	movq	%r15, 0x60(%rbp)
1454c8b9f:     	movq	%rax, 0x68(%rbp)
1454c8ba3:     	movq	$0x0, 0x70(%rbp)
1454c8bab:     	movq	%r8, 0x78(%rbp)
1454c8baf:     	movq	$0x81, 0x80(%rbp)
1454c8bba:     	leaq	0x20(%rbp), %rcx
1454c8bbe:     	leaq	0x60(%rbp), %rdx
1454c8bc2:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
1454c8bc8:     	callq	0x145427a50 <.text+0x5426a50>
1454c8bcd:     	nop
1454c8bce:     	movq	0x40(%rbp), %rax
1454c8bd2:     	testq	%rax, %rax
1454c8bd5:     	je	0x1454c8c49 <.text+0x54c7c49>
1454c8bd7:     	movq	0x48(%rbp), %rcx
1454c8bdb:     	movl	$0x82, %edx
1454c8be0:     	movzwl	0x36(%rax), %r9d
1454c8be5:     	movl	%r9d, %r10d
1454c8be8:     	addl	%r10d, %r10d
1454c8beb:     	movq	$-0x1, %r8
1454c8bf2:     	nopw	%cs:(%rax,%rax)
1454c8c00:     	testq	%r10, %r10
1454c8c03:     	je	0x1454c8c2e <.text+0x54c7c2e>
1454c8c05:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c8c0b:     	cmpl	%r11d, %edx
1454c8c0e:     	seta	%r11b
1454c8c12:     	sbbb	$0x0, %r11b
1454c8c16:     	incq	%r8
1454c8c19:     	addq	$-0x2, %r10
1454c8c1d:     	cmpb	$0x1, %r11b
1454c8c21:     	je	0x1454c8c00 <.text+0x54c7c00>
1454c8c23:     	movzbl	%r11b, %r9d
1454c8c27:     	testl	%r9d, %r9d
1454c8c2a:     	jne	0x1454c8c31 <.text+0x54c7c31>
1454c8c2c:     	jmp	0x1454c8c3e <.text+0x54c7c3e>
1454c8c2e:     	movq	%r9, %r8
1454c8c31:     	subq	$0x1, %rcx
1454c8c35:     	jb	0x1454c8c4b <.text+0x54c7c4b>
1454c8c37:     	movq	0x50(%rax,%r8,8), %rax
1454c8c3c:     	jmp	0x1454c8be0 <.text+0x54c7be0>
1454c8c3e:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
1454c8c47:     	jmp	0x1454c8c7e <.text+0x54c7c7e>
1454c8c49:     	xorl	%eax, %eax
1454c8c4b:     	movq	%r15, 0x60(%rbp)
1454c8c4f:     	movq	%rax, 0x68(%rbp)
1454c8c53:     	movq	$0x0, 0x70(%rbp)
1454c8c5b:     	movq	%r8, 0x78(%rbp)
1454c8c5f:     	movq	$0x82, 0x80(%rbp)
1454c8c6a:     	leaq	0x20(%rbp), %rcx
1454c8c6e:     	leaq	0x60(%rbp), %rdx
1454c8c72:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
1454c8c78:     	callq	0x145427a50 <.text+0x5426a50>
1454c8c7d:     	nop
1454c8c7e:     	movq	0x40(%rbp), %rax
1454c8c82:     	testq	%rax, %rax
1454c8c85:     	je	0x1454c8cf5 <.text+0x54c7cf5>
1454c8c87:     	movq	0x48(%rbp), %rcx
1454c8c8b:     	movl	$0x83, %edx
1454c8c90:     	movzwl	0x36(%rax), %r9d
1454c8c95:     	movl	%r9d, %r10d
1454c8c98:     	addl	%r10d, %r10d
1454c8c9b:     	movq	$-0x1, %r8
1454c8ca2:     	nopw	%cs:(%rax,%rax)
1454c8cb0:     	testq	%r10, %r10
1454c8cb3:     	je	0x1454c8cde <.text+0x54c7cde>
1454c8cb5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c8cbb:     	cmpl	%r11d, %edx
1454c8cbe:     	seta	%r11b
1454c8cc2:     	sbbb	$0x0, %r11b
1454c8cc6:     	incq	%r8
1454c8cc9:     	addq	$-0x2, %r10
1454c8ccd:     	cmpb	$0x1, %r11b
1454c8cd1:     	je	0x1454c8cb0 <.text+0x54c7cb0>
1454c8cd3:     	movzbl	%r11b, %r9d
1454c8cd7:     	testl	%r9d, %r9d
1454c8cda:     	jne	0x1454c8ce1 <.text+0x54c7ce1>
1454c8cdc:     	jmp	0x1454c8cee <.text+0x54c7cee>
1454c8cde:     	movq	%r9, %r8
1454c8ce1:     	subq	$0x1, %rcx
1454c8ce5:     	jb	0x1454c8cf7 <.text+0x54c7cf7>
1454c8ce7:     	movq	0x50(%rax,%r8,8), %rax
1454c8cec:     	jmp	0x1454c8c90 <.text+0x54c7c90>
1454c8cee:     	movl	%r14d, 0x8(%rax,%r8,4)
1454c8cf3:     	jmp	0x1454c8d27 <.text+0x54c7d27>
1454c8cf5:     	xorl	%eax, %eax
1454c8cf7:     	movq	%r15, 0x60(%rbp)
1454c8cfb:     	movq	%rax, 0x68(%rbp)
1454c8cff:     	movq	$0x0, 0x70(%rbp)
1454c8d07:     	movq	%r8, 0x78(%rbp)
1454c8d0b:     	movq	$0x83, 0x80(%rbp)
1454c8d16:     	leaq	0x20(%rbp), %rcx
1454c8d1a:     	leaq	0x60(%rbp), %rdx
1454c8d1e:     	movl	%r14d, %r8d
1454c8d21:     	callq	0x145427a50 <.text+0x5426a50>
1454c8d26:     	nop
1454c8d27:     	movq	0x40(%rbp), %rax
1454c8d2b:     	testq	%rax, %rax
1454c8d2e:     	je	0x1454c8d95 <.text+0x54c7d95>
1454c8d30:     	movq	0x48(%rbp), %rcx
1454c8d34:     	movl	$0x84, %edx
1454c8d39:     	movzwl	0x36(%rax), %r9d
1454c8d3e:     	movl	%r9d, %r10d
1454c8d41:     	addl	%r10d, %r10d
1454c8d44:     	movq	$-0x1, %r8
1454c8d4b:     	nopl	(%rax,%rax)
1454c8d50:     	testq	%r10, %r10
1454c8d53:     	je	0x1454c8d7e <.text+0x54c7d7e>
1454c8d55:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c8d5b:     	cmpl	%r11d, %edx
1454c8d5e:     	seta	%r11b
1454c8d62:     	sbbb	$0x0, %r11b
1454c8d66:     	incq	%r8
1454c8d69:     	addq	$-0x2, %r10
1454c8d6d:     	cmpb	$0x1, %r11b
1454c8d71:     	je	0x1454c8d50 <.text+0x54c7d50>
1454c8d73:     	movzbl	%r11b, %r9d
1454c8d77:     	testl	%r9d, %r9d
1454c8d7a:     	jne	0x1454c8d81 <.text+0x54c7d81>
1454c8d7c:     	jmp	0x1454c8d8e <.text+0x54c7d8e>
1454c8d7e:     	movq	%r9, %r8
1454c8d81:     	subq	$0x1, %rcx
1454c8d85:     	jb	0x1454c8d97 <.text+0x54c7d97>
1454c8d87:     	movq	0x50(%rax,%r8,8), %rax
1454c8d8c:     	jmp	0x1454c8d39 <.text+0x54c7d39>
1454c8d8e:     	movl	%r14d, 0x8(%rax,%r8,4)
1454c8d93:     	jmp	0x1454c8dc7 <.text+0x54c7dc7>
1454c8d95:     	xorl	%eax, %eax
1454c8d97:     	movq	%r15, 0x60(%rbp)
1454c8d9b:     	movq	%rax, 0x68(%rbp)
1454c8d9f:     	movq	$0x0, 0x70(%rbp)
1454c8da7:     	movq	%r8, 0x78(%rbp)
1454c8dab:     	movq	$0x84, 0x80(%rbp)
1454c8db6:     	leaq	0x20(%rbp), %rcx
1454c8dba:     	leaq	0x60(%rbp), %rdx
1454c8dbe:     	movl	%r14d, %r8d
1454c8dc1:     	callq	0x145427a50 <.text+0x5426a50>
1454c8dc6:     	nop
1454c8dc7:     	movl	$0x0, (%rbp)
1454c8dce:     	movq	$0x0, -0x18(%rbp)
1454c8dd6:     	movq	$0x1, -0x10(%rbp)
1454c8dde:     	movq	$0x0, -0x8(%rbp)
1454c8de6:     	movlps	%xmm6, 0x60(%rbp)
1454c8dea:     	movss	%xmm7, 0x68(%rbp)
1454c8def:     	movb	$0x1, 0x97(%rbp)
1454c8df6:     	movq	%r15, 0x38(%rsp)
1454c8dfb:     	leaq	0x14e217e(%rip), %rax   # 0x1469aaf80
1454c8e02:     	movq	%rax, 0x30(%rsp)
1454c8e07:     	leaq	0x60(%rbp), %rax
1454c8e0b:     	movq	%rax, 0x20(%rsp)
1454c8e10:     	movl	$0x0, 0x28(%rsp)
1454c8e18:     	leaq	-0x18(%rbp), %rcx
1454c8e1c:     	movq	%rbx, %rdx
1454c8e1f:     	movb	$0x3, %r8b
1454c8e22:     	xorl	%r9d, %r9d
1454c8e25:     	callq	0x1454ff300 <.text+0x54fe300>
1454c8e2a:     	nop
1454c8e2b:     	movups	-0x18(%rbp), %xmm0
1454c8e2f:     	movups	-0x8(%rbp), %xmm1
1454c8e33:     	movaps	%xmm1, 0x70(%rbp)
1454c8e37:     	movaps	%xmm0, 0x60(%rbp)
1454c8e3b:     	movb	$0x0, 0x97(%rbp)
1454c8e42:     	leaq	0x20(%rbp), %rcx
1454c8e46:     	leaq	0x60(%rbp), %rdx
1454c8e4a:     	callq	0x1454ffad0 <.text+0x54fead0>
1454c8e4f:     	nop
1454c8e50:     	movq	0x548(%rdi), %rsi
1454c8e57:     	cmpq	0x538(%rdi), %rsi
1454c8e5e:     	jne	0x1454c8e6d <.text+0x54c7e6d>
1454c8e60:     	leaq	0x538(%rdi), %rcx
1454c8e67:     	callq	0x1457580b0 <.text+0x57570b0>
1454c8e6c:     	nop
1454c8e6d:     	movq	0x540(%rdi), %rax
1454c8e74:     	movq	%rsi, %rcx
1454c8e77:     	shlq	$0x5, %rcx
1454c8e7b:     	movups	0x20(%rbp), %xmm0
1454c8e7f:     	movups	0x30(%rbp), %xmm1
1454c8e83:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c8e88:     	movups	%xmm0, (%rax,%rcx)
1454c8e8c:     	incq	%rsi
1454c8e8f:     	movq	%rsi, 0x548(%rdi)
1454c8e96:     	movss	0x8e4(%rdi), %xmm8
1454c8e9f:     	movq	0x530(%rdi), %rsi
1454c8ea6:     	cmpq	0x520(%rdi), %rsi
1454c8ead:     	jne	0x1454c8ec3 <.text+0x54c7ec3>
1454c8eaf:     	leaq	0x520(%rdi), %rcx
1454c8eb6:     	movb	$0x0, 0x97(%rbp)
1454c8ebd:     	callq	0x145757fd0 <.text+0x5756fd0>
1454c8ec2:     	nop
1454c8ec3:     	movq	0x528(%rdi), %rax
1454c8eca:     	leaq	(%rsi,%rsi,8), %rcx
1454c8ece:     	movq	$0x0, (%rax,%rcx,8)
1454c8ed6:     	movq	$0x8, 0x8(%rax,%rcx,8)
1454c8edf:     	movq	$0x0, 0x10(%rax,%rcx,8)
1454c8ee8:     	movl	$0x0, 0x18(%rax,%rcx,8)
1454c8ef0:     	movl	$0x0, 0x20(%rax,%rcx,8)
1454c8ef8:     	movl	%r12d, 0x24(%rax,%rcx,8)
1454c8efd:     	movq	%rbx, 0x28(%rax,%rcx,8)
1454c8f02:     	movl	$0x2329, 0x30(%rax,%rcx,8) # imm = 0x2329
1454c8f0a:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
1454c8f0f:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
1454c8f15:     	movss	%xmm8, 0x40(%rax,%rcx,8)
1454c8f1c:     	incq	%rsi
1454c8f1f:     	movq	%rsi, 0x530(%rdi)
1454c8f26:     	leaq	0x40(%rbp), %rcx
1454c8f2a:     	callq	0x1455127d0 <.text+0x55117d0>
1454c8f2f:     	jmp	0x1454c9210 <.text+0x54c8210>
1454c8f34:     	movl	%r15d, %r13d
1454c8f37:     	movl	$0x2330, 0x5c(%rbp)     # imm = 0x2330
1454c8f3e:     	movabsq	$0x3f80000000001767, %r15 # imm = 0x3F80000000001767
1454c8f48:     	jmp	0x1454c8fad <.text+0x54c7fad>
1454c8f4a:     	movl	%r15d, %r13d
1454c8f4d:     	movl	$0x232e, 0x5c(%rbp)     # imm = 0x232E
1454c8f54:     	movabsq	$0x3f8000000000172b, %r15 # imm = 0x3F8000000000172B
1454c8f5e:     	jmp	0x1454c8fad <.text+0x54c7fad>
1454c8f60:     	movl	%r15d, %r13d
1454c8f63:     	movl	$0x232c, 0x5c(%rbp)     # imm = 0x232C
1454c8f6a:     	movabsq	$0x3f19999a00000a36, %r15 # imm = 0x3F19999A00000A36
1454c8f74:     	jmp	0x1454c8fad <.text+0x54c7fad>
1454c8f76:     	movl	%r15d, %r13d
1454c8f79:     	movl	$0x232f, 0x5c(%rbp)     # imm = 0x232F
1454c8f80:     	movabsq	$0x3f8000000000176b, %r15 # imm = 0x3F8000000000176B
1454c8f8a:     	jmp	0x1454c8fad <.text+0x54c7fad>
1454c8f8c:     	movl	%r15d, %r13d
1454c8f8f:     	movl	$0x2331, 0x5c(%rbp)     # imm = 0x2331
1454c8f96:     	movabsq	$0x3fa6666600000156, %r15 # imm = 0x3FA6666600000156
1454c8fa0:     	jmp	0x1454c8fad <.text+0x54c7fad>
1454c8fa2:     	movq	%rdi, %rcx
1454c8fa5:     	movq	%r8, %rdx
1454c8fa8:     	callq	0x1454d1060 <.text+0x54d0060>
1454c8fad:     	movq	0x878(%rdi), %rsi
1454c8fb4:     	leaq	0x10(%rsi), %rcx
1454c8fb8:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454c8fbd:     	movaps	%xmm6, %xmm1
1454c8fc0:     	movaps	%xmm8, %xmm2
1454c8fc4:     	callq	0x1454627f0 <.text+0x54617f0>
1454c8fc9:     	testb	$0x1, %al
1454c8fcb:     	je	0x1454c8fd2 <.text+0x54c7fd2>
1454c8fcd:     	movaps	%xmm0, %xmm7
1454c8fd0:     	jmp	0x1454c9002 <.text+0x54c8002>
1454c8fd2:     	cmpq	$-0x1, 0x68(%rsi)
1454c8fd7:     	je	0x1454c8ffa <.text+0x54c7ffa>
1454c8fd9:     	leaq	0x68(%rsi), %rdx
1454c8fdd:     	leaq	0x60(%rbp), %rcx
1454c8fe1:     	movaps	%xmm6, %xmm2
1454c8fe4:     	movaps	%xmm8, %xmm3
1454c8fe8:     	callq	0x145467bf0 <.text+0x5466bf0>
1454c8fed:     	cmpl	$0x1, 0x60(%rbp)
1454c8ff1:     	jne	0x1454c8ffa <.text+0x54c7ffa>
1454c8ff3:     	movss	0x6c(%rbp), %xmm7
1454c8ff8:     	jmp	0x1454c9002 <.text+0x54c8002>
1454c8ffa:     	movss	0x90(%rsi), %xmm7
1454c9002:     	movl	0x5c(%rbp), %eax
1454c9005:     	movl	%eax, 0x20(%rbp)
1454c9008:     	movq	%r15, 0x24(%rbp)
1454c900c:     	movlps	%xmm6, 0x60(%rbp)
1454c9010:     	movss	%xmm7, 0x68(%rbp)
1454c9015:     	movl	$0x0, 0x20(%rsp)
1454c901d:     	leaq	0x20(%rbp), %rdx
1454c9021:     	leaq	0x60(%rbp), %r8
1454c9025:     	movq	%rdi, %rcx
1454c9028:     	movl	%r14d, %r9d
1454c902b:     	callq	0x1454d2850 <.text+0x54d1850>
1454c9030:     	movq	%rax, %r14
1454c9033:     	movq	$0x0, 0x20(%rbp)
1454c903b:     	movq	$0x8, 0x28(%rbp)
1454c9043:     	movq	$0x0, 0x30(%rbp)
1454c904b:     	cmpl	$0x6, %r13d
1454c904f:     	jne	0x1454c9145 <.text+0x54c8145>
1454c9055:     	movq	%r14, -0x38(%rbp)
1454c9059:     	movl	%r13d, 0xc(%rbp)
1454c905d:     	movl	%r12d, 0x8(%rbp)
1454c9061:     	movabsq	$0xcc700002332, %rax    # imm = 0xCC700002332
1454c906b:     	movq	%rax, -0x30(%rbp)
1454c906f:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
1454c9076:     	movabsq	$0x8b800002333, %rax    # imm = 0x8B800002333
1454c9080:     	movq	%rax, -0x24(%rbp)
1454c9084:     	movl	$0x3fcccccd, -0x1c(%rbp) # imm = 0x3FCCCCCD
1454c908b:     	movq	$0x2, 0x68(%rbp)
1454c9093:     	leaq	0x70(%rbp), %rbx
1454c9097:     	movq	-0x30(%rbp), %rax
1454c909b:     	movq	%rax, 0x70(%rbp)
1454c909f:     	movl	-0x28(%rbp), %eax
1454c90a2:     	movl	%eax, 0x78(%rbp)
1454c90a5:     	movl	-0x24(%rbp), %eax
1454c90a8:     	movl	%eax, 0x7c(%rbp)
1454c90ab:     	movq	-0x20(%rbp), %rax
1454c90af:     	movq	%rax, 0x80(%rbp)
1454c90b6:     	xorl	%esi, %esi
1454c90b8:     	leaq	-0x18(%rbp), %r15
1454c90bc:     	leaq	0x20(%rbp), %r12
1454c90c0:     	xorl	%eax, %eax
1454c90c2:     	jmp	0x1454c90e2 <.text+0x54c80e2>
1454c90c4:     	nopw	%cs:(%rax,%rax)
1454c90d0:     	movq	0x28(%rbp), %rax
1454c90d4:     	movq	%r13, (%rax,%rsi,8)
1454c90d8:     	incq	%rsi
1454c90db:     	movq	%rsi, 0x30(%rbp)
1454c90df:     	movq	%r14, %rax
1454c90e2:     	cmpq	$0x2, %rax
1454c90e6:     	je	0x1454c9173 <.text+0x54c8173>
1454c90ec:     	leaq	0x1(%rax), %r14
1454c90f0:     	movq	%r14, 0x60(%rbp)
1454c90f4:     	leaq	(%rax,%rax,2), %rax
1454c90f8:     	leaq	(%rbx,%rax,4), %rdx
1454c90fc:     	movlps	%xmm6, -0x18(%rbp)
1454c9100:     	movss	%xmm7, -0x10(%rbp)
1454c9105:     	movb	$0x1, 0x96(%rbp)
1454c910c:     	movl	$0x10, 0x20(%rsp)
1454c9114:     	movq	%rdi, %rcx
1454c9117:     	movq	%r15, %r8
1454c911a:     	movl	$0x5, %r9d
1454c9120:     	callq	0x1454d2850 <.text+0x54d1850>
1454c9125:     	nop
1454c9126:     	movq	%rax, %r13
1454c9129:     	movq	0x30(%rbp), %rsi
1454c912d:     	cmpq	0x20(%rbp), %rsi
1454c9131:     	jne	0x1454c90d0 <.text+0x54c80d0>
1454c9133:     	movb	$0x1, 0x96(%rbp)
1454c913a:     	movq	%r12, %rcx
1454c913d:     	callq	0x145757ef0 <.text+0x5756ef0>
1454c9142:     	nop
1454c9143:     	jmp	0x1454c90d0 <.text+0x54c80d0>
1454c9145:     	movl	$0x8, %eax
1454c914a:     	movq	%rax, 0x10(%rbp)
1454c914e:     	xorl	%esi, %esi
1454c9150:     	movq	$0x0, 0x18(%rbp)
1454c9158:     	movss	0x8e4(%rdi), %xmm8
1454c9161:     	movq	0x530(%rdi), %rbx
1454c9168:     	cmpq	0x520(%rdi), %rbx
1454c916f:     	je	0x1454c91a8 <.text+0x54c81a8>
1454c9171:     	jmp	0x1454c91b5 <.text+0x54c81b5>
1454c9173:     	movq	0x20(%rbp), %rax
1454c9177:     	movq	%rax, 0x18(%rbp)
1454c917b:     	movq	0x28(%rbp), %rax
1454c917f:     	movq	%rax, 0x10(%rbp)
1454c9183:     	movl	0x8(%rbp), %r12d
1454c9187:     	movl	0xc(%rbp), %r13d
1454c918b:     	movq	-0x38(%rbp), %r14
1454c918f:     	movss	0x8e4(%rdi), %xmm8
1454c9198:     	movq	0x530(%rdi), %rbx
1454c919f:     	cmpq	0x520(%rdi), %rbx
1454c91a6:     	jne	0x1454c91b5 <.text+0x54c81b5>
1454c91a8:     	leaq	0x520(%rdi), %rcx
1454c91af:     	callq	0x145757fd0 <.text+0x5756fd0>
1454c91b4:     	nop
1454c91b5:     	movq	0x528(%rdi), %rax
1454c91bc:     	leaq	(%rbx,%rbx,8), %rcx
1454c91c0:     	movq	0x18(%rbp), %rdx
1454c91c4:     	movq	%rdx, (%rax,%rcx,8)
1454c91c8:     	movq	0x10(%rbp), %rdx
1454c91cc:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454c91d1:     	movq	%rsi, 0x10(%rax,%rcx,8)
1454c91d6:     	movl	$0x0, 0x18(%rax,%rcx,8)
1454c91de:     	movl	%r13d, 0x20(%rax,%rcx,8)
1454c91e3:     	movl	%r12d, 0x24(%rax,%rcx,8)
1454c91e8:     	movq	%r14, 0x28(%rax,%rcx,8)
1454c91ed:     	movl	0x5c(%rbp), %edx
1454c91f0:     	movl	%edx, 0x30(%rax,%rcx,8)
1454c91f4:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
1454c91f9:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
1454c91ff:     	movss	%xmm8, 0x40(%rax,%rcx,8)
1454c9206:     	incq	%rbx
1454c9209:     	movq	%rbx, 0x530(%rdi)
1454c9210:     	movaps	0xa0(%rbp), %xmm6
1454c9217:     	movaps	0xb0(%rbp), %xmm7
1454c921e:     	movaps	0xc0(%rbp), %xmm8
1454c9226:     	movaps	0xd0(%rbp), %xmm9
1454c922e:     	addq	$0x168, %rsp            # imm = 0x168
1454c9235:     	popq	%rbx
1454c9236:     	popq	%rdi
1454c9237:     	popq	%rsi
1454c9238:     	popq	%r12
1454c923a:     	popq	%r13
1454c923c:     	popq	%r14
1454c923e:     	popq	%r15
1454c9240:     	popq	%rbp
1454c9241:     	retq
1454c9242:     	cmpl	$0x0, 0x20(%r8)
1454c9247:     	jne	0x1454c9210 <.text+0x54c8210>
1454c9249:     	addl	%r12d, 0x24(%r8)
1454c924d:     	jmp	0x1454c9210 <.text+0x54c8210>
