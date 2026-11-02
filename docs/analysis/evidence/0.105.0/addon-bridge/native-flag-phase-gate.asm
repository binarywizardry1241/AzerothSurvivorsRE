
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145901dfa: 0f b6 81 73 0a 00 00        	movzbl	0xa73(%rcx), %eax
145901e01: 84 c0                       	testb	%al, %al
145901e03: 75 22                       	jne	0x145901e27 <.text+0x5900e27>
145901e05: 41 80 bd 6b 0a 00 00 00     	cmpb	$0x0, 0xa6b(%r13)
145901e0d: 74 18                       	je	0x145901e27 <.text+0x5900e27>
145901e0f: 41 c6 85 6b 0a 00 00 00     	movb	$0x0, 0xa6b(%r13)
145901e17: 4c 89 e9                    	movq	%r13, %rcx
145901e1a: e8 a1 5e 01 00              	callq	0x145917cc0 <.text+0x5916cc0>
145901e1f: 41 0f b6 85 73 0a 00 00     	movzbl	0xa73(%r13), %eax
145901e27: 3c 01                       	cmpb	$0x1, %al
145901e29: 4c 89 ad 78 03 00 00        	movq	%r13, 0x378(%rbp)
145901e30: 0f 85 69 e1 00 00           	jne	0x14590ff9f <.text+0x590ef9f>
