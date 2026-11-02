
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
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
