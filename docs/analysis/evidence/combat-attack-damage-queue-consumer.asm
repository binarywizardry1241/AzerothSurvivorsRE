
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549c411: 48 8b 85 d0 00 00 00        	movq	0xd0(%rbp), %rax
14549c418: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
14549c41f: 4c 8b a5 d8 00 00 00        	movq	0xd8(%rbp), %r12
14549c426: 48 8b bd e0 00 00 00        	movq	0xe0(%rbp), %rdi
14549c42d: 48 c1 e7 04                 	shlq	$0x4, %rdi
14549c431: 4c 01 e7                    	addq	%r12, %rdi
14549c434: f3 44 0f 10 2d 93 45 40 00  	movss	0x404593(%rip), %xmm13  # 0x1458a09d0
14549c43d: 45 31 f6                    	xorl	%r14d, %r14d
14549c440: 45 0f 57 c0                 	xorps	%xmm8, %xmm8
14549c444: 48 8d 9d 70 01 00 00        	leaq	0x170(%rbp), %rbx
14549c44b: 4c 89 a5 00 02 00 00        	movq	%r12, 0x200(%rbp)
14549c452: 4c 8b ad 60 02 00 00        	movq	0x260(%rbp), %r13
14549c459: eb 4e                       	jmp	0x14549c4a9 <.text+0x549b4a9>
14549c45b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
14549c460: 49 83 c4 10                 	addq	$0x10, %r12
14549c464: 48 8b 8d 60 02 00 00        	movq	0x260(%rbp), %rcx
14549c46b: 48 8b 81 38 05 00 00        	movq	0x538(%rcx), %rax
14549c472: 48 89 f2                    	movq	%rsi, %rdx
14549c475: 48 c1 e2 05                 	shlq	$0x5, %rdx
14549c479: 0f 10 85 70 01 00 00        	movups	0x170(%rbp), %xmm0
14549c480: 0f 10 8d 80 01 00 00        	movups	0x180(%rbp), %xmm1
14549c487: 0f 11 4c 10 10              	movups	%xmm1, 0x10(%rax,%rdx)
14549c48c: 0f 11 04 10                 	movups	%xmm0, (%rax,%rdx)
14549c490: 48 ff c6                    	incq	%rsi
14549c493: 48 89 b1 40 05 00 00        	movq	%rsi, 0x540(%rcx)
14549c49a: 0f 28 cf                    	movaps	%xmm7, %xmm1
14549c49d: 4d 89 f8                    	movq	%r15, %r8
14549c4a0: 41 b1 01                    	movb	$0x1, %r9b
14549c4a3: e8 98 6f fc ff              	callq	0x145463440 <.text+0x5462440>
14549c4a8: 90                          	nop
14549c4a9: 49 39 fc                    	cmpq	%rdi, %r12
14549c4ac: 0f 84 81 00 00 00           	je	0x14549c533 <.text+0x549b533>
14549c4b2: f3 41 0f 10 3c 24           	movss	(%r12), %xmm7
14549c4b8: 41 0f 28 c5                 	movaps	%xmm13, %xmm0
14549c4bc: 48 8b 85 60 02 00 00        	movq	0x260(%rbp), %rax
14549c4c3: f3 0f 5c 80 70 04 00 00     	subss	0x470(%rax), %xmm0
14549c4cb: f3 0f 59 c7                 	mulss	%xmm7, %xmm0
14549c4cf: f3 41 0f 5f c5              	maxss	%xmm13, %xmm0
14549c4d4: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
14549c4d9: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
14549c4dd: 41 0f 42 c6                 	cmovbl	%r14d, %eax
14549c4e1: 41 0f 2e c4                 	ucomiss	%xmm12, %xmm0
14549c4e5: 41 b9 ff ff ff ff           	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
14549c4eb: 77 03                       	ja	0x14549c4f0 <.text+0x549b4f0>
14549c4ed: 41 89 c1                    	movl	%eax, %r9d
14549c4f0: 4d 8b 7c 24 08              	movq	0x8(%r12), %r15
14549c4f5: 4d 8b 85 c8 03 00 00        	movq	0x3c8(%r13), %r8
14549c4fc: c6 44 24 20 00              	movb	$0x0, 0x20(%rsp)
14549c501: 48 89 d9                    	movq	%rbx, %rcx
14549c504: 4c 89 fa                    	movq	%r15, %rdx
14549c507: e8 f4 d1 fa ff              	callq	0x145449700 <.text+0x5448700>
14549c50c: 90                          	nop
14549c50d: 49 8b b5 40 05 00 00        	movq	0x540(%r13), %rsi
14549c514: 49 3b b5 30 05 00 00        	cmpq	0x530(%r13), %rsi
14549c51b: 0f 85 3f ff ff ff           	jne	0x14549c460 <.text+0x549b460>
14549c521: 48 8b 8d 50 02 00 00        	movq	0x250(%rbp), %rcx
14549c528: e8 73 f3 26 00              	callq	0x14570b8a0 <.text+0x570a8a0>
14549c52d: 90                          	nop
14549c52e: e9 2d ff ff ff              	jmp	0x14549c460 <.text+0x549b460>
