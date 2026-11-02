
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14000175f: 48 8d 15 62 c9 89 05        	leaq	0x589c962(%rip), %rdx   # 0x14589e0c8
140001766: 48 8d 8d f0 00 00 00        	leaq	0xf0(%rbp), %rcx
14000176d: 41 b8 0e 00 00 00           	movl	$0xe, %r8d
140001773: e8 08 f7 6a 05              	callq	0x1456b0e80 <.text+0x56afe80>
140001778: 90                          	nop
140001779: 48 8b 95 f0 00 00 00        	movq	0xf0(%rbp), %rdx
140001780: 31 c0                       	xorl	%eax, %eax
140001782: 48 83 fa fe                 	cmpq	$-0x2, %rdx
140001786: 75 17                       	jne	0x14000179f <.text+0x79f>
140001788: 48 83 bd 08 01 00 00 01     	cmpq	$0x1, 0x108(%rbp)
140001790: 75 0d                       	jne	0x14000179f <.text+0x79f>
140001792: 48 8b 85 00 01 00 00        	movq	0x100(%rbp), %rax
140001799: 80 38 31                    	cmpb	$0x31, (%rax)
14000179c: 0f 94 c0                    	sete	%al
