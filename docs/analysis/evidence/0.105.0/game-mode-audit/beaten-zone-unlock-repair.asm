
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458893a4:     	movq	0x148(%rbp), %rcx
1458893ab:     	movq	0x150(%rbp), %rsi
1458893b2:     	cmpq	$0x2, %rsi
1458893b6:     	jae	0x14588af9f <.text+0x5889f9f>
1458893bc:     	shlq	$0x4, %rsi
1458893c0:     	addq	%rcx, %rsi
1458893c3:     	movl	$0xc, %edi
1458893c8:     	cmpq	%rsi, %rcx
1458893cb:     	jne	0x1458895c6 <.text+0x58885c6>
1458893d1:     	movq	$0x0, 0x240(%rbp)
1458893dc:     	movq	0x378(%rbp), %rax
1458893e3:     	movq	%rax, 0x248(%rbp)
1458893ea:     	movq	0x370(%rbp), %rcx
1458893f1:     	movq	%rcx, 0x250(%rbp)
1458893f8:     	movq	%rax, 0x258(%rbp)
1458893ff:     	movq	$0x0, 0x260(%rbp)
14588940a:     	movq	%rax, 0x268(%rbp)
145889411:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14588941b:     	movq	%rax, 0x270(%rbp)
145889422:     	movb	$0x1, 0x278(%rbp)
145889429:     	movw	$0x0, 0x280(%rbp)
145889432:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
14588943c:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
145889446:     	leaq	0xb0(%rbp), %rcx
14588944d:     	leaq	0x240(%rbp), %rdx
145889454:     	callq	0x14599db30 <.text+0x599cb30>
145889459:     	nop
14588945a:     	movq	0xc0(%rbp), %rsi
145889461:     	cmpq	$0x2, %rsi
145889465:     	jae	0x14588b05e <.text+0x588a05e>
14588946b:     	leaq	0xb0(%rbp), %rcx
145889472:     	callq	0x145995ba0 <.text+0x5994ba0>
145889477:     	nop
145889478:     	movq	$0x0, 0x240(%rbp)
145889483:     	movq	0x378(%rbp), %rax
14588948a:     	movq	%rax, 0x248(%rbp)
145889491:     	movq	0x370(%rbp), %rcx
145889498:     	movq	%rcx, 0x250(%rbp)
14588949f:     	movq	%rax, 0x258(%rbp)
1458894a6:     	movq	$0x0, 0x260(%rbp)
1458894b1:     	movq	%rax, 0x268(%rbp)
1458894b8:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1458894c2:     	movq	%rax, 0x270(%rbp)
1458894c9:     	movb	$0x1, 0x278(%rbp)
1458894d0:     	movw	$0x0, 0x280(%rbp)
1458894d9:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
1458894e3:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
1458894ed:     	leaq	0x120(%rbp), %rcx
1458894f4:     	leaq	0x240(%rbp), %rdx
1458894fb:     	callq	0x1459a2c60 <.text+0x59a1c60>
145889500:     	nop
145889501:     	movq	0x130(%rbp), %r14
145889508:     	cmpq	$0x2, %r14
14588950c:     	jae	0x14588b092 <.text+0x588a092>
145889512:     	movq	$0x0, 0x240(%rbp)
14588951d:     	movq	0x378(%rbp), %rax
145889524:     	movq	%rax, 0x248(%rbp)
14588952b:     	leaq	0x250(%rbp), %rsi
145889532:     	movq	0x370(%rbp), %rcx
145889539:     	movq	%rcx, 0x250(%rbp)
145889540:     	movq	%rax, 0x258(%rbp)
145889547:     	movq	$0x0, 0x260(%rbp)
145889552:     	movq	%rax, 0x268(%rbp)
145889559:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145889563:     	movq	%rax, 0x270(%rbp)
14588956a:     	movb	$0x1, 0x278(%rbp)
145889571:     	movw	$0x0, 0x280(%rbp)
14588957a:     	xorl	%r13d, %r13d
14588957d:     	leaq	0x320(%rbp), %r14
145889584:     	movl	$0x65736572, %edi       # imm = 0x65736572
145889589:     	movl	$0x7c737465, %ebx       # imm = 0x7C737465
14588958e:     	movl	$0xa, %r12d
145889594:     	xorl	%eax, %eax
145889596:     	jmp	0x145889967 <.text+0x5888967>
14588959b:     	nopl	(%rax,%rax)
1458895a0:     	movq	0x210(%rbp), %rax
1458895a7:     	movb	%r12b, (%rax,%r13)
1458895ab:     	movq	%r15, 0x8(%rax,%r13)
1458895b0:     	incq	%r14
1458895b3:     	movq	%r14, 0x218(%rbp)
1458895ba:     	movq	%rbx, %rcx
1458895bd:     	cmpq	%rsi, %rcx
1458895c0:     	je	0x1458893d1 <.text+0x58883d1>
1458895c6:     	leaq	0x10(%rcx), %rbx
1458895ca:     	movzbl	(%rcx), %r12d
