1458a9970: 55                          	pushq	%rbp
1458a9971: 56                          	pushq	%rsi
1458a9972: 57                          	pushq	%rdi
1458a9973: 53                          	pushq	%rbx
1458a9974: 48 83 ec 78                 	subq	$0x78, %rsp
1458a9978: 48 8d 6c 24 70              	leaq	0x70(%rsp), %rbp
1458a997d: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1458a9985: 44 89 c7                    	movl	%r8d, %edi
1458a9988: 48 89 d3                    	movq	%rdx, %rbx
1458a998b: 48 89 ce                    	movq	%rcx, %rsi
1458a998e: e8 6d 88 75 fa              	callq	0x140002200 <.text+0x1200>
1458a9993: b9 20 00 00 00              	movl	$0x20, %ecx
1458a9998: ba 01 00 00 00              	movl	$0x1, %edx
1458a999d: e8 1e 88 75 fa              	callq	0x1400021c0 <.text+0x11c0>
1458a99a2: 48 85 c0                    	testq	%rax, %rax
1458a99a5: 0f 84 9f 00 00 00           	je	0x1458a9a4a <.text+0x58a8a4a>
1458a99ab: 66 c7 45 d8 e8 00           	movw	$0xe8, -0x28(%rbp)
1458a99b1: 48 c7 45 c0 20 00 00 00     	movq	$0x20, -0x40(%rbp)
1458a99b9: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1458a99bd: 48 c7 45 d0 00 00 00 00     	movq	$0x0, -0x30(%rbp)
1458a99c5: 48 8d 55 c0                 	leaq	-0x40(%rbp), %rdx
1458a99c9: 48 89 d9                    	movq	%rbx, %rcx
1458a99cc: e8 9f d2 00 00              	callq	0x1458b6c70 <.text+0x58b5c70>
1458a99d1: 90                          	nop
1458a99d2: 0f 10 45 c0                 	movups	-0x40(%rbp), %xmm0
1458a99d6: 0f 10 4d d0                 	movups	-0x30(%rbp), %xmm1
1458a99da: 0f 29 4d f0                 	movaps	%xmm1, -0x10(%rbp)
1458a99de: 0f 29 45 e0                 	movaps	%xmm0, -0x20(%rbp)
1458a99e2: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1458a99e6: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458a99ea: 48 29 d0                    	subq	%rdx, %rax
1458a99ed: 48 83 f8 03                 	cmpq	$0x3, %rax
1458a99f1: 76 32                       	jbe	0x1458a9a25 <.text+0x58a8a25>
1458a99f3: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458a99f7: 89 3c 10                    	movl	%edi, (%rax,%rdx)
1458a99fa: 48 83 c2 04                 	addq	$0x4, %rdx
1458a99fe: 48 89 55 f0                 	movq	%rdx, -0x10(%rbp)
1458a9a02: 0f 28 45 e0                 	movaps	-0x20(%rbp), %xmm0
1458a9a06: 0f 11 06                    	movups	%xmm0, (%rsi)
1458a9a09: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1458a9a0d: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458a9a11: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1458a9a15: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
1458a9a19: 48 89 f0                    	movq	%rsi, %rax
1458a9a1c: 48 83 c4 78                 	addq	$0x78, %rsp
1458a9a20: 5b                          	popq	%rbx
1458a9a21: 5f                          	popq	%rdi
1458a9a22: 5e                          	popq	%rsi
1458a9a23: 5d                          	popq	%rbp
1458a9a24: c3                          	retq
1458a9a25: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a9a2e: 48 8d 4d e0                 	leaq	-0x20(%rbp), %rcx
1458a9a32: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458a9a38: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a9a3e: e8 8d 18 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9a43: 90                          	nop
1458a9a44: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1458a9a48: eb a9                       	jmp	0x1458a99f3 <.text+0x58a89f3>
1458a9a4a: b9 01 00 00 00              	movl	$0x1, %ecx
1458a9a4f: ba 20 00 00 00              	movl	$0x20, %edx
1458a9a54: e8 f2 f9 4b 00              	callq	0x145d6944b <.text+0x5d6844b>
1458a9a59: 0f 0b                       	ud2
