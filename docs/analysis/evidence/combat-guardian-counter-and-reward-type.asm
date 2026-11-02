
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454948fb: 49 83 fd ff                 	cmpq	$-0x1, %r13
1454948ff: 0f 84 fc 06 00 00           	je	0x145495001 <.text+0x5494001>
145494905: 48 8b 4d 78                 	movq	0x78(%rbp), %rcx
145494909: 48 3b 8e 88 05 00 00        	cmpq	0x588(%rsi), %rcx
145494910: 73 29                       	jae	0x14549493b <.text+0x549393b>
145494912: 48 8b 86 80 05 00 00        	movq	0x580(%rsi), %rax
145494919: 48 8d 0c 89                 	leaq	(%rcx,%rcx,4), %rcx
14549491d: 48 c7 04 c8 00 00 00 00     	movq	$0x0, (%rax,%rcx,8)
145494925: f3 0f 10 86 cc 08 00 00     	movss	0x8cc(%rsi), %xmm0
14549492d: f3 0f 58 05 7b 48 4e 00     	addss	0x4e487b(%rip), %xmm0   # 0x1459791b0
145494935: f3 0f 11 44 c8 24           	movss	%xmm0, 0x24(%rax,%rcx,8)
14549493b: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
145494942: ff 86 5c 06 00 00           	incl	0x65c(%rsi)
145494948: c6 85 77 01 00 00 00        	movb	$0x0, 0x177(%rbp)
14549494f: 4c 8d 3d d2 25 61 01        	leaq	0x16125d2(%rip), %r15   # 0x146aa6f28
145494956: bb 5b 00 00 00              	movl	$0x5b, %ebx
14549495b: ba 5b 00 00 00              	movl	$0x5b, %edx
145494960: 4c 89 f9                    	movq	%r15, %rcx
145494963: e8 c8 04 fa ff              	callq	0x145434e30 <.text+0x5433e30>
145494968: 90                          	nop
145494969: 48 85 c0                    	testq	%rax, %rax
14549496c: 4c 0f 45 f8                 	cmovneq	%rax, %r15
145494970: 48 0f 44 d3                 	cmoveq	%rbx, %rdx
145494974: c6 85 77 01 00 00 00        	movb	$0x0, 0x177(%rbp)
14549497b: 48 89 54 24 20              	movq	%rdx, 0x20(%rsp)
145494980: 48 8d 8d 00 01 00 00        	leaq	0x100(%rbp), %rcx
145494987: 48 8b 95 60 01 00 00        	movq	0x160(%rbp), %rdx
14549498e: 4c 8b 85 e8 00 00 00        	movq	0xe8(%rbp), %r8
145494995: 4d 89 f9                    	movq	%r15, %r9
145494998: e8 83 28 fb ff              	callq	0x145447220 <.text+0x5446220>
14549499d: 90                          	nop
14549499e: 48 8b 9e 40 05 00 00        	movq	0x540(%rsi), %rbx
1454949a5: 48 3b 9e 30 05 00 00        	cmpq	0x530(%rsi), %rbx
1454949ac: 75 0d                       	jne	0x1454949bb <.text+0x54939bb>
1454949ae: 48 8d 8e 30 05 00 00        	leaq	0x530(%rsi), %rcx
1454949b5: e8 e6 6e 27 00              	callq	0x14570b8a0 <.text+0x570a8a0>
1454949ba: 90                          	nop
1454949bb: 48 8b 86 38 05 00 00        	movq	0x538(%rsi), %rax
1454949c2: 48 89 d9                    	movq	%rbx, %rcx
1454949c5: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454949c9: 0f 10 85 00 01 00 00        	movups	0x100(%rbp), %xmm0
1454949d0: 0f 10 8d 10 01 00 00        	movups	0x110(%rbp), %xmm1
1454949d7: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
1454949dc: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
1454949e0: 48 ff c3                    	incq	%rbx
1454949e3: 48 89 9e 40 05 00 00        	movq	%rbx, 0x540(%rsi)
1454949ea: c6 85 77 01 00 00 00        	movb	$0x0, 0x177(%rbp)
1454949f1: 48 8d 8d 00 01 00 00        	leaq	0x100(%rbp), %rcx
1454949f8: ba ee 1f 00 00              	movl	$0x1fee, %edx           # imm = 0x1FEE
1454949fd: e8 2e 32 fb ff              	callq	0x145447c30 <.text+0x5446c30>
145494a02: 90                          	nop
145494a03: 48 8b 9e 40 05 00 00        	movq	0x540(%rsi), %rbx
145494a0a: 48 3b 9e 30 05 00 00        	cmpq	0x530(%rsi), %rbx
145494a11: 75 0d                       	jne	0x145494a20 <.text+0x5493a20>
145494a13: 48 8d 8e 30 05 00 00        	leaq	0x530(%rsi), %rcx
145494a1a: e8 81 6e 27 00              	callq	0x14570b8a0 <.text+0x570a8a0>
145494a1f: 90                          	nop
145494a20: 48 8b 86 38 05 00 00        	movq	0x538(%rsi), %rax
145494a27: 48 89 d9                    	movq	%rbx, %rcx
145494a2a: 48 c1 e1 05                 	shlq	$0x5, %rcx
145494a2e: 0f 10 85 00 01 00 00        	movups	0x100(%rbp), %xmm0
145494a35: 0f 10 8d 10 01 00 00        	movups	0x110(%rbp), %xmm1
145494a3c: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
145494a41: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
145494a45: 48 ff c3                    	incq	%rbx
145494a48: 48 89 9e 40 05 00 00        	movq	%rbx, 0x540(%rsi)
145494a4f: c6 85 77 01 00 00 00        	movb	$0x0, 0x177(%rbp)
145494a56: 48 8d 8d 00 01 00 00        	leaq	0x100(%rbp), %rcx
145494a5d: e8 2e 4d fa ff              	callq	0x145439790 <.text+0x5438790>
145494a62: 90                          	nop
145494a63: c6 85 77 01 00 00 00        	movb	$0x0, 0x177(%rbp)
145494a6a: 48 8d 05 c7 05 61 01        	leaq	0x16105c7(%rip), %rax   # 0x146aa5038
145494a71: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
145494a76: 48 c7 44 24 28 08 00 00 00  	movq	$0x8, 0x28(%rsp)
145494a7f: 4c 8d 05 a3 0c 61 01        	leaq	0x1610ca3(%rip), %r8    # 0x146aa5729
145494a86: 48 8d 8d b0 00 00 00        	leaq	0xb0(%rbp), %rcx
145494a8d: 48 8d 95 00 01 00 00        	leaq	0x100(%rbp), %rdx
145494a94: 41 b9 04 00 00 00           	movl	$0x4, %r9d
145494a9a: e8 71 83 fa ff              	callq	0x14543ce10 <.text+0x543be10>
145494a9f: 90                          	nop
