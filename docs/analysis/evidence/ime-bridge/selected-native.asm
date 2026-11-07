1402dde10: 55                          	pushq	%rbp
1402dde11: 41 57                       	pushq	%r15
1402dde13: 41 56                       	pushq	%r14
1402dde15: 41 55                       	pushq	%r13
1402dde17: 41 54                       	pushq	%r12
1402dde19: 56                          	pushq	%rsi
1402dde1a: 57                          	pushq	%rdi
1402dde1b: 53                          	pushq	%rbx
1402dde1c: 48 81 ec 68 01 00 00        	subq	$0x168, %rsp            # imm = 0x168
1402dde23: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1402dde2b: 0f 29 bd d0 00 00 00        	movaps	%xmm7, 0xd0(%rbp)
1402dde32: 0f 29 b5 c0 00 00 00        	movaps	%xmm6, 0xc0(%rbp)
1402dde39: 48 c7 85 b8 00 00 00 fe ff ff ff    	movq	$-0x2, 0xb8(%rbp)
1402dde44: 48 8b 1a                    	movq	(%rdx), %rbx
1402dde47: 48 8b 52 08                 	movq	0x8(%rdx), %rdx
1402dde4b: 4d 8b 20                    	movq	(%r8), %r12
1402dde4e: 49 8b 40 10                 	movq	0x10(%r8), %rax
1402dde52: 48 89 45 00                 	movq	%rax, (%rbp)
1402dde56: 41 8b 40 1c                 	movl	0x1c(%r8), %eax
1402dde5a: 89 85 a4 00 00 00           	movl	%eax, 0xa4(%rbp)
1402dde60: 41 0f 10 31                 	movups	(%r9), %xmm6
1402dde64: 48 c7 85 88 00 00 00 00 00 00 00    	movq	$0x0, 0x88(%rbp)
1402dde6f: 48 c7 85 90 00 00 00 01 00 00 00    	movq	$0x1, 0x90(%rbp)
1402dde7a: 48 c7 85 98 00 00 00 00 00 00 00    	movq	$0x0, 0x98(%rbp)
1402dde85: 4c 8b 13                    	movq	(%rbx), %r10
1402dde88: 45 31 c0                    	xorl	%r8d, %r8d
1402dde8b: 4c 89 d0                    	movq	%r10, %rax
1402dde8e: 48 2b 42 18                 	subq	0x18(%rdx), %rax
1402dde92: 49 0f 42 c0                 	cmovbq	%r8, %rax
1402dde96: 4c 2b 52 38                 	subq	0x38(%rdx), %r10
1402dde9a: 4d 0f 42 d0                 	cmovbq	%r8, %r10
1402dde9e: 48 89 c1                    	movq	%rax, %rcx
1402ddea1: 48 c1 e1 06                 	shlq	$0x6, %rcx
1402ddea5: 48 03 4a 08                 	addq	0x8(%rdx), %rcx
1402ddea9: 4c 8b 6a 10                 	movq	0x10(%rdx), %r13
1402ddead: 49 29 c5                    	subq	%rax, %r13
1402ddeb0: 4d 0f 42 e8                 	cmovbq	%r8, %r13
1402ddeb4: f2 41 0f 10 79 10           	movsd	0x10(%r9), %xmm7
1402ddeba: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1402ddec0: 49 0f 42 c9                 	cmovbq	%r9, %rcx
1402ddec4: 4c 89 d0                    	movq	%r10, %rax
1402ddec7: 48 c1 e0 06                 	shlq	$0x6, %rax
1402ddecb: 48 03 42 28                 	addq	0x28(%rdx), %rax
1402ddecf: 48 8b 72 30                 	movq	0x30(%rdx), %rsi
1402dded3: 4c 29 d6                    	subq	%r10, %rsi
1402dded6: 49 0f 42 c1                 	cmovbq	%r9, %rax
1402ddeda: 49 0f 42 f0                 	cmovbq	%r8, %rsi
1402ddede: 48 8b 52 40                 	movq	0x40(%rdx), %rdx
1402ddee2: 48 29 f2                    	subq	%rsi, %rdx
1402ddee5: 4c 29 ea                    	subq	%r13, %rdx
1402ddee8: 48 89 13                    	movq	%rdx, (%rbx)
1402ddeeb: 49 c1 e5 06                 	shlq	$0x6, %r13
1402ddeef: 49 01 cd                    	addq	%rcx, %r13
1402ddef2: 48 c1 e6 06                 	shlq	$0x6, %rsi
1402ddef6: 48 01 c6                    	addq	%rax, %rsi
1402ddef9: ba 01 00 00 00              	movl	$0x1, %edx
1402ddefe: 48 89 95 a8 00 00 00        	movq	%rdx, 0xa8(%rbp)
1402ddf05: 48 85 c9                    	testq	%rcx, %rcx
1402ddf08: 75 20                       	jne	0x1402ddf2a <.text+0x2dcf2a>
1402ddf0a: eb 23                       	jmp	0x1402ddf2f <.text+0x2dcf2f>
1402ddf0c: 0f 1f 40 00                 	nopl	(%rax)
1402ddf10: 48 8d 79 40                 	leaq	0x40(%rcx), %rdi
1402ddf14: 49 89 c7                    	movq	%rax, %r15
1402ddf17: 48 89 ca                    	movq	%rcx, %rdx
1402ddf1a: 48 ff 03                    	incq	(%rbx)
1402ddf1d: 83 3a 02                    	cmpl	$0x2, (%rdx)
1402ddf20: 48 89 f9                    	movq	%rdi, %rcx
1402ddf23: 74 33                       	je	0x1402ddf58 <.text+0x2dcf58>
1402ddf25: 48 85 c9                    	testq	%rcx, %rcx
1402ddf28: 74 05                       	je	0x1402ddf2f <.text+0x2dcf2f>
1402ddf2a: 4c 39 e9                    	cmpq	%r13, %rcx
1402ddf2d: 75 e1                       	jne	0x1402ddf10 <.text+0x2dcf10>
1402ddf2f: 48 85 c0                    	testq	%rax, %rax
1402ddf32: 0f 84 bc 00 00 00           	je	0x1402ddff4 <.text+0x2dcff4>
1402ddf38: 48 39 f0                    	cmpq	%rsi, %rax
1402ddf3b: 0f 84 b3 00 00 00           	je	0x1402ddff4 <.text+0x2dcff4>
1402ddf41: 4c 8d 78 40                 	leaq	0x40(%rax), %r15
1402ddf45: 31 ff                       	xorl	%edi, %edi
1402ddf47: 48 89 c2                    	movq	%rax, %rdx
1402ddf4a: 4c 89 f8                    	movq	%r15, %rax
1402ddf4d: 48 ff 03                    	incq	(%rbx)
1402ddf50: 83 3a 02                    	cmpl	$0x2, (%rdx)
1402ddf53: 48 89 f9                    	movq	%rdi, %rcx
1402ddf56: 75 cd                       	jne	0x1402ddf25 <.text+0x2dcf25>
1402ddf58: 48 8b 42 10                 	movq	0x10(%rdx), %rax
1402ddf5c: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1402ddf63: 4c 8b 72 18                 	movq	0x18(%rdx), %r14
1402ddf67: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1402ddf6e: 4c 29 c0                    	subq	%r8, %rax
1402ddf71: 49 39 c6                    	cmpq	%rax, %r14
1402ddf74: 77 45                       	ja	0x1402ddfbb <.text+0x2dcfbb>
1402ddf76: 4d 85 f6                    	testq	%r14, %r14
1402ddf79: 74 22                       	je	0x1402ddf9d <.text+0x2dcf9d>
1402ddf7b: 4c 89 45 08                 	movq	%r8, 0x8(%rbp)
1402ddf7f: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1402ddf86: 4a 8d 0c 00                 	leaq	(%rax,%r8), %rcx
1402ddf8a: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1402ddf91: 4d 89 f0                    	movq	%r14, %r8
1402ddf94: e8 82 37 d8 05              	callq	0x14606171b <.text+0x606071b>
1402ddf99: 4c 8b 45 08                 	movq	0x8(%rbp), %r8
1402ddf9d: 4d 01 f0                    	addq	%r14, %r8
1402ddfa0: 4c 89 85 98 00 00 00        	movq	%r8, 0x98(%rbp)
1402ddfa7: 4c 89 f8                    	movq	%r15, %rax
1402ddfaa: 48 89 f9                    	movq	%rdi, %rcx
1402ddfad: 48 85 c9                    	testq	%rcx, %rcx
1402ddfb0: 0f 85 74 ff ff ff           	jne	0x1402ddf2a <.text+0x2dcf2a>
1402ddfb6: e9 74 ff ff ff              	jmp	0x1402ddf2f <.text+0x2dcf2f>
1402ddfbb: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1402ddfc4: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1402ddfca: 48 8d 8d 88 00 00 00        	leaq	0x88(%rbp), %rcx
1402ddfd1: 4c 89 c2                    	movq	%r8, %rdx
1402ddfd4: 4d 89 f0                    	movq	%r14, %r8
1402ddfd7: e8 54 3b d8 05              	callq	0x146061b30 <.text+0x6060b30>
1402ddfdc: 90                          	nop
1402ddfdd: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1402ddfe4: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1402ddfeb: 4c 8b 85 98 00 00 00        	movq	0x98(%rbp), %r8
1402ddff2: eb 87                       	jmp	0x1402ddf7b <.text+0x2dcf7b>
1402ddff4: 48 8b 95 a8 00 00 00        	movq	0xa8(%rbp), %rdx
1402ddffb: 49 01 d0                    	addq	%rdx, %r8
1402ddffe: 48 8d 4d 70                 	leaq	0x70(%rbp), %rcx
1402de002: e8 f9 cc eb ff              	callq	0x14019ad00 <.text+0x199d00>
1402de007: 90                          	nop
1402de008: 48 8b bd 80 00 00 00        	movq	0x80(%rbp), %rdi
1402de00f: 48 85 ff                    	testq	%rdi, %rdi
1402de012: 0f 84 87 01 00 00           	je	0x1402de19f <.text+0x2dd19f>
1402de018: 0f 29 75 10                 	movaps	%xmm6, 0x10(%rbp)
1402de01c: 0f 13 7d 20                 	movlps	%xmm7, 0x20(%rbp)
1402de020: 48 8d 4d 10                 	leaq	0x10(%rbp), %rcx
1402de024: e8 d7 15 fd ff              	callq	0x1402af600 <.text+0x2ae600>
1402de029: 48 89 c3                    	movq	%rax, %rbx
1402de02c: 85 db                       	testl	%ebx, %ebx
1402de02e: 0f 84 6b 01 00 00           	je	0x1402de19f <.text+0x2dd19f>
1402de034: 66 c7 45 b8 01 00           	movw	$0x1, -0x48(%rbp)
1402de03a: 48 8d 75 e8                 	leaq	-0x18(%rbp), %rsi
1402de03e: 4c 8d 6d 11                 	leaq	0x11(%rbp), %r13
1402de042: 48 8b 45 78                 	movq	0x78(%rbp), %rax
1402de046: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1402de04d: 45 31 f6                    	xorl	%r14d, %r14d
1402de050: eb 5c                       	jmp	0x1402de0ae <.text+0x2dd0ae>
1402de052: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1402de060: 49 ff c6                    	incq	%r14
1402de063: 49 8b 44 24 28              	movq	0x28(%r12), %rax
1402de068: 49 6b cf 58                 	imulq	$0x58, %r15, %rcx
1402de06c: 48 8b 55 60                 	movq	0x60(%rbp), %rdx
1402de070: 48 89 54 08 50              	movq	%rdx, 0x50(%rax,%rcx)
1402de075: 0f 10 45 50                 	movups	0x50(%rbp), %xmm0
1402de079: 0f 11 44 08 40              	movups	%xmm0, 0x40(%rax,%rcx)
1402de07e: 0f 10 45 10                 	movups	0x10(%rbp), %xmm0
1402de082: 0f 10 4d 20                 	movups	0x20(%rbp), %xmm1
1402de086: 0f 10 55 30                 	movups	0x30(%rbp), %xmm2
1402de08a: 0f 10 5d 40                 	movups	0x40(%rbp), %xmm3
1402de08e: 0f 11 5c 08 30              	movups	%xmm3, 0x30(%rax,%rcx)
1402de093: 0f 11 54 08 20              	movups	%xmm2, 0x20(%rax,%rcx)
1402de098: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1402de09d: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1402de0a1: 49 ff c7                    	incq	%r15
1402de0a4: 4d 89 7c 24 30              	movq	%r15, 0x30(%r12)
1402de0a9: 49 ff 44 24 40              	incq	0x40(%r12)
1402de0ae: 49 83 fe 02                 	cmpq	$0x2, %r14
1402de0b2: 0f 84 fc 00 00 00           	je	0x1402de1b4 <.text+0x2dd1b4>
1402de0b8: 46 8a 7c 35 b8              	movb	-0x48(%rbp,%r14), %r15b
1402de0bd: 48 8d 4d 10                 	leaq	0x10(%rbp), %rcx
1402de0c1: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1402de0c8: 49 89 f8                    	movq	%rdi, %r8
1402de0cb: e8 c0 9f eb ff              	callq	0x140198090 <.text+0x197090>
1402de0d0: 90                          	nop
1402de0d1: 48 8b 45 20                 	movq	0x20(%rbp), %rax
1402de0d5: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1402de0d9: 0f 10 45 10                 	movups	0x10(%rbp), %xmm0
1402de0dd: 0f 11 06                    	movups	%xmm0, (%rsi)
1402de0e0: c7 45 e0 00 00 00 00        	movl	$0x0, -0x20(%rbp)
1402de0e7: b0 ff                       	movb	$-0x1, %al
1402de0e9: 45 84 ff                    	testb	%r15b, %r15b
1402de0ec: 74 29                       	je	0x1402de117 <.text+0x2dd117>
1402de0ee: 48 8d 4d 10                 	leaq	0x10(%rbp), %rcx
1402de0f2: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
1402de0f9: 49 89 f8                    	movq	%rdi, %r8
1402de0fc: e8 8f 9f eb ff              	callq	0x140198090 <.text+0x197090>
1402de101: 90                          	nop
1402de102: 0f b6 45 10                 	movzbl	0x10(%rbp), %eax
1402de106: 41 0f 10 45 00              	movups	(%r13), %xmm0
1402de10b: 0f 29 45 c0                 	movaps	%xmm0, -0x40(%rbp)
1402de10f: 49 8b 4d 0f                 	movq	0xf(%r13), %rcx
1402de113: 48 89 4d cf                 	movq	%rcx, -0x31(%rbp)
1402de117: 8b 4d e0                    	movl	-0x20(%rbp), %ecx
1402de11a: 48 8b 55 e4                 	movq	-0x1c(%rbp), %rdx
1402de11e: 44 8b 45 ec                 	movl	-0x14(%rbp), %r8d
1402de122: 0f 10 45 f0                 	movups	-0x10(%rbp), %xmm0
1402de126: 41 0f 11 45 17              	movups	%xmm0, 0x17(%r13)
1402de12b: 41 89 4d 07                 	movl	%ecx, 0x7(%r13)
1402de12f: 49 89 55 0b                 	movq	%rdx, 0xb(%r13)
1402de133: 45 89 45 13                 	movl	%r8d, 0x13(%r13)
1402de137: 41 80 f7 01                 	xorb	$0x1, %r15b
1402de13b: 48 8b 4d cf                 	movq	-0x31(%rbp), %rcx
1402de13f: 49 89 4d 37                 	movq	%rcx, 0x37(%r13)
1402de143: 0f 28 45 c0                 	movaps	-0x40(%rbp), %xmm0
1402de147: 41 0f 11 45 28              	movups	%xmm0, 0x28(%r13)
1402de14c: 48 8b 4d 00                 	movq	(%rbp), %rcx
1402de150: 8b 95 a4 00 00 00           	movl	0xa4(%rbp), %edx
1402de156: 89 11                       	movl	%edx, (%rcx)
1402de158: 49 8b 4c 24 40              	movq	0x40(%r12), %rcx
1402de15d: 48 89 4d 10                 	movq	%rcx, 0x10(%rbp)
1402de161: 88 45 38                    	movb	%al, 0x38(%rbp)
1402de164: 48 89 5d 50                 	movq	%rbx, 0x50(%rbp)
1402de168: c7 45 58 00 00 00 00        	movl	$0x0, 0x58(%rbp)
1402de16f: 48 c7 45 5c 00 00 00 00     	movq	$0x0, 0x5c(%rbp)
1402de177: 44 88 7d 64                 	movb	%r15b, 0x64(%rbp)
1402de17b: c6 45 65 00                 	movb	$0x0, 0x65(%rbp)
1402de17f: 4d 8b 7c 24 30              	movq	0x30(%r12), %r15
1402de184: 4d 3b 7c 24 20              	cmpq	0x20(%r12), %r15
1402de189: 0f 85 d1 fe ff ff           	jne	0x1402de060 <.text+0x2dd060>
1402de18f: 49 8d 4c 24 20              	leaq	0x20(%r12), %rcx
1402de194: e8 07 85 d8 05              	callq	0x1460666a0 <.text+0x60656a0>
1402de199: 90                          	nop
1402de19a: e9 c1 fe ff ff              	jmp	0x1402de060 <.text+0x2dd060>
1402de19f: 48 8b 55 70                 	movq	0x70(%rbp), %rdx
1402de1a3: 48 85 d2                    	testq	%rdx, %rdx
1402de1a6: 74 27                       	je	0x1402de1cf <.text+0x2dd1cf>
1402de1a8: 48 8b 4d 78                 	movq	0x78(%rbp), %rcx
1402de1ac: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1402de1b2: eb 16                       	jmp	0x1402de1ca <.text+0x2dd1ca>
1402de1b4: 48 8b 55 70                 	movq	0x70(%rbp), %rdx
1402de1b8: 48 85 d2                    	testq	%rdx, %rdx
1402de1bb: 74 12                       	je	0x1402de1cf <.text+0x2dd1cf>
1402de1bd: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1402de1c3: 48 8b 8d b0 00 00 00        	movq	0xb0(%rbp), %rcx
1402de1ca: e8 01 40 d2 ff              	callq	0x1400021d0 <.text+0x11d0>
1402de1cf: 48 8b 95 88 00 00 00        	movq	0x88(%rbp), %rdx
1402de1d6: 48 85 d2                    	testq	%rdx, %rdx
1402de1d9: 74 33                       	je	0x1402de20e <.text+0x2dd20e>
1402de1db: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1402de1e1: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
1402de1e8: 0f 28 b5 c0 00 00 00        	movaps	0xc0(%rbp), %xmm6
1402de1ef: 0f 28 bd d0 00 00 00        	movaps	0xd0(%rbp), %xmm7
1402de1f6: 48 81 c4 68 01 00 00        	addq	$0x168, %rsp            # imm = 0x168
1402de1fd: 5b                          	popq	%rbx
1402de1fe: 5f                          	popq	%rdi
1402de1ff: 5e                          	popq	%rsi
1402de200: 41 5c                       	popq	%r12
1402de202: 41 5d                       	popq	%r13
1402de204: 41 5e                       	popq	%r14
1402de206: 41 5f                       	popq	%r15
1402de208: 5d                          	popq	%rbp
1402de209: e9 c2 3f d2 ff              	jmp	0x1400021d0 <.text+0x11d0>
1402de20e: 0f 28 b5 c0 00 00 00        	movaps	0xc0(%rbp), %xmm6
1402de215: 0f 28 bd d0 00 00 00        	movaps	0xd0(%rbp), %xmm7
1402de21c: 48 81 c4 68 01 00 00        	addq	$0x168, %rsp            # imm = 0x168
1402de223: 5b                          	popq	%rbx
1402de224: 5f                          	popq	%rdi
1402de225: 5e                          	popq	%rsi
1402de226: 41 5c                       	popq	%r12
1402de228: 41 5d                       	popq	%r13
1402de22a: 41 5e                       	popq	%r14
1402de22c: 41 5f                       	popq	%r15
1402de22e: 5d                          	popq	%rbp
1402de22f: c3                          	retq

