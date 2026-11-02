
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540cb60: 41 57                       	pushq	%r15
14540cb62: 41 56                       	pushq	%r14
14540cb64: 56                          	pushq	%rsi
14540cb65: 57                          	pushq	%rdi
14540cb66: 53                          	pushq	%rbx
14540cb67: 48 83 ec 20                 	subq	$0x20, %rsp
14540cb6b: 48 83 fa 02                 	cmpq	$0x2, %rdx
14540cb6f: 0f 82 fe 00 00 00           	jb	0x14540cc73 <.text+0x540bc73>
14540cb75: 49 89 d1                    	movq	%rdx, %r9
14540cb78: 49 89 ca                    	movq	%rcx, %r10
14540cb7b: 49 8b 30                    	movq	(%r8), %rsi
14540cb7e: 49 8b 78 08                 	movq	0x8(%r8), %rdi
14540cb82: 49 8b 58 18                 	movq	0x18(%r8), %rbx
14540cb86: 4d 8b 70 10                 	movq	0x10(%r8), %r14
14540cb8a: 49 89 d3                    	movq	%rdx, %r11
14540cb8d: 0f 1f 00                    	nopl	(%rax)
14540cb90: 4c 89 d8                    	movq	%r11, %rax
14540cb93: 48 c1 e8 20                 	shrq	$0x20, %rax
14540cb97: 75 67                       	jne	0x14540cc00 <.text+0x540bc00>
14540cb99: 41 0f bd cb                 	bsrl	%r11d, %ecx
14540cb9d: f7 d1                       	notl	%ecx
14540cb9f: 44 89 d8                    	movl	%r11d, %eax
14540cba2: d3 e0                       	shll	%cl, %eax
14540cba4: ff c8                       	decl	%eax
14540cba6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14540cbb0: 48 8d 14 1e                 	leaq	(%rsi,%rbx), %rdx
14540cbb4: 48 c1 c2 17                 	rolq	$0x17, %rdx
14540cbb8: 48 01 f2                    	addq	%rsi, %rdx
14540cbbb: 48 89 f9                    	movq	%rdi, %rcx
14540cbbe: 48 c1 e1 11                 	shlq	$0x11, %rcx
14540cbc2: 49 31 f6                    	xorq	%rsi, %r14
14540cbc5: 48 31 fb                    	xorq	%rdi, %rbx
14540cbc8: 4c 31 f7                    	xorq	%r14, %rdi
14540cbcb: 48 31 de                    	xorq	%rbx, %rsi
14540cbce: 48 c1 c3 2d                 	rolq	$0x2d, %rbx
14540cbd2: 49 31 ce                    	xorq	%rcx, %r14
14540cbd5: 48 c1 ea 20                 	shrq	$0x20, %rdx
14540cbd9: 49 0f af d3                 	imulq	%r11, %rdx
14540cbdd: 39 d0                       	cmpl	%edx, %eax
14540cbdf: 72 cf                       	jb	0x14540cbb0 <.text+0x540bbb0>
14540cbe1: 49 89 30                    	movq	%rsi, (%r8)
14540cbe4: 49 89 58 18                 	movq	%rbx, 0x18(%r8)
14540cbe8: 49 89 78 08                 	movq	%rdi, 0x8(%r8)
14540cbec: 4d 89 70 10                 	movq	%r14, 0x10(%r8)
14540cbf0: 48 c1 ea 20                 	shrq	$0x20, %rdx
14540cbf4: eb 56                       	jmp	0x14540cc4c <.text+0x540bc4c>
14540cbf6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14540cc00: 49 0f bd cb                 	bsrq	%r11, %rcx
14540cc04: f7 d1                       	notl	%ecx
14540cc06: 4d 89 df                    	movq	%r11, %r15
14540cc09: 49 d3 e7                    	shlq	%cl, %r15
14540cc0c: 49 ff cf                    	decq	%r15
14540cc0f: 90                          	nop
14540cc10: 48 8d 04 1e                 	leaq	(%rsi,%rbx), %rax
14540cc14: 48 c1 c0 17                 	rolq	$0x17, %rax
14540cc18: 48 01 f0                    	addq	%rsi, %rax
14540cc1b: 48 89 f9                    	movq	%rdi, %rcx
14540cc1e: 48 c1 e1 11                 	shlq	$0x11, %rcx
14540cc22: 49 31 f6                    	xorq	%rsi, %r14
14540cc25: 48 31 fb                    	xorq	%rdi, %rbx
14540cc28: 48 31 de                    	xorq	%rbx, %rsi
14540cc2b: 48 c1 c3 2d                 	rolq	$0x2d, %rbx
14540cc2f: 4c 31 f7                    	xorq	%r14, %rdi
14540cc32: 49 f7 e3                    	mulq	%r11
14540cc35: 49 31 ce                    	xorq	%rcx, %r14
14540cc38: 49 39 c7                    	cmpq	%rax, %r15
14540cc3b: 72 d3                       	jb	0x14540cc10 <.text+0x540bc10>
14540cc3d: 49 89 30                    	movq	%rsi, (%r8)
14540cc40: 49 89 58 18                 	movq	%rbx, 0x18(%r8)
14540cc44: 49 89 78 08                 	movq	%rdi, 0x8(%r8)
14540cc48: 4d 89 70 10                 	movq	%r14, 0x10(%r8)
14540cc4c: 49 ff cb                    	decq	%r11
14540cc4f: 4d 39 cb                    	cmpq	%r9, %r11
14540cc52: 73 3f                       	jae	0x14540cc93 <.text+0x540bc93>
14540cc54: 4c 39 ca                    	cmpq	%r9, %rdx
14540cc57: 73 26                       	jae	0x14540cc7f <.text+0x540bc7f>
14540cc59: 4b 8b 04 da                 	movq	(%r10,%r11,8), %rax
14540cc5d: 49 8b 0c d2                 	movq	(%r10,%rdx,8), %rcx
14540cc61: 4b 89 0c da                 	movq	%rcx, (%r10,%r11,8)
14540cc65: 49 89 04 d2                 	movq	%rax, (%r10,%rdx,8)
14540cc69: 49 83 fb 01                 	cmpq	$0x1, %r11
14540cc6d: 0f 87 1d ff ff ff           	ja	0x14540cb90 <.text+0x540bb90>
14540cc73: 48 83 c4 20                 	addq	$0x20, %rsp
14540cc77: 5b                          	popq	%rbx
14540cc78: 5f                          	popq	%rdi
14540cc79: 5e                          	popq	%rsi
14540cc7a: 41 5e                       	popq	%r14
14540cc7c: 41 5f                       	popq	%r15
14540cc7e: c3                          	retq
14540cc7f: 4c 8d 05 1a 1b 30 01        	leaq	0x1301b1a(%rip), %r8    # 0x14670e7a0
14540cc86: 48 89 d1                    	movq	%rdx, %rcx
14540cc89: 4c 89 ca                    	movq	%r9, %rdx
14540cc8c: e8 22 a9 4d 00              	callq	0x1458e75b3 <.text+0x58e65b3>
14540cc91: 0f 0b                       	ud2
14540cc93: 4c 8d 05 06 1b 30 01        	leaq	0x1301b06(%rip), %r8    # 0x14670e7a0
14540cc9a: 4c 89 d9                    	movq	%r11, %rcx
14540cc9d: 4c 89 ca                    	movq	%r9, %rdx
14540cca0: e8 0e a9 4d 00              	callq	0x1458e75b3 <.text+0x58e65b3>
14540cca5: 0f 0b                       	ud2
