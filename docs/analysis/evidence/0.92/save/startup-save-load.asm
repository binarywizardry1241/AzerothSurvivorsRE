
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401120b0:     	pushq	%rbp
1401120b1:     	pushq	%r14
1401120b3:     	pushq	%rsi
1401120b4:     	pushq	%rdi
1401120b5:     	pushq	%rbx
1401120b6:     	subq	$0x2c0, %rsp            # imm = 0x2C0
1401120bd:     	leaq	0x80(%rsp), %rbp
1401120c5:     	movq	$-0x2, 0x238(%rbp)
1401120d0:     	movq	%rcx, %rsi
1401120d3:     	leaq	-0x58(%rbp), %rcx
1401120d7:     	callq	0x1453f9d00 <.text+0x53f8d00>
1401120dc:     	cmpq	$-0x1, 0xe0(%rbp)
1401120e4:     	je	0x1401121da <.text+0x1111da>