14019ad00: 55                          	pushq	%rbp
14019ad01: 41 57                       	pushq	%r15
14019ad03: 41 56                       	pushq	%r14
14019ad05: 41 55                       	pushq	%r13
14019ad07: 41 54                       	pushq	%r12
14019ad09: 56                          	pushq	%rsi
14019ad0a: 57                          	pushq	%rdi
14019ad0b: 53                          	pushq	%rbx
14019ad0c: 48 83 ec 48                 	subq	$0x48, %rsp
14019ad10: 48 8d 6c 24 40              	leaq	0x40(%rsp), %rbp
14019ad15: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
14019ad1d: 48 89 ce                    	movq	%rcx, %rsi
14019ad20: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
14019ad28: 48 c7 45 f0 01 00 00 00     	movq	$0x1, -0x10(%rbp)
14019ad30: 48 c7 45 f8 00 00 00 00     	movq	$0x0, -0x8(%rbp)
14019ad38: 4c 39 c2                    	cmpq	%r8, %rdx
14019ad3b: 0f 84 00 02 00 00           	je	0x14019af41 <.text+0x199f41>
14019ad41: 4c 89 c7                    	movq	%r8, %rdi
14019ad44: 48 89 d3                    	movq	%rdx, %rbx
14019ad47: b8 01 00 00 00              	movl	$0x1, %eax
14019ad4c: 45 31 f6                    	xorl	%r14d, %r14d
14019ad4f: 4c 8d 7d e8                 	leaq	-0x18(%rbp), %r15
14019ad53: 41 bc 02 00 00 00           	movl	$0x2, %r12d
14019ad59: eb 21                       	jmp	0x14019ad7c <.text+0x199d7c>
14019ad5b: 80 ca c0                    	orb	$-0x40, %dl
14019ad5e: 42 88 14 30                 	movb	%dl, (%rax,%r14)
14019ad62: 42 88 4c 30 01              	movb	%cl, 0x1(%rax,%r14)
14019ad67: b9 02 00 00 00              	movl	$0x2, %ecx
14019ad6c: 49 01 ce                    	addq	%rcx, %r14
14019ad6f: 4c 89 75 f8                 	movq	%r14, -0x8(%rbp)
14019ad73: 48 39 fb                    	cmpq	%rdi, %rbx
14019ad76: 0f 84 c5 01 00 00           	je	0x14019af41 <.text+0x199f41>
14019ad7c: 0f b6 13                    	movzbl	(%rbx), %edx
14019ad7f: 44 0f b6 ea                 	movzbl	%dl, %r13d
14019ad83: 45 84 ed                    	testb	%r13b, %r13b
14019ad86: 78 08                       	js	0x14019ad90 <.text+0x199d90>
14019ad88: 48 ff c3                    	incq	%rbx
14019ad8b: eb 73                       	jmp	0x14019ae00 <.text+0x199e00>
14019ad8d: 0f 1f 00                    	nopl	(%rax)
14019ad90: 44 89 e9                    	movl	%r13d, %ecx
14019ad93: 83 e1 1f                    	andl	$0x1f, %ecx
14019ad96: 44 0f b6 43 01              	movzbl	0x1(%rbx), %r8d
14019ad9b: 41 83 e0 3f                 	andl	$0x3f, %r8d
14019ad9f: 41 80 fd df                 	cmpb	$-0x21, %r13b
14019ada3: 76 34                       	jbe	0x14019add9 <.text+0x199dd9>
14019ada5: 44 0f b6 6b 02              	movzbl	0x2(%rbx), %r13d
14019adaa: 41 c1 e0 06                 	shll	$0x6, %r8d
14019adae: 41 83 e5 3f                 	andl	$0x3f, %r13d
14019adb2: 45 09 c5                    	orl	%r8d, %r13d
14019adb5: 80 fa f0                    	cmpb	$-0x10, %dl
14019adb8: 72 2e                       	jb	0x14019ade8 <.text+0x199de8>
14019adba: 0f b6 53 03                 	movzbl	0x3(%rbx), %edx
14019adbe: 48 83 c3 04                 	addq	$0x4, %rbx
14019adc2: 83 e1 07                    	andl	$0x7, %ecx
14019adc5: c1 e1 12                    	shll	$0x12, %ecx
14019adc8: 41 c1 e5 06                 	shll	$0x6, %r13d
14019adcc: 83 e2 3f                    	andl	$0x3f, %edx
14019adcf: 44 09 ea                    	orl	%r13d, %edx
14019add2: 09 ca                       	orl	%ecx, %edx
14019add4: 41 89 d5                    	movl	%edx, %r13d
14019add7: eb 27                       	jmp	0x14019ae00 <.text+0x199e00>
14019add9: 48 83 c3 02                 	addq	$0x2, %rbx
14019addd: c1 e1 06                    	shll	$0x6, %ecx
14019ade0: 44 09 c1                    	orl	%r8d, %ecx
14019ade3: 41 89 cd                    	movl	%ecx, %r13d
14019ade6: eb 18                       	jmp	0x14019ae00 <.text+0x199e00>
14019ade8: 48 83 c3 03                 	addq	$0x3, %rbx
14019adec: c1 e1 0c                    	shll	$0xc, %ecx
14019adef: 41 09 cd                    	orl	%ecx, %r13d
14019adf2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14019ae00: 41 83 fd 20                 	cmpl	$0x20, %r13d
14019ae04: 0f 92 c1                    	setb	%cl
14019ae07: 41 8d 95 60 ff ff ff        	leal	-0xa0(%r13), %edx
14019ae0e: 83 fa df                    	cmpl	$-0x21, %edx
14019ae11: 0f 93 c2                    	setae	%dl
14019ae14: 08 ca                       	orb	%cl, %dl
14019ae16: 0f 85 57 ff ff ff           	jne	0x14019ad73 <.text+0x199d73>
14019ae1c: 41 81 fd 80 00 00 00        	cmpl	$0x80, %r13d
14019ae23: 73 2b                       	jae	0x14019ae50 <.text+0x199e50>
14019ae25: 4c 39 75 e8                 	cmpq	%r14, -0x18(%rbp)
14019ae29: 0f 84 c8 00 00 00           	je	0x14019aef7 <.text+0x199ef7>
14019ae2f: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
14019ae33: 46 88 2c 30                 	movb	%r13b, (%rax,%r14)
14019ae37: b9 01 00 00 00              	movl	$0x1, %ecx
14019ae3c: e9 2b ff ff ff              	jmp	0x14019ad6c <.text+0x199d6c>
14019ae41: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
14019ae50: 41 81 fd 00 00 01 00        	cmpl	$0x10000, %r13d         # imm = 0x10000
14019ae57: 41 b8 04 00 00 00           	movl	$0x4, %r8d
14019ae5d: 49 83 d8 00                 	sbbq	$0x0, %r8
14019ae61: 41 81 fd 00 08 00 00        	cmpl	$0x800, %r13d           # imm = 0x800
14019ae68: 4d 0f 42 c4                 	cmovbq	%r12, %r8
14019ae6c: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
14019ae70: 4c 29 f1                    	subq	%r14, %rcx
14019ae73: 49 39 c8                    	cmpq	%rcx, %r8
14019ae76: 0f 87 a1 00 00 00           	ja	0x14019af1d <.text+0x199f1d>
14019ae7c: 44 89 e9                    	movl	%r13d, %ecx
14019ae7f: 80 e1 3f                    	andb	$0x3f, %cl
14019ae82: 80 c9 80                    	orb	$-0x80, %cl
14019ae85: 44 89 ea                    	movl	%r13d, %edx
14019ae88: c1 ea 06                    	shrl	$0x6, %edx
14019ae8b: 41 81 fd 00 08 00 00        	cmpl	$0x800, %r13d           # imm = 0x800
14019ae92: 0f 82 c3 fe ff ff           	jb	0x14019ad5b <.text+0x199d5b>
14019ae98: 80 e2 3f                    	andb	$0x3f, %dl
14019ae9b: 80 ca 80                    	orb	$-0x80, %dl
14019ae9e: 45 89 e8                    	movl	%r13d, %r8d
14019aea1: 41 c1 e8 0c                 	shrl	$0xc, %r8d
14019aea5: 41 81 fd ff ff 00 00        	cmpl	$0xffff, %r13d          # imm = 0xFFFF
14019aeac: 77 1c                       	ja	0x14019aeca <.text+0x199eca>
14019aeae: 41 80 c8 e0                 	orb	$-0x20, %r8b
14019aeb2: 46 88 04 30                 	movb	%r8b, (%rax,%r14)
14019aeb6: 42 88 54 30 01              	movb	%dl, 0x1(%rax,%r14)
14019aebb: 42 88 4c 30 02              	movb	%cl, 0x2(%rax,%r14)
14019aec0: b9 03 00 00 00              	movl	$0x3, %ecx
14019aec5: e9 a2 fe ff ff              	jmp	0x14019ad6c <.text+0x199d6c>
14019aeca: 41 80 e0 3f                 	andb	$0x3f, %r8b
14019aece: 41 80 c8 80                 	orb	$-0x80, %r8b
14019aed2: 41 c1 ed 12                 	shrl	$0x12, %r13d
14019aed6: 41 80 cd f0                 	orb	$-0x10, %r13b
14019aeda: 46 88 2c 30                 	movb	%r13b, (%rax,%r14)
14019aede: 46 88 44 30 01              	movb	%r8b, 0x1(%rax,%r14)
14019aee3: 42 88 54 30 02              	movb	%dl, 0x2(%rax,%r14)
14019aee8: 42 88 4c 30 03              	movb	%cl, 0x3(%rax,%r14)
14019aeed: b9 04 00 00 00              	movl	$0x4, %ecx
14019aef2: e9 75 fe ff ff              	jmp	0x14019ad6c <.text+0x199d6c>
14019aef7: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
14019af00: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14019af06: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14019af0c: 4c 89 f9                    	movq	%r15, %rcx
14019af0f: 4c 89 f2                    	movq	%r14, %rdx
14019af12: e8 19 6c ec 05              	callq	0x146061b30 <.text+0x6060b30>
14019af17: 90                          	nop
14019af18: e9 12 ff ff ff              	jmp	0x14019ae2f <.text+0x199e2f>
14019af1d: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
14019af26: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14019af2c: 4c 89 f9                    	movq	%r15, %rcx
14019af2f: 4c 89 f2                    	movq	%r14, %rdx
14019af32: e8 f9 6b ec 05              	callq	0x146061b30 <.text+0x6060b30>
14019af37: 90                          	nop
14019af38: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
14019af3c: e9 3b ff ff ff              	jmp	0x14019ae7c <.text+0x199e7c>
14019af41: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
14019af45: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14019af49: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
14019af4d: 48 89 06                    	movq	%rax, (%rsi)
14019af50: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
14019af54: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
14019af58: 48 89 f0                    	movq	%rsi, %rax
14019af5b: 48 83 c4 48                 	addq	$0x48, %rsp
14019af5f: 5b                          	popq	%rbx
14019af60: 5f                          	popq	%rdi
14019af61: 5e                          	popq	%rsi
14019af62: 41 5c                       	popq	%r12
14019af64: 41 5d                       	popq	%r13
14019af66: 41 5e                       	popq	%r14
14019af68: 41 5f                       	popq	%r15
14019af6a: 5d                          	popq	%rbp
14019af6b: c3                          	retq

140198090: 41 57                       	pushq	%r15
140198092: 41 56                       	pushq	%r14
140198094: 41 54                       	pushq	%r12
140198096: 56                          	pushq	%rsi
140198097: 57                          	pushq	%rdi
140198098: 53                          	pushq	%rbx
140198099: 48 83 ec 48                 	subq	$0x48, %rsp
14019809d: 4c 89 c7                    	movq	%r8, %rdi
1401980a0: 48 89 ce                    	movq	%rcx, %rsi
1401980a3: 49 83 f8 18                 	cmpq	$0x18, %r8
1401980a7: 73 57                       	jae	0x140198100 <.text+0x197100>
1401980a9: 0f 57 c0                    	xorps	%xmm0, %xmm0
1401980ac: 0f 29 44 24 30              	movaps	%xmm0, 0x30(%rsp)
1401980b1: 48 c7 44 24 3f 00 00 00 00  	movq	$0x0, 0x3f(%rsp)
1401980ba: 48 8d 4c 24 30              	leaq	0x30(%rsp), %rcx
1401980bf: 49 89 f8                    	movq	%rdi, %r8
1401980c2: e8 54 96 ec 05              	callq	0x14606171b <.text+0x606071b>
1401980c7: 89 f9                       	movl	%edi, %ecx
1401980c9: 8b 44 24 30                 	movl	0x30(%rsp), %eax
1401980cd: 8b 54 24 33                 	movl	0x33(%rsp), %edx
1401980d1: 89 44 24 28                 	movl	%eax, 0x28(%rsp)
1401980d5: 89 54 24 2b                 	movl	%edx, 0x2b(%rsp)
1401980d9: 48 8b 44 24 37              	movq	0x37(%rsp), %rax
1401980de: 48 8b 7c 24 3f              	movq	0x3f(%rsp), %rdi
1401980e3: 88 0e                       	movb	%cl, (%rsi)
1401980e5: 8b 4c 24 28                 	movl	0x28(%rsp), %ecx
1401980e9: 8b 54 24 2b                 	movl	0x2b(%rsp), %edx
1401980ed: 89 4e 01                    	movl	%ecx, 0x1(%rsi)
1401980f0: 89 56 04                    	movl	%edx, 0x4(%rsi)
1401980f3: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
1401980f7: 48 89 7e 10                 	movq	%rdi, 0x10(%rsi)
1401980fb: e9 bf 00 00 00              	jmp	0x1401981bf <.text+0x1971bf>
140198100: 48 81 ff a1 00 00 00        	cmpq	$0xa1, %rdi
140198107: 73 5a                       	jae	0x140198163 <.text+0x197163>
140198109: 48 83 ff 20                 	cmpq	$0x20, %rdi
14019810d: b8 20 00 00 00              	movl	$0x20, %eax
140198112: 48 0f 42 c7                 	cmovbq	%rdi, %rax
140198116: 31 c9                       	xorl	%ecx, %ecx
140198118: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
140198120: 80 3c 0a 0a                 	cmpb	$0xa, (%rdx,%rcx)
140198124: 75 0b                       	jne	0x140198131 <.text+0x197131>
140198126: 48 ff c1                    	incq	%rcx
140198129: 48 39 c8                    	cmpq	%rcx, %rax
14019812c: 75 f2                       	jne	0x140198120 <.text+0x197120>
14019812e: 48 89 c1                    	movq	%rax, %rcx
140198131: 49 89 f9                    	movq	%rdi, %r9
140198134: 49 29 c9                    	subq	%rcx, %r9
140198137: 49 81 f9 80 00 00 00        	cmpq	$0x80, %r9
14019813e: 77 23                       	ja	0x140198163 <.text+0x197163>
140198140: 48 39 cf                    	cmpq	%rcx, %rdi
140198143: 0f 82 bf 00 00 00           	jb	0x140198208 <.text+0x197208>
140198149: 48 89 c8                    	movq	%rcx, %rax
14019814c: 0f 1f 40 00                 	nopl	(%rax)
140198150: 48 39 c7                    	cmpq	%rax, %rdi
140198153: 0f 84 8c 00 00 00           	je	0x1401981e5 <.text+0x1971e5>
140198159: 80 3c 02 20                 	cmpb	$0x20, (%rdx,%rax)
14019815d: 48 8d 40 01                 	leaq	0x1(%rax), %rax
140198161: 74 ed                       	je	0x140198150 <.text+0x197150>
140198163: 49 89 d4                    	movq	%rdx, %r12
140198166: b9 01 00 00 00              	movl	$0x1, %ecx
14019816b: 48 89 fa                    	movq	%rdi, %rdx
14019816e: e8 dd c1 e9 05              	callq	0x146034350 <.text+0x6033350>
140198173: 49 89 c6                    	movq	%rax, %r14
140198176: 48 89 d3                    	movq	%rdx, %rbx
140198179: 48 85 d2                    	testq	%rdx, %rdx
14019817c: 74 52                       	je	0x1401981d0 <.text+0x1971d0>
14019817e: e8 7d a0 e6 ff              	callq	0x140002200 <.text+0x1200>
140198183: 48 89 d9                    	movq	%rbx, %rcx
140198186: 4c 89 f2                    	movq	%r14, %rdx
140198189: e8 32 a0 e6 ff              	callq	0x1400021c0 <.text+0x11c0>
14019818e: 49 89 c7                    	movq	%rax, %r15
140198191: 4d 85 ff                    	testq	%r15, %r15
140198194: 74 42                       	je	0x1401981d8 <.text+0x1971d8>
140198196: 4c 89 e2                    	movq	%r12, %rdx
140198199: 49 c7 07 01 00 00 00        	movq	$0x1, (%r15)
1401981a0: 49 c7 47 08 01 00 00 00     	movq	$0x1, 0x8(%r15)
1401981a8: 49 8d 4f 10                 	leaq	0x10(%r15), %rcx
1401981ac: 49 89 f8                    	movq	%rdi, %r8
1401981af: e8 67 95 ec 05              	callq	0x14606171b <.text+0x606071b>
1401981b4: 4c 89 7e 08                 	movq	%r15, 0x8(%rsi)
1401981b8: 48 89 7e 10                 	movq	%rdi, 0x10(%rsi)
1401981bc: c6 06 19                    	movb	$0x19, (%rsi)
1401981bf: 48 89 f0                    	movq	%rsi, %rax
1401981c2: 48 83 c4 48                 	addq	$0x48, %rsp
1401981c6: 5b                          	popq	%rbx
1401981c7: 5f                          	popq	%rdi
1401981c8: 5e                          	popq	%rsi
1401981c9: 41 5c                       	popq	%r12
1401981cb: 41 5e                       	popq	%r14
1401981cd: 41 5f                       	popq	%r15
1401981cf: c3                          	retq
1401981d0: 4d 89 f7                    	movq	%r14, %r15
1401981d3: 4d 85 ff                    	testq	%r15, %r15
1401981d6: 75 be                       	jne	0x140198196 <.text+0x197196>
1401981d8: 4c 89 f1                    	movq	%r14, %rcx
1401981db: 48 89 da                    	movq	%rbx, %rdx
1401981de: e8 6e 07 07 06              	callq	0x146208951 <.text+0x6207951>
1401981e3: 0f 0b                       	ud2
1401981e5: 41 b8 20 00 00 00           	movl	$0x20, %r8d
1401981eb: 49 29 c8                    	subq	%rcx, %r8
1401981ee: 49 83 c1 20                 	addq	$0x20, %r9
1401981f2: 4d 39 c8                    	cmpq	%r9, %r8
1401981f5: 77 25                       	ja	0x14019821c <.text+0x19721c>
1401981f7: 48 8d 05 a1 12 0c 06        	leaq	0x60c12a1(%rip), %rax   # 0x14625949f
1401981fe: 4c 01 c0                    	addq	%r8, %rax
140198201: b1 18                       	movb	$0x18, %cl
140198203: e9 db fe ff ff              	jmp	0x1401980e3 <.text+0x1970e3>
140198208: 4c 8d 0d a9 13 0c 06        	leaq	0x60c13a9(%rip), %r9    # 0x1462595b8
14019820f: 48 89 fa                    	movq	%rdi, %rdx
140198212: 49 89 f8                    	movq	%rdi, %r8
140198215: e8 f6 0c 07 06              	callq	0x146208f10 <.text+0x6207f10>
14019821a: 0f 0b                       	ud2
14019821c: 48 8d 05 7d 13 0c 06        	leaq	0x60c137d(%rip), %rax   # 0x1462595a0
140198223: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
140198228: 48 8d 0d 70 12 0c 06        	leaq	0x60c1270(%rip), %rcx   # 0x14625949f
14019822f: ba a0 00 00 00              	movl	$0xa0, %edx
140198234: e8 47 09 07 06              	callq	0x146208b80 <.text+0x6207b80>
140198239: 0f 0b                       	ud2

