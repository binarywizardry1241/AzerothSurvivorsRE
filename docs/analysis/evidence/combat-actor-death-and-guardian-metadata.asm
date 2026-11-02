
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145494227: 45 0f 2e e2                 	ucomiss	%xmm10, %xmm12
14549422b: 0f 82 f1 01 00 00           	jb	0x145494422 <.text+0x5493422>
145494231: 48 8b 86 c0 04 00 00        	movq	0x4c0(%rsi), %rax
145494238: 48 8b 8e c8 04 00 00        	movq	0x4c8(%rsi), %rcx
14549423f: 4c 8d 88 a8 fe ff ff        	leaq	-0x158(%rax), %r9
145494246: 4c 69 c1 58 01 00 00        	imulq	$0x158, %rcx, %r8       # imm = 0x158
14549424d: 0f 1f 00                    	nopl	(%rax)
145494250: 4d 85 c0                    	testq	%r8, %r8
145494253: 0f 84 97 00 00 00           	je	0x1454942f0 <.text+0x54932f0>
145494259: 49 8d 91 58 01 00 00        	leaq	0x158(%r9), %rdx
145494260: 49 81 c0 a8 fe ff ff        	addq	$-0x158, %r8            # imm = 0xFEA8
145494267: 49 39 b9 e0 01 00 00        	cmpq	%rdi, 0x1e0(%r9)
14549426e: 49 89 d1                    	movq	%rdx, %r9
145494271: 75 dd                       	jne	0x145494250 <.text+0x5493250>
145494273: f3 0f 10 ba f4 00 00 00     	movss	0xf4(%rdx), %xmm7
14549427b: c6 85 75 01 00 00 00        	movb	$0x0, 0x175(%rbp)
145494282: 48 8d 8d 00 01 00 00        	leaq	0x100(%rbp), %rcx
145494289: e8 92 16 05 00              	callq	0x1454e5920 <.text+0x54e4920>
14549428e: 90                          	nop
14549428f: f3 0f 11 bd 18 01 00 00     	movss	%xmm7, 0x118(%rbp)
145494297: 44 0f 13 85 1c 01 00 00     	movlps	%xmm8, 0x11c(%rbp)
14549429f: f3 44 0f 11 8d 24 01 00 00  	movss	%xmm9, 0x124(%rbp)
1454942a8: 48 8b 85 00 01 00 00        	movq	0x100(%rbp), %rax
1454942af: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1454942b6: 48 8b 85 08 01 00 00        	movq	0x108(%rbp), %rax
1454942bd: 48 89 85 80 00 00 00        	movq	%rax, 0x80(%rbp)
1454942c4: 0f 10 85 10 01 00 00        	movups	0x110(%rbp), %xmm0
1454942cb: 0f 29 45 00                 	movaps	%xmm0, (%rbp)
1454942cf: 48 8b 85 20 01 00 00        	movq	0x120(%rbp), %rax
1454942d6: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454942da: 48 8b 86 c0 04 00 00        	movq	0x4c0(%rsi), %rax
1454942e1: 48 8b 8e c8 04 00 00        	movq	0x4c8(%rsi), %rcx
1454942e8: 8b 9d 70 01 00 00           	movl	0x170(%rbp), %ebx
1454942ee: eb 0b                       	jmp	0x1454942fb <.text+0x54932fb>
1454942f0: 48 c7 85 f0 00 00 00 ff ff ff ff    	movq	$-0x1, 0xf0(%rbp)
1454942fb: f3 44 0f 10 9e cc 08 00 00  	movss	0x8cc(%rsi), %xmm11
145494304: 48 05 a8 fe ff ff           	addq	$-0x158, %rax           # imm = 0xFEA8
14549430a: 48 69 d1 58 01 00 00        	imulq	$0x158, %rcx, %rdx      # imm = 0x158
145494311: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
145494320: 48 85 d2                    	testq	%rdx, %rdx
145494323: 0f 84 c0 11 00 00           	je	0x1454954e9 <.text+0x54944e9>
145494329: 48 8d 88 58 01 00 00        	leaq	0x158(%rax), %rcx
145494330: 48 81 c2 a8 fe ff ff        	addq	$-0x158, %rdx           # imm = 0xFEA8
145494337: 48 39 b8 e0 01 00 00        	cmpq	%rdi, 0x1e0(%rax)
14549433e: 48 89 c8                    	movq	%rcx, %rax
145494341: 75 dd                       	jne	0x145494320 <.text+0x5493320>
145494343: f3 0f 10 b9 28 01 00 00     	movss	0x128(%rcx), %xmm7
14549434b: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549434e: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
145494351: 0f 83 db 00 00 00           	jae	0x145494432 <.text+0x5493432>
145494357: f3 44 0f 10 a1 24 01 00 00  	movss	0x124(%rcx), %xmm12
145494360: 41 0f 28 cb                 	movaps	%xmm11, %xmm1
145494364: f3 41 0f 5c cc              	subss	%xmm12, %xmm1
145494369: f3 0f 5e cf                 	divss	%xmm7, %xmm1
14549436d: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
145494371: f3 0f 10 0d 57 c6 40 00     	movss	0x40c657(%rip), %xmm1   # 0x1458a09d0
145494379: f3 0f 5d c8                 	minss	%xmm0, %xmm1
14549437d: f3 0f 10 81 14 01 00 00     	movss	0x114(%rcx), %xmm0
145494385: f3 0f 10 91 20 01 00 00     	movss	0x120(%rcx), %xmm2
14549438d: f3 0f 5c d0                 	subss	%xmm0, %xmm2
145494391: f3 0f 59 d1                 	mulss	%xmm1, %xmm2
145494395: f3 0f 58 d0                 	addss	%xmm0, %xmm2
145494399: f2 0f 10 81 0c 01 00 00     	movsd	0x10c(%rcx), %xmm0
1454943a1: f2 0f 10 99 18 01 00 00     	movsd	0x118(%rcx), %xmm3
1454943a9: 0f 5c d8                    	subps	%xmm0, %xmm3
1454943ac: f3 0f 12 c9                 	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454943b0: 0f 59 cb                    	mulps	%xmm3, %xmm1
1454943b3: 0f 58 c8                    	addps	%xmm0, %xmm1
1454943b6: 0f 13 8d d8 00 00 00        	movlps	%xmm1, 0xd8(%rbp)
1454943bd: f3 0f 11 95 e0 00 00 00     	movss	%xmm2, 0xe0(%rbp)
1454943c5: e9 8b 00 00 00              	jmp	0x145494455 <.text+0x5493455>
1454943ca: 31 c0                       	xorl	%eax, %eax
1454943cc: 4c 89 b5 00 01 00 00        	movq	%r14, 0x100(%rbp)
1454943d3: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
1454943da: 48 c7 85 10 01 00 00 00 00 00 00    	movq	$0x0, 0x110(%rbp)
1454943e5: 4c 89 8d 18 01 00 00        	movq	%r9, 0x118(%rbp)
1454943ec: 48 c7 85 20 01 00 00 1c 00 00 00    	movq	$0x1c, 0x120(%rbp)
1454943f7: c6 85 75 01 00 00 00        	movb	$0x0, 0x175(%rbp)
1454943fe: 48 8d 8d b0 00 00 00        	leaq	0xb0(%rbp), %rcx
145494405: 48 8d 95 00 01 00 00        	leaq	0x100(%rbp), %rdx
14549440c: e8 1f 9f f4 ff              	callq	0x1453de330 <.text+0x53dd330>
145494411: 90                          	nop
145494412: 8b 9d 70 01 00 00           	movl	0x170(%rbp), %ebx
145494418: 45 0f 2e e2                 	ucomiss	%xmm10, %xmm12
14549441c: 0f 83 0f fe ff ff           	jae	0x145494231 <.text+0x5493231>
145494422: 48 c7 85 f0 00 00 00 ff ff ff ff    	movq	$-0x1, 0xf0(%rbp)
14549442d: e9 c7 10 00 00              	jmp	0x1454954f9 <.text+0x54944f9>
145494432: 8b 81 20 01 00 00           	movl	0x120(%rcx), %eax
145494438: 89 85 e0 00 00 00           	movl	%eax, 0xe0(%rbp)
14549443e: 48 8b 81 18 01 00 00        	movq	0x118(%rcx), %rax
145494445: 48 89 85 d8 00 00 00        	movq	%rax, 0xd8(%rbp)
14549444c: f3 44 0f 10 a1 24 01 00 00  	movss	0x124(%rcx), %xmm12
145494455: 8b 85 e0 00 00 00           	movl	0xe0(%rbp), %eax
14549445b: 89 81 14 01 00 00           	movl	%eax, 0x114(%rcx)
145494461: 48 8b 85 d8 00 00 00        	movq	0xd8(%rbp), %rax
145494468: 48 89 81 0c 01 00 00        	movq	%rax, 0x10c(%rcx)
14549446f: 48 8b 85 d8 00 00 00        	movq	0xd8(%rbp), %rax
145494476: 48 89 81 18 01 00 00        	movq	%rax, 0x118(%rcx)
14549447d: 8b 85 e0 00 00 00           	movl	0xe0(%rbp), %eax
145494483: 89 81 20 01 00 00           	movl	%eax, 0x120(%rcx)
145494489: 0f 57 c0                    	xorps	%xmm0, %xmm0
14549448c: f3 41 0f 10 c3              	movss	%xmm11, %xmm0           # xmm0 = xmm11[0],xmm0[1,2,3]
145494491: 0f 13 81 24 01 00 00        	movlps	%xmm0, 0x124(%rcx)
145494498: c7 41 68 01 00 00 00        	movl	$0x1, 0x68(%rcx)
14549449f: f3 44 0f 11 59 6c           	movss	%xmm11, 0x6c(%rcx)
1454944a5: 48 c7 41 10 00 00 00 00     	movq	$0x0, 0x10(%rcx)
1454944ad: 48 83 79 18 ff              	cmpq	$-0x1, 0x18(%rcx)
1454944b2: 74 06                       	je	0x1454944ba <.text+0x54934ba>
1454944b4: 4c 8b 71 30                 	movq	0x30(%rcx), %r14
1454944b8: eb 03                       	jmp	0x1454944bd <.text+0x54934bd>
1454944ba: 45 31 f6                    	xorl	%r14d, %r14d
1454944bd: 4c 8b 69 40                 	movq	0x40(%rcx), %r13
1454944c1: 49 83 fd ff                 	cmpq	$-0x1, %r13
1454944c5: 74 0a                       	je	0x1454944d1 <.text+0x54934d1>
1454944c7: 48 8b 41 58                 	movq	0x58(%rcx), %rax
1454944cb: 48 89 45 78                 	movq	%rax, 0x78(%rbp)
1454944cf: eb 00                       	jmp	0x1454944d1 <.text+0x54934d1>
1454944d1: 4c 8b a1 90 00 00 00        	movq	0x90(%rcx), %r12
1454944d8: 44 8a b9 54 01 00 00        	movb	0x154(%rcx), %r15b
