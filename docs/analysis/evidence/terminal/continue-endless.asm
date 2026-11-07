

Disassembly of section .text:

0000000140001000 <.text>:
1458f0110: 55                          	pushq	%rbp
1458f0111: 41 57                       	pushq	%r15
1458f0113: 41 56                       	pushq	%r14
1458f0115: 41 54                       	pushq	%r12
1458f0117: 56                          	pushq	%rsi
1458f0118: 57                          	pushq	%rdi
1458f0119: 53                          	pushq	%rbx
1458f011a: 48 83 ec 50                 	subq	$0x50, %rsp
1458f011e: 48 8d 6c 24 50              	leaq	0x50(%rsp), %rbp
1458f0123: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1458f012b: 80 b9 73 0a 00 00 05        	cmpb	$0x5, 0xa73(%rcx)
1458f0132: 0f 85 32 01 00 00           	jne	0x1458f026a <.text+0x58ef26a>
1458f0138: 48 89 ce                    	movq	%rcx, %rsi
1458f013b: c6 81 64 0a 00 00 01        	movb	$0x1, 0xa64(%rcx)
1458f0142: c6 81 73 0a 00 00 01        	movb	$0x1, 0xa73(%rcx)
1458f0149: f3 0f 10 81 ec 09 00 00     	movss	0x9ec(%rcx), %xmm0
1458f0151: f3 0f 58 05 c7 6f 2c 01     	addss	0x12c6fc7(%rip), %xmm0  # 0x146bb7120
1458f0159: f3 0f 11 81 3c 0a 00 00     	movss	%xmm0, 0xa3c(%rcx)
1458f0161: 48 8d b9 d0 05 00 00        	leaq	0x5d0(%rcx), %rdi
1458f0168: 48 8b 91 60 04 00 00        	movq	0x460(%rcx), %rdx
1458f016f: 44 8b 81 48 05 00 00        	movl	0x548(%rcx), %r8d
1458f0176: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1458f017a: e8 31 a2 fb ff              	callq	0x1458aa3b0 <.text+0x58a93b0>
1458f017f: 48 8b 9e e0 05 00 00        	movq	0x5e0(%rsi), %rbx
1458f0186: 48 3b 9e d0 05 00 00        	cmpq	0x5d0(%rsi), %rbx
1458f018d: 75 09                       	jne	0x1458f0198 <.text+0x58ef198>
1458f018f: 48 89 f9                    	movq	%rdi, %rcx
1458f0192: e8 99 b3 2d 00              	callq	0x145bcb530 <.text+0x5bca530>
1458f0197: 90                          	nop
1458f0198: 48 8b 86 d8 05 00 00        	movq	0x5d8(%rsi), %rax
1458f019f: 48 89 d9                    	movq	%rbx, %rcx
1458f01a2: 48 c1 e1 05                 	shlq	$0x5, %rcx
1458f01a6: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
1458f01aa: 0f 10 4d e8                 	movups	-0x18(%rbp), %xmm1
1458f01ae: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1458f01b3: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1458f01b7: 48 ff c3                    	incq	%rbx
1458f01ba: 48 89 9e e0 05 00 00        	movq	%rbx, 0x5e0(%rsi)
1458f01c1: ff 86 48 05 00 00           	incl	0x548(%rsi)
1458f01c7: 48 8d 1d 0e 8d 58 01        	leaq	0x1588d0e(%rip), %rbx   # 0x146e78edc
1458f01ce: 41 be 07 00 00 00           	movl	$0x7, %r14d
1458f01d4: ba 07 00 00 00              	movl	$0x7, %edx
1458f01d9: 48 89 d9                    	movq	%rbx, %rcx
1458f01dc: e8 af a3 fe ff              	callq	0x1458da590 <.text+0x58d9590>
1458f01e1: 48 85 c0                    	testq	%rax, %rax
1458f01e4: 48 0f 45 d8                 	cmovneq	%rax, %rbx
1458f01e8: 4c 0f 45 f2                 	cmovneq	%rdx, %r14
1458f01ec: 4c 8d 3d f0 8c 58 01        	leaq	0x1588cf0(%rip), %r15   # 0x146e78ee3
1458f01f3: 41 bc 1b 00 00 00           	movl	$0x1b, %r12d
1458f01f9: ba 1b 00 00 00              	movl	$0x1b, %edx
1458f01fe: 4c 89 f9                    	movq	%r15, %rcx
1458f0201: e8 8a a3 fe ff              	callq	0x1458da590 <.text+0x58d9590>
1458f0206: 48 85 c0                    	testq	%rax, %rax
1458f0209: 4c 0f 45 f8                 	cmovneq	%rax, %r15
1458f020d: 49 0f 44 d4                 	cmoveq	%r12, %rdx
1458f0211: 48 89 54 24 20              	movq	%rdx, 0x20(%rsp)
1458f0216: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1458f021a: 48 89 da                    	movq	%rbx, %rdx
1458f021d: 4d 89 f0                    	movq	%r14, %r8
1458f0220: 4d 89 f9                    	movq	%r15, %r9
1458f0223: e8 d8 92 fb ff              	callq	0x1458a9500 <.text+0x58a8500>
1458f0228: 48 8b 9e e0 05 00 00        	movq	0x5e0(%rsi), %rbx
1458f022f: 48 3b 9e d0 05 00 00        	cmpq	0x5d0(%rsi), %rbx
1458f0236: 75 09                       	jne	0x1458f0241 <.text+0x58ef241>
1458f0238: 48 89 f9                    	movq	%rdi, %rcx
1458f023b: e8 f0 b2 2d 00              	callq	0x145bcb530 <.text+0x5bca530>
1458f0240: 90                          	nop
1458f0241: 48 8b 86 d8 05 00 00        	movq	0x5d8(%rsi), %rax
1458f0248: 48 89 d9                    	movq	%rbx, %rcx
1458f024b: 48 c1 e1 05                 	shlq	$0x5, %rcx
1458f024f: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
1458f0253: 0f 10 4d e8                 	movups	-0x18(%rbp), %xmm1
1458f0257: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1458f025c: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1458f0260: 48 ff c3                    	incq	%rbx
1458f0263: 48 89 9e e0 05 00 00        	movq	%rbx, 0x5e0(%rsi)
1458f026a: 48 83 c4 50                 	addq	$0x50, %rsp
1458f026e: 5b                          	popq	%rbx
1458f026f: 5f                          	popq	%rdi
1458f0270: 5e                          	popq	%rsi
1458f0271: 41 5c                       	popq	%r12
1458f0273: 41 5e                       	popq	%r14
1458f0275: 41 5f                       	popq	%r15
1458f0277: 5d                          	popq	%rbp
1458f0278: c3                          	retq
