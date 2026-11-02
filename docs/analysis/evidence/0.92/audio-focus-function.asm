; Supplied0.92.0 SHA-256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408fcc90: 41 57                       	pushq	%r15
1408fcc92: 41 56                       	pushq	%r14
1408fcc94: 41 55                       	pushq	%r13
1408fcc96: 41 54                       	pushq	%r12
1408fcc98: 56                          	pushq	%rsi
1408fcc99: 57                          	pushq	%rdi
1408fcc9a: 55                          	pushq	%rbp
1408fcc9b: 53                          	pushq	%rbx
1408fcc9c: 48 83 ec 28                 	subq	$0x28, %rsp
1408fcca0: 48 8b 8c 24 90 00 00 00     	movq	0x90(%rsp), %rcx
1408fcca8: 48 8b 02                    	movq	(%rdx), %rax
1408fccab: 4c 8b 52 10                 	movq	0x10(%rdx), %r10
1408fccaf: 44 8b 5a 1c                 	movl	0x1c(%rdx), %r11d
1408fccb3: 4d 8b 00                    	movq	(%r8), %r8
1408fccb6: b2 01                       	movb	$0x1, %dl
1408fccb8: 41 80 78 15 00              	cmpb	$0x0, 0x15(%r8)
1408fccbd: 0f 84 bc 00 00 00           	je	0x1408fcd7f <.text+0x8fbd7f>
1408fccc3: 44 0f b6 01                 	movzbl	(%rcx), %r8d
1408fccc7: 41 80 f8 02                 	cmpb	$0x2, %r8b
1408fcccb: 74 0d                       	je	0x1408fccda <.text+0x8fbcda>
1408fcccd: 41 30 d0                    	xorb	%dl, %r8b
1408fccd0: 41 f6 c0 01                 	testb	$0x1, %r8b
1408fccd4: 0f 84 94 00 00 00           	je	0x1408fcd6e <.text+0x8fbd6e>
1408fccda: 88 11                       	movb	%dl, (%rcx)
1408fccdc: 45 89 1a                    	movl	%r11d, (%r10)
1408fccdf: 83 38 02                    	cmpl	$0x2, (%rax)
1408fcce2: 0f 84 86 00 00 00           	je	0x1408fcd6e <.text+0x8fbd6e>
1408fcce8: 0f b6 88 e8 03 00 00        	movzbl	0x3e8(%rax), %ecx
1408fccef: 48 83 f9 03                 	cmpq	$0x3, %rcx
1408fccf3: 0f 83 7e 02 00 00           	jae	0x1408fcf77 <.text+0x8fbf77>
1408fccf9: 0f 57 c0                    	xorps	%xmm0, %xmm0
1408fccfc: 84 d2                       	testb	%dl, %dl
1408fccfe: 75 08                       	jne	0x1408fcd08 <.text+0x8fbd08>
1408fcd00: f3 0f 10 05 68 d0 0d 05     	movss	0x50dd068(%rip), %xmm0  # 0x1459d9d70
1408fcd08: 48 8b 90 e0 03 00 00        	movq	0x3e0(%rax), %rdx
1408fcd0f: 41 89 c8                    	movl	%ecx, %r8d
1408fcd12: 41 c1 e0 07                 	shll	$0x7, %r8d
1408fcd16: 4a c7 84 02 80 00 00 00 00 00 00 00 	movq	$0x0, 0x80(%rdx,%r8)
1408fcd22: 42 c7 84 02 a8 00 00 00 00 00 00 00 	movl	$0x0, 0xa8(%rdx,%r8)
1408fcd2e: 4a c7 84 02 b8 00 00 00 00 00 00 00 	movq	$0x0, 0xb8(%rdx,%r8)
1408fcd3a: 42 c7 84 02 c0 00 00 00 c0 e1 e4 00 	movl	$0xe4e1c0, 0xc0(%rdx,%r8) # imm = 0xE4E1C0
1408fcd46: 42 c7 84 02 c8 00 00 00 07 00 00 00 	movl	$0x7, 0xc8(%rdx,%r8)
1408fcd52: f3 42 0f 11 84 02 cc 00 00 00       	movss	%xmm0, 0xcc(%rdx,%r8)
1408fcd5c: 80 c9 04                    	orb	$0x4, %cl
1408fcd5f: 86 8a 00 02 00 00           	xchgb	%cl, 0x200(%rdx)
1408fcd65: 80 e1 03                    	andb	$0x3, %cl
1408fcd68: 88 88 e8 03 00 00           	movb	%cl, 0x3e8(%rax)
1408fcd6e: 48 83 c4 28                 	addq	$0x28, %rsp
1408fcd72: 5b                          	popq	%rbx
1408fcd73: 5d                          	popq	%rbp
1408fcd74: 5f                          	popq	%rdi
1408fcd75: 5e                          	popq	%rsi
1408fcd76: 41 5c                       	popq	%r12
1408fcd78: 41 5d                       	popq	%r13
1408fcd7a: 41 5e                       	popq	%r14
1408fcd7c: 41 5f                       	popq	%r15
1408fcd7e: c3                          	retq
1408fcd7f: 4d 8b 31                    	movq	(%r9), %r14
1408fcd82: 4d 8b 41 08                 	movq	0x8(%r9), %r8
1408fcd86: 49 8b b6 f8 00 00 00        	movq	0xf8(%r14), %rsi
1408fcd8d: 49 8b be 00 01 00 00        	movq	0x100(%r14), %rdi
1408fcd94: 4c 8d 24 bd 00 00 00 00     	leaq	(,%rdi,4), %r12
1408fcd9c: 4c 8d 0c be                 	leaq	(%rsi,%rdi,4), %r9
1408fcda0: 41 0f b6 9e 08 01 00 00     	movzbl	0x108(%r14), %ebx
1408fcda8: 84 db                       	testb	%bl, %bl
1408fcdaa: 74 35                       	je	0x1408fcde1 <.text+0x8fbde1>
1408fcdac: 48 85 ff                    	testq	%rdi, %rdi
1408fcdaf: 0f 84 b2 00 00 00           	je	0x1408fce67 <.text+0x8fbe67>
1408fcdb5: 4d 8b b8 a8 01 00 00        	movq	0x1a8(%r8), %r15
1408fcdbc: 48 83 c6 04                 	addq	$0x4, %rsi
1408fcdc0: 8b 7e fc                    	movl	-0x4(%rsi), %edi
1408fcdc3: 4c 8d 2c ff                 	leaq	(%rdi,%rdi,8), %r13
1408fcdc7: 4b 8b 7c ef 10              	movq	0x10(%r15,%r13,8), %rdi
1408fcdcc: 48 85 ff                    	testq	%rdi, %rdi
1408fcdcf: 0f 85 b8 00 00 00           	jne	0x1408fce8d <.text+0x8fbe8d>
1408fcdd5: 48 83 c6 04                 	addq	$0x4, %rsi
1408fcdd9: 49 83 c4 fc                 	addq	$-0x4, %r12
1408fcddd: 75 e1                       	jne	0x1408fcdc0 <.text+0x8fbdc0>
1408fcddf: eb 42                       	jmp	0x1408fce23 <.text+0x8fbe23>
1408fcde1: 48 85 ff                    	testq	%rdi, %rdi
1408fcde4: 0f 84 85 00 00 00           	je	0x1408fce6f <.text+0x8fbe6f>
1408fcdea: 4d 8b b8 08 01 00 00        	movq	0x108(%r8), %r15
1408fcdf1: 48 83 c6 04                 	addq	$0x4, %rsi
1408fcdf5: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1408fce00: 8b 7e fc                    	movl	-0x4(%rsi), %edi
1408fce03: 4c 8d 2c bf                 	leaq	(%rdi,%rdi,4), %r13
1408fce07: 49 c1 e5 05                 	shlq	$0x5, %r13
1408fce0b: 4b 8b 7c 2f 58              	movq	0x58(%r15,%r13), %rdi
1408fce10: 48 85 ff                    	testq	%rdi, %rdi
1408fce13: 0f 85 a8 00 00 00           	jne	0x1408fcec1 <.text+0x8fbec1>
1408fce19: 48 83 c6 04                 	addq	$0x4, %rsi
1408fce1d: 49 83 c4 fc                 	addq	$-0x4, %r12
1408fce21: 75 dd                       	jne	0x1408fce00 <.text+0x8fbe00>
1408fce23: 31 ff                       	xorl	%edi, %edi
1408fce25: 4c 89 ce                    	movq	%r9, %rsi
1408fce28: 31 ed                       	xorl	%ebp, %ebp
1408fce2a: 45 31 f6                    	xorl	%r14d, %r14d
1408fce2d: 84 db                       	testb	%bl, %bl
1408fce2f: 0f 85 04 01 00 00           	jne	0x1408fcf39 <.text+0x8fbf39>
1408fce35: 39 fd                       	cmpl	%edi, %ebp
1408fce37: 0f 85 86 fe ff ff           	jne	0x1408fccc3 <.text+0x8fbcc3>
1408fce3d: 0f 1f 00                    	nopl	(%rax)
1408fce40: 4c 39 ce                    	cmpq	%r9, %rsi
1408fce43: 74 32                       	je	0x1408fce77 <.text+0x8fbe77>
1408fce45: 8b 3e                       	movl	(%rsi), %edi
1408fce47: 48 83 c6 04                 	addq	$0x4, %rsi
1408fce4b: 49 8b 98 08 01 00 00        	movq	0x108(%r8), %rbx
1408fce52: 48 8d 3c bf                 	leaq	(%rdi,%rdi,4), %rdi
1408fce56: 48 c1 e7 05                 	shlq	$0x5, %rdi
1408fce5a: 48 83 7c 3b 58 00           	cmpq	$0x0, 0x58(%rbx,%rdi)
1408fce60: 74 de                       	je	0x1408fce40 <.text+0x8fbe40>
1408fce62: e9 5c fe ff ff              	jmp	0x1408fccc3 <.text+0x8fbcc3>
1408fce67: 45 31 f6                    	xorl	%r14d, %r14d
1408fce6a: e9 e1 00 00 00              	jmp	0x1408fcf50 <.text+0x8fbf50>
1408fce6f: 45 31 f6                    	xorl	%r14d, %r14d
1408fce72: 4c 39 ce                    	cmpq	%r9, %rsi
1408fce75: 75 ce                       	jne	0x1408fce45 <.text+0x8fbe45>
1408fce77: 4d 85 f6                    	testq	%r14, %r14
1408fce7a: 0f 84 43 fe ff ff           	je	0x1408fccc3 <.text+0x8fbcc3>
1408fce80: 41 0f b6 96 de 00 00 00     	movzbl	0xde(%r14), %edx
1408fce88: e9 36 fe ff ff              	jmp	0x1408fccc3 <.text+0x8fbcc3>
1408fce8d: 4f 8d 3c ef                 	leaq	(%r15,%r13,8), %r15
1408fce91: 4d 8b b6 10 01 00 00        	movq	0x110(%r14), %r14
1408fce98: 4d 3b 77 40                 	cmpq	0x40(%r15), %r14
1408fce9c: 73 71                       	jae	0x1408fcf0f <.text+0x8fbf0f>
1408fce9e: 4d 8b 67 38                 	movq	0x38(%r15), %r12
1408fcea2: 4f 8b 34 f4                 	movq	(%r12,%r14,8), %r14
1408fcea6: 4d 85 f6                    	testq	%r14, %r14
1408fcea9: 74 64                       	je	0x1408fcf0f <.text+0x8fbf0f>
1408fceab: 4d 8b 7f 18                 	movq	0x18(%r15), %r15
1408fceaf: 49 f7 d6                    	notq	%r14
1408fceb2: 4f 8d 34 76                 	leaq	(%r14,%r14,2), %r14
1408fceb6: 49 c1 e6 04                 	shlq	$0x4, %r14
1408fceba: 4f 8b 74 37 10              	movq	0x10(%r15,%r14), %r14
1408fcebf: eb 6b                       	jmp	0x1408fcf2c <.text+0x8fbf2c>
1408fcec1: 4d 01 ef                    	addq	%r13, %r15
1408fcec4: 45 8b af 94 00 00 00        	movl	0x94(%r15), %r13d
1408fcecb: 4d 8b a0 a8 01 00 00        	movq	0x1a8(%r8), %r12
1408fced2: 4f 8d 6c ed 00              	leaq	(%r13,%r13,8), %r13
1408fced7: 4d 8b b6 10 01 00 00        	movq	0x110(%r14), %r14
1408fcede: 4f 3b 74 ec 40              	cmpq	0x40(%r12,%r13,8), %r14
1408fcee3: 73 2f                       	jae	0x1408fcf14 <.text+0x8fbf14>
1408fcee5: 4f 8d 24 ec                 	leaq	(%r12,%r13,8), %r12
1408fcee9: 4d 8b 6c 24 38              	movq	0x38(%r12), %r13
1408fceee: 4f 8b 74 f5 00              	movq	(%r13,%r14,8), %r14
1408fcef3: 4d 85 f6                    	testq	%r14, %r14
1408fcef6: 74 1c                       	je	0x1408fcf14 <.text+0x8fbf14>
1408fcef8: 4d 8b 64 24 18              	movq	0x18(%r12), %r12
1408fcefd: 49 f7 d6                    	notq	%r14
1408fcf00: 4f 8d 34 76                 	leaq	(%r14,%r14,2), %r14
1408fcf04: 49 c1 e6 04                 	shlq	$0x4, %r14
1408fcf08: 4f 8b 64 34 10              	movq	0x10(%r12,%r14), %r12
1408fcf0d: eb 08                       	jmp	0x1408fcf17 <.text+0x8fbf17>
1408fcf0f: 45 31 f6                    	xorl	%r14d, %r14d
1408fcf12: eb 18                       	jmp	0x1408fcf2c <.text+0x8fbf2c>
1408fcf14: 45 31 e4                    	xorl	%r12d, %r12d
1408fcf17: 4d 8b 77 50                 	movq	0x50(%r15), %r14
1408fcf1b: 45 8b 76 08                 	movl	0x8(%r14), %r14d
1408fcf1f: 41 f7 d6                    	notl	%r14d
1408fcf22: 4d 69 f6 f8 00 00 00        	imulq	$0xf8, %r14, %r14
1408fcf29: 4d 01 e6                    	addq	%r12, %r14
1408fcf2c: bd 01 00 00 00              	movl	$0x1, %ebp
1408fcf31: 84 db                       	testb	%bl, %bl
1408fcf33: 0f 84 fc fe ff ff           	je	0x1408fce35 <.text+0x8fbe35>
1408fcf39: 39 fd                       	cmpl	%edi, %ebp
1408fcf3b: 0f 85 82 fd ff ff           	jne	0x1408fccc3 <.text+0x8fbcc3>
1408fcf41: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
1408fcf50: 4c 39 ce                    	cmpq	%r9, %rsi
1408fcf53: 0f 84 1e ff ff ff           	je	0x1408fce77 <.text+0x8fbe77>
1408fcf59: 8b 3e                       	movl	(%rsi), %edi
1408fcf5b: 48 83 c6 04                 	addq	$0x4, %rsi
1408fcf5f: 49 8b 98 a8 01 00 00        	movq	0x1a8(%r8), %rbx
1408fcf66: 48 8d 3c ff                 	leaq	(%rdi,%rdi,8), %rdi
1408fcf6a: 48 83 7c fb 10 00           	cmpq	$0x0, 0x10(%rbx,%rdi,8)
1408fcf70: 74 de                       	je	0x1408fcf50 <.text+0x8fbf50>
1408fcf72: e9 4c fd ff ff              	jmp	0x1408fccc3 <.text+0x8fbcc3>
1408fcf77: 4c 8d 05 aa fb 10 05        	leaq	0x510fbaa(%rip), %r8    # 0x145a0cb28
1408fcf7e: ba 03 00 00 00              	movl	$0x3, %edx
1408fcf83: e8 9b 6f fa 04              	callq	0x1458a3f23 <.text+0x58a2f23>
1408fcf88: 0f 0b                       	ud2
