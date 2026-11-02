
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140001887: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
14000188b: 48 b9 00 00 00 00 00 00 00 80       	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
140001895: 48 31 c1                    	xorq	%rax, %rcx
140001898: 48 85 c0                    	testq	%rax, %rax
14000189b: b8 02 00 00 00              	movl	$0x2, %eax
1400018a0: 48 0f 48 c1                 	cmovsq	%rcx, %rax
1400018a4: 48 85 c0                    	testq	%rax, %rax
1400018a7: 74 24                       	je	0x1400018cd <.text+0x8cd>
1400018a9: 48 83 f8 01                 	cmpq	$0x1, %rax
1400018ad: 75 3c                       	jne	0x1400018eb <.text+0x8eb>
1400018af: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
1400018b6: 48 8d 0d 39 c8 89 05        	leaq	0x589c839(%rip), %rcx   # 0x14589e0f6
1400018bd: ba 51 00 00 00              	movl	$0x51, %edx
1400018c2: e8 89 85 6a 05              	callq	0x1456a9e50 <.text+0x56a8e50>
1400018c7: 90                          	nop
1400018c8: e9 9e 00 00 00              	jmp	0x14000196b <.text+0x96b>
1400018cd: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
1400018d4: 48 8d 0d fc c7 89 05        	leaq	0x589c7fc(%rip), %rcx   # 0x14589e0d7
1400018db: ba 3f 00 00 00              	movl	$0x3f, %edx
1400018e0: e8 6b 85 6a 05              	callq	0x1456a9e50 <.text+0x56a8e50>
1400018e5: 90                          	nop
1400018e6: e9 80 00 00 00              	jmp	0x14000196b <.text+0x96b>
