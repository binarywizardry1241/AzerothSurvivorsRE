
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ef3b0: 55                          	pushq	%rbp
1454ef3b1: 41 57                       	pushq	%r15
1454ef3b3: 41 56                       	pushq	%r14
1454ef3b5: 41 55                       	pushq	%r13
1454ef3b7: 41 54                       	pushq	%r12
1454ef3b9: 56                          	pushq	%rsi
1454ef3ba: 57                          	pushq	%rdi
1454ef3bb: 53                          	pushq	%rbx
1454ef3bc: 48 81 ec 28 01 00 00        	subq	$0x128, %rsp            # imm = 0x128
1454ef3c3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454ef3cb: 44 0f 29 8d 90 00 00 00     	movaps	%xmm9, 0x90(%rbp)
1454ef3d3: 44 0f 29 85 80 00 00 00     	movaps	%xmm8, 0x80(%rbp)
1454ef3db: 0f 29 7d 70                 	movaps	%xmm7, 0x70(%rbp)
1454ef3df: 0f 29 75 60                 	movaps	%xmm6, 0x60(%rbp)
1454ef3e3: 48 c7 45 58 fe ff ff ff     	movq	$-0x2, 0x58(%rbp)
1454ef3eb: 45 89 c6                    	movl	%r8d, %r14d
1454ef3ee: 89 d7                       	movl	%edx, %edi
1454ef3f0: 48 89 ce                    	movq	%rcx, %rsi
1454ef3f3: f3 0f 10 bd 20 01 00 00     	movss	0x120(%rbp), %xmm7
1454ef3fb: f3 0f 10 b5 18 01 00 00     	movss	0x118(%rbp), %xmm6
1454ef403: 4c 8b ad 10 01 00 00        	movq	0x110(%rbp), %r13
1454ef40a: f3 0f 10 81 e4 08 00 00     	movss	0x8e4(%rcx), %xmm0
1454ef412: 48 8b 81 c8 04 00 00        	movq	0x4c8(%rcx), %rax
1454ef419: 48 69 91 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rcx), %rdx # imm = 0x160
1454ef424: 31 c9                       	xorl	%ecx, %ecx
1454ef426: 49 89 c0                    	movq	%rax, %r8
1454ef429: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454ef430: 48 39 ca                    	cmpq	%rcx, %rdx
1454ef433: 0f 84 01 05 00 00           	je	0x1454ef93a <.text+0x54ee93a>
1454ef439: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454ef440: 4d 39 a8 88 00 00 00        	cmpq	%r13, 0x88(%r8)
1454ef447: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454ef44e: 75 e0                       	jne	0x1454ef430 <.text+0x54ee430>
1454ef450: f3 0f 10 54 08 c8           	movss	-0x38(%rax,%rcx), %xmm2
1454ef456: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454ef459: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
1454ef45c: 73 44                       	jae	0x1454ef4a2 <.text+0x54ee4a2>
1454ef45e: f3 0f 5c 44 08 c4           	subss	-0x3c(%rax,%rcx), %xmm0
1454ef464: f3 0f 5e c2                 	divss	%xmm2, %xmm0
1454ef468: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454ef46c: f3 0f 10 05 0c c0 3f 00     	movss	0x3fc00c(%rip), %xmm0   # 0x1458eb480
1454ef474: f3 0f 5d c1                 	minss	%xmm1, %xmm0
1454ef478: f2 0f 10 4c 08 ac           	movsd	-0x54(%rax,%rcx), %xmm1
1454ef47e: f2 0f 10 54 08 b8           	movsd	-0x48(%rax,%rcx), %xmm2
1454ef484: 0f 5c d1                    	subps	%xmm1, %xmm2
1454ef487: f3 44 0f 12 c0              	movsldup	%xmm0, %xmm8            # xmm8 = xmm0[0,0,2,2]
1454ef48c: 44 0f 59 c2                 	mulps	%xmm2, %xmm8
1454ef490: 44 0f 58 c1                 	addps	%xmm1, %xmm8
1454ef494: 81 ff 53 0a 00 00           	cmpl	$0xa53, %edi            # imm = 0xA53
1454ef49a: 4c 89 4d 40                 	movq	%r9, 0x40(%rbp)
1454ef49e: 75 15                       	jne	0x1454ef4b5 <.text+0x54ee4b5>
1454ef4a0: eb 18                       	jmp	0x1454ef4ba <.text+0x54ee4ba>
1454ef4a2: f2 44 0f 10 44 08 b8        	movsd	-0x48(%rax,%rcx), %xmm8
1454ef4a9: 81 ff 53 0a 00 00           	cmpl	$0xa53, %edi            # imm = 0xA53
1454ef4af: 4c 89 4d 40                 	movq	%r9, 0x40(%rbp)
1454ef4b3: 74 05                       	je	0x1454ef4ba <.text+0x54ee4ba>
1454ef4b5: 83 ff 4b                    	cmpl	$0x4b, %edi
1454ef4b8: 75 7b                       	jne	0x1454ef535 <.text+0x54ee535>
1454ef4ba: 8b 96 50 04 00 00           	movl	0x450(%rsi), %edx
1454ef4c0: 48 8d 4d b8                 	leaq	-0x48(%rbp), %rcx
1454ef4c4: e8 57 ae f6 ff              	callq	0x14545a320 <.text+0x5459320>
1454ef4c9: 48 8b 55 b8                 	movq	-0x48(%rbp), %rdx
1454ef4cd: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1454ef4d1: 0f 84 dc 00 00 00           	je	0x1454ef5b3 <.text+0x54ee5b3>
1454ef4d7: 4c 8b 7d d0                 	movq	-0x30(%rbp), %r15
1454ef4db: 4c 8b 65 d8                 	movq	-0x28(%rbp), %r12
1454ef4df: 8b 45 10                    	movl	0x10(%rbp), %eax
1454ef4e2: 8b 4d 14                    	movl	0x14(%rbp), %ecx
1454ef4e5: 83 f0 02                    	xorl	$0x2, %eax
1454ef4e8: 83 f1 03                    	xorl	$0x3, %ecx
1454ef4eb: 09 c1                       	orl	%eax, %ecx
1454ef4ed: 0f 94 c3                    	sete	%bl
1454ef4f0: 48 85 d2                    	testq	%rdx, %rdx
1454ef4f3: 74 0f                       	je	0x1454ef504 <.text+0x54ee504>
1454ef4f5: 48 8b 4d c0                 	movq	-0x40(%rbp), %rcx
1454ef4f9: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ef4ff: e8 cc 2c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ef504: 4d 85 ff                    	testq	%r15, %r15
1454ef507: 74 15                       	je	0x1454ef51e <.text+0x54ee51e>
1454ef509: 49 c1 e7 03                 	shlq	$0x3, %r15
1454ef50d: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454ef513: 4c 89 e1                    	movq	%r12, %rcx
1454ef516: 4c 89 fa                    	movq	%r15, %rdx
1454ef519: e8 b2 2c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ef51e: b8 6c 17 00 00              	movl	$0x176c, %eax           # imm = 0x176C
1454ef523: 84 db                       	testb	%bl, %bl
1454ef525: 0f 84 8d 00 00 00           	je	0x1454ef5b8 <.text+0x54ee5b8>
1454ef52b: b8 6e 17 00 00              	movl	$0x176e, %eax           # imm = 0x176E
1454ef530: e9 83 00 00 00              	jmp	0x1454ef5b8 <.text+0x54ee5b8>
1454ef535: 8b 96 50 04 00 00           	movl	0x450(%rsi), %edx
1454ef53b: 48 8d 4d b8                 	leaq	-0x48(%rbp), %rcx
1454ef53f: e8 dc ad f6 ff              	callq	0x14545a320 <.text+0x5459320>
1454ef544: 48 8b 55 b8                 	movq	-0x48(%rbp), %rdx
1454ef548: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1454ef54c: 0f 84 1e 02 00 00           	je	0x1454ef770 <.text+0x54ee770>
1454ef552: 4c 8b 7d d0                 	movq	-0x30(%rbp), %r15
1454ef556: 4c 8b 65 d8                 	movq	-0x28(%rbp), %r12
1454ef55a: 8b 45 10                    	movl	0x10(%rbp), %eax
1454ef55d: 8b 4d 14                    	movl	0x14(%rbp), %ecx
1454ef560: 83 f0 02                    	xorl	$0x2, %eax
1454ef563: 83 f1 03                    	xorl	$0x3, %ecx
1454ef566: 09 c1                       	orl	%eax, %ecx
1454ef568: 0f 94 c3                    	sete	%bl
1454ef56b: 48 85 d2                    	testq	%rdx, %rdx
1454ef56e: 74 0f                       	je	0x1454ef57f <.text+0x54ee57f>
1454ef570: 48 8b 4d c0                 	movq	-0x40(%rbp), %rcx
1454ef574: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ef57a: e8 51 2c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ef57f: 4d 85 ff                    	testq	%r15, %r15
1454ef582: 74 15                       	je	0x1454ef599 <.text+0x54ee599>
1454ef584: 49 c1 e7 03                 	shlq	$0x3, %r15
1454ef588: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454ef58e: 4c 89 e1                    	movq	%r12, %rcx
1454ef591: 4c 89 fa                    	movq	%r15, %rdx
1454ef594: e8 37 2c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ef599: b8 6c 17 00 00              	movl	$0x176c, %eax           # imm = 0x176C
1454ef59e: 84 db                       	testb	%bl, %bl
1454ef5a0: 74 05                       	je	0x1454ef5a7 <.text+0x54ee5a7>
1454ef5a2: b8 6e 17 00 00              	movl	$0x176e, %eax           # imm = 0x176E
1454ef5a7: 31 c9                       	xorl	%ecx, %ecx
1454ef5a9: 81 ff ea 4b 00 00           	cmpl	$0x4bea, %edi           # imm = 0x4BEA
1454ef5af: 74 07                       	je	0x1454ef5b8 <.text+0x54ee5b8>
1454ef5b1: eb 14                       	jmp	0x1454ef5c7 <.text+0x54ee5c7>
1454ef5b3: b8 6c 17 00 00              	movl	$0x176c, %eax           # imm = 0x176C
1454ef5b8: 89 45 4c                    	movl	%eax, 0x4c(%rbp)
1454ef5bb: c7 45 50 18 00 00 00        	movl	$0x18, 0x50(%rbp)
1454ef5c2: b9 01 00 00 00              	movl	$0x1, %ecx
1454ef5c7: 89 4d 48                    	movl	%ecx, 0x48(%rbp)
1454ef5ca: 48 8b 96 d0 03 00 00        	movq	0x3d0(%rsi), %rdx
1454ef5d1: 4c 89 6d 38                 	movq	%r13, 0x38(%rbp)
1454ef5d5: 4c 89 6d 30                 	movq	%r13, 0x30(%rbp)
1454ef5d9: c7 45 28 00 00 00 00        	movl	$0x0, 0x28(%rbp)
1454ef5e0: 48 8d 45 48                 	leaq	0x48(%rbp), %rax
1454ef5e4: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454ef5e9: 48 8d 45 28                 	leaq	0x28(%rbp), %rax
1454ef5ed: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454ef5f2: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454ef5fb: 48 8d 4d b8                 	leaq	-0x48(%rbp), %rcx
1454ef5ff: 4c 8d 4d 38                 	leaq	0x38(%rbp), %r9
1454ef603: 41 89 f8                    	movl	%edi, %r8d
1454ef606: e8 95 bb f5 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454ef60b: 48 8b 9e 48 05 00 00        	movq	0x548(%rsi), %rbx
1454ef612: 48 3b 9e 38 05 00 00        	cmpq	0x538(%rsi), %rbx
1454ef619: 75 0d                       	jne	0x1454ef628 <.text+0x54ee628>
1454ef61b: 48 8d 8e 38 05 00 00        	leaq	0x538(%rsi), %rcx
1454ef622: e8 89 8a 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454ef627: 90                          	nop
1454ef628: 48 8b 86 40 05 00 00        	movq	0x540(%rsi), %rax
1454ef62f: 48 89 d9                    	movq	%rbx, %rcx
1454ef632: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ef636: 0f 10 45 b8                 	movups	-0x48(%rbp), %xmm0
1454ef63a: 0f 10 4d c8                 	movups	-0x38(%rbp), %xmm1
1454ef63e: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454ef643: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454ef647: 48 ff c3                    	incq	%rbx
1454ef64a: 48 89 9e 48 05 00 00        	movq	%rbx, 0x548(%rsi)
1454ef651: f3 0f 10 05 3b ec 44 00     	movss	0x44ec3b(%rip), %xmm0   # 0x14593e294
1454ef659: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454ef65d: 81 ff 15 0e 00 00           	cmpl	$0xe15, %edi            # imm = 0xE15
1454ef663: 7e 3d                       	jle	0x1454ef6a2 <.text+0x54ee6a2>
1454ef665: 81 ff 04 1b 00 00           	cmpl	$0x1b04, %edi           # imm = 0x1B04
1454ef66b: 7e 6a                       	jle	0x1454ef6d7 <.text+0x54ee6d7>
1454ef66d: 81 ff 65 2c 00 00           	cmpl	$0x2c65, %edi           # imm = 0x2C65
1454ef673: 0f 8f cd 00 00 00           	jg	0x1454ef746 <.text+0x54ee746>
1454ef679: 81 ff 05 1b 00 00           	cmpl	$0x1b05, %edi           # imm = 0x1B05
1454ef67f: 0f 84 39 01 00 00           	je	0x1454ef7be <.text+0x54ee7be>
1454ef685: 81 ff 65 1c 00 00           	cmpl	$0x1c65, %edi           # imm = 0x1C65
1454ef68b: 0f 84 a8 00 00 00           	je	0x1454ef739 <.text+0x54ee739>
1454ef691: 81 ff c5 27 00 00           	cmpl	$0x27c5, %edi           # imm = 0x27C5
1454ef697: 0f 84 07 01 00 00           	je	0x1454ef7a4 <.text+0x54ee7a4>
1454ef69d: e9 5d 01 00 00              	jmp	0x1454ef7ff <.text+0x54ee7ff>
1454ef6a2: 81 ff e5 05 00 00           	cmpl	$0x5e5, %edi            # imm = 0x5E5
1454ef6a8: 7f 5e                       	jg	0x1454ef708 <.text+0x54ee708>
1454ef6aa: 81 ff 84 00 00 00           	cmpl	$0x84, %edi
1454ef6b0: 0f 8e e4 00 00 00           	jle	0x1454ef79a <.text+0x54ee79a>
1454ef6b6: 81 ff 85 00 00 00           	cmpl	$0x85, %edi
1454ef6bc: 0f 84 18 01 00 00           	je	0x1454ef7da <.text+0x54ee7da>
1454ef6c2: 81 ff 93 01 00 00           	cmpl	$0x193, %edi            # imm = 0x193
1454ef6c8: 74 6f                       	je	0x1454ef739 <.text+0x54ee739>
1454ef6ca: 81 ff ae 02 00 00           	cmpl	$0x2ae, %edi            # imm = 0x2AE
1454ef6d0: 74 67                       	je	0x1454ef739 <.text+0x54ee739>
1454ef6d2: e9 28 01 00 00              	jmp	0x1454ef7ff <.text+0x54ee7ff>
1454ef6d7: 81 ff 37 14 00 00           	cmpl	$0x1437, %edi           # imm = 0x1437
1454ef6dd: 0f 8e a5 00 00 00           	jle	0x1454ef788 <.text+0x54ee788>
1454ef6e3: 81 ff 38 14 00 00           	cmpl	$0x1438, %edi           # imm = 0x1438
1454ef6e9: 74 4e                       	je	0x1454ef739 <.text+0x54ee739>
1454ef6eb: 81 ff d1 18 00 00           	cmpl	$0x18d1, %edi           # imm = 0x18D1
1454ef6f1: 0f 84 e3 00 00 00           	je	0x1454ef7da <.text+0x54ee7da>
1454ef6f7: 81 ff 85 1a 00 00           	cmpl	$0x1a85, %edi           # imm = 0x1A85
1454ef6fd: 0f 84 d7 00 00 00           	je	0x1454ef7da <.text+0x54ee7da>
1454ef703: e9 f7 00 00 00              	jmp	0x1454ef7ff <.text+0x54ee7ff>
1454ef708: 81 ff 52 0a 00 00           	cmpl	$0xa52, %edi            # imm = 0xA52
1454ef70e: 0f 8e 9a 00 00 00           	jle	0x1454ef7ae <.text+0x54ee7ae>
1454ef714: 81 ff 53 0a 00 00           	cmpl	$0xa53, %edi            # imm = 0xA53
1454ef71a: 0f 84 a8 00 00 00           	je	0x1454ef7c8 <.text+0x54ee7c8>
1454ef720: 81 ff fc 0a 00 00           	cmpl	$0xafc, %edi            # imm = 0xAFC
1454ef726: 74 11                       	je	0x1454ef739 <.text+0x54ee739>
1454ef728: 81 ff e4 0b 00 00           	cmpl	$0xbe4, %edi            # imm = 0xBE4
1454ef72e: 0f 84 8a 00 00 00           	je	0x1454ef7be <.text+0x54ee7be>
1454ef734: e9 c6 00 00 00              	jmp	0x1454ef7ff <.text+0x54ee7ff>
1454ef739: f3 0f 10 05 5f 98 40 00     	movss	0x40985f(%rip), %xmm0   # 0x1458f8fa0
1454ef741: e9 94 00 00 00              	jmp	0x1454ef7da <.text+0x54ee7da>
1454ef746: 81 ff 66 2c 00 00           	cmpl	$0x2c66, %edi           # imm = 0x2C66
1454ef74c: 0f 84 88 00 00 00           	je	0x1454ef7da <.text+0x54ee7da>
1454ef752: 81 ff ea 4b 00 00           	cmpl	$0x4bea, %edi           # imm = 0x4BEA
1454ef758: 74 64                       	je	0x1454ef7be <.text+0x54ee7be>
1454ef75a: 81 ff d3 5e 00 00           	cmpl	$0x5ed3, %edi           # imm = 0x5ED3
1454ef760: 0f 85 99 00 00 00           	jne	0x1454ef7ff <.text+0x54ee7ff>
1454ef766: f3 0f 10 05 7a 82 4d 00     	movss	0x4d827a(%rip), %xmm0   # 0x1459c79e8
1454ef76e: eb 6a                       	jmp	0x1454ef7da <.text+0x54ee7da>
1454ef770: b8 6c 17 00 00              	movl	$0x176c, %eax           # imm = 0x176C
1454ef775: 31 c9                       	xorl	%ecx, %ecx
1454ef777: 81 ff ea 4b 00 00           	cmpl	$0x4bea, %edi           # imm = 0x4BEA
1454ef77d: 0f 84 35 fe ff ff           	je	0x1454ef5b8 <.text+0x54ee5b8>
1454ef783: e9 3f fe ff ff              	jmp	0x1454ef5c7 <.text+0x54ee5c7>
1454ef788: 81 ff 16 0e 00 00           	cmpl	$0xe16, %edi            # imm = 0xE16
1454ef78e: 74 42                       	je	0x1454ef7d2 <.text+0x54ee7d2>
1454ef790: 81 ff fc 13 00 00           	cmpl	$0x13fc, %edi           # imm = 0x13FC
1454ef796: 74 26                       	je	0x1454ef7be <.text+0x54ee7be>
1454ef798: eb 65                       	jmp	0x1454ef7ff <.text+0x54ee7ff>
1454ef79a: 83 ff 4b                    	cmpl	$0x4b, %edi
1454ef79d: 74 1f                       	je	0x1454ef7be <.text+0x54ee7be>
1454ef79f: 83 ff 74                    	cmpl	$0x74, %edi
1454ef7a2: 75 5b                       	jne	0x1454ef7ff <.text+0x54ee7ff>
1454ef7a4: f3 0f 10 05 a4 44 44 00     	movss	0x4444a4(%rip), %xmm0   # 0x145933c50
1454ef7ac: eb 2c                       	jmp	0x1454ef7da <.text+0x54ee7da>
1454ef7ae: 81 ff e6 05 00 00           	cmpl	$0x5e6, %edi            # imm = 0x5E6
1454ef7b4: 74 12                       	je	0x1454ef7c8 <.text+0x54ee7c8>
1454ef7b6: 81 ff ba 07 00 00           	cmpl	$0x7ba, %edi            # imm = 0x7BA
1454ef7bc: 75 41                       	jne	0x1454ef7ff <.text+0x54ee7ff>
1454ef7be: f3 0f 10 05 ba 6e 40 00     	movss	0x406eba(%rip), %xmm0   # 0x1458f6680
1454ef7c6: eb 12                       	jmp	0x1454ef7da <.text+0x54ee7da>
1454ef7c8: f3 0f 10 05 30 6e 40 00     	movss	0x406e30(%rip), %xmm0   # 0x1458f6600
1454ef7d0: eb 08                       	jmp	0x1454ef7da <.text+0x54ee7da>
1454ef7d2: f3 0f 10 05 46 82 4d 00     	movss	0x4d8246(%rip), %xmm0   # 0x1459c7a20
1454ef7da: f2 0f 10 8e e8 03 00 00     	movsd	0x3e8(%rsi), %xmm1
1454ef7e2: 41 0f 5c c8                 	subps	%xmm8, %xmm1
1454ef7e6: 0f 59 c9                    	mulps	%xmm1, %xmm1
1454ef7e9: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454ef7ed: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1454ef7f1: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454ef7f5: f3 44 0f 51 ca              	sqrtss	%xmm2, %xmm9
1454ef7fa: f3 44 0f 5e c8              	divss	%xmm0, %xmm9
1454ef7ff: 89 7d 54                    	movl	%edi, 0x54(%rbp)
1454ef802: 48 8b 8e 80 08 00 00        	movq	0x880(%rsi), %rcx
1454ef809: 48 8b 86 98 08 00 00        	movq	0x898(%rsi), %rax
1454ef810: 48 8d 14 08                 	leaq	(%rax,%rcx), %rdx
1454ef814: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454ef818: 48 01 ca                    	addq	%rcx, %rdx
1454ef81b: 4c 8b 86 88 08 00 00        	movq	0x888(%rsi), %r8
1454ef822: 4d 89 c1                    	movq	%r8, %r9
1454ef825: 49 c1 e1 11                 	shlq	$0x11, %r9
1454ef829: 4c 8b 96 90 08 00 00        	movq	0x890(%rsi), %r10
1454ef830: 49 31 ca                    	xorq	%rcx, %r10
1454ef833: 4c 31 c0                    	xorq	%r8, %rax
1454ef836: 4d 31 d0                    	xorq	%r10, %r8
1454ef839: 4c 89 86 88 08 00 00        	movq	%r8, 0x888(%rsi)
1454ef840: 48 31 c1                    	xorq	%rax, %rcx
1454ef843: 48 89 8e 80 08 00 00        	movq	%rcx, 0x880(%rsi)
1454ef84a: 4d 31 ca                    	xorq	%r9, %r10
1454ef84d: 4c 89 96 90 08 00 00        	movq	%r10, 0x890(%rsi)
1454ef854: 48 c1 c0 2d                 	rolq	$0x2d, %rax
1454ef858: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454ef85c: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454ef85f: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454ef863: 48 89 86 98 08 00 00        	movq	%rax, 0x898(%rsi)
1454ef86a: f3 0f 59 05 4e bb 4f 00     	mulss	0x4fbb4e(%rip), %xmm0   # 0x1459eb3c0
1454ef872: f3 0f 10 8e 64 04 00 00     	movss	0x464(%rsi), %xmm1
1454ef87a: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454ef87d: 41 0f 97 c7                 	seta	%r15b
1454ef881: 44 89 f7                    	movl	%r14d, %edi
1454ef884: 76 08                       	jbe	0x1454ef88e <.text+0x54ee88e>
1454ef886: f3 0f 59 b6 68 04 00 00     	mulss	0x468(%rsi), %xmm6
1454ef88e: f3 0f 58 be e4 08 00 00     	addss	0x8e4(%rsi), %xmm7
1454ef896: f3 44 0f 58 cf              	addss	%xmm7, %xmm9
1454ef89b: 4c 8b b6 d0 03 00 00        	movq	0x3d0(%rsi), %r14
1454ef8a2: 0f 10 7e 40                 	movups	0x40(%rsi), %xmm7
1454ef8a6: 0f b6 9e ec 07 00 00        	movzbl	0x7ec(%rsi), %ebx
1454ef8ad: 4c 8b a6 00 05 00 00        	movq	0x500(%rsi), %r12
1454ef8b4: 4c 3b a6 f0 04 00 00        	cmpq	0x4f0(%rsi), %r12
1454ef8bb: 75 0c                       	jne	0x1454ef8c9 <.text+0x54ee8c9>
1454ef8bd: 48 8d 8e f0 04 00 00        	leaq	0x4f0(%rsi), %rcx
1454ef8c4: e8 e7 49 27 00              	callq	0x1457642b0 <.text+0x57632b0>
1454ef8c9: 48 8b 86 f8 04 00 00        	movq	0x4f8(%rsi), %rax
1454ef8d0: 4b 8d 0c a4                 	leaq	(%r12,%r12,4), %rcx
1454ef8d4: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454ef8d8: 0f 11 3c 08                 	movups	%xmm7, (%rax,%rcx)
1454ef8dc: 48 8b 95 28 01 00 00        	movq	0x128(%rbp), %rdx
1454ef8e3: 0f 10 02                    	movups	(%rdx), %xmm0
1454ef8e6: 0f 11 44 08 10              	movups	%xmm0, 0x10(%rax,%rcx)
1454ef8eb: 4c 89 6c 08 20              	movq	%r13, 0x20(%rax,%rcx)
1454ef8f0: 4c 89 74 08 28              	movq	%r14, 0x28(%rax,%rcx)
1454ef8f5: 4c 8b 45 40                 	movq	0x40(%rbp), %r8
1454ef8f9: 49 8b 10                    	movq	(%r8), %rdx
1454ef8fc: 48 89 54 08 30              	movq	%rdx, 0x30(%rax,%rcx)
1454ef901: 41 8b 50 08                 	movl	0x8(%r8), %edx
1454ef905: 89 54 08 38                 	movl	%edx, 0x38(%rax,%rcx)
1454ef909: f3 44 0f 11 4c 08 3c        	movss	%xmm9, 0x3c(%rax,%rcx)
1454ef910: 8b 55 54                    	movl	0x54(%rbp), %edx
1454ef913: 89 54 08 40                 	movl	%edx, 0x40(%rax,%rcx)
1454ef917: f3 0f 11 74 08 44           	movss	%xmm6, 0x44(%rax,%rcx)
1454ef91d: 44 88 7c 08 48              	movb	%r15b, 0x48(%rax,%rcx)
1454ef922: c6 44 08 49 00              	movb	$0x0, 0x49(%rax,%rcx)
1454ef927: 88 5c 08 4a                 	movb	%bl, 0x4a(%rax,%rcx)
1454ef92b: 40 88 7c 08 4b              	movb	%dil, 0x4b(%rax,%rcx)
1454ef930: 49 ff c4                    	incq	%r12
1454ef933: 4c 89 a6 00 05 00 00        	movq	%r12, 0x500(%rsi)
1454ef93a: 0f 28 75 60                 	movaps	0x60(%rbp), %xmm6
1454ef93e: 0f 28 7d 70                 	movaps	0x70(%rbp), %xmm7
1454ef942: 44 0f 28 85 80 00 00 00     	movaps	0x80(%rbp), %xmm8
1454ef94a: 44 0f 28 8d 90 00 00 00     	movaps	0x90(%rbp), %xmm9
1454ef952: 48 81 c4 28 01 00 00        	addq	$0x128, %rsp            # imm = 0x128
1454ef959: 5b                          	popq	%rbx
1454ef95a: 5f                          	popq	%rdi
1454ef95b: 5e                          	popq	%rsi
1454ef95c: 41 5c                       	popq	%r12
1454ef95e: 41 5d                       	popq	%r13
1454ef960: 41 5e                       	popq	%r14
1454ef962: 41 5f                       	popq	%r15
1454ef964: 5d                          	popq	%rbp
1454ef965: c3                          	retq
