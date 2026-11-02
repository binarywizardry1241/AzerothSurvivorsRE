
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455267d0: 55                          	pushq	%rbp
1455267d1: 41 57                       	pushq	%r15
1455267d3: 41 56                       	pushq	%r14
1455267d5: 41 54                       	pushq	%r12
1455267d7: 56                          	pushq	%rsi
1455267d8: 57                          	pushq	%rdi
1455267d9: 53                          	pushq	%rbx
1455267da: 48 81 ec 90 00 00 00        	subq	$0x90, %rsp
1455267e1: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1455267e9: 44 0f 29 4d 00              	movaps	%xmm9, (%rbp)
1455267ee: 44 0f 29 45 f0              	movaps	%xmm8, -0x10(%rbp)
1455267f3: 0f 29 7d e0                 	movaps	%xmm7, -0x20(%rbp)
1455267f7: 0f 29 75 d0                 	movaps	%xmm6, -0x30(%rbp)
1455267fb: 48 c7 45 c8 fe ff ff ff     	movq	$-0x2, -0x38(%rbp)
145526803: 48 89 ce                    	movq	%rcx, %rsi
145526806: 4c 8b 3a                    	movq	(%rdx), %r15
145526809: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
14552680d: 4d 39 f7                    	cmpq	%r14, %r15
145526810: 74 31                       	je	0x145526843 <.text+0x5525843>
145526812: 49 81 c7 60 01 00 00        	addq	$0x160, %r15            # imm = 0x160
145526819: 0f 1f 80 00 00 00 00        	nopl	(%rax)
145526820: 41 83 bf 08 ff ff ff 00     	cmpl	$0x0, -0xf8(%r15)
145526828: 74 35                       	je	0x14552685f <.text+0x552585f>
14552682a: 49 8d 87 a0 fe ff ff        	leaq	-0x160(%r15), %rax
145526831: 49 81 c7 60 01 00 00        	addq	$0x160, %r15            # imm = 0x160
145526838: 48 05 60 01 00 00           	addq	$0x160, %rax            # imm = 0x160
14552683e: 4c 39 f0                    	cmpq	%r14, %rax
145526841: 75 dd                       	jne	0x145526820 <.text+0x5525820>
145526843: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14552684a: 48 c7 46 08 04 00 00 00     	movq	$0x4, 0x8(%rsi)
145526852: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14552685a: e9 c2 01 00 00              	jmp	0x145526a21 <.text+0x5525a21>
14552685f: 4c 89 3a                    	movq	%r15, (%rdx)
145526862: 4c 8b 62 10                 	movq	0x10(%rdx), %r12
145526866: f3 41 0f 10 4f c8           	movss	-0x38(%r15), %xmm1
14552686c: 0f 57 c0                    	xorps	%xmm0, %xmm0
14552686f: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
145526872: 73 53                       	jae	0x1455268c7 <.text+0x55258c7>
145526874: f3 41 0f 10 14 24           	movss	(%r12), %xmm2
14552687a: f3 41 0f 5c 57 c4           	subss	-0x3c(%r15), %xmm2
145526880: f3 0f 5e d1                 	divss	%xmm1, %xmm2
145526884: f3 0f 5f c2                 	maxss	%xmm2, %xmm0
145526888: f3 0f 10 0d f0 4b 3c 00     	movss	0x3c4bf0(%rip), %xmm1   # 0x1458eb480
145526890: f3 0f 5d c8                 	minss	%xmm0, %xmm1
145526894: f2 41 0f 10 47 ac           	movsd	-0x54(%r15), %xmm0
14552689a: f2 41 0f 10 57 b8           	movsd	-0x48(%r15), %xmm2
1455268a0: 0f 5c d0                    	subps	%xmm0, %xmm2
1455268a3: f3 0f 12 f1                 	movsldup	%xmm1, %xmm6            # xmm6 = xmm1[0,0,2,2]
1455268a7: 0f 59 f2                    	mulps	%xmm2, %xmm6
1455268aa: 0f 58 f0                    	addps	%xmm0, %xmm6
1455268ad: f3 41 0f 10 47 b4           	movss	-0x4c(%r15), %xmm0
1455268b3: f3 41 0f 10 7f c0           	movss	-0x40(%r15), %xmm7
1455268b9: f3 0f 5c f8                 	subss	%xmm0, %xmm7
1455268bd: f3 0f 59 f9                 	mulss	%xmm1, %xmm7
1455268c1: f3 0f 58 f8                 	addss	%xmm0, %xmm7
1455268c5: eb 0c                       	jmp	0x1455268d3 <.text+0x55258d3>
1455268c7: f2 41 0f 10 77 b8           	movsd	-0x48(%r15), %xmm6
1455268cd: f3 41 0f 10 7f c0           	movss	-0x40(%r15), %xmm7
1455268d3: e8 28 b9 ad fa              	callq	0x140002200 <.text+0x1200>
1455268d8: b9 30 00 00 00              	movl	$0x30, %ecx
1455268dd: ba 04 00 00 00              	movl	$0x4, %edx
1455268e2: e8 d9 b8 ad fa              	callq	0x1400021c0 <.text+0x11c0>
1455268e7: 48 85 c0                    	testq	%rax, %rax
1455268ea: 0f 84 58 01 00 00           	je	0x145526a48 <.text+0x5525a48>
1455268f0: 0f 13 30                    	movlps	%xmm6, (%rax)
1455268f3: f3 0f 11 78 08              	movss	%xmm7, 0x8(%rax)
1455268f8: 48 c7 45 b0 04 00 00 00     	movq	$0x4, -0x50(%rbp)
145526900: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
145526904: 48 c7 45 c0 01 00 00 00     	movq	$0x1, -0x40(%rbp)
14552690c: 4d 39 f7                    	cmpq	%r14, %r15
14552690f: 0f 84 f5 00 00 00           	je	0x145526a0a <.text+0x5525a0a>
145526915: bf 01 00 00 00              	movl	$0x1, %edi
14552691a: 0f 57 f6                    	xorps	%xmm6, %xmm6
14552691d: f3 0f 10 3d 5b 4b 3c 00     	movss	0x3c4b5b(%rip), %xmm7   # 0x1458eb480
145526925: 48 8d 5d b0                 	leaq	-0x50(%rbp), %rbx
145526929: 49 81 c7 60 01 00 00        	addq	$0x160, %r15            # imm = 0x160
145526930: 41 83 bf 08 ff ff ff 00     	cmpl	$0x0, -0xf8(%r15)
145526938: 74 11                       	je	0x14552694b <.text+0x552594b>
14552693a: 4d 39 f7                    	cmpq	%r14, %r15
14552693d: 4d 8d bf 60 01 00 00        	leaq	0x160(%r15), %r15
145526944: 75 ea                       	jne	0x145526930 <.text+0x5525930>
145526946: e9 bf 00 00 00              	jmp	0x145526a0a <.text+0x5525a0a>
14552694b: f3 41 0f 10 47 c8           	movss	-0x38(%r15), %xmm0
145526951: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
145526954: 73 5d                       	jae	0x1455269b3 <.text+0x55259b3>
145526956: f3 41 0f 10 0c 24           	movss	(%r12), %xmm1
14552695c: f3 41 0f 5c 4f c4           	subss	-0x3c(%r15), %xmm1
145526962: f3 0f 5e c8                 	divss	%xmm0, %xmm1
145526966: 0f 57 c0                    	xorps	%xmm0, %xmm0
145526969: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
14552696d: 0f 28 cf                    	movaps	%xmm7, %xmm1
145526970: f3 0f 5d c8                 	minss	%xmm0, %xmm1
145526974: f2 41 0f 10 47 ac           	movsd	-0x54(%r15), %xmm0
14552697a: f2 41 0f 10 57 b8           	movsd	-0x48(%r15), %xmm2
145526980: 0f 5c d0                    	subps	%xmm0, %xmm2
145526983: f3 44 0f 12 c1              	movsldup	%xmm1, %xmm8            # xmm8 = xmm1[0,0,2,2]
145526988: 44 0f 59 c2                 	mulps	%xmm2, %xmm8
14552698c: 44 0f 58 c0                 	addps	%xmm0, %xmm8
145526990: f3 41 0f 10 47 b4           	movss	-0x4c(%r15), %xmm0
145526996: f3 45 0f 10 4f c0           	movss	-0x40(%r15), %xmm9
14552699c: f3 44 0f 5c c8              	subss	%xmm0, %xmm9
1455269a1: f3 44 0f 59 c9              	mulss	%xmm1, %xmm9
1455269a6: f3 44 0f 58 c8              	addss	%xmm0, %xmm9
1455269ab: 48 3b 7d b0                 	cmpq	-0x50(%rbp), %rdi
1455269af: 74 14                       	je	0x1455269c5 <.text+0x55259c5>
1455269b1: eb 37                       	jmp	0x1455269ea <.text+0x55259ea>
1455269b3: f2 45 0f 10 47 b8           	movsd	-0x48(%r15), %xmm8
1455269b9: f3 45 0f 10 4f c0           	movss	-0x40(%r15), %xmm9
1455269bf: 48 3b 7d b0                 	cmpq	-0x50(%rbp), %rdi
1455269c3: 75 25                       	jne	0x1455269ea <.text+0x55259ea>
1455269c5: 48 c7 44 24 20 0c 00 00 00  	movq	$0xc, 0x20(%rsp)
1455269ce: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1455269d4: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1455269da: 48 89 d9                    	movq	%rbx, %rcx
1455269dd: 48 89 fa                    	movq	%rdi, %rdx
1455269e0: e8 5b 13 23 00              	callq	0x145757d40 <.text+0x5756d40>
1455269e5: 90                          	nop
1455269e6: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1455269ea: 48 8d 0c 7f                 	leaq	(%rdi,%rdi,2), %rcx
1455269ee: 44 0f 13 04 88              	movlps	%xmm8, (%rax,%rcx,4)
1455269f3: f3 44 0f 11 4c 88 08        	movss	%xmm9, 0x8(%rax,%rcx,4)
1455269fa: 48 ff c7                    	incq	%rdi
1455269fd: 48 89 7d c0                 	movq	%rdi, -0x40(%rbp)
145526a01: 4d 39 f7                    	cmpq	%r14, %r15
145526a04: 0f 85 1f ff ff ff           	jne	0x145526929 <.text+0x5525929>
145526a0a: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
145526a0e: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
145526a12: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
145526a16: 48 89 06                    	movq	%rax, (%rsi)
145526a19: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
145526a1d: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
145526a21: 48 89 f0                    	movq	%rsi, %rax
145526a24: 0f 28 75 d0                 	movaps	-0x30(%rbp), %xmm6
145526a28: 0f 28 7d e0                 	movaps	-0x20(%rbp), %xmm7
145526a2c: 44 0f 28 45 f0              	movaps	-0x10(%rbp), %xmm8
145526a31: 44 0f 28 4d 00              	movaps	(%rbp), %xmm9
145526a36: 48 81 c4 90 00 00 00        	addq	$0x90, %rsp
145526a3d: 5b                          	popq	%rbx
145526a3e: 5f                          	popq	%rdi
145526a3f: 5e                          	popq	%rsi
145526a40: 41 5c                       	popq	%r12
145526a42: 41 5e                       	popq	%r14
145526a44: 41 5f                       	popq	%r15
145526a46: 5d                          	popq	%rbp
145526a47: c3                          	retq
145526a48: b9 04 00 00 00              	movl	$0x4, %ecx
145526a4d: ba 30 00 00 00              	movl	$0x30, %edx
145526a52: e8 c4 07 3c 00              	callq	0x1458e721b <.text+0x58e621b>
145526a57: 0f 0b                       	ud2