1402dd560: 41 57                       	pushq	%r15
1402dd562: 41 56                       	pushq	%r14
1402dd564: 56                          	pushq	%rsi
1402dd565: 57                          	pushq	%rdi
1402dd566: 55                          	pushq	%rbp
1402dd567: 53                          	pushq	%rbx
1402dd568: 48 81 ec 98 00 00 00        	subq	$0x98, %rsp
1402dd56f: 48 8b 3a                    	movq	(%rdx), %rdi
1402dd572: 48 8b 5f 18                 	movq	0x18(%rdi), %rbx
1402dd576: 48 8b 47 10                 	movq	0x10(%rdi), %rax
1402dd57a: 48 01 d8                    	addq	%rbx, %rax
1402dd57d: 48 03 47 30                 	addq	0x30(%rdi), %rax
1402dd581: 48 39 c3                    	cmpq	%rax, %rbx
1402dd584: 0f 87 99 01 00 00           	ja	0x1402dd723 <.text+0x2dc723>
1402dd58a: 49 8b 08                    	movq	(%r8), %rcx
1402dd58d: 48 8b 09                    	movq	(%rcx), %rcx
1402dd590: 48 39 c1                    	cmpq	%rax, %rcx
1402dd593: 49 89 c6                    	movq	%rax, %r14
1402dd596: 4c 0f 42 f1                 	cmovbq	%rcx, %r14
1402dd59a: 48 39 d9                    	cmpq	%rbx, %rcx
1402dd59d: 4c 0f 42 f3                 	cmovbq	%rbx, %r14
1402dd5a1: 49 39 c6                    	cmpq	%rax, %r14
1402dd5a4: 0f 83 69 01 00 00           	jae	0x1402dd713 <.text+0x2dc713>
1402dd5aa: 4c 8b 7a 10                 	movq	0x10(%rdx), %r15
1402dd5ae: 8b 6a 1c                    	movl	0x1c(%rdx), %ebp
1402dd5b1: 49 6b ce 58                 	imulq	$0x58, %r14, %rcx
1402dd5b5: 48 83 c1 08                 	addq	$0x8, %rcx
1402dd5b9: 31 d2                       	xorl	%edx, %edx
1402dd5bb: 4d 89 f0                    	movq	%r14, %r8
1402dd5be: eb 10                       	jmp	0x1402dd5d0 <.text+0x2dc5d0>
1402dd5c0: 49 ff c0                    	incq	%r8
1402dd5c3: 48 83 c1 58                 	addq	$0x58, %rcx
1402dd5c7: 4c 39 c0                    	cmpq	%r8, %rax
1402dd5ca: 0f 84 43 01 00 00           	je	0x1402dd713 <.text+0x2dc713>
1402dd5d0: 49 39 d8                    	cmpq	%rbx, %r8
1402dd5d3: 72 eb                       	jb	0x1402dd5c0 <.text+0x2dc5c0>
1402dd5d5: 45 31 c9                    	xorl	%r9d, %r9d
1402dd5d8: 4c 3b 47 38                 	cmpq	0x38(%rdi), %r8
1402dd5dc: 41 0f 93 c1                 	setae	%r9b
1402dd5e0: 41 c1 e1 05                 	shll	$0x5, %r9d
1402dd5e4: 4e 8b 54 0f 18              	movq	0x18(%rdi,%r9), %r10
1402dd5e9: 4d 89 c3                    	movq	%r8, %r11
1402dd5ec: 4d 29 d3                    	subq	%r10, %r11
1402dd5ef: 4c 0f 42 da                 	cmovbq	%rdx, %r11
1402dd5f3: 4e 3b 5c 0f 10              	cmpq	0x10(%rdi,%r9), %r11
1402dd5f8: 73 c6                       	jae	0x1402dd5c0 <.text+0x2dc5c0>
1402dd5fa: 4d 39 c2                    	cmpq	%r8, %r10
1402dd5fd: 4d 0f 43 d0                 	cmovaeq	%r8, %r10
1402dd601: 4d 6b d2 a8                 	imulq	$-0x58, %r10, %r10
1402dd605: 4e 03 54 0f 08              	addq	0x8(%rdi,%r9), %r10
1402dd60a: 42 83 3c 11 4f              	cmpl	$0x4f, (%rcx,%r10)
1402dd60f: 75 af                       	jne	0x1402dd5c0 <.text+0x2dc5c0>

1402ddb1d: 4d 85 c0                    	testq	%r8, %r8
1402ddb20: 0f 84 ec 01 00 00           	je	0x1402ddd12 <.text+0x2dcd12>
1402ddb26: 49 8d 80 c8 00 00 00        	leaq	0xc8(%r8), %rax
1402ddb2d: 41 80 b8 b8 00 00 00 00     	cmpb	$0x0, 0xb8(%r8)
1402ddb35: 49 8d 90 bc 00 00 00        	leaq	0xbc(%r8), %rdx
1402ddb3c: 48 0f 45 c2                 	cmovneq	%rdx, %rax
1402ddb40: f3 41 0f 7e 80 c0 00 00 00  	movq	0xc0(%r8), %xmm0
1402ddb49: 66 0f ef c9                 	pxor	%xmm1, %xmm1
1402ddb4d: 66 0f 62 c1                 	punpckldq	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
1402ddb51: 66 0f 6f 0d c7 25 f8 05     	movdqa	0x5f825c7(%rip), %xmm1  # 0x146260120
1402ddb59: 66 0f eb c1                 	por	%xmm1, %xmm0
1402ddb5d: 66 0f 5c c1                 	subpd	%xmm1, %xmm0
1402ddb61: 66 0f 5a c0                 	cvtpd2ps	%xmm0, %xmm0
1402ddb65: f3 0f 10 08                 	movss	(%rax), %xmm1
1402ddb69: f3 0f 12 c9                 	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1402ddb6d: 0f 5e c1                    	divps	%xmm1, %xmm0
1402ddb70: 0f 59 05 59 9c f9 05        	mulps	0x5f99c59(%rip), %xmm0  # 0x1462777d0
1402ddb77: 41 0f b6 c4                 	movzbl	%r12b, %eax
1402ddb7b: 66 0f 6e c8                 	movd	%eax, %xmm1
1402ddb7f: 66 0f 70 c9 00              	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1402ddb84: 66 0f 72 f1 1f              	pslld	$0x1f, %xmm1
1402ddb89: 66 0f 72 e1 1f              	psrad	$0x1f, %xmm1
1402ddb8e: 66 44 0f db d1              	pand	%xmm1, %xmm10
1402ddb93: 66 0f df c8                 	pandn	%xmm0, %xmm1
1402ddb97: 66 41 0f eb ca              	por	%xmm10, %xmm1
1402ddb9c: 0f b6 c3                    	movzbl	%bl, %eax
1402ddb9f: 66 0f 6e c0                 	movd	%eax, %xmm0
1402ddba3: 66 0f 70 c0 00              	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1402ddba8: 66 0f 72 f0 1f              	pslld	$0x1f, %xmm0
1402ddbad: 66 0f 72 e0 1f              	psrad	$0x1f, %xmm0
1402ddbb2: 66 0f db c1                 	pand	%xmm1, %xmm0
1402ddbb6: 41 80 ff 02                 	cmpb	$0x2, %r15b
1402ddbba: 74 22                       	je	0x1402ddbde <.text+0x2dcbde>
1402ddbbc: 41 30 df                    	xorb	%bl, %r15b
1402ddbbf: 41 f6 c7 01                 	testb	$0x1, %r15b
1402ddbc3: 75 19                       	jne	0x1402ddbde <.text+0x2dcbde>
1402ddbc5: 44 0f 2e c8                 	ucomiss	%xmm0, %xmm9
1402ddbc9: 75 13                       	jne	0x1402ddbde <.text+0x2dcbde>
1402ddbcb: 7a 11                       	jp	0x1402ddbde <.text+0x2dcbde>
1402ddbcd: 66 0f 70 d0 f5              	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
1402ddbd2: 44 0f 2e c2                 	ucomiss	%xmm2, %xmm8
1402ddbd6: 75 06                       	jne	0x1402ddbde <.text+0x2dcbde>
1402ddbd8: 0f 8b 34 01 00 00           	jnp	0x1402ddd12 <.text+0x2dcd12>
1402ddbde: 41 3a 98 e1 00 00 00        	cmpb	0xe1(%r8), %bl
1402ddbe5: 74 0a                       	je	0x1402ddbf1 <.text+0x2dcbf1>
1402ddbe7: 44 89 31                    	movl	%r14d, (%rcx)
1402ddbea: 41 88 98 e1 00 00 00        	movb	%bl, 0xe1(%r8)
1402ddbf1: 84 db                       	testb	%bl, %bl
1402ddbf3: 74 30                       	je	0x1402ddc25 <.text+0x2dcc25>
1402ddbf5: f3 41 0f 10 90 b0 00 00 00  	movss	0xb0(%r8), %xmm2
1402ddbfe: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
1402ddc01: 75 16                       	jne	0x1402ddc19 <.text+0x2dcc19>
1402ddc03: 7a 14                       	jp	0x1402ddc19 <.text+0x2dcc19>
1402ddc05: f3 41 0f 10 90 b4 00 00 00  	movss	0xb4(%r8), %xmm2
1402ddc0e: f3 0f 16 d9                 	movshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
1402ddc12: 0f 2e d3                    	ucomiss	%xmm3, %xmm2
1402ddc15: 75 02                       	jne	0x1402ddc19 <.text+0x2dcc19>
1402ddc17: 7b 0c                       	jnp	0x1402ddc25 <.text+0x2dcc25>
1402ddc19: 44 89 31                    	movl	%r14d, (%rcx)
1402ddc1c: 66 41 0f 13 88 b0 00 00 00  	movlpd	%xmm1, 0xb0(%r8)

1402dda94: 45 39 d3                    	cmpl	%r10d, %r11d
1402dda97: 0f 85 75 02 00 00           	jne	0x1402ddd12 <.text+0x2dcd12>
1402dda9d: 4c 8b 8e 08 01 00 00        	movq	0x108(%rsi), %r9
1402ddaa4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1402ddab0: 48 39 c2                    	cmpq	%rax, %rdx
1402ddab3: 74 68                       	je	0x1402ddb1d <.text+0x2dcb1d>
1402ddab5: 44 8b 12                    	movl	(%rdx), %r10d
1402ddab8: 48 83 c2 04                 	addq	$0x4, %rdx
1402ddabc: 4f 8d 14 92                 	leaq	(%r10,%r10,4), %r10
1402ddac0: 49 c1 e2 05                 	shlq	$0x5, %r10
1402ddac4: 4b 83 7c 11 58 00           	cmpq	$0x0, 0x58(%r9,%r10)
1402ddaca: 74 e4                       	je	0x1402ddab0 <.text+0x2dcab0>
1402ddacc: e9 41 02 00 00              	jmp	0x1402ddd12 <.text+0x2dcd12>
1402ddad1: 45 31 d2                    	xorl	%r10d, %r10d
1402ddad4: 48 89 c2                    	movq	%rax, %rdx
1402ddad7: 45 31 db                    	xorl	%r11d, %r11d
1402ddada: 45 31 c0                    	xorl	%r8d, %r8d
1402ddadd: 45 84 c9                    	testb	%r9b, %r9b
1402ddae0: 74 b2                       	je	0x1402dda94 <.text+0x2dca94>
1402ddae2: 45 39 d3                    	cmpl	%r10d, %r11d
1402ddae5: 0f 85 27 02 00 00           	jne	0x1402ddd12 <.text+0x2dcd12>
1402ddaeb: 4c 8b 8e a8 01 00 00        	movq	0x1a8(%rsi), %r9
1402ddaf2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1402ddb00: 48 39 c2                    	cmpq	%rax, %rdx
1402ddb03: 74 18                       	je	0x1402ddb1d <.text+0x2dcb1d>
1402ddb05: 44 8b 12                    	movl	(%rdx), %r10d
1402ddb08: 48 83 c2 04                 	addq	$0x4, %rdx
1402ddb0c: 4f 8d 14 d2                 	leaq	(%r10,%r10,8), %r10
1402ddb10: 4b 83 7c d1 10 00           	cmpq	$0x0, 0x10(%r9,%r10,8)
1402ddb16: 74 e8                       	je	0x1402ddb00 <.text+0x2dcb00>
1402ddb18: e9 f5 01 00 00              	jmp	0x1402ddd12 <.text+0x2dcd12>
1402ddb1d: 4d 85 c0                    	testq	%r8, %r8
1402ddb20: 0f 84 ec 01 00 00           	je	0x1402ddd12 <.text+0x2dcd12>

1402b806a: e8 91 a1 d4 ff              	callq	0x140002200 <.text+0x1200>
1402b806f: b9 e0 00 00 00              	movl	$0xe0, %ecx
1402b8074: ba 08 00 00 00              	movl	$0x8, %edx
1402b8079: e8 42 a1 d4 ff              	callq	0x1400021c0 <.text+0x11c0>
1402b807e: 48 85 c0                    	testq	%rax, %rax
1402b8081: 0f 84 fa 02 00 00           	je	0x1402b8381 <.text+0x2b7381>
1402b8087: 48 89 45 a8                 	movq	%rax, -0x58(%rbp)
1402b808b: e8 70 a1 d4 ff              	callq	0x140002200 <.text+0x1200>
1402b8090: b9 28 00 00 00              	movl	$0x28, %ecx
1402b8095: ba 08 00 00 00              	movl	$0x8, %edx
1402b809a: e8 21 a1 d4 ff              	callq	0x1400021c0 <.text+0x11c0>
1402b809f: 48 85 c0                    	testq	%rax, %rax
1402b80a2: 0f 84 ea 02 00 00           	je	0x1402b8392 <.text+0x2b7392>
1402b80a8: 48 c7 00 00 00 00 00        	movq	$0x0, (%rax)
1402b80af: c7 40 20 00 00 00 00        	movl	$0x0, 0x20(%rax)
1402b80b6: c6 40 24 00                 	movb	$0x0, 0x24(%rax)
1402b80ba: 4c 8d 05 1f 15 fc 05        	leaq	0x5fc151f(%rip), %r8    # 0x1462795e0
1402b80c1: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1402b80c5: 48 89 c2                    	movq	%rax, %rdx
1402b80c8: e8 c3 da d8 04              	callq	0x145045b90 <.text+0x5044b90>
1402b80cd: 90                          	nop
1402b80ce: e8 2d a1 d4 ff              	callq	0x140002200 <.text+0x1200>
1402b80d3: b9 40 01 00 00              	movl	$0x140, %ecx            # imm = 0x140
1402b80d8: ba 08 00 00 00              	movl	$0x8, %edx
1402b80dd: e8 de a0 d4 ff              	callq	0x1400021c0 <.text+0x11c0>
1402b80e2: 48 85 c0                    	testq	%rax, %rax
1402b80e5: 0f 84 b9 02 00 00           	je	0x1402b83a4 <.text+0x2b73a4>
1402b80eb: c7 00 00 00 00 00           	movl	$0x0, (%rax)
1402b80f1: c6 40 04 00                 	movb	$0x0, 0x4(%rax)
1402b80f5: 48 c7 80 18 01 00 00 ff ff ff ff    	movq	$-0x1, 0x118(%rax)
1402b8100: 4c 8d 05 29 16 fc 05        	leaq	0x5fc1629(%rip), %r8    # 0x146279730
1402b8107: 48 8d 4d 20                 	leaq	0x20(%rbp), %rcx
1402b810b: 48 89 c2                    	movq	%rax, %rdx
1402b810e: e8 7d da d8 04              	callq	0x145045b90 <.text+0x5044b90>
1402b8113: 90                          	nop
1402b8114: 0f 10 45 10                 	movups	0x10(%rbp), %xmm0
1402b8118: 48 8b 45 a8                 	movq	-0x58(%rbp), %rax
1402b811c: 0f 11 40 60                 	movups	%xmm0, 0x60(%rax)
1402b8120: 0f 10 45 00                 	movups	(%rbp), %xmm0
1402b8124: 0f 11 40 50                 	movups	%xmm0, 0x50(%rax)
1402b8128: 0f 10 45 f0                 	movups	-0x10(%rbp), %xmm0
1402b812c: 0f 11 40 40                 	movups	%xmm0, 0x40(%rax)
1402b8130: 0f 10 45 b0                 	movups	-0x50(%rbp), %xmm0
1402b8134: 0f 10 4d c0                 	movups	-0x40(%rbp), %xmm1
1402b8138: 0f 10 55 d0                 	movups	-0x30(%rbp), %xmm2
1402b813c: 0f 10 5d e0                 	movups	-0x20(%rbp), %xmm3
1402b8140: 0f 11 58 30                 	movups	%xmm3, 0x30(%rax)
1402b8144: 0f 11 50 20                 	movups	%xmm2, 0x20(%rax)
1402b8148: 0f 11 48 10                 	movups	%xmm1, 0x10(%rax)
1402b814c: 0f 11 00                    	movups	%xmm0, (%rax)
1402b814f: 0f 10 45 20                 	movups	0x20(%rbp), %xmm0
1402b8153: 0f 10 4d 30                 	movups	0x30(%rbp), %xmm1
1402b8157: 0f 10 55 40                 	movups	0x40(%rbp), %xmm2
1402b815b: 0f 10 5d 50                 	movups	0x50(%rbp), %xmm3
1402b815f: 0f 11 40 70                 	movups	%xmm0, 0x70(%rax)
1402b8163: 0f 11 88 80 00 00 00        	movups	%xmm1, 0x80(%rax)
1402b816a: 0f 11 90 90 00 00 00        	movups	%xmm2, 0x90(%rax)
1402b8171: 0f 11 98 a0 00 00 00        	movups	%xmm3, 0xa0(%rax)
1402b8178: 0f 10 45 60                 	movups	0x60(%rbp), %xmm0
1402b817c: 0f 11 80 b0 00 00 00        	movups	%xmm0, 0xb0(%rax)
1402b8183: 0f 10 45 70                 	movups	0x70(%rbp), %xmm0
1402b8187: 0f 11 80 c0 00 00 00        	movups	%xmm0, 0xc0(%rax)
1402b818e: 0f 10 85 80 00 00 00        	movups	0x80(%rbp), %xmm0
1402b8195: 0f 11 80 d0 00 00 00        	movups	%xmm0, 0xd0(%rax)
1402b819c: 48 c7 45 28 02 00 00 00     	movq	$0x2, 0x28(%rbp)
1402b81a4: 48 89 45 30                 	movq	%rax, 0x30(%rbp)
1402b81a8: 48 c7 45 38 02 00 00 00     	movq	$0x2, 0x38(%rbp)
1402b81b0: 48 c7 45 40 00 00 00 00     	movq	$0x0, 0x40(%rbp)
1402b81b8: 48 c7 45 48 08 00 00 00     	movq	$0x8, 0x48(%rbp)
1402b81c0: 0f 57 c0                    	xorps	%xmm0, %xmm0
1402b81c3: 0f 11 45 50                 	movups	%xmm0, 0x50(%rbp)
1402b81c7: 48 c7 45 20 ff ff ff ff     	movq	$-0x1, 0x20(%rbp)
1402b81cf: 48 8d 4d 58                 	leaq	0x58(%rbp), %rcx
1402b81d3: e8 e8 43 dd 04              	callq	0x14508c5c0 <.text+0x508b5c0>

