

Disassembly of section .text:

0000000140001000 <.text>:
1458a1751: 8b 81 1c 07 00 00           	movl	0x71c(%rcx), %eax
1458a1757: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1458a175c: 0f b7 81 c0 02 00 00        	movzwl	0x2c0(%rcx), %eax
1458a1763: 45 0f 57 ed                 	xorps	%xmm13, %xmm13
1458a1767: f3 44 0f 2a e8              	cvtsi2ss	%eax, %xmm13
1458a176c: f3 44 0f 10 25 2b bd 4c 00  	movss	0x4cbd2b(%rip), %xmm12  # 0x145d6d4a0
1458a1775: 41 0f 28 cd                 	movaps	%xmm13, %xmm1
1458a1779: f3 41 0f 5e cc              	divss	%xmm12, %xmm1
1458a177e: f3 0f 5e c1                 	divss	%xmm1, %xmm0
1458a1782: f3 48 0f 2c f8              	cvttss2si	%xmm0, %rdi
1458a1787: 31 db                       	xorl	%ebx, %ebx
1458a1789: 45 0f 57 c9                 	xorps	%xmm9, %xmm9
1458a178d: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
1458a1791: 0f 42 fb                    	cmovbl	%ebx, %edi
1458a1794: f3 44 0f 10 15 d7 c0 4c 00  	movss	0x4cc0d7(%rip), %xmm10  # 0x145d6d874
1458a179d: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
1458a17a1: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1458a17a6: 0f 47 f8                    	cmoval	%eax, %edi
1458a17a9: 48 89 8d b8 00 00 00        	movq	%rcx, 0xb8(%rbp)
1458a17b0: 8b b1 28 07 00 00           	movl	0x728(%rcx), %esi
1458a17b6: 4c 89 85 98 00 00 00        	movq	%r8, 0x98(%rbp)
1458a17bd: 4c 89 c1                    	movq	%r8, %rcx
1458a17c0: 48 89 95 a0 00 00 00        	movq	%rdx, 0xa0(%rbp)
1458a17c7: e8 e4 3b fd ff              	callq	0x1458753b0 <.text+0x58743b0>
1458a17cc: f3 48 0f 2a f7              	cvtsi2ss	%rdi, %xmm6
1458a17d1: 48 89 85 70 01 00 00        	movq	%rax, 0x170(%rbp)
1458a17d8: 48 8d 3c f5 00 00 00 00     	leaq	(,%rsi,8), %rdi
1458a17e0: f3 0f 59 35 4c f4 4c 00     	mulss	0x4cf44c(%rip), %xmm6   # 0x145d70c34
1458a17e8: 0f 28 c6                    	movaps	%xmm6, %xmm0
1458a17eb: e8 c1 7f 32 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458a17f0: f3 4c 0f 2c f0              	cvttss2si	%xmm0, %r14
1458a17f5: f3 44 0f 10 1d e2 9f 5b 00  	movss	0x5b9fe2(%rip), %xmm11  # 0x145e5b7e0
1458a17fe: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1458a1802: 49 bc ff ff ff ff ff ff ff 7f       	movabsq	$0x7fffffffffffffff, %r12 # imm = 0x7FFFFFFFFFFFFFFF
1458a180c: 4d 0f 47 f4                 	cmovaq	%r12, %r14
1458a1810: 0f 2e c0                    	ucomiss	%xmm0, %xmm0
1458a1813: 4c 0f 4a f3                 	cmovpq	%rbx, %r14
1458a1817: 41 0f 28 f8                 	movaps	%xmm8, %xmm7
1458a181b: f3 0f 5e 3d 5d dd 51 00     	divss	0x51dd5d(%rip), %xmm7   # 0x145dbf580
1458a1823: f3 0f 59 3d 45 ba 4c 00     	mulss	0x4cba45(%rip), %xmm7   # 0x145d6d270
1458a182b: 0f 28 c7                    	movaps	%xmm7, %xmm0
1458a182e: e8 7e 7f 32 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458a1833: f3 4c 0f 2c e8              	cvttss2si	%xmm0, %r13
1458a1838: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1458a183c: 4d 0f 47 ec                 	cmovaq	%r12, %r13
1458a1840: 0f 2e c0                    	ucomiss	%xmm0, %xmm0
1458a1843: 4c 0f 4a eb                 	cmovpq	%rbx, %r13
1458a1847: 48 8d 3c bf                 	leaq	(%rdi,%rdi,4), %rdi
1458a184b: 4d 85 ff                    	testq	%r15, %r15
1458a184e: 49 c7 c4 38 ff ff ff        	movq	$-0xc8, %r12
1458a1855: 4d 0f 44 e7                 	cmoveq	%r15, %r12
1458a1859: bb c8 00 00 00              	movl	$0xc8, %ebx
1458a185e: 4c 89 7d 40                 	movq	%r15, 0x40(%rbp)
1458a1862: 49 0f 44 df                 	cmoveq	%r15, %rbx
1458a1866: 75 05                       	jne	0x1458a186d <.text+0x58a086d>
1458a1868: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458a186b: eb 08                       	jmp	0x1458a1875 <.text+0x58a0875>
1458a186d: f3 0f 10 0d cb dc 51 00     	movss	0x51dccb(%rip), %xmm1   # 0x145dbf540
1458a1875: f3 48 0f 2a d6              	cvtsi2ss	%rsi, %xmm2
1458a187a: f3 0f 58 fe                 	addss	%xmm6, %xmm7
1458a187e: f3 0f 59 15 ee f3 4c 00     	mulss	0x4cf3ee(%rip), %xmm2   # 0x145d70c74
1458a1886: f3 0f 58 d7                 	addss	%xmm7, %xmm2
1458a188a: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458a188d: f3 0f 2a 85 70 01 00 00     	cvtsi2ssl	0x170(%rbp), %xmm0
1458a1895: f3 0f 59 05 87 58 31 01     	mulss	0x1315887(%rip), %xmm0  # 0x146bb7124
1458a189d: f3 0f 5e 05 fb c0 5d 00     	divss	0x5dc0fb(%rip), %xmm0   # 0x145e7d9a0
1458a18a5: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1458a18a9: f3 0f 10 35 bb ba 4c 00     	movss	0x4cbabb(%rip), %xmm6   # 0x145d6d36c
1458a18b1: f3 0f 58 c6                 	addss	%xmm6, %xmm0
1458a18b5: f3 0f 59 c2                 	mulss	%xmm2, %xmm0
1458a18b9: e8 f3 7e 32 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458a18be: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1458a18c3: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
1458a18c7: be 00 00 00 00              	movl	$0x0, %esi
1458a18cc: 0f 42 c6                    	cmovbl	%esi, %eax
1458a18cf: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
1458a18d3: b9 ff ff ff ff              	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1458a18d8: 0f 47 c1                    	cmoval	%ecx, %eax
1458a18db: 4e 8d 3c 2f                 	leaq	(%rdi,%r13), %r15
1458a18df: 4d 01 f7                    	addq	%r14, %r15
1458a18e2: 4d 29 fc                    	subq	%r15, %r12
1458a18e5: 49 01 c4                    	addq	%rax, %r12
1458a18e8: 4c 89 6d e8                 	movq	%r13, -0x18(%rbp)
1458a18ec: 4c 89 75 f0                 	movq	%r14, -0x10(%rbp)
1458a18f0: 49 01 df                    	addq	%rbx, %r15
1458a18f3: 4d 01 e7                    	addq	%r12, %r15
1458a18f6: 0f 57 c9                    	xorps	%xmm1, %xmm1
1458a18f9: f3 49 0f 2a cf              	cvtsi2ss	%r15, %xmm1
1458a18fe: 48 89 7d f8                 	movq	%rdi, -0x8(%rbp)
1458a1902: f3 0f 10 15 36 4b c4 00     	movss	0xc44b36(%rip), %xmm2   # 0x1464e6440
1458a190a: f3 44 0f 58 ea              	addss	%xmm2, %xmm13
1458a190f: f3 45 0f 5e ec              	divss	%xmm12, %xmm13
1458a1914: 4c 8b ad b8 00 00 00        	movq	0xb8(%rbp), %r13
1458a191b: 41 0f b7 85 c2 02 00 00     	movzwl	0x2c2(%r13), %eax
1458a1923: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458a1926: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1458a192a: f3 44 0f 59 2d 15 24 4d 00  	mulss	0x4d2415(%rip), %xmm13  # 0x145d73d48
1458a1933: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1458a1937: f3 41 0f 5e c4              	divss	%xmm12, %xmm0
1458a193c: f3 0f 59 05 c8 95 4f 00     	mulss	0x4f95c8(%rip), %xmm0   # 0x145d9af0c
1458a1944: f3 41 0f 58 c5              	addss	%xmm13, %xmm0
1458a1949: 41 0f b7 85 c4 02 00 00     	movzwl	0x2c4(%r13), %eax
1458a1951: f3 0f 2a d8                 	cvtsi2ss	%eax, %xmm3
1458a1955: f3 0f 58 da                 	addss	%xmm2, %xmm3
1458a1959: f3 41 0f 5e dc              	divss	%xmm12, %xmm3
1458a195e: f3 0f 59 1d a2 26 4d 00     	mulss	0x4d26a2(%rip), %xmm3   # 0x145d74008
1458a1966: f3 0f 58 d8                 	addss	%xmm0, %xmm3
1458a196a: 41 0f b7 85 c6 02 00 00     	movzwl	0x2c6(%r13), %eax
1458a1972: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458a1975: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1458a1979: 48 89 5d 00                 	movq	%rbx, (%rbp)
1458a197d: f3 0f 58 c2                 	addss	%xmm2, %xmm0
1458a1981: f3 41 0f 5e c4              	divss	%xmm12, %xmm0
1458a1986: f3 0f 58 c0                 	addss	%xmm0, %xmm0
1458a198a: f3 0f 58 c3                 	addss	%xmm3, %xmm0
1458a198e: f3 0f 58 c6                 	addss	%xmm6, %xmm0
1458a1992: f3 0f 5d 05 92 ba 4c 00     	minss	0x4cba92(%rip), %xmm0   # 0x145d6d42c
1458a199a: 4c 89 65 08                 	movq	%r12, 0x8(%rbp)
1458a199e: f3 0f 58 05 6e 23 4d 00     	addss	0x4d236e(%rip), %xmm0   # 0x145d73d14
1458a19a6: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1458a19aa: e8 02 7e 32 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458a19af: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1458a19b4: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1458a19b8: 48 bf ff ff ff ff ff ff ff 7f       	movabsq	$0x7fffffffffffffff, %rdi # imm = 0x7FFFFFFFFFFFFFFF
1458a19c2: 48 0f 47 c7                 	cmovaq	%rdi, %rax
1458a19c6: 0f 2e c0                    	ucomiss	%xmm0, %xmm0
1458a19c9: 48 0f 4a c6                 	cmovpq	%rsi, %rax
1458a19cd: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1458a19d1: 4c 01 f8                    	addq	%r15, %rax
1458a19d4: f3 49 0f 2c c8              	cvttss2si	%xmm8, %rcx
1458a19d9: 45 0f 2e c1                 	ucomiss	%xmm9, %xmm8
1458a19dd: 0f 42 ce                    	cmovbl	%esi, %ecx
1458a19e0: 45 0f 2e c2                 	ucomiss	%xmm10, %xmm8
1458a19e4: ba ff ff ff ff              	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1458a19e9: 0f 47 ca                    	cmoval	%edx, %ecx
1458a19ec: 48 89 8d 70 01 00 00        	movq	%rcx, 0x170(%rbp)
1458a19f3: 0f 57 c0                    	xorps	%xmm0, %xmm0
1458a19f6: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
1458a19fb: f3 41 0f 59 85 d0 10 00 00  	mulss	0x10d0(%r13), %xmm0
1458a1a04: e8 a8 7d 32 00              	callq	0x145bc97b1 <.text+0x5bc87b1>
1458a1a09: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1458a1a0e: 41 0f 2e c3                 	ucomiss	%xmm11, %xmm0
1458a1a12: 48 0f 47 c7                 	cmovaq	%rdi, %rax
1458a1a16: 0f 2e c0                    	ucomiss	%xmm0, %xmm0
1458a1a19: 48 0f 4a c6                 	cmovpq	%rsi, %rax
1458a1a1d: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
1458a1a21: 49 8d bd 58 10 00 00        	leaq	0x1058(%r13), %rdi
1458a1a28: 48 c7 85 e0 00 00 00 00 00 00 00    	movq	$0x0, 0xe0(%rbp)
1458a1a33: 48 c7 85 e8 00 00 00 07 00 00 00    	movq	$0x7, 0xe8(%rbp)
1458a1a3e: 48 8d 45 e8                 	leaq	-0x18(%rbp), %rax
1458a1a42: 48 89 85 d0 00 00 00        	movq	%rax, 0xd0(%rbp)
1458a1a49: 48 89 bd d8 00 00 00        	movq	%rdi, 0xd8(%rbp)
1458a1a50: 48 8d 4d 20                 	leaq	0x20(%rbp), %rcx
1458a1a54: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a1a5b: e8 60 80 10 00              	callq	0x1459a9ac0 <.text+0x59a8ac0>



