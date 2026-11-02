
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ee2a0: 55                          	pushq	%rbp
1454ee2a1: 41 57                       	pushq	%r15
1454ee2a3: 41 56                       	pushq	%r14
1454ee2a5: 41 55                       	pushq	%r13
1454ee2a7: 41 54                       	pushq	%r12
1454ee2a9: 56                          	pushq	%rsi
1454ee2aa: 57                          	pushq	%rdi
1454ee2ab: 53                          	pushq	%rbx
1454ee2ac: 48 81 ec 18 01 00 00        	subq	$0x118, %rsp            # imm = 0x118
1454ee2b3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1454ee2bb: 48 c7 85 90 00 00 00 fe ff ff ff    	movq	$-0x2, 0x90(%rbp)
1454ee2c6: 48 89 d7                    	movq	%rdx, %rdi
1454ee2c9: 49 89 cc                    	movq	%rcx, %r12
1454ee2cc: f3 0f 10 82 e4 08 00 00     	movss	0x8e4(%rdx), %xmm0
1454ee2d4: f3 0f 11 45 fc              	movss	%xmm0, -0x4(%rbp)
1454ee2d9: 48 c7 44 24 28 00 00 00 00  	movq	$0x0, 0x28(%rsp)
1454ee2e2: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1454ee2eb: 48 89 e9                    	movq	%rbp, %rcx
1454ee2ee: e8 dd fd ff ff              	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454ee2f3: 48 8b 45 00                 	movq	(%rbp), %rax
1454ee2f7: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
1454ee2fb: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
1454ee2ff: 48 8d 14 d1                 	leaq	(%rcx,%rdx,8), %rdx
1454ee303: 48 89 4d 00                 	movq	%rcx, (%rbp)
1454ee307: 48 89 4d 08                 	movq	%rcx, 0x8(%rbp)
1454ee30b: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1454ee30f: 48 89 55 18                 	movq	%rdx, 0x18(%rbp)
1454ee313: 48 89 7d 20                 	movq	%rdi, 0x20(%rbp)
1454ee317: 48 8d 45 fc                 	leaq	-0x4(%rbp), %rax
1454ee31b: 48 89 45 28                 	movq	%rax, 0x28(%rbp)
1454ee31f: 48 8d 4d 68                 	leaq	0x68(%rbp), %rcx
1454ee323: 48 89 ea                    	movq	%rbp, %rdx
1454ee326: e8 b5 d7 03 00              	callq	0x14552bae0 <.text+0x552aae0>
1454ee32b: 4c 8b 75 70                 	movq	0x70(%rbp), %r14
1454ee32f: 4c 8b 6d 78                 	movq	0x78(%rbp), %r13
1454ee333: 48 8d 85 8c 00 00 00        	leaq	0x8c(%rbp), %rax
1454ee33a: 48 89 45 00                 	movq	%rax, (%rbp)
1454ee33e: 49 83 fd 02                 	cmpq	$0x2, %r13
1454ee342: 0f 83 88 02 00 00           	jae	0x1454ee5d0 <.text+0x54ed5d0>
1454ee348: 4d 85 ed                    	testq	%r13, %r13
1454ee34b: 74 2c                       	je	0x1454ee379 <.text+0x54ed379>
1454ee34d: 4c 89 e8                    	movq	%r13, %rax
1454ee350: 48 c1 e0 05                 	shlq	$0x5, %rax
1454ee354: 31 f6                       	xorl	%esi, %esi
1454ee356: 31 c9                       	xorl	%ecx, %ecx
1454ee358: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454ee360: 41 80 7c 0e 10 03           	cmpb	$0x3, 0x10(%r14,%rcx)
1454ee366: 74 13                       	je	0x1454ee37b <.text+0x54ed37b>
1454ee368: 48 ff c6                    	incq	%rsi
1454ee36b: 48 83 c1 20                 	addq	$0x20, %rcx
1454ee36f: 48 39 c8                    	cmpq	%rcx, %rax
1454ee372: 75 ec                       	jne	0x1454ee360 <.text+0x54ed360>
1454ee374: 4c 89 ee                    	movq	%r13, %rsi
1454ee377: eb 02                       	jmp	0x1454ee37b <.text+0x54ed37b>
1454ee379: 31 f6                       	xorl	%esi, %esi
1454ee37b: 4c 89 eb                    	movq	%r13, %rbx
1454ee37e: 48 29 f3                    	subq	%rsi, %rbx
1454ee381: 48 c1 e3 05                 	shlq	$0x5, %rbx
1454ee385: 4c 89 ef                    	movq	%r13, %rdi
1454ee388: b8 08 00 00 00              	movl	$0x8, %eax
1454ee38d: 48 29 f7                    	subq	%rsi, %rdi
1454ee390: 74 1b                       	je	0x1454ee3ad <.text+0x54ed3ad>
1454ee392: e8 69 3e b1 fa              	callq	0x140002200 <.text+0x1200>
1454ee397: ba 08 00 00 00              	movl	$0x8, %edx
1454ee39c: 48 89 d9                    	movq	%rbx, %rcx
1454ee39f: e8 1c 3e b1 fa              	callq	0x1400021c0 <.text+0x11c0>
1454ee3a4: 48 85 c0                    	testq	%rax, %rax
1454ee3a7: 0f 84 15 04 00 00           	je	0x1454ee7c2 <.text+0x54ed7c2>
1454ee3ad: 48 89 7d 30                 	movq	%rdi, 0x30(%rbp)
1454ee3b1: 48 89 75 78                 	movq	%rsi, 0x78(%rbp)
1454ee3b5: 49 89 f7                    	movq	%rsi, %r15
1454ee3b8: 49 c1 e7 05                 	shlq	$0x5, %r15
1454ee3bc: 4b 8d 14 3e                 	leaq	(%r14,%r15), %rdx
1454ee3c0: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
1454ee3c4: 48 89 c1                    	movq	%rax, %rcx
1454ee3c7: 48 89 5d f0                 	movq	%rbx, -0x10(%rbp)
1454ee3cb: 49 89 d8                    	movq	%rbx, %r8
1454ee3ce: e8 0a 8a 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454ee3d3: 48 85 f6                    	testq	%rsi, %rsi
1454ee3d6: 74 3b                       	je	0x1454ee413 <.text+0x54ed413>
1454ee3d8: 48 89 b5 80 00 00 00        	movq	%rsi, 0x80(%rbp)
1454ee3df: 31 db                       	xorl	%ebx, %ebx
1454ee3e1: 31 f6                       	xorl	%esi, %esi
1454ee3e3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
1454ee3f0: 41 80 7c 36 10 02           	cmpb	$0x2, 0x10(%r14,%rsi)
1454ee3f6: 74 22                       	je	0x1454ee41a <.text+0x54ed41a>
1454ee3f8: 48 ff c3                    	incq	%rbx
1454ee3fb: 48 83 c6 20                 	addq	$0x20, %rsi
1454ee3ff: 49 39 f7                    	cmpq	%rsi, %r15
1454ee402: 75 ec                       	jne	0x1454ee3f0 <.text+0x54ed3f0>
1454ee404: 48 8b b5 80 00 00 00        	movq	0x80(%rbp), %rsi
1454ee40b: 48 89 f3                    	movq	%rsi, %rbx
1454ee40e: e9 81 01 00 00              	jmp	0x1454ee594 <.text+0x54ed594>
1454ee413: 31 db                       	xorl	%ebx, %ebx
1454ee415: e9 7a 01 00 00              	jmp	0x1454ee594 <.text+0x54ed594>
1454ee41a: 4c 89 6d 60                 	movq	%r13, 0x60(%rbp)
1454ee41e: 4c 89 65 e8                 	movq	%r12, -0x18(%rbp)
1454ee422: 41 8b 44 36 0c              	movl	0xc(%r14,%rsi), %eax
1454ee427: 89 45 e0                    	movl	%eax, -0x20(%rbp)
1454ee42a: 49 8b 44 36 04              	movq	0x4(%r14,%rsi), %rax
1454ee42f: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1454ee433: 4d 89 fd                    	movq	%r15, %r13
1454ee436: 49 29 f5                    	subq	%rsi, %r13
1454ee439: e8 c2 3d b1 fa              	callq	0x140002200 <.text+0x1200>
1454ee43e: ba 08 00 00 00              	movl	$0x8, %edx
1454ee443: 4c 89 e9                    	movq	%r13, %rcx
1454ee446: e8 75 3d b1 fa              	callq	0x1400021c0 <.text+0x11c0>
1454ee44b: 48 85 c0                    	testq	%rax, %rax
1454ee44e: 0f 84 7e 03 00 00           	je	0x1454ee7d2 <.text+0x54ed7d2>
1454ee454: 49 89 c4                    	movq	%rax, %r12
1454ee457: 49 8d 14 36                 	leaq	(%r14,%rsi), %rdx
1454ee45b: 48 8b bd 80 00 00 00        	movq	0x80(%rbp), %rdi
1454ee462: 48 29 df                    	subq	%rbx, %rdi
1454ee465: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454ee469: 48 89 c1                    	movq	%rax, %rcx
1454ee46c: 4d 89 e8                    	movq	%r13, %r8
1454ee46f: e8 69 89 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454ee474: 4d 01 e7                    	addq	%r12, %r15
1454ee477: 49 29 f7                    	subq	%rsi, %r15
1454ee47a: 4c 89 65 b8                 	movq	%r12, -0x48(%rbp)
1454ee47e: 48 89 7d c8                 	movq	%rdi, -0x38(%rbp)
1454ee482: 4c 89 65 c0                 	movq	%r12, -0x40(%rbp)
1454ee486: 4c 89 7d d0                 	movq	%r15, -0x30(%rbp)
1454ee48a: c6 85 8f 00 00 00 01        	movb	$0x1, 0x8f(%rbp)
1454ee491: 48 89 e9                    	movq	%rbp, %rcx
1454ee494: 48 8d 55 b8                 	leaq	-0x48(%rbp), %rdx
1454ee498: 4c 8d 45 d8                 	leaq	-0x28(%rbp), %r8
1454ee49c: e8 8f 82 05 00              	callq	0x145546730 <.text+0x5545730>
1454ee4a1: 90                          	nop
1454ee4a2: 48 8b 45 00                 	movq	(%rbp), %rax
1454ee4a6: 48 89 45 50                 	movq	%rax, 0x50(%rbp)
1454ee4aa: 48 8b 45 08                 	movq	0x8(%rbp), %rax
1454ee4ae: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
1454ee4b2: 4c 8b 65 10                 	movq	0x10(%rbp), %r12
1454ee4b6: 48 8b 45 18                 	movq	0x18(%rbp), %rax
1454ee4ba: 48 89 45 48                 	movq	%rax, 0x48(%rbp)
1454ee4be: 48 8b 45 20                 	movq	0x20(%rbp), %rax
1454ee4c2: 48 89 45 40                 	movq	%rax, 0x40(%rbp)
1454ee4c6: 4c 8b 7d 28                 	movq	0x28(%rbp), %r15
1454ee4ca: 48 8d 85 8c 00 00 00        	leaq	0x8c(%rbp), %rax
1454ee4d1: 48 89 45 00                 	movq	%rax, (%rbp)
1454ee4d5: 49 83 fc 02                 	cmpq	$0x2, %r12
1454ee4d9: 0f 83 58 02 00 00           	jae	0x1454ee737 <.text+0x54ed737>
1454ee4df: 48 8b 45 68                 	movq	0x68(%rbp), %rax
1454ee4e3: 48 29 d8                    	subq	%rbx, %rax
1454ee4e6: 49 39 c4                    	cmpq	%rax, %r12
1454ee4e9: 0f 87 6c 02 00 00           	ja	0x1454ee75b <.text+0x54ed75b>
1454ee4ef: 4d 85 e4                    	testq	%r12, %r12
1454ee4f2: 74 1a                       	je	0x1454ee50e <.text+0x54ed50e>
1454ee4f4: 4d 89 e0                    	movq	%r12, %r8
1454ee4f7: 49 c1 e0 05                 	shlq	$0x5, %r8
1454ee4fb: 48 89 d9                    	movq	%rbx, %rcx
1454ee4fe: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ee502: 4c 01 f1                    	addq	%r14, %rcx
1454ee505: 48 8b 55 58                 	movq	0x58(%rbp), %rdx
1454ee509: e8 cf 88 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454ee50e: 4c 01 e3                    	addq	%r12, %rbx
1454ee511: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454ee515: 48 8b 55 50                 	movq	0x50(%rbp), %rdx
1454ee519: 48 85 d2                    	testq	%rdx, %rdx
1454ee51c: 4c 8b 6d 60                 	movq	0x60(%rbp), %r13
1454ee520: 48 8b b5 80 00 00 00        	movq	0x80(%rbp), %rsi
1454ee527: 74 13                       	je	0x1454ee53c <.text+0x54ed53c>
1454ee529: 48 c1 e2 05                 	shlq	$0x5, %rdx
1454ee52d: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454ee533: 48 8b 4d 58                 	movq	0x58(%rbp), %rcx
1454ee537: e8 94 3c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ee53c: 48 8b 45 68                 	movq	0x68(%rbp), %rax
1454ee540: 48 29 d8                    	subq	%rbx, %rax
1454ee543: 49 39 c7                    	cmpq	%rax, %r15
1454ee546: 4c 8b 65 e8                 	movq	-0x18(%rbp), %r12
1454ee54a: 48 8b 7d 40                 	movq	0x40(%rbp), %rdi
1454ee54e: 0f 87 33 02 00 00           	ja	0x1454ee787 <.text+0x54ed787>
1454ee554: 4d 85 ff                    	testq	%r15, %r15
1454ee557: 74 19                       	je	0x1454ee572 <.text+0x54ed572>
1454ee559: 4d 89 f8                    	movq	%r15, %r8
1454ee55c: 49 c1 e0 05                 	shlq	$0x5, %r8
1454ee560: 48 89 d9                    	movq	%rbx, %rcx
1454ee563: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ee567: 4c 01 f1                    	addq	%r14, %rcx
1454ee56a: 48 89 fa                    	movq	%rdi, %rdx
1454ee56d: e8 6b 88 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454ee572: 4c 01 fb                    	addq	%r15, %rbx
1454ee575: 48 89 5d 78                 	movq	%rbx, 0x78(%rbp)
1454ee579: 48 8b 55 48                 	movq	0x48(%rbp), %rdx
1454ee57d: 48 85 d2                    	testq	%rdx, %rdx
1454ee580: 74 12                       	je	0x1454ee594 <.text+0x54ed594>
1454ee582: 48 c1 e2 05                 	shlq	$0x5, %rdx
1454ee586: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454ee58c: 48 89 f9                    	movq	%rdi, %rcx
1454ee58f: e8 3c 3c b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ee594: 4c 8b 75 f0                 	movq	-0x10(%rbp), %r14
1454ee598: 49 c1 ee 05                 	shrq	$0x5, %r14
1454ee59c: 48 8b 45 68                 	movq	0x68(%rbp), %rax
1454ee5a0: 48 29 d8                    	subq	%rbx, %rax
1454ee5a3: 49 39 c6                    	cmpq	%rax, %r14
1454ee5a6: 77 4b                       	ja	0x1454ee5f3 <.text+0x54ed5f3>
1454ee5a8: 49 39 f5                    	cmpq	%rsi, %r13
1454ee5ab: 75 7f                       	jne	0x1454ee62c <.text+0x54ed62c>
1454ee5ad: 4a 8d 3c 33                 	leaq	(%rbx,%r14), %rdi
1454ee5b1: 49 39 f5                    	cmpq	%rsi, %r13
1454ee5b4: 0f 85 97 00 00 00           	jne	0x1454ee651 <.text+0x54ed651>
1454ee5ba: 48 8b 4d 68                 	movq	0x68(%rbp), %rcx
1454ee5be: 48 8b 45 70                 	movq	0x70(%rbp), %rax
1454ee5c2: 48 85 ff                    	testq	%rdi, %rdi
1454ee5c5: 0f 85 ae 00 00 00           	jne	0x1454ee679 <.text+0x54ed679>
1454ee5cb: e9 41 01 00 00              	jmp	0x1454ee711 <.text+0x54ed711>
1454ee5d0: 49 83 fd 15                 	cmpq	$0x15, %r13
1454ee5d4: 0f 83 0f 02 00 00           	jae	0x1454ee7e9 <.text+0x54ed7e9>
1454ee5da: 49 89 e9                    	movq	%rbp, %r9
1454ee5dd: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ee5e3: 4c 89 f1                    	movq	%r14, %rcx
1454ee5e6: 4c 89 ea                    	movq	%r13, %rdx
1454ee5e9: e8 12 67 00 00              	callq	0x1454f4d00 <.text+0x54f3d00>
1454ee5ee: e9 5a fd ff ff              	jmp	0x1454ee34d <.text+0x54ed34d>
1454ee5f3: 48 89 b5 80 00 00 00        	movq	%rsi, 0x80(%rbp)
1454ee5fa: 4c 89 6d 60                 	movq	%r13, 0x60(%rbp)
1454ee5fe: 48 c7 44 24 20 20 00 00 00  	movq	$0x20, 0x20(%rsp)
1454ee607: 48 8d 4d 68                 	leaq	0x68(%rbp), %rcx
1454ee60b: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454ee611: 48 89 da                    	movq	%rbx, %rdx
1454ee614: 4d 89 f0                    	movq	%r14, %r8
1454ee617: e8 24 97 26 00              	callq	0x145757d40 <.text+0x5756d40>
1454ee61c: 90                          	nop
1454ee61d: 48 8b 5d 78                 	movq	0x78(%rbp), %rbx
1454ee621: 4c 8b 6d 60                 	movq	0x60(%rbp), %r13
1454ee625: 48 8b b5 80 00 00 00        	movq	0x80(%rbp), %rsi
1454ee62c: 48 89 d9                    	movq	%rbx, %rcx
1454ee62f: 48 c1 e1 05                 	shlq	$0x5, %rcx
1454ee633: 48 03 4d 70                 	addq	0x70(%rbp), %rcx
1454ee637: 48 8b 55 38                 	movq	0x38(%rbp), %rdx
1454ee63b: 4c 8b 45 f0                 	movq	-0x10(%rbp), %r8
1454ee63f: e8 99 87 26 00              	callq	0x145756ddd <.text+0x5755ddd>
1454ee644: 4a 8d 3c 33                 	leaq	(%rbx,%r14), %rdi
1454ee648: 49 39 f5                    	cmpq	%rsi, %r13
1454ee64b: 0f 84 69 ff ff ff           	je	0x1454ee5ba <.text+0x54ed5ba>
1454ee651: 48 8b 55 30                 	movq	0x30(%rbp), %rdx
1454ee655: 48 c1 e2 05                 	shlq	$0x5, %rdx
1454ee659: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1454ee65f: 48 8b 4d 38                 	movq	0x38(%rbp), %rcx
1454ee663: e8 68 3b b1 fa              	callq	0x1400021d0 <.text+0x11d0>
1454ee668: 48 8b 4d 68                 	movq	0x68(%rbp), %rcx
1454ee66c: 48 8b 45 70                 	movq	0x70(%rbp), %rax
1454ee670: 48 85 ff                    	testq	%rdi, %rdi
1454ee673: 0f 84 98 00 00 00           	je	0x1454ee711 <.text+0x54ed711>
1454ee679: 4e 8d 04 33                 	leaq	(%rbx,%r14), %r8
1454ee67d: 49 ff c8                    	decq	%r8
1454ee680: 89 fa                       	movl	%edi, %edx
1454ee682: 83 e2 03                    	andl	$0x3, %edx
1454ee685: 49 83 f8 03                 	cmpq	$0x3, %r8
1454ee689: 73 05                       	jae	0x1454ee690 <.text+0x54ed690>
1454ee68b: 45 31 c0                    	xorl	%r8d, %r8d
1454ee68e: eb 54                       	jmp	0x1454ee6e4 <.text+0x54ed6e4>
1454ee690: 49 b9 fc ff ff ff ff ff ff 03       	movabsq	$0x3fffffffffffffc, %r9 # imm = 0x3FFFFFFFFFFFFFC
1454ee69a: 49 21 f9                    	andq	%rdi, %r9
1454ee69d: 4c 8d 50 78                 	leaq	0x78(%rax), %r10
1454ee6a1: 45 31 c0                    	xorl	%r8d, %r8d
1454ee6a4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
1454ee6b0: 4d 8b 5a a0                 	movq	-0x60(%r10), %r11
1454ee6b4: 4e 89 1c c0                 	movq	%r11, (%rax,%r8,8)
1454ee6b8: 4d 8b 5a c0                 	movq	-0x40(%r10), %r11
1454ee6bc: 4e 89 5c c0 08              	movq	%r11, 0x8(%rax,%r8,8)
1454ee6c1: 4d 8b 5a e0                 	movq	-0x20(%r10), %r11
1454ee6c5: 4e 89 5c c0 10              	movq	%r11, 0x10(%rax,%r8,8)
1454ee6ca: 4d 8b 1a                    	movq	(%r10), %r11
1454ee6cd: 4e 89 5c c0 18              	movq	%r11, 0x18(%rax,%r8,8)
1454ee6d2: 49 83 c0 04                 	addq	$0x4, %r8
1454ee6d6: 49 83 ea 80                 	subq	$-0x80, %r10
1454ee6da: 4d 39 c1                    	cmpq	%r8, %r9
1454ee6dd: 75 d1                       	jne	0x1454ee6b0 <.text+0x54ed6b0>
1454ee6df: 48 85 d2                    	testq	%rdx, %rdx
1454ee6e2: 74 2d                       	je	0x1454ee711 <.text+0x54ed711>
1454ee6e4: 4e 8d 0c c0                 	leaq	(%rax,%r8,8), %r9
1454ee6e8: 49 c1 e0 05                 	shlq	$0x5, %r8
1454ee6ec: 49 01 c0                    	addq	%rax, %r8
1454ee6ef: 49 83 c0 18                 	addq	$0x18, %r8
1454ee6f3: c1 e2 03                    	shll	$0x3, %edx
1454ee6f6: 45 31 d2                    	xorl	%r10d, %r10d
1454ee6f9: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454ee700: 4f 8b 1c 90                 	movq	(%r8,%r10,4), %r11
1454ee704: 4f 89 1c 11                 	movq	%r11, (%r9,%r10)
1454ee708: 49 83 c2 08                 	addq	$0x8, %r10
1454ee70c: 4c 39 d2                    	cmpq	%r10, %rdx
1454ee70f: 75 ef                       	jne	0x1454ee700 <.text+0x54ed700>
1454ee711: 48 c1 e1 02                 	shlq	$0x2, %rcx
1454ee715: 49 89 0c 24                 	movq	%rcx, (%r12)
1454ee719: 49 89 44 24 08              	movq	%rax, 0x8(%r12)
1454ee71e: 49 89 7c 24 10              	movq	%rdi, 0x10(%r12)
1454ee723: 48 81 c4 18 01 00 00        	addq	$0x118, %rsp            # imm = 0x118
1454ee72a: 5b                          	popq	%rbx
1454ee72b: 5f                          	popq	%rdi
1454ee72c: 5e                          	popq	%rsi
1454ee72d: 41 5c                       	popq	%r12
1454ee72f: 41 5d                       	popq	%r13
1454ee731: 41 5e                       	popq	%r14
1454ee733: 41 5f                       	popq	%r15
1454ee735: 5d                          	popq	%rbp
1454ee736: c3                          	retq
1454ee737: 49 83 fc 15                 	cmpq	$0x15, %r12
1454ee73b: 0f 83 bc 00 00 00           	jae	0x1454ee7fd <.text+0x54ed7fd>
1454ee741: 49 89 e9                    	movq	%rbp, %r9
1454ee744: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454ee74a: 48 8b 4d 58                 	movq	0x58(%rbp), %rcx
1454ee74e: 4c 89 e2                    	movq	%r12, %rdx
1454ee751: e8 5a a7 43 fc              	callq	0x141928eb0 <.text+0x1927eb0>
1454ee756: e9 84 fd ff ff              	jmp	0x1454ee4df <.text+0x54ed4df>
1454ee75b: 48 c7 44 24 20 20 00 00 00  	movq	$0x20, 0x20(%rsp)
1454ee764: 48 8d 4d 68                 	leaq	0x68(%rbp), %rcx
1454ee768: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454ee76e: 48 89 da                    	movq	%rbx, %rdx
1454ee771: 4d 89 e0                    	movq	%r12, %r8
1454ee774: e8 c7 95 26 00              	callq	0x145757d40 <.text+0x5756d40>
1454ee779: 90                          	nop
1454ee77a: 4c 8b 75 70                 	movq	0x70(%rbp), %r14
1454ee77e: 48 8b 5d 78                 	movq	0x78(%rbp), %rbx
1454ee782: e9 6d fd ff ff              	jmp	0x1454ee4f4 <.text+0x54ed4f4>
1454ee787: 48 c7 44 24 20 20 00 00 00  	movq	$0x20, 0x20(%rsp)
1454ee790: 48 8d 4d 68                 	leaq	0x68(%rbp), %rcx
1454ee794: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1454ee79a: 48 89 da                    	movq	%rbx, %rdx
1454ee79d: 4d 89 f8                    	movq	%r15, %r8
1454ee7a0: e8 9b 95 26 00              	callq	0x145757d40 <.text+0x5756d40>
1454ee7a5: 90                          	nop
1454ee7a6: 4c 8b 75 70                 	movq	0x70(%rbp), %r14
1454ee7aa: 48 8b 5d 78                 	movq	0x78(%rbp), %rbx
1454ee7ae: 4c 8b 6d 60                 	movq	0x60(%rbp), %r13
1454ee7b2: 48 8b b5 80 00 00 00        	movq	0x80(%rbp), %rsi
1454ee7b9: 48 8b 7d 40                 	movq	0x40(%rbp), %rdi
1454ee7bd: e9 97 fd ff ff              	jmp	0x1454ee559 <.text+0x54ed559>
1454ee7c2: b9 08 00 00 00              	movl	$0x8, %ecx
1454ee7c7: 48 89 da                    	movq	%rbx, %rdx
1454ee7ca: e8 4c 8a 3f 00              	callq	0x1458e721b <.text+0x58e621b>
1454ee7cf: 90                          	nop
1454ee7d0: eb 15                       	jmp	0x1454ee7e7 <.text+0x54ed7e7>
1454ee7d2: c6 85 8f 00 00 00 01        	movb	$0x1, 0x8f(%rbp)
1454ee7d9: b9 08 00 00 00              	movl	$0x8, %ecx
1454ee7de: 4c 89 ea                    	movq	%r13, %rdx
1454ee7e1: e8 35 8a 3f 00              	callq	0x1458e721b <.text+0x58e621b>
1454ee7e6: 90                          	nop
1454ee7e7: 0f 0b                       	ud2
1454ee7e9: 49 89 e8                    	movq	%rbp, %r8
1454ee7ec: 4c 89 f1                    	movq	%r14, %rcx
1454ee7ef: 4c 89 ea                    	movq	%r13, %rdx
1454ee7f2: e8 59 b0 04 00              	callq	0x145539850 <.text+0x5538850>
1454ee7f7: 90                          	nop
1454ee7f8: e9 50 fb ff ff              	jmp	0x1454ee34d <.text+0x54ed34d>
1454ee7fd: c6 85 8e 00 00 00 00        	movb	$0x0, 0x8e(%rbp)
1454ee804: c6 85 8d 00 00 00 01        	movb	$0x1, 0x8d(%rbp)
1454ee80b: 49 89 e8                    	movq	%rbp, %r8
1454ee80e: 48 8b 4d 58                 	movq	0x58(%rbp), %rcx
1454ee812: 4c 89 e2                    	movq	%r12, %rdx
1454ee815: e8 d6 b1 04 00              	callq	0x1455399f0 <.text+0x55389f0>
1454ee81a: 90                          	nop
1454ee81b: e9 bf fc ff ff              	jmp	0x1454ee4df <.text+0x54ed4df>
