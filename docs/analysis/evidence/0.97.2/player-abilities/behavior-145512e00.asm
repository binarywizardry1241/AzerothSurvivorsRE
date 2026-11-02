
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145512e00: 41 57                       	pushq	%r15
145512e02: 41 56                       	pushq	%r14
145512e04: 41 55                       	pushq	%r13
145512e06: 41 54                       	pushq	%r12
145512e08: 56                          	pushq	%rsi
145512e09: 57                          	pushq	%rdi
145512e0a: 55                          	pushq	%rbp
145512e0b: 53                          	pushq	%rbx
145512e0c: 48 81 ec 18 01 00 00        	subq	$0x118, %rsp            # imm = 0x118
145512e13: 44 0f 29 bc 24 00 01 00 00  	movaps	%xmm15, 0x100(%rsp)
145512e1c: 44 0f 29 b4 24 f0 00 00 00  	movaps	%xmm14, 0xf0(%rsp)
145512e25: 44 0f 29 ac 24 e0 00 00 00  	movaps	%xmm13, 0xe0(%rsp)
145512e2e: 44 0f 29 a4 24 d0 00 00 00  	movaps	%xmm12, 0xd0(%rsp)
145512e37: 66 44 0f 7f 9c 24 c0 00 00 00       	movdqa	%xmm11, 0xc0(%rsp)
145512e41: 44 0f 29 94 24 b0 00 00 00  	movaps	%xmm10, 0xb0(%rsp)
145512e4a: 44 0f 29 8c 24 a0 00 00 00  	movaps	%xmm9, 0xa0(%rsp)
145512e53: 44 0f 29 84 24 90 00 00 00  	movaps	%xmm8, 0x90(%rsp)
145512e5c: 0f 29 bc 24 80 00 00 00     	movaps	%xmm7, 0x80(%rsp)
145512e64: 0f 29 74 24 70              	movaps	%xmm6, 0x70(%rsp)
145512e69: 48 89 c8                    	movq	%rcx, %rax
145512e6c: 48 8b 72 18                 	movq	0x18(%rdx), %rsi
145512e70: 48 8b 4a 20                 	movq	0x20(%rdx), %rcx
145512e74: 4c 8b 4a 28                 	movq	0x28(%rdx), %r9
145512e78: 4d 8b 50 10                 	movq	0x10(%r8), %r10
145512e7c: 4c 89 54 24 10              	movq	%r10, 0x10(%rsp)
145512e81: 41 0f 10 00                 	movups	(%r8), %xmm0
145512e85: 0f 29 04 24                 	movaps	%xmm0, (%rsp)
145512e89: 4c 8b 52 10                 	movq	0x10(%rdx), %r10
145512e8d: 4c 8b 02                    	movq	(%rdx), %r8
145512e90: 48 8b 52 08                 	movq	0x8(%rdx), %rdx
145512e94: 4c 29 c2                    	subq	%r8, %rdx
145512e97: 48 c1 ea 03                 	shrq	$0x3, %rdx
145512e9b: 4c 39 d2                    	cmpq	%r10, %rdx
145512e9e: 49 0f 43 d2                 	cmovaeq	%r10, %rdx
145512ea2: 48 85 d2                    	testq	%rdx, %rdx
145512ea5: 0f 84 ae 02 00 00           	je	0x145513159 <.text+0x5512159>
145512eab: 4c 8d 54 24 58              	leaq	0x58(%rsp), %r10
145512eb0: f3 0f 10 86 e4 08 00 00     	movss	0x8e4(%rsi), %xmm0
145512eb8: 4c 8b 9e c8 04 00 00        	movq	0x4c8(%rsi), %r11
145512ebf: 48 69 b6 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rsi), %rsi # imm = 0x160
145512eca: 31 ff                       	xorl	%edi, %edi
145512ecc: 0f 57 c9                    	xorps	%xmm1, %xmm1
145512ecf: 48 8d 5c 24 40              	leaq	0x40(%rsp), %rbx
145512ed4: 0f 28 1d 05 9c 3e 00        	movaps	0x3e9c05(%rip), %xmm3   # 0x1458fcae0
145512edb: eb 32                       	jmp	0x145512f0f <.text+0x5511f0f>
145512edd: 0f 1f 00                    	nopl	(%rax)
145512ee0: 4c 8b 74 24 10              	movq	0x10(%rsp), %r14
145512ee5: 4c 89 74 24 30              	movq	%r14, 0x30(%rsp)
145512eea: 0f 28 14 24                 	movaps	(%rsp), %xmm2
145512eee: 0f 29 54 24 20              	movaps	%xmm2, 0x20(%rsp)
145512ef3: 4c 8b 74 24 30              	movq	0x30(%rsp), %r14
145512ef8: 4c 89 74 24 10              	movq	%r14, 0x10(%rsp)
145512efd: 0f 28 54 24 20              	movaps	0x20(%rsp), %xmm2
145512f02: 0f 29 14 24                 	movaps	%xmm2, (%rsp)
145512f06: 48 39 d7                    	cmpq	%rdx, %rdi
145512f09: 0f 84 4a 02 00 00           	je	0x145513159 <.text+0x5512159>
145512f0f: 4d 8b 3c f8                 	movq	(%r8,%rdi,8), %r15
145512f13: 48 ff c7                    	incq	%rdi
145512f16: 45 31 f6                    	xorl	%r14d, %r14d
145512f19: 4d 89 dc                    	movq	%r11, %r12
145512f1c: 0f 1f 40 00                 	nopl	(%rax)
145512f20: 4c 39 f6                    	cmpq	%r14, %rsi
145512f23: 74 bb                       	je	0x145512ee0 <.text+0x5511ee0>
145512f25: 49 81 c6 60 01 00 00        	addq	$0x160, %r14            # imm = 0x160
145512f2c: 4d 39 bc 24 88 00 00 00     	cmpq	%r15, 0x88(%r12)
145512f34: 4d 8d a4 24 60 01 00 00     	leaq	0x160(%r12), %r12
145512f3c: 75 e2                       	jne	0x145512f20 <.text+0x5511f20>
145512f3e: f3 43 0f 10 64 33 c8        	movss	-0x38(%r11,%r14), %xmm4
145512f45: 0f 2e cc                    	ucomiss	%xmm4, %xmm1
145512f48: 0f 83 82 00 00 00           	jae	0x145512fd0 <.text+0x5511fd0>
145512f4e: 0f 28 e8                    	movaps	%xmm0, %xmm5
145512f51: f3 43 0f 5c 6c 33 c4        	subss	-0x3c(%r11,%r14), %xmm5
145512f58: f3 0f 5e ec                 	divss	%xmm4, %xmm5
145512f5c: 0f 57 e4                    	xorps	%xmm4, %xmm4
145512f5f: f3 0f 5f e5                 	maxss	%xmm5, %xmm4
145512f63: f3 0f 10 35 15 85 3d 00     	movss	0x3d8515(%rip), %xmm6   # 0x1458eb480
145512f6b: f3 0f 5d f4                 	minss	%xmm4, %xmm6
145512f6f: f2 43 0f 10 6c 33 ac        	movsd	-0x54(%r11,%r14), %xmm5
145512f76: f2 43 0f 10 7c 33 b8        	movsd	-0x48(%r11,%r14), %xmm7
145512f7d: 0f 5c fd                    	subps	%xmm5, %xmm7
145512f80: f3 0f 12 e6                 	movsldup	%xmm6, %xmm4            # xmm4 = xmm6[0,0,2,2]
145512f84: 0f 59 e7                    	mulps	%xmm7, %xmm4
145512f87: 0f 58 e5                    	addps	%xmm5, %xmm4
145512f8a: f3 43 0f 10 7c 33 b4        	movss	-0x4c(%r11,%r14), %xmm7
145512f91: f3 43 0f 10 6c 33 c0        	movss	-0x40(%r11,%r14), %xmm5
145512f98: f3 0f 5c ef                 	subss	%xmm7, %xmm5
145512f9c: f3 0f 59 ee                 	mulss	%xmm6, %xmm5
145512fa0: f3 0f 58 ef                 	addss	%xmm7, %xmm5
145512fa4: 4c 8b 79 10                 	movq	0x10(%rcx), %r15
145512fa8: 4d 85 ff                    	testq	%r15, %r15
145512fab: 74 3a                       	je	0x145512fe7 <.text+0x5511fe7>
145512fad: 4c 8b 61 08                 	movq	0x8(%rcx), %r12
145512fb1: f3 41 0f 10 31              	movss	(%r9), %xmm6
145512fb6: 49 83 ff 05                 	cmpq	$0x5, %r15
145512fba: 73 33                       	jae	0x145512fef <.text+0x5511fef>
145512fbc: 45 31 f6                    	xorl	%r14d, %r14d
145512fbf: 45 31 ed                    	xorl	%r13d, %r13d
145512fc2: e9 15 01 00 00              	jmp	0x1455130dc <.text+0x55120dc>
145512fc7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
145512fd0: f2 43 0f 10 64 33 b8        	movsd	-0x48(%r11,%r14), %xmm4
145512fd7: f3 43 0f 10 6c 33 c0        	movss	-0x40(%r11,%r14), %xmm5
145512fde: 4c 8b 79 10                 	movq	0x10(%rcx), %r15
145512fe2: 4d 85 ff                    	testq	%r15, %r15
145512fe5: 75 c6                       	jne	0x145512fad <.text+0x5511fad>
145512fe7: 45 31 ed                    	xorl	%r13d, %r13d
145512fea: e9 24 01 00 00              	jmp	0x145513113 <.text+0x5512113>
145512fef: 45 89 fd                    	movl	%r15d, %r13d
145512ff2: 41 83 e5 03                 	andl	$0x3, %r13d
145512ff6: 41 be 04 00 00 00           	movl	$0x4, %r14d
145512ffc: 4d 0f 44 ee                 	cmoveq	%r14, %r13
145513000: 4d 89 fe                    	movq	%r15, %r14
145513003: 4d 29 ee                    	subq	%r13, %r14
145513006: f3 44 0f 12 c6              	movsldup	%xmm6, %xmm8            # xmm8 = xmm6[0,0,2,2]
14551300b: f3 44 0f 12 cc              	movsldup	%xmm4, %xmm9            # xmm9 = xmm4[0,0,2,2]
145513010: f3 44 0f 16 d4              	movshdup	%xmm4, %xmm10           # xmm10 = xmm4[1,1,3,3]
145513015: 49 8d 6c 24 28              	leaq	0x28(%r12), %rbp
14551301a: 0f 57 ff                    	xorps	%xmm7, %xmm7
14551301d: 4d 89 f5                    	movq	%r14, %r13
145513020: 66 45 0f ef db              	pxor	%xmm11, %xmm11
145513025: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
145513030: f3 44 0f 10 75 d8           	movss	-0x28(%rbp), %xmm14
145513036: f3 44 0f 10 65 dc           	movss	-0x24(%rbp), %xmm12
14551303c: f3 44 0f 10 6d e4           	movss	-0x1c(%rbp), %xmm13
145513042: 45 0f 14 f5                 	unpcklps	%xmm13, %xmm14          # xmm14 = xmm14[0],xmm13[0],xmm14[1],xmm13[1]
145513046: f3 44 0f 10 6d e8           	movss	-0x18(%rbp), %xmm13
14551304c: 45 0f 14 e5                 	unpcklps	%xmm13, %xmm12          # xmm12 = xmm12[0],xmm13[0],xmm12[1],xmm13[1]
145513050: f3 44 0f 10 6d fc           	movss	-0x4(%rbp), %xmm13
145513056: f3 44 0f 10 7d f0           	movss	-0x10(%rbp), %xmm15
14551305c: 45 0f 14 fd                 	unpcklps	%xmm13, %xmm15          # xmm15 = xmm15[0],xmm13[0],xmm15[1],xmm13[1]
145513060: f3 0f 10 55 00              	movss	(%rbp), %xmm2
145513065: f3 44 0f 10 6d f4           	movss	-0xc(%rbp), %xmm13
14551306b: 44 0f 14 ea                 	unpcklps	%xmm2, %xmm13           # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1]
14551306f: 45 0f 5c f1                 	subps	%xmm9, %xmm14
145513073: 45 0f 5c f9                 	subps	%xmm9, %xmm15
145513077: 45 0f 5c e2                 	subps	%xmm10, %xmm12
14551307b: 45 0f 5c ea                 	subps	%xmm10, %xmm13
14551307f: 45 0f 59 f6                 	mulps	%xmm14, %xmm14
145513083: 45 0f 59 ff                 	mulps	%xmm15, %xmm15
145513087: 45 0f 59 e4                 	mulps	%xmm12, %xmm12
14551308b: 45 0f 58 e6                 	addps	%xmm14, %xmm12
14551308f: 45 0f 59 ed                 	mulps	%xmm13, %xmm13
145513093: 45 0f 58 ef                 	addps	%xmm15, %xmm13
145513097: 45 0f c2 e0 02              	cmpleps	%xmm8, %xmm12
14551309c: 44 0f 14 e0                 	unpcklps	%xmm0, %xmm12           # xmm12 = xmm12[0],xmm0[0],xmm12[1],xmm0[1]
1455130a0: 44 0f 54 e3                 	andps	%xmm3, %xmm12
1455130a4: 66 45 0f d4 dc              	paddq	%xmm12, %xmm11
1455130a9: 45 0f c2 e8 02              	cmpleps	%xmm8, %xmm13
1455130ae: 44 0f 14 e8                 	unpcklps	%xmm0, %xmm13           # xmm13 = xmm13[0],xmm0[0],xmm13[1],xmm0[1]
1455130b2: 44 0f 54 eb                 	andps	%xmm3, %xmm13
1455130b6: 66 41 0f d4 fd              	paddq	%xmm13, %xmm7
1455130bb: 48 83 c5 30                 	addq	$0x30, %rbp
1455130bf: 49 83 c5 fc                 	addq	$-0x4, %r13
1455130c3: 0f 85 67 ff ff ff           	jne	0x145513030 <.text+0x5512030>
1455130c9: 66 41 0f d4 fb              	paddq	%xmm11, %xmm7
1455130ce: 66 0f 70 d7 ee              	pshufd	$0xee, %xmm7, %xmm2     # xmm2 = xmm7[2,3,2,3]
1455130d3: 66 0f d4 d7                 	paddq	%xmm7, %xmm2
1455130d7: 66 49 0f 7e d5              	movq	%xmm2, %r13
1455130dc: 4d 29 f7                    	subq	%r14, %r15
1455130df: 4f 8d 34 76                 	leaq	(%r14,%r14,2), %r14
1455130e3: 4f 8d 34 b4                 	leaq	(%r12,%r14,4), %r14
1455130e7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1455130f0: f2 41 0f 10 16              	movsd	(%r14), %xmm2
1455130f5: 0f 5c d4                    	subps	%xmm4, %xmm2
1455130f8: 0f 59 d2                    	mulps	%xmm2, %xmm2
1455130fb: f3 0f 16 fa                 	movshdup	%xmm2, %xmm7            # xmm7 = xmm2[1,1,3,3]
1455130ff: f3 0f 58 fa                 	addss	%xmm2, %xmm7
145513103: 0f 2e f7                    	ucomiss	%xmm7, %xmm6
145513106: 49 83 dd ff                 	sbbq	$-0x1, %r13
14551310a: 49 83 c6 0c                 	addq	$0xc, %r14
14551310e: 49 ff cf                    	decq	%r15
145513111: 75 dd                       	jne	0x1455130f0 <.text+0x55120f0>
145513113: 0f 28 14 24                 	movaps	(%rsp), %xmm2
145513117: 0f 29 54 24 40              	movaps	%xmm2, 0x40(%rsp)
14551311c: 4c 8b 74 24 10              	movq	0x10(%rsp), %r14
145513121: 4c 89 74 24 50              	movq	%r14, 0x50(%rsp)
145513126: 4c 89 6c 24 58              	movq	%r13, 0x58(%rsp)
14551312b: 0f 13 64 24 60              	movlps	%xmm4, 0x60(%rsp)
145513130: f3 0f 11 6c 24 68           	movss	%xmm5, 0x68(%rsp)
145513136: 4c 39 6c 24 40              	cmpq	%r13, 0x40(%rsp)
14551313b: 4d 89 d6                    	movq	%r10, %r14
14551313e: 4c 0f 47 f3                 	cmovaq	%rbx, %r14
145513142: 41 0f 10 16                 	movups	(%r14), %xmm2
145513146: 0f 29 54 24 20              	movaps	%xmm2, 0x20(%rsp)
14551314b: 4d 8b 76 10                 	movq	0x10(%r14), %r14
14551314f: 4c 89 74 24 30              	movq	%r14, 0x30(%rsp)
145513154: e9 9a fd ff ff              	jmp	0x145512ef3 <.text+0x5511ef3>
145513159: 48 8b 4c 24 10              	movq	0x10(%rsp), %rcx
14551315e: 48 89 48 10                 	movq	%rcx, 0x10(%rax)
145513162: 0f 28 04 24                 	movaps	(%rsp), %xmm0
145513166: 0f 11 00                    	movups	%xmm0, (%rax)
145513169: 0f 28 74 24 70              	movaps	0x70(%rsp), %xmm6
14551316e: 0f 28 bc 24 80 00 00 00     	movaps	0x80(%rsp), %xmm7
145513176: 44 0f 28 84 24 90 00 00 00  	movaps	0x90(%rsp), %xmm8
14551317f: 44 0f 28 8c 24 a0 00 00 00  	movaps	0xa0(%rsp), %xmm9
145513188: 44 0f 28 94 24 b0 00 00 00  	movaps	0xb0(%rsp), %xmm10
145513191: 44 0f 28 9c 24 c0 00 00 00  	movaps	0xc0(%rsp), %xmm11
14551319a: 44 0f 28 a4 24 d0 00 00 00  	movaps	0xd0(%rsp), %xmm12
1455131a3: 44 0f 28 ac 24 e0 00 00 00  	movaps	0xe0(%rsp), %xmm13
1455131ac: 44 0f 28 b4 24 f0 00 00 00  	movaps	0xf0(%rsp), %xmm14
1455131b5: 44 0f 28 bc 24 00 01 00 00  	movaps	0x100(%rsp), %xmm15
1455131be: 48 81 c4 18 01 00 00        	addq	$0x118, %rsp            # imm = 0x118
1455131c5: 5b                          	popq	%rbx
1455131c6: 5d                          	popq	%rbp
1455131c7: 5f                          	popq	%rdi
1455131c8: 5e                          	popq	%rsi
1455131c9: 41 5c                       	popq	%r12
1455131cb: 41 5d                       	popq	%r13
1455131cd: 41 5e                       	popq	%r14
1455131cf: 41 5f                       	popq	%r15
1455131d1: c3                          	retq
