
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540d430: 41 57                       	pushq	%r15
14540d432: 41 56                       	pushq	%r14
14540d434: 41 55                       	pushq	%r13
14540d436: 41 54                       	pushq	%r12
14540d438: 56                          	pushq	%rsi
14540d439: 57                          	pushq	%rdi
14540d43a: 55                          	pushq	%rbp
14540d43b: 53                          	pushq	%rbx
14540d43c: 48 81 ec b8 00 00 00        	subq	$0xb8, %rsp
14540d443: 44 0f 29 8c 24 a0 00 00 00  	movaps	%xmm9, 0xa0(%rsp)
14540d44c: 44 0f 29 84 24 90 00 00 00  	movaps	%xmm8, 0x90(%rsp)
14540d455: 0f 29 bc 24 80 00 00 00     	movaps	%xmm7, 0x80(%rsp)
14540d45d: 0f 29 74 24 70              	movaps	%xmm6, 0x70(%rsp)
14540d462: 0f 28 f3                    	movaps	%xmm3, %xmm6
14540d465: 44 89 c5                    	movl	%r8d, %ebp
14540d468: 89 d7                       	movl	%edx, %edi
14540d46a: 48 89 cb                    	movq	%rcx, %rbx
14540d46d: 4c 8b a4 24 40 01 00 00     	movq	0x140(%rsp), %r12
14540d475: 4c 8b ac 24 38 01 00 00     	movq	0x138(%rsp), %r13
14540d47d: 4c 8b 71 10                 	movq	0x10(%rcx), %r14
14540d481: 4d 85 f6                    	testq	%r14, %r14
14540d484: 0f 84 11 04 00 00           	je	0x14540d89b <.text+0x540c89b>
14540d48a: 48 8b 43 08                 	movq	0x8(%rbx), %rax
14540d48e: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d492: 48 89 44 24 30              	movq	%rax, 0x30(%rsp)
14540d497: 48 8d 48 20                 	leaq	0x20(%rax), %rcx
14540d49b: 74 3b                       	je	0x14540d4d8 <.text+0x540c4d8>
14540d49d: 31 c0                       	xorl	%eax, %eax
14540d49f: eb 1f                       	jmp	0x14540d4c0 <.text+0x540c4c0>
14540d4a1: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
14540d4b0: 48 ff c0                    	incq	%rax
14540d4b3: 48 83 c1 30                 	addq	$0x30, %rcx
14540d4b7: 49 39 c6                    	cmpq	%rax, %r14
14540d4ba: 0f 84 cb 00 00 00           	je	0x14540d58b <.text+0x540c58b>
14540d4c0: 39 79 f0                    	cmpl	%edi, -0x10(%rcx)
14540d4c3: 75 eb                       	jne	0x14540d4b0 <.text+0x540c4b0>
14540d4c5: 83 79 e0 01                 	cmpl	$0x1, -0x20(%rcx)
14540d4c9: 75 e5                       	jne	0x14540d4b0 <.text+0x540c4b0>
14540d4cb: 4c 39 61 e8                 	cmpq	%r12, -0x18(%rcx)
14540d4cf: 75 df                       	jne	0x14540d4b0 <.text+0x540c4b0>
14540d4d1: 83 39 00                    	cmpl	$0x0, (%rcx)
14540d4d4: 75 da                       	jne	0x14540d4b0 <.text+0x540c4b0>
14540d4d6: eb 28                       	jmp	0x14540d500 <.text+0x540c500>
14540d4d8: 31 c0                       	xorl	%eax, %eax
14540d4da: eb 14                       	jmp	0x14540d4f0 <.text+0x540c4f0>
14540d4dc: 0f 1f 40 00                 	nopl	(%rax)
14540d4e0: 48 ff c0                    	incq	%rax
14540d4e3: 48 83 c1 30                 	addq	$0x30, %rcx
14540d4e7: 49 39 c6                    	cmpq	%rax, %r14
14540d4ea: 0f 84 9b 00 00 00           	je	0x14540d58b <.text+0x540c58b>
14540d4f0: 39 79 f0                    	cmpl	%edi, -0x10(%rcx)
14540d4f3: 75 eb                       	jne	0x14540d4e0 <.text+0x540c4e0>
14540d4f5: 80 79 e0 00                 	cmpb	$0x0, -0x20(%rcx)
14540d4f9: 75 e5                       	jne	0x14540d4e0 <.text+0x540c4e0>
14540d4fb: 83 39 00                    	cmpl	$0x0, (%rcx)
14540d4fe: 75 e0                       	jne	0x14540d4e0 <.text+0x540c4e0>
14540d500: 48 8d 48 01                 	leaq	0x1(%rax), %rcx
14540d504: 4c 39 f1                    	cmpq	%r14, %rcx
14540d507: 73 72                       	jae	0x14540d57b <.text+0x540c57b>
14540d509: 48 89 c1                    	movq	%rax, %rcx
14540d50c: 48 f7 d1                    	notq	%rcx
14540d50f: 4c 01 f1                    	addq	%r14, %rcx
14540d512: 48 8d 14 40                 	leaq	(%rax,%rax,2), %rdx
14540d516: 48 c1 e2 04                 	shlq	$0x4, %rdx
14540d51a: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d51e: 0f 84 32 04 00 00           	je	0x14540d956 <.text+0x540c956>
14540d524: 4c 8b 44 24 30              	movq	0x30(%rsp), %r8
14540d529: 4c 01 c2                    	addq	%r8, %rdx
14540d52c: 48 83 c2 30                 	addq	$0x30, %rdx
14540d530: 4c 8b 4c 24 30              	movq	0x30(%rsp), %r9
14540d535: 39 7a 10                    	cmpl	%edi, 0x10(%rdx)
14540d538: 75 11                       	jne	0x14540d54b <.text+0x540c54b>
14540d53a: 83 3a 01                    	cmpl	$0x1, (%rdx)
14540d53d: 75 0c                       	jne	0x14540d54b <.text+0x540c54b>
14540d53f: 4c 39 62 08                 	cmpq	%r12, 0x8(%rdx)
14540d543: 75 06                       	jne	0x14540d54b <.text+0x540c54b>
14540d545: 83 7a 20 00                 	cmpl	$0x0, 0x20(%rdx)
14540d549: 74 27                       	je	0x14540d572 <.text+0x540c572>
14540d54b: 4c 8d 04 40                 	leaq	(%rax,%rax,2), %r8
14540d54f: 49 c1 e0 04                 	shlq	$0x4, %r8
14540d553: 0f 10 02                    	movups	(%rdx), %xmm0
14540d556: 0f 10 4a 10                 	movups	0x10(%rdx), %xmm1
14540d55a: 0f 10 52 20                 	movups	0x20(%rdx), %xmm2
14540d55e: 43 0f 11 54 01 20           	movups	%xmm2, 0x20(%r9,%r8)
14540d564: 43 0f 11 4c 01 10           	movups	%xmm1, 0x10(%r9,%r8)
14540d56a: 43 0f 11 04 01              	movups	%xmm0, (%r9,%r8)
14540d56f: 48 ff c0                    	incq	%rax
14540d572: 48 83 c2 30                 	addq	$0x30, %rdx
14540d576: 48 ff c9                    	decq	%rcx
14540d579: 75 ba                       	jne	0x14540d535 <.text+0x540c535>
14540d57b: 48 89 43 10                 	movq	%rax, 0x10(%rbx)
14540d57f: 49 89 c6                    	movq	%rax, %r14
14540d582: 48 85 c0                    	testq	%rax, %rax
14540d585: 0f 84 10 03 00 00           	je	0x14540d89b <.text+0x540c89b>
14540d58b: 40 88 6c 24 2f              	movb	%bpl, 0x2f(%rsp)
14540d590: 48 89 5c 24 38              	movq	%rbx, 0x38(%rsp)
14540d595: 48 8b 84 24 48 01 00 00     	movq	0x148(%rsp), %rax
14540d59d: 48 83 f8 01                 	cmpq	$0x1, %rax
14540d5a1: 48 83 d0 00                 	adcq	$0x0, %rax
14540d5a5: 48 89 44 24 60              	movq	%rax, 0x60(%rsp)
14540d5aa: 44 89 ee                    	movl	%r13d, %esi
14540d5ad: 40 80 f6 01                 	xorb	$0x1, %sil
14540d5b1: 49 8d 5e ff                 	leaq	-0x1(%r14), %rbx
14540d5b5: 48 8b 6c 24 30              	movq	0x30(%rsp), %rbp
14540d5ba: 48 8d 45 40                 	leaq	0x40(%rbp), %rax
14540d5be: 48 89 44 24 40              	movq	%rax, 0x40(%rsp)
14540d5c3: 48 8d 45 20                 	leaq	0x20(%rbp), %rax
14540d5c7: 48 89 44 24 58              	movq	%rax, 0x58(%rsp)
14540d5cc: 48 8d 45 50                 	leaq	0x50(%rbp), %rax
14540d5d0: 48 89 44 24 50              	movq	%rax, 0x50(%rsp)
14540d5d5: 48 89 5c 24 48              	movq	%rbx, 0x48(%rsp)
14540d5da: 45 31 ff                    	xorl	%r15d, %r15d
14540d5dd: 0f 1f 00                    	nopl	(%rax)
14540d5e0: 4c 89 f1                    	movq	%r14, %rcx
14540d5e3: 48 83 e1 fe                 	andq	$-0x2, %rcx
14540d5e7: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d5eb: 74 13                       	je	0x14540d600 <.text+0x540c600>
14540d5ed: 4c 39 7c 24 48              	cmpq	%r15, 0x48(%rsp)
14540d5f2: 75 2c                       	jne	0x14540d620 <.text+0x540c620>
14540d5f4: 31 d2                       	xorl	%edx, %edx
14540d5f6: 31 c0                       	xorl	%eax, %eax
14540d5f8: e9 f9 00 00 00              	jmp	0x14540d6f6 <.text+0x540c6f6>
14540d5fd: 0f 1f 00                    	nopl	(%rax)
14540d600: 4c 39 7c 24 48              	cmpq	%r15, 0x48(%rsp)
14540d605: 0f 85 95 00 00 00           	jne	0x14540d6a0 <.text+0x540c6a0>
14540d60b: 31 d2                       	xorl	%edx, %edx
14540d60d: 31 c0                       	xorl	%eax, %eax
14540d60f: e9 12 01 00 00              	jmp	0x14540d726 <.text+0x540c726>
14540d614: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
14540d620: 4c 8b 44 24 40              	movq	0x40(%rsp), %r8
14540d625: 31 d2                       	xorl	%edx, %edx
14540d627: 31 c0                       	xorl	%eax, %eax
14540d629: eb 31                       	jmp	0x14540d65c <.text+0x540c65c>
14540d62b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14540d630: 45 31 d2                    	xorl	%r10d, %r10d
14540d633: 45 0f b6 c9                 	movzbl	%r9b, %r9d
14540d637: 41 83 e1 01                 	andl	$0x1, %r9d
14540d63b: 49 89 c3                    	movq	%rax, %r11
14540d63e: 4d 01 cb                    	addq	%r9, %r11
14540d641: 41 0f b6 c2                 	movzbl	%r10b, %eax
14540d645: 83 e0 01                    	andl	$0x1, %eax
14540d648: 4c 01 d8                    	addq	%r11, %rax
14540d64b: 48 83 c2 02                 	addq	$0x2, %rdx
14540d64f: 49 83 c0 60                 	addq	$0x60, %r8
14540d653: 48 39 d1                    	cmpq	%rdx, %rcx
14540d656: 0f 84 94 00 00 00           	je	0x14540d6f0 <.text+0x540c6f0>
14540d65c: 41 39 78 d0                 	cmpl	%edi, -0x30(%r8)
14540d660: 75 1e                       	jne	0x14540d680 <.text+0x540c680>
14540d662: 41 83 78 c0 01              	cmpl	$0x1, -0x40(%r8)
14540d667: 41 89 f1                    	movl	%esi, %r9d
14540d66a: 75 17                       	jne	0x14540d683 <.text+0x540c683>
14540d66c: 4d 39 60 c8                 	cmpq	%r12, -0x38(%r8)
14540d670: 41 0f 94 c1                 	sete	%r9b
14540d674: eb 0d                       	jmp	0x14540d683 <.text+0x540c683>
14540d676: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
14540d680: 45 31 c9                    	xorl	%r9d, %r9d
14540d683: 41 39 38                    	cmpl	%edi, (%r8)
14540d686: 75 a8                       	jne	0x14540d630 <.text+0x540c630>
14540d688: 41 83 78 f0 01              	cmpl	$0x1, -0x10(%r8)
14540d68d: 41 89 f2                    	movl	%esi, %r10d
14540d690: 75 a1                       	jne	0x14540d633 <.text+0x540c633>
14540d692: 4d 39 60 f8                 	cmpq	%r12, -0x8(%r8)
14540d696: 41 0f 94 c2                 	sete	%r10b
14540d69a: eb 97                       	jmp	0x14540d633 <.text+0x540c633>
14540d69c: 0f 1f 40 00                 	nopl	(%rax)
14540d6a0: 4c 8b 44 24 40              	movq	0x40(%rsp), %r8
14540d6a5: 31 d2                       	xorl	%edx, %edx
14540d6a7: 31 c0                       	xorl	%eax, %eax
14540d6a9: eb 20                       	jmp	0x14540d6cb <.text+0x540c6cb>
14540d6ab: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14540d6b0: 4d 8b 50 f0                 	movq	-0x10(%r8), %r10
14540d6b4: 49 83 f2 01                 	xorq	$0x1, %r10
14540d6b8: 4c 01 c8                    	addq	%r9, %rax
14540d6bb: 4c 01 d0                    	addq	%r10, %rax
14540d6be: 48 83 c2 02                 	addq	$0x2, %rdx
14540d6c2: 49 83 c0 60                 	addq	$0x60, %r8
14540d6c6: 48 39 d1                    	cmpq	%rdx, %rcx
14540d6c9: 74 55                       	je	0x14540d720 <.text+0x540c720>
14540d6cb: 41 39 78 d0                 	cmpl	%edi, -0x30(%r8)
14540d6cf: 75 0f                       	jne	0x14540d6e0 <.text+0x540c6e0>
14540d6d1: 4d 8b 48 c0                 	movq	-0x40(%r8), %r9
14540d6d5: 49 83 f1 01                 	xorq	$0x1, %r9
14540d6d9: 41 39 38                    	cmpl	%edi, (%r8)
14540d6dc: 74 d2                       	je	0x14540d6b0 <.text+0x540c6b0>
14540d6de: eb 08                       	jmp	0x14540d6e8 <.text+0x540c6e8>
14540d6e0: 45 31 c9                    	xorl	%r9d, %r9d
14540d6e3: 41 39 38                    	cmpl	%edi, (%r8)
14540d6e6: 74 c8                       	je	0x14540d6b0 <.text+0x540c6b0>
14540d6e8: 45 31 d2                    	xorl	%r10d, %r10d
14540d6eb: eb cb                       	jmp	0x14540d6b8 <.text+0x540c6b8>
14540d6ed: 0f 1f 00                    	nopl	(%rax)
14540d6f0: 41 f6 c6 01                 	testb	$0x1, %r14b
14540d6f4: 74 59                       	je	0x14540d74f <.text+0x540c74f>
14540d6f6: 48 8d 0c 52                 	leaq	(%rdx,%rdx,2), %rcx
14540d6fa: 48 c1 e1 04                 	shlq	$0x4, %rcx
14540d6fe: 39 7c 0d 10                 	cmpl	%edi, 0x10(%rbp,%rcx)
14540d702: 75 3c                       	jne	0x14540d740 <.text+0x540c740>
14540d704: 48 01 e9                    	addq	%rbp, %rcx
14540d707: 83 39 01                    	cmpl	$0x1, (%rcx)
14540d70a: 89 f2                       	movl	%esi, %edx
14540d70c: 75 34                       	jne	0x14540d742 <.text+0x540c742>
14540d70e: 4c 39 61 08                 	cmpq	%r12, 0x8(%rcx)
14540d712: 0f 94 c2                    	sete	%dl
14540d715: eb 2b                       	jmp	0x14540d742 <.text+0x540c742>
14540d717: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
14540d720: 41 f6 c6 01                 	testb	$0x1, %r14b
14540d724: 74 29                       	je	0x14540d74f <.text+0x540c74f>
14540d726: 48 8d 0c 52                 	leaq	(%rdx,%rdx,2), %rcx
14540d72a: 48 c1 e1 04                 	shlq	$0x4, %rcx
14540d72e: 39 7c 0d 10                 	cmpl	%edi, 0x10(%rbp,%rcx)
14540d732: 75 16                       	jne	0x14540d74a <.text+0x540c74a>
14540d734: 48 01 e9                    	addq	%rbp, %rcx
14540d737: 48 8b 09                    	movq	(%rcx), %rcx
14540d73a: 48 83 f1 01                 	xorq	$0x1, %rcx
14540d73e: eb 0c                       	jmp	0x14540d74c <.text+0x540c74c>
14540d740: 31 d2                       	xorl	%edx, %edx
14540d742: 0f b6 ca                    	movzbl	%dl, %ecx
14540d745: 83 e1 01                    	andl	$0x1, %ecx
14540d748: eb 02                       	jmp	0x14540d74c <.text+0x540c74c>
14540d74a: 31 c9                       	xorl	%ecx, %ecx
14540d74c: 48 01 c8                    	addq	%rcx, %rax
14540d74f: 48 3b 44 24 60              	cmpq	0x60(%rsp), %rax
14540d754: 0f 82 35 01 00 00           	jb	0x14540d88f <.text+0x540c88f>
14540d75a: 48 89 d8                    	movq	%rbx, %rax
14540d75d: 48 8b 54 24 50              	movq	0x50(%rsp), %rdx
14540d762: 4c 8b 4c 24 58              	movq	0x58(%rsp), %r9
14540d767: 31 c9                       	xorl	%ecx, %ecx
14540d769: eb 22                       	jmp	0x14540d78d <.text+0x540c78d>
14540d76b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14540d770: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d774: 74 39                       	je	0x14540d7af <.text+0x540c7af>
14540d776: 48 ff c1                    	incq	%rcx
14540d779: 49 83 c1 30                 	addq	$0x30, %r9
14540d77d: 48 83 c2 30                 	addq	$0x30, %rdx
14540d781: 48 ff c8                    	decq	%rax
14540d784: 49 39 ce                    	cmpq	%rcx, %r14
14540d787: 0f 84 36 02 00 00           	je	0x14540d9c3 <.text+0x540c9c3>
14540d78d: 49 39 ce                    	cmpq	%rcx, %r14
14540d790: 0f 84 19 02 00 00           	je	0x14540d9af <.text+0x540c9af>
14540d796: 41 39 79 f0                 	cmpl	%edi, -0x10(%r9)
14540d79a: 75 da                       	jne	0x14540d776 <.text+0x540c776>
14540d79c: 41 83 79 e0 01              	cmpl	$0x1, -0x20(%r9)
14540d7a1: 75 cd                       	jne	0x14540d770 <.text+0x540c770>
14540d7a3: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d7a7: 74 cd                       	je	0x14540d776 <.text+0x540c776>
14540d7a9: 4d 39 61 e8                 	cmpq	%r12, -0x18(%r9)
14540d7ad: 75 c7                       	jne	0x14540d776 <.text+0x540c776>
14540d7af: 4c 89 7c 24 68              	movq	%r15, 0x68(%rsp)
14540d7b4: 4c 8d 41 01                 	leaq	0x1(%rcx), %r8
14540d7b8: 4d 39 f0                    	cmpq	%r14, %r8
14540d7bb: 73 63                       	jae	0x14540d820 <.text+0x540c820>
14540d7bd: 45 8b 09                    	movl	(%r9), %r9d
14540d7c0: 49 89 cf                    	movq	%rcx, %r15
14540d7c3: eb 27                       	jmp	0x14540d7ec <.text+0x540c7ec>
14540d7c5: 44 8b 12                    	movl	(%rdx), %r10d
14540d7c8: 45 39 d1                    	cmpl	%r10d, %r9d
14540d7cb: 4d 0f 47 f8                 	cmovaq	%r8, %r15
14540d7cf: 45 0f 43 ca                 	cmovael	%r10d, %r9d
14540d7d3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
14540d7e0: 48 83 c2 30                 	addq	$0x30, %rdx
14540d7e4: 49 ff c0                    	incq	%r8
14540d7e7: 48 ff c8                    	decq	%rax
14540d7ea: 74 37                       	je	0x14540d823 <.text+0x540c823>
14540d7ec: 4d 39 f0                    	cmpq	%r14, %r8
14540d7ef: 0f 83 dc 01 00 00           	jae	0x14540d9d1 <.text+0x540c9d1>
14540d7f5: 39 7a f0                    	cmpl	%edi, -0x10(%rdx)
14540d7f8: 75 e6                       	jne	0x14540d7e0 <.text+0x540c7e0>
14540d7fa: 83 7a e0 01                 	cmpl	$0x1, -0x20(%rdx)
14540d7fe: 75 10                       	jne	0x14540d810 <.text+0x540c810>
14540d800: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d804: 74 da                       	je	0x14540d7e0 <.text+0x540c7e0>
14540d806: 4c 39 62 e8                 	cmpq	%r12, -0x18(%rdx)
14540d80a: 74 b9                       	je	0x14540d7c5 <.text+0x540c7c5>
14540d80c: eb d2                       	jmp	0x14540d7e0 <.text+0x540c7e0>
14540d80e: 66 90                       	nop
14540d810: 41 f6 c5 01                 	testb	$0x1, %r13b
14540d814: 75 ca                       	jne	0x14540d7e0 <.text+0x540c7e0>
14540d816: eb ad                       	jmp	0x14540d7c5 <.text+0x540c7c5>
14540d818: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14540d820: 49 89 cf                    	movq	%rcx, %r15
14540d823: 4d 39 f7                    	cmpq	%r14, %r15
14540d826: 0f 83 c0 01 00 00           	jae	0x14540d9ec <.text+0x540c9ec>
14540d82c: 4b 8d 04 7f                 	leaq	(%r15,%r15,2), %rax
14540d830: 48 c1 e0 04                 	shlq	$0x4, %rax
14540d834: 48 8d 0c 28                 	leaq	(%rax,%rbp), %rcx
14540d838: 48 89 ea                    	movq	%rbp, %rdx
14540d83b: 48 8b 6c 05 00              	movq	(%rbp,%rax), %rbp
14540d840: 48 01 c2                    	addq	%rax, %rdx
14540d843: 48 83 c2 30                 	addq	$0x30, %rdx
14540d847: 4c 89 f8                    	movq	%r15, %rax
14540d84a: 48 f7 d0                    	notq	%rax
14540d84d: 4c 01 f0                    	addq	%r14, %rax
14540d850: 48 c1 e0 04                 	shlq	$0x4, %rax
14540d854: 4c 8d 04 40                 	leaq	(%rax,%rax,2), %r8
14540d858: e8 74 95 34 00              	callq	0x145756dd1 <.text+0x5755dd1>
14540d85d: 49 ff ce                    	decq	%r14
14540d860: 48 8b 44 24 38              	movq	0x38(%rsp), %rax
14540d865: 4c 89 70 10                 	movq	%r14, 0x10(%rax)
14540d869: 48 83 fd 02                 	cmpq	$0x2, %rbp
14540d86d: 0f 84 79 01 00 00           	je	0x14540d9ec <.text+0x540c9ec>
14540d873: 4c 8b 7c 24 68              	movq	0x68(%rsp), %r15
14540d878: 49 ff c7                    	incq	%r15
14540d87b: 48 ff cb                    	decq	%rbx
14540d87e: 4d 85 f6                    	testq	%r14, %r14
14540d881: 48 8b 6c 24 30              	movq	0x30(%rsp), %rbp
14540d886: 0f 85 54 fd ff ff           	jne	0x14540d5e0 <.text+0x540c5e0>
14540d88c: 45 31 f6                    	xorl	%r14d, %r14d
14540d88f: 48 8b 5c 24 38              	movq	0x38(%rsp), %rbx
14540d894: 0f b6 6c 24 2f              	movzbl	0x2f(%rsp), %ebp
14540d899: eb 03                       	jmp	0x14540d89e <.text+0x540c89e>
14540d89b: 45 31 f6                    	xorl	%r14d, %r14d
14540d89e: f3 44 0f 10 84 24 50 01 00 00       	movss	0x150(%rsp), %xmm8
14540d8a8: f3 0f 10 bc 24 30 01 00 00  	movss	0x130(%rsp), %xmm7
14540d8b1: 8b b4 24 28 01 00 00        	movl	0x128(%rsp), %esi
14540d8b8: f3 44 0f 10 8c 24 20 01 00 00       	movss	0x120(%rsp), %xmm9
14540d8c2: 4c 3b 33                    	cmpq	(%rbx), %r14
14540d8c5: 75 08                       	jne	0x14540d8cf <.text+0x540c8cf>
14540d8c7: 48 89 d9                    	movq	%rbx, %rcx
14540d8ca: e8 c1 a8 34 00              	callq	0x145758190 <.text+0x5757190>
14540d8cf: 89 f0                       	movl	%esi, %eax
14540d8d1: 0f 57 c0                    	xorps	%xmm0, %xmm0
14540d8d4: f3 48 0f 2a c0              	cvtsi2ss	%rax, %xmm0
14540d8d9: 48 8b 43 08                 	movq	0x8(%rbx), %rax
14540d8dd: 4b 8d 0c 76                 	leaq	(%r14,%r14,2), %rcx
14540d8e1: 48 c1 e1 04                 	shlq	$0x4, %rcx
14540d8e5: 4c 89 2c 08                 	movq	%r13, (%rax,%rcx)
14540d8e9: 4c 89 64 08 08              	movq	%r12, 0x8(%rax,%rcx)
14540d8ee: 89 7c 08 10                 	movl	%edi, 0x10(%rax,%rcx)
14540d8f2: 41 0f 14 f1                 	unpcklps	%xmm9, %xmm6            # xmm6 = xmm6[0],xmm9[0],xmm6[1],xmm9[1]
14540d8f6: f3 0f 12 c0                 	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
14540d8fa: 0f 5e f0                    	divps	%xmm0, %xmm6
14540d8fd: 0f 13 74 08 14              	movlps	%xmm6, 0x14(%rax,%rcx)
14540d902: f3 44 0f 11 44 08 1c        	movss	%xmm8, 0x1c(%rax,%rcx)
14540d909: 89 74 08 20                 	movl	%esi, 0x20(%rax,%rcx)
14540d90d: 89 74 08 24                 	movl	%esi, 0x24(%rax,%rcx)
14540d911: f3 0f 11 7c 08 28           	movss	%xmm7, 0x28(%rax,%rcx)
14540d917: 40 88 6c 08 2c              	movb	%bpl, 0x2c(%rax,%rcx)
14540d91c: 49 ff c6                    	incq	%r14
14540d91f: 4c 89 73 10                 	movq	%r14, 0x10(%rbx)
14540d923: 0f 28 74 24 70              	movaps	0x70(%rsp), %xmm6
14540d928: 0f 28 bc 24 80 00 00 00     	movaps	0x80(%rsp), %xmm7
14540d930: 44 0f 28 84 24 90 00 00 00  	movaps	0x90(%rsp), %xmm8
14540d939: 44 0f 28 8c 24 a0 00 00 00  	movaps	0xa0(%rsp), %xmm9
14540d942: 48 81 c4 b8 00 00 00        	addq	$0xb8, %rsp
14540d949: 5b                          	popq	%rbx
14540d94a: 5d                          	popq	%rbp
14540d94b: 5f                          	popq	%rdi
14540d94c: 5e                          	popq	%rsi
14540d94d: 41 5c                       	popq	%r12
14540d94f: 41 5d                       	popq	%r13
14540d951: 41 5e                       	popq	%r14
14540d953: 41 5f                       	popq	%r15
14540d955: c3                          	retq
14540d956: 4c 8b 44 24 30              	movq	0x30(%rsp), %r8
14540d95b: 4c 01 c2                    	addq	%r8, %rdx
14540d95e: 48 83 c2 30                 	addq	$0x30, %rdx
14540d962: 4c 8b 4c 24 30              	movq	0x30(%rsp), %r9
14540d967: eb 34                       	jmp	0x14540d99d <.text+0x540c99d>
14540d969: 4c 8d 04 40                 	leaq	(%rax,%rax,2), %r8
14540d96d: 49 c1 e0 04                 	shlq	$0x4, %r8
14540d971: 0f 10 02                    	movups	(%rdx), %xmm0
14540d974: 0f 10 4a 10                 	movups	0x10(%rdx), %xmm1
14540d978: 0f 10 52 20                 	movups	0x20(%rdx), %xmm2
14540d97c: 43 0f 11 54 01 20           	movups	%xmm2, 0x20(%r9,%r8)
14540d982: 43 0f 11 4c 01 10           	movups	%xmm1, 0x10(%r9,%r8)
14540d988: 43 0f 11 04 01              	movups	%xmm0, (%r9,%r8)
14540d98d: 48 ff c0                    	incq	%rax
14540d990: 48 83 c2 30                 	addq	$0x30, %rdx
14540d994: 48 ff c9                    	decq	%rcx
14540d997: 0f 84 de fb ff ff           	je	0x14540d57b <.text+0x540c57b>
14540d99d: 39 7a 10                    	cmpl	%edi, 0x10(%rdx)
14540d9a0: 75 c7                       	jne	0x14540d969 <.text+0x540c969>
14540d9a2: 80 3a 00                    	cmpb	$0x0, (%rdx)
14540d9a5: 75 c2                       	jne	0x14540d969 <.text+0x540c969>
14540d9a7: 83 7a 20 00                 	cmpl	$0x0, 0x20(%rdx)
14540d9ab: 75 bc                       	jne	0x14540d969 <.text+0x540c969>
14540d9ad: eb e1                       	jmp	0x14540d990 <.text+0x540c990>
14540d9af: 4c 8d 05 42 0e 30 01        	leaq	0x1300e42(%rip), %r8    # 0x14670e7f8
14540d9b6: 4c 89 f1                    	movq	%r14, %rcx
14540d9b9: 4c 89 f2                    	movq	%r14, %rdx
14540d9bc: e8 f2 9b 4d 00              	callq	0x1458e75b3 <.text+0x58e65b3>
14540d9c1: 0f 0b                       	ud2
14540d9c3: 48 8d 0d 2e 0f 30 01        	leaq	0x1300f2e(%rip), %rcx   # 0x14670e8f8
14540d9ca: e8 41 9b 4d 00              	callq	0x1458e7510 <.text+0x58e6510>
14540d9cf: 0f 0b                       	ud2
14540d9d1: 48 ff c1                    	incq	%rcx
14540d9d4: 4c 39 f1                    	cmpq	%r14, %rcx
14540d9d7: 49 0f 46 ce                 	cmovbeq	%r14, %rcx
14540d9db: 4c 8d 05 de bb 8d 01        	leaq	0x18dbbde(%rip), %r8    # 0x146ce95c0
14540d9e2: 4c 89 f2                    	movq	%r14, %rdx
14540d9e5: e8 c9 9b 4d 00              	callq	0x1458e75b3 <.text+0x58e65b3>
14540d9ea: 0f 0b                       	ud2
14540d9ec: 4c 8d 05 1d 0f 30 01        	leaq	0x1300f1d(%rip), %r8    # 0x14670e910
14540d9f3: 4c 89 f9                    	movq	%r15, %rcx
14540d9f6: 4c 89 f2                    	movq	%r14, %rdx
14540d9f9: e8 ed 98 4d 00              	callq	0x1458e72eb <.text+0x58e62eb>
14540d9fe: 0f 0b                       	ud2
