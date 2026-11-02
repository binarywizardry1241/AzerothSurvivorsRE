
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1456a6570: 55                          	pushq	%rbp
1456a6571: 41 56                       	pushq	%r14
1456a6573: 56                          	pushq	%rsi
1456a6574: 57                          	pushq	%rdi
1456a6575: 53                          	pushq	%rbx
1456a6576: 48 83 ec 70                 	subq	$0x70, %rsp
1456a657a: 48 8d 6c 24 70              	leaq	0x70(%rsp), %rbp
1456a657f: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1456a6587: 48 89 d6                    	movq	%rdx, %rsi
1456a658a: 0f b6 52 19                 	movzbl	0x19(%rdx), %edx
1456a658e: 44 0f b6 46 1a              	movzbl	0x1a(%rsi), %r8d
1456a6593: 84 d2                       	testb	%dl, %dl
1456a6595: 74 0f                       	je	0x1456a65a6 <.text+0x56a55a6>
1456a6597: 45 84 c0                    	testb	%r8b, %r8b
1456a659a: 75 0f                       	jne	0x1456a65ab <.text+0x56a55ab>
1456a659c: 0f b6 7e 1b                 	movzbl	0x1b(%rsi), %edi
1456a65a0: 0f b6 46 1d                 	movzbl	0x1d(%rsi), %eax
1456a65a4: eb 53                       	jmp	0x1456a65f9 <.text+0x56a55f9>
1456a65a6: 45 84 c0                    	testb	%r8b, %r8b
1456a65a9: 74 38                       	je	0x1456a65e3 <.text+0x56a55e3>
1456a65ab: 0f b6 7e 1b                 	movzbl	0x1b(%rsi), %edi
1456a65af: 0f b6 46 1d                 	movzbl	0x1d(%rsi), %eax
1456a65b3: 41 89 f9                    	movl	%edi, %r9d
1456a65b6: 41 f6 d1                    	notb	%r9b
1456a65b9: 41 08 c1                    	orb	%al, %r9b
1456a65bc: 41 f6 c1 01                 	testb	$0x1, %r9b
1456a65c0: 75 37                       	jne	0x1456a65f9 <.text+0x56a55f9>
1456a65c2: 48 8d 15 41 c5 43 01        	leaq	0x143c541(%rip), %rdx   # 0x146ae2b0a
1456a65c9: 41 b8 3d 00 00 00           	movl	$0x3d, %r8d
1456a65cf: b1 14                       	movb	$0x14, %cl
1456a65d1: e8 da 56 ff ff              	callq	0x14569bcb0 <.text+0x569acb0>
1456a65d6: 49 89 c6                    	movq	%rax, %r14
1456a65d9: b8 01 00 00 00              	movl	$0x1, %eax
1456a65de: e9 41 02 00 00              	jmp	0x1456a6824 <.text+0x56a5824>
1456a65e3: 80 7e 1b 00                 	cmpb	$0x0, 0x1b(%rsi)
1456a65e7: 75 d9                       	jne	0x1456a65c2 <.text+0x56a55c2>
1456a65e9: 80 7e 1c 00                 	cmpb	$0x0, 0x1c(%rsi)
1456a65ed: 75 d3                       	jne	0x1456a65c2 <.text+0x56a55c2>
1456a65ef: 80 7e 1d 00                 	cmpb	$0x0, 0x1d(%rsi)
1456a65f3: 75 cd                       	jne	0x1456a65c2 <.text+0x56a55c2>
1456a65f5: 31 ff                       	xorl	%edi, %edi
1456a65f7: 31 c0                       	xorl	%eax, %eax
1456a65f9: 44 0f b6 4e 1c              	movzbl	0x1c(%rsi), %r9d
1456a65fe: 45 84 c9                    	testb	%r9b, %r9b
1456a6601: 74 0b                       	je	0x1456a660e <.text+0x56a560e>
1456a6603: bb 04 00 00 00              	movl	$0x4, %ebx
1456a6608: 3c 01                       	cmpb	$0x1, %al
1456a660a: 74 06                       	je	0x1456a6612 <.text+0x56a5612>
1456a660c: eb 17                       	jmp	0x1456a6625 <.text+0x56a5625>
1456a660e: a8 01                       	testb	$0x1, %al
1456a6610: 74 07                       	je	0x1456a6619 <.text+0x56a5619>
1456a6612: bb 01 00 00 00              	movl	$0x1, %ebx
1456a6617: eb 0c                       	jmp	0x1456a6625 <.text+0x56a5625>
1456a6619: 44 0f b6 d7                 	movzbl	%dil, %r10d
1456a661d: 42 8d 1c 55 03 00 00 00     	leal	0x3(,%r10,2), %ebx
1456a6625: 44 0f b6 56 1e              	movzbl	0x1e(%rsi), %r10d
1456a662a: c7 45 c8 18 00 00 00        	movl	$0x18, -0x38(%rbp)
1456a6631: 48 c7 45 d0 00 00 00 00     	movq	$0x0, -0x30(%rbp)
1456a6639: 44 89 55 d8                 	movl	%r10d, -0x28(%rbp)
1456a663d: 83 3e 01                    	cmpl	$0x1, (%rsi)
1456a6640: 75 05                       	jne	0x1456a6647 <.text+0x56a5647>
1456a6642: 8b 56 04                    	movl	0x4(%rsi), %edx
1456a6645: eb 46                       	jmp	0x1456a668d <.text+0x56a568d>
1456a6647: 80 7e 18 00                 	cmpb	$0x0, 0x18(%rsi)
1456a664b: 74 1a                       	je	0x1456a6667 <.text+0x56a5667>
1456a664d: 44 0f b6 ca                 	movzbl	%dl, %r9d
1456a6651: 41 83 c9 fe                 	orl	$-0x2, %r9d
1456a6655: 41 c1 e1 1e                 	shll	$0x1e, %r9d
1456a6659: 45 84 c0                    	testb	%r8b, %r8b
1456a665c: ba 14 01 12 80              	movl	$0x80120114, %edx       # imm = 0x80120114
1456a6661: 41 0f 44 d1                 	cmovel	%r9d, %edx
1456a6665: eb 26                       	jmp	0x1456a668d <.text+0x56a568d>
1456a6667: 84 d2                       	testb	%dl, %dl
1456a6669: 74 14                       	je	0x1456a667f <.text+0x56a567f>
1456a666b: 45 84 c0                    	testb	%r8b, %r8b
1456a666e: 41 b8 14 01 12 00           	movl	$0x120114, %r8d         # imm = 0x120114
1456a6674: ba 00 00 00 40              	movl	$0x40000000, %edx       # imm = 0x40000000
1456a6679: 41 0f 45 d0                 	cmovnel	%r8d, %edx
1456a667d: eb 0e                       	jmp	0x1456a668d <.text+0x56a568d>
1456a667f: ba 14 01 12 00              	movl	$0x120114, %edx         # imm = 0x120114
1456a6684: 45 84 c0                    	testb	%r8b, %r8b
1456a6687: 0f 84 a5 01 00 00           	je	0x1456a6832 <.text+0x56a5832>
1456a668d: 44 8b 5e 0c                 	movl	0xc(%rsi), %r11d
1456a6691: 45 31 c0                    	xorl	%r8d, %r8d
1456a6694: 45 84 d2                    	testb	%r10b, %r10b
1456a6697: 4c 8d 4d c8                 	leaq	-0x38(%rbp), %r9
1456a669b: 4d 0f 44 c8                 	cmoveq	%r8, %r9
1456a669f: 44 0b 5e 08                 	orl	0x8(%rsi), %r11d
1456a66a3: 44 0b 5e 14                 	orl	0x14(%rsi), %r11d
1456a66a7: 44 8b 46 10                 	movl	0x10(%rsi), %r8d
1456a66ab: 0f b6 c0                    	movzbl	%al, %eax
1456a66ae: c1 e0 15                    	shll	$0x15, %eax
1456a66b1: 44 09 d8                    	orl	%r11d, %eax
1456a66b4: 89 44 24 28                 	movl	%eax, 0x28(%rsp)
1456a66b8: 89 5c 24 20                 	movl	%ebx, 0x20(%rsp)
1456a66bc: 48 c7 44 24 30 00 00 00 00  	movq	$0x0, 0x30(%rsp)
1456a66c5: ff 15 bd f3 1f 00           	callq	*0x1ff3bd(%rip)         # 0x1458a5a88
1456a66cb: 48 83 f8 ff                 	cmpq	$-0x1, %rax
1456a66cf: 74 22                       	je	0x1456a66f3 <.text+0x56a56f3>
1456a66d1: 49 89 c6                    	movq	%rax, %r14
1456a66d4: 80 7e 1f 00                 	cmpb	$0x0, 0x1f(%rsi)
1456a66d8: 74 4e                       	je	0x1456a6728 <.text+0x56a5728>
1456a66da: 45 31 c9                    	xorl	%r9d, %r9d
1456a66dd: 80 7e 20 00                 	cmpb	$0x0, 0x20(%rsi)
1456a66e1: 48 c7 45 f0 ff ff ff ff     	movq	$-0x1, -0x10(%rbp)
1456a66e9: 4c 8d 45 f0                 	leaq	-0x10(%rbp), %r8
1456a66ed: 4d 0f 45 c8                 	cmovneq	%r8, %r9
1456a66f1: eb 4a                       	jmp	0x1456a673d <.text+0x56a573d>
1456a66f3: ff 15 07 f4 1f 00           	callq	*0x1ff407(%rip)         # 0x1458a5b00
1456a66f9: 41 89 c6                    	movl	%eax, %r14d
1456a66fc: 48 8b 05 35 66 10 02        	movq	0x2106635(%rip), %rax   # 0x1477acd38
1456a6703: 48 8b 00                    	movq	(%rax), %rax
1456a6706: 48 8d 0d 63 a8 43 01        	leaq	0x143a863(%rip), %rcx   # 0x146ae0f70
1456a670d: 48 39 c8                    	cmpq	%rcx, %rax
1456a6710: 0f 85 3e 01 00 00           	jne	0x1456a6854 <.text+0x56a5854>
1456a6716: 49 c1 e6 20                 	shlq	$0x20, %r14
1456a671a: 49 83 ce 02                 	orq	$0x2, %r14
1456a671e: b8 01 00 00 00              	movl	$0x1, %eax
1456a6723: e9 fc 00 00 00              	jmp	0x1456a6824 <.text+0x56a5824>
1456a6728: 80 7e 20 00                 	cmpb	$0x0, 0x20(%rsi)
1456a672c: 74 22                       	je	0x1456a6750 <.text+0x56a5750>
1456a672e: 48 c7 45 f0 ff ff ff ff     	movq	$-0x1, -0x10(%rbp)
1456a6736: 4c 8d 4d f0                 	leaq	-0x10(%rbp), %r9
1456a673a: 45 31 c0                    	xorl	%r8d, %r8d
1456a673d: 4c 89 f1                    	movq	%r14, %rcx
1456a6740: 31 d2                       	xorl	%edx, %edx
1456a6742: ff 15 a0 e9 1f 00           	callq	*0x1fe9a0(%rip)         # 0x1458a50e8
1456a6748: 85 c0                       	testl	%eax, %eax
1456a674a: 0f 84 98 00 00 00           	je	0x1456a67e8 <.text+0x56a57e8>
1456a6750: 83 fb 04                    	cmpl	$0x4, %ebx
1456a6753: 0f 94 c0                    	sete	%al
1456a6756: 40 84 f8                    	testb	%dil, %al
1456a6759: 0f 84 85 00 00 00           	je	0x1456a67e4 <.text+0x56a57e4>
1456a675f: ff 15 9b f3 1f 00           	callq	*0x1ff39b(%rip)         # 0x1458a5b00
1456a6765: 3d b7 00 00 00              	cmpl	$0xb7, %eax
1456a676a: 75 78                       	jne	0x1456a67e4 <.text+0x56a57e4>
1456a676c: 48 c7 45 e0 00 00 00 00     	movq	$0x0, -0x20(%rbp)
1456a6774: 4c 8d 45 e0                 	leaq	-0x20(%rbp), %r8
1456a6778: 4c 89 f1                    	movq	%r14, %rcx
1456a677b: ba 05 00 00 00              	movl	$0x5, %edx
1456a6780: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1456a6786: ff 15 c4 e8 1f 00           	callq	*0x1fe8c4(%rip)         # 0x1458a5050
1456a678c: 85 c0                       	testl	%eax, %eax
1456a678e: 75 54                       	jne	0x1456a67e4 <.text+0x56a57e4>
1456a6790: ff 15 6a f3 1f 00           	callq	*0x1ff36a(%rip)         # 0x1458a5b00
1456a6796: 48 c7 45 f0 00 00 00 00     	movq	$0x0, -0x10(%rbp)
1456a679e: 4c 8d 45 f0                 	leaq	-0x10(%rbp), %r8
1456a67a2: 4c 89 f1                    	movq	%r14, %rcx
1456a67a5: ba 06 00 00 00              	movl	$0x6, %edx
1456a67aa: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1456a67b0: e8 1b 42 01 00              	callq	0x1456ba9d0 <.text+0x56b99d0>
1456a67b5: a8 01                       	testb	$0x1, %al
1456a67b7: 74 2b                       	je	0x1456a67e4 <.text+0x56a57e4>
1456a67b9: 89 d6                       	movl	%edx, %esi
1456a67bb: 4c 89 75 e8                 	movq	%r14, -0x18(%rbp)
1456a67bf: 48 8b 05 72 65 10 02        	movq	0x2106572(%rip), %rax   # 0x1477acd38
1456a67c6: 48 8b 00                    	movq	(%rax), %rax
1456a67c9: 48 8d 0d a0 a7 43 01        	leaq	0x143a7a0(%rip), %rcx   # 0x146ae0f70
1456a67d0: 48 39 c8                    	cmpq	%rcx, %rax
1456a67d3: 74 35                       	je	0x1456a680a <.text+0x56a580a>
1456a67d5: 48 8d 0d 94 a7 43 01        	leaq	0x143a794(%rip), %rcx   # 0x146ae0f70
1456a67dc: e8 7f db 1f 00              	callq	0x1458a4360 <.text+0x58a3360>
1456a67e1: 90                          	nop
1456a67e2: eb 26                       	jmp	0x1456a680a <.text+0x56a580a>
1456a67e4: 31 c0                       	xorl	%eax, %eax
1456a67e6: eb 3c                       	jmp	0x1456a6824 <.text+0x56a5824>
1456a67e8: 4c 89 75 e8                 	movq	%r14, -0x18(%rbp)
1456a67ec: ff 15 0e f3 1f 00           	callq	*0x1ff30e(%rip)         # 0x1458a5b00
1456a67f2: 89 c6                       	movl	%eax, %esi
1456a67f4: 48 8b 05 3d 65 10 02        	movq	0x210653d(%rip), %rax   # 0x1477acd38
1456a67fb: 48 8b 00                    	movq	(%rax), %rax
1456a67fe: 48 8d 0d 6b a7 43 01        	leaq	0x143a76b(%rip), %rcx   # 0x146ae0f70
1456a6805: 48 39 c8                    	cmpq	%rcx, %rax
1456a6808: 75 5b                       	jne	0x1456a6865 <.text+0x56a5865>
1456a680a: 48 c1 e6 20                 	shlq	$0x20, %rsi
1456a680e: 48 83 ce 02                 	orq	$0x2, %rsi
1456a6812: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1456a6816: ff 15 7c f2 1f 00           	callq	*0x1ff27c(%rip)         # 0x1458a5a98
1456a681c: b8 01 00 00 00              	movl	$0x1, %eax
1456a6821: 49 89 f6                    	movq	%rsi, %r14
1456a6824: 4c 89 f2                    	movq	%r14, %rdx
1456a6827: 48 83 c4 70                 	addq	$0x70, %rsp
1456a682b: 5b                          	popq	%rbx
1456a682c: 5f                          	popq	%rdi
1456a682d: 5e                          	popq	%rsi
1456a682e: 41 5e                       	popq	%r14
1456a6830: 5d                          	popq	%rbp
1456a6831: c3                          	retq
1456a6832: 41 08 c1                    	orb	%al, %r9b
1456a6835: 41 08 f9                    	orb	%dil, %r9b
1456a6838: 41 f6 c1 01                 	testb	$0x1, %r9b
1456a683c: 0f 85 80 fd ff ff           	jne	0x1456a65c2 <.text+0x56a55c2>
1456a6842: 48 8d 15 87 c2 43 01        	leaq	0x143c287(%rip), %rdx   # 0x146ae2ad0
1456a6849: 41 b8 3a 00 00 00           	movl	$0x3a, %r8d
1456a684f: e9 7b fd ff ff              	jmp	0x1456a65cf <.text+0x56a55cf>
1456a6854: 48 8d 0d 15 a7 43 01        	leaq	0x143a715(%rip), %rcx   # 0x146ae0f70
1456a685b: e8 00 db 1f 00              	callq	0x1458a4360 <.text+0x58a3360>
1456a6860: e9 b1 fe ff ff              	jmp	0x1456a6716 <.text+0x56a5716>
1456a6865: 48 8d 0d 04 a7 43 01        	leaq	0x143a704(%rip), %rcx   # 0x146ae0f70
1456a686c: e8 ef da 1f 00              	callq	0x1458a4360 <.text+0x58a3360>
1456a6871: 90                          	nop
1456a6872: eb 96                       	jmp	0x1456a680a <.text+0x56a580a>
1456a6874: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1456a6880: 48 89 54 24 10              	movq	%rdx, 0x10(%rsp)
1456a6885: 55                          	pushq	%rbp
1456a6886: 41 56                       	pushq	%r14
1456a6888: 56                          	pushq	%rsi
1456a6889: 57                          	pushq	%rdi
1456a688a: 53                          	pushq	%rbx
1456a688b: 48 83 ec 40                 	subq	$0x40, %rsp
1456a688f: 48 8d 6a 70                 	leaq	0x70(%rdx), %rbp
1456a6893: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1456a6897: ff 15 fb f1 1f 00           	callq	*0x1ff1fb(%rip)         # 0x1458a5a98
1456a689d: 90                          	nop
1456a689e: 48 83 c4 40                 	addq	$0x40, %rsp
1456a68a2: 5b                          	popq	%rbx
1456a68a3: 5f                          	popq	%rdi
1456a68a4: 5e                          	popq	%rsi
1456a68a5: 41 5e                       	popq	%r14
1456a68a7: 5d                          	popq	%rbp
1456a68a8: c3                          	retq
1456a68a9: cc                          	int3
1456a68aa: cc                          	int3
1456a68ab: cc                          	int3
1456a68ac: cc                          	int3
1456a68ad: cc                          	int3
1456a68ae: cc                          	int3
1456a68af: cc                          	int3
