
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14011a2a0: 48 89 c8                    	movq	%rcx, %rax
14011a2a3: 44 0f b6 82 8c 00 00 00     	movzbl	0x8c(%rdx), %r8d
14011a2ab: 0f 57 c0                    	xorps	%xmm0, %xmm0
14011a2ae: 48 8d 15 b4 a2 7c 05        	leaq	0x57ca2b4(%rip), %rdx   # 0x1458e4569
14011a2b5: 41 ff c8                    	decl	%r8d
14011a2b8: 41 83 f8 08                 	cmpl	$0x8, %r8d
14011a2bc: 0f 87 01 01 00 00           	ja	0x14011a3c3 <.text+0x1193c3>
14011a2c2: b9 01 00 00 00              	movl	$0x1, %ecx
14011a2c7: 4c 8d 0d 72 ca 7c 05        	leaq	0x57cca72(%rip), %r9    # 0x1458e6d40
14011a2ce: 4f 63 04 81                 	movslq	(%r9,%r8,4), %r8
14011a2d2: 4d 01 c8                    	addq	%r9, %r8
14011a2d5: 41 ff e0                    	jmpq	*%r8
14011a2d8: 48 8d 0d 5e a2 7c 05        	leaq	0x57ca25e(%rip), %rcx   # 0x1458e453d
14011a2df: eb 22                       	jmp	0x14011a303 <.text+0x119303>
14011a2e1: 48 8d 15 6e a2 7c 05        	leaq	0x57ca26e(%rip), %rdx   # 0x1458e4556
14011a2e8: eb 63                       	jmp	0x14011a34d <.text+0x11934d>
14011a2ea: 48 8d 15 6b a2 7c 05        	leaq	0x57ca26b(%rip), %rdx   # 0x1458e455c
14011a2f1: eb 5a                       	jmp	0x14011a34d <.text+0x11934d>
14011a2f3: 48 8d 0d 68 a2 7c 05        	leaq	0x57ca268(%rip), %rcx   # 0x1458e4562
14011a2fa: eb 07                       	jmp	0x14011a303 <.text+0x119303>
14011a2fc: 48 8d 0d 41 a2 7c 05        	leaq	0x57ca241(%rip), %rcx   # 0x1458e4544
14011a303: ba 57 41 52 52              	movl	$0x52524157, %edx       # imm = 0x52524157
14011a308: 33 11                       	xorl	(%rcx), %edx
14011a30a: 41 b8 52 49 4f 52           	movl	$0x524f4952, %r8d       # imm = 0x524F4952
14011a310: 44 33 41 03                 	xorl	0x3(%rcx), %r8d
14011a314: 41 09 d0                    	orl	%edx, %r8d
14011a317: 0f 84 9b 00 00 00           	je	0x14011a3b8 <.text+0x1193b8>
14011a31d: ba 57 41 52 4c              	movl	$0x4c524157, %edx       # imm = 0x4C524157
14011a322: 33 11                       	xorl	(%rcx), %edx
14011a324: 41 b8 4c 4f 43 4b           	movl	$0x4b434f4c, %r8d       # imm = 0x4B434F4C
14011a32a: 44 33 41 03                 	xorl	0x3(%rcx), %r8d
14011a32e: 41 09 d0                    	orl	%edx, %r8d
14011a331: 0f 84 c6 00 00 00           	je	0x14011a3fd <.text+0x1193fd>
14011a337: 31 c9                       	xorl	%ecx, %ecx
14011a339: f3 0f 10 05 2f 62 7a 05     	movss	0x57a622f(%rip), %xmm0  # 0x1458c0570
14011a341: e9 cb 00 00 00              	jmp	0x14011a411 <.text+0x119411>
14011a346: 48 8d 15 fe a1 7c 05        	leaq	0x57ca1fe(%rip), %rdx   # 0x1458e454b
14011a34d: 41 b8 48 55 4e 54           	movl	$0x544e5548, %r8d       # imm = 0x544E5548
14011a353: 44 33 02                    	xorl	(%rdx), %r8d
14011a356: 44 0f b7 4a 04              	movzwl	0x4(%rdx), %r9d
14011a35b: 41 81 f1 45 52 00 00        	xorl	$0x5245, %r9d           # imm = 0x5245
14011a362: f3 0f 10 05 42 e1 78 05     	movss	0x578e142(%rip), %xmm0  # 0x1458a84ac
14011a36a: 45 09 c1                    	orl	%r8d, %r9d
14011a36d: 74 49                       	je	0x14011a3b8 <.text+0x1193b8>
14011a36f: 41 b8 53 48 41 4d           	movl	$0x4d414853, %r8d       # imm = 0x4D414853
14011a375: 44 33 02                    	xorl	(%rdx), %r8d
14011a378: 44 0f b7 4a 04              	movzwl	0x4(%rdx), %r9d
14011a37d: 41 81 f1 41 4e 00 00        	xorl	$0x4e41, %r9d           # imm = 0x4E41
14011a384: 45 09 c1                    	orl	%r8d, %r9d
14011a387: 0f 84 84 00 00 00           	je	0x14011a411 <.text+0x119411>
14011a38d: 41 b8 50 52 49 45           	movl	$0x45495250, %r8d       # imm = 0x45495250
14011a393: 44 33 02                    	xorl	(%rdx), %r8d
14011a396: 0f b7 52 04                 	movzwl	0x4(%rdx), %edx
14011a39a: 81 f2 53 54 00 00           	xorl	$0x5453, %edx           # imm = 0x5453
14011a3a0: 31 c9                       	xorl	%ecx, %ecx
14011a3a2: 44 09 c2                    	orl	%r8d, %edx
14011a3a5: 0f 94 c1                    	sete	%cl
14011a3a8: 48 8d 15 b9 61 7a 05        	leaq	0x57a61b9(%rip), %rdx   # 0x1458c0568
14011a3af: f3 0f 10 04 8a              	movss	(%rdx,%rcx,4), %xmm0
14011a3b4: 01 c9                       	addl	%ecx, %ecx
14011a3b6: eb 59                       	jmp	0x14011a411 <.text+0x119411>
14011a3b8: 31 c9                       	xorl	%ecx, %ecx
14011a3ba: eb 55                       	jmp	0x14011a411 <.text+0x119411>
14011a3bc: 48 8d 15 8e a1 7c 05        	leaq	0x57ca18e(%rip), %rdx   # 0x1458e4551
14011a3c3: b9 52 4f 47 55              	movl	$0x55474f52, %ecx       # imm = 0x55474F52
14011a3c8: 33 0a                       	xorl	(%rdx), %ecx
14011a3ca: 44 0f b6 42 04              	movzbl	0x4(%rdx), %r8d
14011a3cf: 41 83 f0 45                 	xorl	$0x45, %r8d
14011a3d3: 41 09 c8                    	orl	%ecx, %r8d
14011a3d6: 74 1e                       	je	0x14011a3f6 <.text+0x1193f6>
14011a3d8: b9 44 52 55 49              	movl	$0x49555244, %ecx       # imm = 0x49555244
14011a3dd: 33 0a                       	xorl	(%rdx), %ecx
14011a3df: 0f b6 52 04                 	movzbl	0x4(%rdx), %edx
14011a3e3: 83 f2 44                    	xorl	$0x44, %edx
14011a3e6: 09 ca                       	orl	%ecx, %edx
14011a3e8: 74 22                       	je	0x14011a40c <.text+0x11940c>
14011a3ea: f3 0f 10 05 7e 61 7a 05     	movss	0x57a617e(%rip), %xmm0  # 0x1458c0570
14011a3f2: 31 c9                       	xorl	%ecx, %ecx
14011a3f4: eb 1b                       	jmp	0x14011a411 <.text+0x119411>
14011a3f6: b9 02 00 00 00              	movl	$0x2, %ecx
14011a3fb: eb 14                       	jmp	0x14011a411 <.text+0x119411>
14011a3fd: b9 03 00 00 00              	movl	$0x3, %ecx
14011a402: f3 0f 10 05 a2 e0 78 05     	movss	0x578e0a2(%rip), %xmm0  # 0x1458a84ac
14011a40a: eb 05                       	jmp	0x14011a411 <.text+0x119411>
14011a40c: b9 03 00 00 00              	movl	$0x3, %ecx
14011a411: 48 8d 15 58 a1 7c 05        	leaq	0x57ca158(%rip), %rdx   # 0x1458e4570
14011a418: f3 0f 10 0d 8c e0 78 05     	movss	0x578e08c(%rip), %xmm1  # 0x1458a84ac
14011a420: f3 0f 58 c8                 	addss	%xmm0, %xmm1
14011a424: f2 0f 10 14 8a              	movsd	(%rdx,%rcx,4), %xmm2
14011a429: 0f 28 da                    	movaps	%xmm2, %xmm3
14011a42c: 0f c6 d8 04                 	shufps	$0x4, %xmm0, %xmm3      # xmm3 = xmm3[0,1],xmm0[0,0]
14011a430: 0f c6 db d8                 	shufps	$0xd8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,1,3]
14011a434: 0f c6 d1 01                 	shufps	$0x1, %xmm1, %xmm2      # xmm2 = xmm2[1,0],xmm1[0,0]
14011a438: 0f c6 d2 d8                 	shufps	$0xd8, %xmm2, %xmm2     # xmm2 = xmm2[0,2,1,3]
14011a43c: 0f 28 c3                    	movaps	%xmm3, %xmm0
14011a43f: 0f c2 c2 01                 	cmpltps	%xmm2, %xmm0
14011a443: f2 0f 12 ca                 	movddup	%xmm2, %xmm1            # xmm1 = xmm2[0,0]
14011a447: 0f c2 d3 01                 	cmpltps	%xmm3, %xmm2
14011a44b: 0f c6 d0 23                 	shufps	$0x23, %xmm0, %xmm2     # xmm2 = xmm2[3,0],xmm0[2,0]
14011a44f: 0f c6 c2 24                 	shufps	$0x24, %xmm2, %xmm0     # xmm0 = xmm0[0,1],xmm2[2,0]
14011a453: f2 0f 12 d3                 	movddup	%xmm3, %xmm2            # xmm2 = xmm3[0,0]
14011a457: 66 0f 54 d0                 	andpd	%xmm0, %xmm2
14011a45b: 66 0f 55 c1                 	andnpd	%xmm1, %xmm0
14011a45f: 66 0f 56 c2                 	orpd	%xmm2, %xmm0
14011a463: 66 0f 11 00                 	movupd	%xmm0, (%rax)
14011a467: c3                          	retq
14011a468: cc                          	int3
14011a469: cc                          	int3
14011a46a: cc                          	int3
14011a46b: cc                          	int3
14011a46c: cc                          	int3
14011a46d: cc                          	int3
14011a46e: cc                          	int3
14011a46f: cc                          	int3
