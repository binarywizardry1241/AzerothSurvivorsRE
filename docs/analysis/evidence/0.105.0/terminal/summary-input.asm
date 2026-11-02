Disassembly of section .text:
0000000140001000 <.text>:
140275bc0: 55                          	pushq	%rbp
140275bc1: 41 57                       	pushq	%r15
140275bc3: 41 56                       	pushq	%r14
140275bc5: 41 55                       	pushq	%r13
140275bc7: 41 54                       	pushq	%r12
140275bc9: 56                          	pushq	%rsi
140275bca: 57                          	pushq	%rdi
140275bcb: 53                          	pushq	%rbx
140275bcc: 48 81 ec c8 01 00 00        	subq	$0x1c8, %rsp            # imm = 0x1C8
140275bd3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
140275bdb: 0f 29 bd 30 01 00 00        	movaps	%xmm7, 0x130(%rbp)
140275be2: 0f 29 b5 20 01 00 00        	movaps	%xmm6, 0x120(%rbp)
140275be9: 48 c7 85 18 01 00 00 fe ff ff ff    	movq	$-0x2, 0x118(%rbp)
140275bf4: 48 8b 85 b0 01 00 00        	movq	0x1b0(%rbp), %rax
140275bfb: 48 8b 1a                    	movq	(%rdx), %rbx
140275bfe: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
140275c02: 44 8b 62 14                 	movl	0x14(%rdx), %r12d
140275c06: 49 8b 08                    	movq	(%r8), %rcx
140275c09: 48 89 8d 98 00 00 00        	movq	%rcx, 0x98(%rbp)
140275c10: 49 8b 09                    	movq	(%r9), %rcx
140275c13: 4d 8b 51 10                 	movq	0x10(%r9), %r10
140275c17: 45 8b 59 1c                 	movl	0x1c(%r9), %r11d
140275c1b: 48 8b 00                    	movq	(%rax), %rax
140275c1e: 48 89 85 90 00 00 00        	movq	%rax, 0x90(%rbp)
140275c25: 48 8b b3 f8 00 00 00        	movq	0xf8(%rbx), %rsi
140275c2c: 48 8b 83 00 01 00 00        	movq	0x100(%rbx), %rax
140275c33: 4c 8d 2c 86                 	leaq	(%rsi,%rax,4), %r13
140275c37: 44 0f b6 83 08 01 00 00     	movzbl	0x108(%rbx), %r8d
140275c3f: 44 89 e0                    	movl	%r12d, %eax
140275c42: 2b 42 10                    	subl	0x10(%rdx), %eax
140275c45: 3d 00 b0 33 c2              	cmpl	$0xc233b000, %eax       # imm = 0xC233B000
140275c4a: ba 00 b0 33 c2              	movl	$0xc233b000, %edx       # imm = 0xC233B000
140275c4f: 0f 42 d0                    	cmovbl	%eax, %edx
140275c52: 89 95 e0 00 00 00           	movl	%edx, 0xe0(%rbp)
140275c58: 48 89 8d a0 00 00 00        	movq	%rcx, 0xa0(%rbp)
140275c5f: 48 8d 81 a0 00 00 00        	leaq	0xa0(%rcx), %rax
140275c66: 48 89 85 c8 00 00 00        	movq	%rax, 0xc8(%rbp)
140275c6d: f3 0f 10 35 03 7c af 05     	movss	0x5af7c03(%rip), %xmm6  # 0x145d6d878
140275c75: f3 0f 10 3d bf af af 05     	movss	0x5afafbf(%rip), %xmm7  # 0x145d70c3c
140275c7d: 45 31 ff                    	xorl	%r15d, %r15d
140275c80: b8 08 00 00 00              	movl	$0x8, %eax
140275c85: 48 89 85 c0 00 00 00        	movq	%rax, 0xc0(%rbp)
140275c8c: 48 c7 85 d8 00 00 00 00 00 00 00    	movq	$0x0, 0xd8(%rbp)
140275c97: 48 c7 85 08 01 00 00 00 00 00 00    	movq	$0x0, 0x108(%rbp)
140275ca2: 31 c0                       	xorl	%eax, %eax
140275ca4: 31 ff                       	xorl	%edi, %edi
140275ca6: 48 c7 85 00 01 00 00 00 00 00 00    	movq	$0x0, 0x100(%rbp)
140275cb1: 48 c7 85 f8 00 00 00 00 00 00 00    	movq	$0x0, 0xf8(%rbp)
140275cbc: 4c 89 95 b8 00 00 00        	movq	%r10, 0xb8(%rbp)
140275cc3: 44 89 9d e4 00 00 00        	movl	%r11d, 0xe4(%rbp)
140275cca: 44 88 85 17 01 00 00        	movb	%r8b, 0x117(%rbp)
140275cd1: 45 84 c0                    	testb	%r8b, %r8b
140275cd4: 75 51                       	jne	0x140275d27 <.text+0x274d27>
140275cd6: 4c 8b 85 c0 00 00 00        	movq	0xc0(%rbp), %r8
140275cdd: 44 89 a5 f4 00 00 00        	movl	%r12d, 0xf4(%rbp)
140275ce4: e9 15 02 00 00              	jmp	0x140275efe <.text+0x274efe>
140275ce9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
140275cf0: 48 c7 85 08 01 00 00 00 00 00 00    	movq	$0x0, 0x108(%rbp)
140275cfb: 48 8b 93 28 01 00 00        	movq	0x128(%rbx), %rdx
140275d02: e8 79 29 bc 04              	callq	0x144e38680 <.text+0x4e37680>
140275d07: 4d 8b 3f                    	movq	(%r15), %r15
140275d0a: 4c 8b 95 b8 00 00 00        	movq	0xb8(%rbp), %r10
140275d11: 89 f9                       	movl	%edi, %ecx
140275d13: ff c7                       	incl	%edi
140275d15: 44 89 e2                    	movl	%r12d, %edx
140275d18: 2b 14 88                    	subl	(%rax,%rcx,4), %edx
140275d1b: 3b 95 e0 00 00 00           	cmpl	0xe0(%rbp), %edx
140275d21: 0f 82 79 03 00 00           	jb	0x1402760a0 <.text+0x2750a0>
140275d27: 44 39 ff                    	cmpl	%r15d, %edi
140275d2a: 75 e5                       	jne	0x140275d11 <.text+0x274d11>
140275d2c: 4c 39 ee                    	cmpq	%r13, %rsi
140275d2f: 0f 84 7b 05 00 00           	je	0x1402762b0 <.text+0x2752b0>
140275d35: 8b 0e                       	movl	(%rsi), %ecx
140275d37: 48 83 c6 04                 	addq	$0x4, %rsi
140275d3b: 49 8b 86 a8 01 00 00        	movq	0x1a8(%r14), %rax
140275d42: 48 8d 14 c9                 	leaq	(%rcx,%rcx,8), %rdx
140275d46: 48 83 7c d0 10 00           	cmpq	$0x0, 0x10(%rax,%rdx,8)
140275d4c: 74 22                       	je	0x140275d70 <.text+0x274d70>
140275d4e: 48 8d 0c d0                 	leaq	(%rax,%rdx,8), %rcx
140275d52: 4c 8d 3c d0                 	leaq	(%rax,%rdx,8), %r15
140275d56: 49 83 c7 10                 	addq	$0x10, %r15
140275d5a: 48 8b 93 10 01 00 00        	movq	0x110(%rbx), %rdx
140275d61: 48 8b 41 40                 	movq	0x40(%rcx), %rax
140275d65: 48 39 c2                    	cmpq	%rax, %rdx
140275d68: 73 76                       	jae	0x140275de0 <.text+0x274de0>
140275d6a: eb 3e                       	jmp	0x140275daa <.text+0x274daa>
140275d6c: 0f 1f 40 00                 	nopl	(%rax)
140275d70: 4c 39 ee                    	cmpq	%r13, %rsi
140275d73: 0f 84 37 05 00 00           	je	0x1402762b0 <.text+0x2752b0>
140275d79: 8b 0e                       	movl	(%rsi), %ecx
140275d7b: 48 83 c6 04                 	addq	$0x4, %rsi
140275d7f: 49 8b 86 a8 01 00 00        	movq	0x1a8(%r14), %rax
140275d86: 48 8d 0c c9                 	leaq	(%rcx,%rcx,8), %rcx
140275d8a: 48 83 7c c8 10 00           	cmpq	$0x0, 0x10(%rax,%rcx,8)
140275d90: 74 de                       	je	0x140275d70 <.text+0x274d70>
140275d92: 48 8d 0c c8                 	leaq	(%rax,%rcx,8), %rcx
140275d96: 4c 8d 79 10                 	leaq	0x10(%rcx), %r15
140275d9a: 48 8b 93 10 01 00 00        	movq	0x110(%rbx), %rdx
140275da1: 48 8b 41 40                 	movq	0x40(%rcx), %rax
140275da5: 48 39 c2                    	cmpq	%rax, %rdx
140275da8: 73 36                       	jae	0x140275de0 <.text+0x274de0>
140275daa: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
140275dae: 49 8b 14 d0                 	movq	(%r8,%rdx,8), %rdx
140275db2: 48 85 d2                    	testq	%rdx, %rdx
140275db5: 74 29                       	je	0x140275de0 <.text+0x274de0>
140275db7: 4c 8b 41 18                 	movq	0x18(%rcx), %r8
140275dbb: 48 f7 d2                    	notq	%rdx
140275dbe: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
140275dc2: 48 c1 e2 04                 	shlq	$0x4, %rdx
140275dc6: 49 8b 54 10 10              	movq	0x10(%r8,%rdx), %rdx
140275dcb: 48 89 95 f8 00 00 00        	movq	%rdx, 0xf8(%rbp)
140275dd2: 48 8b 93 18 01 00 00        	movq	0x118(%rbx), %rdx
140275dd9: 48 39 c2                    	cmpq	%rax, %rdx
140275ddc: 72 19                       	jb	0x140275df7 <.text+0x274df7>
140275dde: eb 60                       	jmp	0x140275e40 <.text+0x274e40>
140275de0: 48 c7 85 f8 00 00 00 00 00 00 00    	movq	$0x0, 0xf8(%rbp)
140275deb: 48 8b 93 18 01 00 00        	movq	0x118(%rbx), %rdx
140275df2: 48 39 c2                    	cmpq	%rax, %rdx
140275df5: 73 49                       	jae	0x140275e40 <.text+0x274e40>
140275df7: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
140275dfb: 49 8b 14 d0                 	movq	(%r8,%rdx,8), %rdx
140275dff: 48 85 d2                    	testq	%rdx, %rdx
140275e02: 74 3c                       	je	0x140275e40 <.text+0x274e40>
140275e04: 4c 8b 41 18                 	movq	0x18(%rcx), %r8
140275e08: 48 f7 d2                    	notq	%rdx
140275e0b: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
140275e0f: 48 c1 e2 04                 	shlq	$0x4, %rdx
140275e13: 49 8b 54 10 10              	movq	0x10(%r8,%rdx), %rdx
140275e18: 48 89 95 00 01 00 00        	movq	%rdx, 0x100(%rbp)
140275e1f: 48 8b 93 20 01 00 00        	movq	0x120(%rbx), %rdx
140275e26: 31 ff                       	xorl	%edi, %edi
140275e28: 48 39 c2                    	cmpq	%rax, %rdx
140275e2b: 0f 83 bf fe ff ff           	jae	0x140275cf0 <.text+0x274cf0>
140275e31: eb 2a                       	jmp	0x140275e5d <.text+0x274e5d>
140275e33: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
140275e40: 48 c7 85 00 01 00 00 00 00 00 00    	movq	$0x0, 0x100(%rbp)
140275e4b: 48 8b 93 20 01 00 00        	movq	0x120(%rbx), %rdx
140275e52: 31 ff                       	xorl	%edi, %edi
140275e54: 48 39 c2                    	cmpq	%rax, %rdx
140275e57: 0f 83 93 fe ff ff           	jae	0x140275cf0 <.text+0x274cf0>
140275e5d: 48 8b 41 38                 	movq	0x38(%rcx), %rax
140275e61: 48 8b 04 d0                 	movq	(%rax,%rdx,8), %rax
140275e65: 48 85 c0                    	testq	%rax, %rax
140275e68: 0f 84 82 fe ff ff           	je	0x140275cf0 <.text+0x274cf0>
140275e6e: 48 8b 51 18                 	movq	0x18(%rcx), %rdx
140275e72: 48 f7 d0                    	notq	%rax
140275e75: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140275e79: 48 c1 e0 04                 	shlq	$0x4, %rax
140275e7d: 4c 8b 44 02 10              	movq	0x10(%rdx,%rax), %r8
140275e82: 4c 89 85 d8 00 00 00        	movq	%r8, 0xd8(%rbp)
140275e89: 48 8b 44 02 28              	movq	0x28(%rdx,%rax), %rax
140275e8e: 48 89 85 d0 00 00 00        	movq	%rax, 0xd0(%rbp)
140275e95: b0 01                       	movb	$0x1, %al
140275e97: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
140275e9e: e9 58 fe ff ff              	jmp	0x140275cfb <.text+0x274cfb>
140275ea3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
140275eb0: 48 c7 85 08 01 00 00 00 00 00 00    	movq	$0x0, 0x108(%rbp)
140275ebb: 48 8b 93 28 01 00 00        	movq	0x128(%rbx), %rdx
140275ec2: e8 b9 27 bc 04              	callq	0x144e38680 <.text+0x4e37680>
140275ec7: 4d 8b 47 50                 	movq	0x50(%r15), %r8
140275ecb: 4d 8b 3c 24                 	movq	(%r12), %r15
140275ecf: 44 8b a5 f4 00 00 00        	movl	0xf4(%rbp), %r12d
140275ed6: 4c 8b 95 b8 00 00 00        	movq	0xb8(%rbp), %r10
140275edd: 89 f9                       	movl	%edi, %ecx
140275edf: 48 c1 e1 04                 	shlq	$0x4, %rcx
140275ee3: ff c7                       	incl	%edi
140275ee5: 41 8b 4c 08 08              	movl	0x8(%r8,%rcx), %ecx
140275eea: f7 d1                       	notl	%ecx
140275eec: 44 89 e2                    	movl	%r12d, %edx
140275eef: 2b 14 88                    	subl	(%rax,%rcx,4), %edx
140275ef2: 3b 95 e0 00 00 00           	cmpl	0xe0(%rbp), %edx
140275ef8: 0f 82 15 02 00 00           	jb	0x140276113 <.text+0x275113>
140275efe: 44 39 ff                    	cmpl	%r15d, %edi
140275f01: 75 da                       	jne	0x140275edd <.text+0x274edd>
140275f03: 4c 39 ee                    	cmpq	%r13, %rsi
140275f06: 0f 84 a4 03 00 00           	je	0x1402762b0 <.text+0x2752b0>
140275f0c: 8b 0e                       	movl	(%rsi), %ecx
140275f0e: 48 83 c6 04                 	addq	$0x4, %rsi
140275f12: 49 8b 86 08 01 00 00        	movq	0x108(%r14), %rax
140275f19: 48 8d 0c 89                 	leaq	(%rcx,%rcx,4), %rcx
140275f1d: 48 c1 e1 05                 	shlq	$0x5, %rcx
140275f21: 48 83 7c 08 58 00           	cmpq	$0x0, 0x58(%rax,%rcx)
140275f27: 74 17                       	je	0x140275f40 <.text+0x274f40>
140275f29: 4c 8d 3c 08                 	leaq	(%rax,%rcx), %r15
140275f2d: 4c 8d 24 08                 	leaq	(%rax,%rcx), %r12
140275f31: 49 83 c4 58                 	addq	$0x58, %r12
140275f35: eb 36                       	jmp	0x140275f6d <.text+0x274f6d>
140275f37: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
140275f40: 4c 39 ee                    	cmpq	%r13, %rsi
140275f43: 0f 84 67 03 00 00           	je	0x1402762b0 <.text+0x2752b0>
140275f49: 8b 06                       	movl	(%rsi), %eax
140275f4b: 48 83 c6 04                 	addq	$0x4, %rsi
140275f4f: 4d 8b be 08 01 00 00        	movq	0x108(%r14), %r15
140275f56: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
140275f5a: 48 c1 e0 05                 	shlq	$0x5, %rax
140275f5e: 49 83 7c 07 58 00           	cmpq	$0x0, 0x58(%r15,%rax)
140275f64: 74 da                       	je	0x140275f40 <.text+0x274f40>
140275f66: 49 01 c7                    	addq	%rax, %r15
140275f69: 4d 8d 67 58                 	leaq	0x58(%r15), %r12
140275f6d: 41 8b 87 94 00 00 00        	movl	0x94(%r15), %eax
140275f74: 4d 8b 86 a8 01 00 00        	movq	0x1a8(%r14), %r8
140275f7b: 48 8d 04 c0                 	leaq	(%rax,%rax,8), %rax
140275f7f: 49 8d 0c c0                 	leaq	(%r8,%rax,8), %rcx
140275f83: 48 8b 93 10 01 00 00        	movq	0x110(%rbx), %rdx
140275f8a: 49 8b 44 c0 40              	movq	0x40(%r8,%rax,8), %rax
140275f8f: 48 39 c2                    	cmpq	%rax, %rdx
140275f92: 73 3c                       	jae	0x140275fd0 <.text+0x274fd0>
140275f94: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
140275f98: 49 8b 14 d0                 	movq	(%r8,%rdx,8), %rdx
140275f9c: 48 85 d2                    	testq	%rdx, %rdx
140275f9f: 74 2f                       	je	0x140275fd0 <.text+0x274fd0>
140275fa1: 4c 8b 41 18                 	movq	0x18(%rcx), %r8
140275fa5: 48 f7 d2                    	notq	%rdx
140275fa8: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
140275fac: 48 c1 e2 04                 	shlq	$0x4, %rdx
140275fb0: 49 8b 54 10 10              	movq	0x10(%r8,%rdx), %rdx
140275fb5: 48 89 95 f8 00 00 00        	movq	%rdx, 0xf8(%rbp)
140275fbc: 48 8b 93 18 01 00 00        	movq	0x118(%rbx), %rdx
140275fc3: 48 39 c2                    	cmpq	%rax, %rdx
140275fc6: 72 1f                       	jb	0x140275fe7 <.text+0x274fe7>
140275fc8: eb 66                       	jmp	0x140276030 <.text+0x275030>
140275fca: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
140275fd0: 48 c7 85 f8 00 00 00 00 00 00 00    	movq	$0x0, 0xf8(%rbp)
140275fdb: 48 8b 93 18 01 00 00        	movq	0x118(%rbx), %rdx
140275fe2: 48 39 c2                    	cmpq	%rax, %rdx
140275fe5: 73 49                       	jae	0x140276030 <.text+0x275030>
140275fe7: 48 8b 41 38                 	movq	0x38(%rcx), %rax
140275feb: 48 8b 04 d0                 	movq	(%rax,%rdx,8), %rax
140275fef: 48 85 c0                    	testq	%rax, %rax
140275ff2: 74 3c                       	je	0x140276030 <.text+0x275030>
140275ff4: 48 8b 51 18                 	movq	0x18(%rcx), %rdx
140275ff8: 48 f7 d0                    	notq	%rax
140275ffb: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140275fff: 48 c1 e0 04                 	shlq	$0x4, %rax
140276003: 48 8b 44 02 10              	movq	0x10(%rdx,%rax), %rax
140276008: 48 89 85 00 01 00 00        	movq	%rax, 0x100(%rbp)
14027600f: 48 8b 83 20 01 00 00        	movq	0x120(%rbx), %rax
140276016: 31 ff                       	xorl	%edi, %edi
140276018: 49 3b 87 88 00 00 00        	cmpq	0x88(%r15), %rax
14027601f: 0f 83 8b fe ff ff           	jae	0x140275eb0 <.text+0x274eb0>
140276025: eb 2a                       	jmp	0x140276051 <.text+0x275051>
140276027: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
140276030: 48 c7 85 00 01 00 00 00 00 00 00    	movq	$0x0, 0x100(%rbp)
14027603b: 48 8b 83 20 01 00 00        	movq	0x120(%rbx), %rax
140276042: 31 ff                       	xorl	%edi, %edi
140276044: 49 3b 87 88 00 00 00        	cmpq	0x88(%r15), %rax
14027604b: 0f 83 5f fe ff ff           	jae	0x140275eb0 <.text+0x274eb0>
140276051: 49 8b 97 80 00 00 00        	movq	0x80(%r15), %rdx
140276058: 48 83 3c c2 00              	cmpq	$0x0, (%rdx,%rax,8)
14027605d: 0f 84 4d fe ff ff           	je	0x140275eb0 <.text+0x274eb0>
140276063: 48 8b 51 18                 	movq	0x18(%rcx), %rdx
140276067: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
14027606b: 49 8b 04 c0                 	movq	(%r8,%rax,8), %rax
14027606f: 48 f7 d0                    	notq	%rax
140276072: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140276076: 48 c1 e0 04                 	shlq	$0x4, %rax
14027607a: 4c 8b 44 02 10              	movq	0x10(%rdx,%rax), %r8
14027607f: 4c 89 85 d8 00 00 00        	movq	%r8, 0xd8(%rbp)
140276086: 48 8b 44 02 28              	movq	0x28(%rdx,%rax), %rax
14027608b: 48 89 85 d0 00 00 00        	movq	%rax, 0xd0(%rbp)
140276092: b0 01                       	movb	$0x1, %al
140276094: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
14027609b: e9 1b fe ff ff              	jmp	0x140275ebb <.text+0x274ebb>
1402760a0: 48 8b 95 f8 00 00 00        	movq	0xf8(%rbp), %rdx
1402760a7: 4c 8d 04 0a                 	leaq	(%rdx,%rcx), %r8
1402760ab: 48 8b 95 00 01 00 00        	movq	0x100(%rbp), %rdx
1402760b2: 48 01 ca                    	addq	%rcx, %rdx
1402760b5: 80 bd 08 01 00 00 01        	cmpb	$0x1, 0x108(%rbp)
1402760bc: 0f 85 be 00 00 00           	jne	0x140276180 <.text+0x275180>
1402760c2: 4c 8b 8d d0 00 00 00        	movq	0xd0(%rbp), %r9
1402760c9: 4d 8d 0c 89                 	leaq	(%r9,%rcx,4), %r9
1402760cd: 4c 89 8d e8 00 00 00        	movq	%r9, 0xe8(%rbp)
1402760d4: 48 c1 e1 05                 	shlq	$0x5, %rcx
1402760d8: 48 03 8d d8 00 00 00        	addq	0xd8(%rbp), %rcx
1402760df: 49 89 d1                    	movq	%rdx, %r9
1402760e2: b2 01                       	movb	$0x1, %dl
1402760e4: 48 89 95 08 01 00 00        	movq	%rdx, 0x108(%rbp)
1402760eb: 4c 89 ca                    	movq	%r9, %rdx
1402760ee: 4c 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %r9
1402760f5: 4c 89 8d a8 00 00 00        	movq	%r9, 0xa8(%rbp)
1402760fc: 41 80 38 00                 	cmpb	$0x0, (%r8)
140276100: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
140276108: 0f 85 c3 fb ff ff           	jne	0x140275cd1 <.text+0x274cd1>
14027610e: e9 bb 00 00 00              	jmp	0x1402761ce <.text+0x2751ce>
140276113: 4c 89 85 c0 00 00 00        	movq	%r8, 0xc0(%rbp)
14027611a: 48 8b 95 f8 00 00 00        	movq	0xf8(%rbp), %rdx
140276121: 4c 8d 04 0a                 	leaq	(%rdx,%rcx), %r8
140276125: 48 8b 95 00 01 00 00        	movq	0x100(%rbp), %rdx
14027612c: 48 01 ca                    	addq	%rcx, %rdx
14027612f: 80 bd 08 01 00 00 01        	cmpb	$0x1, 0x108(%rbp)
140276136: 75 70                       	jne	0x1402761a8 <.text+0x2751a8>
140276138: 4c 8b 8d d0 00 00 00        	movq	0xd0(%rbp), %r9
14027613f: 4d 8d 0c 89                 	leaq	(%r9,%rcx,4), %r9
140276143: 48 c1 e1 05                 	shlq	$0x5, %rcx
140276147: 48 03 8d d8 00 00 00        	addq	0xd8(%rbp), %rcx
14027614e: 48 89 95 e8 00 00 00        	movq	%rdx, 0xe8(%rbp)
140276155: b2 01                       	movb	$0x1, %dl
140276157: 48 89 95 08 01 00 00        	movq	%rdx, 0x108(%rbp)
14027615e: 48 8b 95 e8 00 00 00        	movq	0xe8(%rbp), %rdx
140276165: 4c 89 8d b0 00 00 00        	movq	%r9, 0xb0(%rbp)
14027616c: 41 80 38 00                 	cmpb	$0x0, (%r8)
140276170: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
140276178: 0f 85 53 fb ff ff           	jne	0x140275cd1 <.text+0x274cd1>
14027617e: eb 4e                       	jmp	0x1402761ce <.text+0x2751ce>
140276180: 48 c7 85 08 01 00 00 00 00 00 00    	movq	$0x0, 0x108(%rbp)
14027618b: 4c 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %r9
140276192: 31 c9                       	xorl	%ecx, %ecx
140276194: 41 80 38 00                 	cmpb	$0x0, (%r8)
140276198: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
1402761a0: 0f 85 2b fb ff ff           	jne	0x140275cd1 <.text+0x274cd1>
1402761a6: eb 26                       	jmp	0x1402761ce <.text+0x2751ce>
1402761a8: 48 c7 85 08 01 00 00 00 00 00 00    	movq	$0x0, 0x108(%rbp)
1402761b3: 4c 8b 8d b0 00 00 00        	movq	0xb0(%rbp), %r9
1402761ba: 31 c9                       	xorl	%ecx, %ecx
1402761bc: 41 80 38 00                 	cmpb	$0x0, (%r8)
1402761c0: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
1402761c8: 0f 85 03 fb ff ff           	jne	0x140275cd1 <.text+0x274cd1>
1402761ce: 48 85 c9                    	testq	%rcx, %rcx
1402761d1: 74 3f                       	je	0x140276212 <.text+0x275212>
1402761d3: 45 89 21                    	movl	%r12d, (%r9)
1402761d6: 4c 8b 85 90 00 00 00        	movq	0x90(%rbp), %r8
1402761dd: f3 41 0f 10 80 8c 00 00 00  	movss	0x8c(%r8), %xmm0
1402761e6: 83 79 18 01                 	cmpl	$0x1, 0x18(%rcx)
1402761ea: 0f 85 a7 00 00 00           	jne	0x140276297 <.text+0x275297>
1402761f0: 0f 28 c8                    	movaps	%xmm0, %xmm1
1402761f3: f3 0f 5c 49 1c              	subss	0x1c(%rcx), %xmm1
1402761f8: 0f 2e f1                    	ucomiss	%xmm1, %xmm6
1402761fb: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
140276203: 0f 87 c8 fa ff ff           	ja	0x140275cd1 <.text+0x274cd1>
140276209: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
14027620c: 0f 86 85 00 00 00           	jbe	0x140276297 <.text+0x275297>
140276212: 44 89 a5 f4 00 00 00        	movl	%r12d, 0xf4(%rbp)
140276219: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
140276220: 0f b6 02                    	movzbl	(%rdx), %eax
140276223: 48 8d 0d 8e b7 b4 05        	leaq	0x5b4b78e(%rip), %rcx   # 0x145dc19b8
14027622a: 8b 04 81                    	movl	(%rcx,%rax,4), %eax
14027622d: 89 45 a8                    	movl	%eax, -0x58(%rbp)
140276230: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
140276237: 48 8d 55 a8                 	leaq	-0x58(%rbp), %rdx
14027623b: 4d 89 d4                    	movq	%r10, %r12
14027623e: e8 3d 89 dc ff              	callq	0x14003eb80 <.text+0x3db80>
140276243: 8b 8d e4 00 00 00           	movl	0xe4(%rbp), %ecx
140276249: 41 89 0c 24                 	movl	%ecx, (%r12)
14027624d: 48 8b 8d c8 00 00 00        	movq	0xc8(%rbp), %rcx
140276254: e8 57 7c ff ff              	callq	0x14026deb0 <.text+0x26ceb0>
140276259: 90                          	nop
14027625a: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
140276261: c6 80 a0 00 00 00 ff        	movb	$-0x1, 0xa0(%rax)
140276268: 4d 89 e2                    	movq	%r12, %r10
14027626b: 44 8b 9d e4 00 00 00        	movl	0xe4(%rbp), %r11d
140276272: 45 89 1c 24                 	movl	%r11d, (%r12)
140276276: ff 80 e4 00 00 00           	incl	0xe4(%rax)
14027627c: 48 8b 85 e8 00 00 00        	movq	0xe8(%rbp), %rax
140276283: 44 8b a5 f4 00 00 00        	movl	0xf4(%rbp), %r12d
14027628a: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
140276292: e9 3a fa ff ff              	jmp	0x140275cd1 <.text+0x274cd1>
140276297: c7 41 18 01 00 00 00        	movl	$0x1, 0x18(%rcx)
14027629e: f3 0f 11 41 1c              	movss	%xmm0, 0x1c(%rcx)
1402762a3: 44 0f b6 85 17 01 00 00     	movzbl	0x117(%rbp), %r8d
1402762ab: e9 21 fa ff ff              	jmp	0x140275cd1 <.text+0x274cd1>
1402762b0: 0f 28 b5 20 01 00 00        	movaps	0x120(%rbp), %xmm6
1402762b7: 0f 28 bd 30 01 00 00        	movaps	0x130(%rbp), %xmm7
1402762be: 48 81 c4 c8 01 00 00        	addq	$0x1c8, %rsp            # imm = 0x1C8
1402762c5: 5b                          	popq	%rbx
1402762c6: 5f                          	popq	%rdi
1402762c7: 5e                          	popq	%rsi
1402762c8: 41 5c                       	popq	%r12
1402762ca: 41 5d                       	popq	%r13
1402762cc: 41 5e                       	popq	%r14
1402762ce: 41 5f                       	popq	%r15
1402762d0: 5d                          	popq	%rbp
1402762d1: c3                          	retq
