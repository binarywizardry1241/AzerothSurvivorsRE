
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145463484: 80 b9 42 09 00 00 01        	cmpb	$0x1, 0x942(%rcx)
14546348b: 0f 85 48 0b 00 00           	jne	0x145463fd9 <.text+0x5462fd9>
145463491: 49 89 cc                    	movq	%rcx, %r12
145463494: 80 b9 3b 09 00 00 00        	cmpb	$0x0, 0x93b(%rcx)
14546349b: 0f 85 38 0b 00 00           	jne	0x145463fd9 <.text+0x5462fd9>
1454634a1: 4d 89 c5                    	movq	%r8, %r13
1454634a4: 0f 28 f1                    	movaps	%xmm1, %xmm6
1454634a7: f3 41 0f 10 bc 24 cc 08 00 00       	movss	0x8cc(%r12), %xmm7
1454634b1: f3 0f 11 7d dc              	movss	%xmm7, -0x24(%rbp)
1454634b6: 4d 8d bc 24 f0 02 00 00     	leaq	0x2f0(%r12), %r15
1454634be: 49 8b 84 24 f8 02 00 00     	movq	0x2f8(%r12), %rax
1454634c6: 49 8b 8c 24 00 03 00 00     	movq	0x300(%r12), %rcx
1454634ce: 48 8d 14 cd 00 00 00 00     	leaq	(,%rcx,8), %rdx
1454634d6: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
1454634da: 49 89 c0                    	movq	%rax, %r8
1454634dd: 0f 1f 00                    	nopl	(%rax)
1454634e0: 48 85 d2                    	testq	%rdx, %rdx
1454634e3: 74 21                       	je	0x145463506 <.text+0x5462506>
1454634e5: 4d 89 c2                    	movq	%r8, %r10
1454634e8: 49 83 c0 18                 	addq	$0x18, %r8
1454634ec: f3 41 0f 10 42 10           	movss	0x10(%r10), %xmm0
1454634f2: 48 83 c2 e8                 	addq	$-0x18, %rdx
1454634f6: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454634f9: 76 e5                       	jbe	0x1454634e0 <.text+0x54624e0>
1454634fb: 41 83 3a 0b                 	cmpl	$0xb, (%r10)
1454634ff: 75 df                       	jne	0x1454634e0 <.text+0x54624e0>
145463501: e9 d3 0a 00 00              	jmp	0x145463fd9 <.text+0x5462fd9>
145463506: f3 0f 10 05 c2 d4 43 00     	movss	0x43d4c2(%rip), %xmm0   # 0x1458a09d0
14546350e: f3 41 0f 5c 84 24 70 04 00 00       	subss	0x470(%r12), %xmm0
145463518: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
14546351c: f3 45 0f 10 84 24 fc 03 00 00       	movss	0x3fc(%r12), %xmm8
145463526: 0f 57 c0                    	xorps	%xmm0, %xmm0
145463529: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
14546352d: 0f 86 10 02 00 00           	jbe	0x145463743 <.text+0x5462743>
145463533: 0f 28 ce                    	movaps	%xmm6, %xmm1
145463536: f3 41 0f 5d c8              	minss	%xmm8, %xmm1
14546353b: 44 0f 28 c9                 	movaps	%xmm1, %xmm9
14546353f: f3 44 0f c2 c9 03           	cmpunordss	%xmm1, %xmm9
145463545: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
145463549: 0f 55 d1                    	andnps	%xmm1, %xmm2
14546354c: 44 0f 54 ce                 	andps	%xmm6, %xmm9
145463550: 44 0f 56 ca                 	orps	%xmm2, %xmm9
145463554: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
145463558: f3 41 0f 5c c9              	subss	%xmm9, %xmm1
14546355d: f3 41 0f 11 8c 24 fc 03 00 00       	movss	%xmm1, 0x3fc(%r12)
