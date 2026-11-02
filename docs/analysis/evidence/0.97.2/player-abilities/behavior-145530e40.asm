
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145530e40: 55                          	pushq	%rbp
145530e41: 41 57                       	pushq	%r15
145530e43: 41 56                       	pushq	%r14
145530e45: 41 55                       	pushq	%r13
145530e47: 41 54                       	pushq	%r12
145530e49: 56                          	pushq	%rsi
145530e4a: 57                          	pushq	%rdi
145530e4b: 53                          	pushq	%rbx
145530e4c: 48 81 ec a8 00 00 00        	subq	$0xa8, %rsp
145530e53: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145530e5b: 44 0f 29 4d 10              	movaps	%xmm9, 0x10(%rbp)
145530e60: 44 0f 29 45 00              	movaps	%xmm8, (%rbp)
145530e65: 0f 29 7d f0                 	movaps	%xmm7, -0x10(%rbp)
145530e69: 0f 29 75 e0                 	movaps	%xmm6, -0x20(%rbp)
145530e6d: 48 c7 45 d8 fe ff ff ff     	movq	$-0x2, -0x28(%rbp)
145530e75: 48 89 ce                    	movq	%rcx, %rsi
145530e78: 4c 8b 3a                    	movq	(%rdx), %r15
145530e7b: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
145530e7f: 4d 39 f7                    	cmpq	%r14, %r15
145530e82: 0f 84 a9 02 00 00           	je	0x145531131 <.text+0x5530131>
145530e88: 48 8b 42 10                 	movq	0x10(%rdx), %rax
145530e8c: 4c 8b 6a 18                 	movq	0x18(%rdx), %r13
145530e90: 48 8b 5a 20                 	movq	0x20(%rdx), %rbx
145530e94: 48 8b 7a 28                 	movq	0x28(%rdx), %rdi
145530e98: 4c 8b 62 30                 	movq	0x30(%rdx), %r12
145530e9c: 49 81 c7 60 01 00 00        	addq	$0x160, %r15            # imm = 0x160
145530ea3: 0f 57 c0                    	xorps	%xmm0, %xmm0
145530ea6: f3 0f 10 35 d2 a5 3b 00     	movss	0x3ba5d2(%rip), %xmm6   # 0x1458eb480
145530eae: f3 0f 10 3d 5a e4 41 00     	movss	0x41e45a(%rip), %xmm7   # 0x14594f310
145530eb6: f3 44 0f 10 05 c9 a5 3b 00  	movss	0x3ba5c9(%rip), %xmm8   # 0x1458eb488
145530ebf: eb 1f                       	jmp	0x145530ee0 <.text+0x552fee0>
145530ec1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
145530ed0: 4d 39 f7                    	cmpq	%r14, %r15
145530ed3: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
145530eda: 0f 84 51 02 00 00           	je	0x145531131 <.text+0x5530131>
145530ee0: 41 80 bf 08 ff ff ff 00     	cmpb	$0x0, -0xf8(%r15)
145530ee8: 75 e6                       	jne	0x145530ed0 <.text+0x552fed0>
145530eea: f3 41 0f 10 4f c8           	movss	-0x38(%r15), %xmm1
145530ef0: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
145530ef3: 73 37                       	jae	0x145530f2c <.text+0x552ff2c>
145530ef5: f3 0f 10 10                 	movss	(%rax), %xmm2
145530ef9: f3 41 0f 5c 57 c4           	subss	-0x3c(%r15), %xmm2
145530eff: f3 0f 5e d1                 	divss	%xmm1, %xmm2
145530f03: 0f 57 c9                    	xorps	%xmm1, %xmm1
145530f06: f3 0f 5f ca                 	maxss	%xmm2, %xmm1
145530f0a: 0f 28 d6                    	movaps	%xmm6, %xmm2
145530f0d: f3 0f 5d d1                 	minss	%xmm1, %xmm2
145530f11: f2 41 0f 10 5f ac           	movsd	-0x54(%r15), %xmm3
145530f17: f2 41 0f 10 67 b8           	movsd	-0x48(%r15), %xmm4
145530f1d: 0f 5c e3                    	subps	%xmm3, %xmm4
145530f20: f3 0f 12 ca                 	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
145530f24: 0f 59 cc                    	mulps	%xmm4, %xmm1
145530f27: 0f 58 cb                    	addps	%xmm3, %xmm1
145530f2a: eb 06                       	jmp	0x145530f32 <.text+0x552ff32>
145530f2c: f2 41 0f 10 4f b8           	movsd	-0x48(%r15), %xmm1
145530f32: f2 41 0f 10 55 00           	movsd	(%r13), %xmm2
145530f38: 0f 5c ca                    	subps	%xmm2, %xmm1
145530f3b: 0f 28 d1                    	movaps	%xmm1, %xmm2
145530f3e: 0f 59 d1                    	mulps	%xmm1, %xmm2
145530f41: f3 0f 16 da                 	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145530f45: f3 0f 58 da                 	addss	%xmm2, %xmm3
145530f49: 0f 57 d2                    	xorps	%xmm2, %xmm2
145530f4c: f3 0f 51 d3                 	sqrtss	%xmm3, %xmm2
145530f50: f3 0f 10 1b                 	movss	(%rbx), %xmm3
145530f54: 0f 2e da                    	ucomiss	%xmm2, %xmm3
145530f57: 0f 82 73 ff ff ff           	jb	0x145530ed0 <.text+0x552fed0>
145530f5d: 0f 2e d7                    	ucomiss	%xmm7, %xmm2
145530f60: 0f 86 6a ff ff ff           	jbe	0x145530ed0 <.text+0x552fed0>
145530f66: f3 41 0f 10 1c 24           	movss	(%r12), %xmm3
145530f6c: f3 0f 10 27                 	movss	(%rdi), %xmm4
145530f70: 0f 14 e3                    	unpcklps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
145530f73: 0f 59 cc                    	mulps	%xmm4, %xmm1
145530f76: f3 0f 16 d9                 	movshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
145530f7a: f3 0f 58 d9                 	addss	%xmm1, %xmm3
145530f7e: f3 0f 5e da                 	divss	%xmm2, %xmm3
145530f82: 41 0f 2e d8                 	ucomiss	%xmm8, %xmm3
145530f86: 0f 86 44 ff ff ff           	jbe	0x145530ed0 <.text+0x552fed0>
145530f8c: 48 89 45 a8                 	movq	%rax, -0x58(%rbp)
145530f90: 4c 89 3a                    	movq	%r15, (%rdx)
145530f93: 49 8b 87 28 ff ff ff        	movq	-0xd8(%r15), %rax
145530f9a: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
145530f9e: e8 5d 12 ad fa              	callq	0x140002200 <.text+0x1200>
145530fa3: b9 20 00 00 00              	movl	$0x20, %ecx
145530fa8: ba 08 00 00 00              	movl	$0x8, %edx
145530fad: e8 0e 12 ad fa              	callq	0x1400021c0 <.text+0x11c0>
145530fb2: 48 85 c0                    	testq	%rax, %rax
145530fb5: 0f 84 b6 01 00 00           	je	0x145531171 <.text+0x5530171>
145530fbb: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
145530fbf: 48 89 08                    	movq	%rcx, (%rax)
145530fc2: 48 c7 45 c0 04 00 00 00     	movq	$0x4, -0x40(%rbp)
145530fca: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
145530fce: 48 c7 45 d0 01 00 00 00     	movq	$0x1, -0x30(%rbp)
145530fd6: 4d 39 f7                    	cmpq	%r14, %r15
145530fd9: 0f 84 39 01 00 00           	je	0x145531118 <.text+0x5530118>
145530fdf: ba 01 00 00 00              	movl	$0x1, %edx
145530fe4: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
145530fe8: 4c 8d 55 c0                 	leaq	-0x40(%rbp), %r10
145530fec: 49 81 c7 60 01 00 00        	addq	$0x160, %r15            # imm = 0x160
145530ff3: eb 1b                       	jmp	0x145531010 <.text+0x5530010>
145530ff5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
145531000: 4d 39 f7                    	cmpq	%r14, %r15
145531003: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
14553100a: 0f 84 08 01 00 00           	je	0x145531118 <.text+0x5530118>
145531010: 41 80 bf 08 ff ff ff 00     	cmpb	$0x0, -0xf8(%r15)
145531018: 75 e6                       	jne	0x145531000 <.text+0x5530000>
14553101a: f3 41 0f 10 47 c8           	movss	-0x38(%r15), %xmm0
145531020: 44 0f 2e c8                 	ucomiss	%xmm0, %xmm9
145531024: 73 3b                       	jae	0x145531061 <.text+0x5530061>
145531026: 48 8b 4d a8                 	movq	-0x58(%rbp), %rcx
14553102a: f3 0f 10 09                 	movss	(%rcx), %xmm1
14553102e: f3 41 0f 5c 4f c4           	subss	-0x3c(%r15), %xmm1
145531034: f3 0f 5e c8                 	divss	%xmm0, %xmm1
145531038: 0f 57 c0                    	xorps	%xmm0, %xmm0
14553103b: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
14553103f: 0f 28 ce                    	movaps	%xmm6, %xmm1
145531042: f3 0f 5d c8                 	minss	%xmm0, %xmm1
145531046: f2 41 0f 10 57 ac           	movsd	-0x54(%r15), %xmm2
14553104c: f2 41 0f 10 5f b8           	movsd	-0x48(%r15), %xmm3
145531052: 0f 5c da                    	subps	%xmm2, %xmm3
145531055: f3 0f 12 c1                 	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
145531059: 0f 59 c3                    	mulps	%xmm3, %xmm0
14553105c: 0f 58 c2                    	addps	%xmm2, %xmm0
14553105f: eb 06                       	jmp	0x145531067 <.text+0x5530067>
145531061: f2 41 0f 10 47 b8           	movsd	-0x48(%r15), %xmm0
145531067: f2 41 0f 10 4d 00           	movsd	(%r13), %xmm1
14553106d: 0f 5c c1                    	subps	%xmm1, %xmm0
145531070: 0f 28 c8                    	movaps	%xmm0, %xmm1
145531073: 0f 59 c8                    	mulps	%xmm0, %xmm1
145531076: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14553107a: f3 0f 58 d1                 	addss	%xmm1, %xmm2
14553107e: 0f 57 c9                    	xorps	%xmm1, %xmm1
145531081: f3 0f 51 ca                 	sqrtss	%xmm2, %xmm1
145531085: f3 0f 10 13                 	movss	(%rbx), %xmm2
145531089: 0f 2e d1                    	ucomiss	%xmm1, %xmm2
14553108c: 0f 82 6e ff ff ff           	jb	0x145531000 <.text+0x5530000>
145531092: 0f 2e cf                    	ucomiss	%xmm7, %xmm1
145531095: 0f 86 65 ff ff ff           	jbe	0x145531000 <.text+0x5530000>
14553109b: f3 41 0f 10 14 24           	movss	(%r12), %xmm2
1455310a1: f3 0f 10 1f                 	movss	(%rdi), %xmm3
1455310a5: 0f 14 da                    	unpcklps	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
1455310a8: 0f 59 c3                    	mulps	%xmm3, %xmm0
1455310ab: f3 0f 16 d0                 	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1455310af: f3 0f 58 d0                 	addss	%xmm0, %xmm2
1455310b3: f3 0f 5e d1                 	divss	%xmm1, %xmm2
1455310b7: 41 0f 2e d0                 	ucomiss	%xmm8, %xmm2
1455310bb: 0f 86 3f ff ff ff           	jbe	0x145531000 <.text+0x5530000>
1455310c1: 49 8b 8f 28 ff ff ff        	movq	-0xd8(%r15), %rcx
1455310c8: 48 89 4d b8                 	movq	%rcx, -0x48(%rbp)
1455310cc: 48 3b 55 c0                 	cmpq	-0x40(%rbp), %rdx
1455310d0: 75 2e                       	jne	0x145531100 <.text+0x5530100>
1455310d2: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1455310db: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1455310e1: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1455310e7: 4c 89 d1                    	movq	%r10, %rcx
1455310ea: 48 89 55 b0                 	movq	%rdx, -0x50(%rbp)
1455310ee: e8 4d 6c 22 00              	callq	0x145757d40 <.text+0x5756d40>
1455310f3: 90                          	nop
1455310f4: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1455310f8: 48 8b 55 b0                 	movq	-0x50(%rbp), %rdx
1455310fc: 4c 8d 55 c0                 	leaq	-0x40(%rbp), %r10
145531100: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
145531104: 48 89 0c d0                 	movq	%rcx, (%rax,%rdx,8)
145531108: 48 ff c2                    	incq	%rdx
14553110b: 48 89 55 d0                 	movq	%rdx, -0x30(%rbp)
14553110f: 4d 39 f7                    	cmpq	%r14, %r15
145531112: 0f 85 d4 fe ff ff           	jne	0x145530fec <.text+0x552ffec>
145531118: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14553111c: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
145531120: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
145531124: 48 89 06                    	movq	%rax, (%rsi)
145531127: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
14553112b: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
14553112f: eb 17                       	jmp	0x145531148 <.text+0x5530148>
145531131: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
145531138: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
145531140: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
145531148: 48 89 f0                    	movq	%rsi, %rax
14553114b: 0f 28 75 e0                 	movaps	-0x20(%rbp), %xmm6
14553114f: 0f 28 7d f0                 	movaps	-0x10(%rbp), %xmm7
145531153: 44 0f 28 45 00              	movaps	(%rbp), %xmm8
145531158: 44 0f 28 4d 10              	movaps	0x10(%rbp), %xmm9
14553115d: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
145531164: 5b                          	popq	%rbx
145531165: 5f                          	popq	%rdi
145531166: 5e                          	popq	%rsi
145531167: 41 5c                       	popq	%r12
145531169: 41 5d                       	popq	%r13
14553116b: 41 5e                       	popq	%r14
14553116d: 41 5f                       	popq	%r15
14553116f: 5d                          	popq	%rbp
145531170: c3                          	retq
145531171: b9 08 00 00 00              	movl	$0x8, %ecx
145531176: ba 20 00 00 00              	movl	$0x20, %edx
14553117b: e8 9b 60 3b 00              	callq	0x1458e721b <.text+0x58e621b>
145531180: 0f 0b                       	ud2
