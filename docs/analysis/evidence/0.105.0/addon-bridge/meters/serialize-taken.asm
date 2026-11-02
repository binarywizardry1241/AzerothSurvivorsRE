
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458ec300:     	pushq	%rbp
1458ec301:     	pushq	%r15
1458ec303:     	pushq	%r14
1458ec305:     	pushq	%rsi
1458ec306:     	pushq	%rdi
1458ec307:     	pushq	%rbx
1458ec308:     	subq	$0xd8, %rsp
1458ec30f:     	leaq	0x80(%rsp), %rbp
1458ec317:     	movq	$-0x2, 0x50(%rbp)
1458ec31f:     	movq	%rcx, %rsi
1458ec322:     	movq	0x6d0(%rdx), %rax
1458ec329:     	movq	0x6d8(%rdx), %rcx
1458ec330:     	xorl	%r8d, %r8d
1458ec333:     	movq	%rax, %r9
1458ec336:     	testq	%rax, %rax
1458ec339:     	setne	%r8b
1458ec33d:     	je	0x1458ec346 <.text+0x58eb346>
1458ec33f:     	movq	0x6e0(%rdx), %r9
1458ec346:     	movq	%r8, -0x20(%rbp)
1458ec34a:     	movq	$0x0, -0x18(%rbp)
1458ec352:     	movq	%rax, -0x10(%rbp)
1458ec356:     	movq	%rcx, -0x8(%rbp)
1458ec35a:     	movq	%r8, (%rbp)
1458ec35e:     	movq	$0x0, 0x8(%rbp)
1458ec366:     	movq	%rax, 0x10(%rbp)
1458ec36a:     	movq	%rcx, 0x18(%rbp)
1458ec36e:     	movq	%r9, 0x20(%rbp)
1458ec372:     	leaq	-0x38(%rbp), %rcx
1458ec376:     	leaq	-0x20(%rbp), %rdx
1458ec37a:     	callq	0x14599e230 <.text+0x599d230>
1458ec37f:     	movq	-0x30(%rbp), %r15
1458ec383:     	movq	-0x28(%rbp), %rdi
1458ec387:     	leaq	0x4f(%rbp), %rax
1458ec38b:     	movq	%rax, -0x20(%rbp)
1458ec38f:     	cmpq	$0x2, %rdi
1458ec393:     	movq	%r15, 0x40(%rbp)
1458ec397:     	jae	0x1458ec3d0 <.text+0x58eb3d0>
1458ec399:     	leaq	(,%rdi,8), %rax
1458ec3a1:     	leaq	(%rax,%rax,2), %rbx
1458ec3a5:     	testq	%rbx, %rbx
1458ec3a8:     	je	0x1458ec436 <.text+0x58eb436>
1458ec3ae:     	callq	0x140002200 <.text+0x1200>
1458ec3b3:     	movl	$0x8, %r14d
1458ec3b9:     	movl	$0x8, %edx
1458ec3be:     	movq	%rbx, %rcx
1458ec3c1:     	callq	0x1400021c0 <.text+0x11c0>
1458ec3c6:     	testq	%rax, %rax
1458ec3c9:     	je	0x1458ec41b <.text+0x58eb41b>
1458ec3cb:     	movq	%rdi, %rcx
1458ec3ce:     	jmp	0x1458ec43d <.text+0x58eb43d>
1458ec3d0:     	cmpq	$0x15, %rdi
1458ec3d4:     	jae	0x1458ec3ed <.text+0x58eb3ed>
1458ec3d6:     	leaq	-0x20(%rbp), %r9
1458ec3da:     	movl	$0x1, %r8d
1458ec3e0:     	movq	%r15, %rcx
1458ec3e3:     	movq	%rdi, %rdx
1458ec3e6:     	callq	0x145981f70 <.text+0x5980f70>
1458ec3eb:     	jmp	0x1458ec399 <.text+0x58eb399>
1458ec3ed:     	leaq	-0x20(%rbp), %r8
1458ec3f1:     	movq	%r15, %rcx
1458ec3f4:     	movq	%rdi, %rdx
1458ec3f7:     	callq	0x145988210 <.text+0x5987210>
1458ec3fc:     	nop
1458ec3fd:     	leaq	(,%rdi,8), %rax
1458ec405:     	leaq	(%rax,%rax,2), %rbx
1458ec409:     	movabsq	$0x555555555555555, %rax # imm = 0x555555555555555
1458ec413:     	cmpq	%rax, %rdi
1458ec416:     	jbe	0x1458ec429 <.text+0x58eb429>
1458ec418:     	xorl	%r14d, %r14d
1458ec41b:     	movq	%r14, %rcx
1458ec41e:     	movq	%rbx, %rdx
1458ec421:     	callq	0x145d6944b <.text+0x5d6844b>
1458ec426:     	nop
1458ec427:     	ud2
1458ec429:     	movq	0x40(%rbp), %r15
1458ec42d:     	testq	%rbx, %rbx
1458ec430:     	jne	0x1458ec3ae <.text+0x58eb3ae>
1458ec436:     	movl	$0x8, %eax
1458ec43b:     	xorl	%ecx, %ecx
1458ec43d:     	shlq	$0x4, %rdi
1458ec441:     	addq	%r15, %rdi
1458ec444:     	movq	%rcx, 0x28(%rbp)
1458ec448:     	movq	%rax, 0x30(%rbp)
1458ec44c:     	leaq	0x38(%rbp), %rcx
1458ec450:     	movq	$0x0, 0x38(%rbp)
1458ec458:     	movq	%rax, -0x10(%rbp)
1458ec45c:     	movq	%rcx, -0x20(%rbp)
1458ec460:     	movq	$0x0, -0x18(%rbp)
1458ec468:     	leaq	-0x20(%rbp), %r8
1458ec46c:     	movq	%r15, %rcx
1458ec46f:     	movq	%rdi, %rdx
1458ec472:     	callq	0x1459b98d0 <.text+0x59b88d0>
1458ec477:     	nop
1458ec478:     	movups	0x28(%rbp), %xmm0
1458ec47c:     	movaps	%xmm0, -0x50(%rbp)
1458ec480:     	movq	0x38(%rbp), %rbx
1458ec484:     	movq	%rbx, -0x40(%rbp)
1458ec488:     	movq	-0x48(%rbp), %rdi
1458ec48c:     	movq	$0x1, 0x20(%rsp)
1458ec495:     	leaq	0x158c6f8(%rip), %r9    # 0x146e78b94
1458ec49c:     	leaq	-0x20(%rbp), %rcx
1458ec4a0:     	movq	%rdi, %rdx
1458ec4a3:     	movq	%rbx, %r8
1458ec4a6:     	callq	0x1458b82d0 <.text+0x58b72d0>
1458ec4ab:     	nop
1458ec4ac:     	movq	-0x10(%rbp), %rax
1458ec4b0:     	movq	%rax, 0x10(%rsi)
1458ec4b4:     	movups	-0x20(%rbp), %xmm0
1458ec4b8:     	movups	%xmm0, (%rsi)
1458ec4bb:     	movq	-0x38(%rbp), %rdx
1458ec4bf:     	testq	%rdx, %rdx
1458ec4c2:     	movq	0x40(%rbp), %rcx
1458ec4c6:     	je	0x1458ec4d7 <.text+0x58eb4d7>
1458ec4c8:     	shlq	$0x4, %rdx
1458ec4cc:     	movl	$0x8, %r8d
1458ec4d2:     	callq	0x1400021d0 <.text+0x11d0>
1458ec4d7:     	testq	%rbx, %rbx
1458ec4da:     	je	0x1458ec512 <.text+0x58eb512>
1458ec4dc:     	leaq	0x8(%rdi), %r14
1458ec4e0:     	jmp	0x1458ec4f9 <.text+0x58eb4f9>
1458ec4e2:     	nopw	%cs:(%rax,%rax)
1458ec4f0:     	addq	$0x18, %r14
1458ec4f4:     	decq	%rbx
1458ec4f7:     	je	0x1458ec512 <.text+0x58eb512>
1458ec4f9:     	movq	-0x8(%r14), %rdx
1458ec4fd:     	testq	%rdx, %rdx
1458ec500:     	je	0x1458ec4f0 <.text+0x58eb4f0>
1458ec502:     	movq	(%r14), %rcx
1458ec505:     	movl	$0x1, %r8d
1458ec50b:     	callq	0x1400021d0 <.text+0x11d0>
1458ec510:     	jmp	0x1458ec4f0 <.text+0x58eb4f0>
1458ec512:     	movq	-0x50(%rbp), %rax
1458ec516:     	testq	%rax, %rax
1458ec519:     	je	0x1458ec531 <.text+0x58eb531>
1458ec51b:     	shlq	$0x3, %rax
1458ec51f:     	leaq	(%rax,%rax,2), %rdx
1458ec523:     	movl	$0x8, %r8d
1458ec529:     	movq	%rdi, %rcx
1458ec52c:     	callq	0x1400021d0 <.text+0x11d0>
1458ec531:     	movq	%rsi, %rax
1458ec534:     	addq	$0xd8, %rsp
1458ec53b:     	popq	%rbx
1458ec53c:     	popq	%rdi
1458ec53d:     	popq	%rsi
1458ec53e:     	popq	%r14
1458ec540:     	popq	%r15
1458ec542:     	popq	%rbp
1458ec543:     	retq
