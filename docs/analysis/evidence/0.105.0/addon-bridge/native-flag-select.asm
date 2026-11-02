
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145910c67: 4d 8b 8d 28 06 00 00        	movq	0x628(%r13), %r9
145910c6e: eb 03                       	jmp	0x145910c73 <.text+0x590fc73>
145910c70: 45 31 c9                    	xorl	%r9d, %r9d
145910c73: f2 41 0f 10 8d c8 04 00 00  	movsd	0x4c8(%r13), %xmm1
145910c7c: 4d 8b b5 20 06 00 00        	movq	0x620(%r13), %r14
145910c83: 4a 8d 04 cd 00 00 00 00     	leaq	(,%r9,8), %rax
145910c8b: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
145910c8f: 45 31 c0                    	xorl	%r8d, %r8d
145910c92: 31 c9                       	xorl	%ecx, %ecx
145910c94: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
145910ca0: 48 39 c8                    	cmpq	%rcx, %rax
145910ca3: 0f 84 a9 00 00 00           	je	0x145910d52 <.text+0x590fd52>
145910ca9: 48 8d 51 28                 	leaq	0x28(%rcx), %rdx
145910cad: 49 ff c8                    	decq	%r8
145910cb0: 49 83 3c 0e 00              	cmpq	$0x0, (%r14,%rcx)
145910cb5: 48 89 d1                    	movq	%rdx, %rcx
145910cb8: 74 e6                       	je	0x145910ca0 <.text+0x590fca0>
145910cba: 4c 89 c1                    	movq	%r8, %rcx
145910cbd: 48 f7 d1                    	notq	%rcx
145910cc0: 48 29 d0                    	subq	%rdx, %rax
145910cc3: 0f 84 9e 00 00 00           	je	0x145910d67 <.text+0x590fd67>
145910cc9: 4d 8d 14 16                 	leaq	(%r14,%rdx), %r10
145910ccd: 4d 8d 1c 16                 	leaq	(%r14,%rdx), %r11
145910cd1: 49 83 c3 d8                 	addq	$-0x28, %r11
145910cd5: 48 ba cd cc cc cc cc cc cc cc       	movabsq	$-0x3333333333333333, %rdx # imm = 0xCCCCCCCCCCCCCCCD
145910cdf: 48 f7 e2                    	mulq	%rdx
145910ce2: 48 c1 ea 05                 	shrq	$0x5, %rdx
145910ce6: 49 f7 d8                    	negq	%r8
145910ce9: 31 c0                       	xorl	%eax, %eax
145910ceb: eb 0f                       	jmp	0x145910cfc <.text+0x590fcfc>
145910ced: 0f 1f 00                    	nopl	(%rax)
145910cf0: 48 ff c0                    	incq	%rax
145910cf3: 49 83 c2 28                 	addq	$0x28, %r10
145910cf7: 48 39 c2                    	cmpq	%rax, %rdx
145910cfa: 74 6b                       	je	0x145910d67 <.text+0x590fd67>
145910cfc: 49 83 3a 00                 	cmpq	$0x0, (%r10)
145910d00: 74 ee                       	je	0x145910cf0 <.text+0x590fcf0>
145910d02: f2 41 0f 10 43 18           	movsd	0x18(%r11), %xmm0
145910d08: 0f 5c c1                    	subps	%xmm1, %xmm0
145910d0b: 0f 59 c0                    	mulps	%xmm0, %xmm0
145910d0e: f2 41 0f 10 52 18           	movsd	0x18(%r10), %xmm2
145910d14: 0f 5c d1                    	subps	%xmm1, %xmm2
145910d17: 0f 59 d2                    	mulps	%xmm2, %xmm2
145910d1a: f2 0f 7c c2                 	haddps	%xmm2, %xmm0
145910d1e: 0f c6 c0 e8                 	shufps	$0xe8, %xmm0, %xmm0     # xmm0 = xmm0[0,2,2,3]
145910d22: 0f 51 c0                    	sqrtps	%xmm0, %xmm0
145910d25: 0f 28 d0                    	movaps	%xmm0, %xmm2
145910d28: 66 0f 72 e2 1f              	psrad	$0x1f, %xmm2
145910d2d: 66 0f 72 d2 01              	psrld	$0x1, %xmm2
145910d32: 66 0f ef d0                 	pxor	%xmm0, %xmm2
145910d36: 66 0f 70 c2 55              	pshufd	$0x55, %xmm2, %xmm0     # xmm0 = xmm2[1,1,1,1]
145910d3b: 66 0f 66 d0                 	pcmpgtd	%xmm0, %xmm2
145910d3f: 66 0f 7e d6                 	movd	%xmm2, %esi
145910d43: 40 f6 c6 01                 	testb	$0x1, %sil
145910d47: 74 a7                       	je	0x145910cf0 <.text+0x590fcf0>
145910d49: 49 8d 0c 00                 	leaq	(%r8,%rax), %rcx
145910d4d: 4d 89 d3                    	movq	%r10, %r11
145910d50: eb 9e                       	jmp	0x145910cf0 <.text+0x590fcf0>
145910d52: 4d 85 c9                    	testq	%r9, %r9
145910d55: 0f 84 12 f1 ff ff           	je	0x14590fe6d <.text+0x590ee6d>
145910d5b: 49 83 f9 01                 	cmpq	$0x1, %r9
145910d5f: 0f 85 2c 02 00 00           	jne	0x145910f91 <.text+0x590ff91>
145910d65: 31 c9                       	xorl	%ecx, %ecx
145910d67: 41 80 bd 60 0a 00 00 00     	cmpb	$0x0, 0xa60(%r13)
145910d6f: 74 4a                       	je	0x145910dbb <.text+0x590fdbb>
145910d71: 41 80 7d 00 00              	cmpb	$0x0, (%r13)
145910d76: 0f 84 d1 00 00 00           	je	0x145910e4d <.text+0x590fe4d>
145910d7c: f3 41 0f 10 85 ec 09 00 00  	movss	0x9ec(%r13), %xmm0
145910d85: 49 39 4d 08                 	cmpq	%rcx, 0x8(%r13)
145910d89: 0f 85 c9 00 00 00           	jne	0x145910e58 <.text+0x590fe58>
145910d8f: 41 80 bd 61 0a 00 00 00     	cmpb	$0x0, 0xa61(%r13)
145910d97: 0f 84 bb 00 00 00           	je	0x145910e58 <.text+0x590fe58>
145910d9d: 0f 28 c8                    	movaps	%xmm0, %xmm1
145910da0: f3 41 0f 5c 8d 04 0a 00 00  	subss	0xa04(%r13), %xmm1
145910da9: 0f 2e 0d 70 63 2a 01        	ucomiss	0x12a6370(%rip), %xmm1  # 0x146bb7120
145910db0: 0f 86 b7 f0 ff ff           	jbe	0x14590fe6d <.text+0x590ee6d>
145910db6: e9 9d 00 00 00              	jmp	0x145910e58 <.text+0x590fe58>
145910dbb: 49 c7 45 00 01 00 00 00     	movq	$0x1, (%r13)
145910dc3: 49 89 4d 08                 	movq	%rcx, 0x8(%r13)
145910dc7: 41 80 bd 61 0a 00 00 00     	cmpb	$0x0, 0xa61(%r13)
145910dcf: 41 c6 85 61 0a 00 00 00     	movb	$0x0, 0xa61(%r13)
145910dd7: 0f 84 90 f0 ff ff           	je	0x14590fe6d <.text+0x590ee6d>
145910ddd: f3 0f 16 d1                 	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
145910de1: 48 c7 44 24 20 00 00 00 00  	movq	$0x0, 0x20(%rsp)
145910dea: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145910df1: 41 b9 01 00 00 00           	movl	$0x1, %r9d
145910df7: e8 e4 8c f9 ff              	callq	0x1458a9ae0 <.text+0x58a8ae0>
145910dfc: 49 8b b5 e0 05 00 00        	movq	0x5e0(%r13), %rsi
145910e03: 49 3b b5 d0 05 00 00        	cmpq	0x5d0(%r13), %rsi
145910e0a: 75 0d                       	jne	0x145910e19 <.text+0x590fe19>
145910e0c: 48 8b 8d 50 03 00 00        	movq	0x350(%rbp), %rcx
145910e13: e8 18 a7 2b 00              	callq	0x145bcb530 <.text+0x5bca530>
145910e18: 90                          	nop
145910e19: 49 8b 85 d8 05 00 00        	movq	0x5d8(%r13), %rax
145910e20: 48 89 f1                    	movq	%rsi, %rcx
145910e23: 48 c1 e1 05                 	shlq	$0x5, %rcx
145910e27: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
145910e2e: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
145910e35: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
145910e3a: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
145910e3e: 48 ff c6                    	incq	%rsi
145910e41: 49 89 b5 e0 05 00 00        	movq	%rsi, 0x5e0(%r13)
145910e48: e9 20 f0 ff ff              	jmp	0x14590fe6d <.text+0x590ee6d>
145910e4d: 48 8b 85 80 00 00 00        	movq	0x80(%rbp), %rax
145910e54: f3 0f 10 00                 	movss	(%rax), %xmm0
145910e58: 49 c7 45 00 01 00 00 00     	movq	$0x1, (%r13)
145910e60: 49 89 4d 08                 	movq	%rcx, 0x8(%r13)
145910e64: f3 41 0f 11 85 04 0a 00 00  	movss	%xmm0, 0xa04(%r13)
145910e6d: 41 c6 85 61 0a 00 00 01     	movb	$0x1, 0xa61(%r13)
145910e75: 4c 39 c9                    	cmpq	%r9, %rcx
145910e78: 0f 83 03 0b 00 00           	jae	0x145911981 <.text+0x5910981>
145910e7e: 4c 8d 3c 89                 	leaq	(%rcx,%rcx,4), %r15
145910e82: 49 8b 8d 90 02 00 00        	movq	0x290(%r13), %rcx
145910e89: 49 8b 95 98 02 00 00        	movq	0x298(%r13), %rdx
145910e90: e8 1b 45 f6 ff              	callq	0x1458753b0 <.text+0x58743b0>
145910e95: 48 69 c0 f0 00 00 00        	imulq	$0xf0, %rax, %rax
145910e9c: 4b 8b 4c fe 10              	movq	0x10(%r14,%r15,8), %rcx
145910ea1: 4a 8b 94 20 80 00 00 00     	movq	0x80(%rax,%r12), %rdx
145910ea9: 48 39 d1                    	cmpq	%rdx, %rcx
145910eac: 0f 83 e0 0a 00 00           	jae	0x145911992 <.text+0x5910992>
145910eb2: 49 01 c4                    	addq	%rax, %r12
145910eb5: 49 8b 74 24 78              	movq	0x78(%r12), %rsi
145910eba: 48 8d 3c 89                 	leaq	(%rcx,%rcx,4), %rdi
145910ebe: 48 c1 e7 04                 	shlq	$0x4, %rdi
145910ec2: 48 8d 04 3e                 	leaq	(%rsi,%rdi), %rax
145910ec6: 48 83 c0 20                 	addq	$0x20, %rax
145910eca: 48 89 85 30 02 00 00        	movq	%rax, 0x230(%rbp)
145910ed1: 48 8d 05 a8 d0 29 00        	leaq	0x29d0a8(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
145910ed8: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
145910edf: 48 8d 15 7a fe 28 01        	leaq	0x128fe7a(%rip), %rdx   # 0x146ba0d60
145910ee6: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
145910eed: 4c 8d 85 30 02 00 00        	leaq	0x230(%rbp), %r8
145910ef4: e8 d7 b5 28 00              	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145910ef9: 48 8b 8d a8 00 00 00        	movq	0xa8(%rbp), %rcx
145910f00: 48 8b 95 b0 00 00 00        	movq	0xb0(%rbp), %rdx
145910f07: 4c 8b 64 3e 10              	movq	0x10(%rsi,%rdi), %r12
145910f0c: 4c 8b 6c 3e 18              	movq	0x18(%rsi,%rdi), %r13
145910f11: 48 89 8d 70 03 00 00        	movq	%rcx, 0x370(%rbp)
145910f18: e8 73 96 fc ff              	callq	0x1458da590 <.text+0x58d9590>
145910f1d: 90                          	nop
145910f1e: 48 89 c3                    	movq	%rax, %rbx
145910f21: 48 89 d7                    	movq	%rdx, %rdi
145910f24: 4f 8d 34 fe                 	leaq	(%r14,%r15,8), %r14
145910f28: 48 8b 95 a0 00 00 00        	movq	0xa0(%rbp), %rdx
145910f2f: 48 85 d2                    	testq	%rdx, %rdx
145910f32: 48 8d b5 e0 02 00 00        	leaq	0x2e0(%rbp), %rsi
145910f39: 74 12                       	je	0x145910f4d <.text+0x590ff4d>
145910f3b: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145910f41: 48 8b 8d 70 03 00 00        	movq	0x370(%rbp), %rcx
145910f48: e8 83 12 6f fa              	callq	0x1400021d0 <.text+0x11d0>
145910f4d: 48 85 db                    	testq	%rbx, %rbx
145910f50: 4c 0f 45 e3                 	cmovneq	%rbx, %r12
145910f54: 49 0f 44 fd                 	cmoveq	%r13, %rdi
145910f58: 4c 89 a5 e0 02 00 00        	movq	%r12, 0x2e0(%rbp)
145910f5f: 48 89 bd e8 02 00 00        	movq	%rdi, 0x2e8(%rbp)
145910f66: 49 83 3e 00                 	cmpq	$0x0, (%r14)
145910f6a: 0f 84 99 00 00 00           	je	0x145911009 <.text+0x5910009>
145910f70: 48 89 b5 a0 00 00 00        	movq	%rsi, 0xa0(%rbp)
145910f77: 48 8d 05 42 11 6f fa        	leaq	-0x590eebe(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145910f7e: 48 89 85 a8 00 00 00        	movq	%rax, 0xa8(%rbp)
145910f85: 48 8d 15 1c 9f 56 01        	leaq	0x1569f1c(%rip), %rdx   # 0x146e7aea8
145910f8c: e9 94 00 00 00              	jmp	0x145911025 <.text+0x5910025>
145910f91: 49 8d 56 28                 	leaq	0x28(%r14), %rdx
145910f95: 48 83 c0 d8                 	addq	$-0x28, %rax
145910f99: 48 c1 e8 03                 	shrq	$0x3, %rax
145910f9d: 49 b8 cd cc cc cc cc cc cc cc       	movabsq	$-0x3333333333333333, %r8 # imm = 0xCCCCCCCCCCCCCCCD
145910fa7: 4c 0f af c0                 	imulq	%rax, %r8
145910fab: 49 f7 d8                    	negq	%r8
145910fae: b8 01 00 00 00              	movl	$0x1, %eax
145910fb3: 45 31 d2                    	xorl	%r10d, %r10d
145910fb6: 4d 89 f3                    	movq	%r14, %r11
145910fb9: eb 23                       	jmp	0x145910fde <.text+0x590ffde>
145910fbb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
145910fc0: 49 8d 3c 00                 	leaq	(%r8,%rax), %rdi
145910fc4: 48 ff c7                    	incq	%rdi
145910fc7: 48 ff c0                    	incq	%rax
145910fca: 48 83 c2 28                 	addq	$0x28, %rdx
145910fce: 49 89 f3                    	movq	%rsi, %r11
145910fd1: 49 89 ca                    	movq	%rcx, %r10
145910fd4: 48 83 ff 01                 	cmpq	$0x1, %rdi
145910fd8: 0f 84 89 fd ff ff           	je	0x145910d67 <.text+0x590fd67>
145910fde: 41 8b 4b 24                 	movl	0x24(%r11), %ecx
145910fe2: 8b 72 24                    	movl	0x24(%rdx), %esi
145910fe5: 89 cf                       	movl	%ecx, %edi
145910fe7: c1 ff 1f                    	sarl	$0x1f, %edi
145910fea: d1 ef                       	shrl	%edi
145910fec: 31 cf                       	xorl	%ecx, %edi
145910fee: 89 f3                       	movl	%esi, %ebx
145910ff0: c1 fb 1f                    	sarl	$0x1f, %ebx
145910ff3: d1 eb                       	shrl	%ebx
145910ff5: 31 f3                       	xorl	%esi, %ebx
145910ff7: 48 89 d6                    	movq	%rdx, %rsi
145910ffa: 48 89 c1                    	movq	%rax, %rcx
145910ffd: 39 df                       	cmpl	%ebx, %edi
145910fff: 7f bf                       	jg	0x145910fc0 <.text+0x590ffc0>
145911001: 4c 89 de                    	movq	%r11, %rsi
145911004: 4c 89 d1                    	movq	%r10, %rcx
145911007: eb b7                       	jmp	0x145910fc0 <.text+0x590ffc0>
