
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549aab7: 41 80 7f 78 00              	cmpb	$0x0, 0x78(%r15)
14549aabc: 0f 84 68 04 00 00           	je	0x14549af2a <.text+0x5499f2a>
14549aac2: f2 45 0f 10 4f 7c           	movsd	0x7c(%r15), %xmm9
14549aac8: f3 45 0f 10 b7 84 00 00 00  	movss	0x84(%r15), %xmm14
14549aad1: 44 0f 2e c0                 	ucomiss	%xmm0, %xmm8
14549aad5: 0f 82 3a 02 00 00           	jb	0x14549ad15 <.text+0x5499d15>
14549aadb: f3 41 0f 10 87 04 01 00 00  	movss	0x104(%r15), %xmm0
14549aae4: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
14549aae8: 0f 82 27 02 00 00           	jb	0x14549ad15 <.text+0x5499d15>
14549aaee: f3 41 0f 10 87 00 01 00 00  	movss	0x100(%r15), %xmm0
14549aaf7: f3 41 0f 11 87 30 01 00 00  	movss	%xmm0, 0x130(%r15)
14549ab00: 41 0f 28 cf                 	movaps	%xmm15, %xmm1
14549ab04: f3 41 0f 5c 8f a0 00 00 00  	subss	0xa0(%r15), %xmm1
14549ab0d: f3 41 0f 10 97 f8 00 00 00  	movss	0xf8(%r15), %xmm2
14549ab16: 0f 28 c6                    	movaps	%xmm6, %xmm0
14549ab19: f3 41 0f c2 87 a4 00 00 00 01       	cmpltss	0xa4(%r15), %xmm0
14549ab23: f3 0f 59 ca                 	mulss	%xmm2, %xmm1
14549ab27: 0f 54 c8                    	andps	%xmm0, %xmm1
14549ab2a: 0f 55 c2                    	andnps	%xmm2, %xmm0
14549ab2d: 0f 56 c1                    	orps	%xmm1, %xmm0
14549ab30: 44 0f 28 e8                 	movaps	%xmm0, %xmm13
14549ab34: f3 44 0f 59 2d 17 60 40 00  	mulss	0x406017(%rip), %xmm13  # 0x1458a0b54
14549ab3d: 41 f6 47 38 01              	testb	$0x1, 0x38(%r15)
14549ab42: 0f 84 26 01 00 00           	je	0x14549ac6e <.text+0x5499c6e>
14549ab48: 49 83 7f 18 ff              	cmpq	$-0x1, 0x18(%r15)
14549ab4d: 0f 84 2a 01 00 00           	je	0x14549ac7d <.text+0x5499c7d>
14549ab53: 49 8b bf 88 00 00 00        	movq	0x88(%r15), %rdi
14549ab5a: 48 8b b5 e0 00 00 00        	movq	0xe0(%rbp), %rsi
14549ab61: 48 3b b5 d0 00 00 00        	cmpq	0xd0(%rbp), %rsi
14549ab68: 0f 84 2a 01 00 00           	je	0x14549ac98 <.text+0x5499c98>
14549ab6e: e9 71 01 00 00              	jmp	0x14549ace4 <.text+0x5499ce4>
14549ab73: 45 0f 28 d6                 	movaps	%xmm14, %xmm10
14549ab77: eb 0b                       	jmp	0x14549ab84 <.text+0x5499b84>
14549ab79: 45 0f 28 d6                 	movaps	%xmm14, %xmm10
14549ab7d: 4c 8b bd 50 02 00 00        	movq	0x250(%rbp), %r15
14549ab84: 66 45 0f 13 a7 0c 01 00 00  	movlpd	%xmm12, 0x10c(%r15)
14549ab8d: f3 45 0f 11 b7 14 01 00 00  	movss	%xmm14, 0x114(%r15)
14549ab96: 66 45 0f 13 8f 18 01 00 00  	movlpd	%xmm9, 0x118(%r15)
14549ab9f: f3 45 0f 11 97 20 01 00 00  	movss	%xmm10, 0x120(%r15)
14549aba8: 0f 28 45 c0                 	movaps	-0x40(%rbp), %xmm0
14549abac: 41 0f 13 87 24 01 00 00     	movlps	%xmm0, 0x124(%r15)
14549abb4: f3 0f 10 45 e4              	movss	-0x1c(%rbp), %xmm0
14549abb9: f3 41 0f 11 87 2c 01 00 00  	movss	%xmm0, 0x12c(%r15)
14549abc2: 49 8b bf 88 00 00 00        	movq	0x88(%r15), %rdi
14549abc9: 48 8b b5 f8 01 00 00        	movq	0x1f8(%rbp), %rsi
14549abd0: 48 3b b5 e8 01 00 00        	cmpq	0x1e8(%rbp), %rsi
14549abd7: 75 4c                       	jne	0x14549ac25 <.text+0x5499c25>
14549abd9: c6 85 77 02 00 00 01        	movb	$0x1, 0x277(%rbp)
14549abe0: c6 85 76 02 00 00 01        	movb	$0x1, 0x276(%rbp)
14549abe7: c6 85 75 02 00 00 01        	movb	$0x1, 0x275(%rbp)
14549abee: c6 85 74 02 00 00 01        	movb	$0x1, 0x274(%rbp)
14549abf5: c6 85 73 02 00 00 01        	movb	$0x1, 0x273(%rbp)
14549abfc: c6 85 72 02 00 00 01        	movb	$0x1, 0x272(%rbp)
14549ac03: c6 85 71 02 00 00 01        	movb	$0x1, 0x271(%rbp)
14549ac0a: c6 85 70 02 00 00 01        	movb	$0x1, 0x270(%rbp)
14549ac11: c6 85 6f 02 00 00 01        	movb	$0x1, 0x26f(%rbp)
14549ac18: 48 8d 8d e8 01 00 00        	leaq	0x1e8(%rbp), %rcx
14549ac1f: e8 ec 0c 27 00              	callq	0x14570b910 <.text+0x570a910>
14549ac24: 90                          	nop
14549ac25: 48 8b 85 f0 01 00 00        	movq	0x1f0(%rbp), %rax
14549ac2c: 48 8d 0c b6                 	leaq	(%rsi,%rsi,4), %rcx
14549ac30: 48 89 3c c8                 	movq	%rdi, (%rax,%rcx,8)
14549ac34: 66 44 0f 13 64 c8 08        	movlpd	%xmm12, 0x8(%rax,%rcx,8)
14549ac3b: f3 44 0f 11 74 c8 10        	movss	%xmm14, 0x10(%rax,%rcx,8)
14549ac42: 66 44 0f 13 4c c8 14        	movlpd	%xmm9, 0x14(%rax,%rcx,8)
14549ac49: f3 44 0f 11 54 c8 1c        	movss	%xmm10, 0x1c(%rax,%rcx,8)
14549ac50: c7 44 c8 20 cd cc 4c 3f     	movl	$0x3f4ccccd, 0x20(%rax,%rcx,8) # imm = 0x3F4CCCCD
14549ac58: 48 ff c6                    	incq	%rsi
14549ac5b: 48 89 b5 f8 01 00 00        	movq	%rsi, 0x1f8(%rbp)
14549ac62: 48 8b b5 60 02 00 00        	movq	0x260(%rbp), %rsi
14549ac69: e9 de f2 ff ff              	jmp	0x145499f4c <.text+0x5498f4c>
14549ac6e: 44 0f 28 e8                 	movaps	%xmm0, %xmm13
14549ac72: 49 83 7f 18 ff              	cmpq	$-0x1, 0x18(%r15)
14549ac77: 0f 85 d6 fe ff ff           	jne	0x14549ab53 <.text+0x5499b53>
14549ac7d: 44 0f 28 e8                 	movaps	%xmm0, %xmm13
14549ac81: 49 8b bf 88 00 00 00        	movq	0x88(%r15), %rdi
14549ac88: 48 8b b5 e0 00 00 00        	movq	0xe0(%rbp), %rsi
14549ac8f: 48 3b b5 d0 00 00 00        	cmpq	0xd0(%rbp), %rsi
14549ac96: 75 4c                       	jne	0x14549ace4 <.text+0x5499ce4>
14549ac98: c6 85 77 02 00 00 01        	movb	$0x1, 0x277(%rbp)
14549ac9f: c6 85 76 02 00 00 01        	movb	$0x1, 0x276(%rbp)
14549aca6: c6 85 75 02 00 00 01        	movb	$0x1, 0x275(%rbp)
14549acad: c6 85 74 02 00 00 01        	movb	$0x1, 0x274(%rbp)
14549acb4: c6 85 73 02 00 00 01        	movb	$0x1, 0x273(%rbp)
14549acbb: c6 85 72 02 00 00 01        	movb	$0x1, 0x272(%rbp)
14549acc2: c6 85 71 02 00 00 01        	movb	$0x1, 0x271(%rbp)
14549acc9: c6 85 70 02 00 00 01        	movb	$0x1, 0x270(%rbp)
14549acd0: c6 85 6f 02 00 00 01        	movb	$0x1, 0x26f(%rbp)
14549acd7: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
14549acde: e8 0d 0d 27 00              	callq	0x14570b9f0 <.text+0x570a9f0>
14549ace3: 90                          	nop
14549ace4: 48 8b 85 d8 00 00 00        	movq	0xd8(%rbp), %rax
14549aceb: 48 89 f1                    	movq	%rsi, %rcx
14549acee: 48 c1 e1 04                 	shlq	$0x4, %rcx
14549acf2: f3 44 0f 11 2c 08           	movss	%xmm13, (%rax,%rcx)
14549acf8: 48 89 7c 08 08              	movq	%rdi, 0x8(%rax,%rcx)
14549acfd: 48 ff c6                    	incq	%rsi
14549ad00: 48 89 b5 e0 00 00 00        	movq	%rsi, 0xe0(%rbp)
14549ad07: 48 8b b5 60 02 00 00        	movq	0x260(%rbp), %rsi
14549ad0e: 4c 8b bd 50 02 00 00        	movq	0x250(%rbp), %r15
