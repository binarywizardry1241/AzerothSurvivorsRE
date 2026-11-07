
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552d410: 55                          	pushq	%rbp
14552d411: 41 57                       	pushq	%r15
14552d413: 41 56                       	pushq	%r14
14552d415: 41 55                       	pushq	%r13
14552d417: 41 54                       	pushq	%r12
14552d419: 56                          	pushq	%rsi
14552d41a: 57                          	pushq	%rdi
14552d41b: 53                          	pushq	%rbx
14552d41c: 48 81 ec a8 00 00 00        	subq	$0xa8, %rsp
14552d423: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14552d42b: 48 c7 45 20 fe ff ff ff     	movq	$-0x2, 0x20(%rbp)
14552d433: 48 89 4d d8                 	movq	%rcx, -0x28(%rbp)
14552d437: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
14552d43b: 48 89 55 18                 	movq	%rdx, 0x18(%rbp)
14552d43f: 48 8b 5a 18                 	movq	0x18(%rdx), %rbx
14552d443: 49 39 de                    	cmpq	%rbx, %r14
14552d446: 0f 84 4d 01 00 00           	je	0x14552d599 <.text+0x552c599>
14552d44c: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
14552d450: 48 8b 51 20                 	movq	0x20(%rcx), %rdx
14552d454: 4c 8b 79 28                 	movq	0x28(%rcx), %r15
14552d458: 48 8b 42 08                 	movq	0x8(%rdx), %rax
14552d45c: 4c 8b 69 30                 	movq	0x30(%rcx), %r13
14552d460: 48 89 55 b0                 	movq	%rdx, -0x50(%rbp)
14552d464: 48 69 4a 10 60 01 00 00     	imulq	$0x160, 0x10(%rdx), %rcx # imm = 0x160
14552d46c: 48 89 5d c0                 	movq	%rbx, -0x40(%rbp)
14552d470: 4c 89 7d c8                 	movq	%r15, -0x38(%rbp)
14552d474: 4c 89 6d d0                 	movq	%r13, -0x30(%rbp)
14552d478: eb 16                       	jmp	0x14552d490 <.text+0x552c490>
14552d47a: 45 31 c0                    	xorl	%r8d, %r8d
14552d47d: 4d 3b 45 00                 	cmpq	(%r13), %r8
14552d481: 0f 82 55 01 00 00           	jb	0x14552d5dc <.text+0x552c5dc>
14552d487: 49 39 de                    	cmpq	%rbx, %r14
14552d48a: 0f 84 09 01 00 00           	je	0x14552d599 <.text+0x552c599>
14552d490: 49 8b 3e                    	movq	(%r14), %rdi
14552d493: 49 83 c6 08                 	addq	$0x8, %r14
14552d497: 31 d2                       	xorl	%edx, %edx
14552d499: 49 89 c0                    	movq	%rax, %r8
14552d49c: 0f 1f 40 00                 	nopl	(%rax)
14552d4a0: 48 39 d1                    	cmpq	%rdx, %rcx
14552d4a3: 74 e2                       	je	0x14552d487 <.text+0x552c487>
14552d4a5: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
14552d4ac: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
14552d4b3: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
14552d4ba: 75 e4                       	jne	0x14552d4a0 <.text+0x552c4a0>
14552d4bc: 48 8b b4 10 b0 fe ff ff     	movq	-0x150(%rax,%rdx), %rsi
14552d4c4: 48 85 f6                    	testq	%rsi, %rsi
14552d4c7: 74 b1                       	je	0x14552d47a <.text+0x552c47a>
14552d4c9: 45 8b 57 40                 	movl	0x40(%r15), %r10d
14552d4cd: 4c 8b 8c 10 a8 fe ff ff     	movq	-0x158(%rax,%rdx), %r9
14552d4d5: 48 83 fe 01                 	cmpq	$0x1, %rsi
14552d4d9: 75 0b                       	jne	0x14552d4e6 <.text+0x552c4e6>
14552d4db: 45 31 e4                    	xorl	%r12d, %r12d
14552d4de: 45 31 c0                    	xorl	%r8d, %r8d
14552d4e1: e9 82 00 00 00              	jmp	0x14552d568 <.text+0x552c568>
14552d4e6: 49 89 f3                    	movq	%rsi, %r11
14552d4e9: 49 83 e3 fe                 	andq	$-0x2, %r11
14552d4ed: 4d 8d 69 50                 	leaq	0x50(%r9), %r13
14552d4f1: 45 31 e4                    	xorl	%r12d, %r12d
14552d4f4: 45 31 c0                    	xorl	%r8d, %r8d
14552d4f7: eb 1d                       	jmp	0x14552d516 <.text+0x552c516>
14552d4f9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
14552d500: 45 31 ff                    	xorl	%r15d, %r15d
14552d503: 49 01 d8                    	addq	%rbx, %r8
14552d506: 4d 01 f8                    	addq	%r15, %r8
14552d509: 49 83 c4 02                 	addq	$0x2, %r12
14552d50d: 49 83 c5 60                 	addq	$0x60, %r13
14552d511: 4d 39 e3                    	cmpq	%r12, %r11
14552d514: 74 3c                       	je	0x14552d552 <.text+0x552c552>
14552d516: 45 39 55 c0                 	cmpl	%r10d, -0x40(%r13)
14552d51a: 75 07                       	jne	0x14552d523 <.text+0x552c523>
14552d51c: 41 80 7d b0 00              	cmpb	$0x0, -0x50(%r13)
14552d521: 74 1d                       	je	0x14552d540 <.text+0x552c540>
14552d523: 31 db                       	xorl	%ebx, %ebx
14552d525: 45 39 55 f0                 	cmpl	%r10d, -0x10(%r13)
14552d529: 75 d5                       	jne	0x14552d500 <.text+0x552c500>
14552d52b: 41 80 7d e0 00              	cmpb	$0x0, -0x20(%r13)
14552d530: 75 ce                       	jne	0x14552d500 <.text+0x552c500>
14552d532: 45 31 ff                    	xorl	%r15d, %r15d
14552d535: 41 83 7d 00 00              	cmpl	$0x0, (%r13)
14552d53a: 41 0f 95 c7                 	setne	%r15b
14552d53e: eb c3                       	jmp	0x14552d503 <.text+0x552c503>
14552d540: 31 db                       	xorl	%ebx, %ebx
14552d542: 41 83 7d d0 00              	cmpl	$0x0, -0x30(%r13)
14552d547: 0f 95 c3                    	setne	%bl
14552d54a: 45 39 55 f0                 	cmpl	%r10d, -0x10(%r13)
14552d54e: 75 b0                       	jne	0x14552d500 <.text+0x552c500>
14552d550: eb d9                       	jmp	0x14552d52b <.text+0x552c52b>
14552d552: 40 f6 c6 01                 	testb	$0x1, %sil
14552d556: 48 8b 5d c0                 	movq	-0x40(%rbp), %rbx
14552d55a: 4c 8b 7d c8                 	movq	-0x38(%rbp), %r15
14552d55e: 4c 8b 6d d0                 	movq	-0x30(%rbp), %r13
14552d562: 0f 84 15 ff ff ff           	je	0x14552d47d <.text+0x552c47d>
14552d568: 4f 8d 1c 64                 	leaq	(%r12,%r12,2), %r11
14552d56c: 49 c1 e3 04                 	shlq	$0x4, %r11
14552d570: 47 39 54 19 10              	cmpl	%r10d, 0x10(%r9,%r11)
14552d575: 75 09                       	jne	0x14552d580 <.text+0x552c580>
14552d577: 4d 01 d9                    	addq	%r11, %r9
14552d57a: 41 80 39 00                 	cmpb	$0x0, (%r9)
14552d57e: 74 0b                       	je	0x14552d58b <.text+0x552c58b>
14552d580: 45 31 d2                    	xorl	%r10d, %r10d
14552d583: 4d 01 d0                    	addq	%r10, %r8
14552d586: e9 f2 fe ff ff              	jmp	0x14552d47d <.text+0x552c47d>
14552d58b: 45 31 d2                    	xorl	%r10d, %r10d
14552d58e: 41 83 79 20 00              	cmpl	$0x0, 0x20(%r9)
14552d593: 41 0f 95 c2                 	setne	%r10b
14552d597: eb ea                       	jmp	0x14552d583 <.text+0x552c583>
14552d599: 48 8b 75 d8                 	movq	-0x28(%rbp), %rsi
14552d59d: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14552d5a4: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
14552d5ac: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14552d5b4: 48 8b 45 18                 	movq	0x18(%rbp), %rax
14552d5b8: 48 8b 50 10                 	movq	0x10(%rax), %rdx
14552d5bc: 48 85 d2                    	testq	%rdx, %rdx
14552d5bf: 0f 84 86 02 00 00           	je	0x14552d84b <.text+0x552c84b>
14552d5c5: 48 8b 08                    	movq	(%rax), %rcx
14552d5c8: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552d5cc: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552d5d2: e8 f9 4b ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552d5d7: e9 6f 02 00 00              	jmp	0x14552d84b <.text+0x552c84b>
14552d5dc: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
14552d5e0: 4c 89 71 08                 	movq	%r14, 0x8(%rcx)
14552d5e4: 48 83 bc 10 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%rdx)
14552d5ed: 74 04                       	je	0x14552d5f3 <.text+0x552c5f3>
14552d5ef: 31 f6                       	xorl	%esi, %esi
14552d5f1: eb 0e                       	jmp	0x14552d601 <.text+0x552c601>
14552d5f3: 49 ff c0                    	incq	%r8
14552d5f6: 31 f6                       	xorl	%esi, %esi
14552d5f8: 80 7c 10 f8 00              	cmpb	$0x0, -0x8(%rax,%rdx)
14552d5fd: 49 0f 44 f0                 	cmoveq	%r8, %rsi
14552d601: e8 fa 4b ad fa              	callq	0x140002200 <.text+0x1200>
14552d606: b9 40 00 00 00              	movl	$0x40, %ecx
14552d60b: ba 08 00 00 00              	movl	$0x8, %edx
14552d610: e8 ab 4b ad fa              	callq	0x1400021c0 <.text+0x11c0>
14552d615: 48 85 c0                    	testq	%rax, %rax
14552d618: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
14552d61c: 0f 84 40 02 00 00           	je	0x14552d862 <.text+0x552c862>
14552d622: 48 89 30                    	movq	%rsi, (%rax)
14552d625: 48 89 78 08                 	movq	%rdi, 0x8(%rax)
14552d629: 48 c7 45 f0 04 00 00 00     	movq	$0x4, -0x10(%rbp)
14552d631: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
14552d635: 48 c7 45 00 01 00 00 00     	movq	$0x1, (%rbp)
14552d63d: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
14552d641: 48 8b 11                    	movq	(%rcx), %rdx
14552d644: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
14552d648: 48 8b 49 10                 	movq	0x10(%rcx), %rcx
14552d64c: 48 89 4d 08                 	movq	%rcx, 0x8(%rbp)
14552d650: 49 39 de                    	cmpq	%rbx, %r14
14552d653: 0f 84 c3 01 00 00           	je	0x14552d81c <.text+0x552c81c>
14552d659: b9 01 00 00 00              	movl	$0x1, %ecx
14552d65e: 48 89 4d 10                 	movq	%rcx, 0x10(%rbp)
14552d662: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14552d666: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
14552d66a: 48 8b 48 08                 	movq	0x8(%rax), %rcx
14552d66e: 48 69 50 10 60 01 00 00     	imulq	$0x160, 0x10(%rax), %rdx # imm = 0x160
14552d676: eb 16                       	jmp	0x14552d68e <.text+0x552c68e>
14552d678: 45 31 c9                    	xorl	%r9d, %r9d
14552d67b: 4d 3b 4d 00                 	cmpq	(%r13), %r9
14552d67f: 0f 82 0f 01 00 00           	jb	0x14552d794 <.text+0x552c794>
14552d685: 49 39 de                    	cmpq	%rbx, %r14
14552d688: 0f 84 8e 01 00 00           	je	0x14552d81c <.text+0x552c81c>
14552d68e: 49 8b 3e                    	movq	(%r14), %rdi
14552d691: 49 83 c6 08                 	addq	$0x8, %r14
14552d695: 45 31 c0                    	xorl	%r8d, %r8d
14552d698: 48 89 c8                    	movq	%rcx, %rax
14552d69b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14552d6a0: 4c 39 c2                    	cmpq	%r8, %rdx
14552d6a3: 74 e0                       	je	0x14552d685 <.text+0x552c685>
14552d6a5: 49 81 c0 60 01 00 00        	addq	$0x160, %r8             # imm = 0x160
14552d6ac: 48 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%rax)
14552d6b3: 48 8d 80 60 01 00 00        	leaq	0x160(%rax), %rax
14552d6ba: 75 e4                       	jne	0x14552d6a0 <.text+0x552c6a0>
14552d6bc: 4a 8b 84 01 b0 fe ff ff     	movq	-0x150(%rcx,%r8), %rax
14552d6c4: 48 85 c0                    	testq	%rax, %rax
14552d6c7: 74 af                       	je	0x14552d678 <.text+0x552c678>
14552d6c9: 45 8b 5f 40                 	movl	0x40(%r15), %r11d
14552d6cd: 4e 8b 94 01 a8 fe ff ff     	movq	-0x158(%rcx,%r8), %r10
14552d6d5: 48 83 f8 01                 	cmpq	$0x1, %rax
14552d6d9: 75 0b                       	jne	0x14552d6e6 <.text+0x552c6e6>
14552d6db: 45 31 e4                    	xorl	%r12d, %r12d
14552d6de: 45 31 c9                    	xorl	%r9d, %r9d
14552d6e1: e9 80 00 00 00              	jmp	0x14552d766 <.text+0x552c766>
14552d6e6: 48 89 c6                    	movq	%rax, %rsi
14552d6e9: 48 83 e6 fe                 	andq	$-0x2, %rsi
14552d6ed: 4d 8d 6a 50                 	leaq	0x50(%r10), %r13
14552d6f1: 45 31 e4                    	xorl	%r12d, %r12d
14552d6f4: 45 31 c9                    	xorl	%r9d, %r9d
14552d6f7: eb 1d                       	jmp	0x14552d716 <.text+0x552c716>
14552d6f9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
14552d700: 45 31 ff                    	xorl	%r15d, %r15d
14552d703: 49 01 d9                    	addq	%rbx, %r9
14552d706: 4d 01 f9                    	addq	%r15, %r9
14552d709: 49 83 c4 02                 	addq	$0x2, %r12
14552d70d: 49 83 c5 60                 	addq	$0x60, %r13
14552d711: 4c 39 e6                    	cmpq	%r12, %rsi
14552d714: 74 3c                       	je	0x14552d752 <.text+0x552c752>
14552d716: 45 39 5d c0                 	cmpl	%r11d, -0x40(%r13)
14552d71a: 75 07                       	jne	0x14552d723 <.text+0x552c723>
14552d71c: 41 80 7d b0 00              	cmpb	$0x0, -0x50(%r13)
14552d721: 74 1d                       	je	0x14552d740 <.text+0x552c740>
14552d723: 31 db                       	xorl	%ebx, %ebx
14552d725: 45 39 5d f0                 	cmpl	%r11d, -0x10(%r13)
14552d729: 75 d5                       	jne	0x14552d700 <.text+0x552c700>
14552d72b: 41 80 7d e0 00              	cmpb	$0x0, -0x20(%r13)
14552d730: 75 ce                       	jne	0x14552d700 <.text+0x552c700>
14552d732: 45 31 ff                    	xorl	%r15d, %r15d
14552d735: 41 83 7d 00 00              	cmpl	$0x0, (%r13)
14552d73a: 41 0f 95 c7                 	setne	%r15b
14552d73e: eb c3                       	jmp	0x14552d703 <.text+0x552c703>
14552d740: 31 db                       	xorl	%ebx, %ebx
14552d742: 41 83 7d d0 00              	cmpl	$0x0, -0x30(%r13)
14552d747: 0f 95 c3                    	setne	%bl
14552d74a: 45 39 5d f0                 	cmpl	%r11d, -0x10(%r13)
14552d74e: 75 b0                       	jne	0x14552d700 <.text+0x552c700>
14552d750: eb d9                       	jmp	0x14552d72b <.text+0x552c72b>
14552d752: a8 01                       	testb	$0x1, %al
14552d754: 48 8b 5d c0                 	movq	-0x40(%rbp), %rbx
14552d758: 4c 8b 7d c8                 	movq	-0x38(%rbp), %r15
14552d75c: 4c 8b 6d d0                 	movq	-0x30(%rbp), %r13
14552d760: 0f 84 15 ff ff ff           	je	0x14552d67b <.text+0x552c67b>
14552d766: 4b 8d 04 64                 	leaq	(%r12,%r12,2), %rax
14552d76a: 48 c1 e0 04                 	shlq	$0x4, %rax
14552d76e: 45 39 5c 02 10              	cmpl	%r11d, 0x10(%r10,%rax)
14552d773: 75 09                       	jne	0x14552d77e <.text+0x552c77e>
14552d775: 49 01 c2                    	addq	%rax, %r10
14552d778: 41 80 3a 00                 	cmpb	$0x0, (%r10)
14552d77c: 74 0a                       	je	0x14552d788 <.text+0x552c788>
14552d77e: 31 c0                       	xorl	%eax, %eax
14552d780: 49 01 c1                    	addq	%rax, %r9
14552d783: e9 f3 fe ff ff              	jmp	0x14552d67b <.text+0x552c67b>
14552d788: 31 c0                       	xorl	%eax, %eax
14552d78a: 41 83 7a 20 00              	cmpl	$0x0, 0x20(%r10)
14552d78f: 0f 95 c0                    	setne	%al
14552d792: eb ec                       	jmp	0x14552d780 <.text+0x552c780>
14552d794: 4a 83 bc 01 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rcx,%r8)
14552d79d: 74 0e                       	je	0x14552d7ad <.text+0x552c7ad>
14552d79f: 31 f6                       	xorl	%esi, %esi
14552d7a1: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
14552d7a5: 48 3b 55 f0                 	cmpq	-0x10(%rbp), %rdx
14552d7a9: 74 1e                       	je	0x14552d7c9 <.text+0x552c7c9>
14552d7ab: eb 47                       	jmp	0x14552d7f4 <.text+0x552c7f4>
14552d7ad: 49 ff c1                    	incq	%r9
14552d7b0: 42 80 7c 01 f8 00           	cmpb	$0x0, -0x8(%rcx,%r8)
14552d7b6: be 00 00 00 00              	movl	$0x0, %esi
14552d7bb: 49 0f 44 f1                 	cmoveq	%r9, %rsi
14552d7bf: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
14552d7c3: 48 3b 55 f0                 	cmpq	-0x10(%rbp), %rdx
14552d7c7: 75 2b                       	jne	0x14552d7f4 <.text+0x552c7f4>
14552d7c9: 48 c7 44 24 20 10 00 00 00  	movq	$0x10, 0x20(%rsp)
14552d7d2: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14552d7d8: 41 b9 08 00 00 00           	movl	$0x8, %r9d
14552d7de: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
14552d7e2: e8 59 a5 22 00              	callq	0x145757d40 <.text+0x5756d40>
14552d7e7: 90                          	nop
14552d7e8: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
14552d7ec: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14552d7f0: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
14552d7f4: 48 89 d0                    	movq	%rdx, %rax
14552d7f7: 48 c1 e0 04                 	shlq	$0x4, %rax
14552d7fb: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
14552d7ff: 48 89 34 01                 	movq	%rsi, (%rcx,%rax)
14552d803: 48 89 7c 01 08              	movq	%rdi, 0x8(%rcx,%rax)
14552d808: 48 ff c2                    	incq	%rdx
14552d80b: 48 89 55 10                 	movq	%rdx, 0x10(%rbp)
14552d80f: 48 89 55 00                 	movq	%rdx, (%rbp)
14552d813: 49 39 de                    	cmpq	%rbx, %r14
14552d816: 0f 85 4a fe ff ff           	jne	0x14552d666 <.text+0x552c666>
14552d81c: 48 8b 55 08                 	movq	0x8(%rbp), %rdx
14552d820: 48 85 d2                    	testq	%rdx, %rdx
14552d823: 74 13                       	je	0x14552d838 <.text+0x552c838>
14552d825: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552d829: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552d82f: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
14552d833: e8 98 49 ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552d838: 48 8b 45 00                 	movq	(%rbp), %rax
14552d83c: 48 8b 75 d8                 	movq	-0x28(%rbp), %rsi
14552d840: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14552d844: 0f 10 45 f0                 	movups	-0x10(%rbp), %xmm0
14552d848: 0f 11 06                    	movups	%xmm0, (%rsi)
14552d84b: 48 89 f0                    	movq	%rsi, %rax
14552d84e: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
14552d855: 5b                          	popq	%rbx
14552d856: 5f                          	popq	%rdi
14552d857: 5e                          	popq	%rsi
14552d858: 41 5c                       	popq	%r12
14552d85a: 41 5d                       	popq	%r13
14552d85c: 41 5e                       	popq	%r14
14552d85e: 41 5f                       	popq	%r15
14552d860: 5d                          	popq	%rbp
14552d861: c3                          	retq
14552d862: b9 08 00 00 00              	movl	$0x8, %ecx
14552d867: ba 40 00 00 00              	movl	$0x40, %edx
14552d86c: e8 aa 99 3b 00              	callq	0x1458e721b <.text+0x58e621b>
14552d871: 90                          	nop
14552d872: 0f 0b                       	ud2
