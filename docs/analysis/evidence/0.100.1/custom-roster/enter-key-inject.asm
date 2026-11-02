
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140038240:     	pushq	%r15
140038242:     	pushq	%r14
140038244:     	pushq	%r13
140038246:     	pushq	%r12
140038248:     	pushq	%rsi
140038249:     	pushq	%rdi
14003824a:     	pushq	%rbp
14003824b:     	pushq	%rbx
14003824c:     	subq	$0x38, %rsp
140038250:     	movq	%rdx, %rsi
140038253:     	movl	(%rdx), %ebx
140038255:     	testq	%rbx, %rbx
140038258:     	je	0x140038261 <.text+0x37261>
14003825a:     	xorl	%edx, %edx
14003825c:     	movq	%rbx, %rax
14003825f:     	jmp	0x14003828a <.text+0x3728a>
140038261:     	movzwl	0x4(%rsi), %edx
140038265:     	movq	%rdx, %rax
140038268:     	shlq	$0x20, %rax
14003826c:     	leaq	0x58dade9(%rip), %r8    # 0x14591305c
140038273:     	movslq	(%r8,%rdx,4), %r9
140038277:     	addq	%r8, %r9
14003827a:     	jmpq	*%r9
14003827d:     	movzwl	0x6(%rsi), %edx
140038281:     	jmp	0x140038286 <.text+0x37286>
140038283:     	movl	0x8(%rsi), %edx
140038286:     	shlq	$0x20, %rdx
14003828a:     	movabsq	$-0x623f01a31097210f, %r8 # imm = 0x9DC0FE5CEF68DEF1
140038294:     	xorq	%rax, %r8
140038297:     	movabsq	$-0x3f53d6483683af23, %rax # imm = 0xC0AC29B7C97C50DD
1400382a1:     	xorq	%rdx, %rax
1400382a4:     	mulq	%r8
1400382a7:     	xorq	%rax, %rdx
1400382aa:     	cmpq	$0x0, 0x10(%rcx)
1400382af:     	je	0x1400384d3 <.text+0x374d3>
1400382b5:     	movq	%rdx, %r9
1400382b8:     	shrq	$0x39, %r9
1400382bc:     	movq	(%rcx), %r8
1400382bf:     	movq	0x8(%rcx), %r10
1400382c3:     	movd	%r9d, %xmm0
1400382c8:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1400382cc:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1400382d1:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1400382d6:     	testl	%ebx, %ebx
1400382d8:     	je	0x140038374 <.text+0x37374>
1400382de:     	xorl	%r14d, %r14d
1400382e1:     	pcmpeqd	%xmm1, %xmm1
1400382e5:     	xorl	%edi, %edi
1400382e7:     	andq	%r10, %rdx
1400382ea:     	movdqu	(%r8,%rdx), %xmm2
1400382f0:     	movdqa	%xmm2, %xmm3
1400382f4:     	pcmpeqb	%xmm0, %xmm3
1400382f8:     	pmovmskb	%xmm3, %r15d
1400382fd:     	testl	%r15d, %r15d
140038300:     	je	0x140038330 <.text+0x37330>
140038302:     	tzcntl	%r15d, %eax
140038307:     	addq	%rdx, %rax
14003830a:     	andq	%r10, %rax
14003830d:     	negq	%rax
140038310:     	leaq	(%rax,%rax,2), %r12
140038314:     	movb	$0x1, %al
140038316:     	cmpl	-0xc(%r8,%r12,4), %ebx
14003831b:     	je	0x1400384c2 <.text+0x374c2>
140038321:     	leal	-0x1(%r15), %eax
140038325:     	andw	%r15w, %ax
140038329:     	movl	%eax, %r15d
14003832c:     	jne	0x140038302 <.text+0x37302>
14003832e:     	nop
140038330:     	cmpq	$0x1, %r14
140038334:     	je	0x140038349 <.text+0x37349>
140038336:     	pmovmskb	%xmm2, %eax
14003833a:     	testl	%eax, %eax
14003833c:     	je	0x140038361 <.text+0x37361>
14003833e:     	tzcntl	%eax, %r11d
140038343:     	addq	%rdx, %r11
140038346:     	andq	%r10, %r11
140038349:     	pcmpeqb	%xmm1, %xmm2
14003834d:     	pmovmskb	%xmm2, %eax
140038351:     	testl	%eax, %eax
140038353:     	jne	0x140038470 <.text+0x37470>
140038359:     	movl	$0x1, %r14d
14003835f:     	jmp	0x140038364 <.text+0x37364>
140038361:     	xorl	%r14d, %r14d
140038364:     	addq	%rdi, %rdx
140038367:     	addq	$0x10, %rdx
14003836b:     	addq	$0x10, %rdi
14003836f:     	jmp	0x1400382e7 <.text+0x372e7>
140038374:     	movzwl	0x4(%rsi), %edi
140038378:     	movzwl	0x6(%rsi), %ebx
14003837c:     	movzwl	%di, %eax
14003837f:     	movl	0x8(%rsi), %ebp
140038382:     	xorl	%r15d, %r15d
140038385:     	pcmpeqd	%xmm1, %xmm1
140038389:     	movl	%eax, %eax
14003838b:     	movq	%rax, 0x30(%rsp)
140038390:     	xorl	%r14d, %r14d
140038393:     	leaq	0x58dacd6(%rip), %r13   # 0x145913070
14003839a:     	andq	%r10, %rdx
14003839d:     	movdqu	(%r8,%rdx), %xmm2
1400383a3:     	movdqa	%xmm2, %xmm3
1400383a7:     	pcmpeqb	%xmm0, %xmm3
1400383ab:     	pmovmskb	%xmm3, %r12d
1400383b0:     	testl	%r12d, %r12d
1400383b3:     	je	0x140038430 <.text+0x37430>
1400383b5:     	movq	%r15, 0x20(%rsp)
1400383ba:     	movq	%r14, 0x28(%rsp)
1400383bf:     	movl	%ebp, %r14d
1400383c2:     	tzcntl	%r12d, %eax
1400383c7:     	addq	%rdx, %rax
1400383ca:     	andq	%r10, %rax
1400383cd:     	negq	%rax
1400383d0:     	leaq	(%rax,%rax,2), %rax
1400383d4:     	cmpl	$0x0, -0xc(%r8,%rax,4)
1400383da:     	jne	0x140038415 <.text+0x37415>
1400383dc:     	leaq	(%r8,%rax,4), %r15
1400383e0:     	cmpw	-0x8(%r15), %di
1400383e5:     	jne	0x140038415 <.text+0x37415>
1400383e7:     	movl	%ebx, %ebp
1400383e9:     	movb	$0x1, %al
1400383eb:     	movq	0x30(%rsp), %rbx
1400383f0:     	movslq	(%r13,%rbx,4), %rbx
1400383f5:     	addq	%r13, %rbx
1400383f8:     	jmpq	*%rbx
1400383fa:     	cmpl	-0x4(%r15), %r14d
1400383fe:     	movl	%ebp, %ebx
140038400:     	je	0x1400384c2 <.text+0x374c2>
140038406:     	jmp	0x140038415 <.text+0x37415>
140038408:     	movl	%ebp, %ebx
14003840a:     	cmpw	-0x6(%r15), %bp
14003840f:     	je	0x1400384c2 <.text+0x374c2>
140038415:     	leal	-0x1(%r12), %eax
14003841a:     	andw	%r12w, %ax
14003841e:     	movl	%eax, %r12d
140038421:     	movl	%r14d, %ebp
140038424:     	movq	0x28(%rsp), %r14
140038429:     	movq	0x20(%rsp), %r15
14003842e:     	jne	0x1400383b5 <.text+0x373b5>
140038430:     	cmpq	$0x1, %r15
140038434:     	je	0x140038449 <.text+0x37449>
140038436:     	pmovmskb	%xmm2, %eax
14003843a:     	testl	%eax, %eax
14003843c:     	je	0x14003845d <.text+0x3745d>
14003843e:     	tzcntl	%eax, %r11d
140038443:     	addq	%rdx, %r11
140038446:     	andq	%r10, %r11
140038449:     	pcmpeqb	%xmm1, %xmm2
14003844d:     	pmovmskb	%xmm2, %eax
140038451:     	testl	%eax, %eax
140038453:     	jne	0x140038470 <.text+0x37470>
140038455:     	movl	$0x1, %r15d
14003845b:     	jmp	0x140038460 <.text+0x37460>
14003845d:     	xorl	%r15d, %r15d
140038460:     	addq	%r14, %rdx
140038463:     	addq	$0x10, %rdx
140038467:     	addq	$0x10, %r14
14003846b:     	jmp	0x14003839a <.text+0x3739a>
140038470:     	movzbl	(%r8,%r11), %eax
140038475:     	testb	%al, %al
140038477:     	jns	0x1400384f5 <.text+0x374f5>
140038479:     	andb	$0x1, %al
14003847b:     	leaq	-0x10(%r11), %rdx
14003847f:     	andq	%r10, %rdx
140038482:     	movb	%r9b, (%r8,%r11)
140038486:     	movb	%r9b, 0x10(%r8,%rdx)
14003848b:     	movdqu	0x10(%rcx), %xmm0
140038490:     	movzbl	%al, %eax
140038493:     	movd	%eax, %xmm1
140038497:     	shufpd	$0x2, 0x58cecf0(%rip), %xmm1 # xmm1 = xmm1[0],mem[1]
                                                # 0x145907190
