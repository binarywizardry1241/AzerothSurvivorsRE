
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549d550: 55                          	pushq	%rbp
14549d551: 41 57                       	pushq	%r15
14549d553: 41 56                       	pushq	%r14
14549d555: 41 55                       	pushq	%r13
14549d557: 41 54                       	pushq	%r12
14549d559: 56                          	pushq	%rsi
14549d55a: 57                          	pushq	%rdi
14549d55b: 53                          	pushq	%rbx
14549d55c: 48 81 ec a8 04 00 00        	subq	$0x4a8, %rsp            # imm = 0x4A8
14549d563: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14549d56b: 44 0f 29 bd 10 04 00 00     	movaps	%xmm15, 0x410(%rbp)
14549d573: 44 0f 29 b5 00 04 00 00     	movaps	%xmm14, 0x400(%rbp)
14549d57b: 44 0f 29 ad f0 03 00 00     	movaps	%xmm13, 0x3f0(%rbp)
14549d583: 44 0f 29 a5 e0 03 00 00     	movaps	%xmm12, 0x3e0(%rbp)
14549d58b: 44 0f 29 9d d0 03 00 00     	movaps	%xmm11, 0x3d0(%rbp)
14549d593: 44 0f 29 95 c0 03 00 00     	movaps	%xmm10, 0x3c0(%rbp)
14549d59b: 44 0f 29 8d b0 03 00 00     	movaps	%xmm9, 0x3b0(%rbp)
14549d5a3: 44 0f 29 85 a0 03 00 00     	movaps	%xmm8, 0x3a0(%rbp)
14549d5ab: 0f 29 bd 90 03 00 00        	movaps	%xmm7, 0x390(%rbp)
14549d5b2: 0f 29 b5 80 03 00 00        	movaps	%xmm6, 0x380(%rbp)
14549d5b9: 48 c7 85 78 03 00 00 fe ff ff ff    	movq	$-0x2, 0x378(%rbp)
14549d5c4: 0f 28 f1                    	movaps	%xmm1, %xmm6
14549d5c7: 49 89 cd                    	movq	%rcx, %r13
14549d5ca: 0f b6 81 5f 09 00 00        	movzbl	0x95f(%rcx), %eax
14549d5d1: 84 c0                       	testb	%al, %al
14549d5d3: 75 22                       	jne	0x14549d5f7 <.text+0x549c5f7>
14549d5d5: 41 80 bd 57 09 00 00 00     	cmpb	$0x0, 0x957(%r13)
14549d5dd: 74 18                       	je	0x14549d5f7 <.text+0x549c5f7>
14549d5df: 41 c6 85 57 09 00 00 00     	movb	$0x0, 0x957(%r13)
14549d5e7: 4c 89 e9                    	movq	%r13, %rcx
14549d5ea: e8 d1 31 01 00              	callq	0x1454b07c0 <.text+0x54af7c0>
14549d5ef: 41 0f b6 85 5f 09 00 00     	movzbl	0x95f(%r13), %eax
14549d5f7: 3c 01                       	cmpb	$0x1, %al
14549d5f9: 4c 89 ad 68 03 00 00        	movq	%r13, 0x368(%rbp)
14549d600: 0f 85 2f cc 00 00           	jne	0x1454aa235 <.text+0x54a9235>
14549d606: f3 41 0f 10 bd e4 08 00 00  	movss	0x8e4(%r13), %xmm7
14549d60f: f3 0f 58 fe                 	addss	%xmm6, %xmm7
14549d613: f3 41 0f 11 bd e4 08 00 00  	movss	%xmm7, 0x8e4(%r13)
14549d61c: 41 80 bd 58 09 00 00 00     	cmpb	$0x0, 0x958(%r13)
14549d624: 0f 84 60 03 00 00           	je	0x14549d98a <.text+0x549c98a>
14549d62a: f3 41 0f 10 85 58 04 00 00  	movss	0x458(%r13), %xmm0
14549d633: f3 41 0f 11 85 00 04 00 00  	movss	%xmm0, 0x400(%r13)
14549d63c: 41 c7 85 ec 08 00 00 00 00 00 00    	movl	$0x0, 0x8ec(%r13)
14549d647: 41 0f 2e bd 40 09 00 00     	ucomiss	0x940(%r13), %xmm7
14549d64f: 0f 82 35 03 00 00           	jb	0x14549d98a <.text+0x549c98a>
14549d655: f3 0f 58 3d a3 de 44 00     	addss	0x44dea3(%rip), %xmm7   # 0x1458eb500
14549d65d: f3 41 0f 11 bd 40 09 00 00  	movss	%xmm7, 0x940(%r13)
14549d666: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
14549d66d: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
14549d674: e8 a7 11 f7 ff              	callq	0x14540e820 <.text+0x540d820>
14549d679: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
14549d680: 48 8d 0d b1 8d 27 01        	leaq	0x1278db1(%rip), %rcx   # 0x146716438
14549d687: 4c 8b b4 08 80 00 00 00     	movq	0x80(%rax,%rcx), %r14
14549d68f: 4d 85 f6                    	testq	%r14, %r14
14549d692: 78 07                       	js	0x14549d69b <.text+0x549c69b>
14549d694: f3 4d 0f 2a de              	cvtsi2ss	%r14, %xmm11
14549d699: eb 19                       	jmp	0x14549d6b4 <.text+0x549c6b4>
14549d69b: 4c 89 f0                    	movq	%r14, %rax
14549d69e: 48 d1 e8                    	shrq	%rax
14549d6a1: 44 89 f1                    	movl	%r14d, %ecx
14549d6a4: 83 e1 01                    	andl	$0x1, %ecx
14549d6a7: 48 09 c1                    	orq	%rax, %rcx
14549d6aa: f3 4c 0f 2a d9              	cvtsi2ss	%rcx, %xmm11
14549d6af: f3 45 0f 58 db              	addss	%xmm11, %xmm11
14549d6b4: f2 45 0f 10 95 e8 03 00 00  	movsd	0x3e8(%r13), %xmm10
14549d6bd: f3 45 0f 10 8d f0 03 00 00  	movss	0x3f0(%r13), %xmm9
14549d6c6: 31 db                       	xorl	%ebx, %ebx
14549d6c8: f3 44 0f 10 25 43 f9 44 00  	movss	0x44f943(%rip), %xmm12  # 0x1458ed014
14549d6d1: 44 0f 28 2d 57 cc 50 01     	movaps	0x150cc57(%rip), %xmm13 # 0x1469aa330
14549d6d9: 48 8d bd a0 00 00 00        	leaq	0xa0(%rbp), %rdi
14549d6e0: eb 4e                       	jmp	0x14549d730 <.text+0x549c730>
14549d6e2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14549d6f0: f3 41 0f 10 87 90 00 00 00  	movss	0x90(%r15), %xmm0
14549d6f9: 48 8d 73 01                 	leaq	0x1(%rbx), %rsi
14549d6fd: 0f 13 bd a4 00 00 00        	movlps	%xmm7, 0xa4(%rbp)
14549d704: f3 0f 11 85 ac 00 00 00     	movss	%xmm0, 0xac(%rbp)
14549d70c: c7 85 a0 00 00 00 01 00 00 00       	movl	$0x1, 0xa0(%rbp)
14549d716: 4c 89 e9                    	movq	%r13, %rcx
14549d719: 48 89 da                    	movq	%rbx, %rdx
14549d71c: 49 89 f8                    	movq	%rdi, %r8
14549d71f: e8 1c 49 02 00              	callq	0x1454c2040 <.text+0x54c1040>
14549d724: 48 89 f3                    	movq	%rsi, %rbx
14549d727: 49 39 f6                    	cmpq	%rsi, %r14
14549d72a: 0f 84 b2 00 00 00           	je	0x14549d7e2 <.text+0x549c7e2>
14549d730: 48 85 db                    	testq	%rbx, %rbx
14549d733: 78 0b                       	js	0x14549d740 <.text+0x549c740>
14549d735: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
14549d739: f3 4c 0f 2a c3              	cvtsi2ss	%rbx, %xmm8
14549d73e: eb 1c                       	jmp	0x14549d75c <.text+0x549c75c>
14549d740: 48 89 d8                    	movq	%rbx, %rax
14549d743: 48 d1 e8                    	shrq	%rax
14549d746: 89 d9                       	movl	%ebx, %ecx
14549d748: 83 e1 01                    	andl	$0x1, %ecx
14549d74b: 48 09 c1                    	orq	%rax, %rcx
14549d74e: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
14549d752: f3 4c 0f 2a c1              	cvtsi2ss	%rcx, %xmm8
14549d757: f3 45 0f 58 c0              	addss	%xmm8, %xmm8
14549d75c: f3 45 0f 5e c3              	divss	%xmm11, %xmm8
14549d761: f3 45 0f 59 c4              	mulss	%xmm12, %xmm8
14549d766: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
14549d76a: e8 c2 96 2b 00              	callq	0x145756e31 <.text+0x5755e31>
14549d76f: 0f 28 f8                    	movaps	%xmm0, %xmm7
14549d772: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
14549d776: e8 b0 96 2b 00              	callq	0x145756e2b <.text+0x5755e2b>
14549d77b: 0f 14 f8                    	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
14549d77e: 41 0f 59 fd                 	mulps	%xmm13, %xmm7
14549d782: 41 0f 58 fa                 	addps	%xmm10, %xmm7
14549d786: f3 44 0f 16 c7              	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
14549d78b: 4d 8b bd 78 08 00 00        	movq	0x878(%r13), %r15
14549d792: 49 8d 4f 10                 	leaq	0x10(%r15), %rcx
14549d796: 0f 28 cf                    	movaps	%xmm7, %xmm1
14549d799: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
14549d79d: e8 4e 50 fc ff              	callq	0x1454627f0 <.text+0x54617f0>
14549d7a2: a8 01                       	testb	$0x1, %al
14549d7a4: 0f 85 4f ff ff ff           	jne	0x14549d6f9 <.text+0x549c6f9>
14549d7aa: 49 83 7f 68 ff              	cmpq	$-0x1, 0x68(%r15)
14549d7af: 0f 84 3b ff ff ff           	je	0x14549d6f0 <.text+0x549c6f0>
14549d7b5: 49 8d 57 68                 	leaq	0x68(%r15), %rdx
14549d7b9: 48 89 f9                    	movq	%rdi, %rcx
14549d7bc: 0f 28 d7                    	movaps	%xmm7, %xmm2
14549d7bf: 41 0f 28 d8                 	movaps	%xmm8, %xmm3
14549d7c3: e8 28 a4 fc ff              	callq	0x145467bf0 <.text+0x5466bf0>
14549d7c8: 83 bd a0 00 00 00 01        	cmpl	$0x1, 0xa0(%rbp)
14549d7cf: 0f 85 1b ff ff ff           	jne	0x14549d6f0 <.text+0x549c6f0>
14549d7d5: f3 0f 10 85 ac 00 00 00     	movss	0xac(%rbp), %xmm0
14549d7dd: e9 17 ff ff ff              	jmp	0x14549d6f9 <.text+0x549c6f9>
14549d7e2: f3 0f 10 05 b2 a1 52 00     	movss	0x52a1b2(%rip), %xmm0   # 0x1459c799c
14549d7ea: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d7ee: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d7f5: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d7fe: 48 8d bd a0 00 00 00        	leaq	0xa0(%rbp), %rdi
14549d805: 4c 89 e9                    	movq	%r13, %rcx
14549d808: 31 d2                       	xorl	%edx, %edx
14549d80a: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14549d810: 49 89 f9                    	movq	%rdi, %r9
14549d813: e8 f8 a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d818: f2 0f 10 05 20 cb 50 01     	movsd	0x150cb20(%rip), %xmm0  # 0x1469aa340
14549d820: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d824: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d82b: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d834: 4c 89 e9                    	movq	%r13, %rcx
14549d837: 31 d2                       	xorl	%edx, %edx
14549d839: 41 b8 05 00 00 00           	movl	$0x5, %r8d
14549d83f: 49 89 f9                    	movq	%rdi, %r9
14549d842: e8 c9 a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d847: f2 0f 10 05 01 cb 50 01     	movsd	0x150cb01(%rip), %xmm0  # 0x1469aa350
14549d84f: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d853: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d85a: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d863: 4c 89 e9                    	movq	%r13, %rcx
14549d866: 31 d2                       	xorl	%edx, %edx
14549d868: 41 b8 1e 00 00 00           	movl	$0x1e, %r8d
14549d86e: 49 89 f9                    	movq	%rdi, %r9
14549d871: e8 9a a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d876: f2 0f 10 05 e2 ca 50 01     	movsd	0x150cae2(%rip), %xmm0  # 0x1469aa360
14549d87e: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d882: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d889: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d892: 4c 89 e9                    	movq	%r13, %rcx
14549d895: ba 01 00 00 00              	movl	$0x1, %edx
14549d89a: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14549d8a0: 49 89 f9                    	movq	%rdi, %r9
14549d8a3: e8 68 a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d8a8: f2 0f 10 05 c0 ca 50 01     	movsd	0x150cac0(%rip), %xmm0  # 0x1469aa370
14549d8b0: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d8b4: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d8bb: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d8c4: 4c 89 e9                    	movq	%r13, %rcx
14549d8c7: ba 02 00 00 00              	movl	$0x2, %edx
14549d8cc: 49 89 f9                    	movq	%rdi, %r9
14549d8cf: e8 3c a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d8d4: f2 0f 10 05 a4 ca 50 01     	movsd	0x150caa4(%rip), %xmm0  # 0x1469aa380
14549d8dc: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d8e0: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d8e7: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d8f0: 4c 89 e9                    	movq	%r13, %rcx
14549d8f3: ba 03 00 00 00              	movl	$0x3, %edx
14549d8f8: 49 89 f9                    	movq	%rdi, %r9
14549d8fb: e8 10 a8 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d900: f2 0f 10 05 88 ca 50 01     	movsd	0x150ca88(%rip), %xmm0  # 0x1469aa390
14549d908: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d90c: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d913: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d91c: 4c 89 e9                    	movq	%r13, %rcx
14549d91f: ba 04 00 00 00              	movl	$0x4, %edx
14549d924: 49 89 f9                    	movq	%rdi, %r9
14549d927: e8 e4 a7 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d92c: f2 0f 10 05 6c ca 50 01     	movsd	0x150ca6c(%rip), %xmm0  # 0x1469aa3a0
14549d934: 41 0f 58 c2                 	addps	%xmm10, %xmm0
14549d938: 0f 13 85 a0 00 00 00        	movlps	%xmm0, 0xa0(%rbp)
14549d93f: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d948: 4c 89 e9                    	movq	%r13, %rcx
14549d94b: ba 05 00 00 00              	movl	$0x5, %edx
14549d950: 49 89 f9                    	movq	%rdi, %r9
14549d953: e8 b8 a7 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d958: 44 0f 58 15 50 ca 50 01     	addps	0x150ca50(%rip), %xmm10 # 0x1469aa3b0
14549d960: 44 0f 13 95 a0 00 00 00     	movlps	%xmm10, 0xa0(%rbp)
14549d968: f3 44 0f 11 8d a8 00 00 00  	movss	%xmm9, 0xa8(%rbp)
14549d971: 4c 89 e9                    	movq	%r13, %rcx
14549d974: ba 06 00 00 00              	movl	$0x6, %edx
14549d979: 49 89 f9                    	movq	%rdi, %r9
14549d97c: e8 8f a7 02 00              	callq	0x1454c8110 <.text+0x54c7110>
14549d981: f3 41 0f 10 bd e4 08 00 00  	movss	0x8e4(%r13), %xmm7
14549d98a: 48 c7 85 b0 02 00 00 00 00 00 00    	movq	$0x0, 0x2b0(%rbp)
14549d995: 48 c7 85 b8 02 00 00 04 00 00 00    	movq	$0x4, 0x2b8(%rbp)
14549d9a0: 48 c7 85 c0 02 00 00 00 00 00 00    	movq	$0x0, 0x2c0(%rbp)
14549d9ab: 48 c7 85 d8 02 00 00 00 00 00 00    	movq	$0x0, 0x2d8(%rbp)
14549d9b6: 48 c7 85 e0 02 00 00 04 00 00 00    	movq	$0x4, 0x2e0(%rbp)
14549d9c1: 48 c7 85 e8 02 00 00 00 00 00 00    	movq	$0x0, 0x2e8(%rbp)
14549d9cc: 4d 8b b5 f8 02 00 00        	movq	0x2f8(%r13), %r14
14549d9d3: 49 8b 85 00 03 00 00        	movq	0x300(%r13), %rax
14549d9da: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
14549d9de: 49 8d 3c c6                 	leaq	(%r14,%rax,8), %rdi
14549d9e2: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
14549d9e6: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
14549d9ea: eb 18                       	jmp	0x14549da04 <.text+0x549ca04>
14549d9ec: 0f 1f 40 00                 	nopl	(%rax)
14549d9f0: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
14549d9f7: 89 1c b0                    	movl	%ebx, (%rax,%rsi,4)
14549d9fa: 48 ff c6                    	incq	%rsi
14549d9fd: 48 89 b5 e8 02 00 00        	movq	%rsi, 0x2e8(%rbp)
14549da04: 49 39 fe                    	cmpq	%rdi, %r14
14549da07: 0f 84 dc 00 00 00           	je	0x14549dae9 <.text+0x549cae9>
14549da0d: 4c 89 f3                    	movq	%r14, %rbx
14549da10: f3 41 0f 10 46 14           	movss	0x14(%r14), %xmm0
14549da16: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
14549da1a: 0f 86 8b 00 00 00           	jbe	0x14549daab <.text+0x549caab>
14549da20: f3 0f 10 4b 10              	movss	0x10(%rbx), %xmm1
14549da25: f3 0f 5c cf                 	subss	%xmm7, %xmm1
14549da29: 0f 28 d1                    	movaps	%xmm1, %xmm2
14549da2c: f3 0f 5f d6                 	maxss	%xmm6, %xmm2
14549da30: 0f 28 da                    	movaps	%xmm2, %xmm3
14549da33: f3 0f c2 da 03              	cmpunordss	%xmm2, %xmm3
14549da38: 0f 54 cb                    	andps	%xmm3, %xmm1
14549da3b: 0f 55 da                    	andnps	%xmm2, %xmm3
14549da3e: 0f 56 d9                    	orps	%xmm1, %xmm3
14549da41: 44 0f 28 d6                 	movaps	%xmm6, %xmm10
14549da45: f3 44 0f 5e d3              	divss	%xmm3, %xmm10
14549da4a: f3 44 0f 5d 15 2d da 44 00  	minss	0x44da2d(%rip), %xmm10  # 0x1458eb480
14549da53: f3 44 0f 59 d0              	mulss	%xmm0, %xmm10
14549da58: f3 41 0f 5c c2              	subss	%xmm10, %xmm0
14549da5d: f3 0f 11 43 14              	movss	%xmm0, 0x14(%rbx)
14549da62: 44 8b 73 0c                 	movl	0xc(%rbx), %r14d
14549da66: 48 8b b5 c0 02 00 00        	movq	0x2c0(%rbp), %rsi
14549da6d: 48 3b b5 b0 02 00 00        	cmpq	0x2b0(%rbp), %rsi
14549da74: 75 14                       	jne	0x14549da8a <.text+0x549ca8a>
14549da76: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549da7d: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
14549da84: e8 57 63 2c 00              	callq	0x145763de0 <.text+0x5762de0>
14549da89: 90                          	nop
14549da8a: f3 45 0f 58 c2              	addss	%xmm10, %xmm8
14549da8f: 48 8b 85 b8 02 00 00        	movq	0x2b8(%rbp), %rax
14549da96: 44 89 34 f0                 	movl	%r14d, (%rax,%rsi,8)
14549da9a: f3 44 0f 11 54 f0 04        	movss	%xmm10, 0x4(%rax,%rsi,8)
14549daa1: 48 ff c6                    	incq	%rsi
14549daa4: 48 89 b5 c0 02 00 00        	movq	%rsi, 0x2c0(%rbp)
14549daab: 4c 8d 73 18                 	leaq	0x18(%rbx), %r14
14549daaf: 0f 2e 7b 10                 	ucomiss	0x10(%rbx), %xmm7
14549dab3: 0f 82 4b ff ff ff           	jb	0x14549da04 <.text+0x549ca04>
14549dab9: 8b 5b 0c                    	movl	0xc(%rbx), %ebx
14549dabc: 48 8b b5 e8 02 00 00        	movq	0x2e8(%rbp), %rsi
14549dac3: 48 3b b5 d8 02 00 00        	cmpq	0x2d8(%rbp), %rsi
14549daca: 0f 85 20 ff ff ff           	jne	0x14549d9f0 <.text+0x549c9f0>
14549dad0: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549dad7: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
14549dade: e8 cd db 2b 00              	callq	0x14575b6b0 <.text+0x575a6b0>
14549dae3: 90                          	nop
14549dae4: e9 07 ff ff ff              	jmp	0x14549d9f0 <.text+0x549c9f0>
14549dae9: 48 8b 85 e8 02 00 00        	movq	0x2e8(%rbp), %rax
14549daf0: 48 85 c0                    	testq	%rax, %rax
14549daf3: 0f 84 45 01 00 00           	je	0x14549dc3e <.text+0x549cc3e>
14549daf9: 41 8b 8d d8 03 00 00        	movl	0x3d8(%r13), %ecx
14549db00: 85 c9                       	testl	%ecx, %ecx
14549db02: 0f 84 cf 00 00 00           	je	0x14549dbd7 <.text+0x549cbd7>
14549db08: f3 41 0f 10 85 dc 03 00 00  	movss	0x3dc(%r13), %xmm0
14549db11: 4c 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %r8
14549db18: 49 b9 f0 ff ff ff ff ff ff 1f       	movabsq	$0x1ffffffffffffff0, %r9 # imm = 0x1FFFFFFFFFFFFFF0
14549db22: 49 21 c1                    	andq	%rax, %r9
14549db25: 4b 8d 14 88                 	leaq	(%r8,%r9,4), %rdx
14549db29: 83 e0 0f                    	andl	$0xf, %eax
14549db2c: 66 0f 6e c9                 	movd	%ecx, %xmm1
14549db30: 66 0f 70 c9 00              	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
14549db35: 45 31 d2                    	xorl	%r10d, %r10d
14549db38: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14549db40: 4d 39 d1                    	cmpq	%r10, %r9
14549db43: 74 47                       	je	0x14549db8c <.text+0x549cb8c>
14549db45: f3 43 0f 6f 14 90           	movdqu	(%r8,%r10,4), %xmm2
14549db4b: f3 43 0f 6f 5c 90 10        	movdqu	0x10(%r8,%r10,4), %xmm3
14549db52: f3 43 0f 6f 64 90 20        	movdqu	0x20(%r8,%r10,4), %xmm4
14549db59: f3 43 0f 6f 6c 90 30        	movdqu	0x30(%r8,%r10,4), %xmm5
14549db60: 66 0f 76 d9                 	pcmpeqd	%xmm1, %xmm3
14549db64: 66 0f 76 d1                 	pcmpeqd	%xmm1, %xmm2
14549db68: 66 0f 6b d3                 	packssdw	%xmm3, %xmm2
14549db6c: 66 0f 76 e1                 	pcmpeqd	%xmm1, %xmm4
14549db70: 66 0f 76 e9                 	pcmpeqd	%xmm1, %xmm5
14549db74: 66 0f 6b e5                 	packssdw	%xmm5, %xmm4
14549db78: 66 0f 63 d4                 	packsswb	%xmm4, %xmm2
14549db7c: 66 44 0f d7 da              	pmovmskb	%xmm2, %r11d
14549db81: 49 83 c2 10                 	addq	$0x10, %r10
14549db85: 45 85 db                    	testl	%r11d, %r11d
14549db88: 74 b6                       	je	0x14549db40 <.text+0x549cb40>
14549db8a: eb 23                       	jmp	0x14549dbaf <.text+0x549cbaf>
14549db8c: c1 e0 02                    	shll	$0x2, %eax
14549db8f: 45 31 c0                    	xorl	%r8d, %r8d
14549db92: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14549dba0: 4c 39 c0                    	cmpq	%r8, %rax
14549dba3: 74 32                       	je	0x14549dbd7 <.text+0x549cbd7>
14549dba5: 42 39 0c 02                 	cmpl	%ecx, (%rdx,%r8)
14549dba9: 4d 8d 40 04                 	leaq	0x4(%r8), %r8
14549dbad: 75 f1                       	jne	0x14549dba0 <.text+0x549cba0>
14549dbaf: f3 41 0f 10 8d 04 04 00 00  	movss	0x404(%r13), %xmm1
14549dbb8: f3 0f 5c c8                 	subss	%xmm0, %xmm1
14549dbbc: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549dbbf: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14549dbc3: f3 41 0f 11 8d 04 04 00 00  	movss	%xmm1, 0x404(%r13)
14549dbcc: 49 c7 85 d8 03 00 00 00 00 00 00    	movq	$0x0, 0x3d8(%r13)
14549dbd7: 49 8b 85 00 03 00 00        	movq	0x300(%r13), %rax
14549dbde: 48 85 c0                    	testq	%rax, %rax
14549dbe1: 74 3b                       	je	0x14549dc1e <.text+0x549cc1e>
14549dbe3: 49 8b 8d f8 02 00 00        	movq	0x2f8(%r13), %rcx
14549dbea: 4c 8d 49 28                 	leaq	0x28(%rcx), %r9
14549dbee: 48 89 c2                    	movq	%rax, %rdx
14549dbf1: 48 f7 da                    	negq	%rdx
14549dbf4: 45 31 c0                    	xorl	%r8d, %r8d
14549dbf7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
14549dc00: f3 41 0f 10 41 e8           	movss	-0x18(%r9), %xmm0
14549dc06: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
14549dc09: 0f 86 fc 3e 00 00           	jbe	0x1454a1b0b <.text+0x54a0b0b>
14549dc0f: 49 ff c0                    	incq	%r8
14549dc12: 49 83 c1 18                 	addq	$0x18, %r9
14549dc16: 49 89 d2                    	movq	%rdx, %r10
14549dc19: 4d 01 c2                    	addq	%r8, %r10
14549dc1c: 75 e2                       	jne	0x14549dc00 <.text+0x549cc00>
14549dc1e: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549dc25: 4c 89 e9                    	movq	%r13, %rcx
14549dc28: e8 a3 74 ff ff              	callq	0x1454950d0 <.text+0x54940d0>
14549dc2d: 90                          	nop
14549dc2e: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549dc35: 4c 89 e9                    	movq	%r13, %rcx
14549dc38: e8 73 f6 fe ff              	callq	0x14548d2b0 <.text+0x548c2b0>
14549dc3d: 90                          	nop
14549dc3e: f3 45 0f 10 8d 7c 04 00 00  	movss	0x47c(%r13), %xmm9
14549dc47: f3 44 0f 59 ce              	mulss	%xmm6, %xmm9
14549dc4c: f3 45 0f 10 95 00 04 00 00  	movss	0x400(%r13), %xmm10
14549dc55: f3 41 0f 10 bd 58 04 00 00  	movss	0x458(%r13), %xmm7
14549dc5e: 41 0f 2e fa                 	ucomiss	%xmm10, %xmm7
14549dc62: 45 0f 28 da                 	movaps	%xmm10, %xmm11
14549dc66: 0f 86 04 02 00 00           	jbe	0x14549de70 <.text+0x549ce70>
14549dc6c: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
14549dc70: f3 41 0f 58 ca              	addss	%xmm10, %xmm1
14549dc75: f3 41 0f 58 c8              	addss	%xmm8, %xmm1
14549dc7a: 0f 28 d1                    	movaps	%xmm1, %xmm2
14549dc7d: f3 0f 5d d7                 	minss	%xmm7, %xmm2
14549dc81: 0f 28 c2                    	movaps	%xmm2, %xmm0
14549dc84: f3 0f c2 c2 03              	cmpunordss	%xmm2, %xmm0
14549dc89: 0f 54 c8                    	andps	%xmm0, %xmm1
14549dc8c: 0f 55 c2                    	andnps	%xmm2, %xmm0
14549dc8f: 0f 56 c1                    	orps	%xmm1, %xmm0
14549dc92: f3 41 0f 11 85 00 04 00 00  	movss	%xmm0, 0x400(%r13)
14549dc9b: 45 0f 57 db                 	xorps	%xmm11, %xmm11
14549dc9f: f3 41 0f 5f c3              	maxss	%xmm11, %xmm0
14549dca4: e8 c4 91 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
14549dca9: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
14549dcae: 31 c9                       	xorl	%ecx, %ecx
14549dcb0: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
14549dcb4: 0f 42 c1                    	cmovbl	%ecx, %eax
14549dcb7: 0f 2e 05 5e d8 44 00        	ucomiss	0x44d85e(%rip), %xmm0   # 0x1458eb51c
14549dcbe: 41 b8 ff ff ff ff           	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
14549dcc4: 44 0f 46 c0                 	cmovbel	%eax, %r8d
14549dcc8: 49 8d bd b8 08 00 00        	leaq	0x8b8(%r13), %rdi
14549dccf: 49 8b 85 b8 08 00 00        	movq	0x8b8(%r13), %rax
14549dcd6: 48 85 c0                    	testq	%rax, %rax
14549dcd9: 74 64                       	je	0x14549dd3f <.text+0x549cd3f>
14549dcdb: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
14549dce2: 66 ba 16 00                 	movw	$0x16, %dx
14549dce6: 44 0f b7 50 36              	movzwl	0x36(%rax), %r10d
14549dceb: 45 89 d3                    	movl	%r10d, %r11d
14549dcee: 45 01 db                    	addl	%r11d, %r11d
14549dcf1: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
14549dcf8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14549dd00: 4d 85 db                    	testq	%r11, %r11
14549dd03: 74 23                       	je	0x14549dd28 <.text+0x549cd28>
14549dd05: 66 42 3b 54 48 3a           	cmpw	0x3a(%rax,%r9,2), %dx
14549dd0b: 0f 97 c3                    	seta	%bl
14549dd0e: 80 db 00                    	sbbb	$0x0, %bl
14549dd11: 49 ff c1                    	incq	%r9
14549dd14: 49 83 c3 fe                 	addq	$-0x2, %r11
14549dd18: 80 fb 01                    	cmpb	$0x1, %bl
14549dd1b: 74 e3                       	je	0x14549dd00 <.text+0x549cd00>
14549dd1d: 44 0f b6 d3                 	movzbl	%bl, %r10d
14549dd21: 45 85 d2                    	testl	%r10d, %r10d
14549dd24: 75 05                       	jne	0x14549dd2b <.text+0x549cd2b>
14549dd26: eb 10                       	jmp	0x14549dd38 <.text+0x549cd38>
14549dd28: 4d 89 d1                    	movq	%r10, %r9
14549dd2b: 48 83 e9 01                 	subq	$0x1, %rcx
14549dd2f: 72 10                       	jb	0x14549dd41 <.text+0x549cd41>
14549dd31: 4a 8b 44 c8 50              	movq	0x50(%rax,%r9,8), %rax
14549dd36: eb ae                       	jmp	0x14549dce6 <.text+0x549cce6>
14549dd38: 46 89 44 88 08              	movl	%r8d, 0x8(%rax,%r9,4)
14549dd3d: eb 48                       	jmp	0x14549dd87 <.text+0x549cd87>
14549dd3f: 31 c0                       	xorl	%eax, %eax
14549dd41: 48 89 bd a0 00 00 00        	movq	%rdi, 0xa0(%rbp)
14549dd48: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
14549dd4f: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
14549dd5a: 4c 89 8d b8 00 00 00        	movq	%r9, 0xb8(%rbp)
14549dd61: 48 c7 85 c0 00 00 00 16 00 00 00    	movq	$0x16, 0xc0(%rbp)
14549dd6c: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549dd73: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549dd7a: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549dd81: e8 ca 9c f8 ff              	callq	0x145427a50 <.text+0x5426a50>
14549dd86: 90                          	nop
14549dd87: 0f 28 c7                    	movaps	%xmm7, %xmm0
14549dd8a: e8 de 90 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
14549dd8f: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
14549dd94: 31 c9                       	xorl	%ecx, %ecx
14549dd96: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549dd99: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
14549dd9c: 0f 42 c1                    	cmovbl	%ecx, %eax
14549dd9f: 0f 2e 05 76 d7 44 00        	ucomiss	0x44d776(%rip), %xmm0   # 0x1458eb51c
14549dda6: 41 b8 ff ff ff ff           	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
14549ddac: 44 0f 46 c0                 	cmovbel	%eax, %r8d
14549ddb0: 48 8b 07                    	movq	(%rdi), %rax
14549ddb3: 48 85 c0                    	testq	%rax, %rax
14549ddb6: 74 67                       	je	0x14549de1f <.text+0x549ce1f>
14549ddb8: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
14549ddbf: 66 ba 1c 00                 	movw	$0x1c, %dx
14549ddc3: 44 0f b7 50 36              	movzwl	0x36(%rax), %r10d
14549ddc8: 45 89 d3                    	movl	%r10d, %r11d
14549ddcb: 45 01 db                    	addl	%r11d, %r11d
14549ddce: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
14549ddd5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14549dde0: 4d 85 db                    	testq	%r11, %r11
14549dde3: 74 23                       	je	0x14549de08 <.text+0x549ce08>
14549dde5: 66 42 3b 54 48 3a           	cmpw	0x3a(%rax,%r9,2), %dx
14549ddeb: 0f 97 c3                    	seta	%bl
14549ddee: 80 db 00                    	sbbb	$0x0, %bl
14549ddf1: 49 ff c1                    	incq	%r9
14549ddf4: 49 83 c3 fe                 	addq	$-0x2, %r11
14549ddf8: 80 fb 01                    	cmpb	$0x1, %bl
14549ddfb: 74 e3                       	je	0x14549dde0 <.text+0x549cde0>
14549ddfd: 44 0f b6 d3                 	movzbl	%bl, %r10d
14549de01: 45 85 d2                    	testl	%r10d, %r10d
14549de04: 75 05                       	jne	0x14549de0b <.text+0x549ce0b>
14549de06: eb 10                       	jmp	0x14549de18 <.text+0x549ce18>
14549de08: 4d 89 d1                    	movq	%r10, %r9
14549de0b: 48 83 e9 01                 	subq	$0x1, %rcx
14549de0f: 72 10                       	jb	0x14549de21 <.text+0x549ce21>
14549de11: 4a 8b 44 c8 50              	movq	0x50(%rax,%r9,8), %rax
14549de16: eb ab                       	jmp	0x14549ddc3 <.text+0x549cdc3>
14549de18: 46 89 44 88 08              	movl	%r8d, 0x8(%rax,%r9,4)
14549de1d: eb 48                       	jmp	0x14549de67 <.text+0x549ce67>
14549de1f: 31 c0                       	xorl	%eax, %eax
14549de21: 48 89 bd a0 00 00 00        	movq	%rdi, 0xa0(%rbp)
14549de28: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
14549de2f: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
14549de3a: 4c 89 8d b8 00 00 00        	movq	%r9, 0xb8(%rbp)
14549de41: 48 c7 85 c0 00 00 00 1c 00 00 00    	movq	$0x1c, 0xc0(%rbp)
14549de4c: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549de53: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549de5a: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549de61: e8 ea 9b f8 ff              	callq	0x145427a50 <.text+0x5426a50>
14549de66: 90                          	nop
14549de67: f3 45 0f 10 9d 00 04 00 00  	movss	0x400(%r13), %xmm11
14549de70: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549de77: 48 8d 3d f2 cf 50 01        	leaq	0x150cff2(%rip), %rdi   # 0x1469aae70
14549de7e: ba 0c 00 00 00              	movl	$0xc, %edx
14549de83: 48 89 f9                    	movq	%rdi, %rcx
14549de86: e8 75 45 fb ff              	callq	0x145452400 <.text+0x5451400>
14549de8b: 90                          	nop
14549de8c: f3 45 0f 5c da              	subss	%xmm10, %xmm11
14549de91: 0f 57 ff                    	xorps	%xmm7, %xmm7
14549de94: f3 44 0f 5f df              	maxss	%xmm7, %xmm11
14549de99: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
14549de9d: f3 41 0f 5d c3              	minss	%xmm11, %xmm0
14549dea2: 0f 2e f8                    	ucomiss	%xmm0, %xmm7
14549dea5: 73 6b                       	jae	0x14549df12 <.text+0x549cf12>
14549dea7: 48 85 c0                    	testq	%rax, %rax
14549deaa: b9 0c 00 00 00              	movl	$0xc, %ecx
14549deaf: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
14549deb3: 48 0f 45 f8                 	cmovneq	%rax, %rdi
14549deb7: 48 c7 85 a0 00 00 00 ff ff ff ff    	movq	$-0x1, 0xa0(%rbp)
14549dec2: 48 89 bd a8 00 00 00        	movq	%rdi, 0xa8(%rbp)
14549dec9: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
14549ded0: 48 8d 05 a5 cf 50 01        	leaq	0x150cfa5(%rip), %rax   # 0x1469aae7c
14549ded7: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
14549dede: 48 c7 85 c0 00 00 00 19 00 00 00    	movq	$0x19, 0xc0(%rbp)
14549dee9: c6 85 c8 00 00 00 00        	movb	$0x0, 0xc8(%rbp)
14549def0: 49 8d 8d e0 05 00 00        	leaq	0x5e0(%r13), %rcx
14549def7: 0f 57 d2                    	xorps	%xmm2, %xmm2
14549defa: f3 0f 5a d0                 	cvtss2sd	%xmm0, %xmm2
14549defe: c6 85 77 03 00 00 01        	movb	$0x1, 0x377(%rbp)
14549df05: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549df0c: e8 6f 20 05 00              	callq	0x1454eff80 <.text+0x54eef80>
14549df11: 90                          	nop
14549df12: 41 b4 01                    	movb	$0x1, %r12b
14549df15: 44 0f 2e c7                 	ucomiss	%xmm7, %xmm8
14549df19: 0f 86 5e 02 00 00           	jbe	0x14549e17d <.text+0x549d17d>
14549df1f: f3 41 0f 10 85 00 04 00 00  	movss	0x400(%r13), %xmm0
14549df28: f3 41 0f 5c c2              	subss	%xmm10, %xmm0
14549df2d: f3 41 0f 5c c1              	subss	%xmm9, %xmm0
14549df32: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
14549df36: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549df39: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14549df3d: 41 0f 28 f8                 	movaps	%xmm8, %xmm7
14549df41: f3 0f 5d f9                 	minss	%xmm1, %xmm7
14549df45: 48 8b 85 b0 02 00 00        	movq	0x2b0(%rbp), %rax
14549df4c: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
14549df53: 48 8b 85 b8 02 00 00        	movq	0x2b8(%rbp), %rax
14549df5a: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549df61: 48 8b 85 c0 02 00 00        	movq	0x2c0(%rbp), %rax
14549df68: 48 85 c0                    	testq	%rax, %rax
14549df6b: 0f 84 dc 00 00 00           	je	0x14549e04d <.text+0x549d04d>
14549df71: 4c 8b a5 58 03 00 00        	movq	0x358(%rbp), %r12
14549df78: 49 8d 1c c4                 	leaq	(%r12,%rax,8), %rbx
14549df7c: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
14549df83: 48 8d b8 e0 05 00 00        	leaq	0x5e0(%rax), %rdi
14549df8a: 4c 8d 35 3f d0 50 01        	leaq	0x150d03f(%rip), %r14   # 0x1469aafd0
14549df91: be 05 00 00 00              	movl	$0x5, %esi
14549df96: 4c 8d 2d 38 d0 50 01        	leaq	0x150d038(%rip), %r13   # 0x1469aafd5
14549df9d: 4c 8d bd a0 00 00 00        	leaq	0xa0(%rbp), %r15
14549dfa4: eb 37                       	jmp	0x14549dfdd <.text+0x549cfdd>
14549dfa6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14549dfb0: 4c 89 f9                    	movq	%r15, %rcx
14549dfb3: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
14549dfba: e8 71 10 ff ff              	callq	0x14548f030 <.text+0x548e030>
14549dfbf: 90                          	nop
14549dfc0: 0f 57 d2                    	xorps	%xmm2, %xmm2
14549dfc3: f3 41 0f 5a d2              	cvtss2sd	%xmm10, %xmm2
14549dfc8: 48 89 f9                    	movq	%rdi, %rcx
14549dfcb: 4c 89 fa                    	movq	%r15, %rdx
14549dfce: e8 ad 1f 05 00              	callq	0x1454eff80 <.text+0x54eef80>
14549dfd3: 90                          	nop
14549dfd4: 49 83 c4 08                 	addq	$0x8, %r12
14549dfd8: 49 39 dc                    	cmpq	%rbx, %r12
14549dfdb: 74 70                       	je	0x14549e04d <.text+0x549d04d>
14549dfdd: f3 45 0f 10 54 24 04        	movss	0x4(%r12), %xmm10
14549dfe4: f3 44 0f 59 d7              	mulss	%xmm7, %xmm10
14549dfe9: f3 45 0f 5e d0              	divss	%xmm8, %xmm10
14549dfee: 45 0f 2e ca                 	ucomiss	%xmm10, %xmm9
14549dff2: 73 e0                       	jae	0x14549dfd4 <.text+0x549cfd4>
14549dff4: 45 8b 04 24                 	movl	(%r12), %r8d
14549dff8: 45 85 c0                    	testl	%r8d, %r8d
14549dffb: 75 b3                       	jne	0x14549dfb0 <.text+0x549cfb0>
14549dffd: ba 05 00 00 00              	movl	$0x5, %edx
14549e002: 4c 89 f1                    	movq	%r14, %rcx
14549e005: e8 f6 43 fb ff              	callq	0x145452400 <.text+0x5451400>
14549e00a: 90                          	nop
14549e00b: 48 85 c0                    	testq	%rax, %rax
14549e00e: 49 0f 44 c6                 	cmoveq	%r14, %rax
14549e012: 48 0f 44 d6                 	cmoveq	%rsi, %rdx
14549e016: 48 c7 85 a0 00 00 00 ff ff ff ff    	movq	$-0x1, 0xa0(%rbp)
14549e021: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
14549e028: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
14549e02f: 4c 89 ad b8 00 00 00        	movq	%r13, 0xb8(%rbp)
14549e036: 48 c7 85 c0 00 00 00 18 00 00 00    	movq	$0x18, 0xc0(%rbp)
14549e041: c6 85 c8 00 00 00 00        	movb	$0x0, 0xc8(%rbp)
14549e048: e9 73 ff ff ff              	jmp	0x14549dfc0 <.text+0x549cfc0>
14549e04d: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
14549e054: 48 85 d2                    	testq	%rdx, %rdx
14549e057: 74 16                       	je	0x14549e06f <.text+0x549d06f>
14549e059: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549e05d: 41 b8 04 00 00 00           	movl	$0x4, %r8d
14549e063: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
14549e06a: e8 61 41 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549e06f: f3 44 0f 5c c7              	subss	%xmm7, %xmm8
14549e074: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549e077: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
14549e07b: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
14549e082: 0f 86 80 00 00 00           	jbe	0x14549e108 <.text+0x549d108>
14549e088: 49 8b 8d f8 06 00 00        	movq	0x6f8(%r13), %rcx
14549e08f: 49 8b 95 00 07 00 00        	movq	0x700(%r13), %rdx
14549e096: 48 c1 e2 06                 	shlq	$0x6, %rdx
14549e09a: 31 c0                       	xorl	%eax, %eax
14549e09c: 45 31 c0                    	xorl	%r8d, %r8d
14549e09f: 90                          	nop
14549e0a0: 4c 39 c2                    	cmpq	%r8, %rdx
14549e0a3: 74 21                       	je	0x14549e0c6 <.text+0x549d0c6>
14549e0a5: 4d 8d 48 40                 	leaq	0x40(%r8), %r9
14549e0a9: 42 80 3c 01 14              	cmpb	$0x14, (%rcx,%r8)
14549e0ae: 4d 89 c8                    	movq	%r9, %r8
14549e0b1: 75 ed                       	jne	0x14549e0a0 <.text+0x549d0a0>
14549e0b3: f3 42 0f 10 4c 09 c4        	movss	-0x3c(%rcx,%r9), %xmm1
14549e0ba: b8 01 00 00 00              	movl	$0x1, %eax
14549e0bf: 83 f8 01                    	cmpl	$0x1, %eax
14549e0c2: 74 07                       	je	0x14549e0cb <.text+0x549d0cb>
14549e0c4: eb 42                       	jmp	0x14549e108 <.text+0x549d108>
14549e0c6: 83 f8 01                    	cmpl	$0x1, %eax
14549e0c9: 75 3d                       	jne	0x14549e108 <.text+0x549d108>
14549e0cb: f3 41 0f 59 8d 58 04 00 00  	mulss	0x458(%r13), %xmm1
14549e0d4: f3 41 0f 10 95 04 04 00 00  	movss	0x404(%r13), %xmm2
14549e0dd: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
14549e0e0: 76 26                       	jbe	0x14549e108 <.text+0x549d108>
14549e0e2: f3 41 0f 58 d0              	addss	%xmm8, %xmm2
14549e0e7: 0f 28 da                    	movaps	%xmm2, %xmm3
14549e0ea: f3 0f 5d d9                 	minss	%xmm1, %xmm3
14549e0ee: 0f 28 cb                    	movaps	%xmm3, %xmm1
14549e0f1: f3 0f c2 cb 03              	cmpunordss	%xmm3, %xmm1
14549e0f6: 0f 54 d1                    	andps	%xmm1, %xmm2
14549e0f9: 0f 55 cb                    	andnps	%xmm3, %xmm1
14549e0fc: 0f 56 ca                    	orps	%xmm2, %xmm1
14549e0ff: f3 41 0f 11 8d 04 04 00 00  	movss	%xmm1, 0x404(%r13)
14549e108: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
14549e10d: 0f 2e f8                    	ucomiss	%xmm0, %xmm7
14549e110: 76 68                       	jbe	0x14549e17a <.text+0x549d17a>
14549e112: 49 8b 85 f8 06 00 00        	movq	0x6f8(%r13), %rax
14549e119: 49 8b 8d 00 07 00 00        	movq	0x700(%r13), %rcx
14549e120: 48 c1 e1 06                 	shlq	$0x6, %rcx
14549e124: 31 d2                       	xorl	%edx, %edx
14549e126: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14549e130: 48 39 d1                    	cmpq	%rdx, %rcx
14549e133: 74 1c                       	je	0x14549e151 <.text+0x549d151>
14549e135: 80 3c 10 15                 	cmpb	$0x15, (%rax,%rdx)
14549e139: 48 8d 52 40                 	leaq	0x40(%rdx), %rdx
14549e13d: 75 f1                       	jne	0x14549e130 <.text+0x549d130>
14549e13f: f3 41 0f 58 bd 08 01 00 00  	addss	0x108(%r13), %xmm7
14549e148: f3 41 0f 11 bd 08 01 00 00  	movss	%xmm7, 0x108(%r13)
14549e151: 45 31 e4                    	xorl	%r12d, %r12d
14549e154: 41 0f b6 85 84 02 00 00     	movzbl	0x284(%r13), %eax
14549e15c: 04 fe                       	addb	$-0x2, %al
14549e15e: 3c 09                       	cmpb	$0x9, %al
14549e160: 76 29                       	jbe	0x14549e18b <.text+0x549d18b>
14549e162: 48 8d 05 ff a5 27 01        	leaq	0x127a5ff(%rip), %rax   # 0x146718768
14549e169: f6 00 01                    	testb	$0x1, (%rax)
14549e16c: 44 89 a5 40 03 00 00        	movl	%r12d, 0x340(%rbp)
14549e173: 75 34                       	jne	0x14549e1a9 <.text+0x549d1a9>
14549e175: e9 f1 02 00 00              	jmp	0x14549e46b <.text+0x549d46b>
14549e17a: 45 31 e4                    	xorl	%r12d, %r12d
14549e17d: 41 0f b6 85 84 02 00 00     	movzbl	0x284(%r13), %eax
14549e185: 04 fe                       	addb	$-0x2, %al
14549e187: 3c 09                       	cmpb	$0x9, %al
14549e189: 77 d7                       	ja	0x14549e162 <.text+0x549d162>
14549e18b: 0f b6 c0                    	movzbl	%al, %eax
14549e18e: 48 8d 0d 93 e8 50 01        	leaq	0x150e893(%rip), %rcx   # 0x1469aca28
14549e195: 48 8b 04 c1                 	movq	(%rcx,%rax,8), %rax
14549e199: f6 00 01                    	testb	$0x1, (%rax)
14549e19c: 44 89 a5 40 03 00 00        	movl	%r12d, 0x340(%rbp)
14549e1a3: 0f 84 c2 02 00 00           	je	0x14549e46b <.text+0x549d46b>
14549e1a9: 4d 8b 85 d0 06 00 00        	movq	0x6d0(%r13), %r8
14549e1b0: 4d 85 c0                    	testq	%r8, %r8
14549e1b3: 74 19                       	je	0x14549e1ce <.text+0x549d1ce>
14549e1b5: 49 8b 8d c8 06 00 00        	movq	0x6c8(%r13), %rcx
14549e1bc: 49 83 f8 01                 	cmpq	$0x1, %r8
14549e1c0: 75 16                       	jne	0x14549e1d8 <.text+0x549d1d8>
14549e1c2: f3 0f 10 3d b2 84 45 00     	movss	0x4584b2(%rip), %xmm7   # 0x1458f667c
14549e1ca: 31 d2                       	xorl	%edx, %edx
14549e1cc: eb 5d                       	jmp	0x14549e22b <.text+0x549d22b>
14549e1ce: f3 0f 10 3d aa d2 44 00     	movss	0x44d2aa(%rip), %xmm7   # 0x1458eb480
14549e1d6: eb 67                       	jmp	0x14549e23f <.text+0x549d23f>
14549e1d8: 4d 89 c1                    	movq	%r8, %r9
14549e1db: 49 83 e1 fe                 	andq	$-0x2, %r9
14549e1df: f3 0f 10 3d 95 84 45 00     	movss	0x458495(%rip), %xmm7   # 0x1458f667c
14549e1e7: 31 d2                       	xorl	%edx, %edx
14549e1e9: eb 0e                       	jmp	0x14549e1f9 <.text+0x549d1f9>
14549e1eb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14549e1f0: 48 83 c2 02                 	addq	$0x2, %rdx
14549e1f4: 49 39 d1                    	cmpq	%rdx, %r9
14549e1f7: 74 2c                       	je	0x14549e225 <.text+0x549d225>
14549e1f9: 80 3c d1 10                 	cmpb	$0x10, (%rcx,%rdx,8)
14549e1fd: 74 11                       	je	0x14549e210 <.text+0x549d210>
14549e1ff: 80 7c d1 08 10              	cmpb	$0x10, 0x8(%rcx,%rdx,8)
14549e204: 75 ea                       	jne	0x14549e1f0 <.text+0x549d1f0>
14549e206: eb 15                       	jmp	0x14549e21d <.text+0x549d21d>
14549e208: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14549e210: f3 0f 58 7c d1 04           	addss	0x4(%rcx,%rdx,8), %xmm7
14549e216: 80 7c d1 08 10              	cmpb	$0x10, 0x8(%rcx,%rdx,8)
14549e21b: 75 d3                       	jne	0x14549e1f0 <.text+0x549d1f0>
14549e21d: f3 0f 58 7c d1 0c           	addss	0xc(%rcx,%rdx,8), %xmm7
14549e223: eb cb                       	jmp	0x14549e1f0 <.text+0x549d1f0>
14549e225: 41 f6 c0 01                 	testb	$0x1, %r8b
14549e229: 74 0c                       	je	0x14549e237 <.text+0x549d237>
14549e22b: 80 3c d1 10                 	cmpb	$0x10, (%rcx,%rdx,8)
14549e22f: 75 06                       	jne	0x14549e237 <.text+0x549d237>
14549e231: f3 0f 58 7c d1 04           	addss	0x4(%rcx,%rdx,8), %xmm7
14549e237: f3 0f 58 3d 41 d2 44 00     	addss	0x44d241(%rip), %xmm7   # 0x1458eb480
14549e23f: f3 44 0f 10 40 08           	movss	0x8(%rax), %xmm8
14549e245: f3 0f 10 58 0c              	movss	0xc(%rax), %xmm3
14549e24a: f3 44 0f 10 48 04           	movss	0x4(%rax), %xmm9
14549e250: f3 41 0f 10 85 a4 04 00 00  	movss	0x4a4(%r13), %xmm0
14549e259: f3 0f 5c c6                 	subss	%xmm6, %xmm0
14549e25d: f3 41 0f 11 85 a4 04 00 00  	movss	%xmm0, 0x4a4(%r13)
14549e266: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549e269: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549e26c: 0f 82 f9 01 00 00           	jb	0x14549e46b <.text+0x549d46b>
14549e272: 41 8b 85 f0 03 00 00        	movl	0x3f0(%r13), %eax
14549e279: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
14549e27f: 49 8b 85 e8 03 00 00        	movq	0x3e8(%r13), %rax
14549e286: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
14549e28d: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549e294: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549e29b: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
14549e2a2: 4c 89 ea                    	movq	%r13, %rdx
14549e2a5: e8 f6 ff 04 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
14549e2aa: 90                          	nop
14549e2ab: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
14549e2b2: 48 83 bd 40 02 00 00 00     	cmpq	$0x0, 0x240(%rbp)
14549e2ba: 0f 84 41 12 00 00           	je	0x14549f501 <.text+0x549e501>
14549e2c0: f3 44 0f 59 0d 6f e9 45 00  	mulss	0x45e96f(%rip), %xmm9   # 0x1458fcc38
14549e2c9: f3 41 0f 59 f9              	mulss	%xmm9, %xmm7
14549e2ce: 49 8b 95 80 08 00 00        	movq	0x880(%r13), %rdx
14549e2d5: 49 8b 85 98 08 00 00        	movq	0x898(%r13), %rax
14549e2dc: 4c 8d 1c 10                 	leaq	(%rax,%rdx), %r11
14549e2e0: 49 c1 c3 17                 	rolq	$0x17, %r11
14549e2e4: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
14549e2eb: 48 8b 39                    	movq	(%rcx), %rdi
14549e2ee: 49 01 d3                    	addq	%rdx, %r11
14549e2f1: 4d 8b 85 88 08 00 00        	movq	0x888(%r13), %r8
14549e2f8: 4d 89 c1                    	movq	%r8, %r9
14549e2fb: 49 c1 e1 11                 	shlq	$0x11, %r9
14549e2ff: 4d 8b 95 90 08 00 00        	movq	0x890(%r13), %r10
14549e306: 49 31 d2                    	xorq	%rdx, %r10
14549e309: 4c 31 c0                    	xorq	%r8, %rax
14549e30c: 4d 31 d0                    	xorq	%r10, %r8
14549e30f: 4d 89 85 88 08 00 00        	movq	%r8, 0x888(%r13)
14549e316: 48 31 c2                    	xorq	%rax, %rdx
14549e319: 49 89 95 80 08 00 00        	movq	%rdx, 0x880(%r13)
14549e320: 4d 31 ca                    	xorq	%r9, %r10
14549e323: 4d 89 95 90 08 00 00        	movq	%r10, 0x890(%r13)
14549e32a: 48 c1 c0 2d                 	rolq	$0x2d, %rax
14549e32e: 49 c1 eb 28                 	shrq	$0x28, %r11
14549e332: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
14549e336: f3 45 0f 2a cb              	cvtsi2ss	%r11d, %xmm9
14549e33b: 49 89 85 98 08 00 00        	movq	%rax, 0x898(%r13)
14549e342: f3 44 0f 59 0d 75 d0 54 00  	mulss	0x54d075(%rip), %xmm9   # 0x1459eb3c0
14549e34b: f3 45 0f 10 95 64 04 00 00  	movss	0x464(%r13), %xmm10
14549e354: 45 0f 2e d1                 	ucomiss	%xmm9, %xmm10
14549e358: f3 41 0f 59 bd 5c 04 00 00  	mulss	0x45c(%r13), %xmm7
14549e361: 76 09                       	jbe	0x14549e36c <.text+0x549d36c>
14549e363: f3 41 0f 59 bd 68 04 00 00  	mulss	0x468(%r13), %xmm7
14549e36c: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
14549e373: 45 0f 2e d1                 	ucomiss	%xmm9, %xmm10
14549e377: 0f 97 44 24 20              	seta	0x20(%rsp)
14549e37c: f3 48 0f 2c c7              	cvttss2si	%xmm7, %rax
14549e381: 31 c9                       	xorl	%ecx, %ecx
14549e383: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549e386: 0f 2e f8                    	ucomiss	%xmm0, %xmm7
14549e389: 0f 43 c8                    	cmovael	%eax, %ecx
14549e38c: 0f 2e 3d 89 d1 44 00        	ucomiss	0x44d189(%rip), %xmm7   # 0x1458eb51c
14549e393: 41 b9 ff ff ff ff           	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
14549e399: 44 0f 46 c9                 	cmovbel	%ecx, %r9d
14549e39d: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549e3a4: 49 89 f8                    	movq	%rdi, %r8
14549e3a7: e8 e4 3a fa ff              	callq	0x145441e90 <.text+0x5440e90>
14549e3ac: 90                          	nop
14549e3ad: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549e3b4: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549e3bb: 75 0d                       	jne	0x14549e3ca <.text+0x549d3ca>
14549e3bd: 49 8d 8d 38 05 00 00        	leaq	0x538(%r13), %rcx
14549e3c4: e8 e7 9c 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549e3c9: 90                          	nop
14549e3ca: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549e3d1: 48 89 f1                    	movq	%rsi, %rcx
14549e3d4: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549e3d8: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14549e3df: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14549e3e6: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549e3eb: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549e3ef: 48 ff c6                    	incq	%rsi
14549e3f2: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549e3f9: 45 0f 2e d1                 	ucomiss	%xmm9, %xmm10
14549e3fd: 0f 97 44 24 28              	seta	0x28(%rsp)
14549e402: c6 44 24 30 01              	movb	$0x1, 0x30(%rsp)
14549e407: c6 44 24 20 00              	movb	$0x0, 0x20(%rsp)
14549e40c: 4c 89 e9                    	movq	%r13, %rcx
14549e40f: 48 89 fa                    	movq	%rdi, %rdx
14549e412: 0f 28 d7                    	movaps	%xmm7, %xmm2
14549e415: 45 31 c9                    	xorl	%r9d, %r9d
14549e418: e8 93 4a 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
14549e41d: 90                          	nop
14549e41e: f3 44 0f 59 05 c5 e9 45 00  	mulss	0x45e9c5(%rip), %xmm8   # 0x1458fcdec
14549e427: f3 41 0f 10 85 60 04 00 00  	movss	0x460(%r13), %xmm0
14549e430: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
14549e434: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
14549e439: 44 8b a5 40 03 00 00        	movl	0x340(%rbp), %r12d
14549e440: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
14549e447: f3 41 0f 11 85 a4 04 00 00  	movss	%xmm0, 0x4a4(%r13)
14549e450: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
14549e457: 48 85 d2                    	testq	%rdx, %rdx
14549e45a: 74 0f                       	je	0x14549e46b <.text+0x549d46b>
14549e45c: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549e460: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14549e466: e8 65 3d b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549e46b: 49 8b b5 a0 02 00 00        	movq	0x2a0(%r13), %rsi
14549e472: 48 85 f6                    	testq	%rsi, %rsi
14549e475: 0f 84 10 09 00 00           	je	0x14549ed8b <.text+0x549dd8b>
14549e47b: 49 8d 85 38 05 00 00        	leaq	0x538(%r13), %rax
14549e482: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
14549e489: 49 8d 85 e8 03 00 00        	leaq	0x3e8(%r13), %rax
14549e490: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
14549e497: f3 44 0f 10 05 a0 a8 45 00  	movss	0x45a8a0(%rip), %xmm8   # 0x1458f8d40
14549e4a0: f3 44 0f 10 0d 67 eb 44 00  	movss	0x44eb67(%rip), %xmm9   # 0x1458ed010
14549e4a9: 45 0f 57 d2                 	xorps	%xmm10, %xmm10
14549e4ad: f3 44 0f 10 1d 5a 2a 49 00  	movss	0x492a5a(%rip), %xmm11  # 0x145930f10
14549e4b6: f3 44 0f 10 25 5d d0 44 00  	movss	0x44d05d(%rip), %xmm12  # 0x1458eb51c
14549e4bf: f3 44 0f 10 2d f8 ce 54 00  	movss	0x54cef8(%rip), %xmm13  # 0x1459eb3c0
14549e4c8: f3 44 0f 10 35 4f 81 45 00  	movss	0x45814f(%rip), %xmm14  # 0x1458f6620
14549e4d1: 31 ff                       	xorl	%edi, %edi
14549e4d3: 48 89 b5 38 03 00 00        	movq	%rsi, 0x338(%rbp)
14549e4da: eb 1a                       	jmp	0x14549e4f6 <.text+0x549d4f6>
14549e4dc: 0f 1f 40 00                 	nopl	(%rax)
14549e4e0: f3 41 0f 5f c2              	maxss	%xmm10, %xmm0
14549e4e5: f3 0f 11 40 0c              	movss	%xmm0, 0xc(%rax)
14549e4ea: 48 ff c7                    	incq	%rdi
14549e4ed: 48 39 f7                    	cmpq	%rsi, %rdi
14549e4f0: 0f 84 95 08 00 00           	je	0x14549ed8b <.text+0x549dd8b>
14549e4f6: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549e4fd: 48 39 d7                    	cmpq	%rdx, %rdi
14549e500: 0f 83 32 c5 00 00           	jae	0x1454aaa38 <.text+0x54a9a38>
14549e506: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
14549e50d: 4c 6b f7 58                 	imulq	$0x58, %rdi, %r14
14549e511: f3 42 0f 10 44 30 0c        	movss	0xc(%rax,%r14), %xmm0
14549e518: 0f 28 c8                    	movaps	%xmm0, %xmm1
14549e51b: f3 0f 5c ce                 	subss	%xmm6, %xmm1
14549e51f: f3 42 0f 11 4c 30 0c        	movss	%xmm1, 0xc(%rax,%r14)
14549e526: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549e52d: 48 39 d7                    	cmpq	%rdx, %rdi
14549e530: 0f 83 e6 c4 00 00           	jae	0x1454aaa1c <.text+0x54a9a1c>
14549e536: 49 8b 8d 98 02 00 00        	movq	0x298(%r13), %rcx
14549e53d: 4a 8b 04 31                 	movq	(%rcx,%r14), %rax
14549e541: 83 78 68 0b                 	cmpl	$0xb, 0x68(%rax)
14549e545: 0f 85 25 02 00 00           	jne	0x14549e770 <.text+0x549d770>
14549e54b: 4c 01 f1                    	addq	%r14, %rcx
14549e54e: f3 0f 10 48 48              	movss	0x48(%rax), %xmm1
14549e553: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
14549e558: f3 0f 59 49 14              	mulss	0x14(%rcx), %xmm1
14549e55d: f3 0f 59 49 3c              	mulss	0x3c(%rcx), %xmm1
14549e562: f3 41 0f 59 8d 60 04 00 00  	mulss	0x460(%r13), %xmm1
14549e56b: f3 41 0f 5f c9              	maxss	%xmm9, %xmm1
14549e570: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
14549e573: 0f 86 f7 01 00 00           	jbe	0x14549e770 <.text+0x549d770>
14549e579: f3 0f 10 79 0c              	movss	0xc(%rcx), %xmm7
14549e57e: 0f 2e cf                    	ucomiss	%xmm7, %xmm1
14549e581: 0f 82 e9 01 00 00           	jb	0x14549e770 <.text+0x549d770>
14549e587: 41 0f 2e fa                 	ucomiss	%xmm10, %xmm7
14549e58b: 0f 86 df 01 00 00           	jbe	0x14549e770 <.text+0x549d770>
14549e591: 8b 58 40                    	movl	0x40(%rax), %ebx
14549e594: 49 8b b5 d0 03 00 00        	movq	0x3d0(%r13), %rsi
14549e59b: e8 60 3c b6 fa              	callq	0x140002200 <.text+0x1200>
14549e5a0: b9 20 00 00 00              	movl	$0x20, %ecx
14549e5a5: ba 01 00 00 00              	movl	$0x1, %edx
14549e5aa: e8 11 3c b6 fa              	callq	0x1400021c0 <.text+0x11c0>
14549e5af: 48 85 c0                    	testq	%rax, %rax
14549e5b2: 0f 84 92 c6 00 00           	je	0x1454aac4a <.text+0x54a9c4a>
14549e5b8: 89 18                       	movl	%ebx, (%rax)
14549e5ba: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549e5c1: 48 89 70 04                 	movq	%rsi, 0x4(%rax)
14549e5c5: 4d 8b bd 48 05 00 00        	movq	0x548(%r13), %r15
14549e5cc: 4d 3b bd 38 05 00 00        	cmpq	0x538(%r13), %r15
14549e5d3: 75 0d                       	jne	0x14549e5e2 <.text+0x549d5e2>
14549e5d5: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
14549e5dc: e8 cf 9a 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549e5e1: 90                          	nop
14549e5e2: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549e5e9: 4c 89 f9                    	movq	%r15, %rcx
14549e5ec: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549e5f0: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
14549e5f8: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
14549e5ff: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
14549e604: 48 c7 44 08 10 0c 00 00 00  	movq	$0xc, 0x10(%rax,%rcx)
14549e60d: 66 c7 44 08 18 de 01        	movw	$0x1de, 0x18(%rax,%rcx) # imm = 0x1DE
14549e614: 49 ff c7                    	incq	%r15
14549e617: f3 41 0f 59 fb              	mulss	%xmm11, %xmm7
14549e61c: f3 48 0f 2c c7              	cvttss2si	%xmm7, %rax
14549e621: 41 0f 2e fa                 	ucomiss	%xmm10, %xmm7
14549e625: b9 00 00 00 00              	movl	$0x0, %ecx
14549e62a: 0f 42 c1                    	cmovbl	%ecx, %eax
14549e62d: 41 0f 2e fc                 	ucomiss	%xmm12, %xmm7
14549e631: 4d 89 bd 48 05 00 00        	movq	%r15, 0x548(%r13)
14549e638: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14549e63d: 0f 47 c1                    	cmoval	%ecx, %eax
14549e640: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
14549e647: 89 9d 30 02 00 00           	movl	%ebx, 0x230(%rbp)
14549e64d: 89 85 34 02 00 00           	movl	%eax, 0x234(%rbp)
14549e653: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
14549e659: 88 85 77 03 00 00           	movb	%al, 0x377(%rbp)
14549e65f: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14549e665: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549e66c: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
14549e673: e8 e8 48 fa ff              	callq	0x145442f60 <.text+0x5441f60>
14549e678: 90                          	nop
14549e679: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549e680: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549e687: 75 0d                       	jne	0x14549e696 <.text+0x549d696>
14549e689: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
14549e690: e8 1b 9a 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549e695: 90                          	nop
14549e696: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549e69d: 48 89 f1                    	movq	%rsi, %rcx
14549e6a0: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549e6a4: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14549e6ab: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14549e6b2: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549e6b7: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549e6bb: 48 ff c6                    	incq	%rsi
14549e6be: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549e6c5: 49 8b b5 d0 03 00 00        	movq	0x3d0(%r13), %rsi
14549e6cc: e8 2f 3b b6 fa              	callq	0x140002200 <.text+0x1200>
14549e6d1: b9 20 00 00 00              	movl	$0x20, %ecx
14549e6d6: ba 01 00 00 00              	movl	$0x1, %edx
14549e6db: e8 e0 3a b6 fa              	callq	0x1400021c0 <.text+0x11c0>
14549e6e0: 48 85 c0                    	testq	%rax, %rax
14549e6e3: 0f 84 40 c5 00 00           	je	0x1454aac29 <.text+0x54a9c29>
14549e6e9: 89 18                       	movl	%ebx, (%rax)
14549e6eb: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549e6f2: 48 89 70 04                 	movq	%rsi, 0x4(%rax)
14549e6f6: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549e6fd: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549e704: 75 0d                       	jne	0x14549e713 <.text+0x549d713>
14549e706: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
14549e70d: e8 9e 99 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549e712: 90                          	nop
14549e713: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549e71a: 48 89 f1                    	movq	%rsi, %rcx
14549e71d: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549e721: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
14549e729: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
14549e730: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
14549e735: 48 c7 44 08 10 0c 00 00 00  	movq	$0xc, 0x10(%rax,%rcx)
14549e73e: 66 c7 44 08 18 35 01        	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14549e745: 48 ff c6                    	incq	%rsi
14549e748: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549e74f: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549e756: 44 8b a5 40 03 00 00        	movl	0x340(%rbp), %r12d
14549e75d: 48 8b b5 38 03 00 00        	movq	0x338(%rbp), %rsi
14549e764: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14549e770: 48 39 d7                    	cmpq	%rdx, %rdi
14549e773: 0f 83 fd c2 00 00           	jae	0x1454aaa76 <.text+0x54a9a76>
14549e779: 49 8b 8d 98 02 00 00        	movq	0x298(%r13), %rcx
14549e780: 4a 8d 04 31                 	leaq	(%rcx,%r14), %rax
14549e784: 4a 8b 14 31                 	movq	(%rcx,%r14), %rdx
14549e788: 80 7a 75 0b                 	cmpb	$0xb, 0x75(%rdx)
14549e78c: f3 42 0f 10 44 31 0c        	movss	0xc(%rcx,%r14), %xmm0
14549e793: 0f 84 47 fd ff ff           	je	0x14549e4e0 <.text+0x549d4e0>
14549e799: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
14549e79d: 0f 87 47 fd ff ff           	ja	0x14549e4ea <.text+0x549d4ea>
14549e7a3: c7 40 0c 00 00 80 7f        	movl	$0x7f800000, 0xc(%rax)  # imm = 0x7F800000
14549e7aa: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549e7b1: 48 39 d7                    	cmpq	%rdx, %rdi
14549e7b4: 0f 83 e2 c3 00 00           	jae	0x1454aab9c <.text+0x54a9b9c>
14549e7ba: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
14549e7c1: 4a 8b 0c 30                 	movq	(%rax,%r14), %rcx
14549e7c5: 42 8b 54 30 08              	movl	0x8(%rax,%r14), %edx
14549e7ca: f3 42 0f 10 44 30 14        	movss	0x14(%rax,%r14), %xmm0
14549e7d1: 46 8b 44 30 18              	movl	0x18(%rax,%r14), %r8d
14549e7d6: 46 8b 4c 30 34              	movl	0x34(%rax,%r14), %r9d
14549e7db: 4c 8d 95 c4 00 00 00        	leaq	0xc4(%rbp), %r10
14549e7e2: 45 89 4a 10                 	movl	%r9d, 0x10(%r10)
14549e7e6: 42 0f 10 4c 30 24           	movups	0x24(%rax,%r14), %xmm1
14549e7ec: 41 0f 11 0a                 	movups	%xmm1, (%r10)
14549e7f0: 42 0f 10 4c 30 38           	movups	0x38(%rax,%r14), %xmm1
14549e7f6: 42 0f 10 54 30 44           	movups	0x44(%rax,%r14), %xmm2
14549e7fc: 41 0f 11 52 20              	movups	%xmm2, 0x20(%r10)
14549e801: 41 0f 11 4a 14              	movups	%xmm1, 0x14(%r10)
14549e806: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
14549e80d: 89 95 a8 00 00 00           	movl	%edx, 0xa8(%rbp)
14549e813: f2 42 0f 10 4c 30 0c        	movsd	0xc(%rax,%r14), %xmm1
14549e81a: f2 0f 11 8d ac 00 00 00     	movsd	%xmm1, 0xac(%rbp)
14549e822: f3 0f 11 85 b4 00 00 00     	movss	%xmm0, 0xb4(%rbp)
14549e82a: 44 89 85 b8 00 00 00        	movl	%r8d, 0xb8(%rbp)
14549e831: f2 42 0f 10 44 30 1c        	movsd	0x1c(%rax,%r14), %xmm0
14549e838: f2 0f 11 85 bc 00 00 00     	movsd	%xmm0, 0xbc(%rbp)
14549e840: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549e847: 4c 89 e9                    	movq	%r13, %rcx
14549e84a: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549e851: e8 ca 91 04 00              	callq	0x1454e7a20 <.text+0x54e6a20>
14549e856: 88 85 58 03 00 00           	movb	%al, 0x358(%rbp)
14549e85c: 44 0f b6 85 58 03 00 00     	movzbl	0x358(%rbp), %r8d
14549e864: 45 84 c0                    	testb	%r8b, %r8b
14549e867: 0f 84 3b 03 00 00           	je	0x14549eba8 <.text+0x549dba8>
14549e86d: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549e874: 48 39 d7                    	cmpq	%rdx, %rdi
14549e877: 0f 83 ee c3 00 00           	jae	0x1454aac6b <.text+0x54a9c6b>
14549e87d: 41 83 bd 04 01 00 00 00     	cmpl	$0x0, 0x104(%r13)
14549e885: 0f 85 91 00 00 00           	jne	0x14549e91c <.text+0x549d91c>
14549e88b: 49 83 bd 00 07 00 00 00     	cmpq	$0x0, 0x700(%r13)
14549e893: 0f 84 83 00 00 00           	je	0x14549e91c <.text+0x549d91c>
14549e899: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
14549e8a0: 4a 8b 04 30                 	movq	(%rax,%r14), %rax
14549e8a4: 8b 48 40                    	movl	0x40(%rax), %ecx
14549e8a7: 0f b6 40 74                 	movzbl	0x74(%rax), %eax
14549e8ab: 4c 8b 8d a0 02 00 00        	movq	0x2a0(%rbp), %r9
14549e8b2: 41 8b 51 08                 	movl	0x8(%r9), %edx
14549e8b6: 4c 8d 85 c4 00 00 00        	leaq	0xc4(%rbp), %r8
14549e8bd: 41 89 50 f0                 	movl	%edx, -0x10(%r8)
14549e8c1: 49 8b 11                    	movq	(%r9), %rdx
14549e8c4: 49 89 50 e8                 	movq	%rdx, -0x18(%r8)
14549e8c8: c6 85 bd 00 00 00 03        	movb	$0x3, 0xbd(%rbp)
14549e8cf: 89 8d a8 00 00 00           	movl	%ecx, 0xa8(%rbp)
14549e8d5: 88 85 bc 00 00 00           	movb	%al, 0xbc(%rbp)
14549e8db: 48 c7 85 a0 00 00 00 00 00 00 00    	movq	$0x0, 0xa0(%rbp)
14549e8e6: c7 85 b8 00 00 00 00 00 00 00       	movl	$0x0, 0xb8(%rbp)
14549e8f0: c7 85 be 00 00 00 00 00 00 00       	movl	$0x0, 0xbe(%rbp)
14549e8fa: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549e901: 4c 89 e9                    	movq	%r13, %rcx
14549e904: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549e90b: 45 31 c0                    	xorl	%r8d, %r8d
14549e90e: e8 1d b0 01 00              	callq	0x1454b9930 <.text+0x54b8930>
14549e913: 90                          	nop
14549e914: 44 0f b6 85 58 03 00 00     	movzbl	0x358(%rbp), %r8d
14549e91c: f3 41 0f 10 bd 90 04 00 00  	movss	0x490(%r13), %xmm7
14549e925: 41 0f 2e fa                 	ucomiss	%xmm10, %xmm7
14549e929: 0f 86 79 02 00 00           	jbe	0x14549eba8 <.text+0x549dba8>
14549e92f: 0f 28 c7                    	movaps	%xmm7, %xmm0
14549e932: e8 1e 85 2b 00              	callq	0x145756e55 <.text+0x5755e55>
14549e937: f3 4c 0f 2c f8              	cvttss2si	%xmm0, %r15
14549e93c: 31 db                       	xorl	%ebx, %ebx
14549e93e: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
14549e942: 44 0f 42 fb                 	cmovbl	%ebx, %r15d
14549e946: 41 0f 2e c4                 	ucomiss	%xmm12, %xmm0
14549e94a: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14549e94f: 44 0f 47 f8                 	cmoval	%eax, %r15d
14549e953: 4d 8b 85 00 07 00 00        	movq	0x700(%r13), %r8
14549e95a: 4d 85 c0                    	testq	%r8, %r8
14549e95d: 74 15                       	je	0x14549e974 <.text+0x549d974>
14549e95f: 49 8b 8d f8 06 00 00        	movq	0x6f8(%r13), %rcx
14549e966: 31 c0                       	xorl	%eax, %eax
14549e968: 49 83 f8 01                 	cmpq	$0x1, %r8
14549e96c: 75 10                       	jne	0x14549e97e <.text+0x549d97e>
14549e96e: 31 d2                       	xorl	%edx, %edx
14549e970: 31 db                       	xorl	%ebx, %ebx
14549e972: eb 79                       	jmp	0x14549e9ed <.text+0x549d9ed>
14549e974: b8 01 00 00 00              	movl	$0x1, %eax
14549e979: e9 87 00 00 00              	jmp	0x14549ea05 <.text+0x549da05>
14549e97e: 4d 89 c1                    	movq	%r8, %r9
14549e981: 49 83 e1 fe                 	andq	$-0x2, %r9
14549e985: 4c 8d 51 44                 	leaq	0x44(%rcx), %r10
14549e989: 31 d2                       	xorl	%edx, %edx
14549e98b: 31 db                       	xorl	%ebx, %ebx
14549e98d: eb 13                       	jmp	0x14549e9a2 <.text+0x549d9a2>
14549e98f: 90                          	nop
14549e990: 44 01 db                    	addl	%r11d, %ebx
14549e993: 01 f3                       	addl	%esi, %ebx
14549e995: 48 83 c2 02                 	addq	$0x2, %rdx
14549e999: 49 83 ea 80                 	subq	$-0x80, %r10
14549e99d: 49 39 d1                    	cmpq	%rdx, %r9
14549e9a0: 74 22                       	je	0x14549e9c4 <.text+0x549d9c4>
14549e9a2: 41 80 7a bc 18              	cmpb	$0x18, -0x44(%r10)
14549e9a7: 41 bb 00 00 00 00           	movl	$0x0, %r11d
14549e9ad: 75 04                       	jne	0x14549e9b3 <.text+0x549d9b3>
14549e9af: 45 8b 5a c0                 	movl	-0x40(%r10), %r11d
14549e9b3: 41 80 7a fc 18              	cmpb	$0x18, -0x4(%r10)
14549e9b8: be 00 00 00 00              	movl	$0x0, %esi
14549e9bd: 75 d1                       	jne	0x14549e990 <.text+0x549d990>
14549e9bf: 41 8b 32                    	movl	(%r10), %esi
14549e9c2: eb cc                       	jmp	0x14549e990 <.text+0x549d990>
14549e9c4: 41 f6 c0 01                 	testb	$0x1, %r8b
14549e9c8: 48 8b b5 38 03 00 00        	movq	0x338(%rbp), %rsi
14549e9cf: 75 1c                       	jne	0x14549e9ed <.text+0x549d9ed>
14549e9d1: 89 d8                       	movl	%ebx, %eax
14549e9d3: ff c0                       	incl	%eax
14549e9d5: 75 2e                       	jne	0x14549ea05 <.text+0x549da05>
14549e9d7: 41 c6 85 ec 07 00 00 01     	movb	$0x1, 0x7ec(%r13)
14549e9df: 45 85 ff                    	testl	%r15d, %r15d
14549e9e2: 0f 85 f1 00 00 00           	jne	0x14549ead9 <.text+0x549dad9>
14549e9e8: e9 ab 01 00 00              	jmp	0x14549eb98 <.text+0x549db98>
14549e9ed: 48 c1 e2 06                 	shlq	$0x6, %rdx
14549e9f1: 80 3c 11 18                 	cmpb	$0x18, (%rcx,%rdx)
14549e9f5: 75 04                       	jne	0x14549e9fb <.text+0x549d9fb>
14549e9f7: 8b 44 11 04                 	movl	0x4(%rcx,%rdx), %eax
14549e9fb: 01 d8                       	addl	%ebx, %eax
14549e9fd: 89 c3                       	movl	%eax, %ebx
14549e9ff: 89 d8                       	movl	%ebx, %eax
14549ea01: ff c0                       	incl	%eax
14549ea03: 74 d2                       	je	0x14549e9d7 <.text+0x549d9d7>
14549ea05: 89 85 18 03 00 00           	movl	%eax, 0x318(%rbp)
14549ea0b: 4c 89 ee                    	movq	%r13, %rsi
14549ea0e: 4d 8b ad 80 08 00 00        	movq	0x880(%r13), %r13
14549ea15: 4c 8b a6 88 08 00 00        	movq	0x888(%rsi), %r12
14549ea1c: 0f 28 c7                    	movaps	%xmm7, %xmm0
14549ea1f: e8 01 84 2b 00              	callq	0x145756e25 <.text+0x5755e25>
14549ea24: 44 8b 8d 18 03 00 00        	movl	0x318(%rbp), %r9d
14549ea2b: f3 0f 5c f8                 	subss	%xmm0, %xmm7
14549ea2f: 48 8b 8e 98 08 00 00        	movq	0x898(%rsi), %rcx
14549ea36: 48 8b 86 90 08 00 00        	movq	0x890(%rsi), %rax
14549ea3d: 45 01 f9                    	addl	%r15d, %r9d
14549ea40: ff c3                       	incl	%ebx
14549ea42: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14549ea50: 4a 8d 14 29                 	leaq	(%rcx,%r13), %rdx
14549ea54: 48 c1 c2 17                 	rolq	$0x17, %rdx
14549ea58: 4c 01 ea                    	addq	%r13, %rdx
14549ea5b: 4d 89 e0                    	movq	%r12, %r8
14549ea5e: 49 c1 e0 11                 	shlq	$0x11, %r8
14549ea62: 4c 31 e8                    	xorq	%r13, %rax
14549ea65: 4c 31 e1                    	xorq	%r12, %rcx
14549ea68: 49 31 c4                    	xorq	%rax, %r12
14549ea6b: 49 31 cd                    	xorq	%rcx, %r13
14549ea6e: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
14549ea72: 48 c1 ea 28                 	shrq	$0x28, %rdx
14549ea76: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549ea79: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
14549ea7d: 4c 31 c0                    	xorq	%r8, %rax
14549ea80: f3 41 0f 59 c5              	mulss	%xmm13, %xmm0
14549ea85: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
14549ea88: 73 0a                       	jae	0x14549ea94 <.text+0x549da94>
14549ea8a: 41 ff c7                    	incl	%r15d
14549ea8d: ff cb                       	decl	%ebx
14549ea8f: 75 bf                       	jne	0x14549ea50 <.text+0x549da50>
14549ea91: 45 89 cf                    	movl	%r9d, %r15d
14549ea94: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
14549ea9b: 48 89 8a 98 08 00 00        	movq	%rcx, 0x898(%rdx)
14549eaa2: 4c 89 a2 88 08 00 00        	movq	%r12, 0x888(%rdx)
14549eaa9: 48 89 82 90 08 00 00        	movq	%rax, 0x890(%rdx)
14549eab0: 4c 89 aa 80 08 00 00        	movq	%r13, 0x880(%rdx)
14549eab7: 49 89 d5                    	movq	%rdx, %r13
14549eaba: 44 8b a5 40 03 00 00        	movl	0x340(%rbp), %r12d
14549eac1: 48 8b b5 38 03 00 00        	movq	0x338(%rbp), %rsi
14549eac8: 41 c6 85 ec 07 00 00 01     	movb	$0x1, 0x7ec(%r13)
14549ead0: 45 85 ff                    	testl	%r15d, %r15d
14549ead3: 0f 84 bf 00 00 00           	je	0x14549eb98 <.text+0x549db98>
14549ead9: 31 db                       	xorl	%ebx, %ebx
14549eadb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14549eae0: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549eae7: 48 39 d7                    	cmpq	%rdx, %rdi
14549eaea: 0f 83 10 bf 00 00           	jae	0x1454aaa00 <.text+0x54a9a00>
14549eaf0: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
14549eaf7: 4a 8b 0c 30                 	movq	(%rax,%r14), %rcx
14549eafb: 42 8b 54 30 08              	movl	0x8(%rax,%r14), %edx
14549eb00: f3 42 0f 10 44 30 14        	movss	0x14(%rax,%r14), %xmm0
14549eb07: 46 8b 44 30 18              	movl	0x18(%rax,%r14), %r8d
14549eb0c: 46 8b 4c 30 34              	movl	0x34(%rax,%r14), %r9d
14549eb11: 4c 8d 95 c4 00 00 00        	leaq	0xc4(%rbp), %r10
14549eb18: 45 89 4a 10                 	movl	%r9d, 0x10(%r10)
14549eb1c: 42 0f 10 4c 30 24           	movups	0x24(%rax,%r14), %xmm1
14549eb22: 41 0f 11 0a                 	movups	%xmm1, (%r10)
14549eb26: 42 0f 10 4c 30 38           	movups	0x38(%rax,%r14), %xmm1
14549eb2c: 42 0f 10 54 30 44           	movups	0x44(%rax,%r14), %xmm2
14549eb32: 41 0f 11 52 20              	movups	%xmm2, 0x20(%r10)
14549eb37: 41 0f 11 4a 14              	movups	%xmm1, 0x14(%r10)
14549eb3c: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
14549eb43: 89 95 a8 00 00 00           	movl	%edx, 0xa8(%rbp)
14549eb49: f2 42 0f 10 4c 30 0c        	movsd	0xc(%rax,%r14), %xmm1
14549eb50: f2 0f 11 8d ac 00 00 00     	movsd	%xmm1, 0xac(%rbp)
14549eb58: f3 0f 11 85 b4 00 00 00     	movss	%xmm0, 0xb4(%rbp)
14549eb60: 44 89 85 b8 00 00 00        	movl	%r8d, 0xb8(%rbp)
14549eb67: f2 42 0f 10 44 30 1c        	movsd	0x1c(%rax,%r14), %xmm0
14549eb6e: f2 0f 11 85 bc 00 00 00     	movsd	%xmm0, 0xbc(%rbp)
14549eb76: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549eb7d: 4c 89 e9                    	movq	%r13, %rcx
14549eb80: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549eb87: e8 94 8e 04 00              	callq	0x1454e7a20 <.text+0x54e6a20>
14549eb8c: 90                          	nop
14549eb8d: ff c3                       	incl	%ebx
14549eb8f: 44 39 fb                    	cmpl	%r15d, %ebx
14549eb92: 0f 85 48 ff ff ff           	jne	0x14549eae0 <.text+0x549dae0>
14549eb98: 41 c6 85 ec 07 00 00 00     	movb	$0x0, 0x7ec(%r13)
14549eba0: 44 0f b6 85 58 03 00 00     	movzbl	0x358(%rbp), %r8d
14549eba8: 49 8b 95 a0 02 00 00        	movq	0x2a0(%r13), %rdx
14549ebaf: 48 39 d7                    	cmpq	%rdx, %rdi
14549ebb2: 0f 83 c8 bf 00 00           	jae	0x1454aab80 <.text+0x54a9b80>
14549ebb8: 49 8b 8d 98 02 00 00        	movq	0x298(%r13), %rcx
14549ebbf: 4a 8b 04 31                 	movq	(%rcx,%r14), %rax
14549ebc3: f3 0f 10 40 48              	movss	0x48(%rax), %xmm0
14549ebc8: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
14549ebcd: f3 42 0f 59 44 31 14        	mulss	0x14(%rcx,%r14), %xmm0
14549ebd4: f3 42 0f 59 44 31 3c        	mulss	0x3c(%rcx,%r14), %xmm0
14549ebdb: f3 41 0f 59 85 60 04 00 00  	mulss	0x460(%r13), %xmm0
14549ebe4: 4c 01 f1                    	addq	%r14, %rcx
14549ebe7: f3 41 0f 5f c1              	maxss	%xmm9, %xmm0
14549ebec: 83 78 68 0b                 	cmpl	$0xb, 0x68(%rax)
14549ebf0: 75 1d                       	jne	0x14549ec0f <.text+0x549dc0f>
14549ebf2: f3 0f 10 48 58              	movss	0x58(%rax), %xmm1
14549ebf7: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
14549ebfc: f3 0f 59 49 20              	mulss	0x20(%rcx), %xmm1
14549ec01: f3 0f 59 49 48              	mulss	0x48(%rcx), %xmm1
14549ec06: f3 41 0f 5f ce              	maxss	%xmm14, %xmm1
14549ec0b: f3 0f 58 c1                 	addss	%xmm1, %xmm0
14549ec0f: 45 84 c0                    	testb	%r8b, %r8b
14549ec12: 0f 84 67 01 00 00           	je	0x14549ed7f <.text+0x549dd7f>
14549ec18: f3 0f 10 49 0c              	movss	0xc(%rcx), %xmm1
14549ec1d: 0f 28 d1                    	movaps	%xmm1, %xmm2
14549ec20: f3 0f 5d d0                 	minss	%xmm0, %xmm2
14549ec24: 0f 28 c2                    	movaps	%xmm2, %xmm0
14549ec27: f3 0f c2 c2 03              	cmpunordss	%xmm2, %xmm0
14549ec2c: 0f 28 d8                    	movaps	%xmm0, %xmm3
14549ec2f: 0f 55 da                    	andnps	%xmm2, %xmm3
14549ec32: 0f 54 c1                    	andps	%xmm1, %xmm0
14549ec35: 0f 56 c3                    	orps	%xmm3, %xmm0
14549ec38: f3 0f 11 41 0c              	movss	%xmm0, 0xc(%rcx)
14549ec3d: f3 41 0f 59 c3              	mulss	%xmm11, %xmm0
14549ec42: f3 48 0f 2c c8              	cvttss2si	%xmm0, %rcx
14549ec47: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
14549ec4b: ba 00 00 00 00              	movl	$0x0, %edx
14549ec50: 0f 42 ca                    	cmovbl	%edx, %ecx
14549ec53: 41 0f 2e c4                 	ucomiss	%xmm12, %xmm0
14549ec57: 8b 58 40                    	movl	0x40(%rax), %ebx
14549ec5a: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14549ec5f: 0f 47 c8                    	cmoval	%eax, %ecx
14549ec62: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
14549ec69: 89 9d 30 02 00 00           	movl	%ebx, 0x230(%rbp)
14549ec6f: 89 8d 34 02 00 00           	movl	%ecx, 0x234(%rbp)
14549ec75: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549ec7c: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14549ec82: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549ec89: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
14549ec90: e8 cb 42 fa ff              	callq	0x145442f60 <.text+0x5441f60>
14549ec95: 90                          	nop
14549ec96: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549ec9d: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549eca4: 75 0d                       	jne	0x14549ecb3 <.text+0x549dcb3>
14549eca6: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
14549ecad: e8 fe 93 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549ecb2: 90                          	nop
14549ecb3: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549ecba: 48 89 f1                    	movq	%rsi, %rcx
14549ecbd: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549ecc1: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14549ecc8: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14549eccf: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549ecd4: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549ecd8: 48 ff c6                    	incq	%rsi
14549ecdb: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549ece2: 49 8b b5 d0 03 00 00        	movq	0x3d0(%r13), %rsi
14549ece9: e8 12 35 b6 fa              	callq	0x140002200 <.text+0x1200>
14549ecee: b9 20 00 00 00              	movl	$0x20, %ecx
14549ecf3: ba 01 00 00 00              	movl	$0x1, %edx
14549ecf8: e8 c3 34 b6 fa              	callq	0x1400021c0 <.text+0x11c0>
14549ecfd: 48 85 c0                    	testq	%rax, %rax
14549ed00: 0f 84 02 bf 00 00           	je	0x1454aac08 <.text+0x54a9c08>
14549ed06: 89 18                       	movl	%ebx, (%rax)
14549ed08: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549ed0f: 48 89 70 04                 	movq	%rsi, 0x4(%rax)
14549ed13: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549ed1a: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549ed21: 75 0d                       	jne	0x14549ed30 <.text+0x549dd30>
14549ed23: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
14549ed2a: e8 81 93 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549ed2f: 90                          	nop
14549ed30: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549ed37: 48 89 f1                    	movq	%rsi, %rcx
14549ed3a: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549ed3e: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
14549ed46: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
14549ed4d: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
14549ed52: 48 c7 44 08 10 0c 00 00 00  	movq	$0xc, 0x10(%rax,%rcx)
14549ed5b: 66 c7 44 08 18 35 01        	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14549ed62: 48 ff c6                    	incq	%rsi
14549ed65: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549ed6c: 44 8b a5 40 03 00 00        	movl	0x340(%rbp), %r12d
14549ed73: 48 8b b5 38 03 00 00        	movq	0x338(%rbp), %rsi
14549ed7a: e9 6b f7 ff ff              	jmp	0x14549e4ea <.text+0x549d4ea>
14549ed7f: c7 41 0c cd cc 4c 3e        	movl	$0x3e4ccccd, 0xc(%rcx)  # imm = 0x3E4CCCCD
14549ed86: e9 5f f7 ff ff              	jmp	0x14549e4ea <.text+0x549d4ea>
14549ed8b: f3 41 0f 10 85 84 03 00 00  	movss	0x384(%r13), %xmm0
14549ed94: f3 0f 5c c6                 	subss	%xmm6, %xmm0
14549ed98: f3 41 0f 11 85 84 03 00 00  	movss	%xmm0, 0x384(%r13)
14549eda1: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549eda4: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549eda7: 0f 82 26 02 00 00           	jb	0x14549efd3 <.text+0x549dfd3>
14549edad: 49 8b 85 78 03 00 00        	movq	0x378(%r13), %rax
14549edb4: 41 8b 8d 80 03 00 00        	movl	0x380(%r13), %ecx
14549edbb: 41 8b 95 90 03 00 00        	movl	0x390(%r13), %edx
14549edc2: 45 8b 85 ac 03 00 00        	movl	0x3ac(%r13), %r8d
14549edc9: 44 89 85 d4 00 00 00        	movl	%r8d, 0xd4(%rbp)
14549edd0: 41 0f 10 8d 9c 03 00 00     	movups	0x39c(%r13), %xmm1
14549edd8: 0f 11 8d c4 00 00 00        	movups	%xmm1, 0xc4(%rbp)
14549eddf: 41 0f 10 8d b0 03 00 00     	movups	0x3b0(%r13), %xmm1
14549ede7: 41 0f 10 95 bc 03 00 00     	movups	0x3bc(%r13), %xmm2
14549edef: 0f 11 95 e4 00 00 00        	movups	%xmm2, 0xe4(%rbp)
14549edf6: 0f 11 8d d8 00 00 00        	movups	%xmm1, 0xd8(%rbp)
14549edfd: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
14549ee04: 89 8d a8 00 00 00           	movl	%ecx, 0xa8(%rbp)
14549ee0a: f3 0f 11 85 ac 00 00 00     	movss	%xmm0, 0xac(%rbp)
14549ee12: f2 41 0f 10 85 88 03 00 00  	movsd	0x388(%r13), %xmm0
14549ee1b: f2 0f 11 85 b0 00 00 00     	movsd	%xmm0, 0xb0(%rbp)
14549ee23: 89 95 b8 00 00 00           	movl	%edx, 0xb8(%rbp)
14549ee29: f2 41 0f 10 85 94 03 00 00  	movsd	0x394(%r13), %xmm0
14549ee32: f2 0f 11 85 bc 00 00 00     	movsd	%xmm0, 0xbc(%rbp)
14549ee3a: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549ee41: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549ee48: 4c 89 e9                    	movq	%r13, %rcx
14549ee4b: e8 d0 8b 04 00              	callq	0x1454e7a20 <.text+0x54e6a20>
14549ee50: 90                          	nop
14549ee51: 84 c0                       	testb	%al, %al
14549ee53: 0f 84 88 06 00 00           	je	0x14549f4e1 <.text+0x549e4e1>
14549ee59: 49 8b 85 78 03 00 00        	movq	0x378(%r13), %rax
14549ee60: f3 0f 10 40 48              	movss	0x48(%rax), %xmm0
14549ee65: f3 0f 59 05 d3 9e 45 00     	mulss	0x459ed3(%rip), %xmm0   # 0x1458f8d40
14549ee6d: f3 41 0f 59 85 8c 03 00 00  	mulss	0x38c(%r13), %xmm0
14549ee76: f3 41 0f 59 85 b4 03 00 00  	mulss	0x3b4(%r13), %xmm0
14549ee7f: f3 41 0f 59 85 60 04 00 00  	mulss	0x460(%r13), %xmm0
14549ee88: f3 0f 5f 05 80 e1 44 00     	maxss	0x44e180(%rip), %xmm0   # 0x1458ed010
14549ee90: f3 41 0f 11 85 84 03 00 00  	movss	%xmm0, 0x384(%r13)
14549ee99: f3 0f 59 05 6f 20 49 00     	mulss	0x49206f(%rip), %xmm0   # 0x145930f10
14549eea1: f3 48 0f 2c c8              	cvttss2si	%xmm0, %rcx
14549eea6: 31 d2                       	xorl	%edx, %edx
14549eea8: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549eeab: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
14549eeae: 0f 43 d1                    	cmovael	%ecx, %edx
14549eeb1: 8b 58 40                    	movl	0x40(%rax), %ebx
14549eeb4: 0f 2e 05 61 c6 44 00        	ucomiss	0x44c661(%rip), %xmm0   # 0x1458eb51c
14549eebb: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14549eec0: 0f 46 c2                    	cmovbel	%edx, %eax
14549eec3: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
14549eeca: 89 9d 10 02 00 00           	movl	%ebx, 0x210(%rbp)
14549eed0: 89 85 14 02 00 00           	movl	%eax, 0x214(%rbp)
14549eed6: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
14549eedd: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549eee4: 4c 8d 85 10 02 00 00        	leaq	0x210(%rbp), %r8
14549eeeb: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14549eef1: e8 6a 40 fa ff              	callq	0x145442f60 <.text+0x5441f60>
14549eef6: 90                          	nop
14549eef7: 49 8d bd 38 05 00 00        	leaq	0x538(%r13), %rdi
14549eefe: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549ef05: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549ef0c: 75 09                       	jne	0x14549ef17 <.text+0x549df17>
14549ef0e: 48 89 f9                    	movq	%rdi, %rcx
14549ef11: e8 9a 91 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549ef16: 90                          	nop
14549ef17: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549ef1e: 48 89 f1                    	movq	%rsi, %rcx
14549ef21: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549ef25: 0f 10 85 30 02 00 00        	movups	0x230(%rbp), %xmm0
14549ef2c: 0f 10 8d 40 02 00 00        	movups	0x240(%rbp), %xmm1
14549ef33: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549ef38: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549ef3c: 48 ff c6                    	incq	%rsi
14549ef3f: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549ef46: 49 8b b5 d0 03 00 00        	movq	0x3d0(%r13), %rsi
14549ef4d: e8 ae 32 b6 fa              	callq	0x140002200 <.text+0x1200>
14549ef52: b9 20 00 00 00              	movl	$0x20, %ecx
14549ef57: ba 01 00 00 00              	movl	$0x1, %edx
14549ef5c: e8 5f 32 b6 fa              	callq	0x1400021c0 <.text+0x11c0>
14549ef61: 48 85 c0                    	testq	%rax, %rax
14549ef64: 0f 84 fc be 00 00           	je	0x1454aae66 <.text+0x54a9e66>
14549ef6a: 89 18                       	movl	%ebx, (%rax)
14549ef6c: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549ef73: 48 89 70 04                 	movq	%rsi, 0x4(%rax)
14549ef77: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549ef7e: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549ef85: 75 09                       	jne	0x14549ef90 <.text+0x549df90>
14549ef87: 48 89 f9                    	movq	%rdi, %rcx
14549ef8a: e8 21 91 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549ef8f: 90                          	nop
14549ef90: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549ef97: 48 89 f1                    	movq	%rsi, %rcx
14549ef9a: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549ef9e: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
14549efa6: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
14549efad: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
14549efb2: 48 c7 44 08 10 0c 00 00 00  	movq	$0xc, 0x10(%rax,%rcx)
14549efbb: 66 c7 44 08 18 35 01        	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14549efc2: 48 ff c6                    	incq	%rsi
14549efc5: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549efcc: 44 8b a5 40 03 00 00        	movl	0x340(%rbp), %r12d
14549efd3: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
14549efda: 48 85 d2                    	testq	%rdx, %rdx
14549efdd: 74 16                       	je	0x14549eff5 <.text+0x549dff5>
14549efdf: 48 8b 8d e0 02 00 00        	movq	0x2e0(%rbp), %rcx
14549efe6: 48 c1 e2 02                 	shlq	$0x2, %rdx
14549efea: 41 b8 04 00 00 00           	movl	$0x4, %r8d
14549eff0: e8 db 31 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549eff5: 45 84 e4                    	testb	%r12b, %r12b
14549eff8: 74 22                       	je	0x14549f01c <.text+0x549e01c>
14549effa: 48 8b 95 b0 02 00 00        	movq	0x2b0(%rbp), %rdx
14549f001: 48 85 d2                    	testq	%rdx, %rdx
14549f004: 74 16                       	je	0x14549f01c <.text+0x549e01c>
14549f006: 48 8b 8d b8 02 00 00        	movq	0x2b8(%rbp), %rcx
14549f00d: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549f011: 41 b8 04 00 00 00           	movl	$0x4, %r8d
14549f017: e8 b4 31 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549f01c: 49 8d 85 58 04 00 00        	leaq	0x458(%r13), %rax
14549f023: 48 89 85 90 02 00 00        	movq	%rax, 0x290(%rbp)
14549f02a: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
14549f033: 49 8b 45 58                 	movq	0x58(%r13), %rax
14549f037: 49 8b 4d 60                 	movq	0x60(%r13), %rcx
14549f03b: 48 89 ca                    	movq	%rcx, %rdx
14549f03e: 48 c1 e2 04                 	shlq	$0x4, %rdx
14549f042: 49 89 c0                    	movq	%rax, %r8
14549f045: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14549f050: 48 85 d2                    	testq	%rdx, %rdx
14549f053: 74 51                       	je	0x14549f0a6 <.text+0x549e0a6>
14549f055: 48 83 c2 f0                 	addq	$-0x10, %rdx
14549f059: 41 0f 2e 40 0c              	ucomiss	0xc(%r8), %xmm0
14549f05e: 4d 8d 40 10                 	leaq	0x10(%r8), %r8
14549f062: 72 ec                       	jb	0x14549f050 <.text+0x549e050>
14549f064: 48 85 c9                    	testq	%rcx, %rcx
14549f067: 74 35                       	je	0x14549f09e <.text+0x549e09e>
14549f069: 4c 8d 48 1c                 	leaq	0x1c(%rax), %r9
14549f06d: 48 89 ca                    	movq	%rcx, %rdx
14549f070: 48 f7 da                    	negq	%rdx
14549f073: 45 31 c0                    	xorl	%r8d, %r8d
14549f076: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14549f080: f3 41 0f 10 49 f0           	movss	-0x10(%r9), %xmm1
14549f086: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549f089: 0f 86 d0 2a 00 00           	jbe	0x1454a1b5f <.text+0x54a0b5f>
14549f08f: 49 ff c0                    	incq	%r8
14549f092: 49 83 c1 10                 	addq	$0x10, %r9
14549f096: 49 89 d2                    	movq	%rdx, %r10
14549f099: 4d 01 c2                    	addq	%r8, %r10
14549f09c: 75 e2                       	jne	0x14549f080 <.text+0x549e080>
14549f09e: 4c 89 e9                    	movq	%r13, %rcx
14549f0a1: e8 2a 60 ff ff              	callq	0x1454950d0 <.text+0x54940d0>
14549f0a6: 49 8b 9d c0 00 00 00        	movq	0xc0(%r13), %rbx
14549f0ad: 48 85 db                    	testq	%rbx, %rbx
14549f0b0: 0f 84 7f 02 00 00           	je	0x14549f335 <.text+0x549e335>
14549f0b6: 4c 8d ad 54 02 00 00        	leaq	0x254(%rbp), %r13
14549f0bd: 4c 8d b5 c4 00 00 00        	leaq	0xc4(%rbp), %r14
14549f0c4: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
14549f0cb: 48 05 e8 03 00 00           	addq	$0x3e8, %rax            # imm = 0x3E8
14549f0d1: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549f0d8: 31 ff                       	xorl	%edi, %edi
14549f0da: 0f 57 ff                    	xorps	%xmm7, %xmm7
14549f0dd: f3 44 0f 10 05 5a 9c 45 00  	movss	0x459c5a(%rip), %xmm8   # 0x1458f8d40
14549f0e6: f3 44 0f 10 0d 21 df 44 00  	movss	0x44df21(%rip), %xmm9   # 0x1458ed010
14549f0ef: 45 31 ff                    	xorl	%r15d, %r15d
14549f0f2: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
14549f0f9: eb 15                       	jmp	0x14549f110 <.text+0x549e110>
14549f0fb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14549f100: 48 ff c7                    	incq	%rdi
14549f103: 49 83 c7 60                 	addq	$0x60, %r15
14549f107: 48 39 fb                    	cmpq	%rdi, %rbx
14549f10a: 0f 84 25 02 00 00           	je	0x14549f335 <.text+0x549e335>
14549f110: 48 8b 96 c0 00 00 00        	movq	0xc0(%rsi), %rdx
14549f117: 48 39 d7                    	cmpq	%rdx, %rdi
14549f11a: 0f 83 45 b9 00 00           	jae	0x1454aaa65 <.text+0x54a9a65>
14549f120: 48 8b 86 b8 00 00 00        	movq	0xb8(%rsi), %rax
14549f127: f3 42 0f 10 44 38 0c        	movss	0xc(%rax,%r15), %xmm0
14549f12e: f3 0f 5c c6                 	subss	%xmm6, %xmm0
14549f132: f3 42 0f 11 44 38 0c        	movss	%xmm0, 0xc(%rax,%r15)
14549f139: 48 8b 96 c0 00 00 00        	movq	0xc0(%rsi), %rdx
14549f140: 48 39 d7                    	cmpq	%rdx, %rdi
14549f143: 0f 83 0b b9 00 00           	jae	0x1454aaa54 <.text+0x54a9a54>
14549f149: 48 8b 86 b8 00 00 00        	movq	0xb8(%rsi), %rax
14549f150: f3 46 0f 10 5c 38 0c        	movss	0xc(%rax,%r15), %xmm11
14549f157: 44 0f 2e df                 	ucomiss	%xmm7, %xmm11
14549f15b: 77 a3                       	ja	0x14549f100 <.text+0x549e100>
14549f15d: 4e 8b 24 38                 	movq	(%rax,%r15), %r12
14549f161: f3 46 0f 10 54 38 58        	movss	0x58(%rax,%r15), %xmm10
14549f168: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549f16f: 48 89 f2                    	movq	%rsi, %rdx
14549f172: 4d 89 e0                    	movq	%r12, %r8
14549f175: e8 66 f6 01 00              	callq	0x1454be7e0 <.text+0x54bd7e0>
14549f17a: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
14549f181: 8b 8d 38 02 00 00           	movl	0x238(%rbp), %ecx
14549f187: 8b 95 48 02 00 00           	movl	0x248(%rbp), %edx
14549f18d: 45 8b 45 10                 	movl	0x10(%r13), %r8d
14549f191: 45 89 46 10                 	movl	%r8d, 0x10(%r14)
14549f195: 41 0f 10 45 00              	movups	(%r13), %xmm0
14549f19a: 41 0f 11 06                 	movups	%xmm0, (%r14)
14549f19e: 44 8b 85 68 02 00 00        	movl	0x268(%rbp), %r8d
14549f1a5: f3 0f 10 85 6c 02 00 00     	movss	0x26c(%rbp), %xmm0
14549f1ad: 45 8b 4d 2c                 	movl	0x2c(%r13), %r9d
14549f1b1: 45 89 4e 2c                 	movl	%r9d, 0x2c(%r14)
14549f1b5: 41 0f 10 4d 1c              	movups	0x1c(%r13), %xmm1
14549f1ba: 41 0f 11 4e 1c              	movups	%xmm1, 0x1c(%r14)
14549f1bf: f2 0f 10 8d 40 02 00 00     	movsd	0x240(%rbp), %xmm1
14549f1c7: f3 44 0f 10 60 48           	movss	0x48(%rax), %xmm12
14549f1cd: f3 45 0f 59 e0              	mulss	%xmm8, %xmm12
14549f1d2: f3 44 0f 59 a5 44 02 00 00  	mulss	0x244(%rbp), %xmm12
14549f1db: f2 0f 10 95 4c 02 00 00     	movsd	0x24c(%rbp), %xmm2
14549f1e3: f3 44 0f 59 e0              	mulss	%xmm0, %xmm12
14549f1e8: f3 44 0f 59 a6 60 04 00 00  	mulss	0x460(%rsi), %xmm12
14549f1f1: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
14549f1f8: 89 8d a8 00 00 00           	movl	%ecx, 0xa8(%rbp)
14549f1fe: f3 44 0f 11 9d ac 00 00 00  	movss	%xmm11, 0xac(%rbp)
14549f207: f2 0f 11 8d b0 00 00 00     	movsd	%xmm1, 0xb0(%rbp)
14549f20f: 89 95 b8 00 00 00           	movl	%edx, 0xb8(%rbp)
14549f215: f2 0f 11 95 bc 00 00 00     	movsd	%xmm2, 0xbc(%rbp)
14549f21d: 44 89 85 d8 00 00 00        	movl	%r8d, 0xd8(%rbp)
14549f224: f3 0f 11 85 dc 00 00 00     	movss	%xmm0, 0xdc(%rbp)
14549f22c: 48 89 f1                    	movq	%rsi, %rcx
14549f22f: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549f236: e8 e5 87 04 00              	callq	0x1454e7a20 <.text+0x54e6a20>
14549f23b: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549f23e: f3 41 0f c2 c2 01           	cmpltss	%xmm10, %xmm0
14549f244: f3 44 0f 59 96 60 04 00 00  	mulss	0x460(%rsi), %xmm10
14549f24d: 44 0f 54 d0                 	andps	%xmm0, %xmm10
14549f251: 41 0f 55 c4                 	andnps	%xmm12, %xmm0
14549f255: 44 0f 56 d0                 	orps	%xmm0, %xmm10
14549f259: f3 45 0f 5f d1              	maxss	%xmm9, %xmm10
14549f25e: 48 8b 96 c0 00 00 00        	movq	0xc0(%rsi), %rdx
14549f265: 84 c0                       	testb	%al, %al
14549f267: 0f 84 a3 00 00 00           	je	0x14549f310 <.text+0x549e310>
14549f26d: 48 39 d7                    	cmpq	%rdx, %rdi
14549f270: 0f 83 62 b8 00 00           	jae	0x1454aaad8 <.text+0x54a9ad8>
14549f276: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
14549f27d: 48 8b 81 b8 00 00 00        	movq	0xb8(%rcx), %rax
14549f284: f3 46 0f 11 54 38 0c        	movss	%xmm10, 0xc(%rax,%r15)
14549f28b: 83 b9 04 01 00 00 00        	cmpl	$0x0, 0x104(%rcx)
14549f292: 0f 85 68 fe ff ff           	jne	0x14549f100 <.text+0x549e100>
14549f298: 48 83 b9 00 07 00 00 00     	cmpq	$0x0, 0x700(%rcx)
14549f2a0: 0f 84 5a fe ff ff           	je	0x14549f100 <.text+0x549e100>
14549f2a6: 41 8b 44 24 40              	movl	0x40(%r12), %eax
14549f2ab: 45 0f b6 44 24 74           	movzbl	0x74(%r12), %r8d
14549f2b1: 4c 8b 8d 58 03 00 00        	movq	0x358(%rbp), %r9
14549f2b8: 41 8b 51 08                 	movl	0x8(%r9), %edx
14549f2bc: 41 89 56 f0                 	movl	%edx, -0x10(%r14)
14549f2c0: 49 8b 11                    	movq	(%r9), %rdx
14549f2c3: 49 89 56 e8                 	movq	%rdx, -0x18(%r14)
14549f2c7: c6 85 bd 00 00 00 03        	movb	$0x3, 0xbd(%rbp)
14549f2ce: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
14549f2d4: 44 88 85 bc 00 00 00        	movb	%r8b, 0xbc(%rbp)
14549f2db: 48 c7 85 a0 00 00 00 00 00 00 00    	movq	$0x0, 0xa0(%rbp)
14549f2e6: c7 85 b8 00 00 00 00 00 00 00       	movl	$0x0, 0xb8(%rbp)
14549f2f0: c7 85 be 00 00 00 00 00 00 00       	movl	$0x0, 0xbe(%rbp)
14549f2fa: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549f301: 45 31 c0                    	xorl	%r8d, %r8d
14549f304: e8 27 a6 01 00              	callq	0x1454b9930 <.text+0x54b8930>
14549f309: e9 f2 fd ff ff              	jmp	0x14549f100 <.text+0x549e100>
14549f30e: 66 90                       	nop
14549f310: 48 39 d7                    	cmpq	%rdx, %rdi
14549f313: 0f 83 bf b7 00 00           	jae	0x1454aaad8 <.text+0x54a9ad8>
14549f319: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
14549f320: 48 8b 80 b8 00 00 00        	movq	0xb8(%rax), %rax
14549f327: 42 c7 44 38 0c 9a 99 99 3e  	movl	$0x3e99999a, 0xc(%rax,%r15) # imm = 0x3E99999A
14549f330: e9 cb fd ff ff              	jmp	0x14549f100 <.text+0x549e100>
14549f335: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
14549f33c: 49 8b 95 00 07 00 00        	movq	0x700(%r13), %rdx
14549f343: 48 85 d2                    	testq	%rdx, %rdx
14549f346: 0f 84 9f 02 00 00           	je	0x14549f5eb <.text+0x549e5eb>
14549f34c: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
14549f355: 49 8b 85 f8 06 00 00        	movq	0x6f8(%r13), %rax
14549f35c: 48 c1 e2 06                 	shlq	$0x6, %rdx
14549f360: 31 c9                       	xorl	%ecx, %ecx
14549f362: 31 db                       	xorl	%ebx, %ebx
14549f364: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14549f370: 80 3c 08 15                 	cmpb	$0x15, (%rax,%rcx)
14549f374: 74 11                       	je	0x14549f387 <.text+0x549e387>
14549f376: 48 ff c3                    	incq	%rbx
14549f379: 48 83 c1 40                 	addq	$0x40, %rcx
14549f37d: 48 39 ca                    	cmpq	%rcx, %rdx
14549f380: 75 ee                       	jne	0x14549f370 <.text+0x549e370>
14549f382: e9 64 02 00 00              	jmp	0x14549f5eb <.text+0x549e5eb>
14549f387: f3 41 0f 10 8d 0c 01 00 00  	movss	0x10c(%r13), %xmm1
14549f390: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549f393: 0f 87 52 02 00 00           	ja	0x14549f5eb <.text+0x549e5eb>
14549f399: f3 45 0f 10 85 08 01 00 00  	movss	0x108(%r13), %xmm8
14549f3a2: f3 0f 10 0d d6 c0 44 00     	movss	0x44c0d6(%rip), %xmm1   # 0x1458eb480
14549f3aa: 41 0f 2e c8                 	ucomiss	%xmm8, %xmm1
14549f3ae: 0f 87 37 02 00 00           	ja	0x14549f5eb <.text+0x549e5eb>
14549f3b4: f3 0f 10 7c 08 04           	movss	0x4(%rax,%rcx), %xmm7
14549f3ba: 8b 7c 08 0c                 	movl	0xc(%rax,%rcx), %edi
14549f3be: f3 0f 10 5c 08 08           	movss	0x8(%rax,%rcx), %xmm3
14549f3c4: f3 0f 58 05 b4 c0 44 00     	addss	0x44c0b4(%rip), %xmm0   # 0x1458eb480
14549f3cc: f3 41 0f 11 85 0c 01 00 00  	movss	%xmm0, 0x10c(%r13)
14549f3d5: 41 c7 85 08 01 00 00 00 00 00 00    	movl	$0x0, 0x108(%r13)
14549f3e0: 41 8b 85 f0 03 00 00        	movl	0x3f0(%r13), %eax
14549f3e7: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
14549f3ed: 49 8b 85 e8 03 00 00        	movq	0x3e8(%r13), %rax
14549f3f4: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
14549f3fb: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
14549f404: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
14549f40d: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549f414: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
14549f41b: 4c 89 ea                    	movq	%r13, %rdx
14549f41e: e8 ad ec 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
14549f423: 85 ff                       	testl	%edi, %edi
14549f425: 0f 84 fc 00 00 00           	je	0x14549f527 <.text+0x549e527>
14549f42b: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
14549f432: 4c 8b 8d 38 02 00 00        	movq	0x238(%rbp), %r9
14549f439: 4c 8b b5 40 02 00 00        	movq	0x240(%rbp), %r14
14549f440: c7 85 d8 02 00 00 02 00 00 00       	movl	$0x2, 0x2d8(%rbp)
14549f44a: c7 85 b0 02 00 00 00 00 00 00       	movl	$0x0, 0x2b0(%rbp)
14549f454: 4c 89 4d 20                 	movq	%r9, 0x20(%rbp)
14549f458: c6 85 27 03 00 00 01        	movb	$0x1, 0x327(%rbp)
14549f45f: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
14549f466: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14549f46b: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
14549f472: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
14549f477: 4c 89 74 24 20              	movq	%r14, 0x20(%rsp)
14549f47c: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549f483: 41 89 f8                    	movl	%edi, %r8d
14549f486: 4c 89 8d 58 03 00 00        	movq	%r9, 0x358(%rbp)
14549f48d: e8 0e bd fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
14549f492: 90                          	nop
14549f493: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549f49a: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549f4a1: 75 0d                       	jne	0x14549f4b0 <.text+0x549e4b0>
14549f4a3: 49 8d 8d 38 05 00 00        	leaq	0x538(%r13), %rcx
14549f4aa: e8 01 8c 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549f4af: 90                          	nop
14549f4b0: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549f4b7: 48 89 f1                    	movq	%rsi, %rcx
14549f4ba: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549f4be: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14549f4c5: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14549f4cc: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549f4d1: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549f4d5: 48 ff c6                    	incq	%rsi
14549f4d8: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549f4df: eb 5b                       	jmp	0x14549f53c <.text+0x549e53c>
14549f4e1: 41 c7 85 84 03 00 00 00 00 00 3f    	movl	$0x3f000000, 0x384(%r13) # imm = 0x3F000000
14549f4ec: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
14549f4f3: 48 85 d2                    	testq	%rdx, %rdx
14549f4f6: 0f 85 e3 fa ff ff           	jne	0x14549efdf <.text+0x549dfdf>
14549f4fc: e9 f4 fa ff ff              	jmp	0x14549eff5 <.text+0x549dff5>
14549f501: f3 0f 10 05 1f c0 44 00     	movss	0x44c01f(%rip), %xmm0   # 0x1458eb528
14549f509: f3 41 0f 11 85 a4 04 00 00  	movss	%xmm0, 0x4a4(%r13)
14549f512: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
14549f519: 48 85 d2                    	testq	%rdx, %rdx
14549f51c: 0f 85 3a ef ff ff           	jne	0x14549e45c <.text+0x549d45c>
14549f522: e9 44 ef ff ff              	jmp	0x14549e46b <.text+0x549d46b>
14549f527: 48 8b 85 38 02 00 00        	movq	0x238(%rbp), %rax
14549f52e: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549f535: 4c 8b b5 40 02 00 00        	movq	0x240(%rbp), %r14
14549f53c: 45 0f 10 4d 20              	movups	0x20(%r13), %xmm9
14549f541: 49 c7 45 20 01 00 00 00     	movq	$0x1, 0x20(%r13)
14549f549: 49 89 5d 28                 	movq	%rbx, 0x28(%r13)
14549f54d: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
14549f554: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
14549f55b: 4d 85 f6                    	testq	%r14, %r14
14549f55e: 74 64                       	je	0x14549f5c4 <.text+0x549e5c4>
14549f560: 49 c1 e6 03                 	shlq	$0x3, %r14
14549f564: f3 41 0f 59 f8              	mulss	%xmm8, %xmm7
14549f569: 41 0f b6 9d 11 01 00 00     	movzbl	0x111(%r13), %ebx
14549f571: 31 ff                       	xorl	%edi, %edi
14549f573: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
14549f580: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
14549f587: 48 8b 14 38                 	movq	(%rax,%rdi), %rdx
14549f58b: 41 c6 85 11 01 00 00 03     	movb	$0x3, 0x111(%r13)
14549f593: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
14549f598: c6 44 24 28 00              	movb	$0x0, 0x28(%rsp)
14549f59d: c6 44 24 20 03              	movb	$0x3, 0x20(%rsp)
14549f5a2: 4c 89 e9                    	movq	%r13, %rcx
14549f5a5: 0f 28 d7                    	movaps	%xmm7, %xmm2
14549f5a8: 41 b9 e4 02 00 00           	movl	$0x2e4, %r9d            # imm = 0x2E4
14549f5ae: e8 fd 38 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
14549f5b3: 90                          	nop
14549f5b4: 41 88 9d 11 01 00 00        	movb	%bl, 0x111(%r13)
14549f5bb: 48 83 c7 08                 	addq	$0x8, %rdi
14549f5bf: 49 39 fe                    	cmpq	%rdi, %r14
14549f5c2: 75 bc                       	jne	0x14549f580 <.text+0x549e580>
14549f5c4: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
14549f5cb: 48 85 d2                    	testq	%rdx, %rdx
14549f5ce: 74 16                       	je	0x14549f5e6 <.text+0x549e5e6>
14549f5d0: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549f5d4: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14549f5da: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
14549f5e1: e8 ea 2b b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549f5e6: 45 0f 11 4d 20              	movups	%xmm9, 0x20(%r13)
14549f5eb: 41 80 bd 5f 09 00 00 01     	cmpb	$0x1, 0x95f(%r13)
14549f5f3: 0f 85 8e 13 00 00           	jne	0x1454a0987 <.text+0x549f987>
14549f5f9: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
14549f602: f3 0f 11 85 90 00 00 00     	movss	%xmm0, 0x90(%rbp)
14549f60a: 49 8b 85 d0 00 00 00        	movq	0xd0(%r13), %rax
14549f611: 49 8b 8d d8 00 00 00        	movq	0xd8(%r13), %rcx
14549f618: 48 8d 0c 49                 	leaq	(%rcx,%rcx,2), %rcx
14549f61c: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549f620: 48 01 c1                    	addq	%rax, %rcx
14549f623: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
14549f62a: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
14549f631: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
14549f638: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
14549f63f: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
14549f646: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
14549f64d: e8 9e 24 09 00              	callq	0x145531af0 <.text+0x5530af0>
14549f652: 48 8b 9d 40 02 00 00        	movq	0x240(%rbp), %rbx
14549f659: 48 85 db                    	testq	%rbx, %rbx
14549f65c: 0f 84 1a 01 00 00           	je	0x14549f77c <.text+0x549e77c>
14549f662: 49 8d 8d c8 00 00 00        	leaq	0xc8(%r13), %rcx
14549f669: c6 85 67 03 00 00 01        	movb	$0x1, 0x367(%rbp)
14549f670: 48 8d 95 30 02 00 00        	leaq	0x230(%rbp), %rdx
14549f677: e8 a4 43 08 00              	callq	0x145523a20 <.text+0x5522a20>
14549f67c: 90                          	nop
14549f67d: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
14549f684: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
14549f68b: 48 8b 85 38 02 00 00        	movq	0x238(%rbp), %rax
14549f692: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
14549f699: 48 c1 e3 03                 	shlq	$0x3, %rbx
14549f69d: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
14549f6a4: 49 8d bd 38 05 00 00        	leaq	0x538(%r13), %rdi
14549f6ab: 45 31 f6                    	xorl	%r14d, %r14d
14549f6ae: eb 45                       	jmp	0x14549f6f5 <.text+0x549e6f5>
14549f6b0: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549f6b7: 48 89 f1                    	movq	%rsi, %rcx
14549f6ba: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549f6be: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
14549f6c6: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
14549f6cd: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
14549f6d2: 48 c7 44 08 10 08 00 00 00  	movq	$0x8, 0x10(%rax,%rcx)
14549f6db: 66 c7 44 08 18 aa 00        	movw	$0xaa, 0x18(%rax,%rcx)
14549f6e2: 48 ff c6                    	incq	%rsi
14549f6e5: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549f6ec: 49 83 c6 08                 	addq	$0x8, %r14
14549f6f0: 4c 39 f3                    	cmpq	%r14, %rbx
14549f6f3: 74 59                       	je	0x14549f74e <.text+0x549e74e>
14549f6f5: 48 8b 85 40 03 00 00        	movq	0x340(%rbp), %rax
14549f6fc: 4a 8b 34 30                 	movq	(%rax,%r14), %rsi
14549f700: 48 85 f6                    	testq	%rsi, %rsi
14549f703: 74 e7                       	je	0x14549f6ec <.text+0x549e6ec>
14549f705: e8 f6 2a b6 fa              	callq	0x140002200 <.text+0x1200>
14549f70a: b9 20 00 00 00              	movl	$0x20, %ecx
14549f70f: ba 01 00 00 00              	movl	$0x1, %edx
14549f714: e8 a7 2a b6 fa              	callq	0x1400021c0 <.text+0x11c0>
14549f719: 48 85 c0                    	testq	%rax, %rax
14549f71c: 0f 84 fc b3 00 00           	je	0x1454aab1e <.text+0x54a9b1e>
14549f722: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
14549f729: 48 89 30                    	movq	%rsi, (%rax)
14549f72c: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549f733: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549f73a: 0f 85 70 ff ff ff           	jne	0x14549f6b0 <.text+0x549e6b0>
14549f740: 48 89 f9                    	movq	%rdi, %rcx
14549f743: e8 68 89 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549f748: 90                          	nop
14549f749: e9 62 ff ff ff              	jmp	0x14549f6b0 <.text+0x549e6b0>
14549f74e: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
14549f755: 48 85 d2                    	testq	%rdx, %rdx
14549f758: 74 16                       	je	0x14549f770 <.text+0x549e770>
14549f75a: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549f75e: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14549f764: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
14549f76b: e8 60 2a b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549f770: c7 85 48 03 00 00 00 00 00 00       	movl	$0x0, 0x348(%rbp)
14549f77a: eb 08                       	jmp	0x14549f784 <.text+0x549e784>
14549f77c: b0 01                       	movb	$0x1, %al
14549f77e: 89 85 48 03 00 00           	movl	%eax, 0x348(%rbp)
14549f784: f2 45 0f 10 a5 e8 03 00 00  	movsd	0x3e8(%r13), %xmm12
14549f78d: f3 0f 10 05 fb 08 46 00     	movss	0x4608fb(%rip), %xmm0   # 0x145900090
14549f795: f3 45 0f 10 ad 6c 04 00 00  	movss	0x46c(%r13), %xmm13
14549f79e: f3 44 0f 59 e8              	mulss	%xmm0, %xmm13
14549f7a3: 49 8b 85 d8 00 00 00        	movq	0xd8(%r13), %rax
14549f7aa: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
14549f7b1: 41 0f 28 cd                 	movaps	%xmm13, %xmm1
14549f7b5: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14549f7b9: f3 0f 10 05 ff ab 50 01     	movss	0x150abff(%rip), %xmm0  # 0x1469aa3c0
14549f7c1: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
14549f7c5: f3 0f 11 85 18 03 00 00     	movss	%xmm0, 0x318(%rbp)
14549f7cd: 49 8d 85 38 05 00 00        	leaq	0x538(%r13), %rax
14549f7d4: 48 89 85 28 03 00 00        	movq	%rax, 0x328(%rbp)
14549f7db: f3 0f 59 0d 09 d6 45 00     	mulss	0x45d609(%rip), %xmm1   # 0x1458fcdec
14549f7e3: f3 0f 11 8d a0 02 00 00     	movss	%xmm1, 0x2a0(%rbp)
14549f7eb: f3 0f 10 05 e5 1e 57 00     	movss	0x571ee5(%rip), %xmm0   # 0x145a116d8
14549f7f3: f3 41 0f 59 c5              	mulss	%xmm13, %xmm0
14549f7f8: f3 0f 5f 05 a4 d0 45 00     	maxss	0x45d0a4(%rip), %xmm0   # 0x1458fc8a4
14549f800: f3 0f 11 45 60              	movss	%xmm0, 0x60(%rbp)
14549f805: f3 44 0f 59 2d 1e 6e 45 00  	mulss	0x456e1e(%rip), %xmm13  # 0x1458f662c
14549f80e: 49 8d 85 f0 04 00 00        	leaq	0x4f0(%r13), %rax
14549f815: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
14549f81c: 0f 57 ff                    	xorps	%xmm7, %xmm7
14549f81f: 48 c7 85 58 03 00 00 00 00 00 00    	movq	$0x0, 0x358(%rbp)
14549f82a: eb 2c                       	jmp	0x14549f858 <.text+0x549e858>
14549f82c: 0f 1f 40 00                 	nopl	(%rax)
14549f830: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
14549f835: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
14549f83b: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
14549f841: f3 44 0f 11 6c 24 20        	movss	%xmm13, 0x20(%rsp)
14549f848: 48 89 f1                    	movq	%rsi, %rcx
14549f84b: 4c 89 f2                    	movq	%r14, %rdx
14549f84e: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
14549f852: e8 c9 eb 01 00              	callq	0x1454be420 <.text+0x54bd420>
14549f857: 90                          	nop
14549f858: 4c 8b b5 58 03 00 00        	movq	0x358(%rbp), %r14
14549f85f: 4c 3b b5 40 03 00 00        	cmpq	0x340(%rbp), %r14
14549f866: 0f 83 e9 10 00 00           	jae	0x1454a0955 <.text+0x549f955>
14549f86c: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
14549f873: 48 8b 90 d8 00 00 00        	movq	0xd8(%rax), %rdx
14549f87a: 49 39 d6                    	cmpq	%rdx, %r14
14549f87d: 0f 83 34 b2 00 00           	jae	0x1454aaab7 <.text+0x54a9ab7>
14549f883: 49 8d 4e 01                 	leaq	0x1(%r14), %rcx
14549f887: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
14549f88e: 48 8b 80 d0 00 00 00        	movq	0xd0(%rax), %rax
14549f895: 4b 8d 1c 76                 	leaq	(%r14,%r14,2), %rbx
14549f899: 48 c1 e3 05                 	shlq	$0x5, %rbx
14549f89d: f3 0f 10 4c 18 54           	movss	0x54(%rax,%rbx), %xmm1
14549f8a3: f3 0f 10 85 90 00 00 00     	movss	0x90(%rbp), %xmm0
14549f8ab: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549f8ae: 77 a8                       	ja	0x14549f858 <.text+0x549e858>
14549f8b0: 48 01 d8                    	addq	%rbx, %rax
14549f8b3: f3 0f 58 05 55 d7 44 00     	addss	0x44d755(%rip), %xmm0   # 0x1458ed010
14549f8bb: f3 0f 11 40 54              	movss	%xmm0, 0x54(%rax)
14549f8c0: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
14549f8c7: 48 8b be d8 00 00 00        	movq	0xd8(%rsi), %rdi
14549f8ce: 49 39 fe                    	cmpq	%rdi, %r14
14549f8d1: 0f 83 23 b2 00 00           	jae	0x1454aaafa <.text+0x54a9afa>
14549f8d7: 48 8b 86 d0 00 00 00        	movq	0xd0(%rsi), %rax
14549f8de: 4c 8d 3c 18                 	leaq	(%rax,%rbx), %r15
14549f8e2: 4c 8b 6c 18 18              	movq	0x18(%rax,%rbx), %r13
14549f8e7: f3 44 0f 10 85 90 00 00 00  	movss	0x90(%rbp), %xmm8
14549f8f0: f3 0f 10 44 18 4c           	movss	0x4c(%rax,%rbx), %xmm0
14549f8f6: 0f 2e f8                    	ucomiss	%xmm0, %xmm7
14549f8f9: f3 0f 10 15 7f bb 44 00     	movss	0x44bb7f(%rip), %xmm2   # 0x1458eb480
14549f901: 73 6d                       	jae	0x14549f970 <.text+0x549e970>
14549f903: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
14549f907: f3 41 0f 5c 4f 48           	subss	0x48(%r15), %xmm1
14549f90d: f3 0f 5e c8                 	divss	%xmm0, %xmm1
14549f911: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549f914: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
14549f918: 0f 28 ca                    	movaps	%xmm2, %xmm1
14549f91b: f3 0f 5d c8                 	minss	%xmm0, %xmm1
14549f91f: f2 41 0f 10 47 30           	movsd	0x30(%r15), %xmm0
14549f925: f2 41 0f 10 57 3c           	movsd	0x3c(%r15), %xmm2
14549f92b: 0f 5c d0                    	subps	%xmm0, %xmm2
14549f92e: f3 44 0f 12 f1              	movsldup	%xmm1, %xmm14           # xmm14 = xmm1[0,0,2,2]
14549f933: 44 0f 59 f2                 	mulps	%xmm2, %xmm14
14549f937: 44 0f 58 f0                 	addps	%xmm0, %xmm14
14549f93b: f3 41 0f 10 47 38           	movss	0x38(%r15), %xmm0
14549f941: f3 41 0f 10 57 44           	movss	0x44(%r15), %xmm2
14549f947: f3 0f 5c d0                 	subss	%xmm0, %xmm2
14549f94b: f3 0f 59 d1                 	mulss	%xmm1, %xmm2
14549f94f: f3 0f 58 d0                 	addss	%xmm0, %xmm2
14549f953: 44 0f 13 b5 10 02 00 00     	movlps	%xmm14, 0x210(%rbp)
14549f95b: f3 0f 11 95 18 02 00 00     	movss	%xmm2, 0x218(%rbp)
14549f963: eb 29                       	jmp	0x14549f98e <.text+0x549e98e>
14549f965: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14549f970: 49 8b 47 3c                 	movq	0x3c(%r15), %rax
14549f974: 48 89 85 10 02 00 00        	movq	%rax, 0x210(%rbp)
14549f97b: 41 8b 47 44                 	movl	0x44(%r15), %eax
14549f97f: 89 85 18 02 00 00           	movl	%eax, 0x218(%rbp)
14549f985: f2 44 0f 10 b5 10 02 00 00  	movsd	0x210(%rbp), %xmm14
14549f98e: f3 45 0f 10 57 58           	movss	0x58(%r15), %xmm10
14549f994: f3 44 0f 58 96 f4 03 00 00  	addss	0x3f4(%rsi), %xmm10
14549f99d: 41 0f 28 c2                 	movaps	%xmm10, %xmm0
14549f9a1: e8 8b 74 2b 00              	callq	0x145756e31 <.text+0x5755e31>
14549f9a6: 44 0f 28 c8                 	movaps	%xmm0, %xmm9
14549f9aa: 41 0f 28 c2                 	movaps	%xmm10, %xmm0
14549f9ae: e8 78 74 2b 00              	callq	0x145756e2b <.text+0x5755e2b>
14549f9b3: 44 0f 14 c8                 	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
14549f9b7: 44 0f 59 0d b1 aa 50 01     	mulps	0x150aab1(%rip), %xmm9  # 0x1469aa470
14549f9bf: 45 0f 58 cc                 	addps	%xmm12, %xmm9
14549f9c3: 41 0f 28 c6                 	movaps	%xmm14, %xmm0
14549f9c7: 41 0f 5c c4                 	subps	%xmm12, %xmm0
14549f9cb: 0f 59 c0                    	mulps	%xmm0, %xmm0
14549f9ce: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14549f9d2: f3 0f 58 c8                 	addss	%xmm0, %xmm1
14549f9d6: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549f9d9: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
14549f9dd: 0f 2e 05 9c 6c 45 00        	ucomiss	0x456c9c(%rip), %xmm0   # 0x1458f6680
14549f9e4: 0f 87 46 fe ff ff           	ja	0x14549f830 <.text+0x549e830>
14549f9ea: 41 83 7d 24 00              	cmpl	$0x0, 0x24(%r13)
14549f9ef: 0f 84 81 01 00 00           	je	0x14549fb76 <.text+0x549eb76>
14549f9f5: 45 0f 5c f1                 	subps	%xmm9, %xmm14
14549f9f9: 45 0f 59 f6                 	mulps	%xmm14, %xmm14
14549f9fd: f3 41 0f 16 c6              	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
14549fa02: f3 41 0f 58 c6              	addss	%xmm14, %xmm0
14549fa07: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
14549fa0b: 0f 2e 05 02 4b 77 00        	ucomiss	0x774b02(%rip), %xmm0   # 0x145c14514
14549fa12: 76 3d                       	jbe	0x14549fa51 <.text+0x549ea51>
14549fa14: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
14549fa19: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
14549fa1f: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
14549fa25: f3 0f 10 85 18 03 00 00     	movss	0x318(%rbp), %xmm0
14549fa2d: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
14549fa33: 48 89 f1                    	movq	%rsi, %rcx
14549fa36: 4c 89 f2                    	movq	%r14, %rdx
14549fa39: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
14549fa3d: e8 de e9 01 00              	callq	0x1454be420 <.text+0x54bd420>
14549fa42: 90                          	nop
14549fa43: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
14549fa4a: 48 8b be d8 00 00 00        	movq	0xd8(%rsi), %rdi
14549fa51: 49 39 fe                    	cmpq	%rdi, %r14
14549fa54: 0f 83 2d b2 00 00           	jae	0x1454aac87 <.text+0x54a9c87>
14549fa5a: 48 8b 86 d0 00 00 00        	movq	0xd0(%rsi), %rax
14549fa61: f3 0f 10 85 90 00 00 00     	movss	0x90(%rbp), %xmm0
14549fa69: 0f 2e 44 18 50              	ucomiss	0x50(%rax,%rbx), %xmm0
14549fa6e: 0f 82 e4 fd ff ff           	jb	0x14549f858 <.text+0x549e858>
14549fa74: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
14549fa7a: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
14549fa80: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549fa87: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
14549fa8e: 4c 8d 85 10 02 00 00        	leaq	0x210(%rbp), %r8
14549fa95: f3 0f 10 1d b3 41 49 00     	movss	0x4941b3(%rip), %xmm3   # 0x145933c50
14549fa9d: e8 fe e7 04 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
14549faa2: 90                          	nop
14549faa3: 4c 8b 8d a0 00 00 00        	movq	0xa0(%rbp), %r9
14549faaa: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
14549fab1: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
14549fab8: 48 83 bd b0 00 00 00 00     	cmpq	$0x0, 0xb0(%rbp)
14549fac0: 4c 8b 85 68 03 00 00        	movq	0x368(%rbp), %r8
14549fac7: f3 0f 10 25 b1 b9 44 00     	movss	0x44b9b1(%rip), %xmm4   # 0x1458eb480
14549facf: 0f 84 59 0e 00 00           	je	0x1454a092e <.text+0x549f92e>
14549fad5: 49 8b 90 d8 00 00 00        	movq	0xd8(%r8), %rdx
14549fadc: 49 39 d6                    	cmpq	%rdx, %r14
14549fadf: 0f 83 2c b2 00 00           	jae	0x1454aad11 <.text+0x54a9d11>
14549fae5: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
14549faec: 48 8b 38                    	movq	(%rax), %rdi
14549faef: f3 41 0f 10 45 20           	movss	0x20(%r13), %xmm0
14549faf5: f3 0f 58 85 90 00 00 00     	addss	0x90(%rbp), %xmm0
14549fafd: 49 8b 80 d0 00 00 00        	movq	0xd0(%r8), %rax
14549fb04: f3 0f 11 44 18 50           	movss	%xmm0, 0x50(%rax,%rbx)
14549fb0a: 49 8b 90 d8 00 00 00        	movq	0xd8(%r8), %rdx
14549fb11: 49 39 d6                    	cmpq	%rdx, %r14
14549fb14: 0f 83 13 b2 00 00           	jae	0x1454aad2d <.text+0x54a9d2d>
14549fb1a: 49 8b 80 d0 00 00 00        	movq	0xd0(%r8), %rax
14549fb21: 48 8d 0c 18                 	leaq	(%rax,%rbx), %rcx
14549fb25: f3 41 0f 10 80 e4 08 00 00  	movss	0x8e4(%r8), %xmm0
14549fb2e: f3 0f 10 4c 18 4c           	movss	0x4c(%rax,%rbx), %xmm1
14549fb34: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
14549fb37: 0f 83 e5 00 00 00           	jae	0x14549fc22 <.text+0x549ec22>
14549fb3d: 0f 28 d0                    	movaps	%xmm0, %xmm2
14549fb40: f3 0f 5c 51 48              	subss	0x48(%rcx), %xmm2
14549fb45: f3 0f 5e d1                 	divss	%xmm1, %xmm2
14549fb49: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549fb4c: f3 0f 5f ca                 	maxss	%xmm2, %xmm1
14549fb50: 0f 28 d4                    	movaps	%xmm4, %xmm2
14549fb53: f3 0f 5d d1                 	minss	%xmm1, %xmm2
14549fb57: f2 0f 10 49 30              	movsd	0x30(%rcx), %xmm1
14549fb5c: f2 0f 10 59 3c              	movsd	0x3c(%rcx), %xmm3
14549fb61: 0f 5c d9                    	subps	%xmm1, %xmm3
14549fb64: f3 44 0f 12 ca              	movsldup	%xmm2, %xmm9            # xmm9 = xmm2[0,0,2,2]
14549fb69: 44 0f 59 cb                 	mulps	%xmm3, %xmm9
14549fb6d: 44 0f 58 c9                 	addps	%xmm1, %xmm9
14549fb71: e9 b2 00 00 00              	jmp	0x14549fc28 <.text+0x549ec28>
14549fb76: 4d 8b 7f 28                 	movq	0x28(%r15), %r15
14549fb7a: 48 8b 8e d0 04 00 00        	movq	0x4d0(%rsi), %rcx
14549fb81: 48 85 c9                    	testq	%rcx, %rcx
14549fb84: 0f 84 dd 02 00 00           	je	0x14549fe67 <.text+0x549ee67>
14549fb8a: 48 8b 86 c8 04 00 00        	movq	0x4c8(%rsi), %rax
14549fb91: 48 69 d1 60 01 00 00        	imulq	$0x160, %rcx, %rdx      # imm = 0x160
14549fb98: 31 c9                       	xorl	%ecx, %ecx
14549fb9a: f3 0f 10 0d de b8 44 00     	movss	0x44b8de(%rip), %xmm1   # 0x1458eb480
14549fba2: eb 1c                       	jmp	0x14549fbc0 <.text+0x549ebc0>
14549fba4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14549fbb0: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
14549fbb7: 48 39 ca                    	cmpq	%rcx, %rdx
14549fbba: 0f 84 a7 02 00 00           	je	0x14549fe67 <.text+0x549ee67>
14549fbc0: 4c 39 bc 08 88 00 00 00     	cmpq	%r15, 0x88(%rax,%rcx)
14549fbc8: 75 e6                       	jne	0x14549fbb0 <.text+0x549ebb0>
14549fbca: 83 7c 08 68 01              	cmpl	$0x1, 0x68(%rax,%rcx)
14549fbcf: 74 df                       	je	0x14549fbb0 <.text+0x549ebb0>
14549fbd1: f3 0f 10 84 08 28 01 00 00  	movss	0x128(%rax,%rcx), %xmm0
14549fbda: 0f 2e f8                    	ucomiss	%xmm0, %xmm7
14549fbdd: 0f 83 3b 02 00 00           	jae	0x14549fe1e <.text+0x549ee1e>
14549fbe3: f3 44 0f 5c 84 08 24 01 00 00       	subss	0x124(%rax,%rcx), %xmm8
14549fbed: f3 44 0f 5e c0              	divss	%xmm0, %xmm8
14549fbf2: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549fbf5: f3 41 0f 5f c0              	maxss	%xmm8, %xmm0
14549fbfa: f3 0f 5d c8                 	minss	%xmm0, %xmm1
14549fbfe: f2 0f 10 94 08 0c 01 00 00  	movsd	0x10c(%rax,%rcx), %xmm2
14549fc07: f2 0f 10 9c 08 18 01 00 00  	movsd	0x118(%rax,%rcx), %xmm3
14549fc10: 0f 5c da                    	subps	%xmm2, %xmm3
14549fc13: f3 0f 12 c1                 	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
14549fc17: 0f 59 c3                    	mulps	%xmm3, %xmm0
14549fc1a: 0f 58 c2                    	addps	%xmm2, %xmm0
14549fc1d: e9 05 02 00 00              	jmp	0x14549fe27 <.text+0x549ee27>
14549fc22: f2 44 0f 10 49 3c           	movsd	0x3c(%rcx), %xmm9
14549fc28: 4c 8b 74 18 18              	movq	0x18(%rax,%rbx), %r14
14549fc2d: 48 8b 54 18 20              	movq	0x20(%rax,%rbx), %rdx
14549fc32: 49 8b 80 c8 04 00 00        	movq	0x4c8(%r8), %rax
14549fc39: 4d 69 90 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r8), %r10 # imm = 0x160
14549fc44: 31 c9                       	xorl	%ecx, %ecx
14549fc46: 49 89 c0                    	movq	%rax, %r8
14549fc49: 0f 1f 80 00 00 00 00        	nopl	(%rax)
14549fc50: 49 39 ca                    	cmpq	%rcx, %r10
14549fc53: 0f 84 d5 0c 00 00           	je	0x1454a092e <.text+0x549f92e>
14549fc59: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
14549fc60: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
14549fc67: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
14549fc6e: 75 e0                       	jne	0x14549fc50 <.text+0x549ec50>
14549fc70: f3 0f 10 4c 08 c8           	movss	-0x38(%rax,%rcx), %xmm1
14549fc76: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
14549fc79: 4c 89 8d 10 03 00 00        	movq	%r9, 0x310(%rbp)
14549fc80: 73 36                       	jae	0x14549fcb8 <.text+0x549ecb8>
14549fc82: f3 0f 5c 44 08 c4           	subss	-0x3c(%rax,%rcx), %xmm0
14549fc88: f3 0f 5e c1                 	divss	%xmm1, %xmm0
14549fc8c: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549fc8f: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14549fc93: 0f 28 c4                    	movaps	%xmm4, %xmm0
14549fc96: f3 0f 5d c1                 	minss	%xmm1, %xmm0
14549fc9a: f2 0f 10 4c 08 ac           	movsd	-0x54(%rax,%rcx), %xmm1
14549fca0: f2 0f 10 54 08 b8           	movsd	-0x48(%rax,%rcx), %xmm2
14549fca6: 0f 5c d1                    	subps	%xmm1, %xmm2
14549fca9: f3 44 0f 12 d0              	movsldup	%xmm0, %xmm10           # xmm10 = xmm0[0,0,2,2]
14549fcae: 44 0f 59 d2                 	mulps	%xmm2, %xmm10
14549fcb2: 44 0f 58 d1                 	addps	%xmm1, %xmm10
14549fcb6: eb 07                       	jmp	0x14549fcbf <.text+0x549ecbf>
14549fcb8: f2 44 0f 10 54 08 b8        	movsd	-0x48(%rax,%rcx), %xmm10
14549fcbf: 45 8b 46 24                 	movl	0x24(%r14), %r8d
14549fcc3: 48 89 7d 68                 	movq	%rdi, 0x68(%rbp)
14549fcc7: 48 89 bd e0 02 00 00        	movq	%rdi, 0x2e0(%rbp)
14549fcce: c7 85 d8 02 00 00 00 00 00 00       	movl	$0x0, 0x2d8(%rbp)
14549fcd8: c7 85 b0 02 00 00 00 00 00 00       	movl	$0x0, 0x2b0(%rbp)
14549fce2: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
14549fce9: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14549fcee: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
14549fcf5: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
14549fcfa: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
14549fd03: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549fd0a: 48 89 95 80 00 00 00        	movq	%rdx, 0x80(%rbp)
14549fd11: 4c 8d 4d 68                 	leaq	0x68(%rbp), %r9
14549fd15: e8 86 b4 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
14549fd1a: 90                          	nop
14549fd1b: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
14549fd22: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
14549fd29: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
14549fd30: 75 0d                       	jne	0x14549fd3f <.text+0x549ed3f>
14549fd32: 48 8b 8d 28 03 00 00        	movq	0x328(%rbp), %rcx
14549fd39: e8 72 83 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
14549fd3e: 90                          	nop
14549fd3f: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
14549fd46: 48 89 f1                    	movq	%rsi, %rcx
14549fd49: 48 c1 e1 05                 	shlq	$0x5, %rcx
14549fd4d: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14549fd54: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14549fd5b: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14549fd60: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14549fd64: 48 ff c6                    	incq	%rsi
14549fd67: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
14549fd6e: f3 45 0f 10 76 1c           	movss	0x1c(%r14), %xmm14
14549fd74: 49 8b 85 80 08 00 00        	movq	0x880(%r13), %rax
14549fd7b: 49 8b 8d 98 08 00 00        	movq	0x898(%r13), %rcx
14549fd82: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
14549fd86: 48 c1 c2 17                 	rolq	$0x17, %rdx
14549fd8a: 48 01 c2                    	addq	%rax, %rdx
14549fd8d: 4d 8b 85 88 08 00 00        	movq	0x888(%r13), %r8
14549fd94: 4d 89 c1                    	movq	%r8, %r9
14549fd97: 49 c1 e1 11                 	shlq	$0x11, %r9
14549fd9b: 4d 8b 95 90 08 00 00        	movq	0x890(%r13), %r10
14549fda2: 49 31 c2                    	xorq	%rax, %r10
14549fda5: 4c 31 c1                    	xorq	%r8, %rcx
14549fda8: 4d 31 d0                    	xorq	%r10, %r8
14549fdab: 4d 89 85 88 08 00 00        	movq	%r8, 0x888(%r13)
14549fdb2: 48 31 c8                    	xorq	%rcx, %rax
14549fdb5: 49 89 85 80 08 00 00        	movq	%rax, 0x880(%r13)
14549fdbc: 4d 31 ca                    	xorq	%r9, %r10
14549fdbf: 4d 89 95 90 08 00 00        	movq	%r10, 0x890(%r13)
14549fdc6: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
14549fdca: 49 89 8d 98 08 00 00        	movq	%rcx, 0x898(%r13)
14549fdd1: 48 c1 ea 28                 	shrq	$0x28, %rdx
14549fdd5: f3 44 0f 2a da              	cvtsi2ss	%edx, %xmm11
14549fdda: f3 44 0f 59 1d dd b5 54 00  	mulss	0x54b5dd(%rip), %xmm11  # 0x1459eb3c0
14549fde3: 49 8b 95 d0 06 00 00        	movq	0x6d0(%r13), %rdx
14549fdea: f3 0f 10 15 8e b6 44 00     	movss	0x44b68e(%rip), %xmm2   # 0x1458eb480
14549fdf2: 0f 28 c2                    	movaps	%xmm2, %xmm0
14549fdf5: 48 85 d2                    	testq	%rdx, %rdx
14549fdf8: 0f 84 b4 05 00 00           	je	0x1454a03b2 <.text+0x549f3b2>
14549fdfe: 49 8b 85 c8 06 00 00        	movq	0x6c8(%r13), %rax
14549fe05: 48 83 fa 01                 	cmpq	$0x1, %rdx
14549fe09: 0f 85 3d 05 00 00           	jne	0x1454a034c <.text+0x549f34c>
14549fe0f: 31 c9                       	xorl	%ecx, %ecx
14549fe11: f3 0f 10 05 63 68 45 00     	movss	0x456863(%rip), %xmm0   # 0x1458f667c
14549fe19: e9 7c 05 00 00              	jmp	0x1454a039a <.text+0x549f39a>
14549fe1e: f2 0f 10 84 08 18 01 00 00  	movsd	0x118(%rax,%rcx), %xmm0
14549fe27: 41 0f 5c c4                 	subps	%xmm12, %xmm0
14549fe2b: 0f 59 c0                    	mulps	%xmm0, %xmm0
14549fe2e: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14549fe32: f3 0f 58 c8                 	addss	%xmm0, %xmm1
14549fe36: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549fe39: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
14549fe3d: f3 0f 10 0d 9b 79 52 00     	movss	0x52799b(%rip), %xmm1   # 0x1459c77e0
14549fe45: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14549fe48: 76 1d                       	jbe	0x14549fe67 <.text+0x549ee67>
14549fe4a: 48 83 7c 08 18 ff           	cmpq	$-0x1, 0x18(%rax,%rcx)
14549fe50: 0f 95 c2                    	setne	%dl
14549fe53: 00 d2                       	addb	%dl, %dl
14549fe55: 0a 94 08 58 01 00 00        	orb	0x158(%rax,%rcx), %dl
14549fe5c: 88 95 38 03 00 00           	movb	%dl, 0x338(%rbp)
14549fe62: 41 b4 01                    	movb	$0x1, %r12b
14549fe65: eb 03                       	jmp	0x14549fe6a <.text+0x549ee6a>
14549fe67: 45 31 e4                    	xorl	%r12d, %r12d
14549fe6a: 8b 85 18 02 00 00           	movl	0x218(%rbp), %eax
14549fe70: 89 85 e0 02 00 00           	movl	%eax, 0x2e0(%rbp)
14549fe76: 48 8b 85 10 02 00 00        	movq	0x210(%rbp), %rax
14549fe7d: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
14549fe84: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
14549fe8a: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
14549fe90: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14549fe97: 48 89 f2                    	movq	%rsi, %rdx
14549fe9a: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
14549fea1: f3 0f 10 1d 77 e6 49 00     	movss	0x49e677(%rip), %xmm3   # 0x14593e520
14549fea9: e8 f2 e3 04 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
14549feae: 90                          	nop
14549feaf: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
14549feb6: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
14549febd: 48 85 c0                    	testq	%rax, %rax
14549fec0: 0f 84 07 03 00 00           	je	0x1454a01cd <.text+0x549f1cd>
14549fec6: 48 8d 04 c1                 	leaq	(%rcx,%rax,8), %rax
14549feca: 4c 8b 85 68 03 00 00        	movq	0x368(%rbp), %r8
14549fed1: f3 41 0f 10 80 e4 08 00 00  	movss	0x8e4(%r8), %xmm0
14549feda: 49 8b 90 c8 04 00 00        	movq	0x4c8(%r8), %rdx
14549fee1: 4d 69 80 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r8), %r8 # imm = 0x160
14549feec: 49 89 c9                    	movq	%rcx, %r9
14549feef: f3 44 0f 10 05 88 b5 44 00  	movss	0x44b588(%rip), %xmm8   # 0x1458eb480
14549fef8: f3 0f 10 2d 50 3d 49 00     	movss	0x493d50(%rip), %xmm5   # 0x145933c50
14549ff00: eb 39                       	jmp	0x14549ff3b <.text+0x549ef3b>
14549ff02: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14549ff10: f2 42 0f 10 4c 12 b8        	movsd	-0x48(%rdx,%r10), %xmm1
14549ff17: 41 0f 5c cc                 	subps	%xmm12, %xmm1
14549ff1b: 0f 59 c9                    	mulps	%xmm1, %xmm1
14549ff1e: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14549ff22: f3 0f 58 d1                 	addss	%xmm1, %xmm2
14549ff26: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549ff29: f3 0f 51 ca                 	sqrtss	%xmm2, %xmm1
14549ff2d: 0f 2e e9                    	ucomiss	%xmm1, %xmm5
14549ff30: 0f 87 bb 02 00 00           	ja	0x1454a01f1 <.text+0x549f1f1>
14549ff36: 49 39 c1                    	cmpq	%rax, %r9
14549ff39: 74 7a                       	je	0x14549ffb5 <.text+0x549efb5>
14549ff3b: 49 8b 39                    	movq	(%r9), %rdi
14549ff3e: 49 83 c1 08                 	addq	$0x8, %r9
14549ff42: 45 31 d2                    	xorl	%r10d, %r10d
14549ff45: 49 89 d3                    	movq	%rdx, %r11
14549ff48: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14549ff50: 4d 39 d0                    	cmpq	%r10, %r8
14549ff53: 74 e1                       	je	0x14549ff36 <.text+0x549ef36>
14549ff55: 49 81 c2 60 01 00 00        	addq	$0x160, %r10            # imm = 0x160
14549ff5c: 49 39 bb 88 00 00 00        	cmpq	%rdi, 0x88(%r11)
14549ff63: 4d 8d 9b 60 01 00 00        	leaq	0x160(%r11), %r11
14549ff6a: 75 e4                       	jne	0x14549ff50 <.text+0x549ef50>
14549ff6c: f3 42 0f 10 4c 12 c8        	movss	-0x38(%rdx,%r10), %xmm1
14549ff73: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
14549ff76: 73 98                       	jae	0x14549ff10 <.text+0x549ef10>
14549ff78: 0f 28 d0                    	movaps	%xmm0, %xmm2
14549ff7b: f3 42 0f 5c 54 12 c4        	subss	-0x3c(%rdx,%r10), %xmm2
14549ff82: f3 0f 5e d1                 	divss	%xmm1, %xmm2
14549ff86: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549ff89: f3 0f 5f ca                 	maxss	%xmm2, %xmm1
14549ff8d: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
14549ff91: f3 0f 5d d1                 	minss	%xmm1, %xmm2
14549ff95: f2 42 0f 10 5c 12 ac        	movsd	-0x54(%rdx,%r10), %xmm3
14549ff9c: f2 42 0f 10 64 12 b8        	movsd	-0x48(%rdx,%r10), %xmm4
14549ffa3: 0f 5c e3                    	subps	%xmm3, %xmm4
14549ffa6: f3 0f 12 ca                 	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
14549ffaa: 0f 59 cc                    	mulps	%xmm4, %xmm1
14549ffad: 0f 58 cb                    	addps	%xmm3, %xmm1
14549ffb0: e9 62 ff ff ff              	jmp	0x14549ff17 <.text+0x549ef17>
14549ffb5: 4c 89 ee                    	movq	%r13, %rsi
14549ffb8: 45 31 ed                    	xorl	%r13d, %r13d
14549ffbb: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
14549ffc2: 48 85 d2                    	testq	%rdx, %rdx
14549ffc5: 74 0f                       	je	0x14549ffd6 <.text+0x549efd6>
14549ffc7: 48 c1 e2 03                 	shlq	$0x3, %rdx
14549ffcb: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14549ffd1: e8 fa 21 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
14549ffd6: b0 01                       	movb	$0x1, %al
14549ffd8: 45 84 ed                    	testb	%r13b, %r13b
14549ffdb: 74 67                       	je	0x1454a0044 <.text+0x549f044>
14549ffdd: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
14549ffe4: 48 8b 8a c8 04 00 00        	movq	0x4c8(%rdx), %rcx
14549ffeb: 4c 69 82 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdx), %r8 # imm = 0x160
14549fff6: 31 d2                       	xorl	%edx, %edx
14549fff8: 49 89 c9                    	movq	%rcx, %r9
14549fffb: 44 0f b6 95 38 03 00 00     	movzbl	0x338(%rbp), %r10d
1454a0003: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a0010: 49 39 d0                    	cmpq	%rdx, %r8
1454a0013: 74 2f                       	je	0x1454a0044 <.text+0x549f044>
1454a0015: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
1454a001c: 49 39 b9 88 00 00 00        	cmpq	%rdi, 0x88(%r9)
1454a0023: 4d 8d 89 60 01 00 00        	leaq	0x160(%r9), %r9
1454a002a: 75 e4                       	jne	0x1454a0010 <.text+0x549f010>
1454a002c: 48 83 bc 11 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rcx,%rdx)
1454a0035: 0f 95 c0                    	setne	%al
1454a0038: 00 c0                       	addb	%al, %al
1454a003a: 0a 44 11 f8                 	orb	-0x8(%rcx,%rdx), %al
1454a003e: 41 38 c2                    	cmpb	%al, %r10b
1454a0041: 0f 93 c0                    	setae	%al
1454a0044: 41 20 c4                    	andb	%al, %r12b
1454a0047: 45 08 e5                    	orb	%r12b, %r13b
1454a004a: 45 84 e4                    	testb	%r12b, %r12b
1454a004d: 49 0f 45 ff                 	cmovneq	%r15, %rdi
1454a0051: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0058: 48 8b 90 d8 00 00 00        	movq	0xd8(%rax), %rdx
1454a005f: 41 80 fd 01                 	cmpb	$0x1, %r13b
1454a0063: 0f 85 e9 00 00 00           	jne	0x1454a0152 <.text+0x549f152>
1454a0069: 49 39 d6                    	cmpq	%rdx, %r14
1454a006c: 0f 83 d7 ac 00 00           	jae	0x1454aad49 <.text+0x54a9d49>
1454a0072: 4c 8b a5 68 03 00 00        	movq	0x368(%rbp), %r12
1454a0079: 49 8b 84 24 d0 00 00 00     	movq	0xd0(%r12), %rax
1454a0081: 48 89 7c 18 28              	movq	%rdi, 0x28(%rax,%rbx)
1454a0086: 49 8b 84 24 c8 04 00 00     	movq	0x4c8(%r12), %rax
1454a008e: 49 69 94 24 d0 04 00 00 60 01 00 00 	imulq	$0x160, 0x4d0(%r12), %rdx # imm = 0x160
1454a009a: 31 c9                       	xorl	%ecx, %ecx
1454a009c: 49 89 c0                    	movq	%rax, %r8
1454a009f: 90                          	nop
1454a00a0: 48 39 ca                    	cmpq	%rcx, %rdx
1454a00a3: 0f 84 af f7 ff ff           	je	0x14549f858 <.text+0x549e858>
1454a00a9: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a00b0: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
1454a00b7: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a00be: 75 e0                       	jne	0x1454a00a0 <.text+0x549f0a0>
1454a00c0: f3 0f 10 85 90 00 00 00     	movss	0x90(%rbp), %xmm0
1454a00c8: f3 0f 10 4c 08 c8           	movss	-0x38(%rax,%rcx), %xmm1
1454a00ce: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
1454a00d1: 0f 83 35 01 00 00           	jae	0x1454a020c <.text+0x549f20c>
1454a00d7: f3 0f 12 d0                 	movsldup	%xmm0, %xmm2            # xmm2 = xmm0[0,0,2,2]
1454a00db: 0f 58 15 3e 43 5b 00        	addps	0x5b433e(%rip), %xmm2   # 0x145a54420
1454a00e2: f3 0f 10 5c 08 c4           	movss	-0x3c(%rax,%rcx), %xmm3
1454a00e8: f3 0f 12 db                 	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
1454a00ec: 0f 5c d3                    	subps	%xmm3, %xmm2
1454a00ef: f3 0f 12 c9                 	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454a00f3: 0f 5e d1                    	divps	%xmm1, %xmm2
1454a00f6: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a00f9: 0f 5f ca                    	maxps	%xmm2, %xmm1
1454a00fc: 0f 28 15 3d b4 44 00        	movaps	0x44b43d(%rip), %xmm2   # 0x1458eb540
1454a0103: 0f c2 d1 01                 	cmpltps	%xmm1, %xmm2
1454a0107: 0f 14 d2                    	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454a010a: 66 0f 50 d2                 	movmskpd	%xmm2, %edx
1454a010e: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a0112: f6 c2 02                    	testb	$0x2, %dl
1454a0115: 75 04                       	jne	0x1454a011b <.text+0x549f11b>
1454a0117: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454a011b: 41 0f 28 d8                 	movaps	%xmm8, %xmm3
1454a011f: f6 c2 01                    	testb	$0x1, %dl
1454a0122: 75 03                       	jne	0x1454a0127 <.text+0x549f127>
1454a0124: 0f 28 d9                    	movaps	%xmm1, %xmm3
1454a0127: f2 0f 10 64 08 ac           	movsd	-0x54(%rax,%rcx), %xmm4
1454a012d: f2 0f 10 6c 08 b8           	movsd	-0x48(%rax,%rcx), %xmm5
1454a0133: 0f 5c ec                    	subps	%xmm4, %xmm5
1454a0136: f3 0f 12 ca                 	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
1454a013a: 0f 59 cd                    	mulps	%xmm5, %xmm1
1454a013d: 0f 58 cc                    	addps	%xmm4, %xmm1
1454a0140: f3 44 0f 12 cb              	movsldup	%xmm3, %xmm9            # xmm9 = xmm3[0,0,2,2]
1454a0145: 44 0f 59 cd                 	mulps	%xmm5, %xmm9
1454a0149: 44 0f 58 cc                 	addps	%xmm4, %xmm9
1454a014d: e9 c5 00 00 00              	jmp	0x1454a0217 <.text+0x549f217>
1454a0152: 49 39 d6                    	cmpq	%rdx, %r14
1454a0155: 0f 83 0f ac 00 00           	jae	0x1454aad6a <.text+0x54a9d6a>
1454a015b: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0162: 48 8b 80 d0 00 00 00        	movq	0xd0(%rax), %rax
1454a0169: 48 c7 44 18 28 00 00 00 00  	movq	$0x0, 0x28(%rax,%rbx)
1454a0172: 45 0f 5c f1                 	subps	%xmm9, %xmm14
1454a0176: 45 0f 59 f6                 	mulps	%xmm14, %xmm14
1454a017a: f3 41 0f 16 c6              	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
1454a017f: f3 41 0f 58 c6              	addss	%xmm14, %xmm0
1454a0184: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
1454a0188: 0f 2e 05 69 b3 44 00        	ucomiss	0x44b369(%rip), %xmm0   # 0x1458eb4f8
1454a018f: 0f 86 c3 f6 ff ff           	jbe	0x14549f858 <.text+0x549e858>
1454a0195: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454a019a: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454a01a0: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454a01a6: f3 0f 10 85 a0 02 00 00     	movss	0x2a0(%rbp), %xmm0
1454a01ae: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a01b4: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a01bb: 4c 89 f2                    	movq	%r14, %rdx
1454a01be: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a01c2: e8 59 e2 01 00              	callq	0x1454be420 <.text+0x54bd420>
1454a01c7: 90                          	nop
1454a01c8: e9 8b f6 ff ff              	jmp	0x14549f858 <.text+0x549e858>
1454a01cd: 4c 89 ee                    	movq	%r13, %rsi
1454a01d0: 45 31 ed                    	xorl	%r13d, %r13d
1454a01d3: f3 44 0f 10 05 a4 b2 44 00  	movss	0x44b2a4(%rip), %xmm8   # 0x1458eb480
1454a01dc: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a01e3: 48 85 d2                    	testq	%rdx, %rdx
1454a01e6: 0f 85 db fd ff ff           	jne	0x14549ffc7 <.text+0x549efc7>
1454a01ec: e9 e5 fd ff ff              	jmp	0x14549ffd6 <.text+0x549efd6>
1454a01f1: 4c 89 ee                    	movq	%r13, %rsi
1454a01f4: 41 b5 01                    	movb	$0x1, %r13b
1454a01f7: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a01fe: 48 85 d2                    	testq	%rdx, %rdx
1454a0201: 0f 85 c0 fd ff ff           	jne	0x14549ffc7 <.text+0x549efc7>
1454a0207: e9 ca fd ff ff              	jmp	0x14549ffd6 <.text+0x549efd6>
1454a020c: f2 44 0f 10 4c 08 b8        	movsd	-0x48(%rax,%rcx), %xmm9
1454a0213: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
1454a0217: 41 0f 28 d6                 	movaps	%xmm14, %xmm2
1454a021b: 0f 5c d1                    	subps	%xmm1, %xmm2
1454a021e: 0f 59 d2                    	mulps	%xmm2, %xmm2
1454a0221: f3 0f 16 ca                 	movshdup	%xmm2, %xmm1            # xmm1 = xmm2[1,1,3,3]
1454a0225: f3 0f 58 ca                 	addss	%xmm2, %xmm1
1454a0229: f3 0f 51 c9                 	sqrtss	%xmm1, %xmm1
1454a022d: f3 0f 10 15 df 42 77 00     	movss	0x7742df(%rip), %xmm2   # 0x145c14514
1454a0235: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454a0238: 0f 82 5a 05 00 00           	jb	0x1454a0798 <.text+0x549f798>
1454a023e: 49 8b 94 24 d8 00 00 00     	movq	0xd8(%r12), %rdx
1454a0246: 49 39 d6                    	cmpq	%rdx, %r14
1454a0249: 0f 83 38 ac 00 00           	jae	0x1454aae87 <.text+0x54a9e87>
1454a024f: 49 8b 84 24 d0 00 00 00     	movq	0xd0(%r12), %rax
1454a0257: 0f 2e 44 18 50              	ucomiss	0x50(%rax,%rbx), %xmm0
1454a025c: 0f 82 36 05 00 00           	jb	0x1454a0798 <.text+0x549f798>
1454a0262: f3 0f 58 46 20              	addss	0x20(%rsi), %xmm0
1454a0267: 48 01 d8                    	addq	%rbx, %rax
1454a026a: f3 0f 11 40 50              	movss	%xmm0, 0x50(%rax)
1454a026f: 49 8b 94 24 d8 00 00 00     	movq	0xd8(%r12), %rdx
1454a0277: 49 39 d6                    	cmpq	%rdx, %r14
1454a027a: 0f 83 95 ac 00 00           	jae	0x1454aaf15 <.text+0x54a9f15>
1454a0280: 49 8b 84 24 d0 00 00 00     	movq	0xd0(%r12), %rax
1454a0288: 4c 8b 7c 18 18              	movq	0x18(%rax,%rbx), %r15
1454a028d: 48 8b 54 18 20              	movq	0x20(%rax,%rbx), %rdx
1454a0292: f3 45 0f 10 57 1c           	movss	0x1c(%r15), %xmm10
1454a0298: 49 8b 84 24 80 08 00 00     	movq	0x880(%r12), %rax
1454a02a0: 49 8b 8c 24 98 08 00 00     	movq	0x898(%r12), %rcx
1454a02a8: 4c 8d 04 01                 	leaq	(%rcx,%rax), %r8
1454a02ac: 49 c1 c0 17                 	rolq	$0x17, %r8
1454a02b0: 49 01 c0                    	addq	%rax, %r8
1454a02b3: 4d 8b 8c 24 88 08 00 00     	movq	0x888(%r12), %r9
1454a02bb: 4d 89 ca                    	movq	%r9, %r10
1454a02be: 49 c1 e2 11                 	shlq	$0x11, %r10
1454a02c2: 4d 8b 9c 24 90 08 00 00     	movq	0x890(%r12), %r11
1454a02ca: 49 31 c3                    	xorq	%rax, %r11
1454a02cd: 4c 31 c9                    	xorq	%r9, %rcx
1454a02d0: 4d 31 d9                    	xorq	%r11, %r9
1454a02d3: 4d 89 8c 24 88 08 00 00     	movq	%r9, 0x888(%r12)
1454a02db: 48 31 c8                    	xorq	%rcx, %rax
1454a02de: 49 89 84 24 80 08 00 00     	movq	%rax, 0x880(%r12)
1454a02e6: 4d 31 d3                    	xorq	%r10, %r11
1454a02e9: 4d 89 9c 24 90 08 00 00     	movq	%r11, 0x890(%r12)
1454a02f1: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454a02f5: 49 89 8c 24 98 08 00 00     	movq	%rcx, 0x898(%r12)
1454a02fd: 49 c1 e8 28                 	shrq	$0x28, %r8
1454a0301: f3 45 0f 2a c0              	cvtsi2ss	%r8d, %xmm8
1454a0306: f3 44 0f 59 05 b1 b0 54 00  	mulss	0x54b0b1(%rip), %xmm8   # 0x1459eb3c0
1454a030f: 4d 8b 84 24 d0 06 00 00     	movq	0x6d0(%r12), %r8
1454a0317: f3 0f 10 15 61 b1 44 00     	movss	0x44b161(%rip), %xmm2   # 0x1458eb480
1454a031f: 0f 28 c2                    	movaps	%xmm2, %xmm0
1454a0322: 4d 85 c0                    	testq	%r8, %r8
1454a0325: 0f 84 28 03 00 00           	je	0x1454a0653 <.text+0x549f653>
1454a032b: 49 8b 84 24 c8 06 00 00     	movq	0x6c8(%r12), %rax
1454a0333: 49 83 f8 01                 	cmpq	$0x1, %r8
1454a0337: 0f 85 a2 02 00 00           	jne	0x1454a05df <.text+0x549f5df>
1454a033d: 31 c9                       	xorl	%ecx, %ecx
1454a033f: f3 0f 10 05 35 63 45 00     	movss	0x456335(%rip), %xmm0   # 0x1458f667c
1454a0347: e9 ef 02 00 00              	jmp	0x1454a063b <.text+0x549f63b>
1454a034c: 49 89 d0                    	movq	%rdx, %r8
1454a034f: 49 83 e0 fe                 	andq	$-0x2, %r8
1454a0353: 31 c9                       	xorl	%ecx, %ecx
1454a0355: f3 0f 10 05 1f 63 45 00     	movss	0x45631f(%rip), %xmm0   # 0x1458f667c
1454a035d: eb 0a                       	jmp	0x1454a0369 <.text+0x549f369>
1454a035f: 90                          	nop
1454a0360: 48 83 c1 02                 	addq	$0x2, %rcx
1454a0364: 49 39 c8                    	cmpq	%rcx, %r8
1454a0367: 74 2c                       	je	0x1454a0395 <.text+0x549f395>
1454a0369: 80 3c c8 11                 	cmpb	$0x11, (%rax,%rcx,8)
1454a036d: 74 11                       	je	0x1454a0380 <.text+0x549f380>
1454a036f: 80 7c c8 08 11              	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454a0374: 75 ea                       	jne	0x1454a0360 <.text+0x549f360>
1454a0376: eb 15                       	jmp	0x1454a038d <.text+0x549f38d>
1454a0378: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a0380: f3 0f 58 44 c8 04           	addss	0x4(%rax,%rcx,8), %xmm0
1454a0386: 80 7c c8 08 11              	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454a038b: 75 d3                       	jne	0x1454a0360 <.text+0x549f360>
1454a038d: f3 0f 58 44 c8 0c           	addss	0xc(%rax,%rcx,8), %xmm0
1454a0393: eb cb                       	jmp	0x1454a0360 <.text+0x549f360>
1454a0395: f6 c2 01                    	testb	$0x1, %dl
1454a0398: 74 0c                       	je	0x1454a03a6 <.text+0x549f3a6>
1454a039a: 80 3c c8 11                 	cmpb	$0x11, (%rax,%rcx,8)
1454a039e: 75 06                       	jne	0x1454a03a6 <.text+0x549f3a6>
1454a03a0: f3 0f 58 44 c8 04           	addss	0x4(%rax,%rcx,8), %xmm0
1454a03a6: f3 0f 10 15 d2 b0 44 00     	movss	0x44b0d2(%rip), %xmm2   # 0x1458eb480
1454a03ae: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1454a03b2: 41 8b 85 f8 03 00 00        	movl	0x3f8(%r13), %eax
1454a03b9: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a03bc: f3 48 0f 2a c8              	cvtsi2ss	%rax, %xmm1
1454a03c1: f3 45 0f 10 bd 64 04 00 00  	movss	0x464(%r13), %xmm15
1454a03ca: f3 0f 58 0d 2a b1 44 00     	addss	0x44b12a(%rip), %xmm1   # 0x1458eb4fc
1454a03d2: f3 0f 59 0d 46 b1 44 00     	mulss	0x44b146(%rip), %xmm1   # 0x1458eb520
1454a03da: f3 0f 58 ca                 	addss	%xmm2, %xmm1
1454a03de: f3 44 0f 59 f1              	mulss	%xmm1, %xmm14
1454a03e3: f3 45 0f 59 b5 5c 04 00 00  	mulss	0x45c(%r13), %xmm14
1454a03ec: f3 44 0f 59 f0              	mulss	%xmm0, %xmm14
1454a03f1: f3 45 0f 10 85 68 04 00 00  	movss	0x468(%r13), %xmm8
1454a03fa: f3 45 0f 59 c6              	mulss	%xmm14, %xmm8
1454a03ff: 45 8b 7e 24                 	movl	0x24(%r14), %r15d
1454a0403: 41 81 ff 15 0e 00 00        	cmpl	$0xe15, %r15d           # imm = 0xE15
1454a040a: 7e 4e                       	jle	0x1454a045a <.text+0x549f45a>
1454a040c: 41 81 ff 04 1b 00 00        	cmpl	$0x1b04, %r15d          # imm = 0x1B04
1454a0413: 0f 8e 87 00 00 00           	jle	0x1454a04a0 <.text+0x549f4a0>
1454a0419: 41 81 ff 65 2c 00 00        	cmpl	$0x2c65, %r15d          # imm = 0x2C65
1454a0420: 0f 8f fd 00 00 00           	jg	0x1454a0523 <.text+0x549f523>
1454a0426: 41 81 ff 05 1b 00 00        	cmpl	$0x1b05, %r15d          # imm = 0x1B05
1454a042d: 0f 84 92 01 00 00           	je	0x1454a05c5 <.text+0x549f5c5>
1454a0433: 41 81 ff 65 1c 00 00        	cmpl	$0x1c65, %r15d          # imm = 0x1C65
1454a043a: 0f 84 d6 00 00 00           	je	0x1454a0516 <.text+0x549f516>
1454a0440: f3 0f 10 05 38 b0 44 00     	movss	0x44b038(%rip), %xmm0   # 0x1458eb480
1454a0448: 41 81 ff c5 27 00 00        	cmpl	$0x27c5, %r15d          # imm = 0x27C5
1454a044f: 0f 84 45 01 00 00           	je	0x1454a059a <.text+0x549f59a>
1454a0455: e9 d6 03 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a045a: 41 81 ff e5 05 00 00        	cmpl	$0x5e5, %r15d           # imm = 0x5E5
1454a0461: 7f 76                       	jg	0x1454a04d9 <.text+0x549f4d9>
1454a0463: 41 81 ff 84 00 00 00        	cmpl	$0x84, %r15d
1454a046a: 0f 8e 12 01 00 00           	jle	0x1454a0582 <.text+0x549f582>
1454a0470: 41 81 ff 85 00 00 00        	cmpl	$0x85, %r15d
1454a0477: 0f 84 d5 00 00 00           	je	0x1454a0552 <.text+0x549f552>
1454a047d: 41 81 ff 93 01 00 00        	cmpl	$0x193, %r15d           # imm = 0x193
1454a0484: 0f 84 8c 00 00 00           	je	0x1454a0516 <.text+0x549f516>
1454a048a: f3 0f 10 05 ee af 44 00     	movss	0x44afee(%rip), %xmm0   # 0x1458eb480
1454a0492: 41 81 ff ae 02 00 00        	cmpl	$0x2ae, %r15d           # imm = 0x2AE
1454a0499: 74 7b                       	je	0x1454a0516 <.text+0x549f516>
1454a049b: e9 90 03 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a04a0: 41 81 ff 37 14 00 00        	cmpl	$0x1437, %r15d          # imm = 0x1437
1454a04a7: 0f 8e b2 00 00 00           	jle	0x1454a055f <.text+0x549f55f>
1454a04ad: 41 81 ff 38 14 00 00        	cmpl	$0x1438, %r15d          # imm = 0x1438
1454a04b4: 74 60                       	je	0x1454a0516 <.text+0x549f516>
1454a04b6: 41 81 ff d1 18 00 00        	cmpl	$0x18d1, %r15d          # imm = 0x18D1
1454a04bd: 0f 84 8f 00 00 00           	je	0x1454a0552 <.text+0x549f552>
1454a04c3: f3 0f 10 05 b5 af 44 00     	movss	0x44afb5(%rip), %xmm0   # 0x1458eb480
1454a04cb: 41 81 ff 85 1a 00 00        	cmpl	$0x1a85, %r15d          # imm = 0x1A85
1454a04d2: 74 7e                       	je	0x1454a0552 <.text+0x549f552>
1454a04d4: e9 57 03 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a04d9: 41 81 ff 52 0a 00 00        	cmpl	$0xa52, %r15d           # imm = 0xA52
1454a04e0: 0f 8e c1 00 00 00           	jle	0x1454a05a7 <.text+0x549f5a7>
1454a04e6: 41 81 ff 53 0a 00 00        	cmpl	$0xa53, %r15d           # imm = 0xA53
1454a04ed: 0f 84 df 00 00 00           	je	0x1454a05d2 <.text+0x549f5d2>
1454a04f3: 41 81 ff fc 0a 00 00        	cmpl	$0xafc, %r15d           # imm = 0xAFC
1454a04fa: 74 1a                       	je	0x1454a0516 <.text+0x549f516>
1454a04fc: f3 0f 10 05 7c af 44 00     	movss	0x44af7c(%rip), %xmm0   # 0x1458eb480
1454a0504: 41 81 ff e4 0b 00 00        	cmpl	$0xbe4, %r15d           # imm = 0xBE4
1454a050b: 0f 84 b4 00 00 00           	je	0x1454a05c5 <.text+0x549f5c5>
1454a0511: e9 1a 03 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a0516: f3 0f 10 05 82 8a 45 00     	movss	0x458a82(%rip), %xmm0   # 0x1458f8fa0
1454a051e: e9 0d 03 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a0523: 41 81 ff d3 5e 00 00        	cmpl	$0x5ed3, %r15d          # imm = 0x5ED3
1454a052a: 0f 84 ee 02 00 00           	je	0x1454a081e <.text+0x549f81e>
1454a0530: 41 81 ff ea 4b 00 00        	cmpl	$0x4bea, %r15d          # imm = 0x4BEA
1454a0537: 0f 84 88 00 00 00           	je	0x1454a05c5 <.text+0x549f5c5>
1454a053d: f3 0f 10 05 3b af 44 00     	movss	0x44af3b(%rip), %xmm0   # 0x1458eb480
1454a0545: 41 81 ff 66 2c 00 00        	cmpl	$0x2c66, %r15d          # imm = 0x2C66
1454a054c: 0f 85 de 02 00 00           	jne	0x1454a0830 <.text+0x549f830>
1454a0552: f3 0f 10 05 3a dd 49 00     	movss	0x49dd3a(%rip), %xmm0   # 0x14593e294
1454a055a: e9 d1 02 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a055f: 41 81 ff 16 0e 00 00        	cmpl	$0xe16, %r15d           # imm = 0xE16
1454a0566: 0f 84 bc 02 00 00           	je	0x1454a0828 <.text+0x549f828>
1454a056c: f3 0f 10 05 0c af 44 00     	movss	0x44af0c(%rip), %xmm0   # 0x1458eb480
1454a0574: 41 81 ff fc 13 00 00        	cmpl	$0x13fc, %r15d          # imm = 0x13FC
1454a057b: 74 48                       	je	0x1454a05c5 <.text+0x549f5c5>
1454a057d: e9 ae 02 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a0582: 41 83 ff 4b                 	cmpl	$0x4b, %r15d
1454a0586: 74 3d                       	je	0x1454a05c5 <.text+0x549f5c5>
1454a0588: f3 0f 10 05 f0 ae 44 00     	movss	0x44aef0(%rip), %xmm0   # 0x1458eb480
1454a0590: 41 83 ff 74                 	cmpl	$0x74, %r15d
1454a0594: 0f 85 96 02 00 00           	jne	0x1454a0830 <.text+0x549f830>
1454a059a: f3 0f 10 05 ae 36 49 00     	movss	0x4936ae(%rip), %xmm0   # 0x145933c50
1454a05a2: e9 89 02 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a05a7: 41 81 ff e6 05 00 00        	cmpl	$0x5e6, %r15d           # imm = 0x5E6
1454a05ae: 74 22                       	je	0x1454a05d2 <.text+0x549f5d2>
1454a05b0: f3 0f 10 05 c8 ae 44 00     	movss	0x44aec8(%rip), %xmm0   # 0x1458eb480
1454a05b8: 41 81 ff ba 07 00 00        	cmpl	$0x7ba, %r15d           # imm = 0x7BA
1454a05bf: 0f 85 6b 02 00 00           	jne	0x1454a0830 <.text+0x549f830>
1454a05c5: f3 0f 10 05 b3 60 45 00     	movss	0x4560b3(%rip), %xmm0   # 0x1458f6680
1454a05cd: e9 5e 02 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a05d2: f3 0f 10 05 26 60 45 00     	movss	0x456026(%rip), %xmm0   # 0x1458f6600
1454a05da: e9 51 02 00 00              	jmp	0x1454a0830 <.text+0x549f830>
1454a05df: 4d 89 c1                    	movq	%r8, %r9
1454a05e2: 49 83 e1 fe                 	andq	$-0x2, %r9
1454a05e6: 31 c9                       	xorl	%ecx, %ecx
1454a05e8: f3 0f 10 05 8c 60 45 00     	movss	0x45608c(%rip), %xmm0   # 0x1458f667c
1454a05f0: eb 17                       	jmp	0x1454a0609 <.text+0x549f609>
1454a05f2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a0600: 48 83 c1 02                 	addq	$0x2, %rcx
1454a0604: 49 39 c9                    	cmpq	%rcx, %r9
1454a0607: 74 2c                       	je	0x1454a0635 <.text+0x549f635>
1454a0609: 80 3c c8 11                 	cmpb	$0x11, (%rax,%rcx,8)
1454a060d: 74 11                       	je	0x1454a0620 <.text+0x549f620>
1454a060f: 80 7c c8 08 11              	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454a0614: 75 ea                       	jne	0x1454a0600 <.text+0x549f600>
1454a0616: eb 15                       	jmp	0x1454a062d <.text+0x549f62d>
1454a0618: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a0620: f3 0f 58 44 c8 04           	addss	0x4(%rax,%rcx,8), %xmm0
1454a0626: 80 7c c8 08 11              	cmpb	$0x11, 0x8(%rax,%rcx,8)
1454a062b: 75 d3                       	jne	0x1454a0600 <.text+0x549f600>
1454a062d: f3 0f 58 44 c8 0c           	addss	0xc(%rax,%rcx,8), %xmm0
1454a0633: eb cb                       	jmp	0x1454a0600 <.text+0x549f600>
1454a0635: 41 f6 c0 01                 	testb	$0x1, %r8b
1454a0639: 74 0c                       	je	0x1454a0647 <.text+0x549f647>
1454a063b: 80 3c c8 11                 	cmpb	$0x11, (%rax,%rcx,8)
1454a063f: 75 06                       	jne	0x1454a0647 <.text+0x549f647>
1454a0641: f3 0f 58 44 c8 04           	addss	0x4(%rax,%rcx,8), %xmm0
1454a0647: f3 0f 10 15 31 ae 44 00     	movss	0x44ae31(%rip), %xmm2   # 0x1458eb480
1454a064f: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1454a0653: f3 45 0f 10 9c 24 64 04 00 00       	movss	0x464(%r12), %xmm11
1454a065d: 45 0f 2e d8                 	ucomiss	%xmm8, %xmm11
1454a0661: 41 8b 84 24 f8 03 00 00     	movl	0x3f8(%r12), %eax
1454a0669: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a066c: f3 48 0f 2a c8              	cvtsi2ss	%rax, %xmm1
1454a0671: f3 0f 58 0d 83 ae 44 00     	addss	0x44ae83(%rip), %xmm1   # 0x1458eb4fc
1454a0679: f3 0f 59 0d 9f ae 44 00     	mulss	0x44ae9f(%rip), %xmm1   # 0x1458eb520
1454a0681: f3 0f 58 ca                 	addss	%xmm2, %xmm1
1454a0685: f3 44 0f 59 d1              	mulss	%xmm1, %xmm10
1454a068a: f3 45 0f 59 94 24 5c 04 00 00       	mulss	0x45c(%r12), %xmm10
1454a0694: f3 44 0f 59 d0              	mulss	%xmm0, %xmm10
1454a0699: 76 0a                       	jbe	0x1454a06a5 <.text+0x549f6a5>
1454a069b: f3 45 0f 59 94 24 68 04 00 00       	mulss	0x468(%r12), %xmm10
1454a06a5: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454a06ab: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454a06b1: 45 0f 2e d8                 	ucomiss	%xmm8, %xmm11
1454a06b5: 0f 97 44 24 20              	seta	0x20(%rsp)
1454a06ba: f3 4d 0f 2c ca              	cvttss2si	%xmm10, %r9
1454a06bf: 44 0f 2e d7                 	ucomiss	%xmm7, %xmm10
1454a06c3: b8 00 00 00 00              	movl	$0x0, %eax
1454a06c8: 44 0f 42 c8                 	cmovbl	%eax, %r9d
1454a06cc: 44 0f 2e 15 48 ae 44 00     	ucomiss	0x44ae48(%rip), %xmm10  # 0x1458eb51c
1454a06d4: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a06d9: 44 0f 47 c8                 	cmoval	%eax, %r9d
1454a06dd: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a06e4: 49 89 f8                    	movq	%rdi, %r8
1454a06e7: e8 a4 17 fa ff              	callq	0x145441e90 <.text+0x5440e90>
1454a06ec: 90                          	nop
1454a06ed: 4c 8b a5 68 03 00 00        	movq	0x368(%rbp), %r12
1454a06f4: 49 8b b4 24 48 05 00 00     	movq	0x548(%r12), %rsi
1454a06fc: 49 3b b4 24 38 05 00 00     	cmpq	0x538(%r12), %rsi
1454a0704: 75 0d                       	jne	0x1454a0713 <.text+0x549f713>
1454a0706: 48 8b 8d 28 03 00 00        	movq	0x328(%rbp), %rcx
1454a070d: e8 9e 79 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a0712: 90                          	nop
1454a0713: 49 8b 84 24 40 05 00 00     	movq	0x540(%r12), %rax
1454a071b: 48 89 f1                    	movq	%rsi, %rcx
1454a071e: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a0722: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a0729: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a0730: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a0735: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a0739: 48 ff c6                    	incq	%rsi
1454a073c: 49 89 b4 24 48 05 00 00     	movq	%rsi, 0x548(%r12)
1454a0744: 41 8a 9c 24 11 01 00 00     	movb	0x111(%r12), %bl
1454a074c: 41 c6 84 24 11 01 00 00 02  	movb	$0x2, 0x111(%r12)
1454a0755: 41 0f b6 47 28              	movzbl	0x28(%r15), %eax
1454a075a: 8b 8d 48 03 00 00           	movl	0x348(%rbp), %ecx
1454a0760: 88 8d 67 03 00 00           	movb	%cl, 0x367(%rbp)
1454a0766: 45 0f 2e d8                 	ucomiss	%xmm8, %xmm11
1454a076a: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a076f: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a0773: c6 44 24 30 01              	movb	$0x1, 0x30(%rsp)
1454a0778: 4c 89 e1                    	movq	%r12, %rcx
1454a077b: 48 89 fa                    	movq	%rdi, %rdx
1454a077e: 41 0f 28 d2                 	movaps	%xmm10, %xmm2
1454a0782: 45 31 c9                    	xorl	%r9d, %r9d
1454a0785: e8 26 27 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a078a: 90                          	nop
1454a078b: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0792: 88 98 11 01 00 00           	movb	%bl, 0x111(%rax)
1454a0798: 41 0f 28 c6                 	movaps	%xmm14, %xmm0
1454a079c: 41 0f 5c c1                 	subps	%xmm9, %xmm0
1454a07a0: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a07a3: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a07a7: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a07ab: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a07ae: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a07b2: 0f 2e 05 7b c6 45 00        	ucomiss	0x45c67b(%rip), %xmm0   # 0x1458fce34
1454a07b9: 0f 86 99 f0 ff ff           	jbe	0x14549f858 <.text+0x549e858>
1454a07bf: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a07c2: f3 0f 58 0d c6 9c 50 01     	addss	0x1509cc6(%rip), %xmm1  # 0x1469aa490
1454a07ca: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a07ce: 45 0f 5c ce                 	subps	%xmm14, %xmm9
1454a07d2: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454a07d7: f3 44 0f 59 c9              	mulss	%xmm1, %xmm9
1454a07dc: f3 45 0f 58 ce              	addss	%xmm14, %xmm9
1454a07e1: f3 41 0f 16 c6              	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
1454a07e6: f3 0f 59 d9                 	mulss	%xmm1, %xmm3
1454a07ea: f3 0f 58 d8                 	addss	%xmm0, %xmm3
1454a07ee: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454a07f4: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454a07fa: f3 0f 10 45 60              	movss	0x60(%rbp), %xmm0
1454a07ff: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a0805: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a080c: 4c 89 f2                    	movq	%r14, %rdx
1454a080f: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a0813: e8 08 dc 01 00              	callq	0x1454be420 <.text+0x54bd420>
1454a0818: 90                          	nop
1454a0819: e9 3a f0 ff ff              	jmp	0x14549f858 <.text+0x549e858>
1454a081e: f3 0f 10 05 c2 71 52 00     	movss	0x5271c2(%rip), %xmm0   # 0x1459c79e8
1454a0826: eb 08                       	jmp	0x1454a0830 <.text+0x549f830>
1454a0828: f3 0f 10 05 f0 71 52 00     	movss	0x5271f0(%rip), %xmm0   # 0x1459c7a20
1454a0830: 45 0f 2e fb                 	ucomiss	%xmm11, %xmm15
1454a0834: 41 0f 97 c4                 	seta	%r12b
1454a0838: 45 0f 5c ca                 	subps	%xmm10, %xmm9
1454a083c: 45 0f 59 c9                 	mulps	%xmm9, %xmm9
1454a0840: f3 41 0f 16 c9              	movshdup	%xmm9, %xmm1            # xmm1 = xmm9[1,1,3,3]
1454a0845: f3 41 0f 58 c9              	addss	%xmm9, %xmm1
1454a084a: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454a084e: f3 44 0f 51 c9              	sqrtss	%xmm1, %xmm9
1454a0853: f3 44 0f 5e c8              	divss	%xmm0, %xmm9
1454a0858: f3 45 0f 58 8d e4 08 00 00  	addss	0x8e4(%r13), %xmm9
1454a0861: 45 0f b6 76 28              	movzbl	0x28(%r14), %r14d
1454a0866: 31 db                       	xorl	%ebx, %ebx
1454a0868: 41 80 fe 04                 	cmpb	$0x4, %r14b
1454a086c: 40 0f 94 c6                 	sete	%sil
1454a0870: 4c 89 e8                    	movq	%r13, %rax
1454a0873: 4d 8b ad 00 05 00 00        	movq	0x500(%r13), %r13
1454a087a: 4c 3b a8 f0 04 00 00        	cmpq	0x4f0(%rax), %r13
1454a0881: 75 0d                       	jne	0x1454a0890 <.text+0x549f890>
1454a0883: 48 8b 8d 28 02 00 00        	movq	0x228(%rbp), %rcx
1454a088a: e8 21 3a 2c 00              	callq	0x1457642b0 <.text+0x57632b0>
1454a088f: 90                          	nop
1454a0890: f3 45 0f c2 df 01           	cmpltss	%xmm15, %xmm11
1454a0896: 41 0f 28 c3                 	movaps	%xmm11, %xmm0
1454a089a: 41 0f 55 c6                 	andnps	%xmm14, %xmm0
1454a089e: 45 0f 54 d8                 	andps	%xmm8, %xmm11
1454a08a2: 44 0f 56 d8                 	orps	%xmm0, %xmm11
1454a08a6: 40 88 f3                    	movb	%sil, %bl
1454a08a9: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a08b0: 48 8b 82 f8 04 00 00        	movq	0x4f8(%rdx), %rax
1454a08b7: 4a 8d 0c ad 00 00 00 00     	leaq	(,%r13,4), %rcx
1454a08bf: 4c 01 e9                    	addq	%r13, %rcx
1454a08c2: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454a08c6: 48 c7 04 08 00 00 00 00     	movq	$0x0, (%rax,%rcx)
1454a08ce: c7 44 08 10 00 00 00 00     	movl	$0x0, 0x10(%rax,%rcx)
1454a08d6: 48 89 7c 08 20              	movq	%rdi, 0x20(%rax,%rcx)
1454a08db: 4c 8b 85 80 00 00 00        	movq	0x80(%rbp), %r8
1454a08e2: 4c 89 44 08 28              	movq	%r8, 0x28(%rax,%rcx)
1454a08e7: 89 5c 08 30                 	movl	%ebx, 0x30(%rax,%rcx)
1454a08eb: f2 0f 10 05 8d 9b 50 01     	movsd	0x1509b8d(%rip), %xmm0  # 0x1469aa480
1454a08f3: f2 0f 11 44 08 34           	movsd	%xmm0, 0x34(%rax,%rcx)
1454a08f9: f3 44 0f 11 4c 08 3c        	movss	%xmm9, 0x3c(%rax,%rcx)
1454a0900: 44 89 7c 08 40              	movl	%r15d, 0x40(%rax,%rcx)
1454a0905: f3 44 0f 11 5c 08 44        	movss	%xmm11, 0x44(%rax,%rcx)
1454a090c: 44 88 64 08 48              	movb	%r12b, 0x48(%rax,%rcx)
1454a0911: 66 c7 44 08 49 00 00        	movw	$0x0, 0x49(%rax,%rcx)
1454a0918: 44 88 74 08 4b              	movb	%r14b, 0x4b(%rax,%rcx)
1454a091d: 49 ff c5                    	incq	%r13
1454a0920: 4c 89 aa 00 05 00 00        	movq	%r13, 0x500(%rdx)
1454a0927: 4c 8b 8d 10 03 00 00        	movq	0x310(%rbp), %r9
1454a092e: 4d 85 c9                    	testq	%r9, %r9
1454a0931: 0f 84 21 ef ff ff           	je	0x14549f858 <.text+0x549e858>
1454a0937: 4c 89 ca                    	movq	%r9, %rdx
1454a093a: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a093e: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a0944: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a094b: e8 80 18 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a0950: e9 03 ef ff ff              	jmp	0x14549f858 <.text+0x549e858>
1454a0955: 80 bd 48 03 00 00 00        	cmpb	$0x0, 0x348(%rbp)
1454a095c: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a0963: 74 22                       	je	0x1454a0987 <.text+0x549f987>
1454a0965: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a096c: 48 85 d2                    	testq	%rdx, %rdx
1454a096f: 74 16                       	je	0x1454a0987 <.text+0x549f987>
1454a0971: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a0978: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a097c: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a0982: e8 49 18 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a0987: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a098e: 49 8b 8d a0 02 00 00        	movq	0x2a0(%r13), %rcx
1454a0995: 48 6b d1 58                 	imulq	$0x58, %rcx, %rdx
1454a0999: 45 31 c0                    	xorl	%r8d, %r8d
1454a099c: 0f 1f 40 00                 	nopl	(%rax)
1454a09a0: 4c 39 c2                    	cmpq	%r8, %rdx
1454a09a3: 0f 84 db 2e 00 00           	je	0x1454a3884 <.text+0x54a2884>
1454a09a9: 4e 8b 0c 00                 	movq	(%rax,%r8), %r9
1454a09ad: 49 83 c0 58                 	addq	$0x58, %r8
1454a09b1: 41 80 79 75 0b              	cmpb	$0xb, 0x75(%r9)
1454a09b6: 75 e8                       	jne	0x1454a09a0 <.text+0x549f9a0>
1454a09b8: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a09c1: f3 44 0f 11 45 10           	movss	%xmm8, 0x10(%rbp)
1454a09c7: 49 bd 72 65 64 65 6d 70 74 69       	movabsq	$0x6974706d65646572, %r13 # imm = 0x6974706D65646572
1454a09d1: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a09db: 48 85 c9                    	testq	%rcx, %rcx
1454a09de: 0f 84 aa 04 00 00           	je	0x1454a0e8e <.text+0x549fe8e>
1454a09e4: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a09eb: f3 0f 10 b9 60 04 00 00     	movss	0x460(%rcx), %xmm7
1454a09f3: 4c 8d 04 10                 	leaq	(%rax,%rdx), %r8
1454a09f7: 45 31 c9                    	xorl	%r9d, %r9d
1454a09fa: eb 11                       	jmp	0x1454a0a0d <.text+0x549fa0d>
1454a09fc: 0f 1f 40 00                 	nopl	(%rax)
1454a0a00: 49 83 c1 58                 	addq	$0x58, %r9
1454a0a04: 4c 39 ca                    	cmpq	%r9, %rdx
1454a0a07: 0f 84 12 01 00 00           	je	0x1454a0b1f <.text+0x549fb1f>
1454a0a0d: 4e 8b 14 08                 	movq	(%rax,%r9), %r10
1454a0a11: 49 83 7a 08 09              	cmpq	$0x9, 0x8(%r10)
1454a0a16: 75 e8                       	jne	0x1454a0a00 <.text+0x549fa00>
1454a0a18: 49 8b 0a                    	movq	(%r10), %rcx
1454a0a1b: 4c 8b 19                    	movq	(%rcx), %r11
1454a0a1e: 4d 31 e3                    	xorq	%r12, %r11
1454a0a21: 0f b6 71 08                 	movzbl	0x8(%rcx), %esi
1454a0a25: 48 83 f6 65                 	xorq	$0x65, %rsi
1454a0a29: 4c 09 de                    	orq	%r11, %rsi
1454a0a2c: 75 d2                       	jne	0x1454a0a00 <.text+0x549fa00>
1454a0a2e: f3 45 0f 10 4a 48           	movss	0x48(%r10), %xmm9
1454a0a34: f3 44 0f 59 0d 03 83 45 00  	mulss	0x458303(%rip), %xmm9   # 0x1458f8d40
1454a0a3d: f3 46 0f 59 4c 08 14        	mulss	0x14(%rax,%r9), %xmm9
1454a0a44: f3 46 0f 59 4c 08 3c        	mulss	0x3c(%rax,%r9), %xmm9
1454a0a4b: f3 46 0f 10 54 08 50        	movss	0x50(%rax,%r9), %xmm10
1454a0a52: f3 44 0f 59 cf              	mulss	%xmm7, %xmm9
1454a0a57: f3 44 0f 5f 0d b0 c5 44 00  	maxss	0x44c5b0(%rip), %xmm9   # 0x1458ed010
1454a0a60: ba 09 00 00 00              	movl	$0x9, %edx
1454a0a65: e8 46 ae f7 ff              	callq	0x14541b8b0 <.text+0x541a8b0>
1454a0a6a: f3 44 0f 5f 15 ad 5b 45 00  	maxss	0x455bad(%rip), %xmm10  # 0x1458f6620
1454a0a73: f3 41 0f 5f c1              	maxss	%xmm9, %xmm0
1454a0a78: f3 41 0f 5e c2              	divss	%xmm10, %xmm0
1454a0a7d: f3 0f 10 0d a7 aa 44 00     	movss	0x44aaa7(%rip), %xmm1   # 0x1458eb52c
1454a0a85: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a0a89: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a0a8c: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454a0a90: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a0a97: f3 0f 58 86 c8 07 00 00     	addss	0x7c8(%rsi), %xmm0
1454a0a9f: f3 0f 59 0d e1 a9 44 00     	mulss	0x44a9e1(%rip), %xmm1   # 0x1458eb488
1454a0aa7: f3 0f 5f 0d 75 5b 45 00     	maxss	0x455b75(%rip), %xmm1   # 0x1458f6624
1454a0aaf: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454a0ab3: f3 0f 11 86 c8 07 00 00     	movss	%xmm0, 0x7c8(%rsi)
1454a0abb: f3 44 0f 5c 86 cc 07 00 00  	subss	0x7cc(%rsi), %xmm8
1454a0ac4: 44 0f 2e 05 60 5b 45 00     	ucomiss	0x455b60(%rip), %xmm8   # 0x1458f662c
1454a0acc: 76 23                       	jbe	0x1454a0af1 <.text+0x549faf1>
1454a0ace: f3 0f 10 05 9a d7 49 00     	movss	0x49d79a(%rip), %xmm0   # 0x14593e270
1454a0ad6: f3 0f 59 c6                 	mulss	%xmm6, %xmm0
1454a0ada: f3 0f 58 86 c4 07 00 00     	addss	0x7c4(%rsi), %xmm0
1454a0ae2: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a0ae5: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454a0ae9: f3 0f 11 86 c4 07 00 00     	movss	%xmm0, 0x7c4(%rsi)
1454a0af1: 48 89 f1                    	movq	%rsi, %rcx
1454a0af4: e8 f7 5e 03 00              	callq	0x1454d69f0 <.text+0x54d59f0>
1454a0af9: 48 8b 8e a0 02 00 00        	movq	0x2a0(%rsi), %rcx
1454a0b00: 48 85 c9                    	testq	%rcx, %rcx
1454a0b03: 0f 84 85 03 00 00           	je	0x1454a0e8e <.text+0x549fe8e>
1454a0b09: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0b10: 48 8b 80 98 02 00 00        	movq	0x298(%rax), %rax
1454a0b17: 48 6b d1 58                 	imulq	$0x58, %rcx, %rdx
1454a0b1b: 4c 8d 04 10                 	leaq	(%rax,%rdx), %r8
1454a0b1f: 49 ba 73 65 61 6c 5f 66 61 74       	movabsq	$0x7461665f6c616573, %r10 # imm = 0x7461665F6C616573
1454a0b29: 49 89 c1                    	movq	%rax, %r9
1454a0b2c: eb 0f                       	jmp	0x1454a0b3d <.text+0x549fb3d>
1454a0b2e: 66 90                       	nop
1454a0b30: 49 83 c1 58                 	addq	$0x58, %r9
1454a0b34: 4d 39 c1                    	cmpq	%r8, %r9
1454a0b37: 0f 84 d0 00 00 00           	je	0x1454a0c0d <.text+0x549fc0d>
1454a0b3d: 4d 8b 19                    	movq	(%r9), %r11
1454a0b40: 49 83 7b 08 09              	cmpq	$0x9, 0x8(%r11)
1454a0b45: 75 e9                       	jne	0x1454a0b30 <.text+0x549fb30>
1454a0b47: 49 8b 0b                    	movq	(%r11), %rcx
1454a0b4a: 48 8b 31                    	movq	(%rcx), %rsi
1454a0b4d: 4c 31 d6                    	xorq	%r10, %rsi
1454a0b50: 0f b6 79 08                 	movzbl	0x8(%rcx), %edi
1454a0b54: 48 83 f7 65                 	xorq	$0x65, %rdi
1454a0b58: 48 09 f7                    	orq	%rsi, %rdi
1454a0b5b: 75 d3                       	jne	0x1454a0b30 <.text+0x549fb30>
1454a0b5d: f3 41 0f 10 43 48           	movss	0x48(%r11), %xmm0
1454a0b63: f3 0f 59 05 d5 81 45 00     	mulss	0x4581d5(%rip), %xmm0   # 0x1458f8d40
1454a0b6b: f3 41 0f 59 41 14           	mulss	0x14(%r9), %xmm0
1454a0b71: f3 41 0f 59 41 3c           	mulss	0x3c(%r9), %xmm0
1454a0b77: f3 45 0f 10 41 50           	movss	0x50(%r9), %xmm8
1454a0b7d: f3 0f 59 f8                 	mulss	%xmm0, %xmm7
1454a0b81: f3 0f 5f 3d 87 c4 44 00     	maxss	0x44c487(%rip), %xmm7   # 0x1458ed010
1454a0b89: ba 09 00 00 00              	movl	$0x9, %edx
1454a0b8e: e8 1d ad f7 ff              	callq	0x14541b8b0 <.text+0x541a8b0>
1454a0b93: f3 0f 5f c7                 	maxss	%xmm7, %xmm0
1454a0b97: f3 44 0f 5f 05 80 5a 45 00  	maxss	0x455a80(%rip), %xmm8   # 0x1458f6620
1454a0ba0: f3 41 0f 5e c0              	divss	%xmm8, %xmm0
1454a0ba5: f3 0f 10 0d 37 82 45 00     	movss	0x458237(%rip), %xmm1   # 0x1458f8de4
1454a0bad: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a0bb1: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a0bb4: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454a0bb8: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a0bbf: f3 0f 58 86 d4 07 00 00     	addss	0x7d4(%rsi), %xmm0
1454a0bc7: f3 0f 59 0d b9 a8 44 00     	mulss	0x44a8b9(%rip), %xmm1   # 0x1458eb488
1454a0bcf: f3 0f 5f 0d 4d 5a 45 00     	maxss	0x455a4d(%rip), %xmm1   # 0x1458f6624
1454a0bd7: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454a0bdb: f3 0f 11 86 d4 07 00 00     	movss	%xmm0, 0x7d4(%rsi)
1454a0be3: 48 89 f1                    	movq	%rsi, %rcx
1454a0be6: e8 35 64 03 00              	callq	0x1454d7020 <.text+0x54d6020>
1454a0beb: 48 8b 8e a0 02 00 00        	movq	0x2a0(%rsi), %rcx
1454a0bf2: 48 85 c9                    	testq	%rcx, %rcx
1454a0bf5: 0f 84 93 02 00 00           	je	0x1454a0e8e <.text+0x549fe8e>
1454a0bfb: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0c02: 48 8b 80 98 02 00 00        	movq	0x298(%rax), %rax
1454a0c09: 48 6b d1 58                 	imulq	$0x58, %rcx, %rdx
1454a0c0d: 48 8d 0c 10                 	leaq	(%rax,%rdx), %rcx
1454a0c11: 49 b8 73 6f 75 6c 5f 66 69 72       	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454a0c1b: 49 89 c1                    	movq	%rax, %r9
1454a0c1e: eb 0d                       	jmp	0x1454a0c2d <.text+0x549fc2d>
1454a0c20: 49 83 c1 58                 	addq	$0x58, %r9
1454a0c24: 49 39 c9                    	cmpq	%rcx, %r9
1454a0c27: 0f 84 21 02 00 00           	je	0x1454a0e4e <.text+0x549fe4e>
1454a0c2d: 4d 8b 11                    	movq	(%r9), %r10
1454a0c30: 49 83 7a 08 09              	cmpq	$0x9, 0x8(%r10)
1454a0c35: 75 e9                       	jne	0x1454a0c20 <.text+0x549fc20>
1454a0c37: 4d 8b 12                    	movq	(%r10), %r10
1454a0c3a: 4d 8b 1a                    	movq	(%r10), %r11
1454a0c3d: 4d 31 c3                    	xorq	%r8, %r11
1454a0c40: 45 0f b6 52 08              	movzbl	0x8(%r10), %r10d
1454a0c45: 49 83 f2 65                 	xorq	$0x65, %r10
1454a0c49: 4d 09 da                    	orq	%r11, %r10
1454a0c4c: 75 d2                       	jne	0x1454a0c20 <.text+0x549fc20>
1454a0c4e: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a0c55: 48 89 f1                    	movq	%rsi, %rcx
1454a0c58: e8 73 4f 03 00              	callq	0x1454d5bd0 <.text+0x54d4bd0>
1454a0c5d: f3 0f 10 86 e4 08 00 00     	movss	0x8e4(%rsi), %xmm0
1454a0c65: f3 0f 11 85 d8 02 00 00     	movss	%xmm0, 0x2d8(%rbp)
1454a0c6d: 48 8d be 38 07 00 00        	leaq	0x738(%rsi), %rdi
1454a0c74: 48 8b 86 38 07 00 00        	movq	0x738(%rsi), %rax
1454a0c7b: 48 8b 8e 40 07 00 00        	movq	0x740(%rsi), %rcx
1454a0c82: 48 8b 96 48 07 00 00        	movq	0x748(%rsi), %rdx
1454a0c89: 48 c7 86 38 07 00 00 00 00 00 00    	movq	$0x0, 0x738(%rsi)
1454a0c94: 48 c7 86 40 07 00 00 08 00 00 00    	movq	$0x8, 0x740(%rsi)
1454a0c9f: 48 c7 86 48 07 00 00 00 00 00 00    	movq	$0x0, 0x748(%rsi)
1454a0caa: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
1454a0cae: 48 8d 14 d1                 	leaq	(%rcx,%rdx,8), %rdx
1454a0cb2: 48 89 8d 30 02 00 00        	movq	%rcx, 0x230(%rbp)
1454a0cb9: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
1454a0cc0: 48 89 8d 38 02 00 00        	movq	%rcx, 0x238(%rbp)
1454a0cc7: 48 89 95 48 02 00 00        	movq	%rdx, 0x248(%rbp)
1454a0cce: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a0cd5: 48 8d 95 30 02 00 00        	leaq	0x230(%rbp), %rdx
1454a0cdc: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a0ce3: e8 d8 57 0a 00              	callq	0x1455464c0 <.text+0x55454c0>
1454a0ce8: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454a0cef: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a0cf6: 4c 8b b5 a8 00 00 00        	movq	0xa8(%rbp), %r14
1454a0cfd: 48 8b 9d b0 00 00 00        	movq	0xb0(%rbp), %rbx
1454a0d04: 48 8b 85 c8 00 00 00        	movq	0xc8(%rbp), %rax
1454a0d0b: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
1454a0d12: 0f 10 85 b8 00 00 00        	movups	0xb8(%rbp), %xmm0
1454a0d19: 0f 29 85 30 02 00 00        	movaps	%xmm0, 0x230(%rbp)
1454a0d20: 48 8b 86 38 07 00 00        	movq	0x738(%rsi), %rax
1454a0d27: 48 85 c0                    	testq	%rax, %rax
1454a0d2a: 74 1a                       	je	0x1454a0d46 <.text+0x549fd46>
1454a0d2c: 48 8b 8e 40 07 00 00        	movq	0x740(%rsi), %rcx
1454a0d33: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a0d37: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1454a0d3b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a0d41: e8 8a 14 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a0d46: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454a0d4d: 48 89 47 10                 	movq	%rax, 0x10(%rdi)
1454a0d51: 0f 28 85 30 02 00 00        	movaps	0x230(%rbp), %xmm0
1454a0d58: 0f 11 07                    	movups	%xmm0, (%rdi)
1454a0d5b: 48 85 db                    	testq	%rbx, %rbx
1454a0d5e: 0f 84 a3 00 00 00           	je	0x1454a0e07 <.text+0x549fe07>
1454a0d64: 48 c1 e3 03                 	shlq	$0x3, %rbx
1454a0d68: 48 8d 3c 5b                 	leaq	(%rbx,%rbx,2), %rdi
1454a0d6c: 31 db                       	xorl	%ebx, %ebx
1454a0d6e: 4c 89 b5 58 03 00 00        	movq	%r14, 0x358(%rbp)
1454a0d75: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a0d80: 41 0f b6 44 1e 10           	movzbl	0x10(%r14,%rbx), %eax
1454a0d86: 3c 02                       	cmpb	$0x2, %al
1454a0d88: 74 7d                       	je	0x1454a0e07 <.text+0x549fe07>
1454a0d8a: f3 41 0f 10 54 1e 0c        	movss	0xc(%r14,%rbx), %xmm2
1454a0d91: 49 8b 14 1e                 	movq	(%r14,%rbx), %rdx
1454a0d95: 4c 8b b5 68 03 00 00        	movq	0x368(%rbp), %r14
1454a0d9c: 41 8a b6 11 01 00 00        	movb	0x111(%r14), %sil
1454a0da3: 41 c6 86 11 01 00 00 03     	movb	$0x3, 0x111(%r14)
1454a0dab: 41 0f 10 7e 20              	movups	0x20(%r14), %xmm7
1454a0db0: 45 0f 10 46 40              	movups	0x40(%r14), %xmm8
1454a0db5: 49 c7 46 20 00 00 00 00     	movq	$0x0, 0x20(%r14)
1454a0dbd: 49 c7 46 40 00 00 00 00     	movq	$0x0, 0x40(%r14)
1454a0dc5: 88 44 24 28                 	movb	%al, 0x28(%rsp)
1454a0dc9: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a0dce: c6 44 24 20 02              	movb	$0x2, 0x20(%rsp)
1454a0dd3: 4c 89 f1                    	movq	%r14, %rcx
1454a0dd6: 41 b9 d1 18 00 00           	movl	$0x18d1, %r9d           # imm = 0x18D1
1454a0ddc: e8 cf 20 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a0de1: 90                          	nop
1454a0de2: 41 88 b6 11 01 00 00        	movb	%sil, 0x111(%r14)
1454a0de9: 41 0f 11 7e 20              	movups	%xmm7, 0x20(%r14)
1454a0dee: 45 0f 11 46 40              	movups	%xmm8, 0x40(%r14)
1454a0df3: 48 83 c3 18                 	addq	$0x18, %rbx
1454a0df7: 48 39 df                    	cmpq	%rbx, %rdi
1454a0dfa: 4c 8b b5 58 03 00 00        	movq	0x358(%rbp), %r14
1454a0e01: 0f 85 79 ff ff ff           	jne	0x1454a0d80 <.text+0x549fd80>
1454a0e07: 48 8b 85 40 03 00 00        	movq	0x340(%rbp), %rax
1454a0e0e: 48 85 c0                    	testq	%rax, %rax
1454a0e11: 74 16                       	je	0x1454a0e29 <.text+0x549fe29>
1454a0e13: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a0e17: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1454a0e1b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a0e21: 4c 89 f1                    	movq	%r14, %rcx
1454a0e24: e8 a7 13 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a0e29: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0e30: 48 8b 88 a0 02 00 00        	movq	0x2a0(%rax), %rcx
1454a0e37: 48 85 c9                    	testq	%rcx, %rcx
1454a0e3a: 74 52                       	je	0x1454a0e8e <.text+0x549fe8e>
1454a0e3c: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0e43: 48 8b 80 98 02 00 00        	movq	0x298(%rax), %rax
1454a0e4a: 48 6b d1 58                 	imulq	$0x58, %rcx, %rdx
1454a0e4e: 48 01 c2                    	addq	%rax, %rdx
1454a0e51: eb 16                       	jmp	0x1454a0e69 <.text+0x549fe69>
1454a0e53: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a0e60: 48 83 c0 58                 	addq	$0x58, %rax
1454a0e64: 48 39 d0                    	cmpq	%rdx, %rax
1454a0e67: 74 25                       	je	0x1454a0e8e <.text+0x549fe8e>
1454a0e69: 48 8b 08                    	movq	(%rax), %rcx
1454a0e6c: 48 83 79 08 0a              	cmpq	$0xa, 0x8(%rcx)
1454a0e71: 75 ed                       	jne	0x1454a0e60 <.text+0x549fe60>
1454a0e73: 48 8b 09                    	movq	(%rcx), %rcx
1454a0e76: 4c 8b 01                    	movq	(%rcx), %r8
1454a0e79: 4d 31 e8                    	xorq	%r13, %r8
1454a0e7c: 0f b7 49 08                 	movzwl	0x8(%rcx), %ecx
1454a0e80: 48 81 f1 6f 6e 00 00        	xorq	$0x6e6f, %rcx           # imm = 0x6E6F
1454a0e87: 4c 09 c1                    	orq	%r8, %rcx
1454a0e8a: 75 d4                       	jne	0x1454a0e60 <.text+0x549fe60>
1454a0e8c: eb 15                       	jmp	0x1454a0ea3 <.text+0x549fea3>
1454a0e8e: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0e95: 48 83 b8 60 07 00 00 00     	cmpq	$0x0, 0x760(%rax)
1454a0e9d: 0f 84 09 05 00 00           	je	0x1454a13ac <.text+0x54a03ac>
1454a0ea3: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0eaa: f3 0f 10 b8 e4 08 00 00     	movss	0x8e4(%rax), %xmm7
1454a0eb2: 48 8d 98 38 05 00 00        	leaq	0x538(%rax), %rbx
1454a0eb9: 48 8d b5 b4 02 00 00        	leaq	0x2b4(%rbp), %rsi
1454a0ec0: f3 44 0f 10 05 4b b5 75 00  	movss	0x75b54b(%rip), %xmm8   # 0x145bfc414
1454a0ec9: 4c 8d bd 30 02 00 00        	leaq	0x230(%rbp), %r15
1454a0ed0: f3 44 0f 10 15 67 7e 45 00  	movss	0x457e67(%rip), %xmm10  # 0x1458f8d40
1454a0ed9: f3 44 0f 10 25 de a4 54 00  	movss	0x54a4de(%rip), %xmm12  # 0x1459eb3c0
1454a0ee2: 48 8b b8 60 07 00 00        	movq	0x760(%rax), %rdi
1454a0ee9: 48 85 ff                    	testq	%rdi, %rdi
1454a0eec: 0f 84 ba 04 00 00           	je	0x1454a13ac <.text+0x54a03ac>
1454a0ef2: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0ef9: 48 8b 80 58 07 00 00        	movq	0x758(%rax), %rax
1454a0f00: 49 89 f8                    	movq	%rdi, %r8
1454a0f03: 49 c1 e0 05                 	shlq	$0x5, %r8
1454a0f07: 45 31 c9                    	xorl	%r9d, %r9d
1454a0f0a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a0f10: 42 0f 2e 7c 08 08           	ucomiss	0x8(%rax,%r9), %xmm7
1454a0f16: 73 0e                       	jae	0x1454a0f26 <.text+0x549ff26>
1454a0f18: 49 83 c1 20                 	addq	$0x20, %r9
1454a0f1c: 4d 39 c8                    	cmpq	%r9, %r8
1454a0f1f: 75 ef                       	jne	0x1454a0f10 <.text+0x549ff10>
1454a0f21: e9 86 04 00 00              	jmp	0x1454a13ac <.text+0x54a03ac>
1454a0f26: 4a 8d 0c 08                 	leaq	(%rax,%r9), %rcx
1454a0f2a: 4e 8b 24 08                 	movq	(%rax,%r9), %r12
1454a0f2e: 42 0f 10 44 08 08           	movups	0x8(%rax,%r9), %xmm0
1454a0f34: 0f 29 85 b0 02 00 00        	movaps	%xmm0, 0x2b0(%rbp)
1454a0f3b: 46 8b 74 08 18              	movl	0x18(%rax,%r9), %r14d
1454a0f40: 4a 8d 14 08                 	leaq	(%rax,%r9), %rdx
1454a0f44: 48 83 c2 20                 	addq	$0x20, %rdx
1454a0f48: 4d 29 c8                    	subq	%r9, %r8
1454a0f4b: 49 83 c0 e0                 	addq	$-0x20, %r8
1454a0f4f: e8 7d 5e 2b 00              	callq	0x145756dd1 <.text+0x5755dd1>
1454a0f54: 48 ff cf                    	decq	%rdi
1454a0f57: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0f5e: 48 89 b8 60 07 00 00        	movq	%rdi, 0x760(%rax)
1454a0f65: 48 8b 88 a0 02 00 00        	movq	0x2a0(%rax), %rcx
1454a0f6c: 48 85 c9                    	testq	%rcx, %rcx
1454a0f6f: 0f 84 16 04 00 00           	je	0x1454a138b <.text+0x54a038b>
1454a0f75: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a0f7c: 48 8b 80 98 02 00 00        	movq	0x298(%rax), %rax
1454a0f83: 48 6b d1 58                 	imulq	$0x58, %rcx, %rdx
1454a0f87: 31 c9                       	xorl	%ecx, %ecx
1454a0f89: eb 12                       	jmp	0x1454a0f9d <.text+0x549ff9d>
1454a0f8b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a0f90: 48 83 c1 58                 	addq	$0x58, %rcx
1454a0f94: 48 39 ca                    	cmpq	%rcx, %rdx
1454a0f97: 0f 84 ee 03 00 00           	je	0x1454a138b <.text+0x54a038b>
1454a0f9d: 48 8b 3c 08                 	movq	(%rax,%rcx), %rdi
1454a0fa1: 48 83 7f 08 0a              	cmpq	$0xa, 0x8(%rdi)
1454a0fa6: 75 e8                       	jne	0x1454a0f90 <.text+0x549ff90>
1454a0fa8: 4c 8b 07                    	movq	(%rdi), %r8
1454a0fab: 4d 8b 08                    	movq	(%r8), %r9
1454a0fae: 4d 31 e9                    	xorq	%r13, %r9
1454a0fb1: 45 0f b7 40 08              	movzwl	0x8(%r8), %r8d
1454a0fb6: 49 81 f0 6f 6e 00 00        	xorq	$0x6e6f, %r8            # imm = 0x6E6F
1454a0fbd: 4d 09 c8                    	orq	%r9, %r8
1454a0fc0: 75 ce                       	jne	0x1454a0f90 <.text+0x549ff90>
1454a0fc2: f3 44 0f 10 7c 08 10        	movss	0x10(%rax,%rcx), %xmm15
1454a0fc9: f3 0f 10 44 08 1c           	movss	0x1c(%rax,%rcx), %xmm0
1454a0fcf: f3 44 0f 10 74 08 38        	movss	0x38(%rax,%rcx), %xmm14
1454a0fd6: f3 44 0f 10 4c 08 4c        	movss	0x4c(%rax,%rcx), %xmm9
1454a0fdd: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a0fe4: f3 0f 10 8a 58 04 00 00     	movss	0x458(%rdx), %xmm1
1454a0fec: f3 0f 11 8d 38 03 00 00     	movss	%xmm1, 0x338(%rbp)
1454a0ff4: f3 44 0f 10 aa 5c 04 00 00  	movss	0x45c(%rdx), %xmm13
1454a0ffd: f3 0f 59 44 08 44           	mulss	0x44(%rax,%rcx), %xmm0
1454a1003: 8b 46 08                    	movl	0x8(%rsi), %eax
1454a1006: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
1454a100c: 48 8b 06                    	movq	(%rsi), %rax
1454a100f: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a1016: f3 0f 59 47 50              	mulss	0x50(%rdi), %xmm0
1454a101b: f3 0f 10 8a 80 04 00 00     	movss	0x480(%rdx), %xmm1
1454a1023: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454a1027: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
1454a102b: 73 35                       	jae	0x1454a1062 <.text+0x54a0062>
1454a102d: f3 0f 58 05 9b db 4e 01     	addss	0x14edb9b(%rip), %xmm0  # 0x14698ebd0
1454a1035: 45 0f 28 da                 	movaps	%xmm10, %xmm11
1454a1039: 45 0f 28 d0                 	movaps	%xmm8, %xmm10
1454a103d: f3 44 0f 10 05 9a 7d 45 00  	movss	0x457d9a(%rip), %xmm8   # 0x1458f8de0
1454a1046: f3 41 0f 5e c0              	divss	%xmm8, %xmm0
1454a104b: e8 07 5f 2b 00              	callq	0x145756f57 <.text+0x5755f57>
1454a1050: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454a1055: 45 0f 28 c2                 	movaps	%xmm10, %xmm8
1454a1059: 45 0f 28 d3                 	movaps	%xmm11, %xmm10
1454a105d: f3 41 0f 58 c0              	addss	%xmm8, %xmm0
1454a1062: 4c 89 a5 d8 02 00 00        	movq	%r12, 0x2d8(%rbp)
1454a1069: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
1454a1070: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454a1075: 48 c7 44 24 28 01 00 00 00  	movq	$0x1, 0x28(%rsp)
1454a107e: 4c 89 f9                    	movq	%r15, %rcx
1454a1081: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a1088: 48 89 f2                    	movq	%rsi, %rdx
1454a108b: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454a1092: 0f 28 d8                    	movaps	%xmm0, %xmm3
1454a1095: e8 36 d0 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a109a: 48 8b 8e c8 04 00 00        	movq	0x4c8(%rsi), %rcx
1454a10a1: 48 69 86 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454a10ac: 0f 1f 40 00                 	nopl	(%rax)
1454a10b0: 48 85 c0                    	testq	%rax, %rax
1454a10b3: 0f 84 d3 00 00 00           	je	0x1454a118c <.text+0x54a018c>
1454a10b9: 48 05 a0 fe ff ff           	addq	$-0x160, %rax           # imm = 0xFEA0
1454a10bf: 4c 39 a1 88 00 00 00        	cmpq	%r12, 0x88(%rcx)
1454a10c6: 48 8d 89 60 01 00 00        	leaq	0x160(%rcx), %rcx
1454a10cd: 75 e1                       	jne	0x1454a10b0 <.text+0x54a00b0>
1454a10cf: 4c 8b 8d 38 02 00 00        	movq	0x238(%rbp), %r9
1454a10d6: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454a10dd: c7 85 d8 02 00 00 02 00 00 00       	movl	$0x2, 0x2d8(%rbp)
1454a10e7: c7 85 10 02 00 00 00 00 00 00       	movl	$0x0, 0x210(%rbp)
1454a10f1: 4c 89 4d 18                 	movq	%r9, 0x18(%rbp)
1454a10f5: c6 85 26 03 00 00 01        	movb	$0x1, 0x326(%rbp)
1454a10fc: 48 8d 8d 10 02 00 00        	leaq	0x210(%rbp), %rcx
1454a1103: 48 89 4c 24 30              	movq	%rcx, 0x30(%rsp)
1454a1108: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a110f: 48 89 4c 24 28              	movq	%rcx, 0x28(%rsp)
1454a1114: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454a1119: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a1120: 4c 89 e2                    	movq	%r12, %rdx
1454a1123: 41 b8 85 3b 00 00           	movl	$0x3b85, %r8d           # imm = 0x3B85
1454a1129: 4c 89 8d 58 03 00 00        	movq	%r9, 0x358(%rbp)
1454a1130: e8 6b a0 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a1135: 90                          	nop
1454a1136: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a113d: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454a1144: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454a114b: 75 09                       	jne	0x1454a1156 <.text+0x54a0156>
1454a114d: 48 89 d9                    	movq	%rbx, %rcx
1454a1150: e8 5b 6f 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a1155: 90                          	nop
1454a1156: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a115d: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a1164: 48 89 f1                    	movq	%rsi, %rcx
1454a1167: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a116b: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a1172: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a1179: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a117e: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a1182: 48 ff c6                    	incq	%rsi
1454a1185: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454a118c: 48 89 9d 48 03 00 00        	movq	%rbx, 0x348(%rbp)
1454a1193: f3 0f 10 47 44              	movss	0x44(%rdi), %xmm0
1454a1198: 0f b6 47 75                 	movzbl	0x75(%rdi), %eax
1454a119c: 04 fe                       	addb	$-0x2, %al
1454a119e: f3 0f 10 0d da a2 44 00     	movss	0x44a2da(%rip), %xmm1   # 0x1458eb480
1454a11a6: 3c 07                       	cmpb	$0x7, %al
1454a11a8: 73 0f                       	jae	0x1454a11b9 <.text+0x54a01b9>
1454a11aa: 0f b6 c0                    	movzbl	%al, %eax
1454a11ad: 48 8d 0d e8 b8 50 01        	leaq	0x150b8e8(%rip), %rcx   # 0x1469aca9c
1454a11b4: f3 0f 10 0c 81              	movss	(%rcx,%rax,4), %xmm1
1454a11b9: 0f 28 d0                    	movaps	%xmm0, %xmm2
1454a11bc: 45 0f 28 da                 	movaps	%xmm10, %xmm11
1454a11c0: f3 41 0f 59 d2              	mulss	%xmm10, %xmm2
1454a11c5: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a11cc: 44 8b a6 e4 07 00 00        	movl	0x7e4(%rsi), %r12d
1454a11d3: 44 89 b6 e4 07 00 00        	movl	%r14d, 0x7e4(%rsi)
1454a11da: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
1454a11e1: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a11e8: 48 8b 85 38 02 00 00        	movq	0x238(%rbp), %rax
1454a11ef: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a11f6: 4c 8b b5 40 02 00 00        	movq	0x240(%rbp), %r14
1454a11fd: 4d 85 f6                    	testq	%r14, %r14
1454a1200: 0f 84 3c 01 00 00           	je	0x1454a1342 <.text+0x54a0342>
1454a1206: f3 44 0f 59 8d 38 03 00 00  	mulss	0x338(%rbp), %xmm9
1454a120f: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a1212: f3 0f c2 d8 01              	cmpltss	%xmm0, %xmm3
1454a1217: 41 0f 54 d9                 	andps	%xmm9, %xmm3
1454a121b: f3 44 0f 59 fa              	mulss	%xmm2, %xmm15
1454a1220: f3 45 0f 59 f7              	mulss	%xmm15, %xmm14
1454a1225: f3 44 0f 59 f1              	mulss	%xmm1, %xmm14
1454a122a: f3 44 0f 58 f3              	addss	%xmm3, %xmm14
1454a122f: f3 45 0f 59 ee              	mulss	%xmm14, %xmm13
1454a1234: 49 c1 e6 03                 	shlq	$0x3, %r14
1454a1238: 44 0f b6 be 11 01 00 00     	movzbl	0x111(%rsi), %r15d
1454a1240: 44 0f 10 4e 20              	movups	0x20(%rsi), %xmm9
1454a1245: 44 0f 10 56 40              	movups	0x40(%rsi), %xmm10
1454a124a: 31 db                       	xorl	%ebx, %ebx
1454a124c: 0f 1f 40 00                 	nopl	(%rax)
1454a1250: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a1257: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
1454a125b: 48 8b 86 80 08 00 00        	movq	0x880(%rsi), %rax
1454a1262: 48 8b 8e 98 08 00 00        	movq	0x898(%rsi), %rcx
1454a1269: 4c 8d 04 01                 	leaq	(%rcx,%rax), %r8
1454a126d: 49 c1 c0 17                 	rolq	$0x17, %r8
1454a1271: 49 01 c0                    	addq	%rax, %r8
1454a1274: 4c 8b 8e 88 08 00 00        	movq	0x888(%rsi), %r9
1454a127b: 4d 89 ca                    	movq	%r9, %r10
1454a127e: 49 c1 e2 11                 	shlq	$0x11, %r10
1454a1282: 4c 8b 9e 90 08 00 00        	movq	0x890(%rsi), %r11
1454a1289: 49 31 c3                    	xorq	%rax, %r11
1454a128c: 4c 31 c9                    	xorq	%r9, %rcx
1454a128f: 4d 31 d9                    	xorq	%r11, %r9
1454a1292: 4c 89 8e 88 08 00 00        	movq	%r9, 0x888(%rsi)
1454a1299: 48 31 c8                    	xorq	%rcx, %rax
1454a129c: 48 89 86 80 08 00 00        	movq	%rax, 0x880(%rsi)
1454a12a3: 4d 31 d3                    	xorq	%r10, %r11
1454a12a6: 4c 89 9e 90 08 00 00        	movq	%r11, 0x890(%rsi)
1454a12ad: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454a12b1: 48 89 8e 98 08 00 00        	movq	%rcx, 0x898(%rsi)
1454a12b8: 49 c1 e8 28                 	shrq	$0x28, %r8
1454a12bc: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a12bf: f3 41 0f 2a c0              	cvtsi2ss	%r8d, %xmm0
1454a12c4: f3 41 0f 59 c4              	mulss	%xmm12, %xmm0
1454a12c9: f3 0f 10 8e 64 04 00 00     	movss	0x464(%rsi), %xmm1
1454a12d1: f3 0f 10 96 68 04 00 00     	movss	0x468(%rsi), %xmm2
1454a12d9: f3 41 0f 59 d5              	mulss	%xmm13, %xmm2
1454a12de: 44 8b 4f 40                 	movl	0x40(%rdi), %r9d
1454a12e2: 0f b6 47 74                 	movzbl	0x74(%rdi), %eax
1454a12e6: c6 86 11 01 00 00 03        	movb	$0x3, 0x111(%rsi)
1454a12ed: 48 c7 46 20 00 00 00 00     	movq	$0x0, 0x20(%rsi)
1454a12f5: 48 c7 46 40 00 00 00 00     	movq	$0x0, 0x40(%rsi)
1454a12fd: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a1300: 77 04                       	ja	0x1454a1306 <.text+0x54a0306>
1454a1302: 41 0f 28 d5                 	movaps	%xmm13, %xmm2
1454a1306: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a130b: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a130f: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a1314: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a131b: 48 89 f1                    	movq	%rsi, %rcx
1454a131e: e8 8d 1b 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a1323: 90                          	nop
1454a1324: 44 88 be 11 01 00 00        	movb	%r15b, 0x111(%rsi)
1454a132b: 44 0f 11 4e 20              	movups	%xmm9, 0x20(%rsi)
1454a1330: 44 0f 11 56 40              	movups	%xmm10, 0x40(%rsi)
1454a1335: 48 83 c3 08                 	addq	$0x8, %rbx
1454a1339: 49 39 de                    	cmpq	%rbx, %r14
1454a133c: 0f 85 0e ff ff ff           	jne	0x1454a1250 <.text+0x54a0250>
1454a1342: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a1349: 48 85 d2                    	testq	%rdx, %rdx
1454a134c: 74 16                       	je	0x1454a1364 <.text+0x54a0364>
1454a134e: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1352: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1358: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a135f: e8 6c 0e b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1364: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a136b: 44 89 a0 e4 07 00 00        	movl	%r12d, 0x7e4(%rax)
1454a1372: 48 8b 9d 48 03 00 00        	movq	0x348(%rbp), %rbx
1454a1379: 48 8d b5 b4 02 00 00        	leaq	0x2b4(%rbp), %rsi
1454a1380: 4c 8d bd 30 02 00 00        	leaq	0x230(%rbp), %r15
1454a1387: 45 0f 28 d3                 	movaps	%xmm11, %xmm10
1454a138b: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a1392: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a139c: 48 8b b8 60 07 00 00        	movq	0x760(%rax), %rdi
1454a13a3: 48 85 ff                    	testq	%rdi, %rdi
1454a13a6: 0f 85 46 fb ff ff           	jne	0x1454a0ef2 <.text+0x549fef2>
1454a13ac: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a13b3: 49 8b 8d a0 02 00 00        	movq	0x2a0(%r13), %rcx
1454a13ba: 48 85 c9                    	testq	%rcx, %rcx
1454a13bd: 0f 84 76 0e 00 00           	je	0x1454a2239 <.text+0x54a1239>
1454a13c3: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a13ca: 48 6b c9 58                 	imulq	$0x58, %rcx, %rcx
1454a13ce: 45 31 c0                    	xorl	%r8d, %r8d
1454a13d1: 48 ba 68 75 6e 74 65 72 73 5f       	movabsq	$0x5f737265746e7568, %rdx # imm = 0x5F737265746E7568
1454a13db: eb 10                       	jmp	0x1454a13ed <.text+0x54a03ed>
1454a13dd: 0f 1f 00                    	nopl	(%rax)
1454a13e0: 49 83 c0 58                 	addq	$0x58, %r8
1454a13e4: 4c 39 c1                    	cmpq	%r8, %rcx
1454a13e7: 0f 84 e9 02 00 00           	je	0x1454a16d6 <.text+0x54a06d6>
1454a13ed: 4e 8b 0c 00                 	movq	(%rax,%r8), %r9
1454a13f1: 49 83 79 08 0c              	cmpq	$0xc, 0x8(%r9)
1454a13f6: 75 e8                       	jne	0x1454a13e0 <.text+0x54a03e0>
1454a13f8: 4d 8b 09                    	movq	(%r9), %r9
1454a13fb: 4d 8b 11                    	movq	(%r9), %r10
1454a13fe: 49 31 d2                    	xorq	%rdx, %r10
1454a1401: 45 8b 49 08                 	movl	0x8(%r9), %r9d
1454a1405: 49 81 f1 6d 61 72 6b        	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454a140c: 4d 09 d1                    	orq	%r10, %r9
1454a140f: 75 cf                       	jne	0x1454a13e0 <.text+0x54a03e0>
1454a1411: 45 31 c0                    	xorl	%r8d, %r8d
1454a1414: eb 17                       	jmp	0x1454a142d <.text+0x54a042d>
1454a1416: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a1420: 49 83 c0 58                 	addq	$0x58, %r8
1454a1424: 4c 39 c1                    	cmpq	%r8, %rcx
1454a1427: 0f 84 a9 02 00 00           	je	0x1454a16d6 <.text+0x54a06d6>
1454a142d: 4a 8b 1c 00                 	movq	(%rax,%r8), %rbx
1454a1431: 48 83 7b 08 0c              	cmpq	$0xc, 0x8(%rbx)
1454a1436: 75 e8                       	jne	0x1454a1420 <.text+0x54a0420>
1454a1438: 4c 8b 0b                    	movq	(%rbx), %r9
1454a143b: 4d 8b 11                    	movq	(%r9), %r10
1454a143e: 49 31 d2                    	xorq	%rdx, %r10
1454a1441: 45 8b 49 08                 	movl	0x8(%r9), %r9d
1454a1445: 49 81 f1 6d 61 72 6b        	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454a144c: 4d 09 d1                    	orq	%r10, %r9
1454a144f: 75 cf                       	jne	0x1454a1420 <.text+0x54a0420>
1454a1451: f3 42 0f 10 44 00 10        	movss	0x10(%rax,%r8), %xmm0
1454a1458: f3 42 0f 59 44 00 38        	mulss	0x38(%rax,%r8), %xmm0
1454a145f: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a1468: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454a146b: f3 0f 51 f8                 	sqrtss	%xmm0, %xmm7
1454a146f: f3 0f 59 3d 95 a0 44 00     	mulss	0x44a095(%rip), %xmm7   # 0x1458eb50c
1454a1477: f3 0f 5d 3d 7d 9a 46 00     	minss	0x469a7d(%rip), %xmm7   # 0x14590aefc
1454a147f: 4d 8b b5 b0 07 00 00        	movq	0x7b0(%r13), %r14
1454a1486: f3 0f 10 4b 4c              	movss	0x4c(%rbx), %xmm1
1454a148b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1491: 4c 89 e9                    	movq	%r13, %rcx
1454a1494: 45 31 c9                    	xorl	%r9d, %r9d
1454a1497: e8 a4 42 03 00              	callq	0x1454d5740 <.text+0x54d4740>
1454a149c: 49 89 c7                    	movq	%rax, %r15
1454a149f: 48 89 d7                    	movq	%rdx, %rdi
1454a14a2: 4d 85 f6                    	testq	%r14, %r14
1454a14a5: 0f 84 0f 01 00 00           	je	0x1454a15ba <.text+0x54a05ba>
1454a14ab: 4c 89 e6                    	movq	%r12, %rsi
1454a14ae: f3 44 0f 10 4b 4c           	movss	0x4c(%rbx), %xmm9
1454a14b4: f3 41 0f 10 95 e4 08 00 00  	movss	0x8e4(%r13), %xmm2
1454a14bd: 4d 8b a5 c8 04 00 00        	movq	0x4c8(%r13), %r12
1454a14c4: 4d 8b ad d0 04 00 00        	movq	0x4d0(%r13), %r13
1454a14cb: 49 8d 8c 24 a0 fe ff ff     	leaq	-0x160(%r12), %rcx
1454a14d3: 49 69 c5 60 01 00 00        	imulq	$0x160, %r13, %rax      # imm = 0x160
1454a14da: 48 85 c0                    	testq	%rax, %rax
1454a14dd: 0f 84 80 00 00 00           	je	0x1454a1563 <.text+0x54a0563>
1454a14e3: 48 8d 91 60 01 00 00        	leaq	0x160(%rcx), %rdx
1454a14ea: 48 05 a0 fe ff ff           	addq	$-0x160, %rax           # imm = 0xFEA0
1454a14f0: 4c 39 b1 e8 01 00 00        	cmpq	%r14, 0x1e8(%rcx)
1454a14f7: 48 89 d1                    	movq	%rdx, %rcx
1454a14fa: 75 de                       	jne	0x1454a14da <.text+0x54a04da>
1454a14fc: 83 7a 68 00                 	cmpl	$0x0, 0x68(%rdx)
1454a1500: 75 61                       	jne	0x1454a1563 <.text+0x54a0563>
1454a1502: 0f 2e 92 40 01 00 00        	ucomiss	0x140(%rdx), %xmm2
1454a1509: 72 58                       	jb	0x1454a1563 <.text+0x54a0563>
1454a150b: 48 83 7a 40 ff              	cmpq	$-0x1, 0x40(%rdx)
1454a1510: 74 06                       	je	0x1454a1518 <.text+0x54a0518>
1454a1512: 80 7a 60 00                 	cmpb	$0x0, 0x60(%rdx)
1454a1516: 74 4b                       	je	0x1454a1563 <.text+0x54a0563>
1454a1518: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a151f: e8 dc bc f6 ff              	callq	0x14540d200 <.text+0x540c200>
1454a1524: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a152b: f2 0f 10 80 e8 03 00 00     	movsd	0x3e8(%rax), %xmm0
1454a1533: f2 0f 10 8d a0 00 00 00     	movsd	0xa0(%rbp), %xmm1
1454a153b: 0f 5c c1                    	subps	%xmm1, %xmm0
1454a153e: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a1541: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a1545: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a1549: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a154c: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a1550: f3 44 0f 59 0d df b6 45 00  	mulss	0x45b6df(%rip), %xmm9   # 0x1458fcc38
1454a1559: 44 0f 2e c8                 	ucomiss	%xmm0, %xmm9
1454a155d: 0f 83 f7 0b 00 00           	jae	0x1454a215a <.text+0x54a115a>
1454a1563: 49 69 cd 60 01 00 00        	imulq	$0x160, %r13, %rcx      # imm = 0x160
1454a156a: 31 c0                       	xorl	%eax, %eax
1454a156c: 4c 89 e2                    	movq	%r12, %rdx
1454a156f: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a1576: 48 39 c1                    	cmpq	%rax, %rcx
1454a1579: 74 1f                       	je	0x1454a159a <.text+0x54a059a>
1454a157b: 48 05 60 01 00 00           	addq	$0x160, %rax            # imm = 0x160
1454a1581: 4c 39 b2 88 00 00 00        	cmpq	%r14, 0x88(%rdx)
1454a1588: 48 8d 92 60 01 00 00        	leaq	0x160(%rdx), %rdx
1454a158f: 75 e5                       	jne	0x1454a1576 <.text+0x54a0576>
1454a1591: 41 c7 44 04 dc 00 00 00 00  	movl	$0x0, -0x24(%r12,%rax)
1454a159a: 44 8b 43 40                 	movl	0x40(%rbx), %r8d
1454a159e: 4c 89 e9                    	movq	%r13, %rcx
1454a15a1: 4c 89 f2                    	movq	%r14, %rdx
1454a15a4: 45 31 c9                    	xorl	%r9d, %r9d
1454a15a7: e8 f4 fd 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a15ac: 49 c7 85 b0 07 00 00 00 00 00 00    	movq	$0x0, 0x7b0(%r13)
1454a15b7: 49 89 f4                    	movq	%rsi, %r12
1454a15ba: f3 41 0f 10 85 e8 07 00 00  	movss	0x7e8(%r13), %xmm0
1454a15c3: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454a15c7: 0f 87 09 01 00 00           	ja	0x1454a16d6 <.text+0x54a06d6>
1454a15cd: 41 f6 c7 01                 	testb	$0x1, %r15b
1454a15d1: 0f 84 ff 00 00 00           	je	0x1454a16d6 <.text+0x54a06d6>
1454a15d7: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a15de: 49 69 95 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a15e9: 31 c9                       	xorl	%ecx, %ecx
1454a15eb: 49 89 c0                    	movq	%rax, %r8
1454a15ee: 48 39 ca                    	cmpq	%rcx, %rdx
1454a15f1: 74 1d                       	je	0x1454a1610 <.text+0x54a0610>
1454a15f3: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a15fa: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
1454a1601: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a1608: 75 e4                       	jne	0x1454a15ee <.text+0x54a05ee>
1454a160a: f3 0f 11 7c 08 dc           	movss	%xmm7, -0x24(%rax,%rcx)
1454a1610: 49 89 bd b0 07 00 00        	movq	%rdi, 0x7b0(%r13)
1454a1617: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
1454a161e: 44 8b 43 40                 	movl	0x40(%rbx), %r8d
1454a1622: 48 89 bd b0 02 00 00        	movq	%rdi, 0x2b0(%rbp)
1454a1629: 48 89 bd 38 02 00 00        	movq	%rdi, 0x238(%rbp)
1454a1630: c7 85 30 02 00 00 00 00 00 00       	movl	$0x0, 0x230(%rbp)
1454a163a: c7 85 d8 02 00 00 00 00 00 00       	movl	$0x0, 0x2d8(%rbp)
1454a1644: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
1454a164b: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a1650: 48 8d 85 30 02 00 00        	leaq	0x230(%rbp), %rax
1454a1657: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a165c: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454a1665: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a166c: 4c 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %r9
1454a1673: e8 28 9b fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a1678: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a167f: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a1686: 75 0d                       	jne	0x1454a1695 <.text+0x54a0695>
1454a1688: 49 8d 8d 38 05 00 00        	leaq	0x538(%r13), %rcx
1454a168f: e8 1c 6a 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a1694: 90                          	nop
1454a1695: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a169c: 48 89 f1                    	movq	%rsi, %rcx
1454a169f: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a16a3: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a16aa: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a16b1: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a16b6: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a16ba: 48 ff c6                    	incq	%rsi
1454a16bd: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a16c4: 44 8b 43 40                 	movl	0x40(%rbx), %r8d
1454a16c8: 4c 89 e9                    	movq	%r13, %rcx
1454a16cb: 48 89 fa                    	movq	%rdi, %rdx
1454a16ce: 41 b1 01                    	movb	$0x1, %r9b
1454a16d1: e8 ca fc 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a16d6: 4d 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %r8
1454a16dd: 4d 85 c0                    	testq	%r8, %r8
1454a16e0: 0f 84 53 0b 00 00           	je	0x1454a2239 <.text+0x54a1239>
1454a16e6: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a16ed: 4d 6b d0 58                 	imulq	$0x58, %r8, %r10
1454a16f1: 45 31 c9                    	xorl	%r9d, %r9d
1454a16f4: 48 b9 66 61 65 72 69 65 5f 66       	movabsq	$0x665f656972656166, %rcx # imm = 0x665F656972656166
1454a16fe: 48 ba 72 69 65 5f 66 69 72 65       	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1454a1708: eb 13                       	jmp	0x1454a171d <.text+0x54a071d>
1454a170a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a1710: 49 83 c1 58                 	addq	$0x58, %r9
1454a1714: 4d 39 ca                    	cmpq	%r9, %r10
1454a1717: 0f 84 eb 07 00 00           	je	0x1454a1f08 <.text+0x54a0f08>
1454a171d: 4e 8b 1c 08                 	movq	(%rax,%r9), %r11
1454a1721: 49 83 7b 08 0b              	cmpq	$0xb, 0x8(%r11)
1454a1726: 75 e8                       	jne	0x1454a1710 <.text+0x54a0710>
1454a1728: 4d 8b 1b                    	movq	(%r11), %r11
1454a172b: 49 8b 33                    	movq	(%r11), %rsi
1454a172e: 48 31 ce                    	xorq	%rcx, %rsi
1454a1731: 4d 8b 5b 03                 	movq	0x3(%r11), %r11
1454a1735: 49 31 d3                    	xorq	%rdx, %r11
1454a1738: 49 09 f3                    	orq	%rsi, %r11
1454a173b: 75 d3                       	jne	0x1454a1710 <.text+0x54a0710>
1454a173d: 4d 8b 8d 78 07 00 00        	movq	0x778(%r13), %r9
1454a1744: 4d 85 c9                    	testq	%r9, %r9
1454a1747: 0f 84 02 01 00 00           	je	0x1454a184f <.text+0x54a084f>
1454a174d: 49 8b 85 70 07 00 00        	movq	0x770(%r13), %rax
1454a1754: 49 c1 e1 04                 	shlq	$0x4, %r9
1454a1758: f3 0f 10 05 98 9d 44 00     	movss	0x449d98(%rip), %xmm0   # 0x1458eb4f8
1454a1760: f3 0f 59 c6                 	mulss	%xmm6, %xmm0
1454a1764: 4d 8d 51 f0                 	leaq	-0x10(%r9), %r10
1454a1768: 49 89 c0                    	movq	%rax, %r8
1454a176b: 49 83 fa 40                 	cmpq	$0x40, %r10
1454a176f: 0f 82 94 00 00 00           	jb	0x1454a1809 <.text+0x54a0809>
1454a1775: 49 c1 ea 04                 	shrq	$0x4, %r10
1454a1779: 49 ff c2                    	incq	%r10
1454a177c: 45 89 d0                    	movl	%r10d, %r8d
1454a177f: 41 83 e0 03                 	andl	$0x3, %r8d
1454a1783: 41 bb 04 00 00 00           	movl	$0x4, %r11d
1454a1789: 4d 0f 45 d8                 	cmovneq	%r8, %r11
1454a178d: 4d 29 da                    	subq	%r11, %r10
1454a1790: 4d 89 d0                    	movq	%r10, %r8
1454a1793: 49 c1 e0 04                 	shlq	$0x4, %r8
1454a1797: 49 01 c0                    	addq	%rax, %r8
1454a179a: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a179d: 0f c6 c8 00                 	shufps	$0x0, %xmm0, %xmm1      # xmm1 = xmm1[0,0],xmm0[0,0]
1454a17a1: 4c 8d 58 38                 	leaq	0x38(%rax), %r11
1454a17a5: 0f 28 15 24 8c 50 01        	movaps	0x1508c24(%rip), %xmm2  # 0x1469aa3d0
1454a17ac: 0f 1f 40 00                 	nopl	(%rax)
1454a17b0: f3 41 0f 10 5b d0           	movss	-0x30(%r11), %xmm3
1454a17b6: f3 41 0f 10 63 e0           	movss	-0x20(%r11), %xmm4
1454a17bc: 0f 14 dc                    	unpcklps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
1454a17bf: f3 41 0f 10 63 f0           	movss	-0x10(%r11), %xmm4
1454a17c5: f3 41 0f 10 2b              	movss	(%r11), %xmm5
1454a17ca: 0f 14 e5                    	unpcklps	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
1454a17cd: 0f 16 dc                    	movlhps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0]
1454a17d0: 0f 58 d9                    	addps	%xmm1, %xmm3
1454a17d3: 0f 5d da                    	minps	%xmm2, %xmm3
1454a17d6: 0f 28 e3                    	movaps	%xmm3, %xmm4
1454a17d9: f3 0f 16 eb                 	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
1454a17dd: 0f 28 fb                    	movaps	%xmm3, %xmm7
1454a17e0: 66 0f 15 fb                 	unpckhpd	%xmm3, %xmm7            # xmm7 = xmm7[1],xmm3[1]
1454a17e4: 0f c6 db ff                 	shufps	$0xff, %xmm3, %xmm3     # xmm3 = xmm3[3,3,3,3]
1454a17e8: f3 41 0f 11 63 d0           	movss	%xmm4, -0x30(%r11)
1454a17ee: f3 41 0f 11 6b e0           	movss	%xmm5, -0x20(%r11)
1454a17f4: f3 41 0f 11 7b f0           	movss	%xmm7, -0x10(%r11)
1454a17fa: f3 41 0f 11 1b              	movss	%xmm3, (%r11)
1454a17ff: 49 83 c3 40                 	addq	$0x40, %r11
1454a1803: 49 83 c2 fc                 	addq	$-0x4, %r10
1454a1807: 75 a7                       	jne	0x1454a17b0 <.text+0x54a07b0>
1454a1809: 4c 01 c8                    	addq	%r9, %rax
1454a180c: f3 0f 10 0d e4 9c 44 00     	movss	0x449ce4(%rip), %xmm1   # 0x1458eb4f8
1454a1814: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a1820: f3 41 0f 10 50 08           	movss	0x8(%r8), %xmm2
1454a1826: f3 0f 58 d0                 	addss	%xmm0, %xmm2
1454a182a: f3 0f 5d d1                 	minss	%xmm1, %xmm2
1454a182e: f3 41 0f 11 50 08           	movss	%xmm2, 0x8(%r8)
1454a1834: 49 83 c0 10                 	addq	$0x10, %r8
1454a1838: 49 39 c0                    	cmpq	%rax, %r8
1454a183b: 75 e3                       	jne	0x1454a1820 <.text+0x54a0820>
1454a183d: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a1844: 4d 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %r8
1454a184b: 4d 6b d0 58                 	imulq	$0x58, %r8, %r10
1454a184f: 4d 85 c0                    	testq	%r8, %r8
1454a1852: 0f 84 e1 09 00 00           	je	0x1454a2239 <.text+0x54a1239>
1454a1858: 45 31 c9                    	xorl	%r9d, %r9d
1454a185b: eb 10                       	jmp	0x1454a186d <.text+0x54a086d>
1454a185d: 0f 1f 00                    	nopl	(%rax)
1454a1860: 49 83 c1 58                 	addq	$0x58, %r9
1454a1864: 4d 39 ca                    	cmpq	%r9, %r10
1454a1867: 0f 84 9b 06 00 00           	je	0x1454a1f08 <.text+0x54a0f08>
1454a186d: 4a 8b 3c 08                 	movq	(%rax,%r9), %rdi
1454a1871: 48 83 7f 08 0b              	cmpq	$0xb, 0x8(%rdi)
1454a1876: 75 e8                       	jne	0x1454a1860 <.text+0x54a0860>
1454a1878: 4c 8b 1f                    	movq	(%rdi), %r11
1454a187b: 49 8b 33                    	movq	(%r11), %rsi
1454a187e: 48 31 ce                    	xorq	%rcx, %rsi
1454a1881: 4d 8b 5b 03                 	movq	0x3(%r11), %r11
1454a1885: 49 31 d3                    	xorq	%rdx, %r11
1454a1888: 49 09 f3                    	orq	%rsi, %r11
1454a188b: 75 d3                       	jne	0x1454a1860 <.text+0x54a0860>
1454a188d: 46 8b 74 08 18              	movl	0x18(%rax,%r9), %r14d
1454a1892: 42 8b 5c 08 40              	movl	0x40(%rax,%r9), %ebx
1454a1897: f3 0f 10 47 4c              	movss	0x4c(%rdi), %xmm0
1454a189c: f3 0f 11 85 b0 02 00 00     	movss	%xmm0, 0x2b0(%rbp)
1454a18a4: 49 8b 85 70 07 00 00        	movq	0x770(%r13), %rax
1454a18ab: 49 8b 8d 78 07 00 00        	movq	0x778(%r13), %rcx
1454a18b2: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454a18b6: 48 01 c1                    	addq	%rax, %rcx
1454a18b9: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a18c0: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a18c7: 4c 89 ad b0 00 00 00        	movq	%r13, 0xb0(%rbp)
1454a18ce: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a18d5: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a18dc: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a18e3: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a18ea: e8 41 07 09 00              	callq	0x145532030 <.text+0x5531030>
1454a18ef: 48 8b 85 d8 02 00 00        	movq	0x2d8(%rbp), %rax
1454a18f6: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a18fd: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454a1904: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a190b: 48 8b 85 e8 02 00 00        	movq	0x2e8(%rbp), %rax
1454a1912: 48 85 c0                    	testq	%rax, %rax
1454a1915: 0f 84 07 01 00 00           	je	0x1454a1a22 <.text+0x54a0a22>
1454a191b: 4c 8b a5 58 03 00 00        	movq	0x358(%rbp), %r12
1454a1922: 4d 8d 3c c4                 	leaq	(%r12,%rax,8), %r15
1454a1926: 49 8b 14 24                 	movq	(%r12), %rdx
1454a192a: 49 8b 85 78 07 00 00        	movq	0x778(%r13), %rax
1454a1931: 48 85 c0                    	testq	%rax, %rax
1454a1934: 74 2c                       	je	0x1454a1962 <.text+0x54a0962>
1454a1936: 49 8b 8d 70 07 00 00        	movq	0x770(%r13), %rcx
1454a193d: 4c 8d 49 10                 	leaq	0x10(%rcx), %r9
1454a1941: 45 31 c0                    	xorl	%r8d, %r8d
1454a1944: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a1950: 49 39 51 f0                 	cmpq	%rdx, -0x10(%r9)
1454a1954: 74 2c                       	je	0x1454a1982 <.text+0x54a0982>
1454a1956: 49 ff c0                    	incq	%r8
1454a1959: 49 83 c1 10                 	addq	$0x10, %r9
1454a195d: 4c 39 c0                    	cmpq	%r8, %rax
1454a1960: 75 ee                       	jne	0x1454a1950 <.text+0x54a0950>
1454a1962: 4c 89 e9                    	movq	%r13, %rcx
1454a1965: 41 b8 02 03 00 00           	movl	$0x302, %r8d            # imm = 0x302
1454a196b: 45 31 c9                    	xorl	%r9d, %r9d
1454a196e: e8 2d fa 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1973: 90                          	nop
1454a1974: 49 83 c4 08                 	addq	$0x8, %r12
1454a1978: 4d 39 fc                    	cmpq	%r15, %r12
1454a197b: 75 a9                       	jne	0x1454a1926 <.text+0x54a0926>
1454a197d: e9 a0 00 00 00              	jmp	0x1454a1a22 <.text+0x54a0a22>
1454a1982: 4d 8d 50 01                 	leaq	0x1(%r8), %r10
1454a1986: 49 39 c2                    	cmpq	%rax, %r10
1454a1989: 73 32                       	jae	0x1454a19bd <.text+0x54a09bd>
1454a198b: 42 8d 34 00                 	leal	(%rax,%r8), %esi
1454a198f: 4d 89 c3                    	movq	%r8, %r11
1454a1992: 40 f6 c6 01                 	testb	$0x1, %sil
1454a1996: 75 19                       	jne	0x1454a19b1 <.text+0x54a09b1>
1454a1998: 4d 89 c3                    	movq	%r8, %r11
1454a199b: 49 39 11                    	cmpq	%rdx, (%r9)
1454a199e: 74 0d                       	je	0x1454a19ad <.text+0x54a09ad>
1454a19a0: 41 0f 10 01                 	movups	(%r9), %xmm0
1454a19a4: 41 0f 11 41 f0              	movups	%xmm0, -0x10(%r9)
1454a19a9: 4d 8d 58 01                 	leaq	0x1(%r8), %r11
1454a19ad: 4d 8d 50 02                 	leaq	0x2(%r8), %r10
1454a19b1: 4c 8d 48 fe                 	leaq	-0x2(%rax), %r9
1454a19b5: 4d 39 c1                    	cmpq	%r8, %r9
1454a19b8: 4d 89 d8                    	movq	%r11, %r8
1454a19bb: 75 09                       	jne	0x1454a19c6 <.text+0x54a09c6>
1454a19bd: 4d 89 85 78 07 00 00        	movq	%r8, 0x778(%r13)
1454a19c4: eb 9c                       	jmp	0x1454a1962 <.text+0x54a0962>
1454a19c6: 4c 29 d0                    	subq	%r10, %rax
1454a19c9: 49 c1 e2 04                 	shlq	$0x4, %r10
1454a19cd: 4e 8d 0c 11                 	leaq	(%rcx,%r10), %r9
1454a19d1: 49 83 c1 10                 	addq	$0x10, %r9
1454a19d5: 4d 89 d8                    	movq	%r11, %r8
1454a19d8: eb 0a                       	jmp	0x1454a19e4 <.text+0x54a09e4>
1454a19da: 49 83 c1 20                 	addq	$0x20, %r9
1454a19de: 48 83 c0 fe                 	addq	$-0x2, %rax
1454a19e2: 74 d9                       	je	0x1454a19bd <.text+0x54a09bd>
1454a19e4: 49 39 51 f0                 	cmpq	%rdx, -0x10(%r9)
1454a19e8: 75 07                       	jne	0x1454a19f1 <.text+0x54a09f1>
1454a19ea: 49 39 11                    	cmpq	%rdx, (%r9)
1454a19ed: 74 eb                       	je	0x1454a19da <.text+0x54a09da>
1454a19ef: eb 1c                       	jmp	0x1454a1a0d <.text+0x54a0a0d>
1454a19f1: 4d 8d 51 f0                 	leaq	-0x10(%r9), %r10
1454a19f5: 4d 89 c3                    	movq	%r8, %r11
1454a19f8: 49 c1 e3 04                 	shlq	$0x4, %r11
1454a19fc: 41 0f 10 02                 	movups	(%r10), %xmm0
1454a1a00: 42 0f 11 04 19              	movups	%xmm0, (%rcx,%r11)
1454a1a05: 49 ff c0                    	incq	%r8
1454a1a08: 49 39 11                    	cmpq	%rdx, (%r9)
1454a1a0b: 74 cd                       	je	0x1454a19da <.text+0x54a09da>
1454a1a0d: 4d 89 c2                    	movq	%r8, %r10
1454a1a10: 49 c1 e2 04                 	shlq	$0x4, %r10
1454a1a14: 41 0f 10 01                 	movups	(%r9), %xmm0
1454a1a18: 42 0f 11 04 11              	movups	%xmm0, (%rcx,%r10)
1454a1a1d: 49 ff c0                    	incq	%r8
1454a1a20: eb b8                       	jmp	0x1454a19da <.text+0x54a09da>
1454a1a22: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a1a29: 48 85 d2                    	testq	%rdx, %rdx
1454a1a2c: 74 16                       	je	0x1454a1a44 <.text+0x54a0a44>
1454a1a2e: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1a32: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1a38: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a1a3f: e8 8c 07 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1a44: 8b 47 54                    	movl	0x54(%rdi), %eax
1454a1a47: 85 c0                       	testl	%eax, %eax
1454a1a49: 74 1b                       	je	0x1454a1a66 <.text+0x54a0a66>
1454a1a4b: 44 01 f3                    	addl	%r14d, %ebx
1454a1a4e: 01 c3                       	addl	%eax, %ebx
1454a1a50: 41 03 9d 8c 04 00 00        	addl	0x48c(%r13), %ebx
1454a1a57: 83 fb 03                    	cmpl	$0x3, %ebx
1454a1a5a: b8 03 00 00 00              	movl	$0x3, %eax
1454a1a5f: 0f 42 c3                    	cmovbl	%ebx, %eax
1454a1a62: 85 db                       	testl	%ebx, %ebx
1454a1a64: 75 05                       	jne	0x1454a1a6b <.text+0x54a0a6b>
1454a1a66: b8 01 00 00 00              	movl	$0x1, %eax
1454a1a6b: 41 89 c7                    	movl	%eax, %r15d
1454a1a6e: 4d 39 bd 78 07 00 00        	cmpq	%r15, 0x778(%r13)
1454a1a75: 0f 83 4b 01 00 00           	jae	0x1454a1bc6 <.text+0x54a0bc6>
1454a1a7b: 4d 8d a5 e8 03 00 00        	leaq	0x3e8(%r13), %r12
1454a1a82: 48 8d bd a0 00 00 00        	leaq	0xa0(%rbp), %rdi
1454a1a89: 48 8d 9d 30 02 00 00        	leaq	0x230(%rbp), %rbx
1454a1a90: eb 18                       	jmp	0x1454a1aaa <.text+0x54a0aaa>
1454a1a92: 4c 89 e9                    	movq	%r13, %rcx
1454a1a95: 4c 89 f2                    	movq	%r14, %rdx
1454a1a98: e8 73 5d 03 00              	callq	0x1454d7810 <.text+0x54d6810>
1454a1a9d: 4d 39 bd 78 07 00 00        	cmpq	%r15, 0x778(%r13)
1454a1aa4: 0f 83 1c 01 00 00           	jae	0x1454a1bc6 <.text+0x54a0bc6>
1454a1aaa: 41 8b 44 24 08              	movl	0x8(%r12), %eax
1454a1aaf: 89 85 38 02 00 00           	movl	%eax, 0x238(%rbp)
1454a1ab5: 49 8b 04 24                 	movq	(%r12), %rax
1454a1ab9: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
1454a1ac0: f3 0f 10 9d b0 02 00 00     	movss	0x2b0(%rbp), %xmm3
1454a1ac8: 48 89 f9                    	movq	%rdi, %rcx
1454a1acb: 4c 89 ea                    	movq	%r13, %rdx
1454a1ace: 49 89 d8                    	movq	%rbx, %r8
1454a1ad1: e8 7a 3e 03 00              	callq	0x1454d5950 <.text+0x54d4950>
1454a1ad6: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a1add: 48 83 bd b0 00 00 00 00     	cmpq	$0x0, 0xb0(%rbp)
1454a1ae5: 0f 84 c0 00 00 00           	je	0x1454a1bab <.text+0x54a0bab>
1454a1aeb: 4c 8b 31                    	movq	(%rcx), %r14
1454a1aee: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a1af5: 48 85 d2                    	testq	%rdx, %rdx
1454a1af8: 74 98                       	je	0x1454a1a92 <.text+0x54a0a92>
1454a1afa: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1afe: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1b04: e8 c7 06 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1b09: eb 87                       	jmp	0x1454a1a92 <.text+0x54a0a92>
1454a1b0b: 4d 8d 58 01                 	leaq	0x1(%r8), %r11
1454a1b0f: 49 39 c3                    	cmpq	%rax, %r11
1454a1b12: 0f 83 2b 05 00 00           	jae	0x1454a2043 <.text+0x54a1043>
1454a1b18: 4c 89 c2                    	movq	%r8, %rdx
1454a1b1b: 48 29 c2                    	subq	%rax, %rdx
1454a1b1e: 4c 8d 52 02                 	leaq	0x2(%rdx), %r10
1454a1b22: f6 c2 01                    	testb	$0x1, %dl
1454a1b25: 0f 85 2d 05 00 00           	jne	0x1454a2058 <.text+0x54a1058>
1454a1b2b: f3 41 0f 10 01              	movss	(%r9), %xmm0
1454a1b30: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a1b33: 4c 89 c2                    	movq	%r8, %rdx
1454a1b36: 76 18                       	jbe	0x1454a1b50 <.text+0x54a0b50>
1454a1b38: 49 8d 51 f0                 	leaq	-0x10(%r9), %rdx
1454a1b3c: 4c 8b 5a 10                 	movq	0x10(%rdx), %r11
1454a1b40: 4d 89 59 e8                 	movq	%r11, -0x18(%r9)
1454a1b44: 0f 10 02                    	movups	(%rdx), %xmm0
1454a1b47: 41 0f 11 41 d8              	movups	%xmm0, -0x28(%r9)
1454a1b4c: 49 8d 50 01                 	leaq	0x1(%r8), %rdx
1454a1b50: 49 83 c0 02                 	addq	$0x2, %r8
1454a1b54: 4d 89 c3                    	movq	%r8, %r11
1454a1b57: 49 89 d0                    	movq	%rdx, %r8
1454a1b5a: e9 f9 04 00 00              	jmp	0x1454a2058 <.text+0x54a1058>
1454a1b5f: 4d 8d 58 01                 	leaq	0x1(%r8), %r11
1454a1b63: 49 39 cb                    	cmpq	%rcx, %r11
1454a1b66: 0f 83 e3 04 00 00           	jae	0x1454a204f <.text+0x54a104f>
1454a1b6c: 4c 89 c2                    	movq	%r8, %rdx
1454a1b6f: 48 29 ca                    	subq	%rcx, %rdx
1454a1b72: 4c 8d 52 02                 	leaq	0x2(%rdx), %r10
1454a1b76: f6 c2 01                    	testb	$0x1, %dl
1454a1b79: 0f 85 61 05 00 00           	jne	0x1454a20e0 <.text+0x54a10e0>
1454a1b7f: f3 41 0f 10 09              	movss	(%r9), %xmm1
1454a1b84: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a1b87: 4c 89 c2                    	movq	%r8, %rdx
1454a1b8a: 76 10                       	jbe	0x1454a1b9c <.text+0x54a0b9c>
1454a1b8c: 49 8d 51 f4                 	leaq	-0xc(%r9), %rdx
1454a1b90: 0f 10 0a                    	movups	(%rdx), %xmm1
1454a1b93: 41 0f 11 49 e4              	movups	%xmm1, -0x1c(%r9)
1454a1b98: 49 8d 50 01                 	leaq	0x1(%r8), %rdx
1454a1b9c: 49 83 c0 02                 	addq	$0x2, %r8
1454a1ba0: 4d 89 c3                    	movq	%r8, %r11
1454a1ba3: 49 89 d0                    	movq	%rdx, %r8
1454a1ba6: e9 35 05 00 00              	jmp	0x1454a20e0 <.text+0x54a10e0>
1454a1bab: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a1bb2: 48 85 d2                    	testq	%rdx, %rdx
1454a1bb5: 74 0f                       	je	0x1454a1bc6 <.text+0x54a0bc6>
1454a1bb7: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1bbb: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1bc1: e8 0a 06 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1bc6: 41 8b 85 f0 03 00 00        	movl	0x3f0(%r13), %eax
1454a1bcd: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
1454a1bd3: 49 8b 85 e8 03 00 00        	movq	0x3e8(%r13), %rax
1454a1bda: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a1be1: f3 0f 10 9d b0 02 00 00     	movss	0x2b0(%rbp), %xmm3
1454a1be9: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a1bf0: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454a1bf7: 4c 89 ea                    	movq	%r13, %rdx
1454a1bfa: e8 51 3d 03 00              	callq	0x1454d5950 <.text+0x54d4950>
1454a1bff: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a1c06: 48 83 bd 40 02 00 00 00     	cmpq	$0x0, 0x240(%rbp)
1454a1c0e: 0f 84 1c 02 00 00           	je	0x1454a1e30 <.text+0x54a0e30>
1454a1c14: 4c 89 e8                    	movq	%r13, %rax
1454a1c17: 49 81 c5 e8 03 00 00        	addq	$0x3e8, %r13            # imm = 0x3E8
1454a1c1e: 48 8d b8 68 07 00 00        	leaq	0x768(%rax), %rdi
1454a1c25: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a1c2c: 4c 8d b5 30 02 00 00        	leaq	0x230(%rbp), %r14
1454a1c33: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1c3d: 4c 8b 39                    	movq	(%rcx), %r15
1454a1c40: 4c 8b 8d 68 03 00 00        	movq	0x368(%rbp), %r9
1454a1c47: 49 8b 81 70 07 00 00        	movq	0x770(%r9), %rax
1454a1c4e: 4d 8b 81 78 07 00 00        	movq	0x778(%r9), %r8
1454a1c55: 4c 89 c2                    	movq	%r8, %rdx
1454a1c58: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454a1c5c: 48 01 c2                    	addq	%rax, %rdx
1454a1c5f: 48 89 95 a8 00 00 00        	movq	%rdx, 0xa8(%rbp)
1454a1c66: 4c 89 8d b0 00 00 00        	movq	%r9, 0xb0(%rbp)
1454a1c6d: 4d 85 c0                    	testq	%r8, %r8
1454a1c70: 0f 84 c4 01 00 00           	je	0x1454a1e3a <.text+0x54a0e3a>
1454a1c76: 48 8d 50 10                 	leaq	0x10(%rax), %rdx
1454a1c7a: 48 89 95 a0 00 00 00        	movq	%rdx, 0xa0(%rbp)
1454a1c81: 4c 8b 00                    	movq	(%rax), %r8
1454a1c84: 49 8b 81 c8 04 00 00        	movq	0x4c8(%r9), %rax
1454a1c8b: 49 69 91 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r9), %rdx # imm = 0x160
1454a1c96: 45 31 d2                    	xorl	%r10d, %r10d
1454a1c99: 49 89 c1                    	movq	%rax, %r9
1454a1c9c: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
1454a1ca3: 4c 39 d2                    	cmpq	%r10, %rdx
1454a1ca6: 74 2c                       	je	0x1454a1cd4 <.text+0x54a0cd4>
1454a1ca8: 49 81 c2 60 01 00 00        	addq	$0x160, %r10            # imm = 0x160
1454a1caf: 4d 39 81 88 00 00 00        	cmpq	%r8, 0x88(%r9)
1454a1cb6: 4d 8d 89 60 01 00 00        	leaq	0x160(%r9), %r9
1454a1cbd: 75 e4                       	jne	0x1454a1ca3 <.text+0x54a0ca3>
1454a1cbf: 4a 83 bc 10 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%r10)
1454a1cc8: 0f 95 c2                    	setne	%dl
1454a1ccb: 00 d2                       	addb	%dl, %dl
1454a1ccd: 42 0a 54 10 f8              	orb	-0x8(%rax,%r10), %dl
1454a1cd2: eb 02                       	jmp	0x1454a1cd6 <.text+0x54a0cd6>
1454a1cd4: 31 d2                       	xorl	%edx, %edx
1454a1cd6: 48 89 d9                    	movq	%rbx, %rcx
1454a1cd9: e8 72 10 07 00              	callq	0x145512d50 <.text+0x5511d50>
1454a1cde: 90                          	nop
1454a1cdf: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a1ce6: 48 8b 81 c8 04 00 00        	movq	0x4c8(%rcx), %rax
1454a1ced: 4c 69 99 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rcx), %r11 # imm = 0x160
1454a1cf8: 45 31 c9                    	xorl	%r9d, %r9d
1454a1cfb: 49 89 c0                    	movq	%rax, %r8
1454a1cfe: 4d 39 cb                    	cmpq	%r9, %r11
1454a1d01: 74 2e                       	je	0x1454a1d31 <.text+0x54a0d31>
1454a1d03: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
1454a1d0a: 49 39 90 88 00 00 00        	cmpq	%rdx, 0x88(%r8)
1454a1d11: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a1d18: 75 e4                       	jne	0x1454a1cfe <.text+0x54a0cfe>
1454a1d1a: 4a 83 bc 08 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%r9)
1454a1d23: 41 0f 95 c0                 	setne	%r8b
1454a1d27: 45 00 c0                    	addb	%r8b, %r8b
1454a1d2a: 46 0a 44 08 f8              	orb	-0x8(%rax,%r9), %r8b
1454a1d2f: eb 03                       	jmp	0x1454a1d34 <.text+0x54a0d34>
1454a1d31: 45 31 c0                    	xorl	%r8d, %r8d
1454a1d34: 45 31 c9                    	xorl	%r9d, %r9d
1454a1d37: 49 89 c2                    	movq	%rax, %r10
1454a1d3a: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a1d41: 4d 39 cb                    	cmpq	%r9, %r11
1454a1d44: 0f 84 f0 00 00 00           	je	0x1454a1e3a <.text+0x54a0e3a>
1454a1d4a: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
1454a1d51: 4d 39 ba 88 00 00 00        	cmpq	%r15, 0x88(%r10)
1454a1d58: 4d 8d 92 60 01 00 00        	leaq	0x160(%r10), %r10
1454a1d5f: 75 e0                       	jne	0x1454a1d41 <.text+0x54a0d41>
1454a1d61: 4a 83 bc 08 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%r9)
1454a1d6a: 41 0f 95 c2                 	setne	%r10b
1454a1d6e: 45 00 d2                    	addb	%r10b, %r10b
1454a1d71: 46 0a 54 08 f8              	orb	-0x8(%rax,%r9), %r10b
1454a1d76: 45 38 d0                    	cmpb	%r10b, %r8b
1454a1d79: 0f 83 bb 00 00 00           	jae	0x1454a1e3a <.text+0x54a0e3a>
1454a1d7f: 48 89 95 a0 00 00 00        	movq	%rdx, 0xa0(%rbp)
1454a1d86: 48 89 f9                    	movq	%rdi, %rcx
1454a1d89: 49 89 d4                    	movq	%rdx, %r12
1454a1d8c: 48 89 da                    	movq	%rbx, %rdx
1454a1d8f: e8 8c 25 08 00              	callq	0x145524320 <.text+0x5523320>
1454a1d94: 90                          	nop
1454a1d95: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a1d9c: 4c 89 e2                    	movq	%r12, %rdx
1454a1d9f: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1da9: 41 b8 02 03 00 00           	movl	$0x302, %r8d            # imm = 0x302
1454a1daf: 45 31 c9                    	xorl	%r9d, %r9d
1454a1db2: e8 e9 f5 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1db7: 90                          	nop
1454a1db8: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a1dbf: 4c 89 fa                    	movq	%r15, %rdx
1454a1dc2: e8 49 5a 03 00              	callq	0x1454d7810 <.text+0x54d6810>
1454a1dc7: 90                          	nop
1454a1dc8: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a1dcf: 48 85 d2                    	testq	%rdx, %rdx
1454a1dd2: 74 16                       	je	0x1454a1dea <.text+0x54a0dea>
1454a1dd4: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1dd8: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1dde: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a1de5: e8 e6 03 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1dea: 41 8b 45 08                 	movl	0x8(%r13), %eax
1454a1dee: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
1454a1df4: 49 8b 45 00                 	movq	(%r13), %rax
1454a1df8: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a1dff: f3 0f 10 9d b0 02 00 00     	movss	0x2b0(%rbp), %xmm3
1454a1e07: 4c 89 f1                    	movq	%r14, %rcx
1454a1e0a: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a1e11: 49 89 d8                    	movq	%rbx, %r8
1454a1e14: e8 37 3b 03 00              	callq	0x1454d5950 <.text+0x54d4950>
1454a1e19: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a1e20: 48 83 bd 40 02 00 00 00     	cmpq	$0x0, 0x240(%rbp)
1454a1e28: 0f 85 0f fe ff ff           	jne	0x1454a1c3d <.text+0x54a0c3d>
1454a1e2e: eb 0a                       	jmp	0x1454a1e3a <.text+0x54a0e3a>
1454a1e30: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a1e3a: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a1e41: 48 85 d2                    	testq	%rdx, %rdx
1454a1e44: 74 0f                       	je	0x1454a1e55 <.text+0x54a0e55>
1454a1e46: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1e4a: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1e50: e8 7b 03 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1e55: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a1e5c: 49 8b 95 70 07 00 00        	movq	0x770(%r13), %rdx
1454a1e63: 4d 8b 85 78 07 00 00        	movq	0x778(%r13), %r8
1454a1e6a: 49 c1 e0 04                 	shlq	$0x4, %r8
1454a1e6e: 49 01 d0                    	addq	%rdx, %r8
1454a1e71: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a1e78: e8 73 58 09 00              	callq	0x1455376f0 <.text+0x55366f0>
1454a1e7d: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454a1e84: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a1e8b: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1454a1e92: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a1e99: 48 8b bd b0 00 00 00        	movq	0xb0(%rbp), %rdi
1454a1ea0: 48 c1 e7 03                 	shlq	$0x3, %rdi
1454a1ea4: 31 db                       	xorl	%ebx, %ebx
1454a1ea6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a1eb0: 48 39 df                    	cmpq	%rbx, %rdi
1454a1eb3: 74 23                       	je	0x1454a1ed8 <.text+0x54a0ed8>
1454a1eb5: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a1ebc: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
1454a1ec0: 48 83 c3 08                 	addq	$0x8, %rbx
1454a1ec4: 4c 89 e9                    	movq	%r13, %rcx
1454a1ec7: 41 b8 02 03 00 00           	movl	$0x302, %r8d            # imm = 0x302
1454a1ecd: 41 b1 01                    	movb	$0x1, %r9b
1454a1ed0: e8 cb f4 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a1ed5: 90                          	nop
1454a1ed6: eb d8                       	jmp	0x1454a1eb0 <.text+0x54a0eb0>
1454a1ed8: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a1edf: 48 85 d2                    	testq	%rdx, %rdx
1454a1ee2: 74 16                       	je	0x1454a1efa <.text+0x54a0efa>
1454a1ee4: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a1ee8: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a1eee: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a1ef5: e8 d6 02 b6 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a1efa: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a1f01: 4d 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %r8
1454a1f08: 4d 85 c0                    	testq	%r8, %r8
1454a1f0b: 0f 84 28 03 00 00           	je	0x1454a2239 <.text+0x54a1239>
1454a1f11: 49 6b c8 58                 	imulq	$0x58, %r8, %rcx
1454a1f15: 45 31 c0                    	xorl	%r8d, %r8d
1454a1f18: 48 ba 6c 69 67 68 74 77 65 6c       	movabsq	$0x6c6577746867696c, %rdx # imm = 0x6C6577746867696C
1454a1f22: eb 15                       	jmp	0x1454a1f39 <.text+0x54a0f39>
1454a1f24: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a1f30: 49 83 c0 58                 	addq	$0x58, %r8
1454a1f34: 4c 39 c1                    	cmpq	%r8, %rcx
1454a1f37: 74 24                       	je	0x1454a1f5d <.text+0x54a0f5d>
1454a1f39: 4e 8b 0c 00                 	movq	(%rax,%r8), %r9
1454a1f3d: 49 83 79 08 09              	cmpq	$0x9, 0x8(%r9)
1454a1f42: 75 ec                       	jne	0x1454a1f30 <.text+0x54a0f30>
1454a1f44: 4d 8b 09                    	movq	(%r9), %r9
1454a1f47: 4d 8b 11                    	movq	(%r9), %r10
1454a1f4a: 49 31 d2                    	xorq	%rdx, %r10
1454a1f4d: 45 0f b6 49 08              	movzbl	0x8(%r9), %r9d
1454a1f52: 49 83 f1 6c                 	xorq	$0x6c, %r9
1454a1f56: 4d 09 d1                    	orq	%r10, %r9
1454a1f59: 75 d5                       	jne	0x1454a1f30 <.text+0x54a0f30>
1454a1f5b: eb 0e                       	jmp	0x1454a1f6b <.text+0x54a0f6b>
1454a1f5d: 49 83 bd 90 07 00 00 00     	cmpq	$0x0, 0x790(%r13)
1454a1f65: 0f 84 fa 12 00 00           	je	0x1454a3265 <.text+0x54a2265>
1454a1f6b: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a1f74: f3 0f 11 85 00 02 00 00     	movss	%xmm0, 0x200(%rbp)
1454a1f7c: 45 31 c0                    	xorl	%r8d, %r8d
1454a1f7f: eb 1c                       	jmp	0x1454a1f9d <.text+0x54a0f9d>
1454a1f81: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a1f90: 49 83 c0 58                 	addq	$0x58, %r8
1454a1f94: 4c 39 c1                    	cmpq	%r8, %rcx
1454a1f97: 0f 84 bb 02 00 00           	je	0x1454a2258 <.text+0x54a1258>
1454a1f9d: 4e 8b 0c 00                 	movq	(%rax,%r8), %r9
1454a1fa1: 49 83 79 08 09              	cmpq	$0x9, 0x8(%r9)
1454a1fa6: 75 e8                       	jne	0x1454a1f90 <.text+0x54a0f90>
1454a1fa8: 4d 8b 11                    	movq	(%r9), %r10
1454a1fab: 4d 8b 1a                    	movq	(%r10), %r11
1454a1fae: 49 31 d3                    	xorq	%rdx, %r11
1454a1fb1: 45 0f b6 52 08              	movzbl	0x8(%r10), %r10d
1454a1fb6: 49 83 f2 6c                 	xorq	$0x6c, %r10
1454a1fba: 4d 09 da                    	orq	%r11, %r10
1454a1fbd: 75 d1                       	jne	0x1454a1f90 <.text+0x54a0f90>
1454a1fbf: 42 8b 4c 00 08              	movl	0x8(%rax,%r8), %ecx
1454a1fc4: f3 42 0f 10 44 00 14        	movss	0x14(%rax,%r8), %xmm0
1454a1fcb: 42 8b 54 00 18              	movl	0x18(%rax,%r8), %edx
1454a1fd0: f2 42 0f 10 4c 00 0c        	movsd	0xc(%rax,%r8), %xmm1
1454a1fd7: f2 42 0f 10 54 00 1c        	movsd	0x1c(%rax,%r8), %xmm2
1454a1fde: 46 8b 54 00 34              	movl	0x34(%rax,%r8), %r10d
1454a1fe3: 44 89 95 64 02 00 00        	movl	%r10d, 0x264(%rbp)
1454a1fea: 42 0f 10 5c 00 24           	movups	0x24(%rax,%r8), %xmm3
1454a1ff0: 0f 11 9d 54 02 00 00        	movups	%xmm3, 0x254(%rbp)
1454a1ff7: 42 0f 10 5c 00 38           	movups	0x38(%rax,%r8), %xmm3
1454a1ffd: f3 42 0f 6f 64 00 44        	movdqu	0x44(%rax,%r8), %xmm4
1454a2004: f3 0f 7f a5 74 02 00 00     	movdqu	%xmm4, 0x274(%rbp)
1454a200c: 0f 11 9d 68 02 00 00        	movups	%xmm3, 0x268(%rbp)
1454a2013: 4c 89 8d 30 02 00 00        	movq	%r9, 0x230(%rbp)
1454a201a: 89 8d 38 02 00 00           	movl	%ecx, 0x238(%rbp)
1454a2020: f2 0f 11 8d 3c 02 00 00     	movsd	%xmm1, 0x23c(%rbp)
1454a2028: f3 0f 11 85 44 02 00 00     	movss	%xmm0, 0x244(%rbp)
1454a2030: 89 95 48 02 00 00           	movl	%edx, 0x248(%rbp)
1454a2036: f2 0f 11 95 4c 02 00 00     	movsd	%xmm2, 0x24c(%rbp)
1454a203e: e9 20 02 00 00              	jmp	0x1454a2263 <.text+0x54a1263>
1454a2043: 4d 89 85 00 03 00 00        	movq	%r8, 0x300(%r13)
1454a204a: e9 cf bb ff ff              	jmp	0x14549dc1e <.text+0x549cc1e>
1454a204f: 4d 89 45 60                 	movq	%r8, 0x60(%r13)
1454a2053: e9 46 d0 ff ff              	jmp	0x14549f09e <.text+0x549e09e>
1454a2058: 4d 85 d2                    	testq	%r10, %r10
1454a205b: 74 77                       	je	0x1454a20d4 <.text+0x54a10d4>
1454a205d: 4b 8d 14 5b                 	leaq	(%r11,%r11,2), %rdx
1454a2061: 4c 8d 0c d1                 	leaq	(%rcx,%rdx,8), %r9
1454a2065: 49 83 c1 28                 	addq	$0x28, %r9
1454a2069: 4c 29 d8                    	subq	%r11, %rax
1454a206c: 4c 89 c2                    	movq	%r8, %rdx
1454a206f: eb 0a                       	jmp	0x1454a207b <.text+0x54a107b>
1454a2071: 49 83 c1 30                 	addq	$0x30, %r9
1454a2075: 48 83 c0 fe                 	addq	$-0x2, %rax
1454a2079: 74 59                       	je	0x1454a20d4 <.text+0x54a10d4>
1454a207b: f3 41 0f 10 41 e8           	movss	-0x18(%r9), %xmm0
1454a2081: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a2084: 76 29                       	jbe	0x1454a20af <.text+0x54a10af>
1454a2086: 4d 8d 41 d8                 	leaq	-0x28(%r9), %r8
1454a208a: 4c 8d 14 52                 	leaq	(%rdx,%rdx,2), %r10
1454a208e: 4d 8b 58 10                 	movq	0x10(%r8), %r11
1454a2092: 4e 89 5c d1 10              	movq	%r11, 0x10(%rcx,%r10,8)
1454a2097: 41 0f 10 00                 	movups	(%r8), %xmm0
1454a209b: 42 0f 11 04 d1              	movups	%xmm0, (%rcx,%r10,8)
1454a20a0: 48 ff c2                    	incq	%rdx
1454a20a3: f3 41 0f 10 01              	movss	(%r9), %xmm0
1454a20a8: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a20ab: 76 c4                       	jbe	0x1454a2071 <.text+0x54a1071>
1454a20ad: eb 0a                       	jmp	0x1454a20b9 <.text+0x54a10b9>
1454a20af: f3 41 0f 10 01              	movss	(%r9), %xmm0
1454a20b4: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a20b7: 76 b8                       	jbe	0x1454a2071 <.text+0x54a1071>
1454a20b9: 4c 8d 04 52                 	leaq	(%rdx,%rdx,2), %r8
1454a20bd: 4d 8b 11                    	movq	(%r9), %r10
1454a20c0: 4e 89 54 c1 10              	movq	%r10, 0x10(%rcx,%r8,8)
1454a20c5: 41 0f 10 41 f0              	movups	-0x10(%r9), %xmm0
1454a20ca: 42 0f 11 04 c1              	movups	%xmm0, (%rcx,%r8,8)
1454a20cf: 48 ff c2                    	incq	%rdx
1454a20d2: eb 9d                       	jmp	0x1454a2071 <.text+0x54a1071>
1454a20d4: 49 89 95 00 03 00 00        	movq	%rdx, 0x300(%r13)
1454a20db: e9 3e bb ff ff              	jmp	0x14549dc1e <.text+0x549cc1e>
1454a20e0: 4d 85 d2                    	testq	%r10, %r10
1454a20e3: 74 6c                       	je	0x1454a2151 <.text+0x54a1151>
1454a20e5: 4c 29 d9                    	subq	%r11, %rcx
1454a20e8: 49 c1 e3 04                 	shlq	$0x4, %r11
1454a20ec: 4d 8d 0c 03                 	leaq	(%r11,%rax), %r9
1454a20f0: 49 83 c1 1c                 	addq	$0x1c, %r9
1454a20f4: 4c 89 c2                    	movq	%r8, %rdx
1454a20f7: eb 0a                       	jmp	0x1454a2103 <.text+0x54a1103>
1454a20f9: 49 83 c1 20                 	addq	$0x20, %r9
1454a20fd: 48 83 c1 fe                 	addq	$-0x2, %rcx
1454a2101: 74 4e                       	je	0x1454a2151 <.text+0x54a1151>
1454a2103: f3 41 0f 10 49 f0           	movss	-0x10(%r9), %xmm1
1454a2109: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a210c: 76 23                       	jbe	0x1454a2131 <.text+0x54a1131>
1454a210e: 4d 8d 41 e4                 	leaq	-0x1c(%r9), %r8
1454a2112: 49 89 d2                    	movq	%rdx, %r10
1454a2115: 49 c1 e2 04                 	shlq	$0x4, %r10
1454a2119: 41 0f 10 08                 	movups	(%r8), %xmm1
1454a211d: 42 0f 11 0c 10              	movups	%xmm1, (%rax,%r10)
1454a2122: 48 ff c2                    	incq	%rdx
1454a2125: f3 41 0f 10 09              	movss	(%r9), %xmm1
1454a212a: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a212d: 76 ca                       	jbe	0x1454a20f9 <.text+0x54a10f9>
1454a212f: eb 0a                       	jmp	0x1454a213b <.text+0x54a113b>
1454a2131: f3 41 0f 10 09              	movss	(%r9), %xmm1
1454a2136: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a2139: 76 be                       	jbe	0x1454a20f9 <.text+0x54a10f9>
1454a213b: 49 89 d0                    	movq	%rdx, %r8
1454a213e: 49 c1 e0 04                 	shlq	$0x4, %r8
1454a2142: 41 0f 10 49 f4              	movups	-0xc(%r9), %xmm1
1454a2147: 42 0f 11 0c 00              	movups	%xmm1, (%rax,%r8)
1454a214c: 48 ff c2                    	incq	%rdx
1454a214f: eb a8                       	jmp	0x1454a20f9 <.text+0x54a10f9>
1454a2151: 49 89 55 60                 	movq	%rdx, 0x60(%r13)
1454a2155: e9 44 cf ff ff              	jmp	0x14549f09e <.text+0x549e09e>
1454a215a: 49 83 ff 01                 	cmpq	$0x1, %r15
1454a215e: 75 7f                       	jne	0x1454a21df <.text+0x54a11df>
1454a2160: 49 69 c5 60 01 00 00        	imulq	$0x160, %r13, %rax      # imm = 0x160
1454a2167: 31 d2                       	xorl	%edx, %edx
1454a2169: 4c 89 e1                    	movq	%r12, %rcx
1454a216c: 48 39 d0                    	cmpq	%rdx, %rax
1454a216f: 74 2c                       	je	0x1454a219d <.text+0x54a119d>
1454a2171: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
1454a2178: 48 39 b9 88 00 00 00        	cmpq	%rdi, 0x88(%rcx)
1454a217f: 48 8d 89 60 01 00 00        	leaq	0x160(%rcx), %rcx
1454a2186: 75 e4                       	jne	0x1454a216c <.text+0x54a116c>
1454a2188: 49 83 bc 14 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%r12,%rdx)
1454a2191: 0f 95 c1                    	setne	%cl
1454a2194: 00 c9                       	addb	%cl, %cl
1454a2196: 41 0a 4c 14 f8              	orb	-0x8(%r12,%rdx), %cl
1454a219b: eb 02                       	jmp	0x1454a219f <.text+0x54a119f>
1454a219d: 31 c9                       	xorl	%ecx, %ecx
1454a219f: 31 d2                       	xorl	%edx, %edx
1454a21a1: 4d 89 e0                    	movq	%r12, %r8
1454a21a4: 48 39 d0                    	cmpq	%rdx, %rax
1454a21a7: 74 2c                       	je	0x1454a21d5 <.text+0x54a11d5>
1454a21a9: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
1454a21b0: 4d 39 b0 88 00 00 00        	cmpq	%r14, 0x88(%r8)
1454a21b7: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a21be: 75 e4                       	jne	0x1454a21a4 <.text+0x54a11a4>
1454a21c0: 49 83 bc 14 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%r12,%rdx)
1454a21c9: 0f 95 c0                    	setne	%al
1454a21cc: 00 c0                       	addb	%al, %al
1454a21ce: 41 0a 44 14 f8              	orb	-0x8(%r12,%rdx), %al
1454a21d3: eb 02                       	jmp	0x1454a21d7 <.text+0x54a11d7>
1454a21d5: 31 c0                       	xorl	%eax, %eax
1454a21d7: 38 c1                       	cmpb	%al, %cl
1454a21d9: 0f 87 84 f3 ff ff           	ja	0x1454a1563 <.text+0x54a0563>
1454a21df: 49 69 cd 60 01 00 00        	imulq	$0x160, %r13, %rcx      # imm = 0x160
1454a21e6: 31 c0                       	xorl	%eax, %eax
1454a21e8: 4c 89 e2                    	movq	%r12, %rdx
1454a21eb: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a21f2: 48 39 c1                    	cmpq	%rax, %rcx
1454a21f5: 74 1d                       	je	0x1454a2214 <.text+0x54a1214>
1454a21f7: 48 05 60 01 00 00           	addq	$0x160, %rax            # imm = 0x160
1454a21fd: 4c 39 b2 88 00 00 00        	cmpq	%r14, 0x88(%rdx)
1454a2204: 48 8d 92 60 01 00 00        	leaq	0x160(%rdx), %rdx
1454a220b: 75 e5                       	jne	0x1454a21f2 <.text+0x54a11f2>
1454a220d: f3 41 0f 11 7c 04 dc        	movss	%xmm7, -0x24(%r12,%rax)
1454a2214: 44 8b 43 40                 	movl	0x40(%rbx), %r8d
1454a2218: 4c 89 e9                    	movq	%r13, %rcx
1454a221b: 4c 89 f2                    	movq	%r14, %rdx
1454a221e: 41 b1 01                    	movb	$0x1, %r9b
1454a2221: e8 7a f1 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a2226: 49 89 f4                    	movq	%rsi, %r12
1454a2229: 4d 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %r8
1454a2230: 4d 85 c0                    	testq	%r8, %r8
1454a2233: 0f 85 ad f4 ff ff           	jne	0x1454a16e6 <.text+0x54a06e6>
1454a2239: 49 83 bd 90 07 00 00 00     	cmpq	$0x0, 0x790(%r13)
1454a2241: 0f 84 1e 10 00 00           	je	0x1454a3265 <.text+0x54a2265>
1454a2247: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a2250: f3 0f 11 85 00 02 00 00     	movss	%xmm0, 0x200(%rbp)
1454a2258: 48 c7 85 30 02 00 00 00 00 00 00    	movq	$0x0, 0x230(%rbp)
1454a2263: 49 8d b5 80 07 00 00        	leaq	0x780(%r13), %rsi
1454a226a: 49 8b 85 88 07 00 00        	movq	0x788(%r13), %rax
1454a2271: 49 8b 8d 90 07 00 00        	movq	0x790(%r13), %rcx
1454a2278: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a227c: 48 01 c1                    	addq	%rax, %rcx
1454a227f: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a2286: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a228d: 4c 8d bd 00 02 00 00        	leaq	0x200(%rbp), %r15
1454a2294: 4c 89 bd b0 00 00 00        	movq	%r15, 0xb0(%rbp)
1454a229b: 48 8d 85 30 02 00 00        	leaq	0x230(%rbp), %rax
1454a22a2: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a22a9: 48 8d 4d 68                 	leaq	0x68(%rbp), %rcx
1454a22ad: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a22b4: e8 67 f6 08 00              	callq	0x145531920 <.text+0x5530920>
1454a22b9: 48 8b 5d 78                 	movq	0x78(%rbp), %rbx
1454a22bd: 48 85 db                    	testq	%rbx, %rbx
1454a22c0: 48 89 75 f8                 	movq	%rsi, -0x8(%rbp)
1454a22c4: 0f 84 18 01 00 00           	je	0x1454a23e2 <.text+0x54a13e2>
1454a22ca: c6 85 57 03 00 00 01        	movb	$0x1, 0x357(%rbp)
1454a22d1: 48 8d 55 68                 	leaq	0x68(%rbp), %rdx
1454a22d5: 48 89 f1                    	movq	%rsi, %rcx
1454a22d8: e8 a3 14 08 00              	callq	0x145523780 <.text+0x5522780>
1454a22dd: 90                          	nop
1454a22de: 48 8b 45 68                 	movq	0x68(%rbp), %rax
1454a22e2: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a22e9: 48 8b 45 70                 	movq	0x70(%rbp), %rax
1454a22ed: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a22f4: 48 c1 e3 03                 	shlq	$0x3, %rbx
1454a22f8: 49 8d bd 38 05 00 00        	leaq	0x538(%r13), %rdi
1454a22ff: 45 31 f6                    	xorl	%r14d, %r14d
1454a2302: eb 51                       	jmp	0x1454a2355 <.text+0x54a1355>
1454a2304: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a2310: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a2317: 48 89 f1                    	movq	%rsi, %rcx
1454a231a: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a231e: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454a2326: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a232d: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
1454a2332: 48 c7 44 08 10 08 00 00 00  	movq	$0x8, 0x10(%rax,%rcx)
1454a233b: 66 c7 44 08 18 aa 00        	movw	$0xaa, 0x18(%rax,%rcx)
1454a2342: 48 ff c6                    	incq	%rsi
1454a2345: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a234c: 49 83 c6 08                 	addq	$0x8, %r14
1454a2350: 4c 39 f3                    	cmpq	%r14, %rbx
1454a2353: 74 59                       	je	0x1454a23ae <.text+0x54a13ae>
1454a2355: 48 8b 85 40 03 00 00        	movq	0x340(%rbp), %rax
1454a235c: 4a 8b 34 30                 	movq	(%rax,%r14), %rsi
1454a2360: 48 85 f6                    	testq	%rsi, %rsi
1454a2363: 74 e7                       	je	0x1454a234c <.text+0x54a134c>
1454a2365: e8 96 fe b5 fa              	callq	0x140002200 <.text+0x1200>
1454a236a: b9 20 00 00 00              	movl	$0x20, %ecx
1454a236f: ba 01 00 00 00              	movl	$0x1, %edx
1454a2374: e8 47 fe b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a2379: 48 85 c0                    	testq	%rax, %rax
1454a237c: 0f 84 47 88 00 00           	je	0x1454aabc9 <.text+0x54a9bc9>
1454a2382: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a2389: 48 89 30                    	movq	%rsi, (%rax)
1454a238c: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a2393: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a239a: 0f 85 70 ff ff ff           	jne	0x1454a2310 <.text+0x54a1310>
1454a23a0: 48 89 f9                    	movq	%rdi, %rcx
1454a23a3: e8 08 5d 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a23a8: 90                          	nop
1454a23a9: e9 62 ff ff ff              	jmp	0x1454a2310 <.text+0x54a1310>
1454a23ae: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a23b5: 48 85 d2                    	testq	%rdx, %rdx
1454a23b8: 74 16                       	je	0x1454a23d0 <.text+0x54a13d0>
1454a23ba: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a23be: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a23c4: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a23cb: e8 00 fe b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a23d0: 48 83 bd 30 02 00 00 00     	cmpq	$0x0, 0x230(%rbp)
1454a23d8: 0f 84 87 0e 00 00           	je	0x1454a3265 <.text+0x54a2265>
1454a23de: 31 f6                       	xorl	%esi, %esi
1454a23e0: eb 11                       	jmp	0x1454a23f3 <.text+0x54a13f3>
1454a23e2: 40 b6 01                    	movb	$0x1, %sil
1454a23e5: 48 83 bd 30 02 00 00 00     	cmpq	$0x0, 0x230(%rbp)
1454a23ed: 0f 84 56 0e 00 00           	je	0x1454a3249 <.text+0x54a2249>
1454a23f3: 48 8b 85 80 02 00 00        	movq	0x280(%rbp), %rax
1454a23fa: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454a2401: 0f 10 85 70 02 00 00        	movups	0x270(%rbp), %xmm0
1454a2408: 0f 29 85 e0 00 00 00        	movaps	%xmm0, 0xe0(%rbp)
1454a240f: 0f 10 85 30 02 00 00        	movups	0x230(%rbp), %xmm0
1454a2416: 0f 10 8d 40 02 00 00        	movups	0x240(%rbp), %xmm1
1454a241d: 0f 10 95 50 02 00 00        	movups	0x250(%rbp), %xmm2
1454a2424: 0f 10 9d 60 02 00 00        	movups	0x260(%rbp), %xmm3
1454a242b: 0f 29 9d d0 00 00 00        	movaps	%xmm3, 0xd0(%rbp)
1454a2432: 0f 29 95 c0 00 00 00        	movaps	%xmm2, 0xc0(%rbp)
1454a2439: 0f 29 8d b0 00 00 00        	movaps	%xmm1, 0xb0(%rbp)
1454a2440: 0f 29 85 a0 00 00 00        	movaps	%xmm0, 0xa0(%rbp)
1454a2447: f3 41 0f 10 85 58 04 00 00  	movss	0x458(%r13), %xmm0
1454a2450: f3 0f 11 85 28 02 00 00     	movss	%xmm0, 0x228(%rbp)
1454a2458: f3 41 0f 10 85 5c 04 00 00  	movss	0x45c(%r13), %xmm0
1454a2461: f3 0f 11 45 60              	movss	%xmm0, 0x60(%rbp)
1454a2466: 41 8b 85 8c 04 00 00        	movl	0x48c(%r13), %eax
1454a246d: 89 45 14                    	movl	%eax, 0x14(%rbp)
1454a2470: 49 8b bd 90 07 00 00        	movq	0x790(%r13), %rdi
1454a2477: 4d 8d b5 c0 04 00 00        	leaq	0x4c0(%r13), %r14
1454a247e: 49 8d 85 38 05 00 00        	leaq	0x538(%r13), %rax
1454a2485: 48 89 85 18 03 00 00        	movq	%rax, 0x318(%rbp)
1454a248c: 31 db                       	xorl	%ebx, %ebx
1454a248e: f3 44 0f 10 0d e9 8f 44 00  	movss	0x448fe9(%rip), %xmm9   # 0x1458eb480
1454a2497: 45 0f 57 d2                 	xorps	%xmm10, %xmm10
1454a249b: f3 44 0f 10 25 1c 8f 54 00  	movss	0x548f1c(%rip), %xmm12  # 0x1459eb3c0
1454a24a4: 89 b5 28 03 00 00           	movl	%esi, 0x328(%rbp)
1454a24aa: 49 8b 85 88 07 00 00        	movq	0x788(%r13), %rax
1454a24b1: 49 8b 95 90 07 00 00        	movq	0x790(%r13), %rdx
1454a24b8: f3 0f 10 85 00 02 00 00     	movss	0x200(%rbp), %xmm0
1454a24c0: 48 89 d9                    	movq	%rbx, %rcx
1454a24c3: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a24c7: 48 01 c8                    	addq	%rcx, %rax
1454a24ca: 48 83 c0 e0                 	addq	$-0x20, %rax
1454a24ce: 66 90                       	nop
1454a24d0: 48 39 fb                    	cmpq	%rdi, %rbx
1454a24d3: 0f 83 7e 09 00 00           	jae	0x1454a2e57 <.text+0x54a1e57>
1454a24d9: 48 39 d3                    	cmpq	%rdx, %rbx
1454a24dc: 0f 83 51 86 00 00           	jae	0x1454aab33 <.text+0x54a9b33>
1454a24e2: 48 ff c3                    	incq	%rbx
1454a24e5: f3 0f 10 48 38              	movss	0x38(%rax), %xmm1
1454a24ea: 48 83 c0 20                 	addq	$0x20, %rax
1454a24ee: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a24f1: 77 dd                       	ja	0x1454a24d0 <.text+0x54a14d0>
1454a24f3: 48 89 7d 48                 	movq	%rdi, 0x48(%rbp)
1454a24f7: 48 8b 08                    	movq	(%rax), %rcx
1454a24fa: 48 89 8d 38 03 00 00        	movq	%rcx, 0x338(%rbp)
1454a2501: f3 41 0f 58 c9              	addss	%xmm9, %xmm1
1454a2506: f3 0f 11 48 18              	movss	%xmm1, 0x18(%rax)
1454a250b: 48 8b 8d a0 00 00 00        	movq	0xa0(%rbp), %rcx
1454a2512: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
1454a2519: 8b 79 54                    	movl	0x54(%rcx), %edi
1454a251c: 85 ff                       	testl	%edi, %edi
1454a251e: 74 11                       	je	0x1454a2531 <.text+0x54a1531>
1454a2520: 03 7d 14                    	addl	0x14(%rbp), %edi
1454a2523: 03 bd b8 00 00 00           	addl	0xb8(%rbp), %edi
1454a2529: 03 bd e0 00 00 00           	addl	0xe0(%rbp), %edi
1454a252f: eb 02                       	jmp	0x1454a2533 <.text+0x54a1533>
1454a2531: 31 ff                       	xorl	%edi, %edi
1454a2533: 4c 8d a5 d8 02 00 00        	leaq	0x2d8(%rbp), %r12
1454a253a: 48 83 c0 08                 	addq	$0x8, %rax
1454a253e: 8b 48 08                    	movl	0x8(%rax), %ecx
1454a2541: 89 8d b8 02 00 00           	movl	%ecx, 0x2b8(%rbp)
1454a2547: 48 8b 00                    	movq	(%rax), %rax
1454a254a: 48 89 85 b0 02 00 00        	movq	%rax, 0x2b0(%rbp)
1454a2551: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a2558: f3 0f 10 58 4c              	movss	0x4c(%rax), %xmm3
1454a255d: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a2564: 4c 89 e1                    	movq	%r12, %rcx
1454a2567: 4c 89 ea                    	movq	%r13, %rdx
1454a256a: 4c 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %r8
1454a2571: e8 2a bd 04 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454a2576: 90                          	nop
1454a2577: 83 ff 03                    	cmpl	$0x3, %edi
1454a257a: b8 03 00 00 00              	movl	$0x3, %eax
1454a257f: 0f 42 c7                    	cmovbl	%edi, %eax
1454a2582: 85 ff                       	testl	%edi, %edi
1454a2584: b9 01 00 00 00              	movl	$0x1, %ecx
1454a2589: 0f 44 c1                    	cmovel	%ecx, %eax
1454a258c: 48 8b 8d d8 02 00 00        	movq	0x2d8(%rbp), %rcx
1454a2593: 48 8b 95 e0 02 00 00        	movq	0x2e0(%rbp), %rdx
1454a259a: 4c 8b 85 e8 02 00 00        	movq	0x2e8(%rbp), %r8
1454a25a1: 4e 8d 04 c2                 	leaq	(%rdx,%r8,8), %r8
1454a25a5: 48 89 95 d8 02 00 00        	movq	%rdx, 0x2d8(%rbp)
1454a25ac: 48 89 95 e0 02 00 00        	movq	%rdx, 0x2e0(%rbp)
1454a25b3: 48 89 8d e8 02 00 00        	movq	%rcx, 0x2e8(%rbp)
1454a25ba: 4c 89 85 f0 02 00 00        	movq	%r8, 0x2f0(%rbp)
1454a25c1: 4c 89 b5 f8 02 00 00        	movq	%r14, 0x2f8(%rbp)
1454a25c8: 4c 89 bd 00 03 00 00        	movq	%r15, 0x300(%rbp)
1454a25cf: 48 89 85 08 03 00 00        	movq	%rax, 0x308(%rbp)
1454a25d6: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a25dd: 48 8d 8d 10 02 00 00        	leaq	0x210(%rbp), %rcx
1454a25e4: 4c 89 e2                    	movq	%r12, %rdx
1454a25e7: e8 d4 28 0a 00              	callq	0x145544ec0 <.text+0x5543ec0>
1454a25ec: 90                          	nop
1454a25ed: 4c 89 75 30                 	movq	%r14, 0x30(%rbp)
1454a25f1: 48 89 5d 58                 	movq	%rbx, 0x58(%rbp)
1454a25f5: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a25fc: 0f b6 40 75                 	movzbl	0x75(%rax), %eax
1454a2600: 04 fe                       	addb	$-0x2, %al
1454a2602: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a2606: 3c 06                       	cmpb	$0x6, %al
1454a2608: 77 0f                       	ja	0x1454a2619 <.text+0x54a1619>
1454a260a: 0f b6 c0                    	movzbl	%al, %eax
1454a260d: 48 8d 0d 88 a4 50 01        	leaq	0x150a488(%rip), %rcx   # 0x1469aca9c
1454a2614: f3 0f 10 04 81              	movss	(%rcx,%rax,4), %xmm0
1454a2619: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a2620: f3 44 0f 10 78 44           	movss	0x44(%rax), %xmm15
1454a2626: f3 0f 10 8d ec 00 00 00     	movss	0xec(%rbp), %xmm1
1454a262e: f3 0f 59 8d 28 02 00 00     	mulss	0x228(%rbp), %xmm1
1454a2636: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a2639: f3 41 0f c2 d7 01           	cmpltss	%xmm15, %xmm2
1454a263f: 0f 54 d1                    	andps	%xmm1, %xmm2
1454a2642: f3 44 0f 59 3d f5 66 45 00  	mulss	0x4566f5(%rip), %xmm15  # 0x1458f8d40
1454a264b: f3 44 0f 59 bd b0 00 00 00  	mulss	0xb0(%rbp), %xmm15
1454a2654: f3 44 0f 59 bd d8 00 00 00  	mulss	0xd8(%rbp), %xmm15
1454a265d: f3 44 0f 59 f8              	mulss	%xmm0, %xmm15
1454a2662: f3 44 0f 58 fa              	addss	%xmm2, %xmm15
1454a2667: f3 44 0f 59 7d 60           	mulss	0x60(%rbp), %xmm15
1454a266d: 48 8b 85 10 02 00 00        	movq	0x210(%rbp), %rax
1454a2674: 48 89 85 98 02 00 00        	movq	%rax, 0x298(%rbp)
1454a267b: 48 8b 8d 18 02 00 00        	movq	0x218(%rbp), %rcx
1454a2682: 48 8b 85 20 02 00 00        	movq	0x220(%rbp), %rax
1454a2689: 48 8d 04 c1                 	leaq	(%rcx,%rax,8), %rax
1454a268d: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a2694: 48 89 4d 00                 	movq	%rcx, (%rbp)
1454a2698: 48 89 8d 40 03 00 00        	movq	%rcx, 0x340(%rbp)
1454a269f: 90                          	nop
1454a26a0: 4c 8b b5 40 03 00 00        	movq	0x340(%rbp), %r14
1454a26a7: 4c 3b b5 48 03 00 00        	cmpq	0x348(%rbp), %r14
1454a26ae: 0f 84 55 07 00 00           	je	0x1454a2e09 <.text+0x54a1e09>
1454a26b4: 4d 8b 2e                    	movq	(%r14), %r13
1454a26b7: 4c 89 6d f0                 	movq	%r13, -0x10(%rbp)
1454a26bb: 4c 89 ad b8 02 00 00        	movq	%r13, 0x2b8(%rbp)
1454a26c2: c7 85 b0 02 00 00 00 00 00 00       	movl	$0x0, 0x2b0(%rbp)
1454a26cc: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454a26d6: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454a26dd: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a26e2: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a26e9: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a26ee: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454a26f7: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a26fe: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a2705: 41 b8 38 65 00 00           	movl	$0x6538, %r8d           # imm = 0x6538
1454a270b: 4c 8d 4d f0                 	leaq	-0x10(%rbp), %r9
1454a270f: e8 8c 8a fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a2714: 90                          	nop
1454a2715: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a271c: 48 8b b8 48 05 00 00        	movq	0x548(%rax), %rdi
1454a2723: 48 3b b8 38 05 00 00        	cmpq	0x538(%rax), %rdi
1454a272a: 75 0d                       	jne	0x1454a2739 <.text+0x54a1739>
1454a272c: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a2733: e8 78 59 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a2738: 90                          	nop
1454a2739: 49 83 c6 08                 	addq	$0x8, %r14
1454a273d: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a2744: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a274b: 48 89 f9                    	movq	%rdi, %rcx
1454a274e: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a2752: 0f 10 85 d8 02 00 00        	movups	0x2d8(%rbp), %xmm0
1454a2759: 0f 10 8d e8 02 00 00        	movups	0x2e8(%rbp), %xmm1
1454a2760: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a2765: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a2769: 48 ff c7                    	incq	%rdi
1454a276c: 48 89 ba 48 05 00 00        	movq	%rdi, 0x548(%rdx)
1454a2773: f3 0f 10 82 e4 08 00 00     	movss	0x8e4(%rdx), %xmm0
1454a277b: 48 8b 82 c8 04 00 00        	movq	0x4c8(%rdx), %rax
1454a2782: 4c 69 a2 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdx), %r12 # imm = 0x160
1454a278d: 31 c9                       	xorl	%ecx, %ecx
1454a278f: 48 89 c2                    	movq	%rax, %rdx
1454a2792: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a27a0: 48 89 cf                    	movq	%rcx, %rdi
1454a27a3: 49 39 cc                    	cmpq	%rcx, %r12
1454a27a6: 0f 84 92 00 00 00           	je	0x1454a283e <.text+0x54a183e>
1454a27ac: 48 8d 8f 60 01 00 00        	leaq	0x160(%rdi), %rcx
1454a27b3: 4c 39 aa 88 00 00 00        	cmpq	%r13, 0x88(%rdx)
1454a27ba: 48 8d 92 60 01 00 00        	leaq	0x160(%rdx), %rdx
1454a27c1: 75 dd                       	jne	0x1454a27a0 <.text+0x54a17a0>
1454a27c3: f3 0f 10 4c 08 c8           	movss	-0x38(%rax,%rcx), %xmm1
1454a27c9: 44 0f 2e d1                 	ucomiss	%xmm1, %xmm10
1454a27cd: 73 61                       	jae	0x1454a2830 <.text+0x54a1830>
1454a27cf: f3 0f 5c 44 08 c4           	subss	-0x3c(%rax,%rcx), %xmm0
1454a27d5: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1454a27d9: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a27dc: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454a27e0: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a27e4: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454a27e8: f2 0f 10 4c 08 ac           	movsd	-0x54(%rax,%rcx), %xmm1
1454a27ee: f2 0f 10 54 08 b8           	movsd	-0x48(%rax,%rcx), %xmm2
1454a27f4: 0f 5c d1                    	subps	%xmm1, %xmm2
1454a27f7: f3 44 0f 12 e8              	movsldup	%xmm0, %xmm13           # xmm13 = xmm0[0,0,2,2]
1454a27fc: 44 0f 59 ea                 	mulps	%xmm2, %xmm13
1454a2800: 44 0f 58 e9                 	addps	%xmm1, %xmm13
1454a2804: f3 0f 10 4c 08 b4           	movss	-0x4c(%rax,%rcx), %xmm1
1454a280a: f3 44 0f 10 74 08 c0        	movss	-0x40(%rax,%rcx), %xmm14
1454a2811: f3 44 0f 5c f1              	subss	%xmm1, %xmm14
1454a2816: f3 44 0f 59 f0              	mulss	%xmm0, %xmm14
1454a281b: f3 44 0f 58 f1              	addss	%xmm1, %xmm14
1454a2820: eb 1c                       	jmp	0x1454a283e <.text+0x54a183e>
1454a2822: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a2830: f2 44 0f 10 6c 08 b8        	movsd	-0x48(%rax,%rcx), %xmm13
1454a2837: f3 44 0f 10 74 08 c0        	movss	-0x40(%rax,%rcx), %xmm14
1454a283e: 4c 8b 9d 68 03 00 00        	movq	0x368(%rbp), %r11
1454a2845: 49 8b 83 80 08 00 00        	movq	0x880(%r11), %rax
1454a284c: 49 8b 8b 98 08 00 00        	movq	0x898(%r11), %rcx
1454a2853: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454a2857: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454a285b: 48 01 c2                    	addq	%rax, %rdx
1454a285e: 4d 8b 83 88 08 00 00        	movq	0x888(%r11), %r8
1454a2865: 4d 89 c1                    	movq	%r8, %r9
1454a2868: 49 c1 e1 11                 	shlq	$0x11, %r9
1454a286c: 4d 8b 93 90 08 00 00        	movq	0x890(%r11), %r10
1454a2873: 49 31 c2                    	xorq	%rax, %r10
1454a2876: 4c 31 c1                    	xorq	%r8, %rcx
1454a2879: 4d 31 d0                    	xorq	%r10, %r8
1454a287c: 4d 89 83 88 08 00 00        	movq	%r8, 0x888(%r11)
1454a2883: 48 31 c8                    	xorq	%rcx, %rax
1454a2886: 49 89 83 80 08 00 00        	movq	%rax, 0x880(%r11)
1454a288d: 4d 31 ca                    	xorq	%r9, %r10
1454a2890: 4d 89 93 90 08 00 00        	movq	%r10, 0x890(%r11)
1454a2897: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454a289b: 49 89 8b 98 08 00 00        	movq	%rcx, 0x898(%r11)
1454a28a2: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454a28a6: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a28a9: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454a28ad: f3 41 0f 59 c4              	mulss	%xmm12, %xmm0
1454a28b2: f3 41 0f 10 8b 64 04 00 00  	movss	0x464(%r11), %xmm1
1454a28bb: f3 41 0f 10 93 68 04 00 00  	movss	0x468(%r11), %xmm2
1454a28c4: f3 41 0f 59 d7              	mulss	%xmm15, %xmm2
1454a28c9: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a28d0: 44 8b 48 40                 	movl	0x40(%rax), %r9d
1454a28d4: 0f b6 40 74                 	movzbl	0x74(%rax), %eax
1454a28d8: 41 0f b6 9b 11 01 00 00     	movzbl	0x111(%r11), %ebx
1454a28e0: 41 c6 83 11 01 00 00 03     	movb	$0x3, 0x111(%r11)
1454a28e8: 45 0f 10 5b 20              	movups	0x20(%r11), %xmm11
1454a28ed: 41 0f 10 7b 40              	movups	0x40(%r11), %xmm7
1454a28f2: 49 c7 43 20 00 00 00 00     	movq	$0x0, 0x20(%r11)
1454a28fa: 49 c7 43 40 00 00 00 00     	movq	$0x0, 0x40(%r11)
1454a2902: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a2905: 77 04                       	ja	0x1454a290b <.text+0x54a190b>
1454a2907: 41 0f 28 d7                 	movaps	%xmm15, %xmm2
1454a290b: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a2910: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a2914: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a2919: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a2920: 48 89 f1                    	movq	%rsi, %rcx
1454a2923: 4c 89 ea                    	movq	%r13, %rdx
1454a2926: e8 85 05 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a292b: 90                          	nop
1454a292c: 4c 89 b5 40 03 00 00        	movq	%r14, 0x340(%rbp)
1454a2933: 88 9e 11 01 00 00           	movb	%bl, 0x111(%rsi)
1454a2939: 44 0f 11 5e 20              	movups	%xmm11, 0x20(%rsi)
1454a293e: 0f 11 7e 40                 	movups	%xmm7, 0x40(%rsi)
1454a2942: 4c 8b b6 00 07 00 00        	movq	0x700(%rsi), %r14
1454a2949: 4d 85 f6                    	testq	%r14, %r14
1454a294c: 0f 84 4e fd ff ff           	je	0x1454a26a0 <.text+0x54a16a0>
1454a2952: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a2959: 48 8b 30                    	movq	(%rax), %rsi
1454a295c: 4c 8b 78 08                 	movq	0x8(%rax), %r15
1454a2960: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a2967: 48 8b 98 f8 06 00 00        	movq	0x6f8(%rax), %rbx
1454a296e: 80 3b 06                    	cmpb	$0x6, (%rbx)
1454a2971: 75 2d                       	jne	0x1454a29a0 <.text+0x54a19a0>
1454a2973: 83 7b 10 00                 	cmpl	$0x0, 0x10(%rbx)
1454a2977: 75 27                       	jne	0x1454a29a0 <.text+0x54a19a0>
1454a2979: 80 7b 18 01                 	cmpb	$0x1, 0x18(%rbx)
1454a297d: 75 21                       	jne	0x1454a29a0 <.text+0x54a19a0>
1454a297f: 4c 39 7b 28                 	cmpq	%r15, 0x28(%rbx)
1454a2983: 75 1b                       	jne	0x1454a29a0 <.text+0x54a19a0>
1454a2985: 48 8b 4b 20                 	movq	0x20(%rbx), %rcx
1454a2989: 48 89 f2                    	movq	%rsi, %rdx
1454a298c: 4d 89 f8                    	movq	%r15, %r8
1454a298f: e8 43 44 2b 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454a2994: 85 c0                       	testl	%eax, %eax
1454a2996: 74 60                       	je	0x1454a29f8 <.text+0x54a19f8>
1454a2998: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a29a0: 49 83 fe 01                 	cmpq	$0x1, %r14
1454a29a4: 0f 84 f6 fc ff ff           	je	0x1454a26a0 <.text+0x54a16a0>
1454a29aa: 49 c1 e6 06                 	shlq	$0x6, %r14
1454a29ae: 48 83 c3 40                 	addq	$0x40, %rbx
1454a29b2: 49 83 c6 c0                 	addq	$-0x40, %r14
1454a29b6: eb 16                       	jmp	0x1454a29ce <.text+0x54a19ce>
1454a29b8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a29c0: 48 83 c3 40                 	addq	$0x40, %rbx
1454a29c4: 49 83 c6 c0                 	addq	$-0x40, %r14
1454a29c8: 0f 84 d2 fc ff ff           	je	0x1454a26a0 <.text+0x54a16a0>
1454a29ce: 80 3b 06                    	cmpb	$0x6, (%rbx)
1454a29d1: 75 ed                       	jne	0x1454a29c0 <.text+0x54a19c0>
1454a29d3: 83 7b 10 00                 	cmpl	$0x0, 0x10(%rbx)
1454a29d7: 75 e7                       	jne	0x1454a29c0 <.text+0x54a19c0>
1454a29d9: 80 7b 18 01                 	cmpb	$0x1, 0x18(%rbx)
1454a29dd: 75 e1                       	jne	0x1454a29c0 <.text+0x54a19c0>
1454a29df: 4c 39 7b 28                 	cmpq	%r15, 0x28(%rbx)
1454a29e3: 75 db                       	jne	0x1454a29c0 <.text+0x54a19c0>
1454a29e5: 48 8b 4b 20                 	movq	0x20(%rbx), %rcx
1454a29e9: 48 89 f2                    	movq	%rsi, %rdx
1454a29ec: 4d 89 f8                    	movq	%r15, %r8
1454a29ef: e8 e3 43 2b 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454a29f4: 85 c0                       	testl	%eax, %eax
1454a29f6: 75 c8                       	jne	0x1454a29c0 <.text+0x54a19c0>
1454a29f8: 49 39 fc                    	cmpq	%rdi, %r12
1454a29fb: 0f 84 9f fc ff ff           	je	0x1454a26a0 <.text+0x54a16a0>
1454a2a01: 8b 7b 04                    	movl	0x4(%rbx), %edi
1454a2a04: f3 44 0f 10 5b 08           	movss	0x8(%rbx), %xmm11
1454a2a0a: 44 0f 13 6d e0              	movlps	%xmm13, -0x20(%rbp)
1454a2a0f: f3 44 0f 11 75 e8           	movss	%xmm14, -0x18(%rbp)
1454a2a15: 4c 89 ad 90 00 00 00        	movq	%r13, 0x90(%rbp)
1454a2a1c: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a2a23: f3 0f 10 81 e4 08 00 00     	movss	0x8e4(%rcx), %xmm0
1454a2a2b: f3 0f 11 45 0c              	movss	%xmm0, 0xc(%rbp)
1454a2a30: c7 45 28 00 00 c8 42        	movl	$0x42c80000, 0x28(%rbp) # imm = 0x42C80000
1454a2a37: 48 8b 81 c8 04 00 00        	movq	0x4c8(%rcx), %rax
1454a2a3e: 48 69 89 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rcx), %rcx # imm = 0x160
1454a2a49: 48 01 c1                    	addq	%rax, %rcx
1454a2a4c: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
1454a2a53: 48 89 8d e0 02 00 00        	movq	%rcx, 0x2e0(%rbp)
1454a2a5a: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454a2a61: 48 89 85 e8 02 00 00        	movq	%rax, 0x2e8(%rbp)
1454a2a68: 48 c7 85 f0 02 00 00 01 00 00 00    	movq	$0x1, 0x2f0(%rbp)
1454a2a73: 48 8d 45 0c                 	leaq	0xc(%rbp), %rax
1454a2a77: 48 89 85 f8 02 00 00        	movq	%rax, 0x2f8(%rbp)
1454a2a7e: 48 8d 45 e0                 	leaq	-0x20(%rbp), %rax
1454a2a82: 48 89 85 00 03 00 00        	movq	%rax, 0x300(%rbp)
1454a2a89: 48 8d 45 28                 	leaq	0x28(%rbp), %rax
1454a2a8d: 48 89 85 08 03 00 00        	movq	%rax, 0x308(%rbp)
1454a2a94: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454a2a9b: 48 8d 95 d8 02 00 00        	leaq	0x2d8(%rbp), %rdx
1454a2aa2: e8 49 8e 08 00              	callq	0x14552b8f0 <.text+0x552a8f0>
1454a2aa7: 90                          	nop
1454a2aa8: 48 8b 8d b8 02 00 00        	movq	0x2b8(%rbp), %rcx
1454a2aaf: 4c 8b b5 c0 02 00 00        	movq	0x2c0(%rbp), %r14
1454a2ab6: 48 8d 45 57                 	leaq	0x57(%rbp), %rax
1454a2aba: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
1454a2ac1: 49 83 fe 02                 	cmpq	$0x2, %r14
1454a2ac5: 48 89 8d 10 03 00 00        	movq	%rcx, 0x310(%rbp)
1454a2acc: 0f 83 f0 02 00 00           	jae	0x1454a2dc2 <.text+0x54a1dc2>
1454a2ad2: 48 8b 85 b0 02 00 00        	movq	0x2b0(%rbp), %rax
1454a2ad9: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
1454a2ae0: 4d 85 f6                    	testq	%r14, %r14
1454a2ae3: 0f 84 88 00 00 00           	je	0x1454a2b71 <.text+0x54a1b71>
1454a2ae9: 49 8d 56 ff                 	leaq	-0x1(%r14), %rdx
1454a2aed: 44 89 f0                    	movl	%r14d, %eax
1454a2af0: 83 e0 03                    	andl	$0x3, %eax
1454a2af3: 48 83 fa 03                 	cmpq	$0x3, %rdx
1454a2af7: 73 05                       	jae	0x1454a2afe <.text+0x54a1afe>
1454a2af9: 45 31 d2                    	xorl	%r10d, %r10d
1454a2afc: eb 46                       	jmp	0x1454a2b44 <.text+0x54a1b44>
1454a2afe: 4c 89 f2                    	movq	%r14, %rdx
1454a2b01: 48 83 e2 fc                 	andq	$-0x4, %rdx
1454a2b05: 4c 8d 41 38                 	leaq	0x38(%rcx), %r8
1454a2b09: 45 31 d2                    	xorl	%r10d, %r10d
1454a2b0c: 0f 1f 40 00                 	nopl	(%rax)
1454a2b10: 4d 8b 48 d0                 	movq	-0x30(%r8), %r9
1454a2b14: 4e 89 0c d1                 	movq	%r9, (%rcx,%r10,8)
1454a2b18: 4d 8b 48 e0                 	movq	-0x20(%r8), %r9
1454a2b1c: 4e 89 4c d1 08              	movq	%r9, 0x8(%rcx,%r10,8)
1454a2b21: 4d 8b 48 f0                 	movq	-0x10(%r8), %r9
1454a2b25: 4e 89 4c d1 10              	movq	%r9, 0x10(%rcx,%r10,8)
1454a2b2a: 4d 8b 08                    	movq	(%r8), %r9
1454a2b2d: 4e 89 4c d1 18              	movq	%r9, 0x18(%rcx,%r10,8)
1454a2b32: 49 83 c2 04                 	addq	$0x4, %r10
1454a2b36: 49 83 c0 40                 	addq	$0x40, %r8
1454a2b3a: 4c 39 d2                    	cmpq	%r10, %rdx
1454a2b3d: 75 d1                       	jne	0x1454a2b10 <.text+0x54a1b10>
1454a2b3f: 48 85 c0                    	testq	%rax, %rax
1454a2b42: 74 2d                       	je	0x1454a2b71 <.text+0x54a1b71>
1454a2b44: 4a 8d 14 d1                 	leaq	(%rcx,%r10,8), %rdx
1454a2b48: 49 c1 e2 04                 	shlq	$0x4, %r10
1454a2b4c: 49 01 ca                    	addq	%rcx, %r10
1454a2b4f: 49 83 c2 08                 	addq	$0x8, %r10
1454a2b53: c1 e0 03                    	shll	$0x3, %eax
1454a2b56: 45 31 c0                    	xorl	%r8d, %r8d
1454a2b59: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a2b60: 4f 8b 0c 42                 	movq	(%r10,%r8,2), %r9
1454a2b64: 4e 89 0c 02                 	movq	%r9, (%rdx,%r8)
1454a2b68: 49 83 c0 08                 	addq	$0x8, %r8
1454a2b6c: 4c 39 c0                    	cmpq	%r8, %rax
1454a2b6f: 75 ef                       	jne	0x1454a2b60 <.text+0x54a1b60>
1454a2b71: 49 89 cf                    	movq	%rcx, %r15
1454a2b74: 85 ff                       	testl	%edi, %edi
1454a2b76: 4c 8b a5 18 03 00 00        	movq	0x318(%rbp), %r12
1454a2b7d: 74 35                       	je	0x1454a2bb4 <.text+0x54a1bb4>
1454a2b7f: 4e 8d 3c f1                 	leaq	(%rcx,%r14,8), %r15
1454a2b83: 48 c1 e7 03                 	shlq	$0x3, %rdi
1454a2b87: 49 c1 e6 03                 	shlq	$0x3, %r14
1454a2b8b: 31 c0                       	xorl	%eax, %eax
1454a2b8d: 0f 1f 00                    	nopl	(%rax)
1454a2b90: 49 39 c6                    	cmpq	%rax, %r14
1454a2b93: 74 18                       	je	0x1454a2bad <.text+0x54a1bad>
1454a2b95: 48 83 c0 08                 	addq	$0x8, %rax
1454a2b99: 48 39 c7                    	cmpq	%rax, %rdi
1454a2b9c: 75 f2                       	jne	0x1454a2b90 <.text+0x54a1b90>
1454a2b9e: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a2ba5: 48 01 c8                    	addq	%rcx, %rax
1454a2ba8: 49 89 c7                    	movq	%rax, %r15
1454a2bab: eb 07                       	jmp	0x1454a2bb4 <.text+0x54a1bb4>
1454a2bad: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a2bb4: 48 8b 85 a0 02 00 00        	movq	0x2a0(%rbp), %rax
1454a2bbb: 48 c1 e0 04                 	shlq	$0x4, %rax
1454a2bbf: 48 89 85 80 00 00 00        	movq	%rax, 0x80(%rbp)
1454a2bc6: f3 45 0f 59 df              	mulss	%xmm15, %xmm11
1454a2bcb: 48 89 cf                    	movq	%rcx, %rdi
1454a2bce: 4c 39 ff                    	cmpq	%r15, %rdi
1454a2bd1: 0f 84 bf 01 00 00           	je	0x1454a2d96 <.text+0x54a1d96>
1454a2bd7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a2be0: 4c 8b 37                    	movq	(%rdi), %r14
1454a2be3: 4c 89 75 28                 	movq	%r14, 0x28(%rbp)
1454a2be7: 4c 89 b5 b8 02 00 00        	movq	%r14, 0x2b8(%rbp)
1454a2bee: c7 85 b0 02 00 00 00 00 00 00       	movl	$0x0, 0x2b0(%rbp)
1454a2bf8: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454a2c02: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454a2c09: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a2c0e: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a2c15: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a2c1a: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454a2c23: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a2c2a: 4c 89 ea                    	movq	%r13, %rdx
1454a2c2d: 41 b8 38 65 00 00           	movl	$0x6538, %r8d           # imm = 0x6538
1454a2c33: 4c 8d 4d 28                 	leaq	0x28(%rbp), %r9
1454a2c37: e8 64 85 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a2c3c: 90                          	nop
1454a2c3d: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a2c44: 48 8b 98 48 05 00 00        	movq	0x548(%rax), %rbx
1454a2c4b: 48 3b 98 38 05 00 00        	cmpq	0x538(%rax), %rbx
1454a2c52: 75 09                       	jne	0x1454a2c5d <.text+0x54a1c5d>
1454a2c54: 4c 89 e1                    	movq	%r12, %rcx
1454a2c57: e8 54 54 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a2c5c: 90                          	nop
1454a2c5d: 48 83 c7 08                 	addq	$0x8, %rdi
1454a2c61: 4c 8b 9d 68 03 00 00        	movq	0x368(%rbp), %r11
1454a2c68: 49 8b 83 40 05 00 00        	movq	0x540(%r11), %rax
1454a2c6f: 48 89 d9                    	movq	%rbx, %rcx
1454a2c72: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a2c76: 0f 10 85 d8 02 00 00        	movups	0x2d8(%rbp), %xmm0
1454a2c7d: 0f 10 8d e8 02 00 00        	movups	0x2e8(%rbp), %xmm1
1454a2c84: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a2c89: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a2c8d: 48 ff c3                    	incq	%rbx
1454a2c90: 49 89 9b 48 05 00 00        	movq	%rbx, 0x548(%r11)
1454a2c97: 49 8b 83 80 08 00 00        	movq	0x880(%r11), %rax
1454a2c9e: 49 8b 8b 98 08 00 00        	movq	0x898(%r11), %rcx
1454a2ca5: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454a2ca9: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454a2cad: 48 01 c2                    	addq	%rax, %rdx
1454a2cb0: 4d 8b 83 88 08 00 00        	movq	0x888(%r11), %r8
1454a2cb7: 4d 89 c1                    	movq	%r8, %r9
1454a2cba: 49 c1 e1 11                 	shlq	$0x11, %r9
1454a2cbe: 4d 8b 93 90 08 00 00        	movq	0x890(%r11), %r10
1454a2cc5: 49 31 c2                    	xorq	%rax, %r10
1454a2cc8: 4c 31 c1                    	xorq	%r8, %rcx
1454a2ccb: 4d 31 d0                    	xorq	%r10, %r8
1454a2cce: 4d 89 83 88 08 00 00        	movq	%r8, 0x888(%r11)
1454a2cd5: 48 31 c8                    	xorq	%rcx, %rax
1454a2cd8: 49 89 83 80 08 00 00        	movq	%rax, 0x880(%r11)
1454a2cdf: 4d 31 ca                    	xorq	%r9, %r10
1454a2ce2: 4d 89 93 90 08 00 00        	movq	%r10, 0x890(%r11)
1454a2ce9: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454a2ced: 49 89 8b 98 08 00 00        	movq	%rcx, 0x898(%r11)
1454a2cf4: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454a2cf8: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a2cfb: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454a2cff: f3 41 0f 59 c4              	mulss	%xmm12, %xmm0
1454a2d04: f3 41 0f 10 8b 64 04 00 00  	movss	0x464(%r11), %xmm1
1454a2d0d: f3 41 0f 10 93 68 04 00 00  	movss	0x468(%r11), %xmm2
1454a2d16: f3 41 0f 59 d3              	mulss	%xmm11, %xmm2
1454a2d1b: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a2d22: 44 8b 48 40                 	movl	0x40(%rax), %r9d
1454a2d26: 0f b6 40 74                 	movzbl	0x74(%rax), %eax
1454a2d2a: 41 0f b6 9b 11 01 00 00     	movzbl	0x111(%r11), %ebx
1454a2d32: 41 c6 83 11 01 00 00 03     	movb	$0x3, 0x111(%r11)
1454a2d3a: 41 0f 10 7b 20              	movups	0x20(%r11), %xmm7
1454a2d3f: 45 0f 10 43 40              	movups	0x40(%r11), %xmm8
1454a2d44: 49 c7 43 20 00 00 00 00     	movq	$0x0, 0x20(%r11)
1454a2d4c: 49 c7 43 40 00 00 00 00     	movq	$0x0, 0x40(%r11)
1454a2d54: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a2d57: 77 04                       	ja	0x1454a2d5d <.text+0x54a1d5d>
1454a2d59: 41 0f 28 d3                 	movaps	%xmm11, %xmm2
1454a2d5d: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a2d62: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a2d66: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a2d6b: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a2d72: 48 89 f1                    	movq	%rsi, %rcx
1454a2d75: 4c 89 f2                    	movq	%r14, %rdx
1454a2d78: e8 33 01 02 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a2d7d: 90                          	nop
1454a2d7e: 88 9e 11 01 00 00           	movb	%bl, 0x111(%rsi)
1454a2d84: 0f 11 7e 20                 	movups	%xmm7, 0x20(%rsi)
1454a2d88: 44 0f 11 46 40              	movups	%xmm8, 0x40(%rsi)
1454a2d8d: 4c 39 ff                    	cmpq	%r15, %rdi
1454a2d90: 0f 85 4a fe ff ff           	jne	0x1454a2be0 <.text+0x54a1be0>
1454a2d96: 48 83 bd a0 02 00 00 00     	cmpq	$0x0, 0x2a0(%rbp)
1454a2d9e: 0f 84 fc f8 ff ff           	je	0x1454a26a0 <.text+0x54a16a0>
1454a2da4: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a2daa: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a2db1: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454a2db8: e8 13 f4 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a2dbd: e9 de f8 ff ff              	jmp	0x1454a26a0 <.text+0x54a16a0>
1454a2dc2: 49 83 fe 15                 	cmpq	$0x15, %r14
1454a2dc6: 73 2f                       	jae	0x1454a2df7 <.text+0x54a1df7>
1454a2dc8: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a2dce: 4c 89 f2                    	movq	%r14, %rdx
1454a2dd1: 4c 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %r9
1454a2dd8: e8 23 63 48 fc              	callq	0x141929100 <.text+0x1928100>
1454a2ddd: 48 8b 85 b0 02 00 00        	movq	0x2b0(%rbp), %rax
1454a2de4: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
1454a2deb: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a2df2: e9 f2 fc ff ff              	jmp	0x1454a2ae9 <.text+0x54a1ae9>
1454a2df7: 4c 89 f2                    	movq	%r14, %rdx
1454a2dfa: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a2e01: e8 aa 68 09 00              	callq	0x1455396b0 <.text+0x55386b0>
1454a2e06: 90                          	nop
1454a2e07: eb d4                       	jmp	0x1454a2ddd <.text+0x54a1ddd>
1454a2e09: 48 8b 95 98 02 00 00        	movq	0x298(%rbp), %rdx
1454a2e10: 48 85 d2                    	testq	%rdx, %rdx
1454a2e13: 8b b5 28 03 00 00           	movl	0x328(%rbp), %esi
1454a2e19: 48 8b 5d 58                 	movq	0x58(%rbp), %rbx
1454a2e1d: 48 8b 7d 48                 	movq	0x48(%rbp), %rdi
1454a2e21: 74 13                       	je	0x1454a2e36 <.text+0x54a1e36>
1454a2e23: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a2e27: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a2e2d: 48 8b 4d 00                 	movq	(%rbp), %rcx
1454a2e31: e8 9a f3 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a2e36: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a2e3d: 49 bc 62 6c 6f 6f 64 72 61 67       	movabsq	$0x676172646f6f6c62, %r12 # imm = 0x676172646F6F6C62
1454a2e47: 4c 8d bd 00 02 00 00        	leaq	0x200(%rbp), %r15
1454a2e4e: 4c 8b 75 30                 	movq	0x30(%rbp), %r14
1454a2e52: e9 53 f6 ff ff              	jmp	0x1454a24aa <.text+0x54a14aa>
1454a2e57: 4c 8b b5 a0 00 00 00        	movq	0xa0(%rbp), %r14
1454a2e5e: 49 8b 85 30 07 00 00        	movq	0x730(%r13), %rax
1454a2e65: f3 0f 10 3d 63 84 54 00     	movss	0x548463(%rip), %xmm7   # 0x1459eb2d0
1454a2e6d: 48 85 c0                    	testq	%rax, %rax
1454a2e70: 74 58                       	je	0x1454a2eca <.text+0x54a1eca>
1454a2e72: 4c 89 e6                    	movq	%r12, %rsi
1454a2e75: 49 8b 3e                    	movq	(%r14), %rdi
1454a2e78: 49 8b 5e 08                 	movq	0x8(%r14), %rbx
1454a2e7c: 4d 8b bd 28 07 00 00        	movq	0x728(%r13), %r15
1454a2e83: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a2e87: 4c 8d 2c 40                 	leaq	(%rax,%rax,2), %r13
1454a2e8b: 45 31 e4                    	xorl	%r12d, %r12d
1454a2e8e: eb 09                       	jmp	0x1454a2e99 <.text+0x54a1e99>
1454a2e90: 49 83 c4 18                 	addq	$0x18, %r12
1454a2e94: 4d 39 e5                    	cmpq	%r12, %r13
1454a2e97: 74 21                       	je	0x1454a2eba <.text+0x54a1eba>
1454a2e99: 4b 39 5c 27 08              	cmpq	%rbx, 0x8(%r15,%r12)
1454a2e9e: 75 f0                       	jne	0x1454a2e90 <.text+0x54a1e90>
1454a2ea0: 4b 8b 0c 27                 	movq	(%r15,%r12), %rcx
1454a2ea4: 48 89 fa                    	movq	%rdi, %rdx
1454a2ea7: 49 89 d8                    	movq	%rbx, %r8
1454a2eaa: e8 28 3f 2b 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454a2eaf: 85 c0                       	testl	%eax, %eax
1454a2eb1: 75 dd                       	jne	0x1454a2e90 <.text+0x54a1e90>
1454a2eb3: f3 43 0f 10 7c 27 10        	movss	0x10(%r15,%r12), %xmm7
1454a2eba: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a2ec1: 49 89 f4                    	movq	%rsi, %r12
1454a2ec4: 8b b5 28 03 00 00           	movl	0x328(%rbp), %esi
1454a2eca: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a2ed3: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a2ed6: 0f 82 68 03 00 00           	jb	0x1454a3244 <.text+0x54a2244>
1454a2edc: 41 8b 85 f0 03 00 00        	movl	0x3f0(%r13), %eax
1454a2ee3: 89 85 b8 02 00 00           	movl	%eax, 0x2b8(%rbp)
1454a2ee9: 49 8b 85 e8 03 00 00        	movq	0x3e8(%r13), %rax
1454a2ef0: 48 89 85 b0 02 00 00        	movq	%rax, 0x2b0(%rbp)
1454a2ef7: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a2efe: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454a2f07: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454a2f10: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a2f17: 48 8d bd b0 02 00 00        	leaq	0x2b0(%rbp), %rdi
1454a2f1e: f3 0f 10 1d 76 4a 52 00     	movss	0x524a76(%rip), %xmm3   # 0x1459c799c
1454a2f26: 4c 89 ea                    	movq	%r13, %rdx
1454a2f29: 49 89 f8                    	movq	%rdi, %r8
1454a2f2c: e8 9f b1 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a2f31: 90                          	nop
1454a2f32: 48 83 bd e8 02 00 00 00     	cmpq	$0x0, 0x2e8(%rbp)
1454a2f3a: 74 7a                       	je	0x1454a2fb6 <.text+0x54a1fb6>
1454a2f3c: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a2f43: 48 85 d2                    	testq	%rdx, %rdx
1454a2f46: 74 16                       	je	0x1454a2f5e <.text+0x54a1f5e>
1454a2f48: 48 8b 8d e0 02 00 00        	movq	0x2e0(%rbp), %rcx
1454a2f4f: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a2f53: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a2f59: e8 72 f2 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a2f5e: f3 45 0f 10 56 58           	movss	0x58(%r14), %xmm10
1454a2f64: f3 44 0f 59 15 d3 5d 45 00  	mulss	0x455dd3(%rip), %xmm10  # 0x1458f8d40
1454a2f6d: f3 44 0f 59 95 c0 00 00 00  	mulss	0xc0(%rbp), %xmm10
1454a2f76: f3 44 0f 59 95 e8 00 00 00  	mulss	0xe8(%rbp), %xmm10
1454a2f7f: f2 41 0f 10 bd e8 03 00 00  	movsd	0x3e8(%r13), %xmm7
1454a2f88: f3 44 0f 16 cf              	movshdup	%xmm7, %xmm9            # xmm9 = xmm7[1,1,3,3]
1454a2f8d: 49 8b 9d 78 08 00 00        	movq	0x878(%r13), %rbx
1454a2f94: 48 8d 4b 10                 	leaq	0x10(%rbx), %rcx
1454a2f98: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a2f9f: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454a2fa2: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a2fa6: e8 45 f8 fb ff              	callq	0x1454627f0 <.text+0x54617f0>
1454a2fab: 90                          	nop
1454a2fac: a8 01                       	testb	$0x1, %al
1454a2fae: 74 31                       	je	0x1454a2fe1 <.text+0x54a1fe1>
1454a2fb0: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454a2fb4: eb 6e                       	jmp	0x1454a3024 <.text+0x54a2024>
1454a2fb6: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a2fbd: 48 85 d2                    	testq	%rdx, %rdx
1454a2fc0: 0f 84 7e 02 00 00           	je	0x1454a3244 <.text+0x54a2244>
1454a2fc6: 48 8b 8d e0 02 00 00        	movq	0x2e0(%rbp), %rcx
1454a2fcd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a2fd1: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a2fd7: e8 f4 f1 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a2fdc: e9 63 02 00 00              	jmp	0x1454a3244 <.text+0x54a2244>
1454a2fe1: 48 83 7b 68 ff              	cmpq	$-0x1, 0x68(%rbx)
1454a2fe6: 74 33                       	je	0x1454a301b <.text+0x54a201b>
1454a2fe8: 48 8d 53 68                 	leaq	0x68(%rbx), %rdx
1454a2fec: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a2ff3: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a2ffa: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454a2ffd: 41 0f 28 d9                 	movaps	%xmm9, %xmm3
1454a3001: e8 ea 4b fc ff              	callq	0x145467bf0 <.text+0x5466bf0>
1454a3006: 90                          	nop
1454a3007: 83 bd d8 02 00 00 01        	cmpl	$0x1, 0x2d8(%rbp)
1454a300e: 75 0b                       	jne	0x1454a301b <.text+0x54a201b>
1454a3010: f3 44 0f 10 85 e4 02 00 00  	movss	0x2e4(%rbp), %xmm8
1454a3019: eb 09                       	jmp	0x1454a3024 <.text+0x54a2024>
1454a301b: f3 44 0f 10 83 90 00 00 00  	movss	0x90(%rbx), %xmm8
1454a3024: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a302b: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a3032: 4c 89 e9                    	movq	%r13, %rcx
1454a3035: e8 a6 19 03 00              	callq	0x1454d49e0 <.text+0x54d39e0>
1454a303a: 90                          	nop
1454a303b: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
1454a3042: 45 8b 46 40                 	movl	0x40(%r14), %r8d
1454a3046: 0f 13 bd b4 02 00 00        	movlps	%xmm7, 0x2b4(%rbp)
1454a304d: f3 44 0f 11 85 bc 02 00 00  	movss	%xmm8, 0x2bc(%rbp)
1454a3056: c7 85 b0 02 00 00 01 00 00 00       	movl	$0x1, 0x2b0(%rbp)
1454a3060: c7 85 10 02 00 00 00 00 00 00       	movl	$0x0, 0x210(%rbp)
1454a306a: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a3071: 48 8d 85 10 02 00 00        	leaq	0x210(%rbp), %rax
1454a3078: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a307d: 48 89 7c 24 28              	movq	%rdi, 0x28(%rsp)
1454a3082: 48 c7 44 24 20 00 00 00 00  	movq	$0x0, 0x20(%rsp)
1454a308b: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a3092: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454a3098: e8 03 81 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a309d: 90                          	nop
1454a309e: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a30a5: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a30ac: 75 0d                       	jne	0x1454a30bb <.text+0x54a20bb>
1454a30ae: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a30b5: e8 f6 4f 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a30ba: 90                          	nop
1454a30bb: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a30c2: 48 89 f1                    	movq	%rsi, %rcx
1454a30c5: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a30c9: 0f 10 85 d8 02 00 00        	movups	0x2d8(%rbp), %xmm0
1454a30d0: 0f 10 8d e8 02 00 00        	movups	0x2e8(%rbp), %xmm1
1454a30d7: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a30dc: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a30e0: 48 ff c6                    	incq	%rsi
1454a30e3: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a30ea: 49 83 bd 90 07 00 00 03     	cmpq	$0x3, 0x790(%r13)
1454a30f2: 8b b5 28 03 00 00           	movl	0x328(%rbp), %esi
1454a30f8: 0f 82 94 00 00 00           	jb	0x1454a3192 <.text+0x54a2192>
1454a30fe: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a3105: 4c 8d 0d cc 91 50 01        	leaq	0x15091cc(%rip), %r9    # 0x1469ac2d8
1454a310c: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454a3113: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
1454a3117: 45 31 c0                    	xorl	%r8d, %r8d
1454a311a: e8 11 28 08 00              	callq	0x145525930 <.text+0x5524930>
1454a311f: 90                          	nop
1454a3120: 48 8b 95 b0 02 00 00        	movq	0x2b0(%rbp), %rdx
1454a3127: 48 85 d2                    	testq	%rdx, %rdx
1454a312a: 74 66                       	je	0x1454a3192 <.text+0x54a2192>
1454a312c: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a3133: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a313a: e8 b1 f5 f9 ff              	callq	0x1454426f0 <.text+0x54416f0>
1454a313f: 90                          	nop
1454a3140: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a3147: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a314e: 75 0d                       	jne	0x1454a315d <.text+0x54a215d>
1454a3150: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a3157: e8 54 4f 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a315c: 90                          	nop
1454a315d: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a3164: 48 89 f1                    	movq	%rsi, %rcx
1454a3167: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a316b: 0f 10 85 d8 02 00 00        	movups	0x2d8(%rbp), %xmm0
1454a3172: 0f 10 8d e8 02 00 00        	movups	0x2e8(%rbp), %xmm1
1454a3179: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a317e: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a3182: 48 ff c6                    	incq	%rsi
1454a3185: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a318c: 8b b5 28 03 00 00           	movl	0x328(%rbp), %esi
1454a3192: 0f 13 bd d8 02 00 00        	movlps	%xmm7, 0x2d8(%rbp)
1454a3199: f3 44 0f 11 85 e0 02 00 00  	movss	%xmm8, 0x2e0(%rbp)
1454a31a2: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a31a9: c7 44 24 20 10 00 00 00     	movl	$0x10, 0x20(%rsp)
1454a31b1: 48 8d 15 38 91 50 01        	leaq	0x1509138(%rip), %rdx   # 0x1469ac2f0
1454a31b8: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a31bf: 4c 89 e9                    	movq	%r13, %rcx
1454a31c2: 41 b9 05 00 00 00           	movl	$0x5, %r9d
1454a31c8: e8 83 f6 02 00              	callq	0x1454d2850 <.text+0x54d1850>
1454a31cd: 90                          	nop
1454a31ce: 48 89 c7                    	movq	%rax, %rdi
1454a31d1: 44 0f 28 8d 00 02 00 00     	movaps	0x200(%rbp), %xmm9
1454a31d9: 49 8b 9d 90 07 00 00        	movq	0x790(%r13), %rbx
1454a31e0: 49 3b 9d 80 07 00 00        	cmpq	0x780(%r13), %rbx
1454a31e7: 75 11                       	jne	0x1454a31fa <.text+0x54a21fa>
1454a31e9: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454a31f0: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1454a31f4: e8 b7 4e 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a31f9: 90                          	nop
1454a31fa: 0f 28 05 df e4 56 00        	movaps	0x56e4df(%rip), %xmm0   # 0x145a116e0
1454a3201: f3 41 0f 10 c2              	movss	%xmm10, %xmm0           # xmm0 = xmm10[0],xmm0[1,2,3]
1454a3206: 45 0f c6 c9 00              	shufps	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
1454a320b: 44 0f 58 c8                 	addps	%xmm0, %xmm9
1454a320f: 49 8b 85 88 07 00 00        	movq	0x788(%r13), %rax
1454a3216: 48 89 d9                    	movq	%rbx, %rcx
1454a3219: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a321d: 48 89 3c 08                 	movq	%rdi, (%rax,%rcx)
1454a3221: 0f 13 7c 08 08              	movlps	%xmm7, 0x8(%rax,%rcx)
1454a3226: f3 44 0f 11 44 08 10        	movss	%xmm8, 0x10(%rax,%rcx)
1454a322d: 44 0f 13 4c 08 14           	movlps	%xmm9, 0x14(%rax,%rcx)
1454a3233: f3 44 0f 11 54 08 1c        	movss	%xmm10, 0x1c(%rax,%rcx)
1454a323a: 48 ff c3                    	incq	%rbx
1454a323d: 49 89 9d 90 07 00 00        	movq	%rbx, 0x790(%r13)
1454a3244: 40 84 f6                    	testb	%sil, %sil
1454a3247: 74 1c                       	je	0x1454a3265 <.text+0x54a2265>
1454a3249: 48 8b 55 68                 	movq	0x68(%rbp), %rdx
1454a324d: 48 85 d2                    	testq	%rdx, %rdx
1454a3250: 74 13                       	je	0x1454a3265 <.text+0x54a2265>
1454a3252: 48 8b 4d 70                 	movq	0x70(%rbp), %rcx
1454a3256: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a325a: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a3260: e8 6b ef b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a3265: 49 8b 85 a8 07 00 00        	movq	0x7a8(%r13), %rax
1454a326c: 48 85 c0                    	testq	%rax, %rax
1454a326f: 0f 84 1c 02 00 00           	je	0x1454a3491 <.text+0x54a2491>
1454a3275: 49 8b 8d a0 07 00 00        	movq	0x7a0(%r13), %rcx
1454a327c: 48 8d 04 c1                 	leaq	(%rcx,%rax,8), %rax
1454a3280: 49 8d 95 c0 04 00 00        	leaq	0x4c0(%r13), %rdx
1454a3287: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
1454a328e: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a3295: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
1454a329c: 48 8d 45 10                 	leaq	0x10(%rbp), %rax
1454a32a0: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a32a7: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a32ae: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a32b5: e8 46 f1 08 00              	callq	0x145532400 <.text+0x5531400>
1454a32ba: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
1454a32c1: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a32c8: 48 8b 85 38 02 00 00        	movq	0x238(%rbp), %rax
1454a32cf: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a32d6: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454a32dd: 48 85 c0                    	testq	%rax, %rax
1454a32e0: 0f 84 89 01 00 00           	je	0x1454a346f <.text+0x54a246f>
1454a32e6: 4c 8b b5 58 03 00 00        	movq	0x358(%rbp), %r14
1454a32ed: 49 8d 1c c6                 	leaq	(%r14,%rax,8), %rbx
1454a32f1: eb 26                       	jmp	0x1454a3319 <.text+0x54a2319>
1454a32f3: 4c 89 e9                    	movq	%r13, %rcx
1454a32f6: 48 89 fa                    	movq	%rdi, %rdx
1454a32f9: 41 b8 76 00 00 00           	movl	$0x76, %r8d
1454a32ff: 45 31 c9                    	xorl	%r9d, %r9d
1454a3302: e8 99 e0 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a3307: 90                          	nop
1454a3308: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a3310: 49 39 de                    	cmpq	%rbx, %r14
1454a3313: 0f 84 56 01 00 00           	je	0x1454a346f <.text+0x54a246f>
1454a3319: 49 8b 3e                    	movq	(%r14), %rdi
1454a331c: 49 8b 85 a8 07 00 00        	movq	0x7a8(%r13), %rax
1454a3323: 48 85 c0                    	testq	%rax, %rax
1454a3326: 74 2a                       	je	0x1454a3352 <.text+0x54a2352>
1454a3328: 49 8b 8d a0 07 00 00        	movq	0x7a0(%r13), %rcx
1454a332f: 45 31 c0                    	xorl	%r8d, %r8d
1454a3332: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a3340: 4a 39 3c c1                 	cmpq	%rdi, (%rcx,%r8,8)
1454a3344: 0f 84 a7 00 00 00           	je	0x1454a33f1 <.text+0x54a23f1>
1454a334a: 49 ff c0                    	incq	%r8
1454a334d: 4c 39 c0                    	cmpq	%r8, %rax
1454a3350: 75 ee                       	jne	0x1454a3340 <.text+0x54a2340>
1454a3352: 49 83 c6 08                 	addq	$0x8, %r14
1454a3356: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a335f: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a3366: 49 69 95 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a3371: 31 c9                       	xorl	%ecx, %ecx
1454a3373: 49 89 c0                    	movq	%rax, %r8
1454a3376: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a3380: 48 39 ca                    	cmpq	%rcx, %rdx
1454a3383: 74 8b                       	je	0x1454a3310 <.text+0x54a2310>
1454a3385: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a338c: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
1454a3393: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a339a: 75 e4                       	jne	0x1454a3380 <.text+0x54a2380>
1454a339c: c7 44 08 e0 00 00 00 00     	movl	$0x0, -0x20(%rax,%rcx)
1454a33a4: f3 0f 11 44 08 cc           	movss	%xmm0, -0x34(%rax,%rcx)
1454a33aa: 44 8b 84 08 08 ff ff ff     	movl	-0xf8(%rax,%rcx), %r8d
1454a33b2: 48 8b 94 08 30 ff ff ff     	movq	-0xd0(%rax,%rcx), %rdx
1454a33ba: 48 85 d2                    	testq	%rdx, %rdx
1454a33bd: 74 24                       	je	0x1454a33e3 <.text+0x54a23e3>
1454a33bf: 45 85 c0                    	testl	%r8d, %r8d
1454a33c2: 0f 85 48 ff ff ff           	jne	0x1454a3310 <.text+0x54a2310>
1454a33c8: f3 0f 10 5c 08 a8           	movss	-0x58(%rax,%rcx), %xmm3
1454a33ce: 44 8b 42 24                 	movl	0x24(%rdx), %r8d
1454a33d2: 4c 89 e9                    	movq	%r13, %rcx
1454a33d5: 48 89 fa                    	movq	%rdi, %rdx
1454a33d8: e8 63 20 03 00              	callq	0x1454d5440 <.text+0x54d4440>
1454a33dd: 90                          	nop
1454a33de: e9 10 ff ff ff              	jmp	0x1454a32f3 <.text+0x54a22f3>
1454a33e3: 45 85 c0                    	testl	%r8d, %r8d
1454a33e6: 0f 85 24 ff ff ff           	jne	0x1454a3310 <.text+0x54a2310>
1454a33ec: e9 02 ff ff ff              	jmp	0x1454a32f3 <.text+0x54a22f3>
1454a33f1: 49 8d 50 01                 	leaq	0x1(%r8), %rdx
1454a33f5: 48 39 c2                    	cmpq	%rax, %rdx
1454a33f8: 73 32                       	jae	0x1454a342c <.text+0x54a242c>
1454a33fa: 46 8d 14 00                 	leal	(%rax,%r8), %r10d
1454a33fe: 4d 89 c1                    	movq	%r8, %r9
1454a3401: 41 f6 c2 01                 	testb	$0x1, %r10b
1454a3405: 75 19                       	jne	0x1454a3420 <.text+0x54a2420>
1454a3407: 4a 8b 54 c1 08              	movq	0x8(%rcx,%r8,8), %rdx
1454a340c: 4d 89 c1                    	movq	%r8, %r9
1454a340f: 48 39 fa                    	cmpq	%rdi, %rdx
1454a3412: 74 08                       	je	0x1454a341c <.text+0x54a241c>
1454a3414: 4a 89 14 c1                 	movq	%rdx, (%rcx,%r8,8)
1454a3418: 4d 8d 48 01                 	leaq	0x1(%r8), %r9
1454a341c: 49 8d 50 02                 	leaq	0x2(%r8), %rdx
1454a3420: 4c 8d 50 fe                 	leaq	-0x2(%rax), %r10
1454a3424: 4d 39 c2                    	cmpq	%r8, %r10
1454a3427: 4d 89 c8                    	movq	%r9, %r8
1454a342a: 75 20                       	jne	0x1454a344c <.text+0x54a244c>
1454a342c: 4d 89 85 a8 07 00 00        	movq	%r8, 0x7a8(%r13)
1454a3433: e9 1a ff ff ff              	jmp	0x1454a3352 <.text+0x54a2352>
1454a3438: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a3440: 48 83 c2 02                 	addq	$0x2, %rdx
1454a3444: 4d 89 c8                    	movq	%r9, %r8
1454a3447: 48 39 d0                    	cmpq	%rdx, %rax
1454a344a: 74 e0                       	je	0x1454a342c <.text+0x54a242c>
1454a344c: 4c 8b 04 d1                 	movq	(%rcx,%rdx,8), %r8
1454a3450: 49 39 f8                    	cmpq	%rdi, %r8
1454a3453: 74 07                       	je	0x1454a345c <.text+0x54a245c>
1454a3455: 4e 89 04 c9                 	movq	%r8, (%rcx,%r9,8)
1454a3459: 49 ff c1                    	incq	%r9
1454a345c: 4c 8b 44 d1 08              	movq	0x8(%rcx,%rdx,8), %r8
1454a3461: 49 39 f8                    	cmpq	%rdi, %r8
1454a3464: 74 da                       	je	0x1454a3440 <.text+0x54a2440>
1454a3466: 4e 89 04 c9                 	movq	%r8, (%rcx,%r9,8)
1454a346a: 49 ff c1                    	incq	%r9
1454a346d: eb d1                       	jmp	0x1454a3440 <.text+0x54a2440>
1454a346f: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a3476: 48 85 d2                    	testq	%rdx, %rdx
1454a3479: 74 16                       	je	0x1454a3491 <.text+0x54a2491>
1454a347b: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a347f: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a3485: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a348c: e8 3f ed b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a3491: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a349a: 48 8b 85 90 02 00 00        	movq	0x290(%rbp), %rax
1454a34a1: 0f 10 40 3c                 	movups	0x3c(%rax), %xmm0
1454a34a5: 0f 11 85 6c 02 00 00        	movups	%xmm0, 0x26c(%rbp)
1454a34ac: 0f 10 00                    	movups	(%rax), %xmm0
1454a34af: 0f 10 48 10                 	movups	0x10(%rax), %xmm1
1454a34b3: 0f 10 50 20                 	movups	0x20(%rax), %xmm2
1454a34b7: 0f 10 58 30                 	movups	0x30(%rax), %xmm3
1454a34bb: 0f 29 9d 60 02 00 00        	movaps	%xmm3, 0x260(%rbp)
1454a34c2: 0f 29 95 50 02 00 00        	movaps	%xmm2, 0x250(%rbp)
1454a34c9: 0f 29 8d 40 02 00 00        	movaps	%xmm1, 0x240(%rbp)
1454a34d0: 0f 29 85 30 02 00 00        	movaps	%xmm0, 0x230(%rbp)
1454a34d7: 49 8b 8d a0 02 00 00        	movq	0x2a0(%r13), %rcx
1454a34de: 48 85 c9                    	testq	%rcx, %rcx
1454a34e1: 0f 84 9d 03 00 00           	je	0x1454a3884 <.text+0x54a2884>
1454a34e7: 49 8b 85 98 02 00 00        	movq	0x298(%r13), %rax
1454a34ee: 48 6b c9 58                 	imulq	$0x58, %rcx, %rcx
1454a34f2: 31 d2                       	xorl	%edx, %edx
1454a34f4: eb 13                       	jmp	0x1454a3509 <.text+0x54a2509>
1454a34f6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a3500: 48 83 c2 58                 	addq	$0x58, %rdx
1454a3504: 48 39 d1                    	cmpq	%rdx, %rcx
1454a3507: 74 5d                       	je	0x1454a3566 <.text+0x54a2566>
1454a3509: 4c 8b 04 10                 	movq	(%rax,%rdx), %r8
1454a350d: 49 83 78 08 09              	cmpq	$0x9, 0x8(%r8)
1454a3512: 75 ec                       	jne	0x1454a3500 <.text+0x54a2500>
1454a3514: 4d 8b 00                    	movq	(%r8), %r8
1454a3517: 4d 8b 08                    	movq	(%r8), %r9
1454a351a: 4d 31 e1                    	xorq	%r12, %r9
1454a351d: 45 0f b6 40 08              	movzbl	0x8(%r8), %r8d
1454a3522: 49 83 f0 65                 	xorq	$0x65, %r8
1454a3526: 4d 09 c8                    	orq	%r9, %r8
1454a3529: 75 d5                       	jne	0x1454a3500 <.text+0x54a2500>
1454a352b: f3 41 0f 10 85 c4 07 00 00  	movss	0x7c4(%r13), %xmm0
1454a3534: f3 0f 59 05 a4 58 45 00     	mulss	0x4558a4(%rip), %xmm0   # 0x1458f8de0
1454a353c: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454a3541: 31 c9                       	xorl	%ecx, %ecx
1454a3543: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a3546: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1454a3549: 0f 43 c8                    	cmovael	%eax, %ecx
1454a354c: 0f 2e 05 c9 7f 44 00        	ucomiss	0x447fc9(%rip), %xmm0   # 0x1458eb51c
1454a3553: 41 b8 ff ff ff ff           	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a3559: 44 0f 46 c1                 	cmovbel	%ecx, %r8d
1454a355d: 66 b8 18 00                 	movw	$0x18, %ax
1454a3561: e9 2c 02 00 00              	jmp	0x1454a3792 <.text+0x54a2792>
1454a3566: 31 d2                       	xorl	%edx, %edx
1454a3568: 49 b8 73 65 61 6c 5f 66 61 74       	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454a3572: eb 15                       	jmp	0x1454a3589 <.text+0x54a2589>
1454a3574: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a3580: 48 83 c2 58                 	addq	$0x58, %rdx
1454a3584: 48 39 d1                    	cmpq	%rdx, %rcx
1454a3587: 74 39                       	je	0x1454a35c2 <.text+0x54a25c2>
1454a3589: 4c 8b 0c 10                 	movq	(%rax,%rdx), %r9
1454a358d: 49 83 79 08 09              	cmpq	$0x9, 0x8(%r9)
1454a3592: 75 ec                       	jne	0x1454a3580 <.text+0x54a2580>
1454a3594: 4d 8b 09                    	movq	(%r9), %r9
1454a3597: 4d 8b 11                    	movq	(%r9), %r10
1454a359a: 4d 31 c2                    	xorq	%r8, %r10
1454a359d: 45 0f b6 49 08              	movzbl	0x8(%r9), %r9d
1454a35a2: 49 83 f1 65                 	xorq	$0x65, %r9
1454a35a6: 4d 09 d1                    	orq	%r10, %r9
1454a35a9: 75 d5                       	jne	0x1454a3580 <.text+0x54a2580>
1454a35ab: 41 8b 85 d0 07 00 00        	movl	0x7d0(%r13), %eax
1454a35b2: c1 e0 02                    	shll	$0x2, %eax
1454a35b5: 44 8d 04 80                 	leal	(%rax,%rax,4), %r8d
1454a35b9: 66 b8 1a 00                 	movw	$0x1a, %ax
1454a35bd: e9 d0 01 00 00              	jmp	0x1454a3792 <.text+0x54a2792>
1454a35c2: 31 d2                       	xorl	%edx, %edx
1454a35c4: 49 b8 73 6f 75 6c 5f 66 69 72       	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454a35ce: eb 09                       	jmp	0x1454a35d9 <.text+0x54a25d9>
1454a35d0: 48 83 c2 58                 	addq	$0x58, %rdx
1454a35d4: 48 39 d1                    	cmpq	%rdx, %rcx
1454a35d7: 74 35                       	je	0x1454a360e <.text+0x54a260e>
1454a35d9: 4c 8b 0c 10                 	movq	(%rax,%rdx), %r9
1454a35dd: 49 83 79 08 09              	cmpq	$0x9, 0x8(%r9)
1454a35e2: 75 ec                       	jne	0x1454a35d0 <.text+0x54a25d0>
1454a35e4: 4d 8b 09                    	movq	(%r9), %r9
1454a35e7: 4d 8b 11                    	movq	(%r9), %r10
1454a35ea: 4d 31 c2                    	xorq	%r8, %r10
1454a35ed: 45 0f b6 49 08              	movzbl	0x8(%r9), %r9d
1454a35f2: 49 83 f1 65                 	xorq	$0x65, %r9
1454a35f6: 4d 09 d1                    	orq	%r10, %r9
1454a35f9: 75 d5                       	jne	0x1454a35d0 <.text+0x54a25d0>
1454a35fb: 41 8b 85 d8 07 00 00        	movl	0x7d8(%r13), %eax
1454a3602: c1 e0 02                    	shll	$0x2, %eax
1454a3605: 44 8d 04 80                 	leal	(%rax,%rax,4), %r8d
1454a3609: e9 80 01 00 00              	jmp	0x1454a378e <.text+0x54a278e>
1454a360e: 31 d2                       	xorl	%edx, %edx
1454a3610: 49 b9 6c 69 67 68 74 77 65 6c       	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
1454a361a: eb 11                       	jmp	0x1454a362d <.text+0x54a262d>
1454a361c: 0f 1f 40 00                 	nopl	(%rax)
1454a3620: 48 83 c2 58                 	addq	$0x58, %rdx
1454a3624: 48 39 d1                    	cmpq	%rdx, %rcx
1454a3627: 0f 84 57 02 00 00           	je	0x1454a3884 <.text+0x54a2884>
1454a362d: 4c 8b 04 10                 	movq	(%rax,%rdx), %r8
1454a3631: 49 83 78 08 09              	cmpq	$0x9, 0x8(%r8)
1454a3636: 75 e8                       	jne	0x1454a3620 <.text+0x54a2620>
1454a3638: 49 8b 38                    	movq	(%r8), %rdi
1454a363b: 4c 8b 17                    	movq	(%rdi), %r10
1454a363e: 4d 31 ca                    	xorq	%r9, %r10
1454a3641: 44 0f b6 5f 08              	movzbl	0x8(%rdi), %r11d
1454a3646: 49 83 f3 6c                 	xorq	$0x6c, %r11
1454a364a: 4d 09 d3                    	orq	%r10, %r11
1454a364d: 75 d1                       	jne	0x1454a3620 <.text+0x54a2620>
1454a364f: 8b 4c 10 08                 	movl	0x8(%rax,%rdx), %ecx
1454a3653: f3 0f 10 44 10 14           	movss	0x14(%rax,%rdx), %xmm0
1454a3659: 44 8b 4c 10 18              	movl	0x18(%rax,%rdx), %r9d
1454a365e: 44 8b 54 10 34              	movl	0x34(%rax,%rdx), %r10d
1454a3663: 44 89 95 d4 00 00 00        	movl	%r10d, 0xd4(%rbp)
1454a366a: 0f 10 4c 10 24              	movups	0x24(%rax,%rdx), %xmm1
1454a366f: 0f 11 8d c4 00 00 00        	movups	%xmm1, 0xc4(%rbp)
1454a3676: 0f 10 4c 10 38              	movups	0x38(%rax,%rdx), %xmm1
1454a367b: 0f 10 54 10 44              	movups	0x44(%rax,%rdx), %xmm2
1454a3680: 0f 11 8d d8 00 00 00        	movups	%xmm1, 0xd8(%rbp)
1454a3687: 0f 11 95 e4 00 00 00        	movups	%xmm2, 0xe4(%rbp)
1454a368e: 4c 89 85 a0 00 00 00        	movq	%r8, 0xa0(%rbp)
1454a3695: 89 8d a8 00 00 00           	movl	%ecx, 0xa8(%rbp)
1454a369b: f2 0f 10 4c 10 0c           	movsd	0xc(%rax,%rdx), %xmm1
1454a36a1: f2 0f 11 8d ac 00 00 00     	movsd	%xmm1, 0xac(%rbp)
1454a36a9: f3 0f 11 85 b4 00 00 00     	movss	%xmm0, 0xb4(%rbp)
1454a36b1: 44 89 8d b8 00 00 00        	movl	%r9d, 0xb8(%rbp)
1454a36b8: f2 0f 10 44 10 1c           	movsd	0x1c(%rax,%rdx), %xmm0
1454a36be: f2 0f 11 85 bc 00 00 00     	movsd	%xmm0, 0xbc(%rbp)
1454a36c6: 49 8b 85 90 07 00 00        	movq	0x790(%r13), %rax
1454a36cd: 48 85 c0                    	testq	%rax, %rax
1454a36d0: 74 2a                       	je	0x1454a36fc <.text+0x54a26fc>
1454a36d2: 49 8b 8d 88 07 00 00        	movq	0x788(%r13), %rcx
1454a36d9: 48 c1 e0 05                 	shlq	$0x5, %rax
1454a36dd: f3 0f 10 4c 01 f4           	movss	-0xc(%rcx,%rax), %xmm1
1454a36e3: f3 0f 10 44 01 fc           	movss	-0x4(%rcx,%rax), %xmm0
1454a36e9: f3 41 0f 5c c8              	subss	%xmm8, %xmm1
1454a36ee: f3 0f 5f 05 2a 2f 45 00     	maxss	0x452f2a(%rip), %xmm0   # 0x1458f6620
1454a36f6: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a36fa: eb 56                       	jmp	0x1454a3752 <.text+0x54a2752>
1454a36fc: 49 8d 9d 20 07 00 00        	leaq	0x720(%r13), %rbx
1454a3703: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a370a: 48 8d 95 30 02 00 00        	leaq	0x230(%rbp), %rdx
1454a3711: e8 ba 82 f7 ff              	callq	0x14541b9d0 <.text+0x541a9d0>
1454a3716: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a3719: a8 01                       	testb	$0x1, %al
1454a371b: 75 08                       	jne	0x1454a3725 <.text+0x54a2725>
1454a371d: f3 0f 10 3d 7b 58 45 00     	movss	0x45587b(%rip), %xmm7   # 0x1458f8fa0
1454a3725: 41 b8 09 00 00 00           	movl	$0x9, %r8d
1454a372b: 48 89 d9                    	movq	%rbx, %rcx
1454a372e: 48 89 fa                    	movq	%rdi, %rdx
1454a3731: e8 2a 02 f7 ff              	callq	0x145413960 <.text+0x5412960>
1454a3736: f3 41 0f 5c c0              	subss	%xmm8, %xmm0
1454a373b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a373e: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454a3742: f3 0f 5e c7                 	divss	%xmm7, %xmm0
1454a3746: f3 0f 10 0d 32 7d 44 00     	movss	0x447d32(%rip), %xmm1   # 0x1458eb480
1454a374e: f3 0f 5c c8                 	subss	%xmm0, %xmm1
1454a3752: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a3755: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454a3759: f3 0f 10 0d 1f 7d 44 00     	movss	0x447d1f(%rip), %xmm1   # 0x1458eb480
1454a3761: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1454a3765: f3 0f 59 0d bf 7d 44 00     	mulss	0x447dbf(%rip), %xmm1   # 0x1458eb52c
1454a376d: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a3770: f3 48 0f 2c c1              	cvttss2si	%xmm1, %rax
1454a3775: 31 c9                       	xorl	%ecx, %ecx
1454a3777: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a377a: 0f 43 c8                    	cmovael	%eax, %ecx
1454a377d: 0f 2e 0d 98 7d 44 00        	ucomiss	0x447d98(%rip), %xmm1   # 0x1458eb51c
1454a3784: 41 b8 ff ff ff ff           	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a378a: 44 0f 46 c1                 	cmovbel	%ecx, %r8d
1454a378e: 66 b8 17 00                 	movw	$0x17, %ax
1454a3792: 41 83 bd b8 07 00 00 01     	cmpl	$0x1, 0x7b8(%r13)
1454a379a: 75 17                       	jne	0x1454a37b3 <.text+0x54a27b3>
1454a379c: 66 41 39 85 bc 07 00 00     	cmpw	%ax, 0x7bc(%r13)
1454a37a4: 75 0d                       	jne	0x1454a37b3 <.text+0x54a27b3>
1454a37a6: 45 39 85 c0 07 00 00        	cmpl	%r8d, 0x7c0(%r13)
1454a37ad: 0f 84 d1 00 00 00           	je	0x1454a3884 <.text+0x54a2884>
1454a37b3: 41 c7 85 b8 07 00 00 01 00 00 00    	movl	$0x1, 0x7b8(%r13)
1454a37be: 66 41 89 85 bc 07 00 00     	movw	%ax, 0x7bc(%r13)
1454a37c6: 45 89 85 c0 07 00 00        	movl	%r8d, 0x7c0(%r13)
1454a37cd: 49 8b 8d b8 08 00 00        	movq	0x8b8(%r13), %rcx
1454a37d4: 48 85 c9                    	testq	%rcx, %rcx
1454a37d7: 74 65                       	je	0x1454a383e <.text+0x54a283e>
1454a37d9: 4d 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %r9
1454a37e0: 44 0f b7 51 36              	movzwl	0x36(%rcx), %r10d
1454a37e5: 45 89 d3                    	movl	%r10d, %r11d
1454a37e8: 45 01 db                    	addl	%r11d, %r11d
1454a37eb: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a37f2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a3800: 4d 85 db                    	testq	%r11, %r11
1454a3803: 74 22                       	je	0x1454a3827 <.text+0x54a2827>
1454a3805: 66 3b 44 51 3a              	cmpw	0x3a(%rcx,%rdx,2), %ax
1454a380a: 0f 97 c3                    	seta	%bl
1454a380d: 80 db 00                    	sbbb	$0x0, %bl
1454a3810: 48 ff c2                    	incq	%rdx
1454a3813: 49 83 c3 fe                 	addq	$-0x2, %r11
1454a3817: 80 fb 01                    	cmpb	$0x1, %bl
1454a381a: 74 e4                       	je	0x1454a3800 <.text+0x54a2800>
1454a381c: 44 0f b6 d3                 	movzbl	%bl, %r10d
1454a3820: 45 85 d2                    	testl	%r10d, %r10d
1454a3823: 75 05                       	jne	0x1454a382a <.text+0x54a282a>
1454a3825: eb 10                       	jmp	0x1454a3837 <.text+0x54a2837>
1454a3827: 4c 89 d2                    	movq	%r10, %rdx
1454a382a: 49 83 e9 01                 	subq	$0x1, %r9
1454a382e: 72 10                       	jb	0x1454a3840 <.text+0x54a2840>
1454a3830: 48 8b 4c d1 50              	movq	0x50(%rcx,%rdx,8), %rcx
1454a3835: eb a9                       	jmp	0x1454a37e0 <.text+0x54a27e0>
1454a3837: 44 89 44 91 08              	movl	%r8d, 0x8(%rcx,%rdx,4)
1454a383c: eb 46                       	jmp	0x1454a3884 <.text+0x54a2884>
1454a383e: 31 c9                       	xorl	%ecx, %ecx
1454a3840: 4d 8d 8d b8 08 00 00        	leaq	0x8b8(%r13), %r9
1454a3847: 0f b7 c0                    	movzwl	%ax, %eax
1454a384a: 4c 89 8d a0 00 00 00        	movq	%r9, 0xa0(%rbp)
1454a3851: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a3858: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a3863: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a386a: 48 89 85 c0 00 00 00        	movq	%rax, 0xc0(%rbp)
1454a3871: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a3878: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a387f: e8 cc 41 f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a3884: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a388d: f3 0f 11 85 d8 02 00 00     	movss	%xmm0, 0x2d8(%rbp)
1454a3895: 49 8d 85 f0 04 00 00        	leaq	0x4f0(%r13), %rax
1454a389c: 48 89 85 10 03 00 00        	movq	%rax, 0x310(%rbp)
1454a38a3: 49 8b 85 f0 04 00 00        	movq	0x4f0(%r13), %rax
1454a38aa: 49 8b 8d f8 04 00 00        	movq	0x4f8(%r13), %rcx
1454a38b1: 49 8b 95 00 05 00 00        	movq	0x500(%r13), %rdx
1454a38b8: 49 c7 85 f0 04 00 00 00 00 00 00    	movq	$0x0, 0x4f0(%r13)
1454a38c3: 49 c7 85 f8 04 00 00 08 00 00 00    	movq	$0x8, 0x4f8(%r13)
1454a38ce: 49 c7 85 00 05 00 00 00 00 00 00    	movq	$0x0, 0x500(%r13)
1454a38d9: 48 8d 14 92                 	leaq	(%rdx,%rdx,4), %rdx
1454a38dd: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454a38e1: 48 01 ca                    	addq	%rcx, %rdx
1454a38e4: 48 89 8d 30 02 00 00        	movq	%rcx, 0x230(%rbp)
1454a38eb: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
1454a38f2: 48 89 8d 38 02 00 00        	movq	%rcx, 0x238(%rbp)
1454a38f9: 48 89 95 48 02 00 00        	movq	%rdx, 0x248(%rbp)
1454a3900: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a3907: 48 8d 95 30 02 00 00        	leaq	0x230(%rbp), %rdx
1454a390e: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a3915: e8 06 29 0a 00              	callq	0x145546220 <.text+0x5545220>
1454a391a: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454a3921: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a3928: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1454a392f: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a3936: 48 8b bd b0 00 00 00        	movq	0xb0(%rbp), %rdi
1454a393d: 48 8b 85 c8 00 00 00        	movq	0xc8(%rbp), %rax
1454a3944: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
1454a394b: 0f 10 85 b8 00 00 00        	movups	0xb8(%rbp), %xmm0
1454a3952: 0f 29 85 30 02 00 00        	movaps	%xmm0, 0x230(%rbp)
1454a3959: 49 8b 85 f0 04 00 00        	movq	0x4f0(%r13), %rax
1454a3960: 48 85 c0                    	testq	%rax, %rax
1454a3963: 74 1a                       	je	0x1454a397f <.text+0x54a297f>
1454a3965: 49 8b 8d f8 04 00 00        	movq	0x4f8(%r13), %rcx
1454a396c: 48 c1 e0 04                 	shlq	$0x4, %rax
1454a3970: 48 8d 14 80                 	leaq	(%rax,%rax,4), %rdx
1454a3974: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a397a: e8 51 e8 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a397f: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454a3986: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a398d: 48 89 41 10                 	movq	%rax, 0x10(%rcx)
1454a3991: 0f 28 85 30 02 00 00        	movaps	0x230(%rbp), %xmm0
1454a3998: 0f 11 01                    	movups	%xmm0, (%rcx)
1454a399b: 48 85 ff                    	testq	%rdi, %rdi
1454a399e: 0f 84 06 03 00 00           	je	0x1454a3caa <.text+0x54a2caa>
1454a39a4: 48 8d 34 bf                 	leaq	(%rdi,%rdi,4), %rsi
1454a39a8: 48 c1 e6 04                 	shlq	$0x4, %rsi
1454a39ac: 4c 8b ad 40 03 00 00        	movq	0x340(%rbp), %r13
1454a39b3: 4c 01 ee                    	addq	%r13, %rsi
1454a39b6: 4c 8d a5 a8 00 00 00        	leaq	0xa8(%rbp), %r12
1454a39bd: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454a39c1: eb 39                       	jmp	0x1454a39fc <.text+0x54a29fc>
1454a39c3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a39d0: f3 0f 10 8d e4 00 00 00     	movss	0xe4(%rbp), %xmm1
1454a39d8: 4c 8b 85 c8 00 00 00        	movq	0xc8(%rbp), %r8
1454a39df: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a39e6: 45 31 c9                    	xorl	%r9d, %r9d
1454a39e9: e8 32 ba fe ff              	callq	0x14548f420 <.text+0x548e420>
1454a39ee: 90                          	nop
1454a39ef: 49 83 c5 50                 	addq	$0x50, %r13
1454a39f3: 49 39 f5                    	cmpq	%rsi, %r13
1454a39f6: 0f 84 ae 02 00 00           	je	0x1454a3caa <.text+0x54a2caa>
1454a39fc: 49 8b 45 00                 	movq	(%r13), %rax
1454a3a00: 48 83 f8 02                 	cmpq	$0x2, %rax
1454a3a04: 0f 84 a0 02 00 00           	je	0x1454a3caa <.text+0x54a2caa>
1454a3a0a: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a3a11: 49 8b 4d 48                 	movq	0x48(%r13), %rcx
1454a3a15: 49 89 4c 24 40              	movq	%rcx, 0x40(%r12)
1454a3a1a: 41 0f 10 45 08              	movups	0x8(%r13), %xmm0
1454a3a1f: 41 0f 10 4d 18              	movups	0x18(%r13), %xmm1
1454a3a24: 41 0f 10 55 28              	movups	0x28(%r13), %xmm2
1454a3a29: 41 0f 10 5d 38              	movups	0x38(%r13), %xmm3
1454a3a2e: 41 0f 11 5c 24 30           	movups	%xmm3, 0x30(%r12)
1454a3a34: 41 0f 11 54 24 20           	movups	%xmm2, 0x20(%r12)
1454a3a3a: 41 0f 11 4c 24 10           	movups	%xmm1, 0x10(%r12)
1454a3a40: 41 0f 11 04 24              	movups	%xmm0, (%r12)
1454a3a45: 80 bd e9 00 00 00 00        	cmpb	$0x0, 0xe9(%rbp)
1454a3a4c: 75 82                       	jne	0x1454a39d0 <.text+0x54a29d0>
1454a3a4e: 48 8b 8d c8 00 00 00        	movq	0xc8(%rbp), %rcx
1454a3a55: 48 85 c9                    	testq	%rcx, %rcx
1454a3a58: 74 46                       	je	0x1454a3aa0 <.text+0x54a2aa0>
1454a3a5a: 4c 8b 85 68 03 00 00        	movq	0x368(%rbp), %r8
1454a3a61: 49 8b 90 d0 00 00 00        	movq	0xd0(%r8), %rdx
1454a3a68: 4d 8b 80 d8 00 00 00        	movq	0xd8(%r8), %r8
1454a3a6f: 49 c1 e0 05                 	shlq	$0x5, %r8
1454a3a73: 4f 8d 04 40                 	leaq	(%r8,%r8,2), %r8
1454a3a77: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a3a80: 4d 85 c0                    	testq	%r8, %r8
1454a3a83: 74 1b                       	je	0x1454a3aa0 <.text+0x54a2aa0>
1454a3a85: 49 83 c0 a0                 	addq	$-0x60, %r8
1454a3a89: 48 39 4a 20                 	cmpq	%rcx, 0x20(%rdx)
1454a3a8d: 48 8d 52 60                 	leaq	0x60(%rdx), %rdx
1454a3a91: 75 ed                       	jne	0x1454a3a80 <.text+0x54a2a80>
1454a3a93: b1 02                       	movb	$0x2, %cl
1454a3a95: eb 0b                       	jmp	0x1454a3aa2 <.text+0x54a2aa2>
1454a3a97: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a3aa0: 31 c9                       	xorl	%ecx, %ecx
1454a3aa2: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a3aa9: 44 0f b6 82 11 01 00 00     	movzbl	0x111(%rdx), %r8d
1454a3ab1: 44 88 85 58 03 00 00        	movb	%r8b, 0x358(%rbp)
1454a3ab8: 88 8a 11 01 00 00           	movb	%cl, 0x111(%rdx)
1454a3abe: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a3ac5: 44 0f 10 4a 40              	movups	0x40(%rdx), %xmm9
1454a3aca: 48 89 42 40                 	movq	%rax, 0x40(%rdx)
1454a3ace: 48 89 4a 48                 	movq	%rcx, 0x48(%rdx)
1454a3ad2: 0f b6 85 ea 00 00 00        	movzbl	0xea(%rbp), %eax
1454a3ad9: 44 0f b6 ba ec 07 00 00     	movzbl	0x7ec(%rdx), %r15d
1454a3ae1: 88 82 ec 07 00 00           	movb	%al, 0x7ec(%rdx)
1454a3ae7: f3 44 0f 10 92 e4 08 00 00  	movss	0x8e4(%rdx), %xmm10
1454a3af0: f3 0f 10 bd e4 00 00 00     	movss	0xe4(%rbp), %xmm7
1454a3af8: 41 0f 2e f8                 	ucomiss	%xmm8, %xmm7
1454a3afc: 76 39                       	jbe	0x1454a3b37 <.text+0x54a2b37>
1454a3afe: 48 8b 95 c0 00 00 00        	movq	0xc0(%rbp), %rdx
1454a3b05: 44 8b 8d e0 00 00 00        	movl	0xe0(%rbp), %r9d
1454a3b0c: 0f b6 85 eb 00 00 00        	movzbl	0xeb(%rbp), %eax
1454a3b13: 0f b6 8d e8 00 00 00        	movzbl	0xe8(%rbp), %ecx
1454a3b1a: 88 4c 24 28                 	movb	%cl, 0x28(%rsp)
1454a3b1e: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a3b22: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a3b27: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3b2e: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454a3b31: e8 7a f3 01 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a3b36: 90                          	nop
1454a3b37: 80 bd b0 00 00 00 00        	cmpb	$0x0, 0xb0(%rbp)
1454a3b3e: 74 10                       	je	0x1454a3b50 <.text+0x54a2b50>
1454a3b40: 8b bd d0 00 00 00           	movl	0xd0(%rbp), %edi
1454a3b46: 83 ff 05                    	cmpl	$0x5, %edi
1454a3b49: 74 18                       	je	0x1454a3b63 <.text+0x54a2b63>
1454a3b4b: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a3b4e: eb 1b                       	jmp	0x1454a3b6b <.text+0x54a2b6b>
1454a3b50: 48 8b 9d c0 00 00 00        	movq	0xc0(%rbp), %rbx
1454a3b57: 44 8b b5 e0 00 00 00        	movl	0xe0(%rbp), %r14d
1454a3b5e: e9 fb 00 00 00              	jmp	0x1454a3c5e <.text+0x54a2c5e>
1454a3b63: f3 0f 10 85 d4 00 00 00     	movss	0xd4(%rbp), %xmm0
1454a3b6b: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3b72: 8b 81 9c 04 00 00           	movl	0x49c(%rcx), %eax
1454a3b78: 83 f8 03                    	cmpl	$0x3, %eax
1454a3b7b: ba 03 00 00 00              	movl	$0x3, %edx
1454a3b80: 0f 43 c2                    	cmovael	%edx, %eax
1454a3b83: 48 8b 91 d0 04 00 00        	movq	0x4d0(%rcx), %rdx
1454a3b8a: 48 8b 9d c0 00 00 00        	movq	0xc0(%rbp), %rbx
1454a3b91: 48 85 d2                    	testq	%rdx, %rdx
1454a3b94: 0f 84 8f 00 00 00           	je	0x1454a3c29 <.text+0x54a2c29>
1454a3b9a: f3 0f 10 9d b4 00 00 00     	movss	0xb4(%rbp), %xmm3
1454a3ba2: f3 0f 10 8d b8 00 00 00     	movss	0xb8(%rbp), %xmm1
1454a3baa: 44 8b 8d bc 00 00 00        	movl	0xbc(%rbp), %r9d
1454a3bb1: ff c0                       	incl	%eax
1454a3bb3: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3bba: 48 8b 89 c8 04 00 00        	movq	0x4c8(%rcx), %rcx
1454a3bc1: 48 69 d2 60 01 00 00        	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1454a3bc8: eb 16                       	jmp	0x1454a3be0 <.text+0x54a2be0>
1454a3bca: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a3bd0: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a3bd7: 48 81 c2 a0 fe ff ff        	addq	$-0x160, %rdx           # imm = 0xFEA0
1454a3bde: 74 49                       	je	0x1454a3c29 <.text+0x54a2c29>
1454a3be0: 48 39 99 88 00 00 00        	cmpq	%rbx, 0x88(%rcx)
1454a3be7: 75 e7                       	jne	0x1454a3bd0 <.text+0x54a2bd0>
1454a3be9: 83 79 68 01                 	cmpl	$0x1, 0x68(%rcx)
1454a3bed: 74 e1                       	je	0x1454a3bd0 <.text+0x54a2bd0>
1454a3bef: 8b 95 e0 00 00 00           	movl	0xe0(%rbp), %edx
1454a3bf5: 44 0f b6 85 eb 00 00 00     	movzbl	0xeb(%rbp), %r8d
1454a3bfd: f3 44 0f 11 54 24 50        	movss	%xmm10, 0x50(%rsp)
1454a3c04: 48 89 44 24 48              	movq	%rax, 0x48(%rsp)
1454a3c09: f3 0f 11 44 24 30           	movss	%xmm0, 0x30(%rsp)
1454a3c0f: 44 89 4c 24 28              	movl	%r9d, 0x28(%rsp)
1454a3c14: f3 0f 11 4c 24 20           	movss	%xmm1, 0x20(%rsp)
1454a3c1a: 48 c7 44 24 38 00 00 00 00  	movq	$0x0, 0x38(%rsp)
1454a3c23: e8 08 98 f6 ff              	callq	0x14540d430 <.text+0x540c430>
1454a3c28: 90                          	nop
1454a3c29: 44 8b b5 e0 00 00 00        	movl	0xe0(%rbp), %r14d
1454a3c30: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3c37: 48 89 da                    	movq	%rbx, %rdx
1454a3c3a: 45 89 f0                    	movl	%r14d, %r8d
1454a3c3d: 41 b1 01                    	movb	$0x1, %r9b
1454a3c40: e8 5b d7 02 00              	callq	0x1454d13a0 <.text+0x54d03a0>
1454a3c45: 90                          	nop
1454a3c46: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3c4d: 48 89 da                    	movq	%rbx, %rdx
1454a3c50: 45 89 f0                    	movl	%r14d, %r8d
1454a3c53: e8 e8 e1 02 00              	callq	0x1454d1e40 <.text+0x54d0e40>
1454a3c58: 90                          	nop
1454a3c59: 83 ff 05                    	cmpl	$0x5, %edi
1454a3c5c: 74 1f                       	je	0x1454a3c7d <.text+0x54a2c7d>
1454a3c5e: 44 89 74 24 20              	movl	%r14d, 0x20(%rsp)
1454a3c63: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3c6a: 48 89 da                    	movq	%rbx, %rdx
1454a3c6d: 4c 8d 85 d0 00 00 00        	leaq	0xd0(%rbp), %r8
1454a3c74: 0f 28 df                    	movaps	%xmm7, %xmm3
1454a3c77: e8 b4 99 04 00              	callq	0x1454ed630 <.text+0x54ec630>
1454a3c7c: 90                          	nop
1454a3c7d: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a3c84: 44 88 b8 ec 07 00 00        	movb	%r15b, 0x7ec(%rax)
1454a3c8b: 44 0f 11 48 40              	movups	%xmm9, 0x40(%rax)
1454a3c90: 0f b6 8d 58 03 00 00        	movzbl	0x358(%rbp), %ecx
1454a3c97: 88 88 11 01 00 00           	movb	%cl, 0x111(%rax)
1454a3c9d: 49 83 c5 50                 	addq	$0x50, %r13
1454a3ca1: 49 39 f5                    	cmpq	%rsi, %r13
1454a3ca4: 0f 85 52 fd ff ff           	jne	0x1454a39fc <.text+0x54a29fc>
1454a3caa: 48 8b 85 48 03 00 00        	movq	0x348(%rbp), %rax
1454a3cb1: 48 85 c0                    	testq	%rax, %rax
1454a3cb4: 74 1a                       	je	0x1454a3cd0 <.text+0x54a2cd0>
1454a3cb6: 48 c1 e0 04                 	shlq	$0x4, %rax
1454a3cba: 48 8d 14 80                 	leaq	(%rax,%rax,4), %rdx
1454a3cbe: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a3cc4: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a3ccb: e8 00 e5 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a3cd0: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a3cd7: 4d 8b b5 e8 04 00 00        	movq	0x4e8(%r13), %r14
1454a3cde: 4d 85 f6                    	testq	%r14, %r14
1454a3ce1: 0f 84 96 04 00 00           	je	0x1454a417d <.text+0x54a317d>
1454a3ce7: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a3cf0: 49 8d 85 38 05 00 00        	leaq	0x538(%r13), %rax
1454a3cf7: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a3cfe: f3 44 0f 10 0d b9 76 54 00  	movss	0x5476b9(%rip), %xmm9   # 0x1459eb3c0
1454a3d07: 45 31 e4                    	xorl	%r12d, %r12d
1454a3d0a: eb 1d                       	jmp	0x1454a3d29 <.text+0x54a2d29>
1454a3d0c: 0f 1f 40 00                 	nopl	(%rax)
1454a3d10: 48 01 d8                    	addq	%rbx, %rax
1454a3d13: 48 83 38 00                 	cmpq	$0x0, (%rax)
1454a3d17: 0f 84 73 02 00 00           	je	0x1454a3f90 <.text+0x54a2f90>
1454a3d1d: 49 ff c4                    	incq	%r12
1454a3d20: 4d 39 f4                    	cmpq	%r14, %r12
1454a3d23: 0f 83 54 04 00 00           	jae	0x1454a417d <.text+0x54a317d>
1454a3d29: 49 8b 85 e0 04 00 00        	movq	0x4e0(%r13), %rax
1454a3d30: 49 6b dc 58                 	imulq	$0x58, %r12, %rbx
1454a3d34: 44 0f 2e 44 18 50           	ucomiss	0x50(%rax,%rbx), %xmm8
1454a3d3a: 72 d4                       	jb	0x1454a3d10 <.text+0x54a2d10>
1454a3d3c: 4c 89 e1                    	movq	%r12, %rcx
1454a3d3f: 48 f7 d1                    	notq	%rcx
1454a3d42: 48 89 8d 48 03 00 00        	movq	%rcx, 0x348(%rbp)
1454a3d49: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a3d50: 4c 89 e7                    	movq	%r12, %rdi
1454a3d53: 4d 39 f4                    	cmpq	%r14, %r12
1454a3d56: 0f 83 47 6d 00 00           	jae	0x1454aaaa3 <.text+0x54a9aa3>
1454a3d5c: 48 8d 0c 18                 	leaq	(%rax,%rbx), %rcx
1454a3d60: 48 8b 34 18                 	movq	(%rax,%rbx), %rsi
1454a3d64: 4c 8b 6c 18 08              	movq	0x8(%rax,%rbx), %r13
1454a3d69: 44 8b 7c 18 10              	movl	0x10(%rax,%rbx), %r15d
1454a3d6e: 48 8b 54 18 18              	movq	0x18(%rax,%rbx), %rdx
1454a3d73: 48 89 95 58 03 00 00        	movq	%rdx, 0x358(%rbp)
1454a3d7a: f2 44 0f 10 5c 18 2c        	movsd	0x2c(%rax,%rbx), %xmm11
1454a3d81: 44 8b 64 18 34              	movl	0x34(%rax,%rbx), %r12d
1454a3d86: f3 44 0f 10 54 18 38        	movss	0x38(%rax,%rbx), %xmm10
1454a3d8d: f3 0f 10 7c 18 4c           	movss	0x4c(%rax,%rbx), %xmm7
1454a3d93: 48 8d 14 18                 	leaq	(%rax,%rbx), %rdx
1454a3d97: 48 83 c2 58                 	addq	$0x58, %rdx
1454a3d9b: 48 8b 85 48 03 00 00        	movq	0x348(%rbp), %rax
1454a3da2: 4c 01 f0                    	addq	%r14, %rax
1454a3da5: 4c 6b c0 58                 	imulq	$0x58, %rax, %r8
1454a3da9: e8 23 30 2b 00              	callq	0x145756dd1 <.text+0x5755dd1>
1454a3dae: 49 ff ce                    	decq	%r14
1454a3db1: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a3db8: 4c 89 b0 e8 04 00 00        	movq	%r14, 0x4e8(%rax)
1454a3dbf: 48 85 f6                    	testq	%rsi, %rsi
1454a3dc2: 0f 84 fc 00 00 00           	je	0x1454a3ec4 <.text+0x54a2ec4>
1454a3dc8: 48 83 fe 02                 	cmpq	$0x2, %rsi
1454a3dcc: 0f 84 d1 6c 00 00           	je	0x1454aaaa3 <.text+0x54a9aa3>
1454a3dd2: 45 85 ff                    	testl	%r15d, %r15d
1454a3dd5: 4c 8b b5 68 03 00 00        	movq	0x368(%rbp), %r14
1454a3ddc: 0f 84 a8 00 00 00           	je	0x1454a3e8a <.text+0x54a2e8a>
1454a3de2: 44 0f 13 9d 34 02 00 00     	movlps	%xmm11, 0x234(%rbp)
1454a3dea: 44 89 a5 3c 02 00 00        	movl	%r12d, 0x23c(%rbp)
1454a3df1: c7 85 30 02 00 00 01 00 00 00       	movl	$0x1, 0x230(%rbp)
1454a3dfb: c7 85 10 02 00 00 00 00 00 00       	movl	$0x0, 0x210(%rbp)
1454a3e05: 48 8d 85 10 02 00 00        	leaq	0x210(%rbp), %rax
1454a3e0c: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a3e11: 48 8d 85 30 02 00 00        	leaq	0x230(%rbp), %rax
1454a3e18: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a3e1d: 48 c7 44 24 20 00 00 00 00  	movq	$0x0, 0x20(%rsp)
1454a3e26: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454a3e2c: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a3e33: 4c 89 ea                    	movq	%r13, %rdx
1454a3e36: 45 89 f8                    	movl	%r15d, %r8d
1454a3e39: e8 62 73 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a3e3e: 49 8b b6 48 05 00 00        	movq	0x548(%r14), %rsi
1454a3e45: 49 3b b6 38 05 00 00        	cmpq	0x538(%r14), %rsi
1454a3e4c: 75 0d                       	jne	0x1454a3e5b <.text+0x54a2e5b>
1454a3e4e: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a3e55: e8 56 42 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a3e5a: 90                          	nop
1454a3e5b: 49 8b 86 40 05 00 00        	movq	0x540(%r14), %rax
1454a3e62: 48 89 f1                    	movq	%rsi, %rcx
1454a3e65: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a3e69: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a3e70: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a3e77: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a3e7c: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a3e80: 48 ff c6                    	incq	%rsi
1454a3e83: 49 89 b6 48 05 00 00        	movq	%rsi, 0x548(%r14)
1454a3e8a: f2 41 0f 10 86 e8 03 00 00  	movsd	0x3e8(%r14), %xmm0
1454a3e93: 41 0f 5c c3                 	subps	%xmm11, %xmm0
1454a3e97: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a3e9a: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a3e9e: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a3ea2: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a3ea5: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a3ea9: 44 0f 2e d0                 	ucomiss	%xmm0, %xmm10
1454a3ead: 72 15                       	jb	0x1454a3ec4 <.text+0x54a2ec4>
1454a3eaf: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a3eb6: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454a3eb9: 45 31 c0                    	xorl	%r8d, %r8d
1454a3ebc: 45 31 c9                    	xorl	%r9d, %r9d
1454a3ebf: e8 5c b5 fe ff              	callq	0x14548f420 <.text+0x548e420>
1454a3ec4: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a3ecb: 48 85 f6                    	testq	%rsi, %rsi
1454a3ece: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a3ed5: 49 89 fc                    	movq	%rdi, %r12
1454a3ed8: 0f 84 80 00 00 00           	je	0x1454a3f5e <.text+0x54a2f5e>
1454a3ede: e8 1d e3 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a3ee3: b9 20 00 00 00              	movl	$0x20, %ecx
1454a3ee8: ba 01 00 00 00              	movl	$0x1, %edx
1454a3eed: e8 ce e2 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a3ef2: 48 85 c0                    	testq	%rax, %rax
1454a3ef5: 0f 84 df 6a 00 00           	je	0x1454aa9da <.text+0x54a99da>
1454a3efb: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a3f02: 48 89 30                    	movq	%rsi, (%rax)
1454a3f05: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a3f0c: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a3f13: 75 0d                       	jne	0x1454a3f22 <.text+0x54a2f22>
1454a3f15: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a3f1c: e8 8f 41 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a3f21: 90                          	nop
1454a3f22: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a3f29: 48 89 f1                    	movq	%rsi, %rcx
1454a3f2c: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a3f30: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454a3f38: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a3f3f: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
1454a3f44: 48 c7 44 08 10 08 00 00 00  	movq	$0x8, 0x10(%rax,%rcx)
1454a3f4d: 66 c7 44 08 18 aa 00        	movw	$0xaa, 0x18(%rax,%rcx)
1454a3f54: 48 ff c6                    	incq	%rsi
1454a3f57: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a3f5e: 4d 8b b5 e8 04 00 00        	movq	0x4e8(%r13), %r14
1454a3f65: 4d 39 f4                    	cmpq	%r14, %r12
1454a3f68: 0f 83 0f 02 00 00           	jae	0x1454a417d <.text+0x54a317d>
1454a3f6e: 49 8b 85 e0 04 00 00        	movq	0x4e0(%r13), %rax
1454a3f75: 44 0f 2e 44 18 50           	ucomiss	0x50(%rax,%rbx), %xmm8
1454a3f7b: 0f 83 cf fd ff ff           	jae	0x1454a3d50 <.text+0x54a2d50>
1454a3f81: e9 8a fd ff ff              	jmp	0x1454a3d10 <.text+0x54a2d10>
1454a3f86: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a3f90: 8b 48 48                    	movl	0x48(%rax), %ecx
1454a3f93: 85 c9                       	testl	%ecx, %ecx
1454a3f95: 0f 84 82 fd ff ff           	je	0x1454a3d1d <.text+0x54a2d1d>
1454a3f9b: f3 0f 10 40 40              	movss	0x40(%rax), %xmm0
1454a3fa0: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
1454a3fa4: 0f 82 73 fd ff ff           	jb	0x1454a3d1d <.text+0x54a2d1d>
1454a3faa: ff c9                       	decl	%ecx
1454a3fac: 89 48 48                    	movl	%ecx, 0x48(%rax)
1454a3faf: f3 0f 58 40 44              	addss	0x44(%rax), %xmm0
1454a3fb4: f3 0f 11 40 40              	movss	%xmm0, 0x40(%rax)
1454a3fb9: 8b 48 34                    	movl	0x34(%rax), %ecx
1454a3fbc: 89 8d b8 02 00 00           	movl	%ecx, 0x2b8(%rbp)
1454a3fc2: 48 8b 48 2c                 	movq	0x2c(%rax), %rcx
1454a3fc6: 48 89 8d b0 02 00 00        	movq	%rcx, 0x2b0(%rbp)
1454a3fcd: f3 0f 10 58 38              	movss	0x38(%rax), %xmm3
1454a3fd2: 44 8b 70 3c                 	movl	0x3c(%rax), %r14d
1454a3fd6: f3 44 0f 10 50 4c           	movss	0x4c(%rax), %xmm10
1454a3fdc: 0f b6 58 54                 	movzbl	0x54(%rax), %ebx
1454a3fe0: 8b 48 28                    	movl	0x28(%rax), %ecx
1454a3fe3: 89 8d e0 02 00 00           	movl	%ecx, 0x2e0(%rbp)
1454a3fe9: 48 8b 40 20                 	movq	0x20(%rax), %rax
1454a3fed: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
1454a3ff4: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454a3ffd: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454a4006: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a400d: 4c 89 ea                    	movq	%r13, %rdx
1454a4010: 4c 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %r8
1454a4017: e8 b4 a0 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a401c: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454a4023: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a402a: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1454a4031: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a4038: 48 8b bd b0 00 00 00        	movq	0xb0(%rbp), %rdi
1454a403f: 48 85 ff                    	testq	%rdi, %rdi
1454a4042: 0f 84 00 01 00 00           	je	0x1454a4148 <.text+0x54a3148>
1454a4048: 48 c1 e7 03                 	shlq	$0x3, %rdi
1454a404c: 45 31 ff                    	xorl	%r15d, %r15d
1454a404f: 90                          	nop
1454a4050: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a4057: 4e 8b 2c 38                 	movq	(%rax,%r15), %r13
1454a405b: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a4062: 48 8b 86 80 08 00 00        	movq	0x880(%rsi), %rax
1454a4069: 48 8b 8e 98 08 00 00        	movq	0x898(%rsi), %rcx
1454a4070: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454a4074: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454a4078: 48 01 c2                    	addq	%rax, %rdx
1454a407b: 4c 8b 86 88 08 00 00        	movq	0x888(%rsi), %r8
1454a4082: 4d 89 c1                    	movq	%r8, %r9
1454a4085: 49 c1 e1 11                 	shlq	$0x11, %r9
1454a4089: 4c 8b 96 90 08 00 00        	movq	0x890(%rsi), %r10
1454a4090: 49 31 c2                    	xorq	%rax, %r10
1454a4093: 4c 31 c1                    	xorq	%r8, %rcx
1454a4096: 4d 31 d0                    	xorq	%r10, %r8
1454a4099: 4c 89 86 88 08 00 00        	movq	%r8, 0x888(%rsi)
1454a40a0: 48 31 c8                    	xorq	%rcx, %rax
1454a40a3: 48 89 86 80 08 00 00        	movq	%rax, 0x880(%rsi)
1454a40aa: 4d 31 ca                    	xorq	%r9, %r10
1454a40ad: 4c 89 96 90 08 00 00        	movq	%r10, 0x890(%rsi)
1454a40b4: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454a40b8: 48 89 8e 98 08 00 00        	movq	%rcx, 0x898(%rsi)
1454a40bf: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454a40c3: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a40c6: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454a40ca: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454a40cf: f3 0f 10 8e 64 04 00 00     	movss	0x464(%rsi), %xmm1
1454a40d7: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a40da: 77 14                       	ja	0x1454a40f0 <.text+0x54a30f0>
1454a40dc: 41 0f 28 fa                 	movaps	%xmm10, %xmm7
1454a40e0: eb 1b                       	jmp	0x1454a40fd <.text+0x54a30fd>
1454a40e2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a40f0: f3 0f 10 be 68 04 00 00     	movss	0x468(%rsi), %xmm7
1454a40f8: f3 41 0f 59 fa              	mulss	%xmm10, %xmm7
1454a40fd: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a4100: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a4105: 88 5c 24 20                 	movb	%bl, 0x20(%rsp)
1454a4109: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a410e: 48 89 f1                    	movq	%rsi, %rcx
1454a4111: 4c 89 ea                    	movq	%r13, %rdx
1454a4114: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454a4117: 45 89 f1                    	movl	%r14d, %r9d
1454a411a: e8 91 ed 01 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a411f: 90                          	nop
1454a4120: 44 89 74 24 20              	movl	%r14d, 0x20(%rsp)
1454a4125: 48 89 f1                    	movq	%rsi, %rcx
1454a4128: 4c 89 ea                    	movq	%r13, %rdx
1454a412b: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a4132: 0f 28 df                    	movaps	%xmm7, %xmm3
1454a4135: e8 f6 94 04 00              	callq	0x1454ed630 <.text+0x54ec630>
1454a413a: 90                          	nop
1454a413b: 49 83 c7 08                 	addq	$0x8, %r15
1454a413f: 4c 39 ff                    	cmpq	%r15, %rdi
1454a4142: 0f 85 08 ff ff ff           	jne	0x1454a4050 <.text+0x54a3050>
1454a4148: 48 8b 95 40 03 00 00        	movq	0x340(%rbp), %rdx
1454a414f: 48 85 d2                    	testq	%rdx, %rdx
1454a4152: 74 16                       	je	0x1454a416a <.text+0x54a316a>
1454a4154: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a4158: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a415e: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a4165: e8 66 e0 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a416a: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a4171: 4d 8b b5 e8 04 00 00        	movq	0x4e8(%r13), %r14
1454a4178: e9 a0 fb ff ff              	jmp	0x1454a3d1d <.text+0x54a2d1d>
1454a417d: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a4186: 49 8d 85 38 05 00 00        	leaq	0x538(%r13), %rax
1454a418d: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454a4194: 49 8d 85 e0 05 00 00        	leaq	0x5e0(%r13), %rax
1454a419b: 48 89 85 80 00 00 00        	movq	%rax, 0x80(%rbp)
1454a41a2: 49 8d 85 b8 08 00 00        	leaq	0x8b8(%r13), %rax
1454a41a9: 48 89 85 18 03 00 00        	movq	%rax, 0x318(%rbp)
1454a41b0: 49 8d 85 80 08 00 00        	leaq	0x880(%r13), %rax
1454a41b7: 48 89 45 60                 	movq	%rax, 0x60(%rbp)
1454a41bb: 45 0f 57 ff                 	xorps	%xmm15, %xmm15
1454a41bf: f3 44 0f 10 25 78 4b 45 00  	movss	0x454b78(%rip), %xmm12  # 0x1458f8d40
1454a41c8: f3 44 0f 10 35 43 82 75 00  	movss	0x758243(%rip), %xmm14  # 0x145bfc414
1454a41d1: f3 44 0f 10 2d 42 73 44 00  	movss	0x447342(%rip), %xmm13  # 0x1458eb51c
1454a41da: 45 31 ff                    	xorl	%r15d, %r15d
1454a41dd: 4d 89 fc                    	movq	%r15, %r12
1454a41e0: 49 f7 d4                    	notq	%r12
1454a41e3: 4d 6b f7 78                 	imulq	$0x78, %r15, %r14
1454a41e7: 4c 89 bd 48 03 00 00        	movq	%r15, 0x348(%rbp)
1454a41ee: eb 3c                       	jmp	0x1454a422c <.text+0x54a322c>
1454a41f0: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a41f7: 48 89 f1                    	movq	%rsi, %rcx
1454a41fa: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a41fe: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454a4206: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a420d: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
1454a4212: 48 c7 44 08 10 08 00 00 00  	movq	$0x8, 0x10(%rax,%rcx)
1454a421b: 66 c7 44 08 18 aa 00        	movw	$0xaa, 0x18(%rax,%rcx)
1454a4222: 48 ff c6                    	incq	%rsi
1454a4225: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a422c: 49 8b 9d 18 05 00 00        	movq	0x518(%r13), %rbx
1454a4233: 49 39 df                    	cmpq	%rbx, %r15
1454a4236: 0f 83 c0 10 00 00           	jae	0x1454a52fc <.text+0x54a42fc>
1454a423c: 49 8b 85 10 05 00 00        	movq	0x510(%r13), %rax
1454a4243: 4a 8d 0c 30                 	leaq	(%rax,%r14), %rcx
1454a4247: 46 0f 2e 44 30 6c           	ucomiss	0x6c(%rax,%r14), %xmm8
1454a424d: 0f 82 4d 04 00 00           	jb	0x1454a46a0 <.text+0x54a36a0>
1454a4253: 48 8b 79 58                 	movq	0x58(%rcx), %rdi
1454a4257: 48 8b 41 60                 	movq	0x60(%rcx), %rax
1454a425b: 8b 51 68                    	movl	0x68(%rcx), %edx
1454a425e: 48 8b 31                    	movq	(%rcx), %rsi
1454a4261: 89 95 a8 00 00 00           	movl	%edx, 0xa8(%rbp)
1454a4267: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a426e: 48 8d 51 78                 	leaq	0x78(%rcx), %rdx
1454a4272: 4a 8d 04 23                 	leaq	(%rbx,%r12), %rax
1454a4276: 4c 6b c0 78                 	imulq	$0x78, %rax, %r8
1454a427a: e8 52 2b 2b 00              	callq	0x145756dd1 <.text+0x5755dd1>
1454a427f: 48 ff cb                    	decq	%rbx
1454a4282: 49 89 9d 18 05 00 00        	movq	%rbx, 0x518(%r13)
1454a4289: 48 85 f6                    	testq	%rsi, %rsi
1454a428c: 0f 84 c8 6c 00 00           	je	0x1454aaf5a <.text+0x54a9f5a>
1454a4292: 8b 85 a8 00 00 00           	movl	0xa8(%rbp), %eax
1454a4298: 89 85 98 00 00 00           	movl	%eax, 0x98(%rbp)
1454a429e: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454a42a5: 48 89 85 90 00 00 00        	movq	%rax, 0x90(%rbp)
1454a42ac: 49 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %rax
1454a42b3: 48 85 c0                    	testq	%rax, %rax
1454a42b6: 49 bb 63 61 6c 6c 5f 6f 66 5f       	movabsq	$0x5f666f5f6c6c6163, %r11 # imm = 0x5F666F5F6C6C6163
1454a42c0: 48 be 6f 66 5f 66 6c 61 6d 65       	movabsq	$0x656d616c665f666f, %rsi # imm = 0x656D616C665F666F
1454a42ca: 0f 84 40 01 00 00           	je	0x1454a4410 <.text+0x54a3410>
1454a42d0: 49 8b 8d 98 02 00 00        	movq	0x298(%r13), %rcx
1454a42d7: 4c 6b c0 58                 	imulq	$0x58, %rax, %r8
1454a42db: 31 d2                       	xorl	%edx, %edx
1454a42dd: eb 0e                       	jmp	0x1454a42ed <.text+0x54a32ed>
1454a42df: 90                          	nop
1454a42e0: 48 83 c2 58                 	addq	$0x58, %rdx
1454a42e4: 49 39 d0                    	cmpq	%rdx, %r8
1454a42e7: 0f 84 23 01 00 00           	je	0x1454a4410 <.text+0x54a3410>
1454a42ed: 4c 8b 3c 11                 	movq	(%rcx,%rdx), %r15
1454a42f1: 49 83 7f 08 0d              	cmpq	$0xd, 0x8(%r15)
1454a42f6: 75 e8                       	jne	0x1454a42e0 <.text+0x54a32e0>
1454a42f8: 49 8b 07                    	movq	(%r15), %rax
1454a42fb: 4c 8b 08                    	movq	(%rax), %r9
1454a42fe: 4d 31 d9                    	xorq	%r11, %r9
1454a4301: 4c 8b 50 05                 	movq	0x5(%rax), %r10
1454a4305: 49 31 f2                    	xorq	%rsi, %r10
1454a4308: 4d 09 ca                    	orq	%r9, %r10
1454a430b: 75 d3                       	jne	0x1454a42e0 <.text+0x54a32e0>
1454a430d: 44 8b 44 11 08              	movl	0x8(%rcx,%rdx), %r8d
1454a4312: f3 0f 10 44 11 14           	movss	0x14(%rcx,%rdx), %xmm0
1454a4318: 44 8b 4c 11 18              	movl	0x18(%rcx,%rdx), %r9d
1454a431d: 44 8b 54 11 34              	movl	0x34(%rcx,%rdx), %r10d
1454a4322: 4c 8d 9d c4 00 00 00        	leaq	0xc4(%rbp), %r11
1454a4329: 45 89 53 10                 	movl	%r10d, 0x10(%r11)
1454a432d: 0f 10 4c 11 24              	movups	0x24(%rcx,%rdx), %xmm1
1454a4332: 41 0f 11 0b                 	movups	%xmm1, (%r11)
1454a4336: 0f 10 4c 11 38              	movups	0x38(%rcx,%rdx), %xmm1
1454a433b: 0f 10 54 11 44              	movups	0x44(%rcx,%rdx), %xmm2
1454a4340: 41 0f 11 53 20              	movups	%xmm2, 0x20(%r11)
1454a4345: 41 0f 11 4b 14              	movups	%xmm1, 0x14(%r11)
1454a434a: 4c 89 bd a0 00 00 00        	movq	%r15, 0xa0(%rbp)
1454a4351: 44 89 85 a8 00 00 00        	movl	%r8d, 0xa8(%rbp)
1454a4358: f3 0f 10 7c 11 10           	movss	0x10(%rcx,%rdx), %xmm7
1454a435e: f2 0f 10 4c 11 0c           	movsd	0xc(%rcx,%rdx), %xmm1
1454a4364: f2 0f 11 8d ac 00 00 00     	movsd	%xmm1, 0xac(%rbp)
1454a436c: f3 0f 11 85 b4 00 00 00     	movss	%xmm0, 0xb4(%rbp)
1454a4374: 44 89 8d b8 00 00 00        	movl	%r9d, 0xb8(%rbp)
1454a437b: f2 0f 10 44 11 1c           	movsd	0x1c(%rcx,%rdx), %xmm0
1454a4381: f2 0f 11 85 bc 00 00 00     	movsd	%xmm0, 0xbc(%rbp)
1454a4389: 49 8b 95 30 07 00 00        	movq	0x730(%r13), %rdx
1454a4390: f3 0f 10 0d 38 6f 54 00     	movss	0x546f38(%rip), %xmm1   # 0x1459eb2d0
1454a4398: 48 85 d2                    	testq	%rdx, %rdx
1454a439b: 74 56                       	je	0x1454a43f3 <.text+0x54a33f3>
1454a439d: 49 8b 8d 28 07 00 00        	movq	0x728(%r13), %rcx
1454a43a4: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a43a8: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
1454a43ac: 45 31 c0                    	xorl	%r8d, %r8d
1454a43af: eb 1c                       	jmp	0x1454a43cd <.text+0x54a33cd>
1454a43b1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a43c0: 49 83 c0 18                 	addq	$0x18, %r8
1454a43c4: 4c 39 c2                    	cmpq	%r8, %rdx
1454a43c7: 0f 84 a0 00 00 00           	je	0x1454a446d <.text+0x54a346d>
1454a43cd: 4a 83 7c 01 08 0d           	cmpq	$0xd, 0x8(%rcx,%r8)
1454a43d3: 75 eb                       	jne	0x1454a43c0 <.text+0x54a33c0>
1454a43d5: 4e 8b 0c 01                 	movq	(%rcx,%r8), %r9
1454a43d9: 4d 8b 11                    	movq	(%r9), %r10
1454a43dc: 4c 33 10                    	xorq	(%rax), %r10
1454a43df: 4d 8b 49 05                 	movq	0x5(%r9), %r9
1454a43e3: 4c 33 48 05                 	xorq	0x5(%rax), %r9
1454a43e7: 4d 09 d1                    	orq	%r10, %r9
1454a43ea: 75 d4                       	jne	0x1454a43c0 <.text+0x54a33c0>
1454a43ec: f3 42 0f 10 4c 01 10        	movss	0x10(%rcx,%r8), %xmm1
1454a43f3: f3 41 0f 10 95 e4 08 00 00  	movss	0x8e4(%r13), %xmm2
1454a43fc: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454a43ff: 0f 83 7e 00 00 00           	jae	0x1454a4483 <.text+0x54a3483>
1454a4405: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a4410: 48 85 ff                    	testq	%rdi, %rdi
1454a4413: 4c 8b bd 48 03 00 00        	movq	0x348(%rbp), %r15
1454a441a: 0f 84 0c fe ff ff           	je	0x1454a422c <.text+0x54a322c>
1454a4420: e8 db dd b5 fa              	callq	0x140002200 <.text+0x1200>
1454a4425: b9 20 00 00 00              	movl	$0x20, %ecx
1454a442a: ba 01 00 00 00              	movl	$0x1, %edx
1454a442f: e8 8c dd b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a4434: 48 85 c0                    	testq	%rax, %rax
1454a4437: 0f 84 9d 65 00 00           	je	0x1454aa9da <.text+0x54a99da>
1454a443d: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a4444: 48 89 38                    	movq	%rdi, (%rax)
1454a4447: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a444e: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a4455: 0f 85 95 fd ff ff           	jne	0x1454a41f0 <.text+0x54a31f0>
1454a445b: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a4462: e8 49 3c 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a4467: 90                          	nop
1454a4468: e9 83 fd ff ff              	jmp	0x1454a41f0 <.text+0x54a31f0>
1454a446d: f3 0f 10 0d 5b 6e 54 00     	movss	0x546e5b(%rip), %xmm1   # 0x1459eb2d0
1454a4475: f3 41 0f 10 95 e4 08 00 00  	movss	0x8e4(%r13), %xmm2
1454a447e: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454a4481: 72 8d                       	jb	0x1454a4410 <.text+0x54a3410>
1454a4483: f3 45 0f 10 95 58 04 00 00  	movss	0x458(%r13), %xmm10
1454a448c: f3 45 0f 10 8d 5c 04 00 00  	movss	0x45c(%r13), %xmm9
1454a4495: f3 0f 59 85 e4 00 00 00     	mulss	0xe4(%rbp), %xmm0
1454a449d: f3 41 0f 59 47 50           	mulss	0x50(%r15), %xmm0
1454a44a3: f3 41 0f 59 85 80 04 00 00  	mulss	0x480(%r13), %xmm0
1454a44ac: 44 0f 2e f0                 	ucomiss	%xmm0, %xmm14
1454a44b0: 73 25                       	jae	0x1454a44d7 <.text+0x54a34d7>
1454a44b2: f3 0f 58 05 16 a7 4e 01     	addss	0x14ea716(%rip), %xmm0  # 0x14698ebd0
1454a44ba: f3 44 0f 10 1d 1d 49 45 00  	movss	0x45491d(%rip), %xmm11  # 0x1458f8de0
1454a44c3: f3 41 0f 5e c3              	divss	%xmm11, %xmm0
1454a44c8: e8 8a 2a 2b 00              	callq	0x145756f57 <.text+0x5755f57>
1454a44cd: f3 41 0f 59 c3              	mulss	%xmm11, %xmm0
1454a44d2: f3 41 0f 58 c6              	addss	%xmm14, %xmm0
1454a44d7: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454a44e0: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454a44e9: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a44f0: 4c 89 ea                    	movq	%r13, %rdx
1454a44f3: 4c 8d 85 90 00 00 00        	leaq	0x90(%rbp), %r8
1454a44fa: 0f 28 d8                    	movaps	%xmm0, %xmm3
1454a44fd: e8 ce 9b 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a4502: 4c 8b ad e8 02 00 00        	movq	0x2e8(%rbp), %r13
1454a4509: 4d 85 ed                    	testq	%r13, %r13
1454a450c: 0f 84 48 01 00 00           	je	0x1454a465a <.text+0x54a365a>
1454a4512: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a4519: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a4520: e8 bb 04 03 00              	callq	0x1454d49e0 <.text+0x54d39e0>
1454a4525: 90                          	nop
1454a4526: 48 8b 9d e0 02 00 00        	movq	0x2e0(%rbp), %rbx
1454a452d: c7 85 b0 02 00 00 02 00 00 00       	movl	$0x2, 0x2b0(%rbp)
1454a4537: c7 85 10 02 00 00 00 00 00 00       	movl	$0x0, 0x210(%rbp)
1454a4541: 48 8d 85 10 02 00 00        	leaq	0x210(%rbp), %rax
1454a4548: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a454d: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a4554: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a4559: 4c 89 6c 24 20              	movq	%r13, 0x20(%rsp)
1454a455e: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a4565: 48 89 fa                    	movq	%rdi, %rdx
1454a4568: 41 b8 9d 20 00 00           	movl	$0x209d, %r8d           # imm = 0x209D
1454a456e: 49 89 d9                    	movq	%rbx, %r9
1454a4571: e8 2a 6c fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a4576: 90                          	nop
1454a4577: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a457e: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454a4585: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454a458c: 75 0d                       	jne	0x1454a459b <.text+0x54a359b>
1454a458e: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a4595: e8 16 3b 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a459a: 90                          	nop
1454a459b: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a45a2: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a45a9: 48 89 f1                    	movq	%rsi, %rcx
1454a45ac: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a45b0: 0f 10 85 30 02 00 00        	movups	0x230(%rbp), %xmm0
1454a45b7: 0f 10 8d 40 02 00 00        	movups	0x240(%rbp), %xmm1
1454a45be: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a45c3: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a45c7: 48 ff c6                    	incq	%rsi
1454a45ca: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454a45d1: 41 0f b6 47 75              	movzbl	0x75(%r15), %eax
1454a45d6: 04 fe                       	addb	$-0x2, %al
1454a45d8: f3 0f 10 05 a0 6e 44 00     	movss	0x446ea0(%rip), %xmm0   # 0x1458eb480
1454a45e0: 3c 06                       	cmpb	$0x6, %al
1454a45e2: 77 0f                       	ja	0x1454a45f3 <.text+0x54a35f3>
1454a45e4: 0f b6 c0                    	movzbl	%al, %eax
1454a45e7: 48 8d 0d ae 84 50 01        	leaq	0x15084ae(%rip), %rcx   # 0x1469aca9c
1454a45ee: f3 0f 10 04 81              	movss	(%rcx,%rax,4), %xmm0
1454a45f3: f3 41 0f 10 4f 44           	movss	0x44(%r15), %xmm1
1454a45f9: f3 44 0f 59 95 ec 00 00 00  	mulss	0xec(%rbp), %xmm10
1454a4602: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a4605: f3 0f c2 d1 01              	cmpltss	%xmm1, %xmm2
1454a460a: f3 41 0f 59 cc              	mulss	%xmm12, %xmm1
1454a460f: f3 0f 59 f9                 	mulss	%xmm1, %xmm7
1454a4613: f3 0f 59 bd d8 00 00 00     	mulss	0xd8(%rbp), %xmm7
1454a461b: 41 0f 54 d2                 	andps	%xmm10, %xmm2
1454a461f: f3 0f 59 f8                 	mulss	%xmm0, %xmm7
1454a4623: f3 0f 58 fa                 	addss	%xmm2, %xmm7
1454a4627: f3 44 0f 59 cf              	mulss	%xmm7, %xmm9
1454a462c: 4c 89 6c 24 28              	movq	%r13, 0x28(%rsp)
1454a4631: 48 89 5c 24 20              	movq	%rbx, 0x20(%rsp)
1454a4636: f3 44 0f 11 4c 24 30        	movss	%xmm9, 0x30(%rsp)
1454a463d: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a4644: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a464b: 49 89 f8                    	movq	%rdi, %r8
1454a464e: 41 b9 9d 20 00 00           	movl	$0x209d, %r9d           # imm = 0x209D
1454a4654: e8 77 fd 02 00              	callq	0x1454d43d0 <.text+0x54d33d0>
1454a4659: 90                          	nop
1454a465a: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a4661: 48 85 d2                    	testq	%rdx, %rdx
1454a4664: 74 16                       	je	0x1454a467c <.text+0x54a367c>
1454a4666: 48 8b 8d e0 02 00 00        	movq	0x2e0(%rbp), %rcx
1454a466d: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a4671: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a4677: e8 54 db b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a467c: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a4683: 48 85 ff                    	testq	%rdi, %rdi
1454a4686: 4c 8b bd 48 03 00 00        	movq	0x348(%rbp), %r15
1454a468d: 0f 85 8d fd ff ff           	jne	0x1454a4420 <.text+0x54a3420>
1454a4693: e9 94 fb ff ff              	jmp	0x1454a422c <.text+0x54a322c>
1454a4698: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a46a0: f3 0f 10 41 70              	movss	0x70(%rcx), %xmm0
1454a46a5: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
1454a46a9: 73 15                       	jae	0x1454a46c0 <.text+0x54a36c0>
1454a46ab: 49 ff c7                    	incq	%r15
1454a46ae: e9 2a fb ff ff              	jmp	0x1454a41dd <.text+0x54a31dd>
1454a46b3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a46c0: f3 0f 58 41 74              	addss	0x74(%rcx), %xmm0
1454a46c5: f3 0f 11 41 70              	movss	%xmm0, 0x70(%rcx)
1454a46ca: 49 8b 95 18 05 00 00        	movq	0x518(%r13), %rdx
1454a46d1: 49 39 d7                    	cmpq	%rdx, %r15
1454a46d4: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a46d9: 0f 83 53 67 00 00           	jae	0x1454aae32 <.text+0x54a9e32>
1454a46df: 49 8b 8d 10 05 00 00        	movq	0x510(%r13), %rcx
1454a46e6: 4e 8d 3c 31                 	leaq	(%rcx,%r14), %r15
1454a46ea: 4a 8b 44 31 58              	movq	0x58(%rcx,%r14), %rax
1454a46ef: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a46f6: 4a 8b 44 31 60              	movq	0x60(%rcx,%r14), %rax
1454a46fb: 42 8b 54 31 68              	movl	0x68(%rcx,%r14), %edx
1454a4700: 89 55 70                    	movl	%edx, 0x70(%rbp)
1454a4703: 48 89 45 68                 	movq	%rax, 0x68(%rbp)
1454a4707: 49 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %rax
1454a470e: 4a 8b 34 31                 	movq	(%rcx,%r14), %rsi
1454a4712: 48 85 c0                    	testq	%rax, %rax
1454a4715: 74 64                       	je	0x1454a477b <.text+0x54a377b>
1454a4717: 49 8b bd 98 02 00 00        	movq	0x298(%r13), %rdi
1454a471e: 4c 6b e0 58                 	imulq	$0x58, %rax, %r12
1454a4722: 48 8b 1e                    	movq	(%rsi), %rbx
1454a4725: 48 89 b5 58 03 00 00        	movq	%rsi, 0x358(%rbp)
1454a472c: 4c 8b 76 08                 	movq	0x8(%rsi), %r14
1454a4730: eb 18                       	jmp	0x1454a474a <.text+0x54a374a>
1454a4732: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a4740: 48 83 c7 58                 	addq	$0x58, %rdi
1454a4744: 49 83 c4 a8                 	addq	$-0x58, %r12
1454a4748: 74 25                       	je	0x1454a476f <.text+0x54a376f>
1454a474a: 48 8b 37                    	movq	(%rdi), %rsi
1454a474d: 4c 39 76 08                 	cmpq	%r14, 0x8(%rsi)
1454a4751: 75 ed                       	jne	0x1454a4740 <.text+0x54a3740>
1454a4753: 48 8b 0e                    	movq	(%rsi), %rcx
1454a4756: 48 89 da                    	movq	%rbx, %rdx
1454a4759: 4d 89 f0                    	movq	%r14, %r8
1454a475c: e8 76 26 2b 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454a4761: 85 c0                       	testl	%eax, %eax
1454a4763: 75 db                       	jne	0x1454a4740 <.text+0x54a3740>
1454a4765: 49 89 ff                    	movq	%rdi, %r15
1454a4768: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a476d: eb 0c                       	jmp	0x1454a477b <.text+0x54a377b>
1454a476f: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a4774: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a477b: f3 45 0f 10 4f 10           	movss	0x10(%r15), %xmm9
1454a4781: 41 8b 7f 18                 	movl	0x18(%r15), %edi
1454a4785: f3 45 0f 10 57 4c           	movss	0x4c(%r15), %xmm10
1454a478b: f3 45 0f 10 5f 44           	movss	0x44(%r15), %xmm11
1454a4791: 41 8b 5f 40                 	movl	0x40(%r15), %ebx
1454a4795: f3 45 0f 10 67 38           	movss	0x38(%r15), %xmm12
1454a479b: f3 41 0f 10 67 1c           	movss	0x1c(%r15), %xmm4
1454a47a1: 49 8b 85 00 07 00 00        	movq	0x700(%r13), %rax
1454a47a8: 48 85 c0                    	testq	%rax, %rax
1454a47ab: 66 41 bf 1c 00              	movw	$0x1c, %r15w
1454a47b0: 48 89 b5 58 03 00 00        	movq	%rsi, 0x358(%rbp)
1454a47b7: 0f 84 53 04 00 00           	je	0x1454a4c10 <.text+0x54a3c10>
1454a47bd: 49 8b 8d f8 06 00 00        	movq	0x6f8(%r13), %rcx
1454a47c4: 48 83 f8 01                 	cmpq	$0x1, %rax
1454a47c8: 75 0c                       	jne	0x1454a47d6 <.text+0x54a37d6>
1454a47ca: 31 d2                       	xorl	%edx, %edx
1454a47cc: f3 0f 10 3d a8 1e 45 00     	movss	0x451ea8(%rip), %xmm7   # 0x1458f667c
1454a47d4: eb 52                       	jmp	0x1454a4828 <.text+0x54a3828>
1454a47d6: 49 89 c0                    	movq	%rax, %r8
1454a47d9: 49 83 e0 fe                 	andq	$-0x2, %r8
1454a47dd: 4c 8d 49 44                 	leaq	0x44(%rcx), %r9
1454a47e1: 31 d2                       	xorl	%edx, %edx
1454a47e3: f3 0f 10 3d 91 1e 45 00     	movss	0x451e91(%rip), %xmm7   # 0x1458f667c
1454a47eb: eb 10                       	jmp	0x1454a47fd <.text+0x54a37fd>
1454a47ed: 0f 1f 00                    	nopl	(%rax)
1454a47f0: 48 83 c2 02                 	addq	$0x2, %rdx
1454a47f4: 49 83 e9 80                 	subq	$-0x80, %r9
1454a47f8: 49 39 d0                    	cmpq	%rdx, %r8
1454a47fb: 74 27                       	je	0x1454a4824 <.text+0x54a3824>
1454a47fd: 41 80 79 bc 16              	cmpb	$0x16, -0x44(%r9)
1454a4802: 74 0c                       	je	0x1454a4810 <.text+0x54a3810>
1454a4804: 41 80 79 fc 16              	cmpb	$0x16, -0x4(%r9)
1454a4809: 75 e5                       	jne	0x1454a47f0 <.text+0x54a37f0>
1454a480b: eb 10                       	jmp	0x1454a481d <.text+0x54a381d>
1454a480d: 0f 1f 00                    	nopl	(%rax)
1454a4810: f3 41 0f 58 79 c0           	addss	-0x40(%r9), %xmm7
1454a4816: 41 80 79 fc 16              	cmpb	$0x16, -0x4(%r9)
1454a481b: 75 d3                       	jne	0x1454a47f0 <.text+0x54a37f0>
1454a481d: f3 41 0f 58 39              	addss	(%r9), %xmm7
1454a4822: eb cc                       	jmp	0x1454a47f0 <.text+0x54a37f0>
1454a4824: a8 01                       	testb	$0x1, %al
1454a4826: 74 10                       	je	0x1454a4838 <.text+0x54a3838>
1454a4828: 48 c1 e2 06                 	shlq	$0x6, %rdx
1454a482c: 80 3c 11 16                 	cmpb	$0x16, (%rcx,%rdx)
1454a4830: 75 06                       	jne	0x1454a4838 <.text+0x54a3838>
1454a4832: f3 0f 58 7c 11 04           	addss	0x4(%rcx,%rdx), %xmm7
1454a4838: 41 0f 2e ff                 	ucomiss	%xmm15, %xmm7
1454a483c: 0f 86 ce 03 00 00           	jbe	0x1454a4c10 <.text+0x54a3c10>
1454a4842: 89 bd 28 03 00 00           	movl	%edi, 0x328(%rbp)
1454a4848: 45 0f 28 f3                 	movaps	%xmm11, %xmm14
1454a484c: 48 c1 e0 06                 	shlq	$0x6, %rax
1454a4850: 48 8b 95 90 02 00 00        	movq	0x290(%rbp), %rdx
1454a4857: f3 44 0f 10 1a              	movss	(%rdx), %xmm11
1454a485c: f3 41 0f 59 fb              	mulss	%xmm11, %xmm7
1454a4861: 31 d2                       	xorl	%edx, %edx
1454a4863: 31 ff                       	xorl	%edi, %edi
1454a4865: 45 31 c0                    	xorl	%r8d, %r8d
1454a4868: f3 0f 11 a5 a0 02 00 00     	movss	%xmm4, 0x2a0(%rbp)
1454a4870: 80 3c 11 16                 	cmpb	$0x16, (%rcx,%rdx)
1454a4874: 74 12                       	je	0x1454a4888 <.text+0x54a3888>
1454a4876: 49 ff c0                    	incq	%r8
1454a4879: 48 83 c7 28                 	addq	$0x28, %rdi
1454a487d: 48 83 c2 40                 	addq	$0x40, %rdx
1454a4881: 48 39 d0                    	cmpq	%rdx, %rax
1454a4884: 75 ea                       	jne	0x1454a4870 <.text+0x54a3870>
1454a4886: eb 3c                       	jmp	0x1454a48c4 <.text+0x54a38c4>
1454a4888: 4d 3b 85 18 07 00 00        	cmpq	0x718(%r13), %r8
1454a488f: 73 33                       	jae	0x1454a48c4 <.text+0x54a38c4>
1454a4891: 49 8b b5 10 07 00 00        	movq	0x710(%r13), %rsi
1454a4898: 48 8d 14 3e                 	leaq	(%rsi,%rdi), %rdx
1454a489c: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a48a3: e8 b8 94 58 fb              	callq	0x140a2dd60 <.text+0xa2cd60>
1454a48a8: 0f 10 44 3e 18              	movups	0x18(%rsi,%rdi), %xmm0
1454a48ad: 0f 11 85 48 02 00 00        	movups	%xmm0, 0x248(%rbp)
1454a48b4: c6 85 58 02 00 00 01        	movb	$0x1, 0x258(%rbp)
1454a48bb: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a48c2: eb 12                       	jmp	0x1454a48d6 <.text+0x54a38d6>
1454a48c4: 48 c7 85 30 02 00 00 fe ff ff ff    	movq	$-0x2, 0x230(%rbp)
1454a48cf: 48 c7 c2 fe ff ff ff        	movq	$-0x2, %rdx
1454a48d6: f3 41 0f 10 85 00 04 00 00  	movss	0x400(%r13), %xmm0
1454a48df: f3 0f 58 f8                 	addss	%xmm0, %xmm7
1454a48e3: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454a48e6: f3 41 0f 5d cb              	minss	%xmm11, %xmm1
1454a48eb: 44 0f 28 d9                 	movaps	%xmm1, %xmm11
1454a48ef: f3 44 0f c2 d9 03           	cmpunordss	%xmm1, %xmm11
1454a48f5: 41 0f 54 fb                 	andps	%xmm11, %xmm7
1454a48f9: 44 0f 55 d9                 	andnps	%xmm1, %xmm11
1454a48fd: 44 0f 56 df                 	orps	%xmm7, %xmm11
1454a4901: f3 45 0f 11 9d 00 04 00 00  	movss	%xmm11, 0x400(%r13)
1454a490a: f3 44 0f 5c d8              	subss	%xmm0, %xmm11
1454a490f: 45 0f 2e fb                 	ucomiss	%xmm11, %xmm15
1454a4913: 73 61                       	jae	0x1454a4976 <.text+0x54a3976>
1454a4915: 48 83 fa fe                 	cmpq	$-0x2, %rdx
1454a4919: 75 7a                       	jne	0x1454a4995 <.text+0x54a3995>
1454a491b: ba 05 00 00 00              	movl	$0x5, %edx
1454a4920: 48 8d 35 a9 66 50 01        	leaq	0x15066a9(%rip), %rsi   # 0x1469aafd0
1454a4927: 48 89 f1                    	movq	%rsi, %rcx
1454a492a: e8 d1 da fa ff              	callq	0x145452400 <.text+0x5451400>
1454a492f: 48 85 c0                    	testq	%rax, %rax
1454a4932: 48 0f 44 c6                 	cmoveq	%rsi, %rax
1454a4936: b9 05 00 00 00              	movl	$0x5, %ecx
1454a493b: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
1454a493f: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4946: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
1454a494d: 48 8d 05 81 66 50 01        	leaq	0x1506681(%rip), %rax   # 0x1469aafd5
1454a4954: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a495b: 48 c7 85 c0 00 00 00 18 00 00 00    	movq	$0x18, 0xc0(%rbp)
1454a4966: c6 85 c8 00 00 00 00        	movb	$0x0, 0xc8(%rbp)
1454a496d: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4974: eb 46                       	jmp	0x1454a49bc <.text+0x54a39bc>
1454a4976: 48 83 fa fd                 	cmpq	$-0x3, %rdx
1454a497a: 77 5f                       	ja	0x1454a49db <.text+0x54a39db>
1454a497c: 48 85 d2                    	testq	%rdx, %rdx
1454a497f: 74 5a                       	je	0x1454a49db <.text+0x54a39db>
1454a4981: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a4988: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a498e: e8 3d d8 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a4993: eb 46                       	jmp	0x1454a49db <.text+0x54a39db>
1454a4995: 4c 8d 85 38 02 00 00        	leaq	0x238(%rbp), %r8
1454a499c: 49 8b 40 20                 	movq	0x20(%r8), %rax
1454a49a0: 48 8d 8d c4 00 00 00        	leaq	0xc4(%rbp), %rcx
1454a49a7: 48 89 41 04                 	movq	%rax, 0x4(%rcx)
1454a49ab: 41 0f 10 00                 	movups	(%r8), %xmm0
1454a49af: 41 0f 10 48 10              	movups	0x10(%r8), %xmm1
1454a49b4: 0f 11 49 f4                 	movups	%xmm1, -0xc(%rcx)
1454a49b8: 0f 11 41 e4                 	movups	%xmm0, -0x1c(%rcx)
1454a49bc: 48 89 95 a0 00 00 00        	movq	%rdx, 0xa0(%rbp)
1454a49c3: f3 41 0f 5a d3              	cvtss2sd	%xmm11, %xmm2
1454a49c8: 48 8b 8d 80 00 00 00        	movq	0x80(%rbp), %rcx
1454a49cf: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a49d6: e8 a5 b5 04 00              	callq	0x1454eff80 <.text+0x54eef80>
1454a49db: f3 41 0f 10 85 00 04 00 00  	movss	0x400(%r13), %xmm0
1454a49e4: f3 41 0f 10 bd 58 04 00 00  	movss	0x458(%r13), %xmm7
1454a49ed: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a49f1: f3 41 0f 5f c3              	maxss	%xmm11, %xmm0
1454a49f6: e8 72 24 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
1454a49fb: f3 4c 0f 2c f0              	cvttss2si	%xmm0, %r14
1454a4a00: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a4a04: be 00 00 00 00              	movl	$0x0, %esi
1454a4a09: 44 0f 42 f6                 	cmovbl	%esi, %r14d
1454a4a0d: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a4a11: bf ff ff ff ff              	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454a4a16: 44 0f 47 f7                 	cmoval	%edi, %r14d
1454a4a1a: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a4a1d: e8 4b 24 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
1454a4a22: f3 4c 0f 2c c0              	cvttss2si	%xmm0, %r8
1454a4a27: 45 0f 57 ff                 	xorps	%xmm15, %xmm15
1454a4a2b: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a4a2f: 44 0f 42 c6                 	cmovbl	%esi, %r8d
1454a4a33: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a4a37: 44 0f 47 c7                 	cmoval	%edi, %r8d
1454a4a3b: 49 8b 85 b8 08 00 00        	movq	0x8b8(%r13), %rax
1454a4a42: 48 85 c0                    	testq	%rax, %rax
1454a4a45: 0f 84 fe 00 00 00           	je	0x1454a4b49 <.text+0x54a3b49>
1454a4a4b: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
1454a4a52: 45 0f 28 de                 	movaps	%xmm14, %xmm11
1454a4a56: 8b bd 28 03 00 00           	movl	0x328(%rbp), %edi
1454a4a5c: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4a64: 44 0f b7 58 36              	movzwl	0x36(%rax), %r11d
1454a4a69: 45 89 d9                    	movl	%r11d, %r9d
1454a4a6c: 45 01 c9                    	addl	%r9d, %r9d
1454a4a6f: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4a76: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a4a80: 4d 85 c9                    	testq	%r9, %r9
1454a4a83: 74 26                       	je	0x1454a4aab <.text+0x54a3aab>
1454a4a85: 66 44 3b 64 50 3a           	cmpw	0x3a(%rax,%rdx,2), %r12w
1454a4a8b: 41 0f 97 c2                 	seta	%r10b
1454a4a8f: 41 80 da 00                 	sbbb	$0x0, %r10b
1454a4a93: 48 ff c2                    	incq	%rdx
1454a4a96: 49 83 c1 fe                 	addq	$-0x2, %r9
1454a4a9a: 41 80 fa 01                 	cmpb	$0x1, %r10b
1454a4a9e: 74 e0                       	je	0x1454a4a80 <.text+0x54a3a80>
1454a4aa0: 45 0f b6 ca                 	movzbl	%r10b, %r9d
1454a4aa4: 45 85 c9                    	testl	%r9d, %r9d
1454a4aa7: 75 05                       	jne	0x1454a4aae <.text+0x54a3aae>
1454a4aa9: eb 14                       	jmp	0x1454a4abf <.text+0x54a3abf>
1454a4aab: 4c 89 da                    	movq	%r11, %rdx
1454a4aae: 48 83 e9 01                 	subq	$0x1, %rcx
1454a4ab2: 0f 82 30 08 00 00           	jb	0x1454a52e8 <.text+0x54a42e8>
1454a4ab8: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a4abd: eb a5                       	jmp	0x1454a4a64 <.text+0x54a3a64>
1454a4abf: 44 89 74 90 08              	movl	%r14d, 0x8(%rax,%rdx,4)
1454a4ac4: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a4acb: 48 8b 06                    	movq	(%rsi), %rax
1454a4ace: 48 85 c0                    	testq	%rax, %rax
1454a4ad1: 0f 84 e0 00 00 00           	je	0x1454a4bb7 <.text+0x54a3bb7>
1454a4ad7: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
1454a4ade: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a4ae5: 44 0f b7 58 36              	movzwl	0x36(%rax), %r11d
1454a4aea: 45 89 d9                    	movl	%r11d, %r9d
1454a4aed: 45 01 c9                    	addl	%r9d, %r9d
1454a4af0: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4af7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a4b00: 4d 85 c9                    	testq	%r9, %r9
1454a4b03: 74 26                       	je	0x1454a4b2b <.text+0x54a3b2b>
1454a4b05: 66 44 3b 7c 50 3a           	cmpw	0x3a(%rax,%rdx,2), %r15w
1454a4b0b: 41 0f 97 c2                 	seta	%r10b
1454a4b0f: 41 80 da 00                 	sbbb	$0x0, %r10b
1454a4b13: 48 ff c2                    	incq	%rdx
1454a4b16: 49 83 c1 fe                 	addq	$-0x2, %r9
1454a4b1a: 41 80 fa 01                 	cmpb	$0x1, %r10b
1454a4b1e: 74 e0                       	je	0x1454a4b00 <.text+0x54a3b00>
1454a4b20: 45 0f b6 ca                 	movzbl	%r10b, %r9d
1454a4b24: 45 85 c9                    	testl	%r9d, %r9d
1454a4b27: 75 05                       	jne	0x1454a4b2e <.text+0x54a3b2e>
1454a4b29: eb 14                       	jmp	0x1454a4b3f <.text+0x54a3b3f>
1454a4b2b: 4c 89 da                    	movq	%r11, %rdx
1454a4b2e: 48 83 e9 01                 	subq	$0x1, %rcx
1454a4b32: 0f 82 b8 07 00 00           	jb	0x1454a52f0 <.text+0x54a42f0>
1454a4b38: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a4b3d: eb a6                       	jmp	0x1454a4ae5 <.text+0x54a3ae5>
1454a4b3f: 44 89 44 90 08              	movl	%r8d, 0x8(%rax,%rdx,4)
1454a4b44: e9 c7 00 00 00              	jmp	0x1454a4c10 <.text+0x54a3c10>
1454a4b49: 4d 89 c4                    	movq	%r8, %r12
1454a4b4c: 31 c0                       	xorl	%eax, %eax
1454a4b4e: 45 0f 28 de                 	movaps	%xmm14, %xmm11
1454a4b52: 8b bd 28 03 00 00           	movl	0x328(%rbp), %edi
1454a4b58: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a4b5f: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454a4b66: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4b6d: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a4b78: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a4b7f: 48 c7 85 c0 00 00 00 16 00 00 00    	movq	$0x16, 0xc0(%rbp)
1454a4b8a: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a4b91: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a4b98: 45 89 f0                    	movl	%r14d, %r8d
1454a4b9b: e8 b0 2e f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a4ba0: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4ba8: 4d 89 e0                    	movq	%r12, %r8
1454a4bab: 48 8b 06                    	movq	(%rsi), %rax
1454a4bae: 48 85 c0                    	testq	%rax, %rax
1454a4bb1: 0f 85 20 ff ff ff           	jne	0x1454a4ad7 <.text+0x54a3ad7>
1454a4bb7: 31 c0                       	xorl	%eax, %eax
1454a4bb9: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454a4bc0: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4bc7: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a4bd2: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a4bd9: 48 c7 85 c0 00 00 00 1c 00 00 00    	movq	$0x1c, 0xc0(%rbp)
1454a4be4: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a4beb: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a4bf2: e8 59 2e f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a4bf7: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a4bfe: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4c06: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a4c10: f3 41 0f 10 95 58 04 00 00  	movss	0x458(%r13), %xmm2
1454a4c19: f3 45 0f 10 b5 5c 04 00 00  	movss	0x45c(%r13), %xmm14
1454a4c22: f3 41 0f 10 85 80 04 00 00  	movss	0x480(%r13), %xmm0
1454a4c2b: 41 8b 85 8c 04 00 00        	movl	0x48c(%r13), %eax
1454a4c32: f3 0f 10 4e 44              	movss	0x44(%rsi), %xmm1
1454a4c37: 0f b6 4e 75                 	movzbl	0x75(%rsi), %ecx
1454a4c3b: 80 c1 fe                    	addb	$-0x2, %cl
1454a4c3e: f3 0f 10 1d 3a 68 44 00     	movss	0x44683a(%rip), %xmm3   # 0x1458eb480
1454a4c46: 80 f9 06                    	cmpb	$0x6, %cl
1454a4c49: 77 0f                       	ja	0x1454a4c5a <.text+0x54a3c5a>
1454a4c4b: 0f b6 c9                    	movzbl	%cl, %ecx
1454a4c4e: 48 8d 15 47 7e 50 01        	leaq	0x1507e47(%rip), %rdx   # 0x1469aca9c
1454a4c55: f3 0f 10 1c 8a              	movss	(%rdx,%rcx,4), %xmm3
1454a4c5a: f3 44 0f 59 d2              	mulss	%xmm2, %xmm10
1454a4c5f: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a4c62: f3 0f c2 d1 01              	cmpltss	%xmm1, %xmm2
1454a4c67: 41 0f 54 d2                 	andps	%xmm10, %xmm2
1454a4c6b: f3 0f 59 0d cd 40 45 00     	mulss	0x4540cd(%rip), %xmm1   # 0x1458f8d40
1454a4c73: f3 44 0f 59 c9              	mulss	%xmm1, %xmm9
1454a4c78: f3 45 0f 59 e1              	mulss	%xmm9, %xmm12
1454a4c7d: f3 44 0f 59 e3              	mulss	%xmm3, %xmm12
1454a4c82: f3 44 0f 58 e2              	addss	%xmm2, %xmm12
1454a4c87: f3 45 0f 59 f4              	mulss	%xmm12, %xmm14
1454a4c8c: f3 0f 10 4e 50              	movss	0x50(%rsi), %xmm1
1454a4c91: 41 0f 2e cf                 	ucomiss	%xmm15, %xmm1
1454a4c95: 4c 8b bd 48 03 00 00        	movq	0x348(%rbp), %r15
1454a4c9c: 0f 86 1b 02 00 00           	jbe	0x1454a4ebd <.text+0x54a3ebd>
1454a4ca2: f3 44 0f 59 dc              	mulss	%xmm4, %xmm11
1454a4ca7: f3 44 0f 59 d9              	mulss	%xmm1, %xmm11
1454a4cac: f3 41 0f 59 c3              	mulss	%xmm11, %xmm0
1454a4cb1: f3 44 0f 10 0d 5a 77 75 00  	movss	0x75775a(%rip), %xmm9   # 0x145bfc414
1454a4cba: 44 0f 2e c8                 	ucomiss	%xmm0, %xmm9
1454a4cbe: f3 44 0f 10 15 f9 66 54 00  	movss	0x5466f9(%rip), %xmm10  # 0x1459eb3c0
1454a4cc7: 73 22                       	jae	0x1454a4ceb <.text+0x54a3ceb>
1454a4cc9: f3 0f 58 05 ff 9e 4e 01     	addss	0x14e9eff(%rip), %xmm0  # 0x14698ebd0
1454a4cd1: f3 0f 10 3d 07 41 45 00     	movss	0x454107(%rip), %xmm7   # 0x1458f8de0
1454a4cd9: f3 0f 5e c7                 	divss	%xmm7, %xmm0
1454a4cdd: e8 75 22 2b 00              	callq	0x145756f57 <.text+0x5755f57>
1454a4ce2: f3 0f 59 c7                 	mulss	%xmm7, %xmm0
1454a4ce6: f3 41 0f 58 c1              	addss	%xmm9, %xmm0
1454a4ceb: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454a4cf4: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454a4cfd: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a4d04: 4c 89 ea                    	movq	%r13, %rdx
1454a4d07: 4c 8d 45 68                 	leaq	0x68(%rbp), %r8
1454a4d0b: 0f 28 d8                    	movaps	%xmm0, %xmm3
1454a4d0e: e8 bd 93 04 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454a4d13: 44 8b 46 64                 	movl	0x64(%rsi), %r8d
1454a4d17: 4c 8b 8d 38 02 00 00        	movq	0x238(%rbp), %r9
1454a4d1e: 48 8b 9d 40 02 00 00        	movq	0x240(%rbp), %rbx
1454a4d25: c7 85 d8 02 00 00 02 00 00 00       	movl	$0x2, 0x2d8(%rbp)
1454a4d2f: c7 85 b0 02 00 00 00 00 00 00       	movl	$0x0, 0x2b0(%rbp)
1454a4d39: c6 85 25 03 00 00 01        	movb	$0x1, 0x325(%rbp)
1454a4d40: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a4d47: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a4d4c: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
1454a4d53: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a4d58: 48 89 5c 24 20              	movq	%rbx, 0x20(%rsp)
1454a4d5d: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a4d64: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a4d6b: 4c 89 8d 38 03 00 00        	movq	%r9, 0x338(%rbp)
1454a4d72: e8 29 64 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a4d77: 90                          	nop
1454a4d78: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a4d7f: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a4d86: 75 0d                       	jne	0x1454a4d95 <.text+0x54a3d95>
1454a4d88: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a4d8f: e8 1c 33 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a4d94: 90                          	nop
1454a4d95: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a4d9c: 48 89 f1                    	movq	%rsi, %rcx
1454a4d9f: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a4da3: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a4daa: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a4db1: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a4db6: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a4dba: 48 ff c6                    	incq	%rsi
1454a4dbd: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a4dc4: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
1454a4dcb: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
1454a4dd2: 48 c1 e3 03                 	shlq	$0x3, %rbx
1454a4dd6: 45 31 f6                    	xorl	%r14d, %r14d
1454a4dd9: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a4de0: eb 31                       	jmp	0x1454a4e13 <.text+0x54a3e13>
1454a4de2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a4df0: 41 0f 28 d6                 	movaps	%xmm14, %xmm2
1454a4df4: 44 8b 4e 64                 	movl	0x64(%rsi), %r9d
1454a4df8: 0f b6 46 74                 	movzbl	0x74(%rsi), %eax
1454a4dfc: 0f 97 44 24 28              	seta	0x28(%rsp)
1454a4e01: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454a4e05: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454a4e0a: 4c 89 e9                    	movq	%r13, %rcx
1454a4e0d: e8 9e e0 01 00              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a4e12: 90                          	nop
1454a4e13: 4c 39 f3                    	cmpq	%r14, %rbx
1454a4e16: 0f 84 90 04 00 00           	je	0x1454a52ac <.text+0x54a42ac>
1454a4e1c: 4d 8b 85 80 08 00 00        	movq	0x880(%r13), %r8
1454a4e23: 49 8b 85 98 08 00 00        	movq	0x898(%r13), %rax
1454a4e2a: 4a 8d 0c 00                 	leaq	(%rax,%r8), %rcx
1454a4e2e: 48 c1 c1 17                 	rolq	$0x17, %rcx
1454a4e32: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a4e39: 4a 8b 14 32                 	movq	(%rdx,%r14), %rdx
1454a4e3d: 4c 01 c1                    	addq	%r8, %rcx
1454a4e40: 4d 8b 8d 88 08 00 00        	movq	0x888(%r13), %r9
1454a4e47: 4d 89 ca                    	movq	%r9, %r10
1454a4e4a: 49 c1 e2 11                 	shlq	$0x11, %r10
1454a4e4e: 4d 8b 9d 90 08 00 00        	movq	0x890(%r13), %r11
1454a4e55: 4d 31 c3                    	xorq	%r8, %r11
1454a4e58: 4c 31 c8                    	xorq	%r9, %rax
1454a4e5b: 4d 31 d9                    	xorq	%r11, %r9
1454a4e5e: 4d 89 8d 88 08 00 00        	movq	%r9, 0x888(%r13)
1454a4e65: 49 31 c0                    	xorq	%rax, %r8
1454a4e68: 4d 89 85 80 08 00 00        	movq	%r8, 0x880(%r13)
1454a4e6f: 4d 31 d3                    	xorq	%r10, %r11
1454a4e72: 4d 89 9d 90 08 00 00        	movq	%r11, 0x890(%r13)
1454a4e79: 48 c1 c0 2d                 	rolq	$0x2d, %rax
1454a4e7d: 48 c1 e9 28                 	shrq	$0x28, %rcx
1454a4e81: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a4e84: f3 0f 2a c1                 	cvtsi2ss	%ecx, %xmm0
1454a4e88: 49 89 85 98 08 00 00        	movq	%rax, 0x898(%r13)
1454a4e8f: f3 41 0f 59 c2              	mulss	%xmm10, %xmm0
1454a4e94: f3 41 0f 10 8d 64 04 00 00  	movss	0x464(%r13), %xmm1
1454a4e9d: 49 83 c6 08                 	addq	$0x8, %r14
1454a4ea1: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a4ea4: 0f 86 46 ff ff ff           	jbe	0x1454a4df0 <.text+0x54a3df0>
1454a4eaa: f3 41 0f 10 95 68 04 00 00  	movss	0x468(%r13), %xmm2
1454a4eb3: f3 41 0f 59 d6              	mulss	%xmm14, %xmm2
1454a4eb8: e9 37 ff ff ff              	jmp	0x1454a4df4 <.text+0x54a3df4>
1454a4ebd: 8b 4e 54                    	movl	0x54(%rsi), %ecx
1454a4ec0: 01 fb                       	addl	%edi, %ebx
1454a4ec2: 01 c3                       	addl	%eax, %ebx
1454a4ec4: 8d 04 0b                    	leal	(%rbx,%rcx), %eax
1454a4ec7: 83 f8 01                    	cmpl	$0x1, %eax
1454a4eca: 11 cb                       	adcl	%ecx, %ebx
1454a4ecc: 85 c9                       	testl	%ecx, %ecx
1454a4ece: b8 01 00 00 00              	movl	$0x1, %eax
1454a4ed3: 0f 44 d8                    	cmovel	%eax, %ebx
1454a4ed6: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454a4edb: 8b 45 70                    	movl	0x70(%rbp), %eax
1454a4ede: 89 85 38 02 00 00           	movl	%eax, 0x238(%rbp)
1454a4ee4: 48 8b 45 68                 	movq	0x68(%rbp), %rax
1454a4ee8: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
1454a4eef: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a4ef6: 4c 89 ea                    	movq	%r13, %rdx
1454a4ef9: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
1454a4f00: e8 9b 93 04 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454a4f05: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a4f0c: 4c 8b a5 a8 00 00 00        	movq	0xa8(%rbp), %r12
1454a4f13: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
1454a4f1a: 4d 8d 0c c4                 	leaq	(%r12,%rax,8), %r9
1454a4f1e: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a4f22: 48 c1 e3 03                 	shlq	$0x3, %rbx
1454a4f26: 31 c9                       	xorl	%ecx, %ecx
1454a4f28: 48 89 95 28 03 00 00        	movq	%rdx, 0x328(%rbp)
1454a4f2f: 90                          	nop
1454a4f30: 48 39 c8                    	cmpq	%rcx, %rax
1454a4f33: 74 0f                       	je	0x1454a4f44 <.text+0x54a3f44>
1454a4f35: 48 83 c1 08                 	addq	$0x8, %rcx
1454a4f39: 48 39 cb                    	cmpq	%rcx, %rbx
1454a4f3c: 75 f2                       	jne	0x1454a4f30 <.text+0x54a3f30>
1454a4f3e: 4c 01 e1                    	addq	%r12, %rcx
1454a4f41: 49 89 c9                    	movq	%rcx, %r9
1454a4f44: f3 44 0f 10 4d 68           	movss	0x68(%rbp), %xmm9
1454a4f4a: f3 44 0f 10 55 6c           	movss	0x6c(%rbp), %xmm10
1454a4f50: 4c 89 a5 28 02 00 00        	movq	%r12, 0x228(%rbp)
1454a4f57: 4c 89 8d a0 02 00 00        	movq	%r9, 0x2a0(%rbp)
1454a4f5e: e9 bb 00 00 00              	jmp	0x1454a501e <.text+0x54a401e>
1454a4f63: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a4f70: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a4f74: f3 41 0f 5c c4              	subss	%xmm12, %xmm0
1454a4f79: f3 41 0f 16 cc              	movshdup	%xmm12, %xmm1           # xmm1 = xmm12[1,1,3,3]
1454a4f7e: 41 0f 28 d2                 	movaps	%xmm10, %xmm2
1454a4f82: f3 0f 5c d1                 	subss	%xmm1, %xmm2
1454a4f86: f3 0f 59 c0                 	mulss	%xmm0, %xmm0
1454a4f8a: f3 0f 59 d2                 	mulss	%xmm2, %xmm2
1454a4f8e: f3 0f 58 d0                 	addss	%xmm0, %xmm2
1454a4f92: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a4f95: f3 0f 51 c2                 	sqrtss	%xmm2, %xmm0
1454a4f99: f3 0f 5e c7                 	divss	%xmm7, %xmm0
1454a4f9d: f3 41 0f 58 c0              	addss	%xmm8, %xmm0
1454a4fa2: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a4fa9: 48 8b 82 f8 04 00 00        	movq	0x4f8(%rdx), %rax
1454a4fb0: 48 8d 0c bf                 	leaq	(%rdi,%rdi,4), %rcx
1454a4fb4: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454a4fb8: 48 c7 04 08 00 00 00 00     	movq	$0x0, (%rax,%rcx)
1454a4fc0: c7 44 08 10 00 00 00 00     	movl	$0x0, 0x10(%rax,%rcx)
1454a4fc8: 4c 89 7c 08 20              	movq	%r15, 0x20(%rax,%rcx)
1454a4fcd: 4c 8b 85 38 03 00 00        	movq	0x338(%rbp), %r8
1454a4fd4: 4c 89 44 08 28              	movq	%r8, 0x28(%rax,%rcx)
1454a4fd9: c7 44 08 30 00 00 00 00     	movl	$0x0, 0x30(%rax,%rcx)
1454a4fe1: f3 0f 11 44 08 3c           	movss	%xmm0, 0x3c(%rax,%rcx)
1454a4fe7: 89 5c 08 40                 	movl	%ebx, 0x40(%rax,%rcx)
1454a4feb: f3 44 0f 11 5c 08 44        	movss	%xmm11, 0x44(%rax,%rcx)
1454a4ff2: 44 88 6c 08 48              	movb	%r13b, 0x48(%rax,%rcx)
1454a4ff7: 49 89 d5                    	movq	%rdx, %r13
1454a4ffa: 66 c7 44 08 49 00 00        	movw	$0x0, 0x49(%rax,%rcx)
1454a5001: 44 88 74 08 4b              	movb	%r14b, 0x4b(%rax,%rcx)
1454a5006: 48 ff c7                    	incq	%rdi
1454a5009: 48 89 ba 00 05 00 00        	movq	%rdi, 0x500(%rdx)
1454a5010: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a5017: 4c 8b 8d a0 02 00 00        	movq	0x2a0(%rbp), %r9
1454a501e: 4d 39 cc                    	cmpq	%r9, %r12
1454a5021: 0f 84 3e 02 00 00           	je	0x1454a5265 <.text+0x54a4265>
1454a5027: 4d 8b 3c 24                 	movq	(%r12), %r15
1454a502b: 49 83 c4 08                 	addq	$0x8, %r12
1454a502f: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a5038: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a503f: 49 69 95 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a504a: 31 c9                       	xorl	%ecx, %ecx
1454a504c: 49 89 c0                    	movq	%rax, %r8
1454a504f: 90                          	nop
1454a5050: 48 39 ca                    	cmpq	%rcx, %rdx
1454a5053: 74 c9                       	je	0x1454a501e <.text+0x54a401e>
1454a5055: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a505c: 4d 39 b8 88 00 00 00        	cmpq	%r15, 0x88(%r8)
1454a5063: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a506a: 75 e4                       	jne	0x1454a5050 <.text+0x54a4050>
1454a506c: f3 0f 10 4c 08 c8           	movss	-0x38(%rax,%rcx), %xmm1
1454a5072: 44 0f 2e f9                 	ucomiss	%xmm1, %xmm15
1454a5076: 73 48                       	jae	0x1454a50c0 <.text+0x54a40c0>
1454a5078: f3 0f 5c 44 08 c4           	subss	-0x3c(%rax,%rcx), %xmm0
1454a507e: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1454a5082: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a5085: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454a5089: f3 0f 10 05 ef 63 44 00     	movss	0x4463ef(%rip), %xmm0   # 0x1458eb480
1454a5091: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454a5095: f2 0f 10 4c 08 ac           	movsd	-0x54(%rax,%rcx), %xmm1
1454a509b: f2 0f 10 54 08 b8           	movsd	-0x48(%rax,%rcx), %xmm2
1454a50a1: 0f 5c d1                    	subps	%xmm1, %xmm2
1454a50a4: f3 44 0f 12 e0              	movsldup	%xmm0, %xmm12           # xmm12 = xmm0[0,0,2,2]
1454a50a9: 44 0f 59 e2                 	mulps	%xmm2, %xmm12
1454a50ad: 44 0f 58 e1                 	addps	%xmm1, %xmm12
1454a50b1: eb 14                       	jmp	0x1454a50c7 <.text+0x54a40c7>
1454a50b3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a50c0: f2 44 0f 10 64 08 b8        	movsd	-0x48(%rax,%rcx), %xmm12
1454a50c7: 44 8b 46 64                 	movl	0x64(%rsi), %r8d
1454a50cb: 4c 89 bd b0 02 00 00        	movq	%r15, 0x2b0(%rbp)
1454a50d2: 4c 89 bd 38 02 00 00        	movq	%r15, 0x238(%rbp)
1454a50d9: c7 85 30 02 00 00 00 00 00 00       	movl	$0x0, 0x230(%rbp)
1454a50e3: c7 85 d8 02 00 00 00 00 00 00       	movl	$0x0, 0x2d8(%rbp)
1454a50ed: 48 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %rax
1454a50f4: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454a50f9: 48 8d 85 30 02 00 00        	leaq	0x230(%rbp), %rax
1454a5100: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454a5105: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454a510e: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a5115: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a511c: 4c 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %r9
1454a5123: e8 78 60 fa ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454a5128: 90                          	nop
1454a5129: 48 8b bd 68 03 00 00        	movq	0x368(%rbp), %rdi
1454a5130: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454a5137: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454a513e: 75 0d                       	jne	0x1454a514d <.text+0x54a414d>
1454a5140: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a5147: e8 64 2f 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a514c: 90                          	nop
1454a514d: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454a5154: 48 89 f1                    	movq	%rsi, %rcx
1454a5157: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a515b: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a5162: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a5169: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a516e: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a5172: 48 ff c6                    	incq	%rsi
1454a5175: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454a517c: 48 8b 8f 80 08 00 00        	movq	0x880(%rdi), %rcx
1454a5183: 48 8b 87 98 08 00 00        	movq	0x898(%rdi), %rax
1454a518a: 48 8d 14 08                 	leaq	(%rax,%rcx), %rdx
1454a518e: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454a5192: 48 01 ca                    	addq	%rcx, %rdx
1454a5195: 4c 8b 87 88 08 00 00        	movq	0x888(%rdi), %r8
1454a519c: 4d 89 c1                    	movq	%r8, %r9
1454a519f: 49 c1 e1 11                 	shlq	$0x11, %r9
1454a51a3: 4c 8b 97 90 08 00 00        	movq	0x890(%rdi), %r10
1454a51aa: 49 31 ca                    	xorq	%rcx, %r10
1454a51ad: 4c 31 c0                    	xorq	%r8, %rax
1454a51b0: 4d 31 d0                    	xorq	%r10, %r8
1454a51b3: 4c 89 87 88 08 00 00        	movq	%r8, 0x888(%rdi)
1454a51ba: 48 31 c1                    	xorq	%rax, %rcx
1454a51bd: 48 89 8f 80 08 00 00        	movq	%rcx, 0x880(%rdi)
1454a51c4: 4d 31 ca                    	xorq	%r9, %r10
1454a51c7: 48 c1 c0 2d                 	rolq	$0x2d, %rax
1454a51cb: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454a51cf: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a51d2: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454a51d6: 4c 89 97 90 08 00 00        	movq	%r10, 0x890(%rdi)
1454a51dd: 48 89 87 98 08 00 00        	movq	%rax, 0x898(%rdi)
1454a51e4: f3 0f 59 05 d4 61 54 00     	mulss	0x5461d4(%rip), %xmm0   # 0x1459eb3c0
1454a51ec: f3 0f 10 8f 64 04 00 00     	movss	0x464(%rdi), %xmm1
1454a51f4: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a51f7: 48 89 fe                    	movq	%rdi, %rsi
1454a51fa: 41 0f 97 c5                 	seta	%r13b
1454a51fe: 77 10                       	ja	0x1454a5210 <.text+0x54a4210>
1454a5200: 45 0f 28 de                 	movaps	%xmm14, %xmm11
1454a5204: eb 18                       	jmp	0x1454a521e <.text+0x54a421e>
1454a5206: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a5210: f3 44 0f 10 9e 68 04 00 00  	movss	0x468(%rsi), %xmm11
1454a5219: f3 45 0f 59 de              	mulss	%xmm14, %xmm11
1454a521e: 48 8b bd 58 03 00 00        	movq	0x358(%rbp), %rdi
1454a5225: 8b 5f 64                    	movl	0x64(%rdi), %ebx
1454a5228: 89 d9                       	movl	%ebx, %ecx
1454a522a: e8 a1 b6 04 00              	callq	0x1454f08d0 <.text+0x54ef8d0>
1454a522f: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a5232: f3 0f 5f 3d 46 62 44 00     	maxss	0x446246(%rip), %xmm7   # 0x1458eb480
1454a523a: 44 0f b6 77 74              	movzbl	0x74(%rdi), %r14d
1454a523f: 48 8b be 00 05 00 00        	movq	0x500(%rsi), %rdi
1454a5246: 48 3b be f0 04 00 00        	cmpq	0x4f0(%rsi), %rdi
1454a524d: 0f 85 1d fd ff ff           	jne	0x1454a4f70 <.text+0x54a3f70>
1454a5253: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a525a: e8 51 f0 2b 00              	callq	0x1457642b0 <.text+0x57632b0>
1454a525f: 90                          	nop
1454a5260: e9 0b fd ff ff              	jmp	0x1454a4f70 <.text+0x54a3f70>
1454a5265: 48 8b 95 28 03 00 00        	movq	0x328(%rbp), %rdx
1454a526c: 48 85 d2                    	testq	%rdx, %rdx
1454a526f: f3 44 0f 10 25 c8 3a 45 00  	movss	0x453ac8(%rip), %xmm12  # 0x1458f8d40
1454a5278: f3 44 0f 10 35 93 71 75 00  	movss	0x757193(%rip), %xmm14  # 0x145bfc414
1454a5281: 4c 8b bd 48 03 00 00        	movq	0x348(%rbp), %r15
1454a5288: 0f 84 1d f4 ff ff           	je	0x1454a46ab <.text+0x54a36ab>
1454a528e: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a5292: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a5298: 48 8b 8d 28 02 00 00        	movq	0x228(%rbp), %rcx
1454a529f: e8 2c cf b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a52a4: 49 ff c7                    	incq	%r15
1454a52a7: e9 31 ef ff ff              	jmp	0x1454a41dd <.text+0x54a31dd>
1454a52ac: 48 8b 95 a0 02 00 00        	movq	0x2a0(%rbp), %rdx
1454a52b3: 48 85 d2                    	testq	%rdx, %rdx
1454a52b6: 74 16                       	je	0x1454a52ce <.text+0x54a42ce>
1454a52b8: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a52bc: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a52c2: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a52c9: e8 02 cf b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a52ce: f3 44 0f 10 25 69 3a 45 00  	movss	0x453a69(%rip), %xmm12  # 0x1458f8d40
1454a52d7: f3 44 0f 10 35 34 71 75 00  	movss	0x757134(%rip), %xmm14  # 0x145bfc414
1454a52e0: 49 ff c7                    	incq	%r15
1454a52e3: e9 f5 ee ff ff              	jmp	0x1454a41dd <.text+0x54a31dd>
1454a52e8: 4d 89 c4                    	movq	%r8, %r12
1454a52eb: e9 68 f8 ff ff              	jmp	0x1454a4b58 <.text+0x54a3b58>
1454a52f0: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a52f7: e9 bd f8 ff ff              	jmp	0x1454a4bb9 <.text+0x54a3bb9>
1454a52fc: 4c 89 e9                    	movq	%r13, %rcx
1454a52ff: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454a5302: e8 09 42 02 00              	callq	0x1454c9510 <.text+0x54c8510>
1454a5307: f2 41 0f 10 bd e8 03 00 00  	movsd	0x3e8(%r13), %xmm7
1454a5310: 41 8b 85 f0 03 00 00        	movl	0x3f0(%r13), %eax
1454a5317: 89 85 58 03 00 00           	movl	%eax, 0x358(%rbp)
1454a531d: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a5326: f3 45 0f 10 8d 70 04 00 00  	movss	0x470(%r13), %xmm9
1454a532f: 48 c7 85 10 02 00 00 00 00 00 00    	movq	$0x0, 0x210(%rbp)
1454a533a: 48 c7 85 18 02 00 00 08 00 00 00    	movq	$0x8, 0x218(%rbp)
1454a5345: 48 c7 85 20 02 00 00 00 00 00 00    	movq	$0x0, 0x220(%rbp)
1454a5350: 49 8b 85 28 05 00 00        	movq	0x528(%r13), %rax
1454a5357: 49 8b 8d 30 05 00 00        	movq	0x530(%r13), %rcx
1454a535e: 48 8d 0c c9                 	leaq	(%rcx,%rcx,8), %rcx
1454a5362: 48 8d 0c c8                 	leaq	(%rax,%rcx,8), %rcx
1454a5366: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a536d: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a5374: 4c 89 ad b0 00 00 00        	movq	%r13, 0xb0(%rbp)
1454a537b: c6 85 af 02 00 00 01        	movb	$0x1, 0x2af(%rbp)
1454a5382: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454a5389: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a5390: e8 7b be 08 00              	callq	0x145531210 <.text+0x5530210>
1454a5395: 90                          	nop
1454a5396: 49 8d 85 e8 03 00 00        	leaq	0x3e8(%r13), %rax
1454a539d: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
1454a53a4: 4d 8b a5 28 05 00 00        	movq	0x528(%r13), %r12
1454a53ab: 49 8b 85 30 05 00 00        	movq	0x530(%r13), %rax
1454a53b2: 48 8d 04 c0                 	leaq	(%rax,%rax,8), %rax
1454a53b6: 49 8d 3c c4                 	leaq	(%r12,%rax,8), %rdi
1454a53ba: 4c 8b 8d b8 02 00 00        	movq	0x2b8(%rbp), %r9
1454a53c1: 48 8b 9d c0 02 00 00        	movq	0x2c0(%rbp), %rbx
1454a53c8: 48 b8 f8 ff ff ff ff ff ff 0f       	movabsq	$0xffffffffffffff8, %rax # imm = 0xFFFFFFFFFFFFFF8
1454a53d2: 49 89 de                    	movq	%rbx, %r14
1454a53d5: 49 21 c6                    	andq	%rax, %r14
1454a53d8: c1 e3 03                    	shll	$0x3, %ebx
1454a53db: 83 e3 38                    	andl	$0x38, %ebx
1454a53de: f3 44 0f 10 15 c5 74 45 00  	movss	0x4574c5(%rip), %xmm10  # 0x1458fc8ac
1454a53e7: f3 44 0f 10 1d f0 23 52 00  	movss	0x5223f0(%rip), %xmm11  # 0x1459c77e0
1454a53f0: f3 44 0f 10 25 9b 8e 49 00  	movss	0x498e9b(%rip), %xmm12  # 0x14593e294
1454a53f9: f3 44 0f 10 35 1e 61 44 00  	movss	0x44611e(%rip), %xmm14  # 0x1458eb520
1454a5402: 4c 8d ad 10 02 00 00        	leaq	0x210(%rbp), %r13
1454a5409: 4c 89 8d 38 03 00 00        	movq	%r9, 0x338(%rbp)
1454a5410: eb 3e                       	jmp	0x1454a5450 <.text+0x54a4450>
1454a5412: 48 8b 85 18 02 00 00        	movq	0x218(%rbp), %rax
1454a5419: 48 8d 0c 76                 	leaq	(%rsi,%rsi,2), %rcx
1454a541d: 4c 89 3c c8                 	movq	%r15, (%rax,%rcx,8)
1454a5421: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a5428: 48 89 54 c8 08              	movq	%rdx, 0x8(%rax,%rcx,8)
1454a542d: 8b 95 a8 00 00 00           	movl	0xa8(%rbp), %edx
1454a5433: 89 54 c8 10                 	movl	%edx, 0x10(%rax,%rcx,8)
1454a5437: f3 44 0f 11 7c c8 14        	movss	%xmm15, 0x14(%rax,%rcx,8)
1454a543e: 48 ff c6                    	incq	%rsi
1454a5441: 48 89 b5 20 02 00 00        	movq	%rsi, 0x220(%rbp)
1454a5448: 4c 8b 8d 38 03 00 00        	movq	0x338(%rbp), %r9
1454a544f: 90                          	nop
1454a5450: 49 39 fc                    	cmpq	%rdi, %r12
1454a5453: 41 0f 95 c2                 	setne	%r10b
1454a5457: 0f 84 14 02 00 00           	je	0x1454a5671 <.text+0x54a4671>
1454a545d: 4c 89 e0                    	movq	%r12, %rax
1454a5460: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a5464: f3 41 0f 5c 44 24 40        	subss	0x40(%r12), %xmm0
1454a546b: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
1454a546f: 76 5f                       	jbe	0x1454a54d0 <.text+0x54a44d0>
1454a5471: 48 8b 50 28                 	movq	0x28(%rax), %rdx
1454a5475: 45 31 c0                    	xorl	%r8d, %r8d
1454a5478: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a5480: 4d 39 c6                    	cmpq	%r8, %r14
1454a5483: 0f 84 07 01 00 00           	je	0x1454a5590 <.text+0x54a4590>
1454a5489: 31 c9                       	xorl	%ecx, %ecx
1454a548b: 4b 39 14 c1                 	cmpq	%rdx, (%r9,%r8,8)
1454a548f: 74 41                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a5491: 4b 39 54 c1 08              	cmpq	%rdx, 0x8(%r9,%r8,8)
1454a5496: 74 3a                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a5498: 4b 39 54 c1 10              	cmpq	%rdx, 0x10(%r9,%r8,8)
1454a549d: 74 33                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a549f: 4b 39 54 c1 18              	cmpq	%rdx, 0x18(%r9,%r8,8)
1454a54a4: 74 2c                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a54a6: 4b 39 54 c1 20              	cmpq	%rdx, 0x20(%r9,%r8,8)
1454a54ab: 74 25                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a54ad: 4b 39 54 c1 28              	cmpq	%rdx, 0x28(%r9,%r8,8)
1454a54b2: 74 1e                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a54b4: 4b 39 54 c1 30              	cmpq	%rdx, 0x30(%r9,%r8,8)
1454a54b9: 74 17                       	je	0x1454a54d2 <.text+0x54a44d2>
1454a54bb: 4b 39 54 c1 38              	cmpq	%rdx, 0x38(%r9,%r8,8)
1454a54c0: 4d 8d 40 08                 	leaq	0x8(%r8), %r8
1454a54c4: 75 ba                       	jne	0x1454a5480 <.text+0x54a4480>
1454a54c6: eb 0a                       	jmp	0x1454a54d2 <.text+0x54a44d2>
1454a54c8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a54d0: 31 c9                       	xorl	%ecx, %ecx
1454a54d2: 4c 8d 60 48                 	leaq	0x48(%rax), %r12
1454a54d6: 83 78 20 00                 	cmpl	$0x0, 0x20(%rax)
1454a54da: 0f 85 70 ff ff ff           	jne	0x1454a5450 <.text+0x54a4450>
1454a54e0: 80 78 18 00                 	cmpb	$0x0, 0x18(%rax)
1454a54e4: 0f 85 66 ff ff ff           	jne	0x1454a5450 <.text+0x54a4450>
1454a54ea: f2 0f 10 40 34              	movsd	0x34(%rax), %xmm0
1454a54ef: 0f 5c c7                    	subps	%xmm7, %xmm0
1454a54f2: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a54f5: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a54f9: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a54fd: 45 0f 57 ff                 	xorps	%xmm15, %xmm15
1454a5501: f3 44 0f 51 f9              	sqrtss	%xmm1, %xmm15
1454a5506: 45 0f 2e cf                 	ucomiss	%xmm15, %xmm9
1454a550a: 0f 92 c2                    	setb	%dl
1454a550d: 41 89 c8                    	movl	%ecx, %r8d
1454a5510: 41 f6 d0                    	notb	%r8b
1454a5513: 41 84 d0                    	testb	%dl, %r8b
1454a5516: 0f 85 34 ff ff ff           	jne	0x1454a5450 <.text+0x54a4450>
1454a551c: 44 88 95 10 03 00 00        	movb	%r10b, 0x310(%rbp)
1454a5523: 41 0f 28 c3                 	movaps	%xmm11, %xmm0
1454a5527: f6 c1 01                    	testb	$0x1, %cl
1454a552a: 75 04                       	jne	0x1454a5530 <.text+0x54a4530>
1454a552c: 41 0f 28 c4                 	movaps	%xmm12, %xmm0
1454a5530: 48 8d 48 34                 	leaq	0x34(%rax), %rcx
1454a5534: f3 44 0f 5e f8              	divss	%xmm0, %xmm15
1454a5539: f3 45 0f 5f fe              	maxss	%xmm14, %xmm15
1454a553e: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a5542: f3 41 0f 58 c7              	addss	%xmm15, %xmm0
1454a5547: c7 40 18 01 00 00 00        	movl	$0x1, 0x18(%rax)
1454a554e: f3 0f 11 40 1c              	movss	%xmm0, 0x1c(%rax)
1454a5553: 4c 8b 78 28                 	movq	0x28(%rax), %r15
1454a5557: 8b 41 08                    	movl	0x8(%rcx), %eax
1454a555a: 89 85 a8 00 00 00           	movl	%eax, 0xa8(%rbp)
1454a5560: 48 8b 01                    	movq	(%rcx), %rax
1454a5563: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a556a: 48 8b b5 20 02 00 00        	movq	0x220(%rbp), %rsi
1454a5571: 48 3b b5 10 02 00 00        	cmpq	0x210(%rbp), %rsi
1454a5578: 0f 85 94 fe ff ff           	jne	0x1454a5412 <.text+0x54a4412>
1454a557e: 4c 89 e9                    	movq	%r13, %rcx
1454a5581: e8 da 29 2b 00              	callq	0x145757f60 <.text+0x5756f60>
1454a5586: 90                          	nop
1454a5587: e9 86 fe ff ff              	jmp	0x1454a5412 <.text+0x54a4412>
1454a558c: 0f 1f 40 00                 	nopl	(%rax)
1454a5590: 48 85 db                    	testq	%rbx, %rbx
1454a5593: 0f 84 d1 00 00 00           	je	0x1454a566a <.text+0x54a466a>
1454a5599: 4f 8b 04 f1                 	movq	(%r9,%r14,8), %r8
1454a559d: 49 39 d0                    	cmpq	%rdx, %r8
1454a55a0: 0f 95 c1                    	setne	%cl
1454a55a3: f6 d9                       	negb	%cl
1454a55a5: 49 39 d0                    	cmpq	%rdx, %r8
1454a55a8: 0f 84 24 ff ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55ae: 83 fb 08                    	cmpl	$0x8, %ebx
1454a55b1: 0f 84 1b ff ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55b7: 4f 8b 44 f1 08              	movq	0x8(%r9,%r14,8), %r8
1454a55bc: 49 39 d0                    	cmpq	%rdx, %r8
1454a55bf: 0f 95 c1                    	setne	%cl
1454a55c2: f6 d9                       	negb	%cl
1454a55c4: 49 39 d0                    	cmpq	%rdx, %r8
1454a55c7: 0f 84 05 ff ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55cd: 83 fb 10                    	cmpl	$0x10, %ebx
1454a55d0: 0f 84 fc fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55d6: 4f 8b 44 f1 10              	movq	0x10(%r9,%r14,8), %r8
1454a55db: 49 39 d0                    	cmpq	%rdx, %r8
1454a55de: 0f 95 c1                    	setne	%cl
1454a55e1: f6 d9                       	negb	%cl
1454a55e3: 49 39 d0                    	cmpq	%rdx, %r8
1454a55e6: 0f 84 e6 fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55ec: 83 fb 18                    	cmpl	$0x18, %ebx
1454a55ef: 0f 84 dd fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a55f5: 4f 8b 44 f1 18              	movq	0x18(%r9,%r14,8), %r8
1454a55fa: 49 39 d0                    	cmpq	%rdx, %r8
1454a55fd: 0f 95 c1                    	setne	%cl
1454a5600: f6 d9                       	negb	%cl
1454a5602: 49 39 d0                    	cmpq	%rdx, %r8
1454a5605: 0f 84 c7 fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a560b: 83 fb 20                    	cmpl	$0x20, %ebx
1454a560e: 0f 84 be fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a5614: 4f 8b 44 f1 20              	movq	0x20(%r9,%r14,8), %r8
1454a5619: 49 39 d0                    	cmpq	%rdx, %r8
1454a561c: 0f 95 c1                    	setne	%cl
1454a561f: f6 d9                       	negb	%cl
1454a5621: 49 39 d0                    	cmpq	%rdx, %r8
1454a5624: 0f 84 a8 fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a562a: 83 fb 28                    	cmpl	$0x28, %ebx
1454a562d: 0f 84 9f fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a5633: 4f 8b 44 f1 28              	movq	0x28(%r9,%r14,8), %r8
1454a5638: 49 39 d0                    	cmpq	%rdx, %r8
1454a563b: 0f 95 c1                    	setne	%cl
1454a563e: f6 d9                       	negb	%cl
1454a5640: 49 39 d0                    	cmpq	%rdx, %r8
1454a5643: 0f 84 89 fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a5649: 83 fb 30                    	cmpl	$0x30, %ebx
1454a564c: 0f 84 80 fe ff ff           	je	0x1454a54d2 <.text+0x54a44d2>
1454a5652: 48 83 fb 38                 	cmpq	$0x38, %rbx
1454a5656: 41 0f 94 c0                 	sete	%r8b
1454a565a: 4b 39 54 f1 30              	cmpq	%rdx, 0x30(%r9,%r14,8)
1454a565f: 0f 95 c1                    	setne	%cl
1454a5662: 44 20 c1                    	andb	%r8b, %cl
1454a5665: e9 68 fe ff ff              	jmp	0x1454a54d2 <.text+0x54a44d2>
1454a566a: b1 01                       	movb	$0x1, %cl
1454a566c: e9 61 fe ff ff              	jmp	0x1454a54d2 <.text+0x54a44d2>
1454a5671: 44 88 95 10 03 00 00        	movb	%r10b, 0x310(%rbp)
1454a5678: 48 8b 85 10 02 00 00        	movq	0x210(%rbp), %rax
1454a567f: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a5686: 4c 8b bd 18 02 00 00        	movq	0x218(%rbp), %r15
1454a568d: 48 8b 85 20 02 00 00        	movq	0x220(%rbp), %rax
1454a5694: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
1454a5698: 4d 8d 24 c7                 	leaq	(%r15,%rax,8), %r12
1454a569c: f3 44 0f 10 15 6b b8 48 00  	movss	0x48b86b(%rip), %xmm10  # 0x145930f10
1454a56a5: 45 31 ed                    	xorl	%r13d, %r13d
1454a56a8: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a56ac: 48 8d bd a0 00 00 00        	leaq	0xa0(%rbp), %rdi
1454a56b3: 48 8d 9d d8 02 00 00        	leaq	0x2d8(%rbp), %rbx
1454a56ba: 4c 8d b5 30 02 00 00        	leaq	0x230(%rbp), %r14
1454a56c1: 4c 89 bd 90 02 00 00        	movq	%r15, 0x290(%rbp)
1454a56c8: eb 40                       	jmp	0x1454a570a <.text+0x54a470a>
1454a56ca: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a56d0: 49 83 c7 18                 	addq	$0x18, %r15
1454a56d4: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a56db: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a56e2: 48 89 f1                    	movq	%rsi, %rcx
1454a56e5: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a56e9: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a56f0: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a56f7: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a56fc: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a5700: 48 ff c6                    	incq	%rsi
1454a5703: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454a570a: 4d 39 e7                    	cmpq	%r12, %r15
1454a570d: 0f 84 ae 00 00 00           	je	0x1454a57c1 <.text+0x54a47c1>
1454a5713: 49 8b 17                    	movq	(%r15), %rdx
1454a5716: 41 8b 47 10                 	movl	0x10(%r15), %eax
1454a571a: 89 85 e0 02 00 00           	movl	%eax, 0x2e0(%rbp)
1454a5720: 49 8b 47 08                 	movq	0x8(%r15), %rax
1454a5724: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
1454a572b: f3 41 0f 10 47 14           	movss	0x14(%r15), %xmm0
1454a5731: 4c 8b 85 68 03 00 00        	movq	0x368(%rbp), %r8
1454a5738: 41 8b 80 08 09 00 00        	movl	0x908(%r8), %eax
1454a573f: ff c0                       	incl	%eax
1454a5741: f3 41 0f 59 c2              	mulss	%xmm10, %xmm0
1454a5746: f3 48 0f 2c c8              	cvttss2si	%xmm0, %rcx
1454a574b: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a574f: 41 0f 42 cd                 	cmovbl	%r13d, %ecx
1454a5753: 41 89 80 08 09 00 00        	movl	%eax, 0x908(%r8)
1454a575a: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a575e: 41 b8 ff ff ff ff           	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a5764: 77 03                       	ja	0x1454a5769 <.text+0x54a4769>
1454a5766: 41 89 c8                    	movl	%ecx, %r8d
1454a5769: 0f 13 bd 30 02 00 00        	movlps	%xmm7, 0x230(%rbp)
1454a5770: 8b 8d 58 03 00 00           	movl	0x358(%rbp), %ecx
1454a5776: 89 8d 38 02 00 00           	movl	%ecx, 0x238(%rbp)
1454a577c: 44 89 44 24 28              	movl	%r8d, 0x28(%rsp)
1454a5781: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1454a5785: 48 89 f9                    	movq	%rdi, %rcx
1454a5788: 49 89 d8                    	movq	%rbx, %r8
1454a578b: 4d 89 f1                    	movq	%r14, %r9
1454a578e: e8 ad b5 f9 ff              	callq	0x145440d40 <.text+0x543fd40>
1454a5793: 90                          	nop
1454a5794: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a579b: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454a57a2: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454a57a9: 0f 85 21 ff ff ff           	jne	0x1454a56d0 <.text+0x54a46d0>
1454a57af: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a57b6: e8 f5 28 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a57bb: 90                          	nop
1454a57bc: e9 0f ff ff ff              	jmp	0x1454a56d0 <.text+0x54a46d0>
1454a57c1: 48 8b 85 48 03 00 00        	movq	0x348(%rbp), %rax
1454a57c8: 48 85 c0                    	testq	%rax, %rax
1454a57cb: 74 1a                       	je	0x1454a57e7 <.text+0x54a47e7>
1454a57cd: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a57d1: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1454a57d5: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a57db: 48 8b 8d 90 02 00 00        	movq	0x290(%rbp), %rcx
1454a57e2: e8 e9 c9 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a57e7: 48 c7 85 d8 02 00 00 00 00 00 00    	movq	$0x0, 0x2d8(%rbp)
1454a57f2: 48 c7 85 e0 02 00 00 08 00 00 00    	movq	$0x8, 0x2e0(%rbp)
1454a57fd: 48 c7 85 e8 02 00 00 00 00 00 00    	movq	$0x0, 0x2e8(%rbp)
1454a5808: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a580f: 48 8b 88 28 05 00 00        	movq	0x528(%rax), %rcx
1454a5816: 48 8b 80 30 05 00 00        	movq	0x530(%rax), %rax
1454a581d: 48 8d 04 c0                 	leaq	(%rax,%rax,8), %rax
1454a5821: 48 8d 14 c1                 	leaq	(%rcx,%rax,8), %rdx
1454a5825: 31 db                       	xorl	%ebx, %ebx
1454a5827: 48 8d bd d8 02 00 00        	leaq	0x2d8(%rbp), %rdi
1454a582e: f3 44 0f 10 15 f5 0d 45 00  	movss	0x450df5(%rip), %xmm10  # 0x1458f662c
1454a5837: 45 31 f6                    	xorl	%r14d, %r14d
1454a583a: 48 89 95 28 03 00 00        	movq	%rdx, 0x328(%rbp)
1454a5841: 48 39 d1                    	cmpq	%rdx, %rcx
1454a5844: 75 3a                       	jne	0x1454a5880 <.text+0x54a4880>
1454a5846: e9 ba 00 00 00              	jmp	0x1454a5905 <.text+0x54a4905>
1454a584b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a5850: f2 0f 10 41 34              	movsd	0x34(%rcx), %xmm0
1454a5855: 0f 5c c7                    	subps	%xmm7, %xmm0
1454a5858: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a585b: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a585f: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a5863: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a5866: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a586a: 44 0f 2e d0                 	ucomiss	%xmm0, %xmm10
1454a586e: 73 49                       	jae	0x1454a58b9 <.text+0x54a48b9>
1454a5870: 48 83 c1 48                 	addq	$0x48, %rcx
1454a5874: 49 ff c6                    	incq	%r14
1454a5877: 48 39 d1                    	cmpq	%rdx, %rcx
1454a587a: 0f 84 85 00 00 00           	je	0x1454a5905 <.text+0x54a4905>
1454a5880: 8b 41 20                    	movl	0x20(%rcx), %eax
1454a5883: 85 c0                       	testl	%eax, %eax
1454a5885: 74 25                       	je	0x1454a58ac <.text+0x54a48ac>
1454a5887: 83 f8 01                    	cmpl	$0x1, %eax
1454a588a: 75 c4                       	jne	0x1454a5850 <.text+0x54a4850>
1454a588c: f2 0f 10 41 34              	movsd	0x34(%rcx), %xmm0
1454a5891: 0f 5c c7                    	subps	%xmm7, %xmm0
1454a5894: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a5897: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a589b: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a589f: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a58a2: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a58a6: 44 0f 2e c8                 	ucomiss	%xmm0, %xmm9
1454a58aa: 73 0d                       	jae	0x1454a58b9 <.text+0x54a48b9>
1454a58ac: 83 79 18 01                 	cmpl	$0x1, 0x18(%rcx)
1454a58b0: 75 be                       	jne	0x1454a5870 <.text+0x54a4870>
1454a58b2: 44 0f 2e 41 1c              	ucomiss	0x1c(%rcx), %xmm8
1454a58b7: 72 b7                       	jb	0x1454a5870 <.text+0x54a4870>
1454a58b9: 48 89 8d 90 02 00 00        	movq	%rcx, 0x290(%rbp)
1454a58c0: 48 3b 9d d8 02 00 00        	cmpq	0x2d8(%rbp), %rbx
1454a58c7: 75 09                       	jne	0x1454a58d2 <.text+0x54a48d2>
1454a58c9: 48 89 f9                    	movq	%rdi, %rcx
1454a58cc: e8 1f 26 2b 00              	callq	0x145757ef0 <.text+0x5756ef0>
1454a58d1: 90                          	nop
1454a58d2: 48 8b 8d 90 02 00 00        	movq	0x290(%rbp), %rcx
1454a58d9: 48 83 c1 48                 	addq	$0x48, %rcx
1454a58dd: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454a58e4: 4c 89 34 d8                 	movq	%r14, (%rax,%rbx,8)
1454a58e8: 49 ff c6                    	incq	%r14
1454a58eb: 48 ff c3                    	incq	%rbx
1454a58ee: 48 89 9d e8 02 00 00        	movq	%rbx, 0x2e8(%rbp)
1454a58f5: 48 8b 95 28 03 00 00        	movq	0x328(%rbp), %rdx
1454a58fc: 48 39 d1                    	cmpq	%rdx, %rcx
1454a58ff: 0f 85 7b ff ff ff           	jne	0x1454a5880 <.text+0x54a4880>
1454a5905: 48 89 8d 90 02 00 00        	movq	%rcx, 0x290(%rbp)
1454a590c: 48 8b 85 d8 02 00 00        	movq	0x2d8(%rbp), %rax
1454a5913: 48 89 85 80 00 00 00        	movq	%rax, 0x80(%rbp)
1454a591a: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454a5921: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a5928: 4c 8d 3c d8                 	leaq	(%rax,%rbx,8), %r15
1454a592c: 4c 8d 2d 21 73 50 01        	leaq	0x1507321(%rip), %r13   # 0x1469acc54
1454a5933: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454a5936: bf 98 04 00 00              	movl	$0x498, %edi            # imm = 0x498
1454a593b: f3 44 0f 10 05 e4 5b 44 00  	movss	0x445be4(%rip), %xmm8   # 0x1458eb528
1454a5944: eb 5a                       	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5946: 44 89 f0                    	movl	%r14d, %eax
1454a5949: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a594c: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a5951: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a5958: f3 0f 59 86 74 04 00 00     	mulss	0x474(%rsi), %xmm0
1454a5960: e8 ba 14 2b 00              	callq	0x145756e1f <.text+0x5755e1f>
1454a5965: f3 0f 5f 05 13 5b 44 00     	maxss	0x445b13(%rip), %xmm0   # 0x1458eb480
1454a596d: f3 48 0f 2c d0              	cvttss2si	%xmm0, %rdx
1454a5972: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a5975: b8 00 00 00 00              	movl	$0x0, %eax
1454a597a: 0f 42 d0                    	cmovbl	%eax, %edx
1454a597d: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a5981: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a5986: 0f 47 d0                    	cmoval	%eax, %edx
1454a5989: 48 89 f1                    	movq	%rsi, %rcx
1454a598c: e8 8f ef 00 00              	callq	0x1454b4920 <.text+0x54b3920>
1454a5991: 90                          	nop
1454a5992: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a59a0: 4c 39 bd 58 03 00 00        	cmpq	%r15, 0x358(%rbp)
1454a59a7: 0f 84 90 04 00 00           	je	0x1454a5e3d <.text+0x54a4e3d>
1454a59ad: 4d 8b 67 f8                 	movq	-0x8(%r15), %r12
1454a59b1: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a59b8: 48 8b 90 30 05 00 00        	movq	0x530(%rax), %rdx
1454a59bf: 49 39 d4                    	cmpq	%rdx, %r12
1454a59c2: 0f 83 23 50 00 00           	jae	0x1454aa9eb <.text+0x54a99eb>
1454a59c8: 49 83 c7 f8                 	addq	$-0x8, %r15
1454a59cc: 48 8b 80 28 05 00 00        	movq	0x528(%rax), %rax
1454a59d3: 4b 8d 0c e4                 	leaq	(%r12,%r12,8), %rcx
1454a59d7: 8b 5c c8 20                 	movl	0x20(%rax,%rcx,8), %ebx
1454a59db: 44 8b 74 c8 24              	movl	0x24(%rax,%rcx,8), %r14d
1454a59e0: 83 fb 02                    	cmpl	$0x2, %ebx
1454a59e3: 75 7b                       	jne	0x1454a5a60 <.text+0x54a4a60>
1454a59e5: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a59ec: 80 b9 55 09 00 00 00        	cmpb	$0x0, 0x955(%rcx)
1454a59f3: 74 5b                       	je	0x1454a5a50 <.text+0x54a4a50>
1454a59f5: 80 b9 56 09 00 00 00        	cmpb	$0x0, 0x956(%rcx)
1454a59fc: c6 81 56 09 00 00 01        	movb	$0x1, 0x956(%rcx)
1454a5a03: 75 9b                       	jne	0x1454a59a0 <.text+0x54a49a0>
1454a5a05: ba 1e 00 00 00              	movl	$0x1e, %edx
1454a5a0a: 48 8d 0d 7f 5d 50 01        	leaq	0x1505d7f(%rip), %rcx   # 0x1469ab790
1454a5a11: e8 ea c9 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a5a16: 90                          	nop
1454a5a17: 49 89 d0                    	movq	%rdx, %r8
1454a5a1a: 48 85 c0                    	testq	%rax, %rax
1454a5a1d: 48 8d 0d 6c 5d 50 01        	leaq	0x1505d6c(%rip), %rcx   # 0x1469ab790
1454a5a24: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1454a5a28: b9 1e 00 00 00              	movl	$0x1e, %ecx
1454a5a2d: 4c 0f 44 c1                 	cmoveq	%rcx, %r8
1454a5a31: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5a38: 48 89 c2                    	movq	%rax, %rdx
1454a5a3b: e8 50 c7 02 00              	callq	0x1454d2190 <.text+0x54d1190>
1454a5a40: 90                          	nop
1454a5a41: e9 5a ff ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5a46: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a5a50: e8 5b da 02 00              	callq	0x1454d34b0 <.text+0x54d24b0>
1454a5a55: 90                          	nop
1454a5a56: 84 c0                       	testb	%al, %al
1454a5a58: 0f 84 42 ff ff ff           	je	0x1454a59a0 <.text+0x54a49a0>
1454a5a5e: 66 90                       	nop
1454a5a60: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5a67: 4c 89 e2                    	movq	%r12, %rdx
1454a5a6a: e8 f1 b5 02 00              	callq	0x1454d1060 <.text+0x54d0060>
1454a5a6f: 90                          	nop
1454a5a70: 89 d8                       	movl	%ebx, %eax
1454a5a72: 49 63 44 85 00              	movslq	(%r13,%rax,4), %rax
1454a5a77: 4c 01 e8                    	addq	%r13, %rax
1454a5a7a: ff e0                       	jmpq	*%rax
1454a5a7c: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5a83: 89 da                       	movl	%ebx, %edx
1454a5a85: e8 06 df 02 00              	callq	0x1454d3990 <.text+0x54d2990>
1454a5a8a: 90                          	nop
1454a5a8b: e9 10 ff ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5a90: e8 6b c7 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a5a95: b9 20 00 00 00              	movl	$0x20, %ecx
1454a5a9a: ba 01 00 00 00              	movl	$0x1, %edx
1454a5a9f: e8 1c c7 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a5aa4: 48 85 c0                    	testq	%rax, %rax
1454a5aa7: 0f 84 46 51 00 00           	je	0x1454aabf3 <.text+0x54a9bf3>
1454a5aad: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a5ab4: c7 00 b4 04 00 00           	movl	$0x4b4, (%rax)          # imm = 0x4B4
1454a5aba: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5ac1: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454a5ac8: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454a5acf: 75 0d                       	jne	0x1454a5ade <.text+0x54a4ade>
1454a5ad1: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a5ad8: e8 d3 25 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a5add: 90                          	nop
1454a5ade: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a5ae5: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a5aec: 48 89 f1                    	movq	%rsi, %rcx
1454a5aef: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a5af3: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454a5afb: 4c 8b 85 48 03 00 00        	movq	0x348(%rbp), %r8
1454a5b02: 4c 89 44 08 08              	movq	%r8, 0x8(%rax,%rcx)
1454a5b07: 48 c7 44 08 10 04 00 00 00  	movq	$0x4, 0x10(%rax,%rcx)
1454a5b10: 66 c7 44 08 18 d2 02        	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454a5b17: 48 ff c6                    	incq	%rsi
1454a5b1a: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454a5b21: 80 ba 5f 09 00 00 01        	cmpb	$0x1, 0x95f(%rdx)
1454a5b28: 0f 85 72 fe ff ff           	jne	0x1454a59a0 <.text+0x54a49a0>
1454a5b2e: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5b35: 83 b8 f0 08 00 00 00        	cmpl	$0x0, 0x8f0(%rax)
1454a5b3c: 0f 84 5e fe ff ff           	je	0x1454a59a0 <.text+0x54a49a0>
1454a5b42: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5b49: 80 b8 58 09 00 00 00        	cmpb	$0x0, 0x958(%rax)
1454a5b50: 0f 85 4a fe ff ff           	jne	0x1454a59a0 <.text+0x54a49a0>
1454a5b56: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5b5d: b2 01                       	movb	$0x1, %dl
1454a5b5f: 41 b0 01                    	movb	$0x1, %r8b
1454a5b62: e8 89 4a 03 00              	callq	0x1454da5f0 <.text+0x54d95f0>
1454a5b67: 90                          	nop
1454a5b68: e9 33 fe ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5b6d: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5b74: ff 81 74 06 00 00           	incl	0x674(%rcx)
1454a5b7a: e8 01 c8 02 00              	callq	0x1454d2380 <.text+0x54d1380>
1454a5b7f: 90                          	nop
1454a5b80: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5b87: 48 8b 88 30 05 00 00        	movq	0x530(%rax), %rcx
1454a5b8e: 48 85 c9                    	testq	%rcx, %rcx
1454a5b91: 0f 84 7d 01 00 00           	je	0x1454a5d14 <.text+0x54a4d14>
1454a5b97: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5b9e: f3 0f 10 80 e8 03 00 00     	movss	0x3e8(%rax), %xmm0
1454a5ba6: f3 0f 10 88 ec 03 00 00     	movss	0x3ec(%rax), %xmm1
1454a5bae: f3 0f 10 90 e4 08 00 00     	movss	0x8e4(%rax), %xmm2
1454a5bb6: 48 8b 80 28 05 00 00        	movq	0x528(%rax), %rax
1454a5bbd: 48 c1 e1 03                 	shlq	$0x3, %rcx
1454a5bc1: 48 8d 0c c9                 	leaq	(%rcx,%rcx,8), %rcx
1454a5bc5: 31 d2                       	xorl	%edx, %edx
1454a5bc7: eb 14                       	jmp	0x1454a5bdd <.text+0x54a4bdd>
1454a5bc9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a5bd0: 48 83 c2 48                 	addq	$0x48, %rdx
1454a5bd4: 48 39 d1                    	cmpq	%rdx, %rcx
1454a5bd7: 0f 84 37 01 00 00           	je	0x1454a5d14 <.text+0x54a4d14>
1454a5bdd: 83 7c 10 20 01              	cmpl	$0x1, 0x20(%rax,%rdx)
1454a5be2: 75 ec                       	jne	0x1454a5bd0 <.text+0x54a4bd0>
1454a5be4: 83 7c 10 18 00              	cmpl	$0x0, 0x18(%rax,%rdx)
1454a5be9: 75 e5                       	jne	0x1454a5bd0 <.text+0x54a4bd0>
1454a5beb: f3 0f 10 5c 10 34           	movss	0x34(%rax,%rdx), %xmm3
1454a5bf1: f3 0f 5c d8                 	subss	%xmm0, %xmm3
1454a5bf5: f3 0f 10 64 10 38           	movss	0x38(%rax,%rdx), %xmm4
1454a5bfb: f3 0f 5c e1                 	subss	%xmm1, %xmm4
1454a5bff: f3 0f 59 db                 	mulss	%xmm3, %xmm3
1454a5c03: f3 0f 59 e4                 	mulss	%xmm4, %xmm4
1454a5c07: f3 0f 58 e3                 	addss	%xmm3, %xmm4
1454a5c0b: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a5c0e: f3 0f 51 dc                 	sqrtss	%xmm4, %xmm3
1454a5c12: f3 0f 5e 1d 66 0a 45 00     	divss	0x450a66(%rip), %xmm3   # 0x1458f6680
1454a5c1a: f3 41 0f 5f d8              	maxss	%xmm8, %xmm3
1454a5c1f: f3 0f 58 da                 	addss	%xmm2, %xmm3
1454a5c23: c7 44 10 18 01 00 00 00     	movl	$0x1, 0x18(%rax,%rdx)
1454a5c2b: f3 0f 11 5c 10 1c           	movss	%xmm3, 0x1c(%rax,%rdx)
1454a5c31: eb 9d                       	jmp	0x1454a5bd0 <.text+0x54a4bd0>
1454a5c33: 44 89 f0                    	movl	%r14d, %eax
1454a5c36: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a5c39: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a5c3e: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a5c45: f3 0f 59 86 88 04 00 00     	mulss	0x488(%rsi), %xmm0
1454a5c4d: e8 cd 11 2b 00              	callq	0x145756e1f <.text+0x5755e1f>
1454a5c52: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454a5c57: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454a5c5a: b9 00 00 00 00              	movl	$0x0, %ecx
1454a5c5f: 0f 42 c1                    	cmovbl	%ecx, %eax
1454a5c62: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a5c66: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454a5c6b: 0f 47 c1                    	cmoval	%ecx, %eax
1454a5c6e: 8b 8e 08 04 00 00           	movl	0x408(%rsi), %ecx
1454a5c74: 01 c1                       	addl	%eax, %ecx
1454a5c76: 89 8e 08 04 00 00           	movl	%ecx, 0x408(%rsi)
1454a5c7c: 01 86 6c 06 00 00           	addl	%eax, 0x66c(%rsi)
1454a5c82: 44 69 c1 10 27 00 00        	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454a5c89: 48 8b 86 b8 08 00 00        	movq	0x8b8(%rsi), %rax
1454a5c90: 48 85 c0                    	testq	%rax, %rax
1454a5c93: 0f 84 57 01 00 00           	je	0x1454a5df0 <.text+0x54a4df0>
1454a5c99: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454a5ca0: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454a5ca5: 45 89 ca                    	movl	%r9d, %r10d
1454a5ca8: 45 01 d2                    	addl	%r10d, %r10d
1454a5cab: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a5cb2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a5cc0: 4d 85 d2                    	testq	%r10, %r10
1454a5cc3: 74 3b                       	je	0x1454a5d00 <.text+0x54a4d00>
1454a5cc5: 44 0f b7 5c 50 3a           	movzwl	0x3a(%rax,%rdx,2), %r11d
1454a5ccb: 44 39 df                    	cmpl	%r11d, %edi
1454a5cce: 41 0f 97 c3                 	seta	%r11b
1454a5cd2: 41 80 db 00                 	sbbb	$0x0, %r11b
1454a5cd6: 48 ff c2                    	incq	%rdx
1454a5cd9: 49 83 c2 fe                 	addq	$-0x2, %r10
1454a5cdd: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454a5ce1: 74 dd                       	je	0x1454a5cc0 <.text+0x54a4cc0>
1454a5ce3: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454a5ce7: 45 85 c9                    	testl	%r9d, %r9d
1454a5cea: 0f 84 f6 00 00 00           	je	0x1454a5de6 <.text+0x54a4de6>
1454a5cf0: 48 83 e9 01                 	subq	$0x1, %rcx
1454a5cf4: 73 17                       	jae	0x1454a5d0d <.text+0x54a4d0d>
1454a5cf6: e9 f7 00 00 00              	jmp	0x1454a5df2 <.text+0x54a4df2>
1454a5cfb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a5d00: 4c 89 ca                    	movq	%r9, %rdx
1454a5d03: 48 83 e9 01                 	subq	$0x1, %rcx
1454a5d07: 0f 82 e5 00 00 00           	jb	0x1454a5df2 <.text+0x54a4df2>
1454a5d0d: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a5d12: eb 8c                       	jmp	0x1454a5ca0 <.text+0x54a4ca0>
1454a5d14: e8 e7 c4 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a5d19: b9 20 00 00 00              	movl	$0x20, %ecx
1454a5d1e: ba 01 00 00 00              	movl	$0x1, %edx
1454a5d23: e8 98 c4 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a5d28: 48 85 c0                    	testq	%rax, %rax
1454a5d2b: 0f 84 ad 4e 00 00           	je	0x1454aabde <.text+0x54a9bde>
1454a5d31: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a5d38: c7 00 78 00 00 00           	movl	$0x78, (%rax)
1454a5d3e: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a5d45: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454a5d4c: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454a5d53: 75 0d                       	jne	0x1454a5d62 <.text+0x54a4d62>
1454a5d55: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a5d5c: e8 4f 23 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a5d61: 90                          	nop
1454a5d62: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a5d69: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454a5d70: 48 89 f1                    	movq	%rsi, %rcx
1454a5d73: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a5d77: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454a5d7f: 4c 8b 85 48 03 00 00        	movq	0x348(%rbp), %r8
1454a5d86: 4c 89 44 08 08              	movq	%r8, 0x8(%rax,%rcx)
1454a5d8b: 48 c7 44 08 10 04 00 00 00  	movq	$0x4, 0x10(%rax,%rcx)
1454a5d94: 66 c7 44 08 18 d2 02        	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454a5d9b: 48 ff c6                    	incq	%rsi
1454a5d9e: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454a5da5: ba 2d 00 00 00              	movl	$0x2d, %edx
1454a5daa: 48 8d 0d 8f 58 50 01        	leaq	0x150588f(%rip), %rcx   # 0x1469ab640
1454a5db1: e8 4a c6 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a5db6: 90                          	nop
1454a5db7: 49 89 d0                    	movq	%rdx, %r8
1454a5dba: 48 85 c0                    	testq	%rax, %rax
1454a5dbd: 48 8d 0d 7c 58 50 01        	leaq	0x150587c(%rip), %rcx   # 0x1469ab640
1454a5dc4: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1454a5dc8: b9 2d 00 00 00              	movl	$0x2d, %ecx
1454a5dcd: 4c 0f 44 c1                 	cmoveq	%rcx, %r8
1454a5dd1: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a5dd8: 48 89 c2                    	movq	%rax, %rdx
1454a5ddb: e8 b0 c3 02 00              	callq	0x1454d2190 <.text+0x54d1190>
1454a5de0: 90                          	nop
1454a5de1: e9 ba fb ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5de6: 44 89 44 90 08              	movl	%r8d, 0x8(%rax,%rdx,4)
1454a5deb: e9 b0 fb ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5df0: 31 c0                       	xorl	%eax, %eax
1454a5df2: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a5df9: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
1454a5e00: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a5e07: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a5e12: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a5e19: 48 c7 85 c0 00 00 00 98 04 00 00    	movq	$0x498, 0xc0(%rbp) # imm = 0x498
1454a5e24: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a5e2b: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a5e32: e8 19 1c f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a5e37: 90                          	nop
1454a5e38: e9 63 fb ff ff              	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5e3d: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454a5e44: 48 85 d2                    	testq	%rdx, %rdx
1454a5e47: 74 16                       	je	0x1454a5e5f <.text+0x54a4e5f>
1454a5e49: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a5e4d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a5e53: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a5e5a: e8 71 c3 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a5e5f: 48 8b 95 b0 02 00 00        	movq	0x2b0(%rbp), %rdx
1454a5e66: 48 85 d2                    	testq	%rdx, %rdx
1454a5e69: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a5e70: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a5e77: 74 0f                       	je	0x1454a5e88 <.text+0x54a4e88>
1454a5e79: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a5e7d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a5e83: e8 48 c3 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a5e88: 41 80 bd 5f 09 00 00 01     	cmpb	$0x1, 0x95f(%r13)
1454a5e90: 0f 85 84 11 00 00           	jne	0x1454a701a <.text+0x54a601a>
1454a5e96: 4d 8b a5 30 08 00 00        	movq	0x830(%r13), %r12
1454a5e9d: 4d 85 e4                    	testq	%r12, %r12
1454a5ea0: 0f 84 74 11 00 00           	je	0x1454a701a <.text+0x54a601a>
1454a5ea6: f3 45 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm8
1454a5eaf: f2 41 0f 10 bd e8 03 00 00  	movsd	0x3e8(%r13), %xmm7
1454a5eb8: f3 0f 16 c7                 	movshdup	%xmm7, %xmm0            # xmm0 = xmm7[1,1,3,3]
1454a5ebc: 0f 29 85 80 00 00 00        	movaps	%xmm0, 0x80(%rbp)
1454a5ec3: 41 0f b6 85 0d 02 00 00     	movzbl	0x20d(%r13), %eax
1454a5ecb: f3 41 0f 10 8d 6c 04 00 00  	movss	0x46c(%r13), %xmm1
1454a5ed4: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a5ed7: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1454a5edb: f3 0f 59 05 29 56 44 00     	mulss	0x445629(%rip), %xmm0   # 0x1458eb50c
1454a5ee3: f3 44 0f 10 25 94 55 44 00  	movss	0x445594(%rip), %xmm12  # 0x1458eb480
1454a5eec: f3 41 0f 58 c4              	addss	%xmm12, %xmm0
1454a5ef1: f3 0f 59 05 eb 6e 45 00     	mulss	0x456eeb(%rip), %xmm0   # 0x1458fcde4
1454a5ef9: f3 41 0f 5f cc              	maxss	%xmm12, %xmm1
1454a5efe: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
1454a5f02: f3 44 0f 10 35 05 71 44 00  	movss	0x447105(%rip), %xmm14  # 0x1458ed010
1454a5f0b: f3 45 0f 58 f0              	addss	%xmm8, %xmm14
1454a5f10: f3 0f 10 05 14 07 45 00     	movss	0x450714(%rip), %xmm0   # 0x1458f662c
1454a5f18: f3 0f 11 8d 90 02 00 00     	movss	%xmm1, 0x290(%rbp)
1454a5f20: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454a5f24: f3 0f 11 85 28 02 00 00     	movss	%xmm0, 0x228(%rbp)
1454a5f2c: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a5f30: 41 be 98 04 00 00           	movl	$0x498, %r14d           # imm = 0x498
1454a5f36: 31 db                       	xorl	%ebx, %ebx
1454a5f38: 4c 89 a5 48 03 00 00        	movq	%r12, 0x348(%rbp)
1454a5f3f: f3 44 0f 11 b5 28 03 00 00  	movss	%xmm14, 0x328(%rbp)
1454a5f48: eb 26                       	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a5f4a: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454a5f4f: f3 0f 10 85 28 02 00 00     	movss	0x228(%rbp), %xmm0
1454a5f57: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a5f5d: 48 89 f1                    	movq	%rsi, %rcx
1454a5f60: 4c 89 fa                    	movq	%r15, %rdx
1454a5f63: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a5f67: e8 c4 8b 01 00              	callq	0x1454beb30 <.text+0x54bdb30>
1454a5f6c: 0f 1f 40 00                 	nopl	(%rax)
1454a5f70: 4c 39 e3                    	cmpq	%r12, %rbx
1454a5f73: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a5f7a: 0f 83 9a 10 00 00           	jae	0x1454a701a <.text+0x54a601a>
1454a5f80: 49 89 df                    	movq	%rbx, %r15
1454a5f83: 49 8b 95 30 08 00 00        	movq	0x830(%r13), %rdx
1454a5f8a: 48 39 d3                    	cmpq	%rdx, %rbx
1454a5f8d: 0f 83 56 4b 00 00           	jae	0x1454aaae9 <.text+0x54a9ae9>
1454a5f93: 49 8b 85 28 08 00 00        	movq	0x828(%r13), %rax
1454a5f9a: 4d 6b ef 68                 	imulq	$0x68, %r15, %r13
1454a5f9e: f3 42 0f 10 44 28 5c        	movss	0x5c(%rax,%r13), %xmm0
1454a5fa5: 4c 01 e8                    	addq	%r13, %rax
1454a5fa8: 44 0f 2e d8                 	ucomiss	%xmm0, %xmm11
1454a5fac: 0f 83 fe 01 00 00           	jae	0x1454a61b0 <.text+0x54a51b0>
1454a5fb2: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a5fb6: f3 0f 5c 48 58              	subss	0x58(%rax), %xmm1
1454a5fbb: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a5fbf: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a5fc2: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454a5fc6: 41 0f 28 cc                 	movaps	%xmm12, %xmm1
1454a5fca: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1454a5fce: f2 0f 10 40 40              	movsd	0x40(%rax), %xmm0
1454a5fd3: f2 0f 10 50 4c              	movsd	0x4c(%rax), %xmm2
1454a5fd8: 0f 5c d0                    	subps	%xmm0, %xmm2
1454a5fdb: f3 44 0f 12 f9              	movsldup	%xmm1, %xmm15           # xmm15 = xmm1[0,0,2,2]
1454a5fe0: 44 0f 59 fa                 	mulps	%xmm2, %xmm15
1454a5fe4: 44 0f 58 f8                 	addps	%xmm0, %xmm15
1454a5fe8: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a5fec: 8b 48 18                    	movl	0x18(%rax), %ecx
1454a5fef: 85 c9                       	testl	%ecx, %ecx
1454a5ff1: 0f 84 ce 01 00 00           	je	0x1454a61c5 <.text+0x54a51c5>
1454a5ff7: 83 f9 01                    	cmpl	$0x1, %ecx
1454a5ffa: 0f 85 60 02 00 00           	jne	0x1454a6260 <.text+0x54a5260>
1454a6000: 48 89 9d 58 03 00 00        	movq	%rbx, 0x358(%rbp)
1454a6007: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a600e: 48 8b 89 30 05 00 00        	movq	0x530(%rcx), %rcx
1454a6015: 48 85 c9                    	testq	%rcx, %rcx
1454a6018: 0f 84 a2 02 00 00           	je	0x1454a62c0 <.text+0x54a52c0>
1454a601e: 4c 8b 60 20                 	movq	0x20(%rax), %r12
1454a6022: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454a6029: 48 8b ba 28 05 00 00        	movq	0x528(%rdx), %rdi
1454a6030: 48 c1 e1 03                 	shlq	$0x3, %rcx
1454a6034: 48 8d 14 c9                 	leaq	(%rcx,%rcx,8), %rdx
1454a6038: 48 8d 1c 17                 	leaq	(%rdi,%rdx), %rbx
1454a603c: 31 c9                       	xorl	%ecx, %ecx
1454a603e: eb 0d                       	jmp	0x1454a604d <.text+0x54a504d>
1454a6040: 48 83 c1 48                 	addq	$0x48, %rcx
1454a6044: 48 39 ca                    	cmpq	%rcx, %rdx
1454a6047: 0f 84 73 02 00 00           	je	0x1454a62c0 <.text+0x54a52c0>
1454a604d: 4c 39 64 0f 28              	cmpq	%r12, 0x28(%rdi,%rcx)
1454a6052: 75 ec                       	jne	0x1454a6040 <.text+0x54a5040>
1454a6054: 83 7c 0f 18 01              	cmpl	$0x1, 0x18(%rdi,%rcx)
1454a6059: 74 e5                       	je	0x1454a6040 <.text+0x54a5040>
1454a605b: 48 8b 54 0f 34              	movq	0x34(%rdi,%rcx), %rdx
1454a6060: 48 89 95 b0 02 00 00        	movq	%rdx, 0x2b0(%rbp)
1454a6067: 8b 4c 0f 3c                 	movl	0x3c(%rdi,%rcx), %ecx
1454a606b: 89 8d b8 02 00 00           	movl	%ecx, 0x2b8(%rbp)
1454a6071: f2 0f 10 85 b0 02 00 00     	movsd	0x2b0(%rbp), %xmm0
1454a6079: 44 0f 5c f8                 	subps	%xmm0, %xmm15
1454a607d: 45 0f 59 ff                 	mulps	%xmm15, %xmm15
1454a6081: f3 41 0f 16 c7              	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454a6086: f3 41 0f 58 c7              	addss	%xmm15, %xmm0
1454a608b: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
1454a608f: 0f 2e 05 56 6d 45 00        	ucomiss	0x456d56(%rip), %xmm0   # 0x1458fcdec
1454a6096: 76 14                       	jbe	0x1454a60ac <.text+0x54a50ac>
1454a6098: f3 0f 10 40 58              	movss	0x58(%rax), %xmm0
1454a609d: f3 0f 58 40 5c              	addss	0x5c(%rax), %xmm0
1454a60a2: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
1454a60a6: 0f 82 21 02 00 00           	jb	0x1454a62cd <.text+0x54a52cd>
1454a60ac: 4c 89 a5 10 02 00 00        	movq	%r12, 0x210(%rbp)
1454a60b3: 0f b6 70 30                 	movzbl	0x30(%rax), %esi
1454a60b7: e8 44 c1 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a60bc: b9 08 00 00 00              	movl	$0x8, %ecx
1454a60c1: ba 08 00 00 00              	movl	$0x8, %edx
1454a60c6: e8 f5 c0 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a60cb: 48 85 c0                    	testq	%rax, %rax
1454a60ce: 0f 84 d7 48 00 00           	je	0x1454aa9ab <.text+0x54a99ab>
1454a60d4: 4c 89 20                    	movq	%r12, (%rax)
1454a60d7: 48 c7 85 d8 02 00 00 01 00 00 00    	movq	$0x1, 0x2d8(%rbp)
1454a60e2: 48 89 85 e0 02 00 00        	movq	%rax, 0x2e0(%rbp)
1454a60e9: 48 c7 85 e8 02 00 00 01 00 00 00    	movq	$0x1, 0x2e8(%rbp)
1454a60f4: 41 bc 01 00 00 00           	movl	$0x1, %r12d
1454a60fa: 40 80 fe 02                 	cmpb	$0x2, %sil
1454a60fe: 0f 85 36 09 00 00           	jne	0x1454a6a3a <.text+0x54a5a3a>
1454a6104: 48 89 c6                    	movq	%rax, %rsi
1454a6107: 48 89 bd a0 00 00 00        	movq	%rdi, 0xa0(%rbp)
1454a610e: 48 89 9d a8 00 00 00        	movq	%rbx, 0xa8(%rbp)
1454a6115: 48 8d 85 10 02 00 00        	leaq	0x210(%rbp), %rax
1454a611c: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1454a6123: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a612a: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a6131: 48 c7 85 c0 00 00 00 02 00 00 00    	movq	$0x2, 0xc0(%rbp)
1454a613c: c6 85 24 03 00 00 01        	movb	$0x1, 0x324(%rbp)
1454a6143: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a614a: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a6151: e8 9a aa 08 00              	callq	0x145530bf0 <.text+0x552fbf0>
1454a6156: 90                          	nop
1454a6157: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a615e: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a6165: 48 8b bd 40 02 00 00        	movq	0x240(%rbp), %rdi
1454a616c: 48 85 ff                    	testq	%rdi, %rdi
1454a616f: 0f 85 25 0e 00 00           	jne	0x1454a6f9a <.text+0x54a5f9a>
1454a6175: 49 01 fc                    	addq	%rdi, %r12
1454a6178: 4c 89 a5 e8 02 00 00        	movq	%r12, 0x2e8(%rbp)
1454a617f: 48 85 d2                    	testq	%rdx, %rdx
1454a6182: 74 0f                       	je	0x1454a6193 <.text+0x54a5193>
1454a6184: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a6188: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a618e: e8 3d c0 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a6193: 48 8b 85 d8 02 00 00        	movq	0x2d8(%rbp), %rax
1454a619a: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a61a1: 48 89 f0                    	movq	%rsi, %rax
1454a61a4: e9 9d 08 00 00              	jmp	0x1454a6a46 <.text+0x54a5a46>
1454a61a9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a61b0: f2 44 0f 10 78 4c           	movsd	0x4c(%rax), %xmm15
1454a61b6: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a61ba: 8b 48 18                    	movl	0x18(%rax), %ecx
1454a61bd: 85 c9                       	testl	%ecx, %ecx
1454a61bf: 0f 85 32 fe ff ff           	jne	0x1454a5ff7 <.text+0x54a4ff7>
1454a61c5: f3 0f 10 40 60              	movss	0x60(%rax), %xmm0
1454a61ca: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454a61ce: 0f 87 9c fd ff ff           	ja	0x1454a5f70 <.text+0x54a4f70>
1454a61d4: f3 0f 10 40 1c              	movss	0x1c(%rax), %xmm0
1454a61d9: f3 44 0f 11 70 60           	movss	%xmm14, 0x60(%rax)
1454a61df: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
1454a61e3: 0f 82 95 07 00 00           	jb	0x1454a697e <.text+0x54a597e>
1454a61e9: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a61f0: 48 8b 96 30 08 00 00        	movq	0x830(%rsi), %rdx
1454a61f7: 49 39 d7                    	cmpq	%rdx, %r15
1454a61fa: 0f 83 00 4b 00 00           	jae	0x1454aad00 <.text+0x54a9d00>
1454a6200: 48 8b 86 28 08 00 00        	movq	0x828(%rsi), %rax
1454a6207: 4a 8d 0c 28                 	leaq	(%rax,%r13), %rcx
1454a620b: f3 42 0f 10 44 28 5c        	movss	0x5c(%rax,%r13), %xmm0
1454a6212: 44 0f 2e d8                 	ucomiss	%xmm0, %xmm11
1454a6216: 0f 83 08 05 00 00           	jae	0x1454a6724 <.text+0x54a5724>
1454a621c: f3 0f 10 8e e4 08 00 00     	movss	0x8e4(%rsi), %xmm1
1454a6224: f3 0f 5c 49 58              	subss	0x58(%rcx), %xmm1
1454a6229: f3 0f 5e c8                 	divss	%xmm0, %xmm1
1454a622d: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a6230: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454a6234: 41 0f 28 cc                 	movaps	%xmm12, %xmm1
1454a6238: f3 0f 5d c8                 	minss	%xmm0, %xmm1
1454a623c: f2 0f 10 41 40              	movsd	0x40(%rcx), %xmm0
1454a6241: f2 0f 10 51 4c              	movsd	0x4c(%rcx), %xmm2
1454a6246: 0f 5c d0                    	subps	%xmm0, %xmm2
1454a6249: f3 44 0f 12 c9              	movsldup	%xmm1, %xmm9            # xmm9 = xmm1[0,0,2,2]
1454a624e: 44 0f 59 ca                 	mulps	%xmm2, %xmm9
1454a6252: 44 0f 58 c8                 	addps	%xmm0, %xmm9
1454a6256: e9 cf 04 00 00              	jmp	0x1454a672a <.text+0x54a572a>
1454a625b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a6260: 44 0f 5c ff                 	subps	%xmm7, %xmm15
1454a6264: 45 0f 59 ff                 	mulps	%xmm15, %xmm15
1454a6268: f3 41 0f 16 c7              	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454a626d: f3 41 0f 58 c7              	addss	%xmm15, %xmm0
1454a6272: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
1454a6276: f3 0f 10 0d b2 89 49 00     	movss	0x4989b2(%rip), %xmm1   # 0x14593ec30
1454a627e: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a6281: 73 5d                       	jae	0x1454a62e0 <.text+0x54a52e0>
1454a6283: 44 0f 2e 40 60              	ucomiss	0x60(%rax), %xmm8
1454a6288: 0f 82 e2 fc ff ff           	jb	0x1454a5f70 <.text+0x54a4f70>
1454a628e: f3 44 0f 11 70 60           	movss	%xmm14, 0x60(%rax)
1454a6294: f3 0f 10 85 90 02 00 00     	movss	0x290(%rbp), %xmm0
1454a629c: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a62a2: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a62a9: 4c 89 fa                    	movq	%r15, %rdx
1454a62ac: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454a62af: 0f 28 9d 80 00 00 00        	movaps	0x80(%rbp), %xmm3
1454a62b6: e8 75 88 01 00              	callq	0x1454beb30 <.text+0x54bdb30>
1454a62bb: e9 b0 fc ff ff              	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a62c0: c7 40 18 00 00 00 00        	movl	$0x0, 0x18(%rax)
1454a62c7: f3 44 0f 11 40 1c           	movss	%xmm8, 0x1c(%rax)
1454a62cd: 4c 8b a5 48 03 00 00        	movq	0x348(%rbp), %r12
1454a62d4: 48 8b 9d 58 03 00 00        	movq	0x358(%rbp), %rbx
1454a62db: e9 90 fc ff ff              	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a62e0: 0f b6 78 30                 	movzbl	0x30(%rax), %edi
1454a62e4: 48 8b 08                    	movq	(%rax), %rcx
1454a62e7: 48 89 8d 38 03 00 00        	movq	%rcx, 0x338(%rbp)
1454a62ee: 48 8b 48 08                 	movq	0x8(%rax), %rcx
1454a62f2: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
1454a62f9: 48 8b 48 10                 	movq	0x10(%rax), %rcx
1454a62fd: 48 c7 00 00 00 00 00        	movq	$0x0, (%rax)
1454a6304: 48 c7 40 08 04 00 00 00     	movq	$0x4, 0x8(%rax)
1454a630c: 48 c7 40 10 00 00 00 00     	movq	$0x0, 0x10(%rax)
1454a6314: 48 85 c9                    	testq	%rcx, %rcx
1454a6317: 0f 84 77 03 00 00           	je	0x1454a6694 <.text+0x54a5694>
1454a631d: 4c 8b a5 58 03 00 00        	movq	0x358(%rbp), %r12
1454a6324: 49 8d 1c cc                 	leaq	(%r12,%rcx,8), %rbx
1454a6328: 4c 89 ad 10 03 00 00        	movq	%r13, 0x310(%rbp)
1454a632f: eb 29                       	jmp	0x1454a635a <.text+0x54a535a>
1454a6331: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a6340: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6347: e8 44 d6 02 00              	callq	0x1454d3990 <.text+0x54d2990>
1454a634c: 90                          	nop
1454a634d: 49 83 c4 08                 	addq	$0x8, %r12
1454a6351: 49 39 dc                    	cmpq	%rbx, %r12
1454a6354: 0f 84 3a 03 00 00           	je	0x1454a6694 <.text+0x54a5694>
1454a635a: 41 8b 14 24                 	movl	(%r12), %edx
1454a635e: 8d 42 fd                    	leal	-0x3(%rdx), %eax
1454a6361: 83 f8 03                    	cmpl	$0x3, %eax
1454a6364: 72 da                       	jb	0x1454a6340 <.text+0x54a5340>
1454a6366: 41 8b 44 24 04              	movl	0x4(%r12), %eax
1454a636b: 85 d2                       	testl	%edx, %edx
1454a636d: 0f 84 51 01 00 00           	je	0x1454a64c4 <.text+0x54a54c4>
1454a6373: 83 fa 01                    	cmpl	$0x1, %edx
1454a6376: 75 d5                       	jne	0x1454a634d <.text+0x54a534d>
1454a6378: 89 c0                       	movl	%eax, %eax
1454a637a: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454a637e: f3 4c 0f 2a c8              	cvtsi2ss	%rax, %xmm9
1454a6383: 40 80 ff 01                 	cmpb	$0x1, %dil
1454a6387: 0f 85 85 01 00 00           	jne	0x1454a6512 <.text+0x54a5512>
1454a638d: f3 44 0f 59 0d 0a 42 58 00  	mulss	0x58420a(%rip), %xmm9   # 0x145a2a5a0
1454a6396: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a639d: f3 44 0f 58 8e 4c 09 00 00  	addss	0x94c(%rsi), %xmm9
1454a63a6: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a63aa: e8 a6 0a 2b 00              	callq	0x145756e55 <.text+0x5755e55>
1454a63af: f3 44 0f 5c c8              	subss	%xmm0, %xmm9
1454a63b4: f3 44 0f 11 8e 4c 09 00 00  	movss	%xmm9, 0x94c(%rsi)
1454a63bd: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a63c1: 76 8a                       	jbe	0x1454a634d <.text+0x54a534d>
1454a63c3: 41 89 fd                    	movl	%edi, %r13d
1454a63c6: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454a63cb: bf 00 00 00 00              	movl	$0x0, %edi
1454a63d0: 0f 42 c7                    	cmovbl	%edi, %eax
1454a63d3: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a63d7: 41 be ff ff ff ff           	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454a63dd: 41 0f 47 c6                 	cmoval	%r14d, %eax
1454a63e1: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a63e4: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a63e9: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a63f0: f3 0f 59 86 88 04 00 00     	mulss	0x488(%rsi), %xmm0
1454a63f8: e8 22 0a 2b 00              	callq	0x145756e1f <.text+0x5755e1f>
1454a63fd: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454a6402: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a6406: 0f 42 c7                    	cmovbl	%edi, %eax
1454a6409: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a640d: 41 0f 47 c6                 	cmoval	%r14d, %eax
1454a6411: 8b 8e 08 04 00 00           	movl	0x408(%rsi), %ecx
1454a6417: 01 c1                       	addl	%eax, %ecx
1454a6419: 89 8e 08 04 00 00           	movl	%ecx, 0x408(%rsi)
1454a641f: 01 86 6c 06 00 00           	addl	%eax, 0x66c(%rsi)
1454a6425: 44 69 c1 10 27 00 00        	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454a642c: 48 8b 86 b8 08 00 00        	movq	0x8b8(%rsi), %rax
1454a6433: 48 85 c0                    	testq	%rax, %rax
1454a6436: 0f 84 fb 01 00 00           	je	0x1454a6637 <.text+0x54a5637>
1454a643c: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454a6443: 41 be 98 04 00 00           	movl	$0x498, %r14d           # imm = 0x498
1454a6449: 44 89 ef                    	movl	%r13d, %edi
1454a644c: 4c 8b ad 10 03 00 00        	movq	0x310(%rbp), %r13
1454a6453: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454a6458: 45 89 ca                    	movl	%r9d, %r10d
1454a645b: 45 01 d2                    	addl	%r10d, %r10d
1454a645e: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a6465: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a6470: 4d 85 d2                    	testq	%r10, %r10
1454a6473: 74 3b                       	je	0x1454a64b0 <.text+0x54a54b0>
1454a6475: 44 0f b7 5c 50 3a           	movzwl	0x3a(%rax,%rdx,2), %r11d
1454a647b: 45 39 de                    	cmpl	%r11d, %r14d
1454a647e: 41 0f 97 c3                 	seta	%r11b
1454a6482: 41 80 db 00                 	sbbb	$0x0, %r11b
1454a6486: 48 ff c2                    	incq	%rdx
1454a6489: 49 83 c2 fe                 	addq	$-0x2, %r10
1454a648d: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454a6491: 74 dd                       	je	0x1454a6470 <.text+0x54a5470>
1454a6493: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454a6497: 45 85 c9                    	testl	%r9d, %r9d
1454a649a: 75 17                       	jne	0x1454a64b3 <.text+0x54a54b3>
1454a649c: e9 3f 01 00 00              	jmp	0x1454a65e0 <.text+0x54a55e0>
1454a64a1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a64b0: 4c 89 ca                    	movq	%r9, %rdx
1454a64b3: 48 83 e9 01                 	subq	$0x1, %rcx
1454a64b7: 0f 82 8c 01 00 00           	jb	0x1454a6649 <.text+0x54a5649>
1454a64bd: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a64c2: eb 8f                       	jmp	0x1454a6453 <.text+0x54a5453>
1454a64c4: 89 c0                       	movl	%eax, %eax
1454a64c6: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a64c9: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a64ce: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a64d5: f3 0f 59 86 74 04 00 00     	mulss	0x474(%rsi), %xmm0
1454a64dd: e8 3d 09 2b 00              	callq	0x145756e1f <.text+0x5755e1f>
1454a64e2: f3 41 0f 5f c4              	maxss	%xmm12, %xmm0
1454a64e7: f3 48 0f 2c d0              	cvttss2si	%xmm0, %rdx
1454a64ec: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a64f0: b8 00 00 00 00              	movl	$0x0, %eax
1454a64f5: 0f 42 d0                    	cmovbl	%eax, %edx
1454a64f8: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a64fc: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a6501: 0f 47 d0                    	cmoval	%eax, %edx
1454a6504: 48 89 f1                    	movq	%rsi, %rcx
1454a6507: e8 14 e4 00 00              	callq	0x1454b4920 <.text+0x54b3920>
1454a650c: 90                          	nop
1454a650d: e9 3b fe ff ff              	jmp	0x1454a634d <.text+0x54a534d>
1454a6512: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a6519: f3 44 0f 59 8e 88 04 00 00  	mulss	0x488(%rsi), %xmm9
1454a6522: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a6526: e8 f4 08 2b 00              	callq	0x145756e1f <.text+0x5755e1f>
1454a652b: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454a6530: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a6534: b9 00 00 00 00              	movl	$0x0, %ecx
1454a6539: 0f 42 c1                    	cmovbl	%ecx, %eax
1454a653c: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a6540: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454a6545: 0f 47 c1                    	cmoval	%ecx, %eax
1454a6548: 8b 8e 08 04 00 00           	movl	0x408(%rsi), %ecx
1454a654e: 01 c1                       	addl	%eax, %ecx
1454a6550: 89 8e 08 04 00 00           	movl	%ecx, 0x408(%rsi)
1454a6556: 01 86 6c 06 00 00           	addl	%eax, 0x66c(%rsi)
1454a655c: 44 69 c1 10 27 00 00        	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454a6563: 48 8b 86 b8 08 00 00        	movq	0x8b8(%rsi), %rax
1454a656a: 48 85 c0                    	testq	%rax, %rax
1454a656d: 74 7b                       	je	0x1454a65ea <.text+0x54a55ea>
1454a656f: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454a6576: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454a657b: 45 89 ca                    	movl	%r9d, %r10d
1454a657e: 45 01 d2                    	addl	%r10d, %r10d
1454a6581: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a6588: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a6590: 4d 85 d2                    	testq	%r10, %r10
1454a6593: 74 3b                       	je	0x1454a65d0 <.text+0x54a55d0>
1454a6595: 44 0f b7 5c 50 3a           	movzwl	0x3a(%rax,%rdx,2), %r11d
1454a659b: 45 39 de                    	cmpl	%r11d, %r14d
1454a659e: 41 0f 97 c3                 	seta	%r11b
1454a65a2: 41 80 db 00                 	sbbb	$0x0, %r11b
1454a65a6: 48 ff c2                    	incq	%rdx
1454a65a9: 49 83 c2 fe                 	addq	$-0x2, %r10
1454a65ad: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454a65b1: 74 dd                       	je	0x1454a6590 <.text+0x54a5590>
1454a65b3: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454a65b7: 45 85 c9                    	testl	%r9d, %r9d
1454a65ba: 74 24                       	je	0x1454a65e0 <.text+0x54a55e0>
1454a65bc: 48 83 e9 01                 	subq	$0x1, %rcx
1454a65c0: 73 17                       	jae	0x1454a65d9 <.text+0x54a55d9>
1454a65c2: eb 28                       	jmp	0x1454a65ec <.text+0x54a55ec>
1454a65c4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454a65d0: 4c 89 ca                    	movq	%r9, %rdx
1454a65d3: 48 83 e9 01                 	subq	$0x1, %rcx
1454a65d7: 72 13                       	jb	0x1454a65ec <.text+0x54a55ec>
1454a65d9: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a65de: eb 96                       	jmp	0x1454a6576 <.text+0x54a5576>
1454a65e0: 44 89 44 90 08              	movl	%r8d, 0x8(%rax,%rdx,4)
1454a65e5: e9 63 fd ff ff              	jmp	0x1454a634d <.text+0x54a534d>
1454a65ea: 31 c0                       	xorl	%eax, %eax
1454a65ec: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a65f3: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
1454a65fa: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a6601: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a660c: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a6613: 48 c7 85 c0 00 00 00 98 04 00 00    	movq	$0x498, 0xc0(%rbp) # imm = 0x498
1454a661e: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a6625: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a662c: e8 1f 14 f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a6631: 90                          	nop
1454a6632: e9 16 fd ff ff              	jmp	0x1454a634d <.text+0x54a534d>
1454a6637: 31 c0                       	xorl	%eax, %eax
1454a6639: 41 be 98 04 00 00           	movl	$0x498, %r14d           # imm = 0x498
1454a663f: 44 89 ef                    	movl	%r13d, %edi
1454a6642: 4c 8b ad 10 03 00 00        	movq	0x310(%rbp), %r13
1454a6649: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a6650: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
1454a6657: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a665e: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a6669: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a6670: 48 c7 85 c0 00 00 00 98 04 00 00    	movq	$0x498, 0xc0(%rbp) # imm = 0x498
1454a667b: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a6682: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a6689: e8 c2 13 f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a668e: 90                          	nop
1454a668f: e9 b9 fc ff ff              	jmp	0x1454a634d <.text+0x54a534d>
1454a6694: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a669b: 48 85 d2                    	testq	%rdx, %rdx
1454a669e: 74 16                       	je	0x1454a66b6 <.text+0x54a56b6>
1454a66a0: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a66a4: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454a66aa: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a66b1: e8 1a bb b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a66b6: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a66bd: 48 8b 91 30 08 00 00        	movq	0x830(%rcx), %rdx
1454a66c4: 49 39 d7                    	cmpq	%rdx, %r15
1454a66c7: 4c 8b a5 48 03 00 00        	movq	0x348(%rbp), %r12
1454a66ce: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a66d2: 0f 83 d3 45 00 00           	jae	0x1454aacab <.text+0x54a9cab>
1454a66d8: 0f b6 81 0d 02 00 00        	movzbl	0x20d(%rcx), %eax
1454a66df: 0f 28 05 fa 3c 50 01        	movaps	0x1503cfa(%rip), %xmm0  # 0x1469aa3e0
1454a66e6: 0f 29 85 a0 00 00 00        	movaps	%xmm0, 0xa0(%rbp)
1454a66ed: 3c 03                       	cmpb	$0x3, %al
1454a66ef: ba 03 00 00 00              	movl	$0x3, %edx
1454a66f4: 0f 43 c2                    	cmovael	%edx, %eax
1454a66f7: 0f b6 c0                    	movzbl	%al, %eax
1454a66fa: f3 0f 10 84 85 a0 00 00 00  	movss	0xa0(%rbp,%rax,4), %xmm0
1454a6703: f3 41 0f 58 c0              	addss	%xmm8, %xmm0
1454a6708: 48 8b 81 28 08 00 00        	movq	0x828(%rcx), %rax
1454a670f: 42 c7 44 28 18 00 00 00 00  	movl	$0x0, 0x18(%rax,%r13)
1454a6718: f3 42 0f 11 44 28 1c        	movss	%xmm0, 0x1c(%rax,%r13)
1454a671f: e9 4c f8 ff ff              	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a6724: f2 44 0f 10 49 4c           	movsd	0x4c(%rcx), %xmm9
1454a672a: f2 44 0f 10 96 e8 03 00 00  	movsd	0x3e8(%rsi), %xmm10
1454a6733: f3 44 0f 10 b6 70 04 00 00  	movss	0x470(%rsi), %xmm14
1454a673c: 44 0f b6 86 0c 02 00 00     	movzbl	0x20c(%rsi), %r8d
1454a6744: 45 0f 57 e4                 	xorps	%xmm12, %xmm12
1454a6748: f3 45 0f 2a e0              	cvtsi2ss	%r8d, %xmm12
1454a674d: f3 44 0f 59 25 8a 26 45 00  	mulss	0x45268a(%rip), %xmm12  # 0x1458f8de0
1454a6756: f3 44 0f 58 25 3d 12 52 00  	addss	0x52123d(%rip), %xmm12  # 0x1459c799c
1454a675f: 0f b6 49 30                 	movzbl	0x30(%rcx), %ecx
1454a6763: 88 8d 58 03 00 00           	movb	%cl, 0x358(%rbp)
1454a6769: 4c 6b c2 68                 	imulq	$0x68, %rdx, %r8
1454a676d: 49 01 c0                    	addq	%rax, %r8
1454a6770: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a6777: 48 89 c2                    	movq	%rax, %rdx
1454a677a: e8 81 a2 08 00              	callq	0x145530a00 <.text+0x552fa00>
1454a677f: 48 8b 8e 30 05 00 00        	movq	0x530(%rsi), %rcx
1454a6786: 48 89 8d 38 03 00 00        	movq	%rcx, 0x338(%rbp)
1454a678d: 48 85 c9                    	testq	%rcx, %rcx
1454a6790: 0f 84 b0 01 00 00           	je	0x1454a6946 <.text+0x54a5946>
1454a6796: f3 45 0f 58 e6              	addss	%xmm14, %xmm12
1454a679b: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a67a2: 48 8b b0 28 05 00 00        	movq	0x528(%rax), %rsi
1454a67a9: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
1454a67b0: 48 8d 04 c0                 	leaq	(%rax,%rax,8), %rax
1454a67b4: 48 8d 14 c6                 	leaq	(%rsi,%rax,8), %rdx
1454a67b8: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a67bf: 4c 8b 8d 40 02 00 00        	movq	0x240(%rbp), %r9
1454a67c6: 4d 89 ca                    	movq	%r9, %r10
1454a67c9: 48 b8 f8 ff ff ff ff ff ff 0f       	movabsq	$0xffffffffffffff8, %rax # imm = 0xFFFFFFFFFFFFFF8
1454a67d3: 49 21 c2                    	andq	%rax, %r10
1454a67d6: 41 c1 e1 03                 	shll	$0x3, %r9d
1454a67da: 41 83 e1 38                 	andl	$0x38, %r9d
1454a67de: 49 89 f3                    	movq	%rsi, %r11
1454a67e1: eb 16                       	jmp	0x1454a67f9 <.text+0x54a57f9>
1454a67e3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454a67f0: 49 39 d3                    	cmpq	%rdx, %r11
1454a67f3: 0f 84 4d 01 00 00           	je	0x1454a6946 <.text+0x54a5946>
1454a67f9: 4c 89 db                    	movq	%r11, %rbx
1454a67fc: 49 83 c3 48                 	addq	$0x48, %r11
1454a6800: 80 7b 18 00                 	cmpb	$0x0, 0x18(%rbx)
1454a6804: 75 ea                       	jne	0x1454a67f0 <.text+0x54a57f0>
1454a6806: 48 8b 7b 28                 	movq	0x28(%rbx), %rdi
1454a680a: 31 c0                       	xorl	%eax, %eax
1454a680c: 0f 1f 40 00                 	nopl	(%rax)
1454a6810: 49 39 c2                    	cmpq	%rax, %r10
1454a6813: 74 3d                       	je	0x1454a6852 <.text+0x54a5852>
1454a6815: 48 39 3c c1                 	cmpq	%rdi, (%rcx,%rax,8)
1454a6819: 74 d5                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a681b: 48 39 7c c1 08              	cmpq	%rdi, 0x8(%rcx,%rax,8)
1454a6820: 74 ce                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a6822: 48 39 7c c1 10              	cmpq	%rdi, 0x10(%rcx,%rax,8)
1454a6827: 74 c7                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a6829: 48 39 7c c1 18              	cmpq	%rdi, 0x18(%rcx,%rax,8)
1454a682e: 74 c0                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a6830: 48 39 7c c1 20              	cmpq	%rdi, 0x20(%rcx,%rax,8)
1454a6835: 74 b9                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a6837: 48 39 7c c1 28              	cmpq	%rdi, 0x28(%rcx,%rax,8)
1454a683c: 74 b2                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a683e: 48 39 7c c1 30              	cmpq	%rdi, 0x30(%rcx,%rax,8)
1454a6843: 74 ab                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a6845: 48 39 7c c1 38              	cmpq	%rdi, 0x38(%rcx,%rax,8)
1454a684a: 48 8d 40 08                 	leaq	0x8(%rax), %rax
1454a684e: 75 c0                       	jne	0x1454a6810 <.text+0x54a5810>
1454a6850: eb 9e                       	jmp	0x1454a67f0 <.text+0x54a57f0>
1454a6852: 4d 85 c9                    	testq	%r9, %r9
1454a6855: 74 0c                       	je	0x1454a6863 <.text+0x54a5863>
1454a6857: 4a 39 3c d1                 	cmpq	%rdi, (%rcx,%r10,8)
1454a685b: 74 93                       	je	0x1454a67f0 <.text+0x54a57f0>
1454a685d: 41 83 f9 08                 	cmpl	$0x8, %r9d
1454a6861: 75 64                       	jne	0x1454a68c7 <.text+0x54a58c7>
1454a6863: f2 0f 10 43 34              	movsd	0x34(%rbx), %xmm0
1454a6868: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a686b: 41 0f 5c ca                 	subps	%xmm10, %xmm1
1454a686f: 0f 59 c9                    	mulps	%xmm1, %xmm1
1454a6872: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454a6876: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1454a687a: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a687d: f3 0f 51 ca                 	sqrtss	%xmm2, %xmm1
1454a6881: 44 0f 2e e1                 	ucomiss	%xmm1, %xmm12
1454a6885: 0f 82 65 ff ff ff           	jb	0x1454a67f0 <.text+0x54a57f0>
1454a688b: 41 0f 2e ce                 	ucomiss	%xmm14, %xmm1
1454a688f: 0f 86 5b ff ff ff           	jbe	0x1454a67f0 <.text+0x54a57f0>
1454a6895: 8b 43 20                    	movl	0x20(%rbx), %eax
1454a6898: 85 c0                       	testl	%eax, %eax
1454a689a: 0f 84 0a 03 00 00           	je	0x1454a6baa <.text+0x54a5baa>
1454a68a0: 83 f8 01                    	cmpl	$0x1, %eax
1454a68a3: 0f 84 0e 03 00 00           	je	0x1454a6bb7 <.text+0x54a5bb7>
1454a68a9: 80 bd 58 03 00 00 03        	cmpb	$0x3, 0x358(%rbp)
1454a68b0: 0f 85 3a ff ff ff           	jne	0x1454a67f0 <.text+0x54a57f0>
1454a68b6: 83 c0 fd                    	addl	$-0x3, %eax
1454a68b9: 83 f8 03                    	cmpl	$0x3, %eax
1454a68bc: 0f 83 2e ff ff ff           	jae	0x1454a67f0 <.text+0x54a57f0>
1454a68c2: e9 ec 02 00 00              	jmp	0x1454a6bb3 <.text+0x54a5bb3>
1454a68c7: 4a 39 7c d1 08              	cmpq	%rdi, 0x8(%rcx,%r10,8)
1454a68cc: 0f 84 1e ff ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a68d2: 41 83 f9 10                 	cmpl	$0x10, %r9d
1454a68d6: 74 8b                       	je	0x1454a6863 <.text+0x54a5863>
1454a68d8: 4a 39 7c d1 10              	cmpq	%rdi, 0x10(%rcx,%r10,8)
1454a68dd: 0f 84 0d ff ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a68e3: 41 83 f9 18                 	cmpl	$0x18, %r9d
1454a68e7: 0f 84 76 ff ff ff           	je	0x1454a6863 <.text+0x54a5863>
1454a68ed: 4a 39 7c d1 18              	cmpq	%rdi, 0x18(%rcx,%r10,8)
1454a68f2: 0f 84 f8 fe ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a68f8: 41 83 f9 20                 	cmpl	$0x20, %r9d
1454a68fc: 0f 84 61 ff ff ff           	je	0x1454a6863 <.text+0x54a5863>
1454a6902: 4a 39 7c d1 20              	cmpq	%rdi, 0x20(%rcx,%r10,8)
1454a6907: 0f 84 e3 fe ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a690d: 41 83 f9 28                 	cmpl	$0x28, %r9d
1454a6911: 0f 84 4c ff ff ff           	je	0x1454a6863 <.text+0x54a5863>
1454a6917: 4a 39 7c d1 28              	cmpq	%rdi, 0x28(%rcx,%r10,8)
1454a691c: 0f 84 ce fe ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a6922: 41 83 f9 30                 	cmpl	$0x30, %r9d
1454a6926: 0f 84 37 ff ff ff           	je	0x1454a6863 <.text+0x54a5863>
1454a692c: 4a 39 7c d1 30              	cmpq	%rdi, 0x30(%rcx,%r10,8)
1454a6931: 0f 84 b9 fe ff ff           	je	0x1454a67f0 <.text+0x54a57f0>
1454a6937: 41 83 f9 38                 	cmpl	$0x38, %r9d
1454a693b: 0f 84 22 ff ff ff           	je	0x1454a6863 <.text+0x54a5863>
1454a6941: e9 aa fe ff ff              	jmp	0x1454a67f0 <.text+0x54a57f0>
1454a6946: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a694d: 48 85 d2                    	testq	%rdx, %rdx
1454a6950: 74 16                       	je	0x1454a6968 <.text+0x54a5968>
1454a6952: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a6959: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a695d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a6963: e8 68 b8 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a6968: f3 44 0f 10 25 0f 4b 44 00  	movss	0x444b0f(%rip), %xmm12  # 0x1458eb480
1454a6971: f3 44 0f 10 b5 28 03 00 00  	movss	0x328(%rbp), %xmm14
1454a697a: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a697e: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a6985: 48 8b 96 30 08 00 00        	movq	0x830(%rsi), %rdx
1454a698c: 49 39 d7                    	cmpq	%rdx, %r15
1454a698f: 0f 83 27 43 00 00           	jae	0x1454aacbc <.text+0x54a9cbc>
1454a6995: 48 8b 86 28 08 00 00        	movq	0x828(%rsi), %rax
1454a699c: f3 44 0f 10 96 f4 03 00 00  	movss	0x3f4(%rsi), %xmm10
1454a69a5: f3 46 0f 58 54 28 64        	addss	0x64(%rax,%r13), %xmm10
1454a69ac: 41 0f 28 c2                 	movaps	%xmm10, %xmm0
1454a69b0: e8 7c 04 2b 00              	callq	0x145756e31 <.text+0x5755e31>
1454a69b5: 44 0f 28 c8                 	movaps	%xmm0, %xmm9
1454a69b9: 41 0f 28 c2                 	movaps	%xmm10, %xmm0
1454a69bd: e8 69 04 2b 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a69c2: 44 0f 14 c8                 	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454a69c6: 44 0f 59 0d 22 3a 50 01     	mulps	0x1503a22(%rip), %xmm9  # 0x1469aa3f0
1454a69ce: 44 0f 58 cf                 	addps	%xmm7, %xmm9
1454a69d2: 41 0f 28 c7                 	movaps	%xmm15, %xmm0
1454a69d6: 0f 5c c7                    	subps	%xmm7, %xmm0
1454a69d9: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a69dc: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a69e0: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a69e4: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a69e7: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a69eb: 0f 2e 05 0e a5 48 00        	ucomiss	0x48a50e(%rip), %xmm0   # 0x145930f00
1454a69f2: 0f 87 52 f5 ff ff           	ja	0x1454a5f4a <.text+0x54a4f4a>
1454a69f8: 45 0f 5c f9                 	subps	%xmm9, %xmm15
1454a69fc: 45 0f 59 ff                 	mulps	%xmm15, %xmm15
1454a6a00: f3 41 0f 16 c7              	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
1454a6a05: f3 41 0f 58 c7              	addss	%xmm15, %xmm0
1454a6a0a: f3 0f 51 c0                 	sqrtss	%xmm0, %xmm0
1454a6a0e: 0f 2e 05 ff da 76 00        	ucomiss	0x76daff(%rip), %xmm0   # 0x145c14514
1454a6a15: 0f 86 55 f5 ff ff           	jbe	0x1454a5f70 <.text+0x54a4f70>
1454a6a1b: f3 41 0f 16 d9              	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
1454a6a20: f3 0f 10 85 90 02 00 00     	movss	0x290(%rbp), %xmm0
1454a6a28: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a6a2e: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6a35: e9 26 f5 ff ff              	jmp	0x1454a5f60 <.text+0x54a4f60>
1454a6a3a: b9 01 00 00 00              	movl	$0x1, %ecx
1454a6a3f: 48 89 8d 38 03 00 00        	movq	%rcx, 0x338(%rbp)
1454a6a46: 4a 8d 1c e0                 	leaq	(%rax,%r12,8), %rbx
1454a6a4a: 48 89 85 98 02 00 00        	movq	%rax, 0x298(%rbp)
1454a6a51: 49 89 c4                    	movq	%rax, %r12
1454a6a54: eb 1a                       	jmp	0x1454a6a70 <.text+0x54a5a70>
1454a6a56: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a6a60: 48 8b 47 08                 	movq	0x8(%rdi), %rax
1454a6a64: 44 0f 13 0c f0              	movlps	%xmm9, (%rax,%rsi,8)
1454a6a69: 48 ff c6                    	incq	%rsi
1454a6a6c: 48 89 77 10                 	movq	%rsi, 0x10(%rdi)
1454a6a70: 49 39 dc                    	cmpq	%rbx, %r12
1454a6a73: 0f 84 ba 00 00 00           	je	0x1454a6b33 <.text+0x54a5b33>
1454a6a79: 4c 89 e0                    	movq	%r12, %rax
1454a6a7c: 49 83 c4 08                 	addq	$0x8, %r12
1454a6a80: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6a87: 48 8b 91 30 05 00 00        	movq	0x530(%rcx), %rdx
1454a6a8e: 48 85 d2                    	testq	%rdx, %rdx
1454a6a91: 74 dd                       	je	0x1454a6a70 <.text+0x54a5a70>
1454a6a93: 48 8b 08                    	movq	(%rax), %rcx
1454a6a96: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a6a9d: 48 8b 80 28 05 00 00        	movq	0x528(%rax), %rax
1454a6aa4: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a6aa8: 4c 8d 04 d2                 	leaq	(%rdx,%rdx,8), %r8
1454a6aac: 45 31 c9                    	xorl	%r9d, %r9d
1454a6aaf: 31 d2                       	xorl	%edx, %edx
1454a6ab1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a6ac0: 4a 39 4c 08 28              	cmpq	%rcx, 0x28(%rax,%r9)
1454a6ac5: 74 19                       	je	0x1454a6ae0 <.text+0x54a5ae0>
1454a6ac7: 48 ff c2                    	incq	%rdx
1454a6aca: 49 83 c1 48                 	addq	$0x48, %r9
1454a6ace: 4d 39 c8                    	cmpq	%r9, %r8
1454a6ad1: 75 ed                       	jne	0x1454a6ac0 <.text+0x54a5ac0>
1454a6ad3: eb 9b                       	jmp	0x1454a6a70 <.text+0x54a5a70>
1454a6ad5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a6ae0: f2 46 0f 10 4c 08 20        	movsd	0x20(%rax,%r9), %xmm9
1454a6ae7: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6aee: e8 6d a5 02 00              	callq	0x1454d1060 <.text+0x54d0060>
1454a6af3: 90                          	nop
1454a6af4: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a6afb: 48 8b 90 30 08 00 00        	movq	0x830(%rax), %rdx
1454a6b02: 49 39 d7                    	cmpq	%rdx, %r15
1454a6b05: 0f 83 60 40 00 00           	jae	0x1454aab6b <.text+0x54a9b6b>
1454a6b0b: 48 8b 80 28 08 00 00        	movq	0x828(%rax), %rax
1454a6b12: 4a 8d 3c 28                 	leaq	(%rax,%r13), %rdi
1454a6b16: 4a 8b 74 28 10              	movq	0x10(%rax,%r13), %rsi
1454a6b1b: 4a 3b 34 28                 	cmpq	(%rax,%r13), %rsi
1454a6b1f: 0f 85 3b ff ff ff           	jne	0x1454a6a60 <.text+0x54a5a60>
1454a6b25: 48 89 f9                    	movq	%rdi, %rcx
1454a6b28: e8 b3 d2 2b 00              	callq	0x145763de0 <.text+0x5762de0>
1454a6b2d: 90                          	nop
1454a6b2e: e9 2d ff ff ff              	jmp	0x1454a6a60 <.text+0x54a5a60>
1454a6b33: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a6b3a: 48 85 d2                    	testq	%rdx, %rdx
1454a6b3d: 74 16                       	je	0x1454a6b55 <.text+0x54a5b55>
1454a6b3f: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a6b43: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a6b49: 48 8b 8d 98 02 00 00        	movq	0x298(%rbp), %rcx
1454a6b50: e8 7b b6 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a6b55: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6b5c: 48 8b 91 30 08 00 00        	movq	0x830(%rcx), %rdx
1454a6b63: 49 39 d7                    	cmpq	%rdx, %r15
1454a6b66: 4c 8b a5 48 03 00 00        	movq	0x348(%rbp), %r12
1454a6b6d: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a6b71: 0f 83 6b 42 00 00           	jae	0x1454aade2 <.text+0x54a9de2>
1454a6b77: 48 8b 81 28 08 00 00        	movq	0x828(%rcx), %rax
1454a6b7e: 42 c7 44 28 18 02 00 00 00  	movl	$0x2, 0x18(%rax,%r13)
1454a6b87: 48 8b 91 30 08 00 00        	movq	0x830(%rcx), %rdx
1454a6b8e: 49 39 d7                    	cmpq	%rdx, %r15
1454a6b91: 0f 83 5c 42 00 00           	jae	0x1454aadf3 <.text+0x54a9df3>
1454a6b97: 48 8b 81 28 08 00 00        	movq	0x828(%rcx), %rax
1454a6b9e: f3 46 0f 11 44 28 60        	movss	%xmm8, 0x60(%rax,%r13)
1454a6ba5: e9 c6 f3 ff ff              	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a6baa: 80 bd 58 03 00 00 02        	cmpb	$0x2, 0x358(%rbp)
1454a6bb1: 75 0d                       	jne	0x1454a6bc0 <.text+0x54a5bc0>
1454a6bb3: 31 c0                       	xorl	%eax, %eax
1454a6bb5: eb 0b                       	jmp	0x1454a6bc2 <.text+0x54a5bc2>
1454a6bb7: 80 bd 58 03 00 00 01        	cmpb	$0x1, 0x358(%rbp)
1454a6bbe: 74 f3                       	je	0x1454a6bb3 <.text+0x54a5bb3>
1454a6bc0: b0 01                       	movb	$0x1, %al
1454a6bc2: 49 39 d3                    	cmpq	%rdx, %r11
1454a6bc5: 0f 84 f6 02 00 00           	je	0x1454a6ec1 <.text+0x54a5ec1>
1454a6bcb: 89 45 48                    	movl	%eax, 0x48(%rbp)
1454a6bce: 41 0f 5c c1                 	subps	%xmm9, %xmm0
1454a6bd2: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a6bd5: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a6bd9: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a6bdd: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a6be0: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a6be4: f3 0f 11 85 98 02 00 00     	movss	%xmm0, 0x298(%rbp)
1454a6bec: 4c 29 da                    	subq	%r11, %rdx
1454a6bef: 48 c1 ea 03                 	shrq	$0x3, %rdx
1454a6bf3: 48 b8 39 8e e3 38 8e e3 38 8e       	movabsq	$-0x71c71c71c71c71c7, %rax # imm = 0x8E38E38E38E38E39
1454a6bfd: 48 0f af d0                 	imulq	%rax, %rdx
1454a6c01: 45 31 e4                    	xorl	%r12d, %r12d
1454a6c04: 48 89 75 30                 	movq	%rsi, 0x30(%rbp)
1454a6c08: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a6c10: 4b 8d 04 e4                 	leaq	(%r12,%r12,8), %rax
1454a6c14: 41 80 7c c3 18 00           	cmpb	$0x0, 0x18(%r11,%rax,8)
1454a6c1a: 74 44                       	je	0x1454a6c60 <.text+0x54a5c60>
1454a6c1c: 0f b6 85 b2 02 00 00        	movzbl	0x2b2(%rbp), %eax
1454a6c23: 88 85 da 02 00 00           	movb	%al, 0x2da(%rbp)
1454a6c29: 0f b7 85 b0 02 00 00        	movzwl	0x2b0(%rbp), %eax
1454a6c30: 66 89 85 d8 02 00 00        	movw	%ax, 0x2d8(%rbp)
1454a6c37: 0f b6 85 da 02 00 00        	movzbl	0x2da(%rbp), %eax
1454a6c3e: 88 85 b2 02 00 00           	movb	%al, 0x2b2(%rbp)
1454a6c44: 0f b7 85 d8 02 00 00        	movzwl	0x2d8(%rbp), %eax
1454a6c4b: 66 89 85 b0 02 00 00        	movw	%ax, 0x2b0(%rbp)
1454a6c52: 49 ff c4                    	incq	%r12
1454a6c55: 49 39 d4                    	cmpq	%rdx, %r12
1454a6c58: 75 b6                       	jne	0x1454a6c10 <.text+0x54a5c10>
1454a6c5a: e9 62 02 00 00              	jmp	0x1454a6ec1 <.text+0x54a5ec1>
1454a6c5f: 90                          	nop
1454a6c60: 49 8d 04 c3                 	leaq	(%r11,%rax,8), %rax
1454a6c64: 48 8b 58 28                 	movq	0x28(%rax), %rbx
1454a6c68: 45 31 c0                    	xorl	%r8d, %r8d
1454a6c6b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a6c70: 4d 39 c2                    	cmpq	%r8, %r10
1454a6c73: 74 48                       	je	0x1454a6cbd <.text+0x54a5cbd>
1454a6c75: 4a 39 1c c1                 	cmpq	%rbx, (%rcx,%r8,8)
1454a6c79: 74 a1                       	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6c7b: 4a 39 5c c1 08              	cmpq	%rbx, 0x8(%rcx,%r8,8)
1454a6c80: 74 9a                       	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6c82: 4a 39 5c c1 10              	cmpq	%rbx, 0x10(%rcx,%r8,8)
1454a6c87: 74 93                       	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6c89: 4a 39 5c c1 18              	cmpq	%rbx, 0x18(%rcx,%r8,8)
1454a6c8e: 74 8c                       	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6c90: 4a 39 5c c1 20              	cmpq	%rbx, 0x20(%rcx,%r8,8)
1454a6c95: 74 85                       	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6c97: 4a 39 5c c1 28              	cmpq	%rbx, 0x28(%rcx,%r8,8)
1454a6c9c: 0f 84 7a ff ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6ca2: 4a 39 5c c1 30              	cmpq	%rbx, 0x30(%rcx,%r8,8)
1454a6ca7: 0f 84 6f ff ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6cad: 4a 39 5c c1 38              	cmpq	%rbx, 0x38(%rcx,%r8,8)
1454a6cb2: 4d 8d 40 08                 	leaq	0x8(%r8), %r8
1454a6cb6: 75 b8                       	jne	0x1454a6c70 <.text+0x54a5c70>
1454a6cb8: e9 5f ff ff ff              	jmp	0x1454a6c1c <.text+0x54a5c1c>
1454a6cbd: 4d 85 c9                    	testq	%r9, %r9
1454a6cc0: 74 10                       	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6cc2: 4a 39 1c d1                 	cmpq	%rbx, (%rcx,%r10,8)
1454a6cc6: 0f 84 50 ff ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6ccc: 41 83 f9 08                 	cmpl	$0x8, %r9d
1454a6cd0: 75 58                       	jne	0x1454a6d2a <.text+0x54a5d2a>
1454a6cd2: f2 0f 10 40 34              	movsd	0x34(%rax), %xmm0
1454a6cd7: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a6cda: 41 0f 5c ca                 	subps	%xmm10, %xmm1
1454a6cde: 0f 59 c9                    	mulps	%xmm1, %xmm1
1454a6ce1: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454a6ce5: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1454a6ce9: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a6cec: f3 0f 51 ca                 	sqrtss	%xmm2, %xmm1
1454a6cf0: 44 0f 2e e1                 	ucomiss	%xmm1, %xmm12
1454a6cf4: 0f 82 22 ff ff ff           	jb	0x1454a6c1c <.text+0x54a5c1c>
1454a6cfa: 41 0f 2e ce                 	ucomiss	%xmm14, %xmm1
1454a6cfe: 0f 86 18 ff ff ff           	jbe	0x1454a6c1c <.text+0x54a5c1c>
1454a6d04: 8b 40 20                    	movl	0x20(%rax), %eax
1454a6d07: 85 c0                       	testl	%eax, %eax
1454a6d09: 0f 84 96 00 00 00           	je	0x1454a6da5 <.text+0x54a5da5>
1454a6d0f: 83 f8 01                    	cmpl	$0x1, %eax
1454a6d12: 0f 85 9d 00 00 00           	jne	0x1454a6db5 <.text+0x54a5db5>
1454a6d18: 80 bd 58 03 00 00 01        	cmpb	$0x1, 0x358(%rbp)
1454a6d1f: 0f 85 89 00 00 00           	jne	0x1454a6dae <.text+0x54a5dae>
1454a6d25: e9 a4 00 00 00              	jmp	0x1454a6dce <.text+0x54a5dce>
1454a6d2a: 4a 39 5c d1 08              	cmpq	%rbx, 0x8(%rcx,%r10,8)
1454a6d2f: 0f 84 e7 fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d35: 41 83 f9 10                 	cmpl	$0x10, %r9d
1454a6d39: 74 97                       	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6d3b: 4a 39 5c d1 10              	cmpq	%rbx, 0x10(%rcx,%r10,8)
1454a6d40: 0f 84 d6 fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d46: 41 83 f9 18                 	cmpl	$0x18, %r9d
1454a6d4a: 74 86                       	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6d4c: 4a 39 5c d1 18              	cmpq	%rbx, 0x18(%rcx,%r10,8)
1454a6d51: 0f 84 c5 fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d57: 41 83 f9 20                 	cmpl	$0x20, %r9d
1454a6d5b: 0f 84 71 ff ff ff           	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6d61: 4a 39 5c d1 20              	cmpq	%rbx, 0x20(%rcx,%r10,8)
1454a6d66: 0f 84 b0 fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d6c: 41 83 f9 28                 	cmpl	$0x28, %r9d
1454a6d70: 0f 84 5c ff ff ff           	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6d76: 4a 39 5c d1 28              	cmpq	%rbx, 0x28(%rcx,%r10,8)
1454a6d7b: 0f 84 9b fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d81: 41 83 f9 30                 	cmpl	$0x30, %r9d
1454a6d85: 0f 84 47 ff ff ff           	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6d8b: 4a 39 5c d1 30              	cmpq	%rbx, 0x30(%rcx,%r10,8)
1454a6d90: 0f 84 86 fe ff ff           	je	0x1454a6c1c <.text+0x54a5c1c>
1454a6d96: 41 83 f9 38                 	cmpl	$0x38, %r9d
1454a6d9a: 0f 84 32 ff ff ff           	je	0x1454a6cd2 <.text+0x54a5cd2>
1454a6da0: e9 77 fe ff ff              	jmp	0x1454a6c1c <.text+0x54a5c1c>
1454a6da5: 80 bd 58 03 00 00 02        	cmpb	$0x2, 0x358(%rbp)
1454a6dac: 74 20                       	je	0x1454a6dce <.text+0x54a5dce>
1454a6dae: b0 01                       	movb	$0x1, %al
1454a6db0: 89 45 58                    	movl	%eax, 0x58(%rbp)
1454a6db3: eb 20                       	jmp	0x1454a6dd5 <.text+0x54a5dd5>
1454a6db5: 80 bd 58 03 00 00 03        	cmpb	$0x3, 0x358(%rbp)
1454a6dbc: 0f 85 5a fe ff ff           	jne	0x1454a6c1c <.text+0x54a5c1c>
1454a6dc2: 83 c0 fd                    	addl	$-0x3, %eax
1454a6dc5: 83 f8 03                    	cmpl	$0x3, %eax
1454a6dc8: 0f 83 4e fe ff ff           	jae	0x1454a6c1c <.text+0x54a5c1c>
1454a6dce: c7 45 58 00 00 00 00        	movl	$0x0, 0x58(%rbp)
1454a6dd5: 48 8d 85 a5 00 00 00        	leaq	0xa5(%rbp), %rax
1454a6ddc: 44 8b 85 98 02 00 00        	movl	0x298(%rbp), %r8d
1454a6de3: 44 89 85 98 02 00 00        	movl	%r8d, 0x298(%rbp)
1454a6dea: 41 0f 5c c1                 	subps	%xmm9, %xmm0
1454a6dee: 0f 59 c0                    	mulps	%xmm0, %xmm0
1454a6df1: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a6df5: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a6df9: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a6dfc: f3 0f 51 c1                 	sqrtss	%xmm1, %xmm0
1454a6e00: 44 89 85 a0 00 00 00        	movl	%r8d, 0xa0(%rbp)
1454a6e07: 8b 75 48                    	movl	0x48(%rbp), %esi
1454a6e0a: 40 88 b5 a4 00 00 00        	movb	%sil, 0xa4(%rbp)
1454a6e11: 44 0f b6 85 b2 02 00 00     	movzbl	0x2b2(%rbp), %r8d
1454a6e19: 44 88 40 02                 	movb	%r8b, 0x2(%rax)
1454a6e1d: 44 0f b7 85 b0 02 00 00     	movzwl	0x2b0(%rbp), %r8d
1454a6e25: 66 44 89 00                 	movw	%r8w, (%rax)
1454a6e29: 89 75 48                    	movl	%esi, 0x48(%rbp)
1454a6e2c: 66 0f 7e c0                 	movd	%xmm0, %eax
1454a6e30: 44 8b 45 58                 	movl	0x58(%rbp), %r8d
1454a6e34: 44 28 c6                    	subb	%r8b, %sil
1454a6e37: 75 31                       	jne	0x1454a6e6a <.text+0x54a5e6a>
1454a6e39: 44 8b 85 98 02 00 00        	movl	0x298(%rbp), %r8d
1454a6e40: 44 89 c6                    	movl	%r8d, %esi
1454a6e43: c1 fe 1f                    	sarl	$0x1f, %esi
1454a6e46: d1 ee                       	shrl	%esi
1454a6e48: 44 31 c6                    	xorl	%r8d, %esi
1454a6e4b: 41 89 c0                    	movl	%eax, %r8d
1454a6e4e: 41 c1 f8 1f                 	sarl	$0x1f, %r8d
1454a6e52: 41 d1 e8                    	shrl	%r8d
1454a6e55: 41 31 c0                    	xorl	%eax, %r8d
1454a6e58: 44 39 c6                    	cmpl	%r8d, %esi
1454a6e5b: 41 0f 9c c0                 	setl	%r8b
1454a6e5f: 40 0f 9f c6                 	setg	%sil
1454a6e63: 44 28 c6                    	subb	%r8b, %sil
1454a6e66: 44 8b 45 58                 	movl	0x58(%rbp), %r8d
1454a6e6a: 40 84 f6                    	testb	%sil, %sil
1454a6e6d: 8b b5 98 02 00 00           	movl	0x298(%rbp), %esi
1454a6e73: 0f 4f f0                    	cmovgl	%eax, %esi
1454a6e76: 89 b5 98 02 00 00           	movl	%esi, 0x298(%rbp)
1454a6e7c: 0f b6 45 48                 	movzbl	0x48(%rbp), %eax
1454a6e80: 45 0f b6 c0                 	movzbl	%r8b, %r8d
1454a6e84: 44 0f 4e c0                 	cmovlel	%eax, %r8d
1454a6e88: 44 89 45 48                 	movl	%r8d, 0x48(%rbp)
1454a6e8c: 48 8d 85 b5 00 00 00        	leaq	0xb5(%rbp), %rax
1454a6e93: 4c 8d 85 a5 00 00 00        	leaq	0xa5(%rbp), %r8
1454a6e9a: 49 0f 4e c0                 	cmovleq	%r8, %rax
1454a6e9e: 44 0f b6 40 02              	movzbl	0x2(%rax), %r8d
1454a6ea3: 44 88 85 da 02 00 00        	movb	%r8b, 0x2da(%rbp)
1454a6eaa: 0f b7 00                    	movzwl	(%rax), %eax
1454a6ead: 66 89 85 d8 02 00 00        	movw	%ax, 0x2d8(%rbp)
1454a6eb4: 48 0f 4f fb                 	cmovgq	%rbx, %rdi
1454a6eb8: 48 8b 75 30                 	movq	0x30(%rbp), %rsi
1454a6ebc: e9 76 fd ff ff              	jmp	0x1454a6c37 <.text+0x54a5c37>
1454a6ec1: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a6ec8: 48 85 d2                    	testq	%rdx, %rdx
1454a6ecb: 74 2b                       	je	0x1454a6ef8 <.text+0x54a5ef8>
1454a6ecd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a6ed1: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a6ed7: e8 f4 b2 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a6edc: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a6ee3: 48 8b b0 28 05 00 00        	movq	0x528(%rax), %rsi
1454a6eea: 48 8b 80 30 05 00 00        	movq	0x530(%rax), %rax
1454a6ef1: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a6ef8: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
1454a6eff: 48 c1 e0 03                 	shlq	$0x3, %rax
1454a6f03: 48 8d 0c c0                 	leaq	(%rax,%rax,8), %rcx
1454a6f07: 31 c0                       	xorl	%eax, %eax
1454a6f09: 48 89 f2                    	movq	%rsi, %rdx
1454a6f0c: 4c 8b a5 48 03 00 00        	movq	0x348(%rbp), %r12
1454a6f13: f3 44 0f 10 25 64 45 44 00  	movss	0x444564(%rip), %xmm12  # 0x1458eb480
1454a6f1c: f3 44 0f 10 b5 28 03 00 00  	movss	0x328(%rbp), %xmm14
1454a6f25: 49 8d 5f 01                 	leaq	0x1(%r15), %rbx
1454a6f29: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a6f30: 48 39 c1                    	cmpq	%rax, %rcx
1454a6f33: 0f 84 45 fa ff ff           	je	0x1454a697e <.text+0x54a597e>
1454a6f39: 48 83 c0 48                 	addq	$0x48, %rax
1454a6f3d: 48 39 7a 28                 	cmpq	%rdi, 0x28(%rdx)
1454a6f41: 48 8d 52 48                 	leaq	0x48(%rdx), %rdx
1454a6f45: 75 e9                       	jne	0x1454a6f30 <.text+0x54a5f30>
1454a6f47: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a6f4e: 48 8b 91 30 08 00 00        	movq	0x830(%rcx), %rdx
1454a6f55: 49 39 d7                    	cmpq	%rdx, %r15
1454a6f58: 0f 83 d5 3f 00 00           	jae	0x1454aaf33 <.text+0x54a9f33>
1454a6f5e: f3 0f 10 54 06 ec           	movss	-0x14(%rsi,%rax), %xmm2
1454a6f64: f3 0f 10 5c 06 f0           	movss	-0x10(%rsi,%rax), %xmm3
1454a6f6a: 48 8b 81 28 08 00 00        	movq	0x828(%rcx), %rax
1454a6f71: 42 c7 44 28 18 01 00 00 00  	movl	$0x1, 0x18(%rax,%r13)
1454a6f7a: 4a 89 7c 28 20              	movq	%rdi, 0x20(%rax,%r13)
1454a6f7f: f3 0f 10 85 90 02 00 00     	movss	0x290(%rbp), %xmm0
1454a6f87: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
1454a6f8d: 4c 89 fa                    	movq	%r15, %rdx
1454a6f90: e8 9b 7b 01 00              	callq	0x1454beb30 <.text+0x54bdb30>
1454a6f95: e9 d6 ef ff ff              	jmp	0x1454a5f70 <.text+0x54a4f70>
1454a6f9a: 48 89 8d 98 02 00 00        	movq	%rcx, 0x298(%rbp)
1454a6fa1: 48 89 95 38 03 00 00        	movq	%rdx, 0x338(%rbp)
1454a6fa8: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454a6fb1: ba 01 00 00 00              	movl	$0x1, %edx
1454a6fb6: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454a6fbc: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a6fc3: 49 89 f8                    	movq	%rdi, %r8
1454a6fc6: e8 75 0d 2b 00              	callq	0x145757d40 <.text+0x5756d40>
1454a6fcb: 90                          	nop
1454a6fcc: 4c 8d 04 fd 00 00 00 00     	leaq	(,%rdi,8), %r8
1454a6fd4: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454a6fdb: 4c 8b a5 e8 02 00 00        	movq	0x2e8(%rbp), %r12
1454a6fe2: 48 89 c6                    	movq	%rax, %rsi
1454a6fe5: 4a 8d 0c e0                 	leaq	(%rax,%r12,8), %rcx
1454a6fe9: 48 8b 9d 98 02 00 00        	movq	0x298(%rbp), %rbx
1454a6ff0: 48 89 da                    	movq	%rbx, %rdx
1454a6ff3: e8 e5 fd 2a 00              	callq	0x145756ddd <.text+0x5755ddd>
1454a6ff8: 48 89 d9                    	movq	%rbx, %rcx
1454a6ffb: 48 8b 95 38 03 00 00        	movq	0x338(%rbp), %rdx
1454a7002: 49 01 fc                    	addq	%rdi, %r12
1454a7005: 4c 89 a5 e8 02 00 00        	movq	%r12, 0x2e8(%rbp)
1454a700c: 48 85 d2                    	testq	%rdx, %rdx
1454a700f: 0f 85 6f f1 ff ff           	jne	0x1454a6184 <.text+0x54a5184>
1454a7015: e9 79 f1 ff ff              	jmp	0x1454a6193 <.text+0x54a5193>
1454a701a: 41 80 bd 5b 09 00 00 00     	cmpb	$0x0, 0x95b(%r13)
1454a7022: 0f 85 db 30 00 00           	jne	0x1454aa103 <.text+0x54a9103>
1454a7028: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a7031: f3 0f 5e 05 c7 9e 48 00     	divss	0x489ec7(%rip), %xmm0   # 0x145930f00
1454a7039: f3 0f 11 45 68              	movss	%xmm0, 0x68(%rbp)
1454a703e: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
1454a7045: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
1454a704c: e8 cf 77 f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a7051: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1454a7058: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a705f: 4c 8d 25 d2 f3 26 01        	leaq	0x126f3d2(%rip), %r12   # 0x146716438
1454a7066: f2 45 0f 10 85 e8 03 00 00  	movsd	0x3e8(%r13), %xmm8
1454a706f: 41 8b bd f0 03 00 00        	movl	0x3f0(%r13), %edi
1454a7076: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a7079: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454a707c: 76 69                       	jbe	0x1454a70e7 <.text+0x54a60e7>
1454a707e: f2 41 0f 10 85 18 09 00 00  	movsd	0x918(%r13), %xmm0
1454a7087: 41 0f 28 f8                 	movaps	%xmm8, %xmm7
1454a708b: 0f 5c f8                    	subps	%xmm0, %xmm7
1454a708e: f3 0f 12 c6                 	movsldup	%xmm6, %xmm0            # xmm0 = xmm6[0,0,2,2]
1454a7092: 0f 5e f8                    	divps	%xmm0, %xmm7
1454a7095: f3 0f 16 cf                 	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454a7099: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a709c: e8 c6 fd 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a70a1: f3 0f 10 0d d7 f5 44 00     	movss	0x44f5d7(%rip), %xmm1   # 0x1458f6680
1454a70a9: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454a70ac: 76 39                       	jbe	0x1454a70e7 <.text+0x54a60e7>
1454a70ae: 0f 28 05 9b 1e 45 00        	movaps	0x451e9b(%rip), %xmm0   # 0x1458f8f50
1454a70b5: 0f 57 c6                    	xorps	%xmm6, %xmm0
1454a70b8: e8 8c fd 2a 00              	callq	0x145756e49 <.text+0x5755e49>
1454a70bd: f3 0f 10 0d bb 43 44 00     	movss	0x4443bb(%rip), %xmm1   # 0x1458eb480
1454a70c5: f3 0f 5c c8                 	subss	%xmm0, %xmm1
1454a70c9: f2 41 0f 10 85 a8 08 00 00  	movsd	0x8a8(%r13), %xmm0
1454a70d2: 0f 5c f8                    	subps	%xmm0, %xmm7
1454a70d5: f3 0f 12 c9                 	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454a70d9: 0f 59 cf                    	mulps	%xmm7, %xmm1
1454a70dc: 0f 58 c8                    	addps	%xmm0, %xmm1
1454a70df: 41 0f 13 8d a8 08 00 00     	movlps	%xmm1, 0x8a8(%r13)
1454a70e7: 4c 01 a5 38 03 00 00        	addq	%r12, 0x338(%rbp)
1454a70ee: 45 0f 13 85 18 09 00 00     	movlps	%xmm8, 0x918(%r13)
1454a70f6: 41 89 bd 20 09 00 00        	movl	%edi, 0x920(%r13)
1454a70fd: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a7106: f3 0f 11 85 10 02 00 00     	movss	%xmm0, 0x210(%rbp)
1454a710e: 48 8b 8d a0 02 00 00        	movq	0x2a0(%rbp), %rcx
1454a7115: 8b 41 08                    	movl	0x8(%rcx), %eax
1454a7118: 89 85 b8 02 00 00           	movl	%eax, 0x2b8(%rbp)
1454a711e: 48 8b 01                    	movq	(%rcx), %rax
1454a7121: 48 89 85 b0 02 00 00        	movq	%rax, 0x2b0(%rbp)
1454a7128: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a712f: 49 69 8d d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r13), %rcx # imm = 0x160
1454a713a: 48 01 c1                    	addq	%rax, %rcx
1454a713d: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a7144: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a714b: 48 8d 85 10 02 00 00        	leaq	0x210(%rbp), %rax
1454a7152: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1454a7159: 48 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %rax
1454a7160: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a7167: 48 c7 85 c0 00 00 00 04 00 00 00    	movq	$0x4, 0xc0(%rbp)
1454a7172: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a7179: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a7180: 48 89 da                    	movq	%rbx, %rdx
1454a7183: e8 28 ab 08 00              	callq	0x145531cb0 <.text+0x5530cb0>
1454a7188: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
1454a718f: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a7196: 4c 8b bd 38 02 00 00        	movq	0x238(%rbp), %r15
1454a719d: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454a71a4: 49 8d 3c c7                 	leaq	(%r15,%rax,8), %rdi
1454a71a8: 48 8d b5 d8 02 00 00        	leaq	0x2d8(%rbp), %rsi
1454a71af: f3 44 0f 10 25 68 73 49 00  	movss	0x497368(%rip), %xmm12  # 0x14593e520
1454a71b8: f3 44 0f 10 05 07 3d 46 00  	movss	0x463d07(%rip), %xmm8   # 0x14590aec8
1454a71c1: 4c 89 bd 48 03 00 00        	movq	%r15, 0x348(%rbp)
1454a71c8: f3 44 0f 10 0d 5b f4 44 00  	movss	0x44f45b(%rip), %xmm9   # 0x1458f662c
1454a71d1: f3 44 0f 10 15 a6 42 44 00  	movss	0x4442a6(%rip), %xmm10  # 0x1458eb480
1454a71da: eb 36                       	jmp	0x1454a7212 <.text+0x54a6212>
1454a71dc: 0f 1f 40 00                 	nopl	(%rax)
1454a71e0: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a71e7: 48 89 f1                    	movq	%rsi, %rcx
1454a71ea: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a71ee: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a71f5: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a71fc: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a7201: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a7205: 48 ff c6                    	incq	%rsi
1454a7208: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a720f: 4c 89 f6                    	movq	%r14, %rsi
1454a7212: 49 39 ff                    	cmpq	%rdi, %r15
1454a7215: 0f 84 fc 00 00 00           	je	0x1454a7317 <.text+0x54a6317>
1454a721b: 4d 8b 37                    	movq	(%r15), %r14
1454a721e: c7 44 24 20 00 00 80 3f     	movl	$0x3f800000, 0x20(%rsp) # imm = 0x3F800000
1454a7226: 48 89 f1                    	movq	%rsi, %rcx
1454a7229: 4c 89 ea                    	movq	%r13, %rdx
1454a722c: 41 0f 28 d4                 	movaps	%xmm12, %xmm2
1454a7230: 41 0f 28 d8                 	movaps	%xmm8, %xmm3
1454a7234: e8 77 a5 01 00              	callq	0x1454c17b0 <.text+0x54c07b0>
1454a7239: 90                          	nop
1454a723a: 49 83 c7 08                 	addq	$0x8, %r15
1454a723e: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a7245: 49 69 95 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a7250: 31 c9                       	xorl	%ecx, %ecx
1454a7252: 49 89 c0                    	movq	%rax, %r8
1454a7255: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a7260: 48 39 ca                    	cmpq	%rcx, %rdx
1454a7263: 74 ad                       	je	0x1454a7212 <.text+0x54a6212>
1454a7265: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a726c: 4d 39 b0 88 00 00 00        	cmpq	%r14, 0x88(%r8)
1454a7273: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454a727a: 75 e4                       	jne	0x1454a7260 <.text+0x54a6260>
1454a727c: 8b 95 e0 02 00 00           	movl	0x2e0(%rbp), %edx
1454a7282: 89 54 08 b4                 	movl	%edx, -0x4c(%rax,%rcx)
1454a7286: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a728d: 48 89 54 08 ac              	movq	%rdx, -0x54(%rax,%rcx)
1454a7292: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a7299: 48 89 54 08 b8              	movq	%rdx, -0x48(%rax,%rcx)
1454a729e: 8b 95 e0 02 00 00           	movl	0x2e0(%rbp), %edx
1454a72a4: 89 54 08 c0                 	movl	%edx, -0x40(%rax,%rcx)
1454a72a8: f3 0f 10 85 10 02 00 00     	movss	0x210(%rbp), %xmm0
1454a72b0: f3 0f 10 8d 10 02 00 00     	movss	0x210(%rbp), %xmm1
1454a72b8: 0f 13 4c 08 c4              	movlps	%xmm1, -0x3c(%rax,%rcx)
1454a72bd: f3 0f 11 44 08 cc           	movss	%xmm0, -0x34(%rax,%rcx)
1454a72c3: c7 84 08 10 ff ff ff 00 00 00 00    	movl	$0x0, -0xf0(%rax,%rcx)
1454a72ce: 45 8b 8d 08 09 00 00        	movl	0x908(%r13), %r9d
1454a72d5: 41 ff c1                    	incl	%r9d
1454a72d8: 45 89 8d 08 09 00 00        	movl	%r9d, 0x908(%r13)
1454a72df: 48 89 d9                    	movq	%rbx, %rcx
1454a72e2: 4c 89 f2                    	movq	%r14, %rdx
1454a72e5: 49 89 f0                    	movq	%rsi, %r8
1454a72e8: e8 c3 de f9 ff              	callq	0x1454451b0 <.text+0x54441b0>
1454a72ed: 90                          	nop
1454a72ee: 49 89 f6                    	movq	%rsi, %r14
1454a72f1: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a72f8: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a72ff: 0f 85 db fe ff ff           	jne	0x1454a71e0 <.text+0x54a61e0>
1454a7305: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a730c: e8 9f 0d 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a7311: 90                          	nop
1454a7312: e9 c9 fe ff ff              	jmp	0x1454a71e0 <.text+0x54a61e0>
1454a7317: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a731e: 48 85 d2                    	testq	%rdx, %rdx
1454a7321: 74 16                       	je	0x1454a7339 <.text+0x54a6339>
1454a7323: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a7327: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a732d: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a7334: e8 97 ae b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a7339: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a733c: f3 0f 5e 05 54 1c 45 00     	divss	0x451c54(%rip), %xmm0   # 0x1458f8f98
1454a7344: e8 00 fb 2a 00              	callq	0x145756e49 <.text+0x5755e49>
1454a7349: f3 41 0f 59 85 10 09 00 00  	mulss	0x910(%r13), %xmm0
1454a7352: f3 41 0f 11 85 10 09 00 00  	movss	%xmm0, 0x910(%r13)
1454a735b: f3 41 0f 10 8d e4 08 00 00  	movss	0x8e4(%r13), %xmm1
1454a7364: 45 0f b7 85 30 02 00 00     	movzwl	0x230(%r13), %r8d
1454a736c: 49 8b 85 c8 04 00 00        	movq	0x4c8(%r13), %rax
1454a7373: 49 8b 95 d0 04 00 00        	movq	0x4d0(%r13), %rdx
1454a737a: 48 69 ca 60 01 00 00        	imulq	$0x160, %rdx, %rcx      # imm = 0x160
1454a7381: 48 01 c1                    	addq	%rax, %rcx
1454a7384: 48 85 d2                    	testq	%rdx, %rdx
1454a7387: 74 54                       	je	0x1454a73dd <.text+0x54a63dd>
1454a7389: f3 44 0f 10 15 ee 40 44 00  	movss	0x4440ee(%rip), %xmm10  # 0x1458eb480
1454a7392: f3 0f 10 15 aa 3a 46 00     	movss	0x463aaa(%rip), %xmm2   # 0x14590ae44
1454a739a: f3 0f 10 1d 6e 41 44 00     	movss	0x44416e(%rip), %xmm3   # 0x1458eb510
1454a73a2: 49 89 c1                    	movq	%rax, %r9
1454a73a5: eb 15                       	jmp	0x1454a73bc <.text+0x54a63bc>
1454a73a7: f3 44 0f 5d d4              	minss	%xmm4, %xmm10
1454a73ac: 0f 1f 40 00                 	nopl	(%rax)
1454a73b0: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
1454a73b7: 49 39 c9                    	cmpq	%rcx, %r9
1454a73ba: 74 21                       	je	0x1454a73dd <.text+0x54a63dd>
1454a73bc: 41 80 79 68 00              	cmpb	$0x0, 0x68(%r9)
1454a73c1: 75 ed                       	jne	0x1454a73b0 <.text+0x54a63b0>
1454a73c3: 49 83 79 18 ff              	cmpq	$-0x1, 0x18(%r9)
1454a73c8: 74 e6                       	je	0x1454a73b0 <.text+0x54a63b0>
1454a73ca: 4d 8b 51 30                 	movq	0x30(%r9), %r10
1454a73ce: 41 80 7a 54 00              	cmpb	$0x0, 0x54(%r10)
1454a73d3: 0f 28 e2                    	movaps	%xmm2, %xmm4
1454a73d6: 75 cf                       	jne	0x1454a73a7 <.text+0x54a63a7>
1454a73d8: 0f 28 e3                    	movaps	%xmm3, %xmm4
1454a73db: eb ca                       	jmp	0x1454a73a7 <.text+0x54a63a7>
1454a73dd: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a73e0: f3 0f 5e 15 18 9b 48 00     	divss	0x489b18(%rip), %xmm2   # 0x145930f00
1454a73e8: f3 0f 10 1d 90 59 45 00     	movss	0x455990(%rip), %xmm3   # 0x1458fcd80
1454a73f0: f3 0f 59 da                 	mulss	%xmm2, %xmm3
1454a73f4: f3 0f 58 1d 18 41 44 00     	addss	0x444118(%rip), %xmm3   # 0x1458eb514
1454a73fc: f3 0f 10 25 cc fe 52 00     	movss	0x52fecc(%rip), %xmm4   # 0x1459d72d0
1454a7404: f3 0f 59 e2                 	mulss	%xmm2, %xmm4
1454a7408: f3 0f 59 e2                 	mulss	%xmm2, %xmm4
1454a740c: f3 0f 58 e3                 	addss	%xmm3, %xmm4
1454a7410: 45 0f b7 c0                 	movzwl	%r8w, %r8d
1454a7414: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a7417: f3 41 0f 2a d0              	cvtsi2ss	%r8d, %xmm2
1454a741c: f3 0f 59 25 00 41 44 00     	mulss	0x444100(%rip), %xmm4   # 0x1458eb524
1454a7424: f3 0f 5e 15 00 41 44 00     	divss	0x444100(%rip), %xmm2   # 0x1458eb52c
1454a742c: f3 0f 59 d4                 	mulss	%xmm4, %xmm2
1454a7430: f3 44 0f 59 d2              	mulss	%xmm2, %xmm10
1454a7435: 45 0f b6 85 52 09 00 00     	movzbl	0x952(%r13), %r8d
1454a743d: 41 80 f8 01                 	cmpb	$0x1, %r8b
1454a7441: 75 44                       	jne	0x1454a7487 <.text+0x54a6487>
1454a7443: 41 83 bd 58 08 00 00 01     	cmpl	$0x1, 0x858(%r13)
1454a744b: 75 2d                       	jne	0x1454a747a <.text+0x54a647a>
1454a744d: 0f 28 d9                    	movaps	%xmm1, %xmm3
1454a7450: f3 41 0f 5c 9d 5c 08 00 00  	subss	0x85c(%r13), %xmm3
1454a7459: f3 0f 5e 1d 9f 9a 48 00     	divss	0x489a9f(%rip), %xmm3   # 0x145930f00
1454a7461: 0f 57 e4                    	xorps	%xmm4, %xmm4
1454a7464: f3 0f 5f dc                 	maxss	%xmm4, %xmm3
1454a7468: f3 0f 59 1d b0 f1 44 00     	mulss	0x44f1b0(%rip), %xmm3   # 0x1458f6620
1454a7470: f3 0f 58 1d c0 57 45 00     	addss	0x4557c0(%rip), %xmm3   # 0x1458fcc38
1454a7478: eb 08                       	jmp	0x1454a7482 <.text+0x54a6482>
1454a747a: f3 0f 10 1d b6 57 45 00     	movss	0x4557b6(%rip), %xmm3   # 0x1458fcc38
1454a7482: f3 44 0f 59 d3              	mulss	%xmm3, %xmm10
1454a7487: f3 0f 10 1d f1 3f 44 00     	movss	0x443ff1(%rip), %xmm3   # 0x1458eb480
1454a748f: 48 85 d2                    	testq	%rdx, %rdx
1454a7492: 74 46                       	je	0x1454a74da <.text+0x54a64da>
1454a7494: f3 0f 10 25 a8 39 46 00     	movss	0x4639a8(%rip), %xmm4   # 0x14590ae44
1454a749c: f3 0f 10 2d 6c 40 44 00     	movss	0x44406c(%rip), %xmm5   # 0x1458eb510
1454a74a4: eb 15                       	jmp	0x1454a74bb <.text+0x54a64bb>
1454a74a6: f3 0f 5d df                 	minss	%xmm7, %xmm3
1454a74aa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a74b0: 48 05 60 01 00 00           	addq	$0x160, %rax            # imm = 0x160
1454a74b6: 48 39 c8                    	cmpq	%rcx, %rax
1454a74b9: 74 1f                       	je	0x1454a74da <.text+0x54a64da>
1454a74bb: 80 78 68 00                 	cmpb	$0x0, 0x68(%rax)
1454a74bf: 75 ef                       	jne	0x1454a74b0 <.text+0x54a64b0>
1454a74c1: 48 83 78 18 ff              	cmpq	$-0x1, 0x18(%rax)
1454a74c6: 74 e8                       	je	0x1454a74b0 <.text+0x54a64b0>
1454a74c8: 48 8b 50 30                 	movq	0x30(%rax), %rdx
1454a74cc: 80 7a 54 00                 	cmpb	$0x0, 0x54(%rdx)
1454a74d0: 0f 28 fc                    	movaps	%xmm4, %xmm7
1454a74d3: 75 d1                       	jne	0x1454a74a6 <.text+0x54a64a6>
1454a74d5: 0f 28 fd                    	movaps	%xmm5, %xmm7
1454a74d8: eb cc                       	jmp	0x1454a74a6 <.text+0x54a64a6>
1454a74da: f3 0f 59 d3                 	mulss	%xmm3, %xmm2
1454a74de: 45 84 c0                    	testb	%r8b, %r8b
1454a74e1: 74 40                       	je	0x1454a7523 <.text+0x54a6523>
1454a74e3: 41 83 bd 58 08 00 00 01     	cmpl	$0x1, 0x858(%r13)
1454a74eb: 75 2a                       	jne	0x1454a7517 <.text+0x54a6517>
1454a74ed: f3 41 0f 5c 8d 5c 08 00 00  	subss	0x85c(%r13), %xmm1
1454a74f6: f3 0f 5e 0d 02 9a 48 00     	divss	0x489a02(%rip), %xmm1   # 0x145930f00
1454a74fe: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a7501: f3 0f 5f cb                 	maxss	%xmm3, %xmm1
1454a7505: f3 0f 59 0d 13 f1 44 00     	mulss	0x44f113(%rip), %xmm1   # 0x1458f6620
1454a750d: f3 0f 58 0d 23 57 45 00     	addss	0x455723(%rip), %xmm1   # 0x1458fcc38
1454a7515: eb 08                       	jmp	0x1454a751f <.text+0x54a651f>
1454a7517: f3 0f 10 0d 19 57 45 00     	movss	0x455719(%rip), %xmm1   # 0x1458fcc38
1454a751f: f3 0f 59 d1                 	mulss	%xmm1, %xmm2
1454a7523: f3 0f 5e 05 d5 3f 44 00     	divss	0x443fd5(%rip), %xmm0   # 0x1458eb500
1454a752b: f3 0f 59 05 a1 ff 54 00     	mulss	0x54ffa1(%rip), %xmm0   # 0x1459f74d4
1454a7533: f3 0f 5f 15 4d f1 44 00     	maxss	0x44f14d(%rip), %xmm2   # 0x1458f6688
1454a753b: f3 0f 5e c2                 	divss	%xmm2, %xmm0
1454a753f: f3 44 0f 10 05 38 3f 44 00  	movss	0x443f38(%rip), %xmm8   # 0x1458eb480
1454a7548: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a754c: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454a7550: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454a7554: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454a7558: f3 44 0f 59 d0              	mulss	%xmm0, %xmm10
1454a755d: f3 41 0f 59 f2              	mulss	%xmm10, %xmm6
1454a7562: f3 41 0f 58 b5 0c 09 00 00  	addss	0x90c(%r13), %xmm6
1454a756b: f3 41 0f 11 b5 0c 09 00 00  	movss	%xmm6, 0x90c(%r13)
1454a7574: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
1454a757b: 48 8b 78 78                 	movq	0x78(%rax), %rdi
1454a757f: 48 8b 80 80 00 00 00        	movq	0x80(%rax), %rax
1454a7586: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a758d: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
1454a7591: 48 c1 e0 04                 	shlq	$0x4, %rax
1454a7595: 48 01 f8                    	addq	%rdi, %rax
1454a7598: 48 89 bd a0 00 00 00        	movq	%rdi, 0xa0(%rbp)
1454a759f: 48 89 85 18 03 00 00        	movq	%rax, 0x318(%rbp)
1454a75a6: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a75ad: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a75b8: 48 8d 45 68                 	leaq	0x68(%rbp), %rax
1454a75bc: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a75c3: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454a75ca: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a75d1: 48 89 da                    	movq	%rbx, %rdx
1454a75d4: e8 57 79 08 00              	callq	0x14552ef30 <.text+0x552df30>
1454a75d9: f3 41 0f 10 85 0c 09 00 00  	movss	0x90c(%r13), %xmm0
1454a75e2: 48 8b 85 b8 02 00 00        	movq	0x2b8(%rbp), %rax
1454a75e9: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a75f0: 4c 8b b5 c0 02 00 00        	movq	0x2c0(%rbp), %r14
1454a75f7: 45 31 ed                    	xorl	%r13d, %r13d
1454a75fa: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a7601: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454a7605: 0f 82 bb 00 00 00           	jb	0x1454a76c6 <.text+0x54a66c6>
1454a760b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a7610: 41 83 fd 08                 	cmpl	$0x8, %r13d
1454a7614: 0f 83 ac 00 00 00           	jae	0x1454a76c6 <.text+0x54a66c6>
1454a761a: f3 0f 10 5d 68              	movss	0x68(%rbp), %xmm3
1454a761f: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a7626: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a762d: 4d 89 f0                    	movq	%r14, %r8
1454a7630: e8 bb 78 01 00              	callq	0x1454beef0 <.text+0x54bdef0>
1454a7635: 90                          	nop
1454a7636: 48 3b 85 48 03 00 00        	cmpq	0x348(%rbp), %rax
1454a763d: 0f 83 0c 35 00 00           	jae	0x1454aab4f <.text+0x54a9b4f>
1454a7643: 48 8d 0c 80                 	leaq	(%rax,%rax,4), %rcx
1454a7647: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454a764b: f3 0f 10 74 0f 44           	movss	0x44(%rdi,%rcx), %xmm6
1454a7651: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a7658: 0f 2e b1 0c 09 00 00        	ucomiss	0x90c(%rcx), %xmm6
1454a765f: 77 65                       	ja	0x1454a76c6 <.text+0x54a66c6>
1454a7661: c7 85 a0 00 00 00 00 00 00 00       	movl	$0x0, 0xa0(%rbp)
1454a766b: 48 89 f1                    	movq	%rsi, %rcx
1454a766e: 48 89 c2                    	movq	%rax, %rdx
1454a7671: 49 89 d8                    	movq	%rbx, %r8
1454a7674: e8 c7 a9 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a7679: 90                          	nop
1454a767a: f3 0f 10 86 0c 09 00 00     	movss	0x90c(%rsi), %xmm0
1454a7682: 48 83 f8 01                 	cmpq	$0x1, %rax
1454a7686: 75 1b                       	jne	0x1454a76a3 <.text+0x54a66a3>
1454a7688: 41 ff c5                    	incl	%r13d
1454a768b: f3 0f 5c c6                 	subss	%xmm6, %xmm0
1454a768f: f3 0f 11 86 0c 09 00 00     	movss	%xmm0, 0x90c(%rsi)
1454a7697: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454a769b: 0f 83 6f ff ff ff           	jae	0x1454a7610 <.text+0x54a6610>
1454a76a1: eb 23                       	jmp	0x1454a76c6 <.text+0x54a66c6>
1454a76a3: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a76a6: f3 0f 5d ce                 	minss	%xmm6, %xmm1
1454a76aa: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a76ad: f3 0f c2 d1 03              	cmpunordss	%xmm1, %xmm2
1454a76b2: 0f 28 da                    	movaps	%xmm2, %xmm3
1454a76b5: 0f 55 d9                    	andnps	%xmm1, %xmm3
1454a76b8: 0f 54 d0                    	andps	%xmm0, %xmm2
1454a76bb: 0f 56 d3                    	orps	%xmm3, %xmm2
1454a76be: f3 0f 11 96 0c 09 00 00     	movss	%xmm2, 0x90c(%rsi)
1454a76c6: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a76cd: 0f b7 81 30 02 00 00        	movzwl	0x230(%rcx), %eax
1454a76d4: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a76d7: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1454a76db: f3 0f 5e 05 49 3e 44 00     	divss	0x443e49(%rip), %xmm0   # 0x1458eb52c
1454a76e3: f3 0f 10 4d 68              	movss	0x68(%rbp), %xmm1
1454a76e8: 48 8b 91 d0 04 00 00        	movq	0x4d0(%rcx), %rdx
1454a76ef: 48 85 d2                    	testq	%rdx, %rdx
1454a76f2: 74 2f                       	je	0x1454a7723 <.text+0x54a6723>
1454a76f4: 48 8b 89 c8 04 00 00        	movq	0x4c8(%rcx), %rcx
1454a76fb: 48 69 c2 60 01 00 00        	imulq	$0x160, %rdx, %rax      # imm = 0x160
1454a7702: 48 01 c8                    	addq	%rcx, %rax
1454a7705: f3 44 0f 10 05 72 3d 44 00  	movss	0x443d72(%rip), %xmm8   # 0x1458eb480
1454a770e: f3 0f 10 15 2e 37 46 00     	movss	0x46372e(%rip), %xmm2   # 0x14590ae44
1454a7716: f3 0f 10 1d f2 3d 44 00     	movss	0x443df2(%rip), %xmm3   # 0x1458eb510
1454a771e: 49 89 c8                    	movq	%rcx, %r8
1454a7721: eb 19                       	jmp	0x1454a773c <.text+0x54a673c>
1454a7723: 31 c0                       	xorl	%eax, %eax
1454a7725: e9 e3 00 00 00              	jmp	0x1454a780d <.text+0x54a680d>
1454a772a: f3 44 0f 5d c4              	minss	%xmm4, %xmm8
1454a772f: 90                          	nop
1454a7730: 49 81 c0 60 01 00 00        	addq	$0x160, %r8             # imm = 0x160
1454a7737: 49 39 c0                    	cmpq	%rax, %r8
1454a773a: 74 21                       	je	0x1454a775d <.text+0x54a675d>
1454a773c: 41 80 78 68 00              	cmpb	$0x0, 0x68(%r8)
1454a7741: 75 ed                       	jne	0x1454a7730 <.text+0x54a6730>
1454a7743: 49 83 78 18 ff              	cmpq	$-0x1, 0x18(%r8)
1454a7748: 74 e6                       	je	0x1454a7730 <.text+0x54a6730>
1454a774a: 4d 8b 48 30                 	movq	0x30(%r8), %r9
1454a774e: 41 80 79 54 00              	cmpb	$0x0, 0x54(%r9)
1454a7753: 0f 28 e2                    	movaps	%xmm2, %xmm4
1454a7756: 75 d2                       	jne	0x1454a772a <.text+0x54a672a>
1454a7758: 0f 28 e3                    	movaps	%xmm3, %xmm4
1454a775b: eb cd                       	jmp	0x1454a772a <.text+0x54a672a>
1454a775d: 48 83 fa 01                 	cmpq	$0x1, %rdx
1454a7761: 75 07                       	jne	0x1454a776a <.text+0x54a676a>
1454a7763: 45 31 c0                    	xorl	%r8d, %r8d
1454a7766: 31 c0                       	xorl	%eax, %eax
1454a7768: eb 77                       	jmp	0x1454a77e1 <.text+0x54a67e1>
1454a776a: 49 89 d1                    	movq	%rdx, %r9
1454a776d: 49 83 e1 fe                 	andq	$-0x2, %r9
1454a7771: 4c 8d 91 f0 01 00 00        	leaq	0x1f0(%rcx), %r10
1454a7778: 45 31 c0                    	xorl	%r8d, %r8d
1454a777b: 31 c0                       	xorl	%eax, %eax
1454a777d: eb 1f                       	jmp	0x1454a779e <.text+0x54a679e>
1454a777f: 90                          	nop
1454a7780: 0f b6 76 4c                 	movzbl	0x4c(%rsi), %esi
1454a7784: 48 83 f6 01                 	xorq	$0x1, %rsi
1454a7788: 4c 01 d8                    	addq	%r11, %rax
1454a778b: 48 01 f0                    	addq	%rsi, %rax
1454a778e: 49 83 c0 02                 	addq	$0x2, %r8
1454a7792: 49 81 c2 c0 02 00 00        	addq	$0x2c0, %r10            # imm = 0x2C0
1454a7799: 4d 39 c1                    	cmpq	%r8, %r9
1454a779c: 74 3e                       	je	0x1454a77dc <.text+0x54a67dc>
1454a779e: 4d 8b 9a a0 fe ff ff        	movq	-0x160(%r10), %r11
1454a77a5: 4d 85 db                    	testq	%r11, %r11
1454a77a8: 0f 94 c3                    	sete	%bl
1454a77ab: 41 0a 9a 78 fe ff ff        	orb	-0x188(%r10), %bl
1454a77b2: 74 0c                       	je	0x1454a77c0 <.text+0x54a67c0>
1454a77b4: 45 31 db                    	xorl	%r11d, %r11d
1454a77b7: eb 10                       	jmp	0x1454a77c9 <.text+0x54a67c9>
1454a77b9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a77c0: 45 0f b6 5b 4c              	movzbl	0x4c(%r11), %r11d
1454a77c5: 49 83 f3 01                 	xorq	$0x1, %r11
1454a77c9: 49 8b 32                    	movq	(%r10), %rsi
1454a77cc: 48 85 f6                    	testq	%rsi, %rsi
1454a77cf: 0f 94 c3                    	sete	%bl
1454a77d2: 41 0a 5a d8                 	orb	-0x28(%r10), %bl
1454a77d6: 74 a8                       	je	0x1454a7780 <.text+0x54a6780>
1454a77d8: 31 f6                       	xorl	%esi, %esi
1454a77da: eb ac                       	jmp	0x1454a7788 <.text+0x54a6788>
1454a77dc: f6 c2 01                    	testb	$0x1, %dl
1454a77df: 74 2c                       	je	0x1454a780d <.text+0x54a680d>
1454a77e1: 4d 69 c0 60 01 00 00        	imulq	$0x160, %r8, %r8        # imm = 0x160
1454a77e8: 4a 8b 94 01 90 00 00 00     	movq	0x90(%rcx,%r8), %rdx
1454a77f0: 48 85 d2                    	testq	%rdx, %rdx
1454a77f3: 41 0f 94 c1                 	sete	%r9b
1454a77f7: 46 0a 4c 01 68              	orb	0x68(%rcx,%r8), %r9b
1454a77fc: 74 04                       	je	0x1454a7802 <.text+0x54a6802>
1454a77fe: 31 c9                       	xorl	%ecx, %ecx
1454a7800: eb 08                       	jmp	0x1454a780a <.text+0x54a680a>
1454a7802: 0f b6 4a 4c                 	movzbl	0x4c(%rdx), %ecx
1454a7806: 48 83 f1 01                 	xorq	$0x1, %rcx
1454a780a: 48 01 c8                    	addq	%rcx, %rax
1454a780d: f3 0f 59 0d 6b 97 27 01     	mulss	0x127976b(%rip), %xmm1  # 0x146720f80
1454a7815: f3 0f 58 0d db 3c 44 00     	addss	0x443cdb(%rip), %xmm1   # 0x1458eb4f8
1454a781d: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
1454a7821: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454a7826: f3 0f 10 15 9a 36 46 00     	movss	0x46369a(%rip), %xmm2   # 0x14590aec8
1454a782e: f3 0f 59 d0                 	mulss	%xmm0, %xmm2
1454a7832: 0f 28 d9                    	movaps	%xmm1, %xmm3
1454a7835: f3 0f 5d da                 	minss	%xmm2, %xmm3
1454a7839: 0f 28 d3                    	movaps	%xmm3, %xmm2
1454a783c: f3 0f c2 d3 03              	cmpunordss	%xmm3, %xmm2
1454a7841: 0f 54 ca                    	andps	%xmm2, %xmm1
1454a7844: 0f 55 d3                    	andnps	%xmm3, %xmm2
1454a7847: 0f 56 d1                    	orps	%xmm1, %xmm2
1454a784a: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a784f: 48 89 ca                    	movq	%rcx, %rdx
1454a7852: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a7856: f3 0f 10 3d 82 39 44 00     	movss	0x443982(%rip), %xmm7   # 0x1458eb1e0
1454a785e: 0f 28 ca                    	movaps	%xmm2, %xmm1
1454a7861: f3 0f 5c cf                 	subss	%xmm7, %xmm1
1454a7865: f3 4c 0f 2c e9              	cvttss2si	%xmm1, %r13
1454a786a: 49 21 d5                    	andq	%rdx, %r13
1454a786d: 49 09 cd                    	orq	%rcx, %r13
1454a7870: 31 db                       	xorl	%ebx, %ebx
1454a7872: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454a7875: 0f 2e d6                    	ucomiss	%xmm6, %xmm2
1454a7878: 4c 0f 42 eb                 	cmovbq	%rbx, %r13
1454a787c: f3 44 0f 10 05 5f 39 44 00  	movss	0x44395f(%rip), %xmm8   # 0x1458eb1e4
1454a7885: 41 0f 2e d0                 	ucomiss	%xmm8, %xmm2
1454a7889: 48 c7 c6 ff ff ff ff        	movq	$-0x1, %rsi
1454a7890: 4c 0f 47 ee                 	cmovaq	%rsi, %r13
1454a7894: 49 29 c5                    	subq	%rax, %r13
1454a7897: 4c 0f 42 eb                 	cmovbq	%rbx, %r13
1454a789b: e8 cd f5 2a 00              	callq	0x145756e6d <.text+0x5755e6d>
1454a78a0: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a78a3: f3 0f 5c cf                 	subss	%xmm7, %xmm1
1454a78a7: f3 48 0f 2c c1              	cvttss2si	%xmm1, %rax
1454a78ac: f3 48 0f 2c c8              	cvttss2si	%xmm0, %rcx
1454a78b1: 48 89 ca                    	movq	%rcx, %rdx
1454a78b4: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a78b8: 48 21 c2                    	andq	%rax, %rdx
1454a78bb: 48 09 ca                    	orq	%rcx, %rdx
1454a78be: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454a78c1: 48 0f 42 d3                 	cmovbq	%rbx, %rdx
1454a78c5: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454a78c9: 48 0f 47 d6                 	cmovaq	%rsi, %rdx
1454a78cd: 48 8d 04 52                 	leaq	(%rdx,%rdx,2), %rax
1454a78d1: 4c 39 e8                    	cmpq	%r13, %rax
1454a78d4: 4c 0f 42 e8                 	cmovbq	%rax, %r13
1454a78d8: 4d 85 ed                    	testq	%r13, %r13
1454a78db: 74 52                       	je	0x1454a792f <.text+0x54a692f>
1454a78dd: 45 31 ff                    	xorl	%r15d, %r15d
1454a78e0: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a78e7: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a78ee: 66 90                       	nop
1454a78f0: f3 0f 10 5d 68              	movss	0x68(%rbp), %xmm3
1454a78f5: 48 89 f1                    	movq	%rsi, %rcx
1454a78f8: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a78ff: 4d 89 f0                    	movq	%r14, %r8
1454a7902: e8 e9 75 01 00              	callq	0x1454beef0 <.text+0x54bdef0>
1454a7907: 90                          	nop
1454a7908: c7 85 a0 00 00 00 00 00 00 00       	movl	$0x0, 0xa0(%rbp)
1454a7912: 48 89 f1                    	movq	%rsi, %rcx
1454a7915: 48 89 c2                    	movq	%rax, %rdx
1454a7918: 49 89 d8                    	movq	%rbx, %r8
1454a791b: e8 20 a7 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a7920: 90                          	nop
1454a7921: 48 83 f8 01                 	cmpq	$0x1, %rax
1454a7925: 75 08                       	jne	0x1454a792f <.text+0x54a692f>
1454a7927: 49 ff c7                    	incq	%r15
1454a792a: 4d 39 ef                    	cmpq	%r13, %r15
1454a792d: 72 c1                       	jb	0x1454a78f0 <.text+0x54a68f0>
1454a792f: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a7936: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a793f: 41 0f 2e 85 24 09 00 00     	ucomiss	0x924(%r13), %xmm0
1454a7947: 0f 82 cb 02 00 00           	jb	0x1454a7c18 <.text+0x54a6c18>
1454a794d: 48 89 bd a0 00 00 00        	movq	%rdi, 0xa0(%rbp)
1454a7954: 48 8b 85 18 03 00 00        	movq	0x318(%rbp), %rax
1454a795b: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a7962: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a796d: 48 8d 45 68                 	leaq	0x68(%rbp), %rax
1454a7971: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a7978: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a797f: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a7986: e8 85 77 08 00              	callq	0x14552f110 <.text+0x552e110>
1454a798b: 90                          	nop
1454a798c: 4c 89 e8                    	movq	%r13, %rax
1454a798f: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a7996: 48 89 8d 18 03 00 00        	movq	%rcx, 0x318(%rbp)
1454a799d: 4c 8b 85 40 02 00 00        	movq	0x240(%rbp), %r8
1454a79a4: 49 83 f8 01                 	cmpq	$0x1, %r8
1454a79a8: 4d 89 c1                    	movq	%r8, %r9
1454a79ab: 49 83 d1 00                 	adcq	$0x0, %r9
1454a79af: 49 0f bd c9                 	bsrq	%r9, %rcx
1454a79b3: f7 d1                       	notl	%ecx
1454a79b5: 4d 89 ca                    	movq	%r9, %r10
1454a79b8: 49 d3 e2                    	shlq	%cl, %r10
1454a79bb: 49 ff ca                    	decq	%r10
1454a79be: 49 8b 9d 80 08 00 00        	movq	0x880(%r13), %rbx
1454a79c5: 49 8b 8d 88 08 00 00        	movq	0x888(%r13), %rcx
1454a79cc: 4d 8b ad 98 08 00 00        	movq	0x898(%r13), %r13
1454a79d3: 4c 8b 98 90 08 00 00        	movq	0x890(%rax), %r11
1454a79da: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a79e0: 4a 8d 04 2b                 	leaq	(%rbx,%r13), %rax
1454a79e4: 48 c1 c0 17                 	rolq	$0x17, %rax
1454a79e8: 48 01 d8                    	addq	%rbx, %rax
1454a79eb: 48 89 ce                    	movq	%rcx, %rsi
1454a79ee: 48 c1 e6 11                 	shlq	$0x11, %rsi
1454a79f2: 49 31 db                    	xorq	%rbx, %r11
1454a79f5: 49 31 cd                    	xorq	%rcx, %r13
1454a79f8: 4c 31 eb                    	xorq	%r13, %rbx
1454a79fb: 49 c1 c5 2d                 	rolq	$0x2d, %r13
1454a79ff: 4c 31 d9                    	xorq	%r11, %rcx
1454a7a02: 49 f7 e1                    	mulq	%r9
1454a7a05: 49 31 f3                    	xorq	%rsi, %r11
1454a7a08: 49 39 c2                    	cmpq	%rax, %r10
1454a7a0b: 72 d3                       	jb	0x1454a79e0 <.text+0x54a69e0>
1454a7a0d: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a7a14: 48 89 98 80 08 00 00        	movq	%rbx, 0x880(%rax)
1454a7a1b: 4c 89 a8 98 08 00 00        	movq	%r13, 0x898(%rax)
1454a7a22: 49 89 c5                    	movq	%rax, %r13
1454a7a25: 48 89 88 88 08 00 00        	movq	%rcx, 0x888(%rax)
1454a7a2c: 4c 89 98 90 08 00 00        	movq	%r11, 0x890(%rax)
1454a7a33: 49 83 f8 01                 	cmpq	$0x1, %r8
1454a7a37: 4c 89 c0                    	movq	%r8, %rax
1454a7a3a: 48 83 d0 ff                 	adcq	$-0x1, %rax
1454a7a3e: 48 39 d0                    	cmpq	%rdx, %rax
1454a7a41: 48 0f 43 c2                 	cmovaeq	%rdx, %rax
1454a7a45: 4c 39 c0                    	cmpq	%r8, %rax
1454a7a48: 0f 83 6c 01 00 00           	jae	0x1454a7bba <.text+0x54a6bba>
1454a7a4e: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a7a55: 48 8b 1c c1                 	movq	(%rcx,%rax,8), %rbx
1454a7a59: c7 85 a0 00 00 00 00 00 00 00       	movl	$0x0, 0xa0(%rbp)
1454a7a63: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454a7a6a: 4c 89 e9                    	movq	%r13, %rcx
1454a7a6d: 48 89 da                    	movq	%rbx, %rdx
1454a7a70: e8 cb a5 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a7a75: 90                          	nop
1454a7a76: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a7a7d: 48 39 d3                    	cmpq	%rdx, %rbx
1454a7a80: 0f 83 6e 34 00 00           	jae	0x1454aaef4 <.text+0x54a9ef4>
1454a7a86: 48 8d 34 9b                 	leaq	(%rbx,%rbx,4), %rsi
1454a7a8a: 48 c1 e6 04                 	shlq	$0x4, %rsi
1454a7a8e: 48 8d 04 37                 	leaq	(%rdi,%rsi), %rax
1454a7a92: 48 83 c0 20                 	addq	$0x20, %rax
1454a7a96: 48 89 85 d8 02 00 00        	movq	%rax, 0x2d8(%rbp)
1454a7a9d: 48 8d 05 9c 65 27 00        	leaq	0x27659c(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a7aa4: 48 89 85 e0 02 00 00        	movq	%rax, 0x2e0(%rbp)
1454a7aab: 48 8d 15 b4 6e 26 01        	leaq	0x1266eb4(%rip), %rdx   # 0x14670e966
1454a7ab2: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a7ab9: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1454a7ac0: e8 bb 44 26 00              	callq	0x14570bf80 <.text+0x570af80>
1454a7ac5: 90                          	nop
1454a7ac6: 48 01 f7                    	addq	%rsi, %rdi
1454a7ac9: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a7ad0: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1454a7ad7: 48 8b 5f 10                 	movq	0x10(%rdi), %rbx
1454a7adb: 48 8b 47 18                 	movq	0x18(%rdi), %rax
1454a7adf: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a7ae6: 48 89 8d 10 03 00 00        	movq	%rcx, 0x310(%rbp)
1454a7aed: e8 0e a9 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a7af2: 90                          	nop
1454a7af3: 48 89 c6                    	movq	%rax, %rsi
1454a7af6: 49 89 d7                    	movq	%rdx, %r15
1454a7af9: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a7b00: 48 85 d2                    	testq	%rdx, %rdx
1454a7b03: 74 13                       	je	0x1454a7b18 <.text+0x54a6b18>
1454a7b05: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a7b0b: 48 8b 8d 10 03 00 00        	movq	0x310(%rbp), %rcx
1454a7b12: e8 b9 a6 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a7b17: 90                          	nop
1454a7b18: 48 8d 3d f1 3c 50 01        	leaq	0x1503cf1(%rip), %rdi   # 0x1469ab810
1454a7b1f: ba 0e 00 00 00              	movl	$0xe, %edx
1454a7b24: 48 89 f9                    	movq	%rdi, %rcx
1454a7b27: e8 d4 a8 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a7b2c: 90                          	nop
1454a7b2d: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a7b34: 48 85 f6                    	testq	%rsi, %rsi
1454a7b37: 4c 0f 44 bd 48 03 00 00     	cmoveq	0x348(%rbp), %r15
1454a7b3f: 48 0f 45 de                 	cmovneq	%rsi, %rbx
1454a7b43: 48 85 c0                    	testq	%rax, %rax
1454a7b46: 48 0f 45 f8                 	cmovneq	%rax, %rdi
1454a7b4a: b8 0e 00 00 00              	movl	$0xe, %eax
1454a7b4f: 48 0f 44 d0                 	cmoveq	%rax, %rdx
1454a7b53: 48 89 54 24 20              	movq	%rdx, 0x20(%rsp)
1454a7b58: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a7b5f: 48 89 da                    	movq	%rbx, %rdx
1454a7b62: 4d 89 f8                    	movq	%r15, %r8
1454a7b65: 49 89 f9                    	movq	%rdi, %r9
1454a7b68: e8 d3 7a f9 ff              	callq	0x14543f640 <.text+0x543e640>
1454a7b6d: 90                          	nop
1454a7b6e: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a7b75: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a7b7c: 75 0d                       	jne	0x1454a7b8b <.text+0x54a6b8b>
1454a7b7e: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a7b85: e8 26 05 2b 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a7b8a: 90                          	nop
1454a7b8b: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a7b92: 48 89 f1                    	movq	%rsi, %rcx
1454a7b95: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a7b99: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a7ba0: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a7ba7: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a7bac: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a7bb0: 48 ff c6                    	incq	%rsi
1454a7bb3: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a7bba: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a7bc3: f3 0f 10 4d 68              	movss	0x68(%rbp), %xmm1
1454a7bc8: f3 0f 59 0d 54 fe 51 00     	mulss	0x51fe54(%rip), %xmm1   # 0x1459c7a24
1454a7bd0: f3 0f 58 0d 94 9b 56 00     	addss	0x569b94(%rip), %xmm1   # 0x145a1176c
1454a7bd8: f3 0f 5f 0d bc fd 51 00     	maxss	0x51fdbc(%rip), %xmm1   # 0x1459c799c
1454a7be0: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a7be4: f3 41 0f 11 8d 24 09 00 00  	movss	%xmm1, 0x924(%r13)
1454a7bed: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a7bf4: 48 85 d2                    	testq	%rdx, %rdx
1454a7bf7: 74 1f                       	je	0x1454a7c18 <.text+0x54a6c18>
1454a7bf9: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a7bfd: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a7c03: 48 8b 8d 18 03 00 00        	movq	0x318(%rbp), %rcx
1454a7c0a: e8 c1 a5 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a7c0f: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a7c18: 41 0f 2e 85 14 09 00 00     	ucomiss	0x914(%r13), %xmm0
1454a7c20: 0f 82 97 16 00 00           	jb	0x1454a92bd <.text+0x54a82bd>
1454a7c26: f3 0f 10 75 68              	movss	0x68(%rbp), %xmm6
1454a7c2b: 4d 85 f6                    	testq	%r14, %r14
1454a7c2e: 0f 84 64 16 00 00           	je	0x1454a9298 <.text+0x54a8298>
1454a7c34: 49 8d 85 5e 09 00 00        	leaq	0x95e(%r13), %rax
1454a7c3b: 48 c7 85 a8 00 00 00 00 00 00 00    	movq	$0x0, 0xa8(%rbp)
1454a7c46: 48 c7 85 b0 00 00 00 04 00 00 00    	movq	$0x4, 0xb0(%rbp)
1454a7c51: c7 85 b8 00 00 00 00 01 02 03       	movl	$0x3020100, 0xb8(%rbp) # imm = 0x3020100
1454a7c5b: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454a7c62: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a7c69: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a7c70: e8 1b 1d 08 00              	callq	0x145529990 <.text+0x5528990>
1454a7c75: 90                          	nop
1454a7c76: 4c 8b 8d e8 02 00 00        	movq	0x2e8(%rbp), %r9
1454a7c7d: 4d 85 c9                    	testq	%r9, %r9
1454a7c80: 0f 84 36 2d 00 00           	je	0x1454aa9bc <.text+0x54a99bc>
1454a7c86: 49 0f bd c9                 	bsrq	%r9, %rcx
1454a7c8a: f7 d1                       	notl	%ecx
1454a7c8c: 4d 89 c8                    	movq	%r9, %r8
1454a7c8f: 49 d3 e0                    	shlq	%cl, %r8
1454a7c92: 49 ff c8                    	decq	%r8
1454a7c95: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a7c9c: 4d 8b 9d 80 08 00 00        	movq	0x880(%r13), %r11
1454a7ca3: 49 8b 8d 88 08 00 00        	movq	0x888(%r13), %rcx
1454a7caa: 49 8b bd 98 08 00 00        	movq	0x898(%r13), %rdi
1454a7cb1: 4d 8b 95 90 08 00 00        	movq	0x890(%r13), %r10
1454a7cb8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454a7cc0: 49 8d 04 3b                 	leaq	(%r11,%rdi), %rax
1454a7cc4: 48 c1 c0 17                 	rolq	$0x17, %rax
1454a7cc8: 4c 01 d8                    	addq	%r11, %rax
1454a7ccb: 48 89 ce                    	movq	%rcx, %rsi
1454a7cce: 48 c1 e6 11                 	shlq	$0x11, %rsi
1454a7cd2: 4d 31 da                    	xorq	%r11, %r10
1454a7cd5: 48 31 cf                    	xorq	%rcx, %rdi
1454a7cd8: 49 31 fb                    	xorq	%rdi, %r11
1454a7cdb: 48 c1 c7 2d                 	rolq	$0x2d, %rdi
1454a7cdf: 4c 31 d1                    	xorq	%r10, %rcx
1454a7ce2: 49 f7 e1                    	mulq	%r9
1454a7ce5: 49 31 f2                    	xorq	%rsi, %r10
1454a7ce8: 49 39 c0                    	cmpq	%rax, %r8
1454a7ceb: 72 d3                       	jb	0x1454a7cc0 <.text+0x54a6cc0>
1454a7ced: 4d 89 9d 80 08 00 00        	movq	%r11, 0x880(%r13)
1454a7cf4: 49 89 bd 98 08 00 00        	movq	%rdi, 0x898(%r13)
1454a7cfb: 49 89 8d 88 08 00 00        	movq	%rcx, 0x888(%r13)
1454a7d02: 4d 89 95 90 08 00 00        	movq	%r10, 0x890(%r13)
1454a7d09: 49 39 d1                    	cmpq	%rdx, %r9
1454a7d0c: 0f 86 96 31 00 00           	jbe	0x1454aaea8 <.text+0x54a9ea8>
1454a7d12: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454a7d19: 48 89 85 98 02 00 00        	movq	%rax, 0x298(%rbp)
1454a7d20: 0f b6 3c 10                 	movzbl	(%rax,%rdx), %edi
1454a7d24: 41 88 bd 5e 09 00 00        	movb	%dil, 0x95e(%r13)
1454a7d2b: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
1454a7d32: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
1454a7d39: e8 e2 6a f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a7d3e: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1454a7d45: 45 0f b7 bd 30 02 00 00     	movzwl	0x230(%r13), %r15d
1454a7d4d: 4c 8b 85 58 03 00 00        	movq	0x358(%rbp), %r8
1454a7d54: 4b 8d 0c f0                 	leaq	(%r8,%r14,8), %rcx
1454a7d58: 4a 8b 54 20 78              	movq	0x78(%rax,%r12), %rdx
1454a7d5d: 4a 8b b4 20 80 00 00 00     	movq	0x80(%rax,%r12), %rsi
1454a7d65: 4c 89 85 a0 00 00 00        	movq	%r8, 0xa0(%rbp)
1454a7d6c: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454a7d73: 48 89 95 90 02 00 00        	movq	%rdx, 0x290(%rbp)
1454a7d7a: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
1454a7d81: 48 89 b5 b8 00 00 00        	movq	%rsi, 0xb8(%rbp)
1454a7d88: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a7d8f: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a7d96: e8 35 77 08 00              	callq	0x14552f4d0 <.text+0x552e4d0>
1454a7d9b: 90                          	nop
1454a7d9c: 4c 8b 8d 40 02 00 00        	movq	0x240(%rbp), %r9
1454a7da3: 4d 85 c9                    	testq	%r9, %r9
1454a7da6: 74 2e                       	je	0x1454a7dd6 <.text+0x54a6dd6>
1454a7da8: 89 bd 18 03 00 00           	movl	%edi, 0x318(%rbp)
1454a7dae: 48 89 b5 80 00 00 00        	movq	%rsi, 0x80(%rbp)
1454a7db5: 48 8b 85 30 02 00 00        	movq	0x230(%rbp), %rax
1454a7dbc: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
1454a7dc3: 48 8b 85 38 02 00 00        	movq	0x238(%rbp), %rax
1454a7dca: 48 89 85 28 03 00 00        	movq	%rax, 0x328(%rbp)
1454a7dd1: e9 aa 00 00 00              	jmp	0x1454a7e80 <.text+0x54a6e80>
1454a7dd6: 4a 8d 1c f5 00 00 00 00     	leaq	(,%r14,8), %rbx
1454a7dde: 4c 89 f0                    	movq	%r14, %rax
1454a7de1: 48 c1 e8 3d                 	shrq	$0x3d, %rax
1454a7de5: 0f 95 c0                    	setne	%al
1454a7de8: 48 b9 f8 ff ff ff ff ff ff 7f       	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454a7df2: 48 39 cb                    	cmpq	%rcx, %rbx
1454a7df5: 0f 97 c1                    	seta	%cl
1454a7df8: 08 c1                       	orb	%al, %cl
1454a7dfa: 74 13                       	je	0x1454a7e0f <.text+0x54a6e0f>
1454a7dfc: 31 ff                       	xorl	%edi, %edi
1454a7dfe: 48 89 f9                    	movq	%rdi, %rcx
1454a7e01: 48 89 da                    	movq	%rbx, %rdx
1454a7e04: e8 12 f4 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454a7e09: 90                          	nop
1454a7e0a: e9 49 31 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454a7e0f: 89 bd 18 03 00 00           	movl	%edi, 0x318(%rbp)
1454a7e15: 48 89 b5 80 00 00 00        	movq	%rsi, 0x80(%rbp)
1454a7e1c: e8 df a3 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a7e21: bf 08 00 00 00              	movl	$0x8, %edi
1454a7e26: ba 08 00 00 00              	movl	$0x8, %edx
1454a7e2b: 48 89 d9                    	movq	%rbx, %rcx
1454a7e2e: e8 8d a3 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a7e33: 48 85 c0                    	testq	%rax, %rax
1454a7e36: 74 c6                       	je	0x1454a7dfe <.text+0x54a6dfe>
1454a7e38: 48 89 c6                    	movq	%rax, %rsi
1454a7e3b: 48 89 c1                    	movq	%rax, %rcx
1454a7e3e: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a7e45: 49 89 d8                    	movq	%rbx, %r8
1454a7e48: e8 90 ef 2a 00              	callq	0x145756ddd <.text+0x5755ddd>
1454a7e4d: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a7e54: 48 85 d2                    	testq	%rdx, %rdx
1454a7e57: 48 89 b5 28 03 00 00        	movq	%rsi, 0x328(%rbp)
1454a7e5e: 74 16                       	je	0x1454a7e76 <.text+0x54a6e76>
1454a7e60: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a7e67: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a7e6b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a7e71: e8 5a a3 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a7e76: 4c 89 b5 28 02 00 00        	movq	%r14, 0x228(%rbp)
1454a7e7d: 4d 89 f1                    	movq	%r14, %r9
1454a7e80: f3 41 0f 2a ff              	cvtsi2ss	%r15d, %xmm7
1454a7e85: f3 0f 5e 3d 9f 36 44 00     	divss	0x44369f(%rip), %xmm7   # 0x1458eb52c
1454a7e8d: f3 0f 59 3d 8f 36 44 00     	mulss	0x44368f(%rip), %xmm7   # 0x1458eb524
1454a7e95: 49 0f bd c9                 	bsrq	%r9, %rcx
1454a7e99: f7 d1                       	notl	%ecx
1454a7e9b: 4d 89 c8                    	movq	%r9, %r8
1454a7e9e: 49 d3 e0                    	shlq	%cl, %r8
1454a7ea1: 49 ff c8                    	decq	%r8
1454a7ea4: 49 8b 9d 80 08 00 00        	movq	0x880(%r13), %rbx
1454a7eab: 4d 8b bd 88 08 00 00        	movq	0x888(%r13), %r15
1454a7eb2: 49 8b bd 98 08 00 00        	movq	0x898(%r13), %rdi
1454a7eb9: 4d 8b ad 90 08 00 00        	movq	0x890(%r13), %r13
1454a7ec0: 48 8d 04 3b                 	leaq	(%rbx,%rdi), %rax
1454a7ec4: 48 c1 c0 17                 	rolq	$0x17, %rax
1454a7ec8: 48 01 d8                    	addq	%rbx, %rax
1454a7ecb: 4c 89 f9                    	movq	%r15, %rcx
1454a7ece: 48 c1 e1 11                 	shlq	$0x11, %rcx
1454a7ed2: 49 31 dd                    	xorq	%rbx, %r13
1454a7ed5: 4c 31 ff                    	xorq	%r15, %rdi
1454a7ed8: 48 31 fb                    	xorq	%rdi, %rbx
1454a7edb: 48 c1 c7 2d                 	rolq	$0x2d, %rdi
1454a7edf: 4d 31 ef                    	xorq	%r13, %r15
1454a7ee2: 49 f7 e1                    	mulq	%r9
1454a7ee5: 49 31 cd                    	xorq	%rcx, %r13
1454a7ee8: 49 39 c0                    	cmpq	%rax, %r8
1454a7eeb: 72 d3                       	jb	0x1454a7ec0 <.text+0x54a6ec0>
1454a7eed: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a7ef4: 48 89 98 80 08 00 00        	movq	%rbx, 0x880(%rax)
1454a7efb: 48 89 b8 98 08 00 00        	movq	%rdi, 0x898(%rax)
1454a7f02: 4c 89 b8 88 08 00 00        	movq	%r15, 0x888(%rax)
1454a7f09: 4c 89 a8 90 08 00 00        	movq	%r13, 0x890(%rax)
1454a7f10: 49 39 d1                    	cmpq	%rdx, %r9
1454a7f13: 0f 86 c6 2f 00 00           	jbe	0x1454aaedf <.text+0x54a9edf>
1454a7f19: 48 8b 85 28 03 00 00        	movq	0x328(%rbp), %rax
1454a7f20: 48 8b 04 d0                 	movq	(%rax,%rdx,8), %rax
1454a7f24: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a7f2b: 8b 85 18 03 00 00           	movl	0x318(%rbp), %eax
1454a7f31: 48 8d 0d 38 4d 50 01        	leaq	0x1504d38(%rip), %rcx   # 0x1469acc70
1454a7f38: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1454a7f3c: 48 01 c8                    	addq	%rcx, %rax
1454a7f3f: ff e0                       	jmpq	*%rax
1454a7f41: f3 0f 59 35 e7 6c 49 00     	mulss	0x496ce7(%rip), %xmm6   # 0x14593ec30
1454a7f49: f3 0f 58 35 af 35 44 00     	addss	0x4435af(%rip), %xmm6   # 0x1458eb500
1454a7f51: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454a7f55: f3 48 0f 2c c6              	cvttss2si	%xmm6, %rax
1454a7f5a: 48 89 c1                    	movq	%rax, %rcx
1454a7f5d: 48 c1 f9 3f                 	sarq	$0x3f, %rcx
1454a7f61: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a7f64: f3 0f 5c 05 74 32 44 00     	subss	0x443274(%rip), %xmm0   # 0x1458eb1e0
1454a7f6c: f3 48 0f 2c d0              	cvttss2si	%xmm0, %rdx
1454a7f71: 48 21 ca                    	andq	%rcx, %rdx
1454a7f74: 48 09 c2                    	orq	%rax, %rdx
1454a7f77: 45 31 ed                    	xorl	%r13d, %r13d
1454a7f7a: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a7f7d: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454a7f80: 49 0f 42 d5                 	cmovbq	%r13, %rdx
1454a7f84: 0f 2e 35 59 32 44 00        	ucomiss	0x443259(%rip), %xmm6   # 0x1458eb1e4
1454a7f8b: 48 c7 c0 ff ff ff ff        	movq	$-0x1, %rax
1454a7f92: 48 0f 47 d0                 	cmovaq	%rax, %rdx
1454a7f96: 48 83 fa 01                 	cmpq	$0x1, %rdx
1454a7f9a: 48 83 d2 00                 	adcq	$0x0, %rdx
1454a7f9e: 0f 88 ab 04 00 00           	js	0x1454a844f <.text+0x54a744f>
1454a7fa4: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a7fa7: f3 48 0f 2a c2              	cvtsi2ss	%rdx, %xmm0
1454a7fac: e9 b8 04 00 00              	jmp	0x1454a8469 <.text+0x54a7469>
1454a7fb1: f3 0f 58 f6                 	addss	%xmm6, %xmm6
1454a7fb5: f3 0f 58 35 23 0e 45 00     	addss	0x450e23(%rip), %xmm6   # 0x1458f8de0
1454a7fbd: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454a7fc1: f3 48 0f 2c c6              	cvttss2si	%xmm6, %rax
1454a7fc6: 48 89 c1                    	movq	%rax, %rcx
1454a7fc9: 48 c1 f9 3f                 	sarq	$0x3f, %rcx
1454a7fcd: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a7fd0: f3 0f 5c 05 08 32 44 00     	subss	0x443208(%rip), %xmm0   # 0x1458eb1e0
1454a7fd8: f3 48 0f 2c d0              	cvttss2si	%xmm0, %rdx
1454a7fdd: 48 21 ca                    	andq	%rcx, %rdx
1454a7fe0: 48 09 c2                    	orq	%rax, %rdx
1454a7fe3: 31 c0                       	xorl	%eax, %eax
1454a7fe5: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a7fe8: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454a7feb: 48 0f 43 c2                 	cmovaeq	%rdx, %rax
1454a7fef: 0f 2e 35 ee 31 44 00        	ucomiss	0x4431ee(%rip), %xmm6   # 0x1458eb1e4
1454a7ff6: 48 c7 c6 ff ff ff ff        	movq	$-0x1, %rsi
1454a7ffd: 48 0f 46 f0                 	cmovbeq	%rax, %rsi
1454a8001: 48 83 fe 01                 	cmpq	$0x1, %rsi
1454a8005: 48 83 d6 00                 	adcq	$0x0, %rsi
1454a8009: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a8010: f2 0f 10 88 a8 08 00 00     	movsd	0x8a8(%rax), %xmm1
1454a8018: 0f 28 c1                    	movaps	%xmm1, %xmm0
1454a801b: 0f 59 c1                    	mulps	%xmm1, %xmm0
1454a801e: f3 0f 16 d0                 	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454a8022: f3 0f 58 d0                 	addss	%xmm0, %xmm2
1454a8026: 0f 2e 15 cb 34 44 00        	ucomiss	0x4434cb(%rip), %xmm2   # 0x1458eb4f8
1454a802d: 48 89 b5 18 03 00 00        	movq	%rsi, 0x318(%rbp)
1454a8034: 0f 86 dc 03 00 00           	jbe	0x1454a8416 <.text+0x54a7416>
1454a803a: f3 0f 16 c1                 	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454a803e: e8 f4 ed 2a 00              	callq	0x145756e37 <.text+0x5755e37>
1454a8043: f3 0f 11 85 58 03 00 00     	movss	%xmm0, 0x358(%rbp)
1454a804b: e9 e9 03 00 00              	jmp	0x1454a8439 <.text+0x54a7439>
1454a8050: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a8057: 48 8b 95 58 03 00 00        	movq	0x358(%rbp), %rdx
1454a805e: 4d 89 f0                    	movq	%r14, %r8
1454a8061: 0f 28 de                    	movaps	%xmm6, %xmm3
1454a8064: e8 87 6e 01 00              	callq	0x1454beef0 <.text+0x54bdef0>
1454a8069: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a8070: f3 0f 59 35 b0 e5 44 00     	mulss	0x44e5b0(%rip), %xmm6   # 0x1458f6628
1454a8078: f3 0f 58 35 64 0d 45 00     	addss	0x450d64(%rip), %xmm6   # 0x1458f8de4
1454a8080: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454a8084: f3 48 0f 2c c6              	cvttss2si	%xmm6, %rax
1454a8089: 48 89 c1                    	movq	%rax, %rcx
1454a808c: 48 c1 f9 3f                 	sarq	$0x3f, %rcx
1454a8090: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a8093: f3 0f 5c 05 45 31 44 00     	subss	0x443145(%rip), %xmm0   # 0x1458eb1e0
1454a809b: f3 48 0f 2c d0              	cvttss2si	%xmm0, %rdx
1454a80a0: 48 21 ca                    	andq	%rcx, %rdx
1454a80a3: 48 09 c2                    	orq	%rax, %rdx
1454a80a6: 31 c0                       	xorl	%eax, %eax
1454a80a8: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a80ab: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454a80ae: 48 0f 43 c2                 	cmovaeq	%rdx, %rax
1454a80b2: 0f 2e 35 2b 31 44 00        	ucomiss	0x44312b(%rip), %xmm6   # 0x1458eb1e4
1454a80b9: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
1454a80c0: 48 0f 46 c8                 	cmovbeq	%rax, %rcx
1454a80c4: 48 83 f9 03                 	cmpq	$0x3, %rcx
1454a80c8: bf 02 00 00 00              	movl	$0x2, %edi
1454a80cd: 48 0f 43 f9                 	cmovaeq	%rcx, %rdi
1454a80d1: f3 0f 10 15 3b 4f 44 00     	movss	0x444f3b(%rip), %xmm2   # 0x1458ed014
1454a80d9: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a80dc: 48 8b 4d 60                 	movq	0x60(%rbp), %rcx
1454a80e0: e8 db 16 05 00              	callq	0x1454f97c0 <.text+0x54f87c0>
1454a80e5: 90                          	nop
1454a80e6: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a80ed: f3 45 0f 10 85 e8 03 00 00  	movss	0x3e8(%r13), %xmm8
1454a80f6: f3 45 0f 10 8d ec 03 00 00  	movss	0x3ec(%r13), %xmm9
1454a80ff: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8102: e8 2a ed 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8107: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a810a: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a810d: e8 19 ed 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a8112: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8115: f3 44 0f 10 15 c2 f6 51 00  	movss	0x51f6c2(%rip), %xmm10  # 0x1459c77e0
1454a811e: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a8125: f3 44 0f 10 1d ba 4b 45 00  	movss	0x454bba(%rip), %xmm11  # 0x1458fcce8
1454a812e: f3 44 0f 10 25 ad 4c 45 00  	movss	0x454cad(%rip), %xmm12  # 0x1458fcde4
1454a8137: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a8140: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454a8143: f3 41 0f 59 d2              	mulss	%xmm10, %xmm2
1454a8148: f3 41 0f 58 d0              	addss	%xmm8, %xmm2
1454a814d: 0f 28 df                    	movaps	%xmm7, %xmm3
1454a8150: f3 41 0f 59 da              	mulss	%xmm10, %xmm3
1454a8155: f3 41 0f 58 d9              	addss	%xmm9, %xmm3
1454a815a: 48 89 d9                    	movq	%rbx, %rcx
1454a815d: 4c 89 ea                    	movq	%r13, %rdx
1454a8160: e8 0b 9a 02 00              	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8165: 90                          	nop
1454a8166: 80 bd a0 00 00 00 00        	cmpb	$0x0, 0xa0(%rbp)
1454a816d: 0f 85 3f 01 00 00           	jne	0x1454a82b2 <.text+0x54a72b2>
1454a8173: f3 45 0f 58 d3              	addss	%xmm11, %xmm10
1454a8178: 45 0f 2e d4                 	ucomiss	%xmm12, %xmm10
1454a817c: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a8183: 73 bb                       	jae	0x1454a8140 <.text+0x54a7140>
1454a8185: e9 c0 10 00 00              	jmp	0x1454a924a <.text+0x54a824a>
1454a818a: 4c 8b b5 28 03 00 00        	movq	0x328(%rbp), %r14
1454a8191: 49 83 f9 01                 	cmpq	$0x1, %r9
1454a8195: 0f 85 fe 06 00 00           	jne	0x1454a8899 <.text+0x54a7899>
1454a819b: f3 0f 58 f6                 	addss	%xmm6, %xmm6
1454a819f: f3 0f 58 35 39 0c 45 00     	addss	0x450c39(%rip), %xmm6   # 0x1458f8de0
1454a81a7: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454a81ab: f3 48 0f 2c c6              	cvttss2si	%xmm6, %rax
1454a81b0: 48 89 c1                    	movq	%rax, %rcx
1454a81b3: 48 c1 f9 3f                 	sarq	$0x3f, %rcx
1454a81b7: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a81ba: f3 0f 5c 05 1e 30 44 00     	subss	0x44301e(%rip), %xmm0   # 0x1458eb1e0
1454a81c2: f3 4c 0f 2c c0              	cvttss2si	%xmm0, %r8
1454a81c7: 49 21 c8                    	andq	%rcx, %r8
1454a81ca: 49 09 c0                    	orq	%rax, %r8
1454a81cd: 31 c0                       	xorl	%eax, %eax
1454a81cf: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a81d2: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454a81d5: 49 0f 43 c0                 	cmovaeq	%r8, %rax
1454a81d9: 0f 2e 35 04 30 44 00        	ucomiss	0x443004(%rip), %xmm6   # 0x1458eb1e4
1454a81e0: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
1454a81e7: 48 0f 46 c8                 	cmovbeq	%rax, %rcx
1454a81eb: 49 8b 06                    	movq	(%r14), %rax
1454a81ee: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454a81f5: 48 83 f9 01                 	cmpq	$0x1, %rcx
1454a81f9: 48 83 d1 00                 	adcq	$0x0, %rcx
1454a81fd: 49 89 ce                    	movq	%rcx, %r14
1454a8200: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a8207: f2 0f 10 8e a8 08 00 00     	movsd	0x8a8(%rsi), %xmm1
1454a820f: 0f 28 c1                    	movaps	%xmm1, %xmm0
1454a8212: 0f 59 c1                    	mulps	%xmm1, %xmm0
1454a8215: f3 0f 16 d0                 	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454a8219: f3 0f 58 d0                 	addss	%xmm0, %xmm2
1454a821d: 0f 2e 15 d4 32 44 00        	ucomiss	0x4432d4(%rip), %xmm2   # 0x1458eb4f8
1454a8224: 0f 86 69 0b 00 00           	jbe	0x1454a8d93 <.text+0x54a7d93>
1454a822a: f3 0f 16 c1                 	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454a822e: e8 04 ec 2a 00              	callq	0x145756e37 <.text+0x5755e37>
1454a8233: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8236: 4c 89 f8                    	movq	%r15, %rax
1454a8239: 48 c1 e0 11                 	shlq	$0x11, %rax
1454a823d: 49 31 dd                    	xorq	%rbx, %r13
1454a8240: 4c 89 e9                    	movq	%r13, %rcx
1454a8243: 4c 31 f9                    	xorq	%r15, %rcx
1454a8246: 49 31 ff                    	xorq	%rdi, %r15
1454a8249: 48 89 8e 88 08 00 00        	movq	%rcx, 0x888(%rsi)
1454a8250: 4c 89 f9                    	movq	%r15, %rcx
1454a8253: 48 31 d9                    	xorq	%rbx, %rcx
1454a8256: 48 89 8e 80 08 00 00        	movq	%rcx, 0x880(%rsi)
1454a825d: 49 31 c5                    	xorq	%rax, %r13
1454a8260: 4c 89 ae 90 08 00 00        	movq	%r13, 0x890(%rsi)
1454a8267: 49 c1 c7 2d                 	rolq	$0x2d, %r15
1454a826b: 4c 89 be 98 08 00 00        	movq	%r15, 0x898(%rsi)
1454a8272: f3 0f 10 0d 76 20 71 00     	movss	0x712076(%rip), %xmm1   # 0x145bba2f0
1454a827a: f3 0f 10 15 7a 2c 46 00     	movss	0x462c7a(%rip), %xmm2   # 0x14590aefc
1454a8282: 48 8b 4d 60                 	movq	0x60(%rbp), %rcx
1454a8286: e8 35 15 05 00              	callq	0x1454f97c0 <.text+0x54f87c0>
1454a828b: 90                          	nop
1454a828c: 4d 89 f7                    	movq	%r14, %r15
1454a828f: 48 01 df                    	addq	%rbx, %rdi
1454a8292: 48 c1 c7 17                 	rolq	$0x17, %rdi
1454a8296: 48 01 df                    	addq	%rbx, %rdi
1454a8299: 48 c1 ef 3f                 	shrq	$0x3f, %rdi
1454a829d: 48 8d 05 6c 21 50 01        	leaq	0x150216c(%rip), %rax   # 0x1469aa410
1454a82a4: f3 0f 58 3c b8              	addss	(%rax,%rdi,4), %xmm7
1454a82a9: f3 0f 58 f8                 	addss	%xmm0, %xmm7
1454a82ad: e9 fc 0a 00 00              	jmp	0x1454a8dae <.text+0x54a7dae>
1454a82b2: f2 44 0f 10 8d a4 00 00 00  	movsd	0xa4(%rbp), %xmm9
1454a82bb: f3 45 0f 16 d1              	movshdup	%xmm9, %xmm10           # xmm10 = xmm9[1,1,3,3]
1454a82c0: 44 8b b5 ac 00 00 00        	movl	0xac(%rbp), %r14d
1454a82c7: 45 31 ff                    	xorl	%r15d, %r15d
1454a82ca: f3 44 0f 10 1d 15 4b 45 00  	movss	0x454b15(%rip), %xmm11  # 0x1458fcde8
1454a82d3: f3 44 0f 10 25 a4 8c 27 01  	movss	0x1278ca4(%rip), %xmm12 # 0x146720f80
1454a82dc: f3 44 0f 10 2d 9b 31 44 00  	movss	0x44319b(%rip), %xmm13  # 0x1458eb480
1454a82e5: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a82ec: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a82f3: 49 39 ff                    	cmpq	%rdi, %r15
1454a82f6: 0f 83 fb 00 00 00           	jae	0x1454a83f7 <.text+0x54a73f7>
1454a82fc: 0f 1f 40 00                 	nopl	(%rax)
1454a8300: 4d 85 ff                    	testq	%r15, %r15
1454a8303: 78 0a                       	js	0x1454a830f <.text+0x54a730f>
1454a8305: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454a8308: f3 49 0f 2a f7              	cvtsi2ss	%r15, %xmm6
1454a830d: eb 1b                       	jmp	0x1454a832a <.text+0x54a732a>
1454a830f: 4c 89 f8                    	movq	%r15, %rax
1454a8312: 48 d1 e8                    	shrq	%rax
1454a8315: 44 89 f9                    	movl	%r15d, %ecx
1454a8318: 83 e1 01                    	andl	$0x1, %ecx
1454a831b: 48 09 c1                    	orq	%rax, %rcx
1454a831e: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454a8321: f3 48 0f 2a f1              	cvtsi2ss	%rcx, %xmm6
1454a8326: f3 0f 58 f6                 	addss	%xmm6, %xmm6
1454a832a: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454a832d: f3 0f 51 fe                 	sqrtss	%xmm6, %xmm7
1454a8331: f3 41 0f 59 f3              	mulss	%xmm11, %xmm6
1454a8336: f3 41 0f 59 fc              	mulss	%xmm12, %xmm7
1454a833b: f3 41 0f 58 fd              	addss	%xmm13, %xmm7
1454a8340: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a8343: e8 e9 ea 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8348: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454a834c: f3 44 0f 59 c7              	mulss	%xmm7, %xmm8
1454a8351: f3 45 0f 58 c1              	addss	%xmm9, %xmm8
1454a8356: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a8359: e8 cd ea 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a835e: f3 0f 59 f8                 	mulss	%xmm0, %xmm7
1454a8362: f3 41 0f 58 fa              	addss	%xmm10, %xmm7
1454a8367: 48 89 d9                    	movq	%rbx, %rcx
1454a836a: 48 89 f2                    	movq	%rsi, %rdx
1454a836d: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a8371: 0f 28 df                    	movaps	%xmm7, %xmm3
1454a8374: e8 f7 97 02 00              	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8379: 90                          	nop
1454a837a: 8b 8d a0 00 00 00           	movl	0xa0(%rbp), %ecx
1454a8380: 44 89 f0                    	movl	%r14d, %eax
1454a8383: 85 c9                       	testl	%ecx, %ecx
1454a8385: 74 06                       	je	0x1454a838d <.text+0x54a738d>
1454a8387: 8b 85 ac 00 00 00           	movl	0xac(%rbp), %eax
1454a838d: f3 0f 7e 85 a4 00 00 00     	movq	0xa4(%rbp), %xmm0
1454a8395: 66 0f 6e c9                 	movd	%ecx, %xmm1
1454a8399: 66 0f 70 c9 00              	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454a839e: 66 0f 72 f1 1f              	pslld	$0x1f, %xmm1
1454a83a3: 66 0f 72 e1 1f              	psrad	$0x1f, %xmm1
1454a83a8: 66 0f db c1                 	pand	%xmm1, %xmm0
1454a83ac: 66 41 0f df c9              	pandn	%xmm9, %xmm1
1454a83b1: 66 0f eb c8                 	por	%xmm0, %xmm1
1454a83b5: 66 0f d6 8d a4 00 00 00     	movq	%xmm1, 0xa4(%rbp)
1454a83bd: 89 85 ac 00 00 00           	movl	%eax, 0xac(%rbp)
1454a83c3: c7 85 a0 00 00 00 01 00 00 00       	movl	$0x1, 0xa0(%rbp)
1454a83cd: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a83d4: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a83db: 49 89 d8                    	movq	%rbx, %r8
1454a83de: e8 5d 9c 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a83e3: 90                          	nop
1454a83e4: 49 ff c7                    	incq	%r15
1454a83e7: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a83ee: 49 39 ff                    	cmpq	%rdi, %r15
1454a83f1: 0f 82 09 ff ff ff           	jb	0x1454a8300 <.text+0x54a7300>
1454a83f7: 48 8d 3d 06 33 50 01        	leaq	0x1503306(%rip), %rdi   # 0x1469ab704
1454a83fe: be 11 00 00 00              	movl	$0x11, %esi
1454a8403: ba 11 00 00 00              	movl	$0x11, %edx
1454a8408: 48 89 f9                    	movq	%rdi, %rcx
1454a840b: e8 f0 9f fa ff              	callq	0x145452400 <.text+0x5451400>
1454a8410: 90                          	nop
1454a8411: e9 f4 0c 00 00              	jmp	0x1454a910a <.text+0x54a810a>
1454a8416: f3 0f 10 15 f6 4b 44 00     	movss	0x444bf6(%rip), %xmm2   # 0x1458ed014
1454a841e: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a8421: 48 8b 4d 60                 	movq	0x60(%rbp), %rcx
1454a8425: e8 96 13 05 00              	callq	0x1454f97c0 <.text+0x54f87c0>
1454a842a: f3 0f 11 85 58 03 00 00     	movss	%xmm0, 0x358(%rbp)
1454a8432: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a8439: 48 85 f6                    	testq	%rsi, %rsi
1454a843c: 0f 88 e6 04 00 00           	js	0x1454a8928 <.text+0x54a7928>
1454a8442: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8445: f3 48 0f 2a c6              	cvtsi2ss	%rsi, %xmm0
1454a844a: e9 f3 04 00 00              	jmp	0x1454a8942 <.text+0x54a7942>
1454a844f: 48 89 d0                    	movq	%rdx, %rax
1454a8452: 48 d1 e8                    	shrq	%rax
1454a8455: 89 d1                       	movl	%edx, %ecx
1454a8457: 83 e1 01                    	andl	$0x1, %ecx
1454a845a: 48 09 c1                    	orq	%rax, %rcx
1454a845d: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8460: f3 48 0f 2a c1              	cvtsi2ss	%rcx, %xmm0
1454a8465: f3 0f 58 c0                 	addss	%xmm0, %xmm0
1454a8469: f3 0f 11 85 58 03 00 00     	movss	%xmm0, 0x358(%rbp)
1454a8471: 4c 8d 3d 90 1f 50 01        	leaq	0x1501f90(%rip), %r15   # 0x1469aa408
1454a8478: 31 ff                       	xorl	%edi, %edi
1454a847a: 48 89 95 18 03 00 00        	movq	%rdx, 0x318(%rbp)
1454a8481: eb 45                       	jmp	0x1454a84c8 <.text+0x54a74c8>
1454a8483: 44 0f 13 85 a4 00 00 00     	movlps	%xmm8, 0xa4(%rbp)
1454a848b: f3 0f 11 85 ac 00 00 00     	movss	%xmm0, 0xac(%rbp)
1454a8493: c7 85 a0 00 00 00 01 00 00 00       	movl	$0x1, 0xa0(%rbp)
1454a849d: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a84a4: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a84ab: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454a84b2: e8 89 9b 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a84b7: 90                          	nop
1454a84b8: f3 44 0f 10 25 5f 60 49 00  	movss	0x49605f(%rip), %xmm12  # 0x14593e520
1454a84c1: 48 8b 95 18 03 00 00        	movq	0x318(%rbp), %rdx
1454a84c8: 49 39 d5                    	cmpq	%rdx, %r13
1454a84cb: 0f 83 a9 03 00 00           	jae	0x1454a887a <.text+0x54a787a>
1454a84d1: 4d 85 ed                    	testq	%r13, %r13
1454a84d4: 78 1a                       	js	0x1454a84f0 <.text+0x54a74f0>
1454a84d6: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454a84da: f3 4d 0f 2a c5              	cvtsi2ss	%r13, %xmm8
1454a84df: eb 2c                       	jmp	0x1454a850d <.text+0x54a750d>
1454a84e1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454a84f0: 4c 89 e8                    	movq	%r13, %rax
1454a84f3: 48 d1 e8                    	shrq	%rax
1454a84f6: 44 89 e9                    	movl	%r13d, %ecx
1454a84f9: 83 e1 01                    	andl	$0x1, %ecx
1454a84fc: 48 09 c1                    	orq	%rax, %rcx
1454a84ff: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454a8503: f3 4c 0f 2a c1              	cvtsi2ss	%rcx, %xmm8
1454a8508: f3 45 0f 58 c0              	addss	%xmm8, %xmm8
1454a850d: f3 44 0f 5e 85 58 03 00 00  	divss	0x358(%rbp), %xmm8
1454a8516: 49 ff c5                    	incq	%r13
1454a8519: f3 44 0f 59 05 f2 4a 44 00  	mulss	0x444af2(%rip), %xmm8   # 0x1458ed014
1454a8522: 48 8b 85 a0 02 00 00        	movq	0x2a0(%rbp), %rax
1454a8529: f2 0f 10 38                 	movsd	(%rax), %xmm7
1454a852d: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8531: e8 fb e8 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8536: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a8539: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a853d: e8 e9 e8 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a8542: 0f 14 f0                    	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454a8545: eb 2a                       	jmp	0x1454a8571 <.text+0x54a7571>
1454a8547: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a8550: c7 85 a0 00 00 00 00 00 00 00       	movl	$0x0, 0xa0(%rbp)
1454a855a: f3 44 0f 58 25 85 47 45 00  	addss	0x454785(%rip), %xmm12  # 0x1458fcce8
1454a8563: 44 0f 2e 25 95 08 45 00     	ucomiss	0x450895(%rip), %xmm12  # 0x1458f8e00
1454a856b: 0f 82 47 ff ff ff           	jb	0x1454a84b8 <.text+0x54a74b8>
1454a8571: f3 45 0f 12 c4              	movsldup	%xmm12, %xmm8           # xmm8 = xmm12[0,0,2,2]
1454a8576: 44 0f 59 c6                 	mulps	%xmm6, %xmm8
1454a857a: 44 0f 58 c7                 	addps	%xmm7, %xmm8
1454a857e: f3 45 0f 16 c8              	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454a8583: 48 8b 9d 68 03 00 00        	movq	0x368(%rbp), %rbx
1454a858a: 48 8b 8b 10 02 00 00        	movq	0x210(%rbx), %rcx
1454a8591: 48 8b 93 18 02 00 00        	movq	0x218(%rbx), %rdx
1454a8598: e8 83 62 f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a859d: 48 69 f0 f0 00 00 00        	imulq	$0xf0, %rax, %rsi
1454a85a4: f3 44 0f 10 b3 e8 03 00 00  	movss	0x3e8(%rbx), %xmm14
1454a85ad: f3 44 0f 10 ab ec 03 00 00  	movss	0x3ec(%rbx), %xmm13
1454a85b6: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a85ba: f3 42 0f 5c 84 26 c8 00 00 00       	subss	0xc8(%rsi,%r12), %xmm0
1454a85c4: f3 44 0f 10 9b f0 03 00 00  	movss	0x3f0(%rbx), %xmm11
1454a85cd: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
1454a85d1: f3 42 0f 5c 8c 26 cc 00 00 00       	subss	0xcc(%rsi,%r12), %xmm1
1454a85db: e8 87 e8 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a85e0: 44 0f 28 d0                 	movaps	%xmm0, %xmm10
1454a85e4: f3 46 0f 10 bc 26 d8 00 00 00       	movss	0xd8(%rsi,%r12), %xmm15
1454a85ee: 41 0f 28 c7                 	movaps	%xmm15, %xmm0
1454a85f2: f3 0f 58 05 96 09 45 00     	addss	0x450996(%rip), %xmm0   # 0x1458f8f90
1454a85fa: 44 0f 2e d0                 	ucomiss	%xmm0, %xmm10
1454a85fe: 0f 87 4c ff ff ff           	ja	0x1454a8550 <.text+0x54a7550>
1454a8604: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a860b: 48 8b 98 78 08 00 00        	movq	0x878(%rax), %rbx
1454a8612: 48 8d 4b 10                 	leaq	0x10(%rbx), %rcx
1454a8616: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a861a: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a861e: e8 cd a1 fb ff              	callq	0x1454627f0 <.text+0x54617f0>
1454a8623: 90                          	nop
1454a8624: a8 01                       	testb	$0x1, %al
1454a8626: 0f 84 24 ff ff ff           	je	0x1454a8550 <.text+0x54a7550>
1454a862c: 31 c0                       	xorl	%eax, %eax
1454a862e: 45 0f 2e d7                 	ucomiss	%xmm15, %xmm10
1454a8632: 0f 97 c0                    	seta	%al
1454a8635: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a8638: f3 41 0f 5c cb              	subss	%xmm11, %xmm1
1454a863d: 0f 54 0d ec 28 46 00        	andps	0x4628ec(%rip), %xmm1   # 0x14590af30
1454a8644: 41 0f 2e 0c 87              	ucomiss	(%r15,%rax,4), %xmm1
1454a8649: 0f 87 01 ff ff ff           	ja	0x1454a8550 <.text+0x54a7550>
1454a864f: 48 83 7b 40 ff              	cmpq	$-0x1, 0x40(%rbx)
1454a8654: 0f 84 29 fe ff ff           	je	0x1454a8483 <.text+0x54a7483>
1454a865a: f2 0f 10 53 60              	movsd	0x60(%rbx), %xmm2
1454a865f: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a8663: 0f 5c ca                    	subps	%xmm2, %xmm1
1454a8666: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a8669: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a866c: 0f c2 d3 01                 	cmpltps	%xmm3, %xmm2
1454a8670: 0f 14 d2                    	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454a8673: 66 0f 50 c2                 	movmskpd	%xmm2, %eax
1454a8677: 85 c0                       	testl	%eax, %eax
1454a8679: 0f 85 af 00 00 00           	jne	0x1454a872e <.text+0x54a772e>
1454a867f: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a8682: f3 0f 10 1d 56 2b 44 00     	movss	0x442b56(%rip), %xmm3   # 0x1458eb1e0
1454a868a: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a868e: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a8693: f3 48 0f 2c d1              	cvttss2si	%xmm1, %rdx
1454a8698: 48 89 d0                    	movq	%rdx, %rax
1454a869b: 48 c1 f8 3f                 	sarq	$0x3f, %rax
1454a869f: 48 21 c8                    	andq	%rcx, %rax
1454a86a2: 48 09 d0                    	orq	%rdx, %rax
1454a86a5: 0f 57 ed                    	xorps	%xmm5, %xmm5
1454a86a8: 0f 2e cd                    	ucomiss	%xmm5, %xmm1
1454a86ab: 48 0f 42 c7                 	cmovbq	%rdi, %rax
1454a86af: f3 0f 10 25 2d 2b 44 00     	movss	0x442b2d(%rip), %xmm4   # 0x1458eb1e4
1454a86b7: 0f 2e cc                    	ucomiss	%xmm4, %xmm1
1454a86ba: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
1454a86c1: 49 0f 47 c1                 	cmovaq	%r9, %rax
1454a86c5: f3 0f 16 c9                 	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454a86c9: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a86cc: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a86d0: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a86d5: f3 4c 0f 2c c1              	cvttss2si	%xmm1, %r8
1454a86da: 4c 89 c2                    	movq	%r8, %rdx
1454a86dd: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a86e1: 48 21 ca                    	andq	%rcx, %rdx
1454a86e4: 4c 09 c2                    	orq	%r8, %rdx
1454a86e7: 0f 2e cd                    	ucomiss	%xmm5, %xmm1
1454a86ea: 48 0f 42 d7                 	cmovbq	%rdi, %rdx
1454a86ee: 0f 2e cc                    	ucomiss	%xmm4, %xmm1
1454a86f1: 49 0f 47 d1                 	cmovaq	%r9, %rdx
1454a86f5: 48 8b 4b 58                 	movq	0x58(%rbx), %rcx
1454a86f9: 48 39 c8                    	cmpq	%rcx, %rax
1454a86fc: 41 0f 93 c0                 	setae	%r8b
1454a8700: 48 39 ca                    	cmpq	%rcx, %rdx
1454a8703: 41 0f 93 c1                 	setae	%r9b
1454a8707: 45 08 c1                    	orb	%r8b, %r9b
1454a870a: 75 22                       	jne	0x1454a872e <.text+0x54a772e>
1454a870c: 48 0f af ca                 	imulq	%rdx, %rcx
1454a8710: 48 01 c1                    	addq	%rax, %rcx
1454a8713: 48 8b 53 50                 	movq	0x50(%rbx), %rdx
1454a8717: 48 39 d1                    	cmpq	%rdx, %rcx
1454a871a: 0f 83 6b 26 00 00           	jae	0x1454aad8b <.text+0x54a9d8b>
1454a8720: 48 8b 43 48                 	movq	0x48(%rbx), %rax
1454a8724: 80 3c 08 00                 	cmpb	$0x0, (%rax,%rcx)
1454a8728: 0f 85 22 fe ff ff           	jne	0x1454a8550 <.text+0x54a7550>
1454a872e: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a8735: 4c 8b b0 a0 08 00 00        	movq	0x8a0(%rax), %r14
1454a873c: 4d 85 f6                    	testq	%r14, %r14
1454a873f: 0f 84 3e fd ff ff           	je	0x1454a8483 <.text+0x54a7483>
1454a8745: 49 81 7e 30 91 01 00 00     	cmpq	$0x191, 0x30(%r14)      # imm = 0x191
1454a874d: 0f 82 30 fd ff ff           	jb	0x1454a8483 <.text+0x54a7483>
1454a8753: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a8757: f3 41 0f 5c d6              	subss	%xmm14, %xmm2
1454a875c: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
1454a8760: f3 41 0f 5c cd              	subss	%xmm13, %xmm1
1454a8765: 44 0f 28 d0                 	movaps	%xmm0, %xmm10
1454a8769: 0f 28 c2                    	movaps	%xmm2, %xmm0
1454a876c: e8 f6 e6 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a8771: f3 0f 10 5b 60              	movss	0x60(%rbx), %xmm3
1454a8776: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a877a: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a877e: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a8781: 0f 2e da                    	ucomiss	%xmm2, %xmm3
1454a8784: 0f 87 c6 fd ff ff           	ja	0x1454a8550 <.text+0x54a7550>
1454a878a: f3 44 0f 5c 4b 64           	subss	0x64(%rbx), %xmm9
1454a8790: 41 0f 2e d9                 	ucomiss	%xmm9, %xmm3
1454a8794: 0f 87 b6 fd ff ff           	ja	0x1454a8550 <.text+0x54a7550>
1454a879a: 0f 28 da                    	movaps	%xmm2, %xmm3
1454a879d: f3 0f 10 25 3b 2a 44 00     	movss	0x442a3b(%rip), %xmm4   # 0x1458eb1e0
1454a87a5: f3 0f 5c dc                 	subss	%xmm4, %xmm3
1454a87a9: f3 48 0f 2c cb              	cvttss2si	%xmm3, %rcx
1454a87ae: f3 48 0f 2c d2              	cvttss2si	%xmm2, %rdx
1454a87b3: 48 89 d0                    	movq	%rdx, %rax
1454a87b6: 48 c1 f8 3f                 	sarq	$0x3f, %rax
1454a87ba: 48 21 c8                    	andq	%rcx, %rax
1454a87bd: 48 09 d0                    	orq	%rdx, %rax
1454a87c0: 0f 57 ed                    	xorps	%xmm5, %xmm5
1454a87c3: 0f 2e d5                    	ucomiss	%xmm5, %xmm2
1454a87c6: 48 0f 42 c7                 	cmovbq	%rdi, %rax
1454a87ca: f3 0f 10 1d 12 2a 44 00     	movss	0x442a12(%rip), %xmm3   # 0x1458eb1e4
1454a87d2: 0f 2e d3                    	ucomiss	%xmm3, %xmm2
1454a87d5: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
1454a87dc: 49 0f 47 c1                 	cmovaq	%r9, %rax
1454a87e0: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a87e4: f3 0f 5c d4                 	subss	%xmm4, %xmm2
1454a87e8: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a87ed: f3 4d 0f 2c c1              	cvttss2si	%xmm9, %r8
1454a87f2: 4c 89 c2                    	movq	%r8, %rdx
1454a87f5: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a87f9: 48 21 ca                    	andq	%rcx, %rdx
1454a87fc: 4c 09 c2                    	orq	%r8, %rdx
1454a87ff: 44 0f 2e cd                 	ucomiss	%xmm5, %xmm9
1454a8803: 48 0f 42 d7                 	cmovbq	%rdi, %rdx
1454a8807: 44 0f 2e cb                 	ucomiss	%xmm3, %xmm9
1454a880b: 49 0f 47 d1                 	cmovaq	%r9, %rdx
1454a880f: 48 8b 4b 58                 	movq	0x58(%rbx), %rcx
1454a8813: 48 39 c8                    	cmpq	%rcx, %rax
1454a8816: 0f 83 34 fd ff ff           	jae	0x1454a8550 <.text+0x54a7550>
1454a881c: 48 39 ca                    	cmpq	%rcx, %rdx
1454a881f: 0f 83 2b fd ff ff           	jae	0x1454a8550 <.text+0x54a7550>
1454a8825: 48 0f af ca                 	imulq	%rdx, %rcx
1454a8829: 48 01 c1                    	addq	%rax, %rcx
1454a882c: 49 8b 56 20                 	movq	0x20(%r14), %rdx
1454a8830: 48 39 d1                    	cmpq	%rdx, %rcx
1454a8833: 0f 83 85 25 00 00           	jae	0x1454aadbe <.text+0x54a9dbe>
1454a8839: 49 8b 46 18                 	movq	0x18(%r14), %rax
1454a883d: 0f b7 04 48                 	movzwl	(%rax,%rcx,2), %eax
1454a8841: 66 83 f8 ff                 	cmpw	$-0x1, %ax
1454a8845: 0f 84 05 fd ff ff           	je	0x1454a8550 <.text+0x54a7550>
1454a884b: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a884e: 41 0f 28 c2                 	movaps	%xmm10, %xmm0
1454a8852: 0f b7 c0                    	movzwl	%ax, %eax
1454a8855: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a8858: f3 0f 2a d0                 	cvtsi2ss	%eax, %xmm2
1454a885c: f3 0f 59 0d d4 43 45 00     	mulss	0x4543d4(%rip), %xmm1   # 0x1458fcc38
1454a8864: f3 0f 58 0d 94 2c 44 00     	addss	0x442c94(%rip), %xmm1   # 0x1458eb500
1454a886c: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454a886f: 0f 87 db fc ff ff           	ja	0x1454a8550 <.text+0x54a7550>
1454a8875: e9 09 fc ff ff              	jmp	0x1454a8483 <.text+0x54a7483>
1454a887a: 48 8d 3d 1f 2e 50 01        	leaq	0x1502e1f(%rip), %rdi   # 0x1469ab6a0
1454a8881: be 14 00 00 00              	movl	$0x14, %esi
1454a8886: ba 14 00 00 00              	movl	$0x14, %edx
1454a888b: 48 89 f9                    	movq	%rdi, %rcx
1454a888e: e8 6d 9b fa ff              	callq	0x145452400 <.text+0x5451400>
1454a8893: 90                          	nop
1454a8894: e9 71 08 00 00              	jmp	0x1454a910a <.text+0x54a810a>
1454a8899: 4c 8b b5 28 03 00 00        	movq	0x328(%rbp), %r14
1454a88a0: 4d 8d 46 08                 	leaq	0x8(%r14), %r8
1454a88a4: 49 ff c9                    	decq	%r9
1454a88a7: 49 ba ff ff ff ff ff ff ff 1f       	movabsq	$0x1fffffffffffffff, %r10 # imm = 0x1FFFFFFFFFFFFFFF
1454a88b1: 4d 21 ca                    	andq	%r9, %r10
1454a88b4: 49 8b 0e                    	movq	(%r14), %rcx
1454a88b7: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454a88be: eb 0d                       	jmp	0x1454a88cd <.text+0x54a78cd>
1454a88c0: 49 83 c0 08                 	addq	$0x8, %r8
1454a88c4: 49 ff ca                    	decq	%r10
1454a88c7: 0f 84 ce f8 ff ff           	je	0x1454a819b <.text+0x54a719b>
1454a88cd: 48 39 d1                    	cmpq	%rdx, %rcx
1454a88d0: 0f 83 2e 25 00 00           	jae	0x1454aae04 <.text+0x54a9e04>
1454a88d6: 49 8b 00                    	movq	(%r8), %rax
1454a88d9: 48 39 d0                    	cmpq	%rdx, %rax
1454a88dc: 0f 83 34 25 00 00           	jae	0x1454aae16 <.text+0x54a9e16>
1454a88e2: 4c 8d 0c 89                 	leaq	(%rcx,%rcx,4), %r9
1454a88e6: 49 c1 e1 04                 	shlq	$0x4, %r9
1454a88ea: 4c 8d 1c 80                 	leaq	(%rax,%rax,4), %r11
1454a88ee: 49 c1 e3 04                 	shlq	$0x4, %r11
1454a88f2: 48 8b b5 90 02 00 00        	movq	0x290(%rbp), %rsi
1454a88f9: 46 8b 4c 0e 3c              	movl	0x3c(%rsi,%r9), %r9d
1454a88fe: 46 8b 5c 1e 3c              	movl	0x3c(%rsi,%r11), %r11d
1454a8903: 44 89 ce                    	movl	%r9d, %esi
1454a8906: c1 fe 1f                    	sarl	$0x1f, %esi
1454a8909: d1 ee                       	shrl	%esi
1454a890b: 44 31 ce                    	xorl	%r9d, %esi
1454a890e: 45 89 d9                    	movl	%r11d, %r9d
1454a8911: 41 c1 f9 1f                 	sarl	$0x1f, %r9d
1454a8915: 41 d1 e9                    	shrl	%r9d
1454a8918: 45 31 d9                    	xorl	%r11d, %r9d
1454a891b: 44 39 ce                    	cmpl	%r9d, %esi
1454a891e: 7f a0                       	jg	0x1454a88c0 <.text+0x54a78c0>
1454a8920: 48 89 c1                    	movq	%rax, %rcx
1454a8923: 4d 89 c6                    	movq	%r8, %r14
1454a8926: eb 98                       	jmp	0x1454a88c0 <.text+0x54a78c0>
1454a8928: 48 89 f0                    	movq	%rsi, %rax
1454a892b: 48 d1 e8                    	shrq	%rax
1454a892e: 89 f1                       	movl	%esi, %ecx
1454a8930: 83 e1 01                    	andl	$0x1, %ecx
1454a8933: 48 09 c1                    	orq	%rax, %rcx
1454a8936: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8939: f3 48 0f 2a c1              	cvtsi2ss	%rcx, %xmm0
1454a893e: f3 0f 58 c0                 	addss	%xmm0, %xmm0
1454a8942: f3 0f 11 85 10 03 00 00     	movss	%xmm0, 0x310(%rbp)
1454a894a: f3 0f 10 85 58 03 00 00     	movss	0x358(%rbp), %xmm0
1454a8952: f3 0f 58 05 a6 1a 50 01     	addss	0x1501aa6(%rip), %xmm0  # 0x1469aa400
1454a895a: f3 0f 11 85 58 03 00 00     	movss	%xmm0, 0x358(%rbp)
1454a8962: 4c 8d 35 9f 1a 50 01        	leaq	0x1501a9f(%rip), %r14   # 0x1469aa408
1454a8969: 49 c7 c7 ff ff ff ff        	movq	$-0x1, %r15
1454a8970: 31 ff                       	xorl	%edi, %edi
1454a8972: eb 3c                       	jmp	0x1454a89b0 <.text+0x54a79b0>
1454a8974: 44 0f 13 85 a4 00 00 00     	movlps	%xmm8, 0xa4(%rbp)
1454a897c: f3 0f 11 85 ac 00 00 00     	movss	%xmm0, 0xac(%rbp)
1454a8984: c7 85 a0 00 00 00 01 00 00 00       	movl	$0x1, 0xa0(%rbp)
1454a898e: 48 8b 8d 68 03 00 00        	movq	0x368(%rbp), %rcx
1454a8995: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a899c: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454a89a3: e8 98 96 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a89a8: 90                          	nop
1454a89a9: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a89b0: 48 39 f7                    	cmpq	%rsi, %rdi
1454a89b3: 0f 83 bb 03 00 00           	jae	0x1454a8d74 <.text+0x54a7d74>
1454a89b9: 48 85 ff                    	testq	%rdi, %rdi
1454a89bc: 78 12                       	js	0x1454a89d0 <.text+0x54a79d0>
1454a89be: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454a89c2: f3 4c 0f 2a c7              	cvtsi2ss	%rdi, %xmm8
1454a89c7: eb 23                       	jmp	0x1454a89ec <.text+0x54a79ec>
1454a89c9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a89d0: 48 89 f8                    	movq	%rdi, %rax
1454a89d3: 48 d1 e8                    	shrq	%rax
1454a89d6: 89 f9                       	movl	%edi, %ecx
1454a89d8: 83 e1 01                    	andl	$0x1, %ecx
1454a89db: 48 09 c1                    	orq	%rax, %rcx
1454a89de: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454a89e2: f3 4c 0f 2a c1              	cvtsi2ss	%rcx, %xmm8
1454a89e7: f3 45 0f 58 c0              	addss	%xmm8, %xmm8
1454a89ec: 48 ff c7                    	incq	%rdi
1454a89ef: f3 44 0f 58 05 90 2a 44 00  	addss	0x442a90(%rip), %xmm8   # 0x1458eb488
1454a89f8: f3 44 0f 59 05 e7 43 45 00  	mulss	0x4543e7(%rip), %xmm8   # 0x1458fcde8
1454a8a01: f3 44 0f 5e 85 10 03 00 00  	divss	0x310(%rbp), %xmm8
1454a8a0a: f3 44 0f 58 85 58 03 00 00  	addss	0x358(%rbp), %xmm8
1454a8a13: 48 8b 85 a0 02 00 00        	movq	0x2a0(%rbp), %rax
1454a8a1a: f2 44 0f 10 20              	movsd	(%rax), %xmm12
1454a8a1f: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8a23: e8 09 e4 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8a28: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8a2b: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8a2f: e8 f7 e3 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a8a34: 0f 14 f8                    	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454a8a37: f3 44 0f 10 2d c0 db 44 00  	movss	0x44dbc0(%rip), %xmm13  # 0x1458f6600
1454a8a40: eb 2f                       	jmp	0x1454a8a71 <.text+0x54a7a71>
1454a8a42: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a8a50: c7 85 a0 00 00 00 00 00 00 00       	movl	$0x0, 0xa0(%rbp)
1454a8a5a: f3 44 0f 58 2d 85 42 45 00  	addss	0x454285(%rip), %xmm13  # 0x1458fcce8
1454a8a63: 44 0f 2e 2d 75 03 45 00     	ucomiss	0x450375(%rip), %xmm13  # 0x1458f8de0
1454a8a6b: 0f 82 38 ff ff ff           	jb	0x1454a89a9 <.text+0x54a79a9>
1454a8a71: f3 45 0f 12 c5              	movsldup	%xmm13, %xmm8           # xmm8 = xmm13[0,0,2,2]
1454a8a76: 44 0f 59 c7                 	mulps	%xmm7, %xmm8
1454a8a7a: 45 0f 58 c4                 	addps	%xmm12, %xmm8
1454a8a7e: f3 45 0f 16 c8              	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
1454a8a83: 48 8b 9d 68 03 00 00        	movq	0x368(%rbp), %rbx
1454a8a8a: 48 8b 8b 10 02 00 00        	movq	0x210(%rbx), %rcx
1454a8a91: 48 8b 93 18 02 00 00        	movq	0x218(%rbx), %rdx
1454a8a98: e8 83 5d f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a8a9d: 48 69 f0 f0 00 00 00        	imulq	$0xf0, %rax, %rsi
1454a8aa4: f3 44 0f 10 9b e8 03 00 00  	movss	0x3e8(%rbx), %xmm11
1454a8aad: f3 0f 10 b3 ec 03 00 00     	movss	0x3ec(%rbx), %xmm6
1454a8ab5: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8ab9: f3 42 0f 5c 84 26 c8 00 00 00       	subss	0xc8(%rsi,%r12), %xmm0
1454a8ac3: f3 44 0f 10 b3 f0 03 00 00  	movss	0x3f0(%rbx), %xmm14
1454a8acc: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
1454a8ad0: f3 42 0f 5c 8c 26 cc 00 00 00       	subss	0xcc(%rsi,%r12), %xmm1
1454a8ada: e8 88 e3 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a8adf: 44 0f 28 d0                 	movaps	%xmm0, %xmm10
1454a8ae3: f3 46 0f 10 bc 26 d8 00 00 00       	movss	0xd8(%rsi,%r12), %xmm15
1454a8aed: 41 0f 28 c7                 	movaps	%xmm15, %xmm0
1454a8af1: f3 0f 58 05 97 04 45 00     	addss	0x450497(%rip), %xmm0   # 0x1458f8f90
1454a8af9: 44 0f 2e d0                 	ucomiss	%xmm0, %xmm10
1454a8afd: 0f 87 4d ff ff ff           	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8b03: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a8b0a: 48 8b 98 78 08 00 00        	movq	0x878(%rax), %rbx
1454a8b11: 48 8d 4b 10                 	leaq	0x10(%rbx), %rcx
1454a8b15: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a8b19: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a8b1d: e8 ce 9c fb ff              	callq	0x1454627f0 <.text+0x54617f0>
1454a8b22: 90                          	nop
1454a8b23: a8 01                       	testb	$0x1, %al
1454a8b25: 0f 84 25 ff ff ff           	je	0x1454a8a50 <.text+0x54a7a50>
1454a8b2b: 31 c0                       	xorl	%eax, %eax
1454a8b2d: 45 0f 2e d7                 	ucomiss	%xmm15, %xmm10
1454a8b31: 0f 97 c0                    	seta	%al
1454a8b34: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a8b37: f3 41 0f 5c ce              	subss	%xmm14, %xmm1
1454a8b3c: 0f 54 0d ed 23 46 00        	andps	0x4623ed(%rip), %xmm1   # 0x14590af30
1454a8b43: 41 0f 2e 0c 86              	ucomiss	(%r14,%rax,4), %xmm1
1454a8b48: 0f 87 02 ff ff ff           	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8b4e: 48 83 7b 40 ff              	cmpq	$-0x1, 0x40(%rbx)
1454a8b53: 0f 84 1b fe ff ff           	je	0x1454a8974 <.text+0x54a7974>
1454a8b59: f2 0f 10 53 60              	movsd	0x60(%rbx), %xmm2
1454a8b5e: 41 0f 28 c8                 	movaps	%xmm8, %xmm1
1454a8b62: 0f 5c ca                    	subps	%xmm2, %xmm1
1454a8b65: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a8b68: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a8b6b: 0f c2 d3 01                 	cmpltps	%xmm3, %xmm2
1454a8b6f: 0f 14 d2                    	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454a8b72: 66 0f 50 c2                 	movmskpd	%xmm2, %eax
1454a8b76: 85 c0                       	testl	%eax, %eax
1454a8b78: 0f 85 ae 00 00 00           	jne	0x1454a8c2c <.text+0x54a7c2c>
1454a8b7e: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a8b81: f3 0f 10 1d 57 26 44 00     	movss	0x442657(%rip), %xmm3   # 0x1458eb1e0
1454a8b89: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a8b8d: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a8b92: f3 48 0f 2c d1              	cvttss2si	%xmm1, %rdx
1454a8b97: 48 89 d0                    	movq	%rdx, %rax
1454a8b9a: 48 c1 f8 3f                 	sarq	$0x3f, %rax
1454a8b9e: 48 21 c8                    	andq	%rcx, %rax
1454a8ba1: 48 09 d0                    	orq	%rdx, %rax
1454a8ba4: 0f 57 ed                    	xorps	%xmm5, %xmm5
1454a8ba7: 0f 2e cd                    	ucomiss	%xmm5, %xmm1
1454a8baa: 41 b9 00 00 00 00           	movl	$0x0, %r9d
1454a8bb0: 49 0f 42 c1                 	cmovbq	%r9, %rax
1454a8bb4: f3 0f 10 25 28 26 44 00     	movss	0x442628(%rip), %xmm4   # 0x1458eb1e4
1454a8bbc: 0f 2e cc                    	ucomiss	%xmm4, %xmm1
1454a8bbf: 49 0f 47 c7                 	cmovaq	%r15, %rax
1454a8bc3: f3 0f 16 c9                 	movshdup	%xmm1, %xmm1            # xmm1 = xmm1[1,1,3,3]
1454a8bc7: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a8bca: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a8bce: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a8bd3: f3 4c 0f 2c c1              	cvttss2si	%xmm1, %r8
1454a8bd8: 4c 89 c2                    	movq	%r8, %rdx
1454a8bdb: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a8bdf: 48 21 ca                    	andq	%rcx, %rdx
1454a8be2: 4c 09 c2                    	orq	%r8, %rdx
1454a8be5: 0f 2e cd                    	ucomiss	%xmm5, %xmm1
1454a8be8: 49 0f 42 d1                 	cmovbq	%r9, %rdx
1454a8bec: 0f 2e cc                    	ucomiss	%xmm4, %xmm1
1454a8bef: 49 0f 47 d7                 	cmovaq	%r15, %rdx
1454a8bf3: 48 8b 4b 58                 	movq	0x58(%rbx), %rcx
1454a8bf7: 48 39 c8                    	cmpq	%rcx, %rax
1454a8bfa: 41 0f 93 c0                 	setae	%r8b
1454a8bfe: 48 39 ca                    	cmpq	%rcx, %rdx
1454a8c01: 41 0f 93 c1                 	setae	%r9b
1454a8c05: 45 08 c1                    	orb	%r8b, %r9b
1454a8c08: 75 22                       	jne	0x1454a8c2c <.text+0x54a7c2c>
1454a8c0a: 48 0f af ca                 	imulq	%rdx, %rcx
1454a8c0e: 48 01 c1                    	addq	%rax, %rcx
1454a8c11: 48 8b 53 50                 	movq	0x50(%rbx), %rdx
1454a8c15: 48 39 d1                    	cmpq	%rdx, %rcx
1454a8c18: 0f 83 7f 21 00 00           	jae	0x1454aad9d <.text+0x54a9d9d>
1454a8c1e: 48 8b 43 48                 	movq	0x48(%rbx), %rax
1454a8c22: 80 3c 08 00                 	cmpb	$0x0, (%rax,%rcx)
1454a8c26: 0f 85 24 fe ff ff           	jne	0x1454a8a50 <.text+0x54a7a50>
1454a8c2c: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454a8c33: 4c 8b a8 a0 08 00 00        	movq	0x8a0(%rax), %r13
1454a8c3a: 4d 85 ed                    	testq	%r13, %r13
1454a8c3d: 0f 84 31 fd ff ff           	je	0x1454a8974 <.text+0x54a7974>
1454a8c43: 49 81 7d 30 91 01 00 00     	cmpq	$0x191, 0x30(%r13)      # imm = 0x191
1454a8c4b: 0f 82 23 fd ff ff           	jb	0x1454a8974 <.text+0x54a7974>
1454a8c51: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a8c55: f3 41 0f 5c d3              	subss	%xmm11, %xmm2
1454a8c5a: 41 0f 28 c9                 	movaps	%xmm9, %xmm1
1454a8c5e: f3 0f 5c ce                 	subss	%xmm6, %xmm1
1454a8c62: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a8c65: 0f 28 c2                    	movaps	%xmm2, %xmm0
1454a8c68: e8 fa e1 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a8c6d: f3 0f 10 5b 60              	movss	0x60(%rbx), %xmm3
1454a8c72: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454a8c76: f3 0f 5c d3                 	subss	%xmm3, %xmm2
1454a8c7a: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a8c7d: 0f 2e da                    	ucomiss	%xmm2, %xmm3
1454a8c80: 0f 87 ca fd ff ff           	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8c86: f3 44 0f 5c 4b 64           	subss	0x64(%rbx), %xmm9
1454a8c8c: 41 0f 2e d9                 	ucomiss	%xmm9, %xmm3
1454a8c90: 0f 87 ba fd ff ff           	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8c96: 0f 28 da                    	movaps	%xmm2, %xmm3
1454a8c99: f3 0f 10 25 3f 25 44 00     	movss	0x44253f(%rip), %xmm4   # 0x1458eb1e0
1454a8ca1: f3 0f 5c dc                 	subss	%xmm4, %xmm3
1454a8ca5: f3 48 0f 2c cb              	cvttss2si	%xmm3, %rcx
1454a8caa: f3 48 0f 2c d2              	cvttss2si	%xmm2, %rdx
1454a8caf: 48 89 d0                    	movq	%rdx, %rax
1454a8cb2: 48 c1 f8 3f                 	sarq	$0x3f, %rax
1454a8cb6: 48 21 c8                    	andq	%rcx, %rax
1454a8cb9: 48 09 d0                    	orq	%rdx, %rax
1454a8cbc: 0f 57 ed                    	xorps	%xmm5, %xmm5
1454a8cbf: 0f 2e d5                    	ucomiss	%xmm5, %xmm2
1454a8cc2: 41 b9 00 00 00 00           	movl	$0x0, %r9d
1454a8cc8: 49 0f 42 c1                 	cmovbq	%r9, %rax
1454a8ccc: f3 0f 10 1d 10 25 44 00     	movss	0x442510(%rip), %xmm3   # 0x1458eb1e4
1454a8cd4: 0f 2e d3                    	ucomiss	%xmm3, %xmm2
1454a8cd7: 49 0f 47 c7                 	cmovaq	%r15, %rax
1454a8cdb: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a8cdf: f3 0f 5c d4                 	subss	%xmm4, %xmm2
1454a8ce3: f3 48 0f 2c ca              	cvttss2si	%xmm2, %rcx
1454a8ce8: f3 4d 0f 2c c1              	cvttss2si	%xmm9, %r8
1454a8ced: 4c 89 c2                    	movq	%r8, %rdx
1454a8cf0: 48 c1 fa 3f                 	sarq	$0x3f, %rdx
1454a8cf4: 48 21 ca                    	andq	%rcx, %rdx
1454a8cf7: 4c 09 c2                    	orq	%r8, %rdx
1454a8cfa: 44 0f 2e cd                 	ucomiss	%xmm5, %xmm9
1454a8cfe: 49 0f 42 d1                 	cmovbq	%r9, %rdx
1454a8d02: 44 0f 2e cb                 	ucomiss	%xmm3, %xmm9
1454a8d06: 49 0f 47 d7                 	cmovaq	%r15, %rdx
1454a8d0a: 48 8b 4b 58                 	movq	0x58(%rbx), %rcx
1454a8d0e: 48 39 c8                    	cmpq	%rcx, %rax
1454a8d11: 0f 83 39 fd ff ff           	jae	0x1454a8a50 <.text+0x54a7a50>
1454a8d17: 48 39 ca                    	cmpq	%rcx, %rdx
1454a8d1a: 0f 83 30 fd ff ff           	jae	0x1454a8a50 <.text+0x54a7a50>
1454a8d20: 48 0f af ca                 	imulq	%rdx, %rcx
1454a8d24: 48 01 c1                    	addq	%rax, %rcx
1454a8d27: 49 8b 55 20                 	movq	0x20(%r13), %rdx
1454a8d2b: 48 39 d1                    	cmpq	%rdx, %rcx
1454a8d2e: 0f 83 9c 20 00 00           	jae	0x1454aadd0 <.text+0x54a9dd0>
1454a8d34: 49 8b 45 18                 	movq	0x18(%r13), %rax
1454a8d38: 0f b7 04 48                 	movzwl	(%rax,%rcx,2), %eax
1454a8d3c: 66 83 f8 ff                 	cmpw	$-0x1, %ax
1454a8d40: 0f 84 0a fd ff ff           	je	0x1454a8a50 <.text+0x54a7a50>
1454a8d46: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a8d49: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454a8d4c: 0f b7 c0                    	movzwl	%ax, %eax
1454a8d4f: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454a8d52: f3 0f 2a d0                 	cvtsi2ss	%eax, %xmm2
1454a8d56: f3 0f 59 0d da 3e 45 00     	mulss	0x453eda(%rip), %xmm1   # 0x1458fcc38
1454a8d5e: f3 0f 58 0d 9a 27 44 00     	addss	0x44279a(%rip), %xmm1   # 0x1458eb500
1454a8d66: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1454a8d69: 0f 87 e1 fc ff ff           	ja	0x1454a8a50 <.text+0x54a7a50>
1454a8d6f: e9 00 fc ff ff              	jmp	0x1454a8974 <.text+0x54a7974>
1454a8d74: 48 8d 3d 70 29 50 01        	leaq	0x1502970(%rip), %rdi   # 0x1469ab6eb
1454a8d7b: be 19 00 00 00              	movl	$0x19, %esi
1454a8d80: ba 19 00 00 00              	movl	$0x19, %edx
1454a8d85: 48 89 f9                    	movq	%rdi, %rcx
1454a8d88: e8 73 96 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a8d8d: 90                          	nop
1454a8d8e: e9 77 03 00 00              	jmp	0x1454a910a <.text+0x54a810a>
1454a8d93: f3 0f 10 15 79 42 44 00     	movss	0x444279(%rip), %xmm2   # 0x1458ed014
1454a8d9b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a8d9e: 48 8b 4d 60                 	movq	0x60(%rbp), %rcx
1454a8da2: e8 19 0a 05 00              	callq	0x1454f97c0 <.text+0x54f87c0>
1454a8da7: 90                          	nop
1454a8da8: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8dab: 4d 89 f7                    	movq	%r14, %r15
1454a8dae: f3 44 0f 10 05 51 21 46 00  	movss	0x462151(%rip), %xmm8   # 0x14590af08
1454a8db7: f3 44 0f 58 c7              	addss	%xmm7, %xmm8
1454a8dbc: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a8dc3: f3 45 0f 10 8d e8 03 00 00  	movss	0x3e8(%r13), %xmm9
1454a8dcc: f3 45 0f 10 95 ec 03 00 00  	movss	0x3ec(%r13), %xmm10
1454a8dd5: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8dd9: e8 53 e0 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8dde: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a8de1: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
1454a8de5: e8 41 e0 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a8dea: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454a8dee: f3 44 0f 10 1d d9 54 49 00  	movss	0x4954d9(%rip), %xmm11  # 0x14593e2d0
1454a8df7: 48 8d 9d a0 00 00 00        	leaq	0xa0(%rbp), %rbx
1454a8dfe: f3 44 0f 10 25 e1 3e 45 00  	movss	0x453ee1(%rip), %xmm12  # 0x1458fcce8
1454a8e07: f3 44 0f 10 2d d4 3f 45 00  	movss	0x453fd4(%rip), %xmm13  # 0x1458fcde4
1454a8e10: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454a8e13: f3 41 0f 59 d3              	mulss	%xmm11, %xmm2
1454a8e18: f3 41 0f 58 d1              	addss	%xmm9, %xmm2
1454a8e1d: 41 0f 28 d8                 	movaps	%xmm8, %xmm3
1454a8e21: f3 41 0f 59 db              	mulss	%xmm11, %xmm3
1454a8e26: f3 41 0f 58 da              	addss	%xmm10, %xmm3
1454a8e2b: 48 89 d9                    	movq	%rbx, %rcx
1454a8e2e: 4c 89 ea                    	movq	%r13, %rdx
1454a8e31: e8 3a 8d 02 00              	callq	0x1454d1b70 <.text+0x54d0b70>
1454a8e36: 90                          	nop
1454a8e37: 80 bd a0 00 00 00 00        	cmpb	$0x0, 0xa0(%rbp)
1454a8e3e: 75 17                       	jne	0x1454a8e57 <.text+0x54a7e57>
1454a8e40: f3 45 0f 58 dc              	addss	%xmm12, %xmm11
1454a8e45: 45 0f 2e dd                 	ucomiss	%xmm13, %xmm11
1454a8e49: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a8e50: 73 be                       	jae	0x1454a8e10 <.text+0x54a7e10>
1454a8e52: e9 f3 03 00 00              	jmp	0x1454a924a <.text+0x54a824a>
1454a8e57: f3 44 0f 10 8d a4 00 00 00  	movss	0xa4(%rbp), %xmm9
1454a8e60: f3 44 0f 10 95 a8 00 00 00  	movss	0xa8(%rbp), %xmm10
1454a8e69: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a8e6c: e8 c0 df 2a 00              	callq	0x145756e31 <.text+0x5755e31>
1454a8e71: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a8e74: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a8e77: e8 af df 2a 00              	callq	0x145756e2b <.text+0x5755e2b>
1454a8e7c: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a8e80: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a8e87: f3 0f 5c 96 e8 03 00 00     	subss	0x3e8(%rsi), %xmm2
1454a8e8f: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a8e92: 41 0f 28 ca                 	movaps	%xmm10, %xmm1
1454a8e96: f3 0f 5c 8e ec 03 00 00     	subss	0x3ec(%rsi), %xmm1
1454a8e9e: 0f 28 c2                    	movaps	%xmm2, %xmm0
1454a8ea1: e8 c1 df 2a 00              	callq	0x145756e67 <.text+0x5755e67>
1454a8ea6: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a8ead: 48 3b 8d 80 00 00 00        	cmpq	0x80(%rbp), %rcx
1454a8eb4: 0f 83 8a 20 00 00           	jae	0x1454aaf44 <.text+0x54a9f44>
1454a8eba: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454a8ebe: f3 44 0f 58 c0              	addss	%xmm0, %xmm8
1454a8ec3: f3 44 0f 58 05 34 26 44 00  	addss	0x442634(%rip), %xmm8   # 0x1458eb500
1454a8ecc: 48 8d 04 89                 	leaq	(%rcx,%rcx,4), %rax
1454a8ed0: 48 c1 e0 04                 	shlq	$0x4, %rax
1454a8ed4: 48 8b 8d 90 02 00 00        	movq	0x290(%rbp), %rcx
1454a8edb: f3 0f 10 4c 01 3c           	movss	0x3c(%rcx,%rax), %xmm1
1454a8ee1: 0f b7 86 36 02 00 00        	movzwl	0x236(%rsi), %eax
1454a8ee8: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8eeb: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1454a8eef: f3 0f 59 0d a1 16 58 00     	mulss	0x5816a1(%rip), %xmm1   # 0x145a2a598
1454a8ef7: f3 0f 5e 05 2d 26 44 00     	divss	0x44262d(%rip), %xmm0   # 0x1458eb52c
1454a8eff: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454a8f03: f3 0f 59 05 35 fe 44 00     	mulss	0x44fe35(%rip), %xmm0   # 0x1458f8d40
1454a8f0b: 4c 89 f8                    	movq	%r15, %rax
1454a8f0e: 48 d1 e8                    	shrq	%rax
1454a8f11: 4c 89 ff                    	movq	%r15, %rdi
1454a8f14: 48 29 c7                    	subq	%rax, %rdi
1454a8f17: 78 0b                       	js	0x1454a8f24 <.text+0x54a7f24>
1454a8f19: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a8f1d: f3 4c 0f 2a df              	cvtsi2ss	%rdi, %xmm11
1454a8f22: eb 1c                       	jmp	0x1454a8f40 <.text+0x54a7f40>
1454a8f24: 48 89 f8                    	movq	%rdi, %rax
1454a8f27: 48 d1 e8                    	shrq	%rax
1454a8f2a: 89 f9                       	movl	%edi, %ecx
1454a8f2c: 83 e1 01                    	andl	$0x1, %ecx
1454a8f2f: 48 09 c1                    	orq	%rax, %rcx
1454a8f32: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a8f36: f3 4c 0f 2a d9              	cvtsi2ss	%rcx, %xmm11
1454a8f3b: f3 45 0f 58 db              	addss	%xmm11, %xmm11
1454a8f40: f3 44 0f 58 1d b3 25 44 00  	addss	0x4425b3(%rip), %xmm11  # 0x1458eb4fc
1454a8f49: f3 44 0f 59 1d 36 25 44 00  	mulss	0x442536(%rip), %xmm11  # 0x1458eb488
1454a8f52: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454a8f55: 0f 14 cf                    	unpcklps	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
1454a8f58: f3 45 0f 12 e0              	movsldup	%xmm8, %xmm12           # xmm12 = xmm8[0,0,2,2]
1454a8f5d: 44 0f 59 e1                 	mulps	%xmm1, %xmm12
1454a8f61: f3 0f 5f 05 17 25 44 00     	maxss	0x442517(%rip), %xmm0   # 0x1458eb480
1454a8f69: f3 44 0f 5e c0              	divss	%xmm0, %xmm8
1454a8f6e: 31 db                       	xorl	%ebx, %ebx
1454a8f70: f3 44 0f 10 2d bb 3e 45 00  	movss	0x453ebb(%rip), %xmm13  # 0x1458fce34
1454a8f79: 4c 8d b5 10 02 00 00        	leaq	0x210(%rbp), %r14
1454a8f80: 4c 39 fb                    	cmpq	%r15, %rbx
1454a8f83: 0f 83 67 01 00 00           	jae	0x1454a90f0 <.text+0x54a80f0>
1454a8f89: 48 89 d8                    	movq	%rbx, %rax
1454a8f8c: 48 09 f8                    	orq	%rdi, %rax
1454a8f8f: 48 c1 e8 20                 	shrq	$0x20, %rax
1454a8f93: 74 17                       	je	0x1454a8fac <.text+0x54a7fac>
1454a8f95: 48 89 d8                    	movq	%rbx, %rax
1454a8f98: 31 d2                       	xorl	%edx, %edx
1454a8f9a: 48 f7 f7                    	divq	%rdi
1454a8f9d: 48 85 c0                    	testq	%rax, %rax
1454a8fa0: 78 15                       	js	0x1454a8fb7 <.text+0x54a7fb7>
1454a8fa2: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8fa5: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a8faa: eb 23                       	jmp	0x1454a8fcf <.text+0x54a7fcf>
1454a8fac: 89 d8                       	movl	%ebx, %eax
1454a8fae: 31 d2                       	xorl	%edx, %edx
1454a8fb0: f7 f7                       	divl	%edi
1454a8fb2: 48 85 c0                    	testq	%rax, %rax
1454a8fb5: 79 eb                       	jns	0x1454a8fa2 <.text+0x54a7fa2>
1454a8fb7: 48 89 c1                    	movq	%rax, %rcx
1454a8fba: 48 d1 e9                    	shrq	%rcx
1454a8fbd: 83 e0 01                    	andl	$0x1, %eax
1454a8fc0: 48 09 c8                    	orq	%rcx, %rax
1454a8fc3: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a8fc6: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454a8fcb: f3 0f 58 c0                 	addss	%xmm0, %xmm0
1454a8fcf: 0f 57 db                    	xorps	%xmm3, %xmm3
1454a8fd2: f3 48 0f 2a da              	cvtsi2ss	%rdx, %xmm3
1454a8fd7: f3 41 0f 5c db              	subss	%xmm11, %xmm3
1454a8fdc: f3 41 0f 59 dd              	mulss	%xmm13, %xmm3
1454a8fe1: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454a8fe4: f3 0f 59 cb                 	mulss	%xmm3, %xmm1
1454a8fe8: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454a8fec: f3 0f 5c d1                 	subss	%xmm1, %xmm2
1454a8ff0: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454a8ff3: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
1454a8ff7: f3 0f 10 25 2d d6 44 00     	movss	0x44d62d(%rip), %xmm4   # 0x1458f662c
1454a8fff: f3 0f 59 cc                 	mulss	%xmm4, %xmm1
1454a9003: f3 0f 5c d1                 	subss	%xmm1, %xmm2
1454a9007: f3 0f 59 de                 	mulss	%xmm6, %xmm3
1454a900b: f3 41 0f 58 da              	addss	%xmm10, %xmm3
1454a9010: f3 0f 59 c7                 	mulss	%xmm7, %xmm0
1454a9014: f3 0f 59 c4                 	mulss	%xmm4, %xmm0
1454a9018: f3 0f 5c d8                 	subss	%xmm0, %xmm3
1454a901c: 4c 89 f1                    	movq	%r14, %rcx
1454a901f: 48 89 f2                    	movq	%rsi, %rdx
1454a9022: e8 49 8b 02 00              	callq	0x1454d1b70 <.text+0x54d0b70>
1454a9027: 90                          	nop
1454a9028: 48 ff c3                    	incq	%rbx
1454a902b: 83 bd 10 02 00 00 01        	cmpl	$0x1, 0x210(%rbp)
1454a9032: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a9039: 0f 85 41 ff ff ff           	jne	0x1454a8f80 <.text+0x54a7f80>
1454a903f: f2 44 0f 10 b5 14 02 00 00  	movsd	0x214(%rbp), %xmm14
1454a9048: 48 89 f1                    	movq	%rsi, %rcx
1454a904b: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454a9052: 4d 89 f0                    	movq	%r14, %r8
1454a9055: e8 e6 8f 01 00              	callq	0x1454c2040 <.text+0x54c1040>
1454a905a: 90                          	nop
1454a905b: 48 83 f8 01                 	cmpq	$0x1, %rax
1454a905f: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454a9066: 0f 85 14 ff ff ff           	jne	0x1454a8f80 <.text+0x54a7f80>
1454a906c: 45 0f 58 f4                 	addps	%xmm12, %xmm14
1454a9070: f3 0f 10 86 e4 08 00 00     	movss	0x8e4(%rsi), %xmm0
1454a9078: f3 41 0f 58 c0              	addss	%xmm8, %xmm0
1454a907d: f3 0f 58 05 a7 d5 44 00     	addss	0x44d5a7(%rip), %xmm0   # 0x1458f662c
1454a9085: 48 8b 86 c8 04 00 00        	movq	0x4c8(%rsi), %rax
1454a908c: 4c 69 86 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rsi), %r8 # imm = 0x160
1454a9097: 31 c9                       	xorl	%ecx, %ecx
1454a9099: 49 89 c1                    	movq	%rax, %r9
1454a909c: 0f 1f 40 00                 	nopl	(%rax)
1454a90a0: 49 39 c8                    	cmpq	%rcx, %r8
1454a90a3: 0f 84 d7 fe ff ff           	je	0x1454a8f80 <.text+0x54a7f80>
1454a90a9: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454a90b0: 49 39 91 88 00 00 00        	cmpq	%rdx, 0x88(%r9)
1454a90b7: 4d 8d 89 60 01 00 00        	leaq	0x160(%r9), %r9
1454a90be: 75 e0                       	jne	0x1454a90a0 <.text+0x54a80a0>
1454a90c0: c7 84 08 18 ff ff ff 01 00 00 00    	movl	$0x1, -0xe8(%rax,%rcx)
1454a90cb: 44 0f 13 b4 08 1c ff ff ff  	movlps	%xmm14, -0xe4(%rax,%rcx)
1454a90d4: f3 0f 11 84 08 24 ff ff ff  	movss	%xmm0, -0xdc(%rax,%rcx)
1454a90dd: f3 0f 10 86 e4 08 00 00     	movss	0x8e4(%rsi), %xmm0
1454a90e5: f3 0f 11 44 08 cc           	movss	%xmm0, -0x34(%rax,%rcx)
1454a90eb: e9 90 fe ff ff              	jmp	0x1454a8f80 <.text+0x54a7f80>
1454a90f0: 48 8d 3d d9 25 50 01        	leaq	0x15025d9(%rip), %rdi   # 0x1469ab6d0
1454a90f7: be 1b 00 00 00              	movl	$0x1b, %esi
1454a90fc: ba 1b 00 00 00              	movl	$0x1b, %edx
1454a9101: 48 89 f9                    	movq	%rdi, %rcx
1454a9104: e8 f7 92 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a9109: 90                          	nop
1454a910a: 49 89 d6                    	movq	%rdx, %r14
1454a910d: 48 85 c0                    	testq	%rax, %rax
1454a9110: 4c 0f 44 f6                 	cmoveq	%rsi, %r14
1454a9114: 48 0f 45 f8                 	cmovneq	%rax, %rdi
1454a9118: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454a911f: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a9126: 48 39 d1                    	cmpq	%rdx, %rcx
1454a9129: 0f 83 d7 1d 00 00           	jae	0x1454aaf06 <.text+0x54a9f06>
1454a912f: 48 8d 34 89                 	leaq	(%rcx,%rcx,4), %rsi
1454a9133: 48 c1 e6 04                 	shlq	$0x4, %rsi
1454a9137: 48 8b 85 90 02 00 00        	movq	0x290(%rbp), %rax
1454a913e: 48 01 f0                    	addq	%rsi, %rax
1454a9141: 48 83 c0 20                 	addq	$0x20, %rax
1454a9145: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
1454a914c: 48 8d 05 ed 4e 27 00        	leaq	0x274eed(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9153: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
1454a915a: 48 8d 15 05 58 26 01        	leaq	0x1265805(%rip), %rdx   # 0x14670e966
1454a9161: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a9168: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
1454a916f: e8 0c 2e 26 00              	callq	0x14570bf80 <.text+0x570af80>
1454a9174: 90                          	nop
1454a9175: 48 89 bd 58 03 00 00        	movq	%rdi, 0x358(%rbp)
1454a917c: 48 8b 85 90 02 00 00        	movq	0x290(%rbp), %rax
1454a9183: 48 01 f0                    	addq	%rsi, %rax
1454a9186: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a918d: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1454a9194: 4c 8b 78 10                 	movq	0x10(%rax), %r15
1454a9198: 48 8b 58 18                 	movq	0x18(%rax), %rbx
1454a919c: 48 89 8d 48 03 00 00        	movq	%rcx, 0x348(%rbp)
1454a91a3: e8 58 92 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a91a8: 90                          	nop
1454a91a9: 48 89 c7                    	movq	%rax, %rdi
1454a91ac: 49 89 d5                    	movq	%rdx, %r13
1454a91af: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a91b6: 48 85 d2                    	testq	%rdx, %rdx
1454a91b9: 74 12                       	je	0x1454a91cd <.text+0x54a81cd>
1454a91bb: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a91c1: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a91c8: e8 03 90 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a91cd: 48 85 ff                    	testq	%rdi, %rdi
1454a91d0: 4c 0f 45 ff                 	cmovneq	%rdi, %r15
1454a91d4: 4c 0f 44 eb                 	cmoveq	%rbx, %r13
1454a91d8: 4c 89 74 24 20              	movq	%r14, 0x20(%rsp)
1454a91dd: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a91e4: 4c 89 fa                    	movq	%r15, %rdx
1454a91e7: 4d 89 e8                    	movq	%r13, %r8
1454a91ea: 4c 8b 8d 58 03 00 00        	movq	0x358(%rbp), %r9
1454a91f1: e8 4a 64 f9 ff              	callq	0x14543f640 <.text+0x543e640>
1454a91f6: 90                          	nop
1454a91f7: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a91fe: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a9205: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a920c: 75 0d                       	jne	0x1454a921b <.text+0x54a821b>
1454a920e: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a9215: e8 96 ee 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a921a: 90                          	nop
1454a921b: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a9222: 48 89 f1                    	movq	%rsi, %rcx
1454a9225: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a9229: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a9230: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454a9237: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454a923c: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a9240: 48 ff c6                    	incq	%rsi
1454a9243: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a924a: 48 8b 95 28 02 00 00        	movq	0x228(%rbp), %rdx
1454a9251: 48 85 d2                    	testq	%rdx, %rdx
1454a9254: 48 8b 8d 28 03 00 00        	movq	0x328(%rbp), %rcx
1454a925b: 74 0f                       	je	0x1454a926c <.text+0x54a826c>
1454a925d: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a9261: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a9267: e8 64 8f b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a926c: 48 8b 95 d8 02 00 00        	movq	0x2d8(%rbp), %rdx
1454a9273: 48 85 d2                    	testq	%rdx, %rdx
1454a9276: 74 12                       	je	0x1454a928a <.text+0x54a828a>
1454a9278: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a927e: 48 8b 8d 98 02 00 00        	movq	0x298(%rbp), %rcx
1454a9285: e8 46 8f b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a928a: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a9293: f3 0f 10 75 68              	movss	0x68(%rbp), %xmm6
1454a9298: f3 0f 59 35 d4 85 59 00     	mulss	0x5985d4(%rip), %xmm6   # 0x145a41874
1454a92a0: f3 0f 58 35 58 7c 48 00     	addss	0x487c58(%rip), %xmm6   # 0x145930f00
1454a92a8: f3 0f 5f 35 38 e7 51 00     	maxss	0x51e738(%rip), %xmm6   # 0x1459c79e8
1454a92b0: f3 0f 58 f0                 	addss	%xmm0, %xmm6
1454a92b4: f3 41 0f 11 b5 14 09 00 00  	movss	%xmm6, 0x914(%r13)
1454a92bd: 49 8b 85 b0 08 00 00        	movq	0x8b0(%r13), %rax
1454a92c4: 48 83 f8 05                 	cmpq	$0x5, %rax
1454a92c8: 73 46                       	jae	0x1454a9310 <.text+0x54a8310>
1454a92ca: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a92d1: 48 8b 91 88 00 00 00        	movq	0x88(%rcx), %rdx
1454a92d8: 48 6b c8 58                 	imulq	$0x58, %rax, %rcx
1454a92dc: f3 0f 10 4d 68              	movss	0x68(%rbp), %xmm1
1454a92e1: 0f 2e 4c 0a 40              	ucomiss	0x40(%rdx,%rcx), %xmm1
1454a92e6: 0f 82 ea 00 00 00           	jb	0x1454a93d6 <.text+0x54a83d6>
1454a92ec: 48 01 ca                    	addq	%rcx, %rdx
1454a92ef: 48 ff c0                    	incq	%rax
1454a92f2: 49 89 85 b0 08 00 00        	movq	%rax, 0x8b0(%r13)
1454a92f9: 4c 89 e9                    	movq	%r13, %rcx
1454a92fc: e8 ff 5d 01 00              	callq	0x1454bf100 <.text+0x54be100>
1454a9301: 90                          	nop
1454a9302: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a930b: e9 c6 00 00 00              	jmp	0x1454a93d6 <.text+0x54a83d6>
1454a9310: 41 80 bd 52 09 00 00 00     	cmpb	$0x0, 0x952(%r13)
1454a9318: 0f 84 b8 00 00 00           	je	0x1454a93d6 <.text+0x54a83d6>
1454a931e: 41 0f 2e 85 34 09 00 00     	ucomiss	0x934(%r13), %xmm0
1454a9326: 0f 82 aa 00 00 00           	jb	0x1454a93d6 <.text+0x54a83d6>
1454a932c: 4d 8b 8d 80 08 00 00        	movq	0x880(%r13), %r9
1454a9333: 49 8b 8d 88 08 00 00        	movq	0x888(%r13), %rcx
1454a933a: 4d 8b 95 98 08 00 00        	movq	0x898(%r13), %r10
1454a9341: 4d 8b 85 90 08 00 00        	movq	0x890(%r13), %r8
1454a9348: 41 bb 05 00 00 00           	movl	$0x5, %r11d
1454a934e: 66 90                       	nop
1454a9350: 4b 8d 04 11                 	leaq	(%r9,%r10), %rax
1454a9354: 48 c1 c0 17                 	rolq	$0x17, %rax
1454a9358: 4c 01 c8                    	addq	%r9, %rax
1454a935b: 48 89 ca                    	movq	%rcx, %rdx
1454a935e: 48 c1 e2 11                 	shlq	$0x11, %rdx
1454a9362: 4d 31 c8                    	xorq	%r9, %r8
1454a9365: 49 31 ca                    	xorq	%rcx, %r10
1454a9368: 4c 31 c1                    	xorq	%r8, %rcx
1454a936b: 4d 31 d1                    	xorq	%r10, %r9
1454a936e: 49 c1 c2 2d                 	rolq	$0x2d, %r10
1454a9372: 49 31 d0                    	xorq	%rdx, %r8
1454a9375: 49 f7 e3                    	mulq	%r11
1454a9378: 48 c1 e8 3d                 	shrq	$0x3d, %rax
1454a937c: 83 f8 04                    	cmpl	$0x4, %eax
1454a937f: 77 cf                       	ja	0x1454a9350 <.text+0x54a8350>
1454a9381: 4d 89 8d 80 08 00 00        	movq	%r9, 0x880(%r13)
1454a9388: 4d 89 95 98 08 00 00        	movq	%r10, 0x898(%r13)
1454a938f: 49 89 8d 88 08 00 00        	movq	%rcx, 0x888(%r13)
1454a9396: 4d 89 85 90 08 00 00        	movq	%r8, 0x890(%r13)
1454a939d: 48 6b d2 58                 	imulq	$0x58, %rdx, %rdx
1454a93a1: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
1454a93a8: 48 03 90 88 00 00 00        	addq	0x88(%rax), %rdx
1454a93af: 4c 89 e9                    	movq	%r13, %rcx
1454a93b2: e8 49 5d 01 00              	callq	0x1454bf100 <.text+0x54be100>
1454a93b7: 90                          	nop
1454a93b8: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a93c1: f3 0f 10 0d bb e6 51 00     	movss	0x51e6bb(%rip), %xmm1   # 0x1459c7a84
1454a93c9: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a93cd: f3 41 0f 11 8d 34 09 00 00  	movss	%xmm1, 0x934(%r13)
1454a93d6: 41 0f 2e 85 28 09 00 00     	ucomiss	0x928(%r13), %xmm0
1454a93de: 0f 82 f8 01 00 00           	jb	0x1454a95dc <.text+0x54a85dc>
1454a93e4: f3 0f 10 0d 74 2d 72 00     	movss	0x722d74(%rip), %xmm1   # 0x145bcc160
1454a93ec: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1454a93f0: f3 41 0f 11 8d 28 09 00 00  	movss	%xmm1, 0x928(%r13)
1454a93f9: 49 8b 85 30 05 00 00        	movq	0x530(%r13), %rax
1454a9400: 48 85 c0                    	testq	%rax, %rax
1454a9403: 0f 84 06 01 00 00           	je	0x1454a950f <.text+0x54a850f>
1454a9409: 49 8b 8d 28 05 00 00        	movq	0x528(%r13), %rcx
1454a9410: 48 83 f8 04                 	cmpq	$0x4, %rax
1454a9414: 73 0a                       	jae	0x1454a9420 <.text+0x54a8420>
1454a9416: 31 d2                       	xorl	%edx, %edx
1454a9418: 45 31 c0                    	xorl	%r8d, %r8d
1454a941b: e9 c1 00 00 00              	jmp	0x1454a94e1 <.text+0x54a84e1>
1454a9420: 48 89 c2                    	movq	%rax, %rdx
1454a9423: 48 83 e2 fc                 	andq	$-0x4, %rdx
1454a9427: 4c 8d 81 f8 00 00 00        	leaq	0xf8(%rcx), %r8
1454a942e: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a9431: 66 0f 6f 15 e7 0f 50 01     	movdqa	0x1500fe7(%rip), %xmm2  # 0x1469aa420
1454a9439: 66 0f 6f 1d 0f fb 44 00     	movdqa	0x44fb0f(%rip), %xmm3   # 0x1458f8f50
1454a9441: 66 0f 6f 25 e7 0f 50 01     	movdqa	0x1500fe7(%rip), %xmm4  # 0x1469aa430
1454a9449: 66 0f 6f 2d 8f 36 45 00     	movdqa	0x45368f(%rip), %xmm5   # 0x1458fcae0
1454a9451: 49 89 d1                    	movq	%rdx, %r9
1454a9454: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454a9457: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a9460: 66 41 0f 6e b8 70 ff ff ff  	movd	-0x90(%r8), %xmm7
1454a9469: 66 45 0f 6e 80 28 ff ff ff  	movd	-0xd8(%r8), %xmm8
1454a9472: 66 44 0f 6c c7              	punpcklqdq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0]
1454a9477: 66 41 0f 6e 38              	movd	(%r8), %xmm7
1454a947c: 66 45 0f 6e 48 b8           	movd	-0x48(%r8), %xmm9
1454a9482: 66 44 0f 6c cf              	punpcklqdq	%xmm7, %xmm9    # xmm9 = xmm9[0],xmm7[0]
1454a9487: 66 44 0f fe c2              	paddd	%xmm2, %xmm8
1454a948c: 66 44 0f ef c3              	pxor	%xmm3, %xmm8
1454a9491: 66 0f 6f fc                 	movdqa	%xmm4, %xmm7
1454a9495: 66 41 0f 66 f8              	pcmpgtd	%xmm8, %xmm7
1454a949a: 66 0f db fd                 	pand	%xmm5, %xmm7
1454a949e: 66 0f d4 f7                 	paddq	%xmm7, %xmm6
1454a94a2: 66 44 0f fe ca              	paddd	%xmm2, %xmm9
1454a94a7: 66 44 0f ef cb              	pxor	%xmm3, %xmm9
1454a94ac: 66 0f 6f fc                 	movdqa	%xmm4, %xmm7
1454a94b0: 66 41 0f 66 f9              	pcmpgtd	%xmm9, %xmm7
1454a94b5: 66 0f db fd                 	pand	%xmm5, %xmm7
1454a94b9: 66 0f d4 cf                 	paddq	%xmm7, %xmm1
1454a94bd: 49 81 c0 20 01 00 00        	addq	$0x120, %r8             # imm = 0x120
1454a94c4: 49 83 c1 fc                 	addq	$-0x4, %r9
1454a94c8: 75 96                       	jne	0x1454a9460 <.text+0x54a8460>
1454a94ca: 66 0f d4 ce                 	paddq	%xmm6, %xmm1
1454a94ce: 66 0f 70 d1 ee              	pshufd	$0xee, %xmm1, %xmm2     # xmm2 = xmm1[2,3,2,3]
1454a94d3: 66 0f d4 d1                 	paddq	%xmm1, %xmm2
1454a94d7: 66 49 0f 7e d0              	movq	%xmm2, %r8
1454a94dc: 48 39 d0                    	cmpq	%rdx, %rax
1454a94df: 74 24                       	je	0x1454a9505 <.text+0x54a8505>
1454a94e1: 48 29 d0                    	subq	%rdx, %rax
1454a94e4: 48 8d 14 d2                 	leaq	(%rdx,%rdx,8), %rdx
1454a94e8: 48 8d 0c d1                 	leaq	(%rcx,%rdx,8), %rcx
1454a94ec: 48 83 c1 20                 	addq	$0x20, %rcx
1454a94f0: 8b 11                       	movl	(%rcx), %edx
1454a94f2: 83 c2 fd                    	addl	$-0x3, %edx
1454a94f5: 83 fa 03                    	cmpl	$0x3, %edx
1454a94f8: 49 83 d0 00                 	adcq	$0x0, %r8
1454a94fc: 48 83 c1 48                 	addq	$0x48, %rcx
1454a9500: 48 ff c8                    	decq	%rax
1454a9503: 75 eb                       	jne	0x1454a94f0 <.text+0x54a84f0>
1454a9505: 49 83 f8 01                 	cmpq	$0x1, %r8
1454a9509: 0f 87 cd 00 00 00           	ja	0x1454a95dc <.text+0x54a85dc>
1454a950f: 49 8b 95 80 08 00 00        	movq	0x880(%r13), %rdx
1454a9516: 49 8b 85 88 08 00 00        	movq	0x888(%r13), %rax
1454a951d: 4d 8b 85 98 08 00 00        	movq	0x898(%r13), %r8
1454a9524: 49 8b 8d 90 08 00 00        	movq	0x890(%r13), %rcx
1454a952b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454a9530: 4e 8d 0c 02                 	leaq	(%rdx,%r8), %r9
1454a9534: 49 c1 c1 17                 	rolq	$0x17, %r9
1454a9538: 49 01 d1                    	addq	%rdx, %r9
1454a953b: 49 89 c2                    	movq	%rax, %r10
1454a953e: 49 c1 e2 11                 	shlq	$0x11, %r10
1454a9542: 48 31 d1                    	xorq	%rdx, %rcx
1454a9545: 49 31 c0                    	xorq	%rax, %r8
1454a9548: 48 31 c8                    	xorq	%rcx, %rax
1454a954b: 4c 31 c2                    	xorq	%r8, %rdx
1454a954e: 4c 31 d1                    	xorq	%r10, %rcx
1454a9551: 49 c1 c0 2d                 	rolq	$0x2d, %r8
1454a9555: 49 c1 e9 20                 	shrq	$0x20, %r9
1454a9559: 4b 8d 3c 49                 	leaq	(%r9,%r9,2), %rdi
1454a955d: 41 89 f9                    	movl	%edi, %r9d
1454a9560: 41 f7 d1                    	notl	%r9d
1454a9563: 41 f7 c1 00 00 00 c0        	testl	$0xc0000000, %r9d       # imm = 0xC0000000
1454a956a: 74 c4                       	je	0x1454a9530 <.text+0x54a8530>
1454a956c: 49 89 95 80 08 00 00        	movq	%rdx, 0x880(%r13)
1454a9573: 4d 89 85 98 08 00 00        	movq	%r8, 0x898(%r13)
1454a957a: 49 89 85 88 08 00 00        	movq	%rax, 0x888(%r13)
1454a9581: 49 89 8d 90 08 00 00        	movq	%rcx, 0x890(%r13)
1454a9588: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a958f: 66 0f 6e 15 f9 a6 48 00     	movd	0x48a6f9(%rip), %xmm2   # 0x145933c90
1454a9597: 66 0f 6e 1d e1 d0 44 00     	movd	0x44d0e1(%rip), %xmm3   # 0x1458f6680
1454a959f: 4c 89 ea                    	movq	%r13, %rdx
1454a95a2: e8 79 94 01 00              	callq	0x1454c2a20 <.text+0x54c1a20>
1454a95a7: 90                          	nop
1454a95a8: 48 c1 ef 20                 	shrq	$0x20, %rdi
1454a95ac: 31 c0                       	xorl	%eax, %eax
1454a95ae: 48 83 ff 01                 	cmpq	$0x1, %rdi
1454a95b2: 0f 94 c0                    	sete	%al
1454a95b5: 83 f0 05                    	xorl	$0x5, %eax
1454a95b8: 48 85 ff                    	testq	%rdi, %rdi
1454a95bb: ba 03 00 00 00              	movl	$0x3, %edx
1454a95c0: 0f 45 d0                    	cmovnel	%eax, %edx
1454a95c3: 4c 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %r9
1454a95ca: 4c 89 e9                    	movq	%r13, %rcx
1454a95cd: e8 3e eb 01 00              	callq	0x1454c8110 <.text+0x54c7110>
1454a95d2: 90                          	nop
1454a95d3: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a95dc: 41 0f 2e 85 2c 09 00 00     	ucomiss	0x92c(%r13), %xmm0
1454a95e4: 0f 82 25 01 00 00           	jb	0x1454a970f <.text+0x54a870f>
1454a95ea: f3 0f 58 05 22 2e 75 00     	addss	0x752e22(%rip), %xmm0   # 0x145bfc414
1454a95f2: f3 41 0f 11 85 2c 09 00 00  	movss	%xmm0, 0x92c(%r13)
1454a95fb: 49 8b 85 30 05 00 00        	movq	0x530(%r13), %rax
1454a9602: 48 85 c0                    	testq	%rax, %rax
1454a9605: 0f 84 cf 00 00 00           	je	0x1454a96da <.text+0x54a86da>
1454a960b: 49 8b 8d 28 05 00 00        	movq	0x528(%r13), %rcx
1454a9612: 48 83 f8 04                 	cmpq	$0x4, %rax
1454a9616: 73 0a                       	jae	0x1454a9622 <.text+0x54a8622>
1454a9618: 31 d2                       	xorl	%edx, %edx
1454a961a: 45 31 c0                    	xorl	%r8d, %r8d
1454a961d: e9 8f 00 00 00              	jmp	0x1454a96b1 <.text+0x54a86b1>
1454a9622: 48 89 c2                    	movq	%rax, %rdx
1454a9625: 48 83 e2 fc                 	andq	$-0x4, %rdx
1454a9629: 4c 8d 81 f8 00 00 00        	leaq	0xf8(%rcx), %r8
1454a9630: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a9633: 66 0f 6f 0d 05 0e 50 01     	movdqa	0x1500e05(%rip), %xmm1  # 0x1469aa440
1454a963b: 66 0f 6f 15 9d 34 45 00     	movdqa	0x45349d(%rip), %xmm2   # 0x1458fcae0
1454a9643: 49 89 d1                    	movq	%rdx, %r9
1454a9646: 66 0f ef db                 	pxor	%xmm3, %xmm3
1454a964a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454a9650: 66 41 0f 6e a0 70 ff ff ff  	movd	-0x90(%r8), %xmm4
1454a9659: 66 41 0f 6e a8 28 ff ff ff  	movd	-0xd8(%r8), %xmm5
1454a9662: 66 0f 6c ec                 	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
1454a9666: 66 41 0f 6e 20              	movd	(%r8), %xmm4
1454a966b: 66 41 0f 6e 70 b8           	movd	-0x48(%r8), %xmm6
1454a9671: 66 0f 6c f4                 	punpcklqdq	%xmm4, %xmm6    # xmm6 = xmm6[0],xmm4[0]
1454a9675: 66 0f 76 e9                 	pcmpeqd	%xmm1, %xmm5
1454a9679: 66 0f db ea                 	pand	%xmm2, %xmm5
1454a967d: 66 0f d4 dd                 	paddq	%xmm5, %xmm3
1454a9681: 66 0f 76 f1                 	pcmpeqd	%xmm1, %xmm6
1454a9685: 66 0f db f2                 	pand	%xmm2, %xmm6
1454a9689: 66 0f d4 c6                 	paddq	%xmm6, %xmm0
1454a968d: 49 81 c0 20 01 00 00        	addq	$0x120, %r8             # imm = 0x120
1454a9694: 49 83 c1 fc                 	addq	$-0x4, %r9
1454a9698: 75 b6                       	jne	0x1454a9650 <.text+0x54a8650>
1454a969a: 66 0f d4 c3                 	paddq	%xmm3, %xmm0
1454a969e: 66 0f 70 c8 ee              	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454a96a3: 66 0f d4 c8                 	paddq	%xmm0, %xmm1
1454a96a7: 66 49 0f 7e c8              	movq	%xmm1, %r8
1454a96ac: 48 39 d0                    	cmpq	%rdx, %rax
1454a96af: 74 23                       	je	0x1454a96d4 <.text+0x54a86d4>
1454a96b1: 48 29 d0                    	subq	%rdx, %rax
1454a96b4: 48 8d 14 d2                 	leaq	(%rdx,%rdx,8), %rdx
1454a96b8: 48 8d 0c d1                 	leaq	(%rcx,%rdx,8), %rcx
1454a96bc: 48 83 c1 20                 	addq	$0x20, %rcx
1454a96c0: 31 d2                       	xorl	%edx, %edx
1454a96c2: 83 39 02                    	cmpl	$0x2, (%rcx)
1454a96c5: 0f 94 c2                    	sete	%dl
1454a96c8: 49 01 d0                    	addq	%rdx, %r8
1454a96cb: 48 83 c1 48                 	addq	$0x48, %rcx
1454a96cf: 48 ff c8                    	decq	%rax
1454a96d2: 75 ec                       	jne	0x1454a96c0 <.text+0x54a86c0>
1454a96d4: 49 83 f8 02                 	cmpq	$0x2, %r8
1454a96d8: 77 35                       	ja	0x1454a970f <.text+0x54a870f>
1454a96da: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a96e1: 66 0f 6e 15 a7 f8 44 00     	movd	0x44f8a7(%rip), %xmm2   # 0x1458f8f90
1454a96e9: 66 0f 6e 1d c3 e1 51 00     	movd	0x51e1c3(%rip), %xmm3   # 0x1459c78b4
1454a96f1: 4c 89 ea                    	movq	%r13, %rdx
1454a96f4: e8 27 93 01 00              	callq	0x1454c2a20 <.text+0x54c1a20>
1454a96f9: 90                          	nop
1454a96fa: 4c 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %r9
1454a9701: 4c 89 e9                    	movq	%r13, %rcx
1454a9704: ba 02 00 00 00              	movl	$0x2, %edx
1454a9709: e8 02 ea 01 00              	callq	0x1454c8110 <.text+0x54c7110>
1454a970e: 90                          	nop
1454a970f: 49 8b b5 88 06 00 00        	movq	0x688(%r13), %rsi
1454a9716: 48 85 f6                    	testq	%rsi, %rsi
1454a9719: 0f 84 9e 00 00 00           	je	0x1454a97bd <.text+0x54a87bd>
1454a971f: 49 8b 8d 80 06 00 00        	movq	0x680(%r13), %rcx
1454a9726: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a972f: 0f 2e 41 04                 	ucomiss	0x4(%rcx), %xmm0
1454a9733: 0f 82 84 00 00 00           	jb	0x1454a97bd <.text+0x54a87bd>
1454a9739: 48 8d 51 08                 	leaq	0x8(%rcx), %rdx
1454a973d: 4c 8d 04 f5 f8 ff ff ff     	leaq	-0x8(,%rsi,8), %r8
1454a9745: 48 ff ce                    	decq	%rsi
1454a9748: e8 84 d6 2a 00              	callq	0x145756dd1 <.text+0x5755dd1>
1454a974d: 49 89 b5 88 06 00 00        	movq	%rsi, 0x688(%r13)
1454a9754: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a975b: f3 0f 10 15 39 e2 51 00     	movss	0x51e239(%rip), %xmm2   # 0x1459c799c
1454a9763: f3 0f 10 1d 49 e1 51 00     	movss	0x51e149(%rip), %xmm3   # 0x1459c78b4
1454a976b: 4c 89 ea                    	movq	%r13, %rdx
1454a976e: e8 ad 92 01 00              	callq	0x1454c2a20 <.text+0x54c1a20>
1454a9773: 90                          	nop
1454a9774: 4c 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %r9
1454a977b: 4c 89 e9                    	movq	%r13, %rcx
1454a977e: ba 06 00 00 00              	movl	$0x6, %edx
1454a9783: e8 88 e9 01 00              	callq	0x1454c8110 <.text+0x54c7110>
1454a9788: 90                          	nop
1454a9789: 48 8d 3d 8e 20 50 01        	leaq	0x150208e(%rip), %rdi   # 0x1469ab81e
1454a9790: be 34 00 00 00              	movl	$0x34, %esi
1454a9795: ba 34 00 00 00              	movl	$0x34, %edx
1454a979a: 48 89 f9                    	movq	%rdi, %rcx
1454a979d: e8 5e 8c fa ff              	callq	0x145452400 <.text+0x5451400>
1454a97a2: 90                          	nop
1454a97a3: 49 89 d0                    	movq	%rdx, %r8
1454a97a6: 48 85 c0                    	testq	%rax, %rax
1454a97a9: 48 0f 45 f8                 	cmovneq	%rax, %rdi
1454a97ad: 4c 0f 44 c6                 	cmoveq	%rsi, %r8
1454a97b1: 4c 89 e9                    	movq	%r13, %rcx
1454a97b4: 48 89 fa                    	movq	%rdi, %rdx
1454a97b7: e8 d4 89 02 00              	callq	0x1454d2190 <.text+0x54d1190>
1454a97bc: 90                          	nop
1454a97bd: 48 8b 95 b0 02 00 00        	movq	0x2b0(%rbp), %rdx
1454a97c4: 48 85 d2                    	testq	%rdx, %rdx
1454a97c7: 74 16                       	je	0x1454a97df <.text+0x54a87df>
1454a97c9: 48 8b 8d b8 02 00 00        	movq	0x2b8(%rbp), %rcx
1454a97d0: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454a97d4: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454a97da: e8 f1 89 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a97df: 41 80 bd 58 09 00 00 00     	cmpb	$0x0, 0x958(%r13)
1454a97e7: 0f 85 16 09 00 00           	jne	0x1454aa103 <.text+0x54a9103>
1454a97ed: 49 8b 8d 90 05 00 00        	movq	0x590(%r13), %rcx
1454a97f4: 48 85 c9                    	testq	%rcx, %rcx
1454a97f7: 0f 84 e8 05 00 00           	je	0x1454a9de5 <.text+0x54a8de5>
1454a97fd: 49 8d 85 c0 04 00 00        	leaq	0x4c0(%r13), %rax
1454a9804: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a980b: 45 31 f6                    	xorl	%r14d, %r14d
1454a980e: f3 44 0f 10 0d e5 1c 44 00  	movss	0x441ce5(%rip), %xmm9   # 0x1458eb4fc
1454a9817: f3 44 0f 10 15 f4 37 44 00  	movss	0x4437f4(%rip), %xmm10  # 0x1458ed014
1454a9820: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a9824: 48 89 8d 48 03 00 00        	movq	%rcx, 0x348(%rbp)
1454a982b: eb 4f                       	jmp	0x1454a987c <.text+0x54a887c>
1454a982d: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454a9834: 48 89 f1                    	movq	%rsi, %rcx
1454a9837: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454a983b: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454a9842: f3 0f 6f 8d b0 00 00 00     	movdqu	0xb0(%rbp), %xmm1
1454a984a: f3 0f 7f 4c 08 10           	movdqu	%xmm1, 0x10(%rax,%rcx)
1454a9850: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454a9854: 48 ff c6                    	incq	%rsi
1454a9857: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454a985e: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a9865: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454a9870: 49 ff c6                    	incq	%r14
1454a9873: 49 39 ce                    	cmpq	%rcx, %r14
1454a9876: 0f 84 60 05 00 00           	je	0x1454a9ddc <.text+0x54a8ddc>
1454a987c: 49 8b 95 90 05 00 00        	movq	0x590(%r13), %rdx
1454a9883: 49 39 d6                    	cmpq	%rdx, %r14
1454a9886: 0f 83 2c 13 00 00           	jae	0x1454aabb8 <.text+0x54a9bb8>
1454a988c: 49 8b 85 88 05 00 00        	movq	0x588(%r13), %rax
1454a9893: 4b 8d 14 b6                 	leaq	(%r14,%r14,4), %rdx
1454a9897: 48 83 3c d0 00              	cmpq	$0x0, (%rax,%rdx,8)
1454a989c: 75 d2                       	jne	0x1454a9870 <.text+0x54a8870>
1454a989e: 48 8d 34 d0                 	leaq	(%rax,%rdx,8), %rsi
1454a98a2: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a98ab: 0f 2e 46 24                 	ucomiss	0x24(%rsi), %xmm0
1454a98af: 72 bf                       	jb	0x1454a9870 <.text+0x54a8870>
1454a98b1: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
1454a98b8: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
1454a98bf: e8 5c 4f f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a98c4: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1454a98cb: 8b 4e 20                    	movl	0x20(%rsi), %ecx
1454a98ce: 89 4d 40                    	movl	%ecx, 0x40(%rbp)
1454a98d1: 48 8b 4e 18                 	movq	0x18(%rsi), %rcx
1454a98d5: 48 89 4d 38                 	movq	%rcx, 0x38(%rbp)
1454a98d9: 48 8b 7e 10                 	movq	0x10(%rsi), %rdi
1454a98dd: 4a 8b 94 20 80 00 00 00     	movq	0x80(%rax,%r12), %rdx
1454a98e5: 48 39 d7                    	cmpq	%rdx, %rdi
1454a98e8: 0f 83 df 13 00 00           	jae	0x1454aaccd <.text+0x54a9ccd>
1454a98ee: 4c 89 ee                    	movq	%r13, %rsi
1454a98f1: 4c 01 e0                    	addq	%r12, %rax
1454a98f4: 4c 8b 68 78                 	movq	0x78(%rax), %r13
1454a98f8: 48 8d 1c bf                 	leaq	(%rdi,%rdi,4), %rbx
1454a98fc: 48 c1 e3 04                 	shlq	$0x4, %rbx
1454a9900: 4a 8d 04 2b                 	leaq	(%rbx,%r13), %rax
1454a9904: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454a990b: 48 89 f1                    	movq	%rsi, %rcx
1454a990e: 48 89 fa                    	movq	%rdi, %rdx
1454a9911: e8 da 60 04 00              	callq	0x1454ef9f0 <.text+0x54ee9f0>
1454a9916: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454a9919: 48 89 f1                    	movq	%rsi, %rcx
1454a991c: 48 89 fa                    	movq	%rdi, %rdx
1454a991f: e8 cc 64 04 00              	callq	0x1454efdf0 <.text+0x54eedf0>
1454a9924: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454a9927: f3 45 0f 10 6c 1d 28        	movss	0x28(%r13,%rbx), %xmm13
1454a992e: f3 44 0f 59 2d 19 0b 50 01  	mulss	0x1500b19(%rip), %xmm13 # 0x1469aa450
1454a9937: 45 8b 44 1d 20              	movl	0x20(%r13,%rbx), %r8d
1454a993c: 44 8b be 04 09 00 00        	movl	0x904(%rsi), %r15d
1454a9943: 41 ff c7                    	incl	%r15d
1454a9946: 44 89 be 04 09 00 00        	movl	%r15d, 0x904(%rsi)
1454a994d: 44 89 c0                    	movl	%r8d, %eax
1454a9950: 25 ff ff ff 00              	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454a9955: 48 c1 e0 18                 	shlq	$0x18, %rax
1454a9959: 41 81 e7 ff ff ff 00        	andl	$0xffffff, %r15d        # imm = 0xFFFFFF
1454a9960: 49 09 c7                    	orq	%rax, %r15
1454a9963: 48 b8 00 00 00 00 00 00 30 f1       	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454a996d: 49 09 c7                    	orq	%rax, %r15
1454a9970: 45 8b 4c 1d 24              	movl	0x24(%r13,%rbx), %r9d
1454a9975: 48 8d 45 38                 	leaq	0x38(%rbp), %rax
1454a9979: 48 89 44 24 38              	movq	%rax, 0x38(%rsp)
1454a997e: f3 0f 11 74 24 28           	movss	%xmm6, 0x28(%rsp)
1454a9984: f3 44 0f 11 6c 24 20        	movss	%xmm13, 0x20(%rsp)
1454a998b: c6 44 24 30 01              	movb	$0x1, 0x30(%rsp)
1454a9990: 48 89 f1                    	movq	%rsi, %rcx
1454a9993: 4c 89 fa                    	movq	%r15, %rdx
1454a9996: e8 85 6e 01 00              	callq	0x1454c0820 <.text+0x54bf820>
1454a999b: f3 44 0f 10 b6 e4 08 00 00  	movss	0x8e4(%rsi), %xmm14
1454a99a4: f3 45 0f 10 7c 1d 38        	movss	0x38(%r13,%rbx), %xmm15
1454a99ab: f3 45 0f 10 44 1d 3c        	movss	0x3c(%r13,%rbx), %xmm8
1454a99b2: 41 0f b6 5c 1d 4c           	movzbl	0x4c(%r13,%rbx), %ebx
1454a99b8: 0f b7 be 36 02 00 00        	movzwl	0x236(%rsi), %edi
1454a99bf: 4c 8b 86 80 08 00 00        	movq	0x880(%rsi), %r8
1454a99c6: 48 8b 96 98 08 00 00        	movq	0x898(%rsi), %rdx
1454a99cd: 48 8b 8e 88 08 00 00        	movq	0x888(%rsi), %rcx
1454a99d4: 48 8b 86 90 08 00 00        	movq	0x890(%rsi), %rax
1454a99db: 49 89 f5                    	movq	%rsi, %r13
1454a99de: 66 90                       	nop
1454a99e0: 4d 8d 0c 10                 	leaq	(%r8,%rdx), %r9
1454a99e4: 49 c1 c1 17                 	rolq	$0x17, %r9
1454a99e8: 4d 01 c1                    	addq	%r8, %r9
1454a99eb: 49 89 ca                    	movq	%rcx, %r10
1454a99ee: 49 c1 e2 11                 	shlq	$0x11, %r10
1454a99f2: 4c 31 c0                    	xorq	%r8, %rax
1454a99f5: 48 31 ca                    	xorq	%rcx, %rdx
1454a99f8: 48 31 c1                    	xorq	%rax, %rcx
1454a99fb: 49 31 d0                    	xorq	%rdx, %r8
1454a99fe: 48 c1 c2 2d                 	rolq	$0x2d, %rdx
1454a9a02: 4c 31 d0                    	xorq	%r10, %rax
1454a9a05: 49 c1 e9 29                 	shrq	$0x29, %r9
1454a9a09: 41 81 c9 00 00 80 3f        	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454a9a10: 66 45 0f 6e e1              	movd	%r9d, %xmm12
1454a9a15: f3 45 0f 58 e1              	addss	%xmm9, %xmm12
1454a9a1a: f3 45 0f 59 e2              	mulss	%xmm10, %xmm12
1454a9a1f: 45 0f 2e d4                 	ucomiss	%xmm12, %xmm10
1454a9a23: 76 bb                       	jbe	0x1454a99e0 <.text+0x54a89e0>
1454a9a25: 4d 89 85 80 08 00 00        	movq	%r8, 0x880(%r13)
1454a9a2c: 49 89 95 98 08 00 00        	movq	%rdx, 0x898(%r13)
1454a9a33: 49 89 8d 88 08 00 00        	movq	%rcx, 0x888(%r13)
1454a9a3a: 49 89 85 90 08 00 00        	movq	%rax, 0x890(%r13)
1454a9a41: e8 ba 87 b5 fa              	callq	0x140002200 <.text+0x1200>
1454a9a46: b9 0c 00 00 00              	movl	$0xc, %ecx
1454a9a4b: ba 04 00 00 00              	movl	$0x4, %edx
1454a9a50: e8 6b 87 b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454a9a55: 48 85 c0                    	testq	%rax, %rax
1454a9a58: 0f 84 91 12 00 00           	je	0x1454aacef <.text+0x54a9cef>
1454a9a5e: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a9a61: f3 44 0f 58 e0              	addss	%xmm0, %xmm12
1454a9a66: 0f b7 cf                    	movzwl	%di, %ecx
1454a9a69: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454a9a6c: f3 0f 2a c1                 	cvtsi2ss	%ecx, %xmm0
1454a9a70: f3 0f 5e 05 b4 1a 44 00     	divss	0x441ab4(%rip), %xmm0   # 0x1458eb52c
1454a9a78: f3 44 0f 59 c0              	mulss	%xmm0, %xmm8
1454a9a7d: 41 0f 28 cd                 	movaps	%xmm13, %xmm1
1454a9a81: f3 0f 59 0d 63 33 45 00     	mulss	0x453363(%rip), %xmm1   # 0x1458fcdec
1454a9a89: f3 0f 58 0d 47 7c 56 00     	addss	0x567c47(%rip), %xmm1   # 0x145a116d8
1454a9a91: 41 0f 28 c7                 	movaps	%xmm15, %xmm0
1454a9a95: f3 0f 59 05 eb 19 44 00     	mulss	0x4419eb(%rip), %xmm0   # 0x1458eb488
1454a9a9d: f3 0f 7e 15 bb 09 50 01     	movq	0x15009bb(%rip), %xmm2  # 0x1469aa460
1454a9aa5: 66 0f d6 10                 	movq	%xmm2, (%rax)
1454a9aa9: c7 40 08 00 00 00 41        	movl	$0x41000000, 0x8(%rax)  # imm = 0x41000000
1454a9ab0: 48 c7 85 a0 00 00 00 00 00 00 00    	movq	$0x0, 0xa0(%rbp)
1454a9abb: 48 c7 85 a8 00 00 00 08 00 00 00    	movq	$0x8, 0xa8(%rbp)
1454a9ac6: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a9ad1: 48 c7 85 b8 00 00 00 ff ff ff ff    	movq	$-0x1, 0xb8(%rbp)
1454a9adc: 48 c7 85 e0 00 00 00 03 00 00 00    	movq	$0x3, 0xe0(%rbp)
1454a9ae7: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454a9aee: 48 c7 85 f0 00 00 00 03 00 00 00    	movq	$0x3, 0xf0(%rbp)
1454a9af9: 4c 89 b5 f8 00 00 00        	movq	%r14, 0xf8(%rbp)
1454a9b00: c6 85 00 01 00 00 00        	movb	$0x0, 0x100(%rbp)
1454a9b07: c7 85 08 01 00 00 00 00 00 00       	movl	$0x0, 0x108(%rbp)
1454a9b11: c7 85 10 01 00 00 00 00 00 00       	movl	$0x0, 0x110(%rbp)
1454a9b1b: c7 85 18 01 00 00 00 00 00 00       	movl	$0x0, 0x118(%rbp)
1454a9b25: 4c 89 bd 28 01 00 00        	movq	%r15, 0x128(%rbp)
1454a9b2c: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
1454a9b33: 48 89 85 30 01 00 00        	movq	%rax, 0x130(%rbp)
1454a9b3a: 48 8d 8d 38 01 00 00        	leaq	0x138(%rbp), %rcx
1454a9b41: 44 0f 11 59 40              	movups	%xmm11, 0x40(%rcx)
1454a9b46: 44 0f 11 59 30              	movups	%xmm11, 0x30(%rcx)
1454a9b4b: 44 0f 11 59 20              	movups	%xmm11, 0x20(%rcx)
1454a9b50: 44 0f 11 59 10              	movups	%xmm11, 0x10(%rcx)
1454a9b55: 44 0f 11 19                 	movups	%xmm11, (%rcx)
1454a9b59: 48 c7 41 50 00 00 00 00     	movq	$0x0, 0x50(%rcx)
1454a9b61: f3 0f 11 b5 90 01 00 00     	movss	%xmm6, 0x190(%rbp)
1454a9b69: f3 0f 11 b5 94 01 00 00     	movss	%xmm6, 0x194(%rbp)
1454a9b71: f3 0f 11 bd 98 01 00 00     	movss	%xmm7, 0x198(%rbp)
1454a9b79: f3 44 0f 11 85 9c 01 00 00  	movss	%xmm8, 0x19c(%rbp)
1454a9b82: f3 44 0f 11 bd a0 01 00 00  	movss	%xmm15, 0x1a0(%rbp)
1454a9b8b: f3 0f 11 8d a4 01 00 00     	movss	%xmm1, 0x1a4(%rbp)
1454a9b93: f3 44 0f 11 ad a8 01 00 00  	movss	%xmm13, 0x1a8(%rbp)
1454a9b9c: 8b 45 40                    	movl	0x40(%rbp), %eax
1454a9b9f: 89 41 7c                    	movl	%eax, 0x7c(%rcx)
1454a9ba2: 48 8b 45 38                 	movq	0x38(%rbp), %rax
1454a9ba6: 48 89 41 74                 	movq	%rax, 0x74(%rcx)
1454a9baa: 8b 45 40                    	movl	0x40(%rbp), %eax
1454a9bad: 89 81 88 00 00 00           	movl	%eax, 0x88(%rcx)
1454a9bb3: 48 8b 45 38                 	movq	0x38(%rbp), %rax
1454a9bb7: 48 89 81 80 00 00 00        	movq	%rax, 0x80(%rcx)
1454a9bbe: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454a9bc1: f3 41 0f 10 ce              	movss	%xmm14, %xmm1           # xmm1 = xmm14[0],xmm1[1,2,3]
1454a9bc6: 0f 13 8d c4 01 00 00        	movlps	%xmm1, 0x1c4(%rbp)
1454a9bcd: f3 44 0f 11 b5 cc 01 00 00  	movss	%xmm14, 0x1cc(%rbp)
1454a9bd6: f3 0f 11 85 d0 01 00 00     	movss	%xmm0, 0x1d0(%rbp)
1454a9bde: 44 0f 11 99 ac 00 00 00     	movups	%xmm11, 0xac(%rcx)
1454a9be6: 44 0f 11 99 9c 00 00 00     	movups	%xmm11, 0x9c(%rcx)
1454a9bee: f3 44 0f 11 a5 f4 01 00 00  	movss	%xmm12, 0x1f4(%rbp)
1454a9bf7: 88 9d f8 01 00 00           	movb	%bl, 0x1f8(%rbp)
1454a9bfd: 49 8b bd d0 04 00 00        	movq	0x4d0(%r13), %rdi
1454a9c04: 49 3b bd c0 04 00 00        	cmpq	0x4c0(%r13), %rdi
1454a9c0b: 75 0d                       	jne	0x1454a9c1a <.text+0x54a8c1a>
1454a9c0d: 48 8b 8d 38 03 00 00        	movq	0x338(%rbp), %rcx
1454a9c14: e8 97 1a 36 00              	callq	0x14580b6b0 <.text+0x580a6b0>
1454a9c19: 90                          	nop
1454a9c1a: 48 69 cf 60 01 00 00        	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454a9c21: 49 03 8d c8 04 00 00        	addq	0x4c8(%r13), %rcx
1454a9c28: 41 b8 60 01 00 00           	movl	$0x160, %r8d            # imm = 0x160
1454a9c2e: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a9c35: e8 a3 d1 2a 00              	callq	0x145756ddd <.text+0x5755ddd>
1454a9c3a: 48 ff c7                    	incq	%rdi
1454a9c3d: 49 89 bd d0 04 00 00        	movq	%rdi, 0x4d0(%r13)
1454a9c44: 49 8b 95 90 05 00 00        	movq	0x590(%r13), %rdx
1454a9c4b: 49 39 d6                    	cmpq	%rdx, %r14
1454a9c4e: 0f 83 8a 10 00 00           	jae	0x1454aacde <.text+0x54a9cde>
1454a9c54: 49 8b 85 88 05 00 00        	movq	0x588(%r13), %rax
1454a9c5b: 4b 8d 34 b6                 	leaq	(%r14,%r14,4), %rsi
1454a9c5f: 48 c7 04 f0 01 00 00 00     	movq	$0x1, (%rax,%rsi,8)
1454a9c67: 4c 89 7c f0 08              	movq	%r15, 0x8(%rax,%rsi,8)
1454a9c6c: 49 c7 45 00 00 00 00 00     	movq	$0x0, (%r13)
1454a9c74: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a9c7d: 0f 2e 05 cc df 51 00        	ucomiss	0x51dfcc(%rip), %xmm0   # 0x1459c7c50
1454a9c84: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454a9c8b: 0f 86 df fb ff ff           	jbe	0x1454a9870 <.text+0x54a8870>
1454a9c91: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
1454a9c98: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
1454a9c9f: e8 7c 4b f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a9ca4: 49 8b 95 90 05 00 00        	movq	0x590(%r13), %rdx
1454a9cab: 49 39 d6                    	cmpq	%rdx, %r14
1454a9cae: 0f 83 93 11 00 00           	jae	0x1454aae47 <.text+0x54a9e47>
1454a9cb4: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1454a9cbb: 4c 01 e0                    	addq	%r12, %rax
1454a9cbe: 49 8b 8d 88 05 00 00        	movq	0x588(%r13), %rcx
1454a9cc5: 48 8b 4c f1 10              	movq	0x10(%rcx,%rsi,8), %rcx
1454a9cca: 48 8b 90 80 00 00 00        	movq	0x80(%rax), %rdx
1454a9cd1: 48 39 d1                    	cmpq	%rdx, %rcx
1454a9cd4: 0f 83 7e 11 00 00           	jae	0x1454aae58 <.text+0x54a9e58>
1454a9cda: 48 8b 70 78                 	movq	0x78(%rax), %rsi
1454a9cde: 48 8d 3c 89                 	leaq	(%rcx,%rcx,4), %rdi
1454a9ce2: 48 c1 e7 04                 	shlq	$0x4, %rdi
1454a9ce6: 48 8d 04 3e                 	leaq	(%rsi,%rdi), %rax
1454a9cea: 48 83 c0 20                 	addq	$0x20, %rax
1454a9cee: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
1454a9cf5: 48 8d 05 44 43 27 00        	leaq	0x274344(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9cfc: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
1454a9d03: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a9d0a: 48 8d 15 55 4c 26 01        	leaq	0x1264c55(%rip), %rdx   # 0x14670e966
1454a9d11: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
1454a9d18: e8 63 22 26 00              	callq	0x14570bf80 <.text+0x570af80>
1454a9d1d: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a9d24: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1454a9d2b: 48 8b 5c 3e 10              	movq	0x10(%rsi,%rdi), %rbx
1454a9d30: 4c 8b 6c 3e 18              	movq	0x18(%rsi,%rdi), %r13
1454a9d35: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
1454a9d3c: e8 bf 86 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a9d41: 90                          	nop
1454a9d42: 48 89 c7                    	movq	%rax, %rdi
1454a9d45: 49 89 d7                    	movq	%rdx, %r15
1454a9d48: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a9d4f: 48 85 d2                    	testq	%rdx, %rdx
1454a9d52: 74 12                       	je	0x1454a9d66 <.text+0x54a8d66>
1454a9d54: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a9d5a: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a9d61: e8 6a 84 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a9d66: 48 85 ff                    	testq	%rdi, %rdi
1454a9d69: 48 0f 45 df                 	cmovneq	%rdi, %rbx
1454a9d6d: 4d 0f 44 fd                 	cmoveq	%r13, %r15
1454a9d71: ba 1d 00 00 00              	movl	$0x1d, %edx
1454a9d76: 48 8d 35 ab 2a 50 01        	leaq	0x1502aab(%rip), %rsi   # 0x1469ac828
1454a9d7d: 48 89 f1                    	movq	%rsi, %rcx
1454a9d80: e8 7b 86 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a9d85: 48 85 c0                    	testq	%rax, %rax
1454a9d88: 48 0f 44 c6                 	cmoveq	%rsi, %rax
1454a9d8c: b9 1d 00 00 00              	movl	$0x1d, %ecx
1454a9d91: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
1454a9d95: 48 89 54 24 20              	movq	%rdx, 0x20(%rsp)
1454a9d9a: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a9da1: 48 89 da                    	movq	%rbx, %rdx
1454a9da4: 4d 89 f8                    	movq	%r15, %r8
1454a9da7: 49 89 c1                    	movq	%rax, %r9
1454a9daa: e8 91 58 f9 ff              	callq	0x14543f640 <.text+0x543e640>
1454a9daf: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454a9db6: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454a9dbd: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454a9dc4: 0f 85 63 fa ff ff           	jne	0x1454a982d <.text+0x54a882d>
1454a9dca: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454a9dd1: e8 da e2 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454a9dd6: 90                          	nop
1454a9dd7: e9 51 fa ff ff              	jmp	0x1454a982d <.text+0x54a882d>
1454a9ddc: 4d 8b 8d 90 05 00 00        	movq	0x590(%r13), %r9
1454a9de3: eb 03                       	jmp	0x1454a9de8 <.text+0x54a8de8>
1454a9de5: 45 31 c9                    	xorl	%r9d, %r9d
1454a9de8: f2 41 0f 10 85 e8 03 00 00  	movsd	0x3e8(%r13), %xmm0
1454a9df1: 4d 8b b5 88 05 00 00        	movq	0x588(%r13), %r14
1454a9df8: 4a 8d 04 cd 00 00 00 00     	leaq	(,%r9,8), %rax
1454a9e00: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
1454a9e04: 45 31 c0                    	xorl	%r8d, %r8d
1454a9e07: 31 c9                       	xorl	%ecx, %ecx
1454a9e09: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454a9e10: 48 39 c8                    	cmpq	%rcx, %rax
1454a9e13: 0f 84 a9 00 00 00           	je	0x1454a9ec2 <.text+0x54a8ec2>
1454a9e19: 48 8d 51 28                 	leaq	0x28(%rcx), %rdx
1454a9e1d: 49 ff c8                    	decq	%r8
1454a9e20: 49 83 3c 0e 00              	cmpq	$0x0, (%r14,%rcx)
1454a9e25: 48 89 d1                    	movq	%rdx, %rcx
1454a9e28: 74 e6                       	je	0x1454a9e10 <.text+0x54a8e10>
1454a9e2a: 4c 89 c1                    	movq	%r8, %rcx
1454a9e2d: 48 f7 d1                    	notq	%rcx
1454a9e30: 48 29 d0                    	subq	%rdx, %rax
1454a9e33: 0f 84 9e 00 00 00           	je	0x1454a9ed7 <.text+0x54a8ed7>
1454a9e39: 4d 8d 14 16                 	leaq	(%r14,%rdx), %r10
1454a9e3d: 4d 8d 1c 16                 	leaq	(%r14,%rdx), %r11
1454a9e41: 49 83 c3 d8                 	addq	$-0x28, %r11
1454a9e45: 48 ba cd cc cc cc cc cc cc cc       	movabsq	$-0x3333333333333333, %rdx # imm = 0xCCCCCCCCCCCCCCCD
1454a9e4f: 48 f7 e2                    	mulq	%rdx
1454a9e52: 48 c1 ea 05                 	shrq	$0x5, %rdx
1454a9e56: 49 f7 d8                    	negq	%r8
1454a9e59: 31 c0                       	xorl	%eax, %eax
1454a9e5b: eb 0f                       	jmp	0x1454a9e6c <.text+0x54a8e6c>
1454a9e5d: 0f 1f 00                    	nopl	(%rax)
1454a9e60: 48 ff c0                    	incq	%rax
1454a9e63: 49 83 c2 28                 	addq	$0x28, %r10
1454a9e67: 48 39 c2                    	cmpq	%rax, %rdx
1454a9e6a: 74 6b                       	je	0x1454a9ed7 <.text+0x54a8ed7>
1454a9e6c: 49 83 3a 00                 	cmpq	$0x0, (%r10)
1454a9e70: 74 ee                       	je	0x1454a9e60 <.text+0x54a8e60>
1454a9e72: f2 41 0f 10 4b 18           	movsd	0x18(%r11), %xmm1
1454a9e78: 0f 5c c8                    	subps	%xmm0, %xmm1
1454a9e7b: 0f 59 c9                    	mulps	%xmm1, %xmm1
1454a9e7e: f2 41 0f 10 52 18           	movsd	0x18(%r10), %xmm2
1454a9e84: 0f 5c d0                    	subps	%xmm0, %xmm2
1454a9e87: 0f 59 d2                    	mulps	%xmm2, %xmm2
1454a9e8a: f2 0f 7c ca                 	haddps	%xmm2, %xmm1
1454a9e8e: 0f c6 c9 e8                 	shufps	$0xe8, %xmm1, %xmm1     # xmm1 = xmm1[0,2,2,3]
1454a9e92: 0f 51 c9                    	sqrtps	%xmm1, %xmm1
1454a9e95: 0f 28 d1                    	movaps	%xmm1, %xmm2
1454a9e98: 66 0f 72 e2 1f              	psrad	$0x1f, %xmm2
1454a9e9d: 66 0f 72 d2 01              	psrld	$0x1, %xmm2
1454a9ea2: 66 0f ef d1                 	pxor	%xmm1, %xmm2
1454a9ea6: 66 0f 70 ca 55              	pshufd	$0x55, %xmm2, %xmm1     # xmm1 = xmm2[1,1,1,1]
1454a9eab: 66 0f 66 d1                 	pcmpgtd	%xmm1, %xmm2
1454a9eaf: 66 0f 7e d6                 	movd	%xmm2, %esi
1454a9eb3: 40 f6 c6 01                 	testb	$0x1, %sil
1454a9eb7: 74 a7                       	je	0x1454a9e60 <.text+0x54a8e60>
1454a9eb9: 49 8d 0c 00                 	leaq	(%r8,%rax), %rcx
1454a9ebd: 4d 89 d3                    	movq	%r10, %r11
1454a9ec0: eb 9e                       	jmp	0x1454a9e60 <.text+0x54a8e60>
1454a9ec2: 4d 85 c9                    	testq	%r9, %r9
1454a9ec5: 0f 84 38 02 00 00           	je	0x1454aa103 <.text+0x54a9103>
1454a9ecb: 49 83 f9 01                 	cmpq	$0x1, %r9
1454a9ecf: 0f 85 28 0a 00 00           	jne	0x1454aa8fd <.text+0x54a98fd>
1454a9ed5: 31 c9                       	xorl	%ecx, %ecx
1454a9ed7: f3 41 0f 10 85 e4 08 00 00  	movss	0x8e4(%r13), %xmm0
1454a9ee0: 41 83 7d 00 01              	cmpl	$0x1, (%r13)
1454a9ee5: 75 1f                       	jne	0x1454a9f06 <.text+0x54a8f06>
1454a9ee7: 49 39 4d 08                 	cmpq	%rcx, 0x8(%r13)
1454a9eeb: 75 19                       	jne	0x1454a9f06 <.text+0x54a8f06>
1454a9eed: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454a9ef0: f3 41 0f 5c 8d fc 08 00 00  	subss	0x8fc(%r13), %xmm1
1454a9ef9: 0f 2e 0d 84 db 51 00        	ucomiss	0x51db84(%rip), %xmm1   # 0x1459c7a84
1454a9f00: 0f 86 fd 01 00 00           	jbe	0x1454aa103 <.text+0x54a9103>
1454a9f06: 49 c7 45 00 01 00 00 00     	movq	$0x1, (%r13)
1454a9f0e: 49 89 4d 08                 	movq	%rcx, 0x8(%r13)
1454a9f12: f3 41 0f 11 85 fc 08 00 00  	movss	%xmm0, 0x8fc(%r13)
1454a9f1b: 4c 39 c9                    	cmpq	%r9, %rcx
1454a9f1e: 0f 83 9c 0f 00 00           	jae	0x1454aaec0 <.text+0x54a9ec0>
1454a9f24: 4c 8d 3c 89                 	leaq	(%rcx,%rcx,4), %r15
1454a9f28: 49 8b 8d 10 02 00 00        	movq	0x210(%r13), %rcx
1454a9f2f: 49 8b 95 18 02 00 00        	movq	0x218(%r13), %rdx
1454a9f36: e8 e5 48 f6 ff              	callq	0x14540e820 <.text+0x540d820>
1454a9f3b: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1454a9f42: 4b 8b 4c fe 10              	movq	0x10(%r14,%r15,8), %rcx
1454a9f47: 4a 8b 94 20 80 00 00 00     	movq	0x80(%rax,%r12), %rdx
1454a9f4f: 48 39 d1                    	cmpq	%rdx, %rcx
1454a9f52: 0f 83 79 0f 00 00           	jae	0x1454aaed1 <.text+0x54a9ed1>
1454a9f58: 49 01 c4                    	addq	%rax, %r12
1454a9f5b: 49 8b 74 24 78              	movq	0x78(%r12), %rsi
1454a9f60: 48 8d 3c 89                 	leaq	(%rcx,%rcx,4), %rdi
1454a9f64: 48 c1 e7 04                 	shlq	$0x4, %rdi
1454a9f68: 48 8d 04 3e                 	leaq	(%rsi,%rdi), %rax
1454a9f6c: 48 83 c0 20                 	addq	$0x20, %rax
1454a9f70: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
1454a9f77: 48 8d 05 c2 40 27 00        	leaq	0x2740c2(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9f7e: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
1454a9f85: 48 8d 15 da 49 26 01        	leaq	0x12649da(%rip), %rdx   # 0x14670e966
1454a9f8c: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454a9f93: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
1454a9f9a: e8 e1 1f 26 00              	callq	0x14570bf80 <.text+0x570af80>
1454a9f9f: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1454a9fa6: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1454a9fad: 4c 8b 64 3e 10              	movq	0x10(%rsi,%rdi), %r12
1454a9fb2: 4c 8b 6c 3e 18              	movq	0x18(%rsi,%rdi), %r13
1454a9fb7: 48 89 8d 58 03 00 00        	movq	%rcx, 0x358(%rbp)
1454a9fbe: e8 3d 84 fa ff              	callq	0x145452400 <.text+0x5451400>
1454a9fc3: 90                          	nop
1454a9fc4: 48 89 c3                    	movq	%rax, %rbx
1454a9fc7: 48 89 d7                    	movq	%rdx, %rdi
1454a9fca: 4f 8d 34 fe                 	leaq	(%r14,%r15,8), %r14
1454a9fce: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
1454a9fd5: 48 85 d2                    	testq	%rdx, %rdx
1454a9fd8: 48 8d b5 d8 02 00 00        	leaq	0x2d8(%rbp), %rsi
1454a9fdf: 74 12                       	je	0x1454a9ff3 <.text+0x54a8ff3>
1454a9fe1: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a9fe7: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454a9fee: e8 dd 81 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a9ff3: 48 85 db                    	testq	%rbx, %rbx
1454a9ff6: 4c 0f 45 e3                 	cmovneq	%rbx, %r12
1454a9ffa: 49 0f 44 fd                 	cmoveq	%r13, %rdi
1454a9ffe: 4c 89 a5 d8 02 00 00        	movq	%r12, 0x2d8(%rbp)
1454aa005: 48 89 bd e0 02 00 00        	movq	%rdi, 0x2e0(%rbp)
1454aa00c: 49 83 3e 00                 	cmpq	$0x0, (%r14)
1454aa010: 74 1e                       	je	0x1454aa030 <.text+0x54a9030>
1454aa012: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454aa019: 48 8d 05 a0 80 b5 fa        	leaq	-0x54a7f60(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454aa020: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454aa027: 48 8d 15 92 27 50 01        	leaq	0x1502792(%rip), %rdx   # 0x1469ac7c0
1454aa02e: eb 1c                       	jmp	0x1454aa04c <.text+0x54a904c>
1454aa030: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454aa037: 48 8d 05 82 80 b5 fa        	leaq	-0x54a7f7e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454aa03e: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454aa045: 48 8d 15 82 27 50 01        	leaq	0x1502782(%rip), %rdx   # 0x1469ac7ce
1454aa04c: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454aa053: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
1454aa05a: e8 21 1f 26 00              	callq	0x14570bf80 <.text+0x570af80>
1454aa05f: 4c 8b ad 68 03 00 00        	movq	0x368(%rbp), %r13
1454aa066: f3 41 0f 10 4e 18           	movss	0x18(%r14), %xmm1
1454aa06c: f3 41 0f 10 56 1c           	movss	0x1c(%r14), %xmm2
1454aa072: 4c 8b 8d 38 02 00 00        	movq	0x238(%rbp), %r9
1454aa079: 48 8b 85 40 02 00 00        	movq	0x240(%rbp), %rax
1454aa080: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454aa085: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454aa08c: 4c 89 8d 58 03 00 00        	movq	%r9, 0x358(%rbp)
1454aa093: e8 48 5c f9 ff              	callq	0x14543fce0 <.text+0x543ece0>
1454aa098: 90                          	nop
1454aa099: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454aa0a0: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454aa0a7: 75 0d                       	jne	0x1454aa0b6 <.text+0x54a90b6>
1454aa0a9: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454aa0b0: e8 fb df 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454aa0b5: 90                          	nop
1454aa0b6: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454aa0bd: 48 89 f1                    	movq	%rsi, %rcx
1454aa0c0: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454aa0c4: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454aa0cb: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454aa0d2: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454aa0d7: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454aa0db: 48 ff c6                    	incq	%rsi
1454aa0de: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454aa0e5: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454aa0ec: 48 85 d2                    	testq	%rdx, %rdx
1454aa0ef: 74 12                       	je	0x1454aa103 <.text+0x54a9103>
1454aa0f1: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454aa0f7: 48 8b 8d 58 03 00 00        	movq	0x358(%rbp), %rcx
1454aa0fe: e8 cd 80 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454aa103: 41 83 bd 58 08 00 00 00     	cmpl	$0x0, 0x858(%r13)
1454aa10b: 41 0f b6 85 5f 09 00 00     	movzbl	0x95f(%r13), %eax
1454aa113: 0f 84 1c 01 00 00           	je	0x1454aa235 <.text+0x54a9235>
1454aa119: 3c 01                       	cmpb	$0x1, %al
1454aa11b: 0f 85 14 01 00 00           	jne	0x1454aa235 <.text+0x54a9235>
1454aa121: 41 80 bd 52 09 00 00 00     	cmpb	$0x0, 0x952(%r13)
1454aa129: 0f 85 06 01 00 00           	jne	0x1454aa235 <.text+0x54a9235>
1454aa12f: 41 c6 85 5f 09 00 00 05     	movb	$0x5, 0x95f(%r13)
1454aa137: 4c 89 e9                    	movq	%r13, %rcx
1454aa13a: e8 91 8e fe ff              	callq	0x145492fd0 <.text+0x5491fd0>
1454aa13f: 49 8b 95 d0 03 00 00        	movq	0x3d0(%r13), %rdx
1454aa146: 45 8b 85 b4 04 00 00        	movl	0x4b4(%r13), %r8d
1454aa14d: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454aa154: e8 17 5a f9 ff              	callq	0x14543fb70 <.text+0x543eb70>
1454aa159: 49 8b b5 48 05 00 00        	movq	0x548(%r13), %rsi
1454aa160: 49 3b b5 38 05 00 00        	cmpq	0x538(%r13), %rsi
1454aa167: 75 0d                       	jne	0x1454aa176 <.text+0x54a9176>
1454aa169: 48 8b 8d 40 03 00 00        	movq	0x340(%rbp), %rcx
1454aa170: e8 3b df 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454aa175: 90                          	nop
1454aa176: 49 8b 85 40 05 00 00        	movq	0x540(%r13), %rax
1454aa17d: 48 89 f1                    	movq	%rsi, %rcx
1454aa180: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454aa184: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454aa18b: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
1454aa192: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454aa197: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454aa19b: 48 ff c6                    	incq	%rsi
1454aa19e: 49 89 b5 48 05 00 00        	movq	%rsi, 0x548(%r13)
1454aa1a5: 41 ff 85 b4 04 00 00        	incl	0x4b4(%r13)
1454aa1ac: 4c 8d 05 2c 06 50 01        	leaq	0x150062c(%rip), %r8    # 0x1469aa7df
1454aa1b3: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1454aa1ba: 41 b9 07 00 00 00           	movl	$0x7, %r9d
1454aa1c0: 4c 89 ea                    	movq	%r13, %rdx
1454aa1c3: e8 58 c4 00 00              	callq	0x1454b6620 <.text+0x54b5620>
1454aa1c8: 49 8b b5 60 05 00 00        	movq	0x560(%r13), %rsi
1454aa1cf: 49 3b b5 50 05 00 00        	cmpq	0x550(%r13), %rsi
1454aa1d6: 75 29                       	jne	0x1454aa201 <.text+0x54a9201>
1454aa1d8: 49 8d 8d 50 05 00 00        	leaq	0x550(%r13), %rcx
1454aa1df: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1454aa1e6: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454aa1ed: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1454aa1f4: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
1454aa1fb: e8 60 dd 2a 00              	callq	0x145757f60 <.text+0x5756f60>
1454aa200: 90                          	nop
1454aa201: 49 8b 85 58 05 00 00        	movq	0x558(%r13), %rax
1454aa208: 48 8d 0c 76                 	leaq	(%rsi,%rsi,2), %rcx
1454aa20c: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1454aa213: 48 89 54 c8 10              	movq	%rdx, 0x10(%rax,%rcx,8)
1454aa218: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1454aa21f: 0f 11 04 c8                 	movups	%xmm0, (%rax,%rcx,8)
1454aa223: 48 ff c6                    	incq	%rsi
1454aa226: 49 89 b5 60 05 00 00        	movq	%rsi, 0x560(%r13)
1454aa22d: 41 0f b6 85 5f 09 00 00     	movzbl	0x95f(%r13), %eax
1454aa235: 41 8b bd f8 08 00 00        	movl	0x8f8(%r13), %edi
1454aa23c: 85 ff                       	testl	%edi, %edi
1454aa23e: 0f 84 08 01 00 00           	je	0x1454aa34c <.text+0x54a934c>
1454aa244: 3c 01                       	cmpb	$0x1, %al
1454aa246: 0f 85 00 01 00 00           	jne	0x1454aa34c <.text+0x54a934c>
1454aa24c: 41 c7 85 f8 08 00 00 00 00 00 00    	movl	$0x0, 0x8f8(%r13)
1454aa257: f3 0f 10 35 99 12 44 00     	movss	0x441299(%rip), %xmm6   # 0x1458eb4f8
1454aa25f: f3 0f 10 3d 7d eb 44 00     	movss	0x44eb7d(%rip), %xmm7   # 0x1458f8de4
1454aa267: f3 44 0f 10 05 98 12 44 00  	movss	0x441298(%rip), %xmm8   # 0x1458eb508
1454aa270: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454aa274: f3 44 0f 10 15 9f 12 44 00  	movss	0x44129f(%rip), %xmm10  # 0x1458eb51c
1454aa27d: eb 17                       	jmp	0x1454aa296 <.text+0x54a9296>
1454aa27f: 90                          	nop
1454aa280: 83 fa 01                    	cmpl	$0x1, %edx
1454aa283: 83 d2 00                    	adcl	$0x0, %edx
1454aa286: 4c 89 e9                    	movq	%r13, %rcx
1454aa289: e8 92 a6 00 00              	callq	0x1454b4920 <.text+0x54b3920>
1454aa28e: ff cf                       	decl	%edi
1454aa290: 0f 84 8b 00 00 00           	je	0x1454aa321 <.text+0x54a9321>
1454aa296: 41 ff 85 f4 08 00 00        	incl	0x8f4(%r13)
1454aa29d: 41 8b 85 f8 03 00 00        	movl	0x3f8(%r13), %eax
1454aa2a4: 83 f8 01                    	cmpl	$0x1, %eax
1454aa2a7: 83 d0 ff                    	adcl	$-0x1, %eax
1454aa2aa: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454aa2ad: f3 48 0f 2a c8              	cvtsi2ss	%rax, %xmm1
1454aa2b2: 0f 28 c1                    	movaps	%xmm1, %xmm0
1454aa2b5: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454aa2ba: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454aa2be: f3 0f 59 ce                 	mulss	%xmm6, %xmm1
1454aa2c2: f3 0f 58 cf                 	addss	%xmm7, %xmm1
1454aa2c6: f3 0f 58 c1                 	addss	%xmm1, %xmm0
1454aa2ca: e8 50 cb 2a 00              	callq	0x145756e1f <.text+0x5755e1f>
1454aa2cf: 31 d2                       	xorl	%edx, %edx
1454aa2d1: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
1454aa2d5: b8 00 00 00 00              	movl	$0x0, %eax
1454aa2da: 72 24                       	jb	0x1454aa300 <.text+0x54a9300>
1454aa2dc: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454aa2e1: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
1454aa2e5: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454aa2ea: 76 1f                       	jbe	0x1454aa30b <.text+0x54a930b>
1454aa2ec: 41 2b 8d fc 03 00 00        	subl	0x3fc(%r13), %ecx
1454aa2f3: 72 8b                       	jb	0x1454aa280 <.text+0x54a9280>
1454aa2f5: eb 23                       	jmp	0x1454aa31a <.text+0x54a931a>
1454aa2f7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454aa300: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
1454aa304: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454aa309: 77 e1                       	ja	0x1454aa2ec <.text+0x54a92ec>
1454aa30b: 89 c1                       	movl	%eax, %ecx
1454aa30d: 41 2b 8d fc 03 00 00        	subl	0x3fc(%r13), %ecx
1454aa314: 0f 82 66 ff ff ff           	jb	0x1454aa280 <.text+0x54a9280>
1454aa31a: 89 ca                       	movl	%ecx, %edx
1454aa31c: e9 5f ff ff ff              	jmp	0x1454aa280 <.text+0x54a9280>
1454aa321: 41 83 bd f4 08 00 00 00     	cmpl	$0x0, 0x8f4(%r13)
1454aa329: 74 21                       	je	0x1454aa34c <.text+0x54a934c>
1454aa32b: 41 80 bd 58 09 00 00 00     	cmpb	$0x0, 0x958(%r13)
1454aa333: 75 17                       	jne	0x1454aa34c <.text+0x54a934c>
1454aa335: 41 80 bd 5f 09 00 00 01     	cmpb	$0x1, 0x95f(%r13)
1454aa33d: 75 0d                       	jne	0x1454aa34c <.text+0x54a934c>
1454aa33f: 4c 89 e9                    	movq	%r13, %rcx
1454aa342: b2 02                       	movb	$0x2, %dl
1454aa344: 41 b0 01                    	movb	$0x1, %r8b
1454aa347: e8 a4 02 03 00              	callq	0x1454da5f0 <.text+0x54d95f0>
1454aa34c: 4c 89 e9                    	movq	%r13, %rcx
1454aa34f: e8 5c 2f fe ff              	callq	0x14548d2b0 <.text+0x548c2b0>
1454aa354: 45 0f b6 bd 54 09 00 00     	movzbl	0x954(%r13), %r15d
1454aa35c: 41 80 bd 5f 09 00 00 01     	cmpb	$0x1, 0x95f(%r13)
1454aa364: 0f 94 85 40 03 00 00        	sete	0x340(%rbp)
1454aa36b: 41 0f 94 85 54 09 00 00     	sete	0x954(%r13)
1454aa373: f3 41 0f 10 b5 e4 08 00 00  	movss	0x8e4(%r13), %xmm6
1454aa37c: 4c 89 e8                    	movq	%r13, %rax
1454aa37f: 4d 8b ad a0 06 00 00        	movq	0x6a0(%r13), %r13
1454aa386: 4c 8b a0 b8 06 00 00        	movq	0x6b8(%rax), %r12
1454aa38d: 4d 39 ec                    	cmpq	%r13, %r12
1454aa390: 0f 84 13 01 00 00           	je	0x1454aa4a9 <.text+0x54a94a9>
1454aa396: 4d 85 ed                    	testq	%r13, %r13
1454aa399: 0f 84 bb 00 00 00           	je	0x1454aa45a <.text+0x54a945a>
1454aa39f: 4c 89 eb                    	movq	%r13, %rbx
1454aa3a2: 48 c1 e3 04                 	shlq	$0x4, %rbx
1454aa3a6: e8 55 7e b5 fa              	callq	0x140002200 <.text+0x1200>
1454aa3ab: ba 04 00 00 00              	movl	$0x4, %edx
1454aa3b0: 48 89 d9                    	movq	%rbx, %rcx
1454aa3b3: e8 08 7e b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454aa3b8: 48 85 c0                    	testq	%rax, %rax
1454aa3bb: 0f 84 ee 09 00 00           	je	0x1454aadaf <.text+0x54a9daf>
1454aa3c1: 48 89 c7                    	movq	%rax, %rdi
1454aa3c4: bb 01 00 00 00              	movl	$0x1, %ebx
1454aa3c9: 49 83 fd 01                 	cmpq	$0x1, %r13
1454aa3cd: 0f 84 7f 00 00 00           	je	0x1454aa452 <.text+0x54a9452>
1454aa3d3: 49 8d 55 ff                 	leaq	-0x1(%r13), %rdx
1454aa3d7: 4d 8d 45 fe                 	leaq	-0x2(%r13), %r8
1454aa3db: 89 d1                       	movl	%edx, %ecx
1454aa3dd: 83 e1 07                    	andl	$0x7, %ecx
1454aa3e0: 48 89 f8                    	movq	%rdi, %rax
1454aa3e3: 49 83 f8 07                 	cmpq	$0x7, %r8
1454aa3e7: 72 57                       	jb	0x1454aa440 <.text+0x54a9440>
1454aa3e9: 48 83 e2 f8                 	andq	$-0x8, %rdx
1454aa3ed: 48 89 f8                    	movq	%rdi, %rax
1454aa3f0: c7 00 00 00 00 00           	movl	$0x0, (%rax)
1454aa3f6: c7 40 10 00 00 00 00        	movl	$0x0, 0x10(%rax)
1454aa3fd: c7 40 20 00 00 00 00        	movl	$0x0, 0x20(%rax)
1454aa404: c7 40 30 00 00 00 00        	movl	$0x0, 0x30(%rax)
1454aa40b: c7 40 40 00 00 00 00        	movl	$0x0, 0x40(%rax)
1454aa412: c7 40 50 00 00 00 00        	movl	$0x0, 0x50(%rax)
1454aa419: c7 40 60 00 00 00 00        	movl	$0x0, 0x60(%rax)
1454aa420: c7 40 70 00 00 00 00        	movl	$0x0, 0x70(%rax)
1454aa427: 48 83 e8 80                 	subq	$-0x80, %rax
1454aa42b: 48 83 c2 f8                 	addq	$-0x8, %rdx
1454aa42f: 75 bf                       	jne	0x1454aa3f0 <.text+0x54a93f0>
1454aa431: 4c 89 eb                    	movq	%r13, %rbx
1454aa434: 48 85 c9                    	testq	%rcx, %rcx
1454aa437: 74 19                       	je	0x1454aa452 <.text+0x54a9452>
1454aa439: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454aa440: c7 00 00 00 00 00           	movl	$0x0, (%rax)
1454aa446: 48 83 c0 10                 	addq	$0x10, %rax
1454aa44a: 48 ff c9                    	decq	%rcx
1454aa44d: 75 f1                       	jne	0x1454aa440 <.text+0x54a9440>
1454aa44f: 4c 89 eb                    	movq	%r13, %rbx
1454aa452: c7 00 00 00 00 00           	movl	$0x0, (%rax)
1454aa458: eb 07                       	jmp	0x1454aa461 <.text+0x54a9461>
1454aa45a: bf 04 00 00 00              	movl	$0x4, %edi
1454aa45f: 31 db                       	xorl	%ebx, %ebx
1454aa461: 48 8b b5 68 03 00 00        	movq	0x368(%rbp), %rsi
1454aa468: 48 8b 96 a8 06 00 00        	movq	0x6a8(%rsi), %rdx
1454aa46f: 4d 89 ec                    	movq	%r13, %r12
1454aa472: 48 85 d2                    	testq	%rdx, %rdx
1454aa475: 74 1d                       	je	0x1454aa494 <.text+0x54a9494>
1454aa477: 48 8b 8e b0 06 00 00        	movq	0x6b0(%rsi), %rcx
1454aa47e: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454aa482: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454aa488: e8 43 7d b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454aa48d: 4c 8b a6 a0 06 00 00        	movq	0x6a0(%rsi), %r12
1454aa494: 48 89 9e a8 06 00 00        	movq	%rbx, 0x6a8(%rsi)
1454aa49b: 48 89 be b0 06 00 00        	movq	%rdi, 0x6b0(%rsi)
1454aa4a2: 4c 89 ae b8 06 00 00        	movq	%r13, 0x6b8(%rsi)
1454aa4a9: 4d 85 e4                    	testq	%r12, %r12
1454aa4ac: 0f 84 05 02 00 00           	je	0x1454aa6b7 <.text+0x54a96b7>
1454aa4b2: 41 80 f7 01                 	xorb	$0x1, %r15b
1454aa4b6: 44 20 bd 40 03 00 00        	andb	%r15b, 0x340(%rbp)
1454aa4bd: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454aa4c4: 4c 8b b8 98 06 00 00        	movq	0x698(%rax), %r15
1454aa4cb: 49 c1 e4 04                 	shlq	$0x4, %r12
1454aa4cf: 48 05 38 05 00 00           	addq	$0x538, %rax            # imm = 0x538
1454aa4d5: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
1454aa4dc: 45 31 ed                    	xorl	%r13d, %r13d
1454aa4df: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454aa4e2: f3 44 0f 10 05 25 6a 48 00  	movss	0x486a25(%rip), %xmm8   # 0x145930f10
1454aa4eb: f3 44 0f 10 0d 28 10 44 00  	movss	0x441028(%rip), %xmm9   # 0x1458eb51c
1454aa4f4: bf ff ff ff ff              	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454aa4f9: 45 31 f6                    	xorl	%r14d, %r14d
1454aa4fc: 31 db                       	xorl	%ebx, %ebx
1454aa4fe: eb 53                       	jmp	0x1454aa553 <.text+0x54a9553>
1454aa500: 48 8b 95 68 03 00 00        	movq	0x368(%rbp), %rdx
1454aa507: 48 8b 82 40 05 00 00        	movq	0x540(%rdx), %rax
1454aa50e: 48 89 f1                    	movq	%rsi, %rcx
1454aa511: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454aa515: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454aa51d: 4c 8b 85 58 03 00 00        	movq	0x358(%rbp), %r8
1454aa524: 4c 89 44 08 08              	movq	%r8, 0x8(%rax,%rcx)
1454aa529: 48 c7 44 08 10 05 00 00 00  	movq	$0x5, 0x10(%rax,%rcx)
1454aa532: 66 c7 44 08 18 37 01        	movw	$0x137, 0x18(%rax,%rcx) # imm = 0x137
1454aa539: 48 ff c6                    	incq	%rsi
1454aa53c: 48 89 b2 48 05 00 00        	movq	%rsi, 0x548(%rdx)
1454aa543: 49 83 c6 10                 	addq	$0x10, %r14
1454aa547: 48 ff c3                    	incq	%rbx
1454aa54a: 4d 39 f4                    	cmpq	%r14, %r12
1454aa54d: 0f 84 f2 00 00 00           	je	0x1454aa645 <.text+0x54a9645>
1454aa553: 43 83 3c 37 01              	cmpl	$0x1, (%r15,%r14)
1454aa558: 75 e9                       	jne	0x1454aa543 <.text+0x54a9543>
1454aa55a: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454aa561: 48 8b 90 b8 06 00 00        	movq	0x6b8(%rax), %rdx
1454aa568: 48 39 d3                    	cmpq	%rdx, %rbx
1454aa56b: 0f 83 21 05 00 00           	jae	0x1454aaa92 <.text+0x54a9a92>
1454aa571: 48 8b 80 b0 06 00 00        	movq	0x6b0(%rax), %rax
1454aa578: 42 f6 04 30 01              	testb	$0x1, (%rax,%r14)
1454aa57d: 74 31                       	je	0x1454aa5b0 <.text+0x54a95b0>
1454aa57f: 42 8b 4c 30 04              	movl	0x4(%rax,%r14), %ecx
1454aa584: 43 3b 4c 37 04              	cmpl	0x4(%r15,%r14), %ecx
1454aa589: 75 25                       	jne	0x1454aa5b0 <.text+0x54a95b0>
1454aa58b: f3 42 0f 10 44 30 08        	movss	0x8(%rax,%r14), %xmm0
1454aa592: 43 0f 2e 44 37 08           	ucomiss	0x8(%r15,%r14), %xmm0
1454aa598: 0f 9a c0                    	setp	%al
1454aa59b: 0f 95 c1                    	setne	%cl
1454aa59e: 08 c1                       	orb	%al, %cl
1454aa5a0: 0a 8d 40 03 00 00           	orb	0x340(%rbp), %cl
1454aa5a6: f6 c1 01                    	testb	$0x1, %cl
1454aa5a9: 74 98                       	je	0x1454aa543 <.text+0x54a9543>
1454aa5ab: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454aa5b0: 66 47 0f 6e 54 37 08        	movd	0x8(%r15,%r14), %xmm10
1454aa5b7: 66 44 0f 7e d0              	movd	%xmm10, %eax
1454aa5bc: 25 ff ff ff 7f              	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
1454aa5c1: 3d ff ff 7f 7f              	cmpl	$0x7f7fffff, %eax       # imm = 0x7F7FFFFF
1454aa5c6: 0f 8f 77 ff ff ff           	jg	0x1454aa543 <.text+0x54a9543>
1454aa5cc: e8 2f 7c b5 fa              	callq	0x140002200 <.text+0x1200>
1454aa5d1: b9 20 00 00 00              	movl	$0x20, %ecx
1454aa5d6: ba 01 00 00 00              	movl	$0x1, %edx
1454aa5db: e8 e0 7b b5 fa              	callq	0x1400021c0 <.text+0x11c0>
1454aa5e0: 48 85 c0                    	testq	%rax, %rax
1454aa5e3: 0f 84 f1 03 00 00           	je	0x1454aa9da <.text+0x54a99da>
1454aa5e9: f3 44 0f 5c d6              	subss	%xmm6, %xmm10
1454aa5ee: f3 44 0f 5f d7              	maxss	%xmm7, %xmm10
1454aa5f3: f3 45 0f 59 d0              	mulss	%xmm8, %xmm10
1454aa5f8: f3 49 0f 2c ca              	cvttss2si	%xmm10, %rcx
1454aa5fd: 44 0f 2e d7                 	ucomiss	%xmm7, %xmm10
1454aa601: 41 0f 42 cd                 	cmovbl	%r13d, %ecx
1454aa605: 45 0f 2e d1                 	ucomiss	%xmm9, %xmm10
1454aa609: 0f 47 cf                    	cmoval	%edi, %ecx
1454aa60c: 88 18                       	movb	%bl, (%rax)
1454aa60e: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
1454aa615: 89 48 01                    	movl	%ecx, 0x1(%rax)
1454aa618: 48 8b 85 68 03 00 00        	movq	0x368(%rbp), %rax
1454aa61f: 48 8b b0 48 05 00 00        	movq	0x548(%rax), %rsi
1454aa626: 48 3b b0 38 05 00 00        	cmpq	0x538(%rax), %rsi
1454aa62d: 0f 85 cd fe ff ff           	jne	0x1454aa500 <.text+0x54a9500>
1454aa633: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454aa63a: e8 71 da 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454aa63f: 90                          	nop
1454aa640: e9 bb fe ff ff              	jmp	0x1454aa500 <.text+0x54a9500>
1454aa645: 4c 8b b5 68 03 00 00        	movq	0x368(%rbp), %r14
1454aa64c: 49 8b 96 98 06 00 00        	movq	0x698(%r14), %rdx
1454aa653: 49 8b be a0 06 00 00        	movq	0x6a0(%r14), %rdi
1454aa65a: 49 c7 86 b8 06 00 00 00 00 00 00    	movq	$0x0, 0x6b8(%r14)
1454aa665: 49 3b be a8 06 00 00        	cmpq	0x6a8(%r14), %rdi
1454aa66c: 0f 87 07 03 00 00           	ja	0x1454aa979 <.text+0x54a9979>
1454aa672: 31 c0                       	xorl	%eax, %eax
1454aa674: bb 00 00 00 00              	movl	$0x0, %ebx
1454aa679: 48 85 ff                    	testq	%rdi, %rdi
1454aa67c: 74 20                       	je	0x1454aa69e <.text+0x54a969e>
1454aa67e: 48 89 c3                    	movq	%rax, %rbx
1454aa681: 49 89 f8                    	movq	%rdi, %r8
1454aa684: 49 c1 e0 04                 	shlq	$0x4, %r8
1454aa688: 48 89 c1                    	movq	%rax, %rcx
1454aa68b: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454aa68f: 49 03 8e b0 06 00 00        	addq	0x6b0(%r14), %rcx
1454aa696: e8 42 c7 2a 00              	callq	0x145756ddd <.text+0x5755ddd>
1454aa69b: 48 89 f8                    	movq	%rdi, %rax
1454aa69e: 48 01 d8                    	addq	%rbx, %rax
1454aa6a1: 49 89 86 b8 06 00 00        	movq	%rax, 0x6b8(%r14)
1454aa6a8: 49 83 be c8 08 00 00 00     	cmpq	$0x0, 0x8c8(%r14)
1454aa6b0: 75 33                       	jne	0x1454aa6e5 <.text+0x54a96e5>
1454aa6b2: e9 b3 01 00 00              	jmp	0x1454aa86a <.text+0x54a986a>
1454aa6b7: 4c 8b b5 68 03 00 00        	movq	0x368(%rbp), %r14
1454aa6be: 49 c7 86 b8 06 00 00 00 00 00 00    	movq	$0x0, 0x6b8(%r14)
1454aa6c9: 31 c0                       	xorl	%eax, %eax
1454aa6cb: 31 db                       	xorl	%ebx, %ebx
1454aa6cd: 48 01 d8                    	addq	%rbx, %rax
1454aa6d0: 49 89 86 b8 06 00 00        	movq	%rax, 0x6b8(%r14)
1454aa6d7: 49 83 be c8 08 00 00 00     	cmpq	$0x0, 0x8c8(%r14)
1454aa6df: 0f 84 85 01 00 00           	je	0x1454aa86a <.text+0x54a986a>
1454aa6e5: 49 8b 86 c8 08 00 00        	movq	0x8c8(%r14), %rax
1454aa6ec: 48 89 85 c0 02 00 00        	movq	%rax, 0x2c0(%rbp)
1454aa6f3: 41 0f 10 86 b8 08 00 00     	movups	0x8b8(%r14), %xmm0
1454aa6fb: 0f 29 85 b0 02 00 00        	movaps	%xmm0, 0x2b0(%rbp)
1454aa702: 49 c7 86 b8 08 00 00 00 00 00 00    	movq	$0x0, 0x8b8(%r14)
1454aa70d: 49 c7 86 c8 08 00 00 00 00 00 00    	movq	$0x0, 0x8c8(%r14)
1454aa718: c7 85 f0 02 00 00 00 00 00 00       	movl	$0x0, 0x2f0(%rbp)
1454aa722: 48 c7 85 d8 02 00 00 00 00 00 00    	movq	$0x0, 0x2d8(%rbp)
1454aa72d: 48 c7 85 e0 02 00 00 01 00 00 00    	movq	$0x1, 0x2e0(%rbp)
1454aa738: 48 c7 85 e8 02 00 00 00 00 00 00    	movq	$0x0, 0x2e8(%rbp)
1454aa743: 48 83 bd c0 02 00 00 00     	cmpq	$0x0, 0x2c0(%rbp)
1454aa74b: 74 68                       	je	0x1454aa7b5 <.text+0x54a97b5>
1454aa74d: 49 8b be d0 03 00 00        	movq	0x3d0(%r14), %rdi
1454aa754: c6 85 37 03 00 00 01        	movb	$0x1, 0x337(%rbp)
1454aa75b: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454aa762: e8 a9 c9 43 00              	callq	0x1458e7110 <.text+0x58e6110>
1454aa767: 90                          	nop
1454aa768: 48 8b 85 e0 02 00 00        	movq	0x2e0(%rbp), %rax
1454aa76f: c6 00 00                    	movb	$0x0, (%rax)
1454aa772: 48 c7 85 e8 02 00 00 01 00 00 00    	movq	$0x1, 0x2e8(%rbp)
1454aa77d: c6 85 37 03 00 00 01        	movb	$0x1, 0x337(%rbp)
1454aa784: 48 8d 95 d8 02 00 00        	leaq	0x2d8(%rbp), %rdx
1454aa78b: 48 89 f9                    	movq	%rdi, %rcx
1454aa78e: e8 fd e8 05 00              	callq	0x145509090 <.text+0x5508090>
1454aa793: 90                          	nop
1454aa794: c6 85 37 03 00 00 01        	movb	$0x1, 0x337(%rbp)
1454aa79b: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454aa7a2: 48 8d 95 d8 02 00 00        	leaq	0x2d8(%rbp), %rdx
1454aa7a9: e8 b2 5c 05 00              	callq	0x145500460 <.text+0x54ff460>
1454aa7ae: 90                          	nop
1454aa7af: ff 85 f0 02 00 00           	incl	0x2f0(%rbp)
1454aa7b5: 48 8b 85 d8 02 00 00        	movq	0x2d8(%rbp), %rax
1454aa7bc: 48 8b 8d e0 02 00 00        	movq	0x2e0(%rbp), %rcx
1454aa7c3: 48 8b 95 e8 02 00 00        	movq	0x2e8(%rbp), %rdx
1454aa7ca: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
1454aa7d1: 8b 95 f0 02 00 00           	movl	0x2f0(%rbp), %edx
1454aa7d7: 89 95 b8 00 00 00           	movl	%edx, 0xb8(%rbp)
1454aa7dd: 8b 95 f4 02 00 00           	movl	0x2f4(%rbp), %edx
1454aa7e3: 89 95 bc 00 00 00           	movl	%edx, 0xbc(%rbp)
1454aa7e9: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454aa7f0: 48 89 8d a8 00 00 00        	movq	%rcx, 0xa8(%rbp)
1454aa7f7: c6 85 37 03 00 00 00        	movb	$0x0, 0x337(%rbp)
1454aa7fe: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454aa805: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454aa80c: e8 bf 52 05 00              	callq	0x1454ffad0 <.text+0x54fead0>
1454aa811: 90                          	nop
1454aa812: 49 8b b6 48 05 00 00        	movq	0x548(%r14), %rsi
1454aa819: 49 3b b6 38 05 00 00        	cmpq	0x538(%r14), %rsi
1454aa820: 75 0d                       	jne	0x1454aa82f <.text+0x54a982f>
1454aa822: 49 8d 8e 38 05 00 00        	leaq	0x538(%r14), %rcx
1454aa829: e8 82 d8 2a 00              	callq	0x1457580b0 <.text+0x57570b0>
1454aa82e: 90                          	nop
1454aa82f: 49 8b 86 40 05 00 00        	movq	0x540(%r14), %rax
1454aa836: 48 89 f1                    	movq	%rsi, %rcx
1454aa839: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454aa83d: 0f 10 85 30 02 00 00        	movups	0x230(%rbp), %xmm0
1454aa844: 0f 10 8d 40 02 00 00        	movups	0x240(%rbp), %xmm1
1454aa84b: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454aa850: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454aa854: 48 ff c6                    	incq	%rsi
1454aa857: 49 89 b6 48 05 00 00        	movq	%rsi, 0x548(%r14)
1454aa85e: 48 8d 8d b0 02 00 00        	leaq	0x2b0(%rbp), %rcx
1454aa865: e8 66 7f 06 00              	callq	0x1455127d0 <.text+0x55117d0>
1454aa86a: f3 41 0f 10 86 e4 08 00 00  	movss	0x8e4(%r14), %xmm0
1454aa873: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454aa876: f3 41 0f 5c 8e 38 09 00 00  	subss	0x938(%r14), %xmm1
1454aa87f: 0f 2e 0d 8a 27 44 00        	ucomiss	0x44278a(%rip), %xmm1   # 0x1458ed010
1454aa886: 73 0a                       	jae	0x1454aa892 <.text+0x54a9892>
1454aa888: 41 80 be 5f 09 00 00 01     	cmpb	$0x1, 0x95f(%r14)
1454aa890: 74 09                       	je	0x1454aa89b <.text+0x54a989b>
1454aa892: f3 41 0f 11 86 38 09 00 00  	movss	%xmm0, 0x938(%r14)
1454aa89b: 0f 28 b5 80 03 00 00        	movaps	0x380(%rbp), %xmm6
1454aa8a2: 0f 28 bd 90 03 00 00        	movaps	0x390(%rbp), %xmm7
1454aa8a9: 44 0f 28 85 a0 03 00 00     	movaps	0x3a0(%rbp), %xmm8
1454aa8b1: 44 0f 28 8d b0 03 00 00     	movaps	0x3b0(%rbp), %xmm9
1454aa8b9: 44 0f 28 95 c0 03 00 00     	movaps	0x3c0(%rbp), %xmm10
1454aa8c1: 44 0f 28 9d d0 03 00 00     	movaps	0x3d0(%rbp), %xmm11
1454aa8c9: 44 0f 28 a5 e0 03 00 00     	movaps	0x3e0(%rbp), %xmm12
1454aa8d1: 44 0f 28 ad f0 03 00 00     	movaps	0x3f0(%rbp), %xmm13
1454aa8d9: 44 0f 28 b5 00 04 00 00     	movaps	0x400(%rbp), %xmm14
1454aa8e1: 44 0f 28 bd 10 04 00 00     	movaps	0x410(%rbp), %xmm15
1454aa8e9: 48 81 c4 a8 04 00 00        	addq	$0x4a8, %rsp            # imm = 0x4A8
1454aa8f0: 5b                          	popq	%rbx
1454aa8f1: 5f                          	popq	%rdi
1454aa8f2: 5e                          	popq	%rsi
1454aa8f3: 41 5c                       	popq	%r12
1454aa8f5: 41 5d                       	popq	%r13
1454aa8f7: 41 5e                       	popq	%r14
1454aa8f9: 41 5f                       	popq	%r15
1454aa8fb: 5d                          	popq	%rbp
1454aa8fc: c3                          	retq
1454aa8fd: 49 8d 56 28                 	leaq	0x28(%r14), %rdx
1454aa901: 48 83 c0 d8                 	addq	$-0x28, %rax
1454aa905: 48 c1 e8 03                 	shrq	$0x3, %rax
1454aa909: 49 b8 cd cc cc cc cc cc cc cc       	movabsq	$-0x3333333333333333, %r8 # imm = 0xCCCCCCCCCCCCCCCD
1454aa913: 4c 0f af c0                 	imulq	%rax, %r8
1454aa917: 49 f7 d8                    	negq	%r8
1454aa91a: b8 01 00 00 00              	movl	$0x1, %eax
1454aa91f: 45 31 d2                    	xorl	%r10d, %r10d
1454aa922: 4d 89 f3                    	movq	%r14, %r11
1454aa925: eb 27                       	jmp	0x1454aa94e <.text+0x54a994e>
1454aa927: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454aa930: 49 8d 3c 00                 	leaq	(%r8,%rax), %rdi
1454aa934: 48 ff c7                    	incq	%rdi
1454aa937: 48 ff c0                    	incq	%rax
1454aa93a: 48 83 c2 28                 	addq	$0x28, %rdx
1454aa93e: 49 89 f3                    	movq	%rsi, %r11
1454aa941: 49 89 ca                    	movq	%rcx, %r10
1454aa944: 48 83 ff 01                 	cmpq	$0x1, %rdi
1454aa948: 0f 84 89 f5 ff ff           	je	0x1454a9ed7 <.text+0x54a8ed7>
1454aa94e: 41 8b 4b 24                 	movl	0x24(%r11), %ecx
1454aa952: 8b 72 24                    	movl	0x24(%rdx), %esi
1454aa955: 89 cf                       	movl	%ecx, %edi
1454aa957: c1 ff 1f                    	sarl	$0x1f, %edi
1454aa95a: d1 ef                       	shrl	%edi
1454aa95c: 31 cf                       	xorl	%ecx, %edi
1454aa95e: 89 f3                       	movl	%esi, %ebx
1454aa960: c1 fb 1f                    	sarl	$0x1f, %ebx
1454aa963: d1 eb                       	shrl	%ebx
1454aa965: 31 f3                       	xorl	%esi, %ebx
1454aa967: 48 89 d6                    	movq	%rdx, %rsi
1454aa96a: 48 89 c1                    	movq	%rax, %rcx
1454aa96d: 39 df                       	cmpl	%ebx, %edi
1454aa96f: 7f bf                       	jg	0x1454aa930 <.text+0x54a9930>
1454aa971: 4c 89 de                    	movq	%r11, %rsi
1454aa974: 4c 89 d1                    	movq	%r10, %rcx
1454aa977: eb b7                       	jmp	0x1454aa930 <.text+0x54a9930>
1454aa979: 49 8d 8e a8 06 00 00        	leaq	0x6a8(%r14), %rcx
1454aa980: 48 c7 44 24 20 10 00 00 00  	movq	$0x10, 0x20(%rsp)
1454aa989: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1454aa98f: 48 89 d6                    	movq	%rdx, %rsi
1454aa992: 31 d2                       	xorl	%edx, %edx
1454aa994: 49 89 f8                    	movq	%rdi, %r8
1454aa997: e8 a4 d3 2a 00              	callq	0x145757d40 <.text+0x5756d40>
1454aa99c: 48 89 f2                    	movq	%rsi, %rdx
1454aa99f: 49 8b 86 b8 06 00 00        	movq	0x6b8(%r14), %rax
1454aa9a6: e9 d3 fc ff ff              	jmp	0x1454aa67e <.text+0x54a967e>
1454aa9ab: b9 08 00 00 00              	movl	$0x8, %ecx
1454aa9b0: ba 08 00 00 00              	movl	$0x8, %edx
1454aa9b5: e8 47 c8 43 00              	callq	0x1458e7201 <.text+0x58e6201>
1454aa9ba: 0f 0b                       	ud2
1454aa9bc: 48 8d 0d 62 2d 50 01        	leaq	0x1502d62(%rip), %rcx   # 0x1469ad725
1454aa9c3: 4c 8d 05 d6 2d 50 01        	leaq	0x1502dd6(%rip), %r8    # 0x1469ad7a0
1454aa9ca: ba 19 00 00 00              	movl	$0x19, %edx
1454aa9cf: e8 9c cd 43 00              	callq	0x1458e7770 <.text+0x58e6770>
1454aa9d4: 90                          	nop
1454aa9d5: e9 7e 05 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aa9da: b9 01 00 00 00              	movl	$0x1, %ecx
1454aa9df: ba 20 00 00 00              	movl	$0x20, %edx
1454aa9e4: e8 32 c8 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aa9e9: 0f 0b                       	ud2
1454aa9eb: 4c 8d 05 86 0d 50 01        	leaq	0x1500d86(%rip), %r8    # 0x1469ab778
1454aa9f2: 4c 89 e1                    	movq	%r12, %rcx
1454aa9f5: e8 b9 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aa9fa: 90                          	nop
1454aa9fb: e9 58 05 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaa00: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aaa07: 4c 8d 05 3a 1d 50 01        	leaq	0x1501d3a(%rip), %r8    # 0x1469ac748
1454aaa0e: 48 89 f9                    	movq	%rdi, %rcx
1454aaa11: e8 9d cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa16: 90                          	nop
1454aaa17: e9 3c 05 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaa1c: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aaa23: 4c 8d 05 be 1c 50 01        	leaq	0x1501cbe(%rip), %r8    # 0x1469ac6e8
1454aaa2a: 48 89 f9                    	movq	%rdi, %rcx
1454aaa2d: e8 81 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa32: 90                          	nop
1454aaa33: e9 20 05 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaa38: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aaa3f: 4c 8d 05 8a 1c 50 01        	leaq	0x1501c8a(%rip), %r8    # 0x1469ac6d0
1454aaa46: 48 89 f9                    	movq	%rdi, %rcx
1454aaa49: e8 65 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa4e: 90                          	nop
1454aaa4f: e9 04 05 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaa54: 4c 8d 05 a5 08 50 01        	leaq	0x15008a5(%rip), %r8    # 0x1469ab300
1454aaa5b: 48 89 f9                    	movq	%rdi, %rcx
1454aaa5e: e8 50 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa63: 0f 0b                       	ud2
1454aaa65: 4c 8d 05 7c 08 50 01        	leaq	0x150087c(%rip), %r8    # 0x1469ab2e8
1454aaa6c: 48 89 f9                    	movq	%rdi, %rcx
1454aaa6f: e8 3f cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa74: 0f 0b                       	ud2
1454aaa76: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aaa7d: 4c 8d 05 7c 1c 50 01        	leaq	0x1501c7c(%rip), %r8    # 0x1469ac700
1454aaa84: 48 89 f9                    	movq	%rdi, %rcx
1454aaa87: e8 27 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaa8c: 90                          	nop
1454aaa8d: e9 c6 04 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaa92: 4c 8d 05 67 05 50 01        	leaq	0x1500567(%rip), %r8    # 0x1469ab000
1454aaa99: 48 89 d9                    	movq	%rbx, %rcx
1454aaa9c: e8 12 cb 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaaa1: 0f 0b                       	ud2
1454aaaa3: 4c 8d 05 de 1b 50 01        	leaq	0x1501bde(%rip), %r8    # 0x1469ac688
1454aaaaa: 48 89 f9                    	movq	%rdi, %rcx
1454aaaad: 4c 89 f2                    	movq	%r14, %rdx
1454aaab0: e8 36 c8 43 00              	callq	0x1458e72eb <.text+0x58e62eb>
1454aaab5: 0f 0b                       	ud2
1454aaab7: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aaabd: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aaac3: 4c 8d 05 06 09 50 01        	leaq	0x1500906(%rip), %r8    # 0x1469ab3d0
1454aaaca: 4c 89 f1                    	movq	%r14, %rcx
1454aaacd: e8 e1 ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaad2: 90                          	nop
1454aaad3: e9 80 04 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaad8: 4c 8d 05 39 08 50 01        	leaq	0x1500839(%rip), %r8    # 0x1469ab318
1454aaadf: 48 89 f9                    	movq	%rdi, %rcx
1454aaae2: e8 cc ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaae7: 0f 0b                       	ud2
1454aaae9: 4c 8d 05 00 0a 50 01        	leaq	0x1500a00(%rip), %r8    # 0x1469ab4f0
1454aaaf0: 4c 89 f9                    	movq	%r15, %rcx
1454aaaf3: e8 bb ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaaf8: 0f 0b                       	ud2
1454aaafa: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aab00: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aab06: 4c 8d 05 db 08 50 01        	leaq	0x15008db(%rip), %r8    # 0x1469ab3e8
1454aab0d: 4c 89 f1                    	movq	%r14, %rcx
1454aab10: 48 89 fa                    	movq	%rdi, %rdx
1454aab13: e8 9b ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aab18: 90                          	nop
1454aab19: e9 3a 04 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab1e: b9 01 00 00 00              	movl	$0x1, %ecx
1454aab23: ba 20 00 00 00              	movl	$0x20, %edx
1454aab28: e8 ee c6 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aab2d: 90                          	nop
1454aab2e: e9 25 04 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab33: 40 88 b5 57 03 00 00        	movb	%sil, 0x357(%rbp)
1454aab3a: 4c 8d 05 bf 17 50 01        	leaq	0x15017bf(%rip), %r8    # 0x1469ac300
1454aab41: 48 89 d9                    	movq	%rbx, %rcx
1454aab44: e8 6a ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aab49: 90                          	nop
1454aab4a: e9 09 04 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab4f: 4c 8d 05 8a 0c 50 01        	leaq	0x1500c8a(%rip), %r8    # 0x1469ab7e0
1454aab56: 48 89 c1                    	movq	%rax, %rcx
1454aab59: 48 8b 95 48 03 00 00        	movq	0x348(%rbp), %rdx
1454aab60: e8 4e ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aab65: 90                          	nop
1454aab66: e9 ed 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab6b: 4c 8d 05 36 09 50 01        	leaq	0x1500936(%rip), %r8    # 0x1469ab4a8
1454aab72: 4c 89 f9                    	movq	%r15, %rcx
1454aab75: e8 39 ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aab7a: 90                          	nop
1454aab7b: e9 d8 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab80: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aab87: 4c 8d 05 a2 1b 50 01        	leaq	0x1501ba2(%rip), %r8    # 0x1469ac730
1454aab8e: 48 89 f9                    	movq	%rdi, %rcx
1454aab91: e8 1d ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aab96: 90                          	nop
1454aab97: e9 bc 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aab9c: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aaba3: 4c 8d 05 9e 1b 50 01        	leaq	0x1501b9e(%rip), %r8    # 0x1469ac748
1454aabaa: 48 89 f9                    	movq	%rdi, %rcx
1454aabad: e8 01 ca 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aabb2: 90                          	nop
1454aabb3: e9 a0 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aabb8: 4c 8d 05 21 1c 50 01        	leaq	0x1501c21(%rip), %r8    # 0x1469ac7e0
1454aabbf: 4c 89 f1                    	movq	%r14, %rcx
1454aabc2: e8 ec c9 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aabc7: 0f 0b                       	ud2
1454aabc9: b9 01 00 00 00              	movl	$0x1, %ecx
1454aabce: ba 20 00 00 00              	movl	$0x20, %edx
1454aabd3: e8 43 c6 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aabd8: 90                          	nop
1454aabd9: e9 7a 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aabde: b9 01 00 00 00              	movl	$0x1, %ecx
1454aabe3: ba 20 00 00 00              	movl	$0x20, %edx
1454aabe8: e8 2e c6 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aabed: 90                          	nop
1454aabee: e9 65 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aabf3: b9 01 00 00 00              	movl	$0x1, %ecx
1454aabf8: ba 20 00 00 00              	movl	$0x20, %edx
1454aabfd: e8 19 c6 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aac02: 90                          	nop
1454aac03: e9 50 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aac08: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
1454aac0e: 88 85 77 03 00 00           	movb	%al, 0x377(%rbp)
1454aac14: b9 01 00 00 00              	movl	$0x1, %ecx
1454aac19: ba 20 00 00 00              	movl	$0x20, %edx
1454aac1e: e8 f8 c5 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aac23: 90                          	nop
1454aac24: e9 2f 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aac29: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
1454aac2f: 88 85 77 03 00 00           	movb	%al, 0x377(%rbp)
1454aac35: b9 01 00 00 00              	movl	$0x1, %ecx
1454aac3a: ba 20 00 00 00              	movl	$0x20, %edx
1454aac3f: e8 d7 c5 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aac44: 90                          	nop
1454aac45: e9 0e 03 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aac4a: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
1454aac50: 88 85 77 03 00 00           	movb	%al, 0x377(%rbp)
1454aac56: b9 01 00 00 00              	movl	$0x1, %ecx
1454aac5b: ba 20 00 00 00              	movl	$0x20, %edx
1454aac60: e8 b6 c5 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aac65: 90                          	nop
1454aac66: e9 ed 02 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aac6b: 44 88 a5 77 03 00 00        	movb	%r12b, 0x377(%rbp)
1454aac72: 4c 8d 05 9f 1a 50 01        	leaq	0x1501a9f(%rip), %r8    # 0x1469ac718
1454aac79: 48 89 f9                    	movq	%rdi, %rcx
1454aac7c: e8 32 c9 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aac81: 90                          	nop
1454aac82: e9 d1 02 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aac87: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aac8d: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aac93: 4c 8d 05 ae 07 50 01        	leaq	0x15007ae(%rip), %r8    # 0x1469ab448
1454aac9a: 4c 89 f1                    	movq	%r14, %rcx
1454aac9d: 48 89 fa                    	movq	%rdi, %rdx
1454aaca0: e8 0e c9 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaca5: 90                          	nop
1454aaca6: e9 ad 02 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aacab: 4c 8d 05 b6 08 50 01        	leaq	0x15008b6(%rip), %r8    # 0x1469ab568
1454aacb2: 4c 89 f9                    	movq	%r15, %rcx
1454aacb5: e8 f9 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aacba: 0f 0b                       	ud2
1454aacbc: 4c 8d 05 5d 08 50 01        	leaq	0x150085d(%rip), %r8    # 0x1469ab520
1454aacc3: 4c 89 f9                    	movq	%r15, %rcx
1454aacc6: e8 e8 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaccb: 0f 0b                       	ud2
1454aaccd: 4c 8d 05 4c 1c 50 01        	leaq	0x1501c4c(%rip), %r8    # 0x1469ac920
1454aacd4: 48 89 f9                    	movq	%rdi, %rcx
1454aacd7: e8 d7 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aacdc: 0f 0b                       	ud2
1454aacde: 4c 8d 05 53 1c 50 01        	leaq	0x1501c53(%rip), %r8    # 0x1469ac938
1454aace5: 4c 89 f1                    	movq	%r14, %rcx
1454aace8: e8 c6 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaced: 0f 0b                       	ud2
1454aacef: b9 04 00 00 00              	movl	$0x4, %ecx
1454aacf4: ba 0c 00 00 00              	movl	$0xc, %edx
1454aacf9: e8 1d c5 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aacfe: 0f 0b                       	ud2
1454aad00: 4c 8d 05 79 08 50 01        	leaq	0x1500879(%rip), %r8    # 0x1469ab580
1454aad07: 4c 89 f9                    	movq	%r15, %rcx
1454aad0a: e8 a4 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad0f: 0f 0b                       	ud2
1454aad11: 4c 89 8d 10 03 00 00        	movq	%r9, 0x310(%rbp)
1454aad18: 4c 8d 05 41 07 50 01        	leaq	0x1500741(%rip), %r8    # 0x1469ab460
1454aad1f: 4c 89 f1                    	movq	%r14, %rcx
1454aad22: e8 8c c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad27: 90                          	nop
1454aad28: e9 2b 02 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aad2d: 4c 89 8d 10 03 00 00        	movq	%r9, 0x310(%rbp)
1454aad34: 4c 8d 05 7d 06 50 01        	leaq	0x150067d(%rip), %r8    # 0x1469ab3b8
1454aad3b: 4c 89 f1                    	movq	%r14, %rcx
1454aad3e: e8 70 c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad43: 90                          	nop
1454aad44: e9 0f 02 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aad49: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aad4f: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aad55: 4c 8d 05 a4 06 50 01        	leaq	0x15006a4(%rip), %r8    # 0x1469ab400
1454aad5c: 4c 89 f1                    	movq	%r14, %rcx
1454aad5f: e8 4f c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad64: 90                          	nop
1454aad65: e9 ee 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aad6a: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aad70: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aad76: 4c 8d 05 b3 06 50 01        	leaq	0x15006b3(%rip), %r8    # 0x1469ab430
1454aad7d: 4c 89 f1                    	movq	%r14, %rcx
1454aad80: e8 2e c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad85: 90                          	nop
1454aad86: e9 cd 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aad8b: 4c 8d 05 66 0f 4e 01        	leaq	0x14e0f66(%rip), %r8    # 0x14698bcf8
1454aad92: e8 1c c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aad97: 90                          	nop
1454aad98: e9 bb 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aad9d: 4c 8d 05 54 0f 4e 01        	leaq	0x14e0f54(%rip), %r8    # 0x14698bcf8
1454aada4: e8 0a c8 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aada9: 90                          	nop
1454aadaa: e9 a9 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aadaf: b9 04 00 00 00              	movl	$0x4, %ecx
1454aadb4: 48 89 da                    	movq	%rbx, %rdx
1454aadb7: e8 5f c4 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aadbc: 0f 0b                       	ud2
1454aadbe: 4c 8d 05 43 20 4e 01        	leaq	0x14e2043(%rip), %r8    # 0x14698ce08
1454aadc5: e8 e9 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aadca: 90                          	nop
1454aadcb: e9 88 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aadd0: 4c 8d 05 31 20 4e 01        	leaq	0x14e2031(%rip), %r8    # 0x14698ce08
1454aadd7: e8 d7 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaddc: 90                          	nop
1454aaddd: e9 76 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aade2: 4c 8d 05 4f 07 50 01        	leaq	0x150074f(%rip), %r8    # 0x1469ab538
1454aade9: 4c 89 f9                    	movq	%r15, %rcx
1454aadec: e8 c2 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aadf1: 0f 0b                       	ud2
1454aadf3: 4c 8d 05 56 07 50 01        	leaq	0x1500756(%rip), %r8    # 0x1469ab550
1454aadfa: 4c 89 f9                    	movq	%r15, %rcx
1454aadfd: e8 b1 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae02: 0f 0b                       	ud2
1454aae04: 4c 8d 05 85 3a 26 01        	leaq	0x1263a85(%rip), %r8    # 0x14670e890
1454aae0b: e8 a3 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae10: 90                          	nop
1454aae11: e9 42 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aae16: 4c 8d 05 8b 3a 26 01        	leaq	0x1263a8b(%rip), %r8    # 0x14670e8a8
1454aae1d: 48 89 c1                    	movq	%rax, %rcx
1454aae20: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454aae27: e8 87 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae2c: 90                          	nop
1454aae2d: e9 26 01 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aae32: 4c 8d 05 67 18 50 01        	leaq	0x1501867(%rip), %r8    # 0x1469ac6a0
1454aae39: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454aae40: e8 6e c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae45: 0f 0b                       	ud2
1454aae47: 4c 8d 05 aa 19 50 01        	leaq	0x15019aa(%rip), %r8    # 0x1469ac7f8
1454aae4e: 4c 89 f1                    	movq	%r14, %rcx
1454aae51: e8 5d c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae56: 0f 0b                       	ud2
1454aae58: 4c 8d 05 b1 19 50 01        	leaq	0x15019b1(%rip), %r8    # 0x1469ac810
1454aae5f: e8 4f c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aae64: 0f 0b                       	ud2
1454aae66: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
1454aae6c: 88 85 77 03 00 00           	movb	%al, 0x377(%rbp)
1454aae72: b9 01 00 00 00              	movl	$0x1, %ecx
1454aae77: ba 20 00 00 00              	movl	$0x20, %edx
1454aae7c: e8 9a c3 43 00              	callq	0x1458e721b <.text+0x58e621b>
1454aae81: 90                          	nop
1454aae82: e9 d1 00 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aae87: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aae8d: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aae93: 4c 8d 05 7e 05 50 01        	leaq	0x150057e(%rip), %r8    # 0x1469ab418
1454aae9a: 4c 89 f1                    	movq	%r14, %rcx
1454aae9d: e8 11 c7 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaea2: 90                          	nop
1454aaea3: e9 b0 00 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaea8: 4c 8d 05 31 0a 50 01        	leaq	0x1500a31(%rip), %r8    # 0x1469ab8e0
1454aaeaf: 48 89 d1                    	movq	%rdx, %rcx
1454aaeb2: 4c 89 ca                    	movq	%r9, %rdx
1454aaeb5: e8 f9 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaeba: 90                          	nop
1454aaebb: e9 98 00 00 00              	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaec0: 4c 8d 05 c9 18 50 01        	leaq	0x15018c9(%rip), %r8    # 0x1469ac790
1454aaec7: 4c 89 ca                    	movq	%r9, %rdx
1454aaeca: e8 e4 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaecf: 0f 0b                       	ud2
1454aaed1: 4c 8d 05 d0 18 50 01        	leaq	0x15018d0(%rip), %r8    # 0x1469ac7a8
1454aaed8: e8 d6 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaedd: 0f 0b                       	ud2
1454aaedf: 4c 8d 05 a2 07 50 01        	leaq	0x15007a2(%rip), %r8    # 0x1469ab688
1454aaee6: 48 89 d1                    	movq	%rdx, %rcx
1454aaee9: 4c 89 ca                    	movq	%r9, %rdx
1454aaeec: e8 c2 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaef1: 90                          	nop
1454aaef2: eb 64                       	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaef4: 4c 8d 05 fd 08 50 01        	leaq	0x15008fd(%rip), %r8    # 0x1469ab7f8
1454aaefb: 48 89 d9                    	movq	%rbx, %rcx
1454aaefe: e8 b0 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaf03: 90                          	nop
1454aaf04: eb 52                       	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaf06: 4c 8d 05 0b 08 50 01        	leaq	0x150080b(%rip), %r8    # 0x1469ab718
1454aaf0d: e8 a1 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaf12: 90                          	nop
1454aaf13: eb 43                       	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaf15: 8b 85 48 03 00 00           	movl	0x348(%rbp), %eax
1454aaf1b: 88 85 67 03 00 00           	movb	%al, 0x367(%rbp)
1454aaf21: 4c 8d 05 78 04 50 01        	leaq	0x1500478(%rip), %r8    # 0x1469ab3a0
1454aaf28: 4c 89 f1                    	movq	%r14, %rcx
1454aaf2b: e8 83 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaf30: 90                          	nop
1454aaf31: eb 25                       	jmp	0x1454aaf58 <.text+0x54a9f58>
1454aaf33: 4c 8d 05 ce 05 50 01        	leaq	0x15005ce(%rip), %r8    # 0x1469ab508
1454aaf3a: 4c 89 f9                    	movq	%r15, %rcx
1454aaf3d: e8 71 c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaf42: 0f 0b                       	ud2
1454aaf44: 4c 8d 05 6d 07 50 01        	leaq	0x150076d(%rip), %r8    # 0x1469ab6b8
1454aaf4b: 48 8b 95 80 00 00 00        	movq	0x80(%rbp), %rdx
1454aaf52: e8 5c c6 43 00              	callq	0x1458e75b3 <.text+0x58e65b3>
1454aaf57: 90                          	nop
1454aaf58: 0f 0b                       	ud2
1454aaf5a: 4c 8d 05 57 17 50 01        	leaq	0x1501757(%rip), %r8    # 0x1469ac6b8
1454aaf61: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
1454aaf68: 48 89 da                    	movq	%rbx, %rdx
1454aaf6b: e8 7b c3 43 00              	callq	0x1458e72eb <.text+0x58e62eb>
1454aaf70: 0f 0b                       	ud2
