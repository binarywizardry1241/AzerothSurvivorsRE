
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f1030: 41 57                       	pushq	%r15
1454f1032: 41 56                       	pushq	%r14
1454f1034: 56                          	pushq	%rsi
1454f1035: 57                          	pushq	%rdi
1454f1036: 55                          	pushq	%rbp
1454f1037: 53                          	pushq	%rbx
1454f1038: 4c 8d 4a f8                 	leaq	-0x8(%rdx), %r9
1454f103c: 4c 8b 52 f8                 	movq	-0x8(%rdx), %r10
1454f1040: 48 8b 02                    	movq	(%rdx), %rax
1454f1043: 4d 8b 18                    	movq	(%r8), %r11
1454f1046: 49 8b 1b                    	movq	(%r11), %rbx
1454f1049: 49 8b 7b 08                 	movq	0x8(%r11), %rdi
1454f104d: 48 8b b3 c8 04 00 00        	movq	0x4c8(%rbx), %rsi
1454f1054: 48 69 9b d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rbx), %rbx # imm = 0x160
1454f105f: 45 31 f6                    	xorl	%r14d, %r14d
1454f1062: 49 89 f7                    	movq	%rsi, %r15
1454f1065: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454f1068: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454f1070: 41 b3 04                    	movb	$0x4, %r11b
1454f1073: 4c 39 f3                    	cmpq	%r14, %rbx
1454f1076: 74 64                       	je	0x1454f10dc <.text+0x54f00dc>
1454f1078: 49 81 c6 60 01 00 00        	addq	$0x160, %r14            # imm = 0x160
1454f107f: 49 39 87 88 00 00 00        	cmpq	%rax, 0x88(%r15)
1454f1086: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
1454f108d: 75 e1                       	jne	0x1454f1070 <.text+0x54f0070>
1454f108f: f3 42 0f 10 4c 36 e0        	movss	-0x20(%rsi,%r14), %xmm1
1454f1096: 0f 2e 0f                    	ucomiss	(%rdi), %xmm1
1454f1099: 77 41                       	ja	0x1454f10dc <.text+0x54f00dc>
1454f109b: f3 42 0f 10 44 36 90        	movss	-0x70(%rsi,%r14), %xmm0
1454f10a2: f3 42 0f 5e 44 36 94        	divss	-0x6c(%rsi,%r14), %xmm0
1454f10a9: 4a 83 bc 36 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rsi,%r14)
1454f10b2: 74 05                       	je	0x1454f10b9 <.text+0x54f00b9>
1454f10b4: 45 31 db                    	xorl	%r11d, %r11d
1454f10b7: eb 23                       	jmp	0x1454f10dc <.text+0x54f00dc>
1454f10b9: 41 b3 01                    	movb	$0x1, %r11b
1454f10bc: 42 80 7c 36 f8 00           	cmpb	$0x0, -0x8(%rsi,%r14)
1454f10c2: 75 18                       	jne	0x1454f10dc <.text+0x54f00dc>
1454f10c4: f3 0f 10 0d 78 9d 41 00     	movss	0x419d78(%rip), %xmm1   # 0x14590ae44
1454f10cc: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454f10cf: 41 0f 97 c3                 	seta	%r11b
1454f10d3: 77 03                       	ja	0x1454f10d8 <.text+0x54f00d8>
1454f10d5: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454f10d8: 41 80 f3 03                 	xorb	$0x3, %r11b
1454f10dc: 45 31 f6                    	xorl	%r14d, %r14d
1454f10df: 49 89 f7                    	movq	%rsi, %r15
1454f10e2: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454f10e5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454f10f0: 40 b5 04                    	movb	$0x4, %bpl
1454f10f3: 4c 39 f3                    	cmpq	%r14, %rbx
1454f10f6: 74 63                       	je	0x1454f115b <.text+0x54f015b>
1454f10f8: 49 81 c6 60 01 00 00        	addq	$0x160, %r14            # imm = 0x160
1454f10ff: 4d 39 97 88 00 00 00        	cmpq	%r10, 0x88(%r15)
1454f1106: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
1454f110d: 75 e1                       	jne	0x1454f10f0 <.text+0x54f00f0>
1454f110f: f3 42 0f 10 54 36 e0        	movss	-0x20(%rsi,%r14), %xmm2
1454f1116: 0f 2e 17                    	ucomiss	(%rdi), %xmm2
1454f1119: 77 40                       	ja	0x1454f115b <.text+0x54f015b>
1454f111b: f3 42 0f 10 4c 36 90        	movss	-0x70(%rsi,%r14), %xmm1
1454f1122: f3 42 0f 5e 4c 36 94        	divss	-0x6c(%rsi,%r14), %xmm1
1454f1129: 4a 83 bc 36 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rsi,%r14)
1454f1132: 74 04                       	je	0x1454f1138 <.text+0x54f0138>
1454f1134: 31 ed                       	xorl	%ebp, %ebp
1454f1136: eb 23                       	jmp	0x1454f115b <.text+0x54f015b>
1454f1138: 40 b5 01                    	movb	$0x1, %bpl
1454f113b: 42 80 7c 36 f8 00           	cmpb	$0x0, -0x8(%rsi,%r14)
1454f1141: 75 18                       	jne	0x1454f115b <.text+0x54f015b>
1454f1143: f3 0f 10 15 f9 9c 41 00     	movss	0x419cf9(%rip), %xmm2   # 0x14590ae44
1454f114b: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454f114e: 40 0f 97 c5                 	seta	%bpl
1454f1152: 77 03                       	ja	0x1454f1157 <.text+0x54f0157>
1454f1154: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454f1157: 40 80 f5 03                 	xorb	$0x3, %bpl
1454f115b: 41 38 eb                    	cmpb	%bpl, %r11b
1454f115e: 75 2d                       	jne	0x1454f118d <.text+0x54f018d>
1454f1160: 0f 14 c1                    	unpcklps	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
1454f1163: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454f1166: 66 0f 72 e1 1f              	psrad	$0x1f, %xmm1
1454f116b: 66 0f 72 d1 01              	psrld	$0x1, %xmm1
1454f1170: 66 0f ef c8                 	pxor	%xmm0, %xmm1
1454f1174: 66 0f 70 c1 55              	pshufd	$0x55, %xmm1, %xmm0     # xmm0 = xmm1[1,1,1,1]
1454f1179: 66 0f 66 c1                 	pcmpgtd	%xmm1, %xmm0
1454f117d: 66 41 0f 7e c3              	movd	%xmm0, %r11d
1454f1182: 41 f6 c3 01                 	testb	$0x1, %r11b
1454f1186: 75 0b                       	jne	0x1454f1193 <.text+0x54f0193>
1454f1188: e9 90 01 00 00              	jmp	0x1454f131d <.text+0x54f031d>
1454f118d: 0f 83 8a 01 00 00           	jae	0x1454f131d <.text+0x54f031d>
1454f1193: 4c 89 12                    	movq	%r10, (%rdx)
1454f1196: 49 39 c9                    	cmpq	%rcx, %r9
1454f1199: 0f 84 7b 01 00 00           	je	0x1454f131a <.text+0x54f031a>
1454f119f: f3 0f 10 05 9d 9c 41 00     	movss	0x419c9d(%rip), %xmm0   # 0x14590ae44
1454f11a7: eb 19                       	jmp	0x1454f11c2 <.text+0x54f01c2>
1454f11a9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454f11b0: 0f 83 5f 01 00 00           	jae	0x1454f1315 <.text+0x54f0315>
1454f11b6: 4c 89 12                    	movq	%r10, (%rdx)
1454f11b9: 49 39 c9                    	cmpq	%rcx, %r9
1454f11bc: 0f 84 58 01 00 00           	je	0x1454f131a <.text+0x54f031a>
1454f11c2: 4c 89 ca                    	movq	%r9, %rdx
1454f11c5: 49 83 c1 f8                 	addq	$-0x8, %r9
1454f11c9: 4c 8b 52 f8                 	movq	-0x8(%rdx), %r10
1454f11cd: 4d 8b 18                    	movq	(%r8), %r11
1454f11d0: 49 8b 1b                    	movq	(%r11), %rbx
1454f11d3: 49 8b 7b 08                 	movq	0x8(%r11), %rdi
1454f11d7: 48 8b b3 c8 04 00 00        	movq	0x4c8(%rbx), %rsi
1454f11de: 48 69 9b d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rbx), %rbx # imm = 0x160
1454f11e9: 45 31 f6                    	xorl	%r14d, %r14d
1454f11ec: 49 89 f7                    	movq	%rsi, %r15
1454f11ef: 90                          	nop
1454f11f0: 41 b3 04                    	movb	$0x4, %r11b
1454f11f3: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454f11f6: 4c 39 f3                    	cmpq	%r14, %rbx
1454f11f9: 74 65                       	je	0x1454f1260 <.text+0x54f0260>
1454f11fb: 49 81 c6 60 01 00 00        	addq	$0x160, %r14            # imm = 0x160
1454f1202: 49 39 87 88 00 00 00        	cmpq	%rax, 0x88(%r15)
1454f1209: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
1454f1210: 75 de                       	jne	0x1454f11f0 <.text+0x54f01f0>
1454f1212: f3 42 0f 10 54 36 e0        	movss	-0x20(%rsi,%r14), %xmm2
1454f1219: 0f 2e 17                    	ucomiss	(%rdi), %xmm2
1454f121c: 77 42                       	ja	0x1454f1260 <.text+0x54f0260>
1454f121e: f3 42 0f 10 4c 36 90        	movss	-0x70(%rsi,%r14), %xmm1
1454f1225: f3 42 0f 5e 4c 36 94        	divss	-0x6c(%rsi,%r14), %xmm1
1454f122c: 4a 83 bc 36 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rsi,%r14)
1454f1235: 74 05                       	je	0x1454f123c <.text+0x54f023c>
1454f1237: 45 31 db                    	xorl	%r11d, %r11d
1454f123a: eb 24                       	jmp	0x1454f1260 <.text+0x54f0260>
1454f123c: 41 b3 01                    	movb	$0x1, %r11b
1454f123f: 42 80 7c 36 f8 00           	cmpb	$0x0, -0x8(%rsi,%r14)
1454f1245: 75 19                       	jne	0x1454f1260 <.text+0x54f0260>
1454f1247: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1454f124a: 41 0f 97 c3                 	seta	%r11b
1454f124e: 77 03                       	ja	0x1454f1253 <.text+0x54f0253>
1454f1250: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454f1253: 41 80 f3 03                 	xorb	$0x3, %r11b
1454f1257: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454f1260: 45 31 f6                    	xorl	%r14d, %r14d
1454f1263: 49 89 f7                    	movq	%rsi, %r15
1454f1266: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454f1270: 40 b5 04                    	movb	$0x4, %bpl
1454f1273: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454f1276: 4c 39 f3                    	cmpq	%r14, %rbx
1454f1279: 74 65                       	je	0x1454f12e0 <.text+0x54f02e0>
1454f127b: 49 81 c6 60 01 00 00        	addq	$0x160, %r14            # imm = 0x160
1454f1282: 4d 39 97 88 00 00 00        	cmpq	%r10, 0x88(%r15)
1454f1289: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
1454f1290: 75 de                       	jne	0x1454f1270 <.text+0x54f0270>
1454f1292: f3 42 0f 10 5c 36 e0        	movss	-0x20(%rsi,%r14), %xmm3
1454f1299: 0f 2e 1f                    	ucomiss	(%rdi), %xmm3
1454f129c: 77 42                       	ja	0x1454f12e0 <.text+0x54f02e0>
1454f129e: f3 42 0f 10 54 36 90        	movss	-0x70(%rsi,%r14), %xmm2
1454f12a5: f3 42 0f 5e 54 36 94        	divss	-0x6c(%rsi,%r14), %xmm2
1454f12ac: 4a 83 bc 36 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rsi,%r14)
1454f12b5: 74 04                       	je	0x1454f12bb <.text+0x54f02bb>
1454f12b7: 31 ed                       	xorl	%ebp, %ebp
1454f12b9: eb 25                       	jmp	0x1454f12e0 <.text+0x54f02e0>
1454f12bb: 40 b5 01                    	movb	$0x1, %bpl
1454f12be: 42 80 7c 36 f8 00           	cmpb	$0x0, -0x8(%rsi,%r14)
1454f12c4: 75 1a                       	jne	0x1454f12e0 <.text+0x54f02e0>
1454f12c6: 0f 2e c2                    	ucomiss	%xmm2, %xmm0
1454f12c9: 40 0f 97 c5                 	seta	%bpl
1454f12cd: 77 03                       	ja	0x1454f12d2 <.text+0x54f02d2>
1454f12cf: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454f12d2: 40 80 f5 03                 	xorb	$0x3, %bpl
1454f12d6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454f12e0: 41 38 eb                    	cmpb	%bpl, %r11b
1454f12e3: 0f 85 c7 fe ff ff           	jne	0x1454f11b0 <.text+0x54f01b0>
1454f12e9: 0f 14 ca                    	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
1454f12ec: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454f12ef: 66 0f 72 e2 1f              	psrad	$0x1f, %xmm2
1454f12f4: 66 0f 72 d2 01              	psrld	$0x1, %xmm2
1454f12f9: 66 0f ef d1                 	pxor	%xmm1, %xmm2
1454f12fd: 66 0f 70 ca 55              	pshufd	$0x55, %xmm2, %xmm1     # xmm1 = xmm2[1,1,1,1]
1454f1302: 66 0f 66 ca                 	pcmpgtd	%xmm2, %xmm1
1454f1306: 66 41 0f 7e cb              	movd	%xmm1, %r11d
1454f130b: 41 f6 c3 01                 	testb	$0x1, %r11b
1454f130f: 0f 85 a1 fe ff ff           	jne	0x1454f11b6 <.text+0x54f01b6>
1454f1315: 48 89 02                    	movq	%rax, (%rdx)
1454f1318: eb 03                       	jmp	0x1454f131d <.text+0x54f031d>
1454f131a: 49 89 01                    	movq	%rax, (%r9)
1454f131d: 5b                          	popq	%rbx
1454f131e: 5d                          	popq	%rbp
1454f131f: 5f                          	popq	%rdi
1454f1320: 5e                          	popq	%rsi
1454f1321: 41 5e                       	popq	%r14
1454f1323: 41 5f                       	popq	%r15
1454f1325: c3                          	retq
