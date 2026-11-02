
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d43d0: 55                          	pushq	%rbp
1454d43d1: 41 57                       	pushq	%r15
1454d43d3: 41 56                       	pushq	%r14
1454d43d5: 41 55                       	pushq	%r13
1454d43d7: 41 54                       	pushq	%r12
1454d43d9: 56                          	pushq	%rsi
1454d43da: 57                          	pushq	%rdi
1454d43db: 53                          	pushq	%rbx
1454d43dc: 48 81 ec 08 01 00 00        	subq	$0x108, %rsp            # imm = 0x108
1454d43e3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454d43eb: 44 0f 29 4d 70              	movaps	%xmm9, 0x70(%rbp)
1454d43f0: 44 0f 29 45 60              	movaps	%xmm8, 0x60(%rbp)
1454d43f5: 0f 29 7d 50                 	movaps	%xmm7, 0x50(%rbp)
1454d43f9: 0f 29 75 40                 	movaps	%xmm6, 0x40(%rbp)
1454d43fd: 48 c7 45 38 fe ff ff ff     	movq	$-0x2, 0x38(%rbp)
1454d4405: 44 89 4d 20                 	movl	%r9d, 0x20(%rbp)
1454d4409: 4c 89 45 28                 	movq	%r8, 0x28(%rbp)
1454d440d: 48 89 ce                    	movq	%rcx, %rsi
1454d4410: f3 0f 10 b5 00 01 00 00     	movss	0x100(%rbp), %xmm6
1454d4418: 4c 8b ad f0 00 00 00        	movq	0xf0(%rbp), %r13
1454d441f: 48 8b 9d f8 00 00 00        	movq	0xf8(%rbp), %rbx
1454d4426: 4c 8b 22                    	movq	(%rdx), %r12
1454d4429: 48 85 db                    	testq	%rbx, %rbx
1454d442c: 0f 84 1b 01 00 00           	je	0x1454d454d <.text+0x54d354d>
1454d4432: 4c 8d 3c dd 00 00 00 00     	leaq	(,%rbx,8), %r15
1454d443a: 0f b6 be 11 01 00 00        	movzbl	0x111(%rsi), %edi
1454d4441: 0f 10 7e 20                 	movups	0x20(%rsi), %xmm7
1454d4445: 44 0f 10 46 40              	movups	0x40(%rsi), %xmm8
1454d444a: 45 31 f6                    	xorl	%r14d, %r14d
1454d444d: f3 44 0f 10 0d 6a 6f 51 00  	movss	0x516f6a(%rip), %xmm9   # 0x1459eb3c0
1454d4456: eb 3b                       	jmp	0x1454d4493 <.text+0x54d3493>
1454d4458: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454d4460: 0f 97 44 24 28              	seta	0x28(%rsp)
1454d4465: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454d4469: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454d446e: 48 89 f1                    	movq	%rsi, %rcx
1454d4471: e8 3a ea fe ff              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454d4476: 40 88 be 11 01 00 00        	movb	%dil, 0x111(%rsi)
1454d447d: 0f 11 7e 20                 	movups	%xmm7, 0x20(%rsi)
1454d4481: 44 0f 11 46 40              	movups	%xmm8, 0x40(%rsi)
1454d4486: 49 83 c6 08                 	addq	$0x8, %r14
1454d448a: 4d 39 f7                    	cmpq	%r14, %r15
1454d448d: 0f 84 ba 00 00 00           	je	0x1454d454d <.text+0x54d354d>
1454d4493: 4b 8b 54 35 00              	movq	(%r13,%r14), %rdx
1454d4498: 48 8b 86 80 08 00 00        	movq	0x880(%rsi), %rax
1454d449f: 48 8b 8e 98 08 00 00        	movq	0x898(%rsi), %rcx
1454d44a6: 4c 8d 04 01                 	leaq	(%rcx,%rax), %r8
1454d44aa: 49 c1 c0 17                 	rolq	$0x17, %r8
1454d44ae: 49 01 c0                    	addq	%rax, %r8
1454d44b1: 4c 8b 8e 88 08 00 00        	movq	0x888(%rsi), %r9
1454d44b8: 4d 89 ca                    	movq	%r9, %r10
1454d44bb: 49 c1 e2 11                 	shlq	$0x11, %r10
1454d44bf: 4c 8b 9e 90 08 00 00        	movq	0x890(%rsi), %r11
1454d44c6: 49 31 c3                    	xorq	%rax, %r11
1454d44c9: 4c 31 c9                    	xorq	%r9, %rcx
1454d44cc: 4d 31 d9                    	xorq	%r11, %r9
1454d44cf: 4c 89 8e 88 08 00 00        	movq	%r9, 0x888(%rsi)
1454d44d6: 48 31 c8                    	xorq	%rcx, %rax
1454d44d9: 48 89 86 80 08 00 00        	movq	%rax, 0x880(%rsi)
1454d44e0: 4d 31 d3                    	xorq	%r10, %r11
1454d44e3: 4c 89 9e 90 08 00 00        	movq	%r11, 0x890(%rsi)
1454d44ea: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454d44ee: 48 89 8e 98 08 00 00        	movq	%rcx, 0x898(%rsi)
1454d44f5: 49 c1 e8 28                 	shrq	$0x28, %r8
1454d44f9: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454d44fc: f3 41 0f 2a c0              	cvtsi2ss	%r8d, %xmm0
1454d4501: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454d4506: f3 0f 10 8e 64 04 00 00     	movss	0x464(%rsi), %xmm1
1454d450e: f3 0f 10 96 68 04 00 00     	movss	0x468(%rsi), %xmm2
1454d4516: f3 0f 59 d6                 	mulss	%xmm6, %xmm2
1454d451a: 45 8b 4c 24 40              	movl	0x40(%r12), %r9d
1454d451f: 41 0f b6 44 24 74           	movzbl	0x74(%r12), %eax
1454d4525: c6 86 11 01 00 00 03        	movb	$0x3, 0x111(%rsi)
1454d452c: 48 c7 46 20 00 00 00 00     	movq	$0x0, 0x20(%rsi)
1454d4534: 48 c7 46 40 00 00 00 00     	movq	$0x0, 0x40(%rsi)
1454d453c: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454d453f: 0f 87 1b ff ff ff           	ja	0x1454d4460 <.text+0x54d3460>
1454d4545: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454d4548: e9 13 ff ff ff              	jmp	0x1454d4460 <.text+0x54d3460>
1454d454d: 48 8b be 00 07 00 00        	movq	0x700(%rsi), %rdi
1454d4554: 48 85 ff                    	testq	%rdi, %rdi
1454d4557: 0f 84 c6 02 00 00           	je	0x1454d4823 <.text+0x54d3823>
1454d455d: 48 8d 04 dd 00 00 00 00     	leaq	(,%rbx,8), %rax
1454d4565: 4c 01 e8                    	addq	%r13, %rax
1454d4568: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1454d456c: 4d 8b 34 24                 	movq	(%r12), %r14
1454d4570: 4d 8b 7c 24 08              	movq	0x8(%r12), %r15
1454d4575: 48 8b 9e f8 06 00 00        	movq	0x6f8(%rsi), %rbx
1454d457c: 48 83 c3 10                 	addq	$0x10, %rbx
1454d4580: f3 0f 10 3d f4 20 42 00     	movss	0x4220f4(%rip), %xmm7   # 0x1458f667c
1454d4588: eb 0f                       	jmp	0x1454d4599 <.text+0x54d3599>
1454d458a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454d4590: 48 83 c3 40                 	addq	$0x40, %rbx
1454d4594: 48 ff cf                    	decq	%rdi
1454d4597: 74 25                       	je	0x1454d45be <.text+0x54d35be>
1454d4599: 80 7b f0 0d                 	cmpb	$0xd, -0x10(%rbx)
1454d459d: 75 f1                       	jne	0x1454d4590 <.text+0x54d3590>
1454d459f: 4c 39 3b                    	cmpq	%r15, (%rbx)
1454d45a2: 75 ec                       	jne	0x1454d4590 <.text+0x54d3590>
1454d45a4: 48 8b 4b f8                 	movq	-0x8(%rbx), %rcx
1454d45a8: 4c 89 f2                    	movq	%r14, %rdx
1454d45ab: 4d 89 f8                    	movq	%r15, %r8
1454d45ae: e8 24 28 28 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454d45b3: 85 c0                       	testl	%eax, %eax
1454d45b5: 75 d9                       	jne	0x1454d4590 <.text+0x54d3590>
1454d45b7: f3 0f 58 7b f4              	addss	-0xc(%rbx), %xmm7
1454d45bc: eb d2                       	jmp	0x1454d4590 <.text+0x54d3590>
1454d45be: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454d45c1: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454d45c4: 0f 83 59 02 00 00           	jae	0x1454d4823 <.text+0x54d3823>
1454d45ca: 48 8d 86 c0 04 00 00        	leaq	0x4c0(%rsi), %rax
1454d45d1: 4c 89 6d e0                 	movq	%r13, -0x20(%rbp)
1454d45d5: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
1454d45d9: 48 89 4d e8                 	movq	%rcx, -0x18(%rbp)
1454d45dd: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
1454d45e1: 48 89 e9                    	movq	%rbp, %rcx
1454d45e4: 48 8d 55 e0                 	leaq	-0x20(%rbp), %rdx
1454d45e8: e8 f3 db 05 00              	callq	0x1455321e0 <.text+0x55311e0>
1454d45ed: 4c 8b 75 10                 	movq	0x10(%rbp), %r14
1454d45f1: 4d 85 f6                    	testq	%r14, %r14
1454d45f4: 74 37                       	je	0x1454d462d <.text+0x54d362d>
1454d45f6: 48 8b 8e c8 04 00 00        	movq	0x4c8(%rsi), %rcx
1454d45fd: 48 69 86 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454d4608: 48 8b 55 28                 	movq	0x28(%rbp), %rdx
1454d460c: 0f 1f 40 00                 	nopl	(%rax)
1454d4610: 48 85 c0                    	testq	%rax, %rax
1454d4613: 74 32                       	je	0x1454d4647 <.text+0x54d3647>
1454d4615: 48 05 a0 fe ff ff           	addq	$-0x160, %rax           # imm = 0xFEA0
1454d461b: 48 39 91 88 00 00 00        	cmpq	%rdx, 0x88(%rcx)
1454d4622: 48 8d 89 60 01 00 00        	leaq	0x160(%rcx), %rcx
1454d4629: 75 e5                       	jne	0x1454d4610 <.text+0x54d3610>
1454d462b: eb 27                       	jmp	0x1454d4654 <.text+0x54d3654>
1454d462d: 48 8b 55 00                 	movq	(%rbp), %rdx
1454d4631: 48 85 d2                    	testq	%rdx, %rdx
1454d4634: 0f 84 e9 01 00 00           	je	0x1454d4823 <.text+0x54d3823>
1454d463a: 48 8b 45 08                 	movq	0x8(%rbp), %rax
1454d463e: 48 89 45 28                 	movq	%rax, 0x28(%rbp)
1454d4642: e9 c9 01 00 00              	jmp	0x1454d4810 <.text+0x54d3810>
1454d4647: 48 3b 96 d0 03 00 00        	cmpq	0x3d0(%rsi), %rdx
1454d464e: 0f 85 8b 00 00 00           	jne	0x1454d46df <.text+0x54d36df>
1454d4654: 4c 8b 4d 08                 	movq	0x8(%rbp), %r9
1454d4658: c7 45 b8 02 00 00 00        	movl	$0x2, -0x48(%rbp)
1454d465f: c7 45 cc 00 00 00 00        	movl	$0x0, -0x34(%rbp)
1454d4666: 4c 89 4d 18                 	movq	%r9, 0x18(%rbp)
1454d466a: c6 45 37 01                 	movb	$0x1, 0x37(%rbp)
1454d466e: 48 8d 45 cc                 	leaq	-0x34(%rbp), %rax
1454d4672: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454d4677: 48 8d 45 b8                 	leaq	-0x48(%rbp), %rax
1454d467b: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454d4680: 4c 89 74 24 20              	movq	%r14, 0x20(%rsp)
1454d4685: 48 8d 4d e0                 	leaq	-0x20(%rbp), %rcx
1454d4689: 44 8b 45 20                 	movl	0x20(%rbp), %r8d
1454d468d: 4c 89 4d 28                 	movq	%r9, 0x28(%rbp)
1454d4691: e8 0a 6b f7 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454d4696: 90                          	nop
1454d4697: 48 8b be 48 05 00 00        	movq	0x548(%rsi), %rdi
1454d469e: 48 3b be 38 05 00 00        	cmpq	0x538(%rsi), %rdi
1454d46a5: 75 0d                       	jne	0x1454d46b4 <.text+0x54d36b4>
1454d46a7: 48 8d 8e 38 05 00 00        	leaq	0x538(%rsi), %rcx
1454d46ae: e8 fd 39 28 00              	callq	0x1457580b0 <.text+0x57570b0>
1454d46b3: 90                          	nop
1454d46b4: 48 8b 86 40 05 00 00        	movq	0x540(%rsi), %rax
1454d46bb: 48 89 f9                    	movq	%rdi, %rcx
1454d46be: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454d46c2: 0f 10 45 e0                 	movups	-0x20(%rbp), %xmm0
1454d46c6: 0f 10 4d f0                 	movups	-0x10(%rbp), %xmm1
1454d46ca: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454d46cf: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454d46d3: 48 ff c7                    	incq	%rdi
1454d46d6: 48 89 be 48 05 00 00        	movq	%rdi, 0x548(%rsi)
1454d46dd: eb 08                       	jmp	0x1454d46e7 <.text+0x54d36e7>
1454d46df: 48 8b 45 08                 	movq	0x8(%rbp), %rax
1454d46e3: 48 89 45 28                 	movq	%rax, 0x28(%rbp)
1454d46e7: 48 8b 45 00                 	movq	(%rbp), %rax
1454d46eb: 48 89 45 20                 	movq	%rax, 0x20(%rbp)
1454d46ef: 49 c1 e6 03                 	shlq	$0x3, %r14
1454d46f3: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454d46f7: 0f b6 9e 11 01 00 00        	movzbl	0x111(%rsi), %ebx
1454d46fe: 0f 10 7e 20                 	movups	0x20(%rsi), %xmm7
1454d4702: 44 0f 10 46 40              	movups	0x40(%rsi), %xmm8
1454d4707: 31 ff                       	xorl	%edi, %edi
1454d4709: f3 44 0f 10 0d ae 6c 51 00  	movss	0x516cae(%rip), %xmm9   # 0x1459eb3c0
1454d4712: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454d4720: 48 8b 45 28                 	movq	0x28(%rbp), %rax
1454d4724: 48 8b 14 38                 	movq	(%rax,%rdi), %rdx
1454d4728: 48 8b 86 80 08 00 00        	movq	0x880(%rsi), %rax
1454d472f: 48 8b 8e 98 08 00 00        	movq	0x898(%rsi), %rcx
1454d4736: 4c 8d 04 01                 	leaq	(%rcx,%rax), %r8
1454d473a: 49 c1 c0 17                 	rolq	$0x17, %r8
1454d473e: 49 01 c0                    	addq	%rax, %r8
1454d4741: 4c 8b 8e 88 08 00 00        	movq	0x888(%rsi), %r9
1454d4748: 4d 89 ca                    	movq	%r9, %r10
1454d474b: 49 c1 e2 11                 	shlq	$0x11, %r10
1454d474f: 4c 8b 9e 90 08 00 00        	movq	0x890(%rsi), %r11
1454d4756: 49 31 c3                    	xorq	%rax, %r11
1454d4759: 4c 31 c9                    	xorq	%r9, %rcx
1454d475c: 4d 31 d9                    	xorq	%r11, %r9
1454d475f: 4c 89 8e 88 08 00 00        	movq	%r9, 0x888(%rsi)
1454d4766: 48 31 c8                    	xorq	%rcx, %rax
1454d4769: 48 89 86 80 08 00 00        	movq	%rax, 0x880(%rsi)
1454d4770: 4d 31 d3                    	xorq	%r10, %r11
1454d4773: 4c 89 9e 90 08 00 00        	movq	%r11, 0x890(%rsi)
1454d477a: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454d477e: 48 89 8e 98 08 00 00        	movq	%rcx, 0x898(%rsi)
1454d4785: 49 c1 e8 28                 	shrq	$0x28, %r8
1454d4789: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454d478c: f3 41 0f 2a c0              	cvtsi2ss	%r8d, %xmm0
1454d4791: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454d4796: f3 0f 10 8e 64 04 00 00     	movss	0x464(%rsi), %xmm1
1454d479e: f3 0f 10 96 68 04 00 00     	movss	0x468(%rsi), %xmm2
1454d47a6: f3 0f 59 d6                 	mulss	%xmm6, %xmm2
1454d47aa: 45 8b 4c 24 40              	movl	0x40(%r12), %r9d
1454d47af: 41 0f b6 44 24 74           	movzbl	0x74(%r12), %eax
1454d47b5: c6 86 11 01 00 00 03        	movb	$0x3, 0x111(%rsi)
1454d47bc: 48 c7 46 20 00 00 00 00     	movq	$0x0, 0x20(%rsi)
1454d47c4: 48 c7 46 40 00 00 00 00     	movq	$0x0, 0x40(%rsi)
1454d47cc: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454d47cf: 77 03                       	ja	0x1454d47d4 <.text+0x54d37d4>
1454d47d1: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454d47d4: 0f 97 44 24 28              	seta	0x28(%rsp)
1454d47d9: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454d47dd: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454d47e2: 48 89 f1                    	movq	%rsi, %rcx
1454d47e5: e8 c6 e6 fe ff              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454d47ea: 90                          	nop
1454d47eb: 88 9e 11 01 00 00           	movb	%bl, 0x111(%rsi)
1454d47f1: 0f 11 7e 20                 	movups	%xmm7, 0x20(%rsi)
1454d47f5: 44 0f 11 46 40              	movups	%xmm8, 0x40(%rsi)
1454d47fa: 48 83 c7 08                 	addq	$0x8, %rdi
1454d47fe: 49 39 fe                    	cmpq	%rdi, %r14
1454d4801: 0f 85 19 ff ff ff           	jne	0x1454d4720 <.text+0x54d3720>
1454d4807: 48 8b 55 20                 	movq	0x20(%rbp), %rdx
1454d480b: 48 85 d2                    	testq	%rdx, %rdx
1454d480e: 74 13                       	je	0x1454d4823 <.text+0x54d3823>
1454d4810: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454d4814: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454d481a: 48 8b 4d 28                 	movq	0x28(%rbp), %rcx
1454d481e: e8 ad d9 b2 fa              	callq	0x1400021d0 <.text+0x11d0>
1454d4823: 0f 28 75 40                 	movaps	0x40(%rbp), %xmm6
1454d4827: 0f 28 7d 50                 	movaps	0x50(%rbp), %xmm7
1454d482b: 44 0f 28 45 60              	movaps	0x60(%rbp), %xmm8
1454d4830: 44 0f 28 4d 70              	movaps	0x70(%rbp), %xmm9
1454d4835: 48 81 c4 08 01 00 00        	addq	$0x108, %rsp            # imm = 0x108
1454d483c: 5b                          	popq	%rbx
1454d483d: 5f                          	popq	%rdi
1454d483e: 5e                          	popq	%rsi
1454d483f: 41 5c                       	popq	%r12
1454d4841: 41 5d                       	popq	%r13
1454d4843: 41 5e                       	popq	%r14
1454d4845: 41 5f                       	popq	%r15
1454d4847: 5d                          	popq	%rbp
1454d4848: c3                          	retq
