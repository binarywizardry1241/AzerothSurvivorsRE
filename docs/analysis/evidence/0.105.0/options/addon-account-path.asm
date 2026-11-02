Disassembly of section .text:

0000000140001000 <.text>:
1411cf3a0:     	pushq	%rbp
1411cf3a1:     	pushq	%rsi
1411cf3a2:     	subq	$0xa8, %rsp
1411cf3a9:     	leaq	0x80(%rsp), %rbp
1411cf3b1:     	movq	$-0x2, 0x20(%rbp)
1411cf3b9:     	movq	%rcx, %rsi
1411cf3bc:     	leaq	-0x38(%rbp), %rcx
1411cf3c0:     	callq	0x141188c00 <.text+0x1187c00>
1411cf3c5:     	movq	-0x38(%rbp), %rax
1411cf3c9:     	cmpq	$-0x1, %rax
1411cf3cd:     	je	0x1411cf46c <.text+0x11ce46c>
1411cf3d3:     	movq	%rax, 0x18(%rbp)
1411cf3d7:     	movq	-0x30(%rbp), %rdx
1411cf3db:     	movq	-0x28(%rbp), %r8
1411cf3df:     	movq	$0x6, 0x20(%rsp)
1411cf3e8:     	leaq	0x4e0523b(%rip), %r9    # 0x145fd462a
1411cf3ef:     	leaq	-0x18(%rbp), %rcx
1411cf3f3:     	movq	%rdx, 0x8(%rbp)
1411cf3f7:     	callq	0x145b763e0 <.text+0x5b753e0>
1411cf3fc:     	nop
1411cf3fd:     	movq	-0x10(%rbp), %rdx
1411cf401:     	movq	-0x8(%rbp), %r8
1411cf405:     	movq	$0xb, 0x20(%rsp)
1411cf40e:     	leaq	0x4e0521b(%rip), %r9    # 0x145fd4630
1411cf415:     	leaq	-0x58(%rbp), %rcx
1411cf419:     	movq	%rdx, 0x10(%rbp)
1411cf41d:     	callq	0x145b763e0 <.text+0x5b753e0>
1411cf422:     	nop
1411cf423:     	movq	-0x18(%rbp), %rdx
1411cf427:     	testq	%rdx, %rdx
1411cf42a:     	je	0x1411cf43b <.text+0x11ce43b>
1411cf42c:     	movl	$0x1, %r8d
1411cf432:     	movq	0x10(%rbp), %rcx
1411cf436:     	callq	0x1400021d0 <.text+0x11d0>
1411cf43b:     	movq	0x18(%rbp), %rdx
1411cf43f:     	testq	%rdx, %rdx
1411cf442:     	je	0x1411cf453 <.text+0x11ce453>
1411cf444:     	movl	$0x1, %r8d
1411cf44a:     	movq	0x8(%rbp), %rcx
1411cf44e:     	callq	0x1400021d0 <.text+0x11d0>
1411cf453:     	movups	-0x58(%rbp), %xmm0
1411cf457:     	movups	-0x48(%rbp), %xmm1
1411cf45b:     	movups	%xmm1, 0x10(%rsi)
1411cf45f:     	movups	%xmm0, (%rsi)
1411cf462:     	addq	$0xa8, %rsp
1411cf469:     	popq	%rsi
1411cf46a:     	popq	%rbp
1411cf46b:     	retq
1411cf46c:     	movq	$-0x1, (%rsi)
1411cf473:     	addq	$0xa8, %rsp
1411cf47a:     	popq	%rsi
1411cf47b:     	popq	%rbp
1411cf47c:     	retq