1402e758c: 48 89 85 88 00 00 00        	movq	%rax, 0x88(%rbp)
1402e7593: e8 68 ac d1 ff              	callq	0x140002200 <.text+0x1200>
1402e7598: b9 0c 00 00 00              	movl	$0xc, %ecx
1402e759d: ba 04 00 00 00              	movl	$0x4, %edx
1402e75a2: e8 19 ac d1 ff              	callq	0x1400021c0 <.text+0x11c0>
1402e75a7: 48 85 c0                    	testq	%rax, %rax
1402e75aa: 0f 84 3d 01 00 00           	je	0x1402e76ed <.text+0x2e66ed>
1402e75b0: c7 00 00 00 00 00           	movl	$0x0, (%rax)
1402e75b6: c6 40 04 00                 	movb	$0x0, 0x4(%rax)
1402e75ba: c6 40 08 00                 	movb	$0x0, 0x8(%rax)
1402e75be: 4c 8d 05 c3 20 f9 05        	leaq	0x5f920c3(%rip), %r8    # 0x146279688
1402e75c5: 48 8d 4d 18                 	leaq	0x18(%rbp), %rcx
1402e75c9: 48 89 c2                    	movq	%rax, %rdx
1402e75cc: e8 bf e5 d5 04              	callq	0x145045b90 <.text+0x5044b90>
1402e75d1: 90                          	nop
1402e75d2: e8 29 ac d1 ff              	callq	0x140002200 <.text+0x1200>
1402e75d7: b9 28 00 00 00              	movl	$0x28, %ecx
1402e75dc: ba 08 00 00 00              	movl	$0x8, %edx
1402e75e1: e8 da ab d1 ff              	callq	0x1400021c0 <.text+0x11c0>
1402e75e6: 48 85 c0                    	testq	%rax, %rax
1402e75e9: 0f 84 10 01 00 00           	je	0x1402e76ff <.text+0x2e66ff>
1402e75ef: 48 c7 00 00 00 00 00        	movq	$0x0, (%rax)
1402e75f6: c7 40 20 00 00 00 00        	movl	$0x0, 0x20(%rax)
1402e75fd: c6 40 24 00                 	movb	$0x0, 0x24(%rax)
1402e7601: 4c 8d 05 d0 21 f9 05        	leaq	0x5f921d0(%rip), %r8    # 0x1462797d8
1402e7608: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1402e760c: 48 89 c2                    	movq	%rax, %rdx
1402e760f: e8 7c e5 d5 04              	callq	0x145045b90 <.text+0x5044b90>
1402e7614: 90                          	nop
1402e7615: 0f 10 45 78                 	movups	0x78(%rbp), %xmm0
1402e7619: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1402e7620: 0f 11 40 60                 	movups	%xmm0, 0x60(%rax)
1402e7624: 0f 10 45 68                 	movups	0x68(%rbp), %xmm0
1402e7628: 0f 11 40 50                 	movups	%xmm0, 0x50(%rax)
1402e762c: 0f 10 45 58                 	movups	0x58(%rbp), %xmm0
1402e7630: 0f 11 40 40                 	movups	%xmm0, 0x40(%rax)
1402e7634: 0f 10 45 18                 	movups	0x18(%rbp), %xmm0
1402e7638: 0f 10 4d 28                 	movups	0x28(%rbp), %xmm1
1402e763c: 0f 10 55 38                 	movups	0x38(%rbp), %xmm2
1402e7640: 0f 10 5d 48                 	movups	0x48(%rbp), %xmm3
1402e7644: 0f 11 58 30                 	movups	%xmm3, 0x30(%rax)
1402e7648: 0f 11 50 20                 	movups	%xmm2, 0x20(%rax)
1402e764c: 0f 11 48 10                 	movups	%xmm1, 0x10(%rax)
1402e7650: 0f 11 00                    	movups	%xmm0, (%rax)
1402e7653: 0f 10 45 a8                 	movups	-0x58(%rbp), %xmm0
1402e7657: 0f 10 4d b8                 	movups	-0x48(%rbp), %xmm1
1402e765b: 0f 10 55 c8                 	movups	-0x38(%rbp), %xmm2
1402e765f: 0f 10 5d d8                 	movups	-0x28(%rbp), %xmm3
1402e7663: 0f 11 40 70                 	movups	%xmm0, 0x70(%rax)
1402e7667: 0f 11 88 80 00 00 00        	movups	%xmm1, 0x80(%rax)
1402e766e: 0f 11 90 90 00 00 00        	movups	%xmm2, 0x90(%rax)
1402e7675: 0f 11 98 a0 00 00 00        	movups	%xmm3, 0xa0(%rax)
1402e767c: 0f 10 45 e8                 	movups	-0x18(%rbp), %xmm0
1402e7680: 0f 11 80 b0 00 00 00        	movups	%xmm0, 0xb0(%rax)
1402e7687: 0f 10 45 f8                 	movups	-0x8(%rbp), %xmm0
1402e768b: 0f 11 80 c0 00 00 00        	movups	%xmm0, 0xc0(%rax)
1402e7692: 0f 10 45 08                 	movups	0x8(%rbp), %xmm0
1402e7696: 0f 11 80 d0 00 00 00        	movups	%xmm0, 0xd0(%rax)
1402e769d: 48 c7 46 08 02 00 00 00     	movq	$0x2, 0x8(%rsi)
1402e76a5: 48 89 46 10                 	movq	%rax, 0x10(%rsi)

14508c5c0: 48 83 39 00                 	cmpq	$0x0, (%rcx)
14508c5c4: 74 01                       	je	0x14508c5c7 <.text+0x508b5c7>
14508c5c6: c3                          	retq
14508c5c7: 0f 10 05 82 78 f1 01        	movups	0x1f17882(%rip), %xmm0  # 0x146fa3e50
14508c5ce: 0f 11 41 10                 	movups	%xmm0, 0x10(%rcx)
14508c5d2: 0f 10 05 67 78 f1 01        	movups	0x1f17867(%rip), %xmm0  # 0x146fa3e40
14508c5d9: 0f 11 01                    	movups	%xmm0, (%rcx)
14508c5dc: c3                          	retq

1400a0c28: 48 8b 40 10                 	movq	0x10(%rax), %rax
1400a0c2c: 4d 8b 5a 10                 	movq	0x10(%r10), %r11
1400a0c30: 45 8b 80 b0 05 00 00        	movl	0x5b0(%r8), %r8d
1400a0c37: 4c 8b 40 10                 	movq	0x10(%rax), %r8
1400a0c3b: 4c 03 40 18                 	addq	0x18(%rax), %r8
1400a0c3f: 4c 03 40 30                 	addq	0x30(%rax), %r8
1400a0c43: 45 89 4a 2c                 	movl	%r9d, 0x2c(%r10)
1400a0c47: 4d 89 03                    	movq	%r8, (%r11)

1402ec838: 48 8d 15 d9 40 f7 05        	leaq	0x5f740d9(%rip), %rdx   # 0x146260918
1402ec83f: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1402ec843: e8 88 b6 f1 ff              	callq	0x140207ed0 <.text+0x206ed0>
1402ec848: 90                          	nop
1402ec849: 49 89 c6                    	movq	%rax, %r14
1402ec84c: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
1402ec850: 48 85 d2                    	testq	%rdx, %rdx
1402ec853: 74 13                       	je	0x1402ec868 <.text+0x2eb868>
1402ec855: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
1402ec859: 48 c1 e2 03                 	shlq	$0x3, %rdx
1402ec85d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1402ec863: e8 68 59 d1 ff              	callq	0x1400021d0 <.text+0x11d0>
1402ec868: 4c 89 7d f0                 	movq	%r15, -0x10(%rbp)
1402ec86c: 4c 89 65 f8                 	movq	%r12, -0x8(%rbp)
1402ec870: 48 c7 45 d8 00 00 00 00     	movq	$0x0, -0x28(%rbp)
1402ec878: 48 c7 45 e0 08 00 00 00     	movq	$0x8, -0x20(%rbp)
1402ec880: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
1402ec888: 48 8d 15 c9 41 f7 05        	leaq	0x5f741c9(%rip), %rdx   # 0x146260a58
1402ec88f: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1402ec893: e8 e8 ca f1 ff              	callq	0x140209380 <.text+0x208380>

1402eba18: 48 8d 15 f9 4e f7 05        	leaq	0x5f74ef9(%rip), %rdx   # 0x146260918
1402eba1f: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1402eba23: e8 a8 c4 f1 ff              	callq	0x140207ed0 <.text+0x206ed0>
1402eba28: 90                          	nop
1402eba29: 48 89 c3                    	movq	%rax, %rbx
1402eba2c: 48 8b 55 b0                 	movq	-0x50(%rbp), %rdx
1402eba30: 48 85 d2                    	testq	%rdx, %rdx
1402eba33: 74 13                       	je	0x1402eba48 <.text+0x2eaa48>
1402eba35: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
1402eba39: 48 c1 e2 03                 	shlq	$0x3, %rdx
1402eba3d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1402eba43: e8 88 67 d1 ff              	callq	0x1400021d0 <.text+0x11d0>
1402eba48: 4c 89 75 c8                 	movq	%r14, -0x38(%rbp)
1402eba4c: 4c 89 65 d0                 	movq	%r12, -0x30(%rbp)
1402eba50: 48 c7 45 b0 00 00 00 00     	movq	$0x0, -0x50(%rbp)
1402eba58: 48 c7 45 b8 08 00 00 00     	movq	$0x8, -0x48(%rbp)
1402eba60: 48 c7 45 c0 00 00 00 00     	movq	$0x0, -0x40(%rbp)
1402eba68: 48 8d 15 e9 4f f7 05        	leaq	0x5f74fe9(%rip), %rdx   # 0x146260a58
1402eba6f: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1402eba73: e8 08 d9 f1 ff              	callq	0x140209380 <.text+0x208380>

140472498: 48 89 d1                    	movq	%rdx, %rcx
14047249b: e8 90 ab f5 ff              	callq	0x1403cd030 <.text+0x3cc030>
1404724a0: 48 89 c3                    	movq	%rax, %rbx
1404724a3: 48 8d 4d 50                 	leaq	0x50(%rbp), %rcx
1404724a7: e8 54 b9 c4 04              	callq	0x1450bde00 <.text+0x50bce00>
1404724ac: c6 85 1f 02 00 00 01        	movb	$0x1, 0x21f(%rbp)
1404724b3: 48 8d 4d a0                 	leaq	-0x60(%rbp), %rcx
1404724b7: e8 44 b9 c4 04              	callq	0x1450bde00 <.text+0x50bce00>
1404724bc: 90                          	nop
1404724bd: 48 8d 4d a0                 	leaq	-0x60(%rbp), %rcx
1404724c1: 48 89 da                    	movq	%rbx, %rdx
1404724c4: e8 57 59 c4 04              	callq	0x1450b7e20 <.text+0x50b6e20>

1403cd09f: 66 0f 6f 05 49 4d e6 05     	movdqa	0x5e64d49(%rip), %xmm0  # 0x146231df0
1403cd0a7: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
1403cd0ab: 66 0f 6f 15 5d 2e e9 05     	movdqa	0x5e92e5d(%rip), %xmm2  # 0x14625ff10

1402af600: 56                          	pushq	%rsi
1402af601: 57                          	pushq	%rdi
1402af602: 53                          	pushq	%rbx
1402af603: 4c 8b 01                    	movq	(%rcx), %r8
1402af606: 48 8b 41 08                 	movq	0x8(%rcx), %rax
1402af60a: 49 8b 90 f8 00 00 00        	movq	0xf8(%r8), %rdx
1402af611: 49 8b 88 00 01 00 00        	movq	0x100(%r8), %rcx
1402af618: 48 8d 0c 8a                 	leaq	(%rdx,%rcx,4), %rcx
1402af61c: 41 0f b6 98 08 01 00 00     	movzbl	0x108(%r8), %ebx
1402af624: 84 db                       	testb	%bl, %bl
1402af626: 74 10                       	je	0x1402af638 <.text+0x2ae638>
1402af628: bf 08 00 00 00              	movl	$0x8, %edi
1402af62d: 45 31 c9                    	xorl	%r9d, %r9d
1402af630: 45 31 d2                    	xorl	%r10d, %r10d
1402af633: 45 31 c0                    	xorl	%r8d, %r8d
1402af636: eb 40                       	jmp	0x1402af678 <.text+0x2ae678>
1402af638: be 08 00 00 00              	movl	$0x8, %esi
1402af63d: 45 31 c9                    	xorl	%r9d, %r9d
1402af640: 45 31 d2                    	xorl	%r10d, %r10d
1402af643: 45 31 c0                    	xorl	%r8d, %r8d
1402af646: e9 90 00 00 00              	jmp	0x1402af6db <.text+0x2ae6db>
1402af64b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1402af650: 4d 8d 04 f2                 	leaq	(%r10,%rsi,8), %r8
1402af654: 49 8b 78 08                 	movq	0x8(%r8), %rdi
1402af658: 45 31 d2                    	xorl	%r10d, %r10d
1402af65b: 45 89 d9                    	movl	%r11d, %r9d
1402af65e: 45 89 d0                    	movl	%r10d, %r8d
1402af661: 41 ff c2                    	incl	%r10d
1402af664: 4e 8b 1c c7                 	movq	(%rdi,%r8,8), %r11
1402af668: 4d 89 d8                    	movq	%r11, %r8
1402af66b: 49 c1 e8 20                 	shrq	$0x20, %r8
1402af66f: 45 85 db                    	testl	%r11d, %r11d
1402af672: 0f 85 87 01 00 00           	jne	0x1402af7ff <.text+0x2ae7ff>
1402af678: 45 39 ca                    	cmpl	%r9d, %r10d
1402af67b: 75 e1                       	jne	0x1402af65e <.text+0x2ae65e>
1402af67d: 0f 1f 00                    	nopl	(%rax)
1402af680: 48 39 ca                    	cmpq	%rcx, %rdx
1402af683: 74 1e                       	je	0x1402af6a3 <.text+0x2ae6a3>
1402af685: 44 8b 1a                    	movl	(%rdx), %r11d
1402af688: 48 83 c2 04                 	addq	$0x4, %rdx
1402af68c: 4c 8b 90 a8 01 00 00        	movq	0x1a8(%rax), %r10
1402af693: 4b 8d 34 db                 	leaq	(%r11,%r11,8), %rsi
1402af697: 4d 8b 5c f2 10              	movq	0x10(%r10,%rsi,8), %r11
1402af69c: 4d 85 db                    	testq	%r11, %r11
1402af69f: 74 df                       	je	0x1402af680 <.text+0x2ae680>
1402af6a1: eb ad                       	jmp	0x1402af650 <.text+0x2ae650>
1402af6a3: be 08 00 00 00              	movl	$0x8, %esi
1402af6a8: eb 62                       	jmp	0x1402af70c <.text+0x2ae70c>
1402af6aa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1402af6b0: 49 01 fa                    	addq	%rdi, %r10
1402af6b3: 49 8b 72 50                 	movq	0x50(%r10), %rsi
1402af6b7: 45 31 d2                    	xorl	%r10d, %r10d
1402af6ba: 45 89 d9                    	movl	%r11d, %r9d
1402af6bd: 45 89 d0                    	movl	%r10d, %r8d
1402af6c0: 49 c1 e0 04                 	shlq	$0x4, %r8
1402af6c4: 41 ff c2                    	incl	%r10d
1402af6c7: 4e 8b 1c 06                 	movq	(%rsi,%r8), %r11
1402af6cb: 4d 89 d8                    	movq	%r11, %r8
1402af6ce: 49 c1 e8 20                 	shrq	$0x20, %r8
1402af6d2: 45 85 db                    	testl	%r11d, %r11d
1402af6d5: 0f 85 2e 01 00 00           	jne	0x1402af809 <.text+0x2ae809>
1402af6db: 45 39 ca                    	cmpl	%r9d, %r10d
1402af6de: 75 dd                       	jne	0x1402af6bd <.text+0x2ae6bd>
1402af6e0: 48 39 ca                    	cmpq	%rcx, %rdx
1402af6e3: 74 22                       	je	0x1402af707 <.text+0x2ae707>
1402af6e5: 44 8b 1a                    	movl	(%rdx), %r11d
1402af6e8: 48 83 c2 04                 	addq	$0x4, %rdx
1402af6ec: 4c 8b 90 08 01 00 00        	movq	0x108(%rax), %r10
1402af6f3: 4b 8d 3c 9b                 	leaq	(%r11,%r11,4), %rdi
1402af6f7: 48 c1 e7 05                 	shlq	$0x5, %rdi
1402af6fb: 4d 8b 5c 3a 58              	movq	0x58(%r10,%rdi), %r11
1402af700: 4d 85 db                    	testq	%r11, %r11
1402af703: 74 db                       	je	0x1402af6e0 <.text+0x2ae6e0>
1402af705: eb a9                       	jmp	0x1402af6b0 <.text+0x2ae6b0>
1402af707: bf 08 00 00 00              	movl	$0x8, %edi
1402af70c: 48 89 ca                    	movq	%rcx, %rdx
1402af70f: 45 89 ca                    	movl	%r9d, %r10d
1402af712: 45 31 db                    	xorl	%r11d, %r11d
1402af715: 84 db                       	testb	%bl, %bl
1402af717: 0f 84 7f 00 00 00           	je	0x1402af79c <.text+0x2ae79c>
1402af71d: eb 1e                       	jmp	0x1402af73d <.text+0x2ae73d>
1402af71f: 90                          	nop
1402af720: 4d 8d 14 f2                 	leaq	(%r10,%rsi,8), %r10
1402af724: 49 8b 7a 08                 	movq	0x8(%r10), %rdi
1402af728: 45 31 d2                    	xorl	%r10d, %r10d
1402af72b: 44 89 d6                    	movl	%r10d, %esi
1402af72e: 41 ff c2                    	incl	%r10d
1402af731: 8b 1c f7                    	movl	(%rdi,%rsi,8), %ebx
1402af734: 48 85 db                    	testq	%rbx, %rbx
1402af737: 0f 85 9c 00 00 00           	jne	0x1402af7d9 <.text+0x2ae7d9>
1402af73d: 45 39 ca                    	cmpl	%r9d, %r10d
1402af740: 75 e9                       	jne	0x1402af72b <.text+0x2ae72b>
1402af742: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1402af750: 48 39 ca                    	cmpq	%rcx, %rdx
1402af753: 0f 84 7e 00 00 00           	je	0x1402af7d7 <.text+0x2ae7d7>
1402af759: 44 8b 0a                    	movl	(%rdx), %r9d
1402af75c: 48 83 c2 04                 	addq	$0x4, %rdx
1402af760: 4c 8b 90 a8 01 00 00        	movq	0x1a8(%rax), %r10
1402af767: 4b 8d 34 c9                 	leaq	(%r9,%r9,8), %rsi
1402af76b: 4d 8b 4c f2 10              	movq	0x10(%r10,%rsi,8), %r9
1402af770: 4d 85 c9                    	testq	%r9, %r9
1402af773: 74 db                       	je	0x1402af750 <.text+0x2ae750>
1402af775: eb a9                       	jmp	0x1402af720 <.text+0x2ae720>
1402af777: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1402af780: 49 01 f2                    	addq	%rsi, %r10
1402af783: 49 8b 72 50                 	movq	0x50(%r10), %rsi
1402af787: 45 31 d2                    	xorl	%r10d, %r10d
1402af78a: 44 89 d7                    	movl	%r10d, %edi
1402af78d: 48 c1 e7 04                 	shlq	$0x4, %rdi
1402af791: 41 ff c2                    	incl	%r10d
1402af794: 8b 1c 3e                    	movl	(%rsi,%rdi), %ebx
1402af797: 48 85 db                    	testq	%rbx, %rbx
1402af79a: 75 3d                       	jne	0x1402af7d9 <.text+0x2ae7d9>
1402af79c: 45 39 ca                    	cmpl	%r9d, %r10d
1402af79f: 75 e9                       	jne	0x1402af78a <.text+0x2ae78a>
1402af7a1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1402af7b0: 48 39 ca                    	cmpq	%rcx, %rdx
1402af7b3: 74 22                       	je	0x1402af7d7 <.text+0x2ae7d7>
1402af7b5: 44 8b 0a                    	movl	(%rdx), %r9d
1402af7b8: 48 83 c2 04                 	addq	$0x4, %rdx
1402af7bc: 4c 8b 90 08 01 00 00        	movq	0x108(%rax), %r10
1402af7c3: 4b 8d 34 89                 	leaq	(%r9,%r9,4), %rsi
1402af7c7: 48 c1 e6 05                 	shlq	$0x5, %rsi
1402af7cb: 4d 8b 4c 32 58              	movq	0x58(%r10,%rsi), %r9
1402af7d0: 4d 85 c9                    	testq	%r9, %r9
1402af7d3: 74 db                       	je	0x1402af7b0 <.text+0x2ae7b0>
1402af7d5: eb a9                       	jmp	0x1402af780 <.text+0x2ae780>
1402af7d7: 31 db                       	xorl	%ebx, %ebx
1402af7d9: 44 89 d9                    	movl	%r11d, %ecx
1402af7dc: 49 c1 e0 20                 	shlq	$0x20, %r8
1402af7e0: 49 09 c8                    	orq	%rcx, %r8
1402af7e3: 48 85 db                    	testq	%rbx, %rbx
1402af7e6: 48 b8 00 00 00 00 01 00 00 00       	movabsq	$0x100000000, %rax # imm = 0x100000000
1402af7f0: 49 0f 44 c0                 	cmoveq	%r8, %rax
1402af7f4: 48 85 c9                    	testq	%rcx, %rcx
1402af7f7: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1402af7fb: 5b                          	popq	%rbx
1402af7fc: 5f                          	popq	%rdi
1402af7fd: 5e                          	popq	%rsi
1402af7fe: c3                          	retq
1402af7ff: be 08 00 00 00              	movl	$0x8, %esi
1402af804: e9 0c ff ff ff              	jmp	0x1402af715 <.text+0x2ae715>
1402af809: bf 08 00 00 00              	movl	$0x8, %edi
1402af80e: e9 02 ff ff ff              	jmp	0x1402af715 <.text+0x2ae715>

144639020: 48 8d 05 1e 70 70 02        	leaq	0x270701e(%rip), %rax   # 0x146d40045
144639027: ba 22 00 00 00              	movl	$0x22, %edx
14463902c: c3                          	retq

