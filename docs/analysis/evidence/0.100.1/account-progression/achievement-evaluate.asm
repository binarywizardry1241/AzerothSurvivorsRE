
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552e100:     	pushq	%r15
14552e102:     	pushq	%r14
14552e104:     	pushq	%rsi
14552e105:     	pushq	%rdi
14552e106:     	pushq	%rbp
14552e107:     	pushq	%rbx
14552e108:     	subq	$0xc8, %rsp
14552e10f:     	movq	%rdx, %rsi
14552e112:     	movq	%rcx, %rax
14552e115:     	movzbl	0x48(%r8), %ecx
14552e11a:     	leaq	0x1807cab(%rip), %rdx   # 0x146d35dcc
14552e121:     	movslq	(%rdx,%rcx,4), %rcx
14552e125:     	addq	%rdx, %rcx
14552e128:     	jmpq	*%rcx
14552e12a:     	movq	0xe8(%rsi), %rcx
14552e131:     	testq	%rcx, %rcx
14552e134:     	je	0x14552f5ce <.text+0x552e5ce>
14552e13a:     	movq	0x50(%r8), %r8
14552e13e:     	movq	0xe0(%rsi), %r9
14552e145:     	xorl	%r10d, %r10d
14552e148:     	cmpq	$0x1, %rcx
14552e14c:     	je	0x14552e1a3 <.text+0x552d1a3>
14552e14e:     	movq	%rcx, %rdx
14552e151:     	nopw	%cs:(%rax,%rax)
14552e160:     	movq	%r10, %r11
14552e163:     	movq	%rdx, %rsi
14552e166:     	shrq	%rsi
14552e169:     	addq	%rsi, %r10
14552e16c:     	movq	%r10, %rdi
14552e16f:     	shlq	$0x4, %rdi
14552e173:     	xorl	%ebx, %ebx
14552e175:     	cmpq	%r8, 0x8(%r9,%rdi)
14552e17a:     	seta	%bl
14552e17d:     	movzbl	(%r9,%rdi), %edi
14552e182:     	xorl	%ebp, %ebp
14552e184:     	cmpb	$0x2, %dil
14552e188:     	setae	%bpl
14552e18c:     	cmpb	$0x1, %dil
14552e190:     	cmovel	%ebx, %ebp
14552e193:     	testb	%bpl, %bpl
14552e196:     	cmovneq	%r11, %r10
14552e19a:     	subq	%rsi, %rdx
14552e19d:     	cmpq	$0x1, %rdx
14552e1a1:     	ja	0x14552e160 <.text+0x552d160>
14552e1a3:     	shlq	$0x4, %r10
14552e1a7:     	cmpb	$0x1, (%r9,%r10)
14552e1ac:     	movl	$0x1, %edx
14552e1b1:     	jne	0x14552e1be <.text+0x552d1be>
14552e1b3:     	cmpq	%r8, 0x8(%r9,%r10)
14552e1b8:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e1be:     	xorl	%r10d, %r10d
14552e1c1:     	cmpq	$0x1, %rcx
14552e1c5:     	je	0x14552e214 <.text+0x552d214>
14552e1c7:     	movq	%rcx, %r11
14552e1ca:     	nopw	(%rax,%rax)
14552e1d0:     	movq	%r10, %rsi
14552e1d3:     	movq	%r11, %rdi
14552e1d6:     	shrq	%rdi
14552e1d9:     	addq	%rdi, %r10
14552e1dc:     	movq	%r10, %rbx
14552e1df:     	shlq	$0x4, %rbx
14552e1e3:     	xorl	%ebp, %ebp
14552e1e5:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e1ea:     	seta	%bpl
14552e1ee:     	movzbl	(%r9,%rbx), %ebx
14552e1f3:     	xorl	%r14d, %r14d
14552e1f6:     	cmpb	$0x3, %bl
14552e1f9:     	setae	%r14b
14552e1fd:     	cmpb	$0x2, %bl
14552e200:     	cmovel	%ebp, %r14d
14552e204:     	testb	%r14b, %r14b
14552e207:     	cmovneq	%rsi, %r10
14552e20b:     	subq	%rdi, %r11
14552e20e:     	cmpq	$0x1, %r11
14552e212:     	ja	0x14552e1d0 <.text+0x552d1d0>
14552e214:     	shlq	$0x4, %r10
14552e218:     	cmpb	$0x2, (%r9,%r10)
14552e21d:     	jne	0x14552e22a <.text+0x552d22a>
14552e21f:     	cmpq	%r8, 0x8(%r9,%r10)
14552e224:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e22a:     	xorl	%r10d, %r10d
14552e22d:     	cmpq	$0x1, %rcx
14552e231:     	je	0x14552e284 <.text+0x552d284>
14552e233:     	movq	%rcx, %r11
14552e236:     	nopw	%cs:(%rax,%rax)
14552e240:     	movq	%r10, %rsi
14552e243:     	movq	%r11, %rdi
14552e246:     	shrq	%rdi
14552e249:     	addq	%rdi, %r10
14552e24c:     	movq	%r10, %rbx
14552e24f:     	shlq	$0x4, %rbx
14552e253:     	xorl	%ebp, %ebp
14552e255:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e25a:     	seta	%bpl
14552e25e:     	movzbl	(%r9,%rbx), %ebx
14552e263:     	xorl	%r14d, %r14d
14552e266:     	cmpb	$0x4, %bl
14552e269:     	setae	%r14b
14552e26d:     	cmpb	$0x3, %bl
14552e270:     	cmovel	%ebp, %r14d
14552e274:     	testb	%r14b, %r14b
14552e277:     	cmovneq	%rsi, %r10
14552e27b:     	subq	%rdi, %r11
14552e27e:     	cmpq	$0x1, %r11
14552e282:     	ja	0x14552e240 <.text+0x552d240>
14552e284:     	shlq	$0x4, %r10
14552e288:     	cmpb	$0x3, (%r9,%r10)
14552e28d:     	jne	0x14552e29a <.text+0x552d29a>
14552e28f:     	cmpq	%r8, 0x8(%r9,%r10)
14552e294:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e29a:     	xorl	%r10d, %r10d
14552e29d:     	cmpq	$0x1, %rcx
14552e2a1:     	je	0x14552e2ea <.text+0x552d2ea>
14552e2a3:     	movq	%rcx, %r11
14552e2a6:     	movq	%r10, %rsi
14552e2a9:     	movq	%r11, %rdi
14552e2ac:     	shrq	%rdi
14552e2af:     	addq	%rdi, %r10
14552e2b2:     	movq	%r10, %rbx
14552e2b5:     	shlq	$0x4, %rbx
14552e2b9:     	xorl	%ebp, %ebp
14552e2bb:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e2c0:     	seta	%bpl
14552e2c4:     	movzbl	(%r9,%rbx), %ebx
14552e2c9:     	xorl	%r14d, %r14d
14552e2cc:     	cmpb	$0x5, %bl
14552e2cf:     	setae	%r14b
14552e2d3:     	cmpb	$0x4, %bl
14552e2d6:     	cmovel	%ebp, %r14d
14552e2da:     	testb	%r14b, %r14b
14552e2dd:     	cmovneq	%rsi, %r10
14552e2e1:     	subq	%rdi, %r11
14552e2e4:     	cmpq	$0x1, %r11
14552e2e8:     	ja	0x14552e2a6 <.text+0x552d2a6>
14552e2ea:     	shlq	$0x4, %r10
14552e2ee:     	cmpb	$0x4, (%r9,%r10)
14552e2f3:     	jne	0x14552e300 <.text+0x552d300>
14552e2f5:     	cmpq	%r8, 0x8(%r9,%r10)
14552e2fa:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e300:     	xorl	%r10d, %r10d
14552e303:     	cmpq	$0x1, %rcx
14552e307:     	je	0x14552e350 <.text+0x552d350>
14552e309:     	movq	%rcx, %r11
14552e30c:     	movq	%r10, %rsi
14552e30f:     	movq	%r11, %rdi
14552e312:     	shrq	%rdi
14552e315:     	addq	%rdi, %r10
14552e318:     	movq	%r10, %rbx
14552e31b:     	shlq	$0x4, %rbx
14552e31f:     	xorl	%ebp, %ebp
14552e321:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e326:     	seta	%bpl
14552e32a:     	movzbl	(%r9,%rbx), %ebx
14552e32f:     	xorl	%r14d, %r14d
14552e332:     	cmpb	$0x6, %bl
14552e335:     	setae	%r14b
14552e339:     	cmpb	$0x5, %bl
14552e33c:     	cmovel	%ebp, %r14d
14552e340:     	testb	%r14b, %r14b
14552e343:     	cmovneq	%rsi, %r10
14552e347:     	subq	%rdi, %r11
14552e34a:     	cmpq	$0x1, %r11
14552e34e:     	ja	0x14552e30c <.text+0x552d30c>
14552e350:     	shlq	$0x4, %r10
14552e354:     	cmpb	$0x5, (%r9,%r10)
14552e359:     	jne	0x14552e366 <.text+0x552d366>
14552e35b:     	cmpq	%r8, 0x8(%r9,%r10)
14552e360:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e366:     	xorl	%r10d, %r10d
14552e369:     	cmpq	$0x1, %rcx
14552e36d:     	je	0x14552e3b6 <.text+0x552d3b6>
14552e36f:     	movq	%rcx, %r11
14552e372:     	movq	%r10, %rsi
14552e375:     	movq	%r11, %rdi
14552e378:     	shrq	%rdi
14552e37b:     	addq	%rdi, %r10
14552e37e:     	movq	%r10, %rbx
14552e381:     	shlq	$0x4, %rbx
14552e385:     	xorl	%ebp, %ebp
14552e387:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e38c:     	seta	%bpl
14552e390:     	movzbl	(%r9,%rbx), %ebx
14552e395:     	xorl	%r14d, %r14d
14552e398:     	cmpb	$0x8, %bl
14552e39b:     	setae	%r14b
14552e39f:     	cmpb	$0x7, %bl
14552e3a2:     	cmovel	%ebp, %r14d
14552e3a6:     	testb	%r14b, %r14b
14552e3a9:     	cmovneq	%rsi, %r10
14552e3ad:     	subq	%rdi, %r11
14552e3b0:     	cmpq	$0x1, %r11
14552e3b4:     	ja	0x14552e372 <.text+0x552d372>
14552e3b6:     	shlq	$0x4, %r10
14552e3ba:     	cmpb	$0x7, (%r9,%r10)
14552e3bf:     	jne	0x14552e3cc <.text+0x552d3cc>
14552e3c1:     	cmpq	%r8, 0x8(%r9,%r10)
14552e3c6:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e3cc:     	xorl	%r10d, %r10d
14552e3cf:     	cmpq	$0x1, %rcx
14552e3d3:     	je	0x14552e41c <.text+0x552d41c>
14552e3d5:     	movq	%rcx, %r11
14552e3d8:     	movq	%r10, %rsi
14552e3db:     	movq	%r11, %rdi
14552e3de:     	shrq	%rdi
14552e3e1:     	addq	%rdi, %r10
14552e3e4:     	movq	%r10, %rbx
14552e3e7:     	shlq	$0x4, %rbx
14552e3eb:     	xorl	%ebp, %ebp
14552e3ed:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e3f2:     	seta	%bpl
14552e3f6:     	movzbl	(%r9,%rbx), %ebx
14552e3fb:     	xorl	%r14d, %r14d
14552e3fe:     	cmpb	$0x9, %bl
14552e401:     	setae	%r14b
14552e405:     	cmpb	$0x8, %bl
14552e408:     	cmovel	%ebp, %r14d
14552e40c:     	testb	%r14b, %r14b
14552e40f:     	cmovneq	%rsi, %r10
14552e413:     	subq	%rdi, %r11
14552e416:     	cmpq	$0x1, %r11
14552e41a:     	ja	0x14552e3d8 <.text+0x552d3d8>
14552e41c:     	shlq	$0x4, %r10
14552e420:     	cmpb	$0x8, (%r9,%r10)
14552e425:     	jne	0x14552e432 <.text+0x552d432>
14552e427:     	cmpq	%r8, 0x8(%r9,%r10)
14552e42c:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e432:     	xorl	%r10d, %r10d
14552e435:     	cmpq	$0x1, %rcx
14552e439:     	je	0x14552e482 <.text+0x552d482>
14552e43b:     	movq	%rcx, %r11
14552e43e:     	movq	%r10, %rsi
14552e441:     	movq	%r11, %rdi
14552e444:     	shrq	%rdi
14552e447:     	addq	%rdi, %r10
14552e44a:     	movq	%r10, %rbx
14552e44d:     	shlq	$0x4, %rbx
14552e451:     	xorl	%ebp, %ebp
14552e453:     	cmpq	%r8, 0x8(%r9,%rbx)
14552e458:     	seta	%bpl
14552e45c:     	movzbl	(%r9,%rbx), %ebx
14552e461:     	xorl	%r14d, %r14d
14552e464:     	cmpb	$0xa, %bl
14552e467:     	setae	%r14b
14552e46b:     	cmpb	$0x9, %bl
14552e46e:     	cmovel	%ebp, %r14d
14552e472:     	testb	%r14b, %r14b
14552e475:     	cmovneq	%rsi, %r10
14552e479:     	subq	%rdi, %r11
14552e47c:     	cmpq	$0x1, %r11
14552e480:     	ja	0x14552e43e <.text+0x552d43e>
14552e482:     	shlq	$0x4, %r10
14552e486:     	cmpb	$0x9, (%r9,%r10)
14552e48b:     	jne	0x14552e498 <.text+0x552d498>
14552e48d:     	cmpq	%r8, 0x8(%r9,%r10)
14552e492:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e498:     	xorl	%r10d, %r10d
14552e49b:     	cmpq	$0x1, %rcx
14552e49f:     	je	0x14552e4e4 <.text+0x552d4e4>
14552e4a1:     	movq	%r10, %r11
14552e4a4:     	movq	%rcx, %rsi
14552e4a7:     	shrq	%rsi
14552e4aa:     	addq	%rsi, %r10
14552e4ad:     	movq	%r10, %rdi
14552e4b0:     	shlq	$0x4, %rdi
14552e4b4:     	xorl	%ebx, %ebx
14552e4b6:     	cmpq	%r8, 0x8(%r9,%rdi)
14552e4bb:     	seta	%bl
14552e4be:     	movzbl	(%r9,%rdi), %edi
14552e4c3:     	xorl	%ebp, %ebp
14552e4c5:     	cmpb	$0xc, %dil
14552e4c9:     	setae	%bpl
14552e4cd:     	cmpb	$0xb, %dil
14552e4d1:     	cmovel	%ebx, %ebp
14552e4d4:     	testb	%bpl, %bpl
14552e4d7:     	cmovneq	%r11, %r10
14552e4db:     	subq	%rsi, %rcx
14552e4de:     	cmpq	$0x1, %rcx
14552e4e2:     	ja	0x14552e4a1 <.text+0x552d4a1>
14552e4e4:     	shlq	$0x4, %r10
14552e4e8:     	cmpb	$0xb, (%r9,%r10)
14552e4ed:     	jne	0x14552f5ce <.text+0x552e5ce>
14552e4f3:     	movl	$0x1, %ecx
14552e4f8:     	cmpq	%r8, 0x8(%r9,%r10)
14552e4fd:     	je	0x14552f5d5 <.text+0x552e5d5>
14552e503:     	jmp	0x14552f5ce <.text+0x552e5ce>
14552e508:     	movq	0x50(%r8), %rdx
14552e50c:     	movq	0x68(%rsi), %r8
14552e510:     	movq	0x70(%rsi), %r9
14552e514:     	shlq	$0x5, %r9
14552e518:     	xorl	%ecx, %ecx
14552e51a:     	xorl	%r10d, %r10d
14552e51d:     	nopl	(%rax)
14552e520:     	cmpq	%r10, %r9
14552e523:     	je	0x14552e539 <.text+0x552d539>
14552e525:     	leaq	0x20(%r10), %r11
14552e529:     	cmpb	$0x1, 0x4(%r8,%r10)
14552e52f:     	movq	%r11, %r10
14552e532:     	jne	0x14552e520 <.text+0x552d520>
14552e534:     	movl	-0x20(%r8,%r11), %ecx
14552e539:     	movl	$0x6e, %r11d
14552e53f:     	movl	$0x2, %r10d
14552e545:     	nopw	%cs:(%rax,%rax)
14552e550:     	leal	-0x1e(%r11), %esi
14552e554:     	subl	%esi, %ecx
14552e556:     	jb	0x14552f168 <.text+0x552e168>
14552e55c:     	leal	-0xf(%r11), %esi
14552e560:     	subl	%esi, %ecx
14552e562:     	jb	0x14552f16e <.text+0x552e16e>
14552e568:     	subl	%r11d, %ecx
14552e56b:     	jb	0x14552f171 <.text+0x552e171>
14552e571:     	addl	$0x2d, %r11d
14552e575:     	addl	$0x3, %r10d
14552e579:     	cmpl	$0x36b, %r11d           # imm = 0x36B
14552e580:     	jne	0x14552e550 <.text+0x552d550>
14552e582:     	movl	$0x33, %r10d
14552e588:     	jmp	0x14552f171 <.text+0x552e171>
14552e58d:     	xorl	%ecx, %ecx
14552e58f:     	jmp	0x14552f5e2 <.text+0x552e5e2>
14552e594:     	movq	0xe8(%rsi), %r9
14552e59b:     	testq	%r9, %r9
14552e59e:     	je	0x14552f5ce <.text+0x552e5ce>
14552e5a4:     	movzbl	0x49(%r8), %r8d
14552e5a9:     	movq	0xe0(%rsi), %rcx
14552e5b0:     	xorl	%r10d, %r10d
14552e5b3:     	cmpq	$0x1, %r9
14552e5b7:     	je	0x14552e5fb <.text+0x552d5fb>
14552e5b9:     	movq	%r9, %rdx
14552e5bc:     	nopl	(%rax)
14552e5c0:     	movq	%r10, %r11
14552e5c3:     	movq	%rdx, %rsi
14552e5c6:     	shrq	%rsi
14552e5c9:     	addq	%rsi, %r10
14552e5cc:     	movq	%r10, %rdi
14552e5cf:     	shlq	$0x4, %rdi
14552e5d3:     	xorl	%ebx, %ebx
14552e5d5:     	cmpq	$0x0, 0x8(%rcx,%rdi)
14552e5db:     	setne	%bl
14552e5de:     	xorl	%ebp, %ebp
14552e5e0:     	cmpb	%r8b, (%rcx,%rdi)
14552e5e4:     	seta	%bpl
14552e5e8:     	cmovel	%ebx, %ebp
14552e5eb:     	testb	%bpl, %bpl
14552e5ee:     	cmovneq	%r11, %r10
14552e5f2:     	subq	%rsi, %rdx
14552e5f5:     	cmpq	$0x1, %rdx
14552e5f9:     	ja	0x14552e5c0 <.text+0x552d5c0>
14552e5fb:     	shlq	$0x4, %r10
14552e5ff:     	movl	$0x1, %edx
14552e604:     	cmpb	%r8b, (%rcx,%r10)
14552e608:     	jne	0x14552e616 <.text+0x552d616>
14552e60a:     	cmpq	$0x0, 0x8(%rcx,%r10)
14552e610:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e616:     	xorl	%r10d, %r10d
14552e619:     	cmpq	$0x1, %r9
14552e61d:     	je	0x14552e66e <.text+0x552d66e>
14552e61f:     	movq	%r9, %r11
14552e622:     	nopw	%cs:(%rax,%rax)
14552e630:     	movq	%r10, %rsi
14552e633:     	movq	%r11, %rdi
14552e636:     	shrq	%rdi
14552e639:     	addq	%rdi, %r10
14552e63c:     	movq	%r10, %rbx
14552e63f:     	shlq	$0x4, %rbx
14552e643:     	xorl	%ebp, %ebp
14552e645:     	cmpq	$0x2, 0x8(%rcx,%rbx)
14552e64b:     	setae	%bpl
14552e64f:     	xorl	%r14d, %r14d
14552e652:     	cmpb	%r8b, (%rcx,%rbx)
14552e656:     	seta	%r14b
14552e65a:     	cmovel	%ebp, %r14d
14552e65e:     	testb	%r14b, %r14b
14552e661:     	cmovneq	%rsi, %r10
14552e665:     	subq	%rdi, %r11
14552e668:     	cmpq	$0x1, %r11
14552e66c:     	ja	0x14552e630 <.text+0x552d630>
14552e66e:     	shlq	$0x4, %r10
14552e672:     	cmpb	%r8b, (%rcx,%r10)
14552e676:     	jne	0x14552e684 <.text+0x552d684>
14552e678:     	cmpq	$0x1, 0x8(%rcx,%r10)
14552e67e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e684:     	xorl	%r10d, %r10d
14552e687:     	cmpq	$0x1, %r9
14552e68b:     	je	0x14552e6ce <.text+0x552d6ce>
14552e68d:     	movq	%r9, %r11
14552e690:     	movq	%r10, %rsi
14552e693:     	movq	%r11, %rdi
14552e696:     	shrq	%rdi
14552e699:     	addq	%rdi, %r10
14552e69c:     	movq	%r10, %rbx
14552e69f:     	shlq	$0x4, %rbx
14552e6a3:     	xorl	%ebp, %ebp
14552e6a5:     	cmpq	$0x3, 0x8(%rcx,%rbx)
14552e6ab:     	setae	%bpl
14552e6af:     	xorl	%r14d, %r14d
14552e6b2:     	cmpb	%r8b, (%rcx,%rbx)
14552e6b6:     	seta	%r14b
14552e6ba:     	cmovel	%ebp, %r14d
14552e6be:     	testb	%r14b, %r14b
14552e6c1:     	cmovneq	%rsi, %r10
14552e6c5:     	subq	%rdi, %r11
14552e6c8:     	cmpq	$0x1, %r11
14552e6cc:     	ja	0x14552e690 <.text+0x552d690>
14552e6ce:     	shlq	$0x4, %r10
14552e6d2:     	cmpb	%r8b, (%rcx,%r10)
14552e6d6:     	jne	0x14552e6e4 <.text+0x552d6e4>
14552e6d8:     	cmpq	$0x2, 0x8(%rcx,%r10)
14552e6de:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e6e4:     	xorl	%r10d, %r10d
14552e6e7:     	cmpq	$0x1, %r9
14552e6eb:     	je	0x14552e72e <.text+0x552d72e>
14552e6ed:     	movq	%r9, %r11
14552e6f0:     	movq	%r10, %rsi
14552e6f3:     	movq	%r11, %rdi
14552e6f6:     	shrq	%rdi
14552e6f9:     	addq	%rdi, %r10
14552e6fc:     	movq	%r10, %rbx
14552e6ff:     	shlq	$0x4, %rbx
14552e703:     	xorl	%ebp, %ebp
14552e705:     	cmpq	$0x4, 0x8(%rcx,%rbx)
14552e70b:     	setae	%bpl
14552e70f:     	xorl	%r14d, %r14d
14552e712:     	cmpb	%r8b, (%rcx,%rbx)
14552e716:     	seta	%r14b
14552e71a:     	cmovel	%ebp, %r14d
14552e71e:     	testb	%r14b, %r14b
14552e721:     	cmovneq	%rsi, %r10
14552e725:     	subq	%rdi, %r11
14552e728:     	cmpq	$0x1, %r11
14552e72c:     	ja	0x14552e6f0 <.text+0x552d6f0>
14552e72e:     	shlq	$0x4, %r10
14552e732:     	cmpb	%r8b, (%rcx,%r10)
14552e736:     	jne	0x14552e744 <.text+0x552d744>
14552e738:     	cmpq	$0x3, 0x8(%rcx,%r10)
14552e73e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e744:     	xorl	%r10d, %r10d
14552e747:     	cmpq	$0x1, %r9
14552e74b:     	je	0x14552e78e <.text+0x552d78e>
14552e74d:     	movq	%r9, %r11
14552e750:     	movq	%r10, %rsi
14552e753:     	movq	%r11, %rdi
14552e756:     	shrq	%rdi
14552e759:     	addq	%rdi, %r10
14552e75c:     	movq	%r10, %rbx
14552e75f:     	shlq	$0x4, %rbx
14552e763:     	xorl	%ebp, %ebp
14552e765:     	cmpq	$0x5, 0x8(%rcx,%rbx)
14552e76b:     	setae	%bpl
14552e76f:     	xorl	%r14d, %r14d
14552e772:     	cmpb	%r8b, (%rcx,%rbx)
14552e776:     	seta	%r14b
14552e77a:     	cmovel	%ebp, %r14d
14552e77e:     	testb	%r14b, %r14b
14552e781:     	cmovneq	%rsi, %r10
14552e785:     	subq	%rdi, %r11
14552e788:     	cmpq	$0x1, %r11
14552e78c:     	ja	0x14552e750 <.text+0x552d750>
14552e78e:     	shlq	$0x4, %r10
14552e792:     	cmpb	%r8b, (%rcx,%r10)
14552e796:     	jne	0x14552e7a4 <.text+0x552d7a4>
14552e798:     	cmpq	$0x4, 0x8(%rcx,%r10)
14552e79e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e7a4:     	xorl	%r10d, %r10d
14552e7a7:     	cmpq	$0x1, %r9
14552e7ab:     	je	0x14552e7ee <.text+0x552d7ee>
14552e7ad:     	movq	%r9, %r11
14552e7b0:     	movq	%r10, %rsi
14552e7b3:     	movq	%r11, %rdi
14552e7b6:     	shrq	%rdi
14552e7b9:     	addq	%rdi, %r10
14552e7bc:     	movq	%r10, %rbx
14552e7bf:     	shlq	$0x4, %rbx
14552e7c3:     	xorl	%ebp, %ebp
14552e7c5:     	cmpq	$0x6, 0x8(%rcx,%rbx)
14552e7cb:     	setae	%bpl
14552e7cf:     	xorl	%r14d, %r14d
14552e7d2:     	cmpb	%r8b, (%rcx,%rbx)
14552e7d6:     	seta	%r14b
14552e7da:     	cmovel	%ebp, %r14d
14552e7de:     	testb	%r14b, %r14b
14552e7e1:     	cmovneq	%rsi, %r10
14552e7e5:     	subq	%rdi, %r11
14552e7e8:     	cmpq	$0x1, %r11
14552e7ec:     	ja	0x14552e7b0 <.text+0x552d7b0>
14552e7ee:     	shlq	$0x4, %r10
14552e7f2:     	cmpb	%r8b, (%rcx,%r10)
14552e7f6:     	jne	0x14552e804 <.text+0x552d804>
14552e7f8:     	cmpq	$0x5, 0x8(%rcx,%r10)
14552e7fe:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e804:     	xorl	%r10d, %r10d
14552e807:     	cmpq	$0x1, %r9
14552e80b:     	je	0x14552e84e <.text+0x552d84e>
14552e80d:     	movq	%r9, %r11
14552e810:     	movq	%r10, %rsi
14552e813:     	movq	%r11, %rdi
14552e816:     	shrq	%rdi
14552e819:     	addq	%rdi, %r10
14552e81c:     	movq	%r10, %rbx
14552e81f:     	shlq	$0x4, %rbx
14552e823:     	xorl	%ebp, %ebp
14552e825:     	cmpq	$0x7, 0x8(%rcx,%rbx)
14552e82b:     	setae	%bpl
14552e82f:     	xorl	%r14d, %r14d
14552e832:     	cmpb	%r8b, (%rcx,%rbx)
14552e836:     	seta	%r14b
14552e83a:     	cmovel	%ebp, %r14d
14552e83e:     	testb	%r14b, %r14b
14552e841:     	cmovneq	%rsi, %r10
14552e845:     	subq	%rdi, %r11
14552e848:     	cmpq	$0x1, %r11
14552e84c:     	ja	0x14552e810 <.text+0x552d810>
14552e84e:     	shlq	$0x4, %r10
14552e852:     	cmpb	%r8b, (%rcx,%r10)
14552e856:     	jne	0x14552e864 <.text+0x552d864>
14552e858:     	cmpq	$0x6, 0x8(%rcx,%r10)
14552e85e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e864:     	xorl	%r10d, %r10d
14552e867:     	cmpq	$0x1, %r9
14552e86b:     	je	0x14552e8ae <.text+0x552d8ae>
14552e86d:     	movq	%r9, %r11
14552e870:     	movq	%r10, %rsi
14552e873:     	movq	%r11, %rdi
14552e876:     	shrq	%rdi
14552e879:     	addq	%rdi, %r10
14552e87c:     	movq	%r10, %rbx
14552e87f:     	shlq	$0x4, %rbx
14552e883:     	xorl	%ebp, %ebp
14552e885:     	cmpq	$0x8, 0x8(%rcx,%rbx)
14552e88b:     	setae	%bpl
14552e88f:     	xorl	%r14d, %r14d
14552e892:     	cmpb	%r8b, (%rcx,%rbx)
14552e896:     	seta	%r14b
14552e89a:     	cmovel	%ebp, %r14d
14552e89e:     	testb	%r14b, %r14b
14552e8a1:     	cmovneq	%rsi, %r10
14552e8a5:     	subq	%rdi, %r11
14552e8a8:     	cmpq	$0x1, %r11
14552e8ac:     	ja	0x14552e870 <.text+0x552d870>
14552e8ae:     	shlq	$0x4, %r10
14552e8b2:     	cmpb	%r8b, (%rcx,%r10)
14552e8b6:     	jne	0x14552e8c4 <.text+0x552d8c4>
14552e8b8:     	cmpq	$0x7, 0x8(%rcx,%r10)
14552e8be:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e8c4:     	xorl	%r10d, %r10d
14552e8c7:     	cmpq	$0x1, %r9
14552e8cb:     	je	0x14552e90e <.text+0x552d90e>
14552e8cd:     	movq	%r9, %r11
14552e8d0:     	movq	%r10, %rsi
14552e8d3:     	movq	%r11, %rdi
14552e8d6:     	shrq	%rdi
14552e8d9:     	addq	%rdi, %r10
14552e8dc:     	movq	%r10, %rbx
14552e8df:     	shlq	$0x4, %rbx
14552e8e3:     	xorl	%ebp, %ebp
14552e8e5:     	cmpq	$0x9, 0x8(%rcx,%rbx)
14552e8eb:     	setae	%bpl
14552e8ef:     	xorl	%r14d, %r14d
14552e8f2:     	cmpb	%r8b, (%rcx,%rbx)
14552e8f6:     	seta	%r14b
14552e8fa:     	cmovel	%ebp, %r14d
14552e8fe:     	testb	%r14b, %r14b
14552e901:     	cmovneq	%rsi, %r10
14552e905:     	subq	%rdi, %r11
14552e908:     	cmpq	$0x1, %r11
14552e90c:     	ja	0x14552e8d0 <.text+0x552d8d0>
14552e90e:     	shlq	$0x4, %r10
14552e912:     	cmpb	%r8b, (%rcx,%r10)
14552e916:     	jne	0x14552e924 <.text+0x552d924>
14552e918:     	cmpq	$0x8, 0x8(%rcx,%r10)
14552e91e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e924:     	xorl	%r10d, %r10d
14552e927:     	cmpq	$0x1, %r9
14552e92b:     	je	0x14552e96e <.text+0x552d96e>
14552e92d:     	movq	%r9, %r11
14552e930:     	movq	%r10, %rsi
14552e933:     	movq	%r11, %rdi
14552e936:     	shrq	%rdi
14552e939:     	addq	%rdi, %r10
14552e93c:     	movq	%r10, %rbx
14552e93f:     	shlq	$0x4, %rbx
14552e943:     	xorl	%ebp, %ebp
14552e945:     	cmpq	$0xa, 0x8(%rcx,%rbx)
14552e94b:     	setae	%bpl
14552e94f:     	xorl	%r14d, %r14d
14552e952:     	cmpb	%r8b, (%rcx,%rbx)
14552e956:     	seta	%r14b
14552e95a:     	cmovel	%ebp, %r14d
14552e95e:     	testb	%r14b, %r14b
14552e961:     	cmovneq	%rsi, %r10
14552e965:     	subq	%rdi, %r11
14552e968:     	cmpq	$0x1, %r11
14552e96c:     	ja	0x14552e930 <.text+0x552d930>
14552e96e:     	shlq	$0x4, %r10
14552e972:     	cmpb	%r8b, (%rcx,%r10)
14552e976:     	jne	0x14552e980 <.text+0x552d980>
14552e978:     	cmpq	$0x9, 0x8(%rcx,%r10)
14552e97e:     	je	0x14552e9e4 <.text+0x552d9e4>
14552e980:     	xorl	%r10d, %r10d
14552e983:     	cmpq	$0x1, %r9
14552e987:     	je	0x14552e9ca <.text+0x552d9ca>
14552e989:     	movq	%r9, %r11
14552e98c:     	movq	%r10, %rsi
14552e98f:     	movq	%r11, %rdi
14552e992:     	shrq	%rdi
14552e995:     	addq	%rdi, %r10
14552e998:     	movq	%r10, %rbx
14552e99b:     	shlq	$0x4, %rbx
14552e99f:     	xorl	%ebp, %ebp
14552e9a1:     	cmpq	$0xb, 0x8(%rcx,%rbx)
14552e9a7:     	setae	%bpl
14552e9ab:     	xorl	%r14d, %r14d
14552e9ae:     	cmpb	%r8b, (%rcx,%rbx)
14552e9b2:     	seta	%r14b
14552e9b6:     	cmovel	%ebp, %r14d
14552e9ba:     	testb	%r14b, %r14b
14552e9bd:     	cmovneq	%rsi, %r10
14552e9c1:     	subq	%rdi, %r11
14552e9c4:     	cmpq	$0x1, %r11
14552e9c8:     	ja	0x14552e98c <.text+0x552d98c>
14552e9ca:     	shlq	$0x4, %r10
14552e9ce:     	cmpb	%r8b, (%rcx,%r10)
14552e9d2:     	jne	0x14552f573 <.text+0x552e573>
14552e9d8:     	cmpq	$0xa, 0x8(%rcx,%r10)
14552e9de:     	jne	0x14552f573 <.text+0x552e573>
14552e9e4:     	movl	$0x1, %ecx
14552e9e9:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552e9ee:     	movq	0xe8(%rsi), %rcx
14552e9f5:     	movl	$0x1, %edx
14552e9fa:     	testq	%rcx, %rcx
14552e9fd:     	je	0x14552f5d5 <.text+0x552e5d5>
14552ea03:     	movzbl	0x49(%r8), %r9d
14552ea08:     	movq	0x50(%r8), %r8
14552ea0c:     	movq	0xe0(%rsi), %r10
14552ea13:     	xorl	%r11d, %r11d
14552ea16:     	cmpq	$0x1, %rcx
14552ea1a:     	je	0x14552ea5d <.text+0x552da5d>
14552ea1c:     	nopl	(%rax)
14552ea20:     	movq	%r11, %rsi
14552ea23:     	movq	%rcx, %rdi
14552ea26:     	shrq	%rdi
14552ea29:     	addq	%rdi, %r11
14552ea2c:     	movq	%r11, %rbx
14552ea2f:     	shlq	$0x4, %rbx
14552ea33:     	xorl	%ebp, %ebp
14552ea35:     	cmpq	%r8, 0x8(%r10,%rbx)
14552ea3a:     	seta	%bpl
14552ea3e:     	xorl	%r14d, %r14d
14552ea41:     	cmpb	%r9b, (%r10,%rbx)
14552ea45:     	seta	%r14b
14552ea49:     	cmovel	%ebp, %r14d
14552ea4d:     	testb	%r14b, %r14b
14552ea50:     	cmovneq	%rsi, %r11
14552ea54:     	subq	%rdi, %rcx
14552ea57:     	cmpq	$0x1, %rcx
14552ea5b:     	ja	0x14552ea20 <.text+0x552da20>
14552ea5d:     	shlq	$0x4, %r11
14552ea61:     	cmpb	%r9b, (%r10,%r11)
14552ea65:     	sete	%cl
14552ea68:     	cmpq	%r8, 0x8(%r10,%r11)
14552ea6d:     	sete	%r8b
14552ea71:     	andb	%cl, %r8b
14552ea74:     	movzbl	%r8b, %ecx
14552ea78:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552ea7d:     	movl	0x4c(%r8), %r9d
14552ea81:     	imulq	$0x8d, %r9, %rcx
14552ea88:     	movabsq	$0x28f5c28f5c28f5d, %rdx # imm = 0x28F5C28F5C28F5D
14552ea92:     	movq	%rax, %r8
14552ea95:     	movq	%rcx, %rax
14552ea98:     	mulq	%rdx
14552ea9b:     	movq	%r8, %rax
14552ea9e:     	movq	%rdx, %rcx
14552eaa1:     	movabsq	$-0xa3d70a3d70a3d6b, %r8 # imm = 0xF5C28F5C28F5C295
14552eaab:     	imulq	%r9, %r8
14552eaaf:     	rorq	$0x2, %r8
14552eab3:     	movabsq	$0x28f5c28f5c28f5c, %r9 # imm = 0x28F5C28F5C28F5C
14552eabd:     	xorl	%edx, %edx
14552eabf:     	cmpq	%r9, %r8
14552eac2:     	seta	%dl
14552eac5:     	addq	%rcx, %rdx
14552eac8:     	movq	0xa0(%rsi), %rcx
14552eacf:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552ead4:     	movq	0xe8(%rsi), %rcx
14552eadb:     	movl	$0x9, %edx
14552eae0:     	testq	%rcx, %rcx
14552eae3:     	je	0x14552f5d5 <.text+0x552e5d5>
14552eae9:     	movq	0x50(%r8), %r8
14552eaed:     	movq	0xe0(%rsi), %r9
14552eaf4:     	cmpq	$0x1, %rcx
14552eaf8:     	jne	0x14552ed6b <.text+0x552dd6b>
14552eafe:     	movzbl	(%r9), %edi
14552eb02:     	cmpb	$0x9, %dil
14552eb06:     	sete	%cl
14552eb09:     	cmpb	$0x8, %dil
14552eb0d:     	sete	%r10b
14552eb11:     	cmpb	$0x7, %dil
14552eb15:     	sete	%r11b
14552eb19:     	cmpb	$0x5, %dil
14552eb1d:     	sete	%bl
14552eb20:     	cmpb	$0x4, %dil
14552eb24:     	sete	%sil
14552eb28:     	cmpb	$0x3, %dil
14552eb2c:     	sete	%bpl
14552eb30:     	cmpb	$0x1, %dil
14552eb34:     	sete	%r14b
14552eb38:     	cmpb	$0x2, %dil
14552eb3c:     	sete	%r15b
14552eb40:     	cmpq	%r8, 0x8(%r9)
14552eb44:     	sete	%dil
14552eb48:     	andb	%dil, %r14b
14552eb4b:     	andb	%dil, %r15b
14552eb4e:     	movzbl	%r15b, %r15d
14552eb52:     	movzbl	%r14b, %r14d
14552eb56:     	shll	$0x10, %r14d
14552eb5a:     	orl	%r15d, %r14d
14552eb5d:     	andb	%dil, %cl
14552eb60:     	andb	%dil, %r10b
14552eb63:     	andb	%dil, %bpl
14552eb66:     	movd	%r14d, %xmm0
14552eb6b:     	movzbl	%bpl, %ebp
14552eb6f:     	pinsrw	$0x2, %ebp, %xmm0
14552eb74:     	andb	%dil, %sil
14552eb77:     	movzbl	%sil, %esi
14552eb7b:     	pinsrw	$0x3, %esi, %xmm0
14552eb80:     	andb	%dil, %bl
14552eb83:     	movzbl	%bl, %esi
14552eb86:     	pinsrw	$0x4, %esi, %xmm0
14552eb8b:     	andb	%dil, %r11b
14552eb8e:     	movzbl	%r11b, %r11d
14552eb92:     	pinsrw	$0x5, %r11d, %xmm0
14552eb98:     	movzbl	%r10b, %r10d
14552eb9c:     	pinsrw	$0x6, %r10d, %xmm0
14552eba2:     	movzbl	%cl, %ecx
14552eba5:     	pinsrw	$0x7, %ecx, %xmm0
14552ebaa:     	psllw	$0xf, %xmm0
14552ebaf:     	packsswb	%xmm0, %xmm0
14552ebb3:     	pmovmskb	%xmm0, %ecx
14552ebb7:     	movzbl	%cl, %ecx
14552ebba:     	imull	$0x8040201, %ecx, %ecx  # imm = 0x8040201
14552ebc0:     	shrl	$0x3, %ecx
14552ebc3:     	andl	$0x11111111, %ecx       # imm = 0x11111111
14552ebc9:     	imull	$0x11111111, %ecx, %r10d # imm = 0x11111111
14552ebd0:     	shrl	$0x1c, %r10d
14552ebd4:     	xorl	%r11d, %r11d
14552ebd7:     	jmp	0x14552f144 <.text+0x552e144>
14552ebdc:     	movq	0x50(%r8), %rdx
14552ebe0:     	movq	0x40(%rsi), %rcx
14552ebe4:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552ebe9:     	movq	%rax, %rbx
14552ebec:     	leaq	0x1207165(%rip), %rax   # 0x146735d58
14552ebf3:     	movq	%rax, 0x50(%rsp)
14552ebf8:     	movq	%rsi, 0x58(%rsp)
14552ebfd:     	leaq	0x1206cd4(%rip), %rax   # 0x1467358d8
14552ec04:     	movq	%rax, 0x48(%rsp)
14552ec09:     	movb	$0x1, 0x2f(%rsp)
14552ec0e:     	movq	$0x0, 0x60(%rsp)
14552ec17:     	movq	$0x0, 0x88(%rsp)
14552ec23:     	leaq	0x14a811e(%rip), %rax   # 0x1469d6d48
14552ec2a:     	movq	%rax, 0xb0(%rsp)
14552ec32:     	leaq	0x14a813f(%rip), %rax   # 0x1469d6d78
14552ec39:     	movq	%rax, 0xb8(%rsp)
14552ec41:     	leaq	0x2f(%rsp), %rax
14552ec46:     	movq	%rax, 0xc0(%rsp)
14552ec4e:     	leaq	0x30(%rsp), %rcx
14552ec53:     	leaq	0x60(%rsp), %rdx
14552ec58:     	callq	0x14553eda0 <.text+0x553dda0>
14552ec5d:     	movq	0x30(%rsp), %rax
14552ec62:     	movq	0x38(%rsp), %rcx
14552ec67:     	movq	0x40(%rsp), %rdx
14552ec6c:     	leaq	(%rcx,%rdx,4), %rdx
14552ec70:     	movq	%rcx, 0x60(%rsp)
14552ec75:     	movq	%rcx, 0x68(%rsp)
14552ec7a:     	movq	%rax, 0x70(%rsp)
14552ec7f:     	movq	%rdx, 0x78(%rsp)
14552ec84:     	leaq	0x30(%rsp), %rcx
14552ec89:     	leaq	0x60(%rsp), %rdx
14552ec8e:     	callq	0x1455590f0 <.text+0x55580f0>
14552ec93:     	movq	0x38(%rsp), %rcx
14552ec98:     	movq	0x40(%rsp), %rdi
14552ec9d:     	testq	%rdi, %rdi
14552eca0:     	je	0x14552ed35 <.text+0x552dd35>
14552eca6:     	movq	0x38(%rsi), %rax
14552ecaa:     	movq	0x40(%rsi), %rdx
14552ecae:     	xorl	%esi, %esi
14552ecb0:     	xorl	%r8d, %r8d
14552ecb3:     	jmp	0x14552ecd9 <.text+0x552dcd9>
14552ecb5:     	nopw	%cs:(%rax,%rax)
14552ecc0:     	xorl	%r10d, %r10d
14552ecc3:     	xorl	%r11d, %r11d
14552ecc6:     	cmpl	%r9d, (%rax,%r10,4)
14552ecca:     	sete	%r11b
14552ecce:     	addq	%r11, %rsi
14552ecd1:     	incq	%r8
14552ecd4:     	cmpq	%rdi, %r8
14552ecd7:     	je	0x14552ed37 <.text+0x552dd37>
14552ecd9:     	movq	%rdx, %r11
14552ecdc:     	testq	%rdx, %rdx
14552ecdf:     	je	0x14552ecce <.text+0x552dcce>
14552ece1:     	movl	(%rcx,%r8,4), %r9d
14552ece5:     	cmpq	$0x1, %rdx
14552ece9:     	je	0x14552ecc0 <.text+0x552dcc0>
14552eceb:     	movq	%rdx, %r11
14552ecee:     	xorl	%r10d, %r10d
14552ecf1:     	nopw	%cs:(%rax,%rax)
14552ed00:     	movq	%r10, %r14
14552ed03:     	movq	%r11, %r15
14552ed06:     	shrq	%r15
14552ed09:     	addq	%r15, %r10
14552ed0c:     	cmpl	%r9d, (%rax,%r10,4)
14552ed10:     	cmovaq	%r14, %r10
14552ed14:     	subq	%r15, %r11
14552ed17:     	cmpq	$0x1, %r11
14552ed1b:     	ja	0x14552ed00 <.text+0x552dd00>
14552ed1d:     	jmp	0x14552ecc3 <.text+0x552dcc3>
14552ed1f:     	movzbl	0x49(%r8), %ecx
14552ed24:     	movq	0x50(%r8), %rdx
14552ed28:     	movq	0x190(%rsi,%rcx,8), %rcx
14552ed30:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552ed35:     	xorl	%esi, %esi
14552ed37:     	movq	0x30(%rsp), %rdx
14552ed3c:     	testq	%rdx, %rdx
14552ed3f:     	je	0x14552ed50 <.text+0x552dd50>
14552ed41:     	shlq	$0x2, %rdx
14552ed45:     	movl	$0x4, %r8d
14552ed4b:     	callq	0x1400021d0 <.text+0x11d0>
14552ed50:     	leaq	0x48(%rsp), %rcx
14552ed55:     	movq	%rsi, %rdx
14552ed58:     	movq	%rdi, %r8
14552ed5b:     	callq	0x14554dcd0 <.text+0x554ccd0>
14552ed60:     	movq	%rax, %rcx
14552ed63:     	movq	%rbx, %rax
14552ed66:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552ed6b:     	xorl	%r10d, %r10d
14552ed6e:     	movq	%rcx, %r11
14552ed71:     	nopw	%cs:(%rax,%rax)
14552ed80:     	movq	%r10, %rsi
14552ed83:     	movq	%r11, %rdi
14552ed86:     	shrq	%rdi
14552ed89:     	addq	%rdi, %r10
14552ed8c:     	movq	%r10, %rbx
14552ed8f:     	shlq	$0x4, %rbx
14552ed93:     	xorl	%ebp, %ebp
14552ed95:     	cmpq	%r8, 0x8(%r9,%rbx)
14552ed9a:     	seta	%bpl
14552ed9e:     	movzbl	(%r9,%rbx), %ebx
14552eda3:     	xorl	%r14d, %r14d
14552eda6:     	cmpb	$0x2, %bl
14552eda9:     	setae	%r14b
14552edad:     	cmpb	$0x1, %bl
14552edb0:     	cmovel	%ebp, %r14d
14552edb4:     	testb	%r14b, %r14b
14552edb7:     	cmovneq	%rsi, %r10
14552edbb:     	subq	%rdi, %r11
14552edbe:     	cmpq	$0x1, %r11
14552edc2:     	ja	0x14552ed80 <.text+0x552dd80>
14552edc4:     	shlq	$0x4, %r10
14552edc8:     	cmpb	$0x1, (%r9,%r10)
14552edcd:     	sete	%r11b
14552edd1:     	cmpq	%r8, 0x8(%r9,%r10)
14552edd6:     	sete	%r10b
14552edda:     	andb	%r11b, %r10b
14552eddd:     	movzbl	%r10b, %r11d
14552ede1:     	xorl	%r10d, %r10d
14552ede4:     	movq	%rcx, %rsi
14552ede7:     	nopw	(%rax,%rax)
14552edf0:     	movq	%r10, %rdi
14552edf3:     	movq	%rsi, %rbx
14552edf6:     	shrq	%rbx
14552edf9:     	addq	%rbx, %r10
14552edfc:     	movq	%r10, %r14
14552edff:     	shlq	$0x4, %r14
14552ee03:     	xorl	%ebp, %ebp
14552ee05:     	cmpq	%r8, 0x8(%r9,%r14)
14552ee0a:     	seta	%bpl
14552ee0e:     	movzbl	(%r9,%r14), %r14d
14552ee13:     	xorl	%r15d, %r15d
14552ee16:     	cmpb	$0x3, %r14b
14552ee1a:     	setae	%r15b
14552ee1e:     	cmpb	$0x2, %r14b
14552ee22:     	cmovel	%ebp, %r15d
14552ee26:     	testb	%r15b, %r15b
14552ee29:     	cmovneq	%rdi, %r10
14552ee2d:     	subq	%rbx, %rsi
14552ee30:     	cmpq	$0x1, %rsi
14552ee34:     	ja	0x14552edf0 <.text+0x552ddf0>
14552ee36:     	shlq	$0x4, %r10
14552ee3a:     	cmpb	$0x2, (%r9,%r10)
14552ee3f:     	sete	%bl
14552ee42:     	cmpq	%r8, 0x8(%r9,%r10)
14552ee47:     	sete	%r10b
14552ee4b:     	andb	%bl, %r10b
14552ee4e:     	movzbl	%r10b, %r10d
14552ee52:     	addq	%r11, %r10
14552ee55:     	xorl	%r11d, %r11d
14552ee58:     	movq	%rcx, %rsi
14552ee5b:     	nopl	(%rax,%rax)
14552ee60:     	movq	%r11, %rdi
14552ee63:     	movq	%rsi, %rbx
14552ee66:     	shrq	%rbx
14552ee69:     	addq	%rbx, %r11
14552ee6c:     	movq	%r11, %r14
14552ee6f:     	shlq	$0x4, %r14
14552ee73:     	xorl	%ebp, %ebp
14552ee75:     	cmpq	%r8, 0x8(%r9,%r14)
14552ee7a:     	seta	%bpl
14552ee7e:     	movzbl	(%r9,%r14), %r14d
14552ee83:     	xorl	%r15d, %r15d
14552ee86:     	cmpb	$0x4, %r14b
14552ee8a:     	setae	%r15b
14552ee8e:     	cmpb	$0x3, %r14b
14552ee92:     	cmovel	%ebp, %r15d
14552ee96:     	testb	%r15b, %r15b
14552ee99:     	cmovneq	%rdi, %r11
14552ee9d:     	subq	%rbx, %rsi
14552eea0:     	cmpq	$0x1, %rsi
14552eea4:     	ja	0x14552ee60 <.text+0x552de60>
14552eea6:     	shlq	$0x4, %r11
14552eeaa:     	cmpb	$0x3, (%r9,%r11)
14552eeaf:     	sete	%bl
14552eeb2:     	cmpq	%r8, 0x8(%r9,%r11)
14552eeb7:     	sete	%r11b
14552eebb:     	andb	%bl, %r11b
14552eebe:     	movzbl	%r11b, %r11d
14552eec2:     	addq	%r11, %r10
14552eec5:     	xorl	%r11d, %r11d
14552eec8:     	movq	%rcx, %rsi
14552eecb:     	nopl	(%rax,%rax)
14552eed0:     	movq	%r11, %rdi
14552eed3:     	movq	%rsi, %rbx
14552eed6:     	shrq	%rbx
14552eed9:     	addq	%rbx, %r11
14552eedc:     	movq	%r11, %r14
14552eedf:     	shlq	$0x4, %r14
14552eee3:     	xorl	%ebp, %ebp
14552eee5:     	cmpq	%r8, 0x8(%r9,%r14)
14552eeea:     	seta	%bpl
14552eeee:     	movzbl	(%r9,%r14), %r14d
14552eef3:     	xorl	%r15d, %r15d
14552eef6:     	cmpb	$0x5, %r14b
14552eefa:     	setae	%r15b
14552eefe:     	cmpb	$0x4, %r14b
14552ef02:     	cmovel	%ebp, %r15d
14552ef06:     	testb	%r15b, %r15b
14552ef09:     	cmovneq	%rdi, %r11
14552ef0d:     	subq	%rbx, %rsi
14552ef10:     	cmpq	$0x1, %rsi
14552ef14:     	ja	0x14552eed0 <.text+0x552ded0>
14552ef16:     	shlq	$0x4, %r11
14552ef1a:     	cmpb	$0x4, (%r9,%r11)
14552ef1f:     	sete	%bl
14552ef22:     	cmpq	%r8, 0x8(%r9,%r11)
14552ef27:     	sete	%r11b
14552ef2b:     	andb	%bl, %r11b
14552ef2e:     	movzbl	%r11b, %r11d
14552ef32:     	addq	%r11, %r10
14552ef35:     	xorl	%r11d, %r11d
14552ef38:     	movq	%rcx, %rsi
14552ef3b:     	nopl	(%rax,%rax)
14552ef40:     	movq	%r11, %rdi
14552ef43:     	movq	%rsi, %rbx
14552ef46:     	shrq	%rbx
14552ef49:     	addq	%rbx, %r11
14552ef4c:     	movq	%r11, %r14
14552ef4f:     	shlq	$0x4, %r14
14552ef53:     	xorl	%ebp, %ebp
14552ef55:     	cmpq	%r8, 0x8(%r9,%r14)
14552ef5a:     	seta	%bpl
14552ef5e:     	movzbl	(%r9,%r14), %r14d
14552ef63:     	xorl	%r15d, %r15d
14552ef66:     	cmpb	$0x6, %r14b
14552ef6a:     	setae	%r15b
14552ef6e:     	cmpb	$0x5, %r14b
14552ef72:     	cmovel	%ebp, %r15d
14552ef76:     	testb	%r15b, %r15b
14552ef79:     	cmovneq	%rdi, %r11
14552ef7d:     	subq	%rbx, %rsi
14552ef80:     	cmpq	$0x1, %rsi
14552ef84:     	ja	0x14552ef40 <.text+0x552df40>
14552ef86:     	shlq	$0x4, %r11
14552ef8a:     	cmpb	$0x5, (%r9,%r11)
14552ef8f:     	sete	%bl
14552ef92:     	cmpq	%r8, 0x8(%r9,%r11)
14552ef97:     	sete	%r11b
14552ef9b:     	andb	%bl, %r11b
14552ef9e:     	movzbl	%r11b, %r11d
14552efa2:     	addq	%r11, %r10
14552efa5:     	xorl	%r11d, %r11d
14552efa8:     	movq	%rcx, %rsi
14552efab:     	nopl	(%rax,%rax)
14552efb0:     	movq	%r11, %rdi
14552efb3:     	movq	%rsi, %rbx
14552efb6:     	shrq	%rbx
14552efb9:     	addq	%rbx, %r11
14552efbc:     	movq	%r11, %r14
14552efbf:     	shlq	$0x4, %r14
14552efc3:     	xorl	%ebp, %ebp
14552efc5:     	cmpq	%r8, 0x8(%r9,%r14)
14552efca:     	seta	%bpl
14552efce:     	movzbl	(%r9,%r14), %r14d
14552efd3:     	xorl	%r15d, %r15d
14552efd6:     	cmpb	$0x8, %r14b
14552efda:     	setae	%r15b
14552efde:     	cmpb	$0x7, %r14b
14552efe2:     	cmovel	%ebp, %r15d
14552efe6:     	testb	%r15b, %r15b
14552efe9:     	cmovneq	%rdi, %r11
14552efed:     	subq	%rbx, %rsi
14552eff0:     	cmpq	$0x1, %rsi
14552eff4:     	ja	0x14552efb0 <.text+0x552dfb0>
14552eff6:     	shlq	$0x4, %r11
14552effa:     	cmpb	$0x7, (%r9,%r11)
14552efff:     	sete	%bl
14552f002:     	cmpq	%r8, 0x8(%r9,%r11)
14552f007:     	sete	%r11b
14552f00b:     	andb	%bl, %r11b
14552f00e:     	movzbl	%r11b, %r11d
14552f012:     	addq	%r11, %r10
14552f015:     	xorl	%r11d, %r11d
14552f018:     	movq	%rcx, %rsi
14552f01b:     	nopl	(%rax,%rax)
14552f020:     	movq	%r11, %rdi
14552f023:     	movq	%rsi, %rbx
14552f026:     	shrq	%rbx
14552f029:     	addq	%rbx, %r11
14552f02c:     	movq	%r11, %r14
14552f02f:     	shlq	$0x4, %r14
14552f033:     	xorl	%ebp, %ebp
14552f035:     	cmpq	%r8, 0x8(%r9,%r14)
14552f03a:     	seta	%bpl
14552f03e:     	movzbl	(%r9,%r14), %r14d
14552f043:     	xorl	%r15d, %r15d
14552f046:     	cmpb	$0x9, %r14b
14552f04a:     	setae	%r15b
14552f04e:     	cmpb	$0x8, %r14b
14552f052:     	cmovel	%ebp, %r15d
14552f056:     	testb	%r15b, %r15b
14552f059:     	cmovneq	%rdi, %r11
14552f05d:     	subq	%rbx, %rsi
14552f060:     	cmpq	$0x1, %rsi
14552f064:     	ja	0x14552f020 <.text+0x552e020>
14552f066:     	shlq	$0x4, %r11
14552f06a:     	cmpb	$0x8, (%r9,%r11)
14552f06f:     	sete	%bl
14552f072:     	cmpq	%r8, 0x8(%r9,%r11)
14552f077:     	sete	%r11b
14552f07b:     	andb	%bl, %r11b
14552f07e:     	movzbl	%r11b, %r11d
14552f082:     	addq	%r11, %r10
14552f085:     	xorl	%r11d, %r11d
14552f088:     	movq	%rcx, %rsi
14552f08b:     	nopl	(%rax,%rax)
14552f090:     	movq	%r11, %rdi
14552f093:     	movq	%rsi, %rbx
14552f096:     	shrq	%rbx
14552f099:     	addq	%rbx, %r11
14552f09c:     	movq	%r11, %r14
14552f09f:     	shlq	$0x4, %r14
14552f0a3:     	xorl	%ebp, %ebp
14552f0a5:     	cmpq	%r8, 0x8(%r9,%r14)
14552f0aa:     	seta	%bpl
14552f0ae:     	movzbl	(%r9,%r14), %r14d
14552f0b3:     	xorl	%r15d, %r15d
14552f0b6:     	cmpb	$0xa, %r14b
14552f0ba:     	setae	%r15b
14552f0be:     	cmpb	$0x9, %r14b
14552f0c2:     	cmovel	%ebp, %r15d
14552f0c6:     	testb	%r15b, %r15b
14552f0c9:     	cmovneq	%rdi, %r11
14552f0cd:     	subq	%rbx, %rsi
14552f0d0:     	cmpq	$0x1, %rsi
14552f0d4:     	ja	0x14552f090 <.text+0x552e090>
14552f0d6:     	shlq	$0x4, %r11
14552f0da:     	cmpb	$0x9, (%r9,%r11)
14552f0df:     	sete	%bl
14552f0e2:     	cmpq	%r8, 0x8(%r9,%r11)
14552f0e7:     	sete	%r11b
14552f0eb:     	andb	%bl, %r11b
14552f0ee:     	movzbl	%r11b, %r11d
14552f0f2:     	addq	%r11, %r10
14552f0f5:     	xorl	%r11d, %r11d
14552f0f8:     	nopl	(%rax,%rax)
14552f100:     	movq	%r11, %rsi
14552f103:     	movq	%rcx, %rdi
14552f106:     	shrq	%rdi
14552f109:     	addq	%rdi, %r11
14552f10c:     	movq	%r11, %rbx
14552f10f:     	shlq	$0x4, %rbx
14552f113:     	xorl	%ebp, %ebp
14552f115:     	cmpq	%r8, 0x8(%r9,%rbx)
14552f11a:     	seta	%bpl
14552f11e:     	movzbl	(%r9,%rbx), %ebx
14552f123:     	xorl	%r14d, %r14d
14552f126:     	cmpb	$0xc, %bl
14552f129:     	setae	%r14b
14552f12d:     	cmpb	$0xb, %bl
14552f130:     	cmovel	%ebp, %r14d
14552f134:     	testb	%r14b, %r14b
14552f137:     	cmovneq	%rsi, %r11
14552f13b:     	subq	%rdi, %rcx
14552f13e:     	cmpq	$0x1, %rcx
14552f142:     	ja	0x14552f100 <.text+0x552e100>
14552f144:     	shlq	$0x4, %r11
14552f148:     	cmpb	$0xb, (%r9,%r11)
14552f14d:     	sete	%cl
14552f150:     	cmpq	%r8, 0x8(%r9,%r11)
14552f155:     	sete	%r8b
14552f159:     	andb	%cl, %r8b
14552f15c:     	movzbl	%r8b, %ecx
14552f160:     	addq	%r10, %rcx
14552f163:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552f168:     	addl	$-0x2, %r10d
14552f16c:     	jmp	0x14552f171 <.text+0x552e171>
14552f16e:     	decl	%r10d
14552f171:     	xorl	%ecx, %ecx
14552f173:     	cmpl	$0x33, %r10d
14552f177:     	setae	%cl
14552f17a:     	xorl	%r10d, %r10d
14552f17d:     	xorl	%r11d, %r11d
14552f180:     	cmpq	%r11, %r9
14552f183:     	je	0x14552f199 <.text+0x552e199>
14552f185:     	leaq	0x20(%r11), %rsi
14552f189:     	cmpb	$0x2, 0x4(%r8,%r11)
14552f18f:     	movq	%rsi, %r11
14552f192:     	jne	0x14552f180 <.text+0x552e180>
14552f194:     	movl	-0x20(%r8,%rsi), %r10d
14552f199:     	movl	$0x6e, %esi
14552f19e:     	movl	$0x2, %r11d
14552f1a4:     	nopw	%cs:(%rax,%rax)
14552f1b0:     	leal	-0x1e(%rsi), %edi
14552f1b3:     	subl	%edi, %r10d
14552f1b6:     	jb	0x14552f1dc <.text+0x552e1dc>
14552f1b8:     	leal	-0xf(%rsi), %edi
14552f1bb:     	subl	%edi, %r10d
14552f1be:     	jb	0x14552f1e2 <.text+0x552e1e2>
14552f1c0:     	subl	%esi, %r10d
14552f1c3:     	jb	0x14552f1e5 <.text+0x552e1e5>
14552f1c5:     	addl	$0x2d, %esi
14552f1c8:     	addl	$0x3, %r11d
14552f1cc:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f1d2:     	jne	0x14552f1b0 <.text+0x552e1b0>
14552f1d4:     	movl	$0x33, %r11d
14552f1da:     	jmp	0x14552f1e5 <.text+0x552e1e5>
14552f1dc:     	addl	$-0x2, %r11d
14552f1e0:     	jmp	0x14552f1e5 <.text+0x552e1e5>
14552f1e2:     	decl	%r11d
14552f1e5:     	cmpl	$0x33, %r11d
14552f1e9:     	sbbq	$-0x1, %rcx
14552f1ed:     	xorl	%r10d, %r10d
14552f1f0:     	xorl	%r11d, %r11d
14552f1f3:     	nopw	%cs:(%rax,%rax)
14552f200:     	cmpq	%r11, %r9
14552f203:     	je	0x14552f219 <.text+0x552e219>
14552f205:     	leaq	0x20(%r11), %rsi
14552f209:     	cmpb	$0x3, 0x4(%r8,%r11)
14552f20f:     	movq	%rsi, %r11
14552f212:     	jne	0x14552f200 <.text+0x552e200>
14552f214:     	movl	-0x20(%r8,%rsi), %r10d
14552f219:     	movl	$0x6e, %esi
14552f21e:     	movl	$0x2, %r11d
14552f224:     	nopw	%cs:(%rax,%rax)
14552f230:     	leal	-0x1e(%rsi), %edi
14552f233:     	subl	%edi, %r10d
14552f236:     	jb	0x14552f25c <.text+0x552e25c>
14552f238:     	leal	-0xf(%rsi), %edi
14552f23b:     	subl	%edi, %r10d
14552f23e:     	jb	0x14552f262 <.text+0x552e262>
14552f240:     	subl	%esi, %r10d
14552f243:     	jb	0x14552f265 <.text+0x552e265>
14552f245:     	addl	$0x2d, %esi
14552f248:     	addl	$0x3, %r11d
14552f24c:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f252:     	jne	0x14552f230 <.text+0x552e230>
14552f254:     	movl	$0x33, %r11d
14552f25a:     	jmp	0x14552f265 <.text+0x552e265>
14552f25c:     	addl	$-0x2, %r11d
14552f260:     	jmp	0x14552f265 <.text+0x552e265>
14552f262:     	decl	%r11d
14552f265:     	cmpl	$0x33, %r11d
14552f269:     	sbbq	$-0x1, %rcx
14552f26d:     	xorl	%r10d, %r10d
14552f270:     	xorl	%r11d, %r11d
14552f273:     	nopw	%cs:(%rax,%rax)
14552f280:     	cmpq	%r11, %r9
14552f283:     	je	0x14552f299 <.text+0x552e299>
14552f285:     	leaq	0x20(%r11), %rsi
14552f289:     	cmpb	$0x4, 0x4(%r8,%r11)
14552f28f:     	movq	%rsi, %r11
14552f292:     	jne	0x14552f280 <.text+0x552e280>
14552f294:     	movl	-0x20(%r8,%rsi), %r10d
14552f299:     	movl	$0x6e, %esi
14552f29e:     	movl	$0x2, %r11d
14552f2a4:     	nopw	%cs:(%rax,%rax)
14552f2b0:     	leal	-0x1e(%rsi), %edi
14552f2b3:     	subl	%edi, %r10d
14552f2b6:     	jb	0x14552f2dc <.text+0x552e2dc>
14552f2b8:     	leal	-0xf(%rsi), %edi
14552f2bb:     	subl	%edi, %r10d
14552f2be:     	jb	0x14552f2e2 <.text+0x552e2e2>
14552f2c0:     	subl	%esi, %r10d
14552f2c3:     	jb	0x14552f2e5 <.text+0x552e2e5>
14552f2c5:     	addl	$0x2d, %esi
14552f2c8:     	addl	$0x3, %r11d
14552f2cc:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f2d2:     	jne	0x14552f2b0 <.text+0x552e2b0>
14552f2d4:     	movl	$0x33, %r11d
14552f2da:     	jmp	0x14552f2e5 <.text+0x552e2e5>
14552f2dc:     	addl	$-0x2, %r11d
14552f2e0:     	jmp	0x14552f2e5 <.text+0x552e2e5>
14552f2e2:     	decl	%r11d
14552f2e5:     	cmpl	$0x33, %r11d
14552f2e9:     	sbbq	$-0x1, %rcx
14552f2ed:     	xorl	%r10d, %r10d
14552f2f0:     	xorl	%r11d, %r11d
14552f2f3:     	nopw	%cs:(%rax,%rax)
14552f300:     	cmpq	%r11, %r9
14552f303:     	je	0x14552f319 <.text+0x552e319>
14552f305:     	leaq	0x20(%r11), %rsi
14552f309:     	cmpb	$0x5, 0x4(%r8,%r11)
14552f30f:     	movq	%rsi, %r11
14552f312:     	jne	0x14552f300 <.text+0x552e300>
14552f314:     	movl	-0x20(%r8,%rsi), %r10d
14552f319:     	movl	$0x6e, %esi
14552f31e:     	movl	$0x2, %r11d
14552f324:     	nopw	%cs:(%rax,%rax)
14552f330:     	leal	-0x1e(%rsi), %edi
14552f333:     	subl	%edi, %r10d
14552f336:     	jb	0x14552f35c <.text+0x552e35c>
14552f338:     	leal	-0xf(%rsi), %edi
14552f33b:     	subl	%edi, %r10d
14552f33e:     	jb	0x14552f362 <.text+0x552e362>
14552f340:     	subl	%esi, %r10d
14552f343:     	jb	0x14552f365 <.text+0x552e365>
14552f345:     	addl	$0x2d, %esi
14552f348:     	addl	$0x3, %r11d
14552f34c:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f352:     	jne	0x14552f330 <.text+0x552e330>
14552f354:     	movl	$0x33, %r11d
14552f35a:     	jmp	0x14552f365 <.text+0x552e365>
14552f35c:     	addl	$-0x2, %r11d
14552f360:     	jmp	0x14552f365 <.text+0x552e365>
14552f362:     	decl	%r11d
14552f365:     	cmpl	$0x33, %r11d
14552f369:     	sbbq	$-0x1, %rcx
14552f36d:     	xorl	%r10d, %r10d
14552f370:     	xorl	%r11d, %r11d
14552f373:     	nopw	%cs:(%rax,%rax)
14552f380:     	cmpq	%r11, %r9
14552f383:     	je	0x14552f399 <.text+0x552e399>
14552f385:     	leaq	0x20(%r11), %rsi
14552f389:     	cmpb	$0x7, 0x4(%r8,%r11)
14552f38f:     	movq	%rsi, %r11
14552f392:     	jne	0x14552f380 <.text+0x552e380>
14552f394:     	movl	-0x20(%r8,%rsi), %r10d
14552f399:     	movl	$0x6e, %esi
14552f39e:     	movl	$0x2, %r11d
14552f3a4:     	nopw	%cs:(%rax,%rax)
14552f3b0:     	leal	-0x1e(%rsi), %edi
14552f3b3:     	subl	%edi, %r10d
14552f3b6:     	jb	0x14552f3dc <.text+0x552e3dc>
14552f3b8:     	leal	-0xf(%rsi), %edi
14552f3bb:     	subl	%edi, %r10d
14552f3be:     	jb	0x14552f3e2 <.text+0x552e3e2>
14552f3c0:     	subl	%esi, %r10d
14552f3c3:     	jb	0x14552f3e5 <.text+0x552e3e5>
14552f3c5:     	addl	$0x2d, %esi
14552f3c8:     	addl	$0x3, %r11d
14552f3cc:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f3d2:     	jne	0x14552f3b0 <.text+0x552e3b0>
14552f3d4:     	movl	$0x33, %r11d
14552f3da:     	jmp	0x14552f3e5 <.text+0x552e3e5>
14552f3dc:     	addl	$-0x2, %r11d
14552f3e0:     	jmp	0x14552f3e5 <.text+0x552e3e5>
14552f3e2:     	decl	%r11d
14552f3e5:     	cmpl	$0x33, %r11d
14552f3e9:     	sbbq	$-0x1, %rcx
14552f3ed:     	xorl	%r10d, %r10d
14552f3f0:     	xorl	%r11d, %r11d
14552f3f3:     	nopw	%cs:(%rax,%rax)
14552f400:     	cmpq	%r11, %r9
14552f403:     	je	0x14552f419 <.text+0x552e419>
14552f405:     	leaq	0x20(%r11), %rsi
14552f409:     	cmpb	$0x8, 0x4(%r8,%r11)
14552f40f:     	movq	%rsi, %r11
14552f412:     	jne	0x14552f400 <.text+0x552e400>
14552f414:     	movl	-0x20(%r8,%rsi), %r10d
14552f419:     	movl	$0x6e, %esi
14552f41e:     	movl	$0x2, %r11d
14552f424:     	nopw	%cs:(%rax,%rax)
14552f430:     	leal	-0x1e(%rsi), %edi
14552f433:     	subl	%edi, %r10d
14552f436:     	jb	0x14552f45c <.text+0x552e45c>
14552f438:     	leal	-0xf(%rsi), %edi
14552f43b:     	subl	%edi, %r10d
14552f43e:     	jb	0x14552f462 <.text+0x552e462>
14552f440:     	subl	%esi, %r10d
14552f443:     	jb	0x14552f465 <.text+0x552e465>
14552f445:     	addl	$0x2d, %esi
14552f448:     	addl	$0x3, %r11d
14552f44c:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f452:     	jne	0x14552f430 <.text+0x552e430>
14552f454:     	movl	$0x33, %r11d
14552f45a:     	jmp	0x14552f465 <.text+0x552e465>
14552f45c:     	addl	$-0x2, %r11d
14552f460:     	jmp	0x14552f465 <.text+0x552e465>
14552f462:     	decl	%r11d
14552f465:     	cmpl	$0x33, %r11d
14552f469:     	sbbq	$-0x1, %rcx
14552f46d:     	xorl	%r10d, %r10d
14552f470:     	xorl	%r11d, %r11d
14552f473:     	nopw	%cs:(%rax,%rax)
14552f480:     	cmpq	%r11, %r9
14552f483:     	je	0x14552f499 <.text+0x552e499>
14552f485:     	leaq	0x20(%r11), %rsi
14552f489:     	cmpb	$0x9, 0x4(%r8,%r11)
14552f48f:     	movq	%rsi, %r11
14552f492:     	jne	0x14552f480 <.text+0x552e480>
14552f494:     	movl	-0x20(%r8,%rsi), %r10d
14552f499:     	movl	$0x6e, %esi
14552f49e:     	movl	$0x2, %r11d
14552f4a4:     	nopw	%cs:(%rax,%rax)
14552f4b0:     	leal	-0x1e(%rsi), %edi
14552f4b3:     	subl	%edi, %r10d
14552f4b6:     	jb	0x14552f4dc <.text+0x552e4dc>
14552f4b8:     	leal	-0xf(%rsi), %edi
14552f4bb:     	subl	%edi, %r10d
14552f4be:     	jb	0x14552f4e2 <.text+0x552e4e2>
14552f4c0:     	subl	%esi, %r10d
14552f4c3:     	jb	0x14552f4e5 <.text+0x552e4e5>
14552f4c5:     	addl	$0x2d, %esi
14552f4c8:     	addl	$0x3, %r11d
14552f4cc:     	cmpl	$0x36b, %esi            # imm = 0x36B
14552f4d2:     	jne	0x14552f4b0 <.text+0x552e4b0>
14552f4d4:     	movl	$0x33, %r11d
14552f4da:     	jmp	0x14552f4e5 <.text+0x552e4e5>
14552f4dc:     	addl	$-0x2, %r11d
14552f4e0:     	jmp	0x14552f4e5 <.text+0x552e4e5>
14552f4e2:     	decl	%r11d
14552f4e5:     	cmpl	$0x33, %r11d
14552f4e9:     	sbbq	$-0x1, %rcx
14552f4ed:     	xorl	%r10d, %r10d
14552f4f0:     	xorl	%r11d, %r11d
14552f4f3:     	nopw	%cs:(%rax,%rax)
14552f500:     	cmpq	%r11, %r9
14552f503:     	je	0x14552f519 <.text+0x552e519>
14552f505:     	leaq	0x20(%r11), %rsi
14552f509:     	cmpb	$0xb, 0x4(%r8,%r11)
14552f50f:     	movq	%rsi, %r11
14552f512:     	jne	0x14552f500 <.text+0x552e500>
14552f514:     	movl	-0x20(%r8,%rsi), %r10d
14552f519:     	movl	$0x6e, %r9d
14552f51f:     	movl	$0x2, %r8d
14552f525:     	nopw	%cs:(%rax,%rax)
14552f530:     	leal	-0x1e(%r9), %r11d
14552f534:     	subl	%r11d, %r10d
14552f537:     	jb	0x14552f560 <.text+0x552e560>
14552f539:     	leal	-0xf(%r9), %r11d
14552f53d:     	subl	%r11d, %r10d
14552f540:     	jb	0x14552f566 <.text+0x552e566>
14552f542:     	subl	%r9d, %r10d
14552f545:     	jb	0x14552f569 <.text+0x552e569>
14552f547:     	addl	$0x2d, %r9d
14552f54b:     	addl	$0x3, %r8d
14552f54f:     	cmpl	$0x36b, %r9d            # imm = 0x36B
14552f556:     	jne	0x14552f530 <.text+0x552e530>
14552f558:     	movl	$0x33, %r8d
14552f55e:     	jmp	0x14552f569 <.text+0x552e569>
14552f560:     	addl	$-0x2, %r8d
14552f564:     	jmp	0x14552f569 <.text+0x552e569>
14552f566:     	decl	%r8d
14552f569:     	cmpl	$0x33, %r8d
14552f56d:     	sbbq	$-0x1, %rcx
14552f571:     	jmp	0x14552f5d5 <.text+0x552e5d5>
14552f573:     	xorl	%r10d, %r10d
14552f576:     	cmpq	$0x1, %r9
14552f57a:     	je	0x14552f5b7 <.text+0x552e5b7>
14552f57c:     	movq	%r10, %r11
14552f57f:     	movq	%r9, %rsi
14552f582:     	shrq	%rsi
14552f585:     	addq	%rsi, %r10
14552f588:     	movq	%r10, %rdi
14552f58b:     	shlq	$0x4, %rdi
14552f58f:     	xorl	%ebx, %ebx
14552f591:     	cmpq	$0xc, 0x8(%rcx,%rdi)
14552f597:     	setae	%bl
14552f59a:     	xorl	%ebp, %ebp
14552f59c:     	cmpb	%r8b, (%rcx,%rdi)
14552f5a0:     	seta	%bpl
14552f5a4:     	cmovel	%ebx, %ebp
14552f5a7:     	testb	%bpl, %bpl
14552f5aa:     	cmovneq	%r11, %r10
14552f5ae:     	subq	%rsi, %r9
14552f5b1:     	cmpq	$0x1, %r9
14552f5b5:     	ja	0x14552f57c <.text+0x552e57c>
14552f5b7:     	shlq	$0x4, %r10
14552f5bb:     	cmpb	%r8b, (%rcx,%r10)
14552f5bf:     	jne	0x14552f5ce <.text+0x552e5ce>
14552f5c1:     	cmpq	$0xb, 0x8(%rcx,%r10)
14552f5c7:     	movl	$0x1, %ecx
14552f5cc:     	je	0x14552f5d5 <.text+0x552e5d5>
14552f5ce:     	movl	$0x1, %edx
14552f5d3:     	xorl	%ecx, %ecx
14552f5d5:     	movq	%rcx, 0x8(%rax)
14552f5d9:     	movq	%rdx, 0x10(%rax)
14552f5dd:     	movl	$0x1, %ecx
14552f5e2:     	movq	%rcx, (%rax)
14552f5e5:     	addq	$0xc8, %rsp
14552f5ec:     	popq	%rbx
14552f5ed:     	popq	%rbp
14552f5ee:     	popq	%rdi
14552f5ef:     	popq	%rsi
14552f5f0:     	popq	%r14
14552f5f2:     	popq	%r15
14552f5f4:     	retq