Disassembly of section .text:

0000000140001000 <.text>:
1458a1b4f: 45 31 c0                    	xorl	%r8d, %r8d
1458a1b52: 48 85 c9                    	testq	%rcx, %rcx
1458a1b55: 4c 0f 4f c1                 	cmovgq	%rcx, %r8
1458a1b59: 44 89 85 34 01 00 00        	movl	%r8d, 0x134(%rbp)
1458a1b60: 48 8b 45 18                 	movq	0x18(%rbp), %rax
1458a1b64: 48 89 47 30                 	movq	%rax, 0x30(%rdi)
1458a1b68: 0f 10 45 e8                 	movups	-0x18(%rbp), %xmm0
1458a1b6c: 0f 10 4d f8                 	movups	-0x8(%rbp), %xmm1
1458a1b70: 0f 10 55 08                 	movups	0x8(%rbp), %xmm2
1458a1b74: 0f 11 57 20                 	movups	%xmm2, 0x20(%rdi)
1458a1b78: 0f 11 4f 10                 	movups	%xmm1, 0x10(%rdi)
1458a1b7c: 0f 11 07                    	movups	%xmm0, (%rdi)
1458a1b7f: 41 b1 01                    	movb	$0x1, %r9b
1458a1b82: 48 81 fb ff ff ff 00        	cmpq	$0xffffff, %rbx         # imm = 0xFFFFFF
1458a1b89: 41 0f 95 c4                 	setne	%r12b
1458a1b8d: 0f 84 df 0b 00 00           	je	0x1458a2772 <.text+0x58a1772>



