; glue-environment-switch
0000000140001000 <.text>:
14000175f: 48 8d 15 62 b9 d6 05        	leaq	0x5d6b962(%rip), %rdx   # 0x145d6d0c8
140001766: 48 8d 8d f0 00 00 00        	leaq	0xf0(%rbp), %rcx
14000176d: 41 b8 0e 00 00 00           	movl	$0xe, %r8d
140001773: e8 98 b8 b8 05              	callq	0x145b8d010 <.text+0x5b8c010>
140001778: 90                          	nop
140001779: 48 8b 95 f0 00 00 00        	movq	0xf0(%rbp), %rdx
140001780: 31 c0                       	xorl	%eax, %eax
140001782: 48 83 fa fe                 	cmpq	$-0x2, %rdx
140001786: 75 17                       	jne	0x14000179f <.text+0x79f>
140001788: 48 83 bd 08 01 00 00 01     	cmpq	$0x1, 0x108(%rbp)
140001790: 75 0d                       	jne	0x14000179f <.text+0x79f>
140001792: 48 8b 85 00 01 00 00        	movq	0x100(%rbp), %rax
140001799: 80 38 31                    	cmpb	$0x31, (%rax)
14000179c: 0f 94 c0                    	sete	%al

; default-startup-mode
0000000140001000 <.text>:
14001003f: 80 7f 61 00                 	cmpb	$0x0, 0x61(%rdi)
140010043: 74 31                       	je	0x140010076 <.text+0xf076>
140010045: 31 c0                       	xorl	%eax, %eax
140010047: 48 89 f1                    	movq	%rsi, %rcx
14001004a: 48 89 c2                    	movq	%rax, %rdx
14001004d: 45 31 c9                    	xorl	%r9d, %r9d
140010050: e8 eb 8c 86 05              	callq	0x145878d40 <.text+0x5877d40>
140010055: 48 b8 01 00 00 00 00 00 00 80       	movabsq	$-0x7fffffffffffffff, %rax # imm = 0x8000000000000001
14001005f: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
140010063: 48 89 f0                    	movq	%rsi, %rax
140010066: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
14001006d: 5b                          	popq	%rbx
14001006e: 5f                          	popq	%rdi
14001006f: 5e                          	popq	%rsi
140010070: 41 5e                       	popq	%r14
140010072: 41 5f                       	popq	%r15
140010074: 5d                          	popq	%rbp
140010075: c3                          	retq
140010076: b9 01 00 00 00              	movl	$0x1, %ecx
14001007b: 31 d2                       	xorl	%edx, %edx
14001007d: e8 be 80 8a 05              	callq	0x1458b8140 <.text+0x58b7140>
140010082: 49 89 d0                    	movq	%rdx, %r8
140010085: 48 89 f1                    	movq	%rsi, %rcx
140010088: 48 89 c2                    	movq	%rax, %rdx
14001008b: 45 31 c9                    	xorl	%r9d, %r9d
14001008e: e8 ad 8c 86 05              	callq	0x145878d40 <.text+0x5877d40>
140010093: 48 b8 00 00 00 00 00 00 00 80       	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
14001009d: eb c0                       	jmp	0x14001005f <.text+0xf05f>

; custom-mode-niche-flag
0000000140001000 <.text>:
14000fbe1: 48 f7 df                    	negq	%rdi
14000fbe4: 0f 90 c3                    	seto	%bl

; mode-closure-store
0000000140001000 <.text>:
14000fc92: 4c 89 30                    	movq	%r14, (%rax)
14000fc95: 88 58 08                    	movb	%bl, 0x8(%rax)

; mode-closure-callback
0000000140001000 <.text>:
14000f9e5: 48 89 d6                    	movq	%rdx, %rsi
14000f9e8: 48 8b 39                    	movq	(%rcx), %rdi
14000f9eb: 8a 59 08                    	movb	0x8(%rcx), %bl
14000f9ee: 48 89 7d e8                 	movq	%rdi, -0x18(%rbp)
14000f9f2: 88 5d f0                    	movb	%bl, -0x10(%rbp)
14000f9f5: c6 45 ff 01                 	movb	$0x1, -0x1(%rbp)
14000f9f9: 48 89 d1                    	movq	%rdx, %rcx
14000f9fc: e8 df 55 15 00              	callq	0x140164fe0 <.text+0x163fe0>
14000fa01: 90                          	nop
14000fa02: 3c 01                       	cmpb	$0x1, %al
14000fa04: 77 22                       	ja	0x14000fa28 <.text+0xea28>
14000fa06: c6 45 ff 00                 	movb	$0x0, -0x1(%rbp)
14000fa0a: 4c 8d 0d 67 ec d5 05        	leaq	0x5d5ec67(%rip), %r9    # 0x145d6e678
14000fa11: 48 89 f9                    	movq	%rdi, %rcx
14000fa14: 89 da                       	movl	%ebx, %edx
14000fa16: 49 89 f0                    	movq	%rsi, %r8
14000fa19: e8 d2 43 05 00              	callq	0x140063df0 <.text+0x62df0>

