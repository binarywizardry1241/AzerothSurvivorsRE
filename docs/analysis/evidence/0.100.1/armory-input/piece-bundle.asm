
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400e32f0:     	pushq	%rbp
1400e32f1:     	pushq	%r15
1400e32f3:     	pushq	%r14
1400e32f5:     	pushq	%r13
1400e32f7:     	pushq	%r12
1400e32f9:     	pushq	%rsi
1400e32fa:     	pushq	%rdi
1400e32fb:     	pushq	%rbx
1400e32fc:     	subq	$0x348, %rsp            # imm = 0x348
1400e3303:     	leaq	0x80(%rsp), %rbp
1400e330b:     	movq	$-0x2, 0x2c0(%rbp)
1400e3316:     	movq	%r8, 0x2b0(%rbp)
1400e331d:     	movq	%rdx, %rbx
1400e3320:     	movq	%rcx, %rsi
1400e3323:     	movq	0x8(%rdx), %rdi
1400e3327:     	movb	$0x1, 0x2bf(%rbp)
1400e332e:     	movq	%rdi, %rcx
1400e3331:     	callq	0x144e2ce50 <.text+0x4e2be50>
1400e3336:     	nop
1400e3337:     	movq	%rax, %r14
1400e333a:     	movq	0x10(%rbx), %r15
1400e333e:     	movq	0x18(%rbx), %r12
1400e3342:     	testq	%r15, %r15
1400e3345:     	movq	%rdi, 0x2a0(%rbp)
1400e334c:     	je	0x1400e33cc <.text+0xe23cc>
1400e334e:     	movq	%r12, 0x2a8(%rbp)
1400e3355:     	leaq	-0x58(%rbp), %rcx
1400e3359:     	movl	$0x2f0, %r8d            # imm = 0x2F0
1400e335f:     	movq	0x2b0(%rbp), %r12
1400e3366:     	movq	%r12, %rdx
1400e3369:     	callq	0x1457731ed <.text+0x57721ed>
1400e336e:     	movq	%r14, 0x298(%rbp)
1400e3375:     	movq	(%r15), %rax
1400e3378:     	movq	0x10(%r15), %r13
1400e337c:     	subq	%r13, %rax
1400e337f:     	cmpq	$0x2ff, %rax            # imm = 0x2FF
1400e3385:     	jbe	0x1400e347b <.text+0xe247b>
1400e338b:     	movq	0x8(%r15), %rdi
1400e338f:     	leaq	0x8fbfa(%rip), %rax     # 0x140172f90 <.text+0x171f90>
1400e3396:     	movq	%rax, (%rdi,%r13)
1400e339a:     	leaq	(%rdi,%r13), %rcx
1400e339e:     	addq	$0x8, %rcx
1400e33a2:     	movl	$0x2f0, %r8d            # imm = 0x2F0
1400e33a8:     	movq	%r12, %rdx
1400e33ab:     	callq	0x1457731ed <.text+0x57721ed>
1400e33b0:     	movq	%r14, 0x2f8(%rdi,%r13)
1400e33b8:     	addq	$0x300, %r13            # imm = 0x300
1400e33bf:     	movq	%r13, 0x10(%r15)
1400e33c3:     	movq	0x2a8(%rbp), %r12
1400e33ca:     	jmp	0x1400e343f <.text+0xe243f>
1400e33cc:     	leaq	-0x58(%rbp), %rcx
1400e33d0:     	movl	$0x2f0, %r8d            # imm = 0x2F0
1400e33d6:     	movq	0x2b0(%rbp), %rdx
1400e33dd:     	callq	0x1457731ed <.text+0x57721ed>
1400e33e2:     	movq	%r14, 0x298(%rbp)
1400e33e9:     	movq	(%r12), %rax
1400e33ed:     	movq	0x10(%r12), %r13
1400e33f2:     	subq	%r13, %rax
1400e33f5:     	cmpq	$0x2ff, %rax            # imm = 0x2FF
1400e33fb:     	jbe	0x1400e34a1 <.text+0xe24a1>
1400e3401:     	movq	0x8(%r12), %rdi
1400e3406:     	leaq	0x8fb83(%rip), %rax     # 0x140172f90 <.text+0x171f90>
1400e340d:     	movq	%rax, (%rdi,%r13)
1400e3411:     	leaq	(%rdi,%r13), %rcx
1400e3415:     	addq	$0x8, %rcx
1400e3419:     	movl	$0x2f0, %r8d            # imm = 0x2F0
1400e341f:     	movq	0x2b0(%rbp), %rdx
1400e3426:     	callq	0x1457731ed <.text+0x57721ed>
1400e342b:     	movq	%r14, 0x2f8(%rdi,%r13)
1400e3433:     	addq	$0x300, %r13            # imm = 0x300
1400e343a:     	movq	%r13, 0x10(%r12)
1400e343f:     	movq	(%rbx), %rax
1400e3442:     	movq	0x20(%rbx), %rcx
1400e3446:     	movq	%r14, (%rsi)
1400e3449:     	movq	%rax, 0x8(%rsi)
1400e344d:     	movq	0x2a0(%rbp), %rax
1400e3454:     	movq	%rax, 0x10(%rsi)
1400e3458:     	movq	%r15, 0x18(%rsi)
1400e345c:     	movq	%r12, 0x20(%rsi)
1400e3460:     	movq	%rcx, 0x28(%rsi)
1400e3464:     	movq	%rsi, %rax
1400e3467:     	addq	$0x348, %rsp            # imm = 0x348
1400e346e:     	popq	%rbx
1400e346f:     	popq	%rdi
1400e3470:     	popq	%rsi
1400e3471:     	popq	%r12
1400e3473:     	popq	%r13
1400e3475:     	popq	%r14
1400e3477:     	popq	%r15
1400e3479:     	popq	%rbp
1400e347a:     	retq
1400e347b:     	movq	$0x1, 0x20(%rsp)
1400e3484:     	movl	$0x300, %r8d            # imm = 0x300
1400e348a:     	movl	$0x1, %r9d
1400e3490:     	movq	%r15, %rcx
1400e3493:     	movq	%r13, %rdx
1400e3496:     	callq	0x1457744b0 <.text+0x57734b0>
1400e349b:     	nop
1400e349c:     	jmp	0x1400e338b <.text+0xe238b>
1400e34a1:     	movq	$0x1, 0x20(%rsp)
1400e34aa:     	movl	$0x300, %r8d            # imm = 0x300
1400e34b0:     	movl	$0x1, %r9d
1400e34b6:     	movq	%r12, %rcx
1400e34b9:     	movq	%r13, %rdx
1400e34bc:     	callq	0x1457744b0 <.text+0x57734b0>
1400e34c1:     	nop
1400e34c2:     	jmp	0x1400e3401 <.text+0xe2401>
