Disassembly of section .text:

0000000140001000 <.text>:
1458a60bf:     	cmpl	$0x2, 0x10(%rsi)
1458a60c3:     	je	0x1458a60d6 <.text+0x58a50d6>
1458a60c5:     	leaq	0x10(%rsi), %rcx
1458a60c9:     	callq	0x1459394b0 <.text+0x59384b0>
1458a60ce:     	testb	%al, %al
1458a60d0:     	jne	0x1458a6dc2 <.text+0x58a5dc2>
1458a60d6:     	movq	%rsi, %rcx
1458a60d9:     	addq	$0x21b8, %rsp           # imm = 0x21B8
1458a60e0:     	popq	%rbx
1458a60e1:     	popq	%rdi
1458a60e2:     	popq	%rsi
1458a60e3:     	popq	%r12
1458a60e5:     	popq	%r13
1458a60e7:     	popq	%r14
1458a60e9:     	popq	%r15
1458a60eb:     	popq	%rbp
1458a60ec:     	jmp	0x1458a20d0 <.text+0x58a10d0>
