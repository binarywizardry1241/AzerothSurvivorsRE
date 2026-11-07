
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14597028f:     	movss	0x6c(%rdi), %xmm10
145970295:     	movss	0x70(%rdi), %xmm8
14597029b:     	movq	0x1b8(%rbp), %rax
1459702a2:     	movss	0x3c(%rax), %xmm11
1459702a8:     	movss	0x60(%rax), %xmm9
1459702ae:     	addss	0x40(%rax), %xmm8
1459702b4:     	leaq	0x18439b8(%rip), %r15   # 0x1471b3c73
1459702bb:     	movl	$0x86, %esi
1459702c0:     	movl	$0x86, %edx
1459702c5:     	movq	%r15, %rcx
1459702c8:     	callq	0x1458da590 <.text+0x58d9590>
1459702cd:     	nop
1459702ce:     	movq	%rdx, %r13
1459702d1:     	testq	%rax, %rax
1459702d4:     	addss	%xmm11, %xmm10
1459702d9:     	cmovneq	%rax, %r15
1459702dd:     	cmoveq	%rsi, %r13
1459702e1:     	mulss	%xmm7, %xmm10
1459702e6:     	movss	0x40(%r12), %xmm11
1459702ed:     	addss	0x3fd076(%rip), %xmm11  # 0x145d6d36c
1459702f6:     	mulss	%xmm10, %xmm9
1459702fb:     	mulss	%xmm11, %xmm9
145970300:     	mulss	0x3fd197(%rip), %xmm9   # 0x145d6d4a0
145970309:     	movss	%xmm9, 0x1e0(%rbp)
145970312:     	leaq	0x1e0(%rbp), %rax
145970319:     	movq	%rax, 0xb0(%rbp)
145970320:     	leaq	0x23cf59(%rip), %rbx    # 0x145bad280 <.text+0x5bac280>
145970327:     	movq	%rbx, 0xb8(%rbp)
14597032e:     	leaq	0x1843228(%rip), %rdx   # 0x1471b355d
145970335:     	leaq	0x1c0(%rbp), %rsi
14597033c:     	leaq	0xb0(%rbp), %r8
145970343:     	movq	%rsi, %rcx
145970346:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14597034b:     	nop
14597034c:     	mulss	%xmm8, %xmm7
145970351:     	mulss	%xmm11, %xmm7
145970356:     	mulss	0x3fd142(%rip), %xmm7   # 0x145d6d4a0
14597035e:     	movss	%xmm7, 0x78(%rbp)
145970363:     	leaq	0x78(%rbp), %rax
145970367:     	movq	%rax, 0xb0(%rbp)
14597036e:     	movq	%rbx, 0xb8(%rbp)
145970375:     	leaq	0x18431e1(%rip), %rdx   # 0x1471b355d
14597037c:     	leaq	0x1e0(%rbp), %rbx
145970383:     	leaq	0xb0(%rbp), %r8
14597038a:     	movq	%rbx, %rcx
14597038d:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145970392:     	nop
145970393:     	leaq	0x1843443(%rip), %rax   # 0x1471b37dd
14597039a:     	movq	%rax, 0xb0(%rbp)
1459703a1:     	movq	$0x1, 0xb8(%rbp)
1459703ac:     	movq	%rsi, 0xc0(%rbp)
1459703b3:     	leaq	0x150b7de(%rip), %rcx   # 0x146e7bb98
1459703ba:     	movq	%rcx, 0xc8(%rbp)
1459703c1:     	leaq	0x1843416(%rip), %rax   # 0x1471b37de
1459703c8:     	movq	%rax, 0xd0(%rbp)
1459703cf:     	movq	$0x1, 0xd8(%rbp)
1459703da:     	movq	%rbx, 0xe0(%rbp)
1459703e1:     	movq	%rcx, 0xe8(%rbp)
1459703e8:     	leaq	0x1842d36(%rip), %rax   # 0x1471b3125
1459703ef:     	movq	%rax, 0xf0(%rbp)
1459703f6:     	movq	$0x3, 0xf8(%rbp)
145970401:     	movq	%r14, 0x100(%rbp)
145970408:     	movq	%rcx, 0x108(%rbp)
14597040f:     	movq	$0x3, 0x20(%rsp)
145970418:     	leaq	0x90(%rbp), %rcx
14597041f:     	leaq	0xb0(%rbp), %r9
145970426:     	movq	%r15, %rdx
145970429:     	movq	%r13, %r8
14597042c:     	callq	0x1458da940 <.text+0x58d9940>
