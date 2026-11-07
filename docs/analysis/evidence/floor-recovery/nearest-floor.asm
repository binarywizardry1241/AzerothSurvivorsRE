
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552d220:     	pushq	%r15
14552d222:     	pushq	%r14
14552d224:     	pushq	%r13
14552d226:     	pushq	%r12
14552d228:     	pushq	%rsi
14552d229:     	pushq	%rdi
14552d22a:     	pushq	%rbp
14552d22b:     	pushq	%rbx
14552d22c:     	subq	$0xa8, %rsp
14552d233:     	movaps	%xmm9, 0x90(%rsp)
14552d23c:     	movaps	%xmm8, 0x80(%rsp)
14552d245:     	movaps	%xmm7, 0x70(%rsp)
14552d24a:     	movaps	%xmm6, 0x60(%rsp)
14552d24f:     	movaps	%xmm3, %xmm6
14552d252:     	movaps	%xmm2, %xmm0
14552d255:     	movq	%rdx, %rdi
14552d258:     	movq	%rcx, %r14
14552d25b:     	movss	0x20(%rdx), %xmm7
14552d260:     	subss	%xmm7, %xmm0
14552d264:     	addss	%xmm0, %xmm0
14552d268:     	callq	0x145773265 <.text+0x5772265>
14552d26d:     	cvttss2si	%xmm0, %ebx
14552d271:     	movss	0x4b7f66(%rip), %xmm9   # 0x1459e51e0
14552d27a:     	ucomiss	%xmm9, %xmm0
14552d27e:     	movl	$0x7fffffff, %esi       # imm = 0x7FFFFFFF
14552d283:     	cmoval	%esi, %ebx
14552d286:     	xorl	%ebp, %ebp
14552d288:     	ucomiss	%xmm0, %xmm0
14552d28b:     	cmovpl	%ebp, %ebx
14552d28e:     	movss	0x24(%rdi), %xmm8
14552d294:     	subss	%xmm8, %xmm6
14552d299:     	addss	%xmm6, %xmm6
14552d29d:     	movaps	%xmm6, %xmm0
14552d2a0:     	callq	0x145773265 <.text+0x5772265>
14552d2a5:     	cvttss2si	%xmm0, %r12d
14552d2aa:     	ucomiss	%xmm9, %xmm0
14552d2ae:     	cmoval	%esi, %r12d
14552d2b2:     	ucomiss	%xmm0, %xmm0
14552d2b5:     	cmovpl	%ebp, %r12d
14552d2b9:     	movl	0x18(%rdi), %r8d
14552d2bd:     	movq	0x8(%rdi), %rax
14552d2c1:     	movq	%rax, 0x50(%rsp)
14552d2c6:     	movq	0x10(%rdi), %rax
14552d2ca:     	movq	%rax, 0x40(%rsp)
14552d2cf:     	movss	0x3da1c1(%rip), %xmm0   # 0x145907498
14552d2d7:     	xorl	%ecx, %ecx
14552d2d9:     	nopl	(%rax)
14552d2e0:     	xorl	%eax, %eax
14552d2e2:     	testb	$0x1, %cl
14552d2e5:     	jne	0x14552d4b2 <.text+0x552c4b2>
14552d2eb:     	movl	%ebp, %edi
14552d2ed:     	cmpl	$0x14, %ebp
14552d2f0:     	jg	0x14552d4b2 <.text+0x552c4b2>
14552d2f6:     	leal	0x1(%rdi), %ebp
14552d2f9:     	cmpl	$0x14, %edi
14552d2fc:     	cmovel	%edi, %ebp
14552d2ff:     	sete	%cl
14552d302:     	movl	%edi, %eax
14552d304:     	negl	%eax
14552d306:     	cmpl	%eax, %edi
14552d308:     	jl	0x14552d2e0 <.text+0x552c2e0>
14552d30a:     	movl	%ecx, 0x34(%rsp)
14552d30e:     	movq	%r14, 0x48(%rsp)
14552d313:     	movl	$0x0, 0x30(%rsp)
14552d31b:     	movl	%eax, %r15d
14552d31e:     	nop
14552d320:     	xorl	%r13d, %r13d
14552d323:     	cmpl	%edi, %r15d
14552d326:     	setl	%r11b
14552d32a:     	movl	%r15d, %r9d
14552d32d:     	negl	%r9d
14552d330:     	cmovsl	%r15d, %r9d
14552d334:     	leal	(%r15,%r12), %r10d
14552d338:     	movl	%eax, %ecx
14552d33a:     	cmpl	%r8d, %r10d
14552d33d:     	jge	0x14552d460 <.text+0x552c460>
14552d343:     	movl	%r10d, %ecx
14552d346:     	imull	%r8d, %ecx
14552d34a:     	movq	%rcx, 0x58(%rsp)
14552d34f:     	movl	%r15d, %ecx
14552d352:     	imull	%r15d, %ecx
14552d356:     	movl	%ecx, 0x3c(%rsp)
14552d35a:     	xorps	%xmm4, %xmm4
14552d35d:     	cvtsi2ss	%r10d, %xmm4
14552d362:     	addss	%xmm0, %xmm4
14552d366:     	mulss	%xmm0, %xmm4
14552d36a:     	addss	%xmm8, %xmm4
14552d36f:     	movl	%eax, %esi
14552d371:     	nopw	%cs:(%rax,%rax)
14552d380:     	xorl	%r14d, %r14d
14552d383:     	cmpl	%edi, %esi
14552d385:     	setl	%r14b
14552d389:     	addl	%esi, %r14d
14552d38c:     	movl	%esi, %ecx
14552d38e:     	negl	%ecx
14552d390:     	cmovsl	%esi, %ecx
14552d393:     	cmpl	%ecx, %r9d
14552d396:     	cmovgl	%r9d, %ecx
14552d39a:     	cmpl	%edi, %ecx
14552d39c:     	jne	0x14552d3ad <.text+0x552c3ad>
14552d39e:     	leal	(%rsi,%rbx), %edx
14552d3a1:     	cmpl	%r8d, %edx
14552d3a4:     	jge	0x14552d3ad <.text+0x552c3ad>
14552d3a6:     	movl	%edx, %ecx
14552d3a8:     	orl	%r10d, %ecx
14552d3ab:     	jns	0x14552d3c2 <.text+0x552c3c2>
14552d3ad:     	cmpl	%edi, %esi
14552d3af:     	jge	0x14552d473 <.text+0x552c473>
14552d3b5:     	movl	%r14d, %esi
14552d3b8:     	cmpl	%edi, %r14d
14552d3bb:     	jle	0x14552d380 <.text+0x552c380>
14552d3bd:     	jmp	0x14552d473 <.text+0x552c473>
14552d3c2:     	movb	%r11b, 0x2f(%rsp)
14552d3c7:     	movq	0x58(%rsp), %rcx
14552d3cc:     	addl	%edx, %ecx
14552d3ce:     	movslq	%ecx, %rcx
14552d3d1:     	cmpq	%rcx, 0x40(%rsp)
14552d3d6:     	jbe	0x14552d4e8 <.text+0x552c4e8>
14552d3dc:     	movq	%r12, %r11
14552d3df:     	movq	0x50(%rsp), %r12
14552d3e4:     	movss	(%r12,%rcx,4), %xmm5
14552d3ea:     	movl	%esi, %ecx
14552d3ec:     	imull	%esi, %ecx
14552d3ef:     	addl	0x3c(%rsp), %ecx
14552d3f3:     	cmpl	0x38(%rsp), %ecx
14552d3f7:     	setge	%r12b
14552d3fb:     	ucomiss	%xmm5, %xmm5
14552d3fe:     	jp	0x14552d446 <.text+0x552c446>
14552d400:     	andb	0x30(%rsp), %r12b
14552d405:     	movq	%r11, %r12
14552d408:     	jne	0x14552d42f <.text+0x552c42f>
14552d40a:     	xorps	%xmm1, %xmm1
14552d40d:     	cvtsi2ss	%edx, %xmm1
14552d411:     	addss	%xmm0, %xmm1
14552d415:     	mulss	%xmm0, %xmm1
14552d419:     	addss	%xmm7, %xmm1
14552d41d:     	movl	$0x1, 0x30(%rsp)
14552d425:     	movl	%ecx, 0x38(%rsp)
14552d429:     	movaps	%xmm4, %xmm2
14552d42c:     	movaps	%xmm5, %xmm3
14552d42f:     	cmpl	%edi, %esi
14552d431:     	movzbl	0x2f(%rsp), %r11d
14552d437:     	jge	0x14552d473 <.text+0x552c473>
14552d439:     	cmpl	%edi, %r14d
14552d43c:     	jg	0x14552d473 <.text+0x552c473>
14552d43e:     	movl	%r14d, %esi
14552d441:     	jmp	0x14552d380 <.text+0x552c380>
14552d446:     	movq	%r11, %r12
14552d449:     	cmpl	%edi, %esi
14552d44b:     	movzbl	0x2f(%rsp), %r11d
14552d451:     	jl	0x14552d439 <.text+0x552c439>
14552d453:     	jmp	0x14552d473 <.text+0x552c473>
14552d455:     	nopw	%cs:(%rax,%rax)
14552d460:     	xorl	%edx, %edx
14552d462:     	cmpl	%edi, %ecx
14552d464:     	setl	%r9b
14552d468:     	jge	0x14552d473 <.text+0x552c473>
14552d46a:     	movb	%r9b, %dl
14552d46d:     	addl	%edx, %ecx
14552d46f:     	cmpl	%edi, %ecx
14552d471:     	jle	0x14552d460 <.text+0x552c460>
14552d473:     	cmpl	%edi, %r15d
14552d476:     	jge	0x14552d487 <.text+0x552c487>
14552d478:     	movb	%r11b, %r13b
14552d47b:     	addl	%r13d, %r15d
14552d47e:     	cmpl	%edi, %r15d
14552d481:     	jle	0x14552d320 <.text+0x552c320>
14552d487:     	cmpl	$0x1, 0x30(%rsp)
14552d48c:     	movq	0x48(%rsp), %r14
14552d491:     	movl	0x34(%rsp), %ecx
14552d495:     	jne	0x14552d2e0 <.text+0x552c2e0>
14552d49b:     	movss	%xmm1, 0x4(%r14)
14552d4a1:     	movss	%xmm2, 0x8(%r14)
14552d4a7:     	movss	%xmm3, 0xc(%r14)
14552d4ad:     	movl	$0x1, %eax
14552d4b2:     	movl	%eax, (%r14)
14552d4b5:     	movq	%r14, %rax
14552d4b8:     	movaps	0x60(%rsp), %xmm6
14552d4bd:     	movaps	0x70(%rsp), %xmm7
14552d4c2:     	movaps	0x80(%rsp), %xmm8
14552d4cb:     	movaps	0x90(%rsp), %xmm9
14552d4d4:     	addq	$0xa8, %rsp
14552d4db:     	popq	%rbx
14552d4dc:     	popq	%rbp
14552d4dd:     	popq	%rdi
14552d4de:     	popq	%rsi
14552d4df:     	popq	%r12
14552d4e1:     	popq	%r13
14552d4e3:     	popq	%r14
14552d4e5:     	popq	%r15
14552d4e7:     	retq
14552d4e8:     	leaq	0x1807b49(%rip), %r8    # 0x146d35038
14552d4ef:     	movq	0x40(%rsp), %rdx
14552d4f4:     	callq	0x145903b33 <.text+0x5902b33>
14552d4f9:     	ud2
