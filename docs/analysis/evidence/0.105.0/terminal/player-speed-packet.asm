1458ad310: 55                          	pushq	%rbp
1458ad311: 56                          	pushq	%rsi
1458ad312: 57                          	pushq	%rdi
1458ad313: 53                          	pushq	%rbx
1458ad314: 48 81 ec 98 00 00 00        	subq	$0x98, %rsp
1458ad31b: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1458ad323: 0f 29 75 00                 	movaps	%xmm6, (%rbp)
1458ad327: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1458ad32f: 0f 28 f3                    	movaps	%xmm3, %xmm6
1458ad332: 44 89 c7                    	movl	%r8d, %edi
1458ad335: 48 89 d3                    	movq	%rdx, %rbx
1458ad338: 48 89 ce                    	movq	%rcx, %rsi
1458ad33b: e8 c0 4e 75 fa              	callq	0x140002200 <.text+0x1200>
1458ad340: b9 20 00 00 00              	movl	$0x20, %ecx
1458ad345: ba 01 00 00 00              	movl	$0x1, %edx
1458ad34a: e8 71 4e 75 fa              	callq	0x1400021c0 <.text+0x11c0>
1458ad34f: 48 85 c0                    	testq	%rax, %rax
1458ad352: 0f 84 0b 01 00 00           	je	0x1458ad463 <.text+0x58ac463>
1458ad358: 66 c7 45 e8 e2 00           	movw	$0xe2, -0x18(%rbp)
1458ad35e: 48 c7 45 d0 20 00 00 00     	movq	$0x20, -0x30(%rbp)
1458ad366: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1458ad36a: 48 c7 45 e0 00 00 00 00     	movq	$0x0, -0x20(%rbp)
1458ad372: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
1458ad376: 48 89 d9                    	movq	%rbx, %rcx
1458ad379: e8 f2 98 00 00              	callq	0x1458b6c70 <.text+0x58b5c70>
1458ad37e: 90                          	nop
1458ad37f: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
1458ad383: 0f 10 4d e0                 	movups	-0x20(%rbp), %xmm1
1458ad387: 0f 29 4d c0                 	movaps	%xmm1, -0x40(%rbp)
1458ad38b: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1458ad38f: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458ad393: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458ad397: 48 29 d0                    	subq	%rdx, %rax
1458ad39a: 48 83 f8 03                 	cmpq	$0x3, %rax
1458ad39e: 76 73                       	jbe	0x1458ad413 <.text+0x58ac413>
1458ad3a0: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458ad3a4: 89 3c 10                    	movl	%edi, (%rax,%rdx)
1458ad3a7: 48 83 c2 04                 	addq	$0x4, %rdx
1458ad3ab: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
1458ad3af: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
1458ad3b3: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
1458ad3b7: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458ad3bb: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1458ad3bf: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458ad3c3: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1458ad3c7: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458ad3cb: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
1458ad3cf: 48 29 d0                    	subq	%rdx, %rax
1458ad3d2: 48 83 f8 03                 	cmpq	$0x3, %rax
1458ad3d6: 76 63                       	jbe	0x1458ad43b <.text+0x58ac43b>
1458ad3d8: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1458ad3dc: f3 0f 11 34 10              	movss	%xmm6, (%rax,%rdx)
1458ad3e1: 48 83 c2 04                 	addq	$0x4, %rdx
1458ad3e5: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
1458ad3e9: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
1458ad3ed: 0f 11 06                    	movups	%xmm0, (%rsi)
1458ad3f0: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1458ad3f4: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458ad3f8: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1458ad3fc: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
1458ad400: 48 89 f0                    	movq	%rsi, %rax
1458ad403: 0f 28 75 00                 	movaps	(%rbp), %xmm6
1458ad407: 48 81 c4 98 00 00 00        	addq	$0x98, %rsp
1458ad40e: 5b                          	popq	%rbx
1458ad40f: 5f                          	popq	%rdi
1458ad410: 5e                          	popq	%rsi
1458ad411: 5d                          	popq	%rbp
1458ad412: c3                          	retq
1458ad413: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458ad41c: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458ad420: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458ad426: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458ad42c: e8 9f de 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ad431: 90                          	nop
1458ad432: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458ad436: e9 65 ff ff ff              	jmp	0x1458ad3a0 <.text+0x58ac3a0>
1458ad43b: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458ad444: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1458ad448: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458ad44e: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458ad454: e8 77 de 31 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ad459: 90                          	nop
1458ad45a: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1458ad45e: e9 75 ff ff ff              	jmp	0x1458ad3d8 <.text+0x58ac3d8>
1458ad463: b9 01 00 00 00              	movl	$0x1, %ecx
1458ad468: ba 20 00 00 00              	movl	$0x20, %edx
1458ad46d: e8 d9 bf 4b 00              	callq	0x145d6944b <.text+0x5d6844b>
1458ad472: 0f 0b                       	ud2