; frontend-mode-load
0000000140001000 <.text>:
14004004a: 45 0f b6 7e 08              	movzbl	0x8(%r14), %r15d

; frontend-mode-resource-fields
0000000140001000 <.text>:
140040322: c7 85 80 00 00 00 00 00 00 00       	movl	$0x0, 0x80(%rbp)
14004032c: c7 85 88 00 00 00 00 00 00 00       	movl	$0x0, 0x88(%rbp)
140040336: 44 88 bd 8c 00 00 00        	movb	%r15b, 0x8c(%rbp)
14004033d: 44 88 bd 8d 00 00 00        	movb	%r15b, 0x8d(%rbp)
140040344: 66 c7 85 8e 00 00 00 00 00  	movw	$0x0, 0x8e(%rbp)

; terminal-return-label
0000000140001000 <.text>:
1401b1087: 49 8b 06                    	movq	(%r14), %rax
1401b108a: 80 78 0c 00                 	cmpb	$0x0, 0xc(%rax)
1401b108e: 74 1b                       	je	0x1401b10ab <.text+0x1b00ab>
1401b1090: c6 85 96 07 00 00 01        	movb	$0x1, 0x796(%rbp)
1401b1097: 48 8d 0d 82 7a c0 05        	leaq	0x5c07a82(%rip), %rcx   # 0x145db8b20
1401b109e: ba 0e 00 00 00              	movl	$0xe, %edx
1401b10a3: e8 38 94 72 05              	callq	0x1458da4e0 <.text+0x58d94e0>
1401b10a8: 90                          	nop
1401b10a9: eb 19                       	jmp	0x1401b10c4 <.text+0x1b00c4>
1401b10ab: c6 85 96 07 00 00 01        	movb	$0x1, 0x796(%rbp)
1401b10b2: 48 8d 0d 52 7a c0 05        	leaq	0x5c07a52(%rip), %rcx   # 0x145db8b0b
1401b10b9: ba 15 00 00 00              	movl	$0x15, %edx
1401b10be: e8 1d 94 72 05              	callq	0x1458da4e0 <.text+0x58d94e0>
1401b10c3: 90                          	nop

; menu-command-dispatch
0000000140001000 <.text>:
1458a5376: 48 89 f1                    	movq	%rsi, %rcx
1458a5379: 48 81 c4 c8 20 00 00        	addq	$0x20c8, %rsp           # imm = 0x20C8
1458a5380: 5b                          	popq	%rbx
1458a5381: 5f                          	popq	%rdi
1458a5382: 5e                          	popq	%rsi
1458a5383: 41 5c                       	popq	%r12
1458a5385: 41 5d                       	popq	%r13
1458a5387: 41 5e                       	popq	%r14
1458a5389: 41 5f                       	popq	%r15
1458a538b: 5d                          	popq	%rbp
1458a538c: e9 df bf ff ff              	jmp	0x1458a1370 <.text+0x58a0370>

