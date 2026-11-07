
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b8f0: 55                          	pushq	%rbp
14552b8f1: 41 57                       	pushq	%r15
14552b8f3: 41 56                       	pushq	%r14
14552b8f5: 41 55                       	pushq	%r13
14552b8f7: 41 54                       	pushq	%r12
14552b8f9: 56                          	pushq	%rsi
14552b8fa: 57                          	pushq	%rdi
14552b8fb: 53                          	pushq	%rbx
14552b8fc: 48 81 ec b8 00 00 00        	subq	$0xb8, %rsp
14552b903: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14552b90b: 0f 29 75 20                 	movaps	%xmm6, 0x20(%rbp)
14552b90f: 48 c7 45 18 fe ff ff ff     	movq	$-0x2, 0x18(%rbp)
14552b917: 48 89 d3                    	movq	%rdx, %rbx
14552b91a: 48 89 ce                    	movq	%rcx, %rsi
14552b91d: 4c 8d 42 30                 	leaq	0x30(%rdx), %r8
14552b921: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
14552b925: e8 c6 90 fe ff              	callq	0x1455149f0 <.text+0x55139f0>
14552b92a: 83 7d c0 01                 	cmpl	$0x1, -0x40(%rbp)
14552b92e: 0f 85 ec 00 00 00           	jne	0x14552ba20 <.text+0x552aa20>
14552b934: 48 89 75 f8                 	movq	%rsi, -0x8(%rbp)
14552b938: f3 0f 10 75 c8              	movss	-0x38(%rbp), %xmm6
14552b93d: 48 8b 75 d0                 	movq	-0x30(%rbp), %rsi
14552b941: e8 ba 68 ad fa              	callq	0x140002200 <.text+0x1200>
14552b946: b9 40 00 00 00              	movl	$0x40, %ecx
14552b94b: ba 08 00 00 00              	movl	$0x8, %edx
14552b950: e8 6b 68 ad fa              	callq	0x1400021c0 <.text+0x11c0>
14552b955: 48 85 c0                    	testq	%rax, %rax
14552b958: 0f 84 09 01 00 00           	je	0x14552ba67 <.text+0x552aa67>
14552b95e: 48 89 c7                    	movq	%rax, %rdi
14552b961: f3 0f 11 30                 	movss	%xmm6, (%rax)
14552b965: 48 89 70 08                 	movq	%rsi, 0x8(%rax)
14552b969: 48 c7 45 00 04 00 00 00     	movq	$0x4, (%rbp)
14552b971: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
14552b975: 48 c7 45 10 01 00 00 00     	movq	$0x1, 0x10(%rbp)
14552b97d: 48 8b 43 30                 	movq	0x30(%rbx), %rax
14552b981: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
14552b985: 0f 10 03                    	movups	(%rbx), %xmm0
14552b988: 0f 10 4b 10                 	movups	0x10(%rbx), %xmm1
14552b98c: 0f 10 53 20                 	movups	0x20(%rbx), %xmm2
14552b990: 0f 29 55 e0                 	movaps	%xmm2, -0x20(%rbp)
14552b994: 0f 29 4d d0                 	movaps	%xmm1, -0x30(%rbp)
14552b998: 0f 29 45 c0                 	movaps	%xmm0, -0x40(%rbp)
14552b99c: 48 8d 5d f0                 	leaq	-0x10(%rbp), %rbx
14552b9a0: 41 be 01 00 00 00           	movl	$0x1, %r14d
14552b9a6: be 18 00 00 00              	movl	$0x18, %esi
14552b9ab: 4c 8d 7d a8                 	leaq	-0x58(%rbp), %r15
14552b9af: 4c 8d 65 c0                 	leaq	-0x40(%rbp), %r12
14552b9b3: eb 20                       	jmp	0x14552b9d5 <.text+0x552a9d5>
14552b9b5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
14552b9c0: f3 0f 11 74 37 f8           	movss	%xmm6, -0x8(%rdi,%rsi)
14552b9c6: 4c 89 2c 37                 	movq	%r13, (%rdi,%rsi)
14552b9ca: 49 ff c6                    	incq	%r14
14552b9cd: 4c 89 75 10                 	movq	%r14, 0x10(%rbp)
14552b9d1: 48 83 c6 10                 	addq	$0x10, %rsi
14552b9d5: 4c 89 f9                    	movq	%r15, %rcx
14552b9d8: 4c 89 e2                    	movq	%r12, %rdx
14552b9db: 49 89 d8                    	movq	%rbx, %r8
14552b9de: e8 0d 90 fe ff              	callq	0x1455149f0 <.text+0x55139f0>
14552b9e3: 90                          	nop
14552b9e4: 83 7d a8 01                 	cmpl	$0x1, -0x58(%rbp)
14552b9e8: 75 4f                       	jne	0x14552ba39 <.text+0x552aa39>
14552b9ea: f3 0f 10 75 b0              	movss	-0x50(%rbp), %xmm6
14552b9ef: 4c 8b 6d b8                 	movq	-0x48(%rbp), %r13
14552b9f3: 4c 3b 75 00                 	cmpq	(%rbp), %r14
14552b9f7: 75 c7                       	jne	0x14552b9c0 <.text+0x552a9c0>
14552b9f9: 48 c7 44 24 20 10 00 00 00  	movq	$0x10, 0x20(%rsp)
14552ba02: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14552ba08: 41 b9 08 00 00 00           	movl	$0x8, %r9d
14552ba0e: 48 89 e9                    	movq	%rbp, %rcx
14552ba11: 4c 89 f2                    	movq	%r14, %rdx
14552ba14: e8 27 c3 22 00              	callq	0x145757d40 <.text+0x5756d40>
14552ba19: 90                          	nop
14552ba1a: 48 8b 7d 08                 	movq	0x8(%rbp), %rdi
14552ba1e: eb a0                       	jmp	0x14552b9c0 <.text+0x552a9c0>
14552ba20: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14552ba27: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
14552ba2f: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14552ba37: eb 13                       	jmp	0x14552ba4c <.text+0x552aa4c>
14552ba39: 48 8b 45 10                 	movq	0x10(%rbp), %rax
14552ba3d: 48 8b 75 f8                 	movq	-0x8(%rbp), %rsi
14552ba41: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14552ba45: 0f 10 45 00                 	movups	(%rbp), %xmm0
14552ba49: 0f 11 06                    	movups	%xmm0, (%rsi)
14552ba4c: 48 89 f0                    	movq	%rsi, %rax
14552ba4f: 0f 28 75 20                 	movaps	0x20(%rbp), %xmm6
14552ba53: 48 81 c4 b8 00 00 00        	addq	$0xb8, %rsp
14552ba5a: 5b                          	popq	%rbx
14552ba5b: 5f                          	popq	%rdi
14552ba5c: 5e                          	popq	%rsi
14552ba5d: 41 5c                       	popq	%r12
14552ba5f: 41 5d                       	popq	%r13
14552ba61: 41 5e                       	popq	%r14
14552ba63: 41 5f                       	popq	%r15
14552ba65: 5d                          	popq	%rbp
14552ba66: c3                          	retq
14552ba67: b9 08 00 00 00              	movl	$0x8, %ecx
14552ba6c: ba 40 00 00 00              	movl	$0x40, %edx
14552ba71: e8 a5 b7 3b 00              	callq	0x1458e721b <.text+0x58e621b>
14552ba76: 0f 0b                       	ud2
