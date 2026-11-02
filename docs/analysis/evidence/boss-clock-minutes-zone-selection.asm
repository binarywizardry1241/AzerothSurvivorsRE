
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547967a: 41 80 bc 24 3e 09 00 00 00  	cmpb	$0x0, 0x93e(%r12)
145479683: 0f 85 f5 2f 00 00           	jne	0x14547c67e <.text+0x547b67e>
145479689: f3 41 0f 10 84 24 cc 08 00 00       	movss	0x8cc(%r12), %xmm0
145479693: f3 0f 5e 05 95 01 46 00     	divss	0x460195(%rip), %xmm0   # 0x1458d9830
14547969b: f3 0f 11 45 30              	movss	%xmm0, 0x30(%rbp)
1454796a0: 49 8b 8c 24 10 02 00 00     	movq	0x210(%r12), %rcx
1454796a8: 49 8b 94 24 18 02 00 00     	movq	0x218(%r12), %rdx
1454796b0: e8 db 9f f6 ff              	callq	0x1453e3690 <.text+0x53e2690>
1454796b5: 48 69 f0 b8 00 00 00        	imulq	$0xb8, %rax, %rsi
1454796bc: f2 45 0f 10 84 24 e0 03 00 00       	movsd	0x3e0(%r12), %xmm8
1454796c6: 41 8b bc 24 e8 03 00 00     	movl	0x3e8(%r12), %edi
1454796ce: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454796d1: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454796d4: 76 6c                       	jbe	0x145479742 <.text+0x5478742>
1454796d6: f2 41 0f 10 84 24 fc 08 00 00       	movsd	0x8fc(%r12), %xmm0
1454796e0: 41 0f 28 f8                 	movaps	%xmm8, %xmm7
1454796e4: 0f 5c f8                    	subps	%xmm0, %xmm7
1454796e7: f3 0f 12 c6                 	movsldup	%xmm6, %xmm0            # xmm0 = xmm6[0,0,2,2]
1454796eb: 0f 5e f8                    	divps	%xmm0, %xmm7
1454796ee: f3 0f 16 cf                 	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454796f2: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454796f5: e8 21 1b 29 00              	callq	0x14570b21b <.text+0x570a21b>
1454796fa: f3 0f 10 0d 62 01 46 00     	movss	0x460162(%rip), %xmm1   # 0x1458d9864
145479702: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
145479705: 76 3b                       	jbe	0x145479742 <.text+0x5478742>
145479707: 0f 28 05 82 73 42 00        	movaps	0x427382(%rip), %xmm0   # 0x1458a0a90
14547970e: 0f 57 c6                    	xorps	%xmm6, %xmm0
145479711: e8 e1 1a 29 00              	callq	0x14570b1f7 <.text+0x570a1f7>
145479716: f3 0f 10 0d b2 72 42 00     	movss	0x4272b2(%rip), %xmm1   # 0x1458a09d0
14547971e: f3 0f 5c c8                 	subss	%xmm0, %xmm1
145479722: f2 41 0f 10 84 24 90 08 00 00       	movsd	0x890(%r12), %xmm0
14547972c: 0f 5c f8                    	subps	%xmm0, %xmm7
14547972f: f3 0f 12 c9                 	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
145479733: 0f 59 cf                    	mulps	%xmm7, %xmm1
145479736: 0f 58 c8                    	addps	%xmm0, %xmm1
145479739: 41 0f 13 8c 24 90 08 00 00  	movlps	%xmm1, 0x890(%r12)
145479742: 48 8d 05 cf e2 24 01        	leaq	0x124e2cf(%rip), %rax   # 0x1466c7a18
145479749: 48 01 c6                    	addq	%rax, %rsi
14547974c: 48 89 b5 e8 02 00 00        	movq	%rsi, 0x2e8(%rbp)
