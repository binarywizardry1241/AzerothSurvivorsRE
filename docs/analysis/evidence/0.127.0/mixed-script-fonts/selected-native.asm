14027c320: 41 57                       	pushq	%r15
14027c322: 41 56                       	pushq	%r14
14027c324: 41 55                       	pushq	%r13
14027c326: 41 54                       	pushq	%r12
14027c328: 56                          	pushq	%rsi
14027c329: 57                          	pushq	%rdi
14027c32a: 55                          	pushq	%rbp
14027c32b: 53                          	pushq	%rbx
14027c32c: 48 83 ec 58                 	subq	$0x58, %rsp
14027c330: 44 0f 29 44 24 40           	movaps	%xmm8, 0x40(%rsp)
14027c336: 0f 29 7c 24 30              	movaps	%xmm7, 0x30(%rsp)
14027c33b: 0f 29 74 24 20              	movaps	%xmm6, 0x20(%rsp)
14027c340: 4c 89 c6                    	movq	%r8, %rsi
14027c343: 48 89 d7                    	movq	%rdx, %rdi
14027c346: 48 89 cb                    	movq	%rcx, %rbx
14027c349: 48 01 d6                    	addq	%rdx, %rsi
14027c34c: 4c 8d 35 99 78 ff 05        	leaq	0x5ff7899(%rip), %r14   # 0x146273bec
14027c353: 4c 8d 3d 90 78 ff 05        	leaq	0x5ff7890(%rip), %r15   # 0x146273bea
14027c35a: 66 0f 6f 35 ce 5c ff 05     	movdqa	0x5ff5cce(%rip), %xmm6  # 0x146272030
14027c362: 66 0f 6f 3d 26 0f f9 05     	movdqa	0x5f90f26(%rip), %xmm7  # 0x14620d290
14027c36a: 66 44 0f 6f 05 cd 5c ff 05  	movdqa	0x5ff5ccd(%rip), %xmm8  # 0x146272040
14027c373: eb 1f                       	jmp	0x14027c394 <.text+0x27b394>
14027c375: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14027c380: 4c 89 2c 28                 	movq	%r13, (%rax,%rbp)
14027c384: 48 c7 44 28 08 02 00 00 00  	movq	$0x2, 0x8(%rax,%rbp)
14027c38d: 49 ff c4                    	incq	%r12
14027c390: 4c 89 63 10                 	movq	%r12, 0x10(%rbx)
14027c394: 48 39 f7                    	cmpq	%rsi, %rdi
14027c397: 0f 84 c4 01 00 00           	je	0x14027c561 <.text+0x27b561>
14027c39d: 0f b6 17                    	movzbl	(%rdi), %edx
14027c3a0: 0f b6 c2                    	movzbl	%dl, %eax
14027c3a3: 84 c0                       	testb	%al, %al
14027c3a5: 78 19                       	js	0x14027c3c0 <.text+0x27b3c0>
14027c3a7: 48 ff c7                    	incq	%rdi
14027c3aa: 3d 00 11 00 00              	cmpl	$0x1100, %eax           # imm = 0x1100
14027c3af: 72 e3                       	jb	0x14027c394 <.text+0x27b394>
14027c3b1: e9 8a 00 00 00              	jmp	0x14027c440 <.text+0x27b440>
14027c3b6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14027c3c0: 89 c1                       	movl	%eax, %ecx
14027c3c2: 83 e1 1f                    	andl	$0x1f, %ecx
14027c3c5: 44 0f b6 47 01              	movzbl	0x1(%rdi), %r8d
14027c3ca: 41 83 e0 3f                 	andl	$0x3f, %r8d
14027c3ce: 3c df                       	cmpb	$-0x21, %al
14027c3d0: 76 36                       	jbe	0x14027c408 <.text+0x27b408>
14027c3d2: 0f b6 47 02                 	movzbl	0x2(%rdi), %eax
14027c3d6: 41 c1 e0 06                 	shll	$0x6, %r8d
14027c3da: 83 e0 3f                    	andl	$0x3f, %eax
14027c3dd: 44 09 c0                    	orl	%r8d, %eax
14027c3e0: 80 fa f0                    	cmpb	$-0x10, %dl
14027c3e3: 72 3c                       	jb	0x14027c421 <.text+0x27b421>
14027c3e5: 0f b6 57 03                 	movzbl	0x3(%rdi), %edx
14027c3e9: 48 83 c7 04                 	addq	$0x4, %rdi
14027c3ed: 83 e1 07                    	andl	$0x7, %ecx
14027c3f0: c1 e1 12                    	shll	$0x12, %ecx
14027c3f3: c1 e0 06                    	shll	$0x6, %eax
14027c3f6: 83 e2 3f                    	andl	$0x3f, %edx
14027c3f9: 09 c2                       	orl	%eax, %edx
14027c3fb: 09 ca                       	orl	%ecx, %edx
14027c3fd: 89 d0                       	movl	%edx, %eax
14027c3ff: 3d 00 11 00 00              	cmpl	$0x1100, %eax           # imm = 0x1100
14027c404: 72 8e                       	jb	0x14027c394 <.text+0x27b394>
14027c406: eb 38                       	jmp	0x14027c440 <.text+0x27b440>
14027c408: 48 83 c7 02                 	addq	$0x2, %rdi
14027c40c: c1 e1 06                    	shll	$0x6, %ecx
14027c40f: 44 09 c1                    	orl	%r8d, %ecx
14027c412: 89 c8                       	movl	%ecx, %eax
14027c414: 3d 00 11 00 00              	cmpl	$0x1100, %eax           # imm = 0x1100
14027c419: 0f 82 75 ff ff ff           	jb	0x14027c394 <.text+0x27b394>
14027c41f: eb 1f                       	jmp	0x14027c440 <.text+0x27b440>
14027c421: 48 83 c7 03                 	addq	$0x3, %rdi
14027c425: c1 e1 0c                    	shll	$0xc, %ecx
14027c428: 09 c8                       	orl	%ecx, %eax
14027c42a: 3d 00 11 00 00              	cmpl	$0x1100, %eax           # imm = 0x1100
14027c42f: 0f 82 5f ff ff ff           	jb	0x14027c394 <.text+0x27b394>
14027c435: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14027c440: 89 c1                       	movl	%eax, %ecx
14027c442: 81 e1 00 ff 1f 00           	andl	$0x1fff00, %ecx         # imm = 0x1FFF00
14027c448: 81 f9 00 11 00 00           	cmpl	$0x1100, %ecx           # imm = 0x1100
14027c44e: 0f 94 c1                    	sete	%cl
14027c451: 8d 90 d0 ce ff ff           	leal	-0x3130(%rax), %edx
14027c457: 83 fa 60                    	cmpl	$0x60, %edx
14027c45a: 0f 92 c2                    	setb	%dl
14027c45d: 44 8d 80 00 54 ff ff        	leal	-0xac00(%rax), %r8d
14027c464: 41 81 f8 a4 2b 00 00        	cmpl	$0x2ba4, %r8d           # imm = 0x2BA4
14027c46b: 41 0f 92 c0                 	setb	%r8b
14027c46f: 41 08 d0                    	orb	%dl, %r8b
14027c472: 41 08 c8                    	orb	%cl, %r8b
14027c475: 4d 89 f5                    	movq	%r14, %r13
14027c478: 75 3a                       	jne	0x14027c4b4 <.text+0x27b4b4>
14027c47a: 8d 88 c0 cf ff ff           	leal	-0x3040(%rax), %ecx
14027c480: 81 f9 c0 00 00 00           	cmpl	$0xc0, %ecx
14027c486: 0f 92 c1                    	setb	%cl
14027c489: 89 c2                       	movl	%eax, %edx
14027c48b: 81 e2 f0 ff 1f 00           	andl	$0x1ffff0, %edx         # imm = 0x1FFFF0
14027c491: 81 fa f0 31 00 00           	cmpl	$0x31f0, %edx           # imm = 0x31F0
14027c497: 0f 94 c2                    	sete	%dl
14027c49a: 44 8d 80 9a 00 ff ff        	leal	-0xff66(%rax), %r8d
14027c4a1: 41 83 f8 3a                 	cmpl	$0x3a, %r8d
14027c4a5: 41 0f 92 c0                 	setb	%r8b
14027c4a9: 41 08 c8                    	orb	%cl, %r8b
14027c4ac: 41 08 d0                    	orb	%dl, %r8b
14027c4af: 4d 89 fd                    	movq	%r15, %r13
14027c4b2: 74 66                       	je	0x14027c51a <.text+0x27b51a>
14027c4b4: 48 8b 43 08                 	movq	0x8(%rbx), %rax
14027c4b8: 4c 8b 63 10                 	movq	0x10(%rbx), %r12
14027c4bc: 4c 89 e5                    	movq	%r12, %rbp
14027c4bf: 48 c1 e5 04                 	shlq	$0x4, %rbp
14027c4c3: 4d 85 e4                    	testq	%r12, %r12
14027c4c6: 74 38                       	je	0x14027c500 <.text+0x27b500>
14027c4c8: 31 c9                       	xorl	%ecx, %ecx
14027c4ca: eb 0d                       	jmp	0x14027c4d9 <.text+0x27b4d9>
14027c4cc: 0f 1f 40 00                 	nopl	(%rax)
14027c4d0: 48 83 c1 10                 	addq	$0x10, %rcx
14027c4d4: 48 39 cd                    	cmpq	%rcx, %rbp
14027c4d7: 74 27                       	je	0x14027c500 <.text+0x27b500>
14027c4d9: 48 83 7c 08 08 02           	cmpq	$0x2, 0x8(%rax,%rcx)
14027c4df: 75 ef                       	jne	0x14027c4d0 <.text+0x27b4d0>
14027c4e1: 48 8b 14 08                 	movq	(%rax,%rcx), %rdx
14027c4e5: 0f b7 12                    	movzwl	(%rdx), %edx
14027c4e8: 66 41 3b 55 00              	cmpw	(%r13), %dx
14027c4ed: 75 e1                       	jne	0x14027c4d0 <.text+0x27b4d0>
14027c4ef: e9 a0 fe ff ff              	jmp	0x14027c394 <.text+0x27b394>
14027c4f4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14027c500: 4c 3b 23                    	cmpq	(%rbx), %r12
14027c503: 0f 85 77 fe ff ff           	jne	0x14027c380 <.text+0x27b380>
14027c509: 48 89 d9                    	movq	%rbx, %rcx
14027c50c: e8 1f 5b de 05              	callq	0x146062030 <.text+0x6061030>
14027c511: 48 8b 43 08                 	movq	0x8(%rbx), %rax
14027c515: e9 66 fe ff ff              	jmp	0x14027c380 <.text+0x27b380>
14027c51a: 89 c1                       	movl	%eax, %ecx
14027c51c: 81 e1 c0 ff 1f 00           	andl	$0x1fffc0, %ecx         # imm = 0x1FFFC0
14027c522: 4c 8d 2d bf 76 ff 05        	leaq	0x5ff76bf(%rip), %r13   # 0x146273be8
14027c529: 81 f9 00 30 00 00           	cmpl	$0x3000, %ecx           # imm = 0x3000
14027c52f: 74 83                       	je	0x14027c4b4 <.text+0x27b4b4>
14027c531: 66 0f 6e c0                 	movd	%eax, %xmm0
14027c535: 66 0f 70 c0 00              	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
14027c53a: 66 0f fe c6                 	paddd	%xmm6, %xmm0
14027c53e: 66 0f ef c7                 	pxor	%xmm7, %xmm0
14027c542: 66 41 0f 66 c0              	pcmpgtd	%xmm8, %xmm0
14027c547: 0f 50 c0                    	movmskps	%xmm0, %eax
14027c54a: 83 f0 0f                    	xorl	$0xf, %eax
14027c54d: 4c 8d 2d 94 76 ff 05        	leaq	0x5ff7694(%rip), %r13   # 0x146273be8
14027c554: 84 c0                       	testb	%al, %al
14027c556: 0f 84 38 fe ff ff           	je	0x14027c394 <.text+0x27b394>
14027c55c: e9 53 ff ff ff              	jmp	0x14027c4b4 <.text+0x27b4b4>
14027c561: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
14027c566: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
14027c56b: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
14027c571: 48 83 c4 58                 	addq	$0x58, %rsp
14027c575: 5b                          	popq	%rbx
14027c576: 5d                          	popq	%rbp
14027c577: 5f                          	popq	%rdi
14027c578: 5e                          	popq	%rsi
14027c579: 41 5c                       	popq	%r12
14027c57b: 41 5d                       	popq	%r13
14027c57d: 41 5e                       	popq	%r14
14027c57f: 41 5f                       	popq	%r15
14027c581: c3                          	retq

