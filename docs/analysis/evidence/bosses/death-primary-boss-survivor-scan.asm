
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c41d3:     	movq	0x150(%rbp), %rcx
1454c41da:     	testq	%rcx, %rcx
1454c41dd:     	je	0x1454c422b <.text+0x54c322b>
1454c41df:     	movq	0x4c8(%rsi), %r8
1454c41e6:     	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454c41f1:     	nopw	%cs:(%rax,%rax)
1454c4200:     	testq	%rax, %rax
1454c4203:     	je	0x1454c44dd <.text+0x54c34dd>
1454c4209:     	movq	%r8, %rdx
1454c420c:     	addq	$0x160, %r8             # imm = 0x160
1454c4213:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454c4219:     	cmpb	$0x0, 0x68(%rdx)
1454c421d:     	jne	0x1454c4200 <.text+0x54c3200>
1454c421f:     	cmpq	$-0x1, 0x18(%rdx)
1454c4224:     	je	0x1454c4200 <.text+0x54c3200>
1454c4226:     	jmp	0x1454c4509 <.text+0x54c3509>
