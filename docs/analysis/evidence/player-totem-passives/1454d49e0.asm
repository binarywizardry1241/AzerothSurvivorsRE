
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d49e0: 55                          	pushq	%rbp
1454d49e1: 41 57                       	pushq	%r15
1454d49e3: 41 56                       	pushq	%r14
1454d49e5: 41 55                       	pushq	%r13
1454d49e7: 41 54                       	pushq	%r12
1454d49e9: 56                          	pushq	%rsi
1454d49ea: 57                          	pushq	%rdi
1454d49eb: 53                          	pushq	%rbx
1454d49ec: 48 81 ec 88 00 00 00        	subq	$0x88, %rsp
1454d49f3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454d49fb: 0f 29 7d f0                 	movaps	%xmm7, -0x10(%rbp)
1454d49ff: 0f 29 75 e0                 	movaps	%xmm6, -0x20(%rbp)
1454d4a03: 48 c7 45 d8 fe ff ff ff     	movq	$-0x2, -0x28(%rbp)
1454d4a0b: 48 89 ce                    	movq	%rcx, %rsi
1454d4a0e: 4c 8b 02                    	movq	(%rdx), %r8
1454d4a11: 49 8b 18                    	movq	(%r8), %rbx
1454d4a14: 49 8b 78 08                 	movq	0x8(%r8), %rdi
1454d4a18: 48 83 ff 0b                 	cmpq	$0xb, %rdi
1454d4a1c: 74 28                       	je	0x1454d4a46 <.text+0x54d3a46>
1454d4a1e: 48 83 ff 0a                 	cmpq	$0xa, %rdi
1454d4a22: 75 40                       	jne	0x1454d4a64 <.text+0x54d3a64>
1454d4a24: 48 8b 03                    	movq	(%rbx), %rax
1454d4a27: 48 33 05 5e 8d 24 01        	xorq	0x1248d5e(%rip), %rax   # 0x14671d78c
1454d4a2e: 0f b7 4b 08                 	movzwl	0x8(%rbx), %ecx
1454d4a32: 66 33 0d 5b 8d 24 01        	xorw	0x1248d5b(%rip), %cx    # 0x14671d794
1454d4a39: 0f b7 c9                    	movzwl	%cx, %ecx
1454d4a3c: 48 09 c1                    	orq	%rax, %rcx
1454d4a3f: 75 23                       	jne	0x1454d4a64 <.text+0x54d3a64>
1454d4a41: e9 8a 02 00 00              	jmp	0x1454d4cd0 <.text+0x54d3cd0>
1454d4a46: 48 8b 03                    	movq	(%rbx), %rax
1454d4a49: 48 33 05 46 8d 24 01        	xorq	0x1248d46(%rip), %rax   # 0x14671d796
1454d4a50: 48 8b 4b 03                 	movq	0x3(%rbx), %rcx
1454d4a54: 48 33 0d 3e 8d 24 01        	xorq	0x1248d3e(%rip), %rcx   # 0x14671d799
1454d4a5b: 48 09 c1                    	orq	%rax, %rcx
1454d4a5e: 0f 84 6c 02 00 00           	je	0x1454d4cd0 <.text+0x54d3cd0>
1454d4a64: 4c 89 45 d0                 	movq	%r8, -0x30(%rbp)
1454d4a68: f3 41 0f 10 78 48           	movss	0x48(%r8), %xmm7
1454d4a6e: f3 0f 59 3d ca 42 42 00     	mulss	0x4242ca(%rip), %xmm7   # 0x1458f8d40
1454d4a76: f3 0f 59 7a 14              	mulss	0x14(%rdx), %xmm7
1454d4a7b: f3 0f 59 7a 3c              	mulss	0x3c(%rdx), %xmm7
1454d4a80: f3 0f 59 be 60 04 00 00     	mulss	0x460(%rsi), %xmm7
1454d4a88: f3 0f 5f 3d 80 85 41 00     	maxss	0x418580(%rip), %xmm7   # 0x1458ed010
1454d4a90: 48 89 d9                    	movq	%rbx, %rcx
1454d4a93: 49 89 d6                    	movq	%rdx, %r14
1454d4a96: 48 89 fa                    	movq	%rdi, %rdx
1454d4a99: e8 12 6e f4 ff              	callq	0x14541b8b0 <.text+0x541a8b0>
1454d4a9e: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454d4aa1: f3 0f 5f f7                 	maxss	%xmm7, %xmm6
1454d4aa5: f3 41 0f 10 46 50           	movss	0x50(%r14), %xmm0
1454d4aab: f3 0f 5f 05 6d 1b 42 00     	maxss	0x421b6d(%rip), %xmm0   # 0x1458f6620
1454d4ab3: f3 0f 5e f0                 	divss	%xmm0, %xmm6
1454d4ab7: f3 0f 10 be e4 08 00 00     	movss	0x8e4(%rsi), %xmm7
1454d4abf: f3 0f 58 fe                 	addss	%xmm6, %xmm7
1454d4ac3: 4c 8b a6 28 07 00 00        	movq	0x728(%rsi), %r12
1454d4aca: 4c 8b be 30 07 00 00        	movq	0x730(%rsi), %r15
1454d4ad1: 4d 85 ff                    	testq	%r15, %r15
1454d4ad4: 74 59                       	je	0x1454d4b2f <.text+0x54d3b2f>
1454d4ad6: 4a 8d 04 fd 00 00 00 00     	leaq	(,%r15,8), %rax
1454d4ade: 4c 8d 34 40                 	leaq	(%rax,%rax,2), %r14
1454d4ae2: 45 31 ed                    	xorl	%r13d, %r13d
1454d4ae5: eb 12                       	jmp	0x1454d4af9 <.text+0x54d3af9>
1454d4ae7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454d4af0: 49 83 c5 18                 	addq	$0x18, %r13
1454d4af4: 4d 39 ee                    	cmpq	%r13, %r14
1454d4af7: 74 36                       	je	0x1454d4b2f <.text+0x54d3b2f>
1454d4af9: 4b 39 7c 2c 08              	cmpq	%rdi, 0x8(%r12,%r13)
1454d4afe: 75 f0                       	jne	0x1454d4af0 <.text+0x54d3af0>
1454d4b00: 4b 8b 0c 2c                 	movq	(%r12,%r13), %rcx
1454d4b04: 48 89 da                    	movq	%rbx, %rdx
1454d4b07: 49 89 f8                    	movq	%rdi, %r8
1454d4b0a: e8 c8 22 28 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454d4b0f: 85 c0                       	testl	%eax, %eax
1454d4b11: 75 dd                       	jne	0x1454d4af0 <.text+0x54d3af0>
1454d4b13: f3 43 0f 11 7c 2c 10        	movss	%xmm7, 0x10(%r12,%r13)
1454d4b1a: 4c 8b 75 d0                 	movq	-0x30(%rbp), %r14
1454d4b1e: 48 8b 86 a0 02 00 00        	movq	0x2a0(%rsi), %rax
1454d4b25: 48 85 c0                    	testq	%rax, %rax
1454d4b28: 75 4b                       	jne	0x1454d4b75 <.text+0x54d3b75>
1454d4b2a: e9 8d 00 00 00              	jmp	0x1454d4bbc <.text+0x54d3bbc>
1454d4b2f: 48 8d 8e 20 07 00 00        	leaq	0x720(%rsi), %rcx
1454d4b36: 4c 3b 39                    	cmpq	(%rcx), %r15
1454d4b39: 75 0c                       	jne	0x1454d4b47 <.text+0x54d3b47>
1454d4b3b: e8 20 34 28 00              	callq	0x145757f60 <.text+0x5756f60>
1454d4b40: 4c 8b a6 28 07 00 00        	movq	0x728(%rsi), %r12
1454d4b47: 4b 8d 04 7f                 	leaq	(%r15,%r15,2), %rax
1454d4b4b: 49 89 1c c4                 	movq	%rbx, (%r12,%rax,8)
1454d4b4f: 49 89 7c c4 08              	movq	%rdi, 0x8(%r12,%rax,8)
1454d4b54: f3 41 0f 11 7c c4 10        	movss	%xmm7, 0x10(%r12,%rax,8)
1454d4b5b: 49 ff c7                    	incq	%r15
1454d4b5e: 4c 89 be 30 07 00 00        	movq	%r15, 0x730(%rsi)
1454d4b65: 4c 8b 75 d0                 	movq	-0x30(%rbp), %r14
1454d4b69: 48 8b 86 a0 02 00 00        	movq	0x2a0(%rsi), %rax
1454d4b70: 48 85 c0                    	testq	%rax, %rax
1454d4b73: 74 47                       	je	0x1454d4bbc <.text+0x54d3bbc>
1454d4b75: 4c 8b be 98 02 00 00        	movq	0x298(%rsi), %r15
1454d4b7c: 4c 6b e0 58                 	imulq	$0x58, %rax, %r12
1454d4b80: 49 8b 3e                    	movq	(%r14), %rdi
1454d4b83: 49 8b 5e 08                 	movq	0x8(%r14), %rbx
1454d4b87: 45 31 ed                    	xorl	%r13d, %r13d
1454d4b8a: eb 0d                       	jmp	0x1454d4b99 <.text+0x54d3b99>
1454d4b8c: 0f 1f 40 00                 	nopl	(%rax)
1454d4b90: 49 83 c5 58                 	addq	$0x58, %r13
1454d4b94: 4d 39 ec                    	cmpq	%r13, %r12
1454d4b97: 74 23                       	je	0x1454d4bbc <.text+0x54d3bbc>
1454d4b99: 4b 8b 04 2f                 	movq	(%r15,%r13), %rax
1454d4b9d: 48 39 58 08                 	cmpq	%rbx, 0x8(%rax)
1454d4ba1: 75 ed                       	jne	0x1454d4b90 <.text+0x54d3b90>
1454d4ba3: 48 8b 08                    	movq	(%rax), %rcx
1454d4ba6: 48 89 fa                    	movq	%rdi, %rdx
1454d4ba9: 49 89 d8                    	movq	%rbx, %r8
1454d4bac: e8 26 22 28 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454d4bb1: 85 c0                       	testl	%eax, %eax
1454d4bb3: 75 db                       	jne	0x1454d4b90 <.text+0x54d3b90>
1454d4bb5: f3 43 0f 11 74 2f 0c        	movss	%xmm6, 0xc(%r15,%r13)
1454d4bbc: f3 0f 59 35 4c c3 45 00     	mulss	0x45c34c(%rip), %xmm6   # 0x145930f10
1454d4bc4: f3 48 0f 2c c6              	cvttss2si	%xmm6, %rax
1454d4bc9: 31 c9                       	xorl	%ecx, %ecx
1454d4bcb: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454d4bce: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454d4bd1: 0f 43 c8                    	cmovael	%eax, %ecx
1454d4bd4: 48 8d be 38 05 00 00        	leaq	0x538(%rsi), %rdi
1454d4bdb: 0f 2e 35 3a 69 41 00        	ucomiss	0x41693a(%rip), %xmm6   # 0x1458eb51c
1454d4be2: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454d4be7: 0f 46 c1                    	cmovbel	%ecx, %eax
1454d4bea: 48 8b 96 d0 03 00 00        	movq	0x3d0(%rsi), %rdx
1454d4bf1: 41 8b 4e 40                 	movl	0x40(%r14), %ecx
1454d4bf5: 89 4d c8                    	movl	%ecx, -0x38(%rbp)
1454d4bf8: 89 45 cc                    	movl	%eax, -0x34(%rbp)
1454d4bfb: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1454d4bff: 4c 8d 45 c8                 	leaq	-0x38(%rbp), %r8
1454d4c03: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1454d4c09: e8 52 e3 f6 ff              	callq	0x145442f60 <.text+0x5441f60>
1454d4c0e: 48 8b 9e 48 05 00 00        	movq	0x548(%rsi), %rbx
1454d4c15: 48 3b 9e 38 05 00 00        	cmpq	0x538(%rsi), %rbx
1454d4c1c: 75 09                       	jne	0x1454d4c27 <.text+0x54d3c27>
1454d4c1e: 48 89 f9                    	movq	%rdi, %rcx
1454d4c21: e8 8a 34 28 00              	callq	0x1457580b0 <.text+0x57570b0>
1454d4c26: 90                          	nop
1454d4c27: 48 8b 86 40 05 00 00        	movq	0x540(%rsi), %rax
1454d4c2e: 48 89 d9                    	movq	%rbx, %rcx
1454d4c31: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454d4c35: 0f 10 45 a8                 	movups	-0x58(%rbp), %xmm0
1454d4c39: 0f 10 4d b8                 	movups	-0x48(%rbp), %xmm1
1454d4c3d: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454d4c42: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454d4c46: 48 ff c3                    	incq	%rbx
1454d4c49: 48 89 9e 48 05 00 00        	movq	%rbx, 0x548(%rsi)
1454d4c50: 41 8b 5e 40                 	movl	0x40(%r14), %ebx
1454d4c54: 4c 8b b6 d0 03 00 00        	movq	0x3d0(%rsi), %r14
1454d4c5b: e8 a0 d5 b2 fa              	callq	0x140002200 <.text+0x1200>
1454d4c60: b9 20 00 00 00              	movl	$0x20, %ecx
1454d4c65: ba 01 00 00 00              	movl	$0x1, %edx
1454d4c6a: e8 51 d5 b2 fa              	callq	0x1400021c0 <.text+0x11c0>
1454d4c6f: 48 85 c0                    	testq	%rax, %rax
1454d4c72: 74 78                       	je	0x1454d4cec <.text+0x54d3cec>
1454d4c74: 89 18                       	movl	%ebx, (%rax)
1454d4c76: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
1454d4c7a: 4c 89 70 04                 	movq	%r14, 0x4(%rax)
1454d4c7e: 48 8b 9e 48 05 00 00        	movq	0x548(%rsi), %rbx
1454d4c85: 48 3b 9e 38 05 00 00        	cmpq	0x538(%rsi), %rbx
1454d4c8c: 75 09                       	jne	0x1454d4c97 <.text+0x54d3c97>
1454d4c8e: 48 89 f9                    	movq	%rdi, %rcx
1454d4c91: e8 1a 34 28 00              	callq	0x1457580b0 <.text+0x57570b0>
1454d4c96: 90                          	nop
1454d4c97: 48 8b 86 40 05 00 00        	movq	0x540(%rsi), %rax
1454d4c9e: 48 89 d9                    	movq	%rbx, %rcx
1454d4ca1: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454d4ca5: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1454d4cad: 48 8b 55 d0                 	movq	-0x30(%rbp), %rdx
1454d4cb1: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
1454d4cb6: 48 c7 44 08 10 0c 00 00 00  	movq	$0xc, 0x10(%rax,%rcx)
1454d4cbf: 66 c7 44 08 18 35 01        	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454d4cc6: 48 ff c3                    	incq	%rbx
1454d4cc9: 48 89 9e 48 05 00 00        	movq	%rbx, 0x548(%rsi)
1454d4cd0: 0f 28 75 e0                 	movaps	-0x20(%rbp), %xmm6
1454d4cd4: 0f 28 7d f0                 	movaps	-0x10(%rbp), %xmm7
1454d4cd8: 48 81 c4 88 00 00 00        	addq	$0x88, %rsp
1454d4cdf: 5b                          	popq	%rbx
1454d4ce0: 5f                          	popq	%rdi
1454d4ce1: 5e                          	popq	%rsi
1454d4ce2: 41 5c                       	popq	%r12
1454d4ce4: 41 5d                       	popq	%r13
1454d4ce6: 41 5e                       	popq	%r14
1454d4ce8: 41 5f                       	popq	%r15
1454d4cea: 5d                          	popq	%rbp
1454d4ceb: c3                          	retq
1454d4cec: b9 01 00 00 00              	movl	$0x1, %ecx
1454d4cf1: ba 20 00 00 00              	movl	$0x20, %edx
1454d4cf6: e8 20 25 41 00              	callq	0x1458e721b <.text+0x58e621b>
1454d4cfb: 0f 0b                       	ud2
