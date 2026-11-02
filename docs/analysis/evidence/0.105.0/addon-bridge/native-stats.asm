
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f0300: 41 57                       	pushq	%r15
1458f0302: 41 56                       	pushq	%r14
1458f0304: 41 55                       	pushq	%r13
1458f0306: 41 54                       	pushq	%r12
1458f0308: 56                          	pushq	%rsi
1458f0309: 57                          	pushq	%rdi
1458f030a: 55                          	pushq	%rbp
1458f030b: 53                          	pushq	%rbx
1458f030c: 48 81 ec d8 03 00 00        	subq	$0x3d8, %rsp            # imm = 0x3D8
1458f0313: 44 0f 29 ac 24 c0 03 00 00  	movaps	%xmm13, 0x3c0(%rsp)
1458f031c: 44 0f 29 a4 24 b0 03 00 00  	movaps	%xmm12, 0x3b0(%rsp)
1458f0325: 44 0f 29 9c 24 a0 03 00 00  	movaps	%xmm11, 0x3a0(%rsp)
1458f032e: 44 0f 29 94 24 90 03 00 00  	movaps	%xmm10, 0x390(%rsp)
1458f0337: 44 0f 29 8c 24 80 03 00 00  	movaps	%xmm9, 0x380(%rsp)
1458f0340: 44 0f 29 84 24 70 03 00 00  	movaps	%xmm8, 0x370(%rsp)
1458f0349: 0f 29 bc 24 60 03 00 00     	movaps	%xmm7, 0x360(%rsp)
1458f0351: 0f 29 b4 24 50 03 00 00     	movaps	%xmm6, 0x350(%rsp)
1458f0359: 48 89 d6                    	movq	%rdx, %rsi
1458f035c: 48 89 8c 24 a8 00 00 00     	movq	%rcx, 0xa8(%rsp)
1458f0364: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458f0367: 0f 29 44 24 60              	movaps	%xmm0, 0x60(%rsp)
1458f036c: 0f 29 44 24 50              	movaps	%xmm0, 0x50(%rsp)
1458f0371: 0f 29 44 24 40              	movaps	%xmm0, 0x40(%rsp)
1458f0376: c7 44 24 70 00 00 00 00     	movl	$0x0, 0x70(%rsp)
1458f037e: 48 8b 82 68 03 00 00        	movq	0x368(%rdx), %rax
1458f0385: 48 85 c0                    	testq	%rax, %rax
1458f0388: 0f 84 62 01 00 00           	je	0x1458f04f0 <.text+0x58ef4f0>
1458f038e: 48 8b 8e 60 03 00 00        	movq	0x360(%rsi), %rcx
1458f0395: 48 c1 e0 03                 	shlq	$0x3, %rax
1458f0399: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458f039c: 31 d2                       	xorl	%edx, %edx
1458f039e: 4c 8d 05 8b ae 58 01        	leaq	0x158ae8b(%rip), %r8    # 0x146e7b230
1458f03a5: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f03a8: 0f 57 db                    	xorps	%xmm3, %xmm3
1458f03ab: 0f 57 e4                    	xorps	%xmm4, %xmm4
1458f03ae: 0f 57 ed                    	xorps	%xmm5, %xmm5
1458f03b1: 0f 57 f6                    	xorps	%xmm6, %xmm6
1458f03b4: 0f 57 ff                    	xorps	%xmm7, %xmm7
1458f03b7: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
1458f03bb: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1458f03bf: 45 0f 57 d2                 	xorps	%xmm10, %xmm10
1458f03c3: 0f 57 d2                    	xorps	%xmm2, %xmm2
1458f03c6: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1458f03ca: 45 0f 57 e4                 	xorps	%xmm12, %xmm12
1458f03ce: eb 2d                       	jmp	0x1458f03fd <.text+0x58ef3fd>
1458f03d0: 44 8b 4c 11 04              	movl	0x4(%rcx,%rdx), %r9d
1458f03d5: 45 0f 57 ed                 	xorps	%xmm13, %xmm13
1458f03d9: f3 4d 0f 2a e9              	cvtsi2ss	%r9, %xmm13
1458f03de: f3 41 0f 58 d5              	addss	%xmm13, %xmm2
1458f03e3: f3 0f 11 54 24 60           	movss	%xmm2, 0x60(%rsp)
1458f03e9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1458f03f0: 48 83 c2 08                 	addq	$0x8, %rdx
1458f03f4: 48 39 d0                    	cmpq	%rdx, %rax
1458f03f7: 0f 84 d2 00 00 00           	je	0x1458f04cf <.text+0x58ef4cf>
1458f03fd: 44 8b 0c 11                 	movl	(%rcx,%rdx), %r9d
1458f0401: 4f 63 0c 88                 	movslq	(%r8,%r9,4), %r9
1458f0405: 4d 01 c1                    	addq	%r8, %r9
1458f0408: 41 ff e1                    	jmpq	*%r9
1458f040b: f3 0f 58 44 11 04           	addss	0x4(%rcx,%rdx), %xmm0
1458f0411: f3 0f 11 44 24 44           	movss	%xmm0, 0x44(%rsp)
1458f0417: eb d7                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0419: f3 0f 58 64 11 04           	addss	0x4(%rcx,%rdx), %xmm4
1458f041f: f3 0f 11 64 24 50           	movss	%xmm4, 0x50(%rsp)
1458f0425: eb c9                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0427: f3 44 0f 58 5c 11 04        	addss	0x4(%rcx,%rdx), %xmm11
1458f042e: f3 44 0f 11 5c 24 64        	movss	%xmm11, 0x64(%rsp)
1458f0435: eb b9                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0437: f3 44 0f 58 4c 11 04        	addss	0x4(%rcx,%rdx), %xmm9
1458f043e: f3 44 0f 11 4c 24 70        	movss	%xmm9, 0x70(%rsp)
1458f0445: eb a9                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0447: f3 44 0f 58 64 11 04        	addss	0x4(%rcx,%rdx), %xmm12
1458f044e: f3 44 0f 11 64 24 40        	movss	%xmm12, 0x40(%rsp)
1458f0455: eb 99                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0457: f3 0f 58 5c 11 04           	addss	0x4(%rcx,%rdx), %xmm3
1458f045d: f3 0f 11 5c 24 4c           	movss	%xmm3, 0x4c(%rsp)
1458f0463: eb 8b                       	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0465: f3 0f 58 7c 11 04           	addss	0x4(%rcx,%rdx), %xmm7
1458f046b: f3 0f 11 7c 24 58           	movss	%xmm7, 0x58(%rsp)
1458f0471: e9 7a ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0476: f3 0f 58 4c 11 04           	addss	0x4(%rcx,%rdx), %xmm1
1458f047c: f3 0f 11 4c 24 48           	movss	%xmm1, 0x48(%rsp)
1458f0482: e9 69 ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0487: f3 0f 58 6c 11 04           	addss	0x4(%rcx,%rdx), %xmm5
1458f048d: f3 0f 11 6c 24 68           	movss	%xmm5, 0x68(%rsp)
1458f0493: e9 58 ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f0498: f3 0f 58 74 11 04           	addss	0x4(%rcx,%rdx), %xmm6
1458f049e: f3 0f 11 74 24 54           	movss	%xmm6, 0x54(%rsp)
1458f04a4: e9 47 ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f04a9: f3 44 0f 58 54 11 04        	addss	0x4(%rcx,%rdx), %xmm10
1458f04b0: f3 44 0f 11 54 24 5c        	movss	%xmm10, 0x5c(%rsp)
1458f04b7: e9 34 ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f04bc: f3 44 0f 58 44 11 04        	addss	0x4(%rcx,%rdx), %xmm8
1458f04c3: f3 44 0f 11 44 24 6c        	movss	%xmm8, 0x6c(%rsp)
1458f04ca: e9 21 ff ff ff              	jmp	0x1458f03f0 <.text+0x58ef3f0>
1458f04cf: f3 48 0f 2c c2              	cvttss2si	%xmm2, %rax
1458f04d4: 31 c9                       	xorl	%ecx, %ecx
1458f04d6: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458f04d9: 0f 2e d0                    	ucomiss	%xmm0, %xmm2
1458f04dc: 0f 43 c8                    	cmovael	%eax, %ecx
1458f04df: 0f 2e 15 8e d3 47 00        	ucomiss	0x47d38e(%rip), %xmm2   # 0x145d6d874
1458f04e6: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1458f04eb: 0f 46 c1                    	cmovbel	%ecx, %eax
1458f04ee: eb 02                       	jmp	0x1458f04f2 <.text+0x58ef4f2>
1458f04f0: 31 c0                       	xorl	%eax, %eax
1458f04f2: 89 44 24 74                 	movl	%eax, 0x74(%rsp)
1458f04f6: 48 89 f1                    	movq	%rsi, %rcx
1458f04f9: e8 e2 73 02 00              	callq	0x1459178e0 <.text+0x59168e0>
1458f04fe: f3 0f 11 44 24 78           	movss	%xmm0, 0x78(%rsp)
1458f0504: 48 8b 8e 80 07 00 00        	movq	0x780(%rsi), %rcx
1458f050b: 48 85 c9                    	testq	%rcx, %rcx
1458f050e: 0f 84 1b 04 00 00           	je	0x1458f092f <.text+0x58ef92f>
1458f0514: 48 8b 86 78 07 00 00        	movq	0x778(%rsi), %rax
1458f051b: 48 89 ca                    	movq	%rcx, %rdx
1458f051e: 48 ff ca                    	decq	%rdx
1458f0521: 0f 84 d3 08 00 00           	je	0x1458f0dfa <.text+0x58efdfa>
1458f0527: 49 89 c9                    	movq	%rcx, %r9
1458f052a: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f052e: f3 0f 10 05 3a 07 48 00     	movss	0x48073a(%rip), %xmm0   # 0x145d70c70
1458f0536: 45 31 c0                    	xorl	%r8d, %r8d
1458f0539: eb 0e                       	jmp	0x1458f0549 <.text+0x58ef549>
1458f053b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1458f0540: 49 83 c0 02                 	addq	$0x2, %r8
1458f0544: 4d 39 c1                    	cmpq	%r8, %r9
1458f0547: 74 2f                       	je	0x1458f0578 <.text+0x58ef578>
1458f0549: 42 80 3c c0 16              	cmpb	$0x16, (%rax,%r8,8)
1458f054e: 74 10                       	je	0x1458f0560 <.text+0x58ef560>
1458f0550: 42 80 7c c0 08 16           	cmpb	$0x16, 0x8(%rax,%r8,8)
1458f0556: 75 e8                       	jne	0x1458f0540 <.text+0x58ef540>
1458f0558: eb 15                       	jmp	0x1458f056f <.text+0x58ef56f>
1458f055a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0560: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0567: 42 80 7c c0 08 16           	cmpb	$0x16, 0x8(%rax,%r8,8)
1458f056d: 75 d1                       	jne	0x1458f0540 <.text+0x58ef540>
1458f056f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0576: eb c8                       	jmp	0x1458f0540 <.text+0x58ef540>
1458f0578: f6 c1 01                    	testb	$0x1, %cl
1458f057b: 74 0e                       	je	0x1458f058b <.text+0x58ef58b>
1458f057d: 42 80 3c c0 16              	cmpb	$0x16, (%rax,%r8,8)
1458f0582: 75 07                       	jne	0x1458f058b <.text+0x58ef58b>
1458f0584: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f058b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f058e: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f0592: 44 8b 86 bc 04 00 00        	movl	0x4bc(%rsi), %r8d
1458f0599: 41 83 f8 03                 	cmpl	$0x3, %r8d
1458f059d: 41 b9 03 00 00 00           	movl	$0x3, %r9d
1458f05a3: 45 0f 42 c8                 	cmovbl	%r8d, %r9d
1458f05a7: f3 0f 11 4c 24 24           	movss	%xmm1, 0x24(%rsp)
1458f05ad: 41 ff c1                    	incl	%r9d
1458f05b0: 4c 89 8c 24 80 00 00 00     	movq	%r9, 0x80(%rsp)
1458f05b8: 48 85 d2                    	testq	%rdx, %rdx
1458f05bb: 0f 84 54 08 00 00           	je	0x1458f0e15 <.text+0x58efe15>
1458f05c1: 49 89 c9                    	movq	%rcx, %r9
1458f05c4: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f05c8: f3 0f 10 05 a0 06 48 00     	movss	0x4806a0(%rip), %xmm0   # 0x145d70c70
1458f05d0: 45 31 c0                    	xorl	%r8d, %r8d
1458f05d3: eb 14                       	jmp	0x1458f05e9 <.text+0x58ef5e9>
1458f05d5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f05e0: 49 83 c0 02                 	addq	$0x2, %r8
1458f05e4: 4d 39 c1                    	cmpq	%r8, %r9
1458f05e7: 74 2f                       	je	0x1458f0618 <.text+0x58ef618>
1458f05e9: 42 80 3c c0 13              	cmpb	$0x13, (%rax,%r8,8)
1458f05ee: 74 10                       	je	0x1458f0600 <.text+0x58ef600>
1458f05f0: 42 80 7c c0 08 13           	cmpb	$0x13, 0x8(%rax,%r8,8)
1458f05f6: 75 e8                       	jne	0x1458f05e0 <.text+0x58ef5e0>
1458f05f8: eb 15                       	jmp	0x1458f060f <.text+0x58ef60f>
1458f05fa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0600: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0607: 42 80 7c c0 08 13           	cmpb	$0x13, 0x8(%rax,%r8,8)
1458f060d: 75 d1                       	jne	0x1458f05e0 <.text+0x58ef5e0>
1458f060f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0616: eb c8                       	jmp	0x1458f05e0 <.text+0x58ef5e0>
1458f0618: f6 c1 01                    	testb	$0x1, %cl
1458f061b: 74 0e                       	je	0x1458f062b <.text+0x58ef62b>
1458f061d: 42 80 3c c0 13              	cmpb	$0x13, (%rax,%r8,8)
1458f0622: 75 07                       	jne	0x1458f062b <.text+0x58ef62b>
1458f0624: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f062b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f062e: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f0632: f3 0f 11 4c 24 28           	movss	%xmm1, 0x28(%rsp)
1458f0638: 48 85 d2                    	testq	%rdx, %rdx
1458f063b: 0f 84 ef 07 00 00           	je	0x1458f0e30 <.text+0x58efe30>
1458f0641: 49 89 c9                    	movq	%rcx, %r9
1458f0644: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f0648: f3 0f 10 05 20 06 48 00     	movss	0x480620(%rip), %xmm0   # 0x145d70c70
1458f0650: 45 31 c0                    	xorl	%r8d, %r8d
1458f0653: eb 14                       	jmp	0x1458f0669 <.text+0x58ef669>
1458f0655: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f0660: 49 83 c0 02                 	addq	$0x2, %r8
1458f0664: 4d 39 c1                    	cmpq	%r8, %r9
1458f0667: 74 2f                       	je	0x1458f0698 <.text+0x58ef698>
1458f0669: 42 80 3c c0 14              	cmpb	$0x14, (%rax,%r8,8)
1458f066e: 74 10                       	je	0x1458f0680 <.text+0x58ef680>
1458f0670: 42 80 7c c0 08 14           	cmpb	$0x14, 0x8(%rax,%r8,8)
1458f0676: 75 e8                       	jne	0x1458f0660 <.text+0x58ef660>
1458f0678: eb 15                       	jmp	0x1458f068f <.text+0x58ef68f>
1458f067a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0680: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0687: 42 80 7c c0 08 14           	cmpb	$0x14, 0x8(%rax,%r8,8)
1458f068d: 75 d1                       	jne	0x1458f0660 <.text+0x58ef660>
1458f068f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0696: eb c8                       	jmp	0x1458f0660 <.text+0x58ef660>
1458f0698: f6 c1 01                    	testb	$0x1, %cl
1458f069b: 74 0e                       	je	0x1458f06ab <.text+0x58ef6ab>
1458f069d: 42 80 3c c0 14              	cmpb	$0x14, (%rax,%r8,8)
1458f06a2: 75 07                       	jne	0x1458f06ab <.text+0x58ef6ab>
1458f06a4: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f06ab: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f06ae: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f06b2: f3 0f 11 4c 24 2c           	movss	%xmm1, 0x2c(%rsp)
1458f06b8: 48 85 d2                    	testq	%rdx, %rdx
1458f06bb: 0f 84 8a 07 00 00           	je	0x1458f0e4b <.text+0x58efe4b>
1458f06c1: 49 89 c9                    	movq	%rcx, %r9
1458f06c4: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f06c8: f3 0f 10 05 a0 05 48 00     	movss	0x4805a0(%rip), %xmm0   # 0x145d70c70
1458f06d0: 45 31 c0                    	xorl	%r8d, %r8d
1458f06d3: eb 14                       	jmp	0x1458f06e9 <.text+0x58ef6e9>
1458f06d5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f06e0: 49 83 c0 02                 	addq	$0x2, %r8
1458f06e4: 4d 39 c1                    	cmpq	%r8, %r9
1458f06e7: 74 2f                       	je	0x1458f0718 <.text+0x58ef718>
1458f06e9: 42 80 3c c0 12              	cmpb	$0x12, (%rax,%r8,8)
1458f06ee: 74 10                       	je	0x1458f0700 <.text+0x58ef700>
1458f06f0: 42 80 7c c0 08 12           	cmpb	$0x12, 0x8(%rax,%r8,8)
1458f06f6: 75 e8                       	jne	0x1458f06e0 <.text+0x58ef6e0>
1458f06f8: eb 15                       	jmp	0x1458f070f <.text+0x58ef70f>
1458f06fa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0700: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0707: 42 80 7c c0 08 12           	cmpb	$0x12, 0x8(%rax,%r8,8)
1458f070d: 75 d1                       	jne	0x1458f06e0 <.text+0x58ef6e0>
1458f070f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0716: eb c8                       	jmp	0x1458f06e0 <.text+0x58ef6e0>
1458f0718: f6 c1 01                    	testb	$0x1, %cl
1458f071b: 74 0e                       	je	0x1458f072b <.text+0x58ef72b>
1458f071d: 42 80 3c c0 12              	cmpb	$0x12, (%rax,%r8,8)
1458f0722: 75 07                       	jne	0x1458f072b <.text+0x58ef72b>
1458f0724: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f072b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f072e: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f0732: f3 0f 11 4c 24 30           	movss	%xmm1, 0x30(%rsp)
1458f0738: 48 85 d2                    	testq	%rdx, %rdx
1458f073b: 0f 84 25 07 00 00           	je	0x1458f0e66 <.text+0x58efe66>
1458f0741: 49 89 c9                    	movq	%rcx, %r9
1458f0744: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f0748: f3 0f 10 05 20 05 48 00     	movss	0x480520(%rip), %xmm0   # 0x145d70c70
1458f0750: 45 31 c0                    	xorl	%r8d, %r8d
1458f0753: eb 14                       	jmp	0x1458f0769 <.text+0x58ef769>
1458f0755: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f0760: 49 83 c0 02                 	addq	$0x2, %r8
1458f0764: 4d 39 c1                    	cmpq	%r8, %r9
1458f0767: 74 2f                       	je	0x1458f0798 <.text+0x58ef798>
1458f0769: 42 80 3c c0 15              	cmpb	$0x15, (%rax,%r8,8)
1458f076e: 74 10                       	je	0x1458f0780 <.text+0x58ef780>
1458f0770: 42 80 7c c0 08 15           	cmpb	$0x15, 0x8(%rax,%r8,8)
1458f0776: 75 e8                       	jne	0x1458f0760 <.text+0x58ef760>
1458f0778: eb 15                       	jmp	0x1458f078f <.text+0x58ef78f>
1458f077a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0780: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0787: 42 80 7c c0 08 15           	cmpb	$0x15, 0x8(%rax,%r8,8)
1458f078d: 75 d1                       	jne	0x1458f0760 <.text+0x58ef760>
1458f078f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0796: eb c8                       	jmp	0x1458f0760 <.text+0x58ef760>
1458f0798: f6 c1 01                    	testb	$0x1, %cl
1458f079b: 74 0e                       	je	0x1458f07ab <.text+0x58ef7ab>
1458f079d: 42 80 3c c0 15              	cmpb	$0x15, (%rax,%r8,8)
1458f07a2: 75 07                       	jne	0x1458f07ab <.text+0x58ef7ab>
1458f07a4: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f07ab: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f07ae: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f07b2: f3 0f 11 4c 24 34           	movss	%xmm1, 0x34(%rsp)
1458f07b8: 48 85 d2                    	testq	%rdx, %rdx
1458f07bb: 0f 84 c0 06 00 00           	je	0x1458f0e81 <.text+0x58efe81>
1458f07c1: 49 89 c9                    	movq	%rcx, %r9
1458f07c4: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f07c8: f3 0f 10 05 a0 04 48 00     	movss	0x4804a0(%rip), %xmm0   # 0x145d70c70
1458f07d0: 45 31 c0                    	xorl	%r8d, %r8d
1458f07d3: eb 14                       	jmp	0x1458f07e9 <.text+0x58ef7e9>
1458f07d5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f07e0: 49 83 c0 02                 	addq	$0x2, %r8
1458f07e4: 4d 39 c1                    	cmpq	%r8, %r9
1458f07e7: 74 2f                       	je	0x1458f0818 <.text+0x58ef818>
1458f07e9: 42 80 3c c0 1c              	cmpb	$0x1c, (%rax,%r8,8)
1458f07ee: 74 10                       	je	0x1458f0800 <.text+0x58ef800>
1458f07f0: 42 80 7c c0 08 1c           	cmpb	$0x1c, 0x8(%rax,%r8,8)
1458f07f6: 75 e8                       	jne	0x1458f07e0 <.text+0x58ef7e0>
1458f07f8: eb 15                       	jmp	0x1458f080f <.text+0x58ef80f>
1458f07fa: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0800: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0807: 42 80 7c c0 08 1c           	cmpb	$0x1c, 0x8(%rax,%r8,8)
1458f080d: 75 d1                       	jne	0x1458f07e0 <.text+0x58ef7e0>
1458f080f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0816: eb c8                       	jmp	0x1458f07e0 <.text+0x58ef7e0>
1458f0818: f6 c1 01                    	testb	$0x1, %cl
1458f081b: 74 0e                       	je	0x1458f082b <.text+0x58ef82b>
1458f081d: 42 80 3c c0 1c              	cmpb	$0x1c, (%rax,%r8,8)
1458f0822: 75 07                       	jne	0x1458f082b <.text+0x58ef82b>
1458f0824: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f082b: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f082e: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f0832: f3 0f 11 4c 24 38           	movss	%xmm1, 0x38(%rsp)
1458f0838: 48 85 d2                    	testq	%rdx, %rdx
1458f083b: 0f 84 5b 06 00 00           	je	0x1458f0e9c <.text+0x58efe9c>
1458f0841: 49 89 c9                    	movq	%rcx, %r9
1458f0844: 49 83 e1 fe                 	andq	$-0x2, %r9
1458f0848: f3 0f 10 05 20 04 48 00     	movss	0x480420(%rip), %xmm0   # 0x145d70c70
1458f0850: 45 31 c0                    	xorl	%r8d, %r8d
1458f0853: eb 14                       	jmp	0x1458f0869 <.text+0x58ef869>
1458f0855: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1458f0860: 49 83 c0 02                 	addq	$0x2, %r8
1458f0864: 4d 39 c1                    	cmpq	%r8, %r9
1458f0867: 74 2f                       	je	0x1458f0898 <.text+0x58ef898>
1458f0869: 42 80 3c c0 10              	cmpb	$0x10, (%rax,%r8,8)
1458f086e: 74 10                       	je	0x1458f0880 <.text+0x58ef880>
1458f0870: 42 80 7c c0 08 10           	cmpb	$0x10, 0x8(%rax,%r8,8)
1458f0876: 75 e8                       	jne	0x1458f0860 <.text+0x58ef860>
1458f0878: eb 15                       	jmp	0x1458f088f <.text+0x58ef88f>
1458f087a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1458f0880: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f0887: 42 80 7c c0 08 10           	cmpb	$0x10, 0x8(%rax,%r8,8)
1458f088d: 75 d1                       	jne	0x1458f0860 <.text+0x58ef860>
1458f088f: f3 42 0f 58 44 c0 0c        	addss	0xc(%rax,%r8,8), %xmm0
1458f0896: eb c8                       	jmp	0x1458f0860 <.text+0x58ef860>
1458f0898: f6 c1 01                    	testb	$0x1, %cl
1458f089b: 74 0e                       	je	0x1458f08ab <.text+0x58ef8ab>
1458f089d: 42 80 3c c0 10              	cmpb	$0x10, (%rax,%r8,8)
1458f08a2: 75 07                       	jne	0x1458f08ab <.text+0x58ef8ab>
1458f08a4: f3 42 0f 58 44 c0 04        	addss	0x4(%rax,%r8,8), %xmm0
1458f08ab: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458f08ae: f3 0f 58 c8                 	addss	%xmm0, %xmm1
1458f08b2: f3 0f 11 4c 24 3c           	movss	%xmm1, 0x3c(%rsp)
1458f08b8: 48 85 d2                    	testq	%rdx, %rdx
1458f08bb: 0f 84 f6 05 00 00           	je	0x1458f0eb7 <.text+0x58efeb7>
1458f08c1: 49 89 c8                    	movq	%rcx, %r8
1458f08c4: 49 83 e0 fe                 	andq	$-0x2, %r8
1458f08c8: f3 0f 10 0d a0 03 48 00     	movss	0x4803a0(%rip), %xmm1   # 0x145d70c70
1458f08d0: 31 d2                       	xorl	%edx, %edx
1458f08d2: eb 15                       	jmp	0x1458f08e9 <.text+0x58ef8e9>
1458f08d4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1458f08e0: 48 83 c2 02                 	addq	$0x2, %rdx
1458f08e4: 49 39 d0                    	cmpq	%rdx, %r8
1458f08e7: 74 2c                       	je	0x1458f0915 <.text+0x58ef915>
1458f08e9: 80 3c d0 11                 	cmpb	$0x11, (%rax,%rdx,8)
1458f08ed: 74 11                       	je	0x1458f0900 <.text+0x58ef900>
1458f08ef: 80 7c d0 08 11              	cmpb	$0x11, 0x8(%rax,%rdx,8)
1458f08f4: 75 ea                       	jne	0x1458f08e0 <.text+0x58ef8e0>
1458f08f6: eb 15                       	jmp	0x1458f090d <.text+0x58ef90d>
1458f08f8: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1458f0900: f3 0f 58 4c d0 04           	addss	0x4(%rax,%rdx,8), %xmm1
1458f0906: 80 7c d0 08 11              	cmpb	$0x11, 0x8(%rax,%rdx,8)
1458f090b: 75 d3                       	jne	0x1458f08e0 <.text+0x58ef8e0>
1458f090d: f3 0f 58 4c d0 0c           	addss	0xc(%rax,%rdx,8), %xmm1
1458f0913: eb cb                       	jmp	0x1458f08e0 <.text+0x58ef8e0>
1458f0915: f6 c1 01                    	testb	$0x1, %cl
1458f0918: 74 0c                       	je	0x1458f0926 <.text+0x58ef926>
1458f091a: 80 3c d0 11                 	cmpb	$0x11, (%rax,%rdx,8)
1458f091e: 75 06                       	jne	0x1458f0926 <.text+0x58ef926>
1458f0920: f3 0f 58 4c d0 04           	addss	0x4(%rax,%rdx,8), %xmm1
1458f0926: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458f0929: f3 0f 58 c1                 	addss	%xmm1, %xmm0
1458f092d: eb 56                       	jmp	0x1458f0985 <.text+0x58ef985>
1458f092f: c7 44 24 24 00 00 00 00     	movl	$0x0, 0x24(%rsp)
1458f0937: 8b 86 bc 04 00 00           	movl	0x4bc(%rsi), %eax
1458f093d: 83 f8 03                    	cmpl	$0x3, %eax
1458f0940: b9 03 00 00 00              	movl	$0x3, %ecx
1458f0945: 0f 42 c8                    	cmovbl	%eax, %ecx
1458f0948: ff c1                       	incl	%ecx
1458f094a: 48 89 8c 24 80 00 00 00     	movq	%rcx, 0x80(%rsp)
1458f0952: c7 44 24 28 00 00 00 00     	movl	$0x0, 0x28(%rsp)
1458f095a: c7 44 24 2c 00 00 00 00     	movl	$0x0, 0x2c(%rsp)
1458f0962: c7 44 24 30 00 00 00 00     	movl	$0x0, 0x30(%rsp)
1458f096a: c7 44 24 34 00 00 00 00     	movl	$0x0, 0x34(%rsp)
1458f0972: c7 44 24 38 00 00 00 00     	movl	$0x0, 0x38(%rsp)
1458f097a: c7 44 24 3c 00 00 00 00     	movl	$0x0, 0x3c(%rsp)
1458f0982: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458f0985: 48 8d 86 c0 04 00 00        	leaq	0x4c0(%rsi), %rax
1458f098c: 48 89 84 24 a0 00 00 00     	movq	%rax, 0xa0(%rsp)
1458f0994: 48 8d 86 b8 04 00 00        	leaq	0x4b8(%rsi), %rax
1458f099b: 48 89 84 24 98 00 00 00     	movq	%rax, 0x98(%rsp)
1458f09a3: 48 8d 86 3c 05 00 00        	leaq	0x53c(%rsi), %rax
1458f09aa: 48 89 84 24 90 00 00 00     	movq	%rax, 0x90(%rsp)
1458f09b2: 48 8d 86 b4 04 00 00        	leaq	0x4b4(%rsi), %rax
1458f09b9: 48 89 84 24 88 00 00 00     	movq	%rax, 0x88(%rsp)
1458f09c1: 4c 8d 9e a8 04 00 00        	leaq	0x4a8(%rsi), %r11
1458f09c8: 48 8d 9e a4 04 00 00        	leaq	0x4a4(%rsi), %rbx
1458f09cf: 4c 8d b6 94 04 00 00        	leaq	0x494(%rsi), %r14
1458f09d6: 4c 8d be 90 04 00 00        	leaq	0x490(%rsi), %r15
1458f09dd: 4c 8d a6 8c 04 00 00        	leaq	0x48c(%rsi), %r12
1458f09e4: 4c 8d ae b0 04 00 00        	leaq	0x4b0(%rsi), %r13
1458f09eb: 4c 8d 96 ac 04 00 00        	leaq	0x4ac(%rsi), %r10
1458f09f2: 48 8d ae a0 04 00 00        	leaq	0x4a0(%rsi), %rbp
1458f09f9: 49 89 f0                    	movq	%rsi, %r8
1458f09fc: 48 81 c6 9c 04 00 00        	addq	$0x49c, %rsi            # imm = 0x49C
1458f0a03: 4d 8d 88 98 04 00 00        	leaq	0x498(%r8), %r9
1458f0a0a: 49 8d b8 88 04 00 00        	leaq	0x488(%r8), %rdi
1458f0a11: 49 8d 90 84 04 00 00        	leaq	0x484(%r8), %rdx
1458f0a18: 49 8d 88 80 04 00 00        	leaq	0x480(%r8), %rcx
1458f0a1f: 49 8d 80 7c 04 00 00        	leaq	0x47c(%r8), %rax
1458f0a26: 49 81 c0 78 04 00 00        	addq	$0x478, %r8             # imm = 0x478
1458f0a2d: 4c 89 84 24 b0 00 00 00     	movq	%r8, 0xb0(%rsp)
1458f0a35: 4c 8d 05 44 c8 2b 00        	leaq	0x2bc844(%rip), %r8     # 0x145bad280 <.text+0x5bac280>
1458f0a3c: 4c 89 84 24 b8 00 00 00     	movq	%r8, 0xb8(%rsp)
1458f0a44: 48 89 84 24 c0 00 00 00     	movq	%rax, 0xc0(%rsp)
1458f0a4c: 4c 89 84 24 c8 00 00 00     	movq	%r8, 0xc8(%rsp)
1458f0a54: 48 89 8c 24 d0 00 00 00     	movq	%rcx, 0xd0(%rsp)
1458f0a5c: 4c 89 84 24 d8 00 00 00     	movq	%r8, 0xd8(%rsp)
1458f0a64: 48 89 94 24 e0 00 00 00     	movq	%rdx, 0xe0(%rsp)
1458f0a6c: 4c 89 84 24 e8 00 00 00     	movq	%r8, 0xe8(%rsp)
1458f0a74: 48 89 bc 24 f0 00 00 00     	movq	%rdi, 0xf0(%rsp)
1458f0a7c: 4c 89 84 24 f8 00 00 00     	movq	%r8, 0xf8(%rsp)
1458f0a84: 4c 89 8c 24 00 01 00 00     	movq	%r9, 0x100(%rsp)
1458f0a8c: 4c 89 84 24 08 01 00 00     	movq	%r8, 0x108(%rsp)
1458f0a94: 48 89 b4 24 10 01 00 00     	movq	%rsi, 0x110(%rsp)
1458f0a9c: 4c 89 84 24 18 01 00 00     	movq	%r8, 0x118(%rsp)
1458f0aa4: 48 89 ac 24 20 01 00 00     	movq	%rbp, 0x120(%rsp)
1458f0aac: 4c 89 84 24 28 01 00 00     	movq	%r8, 0x128(%rsp)
1458f0ab4: 4c 89 94 24 30 01 00 00     	movq	%r10, 0x130(%rsp)
1458f0abc: 4c 8d 0d bd d4 2b 00        	leaq	0x2bd4bd(%rip), %r9     # 0x145badf80 <.text+0x5bacf80>
1458f0ac3: 4c 89 8c 24 38 01 00 00     	movq	%r9, 0x138(%rsp)
1458f0acb: 4c 89 ac 24 40 01 00 00     	movq	%r13, 0x140(%rsp)
1458f0ad3: 4c 89 84 24 48 01 00 00     	movq	%r8, 0x148(%rsp)
1458f0adb: 4c 89 a4 24 50 01 00 00     	movq	%r12, 0x150(%rsp)
1458f0ae3: 4c 89 84 24 58 01 00 00     	movq	%r8, 0x158(%rsp)
1458f0aeb: 4c 89 bc 24 60 01 00 00     	movq	%r15, 0x160(%rsp)
1458f0af3: 4c 89 84 24 68 01 00 00     	movq	%r8, 0x168(%rsp)
1458f0afb: 4c 89 b4 24 70 01 00 00     	movq	%r14, 0x170(%rsp)
1458f0b03: 4c 89 84 24 78 01 00 00     	movq	%r8, 0x178(%rsp)
1458f0b0b: 48 89 9c 24 80 01 00 00     	movq	%rbx, 0x180(%rsp)
1458f0b13: 4c 89 84 24 88 01 00 00     	movq	%r8, 0x188(%rsp)
1458f0b1b: 4c 89 9c 24 90 01 00 00     	movq	%r11, 0x190(%rsp)
1458f0b23: 4c 89 84 24 98 01 00 00     	movq	%r8, 0x198(%rsp)
1458f0b2b: 48 8b 84 24 88 00 00 00     	movq	0x88(%rsp), %rax
1458f0b33: 48 89 84 24 a0 01 00 00     	movq	%rax, 0x1a0(%rsp)
1458f0b3b: 4c 89 84 24 a8 01 00 00     	movq	%r8, 0x1a8(%rsp)
1458f0b43: 48 8d 44 24 40              	leaq	0x40(%rsp), %rax
1458f0b48: 48 89 84 24 b0 01 00 00     	movq	%rax, 0x1b0(%rsp)
1458f0b50: 48 8d 44 24 44              	leaq	0x44(%rsp), %rax
1458f0b55: 4c 89 84 24 b8 01 00 00     	movq	%r8, 0x1b8(%rsp)
1458f0b5d: 48 89 84 24 c0 01 00 00     	movq	%rax, 0x1c0(%rsp)
1458f0b65: 48 8d 44 24 48              	leaq	0x48(%rsp), %rax
1458f0b6a: 4c 89 84 24 c8 01 00 00     	movq	%r8, 0x1c8(%rsp)
1458f0b72: 48 89 84 24 d0 01 00 00     	movq	%rax, 0x1d0(%rsp)
1458f0b7a: 48 8d 44 24 4c              	leaq	0x4c(%rsp), %rax
1458f0b7f: 4c 89 84 24 d8 01 00 00     	movq	%r8, 0x1d8(%rsp)
1458f0b87: 48 89 84 24 e0 01 00 00     	movq	%rax, 0x1e0(%rsp)
1458f0b8f: 48 8d 44 24 50              	leaq	0x50(%rsp), %rax
1458f0b94: 4c 89 84 24 e8 01 00 00     	movq	%r8, 0x1e8(%rsp)
1458f0b9c: 48 89 84 24 f0 01 00 00     	movq	%rax, 0x1f0(%rsp)
1458f0ba4: 48 8d 44 24 54              	leaq	0x54(%rsp), %rax
1458f0ba9: 4c 89 84 24 f8 01 00 00     	movq	%r8, 0x1f8(%rsp)
1458f0bb1: 48 89 84 24 00 02 00 00     	movq	%rax, 0x200(%rsp)
1458f0bb9: 48 8d 44 24 58              	leaq	0x58(%rsp), %rax
1458f0bbe: 4c 89 84 24 08 02 00 00     	movq	%r8, 0x208(%rsp)
1458f0bc6: 48 89 84 24 10 02 00 00     	movq	%rax, 0x210(%rsp)
1458f0bce: 48 8d 44 24 5c              	leaq	0x5c(%rsp), %rax
1458f0bd3: 4c 89 84 24 18 02 00 00     	movq	%r8, 0x218(%rsp)
1458f0bdb: 48 89 84 24 20 02 00 00     	movq	%rax, 0x220(%rsp)
1458f0be3: 4c 89 84 24 28 02 00 00     	movq	%r8, 0x228(%rsp)
1458f0beb: 48 8d 44 24 74              	leaq	0x74(%rsp), %rax
1458f0bf0: 48 89 84 24 30 02 00 00     	movq	%rax, 0x230(%rsp)
1458f0bf8: 48 8d 44 24 64              	leaq	0x64(%rsp), %rax
1458f0bfd: 4c 89 8c 24 38 02 00 00     	movq	%r9, 0x238(%rsp)
1458f0c05: 48 89 84 24 40 02 00 00     	movq	%rax, 0x240(%rsp)
1458f0c0d: 48 8d 44 24 68              	leaq	0x68(%rsp), %rax
1458f0c12: 4c 89 84 24 48 02 00 00     	movq	%r8, 0x248(%rsp)
1458f0c1a: 48 89 84 24 50 02 00 00     	movq	%rax, 0x250(%rsp)
1458f0c22: 48 8d 44 24 6c              	leaq	0x6c(%rsp), %rax
1458f0c27: 4c 89 84 24 58 02 00 00     	movq	%r8, 0x258(%rsp)
1458f0c2f: 48 89 84 24 60 02 00 00     	movq	%rax, 0x260(%rsp)
1458f0c37: 48 8d 44 24 70              	leaq	0x70(%rsp), %rax
1458f0c3c: 4c 89 84 24 68 02 00 00     	movq	%r8, 0x268(%rsp)
1458f0c44: 48 89 84 24 70 02 00 00     	movq	%rax, 0x270(%rsp)
1458f0c4c: 4c 89 84 24 78 02 00 00     	movq	%r8, 0x278(%rsp)
1458f0c54: 48 8d 44 24 78              	leaq	0x78(%rsp), %rax
1458f0c59: 48 89 84 24 80 02 00 00     	movq	%rax, 0x280(%rsp)
1458f0c61: 4c 89 84 24 88 02 00 00     	movq	%r8, 0x288(%rsp)
1458f0c69: 48 8d 44 24 24              	leaq	0x24(%rsp), %rax
1458f0c6e: 48 89 84 24 90 02 00 00     	movq	%rax, 0x290(%rsp)
1458f0c76: 4c 89 84 24 98 02 00 00     	movq	%r8, 0x298(%rsp)
1458f0c7e: 48 8b 84 24 90 00 00 00     	movq	0x90(%rsp), %rax
1458f0c86: 48 89 84 24 a0 02 00 00     	movq	%rax, 0x2a0(%rsp)
1458f0c8e: 4c 89 8c 24 a8 02 00 00     	movq	%r9, 0x2a8(%rsp)
1458f0c96: 48 8b 84 24 98 00 00 00     	movq	0x98(%rsp), %rax
1458f0c9e: 48 89 84 24 b0 02 00 00     	movq	%rax, 0x2b0(%rsp)
1458f0ca6: 4c 89 84 24 b8 02 00 00     	movq	%r8, 0x2b8(%rsp)
1458f0cae: 48 8d 84 24 80 00 00 00     	leaq	0x80(%rsp), %rax
1458f0cb6: 48 89 84 24 c0 02 00 00     	movq	%rax, 0x2c0(%rsp)
1458f0cbe: 48 8d 05 ab e1 2b 00        	leaq	0x2be1ab(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458f0cc5: 48 89 84 24 c8 02 00 00     	movq	%rax, 0x2c8(%rsp)
1458f0ccd: 48 8b 84 24 a0 00 00 00     	movq	0xa0(%rsp), %rax
1458f0cd5: 48 89 84 24 d0 02 00 00     	movq	%rax, 0x2d0(%rsp)
1458f0cdd: 4c 89 84 24 d8 02 00 00     	movq	%r8, 0x2d8(%rsp)
1458f0ce5: 48 8d 44 24 28              	leaq	0x28(%rsp), %rax
1458f0cea: 48 89 84 24 e0 02 00 00     	movq	%rax, 0x2e0(%rsp)
1458f0cf2: 4c 89 84 24 e8 02 00 00     	movq	%r8, 0x2e8(%rsp)
1458f0cfa: 48 8d 44 24 2c              	leaq	0x2c(%rsp), %rax
1458f0cff: 48 89 84 24 f0 02 00 00     	movq	%rax, 0x2f0(%rsp)
1458f0d07: 4c 89 84 24 f8 02 00 00     	movq	%r8, 0x2f8(%rsp)
1458f0d0f: 48 8d 44 24 30              	leaq	0x30(%rsp), %rax
1458f0d14: 48 89 84 24 00 03 00 00     	movq	%rax, 0x300(%rsp)
1458f0d1c: 4c 89 84 24 08 03 00 00     	movq	%r8, 0x308(%rsp)
1458f0d24: 48 8d 44 24 34              	leaq	0x34(%rsp), %rax
1458f0d29: 48 89 84 24 10 03 00 00     	movq	%rax, 0x310(%rsp)
1458f0d31: 4c 89 84 24 18 03 00 00     	movq	%r8, 0x318(%rsp)
1458f0d39: 48 8d 44 24 38              	leaq	0x38(%rsp), %rax
1458f0d3e: 48 89 84 24 20 03 00 00     	movq	%rax, 0x320(%rsp)
1458f0d46: 4c 89 84 24 28 03 00 00     	movq	%r8, 0x328(%rsp)
1458f0d4e: 48 8d 44 24 3c              	leaq	0x3c(%rsp), %rax
1458f0d53: 48 89 84 24 30 03 00 00     	movq	%rax, 0x330(%rsp)
1458f0d5b: 4c 89 84 24 38 03 00 00     	movq	%r8, 0x338(%rsp)
1458f0d63: 48 8d 44 24 7c              	leaq	0x7c(%rsp), %rax
1458f0d68: 48 89 84 24 40 03 00 00     	movq	%rax, 0x340(%rsp)
1458f0d70: 4c 89 84 24 48 03 00 00     	movq	%r8, 0x348(%rsp)
1458f0d78: f3 0f 11 44 24 7c           	movss	%xmm0, 0x7c(%rsp)
1458f0d7e: 48 8d 15 79 81 58 01        	leaq	0x1588179(%rip), %rdx   # 0x146e78efe
1458f0d85: 4c 8d 84 24 b0 00 00 00     	leaq	0xb0(%rsp), %r8
1458f0d8d: 48 8b b4 24 a8 00 00 00     	movq	0xa8(%rsp), %rsi
1458f0d95: 48 89 f1                    	movq	%rsi, %rcx
1458f0d98: e8 33 b7 2a 00              	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458f0d9d: 48 89 f0                    	movq	%rsi, %rax
1458f0da0: 0f 28 b4 24 50 03 00 00     	movaps	0x350(%rsp), %xmm6
1458f0da8: 0f 28 bc 24 60 03 00 00     	movaps	0x360(%rsp), %xmm7
1458f0db0: 44 0f 28 84 24 70 03 00 00  	movaps	0x370(%rsp), %xmm8
1458f0db9: 44 0f 28 8c 24 80 03 00 00  	movaps	0x380(%rsp), %xmm9
1458f0dc2: 44 0f 28 94 24 90 03 00 00  	movaps	0x390(%rsp), %xmm10
1458f0dcb: 44 0f 28 9c 24 a0 03 00 00  	movaps	0x3a0(%rsp), %xmm11
1458f0dd4: 44 0f 28 a4 24 b0 03 00 00  	movaps	0x3b0(%rsp), %xmm12
1458f0ddd: 44 0f 28 ac 24 c0 03 00 00  	movaps	0x3c0(%rsp), %xmm13
1458f0de6: 48 81 c4 d8 03 00 00        	addq	$0x3d8, %rsp            # imm = 0x3D8
1458f0ded: 5b                          	popq	%rbx
1458f0dee: 5d                          	popq	%rbp
1458f0def: 5f                          	popq	%rdi
1458f0df0: 5e                          	popq	%rsi
1458f0df1: 41 5c                       	popq	%r12
1458f0df3: 41 5d                       	popq	%r13
1458f0df5: 41 5e                       	popq	%r14
1458f0df7: 41 5f                       	popq	%r15
1458f0df9: c3                          	retq
1458f0dfa: 45 31 c0                    	xorl	%r8d, %r8d
1458f0dfd: f3 0f 10 05 6b fe 47 00     	movss	0x47fe6b(%rip), %xmm0   # 0x145d70c70
1458f0e05: 42 80 3c c0 16              	cmpb	$0x16, (%rax,%r8,8)
1458f0e0a: 0f 84 74 f7 ff ff           	je	0x1458f0584 <.text+0x58ef584>
1458f0e10: e9 76 f7 ff ff              	jmp	0x1458f058b <.text+0x58ef58b>
1458f0e15: f3 0f 10 05 53 fe 47 00     	movss	0x47fe53(%rip), %xmm0   # 0x145d70c70
1458f0e1d: 45 31 c0                    	xorl	%r8d, %r8d
1458f0e20: 42 80 3c c0 13              	cmpb	$0x13, (%rax,%r8,8)
1458f0e25: 0f 84 f9 f7 ff ff           	je	0x1458f0624 <.text+0x58ef624>
1458f0e2b: e9 fb f7 ff ff              	jmp	0x1458f062b <.text+0x58ef62b>
1458f0e30: f3 0f 10 05 38 fe 47 00     	movss	0x47fe38(%rip), %xmm0   # 0x145d70c70
1458f0e38: 45 31 c0                    	xorl	%r8d, %r8d
1458f0e3b: 42 80 3c c0 14              	cmpb	$0x14, (%rax,%r8,8)
1458f0e40: 0f 84 5e f8 ff ff           	je	0x1458f06a4 <.text+0x58ef6a4>
1458f0e46: e9 60 f8 ff ff              	jmp	0x1458f06ab <.text+0x58ef6ab>
1458f0e4b: f3 0f 10 05 1d fe 47 00     	movss	0x47fe1d(%rip), %xmm0   # 0x145d70c70
1458f0e53: 45 31 c0                    	xorl	%r8d, %r8d
1458f0e56: 42 80 3c c0 12              	cmpb	$0x12, (%rax,%r8,8)
1458f0e5b: 0f 84 c3 f8 ff ff           	je	0x1458f0724 <.text+0x58ef724>
1458f0e61: e9 c5 f8 ff ff              	jmp	0x1458f072b <.text+0x58ef72b>
1458f0e66: f3 0f 10 05 02 fe 47 00     	movss	0x47fe02(%rip), %xmm0   # 0x145d70c70
1458f0e6e: 45 31 c0                    	xorl	%r8d, %r8d
1458f0e71: 42 80 3c c0 15              	cmpb	$0x15, (%rax,%r8,8)
1458f0e76: 0f 84 28 f9 ff ff           	je	0x1458f07a4 <.text+0x58ef7a4>
1458f0e7c: e9 2a f9 ff ff              	jmp	0x1458f07ab <.text+0x58ef7ab>
1458f0e81: f3 0f 10 05 e7 fd 47 00     	movss	0x47fde7(%rip), %xmm0   # 0x145d70c70
1458f0e89: 45 31 c0                    	xorl	%r8d, %r8d
1458f0e8c: 42 80 3c c0 1c              	cmpb	$0x1c, (%rax,%r8,8)
1458f0e91: 0f 84 8d f9 ff ff           	je	0x1458f0824 <.text+0x58ef824>
1458f0e97: e9 8f f9 ff ff              	jmp	0x1458f082b <.text+0x58ef82b>
1458f0e9c: f3 0f 10 05 cc fd 47 00     	movss	0x47fdcc(%rip), %xmm0   # 0x145d70c70
1458f0ea4: 45 31 c0                    	xorl	%r8d, %r8d
1458f0ea7: 42 80 3c c0 10              	cmpb	$0x10, (%rax,%r8,8)
1458f0eac: 0f 84 f2 f9 ff ff           	je	0x1458f08a4 <.text+0x58ef8a4>
1458f0eb2: e9 f4 f9 ff ff              	jmp	0x1458f08ab <.text+0x58ef8ab>
1458f0eb7: f3 0f 10 0d b1 fd 47 00     	movss	0x47fdb1(%rip), %xmm1   # 0x145d70c70
1458f0ebf: 31 d2                       	xorl	%edx, %edx
1458f0ec1: 80 3c d0 11                 	cmpb	$0x11, (%rax,%rdx,8)
1458f0ec5: 0f 84 55 fa ff ff           	je	0x1458f0920 <.text+0x58ef920>
1458f0ecb: e9 56 fa ff ff              	jmp	0x1458f0926 <.text+0x58ef926>