1400384a0:     	psubq	%xmm1, %xmm0
1400384a4:     	movdqu	%xmm0, 0x10(%rcx)
1400384a9:     	negq	%r11
1400384ac:     	leaq	(%r11,%r11,2), %rax
1400384b0:     	movl	0x8(%rsi), %ecx
1400384b3:     	movl	%ecx, -0x4(%r8,%rax,4)
1400384b8:     	movq	(%rsi), %rcx
1400384bb:     	movq	%rcx, -0xc(%r8,%rax,4)
1400384c0:     	xorl	%eax, %eax
1400384c2:     	addq	$0x38, %rsp
1400384c6:     	popq	%rbx
1400384c7:     	popq	%rbp
1400384c8:     	popq	%rdi
1400384c9:     	popq	%rsi
1400384ca:     	popq	%r12
1400384cc:     	popq	%r13
1400384ce:     	popq	%r14
1400384d0:     	popq	%r15
1400384d2:     	retq
1400384d3:     	leaq	0x20(%rcx), %r8
1400384d7:     	movq	%rdx, %r14
1400384da:     	movl	$0x1, %edx
1400384df:     	movq	%rcx, %rdi
1400384e2:     	movb	$0x1, %r9b
1400384e5:     	callq	0x145893010 <.text+0x5892010>
1400384ea:     	movq	%r14, %rdx
1400384ed:     	movq	%rdi, %rcx
1400384f0:     	jmp	0x1400382b5 <.text+0x372b5>
1400384f5:     	movdqa	(%r8), %xmm0
1400384fa:     	pmovmskb	%xmm0, %eax
1400384fe:     	tzcntl	%eax, %r11d
140038503:     	movzbl	(%r8,%r11), %eax
140038508:     	jmp	0x140038479 <.text+0x37479>
