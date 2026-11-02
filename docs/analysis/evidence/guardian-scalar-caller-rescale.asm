
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549de50: eb 0e                       	jmp	0x14549de60 <.text+0x549ce60>
14549de52: 48 8b 9d 60 02 00 00        	movq	0x260(%rbp), %rbx
14549de59: 0f 1f 80 00 00 00 00        	nopl	(%rax)
14549de60: 4d 39 fc                    	cmpq	%r15, %r12
14549de63: 0f 84 97 04 00 00           	je	0x14549e300 <.text+0x549d300>
14549de69: 4d 8b 2c 24                 	movq	(%r12), %r13
14549de6d: 49 83 c4 08                 	addq	$0x8, %r12
14549de71: 4c 8b b3 c0 04 00 00        	movq	0x4c0(%rbx), %r14
14549de78: 48 69 bb c8 04 00 00 58 01 00 00    	imulq	$0x158, 0x4c8(%rbx), %rdi # imm = 0x158
14549de83: 31 c0                       	xorl	%eax, %eax
14549de85: 4c 89 f1                    	movq	%r14, %rcx
14549de88: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
14549de90: 48 39 c7                    	cmpq	%rax, %rdi
14549de93: 74 cb                       	je	0x14549de60 <.text+0x549ce60>
14549de95: 48 05 58 01 00 00           	addq	$0x158, %rax            # imm = 0x158
14549de9b: 4c 39 a9 88 00 00 00        	cmpq	%r13, 0x88(%rcx)
14549dea2: 48 8d 89 58 01 00 00        	leaq	0x158(%rcx), %rcx
14549dea9: 75 e5                       	jne	0x14549de90 <.text+0x549ce90>
14549deab: 49 83 bc 06 e8 fe ff ff ff  	cmpq	$-0x1, -0x118(%r14,%rax)
14549deb4: 74 aa                       	je	0x14549de60 <.text+0x549ce60>
14549deb6: 49 8b 84 06 00 ff ff ff     	movq	-0x100(%r14,%rax), %rax
14549debe: 48 3b 83 88 05 00 00        	cmpq	0x588(%rbx), %rax
14549dec5: 73 99                       	jae	0x14549de60 <.text+0x549ce60>
14549dec7: 48 8b 93 80 05 00 00        	movq	0x580(%rbx), %rdx
14549dece: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
14549ded2: 48 89 d9                    	movq	%rbx, %rcx
14549ded5: 48 8b 5c c2 10              	movq	0x10(%rdx,%rax,8), %rbx
14549deda: 48 89 da                    	movq	%rbx, %rdx
14549dedd: e8 8e 0b 02 00              	callq	0x1454bea70 <.text+0x54bda70>
14549dee2: 90                          	nop
14549dee3: 0f 28 f0                    	movaps	%xmm0, %xmm6
14549dee6: 48 8b 8d 60 02 00 00        	movq	0x260(%rbp), %rcx
14549deed: 48 89 da                    	movq	%rbx, %rdx
14549def0: e8 6b 0f 02 00              	callq	0x1454bee60 <.text+0x54bde60>
14549def5: 90                          	nop
14549def6: 49 81 c6 a8 fe ff ff        	addq	$-0x158, %r14           # imm = 0xFEA8
14549defd: 0f 1f 00                    	nopl	(%rax)
14549df00: 48 85 ff                    	testq	%rdi, %rdi
14549df03: 0f 84 49 ff ff ff           	je	0x14549de52 <.text+0x549ce52>
14549df09: 49 8d 9e 58 01 00 00        	leaq	0x158(%r14), %rbx
14549df10: 48 81 c7 a8 fe ff ff        	addq	$-0x158, %rdi           # imm = 0xFEA8
14549df17: 4d 39 ae e0 01 00 00        	cmpq	%r13, 0x1e0(%r14)
14549df1e: 49 89 de                    	movq	%rbx, %r14
14549df21: 75 dd                       	jne	0x14549df00 <.text+0x549cf00>
14549df23: f3 0f 10 8b f4 00 00 00     	movss	0xf4(%rbx), %xmm1
14549df2b: 0f 2e f1                    	ucomiss	%xmm1, %xmm6
14549df2e: 76 2f                       	jbe	0x14549df5f <.text+0x549cf5f>
14549df30: f3 0f 10 93 f0 00 00 00     	movss	0xf0(%rbx), %xmm2
14549df38: f3 0f 5e d1                 	divss	%xmm1, %xmm2
14549df3c: 0f 57 c9                    	xorps	%xmm1, %xmm1
14549df3f: f3 0f 5f ca                 	maxss	%xmm2, %xmm1
14549df43: 41 0f 28 d5                 	movaps	%xmm13, %xmm2
14549df47: f3 0f 5d d1                 	minss	%xmm1, %xmm2
14549df4b: f3 0f 11 b3 f4 00 00 00     	movss	%xmm6, 0xf4(%rbx)
14549df53: f3 0f 59 f2                 	mulss	%xmm2, %xmm6
14549df57: f3 0f 11 b3 f0 00 00 00     	movss	%xmm6, 0xf0(%rbx)
14549df5f: f3 0f 10 8b f8 00 00 00     	movss	0xf8(%rbx), %xmm1
14549df67: 0f 28 d1                    	movaps	%xmm1, %xmm2
14549df6a: f3 0f 5f d0                 	maxss	%xmm0, %xmm2
14549df6e: 0f 28 c2                    	movaps	%xmm2, %xmm0
14549df71: f3 0f c2 c2 03              	cmpunordss	%xmm2, %xmm0
14549df76: 0f 28 d8                    	movaps	%xmm0, %xmm3
14549df79: 0f 55 da                    	andnps	%xmm2, %xmm3
14549df7c: 0f 54 c1                    	andps	%xmm1, %xmm0
14549df7f: 0f 56 c3                    	orps	%xmm3, %xmm0
14549df82: f3 0f 11 83 f8 00 00 00     	movss	%xmm0, 0xf8(%rbx)
14549df8a: 48 89 d9                    	movq	%rbx, %rcx
14549df8d: e8 ce bc f9 ff              	callq	0x145439c60 <.text+0x5438c60>
14549df92: 48 89 85 38 02 00 00        	movq	%rax, 0x238(%rbp)
14549df99: 48 89 d7                    	movq	%rdx, %rdi
14549df9c: f3 0f 10 b3 f0 00 00 00     	movss	0xf0(%rbx), %xmm6
14549dfa4: f3 0f 10 83 f4 00 00 00     	movss	0xf4(%rbx), %xmm0
14549dfac: e8 88 d2 26 00              	callq	0x14570b239 <.text+0x570a239>
14549dfb1: f3 4c 0f 2c c0              	cvttss2si	%xmm0, %r8
14549dfb6: 0f 2e c7                    	ucomiss	%xmm7, %xmm0
14549dfb9: 44 0f 42 c6                 	cmovbl	%esi, %r8d
14549dfbd: 41 0f 2e c1                 	ucomiss	%xmm9, %xmm0
14549dfc1: 41 be ff ff ff ff           	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
14549dfc7: 45 0f 47 c6                 	cmoval	%r14d, %r8d
14549dfcb: 48 c7 85 18 01 00 00 00 00 00 00    	movq	$0x0, 0x118(%rbp)
14549dfd6: 48 c7 85 28 01 00 00 00 00 00 00    	movq	$0x0, 0x128(%rbp)
14549dfe1: 48 8d 85 18 01 00 00        	leaq	0x118(%rbp), %rax
14549dfe8: 48 89 85 70 01 00 00        	movq	%rax, 0x170(%rbp)
14549dfef: 48 8d 85 78 01 00 00        	leaq	0x178(%rbp), %rax