145cc3390: 41 56                       	pushq	%r14
145cc3392: 56                          	pushq	%rsi
145cc3393: 57                          	pushq	%rdi
145cc3394: 53                          	pushq	%rbx
145cc3395: 48 83 ec 58                 	subq	$0x58, %rsp
145cc3399: 48 83 fa 02                 	cmpq	$0x2, %rdx
145cc339d: 0f 85 d1 00 00 00           	jne	0x145cc3474 <.text+0x5cc2474>
145cc33a3: 66 81 39 7a 68              	cmpw	$0x687a, (%rcx)         # imm = 0x687A
145cc33a8: 74 1b                       	je	0x145cc33c5 <.text+0x5cc23c5>
145cc33aa: 66 81 39 6a 61              	cmpw	$0x616a, (%rcx)         # imm = 0x616A
145cc33af: 74 1d                       	je	0x145cc33ce <.text+0x5cc23ce>
145cc33b1: 66 81 39 6b 6f              	cmpw	$0x6f6b, (%rcx)         # imm = 0x6F6B
145cc33b6: 0f 85 b8 00 00 00           	jne	0x145cc3474 <.text+0x5cc2474>
145cc33bc: 48 8d 05 25 2b 72 01        	leaq	0x1722b25(%rip), %rax   # 0x1473e5ee8
145cc33c3: eb 10                       	jmp	0x145cc33d5 <.text+0x5cc23d5>
145cc33c5: 48 8d 05 bc 2a 72 01        	leaq	0x1722abc(%rip), %rax   # 0x1473e5e88
145cc33cc: eb 07                       	jmp	0x145cc33d5 <.text+0x5cc23d5>
145cc33ce: 48 8d 05 e3 2a 72 01        	leaq	0x1722ae3(%rip), %rax   # 0x1473e5eb8
145cc33d5: 48 8b 70 10                 	movq	0x10(%rax), %rsi
145cc33d9: 48 8b 78 18                 	movq	0x18(%rax), %rdi
145cc33dd: 48 8b 58 20                 	movq	0x20(%rax), %rbx
145cc33e1: 4c 8b 70 28                 	movq	0x28(%rax), %r14
145cc33e5: 48 8d 4c 24 40              	leaq	0x40(%rsp), %rcx
145cc33ea: 48 89 f2                    	movq	%rsi, %rdx
145cc33ed: 49 89 f8                    	movq	%rdi, %r8
145cc33f0: e8 bb f6 27 00              	callq	0x145f42ab0 <.text+0x5f41ab0>
145cc33f5: 48 8b 54 24 40              	movq	0x40(%rsp), %rdx
145cc33fa: 48 83 fa ff                 	cmpq	$-0x1, %rdx
145cc33fe: 74 17                       	je	0x145cc3417 <.text+0x5cc2417>
145cc3400: 48 85 d2                    	testq	%rdx, %rdx
145cc3403: 74 71                       	je	0x145cc3476 <.text+0x5cc2476>
145cc3405: 48 8b 4c 24 48              	movq	0x48(%rsp), %rcx
145cc340a: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145cc3410: e8 bb ed 33 fa              	callq	0x1400021d0 <.text+0x11d0>
145cc3415: eb 5f                       	jmp	0x145cc3476 <.text+0x5cc2476>
145cc3417: 49 83 fe 0a                 	cmpq	$0xa, %r14
145cc341b: 75 57                       	jne	0x145cc3474 <.text+0x5cc2474>
145cc341d: 48 b8 61 7a 73 5f 73 63 2e 74       	movabsq	$0x742e63735f737a61, %rax # imm = 0x742E63735F737A61
145cc3427: 48 33 03                    	xorq	(%rbx), %rax
145cc342a: 0f b7 4b 08                 	movzwl	0x8(%rbx), %ecx
145cc342e: 48 81 f1 74 66 00 00        	xorq	$0x6674, %rcx           # imm = 0x6674
145cc3435: 48 09 c1                    	orq	%rax, %rcx
145cc3438: 74 4c                       	je	0x145cc3486 <.text+0x5cc2486>
145cc343a: 48 b8 61 7a 73 5f 6a 70 2e 74       	movabsq	$0x742e706a5f737a61, %rax # imm = 0x742E706A5F737A61
145cc3444: 48 33 03                    	xorq	(%rbx), %rax
145cc3447: 0f b7 4b 08                 	movzwl	0x8(%rbx), %ecx
145cc344b: 48 81 f1 74 66 00 00        	xorq	$0x6674, %rcx           # imm = 0x6674
145cc3452: 48 09 c1                    	orq	%rax, %rcx
145cc3455: 74 64                       	je	0x145cc34bb <.text+0x5cc24bb>
145cc3457: 48 b8 61 7a 73 5f 6b 72 2e 74       	movabsq	$0x742e726b5f737a61, %rax # imm = 0x742E726B5F737A61
145cc3461: 48 33 03                    	xorq	(%rbx), %rax
145cc3464: 0f b7 4b 08                 	movzwl	0x8(%rbx), %ecx
145cc3468: 48 81 f1 74 66 00 00        	xorq	$0x6674, %rcx           # imm = 0x6674
145cc346f: 48 09 c1                    	orq	%rax, %rcx
145cc3472: 74 78                       	je	0x145cc34ec <.text+0x5cc24ec>
145cc3474: 31 f6                       	xorl	%esi, %esi
145cc3476: 48 89 f0                    	movq	%rsi, %rax
145cc3479: 48 89 fa                    	movq	%rdi, %rdx
145cc347c: 48 83 c4 58                 	addq	$0x58, %rsp
145cc3480: 5b                          	popq	%rbx
145cc3481: 5f                          	popq	%rdi
145cc3482: 5e                          	popq	%rsi
145cc3483: 41 5e                       	popq	%r14
145cc3485: c3                          	retq
145cc3486: e8 75 ed 33 fa              	callq	0x140002200 <.text+0x1200>
145cc348b: 41 be c4 b2 12 00           	movl	$0x12b2c4, %r14d        # imm = 0x12B2C4
145cc3491: b9 c4 b2 12 00              	movl	$0x12b2c4, %ecx         # imm = 0x12B2C4
145cc3496: ba 01 00 00 00              	movl	$0x1, %edx
145cc349b: e8 20 ed 33 fa              	callq	0x1400021c0 <.text+0x11c0>
145cc34a0: 48 85 c0                    	testq	%rax, %rax
145cc34a3: 0f 84 9e 00 00 00           	je	0x145cc3547 <.text+0x5cc2547>
145cc34a9: 48 89 c3                    	movq	%rax, %rbx
145cc34ac: 48 8d 15 99 e2 92 01        	leaq	0x192e299(%rip), %rdx   # 0x1475f174c
145cc34b3: 41 b8 c4 b2 12 00           	movl	$0x12b2c4, %r8d         # imm = 0x12B2C4
145cc34b9: eb 60                       	jmp	0x145cc351b <.text+0x5cc251b>
145cc34bb: e8 40 ed 33 fa              	callq	0x140002200 <.text+0x1200>
145cc34c0: 41 be c4 e2 13 00           	movl	$0x13e2c4, %r14d        # imm = 0x13E2C4
145cc34c6: b9 c4 e2 13 00              	movl	$0x13e2c4, %ecx         # imm = 0x13E2C4
145cc34cb: ba 01 00 00 00              	movl	$0x1, %edx
145cc34d0: e8 eb ec 33 fa              	callq	0x1400021c0 <.text+0x11c0>
145cc34d5: 48 85 c0                    	testq	%rax, %rax
145cc34d8: 74 7e                       	je	0x145cc3558 <.text+0x5cc2558>
145cc34da: 48 89 c3                    	movq	%rax, %rbx
145cc34dd: 48 8d 15 a4 ff 7e 01        	leaq	0x17effa4(%rip), %rdx   # 0x1474b3488
145cc34e4: 41 b8 c4 e2 13 00           	movl	$0x13e2c4, %r8d         # imm = 0x13E2C4
145cc34ea: eb 2f                       	jmp	0x145cc351b <.text+0x5cc251b>
145cc34ec: e8 0f ed 33 fa              	callq	0x140002200 <.text+0x1200>
145cc34f1: 41 be 78 9c 07 00           	movl	$0x79c78, %r14d         # imm = 0x79C78
145cc34f7: b9 78 9c 07 00              	movl	$0x79c78, %ecx          # imm = 0x79C78
145cc34fc: ba 01 00 00 00              	movl	$0x1, %edx
145cc3501: e8 ba ec 33 fa              	callq	0x1400021c0 <.text+0x11c0>
145cc3506: 48 85 c0                    	testq	%rax, %rax
145cc3509: 74 5e                       	je	0x145cc3569 <.text+0x5cc2569>
145cc350b: 48 89 c3                    	movq	%rax, %rbx
145cc350e: 48 8d 15 fb 62 77 01        	leaq	0x17762fb(%rip), %rdx   # 0x147439810
145cc3515: 41 b8 78 9c 07 00           	movl	$0x79c78, %r8d          # imm = 0x79C78
145cc351b: 48 89 d9                    	movq	%rbx, %rcx
145cc351e: e8 f8 e1 39 00              	callq	0x14606171b <.text+0x606071b>
145cc3523: 4c 89 74 24 28              	movq	%r14, 0x28(%rsp)
145cc3528: 48 89 5c 24 30              	movq	%rbx, 0x30(%rsp)
145cc352d: 4c 89 74 24 38              	movq	%r14, 0x38(%rsp)
145cc3532: 4c 8d 44 24 28              	leaq	0x28(%rsp), %r8
145cc3537: 48 89 f1                    	movq	%rsi, %rcx
145cc353a: 48 89 fa                    	movq	%rdi, %rdx
145cc353d: e8 7e fd 27 00              	callq	0x145f432c0 <.text+0x5f422c0>
145cc3542: e9 2f ff ff ff              	jmp	0x145cc3476 <.text+0x5cc2476>
145cc3547: b9 01 00 00 00              	movl	$0x1, %ecx
145cc354c: ba c4 b2 12 00              	movl	$0x12b2c4, %edx         # imm = 0x12B2C4
145cc3551: e8 15 54 54 00              	callq	0x14620896b <.text+0x620796b>
145cc3556: 0f 0b                       	ud2
145cc3558: b9 01 00 00 00              	movl	$0x1, %ecx
145cc355d: ba c4 e2 13 00              	movl	$0x13e2c4, %edx         # imm = 0x13E2C4
145cc3562: e8 04 54 54 00              	callq	0x14620896b <.text+0x620796b>
145cc3567: 0f 0b                       	ud2
145cc3569: b9 01 00 00 00              	movl	$0x1, %ecx
145cc356e: ba 78 9c 07 00              	movl	$0x79c78, %edx          # imm = 0x79C78
145cc3573: e8 f3 53 54 00              	callq	0x14620896b <.text+0x620796b>
145cc3578: 0f 0b                       	ud2

