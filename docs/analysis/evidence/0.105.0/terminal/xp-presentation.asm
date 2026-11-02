

Disassembly of section .text:

0000000140001000 <.text>:
1458a1d80: 48 8b 55 20                 	movq	0x20(%rbp), %rdx
1458a1d84: 49 c1 e6 04                 	shlq	$0x4, %r14
1458a1d88: 4c 8b bd c0 00 00 00        	movq	0xc0(%rbp), %r15
1458a1d8f: 4d 01 fe                    	addq	%r15, %r14
1458a1d92: 4c 8d 95 89 00 00 00        	leaq	0x89(%rbp), %r10
1458a1d99: 41 b1 01                    	movb	$0x1, %r9b
1458a1d9c: 48 8d 75 70                 	leaq	0x70(%rbp), %rsi
1458a1da0: b8 01 00 00 00              	movl	$0x1, %eax
1458a1da5: 4c 8b ad b8 00 00 00        	movq	0xb8(%rbp), %r13
1458a1dac: 4d 39 f7                    	cmpq	%r14, %r15
1458a1daf: 4c 89 85 a8 00 00 00        	movq	%r8, 0xa8(%rbp)
1458a1db6: 0f 84 71 02 00 00           	je	0x1458a202d <.text+0x58a102d>
1458a1dbc: 0f 1f 40 00                 	nopl	(%rax)
1458a1dc0: 49 8b 5f 08                 	movq	0x8(%r15), %rbx
1458a1dc4: 48 85 db                    	testq	%rbx, %rbx
1458a1dc7: 7f 0e                       	jg	0x1458a1dd7 <.text+0x58a0dd7>
1458a1dc9: 49 83 c7 10                 	addq	$0x10, %r15
1458a1dcd: 4d 39 f7                    	cmpq	%r14, %r15
1458a1dd0: 75 ee                       	jne	0x1458a1dc0 <.text+0x58a0dc0>
1458a1dd2: e9 56 02 00 00              	jmp	0x1458a202d <.text+0x58a102d>
1458a1dd7: 48 89 95 c8 00 00 00        	movq	%rdx, 0xc8(%rbp)
1458a1dde: 49 8b 37                    	movq	(%r15), %rsi
1458a1de1: 48 89 c1                    	movq	%rax, %rcx
1458a1de4: 48 8b 85 38 01 00 00        	movq	0x138(%rbp), %rax
1458a1deb: 48 89 45 70                 	movq	%rax, 0x70(%rbp)
1458a1def: 4c 89 45 78                 	movq	%r8, 0x78(%rbp)
1458a1df3: 48 89 8d 80 00 00 00        	movq	%rcx, 0x80(%rbp)
1458a1dfa: 44 88 8d 88 00 00 00        	movb	%r9b, 0x88(%rbp)
1458a1e01: 8b 45 58                    	movl	0x58(%rbp), %eax
1458a1e04: 8b 4d 5b                    	movl	0x5b(%rbp), %ecx
1458a1e07: 41 89 4a 03                 	movl	%ecx, 0x3(%r10)
1458a1e0b: 41 89 02                    	movl	%eax, (%r10)
1458a1e0e: e8 ed 03 76 fa              	callq	0x140002200 <.text+0x1200>
1458a1e13: b9 01 00 00 00              	movl	$0x1, %ecx
1458a1e18: ba 01 00 00 00              	movl	$0x1, %edx
1458a1e1d: e8 9e 03 76 fa              	callq	0x1400021c0 <.text+0x11c0>
1458a1e22: 48 85 c0                    	testq	%rax, %rax
1458a1e25: 0f 84 f1 11 00 00           	je	0x1458a301c <.text+0x58a201c>
1458a1e2b: c6 00 7b                    	movb	$0x7b, (%rax)
1458a1e2e: 48 c7 85 d0 00 00 00 01 00 00 00    	movq	$0x1, 0xd0(%rbp)
1458a1e39: 48 89 85 d8 00 00 00        	movq	%rax, 0xd8(%rbp)
1458a1e40: 48 c7 85 e0 00 00 00 01 00 00 00    	movq	$0x1, 0xe0(%rbp)
1458a1e4b: c6 85 e8 00 00 00 01        	movb	$0x1, 0xe8(%rbp)
1458a1e52: 48 83 fe 05                 	cmpq	$0x5, %rsi
1458a1e56: 75 32                       	jne	0x1458a1e8a <.text+0x58a0e8a>
1458a1e58: c6 85 82 01 00 00 01        	movb	$0x1, 0x182(%rbp)
1458a1e5f: ba 0b 00 00 00              	movl	$0xb, %edx
1458a1e64: 48 8d 0d 75 59 31 01        	leaq	0x1315975(%rip), %rcx   # 0x146bb77e0
1458a1e6b: e8 20 87 03 00              	callq	0x1458da590 <.text+0x58d9590>
1458a1e70: 90                          	nop
1458a1e71: 48 85 c0                    	testq	%rax, %rax
1458a1e74: b9 0b 00 00 00              	movl	$0xb, %ecx
1458a1e79: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
1458a1e7d: 48 8d 0d 5c 59 31 01        	leaq	0x131595c(%rip), %rcx   # 0x146bb77e0
1458a1e84: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1458a1e88: eb 70                       	jmp	0x1458a1efa <.text+0x58a0efa>
1458a1e8a: c6 85 82 01 00 00 01        	movb	$0x1, 0x182(%rbp)
1458a1e91: ba 11 00 00 00              	movl	$0x11, %edx
1458a1e96: 48 8d 0d 4e 59 31 01        	leaq	0x131594e(%rip), %rcx   # 0x146bb77eb
1458a1e9d: e8 ee 86 03 00              	callq	0x1458da590 <.text+0x58d9590>
1458a1ea2: 90                          	nop
1458a1ea3: 48 85 c0                    	testq	%rax, %rax
1458a1ea6: b9 11 00 00 00              	movl	$0x11, %ecx
1458a1eab: 48 0f 44 d1                 	cmoveq	%rcx, %rdx
1458a1eaf: 48 8d 0d 35 59 31 01        	leaq	0x1315935(%rip), %rcx   # 0x146bb77eb
1458a1eb6: 48 0f 44 c1                 	cmoveq	%rcx, %rax
1458a1eba: 48 83 fe 04                 	cmpq	$0x4, %rsi
1458a1ebe: 77 3a                       	ja	0x1458a1efa <.text+0x58a0efa>
1458a1ec0: 48 c1 e6 04                 	shlq	$0x4, %rsi
1458a1ec4: 48 8d 05 c5 58 31 01        	leaq	0x13158c5(%rip), %rax   # 0x146bb7790
1458a1ecb: 48 01 c6                    	addq	%rax, %rsi
1458a1ece: 48 8b 0e                    	movq	(%rsi), %rcx
1458a1ed1: 48 89 4d c0                 	movq	%rcx, -0x40(%rbp)
1458a1ed5: 48 8b 76 08                 	movq	0x8(%rsi), %rsi
1458a1ed9: c6 85 82 01 00 00 01        	movb	$0x1, 0x182(%rbp)
1458a1ee0: 48 89 f2                    	movq	%rsi, %rdx
1458a1ee3: e8 a8 86 03 00              	callq	0x1458da590 <.text+0x58d9590>
1458a1ee8: 48 89 c1                    	movq	%rax, %rcx
1458a1eeb: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
1458a1eef: 48 85 c9                    	testq	%rcx, %rcx
1458a1ef2: 48 0f 44 d6                 	cmoveq	%rsi, %rdx
1458a1ef6: 48 0f 45 c1                 	cmovneq	%rcx, %rax
1458a1efa: c6 85 82 01 00 00 00        	movb	$0x0, 0x182(%rbp)
1458a1f01: 48 89 54 24 28              	movq	%rdx, 0x28(%rsp)
1458a1f06: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1458a1f0b: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1458a1f11: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a1f18: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a1f1f: 4c 8d 05 15 54 31 01        	leaq	0x1315415(%rip), %r8    # 0x146bb733b
1458a1f26: e8 85 78 03 00              	callq	0x1458d97b0 <.text+0x58d87b0>
1458a1f2b: 90                          	nop
1458a1f2c: f2 48 0f 2a c3              	cvtsi2sd	%rbx, %xmm0
1458a1f31: c6 85 83 01 00 00 01        	movb	$0x1, 0x183(%rbp)
1458a1f38: f2 0f 11 44 24 20           	movsd	%xmm0, 0x20(%rsp)
1458a1f3e: 41 b9 02 00 00 00           	movl	$0x2, %r9d
1458a1f44: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a1f4b: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a1f52: 4c 8d 05 8d 56 31 01        	leaq	0x131568d(%rip), %r8    # 0x146bb75e6
1458a1f59: e8 c2 4b 03 00              	callq	0x1458d6b20 <.text+0x58d5b20>
1458a1f5e: 90                          	nop
1458a1f5f: 48 8d 75 70                 	leaq	0x70(%rbp), %rsi
1458a1f63: 48 8b 9d e0 00 00 00        	movq	0xe0(%rbp), %rbx
1458a1f6a: 48 39 9d d0 00 00 00        	cmpq	%rbx, 0xd0(%rbp)
1458a1f71: 0f 84 8c 00 00 00           	je	0x1458a2003 <.text+0x58a1003>
1458a1f77: 48 8b 85 d8 00 00 00        	movq	0xd8(%rbp), %rax
1458a1f7e: c6 04 18 7d                 	movb	$0x7d, (%rax,%rbx)
1458a1f82: 48 ff c3                    	incq	%rbx
1458a1f85: 48 89 9d 50 01 00 00        	movq	%rbx, 0x150(%rbp)
1458a1f8c: 0f 10 85 d0 00 00 00        	movups	0xd0(%rbp), %xmm0
1458a1f93: 0f 29 85 40 01 00 00        	movaps	%xmm0, 0x140(%rbp)
1458a1f9a: c6 85 83 01 00 00 00        	movb	$0x0, 0x183(%rbp)
1458a1fa1: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1458a1fa5: 48 89 f2                    	movq	%rsi, %rdx
1458a1fa8: 4c 8d 85 40 01 00 00        	leaq	0x140(%rbp), %r8
1458a1faf: e8 fc 72 03 00              	callq	0x1458d92b0 <.text+0x58d82b0>
1458a1fb4: 90                          	nop
1458a1fb5: 49 83 c7 10                 	addq	$0x10, %r15
1458a1fb9: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1458a1fbd: 48 89 85 38 01 00 00        	movq	%rax, 0x138(%rbp)
1458a1fc4: 4c 8b 45 d0                 	movq	-0x30(%rbp), %r8
1458a1fc8: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx



