
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592051c:     	movss	0x58(%rsi), %xmm8
145920522:     	mulss	0x453815(%rip), %xmm8   # 0x145d73d40
14592052b:     	mulss	0x38(%r12), %xmm8
145920532:     	movss	0x54(%r12), %xmm6
145920539:     	mulss	%xmm6, %xmm8
14592053e:     	maxss	0x4506ed(%rip), %xmm8   # 0x145d70c34
145920547:     	movss	0x9ec(%rdi), %xmm7
14592054f:     	movl	0x68(%rsi), %eax
145920552:     	cmpl	$0xb, %eax
145920555:     	ja	0x145922b53 <.text+0x5921b53>
14592055b:     	movl	$0xf0e, %ecx            # imm = 0xF0E
145920560:     	btl	%eax, %ecx
145920563:     	jae	0x145922aa9 <.text+0x5921aa9>
145920569:     	movl	0x8(%r14), %eax
14592056d:     	movl	%eax, 0x150(%rbp)
145920573:     	movq	(%r14), %rax
145920576:     	movq	%rax, 0x148(%rbp)
14592057d:     	movq	$0x0, 0x28(%rsp)
145920586:     	movq	$0x8, 0x20(%rsp)
14592058f:     	leaq	0x80(%rbp), %rcx
145920596:     	leaq	0x148(%rbp), %r14
14592059d:     	movss	0x45068b(%rip), %xmm3   # 0x145d70c30
1459205a5:     	movq	%rdi, %rdx
1459205a8:     	movq	%r14, %r8
1459205ab:     	callq	0x145925c80 <.text+0x5924c80>
1459205b0:     	movq	0x80(%rbp), %rdx
1459205b7:     	movq	0x90(%rbp), %rsi
1459205be:     	testq	%rdx, %rdx
1459205c1:     	je	0x1459205d9 <.text+0x591f5d9>
1459205c3:     	movq	0x88(%rbp), %rcx
1459205ca:     	shlq	$0x3, %rdx
1459205ce:     	movl	$0x8, %r8d
1459205d4:     	callq	0x1400021d0 <.text+0x11d0>
1459205d9:     	testq	%rsi, %rsi
1459205dc:     	je	0x145921267 <.text+0x5920267>
1459205e2:     	movq	0x130(%rbp), %r8
1459205e9:     	cmpl	$0xa, 0x68(%r8)
1459205ee:     	jne	0x14592061b <.text+0x591f61b>
1459205f0:     	movq	0xd0(%rdi), %rax
1459205f7:     	imulq	$0x78, 0xd8(%rdi), %rcx
1459205ff:     	nop
145920600:     	testq	%rcx, %rcx
145920603:     	je	0x145921267 <.text+0x5920267>
145920609:     	movq	0x18(%rax), %rdx
14592060d:     	addq	$0x78, %rax
145920611:     	addq	$-0x78, %rcx
145920615:     	cmpb	$0x0, 0x39(%rdx)
145920619:     	je	0x145920600 <.text+0x591f600>
