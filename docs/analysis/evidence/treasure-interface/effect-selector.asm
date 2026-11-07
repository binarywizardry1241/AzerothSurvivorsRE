
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d02b0: 41 57                       	pushq	%r15
1454d02b2: 41 56                       	pushq	%r14
1454d02b4: 41 55                       	pushq	%r13
1454d02b6: 41 54                       	pushq	%r12
1454d02b8: 56                          	pushq	%rsi
1454d02b9: 57                          	pushq	%rdi
1454d02ba: 55                          	pushq	%rbp
1454d02bb: 53                          	pushq	%rbx
1454d02bc: 48 83 ec 58                 	subq	$0x58, %rsp
1454d02c0: 44 89 c7                    	movl	%r8d, %edi
1454d02c3: 48 89 d6                    	movq	%rdx, %rsi
1454d02c6: 0f b6 84 24 c0 00 00 00     	movzbl	0xc0(%rsp), %eax
1454d02ce: 44 0f b6 3a                 	movzbl	(%rdx), %r15d
1454d02d2: 49 83 ff 06                 	cmpq	$0x6, %r15
1454d02d6: 77 46                       	ja	0x1454d031e <.text+0x54cf31e>
1454d02d8: 48 8d 15 19 85 52 01        	leaq	0x1528519(%rip), %rdx   # 0x1469f87f8
1454d02df: 4e 63 04 ba                 	movslq	(%rdx,%r15,4), %r8
1454d02e3: 49 01 d0                    	addq	%rdx, %r8
1454d02e6: 41 ff e0                    	jmpq	*%r8
1454d02e9: b0 01                       	movb	$0x1, %al
1454d02eb: e9 15 01 00 00              	jmp	0x1454d0405 <.text+0x54cf405>
1454d02f0: 84 c0                       	testb	%al, %al
1454d02f2: 0f 94 c1                    	sete	%cl
1454d02f5: 85 ff                       	testl	%edi, %edi
1454d02f7: 0f 94 c0                    	sete	%al
1454d02fa: 20 c8                       	andb	%cl, %al
1454d02fc: e9 04 01 00 00              	jmp	0x1454d0405 <.text+0x54cf405>
1454d0301: 44 3a 4e 01                 	cmpb	0x1(%rsi), %r9b
1454d0305: 0f 94 c1                    	sete	%cl
1454d0308: 3c 02                       	cmpb	$0x2, %al
1454d030a: 0f 95 c0                    	setne	%al
1454d030d: 20 c8                       	andb	%cl, %al
1454d030f: e9 f1 00 00 00              	jmp	0x1454d0405 <.text+0x54cf405>
1454d0314: 3c 02                       	cmpb	$0x2, %al
1454d0316: 0f 94 c0                    	sete	%al
1454d0319: e9 e7 00 00 00              	jmp	0x1454d0405 <.text+0x54cf405>
1454d031e: 3c 02                       	cmpb	$0x2, %al
1454d0320: 0f 84 dd 00 00 00           	je	0x1454d0403 <.text+0x54cf403>
1454d0326: 85 ff                       	testl	%edi, %edi
1454d0328: 0f 84 d5 00 00 00           	je	0x1454d0403 <.text+0x54cf403>
1454d032e: 0f b6 81 9c 02 00 00        	movzbl	0x29c(%rcx), %eax
1454d0335: 04 fe                       	addb	$-0x2, %al
1454d0337: 3c 09                       	cmpb	$0x9, %al
1454d0339: 77 10                       	ja	0x1454d034b <.text+0x54cf34b>
1454d033b: 0f b6 c0                    	movzbl	%al, %eax
1454d033e: 48 8d 15 7b 81 52 01        	leaq	0x152817b(%rip), %rdx   # 0x1469f84c0
1454d0345: 48 8b 14 c2                 	movq	(%rdx,%rax,8), %rdx
1454d0349: eb 07                       	jmp	0x1454d0352 <.text+0x54cf352>
1454d034b: 48 8d 15 f6 54 26 01        	leaq	0x12654f6(%rip), %rdx   # 0x146735848
1454d0352: 48 8b 42 30                 	movq	0x30(%rdx), %rax
1454d0356: 48 8b 52 38                 	movq	0x38(%rdx), %rdx
1454d035a: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454d035e: 48 01 c2                    	addq	%rax, %rdx
1454d0361: 48 89 54 24 30              	movq	%rdx, 0x30(%rsp)
1454d0366: 48 8b 91 b8 00 00 00        	movq	0xb8(%rcx), %rdx
1454d036d: 48 89 54 24 28              	movq	%rdx, 0x28(%rsp)
1454d0372: 48 8b 89 c0 00 00 00        	movq	0xc0(%rcx), %rcx
1454d0379: 48 89 4c 24 20              	movq	%rcx, 0x20(%rsp)
1454d037e: 4c 8d 25 c3 67 26 01        	leaq	0x12667c3(%rip), %r12   # 0x146736b48
1454d0385: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454d0390: 48 3b 44 24 30              	cmpq	0x30(%rsp), %rax
1454d0395: 74 7f                       	je	0x1454d0416 <.text+0x54cf416>
1454d0397: 4c 8d 68 10                 	leaq	0x10(%rax), %r13
1454d039b: 48 8b 18                    	movq	(%rax), %rbx
1454d039e: 4c 8b 70 08                 	movq	0x8(%rax), %r14
1454d03a2: 48 89 5c 24 38              	movq	%rbx, 0x38(%rsp)
1454d03a7: 4c 89 74 24 40              	movq	%r14, 0x40(%rsp)
1454d03ac: 31 ed                       	xorl	%ebp, %ebp
1454d03ae: eb 11                       	jmp	0x1454d03c1 <.text+0x54cf3c1>
1454d03b0: 48 83 c5 78                 	addq	$0x78, %rbp
1454d03b4: 48 81 fd 80 34 00 00        	cmpq	$0x3480, %rbp           # imm = 0x3480
1454d03bb: 0f 84 18 01 00 00           	je	0x1454d04d9 <.text+0x54cf4d9>
1454d03c1: 4e 39 74 25 08              	cmpq	%r14, 0x8(%rbp,%r12)
1454d03c6: 75 e8                       	jne	0x1454d03b0 <.text+0x54cf3b0>
1454d03c8: 4a 8b 4c 25 00              	movq	(%rbp,%r12), %rcx
1454d03cd: 48 89 da                    	movq	%rbx, %rdx
1454d03d0: 4d 89 f0                    	movq	%r14, %r8
1454d03d3: e8 0f 2e 2a 00              	callq	0x1457731e7 <.text+0x57721e7>
1454d03d8: 85 c0                       	testl	%eax, %eax
1454d03da: 75 d4                       	jne	0x1454d03b0 <.text+0x54cf3b0>
1454d03dc: 42 39 7c 25 40              	cmpl	%edi, 0x40(%rbp,%r12)
1454d03e1: 74 0a                       	je	0x1454d03ed <.text+0x54cf3ed>
1454d03e3: 4c 89 e8                    	movq	%r13, %rax
1454d03e6: 42 39 7c 25 64              	cmpl	%edi, 0x64(%rbp,%r12)
1454d03eb: 75 a3                       	jne	0x1454d0390 <.text+0x54cf390>
1454d03ed: 49 01 ec                    	addq	%rbp, %r12
1454d03f0: 44 89 f8                    	movl	%r15d, %eax
1454d03f3: 48 8d 0d 1a 84 52 01        	leaq	0x152841a(%rip), %rcx   # 0x1469f8814
1454d03fa: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1454d03fe: 48 01 c8                    	addq	%rcx, %rax
1454d0401: ff e0                       	jmpq	*%rax
1454d0403: 31 c0                       	xorl	%eax, %eax
1454d0405: 48 83 c4 58                 	addq	$0x58, %rsp
1454d0409: 5b                          	popq	%rbx
1454d040a: 5d                          	popq	%rbp
1454d040b: 5f                          	popq	%rdi
1454d040c: 5e                          	popq	%rsi
1454d040d: 41 5c                       	popq	%r12
1454d040f: 41 5d                       	popq	%r13
1454d0411: 41 5e                       	popq	%r14
1454d0413: 41 5f                       	popq	%r15
1454d0415: c3                          	retq
1454d0416: 48 8b 44 24 20              	movq	0x20(%rsp), %rax
1454d041b: 48 c1 e0 05                 	shlq	$0x5, %rax
1454d041f: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
1454d0423: 31 c9                       	xorl	%ecx, %ecx
1454d0425: 48 8b 54 24 28              	movq	0x28(%rsp), %rdx
1454d042a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454d0430: 48 39 c8                    	cmpq	%rcx, %rax
1454d0433: 74 ce                       	je	0x1454d0403 <.text+0x54cf403>
1454d0435: 4c 8b 24 0a                 	movq	(%rdx,%rcx), %r12
1454d0439: 41 39 7c 24 40              	cmpl	%edi, 0x40(%r12)
1454d043e: 74 b0                       	je	0x1454d03f0 <.text+0x54cf3f0>
1454d0440: 48 83 c1 60                 	addq	$0x60, %rcx
1454d0444: 41 39 7c 24 64              	cmpl	%edi, 0x64(%r12)
1454d0449: 75 e5                       	jne	0x1454d0430 <.text+0x54cf430>
1454d044b: eb a3                       	jmp	0x1454d03f0 <.text+0x54cf3f0>
1454d044d: 41 0f b6 44 24 75           	movzbl	0x75(%r12), %eax
1454d0453: 3a 46 01                    	cmpb	0x1(%rsi), %al
1454d0456: e9 bb fe ff ff              	jmp	0x1454d0316 <.text+0x54cf316>
1454d045b: 48 8b 5e 10                 	movq	0x10(%rsi), %rbx
1454d045f: 48 85 db                    	testq	%rbx, %rbx
1454d0462: 74 9f                       	je	0x1454d0403 <.text+0x54cf403>
1454d0464: 4c 8b 76 08                 	movq	0x8(%rsi), %r14
1454d0468: 48 c1 e3 04                 	shlq	$0x4, %rbx
1454d046c: 49 8b 34 24                 	movq	(%r12), %rsi
1454d0470: 49 8b 7c 24 08              	movq	0x8(%r12), %rdi
1454d0475: 45 31 ff                    	xorl	%r15d, %r15d
1454d0478: eb 0f                       	jmp	0x1454d0489 <.text+0x54cf489>
1454d047a: 49 83 c7 10                 	addq	$0x10, %r15
1454d047e: 31 c0                       	xorl	%eax, %eax
1454d0480: 4c 39 fb                    	cmpq	%r15, %rbx
1454d0483: 0f 84 7c ff ff ff           	je	0x1454d0405 <.text+0x54cf405>
1454d0489: 4b 39 7c 3e 08              	cmpq	%rdi, 0x8(%r14,%r15)
1454d048e: 75 ea                       	jne	0x1454d047a <.text+0x54cf47a>
1454d0490: 4b 8b 0c 3e                 	movq	(%r14,%r15), %rcx
1454d0494: 48 89 f2                    	movq	%rsi, %rdx
1454d0497: 49 89 f8                    	movq	%rdi, %r8
1454d049a: e8 48 2d 2a 00              	callq	0x1457731e7 <.text+0x57721e7>
1454d049f: 85 c0                       	testl	%eax, %eax
1454d04a1: 75 d7                       	jne	0x1454d047a <.text+0x54cf47a>
1454d04a3: e9 41 fe ff ff              	jmp	0x1454d02e9 <.text+0x54cf2e9>
1454d04a8: 41 0f b6 44 24 74           	movzbl	0x74(%r12), %eax
1454d04ae: 3a 46 01                    	cmpb	0x1(%rsi), %al
1454d04b1: e9 60 fe ff ff              	jmp	0x1454d0316 <.text+0x54cf316>
1454d04b6: 4c 8b 46 10                 	movq	0x10(%rsi), %r8
1454d04ba: 4d 39 44 24 08              	cmpq	%r8, 0x8(%r12)
1454d04bf: 0f 85 3e ff ff ff           	jne	0x1454d0403 <.text+0x54cf403>
1454d04c5: 49 8b 0c 24                 	movq	(%r12), %rcx
1454d04c9: 48 8b 56 08                 	movq	0x8(%rsi), %rdx
1454d04cd: e8 15 2d 2a 00              	callq	0x1457731e7 <.text+0x57721e7>
1454d04d2: 85 c0                       	testl	%eax, %eax
1454d04d4: e9 3d fe ff ff              	jmp	0x1454d0316 <.text+0x54cf316>
1454d04d9: 48 8d 44 24 38              	leaq	0x38(%rsp), %rax
1454d04de: 48 89 44 24 48              	movq	%rax, 0x48(%rsp)
1454d04e3: 48 8d 05 d6 1b b3 fa        	leaq	-0x54ce42a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454d04ea: 48 89 44 24 50              	movq	%rax, 0x50(%rsp)
1454d04ef: 48 8d 0d 62 58 26 01        	leaq	0x1265862(%rip), %rcx   # 0x146735d58
1454d04f6: 4c 8d 05 6b 58 26 01        	leaq	0x126586b(%rip), %r8    # 0x146735d68
1454d04fd: 48 8d 54 24 48              	leaq	0x48(%rsp), %rdx
1454d0502: e8 09 38 43 00              	callq	0x145903d10 <.text+0x5902d10>
1454d0507: 0f 0b                       	ud2
