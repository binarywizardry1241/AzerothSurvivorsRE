
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547a22b: 4c 8b a5 08 03 00 00        	movq	0x308(%rbp), %r12
14547a232: 48 8b b5 e8 02 00 00        	movq	0x2e8(%rbp), %rsi
14547a239: 49 8b 84 24 98 08 00 00     	movq	0x898(%r12), %rax
14547a241: 48 83 f8 05                 	cmpq	$0x5, %rax
14547a245: 0f 83 6f 16 00 00           	jae	0x14547b8ba <.text+0x547a8ba>
14547a24b: 48 8b 56 58                 	movq	0x58(%rsi), %rdx
14547a24f: 48 6b c8 58                 	imulq	$0x58, %rax, %rcx
14547a253: f3 0f 10 4d 30              	movss	0x30(%rbp), %xmm1
14547a258: 0f 2e 4c 0a 40              	ucomiss	0x40(%rdx,%rcx), %xmm1
14547a25d: 0f 82 1f 17 00 00           	jb	0x14547b982 <.text+0x547a982>
14547a263: 48 01 ca                    	addq	%rcx, %rdx
14547a266: 48 ff c0                    	incq	%rax
14547a269: 49 89 84 24 98 08 00 00     	movq	%rax, 0x898(%r12)
14547a271: 4c 89 e1                    	movq	%r12, %rcx
14547a274: e8 87 56 01 00              	callq	0x14548f900 <.text+0x548e900>
14547a279: 90                          	nop
14547a27a: f3 41 0f 10 84 24 cc 08 00 00       	movss	0x8cc(%r12), %xmm0
