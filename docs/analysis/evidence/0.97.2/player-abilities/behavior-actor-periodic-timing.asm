
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c9b10: 48 89 95 28 01 00 00        	movq	%rdx, 0x128(%rbp)
1454c9b17: 88 85 84 02 00 00           	movb	%al, 0x284(%rbp)
1454c9b1d: 4d 8b 68 08                 	movq	0x8(%r8), %r13
1454c9b21: 49 8b 40 10                 	movq	0x10(%r8), %rax
1454c9b25: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
1454c9b29: 48 c1 e0 04                 	shlq	$0x4, %rax
1454c9b2d: 4c 01 e8                    	addq	%r13, %rax
1454c9b30: 48 89 85 70 01 00 00        	movq	%rax, 0x170(%rbp)
1454c9b37: 4c 89 85 90 02 00 00        	movq	%r8, 0x290(%rbp)
1454c9b3e: 4c 3b ad 70 01 00 00        	cmpq	0x170(%rbp), %r13
1454c9b45: 75 1d                       	jne	0x1454c9b64 <.text+0x54c8b64>
1454c9b47: e9 58 01 00 00              	jmp	0x1454c9ca4 <.text+0x54c8ca4>
1454c9b4c: 0f 1f 40 00                 	nopl	(%rax)
1454c9b50: 4c 8b ad 40 02 00 00        	movq	0x240(%rbp), %r13
1454c9b57: 4c 3b ad 70 01 00 00        	cmpq	0x170(%rbp), %r13
1454c9b5e: 0f 84 40 01 00 00           	je	0x1454c9ca4 <.text+0x54c8ca4>
1454c9b64: 49 8d 45 30                 	leaq	0x30(%r13), %rax
1454c9b68: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
1454c9b6f: eb 4f                       	jmp	0x1454c9bc0 <.text+0x54c8bc0>
1454c9b71: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454c9b80: 48 8b 45 50                 	movq	0x50(%rbp), %rax
1454c9b84: 48 8d 0c 9b                 	leaq	(%rbx,%rbx,4), %rcx
1454c9b88: 48 89 34 c8                 	movq	%rsi, (%rax,%rcx,8)
1454c9b8c: 4c 89 64 c8 08              	movq	%r12, 0x8(%rax,%rcx,8)
1454c9b91: 48 89 7c c8 10              	movq	%rdi, 0x10(%rax,%rcx,8)
1454c9b96: 44 89 7c c8 18              	movl	%r15d, 0x18(%rax,%rcx,8)
1454c9b9b: f3 44 0f 11 4c c8 1c        	movss	%xmm9, 0x1c(%rax,%rcx,8)
1454c9ba2: f3 44 0f 11 54 c8 20        	movss	%xmm10, 0x20(%rax,%rcx,8)
1454c9ba9: 44 88 74 c8 24              	movb	%r14b, 0x24(%rax,%rcx,8)
1454c9bae: 88 54 c8 25                 	movb	%dl, 0x25(%rax,%rcx,8)
1454c9bb2: 48 ff c3                    	incq	%rbx
1454c9bb5: 48 89 5d 58                 	movq	%rbx, 0x58(%rbp)
1454c9bb9: 4c 8b 85 90 02 00 00        	movq	0x290(%rbp), %r8
1454c9bc0: 41 8b 45 20                 	movl	0x20(%r13), %eax
1454c9bc4: 85 c0                       	testl	%eax, %eax
1454c9bc6: 74 88                       	je	0x1454c9b50 <.text+0x54c8b50>
1454c9bc8: f3 41 0f 10 45 1c           	movss	0x1c(%r13), %xmm0
1454c9bce: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454c9bd1: 0f 82 b9 00 00 00           	jb	0x1454c9c90 <.text+0x54c8c90>
1454c9bd7: 49 8b 75 00                 	movq	(%r13), %rsi
1454c9bdb: 48 85 f6                    	testq	%rsi, %rsi
1454c9bde: 74 10                       	je	0x1454c9bf0 <.text+0x54c8bf0>
1454c9be0: 31 d2                       	xorl	%edx, %edx
1454c9be2: eb 13                       	jmp	0x1454c9bf7 <.text+0x54c8bf7>
1454c9be4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454c9bf0: 41 3b 45 24                 	cmpl	0x24(%r13), %eax
1454c9bf4: 0f 94 c2                    	sete	%dl
1454c9bf7: ff c8                       	decl	%eax
1454c9bf9: 41 89 45 20                 	movl	%eax, 0x20(%r13)
1454c9bfd: f3 41 0f 58 45 18           	addss	0x18(%r13), %xmm0
1454c9c03: f3 41 0f 11 45 1c           	movss	%xmm0, 0x1c(%r13)
1454c9c09: 49 8b b8 88 00 00 00        	movq	0x88(%r8), %rdi
1454c9c10: 45 8b 7d 10                 	movl	0x10(%r13), %r15d
1454c9c14: 45 0f b6 75 2c              	movzbl	0x2c(%r13), %r14d
1454c9c19: f3 45 0f 10 4d 14           	movss	0x14(%r13), %xmm9
1454c9c1f: f3 45 0f 10 55 28           	movss	0x28(%r13), %xmm10
1454c9c25: 4d 8b 65 08                 	movq	0x8(%r13), %r12
1454c9c29: 48 8b 5d 58                 	movq	0x58(%rbp), %rbx
1454c9c2d: 48 3b 5d 48                 	cmpq	0x48(%rbp), %rbx
1454c9c31: 0f 85 49 ff ff ff           	jne	0x1454c9b80 <.text+0x54c8b80>
1454c9c37: c6 85 b7 02 00 00 01        	movb	$0x1, 0x2b7(%rbp)
1454c9c3e: c6 85 b6 02 00 00 01        	movb	$0x1, 0x2b6(%rbp)
1454c9c45: c6 85 b5 02 00 00 01        	movb	$0x1, 0x2b5(%rbp)
1454c9c4c: c6 85 b4 02 00 00 01        	movb	$0x1, 0x2b4(%rbp)
1454c9c53: c6 85 b3 02 00 00 01        	movb	$0x1, 0x2b3(%rbp)
1454c9c5a: c6 85 b2 02 00 00 01        	movb	$0x1, 0x2b2(%rbp)
1454c9c61: c6 85 b1 02 00 00 01        	movb	$0x1, 0x2b1(%rbp)
1454c9c68: c6 85 b0 02 00 00 01        	movb	$0x1, 0x2b0(%rbp)
1454c9c6f: c6 85 af 02 00 00 01        	movb	$0x1, 0x2af(%rbp)
1454c9c76: 48 8d 4d 48                 	leaq	0x48(%rbp), %rcx
1454c9c7a: 89 95 60 02 00 00           	movl	%edx, 0x260(%rbp)
1454c9c80: e8 9b e4 28 00              	callq	0x145758120 <.text+0x5757120>
1454c9c85: 8b 95 60 02 00 00           	movl	0x260(%rbp), %edx
1454c9c8b: e9 f0 fe ff ff              	jmp	0x1454c9b80 <.text+0x54c8b80>