Disassembly of section .text:

0000000140001000 <.text>:
1458a20ab: 48 8d 05 2c 55 31 01        	leaq	0x131552c(%rip), %rax   # 0x146bb75de
1458a20b2: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1458a20b7: 48 c7 44 24 28 08 00 00 00  	movq	$0x8, 0x28(%rsp)
1458a20c0: 4c 8d 05 6c 52 31 01        	leaq	0x131526c(%rip), %r8    # 0x146bb7333
1458a20c7: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a20ce: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a20d5: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1458a20db: e8 d0 76 03 00              	callq	0x1458d97b0 <.text+0x58d87b0>
1458a20e0: 90                          	nop
1458a20e1: 8b 85 34 01 00 00           	movl	0x134(%rbp), %eax
1458a20e7: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a20ee: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1458a20f2: 4c 8d 05 ed 54 31 01        	leaq	0x13154ed(%rip), %r8    # 0x146bb75e6
1458a20f9: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a2100: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a2107: 41 b9 02 00 00 00           	movl	$0x2, %r9d
1458a210d: e8 0e 4d 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a2112: 90                          	nop
1458a2113: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a211a: 48 8b 45 38                 	movq	0x38(%rbp), %rax
1458a211e: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1458a2122: 4c 8d 05 bf 54 31 01        	leaq	0x13154bf(%rip), %r8    # 0x146bb75e8
1458a2129: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a2130: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a2137: 41 b9 06 00 00 00           	movl	$0x6, %r9d
1458a213d: e8 de 4c 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a2142: 90                          	nop
1458a2143: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a214a: 48 8b 45 b8                 	movq	-0x48(%rbp), %rax
1458a214e: 89 44 24 20                 	movl	%eax, 0x20(%rsp)
1458a2152: 4c 8d 05 95 54 31 01        	leaq	0x1315495(%rip), %r8    # 0x146bb75ee
1458a2159: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a2160: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a2167: 41 b9 05 00 00 00           	movl	$0x5, %r9d
1458a216d: e8 ae 4c 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a2172: 90                          	nop
1458a2173: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a217a: 44 89 74 24 20              	movl	%r14d, 0x20(%rsp)
1458a217f: 4c 8d 05 6d 54 31 01        	leaq	0x131546d(%rip), %r8    # 0x146bb75f3
1458a2186: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a218d: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a2194: 41 b9 06 00 00 00           	movl	$0x6, %r9d
1458a219a: e8 81 4c 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a219f: 90                          	nop
1458a21a0: 44 2b 75 68                 	subl	0x68(%rbp), %r14d
1458a21a4: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a21ab: 44 89 74 24 20              	movl	%r14d, 0x20(%rsp)
1458a21b0: 4c 8d 05 42 54 31 01        	leaq	0x1315442(%rip), %r8    # 0x146bb75f9
1458a21b7: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a21be: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a21c5: 41 b9 06 00 00 00           	movl	$0x6, %r9d
1458a21cb: e8 50 4c 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a21d0: 90                          	nop
1458a21d1: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a21d8: 89 7c 24 20                 	movl	%edi, 0x20(%rsp)
1458a21dc: 4c 8d 05 1c 54 31 01        	leaq	0x131541c(%rip), %r8    # 0x146bb75ff
1458a21e3: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a21ea: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a21f1: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1458a21f7: e8 24 4c 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a21fc: 90                          	nop
1458a21fd: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a2204: 44 89 64 24 20              	movl	%r12d, 0x20(%rsp)
1458a2209: 4c 8d 05 f3 53 31 01        	leaq	0x13153f3(%rip), %r8    # 0x146bb7603
1458a2210: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a2217: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a221e: 41 b9 04 00 00 00           	movl	$0x4, %r9d
1458a2224: e8 f7 4b 03 00              	callq	0x1458d6e20 <.text+0x58d5e20>
1458a2229: 90                          	nop
1458a222a: 0f 10 45 48                 	movups	0x48(%rbp), %xmm0
1458a222e: c6 85 86 01 00 00 01        	movb	$0x1, 0x186(%rbp)
1458a2235: 0f 11 44 24 20              	movups	%xmm0, 0x20(%rsp)
1458a223a: 4c 8d 25 93 51 31 01        	leaq	0x1315193(%rip), %r12   # 0x146bb73d4
1458a2241: 48 8d 8d 40 01 00 00        	leaq	0x140(%rbp), %rcx
1458a2248: 48 8d 95 d0 00 00 00        	leaq	0xd0(%rbp), %rdx
1458a224f: 41 b9 05 00 00 00           	movl	$0x5, %r9d
1458a2255: 4d 89 e0                    	movq	%r12, %r8
1458a2258: e8 53 75 03 00              	callq	0x1458d97b0 <.text+0x58d87b0>
1458a225d: 90                          	nop
1458a225e: 48 8b 95 38 01 00 00        	movq	0x138(%rbp), %rdx
1458a2265: 48 89 95 d0 00 00 00        	movq	%rdx, 0xd0(%rbp)
1458a226c: 4c 8b 85 a8 00 00 00        	movq	0xa8(%rbp), %r8
1458a2273: 4c 89 85 d8 00 00 00        	movq	%r8, 0xd8(%rbp)
1458a227a: 4c 8b 8d c8 00 00 00        	movq	0xc8(%rbp), %r9
1458a2281: 4c 89 8d e0 00 00 00        	movq	%r9, 0xe0(%rbp)
1458a2288: 44 88 bd e8 00 00 00        	movb	%r15b, 0xe8(%rbp)
1458a228f: 8b 45 58                    	movl	0x58(%rbp), %eax
1458a2292: 8b 4d 5b                    	movl	0x5b(%rbp), %ecx
1458a2295: 89 85 e9 00 00 00           	movl	%eax, 0xe9(%rbp)
1458a229b: 89 8d ec 00 00 00           	movl	%ecx, 0xec(%rbp)
1458a22a1: 4c 89 c0                    	movq	%r8, %rax
1458a22a4: 4c 39 ca                    	cmpq	%r9, %rdx
1458a22a7: 0f 84 91 00 00 00           	je	0x1458a233e <.text+0x58a133e>
1458a22ad: 48 8d 3d 32 53 31 01        	leaq	0x1315332(%rip), %rdi   # 0x146bb75e6
1458a22b4: 42 c6 04 08 5d              	movb	$0x5d, (%rax,%r9)
1458a22b9: 49 ff c1                    	incq	%r9
1458a22bc: 4c 89 8d 80 00 00 00        	movq	%r9, 0x80(%rbp)
1458a22c3: 48 8b 85 d0 00 00 00        	movq	0xd0(%rbp), %rax
1458a22ca: 48 89 45 70                 	movq	%rax, 0x70(%rbp)
1458a22ce: 48 8b 85 d8 00 00 00        	movq	0xd8(%rbp), %rax
1458a22d5: 48 89 45 78                 	movq	%rax, 0x78(%rbp)
1458a22d9: c6 85 7f 01 00 00 00        	movb	$0x0, 0x17f(%rbp)
1458a22e0: 48 89 74 24 20              	movq	%rsi, 0x20(%rsp)
1458a22e5: 4c 8d 05 1b 53 31 01        	leaq	0x131531b(%rip), %r8    # 0x146bb7607
1458a22ec: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
1458a22f3: 48 8d 95 40 01 00 00        	leaq	0x140(%rbp), %rdx
1458a22fa: 41 b9 05 00 00 00           	movl	$0x5, %r9d
1458a2300: e8 6b 73 03 00              	callq	0x1458d9670 <.text+0x58d8670>
