
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458744e0:     	pushq	%rbp
1458744e1:     	pushq	%r14
1458744e3:     	pushq	%rsi
1458744e4:     	pushq	%rdi
1458744e5:     	pushq	%rbx
1458744e6:     	subq	$0x60, %rsp
1458744ea:     	leaq	0x60(%rsp), %rbp
1458744ef:     	movq	$-0x2, -0x8(%rbp)
1458744f7:     	movq	%rcx, %rdi
1458744fa:     	movq	%rcx, -0x38(%rbp)
1458744fe:     	leaq	-0x5872445(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145874505:     	movq	%rax, -0x30(%rbp)
145874509:     	leaq	0x132c83f(%rip), %rdx   # 0x146ba0d4f
145874510:     	leaq	-0x28(%rbp), %rcx
145874514:     	leaq	-0x38(%rbp), %r8
145874518:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14587451d:     	movq	-0x20(%rbp), %rcx
145874521:     	movq	-0x18(%rbp), %rdx
145874525:     	movq	0x10(%rdi), %rsi
145874529:     	movq	0x18(%rdi), %rbx
14587452d:     	movq	%rcx, -0x10(%rbp)
145874531:     	callq	0x1458da590 <.text+0x58d9590>
145874536:     	nop
145874537:     	movq	%rax, %rdi
14587453a:     	movq	-0x28(%rbp), %rax
14587453e:     	testq	%rax, %rax
145874541:     	je	0x14587455b <.text+0x587355b>
145874543:     	movl	$0x1, %r8d
145874549:     	movq	-0x10(%rbp), %rcx
14587454d:     	movq	%rdx, %r14
145874550:     	movq	%rax, %rdx
145874553:     	callq	0x1400021d0 <.text+0x11d0>
145874558:     	movq	%r14, %rdx
14587455b:     	testq	%rdi, %rdi
14587455e:     	cmovneq	%rdi, %rsi
145874562:     	cmoveq	%rbx, %rdx
145874566:     	movq	%rsi, %rax
145874569:     	addq	$0x60, %rsp
14587456d:     	popq	%rbx
14587456e:     	popq	%rdi
14587456f:     	popq	%rsi
145874570:     	popq	%r14
145874572:     	popq	%rbp
145874573:     	retq
