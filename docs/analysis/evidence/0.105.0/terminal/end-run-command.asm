

Disassembly of section .text:

0000000140001000 <.text>:
14591d4c0: 55                          	pushq	%rbp
14591d4c1: 41 56                       	pushq	%r14
14591d4c3: 56                          	pushq	%rsi
14591d4c4: 57                          	pushq	%rdi
14591d4c5: 53                          	pushq	%rbx
14591d4c6: 48 83 ec 50                 	subq	$0x50, %rsp
14591d4ca: 48 8d 6c 24 50              	leaq	0x50(%rsp), %rbp
14591d4cf: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
14591d4d7: 0f b6 99 73 0a 00 00        	movzbl	0xa73(%rcx), %ebx
14591d4de: fe cb                       	decb	%bl
14591d4e0: 80 fb 02                    	cmpb	$0x2, %bl
14591d4e3: 0f 87 de 00 00 00           	ja	0x14591d5c7 <.text+0x591c5c7>
14591d4e9: 48 89 ce                    	movq	%rcx, %rsi
14591d4ec: 48 8b b9 08 06 00 00        	movq	0x608(%rcx), %rdi
14591d4f3: 4c 8b b1 10 06 00 00        	movq	0x610(%rcx), %r14
14591d4fa: 48 c7 81 10 06 00 00 00 00 00 00    	movq	$0x0, 0x610(%rcx)
14591d505: 4d 85 f6                    	testq	%r14, %r14
14591d508: 74 1a                       	je	0x14591d524 <.text+0x591c524>
14591d50a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
14591d510: 48 89 f9                    	movq	%rdi, %rcx
14591d513: e8 d8 be fc ff              	callq	0x1458e93f0 <.text+0x58e83f0>
14591d518: 48 81 c7 a0 00 00 00        	addq	$0xa0, %rdi
14591d51f: 49 ff ce                    	decq	%r14
14591d522: 75 ec                       	jne	0x14591d510 <.text+0x591c510>
14591d524: c6 86 71 0a 00 00 ff        	movb	$-0x1, 0xa71(%rsi)
14591d52b: c6 86 63 0a 00 00 01        	movb	$0x1, 0xa63(%rsi)
14591d532: c6 86 73 0a 00 00 04        	movb	$0x4, 0xa73(%rsi)
14591d539: f3 0f 10 86 ec 09 00 00     	movss	0x9ec(%rsi), %xmm0
14591d541: c7 86 30 09 00 00 01 00 00 00       	movl	$0x1, 0x930(%rsi)
14591d54b: f3 0f 11 86 34 09 00 00     	movss	%xmm0, 0x934(%rsi)
14591d553: 48 89 f1                    	movq	%rsi, %rcx
14591d556: e8 15 9c fd ff              	callq	0x1458f7170 <.text+0x58f6170>
14591d55b: 4c 8d 05 3f b3 55 01        	leaq	0x155b33f(%rip), %r8    # 0x146e788a1
14591d562: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14591d566: 41 b9 06 00 00 00           	movl	$0x6, %r9d
14591d56c: 48 89 f2                    	movq	%rsi, %rdx
14591d56f: e8 4c 0b 00 00              	callq	0x14591e0c0 <.text+0x591d0c0>
14591d574: 48 8b be f8 05 00 00        	movq	0x5f8(%rsi), %rdi
14591d57b: 48 3b be e8 05 00 00        	cmpq	0x5e8(%rsi), %rdi
14591d582: 75 1d                       	jne	0x14591d5a1 <.text+0x591c5a1>
14591d584: 48 8d 8e e8 05 00 00        	leaq	0x5e8(%rsi), %rcx
14591d58b: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14591d58f: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
14591d593: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
14591d597: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14591d59b: e8 40 de 2a 00              	callq	0x145bcb3e0 <.text+0x5bca3e0>
14591d5a0: 90                          	nop
14591d5a1: 48 8b 86 f0 05 00 00        	movq	0x5f0(%rsi), %rax
14591d5a8: 48 8d 0c 7f                 	leaq	(%rdi,%rdi,2), %rcx
14591d5ac: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
14591d5b0: 48 89 54 c8 10              	movq	%rdx, 0x10(%rax,%rcx,8)
14591d5b5: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
14591d5b9: 0f 11 04 c8                 	movups	%xmm0, (%rax,%rcx,8)
14591d5bd: 48 ff c7                    	incq	%rdi
14591d5c0: 48 89 be f8 05 00 00        	movq	%rdi, 0x5f8(%rsi)
14591d5c7: 80 fb 03                    	cmpb	$0x3, %bl
14591d5ca: 0f 92 c0                    	setb	%al
14591d5cd: 48 83 c4 50                 	addq	$0x50, %rsp
14591d5d1: 5b                          	popq	%rbx
14591d5d2: 5f                          	popq	%rdi
14591d5d3: 5e                          	popq	%rsi
14591d5d4: 41 5e                       	popq	%r14
14591d5d6: 5d                          	popq	%rbp
14591d5d7: c3                          	retq
