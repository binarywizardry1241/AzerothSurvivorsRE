
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145470654: 0f 28 f1                    	movaps	%xmm1, %xmm6
145470657: 49 89 cc                    	movq	%rcx, %r12
14547065a: 0f b6 81 42 09 00 00        	movzbl	0x942(%rcx), %eax
145470661: 84 c0                       	testb	%al, %al
145470663: 75 25                       	jne	0x14547068a <.text+0x546f68a>
145470665: 41 80 bc 24 3a 09 00 00 00  	cmpb	$0x0, 0x93a(%r12)
14547066e: 74 1a                       	je	0x14547068a <.text+0x546f68a>
145470670: 41 c6 84 24 3a 09 00 00 00  	movb	$0x0, 0x93a(%r12)
145470679: 4c 89 e1                    	movq	%r12, %rcx
14547067c: e8 5f 23 01 00              	callq	0x1454829e0 <.text+0x54819e0>
145470681: 41 0f b6 84 24 42 09 00 00  	movzbl	0x942(%r12), %eax
14547068a: 3c 01                       	cmpb	$0x1, %al
14547068c: 4c 89 a5 08 03 00 00        	movq	%r12, 0x308(%rbp)
145470693: 0f 85 05 c1 00 00           	jne	0x14547c79e <.text+0x547b79e>
145470699: f3 41 0f 10 bc 24 cc 08 00 00       	movss	0x8cc(%r12), %xmm7
1454706a3: f3 0f 58 fe                 	addss	%xmm6, %xmm7
1454706a7: f3 41 0f 11 bc 24 cc 08 00 00       	movss	%xmm7, 0x8cc(%r12)
