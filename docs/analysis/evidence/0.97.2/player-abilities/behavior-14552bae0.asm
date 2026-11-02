
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552bae0: 55                          	pushq	%rbp
14552bae1: 41 57                       	pushq	%r15
14552bae3: 41 56                       	pushq	%r14
14552bae5: 41 55                       	pushq	%r13
14552bae7: 41 54                       	pushq	%r12
14552bae9: 56                          	pushq	%rsi
14552baea: 57                          	pushq	%rdi
14552baeb: 53                          	pushq	%rbx
14552baec: 48 81 ec c8 00 00 00        	subq	$0xc8, %rsp
14552baf3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14552bafb: 44 0f 29 55 30              	movaps	%xmm10, 0x30(%rbp)
14552bb00: 44 0f 29 4d 20              	movaps	%xmm9, 0x20(%rbp)
14552bb05: 44 0f 29 45 10              	movaps	%xmm8, 0x10(%rbp)
14552bb0a: 0f 29 7d 00                 	movaps	%xmm7, (%rbp)
14552bb0e: 0f 29 75 f0                 	movaps	%xmm6, -0x10(%rbp)
14552bb12: 48 c7 45 e8 fe ff ff ff     	movq	$-0x2, -0x18(%rbp)
14552bb1a: 48 89 d3                    	movq	%rdx, %rbx
14552bb1d: 48 89 ce                    	movq	%rcx, %rsi
14552bb20: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
14552bb24: 4c 8b 7a 18                 	movq	0x18(%rdx), %r15
14552bb28: 4d 39 fe                    	cmpq	%r15, %r14
14552bb2b: 74 58                       	je	0x14552bb85 <.text+0x552ab85>
14552bb2d: 4c 8b 63 20                 	movq	0x20(%rbx), %r12
14552bb31: 49 8b 84 24 c8 04 00 00     	movq	0x4c8(%r12), %rax
14552bb39: 49 69 94 24 d0 04 00 00 60 01 00 00 	imulq	$0x160, 0x4d0(%r12), %rdx # imm = 0x160
14552bb45: 49 8b 3e                    	movq	(%r14), %rdi
14552bb48: 49 83 c6 08                 	addq	$0x8, %r14
14552bb4c: 31 c9                       	xorl	%ecx, %ecx
14552bb4e: 49 89 c0                    	movq	%rax, %r8
14552bb51: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
14552bb60: 48 39 ca                    	cmpq	%rcx, %rdx
14552bb63: 74 1b                       	je	0x14552bb80 <.text+0x552ab80>
14552bb65: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
14552bb6c: 49 39 b8 88 00 00 00        	cmpq	%rdi, 0x88(%r8)
14552bb73: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
14552bb7a: 75 e4                       	jne	0x14552bb60 <.text+0x552ab60>
14552bb7c: eb 42                       	jmp	0x14552bbc0 <.text+0x552abc0>
14552bb7e: 66 90                       	nop
14552bb80: 4d 39 fe                    	cmpq	%r15, %r14
14552bb83: 75 c0                       	jne	0x14552bb45 <.text+0x552ab45>
14552bb85: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14552bb8c: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
14552bb94: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14552bb9c: 48 8b 53 10                 	movq	0x10(%rbx), %rdx
14552bba0: 48 85 d2                    	testq	%rdx, %rdx
14552bba3: 0f 84 00 03 00 00           	je	0x14552bea9 <.text+0x552aea9>
14552bba9: 48 8b 0b                    	movq	(%rbx), %rcx
14552bbac: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552bbb0: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552bbb6: e8 15 66 ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552bbbb: e9 e9 02 00 00              	jmp	0x14552bea9 <.text+0x552aea9>
14552bbc0: 48 89 75 a8                 	movq	%rsi, -0x58(%rbp)
14552bbc4: 4c 89 73 08                 	movq	%r14, 0x8(%rbx)
14552bbc8: 4c 8b 6b 28                 	movq	0x28(%rbx), %r13
14552bbcc: f3 0f 10 4c 08 e0           	movss	-0x20(%rax,%rcx), %xmm1
14552bbd2: f3 41 0f 10 45 00           	movss	(%r13), %xmm0
14552bbd8: 40 b6 03                    	movb	$0x3, %sil
14552bbdb: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14552bbde: 77 0d                       	ja	0x14552bbed <.text+0x552abed>
14552bbe0: 48 83 bc 08 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rax,%rcx)
14552bbe9: 74 5d                       	je	0x14552bc48 <.text+0x552ac48>
14552bbeb: 31 f6                       	xorl	%esi, %esi
14552bbed: f3 0f 10 54 08 c8           	movss	-0x38(%rax,%rcx), %xmm2
14552bbf3: 0f 57 c9                    	xorps	%xmm1, %xmm1
14552bbf6: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
14552bbf9: 73 63                       	jae	0x14552bc5e <.text+0x552ac5e>
14552bbfb: f3 0f 5c 44 08 c4           	subss	-0x3c(%rax,%rcx), %xmm0
14552bc01: f3 0f 5e c2                 	divss	%xmm2, %xmm0
14552bc05: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14552bc09: f3 0f 10 05 6f f8 3b 00     	movss	0x3bf86f(%rip), %xmm0   # 0x1458eb480
14552bc11: f3 0f 5d c1                 	minss	%xmm1, %xmm0
14552bc15: f2 0f 10 4c 08 ac           	movsd	-0x54(%rax,%rcx), %xmm1
14552bc1b: f2 0f 10 54 08 b8           	movsd	-0x48(%rax,%rcx), %xmm2
14552bc21: 0f 5c d1                    	subps	%xmm1, %xmm2
14552bc24: f3 0f 12 f0                 	movsldup	%xmm0, %xmm6            # xmm6 = xmm0[0,0,2,2]
14552bc28: 0f 59 f2                    	mulps	%xmm2, %xmm6
14552bc2b: 0f 58 f1                    	addps	%xmm1, %xmm6
14552bc2e: f3 0f 10 4c 08 b4           	movss	-0x4c(%rax,%rcx), %xmm1
14552bc34: f3 0f 10 7c 08 c0           	movss	-0x40(%rax,%rcx), %xmm7
14552bc3a: f3 0f 5c f9                 	subss	%xmm1, %xmm7
14552bc3e: f3 0f 59 f8                 	mulss	%xmm0, %xmm7
14552bc42: f3 0f 58 f9                 	addss	%xmm1, %xmm7
14552bc46: eb 22                       	jmp	0x14552bc6a <.text+0x552ac6a>
14552bc48: 40 b6 02                    	movb	$0x2, %sil
14552bc4b: 40 2a 74 08 f8              	subb	-0x8(%rax,%rcx), %sil
14552bc50: f3 0f 10 54 08 c8           	movss	-0x38(%rax,%rcx), %xmm2
14552bc56: 0f 57 c9                    	xorps	%xmm1, %xmm1
14552bc59: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
14552bc5c: 72 9d                       	jb	0x14552bbfb <.text+0x552abfb>
14552bc5e: f2 0f 10 74 08 b8           	movsd	-0x48(%rax,%rcx), %xmm6
14552bc64: f3 0f 10 7c 08 c0           	movss	-0x40(%rax,%rcx), %xmm7
14552bc6a: f3 44 0f 10 44 08 90        	movss	-0x70(%rax,%rcx), %xmm8
14552bc71: e8 8a 65 ad fa              	callq	0x140002200 <.text+0x1200>
14552bc76: b9 80 00 00 00              	movl	$0x80, %ecx
14552bc7b: ba 08 00 00 00              	movl	$0x8, %edx
14552bc80: e8 3b 65 ad fa              	callq	0x1400021c0 <.text+0x11c0>
14552bc85: 48 85 c0                    	testq	%rax, %rax
14552bc88: 48 89 5d b8                 	movq	%rbx, -0x48(%rbp)
14552bc8c: 0f 84 45 02 00 00           	je	0x14552bed7 <.text+0x552aed7>
14552bc92: f3 44 0f 11 00              	movss	%xmm8, (%rax)
14552bc97: 0f 13 70 04                 	movlps	%xmm6, 0x4(%rax)
14552bc9b: f3 0f 11 78 0c              	movss	%xmm7, 0xc(%rax)
14552bca0: 40 88 70 10                 	movb	%sil, 0x10(%rax)
14552bca4: 48 89 78 18                 	movq	%rdi, 0x18(%rax)
14552bca8: 48 c7 45 c8 04 00 00 00     	movq	$0x4, -0x38(%rbp)
14552bcb0: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
14552bcb4: 48 c7 45 d8 01 00 00 00     	movq	$0x1, -0x28(%rbp)
14552bcbc: 48 8b 0b                    	movq	(%rbx), %rcx
14552bcbf: 48 89 4d b0                 	movq	%rcx, -0x50(%rbp)
14552bcc3: 48 8b 4b 10                 	movq	0x10(%rbx), %rcx
14552bcc7: 48 89 4d e0                 	movq	%rcx, -0x20(%rbp)
14552bccb: 4d 39 fe                    	cmpq	%r15, %r14
14552bcce: 0f 84 a6 01 00 00           	je	0x14552be7a <.text+0x552ae7a>
14552bcd4: bf 01 00 00 00              	movl	$0x1, %edi
14552bcd9: 0f 57 f6                    	xorps	%xmm6, %xmm6
14552bcdc: f3 0f 10 3d 9c f7 3b 00     	movss	0x3bf79c(%rip), %xmm7   # 0x1458eb480
14552bce4: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
14552bce8: eb 3a                       	jmp	0x14552bd24 <.text+0x552ad24>
14552bcea: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14552bcf0: 48 89 f9                    	movq	%rdi, %rcx
14552bcf3: 48 c1 e1 05                 	shlq	$0x5, %rcx
14552bcf7: f3 44 0f 11 14 08           	movss	%xmm10, (%rax,%rcx)
14552bcfd: 44 0f 13 44 08 04           	movlps	%xmm8, 0x4(%rax,%rcx)
14552bd03: f3 44 0f 11 4c 08 0c        	movss	%xmm9, 0xc(%rax,%rcx)
14552bd0a: 40 88 74 08 10              	movb	%sil, 0x10(%rax,%rcx)
14552bd0f: 48 89 5c 08 18              	movq	%rbx, 0x18(%rax,%rcx)
14552bd14: 48 ff c7                    	incq	%rdi
14552bd17: 48 89 7d d8                 	movq	%rdi, -0x28(%rbp)
14552bd1b: 4d 39 fe                    	cmpq	%r15, %r14
14552bd1e: 0f 84 56 01 00 00           	je	0x14552be7a <.text+0x552ae7a>
14552bd24: 49 8b 8c 24 c8 04 00 00     	movq	0x4c8(%r12), %rcx
14552bd2c: 4d 69 84 24 d0 04 00 00 60 01 00 00 	imulq	$0x160, 0x4d0(%r12), %r8 # imm = 0x160
14552bd38: 49 8b 1e                    	movq	(%r14), %rbx
14552bd3b: 49 83 c6 08                 	addq	$0x8, %r14
14552bd3f: 31 d2                       	xorl	%edx, %edx
14552bd41: 49 89 c9                    	movq	%rcx, %r9
14552bd44: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14552bd50: 49 39 d0                    	cmpq	%rdx, %r8
14552bd53: 74 1b                       	je	0x14552bd70 <.text+0x552ad70>
14552bd55: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
14552bd5c: 49 39 99 88 00 00 00        	cmpq	%rbx, 0x88(%r9)
14552bd63: 4d 8d 89 60 01 00 00        	leaq	0x160(%r9), %r9
14552bd6a: 75 e4                       	jne	0x14552bd50 <.text+0x552ad50>
14552bd6c: eb 12                       	jmp	0x14552bd80 <.text+0x552ad80>
14552bd6e: 66 90                       	nop
14552bd70: 4d 39 fe                    	cmpq	%r15, %r14
14552bd73: 75 c3                       	jne	0x14552bd38 <.text+0x552ad38>
14552bd75: e9 00 01 00 00              	jmp	0x14552be7a <.text+0x552ae7a>
14552bd7a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14552bd80: f3 0f 10 4c 11 e0           	movss	-0x20(%rcx,%rdx), %xmm1
14552bd86: f3 41 0f 10 45 00           	movss	(%r13), %xmm0
14552bd8c: 40 b6 03                    	movb	$0x3, %sil
14552bd8f: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14552bd92: 77 0d                       	ja	0x14552bda1 <.text+0x552ada1>
14552bd94: 48 83 bc 11 b8 fe ff ff ff  	cmpq	$-0x1, -0x148(%rcx,%rdx)
14552bd9d: 74 74                       	je	0x14552be13 <.text+0x552ae13>
14552bd9f: 31 f6                       	xorl	%esi, %esi
14552bda1: f3 0f 10 4c 11 c8           	movss	-0x38(%rcx,%rdx), %xmm1
14552bda7: 0f 2e f1                    	ucomiss	%xmm1, %xmm6
14552bdaa: 0f 83 80 00 00 00           	jae	0x14552be30 <.text+0x552ae30>
14552bdb0: f3 0f 5c 44 11 c4           	subss	-0x3c(%rcx,%rdx), %xmm0
14552bdb6: f3 0f 5e c1                 	divss	%xmm1, %xmm0
14552bdba: 0f 57 c9                    	xorps	%xmm1, %xmm1
14552bdbd: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
14552bdc1: 0f 28 c7                    	movaps	%xmm7, %xmm0
14552bdc4: f3 0f 5d c1                 	minss	%xmm1, %xmm0
14552bdc8: f2 0f 10 4c 11 ac           	movsd	-0x54(%rcx,%rdx), %xmm1
14552bdce: f2 0f 10 54 11 b8           	movsd	-0x48(%rcx,%rdx), %xmm2
14552bdd4: 0f 5c d1                    	subps	%xmm1, %xmm2
14552bdd7: f3 44 0f 12 c0              	movsldup	%xmm0, %xmm8            # xmm8 = xmm0[0,0,2,2]
14552bddc: 44 0f 59 c2                 	mulps	%xmm2, %xmm8
14552bde0: 44 0f 58 c1                 	addps	%xmm1, %xmm8
14552bde4: f3 0f 10 4c 11 b4           	movss	-0x4c(%rcx,%rdx), %xmm1
14552bdea: f3 44 0f 10 4c 11 c0        	movss	-0x40(%rcx,%rdx), %xmm9
14552bdf1: f3 44 0f 5c c9              	subss	%xmm1, %xmm9
14552bdf6: f3 44 0f 59 c8              	mulss	%xmm0, %xmm9
14552bdfb: f3 44 0f 58 c9              	addss	%xmm1, %xmm9
14552be00: f3 44 0f 10 54 11 90        	movss	-0x70(%rcx,%rdx), %xmm10
14552be07: 48 3b 7d c8                 	cmpq	-0x38(%rbp), %rdi
14552be0b: 0f 85 df fe ff ff           	jne	0x14552bcf0 <.text+0x552acf0>
14552be11: eb 3c                       	jmp	0x14552be4f <.text+0x552ae4f>
14552be13: 40 b6 02                    	movb	$0x2, %sil
14552be16: 40 2a 74 11 f8              	subb	-0x8(%rcx,%rdx), %sil
14552be1b: f3 0f 10 4c 11 c8           	movss	-0x38(%rcx,%rdx), %xmm1
14552be21: 0f 2e f1                    	ucomiss	%xmm1, %xmm6
14552be24: 72 8a                       	jb	0x14552bdb0 <.text+0x552adb0>
14552be26: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14552be30: f2 44 0f 10 44 11 b8        	movsd	-0x48(%rcx,%rdx), %xmm8
14552be37: f3 44 0f 10 4c 11 c0        	movss	-0x40(%rcx,%rdx), %xmm9
14552be3e: f3 44 0f 10 54 11 90        	movss	-0x70(%rcx,%rdx), %xmm10
14552be45: 48 3b 7d c8                 	cmpq	-0x38(%rbp), %rdi
14552be49: 0f 85 a1 fe ff ff           	jne	0x14552bcf0 <.text+0x552acf0>
14552be4f: 48 c7 44 24 20 20 00 00 00  	movq	$0x20, 0x20(%rsp)
14552be58: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14552be5e: 41 b9 08 00 00 00           	movl	$0x8, %r9d
14552be64: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
14552be68: 48 89 fa                    	movq	%rdi, %rdx
14552be6b: e8 d0 be 22 00              	callq	0x145757d40 <.text+0x5756d40>
14552be70: 90                          	nop
14552be71: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14552be75: e9 76 fe ff ff              	jmp	0x14552bcf0 <.text+0x552acf0>
14552be7a: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
14552be7e: 48 85 d2                    	testq	%rdx, %rdx
14552be81: 74 13                       	je	0x14552be96 <.text+0x552ae96>
14552be83: 48 c1 e2 03                 	shlq	$0x3, %rdx
14552be87: 41 b8 08 00 00 00           	movl	$0x8, %r8d
14552be8d: 48 8b 4d b0                 	movq	-0x50(%rbp), %rcx
14552be91: e8 3a 63 ad fa              	callq	0x1400021d0 <.text+0x11d0>
14552be96: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14552be9a: 48 8b 75 a8                 	movq	-0x58(%rbp), %rsi
14552be9e: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14552bea2: 0f 10 45 c8                 	movups	-0x38(%rbp), %xmm0
14552bea6: 0f 11 06                    	movups	%xmm0, (%rsi)
14552bea9: 48 89 f0                    	movq	%rsi, %rax
14552beac: 0f 28 75 f0                 	movaps	-0x10(%rbp), %xmm6
14552beb0: 0f 28 7d 00                 	movaps	(%rbp), %xmm7
14552beb4: 44 0f 28 45 10              	movaps	0x10(%rbp), %xmm8
14552beb9: 44 0f 28 4d 20              	movaps	0x20(%rbp), %xmm9
14552bebe: 44 0f 28 55 30              	movaps	0x30(%rbp), %xmm10
14552bec3: 48 81 c4 c8 00 00 00        	addq	$0xc8, %rsp
14552beca: 5b                          	popq	%rbx
14552becb: 5f                          	popq	%rdi
14552becc: 5e                          	popq	%rsi
14552becd: 41 5c                       	popq	%r12
14552becf: 41 5d                       	popq	%r13
14552bed1: 41 5e                       	popq	%r14
14552bed3: 41 5f                       	popq	%r15
14552bed5: 5d                          	popq	%rbp
14552bed6: c3                          	retq
14552bed7: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
14552bedb: b9 08 00 00 00              	movl	$0x8, %ecx
14552bee0: ba 80 00 00 00              	movl	$0x80, %edx
14552bee5: e8 31 b3 3b 00              	callq	0x1458e721b <.text+0x58e621b>
14552beea: 90                          	nop
14552beeb: 0f 0b                       	ud2
