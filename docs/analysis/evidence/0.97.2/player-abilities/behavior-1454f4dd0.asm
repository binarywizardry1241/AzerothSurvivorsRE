
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f4dd0: 41 57                       	pushq	%r15
1454f4dd2: 41 56                       	pushq	%r14
1454f4dd4: 56                          	pushq	%rsi
1454f4dd5: 57                          	pushq	%rdi
1454f4dd6: 55                          	pushq	%rbp
1454f4dd7: 53                          	pushq	%rbx
1454f4dd8: 48 83 ec 10                 	subq	$0x10, %rsp
1454f4ddc: 49 8d 40 ff                 	leaq	-0x1(%r8), %rax
1454f4de0: 48 39 d0                    	cmpq	%rdx, %rax
1454f4de3: 0f 83 12 01 00 00           	jae	0x1454f4efb <.text+0x54f3efb>
1454f4de9: 49 39 d0                    	cmpq	%rdx, %r8
1454f4dec: 75 0d                       	jne	0x1454f4dfb <.text+0x54f3dfb>
1454f4dee: 48 83 c4 10                 	addq	$0x10, %rsp
1454f4df2: 5b                          	popq	%rbx
1454f4df3: 5d                          	popq	%rbp
1454f4df4: 5f                          	popq	%rdi
1454f4df5: 5e                          	popq	%rsi
1454f4df6: 41 5e                       	popq	%r14
1454f4df8: 41 5f                       	popq	%r15
1454f4dfa: c3                          	retq
1454f4dfb: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454f4dff: 48 01 ca                    	addq	%rcx, %rdx
1454f4e02: 49 c1 e0 04                 	shlq	$0x4, %r8
1454f4e06: 4a 8d 04 01                 	leaq	(%rcx,%r8), %rax
1454f4e0a: 49 83 c0 f0                 	addq	$-0x10, %r8
1454f4e0e: eb 28                       	jmp	0x1454f4e38 <.text+0x54f3e38>
1454f4e10: 48 89 cf                    	movq	%rcx, %rdi
1454f4e13: 44 89 17                    	movl	%r10d, (%rdi)
1454f4e16: 44 88 4f 04                 	movb	%r9b, 0x4(%rdi)
1454f4e1a: 4c 8b 0c 24                 	movq	(%rsp), %r9
1454f4e1e: 4c 89 4f 05                 	movq	%r9, 0x5(%rdi)
1454f4e22: 44 8b 4c 24 07              	movl	0x7(%rsp), %r9d
1454f4e27: 44 89 4f 0c                 	movl	%r9d, 0xc(%rdi)
1454f4e2b: 48 83 c0 10                 	addq	$0x10, %rax
1454f4e2f: 49 83 c0 10                 	addq	$0x10, %r8
1454f4e33: 48 39 d0                    	cmpq	%rdx, %rax
1454f4e36: 74 b6                       	je	0x1454f4dee <.text+0x54f3dee>
1454f4e38: 44 0f b6 48 04              	movzbl	0x4(%rax), %r9d
1454f4e3d: 44 3a 48 f4                 	cmpb	-0xc(%rax), %r9b
1454f4e41: 75 2d                       	jne	0x1454f4e70 <.text+0x54f3e70>
1454f4e43: 44 8b 58 f0                 	movl	-0x10(%rax), %r11d
1454f4e47: 44 8b 10                    	movl	(%rax), %r10d
1454f4e4a: 44 89 de                    	movl	%r11d, %esi
1454f4e4d: c1 fe 1f                    	sarl	$0x1f, %esi
1454f4e50: d1 ee                       	shrl	%esi
1454f4e52: 44 31 de                    	xorl	%r11d, %esi
1454f4e55: 45 89 d3                    	movl	%r10d, %r11d
1454f4e58: 41 c1 fb 1f                 	sarl	$0x1f, %r11d
1454f4e5c: 41 d1 eb                    	shrl	%r11d
1454f4e5f: 45 31 d3                    	xorl	%r10d, %r11d
1454f4e62: 44 39 de                    	cmpl	%r11d, %esi
1454f4e65: 7d c4                       	jge	0x1454f4e2b <.text+0x54f3e2b>
1454f4e67: eb 0c                       	jmp	0x1454f4e75 <.text+0x54f3e75>
1454f4e69: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454f4e70: 73 b9                       	jae	0x1454f4e2b <.text+0x54f3e2b>
1454f4e72: 44 8b 10                    	movl	(%rax), %r10d
1454f4e75: 4c 8d 58 f0                 	leaq	-0x10(%rax), %r11
1454f4e79: 8b 70 0c                    	movl	0xc(%rax), %esi
1454f4e7c: 89 74 24 07                 	movl	%esi, 0x7(%rsp)
1454f4e80: 48 8b 70 05                 	movq	0x5(%rax), %rsi
1454f4e84: 48 89 34 24                 	movq	%rsi, (%rsp)
1454f4e88: 41 0f 10 03                 	movups	(%r11), %xmm0
1454f4e8c: 0f 11 00                    	movups	%xmm0, (%rax)
1454f4e8f: 48 89 cf                    	movq	%rcx, %rdi
1454f4e92: 49 39 cb                    	cmpq	%rcx, %r11
1454f4e95: 0f 84 78 ff ff ff           	je	0x1454f4e13 <.text+0x54f3e13>
1454f4e9b: 44 89 d6                    	movl	%r10d, %esi
1454f4e9e: c1 fe 1f                    	sarl	$0x1f, %esi
1454f4ea1: d1 ee                       	shrl	%esi
1454f4ea3: 44 31 d6                    	xorl	%r10d, %esi
1454f4ea6: 4c 89 c3                    	movq	%r8, %rbx
1454f4ea9: eb 20                       	jmp	0x1454f4ecb <.text+0x54f3ecb>
1454f4eab: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454f4eb0: 0f 83 5d ff ff ff           	jae	0x1454f4e13 <.text+0x54f3e13>
1454f4eb6: 49 83 c3 f0                 	addq	$-0x10, %r11
1454f4eba: 41 0f 10 06                 	movups	(%r14), %xmm0
1454f4ebe: 0f 11 07                    	movups	%xmm0, (%rdi)
1454f4ec1: 48 83 c3 f0                 	addq	$-0x10, %rbx
1454f4ec5: 0f 84 45 ff ff ff           	je	0x1454f4e10 <.text+0x54f3e10>
1454f4ecb: 48 8d 3c 19                 	leaq	(%rcx,%rbx), %rdi
1454f4ecf: 4c 8d 34 19                 	leaq	(%rcx,%rbx), %r14
1454f4ed3: 49 83 c6 f0                 	addq	$-0x10, %r14
1454f4ed7: 44 3a 4c 19 f4              	cmpb	-0xc(%rcx,%rbx), %r9b
1454f4edc: 75 d2                       	jne	0x1454f4eb0 <.text+0x54f3eb0>
1454f4ede: 41 8b 2e                    	movl	(%r14), %ebp
1454f4ee1: 41 89 ef                    	movl	%ebp, %r15d
1454f4ee4: 41 c1 ff 1f                 	sarl	$0x1f, %r15d
1454f4ee8: 41 d1 ef                    	shrl	%r15d
1454f4eeb: 41 31 ef                    	xorl	%ebp, %r15d
1454f4eee: 41 39 f7                    	cmpl	%esi, %r15d
1454f4ef1: 7c c3                       	jl	0x1454f4eb6 <.text+0x54f3eb6>
1454f4ef3: 4c 89 df                    	movq	%r11, %rdi
1454f4ef6: e9 18 ff ff ff              	jmp	0x1454f4e13 <.text+0x54f3e13>
1454f4efb: 0f 0b                       	ud2
