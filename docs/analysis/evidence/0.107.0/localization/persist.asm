
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458c0150:     	subq	$0x28, %rsp
1458c0154:     	callq	0x1458be970 <.text+0x58bd970>
1458c0159:     	movq	0x278ef70(%rip), %rax   # 0x14804f0d0
1458c0160:     	cmpq	$0xd, %rax
1458c0164:     	movl	$0xd, %ecx
1458c0169:     	cmovbq	%rax, %rcx
1458c016d:     	imulq	$0x38, %rcx, %rax
1458c0171:     	leaq	0x15d3a10(%rip), %rcx   # 0x146e93b88
1458c0178:     	movq	(%rax,%rcx), %r8
1458c017c:     	leaq	0x1329865(%rip), %rcx   # 0x146be99e8
1458c0183:     	movl	$0x8, %edx
1458c0188:     	movl	$0x2, %r9d
1458c018e:     	addq	$0x28, %rsp
1458c0192:     	jmp	0x1458d0a00 <.text+0x58cfa00>
