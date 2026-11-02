

Disassembly of section .text:

0000000140001000 <.text>:
14590f994: 41 80 bd 64 0a 00 00 00     	cmpb	$0x0, 0xa64(%r13)
14590f99c: 0f 84 bd 00 00 00           	je	0x14590fa5f <.text+0x590ea5f>
14590f9a2: 41 0f 2e 85 3c 0a 00 00     	ucomiss	0xa3c(%r13), %xmm0
14590f9aa: 0f 82 af 00 00 00           	jb	0x14590fa5f <.text+0x590ea5f>
14590f9b0: 4d 8b 8d 58 09 00 00        	movq	0x958(%r13), %r9
14590f9b7: 49 8b 8d 60 09 00 00        	movq	0x960(%r13), %rcx
14590f9be: 4d 8b 95 70 09 00 00        	movq	0x970(%r13), %r10
14590f9c5: 4d 8b 85 68 09 00 00        	movq	0x968(%r13), %r8
14590f9cc: 41 bb 05 00 00 00           	movl	$0x5, %r11d
14590f9d2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
14590f9e0: 4b 8d 04 11                 	leaq	(%r9,%r10), %rax
14590f9e4: 48 c1 c0 17                 	rolq	$0x17, %rax
14590f9e8: 4c 01 c8                    	addq	%r9, %rax
14590f9eb: 48 89 ca                    	movq	%rcx, %rdx
14590f9ee: 48 c1 e2 11                 	shlq	$0x11, %rdx
14590f9f2: 4d 31 c8                    	xorq	%r9, %r8
14590f9f5: 49 31 ca                    	xorq	%rcx, %r10
14590f9f8: 4c 31 c1                    	xorq	%r8, %rcx
14590f9fb: 4d 31 d1                    	xorq	%r10, %r9
14590f9fe: 49 c1 c2 2d                 	rolq	$0x2d, %r10
14590fa02: 49 31 d0                    	xorq	%rdx, %r8
14590fa05: 49 f7 e3                    	mulq	%r11
14590fa08: 48 c1 e8 3d                 	shrq	$0x3d, %rax
14590fa0c: 83 f8 04                    	cmpl	$0x4, %eax
14590fa0f: 77 cf                       	ja	0x14590f9e0 <.text+0x590e9e0>
14590fa11: 4d 89 8d 58 09 00 00        	movq	%r9, 0x958(%r13)
14590fa18: 4d 89 95 70 09 00 00        	movq	%r10, 0x970(%r13)
14590fa1f: 49 89 8d 60 09 00 00        	movq	%rcx, 0x960(%r13)
14590fa26: 4d 89 85 68 09 00 00        	movq	%r8, 0x968(%r13)
14590fa2d: 48 6b d2 58                 	imulq	$0x58, %rdx, %rdx
14590fa31: 48 03 97 88 00 00 00        	addq	0x88(%rdi), %rdx
14590fa38: 4c 89 e9                    	movq	%r13, %rcx
14590fa3b: e8 50 05 02 00              	callq	0x14592ff90 <.text+0x592ef90>
14590fa40: 90                          	nop
14590fa41: f3 41 0f 10 85 ec 09 00 00  	movss	0x9ec(%r13), %xmm0
14590fa4a: f3 0f 10 0d ce 76 2a 01     	movss	0x12a76ce(%rip), %xmm1  # 0x146bb7120
14590fa52: f3 0f 58 c8                 	addss	%xmm0, %xmm1
14590fa56: f3 41 0f 11 8d 3c 0a 00 00  	movss	%xmm1, 0xa3c(%r13)
