
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458895ce:     	movq	0x8(%rcx), %r15
1458895d2:     	addq	$0x2, %r15
1458895d6:     	cmpq	$0xc, %r15
1458895da:     	cmovaeq	%rdi, %r15
1458895de:     	movq	0x210(%rbp), %rax
1458895e5:     	movq	0x218(%rbp), %r14
1458895ec:     	movq	%r14, %r13
1458895ef:     	shlq	$0x4, %r13
1458895f3:     	xorl	%ecx, %ecx
1458895f5:     	nopw	%cs:(%rax,%rax)
145889600:     	cmpq	%rcx, %r13
145889603:     	je	0x145889630 <.text+0x5888630>
145889605:     	leaq	0x10(%rcx), %rdx
145889609:     	cmpb	%r12b, (%rax,%rcx)
14588960d:     	movq	%rdx, %rcx
145889610:     	jne	0x145889600 <.text+0x5888600>
145889612:     	movq	-0x8(%rax,%rdx), %rcx
145889617:     	cmpq	%rcx, %r15
14588961a:     	cmovaq	%r15, %rcx
14588961e:     	movq	%rcx, -0x8(%rax,%rdx)
145889623:     	movq	%rbx, %rcx
145889626:     	cmpq	%rsi, %rcx
145889629:     	jne	0x1458895c6 <.text+0x58885c6>
14588962b:     	jmp	0x1458893d1 <.text+0x58883d1>
145889630:     	cmpq	0x208(%rbp), %r14
145889637:     	jne	0x1458895a7 <.text+0x58885a7>
14588963d:     	leaq	0x208(%rbp), %rcx
145889644:     	callq	0x145bcb680 <.text+0x5bca680>
145889649:     	nop
14588964a:     	jmp	0x1458895a0 <.text+0x58885a0>
