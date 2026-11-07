
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145532630: 55                          	pushq	%rbp
145532631: 41 57                       	pushq	%r15
145532633: 41 56                       	pushq	%r14
145532635: 41 55                       	pushq	%r13
145532637: 41 54                       	pushq	%r12
145532639: 56                          	pushq	%rsi
14553263a: 57                          	pushq	%rdi
14553263b: 53                          	pushq	%rbx
14553263c: 48 83 ec 48                 	subq	$0x48, %rsp
145532640: 48 8d 6c 24 40              	leaq	0x40(%rsp), %rbp
145532645: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
14553264d: 48 89 ce                    	movq	%rcx, %rsi
145532650: 4c 8b 32                    	movq	(%rdx), %r14
145532653: 4c 8b 7a 08                 	movq	0x8(%rdx), %r15
145532657: 4d 39 fe                    	cmpq	%r15, %r14
14553265a: 74 69                       	je	0x1455326c5 <.text+0x55316c5>
14553265c: 4c 8b 62 10                 	movq	0x10(%rdx), %r12
145532660: 49 8b 4c 24 10              	movq	0x10(%r12), %rcx
145532665: 48 85 c9                    	testq	%rcx, %rcx
145532668: 74 5b                       	je	0x1455326c5 <.text+0x55316c5>
14553266a: 49 8b 44 24 08              	movq	0x8(%r12), %rax
14553266f: 48 69 c9 60 01 00 00        	imulq	$0x160, %rcx, %rcx      # imm = 0x160
145532676: 49 8b 3e                    	movq	(%r14), %rdi
145532679: 49 83 c6 08                 	addq	$0x8, %r14
14553267d: 45 31 c0                    	xorl	%r8d, %r8d
145532680: eb 1a                       	jmp	0x14553269c <.text+0x553169c>
145532682: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
145532690: 49 81 c0 60 01 00 00        	addq	$0x160, %r8             # imm = 0x160
145532697: 4c 39 c1                    	cmpq	%r8, %rcx
14553269a: 74 24                       	je	0x1455326c0 <.text+0x55316c0>
14553269c: 4a 39 bc 00 88 00 00 00     	cmpq	%rdi, 0x88(%rax,%r8)
1455326a4: 75 ea                       	jne	0x145532690 <.text+0x5531690>
1455326a6: 4a 83 7c 00 18 ff           	cmpq	$-0x1, 0x18(%rax,%r8)
1455326ac: 75 33                       	jne	0x1455326e1 <.text+0x55316e1>
1455326ae: 42 80 bc 00 58 01 00 00 00  	cmpb	$0x0, 0x158(%rax,%r8)
1455326b7: 74 d7                       	je	0x145532690 <.text+0x5531690>
1455326b9: eb 26                       	jmp	0x1455326e1 <.text+0x55316e1>
1455326bb: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1455326c0: 4d 39 fe                    	cmpq	%r15, %r14
1455326c3: 75 b1                       	jne	0x145532676 <.text+0x5531676>
1455326c5: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
1455326cc: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
1455326d4: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
1455326dc: e9 1a 01 00 00              	jmp	0x1455327fb <.text+0x55317fb>
1455326e1: 4c 89 32                    	movq	%r14, (%rdx)
1455326e4: e8 17 fb ac fa              	callq	0x140002200 <.text+0x1200>
1455326e9: b9 20 00 00 00              	movl	$0x20, %ecx
1455326ee: ba 08 00 00 00              	movl	$0x8, %edx
1455326f3: e8 c8 fa ac fa              	callq	0x1400021c0 <.text+0x11c0>
1455326f8: 48 85 c0                    	testq	%rax, %rax
1455326fb: 0f 84 0e 01 00 00           	je	0x14553280f <.text+0x553180f>
145532701: 48 89 38                    	movq	%rdi, (%rax)
145532704: 48 c7 45 e8 04 00 00 00     	movq	$0x4, -0x18(%rbp)
14553270c: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145532710: 48 c7 45 f8 01 00 00 00     	movq	$0x1, -0x8(%rbp)
145532718: 4d 39 fe                    	cmpq	%r15, %r14
14553271b: 0f 84 c3 00 00 00           	je	0x1455327e4 <.text+0x55317e4>
145532721: bf 01 00 00 00              	movl	$0x1, %edi
145532726: 48 8d 5d e8                 	leaq	-0x18(%rbp), %rbx
14553272a: eb 18                       	jmp	0x145532744 <.text+0x5531744>
14553272c: 0f 1f 40 00                 	nopl	(%rax)
145532730: 4c 89 2c f8                 	movq	%r13, (%rax,%rdi,8)
145532734: 48 ff c7                    	incq	%rdi
145532737: 48 89 7d f8                 	movq	%rdi, -0x8(%rbp)
14553273b: 4d 39 fe                    	cmpq	%r15, %r14
14553273e: 0f 84 a0 00 00 00           	je	0x1455327e4 <.text+0x55317e4>
145532744: 49 8b 54 24 10              	movq	0x10(%r12), %rdx
145532749: 48 85 d2                    	testq	%rdx, %rdx
14553274c: 0f 84 92 00 00 00           	je	0x1455327e4 <.text+0x55317e4>
145532752: 49 8b 4c 24 08              	movq	0x8(%r12), %rcx
145532757: 48 69 d2 60 01 00 00        	imulq	$0x160, %rdx, %rdx      # imm = 0x160
14553275e: 4d 8b 2e                    	movq	(%r14), %r13
145532761: 49 83 c6 08                 	addq	$0x8, %r14
145532765: 45 31 c0                    	xorl	%r8d, %r8d
145532768: eb 12                       	jmp	0x14553277c <.text+0x553177c>
14553276a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
145532770: 49 81 c0 60 01 00 00        	addq	$0x160, %r8             # imm = 0x160
145532777: 4c 39 c2                    	cmpq	%r8, %rdx
14553277a: 74 24                       	je	0x1455327a0 <.text+0x55317a0>
14553277c: 4e 39 ac 01 88 00 00 00     	cmpq	%r13, 0x88(%rcx,%r8)
145532784: 75 ea                       	jne	0x145532770 <.text+0x5531770>
145532786: 4a 83 7c 01 18 ff           	cmpq	$-0x1, 0x18(%rcx,%r8)
14553278c: 75 22                       	jne	0x1455327b0 <.text+0x55317b0>
14553278e: 42 80 bc 01 58 01 00 00 00  	cmpb	$0x0, 0x158(%rcx,%r8)
145532797: 74 d7                       	je	0x145532770 <.text+0x5531770>
145532799: eb 15                       	jmp	0x1455327b0 <.text+0x55317b0>
14553279b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
1455327a0: 4d 39 fe                    	cmpq	%r15, %r14
1455327a3: 75 b9                       	jne	0x14553275e <.text+0x553175e>
1455327a5: eb 3d                       	jmp	0x1455327e4 <.text+0x55317e4>
1455327a7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1455327b0: 48 3b 7d e8                 	cmpq	-0x18(%rbp), %rdi
1455327b4: 0f 85 76 ff ff ff           	jne	0x145532730 <.text+0x5531730>
1455327ba: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
1455327c3: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1455327c9: 41 b9 08 00 00 00           	movl	$0x8, %r9d
1455327cf: 48 89 d9                    	movq	%rbx, %rcx
1455327d2: 48 89 fa                    	movq	%rdi, %rdx
1455327d5: e8 66 55 22 00              	callq	0x145757d40 <.text+0x5756d40>
1455327da: 90                          	nop
1455327db: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1455327df: e9 4c ff ff ff              	jmp	0x145532730 <.text+0x5531730>
1455327e4: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
1455327e8: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1455327ec: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1455327f0: 48 89 06                    	movq	%rax, (%rsi)
1455327f3: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1455327f7: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
1455327fb: 48 89 f0                    	movq	%rsi, %rax
1455327fe: 48 83 c4 48                 	addq	$0x48, %rsp
145532802: 5b                          	popq	%rbx
145532803: 5f                          	popq	%rdi
145532804: 5e                          	popq	%rsi
145532805: 41 5c                       	popq	%r12
145532807: 41 5d                       	popq	%r13
145532809: 41 5e                       	popq	%r14
14553280b: 41 5f                       	popq	%r15
14553280d: 5d                          	popq	%rbp
14553280e: c3                          	retq
14553280f: b9 08 00 00 00              	movl	$0x8, %ecx
145532814: ba 20 00 00 00              	movl	$0x20, %edx
145532819: e8 fd 49 3b 00              	callq	0x1458e721b <.text+0x58e621b>
14553281e: 0f 0b                       	ud2
