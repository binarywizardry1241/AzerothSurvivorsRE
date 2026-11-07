
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458b9220:     	pushq	%r15
1458b9222:     	pushq	%r14
1458b9224:     	pushq	%r13
1458b9226:     	pushq	%r12
1458b9228:     	pushq	%rsi
1458b9229:     	pushq	%rdi
1458b922a:     	pushq	%rbp
1458b922b:     	pushq	%rbx
1458b922c:     	subq	$0x28, %rsp
1458b9230:     	movq	%r8, %rsi
1458b9233:     	movq	%rdx, %rdi
1458b9236:     	movq	%rcx, %rbx
1458b9239:     	cmpl	$0x1, (%rcx)
1458b923c:     	jne	0x1458b92e6 <.text+0x58b82e6>
1458b9242:     	movq	0x8(%rbx), %r15
1458b9246:     	movq	0x10(%rbx), %r12
1458b924a:     	movq	$0x0, 0x8(%rbx)
1458b9252:     	testq	%r15, %r15
1458b9255:     	je	0x1458b92df <.text+0x58b82df>
1458b925b:     	movzbl	(%rdi), %ecx
1458b925e:     	movq	%r15, %rdx
1458b9261:     	movq	%r12, %r8
1458b9264:     	callq	0x1458e6190 <.text+0x58e5190>
1458b9269:     	testq	%rdx, %rdx
1458b926c:     	je	0x1458b92df <.text+0x58b82df>
1458b926e:     	movq	0x10(%rsi), %r13
1458b9272:     	testq	%r13, %r13
1458b9275:     	je	0x1458b92d2 <.text+0x58b82d2>
1458b9277:     	movq	%rdx, 0x20(%rsp)
1458b927c:     	movq	0x8(%rsi), %rbp
1458b9280:     	shlq	$0x4, %r13
1458b9284:     	xorl	%r14d, %r14d
1458b9287:     	jmp	0x1458b9299 <.text+0x58b8299>
1458b9289:     	nopl	(%rax)
1458b9290:     	addq	$0x10, %r14
1458b9294:     	cmpq	%r14, %r13
1458b9297:     	je	0x1458b92bf <.text+0x58b82bf>
1458b9299:     	movq	(%rbp,%r14), %rax
1458b929e:     	cmpq	%r12, 0x28(%rax)
1458b92a2:     	jne	0x1458b9290 <.text+0x58b8290>
1458b92a4:     	movq	0x20(%rax), %rcx
1458b92a8:     	movq	%r15, %rdx
1458b92ab:     	movq	%r12, %r8
1458b92ae:     	callq	0x145bc9787 <.text+0x5bc8787>
1458b92b3:     	testl	%eax, %eax
1458b92b5:     	jne	0x1458b9290 <.text+0x58b8290>
1458b92b7:     	movzbl	0x8(%rbp,%r14), %ecx
1458b92bd:     	jmp	0x1458b92c1 <.text+0x58b82c1>
1458b92bf:     	xorl	%ecx, %ecx
1458b92c1:     	movq	0x20(%rsp), %rdx
1458b92c6:     	movb	$0x1, %al
1458b92c8:     	cmpb	0x72(%rdx), %cl
1458b92cb:     	jb	0x1458b92df <.text+0x58b82df>
1458b92cd:     	jmp	0x1458b9380 <.text+0x58b8380>
1458b92d2:     	xorl	%ecx, %ecx
1458b92d4:     	movb	$0x1, %al
1458b92d6:     	cmpb	0x72(%rdx), %cl
1458b92d9:     	jae	0x1458b9380 <.text+0x58b8380>
1458b92df:     	movq	$0x0, (%rbx)
1458b92e6:     	cmpb	$0x0, 0x18(%rbx)
1458b92ea:     	je	0x1458b937e <.text+0x58b837e>
1458b92f0:     	movq	0x20(%rbx), %r14
1458b92f4:     	movq	0x28(%rbx), %r15
1458b92f8:     	movq	$0x0, 0x20(%rbx)
1458b9300:     	testq	%r14, %r14
1458b9303:     	je	0x1458b937e <.text+0x58b837e>
1458b9305:     	movzbl	(%rdi), %ecx
1458b9308:     	movq	%r14, %rdx
1458b930b:     	movq	%r15, %r8
1458b930e:     	callq	0x1458e6190 <.text+0x58e5190>
1458b9313:     	testq	%rdx, %rdx
1458b9316:     	je	0x1458b937e <.text+0x58b837e>
1458b9318:     	movq	%rdx, %rdi
1458b931b:     	movq	0x10(%rsi), %rbx
1458b931f:     	testq	%rbx, %rbx
1458b9322:     	je	0x1458b9375 <.text+0x58b8375>
1458b9324:     	movq	0x8(%rsi), %rsi
1458b9328:     	shlq	$0x4, %rbx
1458b932c:     	xorl	%r12d, %r12d
1458b932f:     	jmp	0x1458b9349 <.text+0x58b8349>
1458b9331:     	nopw	%cs:(%rax,%rax)
1458b9340:     	addq	$0x10, %r12
1458b9344:     	cmpq	%r12, %rbx
1458b9347:     	je	0x1458b9375 <.text+0x58b8375>
1458b9349:     	movq	(%rsi,%r12), %rax
1458b934d:     	cmpq	%r15, 0x28(%rax)
1458b9351:     	jne	0x1458b9340 <.text+0x58b8340>
1458b9353:     	movq	0x20(%rax), %rcx
1458b9357:     	movq	%r14, %rdx
1458b935a:     	movq	%r15, %r8
1458b935d:     	callq	0x145bc9787 <.text+0x5bc8787>
1458b9362:     	testl	%eax, %eax
1458b9364:     	jne	0x1458b9340 <.text+0x58b8340>
1458b9366:     	movzbl	0x8(%rsi,%r12), %ecx
1458b936c:     	movb	$0x1, %al
1458b936e:     	cmpb	0x72(%rdi), %cl
1458b9371:     	jb	0x1458b937e <.text+0x58b837e>
1458b9373:     	jmp	0x1458b9380 <.text+0x58b8380>
1458b9375:     	xorl	%ecx, %ecx
1458b9377:     	movb	$0x1, %al
1458b9379:     	cmpb	0x72(%rdi), %cl
1458b937c:     	jae	0x1458b9380 <.text+0x58b8380>
1458b937e:     	xorl	%eax, %eax
1458b9380:     	addq	$0x28, %rsp
1458b9384:     	popq	%rbx
1458b9385:     	popq	%rbp
1458b9386:     	popq	%rdi
1458b9387:     	popq	%rsi
1458b9388:     	popq	%r12
1458b938a:     	popq	%r13
1458b938c:     	popq	%r14
1458b938e:     	popq	%r15
1458b9390:     	retq
