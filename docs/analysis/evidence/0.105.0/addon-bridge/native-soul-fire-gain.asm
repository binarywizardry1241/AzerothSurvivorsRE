
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459484c0: 56                          	pushq	%rsi
1459484c1: 57                          	pushq	%rdi
1459484c2: 48 83 ec 58                 	subq	$0x58, %rsp
1459484c6: 44 0f 29 44 24 40           	movaps	%xmm8, 0x40(%rsp)
1459484cc: 0f 29 7c 24 30              	movaps	%xmm7, 0x30(%rsp)
1459484d1: 0f 29 74 24 20              	movaps	%xmm6, 0x20(%rsp)
1459484d6: 48 8b 81 20 03 00 00        	movq	0x320(%rcx), %rax
1459484dd: 48 85 c0                    	testq	%rax, %rax
1459484e0: 0f 84 08 01 00 00           	je	0x1459485ee <.text+0x59475ee>
1459484e6: 48 8b 91 18 03 00 00        	movq	0x318(%rcx), %rdx
1459484ed: 4c 6b c8 68                 	imulq	$0x68, %rax, %r9
1459484f1: 45 31 c0                    	xorl	%r8d, %r8d
1459484f4: 49 bb 73 6f 75 6c 5f 66 69 72       	movabsq	$0x7269665f6c756f73, %r11 # imm = 0x7269665F6C756F73
1459484fe: eb 0d                       	jmp	0x14594850d <.text+0x594750d>
145948500: 49 83 c0 68                 	addq	$0x68, %r8
145948504: 4d 39 c1                    	cmpq	%r8, %r9
145948507: 0f 84 e1 00 00 00           	je	0x1459485ee <.text+0x59475ee>
14594850d: 4e 8b 14 02                 	movq	(%rdx,%r8), %r10
145948511: 49 83 7a 08 09              	cmpq	$0x9, 0x8(%r10)
145948516: 75 e8                       	jne	0x145948500 <.text+0x5947500>
145948518: 49 8b 02                    	movq	(%r10), %rax
14594851b: 48 8b 30                    	movq	(%rax), %rsi
14594851e: 4c 31 de                    	xorq	%r11, %rsi
145948521: 0f b6 78 08                 	movzbl	0x8(%rax), %edi
145948525: 48 83 f7 65                 	xorq	$0x65, %rdi
145948529: 48 09 f7                    	orq	%rsi, %rdi
14594852c: 75 d2                       	jne	0x145948500 <.text+0x5947500>
14594852e: 8b b9 a0 08 00 00           	movl	0x8a0(%rcx), %edi
145948534: 83 ff 04                    	cmpl	$0x4, %edi
145948537: 0f 87 b1 00 00 00           	ja	0x1459485ee <.text+0x59475ee>
14594853d: f3 0f 10 b1 ec 09 00 00     	movss	0x9ec(%rcx), %xmm6
145948545: f3 0f 10 81 a4 08 00 00     	movss	0x8a4(%rcx), %xmm0
14594854d: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
145948550: 0f 87 98 00 00 00           	ja	0x1459485ee <.text+0x59475ee>
145948556: f3 42 0f 10 7c 02 5c        	movss	0x5c(%rdx,%r8), %xmm7
14594855d: f3 45 0f 10 42 48           	movss	0x48(%r10), %xmm8
145948563: f3 44 0f 59 05 d4 b7 42 00  	mulss	0x42b7d4(%rip), %xmm8   # 0x145d73d40
14594856c: f3 46 0f 59 44 02 2c        	mulss	0x2c(%rdx,%r8), %xmm8
145948573: f3 46 0f 59 44 02 48        	mulss	0x48(%rdx,%r8), %xmm8
14594857a: f3 44 0f 59 81 80 04 00 00  	mulss	0x480(%rcx), %xmm8
145948583: f3 46 0f 59 44 02 64        	mulss	0x64(%rdx,%r8), %xmm8
14594858a: f3 44 0f 5f 05 b1 b7 42 00  	maxss	0x42b7b1(%rip), %xmm8   # 0x145d73d44
145948593: ba 09 00 00 00              	movl	$0x9, %edx
145948598: 48 89 ce                    	movq	%rcx, %rsi
14594859b: 48 89 c1                    	movq	%rax, %rcx
14594859e: e8 bd a6 f3 ff              	callq	0x145882c60 <.text+0x5881c60>
1459485a3: f3 41 0f 5f c0              	maxss	%xmm8, %xmm0
1459485a8: f3 0f 5f 3d 84 86 42 00     	maxss	0x428684(%rip), %xmm7   # 0x145d70c34
1459485b0: f3 0f 5e c7                 	divss	%xmm7, %xmm0
1459485b4: ff c7                       	incl	%edi
1459485b6: f3 0f 5e 05 52 b8 42 00     	divss	0x42b852(%rip), %xmm0   # 0x145d73e10
1459485be: 89 be a0 08 00 00           	movl	%edi, 0x8a0(%rsi)
1459485c4: f3 0f 58 f0                 	addss	%xmm0, %xmm6
1459485c8: f3 0f 11 b6 a4 08 00 00     	movss	%xmm6, 0x8a4(%rsi)
1459485d0: 48 89 f1                    	movq	%rsi, %rcx
1459485d3: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
1459485d8: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
1459485dd: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
1459485e3: 48 83 c4 58                 	addq	$0x58, %rsp
1459485e7: 5f                          	popq	%rdi
1459485e8: 5e                          	popq	%rsi
1459485e9: e9 92 f1 ff ff              	jmp	0x145947780 <.text+0x5946780>
1459485ee: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
1459485f3: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
1459485f8: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
1459485fe: 48 83 c4 58                 	addq	$0x58, %rsp
145948602: 5f                          	popq	%rdi
145948603: 5e                          	popq	%rsi
145948604: c3                          	retq
