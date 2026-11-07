
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b1260:     	pushq	%rbp
1459b1261:     	pushq	%r15
1459b1263:     	pushq	%r14
1459b1265:     	pushq	%r13
1459b1267:     	pushq	%r12
1459b1269:     	pushq	%rsi
1459b126a:     	pushq	%rdi
1459b126b:     	pushq	%rbx
1459b126c:     	subq	$0xb8, %rsp
1459b1273:     	leaq	0x80(%rsp), %rbp
1459b127b:     	movq	$-0x2, 0x30(%rbp)
1459b1283:     	movq	%rdx, %r8
1459b1286:     	movq	(%rdx), %rdx
1459b1289:     	movq	0x8(%r8), %r9
1459b128d:     	movq	(%rcx), %r12
1459b1290:     	movq	0x8(%rcx), %rax
1459b1294:     	cmpq	%rax, %r12
1459b1297:     	je	0x1459b141f <.text+0x59b041f>
1459b129d:     	movq	%rdx, 0x8(%rbp)
1459b12a1:     	subq	%r12, %rax
1459b12a4:     	movabsq	$-0x7777777777777777, %rdx # imm = 0x8888888888888889
1459b12ae:     	mulq	%rdx
1459b12b1:     	movq	0x20(%r12), %r14
1459b12b6:     	testq	%r14, %r14
1459b12b9:     	js	0x1459b1436 <.text+0x59b0436>
1459b12bf:     	movq	%rdx, %rsi
1459b12c2:     	movq	0x18(%rcx), %r13
1459b12c6:     	movq	0x10(%r8), %rax
1459b12ca:     	movq	0x10(%rcx), %rdi
1459b12ce:     	shrq	$0x7, %rsi
1459b12d2:     	addq	$0x110, %r12            # imm = 0x110
1459b12d9:     	decq	%rsi
1459b12dc:     	addl	$0x1f95, %edi           # imm = 0x1F95
1459b12e2:     	imulq	$0x38, %r9, %rcx
1459b12e6:     	leaq	(%rcx,%rax), %rbx
1459b12ea:     	addq	$0x34, %rbx
1459b12ee:     	leaq	0x1803feb(%rip), %r15   # 0x1471b52e0
1459b12f5:     	testq	%r14, %r14
1459b12f8:     	movq	%r9, 0x20(%rbp)
1459b12fc:     	movq	%r14, 0x10(%rbp)
1459b1300:     	je	0x1459b1350 <.text+0x59b0350>
1459b1302:     	movq	%r13, -0x8(%rbp)
1459b1306:     	movq	%r15, %r13
1459b1309:     	movq	-0xf8(%r12), %r15
1459b1311:     	callq	0x140002200 <.text+0x1200>
1459b1316:     	movl	$0x1, %edx
1459b131b:     	movq	%r14, %rcx
1459b131e:     	callq	0x1400021c0 <.text+0x11c0>
1459b1323:     	testq	%rax, %rax
1459b1326:     	je	0x1459b143a <.text+0x59b043a>
1459b132c:     	movq	%rax, 0x18(%rbp)
1459b1330:     	movq	%rax, %rcx
1459b1333:     	movq	%r15, %rdx
1459b1336:     	movq	%r14, %r8
1459b1339:     	callq	0x145bc977b <.text+0x5bc877b>
1459b133e:     	movq	%r13, %r15
1459b1341:     	movq	-0x8(%rbp), %r13
1459b1345:     	jmp	0x1459b1359 <.text+0x59b0359>
1459b1347:     	nopw	(%rax,%rax)
1459b1350:     	movl	$0x1, %eax
1459b1355:     	movq	%rax, 0x18(%rbp)
1459b1359:     	movw	%di, 0x2e(%rbp)
1459b135d:     	movq	%r15, -0x40(%rbp)
1459b1361:     	leaq	-0x59af2a8(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1459b1368:     	movq	%rax, -0x38(%rbp)
1459b136c:     	leaq	0x2e(%rbp), %rax
1459b1370:     	movq	%rax, -0x30(%rbp)
1459b1374:     	leaq	0x1fbf45(%rip), %rax    # 0x145bad2c0 <.text+0x5bac2c0>
1459b137b:     	movq	%rax, -0x28(%rbp)
1459b137f:     	leaq	-0x58(%rbp), %rcx
1459b1383:     	leaq	0x1803f66(%rip), %rdx   # 0x1471b52f0
1459b138a:     	leaq	-0x40(%rbp), %r8
1459b138e:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b1393:     	nop
1459b1394:     	movss	-0x30(%r12), %xmm0
1459b139b:     	mulss	%xmm0, %xmm0
1459b139f:     	movzbl	(%r13), %eax
1459b13a4:     	movq	-0x48(%rbp), %rcx
1459b13a8:     	movq	%rcx, -0x10(%rbp)
1459b13ac:     	movups	-0x58(%rbp), %xmm1
1459b13b0:     	movaps	%xmm1, -0x20(%rbp)
1459b13b4:     	movq	0x10(%rbp), %rcx
1459b13b8:     	movq	%rcx, -0x34(%rbx)
1459b13bc:     	movq	0x18(%rbp), %rdx
1459b13c0:     	movq	%rdx, -0x2c(%rbx)
1459b13c4:     	movq	%rcx, -0x24(%rbx)
1459b13c8:     	movaps	-0x20(%rbp), %xmm1
1459b13cc:     	movups	%xmm1, -0x1c(%rbx)
1459b13d0:     	movq	-0x10(%rbp), %rcx
1459b13d4:     	movq	%rcx, -0xc(%rbx)
1459b13d8:     	movss	%xmm0, -0x4(%rbx)
1459b13dd:     	movb	%al, (%rbx)
1459b13df:     	subq	$0x1, %rsi
1459b13e3:     	jb	0x1459b1414 <.text+0x59b0414>
1459b13e5:     	movq	(%r12), %r14
1459b13e9:     	addq	$0xf0, %r12
1459b13f0:     	incl	%edi
1459b13f2:     	addq	$0x38, %rbx
1459b13f6:     	movq	0x20(%rbp), %r9
1459b13fa:     	incq	%r9
1459b13fd:     	testq	%r14, %r14
1459b1400:     	jns	0x1459b12f5 <.text+0x59b02f5>
1459b1406:     	xorl	%ecx, %ecx
1459b1408:     	movq	%r9, (%rbp)
1459b140c:     	callq	0x145d6944b <.text+0x5d6844b>
1459b1411:     	nop
1459b1412:     	ud2
1459b1414:     	movq	0x20(%rbp), %r9
1459b1418:     	incq	%r9
1459b141b:     	movq	0x8(%rbp), %rdx
1459b141f:     	movq	%r9, (%rdx)
1459b1422:     	addq	$0xb8, %rsp
1459b1429:     	popq	%rbx
1459b142a:     	popq	%rdi
1459b142b:     	popq	%rsi
1459b142c:     	popq	%r12
1459b142e:     	popq	%r13
1459b1430:     	popq	%r14
1459b1432:     	popq	%r15
1459b1434:     	popq	%rbp
1459b1435:     	retq
1459b1436:     	xorl	%ecx, %ecx
1459b1438:     	jmp	0x1459b1408 <.text+0x59b0408>
1459b143a:     	movq	%r14, %rdx
1459b143d:     	movl	$0x1, %ecx
1459b1442:     	movq	0x20(%rbp), %r9
1459b1446:     	jmp	0x1459b1408 <.text+0x59b0408>
