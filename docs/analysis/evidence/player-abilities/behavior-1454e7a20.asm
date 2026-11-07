
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e7a20: 55                          	pushq	%rbp
1454e7a21: 41 57                       	pushq	%r15
1454e7a23: 41 56                       	pushq	%r14
1454e7a25: 41 55                       	pushq	%r13
1454e7a27: 41 54                       	pushq	%r12
1454e7a29: 56                          	pushq	%rsi
1454e7a2a: 57                          	pushq	%rdi
1454e7a2b: 53                          	pushq	%rbx
1454e7a2c: 48 81 ec 58 02 00 00        	subq	$0x258, %rsp            # imm = 0x258
1454e7a33: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454e7a3b: 44 0f 29 bd c0 01 00 00     	movaps	%xmm15, 0x1c0(%rbp)
1454e7a43: 44 0f 29 b5 b0 01 00 00     	movaps	%xmm14, 0x1b0(%rbp)
1454e7a4b: 44 0f 29 ad a0 01 00 00     	movaps	%xmm13, 0x1a0(%rbp)
1454e7a53: 44 0f 29 a5 90 01 00 00     	movaps	%xmm12, 0x190(%rbp)
1454e7a5b: 44 0f 29 9d 80 01 00 00     	movaps	%xmm11, 0x180(%rbp)
1454e7a63: 44 0f 29 95 70 01 00 00     	movaps	%xmm10, 0x170(%rbp)
1454e7a6b: 44 0f 29 8d 60 01 00 00     	movaps	%xmm9, 0x160(%rbp)
1454e7a73: 44 0f 29 85 50 01 00 00     	movaps	%xmm8, 0x150(%rbp)
1454e7a7b: 0f 29 bd 40 01 00 00        	movaps	%xmm7, 0x140(%rbp)
1454e7a82: 0f 29 b5 30 01 00 00        	movaps	%xmm6, 0x130(%rbp)
1454e7a89: 48 c7 85 28 01 00 00 fe ff ff ff    	movq	$-0x2, 0x128(%rbp)
1454e7a94: 48 89 d3                    	movq	%rdx, %rbx
1454e7a97: 48 89 cf                    	movq	%rcx, %rdi
1454e7a9a: 48 8b 32                    	movq	(%rdx), %rsi
1454e7a9d: 48 8b 81 e8 00 00 00        	movq	0xe8(%rcx), %rax
1454e7aa4: 4c 8b b1 f0 00 00 00        	movq	0xf0(%rcx), %r14
1454e7aab: 44 8b 7e 40                 	movl	0x40(%rsi), %r15d
1454e7aaf: 49 b8 f0 ff ff ff ff ff ff 1f       	movabsq	$0x1ffffffffffffff0, %r8 # imm = 0x1FFFFFFFFFFFFFF0
1454e7ab9: 4d 21 f0                    	andq	%r14, %r8
1454e7abc: 4a 8d 0c 80                 	leaq	(%rax,%r8,4), %rcx
1454e7ac0: 44 89 f2                    	movl	%r14d, %edx
1454e7ac3: 83 e2 0f                    	andl	$0xf, %edx
1454e7ac6: 66 41 0f 6e c7              	movd	%r15d, %xmm0
1454e7acb: 66 0f 70 c0 00              	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1454e7ad0: 45 31 c9                    	xorl	%r9d, %r9d
1454e7ad3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454e7ae0: 4d 39 c8                    	cmpq	%r9, %r8
1454e7ae3: 74 47                       	je	0x1454e7b2c <.text+0x54e6b2c>
1454e7ae5: f3 42 0f 6f 0c 88           	movdqu	(%rax,%r9,4), %xmm1
1454e7aeb: f3 42 0f 6f 54 88 10        	movdqu	0x10(%rax,%r9,4), %xmm2
1454e7af2: f3 42 0f 6f 5c 88 20        	movdqu	0x20(%rax,%r9,4), %xmm3
1454e7af9: f3 42 0f 6f 64 88 30        	movdqu	0x30(%rax,%r9,4), %xmm4
1454e7b00: 66 0f 76 d0                 	pcmpeqd	%xmm0, %xmm2
1454e7b04: 66 0f 76 c8                 	pcmpeqd	%xmm0, %xmm1
1454e7b08: 66 0f 6b ca                 	packssdw	%xmm2, %xmm1
1454e7b0c: 66 0f 76 d8                 	pcmpeqd	%xmm0, %xmm3
1454e7b10: 66 0f 76 e0                 	pcmpeqd	%xmm0, %xmm4
1454e7b14: 66 0f 6b dc                 	packssdw	%xmm4, %xmm3
1454e7b18: 66 0f 63 cb                 	packsswb	%xmm3, %xmm1
1454e7b1c: 66 44 0f d7 d1              	pmovmskb	%xmm1, %r10d
1454e7b21: 49 83 c1 10                 	addq	$0x10, %r9
1454e7b25: 45 85 d2                    	testl	%r10d, %r10d
1454e7b28: 74 b6                       	je	0x1454e7ae0 <.text+0x54e6ae0>
1454e7b2a: eb 4f                       	jmp	0x1454e7b7b <.text+0x54e6b7b>
1454e7b2c: c1 e2 02                    	shll	$0x2, %edx
1454e7b2f: 45 31 c0                    	xorl	%r8d, %r8d
1454e7b32: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454e7b40: 4c 39 c2                    	cmpq	%r8, %rdx
1454e7b43: 74 0c                       	je	0x1454e7b51 <.text+0x54e6b51>
1454e7b45: 46 39 3c 01                 	cmpl	%r15d, (%rcx,%r8)
1454e7b49: 4d 8d 40 04                 	leaq	0x4(%r8), %r8
1454e7b4d: 75 f1                       	jne	0x1454e7b40 <.text+0x54e6b40>
1454e7b4f: eb 2a                       	jmp	0x1454e7b7b <.text+0x54e6b7b>
1454e7b51: 4c 3b b7 e0 00 00 00        	cmpq	0xe0(%rdi), %r14
1454e7b58: 75 13                       	jne	0x1454e7b6d <.text+0x54e6b6d>
1454e7b5a: 48 8d 8f e0 00 00 00        	leaq	0xe0(%rdi), %rcx
1454e7b61: e8 4a 3b 27 00              	callq	0x14575b6b0 <.text+0x575a6b0>
1454e7b66: 48 8b 87 e8 00 00 00        	movq	0xe8(%rdi), %rax
1454e7b6d: 46 89 3c b0                 	movl	%r15d, (%rax,%r14,4)
1454e7b71: 49 ff c6                    	incq	%r14
1454e7b74: 4c 89 b7 f0 00 00 00        	movq	%r14, 0xf0(%rdi)
1454e7b7b: f3 0f 10 87 58 04 00 00     	movss	0x458(%rdi), %xmm0
1454e7b83: f3 44 0f 10 97 5c 04 00 00  	movss	0x45c(%rdi), %xmm10
1454e7b8c: f3 0f 10 b7 80 04 00 00     	movss	0x480(%rdi), %xmm6
1454e7b94: 8b 87 8c 04 00 00           	movl	0x48c(%rdi), %eax
1454e7b9a: 8b 8f 9c 04 00 00           	movl	0x49c(%rdi), %ecx
1454e7ba0: f3 0f 10 bf a0 04 00 00     	movss	0x4a0(%rdi), %xmm7
1454e7ba8: 8b 97 f0 03 00 00           	movl	0x3f0(%rdi), %edx
1454e7bae: 89 55 10                    	movl	%edx, 0x10(%rbp)
1454e7bb1: 48 8b 97 e8 03 00 00        	movq	0x3e8(%rdi), %rdx
1454e7bb8: 48 89 55 08                 	movq	%rdx, 0x8(%rbp)
1454e7bbc: f3 0f 10 4e 44              	movss	0x44(%rsi), %xmm1
1454e7bc1: f3 44 0f 10 4b 10           	movss	0x10(%rbx), %xmm9
1454e7bc7: f3 44 0f 10 5b 38           	movss	0x38(%rbx), %xmm11
1454e7bcd: 0f b6 56 75                 	movzbl	0x75(%rsi), %edx
1454e7bd1: 44 8d 42 fe                 	leal	-0x2(%rdx), %r8d
1454e7bd5: 41 80 f8 06                 	cmpb	$0x6, %r8b
1454e7bd9: 77 13                       	ja	0x1454e7bee <.text+0x54e6bee>
1454e7bdb: 45 0f b6 c0                 	movzbl	%r8b, %r8d
1454e7bdf: 4c 8d 0d b6 4e 4c 01        	leaq	0x14c4eb6(%rip), %r9    # 0x1469aca9c
1454e7be6: f3 43 0f 10 14 81           	movss	(%r9,%r8,4), %xmm2
1454e7bec: eb 08                       	jmp	0x1454e7bf6 <.text+0x54e6bf6>
1454e7bee: f3 0f 10 15 8a 38 40 00     	movss	0x40388a(%rip), %xmm2   # 0x1458eb480
1454e7bf6: 4c 8d b7 e8 03 00 00        	leaq	0x3e8(%rdi), %r14
1454e7bfd: f3 0f 10 5b 4c              	movss	0x4c(%rbx), %xmm3
1454e7c02: f3 0f 59 d8                 	mulss	%xmm0, %xmm3
1454e7c06: 66 0f ef e4                 	pxor	%xmm4, %xmm4
1454e7c0a: f3 0f c2 e1 01              	cmpltss	%xmm1, %xmm4
1454e7c0f: 0f 54 e3                    	andps	%xmm3, %xmm4
1454e7c12: f3 0f 59 0d 26 11 41 00     	mulss	0x411126(%rip), %xmm1   # 0x1458f8d40
1454e7c1a: f3 41 0f 59 c9              	mulss	%xmm9, %xmm1
1454e7c1f: f3 41 0f 59 cb              	mulss	%xmm11, %xmm1
1454e7c24: f3 0f 59 ca                 	mulss	%xmm2, %xmm1
1454e7c28: f3 0f 58 cc                 	addss	%xmm4, %xmm1
1454e7c2c: f3 44 0f 59 d1              	mulss	%xmm1, %xmm10
1454e7c31: 89 d2                       	movl	%edx, %edx
1454e7c33: 4c 8d 05 ba 52 4c 01        	leaq	0x14c52ba(%rip), %r8    # 0x1469acef4
1454e7c3a: 49 63 14 90                 	movslq	(%r8,%rdx,4), %rdx
1454e7c3e: 4c 01 c2                    	addq	%r8, %rdx
1454e7c41: 48 89 b5 88 00 00 00        	movq	%rsi, 0x88(%rbp)
1454e7c48: ff e2                       	jmpq	*%rdx
1454e7c4a: 44 8b 66 54                 	movl	0x54(%rsi), %r12d
1454e7c4e: 45 85 e4                    	testl	%r12d, %r12d
1454e7c51: 0f 84 14 0e 00 00           	je	0x1454e8a6b <.text+0x54e7a6b>
1454e7c57: 8b 4b 40                    	movl	0x40(%rbx), %ecx
1454e7c5a: 41 01 c4                    	addl	%eax, %r12d
1454e7c5d: 44 03 63 18                 	addl	0x18(%rbx), %r12d
1454e7c61: 41 8d 04 0c                 	leal	(%r12,%rcx), %eax
1454e7c65: 83 f8 01                    	cmpl	$0x1, %eax
1454e7c68: 41 11 cc                    	adcl	%ecx, %r12d
1454e7c6b: e9 01 0e 00 00              	jmp	0x1454e8a71 <.text+0x54e7a71>
1454e7c70: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454e7c74: 44 8b 6e 54                 	movl	0x54(%rsi), %r13d
1454e7c78: 45 85 ed                    	testl	%r13d, %r13d
1454e7c7b: 0f 84 2b 0f 00 00           	je	0x1454e8bac <.text+0x54e7bac>
1454e7c81: 48 8b 55 78                 	movq	0x78(%rbp), %rdx
1454e7c85: 8b 4a 40                    	movl	0x40(%rdx), %ecx
1454e7c88: 41 01 c5                    	addl	%eax, %r13d
1454e7c8b: 44 03 6a 18                 	addl	0x18(%rdx), %r13d
1454e7c8f: 42 8d 04 29                 	leal	(%rcx,%r13), %eax
1454e7c93: 83 f8 01                    	cmpl	$0x1, %eax
1454e7c96: 41 11 cd                    	adcl	%ecx, %r13d
1454e7c99: e9 14 0f 00 00              	jmp	0x1454e8bb2 <.text+0x54e7bb2>
1454e7c9e: 44 8b 66 54                 	movl	0x54(%rsi), %r12d
1454e7ca2: 45 85 e4                    	testl	%r12d, %r12d
1454e7ca5: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454e7ca9: 0f 84 56 14 00 00           	je	0x1454e9105 <.text+0x54e8105>
1454e7caf: 8b 53 40                    	movl	0x40(%rbx), %edx
1454e7cb2: 41 01 c4                    	addl	%eax, %r12d
1454e7cb5: 44 03 63 18                 	addl	0x18(%rbx), %r12d
1454e7cb9: 41 8d 04 14                 	leal	(%r12,%rdx), %eax
1454e7cbd: 83 f8 01                    	cmpl	$0x1, %eax
1454e7cc0: 41 11 d4                    	adcl	%edx, %r12d
1454e7cc3: e9 43 14 00 00              	jmp	0x1454e910b <.text+0x54e810b>
1454e7cc8: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454e7ccc: 44 8b 6e 54                 	movl	0x54(%rsi), %r13d
1454e7cd0: 45 85 ed                    	testl	%r13d, %r13d
1454e7cd3: 0f 84 28 15 00 00           	je	0x1454e9201 <.text+0x54e8201>
1454e7cd9: 48 8b 55 78                 	movq	0x78(%rbp), %rdx
1454e7cdd: 8b 4a 40                    	movl	0x40(%rdx), %ecx
1454e7ce0: 41 01 c5                    	addl	%eax, %r13d
1454e7ce3: 44 03 6a 18                 	addl	0x18(%rdx), %r13d
1454e7ce7: 42 8d 04 29                 	leal	(%rcx,%r13), %eax
1454e7ceb: 83 f8 01                    	cmpl	$0x1, %eax
1454e7cee: 41 11 cd                    	adcl	%ecx, %r13d
1454e7cf1: e9 11 15 00 00              	jmp	0x1454e9207 <.text+0x54e8207>
1454e7cf6: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e7cfa: 89 85 c0 00 00 00           	movl	%eax, 0xc0(%rbp)
1454e7d00: 49 8b 06                    	movq	(%r14), %rax
1454e7d03: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454e7d0a: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e7d13: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e7d1c: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e7d23: 4c 8d bd b8 00 00 00        	leaq	0xb8(%rbp), %r15
1454e7d2a: f3 0f 10 1d 6a fc 4d 00     	movss	0x4dfc6a(%rip), %xmm3   # 0x1459c799c
1454e7d32: 48 89 fa                    	movq	%rdi, %rdx
1454e7d35: 4d 89 f8                    	movq	%r15, %r8
1454e7d38: e8 93 63 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e7d3d: 48 83 bd f0 00 00 00 00     	cmpq	$0x0, 0xf0(%rbp)
1454e7d45: 0f 84 ba 17 00 00           	je	0x1454e9505 <.text+0x54e8505>
1454e7d4b: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e7d52: 48 85 d2                    	testq	%rdx, %rdx
1454e7d55: 74 16                       	je	0x1454e7d6d <.text+0x54e6d6d>
1454e7d57: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e7d5e: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e7d62: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e7d68: e8 63 a4 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e7d6d: 4c 8d b7 38 05 00 00        	leaq	0x538(%rdi), %r14
1454e7d74: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e7d7b: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454e7d7f: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454e7d89: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454e7d90: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e7d94: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e7d99: 4c 89 7c 24 28              	movq	%r15, 0x28(%rsp)
1454e7d9e: 48 c7 44 24 20 00 00 00 00  	movq	$0x0, 0x20(%rsp)
1454e7da7: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e7dae: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454e7db4: e8 e7 33 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e7db9: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e7dc0: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e7dc7: 75 09                       	jne	0x1454e7dd2 <.text+0x54e6dd2>
1454e7dc9: 4c 89 f1                    	movq	%r14, %rcx
1454e7dcc: e8 df 02 27 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e7dd1: 90                          	nop
1454e7dd2: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454e7dd9: 48 89 f1                    	movq	%rsi, %rcx
1454e7ddc: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454e7de0: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e7de7: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e7dee: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454e7df3: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454e7df7: 48 ff c6                    	incq	%rsi
1454e7dfa: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e7e01: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1454e7e08: f3 44 0f 10 50 58           	movss	0x58(%rax), %xmm10
1454e7e0e: f3 44 0f 10 25 29 0f 41 00  	movss	0x410f29(%rip), %xmm12  # 0x1458f8d40
1454e7e17: f3 45 0f 59 e2              	mulss	%xmm10, %xmm12
1454e7e1c: f3 44 0f 10 5b 20           	movss	0x20(%rbx), %xmm11
1454e7e22: 44 8b 60 5c                 	movl	0x5c(%rax), %r12d
1454e7e26: 41 83 fc 01                 	cmpl	$0x1, %r12d
1454e7e2a: 41 83 d4 00                 	adcl	$0x0, %r12d
1454e7e2e: f3 45 0f 59 e3              	mulss	%xmm11, %xmm12
1454e7e33: 83 bf 04 01 00 00 00        	cmpl	$0x0, 0x104(%rdi)
1454e7e3a: 0f 57 ff                    	xorps	%xmm7, %xmm7
1454e7e3d: 74 08                       	je	0x1454e7e47 <.text+0x54e6e47>
1454e7e3f: f3 0f 10 3d 2d 01 4e 00     	movss	0x4e012d(%rip), %xmm7   # 0x1459c7f74
1454e7e47: f3 44 0f 59 63 48           	mulss	0x48(%rbx), %xmm12
1454e7e4d: f3 0f 58 bf f4 03 00 00     	addss	0x3f4(%rdi), %xmm7
1454e7e55: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454e7e58: e8 d4 ef 26 00              	callq	0x145756e31 <.text+0x5755e31>
1454e7e5d: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e7e60: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454e7e63: e8 c3 ef 26 00              	callq	0x145756e2b <.text+0x5755e2b>
1454e7e68: f2 0f 10 4d 08              	movsd	0x8(%rbp), %xmm1
1454e7e6d: 0f 14 f0                    	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454e7e70: 0f 59 35 a9 27 4c 01        	mulps	0x14c27a9(%rip), %xmm6  # 0x1469aa620
1454e7e77: 0f 58 f1                    	addps	%xmm1, %xmm6
1454e7e7a: f3 44 0f 16 c6              	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454e7e7f: 48 8b b7 78 08 00 00        	movq	0x878(%rdi), %rsi
1454e7e86: 48 8d 4e 10                 	leaq	0x10(%rsi), %rcx
1454e7e8a: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454e7e8d: 41 0f 28 d0                 	movaps	%xmm8, %xmm2
1454e7e91: e8 5a a9 f7 ff              	callq	0x1454627f0 <.text+0x54617f0>
1454e7e96: a8 01                       	testb	$0x1, %al
1454e7e98: 0f 84 f4 1a 00 00           	je	0x1454e9992 <.text+0x54e8992>
1454e7e9e: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454e7ea1: e9 e2 1e 00 00              	jmp	0x1454e9d88 <.text+0x54e8d88>
1454e7ea6: f3 0f 10 43 1c              	movss	0x1c(%rbx), %xmm0
1454e7eab: f3 0f 59 43 44              	mulss	0x44(%rbx), %xmm0
1454e7eb0: f3 0f 59 46 50              	mulss	0x50(%rsi), %xmm0
1454e7eb5: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454e7eb9: f3 0f 10 05 53 45 71 00     	movss	0x714553(%rip), %xmm0   # 0x145bfc414
1454e7ec1: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454e7ec4: 73 2b                       	jae	0x1454e7ef1 <.text+0x54e6ef1>
1454e7ec6: f3 0f 58 35 02 6d 4a 01     	addss	0x14a6d02(%rip), %xmm6  # 0x14698ebd0
1454e7ece: f3 0f 10 3d 0a 0f 41 00     	movss	0x410f0a(%rip), %xmm7   # 0x1458f8de0
1454e7ed6: f3 0f 5e f7                 	divss	%xmm7, %xmm6
1454e7eda: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e7edd: e8 75 f0 26 00              	callq	0x145756f57 <.text+0x5755f57>
1454e7ee2: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e7ee5: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454e7ee9: f3 0f 58 35 23 45 71 00     	addss	0x714523(%rip), %xmm6   # 0x145bfc414
1454e7ef1: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e7ef5: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e7efb: 49 8b 06                    	movq	(%r14), %rax
1454e7efe: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e7f05: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e7f0e: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e7f17: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e7f1e: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e7f25: 48 89 fa                    	movq	%rdi, %rdx
1454e7f28: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e7f2b: e8 a0 61 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e7f30: 4c 8b bd c8 00 00 00        	movq	0xc8(%rbp), %r15
1454e7f37: 4d 85 ff                    	testq	%r15, %r15
1454e7f3a: 75 0a                       	jne	0x1454e7f46 <.text+0x54e6f46>
1454e7f3c: 83 7e 68 06                 	cmpl	$0x6, 0x68(%rsi)
1454e7f40: 0f 85 b7 10 00 00           	jne	0x1454e8ffd <.text+0x54e7ffd>
1454e7f46: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e7f4d: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454e7f51: 4c 8b 8d c0 00 00 00        	movq	0xc0(%rbp), %r9
1454e7f58: c7 45 50 02 00 00 00        	movl	$0x2, 0x50(%rbp)
1454e7f5f: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454e7f69: c6 85 df 00 00 00 01        	movb	$0x1, 0xdf(%rbp)
1454e7f70: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454e7f77: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e7f7c: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e7f80: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454e7f85: 4c 89 7c 24 20              	movq	%r15, 0x20(%rsp)
1454e7f8a: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e7f91: 4c 89 8d 18 01 00 00        	movq	%r9, 0x118(%rbp)
1454e7f98: e8 03 32 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e7f9d: 90                          	nop
1454e7f9e: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e7fa5: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e7fac: 75 0d                       	jne	0x1454e7fbb <.text+0x54e6fbb>
1454e7fae: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454e7fb5: e8 f6 00 27 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e7fba: 90                          	nop
1454e7fbb: 48 89 f0                    	movq	%rsi, %rax
1454e7fbe: 48 c1 e0 05                 	shlq	$0x5, %rax
1454e7fc2: 48 ff c6                    	incq	%rsi
1454e7fc5: 48 8b 8f 40 05 00 00        	movq	0x540(%rdi), %rcx
1454e7fcc: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e7fd3: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e7fda: 0f 11 4c 01 10              	movups	%xmm1, 0x10(%rcx,%rax)
1454e7fdf: 0f 11 04 01                 	movups	%xmm0, (%rcx,%rax)
1454e7fe3: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e7fea: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454e7ff1: 48 89 45 48                 	movq	%rax, 0x48(%rbp)
1454e7ff5: 4d 85 ff                    	testq	%r15, %r15
1454e7ff8: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454e7fff: 0f 84 55 02 00 00           	je	0x1454e825a <.text+0x54e725a>
1454e8005: 49 c1 e7 03                 	shlq	$0x3, %r15
1454e8009: f3 0f 10 7b 48              	movss	0x48(%rbx), %xmm7
1454e800e: f3 44 0f 10 43 50           	movss	0x50(%rbx), %xmm8
1454e8014: 4c 8d 66 68                 	leaq	0x68(%rsi), %r12
1454e8018: 45 31 ed                    	xorl	%r13d, %r13d
1454e801b: f3 44 0f 10 0d 9c 33 50 00  	movss	0x50339c(%rip), %xmm9   # 0x1459eb3c0
1454e8024: 48 8d 1d e9 4f 4c 01        	leaq	0x14c4fe9(%rip), %rbx   # 0x1469ad014
1454e802b: f3 44 0f 10 1d e0 34 40 00  	movss	0x4034e0(%rip), %xmm11  # 0x1458eb514
1454e8034: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454e8040: 48 8b 85 18 01 00 00        	movq	0x118(%rbp), %rax
1454e8047: 4e 8b 34 28                 	movq	(%rax,%r13), %r14
1454e804b: 48 8b 87 80 08 00 00        	movq	0x880(%rdi), %rax
1454e8052: 48 8b 8f 98 08 00 00        	movq	0x898(%rdi), %rcx
1454e8059: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454e805d: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454e8061: 48 01 c2                    	addq	%rax, %rdx
1454e8064: 4c 8b 87 88 08 00 00        	movq	0x888(%rdi), %r8
1454e806b: 4d 89 c1                    	movq	%r8, %r9
1454e806e: 49 c1 e1 11                 	shlq	$0x11, %r9
1454e8072: 4c 8b 97 90 08 00 00        	movq	0x890(%rdi), %r10
1454e8079: 49 31 c2                    	xorq	%rax, %r10
1454e807c: 4c 31 c1                    	xorq	%r8, %rcx
1454e807f: 4d 31 d0                    	xorq	%r10, %r8
1454e8082: 4c 89 87 88 08 00 00        	movq	%r8, 0x888(%rdi)
1454e8089: 48 31 c8                    	xorq	%rcx, %rax
1454e808c: 48 89 87 80 08 00 00        	movq	%rax, 0x880(%rdi)
1454e8093: 4d 31 ca                    	xorq	%r9, %r10
1454e8096: 4c 89 97 90 08 00 00        	movq	%r10, 0x890(%rdi)
1454e809d: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454e80a1: 48 89 8f 98 08 00 00        	movq	%rcx, 0x898(%rdi)
1454e80a8: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454e80ac: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454e80af: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454e80b3: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e80b8: f3 0f 10 8f 64 04 00 00     	movss	0x464(%rdi), %xmm1
1454e80c0: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e80c3: 77 0b                       	ja	0x1454e80d0 <.text+0x54e70d0>
1454e80c5: 41 0f 28 f2                 	movaps	%xmm10, %xmm6
1454e80c9: eb 12                       	jmp	0x1454e80dd <.text+0x54e70dd>
1454e80cb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454e80d0: f3 0f 10 b7 68 04 00 00     	movss	0x468(%rdi), %xmm6
1454e80d8: f3 41 0f 59 f2              	mulss	%xmm10, %xmm6
1454e80dd: 44 8b 4e 40                 	movl	0x40(%rsi), %r9d
1454e80e1: 0f b6 46 74                 	movzbl	0x74(%rsi), %eax
1454e80e5: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e80e8: 0f 97 44 24 28              	seta	0x28(%rsp)
1454e80ed: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454e80f1: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454e80f6: 48 89 f9                    	movq	%rdi, %rcx
1454e80f9: 4c 89 f2                    	movq	%r14, %rdx
1454e80fc: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454e80ff: e8 ac ad fd ff              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454e8104: 90                          	nop
1454e8105: 41 8b 04 24                 	movl	(%r12), %eax
1454e8109: ff c8                       	decl	%eax
1454e810b: 83 f8 09                    	cmpl	$0x9, %eax
1454e810e: 77 36                       	ja	0x1454e8146 <.text+0x54e7146>
1454e8110: 48 63 04 83                 	movslq	(%rbx,%rax,4), %rax
1454e8114: 48 01 d8                    	addq	%rbx, %rax
1454e8117: ff e0                       	jmpq	*%rax
1454e8119: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e811e: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e8123: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454e8127: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e812f: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e8137: c7 85 e0 00 00 00 01 00 00 00       	movl	$0x1, 0xe0(%rbp)
1454e8141: e9 ea 00 00 00              	jmp	0x1454e8230 <.text+0x54e7230>
1454e8146: 41 8b 44 24 08              	movl	0x8(%r12), %eax
1454e814b: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e8151: 49 8b 04 24                 	movq	(%r12), %rax
1454e8155: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e815c: e9 cf 00 00 00              	jmp	0x1454e8230 <.text+0x54e7230>
1454e8161: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8166: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e816b: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8173: c7 85 e0 00 00 00 09 00 00 00       	movl	$0x9, 0xe0(%rbp)
1454e817d: e9 ae 00 00 00              	jmp	0x1454e8230 <.text+0x54e7230>
1454e8182: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8187: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e818c: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8194: c7 85 e0 00 00 00 02 00 00 00       	movl	$0x2, 0xe0(%rbp)
1454e819e: e9 8d 00 00 00              	jmp	0x1454e8230 <.text+0x54e7230>
1454e81a3: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e81a8: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e81ad: f3 41 0f 5d c3              	minss	%xmm11, %xmm0
1454e81b2: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e81b7: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454e81bb: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e81c3: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e81cb: c7 85 e0 00 00 00 0a 00 00 00       	movl	$0xa, 0xe0(%rbp)
1454e81d5: eb 59                       	jmp	0x1454e8230 <.text+0x54e7230>
1454e81d7: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e81dc: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e81e1: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e81e9: c7 85 e0 00 00 00 03 00 00 00       	movl	$0x3, 0xe0(%rbp)
1454e81f3: eb 3b                       	jmp	0x1454e8230 <.text+0x54e7230>
1454e81f5: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e81fa: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e81ff: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8207: c7 85 e0 00 00 00 07 00 00 00       	movl	$0x7, 0xe0(%rbp)
1454e8211: eb 1d                       	jmp	0x1454e8230 <.text+0x54e7230>
1454e8213: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8218: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e821d: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8225: c7 85 e0 00 00 00 08 00 00 00       	movl	$0x8, 0xe0(%rbp)
1454e822f: 90                          	nop
1454e8230: 8b 46 40                    	movl	0x40(%rsi), %eax
1454e8233: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1454e8237: 48 89 f9                    	movq	%rdi, %rcx
1454e823a: 4c 89 f2                    	movq	%r14, %rdx
1454e823d: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e8244: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e8247: e8 e4 53 00 00              	callq	0x1454ed630 <.text+0x54ec630>
1454e824c: 90                          	nop
1454e824d: 49 83 c5 08                 	addq	$0x8, %r13
1454e8251: 4d 39 ef                    	cmpq	%r13, %r15
1454e8254: 0f 85 e6 fd ff ff           	jne	0x1454e8040 <.text+0x54e7040>
1454e825a: 48 8b 55 48                 	movq	0x48(%rbp), %rdx
1454e825e: 48 85 d2                    	testq	%rdx, %rdx
1454e8261: 74 16                       	je	0x1454e8279 <.text+0x54e7279>
1454e8263: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e8267: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e826d: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454e8274: e8 57 9f b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e8279: 83 7e 68 06                 	cmpl	$0x6, 0x68(%rsi)
1454e827d: 0f 85 03 33 00 00           	jne	0x1454eb586 <.text+0x54ea586>
1454e8283: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454e8288: f3 0f 59 8f 58 04 00 00     	mulss	0x458(%rdi), %xmm1
1454e8290: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454e8294: 48 c7 85 e0 00 00 00 fe ff ff ff    	movq	$-0x2, 0xe0(%rbp)
1454e829f: c6 85 df 00 00 00 00        	movb	$0x0, 0xdf(%rbp)
1454e82a6: 4c 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %r9
1454e82ad: 48 89 f9                    	movq	%rdi, %rcx
1454e82b0: e8 0b bd fa ff              	callq	0x145493fc0 <.text+0x5492fc0>
1454e82b5: 90                          	nop
1454e82b6: e9 cb 32 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454e82bb: f3 0f 10 43 1c              	movss	0x1c(%rbx), %xmm0
1454e82c0: f3 0f 59 43 44              	mulss	0x44(%rbx), %xmm0
1454e82c5: f3 0f 59 46 4c              	mulss	0x4c(%rsi), %xmm0
1454e82ca: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454e82ce: f3 0f 10 05 3e 41 71 00     	movss	0x71413e(%rip), %xmm0   # 0x145bfc414
1454e82d6: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454e82d9: 73 2b                       	jae	0x1454e8306 <.text+0x54e7306>
1454e82db: f3 0f 58 35 ed 68 4a 01     	addss	0x14a68ed(%rip), %xmm6  # 0x14698ebd0
1454e82e3: f3 0f 10 3d f5 0a 41 00     	movss	0x410af5(%rip), %xmm7   # 0x1458f8de0
1454e82eb: f3 0f 5e f7                 	divss	%xmm7, %xmm6
1454e82ef: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e82f2: e8 60 ec 26 00              	callq	0x145756f57 <.text+0x5755f57>
1454e82f7: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e82fa: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454e82fe: f3 0f 58 35 0e 41 71 00     	addss	0x71410e(%rip), %xmm6   # 0x145bfc414
1454e8306: f3 0f 11 75 f4              	movss	%xmm6, -0xc(%rbp)
1454e830b: f3 0f 10 b7 f4 03 00 00     	movss	0x3f4(%rdi), %xmm6
1454e8313: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e8316: e8 16 eb 26 00              	callq	0x145756e31 <.text+0x5755e31>
1454e831b: 0f 28 f8                    	movaps	%xmm0, %xmm7
1454e831e: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e8321: e8 05 eb 26 00              	callq	0x145756e2b <.text+0x5755e2b>
1454e8326: f3 0f 11 7d 44              	movss	%xmm7, 0x44(%rbp)
1454e832b: f3 0f 11 45 40              	movss	%xmm0, 0x40(%rbp)
1454e8330: f3 0f 10 87 e4 08 00 00     	movss	0x8e4(%rdi), %xmm0
1454e8338: f3 0f 11 45 18              	movss	%xmm0, 0x18(%rbp)
1454e833d: 48 8b 87 c8 04 00 00        	movq	0x4c8(%rdi), %rax
1454e8344: 48 69 8f d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdi), %rcx # imm = 0x160
1454e834f: 48 01 c1                    	addq	%rax, %rcx
1454e8352: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e8359: 48 89 8d e8 00 00 00        	movq	%rcx, 0xe8(%rbp)
1454e8360: 48 8d 45 18                 	leaq	0x18(%rbp), %rax
1454e8364: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454e836b: 48 8d 45 08                 	leaq	0x8(%rbp), %rax
1454e836f: 48 89 85 f8 00 00 00        	movq	%rax, 0xf8(%rbp)
1454e8376: 48 8d 45 f4                 	leaq	-0xc(%rbp), %rax
1454e837a: 48 89 85 00 01 00 00        	movq	%rax, 0x100(%rbp)
1454e8381: 48 8d 45 44                 	leaq	0x44(%rbp), %rax
1454e8385: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
1454e838c: 48 8d 45 40                 	leaq	0x40(%rbp), %rax
1454e8390: 48 89 85 10 01 00 00        	movq	%rax, 0x110(%rbp)
1454e8397: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e839e: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e83a5: e8 96 8a 04 00              	callq	0x145530e40 <.text+0x552fe40>
1454e83aa: 4c 8b bd c8 00 00 00        	movq	0xc8(%rbp), %r15
1454e83b1: 4d 85 ff                    	testq	%r15, %r15
1454e83b4: 0f 84 43 0c 00 00           	je	0x1454e8ffd <.text+0x54e7ffd>
1454e83ba: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e83c1: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454e83c5: 4c 8b 8d c0 00 00 00        	movq	0xc0(%rbp), %r9
1454e83cc: c7 45 50 02 00 00 00        	movl	$0x2, 0x50(%rbp)
1454e83d3: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454e83dd: c6 85 b7 00 00 00 01        	movb	$0x1, 0xb7(%rbp)
1454e83e4: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454e83eb: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e83f0: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e83f4: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454e83f9: 4c 89 7c 24 20              	movq	%r15, 0x20(%rsp)
1454e83fe: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e8405: 4c 89 8d 18 01 00 00        	movq	%r9, 0x118(%rbp)
1454e840c: e8 8f 2d f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e8411: 90                          	nop
1454e8412: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e8419: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e8420: 75 0d                       	jne	0x1454e842f <.text+0x54e742f>
1454e8422: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454e8429: e8 82 fc 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e842e: 90                          	nop
1454e842f: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454e8436: 48 89 f1                    	movq	%rsi, %rcx
1454e8439: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454e843d: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e8444: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e844b: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454e8450: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454e8454: 48 ff c6                    	incq	%rsi
1454e8457: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e845e: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454e8465: 48 89 45 48                 	movq	%rax, 0x48(%rbp)
1454e8469: 49 c1 e7 03                 	shlq	$0x3, %r15
1454e846d: f3 0f 10 7b 48              	movss	0x48(%rbx), %xmm7
1454e8472: f3 44 0f 10 43 50           	movss	0x50(%rbx), %xmm8
1454e8478: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454e847f: 4c 8d 66 68                 	leaq	0x68(%rsi), %r12
1454e8483: 45 31 ed                    	xorl	%r13d, %r13d
1454e8486: f3 44 0f 10 0d 31 2f 50 00  	movss	0x502f31(%rip), %xmm9   # 0x1459eb3c0
1454e848f: 48 8d 1d b6 4a 4c 01        	leaq	0x14c4ab6(%rip), %rbx   # 0x1469acf4c
1454e8496: f3 44 0f 10 1d 75 30 40 00  	movss	0x403075(%rip), %xmm11  # 0x1458eb514
1454e849f: 90                          	nop
1454e84a0: 48 8b 85 18 01 00 00        	movq	0x118(%rbp), %rax
1454e84a7: 4e 8b 34 28                 	movq	(%rax,%r13), %r14
1454e84ab: 48 8b 87 80 08 00 00        	movq	0x880(%rdi), %rax
1454e84b2: 48 8b 8f 98 08 00 00        	movq	0x898(%rdi), %rcx
1454e84b9: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454e84bd: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454e84c1: 48 01 c2                    	addq	%rax, %rdx
1454e84c4: 4c 8b 87 88 08 00 00        	movq	0x888(%rdi), %r8
1454e84cb: 4d 89 c1                    	movq	%r8, %r9
1454e84ce: 49 c1 e1 11                 	shlq	$0x11, %r9
1454e84d2: 4c 8b 97 90 08 00 00        	movq	0x890(%rdi), %r10
1454e84d9: 49 31 c2                    	xorq	%rax, %r10
1454e84dc: 4c 31 c1                    	xorq	%r8, %rcx
1454e84df: 4d 31 d0                    	xorq	%r10, %r8
1454e84e2: 4c 89 87 88 08 00 00        	movq	%r8, 0x888(%rdi)
1454e84e9: 48 31 c8                    	xorq	%rcx, %rax
1454e84ec: 48 89 87 80 08 00 00        	movq	%rax, 0x880(%rdi)
1454e84f3: 4d 31 ca                    	xorq	%r9, %r10
1454e84f6: 4c 89 97 90 08 00 00        	movq	%r10, 0x890(%rdi)
1454e84fd: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454e8501: 48 89 8f 98 08 00 00        	movq	%rcx, 0x898(%rdi)
1454e8508: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454e850c: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454e850f: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454e8513: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8518: f3 0f 10 8f 64 04 00 00     	movss	0x464(%rdi), %xmm1
1454e8520: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e8523: 77 0b                       	ja	0x1454e8530 <.text+0x54e7530>
1454e8525: 41 0f 28 f2                 	movaps	%xmm10, %xmm6
1454e8529: eb 12                       	jmp	0x1454e853d <.text+0x54e753d>
1454e852b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454e8530: f3 0f 10 b7 68 04 00 00     	movss	0x468(%rdi), %xmm6
1454e8538: f3 41 0f 59 f2              	mulss	%xmm10, %xmm6
1454e853d: 44 8b 4e 40                 	movl	0x40(%rsi), %r9d
1454e8541: 0f b6 46 74                 	movzbl	0x74(%rsi), %eax
1454e8545: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e8548: 0f 97 44 24 28              	seta	0x28(%rsp)
1454e854d: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454e8551: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454e8556: 48 89 f9                    	movq	%rdi, %rcx
1454e8559: 4c 89 f2                    	movq	%r14, %rdx
1454e855c: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454e855f: e8 4c a9 fd ff              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454e8564: 90                          	nop
1454e8565: 41 8b 04 24                 	movl	(%r12), %eax
1454e8569: ff c8                       	decl	%eax
1454e856b: 83 f8 09                    	cmpl	$0x9, %eax
1454e856e: 77 36                       	ja	0x1454e85a6 <.text+0x54e75a6>
1454e8570: 48 63 04 83                 	movslq	(%rbx,%rax,4), %rax
1454e8574: 48 01 d8                    	addq	%rbx, %rax
1454e8577: ff e0                       	jmpq	*%rax
1454e8579: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e857e: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e8583: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454e8587: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e858f: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e8597: c7 85 e0 00 00 00 01 00 00 00       	movl	$0x1, 0xe0(%rbp)
1454e85a1: e9 ea 00 00 00              	jmp	0x1454e8690 <.text+0x54e7690>
1454e85a6: 41 8b 44 24 08              	movl	0x8(%r12), %eax
1454e85ab: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e85b1: 49 8b 04 24                 	movq	(%r12), %rax
1454e85b5: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e85bc: e9 cf 00 00 00              	jmp	0x1454e8690 <.text+0x54e7690>
1454e85c1: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e85c6: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e85cb: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e85d3: c7 85 e0 00 00 00 09 00 00 00       	movl	$0x9, 0xe0(%rbp)
1454e85dd: e9 ae 00 00 00              	jmp	0x1454e8690 <.text+0x54e7690>
1454e85e2: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e85e7: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e85ec: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e85f4: c7 85 e0 00 00 00 02 00 00 00       	movl	$0x2, 0xe0(%rbp)
1454e85fe: e9 8d 00 00 00              	jmp	0x1454e8690 <.text+0x54e7690>
1454e8603: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8608: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e860d: f3 41 0f 5d c3              	minss	%xmm11, %xmm0
1454e8612: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e8617: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454e861b: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8623: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e862b: c7 85 e0 00 00 00 0a 00 00 00       	movl	$0xa, 0xe0(%rbp)
1454e8635: eb 59                       	jmp	0x1454e8690 <.text+0x54e7690>
1454e8637: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e863c: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e8641: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8649: c7 85 e0 00 00 00 03 00 00 00       	movl	$0x3, 0xe0(%rbp)
1454e8653: eb 3b                       	jmp	0x1454e8690 <.text+0x54e7690>
1454e8655: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e865a: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e865f: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8667: c7 85 e0 00 00 00 07 00 00 00       	movl	$0x7, 0xe0(%rbp)
1454e8671: eb 1d                       	jmp	0x1454e8690 <.text+0x54e7690>
1454e8673: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8678: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454e867d: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8685: c7 85 e0 00 00 00 08 00 00 00       	movl	$0x8, 0xe0(%rbp)
1454e868f: 90                          	nop
1454e8690: 8b 46 40                    	movl	0x40(%rsi), %eax
1454e8693: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1454e8697: 48 89 f9                    	movq	%rdi, %rcx
1454e869a: 4c 89 f2                    	movq	%r14, %rdx
1454e869d: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e86a4: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e86a7: e8 84 4f 00 00              	callq	0x1454ed630 <.text+0x54ec630>
1454e86ac: 90                          	nop
1454e86ad: 49 83 c5 08                 	addq	$0x8, %r13
1454e86b1: 4d 39 ef                    	cmpq	%r13, %r15
1454e86b4: 0f 85 e6 fd ff ff           	jne	0x1454e84a0 <.text+0x54e74a0>
1454e86ba: 48 8b 55 48                 	movq	0x48(%rbp), %rdx
1454e86be: 48 85 d2                    	testq	%rdx, %rdx
1454e86c1: 0f 84 bf 2e 00 00           	je	0x1454eb586 <.text+0x54ea586>
1454e86c7: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e86cb: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e86d1: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454e86d8: e9 a4 2e 00 00              	jmp	0x1454eb581 <.text+0x54ea581>
1454e86dd: f3 0f 10 43 1c              	movss	0x1c(%rbx), %xmm0
1454e86e2: f3 0f 59 43 44              	mulss	0x44(%rbx), %xmm0
1454e86e7: f3 0f 59 46 50              	mulss	0x50(%rsi), %xmm0
1454e86ec: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454e86f0: f3 0f 10 05 1c 3d 71 00     	movss	0x713d1c(%rip), %xmm0   # 0x145bfc414
1454e86f8: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454e86fb: 73 2b                       	jae	0x1454e8728 <.text+0x54e7728>
1454e86fd: f3 0f 58 35 cb 64 4a 01     	addss	0x14a64cb(%rip), %xmm6  # 0x14698ebd0
1454e8705: f3 0f 10 3d d3 06 41 00     	movss	0x4106d3(%rip), %xmm7   # 0x1458f8de0
1454e870d: f3 0f 5e f7                 	divss	%xmm7, %xmm6
1454e8711: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e8714: e8 3e e8 26 00              	callq	0x145756f57 <.text+0x5755f57>
1454e8719: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e871c: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454e8720: f3 0f 58 35 ec 3c 71 00     	addss	0x713cec(%rip), %xmm6   # 0x145bfc414
1454e8728: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454e872d: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454e8730: 0f 2e c3                    	ucomiss	%xmm3, %xmm0
1454e8733: 0f 83 53 09 00 00           	jae	0x1454e908c <.text+0x54e808c>
1454e8739: f3 0f 10 87 e4 08 00 00     	movss	0x8e4(%rdi), %xmm0
1454e8741: f3 0f 11 45 44              	movss	%xmm0, 0x44(%rbp)
1454e8746: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e874a: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e8750: 49 8b 06                    	movq	(%r14), %rax
1454e8753: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e875a: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e8763: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e876c: 48 8d 4d 18                 	leaq	0x18(%rbp), %rcx
1454e8770: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e8777: 48 89 fa                    	movq	%rdi, %rdx
1454e877a: e8 51 59 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e877f: 48 8b 87 c8 04 00 00        	movq	0x4c8(%rdi), %rax
1454e8786: 48 69 8f d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdi), %rcx # imm = 0x160
1454e8791: 48 01 c1                    	addq	%rax, %rcx
1454e8794: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e879b: 48 89 8d e8 00 00 00        	movq	%rcx, 0xe8(%rbp)
1454e87a2: 48 8d 45 44                 	leaq	0x44(%rbp), %rax
1454e87a6: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454e87ad: 4c 8d bd 90 00 00 00        	leaq	0x90(%rbp), %r15
1454e87b4: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e87bb: 4c 89 f9                    	movq	%r15, %rcx
1454e87be: e8 0d e0 03 00              	callq	0x1455267d0 <.text+0x55257d0>
1454e87c3: 90                          	nop
1454e87c4: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e87c7: f3 0f 59 c6                 	mulss	%xmm6, %xmm0
1454e87cb: f3 0f 11 45 40              	movss	%xmm0, 0x40(%rbp)
1454e87d0: 4c 8b 75 20                 	movq	0x20(%rbp), %r14
1454e87d4: 48 8b 45 28                 	movq	0x28(%rbp), %rax
1454e87d8: 48 85 c0                    	testq	%rax, %rax
1454e87db: 74 5e                       	je	0x1454e883b <.text+0x54e783b>
1454e87dd: 49 8d 04 c6                 	leaq	(%r14,%rax,8), %rax
1454e87e1: 4c 8b 87 c8 04 00 00        	movq	0x4c8(%rdi), %r8
1454e87e8: 4c 69 97 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdi), %r10 # imm = 0x160
1454e87f3: b9 18 00 00 00              	movl	$0x18, %ecx
1454e87f8: 4c 89 f2                    	movq	%r14, %rdx
1454e87fb: 48 ff c9                    	decq	%rcx
1454e87fe: 4c 8b 1a                    	movq	(%rdx), %r11
1454e8801: 48 83 c2 08                 	addq	$0x8, %rdx
1454e8805: 45 31 c9                    	xorl	%r9d, %r9d
1454e8808: 4c 89 c6                    	movq	%r8, %rsi
1454e880b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454e8810: 4d 39 ca                    	cmpq	%r9, %r10
1454e8813: 74 1c                       	je	0x1454e8831 <.text+0x54e7831>
1454e8815: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
1454e881c: 4c 39 9e 88 00 00 00        	cmpq	%r11, 0x88(%rsi)
1454e8823: 48 8d b6 60 01 00 00        	leaq	0x160(%rsi), %rsi
1454e882a: 75 e4                       	jne	0x1454e8810 <.text+0x54e7810>
1454e882c: e9 df 14 00 00              	jmp	0x1454e9d10 <.text+0x54e8d10>
1454e8831: 48 85 c9                    	testq	%rcx, %rcx
1454e8834: 74 05                       	je	0x1454e883b <.text+0x54e783b>
1454e8836: 48 39 c2                    	cmpq	%rax, %rdx
1454e8839: 75 c0                       	jne	0x1454e87fb <.text+0x54e77fb>
1454e883b: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454e8842: 48 85 c0                    	testq	%rax, %rax
1454e8845: 74 1a                       	je	0x1454e8861 <.text+0x54e7861>
1454e8847: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454e884e: 48 c1 e0 02                 	shlq	$0x2, %rax
1454e8852: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1454e8856: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454e885c: e8 6f 99 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e8861: 48 8b 55 18                 	movq	0x18(%rbp), %rdx
1454e8865: 48 85 d2                    	testq	%rdx, %rdx
1454e8868: 0f 84 b9 0c 00 00           	je	0x1454e9527 <.text+0x54e8527>
1454e886e: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e8872: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e8878: 4c 89 f1                    	movq	%r14, %rcx
1454e887b: e9 a2 0c 00 00              	jmp	0x1454e9522 <.text+0x54e8522>
1454e8880: f3 44 0f 10 46 58           	movss	0x58(%rsi), %xmm8
1454e8886: f3 44 0f 59 05 b1 04 41 00  	mulss	0x4104b1(%rip), %xmm8   # 0x1458f8d40
1454e888f: f3 44 0f 59 43 20           	mulss	0x20(%rbx), %xmm8
1454e8895: f3 0f 10 73 48              	movss	0x48(%rbx), %xmm6
1454e889a: f3 44 0f 59 c6              	mulss	%xmm6, %xmm8
1454e889f: f3 44 0f 5f 05 78 dd 40 00  	maxss	0x40dd78(%rip), %xmm8   # 0x1458f6620
1454e88a8: f3 0f 10 bf e4 08 00 00     	movss	0x8e4(%rdi), %xmm7
1454e88b0: 8b 46 68                    	movl	0x68(%rsi), %eax
1454e88b3: 83 f8 0a                    	cmpl	$0xa, %eax
1454e88b6: 0f 87 56 21 00 00           	ja	0x1454eaa12 <.text+0x54e9a12>
1454e88bc: b9 0e 07 00 00              	movl	$0x70e, %ecx            # imm = 0x70E
1454e88c1: 0f a3 c1                    	btl	%eax, %ecx
1454e88c4: 0f 83 66 20 00 00           	jae	0x1454ea930 <.text+0x54e9930>
1454e88ca: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e88ce: 89 85 c0 00 00 00           	movl	%eax, 0xc0(%rbp)
1454e88d4: 49 8b 06                    	movq	(%r14), %rax
1454e88d7: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454e88de: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e88e7: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e88f0: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e88f7: 4c 8d b5 b8 00 00 00        	leaq	0xb8(%rbp), %r14
1454e88fe: f3 0f 10 1d fa dc 40 00     	movss	0x40dcfa(%rip), %xmm3   # 0x1458f6600
1454e8906: 48 89 fa                    	movq	%rdi, %rdx
1454e8909: 4d 89 f0                    	movq	%r14, %r8
1454e890c: e8 bf 57 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e8911: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e8918: 48 8b b5 f0 00 00 00        	movq	0xf0(%rbp), %rsi
1454e891f: 48 85 d2                    	testq	%rdx, %rdx
1454e8922: 74 16                       	je	0x1454e893a <.text+0x54e793a>
1454e8924: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e892b: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e892f: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e8935: e8 96 98 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e893a: 48 85 f6                    	testq	%rsi, %rsi
1454e893d: 0f 84 e4 0b 00 00           	je	0x1454e9527 <.text+0x54e8527>
1454e8943: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e894a: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1454e8951: 44 8b 40 40                 	movl	0x40(%rax), %r8d
1454e8955: 48 89 95 90 00 00 00        	movq	%rdx, 0x90(%rbp)
1454e895c: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454e8966: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454e896d: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e8971: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e8976: 4c 89 74 24 28              	movq	%r14, 0x28(%rsp)
1454e897b: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454e8984: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e898b: 4c 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %r9
1454e8992: e8 09 28 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e8997: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e899e: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e89a5: 75 0d                       	jne	0x1454e89b4 <.text+0x54e79b4>
1454e89a7: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454e89ae: e8 fd f6 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e89b3: 90                          	nop
1454e89b4: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454e89bb: 48 89 f1                    	movq	%rsi, %rcx
1454e89be: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454e89c2: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e89c9: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e89d0: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454e89d5: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454e89d9: 48 ff c6                    	incq	%rsi
1454e89dc: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e89e3: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454e89ea: 44 8b 76 68                 	movl	0x68(%rsi), %r14d
1454e89ee: f3 44 0f 10 56 6c           	movss	0x6c(%rsi), %xmm10
1454e89f4: 41 8d 46 ff                 	leal	-0x1(%r14), %eax
1454e89f8: 83 f8 09                    	cmpl	$0x9, %eax
1454e89fb: 0f 87 ab 27 00 00           	ja	0x1454eb1ac <.text+0x54ea1ac>
1454e8a01: f3 0f 10 43 50              	movss	0x50(%rbx), %xmm0
1454e8a06: 48 8d 0d 17 45 4c 01        	leaq	0x14c4517(%rip), %rcx   # 0x1469acf24
1454e8a0d: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1454e8a11: 48 01 c8                    	addq	%rcx, %rax
1454e8a14: ff e0                       	jmpq	*%rax
1454e8a16: f3 44 0f 59 d0              	mulss	%xmm0, %xmm10
1454e8a1b: 48 8d 8f f0 02 00 00        	leaq	0x2f0(%rdi), %rcx
1454e8a22: 48 8b 9f 00 03 00 00        	movq	0x300(%rdi), %rbx
1454e8a29: 44 8b 7e 40                 	movl	0x40(%rsi), %r15d
1454e8a2d: 48 85 db                    	testq	%rbx, %rbx
1454e8a30: 0f 84 43 1f 00 00           	je	0x1454ea979 <.text+0x54e9979>
1454e8a36: 48 8b 87 f8 02 00 00        	movq	0x2f8(%rdi), %rax
1454e8a3d: 31 d2                       	xorl	%edx, %edx
1454e8a3f: 49 89 c0                    	movq	%rax, %r8
1454e8a42: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454e8a50: 45 39 78 0c                 	cmpl	%r15d, 0xc(%r8)
1454e8a54: 0f 84 04 2d 00 00           	je	0x1454eb75e <.text+0x54ea75e>
1454e8a5a: 48 ff c2                    	incq	%rdx
1454e8a5d: 49 83 c0 18                 	addq	$0x18, %r8
1454e8a61: 48 39 d3                    	cmpq	%rdx, %rbx
1454e8a64: 75 ea                       	jne	0x1454e8a50 <.text+0x54e7a50>
1454e8a66: e9 10 1f 00 00              	jmp	0x1454ea97b <.text+0x54e997b>
1454e8a6b: 41 bc 01 00 00 00           	movl	$0x1, %r12d
1454e8a71: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454e8a76: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e8a7a: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e8a80: 49 8b 06                    	movq	(%r14), %rax
1454e8a83: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e8a8a: 48 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %rcx
1454e8a91: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e8a98: 48 89 fa                    	movq	%rdi, %rdx
1454e8a9b: e8 00 58 00 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454e8aa0: 4c 8b bd a0 00 00 00        	movq	0xa0(%rbp), %r15
1454e8aa7: 4d 85 ff                    	testq	%r15, %r15
1454e8aaa: 0f 84 e0 00 00 00           	je	0x1454e8b90 <.text+0x54e7b90>
1454e8ab0: 80 7e 75 01                 	cmpb	$0x1, 0x75(%rsi)
1454e8ab4: 0f 85 5f 05 00 00           	jne	0x1454e9019 <.text+0x54e8019>
1454e8aba: 4c 8b b5 98 00 00 00        	movq	0x98(%rbp), %r14
1454e8ac1: 4c 8d 87 80 08 00 00        	leaq	0x880(%rdi), %r8
1454e8ac8: c6 85 27 01 00 00 01        	movb	$0x1, 0x127(%rbp)
1454e8acf: 4c 89 f1                    	movq	%r14, %rcx
1454e8ad2: 4c 89 fa                    	movq	%r15, %rdx
1454e8ad5: e8 86 40 f2 ff              	callq	0x14540cb60 <.text+0x540bb60>
1454e8ada: 90                          	nop
1454e8adb: 48 83 7e 08 0f              	cmpq	$0xf, 0x8(%rsi)
1454e8ae0: 0f 85 29 27 00 00           	jne	0x1454eb20f <.text+0x54ea20f>
1454e8ae6: 48 8b 06                    	movq	(%rsi), %rax
1454e8ae9: 48 b9 61 72 63 61 6e 65 5f 6d       	movabsq	$0x6d5f656e61637261, %rcx # imm = 0x6D5F656E61637261
1454e8af3: 48 33 08                    	xorq	(%rax), %rcx
1454e8af6: 48 ba 6d 69 73 73 69 6c 65 73       	movabsq	$0x73656c697373696d, %rdx # imm = 0x73656C697373696D
1454e8b00: 48 33 50 07                 	xorq	0x7(%rax), %rdx
1454e8b04: 48 09 ca                    	orq	%rcx, %rdx
1454e8b07: 0f 85 02 27 00 00           	jne	0x1454eb20f <.text+0x54ea20f>
1454e8b0d: 4b 8d 04 fe                 	leaq	(%r14,%r15,8), %rax
1454e8b11: 48 8d 8f c0 04 00 00        	leaq	0x4c0(%rdi), %rcx
1454e8b18: 4c 89 b5 e0 00 00 00        	movq	%r14, 0xe0(%rbp)
1454e8b1f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454e8b26: 48 89 8d f0 00 00 00        	movq	%rcx, 0xf0(%rbp)
1454e8b2d: c6 85 27 01 00 00 01        	movb	$0x1, 0x127(%rbp)
1454e8b34: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454e8b38: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e8b3f: e8 ec 9a 04 00              	callq	0x145532630 <.text+0x5531630>
1454e8b44: 90                          	nop
1454e8b45: 48 83 7d d8 00              	cmpq	$0x0, -0x28(%rbp)
1454e8b4a: 0f 84 a3 26 00 00           	je	0x1454eb1f3 <.text+0x54ea1f3>
1454e8b50: 48 8b 95 90 00 00 00        	movq	0x90(%rbp), %rdx
1454e8b57: 48 85 d2                    	testq	%rdx, %rdx
1454e8b5a: 74 12                       	je	0x1454e8b6e <.text+0x54e7b6e>
1454e8b5c: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e8b60: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e8b66: 4c 89 f1                    	movq	%r14, %rcx
1454e8b69: e8 62 96 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e8b6e: 0f 10 45 c8                 	movups	-0x38(%rbp), %xmm0
1454e8b72: 0f 29 85 90 00 00 00        	movaps	%xmm0, 0x90(%rbp)
1454e8b79: 4c 8b 7d d8                 	movq	-0x28(%rbp), %r15
1454e8b7d: 4c 89 bd a0 00 00 00        	movq	%r15, 0xa0(%rbp)
1454e8b84: 4c 8b b5 98 00 00 00        	movq	0x98(%rbp), %r14
1454e8b8b: e9 7f 26 00 00              	jmp	0x1454eb20f <.text+0x54ea20f>
1454e8b90: 48 8b 95 90 00 00 00        	movq	0x90(%rbp), %rdx
1454e8b97: 48 85 d2                    	testq	%rdx, %rdx
1454e8b9a: 0f 84 87 09 00 00           	je	0x1454e9527 <.text+0x54e8527>
1454e8ba0: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454e8ba7: e9 6c 09 00 00              	jmp	0x1454e9518 <.text+0x54e8518>
1454e8bac: 41 bd 01 00 00 00           	movl	$0x1, %r13d
1454e8bb2: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454e8bb7: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e8bbb: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e8bc1: 49 8b 06                    	movq	(%r14), %rax
1454e8bc4: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e8bcb: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e8bd2: 4c 8d a5 e0 00 00 00        	leaq	0xe0(%rbp), %r12
1454e8bd9: 48 89 fa                    	movq	%rdi, %rdx
1454e8bdc: 4d 89 e0                    	movq	%r12, %r8
1454e8bdf: e8 bc 56 00 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454e8be4: 4c 8b b5 c8 00 00 00        	movq	0xc8(%rbp), %r14
1454e8beb: 4d 85 f6                    	testq	%r14, %r14
1454e8bee: 0f 84 09 04 00 00           	je	0x1454e8ffd <.text+0x54e7ffd>
1454e8bf4: 80 7e 75 07                 	cmpb	$0x7, 0x75(%rsi)
1454e8bf8: 75 4f                       	jne	0x1454e8c49 <.text+0x54e7c49>
1454e8bfa: 4c 8b bd c0 00 00 00        	movq	0xc0(%rbp), %r15
1454e8c01: f3 0f 10 87 e4 08 00 00     	movss	0x8e4(%rdi), %xmm0
1454e8c09: f3 0f 11 45 18              	movss	%xmm0, 0x18(%rbp)
1454e8c0e: 48 89 bd e0 00 00 00        	movq	%rdi, 0xe0(%rbp)
1454e8c15: 48 8d 45 18                 	leaq	0x18(%rbp), %rax
1454e8c19: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454e8c20: 4c 89 a5 90 00 00 00        	movq	%r12, 0x90(%rbp)
1454e8c27: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454e8c2e: 48 89 45 50                 	movq	%rax, 0x50(%rbp)
1454e8c32: 49 83 fe 01                 	cmpq	$0x1, %r14
1454e8c36: 48 89 fb                    	movq	%rdi, %rbx
1454e8c39: 0f 85 7a 2c 00 00           	jne	0x1454eb8b9 <.text+0x54ea8b9>
1454e8c3f: 48 89 df                    	movq	%rbx, %rdi
1454e8c42: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454e8c49: 4d 39 f5                    	cmpq	%r14, %r13
1454e8c4c: 4d 0f 42 f5                 	cmovbq	%r13, %r14
1454e8c50: 48 8b 9d c0 00 00 00        	movq	0xc0(%rbp), %rbx
1454e8c57: 48 8b 03                    	movq	(%rbx), %rax
1454e8c5a: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e8c61: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454e8c65: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
1454e8c69: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454e8c70: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454e8c7a: c6 85 de 00 00 00 01        	movb	$0x1, 0xde(%rbp)
1454e8c81: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454e8c88: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e8c8d: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e8c91: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454e8c96: 4c 89 74 24 20              	movq	%r14, 0x20(%rsp)
1454e8c9b: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e8ca2: 49 89 d9                    	movq	%rbx, %r9
1454e8ca5: e8 f6 24 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e8caa: 90                          	nop
1454e8cab: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e8cb2: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e8cb9: 75 0d                       	jne	0x1454e8cc8 <.text+0x54e7cc8>
1454e8cbb: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454e8cc2: e8 e9 f3 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e8cc7: 90                          	nop
1454e8cc8: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454e8ccf: 48 89 f1                    	movq	%rsi, %rcx
1454e8cd2: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454e8cd6: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e8cdd: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e8ce4: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454e8ce9: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454e8ced: 48 ff c6                    	incq	%rsi
1454e8cf0: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e8cf7: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454e8cfe: 48 89 85 18 01 00 00        	movq	%rax, 0x118(%rbp)
1454e8d05: 4e 8d 3c f3                 	leaq	(%rbx,%r14,8), %r15
1454e8d09: 41 0f 28 fa                 	movaps	%xmm10, %xmm7
1454e8d0d: f3 41 0f 58 fa              	addss	%xmm10, %xmm7
1454e8d12: 48 8b 45 78                 	movq	0x78(%rbp), %rax
1454e8d16: f3 44 0f 10 40 48           	movss	0x48(%rax), %xmm8
1454e8d1c: f3 44 0f 10 48 50           	movss	0x50(%rax), %xmm9
1454e8d22: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454e8d29: 4c 8d 66 68                 	leaq	0x68(%rsi), %r12
1454e8d2d: f3 44 0f 10 1d 0e 21 42 00  	movss	0x42210e(%rip), %xmm11  # 0x14590ae44
1454e8d36: f3 44 0f 10 25 81 26 50 00  	movss	0x502681(%rip), %xmm12  # 0x1459eb3c0
1454e8d3f: 4c 8d 2d 56 42 4c 01        	leaq	0x14c4256(%rip), %r13   # 0x1469acf9c
1454e8d46: f3 44 0f 10 2d c5 27 40 00  	movss	0x4027c5(%rip), %xmm13  # 0x1458eb514
1454e8d4f: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454e8d53: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454e8d60: 4c 8b 33                    	movq	(%rbx), %r14
1454e8d63: 80 7e 75 07                 	cmpb	$0x7, 0x75(%rsi)
1454e8d67: 41 0f 28 f2                 	movaps	%xmm10, %xmm6
1454e8d6b: 75 67                       	jne	0x1454e8dd4 <.text+0x54e7dd4>
1454e8d6d: 48 8b 87 c8 04 00 00        	movq	0x4c8(%rdi), %rax
1454e8d74: 48 69 97 d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdi), %rdx # imm = 0x160
1454e8d7f: 31 c9                       	xorl	%ecx, %ecx
1454e8d81: 49 89 c0                    	movq	%rax, %r8
1454e8d84: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454e8d90: 48 39 ca                    	cmpq	%rcx, %rdx
1454e8d93: 74 3b                       	je	0x1454e8dd0 <.text+0x54e7dd0>
1454e8d95: 48 81 c1 60 01 00 00        	addq	$0x160, %rcx            # imm = 0x160
1454e8d9c: 4d 39 b0 88 00 00 00        	cmpq	%r14, 0x88(%r8)
1454e8da3: 4d 8d 80 60 01 00 00        	leaq	0x160(%r8), %r8
1454e8daa: 75 e4                       	jne	0x1454e8d90 <.text+0x54e7d90>
1454e8dac: f3 0f 10 44 08 90           	movss	-0x70(%rax,%rcx), %xmm0
1454e8db2: f3 0f 5e 44 08 94           	divss	-0x6c(%rax,%rcx), %xmm0
1454e8db8: 44 0f 2e d8                 	ucomiss	%xmm0, %xmm11
1454e8dbc: 41 0f 28 f2                 	movaps	%xmm10, %xmm6
1454e8dc0: 76 12                       	jbe	0x1454e8dd4 <.text+0x54e7dd4>
1454e8dc2: 0f 28 f7                    	movaps	%xmm7, %xmm6
1454e8dc5: eb 0d                       	jmp	0x1454e8dd4 <.text+0x54e7dd4>
1454e8dc7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454e8dd0: 41 0f 28 f2                 	movaps	%xmm10, %xmm6
1454e8dd4: 48 8b 87 80 08 00 00        	movq	0x880(%rdi), %rax
1454e8ddb: 48 8b 8f 98 08 00 00        	movq	0x898(%rdi), %rcx
1454e8de2: 48 8d 14 01                 	leaq	(%rcx,%rax), %rdx
1454e8de6: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454e8dea: 48 01 c2                    	addq	%rax, %rdx
1454e8ded: 4c 8b 87 88 08 00 00        	movq	0x888(%rdi), %r8
1454e8df4: 4d 89 c1                    	movq	%r8, %r9
1454e8df7: 49 c1 e1 11                 	shlq	$0x11, %r9
1454e8dfb: 4c 8b 97 90 08 00 00        	movq	0x890(%rdi), %r10
1454e8e02: 49 31 c2                    	xorq	%rax, %r10
1454e8e05: 4c 31 c1                    	xorq	%r8, %rcx
1454e8e08: 4d 31 d0                    	xorq	%r10, %r8
1454e8e0b: 4c 89 87 88 08 00 00        	movq	%r8, 0x888(%rdi)
1454e8e12: 48 31 c8                    	xorq	%rcx, %rax
1454e8e15: 48 89 87 80 08 00 00        	movq	%rax, 0x880(%rdi)
1454e8e1c: 4d 31 ca                    	xorq	%r9, %r10
1454e8e1f: 4c 89 97 90 08 00 00        	movq	%r10, 0x890(%rdi)
1454e8e26: 48 c1 c1 2d                 	rolq	$0x2d, %rcx
1454e8e2a: 48 89 8f 98 08 00 00        	movq	%rcx, 0x898(%rdi)
1454e8e31: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454e8e35: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454e8e38: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454e8e3c: f3 41 0f 59 c4              	mulss	%xmm12, %xmm0
1454e8e41: f3 0f 10 8f 64 04 00 00     	movss	0x464(%rdi), %xmm1
1454e8e49: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e8e4c: 76 08                       	jbe	0x1454e8e56 <.text+0x54e7e56>
1454e8e4e: f3 0f 59 b7 68 04 00 00     	mulss	0x468(%rdi), %xmm6
1454e8e56: 44 8b 4e 40                 	movl	0x40(%rsi), %r9d
1454e8e5a: 0f b6 46 74                 	movzbl	0x74(%rsi), %eax
1454e8e5e: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454e8e61: 0f 97 44 24 28              	seta	0x28(%rsp)
1454e8e66: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454e8e6a: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454e8e6f: 48 89 f9                    	movq	%rdi, %rcx
1454e8e72: 4c 89 f2                    	movq	%r14, %rdx
1454e8e75: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454e8e78: e8 33 a0 fd ff              	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454e8e7d: 90                          	nop
1454e8e7e: 41 8b 04 24                 	movl	(%r12), %eax
1454e8e82: ff c8                       	decl	%eax
1454e8e84: 83 f8 09                    	cmpl	$0x9, %eax
1454e8e87: 77 38                       	ja	0x1454e8ec1 <.text+0x54e7ec1>
1454e8e89: 49 63 44 85 00              	movslq	(%r13,%rax,4), %rax
1454e8e8e: 4c 01 e8                    	addq	%r13, %rax
1454e8e91: ff e0                       	jmpq	*%rax
1454e8e93: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8e98: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e8e9d: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454e8ea2: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8eaa: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e8eb2: c7 85 e0 00 00 00 01 00 00 00       	movl	$0x1, 0xe0(%rbp)
1454e8ebc: e9 ef 00 00 00              	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8ec1: 41 8b 44 24 08              	movl	0x8(%r12), %eax
1454e8ec6: 89 85 e8 00 00 00           	movl	%eax, 0xe8(%rbp)
1454e8ecc: 49 8b 04 24                 	movq	(%r12), %rax
1454e8ed0: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454e8ed7: e9 d4 00 00 00              	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8edc: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8ee1: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8ee6: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8eee: c7 85 e0 00 00 00 09 00 00 00       	movl	$0x9, 0xe0(%rbp)
1454e8ef8: e9 b3 00 00 00              	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8efd: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8f02: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8f07: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8f0f: c7 85 e0 00 00 00 02 00 00 00       	movl	$0x2, 0xe0(%rbp)
1454e8f19: e9 92 00 00 00              	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8f1e: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8f23: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8f28: f3 41 0f 5d c5              	minss	%xmm13, %xmm0
1454e8f2d: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e8f32: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454e8f37: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8f3f: f3 0f 11 8d e8 00 00 00     	movss	%xmm1, 0xe8(%rbp)
1454e8f47: c7 85 e0 00 00 00 0a 00 00 00       	movl	$0xa, 0xe0(%rbp)
1454e8f51: eb 5d                       	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8f53: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8f58: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8f5d: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8f65: c7 85 e0 00 00 00 03 00 00 00       	movl	$0x3, 0xe0(%rbp)
1454e8f6f: eb 3f                       	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8f71: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8f76: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8f7b: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8f83: c7 85 e0 00 00 00 07 00 00 00       	movl	$0x7, 0xe0(%rbp)
1454e8f8d: eb 21                       	jmp	0x1454e8fb0 <.text+0x54e7fb0>
1454e8f8f: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e8f94: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e8f99: f3 0f 11 85 e4 00 00 00     	movss	%xmm0, 0xe4(%rbp)
1454e8fa1: c7 85 e0 00 00 00 08 00 00 00       	movl	$0x8, 0xe0(%rbp)
1454e8fab: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454e8fb0: 8b 46 40                    	movl	0x40(%rsi), %eax
1454e8fb3: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1454e8fb7: 48 89 f9                    	movq	%rdi, %rcx
1454e8fba: 4c 89 f2                    	movq	%r14, %rdx
1454e8fbd: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454e8fc4: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e8fc7: e8 64 46 00 00              	callq	0x1454ed630 <.text+0x54ec630>
1454e8fcc: 90                          	nop
1454e8fcd: 48 83 c3 08                 	addq	$0x8, %rbx
1454e8fd1: 4c 39 fb                    	cmpq	%r15, %rbx
1454e8fd4: 0f 85 86 fd ff ff           	jne	0x1454e8d60 <.text+0x54e7d60>
1454e8fda: 48 8b 95 18 01 00 00        	movq	0x118(%rbp), %rdx
1454e8fe1: 48 85 d2                    	testq	%rdx, %rdx
1454e8fe4: 0f 84 9c 25 00 00           	je	0x1454eb586 <.text+0x54ea586>
1454e8fea: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e8fee: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e8ff4: 48 8b 4d 78                 	movq	0x78(%rbp), %rcx
1454e8ff8: e9 84 25 00 00              	jmp	0x1454eb581 <.text+0x54ea581>
1454e8ffd: 48 8b 95 b8 00 00 00        	movq	0xb8(%rbp), %rdx
1454e9004: 48 85 d2                    	testq	%rdx, %rdx
1454e9007: 0f 84 1a 05 00 00           	je	0x1454e9527 <.text+0x54e8527>
1454e900d: 48 8b 8d c0 00 00 00        	movq	0xc0(%rbp), %rcx
1454e9014: e9 ff 04 00 00              	jmp	0x1454e9518 <.text+0x54e8518>
1454e9019: 48 83 7e 08 0a              	cmpq	$0xa, 0x8(%rsi)
1454e901e: 0f 85 c6 1f 00 00           	jne	0x1454eafea <.text+0x54e9fea>
1454e9024: 48 8b 87 b0 07 00 00        	movq	0x7b0(%rdi), %rax
1454e902b: 48 85 c0                    	testq	%rax, %rax
1454e902e: 0f 84 b6 1f 00 00           	je	0x1454eafea <.text+0x54e9fea>
1454e9034: 48 8b 0e                    	movq	(%rsi), %rcx
1454e9037: 48 ba 61 69 6d 65 64 5f 73 68       	movabsq	$0x68735f64656d6961, %rdx # imm = 0x68735F64656D6961
1454e9041: 48 33 11                    	xorq	(%rcx), %rdx
1454e9044: 0f b7 49 08                 	movzwl	0x8(%rcx), %ecx
1454e9048: 48 81 f1 6f 74 00 00        	xorq	$0x746f, %rcx           # imm = 0x746F
1454e904f: 48 09 d1                    	orq	%rdx, %rcx
1454e9052: 0f 85 92 1f 00 00           	jne	0x1454eafea <.text+0x54e9fea>
1454e9058: 48 8b 95 98 00 00 00        	movq	0x98(%rbp), %rdx
1454e905f: 4e 8d 04 fd f8 ff ff ff     	leaq	-0x8(,%r15,8), %r8
1454e9067: 45 31 c9                    	xorl	%r9d, %r9d
1454e906a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454e9070: 4a 39 04 ca                 	cmpq	%rax, (%rdx,%r9,8)
1454e9074: 0f 84 33 1f 00 00           	je	0x1454eafad <.text+0x54e9fad>
1454e907a: 49 ff c1                    	incq	%r9
1454e907d: 49 83 c0 f8                 	addq	$-0x8, %r8
1454e9081: 49 83 f8 f8                 	cmpq	$-0x8, %r8
1454e9085: 75 e9                       	jne	0x1454e9070 <.text+0x54e8070>
1454e9087: e9 5e 1f 00 00              	jmp	0x1454eafea <.text+0x54e9fea>
1454e908c: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e9090: 89 85 c0 00 00 00           	movl	%eax, 0xc0(%rbp)
1454e9096: 49 8b 06                    	movq	(%r14), %rax
1454e9099: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454e90a0: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e90a9: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e90b2: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e90b9: 4c 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %r8
1454e90c0: 48 89 fa                    	movq	%rdi, %rdx
1454e90c3: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e90c6: e8 05 50 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e90cb: 48 83 bd f0 00 00 00 00     	cmpq	$0x0, 0xf0(%rbp)
1454e90d3: 0f 84 2c 04 00 00           	je	0x1454e9505 <.text+0x54e8505>
1454e90d9: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e90e0: 48 85 d2                    	testq	%rdx, %rdx
1454e90e3: 74 16                       	je	0x1454e90fb <.text+0x54e80fb>
1454e90e5: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e90ec: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e90f0: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e90f6: e8 d5 90 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e90fb: f2 0f 10 7d 08              	movsd	0x8(%rbp), %xmm7
1454e9100: e9 ea 1b 00 00              	jmp	0x1454eacef <.text+0x54e9cef>
1454e9105: 41 bc 01 00 00 00           	movl	$0x1, %r12d
1454e910b: 83 f9 03                    	cmpl	$0x3, %ecx
1454e910e: b8 03 00 00 00              	movl	$0x3, %eax
1454e9113: 0f 42 c1                    	cmovbl	%ecx, %eax
1454e9116: ff c0                       	incl	%eax
1454e9118: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
1454e911c: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454e9121: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e9125: 89 85 98 00 00 00           	movl	%eax, 0x98(%rbp)
1454e912b: 49 8b 06                    	movq	(%r14), %rax
1454e912e: 48 89 85 90 00 00 00        	movq	%rax, 0x90(%rbp)
1454e9135: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454e913e: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454e9147: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e914e: 4c 8d 85 90 00 00 00        	leaq	0x90(%rbp), %r8
1454e9155: 48 89 fa                    	movq	%rdi, %rdx
1454e9158: e8 73 4f 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e915d: 48 8b 85 e0 00 00 00        	movq	0xe0(%rbp), %rax
1454e9164: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e916b: 48 8b 95 f0 00 00 00        	movq	0xf0(%rbp), %rdx
1454e9172: 48 8d 14 d1                 	leaq	(%rcx,%rdx,8), %rdx
1454e9176: 48 89 8d e0 00 00 00        	movq	%rcx, 0xe0(%rbp)
1454e917d: 48 89 8d e8 00 00 00        	movq	%rcx, 0xe8(%rbp)
1454e9184: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454e918b: 48 89 95 f8 00 00 00        	movq	%rdx, 0xf8(%rbp)
1454e9192: 48 89 bd 00 01 00 00        	movq	%rdi, 0x100(%rbp)
1454e9199: 48 89 bd 08 01 00 00        	movq	%rdi, 0x108(%rbp)
1454e91a0: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e91a7: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e91ae: e8 6d 2e 04 00              	callq	0x14552c020 <.text+0x552b020>
1454e91b3: 4c 8b 9d c0 00 00 00        	movq	0xc0(%rbp), %r11
1454e91ba: 4c 8b b5 c8 00 00 00        	movq	0xc8(%rbp), %r14
1454e91c1: 4c 8d 6d 3f                 	leaq	0x3f(%rbp), %r13
1454e91c5: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454e91cc: 49 83 fe 02                 	cmpq	$0x2, %r14
1454e91d0: 0f 83 59 26 00 00           	jae	0x1454eb82f <.text+0x54ea82f>
1454e91d6: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454e91dd: 4d 85 f6                    	testq	%r14, %r14
1454e91e0: 0f 84 bb 03 00 00           	je	0x1454e95a1 <.text+0x54e85a1>
1454e91e6: 49 8d 56 ff                 	leaq	-0x1(%r14), %rdx
1454e91ea: 44 89 f1                    	movl	%r14d, %ecx
1454e91ed: 83 e1 03                    	andl	$0x3, %ecx
1454e91f0: 48 83 fa 03                 	cmpq	$0x3, %rdx
1454e91f4: 0f 83 34 03 00 00           	jae	0x1454e952e <.text+0x54e852e>
1454e91fa: 31 d2                       	xorl	%edx, %edx
1454e91fc: e9 73 03 00 00              	jmp	0x1454e9574 <.text+0x54e8574>
1454e9201: 41 bd 01 00 00 00           	movl	$0x1, %r13d
1454e9207: f3 0f 10 5e 4c              	movss	0x4c(%rsi), %xmm3
1454e920c: 41 8b 46 08                 	movl	0x8(%r14), %eax
1454e9210: 89 85 c0 00 00 00           	movl	%eax, 0xc0(%rbp)
1454e9216: 49 8b 06                    	movq	(%r14), %rax
1454e9219: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454e9220: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e9227: 4c 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %r8
1454e922e: 48 89 fa                    	movq	%rdi, %rdx
1454e9231: e8 6a 50 00 00              	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454e9236: 48 83 bd f0 00 00 00 00     	cmpq	$0x0, 0xf0(%rbp)
1454e923e: 0f 84 c1 02 00 00           	je	0x1454e9505 <.text+0x54e8505>
1454e9244: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e924b: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e9252: 48 8b 19                    	movq	(%rcx), %rbx
1454e9255: 48 85 d2                    	testq	%rdx, %rdx
1454e9258: 74 0f                       	je	0x1454e9269 <.text+0x54e8269>
1454e925a: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e925e: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e9264: e8 67 8f b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e9269: 48 8b 87 f8 06 00 00        	movq	0x6f8(%rdi), %rax
1454e9270: 48 8b 8f 00 07 00 00        	movq	0x700(%rdi), %rcx
1454e9277: 48 c1 e1 06                 	shlq	$0x6, %rcx
1454e927b: 31 d2                       	xorl	%edx, %edx
1454e927d: f3 0f 10 05 7f 7c 44 00     	movss	0x447c7f(%rip), %xmm0   # 0x145930f04
1454e9285: f3 0f 11 45 34              	movss	%xmm0, 0x34(%rbp)
1454e928a: f3 0f 10 05 ee 21 40 00     	movss	0x4021ee(%rip), %xmm0   # 0x1458eb480
1454e9292: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454e92a0: 48 39 d1                    	cmpq	%rdx, %rcx
1454e92a3: 74 0f                       	je	0x1454e92b4 <.text+0x54e82b4>
1454e92a5: 80 3c 10 17                 	cmpb	$0x17, (%rax,%rdx)
1454e92a9: 48 8d 52 40                 	leaq	0x40(%rdx), %rdx
1454e92ad: 75 f1                       	jne	0x1454e92a0 <.text+0x54e82a0>
1454e92af: f3 0f 11 45 34              	movss	%xmm0, 0x34(%rbp)
1454e92b4: e8 47 8f b1 fa              	callq	0x140002200 <.text+0x1200>
1454e92b9: b9 08 00 00 00              	movl	$0x8, %ecx
1454e92be: ba 08 00 00 00              	movl	$0x8, %edx
1454e92c3: e8 f8 8e b1 fa              	callq	0x1400021c0 <.text+0x11c0>
1454e92c8: 48 85 c0                    	testq	%rax, %rax
1454e92cb: 0f 84 d7 25 00 00           	je	0x1454eb8a8 <.text+0x54ea8a8>
1454e92d1: 48 89 18                    	movq	%rbx, (%rax)
1454e92d4: 48 c7 85 b8 00 00 00 01 00 00 00    	movq	$0x1, 0xb8(%rbp)
1454e92df: 48 89 85 c0 00 00 00        	movq	%rax, 0xc0(%rbp)
1454e92e6: 48 c7 85 c8 00 00 00 01 00 00 00    	movq	$0x1, 0xc8(%rbp)
1454e92f1: 48 8b 45 78                 	movq	0x78(%rbp), %rax
1454e92f5: f3 0f 10 40 1c              	movss	0x1c(%rax), %xmm0
1454e92fa: f3 0f 59 40 44              	mulss	0x44(%rax), %xmm0
1454e92ff: f3 0f 59 46 50              	mulss	0x50(%rsi), %xmm0
1454e9304: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454e9308: f3 0f 10 05 04 31 71 00     	movss	0x713104(%rip), %xmm0   # 0x145bfc414
1454e9310: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454e9313: 48 89 9d 18 01 00 00        	movq	%rbx, 0x118(%rbp)
1454e931a: 73 2b                       	jae	0x1454e9347 <.text+0x54e8347>
1454e931c: f3 0f 58 35 ac 58 4a 01     	addss	0x14a58ac(%rip), %xmm6  # 0x14698ebd0
1454e9324: f3 0f 10 3d b4 fa 40 00     	movss	0x40fab4(%rip), %xmm7   # 0x1458f8de0
1454e932c: f3 0f 5e f7                 	divss	%xmm7, %xmm6
1454e9330: 0f 28 c6                    	movaps	%xmm6, %xmm0
1454e9333: e8 1f dc 26 00              	callq	0x145756f57 <.text+0x5755f57>
1454e9338: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e933b: f3 0f 59 f7                 	mulss	%xmm7, %xmm6
1454e933f: f3 0f 58 35 cd 30 71 00     	addss	0x7130cd(%rip), %xmm6   # 0x145bfc414
1454e9347: 41 bc 01 00 00 00           	movl	$0x1, %r12d
1454e934d: 4c 8d b5 e0 00 00 00        	leaq	0xe0(%rbp), %r14
1454e9354: 4c 8d 7d e8                 	leaq	-0x18(%rbp), %r15
1454e9358: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1454e935c: f3 44 0f 10 0d 1b 21 40 00  	movss	0x40211b(%rip), %xmm9   # 0x1458eb480
1454e9365: eb 1e                       	jmp	0x1454e9385 <.text+0x54e8385>
1454e9367: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454e9370: 48 8b 85 c0 00 00 00        	movq	0xc0(%rbp), %rax
1454e9377: 4a 89 34 e0                 	movq	%rsi, (%rax,%r12,8)
1454e937b: 49 ff c4                    	incq	%r12
1454e937e: 4c 89 a5 c8 00 00 00        	movq	%r12, 0xc8(%rbp)
1454e9385: 4d 39 ec                    	cmpq	%r13, %r12
1454e9388: 0f 83 43 06 00 00           	jae	0x1454e99d1 <.text+0x54e89d1>
1454e938e: 4d 85 e4                    	testq	%r12, %r12
1454e9391: 0f 84 b1 23 00 00           	je	0x1454eb748 <.text+0x54ea748>
1454e9397: 48 8b 85 c0 00 00 00        	movq	0xc0(%rbp), %rax
1454e939e: 4e 8b 44 e0 f8              	movq	-0x8(%rax,%r12,8), %r8
1454e93a3: f3 0f 10 87 e4 08 00 00     	movss	0x8e4(%rdi), %xmm0
1454e93ab: 48 8b 8f c8 04 00 00        	movq	0x4c8(%rdi), %rcx
1454e93b2: 4c 69 8f d0 04 00 00 60 01 00 00    	imulq	$0x160, 0x4d0(%rdi), %r9 # imm = 0x160
1454e93bd: 31 d2                       	xorl	%edx, %edx
1454e93bf: 49 89 ca                    	movq	%rcx, %r10
1454e93c2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454e93d0: 49 39 d1                    	cmpq	%rdx, %r9
1454e93d3: 74 7b                       	je	0x1454e9450 <.text+0x54e8450>
1454e93d5: 48 81 c2 60 01 00 00        	addq	$0x160, %rdx            # imm = 0x160
1454e93dc: 4d 39 82 88 00 00 00        	cmpq	%r8, 0x88(%r10)
1454e93e3: 4d 8d 92 60 01 00 00        	leaq	0x160(%r10), %r10
1454e93ea: 75 e4                       	jne	0x1454e93d0 <.text+0x54e83d0>
1454e93ec: f3 0f 10 4c 11 c8           	movss	-0x38(%rcx,%rdx), %xmm1
1454e93f2: 44 0f 2e c1                 	ucomiss	%xmm1, %xmm8
1454e93f6: 73 68                       	jae	0x1454e9460 <.text+0x54e8460>
1454e93f8: f3 0f 5c 44 11 c4           	subss	-0x3c(%rcx,%rdx), %xmm0
1454e93fe: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1454e9402: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454e9405: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454e9409: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454e940d: f3 0f 5d d1                 	minss	%xmm1, %xmm2
1454e9411: f2 0f 10 4c 11 ac           	movsd	-0x54(%rcx,%rdx), %xmm1
1454e9417: f2 0f 10 5c 11 b8           	movsd	-0x48(%rcx,%rdx), %xmm3
1454e941d: 0f 5c d9                    	subps	%xmm1, %xmm3
1454e9420: f3 0f 12 c2                 	movsldup	%xmm2, %xmm0            # xmm0 = xmm2[0,0,2,2]
1454e9424: 0f 59 c3                    	mulps	%xmm3, %xmm0
1454e9427: 0f 58 c1                    	addps	%xmm1, %xmm0
1454e942a: f3 0f 10 5c 11 b4           	movss	-0x4c(%rcx,%rdx), %xmm3
1454e9430: f3 0f 10 4c 11 c0           	movss	-0x40(%rcx,%rdx), %xmm1
1454e9436: f3 0f 5c cb                 	subss	%xmm3, %xmm1
1454e943a: f3 0f 59 ca                 	mulss	%xmm2, %xmm1
1454e943e: f3 0f 58 cb                 	addss	%xmm3, %xmm1
1454e9442: eb 28                       	jmp	0x1454e946c <.text+0x54e846c>
1454e9444: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454e9450: 8b 4d 10                    	movl	0x10(%rbp), %ecx
1454e9453: 89 4d f0                    	movl	%ecx, -0x10(%rbp)
1454e9456: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
1454e945a: 48 89 4d e8                 	movq	%rcx, -0x18(%rbp)
1454e945e: eb 15                       	jmp	0x1454e9475 <.text+0x54e8475>
1454e9460: f2 0f 10 44 11 b8           	movsd	-0x48(%rcx,%rdx), %xmm0
1454e9466: f3 0f 10 4c 11 c0           	movss	-0x40(%rcx,%rdx), %xmm1
1454e946c: 0f 13 45 e8                 	movlps	%xmm0, -0x18(%rbp)
1454e9470: f3 0f 11 4d f0              	movss	%xmm1, -0x10(%rbp)
1454e9475: c6 85 26 01 00 00 01        	movb	$0x1, 0x126(%rbp)
1454e947c: 4c 89 64 24 28              	movq	%r12, 0x28(%rsp)
1454e9481: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454e9486: 4c 89 f1                    	movq	%r14, %rcx
1454e9489: 48 89 fa                    	movq	%rdi, %rdx
1454e948c: 4d 89 f8                    	movq	%r15, %r8
1454e948f: 0f 28 de                    	movaps	%xmm6, %xmm3
1454e9492: e8 39 4c 00 00              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454e9497: 90                          	nop
1454e9498: 48 89 fb                    	movq	%rdi, %rbx
1454e949b: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e94a2: 48 8b bd f0 00 00 00        	movq	0xf0(%rbp), %rdi
1454e94a9: 48 85 ff                    	testq	%rdi, %rdi
1454e94ac: 74 03                       	je	0x1454e94b1 <.text+0x54e84b1>
1454e94ae: 48 8b 31                    	movq	(%rcx), %rsi
1454e94b1: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e94b8: 48 85 d2                    	testq	%rdx, %rdx
1454e94bb: 74 0f                       	je	0x1454e94cc <.text+0x54e84cc>
1454e94bd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e94c1: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e94c7: e8 04 8d b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e94cc: 4c 8b a5 c8 00 00 00        	movq	0xc8(%rbp), %r12
1454e94d3: 48 85 ff                    	testq	%rdi, %rdi
1454e94d6: 0f 84 f2 04 00 00           	je	0x1454e99ce <.text+0x54e89ce>
1454e94dc: 4c 3b a5 b8 00 00 00        	cmpq	0xb8(%rbp), %r12
1454e94e3: 48 89 df                    	movq	%rbx, %rdi
1454e94e6: 0f 85 84 fe ff ff           	jne	0x1454e9370 <.text+0x54e8370>
1454e94ec: c6 85 26 01 00 00 01        	movb	$0x1, 0x126(%rbp)
1454e94f3: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e94fa: e8 f1 e9 26 00              	callq	0x145757ef0 <.text+0x5756ef0>
1454e94ff: 90                          	nop
1454e9500: e9 6b fe ff ff              	jmp	0x1454e9370 <.text+0x54e8370>
1454e9505: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454e950c: 48 85 d2                    	testq	%rdx, %rdx
1454e950f: 74 16                       	je	0x1454e9527 <.text+0x54e8527>
1454e9511: 48 8b 8d e8 00 00 00        	movq	0xe8(%rbp), %rcx
1454e9518: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e951c: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e9522: e8 a9 8c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454e9527: 31 c0                       	xorl	%eax, %eax
1454e9529: e9 5a 20 00 00              	jmp	0x1454eb588 <.text+0x54ea588>
1454e952e: 4d 89 f0                    	movq	%r14, %r8
1454e9531: 49 83 e0 fc                 	andq	$-0x4, %r8
1454e9535: 4d 8d 4b 38                 	leaq	0x38(%r11), %r9
1454e9539: 31 d2                       	xorl	%edx, %edx
1454e953b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1454e9540: 4d 8b 51 d0                 	movq	-0x30(%r9), %r10
1454e9544: 4d 89 14 d3                 	movq	%r10, (%r11,%rdx,8)
1454e9548: 4d 8b 51 e0                 	movq	-0x20(%r9), %r10
1454e954c: 4d 89 54 d3 08              	movq	%r10, 0x8(%r11,%rdx,8)
1454e9551: 4d 8b 51 f0                 	movq	-0x10(%r9), %r10
1454e9555: 4d 89 54 d3 10              	movq	%r10, 0x10(%r11,%rdx,8)
1454e955a: 4d 8b 11                    	movq	(%r9), %r10
1454e955d: 4d 89 54 d3 18              	movq	%r10, 0x18(%r11,%rdx,8)
1454e9562: 48 83 c2 04                 	addq	$0x4, %rdx
1454e9566: 49 83 c1 40                 	addq	$0x40, %r9
1454e956a: 49 39 d0                    	cmpq	%rdx, %r8
1454e956d: 75 d1                       	jne	0x1454e9540 <.text+0x54e8540>
1454e956f: 48 85 c9                    	testq	%rcx, %rcx
1454e9572: 74 2d                       	je	0x1454e95a1 <.text+0x54e85a1>
1454e9574: 4d 8d 04 d3                 	leaq	(%r11,%rdx,8), %r8
1454e9578: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454e957c: 4c 01 da                    	addq	%r11, %rdx
1454e957f: 48 83 c2 08                 	addq	$0x8, %rdx
1454e9583: c1 e1 03                    	shll	$0x3, %ecx
1454e9586: 45 31 c9                    	xorl	%r9d, %r9d
1454e9589: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454e9590: 4e 8b 14 4a                 	movq	(%rdx,%r9,2), %r10
1454e9594: 4f 89 14 08                 	movq	%r10, (%r8,%r9)
1454e9598: 49 83 c1 08                 	addq	$0x8, %r9
1454e959c: 4c 39 c9                    	cmpq	%r9, %rcx
1454e959f: 75 ef                       	jne	0x1454e9590 <.text+0x54e8590>
1454e95a1: 48 01 c0                    	addq	%rax, %rax
1454e95a4: 4b 8d 0c f3                 	leaq	(%r11,%r14,8), %rcx
1454e95a8: 48 8d 97 c0 04 00 00        	leaq	0x4c0(%rdi), %rdx
1454e95af: 4c 89 9d e0 00 00 00        	movq	%r11, 0xe0(%rbp)
1454e95b6: 4c 89 9d e8 00 00 00        	movq	%r11, 0xe8(%rbp)
1454e95bd: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454e95c4: 48 89 8d f8 00 00 00        	movq	%rcx, 0xf8(%rbp)
1454e95cb: 48 89 95 00 01 00 00        	movq	%rdx, 0x100(%rbp)
1454e95d2: 48 89 b5 08 01 00 00        	movq	%rsi, 0x108(%rbp)
1454e95d9: 48 8d 45 18                 	leaq	0x18(%rbp), %rax
1454e95dd: 48 89 85 10 01 00 00        	movq	%rax, 0x110(%rbp)
1454e95e4: 48 8d 4d 50                 	leaq	0x50(%rbp), %rcx
1454e95e8: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e95ef: e8 1c 3e 04 00              	callq	0x14552d410 <.text+0x552c410>
1454e95f4: 4c 8b 7d 60                 	movq	0x60(%rbp), %r15
1454e95f8: 4d 85 ff                    	testq	%r15, %r15
1454e95fb: 74 3b                       	je	0x1454e9638 <.text+0x54e8638>
1454e95fd: 48 8b 45 58                 	movq	0x58(%rbp), %rax
1454e9601: 48 89 85 18 01 00 00        	movq	%rax, 0x118(%rbp)
1454e9608: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454e960f: 49 83 ff 01                 	cmpq	$0x1, %r15
1454e9613: 0f 85 5d 22 00 00           	jne	0x1454eb876 <.text+0x54ea876>
1454e9619: 48 8b 5d 50                 	movq	0x50(%rbp), %rbx
1454e961d: 44 89 f8                    	movl	%r15d, %eax
1454e9620: 83 e0 03                    	andl	$0x3, %eax
1454e9623: 49 83 ff 04                 	cmpq	$0x4, %r15
1454e9627: 4c 8b 55 78                 	movq	0x78(%rbp), %r10
1454e962b: 73 25                       	jae	0x1454e9652 <.text+0x54e8652>
1454e962d: 31 c9                       	xorl	%ecx, %ecx
1454e962f: 4c 8b 9d 18 01 00 00        	movq	0x118(%rbp), %r11
1454e9636: eb 6c                       	jmp	0x1454e96a4 <.text+0x54e86a4>
1454e9638: 48 8b 55 50                 	movq	0x50(%rbp), %rdx
1454e963c: 48 85 d2                    	testq	%rdx, %rdx
1454e963f: 0f 84 e2 fe ff ff           	je	0x1454e9527 <.text+0x54e8527>
1454e9645: 48 8b 4d 58                 	movq	0x58(%rbp), %rcx
1454e9649: 48 c1 e2 04                 	shlq	$0x4, %rdx
1454e964d: e9 ca fe ff ff              	jmp	0x1454e951c <.text+0x54e851c>
1454e9652: 48 ba fc ff ff ff ff ff ff 07       	movabsq	$0x7fffffffffffffc, %rdx # imm = 0x7FFFFFFFFFFFFFC
1454e965c: 4c 21 fa                    	andq	%r15, %rdx
1454e965f: 4c 8b 9d 18 01 00 00        	movq	0x118(%rbp), %r11
1454e9666: 4d 8d 43 38                 	leaq	0x38(%r11), %r8
1454e966a: 31 c9                       	xorl	%ecx, %ecx
1454e966c: 0f 1f 40 00                 	nopl	(%rax)
1454e9670: 4d 8b 48 d0                 	movq	-0x30(%r8), %r9
1454e9674: 4d 89 0c cb                 	movq	%r9, (%r11,%rcx,8)
1454e9678: 4d 8b 48 e0                 	movq	-0x20(%r8), %r9
1454e967c: 4d 89 4c cb 08              	movq	%r9, 0x8(%r11,%rcx,8)
1454e9681: 4d 8b 48 f0                 	movq	-0x10(%r8), %r9
1454e9685: 4d 89 4c cb 10              	movq	%r9, 0x10(%r11,%rcx,8)
1454e968a: 4d 8b 08                    	movq	(%r8), %r9
1454e968d: 4d 89 4c cb 18              	movq	%r9, 0x18(%r11,%rcx,8)
1454e9692: 48 83 c1 04                 	addq	$0x4, %rcx
1454e9696: 49 83 c0 40                 	addq	$0x40, %r8
1454e969a: 48 39 ca                    	cmpq	%rcx, %rdx
1454e969d: 75 d1                       	jne	0x1454e9670 <.text+0x54e8670>
1454e969f: 48 85 c0                    	testq	%rax, %rax
1454e96a2: 74 2d                       	je	0x1454e96d1 <.text+0x54e86d1>
1454e96a4: 49 8d 14 cb                 	leaq	(%r11,%rcx,8), %rdx
1454e96a8: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454e96ac: 4c 01 d9                    	addq	%r11, %rcx
1454e96af: 48 83 c1 08                 	addq	$0x8, %rcx
1454e96b3: c1 e0 03                    	shll	$0x3, %eax
1454e96b6: 45 31 c0                    	xorl	%r8d, %r8d
1454e96b9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454e96c0: 4e 8b 0c 41                 	movq	(%rcx,%r8,2), %r9
1454e96c4: 4e 89 0c 02                 	movq	%r9, (%rdx,%r8)
1454e96c8: 49 83 c0 08                 	addq	$0x8, %r8
1454e96cc: 4c 39 c0                    	cmpq	%r8, %rax
1454e96cf: 75 ef                       	jne	0x1454e96c0 <.text+0x54e86c0>
1454e96d1: 48 89 9d 88 00 00 00        	movq	%rbx, 0x88(%rbp)
1454e96d8: 48 c1 e3 04                 	shlq	$0x4, %rbx
1454e96dc: 48 89 5d 48                 	movq	%rbx, 0x48(%rbp)
1454e96e0: 4d 39 fc                    	cmpq	%r15, %r12
1454e96e3: 4d 0f 42 fc                 	cmovbq	%r12, %r15
1454e96e7: f3 44 0f 10 66 58           	movss	0x58(%rsi), %xmm12
1454e96ed: f3 44 0f 10 1d 4a f6 40 00  	movss	0x40f64a(%rip), %xmm11  # 0x1458f8d40
1454e96f6: f3 45 0f 59 dc              	mulss	%xmm12, %xmm11
1454e96fb: f3 45 0f 59 5a 20           	mulss	0x20(%r10), %xmm11
1454e9701: f3 45 0f 10 42 48           	movss	0x48(%r10), %xmm8
1454e9707: f3 45 0f 10 4a 50           	movss	0x50(%r10), %xmm9
1454e970d: f3 45 0f 59 d8              	mulss	%xmm8, %xmm11
1454e9712: 8b 46 5c                    	movl	0x5c(%rsi), %eax
1454e9715: 83 f8 01                    	cmpl	$0x1, %eax
1454e9718: 83 d0 00                    	adcl	$0x0, %eax
1454e971b: f3 44 0f 10 2d 5c 1d 40 00  	movss	0x401d5c(%rip), %xmm13  # 0x1458eb480
1454e9724: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1454e9729: f3 41 0f 58 fd              	addss	%xmm13, %xmm7
1454e972e: 45 0f 28 f4                 	movaps	%xmm12, %xmm14
1454e9732: f3 44 0f 5e f0              	divss	%xmm0, %xmm14
1454e9737: f3 44 0f 10 3d d0 5b 46 00  	movss	0x465bd0(%rip), %xmm15  # 0x14594f310
1454e9740: 41 0f 28 ce                 	movaps	%xmm14, %xmm1
1454e9744: f3 41 0f 5f cf              	maxss	%xmm15, %xmm1
1454e9749: 41 0f 28 c3                 	movaps	%xmm11, %xmm0
1454e974d: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1454e9751: e8 c9 d6 26 00              	callq	0x145756e1f <.text+0x5755e1f>
1454e9756: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e9759: 49 c1 e7 03                 	shlq	$0x3, %r15
1454e975d: f3 41 0f 5f f5              	maxss	%xmm13, %xmm6
1454e9762: f3 45 0f 5f e7              	maxss	%xmm15, %xmm12
1454e9767: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454e976a: f3 0f 59 c6                 	mulss	%xmm6, %xmm0
1454e976e: e8 ac d6 26 00              	callq	0x145756e1f <.text+0x5755e1f>
1454e9773: f3 41 0f 59 f6              	mulss	%xmm14, %xmm6
1454e9778: f3 45 0f 5e dc              	divss	%xmm12, %xmm11
1454e977d: f3 0f 5e f0                 	divss	%xmm0, %xmm6
1454e9781: f3 45 0f 59 d3              	mulss	%xmm11, %xmm10
1454e9786: 44 0f 14 d6                 	unpcklps	%xmm6, %xmm10           # xmm10 = xmm10[0],xmm6[0],xmm10[1],xmm6[1]
1454e978a: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454e978f: 45 31 e4                    	xorl	%r12d, %r12d
1454e9792: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454e9795: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1454e9798: 41 0f 42 c4                 	cmovbl	%r12d, %eax
1454e979c: 0f 2e 05 79 1d 40 00        	ucomiss	0x401d79(%rip), %xmm0   # 0x1458eb51c
1454e97a3: 41 bd ff ff ff ff           	movl	$0xffffffff, %r13d      # imm = 0xFFFFFFFF
1454e97a9: 44 0f 46 e8                 	cmovbel	%eax, %r13d
1454e97ad: 4c 8d 76 68                 	leaq	0x68(%rsi), %r14
1454e97b1: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454e97b4: f3 49 0f 2a c5              	cvtsi2ss	%r13, %xmm0
1454e97b9: 0f 14 f8                    	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454e97bc: 41 0f 59 fa                 	mulps	%xmm10, %xmm7
1454e97c0: 48 8d 1d ad 37 4c 01        	leaq	0x14c37ad(%rip), %rbx   # 0x1469acf74
1454e97c7: f3 0f 10 35 45 1d 40 00     	movss	0x401d45(%rip), %xmm6   # 0x1458eb514
1454e97cf: 90                          	nop
1454e97d0: 48 8b 85 18 01 00 00        	movq	0x118(%rbp), %rax
1454e97d7: 4a 8b 04 20                 	movq	(%rax,%r12), %rax
1454e97db: 41 8b 0e                    	movl	(%r14), %ecx
1454e97de: ff c9                       	decl	%ecx
1454e97e0: 83 f9 09                    	cmpl	$0x9, %ecx
1454e97e3: 77 37                       	ja	0x1454e981c <.text+0x54e881c>
1454e97e5: 48 63 0c 8b                 	movslq	(%rbx,%rcx,4), %rcx
1454e97e9: 48 01 d9                    	addq	%rbx, %rcx
1454e97ec: ff e1                       	jmpq	*%rcx
1454e97ee: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e97f3: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e97f8: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454e97fd: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e9805: f3 0f 11 8d c0 00 00 00     	movss	%xmm1, 0xc0(%rbp)
1454e980d: c7 85 b8 00 00 00 01 00 00 00       	movl	$0x1, 0xb8(%rbp)
1454e9817: e9 f4 00 00 00              	jmp	0x1454e9910 <.text+0x54e8910>
1454e981c: 41 8b 4e 08                 	movl	0x8(%r14), %ecx
1454e9820: 89 8d c0 00 00 00           	movl	%ecx, 0xc0(%rbp)
1454e9826: 49 8b 0e                    	movq	(%r14), %rcx
1454e9829: 48 89 8d b8 00 00 00        	movq	%rcx, 0xb8(%rbp)
1454e9830: e9 db 00 00 00              	jmp	0x1454e9910 <.text+0x54e8910>
1454e9835: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e983a: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e983f: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e9847: c7 85 b8 00 00 00 09 00 00 00       	movl	$0x9, 0xb8(%rbp)
1454e9851: e9 ba 00 00 00              	jmp	0x1454e9910 <.text+0x54e8910>
1454e9856: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e985b: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e9860: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e9868: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454e9872: e9 99 00 00 00              	jmp	0x1454e9910 <.text+0x54e8910>
1454e9877: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e987c: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e9881: f3 0f 5d c6                 	minss	%xmm6, %xmm0
1454e9885: f3 0f 10 4e 70              	movss	0x70(%rsi), %xmm1
1454e988a: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454e988f: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e9897: f3 0f 11 8d c0 00 00 00     	movss	%xmm1, 0xc0(%rbp)
1454e989f: c7 85 b8 00 00 00 0a 00 00 00       	movl	$0xa, 0xb8(%rbp)
1454e98a9: eb 65                       	jmp	0x1454e9910 <.text+0x54e8910>
1454e98ab: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e98b0: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e98b5: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e98bd: c7 85 b8 00 00 00 03 00 00 00       	movl	$0x3, 0xb8(%rbp)
1454e98c7: eb 47                       	jmp	0x1454e9910 <.text+0x54e8910>
1454e98c9: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e98ce: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e98d3: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e98db: c7 85 b8 00 00 00 07 00 00 00       	movl	$0x7, 0xb8(%rbp)
1454e98e5: eb 29                       	jmp	0x1454e9910 <.text+0x54e8910>
1454e98e7: f3 0f 10 46 6c              	movss	0x6c(%rsi), %xmm0
1454e98ec: f3 41 0f 59 c1              	mulss	%xmm9, %xmm0
1454e98f1: f3 0f 11 85 bc 00 00 00     	movss	%xmm0, 0xbc(%rbp)
1454e98f9: c7 85 b8 00 00 00 08 00 00 00       	movl	$0x8, 0xb8(%rbp)
1454e9903: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454e9910: 0f 13 bd e4 00 00 00        	movlps	%xmm7, 0xe4(%rbp)
1454e9917: 44 89 ad ec 00 00 00        	movl	%r13d, 0xec(%rbp)
1454e991e: c7 85 e0 00 00 00 01 00 00 00       	movl	$0x1, 0xe0(%rbp)
1454e9928: 8b 56 40                    	movl	0x40(%rsi), %edx
1454e992b: 44 0f b6 46 74              	movzbl	0x74(%rsi), %r8d
1454e9930: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e9937: 48 89 4c 24 38              	movq	%rcx, 0x38(%rsp)
1454e993c: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454e9941: c7 44 24 30 00 00 00 00     	movl	$0x0, 0x30(%rsp)
1454e9949: c7 44 24 28 00 00 00 00     	movl	$0x0, 0x28(%rsp)
1454e9951: 48 89 f9                    	movq	%rdi, %rcx
1454e9954: 4c 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %r9
1454e995b: e8 50 5a 00 00              	callq	0x1454ef3b0 <.text+0x54ee3b0>
1454e9960: 90                          	nop
1454e9961: 49 83 c4 08                 	addq	$0x8, %r12
1454e9965: 4d 39 e7                    	cmpq	%r12, %r15
1454e9968: 0f 85 62 fe ff ff           	jne	0x1454e97d0 <.text+0x54e87d0>
1454e996e: 48 83 bd 88 00 00 00 00     	cmpq	$0x0, 0x88(%rbp)
1454e9976: 0f 84 0a 1c 00 00           	je	0x1454eb586 <.text+0x54ea586>
1454e997c: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e9982: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454e9989: 48 8b 55 48                 	movq	0x48(%rbp), %rdx
1454e998d: e9 ef 1b 00 00              	jmp	0x1454eb581 <.text+0x54ea581>
1454e9992: 48 83 7e 68 ff              	cmpq	$-0x1, 0x68(%rsi)
1454e9997: 0f 84 e3 03 00 00           	je	0x1454e9d80 <.text+0x54e8d80>
1454e999d: 48 8d 56 68                 	leaq	0x68(%rsi), %rdx
1454e99a1: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e99a8: 0f 28 d6                    	movaps	%xmm6, %xmm2
1454e99ab: 41 0f 28 d8                 	movaps	%xmm8, %xmm3
1454e99af: e8 3c e2 f7 ff              	callq	0x145467bf0 <.text+0x5466bf0>
1454e99b4: 83 bd e0 00 00 00 01        	cmpl	$0x1, 0xe0(%rbp)
1454e99bb: 0f 85 bf 03 00 00           	jne	0x1454e9d80 <.text+0x54e8d80>
1454e99c1: f3 0f 10 bd ec 00 00 00     	movss	0xec(%rbp), %xmm7
1454e99c9: e9 ba 03 00 00              	jmp	0x1454e9d88 <.text+0x54e8d88>
1454e99ce: 48 89 df                    	movq	%rbx, %rdi
1454e99d1: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1454e99d8: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454e99df: 44 8b 40 40                 	movl	0x40(%rax), %r8d
1454e99e3: 4c 8b 8d c0 00 00 00        	movq	0xc0(%rbp), %r9
1454e99ea: 48 8b 85 18 01 00 00        	movq	0x118(%rbp), %rax
1454e99f1: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
1454e99f5: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454e99fc: c7 85 90 00 00 00 00 00 00 00       	movl	$0x0, 0x90(%rbp)
1454e9a06: c6 85 26 01 00 00 01        	movb	$0x1, 0x126(%rbp)
1454e9a0d: 48 8d 85 90 00 00 00        	leaq	0x90(%rbp), %rax
1454e9a14: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454e9a19: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454e9a1d: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454e9a22: 4c 89 64 24 20              	movq	%r12, 0x20(%rsp)
1454e9a27: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454e9a2e: e8 6d 17 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454e9a33: 90                          	nop
1454e9a34: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454e9a3b: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454e9a42: 75 0d                       	jne	0x1454e9a51 <.text+0x54e8a51>
1454e9a44: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454e9a4b: e8 60 e6 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454e9a50: 90                          	nop
1454e9a51: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454e9a58: 48 89 f1                    	movq	%rsi, %rcx
1454e9a5b: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454e9a5f: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454e9a66: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454e9a6d: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454e9a72: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454e9a76: 48 ff c6                    	incq	%rsi
1454e9a79: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454e9a80: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454e9a87: 48 89 45 00                 	movq	%rax, (%rbp)
1454e9a8b: 48 8b 85 c0 00 00 00        	movq	0xc0(%rbp), %rax
1454e9a92: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
1454e9a96: 48 8b b5 c8 00 00 00        	movq	0xc8(%rbp), %rsi
1454e9a9d: 48 85 f6                    	testq	%rsi, %rsi
1454e9aa0: 48 8b 45 78                 	movq	0x78(%rbp), %rax
1454e9aa4: 0f 84 46 02 00 00           	je	0x1454e9cf0 <.text+0x54e8cf0>
1454e9aaa: 48 c1 e6 03                 	shlq	$0x3, %rsi
1454e9aae: f3 0f 10 40 48              	movss	0x48(%rax), %xmm0
1454e9ab3: f3 0f 11 45 38              	movss	%xmm0, 0x38(%rbp)
1454e9ab8: f3 0f 10 40 50              	movss	0x50(%rax), %xmm0
1454e9abd: f3 0f 11 45 74              	movss	%xmm0, 0x74(%rbp)
1454e9ac2: 48 8d 87 f0 04 00 00        	leaq	0x4f0(%rdi), %rax
1454e9ac9: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1454e9acd: 45 31 ff                    	xorl	%r15d, %r15d
1454e9ad0: e9 ab 00 00 00              	jmp	0x1454e9b80 <.text+0x54e8b80>
1454e9ad5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1454e9ae0: f3 45 0f c2 f8 01           	cmpltss	%xmm8, %xmm15
1454e9ae6: 45 0f 54 e7                 	andps	%xmm15, %xmm12
1454e9aea: 44 0f 55 fe                 	andnps	%xmm6, %xmm15
1454e9aee: 45 0f 56 fc                 	orps	%xmm12, %xmm15
1454e9af2: f3 41 0f 58 fb              	addss	%xmm11, %xmm7
1454e9af7: 48 8b 87 f8 04 00 00        	movq	0x4f8(%rdi), %rax
1454e9afe: 48 8d 0c b6                 	leaq	(%rsi,%rsi,4), %rcx
1454e9b02: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454e9b06: 44 0f 11 0c 08              	movups	%xmm9, (%rax,%rcx)
1454e9b0b: c7 44 08 10 00 00 00 00     	movl	$0x0, 0x10(%rax,%rcx)
1454e9b13: 48 8b 55 78                 	movq	0x78(%rbp), %rdx
1454e9b17: 48 89 54 08 20              	movq	%rdx, 0x20(%rax,%rcx)
1454e9b1c: 4c 89 74 08 28              	movq	%r14, 0x28(%rax,%rcx)
1454e9b21: 48 8b 55 48                 	movq	0x48(%rbp), %rdx
1454e9b25: 89 54 08 30                 	movl	%edx, 0x30(%rax,%rcx)
1454e9b29: f3 44 0f 11 6c 08 34        	movss	%xmm13, 0x34(%rax,%rcx)
1454e9b30: f3 44 0f 11 74 08 38        	movss	%xmm14, 0x38(%rax,%rcx)
1454e9b37: f3 0f 11 7c 08 3c           	movss	%xmm7, 0x3c(%rax,%rcx)
1454e9b3d: 44 89 6c 08 40              	movl	%r13d, 0x40(%rax,%rcx)
1454e9b42: f3 44 0f 11 7c 08 44        	movss	%xmm15, 0x44(%rax,%rcx)
1454e9b49: 0f b6 95 86 00 00 00        	movzbl	0x86(%rbp), %edx
1454e9b50: 88 54 08 48                 	movb	%dl, 0x48(%rax,%rcx)
1454e9b54: c6 44 08 49 00              	movb	$0x0, 0x49(%rax,%rcx)
1454e9b59: 88 5c 08 4a                 	movb	%bl, 0x4a(%rax,%rcx)
1454e9b5d: 44 88 64 08 4b              	movb	%r12b, 0x4b(%rax,%rcx)
1454e9b62: 48 ff c6                    	incq	%rsi
1454e9b65: 48 89 b7 00 05 00 00        	movq	%rsi, 0x500(%rdi)
1454e9b6c: 49 ff c7                    	incq	%r15
1454e9b6f: 48 8b b5 18 01 00 00        	movq	0x118(%rbp), %rsi
1454e9b76: 48 83 c6 f8                 	addq	$-0x8, %rsi
1454e9b7a: 0f 84 70 01 00 00           	je	0x1454e9cf0 <.text+0x54e8cf0>
1454e9b80: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1454e9b84: 4a 8b 1c f8                 	movq	(%rax,%r15,8), %rbx
1454e9b88: 48 8b 8f 80 08 00 00        	movq	0x880(%rdi), %rcx
1454e9b8f: 48 8b 87 98 08 00 00        	movq	0x898(%rdi), %rax
1454e9b96: 48 8d 14 08                 	leaq	(%rax,%rcx), %rdx
1454e9b9a: 48 c1 c2 17                 	rolq	$0x17, %rdx
1454e9b9e: 48 01 ca                    	addq	%rcx, %rdx
1454e9ba1: 4c 8b 87 88 08 00 00        	movq	0x888(%rdi), %r8
1454e9ba8: 4d 89 c1                    	movq	%r8, %r9
1454e9bab: 49 c1 e1 11                 	shlq	$0x11, %r9
1454e9baf: 4c 8b 97 90 08 00 00        	movq	0x890(%rdi), %r10
1454e9bb6: 49 31 ca                    	xorq	%rcx, %r10
1454e9bb9: 4c 31 c0                    	xorq	%r8, %rax
1454e9bbc: 4d 31 d0                    	xorq	%r10, %r8
1454e9bbf: 4c 89 87 88 08 00 00        	movq	%r8, 0x888(%rdi)
1454e9bc6: 48 31 c1                    	xorq	%rax, %rcx
1454e9bc9: 48 89 8f 80 08 00 00        	movq	%rcx, 0x880(%rdi)
1454e9bd0: 4d 31 ca                    	xorq	%r9, %r10
1454e9bd3: 48 c1 c0 2d                 	rolq	$0x2d, %rax
1454e9bd7: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454e9bdb: 45 0f 57 ff                 	xorps	%xmm15, %xmm15
1454e9bdf: f3 44 0f 2a fa              	cvtsi2ss	%edx, %xmm15
1454e9be4: 4c 89 97 90 08 00 00        	movq	%r10, 0x890(%rdi)
1454e9beb: 48 89 87 98 08 00 00        	movq	%rax, 0x898(%rdi)
1454e9bf2: f3 44 0f 59 3d c5 17 50 00  	mulss	0x5017c5(%rip), %xmm15  # 0x1459eb3c0
1454e9bfb: f3 44 0f 10 87 64 04 00 00  	movss	0x464(%rdi), %xmm8
1454e9c04: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454e9c07: f3 41 0f 2a cf              	cvtsi2ss	%r15d, %xmm1
1454e9c0c: f3 0f 10 45 34              	movss	0x34(%rbp), %xmm0
1454e9c11: e8 5d d2 26 00              	callq	0x145756e73 <.text+0x5755e73>
1454e9c16: 0f 28 f0                    	movaps	%xmm0, %xmm6
1454e9c19: f3 41 0f 59 f2              	mulss	%xmm10, %xmm6
1454e9c1e: 48 8b 8d 88 00 00 00        	movq	0x88(%rbp), %rcx
1454e9c25: 44 8b 41 68                 	movl	0x68(%rcx), %r8d
1454e9c29: f3 44 0f 10 69 6c           	movss	0x6c(%rcx), %xmm13
1454e9c2f: 41 8d 40 ff                 	leal	-0x1(%r8), %eax
1454e9c33: 83 f8 09                    	cmpl	$0x9, %eax
1454e9c36: 48 89 b5 18 01 00 00        	movq	%rsi, 0x118(%rbp)
1454e9c3d: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454e9c41: 4c 89 45 48                 	movq	%r8, 0x48(%rbp)
1454e9c45: 77 18                       	ja	0x1454e9c5f <.text+0x54e8c5f>
1454e9c47: 48 8d 15 76 33 4c 01        	leaq	0x14c3376(%rip), %rdx   # 0x1469acfc4
1454e9c4e: 48 63 04 82                 	movslq	(%rdx,%rax,4), %rax
1454e9c52: 48 01 d0                    	addq	%rdx, %rax
1454e9c55: ff e0                       	jmpq	*%rax
1454e9c57: f3 44 0f 59 6d 74           	mulss	0x74(%rbp), %xmm13
1454e9c5d: eb 23                       	jmp	0x1454e9c82 <.text+0x54e8c82>
1454e9c5f: f3 44 0f 10 71 70           	movss	0x70(%rcx), %xmm14
1454e9c65: eb 1b                       	jmp	0x1454e9c82 <.text+0x54e8c82>
1454e9c67: f3 44 0f 59 6d 74           	mulss	0x74(%rbp), %xmm13
1454e9c6d: f3 44 0f 5d 2d 9e 18 40 00  	minss	0x40189e(%rip), %xmm13  # 0x1458eb514
1454e9c76: f3 44 0f 10 71 70           	movss	0x70(%rcx), %xmm14
1454e9c7c: f3 44 0f 59 75 38           	mulss	0x38(%rbp), %xmm14
1454e9c82: f3 44 0f 10 a7 68 04 00 00  	movss	0x468(%rdi), %xmm12
1454e9c8b: f3 44 0f 59 e6              	mulss	%xmm6, %xmm12
1454e9c90: f3 44 0f 10 9f e4 08 00 00  	movss	0x8e4(%rdi), %xmm11
1454e9c99: 45 0f 2e c7                 	ucomiss	%xmm15, %xmm8
1454e9c9d: 0f 97 85 86 00 00 00        	seta	0x86(%rbp)
1454e9ca4: 44 8b 69 40                 	movl	0x40(%rcx), %r13d
1454e9ca8: f3 49 0f 2a ff              	cvtsi2ss	%r15, %xmm7
1454e9cad: 44 0f b6 61 74              	movzbl	0x74(%rcx), %r12d
1454e9cb2: f3 0f 59 3d 76 c9 40 00     	mulss	0x40c976(%rip), %xmm7   # 0x1458f6630
1454e9cba: 4c 8b b7 d0 03 00 00        	movq	0x3d0(%rdi), %r14
1454e9cc1: 44 0f 10 4f 40              	movups	0x40(%rdi), %xmm9
1454e9cc6: 0f b6 9f ec 07 00 00        	movzbl	0x7ec(%rdi), %ebx
1454e9ccd: 48 8b b7 00 05 00 00        	movq	0x500(%rdi), %rsi
1454e9cd4: 48 3b b7 f0 04 00 00        	cmpq	0x4f0(%rdi), %rsi
1454e9cdb: 0f 85 ff fd ff ff           	jne	0x1454e9ae0 <.text+0x54e8ae0>
1454e9ce1: 48 8b 4d e0                 	movq	-0x20(%rbp), %rcx
1454e9ce5: e8 c6 a5 27 00              	callq	0x1457642b0 <.text+0x57632b0>
1454e9cea: 90                          	nop
1454e9ceb: e9 f0 fd ff ff              	jmp	0x1454e9ae0 <.text+0x54e8ae0>
1454e9cf0: 48 8b 55 00                 	movq	(%rbp), %rdx
1454e9cf4: 48 85 d2                    	testq	%rdx, %rdx
1454e9cf7: 0f 84 89 18 00 00           	je	0x1454eb586 <.text+0x54ea586>
1454e9cfd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454e9d01: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454e9d07: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1454e9d0b: e9 71 18 00 00              	jmp	0x1454eb581 <.text+0x54ea581>
1454e9d10: f3 43 0f 10 54 08 c8        	movss	-0x38(%r8,%r9), %xmm2
1454e9d17: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454e9d1a: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
1454e9d1d: 0f 83 b5 0c 00 00           	jae	0x1454ea9d8 <.text+0x54e99d8>
1454e9d23: f3 0f 10 9f e4 08 00 00     	movss	0x8e4(%rdi), %xmm3
1454e9d2b: f3 43 0f 5c 5c 08 c4        	subss	-0x3c(%r8,%r9), %xmm3
1454e9d32: f3 0f 5e da                 	divss	%xmm2, %xmm3
1454e9d36: f3 0f 5f cb                 	maxss	%xmm3, %xmm1
1454e9d3a: f3 0f 10 1d 3e 17 40 00     	movss	0x40173e(%rip), %xmm3   # 0x1458eb480
1454e9d42: f3 0f 5d d9                 	minss	%xmm1, %xmm3
1454e9d46: f2 43 0f 10 54 08 ac        	movsd	-0x54(%r8,%r9), %xmm2
1454e9d4d: f2 43 0f 10 64 08 b8        	movsd	-0x48(%r8,%r9), %xmm4
1454e9d54: 0f 5c e2                    	subps	%xmm2, %xmm4
1454e9d57: f3 0f 12 cb                 	movsldup	%xmm3, %xmm1            # xmm1 = xmm3[0,0,2,2]
1454e9d5b: 0f 59 cc                    	mulps	%xmm4, %xmm1
1454e9d5e: 0f 58 ca                    	addps	%xmm2, %xmm1
1454e9d61: f3 43 0f 10 64 08 b4        	movss	-0x4c(%r8,%r9), %xmm4
1454e9d68: f3 43 0f 10 54 08 c0        	movss	-0x40(%r8,%r9), %xmm2
1454e9d6f: f3 0f 5c d4                 	subss	%xmm4, %xmm2
1454e9d73: f3 0f 59 d3                 	mulss	%xmm3, %xmm2
1454e9d77: f3 0f 58 d4                 	addss	%xmm4, %xmm2
1454e9d7b: e9 66 0c 00 00              	jmp	0x1454ea9e6 <.text+0x54e99e6>
1454e9d80: f3 0f 10 be 90 00 00 00     	movss	0x90(%rsi), %xmm7
1454e9d88: c7 85 18 01 00 00 eb 11 00 00       	movl	$0x11eb, 0x118(%rbp) # imm = 0x11EB
1454e9d92: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1454e9d99: 48 83 78 08 0b              	cmpq	$0xb, 0x8(%rax)
1454e9d9e: 75 33                       	jne	0x1454e9dd3 <.text+0x54e8dd3>
1454e9da0: 48 8b 00                    	movq	(%rax), %rax
1454e9da3: 48 b9 6d 61 67 6d 61 5f 74 6f       	movabsq	$0x6f745f616d67616d, %rcx # imm = 0x6F745F616D67616D
1454e9dad: 48 33 08                    	xorq	(%rax), %rcx
1454e9db0: 48 ba 6d 61 5f 74 6f 74 65 6d       	movabsq	$0x6d65746f745f616d, %rdx # imm = 0x6D65746F745F616D
1454e9dba: 48 33 50 03                 	xorq	0x3(%rax), %rdx
1454e9dbe: 31 c0                       	xorl	%eax, %eax
1454e9dc0: 48 09 ca                    	orq	%rcx, %rdx
1454e9dc3: 0f 94 c0                    	sete	%al
1454e9dc6: 8d 04 45 eb 11 00 00        	leal	0x11eb(,%rax,2), %eax
1454e9dcd: 89 85 18 01 00 00           	movl	%eax, 0x118(%rbp)
1454e9dd3: 0f 13 75 18                 	movlps	%xmm6, 0x18(%rbp)
1454e9dd7: f3 0f 11 7d 20              	movss	%xmm7, 0x20(%rbp)
1454e9ddc: 8b 87 04 09 00 00           	movl	0x904(%rdi), %eax
1454e9de2: ff c0                       	incl	%eax
1454e9de4: 89 87 04 09 00 00           	movl	%eax, 0x904(%rdi)
1454e9dea: 25 ff ff ff 00              	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454e9def: 49 bf 00 00 00 1c 25 00 30 f1       	movabsq	$-0xecfffdae4000000, %r15 # imm = 0xF13000251C000000
1454e9df9: 49 09 c7                    	orq	%rax, %r15
1454e9dfc: 48 c7 85 90 00 00 00 00 00 00 00    	movq	$0x0, 0x90(%rbp)
1454e9e07: 48 c7 85 a0 00 00 00 00 00 00 00    	movq	$0x0, 0xa0(%rbp)
1454e9e12: 4c 8d ad 90 00 00 00        	leaq	0x90(%rbp), %r13
1454e9e19: 4c 89 e9                    	movq	%r13, %rcx
1454e9e1c: 31 d2                       	xorl	%edx, %edx
1454e9e1e: 4d 89 f8                    	movq	%r15, %r8
1454e9e21: e8 ca 64 01 00              	callq	0x1455002f0 <.text+0x54ff2f0>
1454e9e26: 90                          	nop
1454e9e27: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454e9e2e: 48 85 c0                    	testq	%rax, %rax
1454e9e31: 74 63                       	je	0x1454e9e96 <.text+0x54e8e96>
1454e9e33: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454e9e3a: 66 ba 02 00                 	movw	$0x2, %dx
1454e9e3e: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454e9e43: 45 89 ca                    	movl	%r9d, %r10d
1454e9e46: 45 01 d2                    	addl	%r10d, %r10d
1454e9e49: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454e9e50: 4d 85 d2                    	testq	%r10, %r10
1454e9e53: 74 26                       	je	0x1454e9e7b <.text+0x54e8e7b>
1454e9e55: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454e9e5b: 41 0f 97 c3                 	seta	%r11b
1454e9e5f: 41 80 db 00                 	sbbb	$0x0, %r11b
1454e9e63: 49 ff c0                    	incq	%r8
1454e9e66: 49 83 c2 fe                 	addq	$-0x2, %r10
1454e9e6a: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454e9e6e: 74 e0                       	je	0x1454e9e50 <.text+0x54e8e50>
1454e9e70: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454e9e74: 45 85 c9                    	testl	%r9d, %r9d
1454e9e77: 75 05                       	jne	0x1454e9e7e <.text+0x54e8e7e>
1454e9e79: eb 10                       	jmp	0x1454e9e8b <.text+0x54e8e8b>
1454e9e7b: 4d 89 c8                    	movq	%r9, %r8
1454e9e7e: 48 83 e9 01                 	subq	$0x1, %rcx
1454e9e82: 72 14                       	jb	0x1454e9e98 <.text+0x54e8e98>
1454e9e84: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454e9e89: eb b3                       	jmp	0x1454e9e3e <.text+0x54e8e3e>
1454e9e8b: 42 c7 44 80 08 09 00 00 00  	movl	$0x9, 0x8(%rax,%r8,4)
1454e9e94: eb 47                       	jmp	0x1454e9edd <.text+0x54e8edd>
1454e9e96: 31 c0                       	xorl	%eax, %eax
1454e9e98: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454e9e9f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454e9ea6: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454e9eb1: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454e9eb8: 48 c7 85 00 01 00 00 02 00 00 00    	movq	$0x2, 0x100(%rbp)
1454e9ec3: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e9eca: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e9ed1: 41 b8 09 00 00 00           	movl	$0x9, %r8d
1454e9ed7: e8 74 db f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454e9edc: 90                          	nop
1454e9edd: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454e9ee4: 48 85 c0                    	testq	%rax, %rax
1454e9ee7: 74 6d                       	je	0x1454e9f56 <.text+0x54e8f56>
1454e9ee9: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454e9ef0: 66 ba 03 00                 	movw	$0x3, %dx
1454e9ef4: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454e9ef9: 45 89 ca                    	movl	%r9d, %r10d
1454e9efc: 45 01 d2                    	addl	%r10d, %r10d
1454e9eff: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454e9f06: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454e9f10: 4d 85 d2                    	testq	%r10, %r10
1454e9f13: 74 26                       	je	0x1454e9f3b <.text+0x54e8f3b>
1454e9f15: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454e9f1b: 41 0f 97 c3                 	seta	%r11b
1454e9f1f: 41 80 db 00                 	sbbb	$0x0, %r11b
1454e9f23: 49 ff c0                    	incq	%r8
1454e9f26: 49 83 c2 fe                 	addq	$-0x2, %r10
1454e9f2a: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454e9f2e: 74 e0                       	je	0x1454e9f10 <.text+0x54e8f10>
1454e9f30: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454e9f34: 45 85 c9                    	testl	%r9d, %r9d
1454e9f37: 75 05                       	jne	0x1454e9f3e <.text+0x54e8f3e>
1454e9f39: eb 10                       	jmp	0x1454e9f4b <.text+0x54e8f4b>
1454e9f3b: 4d 89 c8                    	movq	%r9, %r8
1454e9f3e: 48 83 e9 01                 	subq	$0x1, %rcx
1454e9f42: 72 14                       	jb	0x1454e9f58 <.text+0x54e8f58>
1454e9f44: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454e9f49: eb a9                       	jmp	0x1454e9ef4 <.text+0x54e8ef4>
1454e9f4b: 42 c7 44 80 08 1c 25 00 00  	movl	$0x251c, 0x8(%rax,%r8,4) # imm = 0x251C
1454e9f54: eb 47                       	jmp	0x1454e9f9d <.text+0x54e8f9d>
1454e9f56: 31 c0                       	xorl	%eax, %eax
1454e9f58: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454e9f5f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454e9f66: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454e9f71: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454e9f78: 48 c7 85 00 01 00 00 03 00 00 00    	movq	$0x3, 0x100(%rbp)
1454e9f83: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454e9f8a: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454e9f91: 41 b8 1c 25 00 00           	movl	$0x251c, %r8d           # imm = 0x251C
1454e9f97: e8 b4 da f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454e9f9c: 90                          	nop
1454e9f9d: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454e9fa4: 48 85 c0                    	testq	%rax, %rax
1454e9fa7: 74 6d                       	je	0x1454ea016 <.text+0x54e9016>
1454e9fa9: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454e9fb0: 66 ba 04 00                 	movw	$0x4, %dx
1454e9fb4: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454e9fb9: 45 89 ca                    	movl	%r9d, %r10d
1454e9fbc: 45 01 d2                    	addl	%r10d, %r10d
1454e9fbf: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454e9fc6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454e9fd0: 4d 85 d2                    	testq	%r10, %r10
1454e9fd3: 74 26                       	je	0x1454e9ffb <.text+0x54e8ffb>
1454e9fd5: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454e9fdb: 41 0f 97 c3                 	seta	%r11b
1454e9fdf: 41 80 db 00                 	sbbb	$0x0, %r11b
1454e9fe3: 49 ff c0                    	incq	%r8
1454e9fe6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454e9fea: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454e9fee: 74 e0                       	je	0x1454e9fd0 <.text+0x54e8fd0>
1454e9ff0: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454e9ff4: 45 85 c9                    	testl	%r9d, %r9d
1454e9ff7: 75 05                       	jne	0x1454e9ffe <.text+0x54e8ffe>
1454e9ff9: eb 10                       	jmp	0x1454ea00b <.text+0x54e900b>
1454e9ffb: 4d 89 c8                    	movq	%r9, %r8
1454e9ffe: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea002: 72 14                       	jb	0x1454ea018 <.text+0x54e9018>
1454ea004: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea009: eb a9                       	jmp	0x1454e9fb4 <.text+0x54e8fb4>
1454ea00b: 42 c7 44 80 08 00 00 80 3f  	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454ea014: eb 47                       	jmp	0x1454ea05d <.text+0x54e905d>
1454ea016: 31 c0                       	xorl	%eax, %eax
1454ea018: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea01f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea026: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea031: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea038: 48 c7 85 00 01 00 00 04 00 00 00    	movq	$0x4, 0x100(%rbp)
1454ea043: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea04a: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea051: 41 b8 00 00 80 3f           	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454ea057: e8 f4 d9 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea05c: 90                          	nop
1454ea05d: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea064: 48 85 c0                    	testq	%rax, %rax
1454ea067: 74 6d                       	je	0x1454ea0d6 <.text+0x54e90d6>
1454ea069: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea070: 66 ba 16 00                 	movw	$0x16, %dx
1454ea074: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea079: 45 89 ca                    	movl	%r9d, %r10d
1454ea07c: 45 01 d2                    	addl	%r10d, %r10d
1454ea07f: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea086: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454ea090: 4d 85 d2                    	testq	%r10, %r10
1454ea093: 74 26                       	je	0x1454ea0bb <.text+0x54e90bb>
1454ea095: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454ea09b: 41 0f 97 c3                 	seta	%r11b
1454ea09f: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea0a3: 49 ff c0                    	incq	%r8
1454ea0a6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea0aa: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea0ae: 74 e0                       	je	0x1454ea090 <.text+0x54e9090>
1454ea0b0: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea0b4: 45 85 c9                    	testl	%r9d, %r9d
1454ea0b7: 75 05                       	jne	0x1454ea0be <.text+0x54e90be>
1454ea0b9: eb 10                       	jmp	0x1454ea0cb <.text+0x54e90cb>
1454ea0bb: 4d 89 c8                    	movq	%r9, %r8
1454ea0be: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea0c2: 72 14                       	jb	0x1454ea0d8 <.text+0x54e90d8>
1454ea0c4: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea0c9: eb a9                       	jmp	0x1454ea074 <.text+0x54e9074>
1454ea0cb: 42 c7 44 80 08 05 00 00 00  	movl	$0x5, 0x8(%rax,%r8,4)
1454ea0d4: eb 47                       	jmp	0x1454ea11d <.text+0x54e911d>
1454ea0d6: 31 c0                       	xorl	%eax, %eax
1454ea0d8: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea0df: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea0e6: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea0f1: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea0f8: 48 c7 85 00 01 00 00 16 00 00 00    	movq	$0x16, 0x100(%rbp)
1454ea103: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea10a: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea111: 41 b8 05 00 00 00           	movl	$0x5, %r8d
1454ea117: e8 34 d9 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea11c: 90                          	nop
1454ea11d: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea124: 48 85 c0                    	testq	%rax, %rax
1454ea127: 74 6d                       	je	0x1454ea196 <.text+0x54e9196>
1454ea129: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea130: 66 ba 1c 00                 	movw	$0x1c, %dx
1454ea134: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea139: 45 89 ca                    	movl	%r9d, %r10d
1454ea13c: 45 01 d2                    	addl	%r10d, %r10d
1454ea13f: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea146: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454ea150: 4d 85 d2                    	testq	%r10, %r10
1454ea153: 74 26                       	je	0x1454ea17b <.text+0x54e917b>
1454ea155: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454ea15b: 41 0f 97 c3                 	seta	%r11b
1454ea15f: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea163: 49 ff c0                    	incq	%r8
1454ea166: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea16a: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea16e: 74 e0                       	je	0x1454ea150 <.text+0x54e9150>
1454ea170: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea174: 45 85 c9                    	testl	%r9d, %r9d
1454ea177: 75 05                       	jne	0x1454ea17e <.text+0x54e917e>
1454ea179: eb 10                       	jmp	0x1454ea18b <.text+0x54e918b>
1454ea17b: 4d 89 c8                    	movq	%r9, %r8
1454ea17e: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea182: 72 14                       	jb	0x1454ea198 <.text+0x54e9198>
1454ea184: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea189: eb a9                       	jmp	0x1454ea134 <.text+0x54e9134>
1454ea18b: 42 c7 44 80 08 05 00 00 00  	movl	$0x5, 0x8(%rax,%r8,4)
1454ea194: eb 47                       	jmp	0x1454ea1dd <.text+0x54e91dd>
1454ea196: 31 c0                       	xorl	%eax, %eax
1454ea198: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea19f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea1a6: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea1b1: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea1b8: 48 c7 85 00 01 00 00 1c 00 00 00    	movq	$0x1c, 0x100(%rbp)
1454ea1c3: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea1ca: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea1d1: 41 b8 05 00 00 00           	movl	$0x5, %r8d
1454ea1d7: e8 74 d8 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea1dc: 90                          	nop
1454ea1dd: 44 8b 87 f8 03 00 00        	movl	0x3f8(%rdi), %r8d
1454ea1e4: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea1eb: 48 85 c0                    	testq	%rax, %rax
1454ea1ee: 74 62                       	je	0x1454ea252 <.text+0x54e9252>
1454ea1f0: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea1f7: 66 ba 22 00                 	movw	$0x22, %dx
1454ea1fb: 44 0f b7 50 36              	movzwl	0x36(%rax), %r10d
1454ea200: 45 89 d3                    	movl	%r10d, %r11d
1454ea203: 45 01 db                    	addl	%r11d, %r11d
1454ea206: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
1454ea20d: 0f 1f 00                    	nopl	(%rax)
1454ea210: 4d 85 db                    	testq	%r11, %r11
1454ea213: 74 26                       	je	0x1454ea23b <.text+0x54e923b>
1454ea215: 66 42 3b 54 48 3a           	cmpw	0x3a(%rax,%r9,2), %dx
1454ea21b: 40 0f 97 c6                 	seta	%sil
1454ea21f: 40 80 de 00                 	sbbb	$0x0, %sil
1454ea223: 49 ff c1                    	incq	%r9
1454ea226: 49 83 c3 fe                 	addq	$-0x2, %r11
1454ea22a: 40 80 fe 01                 	cmpb	$0x1, %sil
1454ea22e: 74 e0                       	je	0x1454ea210 <.text+0x54e9210>
1454ea230: 44 0f b6 d6                 	movzbl	%sil, %r10d
1454ea234: 45 85 d2                    	testl	%r10d, %r10d
1454ea237: 75 05                       	jne	0x1454ea23e <.text+0x54e923e>
1454ea239: eb 10                       	jmp	0x1454ea24b <.text+0x54e924b>
1454ea23b: 4d 89 d1                    	movq	%r10, %r9
1454ea23e: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea242: 72 10                       	jb	0x1454ea254 <.text+0x54e9254>
1454ea244: 4a 8b 44 c8 50              	movq	0x50(%rax,%r9,8), %rax
1454ea249: eb b0                       	jmp	0x1454ea1fb <.text+0x54e91fb>
1454ea24b: 46 89 44 88 08              	movl	%r8d, 0x8(%rax,%r9,4)
1454ea250: eb 41                       	jmp	0x1454ea293 <.text+0x54e9293>
1454ea252: 31 c0                       	xorl	%eax, %eax
1454ea254: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea25b: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea262: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea26d: 4c 89 8d f8 00 00 00        	movq	%r9, 0xf8(%rbp)
1454ea274: 48 c7 85 00 01 00 00 22 00 00 00    	movq	$0x22, 0x100(%rbp)
1454ea27f: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea286: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea28d: e8 be d7 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea292: 90                          	nop
1454ea293: 0f b6 87 85 02 00 00        	movzbl	0x285(%rdi), %eax
1454ea29a: 04 fe                       	addb	$-0x2, %al
1454ea29c: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ea2a2: 3c 06                       	cmpb	$0x6, %al
1454ea2a4: 77 0e                       	ja	0x1454ea2b4 <.text+0x54e92b4>
1454ea2a6: 0f b6 c0                    	movzbl	%al, %eax
1454ea2a9: 48 8d 0d 08 28 4c 01        	leaq	0x14c2808(%rip), %rcx   # 0x1469acab8
1454ea2b0: 44 8b 04 81                 	movl	(%rcx,%rax,4), %r8d
1454ea2b4: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea2bb: 48 85 c0                    	testq	%rax, %rax
1454ea2be: 74 62                       	je	0x1454ea322 <.text+0x54e9322>
1454ea2c0: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea2c7: 66 ba 23 00                 	movw	$0x23, %dx
1454ea2cb: 44 0f b7 50 36              	movzwl	0x36(%rax), %r10d
1454ea2d0: 45 89 d3                    	movl	%r10d, %r11d
1454ea2d3: 45 01 db                    	addl	%r11d, %r11d
1454ea2d6: 49 c7 c1 ff ff ff ff        	movq	$-0x1, %r9
1454ea2dd: 0f 1f 00                    	nopl	(%rax)
1454ea2e0: 4d 85 db                    	testq	%r11, %r11
1454ea2e3: 74 26                       	je	0x1454ea30b <.text+0x54e930b>
1454ea2e5: 66 42 3b 54 48 3a           	cmpw	0x3a(%rax,%r9,2), %dx
1454ea2eb: 40 0f 97 c6                 	seta	%sil
1454ea2ef: 40 80 de 00                 	sbbb	$0x0, %sil
1454ea2f3: 49 ff c1                    	incq	%r9
1454ea2f6: 49 83 c3 fe                 	addq	$-0x2, %r11
1454ea2fa: 40 80 fe 01                 	cmpb	$0x1, %sil
1454ea2fe: 74 e0                       	je	0x1454ea2e0 <.text+0x54e92e0>
1454ea300: 44 0f b6 d6                 	movzbl	%sil, %r10d
1454ea304: 45 85 d2                    	testl	%r10d, %r10d
1454ea307: 75 05                       	jne	0x1454ea30e <.text+0x54e930e>
1454ea309: eb 10                       	jmp	0x1454ea31b <.text+0x54e931b>
1454ea30b: 4d 89 d1                    	movq	%r10, %r9
1454ea30e: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea312: 72 10                       	jb	0x1454ea324 <.text+0x54e9324>
1454ea314: 4a 8b 44 c8 50              	movq	0x50(%rax,%r9,8), %rax
1454ea319: eb b0                       	jmp	0x1454ea2cb <.text+0x54e92cb>
1454ea31b: 46 89 44 88 08              	movl	%r8d, 0x8(%rax,%r9,4)
1454ea320: eb 41                       	jmp	0x1454ea363 <.text+0x54e9363>
1454ea322: 31 c0                       	xorl	%eax, %eax
1454ea324: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea32b: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea332: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea33d: 4c 89 8d f8 00 00 00        	movq	%r9, 0xf8(%rbp)
1454ea344: 48 c7 85 00 01 00 00 23 00 00 00    	movq	$0x23, 0x100(%rbp)
1454ea34f: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea356: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea35d: e8 ee d6 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea362: 90                          	nop
1454ea363: 4c 8b b7 d0 03 00 00        	movq	0x3d0(%rdi), %r14
1454ea36a: 48 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %rcx
1454ea371: 66 ba 0c 00                 	movw	$0xc, %dx
1454ea375: 4d 89 f0                    	movq	%r14, %r8
1454ea378: e8 73 5f 01 00              	callq	0x1455002f0 <.text+0x54ff2f0>
1454ea37d: 90                          	nop
1454ea37e: 4c 8d ad 90 00 00 00        	leaq	0x90(%rbp), %r13
1454ea385: 4c 89 e9                    	movq	%r13, %rcx
1454ea388: 66 ba 0e 00                 	movw	$0xe, %dx
1454ea38c: 4d 89 f0                    	movq	%r14, %r8
1454ea38f: e8 5c 5f 01 00              	callq	0x1455002f0 <.text+0x54ff2f0>
1454ea394: 90                          	nop
1454ea395: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea39c: 48 85 c0                    	testq	%rax, %rax
1454ea39f: 74 65                       	je	0x1454ea406 <.text+0x54e9406>
1454ea3a1: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea3a8: 66 ba 2e 00                 	movw	$0x2e, %dx
1454ea3ac: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea3b1: 45 89 ca                    	movl	%r9d, %r10d
1454ea3b4: 45 01 d2                    	addl	%r10d, %r10d
1454ea3b7: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea3be: 66 90                       	nop
1454ea3c0: 4d 85 d2                    	testq	%r10, %r10
1454ea3c3: 74 26                       	je	0x1454ea3eb <.text+0x54e93eb>
1454ea3c5: 66 42 3b 54 40 3a           	cmpw	0x3a(%rax,%r8,2), %dx
1454ea3cb: 41 0f 97 c3                 	seta	%r11b
1454ea3cf: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea3d3: 49 ff c0                    	incq	%r8
1454ea3d6: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea3da: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea3de: 74 e0                       	je	0x1454ea3c0 <.text+0x54e93c0>
1454ea3e0: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea3e4: 45 85 c9                    	testl	%r9d, %r9d
1454ea3e7: 75 05                       	jne	0x1454ea3ee <.text+0x54e93ee>
1454ea3e9: eb 10                       	jmp	0x1454ea3fb <.text+0x54e93fb>
1454ea3eb: 4d 89 c8                    	movq	%r9, %r8
1454ea3ee: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea3f2: 72 14                       	jb	0x1454ea408 <.text+0x54e9408>
1454ea3f4: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea3f9: eb b1                       	jmp	0x1454ea3ac <.text+0x54e93ac>
1454ea3fb: 42 c7 44 80 08 02 00 00 00  	movl	$0x2, 0x8(%rax,%r8,4)
1454ea404: eb 47                       	jmp	0x1454ea44d <.text+0x54e944d>
1454ea406: 31 c0                       	xorl	%eax, %eax
1454ea408: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea40f: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea416: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea421: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea428: 48 c7 85 00 01 00 00 2e 00 00 00    	movq	$0x2e, 0x100(%rbp)
1454ea433: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea43a: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea441: 41 b8 02 00 00 00           	movl	$0x2, %r8d
1454ea447: e8 04 d6 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea44c: 90                          	nop
1454ea44d: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea454: 48 85 c0                    	testq	%rax, %rax
1454ea457: 74 70                       	je	0x1454ea4c9 <.text+0x54e94c9>
1454ea459: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea460: ba 81 00 00 00              	movl	$0x81, %edx
1454ea465: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea46a: 45 89 ca                    	movl	%r9d, %r10d
1454ea46d: 45 01 d2                    	addl	%r10d, %r10d
1454ea470: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea477: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454ea480: 4d 85 d2                    	testq	%r10, %r10
1454ea483: 74 29                       	je	0x1454ea4ae <.text+0x54e94ae>
1454ea485: 46 0f b7 5c 40 3a           	movzwl	0x3a(%rax,%r8,2), %r11d
1454ea48b: 44 39 da                    	cmpl	%r11d, %edx
1454ea48e: 41 0f 97 c3                 	seta	%r11b
1454ea492: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea496: 49 ff c0                    	incq	%r8
1454ea499: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea49d: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea4a1: 74 dd                       	je	0x1454ea480 <.text+0x54e9480>
1454ea4a3: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea4a7: 45 85 c9                    	testl	%r9d, %r9d
1454ea4aa: 75 05                       	jne	0x1454ea4b1 <.text+0x54e94b1>
1454ea4ac: eb 10                       	jmp	0x1454ea4be <.text+0x54e94be>
1454ea4ae: 4d 89 c8                    	movq	%r9, %r8
1454ea4b1: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea4b5: 72 14                       	jb	0x1454ea4cb <.text+0x54e94cb>
1454ea4b7: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea4bc: eb a7                       	jmp	0x1454ea465 <.text+0x54e9465>
1454ea4be: 42 c7 44 80 08 cd cc cc 3e  	movl	$0x3ecccccd, 0x8(%rax,%r8,4) # imm = 0x3ECCCCCD
1454ea4c7: eb 47                       	jmp	0x1454ea510 <.text+0x54e9510>
1454ea4c9: 31 c0                       	xorl	%eax, %eax
1454ea4cb: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea4d2: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea4d9: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea4e4: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea4eb: 48 c7 85 00 01 00 00 81 00 00 00    	movq	$0x81, 0x100(%rbp)
1454ea4f6: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea4fd: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea504: 41 b8 cd cc cc 3e           	movl	$0x3ecccccd, %r8d       # imm = 0x3ECCCCCD
1454ea50a: e8 41 d5 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea50f: 90                          	nop
1454ea510: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea517: 48 85 c0                    	testq	%rax, %rax
1454ea51a: 74 6d                       	je	0x1454ea589 <.text+0x54e9589>
1454ea51c: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea523: ba 82 00 00 00              	movl	$0x82, %edx
1454ea528: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea52d: 45 89 ca                    	movl	%r9d, %r10d
1454ea530: 45 01 d2                    	addl	%r10d, %r10d
1454ea533: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea53a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454ea540: 4d 85 d2                    	testq	%r10, %r10
1454ea543: 74 29                       	je	0x1454ea56e <.text+0x54e956e>
1454ea545: 46 0f b7 5c 40 3a           	movzwl	0x3a(%rax,%r8,2), %r11d
1454ea54b: 44 39 da                    	cmpl	%r11d, %edx
1454ea54e: 41 0f 97 c3                 	seta	%r11b
1454ea552: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea556: 49 ff c0                    	incq	%r8
1454ea559: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea55d: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea561: 74 dd                       	je	0x1454ea540 <.text+0x54e9540>
1454ea563: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea567: 45 85 c9                    	testl	%r9d, %r9d
1454ea56a: 75 05                       	jne	0x1454ea571 <.text+0x54e9571>
1454ea56c: eb 10                       	jmp	0x1454ea57e <.text+0x54e957e>
1454ea56e: 4d 89 c8                    	movq	%r9, %r8
1454ea571: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea575: 72 14                       	jb	0x1454ea58b <.text+0x54e958b>
1454ea577: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea57c: eb aa                       	jmp	0x1454ea528 <.text+0x54e9528>
1454ea57e: 42 c7 44 80 08 00 00 80 3f  	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454ea587: eb 47                       	jmp	0x1454ea5d0 <.text+0x54e95d0>
1454ea589: 31 c0                       	xorl	%eax, %eax
1454ea58b: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea592: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea599: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea5a4: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea5ab: 48 c7 85 00 01 00 00 82 00 00 00    	movq	$0x82, 0x100(%rbp)
1454ea5b6: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea5bd: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea5c4: 41 b8 00 00 80 3f           	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454ea5ca: e8 81 d4 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea5cf: 90                          	nop
1454ea5d0: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea5d7: 48 85 c0                    	testq	%rax, %rax
1454ea5da: 74 6f                       	je	0x1454ea64b <.text+0x54e964b>
1454ea5dc: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea5e3: ba 83 00 00 00              	movl	$0x83, %edx
1454ea5e8: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea5ed: 45 89 ca                    	movl	%r9d, %r10d
1454ea5f0: 45 01 d2                    	addl	%r10d, %r10d
1454ea5f3: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea5fa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454ea600: 4d 85 d2                    	testq	%r10, %r10
1454ea603: 74 29                       	je	0x1454ea62e <.text+0x54e962e>
1454ea605: 46 0f b7 5c 40 3a           	movzwl	0x3a(%rax,%r8,2), %r11d
1454ea60b: 44 39 da                    	cmpl	%r11d, %edx
1454ea60e: 41 0f 97 c3                 	seta	%r11b
1454ea612: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea616: 49 ff c0                    	incq	%r8
1454ea619: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea61d: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea621: 74 dd                       	je	0x1454ea600 <.text+0x54e9600>
1454ea623: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea627: 45 85 c9                    	testl	%r9d, %r9d
1454ea62a: 75 05                       	jne	0x1454ea631 <.text+0x54e9631>
1454ea62c: eb 10                       	jmp	0x1454ea63e <.text+0x54e963e>
1454ea62e: 4d 89 c8                    	movq	%r9, %r8
1454ea631: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea635: 72 16                       	jb	0x1454ea64d <.text+0x54e964d>
1454ea637: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea63c: eb aa                       	jmp	0x1454ea5e8 <.text+0x54e95e8>
1454ea63e: 8b 8d 18 01 00 00           	movl	0x118(%rbp), %ecx
1454ea644: 42 89 4c 80 08              	movl	%ecx, 0x8(%rax,%r8,4)
1454ea649: eb 48                       	jmp	0x1454ea693 <.text+0x54e9693>
1454ea64b: 31 c0                       	xorl	%eax, %eax
1454ea64d: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea654: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea65b: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea666: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea66d: 48 c7 85 00 01 00 00 83 00 00 00    	movq	$0x83, 0x100(%rbp)
1454ea678: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea67f: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea686: 44 8b 85 18 01 00 00        	movl	0x118(%rbp), %r8d
1454ea68d: e8 be d3 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea692: 90                          	nop
1454ea693: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454ea69a: 48 85 c0                    	testq	%rax, %rax
1454ea69d: 74 6c                       	je	0x1454ea70b <.text+0x54e970b>
1454ea69f: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454ea6a6: ba 84 00 00 00              	movl	$0x84, %edx
1454ea6ab: 44 0f b7 48 36              	movzwl	0x36(%rax), %r9d
1454ea6b0: 45 89 ca                    	movl	%r9d, %r10d
1454ea6b3: 45 01 d2                    	addl	%r10d, %r10d
1454ea6b6: 49 c7 c0 ff ff ff ff        	movq	$-0x1, %r8
1454ea6bd: 0f 1f 00                    	nopl	(%rax)
1454ea6c0: 4d 85 d2                    	testq	%r10, %r10
1454ea6c3: 74 29                       	je	0x1454ea6ee <.text+0x54e96ee>
1454ea6c5: 46 0f b7 5c 40 3a           	movzwl	0x3a(%rax,%r8,2), %r11d
1454ea6cb: 44 39 da                    	cmpl	%r11d, %edx
1454ea6ce: 41 0f 97 c3                 	seta	%r11b
1454ea6d2: 41 80 db 00                 	sbbb	$0x0, %r11b
1454ea6d6: 49 ff c0                    	incq	%r8
1454ea6d9: 49 83 c2 fe                 	addq	$-0x2, %r10
1454ea6dd: 41 80 fb 01                 	cmpb	$0x1, %r11b
1454ea6e1: 74 dd                       	je	0x1454ea6c0 <.text+0x54e96c0>
1454ea6e3: 45 0f b6 cb                 	movzbl	%r11b, %r9d
1454ea6e7: 45 85 c9                    	testl	%r9d, %r9d
1454ea6ea: 75 05                       	jne	0x1454ea6f1 <.text+0x54e96f1>
1454ea6ec: eb 10                       	jmp	0x1454ea6fe <.text+0x54e96fe>
1454ea6ee: 4d 89 c8                    	movq	%r9, %r8
1454ea6f1: 48 83 e9 01                 	subq	$0x1, %rcx
1454ea6f5: 72 16                       	jb	0x1454ea70d <.text+0x54e970d>
1454ea6f7: 4a 8b 44 c0 50              	movq	0x50(%rax,%r8,8), %rax
1454ea6fc: eb ad                       	jmp	0x1454ea6ab <.text+0x54e96ab>
1454ea6fe: 8b 8d 18 01 00 00           	movl	0x118(%rbp), %ecx
1454ea704: 42 89 4c 80 08              	movl	%ecx, 0x8(%rax,%r8,4)
1454ea709: eb 48                       	jmp	0x1454ea753 <.text+0x54e9753>
1454ea70b: 31 c0                       	xorl	%eax, %eax
1454ea70d: 4c 89 ad e0 00 00 00        	movq	%r13, 0xe0(%rbp)
1454ea714: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454ea71b: 48 c7 85 f0 00 00 00 00 00 00 00    	movq	$0x0, 0xf0(%rbp)
1454ea726: 4c 89 85 f8 00 00 00        	movq	%r8, 0xf8(%rbp)
1454ea72d: 48 c7 85 00 01 00 00 84 00 00 00    	movq	$0x84, 0x100(%rbp)
1454ea738: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea73f: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea746: 44 8b 85 18 01 00 00        	movl	0x118(%rbp), %r8d
1454ea74d: e8 fe d2 f3 ff              	callq	0x145427a50 <.text+0x5426a50>
1454ea752: 90                          	nop
1454ea753: c7 45 68 00 00 00 00        	movl	$0x0, 0x68(%rbp)
1454ea75a: 48 c7 45 50 00 00 00 00     	movq	$0x0, 0x50(%rbp)
1454ea762: 48 c7 45 58 01 00 00 00     	movq	$0x1, 0x58(%rbp)
1454ea76a: 48 c7 45 60 00 00 00 00     	movq	$0x0, 0x60(%rbp)
1454ea772: c6 85 b6 00 00 00 01        	movb	$0x1, 0xb6(%rbp)
1454ea779: 4c 89 6c 24 38              	movq	%r13, 0x38(%rsp)
1454ea77e: 48 8d 05 fb 07 4c 01        	leaq	0x14c07fb(%rip), %rax   # 0x1469aaf80
1454ea785: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454ea78a: 48 8d 45 18                 	leaq	0x18(%rbp), %rax
1454ea78e: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454ea793: c7 44 24 28 00 00 00 00     	movl	$0x0, 0x28(%rsp)
1454ea79b: 48 8d 4d 50                 	leaq	0x50(%rbp), %rcx
1454ea79f: 4c 89 fa                    	movq	%r15, %rdx
1454ea7a2: 41 b0 03                    	movb	$0x3, %r8b
1454ea7a5: 45 31 c9                    	xorl	%r9d, %r9d
1454ea7a8: e8 53 4b 01 00              	callq	0x1454ff300 <.text+0x54fe300>
1454ea7ad: 90                          	nop
1454ea7ae: 0f 10 45 50                 	movups	0x50(%rbp), %xmm0
1454ea7b2: 0f 10 4d 60                 	movups	0x60(%rbp), %xmm1
1454ea7b6: 0f 29 8d f0 00 00 00        	movaps	%xmm1, 0xf0(%rbp)
1454ea7bd: 0f 29 85 e0 00 00 00        	movaps	%xmm0, 0xe0(%rbp)
1454ea7c4: c6 85 b6 00 00 00 00        	movb	$0x0, 0xb6(%rbp)
1454ea7cb: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454ea7d2: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454ea7d9: e8 f2 52 01 00              	callq	0x1454ffad0 <.text+0x54fead0>
1454ea7de: 90                          	nop
1454ea7df: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454ea7e6: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454ea7ed: 75 0d                       	jne	0x1454ea7fc <.text+0x54e97fc>
1454ea7ef: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454ea7f6: e8 b5 d8 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454ea7fb: 90                          	nop
1454ea7fc: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454ea7ff: f3 49 0f 2a c4              	cvtsi2ss	%r12, %xmm0
1454ea804: 4c 8d 73 38                 	leaq	0x38(%rbx), %r14
1454ea808: f3 44 0f 5e d0              	divss	%xmm0, %xmm10
1454ea80d: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454ea814: 48 89 f1                    	movq	%rsi, %rcx
1454ea817: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ea81b: 0f 10 85 b8 00 00 00        	movups	0xb8(%rbp), %xmm0
1454ea822: 0f 10 8d c8 00 00 00        	movups	0xc8(%rbp), %xmm1
1454ea829: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454ea82e: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454ea832: 48 ff c6                    	incq	%rsi
1454ea835: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454ea83c: 48 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %rcx
1454ea843: e8 88 7f 02 00              	callq	0x1455127d0 <.text+0x55117d0>
1454ea848: 0f 10 87 e4 08 00 00        	movups	0x8e4(%rdi), %xmm0
1454ea84f: 0f 28 0d 8a 6e 52 00        	movaps	0x526e8a(%rip), %xmm1   # 0x145a116e0
1454ea856: f3 41 0f 10 cc              	movss	%xmm12, %xmm1           # xmm1 = xmm12[0],xmm1[1,2,3]
1454ea85b: f3 44 0f 12 c0              	movsldup	%xmm0, %xmm8            # xmm8 = xmm0[0,0,2,2]
1454ea860: 44 0f 58 c1                 	addps	%xmm1, %xmm8
1454ea864: 44 8b 63 08                 	movl	0x8(%rbx), %r12d
1454ea868: f3 44 0f 10 73 0c           	movss	0xc(%rbx), %xmm14
1454ea86e: f3 44 0f 10 63 14           	movss	0x14(%rbx), %xmm12
1454ea874: 49 89 fd                    	movq	%rdi, %r13
1454ea877: 8b 7b 18                    	movl	0x18(%rbx), %edi
1454ea87a: f3 44 0f 10 6b 1c           	movss	0x1c(%rbx), %xmm13
1454ea880: 48 83 c3 24                 	addq	$0x24, %rbx
1454ea884: 49 8b b5 18 05 00 00        	movq	0x518(%r13), %rsi
1454ea88b: 49 3b b5 08 05 00 00        	cmpq	0x508(%r13), %rsi
1454ea892: 75 0c                       	jne	0x1454ea8a0 <.text+0x54e98a0>
1454ea894: 49 8d 8d 08 05 00 00        	leaq	0x508(%r13), %rcx
1454ea89b: e8 90 96 27 00              	callq	0x145763f30 <.text+0x5762f30>
1454ea8a0: 49 8b 85 10 05 00 00        	movq	0x510(%r13), %rax
1454ea8a7: 48 6b ce 78                 	imulq	$0x78, %rsi, %rcx
1454ea8ab: 48 8b 95 88 00 00 00        	movq	0x88(%rbp), %rdx
1454ea8b2: 48 89 14 08                 	movq	%rdx, (%rax,%rcx)
1454ea8b6: 44 89 64 08 08              	movl	%r12d, 0x8(%rax,%rcx)
1454ea8bb: f3 44 0f 11 74 08 0c        	movss	%xmm14, 0xc(%rax,%rcx)
1454ea8c2: f3 44 0f 11 4c 08 10        	movss	%xmm9, 0x10(%rax,%rcx)
1454ea8c9: f3 44 0f 11 64 08 14        	movss	%xmm12, 0x14(%rax,%rcx)
1454ea8d0: 89 7c 08 18                 	movl	%edi, 0x18(%rax,%rcx)
1454ea8d4: f3 44 0f 11 6c 08 1c        	movss	%xmm13, 0x1c(%rax,%rcx)
1454ea8db: f3 44 0f 11 5c 08 20        	movss	%xmm11, 0x20(%rax,%rcx)
1454ea8e2: 0f 10 03                    	movups	(%rbx), %xmm0
1454ea8e5: 0f 11 44 08 24              	movups	%xmm0, 0x24(%rax,%rcx)
1454ea8ea: 8b 53 10                    	movl	0x10(%rbx), %edx
1454ea8ed: 89 54 08 34                 	movl	%edx, 0x34(%rax,%rcx)
1454ea8f1: 41 0f 10 06                 	movups	(%r14), %xmm0
1454ea8f5: 41 0f 10 4e 0c              	movups	0xc(%r14), %xmm1
1454ea8fa: 0f 11 44 08 38              	movups	%xmm0, 0x38(%rax,%rcx)
1454ea8ff: 0f 11 4c 08 44              	movups	%xmm1, 0x44(%rax,%rcx)
1454ea904: 4c 89 7c 08 58              	movq	%r15, 0x58(%rax,%rcx)
1454ea909: 0f 13 74 08 60              	movlps	%xmm6, 0x60(%rax,%rcx)
1454ea90e: f3 0f 11 7c 08 68           	movss	%xmm7, 0x68(%rax,%rcx)
1454ea914: 44 0f 13 44 08 6c           	movlps	%xmm8, 0x6c(%rax,%rcx)
1454ea91a: f3 44 0f 11 54 08 74        	movss	%xmm10, 0x74(%rax,%rcx)
1454ea921: 48 ff c6                    	incq	%rsi
1454ea924: 49 89 b5 18 05 00 00        	movq	%rsi, 0x518(%r13)
1454ea92b: e9 56 0c 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454ea930: 83 f8 07                    	cmpl	$0x7, %eax
1454ea933: 0f 85 d9 00 00 00           	jne	0x1454eaa12 <.text+0x54e9a12>
1454ea939: f3 0f 10 4b 50              	movss	0x50(%rbx), %xmm1
1454ea93e: f3 0f 59 4e 6c              	mulss	0x6c(%rsi), %xmm1
1454ea943: 48 8b 97 f8 02 00 00        	movq	0x2f8(%rdi), %rdx
1454ea94a: 48 8b 87 00 03 00 00        	movq	0x300(%rdi), %rax
1454ea951: 8b 4e 40                    	movl	0x40(%rsi), %ecx
1454ea954: 48 c1 e0 03                 	shlq	$0x3, %rax
1454ea958: 4c 8d 04 40                 	leaq	(%rax,%rax,2), %r8
1454ea95c: 4d 85 c0                    	testq	%r8, %r8
1454ea95f: 0f 84 e5 06 00 00           	je	0x1454eb04a <.text+0x54ea04a>
1454ea965: 49 83 c0 e8                 	addq	$-0x18, %r8
1454ea969: 31 c0                       	xorl	%eax, %eax
1454ea96b: 39 4a 0c                    	cmpl	%ecx, 0xc(%rdx)
1454ea96e: 48 8d 52 18                 	leaq	0x18(%rdx), %rdx
1454ea972: 75 e8                       	jne	0x1454ea95c <.text+0x54e995c>
1454ea974: e9 0f 0c 00 00              	jmp	0x1454eb588 <.text+0x54ea588>
1454ea979: 31 db                       	xorl	%ebx, %ebx
1454ea97b: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
1454ea980: 48 3b 19                    	cmpq	(%rcx), %rbx
1454ea983: 75 05                       	jne	0x1454ea98a <.text+0x54e998a>
1454ea985: e8 96 92 27 00              	callq	0x145763c20 <.text+0x5762c20>
1454ea98a: 48 8b 87 f8 02 00 00        	movq	0x2f8(%rdi), %rax
1454ea991: 48 8d 0c 5b                 	leaq	(%rbx,%rbx,2), %rcx
1454ea995: 44 89 34 c8                 	movl	%r14d, (%rax,%rcx,8)
1454ea999: f3 44 0f 11 54 c8 04        	movss	%xmm10, 0x4(%rax,%rcx,8)
1454ea9a0: f3 0f 11 74 c8 08           	movss	%xmm6, 0x8(%rax,%rcx,8)
1454ea9a6: 44 89 7c c8 0c              	movl	%r15d, 0xc(%rax,%rcx,8)
1454ea9ab: f3 0f 11 7c c8 10           	movss	%xmm7, 0x10(%rax,%rcx,8)
1454ea9b1: c7 44 c8 14 00 00 00 00     	movl	$0x0, 0x14(%rax,%rcx,8)
1454ea9b9: 48 ff c3                    	incq	%rbx
1454ea9bc: 48 89 9f 00 03 00 00        	movq	%rbx, 0x300(%rdi)
1454ea9c3: 48 89 f9                    	movq	%rdi, %rcx
1454ea9c6: e8 05 a7 fa ff              	callq	0x1454950d0 <.text+0x54940d0>
1454ea9cb: 48 89 f9                    	movq	%rdi, %rcx
1454ea9ce: e8 dd 28 fa ff              	callq	0x14548d2b0 <.text+0x548c2b0>
1454ea9d3: e9 ae 0b 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454ea9d8: f2 43 0f 10 4c 08 b8        	movsd	-0x48(%r8,%r9), %xmm1
1454ea9df: f3 43 0f 10 54 08 c0        	movss	-0x40(%r8,%r9), %xmm2
1454ea9e6: 4c 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %r8
1454ea9ed: 4d 85 c0                    	testq	%r8, %r8
1454ea9f0: 0f 84 2f 01 00 00           	je	0x1454eab25 <.text+0x54e9b25>
1454ea9f6: 4c 8b 8d 98 00 00 00        	movq	0x98(%rbp), %r9
1454ea9fd: 49 83 f8 05                 	cmpq	$0x5, %r8
1454eaa01: 0f 83 26 01 00 00           	jae	0x1454eab2d <.text+0x54e9b2d>
1454eaa07: 45 31 d2                    	xorl	%r10d, %r10d
1454eaa0a: 45 31 db                    	xorl	%r11d, %r11d
1454eaa0d: e9 0a 02 00 00              	jmp	0x1454eac1c <.text+0x54e9c1c>
1454eaa12: 83 f8 06                    	cmpl	$0x6, %eax
1454eaa15: 0f 84 cf 0b 00 00           	je	0x1454eb5ea <.text+0x54ea5ea>
1454eaa1b: 83 f8 0b                    	cmpl	$0xb, %eax
1454eaa1e: 0f 85 a6 de ff ff           	jne	0x1454e88ca <.text+0x54e78ca>
1454eaa24: f3 0f 10 8f 00 04 00 00     	movss	0x400(%rdi), %xmm1
1454eaa2c: f3 0f 59 05 d4 0a 40 00     	mulss	0x400ad4(%rip), %xmm0   # 0x1458eb508
1454eaa34: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454eaa37: 0f 87 ea ea ff ff           	ja	0x1454e9527 <.text+0x54e8527>
1454eaa3d: 4c 8d b7 38 05 00 00        	leaq	0x538(%rdi), %r14
1454eaa44: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454eaa4b: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454eaa4f: 48 89 95 90 00 00 00        	movq	%rdx, 0x90(%rbp)
1454eaa56: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454eaa60: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454eaa67: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454eaa6b: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454eaa70: 48 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %rax
1454eaa77: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454eaa7c: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454eaa85: 4c 8d bd e0 00 00 00        	leaq	0xe0(%rbp), %r15
1454eaa8c: 4c 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %r9
1454eaa93: 4c 89 f9                    	movq	%r15, %rcx
1454eaa96: e8 05 07 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454eaa9b: 4c 89 f1                    	movq	%r14, %rcx
1454eaa9e: 4c 89 fa                    	movq	%r15, %rdx
1454eaaa1: e8 4a 8f 6e fb              	callq	0x140bd39f0 <.text+0xbd29f0>
1454eaaa6: 8b 76 40                    	movl	0x40(%rsi), %esi
1454eaaa9: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454eaab0: 48 89 da                    	movq	%rbx, %rdx
1454eaab3: e8 58 19 fa ff              	callq	0x14548c410 <.text+0x548b410>
1454eaab8: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
1454eaabd: 48 89 fb                    	movq	%rdi, %rbx
1454eaac0: 48 8b bf 00 03 00 00        	movq	0x300(%rdi), %rdi
1454eaac7: 48 3b bb f0 02 00 00        	cmpq	0x2f0(%rbx), %rdi
1454eaace: 75 0c                       	jne	0x1454eaadc <.text+0x54e9adc>
1454eaad0: 48 8d 8b f0 02 00 00        	leaq	0x2f0(%rbx), %rcx
1454eaad7: e8 44 91 27 00              	callq	0x145763c20 <.text+0x5762c20>
1454eaadc: 48 8b 83 f8 02 00 00        	movq	0x2f8(%rbx), %rax
1454eaae3: 48 8d 0c 7f                 	leaq	(%rdi,%rdi,2), %rcx
1454eaae7: 8b 95 e8 00 00 00           	movl	0xe8(%rbp), %edx
1454eaaed: 89 54 c8 08                 	movl	%edx, 0x8(%rax,%rcx,8)
1454eaaf1: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454eaaf8: 48 89 14 c8                 	movq	%rdx, (%rax,%rcx,8)
1454eaafc: 89 74 c8 0c                 	movl	%esi, 0xc(%rax,%rcx,8)
1454eab00: f3 0f 11 7c c8 10           	movss	%xmm7, 0x10(%rax,%rcx,8)
1454eab06: c7 44 c8 14 00 00 00 00     	movl	$0x0, 0x14(%rax,%rcx,8)
1454eab0e: 48 ff c7                    	incq	%rdi
1454eab11: 48 89 bb 00 03 00 00        	movq	%rdi, 0x300(%rbx)
1454eab18: 48 89 d9                    	movq	%rbx, %rcx
1454eab1b: e8 90 27 fa ff              	callq	0x14548d2b0 <.text+0x548c2b0>
1454eab20: e9 61 0a 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454eab25: 45 31 db                    	xorl	%r11d, %r11d
1454eab28: e9 26 01 00 00              	jmp	0x1454eac53 <.text+0x54e9c53>
1454eab2d: 45 89 c2                    	movl	%r8d, %r10d
1454eab30: 41 83 e2 03                 	andl	$0x3, %r10d
1454eab34: 41 bb 04 00 00 00           	movl	$0x4, %r11d
1454eab3a: 4d 0f 45 da                 	cmovneq	%r10, %r11
1454eab3e: 4d 89 c2                    	movq	%r8, %r10
1454eab41: 4d 29 da                    	subq	%r11, %r10
1454eab44: f3 0f 12 e1                 	movsldup	%xmm1, %xmm4            # xmm4 = xmm1[0,0,2,2]
1454eab48: f3 0f 16 e9                 	movshdup	%xmm1, %xmm5            # xmm5 = xmm1[1,1,3,3]
1454eab4c: f3 0f 12 f8                 	movsldup	%xmm0, %xmm7            # xmm7 = xmm0[0,0,2,2]
1454eab50: 4d 8d 59 28                 	leaq	0x28(%r9), %r11
1454eab54: 0f 57 db                    	xorps	%xmm3, %xmm3
1454eab57: 44 0f 28 05 81 1f 41 00     	movaps	0x411f81(%rip), %xmm8   # 0x1458fcae0
1454eab5f: 4d 89 d4                    	movq	%r10, %r12
1454eab62: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1454eab66: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454eab70: f3 45 0f 10 6b d8           	movss	-0x28(%r11), %xmm13
1454eab76: f3 45 0f 10 5b dc           	movss	-0x24(%r11), %xmm11
1454eab7c: f3 45 0f 10 63 e4           	movss	-0x1c(%r11), %xmm12
1454eab82: 45 0f 14 ec                 	unpcklps	%xmm12, %xmm13          # xmm13 = xmm13[0],xmm12[0],xmm13[1],xmm12[1]
1454eab86: f3 45 0f 10 63 e8           	movss	-0x18(%r11), %xmm12
1454eab8c: 45 0f 14 dc                 	unpcklps	%xmm12, %xmm11          # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
1454eab90: f3 45 0f 10 63 fc           	movss	-0x4(%r11), %xmm12
1454eab96: f3 45 0f 10 73 f0           	movss	-0x10(%r11), %xmm14
1454eab9c: 45 0f 14 f4                 	unpcklps	%xmm12, %xmm14          # xmm14 = xmm14[0],xmm12[0],xmm14[1],xmm12[1]
1454eaba0: f3 45 0f 10 3b              	movss	(%r11), %xmm15
1454eaba5: f3 45 0f 10 63 f4           	movss	-0xc(%r11), %xmm12
1454eabab: 45 0f 14 e7                 	unpcklps	%xmm15, %xmm12          # xmm12 = xmm12[0],xmm15[0],xmm12[1],xmm15[1]
1454eabaf: 44 0f 5c ec                 	subps	%xmm4, %xmm13
1454eabb3: 44 0f 5c f4                 	subps	%xmm4, %xmm14
1454eabb7: 44 0f 5c dd                 	subps	%xmm5, %xmm11
1454eabbb: 44 0f 5c e5                 	subps	%xmm5, %xmm12
1454eabbf: 45 0f 59 ed                 	mulps	%xmm13, %xmm13
1454eabc3: 45 0f 59 f6                 	mulps	%xmm14, %xmm14
1454eabc7: 45 0f 59 db                 	mulps	%xmm11, %xmm11
1454eabcb: 45 0f 58 dd                 	addps	%xmm13, %xmm11
1454eabcf: 45 0f 59 e4                 	mulps	%xmm12, %xmm12
1454eabd3: 45 0f 58 e6                 	addps	%xmm14, %xmm12
1454eabd7: 44 0f c2 df 02              	cmpleps	%xmm7, %xmm11
1454eabdc: 44 0f 14 d8                 	unpcklps	%xmm0, %xmm11           # xmm11 = xmm11[0],xmm0[0],xmm11[1],xmm0[1]
1454eabe0: 45 0f 54 d8                 	andps	%xmm8, %xmm11
1454eabe4: 66 45 0f d4 cb              	paddq	%xmm11, %xmm9
1454eabe9: 44 0f c2 e7 02              	cmpleps	%xmm7, %xmm12
1454eabee: 44 0f 14 e0                 	unpcklps	%xmm0, %xmm12           # xmm12 = xmm12[0],xmm0[0],xmm12[1],xmm0[1]
1454eabf2: 45 0f 54 e0                 	andps	%xmm8, %xmm12
1454eabf6: 66 41 0f d4 dc              	paddq	%xmm12, %xmm3
1454eabfb: 49 83 c3 30                 	addq	$0x30, %r11
1454eabff: 49 83 c4 fc                 	addq	$-0x4, %r12
1454eac03: 0f 85 67 ff ff ff           	jne	0x1454eab70 <.text+0x54e9b70>
1454eac09: 66 41 0f d4 d9              	paddq	%xmm9, %xmm3
1454eac0e: 66 0f 70 e3 ee              	pshufd	$0xee, %xmm3, %xmm4     # xmm4 = xmm3[2,3,2,3]
1454eac13: 66 0f d4 e3                 	paddq	%xmm3, %xmm4
1454eac17: 66 49 0f 7e e3              	movq	%xmm4, %r11
1454eac1c: 4d 29 d0                    	subq	%r10, %r8
1454eac1f: 4f 8d 14 52                 	leaq	(%r10,%r10,2), %r10
1454eac23: 4f 8d 0c 91                 	leaq	(%r9,%r10,4), %r9
1454eac27: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454eac30: f2 41 0f 10 19              	movsd	(%r9), %xmm3
1454eac35: 0f 5c d9                    	subps	%xmm1, %xmm3
1454eac38: 0f 59 db                    	mulps	%xmm3, %xmm3
1454eac3b: f3 0f 16 e3                 	movshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
1454eac3f: f3 0f 58 e3                 	addss	%xmm3, %xmm4
1454eac43: 0f 2e c4                    	ucomiss	%xmm4, %xmm0
1454eac46: 49 83 db ff                 	sbbq	$-0x1, %r11
1454eac4a: 49 83 c1 0c                 	addq	$0xc, %r9
1454eac4e: 49 ff c8                    	decq	%r8
1454eac51: 75 dd                       	jne	0x1454eac30 <.text+0x54e9c30>
1454eac53: 4c 89 5d 50                 	movq	%r11, 0x50(%rbp)
1454eac57: 0f 13 4d 58                 	movlps	%xmm1, 0x58(%rbp)
1454eac5b: f3 0f 11 55 60              	movss	%xmm2, 0x60(%rbp)
1454eac60: 48 89 95 e0 00 00 00        	movq	%rdx, 0xe0(%rbp)
1454eac67: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
1454eac6e: 48 89 8d f0 00 00 00        	movq	%rcx, 0xf0(%rbp)
1454eac75: 48 89 bd f8 00 00 00        	movq	%rdi, 0xf8(%rbp)
1454eac7c: 4c 89 bd 00 01 00 00        	movq	%r15, 0x100(%rbp)
1454eac83: 48 8d 45 40                 	leaq	0x40(%rbp), %rax
1454eac87: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
1454eac8e: 48 8d 8d c0 00 00 00        	leaq	0xc0(%rbp), %rcx
1454eac95: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454eac9c: 4c 8d 45 50                 	leaq	0x50(%rbp), %r8
1454eaca0: e8 5b 81 02 00              	callq	0x145512e00 <.text+0x5511e00>
1454eaca5: 90                          	nop
1454eaca6: f2 0f 10 bd c8 00 00 00     	movsd	0xc8(%rbp), %xmm7
1454eacae: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454eacb5: 48 85 c0                    	testq	%rax, %rax
1454eacb8: 74 1a                       	je	0x1454eacd4 <.text+0x54e9cd4>
1454eacba: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454eacc1: 48 c1 e0 02                 	shlq	$0x2, %rax
1454eacc5: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1454eacc9: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1454eaccf: e8 fc 74 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eacd4: 48 8b 55 18                 	movq	0x18(%rbp), %rdx
1454eacd8: 48 85 d2                    	testq	%rdx, %rdx
1454eacdb: 74 12                       	je	0x1454eacef <.text+0x54e9cef>
1454eacdd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454eace1: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454eace7: 4c 89 f1                    	movq	%r14, %rcx
1454eacea: e8 e1 74 b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eacef: 48 8b b7 78 08 00 00        	movq	0x878(%rdi), %rsi
1454eacf6: 48 8d 4e 10                 	leaq	0x10(%rsi), %rcx
1454eacfa: f3 44 0f 16 cf              	movshdup	%xmm7, %xmm9            # xmm9 = xmm7[1,1,3,3]
1454eacff: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454ead02: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1454ead06: e8 e5 7a f7 ff              	callq	0x1454627f0 <.text+0x54617f0>
1454ead0b: a8 01                       	testb	$0x1, %al
1454ead0d: 74 06                       	je	0x1454ead15 <.text+0x54e9d15>
1454ead0f: 44 0f 28 c0                 	movaps	%xmm0, %xmm8
1454ead13: eb 3b                       	jmp	0x1454ead50 <.text+0x54e9d50>
1454ead15: 48 83 7e 68 ff              	cmpq	$-0x1, 0x68(%rsi)
1454ead1a: 74 2b                       	je	0x1454ead47 <.text+0x54e9d47>
1454ead1c: 48 8d 56 68                 	leaq	0x68(%rsi), %rdx
1454ead20: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454ead27: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454ead2a: 41 0f 28 d9                 	movaps	%xmm9, %xmm3
1454ead2e: e8 bd ce f7 ff              	callq	0x145467bf0 <.text+0x5466bf0>
1454ead33: 83 bd e0 00 00 00 01        	cmpl	$0x1, 0xe0(%rbp)
1454ead3a: 75 0b                       	jne	0x1454ead47 <.text+0x54e9d47>
1454ead3c: f3 44 0f 10 85 ec 00 00 00  	movss	0xec(%rbp), %xmm8
1454ead45: eb 09                       	jmp	0x1454ead50 <.text+0x54e9d50>
1454ead47: f3 44 0f 10 86 90 00 00 00  	movss	0x90(%rsi), %xmm8
1454ead50: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454ead57: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
1454ead5e: 44 8b 40 40                 	movl	0x40(%rax), %r8d
1454ead62: 0f 13 bd bc 00 00 00        	movlps	%xmm7, 0xbc(%rbp)
1454ead69: f3 44 0f 11 85 c4 00 00 00  	movss	%xmm8, 0xc4(%rbp)
1454ead72: c7 85 b8 00 00 00 01 00 00 00       	movl	$0x1, 0xb8(%rbp)
1454ead7c: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454ead83: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454ead87: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454ead8c: 48 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %rax
1454ead93: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454ead98: 48 c7 44 24 20 00 00 00 00  	movq	$0x0, 0x20(%rsp)
1454eada1: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454eada8: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454eadae: e8 ed 03 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454eadb3: 48 8b b7 48 05 00 00        	movq	0x548(%rdi), %rsi
1454eadba: 48 3b b7 38 05 00 00        	cmpq	0x538(%rdi), %rsi
1454eadc1: 75 0d                       	jne	0x1454eadd0 <.text+0x54e9dd0>
1454eadc3: 48 8d 8f 38 05 00 00        	leaq	0x538(%rdi), %rcx
1454eadca: e8 e1 d2 26 00              	callq	0x1457580b0 <.text+0x57570b0>
1454eadcf: 90                          	nop
1454eadd0: 48 8b 87 40 05 00 00        	movq	0x540(%rdi), %rax
1454eadd7: 48 89 f1                    	movq	%rsi, %rcx
1454eadda: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454eadde: 0f 10 85 e0 00 00 00        	movups	0xe0(%rbp), %xmm0
1454eade5: 0f 10 8d f0 00 00 00        	movups	0xf0(%rbp), %xmm1
1454eadec: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454eadf1: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454eadf5: 48 ff c6                    	incq	%rsi
1454eadf8: 48 89 b7 48 05 00 00        	movq	%rsi, 0x548(%rdi)
1454eadff: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454eae06: f3 0f 10 4e 58              	movss	0x58(%rsi), %xmm1
1454eae0b: f3 44 0f 10 0d 2c df 40 00  	movss	0x40df2c(%rip), %xmm9   # 0x1458f8d40
1454eae14: f3 44 0f 59 c9              	mulss	%xmm1, %xmm9
1454eae19: f3 44 0f 59 4b 20           	mulss	0x20(%rbx), %xmm9
1454eae1f: 8b 46 5c                    	movl	0x5c(%rsi), %eax
1454eae22: 83 f8 01                    	cmpl	$0x1, %eax
1454eae25: 83 d0 00                    	adcl	$0x0, %eax
1454eae28: f3 4c 0f 2a e0              	cvtsi2ss	%rax, %xmm12
1454eae2d: f3 44 0f 10 5b 48           	movss	0x48(%rbx), %xmm11
1454eae33: f3 0f 5f 0d d5 44 46 00     	maxss	0x4644d5(%rip), %xmm1   # 0x14594f310
1454eae3b: f3 45 0f 59 cb              	mulss	%xmm11, %xmm9
1454eae40: 41 0f 28 c1                 	movaps	%xmm9, %xmm0
1454eae44: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1454eae48: f3 41 0f 59 c4              	mulss	%xmm12, %xmm0
1454eae4d: e8 cd bf 26 00              	callq	0x145756e1f <.text+0x5755e1f>
1454eae52: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1454eae57: 31 c9                       	xorl	%ecx, %ecx
1454eae59: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454eae5c: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1454eae5f: 0f 43 c8                    	cmovael	%eax, %ecx
1454eae62: 0f 2e 05 b3 06 40 00        	ucomiss	0x4006b3(%rip), %xmm0   # 0x1458eb51c
1454eae69: 41 bf ff ff ff ff           	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454eae6f: 44 0f 46 f9                 	cmovbel	%ecx, %r15d
1454eae73: 41 83 ff 01                 	cmpl	$0x1, %r15d
1454eae77: 41 83 d7 00                 	adcl	$0x0, %r15d
1454eae7b: 8b 56 40                    	movl	0x40(%rsi), %edx
1454eae7e: 0f 13 bd e0 00 00 00        	movlps	%xmm7, 0xe0(%rbp)
1454eae85: f3 44 0f 11 85 e8 00 00 00  	movss	%xmm8, 0xe8(%rbp)
1454eae8e: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454eae95: 48 89 f9                    	movq	%rdi, %rcx
1454eae98: 0f 28 de                    	movaps	%xmm6, %xmm3
1454eae9b: e8 00 3c 00 00              	callq	0x1454eeaa0 <.text+0x54edaa0>
1454eaea0: 49 89 c6                    	movq	%rax, %r14
1454eaea3: 44 8b 66 68                 	movl	0x68(%rsi), %r12d
1454eaea7: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454eaeaa: f3 49 0f 2a cf              	cvtsi2ss	%r15, %xmm1
1454eaeaf: f3 0f 10 87 e4 08 00 00     	movss	0x8e4(%rdi), %xmm0
1454eaeb7: f3 44 0f 10 6e 6c           	movss	0x6c(%rsi), %xmm13
1454eaebd: 41 8d 44 24 ff              	leal	-0x1(%r12), %eax
1454eaec2: 83 f8 09                    	cmpl	$0x9, %eax
1454eaec5: 0f 87 4d 01 00 00           	ja	0x1454eb018 <.text+0x54ea018>
1454eaecb: f3 0f 10 53 50              	movss	0x50(%rbx), %xmm2
1454eaed0: 48 8d 0d 15 21 4c 01        	leaq	0x14c2115(%rip), %rcx   # 0x1469acfec
1454eaed7: 48 63 04 81                 	movslq	(%rcx,%rax,4), %rax
1454eaedb: 48 01 c8                    	addq	%rcx, %rax
1454eaede: ff e0                       	jmpq	*%rax
1454eaee0: f3 44 0f 59 ea              	mulss	%xmm2, %xmm13
1454eaee5: f3 45 0f 5e d4              	divss	%xmm12, %xmm10
1454eaeea: 48 89 f0                    	movq	%rsi, %rax
1454eaeed: 8b 76 40                    	movl	0x40(%rsi), %esi
1454eaef0: f3 44 0f 10 25 17 21 40 00  	movss	0x402117(%rip), %xmm12  # 0x1458ed010
1454eaef9: f3 44 0f 58 e0              	addss	%xmm0, %xmm12
1454eaefe: 45 0f 28 f1                 	movaps	%xmm9, %xmm14
1454eaf02: f3 44 0f 5e f1              	divss	%xmm1, %xmm14
1454eaf07: f3 44 0f 58 c8              	addss	%xmm0, %xmm9
1454eaf0c: f3 44 0f 58 0d 2f ff 41 00  	addss	0x41ff2f(%rip), %xmm9   # 0x14590ae44
1454eaf15: 0f b6 58 74                 	movzbl	0x74(%rax), %ebx
1454eaf19: 49 89 fd                    	movq	%rdi, %r13
1454eaf1c: 48 8b bf e8 04 00 00        	movq	0x4e8(%rdi), %rdi
1454eaf23: 49 3b bd d8 04 00 00        	cmpq	0x4d8(%r13), %rdi
1454eaf2a: 75 0c                       	jne	0x1454eaf38 <.text+0x54e9f38>
1454eaf2c: 49 8d 8d d8 04 00 00        	leaq	0x4d8(%r13), %rcx
1454eaf33: e8 d8 05 27 00              	callq	0x14575b510 <.text+0x575a510>
1454eaf38: 49 8b 85 e0 04 00 00        	movq	0x4e0(%r13), %rax
1454eaf3f: 48 6b cf 58                 	imulq	$0x58, %rdi, %rcx
1454eaf43: 48 c7 04 08 00 00 00 00     	movq	$0x0, (%rax,%rcx)
1454eaf4b: 4c 89 74 08 18              	movq	%r14, 0x18(%rax,%rcx)
1454eaf50: 44 89 64 08 20              	movl	%r12d, 0x20(%rax,%rcx)
1454eaf55: f3 44 0f 11 6c 08 24        	movss	%xmm13, 0x24(%rax,%rcx)
1454eaf5c: f3 44 0f 11 5c 08 28        	movss	%xmm11, 0x28(%rax,%rcx)
1454eaf63: 0f 13 7c 08 2c              	movlps	%xmm7, 0x2c(%rax,%rcx)
1454eaf68: f3 44 0f 11 44 08 34        	movss	%xmm8, 0x34(%rax,%rcx)
1454eaf6f: f3 0f 11 74 08 38           	movss	%xmm6, 0x38(%rax,%rcx)
1454eaf75: 89 74 08 3c                 	movl	%esi, 0x3c(%rax,%rcx)
1454eaf79: f3 44 0f 11 64 08 40        	movss	%xmm12, 0x40(%rax,%rcx)
1454eaf80: f3 44 0f 11 74 08 44        	movss	%xmm14, 0x44(%rax,%rcx)
1454eaf87: 44 89 7c 08 48              	movl	%r15d, 0x48(%rax,%rcx)
1454eaf8c: f3 44 0f 11 54 08 4c        	movss	%xmm10, 0x4c(%rax,%rcx)
1454eaf93: f3 44 0f 11 4c 08 50        	movss	%xmm9, 0x50(%rax,%rcx)
1454eaf9a: 88 5c 08 54                 	movb	%bl, 0x54(%rax,%rcx)
1454eaf9e: 48 ff c7                    	incq	%rdi
1454eafa1: 49 89 bd e8 04 00 00        	movq	%rdi, 0x4e8(%r13)
1454eafa8: e9 d9 05 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454eafad: 4a 8d 0c ca                 	leaq	(%rdx,%r9,8), %rcx
1454eafb1: 4e 8b 2c ca                 	movq	(%rdx,%r9,8), %r13
1454eafb5: 4a 8d 14 ca                 	leaq	(%rdx,%r9,8), %rdx
1454eafb9: 48 83 c2 08                 	addq	$0x8, %rdx
1454eafbd: e8 0f be 26 00              	callq	0x145756dd1 <.text+0x5755dd1>
1454eafc2: 49 ff cf                    	decq	%r15
1454eafc5: 4c 89 bd a0 00 00 00        	movq	%r15, 0xa0(%rbp)
1454eafcc: c6 85 27 01 00 00 01        	movb	$0x1, 0x127(%rbp)
1454eafd3: 48 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %rcx
1454eafda: 4c 89 ea                    	movq	%r13, %rdx
1454eafdd: e8 ee 3a fd ff              	callq	0x1454bead0 <.text+0x54bdad0>
1454eafe2: 90                          	nop
1454eafe3: 4c 8b bd a0 00 00 00        	movq	0xa0(%rbp), %r15
1454eafea: 4d 39 fc                    	cmpq	%r15, %r12
1454eafed: 0f 87 3b 03 00 00           	ja	0x1454eb32e <.text+0x54ea32e>
1454eaff3: 4c 89 a5 a0 00 00 00        	movq	%r12, 0xa0(%rbp)
1454eaffa: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
1454eb001: 48 89 85 18 01 00 00        	movq	%rax, 0x118(%rbp)
1454eb008: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454eb00f: 4e 8d 3c e1                 	leaq	(%rcx,%r12,8), %r15
1454eb013: e9 38 03 00 00              	jmp	0x1454eb350 <.text+0x54ea350>
1454eb018: f3 44 0f 10 5e 70           	movss	0x70(%rsi), %xmm11
1454eb01e: e9 c2 fe ff ff              	jmp	0x1454eaee5 <.text+0x54e9ee5>
1454eb023: f3 44 0f 59 5e 70           	mulss	0x70(%rsi), %xmm11
1454eb029: e9 b7 fe ff ff              	jmp	0x1454eaee5 <.text+0x54e9ee5>
1454eb02e: f3 41 0f 59 d5              	mulss	%xmm13, %xmm2
1454eb033: f3 0f 5d 15 d9 04 40 00     	minss	0x4004d9(%rip), %xmm2   # 0x1458eb514
1454eb03b: f3 44 0f 59 5e 70           	mulss	0x70(%rsi), %xmm11
1454eb041: 44 0f 28 ea                 	movaps	%xmm2, %xmm13
1454eb045: e9 9b fe ff ff              	jmp	0x1454eaee5 <.text+0x54e9ee5>
1454eb04a: 4c 8d b7 f0 02 00 00        	leaq	0x2f0(%rdi), %r14
1454eb051: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454eb055: f3 45 0f 59 cb              	mulss	%xmm11, %xmm9
1454eb05a: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454eb05d: f3 41 0f 51 c9              	sqrtss	%xmm9, %xmm1
1454eb062: f3 0f 59 0d d6 dc 40 00     	mulss	0x40dcd6(%rip), %xmm1   # 0x1458f8d40
1454eb06a: f3 0f 59 c8                 	mulss	%xmm0, %xmm1
1454eb06e: f3 0f 10 87 04 04 00 00     	movss	0x404(%rdi), %xmm0
1454eb076: f3 0f 10 97 98 04 00 00     	movss	0x498(%rdi), %xmm2
1454eb07e: f3 0f 58 15 fa 03 40 00     	addss	0x4003fa(%rip), %xmm2   # 0x1458eb480
1454eb086: f3 0f 59 d1                 	mulss	%xmm1, %xmm2
1454eb08a: f3 0f 5c 87 dc 03 00 00     	subss	0x3dc(%rdi), %xmm0
1454eb092: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454eb095: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
1454eb099: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1454eb09d: f3 0f 11 87 04 04 00 00     	movss	%xmm0, 0x404(%rdi)
1454eb0a5: 8b 46 40                    	movl	0x40(%rsi), %eax
1454eb0a8: 89 87 d8 03 00 00           	movl	%eax, 0x3d8(%rdi)
1454eb0ae: f3 0f 11 97 dc 03 00 00     	movss	%xmm2, 0x3dc(%rdi)
1454eb0b6: 4c 8d bf 38 05 00 00        	leaq	0x538(%rdi), %r15
1454eb0bd: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454eb0c4: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454eb0c8: 48 89 95 90 00 00 00        	movq	%rdx, 0x90(%rbp)
1454eb0cf: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454eb0d9: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454eb0e0: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454eb0e4: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454eb0e9: 48 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %rax
1454eb0f0: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454eb0f5: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454eb0fe: 4c 8d a5 e0 00 00 00        	leaq	0xe0(%rbp), %r12
1454eb105: 4c 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %r9
1454eb10c: 4c 89 e1                    	movq	%r12, %rcx
1454eb10f: e8 8c 00 f6 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454eb114: 4c 89 f9                    	movq	%r15, %rcx
1454eb117: 4c 89 e2                    	movq	%r12, %rdx
1454eb11a: e8 d1 88 6e fb              	callq	0x140bd39f0 <.text+0xbd29f0>
1454eb11f: 4c 89 f1                    	movq	%r14, %rcx
1454eb122: 48 89 f2                    	movq	%rsi, %rdx
1454eb125: e8 46 80 03 00              	callq	0x145523170 <.text+0x5522170>
1454eb12a: 8b 76 40                    	movl	0x40(%rsi), %esi
1454eb12d: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454eb134: 48 89 da                    	movq	%rbx, %rdx
1454eb137: e8 d4 12 fa ff              	callq	0x14548c410 <.text+0x548b410>
1454eb13c: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
1454eb141: 48 89 f8                    	movq	%rdi, %rax
1454eb144: 48 8b bf 00 03 00 00        	movq	0x300(%rdi), %rdi
1454eb14b: 48 89 c3                    	movq	%rax, %rbx
1454eb14e: 48 3b b8 f0 02 00 00        	cmpq	0x2f0(%rax), %rdi
1454eb155: 75 08                       	jne	0x1454eb15f <.text+0x54ea15f>
1454eb157: 4c 89 f1                    	movq	%r14, %rcx
1454eb15a: e8 c1 8a 27 00              	callq	0x145763c20 <.text+0x5762c20>
1454eb15f: 48 89 d9                    	movq	%rbx, %rcx
1454eb162: 48 8b 83 f8 02 00 00        	movq	0x2f8(%rbx), %rax
1454eb169: 4c 8d 04 7f                 	leaq	(%rdi,%rdi,2), %r8
1454eb16d: 8b 95 e8 00 00 00           	movl	0xe8(%rbp), %edx
1454eb173: 42 89 54 c0 08              	movl	%edx, 0x8(%rax,%r8,8)
1454eb178: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454eb17f: 4a 89 14 c0                 	movq	%rdx, (%rax,%r8,8)
1454eb183: 42 89 74 c0 0c              	movl	%esi, 0xc(%rax,%r8,8)
1454eb188: f3 42 0f 11 7c c0 10        	movss	%xmm7, 0x10(%rax,%r8,8)
1454eb18f: 42 c7 44 c0 14 00 00 00 00  	movl	$0x0, 0x14(%rax,%r8,8)
1454eb198: 48 ff c7                    	incq	%rdi
1454eb19b: 48 89 bb 00 03 00 00        	movq	%rdi, 0x300(%rbx)
1454eb1a2: e8 09 21 fa ff              	callq	0x14548d2b0 <.text+0x548c2b0>
1454eb1a7: e9 da 03 00 00              	jmp	0x1454eb586 <.text+0x54ea586>
1454eb1ac: f3 0f 10 76 70              	movss	0x70(%rsi), %xmm6
1454eb1b1: 41 83 fe 0c                 	cmpl	$0xc, %r14d
1454eb1b5: 0f 85 60 d8 ff ff           	jne	0x1454e8a1b <.text+0x54e7a1b>
1454eb1bb: f3 45 0f 59 ca              	mulss	%xmm10, %xmm9
1454eb1c0: f3 45 0f 59 d9              	mulss	%xmm9, %xmm11
1454eb1c5: 45 0f 28 d3                 	movaps	%xmm11, %xmm10
1454eb1c9: e9 4d d8 ff ff              	jmp	0x1454e8a1b <.text+0x54e7a1b>
1454eb1ce: f3 0f 59 76 70              	mulss	0x70(%rsi), %xmm6
1454eb1d3: e9 43 d8 ff ff              	jmp	0x1454e8a1b <.text+0x54e7a1b>
1454eb1d8: f3 41 0f 59 c2              	mulss	%xmm10, %xmm0
1454eb1dd: f3 0f 5d 05 2f 03 40 00     	minss	0x40032f(%rip), %xmm0   # 0x1458eb514
1454eb1e5: f3 0f 59 76 70              	mulss	0x70(%rsi), %xmm6
1454eb1ea: 44 0f 28 d0                 	movaps	%xmm0, %xmm10
1454eb1ee: e9 28 d8 ff ff              	jmp	0x1454e8a1b <.text+0x54e7a1b>
1454eb1f3: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
1454eb1f7: 48 85 d2                    	testq	%rdx, %rdx
1454eb1fa: 74 13                       	je	0x1454eb20f <.text+0x54ea20f>
1454eb1fc: 48 8b 4d d0                 	movq	-0x30(%rbp), %rcx
1454eb200: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454eb204: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454eb20a: e8 c1 6f b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eb20f: 4e 8d 2c fd 00 00 00 00     	leaq	(,%r15,8), %r13
1454eb217: 4c 89 f8                    	movq	%r15, %rax
1454eb21a: 48 c1 e8 3d                 	shrq	$0x3d, %rax
1454eb21e: 0f 95 c0                    	setne	%al
1454eb221: 48 b9 f8 ff ff ff ff ff ff 7f       	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454eb22b: 49 39 cd                    	cmpq	%rcx, %r13
1454eb22e: 0f 97 c1                    	seta	%cl
1454eb231: 08 c1                       	orb	%al, %cl
1454eb233: 74 17                       	je	0x1454eb24c <.text+0x54ea24c>
1454eb235: 31 c9                       	xorl	%ecx, %ecx
1454eb237: c6 85 27 01 00 00 01        	movb	$0x1, 0x127(%rbp)
1454eb23e: 4c 89 ea                    	movq	%r13, %rdx
1454eb241: e8 d5 bf 3f 00              	callq	0x1458e721b <.text+0x58e621b>
1454eb246: 90                          	nop
1454eb247: e9 10 05 00 00              	jmp	0x1454eb75c <.text+0x54ea75c>
1454eb24c: 4d 85 ed                    	testq	%r13, %r13
1454eb24f: 74 21                       	je	0x1454eb272 <.text+0x54ea272>
1454eb251: e8 aa 6f b1 fa              	callq	0x140002200 <.text+0x1200>
1454eb256: ba 08 00 00 00              	movl	$0x8, %edx
1454eb25b: 4c 89 e9                    	movq	%r13, %rcx
1454eb25e: e8 5d 6f b1 fa              	callq	0x1400021c0 <.text+0x11c0>
1454eb263: b9 08 00 00 00              	movl	$0x8, %ecx
1454eb268: 48 85 c0                    	testq	%rax, %rax
1454eb26b: 74 ca                       	je	0x1454eb237 <.text+0x54ea237>
1454eb26d: 4c 89 f9                    	movq	%r15, %rcx
1454eb270: eb 07                       	jmp	0x1454eb279 <.text+0x54ea279>
1454eb272: b8 08 00 00 00              	movl	$0x8, %eax
1454eb277: 31 c9                       	xorl	%ecx, %ecx
1454eb279: 48 89 4d 50                 	movq	%rcx, 0x50(%rbp)
1454eb27d: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
1454eb281: 48 c7 45 60 00 00 00 00     	movq	$0x0, 0x60(%rbp)
1454eb289: 4d 85 ff                    	testq	%r15, %r15
1454eb28c: 74 12                       	je	0x1454eb2a0 <.text+0x54ea2a0>
1454eb28e: 48 89 c1                    	movq	%rax, %rcx
1454eb291: 4c 89 f2                    	movq	%r14, %rdx
1454eb294: 4d 89 e8                    	movq	%r13, %r8
1454eb297: e8 41 bb 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454eb29c: 4c 89 7d 60                 	movq	%r15, 0x60(%rbp)
1454eb2a0: 48 c7 85 e8 00 00 00 00 00 00 00    	movq	$0x0, 0xe8(%rbp)
1454eb2ab: 4c 89 a5 f0 00 00 00        	movq	%r12, 0xf0(%rbp)
1454eb2b2: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454eb2b6: 48 89 85 e0 00 00 00        	movq	%rax, 0xe0(%rbp)
1454eb2bd: 48 8d 8d b8 00 00 00        	leaq	0xb8(%rbp), %rcx
1454eb2c4: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1454eb2cb: e8 90 c2 04 00              	callq	0x145537560 <.text+0x5536560>
1454eb2d0: 90                          	nop
1454eb2d1: 48 8b 95 90 00 00 00        	movq	0x90(%rbp), %rdx
1454eb2d8: 48 85 d2                    	testq	%rdx, %rdx
1454eb2db: 74 12                       	je	0x1454eb2ef <.text+0x54ea2ef>
1454eb2dd: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454eb2e1: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454eb2e7: 4c 89 f1                    	movq	%r14, %rcx
1454eb2ea: e8 e1 6e b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eb2ef: 48 8b 85 c8 00 00 00        	movq	0xc8(%rbp), %rax
1454eb2f6: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1454eb2fd: 0f 10 85 b8 00 00 00        	movups	0xb8(%rbp), %xmm0
1454eb304: 0f 29 85 90 00 00 00        	movaps	%xmm0, 0x90(%rbp)
1454eb30b: 48 8b 55 50                 	movq	0x50(%rbp), %rdx
1454eb30f: 48 85 d2                    	testq	%rdx, %rdx
1454eb312: 74 13                       	je	0x1454eb327 <.text+0x54ea327>
1454eb314: 48 8b 4d 58                 	movq	0x58(%rbp), %rcx
1454eb318: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454eb31c: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454eb322: e8 a9 6e b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eb327: 4c 8b bd a0 00 00 00        	movq	0xa0(%rbp), %r15
1454eb32e: 48 8b 95 90 00 00 00        	movq	0x90(%rbp), %rdx
1454eb335: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
1454eb33c: 4d 85 ff                    	testq	%r15, %r15
1454eb33f: 0f 84 2d 02 00 00           	je	0x1454eb572 <.text+0x54ea572>
1454eb345: 48 89 95 18 01 00 00        	movq	%rdx, 0x118(%rbp)
1454eb34c: 4e 8d 3c f9                 	leaq	(%rcx,%r15,8), %r15
1454eb350: f3 0f 10 73 48              	movss	0x48(%rbx), %xmm6
1454eb355: f3 0f 10 7b 50              	movss	0x50(%rbx), %xmm7
1454eb35a: 45 31 ed                    	xorl	%r13d, %r13d
1454eb35d: f3 44 0f 10 05 ba 01 40 00  	movss	0x4001ba(%rip), %xmm8   # 0x1458eb520
1454eb366: 48 8d 9d b8 00 00 00        	leaq	0xb8(%rbp), %rbx
1454eb36d: 4c 8d 25 c8 1c 4c 01        	leaq	0x14c1cc8(%rip), %r12   # 0x1469ad03c
1454eb374: f3 44 0f 10 0d 97 01 40 00  	movss	0x400197(%rip), %xmm9   # 0x1458eb514
1454eb37d: 45 31 f6                    	xorl	%r14d, %r14d
1454eb380: 48 89 8d 88 00 00 00        	movq	%rcx, 0x88(%rbp)
1454eb387: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454eb390: 4d 85 ed                    	testq	%r13, %r13
1454eb393: 78 1b                       	js	0x1454eb3b0 <.text+0x54ea3b0>
1454eb395: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454eb398: f3 49 0f 2a c5              	cvtsi2ss	%r13, %xmm0
1454eb39d: 80 7e 75 01                 	cmpb	$0x1, 0x75(%rsi)
1454eb3a1: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454eb3a6: 75 2e                       	jne	0x1454eb3d6 <.text+0x54ea3d6>
1454eb3a8: eb 2f                       	jmp	0x1454eb3d9 <.text+0x54ea3d9>
1454eb3aa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454eb3b0: 4c 89 e8                    	movq	%r13, %rax
1454eb3b3: 48 d1 e8                    	shrq	%rax
1454eb3b6: 44 89 ea                    	movl	%r13d, %edx
1454eb3b9: 83 e2 01                    	andl	$0x1, %edx
1454eb3bc: 48 09 c2                    	orq	%rax, %rdx
1454eb3bf: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454eb3c2: f3 48 0f 2a c2              	cvtsi2ss	%rdx, %xmm0
1454eb3c7: f3 0f 58 c0                 	addss	%xmm0, %xmm0
1454eb3cb: 80 7e 75 01                 	cmpb	$0x1, 0x75(%rsi)
1454eb3cf: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454eb3d4: 74 03                       	je	0x1454eb3d9 <.text+0x54ea3d9>
1454eb3d6: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454eb3d9: 4a 8b 04 e9                 	movq	(%rcx,%r13,8), %rax
1454eb3dd: 8b 4e 68                    	movl	0x68(%rsi), %ecx
1454eb3e0: ff c9                       	decl	%ecx
1454eb3e2: 83 f9 09                    	cmpl	$0x9, %ecx
1454eb3e5: 77 36                       	ja	0x1454eb41d <.text+0x54ea41d>
1454eb3e7: 49 63 0c 8c                 	movslq	(%r12,%rcx,4), %rcx
1454eb3eb: 4c 01 e1                    	addq	%r12, %rcx
1454eb3ee: ff e1                       	jmpq	*%rcx
1454eb3f0: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb3f5: f3 0f 10 56 70              	movss	0x70(%rsi), %xmm2
1454eb3fa: f3 0f 59 d6                 	mulss	%xmm6, %xmm2
1454eb3fe: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb406: f3 0f 11 95 c0 00 00 00     	movss	%xmm2, 0xc0(%rbp)
1454eb40e: c7 85 b8 00 00 00 01 00 00 00       	movl	$0x1, 0xb8(%rbp)
1454eb418: e9 f3 00 00 00              	jmp	0x1454eb510 <.text+0x54ea510>
1454eb41d: 48 8d 56 68                 	leaq	0x68(%rsi), %rdx
1454eb421: 8b 4a 08                    	movl	0x8(%rdx), %ecx
1454eb424: 89 8d c0 00 00 00           	movl	%ecx, 0xc0(%rbp)
1454eb42a: 48 8b 0a                    	movq	(%rdx), %rcx
1454eb42d: 48 89 8d b8 00 00 00        	movq	%rcx, 0xb8(%rbp)
1454eb434: e9 d7 00 00 00              	jmp	0x1454eb510 <.text+0x54ea510>
1454eb439: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb43e: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb442: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb44a: c7 85 b8 00 00 00 09 00 00 00       	movl	$0x9, 0xb8(%rbp)
1454eb454: e9 b7 00 00 00              	jmp	0x1454eb510 <.text+0x54ea510>
1454eb459: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb45e: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb462: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb46a: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454eb474: e9 97 00 00 00              	jmp	0x1454eb510 <.text+0x54ea510>
1454eb479: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb47e: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb482: f3 41 0f 5d c9              	minss	%xmm9, %xmm1
1454eb487: f3 0f 10 56 70              	movss	0x70(%rsi), %xmm2
1454eb48c: f3 0f 59 d6                 	mulss	%xmm6, %xmm2
1454eb490: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb498: f3 0f 11 95 c0 00 00 00     	movss	%xmm2, 0xc0(%rbp)
1454eb4a0: c7 85 b8 00 00 00 0a 00 00 00       	movl	$0xa, 0xb8(%rbp)
1454eb4aa: eb 64                       	jmp	0x1454eb510 <.text+0x54ea510>
1454eb4ac: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb4b1: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb4b5: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb4bd: c7 85 b8 00 00 00 03 00 00 00       	movl	$0x3, 0xb8(%rbp)
1454eb4c7: eb 47                       	jmp	0x1454eb510 <.text+0x54ea510>
1454eb4c9: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb4ce: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb4d2: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb4da: c7 85 b8 00 00 00 07 00 00 00       	movl	$0x7, 0xb8(%rbp)
1454eb4e4: eb 2a                       	jmp	0x1454eb510 <.text+0x54ea510>
1454eb4e6: f3 0f 10 4e 6c              	movss	0x6c(%rsi), %xmm1
1454eb4eb: f3 0f 59 cf                 	mulss	%xmm7, %xmm1
1454eb4ef: f3 0f 11 8d bc 00 00 00     	movss	%xmm1, 0xbc(%rbp)
1454eb4f7: c7 85 b8 00 00 00 08 00 00 00       	movl	$0x8, 0xb8(%rbp)
1454eb501: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1454eb510: c7 85 e0 00 00 00 00 00 00 00       	movl	$0x0, 0xe0(%rbp)
1454eb51a: 8b 56 40                    	movl	0x40(%rsi), %edx
1454eb51d: 44 0f b6 46 74              	movzbl	0x74(%rsi), %r8d
1454eb522: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454eb529: 48 89 4c 24 38              	movq	%rcx, 0x38(%rsp)
1454eb52e: f3 0f 11 44 24 30           	movss	%xmm0, 0x30(%rsp)
1454eb534: f3 44 0f 11 54 24 28        	movss	%xmm10, 0x28(%rsp)
1454eb53b: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454eb540: 48 89 f9                    	movq	%rdi, %rcx
1454eb543: 49 89 d9                    	movq	%rbx, %r9
1454eb546: e8 65 3e 00 00              	callq	0x1454ef3b0 <.text+0x54ee3b0>
1454eb54b: 90                          	nop
1454eb54c: 48 8b 8d 88 00 00 00        	movq	0x88(%rbp), %rcx
1454eb553: 4a 8d 04 31                 	leaq	(%rcx,%r14), %rax
1454eb557: 48 83 c0 08                 	addq	$0x8, %rax
1454eb55b: 49 83 c6 08                 	addq	$0x8, %r14
1454eb55f: 49 ff c5                    	incq	%r13
1454eb562: 4c 39 f8                    	cmpq	%r15, %rax
1454eb565: 0f 85 25 fe ff ff           	jne	0x1454eb390 <.text+0x54ea390>
1454eb56b: 48 8b 95 18 01 00 00        	movq	0x118(%rbp), %rdx
1454eb572: 48 85 d2                    	testq	%rdx, %rdx
1454eb575: 74 0f                       	je	0x1454eb586 <.text+0x54ea586>
1454eb577: 48 c1 e2 03                 	shlq	$0x3, %rdx
1454eb57b: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454eb581: e8 4a 6c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454eb586: b0 01                       	movb	$0x1, %al
1454eb588: 0f 28 b5 30 01 00 00        	movaps	0x130(%rbp), %xmm6
1454eb58f: 0f 28 bd 40 01 00 00        	movaps	0x140(%rbp), %xmm7
1454eb596: 44 0f 28 85 50 01 00 00     	movaps	0x150(%rbp), %xmm8
1454eb59e: 44 0f 28 8d 60 01 00 00     	movaps	0x160(%rbp), %xmm9
1454eb5a6: 44 0f 28 95 70 01 00 00     	movaps	0x170(%rbp), %xmm10
1454eb5ae: 44 0f 28 9d 80 01 00 00     	movaps	0x180(%rbp), %xmm11
1454eb5b6: 44 0f 28 a5 90 01 00 00     	movaps	0x190(%rbp), %xmm12
1454eb5be: 44 0f 28 ad a0 01 00 00     	movaps	0x1a0(%rbp), %xmm13
1454eb5c6: 44 0f 28 b5 b0 01 00 00     	movaps	0x1b0(%rbp), %xmm14
1454eb5ce: 44 0f 28 bd c0 01 00 00     	movaps	0x1c0(%rbp), %xmm15
1454eb5d6: 48 81 c4 58 02 00 00        	addq	$0x258, %rsp            # imm = 0x258
1454eb5dd: 5b                          	popq	%rbx
1454eb5de: 5f                          	popq	%rdi
1454eb5df: 5e                          	popq	%rsi
1454eb5e0: 41 5c                       	popq	%r12
1454eb5e2: 41 5d                       	popq	%r13
1454eb5e4: 41 5e                       	popq	%r14
1454eb5e6: 41 5f                       	popq	%r15
1454eb5e8: 5d                          	popq	%rbp
1454eb5e9: c3                          	retq
1454eb5ea: f3 0f 10 8f 00 04 00 00     	movss	0x400(%rdi), %xmm1
1454eb5f2: f3 0f 10 15 f6 17 41 00     	movss	0x4117f6(%rip), %xmm2   # 0x1458fcdf0
1454eb5fa: f3 0f 59 d0                 	mulss	%xmm0, %xmm2
1454eb5fe: 0f 2e ca                    	ucomiss	%xmm2, %xmm1
1454eb601: 0f 87 20 df ff ff           	ja	0x1454e9527 <.text+0x54e8527>
1454eb607: f3 0f 59 46 6c              	mulss	0x6c(%rsi), %xmm0
1454eb60c: f3 45 0f 59 cb              	mulss	%xmm11, %xmm9
1454eb611: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454eb614: f3 41 0f 51 f1              	sqrtss	%xmm9, %xmm6
1454eb619: f3 0f 59 35 1f d7 40 00     	mulss	0x40d71f(%rip), %xmm6   # 0x1458f8d40
1454eb621: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454eb625: 4c 8d b7 38 05 00 00        	leaq	0x538(%rdi), %r14
1454eb62c: 48 8b 97 d0 03 00 00        	movq	0x3d0(%rdi), %rdx
1454eb633: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454eb637: 48 89 95 90 00 00 00        	movq	%rdx, 0x90(%rbp)
1454eb63e: c7 85 b8 00 00 00 02 00 00 00       	movl	$0x2, 0xb8(%rbp)
1454eb648: c7 45 50 00 00 00 00        	movl	$0x0, 0x50(%rbp)
1454eb64f: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
1454eb653: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
1454eb658: 48 8d 85 b8 00 00 00        	leaq	0xb8(%rbp), %rax
1454eb65f: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
1454eb664: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1454eb66d: 4c 8d bd e0 00 00 00        	leaq	0xe0(%rbp), %r15
1454eb674: 4c 8d 8d 90 00 00 00        	leaq	0x90(%rbp), %r9
1454eb67b: 4c 89 f9                    	movq	%r15, %rcx
1454eb67e: e8 1d fb f5 ff              	callq	0x14544b1a0 <.text+0x544a1a0>
1454eb683: 4c 89 f1                    	movq	%r14, %rcx
1454eb686: 4c 89 fa                    	movq	%r15, %rdx
1454eb689: e8 62 83 6e fb              	callq	0x140bd39f0 <.text+0xbd29f0>
1454eb68e: f3 0f 10 46 58              	movss	0x58(%rsi), %xmm0
1454eb693: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454eb696: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1454eb699: 0f 86 83 00 00 00           	jbe	0x1454eb722 <.text+0x54ea722>
1454eb69f: 4c 8d b7 f0 02 00 00        	leaq	0x2f0(%rdi), %r14
1454eb6a6: 4c 89 f1                    	movq	%r14, %rcx
1454eb6a9: 48 89 f2                    	movq	%rsi, %rdx
1454eb6ac: e8 bf 7a 03 00              	callq	0x145523170 <.text+0x5522170>
1454eb6b1: 8b 76 40                    	movl	0x40(%rsi), %esi
1454eb6b4: 48 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %rcx
1454eb6bb: 48 89 da                    	movq	%rbx, %rdx
1454eb6be: e8 4d 0d fa ff              	callq	0x14548c410 <.text+0x548b410>
1454eb6c3: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
1454eb6c8: 48 89 f8                    	movq	%rdi, %rax
1454eb6cb: 48 8b bf 00 03 00 00        	movq	0x300(%rdi), %rdi
1454eb6d2: 48 89 c3                    	movq	%rax, %rbx
1454eb6d5: 48 3b b8 f0 02 00 00        	cmpq	0x2f0(%rax), %rdi
1454eb6dc: 75 08                       	jne	0x1454eb6e6 <.text+0x54ea6e6>
1454eb6de: 4c 89 f1                    	movq	%r14, %rcx
1454eb6e1: e8 3a 85 27 00              	callq	0x145763c20 <.text+0x5762c20>
1454eb6e6: 48 89 d9                    	movq	%rbx, %rcx
1454eb6e9: 48 8b 83 f8 02 00 00        	movq	0x2f8(%rbx), %rax
1454eb6f0: 4c 8d 04 7f                 	leaq	(%rdi,%rdi,2), %r8
1454eb6f4: 8b 95 e8 00 00 00           	movl	0xe8(%rbp), %edx
1454eb6fa: 42 89 54 c0 08              	movl	%edx, 0x8(%rax,%r8,8)
1454eb6ff: 48 8b 95 e0 00 00 00        	movq	0xe0(%rbp), %rdx
1454eb706: 4a 89 14 c0                 	movq	%rdx, (%rax,%r8,8)
1454eb70a: 42 89 74 c0 0c              	movl	%esi, 0xc(%rax,%r8,8)
1454eb70f: f3 42 0f 11 7c c0 10        	movss	%xmm7, 0x10(%rax,%r8,8)
1454eb716: f3 42 0f 11 74 c0 14        	movss	%xmm6, 0x14(%rax,%r8,8)
1454eb71d: e9 76 fa ff ff              	jmp	0x1454eb198 <.text+0x54ea198>
1454eb722: 44 8b 46 40                 	movl	0x40(%rsi), %r8d
1454eb726: 48 c7 85 e0 00 00 00 fe ff ff ff    	movq	$-0x2, 0xe0(%rbp)
1454eb731: 4c 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %r9
1454eb738: 48 89 f9                    	movq	%rdi, %rcx
1454eb73b: 0f 28 ce                    	movaps	%xmm6, %xmm1
1454eb73e: e8 7d 88 fa ff              	callq	0x145493fc0 <.text+0x5492fc0>
1454eb743: e9 3e fe ff ff              	jmp	0x1454eb586 <.text+0x54ea586>
1454eb748: c6 85 26 01 00 00 01        	movb	$0x1, 0x126(%rbp)
1454eb74f: 48 8d 0d 1a 0f 4c 01        	leaq	0x14c0f1a(%rip), %rcx   # 0x1469ac670
1454eb756: e8 b5 bd 3f 00              	callq	0x1458e7510 <.text+0x58e6510>
1454eb75b: 90                          	nop
1454eb75c: 0f 0b                       	ud2
1454eb75e: 4c 8d 52 01                 	leaq	0x1(%rdx), %r10
1454eb762: 49 39 da                    	cmpq	%rbx, %r10
1454eb765: 73 44                       	jae	0x1454eb7ab <.text+0x54ea7ab>
1454eb767: 4c 8d 4b fe                 	leaq	-0x2(%rbx), %r9
1454eb76b: 8d 34 13                    	leal	(%rbx,%rdx), %esi
1454eb76e: 49 89 d3                    	movq	%rdx, %r11
1454eb771: 40 f6 c6 01                 	testb	$0x1, %sil
1454eb775: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454eb77c: 75 25                       	jne	0x1454eb7a3 <.text+0x54ea7a3>
1454eb77e: 49 89 d3                    	movq	%rdx, %r11
1454eb781: 45 39 78 24                 	cmpl	%r15d, 0x24(%r8)
1454eb785: 74 18                       	je	0x1454eb79f <.text+0x54ea79f>
1454eb787: 4d 8d 50 18                 	leaq	0x18(%r8), %r10
1454eb78b: 4d 8b 5a 10                 	movq	0x10(%r10), %r11
1454eb78f: 4d 89 58 10                 	movq	%r11, 0x10(%r8)
1454eb793: 41 0f 10 02                 	movups	(%r10), %xmm0
1454eb797: 41 0f 11 00                 	movups	%xmm0, (%r8)
1454eb79b: 4c 8d 5a 01                 	leaq	0x1(%rdx), %r11
1454eb79f: 4c 8d 52 02                 	leaq	0x2(%rdx), %r10
1454eb7a3: 49 39 d1                    	cmpq	%rdx, %r9
1454eb7a6: 4c 89 da                    	movq	%r11, %rdx
1454eb7a9: 75 21                       	jne	0x1454eb7cc <.text+0x54ea7cc>
1454eb7ab: 48 89 97 00 03 00 00        	movq	%rdx, 0x300(%rdi)
1454eb7b2: 44 8b 7e 40                 	movl	0x40(%rsi), %r15d
1454eb7b6: 48 89 d3                    	movq	%rdx, %rbx
1454eb7b9: f3 41 0f 58 f8              	addss	%xmm8, %xmm7
1454eb7be: 48 3b 19                    	cmpq	(%rcx), %rbx
1454eb7c1: 0f 84 be f1 ff ff           	je	0x1454ea985 <.text+0x54e9985>
1454eb7c7: e9 be f1 ff ff              	jmp	0x1454ea98a <.text+0x54e998a>
1454eb7cc: 4b 8d 14 52                 	leaq	(%r10,%r10,2), %rdx
1454eb7d0: 4c 8d 04 d0                 	leaq	(%rax,%rdx,8), %r8
1454eb7d4: 4c 29 d3                    	subq	%r10, %rbx
1454eb7d7: 4c 89 da                    	movq	%r11, %rdx
1454eb7da: eb 0a                       	jmp	0x1454eb7e6 <.text+0x54ea7e6>
1454eb7dc: 49 83 c0 30                 	addq	$0x30, %r8
1454eb7e0: 48 83 c3 fe                 	addq	$-0x2, %rbx
1454eb7e4: 74 c5                       	je	0x1454eb7ab <.text+0x54ea7ab>
1454eb7e6: 45 39 78 0c                 	cmpl	%r15d, 0xc(%r8)
1454eb7ea: 75 08                       	jne	0x1454eb7f4 <.text+0x54ea7f4>
1454eb7ec: 45 39 78 24                 	cmpl	%r15d, 0x24(%r8)
1454eb7f0: 74 ea                       	je	0x1454eb7dc <.text+0x54ea7dc>
1454eb7f2: eb 1f                       	jmp	0x1454eb813 <.text+0x54ea813>
1454eb7f4: 4c 8d 0c 52                 	leaq	(%rdx,%rdx,2), %r9
1454eb7f8: 4d 8b 50 10                 	movq	0x10(%r8), %r10
1454eb7fc: 4e 89 54 c8 10              	movq	%r10, 0x10(%rax,%r9,8)
1454eb801: 41 0f 10 00                 	movups	(%r8), %xmm0
1454eb805: 42 0f 11 04 c8              	movups	%xmm0, (%rax,%r9,8)
1454eb80a: 48 ff c2                    	incq	%rdx
1454eb80d: 45 39 78 24                 	cmpl	%r15d, 0x24(%r8)
1454eb811: 74 c9                       	je	0x1454eb7dc <.text+0x54ea7dc>
1454eb813: 4c 8d 0c 52                 	leaq	(%rdx,%rdx,2), %r9
1454eb817: 4d 8b 50 28                 	movq	0x28(%r8), %r10
1454eb81b: 4e 89 54 c8 10              	movq	%r10, 0x10(%rax,%r9,8)
1454eb820: 41 0f 10 40 18              	movups	0x18(%r8), %xmm0
1454eb825: 42 0f 11 04 c8              	movups	%xmm0, (%rax,%r9,8)
1454eb82a: 48 ff c2                    	incq	%rdx
1454eb82d: eb ad                       	jmp	0x1454eb7dc <.text+0x54ea7dc>
1454eb82f: 4c 89 9d 18 01 00 00        	movq	%r11, 0x118(%rbp)
1454eb836: 49 83 fe 15                 	cmpq	$0x15, %r14
1454eb83a: 0f 83 b0 00 00 00           	jae	0x1454eb8f0 <.text+0x54ea8f0>
1454eb840: 4c 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %r9
1454eb847: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454eb84d: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454eb854: 4c 89 f2                    	movq	%r14, %rdx
1454eb857: e8 74 95 00 00              	callq	0x1454f4dd0 <.text+0x54f3dd0>
1454eb85c: 48 8b 85 b8 00 00 00        	movq	0xb8(%rbp), %rax
1454eb863: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454eb86a: 4c 8b 9d 18 01 00 00        	movq	0x118(%rbp), %r11
1454eb871: e9 70 d9 ff ff              	jmp	0x1454e91e6 <.text+0x54e81e6>
1454eb876: 49 83 ff 15                 	cmpq	$0x15, %r15
1454eb87a: 0f 83 8c 00 00 00           	jae	0x1454eb90c <.text+0x54ea90c>
1454eb880: 4c 8d 8d e0 00 00 00        	leaq	0xe0(%rbp), %r9
1454eb887: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454eb88d: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454eb894: 4c 89 fa                    	movq	%r15, %rdx
1454eb897: e8 d4 c8 cc fc              	callq	0x1421b8170 <.text+0x21b7170>
1454eb89c: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454eb8a3: e9 71 dd ff ff              	jmp	0x1454e9619 <.text+0x54e8619>
1454eb8a8: b9 08 00 00 00              	movl	$0x8, %ecx
1454eb8ad: ba 08 00 00 00              	movl	$0x8, %edx
1454eb8b2: e8 4a b9 3f 00              	callq	0x1458e7201 <.text+0x58e6201>
1454eb8b7: 0f 0b                       	ud2
1454eb8b9: 49 83 fe 15                 	cmpq	$0x15, %r14
1454eb8bd: 73 77                       	jae	0x1454eb936 <.text+0x54ea936>
1454eb8bf: 4a 8d 34 f5 00 00 00 00     	leaq	(,%r14,8), %rsi
1454eb8c7: bf 08 00 00 00              	movl	$0x8, %edi
1454eb8cc: 4c 8d a5 90 00 00 00        	leaq	0x90(%rbp), %r12
1454eb8d3: 49 8d 14 3f                 	leaq	(%r15,%rdi), %rdx
1454eb8d7: 4c 89 f9                    	movq	%r15, %rcx
1454eb8da: 4d 89 e0                    	movq	%r12, %r8
1454eb8dd: e8 4e 57 00 00              	callq	0x1454f1030 <.text+0x54f0030>
1454eb8e2: 48 83 c7 08                 	addq	$0x8, %rdi
1454eb8e6: 48 39 fe                    	cmpq	%rdi, %rsi
1454eb8e9: 75 e8                       	jne	0x1454eb8d3 <.text+0x54ea8d3>
1454eb8eb: e9 4f d3 ff ff              	jmp	0x1454e8c3f <.text+0x54e7c3f>
1454eb8f0: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454eb8f7: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454eb8fe: 4c 89 f2                    	movq	%r14, %rdx
1454eb901: e8 8a e2 04 00              	callq	0x145539b90 <.text+0x5538b90>
1454eb906: 90                          	nop
1454eb907: e9 50 ff ff ff              	jmp	0x1454eb85c <.text+0x54ea85c>
1454eb90c: c6 85 87 00 00 00 01        	movb	$0x1, 0x87(%rbp)
1454eb913: 4c 8d 85 e0 00 00 00        	leaq	0xe0(%rbp), %r8
1454eb91a: 48 8b 8d 18 01 00 00        	movq	0x118(%rbp), %rcx
1454eb921: 4c 89 fa                    	movq	%r15, %rdx
1454eb924: e8 a7 e5 04 00              	callq	0x145539ed0 <.text+0x5538ed0>
1454eb929: 90                          	nop
1454eb92a: 48 8b b5 88 00 00 00        	movq	0x88(%rbp), %rsi
1454eb931: e9 e3 dc ff ff              	jmp	0x1454e9619 <.text+0x54e8619>
1454eb936: c6 85 de 00 00 00 01        	movb	$0x1, 0xde(%rbp)
1454eb93d: 4c 8d 45 50                 	leaq	0x50(%rbp), %r8
1454eb941: 4c 89 f9                    	movq	%r15, %rcx
1454eb944: 4c 89 f2                    	movq	%r14, %rdx
1454eb947: e8 c4 e8 04 00              	callq	0x14553a210 <.text+0x5539210>
1454eb94c: 90                          	nop
1454eb94d: e9 ed d2 ff ff              	jmp	0x1454e8c3f <.text+0x54e7c3f>
