
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140110b70: 55                          	pushq	%rbp
140110b71: 41 57                       	pushq	%r15
140110b73: 41 56                       	pushq	%r14
140110b75: 41 55                       	pushq	%r13
140110b77: 41 54                       	pushq	%r12
140110b79: 56                          	pushq	%rsi
140110b7a: 57                          	pushq	%rdi
140110b7b: 53                          	pushq	%rbx
140110b7c: 48 81 ec c8 0a 00 00        	subq	$0xac8, %rsp            # imm = 0xAC8
140110b83: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
140110b8b: 44 0f 29 bd 30 0a 00 00     	movaps	%xmm15, 0xa30(%rbp)
140110b93: 44 0f 29 b5 20 0a 00 00     	movaps	%xmm14, 0xa20(%rbp)
140110b9b: 44 0f 29 ad 10 0a 00 00     	movaps	%xmm13, 0xa10(%rbp)
140110ba3: 44 0f 29 a5 00 0a 00 00     	movaps	%xmm12, 0xa00(%rbp)
140110bab: 44 0f 29 9d f0 09 00 00     	movaps	%xmm11, 0x9f0(%rbp)
140110bb3: 44 0f 29 95 e0 09 00 00     	movaps	%xmm10, 0x9e0(%rbp)
140110bbb: 44 0f 29 8d d0 09 00 00     	movaps	%xmm9, 0x9d0(%rbp)
140110bc3: 44 0f 29 85 c0 09 00 00     	movaps	%xmm8, 0x9c0(%rbp)
140110bcb: 0f 29 bd b0 09 00 00        	movaps	%xmm7, 0x9b0(%rbp)
140110bd2: 0f 29 b5 a0 09 00 00        	movaps	%xmm6, 0x9a0(%rbp)
140110bd9: 48 c7 85 98 09 00 00 fe ff ff ff    	movq	$-0x2, 0x998(%rbp)
140110be4: 49 89 d0                    	movq	%rdx, %r8
140110be7: 48 89 ce                    	movq	%rcx, %rsi
140110bea: 4c 8b 39                    	movq	(%rcx), %r15
140110bed: 48 8b 41 28                 	movq	0x28(%rcx), %rax
140110bf1: 4c 89 bd e0 01 00 00        	movq	%r15, 0x1e0(%rbp)
140110bf8: 0f 10 41 08                 	movups	0x8(%rcx), %xmm0
140110bfc: 0f 11 85 e8 01 00 00        	movups	%xmm0, 0x1e8(%rbp)
140110c03: 0f 10 41 18                 	movups	0x18(%rcx), %xmm0
140110c07: 0f 11 85 f8 01 00 00        	movups	%xmm0, 0x1f8(%rbp)
140110c0e: 48 89 85 08 02 00 00        	movq	%rax, 0x208(%rbp)
140110c15: 66 c7 85 74 05 00 00 00 00  	movw	$0x0, 0x574(%rbp)
140110c1e: c6 85 64 05 00 00 01        	movb	$0x1, 0x564(%rbp)
140110c25: 0f 57 c0                    	xorps	%xmm0, %xmm0
140110c28: 0f 29 85 70 04 00 00        	movaps	%xmm0, 0x470(%rbp)
140110c2f: 0f 29 85 80 04 00 00        	movaps	%xmm0, 0x480(%rbp)
140110c36: 0f 29 85 90 04 00 00        	movaps	%xmm0, 0x490(%rbp)
140110c3d: 0f 29 85 a0 04 00 00        	movaps	%xmm0, 0x4a0(%rbp)
140110c44: 0f 29 85 b0 04 00 00        	movaps	%xmm0, 0x4b0(%rbp)
140110c4b: 48 c7 85 c0 04 00 00 00 00 00 00    	movq	$0x0, 0x4c0(%rbp)
140110c56: c7 85 88 05 00 00 00 00 00 00       	movl	$0x0, 0x588(%rbp)
140110c60: 66 c7 85 8c 05 00 00 00 00  	movw	$0x0, 0x58c(%rbp)
140110c69: 0f 28 05 70 4c 80 05        	movaps	0x5804c70(%rip), %xmm0  # 0x1459158e0
140110c70: 0f 11 85 c8 04 00 00        	movups	%xmm0, 0x4c8(%rbp)
140110c77: 44 0f 28 05 81 4c 80 05     	movaps	0x5804c81(%rip), %xmm8  # 0x145915900
140110c7f: 44 0f 11 85 d8 04 00 00     	movups	%xmm8, 0x4d8(%rbp)
140110c87: 44 0f 10 0d 59 fb 82 05     	movups	0x582fb59(%rip), %xmm9  # 0x1459407e8
140110c8f: 44 0f 11 8d e8 04 00 00     	movups	%xmm9, 0x4e8(%rbp)
140110c97: 44 0f 10 15 59 fb 82 05     	movups	0x582fb59(%rip), %xmm10 # 0x1459407f8
140110c9f: 44 0f 11 95 f8 04 00 00     	movups	%xmm10, 0x4f8(%rbp)
140110ca7: 0f 10 05 5a fb 82 05        	movups	0x582fb5a(%rip), %xmm0  # 0x145940808
140110cae: 0f 11 85 08 05 00 00        	movups	%xmm0, 0x508(%rbp)
140110cb5: 0f 10 05 5c fb 82 05        	movups	0x582fb5c(%rip), %xmm0  # 0x145940818
140110cbc: 0f 11 85 18 05 00 00        	movups	%xmm0, 0x518(%rbp)
140110cc3: 0f 10 05 6e fb 82 05        	movups	0x582fb6e(%rip), %xmm0  # 0x145940838
140110cca: 0f 11 85 38 05 00 00        	movups	%xmm0, 0x538(%rbp)
140110cd1: 0f 10 05 50 fb 82 05        	movups	0x582fb50(%rip), %xmm0  # 0x145940828
140110cd8: 0f 11 85 28 05 00 00        	movups	%xmm0, 0x528(%rbp)
140110cdf: c6 85 86 05 00 00 00        	movb	$0x0, 0x586(%rbp)
140110ce6: c7 85 82 05 00 00 00 00 00 00       	movl	$0x0, 0x582(%rbp)
140110cf0: 48 c7 85 68 05 00 00 00 00 00 00    	movq	$0x0, 0x568(%rbp)
140110cfb: c7 85 70 05 00 00 00 00 80 3f       	movl	$0x3f800000, 0x570(%rbp) # imm = 0x3F800000
140110d05: 0f 28 05 b4 67 7f 05        	movaps	0x57f67b4(%rip), %xmm0  # 0x1459074c0
140110d0c: 0f 11 85 48 05 00 00        	movups	%xmm0, 0x548(%rbp)
140110d13: c7 85 58 05 00 00 01 00 00 00       	movl	$0x1, 0x558(%rbp)
140110d1d: 48 c7 85 5c 05 00 00 00 00 00 00    	movq	$0x0, 0x55c(%rbp)
140110d28: c6 85 87 05 00 00 00        	movb	$0x0, 0x587(%rbp)
140110d2f: 0f 10 05 da f9 82 05        	movups	0x582f9da(%rip), %xmm0  # 0x145940710
140110d36: 0f 29 85 10 04 00 00        	movaps	%xmm0, 0x410(%rbp)
140110d3d: 48 c7 85 20 04 00 00 00 00 00 00    	movq	$0x0, 0x420(%rbp)
140110d48: 44 0f 10 1d d8 f9 82 05     	movups	0x582f9d8(%rip), %xmm11 # 0x145940728
140110d50: 44 0f 11 9d 28 04 00 00     	movups	%xmm11, 0x428(%rbp)
140110d58: 48 c7 85 38 04 00 00 00 00 00 00    	movq	$0x0, 0x438(%rbp)
140110d63: 44 0f 10 25 d5 f9 82 05     	movups	0x582f9d5(%rip), %xmm12 # 0x145940740
140110d6b: 44 0f 29 a5 40 04 00 00     	movaps	%xmm12, 0x440(%rbp)
140110d73: 48 c7 85 50 04 00 00 00 00 00 00    	movq	$0x0, 0x450(%rbp)
140110d7e: 44 0f 10 2d d2 f9 82 05     	movups	0x582f9d2(%rip), %xmm13 # 0x145940758
140110d86: 44 0f 11 ad 58 04 00 00     	movups	%xmm13, 0x458(%rbp)
140110d8e: 48 c7 85 68 04 00 00 00 00 00 00    	movq	$0x0, 0x468(%rbp)
140110d99: 66 c7 85 7a 05 00 00 00 00  	movw	$0x0, 0x57a(%rbp)
140110da2: c7 85 76 05 00 00 00 00 01 00       	movl	$0x10000, 0x576(%rbp) # imm = 0x10000
140110dac: 66 c7 85 80 05 00 00 00 00  	movw	$0x0, 0x580(%rbp)
140110db5: c7 85 7c 05 00 00 00 00 01 00       	movl	$0x10000, 0x57c(%rbp) # imm = 0x10000
140110dbf: 4c 8b 62 18                 	movq	0x18(%rdx), %r12
140110dc3: 48 8b 52 20                 	movq	0x20(%rdx), %rdx
140110dc7: 4c 89 85 30 09 00 00        	movq	%r8, 0x930(%rbp)
140110dce: 4d 8b 40 28                 	movq	0x28(%r8), %r8
140110dd2: 48 8d 8d 90 02 00 00        	leaq	0x290(%rbp), %rcx
140110dd9: e8 b2 89 0e 00              	callq	0x1401f9790 <.text+0x1f8790>
140110dde: 90                          	nop
140110ddf: 41 80 3c 24 01              	cmpb	$0x1, (%r12)
140110de4: 75 25                       	jne	0x140110e0b <.text+0x10fe0b>
140110de6: 41 8b 44 24 01              	movl	0x1(%r12), %eax
140110deb: 41 8b 4c 24 04              	movl	0x4(%r12), %ecx
140110df0: 89 8d fb 07 00 00           	movl	%ecx, 0x7fb(%rbp)
140110df6: 89 85 f8 07 00 00           	movl	%eax, 0x7f8(%rbp)
140110dfc: 49 8b 7c 24 08              	movq	0x8(%r12), %rdi
140110e01: 45 0f b6 74 24 10           	movzbl	0x10(%r12), %r14d
140110e07: b3 01                       	movb	$0x1, %bl
140110e09: eb 11                       	jmp	0x140110e1c <.text+0x10fe1c>
140110e0b: 49 8b 7c 24 08              	movq	0x8(%r12), %rdi
140110e10: f0                          	lock
140110e11: 48 ff 07                    	incq	(%rdi)
140110e14: 0f 8e 87 18 00 00           	jle	0x1401126a1 <.text+0x1116a1>
140110e1a: 31 db                       	xorl	%ebx, %ebx
140110e1c: 4c 89 a5 70 08 00 00        	movq	%r12, 0x870(%rbp)
140110e23: 48 89 b5 b8 07 00 00        	movq	%rsi, 0x7b8(%rbp)
140110e2a: 4c 8d a5 e8 01 00 00        	leaq	0x1e8(%rbp), %r12
140110e31: 48 8b 85 a0 02 00 00        	movq	0x2a0(%rbp), %rax
140110e38: 48 89 85 60 01 00 00        	movq	%rax, 0x160(%rbp)
140110e3f: 0f 10 85 90 02 00 00        	movups	0x290(%rbp), %xmm0
140110e46: 0f 11 85 50 01 00 00        	movups	%xmm0, 0x150(%rbp)
140110e4d: 8b 85 f8 07 00 00           	movl	0x7f8(%rbp), %eax
140110e53: 8b 8d fb 07 00 00           	movl	0x7fb(%rbp), %ecx
140110e59: 89 8d 4c 07 00 00           	movl	%ecx, 0x74c(%rbp)
140110e5f: 89 85 49 07 00 00           	movl	%eax, 0x749(%rbp)
140110e65: 0f 10 05 60 f8 82 05        	movups	0x582f860(%rip), %xmm0  # 0x1459406cc
140110e6c: 0f 11 85 a1 08 00 00        	movups	%xmm0, 0x8a1(%rbp)
140110e73: c7 85 b1 08 00 00 00 00 80 3f       	movl	$0x3f800000, 0x8b1(%rbp) # imm = 0x3F800000
140110e7d: 48 8d 75 d0                 	leaq	-0x30(%rbp), %rsi
140110e81: 48 8d 95 10 04 00 00        	leaq	0x410(%rbp), %rdx
140110e88: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
140110e8e: 48 89 f1                    	movq	%rsi, %rcx
140110e91: e8 57 23 66 05              	callq	0x1457731ed <.text+0x57721ed>
140110e96: 0f 10 85 a0 08 00 00        	movups	0x8a0(%rbp), %xmm0
140110e9d: 0f 11 85 67 07 00 00        	movups	%xmm0, 0x767(%rbp)
140110ea4: 48 8b 85 ad 08 00 00        	movq	0x8ad(%rbp), %rax
140110eab: 48 89 85 74 07 00 00        	movq	%rax, 0x774(%rbp)
140110eb2: 48 8d 8d 98 05 00 00        	leaq	0x598(%rbp), %rcx
140110eb9: 41 b8 98 01 00 00           	movl	$0x198, %r8d            # imm = 0x198
140110ebf: 48 89 f2                    	movq	%rsi, %rdx
140110ec2: 4c 89 e6                    	movq	%r12, %rsi
140110ec5: e8 23 23 66 05              	callq	0x1457731ed <.text+0x57721ed>
140110eca: 48 c7 85 30 07 00 00 00 00 00 00    	movq	$0x0, 0x730(%rbp)
140110ed5: 48 c7 85 38 07 00 00 04 00 00 00    	movq	$0x4, 0x738(%rbp)
140110ee0: 48 c7 85 40 07 00 00 00 00 00 00    	movq	$0x0, 0x740(%rbp)
140110eeb: 88 9d 48 07 00 00           	movb	%bl, 0x748(%rbp)
140110ef1: 48 89 bd 50 07 00 00        	movq	%rdi, 0x750(%rbp)
140110ef8: 4c 89 b5 58 07 00 00        	movq	%r14, 0x758(%rbp)
140110eff: c7 85 60 07 00 00 00 00 40 41       	movl	$0x41400000, 0x760(%rbp) # imm = 0x41400000
140110f09: 66 c7 85 64 07 00 00 90 01  	movw	$0x190, 0x764(%rbp)     # imm = 0x190
140110f12: c6 85 66 07 00 00 01        	movb	$0x1, 0x766(%rbp)
140110f19: 0f 10 05 50 82 80 05        	movups	0x5808250(%rip), %xmm0  # 0x145919170
140110f20: 0f 11 85 7c 07 00 00        	movups	%xmm0, 0x77c(%rbp)
140110f27: 8b 05 53 82 80 05           	movl	0x5808253(%rip), %eax   # 0x145919180
140110f2d: 89 85 8c 07 00 00           	movl	%eax, 0x78c(%rbp)
140110f33: f2 0f 10 05 95 48 80 05     	movsd	0x5804895(%rip), %xmm0  # 0x1459157d0
140110f3b: f2 0f 11 85 90 07 00 00     	movsd	%xmm0, 0x790(%rbp)
140110f43: 4c 89 bd 90 05 00 00        	movq	%r15, 0x590(%rbp)
140110f4a: c6 85 96 09 00 00 01        	movb	$0x1, 0x996(%rbp)
140110f51: 48 8d 8d 10 04 00 00        	leaq	0x410(%rbp), %rcx
140110f58: 4c 8d 85 90 05 00 00        	leaq	0x590(%rbp), %r8
140110f5f: 4c 89 e2                    	movq	%r12, %rdx
140110f62: e8 a9 a4 fc ff              	callq	0x1400db410 <.text+0xda410>
140110f67: 90                          	nop
140110f68: 48 8b 8d 30 09 00 00        	movq	0x930(%rbp), %rcx
140110f6f: 48 8b 01                    	movq	(%rcx), %rax
140110f72: 48 89 85 68 08 00 00        	movq	%rax, 0x868(%rbp)
140110f79: 48 8b 59 08                 	movq	0x8(%rcx), %rbx
140110f7d: 48 8b 41 10                 	movq	0x10(%rcx), %rax
140110f81: 48 8d 04 c3                 	leaq	(%rbx,%rax,8), %rax
140110f85: 4c 8d b5 98 05 00 00        	leaq	0x598(%rbp), %r14
140110f8c: 4c 8b 41 30                 	movq	0x30(%rcx), %r8
140110f90: 4c 89 85 50 08 00 00        	movq	%r8, 0x850(%rbp)
140110f97: 45 0f 57 f6                 	xorps	%xmm14, %xmm14
140110f9b: 0f 28 35 4e 63 7f 05        	movaps	0x57f634e(%rip), %xmm6  # 0x1459072f0
140110fa2: 44 0f 28 3d 46 65 7f 05     	movaps	0x57f6546(%rip), %xmm15 # 0x1459074f0
140110faa: 0f 28 3d cf ec 82 05        	movaps	0x582eccf(%rip), %xmm7  # 0x14593fc80
140110fb1: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
140110fb5: 4c 89 85 a8 07 00 00        	movq	%r8, 0x7a8(%rbp)
140110fbc: 48 8b 49 40                 	movq	0x40(%rcx), %rcx
140110fc0: 48 89 8d b0 07 00 00        	movq	%rcx, 0x7b0(%rbp)
140110fc7: 48 8d 7d d0                 	leaq	-0x30(%rbp), %rdi
140110fcb: 48 89 9d 78 08 00 00        	movq	%rbx, 0x878(%rbp)
140110fd2: 4c 89 bd 38 09 00 00        	movq	%r15, 0x938(%rbp)
140110fd9: 48 89 85 a0 07 00 00        	movq	%rax, 0x7a0(%rbp)
140110fe0: eb 28                       	jmp	0x14011100a <.text+0x11000a>
140110fe2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
140110ff0: 4c 89 e9                    	movq	%r13, %rcx
140110ff3: e8 18 a0 f6 ff              	callq	0x14007b010 <.text+0x7a010>
140110ff8: 48 8b 9d 60 08 00 00        	movq	0x860(%rbp), %rbx
140110fff: 48 83 c3 08                 	addq	$0x8, %rbx
140111003: 48 8b 85 a0 07 00 00        	movq	0x7a0(%rbp), %rax
14011100a: 48 39 c3                    	cmpq	%rax, %rbx
14011100d: 0f 84 90 16 00 00           	je	0x1401126a3 <.text+0x1116a3>
140111013: 4c 8b 23                    	movq	(%rbx), %r12
140111016: 0f 10 05 f3 f6 82 05        	movups	0x582f6f3(%rip), %xmm0  # 0x145940710
14011101d: 0f 29 85 10 04 00 00        	movaps	%xmm0, 0x410(%rbp)
140111024: 48 c7 85 20 04 00 00 00 00 00 00    	movq	$0x0, 0x420(%rbp)
14011102f: 48 8d 85 28 04 00 00        	leaq	0x428(%rbp), %rax
140111036: 44 0f 11 18                 	movups	%xmm11, (%rax)
14011103a: 48 c7 40 10 00 00 00 00     	movq	$0x0, 0x10(%rax)
140111042: 44 0f 11 60 18              	movups	%xmm12, 0x18(%rax)
140111047: 48 c7 40 28 00 00 00 00     	movq	$0x0, 0x28(%rax)
14011104f: 44 0f 11 68 30              	movups	%xmm13, 0x30(%rax)
140111054: 48 c7 40 40 00 00 00 00     	movq	$0x0, 0x40(%rax)
14011105c: 0f 28 85 10 04 00 00        	movaps	0x410(%rbp), %xmm0
140111063: 48 8b 85 20 04 00 00        	movq	0x420(%rbp), %rax
14011106a: 48 8b 8d 28 04 00 00        	movq	0x428(%rbp), %rcx
140111071: 0f 28 8d 30 04 00 00        	movaps	0x430(%rbp), %xmm1
140111078: 0f 28 95 40 04 00 00        	movaps	0x440(%rbp), %xmm2
14011107f: 0f 29 45 d0                 	movaps	%xmm0, -0x30(%rbp)
140111083: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
140111087: 48 89 4d e8                 	movq	%rcx, -0x18(%rbp)
14011108b: 0f 29 4d f0                 	movaps	%xmm1, -0x10(%rbp)
14011108f: 0f 29 55 00                 	movaps	%xmm2, (%rbp)
140111093: 0f 28 85 50 04 00 00        	movaps	0x450(%rbp), %xmm0
14011109a: 0f 29 45 10                 	movaps	%xmm0, 0x10(%rbp)
14011109e: 0f 28 85 60 04 00 00        	movaps	0x460(%rbp), %xmm0
1401110a5: 0f 29 45 20                 	movaps	%xmm0, 0x20(%rbp)
1401110a9: 48 8d 85 50 01 00 00        	leaq	0x150(%rbp), %rax
1401110b0: 44 0f 11 b0 f0 fe ff ff     	movups	%xmm14, -0x110(%rax)
1401110b8: 44 0f 11 b0 e0 fe ff ff     	movups	%xmm14, -0x120(%rax)
1401110c0: 48 c7 80 00 ff ff ff 00 00 00 00    	movq	$0x0, -0x100(%rax)
1401110cb: 45 0f 11 b6 a8 00 00 00     	movups	%xmm14, 0xa8(%r14)
1401110d3: 45 0f 11 b6 98 00 00 00     	movups	%xmm14, 0x98(%r14)
1401110db: 41 c7 86 7a 01 00 00 00 00 00 00    	movl	$0x0, 0x17a(%r14)
1401110e6: 49 c7 86 72 01 00 00 00 00 00 00    	movq	$0x0, 0x172(%r14)
1401110f1: 45 0f 11 b6 d0 01 00 00     	movups	%xmm14, 0x1d0(%r14)
1401110f9: 41 b8 88 00 00 00           	movl	$0x88, %r8d
1401110ff: 48 8d 8d 98 05 00 00        	leaq	0x598(%rbp), %rcx
140111106: 48 89 fa                    	movq	%rdi, %rdx
140111109: e8 df 20 66 05              	callq	0x1457731ed <.text+0x57721ed>
14011110e: 0f 28 05 1b e7 82 05        	movaps	0x582e71b(%rip), %xmm0  # 0x14593f830
140111115: 0f 11 85 20 06 00 00        	movups	%xmm0, 0x620(%rbp)
14011111c: 0f 10 05 a5 f6 82 05        	movups	0x582f6a5(%rip), %xmm0  # 0x1459407c8
140111123: 41 0f 11 86 b8 00 00 00     	movups	%xmm0, 0xb8(%r14)
14011112b: 0f 10 05 a6 f6 82 05        	movups	0x582f6a6(%rip), %xmm0  # 0x1459407d8
140111132: 41 0f 11 86 c8 00 00 00     	movups	%xmm0, 0xc8(%r14)
14011113a: 45 0f 11 8e d8 00 00 00     	movups	%xmm9, 0xd8(%r14)
140111142: 45 0f 11 96 e8 00 00 00     	movups	%xmm10, 0xe8(%r14)
14011114a: 0f 11 b5 90 06 00 00        	movups	%xmm6, 0x690(%rbp)
140111151: 0f 11 b5 a0 06 00 00        	movups	%xmm6, 0x6a0(%rbp)
140111158: 44 0f 11 bd b0 06 00 00     	movups	%xmm15, 0x6b0(%rbp)
140111160: 44 0f 11 bd c0 06 00 00     	movups	%xmm15, 0x6c0(%rbp)
140111168: 0f 28 05 51 63 7f 05        	movaps	0x57f6351(%rip), %xmm0  # 0x1459074c0
14011116f: 0f 11 85 d0 06 00 00        	movups	%xmm0, 0x6d0(%rbp)
140111176: c7 85 e0 06 00 00 01 00 00 00       	movl	$0x1, 0x6e0(%rbp)
140111180: 48 c7 85 e4 06 00 00 00 00 00 00    	movq	$0x0, 0x6e4(%rbp)
14011118b: c6 85 ec 06 00 00 01        	movb	$0x1, 0x6ec(%rbp)
140111192: 48 c7 85 f0 06 00 00 00 00 00 00    	movq	$0x0, 0x6f0(%rbp)
14011119d: c7 85 f8 06 00 00 00 00 80 3f       	movl	$0x3f800000, 0x6f8(%rbp) # imm = 0x3F800000
1401111a7: 66 c7 85 fc 06 00 00 00 00  	movw	$0x0, 0x6fc(%rbp)
1401111b0: 41 c7 86 66 01 00 00 00 00 01 00    	movl	$0x10000, 0x166(%r14) # imm = 0x10000
1401111bb: 66 41 c7 86 6a 01 00 00 00 00       	movw	$0x0, 0x16a(%r14)
1401111c5: 66 41 c7 86 70 01 00 00 00 00       	movw	$0x0, 0x170(%r14)
1401111cf: 41 c7 86 6c 01 00 00 00 00 01 00    	movl	$0x10000, 0x16c(%r14) # imm = 0x10000
1401111da: c7 85 18 07 00 00 00 00 00 00       	movl	$0x0, 0x718(%rbp)
1401111e4: 0f 11 bd 1c 07 00 00        	movups	%xmm7, 0x71c(%rbp)
1401111eb: c7 85 2c 07 00 00 00 00 00 00       	movl	$0x0, 0x72c(%rbp)
1401111f5: 0f 11 bd 30 07 00 00        	movups	%xmm7, 0x730(%rbp)
1401111fc: c7 85 40 07 00 00 00 00 00 00       	movl	$0x0, 0x740(%rbp)
140111206: 0f 11 bd 44 07 00 00        	movups	%xmm7, 0x744(%rbp)
14011120d: c7 85 54 07 00 00 00 00 00 00       	movl	$0x0, 0x754(%rbp)
140111217: 0f 11 bd 58 07 00 00        	movups	%xmm7, 0x758(%rbp)
14011121e: c7 85 78 07 00 00 00 00 00 3f       	movl	$0x3f000000, 0x778(%rbp) # imm = 0x3F000000
140111228: 4c 89 bd 90 05 00 00        	movq	%r15, 0x590(%rbp)
14011122f: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
140111236: 48 89 f2                    	movq	%rsi, %rdx
140111239: 4c 8d 85 90 05 00 00        	leaq	0x590(%rbp), %r8
140111240: e8 3b 68 fc ff              	callq	0x1400d7a80 <.text+0xd6a80>
140111245: 90                          	nop
140111246: 4d 85 e4                    	testq	%r12, %r12
140111249: 0f 84 b0 fd ff ff           	je	0x140110fff <.text+0x10ffff>
14011124f: ba 04 00 00 00              	movl	$0x4, %edx
140111254: 48 8d 0d 6f fe 82 05        	leaq	0x582fe6f(%rip), %rcx   # 0x1459410ca
14011125b: 4d 89 e0                    	movq	%r12, %r8
14011125e: e8 7d e9 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
140111263: 90                          	nop
140111264: 48 85 c0                    	testq	%rax, %rax
140111267: 75 07                       	jne	0x140111270 <.text+0x110270>
140111269: 48 8b 05 48 c5 8f 07        	movq	0x78fc548(%rip), %rax   # 0x147a0d7b8
140111270: 80 38 03                    	cmpb	$0x3, (%rax)
140111273: 75 0b                       	jne	0x140111280 <.text+0x110280>
140111275: 4c 8b 40 10                 	movq	0x10(%rax), %r8
140111279: 4c 8b 48 18                 	movq	0x18(%rax), %r9
14011127d: eb 0a                       	jmp	0x140111289 <.text+0x110289>
14011127f: 90                          	nop
140111280: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140111286: 45 31 c9                    	xorl	%r9d, %r9d
140111289: 48 89 f9                    	movq	%rdi, %rcx
14011128c: 48 8b 95 50 08 00 00        	movq	0x850(%rbp), %rdx
140111293: 4c 89 85 50 09 00 00        	movq	%r8, 0x950(%rbp)
14011129a: 4c 89 8d 88 09 00 00        	movq	%r9, 0x988(%rbp)
1401112a1: e8 7a 58 fa ff              	callq	0x1400b6b20 <.text+0xb5b20>
1401112a6: 90                          	nop
1401112a7: 48 8d 8d 90 05 00 00        	leaq	0x590(%rbp), %rcx
1401112ae: 48 89 fa                    	movq	%rdi, %rdx
1401112b1: e8 6a 15 5f 02              	callq	0x142702820 <.text+0x2701820>
1401112b6: 90                          	nop
1401112b7: 4c 89 a5 78 09 00 00        	movq	%r12, 0x978(%rbp)
1401112be: 48 89 9d 60 08 00 00        	movq	%rbx, 0x860(%rbp)
1401112c5: 41 b8 88 00 00 00           	movl	$0x88, %r8d
1401112cb: 48 89 f9                    	movq	%rdi, %rcx
1401112ce: 48 8d 95 90 05 00 00        	leaq	0x590(%rbp), %rdx
1401112d5: e8 13 1f 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401112da: 48 8b b5 30 02 00 00        	movq	0x230(%rbp), %rsi
1401112e1: 4c 8b ad 48 02 00 00        	movq	0x248(%rbp), %r13
1401112e8: 4c 8b bd 50 02 00 00        	movq	0x250(%rbp), %r15
1401112ef: 4d 85 ed                    	testq	%r13, %r13
1401112f2: 48 89 b5 48 09 00 00        	movq	%rsi, 0x948(%rbp)
1401112f9: 4c 89 bd 58 08 00 00        	movq	%r15, 0x858(%rbp)
140111300: 0f 84 9a 00 00 00           	je	0x1401113a0 <.text+0x1103a0>
140111306: 48 89 b5 90 05 00 00        	movq	%rsi, 0x590(%rbp)
14011130d: 41 b8 88 00 00 00           	movl	$0x88, %r8d
140111313: 4c 89 f1                    	movq	%r14, %rcx
140111316: 48 89 fa                    	movq	%rdi, %rdx
140111319: e8 cf 1e 66 05              	callq	0x1457731ed <.text+0x57721ed>
14011131e: c6 85 20 06 00 00 02        	movb	$0x2, 0x620(%rbp)
140111325: c6 85 28 06 00 00 00        	movb	$0x0, 0x628(%rbp)
14011132c: 49 8b 45 00                 	movq	(%r13), %rax
140111330: 48 89 fb                    	movq	%rdi, %rbx
140111333: 49 8b 7d 10                 	movq	0x10(%r13), %rdi
140111337: 48 29 f8                    	subq	%rdi, %rax
14011133a: 48 3d a7 00 00 00           	cmpq	$0xa7, %rax
140111340: 0f 86 bf 12 00 00           	jbe	0x140112605 <.text+0x111605>
140111346: 4d 8b 7d 08                 	movq	0x8(%r13), %r15
14011134a: 48 8d 05 af 61 06 00        	leaq	0x661af(%rip), %rax     # 0x140177500 <.text+0x176500>
140111351: 49 89 04 3f                 	movq	%rax, (%r15,%rdi)
140111355: 49 89 74 3f 08              	movq	%rsi, 0x8(%r15,%rdi)
14011135a: 49 8d 0c 3f                 	leaq	(%r15,%rdi), %rcx
14011135e: 48 83 c1 10                 	addq	$0x10, %rcx
140111362: 41 b8 88 00 00 00           	movl	$0x88, %r8d
140111368: 48 89 da                    	movq	%rbx, %rdx
14011136b: e8 7d 1e 66 05              	callq	0x1457731ed <.text+0x57721ed>
140111370: 41 c6 84 3f 98 00 00 00 02  	movb	$0x2, 0x98(%r15,%rdi)
140111379: 41 c6 84 3f a0 00 00 00 00  	movb	$0x0, 0xa0(%r15,%rdi)
140111382: 48 81 c7 a8 00 00 00        	addq	$0xa8, %rdi
140111389: 49 89 7d 10                 	movq	%rdi, 0x10(%r13)
14011138d: 4c 8d a5 00 03 00 00        	leaq	0x300(%rbp), %r12
140111394: e9 b4 00 00 00              	jmp	0x14011144d <.text+0x11044d>
140111399: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1401113a0: 4c 89 ad 80 09 00 00        	movq	%r13, 0x980(%rbp)
1401113a7: 4c 8d b5 00 03 00 00        	leaq	0x300(%rbp), %r14
1401113ae: 48 89 b5 90 05 00 00        	movq	%rsi, 0x590(%rbp)
1401113b5: 41 b8 88 00 00 00           	movl	$0x88, %r8d
1401113bb: 48 8d 8d 98 05 00 00        	leaq	0x598(%rbp), %rcx
1401113c2: 48 89 fa                    	movq	%rdi, %rdx
1401113c5: e8 23 1e 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401113ca: c6 85 20 06 00 00 02        	movb	$0x2, 0x620(%rbp)
1401113d1: c6 85 28 06 00 00 00        	movb	$0x0, 0x628(%rbp)
1401113d8: 49 8b 07                    	movq	(%r15), %rax
1401113db: 48 89 fb                    	movq	%rdi, %rbx
1401113de: 49 8b 7f 10                 	movq	0x10(%r15), %rdi
1401113e2: 48 29 f8                    	subq	%rdi, %rax
1401113e5: 48 3d a7 00 00 00           	cmpq	$0xa7, %rax
1401113eb: 0f 86 3a 12 00 00           	jbe	0x14011262b <.text+0x11162b>
1401113f1: 4d 89 fc                    	movq	%r15, %r12
1401113f4: 4d 8b 7f 08                 	movq	0x8(%r15), %r15
1401113f8: 48 8d 05 01 61 06 00        	leaq	0x66101(%rip), %rax     # 0x140177500 <.text+0x176500>
1401113ff: 49 89 04 3f                 	movq	%rax, (%r15,%rdi)
140111403: 49 89 74 3f 08              	movq	%rsi, 0x8(%r15,%rdi)
140111408: 49 8d 0c 3f                 	leaq	(%r15,%rdi), %rcx
14011140c: 48 83 c1 10                 	addq	$0x10, %rcx
140111410: 41 b8 88 00 00 00           	movl	$0x88, %r8d
140111416: 48 89 da                    	movq	%rbx, %rdx
140111419: e8 cf 1d 66 05              	callq	0x1457731ed <.text+0x57721ed>
14011141e: 41 c6 84 3f 98 00 00 00 02  	movb	$0x2, 0x98(%r15,%rdi)
140111427: 41 c6 84 3f a0 00 00 00 00  	movb	$0x0, 0xa0(%r15,%rdi)
140111430: 48 81 c7 a8 00 00 00        	addq	$0xa8, %rdi
140111437: 49 89 7c 24 10              	movq	%rdi, 0x10(%r12)
14011143c: 4d 89 f4                    	movq	%r14, %r12
14011143f: 4c 8d b5 98 05 00 00        	leaq	0x598(%rbp), %r14
140111446: 4c 8b ad 80 09 00 00        	movq	0x980(%rbp), %r13
14011144d: 66 c7 85 f4 03 00 00 00 00  	movw	$0x0, 0x3f4(%rbp)
140111456: c6 85 e4 03 00 00 01        	movb	$0x1, 0x3e4(%rbp)
14011145d: 48 b8 01 00 00 00 00 00 06 c3       	movabsq	$-0x3cf9ffffffffffff, %rax # imm = 0xC306000000000001
140111467: 48 89 85 f8 02 00 00        	movq	%rax, 0x2f8(%rbp)
14011146e: 45 0f 11 34 24              	movups	%xmm14, (%r12)
140111473: 0f 28 05 16 e8 82 05        	movaps	0x582e816(%rip), %xmm0  # 0x14593fc90
14011147a: 0f 29 85 10 03 00 00        	movaps	%xmm0, 0x310(%rbp)
140111481: 48 c7 85 f0 02 00 00 00 00 00 00    	movq	$0x0, 0x2f0(%rbp)
14011148c: 45 0f 11 74 24 30           	movups	%xmm14, 0x30(%r12)
140111492: 45 0f 11 74 24 20           	movups	%xmm14, 0x20(%r12)
140111498: 49 c7 44 24 40 00 00 00 00  	movq	$0x0, 0x40(%r12)
1401114a1: c7 85 0a 04 00 00 05 00 00 00       	movl	$0x5, 0x40a(%rbp)
1401114ab: 44 0f 11 85 48 03 00 00     	movups	%xmm8, 0x348(%rbp)
1401114b3: 0f 28 05 66 e3 82 05        	movaps	0x582e366(%rip), %xmm0  # 0x14593f820
1401114ba: 0f 11 85 58 03 00 00        	movups	%xmm0, 0x358(%rbp)
1401114c1: 0f 28 05 68 73 80 05        	movaps	0x5807368(%rip), %xmm0  # 0x145918830
1401114c8: 0f 11 85 68 03 00 00        	movups	%xmm0, 0x368(%rbp)
1401114cf: 0f 28 05 0a 5e 7f 05        	movaps	0x57f5e0a(%rip), %xmm0  # 0x1459072e0
1401114d6: 0f 11 85 78 03 00 00        	movups	%xmm0, 0x378(%rbp)
1401114dd: 0f 11 b5 88 03 00 00        	movups	%xmm6, 0x388(%rbp)
1401114e4: 0f 11 b5 98 03 00 00        	movups	%xmm6, 0x398(%rbp)
1401114eb: 0f 28 05 0e 5e 7f 05        	movaps	0x57f5e0e(%rip), %xmm0  # 0x145907300
1401114f2: 0f 11 85 a8 03 00 00        	movups	%xmm0, 0x3a8(%rbp)
1401114f9: 0f 11 85 b8 03 00 00        	movups	%xmm0, 0x3b8(%rbp)
140111500: 48 c7 85 e8 03 00 00 00 00 00 00    	movq	$0x0, 0x3e8(%rbp)
14011150b: c7 85 f0 03 00 00 00 00 80 3f       	movl	$0x3f800000, 0x3f0(%rbp) # imm = 0x3F800000
140111515: 0f 28 05 34 73 80 05        	movaps	0x5807334(%rip), %xmm0  # 0x145918850
14011151c: 0f 11 85 c8 03 00 00        	movups	%xmm0, 0x3c8(%rbp)
140111523: c7 85 d8 03 00 00 01 00 00 00       	movl	$0x1, 0x3d8(%rbp)
14011152d: 48 c7 85 dc 03 00 00 00 00 00 00    	movq	$0x0, 0x3dc(%rbp)
140111538: 48 b8 00 01 00 00 01 00 00 00       	movabsq	$0x100000100, %rax # imm = 0x100000100
140111542: 48 89 85 02 04 00 00        	movq	%rax, 0x402(%rbp)
140111549: 0f 10 05 c0 f1 82 05        	movups	0x582f1c0(%rip), %xmm0  # 0x145940710
140111550: 0f 29 85 90 02 00 00        	movaps	%xmm0, 0x290(%rbp)
140111557: 48 c7 85 a0 02 00 00 00 00 00 00    	movq	$0x0, 0x2a0(%rbp)
140111562: 45 0f 11 5c 24 a8           	movups	%xmm11, -0x58(%r12)
140111568: 49 c7 44 24 b8 00 00 00 00  	movq	$0x0, -0x48(%r12)
140111571: 45 0f 11 64 24 c0           	movups	%xmm12, -0x40(%r12)
140111577: 49 c7 44 24 d0 00 00 00 00  	movq	$0x0, -0x30(%r12)
140111580: 45 0f 11 6c 24 d8           	movups	%xmm13, -0x28(%r12)
140111586: 49 c7 44 24 e8 00 00 00 00  	movq	$0x0, -0x18(%r12)
14011158f: 41 c7 84 24 f6 00 00 00 00 00 01 00 	movl	$0x10000, 0xf6(%r12) # imm = 0x10000
14011159b: 66 41 c7 84 24 fa 00 00 00 00 00    	movw	$0x0, 0xfa(%r12)
1401115a6: 66 41 c7 84 24 00 01 00 00 00 00    	movw	$0x0, 0x100(%r12)
1401115b1: 41 c7 84 24 fc 00 00 00 00 00 01 00 	movl	$0x10000, 0xfc(%r12) # imm = 0x10000
1401115bd: 48 8b 85 a8 07 00 00        	movq	0x7a8(%rbp), %rax
1401115c4: 80 38 00                    	cmpb	$0x0, (%rax)
1401115c7: 0f 84 a3 00 00 00           	je	0x140111670 <.text+0x110670>
1401115cd: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
1401115d4: ba 04 00 00 00              	movl	$0x4, %edx
1401115d9: 48 8d 0d 6f f6 82 05        	leaq	0x582f66f(%rip), %rcx   # 0x145940c4f
1401115e0: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
1401115e7: e8 f4 e5 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
1401115ec: 90                          	nop
1401115ed: 48 85 c0                    	testq	%rax, %rax
1401115f0: 75 07                       	jne	0x1401115f9 <.text+0x1105f9>
1401115f2: 48 8b 05 bf c1 8f 07        	movq	0x78fc1bf(%rip), %rax   # 0x147a0d7b8
1401115f9: 80 38 03                    	cmpb	$0x3, (%rax)
1401115fc: 0f 85 28 04 00 00           	jne	0x140111a2a <.text+0x110a2a>
140111602: 48 8b 48 18                 	movq	0x18(%rax), %rcx
140111606: 48 85 c9                    	testq	%rcx, %rcx
140111609: 0f 88 42 10 00 00           	js	0x140112651 <.text+0x111651>
14011160f: 48 89 8d 80 09 00 00        	movq	%rcx, 0x980(%rbp)
140111616: 0f 84 0e 04 00 00           	je	0x140111a2a <.text+0x110a2a>
14011161c: 48 8b 78 10                 	movq	0x10(%rax), %rdi
140111620: e8 db 0b ef ff              	callq	0x140002200 <.text+0x1200>
140111625: ba 01 00 00 00              	movl	$0x1, %edx
14011162a: 48 8b 8d 80 09 00 00        	movq	0x980(%rbp), %rcx
140111631: e8 8a 0b ef ff              	callq	0x1400021c0 <.text+0x11c0>
140111636: 48 89 85 68 09 00 00        	movq	%rax, 0x968(%rbp)
14011163d: 48 85 c0                    	testq	%rax, %rax
140111640: 0f 84 f9 10 00 00           	je	0x14011273f <.text+0x11173f>
140111646: 48 8b 8d 68 09 00 00        	movq	0x968(%rbp), %rcx
14011164d: 48 89 fa                    	movq	%rdi, %rdx
140111650: 4c 8b 85 80 09 00 00        	movq	0x980(%rbp), %r8
140111657: e8 91 1b 66 05              	callq	0x1457731ed <.text+0x57721ed>
14011165c: e9 e0 03 00 00              	jmp	0x140111a41 <.text+0x110a41>
140111661: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
140111670: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
140111677: ba 05 00 00 00              	movl	$0x5, %edx
14011167c: 48 8d 0d 4b 13 83 05        	leaq	0x583134b(%rip), %rcx   # 0x1459429ce
140111683: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
14011168a: e8 51 e5 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
14011168f: 90                          	nop
140111690: 48 85 c0                    	testq	%rax, %rax
140111693: 75 07                       	jne	0x14011169c <.text+0x11069c>
140111695: 48 8b 05 1c c1 8f 07        	movq	0x78fc11c(%rip), %rax   # 0x147a0d7b8
14011169c: 31 ff                       	xorl	%edi, %edi
14011169e: 80 38 02                    	cmpb	$0x2, (%rax)
1401116a1: 75 0d                       	jne	0x1401116b0 <.text+0x1106b0>
1401116a3: 48 83 78 08 00              	cmpq	$0x0, 0x8(%rax)
1401116a8: 75 06                       	jne	0x1401116b0 <.text+0x1106b0>
1401116aa: 8b 78 10                    	movl	0x10(%rax), %edi
1401116ad: 0f 1f 00                    	nopl	(%rax)
1401116b0: 48 8b 85 b0 07 00 00        	movq	0x7b0(%rbp), %rax
1401116b7: 48 8b 58 50                 	movq	0x50(%rax), %rbx
1401116bb: 48 69 40 58 b0 00 00 00     	imulq	$0xb0, 0x58(%rax), %rax
1401116c3: 31 c9                       	xorl	%ecx, %ecx
1401116c5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1401116d0: 48 39 c8                    	cmpq	%rcx, %rax
1401116d3: 0f 84 b6 02 00 00           	je	0x14011198f <.text+0x11098f>
1401116d9: 4c 8d b9 b0 00 00 00        	leaq	0xb0(%rcx), %r15
1401116e0: 39 bc 0b a8 00 00 00        	cmpl	%edi, 0xa8(%rbx,%rcx)
1401116e7: 4c 89 f9                    	movq	%r15, %rcx
1401116ea: 75 e4                       	jne	0x1401116d0 <.text+0x1106d0>
1401116ec: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
1401116f0: 48 81 c2 50 ff ff ff        	addq	$-0xb0, %rdx
1401116f7: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
1401116fe: 48 8d 8d f8 07 00 00        	leaq	0x7f8(%rbp), %rcx
140111705: e8 46 71 61 05              	callq	0x145728850 <.text+0x5727850>
14011170a: 90                          	nop
14011170b: 48 c7 c6 ff ff ff ff        	movq	$-0x1, %rsi
140111712: 4a 83 7c 3b 98 ff           	cmpq	$-0x1, -0x68(%rbx,%r15)
140111718: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
14011171f: 74 2c                       	je	0x14011174d <.text+0x11074d>
140111721: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
140111725: 48 83 c2 98                 	addq	$-0x68, %rdx
140111729: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14011172d: e8 1e 71 61 05              	callq	0x145728850 <.text+0x5727850>
140111732: 90                          	nop
140111733: 48 8b 4d d0                 	movq	-0x30(%rbp), %rcx
140111737: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14011173b: 48 89 85 80 08 00 00        	movq	%rax, 0x880(%rbp)
140111742: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140111746: 48 89 85 c0 07 00 00        	movq	%rax, 0x7c0(%rbp)
14011174d: 48 89 8d 78 09 00 00        	movq	%rcx, 0x978(%rbp)
140111754: 4a 83 7c 3b b0 ff           	cmpq	$-0x1, -0x50(%rbx,%r15)
14011175a: 74 2c                       	je	0x140111788 <.text+0x110788>
14011175c: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
140111760: 48 83 c2 b0                 	addq	$-0x50, %rdx
140111764: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
140111768: e8 e3 70 61 05              	callq	0x145728850 <.text+0x5727850>
14011176d: 90                          	nop
14011176e: 48 8b 75 d0                 	movq	-0x30(%rbp), %rsi
140111772: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
140111776: 48 89 85 88 08 00 00        	movq	%rax, 0x888(%rbp)
14011177d: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140111781: 48 89 85 c8 07 00 00        	movq	%rax, 0x7c8(%rbp)
140111788: 48 89 b5 88 09 00 00        	movq	%rsi, 0x988(%rbp)
14011178f: 48 c7 c6 ff ff ff ff        	movq	$-0x1, %rsi
140111796: 4a 83 7c 3b c8 ff           	cmpq	$-0x1, -0x38(%rbx,%r15)
14011179c: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
1401117a3: 74 2c                       	je	0x1401117d1 <.text+0x1107d1>
1401117a5: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
1401117a9: 48 83 c2 c8                 	addq	$-0x38, %rdx
1401117ad: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1401117b1: e8 9a 70 61 05              	callq	0x145728850 <.text+0x5727850>
1401117b6: 90                          	nop
1401117b7: 48 8b 4d d0                 	movq	-0x30(%rbp), %rcx
1401117bb: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1401117bf: 48 89 85 90 08 00 00        	movq	%rax, 0x890(%rbp)
1401117c6: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1401117ca: 48 89 85 d0 07 00 00        	movq	%rax, 0x7d0(%rbp)
1401117d1: 48 89 8d 50 09 00 00        	movq	%rcx, 0x950(%rbp)
1401117d8: 4a 83 7c 3b e0 ff           	cmpq	$-0x1, -0x20(%rbx,%r15)
1401117de: 74 2c                       	je	0x14011180c <.text+0x11080c>
1401117e0: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
1401117e4: 48 83 c2 e0                 	addq	$-0x20, %rdx
1401117e8: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
1401117ec: e8 5f 70 61 05              	callq	0x145728850 <.text+0x5727850>
1401117f1: 90                          	nop
1401117f2: 48 8b 75 d0                 	movq	-0x30(%rbp), %rsi
1401117f6: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1401117fa: 48 89 85 98 08 00 00        	movq	%rax, 0x898(%rbp)
140111801: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140111805: 48 89 85 d8 07 00 00        	movq	%rax, 0x7d8(%rbp)
14011180c: 48 89 b5 80 09 00 00        	movq	%rsi, 0x980(%rbp)
140111813: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
140111817: 48 81 c2 68 ff ff ff        	addq	$-0x98, %rdx
14011181e: 48 8d 8d a0 08 00 00        	leaq	0x8a0(%rbp), %rcx
140111825: e8 26 70 61 05              	callq	0x145728850 <.text+0x5727850>
14011182a: 90                          	nop
14011182b: 4a 8d 14 3b                 	leaq	(%rbx,%r15), %rdx
14011182f: 48 83 c2 80                 	addq	$-0x80, %rdx
140111833: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
140111837: e8 14 70 61 05              	callq	0x145728850 <.text+0x5727850>
14011183c: 90                          	nop
14011183d: 48 8b 85 08 08 00 00        	movq	0x808(%rbp), %rax
140111844: 48 89 85 a0 05 00 00        	movq	%rax, 0x5a0(%rbp)
14011184b: 0f 10 85 f8 07 00 00        	movups	0x7f8(%rbp), %xmm0
140111852: 0f 29 85 90 05 00 00        	movaps	%xmm0, 0x590(%rbp)
140111859: 48 8b 85 b0 08 00 00        	movq	0x8b0(%rbp), %rax
140111860: 49 89 46 20                 	movq	%rax, 0x20(%r14)
140111864: 0f 10 85 a0 08 00 00        	movups	0x8a0(%rbp), %xmm0
14011186b: 41 0f 11 46 10              	movups	%xmm0, 0x10(%r14)
140111870: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140111874: 49 89 46 38                 	movq	%rax, 0x38(%r14)
140111878: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
14011187c: 41 0f 11 46 28              	movups	%xmm0, 0x28(%r14)
140111881: 48 8b 85 a0 05 00 00        	movq	0x5a0(%rbp), %rax
140111888: 48 89 85 20 04 00 00        	movq	%rax, 0x420(%rbp)
14011188f: 48 8b 85 a8 05 00 00        	movq	0x5a8(%rbp), %rax
140111896: 48 89 85 28 04 00 00        	movq	%rax, 0x428(%rbp)
14011189d: 48 8b 85 d0 05 00 00        	movq	0x5d0(%rbp), %rax
1401118a4: 48 89 85 50 04 00 00        	movq	%rax, 0x450(%rbp)
1401118ab: 0f 28 85 90 05 00 00        	movaps	0x590(%rbp), %xmm0
1401118b2: 0f 28 8d b0 05 00 00        	movaps	0x5b0(%rbp), %xmm1
1401118b9: 0f 28 95 c0 05 00 00        	movaps	0x5c0(%rbp), %xmm2
1401118c0: 0f 29 85 10 04 00 00        	movaps	%xmm0, 0x410(%rbp)
1401118c7: 0f 29 8d 30 04 00 00        	movaps	%xmm1, 0x430(%rbp)
1401118ce: 0f 29 95 40 04 00 00        	movaps	%xmm2, 0x440(%rbp)
1401118d5: 48 8b 85 78 09 00 00        	movq	0x978(%rbp), %rax
1401118dc: 48 89 85 58 04 00 00        	movq	%rax, 0x458(%rbp)
1401118e3: 48 8b 85 80 08 00 00        	movq	0x880(%rbp), %rax
1401118ea: 48 89 85 60 04 00 00        	movq	%rax, 0x460(%rbp)
1401118f1: 48 8b 85 c0 07 00 00        	movq	0x7c0(%rbp), %rax
1401118f8: 48 89 85 68 04 00 00        	movq	%rax, 0x468(%rbp)
1401118ff: 48 8b 85 88 09 00 00        	movq	0x988(%rbp), %rax
140111906: 48 89 85 70 04 00 00        	movq	%rax, 0x470(%rbp)
14011190d: 48 8b 85 88 08 00 00        	movq	0x888(%rbp), %rax
140111914: 48 89 85 78 04 00 00        	movq	%rax, 0x478(%rbp)
14011191b: 48 8b 85 c8 07 00 00        	movq	0x7c8(%rbp), %rax
140111922: 48 89 85 80 04 00 00        	movq	%rax, 0x480(%rbp)
140111929: 48 8b 85 50 09 00 00        	movq	0x950(%rbp), %rax
140111930: 48 89 85 88 04 00 00        	movq	%rax, 0x488(%rbp)
140111937: 48 8b 85 90 08 00 00        	movq	0x890(%rbp), %rax
14011193e: 48 89 85 90 04 00 00        	movq	%rax, 0x490(%rbp)
140111945: 48 8b 85 d0 07 00 00        	movq	0x7d0(%rbp), %rax
14011194c: 48 89 85 98 04 00 00        	movq	%rax, 0x498(%rbp)
140111953: 48 8b 85 80 09 00 00        	movq	0x980(%rbp), %rax
14011195a: 48 89 85 a0 04 00 00        	movq	%rax, 0x4a0(%rbp)
140111961: 48 8b 85 98 08 00 00        	movq	0x898(%rbp), %rax
140111968: 48 89 85 a8 04 00 00        	movq	%rax, 0x4a8(%rbp)
14011196f: 48 8b 85 d8 07 00 00        	movq	0x7d8(%rbp), %rax
140111976: 48 89 85 b0 04 00 00        	movq	%rax, 0x4b0(%rbp)
14011197d: 89 bd b8 04 00 00           	movl	%edi, 0x4b8(%rbp)
140111983: 4c 8b bd 38 09 00 00        	movq	0x938(%rbp), %r15
14011198a: e9 92 02 00 00              	jmp	0x140111c21 <.text+0x110c21>
14011198f: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
140111996: ba 04 00 00 00              	movl	$0x4, %edx
14011199b: 48 8d 0d ad f2 82 05        	leaq	0x582f2ad(%rip), %rcx   # 0x145940c4f
1401119a2: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
1401119a9: e8 32 e2 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
1401119ae: 90                          	nop
1401119af: 48 85 c0                    	testq	%rax, %rax
1401119b2: 75 07                       	jne	0x1401119bb <.text+0x1109bb>
1401119b4: 48 8b 05 fd bd 8f 07        	movq	0x78fbdfd(%rip), %rax   # 0x147a0d7b8
1401119bb: 80 38 03                    	cmpb	$0x3, (%rax)
1401119be: 4c 8b bd 38 09 00 00        	movq	0x938(%rbp), %r15
1401119c5: 0f 85 fb 00 00 00           	jne	0x140111ac6 <.text+0x110ac6>
1401119cb: 48 8b 48 18                 	movq	0x18(%rax), %rcx
1401119cf: 48 85 c9                    	testq	%rcx, %rcx
1401119d2: 0f 88 91 0c 00 00           	js	0x140112669 <.text+0x111669>
1401119d8: 48 89 8d 88 09 00 00        	movq	%rcx, 0x988(%rbp)
1401119df: 0f 84 e1 00 00 00           	je	0x140111ac6 <.text+0x110ac6>
1401119e5: 48 8b 78 10                 	movq	0x10(%rax), %rdi
1401119e9: e8 12 08 ef ff              	callq	0x140002200 <.text+0x1200>
1401119ee: ba 01 00 00 00              	movl	$0x1, %edx
1401119f3: 48 8b 8d 88 09 00 00        	movq	0x988(%rbp), %rcx
1401119fa: e8 c1 07 ef ff              	callq	0x1400021c0 <.text+0x11c0>
1401119ff: 48 89 85 60 09 00 00        	movq	%rax, 0x960(%rbp)
140111a06: 48 85 c0                    	testq	%rax, %rax
140111a09: 0f 84 59 0d 00 00           	je	0x140112768 <.text+0x111768>
140111a0f: 48 8b 8d 60 09 00 00        	movq	0x960(%rbp), %rcx
140111a16: 48 89 fa                    	movq	%rdi, %rdx
140111a19: 4c 8b 85 88 09 00 00        	movq	0x988(%rbp), %r8
140111a20: e8 c8 17 66 05              	callq	0x1457731ed <.text+0x57721ed>
140111a25: e9 b3 00 00 00              	jmp	0x140111add <.text+0x110add>
140111a2a: b8 01 00 00 00              	movl	$0x1, %eax
140111a2f: 48 89 85 68 09 00 00        	movq	%rax, 0x968(%rbp)
140111a36: 48 c7 85 80 09 00 00 00 00 00 00    	movq	$0x0, 0x980(%rbp)
140111a41: ba 04 00 00 00              	movl	$0x4, %edx
140111a46: 48 8d 0d 86 0f 83 05        	leaq	0x5830f86(%rip), %rcx   # 0x1459429d3
140111a4d: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
140111a54: e8 87 e1 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
140111a59: 90                          	nop
140111a5a: 48 85 c0                    	testq	%rax, %rax
140111a5d: 75 07                       	jne	0x140111a66 <.text+0x110a66>
140111a5f: 48 8b 05 52 bd 8f 07        	movq	0x78fbd52(%rip), %rax   # 0x147a0d7b8
140111a66: 80 38 03                    	cmpb	$0x3, (%rax)
140111a69: 48 8d 9d 10 04 00 00        	leaq	0x410(%rbp), %rbx
140111a70: 0f 85 d1 06 00 00           	jne	0x140112147 <.text+0x111147>
140111a76: 48 8b 70 18                 	movq	0x18(%rax), %rsi
140111a7a: 48 85 f6                    	testq	%rsi, %rsi
140111a7d: 0f 88 fe 0b 00 00           	js	0x140112681 <.text+0x111681>
140111a83: 0f 84 be 06 00 00           	je	0x140112147 <.text+0x111147>
140111a89: 48 8b 78 10                 	movq	0x10(%rax), %rdi
140111a8d: e8 6e 07 ef ff              	callq	0x140002200 <.text+0x1200>
140111a92: ba 01 00 00 00              	movl	$0x1, %edx
140111a97: 48 89 f1                    	movq	%rsi, %rcx
140111a9a: e8 21 07 ef ff              	callq	0x1400021c0 <.text+0x11c0>
140111a9f: 48 89 85 70 09 00 00        	movq	%rax, 0x970(%rbp)
140111aa6: 48 85 c0                    	testq	%rax, %rax
140111aa9: 0f 84 a8 0c 00 00           	je	0x140112757 <.text+0x111757>
140111aaf: 48 8b 8d 70 09 00 00        	movq	0x970(%rbp), %rcx
140111ab6: 48 89 fa                    	movq	%rdi, %rdx
140111ab9: 49 89 f0                    	movq	%rsi, %r8
140111abc: e8 2c 17 66 05              	callq	0x1457731ed <.text+0x57721ed>
140111ac1: e9 8f 06 00 00              	jmp	0x140112155 <.text+0x111155>
140111ac6: b8 01 00 00 00              	movl	$0x1, %eax
140111acb: 48 89 85 60 09 00 00        	movq	%rax, 0x960(%rbp)
140111ad2: 48 c7 85 88 09 00 00 00 00 00 00    	movq	$0x0, 0x988(%rbp)
140111add: ba 08 00 00 00              	movl	$0x8, %edx
140111ae2: 48 8d 0d 27 f6 82 05        	leaq	0x582f627(%rip), %rcx   # 0x145941110
140111ae9: e8 12 61 34 05              	callq	0x145457c00 <.text+0x5456c00>
140111aee: 90                          	nop
140111aef: 48 89 c3                    	movq	%rax, %rbx
140111af2: 48 89 d7                    	movq	%rdx, %rdi
140111af5: ba 04 00 00 00              	movl	$0x4, %edx
140111afa: 48 8d 0d 17 f6 82 05        	leaq	0x582f617(%rip), %rcx   # 0x145941118
140111b01: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
140111b08: e8 d3 e0 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
140111b0d: 90                          	nop
140111b0e: 48 85 c0                    	testq	%rax, %rax
140111b11: 75 07                       	jne	0x140111b1a <.text+0x110b1a>
140111b13: 48 8b 05 9e bc 8f 07        	movq	0x78fbc9e(%rip), %rax   # 0x147a0d7b8
140111b1a: b9 01 00 00 00              	movl	$0x1, %ecx
140111b1f: 80 38 02                    	cmpb	$0x2, (%rax)
140111b22: 75 0b                       	jne	0x140111b2f <.text+0x110b2f>
140111b24: 48 83 78 08 00              	cmpq	$0x0, 0x8(%rax)
140111b29: 75 04                       	jne	0x140111b2f <.text+0x110b2f>
140111b2b: 48 8b 48 10                 	movq	0x10(%rax), %rcx
140111b2f: 48 89 8d a0 08 00 00        	movq	%rcx, 0x8a0(%rbp)
140111b36: 48 8d 05 df f5 82 05        	leaq	0x582f5df(%rip), %rax   # 0x14594111c
140111b3d: 48 89 85 90 05 00 00        	movq	%rax, 0x590(%rbp)
140111b44: 48 c7 85 98 05 00 00 01 00 00 00    	movq	$0x1, 0x598(%rbp)
140111b4f: 48 8d 85 a0 08 00 00        	leaq	0x8a0(%rbp), %rax
140111b56: 48 89 85 a0 05 00 00        	movq	%rax, 0x5a0(%rbp)
140111b5d: 48 8d 05 44 eb 82 05        	leaq	0x582eb44(%rip), %rax   # 0x1459406a8
140111b64: 48 89 85 a8 05 00 00        	movq	%rax, 0x5a8(%rbp)
140111b6b: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
140111b74: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
140111b78: 48 89 da                    	movq	%rbx, %rdx
140111b7b: 49 89 f8                    	movq	%rdi, %r8
140111b7e: 4c 8d 8d 90 05 00 00        	leaq	0x590(%rbp), %r9
140111b85: e8 d6 64 34 05              	callq	0x145458060 <.text+0x5457060>
140111b8a: 90                          	nop
140111b8b: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140111b8f: 48 8d 8d 28 04 00 00        	leaq	0x428(%rbp), %rcx
140111b96: 48 89 41 40                 	movq	%rax, 0x40(%rcx)
140111b9a: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
140111b9e: 0f 11 41 30                 	movups	%xmm0, 0x30(%rcx)
140111ba2: c7 85 b8 04 00 00 00 00 00 00       	movl	$0x0, 0x4b8(%rbp)
140111bac: 48 8b 95 88 09 00 00        	movq	0x988(%rbp), %rdx
140111bb3: 48 89 95 10 04 00 00        	movq	%rdx, 0x410(%rbp)
140111bba: 48 8b 85 60 09 00 00        	movq	0x960(%rbp), %rax
140111bc1: 48 89 85 18 04 00 00        	movq	%rax, 0x418(%rbp)
140111bc8: 48 89 95 20 04 00 00        	movq	%rdx, 0x420(%rbp)
140111bcf: 48 c7 85 70 04 00 00 ff ff ff ff    	movq	$-0x1, 0x470(%rbp)
140111bda: 48 c7 85 88 04 00 00 ff ff ff ff    	movq	$-0x1, 0x488(%rbp)
140111be5: 48 c7 85 a0 04 00 00 ff ff ff ff    	movq	$-0x1, 0x4a0(%rbp)
140111bf0: 48 c7 85 28 04 00 00 00 00 00 00    	movq	$0x0, 0x428(%rbp)
140111bfb: 48 c7 85 30 04 00 00 01 00 00 00    	movq	$0x1, 0x430(%rbp)
140111c06: 44 0f 11 71 10              	movups	%xmm14, 0x10(%rcx)
140111c0b: 48 c7 85 48 04 00 00 01 00 00 00    	movq	$0x1, 0x448(%rbp)
140111c16: 48 c7 85 50 04 00 00 00 00 00 00    	movq	$0x0, 0x450(%rbp)
140111c21: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140111c28: 48 8b 8d 48 09 00 00        	movq	0x948(%rbp), %rcx
140111c2f: 48 89 8d f8 07 00 00        	movq	%rcx, 0x7f8(%rbp)
140111c36: 0f 10 85 38 02 00 00        	movups	0x238(%rbp), %xmm0
140111c3d: 0f 11 85 00 08 00 00        	movups	%xmm0, 0x800(%rbp)
140111c44: 4c 89 ad 10 08 00 00        	movq	%r13, 0x810(%rbp)
140111c4b: 48 8b 8d 58 08 00 00        	movq	0x858(%rbp), %rcx
140111c52: 48 89 8d 18 08 00 00        	movq	%rcx, 0x818(%rbp)
140111c59: 48 89 85 20 08 00 00        	movq	%rax, 0x820(%rbp)
140111c60: 0f b7 85 f4 03 00 00        	movzwl	0x3f4(%rbp), %eax
140111c67: 66 89 85 f4 06 00 00        	movw	%ax, 0x6f4(%rbp)
140111c6e: 0f b6 85 e4 03 00 00        	movzbl	0x3e4(%rbp), %eax
140111c75: 88 85 e4 06 00 00           	movb	%al, 0x6e4(%rbp)
140111c7b: 8b 85 f8 02 00 00           	movl	0x2f8(%rbp), %eax
140111c81: f3 0f 10 85 fc 02 00 00     	movss	0x2fc(%rbp), %xmm0
140111c89: 89 85 f8 05 00 00           	movl	%eax, 0x5f8(%rbp)
140111c8f: f3 0f 11 85 fc 05 00 00     	movss	%xmm0, 0x5fc(%rbp)
140111c97: 8b 85 00 03 00 00           	movl	0x300(%rbp), %eax
140111c9d: f3 0f 10 85 04 03 00 00     	movss	0x304(%rbp), %xmm0
140111ca5: 89 85 00 06 00 00           	movl	%eax, 0x600(%rbp)
140111cab: f3 0f 11 85 04 06 00 00     	movss	%xmm0, 0x604(%rbp)
140111cb3: 8b 85 08 03 00 00           	movl	0x308(%rbp), %eax
140111cb9: f3 0f 10 85 0c 03 00 00     	movss	0x30c(%rbp), %xmm0
140111cc1: 89 85 08 06 00 00           	movl	%eax, 0x608(%rbp)
140111cc7: f3 0f 11 85 0c 06 00 00     	movss	%xmm0, 0x60c(%rbp)
140111ccf: 8b 85 10 03 00 00           	movl	0x310(%rbp), %eax
140111cd5: f3 0f 10 85 14 03 00 00     	movss	0x314(%rbp), %xmm0
140111cdd: 89 85 10 06 00 00           	movl	%eax, 0x610(%rbp)
140111ce3: f3 0f 11 85 14 06 00 00     	movss	%xmm0, 0x614(%rbp)
140111ceb: 8b 85 18 03 00 00           	movl	0x318(%rbp), %eax
140111cf1: f3 0f 10 85 1c 03 00 00     	movss	0x31c(%rbp), %xmm0
140111cf9: 89 85 18 06 00 00           	movl	%eax, 0x618(%rbp)
140111cff: f3 0f 11 85 1c 06 00 00     	movss	%xmm0, 0x61c(%rbp)
140111d07: 8b 85 20 03 00 00           	movl	0x320(%rbp), %eax
140111d0d: f3 0f 10 85 24 03 00 00     	movss	0x324(%rbp), %xmm0
140111d15: 89 85 20 06 00 00           	movl	%eax, 0x620(%rbp)
140111d1b: f3 0f 11 85 24 06 00 00     	movss	%xmm0, 0x624(%rbp)
140111d23: 8b 85 28 03 00 00           	movl	0x328(%rbp), %eax
140111d29: f3 0f 10 85 2c 03 00 00     	movss	0x32c(%rbp), %xmm0
140111d31: 89 85 28 06 00 00           	movl	%eax, 0x628(%rbp)
140111d37: f3 0f 11 85 2c 06 00 00     	movss	%xmm0, 0x62c(%rbp)
140111d3f: 8b 85 30 03 00 00           	movl	0x330(%rbp), %eax
140111d45: f3 0f 10 85 34 03 00 00     	movss	0x334(%rbp), %xmm0
140111d4d: 89 85 30 06 00 00           	movl	%eax, 0x630(%rbp)
140111d53: f3 0f 11 85 34 06 00 00     	movss	%xmm0, 0x634(%rbp)
140111d5b: 8b 85 38 03 00 00           	movl	0x338(%rbp), %eax
140111d61: f3 0f 10 85 3c 03 00 00     	movss	0x33c(%rbp), %xmm0
140111d69: 89 85 38 06 00 00           	movl	%eax, 0x638(%rbp)
140111d6f: f3 0f 11 85 3c 06 00 00     	movss	%xmm0, 0x63c(%rbp)
140111d77: 8b 85 40 03 00 00           	movl	0x340(%rbp), %eax
140111d7d: f3 0f 10 85 44 03 00 00     	movss	0x344(%rbp), %xmm0
140111d85: 89 85 40 06 00 00           	movl	%eax, 0x640(%rbp)
140111d8b: f3 0f 11 85 44 06 00 00     	movss	%xmm0, 0x644(%rbp)
140111d93: 8b 85 f0 02 00 00           	movl	0x2f0(%rbp), %eax
140111d99: f3 0f 10 85 f4 02 00 00     	movss	0x2f4(%rbp), %xmm0
140111da1: 89 85 f0 05 00 00           	movl	%eax, 0x5f0(%rbp)
140111da7: f3 0f 11 85 f4 05 00 00     	movss	%xmm0, 0x5f4(%rbp)
140111daf: c6 85 0a 07 00 00 01        	movb	$0x1, 0x70a(%rbp)
140111db6: 0f b6 85 0b 04 00 00        	movzbl	0x40b(%rbp), %eax
140111dbd: 88 85 0b 07 00 00           	movb	%al, 0x70b(%rbp)
140111dc3: 0f b6 85 0c 04 00 00        	movzbl	0x40c(%rbp), %eax
140111dca: 88 85 0c 07 00 00           	movb	%al, 0x70c(%rbp)
140111dd0: 0f b6 85 0d 04 00 00        	movzbl	0x40d(%rbp), %eax
140111dd7: 88 85 0d 07 00 00           	movb	%al, 0x70d(%rbp)
140111ddd: 41 0f 10 44 24 48           	movups	0x48(%r12), %xmm0
140111de3: 41 0f 10 4c 24 58           	movups	0x58(%r12), %xmm1
140111de9: 41 0f 11 8e c0 00 00 00     	movups	%xmm1, 0xc0(%r14)
140111df1: 41 0f 11 86 b0 00 00 00     	movups	%xmm0, 0xb0(%r14)
140111df9: 41 0f 10 44 24 68           	movups	0x68(%r12), %xmm0
140111dff: 41 0f 10 4c 24 78           	movups	0x78(%r12), %xmm1
140111e05: 41 0f 11 8e e0 00 00 00     	movups	%xmm1, 0xe0(%r14)
140111e0d: 41 0f 11 86 d0 00 00 00     	movups	%xmm0, 0xd0(%r14)
140111e15: 41 0f 10 84 24 88 00 00 00  	movups	0x88(%r12), %xmm0
140111e1e: 41 0f 10 8c 24 98 00 00 00  	movups	0x98(%r12), %xmm1
140111e27: 41 0f 11 8e 00 01 00 00     	movups	%xmm1, 0x100(%r14)
140111e2f: 41 0f 11 86 f0 00 00 00     	movups	%xmm0, 0xf0(%r14)
140111e37: 41 0f 10 84 24 a8 00 00 00  	movups	0xa8(%r12), %xmm0
140111e40: 41 0f 10 8c 24 b8 00 00 00  	movups	0xb8(%r12), %xmm1
140111e49: 41 0f 11 8e 20 01 00 00     	movups	%xmm1, 0x120(%r14)
140111e51: 41 0f 11 86 10 01 00 00     	movups	%xmm0, 0x110(%r14)
140111e59: f2 0f 10 85 e8 03 00 00     	movsd	0x3e8(%rbp), %xmm0
140111e61: f2 0f 11 85 e8 06 00 00     	movsd	%xmm0, 0x6e8(%rbp)
140111e69: f3 0f 10 85 f0 03 00 00     	movss	0x3f0(%rbp), %xmm0
140111e71: f3 0f 11 85 f0 06 00 00     	movss	%xmm0, 0x6f0(%rbp)
140111e79: 8b 85 c8 03 00 00           	movl	0x3c8(%rbp), %eax
140111e7f: f3 0f 10 85 cc 03 00 00     	movss	0x3cc(%rbp), %xmm0
140111e87: 89 85 c8 06 00 00           	movl	%eax, 0x6c8(%rbp)
140111e8d: f3 0f 11 85 cc 06 00 00     	movss	%xmm0, 0x6cc(%rbp)
140111e95: 8b 85 d0 03 00 00           	movl	0x3d0(%rbp), %eax
140111e9b: f3 0f 10 85 d4 03 00 00     	movss	0x3d4(%rbp), %xmm0
140111ea3: 89 85 d0 06 00 00           	movl	%eax, 0x6d0(%rbp)
140111ea9: f3 0f 11 85 d4 06 00 00     	movss	%xmm0, 0x6d4(%rbp)
140111eb1: 8b 85 d8 03 00 00           	movl	0x3d8(%rbp), %eax
140111eb7: 89 85 d8 06 00 00           	movl	%eax, 0x6d8(%rbp)
140111ebd: f2 0f 10 85 dc 03 00 00     	movsd	0x3dc(%rbp), %xmm0
140111ec5: f2 0f 11 85 dc 06 00 00     	movsd	%xmm0, 0x6dc(%rbp)
140111ecd: 48 8b 85 02 04 00 00        	movq	0x402(%rbp), %rax
140111ed4: 48 89 85 02 07 00 00        	movq	%rax, 0x702(%rbp)
140111edb: 48 8b 85 a0 02 00 00        	movq	0x2a0(%rbp), %rax
140111ee2: 48 89 85 a0 05 00 00        	movq	%rax, 0x5a0(%rbp)
140111ee9: 0f 28 85 90 02 00 00        	movaps	0x290(%rbp), %xmm0
140111ef0: 0f 29 85 90 05 00 00        	movaps	%xmm0, 0x590(%rbp)
140111ef7: 49 8b 44 24 b8              	movq	-0x48(%r12), %rax
140111efc: 49 89 46 20                 	movq	%rax, 0x20(%r14)
140111f00: 41 0f 10 44 24 a8           	movups	-0x58(%r12), %xmm0
140111f06: 41 0f 11 46 10              	movups	%xmm0, 0x10(%r14)
140111f0b: 49 8b 44 24 d0              	movq	-0x30(%r12), %rax
140111f10: 49 89 46 38                 	movq	%rax, 0x38(%r14)
140111f14: 41 0f 10 44 24 c0           	movups	-0x40(%r12), %xmm0
140111f1a: 41 0f 11 46 28              	movups	%xmm0, 0x28(%r14)
140111f1f: 49 8b 44 24 e8              	movq	-0x18(%r12), %rax
140111f24: 49 89 46 50                 	movq	%rax, 0x50(%r14)
140111f28: 41 0f 10 44 24 d8           	movups	-0x28(%r12), %xmm0
140111f2e: 41 0f 11 46 40              	movups	%xmm0, 0x40(%r14)
140111f33: 41 0f b7 84 24 fa 00 00 00  	movzwl	0xfa(%r12), %eax
140111f3c: 66 41 89 86 62 01 00 00     	movw	%ax, 0x162(%r14)
140111f44: 41 8b 84 24 f6 00 00 00     	movl	0xf6(%r12), %eax
140111f4c: 41 89 86 5e 01 00 00        	movl	%eax, 0x15e(%r14)
140111f53: 41 0f b7 84 24 00 01 00 00  	movzwl	0x100(%r12), %eax
140111f5c: 66 41 89 86 68 01 00 00     	movw	%ax, 0x168(%r14)
140111f64: 41 8b 84 24 fc 00 00 00     	movl	0xfc(%r12), %eax
140111f6c: 41 89 86 64 01 00 00        	movl	%eax, 0x164(%r14)
140111f73: 8b 05 d7 ab 83 05           	movl	0x583abd7(%rip), %eax   # 0x14594cb50
140111f79: 89 85 f0 07 00 00           	movl	%eax, 0x7f0(%rbp)
140111f7f: 0f 10 05 ba ab 83 05        	movups	0x583abba(%rip), %xmm0  # 0x14594cb40
140111f86: 0f 29 85 e0 07 00 00        	movaps	%xmm0, 0x7e0(%rbp)
140111f8d: 48 8d b5 a0 08 00 00        	leaq	0x8a0(%rbp), %rsi
140111f94: 48 89 f1                    	movq	%rsi, %rcx
140111f97: 48 8d 95 e0 07 00 00        	leaq	0x7e0(%rbp), %rdx
140111f9e: e8 ed a2 b7 04              	callq	0x144c8c290 <.text+0x4c8b290>
140111fa3: 90                          	nop
140111fa4: 48 8d 7d d0                 	leaq	-0x30(%rbp), %rdi
140111fa8: 0f 28 85 a0 08 00 00        	movaps	0x8a0(%rbp), %xmm0
140111faf: 0f 11 85 64 02 00 00        	movups	%xmm0, 0x264(%rbp)
140111fb6: c7 85 60 02 00 00 01 00 00 00       	movl	$0x1, 0x260(%rbp)
140111fc0: c7 44 24 48 00 00 40 41     	movl	$0x41400000, 0x48(%rsp) # imm = 0x41400000
140111fc8: c7 44 24 40 01 00 00 00     	movl	$0x1, 0x40(%rsp)
140111fd0: c7 44 24 38 00 00 00 00     	movl	$0x0, 0x38(%rsp)
140111fd8: c7 44 24 30 01 00 00 00     	movl	$0x1, 0x30(%rsp)
140111fe0: c7 44 24 28 00 00 40 40     	movl	$0x40400000, 0x28(%rsp) # imm = 0x40400000
140111fe8: c7 44 24 20 01 00 00 00     	movl	$0x1, 0x20(%rsp)
140111ff0: 0f 57 db                    	xorps	%xmm3, %xmm3
140111ff3: 48 89 f1                    	movq	%rsi, %rcx
140111ff6: 48 8d 95 60 02 00 00        	leaq	0x260(%rbp), %rdx
140111ffd: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140112003: e8 98 d6 54 02              	callq	0x14265f6a0 <.text+0x265e6a0>
140112008: 90                          	nop
140112009: c7 85 b8 08 00 00 00 00 00 00       	movl	$0x0, 0x8b8(%rbp)
140112013: 0f 28 05 86 dc 82 05        	movaps	0x582dc86(%rip), %xmm0  # 0x14593fca0
14011201a: 0f 11 85 bc 08 00 00        	movups	%xmm0, 0x8bc(%rbp)
140112021: c7 85 cc 08 00 00 00 00 00 00       	movl	$0x0, 0x8cc(%rbp)
14011202b: 0f 11 85 d0 08 00 00        	movups	%xmm0, 0x8d0(%rbp)
140112032: c7 85 e0 08 00 00 00 00 00 00       	movl	$0x0, 0x8e0(%rbp)
14011203c: 0f 11 85 e4 08 00 00        	movups	%xmm0, 0x8e4(%rbp)
140112043: c7 85 f4 08 00 00 00 00 00 00       	movl	$0x0, 0x8f4(%rbp)
14011204d: 0f 11 85 f8 08 00 00        	movups	%xmm0, 0x8f8(%rbp)
140112054: c7 85 08 09 00 00 00 00 00 00       	movl	$0x0, 0x908(%rbp)
14011205e: 0f 28 05 4b dc 82 05        	movaps	0x582dc4b(%rip), %xmm0  # 0x14593fcb0
140112065: 0f 11 85 0c 09 00 00        	movups	%xmm0, 0x90c(%rbp)
14011206c: c7 85 1c 09 00 00 a2 17 00 00       	movl	$0x17a2, 0x91c(%rbp) # imm = 0x17A2
140112076: 66 c7 85 20 09 00 00 01 00  	movw	$0x1, 0x920(%rbp)
14011207f: c6 85 22 09 00 00 00        	movb	$0x0, 0x922(%rbp)
140112086: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
14011208c: 48 89 f9                    	movq	%rdi, %rcx
14011208f: 48 8d 9d 90 05 00 00        	leaq	0x590(%rbp), %rbx
140112096: 48 89 da                    	movq	%rbx, %rdx
140112099: e8 4f 11 66 05              	callq	0x1457731ed <.text+0x57721ed>
14011209e: 41 b8 88 00 00 00           	movl	$0x88, %r8d
1401120a4: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
1401120ab: 48 89 f2                    	movq	%rsi, %rdx
1401120ae: e8 3a 11 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401120b3: 41 b8 08 02 00 00           	movl	$0x208, %r8d            # imm = 0x208
1401120b9: 48 8d 8d 98 05 00 00        	leaq	0x598(%rbp), %rcx
1401120c0: 48 89 fa                    	movq	%rdi, %rdx
1401120c3: e8 25 11 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401120c8: 48 8b 85 48 09 00 00        	movq	0x948(%rbp), %rax
1401120cf: 48 89 85 90 05 00 00        	movq	%rax, 0x590(%rbp)
1401120d6: 48 89 f1                    	movq	%rsi, %rcx
1401120d9: 48 8d 95 00 08 00 00        	leaq	0x800(%rbp), %rdx
1401120e0: 49 89 d8                    	movq	%rbx, %r8
1401120e3: e8 98 de fc ff              	callq	0x1400dff80 <.text+0xdef80>
1401120e8: 90                          	nop
1401120e9: 48 8d b5 e8 01 00 00        	leaq	0x1e8(%rbp), %rsi
1401120f0: 4c 8d ad 10 04 00 00        	leaq	0x410(%rbp), %r13
1401120f7: 48 8b 85 a0 08 00 00        	movq	0x8a0(%rbp), %rax
1401120fe: 48 8b 8d c8 08 00 00        	movq	0x8c8(%rbp), %rcx
140112105: 48 89 85 90 05 00 00        	movq	%rax, 0x590(%rbp)
14011210c: 0f 10 85 a8 08 00 00        	movups	0x8a8(%rbp), %xmm0
140112113: 0f 11 85 98 05 00 00        	movups	%xmm0, 0x598(%rbp)
14011211a: 0f 10 85 b8 08 00 00        	movups	0x8b8(%rbp), %xmm0
140112121: 0f 11 85 a8 05 00 00        	movups	%xmm0, 0x5a8(%rbp)
140112128: 48 89 8d b8 05 00 00        	movq	%rcx, 0x5b8(%rbp)
14011212f: 48 89 d9                    	movq	%rbx, %rcx
140112132: 48 8b 95 70 08 00 00        	movq	0x870(%rbp), %rdx
140112139: 4d 89 e8                    	movq	%r13, %r8
14011213c: e8 cf 10 0e 00              	callq	0x1401f3210 <.text+0x1f2210>
140112141: 90                          	nop
140112142: e9 a9 ee ff ff              	jmp	0x140110ff0 <.text+0x10fff0>
140112147: b8 01 00 00 00              	movl	$0x1, %eax
14011214c: 48 89 85 70 09 00 00        	movq	%rax, 0x970(%rbp)
140112153: 31 f6                       	xorl	%esi, %esi
140112155: 48 89 b5 40 09 00 00        	movq	%rsi, 0x940(%rbp)
14011215c: 48 83 bd 88 09 00 00 00     	cmpq	$0x0, 0x988(%rbp)
140112164: 4c 8b bd 38 09 00 00        	movq	0x938(%rbp), %r15
14011216b: 0f 88 21 05 00 00           	js	0x140112692 <.text+0x111692>
140112171: 74 3d                       	je	0x1401121b0 <.text+0x1111b0>
140112173: e8 88 00 ef ff              	callq	0x140002200 <.text+0x1200>
140112178: ba 01 00 00 00              	movl	$0x1, %edx
14011217d: 48 8b b5 88 09 00 00        	movq	0x988(%rbp), %rsi
140112184: 48 89 f1                    	movq	%rsi, %rcx
140112187: e8 34 00 ef ff              	callq	0x1400021c0 <.text+0x11c0>
14011218c: 48 85 c0                    	testq	%rax, %rax
14011218f: 0f 84 99 05 00 00           	je	0x14011272e <.text+0x11172e>
140112195: 48 89 85 58 09 00 00        	movq	%rax, 0x958(%rbp)
14011219c: 48 89 c1                    	movq	%rax, %rcx
14011219f: 48 8b 95 50 09 00 00        	movq	0x950(%rbp), %rdx
1401121a6: 49 89 f0                    	movq	%rsi, %r8
1401121a9: e8 3f 10 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401121ae: eb 0c                       	jmp	0x1401121bc <.text+0x1111bc>
1401121b0: b8 01 00 00 00              	movl	$0x1, %eax
1401121b5: 48 89 85 58 09 00 00        	movq	%rax, 0x958(%rbp)
1401121bc: ba 06 00 00 00              	movl	$0x6, %edx
1401121c1: 48 8d 0d 88 ef 82 05        	leaq	0x582ef88(%rip), %rcx   # 0x145941150
1401121c8: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
1401121cf: e8 0c da 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
1401121d4: 90                          	nop
1401121d5: 48 85 c0                    	testq	%rax, %rax
1401121d8: 75 07                       	jne	0x1401121e1 <.text+0x1111e1>
1401121da: 48 8b 05 d7 b5 8f 07        	movq	0x78fb5d7(%rip), %rax   # 0x147a0d7b8
1401121e1: 80 38 02                    	cmpb	$0x2, (%rax)
1401121e4: 75 0b                       	jne	0x1401121f1 <.text+0x1111f1>
1401121e6: 48 83 78 08 00              	cmpq	$0x0, 0x8(%rax)
1401121eb: 0f 84 fe 03 00 00           	je	0x1401125ef <.text+0x1115ef>
1401121f1: 31 ff                       	xorl	%edi, %edi
1401121f3: ba 04 00 00 00              	movl	$0x4, %edx
1401121f8: 48 8d 0d 19 ef 82 05        	leaq	0x582ef19(%rip), %rcx   # 0x145941118
1401121ff: 4c 8b 85 78 09 00 00        	movq	0x978(%rbp), %r8
140112206: e8 d5 d9 9e 02              	callq	0x142affbe0 <.text+0x2afebe0>
14011220b: 90                          	nop
14011220c: 48 85 c0                    	testq	%rax, %rax
14011220f: 75 07                       	jne	0x140112218 <.text+0x111218>
140112211: 48 8b 05 a0 b5 8f 07        	movq	0x78fb5a0(%rip), %rax   # 0x147a0d7b8
140112218: b9 01 00 00 00              	movl	$0x1, %ecx
14011221d: 80 38 02                    	cmpb	$0x2, (%rax)
140112220: 4c 8b a5 80 09 00 00        	movq	0x980(%rbp), %r12
140112227: 75 0b                       	jne	0x140112234 <.text+0x111234>
140112229: 48 83 78 08 00              	cmpq	$0x0, 0x8(%rax)
14011222e: 75 04                       	jne	0x140112234 <.text+0x111234>
140112230: 48 8b 48 10                 	movq	0x10(%rax), %rcx
140112234: 4c 89 a5 f8 07 00 00        	movq	%r12, 0x7f8(%rbp)
14011223b: 48 8b 85 68 09 00 00        	movq	0x968(%rbp), %rax
140112242: 48 89 85 00 08 00 00        	movq	%rax, 0x800(%rbp)
140112249: 4c 89 a5 08 08 00 00        	movq	%r12, 0x808(%rbp)
140112250: 48 8b 95 40 09 00 00        	movq	0x940(%rbp), %rdx
140112257: 48 89 95 10 08 00 00        	movq	%rdx, 0x810(%rbp)
14011225e: 48 8b 85 70 09 00 00        	movq	0x970(%rbp), %rax
140112265: 48 89 85 18 08 00 00        	movq	%rax, 0x818(%rbp)
14011226c: 48 89 95 20 08 00 00        	movq	%rdx, 0x820(%rbp)
140112273: 48 8b 95 88 09 00 00        	movq	0x988(%rbp), %rdx
14011227a: 48 89 95 28 08 00 00        	movq	%rdx, 0x828(%rbp)
140112281: 48 8b 85 58 09 00 00        	movq	0x958(%rbp), %rax
140112288: 48 89 85 30 08 00 00        	movq	%rax, 0x830(%rbp)
14011228f: 48 89 95 38 08 00 00        	movq	%rdx, 0x838(%rbp)
140112296: 48 89 bd 40 08 00 00        	movq	%rdi, 0x840(%rbp)
14011229d: 48 89 8d 48 08 00 00        	movq	%rcx, 0x848(%rbp)
1401122a4: 48 8d 47 ff                 	leaq	-0x1(%rdi), %rax
1401122a8: f3 44 0f 10 15 7f d6 82 05  	movss	0x582d67f(%rip), %xmm10 # 0x14593f930
1401122b1: 45 0f 28 ca                 	movaps	%xmm10, %xmm9
1401122b5: 45 0f 28 c2                 	movaps	%xmm10, %xmm8
1401122b9: 48 83 f8 04                 	cmpq	$0x4, %rax
1401122bd: 73 2a                       	jae	0x1401122e9 <.text+0x1112e9>
1401122bf: 48 8d 05 92 2a 83 05        	leaq	0x5832a92(%rip), %rax   # 0x145944d58
1401122c6: f3 44 0f 10 4c b8 fc        	movss	-0x4(%rax,%rdi,4), %xmm9
1401122cd: 48 8d 05 94 2a 83 05        	leaq	0x5832a94(%rip), %rax   # 0x145944d68
1401122d4: f3 44 0f 10 44 b8 fc        	movss	-0x4(%rax,%rdi,4), %xmm8
1401122db: 48 8d 05 96 2a 83 05        	leaq	0x5832a96(%rip), %rax   # 0x145944d78
1401122e2: f3 44 0f 10 54 b8 fc        	movss	-0x4(%rax,%rdi,4), %xmm10
1401122e9: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
1401122ef: 48 89 d9                    	movq	%rbx, %rcx
1401122f2: 48 8d bd 90 02 00 00        	leaq	0x290(%rbp), %rdi
1401122f9: 48 89 fa                    	movq	%rdi, %rdx
1401122fc: e8 ec 0e 66 05              	callq	0x1457731ed <.text+0x57721ed>
140112301: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140112308: 48 8b 8d 48 09 00 00        	movq	0x948(%rbp), %rcx
14011230f: 48 89 8d 60 02 00 00        	movq	%rcx, 0x260(%rbp)
140112316: 0f 10 85 38 02 00 00        	movups	0x238(%rbp), %xmm0
14011231d: 0f 11 85 68 02 00 00        	movups	%xmm0, 0x268(%rbp)
140112324: 4c 89 ad 78 02 00 00        	movq	%r13, 0x278(%rbp)
14011232b: 48 8b 8d 58 08 00 00        	movq	0x858(%rbp), %rcx
140112332: 48 89 8d 80 02 00 00        	movq	%rcx, 0x280(%rbp)
140112339: 48 89 85 88 02 00 00        	movq	%rax, 0x288(%rbp)
140112340: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
140112346: 48 8d b5 90 05 00 00        	leaq	0x590(%rbp), %rsi
14011234d: 48 89 f1                    	movq	%rsi, %rcx
140112350: 48 89 fa                    	movq	%rdi, %rdx
140112353: e8 95 0e 66 05              	callq	0x1457731ed <.text+0x57721ed>
140112358: 8b 05 f2 a7 83 05           	movl	0x583a7f2(%rip), %eax   # 0x14594cb50
14011235e: 89 85 20 02 00 00           	movl	%eax, 0x220(%rbp)
140112364: 0f 10 05 d5 a7 83 05        	movups	0x583a7d5(%rip), %xmm0  # 0x14594cb40
14011236b: 0f 29 85 10 02 00 00        	movaps	%xmm0, 0x210(%rbp)
140112372: 4c 8d ad a0 08 00 00        	leaq	0x8a0(%rbp), %r13
140112379: 4c 89 e9                    	movq	%r13, %rcx
14011237c: 48 8d 95 10 02 00 00        	leaq	0x210(%rbp), %rdx
140112383: e8 08 9f b7 04              	callq	0x144c8c290 <.text+0x4c8b290>
140112388: 90                          	nop
140112389: 0f 28 85 a0 08 00 00        	movaps	0x8a0(%rbp), %xmm0
140112390: 0f 11 85 e4 07 00 00        	movups	%xmm0, 0x7e4(%rbp)
140112397: c7 85 e0 07 00 00 01 00 00 00       	movl	$0x1, 0x7e0(%rbp)
1401123a1: c7 44 24 48 00 00 40 41     	movl	$0x41400000, 0x48(%rsp) # imm = 0x41400000
1401123a9: c7 44 24 40 01 00 00 00     	movl	$0x1, 0x40(%rsp)
1401123b1: c7 44 24 38 00 00 00 00     	movl	$0x0, 0x38(%rsp)
1401123b9: c7 44 24 30 01 00 00 00     	movl	$0x1, 0x30(%rsp)
1401123c1: c7 44 24 28 00 00 40 40     	movl	$0x40400000, 0x28(%rsp) # imm = 0x40400000
1401123c9: c7 44 24 20 01 00 00 00     	movl	$0x1, 0x20(%rsp)
1401123d1: 0f 57 db                    	xorps	%xmm3, %xmm3
1401123d4: 4c 89 e9                    	movq	%r13, %rcx
1401123d7: 48 8d 95 e0 07 00 00        	leaq	0x7e0(%rbp), %rdx
1401123de: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401123e4: e8 b7 d2 54 02              	callq	0x14265f6a0 <.text+0x265e6a0>
1401123e9: 90                          	nop
1401123ea: c7 85 b8 08 00 00 00 00 00 00       	movl	$0x0, 0x8b8(%rbp)
1401123f4: f3 44 0f 11 8d bc 08 00 00  	movss	%xmm9, 0x8bc(%rbp)
1401123fd: f3 44 0f 11 85 c0 08 00 00  	movss	%xmm8, 0x8c0(%rbp)
140112406: f3 44 0f 11 95 c4 08 00 00  	movss	%xmm10, 0x8c4(%rbp)
14011240f: 48 c7 85 c8 08 00 00 cd cc 4c 3f    	movq	$0x3f4ccccd, 0x8c8(%rbp) # imm = 0x3F4CCCCD
14011241a: f3 44 0f 11 8d d0 08 00 00  	movss	%xmm9, 0x8d0(%rbp)
140112423: f3 44 0f 11 85 d4 08 00 00  	movss	%xmm8, 0x8d4(%rbp)
14011242c: f3 44 0f 11 95 d8 08 00 00  	movss	%xmm10, 0x8d8(%rbp)
140112435: 48 c7 85 dc 08 00 00 cd cc 4c 3f    	movq	$0x3f4ccccd, 0x8dc(%rbp) # imm = 0x3F4CCCCD
140112440: f3 44 0f 11 8d e4 08 00 00  	movss	%xmm9, 0x8e4(%rbp)
140112449: f3 44 0f 11 85 e8 08 00 00  	movss	%xmm8, 0x8e8(%rbp)
140112452: f3 44 0f 11 95 ec 08 00 00  	movss	%xmm10, 0x8ec(%rbp)
14011245b: 48 c7 85 f0 08 00 00 cd cc 4c 3f    	movq	$0x3f4ccccd, 0x8f0(%rbp) # imm = 0x3F4CCCCD
140112466: f3 44 0f 11 8d f8 08 00 00  	movss	%xmm9, 0x8f8(%rbp)
14011246f: f3 44 0f 11 85 fc 08 00 00  	movss	%xmm8, 0x8fc(%rbp)
140112478: f3 44 0f 11 95 00 09 00 00  	movss	%xmm10, 0x900(%rbp)
140112481: 48 c7 85 04 09 00 00 cd cc 4c 3f    	movq	$0x3f4ccccd, 0x904(%rbp) # imm = 0x3F4CCCCD
14011248c: 0f 28 05 1d d8 82 05        	movaps	0x582d81d(%rip), %xmm0  # 0x14593fcb0
140112493: 0f 11 85 0c 09 00 00        	movups	%xmm0, 0x90c(%rbp)
14011249a: c7 85 1c 09 00 00 a2 17 00 00       	movl	$0x17a2, 0x91c(%rbp) # imm = 0x17A2
1401124a4: 66 c7 85 20 09 00 00 01 00  	movw	$0x1, 0x920(%rbp)
1401124ad: c6 85 22 09 00 00 00        	movb	$0x0, 0x922(%rbp)
1401124b4: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
1401124ba: 48 8d 7d d0                 	leaq	-0x30(%rbp), %rdi
1401124be: 48 89 f9                    	movq	%rdi, %rcx
1401124c1: 48 89 da                    	movq	%rbx, %rdx
1401124c4: e8 24 0d 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401124c9: 41 b8 88 00 00 00           	movl	$0x88, %r8d
1401124cf: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
1401124d6: 4c 89 ea                    	movq	%r13, %rdx
1401124d9: e8 0f 0d 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401124de: 41 b8 08 02 00 00           	movl	$0x208, %r8d            # imm = 0x208
1401124e4: 48 8d 8d 98 05 00 00        	leaq	0x598(%rbp), %rcx
1401124eb: 48 89 fa                    	movq	%rdi, %rdx
1401124ee: e8 fa 0c 66 05              	callq	0x1457731ed <.text+0x57721ed>
1401124f3: 48 8b 85 48 09 00 00        	movq	0x948(%rbp), %rax
1401124fa: 48 89 85 90 05 00 00        	movq	%rax, 0x590(%rbp)
140112501: 4c 89 e9                    	movq	%r13, %rcx
140112504: 48 8d 95 68 02 00 00        	leaq	0x268(%rbp), %rdx
14011250b: 49 89 f0                    	movq	%rsi, %r8
14011250e: e8 6d da fc ff              	callq	0x1400dff80 <.text+0xdef80>
140112513: 90                          	nop
140112514: 48 89 f1                    	movq	%rsi, %rcx
140112517: 48 8d b5 e8 01 00 00        	leaq	0x1e8(%rbp), %rsi
14011251e: 48 8b 85 a0 08 00 00        	movq	0x8a0(%rbp), %rax
140112525: 48 8b 95 c8 08 00 00        	movq	0x8c8(%rbp), %rdx
14011252c: 48 89 85 90 05 00 00        	movq	%rax, 0x590(%rbp)
140112533: 0f 10 85 a8 08 00 00        	movups	0x8a8(%rbp), %xmm0
14011253a: 0f 11 85 98 05 00 00        	movups	%xmm0, 0x598(%rbp)
140112541: 0f 10 85 b8 08 00 00        	movups	0x8b8(%rbp), %xmm0
140112548: 0f 11 85 a8 05 00 00        	movups	%xmm0, 0x5a8(%rbp)
14011254f: 48 89 95 b8 05 00 00        	movq	%rdx, 0x5b8(%rbp)
140112556: 48 8b 95 70 08 00 00        	movq	0x870(%rbp), %rdx
14011255d: 4c 8b 85 50 08 00 00        	movq	0x850(%rbp), %r8
140112564: 4c 8d 8d f8 07 00 00        	leaq	0x7f8(%rbp), %r9
14011256b: e8 b0 06 0e 00              	callq	0x1401f2c20 <.text+0x1f1c20>
140112570: 90                          	nop
140112571: 4d 85 e4                    	testq	%r12, %r12
140112574: 44 0f 28 05 84 33 80 05     	movaps	0x5803384(%rip), %xmm8  # 0x145915900
14011257c: 44 0f 10 0d 64 e2 82 05     	movups	0x582e264(%rip), %xmm9  # 0x1459407e8
140112584: 44 0f 10 15 6c e2 82 05     	movups	0x582e26c(%rip), %xmm10 # 0x1459407f8
14011258c: 48 8b 9d 60 08 00 00        	movq	0x860(%rbp), %rbx
140112593: 74 15                       	je	0x1401125aa <.text+0x1115aa>
140112595: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14011259b: 48 8b 8d 68 09 00 00        	movq	0x968(%rbp), %rcx
1401125a2: 4c 89 e2                    	movq	%r12, %rdx
1401125a5: e8 26 fc ee ff              	callq	0x1400021d0 <.text+0x11d0>
1401125aa: 48 8b 95 40 09 00 00        	movq	0x940(%rbp), %rdx
1401125b1: 48 85 d2                    	testq	%rdx, %rdx
1401125b4: 74 12                       	je	0x1401125c8 <.text+0x1115c8>
1401125b6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401125bc: 48 8b 8d 70 09 00 00        	movq	0x970(%rbp), %rcx
1401125c3: e8 08 fc ee ff              	callq	0x1400021d0 <.text+0x11d0>
1401125c8: 48 8b 95 88 09 00 00        	movq	0x988(%rbp), %rdx
1401125cf: 48 85 d2                    	testq	%rdx, %rdx
1401125d2: 0f 84 27 ea ff ff           	je	0x140110fff <.text+0x10ffff>
1401125d8: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401125de: 48 8b 8d 58 09 00 00        	movq	0x958(%rbp), %rcx
1401125e5: e8 e6 fb ee ff              	callq	0x1400021d0 <.text+0x11d0>
1401125ea: e9 10 ea ff ff              	jmp	0x140110fff <.text+0x10ffff>
1401125ef: 48 8b 78 10                 	movq	0x10(%rax), %rdi
1401125f3: 48 83 ff 04                 	cmpq	$0x4, %rdi
1401125f7: b8 04 00 00 00              	movl	$0x4, %eax
1401125fc: 48 0f 43 f8                 	cmovaeq	%rax, %rdi
140112600: e9 ee fb ff ff              	jmp	0x1401121f3 <.text+0x1111f3>
140112605: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
14011260e: 41 b8 a8 00 00 00           	movl	$0xa8, %r8d
140112614: 41 b9 01 00 00 00           	movl	$0x1, %r9d
14011261a: 4c 89 e9                    	movq	%r13, %rcx
14011261d: 48 89 fa                    	movq	%rdi, %rdx
140112620: e8 8b 1e 66 05              	callq	0x1457744b0 <.text+0x57734b0>
140112625: 90                          	nop
140112626: e9 1b ed ff ff              	jmp	0x140111346 <.text+0x110346>
14011262b: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
140112634: 41 b8 a8 00 00 00           	movl	$0xa8, %r8d
14011263a: 41 b9 01 00 00 00           	movl	$0x1, %r9d
140112640: 4c 89 f9                    	movq	%r15, %rcx
140112643: 48 89 fa                    	movq	%rdi, %rdx
140112646: e8 65 1e 66 05              	callq	0x1457744b0 <.text+0x57734b0>
14011264b: 90                          	nop
14011264c: e9 a0 ed ff ff              	jmp	0x1401113f1 <.text+0x1103f1>
140112651: 31 c9                       	xorl	%ecx, %ecx
140112653: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
14011265a: 48 8b 95 68 09 00 00        	movq	0x968(%rbp), %rdx
140112661: e8 35 11 7f 05              	callq	0x14590379b <.text+0x590279b>
140112666: 90                          	nop
140112667: eb 38                       	jmp	0x1401126a1 <.text+0x1116a1>
140112669: 31 c9                       	xorl	%ecx, %ecx
14011266b: c6 85 97 09 00 00 00        	movb	$0x0, 0x997(%rbp)
140112672: 48 8b 95 60 09 00 00        	movq	0x960(%rbp), %rdx
140112679: e8 1d 11 7f 05              	callq	0x14590379b <.text+0x590279b>
14011267e: 90                          	nop
14011267f: eb 20                       	jmp	0x1401126a1 <.text+0x1116a1>
140112681: 31 c9                       	xorl	%ecx, %ecx
140112683: 48 8b 95 70 09 00 00        	movq	0x970(%rbp), %rdx
14011268a: e8 0c 11 7f 05              	callq	0x14590379b <.text+0x590279b>
14011268f: 90                          	nop
140112690: eb 0f                       	jmp	0x1401126a1 <.text+0x1116a1>
140112692: 31 c9                       	xorl	%ecx, %ecx
140112694: 48 8b 95 58 09 00 00        	movq	0x958(%rbp), %rdx
14011269b: e8 fb 10 7f 05              	callq	0x14590379b <.text+0x590279b>
1401126a0: 90                          	nop
1401126a1: 0f 0b                       	ud2
1401126a3: 48 8b 95 68 08 00 00        	movq	0x868(%rbp), %rdx
1401126aa: 48 85 d2                    	testq	%rdx, %rdx
1401126ad: 74 16                       	je	0x1401126c5 <.text+0x1116c5>
1401126af: 48 c1 e2 03                 	shlq	$0x3, %rdx
1401126b3: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1401126b9: 48 8b 8d 78 08 00 00        	movq	0x878(%rbp), %rcx
1401126c0: e8 0b fb ee ff              	callq	0x1400021d0 <.text+0x11d0>
1401126c5: 48 8b 85 b8 07 00 00        	movq	0x7b8(%rbp), %rax
1401126cc: 0f 28 b5 a0 09 00 00        	movaps	0x9a0(%rbp), %xmm6
1401126d3: 0f 28 bd b0 09 00 00        	movaps	0x9b0(%rbp), %xmm7
1401126da: 44 0f 28 85 c0 09 00 00     	movaps	0x9c0(%rbp), %xmm8
1401126e2: 44 0f 28 8d d0 09 00 00     	movaps	0x9d0(%rbp), %xmm9
1401126ea: 44 0f 28 95 e0 09 00 00     	movaps	0x9e0(%rbp), %xmm10
1401126f2: 44 0f 28 9d f0 09 00 00     	movaps	0x9f0(%rbp), %xmm11
1401126fa: 44 0f 28 a5 00 0a 00 00     	movaps	0xa00(%rbp), %xmm12
140112702: 44 0f 28 ad 10 0a 00 00     	movaps	0xa10(%rbp), %xmm13
14011270a: 44 0f 28 b5 20 0a 00 00     	movaps	0xa20(%rbp), %xmm14
140112712: 44 0f 28 bd 30 0a 00 00     	movaps	0xa30(%rbp), %xmm15
14011271a: 48 81 c4 c8 0a 00 00        	addq	$0xac8, %rsp            # imm = 0xAC8
140112721: 5b                          	popq	%rbx
140112722: 5f                          	popq	%rdi
140112723: 5e                          	popq	%rsi
140112724: 41 5c                       	popq	%r12
140112726: 41 5d                       	popq	%r13
140112728: 41 5e                       	popq	%r14
14011272a: 41 5f                       	popq	%r15
14011272c: 5d                          	popq	%rbp
14011272d: c3                          	retq
14011272e: 48 89 b5 58 09 00 00        	movq	%rsi, 0x958(%rbp)
140112735: b9 01 00 00 00              	movl	$0x1, %ecx
14011273a: e9 55 ff ff ff              	jmp	0x140112694 <.text+0x111694>
14011273f: 48 8b 85 80 09 00 00        	movq	0x980(%rbp), %rax
140112746: 48 89 85 68 09 00 00        	movq	%rax, 0x968(%rbp)
14011274d: b9 01 00 00 00              	movl	$0x1, %ecx
140112752: e9 fc fe ff ff              	jmp	0x140112653 <.text+0x111653>
140112757: 48 89 b5 70 09 00 00        	movq	%rsi, 0x970(%rbp)
14011275e: b9 01 00 00 00              	movl	$0x1, %ecx
140112763: e9 1b ff ff ff              	jmp	0x140112683 <.text+0x111683>
140112768: 48 8b 85 88 09 00 00        	movq	0x988(%rbp), %rax
14011276f: 48 89 85 60 09 00 00        	movq	%rax, 0x960(%rbp)
140112776: b9 01 00 00 00              	movl	$0x1, %ecx
14011277b: e9 eb fe ff ff              	jmp	0x14011266b <.text+0x11166b>