144644b40: 56                          	pushq	%rsi
144644b41: 48 83 ec 30                 	subq	$0x30, %rsp
144644b45: 48 89 d1                    	movq	%rdx, %rcx
144644b48: 41 ff 50 68                 	callq	*0x68(%r8)
144644b4c: 48 85 c0                    	testq	%rax, %rax
144644b4f: 74 42                       	je	0x144644b93 <.text+0x4643b93>
144644b51: 48 89 c1                    	movq	%rax, %rcx
144644b54: ff 92 00 01 00 00           	callq	*0x100(%rdx)
144644b5a: 48 89 c6                    	movq	%rax, %rsi
144644b5d: 48 89 d0                    	movq	%rdx, %rax
144644b60: 48 8d 4c 24 20              	leaq	0x20(%rsp), %rcx
144644b65: 48 89 f2                    	movq	%rsi, %rdx
144644b68: ff 50 18                    	callq	*0x18(%rax)
144644b6b: 66 0f 6f 44 24 20           	movdqa	0x20(%rsp), %xmm0
144644b71: 66 0f 74 05 97 b3 c1 01     	pcmpeqb	0x1c1b397(%rip), %xmm0  # 0x14625ff10
144644b79: 66 0f d7 c0                 	pmovmskb	%xmm0, %eax
144644b7d: 3d ff ff 00 00              	cmpl	$0xffff, %eax           # imm = 0xFFFF
144644b82: 0f 94 c1                    	sete	%cl

# focus-window-query-init

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14047ef4a: 48 89 d1                    	movq	%rdx, %rcx
14047ef4d: e8 4e e6 f4 ff              	callq	0x1403cd5a0 <.text+0x3cc5a0>
14047ef52: 48 89 c3                    	movq	%rax, %rbx
14047ef55: 48 89 f9                    	movq	%rdi, %rcx
14047ef58: e8 d3 e0 f4 ff              	callq	0x1403cd030 <.text+0x3cc030>

# picker-focus-admission

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f63c3: 48 8b 1a                    	movq	(%rdx), %rbx
1401f63c6: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
1401f63ca: 49 8b 00                    	movq	(%r8), %rax
1401f63cd: 80 78 0d 00                 	cmpb	$0x0, 0xd(%rax)
1401f63d1: 74 46                       	je	0x1401f6419 <.text+0x1f5419>
1401f63d3: 80 38 00                    	cmpb	$0x0, (%rax)
1401f63d6: 75 41                       	jne	0x1401f6419 <.text+0x1f5419>
1401f63d8: 49 8b 01                    	movq	(%r9), %rax
1401f63db: 80 b8 8a 00 00 00 00        	cmpb	$0x0, 0x8a(%rax)
1401f63e2: 75 35                       	jne	0x1401f6419 <.text+0x1f5419>
1401f63e4: 48 8b 85 80 00 00 00        	movq	0x80(%rbp), %rax
1401f63eb: 48 8b 00                    	movq	(%rax), %rax
1401f63ee: 80 b8 c0 01 00 00 00        	cmpb	$0x0, 0x1c0(%rax)
1401f63f5: 75 22                       	jne	0x1401f6419 <.text+0x1f5419>
1401f63f7: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1401f63fe: 48 8b 00                    	movq	(%rax), %rax
1401f6401: 80 38 00                    	cmpb	$0x0, (%rax)
1401f6404: 75 13                       	jne	0x1401f6419 <.text+0x1f5419>
1401f6406: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1401f640d: 48 8b 00                    	movq	(%rax), %rax
1401f6410: 80 b8 b4 01 00 00 00        	cmpb	$0x0, 0x1b4(%rax)
1401f6417: 74 1b                       	je	0x1401f6434 <.text+0x1f5434>
1401f6419: 49 8b 46 40                 	movq	0x40(%r14), %rax
1401f641d: 48 89 03                    	movq	%rax, (%rbx)
1401f6420: 48 81 c4 98 00 00 00        	addq	$0x98, %rsp
1401f6427: 5b                          	popq	%rbx
1401f6428: 5f                          	popq	%rdi
1401f6429: 5e                          	popq	%rsi
1401f642a: 41 5c                       	popq	%r12
1401f642c: 41 5d                       	popq	%r13
1401f642e: 41 5e                       	popq	%r14
1401f6430: 41 5f                       	popq	%r15
1401f6432: 5d                          	popq	%rbp
1401f6433: c3                          	retq

# picker-focus-request

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f65fd: 48 85 c9                    	testq	%rcx, %rcx
1401f6600: 74 29                       	je	0x1401f662b <.text+0x1f562b>
1401f6602: f2 0f 10 41 30              	movsd	0x30(%rcx), %xmm0
1401f6607: f2 41 0f 10 4a 10           	movsd	0x10(%r10), %xmm1
1401f660d: 0f 59 05 4c 52 06 06        	mulps	0x606524c(%rip), %xmm0  # 0x14625b860
1401f6614: f2 0f d0 c8                 	addsubps	%xmm0, %xmm1
1401f6618: f3 0f 10 41 64              	movss	0x64(%rcx), %xmm0
1401f661d: f3 0f 12 c0                 	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1401f6621: 0f 59 c1                    	mulps	%xmm1, %xmm0
1401f6624: b9 01 00 00 00              	movl	$0x1, %ecx
1401f6629: eb 07                       	jmp	0x1401f6632 <.text+0x1f5632>
1401f662b: 8b 08                       	movl	(%rax), %ecx
1401f662d: f2 0f 10 40 04              	movsd	0x4(%rax), %xmm0
1401f6632: c6 40 18 01                 	movb	$0x1, 0x18(%rax)
1401f6636: 89 08                       	movl	%ecx, (%rax)
1401f6638: 0f 13 40 04                 	movlps	%xmm0, 0x4(%rax)

# ime-reader-initialization

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140219f50: 55                          	pushq	%rbp
140219f51: 41 56                       	pushq	%r14
140219f53: 56                          	pushq	%rsi
140219f54: 57                          	pushq	%rdi
140219f55: 53                          	pushq	%rbx
140219f56: 48 81 ec c0 00 00 00        	subq	$0xc0, %rsp
140219f5d: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
140219f65: 48 c7 45 38 fe ff ff ff     	movq	$-0x2, 0x38(%rbp)
140219f6d: 48 89 c8                    	movq	%rcx, %rax
140219f70: 48 83 c1 40                 	addq	$0x40, %rcx
140219f74: 48 8d 90 a8 05 00 00        	leaq	0x5a8(%rax), %rdx
140219f7b: 48 89 4d 28                 	movq	%rcx, 0x28(%rbp)
140219f7f: 48 89 55 30                 	movq	%rdx, 0x30(%rbp)
140219f83: 48 c7 45 10 00 00 00 00     	movq	$0x0, 0x10(%rbp)
140219f8b: 48 c7 45 18 08 00 00 00     	movq	$0x8, 0x18(%rbp)
140219f93: 48 c7 45 20 00 00 00 00     	movq	$0x0, 0x20(%rbp)
140219f9b: 48 83 b8 90 00 00 00 00     	cmpq	$0x0, 0x90(%rax)
140219fa3: 0f 84 a0 00 00 00           	je	0x14021a049 <.text+0x219049>
140219fa9: 49 b9 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %r9 # imm = 0xF7BE4D58AAC2F35F
140219fb3: 4c 8b 40 78                 	movq	0x78(%rax), %r8
140219fb7: 4c 8b 90 80 00 00 00        	movq	0x80(%rax), %r10
140219fbe: 45 31 db                    	xorl	%r11d, %r11d
140219fc1: 66 0f 6f 05 87 7d 01 06     	movdqa	0x6017d87(%rip), %xmm0  # 0x146231d50
140219fc9: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
140219fcd: 66 0f 6f 15 db 60 04 06     	movdqa	0x60460db(%rip), %xmm2  # 0x1462600b0
140219fd5: 4d 21 d1                    	andq	%r10, %r9
140219fd8: f3 43 0f 6f 1c 08           	movdqu	(%r8,%r9), %xmm3
140219fde: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
140219fe2: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
140219fe6: 66 0f d7 f4                 	pmovmskb	%xmm4, %esi
140219fea: 85 f6                       	testl	%esi, %esi
140219fec: 74 42                       	je	0x14021a030 <.text+0x219030>
140219fee: f3 0f bc fe                 	tzcntl	%esi, %edi
140219ff2: 4c 01 cf                    	addq	%r9, %rdi
140219ff5: 4c 21 d7                    	andq	%r10, %rdi
140219ff8: 48 f7 df                    	negq	%rdi
140219ffb: 48 8d 3c 7f                 	leaq	(%rdi,%rdi,2), %rdi
140219fff: f3 41 0f 6f 64 f8 e8        	movdqu	-0x18(%r8,%rdi,8), %xmm4
14021a006: 66 0f 74 e2                 	pcmpeqb	%xmm2, %xmm4
14021a00a: 66 0f d7 dc                 	pmovmskb	%xmm4, %ebx
14021a00e: 81 fb ff ff 00 00           	cmpl	$0xffff, %ebx           # imm = 0xFFFF
14021a014: 0f 84 e3 00 00 00           	je	0x14021a0fd <.text+0x2190fd>
14021a01a: 8d 7e ff                    	leal	-0x1(%rsi), %edi
14021a01d: 66 21 f7                    	andw	%si, %di
14021a020: 89 fe                       	movl	%edi, %esi
14021a022: 75 ca                       	jne	0x140219fee <.text+0x218fee>
14021a024: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14021a030: 66 0f 74 d9                 	pcmpeqb	%xmm1, %xmm3
14021a034: 66 0f d7 f3                 	pmovmskb	%xmm3, %esi
14021a038: 85 f6                       	testl	%esi, %esi
14021a03a: 75 0d                       	jne	0x14021a049 <.text+0x219049>
14021a03c: 4d 01 d9                    	addq	%r11, %r9
14021a03f: 49 83 c1 10                 	addq	$0x10, %r9
14021a043: 49 83 c3 10                 	addq	$0x10, %r11
14021a047: eb 8c                       	jmp	0x140219fd5 <.text+0x218fd5>
14021a049: 44 0f b6 80 a0 00 00 00     	movzbl	0xa0(%rax), %r8d
14021a051: 4c 8b 80 e0 00 00 00        	movq	0xe0(%rax), %r8
14021a058: 4c 8b 88 e8 00 00 00        	movq	0xe8(%rax), %r9
14021a05f: 49 ba 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %r10 # imm = 0xF7BE4D58AAC2F35F
14021a069: 45 31 db                    	xorl	%r11d, %r11d
14021a06c: 66 0f 6f 05 dc 7c 01 06     	movdqa	0x6017cdc(%rip), %xmm0  # 0x146231d50
14021a074: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
14021a078: 66 0f 6f 15 30 60 04 06     	movdqa	0x6046030(%rip), %xmm2  # 0x1462600b0
14021a080: 4d 21 ca                    	andq	%r9, %r10
14021a083: f3 43 0f 6f 1c 10           	movdqu	(%r8,%r10), %xmm3
14021a089: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
14021a08d: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
14021a091: 66 0f d7 dc                 	pmovmskb	%xmm4, %ebx
14021a095: 85 db                       	testl	%ebx, %ebx
14021a097: 74 47                       	je	0x14021a0e0 <.text+0x2190e0>
14021a099: f3 0f bc fb                 	tzcntl	%ebx, %edi
14021a09d: 4c 01 d7                    	addq	%r10, %rdi
14021a0a0: 4c 21 cf                    	andq	%r9, %rdi
14021a0a3: 49 89 fe                    	movq	%rdi, %r14
14021a0a6: 49 c1 e6 07                 	shlq	$0x7, %r14
14021a0aa: 4c 89 c6                    	movq	%r8, %rsi
14021a0ad: 4c 29 f6                    	subq	%r14, %rsi
14021a0b0: f3 0f 6f 66 80              	movdqu	-0x80(%rsi), %xmm4
14021a0b5: 66 0f 74 e2                 	pcmpeqb	%xmm2, %xmm4
14021a0b9: 66 44 0f d7 f4              	pmovmskb	%xmm4, %r14d
14021a0be: 41 81 fe ff ff 00 00        	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14021a0c5: 74 43                       	je	0x14021a10a <.text+0x21910a>
14021a0c7: 8d 73 ff                    	leal	-0x1(%rbx), %esi
14021a0ca: 66 21 de                    	andw	%bx, %si
14021a0cd: 89 f3                       	movl	%esi, %ebx
14021a0cf: 75 c8                       	jne	0x14021a099 <.text+0x219099>
14021a0d1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
14021a0e0: 66 0f 74 d9                 	pcmpeqb	%xmm1, %xmm3
14021a0e4: 66 0f d7 f3                 	pmovmskb	%xmm3, %esi
14021a0e8: 85 f6                       	testl	%esi, %esi
14021a0ea: 0f 85 8c 00 00 00           	jne	0x14021a17c <.text+0x21917c>
14021a0f0: 4d 01 da                    	addq	%r11, %r10
14021a0f3: 49 83 c2 10                 	addq	$0x10, %r10
14021a0f7: 49 83 c3 10                 	addq	$0x10, %r11
14021a0fb: eb 83                       	jmp	0x14021a080 <.text+0x219080>
14021a0fd: 49 8d 04 f8                 	leaq	(%r8,%rdi,8), %rax
14021a101: 48 8b 70 f8                 	movq	-0x8(%rax), %rsi
14021a105: e9 5c 01 00 00              	jmp	0x14021a266 <.text+0x219266>
14021a10a: 4c 8d 57 f0                 	leaq	-0x10(%rdi), %r10
14021a10e: 4d 21 ca                    	andq	%r9, %r10
14021a111: f3 43 0f 6f 04 10           	movdqu	(%r8,%r10), %xmm0
14021a117: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
14021a11b: 66 0f 74 c1                 	pcmpeqb	%xmm1, %xmm0
14021a11f: 66 44 0f d7 c8              	pmovmskb	%xmm0, %r9d
14021a124: f3 41 0f 6f 04 38           	movdqu	(%r8,%rdi), %xmm0
14021a12a: 66 0f 74 c1                 	pcmpeqb	%xmm1, %xmm0
14021a12e: 66 44 0f d7 d8              	pmovmskb	%xmm0, %r11d
14021a133: 66 bb 1f 00                 	movw	$0x1f, %bx
14021a137: 66 41 0f bd d9              	bsrw	%r9w, %bx
14021a13c: 83 f3 0f                    	xorl	$0xf, %ebx
14021a13f: 41 81 cb 00 00 01 00        	orl	$0x10000, %r11d         # imm = 0x10000
14021a146: f3 45 0f bc db              	tzcntl	%r11d, %r11d
14021a14b: 41 01 db                    	addl	%ebx, %r11d
14021a14e: 41 b1 80                    	movb	$-0x80, %r9b
14021a151: 66 41 83 fb 0f              	cmpw	$0xf, %r11w
14021a156: 77 0a                       	ja	0x14021a162 <.text+0x219162>
14021a158: 48 ff 80 f0 00 00 00        	incq	0xf0(%rax)
14021a15f: 41 b1 ff                    	movb	$-0x1, %r9b
14021a162: 45 88 0c 38                 	movb	%r9b, (%r8,%rdi)
14021a166: 47 88 4c 10 10              	movb	%r9b, 0x10(%r8,%r10)
14021a16b: 48 ff 88 f8 00 00 00        	decq	0xf8(%rax)
14021a172: 4c 8b 46 90                 	movq	-0x70(%rsi), %r8
14021a176: 49 83 f8 02                 	cmpq	$0x2, %r8
14021a17a: 75 79                       	jne	0x14021a1f5 <.text+0x2191f5>
14021a17c: 48 89 c7                    	movq	%rax, %rdi
14021a17f: 48 8b 32                    	movq	(%rdx), %rsi
14021a182: 48 8d 46 01                 	leaq	0x1(%rsi), %rax
14021a186: 48 89 02                    	movq	%rax, (%rdx)
14021a189: 66 c7 45 f0 00 01           	movw	$0x100, -0x10(%rbp)     # imm = 0x100
14021a18f: 48 c7 45 a0 01 00 00 00     	movq	$0x1, -0x60(%rbp)
14021a197: f3 0f 6f 05 99 67 04 06     	movdqu	0x6046799(%rip), %xmm0  # 0x146260938
14021a19f: f3 0f 7f 45 a8              	movdqu	%xmm0, -0x58(%rbp)
14021a1a4: 48 c7 45 c8 08 00 00 00     	movq	$0x8, -0x38(%rbp)
14021a1ac: 48 c7 45 d0 48 00 00 00     	movq	$0x48, -0x30(%rbp)
14021a1b4: 48 8d 05 c5 33 05 00        	leaq	0x533c5(%rip), %rax     # 0x14026d580 <.text+0x26c580>
14021a1bb: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14021a1bf: c6 45 f2 01                 	movb	$0x1, -0xe(%rbp)
14021a1c3: 48 c7 45 b8 00 00 00 00     	movq	$0x0, -0x48(%rbp)
14021a1cb: c6 45 d8 02                 	movb	$0x2, -0x28(%rbp)
14021a1cf: 4c 8d 45 a0                 	leaq	-0x60(%rbp), %r8
14021a1d3: 48 89 f2                    	movq	%rsi, %rdx
14021a1d6: e8 15 3a e5 ff              	callq	0x14006dbf0 <.text+0x6cbf0>
14021a1db: 90                          	nop
14021a1dc: 48 89 f9                    	movq	%rdi, %rcx
14021a1df: 48 83 c1 78                 	addq	$0x78, %rcx
14021a1e3: 48 8d 15 4e 67 04 06        	leaq	0x604674e(%rip), %rdx   # 0x146260938
14021a1ea: 49 89 f0                    	movq	%rsi, %r8
14021a1ed: e8 4e 38 e5 ff              	callq	0x14006da40 <.text+0x6ca40>
14021a1f2: 90                          	nop
14021a1f3: eb 71                       	jmp	0x14021a266 <.text+0x219266>
14021a1f5: 48 8b 46 f8                 	movq	-0x8(%rsi), %rax
14021a1f9: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
14021a1fd: 0f 10 46 e8                 	movups	-0x18(%rsi), %xmm0
14021a201: 0f 11 45 f8                 	movups	%xmm0, -0x8(%rbp)
14021a205: 0f 10 46 d8                 	movups	-0x28(%rsi), %xmm0
14021a209: 0f 11 45 e8                 	movups	%xmm0, -0x18(%rbp)
14021a20d: f3 0f 6f 46 98              	movdqu	-0x68(%rsi), %xmm0
14021a212: f3 0f 6f 4e a8              	movdqu	-0x58(%rsi), %xmm1
14021a217: f3 0f 6f 56 b8              	movdqu	-0x48(%rsi), %xmm2
14021a21c: f3 0f 6f 5e c8              	movdqu	-0x38(%rsi), %xmm3
14021a221: f3 0f 7f 5d d8              	movdqu	%xmm3, -0x28(%rbp)
14021a226: f3 0f 7f 55 c8              	movdqu	%xmm2, -0x38(%rbp)
14021a22b: f3 0f 7f 4d b8              	movdqu	%xmm1, -0x48(%rbp)
14021a230: f3 0f 7f 45 a8              	movdqu	%xmm0, -0x58(%rbp)
14021a235: 4c 89 45 a0                 	movq	%r8, -0x60(%rbp)
14021a239: 48 8d 4d a0                 	leaq	-0x60(%rbp), %rcx
14021a23d: 48 8d 55 10                 	leaq	0x10(%rbp), %rdx
14021a241: e8 3a 4c e1 04              	callq	0x14502ee80 <.text+0x502de80>
14021a246: 90                          	nop
14021a247: 48 89 c6                    	movq	%rax, %rsi
14021a24a: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
14021a24e: 48 85 d2                    	testq	%rdx, %rdx
14021a251: 74 13                       	je	0x14021a266 <.text+0x219266>
14021a253: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
14021a257: 48 c1 e2 03                 	shlq	$0x3, %rdx
14021a25b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14021a261: e8 6a 7f de ff              	callq	0x1400021d0 <.text+0x11d0>
14021a266: 31 c0                       	xorl	%eax, %eax
14021a268: 48 89 f2                    	movq	%rsi, %rdx
14021a26b: 48 81 c4 c0 00 00 00        	addq	$0xc0, %rsp
14021a272: 5b                          	popq	%rbx
14021a273: 5f                          	popq	%rdi
14021a274: 5e                          	popq	%rsi
14021a275: 41 5e                       	popq	%r14
14021a277: 5d                          	popq	%rbp
14021a278: c3                          	retq

