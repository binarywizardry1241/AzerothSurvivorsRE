
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bd260:     	pushq	%r14
1458bd262:     	pushq	%rsi
1458bd263:     	pushq	%rdi
1458bd264:     	pushq	%rbp
1458bd265:     	pushq	%rbx
1458bd266:     	subq	$0x90, %rsp
1458bd26d:     	movq	%r9, %rdi
1458bd270:     	movl	%edx, %ebx
1458bd272:     	movq	%rcx, %rsi
1458bd275:     	movq	0xe0(%rsp), %r14
1458bd27d:     	callq	0x1458bc9d0 <.text+0x58bb9d0>
1458bd282:     	addb	$-0x2, %bl
1458bd285:     	cmpb	$0x7, %bl
1458bd288:     	setb	%al
1458bd28b:     	movb	$0x59, %dl
1458bd28d:     	movl	%ebx, %ecx
1458bd28f:     	shrb	%cl, %dl
1458bd291:     	andb	%al, %dl
1458bd293:     	cmpb	$0x1, %dl
1458bd296:     	jne	0x1458bd3a9 <.text+0x58bc3a9>
1458bd29c:     	xorl	%eax, %eax
1458bd29e:     	movl	$0xcccccccd, %ecx       # imm = 0xCCCCCCCD
1458bd2a3:     	jmp	0x1458bd2c0 <.text+0x58bc2c0>
1458bd2a5:     	nopw	%cs:(%rax,%rax)
1458bd2b0:     	movl	%edx, (%rsi,%rax,4)
1458bd2b3:     	incq	%rax
1458bd2b6:     	cmpq	$0x13, %rax
1458bd2ba:     	je	0x1458bd57f <.text+0x58bc57f>
1458bd2c0:     	movl	(%rdi,%rax,4), %edx
1458bd2c3:     	testl	%edx, %edx
1458bd2c5:     	je	0x1458bd32b <.text+0x58bc32b>
1458bd2c7:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
1458bd2cd:     	jb	0x1458bd328 <.text+0x58bc328>
1458bd2cf:     	leal	-0x186a0(%rdx), %r8d
1458bd2d6:     	cmpl	$0x2edf, %r8d           # imm = 0x2EDF
1458bd2dd:     	ja	0x1458bd328 <.text+0x58bc328>
1458bd2df:     	movq	%r8, %r9
1458bd2e2:     	imulq	%rcx, %r9
1458bd2e6:     	shrq	$0x23, %r9
1458bd2ea:     	addl	%r9d, %r9d
1458bd2ed:     	leal	(%r9,%r9,4), %r9d
1458bd2f1:     	movl	%r8d, %r10d
1458bd2f4:     	subl	%r9d, %r10d
1458bd2f7:     	jne	0x1458bd328 <.text+0x58bc328>
1458bd2f9:     	imull	$0xcccd, %r8d, %r8d     # imm = 0xCCCD
1458bd300:     	shrl	$0x13, %r8d
1458bd304:     	imull	$0xffffcccd, %r8d, %r8d # imm = 0xFFFFCCCD
1458bd30b:     	decl	%r8d
1458bd30e:     	rorw	%r8w
1458bd312:     	movzwl	%r8w, %r8d
1458bd316:     	leal	0xa(%rdx), %r9d
1458bd31a:     	cmpl	$0x199a, %r8d           # imm = 0x199A
1458bd321:     	cmovael	%edx, %r9d
1458bd325:     	movl	%r9d, %edx
1458bd328:     	movl	%edx, (%rsi,%rax,4)
1458bd32b:     	cmpl	$0x1, (%r14,%rax,8)
1458bd330:     	jne	0x1458bd2b3 <.text+0x58bc2b3>
1458bd332:     	movl	0x4(%r14,%rax,8), %edx
1458bd337:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
1458bd33d:     	jb	0x1458bd2b0 <.text+0x58bc2b0>
1458bd343:     	leal	-0x186a0(%rdx), %r8d
1458bd34a:     	cmpl	$0x2edf, %r8d           # imm = 0x2EDF
1458bd351:     	ja	0x1458bd2b0 <.text+0x58bc2b0>
1458bd357:     	movq	%r8, %r9
1458bd35a:     	imulq	%rcx, %r9
1458bd35e:     	shrq	$0x23, %r9
1458bd362:     	addl	%r9d, %r9d
1458bd365:     	leal	(%r9,%r9,4), %r9d
1458bd369:     	movl	%r8d, %r10d
1458bd36c:     	subl	%r9d, %r10d
1458bd36f:     	jne	0x1458bd2b0 <.text+0x58bc2b0>
1458bd375:     	imull	$0xcccd, %r8d, %r8d     # imm = 0xCCCD
1458bd37c:     	shrl	$0x13, %r8d
1458bd380:     	imull	$0xffffcccd, %r8d, %r8d # imm = 0xFFFFCCCD
1458bd387:     	decl	%r8d
1458bd38a:     	rorw	%r8w
1458bd38e:     	movzwl	%r8w, %r8d
1458bd392:     	leal	0xa(%rdx), %r9d
1458bd396:     	cmpl	$0x199a, %r8d           # imm = 0x199A
1458bd39d:     	cmovael	%edx, %r9d
1458bd3a1:     	movl	%r9d, %edx
1458bd3a4:     	jmp	0x1458bd2b0 <.text+0x58bc2b0>
1458bd3a9:     	movl	(%rdi), %eax
1458bd3ab:     	testl	%eax, %eax
1458bd3ad:     	je	0x1458bd3b1 <.text+0x58bc3b1>
1458bd3af:     	movl	%eax, (%rsi)
1458bd3b1:     	cmpl	$0x1, (%r14)
1458bd3b5:     	jne	0x1458bd3bd <.text+0x58bc3bd>
1458bd3b7:     	movl	0x4(%r14), %eax
1458bd3bb:     	movl	%eax, (%rsi)
1458bd3bd:     	movl	0x4(%rdi), %eax
1458bd3c0:     	testl	%eax, %eax
1458bd3c2:     	je	0x1458bd3c7 <.text+0x58bc3c7>
1458bd3c4:     	movl	%eax, 0x4(%rsi)
1458bd3c7:     	cmpl	$0x1, 0x8(%r14)
1458bd3cc:     	jne	0x1458bd3d5 <.text+0x58bc3d5>
1458bd3ce:     	movl	0xc(%r14), %eax
1458bd3d2:     	movl	%eax, 0x4(%rsi)
1458bd3d5:     	movl	0x8(%rdi), %eax
1458bd3d8:     	testl	%eax, %eax
1458bd3da:     	je	0x1458bd3df <.text+0x58bc3df>
1458bd3dc:     	movl	%eax, 0x8(%rsi)
1458bd3df:     	cmpl	$0x1, 0x10(%r14)
1458bd3e4:     	jne	0x1458bd3ed <.text+0x58bc3ed>
1458bd3e6:     	movl	0x14(%r14), %eax
1458bd3ea:     	movl	%eax, 0x8(%rsi)
1458bd3ed:     	movl	0xc(%rdi), %eax
1458bd3f0:     	testl	%eax, %eax
1458bd3f2:     	je	0x1458bd3f7 <.text+0x58bc3f7>
1458bd3f4:     	movl	%eax, 0xc(%rsi)
1458bd3f7:     	cmpl	$0x1, 0x18(%r14)
1458bd3fc:     	jne	0x1458bd405 <.text+0x58bc405>
1458bd3fe:     	movl	0x1c(%r14), %eax
1458bd402:     	movl	%eax, 0xc(%rsi)
1458bd405:     	movl	0x10(%rdi), %eax
1458bd408:     	testl	%eax, %eax
1458bd40a:     	je	0x1458bd40f <.text+0x58bc40f>
1458bd40c:     	movl	%eax, 0x10(%rsi)
1458bd40f:     	cmpl	$0x1, 0x20(%r14)
1458bd414:     	jne	0x1458bd41d <.text+0x58bc41d>
1458bd416:     	movl	0x24(%r14), %eax
1458bd41a:     	movl	%eax, 0x10(%rsi)
1458bd41d:     	movl	0x14(%rdi), %eax
1458bd420:     	testl	%eax, %eax
1458bd422:     	je	0x1458bd427 <.text+0x58bc427>
1458bd424:     	movl	%eax, 0x14(%rsi)
1458bd427:     	cmpl	$0x1, 0x28(%r14)
1458bd42c:     	jne	0x1458bd435 <.text+0x58bc435>
1458bd42e:     	movl	0x2c(%r14), %eax
1458bd432:     	movl	%eax, 0x14(%rsi)
1458bd435:     	movl	0x18(%rdi), %eax
1458bd438:     	testl	%eax, %eax
1458bd43a:     	je	0x1458bd43f <.text+0x58bc43f>
1458bd43c:     	movl	%eax, 0x18(%rsi)
1458bd43f:     	cmpl	$0x1, 0x30(%r14)
1458bd444:     	jne	0x1458bd44d <.text+0x58bc44d>
1458bd446:     	movl	0x34(%r14), %eax
1458bd44a:     	movl	%eax, 0x18(%rsi)
1458bd44d:     	movl	0x1c(%rdi), %eax
1458bd450:     	testl	%eax, %eax
1458bd452:     	je	0x1458bd457 <.text+0x58bc457>
1458bd454:     	movl	%eax, 0x1c(%rsi)
1458bd457:     	cmpl	$0x1, 0x38(%r14)
1458bd45c:     	jne	0x1458bd465 <.text+0x58bc465>
1458bd45e:     	movl	0x3c(%r14), %eax
1458bd462:     	movl	%eax, 0x1c(%rsi)
1458bd465:     	movl	0x20(%rdi), %eax
1458bd468:     	testl	%eax, %eax
1458bd46a:     	je	0x1458bd46f <.text+0x58bc46f>
1458bd46c:     	movl	%eax, 0x20(%rsi)
1458bd46f:     	cmpl	$0x1, 0x40(%r14)
1458bd474:     	jne	0x1458bd47d <.text+0x58bc47d>
1458bd476:     	movl	0x44(%r14), %eax
1458bd47a:     	movl	%eax, 0x20(%rsi)
1458bd47d:     	movl	0x24(%rdi), %eax
1458bd480:     	testl	%eax, %eax
1458bd482:     	je	0x1458bd487 <.text+0x58bc487>
1458bd484:     	movl	%eax, 0x24(%rsi)
1458bd487:     	cmpl	$0x1, 0x48(%r14)
1458bd48c:     	jne	0x1458bd495 <.text+0x58bc495>
1458bd48e:     	movl	0x4c(%r14), %eax
1458bd492:     	movl	%eax, 0x24(%rsi)
1458bd495:     	movl	0x28(%rdi), %eax
1458bd498:     	testl	%eax, %eax
1458bd49a:     	je	0x1458bd49f <.text+0x58bc49f>
1458bd49c:     	movl	%eax, 0x28(%rsi)
1458bd49f:     	cmpl	$0x1, 0x50(%r14)
1458bd4a4:     	jne	0x1458bd4ad <.text+0x58bc4ad>
1458bd4a6:     	movl	0x54(%r14), %eax
1458bd4aa:     	movl	%eax, 0x28(%rsi)
1458bd4ad:     	movl	0x2c(%rdi), %eax
1458bd4b0:     	testl	%eax, %eax
1458bd4b2:     	je	0x1458bd4b7 <.text+0x58bc4b7>
1458bd4b4:     	movl	%eax, 0x2c(%rsi)
1458bd4b7:     	cmpl	$0x1, 0x58(%r14)
1458bd4bc:     	jne	0x1458bd4c5 <.text+0x58bc4c5>
1458bd4be:     	movl	0x5c(%r14), %eax
1458bd4c2:     	movl	%eax, 0x2c(%rsi)
1458bd4c5:     	movl	0x30(%rdi), %eax
1458bd4c8:     	testl	%eax, %eax
1458bd4ca:     	je	0x1458bd4cf <.text+0x58bc4cf>
1458bd4cc:     	movl	%eax, 0x30(%rsi)
1458bd4cf:     	cmpl	$0x1, 0x60(%r14)
1458bd4d4:     	jne	0x1458bd4dd <.text+0x58bc4dd>
1458bd4d6:     	movl	0x64(%r14), %eax
1458bd4da:     	movl	%eax, 0x30(%rsi)
1458bd4dd:     	movl	0x34(%rdi), %eax
1458bd4e0:     	testl	%eax, %eax
1458bd4e2:     	je	0x1458bd4e7 <.text+0x58bc4e7>
1458bd4e4:     	movl	%eax, 0x34(%rsi)
1458bd4e7:     	cmpl	$0x1, 0x68(%r14)
1458bd4ec:     	jne	0x1458bd4f5 <.text+0x58bc4f5>
1458bd4ee:     	movl	0x6c(%r14), %eax
1458bd4f2:     	movl	%eax, 0x34(%rsi)
1458bd4f5:     	movl	0x38(%rdi), %eax
1458bd4f8:     	testl	%eax, %eax
1458bd4fa:     	je	0x1458bd4ff <.text+0x58bc4ff>
1458bd4fc:     	movl	%eax, 0x38(%rsi)
1458bd4ff:     	cmpl	$0x1, 0x70(%r14)
1458bd504:     	jne	0x1458bd50d <.text+0x58bc50d>
1458bd506:     	movl	0x74(%r14), %eax
1458bd50a:     	movl	%eax, 0x38(%rsi)
1458bd50d:     	movl	0x3c(%rdi), %eax
1458bd510:     	testl	%eax, %eax
1458bd512:     	je	0x1458bd517 <.text+0x58bc517>
1458bd514:     	movl	%eax, 0x3c(%rsi)
1458bd517:     	cmpl	$0x1, 0x78(%r14)
1458bd51c:     	jne	0x1458bd525 <.text+0x58bc525>
1458bd51e:     	movl	0x7c(%r14), %eax
1458bd522:     	movl	%eax, 0x3c(%rsi)
1458bd525:     	movl	0x40(%rdi), %eax
1458bd528:     	testl	%eax, %eax
1458bd52a:     	je	0x1458bd52f <.text+0x58bc52f>
1458bd52c:     	movl	%eax, 0x40(%rsi)
1458bd52f:     	cmpl	$0x1, 0x80(%r14)
1458bd537:     	jne	0x1458bd543 <.text+0x58bc543>
1458bd539:     	movl	0x84(%r14), %eax
1458bd540:     	movl	%eax, 0x40(%rsi)
1458bd543:     	movl	0x44(%rdi), %eax
1458bd546:     	testl	%eax, %eax
1458bd548:     	je	0x1458bd54d <.text+0x58bc54d>
1458bd54a:     	movl	%eax, 0x44(%rsi)
1458bd54d:     	cmpl	$0x1, 0x88(%r14)
1458bd555:     	jne	0x1458bd561 <.text+0x58bc561>
1458bd557:     	movl	0x8c(%r14), %eax
1458bd55e:     	movl	%eax, 0x44(%rsi)
1458bd561:     	movl	0x48(%rdi), %eax
1458bd564:     	testl	%eax, %eax
1458bd566:     	je	0x1458bd56b <.text+0x58bc56b>
1458bd568:     	movl	%eax, 0x48(%rsi)
1458bd56b:     	cmpl	$0x1, 0x90(%r14)
1458bd573:     	jne	0x1458bd57f <.text+0x58bc57f>
1458bd575:     	movl	0x94(%r14), %eax
1458bd57c:     	movl	%eax, 0x48(%rsi)
1458bd57f:     	movl	0x3c(%rsi), %edx
1458bd582:     	leaq	0x20(%rsp), %rcx
1458bd587:     	callq	0x1458bd6f0 <.text+0x58bc6f0>
1458bd58c:     	movq	0x20(%rsp), %rdx
1458bd591:     	cmpq	$-0x1, %rdx
1458bd595:     	je	0x1458bd5e3 <.text+0x58bc5e3>
1458bd597:     	movq	0x38(%rsp), %rdi
1458bd59c:     	movq	0x40(%rsp), %rbx
1458bd5a1:     	movl	0x80(%rsp), %ebp
1458bd5a8:     	testq	%rdx, %rdx
1458bd5ab:     	je	0x1458bd5bd <.text+0x58bc5bd>
1458bd5ad:     	movq	0x28(%rsp), %rcx
1458bd5b2:     	movl	$0x1, %r8d
1458bd5b8:     	callq	0x1400021d0 <.text+0x11d0>
1458bd5bd:     	testq	%rdi, %rdi
1458bd5c0:     	je	0x1458bd5d7 <.text+0x58bc5d7>
1458bd5c2:     	shlq	$0x3, %rdi
1458bd5c6:     	movl	$0x4, %r8d
1458bd5cc:     	movq	%rbx, %rcx
1458bd5cf:     	movq	%rdi, %rdx
1458bd5d2:     	callq	0x1400021d0 <.text+0x11d0>
1458bd5d7:     	cmpl	$0x11, %ebp
1458bd5da:     	jne	0x1458bd5e3 <.text+0x58bc5e3>
1458bd5dc:     	movl	$0x0, 0x40(%rsi)
1458bd5e3:     	movq	%rsi, %rax
1458bd5e6:     	addq	$0x90, %rsp
1458bd5ed:     	popq	%rbx
1458bd5ee:     	popq	%rbp
1458bd5ef:     	popq	%rdi
1458bd5f0:     	popq	%rsi
1458bd5f1:     	popq	%r14
1458bd5f3:     	retq
