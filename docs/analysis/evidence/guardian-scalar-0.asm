
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bea70: 55                          	pushq	%rbp
1454bea71: 41 57                       	pushq	%r15
1454bea73: 41 56                       	pushq	%r14
1454bea75: 56                          	pushq	%rsi
1454bea76: 57                          	pushq	%rdi
1454bea77: 53                          	pushq	%rbx
1454bea78: 48 81 ec c8 00 00 00        	subq	$0xc8, %rsp
1454bea7f: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454bea87: 44 0f 29 65 30              	movaps	%xmm12, 0x30(%rbp)
1454bea8c: 44 0f 29 5d 20              	movaps	%xmm11, 0x20(%rbp)
1454bea91: 44 0f 29 55 10              	movaps	%xmm10, 0x10(%rbp)
1454bea96: 44 0f 29 4d 00              	movaps	%xmm9, (%rbp)
1454bea9b: 44 0f 29 45 f0              	movaps	%xmm8, -0x10(%rbp)
1454beaa0: 0f 29 7d e0                 	movaps	%xmm7, -0x20(%rbp)
1454beaa4: 0f 29 75 d0                 	movaps	%xmm6, -0x30(%rbp)
1454beaa8: 48 c7 45 c8 fe ff ff ff     	movq	$-0x2, -0x38(%rbp)
1454beab0: 48 89 d7                    	movq	%rdx, %rdi
1454beab3: 48 89 ce                    	movq	%rcx, %rsi
1454beab6: 48 8b 89 10 02 00 00        	movq	0x210(%rcx), %rcx
1454beabd: 48 8b 96 18 02 00 00        	movq	0x218(%rsi), %rdx
1454beac4: e8 c7 4b f2 ff              	callq	0x1453e3690 <.text+0x53e2690>
1454beac9: 48 69 d8 b8 00 00 00        	imulq	$0xb8, %rax, %rbx
1454bead0: 4c 8d 35 41 8f 20 01        	leaq	0x1208f41(%rip), %r14   # 0x1466c7a18
1454bead7: f3 0f 10 b6 cc 08 00 00     	movss	0x8cc(%rsi), %xmm6
1454beadf: 44 0f 28 ce                 	movaps	%xmm6, %xmm9
1454beae3: f3 44 0f 5e 0d 44 ad 41 00  	divss	0x41ad44(%rip), %xmm9   # 0x1458d9830
1454beaec: f3 44 0f 10 96 28 09 00 00  	movss	0x928(%rsi), %xmm10
1454beaf5: f3 46 0f 10 84 33 b0 00 00 00       	movss	0xb0(%rbx,%r14), %xmm8
1454beaff: 4a 8b 54 33 58              	movq	0x58(%rbx,%r14), %rdx
1454beb04: 4c 8d 82 b8 01 00 00        	leaq	0x1b8(%rdx), %r8
1454beb0b: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1454beb0f: e8 7c ad 01 00              	callq	0x1454d9890 <.text+0x54d8890>
1454beb14: 4c 8b 7d b0                 	movq	-0x50(%rbp), %r15
1454beb18: 48 8b 55 b8                 	movq	-0x48(%rbp), %rdx
1454beb1c: 48 83 fa 01                 	cmpq	$0x1, %rdx
1454beb20: 0f 84 af 00 00 00           	je	0x1454bebd5 <.text+0x54bdbd5>
1454beb26: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454beb2a: 48 85 d2                    	testq	%rdx, %rdx
1454beb2d: 0f 84 a8 00 00 00           	je	0x1454bebdb <.text+0x54bdbdb>
1454beb33: f3 41 0f 10 07              	movss	(%r15), %xmm0
1454beb38: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
1454beb3c: 0f 83 03 02 00 00           	jae	0x1454bed45 <.text+0x54bdd45>
1454beb42: 48 8d 04 d5 00 00 00 00     	leaq	(,%rdx,8), %rax
1454beb4a: 31 c9                       	xorl	%ecx, %ecx
1454beb4c: 0f 1f 40 00                 	nopl	(%rax)
1454beb50: f3 41 0f 10 04 cf           	movss	(%r15,%rcx,8), %xmm0
1454beb56: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
1454beb5a: 73 0d                       	jae	0x1454beb69 <.text+0x54bdb69>
1454beb5c: 48 ff c1                    	incq	%rcx
1454beb5f: 48 83 c0 f8                 	addq	$-0x8, %rax
1454beb63: 75 eb                       	jne	0x1454beb50 <.text+0x54bdb50>
1454beb65: 48 8d 4a ff                 	leaq	-0x1(%rdx), %rcx
1454beb69: 48 83 f9 01                 	cmpq	$0x1, %rcx
1454beb6d: 48 83 d1 00                 	adcq	$0x0, %rcx
1454beb71: 48 8d 41 ff                 	leaq	-0x1(%rcx), %rax
1454beb75: 48 39 d0                    	cmpq	%rdx, %rax
1454beb78: 0f 83 16 02 00 00           	jae	0x1454bed94 <.text+0x54bdd94>
1454beb7e: 48 39 d1                    	cmpq	%rdx, %rcx
1454beb81: 0f 83 23 02 00 00           	jae	0x1454bedaa <.text+0x54bddaa>
1454beb87: f3 41 0f 10 44 cf f8        	movss	-0x8(%r15,%rcx,8), %xmm0
1454beb8e: f3 41 0f 10 4c cf fc        	movss	-0x4(%r15,%rcx,8), %xmm1
1454beb95: f3 41 0f 10 14 cf           	movss	(%r15,%rcx,8), %xmm2
1454beb9b: f3 41 0f 10 5c cf 04        	movss	0x4(%r15,%rcx,8), %xmm3
1454beba2: f3 0f 5c d9                 	subss	%xmm1, %xmm3
1454beba6: 45 0f 28 d9                 	movaps	%xmm9, %xmm11
1454bebaa: f3 44 0f 5c d8              	subss	%xmm0, %xmm11
1454bebaf: f3 44 0f 59 db              	mulss	%xmm3, %xmm11
1454bebb4: f3 0f 5c d0                 	subss	%xmm0, %xmm2
1454bebb8: f3 0f 5f 15 f0 1f 3e 00     	maxss	0x3e1ff0(%rip), %xmm2   # 0x1458a0bb0
1454bebc0: f3 44 0f 5e da              	divss	%xmm2, %xmm11
1454bebc5: f3 44 0f 58 d9              	addss	%xmm1, %xmm11
1454bebca: 48 83 ff 0c                 	cmpq	$0xc, %rdi
1454bebce: 72 15                       	jb	0x1454bebe5 <.text+0x54bdbe5>
1454bebd0: e9 a4 01 00 00              	jmp	0x1454bed79 <.text+0x54bdd79>
1454bebd5: f3 45 0f 10 5f 04           	movss	0x4(%r15), %xmm11
1454bebdb: 48 83 ff 0c                 	cmpq	$0xc, %rdi
1454bebdf: 0f 83 94 01 00 00           	jae	0x1454bed79 <.text+0x54bdd79>
1454bebe5: 49 01 de                    	addq	%rbx, %r14
1454bebe8: 49 8b 46 48                 	movq	0x48(%r14), %rax
1454bebec: 48 8d 0c bf                 	leaq	(%rdi,%rdi,4), %rcx
1454bebf0: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454bebf4: f3 44 0f 10 64 08 30        	movss	0x30(%rax,%rcx), %xmm12
1454bebfb: f3 0f 10 3d cd 1d 3e 00     	movss	0x3e1dcd(%rip), %xmm7   # 0x1458a09d0
1454bec03: 83 be 50 08 00 00 01        	cmpl	$0x1, 0x850(%rsi)
1454bec0a: 75 33                       	jne	0x1454bec3f <.text+0x54bdc3f>
1454bec0c: 80 be 35 09 00 00 00        	cmpb	$0x0, 0x935(%rsi)
1454bec13: 74 2a                       	je	0x1454bec3f <.text+0x54bdc3f>
1454bec15: f3 0f 5c b6 54 08 00 00     	subss	0x854(%rsi), %xmm6
1454bec1d: f3 0f 5e 35 0b ac 41 00     	divss	0x41ac0b(%rip), %xmm6   # 0x1458d9830
1454bec25: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454bec28: f3 0f 5f f0                 	maxss	%xmm0, %xmm6
1454bec2c: f3 0f 10 05 40 60 5e 01     	movss	0x15e6040(%rip), %xmm0  # 0x146aa4c74
1454bec34: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454bec37: e8 f7 c5 24 00              	callq	0x14570b233 <.text+0x570a233>
1454bec3c: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454bec3f: 0f b7 be 32 02 00 00        	movzwl	0x232(%rsi), %edi
1454bec46: 8b b6 5c 06 00 00           	movl	0x65c(%rsi), %esi
1454bec4c: 48 8b 55 a8                 	movq	-0x58(%rbp), %rdx
1454bec50: 48 85 d2                    	testq	%rdx, %rdx
1454bec53: 74 12                       	je	0x1454bec67 <.text+0x54bdc67>
1454bec55: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454bec59: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454bec5f: 4c 89 f9                    	movq	%r15, %rcx
1454bec62: e8 69 35 b4 fa              	callq	0x1400021d0 <.text+0x11d0>
1454bec67: 0f b7 c7                    	movzwl	%di, %eax
1454bec6a: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454bec6d: f3 0f 2a c8                 	cvtsi2ss	%eax, %xmm1
1454bec71: f3 0f 5e 0d b7 1e 3e 00     	divss	0x3e1eb7(%rip), %xmm1   # 0x1458a0b30
1454bec79: f3 44 0f 59 1d a2 1e 3e 00  	mulss	0x3e1ea2(%rip), %xmm11  # 0x1458a0b24
1454bec82: f3 45 0f 59 c2              	mulss	%xmm10, %xmm8
1454bec87: f3 45 0f 59 d8              	mulss	%xmm8, %xmm11
1454bec8c: f3 0f 10 05 dc 10 41 00     	movss	0x4110dc(%rip), %xmm0   # 0x1458cfd70
1454bec94: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454bec99: f3 0f 10 15 2f 1d 3e 00     	movss	0x3e1d2f(%rip), %xmm2   # 0x1458a09d0
1454beca1: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1454beca5: f3 0f 10 1d f3 1d 3e 00     	movss	0x3e1df3(%rip), %xmm3   # 0x1458a0aa0
1454becad: f3 41 0f 59 d9              	mulss	%xmm9, %xmm3
1454becb2: f3 41 0f 59 d9              	mulss	%xmm9, %xmm3
1454becb7: f3 0f 58 d8                 	addss	%xmm0, %xmm3
1454becbb: f3 41 0f 59 d8              	mulss	%xmm8, %xmm3
1454becc0: f3 41 0f 59 dc              	mulss	%xmm12, %xmm3
1454becc5: f3 0f 59 1d 33 db 43 00     	mulss	0x43db33(%rip), %xmm3   # 0x1458fc800
1454beccd: 41 0f 28 c3                 	movaps	%xmm11, %xmm0
1454becd1: f3 0f 5f c3                 	maxss	%xmm3, %xmm0
1454becd5: 0f 28 d8                    	movaps	%xmm0, %xmm3
1454becd8: f3 0f c2 d8 03              	cmpunordss	%xmm0, %xmm3
1454becdd: 0f 28 e3                    	movaps	%xmm3, %xmm4
1454bece0: 0f 55 e0                    	andnps	%xmm0, %xmm4
1454bece3: 41 0f 54 db                 	andps	%xmm11, %xmm3
1454bece7: 0f 56 dc                    	orps	%xmm4, %xmm3
1454becea: f3 0f 59 1d fe 0a 3e 00     	mulss	0x3e0afe(%rip), %xmm3   # 0x14589f7f0
1454becf2: 89 f0                       	movl	%esi, %eax
1454becf4: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454becf7: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454becfc: f3 0f 59 df                 	mulss	%xmm7, %xmm3
1454bed00: f3 0f 59 05 80 0b 3e 00     	mulss	0x3e0b80(%rip), %xmm0   # 0x14589f888
1454bed08: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1454bed0c: f3 0f 59 c3                 	mulss	%xmm3, %xmm0
1454bed10: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454bed14: 0f 28 75 d0                 	movaps	-0x30(%rbp), %xmm6
1454bed18: 0f 28 7d e0                 	movaps	-0x20(%rbp), %xmm7
1454bed1c: 44 0f 28 45 f0              	movaps	-0x10(%rbp), %xmm8
1454bed21: 44 0f 28 4d 00              	movaps	(%rbp), %xmm9
1454bed26: 44 0f 28 55 10              	movaps	0x10(%rbp), %xmm10
1454bed2b: 44 0f 28 5d 20              	movaps	0x20(%rbp), %xmm11
1454bed30: 44 0f 28 65 30              	movaps	0x30(%rbp), %xmm12
1454bed35: 48 81 c4 c8 00 00 00        	addq	$0xc8, %rsp
1454bed3c: 5b                          	popq	%rbx
1454bed3d: 5f                          	popq	%rdi
1454bed3e: 5e                          	popq	%rsi
1454bed3f: 41 5e                       	popq	%r14
1454bed41: 41 5f                       	popq	%r15
1454bed43: 5d                          	popq	%rbp
1454bed44: c3                          	retq
1454bed45: f3 44 0f 10 1d d2 1d 3e 00  	movss	0x3e1dd2(%rip), %xmm11  # 0x1458a0b20
1454bed4e: f3 45 0f 59 d9              	mulss	%xmm9, %xmm11
1454bed53: f3 0f 5f 05 55 1e 3e 00     	maxss	0x3e1e55(%rip), %xmm0   # 0x1458a0bb0
1454bed5b: f3 44 0f 5e d8              	divss	%xmm0, %xmm11
1454bed60: f3 44 0f 58 1d bb 1d 3e 00  	addss	0x3e1dbb(%rip), %xmm11  # 0x1458a0b24
1454bed69: f3 45 0f 59 5f 04           	mulss	0x4(%r15), %xmm11
1454bed6f: 48 83 ff 0c                 	cmpq	$0xc, %rdi
1454bed73: 0f 82 6c fe ff ff           	jb	0x1454bebe5 <.text+0x54bdbe5>
1454bed79: 4c 89 7d c0                 	movq	%r15, -0x40(%rbp)
1454bed7d: 4c 8d 05 74 81 5e 01        	leaq	0x15e8174(%rip), %r8    # 0x146aa6ef8
1454bed84: ba 0c 00 00 00              	movl	$0xc, %edx
1454bed89: 48 89 f9                    	movq	%rdi, %rcx
1454bed8c: e8 f2 b4 3d 00              	callq	0x14589a283 <.text+0x5899283>
1454bed91: 90                          	nop
1454bed92: eb 27                       	jmp	0x1454bedbb <.text+0x54bddbb>
1454bed94: 4c 89 7d c0                 	movq	%r15, -0x40(%rbp)
1454bed98: 4c 8d 05 29 81 5e 01        	leaq	0x15e8129(%rip), %r8    # 0x146aa6ec8
1454bed9f: 48 89 c1                    	movq	%rax, %rcx
1454beda2: e8 dc b4 3d 00              	callq	0x14589a283 <.text+0x5899283>
1454beda7: 90                          	nop
1454beda8: eb 11                       	jmp	0x1454bedbb <.text+0x54bddbb>
1454bedaa: 4c 89 7d c0                 	movq	%r15, -0x40(%rbp)
1454bedae: 4c 8d 05 2b 81 5e 01        	leaq	0x15e812b(%rip), %r8    # 0x146aa6ee0
1454bedb5: e8 c9 b4 3d 00              	callq	0x14589a283 <.text+0x5899283>
1454bedba: 90                          	nop
1454bedbb: 0f 0b                       	ud2