# ime-resource-registration

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1446d8370: 55                          	pushq	%rbp
1446d8371: 41 56                       	pushq	%r14
1446d8373: 56                          	pushq	%rsi
1446d8374: 57                          	pushq	%rdi
1446d8375: 53                          	pushq	%rbx
1446d8376: 48 81 ec f0 01 00 00        	subq	$0x1f0, %rsp            # imm = 0x1F0
1446d837d: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1446d8385: 48 c7 85 68 01 00 00 fe ff ff ff    	movq	$-0x2, 0x168(%rbp)
1446d8390: 48 89 ce                    	movq	%rcx, %rsi
1446d8393: 48 83 b9 90 00 00 00 00     	cmpq	$0x0, 0x90(%rcx)
1446d839b: 0f 84 9a 01 00 00           	je	0x1446d853b <.text+0x46d753b>
1446d83a1: 48 b8 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %rax # imm = 0xF7BE4D58AAC2F35F
1446d83ab: 48 8b 4e 78                 	movq	0x78(%rsi), %rcx
1446d83af: 48 8b 96 80 00 00 00        	movq	0x80(%rsi), %rdx
1446d83b6: 45 31 c0                    	xorl	%r8d, %r8d
1446d83b9: 66 0f 6f 05 8f 99 b5 01     	movdqa	0x1b5998f(%rip), %xmm0  # 0x146231d50
1446d83c1: 66 0f 76 d2                 	pcmpeqd	%xmm2, %xmm2
1446d83c5: 66 0f 6f 0d e3 7c b8 01     	movdqa	0x1b87ce3(%rip), %xmm1  # 0x1462600b0
1446d83cd: 48 21 d0                    	andq	%rdx, %rax
1446d83d0: f3 0f 6f 1c 01              	movdqu	(%rcx,%rax), %xmm3
1446d83d5: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
1446d83d9: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
1446d83dd: 66 44 0f d7 cc              	pmovmskb	%xmm4, %r9d
1446d83e2: 45 85 c9                    	testl	%r9d, %r9d
1446d83e5: 74 39                       	je	0x1446d8420 <.text+0x46d7420>
1446d83e7: f3 45 0f bc d1              	tzcntl	%r9d, %r10d
1446d83ec: 49 01 c2                    	addq	%rax, %r10
1446d83ef: 49 21 d2                    	andq	%rdx, %r10
1446d83f2: 49 f7 da                    	negq	%r10
1446d83f5: 4f 8d 14 52                 	leaq	(%r10,%r10,2), %r10
1446d83f9: f3 42 0f 6f 64 d1 e8        	movdqu	-0x18(%rcx,%r10,8), %xmm4
1446d8400: 66 0f 74 e1                 	pcmpeqb	%xmm1, %xmm4
1446d8404: 66 44 0f d7 dc              	pmovmskb	%xmm4, %r11d
1446d8409: 41 81 fb ff ff 00 00        	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1446d8410: 74 29                       	je	0x1446d843b <.text+0x46d743b>
1446d8412: 45 8d 51 ff                 	leal	-0x1(%r9), %r10d
1446d8416: 66 45 21 ca                 	andw	%r9w, %r10w
1446d841a: 45 89 d1                    	movl	%r10d, %r9d
1446d841d: 75 c8                       	jne	0x1446d83e7 <.text+0x46d73e7>
1446d841f: 90                          	nop
1446d8420: 66 0f 74 da                 	pcmpeqb	%xmm2, %xmm3
1446d8424: 66 44 0f d7 cb              	pmovmskb	%xmm3, %r9d
1446d8429: 45 85 c9                    	testl	%r9d, %r9d
1446d842c: 75 48                       	jne	0x1446d8476 <.text+0x46d7476>
1446d842e: 4c 01 c0                    	addq	%r8, %rax
1446d8431: 48 83 c0 10                 	addq	$0x10, %rax
1446d8435: 49 83 c0 10                 	addq	$0x10, %r8
1446d8439: eb 92                       	jmp	0x1446d83cd <.text+0x46d73cd>
1446d843b: 4a 8d 04 d1                 	leaq	(%rcx,%r10,8), %rax
1446d843f: 48 8b 40 f8                 	movq	-0x8(%rax), %rax
1446d8443: 48 3b 86 18 02 00 00        	cmpq	0x218(%rsi), %rax
1446d844a: 73 2a                       	jae	0x1446d8476 <.text+0x46d7476>
1446d844c: 4c 8b 86 10 02 00 00        	movq	0x210(%rsi), %r8
1446d8453: 49 8b 04 c0                 	movq	(%r8,%rax,8), %rax
1446d8457: 48 85 c0                    	testq	%rax, %rax
1446d845a: 74 1a                       	je	0x1446d8476 <.text+0x46d7476>
1446d845c: 4c 8b 86 e0 01 00 00        	movq	0x1e0(%rsi), %r8
1446d8463: 48 f7 d0                    	notq	%rax
1446d8466: 48 6b c0 38                 	imulq	$0x38, %rax, %rax
1446d846a: 41 80 7c 00 30 00           	cmpb	$0x0, 0x30(%r8,%rax)
1446d8470: 0f 85 bc 04 00 00           	jne	0x1446d8932 <.text+0x46d7932>
1446d8476: 48 8d 7e 40                 	leaq	0x40(%rsi), %rdi
1446d847a: 48 8d 86 a8 05 00 00        	leaq	0x5a8(%rsi), %rax
1446d8481: 48 89 bd 48 01 00 00        	movq	%rdi, 0x148(%rbp)
1446d8488: 48 89 85 50 01 00 00        	movq	%rax, 0x150(%rbp)
1446d848f: 48 c7 85 30 01 00 00 00 00 00 00    	movq	$0x0, 0x130(%rbp)
1446d849a: 48 c7 85 38 01 00 00 08 00 00 00    	movq	$0x8, 0x138(%rbp)
1446d84a5: 48 c7 85 40 01 00 00 00 00 00 00    	movq	$0x0, 0x140(%rbp)
1446d84b0: 49 b8 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %r8 # imm = 0xF7BE4D58AAC2F35F
1446d84ba: 45 31 c9                    	xorl	%r9d, %r9d
1446d84bd: 66 0f 76 d2                 	pcmpeqd	%xmm2, %xmm2
1446d84c1: 49 21 d0                    	andq	%rdx, %r8
1446d84c4: f3 42 0f 6f 1c 01           	movdqu	(%rcx,%r8), %xmm3
1446d84ca: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
1446d84ce: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
1446d84d2: 66 44 0f d7 d4              	pmovmskb	%xmm4, %r10d
1446d84d7: 45 85 d2                    	testl	%r10d, %r10d
1446d84da: 74 44                       	je	0x1446d8520 <.text+0x46d7520>
1446d84dc: f3 45 0f bc da              	tzcntl	%r10d, %r11d
1446d84e1: 4d 01 c3                    	addq	%r8, %r11
1446d84e4: 49 21 d3                    	andq	%rdx, %r11
1446d84e7: 49 f7 db                    	negq	%r11
1446d84ea: 4f 8d 1c 5b                 	leaq	(%r11,%r11,2), %r11
1446d84ee: f3 42 0f 6f 64 d9 e8        	movdqu	-0x18(%rcx,%r11,8), %xmm4
1446d84f5: 66 0f 74 e1                 	pcmpeqb	%xmm1, %xmm4
1446d84f9: 66 0f d7 dc                 	pmovmskb	%xmm4, %ebx
1446d84fd: 81 fb ff ff 00 00           	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1446d8503: 0f 84 db 02 00 00           	je	0x1446d87e4 <.text+0x46d77e4>
1446d8509: 45 8d 5a ff                 	leal	-0x1(%r10), %r11d
1446d850d: 66 45 21 d3                 	andw	%r10w, %r11w
1446d8511: 45 89 da                    	movl	%r11d, %r10d
1446d8514: 75 c6                       	jne	0x1446d84dc <.text+0x46d74dc>
1446d8516: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1446d8520: 66 0f 74 da                 	pcmpeqb	%xmm2, %xmm3
1446d8524: 66 44 0f d7 d3              	pmovmskb	%xmm3, %r10d
1446d8529: 45 85 d2                    	testl	%r10d, %r10d
1446d852c: 75 47                       	jne	0x1446d8575 <.text+0x46d7575>
1446d852e: 4d 01 c8                    	addq	%r9, %r8
1446d8531: 49 83 c0 10                 	addq	$0x10, %r8
1446d8535: 49 83 c1 10                 	addq	$0x10, %r9
1446d8539: eb 86                       	jmp	0x1446d84c1 <.text+0x46d74c1>
1446d853b: 48 8d 7e 40                 	leaq	0x40(%rsi), %rdi
1446d853f: 48 8d 86 a8 05 00 00        	leaq	0x5a8(%rsi), %rax
1446d8546: 48 89 bd 48 01 00 00        	movq	%rdi, 0x148(%rbp)
1446d854d: 48 89 85 50 01 00 00        	movq	%rax, 0x150(%rbp)
1446d8554: 48 c7 85 30 01 00 00 00 00 00 00    	movq	$0x0, 0x130(%rbp)
1446d855f: 48 c7 85 38 01 00 00 08 00 00 00    	movq	$0x8, 0x138(%rbp)
1446d856a: 48 c7 85 40 01 00 00 00 00 00 00    	movq	$0x0, 0x140(%rbp)
1446d8575: 0f b6 8e a0 00 00 00        	movzbl	0xa0(%rsi), %ecx
1446d857c: 48 8b 8e e0 00 00 00        	movq	0xe0(%rsi), %rcx
1446d8583: 48 8b 96 e8 00 00 00        	movq	0xe8(%rsi), %rdx
1446d858a: 49 b8 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %r8 # imm = 0xF7BE4D58AAC2F35F
1446d8594: 45 31 c9                    	xorl	%r9d, %r9d
1446d8597: 66 0f 6f 05 b1 97 b5 01     	movdqa	0x1b597b1(%rip), %xmm0  # 0x146231d50
1446d859f: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
1446d85a3: 66 0f 6f 15 05 7b b8 01     	movdqa	0x1b87b05(%rip), %xmm2  # 0x1462600b0
1446d85ab: 49 21 d0                    	andq	%rdx, %r8
1446d85ae: f3 42 0f 6f 1c 01           	movdqu	(%rcx,%r8), %xmm3
1446d85b4: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
1446d85b8: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
1446d85bc: 66 0f d7 dc                 	pmovmskb	%xmm4, %ebx
1446d85c0: 85 db                       	testl	%ebx, %ebx
1446d85c2: 74 4c                       	je	0x1446d8610 <.text+0x46d7610>
1446d85c4: f3 44 0f bc db              	tzcntl	%ebx, %r11d
1446d85c9: 4d 01 c3                    	addq	%r8, %r11
1446d85cc: 49 21 d3                    	andq	%rdx, %r11
1446d85cf: 4d 89 de                    	movq	%r11, %r14
1446d85d2: 49 c1 e6 07                 	shlq	$0x7, %r14
1446d85d6: 49 89 ca                    	movq	%rcx, %r10
1446d85d9: 4d 29 f2                    	subq	%r14, %r10
1446d85dc: f3 41 0f 6f 62 80           	movdqu	-0x80(%r10), %xmm4
1446d85e2: 66 0f 74 e2                 	pcmpeqb	%xmm2, %xmm4
1446d85e6: 66 44 0f d7 f4              	pmovmskb	%xmm4, %r14d
1446d85eb: 41 81 fe ff ff 00 00        	cmpl	$0xffff, %r14d          # imm = 0xFFFF
1446d85f2: 74 37                       	je	0x1446d862b <.text+0x46d762b>
1446d85f4: 44 8d 53 ff                 	leal	-0x1(%rbx), %r10d
1446d85f8: 66 41 21 da                 	andw	%bx, %r10w
1446d85fc: 44 89 d3                    	movl	%r10d, %ebx
1446d85ff: 75 c3                       	jne	0x1446d85c4 <.text+0x46d75c4>
1446d8601: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1446d8610: 66 0f 74 d9                 	pcmpeqb	%xmm1, %xmm3
1446d8614: 66 44 0f d7 d3              	pmovmskb	%xmm3, %r10d
1446d8619: 45 85 d2                    	testl	%r10d, %r10d
1446d861c: 75 7f                       	jne	0x1446d869d <.text+0x46d769d>
1446d861e: 4d 01 c8                    	addq	%r9, %r8
1446d8621: 49 83 c0 10                 	addq	$0x10, %r8
1446d8625: 49 83 c1 10                 	addq	$0x10, %r9
1446d8629: eb 80                       	jmp	0x1446d85ab <.text+0x46d75ab>
1446d862b: 4d 8d 43 f0                 	leaq	-0x10(%r11), %r8
1446d862f: 49 21 d0                    	andq	%rdx, %r8
1446d8632: f3 42 0f 6f 04 01           	movdqu	(%rcx,%r8), %xmm0
1446d8638: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
1446d863c: 66 0f 74 c1                 	pcmpeqb	%xmm1, %xmm0
1446d8640: 66 0f d7 d0                 	pmovmskb	%xmm0, %edx
1446d8644: f3 42 0f 6f 04 19           	movdqu	(%rcx,%r11), %xmm0
1446d864a: 66 0f 74 c1                 	pcmpeqb	%xmm1, %xmm0
1446d864e: 66 44 0f d7 c8              	pmovmskb	%xmm0, %r9d
1446d8653: 66 bb 1f 00                 	movw	$0x1f, %bx
1446d8657: 66 0f bd da                 	bsrw	%dx, %bx
1446d865b: 83 f3 0f                    	xorl	$0xf, %ebx
1446d865e: 41 81 c9 00 00 01 00        	orl	$0x10000, %r9d          # imm = 0x10000
1446d8665: f3 45 0f bc c9              	tzcntl	%r9d, %r9d
1446d866a: 41 01 d9                    	addl	%ebx, %r9d
1446d866d: b2 80                       	movb	$-0x80, %dl
1446d866f: 66 41 83 f9 0f              	cmpw	$0xf, %r9w
1446d8674: 77 09                       	ja	0x1446d867f <.text+0x46d767f>
1446d8676: 48 ff 86 f0 00 00 00        	incq	0xf0(%rsi)
1446d867d: b2 ff                       	movb	$-0x1, %dl
1446d867f: 42 88 14 19                 	movb	%dl, (%rcx,%r11)
1446d8683: 42 88 54 01 10              	movb	%dl, 0x10(%rcx,%r8)
1446d8688: 48 ff 8e f8 00 00 00        	decq	0xf8(%rsi)
1446d868f: 49 8b 4a 90                 	movq	-0x70(%r10), %rcx
1446d8693: 48 83 f9 02                 	cmpq	$0x2, %rcx
1446d8697: 0f 85 54 01 00 00           	jne	0x1446d87f1 <.text+0x46d77f1>
1446d869d: 48 8b 18                    	movq	(%rax), %rbx
1446d86a0: 4c 8d 73 01                 	leaq	0x1(%rbx), %r14
1446d86a4: 4c 89 30                    	movq	%r14, (%rax)
1446d86a7: 66 c7 85 28 01 00 00 00 01  	movw	$0x100, 0x128(%rbp)     # imm = 0x100
1446d86b0: 48 c7 85 d8 00 00 00 01 00 00 00    	movq	$0x1, 0xd8(%rbp)
1446d86bb: f3 0f 6f 05 5d e7 68 02     	movdqu	0x268e75d(%rip), %xmm0  # 0x146d66e20
1446d86c3: f3 0f 7f 85 e0 00 00 00     	movdqu	%xmm0, 0xe0(%rbp)
1446d86cb: 48 c7 85 00 01 00 00 08 00 00 00    	movq	$0x8, 0x100(%rbp)
1446d86d6: 48 c7 85 08 01 00 00 48 00 00 00    	movq	$0x48, 0x108(%rbp)
1446d86e1: 48 8d 05 98 4e b9 fb        	leaq	-0x446b168(%rip), %rax  # 0x14026d580 <.text+0x26c580>
1446d86e8: 48 89 85 20 01 00 00        	movq	%rax, 0x120(%rbp)
1446d86ef: c6 85 2a 01 00 00 01        	movb	$0x1, 0x12a(%rbp)
1446d86f6: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1446d8701: c6 85 10 01 00 00 02        	movb	$0x2, 0x110(%rbp)
1446d8708: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1446d870c: 4c 8d 85 d8 00 00 00        	leaq	0xd8(%rbp), %r8
1446d8713: 48 89 da                    	movq	%rbx, %rdx
1446d8716: e8 15 1f 99 00              	callq	0x14506a630 <.text+0x5069630>
1446d871b: 90                          	nop
1446d871c: 4c 39 76 50                 	cmpq	%r14, 0x50(%rsi)
1446d8720: 73 13                       	jae	0x1446d8735 <.text+0x46d7735>
1446d8722: c6 85 67 01 00 00 01        	movb	$0x1, 0x167(%rbp)
1446d8729: 48 89 f9                    	movq	%rdi, %rcx
1446d872c: 4c 89 f2                    	movq	%r14, %rdx
1446d872f: e8 0c e1 a0 fb              	callq	0x1400e6840 <.text+0xe5840>
1446d8734: 90                          	nop
1446d8735: 48 8b 46 48                 	movq	0x48(%rsi), %rax
1446d8739: 48 69 cb 30 01 00 00        	imulq	$0x130, %rbx, %rcx      # imm = 0x130
1446d8740: 48 8d 3c 08                 	leaq	(%rax,%rcx), %rdi
1446d8744: 83 3c 08 02                 	cmpl	$0x2, (%rax,%rcx)
1446d8748: 74 6f                       	je	0x1446d87b9 <.text+0x46d77b9>
1446d874a: 48 89 bd 58 01 00 00        	movq	%rdi, 0x158(%rbp)
1446d8751: 48 8d 4f 58                 	leaq	0x58(%rdi), %rcx
1446d8755: e8 06 84 8b fd              	callq	0x141f90b60 <.text+0x1f8fb60>
1446d875a: 90                          	nop
1446d875b: 48 8b bd 58 01 00 00        	movq	0x158(%rbp), %rdi
1446d8762: 48 8b 87 e8 00 00 00        	movq	0xe8(%rdi), %rax
1446d8769: 48 85 c0                    	testq	%rax, %rax
1446d876c: 74 29                       	je	0x1446d8797 <.text+0x46d7797>
1446d876e: 48 8b 8f e0 00 00 00        	movq	0xe0(%rdi), %rcx
1446d8775: 4c 8d 04 c5 17 00 00 00     	leaq	0x17(,%rax,8), %r8
1446d877d: 49 83 e0 f0                 	andq	$-0x10, %r8
1446d8781: 4a 8d 14 00                 	leaq	(%rax,%r8), %rdx
1446d8785: 48 83 c2 11                 	addq	$0x11, %rdx
1446d8789: 4c 29 c1                    	subq	%r8, %rcx
1446d878c: 41 b8 10 00 00 00           	movl	$0x10, %r8d
1446d8792: e8 39 9a 92 fb              	callq	0x1400021d0 <.text+0x11d0>
1446d8797: 48 8b 97 c8 00 00 00        	movq	0xc8(%rdi), %rdx
1446d879e: 48 85 d2                    	testq	%rdx, %rdx
1446d87a1: 74 16                       	je	0x1446d87b9 <.text+0x46d77b9>
1446d87a3: 48 8b 8f d0 00 00 00        	movq	0xd0(%rdi), %rcx
1446d87aa: 48 c1 e2 04                 	shlq	$0x4, %rdx
1446d87ae: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1446d87b4: e8 17 9a 92 fb              	callq	0x1400021d0 <.text+0x11d0>
1446d87b9: 48 8d 55 a8                 	leaq	-0x58(%rbp), %rdx
1446d87bd: 41 b8 30 01 00 00           	movl	$0x130, %r8d            # imm = 0x130
1446d87c3: 48 89 f9                    	movq	%rdi, %rcx
1446d87c6: e8 50 8f 98 01              	callq	0x14606171b <.text+0x606071b>
1446d87cb: 48 8d 4e 78                 	leaq	0x78(%rsi), %rcx
1446d87cf: 48 8d 15 4a e6 68 02        	leaq	0x268e64a(%rip), %rdx   # 0x146d66e20
1446d87d6: 49 89 d8                    	movq	%rbx, %r8
1446d87d9: e8 62 52 99 fb              	callq	0x14006da40 <.text+0x6ca40>
1446d87de: 90                          	nop
1446d87df: e9 8d 00 00 00              	jmp	0x1446d8871 <.text+0x46d7871>
1446d87e4: 4a 8d 04 d9                 	leaq	(%rcx,%r11,8), %rax
1446d87e8: 48 8b 58 f8                 	movq	-0x8(%rax), %rbx
1446d87ec: e9 80 00 00 00              	jmp	0x1446d8871 <.text+0x46d7871>
1446d87f1: 49 8b 42 f8                 	movq	-0x8(%r10), %rax
1446d87f5: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1446d87f9: 41 0f 10 42 e8              	movups	-0x18(%r10), %xmm0
1446d87fe: 0f 11 45 00                 	movups	%xmm0, (%rbp)
1446d8802: 41 0f 10 42 d8              	movups	-0x28(%r10), %xmm0
1446d8807: 0f 11 45 f0                 	movups	%xmm0, -0x10(%rbp)
1446d880b: f3 41 0f 6f 42 98           	movdqu	-0x68(%r10), %xmm0
1446d8811: f3 41 0f 6f 4a a8           	movdqu	-0x58(%r10), %xmm1
1446d8817: f3 41 0f 6f 52 b8           	movdqu	-0x48(%r10), %xmm2
1446d881d: f3 41 0f 6f 5a c8           	movdqu	-0x38(%r10), %xmm3
1446d8823: f3 0f 7f 5d e0              	movdqu	%xmm3, -0x20(%rbp)
1446d8828: f3 0f 7f 55 d0              	movdqu	%xmm2, -0x30(%rbp)
1446d882d: f3 0f 7f 4d c0              	movdqu	%xmm1, -0x40(%rbp)
1446d8832: f3 0f 7f 45 b0              	movdqu	%xmm0, -0x50(%rbp)
1446d8837: 48 89 4d a8                 	movq	%rcx, -0x58(%rbp)
1446d883b: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1446d883f: 48 8d 95 30 01 00 00        	leaq	0x130(%rbp), %rdx
1446d8846: e8 35 66 95 00              	callq	0x14502ee80 <.text+0x502de80>
1446d884b: 90                          	nop
1446d884c: 48 89 c3                    	movq	%rax, %rbx
1446d884f: 48 8b 95 30 01 00 00        	movq	0x130(%rbp), %rdx
1446d8856: 48 85 d2                    	testq	%rdx, %rdx
1446d8859: 74 16                       	je	0x1446d8871 <.text+0x46d7871>
1446d885b: 48 8b 8d 38 01 00 00        	movq	0x138(%rbp), %rcx
1446d8862: 48 c1 e2 03                 	shlq	$0x3, %rdx
1446d8866: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1446d886c: e8 5f 99 92 fb              	callq	0x1400021d0 <.text+0x11d0>
1446d8871: 48 3b 9e 18 02 00 00        	cmpq	0x218(%rsi), %rbx
1446d8878: 73 25                       	jae	0x1446d889f <.text+0x46d789f>
1446d887a: 48 8b 86 10 02 00 00        	movq	0x210(%rsi), %rax
1446d8881: 48 8b 04 d8                 	movq	(%rax,%rbx,8), %rax
1446d8885: 48 85 c0                    	testq	%rax, %rax
1446d8888: 74 15                       	je	0x1446d889f <.text+0x46d789f>
1446d888a: 48 8b 8e e0 01 00 00        	movq	0x1e0(%rsi), %rcx
1446d8891: 48 f7 d0                    	notq	%rax
1446d8894: 48 6b c0 38                 	imulq	$0x38, %rax, %rax
1446d8898: 80 7c 01 30 00              	cmpb	$0x0, 0x30(%rcx,%rax)
1446d889d: 75 45                       	jne	0x1446d88e4 <.text+0x46d78e4>
1446d889f: 48 c7 45 a8 00 00 00 00     	movq	$0x0, -0x58(%rbp)
1446d88a7: 48 c7 45 b0 08 00 00 00     	movq	$0x8, -0x50(%rbp)
1446d88af: 66 0f ef c0                 	pxor	%xmm0, %xmm0
1446d88b3: f3 0f 7f 45 b8              	movdqu	%xmm0, -0x48(%rbp)
1446d88b8: 48 c7 45 c8 00 00 00 00     	movq	$0x0, -0x38(%rbp)
1446d88c0: 48 c7 45 d0 08 00 00 00     	movq	$0x8, -0x30(%rbp)
1446d88c8: f3 0f 7f 45 d8              	movdqu	%xmm0, -0x28(%rbp)
1446d88cd: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
1446d88d5: 4c 8d 45 a8                 	leaq	-0x58(%rbp), %r8
1446d88d9: 48 89 f1                    	movq	%rsi, %rcx
1446d88dc: 48 89 da                    	movq	%rbx, %rdx
1446d88df: e8 7c 18 00 00              	callq	0x1446da160 <.text+0x46d9160>
1446d88e4: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1446d88e8: 48 89 f2                    	movq	%rsi, %rdx
1446d88eb: e8 80 fc fe ff              	callq	0x1446c8570 <.text+0x46c7570>
1446d88f0: 8b 45 c4                    	movl	-0x3c(%rbp), %eax
1446d88f3: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
1446d88f7: 89 01                       	movl	%eax, (%rcx)
1446d88f9: 48 8b 7d a8                 	movq	-0x58(%rbp), %rdi
1446d88fd: 4c 8b 77 10                 	movq	0x10(%rdi), %r14
1446d8901: 4c 3b 37                    	cmpq	(%rdi), %r14
1446d8904: 75 08                       	jne	0x1446d890e <.text+0x46d790e>
1446d8906: 48 89 f9                    	movq	%rdi, %rcx
1446d8909: e8 c2 92 98 01              	callq	0x146061bd0 <.text+0x6060bd0>
1446d890e: 48 8b 47 08                 	movq	0x8(%rdi), %rax
1446d8912: 4b 8d 0c 76                 	leaq	(%r14,%r14,2), %rcx
1446d8916: 48 8d 15 33 38 00 00        	leaq	0x3833(%rip), %rdx      # 0x1446dc150 <.text+0x46db150>
1446d891d: 48 89 14 c8                 	movq	%rdx, (%rax,%rcx,8)
1446d8921: 48 89 5c c8 08              	movq	%rbx, 0x8(%rax,%rcx,8)
1446d8926: c6 44 c8 10 00              	movb	$0x0, 0x10(%rax,%rcx,8)
1446d892b: 49 ff c6                    	incq	%r14
1446d892e: 4c 89 77 10                 	movq	%r14, 0x10(%rdi)
1446d8932: 48 89 f0                    	movq	%rsi, %rax
1446d8935: 48 81 c4 f0 01 00 00        	addq	$0x1f0, %rsp            # imm = 0x1F0
1446d893c: 5b                          	popq	%rbx
1446d893d: 5f                          	popq	%rdi
1446d893e: 5e                          	popq	%rsi
1446d893f: 41 5e                       	popq	%r14
1446d8941: 5d                          	popq	%rbp
1446d8942: c3                          	retq

