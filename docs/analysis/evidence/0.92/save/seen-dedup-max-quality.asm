
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d8630: 41 57                       	pushq	%r15
1454d8632: 41 56                       	pushq	%r14
1454d8634: 41 55                       	pushq	%r13
1454d8636: 41 54                       	pushq	%r12
1454d8638: 56                          	pushq	%rsi
1454d8639: 57                          	pushq	%rdi
1454d863a: 53                          	pushq	%rbx
1454d863b: 48 83 ec 20                 	subq	$0x20, %rsp
1454d863f: 48 8b 59 10                 	movq	0x10(%rcx), %rbx
1454d8643: 48 83 fb 02                 	cmpq	$0x2, %rbx
1454d8647: 0f 82 09 01 00 00           	jb	0x1454d8756 <.text+0x54d7756>
1454d864d: 48 89 ce                    	movq	%rcx, %rsi
1454d8650: 4c 8b 71 08                 	movq	0x8(%rcx), %r14
1454d8654: 4d 8d 7e 40                 	leaq	0x40(%r14), %r15
1454d8658: 41 bc 01 00 00 00           	movl	$0x1, %r12d
1454d865e: 49 29 dc                    	subq	%rbx, %r12
1454d8661: 41 bd 02 00 00 00           	movl	$0x2, %r13d
1454d8667: eb 1f                       	jmp	0x1454d8688 <.text+0x54d7688>
1454d8669: 0f 1f 80 00 00 00 00        	nopl	(%rax)
1454d8670: 49 83 c7 20                 	addq	$0x20, %r15
1454d8674: 4b 8d 04 2c                 	leaq	(%r12,%r13), %rax
1454d8678: 48 ff c0                    	incq	%rax
1454d867b: 49 ff c5                    	incq	%r13
1454d867e: 48 83 f8 02                 	cmpq	$0x2, %rax
1454d8682: 0f 84 ce 00 00 00           	je	0x1454d8756 <.text+0x54d7756>
1454d8688: 4d 8b 47 d0                 	movq	-0x30(%r15), %r8
1454d868c: 4d 3b 47 f0                 	cmpq	-0x10(%r15), %r8
1454d8690: 75 de                       	jne	0x1454d8670 <.text+0x54d7670>
1454d8692: 49 8b 4f c8                 	movq	-0x38(%r15), %rcx
1454d8696: 49 8b 7f e8                 	movq	-0x18(%r15), %rdi
1454d869a: 48 89 fa                    	movq	%rdi, %rdx
1454d869d: e8 55 c3 23 00              	callq	0x1457149f7 <.text+0x57139f7>
1454d86a2: 85 c0                       	testl	%eax, %eax
1454d86a4: 75 ca                       	jne	0x1454d8670 <.text+0x54d7670>
1454d86a6: 41 8b 47 d8                 	movl	-0x28(%r15), %eax
1454d86aa: 41 8b 4f f8                 	movl	-0x8(%r15), %ecx
1454d86ae: 38 c1                       	cmpb	%al, %cl
1454d86b0: 0f 47 c1                    	cmoval	%ecx, %eax
1454d86b3: 41 88 47 d8                 	movb	%al, -0x28(%r15)
1454d86b7: 49 8b 57 e0                 	movq	-0x20(%r15), %rdx
1454d86bb: 48 85 d2                    	testq	%rdx, %rdx
1454d86be: 74 0e                       	je	0x1454d86ce <.text+0x54d76ce>
1454d86c0: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454d86c6: 48 89 f9                    	movq	%rdi, %rcx
1454d86c9: e8 02 9b b2 fa              	callq	0x1400021d0 <.text+0x11d0>
1454d86ce: 4d 8d 65 ff                 	leaq	-0x1(%r13), %r12
1454d86d2: 4c 39 eb                    	cmpq	%r13, %rbx
1454d86d5: 76 7b                       	jbe	0x1454d8752 <.text+0x54d7752>
1454d86d7: 4c 29 eb                    	subq	%r13, %rbx
1454d86da: eb 23                       	jmp	0x1454d86ff <.text+0x54d76ff>
1454d86dc: 0f 1f 40 00                 	nopl	(%rax)
1454d86e0: 41 0f 10 07                 	movups	(%r15), %xmm0
1454d86e4: 41 0f 10 4f 10              	movups	0x10(%r15), %xmm1
1454d86e9: 41 0f 11 4d 10              	movups	%xmm1, 0x10(%r13)
1454d86ee: 41 0f 11 45 00              	movups	%xmm0, (%r13)
1454d86f3: 49 ff c4                    	incq	%r12
1454d86f6: 49 83 c7 20                 	addq	$0x20, %r15
1454d86fa: 48 ff cb                    	decq	%rbx
1454d86fd: 74 53                       	je	0x1454d8752 <.text+0x54d7752>
1454d86ff: 4c 89 e0                    	movq	%r12, %rax
1454d8702: 48 c1 e0 05                 	shlq	$0x5, %rax
1454d8706: 4d 8d 2c 06                 	leaq	(%r14,%rax), %r13
1454d870a: 4d 8b 44 06 f0              	movq	-0x10(%r14,%rax), %r8
1454d870f: 4d 3b 47 10                 	cmpq	0x10(%r15), %r8
1454d8713: 75 cb                       	jne	0x1454d86e0 <.text+0x54d76e0>
1454d8715: 49 8b 7f 08                 	movq	0x8(%r15), %rdi
1454d8719: 49 8b 4d e8                 	movq	-0x18(%r13), %rcx
1454d871d: 48 89 fa                    	movq	%rdi, %rdx
1454d8720: e8 d2 c2 23 00              	callq	0x1457149f7 <.text+0x57139f7>
1454d8725: 85 c0                       	testl	%eax, %eax
1454d8727: 75 b7                       	jne	0x1454d86e0 <.text+0x54d76e0>
1454d8729: 41 8b 45 f8                 	movl	-0x8(%r13), %eax
1454d872d: 41 8b 4f 18                 	movl	0x18(%r15), %ecx
1454d8731: 38 c1                       	cmpb	%al, %cl
1454d8733: 0f 47 c1                    	cmoval	%ecx, %eax
1454d8736: 41 88 45 f8                 	movb	%al, -0x8(%r13)
1454d873a: 49 8b 17                    	movq	(%r15), %rdx
1454d873d: 48 85 d2                    	testq	%rdx, %rdx
1454d8740: 74 b4                       	je	0x1454d86f6 <.text+0x54d76f6>
1454d8742: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454d8748: 48 89 f9                    	movq	%rdi, %rcx
1454d874b: e8 80 9a b2 fa              	callq	0x1400021d0 <.text+0x11d0>
1454d8750: eb a4                       	jmp	0x1454d86f6 <.text+0x54d76f6>
1454d8752: 4c 89 66 10                 	movq	%r12, 0x10(%rsi)
1454d8756: 48 83 c4 20                 	addq	$0x20, %rsp
1454d875a: 5b                          	popq	%rbx
1454d875b: 5f                          	popq	%rdi
1454d875c: 5e                          	popq	%rsi
1454d875d: 41 5c                       	popq	%r12
1454d875f: 41 5d                       	popq	%r13
1454d8761: 41 5e                       	popq	%r14
1454d8763: 41 5f                       	popq	%r15
1454d8765: c3                          	retq
1454d8766: cc                          	int3
1454d8767: cc                          	int3
1454d8768: cc                          	int3
1454d8769: cc                          	int3
1454d876a: cc                          	int3
1454d876b: cc                          	int3
1454d876c: cc                          	int3
1454d876d: cc                          	int3
1454d876e: cc                          	int3
1454d876f: cc                          	int3
