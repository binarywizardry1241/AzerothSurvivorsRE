

Disassembly of section .text:

0000000140001000 <.text>:
1458a9500: 55                          	pushq	%rbp
1458a9501: 41 57                       	pushq	%r15
1458a9503: 41 56                       	pushq	%r14
1458a9505: 41 54                       	pushq	%r12
1458a9507: 56                          	pushq	%rsi
1458a9508: 57                          	pushq	%rdi
1458a9509: 53                          	pushq	%rbx
1458a950a: 48 81 ec 80 00 00 00        	subq	$0x80, %rsp
1458a9511: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1458a9519: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1458a9521: 4c 89 cf                    	movq	%r9, %rdi
1458a9524: 4c 89 c3                    	movq	%r8, %rbx
1458a9527: 49 89 d6                    	movq	%rdx, %r14
1458a952a: 48 89 ce                    	movq	%rcx, %rsi
1458a952d: e8 ce 8c 75 fa              	callq	0x140002200 <.text+0x1200>
1458a9532: 41 bf 20 00 00 00           	movl	$0x20, %r15d
1458a9538: b9 20 00 00 00              	movl	$0x20, %ecx
1458a953d: ba 01 00 00 00              	movl	$0x1, %edx
1458a9542: e8 79 8c 75 fa              	callq	0x1400021c0 <.text+0x11c0>
1458a9547: 48 85 c0                    	testq	%rax, %rax
1458a954a: 0f 84 78 02 00 00           	je	0x1458a97c8 <.text+0x58a87c8>
1458a9550: c6 00 5a                    	movb	$0x5a, (%rax)
1458a9553: c7 40 01 00 00 00 00        	movl	$0x0, 0x1(%rax)
1458a955a: 8d 4b 01                    	leal	0x1(%rbx), %ecx
1458a955d: 89 48 05                    	movl	%ecx, 0x5(%rax)
1458a9560: 48 c7 45 d0 20 00 00 00     	movq	$0x20, -0x30(%rbp)
1458a9568: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1458a956c: 48 c7 45 e0 09 00 00 00     	movq	$0x9, -0x20(%rbp)
1458a9574: 66 c7 45 e8 96 00           	movw	$0x96, -0x18(%rbp)
1458a957a: 48 83 fb 18                 	cmpq	$0x18, %rbx
1458a957e: 0f 83 9a 01 00 00           	jae	0x1458a971e <.text+0x58a871e>
1458a9584: 41 bc 09 00 00 00           	movl	$0x9, %r12d
1458a958a: 48 85 db                    	testq	%rbx, %rbx
1458a958d: 74 12                       	je	0x1458a95a1 <.text+0x58a85a1>
1458a958f: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
1458a9593: 4c 01 e1                    	addq	%r12, %rcx
1458a9596: 4c 89 f2                    	movq	%r14, %rdx
1458a9599: 49 89 d8                    	movq	%rbx, %r8
1458a959c: e8 da 01 32 00              	callq	0x145bc977b <.text+0x5bc877b>
1458a95a1: 49 01 dc                    	addq	%rbx, %r12
1458a95a4: 4c 89 65 e0                 	movq	%r12, -0x20(%rbp)
1458a95a8: 4d 39 fc                    	cmpq	%r15, %r12
1458a95ab: 75 0a                       	jne	0x1458a95b7 <.text+0x58a85b7>
1458a95ad: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458a95b1: e8 8a fd 4b 00              	callq	0x145d69340 <.text+0x5d68340>
1458a95b6: 90                          	nop
1458a95b7: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1458a95bb: 42 c6 04 20 00              	movb	$0x0, (%rax,%r12)
1458a95c0: 49 ff c4                    	incq	%r12
1458a95c3: 4c 89 65 e0                 	movq	%r12, -0x20(%rbp)
1458a95c7: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
1458a95cb: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1458a95cf: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458a95d3: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1458a95d7: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458a95db: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1458a95df: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458a95e3: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458a95e7: 48 29 d0                    	subq	%rdx, %rax
1458a95ea: 48 83 f8 07                 	cmpq	$0x7, %rax
1458a95ee: 0f 86 58 01 00 00           	jbe	0x1458a974c <.text+0x58a874c>
1458a95f4: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458a95f8: 48 c7 04 10 00 00 00 00     	movq	$0x0, (%rax,%rdx)
1458a9600: 48 83 c2 08                 	addq	$0x8, %rdx
1458a9604: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
1458a9608: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1458a960c: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458a9610: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458a9614: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458a9618: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458a961c: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458a9620: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458a9624: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
1458a9628: 48 29 d0                    	subq	%rdx, %rax
1458a962b: 48 83 f8 03                 	cmpq	$0x3, %rax
1458a962f: 0f 86 3f 01 00 00           	jbe	0x1458a9774 <.text+0x58a8774>
1458a9635: 48 8b 5d 60                 	movq	0x60(%rbp), %rbx
1458a9639: 8d 43 01                    	leal	0x1(%rbx), %eax
1458a963c: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
1458a9640: 89 04 11                    	movl	%eax, (%rcx,%rdx)
1458a9643: 48 83 c2 04                 	addq	$0x4, %rdx
1458a9647: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
1458a964b: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
1458a964f: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1458a9653: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458a9657: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1458a965b: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458a965f: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1458a9663: 4c 8b 75 c0                 	movq	-0x40(%rbp), %r14
1458a9667: 4c 8b 7d b0                 	movq	-0x50(%rbp), %r15
1458a966b: 4c 89 f8                    	movq	%r15, %rax
1458a966e: 4c 29 f0                    	subq	%r14, %rax
1458a9671: 48 39 c3                    	cmpq	%rax, %rbx
1458a9674: 0f 87 22 01 00 00           	ja	0x1458a979c <.text+0x58a879c>
1458a967a: 48 85 db                    	testq	%rbx, %rbx
1458a967d: 74 12                       	je	0x1458a9691 <.text+0x58a8691>
1458a967f: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
1458a9683: 4c 01 f1                    	addq	%r14, %rcx
1458a9686: 48 89 fa                    	movq	%rdi, %rdx
1458a9689: 49 89 d8                    	movq	%rbx, %r8
1458a968c: e8 ea 00 32 00              	callq	0x145bc977b <.text+0x5bc877b>
1458a9691: 49 01 de                    	addq	%rbx, %r14
1458a9694: 4c 89 75 c0                 	movq	%r14, -0x40(%rbp)
1458a9698: 4d 39 fe                    	cmpq	%r15, %r14
1458a969b: 75 0a                       	jne	0x1458a96a7 <.text+0x58a86a7>
1458a969d: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458a96a1: e8 9a fc 4b 00              	callq	0x145d69340 <.text+0x5d68340>
1458a96a6: 90                          	nop
1458a96a7: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458a96ab: 42 c6 04 30 00              	movb	$0x0, (%rax,%r14)
1458a96b0: 49 ff c6                    	incq	%r14
1458a96b3: 4c 89 75 c0                 	movq	%r14, -0x40(%rbp)
1458a96b7: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1458a96bb: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458a96bf: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458a96c3: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458a96c7: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458a96cb: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458a96cf: 48 8b 7d e0                 	movq	-0x20(%rbp), %rdi
1458a96d3: 48 3b 7d d0                 	cmpq	-0x30(%rbp), %rdi
1458a96d7: 75 0a                       	jne	0x1458a96e3 <.text+0x58a86e3>
1458a96d9: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458a96dd: e8 5e fc 4b 00              	callq	0x145d69340 <.text+0x5d68340>
1458a96e2: 90                          	nop
1458a96e3: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1458a96e7: c6 04 38 00                 	movb	$0x0, (%rax,%rdi)
1458a96eb: 48 ff c7                    	incq	%rdi
1458a96ee: 48 89 7d e0                 	movq	%rdi, -0x20(%rbp)
1458a96f2: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
1458a96f6: 0f 11 06                    	movups	%xmm0, (%rsi)
1458a96f9: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458a96fd: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458a9701: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458a9705: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
1458a9709: 48 89 f0                    	movq	%rsi, %rax
1458a970c: 48 81 c4 80 00 00 00        	addq	$0x80, %rsp
1458a9713: 5b                          	popq	%rbx
1458a9714: 5f                          	popq	%rdi
1458a9715: 5e                          	popq	%rsi
1458a9716: 41 5c                       	popq	%r12
1458a9718: 41 5e                       	popq	%r14
1458a971a: 41 5f                       	popq	%r15
1458a971c: 5d                          	popq	%rbp
1458a971d: c3                          	retq
1458a971e: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a9727: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458a972b: ba 09 00 00 00              	movl	$0x9, %edx
1458a9730: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a9736: 49 89 d8                    	movq	%rbx, %r8
1458a9739: e8 92 1b 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a973e: 90                          	nop
1458a973f: 4c 8b 7d d0                 	movq	-0x30(%rbp), %r15
1458a9743: 4c 8b 65 e0                 	movq	-0x20(%rbp), %r12
1458a9747: e9 43 fe ff ff              	jmp	0x1458a958f <.text+0x58a858f>
1458a974c: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a9755: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458a9759: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1458a975f: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a9765: e8 66 1b 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a976a: 90                          	nop
1458a976b: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458a976f: e9 80 fe ff ff              	jmp	0x1458a95f4 <.text+0x58a85f4>
1458a9774: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a977d: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458a9781: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458a9787: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a978d: e8 3e 1b 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9792: 90                          	nop
1458a9793: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458a9797: e9 99 fe ff ff              	jmp	0x1458a9635 <.text+0x58a8635>
1458a979c: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a97a5: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458a97a9: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a97af: 4c 89 f2                    	movq	%r14, %rdx
1458a97b2: 49 89 d8                    	movq	%rbx, %r8
1458a97b5: e8 16 1b 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a97ba: 90                          	nop
1458a97bb: 4c 8b 7d b0                 	movq	-0x50(%rbp), %r15
1458a97bf: 4c 8b 75 c0                 	movq	-0x40(%rbp), %r14
1458a97c3: e9 b7 fe ff ff              	jmp	0x1458a967f <.text+0x58a867f>
1458a97c8: b9 01 00 00 00              	movl	$0x1, %ecx
1458a97cd: ba 20 00 00 00              	movl	$0x20, %edx
1458a97d2: e8 74 fc 4b 00              	callq	0x145d6944b <.text+0x5d6844b>
1458a97d7: 0f 0b                       	ud2
