145895ba0: 55                          	pushq	%rbp
145895ba1: 56                          	pushq	%rsi
145895ba2: 57                          	pushq	%rdi
145895ba3: 48 81 ec 90 00 00 00        	subq	$0x90, %rsp
145895baa: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145895bb2: 0f 29 75 00                 	movaps	%xmm6, (%rbp)
145895bb6: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
145895bbe: 4c 89 c7                    	movq	%r8, %rdi
145895bc1: 48 89 ce                    	movq	%rcx, %rsi
145895bc4: 0f 10 02                    	movups	(%rdx), %xmm0
145895bc7: 0f 10 4a 10                 	movups	0x10(%rdx), %xmm1
145895bcb: 0f 29 4d e0                 	movaps	%xmm1, -0x20(%rbp)
145895bcf: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
145895bd3: f3 41 0f 10 30              	movss	(%r8), %xmm6
145895bd8: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145895bdc: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145895be0: 48 29 d0                    	subq	%rdx, %rax
145895be3: 48 83 f8 03                 	cmpq	$0x3, %rax
145895be7: 0f 86 c0 00 00 00           	jbe	0x145895cad <.text+0x5894cad>
145895bed: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
145895bf1: f3 0f 11 34 10              	movss	%xmm6, (%rax,%rdx)
145895bf6: 48 83 c2 04                 	addq	$0x4, %rdx
145895bfa: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
145895bfe: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
145895c02: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
145895c06: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
145895c0a: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
145895c0e: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
145895c12: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
145895c16: f3 0f 10 77 04              	movss	0x4(%rdi), %xmm6
145895c1b: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
145895c1f: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
145895c23: 48 29 d0                    	subq	%rdx, %rax
145895c26: 48 83 f8 03                 	cmpq	$0x3, %rax
145895c2a: 0f 86 a5 00 00 00           	jbe	0x145895cd5 <.text+0x5894cd5>
145895c30: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
145895c34: f3 0f 11 34 10              	movss	%xmm6, (%rax,%rdx)
145895c39: 48 83 c2 04                 	addq	$0x4, %rdx
145895c3d: 48 89 55 c0                 	movq	%rdx, -0x40(%rbp)
145895c41: 0f 28 45 b0                 	movaps	-0x50(%rbp), %xmm0
145895c45: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
145895c49: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
145895c4d: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
145895c51: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
145895c55: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
145895c59: f3 0f 10 77 08              	movss	0x8(%rdi), %xmm6
145895c5e: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145895c62: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145895c66: 48 29 d0                    	subq	%rdx, %rax
145895c69: 48 83 f8 03                 	cmpq	$0x3, %rax
145895c6d: 0f 86 8a 00 00 00           	jbe	0x145895cfd <.text+0x5894cfd>
145895c73: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
145895c77: f3 0f 11 34 10              	movss	%xmm6, (%rax,%rdx)
145895c7c: 48 83 c2 04                 	addq	$0x4, %rdx
145895c80: 48 89 55 e0                 	movq	%rdx, -0x20(%rbp)
145895c84: 0f 28 45 d0                 	movaps	-0x30(%rbp), %xmm0
145895c88: 0f 11 06                    	movups	%xmm0, (%rsi)
145895c8b: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
145895c8f: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
145895c93: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
145895c97: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
145895c9b: 48 89 f0                    	movq	%rsi, %rax
145895c9e: 0f 28 75 00                 	movaps	(%rbp), %xmm6
145895ca2: 48 81 c4 90 00 00 00        	addq	$0x90, %rsp
145895ca9: 5f                          	popq	%rdi
145895caa: 5e                          	popq	%rsi
145895cab: 5d                          	popq	%rbp
145895cac: c3                          	retq
145895cad: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
145895cb6: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
145895cba: 41 b8 04 00 00 00           	movl	$0x4, %r8d
145895cc0: 41 b9 01 00 00 00           	movl	$0x1, %r9d
145895cc6: e8 05 56 33 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
145895ccb: 90                          	nop
145895ccc: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145895cd0: e9 18 ff ff ff              	jmp	0x145895bed <.text+0x5894bed>
145895cd5: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
145895cde: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
145895ce2: 41 b8 04 00 00 00           	movl	$0x4, %r8d
145895ce8: 41 b9 01 00 00 00           	movl	$0x1, %r9d
145895cee: e8 dd 55 33 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
145895cf3: 90                          	nop
145895cf4: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
145895cf8: e9 33 ff ff ff              	jmp	0x145895c30 <.text+0x5894c30>
145895cfd: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
145895d06: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
145895d0a: 41 b8 04 00 00 00           	movl	$0x4, %r8d
145895d10: 41 b9 01 00 00 00           	movl	$0x1, %r9d
145895d16: e8 b5 55 33 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
145895d1b: 90                          	nop
145895d1c: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145895d20: e9 4e ff ff ff              	jmp	0x145895c73 <.text+0x5894c73>
