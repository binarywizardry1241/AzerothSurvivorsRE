
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ed630: 55                          	pushq	%rbp
1454ed631: 41 57                       	pushq	%r15
1454ed633: 41 56                       	pushq	%r14
1454ed635: 56                          	pushq	%rsi
1454ed636: 57                          	pushq	%rdi
1454ed637: 53                          	pushq	%rbx
1454ed638: 48 81 ec f8 00 00 00        	subq	$0xf8, %rsp
1454ed63f: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454ed647: 44 0f 29 45 60              	movaps	%xmm8, 0x60(%rbp)
1454ed64c: 0f 29 7d 50                 	movaps	%xmm7, 0x50(%rbp)
1454ed650: 0f 29 75 40                 	movaps	%xmm6, 0x40(%rbp)
1454ed654: 48 c7 45 38 fe ff ff ff     	movq	$-0x2, 0x38(%rbp)
1454ed65c: 48 89 ce                    	movq	%rcx, %rsi
1454ed65f: 8b bd d0 00 00 00           	movl	0xd0(%rbp), %edi
1454ed665: f3 0f 10 b1 e4 08 00 00     	movss	0x8e4(%rcx), %xmm6
1454ed66d: 41 8b 00                    	movl	(%r8), %eax
1454ed670: 48 8d 0d ed f9 4b 01        	leaq	0x14bf9ed(%rip), %rcx   # 0x1469ad064
1454ed677: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1454ed67b: 48 01 c8                    	addq	%rcx, %rax
1454ed67e: ff e0                       	jmpq	*%rax
1454ed680: 0f 28 75 40                 	movaps	0x40(%rbp), %xmm6
1454ed684: 0f 28 7d 50                 	movaps	0x50(%rbp), %xmm7
1454ed688: 44 0f 28 45 60              	movaps	0x60(%rbp), %xmm8
1454ed68d: 48 81 c4 f8 00 00 00        	addq	$0xf8, %rsp
1454ed694: 5b                          	popq	%rbx
1454ed695: 5f                          	popq	%rdi
1454ed696: 5e                          	popq	%rsi
1454ed697: 41 5e                       	popq	%r14
1454ed699: 41 5f                       	popq	%r15
1454ed69b: 5d                          	popq	%rbp
1454ed69c: c3                          	retq
1454ed69d: 48 8b 86 d0 04 00 00        	movq	0x4d0(%rsi), %rax
1454ed6a4: 48 85 c0                    	testq	%rax, %rax
1454ed6a7: 74 d7                       	je	0x1454ed680 <.text+0x54ec680>
1454ed6a9: f3 41 0f 10 40 04           	movss	0x4(%r8), %xmm0
1454ed6af: 48 8b 9e c8 04 00 00        	movq	0x4c8(%rsi), %rbx
1454ed6b6: 48 69 c0 60 01 00 00        	imulq	$0x160, %rax, %rax      # imm = 0x160
1454ed6bd: eb 10                       	jmp	0x1454ed6cf <.text+0x54ec6cf>
1454ed6bf: 90                          	nop
1454ed6c0: 48 81 c3 60 01 00 00        	addq	$0x160, %rbx            # imm = 0x160
1454ed6c7: 48 05 a0 fe ff ff           	addq	$-0x160, %rax           # imm = 0xFEA0
1454ed6cd: 74 b1                       	je	0x1454ed680 <.text+0x54ec680>
1454ed6cf: 48 39 93 88 00 00 00        	cmpq	%rdx, 0x88(%rbx)
1454ed6d6: 75 e8                       	jne	0x1454ed6c0 <.text+0x54ec6c0>
1454ed6d8: 83 7b 68 01                 	cmpl	$0x1, 0x68(%rbx)
1454ed6dc: 74 e2                       	je	0x1454ed6c0 <.text+0x54ec6c0>
1454ed6de: f3 0f 10 8b 44 01 00 00     	movss	0x144(%rbx), %xmm1
1454ed6e6: 0f 2e f1                    	ucomiss	%xmm1, %xmm6
1454ed6e9: 0f 83 03 08 00 00           	jae	0x1454edef2 <.text+0x54ecef2>
1454ed6ef: f3 0f 10 93 48 01 00 00     	movss	0x148(%rbx), %xmm2
1454ed6f7: e9 12 08 00 00              	jmp	0x1454edf0e <.text+0x54ecf0e>
1454ed6fc: f3 41 0f 10 40 04           	movss	0x4(%r8), %xmm0
1454ed702: 8b 86 e4 03 00 00           	movl	0x3e4(%rsi), %eax
1454ed708: ff c0                       	incl	%eax
1454ed70a: 0f 2e b6 e0 03 00 00        	ucomiss	0x3e0(%rsi), %xmm6
1454ed711: b9 01 00 00 00              	movl	$0x1, %ecx
1454ed716: 0f 45 c1                    	cmovnel	%ecx, %eax
1454ed719: 0f 4a c1                    	cmovpl	%ecx, %eax
1454ed71c: 89 86 e4 03 00 00           	movl	%eax, 0x3e4(%rsi)
1454ed722: f3 0f 11 b6 e0 03 00 00     	movss	%xmm6, 0x3e0(%rsi)
1454ed72a: f3 0f 59 86 58 04 00 00     	mulss	0x458(%rsi), %xmm0
1454ed732: 83 f8 05                    	cmpl	$0x5, %eax
1454ed735: b9 05 00 00 00              	movl	$0x5, %ecx
1454ed73a: 0f 42 c8                    	cmovbl	%eax, %ecx
1454ed73d: f3 0f 2a c9                 	cvtsi2ss	%ecx, %xmm1
1454ed741: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
1454ed745: f3 0f 10 86 04 04 00 00     	movss	0x404(%rsi), %xmm0
1454ed74d: 0f 28 d0                    	movaps	%xmm0, %xmm2
1454ed750: f3 0f 5f d1                 	maxss	%xmm1, %xmm2
1454ed754: 0f 28 ca                    	movaps	%xmm2, %xmm1
1454ed757: f3 0f c2 ca 03              	cmpunordss	%xmm2, %xmm1
1454ed75c: 0f 28 d9                    	movaps	%xmm1, %xmm3
1454ed75f: 0f 55 da                    	andnps	%xmm2, %xmm3
1454ed762: 0f 54 c8                    	andps	%xmm0, %xmm1
1454ed765: 0f 56 cb                    	orps	%xmm3, %xmm1
1454ed768: f3 0f 11 8e 04 04 00 00     	movss	%xmm1, 0x404(%rsi)
1454ed770: 85 ff                       	testl	%edi, %edi
1454ed772: 0f 84 08 ff ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed778: 48 8b 86 f8 02 00 00        	movq	0x2f8(%rsi), %rax
1454ed77f: 48 8b 9e 00 03 00 00        	movq	0x300(%rsi), %rbx
1454ed786: 48 8d 0c dd 00 00 00 00     	leaq	(,%rbx,8), %rcx
1454ed78e: 48 8d 0c 49                 	leaq	(%rcx,%rcx,2), %rcx
1454ed792: 48 89 c2                    	movq	%rax, %rdx
1454ed795: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454ed7a0: 48 85 c9                    	testq	%rcx, %rcx
1454ed7a3: 0f 84 ee 04 00 00           	je	0x1454edc97 <.text+0x54ecc97>
1454ed7a9: 48 83 c1 e8                 	addq	$-0x18, %rcx
1454ed7ad: 39 7a 0c                    	cmpl	%edi, 0xc(%rdx)
1454ed7b0: 48 8d 52 18                 	leaq	0x18(%rdx), %rdx
1454ed7b4: 75 ea                       	jne	0x1454ed7a0 <.text+0x54ec7a0>
1454ed7b6: e9 c5 fe ff ff              	jmp	0x1454ed680 <.text+0x54ec680>
1454ed7bb: 48 8b 8e d0 04 00 00        	movq	0x4d0(%rsi), %rcx
1454ed7c2: 48 85 c9                    	testq	%rcx, %rcx
1454ed7c5: 0f 84 b5 fe ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed7cb: f3 41 0f 10 40 04           	movss	0x4(%r8), %xmm0
1454ed7d1: f3 41 0f 10 48 08           	movss	0x8(%r8), %xmm1
1454ed7d7: 48 8b 86 c8 04 00 00        	movq	0x4c8(%rsi), %rax
1454ed7de: 4c 69 c1 60 01 00 00        	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ed7e5: 31 c9                       	xorl	%ecx, %ecx
1454ed7e7: eb 17                       	jmp	0x1454ed800 <.text+0x54ec800>
1454ed7e9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454ed7f0: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454ed7f7: 49 39 c8                    	cmpq	%rcx, %r8
1454ed7fa: 0f 84 80 fe ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed800: 48 39 94 08 88 00 00 00     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ed808: 75 e6                       	jne	0x1454ed7f0 <.text+0x54ec7f0>
1454ed80a: 83 7c 08 68 01              	cmpl	$0x1, 0x68(%rax,%rcx)
1454ed80f: 74 df                       	je	0x1454ed7f0 <.text+0x54ec7f0>
1454ed811: f3 0f 58 f1                 	addss	%xmm1, %xmm6
1454ed815: f3 0f 11 84 08 98 00 00 00  	movss	%xmm0, 0x98(%rax,%rcx)
1454ed81e: f3 0f 11 b4 08 9c 00 00 00  	movss	%xmm6, 0x9c(%rax,%rcx)
1454ed827: e9 54 fe ff ff              	jmp	0x1454ed680 <.text+0x54ec680>
1454ed82c: 48 8b 8e d0 04 00 00        	movq	0x4d0(%rsi), %rcx
1454ed833: 48 85 c9                    	testq	%rcx, %rcx
1454ed836: 0f 84 44 fe ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed83c: f3 41 0f 10 48 04           	movss	0x4(%r8), %xmm1
1454ed842: f3 41 0f 10 40 08           	movss	0x8(%r8), %xmm0
1454ed848: 48 8b 86 c8 04 00 00        	movq	0x4c8(%rsi), %rax
1454ed84f: 4c 69 c1 60 01 00 00        	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ed856: 31 c9                       	xorl	%ecx, %ecx
1454ed858: eb 16                       	jmp	0x1454ed870 <.text+0x54ec870>
1454ed85a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454ed860: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454ed867: 49 39 c8                    	cmpq	%rcx, %r8
1454ed86a: 0f 84 10 fe ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed870: 48 39 94 08 88 00 00 00     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ed878: 75 e6                       	jne	0x1454ed860 <.text+0x54ec860>
1454ed87a: 83 7c 08 68 01              	cmpl	$0x1, 0x68(%rax,%rcx)
1454ed87f: 74 df                       	je	0x1454ed860 <.text+0x54ec860>
1454ed881: f3 0f 58 f0                 	addss	%xmm0, %xmm6
1454ed885: f3 0f 11 8c 08 a0 00 00 00  	movss	%xmm1, 0xa0(%rax,%rcx)
1454ed88e: f3 0f 11 b4 08 a4 00 00 00  	movss	%xmm6, 0xa4(%rax,%rcx)
1454ed897: f3 0f 11 84 08 38 01 00 00  	movss	%xmm0, 0x138(%rax,%rcx)
1454ed8a0: 85 ff                       	testl	%edi, %edi
1454ed8a2: 0f 84 d8 fd ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed8a8: 44 8b 84 08 34 01 00 00     	movl	0x134(%rax,%rcx), %r8d
1454ed8b0: 41 39 f8                    	cmpl	%edi, %r8d
1454ed8b3: 0f 84 c7 fd ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454ed8b9: 89 bc 08 34 01 00 00        	movl	%edi, 0x134(%rax,%rcx)
1454ed8c0: 45 85 c0                    	testl	%r8d, %r8d
1454ed8c3: 74 11                       	je	0x1454ed8d6 <.text+0x54ec8d6>
1454ed8c5: 48 89 f1                    	movq	%rsi, %rcx
1454ed8c8: 48 89 d3                    	movq	%rdx, %rbx
1454ed8cb: 45 31 c9                    	xorl	%r9d, %r9d
1454ed8ce: e8 cd 3a fe ff              	callq	0x1454d13a0 <.text+0x54d03a0>
1454ed8d3: 48 89 da                    	movq	%rbx, %rdx
1454ed8d6: 48 89 f1                    	movq	%rsi, %rcx
1454ed8d9: e9 62 07 00 00              	jmp	0x1454ee040 <.text+0x54ed040>
1454ed8de: f3 41 0f 59 58 04           	mulss	0x4(%r8), %xmm3
1454ed8e4: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454ed8e8: 48 89 f2                    	movq	%rsi, %rdx
1454ed8eb: 41 89 f8                    	movl	%edi, %r8d
1454ed8ee: 0f 28 fb                    	movaps	%xmm3, %xmm7
1454ed8f1: e8 3a 17 fa ff              	callq	0x14548f030 <.text+0x548e030>
1454ed8f6: f3 0f 10 86 00 04 00 00     	movss	0x400(%rsi), %xmm0
1454ed8fe: f3 0f 58 f8                 	addss	%xmm0, %xmm7
1454ed902: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454ed905: f3 0f 5d 8e 58 04 00 00     	minss	0x458(%rsi), %xmm1
1454ed90d: 0f 28 f1                    	movaps	%xmm1, %xmm6
1454ed910: f3 0f c2 f1 03              	cmpunordss	%xmm1, %xmm6
1454ed915: 0f 54 fe                    	andps	%xmm6, %xmm7
1454ed918: 0f 55 f1                    	andnps	%xmm1, %xmm6
1454ed91b: 0f 56 f7                    	orps	%xmm7, %xmm6
1454ed91e: f3 0f 11 b6 00 04 00 00     	movss	%xmm6, 0x400(%rsi)
1454ed926: f3 0f 5c f0                 	subss	%xmm0, %xmm6
1454ed92a: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454ed92d: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454ed930: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
1454ed934: 0f 83 d5 02 00 00           	jae	0x1454edc0f <.text+0x54ecc0f>
1454ed93a: 48 83 fa fe                 	cmpq	$-0x2, %rdx
1454ed93e: 0f 85 c7 03 00 00           	jne	0x1454edd0b <.text+0x54ecd0b>
1454ed944: 48 8d 3d 85 d6 4b 01        	leaq	0x14bd685(%rip), %rdi   # 0x1469aafd0
1454ed94b: bb 05 00 00 00              	movl	$0x5, %ebx
1454ed950: ba 05 00 00 00              	movl	$0x5, %edx
1454ed955: 48 89 f9                    	movq	%rdi, %rcx
1454ed958: e8 a3 4a f6 ff              	callq	0x145452400 <.text+0x5451400>
1454ed95d: 48 85 c0                    	testq	%rax, %rax
1454ed960: 48 0f 44 c7                 	cmoveq	%rdi, %rax
1454ed964: 48 0f 44 d3                 	cmoveq	%rbx, %rdx
1454ed968: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454ed96c: 48 89 55 18                 	movq	%rdx, 0x18(%rbp)
1454ed970: 48 8d 05 5e d6 4b 01        	leaq	0x14bd65e(%rip), %rax   # 0x1469aafd5
1454ed977: 48 89 45 20                 	movq	%rax, 0x20(%rbp)
1454ed97b: 48 c7 45 28 18 00 00 00     	movq	$0x18, 0x28(%rbp)
1454ed983: c6 45 30 00                 	movb	$0x0, 0x30(%rbp)
1454ed987: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454ed98e: e9 90 03 00 00              	jmp	0x1454edd23 <.text+0x54ecd23>
1454ed993: f3 0f 10 8e 00 04 00 00     	movss	0x400(%rsi), %xmm1
1454ed99b: f3 0f 10 b6 58 04 00 00     	movss	0x458(%rsi), %xmm6
1454ed9a3: f3 41 0f 10 50 04           	movss	0x4(%r8), %xmm2
1454ed9a9: f3 0f 59 d6                 	mulss	%xmm6, %xmm2
1454ed9ad: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1454ed9b1: 0f 28 da                    	movaps	%xmm2, %xmm3
1454ed9b4: f3 0f 5d de                 	minss	%xmm6, %xmm3
1454ed9b8: 0f 28 c3                    	movaps	%xmm3, %xmm0
1454ed9bb: f3 0f c2 c3 03              	cmpunordss	%xmm3, %xmm0
1454ed9c0: 0f 54 d0                    	andps	%xmm0, %xmm2
1454ed9c3: 0f 55 c3                    	andnps	%xmm3, %xmm0
1454ed9c6: 0f 56 c2                    	orps	%xmm2, %xmm0
1454ed9c9: f3 0f 11 86 00 04 00 00     	movss	%xmm0, 0x400(%rsi)
1454ed9d1: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454ed9d5: f3 44 0f 5c c1              	subss	%xmm1, %xmm8
1454ed9da: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454ed9dd: 41 0f 2e f8                 	ucomiss	%xmm8, %xmm7
1454ed9e1: 73 73                       	jae	0x1454eda56 <.text+0x54eca56>
1454ed9e3: 48 8d 3d e6 d5 4b 01        	leaq	0x14bd5e6(%rip), %rdi   # 0x1469aafd0
1454ed9ea: bb 05 00 00 00              	movl	$0x5, %ebx
1454ed9ef: ba 05 00 00 00              	movl	$0x5, %edx
1454ed9f4: 48 89 f9                    	movq	%rdi, %rcx
1454ed9f7: e8 04 4a f6 ff              	callq	0x145452400 <.text+0x5451400>
1454ed9fc: 48 85 c0                    	testq	%rax, %rax
1454ed9ff: 48 0f 44 c7                 	cmoveq	%rdi, %rax
1454eda03: 48 0f 44 d3                 	cmoveq	%rbx, %rdx
1454eda07: 48 c7 45 08 ff ff ff ff     	movq	$-0x1, 0x8(%rbp)
1454eda0f: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454eda13: 48 89 55 18                 	movq	%rdx, 0x18(%rbp)
1454eda17: 48 8d 05 b7 d5 4b 01        	leaq	0x14bd5b7(%rip), %rax   # 0x1469aafd5
1454eda1e: 48 89 45 20                 	movq	%rax, 0x20(%rbp)
1454eda22: 48 c7 45 28 18 00 00 00     	movq	$0x18, 0x28(%rbp)
1454eda2a: c6 45 30 00                 	movb	$0x0, 0x30(%rbp)
1454eda2e: 48 8d 8e e0 05 00 00        	leaq	0x5e0(%rsi), %rcx
1454eda35: 0f 57 d2                    	xorps	%xmm2, %xmm2
1454eda38: f3 41 0f 5a d0              	cvtss2sd	%xmm8, %xmm2
1454eda3d: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1454eda41: e8 3a 25 00 00              	callq	0x1454eff80 <.text+0x54eef80>
1454eda46: f3 0f 10 86 00 04 00 00     	movss	0x400(%rsi), %xmm0
1454eda4e: f3 0f 10 b6 58 04 00 00     	movss	0x458(%rsi), %xmm6
1454eda56: f3 0f 5f c7                 	maxss	%xmm7, %xmm0
1454eda5a: e8 0e 94 26 00              	callq	0x145756e6d <.text+0x5755e6d>
1454eda5f: f3 48 0f 2c d8              	cvttss2si	%xmm0, %rbx
1454eda64: 45 31 f6                    	xorl	%r14d, %r14d
1454eda67: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454eda6a: 41 0f 42 de                 	cmovbl	%r14d, %ebx
1454eda6e: f3 44 0f 10 05 a5 da 3f 00  	movss	0x3fdaa5(%rip), %xmm8   # 0x1458eb51c
1454eda77: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454eda7b: 41 bf ff ff ff ff           	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454eda81: 41 0f 47 df                 	cmoval	%r15d, %ebx
1454eda85: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454eda88: e8 e0 93 26 00              	callq	0x145756e6d <.text+0x5755e6d>
1454eda8d: f3 48 0f 2c f8              	cvttss2si	%xmm0, %rdi
1454eda92: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454eda95: 41 0f 42 fe                 	cmovbl	%r14d, %edi
1454eda99: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454eda9d: 41 0f 47 ff                 	cmoval	%r15d, %edi
1454edaa1: 4c 8d b6 b8 08 00 00        	leaq	0x8b8(%rsi), %r14
1454edaa8: 48 8b 86 b8 08 00 00        	movq	0x8b8(%rsi), %rax
1454edaaf: 48 85 c0                    	testq	%rax, %rax
1454edab2: 0f 84 7e 01 00 00           	je	0x1454edc36 <.text+0x54ecc36>
1454edab8: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454edabf: 66 ba 16 00                 	movw	$0x16, %dx
1454edac3: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454edac8: 45 89 ca                    	movl	%r9d, %r10d
1454edacb: 45 01 d2                    	addl	%r10d, %r10d
1454edace: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454edad5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454edae0: 4d 85 d2                    	testq	%r10, %r10
1454edae3: 74 2a                       	je	0x1454edb0f <.text+0x54ecb0f>
1454edae5: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454edaeb: 41 0f 97 c3                 	seta	%r11b
1454edaef: 41 80 db 00                 	sbbb	$0x0, %r11b
1454edaf3: 49 ff c0                    	incq	%r8
1454edaf6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454edafa: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454edafe: 74 e0                       	je	0x1454edae0 <.text+0x54ecae0>
1454edb00: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454edb04: 45 85 c9                    	testl	%r9d, %r9d
1454edb07: 0f 84 8b 00 00 00           	je	0x1454edb98 <.text+0x54ecb98>
1454edb0d: eb 03                       	jmp	0x1454edb12 <.text+0x54ecb12>
1454edb0f: 4d 89 c8                    	movq	%r9, %r8
1454edb12: 48 83 e9 01                 	subq	$0x1, %rcx
1454edb16: 0f 82 1c 01 00 00           	jb	0x1454edc38 <.text+0x54ecc38>
1454edb1c: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454edb21: eb a0                       	jmp	0x1454edac3 <.text+0x54ecac3>
1454edb23: 48 8b 8e d0 04 00 00        	movq	0x4d0(%rsi), %rcx
1454edb2a: 48 85 c9                    	testq	%rcx, %rcx
1454edb2d: 0f 84 4d fb ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454edb33: f3 41 0f 10 40 04           	movss	0x4(%r8), %xmm0
1454edb39: 48 8b 86 c8 04 00 00        	movq	0x4c8(%rsi), %rax
1454edb40: 4c 69 c1 60 01 00 00        	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454edb47: 31 c9                       	xorl	%ecx, %ecx
1454edb49: eb 15                       	jmp	0x1454edb60 <.text+0x54ecb60>
1454edb4b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454edb50: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454edb57: 49 39 c8                    	cmpq	%rcx, %r8
1454edb5a: 0f 84 20 fb ff ff           	je	0x1454ed680 <.text+0x54ec680>
1454edb60: 48 39 94 08 88 00 00 00     	cmpq	%rdx, 0x88(%rax,%rcx)
1454edb68: 75 e6                       	jne	0x1454edb50 <.text+0x54ecb50>
1454edb6a: 83 7c 08 68 01              	cmpl	$0x1, 0x68(%rax,%rcx)
1454edb6f: 74 df                       	je	0x1454edb50 <.text+0x54ecb50>
1454edb71: 48 83 7c 08 18 ff           	cmpq	$-0x1, 0x18(%rax,%rcx)
1454edb77: 0f 85 03 fb ff ff           	jne	0x1454ed680 <.text+0x54ec680>
1454edb7d: f3 0f 58 c6                 	addss	%xmm6, %xmm0
1454edb81: f3 0f 11 84 08 50 01 00 00  	movss	%xmm0, 0x150(%rax,%rcx)
1454edb8a: f3 0f 11 b4 08 2c 01 00 00  	movss	%xmm6, 0x12c(%rax,%rcx)
1454edb93: e9 e8 fa ff ff              	jmp	0x1454ed680 <.text+0x54ec680>
1454edb98: 42 89 5c 80 08              	movl	%ebx, 0x8(%rax,%r8,4)
1454edb9d: 49 8b 06                    	movq	(%r14), %rax
1454edba0: 48 85 c0                    	testq	%rax, %rax
1454edba3: 0f 84 c7 00 00 00           	je	0x1454edc70 <.text+0x54ecc70>
1454edba9: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454edbb0: 66 ba 1c 00                 	movw	$0x1c, %dx
1454edbb4: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454edbb9: 45 89 ca                    	movl	%r9d, %r10d
1454edbbc: 45 01 d2                    	addl	%r10d, %r10d
1454edbbf: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454edbc6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454edbd0: 4d 85 d2                    	testq	%r10, %r10
1454edbd3: 74 2a                       	je	0x1454edbff <.text+0x54ecbff>
1454edbd5: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454edbdb: 41 0f 97 c3                 	seta	%r11b
1454edbdf: 41 80 db 00                 	sbbb	$0x0, %r11b
1454edbe3: 49 ff c0                    	incq	%r8
1454edbe6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454edbea: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454edbee: 74 e0                       	je	0x1454edbd0 <.text+0x54ecbd0>
1454edbf0: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454edbf4: 45 85 c9                    	testl	%r9d, %r9d
1454edbf7: 0f 84 7e 02 00 00           	je	0x1454ede7b <.text+0x54ece7b>
1454edbfd: eb 03                       	jmp	0x1454edc02 <.text+0x54ecc02>
1454edbff: 4d 89 c8                    	movq	%r9, %r8
1454edc02: 48 83 e9 01                 	subq	$0x1, %rcx
1454edc06: 72 6a                       	jb	0x1454edc72 <.text+0x54ecc72>
1454edc08: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454edc0d: eb a5                       	jmp	0x1454edbb4 <.text+0x54ecbb4>
1454edc0f: 48 83 fa fd                 	cmpq	$-0x3, %rdx
1454edc13: 0f 87 22 01 00 00           	ja	0x1454edd3b <.text+0x54ecd3b>
1454edc19: 48 85 d2                    	testq	%rdx, %rdx
1454edc1c: 0f 84 19 01 00 00           	je	0x1454edd3b <.text+0x54ecd3b>
1454edc22: 48 8b 4d d0                 	movq	-0x30(%rbp), %rcx
1454edc26: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454edc2c: e8 9f 45 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454edc31: e9 05 01 00 00              	jmp	0x1454edd3b <.text+0x54ecd3b>
1454edc36: 31 c0                       	xorl	%eax, %eax
1454edc38: 4c 89 75 08                 	movq	%r14, 0x8(%rbp)
1454edc3c: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454edc40: 48 c7 45 18 00 00 00 00     	movq	$0x0, 0x18(%rbp)
1454edc48: 4c 89 45 20                 	movq	%r8, 0x20(%rbp)
1454edc4c: 48 c7 45 28 16 00 00 00     	movq	$0x16, 0x28(%rbp)
1454edc54: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454edc58: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1454edc5c: 41 89 d8                    	movl	%ebx, %r8d
1454edc5f: e8 ec 9d f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454edc64: 49 8b 06                    	movq	(%r14), %rax
1454edc67: 48 85 c0                    	testq	%rax, %rax
1454edc6a: 0f 85 39 ff ff ff           	jne	0x1454edba9 <.text+0x54ecba9>
1454edc70: 31 c0                       	xorl	%eax, %eax
1454edc72: 4c 89 75 08                 	movq	%r14, 0x8(%rbp)
1454edc76: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454edc7a: 48 c7 45 18 00 00 00 00     	movq	$0x0, 0x18(%rbp)
1454edc82: 4c 89 45 20                 	movq	%r8, 0x20(%rbp)
1454edc86: 48 c7 45 28 1c 00 00 00     	movq	$0x1c, 0x28(%rbp)
1454edc8e: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454edc92: e9 4a 02 00 00              	jmp	0x1454edee1 <.text+0x54ecee1>
1454edc97: 48 3b 9e f0 02 00 00        	cmpq	0x2f0(%rsi), %rbx
1454edc9e: 75 19                       	jne	0x1454edcb9 <.text+0x54eccb9>
1454edca0: 48 8d 8e f0 02 00 00        	leaq	0x2f0(%rsi), %rcx
1454edca7: 4d 89 c6                    	movq	%r8, %r14
1454edcaa: e8 71 5f 27 00              	callq	0x145763c20 <.text+0x5762c20>
1454edcaf: 4d 89 f0                    	movq	%r14, %r8
1454edcb2: 48 8b 86 f8 02 00 00        	movq	0x2f8(%rsi), %rax
1454edcb9: 48 8d 0c 5b                 	leaq	(%rbx,%rbx,2), %rcx
1454edcbd: 41 8b 50 08                 	movl	0x8(%r8), %edx
1454edcc1: 89 54 c8 08                 	movl	%edx, 0x8(%rax,%rcx,8)
1454edcc5: 49 8b 10                    	movq	(%r8), %rdx
1454edcc8: 48 89 14 c8                 	movq	%rdx, (%rax,%rcx,8)
1454edccc: 89 7c c8 0c                 	movl	%edi, 0xc(%rax,%rcx,8)
1454edcd0: f3 0f 10 05 bc 08 45 00     	movss	0x4508bc(%rip), %xmm0   # 0x14593e594
1454edcd8: 0f 13 44 c8 10              	movlps	%xmm0, 0x10(%rax,%rcx,8)
1454edcdd: 48 ff c3                    	incq	%rbx
1454edce0: 48 89 9e 00 03 00 00        	movq	%rbx, 0x300(%rsi)
1454edce7: 48 89 f1                    	movq	%rsi, %rcx
1454edcea: 0f 28 75 40                 	movaps	0x40(%rbp), %xmm6
1454edcee: 0f 28 7d 50                 	movaps	0x50(%rbp), %xmm7
1454edcf2: 44 0f 28 45 60              	movaps	0x60(%rbp), %xmm8
1454edcf7: 48 81 c4 f8 00 00 00        	addq	$0xf8, %rsp
1454edcfe: 5b                          	popq	%rbx
1454edcff: 5f                          	popq	%rdi
1454edd00: 5e                          	popq	%rsi
1454edd01: 41 5e                       	popq	%r14
1454edd03: 41 5f                       	popq	%r15
1454edd05: 5d                          	popq	%rbp
1454edd06: e9 a5 f5 f9 ff              	jmp	0x14548d2b0 <.text+0x548c2b0>
1454edd0b: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1454edd0f: 48 89 45 30                 	movq	%rax, 0x30(%rbp)
1454edd13: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
1454edd17: 0f 10 4d e0                 	movups	-0x20(%rbp), %xmm1
1454edd1b: 0f 11 4d 20                 	movups	%xmm1, 0x20(%rbp)
1454edd1f: 0f 11 45 10                 	movups	%xmm0, 0x10(%rbp)
1454edd23: 48 89 55 08                 	movq	%rdx, 0x8(%rbp)
1454edd27: 48 8d 8e e0 05 00 00        	leaq	0x5e0(%rsi), %rcx
1454edd2e: f3 0f 5a d6                 	cvtss2sd	%xmm6, %xmm2
1454edd32: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1454edd36: e8 45 22 00 00              	callq	0x1454eff80 <.text+0x54eef80>
1454edd3b: f3 0f 10 86 00 04 00 00     	movss	0x400(%rsi), %xmm0
1454edd43: f3 0f 10 b6 58 04 00 00     	movss	0x458(%rsi), %xmm6
1454edd4b: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454edd4e: f3 0f 5f c7                 	maxss	%xmm7, %xmm0
1454edd52: e8 16 91 26 00              	callq	0x145756e6d <.text+0x5755e6d>
1454edd57: f3 48 0f 2c d8              	cvttss2si	%xmm0, %rbx
1454edd5c: 45 31 f6                    	xorl	%r14d, %r14d
1454edd5f: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454edd62: 41 0f 42 de                 	cmovbl	%r14d, %ebx
1454edd66: f3 44 0f 10 05 ad d7 3f 00  	movss	0x3fd7ad(%rip), %xmm8   # 0x1458eb51c
1454edd6f: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454edd73: 41 bf ff ff ff ff           	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454edd79: 41 0f 47 df                 	cmoval	%r15d, %ebx
1454edd7d: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454edd80: e8 e8 90 26 00              	callq	0x145756e6d <.text+0x5755e6d>
1454edd85: f3 48 0f 2c f8              	cvttss2si	%xmm0, %rdi
1454edd8a: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
1454edd8d: 41 0f 42 fe                 	cmovbl	%r14d, %edi
1454edd91: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454edd95: 41 0f 47 ff                 	cmoval	%r15d, %edi
1454edd99: 4c 8d b6 b8 08 00 00        	leaq	0x8b8(%rsi), %r14
1454edda0: 48 8b 86 b8 08 00 00        	movq	0x8b8(%rsi), %rax
1454edda7: 48 85 c0                    	testq	%rax, %rax
1454eddaa: 0f 84 d5 00 00 00           	je	0x1454ede85 <.text+0x54ece85>
1454eddb0: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454eddb7: 66 ba 16 00                 	movw	$0x16, %dx
1454eddbb: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454eddc0: 45 89 ca                    	movl	%r9d, %r10d
1454eddc3: 45 01 d2                    	addl	%r10d, %r10d
1454eddc6: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454eddcd: 0f 1f 00                    	nopl	(%rax)
1454eddd0: 4d 85 d2                    	testq	%r10, %r10
1454eddd3: 74 26                       	je	0x1454eddfb <.text+0x54ecdfb>
1454eddd5: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454edddb: 41 0f 97 c3                 	seta	%r11b
1454edddf: 41 80 db 00                 	sbbb	$0x0, %r11b
1454edde3: 49 ff c0                    	incq	%r8
1454edde6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454eddea: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454eddee: 74 e0                       	je	0x1454eddd0 <.text+0x54ecdd0>
1454eddf0: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454eddf4: 45 85 c9                    	testl	%r9d, %r9d
1454eddf7: 74 16                       	je	0x1454ede0f <.text+0x54ece0f>
1454eddf9: eb 03                       	jmp	0x1454eddfe <.text+0x54ecdfe>
1454eddfb: 4d 89 c8                    	movq	%r9, %r8
1454eddfe: 48 83 e9 01                 	subq	$0x1, %rcx
1454ede02: 0f 82 7f 00 00 00           	jb	0x1454ede87 <.text+0x54ece87>
1454ede08: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ede0d: eb ac                       	jmp	0x1454eddbb <.text+0x54ecdbb>
1454ede0f: 42 89 5c 80 08              	movl	%ebx, 0x8(%rax,%r8,4)
1454ede14: 49 8b 06                    	movq	(%r14), %rax
1454ede17: 48 85 c0                    	testq	%rax, %rax
1454ede1a: 0f 84 9f 00 00 00           	je	0x1454edebf <.text+0x54ecebf>
1454ede20: 48 8b 8e c0 08 00 00        	movq	0x8c0(%rsi), %rcx
1454ede27: 66 ba 1c 00                 	movw	$0x1c, %dx
1454ede2b: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ede30: 45 89 ca                    	movl	%r9d, %r10d
1454ede33: 45 01 d2                    	addl	%r10d, %r10d
1454ede36: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ede3d: 0f 1f 00                    	nopl	(%rax)
1454ede40: 4d 85 d2                    	testq	%r10, %r10
1454ede43: 74 26                       	je	0x1454ede6b <.text+0x54ece6b>
1454ede45: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454ede4b: 41 0f 97 c3                 	seta	%r11b
1454ede4f: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ede53: 49 ff c0                    	incq	%r8
1454ede56: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ede5a: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ede5e: 74 e0                       	je	0x1454ede40 <.text+0x54ece40>
1454ede60: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ede64: 45 85 c9                    	testl	%r9d, %r9d
1454ede67: 74 12                       	je	0x1454ede7b <.text+0x54ece7b>
1454ede69: eb 03                       	jmp	0x1454ede6e <.text+0x54ece6e>
1454ede6b: 4d 89 c8                    	movq	%r9, %r8
1454ede6e: 48 83 e9 01                 	subq	$0x1, %rcx
1454ede72: 72 4d                       	jb	0x1454edec1 <.text+0x54ecec1>
1454ede74: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ede79: eb b0                       	jmp	0x1454ede2b <.text+0x54ece2b>
1454ede7b: 42 89 7c 80 08              	movl	%edi, 0x8(%rax,%r8,4)
1454ede80: e9 fb f7 ff ff              	jmp	0x1454ed680 <.text+0x54ec680>
1454ede85: 31 c0                       	xorl	%eax, %eax
1454ede87: 4c 89 75 08                 	movq	%r14, 0x8(%rbp)
1454ede8b: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454ede8f: 48 c7 45 18 00 00 00 00     	movq	$0x0, 0x18(%rbp)
1454ede97: 4c 89 45 20                 	movq	%r8, 0x20(%rbp)
1454ede9b: 48 c7 45 28 16 00 00 00     	movq	$0x16, 0x28(%rbp)
1454edea3: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1454edea7: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1454edeab: 41 89 d8                    	movl	%ebx, %r8d
1454edeae: e8 9d 9b f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454edeb3: 49 8b 06                    	movq	(%r14), %rax
1454edeb6: 48 85 c0                    	testq	%rax, %rax
1454edeb9: 0f 85 61 ff ff ff           	jne	0x1454ede20 <.text+0x54ece20>
1454edebf: 31 c0                       	xorl	%eax, %eax
1454edec1: 4c 89 75 08                 	movq	%r14, 0x8(%rbp)
1454edec5: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454edec9: 48 c7 45 18 00 00 00 00     	movq	$0x0, 0x18(%rbp)
1454eded1: 4c 89 45 20                 	movq	%r8, 0x20(%rbp)
1454eded5: 48 c7 45 28 1c 00 00 00     	movq	$0x1c, 0x28(%rbp)
1454ededd: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1454edee1: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1454edee5: 41 89 f8                    	movl	%edi, %r8d
1454edee8: e8 63 9b f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454edeed: e9 8e f7 ff ff              	jmp	0x1454ed680 <.text+0x54ec680>
1454edef2: f3 0f 10 93 4c 01 00 00     	movss	0x14c(%rbx), %xmm2
1454edefa: 0f 2e d6                    	ucomiss	%xmm6, %xmm2
1454edefd: 0f 87 7d f7 ff ff           	ja	0x1454ed680 <.text+0x54ec680>
1454edf03: f3 0f 11 b3 48 01 00 00     	movss	%xmm6, 0x148(%rbx)
1454edf0b: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454edf0e: 31 c0                       	xorl	%eax, %eax
1454edf10: 48 83 7b 18 ff              	cmpq	$-0x1, 0x18(%rbx)
1454edf15: 0f 94 c0                    	sete	%al
1454edf18: 48 8d 0d 71 09 45 00        	leaq	0x450971(%rip), %rcx    # 0x14593e890
1454edf1f: f3 0f 59 04 81              	mulss	(%rcx,%rax,4), %xmm0
1454edf24: f3 0f 58 c6                 	addss	%xmm6, %xmm0
1454edf28: f3 0f 58 15 fc 86 40 00     	addss	0x4086fc(%rip), %xmm2   # 0x1458f662c
1454edf30: 0f 28 d8                    	movaps	%xmm0, %xmm3
1454edf33: f3 0f 5d da                 	minss	%xmm2, %xmm3
1454edf37: 0f 28 d3                    	movaps	%xmm3, %xmm2
1454edf3a: f3 0f c2 d3 03              	cmpunordss	%xmm3, %xmm2
1454edf3f: 0f 54 c2                    	andps	%xmm2, %xmm0
1454edf42: 0f 55 d3                    	andnps	%xmm3, %xmm2
1454edf45: 0f 56 d0                    	orps	%xmm0, %xmm2
1454edf48: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
1454edf4b: 0f 83 2f f7 ff ff           	jae	0x1454ed680 <.text+0x54ec680>
1454edf51: 49 89 d6                    	movq	%rdx, %r14
1454edf54: f3 0f 11 93 44 01 00 00     	movss	%xmm2, 0x144(%rbx)
1454edf5c: 4c 8b be 78 08 00 00        	movq	0x878(%rsi), %r15
1454edf63: 49 83 c7 10                 	addq	$0x10, %r15
1454edf67: 48 8d 4d 08                 	leaq	0x8(%rbp), %rcx
1454edf6b: 48 89 da                    	movq	%rbx, %rdx
1454edf6e: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454edf71: e8 8a f2 f1 ff              	callq	0x14540d200 <.text+0x540c200>
1454edf76: f2 0f 10 7d 08              	movsd	0x8(%rbp), %xmm7
1454edf7b: f3 0f 16 d7                 	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454edf7f: 4c 89 f9                    	movq	%r15, %rcx
1454edf82: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454edf85: e8 66 48 f7 ff              	callq	0x1454627f0 <.text+0x54617f0>
1454edf8a: a8 01                       	testb	$0x1, %al
1454edf8c: 75 05                       	jne	0x1454edf93 <.text+0x54ecf93>
1454edf8e: f3 0f 10 45 10              	movss	0x10(%rbp), %xmm0
1454edf93: f2 0f 11 7d f8              	movsd	%xmm7, -0x8(%rbp)
1454edf98: f3 0f 11 45 00              	movss	%xmm0, (%rbp)
1454edf9d: 8b 45 00                    	movl	(%rbp), %eax
1454edfa0: 89 83 14 01 00 00           	movl	%eax, 0x114(%rbx)
1454edfa6: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1454edfaa: 48 89 83 0c 01 00 00        	movq	%rax, 0x10c(%rbx)
1454edfb1: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1454edfb5: 48 89 83 18 01 00 00        	movq	%rax, 0x118(%rbx)
1454edfbc: 8b 45 00                    	movl	(%rbp), %eax
1454edfbf: 89 83 20 01 00 00           	movl	%eax, 0x120(%rbx)
1454edfc5: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454edfc8: f3 0f 10 c6                 	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1454edfcc: 0f 13 83 24 01 00 00        	movlps	%xmm0, 0x124(%rbx)
1454edfd3: 44 8b 8e 08 09 00 00        	movl	0x908(%rsi), %r9d
1454edfda: 41 ff c1                    	incl	%r9d
1454edfdd: 44 89 8e 08 09 00 00        	movl	%r9d, 0x908(%rsi)
1454edfe4: 48 8d 4d 08                 	leaq	0x8(%rbp), %rcx
1454edfe8: 4c 8d 45 f8                 	leaq	-0x8(%rbp), %r8
1454edfec: 4c 89 f2                    	movq	%r14, %rdx
1454edfef: e8 bc 71 f5 ff              	callq	0x1454451b0 <.text+0x54441b0>
1454edff4: 48 8b 9e 48 05 00 00        	movq	0x548(%rsi), %rbx
1454edffb: 48 3b 9e 38 05 00 00        	cmpq	0x538(%rsi), %rbx
1454ee002: 75 0d                       	jne	0x1454ee011 <.text+0x54ed011>
1454ee004: 48 8d 8e 38 05 00 00        	leaq	0x538(%rsi), %rcx
1454ee00b: e8 a0 a0 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454ee010: 90                          	nop
1454ee011: 48 8b 86 40 05 00 00        	movq	0x540(%rsi), %rax
1454ee018: 48 89 d9                    	movq	%rbx, %rcx
1454ee01b: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ee01f: 0f 10 45 08                 	movups	0x8(%rbp), %xmm0
1454ee023: 0f 10 4d 18                 	movups	0x18(%rbp), %xmm1
1454ee027: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454ee02c: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454ee030: 48 ff c3                    	incq	%rbx
1454ee033: 48 89 9e 48 05 00 00        	movq	%rbx, 0x548(%rsi)
1454ee03a: 48 89 f1                    	movq	%rsi, %rcx
1454ee03d: 4c 89 f2                    	movq	%r14, %rdx
1454ee040: 41 89 f8                    	movl	%edi, %r8d
1454ee043: 41 b1 01                    	movb	$0x1, %r9b
1454ee046: 0f 28 75 40                 	movaps	0x40(%rbp), %xmm6
1454ee04a: 0f 28 7d 50                 	movaps	0x50(%rbp), %xmm7
1454ee04e: 44 0f 28 45 60              	movaps	0x60(%rbp), %xmm8
1454ee053: 48 81 c4 f8 00 00 00        	addq	$0xf8, %rsp
1454ee05a: 5b                          	popq	%rbx
1454ee05b: 5f                          	popq	%rdi
1454ee05c: 5e                          	popq	%rsi
1454ee05d: 41 5e                       	popq	%r14
1454ee05f: 41 5f                       	popq	%r15
1454ee061: 5d                          	popq	%rbp
1454ee062: e9 39 33 fe ff              	jmp	0x1454d13a0 <.text+0x54d03a0>