# ime-buffer-drop

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14026d580: 56                          	pushq	%rsi
14026d581: 57                          	pushq	%rdi
14026d582: 53                          	pushq	%rbx
14026d583: 48 83 ec 20                 	subq	$0x20, %rsp
14026d587: 48 89 ce                    	movq	%rcx, %rsi
14026d58a: 48 8b 79 10                 	movq	0x10(%rcx), %rdi
14026d58e: 48 85 ff                    	testq	%rdi, %rdi
14026d591: 74 5d                       	je	0x14026d5f0 <.text+0x26c5f0>
14026d593: 48 8b 5e 08                 	movq	0x8(%rsi), %rbx
14026d597: eb 10                       	jmp	0x14026d5a9 <.text+0x26c5a9>
14026d599: 0f 1f 80 00 00 00 00        	nopl	(%rax)
14026d5a0: 48 83 c3 40                 	addq	$0x40, %rbx
14026d5a4: 48 ff cf                    	decq	%rdi
14026d5a7: 74 47                       	je	0x14026d5f0 <.text+0x26c5f0>
14026d5a9: 48 8b 0b                    	movq	(%rbx), %rcx
14026d5ac: 48 83 f9 01                 	cmpq	$0x1, %rcx
14026d5b0: 48 83 d1 ff                 	adcq	$-0x1, %rcx
14026d5b4: 48 83 f9 01                 	cmpq	$0x1, %rcx
14026d5b8: 74 16                       	je	0x14026d5d0 <.text+0x26c5d0>
14026d5ba: b8 18 00 00 00              	movl	$0x18, %eax
14026d5bf: 48 85 c9                    	testq	%rcx, %rcx
14026d5c2: 75 dc                       	jne	0x14026d5a0 <.text+0x26c5a0>
14026d5c4: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
14026d5c8: 48 85 d2                    	testq	%rdx, %rdx
14026d5cb: 75 11                       	jne	0x14026d5de <.text+0x26c5de>
14026d5cd: eb d1                       	jmp	0x14026d5a0 <.text+0x26c5a0>
14026d5cf: 90                          	nop
14026d5d0: b8 08 00 00 00              	movl	$0x8, %eax
14026d5d5: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
14026d5d9: 48 85 d2                    	testq	%rdx, %rdx
14026d5dc: 74 c2                       	je	0x14026d5a0 <.text+0x26c5a0>
14026d5de: 48 8b 4c 18 08              	movq	0x8(%rax,%rbx), %rcx
14026d5e3: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14026d5e9: e8 e2 4b d9 ff              	callq	0x1400021d0 <.text+0x11d0>
14026d5ee: eb b0                       	jmp	0x14026d5a0 <.text+0x26c5a0>
14026d5f0: 48 8b 16                    	movq	(%rsi), %rdx
14026d5f3: 48 85 d2                    	testq	%rdx, %rdx
14026d5f6: 74 13                       	je	0x14026d60b <.text+0x26c60b>
14026d5f8: 48 8b 4e 08                 	movq	0x8(%rsi), %rcx
14026d5fc: 48 c1 e2 06                 	shlq	$0x6, %rdx
14026d600: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14026d606: e8 c5 4b d9 ff              	callq	0x1400021d0 <.text+0x11d0>
14026d60b: 48 8b 7e 30                 	movq	0x30(%rsi), %rdi
14026d60f: 48 85 ff                    	testq	%rdi, %rdi
14026d612: 74 5c                       	je	0x14026d670 <.text+0x26c670>
14026d614: 48 8b 5e 28                 	movq	0x28(%rsi), %rbx
14026d618: eb 0f                       	jmp	0x14026d629 <.text+0x26c629>
14026d61a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14026d620: 48 83 c3 40                 	addq	$0x40, %rbx
14026d624: 48 ff cf                    	decq	%rdi
14026d627: 74 47                       	je	0x14026d670 <.text+0x26c670>
14026d629: 48 8b 0b                    	movq	(%rbx), %rcx
14026d62c: 48 83 f9 01                 	cmpq	$0x1, %rcx
14026d630: 48 83 d1 ff                 	adcq	$-0x1, %rcx
14026d634: 48 83 f9 01                 	cmpq	$0x1, %rcx
14026d638: 74 16                       	je	0x14026d650 <.text+0x26c650>
14026d63a: b8 18 00 00 00              	movl	$0x18, %eax
14026d63f: 48 85 c9                    	testq	%rcx, %rcx
14026d642: 75 dc                       	jne	0x14026d620 <.text+0x26c620>
14026d644: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
14026d648: 48 85 d2                    	testq	%rdx, %rdx
14026d64b: 75 11                       	jne	0x14026d65e <.text+0x26c65e>
14026d64d: eb d1                       	jmp	0x14026d620 <.text+0x26c620>
14026d64f: 90                          	nop
14026d650: b8 08 00 00 00              	movl	$0x8, %eax
14026d655: 48 8b 14 18                 	movq	(%rax,%rbx), %rdx
14026d659: 48 85 d2                    	testq	%rdx, %rdx
14026d65c: 74 c2                       	je	0x14026d620 <.text+0x26c620>
14026d65e: 48 8b 4c 18 08              	movq	0x8(%rax,%rbx), %rcx
14026d663: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14026d669: e8 62 4b d9 ff              	callq	0x1400021d0 <.text+0x11d0>
14026d66e: eb b0                       	jmp	0x14026d620 <.text+0x26c620>
14026d670: 48 8b 56 20                 	movq	0x20(%rsi), %rdx
14026d674: 48 85 d2                    	testq	%rdx, %rdx
14026d677: 74 1a                       	je	0x14026d693 <.text+0x26c693>
14026d679: 48 8b 4e 28                 	movq	0x28(%rsi), %rcx
14026d67d: 48 c1 e2 06                 	shlq	$0x6, %rdx
14026d681: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14026d687: 48 83 c4 20                 	addq	$0x20, %rsp
14026d68b: 5b                          	popq	%rbx
14026d68c: 5f                          	popq	%rdi
14026d68d: 5e                          	popq	%rsi
14026d68e: e9 3d 4b d9 ff              	jmp	0x1400021d0 <.text+0x11d0>
14026d693: 48 83 c4 20                 	addq	$0x20, %rsp
14026d697: 5b                          	popq	%rbx
14026d698: 5f                          	popq	%rdi
14026d699: 5e                          	popq	%rsi
14026d69a: c3                          	retq

# ime-buffer-update

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1446dc150: 56                          	pushq	%rsi
1446dc151: 57                          	pushq	%rdi
1446dc152: 53                          	pushq	%rbx
1446dc153: 48 83 ec 20                 	subq	$0x20, %rsp
1446dc157: 48 8b 31                    	movq	(%rcx), %rsi
1446dc15a: 0f 10 46 20                 	movups	0x20(%rsi), %xmm0
1446dc15e: 48 8b 7e 08                 	movq	0x8(%rsi), %rdi
1446dc162: 0f 10 0e                    	movups	(%rsi), %xmm1
1446dc165: 0f 11 06                    	movups	%xmm0, (%rsi)
1446dc168: 0f 11 4e 20                 	movups	%xmm1, 0x20(%rsi)
1446dc16c: 48 8b 5e 10                 	movq	0x10(%rsi), %rbx
1446dc170: 0f 10 46 30                 	movups	0x30(%rsi), %xmm0
1446dc174: 0f 11 46 10                 	movups	%xmm0, 0x10(%rsi)
1446dc178: 48 c7 46 30 00 00 00 00     	movq	$0x0, 0x30(%rsi)
1446dc180: 48 85 db                    	testq	%rbx, %rbx
1446dc183: 75 24                       	jne	0x1446dc1a9 <.text+0x46db1a9>
1446dc185: 48 8b 46 40                 	movq	0x40(%rsi), %rax
1446dc189: 48 89 46 38                 	movq	%rax, 0x38(%rsi)
1446dc18d: 48 83 c4 20                 	addq	$0x20, %rsp
1446dc191: 5b                          	popq	%rbx
1446dc192: 5f                          	popq	%rdi
1446dc193: 5e                          	popq	%rsi
1446dc194: c3                          	retq
1446dc195: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1446dc1a0: 48 83 c7 40                 	addq	$0x40, %rdi
1446dc1a4: 48 ff cb                    	decq	%rbx
1446dc1a7: 74 dc                       	je	0x1446dc185 <.text+0x46db185>
1446dc1a9: 48 8b 0f                    	movq	(%rdi), %rcx
1446dc1ac: 48 83 f9 01                 	cmpq	$0x1, %rcx
1446dc1b0: 48 83 d1 ff                 	adcq	$-0x1, %rcx
1446dc1b4: 48 83 f9 01                 	cmpq	$0x1, %rcx
1446dc1b8: 74 16                       	je	0x1446dc1d0 <.text+0x46db1d0>
1446dc1ba: b8 18 00 00 00              	movl	$0x18, %eax
1446dc1bf: 48 85 c9                    	testq	%rcx, %rcx
1446dc1c2: 75 dc                       	jne	0x1446dc1a0 <.text+0x46db1a0>
1446dc1c4: 48 8b 14 38                 	movq	(%rax,%rdi), %rdx
1446dc1c8: 48 85 d2                    	testq	%rdx, %rdx
1446dc1cb: 75 11                       	jne	0x1446dc1de <.text+0x46db1de>
1446dc1cd: eb d1                       	jmp	0x1446dc1a0 <.text+0x46db1a0>
1446dc1cf: 90                          	nop
1446dc1d0: b8 08 00 00 00              	movl	$0x8, %eax
1446dc1d5: 48 8b 14 38                 	movq	(%rax,%rdi), %rdx
1446dc1d9: 48 85 d2                    	testq	%rdx, %rdx
1446dc1dc: 74 c2                       	je	0x1446dc1a0 <.text+0x46db1a0>
1446dc1de: 48 8b 4c 38 08              	movq	0x8(%rax,%rdi), %rcx
1446dc1e3: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1446dc1e9: e8 e2 5f 92 fb              	callq	0x1400021d0 <.text+0x11d0>
1446dc1ee: eb b0                       	jmp	0x1446dc1a0 <.text+0x46db1a0>

