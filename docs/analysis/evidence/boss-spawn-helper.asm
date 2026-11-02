
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14548f900: 55                          	pushq	%rbp
14548f901: 41 57                       	pushq	%r15
14548f903: 41 56                       	pushq	%r14
14548f905: 41 55                       	pushq	%r13
14548f907: 41 54                       	pushq	%r12
14548f909: 56                          	pushq	%rsi
14548f90a: 57                          	pushq	%rdi
14548f90b: 53                          	pushq	%rbx
14548f90c: 48 81 ec 78 02 00 00        	subq	$0x278, %rsp            # imm = 0x278
14548f913: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14548f91b: 44 0f 29 95 e0 01 00 00     	movaps	%xmm10, 0x1e0(%rbp)
14548f923: 44 0f 29 8d d0 01 00 00     	movaps	%xmm9, 0x1d0(%rbp)
14548f92b: 44 0f 29 85 c0 01 00 00     	movaps	%xmm8, 0x1c0(%rbp)
14548f933: 0f 29 bd b0 01 00 00        	movaps	%xmm7, 0x1b0(%rbp)
14548f93a: 0f 29 b5 a0 01 00 00        	movaps	%xmm6, 0x1a0(%rbp)
14548f941: 48 c7 85 98 01 00 00 fe ff ff ff    	movq	$-0x2, 0x198(%rbp)
14548f94c: 49 89 d5                    	movq	%rdx, %r13
14548f94f: 48 89 ce                    	movq	%rcx, %rsi
14548f952: c7 44 24 20 00 00 00 00     	movl	$0x0, 0x20(%rsp)
14548f95a: 4c 8d b5 44 01 00 00        	leaq	0x144(%rbp), %r14
14548f961: f3 0f 10 15 4b c5 46 00     	movss	0x46c54b(%rip), %xmm2   # 0x1458fbeb4
14548f969: f3 0f 10 1d 3f f5 44 00     	movss	0x44f53f(%rip), %xmm3   # 0x1458deeb0
14548f971: 4c 89 f1                    	movq	%r14, %rcx
14548f974: 48 89 f2                    	movq	%rsi, %rdx
14548f977: e8 d4 22 00 00              	callq	0x145491c50 <.text+0x5490c50>
14548f97c: 48 8b 8e 10 02 00 00        	movq	0x210(%rsi), %rcx
14548f983: 48 8b 96 18 02 00 00        	movq	0x218(%rsi), %rdx
14548f98a: e8 01 3d f5 ff              	callq	0x1453e3690 <.text+0x53e2690>
14548f98f: 48 69 c8 b8 00 00 00        	imulq	$0xb8, %rax, %rcx
14548f996: 48 8d 05 7b 80 23 01        	leaq	0x123807b(%rip), %rax   # 0x1466c7a18
14548f99d: 48 01 c8                    	addq	%rcx, %rax
14548f9a0: 0f 57 f6                    	xorps	%xmm6, %xmm6
14548f9a3: 83 be 50 08 00 00 01        	cmpl	$0x1, 0x850(%rsi)
14548f9aa: 75 28                       	jne	0x14548f9d4 <.text+0x548e9d4>
14548f9ac: 80 be 35 09 00 00 00        	cmpb	$0x0, 0x935(%rsi)
14548f9b3: 74 1f                       	je	0x14548f9d4 <.text+0x548e9d4>
14548f9b5: f3 0f 10 b6 cc 08 00 00     	movss	0x8cc(%rsi), %xmm6
14548f9bd: f3 0f 5c b6 54 08 00 00     	subss	0x854(%rsi), %xmm6
14548f9c5: f3 0f 5e 35 63 9e 44 00     	divss	0x449e63(%rip), %xmm6   # 0x1458d9830
14548f9cd: 0f 57 c0                    	xorps	%xmm0, %xmm0
14548f9d0: f3 0f 5f f0                 	maxss	%xmm0, %xmm6
14548f9d4: 0f b7 be 32 02 00 00        	movzwl	0x232(%rsi), %edi
14548f9db: 66 44 0f 6e 86 34 02 00 00  	movd	0x234(%rsi), %xmm8
14548f9e4: f3 41 0f 10 7d 44           	movss	0x44(%r13), %xmm7
14548f9ea: f3 0f 59 3d 7e 52 61 01     	mulss	0x161527e(%rip), %xmm7  # 0x146aa4c70
14548f9f2: f3 44 0f 10 90 b0 00 00 00  	movss	0xb0(%rax), %xmm10
14548f9fb: f3 41 0f 59 fa              	mulss	%xmm10, %xmm7
14548fa00: f3 0f 59 be 28 09 00 00     	mulss	0x928(%rsi), %xmm7
14548fa08: f3 0f 10 05 64 52 61 01     	movss	0x1615264(%rip), %xmm0  # 0x146aa4c74
14548fa10: 0f 28 ce                    	movaps	%xmm6, %xmm1
14548fa13: e8 1b b8 27 00              	callq	0x14570b233 <.text+0x570a233>
14548fa18: f3 0f 59 c7                 	mulss	%xmm7, %xmm0
14548fa1c: 0f 57 ff                    	xorps	%xmm7, %xmm7
14548fa1f: f3 0f 2a ff                 	cvtsi2ss	%edi, %xmm7
14548fa23: f3 0f 5e 3d 05 11 41 00     	divss	0x411105(%rip), %xmm7   # 0x1458a0b30
14548fa2b: f3 0f 59 f8                 	mulss	%xmm0, %xmm7
14548fa2f: 45 8b 45 30                 	movl	0x30(%r13), %r8d
14548fa33: 8b 86 e8 08 00 00           	movl	0x8e8(%rsi), %eax
14548fa39: ff c0                       	incl	%eax
14548fa3b: 89 86 e8 08 00 00           	movl	%eax, 0x8e8(%rsi)
14548fa41: 44 89 c1                    	movl	%r8d, %ecx
14548fa44: 81 e1 ff ff ff 00           	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
14548fa4a: 48 c1 e1 18                 	shlq	$0x18, %rcx
14548fa4e: 25 ff ff ff 00              	andl	$0xffffff, %eax         # imm = 0xFFFFFF
14548fa53: 48 09 c8                    	orq	%rcx, %rax
14548fa56: 48 bb 00 00 00 00 00 00 30 f1       	movabsq	$-0xed0000000000000, %rbx # imm = 0xF130000000000000
14548fa60: 48 09 c3                    	orq	%rax, %rbx
14548fa63: 45 8b 4d 34                 	movl	0x34(%r13), %r9d
14548fa67: f3 45 0f 10 4d 38           	movss	0x38(%r13), %xmm9
14548fa6d: 4c 89 74 24 38              	movq	%r14, 0x38(%rsp)
14548fa72: f3 0f 11 7c 24 28           	movss	%xmm7, 0x28(%rsp)
14548fa78: f3 44 0f 11 4c 24 20        	movss	%xmm9, 0x20(%rsp)
14548fa7f: c6 44 24 30 01              	movb	$0x1, 0x30(%rsp)
14548fa84: 48 89 f1                    	movq	%rsi, %rcx
14548fa87: 48 89 da                    	movq	%rbx, %rdx
14548fa8a: e8 31 12 00 00              	callq	0x145490cc0 <.text+0x548fcc0>
14548fa8f: 4d 8b 7d 18                 	movq	0x18(%r13), %r15
14548fa93: 4d 85 ff                    	testq	%r15, %r15
14548fa96: 74 5d                       	je	0x14548faf5 <.text+0x548eaf5>
14548fa98: 4d 8b 65 10                 	movq	0x10(%r13), %r12
14548fa9c: 4e 8d 34 bd 00 00 00 00     	leaq	(,%r15,4), %r14
14548faa4: e8 57 27 b7 fa              	callq	0x140002200 <.text+0x1200>
14548faa9: ba 04 00 00 00              	movl	$0x4, %edx
14548faae: 4c 89 f1                    	movq	%r14, %rcx
14548fab1: e8 0a 27 b7 fa              	callq	0x1400021c0 <.text+0x11c0>
14548fab6: 48 85 c0                    	testq	%rax, %rax
14548fab9: 0f 84 5d 09 00 00           	je	0x14549041c <.text+0x548f41c>
14548fabf: 49 83 ff 0c                 	cmpq	$0xc, %r15
14548fac3: 76 29                       	jbe	0x14548faee <.text+0x548eaee>
14548fac5: 4a 8d 0c b8                 	leaq	(%rax,%r15,4), %rcx
14548fac9: 49 8d 54 24 18              	leaq	0x18(%r12), %rdx
14548face: 4f 8d 04 ff                 	leaq	(%r15,%r15,8), %r8
14548fad2: 4f 8d 04 40                 	leaq	(%r8,%r8,2), %r8
14548fad6: 4d 01 e0                    	addq	%r12, %r8
14548fad9: 4d 01 f8                    	addq	%r15, %r8
14548fadc: 4c 39 c0                    	cmpq	%r8, %rax
14548fadf: 41 0f 92 c0                 	setb	%r8b
14548fae3: 48 39 ca                    	cmpq	%rcx, %rdx
14548fae6: 0f 92 c1                    	setb	%cl
14548fae9: 41 84 c8                    	testb	%cl, %r8b
14548faec: 74 11                       	je	0x14548faff <.text+0x548eaff>
14548faee: 31 c9                       	xorl	%ecx, %ecx
14548faf0: e9 9e 00 00 00              	jmp	0x14548fb93 <.text+0x548eb93>
14548faf5: b8 04 00 00 00              	movl	$0x4, %eax
14548fafa: e9 58 01 00 00              	jmp	0x14548fc57 <.text+0x548ec57>
14548faff: 44 89 f9                    	movl	%r15d, %ecx
14548fb02: 83 e1 07                    	andl	$0x7, %ecx
14548fb05: ba 08 00 00 00              	movl	$0x8, %edx
14548fb0a: 48 0f 45 d1                 	cmovneq	%rcx, %rdx
14548fb0e: 4c 89 f9                    	movq	%r15, %rcx
14548fb11: 48 29 d1                    	subq	%rdx, %rcx
14548fb14: 49 8d 94 24 dc 00 00 00     	leaq	0xdc(%r12), %rdx
14548fb1c: 45 31 c0                    	xorl	%r8d, %r8d
14548fb1f: 0f 28 05 5a 51 61 01        	movaps	0x161515a(%rip), %xmm0  # 0x146aa4c80
14548fb26: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14548fb30: f3 0f 10 8a 3c ff ff ff     	movss	-0xc4(%rdx), %xmm1
14548fb38: f3 0f 10 92 58 ff ff ff     	movss	-0xa8(%rdx), %xmm2
14548fb40: 0f 14 ca                    	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
14548fb43: f3 0f 10 92 74 ff ff ff     	movss	-0x8c(%rdx), %xmm2
14548fb4b: f3 0f 10 5a 90              	movss	-0x70(%rdx), %xmm3
14548fb50: 0f 14 d3                    	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
14548fb53: 0f 16 ca                    	movlhps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0]
14548fb56: f3 0f 10 12                 	movss	(%rdx), %xmm2
14548fb5a: f3 0f 10 5a e4              	movss	-0x1c(%rdx), %xmm3
14548fb5f: 0f 14 da                    	unpcklps	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
14548fb62: f3 0f 10 52 c8              	movss	-0x38(%rdx), %xmm2
14548fb67: f3 0f 10 62 ac              	movss	-0x54(%rdx), %xmm4
14548fb6c: 0f 14 e2                    	unpcklps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
14548fb6f: 0f 16 e3                    	movlhps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0]
14548fb72: 0f 59 c8                    	mulps	%xmm0, %xmm1
14548fb75: 0f 59 e0                    	mulps	%xmm0, %xmm4
14548fb78: 42 0f 11 0c 80              	movups	%xmm1, (%rax,%r8,4)
14548fb7d: 42 0f 11 64 80 10           	movups	%xmm4, 0x10(%rax,%r8,4)
14548fb83: 49 83 c0 08                 	addq	$0x8, %r8
14548fb87: 48 81 c2 e0 00 00 00        	addq	$0xe0, %rdx
14548fb8e: 4c 39 c1                    	cmpq	%r8, %rcx
14548fb91: 75 9d                       	jne	0x14548fb30 <.text+0x548eb30>
14548fb93: 45 89 fa                    	movl	%r15d, %r10d
14548fb96: 41 29 ca                    	subl	%ecx, %r10d
14548fb99: 48 89 ca                    	movq	%rcx, %rdx
14548fb9c: 41 83 e2 03                 	andl	$0x3, %r10d
14548fba0: 74 49                       	je	0x14548fbeb <.text+0x548ebeb>
14548fba2: 48 8d 14 c9                 	leaq	(%rcx,%rcx,8), %rdx
14548fba6: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
14548fbaa: 48 01 ca                    	addq	%rcx, %rdx
14548fbad: 4d 8d 04 14                 	leaq	(%r12,%rdx), %r8
14548fbb1: 49 83 c0 18                 	addq	$0x18, %r8
14548fbb5: 4e 8d 0c d5 00 00 00 00     	leaq	(,%r10,8), %r9
14548fbbd: 4d 29 d1                    	subq	%r10, %r9
14548fbc0: 45 31 d2                    	xorl	%r10d, %r10d
14548fbc3: f3 0f 10 05 59 0f 41 00     	movss	0x410f59(%rip), %xmm0   # 0x1458a0b24
14548fbcb: 48 89 ca                    	movq	%rcx, %rdx
14548fbce: 66 90                       	nop
14548fbd0: f3 43 0f 10 0c 90           	movss	(%r8,%r10,4), %xmm1
14548fbd6: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
14548fbda: f3 0f 11 0c 90              	movss	%xmm1, (%rax,%rdx,4)
14548fbdf: 48 ff c2                    	incq	%rdx
14548fbe2: 49 83 c2 07                 	addq	$0x7, %r10
14548fbe6: 4d 39 d1                    	cmpq	%r10, %r9
14548fbe9: 75 e5                       	jne	0x14548fbd0 <.text+0x548ebd0>
14548fbeb: 4c 29 f9                    	subq	%r15, %rcx
14548fbee: 48 83 f9 fc                 	cmpq	$-0x4, %rcx
14548fbf2: 77 63                       	ja	0x14548fc57 <.text+0x548ec57>
14548fbf4: 48 8d 0c d2                 	leaq	(%rdx,%rdx,8), %rcx
14548fbf8: 48 8d 0c 49                 	leaq	(%rcx,%rcx,2), %rcx
14548fbfc: 48 01 d1                    	addq	%rdx, %rcx
14548fbff: 4c 01 e1                    	addq	%r12, %rcx
14548fc02: 48 83 c1 6c                 	addq	$0x6c, %rcx
14548fc06: f3 0f 10 05 16 0f 41 00     	movss	0x410f16(%rip), %xmm0   # 0x1458a0b24
14548fc0e: 66 90                       	nop
14548fc10: f3 0f 10 49 ac              	movss	-0x54(%rcx), %xmm1
14548fc15: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
14548fc19: f3 0f 11 0c 90              	movss	%xmm1, (%rax,%rdx,4)
14548fc1e: f3 0f 10 49 c8              	movss	-0x38(%rcx), %xmm1
14548fc23: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
14548fc27: f3 0f 11 4c 90 04           	movss	%xmm1, 0x4(%rax,%rdx,4)
14548fc2d: f3 0f 10 49 e4              	movss	-0x1c(%rcx), %xmm1
14548fc32: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
14548fc36: f3 0f 11 4c 90 08           	movss	%xmm1, 0x8(%rax,%rdx,4)
14548fc3c: f3 0f 10 09                 	movss	(%rcx), %xmm1
14548fc40: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
14548fc44: f3 0f 11 4c 90 0c           	movss	%xmm1, 0xc(%rax,%rdx,4)
14548fc4a: 48 83 c2 04                 	addq	$0x4, %rdx
14548fc4e: 48 83 c1 70                 	addq	$0x70, %rcx
14548fc52: 49 39 d7                    	cmpq	%rdx, %r15
14548fc55: 75 b9                       	jne	0x14548fc10 <.text+0x548ec10>
14548fc57: 4c 89 7d f0                 	movq	%r15, -0x10(%rbp)
14548fc5b: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
14548fc5f: f3 44 0f 59 96 28 09 00 00  	mulss	0x928(%rsi), %xmm10
14548fc68: 4c 89 7d 00                 	movq	%r15, (%rbp)
14548fc6c: f3 45 0f 51 d2              	sqrtss	%xmm10, %xmm10
14548fc71: f3 45 0f 59 55 48           	mulss	0x48(%r13), %xmm10
14548fc77: f3 0f 10 05 11 50 61 01     	movss	0x1615011(%rip), %xmm0  # 0x146aa4c90
14548fc7f: 0f 28 ce                    	movaps	%xmm6, %xmm1
14548fc82: e8 ac b5 27 00              	callq	0x14570b233 <.text+0x570a233>
14548fc87: f3 41 0f 59 c2              	mulss	%xmm10, %xmm0
14548fc8c: 0f 57 c9                    	xorps	%xmm1, %xmm1
14548fc8f: 66 44 0f 61 c1              	punpcklwd	%xmm1, %xmm8    # xmm8 = xmm8[0],xmm1[0],xmm8[1],xmm1[1],xmm8[2],xmm1[2],xmm8[3],xmm1[3]
14548fc94: f3 0f 10 15 6c ba 44 00     	movss	0x44ba6c(%rip), %xmm2   # 0x1458db708
14548fc9c: 41 0f 28 e9                 	movaps	%xmm9, %xmm5
14548fca0: f3 0f 59 ea                 	mulss	%xmm2, %xmm5
14548fca4: f3 0f 58 2d 18 c0 71 00     	addss	0x71c018(%rip), %xmm5   # 0x145babcc4
14548fcac: 41 0f 5b f0                 	cvtdq2ps	%xmm8, %xmm6
14548fcb0: f3 0f 5d 2d 70 0e 41 00     	minss	0x410e70(%rip), %xmm5   # 0x1458a0b28
14548fcb8: f3 0f 10 9e cc 08 00 00     	movss	0x8cc(%rsi), %xmm3
14548fcc0: f3 0f 10 25 08 0d 41 00     	movss	0x410d08(%rip), %xmm4   # 0x1458a09d0
14548fcc8: f3 0f 58 e3                 	addss	%xmm3, %xmm4
14548fccc: f3 0f 58 d3                 	addss	%xmm3, %xmm2
14548fcd0: f3 45 0f 10 45 4c           	movss	0x4c(%r13), %xmm8
14548fcd6: 41 0f 14 c0                 	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
14548fcda: 0f 11 8d b8 00 00 00        	movups	%xmm1, 0xb8(%rbp)
14548fce1: 0f 11 8d a8 00 00 00        	movups	%xmm1, 0xa8(%rbp)
14548fce8: 0f 11 8d 98 00 00 00        	movups	%xmm1, 0x98(%rbp)
14548fcef: 0f 11 8d 88 00 00 00        	movups	%xmm1, 0x88(%rbp)
14548fcf6: 48 89 5d 60                 	movq	%rbx, 0x60(%rbp)
14548fcfa: 48 c7 45 68 00 00 00 00     	movq	$0x0, 0x68(%rbp)
14548fd02: 4c 89 6d 08                 	movq	%r13, 0x8(%rbp)
14548fd06: c6 45 10 00                 	movb	$0x0, 0x10(%rbp)
14548fd0a: f3 0f 11 bd c8 00 00 00     	movss	%xmm7, 0xc8(%rbp)
14548fd12: 0f 5e 35 b7 75 14 01        	divps	0x11475b7(%rip), %xmm6  # 0x1465d72d0
14548fd19: f3 0f 11 bd cc 00 00 00     	movss	%xmm7, 0xcc(%rbp)
14548fd21: 0f 59 f0                    	mulps	%xmm0, %xmm6
14548fd24: 0f 13 b5 d0 00 00 00        	movlps	%xmm6, 0xd0(%rbp)
14548fd2b: c7 85 d8 00 00 00 00 00 00 40       	movl	$0x40000000, 0xd8(%rbp) # imm = 0x40000000
14548fd35: f3 0f 11 ad dc 00 00 00     	movss	%xmm5, 0xdc(%rbp)
14548fd3d: f3 44 0f 11 8d e0 00 00 00  	movss	%xmm9, 0xe0(%rbp)
14548fd46: 48 8b 85 44 01 00 00        	movq	0x144(%rbp), %rax
14548fd4d: 48 89 85 e4 00 00 00        	movq	%rax, 0xe4(%rbp)
14548fd54: 8b 85 4c 01 00 00           	movl	0x14c(%rbp), %eax
14548fd5a: 89 85 ec 00 00 00           	movl	%eax, 0xec(%rbp)
14548fd60: 8b 85 4c 01 00 00           	movl	0x14c(%rbp), %eax
14548fd66: 89 85 f8 00 00 00           	movl	%eax, 0xf8(%rbp)
14548fd6c: 48 8b 85 44 01 00 00        	movq	0x144(%rbp), %rax
14548fd73: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
14548fd7a: f3 0f 11 9d fc 00 00 00     	movss	%xmm3, 0xfc(%rbp)
14548fd82: c7 85 00 01 00 00 00 00 00 00       	movl	$0x0, 0x100(%rbp)
14548fd8c: f3 0f 11 a5 04 01 00 00     	movss	%xmm4, 0x104(%rbp)
14548fd94: 48 c7 85 08 01 00 00 00 00 00 40    	movq	$0x40000000, 0x108(%rbp) # imm = 0x40000000
14548fd9f: 48 c7 85 10 01 00 00 00 00 00 00    	movq	$0x0, 0x110(%rbp)
14548fdaa: 0f 11 4d 70                 	movups	%xmm1, 0x70(%rbp)
14548fdae: 48 c7 85 80 00 00 00 00 00 00 00    	movq	$0x0, 0x80(%rbp)
14548fdb9: f3 0f 11 95 18 01 00 00     	movss	%xmm2, 0x118(%rbp)
14548fdc1: f3 0f 11 9d 1c 01 00 00     	movss	%xmm3, 0x11c(%rbp)
14548fdc9: 48 c7 85 20 01 00 00 00 00 00 00    	movq	$0x0, 0x120(%rbp)
14548fdd4: 48 c7 45 d8 00 00 00 00     	movq	$0x0, -0x28(%rbp)
14548fddc: 48 c7 45 e0 08 00 00 00     	movq	$0x8, -0x20(%rbp)
14548fde4: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
14548fdec: c7 85 28 01 00 00 00 00 00 00       	movl	$0x0, 0x128(%rbp)
14548fdf6: c7 45 40 00 00 00 00        	movl	$0x0, 0x40(%rbp)
14548fdfd: c7 45 48 00 00 00 00        	movl	$0x0, 0x48(%rbp)
14548fe04: c6 85 2c 01 00 00 01        	movb	$0x1, 0x12c(%rbp)
14548fe0b: 48 c7 45 18 ff ff ff ff     	movq	$-0x1, 0x18(%rbp)
14548fe13: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
14548fe1a: 48 8b be c8 04 00 00        	movq	0x4c8(%rsi), %rdi
14548fe21: 48 3b be b8 04 00 00        	cmpq	0x4b8(%rsi), %rdi
14548fe28: 75 0d                       	jne	0x14548fe37 <.text+0x548ee37>
14548fe2a: 48 8d 8e b8 04 00 00        	leaq	0x4b8(%rsi), %rcx
14548fe31: e8 da a9 2a 00              	callq	0x14573a810 <.text+0x5739810>
14548fe36: 90                          	nop
14548fe37: 4d 8d 75 30                 	leaq	0x30(%r13), %r14
14548fe3b: 48 69 cf 58 01 00 00        	imulq	$0x158, %rdi, %rcx      # imm = 0x158
14548fe42: 48 03 8e c0 04 00 00        	addq	0x4c0(%rsi), %rcx
14548fe49: 48 8d 55 d8                 	leaq	-0x28(%rbp), %rdx
14548fe4d: 41 b8 58 01 00 00           	movl	$0x158, %r8d            # imm = 0x158
14548fe53: e8 33 b3 27 00              	callq	0x14570b18b <.text+0x570a18b>
14548fe58: 48 ff c7                    	incq	%rdi
14548fe5b: 48 89 be c8 04 00 00        	movq	%rdi, 0x4c8(%rsi)
14548fe62: 4c 89 b5 88 01 00 00        	movq	%r14, 0x188(%rbp)
14548fe69: 4c 89 b5 50 01 00 00        	movq	%r14, 0x150(%rbp)
14548fe70: 48 8d 05 89 25 24 00        	leaq	0x242589(%rip), %rax    # 0x1456d2400 <.text+0x56d1400>
14548fe77: 48 89 85 58 01 00 00        	movq	%rax, 0x158(%rbp)
14548fe7e: 48 8d 15 74 e5 22 01        	leaq	0x122e574(%rip), %rdx   # 0x1466be3f9
14548fe85: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14548fe89: 4c 8d 85 50 01 00 00        	leaq	0x150(%rbp), %r8
14548fe90: e8 ab 04 23 00              	callq	0x1456c0340 <.text+0x56bf340>
14548fe95: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
14548fe99: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
14548fe9d: 49 8b 7d 00                 	movq	(%r13), %rdi
14548fea1: 4d 8b 75 08                 	movq	0x8(%r13), %r14
14548fea5: 48 89 8d 80 01 00 00        	movq	%rcx, 0x180(%rbp)
14548feac: e8 7f 4f fa ff              	callq	0x145434e30 <.text+0x5433e30>
14548feb1: 90                          	nop
14548feb2: 49 89 c7                    	movq	%rax, %r15
14548feb5: 49 89 d4                    	movq	%rdx, %r12
14548feb8: 48 89 9d 78 01 00 00        	movq	%rbx, 0x178(%rbp)
14548febf: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
14548fec3: 48 85 d2                    	testq	%rdx, %rdx
14548fec6: 74 12                       	je	0x14548feda <.text+0x548eeda>
14548fec8: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14548fece: 48 8b 8d 80 01 00 00        	movq	0x180(%rbp), %rcx
14548fed5: e8 f6 22 b7 fa              	callq	0x1400021d0 <.text+0x11d0>
14548feda: 4d 85 ff                    	testq	%r15, %r15
14548fedd: 48 89 bd 80 01 00 00        	movq	%rdi, 0x180(%rbp)
14548fee4: 4c 0f 44 ff                 	cmoveq	%rdi, %r15
14548fee8: 4c 89 b5 30 01 00 00        	movq	%r14, 0x130(%rbp)
14548feef: 4d 0f 44 e6                 	cmoveq	%r14, %r12
14548fef3: 49 8d 45 30                 	leaq	0x30(%r13), %rax
14548fef7: 48 89 85 50 01 00 00        	movq	%rax, 0x150(%rbp)
14548fefe: 48 8d 05 fb 24 24 00        	leaq	0x2424fb(%rip), %rax    # 0x1456d2400 <.text+0x56d1400>
14548ff05: 48 89 85 58 01 00 00        	movq	%rax, 0x158(%rbp)
14548ff0c: 48 8d 15 f4 e4 22 01        	leaq	0x122e4f4(%rip), %rdx   # 0x1466be407
14548ff13: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14548ff17: 4c 8d 85 50 01 00 00        	leaq	0x150(%rbp), %r8
14548ff1e: e8 1d 04 23 00              	callq	0x1456c0340 <.text+0x56bf340>
14548ff23: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
14548ff27: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
14548ff2b: 49 8b 5d 20                 	movq	0x20(%r13), %rbx
14548ff2f: 4c 89 6d d0                 	movq	%r13, -0x30(%rbp)
14548ff33: 49 8b 7d 28                 	movq	0x28(%r13), %rdi
14548ff37: 48 89 8d 38 01 00 00        	movq	%rcx, 0x138(%rbp)
14548ff3e: e8 ed 4e fa ff              	callq	0x145434e30 <.text+0x5433e30>
14548ff43: 90                          	nop
14548ff44: 49 89 c6                    	movq	%rax, %r14
14548ff47: 49 89 d5                    	movq	%rdx, %r13
14548ff4a: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
14548ff4e: 48 85 d2                    	testq	%rdx, %rdx
14548ff51: 74 12                       	je	0x14548ff65 <.text+0x548ef65>
14548ff53: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14548ff59: 48 8b 8d 38 01 00 00        	movq	0x138(%rbp), %rcx
14548ff60: e8 6b 22 b7 fa              	callq	0x1400021d0 <.text+0x11d0>
14548ff65: 48 8d 86 30 05 00 00        	leaq	0x530(%rsi), %rax
14548ff6c: 4d 85 f6                    	testq	%r14, %r14
14548ff6f: 49 0f 45 de                 	cmovneq	%r14, %rbx
14548ff73: 4c 0f 44 ef                 	cmoveq	%rdi, %r13
14548ff77: 4c 89 6c 24 28              	movq	%r13, 0x28(%rsp)
14548ff7c: 49 89 c5                    	movq	%rax, %r13
14548ff7f: 48 89 5c 24 20              	movq	%rbx, 0x20(%rsp)
14548ff84: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14548ff88: 48 8b 95 78 01 00 00        	movq	0x178(%rbp), %rdx
14548ff8f: 4d 89 f8                    	movq	%r15, %r8
14548ff92: 4d 89 e1                    	movq	%r12, %r9
14548ff95: e8 86 8b fb ff              	callq	0x145448b20 <.text+0x5447b20>
14548ff9a: 48 8b be 40 05 00 00        	movq	0x540(%rsi), %rdi
14548ffa1: 48 3b be 30 05 00 00        	cmpq	0x530(%rsi), %rdi
14548ffa8: 75 09                       	jne	0x14548ffb3 <.text+0x548efb3>
14548ffaa: 4c 89 e9                    	movq	%r13, %rcx
14548ffad: e8 ee b8 27 00              	callq	0x14570b8a0 <.text+0x570a8a0>
14548ffb2: 90                          	nop
14548ffb3: 48 8b 86 38 05 00 00        	movq	0x538(%rsi), %rax
14548ffba: 48 89 f9                    	movq	%rdi, %rcx
14548ffbd: 48 c1 e1 05                 	shlq	$0x5, %rcx
14548ffc1: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
14548ffc5: 0f 10 4d e8                 	movups	-0x18(%rbp), %xmm1
14548ffc9: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14548ffce: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14548ffd2: 48 ff c7                    	incq	%rdi
14548ffd5: 48 89 be 40 05 00 00        	movq	%rdi, 0x540(%rsi)
14548ffdc: 48 8b 85 88 01 00 00        	movq	0x188(%rbp), %rax
14548ffe3: 48 89 85 50 01 00 00        	movq	%rax, 0x150(%rbp)
14548ffea: 48 8d 05 0f 24 24 00        	leaq	0x24240f(%rip), %rax    # 0x1456d2400 <.text+0x56d1400>
14548fff1: 48 89 85 58 01 00 00        	movq	%rax, 0x158(%rbp)
14548fff8: 48 8d 15 fa e3 22 01        	leaq	0x122e3fa(%rip), %rdx   # 0x1466be3f9
14548ffff: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
145490003: 4c 8d 85 50 01 00 00        	leaq	0x150(%rbp), %r8
14549000a: e8 31 03 23 00              	callq	0x1456c0340 <.text+0x56bf340>
14549000f: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
145490013: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
145490017: 48 89 8d 78 01 00 00        	movq	%rcx, 0x178(%rbp)
14549001e: e8 0d 4e fa ff              	callq	0x145434e30 <.text+0x5433e30>
145490023: 90                          	nop
145490024: 4c 8b 65 d0                 	movq	-0x30(%rbp), %r12
145490028: 48 8b bd 80 01 00 00        	movq	0x180(%rbp), %rdi
14549002f: 4c 8b b5 30 01 00 00        	movq	0x130(%rbp), %r14
145490036: 48 89 c3                    	movq	%rax, %rbx
145490039: 49 89 d7                    	movq	%rdx, %r15
14549003c: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
145490040: 48 85 d2                    	testq	%rdx, %rdx
145490043: 74 12                       	je	0x145490057 <.text+0x548f057>
145490045: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14549004b: 48 8b 8d 78 01 00 00        	movq	0x178(%rbp), %rcx
145490052: e8 79 21 b7 fa              	callq	0x1400021d0 <.text+0x11d0>
145490057: 48 85 db                    	testq	%rbx, %rbx
14549005a: 48 0f 44 df                 	cmoveq	%rdi, %rbx
14549005e: 4d 0f 44 fe                 	cmoveq	%r14, %r15
145490062: 4c 8d 35 57 5c 61 01        	leaq	0x1615c57(%rip), %r14   # 0x146aa5cc0
145490069: bf 17 00 00 00              	movl	$0x17, %edi
14549006e: ba 17 00 00 00              	movl	$0x17, %edx
145490073: 4c 89 f1                    	movq	%r14, %rcx
145490076: e8 b5 4d fa ff              	callq	0x145434e30 <.text+0x5433e30>
14549007b: 48 85 c0                    	testq	%rax, %rax
14549007e: 4c 0f 45 f0                 	cmovneq	%rax, %r14
145490082: 48 0f 44 d7                 	cmoveq	%rdi, %rdx
145490086: 48 89 54 24 20              	movq	%rdx, 0x20(%rsp)
14549008b: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14549008f: 48 89 da                    	movq	%rbx, %rdx
145490092: 4d 89 f8                    	movq	%r15, %r8
145490095: 4d 89 f1                    	movq	%r14, %r9
145490098: e8 83 71 fb ff              	callq	0x145447220 <.text+0x5446220>
14549009d: 48 8b be 40 05 00 00        	movq	0x540(%rsi), %rdi
1454900a4: 48 3b be 30 05 00 00        	cmpq	0x530(%rsi), %rdi
1454900ab: 75 09                       	jne	0x1454900b6 <.text+0x548f0b6>
1454900ad: 4c 89 e9                    	movq	%r13, %rcx
1454900b0: e8 eb b7 27 00              	callq	0x14570b8a0 <.text+0x570a8a0>
1454900b5: 90                          	nop
1454900b6: 48 8b 86 38 05 00 00        	movq	0x538(%rsi), %rax
1454900bd: 48 89 f9                    	movq	%rdi, %rcx
1454900c0: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454900c4: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
1454900c8: 0f 10 4d e8                 	movups	-0x18(%rbp), %xmm1
1454900cc: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454900d1: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454900d5: 48 ff c7                    	incq	%rdi
1454900d8: 48 89 be 40 05 00 00        	movq	%rdi, 0x540(%rsi)
1454900df: e8 1c 21 b7 fa              	callq	0x140002200 <.text+0x1200>
1454900e4: b9 20 00 00 00              	movl	$0x20, %ecx
1454900e9: ba 01 00 00 00              	movl	$0x1, %edx
1454900ee: e8 cd 20 b7 fa              	callq	0x1400021c0 <.text+0x11c0>
1454900f3: 48 85 c0                    	testq	%rax, %rax
1454900f6: 0f 84 fe 02 00 00           	je	0x1454903fa <.text+0x548f3fa>
1454900fc: 48 89 85 78 01 00 00        	movq	%rax, 0x178(%rbp)
145490103: c7 00 ee 1f 00 00           	movl	$0x1fee, (%rax)         # imm = 0x1FEE
145490109: 48 8b be 40 05 00 00        	movq	0x540(%rsi), %rdi
145490110: 48 3b be 30 05 00 00        	cmpq	0x530(%rsi), %rdi
145490117: 75 09                       	jne	0x145490122 <.text+0x548f122>
145490119: 4c 89 e9                    	movq	%r13, %rcx
14549011c: e8 7f b7 27 00              	callq	0x14570b8a0 <.text+0x570a8a0>
145490121: 90                          	nop
145490122: 48 8b 86 38 05 00 00        	movq	0x538(%rsi), %rax
145490129: 48 89 f9                    	movq	%rdi, %rcx
14549012c: 48 c1 e1 05                 	shlq	$0x5, %rcx
145490130: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
145490138: 48 8b 95 78 01 00 00        	movq	0x178(%rbp), %rdx
14549013f: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
145490144: 48 c7 44 08 10 04 00 00 00  	movq	$0x4, 0x10(%rax,%rcx)
14549014d: 66 c7 44 08 18 d2 02        	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
145490154: 48 ff c7                    	incq	%rdi
145490157: 48 89 be 40 05 00 00        	movq	%rdi, 0x540(%rsi)
14549015e: e8 9d 20 b7 fa              	callq	0x140002200 <.text+0x1200>
145490163: b9 01 00 00 00              	movl	$0x1, %ecx
145490168: ba 01 00 00 00              	movl	$0x1, %edx
14549016d: e8 4e 20 b7 fa              	callq	0x1400021c0 <.text+0x11c0>
145490172: 48 85 c0                    	testq	%rax, %rax
145490175: 0f 84 90 02 00 00           	je	0x14549040b <.text+0x548f40b>
14549017b: c6 00 7b                    	movb	$0x7b, (%rax)
14549017e: 48 c7 45 d8 01 00 00 00     	movq	$0x1, -0x28(%rbp)
145490186: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
14549018a: 48 c7 45 e8 01 00 00 00     	movq	$0x1, -0x18(%rbp)
145490192: c6 45 f0 01                 	movb	$0x1, -0x10(%rbp)
145490196: 48 8d 05 ae 4e 61 01        	leaq	0x1614eae(%rip), %rax   # 0x146aa504b
14549019d: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454901a2: 48 c7 44 24 28 04 00 00 00  	movq	$0x4, 0x28(%rsp)
1454901ab: 4c 8d 05 77 55 61 01        	leaq	0x1615577(%rip), %r8    # 0x146aa5729
1454901b2: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
1454901b9: 48 8d 55 d8                 	leaq	-0x28(%rbp), %rdx
1454901bd: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1454901c3: e8 48 cc fa ff              	callq	0x14543ce10 <.text+0x543be10>
1454901c8: 48 8b 85 88 01 00 00        	movq	0x188(%rbp), %rax
1454901cf: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1454901d3: 48 8d 05 26 22 24 00        	leaq	0x242226(%rip), %rax    # 0x1456d2400 <.text+0x56d1400>
1454901da: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1454901de: c6 85 97 01 00 00 01        	movb	$0x1, 0x197(%rbp)
1454901e5: 48 8d 15 0d e2 22 01        	leaq	0x122e20d(%rip), %rdx   # 0x1466be3f9
1454901ec: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1454901f0: 4c 8d 45 c0                 	leaq	-0x40(%rbp), %r8
1454901f4: e8 47 01 23 00              	callq	0x1456c0340 <.text+0x56bf340>
1454901f9: 90                          	nop
1454901fa: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
1454901fe: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
145490202: 48 89 8d 88 01 00 00        	movq	%rcx, 0x188(%rbp)
145490209: e8 22 4c fa ff              	callq	0x145434e30 <.text+0x5433e30>
14549020e: 90                          	nop
14549020f: 49 89 c6                    	movq	%rax, %r14
145490212: 48 89 d3                    	movq	%rdx, %rbx
145490215: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
145490219: 48 85 d2                    	testq	%rdx, %rdx
14549021c: 74 12                       	je	0x145490230 <.text+0x548f230>
14549021e: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145490224: 48 8b 8d 88 01 00 00        	movq	0x188(%rbp), %rcx
14549022b: e8 a0 1f b7 fa              	callq	0x1400021d0 <.text+0x11d0>
145490230: 4d 85 f6                    	testq	%r14, %r14
145490233: 48 8b 85 80 01 00 00        	movq	0x180(%rbp), %rax
14549023a: 49 0f 45 c6                 	cmovneq	%r14, %rax
14549023e: 48 0f 44 9d 30 01 00 00     	cmoveq	0x130(%rbp), %rbx
145490246: c6 85 97 01 00 00 00        	movb	$0x0, 0x197(%rbp)
14549024d: 48 89 5c 24 28              	movq	%rbx, 0x28(%rsp)
145490252: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
145490257: 4c 8d 05 a0 54 61 01        	leaq	0x16154a0(%rip), %r8    # 0x146aa56fe
14549025e: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
145490262: 48 8d 95 50 01 00 00        	leaq	0x150(%rbp), %rdx
145490269: 41 b9 04 00 00 00           	movl	$0x4, %r9d
14549026f: e8 9c cb fa ff              	callq	0x14543ce10 <.text+0x543be10>
145490274: 90                          	nop
145490275: 41 8a 5c 24 54              	movb	0x54(%r12), %bl
14549027a: 48 8d 15 ce 4d 61 01        	leaq	0x1614dce(%rip), %rdx   # 0x146aa504f
145490281: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
145490285: 41 b8 05 00 00 00           	movl	$0x5, %r8d
14549028b: e8 d0 c8 fa ff              	callq	0x14543cb60 <.text+0x543bb60>
145490290: 90                          	nop
145490291: 0f b6 fb                    	movzbl	%bl, %edi
145490294: 48 83 f7 05                 	xorq	$0x5, %rdi
145490298: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14549029c: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1454902a0: 48 29 c8                    	subq	%rcx, %rax
1454902a3: 48 39 c7                    	cmpq	%rax, %rdi
1454902a6: 0f 87 f5 00 00 00           	ja	0x1454903a1 <.text+0x548f3a1>
1454902ac: 48 8d 05 4d ef 3f 01        	leaq	0x13fef4d(%rip), %rax   # 0x14688f200
1454902b3: 48 8d 15 41 ef 3f 01        	leaq	0x13fef41(%rip), %rdx   # 0x14688f1fb
1454902ba: 84 db                       	testb	%bl, %bl
1454902bc: 48 0f 45 d0                 	cmovneq	%rax, %rdx
1454902c0: 48 03 4d e0                 	addq	-0x20(%rbp), %rcx
1454902c4: 49 89 f8                    	movq	%rdi, %r8
1454902c7: e8 bf ae 27 00              	callq	0x14570b18b <.text+0x570a18b>
1454902cc: 48 01 7d e8                 	addq	%rdi, -0x18(%rbp)
1454902d0: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
1454902d4: 0f 29 85 50 01 00 00        	movaps	%xmm0, 0x150(%rbp)
1454902db: 0f 10 45 e8                 	movups	-0x18(%rbp), %xmm0
1454902df: 0f 29 85 60 01 00 00        	movaps	%xmm0, 0x160(%rbp)
1454902e6: 48 8b bd 60 01 00 00        	movq	0x160(%rbp), %rdi
1454902ed: 48 8b 85 50 01 00 00        	movq	0x150(%rbp), %rax
1454902f4: 48 39 f8                    	cmpq	%rdi, %rax
1454902f7: 0f 84 cc 00 00 00           	je	0x1454903c9 <.text+0x548f3c9>
1454902fd: 48 89 85 88 01 00 00        	movq	%rax, 0x188(%rbp)
145490304: 48 8b 85 58 01 00 00        	movq	0x158(%rbp), %rax
14549030b: 48 89 85 80 01 00 00        	movq	%rax, 0x180(%rbp)
145490312: c6 04 38 7d                 	movb	$0x7d, (%rax,%rdi)
145490316: 48 8b 9e 58 05 00 00        	movq	0x558(%rsi), %rbx
14549031d: 48 3b 9e 48 05 00 00        	cmpq	0x548(%rsi), %rbx
145490324: 75 0d                       	jne	0x145490333 <.text+0x548f333>
145490326: 48 8d 8e 48 05 00 00        	leaq	0x548(%rsi), %rcx
14549032d: e8 1e b4 27 00              	callq	0x14570b750 <.text+0x570a750>
145490332: 90                          	nop
145490333: 48 ff c7                    	incq	%rdi
145490336: 48 8b 86 50 05 00 00        	movq	0x550(%rsi), %rax
14549033d: 48 8d 0c 5b                 	leaq	(%rbx,%rbx,2), %rcx
145490341: 48 8b 95 88 01 00 00        	movq	0x188(%rbp), %rdx
145490348: 48 89 14 c8                 	movq	%rdx, (%rax,%rcx,8)
14549034c: 48 8b 95 80 01 00 00        	movq	0x180(%rbp), %rdx
145490353: 48 89 54 c8 08              	movq	%rdx, 0x8(%rax,%rcx,8)
145490358: 48 89 7c c8 10              	movq	%rdi, 0x10(%rax,%rcx,8)
14549035d: 48 ff c3                    	incq	%rbx
145490360: 48 89 9e 58 05 00 00        	movq	%rbx, 0x558(%rsi)
145490367: 0f 28 b5 a0 01 00 00        	movaps	0x1a0(%rbp), %xmm6
14549036e: 0f 28 bd b0 01 00 00        	movaps	0x1b0(%rbp), %xmm7
145490375: 44 0f 28 85 c0 01 00 00     	movaps	0x1c0(%rbp), %xmm8
14549037d: 44 0f 28 8d d0 01 00 00     	movaps	0x1d0(%rbp), %xmm9
145490385: 44 0f 28 95 e0 01 00 00     	movaps	0x1e0(%rbp), %xmm10
14549038d: 48 81 c4 78 02 00 00        	addq	$0x278, %rsp            # imm = 0x278
145490394: 5b                          	popq	%rbx
145490395: 5f                          	popq	%rdi
145490396: 5e                          	popq	%rsi
145490397: 41 5c                       	popq	%r12
145490399: 41 5d                       	popq	%r13
14549039b: 41 5e                       	popq	%r14
14549039d: 41 5f                       	popq	%r15
14549039f: 5d                          	popq	%rbp
1454903a0: c3                          	retq
1454903a1: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454903aa: 48 89 ca                    	movq	%rcx, %rdx
1454903ad: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1454903b1: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1454903b7: 49 89 f8                    	movq	%rdi, %r8
1454903ba: e8 11 b2 27 00              	callq	0x14570b5d0 <.text+0x570a5d0>
1454903bf: 90                          	nop
1454903c0: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1454903c4: e9 e3 fe ff ff              	jmp	0x1454902ac <.text+0x548f2ac>
1454903c9: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454903d2: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
1454903d9: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454903df: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1454903e5: 48 89 fa                    	movq	%rdi, %rdx
1454903e8: e8 e3 b1 27 00              	callq	0x14570b5d0 <.text+0x570a5d0>
1454903ed: 90                          	nop
1454903ee: 48 8b 85 50 01 00 00        	movq	0x150(%rbp), %rax
1454903f5: e9 03 ff ff ff              	jmp	0x1454902fd <.text+0x548f2fd>
1454903fa: b9 01 00 00 00              	movl	$0x1, %ecx
1454903ff: ba 20 00 00 00              	movl	$0x20, %edx
145490404: e8 e2 9a 40 00              	callq	0x145899eeb <.text+0x5898eeb>
145490409: 0f 0b                       	ud2
14549040b: b9 01 00 00 00              	movl	$0x1, %ecx
145490410: ba 01 00 00 00              	movl	$0x1, %edx
145490415: e8 d1 9a 40 00              	callq	0x145899eeb <.text+0x5898eeb>
14549041a: 0f 0b                       	ud2
14549041c: b9 04 00 00 00              	movl	$0x4, %ecx
145490421: 4c 89 f2                    	movq	%r14, %rdx
145490424: e8 c2 9a 40 00              	callq	0x145899eeb <.text+0x5898eeb>
145490429: 0f 0b                       	ud2
