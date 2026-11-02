
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b7714: 48 89 d3                    	movq	%rdx, %rbx
1454b7717: 48 89 cf                    	movq	%rcx, %rdi
1454b771a: 48 8b 32                    	movq	(%rdx), %rsi
1454b771d: 48 8b 81 e8 00 00 00        	movq	0xe8(%rcx), %rax
1454b7724: 4c 8b b1 f0 00 00 00        	movq	0xf0(%rcx), %r14
1454b772b: 44 8b 7e 40                 	movl	0x40(%rsi), %r15d
1454b772f: 49 b8 f0 ff ff ff ff ff ff 1f       	movabsq	$0x1ffffffffffffff0, %r8 # imm = 0x1FFFFFFFFFFFFFF0
1454b7739: 4d 21 f0                    	andq	%r14, %r8
1454b773c: 4a 8d 0c 80                 	leaq	(%rax,%r8,4), %rcx
1454b7740: 44 89 f2                    	movl	%r14d, %edx
1454b7743: 83 e2 0f                    	andl	$0xf, %edx
1454b7746: 66 41 0f 6e c7              	movd	%r15d, %xmm0
1454b774b: 66 0f 70 c0 00              	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1454b7750: 45 31 c9                    	xorl	%r9d, %r9d
1454b7753: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454b7760: 4d 39 c8                    	cmpq	%r9, %r8
1454b7763: 74 47                       	je	0x1454b77ac <.text+0x54b67ac>
1454b7765: f3 42 0f 6f 0c 88           	movdqu	(%rax,%r9,4), %xmm1
1454b776b: f3 42 0f 6f 54 88 10        	movdqu	0x10(%rax,%r9,4), %xmm2
1454b7772: f3 42 0f 6f 5c 88 20        	movdqu	0x20(%rax,%r9,4), %xmm3
1454b7779: f3 42 0f 6f 64 88 30        	movdqu	0x30(%rax,%r9,4), %xmm4
1454b7780: 66 0f 76 d0                 	pcmpeqd	%xmm0, %xmm2
1454b7784: 66 0f 76 c8                 	pcmpeqd	%xmm0, %xmm1
1454b7788: 66 0f 6b ca                 	packssdw	%xmm2, %xmm1
1454b778c: 66 0f 76 d8                 	pcmpeqd	%xmm0, %xmm3
1454b7790: 66 0f 76 e0                 	pcmpeqd	%xmm0, %xmm4
1454b7794: 66 0f 6b dc                 	packssdw	%xmm4, %xmm3
1454b7798: 66 0f 63 cb                 	packsswb	%xmm3, %xmm1
1454b779c: 66 44 0f d7 d1              	pmovmskb	%xmm1, %r10d
1454b77a1: 49 83 c1 10                 	addq	$0x10, %r9
1454b77a5: 45 85 d2                    	testl	%r10d, %r10d
1454b77a8: 74 b6                       	je	0x1454b7760 <.text+0x54b6760>
1454b77aa: eb 4f                       	jmp	0x1454b77fb <.text+0x54b67fb>
1454b77ac: c1 e2 02                    	shll	$0x2, %edx
1454b77af: 45 31 c0                    	xorl	%r8d, %r8d
1454b77b2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454b77c0: 4c 39 c2                    	cmpq	%r8, %rdx
1454b77c3: 74 0c                       	je	0x1454b77d1 <.text+0x54b67d1>
1454b77c5: 46 39 3c 01                 	cmpl	%r15d, (%rcx,%r8)
1454b77c9: 4d 8d 40 04                 	leaq	0x4(%r8), %r8
1454b77cd: 75 f1                       	jne	0x1454b77c0 <.text+0x54b67c0>
1454b77cf: eb 2a                       	jmp	0x1454b77fb <.text+0x54b67fb>
1454b77d1: 4c 3b b7 e0 00 00 00        	cmpq	0xe0(%rdi), %r14
1454b77d8: 75 13                       	jne	0x1454b77ed <.text+0x54b67ed>
1454b77da: 48 8d 8f e0 00 00 00        	leaq	0xe0(%rdi), %rcx
1454b77e1: e8 4a 7c 25 00              	callq	0x14570f430 <.text+0x570e430>
1454b77e6: 48 8b 87 e8 00 00 00        	movq	0xe8(%rdi), %rax
1454b77ed: 46 89 3c b0                 	movl	%r15d, (%rax,%r14,4)
1454b77f1: 49 ff c6                    	incq	%r14
1454b77f4: 4c 89 b7 f0 00 00 00        	movq	%r14, 0xf0(%rdi)
1454b77fb: f3 0f 10 87 50 04 00 00     	movss	0x450(%rdi), %xmm0
1454b7803: f3 0f 10 b7 54 04 00 00     	movss	0x454(%rdi), %xmm6
1454b780b: f3 0f 10 bf 78 04 00 00     	movss	0x478(%rdi), %xmm7
1454b7813: 8b 87 84 04 00 00           	movl	0x484(%rdi), %eax
1454b7819: 8b 8f 94 04 00 00           	movl	0x494(%rdi), %ecx
1454b781f: f3 44 0f 10 8f 98 04 00 00  	movss	0x498(%rdi), %xmm9
1454b7828: 8b 97 e8 03 00 00           	movl	0x3e8(%rdi), %edx
1454b782e: 89 55 10                    	movl	%edx, 0x10(%rbp)
1454b7831: 48 8b 97 e0 03 00 00        	movq	0x3e0(%rdi), %rdx
1454b7838: 48 89 55 08                 	movq	%rdx, 0x8(%rbp)
1454b783c: f3 0f 10 4e 44              	movss	0x44(%rsi), %xmm1
1454b7841: f3 44 0f 10 53 08           	movss	0x8(%rbx), %xmm10
1454b7847: f3 44 0f 10 43 28           	movss	0x28(%rbx), %xmm8
1454b784d: 0f b6 56 75                 	movzbl	0x75(%rsi), %edx
1454b7851: 44 8d 42 fe                 	leal	-0x2(%rdx), %r8d
1454b7855: 41 80 f8 06                 	cmpb	$0x6, %r8b
1454b7859: 77 13                       	ja	0x1454b786e <.text+0x54b686e>
1454b785b: 45 0f b6 c0                 	movzbl	%r8b, %r8d
1454b785f: 4c 8d 0d 9e f8 5e 01        	leaq	0x15ef89e(%rip), %r9    # 0x146aa7104
1454b7866: f3 43 0f 10 14 81           	movss	(%r9,%r8,4), %xmm2
1454b786c: eb 08                       	jmp	0x1454b7876 <.text+0x54b6876>
1454b786e: f3 0f 10 15 5a 91 3e 00     	movss	0x3e915a(%rip), %xmm2   # 0x1458a09d0
1454b7876: 4c 8d b7 e0 03 00 00        	leaq	0x3e0(%rdi), %r14
1454b787d: f3 0f 10 5b 1c              	movss	0x1c(%rbx), %xmm3
1454b7882: f3 0f 59 d8                 	mulss	%xmm0, %xmm3
1454b7886: 66 0f ef e4                 	pxor	%xmm4, %xmm4
1454b788a: f3 0f c2 e1 01              	cmpltss	%xmm1, %xmm4
1454b788f: 0f 54 e3                    	andps	%xmm3, %xmm4
1454b7892: f3 0f 59 0d ba 92 3e 00     	mulss	0x3e92ba(%rip), %xmm1   # 0x1458a0b54
1454b789a: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
1454b789f: f3 41 0f 59 ca              	mulss	%xmm10, %xmm1
1454b78a4: f3 0f 59 ca                 	mulss	%xmm2, %xmm1
1454b78a8: f3 0f 58 cc                 	addss	%xmm4, %xmm1
1454b78ac: f3 0f 59 f1                 	mulss	%xmm1, %xmm6
1454b78b0: 89 d2                       	movl	%edx, %edx
1454b78b2: 4c 8d 05 43 fc 5e 01        	leaq	0x15efc43(%rip), %r8    # 0x146aa74fc
1454b78b9: 49 63 14 90                 	movslq	(%r8,%rdx,4), %rdx
1454b78bd: 4c 01 c2                    	addq	%r8, %rdx
1454b78c0: 48 89 b5 98 00 00 00        	movq	%rsi, 0x98(%rbp)
1454b78c7: ff e2                       	jmpq	*%rdx
