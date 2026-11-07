
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145935431:     	movq	0x560(%rdi), %rcx
145935438:     	imulq	$0x160, 0x568(%rdi), %rax # imm = 0x160
145935443:     	nopw	%cs:(%rax,%rax)
145935450:     	testq	%rax, %rax
145935453:     	je	0x145935728 <.text+0x5934728>
145935459:     	movq	%rcx, %rdx
14593545c:     	addq	$0x160, %rcx            # imm = 0x160
145935463:     	addq	$-0x160, %rax           # imm = 0xFEA0
145935469:     	cmpb	$0x0, 0x68(%rdx)
14593546d:     	jne	0x145935450 <.text+0x5934450>
14593546f:     	cmpq	$-0x1, 0x18(%rdx)
145935474:     	je	0x145935450 <.text+0x5934450>
145935476:     	jmp	0x145935754 <.text+0x5934754>
