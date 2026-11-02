
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544b1a0:     	pushq	%rbp
14544b1a1:     	pushq	%r15
14544b1a3:     	pushq	%r14
14544b1a5:     	pushq	%r13
14544b1a7:     	pushq	%r12
14544b1a9:     	pushq	%rsi
14544b1aa:     	pushq	%rdi
14544b1ab:     	pushq	%rbx
14544b1ac:     	subq	$0xb8, %rsp
14544b1b3:     	leaq	0x80(%rsp), %rbp
14544b1bb:     	movq	$-0x2, 0x30(%rbp)
14544b1c3:     	movq	%r9, %rdi
14544b1c6:     	movl	%r8d, %ebx
14544b1c9:     	movq	%rdx, %r14
14544b1cc:     	movq	%rcx, %rsi
14544b1cf:     	movq	0xb0(%rbp), %rax
14544b1d6:     	movl	(%rax), %r12d
14544b1d9:     	callq	0x140002200 <.text+0x1200>
14544b1de:     	movl	$0x20, %ecx
14544b1e3:     	movl	$0x1, %edx
14544b1e8:     	callq	0x1400021c0 <.text+0x11c0>
14544b1ed:     	testq	%rax, %rax
14544b1f0:     	je	0x14544b713 <.text+0x544a713>
14544b1f6:     	movw	$0x132, 0x28(%rbp)      # imm = 0x132
14544b1fc:     	movq	$0x20, 0x10(%rbp)
14544b204:     	movq	%rax, 0x18(%rbp)
14544b208:     	movq	$0x0, 0x20(%rbp)
14544b210:     	leaq	0x10(%rbp), %rdx
14544b214:     	movq	%r14, %rcx
14544b217:     	callq	0x145509090 <.text+0x5508090>
14544b21c:     	nop
14544b21d:     	movups	0x10(%rbp), %xmm0
14544b221:     	movups	0x20(%rbp), %xmm1
14544b225:     	movaps	%xmm1, (%rbp)
14544b229:     	movaps	%xmm0, -0x10(%rbp)
14544b22d:     	leaq	-0x10(%rbp), %rdx
14544b231:     	movq	%r14, %rcx
14544b234:     	callq	0x145509090 <.text+0x5508090>
14544b239:     	nop
14544b23a:     	movaps	-0x10(%rbp), %xmm0
14544b23e:     	movaps	(%rbp), %xmm1
14544b242:     	movaps	%xmm1, 0x20(%rbp)
14544b246:     	movaps	%xmm0, 0x10(%rbp)
14544b24a:     	movq	0x20(%rbp), %rdx
14544b24e:     	movq	0x10(%rbp), %rax
14544b252:     	subq	%rdx, %rax
14544b255:     	cmpq	$0x3, %rax
14544b259:     	jbe	0x14544b5fb <.text+0x544a5fb>
14544b25f:     	movq	0x18(%rbp), %rax
14544b263:     	movl	%ebx, (%rax,%rdx)
14544b266:     	addq	$0x4, %rdx
14544b26a:     	movq	%rdx, 0x20(%rbp)
14544b26e:     	movaps	0x10(%rbp), %xmm0
14544b272:     	movaps	%xmm0, -0x10(%rbp)
14544b276:     	movq	0x20(%rbp), %rax
14544b27a:     	movq	%rax, (%rbp)
14544b27e:     	movq	0x28(%rbp), %rax
14544b282:     	movq	%rax, 0x8(%rbp)
14544b286:     	movq	(%rbp), %rdx
14544b28a:     	movq	-0x10(%rbp), %rax
14544b28e:     	subq	%rdx, %rax
14544b291:     	cmpq	$0x1, %rax
14544b295:     	jbe	0x14544b623 <.text+0x544a623>
14544b29b:     	movq	0xa0(%rbp), %r14
14544b2a2:     	leal	0x8(%r12), %eax
14544b2a7:     	shll	$0x5, %eax
14544b2aa:     	movq	-0x8(%rbp), %rcx
14544b2ae:     	movw	%ax, (%rcx,%rdx)
14544b2b2:     	addq	$0x2, %rdx
14544b2b6:     	movq	%rdx, (%rbp)
14544b2ba:     	movaps	-0x10(%rbp), %xmm0
14544b2be:     	movaps	%xmm0, 0x10(%rbp)
14544b2c2:     	movq	(%rbp), %rax
14544b2c6:     	movq	%rax, 0x20(%rbp)
14544b2ca:     	movq	0x8(%rbp), %rax
14544b2ce:     	cmpq	$0xff, %r14
14544b2d5:     	movl	$0xff, %ebx
14544b2da:     	cmovbq	%r14, %rbx
14544b2de:     	movq	%rax, 0x28(%rbp)
14544b2e2:     	movq	0x20(%rbp), %r15
14544b2e6:     	cmpq	0x10(%rbp), %r15
14544b2ea:     	jne	0x14544b2f6 <.text+0x544a2f6>
14544b2ec:     	leaq	0x10(%rbp), %rcx
14544b2f0:     	callq	0x1458e7110 <.text+0x58e6110>
14544b2f5:     	nop
14544b2f6:     	movq	0x18(%rbp), %rax
14544b2fa:     	movb	%bl, (%rax,%r15)
14544b2fe:     	incq	%r15
14544b301:     	movq	%r15, 0x20(%rbp)
14544b305:     	movaps	0x10(%rbp), %xmm0
14544b309:     	movaps	%xmm0, -0x50(%rbp)
14544b30d:     	movq	0x20(%rbp), %rax
14544b311:     	movq	%rax, -0x40(%rbp)
14544b315:     	movq	0x28(%rbp), %rax
14544b319:     	movq	%rax, -0x38(%rbp)
14544b31d:     	testq	%r14, %r14
14544b320:     	je	0x14544b3c5 <.text+0x544a3c5>
14544b326:     	shlq	$0x3, %r14
14544b32a:     	addq	$-0x8, %r14
14544b32e:     	xorl	%r13d, %r13d
14544b331:     	leaq	0x10(%rbp), %rbx
14544b335:     	nopw	%cs:(%rax,%rax)
14544b340:     	movq	(%rdi,%r13), %r15
14544b344:     	movaps	-0x50(%rbp), %xmm0
14544b348:     	movaps	-0x40(%rbp), %xmm1
14544b34c:     	movaps	%xmm1, 0x20(%rbp)
14544b350:     	movaps	%xmm0, 0x10(%rbp)
14544b354:     	movq	0x20(%rbp), %rdx
14544b358:     	movq	0x10(%rbp), %rax
14544b35c:     	subq	%rdx, %rax
14544b35f:     	cmpq	$0x7, %rax
14544b363:     	jbe	0x14544b3a1 <.text+0x544a3a1>
14544b365:     	movq	0x18(%rbp), %rax
14544b369:     	movq	%r15, (%rax,%rdx)
14544b36d:     	addq	$0x8, %rdx
14544b371:     	movq	%rdx, 0x20(%rbp)
14544b375:     	movaps	0x10(%rbp), %xmm0
14544b379:     	movaps	%xmm0, -0x50(%rbp)
14544b37d:     	movq	0x20(%rbp), %rax
14544b381:     	movq	%rax, -0x40(%rbp)
14544b385:     	movq	0x28(%rbp), %rax
14544b389:     	movq	%rax, -0x38(%rbp)
14544b38d:     	cmpq	$0x7f0, %r13            # imm = 0x7F0
14544b394:     	je	0x14544b3c5 <.text+0x544a3c5>
14544b396:     	cmpq	%r13, %r14
14544b399:     	leaq	0x8(%r13), %r13
14544b39d:     	jne	0x14544b340 <.text+0x544a340>
14544b39f:     	jmp	0x14544b3c5 <.text+0x544a3c5>
14544b3a1:     	movq	$0x1, 0x20(%rsp)
14544b3aa:     	movl	$0x8, %r8d
14544b3b0:     	movl	$0x1, %r9d
14544b3b6:     	movq	%rbx, %rcx
14544b3b9:     	callq	0x145757d40 <.text+0x5756d40>
14544b3be:     	nop
14544b3bf:     	movq	0x20(%rbp), %rdx
14544b3c3:     	jmp	0x14544b365 <.text+0x544a365>
14544b3c5:     	movaps	-0x50(%rbp), %xmm0
14544b3c9:     	movq	-0x40(%rbp), %rax
14544b3cd:     	movq	%rax, 0x20(%rbp)
14544b3d1:     	movq	-0x38(%rbp), %rax
14544b3d5:     	movq	%rax, 0x28(%rbp)
14544b3d9:     	movaps	%xmm0, 0x10(%rbp)
14544b3dd:     	movq	0x20(%rbp), %rbx
14544b3e1:     	cmpq	0x10(%rbp), %rbx
14544b3e5:     	jne	0x14544b3f1 <.text+0x544a3f1>
14544b3e7:     	leaq	0x10(%rbp), %rcx
14544b3eb:     	callq	0x1458e7110 <.text+0x58e6110>
14544b3f0:     	nop
14544b3f1:     	movq	0xa8(%rbp), %rdi
14544b3f8:     	movq	0x18(%rbp), %rax
14544b3fc:     	movb	$0x0, (%rax,%rbx)
14544b400:     	incq	%rbx
14544b403:     	movq	%rbx, 0x20(%rbp)
14544b407:     	movaps	0x10(%rbp), %xmm0
14544b40b:     	movaps	%xmm0, -0x30(%rbp)
14544b40f:     	movq	0x20(%rbp), %rax
14544b413:     	movq	%rax, -0x20(%rbp)
14544b417:     	movq	0x28(%rbp), %rax
14544b41b:     	movq	%rax, -0x18(%rbp)
14544b41f:     	movl	(%rdi), %eax
14544b421:     	testl	%eax, %eax
14544b423:     	je	0x14544b46e <.text+0x544a46e>
14544b425:     	cmpl	$0x1, %eax
14544b428:     	jne	0x14544b4d0 <.text+0x544a4d0>
14544b42e:     	movq	-0x30(%rbp), %rax
14544b432:     	movq	-0x20(%rbp), %rdx
14544b436:     	subq	%rdx, %rax
14544b439:     	cmpq	$0x1, %rax
14544b43d:     	jbe	0x14544b69b <.text+0x544a69b>
14544b443:     	addq	$0x4, %rdi
14544b447:     	movq	-0x28(%rbp), %rax
14544b44b:     	movw	$0x40, (%rax,%rdx)
14544b451:     	addq	$0x2, %rdx
14544b455:     	movq	%rdx, -0x20(%rbp)
14544b459:     	leaq	-0x10(%rbp), %rcx
14544b45d:     	leaq	-0x30(%rbp), %rdx
14544b461:     	movq	%rdi, %r8
14544b464:     	callq	0x1454fa450 <.text+0x54f9450>
14544b469:     	jmp	0x14544b50f <.text+0x544a50f>
14544b46e:     	movq	0x8(%rdi), %rdi
14544b472:     	movq	-0x30(%rbp), %rax
14544b476:     	movq	-0x20(%rbp), %rdx
14544b47a:     	subq	%rdx, %rax
14544b47d:     	cmpq	$0x1, %rax
14544b481:     	jbe	0x14544b6c3 <.text+0x544a6c3>
14544b487:     	movq	-0x28(%rbp), %rax
14544b48b:     	movw	$0x2, (%rax,%rdx)
14544b491:     	addq	$0x2, %rdx
14544b495:     	movq	%rdx, -0x20(%rbp)
14544b499:     	movaps	-0x30(%rbp), %xmm0
14544b49d:     	movaps	%xmm0, 0x10(%rbp)
14544b4a1:     	movq	-0x20(%rbp), %rax
14544b4a5:     	movq	%rax, 0x20(%rbp)
14544b4a9:     	movq	-0x18(%rbp), %rax
14544b4ad:     	movq	%rax, 0x28(%rbp)
14544b4b1:     	leaq	0x10(%rbp), %rdx
14544b4b5:     	movq	%rdi, %rcx
14544b4b8:     	callq	0x145509090 <.text+0x5508090>
14544b4bd:     	nop
14544b4be:     	movaps	0x10(%rbp), %xmm0
14544b4c2:     	movaps	0x20(%rbp), %xmm1
14544b4c6:     	movaps	%xmm1, (%rbp)
14544b4ca:     	movaps	%xmm0, -0x10(%rbp)
14544b4ce:     	jmp	0x14544b50f <.text+0x544a50f>
14544b4d0:     	movq	-0x30(%rbp), %rax
14544b4d4:     	movq	-0x20(%rbp), %rdx
14544b4d8:     	subq	%rdx, %rax
14544b4db:     	cmpq	$0x1, %rax
14544b4df:     	jbe	0x14544b6eb <.text+0x544a6eb>
14544b4e5:     	movq	-0x28(%rbp), %rax
14544b4e9:     	movw	$0x0, (%rax,%rdx)
14544b4ef:     	addq	$0x2, %rdx
14544b4f3:     	movq	%rdx, -0x20(%rbp)
14544b4f7:     	movaps	-0x30(%rbp), %xmm0
14544b4fb:     	movaps	%xmm0, -0x10(%rbp)
14544b4ff:     	movq	-0x20(%rbp), %rax
14544b503:     	movq	%rax, (%rbp)
14544b507:     	movq	-0x18(%rbp), %rax
14544b50b:     	movq	%rax, 0x8(%rbp)
14544b50f:     	movaps	-0x10(%rbp), %xmm0
14544b513:     	movq	(%rbp), %rax
14544b517:     	movq	%rax, -0x40(%rbp)
14544b51b:     	movq	0x8(%rbp), %rax
14544b51f:     	movq	%rax, -0x38(%rbp)
14544b523:     	movaps	%xmm0, -0x50(%rbp)
14544b527:     	testl	%r12d, %r12d
14544b52a:     	je	0x14544b5cd <.text+0x544a5cd>
14544b530:     	movq	0xb0(%rbp), %rax
14544b537:     	movl	0x4(%rax), %ebx
14544b53a:     	movl	0x8(%rax), %edi
14544b53d:     	movaps	-0x50(%rbp), %xmm0
14544b541:     	movq	-0x40(%rbp), %rax
14544b545:     	movq	%rax, 0x20(%rbp)
14544b549:     	movq	-0x38(%rbp), %rax
14544b54d:     	movq	%rax, 0x28(%rbp)
14544b551:     	movaps	%xmm0, 0x10(%rbp)
14544b555:     	movq	0x20(%rbp), %rdx
14544b559:     	movq	0x10(%rbp), %rax
14544b55d:     	subq	%rdx, %rax
14544b560:     	cmpq	$0x3, %rax
14544b564:     	jbe	0x14544b64b <.text+0x544a64b>
14544b56a:     	movq	0x18(%rbp), %rax
14544b56e:     	movl	%ebx, (%rax,%rdx)
14544b571:     	addq	$0x4, %rdx
14544b575:     	movq	%rdx, 0x20(%rbp)
14544b579:     	movaps	0x10(%rbp), %xmm0
14544b57d:     	movaps	%xmm0, -0x10(%rbp)
14544b581:     	movq	0x20(%rbp), %rax
14544b585:     	movq	%rax, (%rbp)
14544b589:     	movq	0x28(%rbp), %rax
14544b58d:     	movq	%rax, 0x8(%rbp)
14544b591:     	movq	(%rbp), %rdx
14544b595:     	movq	-0x10(%rbp), %rax
14544b599:     	subq	%rdx, %rax
14544b59c:     	cmpq	$0x3, %rax
14544b5a0:     	jbe	0x14544b673 <.text+0x544a673>
14544b5a6:     	movq	-0x8(%rbp), %rax
14544b5aa:     	movl	%edi, (%rax,%rdx)
14544b5ad:     	addq	$0x4, %rdx
14544b5b1:     	movq	%rdx, (%rbp)
14544b5b5:     	movaps	-0x10(%rbp), %xmm0
14544b5b9:     	movaps	%xmm0, -0x50(%rbp)
14544b5bd:     	movq	(%rbp), %rax
14544b5c1:     	movq	%rax, -0x40(%rbp)
14544b5c5:     	movq	0x8(%rbp), %rax
14544b5c9:     	movq	%rax, -0x38(%rbp)
14544b5cd:     	movaps	-0x50(%rbp), %xmm0
14544b5d1:     	movq	-0x40(%rbp), %rax
14544b5d5:     	movq	%rax, 0x10(%rsi)
14544b5d9:     	movq	-0x38(%rbp), %rax
14544b5dd:     	movq	%rax, 0x18(%rsi)
14544b5e1:     	movups	%xmm0, (%rsi)
14544b5e4:     	movq	%rsi, %rax
14544b5e7:     	addq	$0xb8, %rsp
14544b5ee:     	popq	%rbx
14544b5ef:     	popq	%rdi
14544b5f0:     	popq	%rsi
14544b5f1:     	popq	%r12
14544b5f3:     	popq	%r13
14544b5f5:     	popq	%r14
14544b5f7:     	popq	%r15
14544b5f9:     	popq	%rbp
14544b5fa:     	retq
14544b5fb:     	movq	$0x1, 0x20(%rsp)
14544b604:     	leaq	0x10(%rbp), %rcx
14544b608:     	movl	$0x4, %r8d
14544b60e:     	movl	$0x1, %r9d
14544b614:     	callq	0x145757d40 <.text+0x5756d40>
14544b619:     	nop
14544b61a:     	movq	0x20(%rbp), %rdx
14544b61e:     	jmp	0x14544b25f <.text+0x544a25f>
14544b623:     	movq	$0x1, 0x20(%rsp)
14544b62c:     	leaq	-0x10(%rbp), %rcx
14544b630:     	movl	$0x2, %r8d
14544b636:     	movl	$0x1, %r9d
14544b63c:     	callq	0x145757d40 <.text+0x5756d40>
14544b641:     	nop
14544b642:     	movq	(%rbp), %rdx
14544b646:     	jmp	0x14544b29b <.text+0x544a29b>
14544b64b:     	movq	$0x1, 0x20(%rsp)
14544b654:     	leaq	0x10(%rbp), %rcx
14544b658:     	movl	$0x4, %r8d
14544b65e:     	movl	$0x1, %r9d
14544b664:     	callq	0x145757d40 <.text+0x5756d40>
14544b669:     	nop
14544b66a:     	movq	0x20(%rbp), %rdx
14544b66e:     	jmp	0x14544b56a <.text+0x544a56a>
14544b673:     	movq	$0x1, 0x20(%rsp)
14544b67c:     	leaq	-0x10(%rbp), %rcx
14544b680:     	movl	$0x4, %r8d
14544b686:     	movl	$0x1, %r9d
14544b68c:     	callq	0x145757d40 <.text+0x5756d40>
14544b691:     	nop
14544b692:     	movq	(%rbp), %rdx
14544b696:     	jmp	0x14544b5a6 <.text+0x544a5a6>
14544b69b:     	movq	$0x1, 0x20(%rsp)
14544b6a4:     	leaq	-0x30(%rbp), %rcx
14544b6a8:     	movl	$0x2, %r8d
14544b6ae:     	movl	$0x1, %r9d
14544b6b4:     	callq	0x145757d40 <.text+0x5756d40>
14544b6b9:     	nop
14544b6ba:     	movq	-0x20(%rbp), %rdx
14544b6be:     	jmp	0x14544b443 <.text+0x544a443>
14544b6c3:     	movq	$0x1, 0x20(%rsp)
14544b6cc:     	leaq	-0x30(%rbp), %rcx
14544b6d0:     	movl	$0x2, %r8d
14544b6d6:     	movl	$0x1, %r9d
14544b6dc:     	callq	0x145757d40 <.text+0x5756d40>
14544b6e1:     	nop
14544b6e2:     	movq	-0x20(%rbp), %rdx
14544b6e6:     	jmp	0x14544b487 <.text+0x544a487>
14544b6eb:     	movq	$0x1, 0x20(%rsp)
14544b6f4:     	leaq	-0x30(%rbp), %rcx
14544b6f8:     	movl	$0x2, %r8d
14544b6fe:     	movl	$0x1, %r9d
14544b704:     	callq	0x145757d40 <.text+0x5756d40>
14544b709:     	nop
14544b70a:     	movq	-0x20(%rbp), %rdx
14544b70e:     	jmp	0x14544b4e5 <.text+0x544a4e5>
14544b713:     	movl	$0x1, %ecx
14544b718:     	movl	$0x20, %edx
14544b71d:     	callq	0x1458e721b <.text+0x58e621b>
14544b722:     	ud2
