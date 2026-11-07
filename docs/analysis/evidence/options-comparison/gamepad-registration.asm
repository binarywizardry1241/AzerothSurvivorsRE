Disassembly of section .text:

0000000140001000 <.text>:
1400c2540:     	pushq	%rbp
1400c2541:     	pushq	%r14
1400c2543:     	pushq	%rsi
1400c2544:     	pushq	%rdi
1400c2545:     	pushq	%rbx
1400c2546:     	subq	$0x80, %rsp
1400c254d:     	leaq	0x80(%rsp), %rbp
1400c2555:     	movaps	%xmm7, -0x10(%rbp)
1400c2559:     	movaps	%xmm6, -0x20(%rbp)
1400c255d:     	movq	$-0x2, -0x28(%rbp)
1400c2565:     	movq	%rdx, %rsi
1400c2568:     	movzbl	(%r8), %eax
1400c256c:     	movb	$0x1, (%r8)
1400c2570:     	cmpb	$0x1, %al
1400c2572:     	je	0x1400c262f <.text+0xc162f>
1400c2578:     	movq	$0x1, 0x20(%rsp)
1400c2581:     	leaq	0x5cd9c60(%rip), %rdx   # 0x145d9c1e8
1400c2588:     	leaq	0x5cd9c63(%rip), %rdi   # 0x145d9c1f2
1400c258f:     	movl	$0xa, %r8d
1400c2595:     	movq	%rsi, %rcx
1400c2598:     	movq	%rdi, %r9
1400c259b:     	callq	0x14063a3d0 <.text+0x6393d0>
1400c25a0:     	movq	$0x1, 0x20(%rsp)
1400c25a9:     	leaq	0x5cd9c43(%rip), %rdx   # 0x145d9c1f3
1400c25b0:     	movl	$0xa, %r8d
1400c25b6:     	movq	%rsi, %rcx
1400c25b9:     	movq	%rdi, %r9
1400c25bc:     	callq	0x14063a3d0 <.text+0x6393d0>
1400c25c1:     	movq	$0x1, 0x20(%rsp)
1400c25ca:     	leaq	0x5cd9c2c(%rip), %rdx   # 0x145d9c1fd
1400c25d1:     	leaq	0x5cd9c31(%rip), %rdi   # 0x145d9c209
1400c25d8:     	movl	$0xc, %r8d
1400c25de:     	movq	%rsi, %rcx
1400c25e1:     	movq	%rdi, %r9
1400c25e4:     	callq	0x14063a3d0 <.text+0x6393d0>
1400c25e9:     	movq	$0x1, 0x20(%rsp)
1400c25f2:     	leaq	0x5cd9c11(%rip), %rdx   # 0x145d9c20a
1400c25f9:     	movl	$0xc, %r8d
1400c25ff:     	movq	%rsi, %rcx
1400c2602:     	movq	%rdi, %r9
1400c2605:     	callq	0x14063a3d0 <.text+0x6393d0>
1400c260a:     	movq	$0x4, 0x20(%rsp)
1400c2613:     	leaq	0x5cd9bfc(%rip), %rdx   # 0x145d9c216
1400c261a:     	leaq	0x5cd9c00(%rip), %r9    # 0x145d9c221
1400c2621:     	movl	$0xb, %r8d
1400c2627:     	movq	%rsi, %rcx
1400c262a:     	callq	0x14063a3d0 <.text+0x6393d0>