Disassembly of section .text:

0000000140001000 <.text>:
1458a27ff: 41 80 bd 12 11 00 00 00     	cmpb	$0x0, 0x1112(%r13)
1458a2807: 74 18                       	je	0x1458a2821 <.text+0x58a1821>
1458a2809: 44 88 8d 87 01 00 00        	movb	%r9b, 0x187(%rbp)
1458a2810: 4c 89 f9                    	movq	%r15, %rcx
1458a2813: 44 89 ce                    	movl	%r9d, %esi
1458a2816: e8 85 96 fe ff              	callq	0x14588bea0 <.text+0x588aea0>
1458a281b: 90                          	nop
1458a281c: e9 18 07 00 00              	jmp	0x1458a2f39 <.text+0x58a1f39>
1458a2821: 44 89 8d 70 01 00 00        	movl	%r9d, 0x170(%rbp)
1458a2828: 41 c6 85 12 11 00 00 01     	movb	$0x1, 0x1112(%r13)
1458a2830: 44 84 65 40                 	testb	%r12b, 0x40(%rbp)
1458a2834: 0f 84 6e 06 00 00           	je	0x1458a2ea8 <.text+0x58a1ea8>



Disassembly of section .text:

0000000140001000 <.text>:
1458a2ea8: 49 8b 85 d8 0a 00 00        	movq	0xad8(%r13), %rax
1458a2eaf: 49 6b 95 e0 0a 00 00 38     	imulq	$0x38, 0xae0(%r13), %rdx
1458a2eb7: 31 c9                       	xorl	%ecx, %ecx
1458a2eb9: 49 89 c0                    	movq	%rax, %r8
1458a2ebc: 44 8b 8d 70 01 00 00        	movl	0x170(%rbp), %r9d
1458a2ec3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1458a2ed0: 48 39 ca                    	cmpq	%rcx, %rdx
1458a2ed3: 74 1a                       	je	0x1458a2eef <.text+0x58a1eef>
1458a2ed5: 48 83 c1 38                 	addq	$0x38, %rcx
1458a2ed9: 49 39 58 18                 	cmpq	%rbx, 0x18(%r8)
1458a2edd: 4d 8d 40 38                 	leaq	0x38(%r8), %r8
1458a2ee1: 75 ed                       	jne	0x1458a2ed0 <.text+0x58a1ed0>
1458a2ee3: ff 44 08 f0                 	incl	-0x10(%rax,%rcx)
1458a2ee7: 48 8b 55 40                 	movq	0x40(%rbp), %rdx
1458a2eeb: 01 54 08 f4                 	addl	%edx, -0xc(%rax,%rcx)
1458a2eef: 45 84 e4                    	testb	%r12b, %r12b
1458a2ef2: 74 32                       	je	0x1458a2f26 <.text+0x58a1f26>
1458a2ef4: 49 8b 85 80 0c 00 00        	movq	0xc80(%r13), %rax
1458a2efb: 48 ff c0                    	incq	%rax
1458a2efe: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
1458a2f05: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1458a2f09: 49 89 85 80 0c 00 00        	movq	%rax, 0xc80(%r13)
1458a2f10: 48 8b 45 40                 	movq	0x40(%rbp), %rax
1458a2f14: 49 03 85 88 0c 00 00        	addq	0xc88(%r13), %rax
1458a2f1b: 48 0f 42 c1                 	cmovbq	%rcx, %rax
1458a2f1f: 49 89 85 88 0c 00 00        	movq	%rax, 0xc88(%r13)
1458a2f26: 44 88 8d 87 01 00 00        	movb	%r9b, 0x187(%rbp)
1458a2f2d: 4c 89 f9                    	movq	%r15, %rcx
1458a2f30: 44 89 ce                    	movl	%r9d, %esi
1458a2f33: e8 68 8f fe ff              	callq	0x14588bea0 <.text+0x588aea0>
1458a2f38: 90                          	nop
