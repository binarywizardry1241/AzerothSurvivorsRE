; Supplied0.92.0 SHA-256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140921500: 41 57                       	pushq	%r15
140921502: 41 56                       	pushq	%r14
140921504: 56                          	pushq	%rsi
140921505: 57                          	pushq	%rdi
140921506: 55                          	pushq	%rbp
140921507: 53                          	pushq	%rbx
140921508: 48 83 ec 58                 	subq	$0x58, %rsp
14092150c: bd 01 00 00 00              	movl	$0x1, %ebp
140921511: f0                          	lock
140921512: 41 0f c1 a8 b0 05 00 00     	xaddl	%ebp, 0x5b0(%r8)
14092151a: 80 7a 24 ff                 	cmpb	$-0x1, 0x24(%rdx)
14092151e: 0f 84 ca 01 00 00           	je	0x1409216ee <.text+0x9206ee>
140921524: 4d 89 c6                    	movq	%r8, %r14
140921527: 48 89 d6                    	movq	%rdx, %rsi
14092152a: 49 8b 80 a0 05 00 00        	movq	0x5a0(%r8), %rax
140921531: 48 89 44 24 38              	movq	%rax, 0x38(%rsp)
140921536: 48 39 42 08                 	cmpq	%rax, 0x8(%rdx)
14092153a: 0f 85 c8 01 00 00           	jne	0x140921708 <.text+0x920708>
140921540: 48 8b 46 10                 	movq	0x10(%rsi), %rax
140921544: 49 3b 86 60 02 00 00        	cmpq	0x260(%r14), %rax
14092154b: 0f 83 e8 01 00 00           	jae	0x140921739 <.text+0x920739>
140921551: 48 89 cf                    	movq	%rcx, %rdi
140921554: 49 8b 8e 58 02 00 00        	movq	0x258(%r14), %rcx
14092155b: 48 8b 04 c1                 	movq	(%rcx,%rax,8), %rax
14092155f: 48 85 c0                    	testq	%rax, %rax
140921562: 0f 84 d1 01 00 00           	je	0x140921739 <.text+0x920739>
140921568: 49 8b 9e 28 02 00 00        	movq	0x228(%r14), %rbx
14092156f: 48 f7 d0                    	notq	%rax
140921572: 48 6b c0 38                 	imulq	$0x38, %rax, %rax
140921576: 80 7c 03 30 00              	cmpb	$0x0, 0x30(%rbx,%rax)
14092157b: 0f 84 b8 01 00 00           	je	0x140921739 <.text+0x920739>
140921581: 48 01 c3                    	addq	%rax, %rbx
140921584: 48 89 d9                    	movq	%rbx, %rcx
140921587: e8 e4 f9 fb ff              	callq	0x1408e0f70 <.text+0x8dff70>
14092158c: 48 8b 46 18                 	movq	0x18(%rsi), %rax
140921590: 49 3b 86 18 02 00 00        	cmpq	0x218(%r14), %rax
140921597: 0f 83 da 01 00 00           	jae	0x140921777 <.text+0x920777>
14092159d: 49 8b 8e 10 02 00 00        	movq	0x210(%r14), %rcx
1409215a4: 48 8b 0c c1                 	movq	(%rcx,%rax,8), %rcx
1409215a8: 48 85 c9                    	testq	%rcx, %rcx
1409215ab: 0f 84 c6 01 00 00           	je	0x140921777 <.text+0x920777>
1409215b1: 49 8b 86 e0 01 00 00        	movq	0x1e0(%r14), %rax
1409215b8: 48 f7 d1                    	notq	%rcx
1409215bb: 48 6b c9 38                 	imulq	$0x38, %rcx, %rcx
1409215bf: 80 7c 08 30 00              	cmpb	$0x0, 0x30(%rax,%rcx)
1409215c4: 0f 84 ad 01 00 00           	je	0x140921777 <.text+0x920777>
1409215ca: 48 01 c8                    	addq	%rcx, %rax
1409215cd: 48 8b 48 10                 	movq	0x10(%rax), %rcx
1409215d1: 80 79 10 01                 	cmpb	$0x1, 0x10(%rcx)
1409215d5: 75 08                       	jne	0x1409215df <.text+0x9205df>
1409215d7: 0f b6 41 11                 	movzbl	0x11(%rcx), %eax
1409215db: 34 01                       	xorb	$0x1, %al
1409215dd: eb 02                       	jmp	0x1409215e1 <.text+0x9205e1>
1409215df: 31 c0                       	xorl	%eax, %eax
1409215e1: 4c 8b 73 10                 	movq	0x10(%rbx), %r14
1409215e5: f3 0f 10 01                 	movss	(%rcx), %xmm0
1409215e9: 44 0f b6 79 19              	movzbl	0x19(%rcx), %r15d
1409215ee: 0f b6 4e 24                 	movzbl	0x24(%rsi), %ecx
1409215f2: 80 f9 02                    	cmpb	$0x2, %cl
1409215f5: 75 3c                       	jne	0x140921633 <.text+0x920633>
1409215f7: f3 0f 11 46 20              	movss	%xmm0, 0x20(%rsi)
1409215fc: 88 46 24                    	movb	%al, 0x24(%rsi)
1409215ff: 44 88 7e 25                 	movb	%r15b, 0x25(%rsi)
140921603: 89 6b 2c                    	movl	%ebp, 0x2c(%rbx)
140921606: 41 83 3e 02                 	cmpl	$0x2, (%r14)
14092160a: 0f 84 c5 00 00 00           	je	0x1409216d5 <.text+0x9206d5>
140921610: 84 c0                       	testb	%al, %al
140921612: 75 03                       	jne	0x140921617 <.text+0x920617>
140921614: 0f 57 c0                    	xorps	%xmm0, %xmm0
140921617: f3 0f 10 0d e1 6f f8 04     	movss	0x4f86fe1(%rip), %xmm1  # 0x1458a8600
14092161f: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
140921622: 73 2b                       	jae	0x14092164f <.text+0x92064f>
140921624: e8 88 34 df 04              	callq	0x145714ab1 <.text+0x5713ab1>
140921629: f3 0f 59 05 2f 9e f8 04     	mulss	0x4f89e2f(%rip), %xmm0  # 0x1458ab460
140921631: eb 24                       	jmp	0x140921657 <.text+0x920657>
140921633: 38 c1                       	cmpb	%al, %cl
140921635: 75 c0                       	jne	0x1409215f7 <.text+0x9205f7>
140921637: f3 0f 10 4e 20              	movss	0x20(%rsi), %xmm1
14092163c: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
14092163f: 75 b6                       	jne	0x1409215f7 <.text+0x9205f7>
140921641: 7a b4                       	jp	0x1409215f7 <.text+0x9205f7>
140921643: 44 38 7e 25                 	cmpb	%r15b, 0x25(%rsi)
140921647: 0f 84 88 00 00 00           	je	0x1409216d5 <.text+0x9206d5>
14092164d: eb a8                       	jmp	0x1409215f7 <.text+0x9205f7>
14092164f: f3 0f 10 05 19 87 0b 05     	movss	0x50b8719(%rip), %xmm0  # 0x1459d9d70
140921657: 41 0f b6 8e d8 03 00 00     	movzbl	0x3d8(%r14), %ecx
14092165f: 48 83 f9 03                 	cmpq	$0x3, %rcx
140921663: 0f 83 4c 01 00 00           	jae	0x1409217b5 <.text+0x9207b5>
140921669: 49 8b 86 d0 03 00 00        	movq	0x3d0(%r14), %rax
140921670: 89 ca                       	movl	%ecx, %edx
140921672: c1 e2 07                    	shll	$0x7, %edx
140921675: 48 c7 84 10 80 00 00 00 00 00 00 00 	movq	$0x0, 0x80(%rax,%rdx)
140921681: c7 84 10 a8 00 00 00 00 00 00 00    	movl	$0x0, 0xa8(%rax,%rdx)
14092168c: 48 c7 84 10 b8 00 00 00 00 00 00 00 	movq	$0x0, 0xb8(%rax,%rdx)
140921698: c7 84 10 c0 00 00 00 c0 e1 e4 00    	movl	$0xe4e1c0, 0xc0(%rax,%rdx) # imm = 0xE4E1C0
1409216a3: c7 84 10 c8 00 00 00 07 00 00 00    	movl	$0x7, 0xc8(%rax,%rdx)
1409216ae: f3 0f 11 84 10 cc 00 00 00  	movss	%xmm0, 0xcc(%rax,%rdx)
1409216b7: 80 c9 04                    	orb	$0x4, %cl
1409216ba: 86 88 00 02 00 00           	xchgb	%cl, 0x200(%rax)
1409216c0: 80 e1 03                    	andb	$0x3, %cl
1409216c3: 41 88 8e d8 03 00 00        	movb	%cl, 0x3d8(%r14)
1409216ca: 49 8b 86 c8 03 00 00        	movq	0x3c8(%r14), %rax
1409216d1: 44 88 78 10                 	movb	%r15b, 0x10(%rax)
1409216d5: 89 2e                       	movl	%ebp, (%rsi)
1409216d7: 48 c7 07 fd ff ff ff        	movq	$-0x3, (%rdi)
1409216de: 48 89 f8                    	movq	%rdi, %rax
1409216e1: 48 83 c4 58                 	addq	$0x58, %rsp
1409216e5: 5b                          	popq	%rbx
1409216e6: 5d                          	popq	%rbp
1409216e7: 5f                          	popq	%rdi
1409216e8: 5e                          	popq	%rsi
1409216e9: 41 5e                       	popq	%r14
1409216eb: 41 5f                       	popq	%r15
1409216ed: c3                          	retq
1409216ee: 48 8d 0d db 35 0c 05        	leaq	0x50c35db(%rip), %rcx   # 0x1459e4cd0
1409216f5: 4c 8d 05 34 36 0c 05        	leaq	0x50c3634(%rip), %r8    # 0x1459e4d30
1409216fc: ba 59 00 00 00              	movl	$0x59, %edx
140921701: e8 3a 27 f8 04              	callq	0x1458a3e40 <.text+0x58a2e40>
140921706: 0f 0b                       	ud2
140921708: 48 83 c6 08                 	addq	$0x8, %rsi
14092170c: 48 8d 05 a5 36 0c 05        	leaq	0x50c36a5(%rip), %rax   # 0x1459e4db8
140921713: 48 89 44 24 28              	movq	%rax, 0x28(%rsp)
140921718: 48 c7 44 24 20 df 00 00 00  	movq	$0xdf, 0x20(%rsp)
140921721: 4c 8d 0d 20 36 0c 05        	leaq	0x50c3620(%rip), %r9    # 0x1459e4d48
140921728: 4c 8d 44 24 38              	leaq	0x38(%rsp), %r8
14092172d: 31 c9                       	xorl	%ecx, %ecx
14092172f: 48 89 f2                    	movq	%rsi, %rdx
140921732: e8 46 b8 f3 04              	callq	0x14585cf7d <.text+0x585bf7d>
140921737: 0f 0b                       	ud2
140921739: 48 83 c6 04                 	addq	$0x4, %rsi
14092173d: 48 89 74 24 38              	movq	%rsi, 0x38(%rsp)
140921742: 48 8d 05 d7 99 6a 04        	leaq	0x46a99d7(%rip), %rax   # 0x144fcb120 <.text+0x4fca120>
140921749: 48 89 44 24 40              	movq	%rax, 0x40(%rsp)
14092174e: 48 8d 4c 24 37              	leaq	0x37(%rsp), %rcx
140921753: 48 89 4c 24 48              	movq	%rcx, 0x48(%rsp)
140921758: 48 89 44 24 50              	movq	%rax, 0x50(%rsp)
14092175d: 48 8d 0d 2e 38 0c 05        	leaq	0x50c382e(%rip), %rcx   # 0x1459e4f92
140921764: 4c 8d 05 a5 38 0c 05        	leaq	0x50c38a5(%rip), %r8    # 0x1459e5010
14092176b: 48 8d 54 24 38              	leaq	0x38(%rsp), %rdx
140921770: e8 8b 29 f8 04              	callq	0x1458a4100 <.text+0x58a3100>
140921775: 0f 0b                       	ud2
140921777: 48 83 c6 04                 	addq	$0x4, %rsi
14092177b: 48 89 74 24 38              	movq	%rsi, 0x38(%rsp)
140921780: 48 8d 05 99 99 6a 04        	leaq	0x46a9999(%rip), %rax   # 0x144fcb120 <.text+0x4fca120>
140921787: 48 89 44 24 40              	movq	%rax, 0x40(%rsp)
14092178c: 48 8d 4c 24 37              	leaq	0x37(%rsp), %rcx
140921791: 48 89 4c 24 48              	movq	%rcx, 0x48(%rsp)
140921796: 48 89 44 24 50              	movq	%rax, 0x50(%rsp)
14092179b: 48 8d 0d cb 2b 0c 05        	leaq	0x50c2bcb(%rip), %rcx   # 0x1459e436d
1409217a2: 4c 8d 05 f7 2b 0c 05        	leaq	0x50c2bf7(%rip), %r8    # 0x1459e43a0
1409217a9: 48 8d 54 24 38              	leaq	0x38(%rsp), %rdx
1409217ae: e8 4d 29 f8 04              	callq	0x1458a4100 <.text+0x58a3100>
1409217b3: 0f 0b                       	ud2
1409217b5: 4c 8d 05 6c b3 0e 05        	leaq	0x50eb36c(%rip), %r8    # 0x145a0cb28
1409217bc: ba 03 00 00 00              	movl	$0x3, %edx
1409217c1: e8 5d 27 f8 04              	callq	0x1458a3f23 <.text+0x58a2f23>
1409217c6: 0f 0b                       	ud2