# ime-event-publication

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1425dbb6a: 48 83 be 90 00 00 00 00     	cmpq	$0x0, 0x90(%rsi)
1425dbb72: 0f 84 ba 01 00 00           	je	0x1425dbd32 <.text+0x25dad32>
1425dbb78: 48 8b 46 78                 	movq	0x78(%rsi), %rax
1425dbb7c: 48 8b 8e 80 00 00 00        	movq	0x80(%rsi), %rcx
1425dbb83: 48 ba 5f f3 c2 aa 58 4d be f7       	movabsq	$-0x841b2a7553d0ca1, %rdx # imm = 0xF7BE4D58AAC2F35F
1425dbb8d: 45 31 c0                    	xorl	%r8d, %r8d
1425dbb90: 48 21 ca                    	andq	%rcx, %rdx
1425dbb93: f3 0f 6f 04 10              	movdqu	(%rax,%rdx), %xmm0
1425dbb98: 66 0f 6f 0d b0 61 c5 03     	movdqa	0x3c561b0(%rip), %xmm1  # 0x146231d50
1425dbba0: 66 0f 74 c8                 	pcmpeqb	%xmm0, %xmm1
1425dbba4: 66 44 0f d7 c9              	pmovmskb	%xmm1, %r9d
1425dbba9: 45 85 c9                    	testl	%r9d, %r9d
1425dbbac: 74 3c                       	je	0x1425dbbea <.text+0x25dabea>
1425dbbae: f3 45 0f bc d1              	tzcntl	%r9d, %r10d
1425dbbb3: 49 01 d2                    	addq	%rdx, %r10
1425dbbb6: 49 21 ca                    	andq	%rcx, %r10
1425dbbb9: 49 f7 da                    	negq	%r10
1425dbbbc: 4f 8d 14 52                 	leaq	(%r10,%r10,2), %r10
1425dbbc0: f3 42 0f 6f 4c d0 e8        	movdqu	-0x18(%rax,%r10,8), %xmm1
1425dbbc7: 66 0f 74 0d e1 44 c8 03     	pcmpeqb	0x3c844e1(%rip), %xmm1  # 0x1462600b0
1425dbbcf: 66 44 0f d7 d9              	pmovmskb	%xmm1, %r11d
1425dbbd4: 41 81 fb ff ff 00 00        	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1425dbbdb: 74 30                       	je	0x1425dbc0d <.text+0x25dac0d>
1425dbbdd: 45 8d 51 ff                 	leal	-0x1(%r9), %r10d
1425dbbe1: 66 45 21 ca                 	andw	%r9w, %r10w
1425dbbe5: 45 89 d1                    	movl	%r10d, %r9d
1425dbbe8: 75 c4                       	jne	0x1425dbbae <.text+0x25dabae>
1425dbbea: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
1425dbbee: 66 0f 74 c1                 	pcmpeqb	%xmm1, %xmm0
1425dbbf2: 66 44 0f d7 c8              	pmovmskb	%xmm0, %r9d
1425dbbf7: 45 85 c9                    	testl	%r9d, %r9d
1425dbbfa: 0f 85 32 01 00 00           	jne	0x1425dbd32 <.text+0x25dad32>
1425dbc00: 4c 01 c2                    	addq	%r8, %rdx
1425dbc03: 48 83 c2 10                 	addq	$0x10, %rdx
1425dbc07: 49 83 c0 10                 	addq	$0x10, %r8
1425dbc0b: eb 83                       	jmp	0x1425dbb90 <.text+0x25dab90>
1425dbc0d: 4a 8d 04 d0                 	leaq	(%rax,%r10,8), %rax
1425dbc11: 48 8b 40 f8                 	movq	-0x8(%rax), %rax
1425dbc15: 48 3b 86 18 02 00 00        	cmpq	0x218(%rsi), %rax
1425dbc1c: 0f 83 10 01 00 00           	jae	0x1425dbd32 <.text+0x25dad32>
1425dbc22: 48 8b 8e 10 02 00 00        	movq	0x210(%rsi), %rcx
1425dbc29: 48 8b 0c c1                 	movq	(%rcx,%rax,8), %rcx
1425dbc2d: 48 85 c9                    	testq	%rcx, %rcx
1425dbc30: 0f 84 fc 00 00 00           	je	0x1425dbd32 <.text+0x25dad32>
1425dbc36: 48 8b 86 e0 01 00 00        	movq	0x1e0(%rsi), %rax
1425dbc3d: 48 f7 d1                    	notq	%rcx
1425dbc40: 48 6b c9 38                 	imulq	$0x38, %rcx, %rcx
1425dbc44: 80 7c 08 30 00              	cmpb	$0x0, 0x30(%rax,%rcx)
1425dbc49: 0f 84 e3 00 00 00           	je	0x1425dbd32 <.text+0x25dad32>
1425dbc4f: 48 01 c8                    	addq	%rcx, %rax
1425dbc52: 48 8b 78 10                 	movq	0x10(%rax), %rdi
1425dbc56: 8b 8e b0 05 00 00           	movl	0x5b0(%rsi), %ecx
1425dbc5c: 89 48 2c                    	movl	%ecx, 0x2c(%rax)
1425dbc5f: 48 8b 47 40                 	movq	0x40(%rdi), %rax
1425dbc63: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1425dbc6a: f3 0f 6f 45 c0              	movdqu	-0x40(%rbp), %xmm0
1425dbc6f: f3 0f 6f 4d d0              	movdqu	-0x30(%rbp), %xmm1
1425dbc74: f3 0f 6f 55 e0              	movdqu	-0x20(%rbp), %xmm2
1425dbc79: 66 0f 7f 85 30 01 00 00     	movdqa	%xmm0, 0x130(%rbp)
1425dbc81: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
1425dbc85: 48 89 8d 60 01 00 00        	movq	%rcx, 0x160(%rbp)
1425dbc8c: 66 0f 7f 95 50 01 00 00     	movdqa	%xmm2, 0x150(%rbp)
1425dbc94: 66 0f 7f 8d 40 01 00 00     	movdqa	%xmm1, 0x140(%rbp)
1425dbc9c: 48 8d 8d b0 00 00 00        	leaq	0xb0(%rbp), %rcx
1425dbca3: 48 89 8d 68 01 00 00        	movq	%rcx, 0x168(%rbp)
1425dbcaa: 48 8b 9d 30 01 00 00        	movq	0x130(%rbp), %rbx
1425dbcb1: 45 31 c0                    	xorl	%r8d, %r8d
1425dbcb4: 48 83 fb ff                 	cmpq	$-0x1, %rbx
1425dbcb8: 41 0f 95 c0                 	setne	%r8b
1425dbcbc: 48 8b 4f 20                 	movq	0x20(%rdi), %rcx
1425dbcc0: 48 8b 57 30                 	movq	0x30(%rdi), %rdx
1425dbcc4: 48 29 d1                    	subq	%rdx, %rcx
1425dbcc7: 4c 39 c1                    	cmpq	%r8, %rcx
1425dbcca: 0f 82 cb 1b 00 00           	jb	0x1425dd89b <.text+0x25dc89b>
1425dbcd0: 48 83 fb ff                 	cmpq	$-0x1, %rbx
1425dbcd4: 0f 84 dd 02 00 00           	je	0x1425dbfb7 <.text+0x25dafb7>
1425dbcda: 48 8b 4f 28                 	movq	0x28(%rdi), %rcx
1425dbcde: 4c 8d 40 01                 	leaq	0x1(%rax), %r8
1425dbce2: 4c 89 85 b0 00 00 00        	movq	%r8, 0xb0(%rbp)
1425dbce9: 49 89 d0                    	movq	%rdx, %r8
1425dbcec: 49 c1 e0 06                 	shlq	$0x6, %r8
1425dbcf0: 4a 89 1c 01                 	movq	%rbx, (%rcx,%r8)
1425dbcf4: 4c 8d 4d c8                 	leaq	-0x38(%rbp), %r9
1425dbcf8: f3 41 0f 6f 01              	movdqu	(%r9), %xmm0
1425dbcfd: f3 41 0f 6f 49 10           	movdqu	0x10(%r9), %xmm1
1425dbd03: f3 41 0f 6f 51 20           	movdqu	0x20(%r9), %xmm2
1425dbd09: f3 42 0f 7f 44 01 08        	movdqu	%xmm0, 0x8(%rcx,%r8)
1425dbd10: f3 42 0f 7f 4c 01 18        	movdqu	%xmm1, 0x18(%rcx,%r8)
1425dbd17: f3 42 0f 7f 54 01 28        	movdqu	%xmm2, 0x28(%rcx,%r8)
1425dbd1e: 4a 89 44 01 38              	movq	%rax, 0x38(%rcx,%r8)
1425dbd23: 48 ff c2                    	incq	%rdx
1425dbd26: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
1425dbd2d: e9 85 02 00 00              	jmp	0x1425dbfb7 <.text+0x25dafb7>

# preupdate-before-input

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402b8214: 48 8b 0d 25 f5 39 08        	movq	0x839f525(%rip), %rcx   # 0x148657740
1402b821b: 4c 8d 05 de 07 f9 05        	leaq	0x5f907de(%rip), %r8    # 0x146248a00
1402b8222: 48 8d 95 97 00 00 00        	leaq	0x97(%rbp), %rdx
1402b8229: e8 82 66 fc ff              	callq	0x14027e8b0 <.text+0x27d8b0>
1402b822e: 90                          	nop
1402b822f: 49 89 d0                    	movq	%rdx, %r8
1402b8232: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1402b8236: 48 89 c2                    	movq	%rax, %rdx
1402b8239: e8 b2 c7 f5 ff              	callq	0x1402149f0 <.text+0x2139f0>
1402b823e: 90                          	nop
1402b823f: 0f 28 45 10                 	movaps	0x10(%rbp), %xmm0
1402b8243: 0f 29 85 80 00 00 00        	movaps	%xmm0, 0x80(%rbp)
1402b824a: 0f 28 45 00                 	movaps	(%rbp), %xmm0
1402b824e: 0f 29 45 70                 	movaps	%xmm0, 0x70(%rbp)
1402b8252: 0f 28 45 f0                 	movaps	-0x10(%rbp), %xmm0
1402b8256: 0f 29 45 60                 	movaps	%xmm0, 0x60(%rbp)
1402b825a: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1402b825e: 0f 28 4d c0                 	movaps	-0x40(%rbp), %xmm1
1402b8262: 0f 28 55 d0                 	movaps	-0x30(%rbp), %xmm2
1402b8266: 0f 28 5d e0                 	movaps	-0x20(%rbp), %xmm3
1402b826a: 0f 29 5d 50                 	movaps	%xmm3, 0x50(%rbp)
1402b826e: 0f 29 55 40                 	movaps	%xmm2, 0x40(%rbp)
1402b8272: 0f 29 4d 30                 	movaps	%xmm1, 0x30(%rbp)
1402b8276: 0f 29 45 20                 	movaps	%xmm0, 0x20(%rbp)
1402b827a: 48 8d 55 20                 	leaq	0x20(%rbp), %rdx
1402b827e: 48 89 f1                    	movq	%rsi, %rcx
1402b8281: e8 3a d3 e5 ff              	callq	0x1401155c0 <.text+0x1145c0>

# before-config

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402149f0: 55                          	pushq	%rbp
1402149f1: 41 56                       	pushq	%r14
1402149f3: 56                          	pushq	%rsi
1402149f4: 57                          	pushq	%rdi
1402149f5: 53                          	pushq	%rbx
1402149f6: 48 83 ec 60                 	subq	$0x60, %rsp
1402149fa: 48 8d 6c 24 60              	leaq	0x60(%rsp), %rbp
1402149ff: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
140214a07: 4c 89 c7                    	movq	%r8, %rdi
140214a0a: 48 89 d3                    	movq	%rdx, %rbx
140214a0d: 48 89 ce                    	movq	%rcx, %rsi
140214a10: 48 83 39 ff                 	cmpq	$-0x1, (%rcx)
140214a14: 74 59                       	je	0x140214a6f <.text+0x213a6f>
140214a16: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
140214a1a: 31 d2                       	xorl	%edx, %edx
140214a1c: 49 89 d8                    	movq	%rbx, %r8
140214a1f: 49 89 f9                    	movq	%rdi, %r9
140214a22: e8 99 93 e1 04              	callq	0x14502ddc0 <.text+0x502cdc0>
140214a27: 48 8b 7e 28                 	movq	0x28(%rsi), %rdi
140214a2b: 48 3b 7e 18                 	cmpq	0x18(%rsi), %rdi
140214a2f: 75 0a                       	jne	0x140214a3b <.text+0x213a3b>
140214a31: 48 8d 4e 18                 	leaq	0x18(%rsi), %rcx
140214a35: e8 36 d4 e4 05              	callq	0x146061e70 <.text+0x6060e70>
140214a3a: 90                          	nop
140214a3b: 48 8b 46 20                 	movq	0x20(%rsi), %rax
140214a3f: 48 6b cf 38                 	imulq	$0x38, %rdi, %rcx
140214a43: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
140214a47: 48 89 54 08 30              	movq	%rdx, 0x30(%rax,%rcx)
140214a4c: 0f 10 45 c0                 	movups	-0x40(%rbp), %xmm0
140214a50: 0f 10 4d d0                 	movups	-0x30(%rbp), %xmm1
140214a54: 0f 10 55 e0                 	movups	-0x20(%rbp), %xmm2
140214a58: 0f 11 54 08 20              	movups	%xmm2, 0x20(%rax,%rcx)
140214a5d: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
140214a62: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
140214a66: 48 ff c7                    	incq	%rdi
140214a69: 48 89 7e 28                 	movq	%rdi, 0x28(%rsi)
140214a6d: eb 29                       	jmp	0x140214a98 <.text+0x213a98>
140214a6f: 48 8b 46 18                 	movq	0x18(%rsi), %rax
140214a73: 48 85 c0                    	testq	%rax, %rax
140214a76: 74 20                       	je	0x140214a98 <.text+0x213a98>
140214a78: 48 8b 4e 10                 	movq	0x10(%rsi), %rcx
140214a7c: 48 6b f0 70                 	imulq	$0x70, %rax, %rsi
140214a80: 4c 8d 71 70                 	leaq	0x70(%rcx), %r14
140214a84: 48 89 da                    	movq	%rbx, %rdx
140214a87: 49 89 f8                    	movq	%rdi, %r8
140214a8a: e8 61 ff ff ff              	callq	0x1402149f0 <.text+0x2139f0>
140214a8f: 4c 89 f1                    	movq	%r14, %rcx
140214a92: 48 83 c6 90                 	addq	$-0x70, %rsi
140214a96: 75 e8                       	jne	0x140214a80 <.text+0x213a80>
140214a98: 48 83 c4 60                 	addq	$0x60, %rsp
140214a9c: 5b                          	popq	%rbx
140214a9d: 5f                          	popq	%rdi
140214a9e: 5e                          	popq	%rsi
140214a9f: 41 5e                       	popq	%r14
140214aa1: 5d                          	popq	%rbp
140214aa2: c3                          	retq

# dependency-record

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14502ddc0: 48 89 c8                    	movq	%rcx, %rax
14502ddc3: 88 51 30                    	movb	%dl, 0x30(%rcx)
14502ddc6: 4c 89 01                    	movq	%r8, (%rcx)
14502ddc9: 4c 89 49 08                 	movq	%r9, 0x8(%rcx)
14502ddcd: 0f 10 05 4c 2e f6 01        	movups	0x1f62e4c(%rip), %xmm0  # 0x146f90c20
14502ddd4: 0f 11 41 10                 	movups	%xmm0, 0x10(%rcx)
14502ddd8: 0f 10 05 51 2e f6 01        	movups	0x1f62e51(%rip), %xmm0  # 0x146f90c30
14502dddf: 0f 11 41 20                 	movups	%xmm0, 0x20(%rcx)
14502dde3: c3                          	retq

# add-system-route

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401155c0: 55                          	pushq	%rbp
1401155c1: 56                          	pushq	%rsi
1401155c2: 57                          	pushq	%rdi
1401155c3: 48 81 ec b0 00 00 00        	subq	$0xb0, %rsp
1401155ca: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1401155d2: 48 c7 45 28 fe ff ff ff     	movq	$-0x2, 0x28(%rbp)
1401155da: 48 83 b9 90 00 00 00 00     	cmpq	$0x0, 0x90(%rcx)
1401155e2: 48 89 55 18                 	movq	%rdx, 0x18(%rbp)
1401155e6: 0f 84 42 01 00 00           	je	0x14011572e <.text+0x11472e>
1401155ec: 48 89 ce                    	movq	%rcx, %rsi
1401155ef: 48 8b 41 78                 	movq	0x78(%rcx), %rax
1401155f3: 48 8b 89 80 00 00 00        	movq	0x80(%rcx), %rcx
1401155fa: 48 bf 39 0b 54 95 7e eb 79 13       	movabsq	$0x1379eb7e95540b39, %rdi # imm = 0x1379EB7E95540B39
140115604: 45 31 c0                    	xorl	%r8d, %r8d
140115607: 66 0f 6f 05 21 c4 11 06     	movdqa	0x611c421(%rip), %xmm0  # 0x146231a30
14011560f: 66 0f 76 c9                 	pcmpeqd	%xmm1, %xmm1
140115613: 66 0f 6f 15 c5 6f 13 06     	movdqa	0x6136fc5(%rip), %xmm2  # 0x14624c5e0
14011561b: 48 21 cf                    	andq	%rcx, %rdi
14011561e: f3 0f 6f 1c 38              	movdqu	(%rax,%rdi), %xmm3
140115623: 66 0f 6f e3                 	movdqa	%xmm3, %xmm4
140115627: 66 0f 74 e0                 	pcmpeqb	%xmm0, %xmm4
14011562b: 66 44 0f d7 cc              	pmovmskb	%xmm4, %r9d
140115630: 45 85 c9                    	testl	%r9d, %r9d
140115633: 74 3b                       	je	0x140115670 <.text+0x114670>
140115635: f3 45 0f bc d1              	tzcntl	%r9d, %r10d
14011563a: 49 01 fa                    	addq	%rdi, %r10
14011563d: 49 21 ca                    	andq	%rcx, %r10
140115640: 49 f7 da                    	negq	%r10
140115643: 4f 8d 14 52                 	leaq	(%r10,%r10,2), %r10
140115647: f3 42 0f 6f 64 d0 e8        	movdqu	-0x18(%rax,%r10,8), %xmm4
14011564e: 66 0f 74 e2                 	pcmpeqb	%xmm2, %xmm4
140115652: 66 44 0f d7 dc              	pmovmskb	%xmm4, %r11d
140115657: 41 81 fb ff ff 00 00        	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14011565e: 74 2f                       	je	0x14011568f <.text+0x11468f>
140115660: 45 8d 51 ff                 	leal	-0x1(%r9), %r10d
140115664: 66 45 21 ca                 	andw	%r9w, %r10w
140115668: 45 89 d1                    	movl	%r10d, %r9d
14011566b: 75 c8                       	jne	0x140115635 <.text+0x114635>
14011566d: 0f 1f 00                    	nopl	(%rax)
140115670: 66 0f 74 d9                 	pcmpeqb	%xmm1, %xmm3
140115674: 66 44 0f d7 cb              	pmovmskb	%xmm3, %r9d
140115679: 45 85 c9                    	testl	%r9d, %r9d
14011567c: 0f 85 ac 00 00 00           	jne	0x14011572e <.text+0x11472e>
140115682: 4c 01 c7                    	addq	%r8, %rdi
140115685: 48 83 c7 10                 	addq	$0x10, %rdi
140115689: 49 83 c0 10                 	addq	$0x10, %r8
14011568d: eb 8c                       	jmp	0x14011561b <.text+0x11461b>
14011568f: 4a 8d 04 d0                 	leaq	(%rax,%r10,8), %rax
140115693: 48 8b 40 f8                 	movq	-0x8(%rax), %rax
140115697: 48 3b 86 18 02 00 00        	cmpq	0x218(%rsi), %rax
14011569e: 0f 83 8a 00 00 00           	jae	0x14011572e <.text+0x11472e>
1401156a4: 48 8b 8e 10 02 00 00        	movq	0x210(%rsi), %rcx
1401156ab: 48 8b 0c c1                 	movq	(%rcx,%rax,8), %rcx
1401156af: 48 85 c9                    	testq	%rcx, %rcx
1401156b2: 74 7a                       	je	0x14011572e <.text+0x11472e>
1401156b4: 48 8b 86 e0 01 00 00        	movq	0x1e0(%rsi), %rax
1401156bb: 48 f7 d1                    	notq	%rcx
1401156be: 48 6b c9 38                 	imulq	$0x38, %rcx, %rcx
1401156c2: 80 7c 08 30 00              	cmpb	$0x0, 0x30(%rax,%rcx)
1401156c7: 74 65                       	je	0x14011572e <.text+0x11472e>
1401156c9: 48 01 c8                    	addq	%rcx, %rax
1401156cc: 48 8b 48 10                 	movq	0x10(%rax), %rcx
1401156d0: 44 8b 86 b0 05 00 00        	movl	0x5b0(%rsi), %r8d
1401156d7: 44 89 40 2c                 	movl	%r8d, 0x2c(%rax)
1401156db: 0f 10 42 60                 	movups	0x60(%rdx), %xmm0
1401156df: 0f 29 45 00                 	movaps	%xmm0, (%rbp)
1401156e3: 0f 10 42 50                 	movups	0x50(%rdx), %xmm0
1401156e7: 0f 29 45 f0                 	movaps	%xmm0, -0x10(%rbp)
1401156eb: 0f 10 42 40                 	movups	0x40(%rdx), %xmm0
1401156ef: 0f 29 45 e0                 	movaps	%xmm0, -0x20(%rbp)
1401156f3: 0f 10 02                    	movups	(%rdx), %xmm0
1401156f6: 0f 10 4a 10                 	movups	0x10(%rdx), %xmm1
1401156fa: 0f 10 52 20                 	movups	0x20(%rdx), %xmm2
1401156fe: 0f 10 5a 30                 	movups	0x30(%rdx), %xmm3
140115702: 0f 29 5d d0                 	movaps	%xmm3, -0x30(%rbp)
140115706: 0f 29 55 c0                 	movaps	%xmm2, -0x40(%rbp)
14011570a: 0f 29 4d b0                 	movaps	%xmm1, -0x50(%rbp)
14011570e: 0f 29 45 a0                 	movaps	%xmm0, -0x60(%rbp)
140115712: c6 45 27 00                 	movb	$0x0, 0x27(%rbp)
140115716: 48 8d 55 a0                 	leaq	-0x60(%rbp), %rdx
14011571a: e8 e1 41 f1 ff              	callq	0x140029900 <.text+0x28900>
14011571f: 90                          	nop

# preupdate-schedule

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140029954: 48 8b 0d 05 de 62 08        	movq	0x862de05(%rip), %rcx   # 0x148657760
14002995b: 4c 8d 05 76 ef 22 06        	leaq	0x622ef76(%rip), %r8    # 0x1462588d8
140029962: 48 8d 95 56 08 00 00        	leaq	0x856(%rbp), %rdx
140029969: e8 22 48 25 00              	callq	0x14027e190 <.text+0x27d190>
14002996e: 48 89 85 40 08 00 00        	movq	%rax, 0x840(%rbp)
140029975: 48 89 95 48 08 00 00        	movq	%rdx, 0x848(%rbp)

# input-systems-label

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400874b0: 48 89 d1                    	movq	%rdx, %rcx
1400874b3: 48 8d 15 06 8f 1b 06        	leaq	0x61b8f06(%rip), %rdx   # 0x1462403c0
1400874ba: 41 b8 0c 00 00 00           	movl	$0xc, %r8d
1400874c0: e9 6b 3e fb 05              	jmp	0x14603b330 <.text+0x603a330>

# preupdate-label

installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14018b6e0: 48 89 d1                    	movq	%rdx, %rcx
14018b6e3: 48 8d 15 c6 c8 0c 06        	leaq	0x60cc8c6(%rip), %rdx   # 0x146257fb0
14018b6ea: 41 b8 09 00 00 00           	movl	$0x9, %r8d
14018b6f0: e9 3b fc ea 05              	jmp	0x14603b330 <.text+0x603a330>
