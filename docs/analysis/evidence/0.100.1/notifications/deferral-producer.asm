
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140061430:     	pushq	%rsi
140061431:     	pushq	%rdi
140061432:     	subq	$0x38, %rsp
140061436:     	movq	%rdx, %rsi
140061439:     	movq	%rdx, %rcx
14006143c:     	callq	0x14064e8c0 <.text+0x64d8c0>
140061441:     	cmpq	$0x0, 0x90(%rsi)
140061449:     	je	0x140061540 <.text+0x60540>
14006144f:     	movq	0x78(%rsi), %rcx
140061453:     	movq	0x80(%rsi), %rdx
14006145a:     	movabsq	$0x4abdde77da5d0278, %r8 # imm = 0x4ABDDE77DA5D0278
140061464:     	xorl	%r9d, %r9d
140061467:     	movdqa	0x58b1cd1(%rip), %xmm0  # 0x145913140
14006146f:     	pcmpeqd	%xmm1, %xmm1
140061473:     	movdqa	0x58b1d45(%rip), %xmm2  # 0x1459131c0
14006147b:     	andq	%rdx, %r8
14006147e:     	movdqu	(%rcx,%r8), %xmm3
140061484:     	movdqa	%xmm3, %xmm4
140061488:     	pcmpeqb	%xmm0, %xmm4
14006148c:     	pmovmskb	%xmm4, %r10d
140061491:     	testl	%r10d, %r10d
140061494:     	je	0x1400614d0 <.text+0x604d0>
140061496:     	tzcntl	%r10d, %r11d
14006149b:     	addq	%r8, %r11
14006149e:     	andq	%rdx, %r11
1400614a1:     	negq	%r11
1400614a4:     	leaq	(%r11,%r11,2), %r11
1400614a8:     	movdqu	-0x18(%rcx,%r11,8), %xmm4
1400614af:     	pcmpeqb	%xmm2, %xmm4
1400614b3:     	pmovmskb	%xmm4, %edi
1400614b7:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
1400614bd:     	je	0x1400614eb <.text+0x604eb>
1400614bf:     	leal	-0x1(%r10), %r11d
1400614c3:     	andw	%r10w, %r11w
1400614c7:     	movl	%r11d, %r10d
1400614ca:     	jne	0x140061496 <.text+0x60496>
1400614cc:     	nopl	(%rax)
1400614d0:     	pcmpeqb	%xmm1, %xmm3
1400614d4:     	pmovmskb	%xmm3, %r10d
1400614d9:     	testl	%r10d, %r10d
1400614dc:     	jne	0x140061540 <.text+0x60540>
1400614de:     	addq	%r9, %r8
1400614e1:     	addq	$0x10, %r8
1400614e5:     	addq	$0x10, %r9
1400614e9:     	jmp	0x14006147b <.text+0x6047b>
1400614eb:     	leaq	(%rcx,%r11,8), %rcx
1400614ef:     	movq	-0x8(%rcx), %rcx
1400614f3:     	cmpq	0x218(%rsi), %rcx
1400614fa:     	jae	0x140061540 <.text+0x60540>
1400614fc:     	movq	0x210(%rsi), %rdx
140061503:     	movq	(%rdx,%rcx,8), %rdx
140061507:     	testq	%rdx, %rdx
14006150a:     	je	0x140061540 <.text+0x60540>
14006150c:     	movq	0x1e0(%rsi), %rcx
140061513:     	notq	%rdx
140061516:     	imulq	$0x38, %rdx, %rdx
14006151a:     	cmpb	$0x0, 0x30(%rcx,%rdx)
14006151f:     	je	0x140061540 <.text+0x60540>
140061521:     	addq	%rdx, %rcx
140061524:     	movq	0x10(%rcx), %rdx
140061528:     	movl	0x5b0(%rsi), %r8d
14006152f:     	cmpb	(%rdx), %al
140061531:     	je	0x140061539 <.text+0x60539>
140061533:     	movl	%r8d, 0x2c(%rcx)
140061537:     	movb	%al, (%rdx)
140061539:     	addq	$0x38, %rsp
14006153d:     	popq	%rdi
14006153e:     	popq	%rsi
14006153f:     	retq
140061540:     	leaq	0x27(%rsp), %rax
140061545:     	movq	%rax, 0x28(%rsp)
14006154a:     	leaq	0x4faa2ef(%rip), %rax   # 0x14500b840 <.text+0x500a840>
140061551:     	movq	%rax, 0x30(%rsp)
140061556:     	leaq	0x58b1ecb(%rip), %rcx   # 0x145913428
14006155d:     	leaq	0x58b26e4(%rip), %r8    # 0x145913c48
140061564:     	leaq	0x28(%rsp), %rdx
140061569:     	callq	0x145903d10 <.text+0x5902d10>
14006156e:     	ud2
