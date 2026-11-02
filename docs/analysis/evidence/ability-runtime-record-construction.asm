
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e74d1: 4c 8d 2d 58 36 1e 01        	leaq	0x11e3658(%rip), %r13   # 0x1466cab30
1454e74d8: 0f 57 f6                    	xorps	%xmm6, %xmm6
1454e74db: f2 0f 10 3d bd 01 3c 00     	movsd	0x3c01bd(%rip), %xmm7   # 0x1458a76a0
1454e74e3: f2 44 0f 10 05 c4 01 3c 00  	movsd	0x3c01c4(%rip), %xmm8   # 0x1458a76b0
1454e74ec: 4c 3b 65 10                 	cmpq	0x10(%rbp), %r12
1454e74f0: 0f 84 fb 00 00 00           	je	0x1454e75f1 <.text+0x54e65f1>
1454e74f6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454e7500: 4d 8b 34 24                 	movq	(%r12), %r14
1454e7504: 4d 8b 7c 24 08              	movq	0x8(%r12), %r15
1454e7509: 49 83 c4 10                 	addq	$0x10, %r12
1454e750d: 4c 89 75 b0                 	movq	%r14, -0x50(%rbp)
1454e7511: 4c 89 7d b8                 	movq	%r15, -0x48(%rbp)
1454e7515: 31 db                       	xorl	%ebx, %ebx
1454e7517: eb 18                       	jmp	0x1454e7531 <.text+0x54e6531>
1454e7519: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454e7520: 48 83 c3 78                 	addq	$0x78, %rbx
1454e7524: 48 81 fb 08 34 00 00        	cmpq	$0x3408, %rbx           # imm = 0x3408
1454e752b: 0f 84 0e 01 00 00           	je	0x1454e763f <.text+0x54e663f>
1454e7531: 4e 39 7c 2b 08              	cmpq	%r15, 0x8(%rbx,%r13)
1454e7536: 75 e8                       	jne	0x1454e7520 <.text+0x54e6520>
1454e7538: 4a 8b 0c 2b                 	movq	(%rbx,%r13), %rcx
1454e753c: 4c 89 f2                    	movq	%r14, %rdx
1454e753f: 4d 89 f8                    	movq	%r15, %r8
1454e7542: e8 4a 3c 22 00              	callq	0x14570b191 <.text+0x570a191>
1454e7547: 85 c0                       	testl	%eax, %eax
1454e7549: 75 d5                       	jne	0x1454e7520 <.text+0x54e6520>
1454e754b: 48 8d 45 fc                 	leaq	-0x4(%rbp), %rax
1454e754f: 0f 11 30                    	movups	%xmm6, (%rax)
1454e7552: c7 40 10 00 00 00 00        	movl	$0x0, 0x10(%rax)
1454e7559: 4c 01 eb                    	addq	%r13, %rbx
1454e755c: 48 89 5d c0                 	movq	%rbx, -0x40(%rbp)
1454e7560: f2 0f 11 7d e4              	movsd	%xmm7, -0x1c(%rbp)
1454e7565: 48 c7 45 ec 00 00 80 3f     	movq	$0x3f800000, -0x14(%rbp) # imm = 0x3F800000
1454e756d: f2 44 0f 11 45 f4           	movsd	%xmm8, -0xc(%rbp)
1454e7573: f2 44 0f 11 45 c8           	movsd	%xmm8, -0x38(%rbp)
1454e7579: c7 45 d0 00 00 00 00        	movl	$0x0, -0x30(%rbp)
1454e7580: f2 44 0f 11 45 d4           	movsd	%xmm8, -0x2c(%rbp)
1454e7586: 48 b8 00 00 00 00 01 00 00 00       	movabsq	$0x100000000, %rax # imm = 0x100000000
1454e7590: 48 89 45 dc                 	movq	%rax, -0x24(%rbp)
1454e7594: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454e7598: 48 89 fa                    	movq	%rdi, %rdx
1454e759b: 49 89 d8                    	movq	%rbx, %r8
1454e759e: e8 0d 62 f5 ff              	callq	0x14543d7b0 <.text+0x543c7b0>
1454e75a3: 90                          	nop
1454e75a4: 48 8b 55 20                 	movq	0x20(%rbp), %rdx
1454e75a8: 48 8b 42 08                 	movq	0x8(%rdx), %rax
1454e75ac: 48 8d 0c 80                 	leaq	(%rax,%rax,4), %rcx
1454e75b0: 48 c1 e1 04                 	shlq	$0x4, %rcx
1454e75b4: 0f 10 45 00                 	movups	(%rbp), %xmm0
1454e75b8: 0f 11 44 0e 40              	movups	%xmm0, 0x40(%rsi,%rcx)
1454e75bd: 0f 10 45 c0                 	movups	-0x40(%rbp), %xmm0
1454e75c1: 0f 10 4d d0                 	movups	-0x30(%rbp), %xmm1
1454e75c5: 0f 10 55 e0                 	movups	-0x20(%rbp), %xmm2
1454e75c9: 0f 10 5d f0                 	movups	-0x10(%rbp), %xmm3
1454e75cd: 0f 11 5c 0e 30              	movups	%xmm3, 0x30(%rsi,%rcx)
1454e75d2: 0f 11 54 0e 20              	movups	%xmm2, 0x20(%rsi,%rcx)
1454e75d7: 0f 11 4c 0e 10              	movups	%xmm1, 0x10(%rsi,%rcx)
1454e75dc: 0f 11 04 0e                 	movups	%xmm0, (%rsi,%rcx)
1454e75e0: 48 ff c0                    	incq	%rax
1454e75e3: 48 89 42 08                 	movq	%rax, 0x8(%rdx)
