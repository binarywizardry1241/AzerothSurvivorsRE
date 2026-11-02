
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c622b:     	mulss	%xmm7, %xmm8
1454c6230:     	movq	0x40(%rbp), %r8
1454c6234:     	movl	0xb0(%rbp), %r15d
1454c623b:     	cmpq	0xe8(%rbp), %r8
1454c6242:     	je	0x1454c639d <.text+0x54c539d>
1454c6248:     	movq	(%r8), %r13
1454c624b:     	addq	$0x8, %r8
1454c624f:     	movq	0x4c8(%rsi), %rcx
1454c6256:     	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454c6261:     	testq	%rax, %rax
1454c6264:     	je	0x1454c623b <.text+0x54c523b>
1454c6266:     	movq	%rcx, %rdx
1454c6269:     	addq	$0x160, %rcx            # imm = 0x160
1454c6270:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454c6276:     	cmpq	%r13, 0x88(%rdx)
1454c627d:     	jne	0x1454c6261 <.text+0x54c5261>
1454c627f:     	testb	$0x1, 0x68(%rdx)
1454c6283:     	jne	0x1454c6261 <.text+0x54c5261>
1454c6285:     	movq	%r8, 0x70(%rbp)
1454c6289:     	movq	%r13, 0x158(%rbp)
1454c6290:     	movq	%r13, 0x90(%rbp)
1454c6297:     	movl	$0x0, 0x88(%rbp)
1454c62a1:     	movl	$0x0, 0x48(%rbp)
1454c62a8:     	leaq	0x48(%rbp), %rax
1454c62ac:     	movq	%rax, 0x30(%rsp)
1454c62b1:     	leaq	0x88(%rbp), %rax
1454c62b8:     	movq	%rax, 0x28(%rsp)
1454c62bd:     	movq	$0x1, 0x20(%rsp)
1454c62c6:     	leaq	0xb8(%rbp), %rcx
1454c62cd:     	movq	%rdi, %rdx
1454c62d0:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454c62d6:     	leaq	0x158(%rbp), %r9
1454c62dd:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c62e2:     	nop
1454c62e3:     	movq	0x548(%rsi), %r15
1454c62ea:     	cmpq	0x538(%rsi), %r15
1454c62f1:     	jne	0x1454c6300 <.text+0x54c5300>
1454c62f3:     	leaq	0x538(%rsi), %rcx
1454c62fa:     	callq	0x1457580b0 <.text+0x57570b0>
1454c62ff:     	nop
1454c6300:     	movq	0x540(%rsi), %rax
1454c6307:     	movq	%r15, %rcx
1454c630a:     	shlq	$0x5, %rcx
1454c630e:     	movups	0xb8(%rbp), %xmm0
1454c6315:     	movups	0xc8(%rbp), %xmm1
1454c631c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c6321:     	movups	%xmm0, (%rax,%rcx)
1454c6325:     	incq	%r15
1454c6328:     	movq	%r15, 0x548(%rsi)
1454c632f:     	movl	0x40(%r14), %r9d
1454c6333:     	movzbl	0x74(%r14), %eax
1454c6338:     	movb	0x111(%rsi), %r15b
1454c633f:     	movb	$0x3, 0x111(%rsi)
1454c6346:     	movups	0x20(%rsi), %xmm7
1454c634a:     	movups	0x40(%rsi), %xmm12
1454c634f:     	movq	$0x0, 0x20(%rsi)
1454c6357:     	movq	$0x0, 0x40(%rsi)
1454c635f:     	movb	%al, 0x20(%rsp)
1454c6363:     	movb	$0x0, 0x30(%rsp)
1454c6368:     	movb	$0x0, 0x28(%rsp)
1454c636d:     	movq	%rsi, %rcx
1454c6370:     	movq	%r13, %rdx
1454c6373:     	movaps	%xmm8, %xmm2
1454c6377:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c637c:     	nop
1454c637d:     	movb	%r15b, 0x111(%rsi)
1454c6384:     	movups	%xmm7, 0x20(%rsi)
1454c6388:     	movups	%xmm12, 0x40(%rsi)
1454c638d:     	movl	0xb0(%rbp), %r15d
1454c6394:     	movq	0x70(%rbp), %r8
1454c6398:     	jmp	0x1454c623b <.text+0x54c523b>
1454c639d:     	movq	0x78(%rbp), %rdx
1454c63a1:     	testq	%rdx, %rdx
1454c63a4:     	jne	0x1454c5971 <.text+0x54c4971>
1454c63aa:     	jmp	0x1454c5984 <.text+0x54c4984>
