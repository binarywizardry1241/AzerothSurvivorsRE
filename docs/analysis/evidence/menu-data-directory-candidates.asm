
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14556d04a: c6 45 16 01                 	movb	$0x1, 0x16(%rbp)
14556d04e: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
14556d057: 4c 8d 0d fa 20 55 01        	leaq	0x15520fa(%rip), %r9    # 0x146abf158
14556d05e: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14556d062: 48 89 fa                    	movq	%rdi, %rdx
14556d065: 49 89 d8                    	movq	%rbx, %r8
14556d068: e8 03 df 12 00              	callq	0x14569af70 <.text+0x5699f70>
14556d06d: 90                          	nop
14556d06e: 48 8b 7d 00                 	movq	(%rbp), %rdi
14556d072: 48 3b 7d f0                 	cmpq	-0x10(%rbp), %rdi
14556d076: 75 0a                       	jne	0x14556d082 <.text+0x556c082>
14556d078: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
14556d07c: e8 1f e8 19 00              	callq	0x14570b8a0 <.text+0x570a8a0>
14556d081: 90                          	nop
14556d082: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
14556d086: 48 89 f9                    	movq	%rdi, %rcx
14556d089: 48 c1 e1 05                 	shlq	$0x5, %rcx
14556d08d: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
14556d091: 0f 10 4d e0                 	movups	-0x20(%rbp), %xmm1
14556d095: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14556d09a: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14556d09e: 48 ff c7                    	incq	%rdi
14556d0a1: 48 89 7d 00                 	movq	%rdi, (%rbp)
14556d0a5: 4c 8b 6d 08                 	movq	0x8(%rbp), %r13
14556d0a9: 49 83 fd ff                 	cmpq	$-0x1, %r13
14556d0ad: 0f 84 c8 00 00 00           	je	0x14556d17b <.text+0x556c17b>
14556d0b3: 48 c7 44 24 20 04 00 00 00  	movq	$0x4, 0x20(%rsp)
14556d0bc: 4c 8d 0d 9d 20 55 01        	leaq	0x155209d(%rip), %r9    # 0x146abf160
14556d0c3: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14556d0c7: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
14556d0cb: 4d 89 f0                    	movq	%r14, %r8
14556d0ce: e8 9d de 12 00              	callq	0x14569af70 <.text+0x5699f70>
14556d0d3: 90                          	nop
14556d0d4: 48 8b 7d 00                 	movq	(%rbp), %rdi
14556d0d8: 48 3b 7d f0                 	cmpq	-0x10(%rbp), %rdi
14556d0dc: 75 0a                       	jne	0x14556d0e8 <.text+0x556c0e8>
14556d0de: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
14556d0e2: e8 b9 e7 19 00              	callq	0x14570b8a0 <.text+0x570a8a0>
14556d0e7: 90                          	nop
14556d0e8: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
14556d0ec: 48 89 f9                    	movq	%rdi, %rcx
14556d0ef: 48 c1 e1 05                 	shlq	$0x5, %rcx
14556d0f3: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
14556d0f7: 0f 10 4d e0                 	movups	-0x20(%rbp), %xmm1
14556d0fb: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14556d100: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14556d104: 48 ff c7                    	incq	%rdi
14556d107: 48 89 7d 00                 	movq	%rdi, (%rbp)
14556d10b: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
14556d114: 4c 8d 0d 3d 20 55 01        	leaq	0x155203d(%rip), %r9    # 0x146abf158
14556d11b: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14556d11f: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
14556d123: 4d 89 f0                    	movq	%r14, %r8
14556d126: e8 45 de 12 00              	callq	0x14569af70 <.text+0x5699f70>