14028a590: 55                          	pushq	%rbp
14028a591: 41 57                       	pushq	%r15
14028a593: 41 56                       	pushq	%r14
14028a595: 41 55                       	pushq	%r13
14028a597: 41 54                       	pushq	%r12
14028a599: 56                          	pushq	%rsi
14028a59a: 57                          	pushq	%rdi
14028a59b: 53                          	pushq	%rbx
14028a59c: 48 83 ec 58                 	subq	$0x58, %rsp
14028a5a0: 48 8d 6c 24 50              	leaq	0x50(%rsp), %rbp
14028a5a5: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
14028a5ad: 48 89 cb                    	movq	%rcx, %rbx
14028a5b0: 48 89 d1                    	movq	%rdx, %rcx
14028a5b3: 4c 89 c2                    	movq	%r8, %rdx
14028a5b6: e8 d5 8d a3 05              	callq	0x145cc3390 <.text+0x5cc2390>
14028a5bb: 48 85 c0                    	testq	%rax, %rax
14028a5be: 0f 84 74 01 00 00           	je	0x14028a738 <.text+0x289738>
14028a5c4: 48 89 c6                    	movq	%rax, %rsi
14028a5c7: 48 89 d7                    	movq	%rdx, %rdi
14028a5ca: b1 01                       	movb	$0x1, %cl
14028a5cc: 31 c0                       	xorl	%eax, %eax
14028a5ce: f0                          	lock
14028a5cf: 0f b0 0d f2 aa 38 08        	cmpxchgb	%cl, 0x838aaf2(%rip)    # 0x1486150c8
14028a5d6: 0f 85 6f 01 00 00           	jne	0x14028a74b <.text+0x28974b>
14028a5dc: 48 8b 05 85 45 3d 08        	movq	0x83d4585(%rip), %rax   # 0x14865eb68
14028a5e3: 48 8b 00                    	movq	(%rax), %rax
14028a5e6: 48 d1 e0                    	shlq	%rax
14028a5e9: 48 85 c0                    	testq	%rax, %rax
14028a5ec: 0f 85 6a 01 00 00           	jne	0x14028a75c <.text+0x28975c>
14028a5f2: c7 45 f8 00 00 00 00        	movl	$0x0, -0x8(%rbp)
14028a5f9: 0f b6 05 c9 aa 38 08        	movzbl	0x838aac9(%rip), %eax   # 0x1486150c9
14028a600: 4c 8b 2d d1 aa 38 08        	movq	0x838aad1(%rip), %r13   # 0x1486150d8
14028a607: 4c 8b 3d d2 aa 38 08        	movq	0x838aad2(%rip), %r15   # 0x1486150e0
14028a60e: 4d 89 fc                    	movq	%r15, %r12
14028a611: 49 c1 e4 04                 	shlq	$0x4, %r12
14028a615: 4d 85 ff                    	testq	%r15, %r15
14028a618: 74 63                       	je	0x14028a67d <.text+0x28967d>
14028a61a: 45 31 f6                    	xorl	%r14d, %r14d
14028a61d: eb 0a                       	jmp	0x14028a629 <.text+0x289629>
14028a61f: 90                          	nop
14028a620: 49 83 c6 10                 	addq	$0x10, %r14
14028a624: 4d 39 f4                    	cmpq	%r14, %r12
14028a627: 74 54                       	je	0x14028a67d <.text+0x28967d>
14028a629: 4b 39 7c 35 08              	cmpq	%rdi, 0x8(%r13,%r14)
14028a62e: 75 f0                       	jne	0x14028a620 <.text+0x289620>
14028a630: 4b 8b 4c 35 00              	movq	(%r13,%r14), %rcx
14028a635: 48 89 f2                    	movq	%rsi, %rdx
14028a638: 49 89 f8                    	movq	%rdi, %r8
14028a63b: e8 e1 70 dd 05              	callq	0x146061721 <.text+0x6060721>
14028a640: 85 c0                       	testl	%eax, %eax
14028a642: 75 dc                       	jne	0x14028a620 <.text+0x289620>
14028a644: 80 7d f8 00                 	cmpb	$0x0, -0x8(%rbp)
14028a648: 75 16                       	jne	0x14028a660 <.text+0x289660>
14028a64a: 48 8b 05 17 45 3d 08        	movq	0x83d4517(%rip), %rax   # 0x14865eb68
14028a651: 48 8b 00                    	movq	(%rax), %rax
14028a654: 48 d1 e0                    	shlq	%rax
14028a657: 48 85 c0                    	testq	%rax, %rax
14028a65a: 0f 85 1d 01 00 00           	jne	0x14028a77d <.text+0x28977d>
14028a660: 31 c9                       	xorl	%ecx, %ecx
14028a662: 86 0d 60 aa 38 08           	xchgb	%cl, 0x838aa60(%rip)    # 0x1486150c8
14028a668: 31 f6                       	xorl	%esi, %esi
14028a66a: b8 00 00 00 00              	movl	$0x0, %eax
14028a66f: 80 f9 02                    	cmpb	$0x2, %cl
14028a672: 0f 85 c2 00 00 00           	jne	0x14028a73a <.text+0x28973a>
14028a678: e9 ab 00 00 00              	jmp	0x14028a728 <.text+0x289728>
14028a67d: 4c 3b 3d 4c aa 38 08        	cmpq	0x838aa4c(%rip), %r15   # 0x1486150d0
14028a684: 75 14                       	jne	0x14028a69a <.text+0x28969a>
14028a686: 48 8d 0d 43 aa 38 08        	leaq	0x838aa43(%rip), %rcx   # 0x1486150d0
14028a68d: e8 9e 79 dd 05              	callq	0x146062030 <.text+0x6061030>
14028a692: 90                          	nop
14028a693: 4c 8b 2d 3e aa 38 08        	movq	0x838aa3e(%rip), %r13   # 0x1486150d8
14028a69a: 4b 89 74 25 00              	movq	%rsi, (%r13,%r12)
14028a69f: 4b 89 7c 25 08              	movq	%rdi, 0x8(%r13,%r12)
14028a6a4: 49 ff c7                    	incq	%r15
14028a6a7: 4c 89 3d 32 aa 38 08        	movq	%r15, 0x838aa32(%rip)   # 0x1486150e0
14028a6ae: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14028a6b2: 48 89 f2                    	movq	%rsi, %rdx
14028a6b5: 49 89 f8                    	movq	%rdi, %r8
14028a6b8: e8 e3 ca a3 05              	callq	0x145cc71a0 <.text+0x5cc61a0>
14028a6bd: 90                          	nop
14028a6be: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14028a6c2: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
14028a6c6: 48 83 f8 ff                 	cmpq	$-0x1, %rax
14028a6ca: 74 26                       	je	0x14028a6f2 <.text+0x2896f2>
14028a6cc: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14028a6d0: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14028a6d4: c6 45 ff 01                 	movb	$0x1, -0x1(%rbp)
14028a6d8: 48 89 d9                    	movq	%rbx, %rcx
14028a6db: e8 70 d5 3a 03              	callq	0x143637c50 <.text+0x3636c50>
14028a6e0: 90                          	nop
14028a6e1: c6 45 ff 00                 	movb	$0x0, -0x1(%rbp)
14028a6e5: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
14028a6e9: 48 89 c1                    	movq	%rax, %rcx
14028a6ec: e8 1f 16 52 03              	callq	0x1437abd10 <.text+0x37aad10>
14028a6f1: 90                          	nop
14028a6f2: 48 89 f1                    	movq	%rsi, %rcx
14028a6f5: 48 89 fa                    	movq	%rdi, %rdx
14028a6f8: e8 33 be 3d 00              	callq	0x140666530 <.text+0x665530>
14028a6fd: 90                          	nop
14028a6fe: 80 7d f8 00                 	cmpb	$0x0, -0x8(%rbp)
14028a702: 75 12                       	jne	0x14028a716 <.text+0x289716>
14028a704: 48 8b 05 5d 44 3d 08        	movq	0x83d445d(%rip), %rax   # 0x14865eb68
14028a70b: 48 8b 00                    	movq	(%rax), %rax
14028a70e: 48 d1 e0                    	shlq	%rax
14028a711: 48 85 c0                    	testq	%rax, %rax
14028a714: 75 55                       	jne	0x14028a76b <.text+0x28976b>
14028a716: 31 c9                       	xorl	%ecx, %ecx
14028a718: 86 0d aa a9 38 08           	xchgb	%cl, 0x838a9aa(%rip)    # 0x1486150c8
14028a71e: 40 b6 01                    	movb	$0x1, %sil
14028a721: b0 01                       	movb	$0x1, %al
14028a723: 80 f9 02                    	cmpb	$0x2, %cl
14028a726: 75 12                       	jne	0x14028a73a <.text+0x28973a>
14028a728: 48 8d 0d 99 a9 38 08        	leaq	0x838a999(%rip), %rcx   # 0x1486150c8
14028a72f: e8 9c c9 f7 05              	callq	0x1462070d0 <.text+0x62060d0>
14028a734: 89 f0                       	movl	%esi, %eax
14028a736: eb 02                       	jmp	0x14028a73a <.text+0x28973a>
14028a738: 31 c0                       	xorl	%eax, %eax
14028a73a: 48 83 c4 58                 	addq	$0x58, %rsp
14028a73e: 5b                          	popq	%rbx
14028a73f: 5f                          	popq	%rdi
14028a740: 5e                          	popq	%rsi
14028a741: 41 5c                       	popq	%r12
14028a743: 41 5d                       	popq	%r13
14028a745: 41 5e                       	popq	%r14
14028a747: 41 5f                       	popq	%r15
14028a749: 5d                          	popq	%rbp
14028a74a: c3                          	retq
14028a74b: 48 8d 0d 76 a9 38 08        	leaq	0x838a976(%rip), %rcx   # 0x1486150c8
14028a752: e8 b9 c8 f7 05              	callq	0x146207010 <.text+0x6206010>
14028a757: e9 80 fe ff ff              	jmp	0x14028a5dc <.text+0x2895dc>
14028a75c: e8 3f d6 f7 05              	callq	0x146207da0 <.text+0x6206da0>
14028a761: 34 01                       	xorb	$0x1, %al
14028a763: 89 45 f8                    	movl	%eax, -0x8(%rbp)
14028a766: e9 8e fe ff ff              	jmp	0x14028a5f9 <.text+0x2895f9>
14028a76b: e8 30 d6 f7 05              	callq	0x146207da0 <.text+0x6206da0>
14028a770: 84 c0                       	testb	%al, %al
14028a772: 75 a2                       	jne	0x14028a716 <.text+0x289716>
14028a774: c6 05 4e a9 38 08 01        	movb	$0x1, 0x838a94e(%rip)   # 0x1486150c9
14028a77b: eb 99                       	jmp	0x14028a716 <.text+0x289716>
14028a77d: e8 1e d6 f7 05              	callq	0x146207da0 <.text+0x6206da0>
14028a782: 84 c0                       	testb	%al, %al
14028a784: 0f 85 d6 fe ff ff           	jne	0x14028a660 <.text+0x289660>
14028a78a: c6 05 38 a9 38 08 01        	movb	$0x1, 0x838a938(%rip)   # 0x1486150c9
14028a791: e9 ca fe ff ff              	jmp	0x14028a660 <.text+0x289660>

