
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458ea220: 55                          	pushq	%rbp
1458ea221: 41 57                       	pushq	%r15
1458ea223: 41 56                       	pushq	%r14
1458ea225: 41 55                       	pushq	%r13
1458ea227: 41 54                       	pushq	%r12
1458ea229: 56                          	pushq	%rsi
1458ea22a: 57                          	pushq	%rdi
1458ea22b: 53                          	pushq	%rbx
1458ea22c: 48 81 ec 78 04 00 00        	subq	$0x478, %rsp            # imm = 0x478
1458ea233: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1458ea23b: 44 0f 29 8d e0 03 00 00     	movaps	%xmm9, 0x3e0(%rbp)
1458ea243: 44 0f 29 85 d0 03 00 00     	movaps	%xmm8, 0x3d0(%rbp)
1458ea24b: 0f 29 bd c0 03 00 00        	movaps	%xmm7, 0x3c0(%rbp)
1458ea252: 0f 29 b5 b0 03 00 00        	movaps	%xmm6, 0x3b0(%rbp)
1458ea259: 48 c7 85 a8 03 00 00 fe ff ff ff    	movq	$-0x2, 0x3a8(%rbp)
1458ea264: 48 89 d7                    	movq	%rdx, %rdi
1458ea267: 48 89 8d e0 02 00 00        	movq	%rcx, 0x2e0(%rbp)
1458ea26e: 48 8b 9a 90 02 00 00        	movq	0x290(%rdx), %rbx
1458ea275: 4c 8b b2 98 02 00 00        	movq	0x298(%rdx), %r14
1458ea27c: 48 8b b2 88 09 00 00        	movq	0x988(%rdx), %rsi
1458ea283: 48 83 fe 04                 	cmpq	$0x4, %rsi
1458ea287: 77 52                       	ja	0x1458ea2db <.text+0x58e92db>
1458ea289: 48 89 d9                    	movq	%rbx, %rcx
1458ea28c: 4c 89 f2                    	movq	%r14, %rdx
1458ea28f: e8 1c b1 f8 ff              	callq	0x1458753b0 <.text+0x58743b0>
1458ea294: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1458ea29b: 48 8d 0d ae f1 2b 01        	leaq	0x12bf1ae(%rip), %rcx   # 0x146ba9450
1458ea2a2: 48 8b 84 08 88 00 00 00     	movq	0x88(%rax,%rcx), %rax
1458ea2aa: 48 6b ce 58                 	imulq	$0x58, %rsi, %rcx
1458ea2ae: f3 0f 10 44 08 40           	movss	0x40(%rax,%rcx), %xmm0
1458ea2b4: f3 0f 59 05 c4 52 4d 00     	mulss	0x4d52c4(%rip), %xmm0   # 0x145dbf580
1458ea2bc: 4c 8d 3c 08                 	leaq	(%rax,%rcx), %r15
1458ea2c0: f3 0f 10 bf ec 09 00 00     	movss	0x9ec(%rdi), %xmm7
1458ea2c8: f3 0f 5c c7                 	subss	%xmm7, %xmm0
1458ea2cc: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458ea2cf: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1458ea2d2: 0f 97 c0                    	seta	%al
1458ea2d5: 84 c0                       	testb	%al, %al
1458ea2d7: 74 2c                       	je	0x1458ea305 <.text+0x58e9305>
1458ea2d9: eb 32                       	jmp	0x1458ea30d <.text+0x58e930d>
1458ea2db: f3 0f 10 bf ec 09 00 00     	movss	0x9ec(%rdi), %xmm7
1458ea2e3: f3 0f 10 87 3c 0a 00 00     	movss	0xa3c(%rdi), %xmm0
1458ea2eb: f3 0f 5c c7                 	subss	%xmm7, %xmm0
1458ea2ef: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458ea2f2: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1458ea2f5: 0f 97 c0                    	seta	%al
1458ea2f8: 22 87 64 0a 00 00           	andb	0xa64(%rdi), %al
1458ea2fe: 45 31 ff                    	xorl	%r15d, %r15d
1458ea301: 84 c0                       	testb	%al, %al
1458ea303: 75 08                       	jne	0x1458ea30d <.text+0x58e930d>
1458ea305: f3 0f 10 05 07 9a 48 00     	movss	0x489a07(%rip), %xmm0   # 0x145d73d14
1458ea30d: f3 0f 11 85 6c 03 00 00     	movss	%xmm0, 0x36c(%rbp)
1458ea315: c7 85 94 03 00 00 00 00 00 00       	movl	$0x0, 0x394(%rbp)
1458ea31f: c7 85 90 03 00 00 00 00 00 00       	movl	$0x0, 0x390(%rbp)
1458ea329: 48 8b 87 60 05 00 00        	movq	0x560(%rdi), %rax
1458ea330: 48 8b 8f 68 05 00 00        	movq	0x568(%rdi), %rcx
1458ea337: 48 85 c9                    	testq	%rcx, %rcx
1458ea33a: 0f 84 e0 00 00 00           	je	0x1458ea420 <.text+0x58e9420>
1458ea340: 4c 69 c1 60 01 00 00        	imulq	$0x160, %rcx, %r8       # imm = 0x160
1458ea347: 49 01 c0                    	addq	%rax, %r8
1458ea34a: 31 d2                       	xorl	%edx, %edx
1458ea34c: 4c 8d 1d b6 e7 58 01        	leaq	0x158e7b6(%rip), %r11   # 0x146e78b09
1458ea353: 4c 8d 15 b8 e7 58 01        	leaq	0x158e7b8(%rip), %r10   # 0x146e78b12
1458ea35a: 45 31 c9                    	xorl	%r9d, %r9d
1458ea35d: 49 89 c4                    	movq	%rax, %r12
1458ea360: 41 83 7c 24 68 00           	cmpl	$0x0, 0x68(%r12)
1458ea366: 74 11                       	je	0x1458ea379 <.text+0x58e9379>
1458ea368: 49 81 c4 60 01 00 00        	addq	$0x160, %r12            # imm = 0x160
1458ea36f: 4d 39 c4                    	cmpq	%r8, %r12
1458ea372: 75 ec                       	jne	0x1458ea360 <.text+0x58e9360>
1458ea374: e9 8d 00 00 00              	jmp	0x1458ea406 <.text+0x58e9406>
1458ea379: 49 83 7c 24 18 ff           	cmpq	$-0x1, 0x18(%r12)
1458ea37f: 74 56                       	je	0x1458ea3d7 <.text+0x58e93d7>
1458ea381: 49 8b 74 24 30              	movq	0x30(%r12), %rsi
1458ea386: 45 31 ed                    	xorl	%r13d, %r13d
1458ea389: 80 7e 54 00                 	cmpb	$0x0, 0x54(%rsi)
1458ea38d: 4c 89 d6                    	movq	%r10, %rsi
1458ea390: 74 5e                       	je	0x1458ea3f0 <.text+0x58e93f0>
1458ea392: 4c 89 bd 98 03 00 00        	movq	%r15, 0x398(%rbp)
1458ea399: 4d 89 d7                    	movq	%r10, %r15
1458ea39c: 4d 89 f2                    	movq	%r14, %r10
1458ea39f: 49 89 de                    	movq	%rbx, %r14
1458ea3a2: 4c 89 db                    	movq	%r11, %rbx
1458ea3a5: 44 8b 1e                    	movl	(%rsi), %r11d
1458ea3a8: 41 bd 65 6c 69 74           	movl	$0x74696c65, %r13d      # imm = 0x74696C65
1458ea3ae: 45 31 eb                    	xorl	%r13d, %r11d
1458ea3b1: 0f b6 76 04                 	movzbl	0x4(%rsi), %esi
1458ea3b5: 83 f6 65                    	xorl	$0x65, %esi
1458ea3b8: 45 31 ed                    	xorl	%r13d, %r13d
1458ea3bb: 44 09 de                    	orl	%r11d, %esi
1458ea3be: 49 89 db                    	movq	%rbx, %r11
1458ea3c1: 4c 89 f3                    	movq	%r14, %rbx
1458ea3c4: 4d 89 d6                    	movq	%r10, %r14
1458ea3c7: 4d 89 fa                    	movq	%r15, %r10
1458ea3ca: 4c 8b bd 98 03 00 00        	movq	0x398(%rbp), %r15
1458ea3d1: 41 0f 94 c5                 	sete	%r13b
1458ea3d5: eb 19                       	jmp	0x1458ea3f0 <.text+0x58e93f0>
1458ea3d7: 45 31 ed                    	xorl	%r13d, %r13d
1458ea3da: 49 83 7c 24 40 ff           	cmpq	$-0x1, 0x40(%r12)
1458ea3e0: 75 0e                       	jne	0x1458ea3f0 <.text+0x58e93f0>
1458ea3e2: 41 80 bc 24 5c 01 00 00 01  	cmpb	$0x1, 0x15c(%r12)
1458ea3eb: 4c 89 de                    	movq	%r11, %rsi
1458ea3ee: 74 a2                       	je	0x1458ea392 <.text+0x58e9392>
1458ea3f0: 41 ff c1                    	incl	%r9d
1458ea3f3: 49 81 c4 60 01 00 00        	addq	$0x160, %r12            # imm = 0x160
1458ea3fa: 44 01 ea                    	addl	%r13d, %edx
1458ea3fd: 4d 39 c4                    	cmpq	%r8, %r12
1458ea400: 0f 85 5a ff ff ff           	jne	0x1458ea360 <.text+0x58e9360>
1458ea406: 44 89 8d 94 03 00 00        	movl	%r9d, 0x394(%rbp)
1458ea40d: 89 95 90 03 00 00           	movl	%edx, 0x390(%rbp)
1458ea413: 48 83 f9 01                 	cmpq	$0x1, %rcx
1458ea417: 75 0f                       	jne	0x1458ea428 <.text+0x58e9428>
1458ea419: 31 d2                       	xorl	%edx, %edx
1458ea41b: 45 31 c0                    	xorl	%r8d, %r8d
1458ea41e: eb 72                       	jmp	0x1458ea492 <.text+0x58e9492>
1458ea420: 45 31 c0                    	xorl	%r8d, %r8d
1458ea423: e9 90 00 00 00              	jmp	0x1458ea4b8 <.text+0x58e94b8>
1458ea428: 49 89 c9                    	movq	%rcx, %r9
1458ea42b: 49 83 e1 fe                 	andq	$-0x2, %r9
1458ea42f: 4c 8d 90 c8 01 00 00        	leaq	0x1c8(%rax), %r10
1458ea436: 31 d2                       	xorl	%edx, %edx
1458ea438: 45 31 c0                    	xorl	%r8d, %r8d
1458ea43b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1458ea440: 41 83 ba a0 fe ff ff 00     	cmpl	$0x0, -0x160(%r10)
1458ea448: 41 0f 94 c3                 	sete	%r11b
1458ea44c: 49 83 ba 50 fe ff ff ff     	cmpq	$-0x1, -0x1b0(%r10)
1458ea454: 40 0f 95 c6                 	setne	%sil
1458ea458: 44 20 de                    	andb	%r11b, %sil
1458ea45b: 44 0f b6 de                 	movzbl	%sil, %r11d
1458ea45f: 4d 01 c3                    	addq	%r8, %r11
1458ea462: 41 83 3a 00                 	cmpl	$0x0, (%r10)
1458ea466: 41 0f 94 c0                 	sete	%r8b
1458ea46a: 49 83 7a b0 ff              	cmpq	$-0x1, -0x50(%r10)
1458ea46f: 40 0f 95 c6                 	setne	%sil
1458ea473: 44 20 c6                    	andb	%r8b, %sil
1458ea476: 44 0f b6 c6                 	movzbl	%sil, %r8d
1458ea47a: 4d 01 d8                    	addq	%r11, %r8
1458ea47d: 48 83 c2 02                 	addq	$0x2, %rdx
1458ea481: 49 81 c2 c0 02 00 00        	addq	$0x2c0, %r10            # imm = 0x2C0
1458ea488: 49 39 d1                    	cmpq	%rdx, %r9
1458ea48b: 75 b3                       	jne	0x1458ea440 <.text+0x58e9440>
1458ea48d: f6 c1 01                    	testb	$0x1, %cl
1458ea490: 74 26                       	je	0x1458ea4b8 <.text+0x58e94b8>
1458ea492: 48 69 d2 60 01 00 00        	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1458ea499: 83 7c 10 68 00              	cmpl	$0x0, 0x68(%rax,%rdx)
1458ea49e: 4d 89 c1                    	movq	%r8, %r9
1458ea4a1: 41 0f 94 c0                 	sete	%r8b
1458ea4a5: 48 83 7c 10 18 ff           	cmpq	$-0x1, 0x18(%rax,%rdx)
1458ea4ab: 0f 95 c2                    	setne	%dl
1458ea4ae: 44 20 c2                    	andb	%r8b, %dl
1458ea4b1: 44 0f b6 c2                 	movzbl	%dl, %r8d
1458ea4b5: 4d 01 c8                    	addq	%r9, %r8
1458ea4b8: 4c 89 85 d8 02 00 00        	movq	%r8, 0x2d8(%rbp)
1458ea4bf: 4c 8b a7 28 06 00 00        	movq	0x628(%rdi), %r12
1458ea4c6: 4d 85 e4                    	testq	%r12, %r12
1458ea4c9: 74 1b                       	je	0x1458ea4e6 <.text+0x58e94e6>
1458ea4cb: 4c 8b 8f 20 06 00 00        	movq	0x620(%rdi), %r9
1458ea4d2: 45 89 e0                    	movl	%r12d, %r8d
1458ea4d5: 41 83 e0 03                 	andl	$0x3, %r8d
1458ea4d9: 49 83 fc 04                 	cmpq	$0x4, %r12
1458ea4dd: 73 0b                       	jae	0x1458ea4ea <.text+0x58e94ea>
1458ea4df: 45 31 d2                    	xorl	%r10d, %r10d
1458ea4e2: 31 d2                       	xorl	%edx, %edx
1458ea4e4: eb 3e                       	jmp	0x1458ea524 <.text+0x58e9524>
1458ea4e6: 31 d2                       	xorl	%edx, %edx
1458ea4e8: eb 63                       	jmp	0x1458ea54d <.text+0x58e954d>
1458ea4ea: 4d 89 e3                    	movq	%r12, %r11
1458ea4ed: 49 83 e3 fc                 	andq	$-0x4, %r11
1458ea4f1: 45 31 d2                    	xorl	%r10d, %r10d
1458ea4f4: 4c 89 ce                    	movq	%r9, %rsi
1458ea4f7: 31 d2                       	xorl	%edx, %edx
1458ea4f9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1458ea500: 48 03 16                    	addq	(%rsi), %rdx
1458ea503: 48 03 56 28                 	addq	0x28(%rsi), %rdx
1458ea507: 48 03 56 50                 	addq	0x50(%rsi), %rdx
1458ea50b: 48 03 56 78                 	addq	0x78(%rsi), %rdx
1458ea50f: 49 83 c2 04                 	addq	$0x4, %r10
1458ea513: 48 81 c6 a0 00 00 00        	addq	$0xa0, %rsi
1458ea51a: 4d 39 d3                    	cmpq	%r10, %r11
1458ea51d: 75 e1                       	jne	0x1458ea500 <.text+0x58e9500>
1458ea51f: 4d 85 c0                    	testq	%r8, %r8
1458ea522: 74 29                       	je	0x1458ea54d <.text+0x58e954d>
1458ea524: 4f 8d 14 92                 	leaq	(%r10,%r10,4), %r10
1458ea528: 4f 8d 0c d1                 	leaq	(%r9,%r10,8), %r9
1458ea52c: 41 c1 e0 03                 	shll	$0x3, %r8d
1458ea530: 4f 8d 04 80                 	leaq	(%r8,%r8,4), %r8
1458ea534: 45 31 d2                    	xorl	%r10d, %r10d
1458ea537: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1458ea540: 4b 03 14 11                 	addq	(%r9,%r10), %rdx
1458ea544: 49 83 c2 28                 	addq	$0x28, %r10
1458ea548: 4d 39 d0                    	cmpq	%r10, %r8
1458ea54b: 75 f3                       	jne	0x1458ea540 <.text+0x58e9540>
1458ea54d: 48 89 95 d0 02 00 00        	movq	%rdx, 0x2d0(%rbp)
1458ea554: 48 85 c9                    	testq	%rcx, %rcx
1458ea557: 74 0d                       	je	0x1458ea566 <.text+0x58e9566>
1458ea559: 48 83 f9 01                 	cmpq	$0x1, %rcx
1458ea55d: 75 0e                       	jne	0x1458ea56d <.text+0x58e956d>
1458ea55f: 45 31 c0                    	xorl	%r8d, %r8d
1458ea562: 31 d2                       	xorl	%edx, %edx
1458ea564: eb 7b                       	jmp	0x1458ea5e1 <.text+0x58e95e1>
1458ea566: 31 d2                       	xorl	%edx, %edx
1458ea568: e9 9e 00 00 00              	jmp	0x1458ea60b <.text+0x58e960b>
1458ea56d: 49 89 c9                    	movq	%rcx, %r9
1458ea570: 49 83 e1 fe                 	andq	$-0x2, %r9
1458ea574: 4c 8d 90 c8 01 00 00        	leaq	0x1c8(%rax), %r10
1458ea57b: 45 31 db                    	xorl	%r11d, %r11d
1458ea57e: 45 31 c0                    	xorl	%r8d, %r8d
1458ea581: 31 d2                       	xorl	%edx, %edx
1458ea583: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1458ea590: 49 83 ba 78 fe ff ff ff     	cmpq	$-0x1, -0x188(%r10)
1458ea598: 41 0f b6 b2 98 fe ff ff     	movzbl	-0x168(%r10), %esi
1458ea5a0: 49 0f 44 f3                 	cmoveq	%r11, %rsi
1458ea5a4: 41 80 ba a0 fe ff ff 00     	cmpb	$0x0, -0x160(%r10)
1458ea5ac: 49 0f 45 f3                 	cmovneq	%r11, %rsi
1458ea5b0: 48 01 d6                    	addq	%rdx, %rsi
1458ea5b3: 49 83 7a d8 ff              	cmpq	$-0x1, -0x28(%r10)
1458ea5b8: 41 0f b6 52 f8              	movzbl	-0x8(%r10), %edx
1458ea5bd: 49 0f 44 d3                 	cmoveq	%r11, %rdx
1458ea5c1: 41 80 3a 00                 	cmpb	$0x0, (%r10)
1458ea5c5: 49 0f 45 d3                 	cmovneq	%r11, %rdx
1458ea5c9: 48 01 f2                    	addq	%rsi, %rdx
1458ea5cc: 49 83 c0 02                 	addq	$0x2, %r8
1458ea5d0: 49 81 c2 c0 02 00 00        	addq	$0x2c0, %r10            # imm = 0x2C0
1458ea5d7: 4d 39 c1                    	cmpq	%r8, %r9
1458ea5da: 75 b4                       	jne	0x1458ea590 <.text+0x58e9590>
1458ea5dc: f6 c1 01                    	testb	$0x1, %cl
1458ea5df: 74 2a                       	je	0x1458ea60b <.text+0x58e960b>
1458ea5e1: 48 89 d1                    	movq	%rdx, %rcx
1458ea5e4: 4d 69 c0 60 01 00 00        	imulq	$0x160, %r8, %r8        # imm = 0x160
1458ea5eb: 45 31 c9                    	xorl	%r9d, %r9d
1458ea5ee: 4a 83 7c 00 40 ff           	cmpq	$-0x1, 0x40(%rax,%r8)
1458ea5f4: 42 0f b6 54 00 60           	movzbl	0x60(%rax,%r8), %edx
1458ea5fa: 49 0f 44 d1                 	cmoveq	%r9, %rdx
1458ea5fe: 42 80 7c 00 68 00           	cmpb	$0x0, 0x68(%rax,%r8)
1458ea604: 49 0f 45 d1                 	cmovneq	%r9, %rdx
1458ea608: 48 01 ca                    	addq	%rcx, %rdx
1458ea60b: 48 89 95 c8 02 00 00        	movq	%rdx, 0x2c8(%rbp)
1458ea612: 48 8b 97 70 06 00 00        	movq	0x670(%rdi), %rdx
1458ea619: 48 85 d2                    	testq	%rdx, %rdx
1458ea61c: 74 1f                       	je	0x1458ea63d <.text+0x58e963d>
1458ea61e: 48 8b 8f 68 06 00 00        	movq	0x668(%rdi), %rcx
1458ea625: 89 d0                       	movl	%edx, %eax
1458ea627: 83 e0 03                    	andl	$0x3, %eax
1458ea62a: 48 83 fa 04                 	cmpq	$0x4, %rdx
1458ea62e: 73 1a                       	jae	0x1458ea64a <.text+0x58e964a>
1458ea630: f2 0f 10 05 40 1f 4c 00     	movsd	0x4c1f40(%rip), %xmm0   # 0x145dac578
1458ea638: 45 31 c0                    	xorl	%r8d, %r8d
1458ea63b: eb 55                       	jmp	0x1458ea692 <.text+0x58e9692>
1458ea63d: f2 0f 10 35 33 1f 4c 00     	movsd	0x4c1f33(%rip), %xmm6   # 0x145dac578
1458ea645: e9 7d 00 00 00              	jmp	0x1458ea6c7 <.text+0x58e96c7>
1458ea64a: 48 83 e2 fc                 	andq	$-0x4, %rdx
1458ea64e: 4c 8d 89 30 01 00 00        	leaq	0x130(%rcx), %r9
1458ea655: f2 0f 10 05 1b 1f 4c 00     	movsd	0x4c1f1b(%rip), %xmm0   # 0x145dac578
1458ea65d: 45 31 c0                    	xorl	%r8d, %r8d
1458ea660: f2 41 0f 58 81 10 ff ff ff  	addsd	-0xf0(%r9), %xmm0
1458ea669: f2 41 0f 58 81 60 ff ff ff  	addsd	-0xa0(%r9), %xmm0
1458ea672: f2 41 0f 58 41 b0           	addsd	-0x50(%r9), %xmm0
1458ea678: f2 41 0f 58 01              	addsd	(%r9), %xmm0
1458ea67d: 49 83 c0 04                 	addq	$0x4, %r8
1458ea681: 49 81 c1 40 01 00 00        	addq	$0x140, %r9             # imm = 0x140
1458ea688: 4c 39 c2                    	cmpq	%r8, %rdx
1458ea68b: 75 d3                       	jne	0x1458ea660 <.text+0x58e9660>
1458ea68d: 48 85 c0                    	testq	%rax, %rax
1458ea690: 74 2c                       	je	0x1458ea6be <.text+0x58e96be>
1458ea692: 4b 8d 14 80                 	leaq	(%r8,%r8,4), %rdx
1458ea696: 48 c1 e2 04                 	shlq	$0x4, %rdx
1458ea69a: 48 01 d1                    	addq	%rdx, %rcx
1458ea69d: 48 83 c1 40                 	addq	$0x40, %rcx
1458ea6a1: c1 e0 04                    	shll	$0x4, %eax
1458ea6a4: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
1458ea6a8: 31 d2                       	xorl	%edx, %edx
1458ea6aa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458ea6b0: f2 0f 58 04 11              	addsd	(%rcx,%rdx), %xmm0
1458ea6b5: 48 83 c2 50                 	addq	$0x50, %rdx
1458ea6b9: 48 39 d0                    	cmpq	%rdx, %rax
1458ea6bc: 75 f2                       	jne	0x1458ea6b0 <.text+0x58e96b0>
1458ea6be: e8 18 f1 2d 00              	callq	0x145bc97db <.text+0x5bc87db>
1458ea6c3: 66 0f 28 f0                 	movapd	%xmm0, %xmm6
1458ea6c7: 48 89 d9                    	movq	%rbx, %rcx
1458ea6ca: 4c 89 f2                    	movq	%r14, %rdx
1458ea6cd: e8 de ac f8 ff              	callq	0x1458753b0 <.text+0x58743b0>
1458ea6d2: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
1458ea6d9: 48 8d 0d 70 ed 2b 01        	leaq	0x12bed70(%rip), %rcx   # 0x146ba9450
1458ea6e0: 48 8b 84 08 88 00 00 00     	movq	0x88(%rax,%rcx), %rax
1458ea6e8: 80 78 54 00                 	cmpb	$0x0, 0x54(%rax)
1458ea6ec: 75 44                       	jne	0x1458ea732 <.text+0x58e9732>
1458ea6ee: 80 b8 ac 00 00 00 00        	cmpb	$0x0, 0xac(%rax)
1458ea6f5: 74 06                       	je	0x1458ea6fd <.text+0x58e96fd>
1458ea6f7: 48 83 c0 58                 	addq	$0x58, %rax
1458ea6fb: eb 35                       	jmp	0x1458ea732 <.text+0x58e9732>
1458ea6fd: 80 b8 04 01 00 00 00        	cmpb	$0x0, 0x104(%rax)
1458ea704: 74 08                       	je	0x1458ea70e <.text+0x58e970e>
1458ea706: 48 05 b0 00 00 00           	addq	$0xb0, %rax
1458ea70c: eb 24                       	jmp	0x1458ea732 <.text+0x58e9732>
1458ea70e: 80 b8 5c 01 00 00 00        	cmpb	$0x0, 0x15c(%rax)
1458ea715: 74 08                       	je	0x1458ea71f <.text+0x58e971f>
1458ea717: 48 05 08 01 00 00           	addq	$0x108, %rax            # imm = 0x108
1458ea71d: eb 13                       	jmp	0x1458ea732 <.text+0x58e9732>
1458ea71f: 80 b8 b4 01 00 00 01        	cmpb	$0x1, 0x1b4(%rax)
1458ea726: 0f 85 70 08 00 00           	jne	0x1458eaf9c <.text+0x58e9f9c>
1458ea72c: 48 05 60 01 00 00           	addq	$0x160, %rax            # imm = 0x160
1458ea732: f3 44 0f 10 48 40           	movss	0x40(%rax), %xmm9
1458ea738: f3 44 0f 59 0d 3f 4e 4d 00  	mulss	0x4d4e3f(%rip), %xmm9   # 0x145dbf580
1458ea741: f3 44 0f 11 8d 68 03 00 00  	movss	%xmm9, 0x368(%rbp)
1458ea74a: 48 8d 8d 90 02 00 00        	leaq	0x290(%rbp), %rcx
1458ea751: 48 89 fa                    	movq	%rdi, %rdx
1458ea754: e8 c7 be 05 00              	callq	0x145946620 <.text+0x5945620>
1458ea759: 44 0f b6 af 64 0a 00 00     	movzbl	0xa64(%rdi), %r13d
1458ea761: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1458ea765: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458ea768: f3 41 0f c2 c9 05           	cmpnltss	%xmm9, %xmm1
1458ea76e: f3 0f 10 05 9e 95 48 00     	movss	0x48959e(%rip), %xmm0   # 0x145d73d14
1458ea776: 0f 28 d0                    	movaps	%xmm0, %xmm2
1458ea779: 41 f6 c5 01                 	testb	$0x1, %r13b
1458ea77d: 75 0e                       	jne	0x1458ea78d <.text+0x58e978d>
1458ea77f: f3 44 0f 5c cf              	subss	%xmm7, %xmm9
1458ea784: f3 45 0f 5f c8              	maxss	%xmm8, %xmm9
1458ea789: 41 0f 28 d1                 	movaps	%xmm9, %xmm2
1458ea78d: 0f 28 d9                    	movaps	%xmm1, %xmm3
1458ea790: 0f 55 da                    	andnps	%xmm2, %xmm3
1458ea793: 0f 54 c1                    	andps	%xmm1, %xmm0
1458ea796: 0f 56 c3                    	orps	%xmm3, %xmm0
1458ea799: f3 0f 11 85 64 03 00 00     	movss	%xmm0, 0x364(%rbp)
1458ea7a1: 0f b6 87 73 0a 00 00        	movzbl	0xa73(%rdi), %eax
1458ea7a8: c1 e0 03                    	shll	$0x3, %eax
1458ea7ab: 48 8d 0d 3e 09 59 01        	leaq	0x159093e(%rip), %rcx   # 0x146e7b0f0
1458ea7b2: 48 8b 0c 08                 	movq	(%rax,%rcx), %rcx
1458ea7b6: 48 8d 15 03 09 59 01        	leaq	0x1590903(%rip), %rdx   # 0x146e7b0c0
1458ea7bd: 48 8b 04 10                 	movq	(%rax,%rdx), %rax
1458ea7c1: 48 89 8d 80 02 00 00        	movq	%rcx, 0x280(%rbp)
1458ea7c8: 8b 8f d8 04 00 00           	movl	0x4d8(%rdi), %ecx
1458ea7ce: 83 f9 01                    	cmpl	$0x1, %ecx
1458ea7d1: 83 d1 ff                    	adcl	$-0x1, %ecx
1458ea7d4: 48 89 85 88 02 00 00        	movq	%rax, 0x288(%rbp)
1458ea7db: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458ea7de: f3 48 0f 2a c9              	cvtsi2ss	%rcx, %xmm1
1458ea7e3: f3 0f 10 15 e1 06 4b 00     	movss	0x4b06e1(%rip), %xmm2   # 0x145d9aecc
1458ea7eb: f3 0f 59 d1                 	mulss	%xmm1, %xmm2
1458ea7ef: f3 0f 58 15 19 96 48 00     	addss	0x489619(%rip), %xmm2   # 0x145d73e10
1458ea7f7: f3 0f 10 05 79 30 48 00     	movss	0x483079(%rip), %xmm0   # 0x145d6d878
1458ea7ff: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1458ea803: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1458ea807: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1458ea80b: e8 a1 ef 2d 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458ea810: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1458ea815: 31 c9                       	xorl	%ecx, %ecx
1458ea817: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1458ea81b: 0f 43 c8                    	cmovael	%eax, %ecx
1458ea81e: 0f 2e 05 4f 30 48 00        	ucomiss	0x48304f(%rip), %xmm0   # 0x145d6d874
1458ea825: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1458ea82a: 0f 46 c1                    	cmovbel	%ecx, %eax
1458ea82d: 89 85 60 03 00 00           	movl	%eax, 0x360(%rbp)
1458ea833: f3 0f 10 87 e0 04 00 00     	movss	0x4e0(%rdi), %xmm0
1458ea83b: f3 41 0f 5f c0              	maxss	%xmm8, %xmm0
1458ea840: f3 0f 11 85 5c 03 00 00     	movss	%xmm0, 0x35c(%rbp)
1458ea848: 4c 89 a5 c0 02 00 00        	movq	%r12, 0x2c0(%rbp)
1458ea84f: 48 c7 85 b8 02 00 00 05 00 00 00    	movq	$0x5, 0x2b8(%rbp)
1458ea85a: 4d 85 ff                    	testq	%r15, %r15
1458ea85d: 0f 84 c7 00 00 00           	je	0x1458ea92a <.text+0x58e992a>
1458ea863: 49 8d 47 30                 	leaq	0x30(%r15), %rax
1458ea867: 48 89 85 70 03 00 00        	movq	%rax, 0x370(%rbp)
1458ea86e: 48 8d 05 0b 37 2c 00        	leaq	0x2c370b(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1458ea875: 48 89 85 78 03 00 00        	movq	%rax, 0x378(%rbp)
1458ea87c: 48 8d 15 e6 64 2b 01        	leaq	0x12b64e6(%rip), %rdx   # 0x146ba0d69
1458ea883: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458ea887: 4c 8d 85 70 03 00 00        	leaq	0x370(%rbp), %r8
1458ea88e: e8 3d 1c 2b 00              	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458ea893: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
1458ea897: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1458ea89b: 49 8b 1f                    	movq	(%r15), %rbx
1458ea89e: 49 8b 77 08                 	movq	0x8(%r15), %rsi
1458ea8a2: 48 89 8d 98 03 00 00        	movq	%rcx, 0x398(%rbp)
1458ea8a9: e8 e2 fc fe ff              	callq	0x1458da590 <.text+0x58d9590>
1458ea8ae: 90                          	nop
1458ea8af: 49 89 c6                    	movq	%rax, %r14
1458ea8b2: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458ea8b6: 48 85 c0                    	testq	%rax, %rax
1458ea8b9: 74 1b                       	je	0x1458ea8d6 <.text+0x58e98d6>
1458ea8bb: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458ea8c1: 48 8b 8d 98 03 00 00        	movq	0x398(%rbp), %rcx
1458ea8c8: 49 89 d7                    	movq	%rdx, %r15
1458ea8cb: 48 89 c2                    	movq	%rax, %rdx
1458ea8ce: e8 fd 78 71 fa              	callq	0x1400021d0 <.text+0x11d0>
1458ea8d3: 4c 89 fa                    	movq	%r15, %rdx
1458ea8d6: 4d 85 f6                    	testq	%r14, %r14
1458ea8d9: 49 0f 45 de                 	cmovneq	%r14, %rbx
1458ea8dd: 48 0f 44 d6                 	cmoveq	%rsi, %rdx
1458ea8e1: 48 c7 45 b0 00 00 00 00     	movq	$0x0, -0x50(%rbp)
1458ea8e9: 48 c7 45 b8 01 00 00 00     	movq	$0x1, -0x48(%rbp)
1458ea8f1: 48 c7 45 c0 00 00 00 00     	movq	$0x0, -0x40(%rbp)
1458ea8f9: 48 85 d2                    	testq	%rdx, %rdx
1458ea8fc: 0f 85 a8 06 00 00           	jne	0x1458eafaa <.text+0x58e9faa>
1458ea902: 48 01 da                    	addq	%rbx, %rdx
1458ea905: 4c 8d 45 b0                 	leaq	-0x50(%rbp), %r8
1458ea909: 48 89 d9                    	movq	%rbx, %rcx
1458ea90c: e8 5f f2 0c 00              	callq	0x1459b9b70 <.text+0x59b8b70>
1458ea911: 90                          	nop
1458ea912: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458ea916: 48 89 85 80 03 00 00        	movq	%rax, 0x380(%rbp)
1458ea91d: 0f 10 45 b0                 	movups	-0x50(%rbp), %xmm0
1458ea921: 0f 29 85 70 03 00 00        	movaps	%xmm0, 0x370(%rbp)
1458ea928: eb 21                       	jmp	0x1458ea94b <.text+0x58e994b>
1458ea92a: 48 c7 85 70 03 00 00 00 00 00 00    	movq	$0x0, 0x370(%rbp)
1458ea935: 48 c7 85 78 03 00 00 01 00 00 00    	movq	$0x1, 0x378(%rbp)
1458ea940: 48 c7 85 80 03 00 00 00 00 00 00    	movq	$0x0, 0x380(%rbp)
1458ea94b: 44 88 ad a7 03 00 00        	movb	%r13b, 0x3a7(%rbp)
1458ea952: 0f b6 87 28 09 00 00        	movzbl	0x928(%rdi), %eax
1458ea959: 88 85 a6 03 00 00           	movb	%al, 0x3a6(%rbp)
1458ea95f: 31 db                       	xorl	%ebx, %ebx
1458ea961: 83 bf 40 05 00 00 00        	cmpl	$0x0, 0x540(%rdi)
1458ea968: b9 00 00 00 00              	movl	$0x0, %ecx
1458ea96d: 0f 85 a1 00 00 00           	jne	0x1458eaa14 <.text+0x58e9a14>
1458ea973: 44 8b 87 44 05 00 00        	movl	0x544(%rdi), %r8d
1458ea97a: b8 01 00 00 00              	movl	$0x1, %eax
1458ea97f: 45 85 c0                    	testl	%r8d, %r8d
1458ea982: 74 79                       	je	0x1458ea9fd <.text+0x58e99fd>
1458ea984: 41 f6 c0 01                 	testb	$0x1, %r8b
1458ea988: 74 0b                       	je	0x1458ea995 <.text+0x58e9995>
1458ea98a: b8 03 00 00 00              	movl	$0x3, %eax
1458ea98f: 41 83 f8 01                 	cmpl	$0x1, %r8d
1458ea993: 74 68                       	je	0x1458ea9fd <.text+0x58e99fd>
1458ea995: 41 f6 c0 02                 	testb	$0x2, %r8b
1458ea999: 74 0e                       	je	0x1458ea9a9 <.text+0x58e99a9>
1458ea99b: 8d 04 c0                    	leal	(%rax,%rax,8), %eax
1458ea99e: 44 89 c1                    	movl	%r8d, %ecx
1458ea9a1: 83 e1 fe                    	andl	$-0x2, %ecx
1458ea9a4: 83 f9 02                    	cmpl	$0x2, %ecx
1458ea9a7: 74 54                       	je	0x1458ea9fd <.text+0x58e99fd>
1458ea9a9: 41 f6 c0 04                 	testb	$0x4, %r8b
1458ea9ad: 74 11                       	je	0x1458ea9c0 <.text+0x58e99c0>
1458ea9af: 8d 04 c0                    	leal	(%rax,%rax,8), %eax
1458ea9b2: 8d 04 c0                    	leal	(%rax,%rax,8), %eax
1458ea9b5: 44 89 c1                    	movl	%r8d, %ecx
1458ea9b8: 83 e1 fc                    	andl	$-0x4, %ecx
1458ea9bb: 83 f9 04                    	cmpl	$0x4, %ecx
1458ea9be: 74 3d                       	je	0x1458ea9fd <.text+0x58e99fd>
1458ea9c0: 41 f6 c0 08                 	testb	$0x8, %r8b
1458ea9c4: 74 11                       	je	0x1458ea9d7 <.text+0x58e99d7>
1458ea9c6: 69 c0 a1 19 00 00           	imull	$0x19a1, %eax, %eax     # imm = 0x19A1
1458ea9cc: 44 89 c1                    	movl	%r8d, %ecx
1458ea9cf: 83 e1 f8                    	andl	$-0x8, %ecx
1458ea9d2: 83 f9 08                    	cmpl	$0x8, %ecx
1458ea9d5: 74 26                       	je	0x1458ea9fd <.text+0x58e99fd>
1458ea9d7: 41 b1 01                    	movb	$0x1, %r9b
1458ea9da: b9 9c ff ff ff              	movl	$0xffffff9c, %ecx       # imm = 0xFFFFFF9C
1458ea9df: 41 f6 c0 10                 	testb	$0x10, %r8b
1458ea9e3: 74 25                       	je	0x1458eaa0a <.text+0x58e9a0a>
1458ea9e5: ba 41 d7 90 02              	movl	$0x290d741, %edx        # imm = 0x290D741
1458ea9ea: f7 e2                       	mull	%edx
1458ea9ec: 0f 90 c2                    	seto	%dl
1458ea9ef: 41 83 e0 f0                 	andl	$-0x10, %r8d
1458ea9f3: 41 83 f8 10                 	cmpl	$0x10, %r8d
1458ea9f7: 75 11                       	jne	0x1458eaa0a <.text+0x58e9a0a>
1458ea9f9: 84 d2                       	testb	%dl, %dl
1458ea9fb: 75 0d                       	jne	0x1458eaa0a <.text+0x58e9a0a>
1458ea9fd: b9 64 00 00 00              	movl	$0x64, %ecx
1458eaa02: f7 e1                       	mull	%ecx
1458eaa04: 89 c1                       	movl	%eax, %ecx
1458eaa06: 41 0f 90 c1                 	seto	%r9b
1458eaa0a: 41 f6 c1 01                 	testb	$0x1, %r9b
1458eaa0e: 0f 85 cf 05 00 00           	jne	0x1458eafe3 <.text+0x58e9fe3>
1458eaa14: 89 8d 58 03 00 00           	movl	%ecx, 0x358(%rbp)
1458eaa1a: f2 0f 11 b5 b0 02 00 00     	movsd	%xmm6, 0x2b0(%rbp)
1458eaa22: f2 0f 10 87 c8 06 00 00     	movsd	0x6c8(%rdi), %xmm0
1458eaa2a: e8 ac ed 2d 00              	callq	0x145bc97db <.text+0x5bc87db>
1458eaa2f: f2 0f 11 85 a8 02 00 00     	movsd	%xmm0, 0x2a8(%rbp)
1458eaa37: 8b 87 f4 09 00 00           	movl	0x9f4(%rdi), %eax
1458eaa3d: 8b 8f f8 09 00 00           	movl	0x9f8(%rdi), %ecx
1458eaa43: 01 c1                       	addl	%eax, %ecx
1458eaa45: 03 8f fc 09 00 00           	addl	0x9fc(%rdi), %ecx
1458eaa4b: 80 bf 68 0a 00 00 00        	cmpb	$0x0, 0xa68(%rdi)
1458eaa52: 89 8d 54 03 00 00           	movl	%ecx, 0x354(%rbp)
1458eaa58: 0f 45 d8                    	cmovnel	%eax, %ebx
1458eaa5b: 89 9d 50 03 00 00           	movl	%ebx, 0x350(%rbp)
1458eaa61: 48 8b b5 90 02 00 00        	movq	0x290(%rbp), %rsi
1458eaa68: 0f 57 ff                    	xorps	%xmm7, %xmm7
1458eaa6b: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458eaa6e: 48 85 f6                    	testq	%rsi, %rsi
1458eaa71: 48 8b 85 98 02 00 00        	movq	0x298(%rbp), %rax
1458eaa78: 48 0f 44 c6                 	cmoveq	%rsi, %rax
1458eaa7c: b9 01 00 00 00              	movl	$0x1, %ecx
1458eaa81: 48 0f 45 ce                 	cmovneq	%rsi, %rcx
1458eaa85: 48 89 8d 70 02 00 00        	movq	%rcx, 0x270(%rbp)
1458eaa8c: 48 89 85 78 02 00 00        	movq	%rax, 0x278(%rbp)
1458eaa93: 74 1d                       	je	0x1458eaab2 <.text+0x58e9ab2>
1458eaa95: f3 0f 10 35 03 2a 48 00     	movss	0x482a03(%rip), %xmm6   # 0x145d6d4a0
1458eaa9d: f3 0f 10 85 a0 02 00 00     	movss	0x2a0(%rbp), %xmm0
1458eaaa5: f3 0f 59 c6                 	mulss	%xmm6, %xmm0
1458eaaa9: e8 03 ed 2d 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458eaaae: f3 0f 5e c6                 	divss	%xmm6, %xmm0
1458eaab2: 48 8d 87 88 09 00 00        	leaq	0x988(%rdi), %rax
1458eaab9: 48 89 85 28 03 00 00        	movq	%rax, 0x328(%rbp)
1458eaac0: 48 8d 9f ec 09 00 00        	leaq	0x9ec(%rdi), %rbx
1458eaac7: 4c 8d af d8 04 00 00        	leaq	0x4d8(%rdi), %r13
1458eaace: 4c 8d a7 dc 04 00 00        	leaq	0x4dc(%rdi), %r12
1458eaad5: 4c 8d bf 78 04 00 00        	leaq	0x478(%rdi), %r15
1458eaadc: 4c 8d b7 e4 04 00 00        	leaq	0x4e4(%rdi), %r14
1458eaae3: 48 8d 87 e8 04 00 00        	leaq	0x4e8(%rdi), %rax
1458eaaea: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1458eaaf1: 48 8d 87 0c 07 00 00        	leaq	0x70c(%rdi), %rax
1458eaaf8: 48 89 85 30 03 00 00        	movq	%rax, 0x330(%rbp)
1458eaaff: 48 8d 87 3c 05 00 00        	leaq	0x53c(%rdi), %rax
1458eab06: 48 89 85 20 03 00 00        	movq	%rax, 0x320(%rbp)
1458eab0d: 48 8d 87 40 05 00 00        	leaq	0x540(%rdi), %rax
1458eab14: 48 89 85 18 03 00 00        	movq	%rax, 0x318(%rbp)
1458eab1b: 48 8d 87 38 0a 00 00        	leaq	0xa38(%rdi), %rax
1458eab22: 48 89 85 00 03 00 00        	movq	%rax, 0x300(%rbp)
1458eab29: 48 8d 87 18 07 00 00        	leaq	0x718(%rdi), %rax
1458eab30: 48 89 85 e8 02 00 00        	movq	%rax, 0x2e8(%rbp)
1458eab37: f3 0f 11 85 4c 03 00 00     	movss	%xmm0, 0x34c(%rbp)
1458eab3f: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458eab42: 48 8d 87 14 07 00 00        	leaq	0x714(%rdi), %rax
1458eab49: 48 89 85 10 03 00 00        	movq	%rax, 0x310(%rbp)
1458eab50: 48 8d 87 10 07 00 00        	leaq	0x710(%rdi), %rax
1458eab57: 48 89 85 08 03 00 00        	movq	%rax, 0x308(%rbp)
1458eab5e: 48 8d 87 20 07 00 00        	leaq	0x720(%rdi), %rax
1458eab65: 48 89 85 f8 02 00 00        	movq	%rax, 0x2f8(%rbp)
1458eab6c: 48 8d 87 1c 07 00 00        	leaq	0x71c(%rdi), %rax
1458eab73: 48 89 85 f0 02 00 00        	movq	%rax, 0x2f0(%rbp)
1458eab7a: 48 85 f6                    	testq	%rsi, %rsi
1458eab7d: 74 08                       	je	0x1458eab87 <.text+0x58e9b87>
1458eab7f: f3 0f 10 85 a4 02 00 00     	movss	0x2a4(%rbp), %xmm0
1458eab87: f3 0f 11 85 48 03 00 00     	movss	%xmm0, 0x348(%rbp)
1458eab8f: 48 8d 87 c8 04 00 00        	leaq	0x4c8(%rdi), %rax
1458eab96: 48 89 85 98 03 00 00        	movq	%rax, 0x398(%rbp)
1458eab9d: 48 8d b7 cc 04 00 00        	leaq	0x4cc(%rdi), %rsi
1458eaba4: f3 0f 10 87 d4 04 00 00     	movss	0x4d4(%rdi), %xmm0
1458eabac: 48 81 c7 d0 04 00 00        	addq	$0x4d0, %rdi            # imm = 0x4D0
1458eabb3: f3 0f 10 35 8d 94 48 00     	movss	0x48948d(%rip), %xmm6   # 0x145d74048
1458eabbb: 0f 28 ce                    	movaps	%xmm6, %xmm1
1458eabbe: e8 12 ec 2d 00              	callq	0x145bc97d5 <.text+0x5bc87d5>
1458eabc3: 48 89 5d b0                 	movq	%rbx, -0x50(%rbp)
1458eabc7: 48 8d 05 b2 26 2c 00        	leaq	0x2c26b2(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
1458eabce: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
1458eabd2: 48 8d 8d 80 02 00 00        	leaq	0x280(%rbp), %rcx
1458eabd9: 48 89 4d c0                 	movq	%rcx, -0x40(%rbp)
1458eabdd: 48 8d 0d dc 74 71 fa        	leaq	-0x58e8b24(%rip), %rcx  # 0x1400020c0 <.text+0x10c0>
1458eabe4: 48 89 4d c8                 	movq	%rcx, -0x38(%rbp)
1458eabe8: 4c 89 6d d0                 	movq	%r13, -0x30(%rbp)
1458eabec: 48 8d 15 8d 33 2c 00        	leaq	0x2c338d(%rip), %rdx    # 0x145badf80 <.text+0x5bacf80>
1458eabf3: 48 89 55 d8                 	movq	%rdx, -0x28(%rbp)
1458eabf7: 4c 89 65 e0                 	movq	%r12, -0x20(%rbp)
1458eabfb: 48 89 55 e8                 	movq	%rdx, -0x18(%rbp)
1458eabff: 4c 8d 85 60 03 00 00        	leaq	0x360(%rbp), %r8
1458eac06: 4c 89 45 f0                 	movq	%r8, -0x10(%rbp)
1458eac0a: 48 89 55 f8                 	movq	%rdx, -0x8(%rbp)
1458eac0e: 4c 8d 85 5c 03 00 00        	leaq	0x35c(%rbp), %r8
1458eac15: 4c 89 45 00                 	movq	%r8, (%rbp)
1458eac19: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
1458eac1d: 4c 89 7d 10                 	movq	%r15, 0x10(%rbp)
1458eac21: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
1458eac25: 4c 89 75 20                 	movq	%r14, 0x20(%rbp)
1458eac29: 48 89 45 28                 	movq	%rax, 0x28(%rbp)
1458eac2d: 4c 8b 85 38 03 00 00        	movq	0x338(%rbp), %r8
1458eac34: 4c 89 45 30                 	movq	%r8, 0x30(%rbp)
1458eac38: 48 89 55 38                 	movq	%rdx, 0x38(%rbp)
1458eac3c: 4c 8b 85 30 03 00 00        	movq	0x330(%rbp), %r8
1458eac43: 4c 89 45 40                 	movq	%r8, 0x40(%rbp)
1458eac47: 48 89 55 48                 	movq	%rdx, 0x48(%rbp)
1458eac4b: 4c 8d 85 94 03 00 00        	leaq	0x394(%rbp), %r8
1458eac52: 4c 89 45 50                 	movq	%r8, 0x50(%rbp)
1458eac56: 48 89 55 58                 	movq	%rdx, 0x58(%rbp)
1458eac5a: 4c 8d 85 90 03 00 00        	leaq	0x390(%rbp), %r8
1458eac61: 4c 89 45 60                 	movq	%r8, 0x60(%rbp)
1458eac65: 48 89 55 68                 	movq	%rdx, 0x68(%rbp)
1458eac69: 4c 8d 85 d8 02 00 00        	leaq	0x2d8(%rbp), %r8
1458eac70: 4c 89 45 70                 	movq	%r8, 0x70(%rbp)
1458eac74: 4c 8d 05 f5 41 2c 00        	leaq	0x2c41f5(%rip), %r8     # 0x145baee70 <.text+0x5bade70>
1458eac7b: 4c 89 45 78                 	movq	%r8, 0x78(%rbp)
1458eac7f: 4c 8d 8d d0 02 00 00        	leaq	0x2d0(%rbp), %r9
1458eac86: 4c 89 8d 80 00 00 00        	movq	%r9, 0x80(%rbp)
1458eac8d: 4c 89 85 88 00 00 00        	movq	%r8, 0x88(%rbp)
1458eac94: 4c 8d 8d c8 02 00 00        	leaq	0x2c8(%rbp), %r9
1458eac9b: 4c 89 8d 90 00 00 00        	movq	%r9, 0x90(%rbp)
1458eaca2: 4c 89 85 98 00 00 00        	movq	%r8, 0x98(%rbp)
1458eaca9: 4c 8d 8d c0 02 00 00        	leaq	0x2c0(%rbp), %r9
1458eacb0: 4c 89 8d a0 00 00 00        	movq	%r9, 0xa0(%rbp)
1458eacb7: 4c 89 85 a8 00 00 00        	movq	%r8, 0xa8(%rbp)
1458eacbe: 4c 8b 8d 28 03 00 00        	movq	0x328(%rbp), %r9
1458eacc5: 4c 89 8d b0 00 00 00        	movq	%r9, 0xb0(%rbp)
1458eaccc: 4c 89 85 b8 00 00 00        	movq	%r8, 0xb8(%rbp)
1458eacd3: 4c 8d 8d b8 02 00 00        	leaq	0x2b8(%rbp), %r9
1458eacda: 4c 89 8d c0 00 00 00        	movq	%r9, 0xc0(%rbp)
1458eace1: 4c 89 85 c8 00 00 00        	movq	%r8, 0xc8(%rbp)
1458eace8: 4c 8d 85 6c 03 00 00        	leaq	0x36c(%rbp), %r8
1458eacef: 4c 89 85 d0 00 00 00        	movq	%r8, 0xd0(%rbp)
1458eacf6: 48 89 85 d8 00 00 00        	movq	%rax, 0xd8(%rbp)
1458eacfd: 4c 8d 85 70 03 00 00        	leaq	0x370(%rbp), %r8
1458ead04: 4c 89 85 e0 00 00 00        	movq	%r8, 0xe0(%rbp)
1458ead0b: 4c 8d 05 ce 73 71 fa        	leaq	-0x58e8c32(%rip), %r8   # 0x1400020e0 <.text+0x10e0>
1458ead12: 4c 89 85 e8 00 00 00        	movq	%r8, 0xe8(%rbp)
1458ead19: 4c 8d 85 68 03 00 00        	leaq	0x368(%rbp), %r8
1458ead20: 4c 89 85 f0 00 00 00        	movq	%r8, 0xf0(%rbp)
1458ead27: 48 89 85 f8 00 00 00        	movq	%rax, 0xf8(%rbp)
1458ead2e: 4c 8d 85 64 03 00 00        	leaq	0x364(%rbp), %r8
1458ead35: 4c 89 85 00 01 00 00        	movq	%r8, 0x100(%rbp)
1458ead3c: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
1458ead43: 4c 8d 85 a7 03 00 00        	leaq	0x3a7(%rbp), %r8
1458ead4a: 4c 89 85 10 01 00 00        	movq	%r8, 0x110(%rbp)
1458ead51: 4c 8d 05 58 fb 2b 00        	leaq	0x2bfb58(%rip), %r8     # 0x145baa8b0 <.text+0x5ba98b0>
1458ead58: 4c 89 85 18 01 00 00        	movq	%r8, 0x118(%rbp)
1458ead5f: 4c 8d 8d a6 03 00 00        	leaq	0x3a6(%rbp), %r9
1458ead66: 4c 89 8d 20 01 00 00        	movq	%r9, 0x120(%rbp)
1458ead6d: 4c 89 85 28 01 00 00        	movq	%r8, 0x128(%rbp)
1458ead74: 4c 8b 85 20 03 00 00        	movq	0x320(%rbp), %r8
1458ead7b: 4c 89 85 30 01 00 00        	movq	%r8, 0x130(%rbp)
1458ead82: 48 89 95 38 01 00 00        	movq	%rdx, 0x138(%rbp)
1458ead89: 4c 8b 85 18 03 00 00        	movq	0x318(%rbp), %r8
1458ead90: 4c 89 85 40 01 00 00        	movq	%r8, 0x140(%rbp)
1458ead97: 48 89 95 48 01 00 00        	movq	%rdx, 0x148(%rbp)
1458ead9e: 4c 8d 85 58 03 00 00        	leaq	0x358(%rbp), %r8
1458eada5: 4c 89 85 50 01 00 00        	movq	%r8, 0x150(%rbp)
1458eadac: 48 89 95 58 01 00 00        	movq	%rdx, 0x158(%rbp)
1458eadb3: 4c 8b 85 00 03 00 00        	movq	0x300(%rbp), %r8
1458eadba: 4c 89 85 60 01 00 00        	movq	%r8, 0x160(%rbp)
1458eadc1: 48 89 95 68 01 00 00        	movq	%rdx, 0x168(%rbp)
1458eadc8: 4c 8d 85 b0 02 00 00        	leaq	0x2b0(%rbp), %r8
1458eadcf: 4c 89 85 70 01 00 00        	movq	%r8, 0x170(%rbp)
1458eadd6: 4c 8d 05 33 2d 2c 00        	leaq	0x2c2d33(%rip), %r8     # 0x145badb10 <.text+0x5bacb10>
1458eaddd: 4c 89 85 78 01 00 00        	movq	%r8, 0x178(%rbp)
1458eade4: 4c 8b 8d e8 02 00 00        	movq	0x2e8(%rbp), %r9
1458eadeb: 4c 89 8d 80 01 00 00        	movq	%r9, 0x180(%rbp)
1458eadf2: 48 89 95 88 01 00 00        	movq	%rdx, 0x188(%rbp)
1458eadf9: 4c 8b 8d 10 03 00 00        	movq	0x310(%rbp), %r9
1458eae00: 4c 89 8d 90 01 00 00        	movq	%r9, 0x190(%rbp)
1458eae07: 48 89 95 98 01 00 00        	movq	%rdx, 0x198(%rbp)
1458eae0e: 4c 8b 8d 08 03 00 00        	movq	0x308(%rbp), %r9
1458eae15: 4c 89 8d a0 01 00 00        	movq	%r9, 0x1a0(%rbp)
1458eae1c: 48 89 95 a8 01 00 00        	movq	%rdx, 0x1a8(%rbp)
1458eae23: 4c 8b 8d f8 02 00 00        	movq	0x2f8(%rbp), %r9
1458eae2a: 4c 89 8d b0 01 00 00        	movq	%r9, 0x1b0(%rbp)
1458eae31: 48 89 95 b8 01 00 00        	movq	%rdx, 0x1b8(%rbp)
1458eae38: 4c 8d 8d a8 02 00 00        	leaq	0x2a8(%rbp), %r9
1458eae3f: 4c 89 8d c0 01 00 00        	movq	%r9, 0x1c0(%rbp)
1458eae46: 4c 89 85 c8 01 00 00        	movq	%r8, 0x1c8(%rbp)
1458eae4d: 4c 8b 85 f0 02 00 00        	movq	0x2f0(%rbp), %r8
1458eae54: 4c 89 85 d0 01 00 00        	movq	%r8, 0x1d0(%rbp)
1458eae5b: 48 89 95 d8 01 00 00        	movq	%rdx, 0x1d8(%rbp)
1458eae62: 4c 8d 85 54 03 00 00        	leaq	0x354(%rbp), %r8
1458eae69: 4c 89 85 e0 01 00 00        	movq	%r8, 0x1e0(%rbp)
1458eae70: 48 89 95 e8 01 00 00        	movq	%rdx, 0x1e8(%rbp)
1458eae77: 4c 8d 85 50 03 00 00        	leaq	0x350(%rbp), %r8
1458eae7e: 4c 89 85 f0 01 00 00        	movq	%r8, 0x1f0(%rbp)
1458eae85: 48 89 95 f8 01 00 00        	movq	%rdx, 0x1f8(%rbp)
1458eae8c: 48 8d 95 70 02 00 00        	leaq	0x270(%rbp), %rdx
1458eae93: 48 89 95 00 02 00 00        	movq	%rdx, 0x200(%rbp)
1458eae9a: 48 89 8d 08 02 00 00        	movq	%rcx, 0x208(%rbp)
1458eaea1: 48 8d 8d 4c 03 00 00        	leaq	0x34c(%rbp), %rcx
1458eaea8: 48 89 8d 10 02 00 00        	movq	%rcx, 0x210(%rbp)
1458eaeaf: 48 89 85 18 02 00 00        	movq	%rax, 0x218(%rbp)
1458eaeb6: 48 8d 8d 48 03 00 00        	leaq	0x348(%rbp), %rcx
1458eaebd: 48 89 8d 20 02 00 00        	movq	%rcx, 0x220(%rbp)
1458eaec4: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
1458eaecb: 48 8b 8d 98 03 00 00        	movq	0x398(%rbp), %rcx
1458eaed2: 48 89 8d 30 02 00 00        	movq	%rcx, 0x230(%rbp)
1458eaed9: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
1458eaee0: 48 89 b5 40 02 00 00        	movq	%rsi, 0x240(%rbp)
1458eaee7: 48 89 85 48 02 00 00        	movq	%rax, 0x248(%rbp)
1458eaeee: 48 89 bd 50 02 00 00        	movq	%rdi, 0x250(%rbp)
1458eaef5: 48 89 85 58 02 00 00        	movq	%rax, 0x258(%rbp)
1458eaefc: 48 8d 8d 44 03 00 00        	leaq	0x344(%rbp), %rcx
1458eaf03: 48 89 8d 60 02 00 00        	movq	%rcx, 0x260(%rbp)
1458eaf0a: 48 89 85 68 02 00 00        	movq	%rax, 0x268(%rbp)
1458eaf11: f3 0f 58 f0                 	addss	%xmm0, %xmm6
1458eaf15: 0f 28 c8                    	movaps	%xmm0, %xmm1
1458eaf18: f3 0f c2 cf 01              	cmpltss	%xmm7, %xmm1
1458eaf1d: 0f 54 f1                    	andps	%xmm1, %xmm6
1458eaf20: 0f 55 c8                    	andnps	%xmm0, %xmm1
1458eaf23: 0f 56 ce                    	orps	%xmm6, %xmm1
1458eaf26: f3 0f 11 8d 44 03 00 00     	movss	%xmm1, 0x344(%rbp)
1458eaf2e: 48 8d 15 5a da 58 01        	leaq	0x158da5a(%rip), %rdx   # 0x146e7898f
1458eaf35: 4c 8d 45 b0                 	leaq	-0x50(%rbp), %r8
1458eaf39: 48 8b b5 e0 02 00 00        	movq	0x2e0(%rbp), %rsi
1458eaf40: 48 89 f1                    	movq	%rsi, %rcx
1458eaf43: e8 88 15 2b 00              	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458eaf48: 90                          	nop
1458eaf49: 48 8b 95 70 03 00 00        	movq	0x370(%rbp), %rdx
1458eaf50: 48 85 d2                    	testq	%rdx, %rdx
1458eaf53: 74 12                       	je	0x1458eaf67 <.text+0x58e9f67>
1458eaf55: 48 8b 8d 78 03 00 00        	movq	0x378(%rbp), %rcx
1458eaf5c: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458eaf62: e8 69 72 71 fa              	callq	0x1400021d0 <.text+0x11d0>
1458eaf67: 48 89 f0                    	movq	%rsi, %rax
1458eaf6a: 0f 28 b5 b0 03 00 00        	movaps	0x3b0(%rbp), %xmm6
1458eaf71: 0f 28 bd c0 03 00 00        	movaps	0x3c0(%rbp), %xmm7
1458eaf78: 44 0f 28 85 d0 03 00 00     	movaps	0x3d0(%rbp), %xmm8
1458eaf80: 44 0f 28 8d e0 03 00 00     	movaps	0x3e0(%rbp), %xmm9
1458eaf88: 48 81 c4 78 04 00 00        	addq	$0x478, %rsp            # imm = 0x478
1458eaf8f: 5b                          	popq	%rbx
1458eaf90: 5f                          	popq	%rdi
1458eaf91: 5e                          	popq	%rsi
1458eaf92: 41 5c                       	popq	%r12
1458eaf94: 41 5d                       	popq	%r13
1458eaf96: 41 5e                       	popq	%r14
1458eaf98: 41 5f                       	popq	%r15
1458eaf9a: 5d                          	popq	%rbp
1458eaf9b: c3                          	retq
1458eaf9c: f3 44 0f 10 0d 6f 8d 48 00  	movss	0x488d6f(%rip), %xmm9   # 0x145d73d14
1458eafa5: e9 97 f7 ff ff              	jmp	0x1458ea741 <.text+0x58e9741>
1458eafaa: 49 89 d0                    	movq	%rdx, %r8
1458eafad: 49 c1 e8 02                 	shrq	$0x2, %r8
1458eafb1: 89 d0                       	movl	%edx, %eax
1458eafb3: 83 e0 03                    	andl	$0x3, %eax
1458eafb6: 48 83 f8 01                 	cmpq	$0x1, %rax
1458eafba: 49 83 d8 ff                 	sbbq	$-0x1, %r8
1458eafbe: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458eafc7: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458eafcb: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458eafd1: 48 89 d6                    	movq	%rdx, %rsi
1458eafd4: 31 d2                       	xorl	%edx, %edx
1458eafd6: e8 f5 02 2e 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458eafdb: 48 89 f2                    	movq	%rsi, %rdx
1458eafde: e9 1f f9 ff ff              	jmp	0x1458ea902 <.text+0x58e9902>
1458eafe3: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1458eafe8: e9 27 fa ff ff              	jmp	0x1458eaa14 <.text+0x58e9a14>
