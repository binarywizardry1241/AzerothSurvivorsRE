
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140171345:     	testq	%rdi, %rdi
140171348:     	je	0x140171371 <.text+0x170371>
14017134a:     	movl	$0xfd2, %ecx            # imm = 0xFD2
14017134f:     	cmpb	$0x1, (%r8)
140171353:     	jne	0x140171369 <.text+0x170369>
140171355:     	cmpb	$-0x1, 0x80(%rdx)
14017135c:     	movl	$0xfd2, %edx            # imm = 0xFD2
140171361:     	movl	$0x1798, %ecx           # imm = 0x1798
140171366:     	cmovel	%edx, %ecx
140171369:     	cmpl	%ecx, (%rdi)
14017136b:     	je	0x140171371 <.text+0x170371>
14017136d:     	movl	%eax, (%rsi)
14017136f:     	movl	%ecx, (%rdi)
140171371:     	popq	%rbx
140171372:     	popq	%rbp
140171373:     	popq	%rdi
140171374:     	popq	%rsi
140171375:     	popq	%r12
140171377:     	popq	%r13
140171379:     	popq	%r14
14017137b:     	popq	%r15
14017137d:     	retq
