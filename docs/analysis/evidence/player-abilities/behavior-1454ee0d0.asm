
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ee0d0: 55                          	pushq	%rbp
1454ee0d1: 56                          	pushq	%rsi
1454ee0d2: 57                          	pushq	%rdi
1454ee0d3: 48 81 ec 90 00 00 00        	subq	$0x90, %rsp
1454ee0da: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454ee0e2: 48 c7 45 08 fe ff ff ff     	movq	$-0x2, 0x8(%rbp)
1454ee0ea: 48 89 ce                    	movq	%rcx, %rsi
1454ee0ed: 0f 28 45 50                 	movaps	0x50(%rbp), %xmm0
1454ee0f1: f3 0f 10 8a e4 08 00 00     	movss	0x8e4(%rdx), %xmm1
1454ee0f9: f3 0f 11 4d 00              	movss	%xmm1, (%rbp)
1454ee0fe: f3 0f 59 db                 	mulss	%xmm3, %xmm3
1454ee102: f3 0f 11 5d fc              	movss	%xmm3, -0x4(%rbp)
1454ee107: 48 8b 82 c8 04 00 00        	movq	0x4c8(%rdx), %rax
1454ee10e: 48 69 8a d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdx), %rcx # imm = 0x160
1454ee119: 48 01 c1                    	addq	%rax, %rcx
1454ee11c: 48 89 45 a0                 	movq	%rax, -0x60(%rbp)
1454ee120: 48 89 4d a8                 	movq	%rcx, -0x58(%rbp)
1454ee124: 0f 11 45 b0                 	movups	%xmm0, -0x50(%rbp)
1454ee128: 48 89 e8                    	movq	%rbp, %rax
1454ee12b: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1454ee12f: 4c 89 45 c8                 	movq	%r8, -0x38(%rbp)
1454ee133: 48 8d 45 fc                 	leaq	-0x4(%rbp), %rax
1454ee137: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
1454ee13b: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1454ee13f: 48 8d 55 a0                 	leaq	-0x60(%rbp), %rdx
1454ee143: e8 a8 d7 03 00              	callq	0x14552b8f0 <.text+0x552a8f0>
1454ee148: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
1454ee14c: 48 8b 7d e8                 	movq	-0x18(%rbp), %rdi
1454ee150: 48 8d 45 07                 	leaq	0x7(%rbp), %rax
1454ee154: 48 89 45 a0                 	movq	%rax, -0x60(%rbp)
1454ee158: 48 83 ff 02                 	cmpq	$0x2, %rdi
1454ee15c: 0f 83 b8 00 00 00           	jae	0x1454ee21a <.text+0x54ed21a>
1454ee162: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1454ee166: 48 85 ff                    	testq	%rdi, %rdi
1454ee169: 0f 84 92 00 00 00           	je	0x1454ee201 <.text+0x54ed201>
1454ee16f: 48 8d 57 ff                 	leaq	-0x1(%rdi), %rdx
1454ee173: 41 89 fb                    	movl	%edi, %r11d
1454ee176: 41 83 e3 03                 	andl	$0x3, %r11d
1454ee17a: 48 83 fa 03                 	cmpq	$0x3, %rdx
1454ee17e: 73 04                       	jae	0x1454ee184 <.text+0x54ed184>
1454ee180: 31 d2                       	xorl	%edx, %edx
1454ee182: eb 50                       	jmp	0x1454ee1d4 <.text+0x54ed1d4>
1454ee184: 49 89 f8                    	movq	%rdi, %r8
1454ee187: 49 83 e0 fc                 	andq	$-0x4, %r8
1454ee18b: 4c 8d 49 38                 	leaq	0x38(%rcx), %r9
1454ee18f: 31 d2                       	xorl	%edx, %edx
1454ee191: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454ee1a0: 4d 8b 51 d0                 	movq	-0x30(%r9), %r10
1454ee1a4: 4c 89 14 d1                 	movq	%r10, (%rcx,%rdx,8)
1454ee1a8: 4d 8b 51 e0                 	movq	-0x20(%r9), %r10
1454ee1ac: 4c 89 54 d1 08              	movq	%r10, 0x8(%rcx,%rdx,8)
1454ee1b1: 4d 8b 51 f0                 	movq	-0x10(%r9), %r10
1454ee1b5: 4c 89 54 d1 10              	movq	%r10, 0x10(%rcx,%rdx,8)
1454ee1ba: 4d 8b 11                    	movq	(%r9), %r10
1454ee1bd: 4c 89 54 d1 18              	movq	%r10, 0x18(%rcx,%rdx,8)
1454ee1c2: 48 83 c2 04                 	addq	$0x4, %rdx
1454ee1c6: 49 83 c1 40                 	addq	$0x40, %r9
1454ee1ca: 49 39 d0                    	cmpq	%rdx, %r8
1454ee1cd: 75 d1                       	jne	0x1454ee1a0 <.text+0x54ed1a0>
1454ee1cf: 4d 85 db                    	testq	%r11, %r11
1454ee1d2: 74 2d                       	je	0x1454ee201 <.text+0x54ed201>
1454ee1d4: 4c 8d 04 d1                 	leaq	(%rcx,%rdx,8), %r8
1454ee1d8: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454ee1dc: 48 01 ca                    	addq	%rcx, %rdx
1454ee1df: 48 83 c2 08                 	addq	$0x8, %rdx
1454ee1e3: 41 c1 e3 03                 	shll	$0x3, %r11d
1454ee1e7: 45 31 c9                    	xorl	%r9d, %r9d
1454ee1ea: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454ee1f0: 4e 8b 14 4a                 	movq	(%rdx,%r9,2), %r10
1454ee1f4: 4f 89 14 08                 	movq	%r10, (%r8,%r9)
1454ee1f8: 49 83 c1 08                 	addq	$0x8, %r9
1454ee1fc: 4d 39 cb                    	cmpq	%r9, %r11
1454ee1ff: 75 ef                       	jne	0x1454ee1f0 <.text+0x54ed1f0>
1454ee201: 48 01 c0                    	addq	%rax, %rax
1454ee204: 48 89 06                    	movq	%rax, (%rsi)
1454ee207: 48 89 4e 08                 	movq	%rcx, 0x8(%rsi)
1454ee20b: 48 89 7e 10                 	movq	%rdi, 0x10(%rsi)
1454ee20f: 48 81 c4 90 00 00 00        	addq	$0x90, %rsp
1454ee216: 5f                          	popq	%rdi
1454ee217: 5e                          	popq	%rsi
1454ee218: 5d                          	popq	%rbp
1454ee219: c3                          	retq
1454ee21a: 48 83 ff 15                 	cmpq	$0x15, %rdi
1454ee21e: 48 89 4d f0                 	movq	%rcx, -0x10(%rbp)
1454ee222: 73 1f                       	jae	0x1454ee243 <.text+0x54ed243>
1454ee224: 4c 8d 4d a0                 	leaq	-0x60(%rbp), %r9
1454ee228: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ee22e: 48 89 fa                    	movq	%rdi, %rdx
1454ee231: e8 ca ae 43 fc              	callq	0x141929100 <.text+0x1928100>
1454ee236: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1454ee23a: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
1454ee23e: e9 2c ff ff ff              	jmp	0x1454ee16f <.text+0x54ed16f>
1454ee243: 4c 8d 45 a0                 	leaq	-0x60(%rbp), %r8
1454ee247: 48 89 fa                    	movq	%rdi, %rdx
1454ee24a: e8 61 b4 04 00              	callq	0x1455396b0 <.text+0x55386b0>
1454ee24f: 90                          	nop
1454ee250: eb e4                       	jmp	0x1454ee236 <.text+0x54ed236>
