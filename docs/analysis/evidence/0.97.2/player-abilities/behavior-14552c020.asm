
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552c020: 55                          	pushq	%rbp
14552c021: 41 57                       	pushq	%r15
14552c023: 41 56                       	pushq	%r14
14552c025: 41 55                       	pushq	%r13
14552c027: 41 54                       	pushq	%r12
14552c029: 56                          	pushq	%rsi
14552c02a: 57                          	pushq	%rdi
14552c02b: 53                          	pushq	%rbx
14552c02c: 48 81 ec a8 00 00 00        	subq	$0xa8, %rsp
14552c033: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14552c03b: 44 0f 29 45 10              	movaps	%xmm8, 0x10(%rbp)
14552c040: 0f 29 7d 00                 	movaps	%xmm7, (%rbp)
14552c044: 0f 29 75 f0                 	movaps	%xmm6, -0x10(%rbp)
14552c048: 48 c7 45 e8 fe ff ff ff     	movq	$-0x2, -0x18(%rbp)
14552c050: 48 89 d3                    	movq	%rdx, %rbx
14552c053: 48 89 ce                    	movq	%rcx, %rsi
14552c056: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
14552c05a: 4c 8b 7a 18                 	movq	0x18(%rdx), %r15
14552c05e: 4d 39 fe                    	cmpq	%r15, %r14
14552c061: 74 52                       	je	0x14552c0b5 <.text+0x552b0b5>
14552c063: 4c 8b 63 20                 	movq	0x20(%rbx), %r12
14552c067: 49 8b 84 24 c8 04 00 00     	movq	0x4c8(%r12), %rax
14552c06f: 49 69 94 24 d0 04 00 00 60 01 00 00 	imulq	$0x160, 0x4d0(%r12), %rdx # imm = 0x160
14552c07b: 49 8b 3e                    	movq	(%r14), %rdi
14552c07e: 49 83 c6 08                 	addq	$0x8, %r14
14552c082: 31 c9                       	xorl	%ecx, %ecx
14552c084: 49 89 c0                    	movq	%rax, %r8
14552c087: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
14552c090: 48 39 ca                    	cmpq	%rcx, %rdx
14552c093: 74 1b                       	je	0x14552c0b0 <.text+0x552b0b0>
14552c095: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
14552c09c: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
14552c0a3: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
14552c0aa: 75 e4                       	jne	0x14552c090 <.text+0x552b090>
14552c0ac: eb 42                       	jmp	0x14552c0f0 <.text+0x552b0f0>
14552c0ae: 66 90                       	nop
14552c0b0: 4d 39 fe                    	cmpq	%r15, %r14
14552c0b3: 75 c6                       	jne	0x14552c07b <.text+0x552b07b>
14552c0b5: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14552c0bc: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
14552c0c4: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14552c0cc: 48 8b 53 10                 	movq	0x10(%rbx), %rdx
14552c0d0: 48 85 d2                    	testq	%rdx, %rdx
14552c0d3: 0f 84 fd 01 00 00           	je	0x14552c2d6 <.text+0x552b2d6>
14552c0d9: 48 8b 0b                    	movq	(%rbx), %rcx
14552c0dc: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552c0e0: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552c0e6: e8 e5 60 ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552c0eb: e9 e6 01 00 00              	jmp	0x14552c2d6 <.text+0x552b2d6>
14552c0f0: 48 89 75 a8                 	movq	%rsi, -0x58(%rbp)
14552c0f4: 4c 89 73 08                 	movq	%r14, 0x8(%rbx)
14552c0f8: 4c 8b 6b 28                 	movq	0x28(%rbx), %r13
14552c0fc: f3 0f 10 44 08 e0           	movss	-0x20(%rax,%rcx), %xmm0
14552c102: 40 b6 03                    	movb	$0x3, %sil
14552c105: 41 0f 2e 85 e4 08 00 00     	ucomiss	0x8e4(%r13), %xmm0
14552c10d: 77 17                       	ja	0x14552c126 <.text+0x552b126>
14552c10f: 48 83 bc 08 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%rcx)
14552c118: 74 04                       	je	0x14552c11e <.text+0x552b11e>
14552c11a: 31 f6                       	xorl	%esi, %esi
14552c11c: eb 08                       	jmp	0x14552c126 <.text+0x552b126>
14552c11e: 40 b6 02                    	movb	$0x2, %sil
14552c121: 40 2a 74 08 f8              	subb	-0x8(%rax,%rcx), %sil
14552c126: f3 0f 10 74 08 90           	movss	-0x70(%rax,%rcx), %xmm6
14552c12c: f3 0f 10 7c 08 94           	movss	-0x6c(%rax,%rcx), %xmm7
14552c132: e8 c9 60 ad fa              	callq	0x140002200 <.text+0x1200>
14552c137: b9 40 00 00 00              	movl	$0x40, %ecx
14552c13c: ba 08 00 00 00              	movl	$0x8, %edx
14552c141: e8 7a 60 ad fa              	callq	0x1400021c0 <.text+0x11c0>
14552c146: 48 85 c0                    	testq	%rax, %rax
14552c149: 48 89 5d b8                 	movq	%rbx, -0x48(%rbp)
14552c14d: 0f 84 a7 01 00 00           	je	0x14552c2fa <.text+0x552b2fa>
14552c153: f3 0f 5f 3d 25 f3 3b 00     	maxss	0x3bf325(%rip), %xmm7   # 0x1458eb480
14552c15b: f3 0f 5e f7                 	divss	%xmm7, %xmm6
14552c15f: f3 0f 11 30                 	movss	%xmm6, (%rax)
14552c163: 40 88 70 04                 	movb	%sil, 0x4(%rax)
14552c167: 48 89 78 08                 	movq	%rdi, 0x8(%rax)
14552c16b: 48 c7 45 c8 04 00 00 00     	movq	$0x4, -0x38(%rbp)
14552c173: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
14552c177: 48 c7 45 d8 01 00 00 00     	movq	$0x1, -0x28(%rbp)
14552c17f: 48 8b 0b                    	movq	(%rbx), %rcx
14552c182: 48 89 4d b0                 	movq	%rcx, -0x50(%rbp)
14552c186: 48 8b 4b 10                 	movq	0x10(%rbx), %rcx
14552c18a: 48 89 4d e0                 	movq	%rcx, -0x20(%rbp)
14552c18e: 4d 39 fe                    	cmpq	%r15, %r14
14552c191: 0f 84 10 01 00 00           	je	0x14552c2a7 <.text+0x552b2a7>
14552c197: bf 01 00 00 00              	movl	$0x1, %edi
14552c19c: f3 0f 10 35 dc f2 3b 00     	movss	0x3bf2dc(%rip), %xmm6   # 0x1458eb480
14552c1a4: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
14552c1a8: eb 31                       	jmp	0x14552c1db <.text+0x552b1db>
14552c1aa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14552c1b0: f3 41 0f 5e f8              	divss	%xmm8, %xmm7
14552c1b5: 48 89 f9                    	movq	%rdi, %rcx
14552c1b8: 48 c1 e1 04                 	shlq	$0x4, %rcx
14552c1bc: f3 0f 11 3c 08              	movss	%xmm7, (%rax,%rcx)
14552c1c1: 40 88 74 08 04              	movb	%sil, 0x4(%rax,%rcx)
14552c1c6: 48 89 5c 08 08              	movq	%rbx, 0x8(%rax,%rcx)
14552c1cb: 48 ff c7                    	incq	%rdi
14552c1ce: 48 89 7d d8                 	movq	%rdi, -0x28(%rbp)
14552c1d2: 4d 39 fe                    	cmpq	%r15, %r14
14552c1d5: 0f 84 cc 00 00 00           	je	0x14552c2a7 <.text+0x552b2a7>
14552c1db: 49 8b 8c 24 c8 04 00 00     	movq	0x4c8(%r12), %rcx
14552c1e3: 4d 69 84 24 d0 04 00 00 60 01 00 00 	imulq	$0x160, 0x4d0(%r12), %r8 # imm = 0x160
14552c1ef: 49 8b 1e                    	movq	(%r14), %rbx
14552c1f2: 49 83 c6 08                 	addq	$0x8, %r14
14552c1f6: 31 d2                       	xorl	%edx, %edx
14552c1f8: 49 89 c9                    	movq	%rcx, %r9
14552c1fb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14552c200: 49 39 d0                    	cmpq	%rdx, %r8
14552c203: 74 1b                       	je	0x14552c220 <.text+0x552b220>
14552c205: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
14552c20c: 49 39 99 88 00 00 00        	cmpq	%rbx, 0x88(%r9)
14552c213: 4d 8d 89 60 01 00 00        	leaq	0x160(%r9), %r9
14552c21a: 75 e4                       	jne	0x14552c200 <.text+0x552b200>
14552c21c: eb 12                       	jmp	0x14552c230 <.text+0x552b230>
14552c21e: 66 90                       	nop
14552c220: 4d 39 fe                    	cmpq	%r15, %r14
14552c223: 75 ca                       	jne	0x14552c1ef <.text+0x552b1ef>
14552c225: e9 7d 00 00 00              	jmp	0x14552c2a7 <.text+0x552b2a7>
14552c22a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14552c230: f3 0f 10 44 11 e0           	movss	-0x20(%rcx,%rdx), %xmm0
14552c236: 40 b6 03                    	movb	$0x3, %sil
14552c239: 41 0f 2e 85 e4 08 00 00     	ucomiss	0x8e4(%r13), %xmm0
14552c241: 77 1d                       	ja	0x14552c260 <.text+0x552b260>
14552c243: 48 83 bc 11 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rcx,%rdx)
14552c24c: 74 04                       	je	0x14552c252 <.text+0x552b252>
14552c24e: 31 f6                       	xorl	%esi, %esi
14552c250: eb 0e                       	jmp	0x14552c260 <.text+0x552b260>
14552c252: 40 b6 02                    	movb	$0x2, %sil
14552c255: 40 2a 74 11 f8              	subb	-0x8(%rcx,%rdx), %sil
14552c25a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14552c260: f3 0f 10 7c 11 90           	movss	-0x70(%rcx,%rdx), %xmm7
14552c266: f3 44 0f 10 44 11 94        	movss	-0x6c(%rcx,%rdx), %xmm8
14552c26d: f3 44 0f 5f c6              	maxss	%xmm6, %xmm8
14552c272: 48 3b 7d c8                 	cmpq	-0x38(%rbp), %rdi
14552c276: 0f 85 34 ff ff ff           	jne	0x14552c1b0 <.text+0x552b1b0>
14552c27c: 48 c7 44 24 20 10 00 00 00  	movq	$0x10, 0x20(%rsp)
14552c285: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14552c28b: 41 b9 08 00 00 00           	movl	$0x8, %r9d
14552c291: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
14552c295: 48 89 fa                    	movq	%rdi, %rdx
14552c298: e8 a3 ba 22 00              	callq	0x145757d40 <.text+0x5756d40>
14552c29d: 90                          	nop
14552c29e: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14552c2a2: e9 09 ff ff ff              	jmp	0x14552c1b0 <.text+0x552b1b0>
14552c2a7: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
14552c2ab: 48 85 d2                    	testq	%rdx, %rdx
14552c2ae: 74 13                       	je	0x14552c2c3 <.text+0x552b2c3>
14552c2b0: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552c2b4: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552c2ba: 48 8b 4d b0                 	movq	-0x50(%rbp), %rcx
14552c2be: e8 0d 5f ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552c2c3: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14552c2c7: 48 8b 75 a8                 	movq	-0x58(%rbp), %rsi
14552c2cb: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14552c2cf: 0f 10 45 c8                 	movups	-0x38(%rbp), %xmm0
14552c2d3: 0f 11 06                    	movups	%xmm0, (%rsi)
14552c2d6: 48 89 f0                    	movq	%rsi, %rax
14552c2d9: 0f 28 75 f0                 	movaps	-0x10(%rbp), %xmm6
14552c2dd: 0f 28 7d 00                 	movaps	(%rbp), %xmm7
14552c2e1: 44 0f 28 45 10              	movaps	0x10(%rbp), %xmm8
14552c2e6: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
14552c2ed: 5b                          	popq	%rbx
14552c2ee: 5f                          	popq	%rdi
14552c2ef: 5e                          	popq	%rsi
14552c2f0: 41 5c                       	popq	%r12
14552c2f2: 41 5d                       	popq	%r13
14552c2f4: 41 5e                       	popq	%r14
14552c2f6: 41 5f                       	popq	%r15
14552c2f8: 5d                          	popq	%rbp
14552c2f9: c3                          	retq
14552c2fa: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
14552c2fe: b9 08 00 00 00              	movl	$0x8, %ecx
14552c303: ba 40 00 00 00              	movl	$0x40, %edx
14552c308: e8 0e af 3b 00              	callq	0x1458e721b <.text+0x58e621b>
14552c30d: 90                          	nop
14552c30e: 0f 0b                       	ud2