; menu-return-owner
0000000140001000 <.text>:
1458a1370: 55                          	pushq	%rbp
1458a1371: 56                          	pushq	%rsi
1458a1372: 57                          	pushq	%rdi
1458a1373: 53                          	pushq	%rbx
1458a1374: 48 81 ec 88 00 00 00        	subq	$0x88, %rsp
1458a137b: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1458a1383: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1458a138b: 48 89 ce                    	movq	%rcx, %rsi
1458a138e: 48 8b 89 c8 0a 00 00        	movq	0xac8(%rcx), %rcx
1458a1395: 48 85 c9                    	testq	%rcx, %rcx
1458a1398: 0f 84 cb 01 00 00           	je	0x1458a1569 <.text+0x58a0569>
1458a139e: 48 8b 86 c0 0a 00 00        	movq	0xac0(%rsi), %rax
1458a13a5: 48 69 c9 b0 00 00 00        	imulq	$0xb0, %rcx, %rcx
1458a13ac: 31 ff                       	xorl	%edi, %edi
1458a13ae: 31 db                       	xorl	%ebx, %ebx
1458a13b0: 80 bc 18 a8 00 00 00 00     	cmpb	$0x0, 0xa8(%rax,%rbx)
1458a13b8: 75 14                       	jne	0x1458a13ce <.text+0x58a03ce>
1458a13ba: 48 ff c7                    	incq	%rdi
1458a13bd: 48 81 c3 b0 00 00 00        	addq	$0xb0, %rbx
1458a13c4: 48 39 d9                    	cmpq	%rbx, %rcx
1458a13c7: 75 e7                       	jne	0x1458a13b0 <.text+0x58a03b0>
1458a13c9: e9 9b 01 00 00              	jmp	0x1458a1569 <.text+0x58a0569>
1458a13ce: 48 89 f1                    	movq	%rsi, %rcx
1458a13d1: e8 ba 02 00 00              	callq	0x1458a1690 <.text+0x58a0690>
1458a13d6: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1458a13da: 74 0e                       	je	0x1458a13ea <.text+0x58a03ea>
1458a13dc: 48 8d 4e 10                 	leaq	0x10(%rsi), %rcx
1458a13e0: 48 89 4d f8                 	movq	%rcx, -0x8(%rbp)
1458a13e4: e8 37 33 ff ff              	callq	0x145894720 <.text+0x5893720>
1458a13e9: 90                          	nop
1458a13ea: 48 c7 46 10 02 00 00 00     	movq	$0x2, 0x10(%rsi)
1458a13f2: 48 8b 96 c8 0e 00 00        	movq	0xec8(%rsi), %rdx
1458a13f9: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1458a13fd: 74 39                       	je	0x1458a1438 <.text+0x58a0438>
1458a13ff: 48 85 d2                    	testq	%rdx, %rdx
1458a1402: 74 12                       	je	0x1458a1416 <.text+0x58a0416>
1458a1404: 48 8b 8e d0 0e 00 00        	movq	0xed0(%rsi), %rcx
1458a140b: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458a1411: e8 ba 0d 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458a1416: 48 8b 96 e0 0e 00 00        	movq	0xee0(%rsi), %rdx
1458a141d: 48 85 d2                    	testq	%rdx, %rdx
1458a1420: 74 16                       	je	0x1458a1438 <.text+0x58a0438>
1458a1422: 48 8b 8e e8 0e 00 00        	movq	0xee8(%rsi), %rcx
1458a1429: 48 c1 e2 04                 	shlq	$0x4, %rdx
1458a142d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1458a1433: e8 98 0d 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458a1438: 48 c7 86 c8 0e 00 00 ff ff ff ff    	movq	$-0x1, 0xec8(%rsi)
1458a1443: 48 8b 96 c8 0a 00 00        	movq	0xac8(%rsi), %rdx
1458a144a: 48 39 d7                    	cmpq	%rdx, %rdi
1458a144d: 0f 83 50 01 00 00           	jae	0x1458a15a3 <.text+0x58a05a3>
1458a1453: 48 8b 86 c0 0a 00 00        	movq	0xac0(%rsi), %rax
1458a145a: c6 84 18 a8 00 00 00 00     	movb	$0x0, 0xa8(%rax,%rbx)
1458a1462: e8 99 0d 76 fa              	callq	0x140002200 <.text+0x1200>
1458a1467: b9 20 00 00 00              	movl	$0x20, %ecx
1458a146c: ba 01 00 00 00              	movl	$0x1, %edx
1458a1471: e8 4a 0d 76 fa              	callq	0x1400021c0 <.text+0x11c0>
1458a1476: 48 85 c0                    	testq	%rax, %rax
1458a1479: 0f 84 35 01 00 00           	je	0x1458a15b4 <.text+0x58a05b4>
1458a147f: 66 c7 45 e8 4d 00           	movw	$0x4d, -0x18(%rbp)
1458a1485: 48 c7 45 d0 20 00 00 00     	movq	$0x20, -0x30(%rbp)
1458a148d: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1458a1491: 48 c7 45 e0 00 00 00 00     	movq	$0x0, -0x20(%rbp)
1458a1499: 48 8b 8e c0 0a 00 00        	movq	0xac0(%rsi), %rcx
1458a14a0: 48 8b 96 c8 0a 00 00        	movq	0xac8(%rsi), %rdx
1458a14a7: 4c 8d 4d d0                 	leaq	-0x30(%rbp), %r9
1458a14ab: 49 89 f8                    	movq	%rdi, %r8
1458a14ae: e8 2d 4f ff ff              	callq	0x1458963e0 <.text+0x58953e0>
1458a14b3: 48 8b be 40 10 00 00        	movq	0x1040(%rsi), %rdi
1458a14ba: 48 8b b6 48 10 00 00        	movq	0x1048(%rsi), %rsi
1458a14c1: e8 3a 0d 76 fa              	callq	0x140002200 <.text+0x1200>
1458a14c6: b9 01 00 00 00              	movl	$0x1, %ecx
1458a14cb: ba 01 00 00 00              	movl	$0x1, %edx
1458a14d0: e8 eb 0c 76 fa              	callq	0x1400021c0 <.text+0x11c0>
1458a14d5: 48 85 c0                    	testq	%rax, %rax
1458a14d8: 0f 84 e7 00 00 00           	je	0x1458a15c5 <.text+0x58a05c5>
1458a14de: c6 00 7b                    	movb	$0x7b, (%rax)
1458a14e1: 48 c7 45 d0 01 00 00 00     	movq	$0x1, -0x30(%rbp)
1458a14e9: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1458a14ed: 48 c7 45 e0 01 00 00 00     	movq	$0x1, -0x20(%rbp)
1458a14f5: c6 45 e8 01                 	movb	$0x1, -0x18(%rbp)
1458a14f9: 48 8d 05 d8 60 31 01        	leaq	0x13160d8(%rip), %rax   # 0x146bb75d8
1458a1500: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1458a1505: 48 c7 44 24 28 06 00 00 00  	movq	$0x6, 0x28(%rsp)
1458a150e: 4c 8d 05 1e 5e 31 01        	leaq	0x1315e1e(%rip), %r8    # 0x146bb7333
1458a1515: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458a1519: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
1458a151d: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1458a1523: e8 88 82 03 00              	callq	0x1458d97b0 <.text+0x58d87b0>
1458a1528: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458a152c: 4c 8b 45 c0                 	movq	-0x40(%rbp), %r8
1458a1530: 4c 39 c0                    	cmpq	%r8, %rax
1458a1533: 74 40                       	je	0x1458a1575 <.text+0x58a0575>
1458a1535: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
1458a1539: 48 8b 55 b8                 	movq	-0x48(%rbp), %rdx
1458a153d: 42 c6 04 02 7d              	movb	$0x7d, (%rdx,%r8)
1458a1542: 49 ff c0                    	incq	%r8
1458a1545: 48 89 f9                    	movq	%rdi, %rcx
1458a1548: 48 89 55 f0                 	movq	%rdx, -0x10(%rbp)
1458a154c: ff 56 18                    	callq	*0x18(%rsi)
1458a154f: 90                          	nop
1458a1550: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
1458a1554: 48 85 d2                    	testq	%rdx, %rdx
1458a1557: 74 10                       	je	0x1458a1569 <.text+0x58a0569>
1458a1559: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458a155f: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
1458a1563: e8 68 0c 76 fa              	callq	0x1400021d0 <.text+0x11d0>
1458a1568: 90                          	nop
1458a1569: 48 81 c4 88 00 00 00        	addq	$0x88, %rsp
1458a1570: 5b                          	popq	%rbx
1458a1571: 5f                          	popq	%rdi
1458a1572: 5e                          	popq	%rsi
1458a1573: 5d                          	popq	%rbp
1458a1574: c3                          	retq
1458a1575: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1458a157e: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1458a1582: 4c 89 c2                    	movq	%r8, %rdx
1458a1585: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1458a158b: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1458a1591: 48 89 d3                    	movq	%rdx, %rbx
1458a1594: e8 37 9d 32 00              	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a1599: 90                          	nop
1458a159a: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1458a159e: 49 89 d8                    	movq	%rbx, %r8
1458a15a1: eb 92                       	jmp	0x1458a1535 <.text+0x58a0535>
1458a15a3: 4c 8d 05 16 60 31 01        	leaq	0x1316016(%rip), %r8    # 0x146bb75c0
1458a15aa: 48 89 f9                    	movq	%rdi, %rcx
1458a15ad: e8 31 82 4c 00              	callq	0x145d697e3 <.text+0x5d687e3>
1458a15b2: 0f 0b                       	ud2
1458a15b4: b9 01 00 00 00              	movl	$0x1, %ecx
1458a15b9: ba 20 00 00 00              	movl	$0x20, %edx
1458a15be: e8 88 7e 4c 00              	callq	0x145d6944b <.text+0x5d6844b>
1458a15c3: 0f 0b                       	ud2
1458a15c5: b9 01 00 00 00              	movl	$0x1, %ecx
1458a15ca: ba 01 00 00 00              	movl	$0x1, %edx
1458a15cf: e8 77 7e 4c 00              	callq	0x145d6944b <.text+0x5d6844b>
1458a15d4: 0f 0b                       	ud2
