
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455149f0: 41 57                       	pushq	%r15
1455149f2: 41 56                       	pushq	%r14
1455149f4: 41 54                       	pushq	%r12
1455149f6: 56                          	pushq	%rsi
1455149f7: 57                          	pushq	%rdi
1455149f8: 53                          	pushq	%rbx
1455149f9: 48 89 c8                    	movq	%rcx, %rax
1455149fc: 48 8b 0a                    	movq	(%rdx), %rcx
1455149ff: 4c 8b 4a 08                 	movq	0x8(%rdx), %r9
145514a03: 4c 39 c9                    	cmpq	%r9, %rcx
145514a06: 0f 84 bb 01 00 00           	je	0x145514bc7 <.text+0x5513bc7>
145514a0c: 4c 8b 52 10                 	movq	0x10(%rdx), %r10
145514a10: 4c 8b 5a 18                 	movq	0x18(%rdx), %r11
145514a14: 48 be f8 ff ff ff ff ff ff 0f       	movabsq	$0xffffffffffffff8, %rsi # imm = 0xFFFFFFFFFFFFFF8
145514a1e: 4c 21 de                    	andq	%r11, %rsi
145514a21: 41 c1 e3 03                 	shll	$0x3, %r11d
145514a25: 41 83 e3 38                 	andl	$0x38, %r11d
145514a29: 48 8b 7a 20                 	movq	0x20(%rdx), %rdi
145514a2d: 48 8b 5a 28                 	movq	0x28(%rdx), %rbx
145514a31: 4d 8b 00                    	movq	(%r8), %r8
145514a34: 0f 57 c0                    	xorps	%xmm0, %xmm0
145514a37: f3 0f 10 0d 41 6a 3d 00     	movss	0x3d6a41(%rip), %xmm1   # 0x1458eb480
145514a3f: eb 38                       	jmp	0x145514a79 <.text+0x5513a79>
145514a41: f2 41 0f 10 97 18 01 00 00  	movsd	0x118(%r15), %xmm2
145514a4a: f2 0f 10 1b                 	movsd	(%rbx), %xmm3
145514a4e: 0f 5c d3                    	subps	%xmm3, %xmm2
145514a51: 0f 59 d2                    	mulps	%xmm2, %xmm2
145514a54: f3 0f 16 da                 	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145514a58: f3 0f 58 da                 	addss	%xmm2, %xmm3
145514a5c: f3 41 0f 10 10              	movss	(%r8), %xmm2
145514a61: 0f 2e d3                    	ucomiss	%xmm3, %xmm2
145514a64: 0f 83 6c 01 00 00           	jae	0x145514bd6 <.text+0x5513bd6>
145514a6a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
145514a70: 4c 39 c9                    	cmpq	%r9, %rcx
145514a73: 0f 84 4b 01 00 00           	je	0x145514bc4 <.text+0x5513bc4>
145514a79: 49 89 cf                    	movq	%rcx, %r15
145514a7c: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
145514a83: 41 80 7f 68 00              	cmpb	$0x0, 0x68(%r15)
145514a88: 75 e6                       	jne	0x145514a70 <.text+0x5513a70>
145514a8a: 4d 8b b7 88 00 00 00        	movq	0x88(%r15), %r14
145514a91: 45 31 e4                    	xorl	%r12d, %r12d
145514a94: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
145514aa0: 4c 39 e6                    	cmpq	%r12, %rsi
145514aa3: 74 3e                       	je	0x145514ae3 <.text+0x5513ae3>
145514aa5: 4f 39 34 e2                 	cmpq	%r14, (%r10,%r12,8)
145514aa9: 74 c5                       	je	0x145514a70 <.text+0x5513a70>
145514aab: 4f 39 74 e2 08              	cmpq	%r14, 0x8(%r10,%r12,8)
145514ab0: 74 be                       	je	0x145514a70 <.text+0x5513a70>
145514ab2: 4f 39 74 e2 10              	cmpq	%r14, 0x10(%r10,%r12,8)
145514ab7: 74 b7                       	je	0x145514a70 <.text+0x5513a70>
145514ab9: 4f 39 74 e2 18              	cmpq	%r14, 0x18(%r10,%r12,8)
145514abe: 74 b0                       	je	0x145514a70 <.text+0x5513a70>
145514ac0: 4f 39 74 e2 20              	cmpq	%r14, 0x20(%r10,%r12,8)
145514ac5: 74 a9                       	je	0x145514a70 <.text+0x5513a70>
145514ac7: 4f 39 74 e2 28              	cmpq	%r14, 0x28(%r10,%r12,8)
145514acc: 74 a2                       	je	0x145514a70 <.text+0x5513a70>
145514ace: 4f 39 74 e2 30              	cmpq	%r14, 0x30(%r10,%r12,8)
145514ad3: 74 9b                       	je	0x145514a70 <.text+0x5513a70>
145514ad5: 4f 39 74 e2 38              	cmpq	%r14, 0x38(%r10,%r12,8)
145514ada: 4d 8d 64 24 08              	leaq	0x8(%r12), %r12
145514adf: 75 bf                       	jne	0x145514aa0 <.text+0x5513aa0>
145514ae1: eb 8d                       	jmp	0x145514a70 <.text+0x5513a70>
145514ae3: 4d 85 db                    	testq	%r11, %r11
145514ae6: 74 0c                       	je	0x145514af4 <.text+0x5513af4>
145514ae8: 4d 39 34 f2                 	cmpq	%r14, (%r10,%rsi,8)
145514aec: 74 82                       	je	0x145514a70 <.text+0x5513a70>
145514aee: 41 83 fb 08                 	cmpl	$0x8, %r11d
145514af2: 75 55                       	jne	0x145514b49 <.text+0x5513b49>
145514af4: f3 41 0f 10 97 28 01 00 00  	movss	0x128(%r15), %xmm2
145514afd: 0f 2e c2                    	ucomiss	%xmm2, %xmm0
145514b00: 0f 83 3b ff ff ff           	jae	0x145514a41 <.text+0x5513a41>
145514b06: f3 0f 10 1f                 	movss	(%rdi), %xmm3
145514b0a: f3 41 0f 5c 9f 24 01 00 00  	subss	0x124(%r15), %xmm3
145514b13: f3 0f 5e da                 	divss	%xmm2, %xmm3
145514b17: 0f 57 d2                    	xorps	%xmm2, %xmm2
145514b1a: f3 0f 5f d3                 	maxss	%xmm3, %xmm2
145514b1e: 0f 28 d9                    	movaps	%xmm1, %xmm3
145514b21: f3 0f 5d da                 	minss	%xmm2, %xmm3
145514b25: f2 41 0f 10 a7 0c 01 00 00  	movsd	0x10c(%r15), %xmm4
145514b2e: f2 41 0f 10 af 18 01 00 00  	movsd	0x118(%r15), %xmm5
145514b37: 0f 5c ec                    	subps	%xmm4, %xmm5
145514b3a: f3 0f 12 d3                 	movsldup	%xmm3, %xmm2            # xmm2 = xmm3[0,0,2,2]
145514b3e: 0f 59 d5                    	mulps	%xmm5, %xmm2
145514b41: 0f 58 d4                    	addps	%xmm4, %xmm2
145514b44: e9 01 ff ff ff              	jmp	0x145514a4a <.text+0x5513a4a>
145514b49: 4d 39 74 f2 08              	cmpq	%r14, 0x8(%r10,%rsi,8)
145514b4e: 0f 84 1c ff ff ff           	je	0x145514a70 <.text+0x5513a70>
145514b54: 41 83 fb 10                 	cmpl	$0x10, %r11d
145514b58: 74 9a                       	je	0x145514af4 <.text+0x5513af4>
145514b5a: 4d 39 74 f2 10              	cmpq	%r14, 0x10(%r10,%rsi,8)
145514b5f: 0f 84 0b ff ff ff           	je	0x145514a70 <.text+0x5513a70>
145514b65: 41 83 fb 18                 	cmpl	$0x18, %r11d
145514b69: 74 89                       	je	0x145514af4 <.text+0x5513af4>
145514b6b: 4d 39 74 f2 18              	cmpq	%r14, 0x18(%r10,%rsi,8)
145514b70: 0f 84 fa fe ff ff           	je	0x145514a70 <.text+0x5513a70>
145514b76: 41 83 fb 20                 	cmpl	$0x20, %r11d
145514b7a: 0f 84 74 ff ff ff           	je	0x145514af4 <.text+0x5513af4>
145514b80: 4d 39 74 f2 20              	cmpq	%r14, 0x20(%r10,%rsi,8)
145514b85: 0f 84 e5 fe ff ff           	je	0x145514a70 <.text+0x5513a70>
145514b8b: 41 83 fb 28                 	cmpl	$0x28, %r11d
145514b8f: 0f 84 5f ff ff ff           	je	0x145514af4 <.text+0x5513af4>
145514b95: 4d 39 74 f2 28              	cmpq	%r14, 0x28(%r10,%rsi,8)
145514b9a: 0f 84 d0 fe ff ff           	je	0x145514a70 <.text+0x5513a70>
145514ba0: 41 83 fb 30                 	cmpl	$0x30, %r11d
145514ba4: 0f 84 4a ff ff ff           	je	0x145514af4 <.text+0x5513af4>
145514baa: 4d 39 74 f2 30              	cmpq	%r14, 0x30(%r10,%rsi,8)
145514baf: 0f 84 bb fe ff ff           	je	0x145514a70 <.text+0x5513a70>
145514bb5: 41 83 fb 38                 	cmpl	$0x38, %r11d
145514bb9: 0f 84 35 ff ff ff           	je	0x145514af4 <.text+0x5513af4>
145514bbf: e9 ac fe ff ff              	jmp	0x145514a70 <.text+0x5513a70>
145514bc4: 48 89 0a                    	movq	%rcx, (%rdx)
145514bc7: 31 c9                       	xorl	%ecx, %ecx
145514bc9: 48 89 08                    	movq	%rcx, (%rax)
145514bcc: 5b                          	popq	%rbx
145514bcd: 5f                          	popq	%rdi
145514bce: 5e                          	popq	%rsi
145514bcf: 41 5c                       	popq	%r12
145514bd1: 41 5e                       	popq	%r14
145514bd3: 41 5f                       	popq	%r15
145514bd5: c3                          	retq
145514bd6: 48 89 0a                    	movq	%rcx, (%rdx)
145514bd9: f3 0f 11 58 08              	movss	%xmm3, 0x8(%rax)
145514bde: 4c 89 70 10                 	movq	%r14, 0x10(%rax)
145514be2: b9 01 00 00 00              	movl	$0x1, %ecx
145514be7: eb e0                       	jmp	0x145514bc9 <.text+0x5513bc9>
