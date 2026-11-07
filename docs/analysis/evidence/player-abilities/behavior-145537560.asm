
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145537560: 55                          	pushq	%rbp
145537561: 41 57                       	pushq	%r15
145537563: 41 56                       	pushq	%r14
145537565: 41 55                       	pushq	%r13
145537567: 41 54                       	pushq	%r12
145537569: 56                          	pushq	%rsi
14553756a: 57                          	pushq	%rdi
14553756b: 53                          	pushq	%rbx
14553756c: 48 83 ec 38                 	subq	$0x38, %rsp
145537570: 48 8d 6c 24 30              	leaq	0x30(%rsp), %rbp
145537575: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
14553757d: 48 8b 5a 08                 	movq	0x8(%rdx), %rbx
145537581: 4c 8b 72 10                 	movq	0x10(%rdx), %r14
145537585: 31 ff                       	xorl	%edi, %edi
145537587: 4d 89 f5                    	movq	%r14, %r13
14553758a: 49 29 dd                    	subq	%rbx, %r13
14553758d: 4c 0f 42 ef                 	cmovbq	%rdi, %r13
145537591: 4a 8d 34 ed 00 00 00 00     	leaq	(,%r13,8), %rsi
145537599: 4c 89 e8                    	movq	%r13, %rax
14553759c: 48 c1 e8 3d                 	shrq	$0x3d, %rax
1455375a0: 0f 95 c0                    	setne	%al
1455375a3: 49 b8 f8 ff ff ff ff ff ff 7f       	movabsq	$0x7ffffffffffffff8, %r8 # imm = 0x7FFFFFFFFFFFFFF8
1455375ad: 4c 39 c6                    	cmpq	%r8, %rsi
1455375b0: 41 0f 97 c0                 	seta	%r8b
1455375b4: 41 08 c0                    	orb	%al, %r8b
1455375b7: 74 0d                       	je	0x1455375c6 <.text+0x55365c6>
1455375b9: 48 89 f9                    	movq	%rdi, %rcx
1455375bc: 48 89 f2                    	movq	%rsi, %rdx
1455375bf: e8 57 fc 3a 00              	callq	0x1458e721b <.text+0x58e621b>
1455375c4: 0f 0b                       	ud2
1455375c6: 48 85 f6                    	testq	%rsi, %rsi
1455375c9: 0f 84 7c 00 00 00           	je	0x14553764b <.text+0x553664b>
1455375cf: 49 89 cf                    	movq	%rcx, %r15
1455375d2: 49 89 d4                    	movq	%rdx, %r12
1455375d5: e8 26 ac ac fa              	callq	0x140002200 <.text+0x1200>
1455375da: bf 08 00 00 00              	movl	$0x8, %edi
1455375df: ba 08 00 00 00              	movl	$0x8, %edx
1455375e4: 48 89 f1                    	movq	%rsi, %rcx
1455375e7: e8 d4 ab ac fa              	callq	0x1400021c0 <.text+0x11c0>
1455375ec: 48 85 c0                    	testq	%rax, %rax
1455375ef: 74 c8                       	je	0x1455375b9 <.text+0x55365b9>
1455375f1: 4c 89 e2                    	movq	%r12, %rdx
1455375f4: 4c 89 f9                    	movq	%r15, %rcx
1455375f7: 49 89 c7                    	movq	%rax, %r15
1455375fa: 49 89 d9                    	movq	%rbx, %r9
1455375fd: 4d 29 f1                    	subq	%r14, %r9
145537600: 73 5a                       	jae	0x14553765c <.text+0x553665c>
145537602: 4c 8b 12                    	movq	(%rdx), %r10
145537605: 45 31 c0                    	xorl	%r8d, %r8d
145537608: eb 1e                       	jmp	0x145537628 <.text+0x5536628>
14553760a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
145537610: 31 d2                       	xorl	%edx, %edx
145537612: 48 f7 f6                    	divq	%rsi
145537615: 49 8b 04 d3                 	movq	(%r11,%rdx,8), %rax
145537619: 4b 89 04 c7                 	movq	%rax, (%r15,%r8,8)
14553761d: 49 ff c0                    	incq	%r8
145537620: 4c 89 c8                    	movq	%r9, %rax
145537623: 4c 01 c0                    	addq	%r8, %rax
145537626: 74 37                       	je	0x14553765f <.text+0x553665f>
145537628: 49 8b 72 10                 	movq	0x10(%r10), %rsi
14553762c: 48 85 f6                    	testq	%rsi, %rsi
14553762f: 74 4d                       	je	0x14553767e <.text+0x553667e>
145537631: 4a 8d 04 03                 	leaq	(%rbx,%r8), %rax
145537635: 4d 8b 5a 08                 	movq	0x8(%r10), %r11
145537639: 48 89 c2                    	movq	%rax, %rdx
14553763c: 48 09 f2                    	orq	%rsi, %rdx
14553763f: 48 c1 ea 20                 	shrq	$0x20, %rdx
145537643: 75 cb                       	jne	0x145537610 <.text+0x5536610>
145537645: 31 d2                       	xorl	%edx, %edx
145537647: f7 f6                       	divl	%esi
145537649: eb ca                       	jmp	0x145537615 <.text+0x5536615>
14553764b: 41 bf 08 00 00 00           	movl	$0x8, %r15d
145537651: 45 31 ed                    	xorl	%r13d, %r13d
145537654: 49 89 d9                    	movq	%rbx, %r9
145537657: 4d 29 f1                    	subq	%r14, %r9
14553765a: 72 a6                       	jb	0x145537602 <.text+0x5536602>
14553765c: 45 31 c0                    	xorl	%r8d, %r8d
14553765f: 4c 89 29                    	movq	%r13, (%rcx)
145537662: 4c 89 79 08                 	movq	%r15, 0x8(%rcx)
145537666: 4c 89 41 10                 	movq	%r8, 0x10(%rcx)
14553766a: 48 89 c8                    	movq	%rcx, %rax
14553766d: 48 83 c4 38                 	addq	$0x38, %rsp
145537671: 5b                          	popq	%rbx
145537672: 5f                          	popq	%rdi
145537673: 5e                          	popq	%rsi
145537674: 41 5c                       	popq	%r12
145537676: 41 5d                       	popq	%r13
145537678: 41 5e                       	popq	%r14
14553767a: 41 5f                       	popq	%r15
14553767c: 5d                          	popq	%rbp
14553767d: c3                          	retq
14553767e: 4c 89 7d f0                 	movq	%r15, -0x10(%rbp)
145537682: 4c 89 6d f8                 	movq	%r13, -0x8(%rbp)
145537686: 48 8d 0d fb 20 7b 01        	leaq	0x17b20fb(%rip), %rcx   # 0x146ce9788
14553768d: e8 1e 02 3b 00              	callq	0x1458e78b0 <.text+0x58e68b0>
145537692: 90                          	nop
145537693: 0f 0b                       	ud2
