
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145420cf0: 55                          	pushq	%rbp
145420cf1: 56                          	pushq	%rsi
145420cf2: 57                          	pushq	%rdi
145420cf3: 53                          	pushq	%rbx
145420cf4: 48 81 ec 98 00 00 00        	subq	$0x98, %rsp
145420cfb: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145420d03: 48 c7 45 10 fe ff ff ff     	movq	$-0x2, 0x10(%rbp)
145420d0b: 4c 89 ce                    	movq	%r9, %rsi
145420d0e: 4c 89 c7                    	movq	%r8, %rdi
145420d11: 48 89 4d b0                 	movq	%rcx, -0x50(%rbp)
145420d15: 48 89 55 b8                 	movq	%rdx, -0x48(%rbp)
145420d19: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420d1d: e8 0e 02 00 00              	callq	0x145420f30 <.text+0x541ff30>
145420d22: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
145420d26: 48 83 f8 ff                 	cmpq	$-0x1, %rax
145420d2a: 0f 84 27 01 00 00           	je	0x145420e57 <.text+0x541fe57>
145420d30: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
145420d34: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
145420d38: 48 8b 5d f8                 	movq	-0x8(%rbp), %rbx
145420d3c: c6 45 e8 01                 	movb	$0x1, -0x18(%rbp)
145420d40: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420d44: 48 89 55 d8                 	movq	%rdx, -0x28(%rbp)
145420d48: 49 89 d8                    	movq	%rbx, %r8
145420d4b: e8 c0 ad 28 00              	callq	0x1456abb10 <.text+0x56aab10>
145420d50: 90                          	nop
145420d51: 48 85 c0                    	testq	%rax, %rax
145420d54: 74 27                       	je	0x145420d7d <.text+0x541fd7d>
145420d56: 89 c1                       	movl	%eax, %ecx
145420d58: 83 e1 03                    	andl	$0x3, %ecx
145420d5b: 8d 51 fe                    	leal	-0x2(%rcx), %edx
145420d5e: 83 fa 02                    	cmpl	$0x2, %edx
145420d61: 72 1a                       	jb	0x145420d7d <.text+0x541fd7d>
145420d63: 48 85 c9                    	testq	%rcx, %rcx
145420d66: 74 15                       	je	0x145420d7d <.text+0x541fd7d>
145420d68: 48 ff c8                    	decq	%rax
145420d6b: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
145420d6f: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145420d73: c6 45 e8 03                 	movb	$0x3, -0x18(%rbp)
145420d77: e8 c4 bd 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
145420d7c: 90                          	nop
145420d7d: 48 8d 45 b0                 	leaq	-0x50(%rbp), %rax
145420d81: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
145420d85: 48 8d 05 34 13 be fa        	leaq	-0x541eccc(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145420d8c: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145420d90: 48 8d 15 d1 3f 47 01        	leaq	0x1473fd1(%rip), %rdx   # 0x146894d68
145420d97: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
145420d9b: 4c 8d 45 e8                 	leaq	-0x18(%rbp), %r8
145420d9f: e8 fc 8d 2a 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
145420da4: 90                          	nop
145420da5: 4c 8b 4d c8                 	movq	-0x38(%rbp), %r9
145420da9: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145420dad: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
145420db2: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420db6: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
145420dba: 49 89 d8                    	movq	%rbx, %r8
145420dbd: 4c 89 4d 08                 	movq	%r9, 0x8(%rbp)
145420dc1: e8 0a 3a 28 00              	callq	0x1456a47d0 <.text+0x56a37d0>
145420dc6: 90                          	nop
145420dc7: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
145420dcb: 48 85 d2                    	testq	%rdx, %rdx
145420dce: 74 0f                       	je	0x145420ddf <.text+0x541fddf>
145420dd0: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420dd6: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420dda: e8 f1 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420ddf: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
145420de3: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
145420de7: 48 89 4d 08                 	movq	%rcx, 0x8(%rbp)
145420deb: 49 89 f8                    	movq	%rdi, %r8
145420dee: 49 89 f1                    	movq	%rsi, %r9
145420df1: e8 ca 96 29 00              	callq	0x1456ba4c0 <.text+0x56b94c0>
145420df6: 90                          	nop
145420df7: 48 89 c6                    	movq	%rax, %rsi
145420dfa: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
145420dfe: 48 85 d2                    	testq	%rdx, %rdx
145420e01: 74 0f                       	je	0x145420e12 <.text+0x541fe12>
145420e03: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420e09: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420e0d: e8 be 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420e12: 48 85 f6                    	testq	%rsi, %rsi
145420e15: 74 27                       	je	0x145420e3e <.text+0x541fe3e>
145420e17: 89 f0                       	movl	%esi, %eax
145420e19: 83 e0 03                    	andl	$0x3, %eax
145420e1c: 8d 48 fe                    	leal	-0x2(%rax), %ecx
145420e1f: 83 f9 02                    	cmpl	$0x2, %ecx
145420e22: 72 1a                       	jb	0x145420e3e <.text+0x541fe3e>
145420e24: 48 85 c0                    	testq	%rax, %rax
145420e27: 74 15                       	je	0x145420e3e <.text+0x541fe3e>
145420e29: 48 ff ce                    	decq	%rsi
145420e2c: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
145420e30: 48 89 75 f0                 	movq	%rsi, -0x10(%rbp)
145420e34: c6 45 e8 03                 	movb	$0x3, -0x18(%rbp)
145420e38: e8 03 bd 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
145420e3d: 90                          	nop
145420e3e: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145420e42: 48 85 d2                    	testq	%rdx, %rdx
145420e45: 74 10                       	je	0x145420e57 <.text+0x541fe57>
145420e47: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420e4d: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
145420e51: e8 7a 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420e56: 90                          	nop
145420e57: 48 81 c4 98 00 00 00        	addq	$0x98, %rsp
145420e5e: 5b                          	popq	%rbx
145420e5f: 5f                          	popq	%rdi
145420e60: 5e                          	popq	%rsi
145420e61: 5d                          	popq	%rbp
145420e62: c3                          	retq
145420e63: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
145420e70: 48 89 54 24 10              	movq	%rdx, 0x10(%rsp)
145420e75: 55                          	pushq	%rbp
145420e76: 56                          	pushq	%rsi
145420e77: 57                          	pushq	%rdi
145420e78: 53                          	pushq	%rbx
145420e79: 48 83 ec 28                 	subq	$0x28, %rsp
145420e7d: 48 8d aa 80 00 00 00        	leaq	0x80(%rdx), %rbp
145420e84: 48 83 7d e0 00              	cmpq	$0x0, -0x20(%rbp)
145420e89: 74 14                       	je	0x145420e9f <.text+0x541fe9f>
145420e8b: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420e91: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
145420e95: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145420e99: e8 32 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420e9e: 90                          	nop
145420e9f: 48 83 c4 28                 	addq	$0x28, %rsp
145420ea3: 5b                          	popq	%rbx
145420ea4: 5f                          	popq	%rdi
145420ea5: 5e                          	popq	%rsi
145420ea6: 5d                          	popq	%rbp
145420ea7: c3                          	retq
145420ea8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
145420eb0: 48 89 54 24 10              	movq	%rdx, 0x10(%rsp)
145420eb5: 55                          	pushq	%rbp
145420eb6: 56                          	pushq	%rsi
145420eb7: 57                          	pushq	%rdi
145420eb8: 53                          	pushq	%rbx
145420eb9: 48 83 ec 28                 	subq	$0x28, %rsp
145420ebd: 48 8d aa 80 00 00 00        	leaq	0x80(%rdx), %rbp
145420ec4: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
145420ec8: 48 85 d2                    	testq	%rdx, %rdx
145420ecb: 74 10                       	je	0x145420edd <.text+0x541fedd>
145420ecd: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420ed3: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420ed7: e8 f4 12 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420edc: 90                          	nop
145420edd: 48 83 c4 28                 	addq	$0x28, %rsp
145420ee1: 5b                          	popq	%rbx
145420ee2: 5f                          	popq	%rdi
145420ee3: 5e                          	popq	%rsi
145420ee4: 5d                          	popq	%rbp
145420ee5: c3                          	retq
145420ee6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
145420ef0: 48 89 54 24 10              	movq	%rdx, 0x10(%rsp)
145420ef5: 55                          	pushq	%rbp
145420ef6: 56                          	pushq	%rsi
145420ef7: 57                          	pushq	%rdi
145420ef8: 53                          	pushq	%rbx
145420ef9: 48 83 ec 28                 	subq	$0x28, %rsp
145420efd: 48 8d aa 80 00 00 00        	leaq	0x80(%rdx), %rbp
145420f04: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
145420f08: 48 85 d2                    	testq	%rdx, %rdx
145420f0b: 74 10                       	je	0x145420f1d <.text+0x541ff1d>
145420f0d: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420f13: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420f17: e8 b4 12 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420f1c: 90                          	nop
145420f1d: 48 83 c4 28                 	addq	$0x28, %rsp
145420f21: 5b                          	popq	%rbx
145420f22: 5f                          	popq	%rdi
145420f23: 5e                          	popq	%rsi
145420f24: 5d                          	popq	%rbp
145420f25: c3                          	retq
145420f26: cc                          	int3
145420f27: cc                          	int3
145420f28: cc                          	int3
145420f29: cc                          	int3
145420f2a: cc                          	int3
145420f2b: cc                          	int3
145420f2c: cc                          	int3
145420f2d: cc                          	int3
145420f2e: cc                          	int3
145420f2f: cc                          	int3
