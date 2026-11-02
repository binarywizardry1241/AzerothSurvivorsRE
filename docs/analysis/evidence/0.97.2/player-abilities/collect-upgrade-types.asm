
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455292b0:     	pushq	%rbp
1455292b1:     	pushq	%r15
1455292b3:     	pushq	%r14
1455292b5:     	pushq	%r13
1455292b7:     	pushq	%r12
1455292b9:     	pushq	%rsi
1455292ba:     	pushq	%rdi
1455292bb:     	pushq	%rbx
1455292bc:     	subq	$0xc8, %rsp
1455292c3:     	leaq	0x80(%rsp), %rbp
1455292cb:     	movq	$-0x2, 0x40(%rbp)
1455292d3:     	movq	%rdx, %r14
1455292d6:     	movq	%rcx, %rsi
1455292d9:     	leaq	0x40(%rdx), %rax
1455292dd:     	leaq	0x38(%rdx), %rcx
1455292e1:     	addq	$0x28, %rdx
1455292e5:     	leaq	0x18(%r14), %r8
1455292e9:     	leaq	0x10(%r14), %r9
1455292ed:     	movq	%r9, -0x30(%rbp)
1455292f1:     	movq	%r8, -0x28(%rbp)
1455292f5:     	movq	%rdx, -0x20(%rbp)
1455292f9:     	movq	%rcx, -0x18(%rbp)
1455292fd:     	movq	%rax, -0x10(%rbp)
145529301:     	leaq	-0x30(%rbp), %rdx
145529305:     	movq	%r14, %rcx
145529308:     	callq	0x145472190 <.text+0x5471190>
14552930d:     	cmpb	$-0x1, %al
14552930f:     	je	0x145529421 <.text+0x5528421>
145529315:     	movl	%eax, %r15d
145529318:     	movq	%rsi, 0x20(%rbp)
14552931c:     	callq	0x140002200 <.text+0x1200>
145529321:     	movl	$0x1, %edi
145529326:     	movl	$0x8, %ecx
14552932b:     	movl	$0x1, %edx
145529330:     	callq	0x1400021c0 <.text+0x11c0>
145529335:     	testq	%rax, %rax
145529338:     	je	0x14552944f <.text+0x552844f>
14552933e:     	movq	%rax, %rbx
145529341:     	movb	%r15b, (%rax)
145529344:     	movq	$0x8, 0x28(%rbp)
14552934c:     	movq	%rax, 0x30(%rbp)
145529350:     	movq	$0x1, 0x38(%rbp)
145529358:     	movups	0x40(%r14), %xmm0
14552935d:     	movaps	%xmm0, 0x10(%rbp)
145529361:     	movups	(%r14), %xmm0
145529365:     	movups	0x10(%r14), %xmm1
14552936a:     	movups	0x20(%r14), %xmm2
14552936f:     	movups	0x30(%r14), %xmm3
145529374:     	movaps	%xmm3, (%rbp)
145529378:     	movaps	%xmm2, -0x10(%rbp)
14552937c:     	movaps	%xmm1, -0x20(%rbp)
145529380:     	movaps	%xmm0, -0x30(%rbp)
145529384:     	leaq	-0x8(%rbp), %r12
145529388:     	leaq	-0x18(%rbp), %rsi
14552938c:     	leaq	-0x30(%rbp), %r14
145529390:     	leaq	-0x58(%rbp), %r15
145529394:     	jmp	0x1455293ab <.text+0x55283ab>
145529396:     	nopw	%cs:(%rax,%rax)
1455293a0:     	movb	%r13b, (%rbx,%rdi)
1455293a4:     	incq	%rdi
1455293a7:     	movq	%rdi, 0x38(%rbp)
1455293ab:     	leaq	-0x20(%rbp), %rax
1455293af:     	movq	%rax, -0x58(%rbp)
1455293b3:     	movq	%rsi, -0x50(%rbp)
1455293b7:     	movq	%r12, -0x48(%rbp)
1455293bb:     	leaq	0x8(%rbp), %rax
1455293bf:     	movq	%rax, -0x40(%rbp)
1455293c3:     	leaq	0x10(%rbp), %rax
1455293c7:     	movq	%rax, -0x38(%rbp)
1455293cb:     	movq	%r14, %rcx
1455293ce:     	movq	%r15, %rdx
1455293d1:     	callq	0x145472190 <.text+0x5471190>
1455293d6:     	nop
1455293d7:     	movl	%eax, %r13d
1455293da:     	cmpb	$-0x1, %al
1455293dc:     	je	0x14552940c <.text+0x552840c>
1455293de:     	cmpq	0x28(%rbp), %rdi
1455293e2:     	jne	0x1455293a0 <.text+0x55283a0>
1455293e4:     	movq	$0x1, 0x20(%rsp)
1455293ed:     	movl	$0x1, %r8d
1455293f3:     	movl	$0x1, %r9d
1455293f9:     	leaq	0x28(%rbp), %rcx
1455293fd:     	movq	%rdi, %rdx
145529400:     	callq	0x145757d40 <.text+0x5756d40>
145529405:     	nop
145529406:     	movq	0x30(%rbp), %rbx
14552940a:     	jmp	0x1455293a0 <.text+0x55283a0>
14552940c:     	movq	0x38(%rbp), %rax
145529410:     	movq	0x20(%rbp), %rsi
145529414:     	movq	%rax, 0x10(%rsi)
145529418:     	movups	0x28(%rbp), %xmm0
14552941c:     	movups	%xmm0, (%rsi)
14552941f:     	jmp	0x145529438 <.text+0x5528438>
145529421:     	movq	$0x0, (%rsi)
145529428:     	movq	$0x1, 0x8(%rsi)
145529430:     	movq	$0x0, 0x10(%rsi)
145529438:     	movq	%rsi, %rax
14552943b:     	addq	$0xc8, %rsp
145529442:     	popq	%rbx
145529443:     	popq	%rdi
145529444:     	popq	%rsi
145529445:     	popq	%r12
145529447:     	popq	%r13
145529449:     	popq	%r14
14552944b:     	popq	%r15
14552944d:     	popq	%rbp
14552944e:     	retq
14552944f:     	movl	$0x1, %ecx
145529454:     	movl	$0x8, %edx
145529459:     	callq	0x1458e721b <.text+0x58e621b>
14552945e:     	ud2
