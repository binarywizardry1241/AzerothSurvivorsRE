
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145898277: 66 0f 28 c6                 	movapd	%xmm6, %xmm0
14589827b: f2 0f 5c 86 90 10 00 00     	subsd	0x1090(%rsi), %xmm0
145898283: 66 0f 2e 05 7d ee 31 01     	ucomisd	0x131ee7d(%rip), %xmm0  # 0x146bb7108
14589828b: 0f 82 70 10 00 00           	jb	0x145899301 <.text+0x5898301>
145898291: f2 0f 11 b6 90 10 00 00     	movsd	%xmm6, 0x1090(%rsi)
145898299: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
14589829d: 74 74                       	je	0x145898313 <.text+0x5897313>
14589829f: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1458982a6: 4c 89 e2                    	movq	%r12, %rdx
1458982a9: e8 e2 2a 06 00              	callq	0x1458fad90 <.text+0x58f9d90>
1458982ae: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1458982b5: 48 89 85 20 05 00 00        	movq	%rax, 0x520(%rbp)
1458982bc: 48 8b 95 a8 00 00 00        	movq	0xa8(%rbp), %rdx
1458982c3: 4c 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %r8
1458982ca: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
1458982d1: 48 8b 88 40 10 00 00        	movq	0x1040(%rax), %rcx
1458982d8: 48 8b 80 48 10 00 00        	movq	0x1048(%rax), %rax
1458982df: 48 89 95 10 05 00 00        	movq	%rdx, 0x510(%rbp)
1458982e6: ff 50 20                    	callq	*0x20(%rax)
1458982e9: 90                          	nop
1458982ea: 48 8b 95 20 05 00 00        	movq	0x520(%rbp), %rdx
1458982f1: 48 85 d2                    	testq	%rdx, %rdx
1458982f4: 74 12                       	je	0x145898308 <.text+0x5897308>
1458982f6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458982fc: 48 8b 8d 10 05 00 00        	movq	0x510(%rbp), %rcx
145898303: e8 c8 9e 76 fa              	callq	0x1400021d0 <.text+0x11d0>
145898308: 49 83 3c 24 02              	cmpq	$0x2, (%r12)
14589830d: 0f 85 4c 02 00 00           	jne	0x14589855f <.text+0x589755f>
145898313: 48 c7 85 58 04 00 00 00 00 00 00    	movq	$0x0, 0x458(%rbp)
14589831e: 48 c7 85 60 04 00 00 08 00 00 00    	movq	$0x8, 0x460(%rbp)
145898329: 48 c7 85 68 04 00 00 00 00 00 00    	movq	$0x0, 0x468(%rbp)
145898334: be 08 00 00 00              	movl	$0x8, %esi
145898339: 31 ff                       	xorl	%edi, %edi
14589833b: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
145898342: 48 3b b8 f0 0c 00 00        	cmpq	0xcf0(%rax), %rdi
145898349: 0f 84 3d 02 00 00           	je	0x14589858c <.text+0x589758c>
14589834f: e9 63 02 00 00              	jmp	0x1458985b7 <.text+0x58975b7>
145898354: 88 86 16 11 00 00           	movb	%al, 0x1116(%rsi)
14589835a: 48 89 f1                    	movq	%rsi, %rcx
14589835d: e8 2e 93 00 00              	callq	0x1458a1690 <.text+0x58a0690>
145898362: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
145898366: 0f 84 0b ff ff ff           	je	0x145898277 <.text+0x5897277>
14589836c: 48 81 be 50 10 00 00 ff ff ff 00    	cmpq	$0xffffff, 0x1050(%rsi) # imm = 0xFFFFFF
145898377: 0f 84 3e 11 00 00           	je	0x1458994bb <.text+0x58984bb>
14589837d: 80 be 7c 0a 00 00 00        	cmpb	$0x0, 0xa7c(%rsi)
145898384: 0f 85 31 11 00 00           	jne	0x1458994bb <.text+0x58984bb>
14589838a: 8b be 1c 07 00 00           	movl	0x71c(%rsi), %edi
145898390: 44 8b b6 2c 07 00 00        	movl	0x72c(%rsi), %r14d
145898397: 44 8b be 24 07 00 00        	movl	0x724(%rsi), %r15d
14589839e: 44 8b a6 28 07 00 00        	movl	0x728(%rsi), %r12d
1458983a5: 44 8b ae 30 07 00 00        	movl	0x730(%rsi), %r13d
1458983ac: 0f b6 9e 14 03 00 00        	movzbl	0x314(%rsi), %ebx
1458983b3: 48 8b 8e a0 02 00 00        	movq	0x2a0(%rsi), %rcx
1458983ba: 48 8b 96 a8 02 00 00        	movq	0x2a8(%rsi), %rdx
1458983c1: e8 ea cf fd ff              	callq	0x1458753b0 <.text+0x58743b0>
1458983c6: 31 c9                       	xorl	%ecx, %ecx
1458983c8: 41 89 f8                    	movl	%edi, %r8d
1458983cb: 44 2b 86 d4 10 00 00        	subl	0x10d4(%rsi), %r8d
1458983d2: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
1458983d6: 4c 03 86 60 0c 00 00        	addq	0xc60(%rsi), %r8
1458983dd: 4c 8d 8e d0 0a 00 00        	leaq	0xad0(%rsi), %r9
1458983e4: 48 c7 c2 ff ff ff ff        	movq	$-0x1, %rdx
1458983eb: 4c 0f 42 c2                 	cmovbq	%rdx, %r8
1458983ef: 4c 89 86 60 0c 00 00        	movq	%r8, 0xc60(%rsi)
1458983f6: 45 89 f0                    	movl	%r14d, %r8d
1458983f9: 44 2b 86 d8 10 00 00        	subl	0x10d8(%rsi), %r8d
145898400: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
145898404: 4c 03 86 68 0c 00 00        	addq	0xc68(%rsi), %r8
14589840b: 4c 0f 42 c2                 	cmovbq	%rdx, %r8
14589840f: 4c 89 86 68 0c 00 00        	movq	%r8, 0xc68(%rsi)
145898416: 45 89 f8                    	movl	%r15d, %r8d
145898419: 44 2b 86 dc 10 00 00        	subl	0x10dc(%rsi), %r8d
145898420: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
145898424: 4c 03 86 70 0c 00 00        	addq	0xc70(%rsi), %r8
14589842b: 4c 0f 42 c2                 	cmovbq	%rdx, %r8
14589842f: 4c 89 86 70 0c 00 00        	movq	%r8, 0xc70(%rsi)
145898436: 45 89 e0                    	movl	%r12d, %r8d
145898439: 44 2b 86 e0 10 00 00        	subl	0x10e0(%rsi), %r8d
145898440: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
145898444: 4c 03 86 78 0c 00 00        	addq	0xc78(%rsi), %r8
14589844b: 4c 0f 42 c2                 	cmovbq	%rdx, %r8
14589844f: 4c 89 86 78 0c 00 00        	movq	%r8, 0xc78(%rsi)
145898456: 45 89 e8                    	movl	%r13d, %r8d
145898459: 44 2b 86 e4 10 00 00        	subl	0x10e4(%rsi), %r8d
145898460: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
145898464: 4c 03 86 90 0c 00 00        	addq	0xc90(%rsi), %r8
14589846b: 4c 0f 42 c2                 	cmovbq	%rdx, %r8
14589846f: 83 be 38 09 00 00 00        	cmpl	$0x0, 0x938(%rsi)
145898476: 4c 89 86 90 0c 00 00        	movq	%r8, 0xc90(%rsi)
14589847d: 89 be d4 10 00 00           	movl	%edi, 0x10d4(%rsi)
145898483: 44 89 b6 d8 10 00 00        	movl	%r14d, 0x10d8(%rsi)
14589848a: 44 89 be dc 10 00 00        	movl	%r15d, 0x10dc(%rsi)
145898491: 44 89 a6 e0 10 00 00        	movl	%r12d, 0x10e0(%rsi)
145898498: 44 89 ae e4 10 00 00        	movl	%r13d, 0x10e4(%rsi)
14589849f: 4c 89 ce                    	movq	%r9, %rsi
1458984a2: 74 0d                       	je	0x1458984b1 <.text+0x58974b1>
1458984a4: 48 89 f1                    	movq	%rsi, %rcx
1458984a7: 89 da                       	movl	%ebx, %edx
1458984a9: 49 89 c0                    	movq	%rax, %r8
1458984ac: e8 6f da fe ff              	callq	0x145885f20 <.text+0x5884f20>
1458984b1: 48 8d 8d 80 03 00 00        	leaq	0x380(%rbp), %rcx
1458984b8: 48 8b 95 28 05 00 00        	movq	0x528(%rbp), %rdx
1458984bf: e8 fc f2 00 00              	callq	0x1458a77c0 <.text+0x58a67c0>
1458984c4: 48 83 bd 80 03 00 00 ff     	cmpq	$-0x1, 0x380(%rbp)
1458984cc: 0f 84 9b 0e 00 00           	je	0x14589936d <.text+0x589836d>
1458984d2: 0f 10 85 80 03 00 00        	movups	0x380(%rbp), %xmm0
1458984d9: 66 0f 10 8d 90 03 00 00     	movupd	0x390(%rbp), %xmm1
1458984e1: 0f 10 95 a0 03 00 00        	movups	0x3a0(%rbp), %xmm2
1458984e8: 0f 29 95 c0 00 00 00        	movaps	%xmm2, 0xc0(%rbp)
1458984ef: 66 0f 29 8d b0 00 00 00     	movapd	%xmm1, 0xb0(%rbp)
1458984f7: 0f 29 85 a0 00 00 00        	movaps	%xmm0, 0xa0(%rbp)
1458984fe: 48 8d 8d d0 04 00 00        	leaq	0x4d0(%rbp), %rcx
145898505: 4c 8d 85 a0 00 00 00        	leaq	0xa0(%rbp), %r8
14589850c: 48 89 f2                    	movq	%rsi, %rdx
14589850f: e8 2c c2 03 00              	callq	0x1458d4740 <.text+0x58d3740>
145898514: 90                          	nop
145898515: 4c 8b a5 c8 04 00 00        	movq	0x4c8(%rbp), %r12
14589851c: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
145898523: 48 85 d2                    	testq	%rdx, %rdx
145898526: 74 16                       	je	0x14589853e <.text+0x589753e>
145898528: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
14589852f: 48 c1 e2 03                 	shlq	$0x3, %rdx
145898533: 41 b8 04 00 00 00           	movl	$0x4, %r8d
145898539: e8 92 9c 76 fa              	callq	0x1400021d0 <.text+0x11d0>
14589853e: 0f 10 85 d0 04 00 00        	movups	0x4d0(%rbp), %xmm0
145898545: 0f 29 85 30 04 00 00        	movaps	%xmm0, 0x430(%rbp)
14589854c: 48 8b 85 e0 04 00 00        	movq	0x4e0(%rbp), %rax
145898553: 48 89 85 40 04 00 00        	movq	%rax, 0x440(%rbp)
14589855a: e9 36 0e 00 00              	jmp	0x145899395 <.text+0x5898395>
14589855f: 48 8d 8d 58 04 00 00        	leaq	0x458(%rbp), %rcx
145898566: 4c 89 e2                    	movq	%r12, %rdx
145898569: e8 e2 5d 05 00              	callq	0x1458ee350 <.text+0x58ed350>
14589856e: 48 8b b5 60 04 00 00        	movq	0x460(%rbp), %rsi
145898575: 48 8b bd 68 04 00 00        	movq	0x468(%rbp), %rdi
14589857c: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
145898583: 48 3b b8 f0 0c 00 00        	cmpq	0xcf0(%rax), %rdi
14589858a: 75 2b                       	jne	0x1458985b7 <.text+0x58975b7>
14589858c: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
145898593: 48 8b 90 e8 0c 00 00        	movq	0xce8(%rax), %rdx
14589859a: c6 85 1e 05 00 00 01        	movb	$0x1, 0x51e(%rbp)
1458985a1: 48 89 f1                    	movq	%rsi, %rcx
1458985a4: 49 89 f8                    	movq	%rdi, %r8
1458985a7: e8 e4 47 0e 00              	callq	0x14597cd90 <.text+0x597bd90>
1458985ac: 90                          	nop
1458985ad: b1 01                       	movb	$0x1, %cl
1458985af: 84 c0                       	testb	%al, %al
1458985b1: 0f 85 dd 00 00 00           	jne	0x145898694 <.text+0x5897694>
1458985b7: 48 8b 9d 28 05 00 00        	movq	0x528(%rbp), %rbx
1458985be: 48 8b 8b 40 10 00 00        	movq	0x1040(%rbx), %rcx
1458985c5: 48 8b 83 48 10 00 00        	movq	0x1048(%rbx), %rax
1458985cc: 48 8b 40 30                 	movq	0x30(%rax), %rax
1458985d0: c6 85 1e 05 00 00 01        	movb	$0x1, 0x51e(%rbp)
1458985d7: 48 89 f2                    	movq	%rsi, %rdx
1458985da: 49 89 f8                    	movq	%rdi, %r8
1458985dd: ff d0                       	callq	*%rax
1458985df: 90                          	nop
1458985e0: 48 8d 83 e0 0c 00 00        	leaq	0xce0(%rbx), %rax
1458985e7: 48 89 85 00 05 00 00        	movq	%rax, 0x500(%rbp)
1458985ee: 48 8b 8b e8 0c 00 00        	movq	0xce8(%rbx), %rcx
1458985f5: 48 8b 83 f0 0c 00 00        	movq	0xcf0(%rbx), %rax
1458985fc: 48 89 85 10 05 00 00        	movq	%rax, 0x510(%rbp)
145898603: 48 c7 85 20 05 00 00 00 00 00 00    	movq	$0x0, 0x520(%rbp)
14589860e: 48 89 8d f0 04 00 00        	movq	%rcx, 0x4f0(%rbp)
145898615: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
145898620: 48 8b 85 20 05 00 00        	movq	0x520(%rbp), %rax
145898627: 48 39 85 10 05 00 00        	cmpq	%rax, 0x510(%rbp)
14589862e: 74 1c                       	je	0x14589864c <.text+0x589764c>
145898630: 48 ff c0                    	incq	%rax
145898633: 48 89 85 20 05 00 00        	movq	%rax, 0x520(%rbp)
14589863a: 48 8d b1 b0 00 00 00        	leaq	0xb0(%rcx), %rsi
145898641: e8 1a 0a 8b fa              	callq	0x140149060 <.text+0x148060>
145898646: 90                          	nop
145898647: 48 89 f1                    	movq	%rsi, %rcx
14589864a: eb d4                       	jmp	0x145898620 <.text+0x5897620>
14589864c: 48 8b b5 00 05 00 00        	movq	0x500(%rbp), %rsi
145898653: 48 8b 06                    	movq	(%rsi), %rax
145898656: 48 85 c0                    	testq	%rax, %rax
145898659: 74 20                       	je	0x14589867b <.text+0x589767b>
14589865b: 48 8b 8d 28 05 00 00        	movq	0x528(%rbp), %rcx
145898662: 48 8b 89 e8 0c 00 00        	movq	0xce8(%rcx), %rcx
145898669: 48 69 d0 b0 00 00 00        	imulq	$0xb0, %rax, %rdx
145898670: 41 b8 08 00 00 00           	movl	$0x8, %r8d
145898676: e8 55 9b 76 fa              	callq	0x1400021d0 <.text+0x11d0>
14589867b: 48 8b 85 68 04 00 00        	movq	0x468(%rbp), %rax
145898682: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
145898686: 66 0f 10 85 58 04 00 00     	movupd	0x458(%rbp), %xmm0
14589868e: 66 0f 11 06                 	movupd	%xmm0, (%rsi)
145898692: 31 c9                       	xorl	%ecx, %ecx
145898694: 41 83 3c 24 02              	cmpl	$0x2, (%r12)
145898699: 89 8d f0 04 00 00           	movl	%ecx, 0x4f0(%rbp)
14589869f: 75 28                       	jne	0x1458986c9 <.text+0x58976c9>
1458986a1: 41 be 04 00 00 00           	movl	$0x4, %r14d
1458986a7: 31 f6                       	xorl	%esi, %esi
1458986a9: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
1458986b0: 48 83 b8 08 0d 00 00 00     	cmpq	$0x0, 0xd08(%rax)
1458986b8: 41 bf 00 00 00 00           	movl	$0x0, %r15d
1458986be: 0f 85 9e 00 00 00           	jne	0x145898762 <.text+0x5897762>
1458986c4: e9 87 00 00 00              	jmp	0x145898750 <.text+0x5897750>
1458986c9: 88 8d 1e 05 00 00           	movb	%cl, 0x51e(%rbp)
1458986cf: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1458986d6: 4c 89 e2                    	movq	%r12, %rdx
1458986d9: e8 72 c7 08 00              	callq	0x145924e50 <.text+0x5923e50>
1458986de: 90                          	nop
1458986df: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
1458986e6: 4c 8b bd a0 00 00 00        	movq	0xa0(%rbp), %r15
1458986ed: 4c 8b b5 a8 00 00 00        	movq	0xa8(%rbp), %r14
1458986f4: 48 8b b5 b0 00 00 00        	movq	0xb0(%rbp), %rsi
1458986fb: 48 3b b0 08 0d 00 00        	cmpq	0xd08(%rax), %rsi
145898702: 75 5e                       	jne	0x145898762 <.text+0x5897762>
145898704: 48 85 f6                    	testq	%rsi, %rsi
145898707: 74 47                       	je	0x145898750 <.text+0x5897750>
145898709: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
145898710: 48 8b 80 00 0d 00 00        	movq	0xd00(%rax), %rax
145898717: b9 08 00 00 00              	movl	$0x8, %ecx
14589871c: 48 89 f2                    	movq	%rsi, %rdx
14589871f: 90                          	nop
145898720: 45 8b 44 0e f8              	movl	-0x8(%r14,%rcx), %r8d
145898725: 44 3b 44 08 f8              	cmpl	-0x8(%rax,%rcx), %r8d
14589872a: 75 36                       	jne	0x145898762 <.text+0x5897762>
14589872c: f3 41 0f 10 44 0e fc        	movss	-0x4(%r14,%rcx), %xmm0
145898733: 0f 2e 44 08 fc              	ucomiss	-0x4(%rax,%rcx), %xmm0
145898738: 75 28                       	jne	0x145898762 <.text+0x5897762>
14589873a: 7a 26                       	jp	0x145898762 <.text+0x5897762>
14589873c: 45 0f b6 04 0e              	movzbl	(%r14,%rcx), %r8d
145898741: 44 3a 04 08                 	cmpb	(%rax,%rcx), %r8b
145898745: 75 1b                       	jne	0x145898762 <.text+0x5897762>
145898747: 48 83 c1 0c                 	addq	$0xc, %rcx
14589874b: 48 ff ca                    	decq	%rdx
14589874e: 75 d0                       	jne	0x145898720 <.text+0x5897720>
145898750: b0 01                       	movb	$0x1, %al
145898752: 41 83 3c 24 02              	cmpl	$0x2, (%r12)
145898757: 0f 85 83 00 00 00           	jne	0x1458987e0 <.text+0x58977e0>
14589875d: e9 02 0b 00 00              	jmp	0x145899264 <.text+0x5898264>
145898762: 48 8b bd 28 05 00 00        	movq	0x528(%rbp), %rdi
145898769: 48 8b 8f 40 10 00 00        	movq	0x1040(%rdi), %rcx
145898770: 48 8b 87 48 10 00 00        	movq	0x1048(%rdi), %rax
145898777: 48 8b 40 38                 	movq	0x38(%rax), %rax
14589877b: 4c 89 b5 50 04 00 00        	movq	%r14, 0x450(%rbp)
145898782: 4c 89 bd 48 04 00 00        	movq	%r15, 0x448(%rbp)
145898789: c6 85 0f 05 00 00 01        	movb	$0x1, 0x50f(%rbp)
145898790: 4c 89 f2                    	movq	%r14, %rdx
145898793: 49 89 f0                    	movq	%rsi, %r8
145898796: ff d0                       	callq	*%rax
145898798: 90                          	nop
145898799: 48 8b 87 f8 0c 00 00        	movq	0xcf8(%rdi), %rax
1458987a0: 48 85 c0                    	testq	%rax, %rax
1458987a3: 74 1a                       	je	0x1458987bf <.text+0x58977bf>
1458987a5: 48 8b 8f 00 0d 00 00        	movq	0xd00(%rdi), %rcx
1458987ac: 48 c1 e0 02                 	shlq	$0x2, %rax
1458987b0: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
1458987b4: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1458987ba: e8 11 9a 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458987bf: 4c 89 bf f8 0c 00 00        	movq	%r15, 0xcf8(%rdi)
1458987c6: 4c 89 b7 00 0d 00 00        	movq	%r14, 0xd00(%rdi)
1458987cd: 48 89 b7 08 0d 00 00        	movq	%rsi, 0xd08(%rdi)
1458987d4: 83 7f 10 02                 	cmpl	$0x2, 0x10(%rdi)
1458987d8: 0f 84 a1 0a 00 00           	je	0x14589927f <.text+0x589827f>
1458987de: 31 c0                       	xorl	%eax, %eax
1458987e0: 4c 89 b5 50 04 00 00        	movq	%r14, 0x450(%rbp)
1458987e7: 4c 89 bd 48 04 00 00        	movq	%r15, 0x448(%rbp)
1458987ee: 89 85 b0 04 00 00           	movl	%eax, 0x4b0(%rbp)
1458987f4: 88 85 0f 05 00 00           	movb	%al, 0x50f(%rbp)
1458987fa: 48 8d 4d 20                 	leaq	0x20(%rbp), %rcx
1458987fe: 4c 89 e2                    	movq	%r12, %rdx
145898801: e8 fa 7a 05 00              	callq	0x1458f0300 <.text+0x58ef300>
145898806: 90                          	nop
145898807: 48 8b 9d 28 05 00 00        	movq	0x528(%rbp), %rbx
14589880e: 48 8b 75 28                 	movq	0x28(%rbp), %rsi
145898812: 48 8b 7d 30                 	movq	0x30(%rbp), %rdi
145898816: 48 3b bb 20 0d 00 00        	cmpq	0xd20(%rbx), %rdi
14589881d: 4c 89 b5 c0 04 00 00        	movq	%r14, 0x4c0(%rbp)
145898824: 4c 89 bd b8 04 00 00        	movq	%r15, 0x4b8(%rbp)
14589882b: 75 1a                       	jne	0x145898847 <.text+0x5897847>
14589882d: 48 8b 93 18 0d 00 00        	movq	0xd18(%rbx), %rdx
145898834: 48 89 f1                    	movq	%rsi, %rcx
145898837: 49 89 f8                    	movq	%rdi, %r8
14589883a: e8 48 0f 33 00              	callq	0x145bc9787 <.text+0x5bc8787>
14589883f: 85 c0                       	testl	%eax, %eax
145898841: 0f 84 1f 0b 00 00           	je	0x145899366 <.text+0x5898366>
145898847: 48 8b 93 70 04 00 00        	movq	0x470(%rbx), %rdx
14589884e: c6 85 1d 05 00 00 01        	movb	$0x1, 0x51d(%rbp)
145898855: 48 89 7c 24 28              	movq	%rdi, 0x28(%rsp)
14589885a: 48 89 74 24 20              	movq	%rsi, 0x20(%rsp)
14589885f: 4c 8d 05 42 ec 31 01        	leaq	0x131ec42(%rip), %r8    # 0x146bb74a8
145898866: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14589886d: 41 b9 03 00 00 00           	movl	$0x3, %r9d
145898873: e8 a8 2b 01 00              	callq	0x1458ab420 <.text+0x58aa420>
145898878: 90                          	nop
145898879: 48 8b 9d 28 05 00 00        	movq	0x528(%rbp), %rbx
145898880: 48 8b bb f0 05 00 00        	movq	0x5f0(%rbx), %rdi
145898887: 48 3b bb e0 05 00 00        	cmpq	0x5e0(%rbx), %rdi
14589888e: 75 0d                       	jne	0x14589889d <.text+0x589789d>
145898890: 48 8d 8b e0 05 00 00        	leaq	0x5e0(%rbx), %rcx
145898897: e8 94 2c 33 00              	callq	0x145bcb530 <.text+0x5bca530>
14589889c: 90                          	nop
14589889d: 48 8d b3 10 0d 00 00        	leaq	0xd10(%rbx), %rsi
1458988a4: 48 8b 83 e8 05 00 00        	movq	0x5e8(%rbx), %rax
1458988ab: 48 89 f9                    	movq	%rdi, %rcx
1458988ae: 48 c1 e1 05                 	shlq	$0x5, %rcx
1458988b2: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
1458988b9: 66 0f 10 8d b0 00 00 00     	movupd	0xb0(%rbp), %xmm1
1458988c1: 66 0f 11 4c 08 10           	movupd	%xmm1, 0x10(%rax,%rcx)
1458988c7: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1458988cb: 48 ff c7                    	incq	%rdi
1458988ce: 48 89 bb f0 05 00 00        	movq	%rdi, 0x5f0(%rbx)
1458988d5: 48 8b 93 10 0d 00 00        	movq	0xd10(%rbx), %rdx
1458988dc: 48 85 d2                    	testq	%rdx, %rdx
1458988df: 74 12                       	je	0x1458988f3 <.text+0x58978f3>
1458988e1: 48 8b 8b 18 0d 00 00        	movq	0xd18(%rbx), %rcx
1458988e8: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458988ee: e8 dd 98 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458988f3: 48 8b 45 30                 	movq	0x30(%rbp), %rax
1458988f7: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1458988fb: 66 0f 10 45 20              	movupd	0x20(%rbp), %xmm0
145898900: 66 0f 11 06                 	movupd	%xmm0, (%rsi)
145898904: 31 c0                       	xorl	%eax, %eax
145898906: 89 85 78 04 00 00           	movl	%eax, 0x478(%rbp)
14589890c: 88 85 1d 05 00 00           	movb	%al, 0x51d(%rbp)
145898912: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898919: 4c 89 e2                    	movq	%r12, %rdx
14589891c: e8 4f 28 05 00              	callq	0x1458eb170 <.text+0x58ea170>
145898921: 90                          	nop
145898922: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898929: 48 89 85 20 05 00 00        	movq	%rax, 0x520(%rbp)
145898930: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898937: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
14589893b: 4c 8b bd b0 00 00 00        	movq	0xb0(%rbp), %r15
145898942: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898949: 4c 89 e2                    	movq	%r12, %rdx
14589894c: e8 cf 18 05 00              	callq	0x1458ea220 <.text+0x58e9220>
145898951: 90                          	nop
145898952: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898959: 48 89 85 10 05 00 00        	movq	%rax, 0x510(%rbp)
145898960: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898967: 48 89 45 40                 	movq	%rax, 0x40(%rbp)
14589896b: 48 8b bd b0 00 00 00        	movq	0xb0(%rbp), %rdi
145898972: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898979: 4c 89 e2                    	movq	%r12, %rdx
14589897c: e8 6f 53 05 00              	callq	0x1458edcf0 <.text+0x58eccf0>
145898981: 90                          	nop
145898982: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898989: 48 89 85 00 05 00 00        	movq	%rax, 0x500(%rbp)
145898990: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898997: 48 89 45 48                 	movq	%rax, 0x48(%rbp)
14589899b: 48 8b 9d b0 00 00 00        	movq	0xb0(%rbp), %rbx
1458989a2: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1458989a9: 4c 89 e2                    	movq	%r12, %rdx
1458989ac: e8 6f 3c 05 00              	callq	0x1458ec620 <.text+0x58eb620>
1458989b1: 90                          	nop
1458989b2: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1458989b9: 48 89 85 90 04 00 00        	movq	%rax, 0x490(%rbp)
1458989c0: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1458989c7: 48 89 45 50                 	movq	%rax, 0x50(%rbp)
1458989cb: 4c 8b b5 b0 00 00 00        	movq	0xb0(%rbp), %r14
1458989d2: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
1458989d9: 4c 89 e2                    	movq	%r12, %rdx
1458989dc: e8 2f 45 05 00              	callq	0x1458ecf10 <.text+0x58ebf10>
1458989e1: 90                          	nop
1458989e2: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
1458989e9: 48 89 85 80 04 00 00        	movq	%rax, 0x480(%rbp)
1458989f0: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1458989f7: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
1458989fb: 4c 8b ad b0 00 00 00        	movq	0xb0(%rbp), %r13
145898a02: 48 8b 85 28 05 00 00        	movq	0x528(%rbp), %rax
145898a09: 4c 8b 80 98 10 00 00        	movq	0x1098(%rax), %r8
145898a10: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898a17: 4c 89 e2                    	movq	%r12, %rdx
145898a1a: e8 a1 40 05 00              	callq	0x1458ecac0 <.text+0x58ebac0>
145898a1f: 90                          	nop
145898a20: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898a27: 48 89 85 88 04 00 00        	movq	%rax, 0x488(%rbp)
145898a2e: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898a35: 48 89 45 60                 	movq	%rax, 0x60(%rbp)
145898a39: 48 8b b5 b0 00 00 00        	movq	0xb0(%rbp), %rsi
145898a40: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898a47: 4c 89 e2                    	movq	%r12, %rdx
145898a4a: e8 41 3f 05 00              	callq	0x1458ec990 <.text+0x58eb990>
145898a4f: 90                          	nop
145898a50: 48 89 75 b8                 	movq	%rsi, -0x48(%rbp)
145898a54: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898a5b: 48 89 85 28 03 00 00        	movq	%rax, 0x328(%rbp)
145898a62: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898a69: 48 89 45 68                 	movq	%rax, 0x68(%rbp)
145898a6d: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898a74: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
145898a78: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898a7f: 4c 89 e2                    	movq	%r12, %rdx
145898a82: e8 d9 35 05 00              	callq	0x1458ec060 <.text+0x58eb060>
145898a87: 90                          	nop
145898a88: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898a8f: 48 89 85 30 03 00 00        	movq	%rax, 0x330(%rbp)
145898a96: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898a9d: 48 89 45 70                 	movq	%rax, 0x70(%rbp)
145898aa1: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898aa8: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
145898aac: 48 8b b5 28 05 00 00        	movq	0x528(%rbp), %rsi
145898ab3: 48 8b 96 78 06 00 00        	movq	0x678(%rsi), %rdx
145898aba: 4c 8b 86 80 06 00 00        	movq	0x680(%rsi), %r8
145898ac1: f3 0f 10 9e fc 09 00 00     	movss	0x9fc(%rsi), %xmm3
145898ac9: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898ad0: e8 bb 74 02 00              	callq	0x1458bff90 <.text+0x58bef90>
145898ad5: 90                          	nop
145898ad6: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898add: 48 89 85 38 03 00 00        	movq	%rax, 0x338(%rbp)
145898ae4: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898aeb: 48 89 45 78                 	movq	%rax, 0x78(%rbp)
145898aef: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898af6: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
145898afa: 48 8b 96 90 06 00 00        	movq	0x690(%rsi), %rdx
145898b01: 4c 8b 86 98 06 00 00        	movq	0x698(%rsi), %r8
145898b08: f3 0f 10 9e fc 09 00 00     	movss	0x9fc(%rsi), %xmm3
145898b10: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898b17: e8 74 74 02 00              	callq	0x1458bff90 <.text+0x58bef90>
145898b1c: 90                          	nop
145898b1d: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898b24: 48 89 85 40 03 00 00        	movq	%rax, 0x340(%rbp)
145898b2b: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898b32: 48 89 85 80 00 00 00        	movq	%rax, 0x80(%rbp)
145898b39: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898b40: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
145898b44: 8b 86 14 07 00 00           	movl	0x714(%rsi), %eax
145898b4a: 83 f8 02                    	cmpl	$0x2, %eax
145898b4d: 75 1b                       	jne	0x145898b6a <.text+0x5897b6a>
145898b4f: b8 01 00 00 00              	movl	$0x1, %eax
145898b54: 48 89 85 50 03 00 00        	movq	%rax, 0x350(%rbp)
145898b5b: 31 f6                       	xorl	%esi, %esi
145898b5d: 48 c7 85 70 04 00 00 00 00 00 00    	movq	$0x0, 0x470(%rbp)
145898b68: eb 5f                       	jmp	0x145898bc9 <.text+0x5897bc9>
145898b6a: 48 8b 96 a8 06 00 00        	movq	0x6a8(%rsi), %rdx
145898b71: 48 8d 8e ec 09 00 00        	leaq	0x9ec(%rsi), %rcx
145898b78: 4c 8d 86 08 07 00 00        	leaq	0x708(%rsi), %r8
145898b7f: a8 01                       	testb	$0x1, %al
145898b81: 49 0f 45 c8                 	cmovneq	%r8, %rcx
145898b85: 4c 8b 86 b0 06 00 00        	movq	0x6b0(%rsi), %r8
145898b8c: f3 0f 10 59 10              	movss	0x10(%rcx), %xmm3
145898b91: f3 0f 5c 9e 10 07 00 00     	subss	0x710(%rsi), %xmm3
145898b99: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898ba0: e8 eb 73 02 00              	callq	0x1458bff90 <.text+0x58bef90>
145898ba5: 90                          	nop
145898ba6: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898bad: 48 89 85 70 04 00 00        	movq	%rax, 0x470(%rbp)
145898bb4: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898bbb: 48 89 85 50 03 00 00        	movq	%rax, 0x350(%rbp)
145898bc2: 48 8b b5 b0 00 00 00        	movq	0xb0(%rbp), %rsi
145898bc9: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898bd0: 4c 8b a5 c8 04 00 00        	movq	0x4c8(%rbp), %r12
145898bd7: 4c 89 e2                    	movq	%r12, %rdx
145898bda: e8 71 3c 05 00              	callq	0x1458ec850 <.text+0x58eb850>
145898bdf: 90                          	nop
145898be0: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898be7: 48 89 85 48 03 00 00        	movq	%rax, 0x348(%rbp)
145898bee: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898bf5: 48 89 85 88 00 00 00        	movq	%rax, 0x88(%rbp)
145898bfc: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898c03: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
145898c07: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898c0e: 4c 89 e2                    	movq	%r12, %rdx
145898c11: e8 6a 35 05 00              	callq	0x1458ec180 <.text+0x58eb180>
145898c16: 90                          	nop
145898c17: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898c1e: 48 89 85 58 03 00 00        	movq	%rax, 0x358(%rbp)
145898c25: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898c2c: 48 89 85 90 00 00 00        	movq	%rax, 0x90(%rbp)
145898c33: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898c3a: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
145898c3e: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145898c45: 4c 89 e2                    	movq	%r12, %rdx
145898c48: e8 b3 36 05 00              	callq	0x1458ec300 <.text+0x58eb300>
145898c4d: 90                          	nop
145898c4e: 48 8b 85 a0 00 00 00        	movq	0xa0(%rbp), %rax
145898c55: 48 89 85 60 03 00 00        	movq	%rax, 0x360(%rbp)
145898c5c: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
145898c63: 48 89 85 98 00 00 00        	movq	%rax, 0x98(%rbp)
145898c6a: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
145898c71: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145898c75: 48 8d 8d 80 03 00 00        	leaq	0x380(%rbp), %rcx
145898c7c: 4c 89 e2                    	movq	%r12, %rdx
145898c7f: e8 7c 0a 05 00              	callq	0x1458e9700 <.text+0x58e8700>
145898c84: 90                          	nop
145898c85: 48 8b 85 90 03 00 00        	movq	0x390(%rbp), %rax
145898c8c: 48 89 85 10 03 00 00        	movq	%rax, 0x310(%rbp)
145898c93: 66 0f 10 85 80 03 00 00     	movupd	0x380(%rbp), %xmm0
145898c9b: 66 0f 11 85 00 03 00 00     	movupd	%xmm0, 0x300(%rbp)
145898ca3: 48 8d 05 01 e8 31 01        	leaq	0x131e801(%rip), %rax   # 0x146bb74ab
145898caa: 48 89 85 c0 00 00 00        	movq	%rax, 0xc0(%rbp)
145898cb1: 48 c7 85 c8 00 00 00 07 00 00 00    	movq	$0x7, 0xc8(%rbp)
145898cbc: 48 8b 85 20 05 00 00        	movq	0x520(%rbp), %rax
145898cc3: 48 89 85 d0 00 00 00        	movq	%rax, 0xd0(%rbp)
145898cca: 48 8b 45 38                 	movq	0x38(%rbp), %rax
145898cce: 48 89 85 d8 00 00 00        	movq	%rax, 0xd8(%rbp)
145898cd5: 4c 89 bd e0 00 00 00        	movq	%r15, 0xe0(%rbp)
145898cdc: 48 8d 05 cf e7 31 01        	leaq	0x131e7cf(%rip), %rax   # 0x146bb74b2
145898ce3: 48 89 85 e8 00 00 00        	movq	%rax, 0xe8(%rbp)
145898cea: 48 c7 85 f0 00 00 00 06 00 00 00    	movq	$0x6, 0xf0(%rbp)
145898cf5: 48 8b 85 10 05 00 00        	movq	0x510(%rbp), %rax
145898cfc: 48 89 85 f8 00 00 00        	movq	%rax, 0xf8(%rbp)
145898d03: 48 8b 45 40                 	movq	0x40(%rbp), %rax
145898d07: 48 89 85 00 01 00 00        	movq	%rax, 0x100(%rbp)
145898d0e: 48 89 bd 08 01 00 00        	movq	%rdi, 0x108(%rbp)
145898d15: 48 8d 05 9c e7 31 01        	leaq	0x131e79c(%rip), %rax   # 0x146bb74b8
145898d1c: 48 89 85 10 01 00 00        	movq	%rax, 0x110(%rbp)
145898d23: 48 c7 85 18 01 00 00 09 00 00 00    	movq	$0x9, 0x118(%rbp)
145898d2e: 48 8b 85 00 05 00 00        	movq	0x500(%rbp), %rax
145898d35: 48 89 85 20 01 00 00        	movq	%rax, 0x120(%rbp)
145898d3c: 48 8b 45 48                 	movq	0x48(%rbp), %rax
145898d40: 48 89 85 28 01 00 00        	movq	%rax, 0x128(%rbp)
145898d47: 48 89 9d 30 01 00 00        	movq	%rbx, 0x130(%rbp)
145898d4e: 48 8d 05 6c e7 31 01        	leaq	0x131e76c(%rip), %rax   # 0x146bb74c1
145898d55: 48 89 85 38 01 00 00        	movq	%rax, 0x138(%rbp)
145898d5c: 48 c7 85 40 01 00 00 08 00 00 00    	movq	$0x8, 0x140(%rbp)
145898d67: 48 8b 85 90 04 00 00        	movq	0x490(%rbp), %rax
145898d6e: 48 89 85 48 01 00 00        	movq	%rax, 0x148(%rbp)
145898d75: 48 8b 45 50                 	movq	0x50(%rbp), %rax
145898d79: 48 89 85 50 01 00 00        	movq	%rax, 0x150(%rbp)
145898d80: 4c 89 b5 58 01 00 00        	movq	%r14, 0x158(%rbp)
145898d87: 48 8d 05 3b e7 31 01        	leaq	0x131e73b(%rip), %rax   # 0x146bb74c9
145898d8e: 48 89 85 60 01 00 00        	movq	%rax, 0x160(%rbp)
145898d95: 48 c7 85 68 01 00 00 0a 00 00 00    	movq	$0xa, 0x168(%rbp)
145898da0: 48 8b 85 80 04 00 00        	movq	0x480(%rbp), %rax
145898da7: 48 89 85 70 01 00 00        	movq	%rax, 0x170(%rbp)
145898dae: 48 8b 45 58                 	movq	0x58(%rbp), %rax
145898db2: 48 89 85 78 01 00 00        	movq	%rax, 0x178(%rbp)
145898db9: 4c 89 ad 80 01 00 00        	movq	%r13, 0x180(%rbp)
145898dc0: 48 8d 05 0c e7 31 01        	leaq	0x131e70c(%rip), %rax   # 0x146bb74d3
145898dc7: 48 89 85 88 01 00 00        	movq	%rax, 0x188(%rbp)
145898dce: 48 c7 85 90 01 00 00 06 00 00 00    	movq	$0x6, 0x190(%rbp)
145898dd9: 48 8b 85 88 04 00 00        	movq	0x488(%rbp), %rax
145898de0: 48 89 85 98 01 00 00        	movq	%rax, 0x198(%rbp)
145898de7: 48 8b 45 60                 	movq	0x60(%rbp), %rax
145898deb: 48 89 85 a0 01 00 00        	movq	%rax, 0x1a0(%rbp)
145898df2: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
145898df6: 48 89 85 a8 01 00 00        	movq	%rax, 0x1a8(%rbp)
145898dfd: 48 8d 05 d5 e6 31 01        	leaq	0x131e6d5(%rip), %rax   # 0x146bb74d9
145898e04: 48 89 85 b0 01 00 00        	movq	%rax, 0x1b0(%rbp)
145898e0b: 48 c7 85 b8 01 00 00 09 00 00 00    	movq	$0x9, 0x1b8(%rbp)
145898e16: 48 8b 85 28 03 00 00        	movq	0x328(%rbp), %rax
145898e1d: 48 89 85 c0 01 00 00        	movq	%rax, 0x1c0(%rbp)
145898e24: 48 8b 45 68                 	movq	0x68(%rbp), %rax
145898e28: 48 89 85 c8 01 00 00        	movq	%rax, 0x1c8(%rbp)
145898e2f: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
145898e33: 48 89 85 d0 01 00 00        	movq	%rax, 0x1d0(%rbp)
145898e3a: 48 8d 05 a1 e6 31 01        	leaq	0x131e6a1(%rip), %rax   # 0x146bb74e2
145898e41: 48 89 85 d8 01 00 00        	movq	%rax, 0x1d8(%rbp)
145898e48: 48 c7 85 e0 01 00 00 08 00 00 00    	movq	$0x8, 0x1e0(%rbp)
145898e53: 48 8b 85 30 03 00 00        	movq	0x330(%rbp), %rax
145898e5a: 48 89 85 e8 01 00 00        	movq	%rax, 0x1e8(%rbp)
145898e61: 48 8b 45 70                 	movq	0x70(%rbp), %rax
145898e65: 48 89 85 f0 01 00 00        	movq	%rax, 0x1f0(%rbp)
145898e6c: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
145898e70: 48 89 85 f8 01 00 00        	movq	%rax, 0x1f8(%rbp)
145898e77: 48 8d 05 6c e6 31 01        	leaq	0x131e66c(%rip), %rax   # 0x146bb74ea
145898e7e: 48 89 85 00 02 00 00        	movq	%rax, 0x200(%rbp)
145898e85: 48 c7 85 08 02 00 00 08 00 00 00    	movq	$0x8, 0x208(%rbp)
145898e90: 48 8b 85 38 03 00 00        	movq	0x338(%rbp), %rax
145898e97: 48 89 85 10 02 00 00        	movq	%rax, 0x210(%rbp)
145898e9e: 48 8b 45 78                 	movq	0x78(%rbp), %rax
145898ea2: 48 89 85 18 02 00 00        	movq	%rax, 0x218(%rbp)
145898ea9: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145898ead: 48 89 85 20 02 00 00        	movq	%rax, 0x220(%rbp)
145898eb4: 48 8d 05 37 e6 31 01        	leaq	0x131e637(%rip), %rax   # 0x146bb74f2
145898ebb: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
145898ec2: 48 c7 85 30 02 00 00 07 00 00 00    	movq	$0x7, 0x230(%rbp)
145898ecd: 48 8b 85 40 03 00 00        	movq	0x340(%rbp), %rax
145898ed4: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
145898edb: 48 8b 85 80 00 00 00        	movq	0x80(%rbp), %rax
145898ee2: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
145898ee9: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
145898eed: 48 89 85 48 02 00 00        	movq	%rax, 0x248(%rbp)
145898ef4: 48 8d 05 fe e5 31 01        	leaq	0x131e5fe(%rip), %rax   # 0x146bb74f9
145898efb: 48 89 85 50 02 00 00        	movq	%rax, 0x250(%rbp)
145898f02: 48 c7 85 58 02 00 00 0a 00 00 00    	movq	$0xa, 0x258(%rbp)
145898f0d: 48 8b 85 70 04 00 00        	movq	0x470(%rbp), %rax
145898f14: 48 89 85 60 02 00 00        	movq	%rax, 0x260(%rbp)
145898f1b: 48 8b 85 50 03 00 00        	movq	0x350(%rbp), %rax
145898f22: 48 89 85 68 02 00 00        	movq	%rax, 0x268(%rbp)
145898f29: 48 89 b5 70 02 00 00        	movq	%rsi, 0x270(%rbp)
145898f30: 48 8d 05 cc e5 31 01        	leaq	0x131e5cc(%rip), %rax   # 0x146bb7503
145898f37: 48 89 85 78 02 00 00        	movq	%rax, 0x278(%rbp)
145898f3e: 48 c7 85 80 02 00 00 09 00 00 00    	movq	$0x9, 0x280(%rbp)
145898f49: 48 8b 85 48 03 00 00        	movq	0x348(%rbp), %rax
145898f50: 48 89 85 88 02 00 00        	movq	%rax, 0x288(%rbp)
145898f57: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
145898f5e: 48 89 85 90 02 00 00        	movq	%rax, 0x290(%rbp)
145898f65: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
145898f69: 48 89 85 98 02 00 00        	movq	%rax, 0x298(%rbp)
145898f70: 48 8d 05 95 e5 31 01        	leaq	0x131e595(%rip), %rax   # 0x146bb750c
145898f77: 48 89 85 a0 02 00 00        	movq	%rax, 0x2a0(%rbp)
145898f7e: 48 8b 95 28 05 00 00        	movq	0x528(%rbp), %rdx
145898f85: 4c 8d a2 28 0d 00 00        	leaq	0xd28(%rdx), %r12
145898f8c: 48 c7 85 a8 02 00 00 08 00 00 00    	movq	$0x8, 0x2a8(%rbp)
145898f97: 48 8b 85 58 03 00 00        	movq	0x358(%rbp), %rax
145898f9e: 48 89 85 b0 02 00 00        	movq	%rax, 0x2b0(%rbp)
145898fa5: 48 8d 82 90 0e 00 00        	leaq	0xe90(%rdx), %rax
145898fac: 48 8b 8d 90 00 00 00        	movq	0x90(%rbp), %rcx
145898fb3: 48 89 8d b8 02 00 00        	movq	%rcx, 0x2b8(%rbp)
145898fba: 4c 8d ad c0 00 00 00        	leaq	0xc0(%rbp), %r13
145898fc1: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
145898fc5: 48 89 8d c0 02 00 00        	movq	%rcx, 0x2c0(%rbp)
145898fcc: 48 8d 0d 41 e5 31 01        	leaq	0x131e541(%rip), %rcx   # 0x146bb7514
145898fd3: 48 89 8d c8 02 00 00        	movq	%rcx, 0x2c8(%rbp)
145898fda: 48 c7 85 d0 02 00 00 08 00 00 00    	movq	$0x8, 0x2d0(%rbp)
145898fe5: 48 8b 8d 60 03 00 00        	movq	0x360(%rbp), %rcx
145898fec: 48 89 8d d8 02 00 00        	movq	%rcx, 0x2d8(%rbp)
145898ff3: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
145898ffa: 48 89 8d e0 02 00 00        	movq	%rcx, 0x2e0(%rbp)
145899001: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
145899005: 48 89 8d e8 02 00 00        	movq	%rcx, 0x2e8(%rbp)
14589900c: 66 0f 57 c0                 	xorpd	%xmm0, %xmm0
145899010: 66 0f 11 85 18 03 00 00     	movupd	%xmm0, 0x318(%rbp)
145899018: 4c 89 a5 a0 00 00 00        	movq	%r12, 0xa0(%rbp)
14589901f: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
145899026: 48 c7 85 b0 00 00 00 00 00 00 00    	movq	$0x0, 0xb0(%rbp)
145899031: 48 c7 85 b8 00 00 00 0f 00 00 00    	movq	$0xf, 0xb8(%rbp)
14589903c: 48 8d 0d d9 e4 31 01        	leaq	0x131e4d9(%rip), %rcx   # 0x146bb751c
145899043: 48 89 8d f0 02 00 00        	movq	%rcx, 0x2f0(%rbp)
14589904a: 48 c7 85 f8 02 00 00 06 00 00 00    	movq	$0x6, 0x2f8(%rbp)
145899055: 48 8d 8a e0 05 00 00        	leaq	0x5e0(%rdx), %rcx
14589905c: 48 89 8d 00 05 00 00        	movq	%rcx, 0x500(%rbp)
145899063: bb 0f 00 00 00              	movl	$0xf, %ebx
145899068: 31 c9                       	xorl	%ecx, %ecx
14589906a: 48 8d bd 80 03 00 00        	leaq	0x380(%rbp), %rdi
145899071: eb 4c                       	jmp	0x1458990bf <.text+0x58980bf>
145899073: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
145899080: 48 8b 85 20 05 00 00        	movq	0x520(%rbp), %rax
145899087: 49 89 04 24                 	movq	%rax, (%r12)
14589908b: 48 8b 85 10 05 00 00        	movq	0x510(%rbp), %rax
145899092: 49 89 44 24 08              	movq	%rax, 0x8(%r12)
145899097: 49 89 5c 24 10              	movq	%rbx, 0x10(%r12)
14589909c: 4c 8d ad c0 00 00 00        	leaq	0xc0(%rbp), %r13
1458990a3: 4c 8b a5 a0 00 00 00        	movq	0xa0(%rbp), %r12
1458990aa: 48 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %rax
1458990b1: 48 8b 8d b0 00 00 00        	movq	0xb0(%rbp), %rcx
1458990b8: 48 8b 9d b8 00 00 00        	movq	0xb8(%rbp), %rbx
1458990bf: 49 39 c4                    	cmpq	%rax, %r12
1458990c2: 0f 84 3d 01 00 00           	je	0x145899205 <.text+0x5898205>
1458990c8: 49 8d 44 24 18              	leaq	0x18(%r12), %rax
1458990cd: 48 89 85 a0 00 00 00        	movq	%rax, 0xa0(%rbp)
1458990d4: 48 39 cb                    	cmpq	%rcx, %rbx
1458990d7: 0f 84 43 01 00 00           	je	0x145899220 <.text+0x5898220>
1458990dd: 48 8d 41 01                 	leaq	0x1(%rcx), %rax
1458990e1: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
1458990e8: 48 8d 0c 89                 	leaq	(%rcx,%rcx,4), %rcx
1458990ec: 49 8b 54 cd 10              	movq	0x10(%r13,%rcx,8), %rdx
1458990f1: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1458990f5: 0f 84 0d 01 00 00           	je	0x145899208 <.text+0x5898208>
1458990fb: 48 89 95 20 05 00 00        	movq	%rdx, 0x520(%rbp)
145899102: 48 8d 04 cd 00 00 00 00     	leaq	(,%rcx,8), %rax
14589910a: 4c 01 e8                    	addq	%r13, %rax
14589910d: 4c 8b 30                    	movq	(%rax), %r14
145899110: 4c 8b 78 08                 	movq	0x8(%rax), %r15
145899114: 48 8b 70 18                 	movq	0x18(%rax), %rsi
145899118: 48 8b 58 20                 	movq	0x20(%rax), %rbx
14589911c: 49 3b 5c 24 10              	cmpq	0x10(%r12), %rbx
145899121: 75 18                       	jne	0x14589913b <.text+0x589813b>
145899123: 49 8b 54 24 08              	movq	0x8(%r12), %rdx
145899128: 48 89 f1                    	movq	%rsi, %rcx
14589912b: 49 89 d8                    	movq	%rbx, %r8
14589912e: e8 54 06 33 00              	callq	0x145bc9787 <.text+0x5bc8787>
145899133: 85 c0                       	testl	%eax, %eax
145899135: 0f 84 a7 00 00 00           	je	0x1458991e2 <.text+0x58981e2>
14589913b: 4c 8b ad 28 05 00 00        	movq	0x528(%rbp), %r13
145899142: 49 8b 95 70 04 00 00        	movq	0x470(%r13), %rdx
145899149: 48 89 5c 24 28              	movq	%rbx, 0x28(%rsp)
14589914e: 48 89 b5 10 05 00 00        	movq	%rsi, 0x510(%rbp)
145899155: 48 89 74 24 20              	movq	%rsi, 0x20(%rsp)
14589915a: 48 89 f9                    	movq	%rdi, %rcx
14589915d: 4d 89 f0                    	movq	%r14, %r8
145899160: 4d 89 f9                    	movq	%r15, %r9
145899163: e8 b8 22 01 00              	callq	0x1458ab420 <.text+0x58aa420>
145899168: 90                          	nop
145899169: 4d 8b b5 f0 05 00 00        	movq	0x5f0(%r13), %r14
145899170: 4d 3b b5 e0 05 00 00        	cmpq	0x5e0(%r13), %r14
145899177: 75 0d                       	jne	0x145899186 <.text+0x5898186>
145899179: 48 8b 8d 00 05 00 00        	movq	0x500(%rbp), %rcx
145899180: e8 ab 23 33 00              	callq	0x145bcb530 <.text+0x5bca530>
145899185: 90                          	nop
145899186: 48 8b 95 28 05 00 00        	movq	0x528(%rbp), %rdx
14589918d: 48 8b 82 e8 05 00 00        	movq	0x5e8(%rdx), %rax
145899194: 4c 89 f1                    	movq	%r14, %rcx
145899197: 48 c1 e1 05                 	shlq	$0x5, %rcx
14589919b: 66 0f 10 85 80 03 00 00     	movupd	0x380(%rbp), %xmm0
1458991a3: 66 0f 10 8d 90 03 00 00     	movupd	0x390(%rbp), %xmm1
1458991ab: 66 0f 11 4c 08 10           	movupd	%xmm1, 0x10(%rax,%rcx)
1458991b1: 66 0f 11 04 08              	movupd	%xmm0, (%rax,%rcx)
1458991b6: 49 ff c6                    	incq	%r14
1458991b9: 4c 89 b2 f0 05 00 00        	movq	%r14, 0x5f0(%rdx)
1458991c0: 49 8b 14 24                 	movq	(%r12), %rdx
1458991c4: 48 85 d2                    	testq	%rdx, %rdx
1458991c7: 0f 84 b3 fe ff ff           	je	0x145899080 <.text+0x5898080>
1458991cd: 49 8b 4c 24 08              	movq	0x8(%r12), %rcx
1458991d2: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458991d8: e8 f3 8f 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458991dd: e9 9e fe ff ff              	jmp	0x145899080 <.text+0x5898080>
1458991e2: 48 8b 95 20 05 00 00        	movq	0x520(%rbp), %rdx
1458991e9: 48 85 d2                    	testq	%rdx, %rdx
1458991ec: 0f 84 b1 fe ff ff           	je	0x1458990a3 <.text+0x58980a3>
1458991f2: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458991f8: 48 89 f1                    	movq	%rsi, %rcx
1458991fb: e8 d0 8f 76 fa              	callq	0x1400021d0 <.text+0x11d0>
145899200: e9 9e fe ff ff              	jmp	0x1458990a3 <.text+0x58980a3>
145899205: 48 89 c8                    	movq	%rcx, %rax
145899208: 48 29 c3                    	subq	%rax, %rbx
14589920b: 4c 8b b5 c0 04 00 00        	movq	0x4c0(%rbp), %r14
145899212: 4c 8b bd b8 04 00 00        	movq	0x4b8(%rbp), %r15
145899219: 74 1f                       	je	0x14589923a <.text+0x589823a>
14589921b: e9 03 01 00 00              	jmp	0x145899323 <.text+0x5898323>
145899220: 48 89 d8                    	movq	%rbx, %rax
145899223: 48 29 c3                    	subq	%rax, %rbx
145899226: 4c 8b b5 c0 04 00 00        	movq	0x4c0(%rbp), %r14
14589922d: 4c 8b bd b8 04 00 00        	movq	0x4b8(%rbp), %r15
145899234: 0f 85 e9 00 00 00           	jne	0x145899323 <.text+0x5898323>
