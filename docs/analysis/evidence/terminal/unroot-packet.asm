

Disassembly of section .text:

0000000140001000 <.text>:
1458aa3b0: 55                          	pushq	%rbp
1458aa3b1: 56                          	pushq	%rsi
1458aa3b2: 57                          	pushq	%rdi
1458aa3b3: 53                          	pushq	%rbx
1458aa3b4: 48 83 ec 78                 	subq	$0x78, %rsp
1458aa3b8: 48 8d 6c 24 70              	leaq	0x70(%rsp), %rbp
1458aa3bd: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1458aa3c5: 44 89 c7                    	movl	%r8d, %edi
1458aa3c8: 48 89 d3                    	movq	%rdx, %rbx
1458aa3cb: 48 89 ce                    	movq	%rcx, %rsi
1458aa3ce: e8 2d 7e 75 fa              	callq	0x140002200 <.text+0x1200>
1458aa3d3: b9 20 00 00 00              	movl	$0x20, %ecx
1458aa3d8: ba 01 00 00 00              	movl	$0x1, %edx
1458aa3dd: e8 de 7d 75 fa              	callq	0x1400021c0 <.text+0x11c0>
1458aa3e2: 48 85 c0                    	testq	%rax, %rax
1458aa3e5: 0f 84 9f 00 00 00           	je	0x1458aa48a <.text+0x58a948a>
1458aa3eb: 66 c7 45 d8 ea 00           	movw	$0xea, -0x28(%rbp)
1458aa3f1: 48 c7 45 c0 20 00 00 00     	movq	$0x20, -0x40(%rbp)
1458aa3f9: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1458aa3fd: 48 c7 45 d0 00 00 00 00     	movq	$0x0, -0x30(%rbp)
1458aa405: 48 8d 55 c0                 	leaq	-0x40(%rbp), %rdx
1458aa409: 48 89 d9                    	movq	%rbx, %rcx
1458aa40c: e8 5f c8 00 00              	callq	0x1458b6c70 <.text+0x58b5c70>
1458aa411: 90                          	nop
1458aa412: 0f 10 45 c0                 	movups	-0x40(%rbp), %xmm0
1458aa416: 0f 10 4d d0                 	movups	-0x30(%rbp), %xmm1
1458aa41a: 0f 29 4d f0                 	movaps	%xmm1, -0x10(%rbp)
1458aa41e: 0f 29 45 e0                 	movaps	%xmm0, -0x20(%rbp)
1458aa422: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1458aa426: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458aa42a: 48 29 d0                    	subq	%rdx, %rax
1458aa42d: 48 83 f8 03                 	cmpq	$0x3, %rax
1458aa431: 76 32                       	jbe	0x1458aa465 <.text+0x58a9465>
1458aa433: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458aa437: 89 3c 10                    	movl	%edi, (%rax,%rdx)
1458aa43a: 48 83 c2 04                 	addq	$0x4, %rdx
1458aa43e: 48 89 55 f0                 	movq	%rdx, -0x10(%rbp)
1458aa442: 0f 28 45 e0                 	movaps	-0x20(%rbp), %xmm0
1458aa446: 0f 11 06                    	movups	%xmm0, (%rsi)
1458aa449: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1458aa44d: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458aa451: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1458aa455: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
1458aa459: 48 89 f0                    	movq	%rsi, %rax
1458aa45c: 48 83 c4 78                 	addq	$0x78, %rsp
1458aa460: 5b                          	popq	%rbx
1458aa461: 5f                          	popq	%rdi
1458aa462: 5e                          	popq	%rsi
1458aa463: 5d                          	popq	%rbp
1458aa464: c3                          	retq
1458aa465: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458aa46e: 48 8d 4d e0                 	leaq	-0x20(%rbp), %rcx
1458aa472: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458aa478: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458aa47e: e8 4d 0e 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa483: 90                          	nop
1458aa484: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1458aa488: eb a9                       	jmp	0x1458aa433 <.text+0x58a9433>
1458aa48a: b9 01 00 00 00              	movl	$0x1, %ecx
1458aa48f: ba 20 00 00 00              	movl	$0x20, %edx
1458aa494: e8 b2 ef 4b 00              	callq	0x145d6944b <.text+0x5d6844b>
1458aa499: 0f 0b                       	ud2
