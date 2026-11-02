1458b57d0: 55                          	pushq	%rbp
1458b57d1: 41 56                       	pushq	%r14
1458b57d3: 56                          	pushq	%rsi
1458b57d4: 57                          	pushq	%rdi
1458b57d5: 53                          	pushq	%rbx
1458b57d6: 48 81 ec 80 00 00 00        	subq	$0x80, %rsp
1458b57dd: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1458b57e5: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1458b57ed: 4c 89 cf                    	movq	%r9, %rdi
1458b57f0: 44 89 c3                    	movl	%r8d, %ebx
1458b57f3: 49 89 d6                    	movq	%rdx, %r14
1458b57f6: 48 89 ce                    	movq	%rcx, %rsi
1458b57f9: e8 02 ca 74 fa              	callq	0x140002200 <.text+0x1200>
1458b57fe: b9 20 00 00 00              	movl	$0x20, %ecx
1458b5803: ba 01 00 00 00              	movl	$0x1, %edx
1458b5808: e8 b3 c9 74 fa              	callq	0x1400021c0 <.text+0x11c0>
1458b580d: 48 85 c0                    	testq	%rax, %rax
1458b5810: 0f 84 5e 02 00 00           	je	0x1458b5a74 <.text+0x58b4a74>
1458b5816: 66 c7 45 e8 c7 00           	movw	$0xc7, -0x18(%rbp)
1458b581c: 48 c7 45 d0 20 00 00 00     	movq	$0x20, -0x30(%rbp)
1458b5824: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1458b5828: 48 c7 45 e0 00 00 00 00     	movq	$0x0, -0x20(%rbp)
1458b5830: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
1458b5834: 4c 89 f1                    	movq	%r14, %rcx
1458b5837: e8 34 14 00 00              	callq	0x1458b6c70 <.text+0x58b5c70>
1458b583c: 90                          	nop
1458b583d: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
1458b5841: 0f 10 4d e0                 	movups	-0x20(%rbp), %xmm1
1458b5845: 0f 29 4d c0                 	movaps	%xmm1, -0x40(%rbp)
1458b5849: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1458b584d: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b5851: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458b5855: 48 29 d0                    	subq	%rdx, %rax
1458b5858: 48 83 f8 03                 	cmpq	$0x3, %rax
1458b585c: 0f 86 4a 01 00 00           	jbe	0x1458b59ac <.text+0x58b49ac>
1458b5862: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458b5866: 89 1c 10                    	movl	%ebx, (%rax,%rdx)
1458b5869: 48 83 c2 04                 	addq	$0x4, %rdx
1458b586d: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
1458b5871: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1458b5875: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458b5879: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458b587d: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458b5881: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458b5885: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458b5889: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458b588d: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
1458b5891: 48 29 d0                    	subq	%rdx, %rax
1458b5894: 48 83 f8 03                 	cmpq	$0x3, %rax
1458b5898: 0f 86 36 01 00 00           	jbe	0x1458b59d4 <.text+0x58b49d4>
1458b589e: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1458b58a2: c7 04 10 00 00 00 00        	movl	$0x0, (%rax,%rdx)
1458b58a9: 48 83 c2 04                 	addq	$0x4, %rdx
1458b58ad: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
1458b58b1: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
1458b58b5: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1458b58b9: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458b58bd: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1458b58c1: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458b58c5: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1458b58c9: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b58cd: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458b58d1: 48 29 d0                    	subq	%rdx, %rax
1458b58d4: 48 83 f8 03                 	cmpq	$0x3, %rax
1458b58d8: 0f 86 1e 01 00 00           	jbe	0x1458b59fc <.text+0x58b49fc>
1458b58de: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458b58e2: c7 04 10 00 00 00 00        	movl	$0x0, (%rax,%rdx)
1458b58e9: 48 83 c2 04                 	addq	$0x4, %rdx
1458b58ed: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
1458b58f1: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1458b58f5: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458b58f9: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458b58fd: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458b5901: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458b5905: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458b5909: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458b590d: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
1458b5911: 49 89 f8                    	movq	%rdi, %r8
1458b5914: e8 87 02 fe ff              	callq	0x145895ba0 <.text+0x5894ba0>
1458b5919: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458b591d: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b5921: 48 29 d0                    	subq	%rdx, %rax
1458b5924: 48 83 f8 03                 	cmpq	$0x3, %rax
1458b5928: 0f 86 f6 00 00 00           	jbe	0x1458b5a24 <.text+0x58b4a24>
1458b592e: f3 0f 10 45 50              	movss	0x50(%rbp), %xmm0
1458b5933: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458b5937: f3 0f 11 04 10              	movss	%xmm0, (%rax,%rdx)
1458b593c: 48 83 c2 04                 	addq	$0x4, %rdx
1458b5940: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
1458b5944: 0f 10 45 b0                 	movups	-0x50(%rbp), %xmm0
1458b5948: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458b594c: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458b5950: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458b5954: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458b5958: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458b595c: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458b5960: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
1458b5964: 48 29 d0                    	subq	%rdx, %rax
1458b5967: 48 83 f8 03                 	cmpq	$0x3, %rax
1458b596b: 0f 86 db 00 00 00           	jbe	0x1458b5a4c <.text+0x58b4a4c>
1458b5971: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1458b5975: c7 04 10 00 00 00 00        	movl	$0x0, (%rax,%rdx)
1458b597c: 48 83 c2 04                 	addq	$0x4, %rdx
1458b5980: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
1458b5984: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
1458b5988: 0f 11 06                    	movups	%xmm0, (%rsi)
1458b598b: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458b598f: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458b5993: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458b5997: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
1458b599b: 48 89 f0                    	movq	%rsi, %rax
1458b599e: 48 81 c4 80 00 00 00        	addq	$0x80, %rsp
1458b59a5: 5b                          	popq	%rbx
1458b59a6: 5f                          	popq	%rdi
1458b59a7: 5e                          	popq	%rsi
1458b59a8: 41 5e                       	popq	%r14
1458b59aa: 5d                          	popq	%rbp
1458b59ab: c3                          	retq
1458b59ac: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458b59b5: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458b59b9: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458b59bf: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458b59c5: e8 06 59 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458b59ca: 90                          	nop
1458b59cb: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b59cf: e9 8e fe ff ff              	jmp	0x1458b5862 <.text+0x58b4862>
1458b59d4: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458b59dd: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458b59e1: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458b59e7: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458b59ed: e8 de 58 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458b59f2: 90                          	nop
1458b59f3: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458b59f7: e9 a2 fe ff ff              	jmp	0x1458b589e <.text+0x58b489e>
1458b59fc: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458b5a05: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458b5a09: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458b5a0f: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458b5a15: e8 b6 58 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458b5a1a: 90                          	nop
1458b5a1b: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b5a1f: e9 ba fe ff ff              	jmp	0x1458b58de <.text+0x58b48de>
1458b5a24: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458b5a2d: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458b5a31: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458b5a37: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458b5a3d: e8 8e 58 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458b5a42: 90                          	nop
1458b5a43: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458b5a47: e9 e2 fe ff ff              	jmp	0x1458b592e <.text+0x58b492e>
1458b5a4c: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458b5a55: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458b5a59: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458b5a5f: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458b5a65: e8 66 58 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458b5a6a: 90                          	nop
1458b5a6b: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458b5a6f: e9 fd fe ff ff              	jmp	0x1458b5971 <.text+0x58b4971>
1458b5a74: b9 01 00 00 00              	movl	$0x1, %ecx
1458b5a79: ba 20 00 00 00              	movl	$0x20, %edx
1458b5a7e: e8 c8 39 4b 00              	callq	0x145d6944b <.text+0x5d6844b>
1458b5a83: 0f 0b                       	ud2