14029bc00: 41 56                       	pushq	%r14
14029bc02: 56                          	pushq	%rsi
14029bc03: 57                          	pushq	%rdi
14029bc04: 55                          	pushq	%rbp
14029bc05: 53                          	pushq	%rbx
14029bc06: 48 83 ec 40                 	subq	$0x40, %rsp
14029bc0a: 48 8b 32                    	movq	(%rdx), %rsi
14029bc0d: 4c 8b 72 10                 	movq	0x10(%rdx), %r14
14029bc11: 8b 6a 1c                    	movl	0x1c(%rdx), %ebp
14029bc14: 41 89 2e                    	movl	%ebp, (%r14)
14029bc17: 48 89 f1                    	movq	%rsi, %rcx
14029bc1a: e8 31 c0 39 03              	callq	0x143637c50 <.text+0x3636c50>
14029bc1f: 48 89 c3                    	movq	%rax, %rbx
14029bc22: e8 d9 65 d6 ff              	callq	0x140002200 <.text+0x1200>
14029bc27: bf 40 09 00 00              	movl	$0x940, %edi            # imm = 0x940
14029bc2c: b9 40 09 00 00              	movl	$0x940, %ecx            # imm = 0x940
14029bc31: ba 01 00 00 00              	movl	$0x1, %edx
14029bc36: e8 85 65 d6 ff              	callq	0x1400021c0 <.text+0x11c0>
14029bc3b: 48 85 c0                    	testq	%rax, %rax
14029bc3e: 0f 84 28 01 00 00           	je	0x14029bd6c <.text+0x29ad6c>
14029bc44: 48 c7 44 24 28 40 09 00 00  	movq	$0x940, 0x28(%rsp)      # imm = 0x940
14029bc4d: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14029bc52: 48 8d 15 ff 86 fd 05        	leaq	0x5fd86ff(%rip), %rdx   # 0x146274358
14029bc59: 41 b8 40 09 00 00           	movl	$0x940, %r8d            # imm = 0x940
14029bc5f: 48 89 c1                    	movq	%rax, %rcx
14029bc62: e8 b4 5a dc 05              	callq	0x14606171b <.text+0x606071b>
14029bc67: 48 c7 44 24 38 40 09 00 00  	movq	$0x940, 0x38(%rsp)      # imm = 0x940
14029bc70: 48 8d 54 24 28              	leaq	0x28(%rsp), %rdx
14029bc75: 48 89 d9                    	movq	%rbx, %rcx
14029bc78: e8 93 00 51 03              	callq	0x1437abd10 <.text+0x37aad10>
14029bc7d: 41 89 2e                    	movl	%ebp, (%r14)
14029bc80: 48 89 f1                    	movq	%rsi, %rcx
14029bc83: e8 c8 bf 39 03              	callq	0x143637c50 <.text+0x3636c50>
14029bc88: 48 89 c3                    	movq	%rax, %rbx
14029bc8b: e8 70 65 d6 ff              	callq	0x140002200 <.text+0x1200>
14029bc90: bf 14 08 00 00              	movl	$0x814, %edi            # imm = 0x814
14029bc95: b9 14 08 00 00              	movl	$0x814, %ecx            # imm = 0x814
14029bc9a: ba 01 00 00 00              	movl	$0x1, %edx
14029bc9f: e8 1c 65 d6 ff              	callq	0x1400021c0 <.text+0x11c0>
14029bca4: 48 85 c0                    	testq	%rax, %rax
14029bca7: 0f 84 bf 00 00 00           	je	0x14029bd6c <.text+0x29ad6c>
14029bcad: 48 c7 44 24 28 14 08 00 00  	movq	$0x814, 0x28(%rsp)      # imm = 0x814
14029bcb6: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14029bcbb: 48 8d 15 d6 8f fd 05        	leaq	0x5fd8fd6(%rip), %rdx   # 0x146274c98
14029bcc2: 41 b8 14 08 00 00           	movl	$0x814, %r8d            # imm = 0x814
14029bcc8: 48 89 c1                    	movq	%rax, %rcx
14029bccb: e8 4b 5a dc 05              	callq	0x14606171b <.text+0x606071b>
14029bcd0: 48 c7 44 24 38 14 08 00 00  	movq	$0x814, 0x38(%rsp)      # imm = 0x814
14029bcd9: 48 8d 54 24 28              	leaq	0x28(%rsp), %rdx
14029bcde: 48 89 d9                    	movq	%rbx, %rcx
14029bce1: e8 2a 00 51 03              	callq	0x1437abd10 <.text+0x37aad10>
14029bce6: 41 89 2e                    	movl	%ebp, (%r14)
14029bce9: 48 89 f1                    	movq	%rsi, %rcx
14029bcec: e8 5f bf 39 03              	callq	0x143637c50 <.text+0x3636c50>
14029bcf1: 48 89 c3                    	movq	%rax, %rbx
14029bcf4: e8 07 65 d6 ff              	callq	0x140002200 <.text+0x1200>
14029bcf9: bf 0c 08 00 00              	movl	$0x80c, %edi            # imm = 0x80C
14029bcfe: b9 0c 08 00 00              	movl	$0x80c, %ecx            # imm = 0x80C
14029bd03: ba 01 00 00 00              	movl	$0x1, %edx
14029bd08: e8 b3 64 d6 ff              	callq	0x1400021c0 <.text+0x11c0>
14029bd0d: 48 85 c0                    	testq	%rax, %rax
14029bd10: 74 5a                       	je	0x14029bd6c <.text+0x29ad6c>
14029bd12: 48 c7 44 24 28 0c 08 00 00  	movq	$0x80c, 0x28(%rsp)      # imm = 0x80C
14029bd1b: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14029bd20: 48 8d 15 85 97 fd 05        	leaq	0x5fd9785(%rip), %rdx   # 0x1462754ac
14029bd27: 41 b8 0c 08 00 00           	movl	$0x80c, %r8d            # imm = 0x80C
14029bd2d: 48 89 c1                    	movq	%rax, %rcx
14029bd30: e8 e6 59 dc 05              	callq	0x14606171b <.text+0x606071b>
14029bd35: 48 c7 44 24 38 0c 08 00 00  	movq	$0x80c, 0x38(%rsp)      # imm = 0x80C
14029bd3e: 48 8d 54 24 28              	leaq	0x28(%rsp), %rdx
14029bd43: 48 89 d9                    	movq	%rbx, %rcx
14029bd46: e8 c5 ff 50 03              	callq	0x1437abd10 <.text+0x37aad10>
14029bd4b: 41 89 2e                    	movl	%ebp, (%r14)
14029bd4e: e8 fd e4 94 05              	callq	0x145bea250 <.text+0x5be9250>
14029bd53: 48 8b 10                    	movq	(%rax), %rdx
14029bd56: 4c 8b 40 08                 	movq	0x8(%rax), %r8
14029bd5a: 48 89 f1                    	movq	%rsi, %rcx
14029bd5d: 48 83 c4 40                 	addq	$0x40, %rsp
14029bd61: 5b                          	popq	%rbx
14029bd62: 5d                          	popq	%rbp
14029bd63: 5f                          	popq	%rdi
14029bd64: 5e                          	popq	%rsi
14029bd65: 41 5e                       	popq	%r14
14029bd67: e9 24 e8 fe ff              	jmp	0x14028a590 <.text+0x289590>

14029b7f0: 49 8b 16                    	movq	(%r14), %rdx
14029b7f3: 4d 8b 46 08                 	movq	0x8(%r14), %r8
14029b7f7: 8b 45 d0                    	movl	-0x30(%rbp), %eax
14029b7fa: 41 89 45 00                 	movl	%eax, (%r13)
14029b7fe: 48 8b 4d a8                 	movq	-0x58(%rbp), %rcx
14029b802: e8 89 ed fe ff              	callq	0x14028a590 <.text+0x289590>
14029b807: 90                          	nop
14029b808: 49 83 c6 10                 	addq	$0x10, %r14
14029b80c: 40 08 c7                    	orb	%al, %dil
14029b80f: 49 39 de                    	cmpq	%rbx, %r14
14029b812: 75 dc                       	jne	0x14029b7f0 <.text+0x29a7f0>
