
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a46c0: f3 0f 58 41 74              	addss	0x74(%rcx), %xmm0
1454a46c5: f3 0f 11 41 70              	movss	%xmm0, 0x70(%rcx)
1454a46ca: 49 8b 95 18 05 00 00        	movq	0x518(%r13), %rdx
1454a46d1: 49 39 d7                    	cmpq	%rdx, %r15
1454a46d4: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a46d9: 0f 83 53 67 00 00           	jae	0x1454aae32 <.text+0x54a9e32>
1454a46df: 49 8b 8d 10 05 00 00        	movq	0x510(%r13), %rcx
1454a46e6: 4e 8d 3c 31                 	leaq	(%rcx,%r14), %r15
1454a46ea: 4a 8b 44 31 58              	movq	0x58(%rcx,%r14), %rax
1454a46ef: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
1454a46f6: 4a 8b 44 31 60              	movq	0x60(%rcx,%r14), %rax
1454a46fb: 42 8b 54 31 68              	movl	0x68(%rcx,%r14), %edx
1454a4700: 89 55 70                    	movl	%edx, 0x70(%rbp)
1454a4703: 48 89 45 68                 	movq	%rax, 0x68(%rbp)
1454a4707: 49 8b 85 a0 02 00 00        	movq	0x2a0(%r13), %rax
1454a470e: 4a 8b 34 31                 	movq	(%rcx,%r14), %rsi
1454a4712: 48 85 c0                    	testq	%rax, %rax
1454a4715: 74 64                       	je	0x1454a477b <.text+0x54a377b>
1454a4717: 49 8b bd 98 02 00 00        	movq	0x298(%r13), %rdi
1454a471e: 4c 6b e0 58                 	imulq	$0x58, %rax, %r12
1454a4722: 48 8b 1e                    	movq	(%rsi), %rbx
1454a4725: 48 89 b5 58 03 00 00        	movq	%rsi, 0x358(%rbp)
1454a472c: 4c 8b 76 08                 	movq	0x8(%rsi), %r14
1454a4730: eb 18                       	jmp	0x1454a474a <.text+0x54a374a>
1454a4732: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1454a4740: 48 83 c7 58                 	addq	$0x58, %rdi
1454a4744: 49 83 c4 a8                 	addq	$-0x58, %r12
1454a4748: 74 25                       	je	0x1454a476f <.text+0x54a376f>
1454a474a: 48 8b 37                    	movq	(%rdi), %rsi
1454a474d: 4c 39 76 08                 	cmpq	%r14, 0x8(%rsi)
1454a4751: 75 ed                       	jne	0x1454a4740 <.text+0x54a3740>
1454a4753: 48 8b 0e                    	movq	(%rsi), %rcx
1454a4756: 48 89 da                    	movq	%rbx, %rdx
1454a4759: 4d 89 f0                    	movq	%r14, %r8
1454a475c: e8 76 26 2b 00              	callq	0x145756dd7 <.text+0x5755dd7>
1454a4761: 85 c0                       	testl	%eax, %eax
1454a4763: 75 db                       	jne	0x1454a4740 <.text+0x54a3740>
1454a4765: 49 89 ff                    	movq	%rdi, %r15
1454a4768: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a476d: eb 0c                       	jmp	0x1454a477b <.text+0x54a377b>
1454a476f: 66 41 bc 16 00              	movw	$0x16, %r12w
1454a4774: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a477b: f3 45 0f 10 4f 10           	movss	0x10(%r15), %xmm9
1454a4781: 41 8b 7f 18                 	movl	0x18(%r15), %edi
1454a4785: f3 45 0f 10 57 4c           	movss	0x4c(%r15), %xmm10
1454a478b: f3 45 0f 10 5f 44           	movss	0x44(%r15), %xmm11
1454a4791: 41 8b 5f 40                 	movl	0x40(%r15), %ebx
1454a4795: f3 45 0f 10 67 38           	movss	0x38(%r15), %xmm12
1454a479b: f3 41 0f 10 67 1c           	movss	0x1c(%r15), %xmm4
1454a47a1: 49 8b 85 00 07 00 00        	movq	0x700(%r13), %rax
1454a47a8: 48 85 c0                    	testq	%rax, %rax
1454a47ab: 66 41 bf 1c 00              	movw	$0x1c, %r15w
1454a47b0: 48 89 b5 58 03 00 00        	movq	%rsi, 0x358(%rbp)
1454a47b7: 0f 84 53 04 00 00           	je	0x1454a4c10 <.text+0x54a3c10>
1454a47bd: 49 8b 8d f8 06 00 00        	movq	0x6f8(%r13), %rcx
1454a47c4: 48 83 f8 01                 	cmpq	$0x1, %rax
1454a47c8: 75 0c                       	jne	0x1454a47d6 <.text+0x54a37d6>
1454a47ca: 31 d2                       	xorl	%edx, %edx
1454a47cc: f3 0f 10 3d a8 1e 45 00     	movss	0x451ea8(%rip), %xmm7   # 0x1458f667c
1454a47d4: eb 52                       	jmp	0x1454a4828 <.text+0x54a3828>
1454a47d6: 49 89 c0                    	movq	%rax, %r8
1454a47d9: 49 83 e0 fe                 	andq	$-0x2, %r8
1454a47dd: 4c 8d 49 44                 	leaq	0x44(%rcx), %r9
1454a47e1: 31 d2                       	xorl	%edx, %edx
1454a47e3: f3 0f 10 3d 91 1e 45 00     	movss	0x451e91(%rip), %xmm7   # 0x1458f667c
1454a47eb: eb 10                       	jmp	0x1454a47fd <.text+0x54a37fd>
1454a47ed: 0f 1f 00                    	nopl	(%rax)
1454a47f0: 48 83 c2 02                 	addq	$0x2, %rdx
1454a47f4: 49 83 e9 80                 	subq	$-0x80, %r9
1454a47f8: 49 39 d0                    	cmpq	%rdx, %r8
1454a47fb: 74 27                       	je	0x1454a4824 <.text+0x54a3824>
1454a47fd: 41 80 79 bc 16              	cmpb	$0x16, -0x44(%r9)
1454a4802: 74 0c                       	je	0x1454a4810 <.text+0x54a3810>
1454a4804: 41 80 79 fc 16              	cmpb	$0x16, -0x4(%r9)
1454a4809: 75 e5                       	jne	0x1454a47f0 <.text+0x54a37f0>
1454a480b: eb 10                       	jmp	0x1454a481d <.text+0x54a381d>
1454a480d: 0f 1f 00                    	nopl	(%rax)
1454a4810: f3 41 0f 58 79 c0           	addss	-0x40(%r9), %xmm7
1454a4816: 41 80 79 fc 16              	cmpb	$0x16, -0x4(%r9)
1454a481b: 75 d3                       	jne	0x1454a47f0 <.text+0x54a37f0>
1454a481d: f3 41 0f 58 39              	addss	(%r9), %xmm7
1454a4822: eb cc                       	jmp	0x1454a47f0 <.text+0x54a37f0>
1454a4824: a8 01                       	testb	$0x1, %al
1454a4826: 74 10                       	je	0x1454a4838 <.text+0x54a3838>
1454a4828: 48 c1 e2 06                 	shlq	$0x6, %rdx
1454a482c: 80 3c 11 16                 	cmpb	$0x16, (%rcx,%rdx)
1454a4830: 75 06                       	jne	0x1454a4838 <.text+0x54a3838>
1454a4832: f3 0f 58 7c 11 04           	addss	0x4(%rcx,%rdx), %xmm7
1454a4838: 41 0f 2e ff                 	ucomiss	%xmm15, %xmm7
1454a483c: 0f 86 ce 03 00 00           	jbe	0x1454a4c10 <.text+0x54a3c10>
1454a4842: 89 bd 28 03 00 00           	movl	%edi, 0x328(%rbp)
1454a4848: 45 0f 28 f3                 	movaps	%xmm11, %xmm14
1454a484c: 48 c1 e0 06                 	shlq	$0x6, %rax
1454a4850: 48 8b 95 90 02 00 00        	movq	0x290(%rbp), %rdx
1454a4857: f3 44 0f 10 1a              	movss	(%rdx), %xmm11
1454a485c: f3 41 0f 59 fb              	mulss	%xmm11, %xmm7
1454a4861: 31 d2                       	xorl	%edx, %edx
1454a4863: 31 ff                       	xorl	%edi, %edi
1454a4865: 45 31 c0                    	xorl	%r8d, %r8d
1454a4868: f3 0f 11 a5 a0 02 00 00     	movss	%xmm4, 0x2a0(%rbp)
1454a4870: 80 3c 11 16                 	cmpb	$0x16, (%rcx,%rdx)
1454a4874: 74 12                       	je	0x1454a4888 <.text+0x54a3888>
1454a4876: 49 ff c0                    	incq	%r8
1454a4879: 48 83 c7 28                 	addq	$0x28, %rdi
1454a487d: 48 83 c2 40                 	addq	$0x40, %rdx
1454a4881: 48 39 d0                    	cmpq	%rdx, %rax
1454a4884: 75 ea                       	jne	0x1454a4870 <.text+0x54a3870>
1454a4886: eb 3c                       	jmp	0x1454a48c4 <.text+0x54a38c4>
1454a4888: 4d 3b 85 18 07 00 00        	cmpq	0x718(%r13), %r8
1454a488f: 73 33                       	jae	0x1454a48c4 <.text+0x54a38c4>
1454a4891: 49 8b b5 10 07 00 00        	movq	0x710(%r13), %rsi
1454a4898: 48 8d 14 3e                 	leaq	(%rsi,%rdi), %rdx
1454a489c: 48 8d 8d 30 02 00 00        	leaq	0x230(%rbp), %rcx
1454a48a3: e8 b8 94 58 fb              	callq	0x140a2dd60 <.text+0xa2cd60>
1454a48a8: 0f 10 44 3e 18              	movups	0x18(%rsi,%rdi), %xmm0
1454a48ad: 0f 11 85 48 02 00 00        	movups	%xmm0, 0x248(%rbp)
1454a48b4: c6 85 58 02 00 00 01        	movb	$0x1, 0x258(%rbp)
1454a48bb: 48 8b 95 30 02 00 00        	movq	0x230(%rbp), %rdx
1454a48c2: eb 12                       	jmp	0x1454a48d6 <.text+0x54a38d6>
1454a48c4: 48 c7 85 30 02 00 00 fe ff ff ff    	movq	$-0x2, 0x230(%rbp)
1454a48cf: 48 c7 c2 fe ff ff ff        	movq	$-0x2, %rdx
1454a48d6: f3 41 0f 10 85 00 04 00 00  	movss	0x400(%r13), %xmm0
1454a48df: f3 0f 58 f8                 	addss	%xmm0, %xmm7
1454a48e3: 0f 28 cf                    	movaps	%xmm7, %xmm1
1454a48e6: f3 41 0f 5d cb              	minss	%xmm11, %xmm1
1454a48eb: 44 0f 28 d9                 	movaps	%xmm1, %xmm11
1454a48ef: f3 44 0f c2 d9 03           	cmpunordss	%xmm1, %xmm11
1454a48f5: 41 0f 54 fb                 	andps	%xmm11, %xmm7
1454a48f9: 44 0f 55 d9                 	andnps	%xmm1, %xmm11
1454a48fd: 44 0f 56 df                 	orps	%xmm7, %xmm11
1454a4901: f3 45 0f 11 9d 00 04 00 00  	movss	%xmm11, 0x400(%r13)
1454a490a: f3 44 0f 5c d8              	subss	%xmm0, %xmm11
1454a490f: 45 0f 2e fb                 	ucomiss	%xmm11, %xmm15
1454a4913: 73 61                       	jae	0x1454a4976 <.text+0x54a3976>
1454a4915: 48 83 fa fe                 	cmpq	$-0x2, %rdx
1454a4919: 75 7a                       	jne	0x1454a4995 <.text+0x54a3995>
1454a491b: ba 05 00 00 00              	movl	$0x5, %edx
1454a4920: 48 8d 35 a9 66 50 01        	leaq	0x15066a9(%rip), %rsi   # 0x1469aafd0
1454a4927: 48 89 f1                    	movq	%rsi, %rcx
1454a492a: e8 d1 da fa ff              	callq	0x145452400 <.text+0x5451400>
1454a492f: 48 85 c0                    	testq	%rax, %rax
1454a4932: 48 0f 44 c6                 	cmoveq	%rsi, %rax
1454a4936: b9 05 00 00 00              	movl	$0x5, %ecx
1454a493b: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
1454a493f: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4946: 48 89 95 b0 00 00 00        	movq	%rdx, 0xb0(%rbp)
1454a494d: 48 8d 05 81 66 50 01        	leaq	0x1506681(%rip), %rax   # 0x1469aafd5
1454a4954: 48 89 85 b8 00 00 00        	movq	%rax, 0xb8(%rbp)
1454a495b: 48 c7 85 c0 00 00 00 18 00 00 00    	movq	$0x18, 0xc0(%rbp)
1454a4966: c6 85 c8 00 00 00 00        	movb	$0x0, 0xc8(%rbp)
1454a496d: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4974: eb 46                       	jmp	0x1454a49bc <.text+0x54a39bc>
1454a4976: 48 83 fa fd                 	cmpq	$-0x3, %rdx
1454a497a: 77 5f                       	ja	0x1454a49db <.text+0x54a39db>
1454a497c: 48 85 d2                    	testq	%rdx, %rdx
1454a497f: 74 5a                       	je	0x1454a49db <.text+0x54a39db>
1454a4981: 48 8b 8d 38 02 00 00        	movq	0x238(%rbp), %rcx
1454a4988: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454a498e: e8 3d d8 b5 fa              	callq	0x1400021d0 <.text+0x11d0>
1454a4993: eb 46                       	jmp	0x1454a49db <.text+0x54a39db>
1454a4995: 4c 8d 85 38 02 00 00        	leaq	0x238(%rbp), %r8
1454a499c: 49 8b 40 20                 	movq	0x20(%r8), %rax
1454a49a0: 48 8d 8d c4 00 00 00        	leaq	0xc4(%rbp), %rcx
1454a49a7: 48 89 41 04                 	movq	%rax, 0x4(%rcx)
1454a49ab: 41 0f 10 00                 	movups	(%r8), %xmm0
1454a49af: 41 0f 10 48 10              	movups	0x10(%r8), %xmm1
1454a49b4: 0f 11 49 f4                 	movups	%xmm1, -0xc(%rcx)
1454a49b8: 0f 11 41 e4                 	movups	%xmm0, -0x1c(%rcx)
1454a49bc: 48 89 95 a0 00 00 00        	movq	%rdx, 0xa0(%rbp)
1454a49c3: f3 41 0f 5a d3              	cvtss2sd	%xmm11, %xmm2
1454a49c8: 48 8b 8d 80 00 00 00        	movq	0x80(%rbp), %rcx
1454a49cf: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a49d6: e8 a5 b5 04 00              	callq	0x1454eff80 <.text+0x54eef80>
1454a49db: f3 41 0f 10 85 00 04 00 00  	movss	0x400(%r13), %xmm0
1454a49e4: f3 41 0f 10 bd 58 04 00 00  	movss	0x458(%r13), %xmm7
1454a49ed: 45 0f 57 db                 	xorps	%xmm11, %xmm11
1454a49f1: f3 41 0f 5f c3              	maxss	%xmm11, %xmm0
1454a49f6: e8 72 24 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
1454a49fb: f3 4c 0f 2c f0              	cvttss2si	%xmm0, %r14
1454a4a00: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a4a04: be 00 00 00 00              	movl	$0x0, %esi
1454a4a09: 44 0f 42 f6                 	cmovbl	%esi, %r14d
1454a4a0d: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a4a11: bf ff ff ff ff              	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454a4a16: 44 0f 47 f7                 	cmoval	%edi, %r14d
1454a4a1a: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454a4a1d: e8 4b 24 2b 00              	callq	0x145756e6d <.text+0x5755e6d>
1454a4a22: f3 4c 0f 2c c0              	cvttss2si	%xmm0, %r8
1454a4a27: 45 0f 57 ff                 	xorps	%xmm15, %xmm15
1454a4a2b: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1454a4a2f: 44 0f 42 c6                 	cmovbl	%esi, %r8d
1454a4a33: 41 0f 2e c5                 	ucomiss	%xmm13, %xmm0
1454a4a37: 44 0f 47 c7                 	cmoval	%edi, %r8d
1454a4a3b: 49 8b 85 b8 08 00 00        	movq	0x8b8(%r13), %rax
1454a4a42: 48 85 c0                    	testq	%rax, %rax
1454a4a45: 0f 84 fe 00 00 00           	je	0x1454a4b49 <.text+0x54a3b49>
1454a4a4b: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
1454a4a52: 45 0f 28 de                 	movaps	%xmm14, %xmm11
1454a4a56: 8b bd 28 03 00 00           	movl	0x328(%rbp), %edi
1454a4a5c: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4a64: 44 0f b7 58 36              	movzwl	0x36(%rax), %r11d
1454a4a69: 45 89 d9                    	movl	%r11d, %r9d
1454a4a6c: 45 01 c9                    	addl	%r9d, %r9d
1454a4a6f: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4a76: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
1454a4a80: 4d 85 c9                    	testq	%r9, %r9
1454a4a83: 74 26                       	je	0x1454a4aab <.text+0x54a3aab>
1454a4a85: 66 44 3b 64 50 3a           	cmpw	0x3a(%rax,%rdx,2), %r12w
1454a4a8b: 41 0f 97 c2                 	seta	%r10b
1454a4a8f: 41 80 da 00                 	sbbb	$0x0, %r10b
1454a4a93: 48 ff c2                    	incq	%rdx
1454a4a96: 49 83 c1 fe                 	addq	$-0x2, %r9
1454a4a9a: 41 80 fa 01                 	cmpb	$0x1, %r10b
1454a4a9e: 74 e0                       	je	0x1454a4a80 <.text+0x54a3a80>
1454a4aa0: 45 0f b6 ca                 	movzbl	%r10b, %r9d
1454a4aa4: 45 85 c9                    	testl	%r9d, %r9d
1454a4aa7: 75 05                       	jne	0x1454a4aae <.text+0x54a3aae>
1454a4aa9: eb 14                       	jmp	0x1454a4abf <.text+0x54a3abf>
1454a4aab: 4c 89 da                    	movq	%r11, %rdx
1454a4aae: 48 83 e9 01                 	subq	$0x1, %rcx
1454a4ab2: 0f 82 30 08 00 00           	jb	0x1454a52e8 <.text+0x54a42e8>
1454a4ab8: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a4abd: eb a5                       	jmp	0x1454a4a64 <.text+0x54a3a64>
1454a4abf: 44 89 74 90 08              	movl	%r14d, 0x8(%rax,%rdx,4)
1454a4ac4: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a4acb: 48 8b 06                    	movq	(%rsi), %rax
1454a4ace: 48 85 c0                    	testq	%rax, %rax
1454a4ad1: 0f 84 e0 00 00 00           	je	0x1454a4bb7 <.text+0x54a3bb7>
1454a4ad7: 49 8b 8d c0 08 00 00        	movq	0x8c0(%r13), %rcx
1454a4ade: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a4ae5: 44 0f b7 58 36              	movzwl	0x36(%rax), %r11d
1454a4aea: 45 89 d9                    	movl	%r11d, %r9d
1454a4aed: 45 01 c9                    	addl	%r9d, %r9d
1454a4af0: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1454a4af7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1454a4b00: 4d 85 c9                    	testq	%r9, %r9
1454a4b03: 74 26                       	je	0x1454a4b2b <.text+0x54a3b2b>
1454a4b05: 66 44 3b 7c 50 3a           	cmpw	0x3a(%rax,%rdx,2), %r15w
1454a4b0b: 41 0f 97 c2                 	seta	%r10b
1454a4b0f: 41 80 da 00                 	sbbb	$0x0, %r10b
1454a4b13: 48 ff c2                    	incq	%rdx
1454a4b16: 49 83 c1 fe                 	addq	$-0x2, %r9
1454a4b1a: 41 80 fa 01                 	cmpb	$0x1, %r10b
1454a4b1e: 74 e0                       	je	0x1454a4b00 <.text+0x54a3b00>
1454a4b20: 45 0f b6 ca                 	movzbl	%r10b, %r9d
1454a4b24: 45 85 c9                    	testl	%r9d, %r9d
1454a4b27: 75 05                       	jne	0x1454a4b2e <.text+0x54a3b2e>
1454a4b29: eb 14                       	jmp	0x1454a4b3f <.text+0x54a3b3f>
1454a4b2b: 4c 89 da                    	movq	%r11, %rdx
1454a4b2e: 48 83 e9 01                 	subq	$0x1, %rcx
1454a4b32: 0f 82 b8 07 00 00           	jb	0x1454a52f0 <.text+0x54a42f0>
1454a4b38: 48 8b 44 d0 50              	movq	0x50(%rax,%rdx,8), %rax
1454a4b3d: eb a6                       	jmp	0x1454a4ae5 <.text+0x54a3ae5>
1454a4b3f: 44 89 44 90 08              	movl	%r8d, 0x8(%rax,%rdx,4)
1454a4b44: e9 c7 00 00 00              	jmp	0x1454a4c10 <.text+0x54a3c10>
1454a4b49: 4d 89 c4                    	movq	%r8, %r12
1454a4b4c: 31 c0                       	xorl	%eax, %eax
1454a4b4e: 45 0f 28 de                 	movaps	%xmm14, %xmm11
1454a4b52: 8b bd 28 03 00 00           	movl	0x328(%rbp), %edi
1454a4b58: 48 8b b5 18 03 00 00        	movq	0x318(%rbp), %rsi
1454a4b5f: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454a4b66: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4b6d: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a4b78: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a4b7f: 48 c7 85 c0 00 00 00 16 00 00 00    	movq	$0x16, 0xc0(%rbp)
1454a4b8a: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a4b91: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a4b98: 45 89 f0                    	movl	%r14d, %r8d
1454a4b9b: e8 b0 2e f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a4ba0: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4ba8: 4d 89 e0                    	movq	%r12, %r8
1454a4bab: 48 8b 06                    	movq	(%rsi), %rax
1454a4bae: 48 85 c0                    	testq	%rax, %rax
1454a4bb1: 0f 85 20 ff ff ff           	jne	0x1454a4ad7 <.text+0x54a3ad7>
1454a4bb7: 31 c0                       	xorl	%eax, %eax
1454a4bb9: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
1454a4bc0: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
1454a4bc7: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
1454a4bd2: 48 89 95 b8 00 00 00        	movq	%rdx, 0xb8(%rbp)
1454a4bd9: 48 c7 85 c0 00 00 00 1c 00 00 00    	movq	$0x1c, 0xc0(%rbp)
1454a4be4: 48 8d 8d d8 02 00 00        	leaq	0x2d8(%rbp), %rcx
1454a4beb: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
1454a4bf2: e8 59 2e f8 ff              	callq	0x145427a50 <.text+0x5426a50>
1454a4bf7: 48 8b b5 58 03 00 00        	movq	0x358(%rbp), %rsi
1454a4bfe: f3 0f 10 a5 a0 02 00 00     	movss	0x2a0(%rbp), %xmm4
1454a4c06: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
