
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a53b0:     	pushq	%rsi
1454a53b1:     	pushq	%rdi
1454a53b2:     	pushq	%rbx
1454a53b3:     	subq	$0x60, %rsp
1454a53b7:     	movaps	%xmm6, 0x50(%rsp)
1454a53bc:     	xorps	%xmm0, %xmm0
1454a53bf:     	ucomiss	%xmm1, %xmm0
1454a53c2:     	movq	(%r9), %rdx
1454a53c5:     	jae	0x1454a53ea <.text+0x54a43ea>
1454a53c7:     	cmpq	$-0x2, %rdx
1454a53cb:     	jne	0x1454a5418 <.text+0x54a4418>
1454a53cd:     	movaps	%xmm1, %xmm6
1454a53d0:     	movq	%rcx, %rdi
1454a53d3:     	testl	%r8d, %r8d
1454a53d6:     	je	0x1454a543c <.text+0x54a443c>
1454a53d8:     	leaq	0x20(%rsp), %rcx
1454a53dd:     	movq	%rdi, %rdx
1454a53e0:     	callq	0x1454a0520 <.text+0x549f520>
1454a53e5:     	jmp	0x1454a548d <.text+0x54a448d>
1454a53ea:     	cmpq	$-0x3, %rdx
1454a53ee:     	ja	0x1454a54ab <.text+0x54a44ab>
1454a53f4:     	testq	%rdx, %rdx
1454a53f7:     	je	0x1454a54ab <.text+0x54a44ab>
1454a53fd:     	movq	0x8(%r9), %rcx
1454a5401:     	movl	$0x1, %r8d
1454a5407:     	movaps	0x50(%rsp), %xmm6
1454a540c:     	addq	$0x60, %rsp
1454a5410:     	popq	%rbx
1454a5411:     	popq	%rdi
1454a5412:     	popq	%rsi
1454a5413:     	jmp	0x1400021d0 <.text+0x11d0>
1454a5418:     	movq	%rdx, 0x20(%rsp)
1454a541d:     	movups	0x8(%r9), %xmm0
1454a5422:     	movups	0x18(%r9), %xmm2
1454a5427:     	movups	%xmm0, 0x28(%rsp)
1454a542c:     	movups	%xmm2, 0x38(%rsp)
1454a5431:     	movq	0x28(%r9), %rax
1454a5435:     	movq	%rax, 0x48(%rsp)
1454a543a:     	jmp	0x1454a5493 <.text+0x54a4493>
1454a543c:     	leaq	0x1551615(%rip), %rsi   # 0x1469f6a58
1454a5443:     	movl	$0x5, %ebx
1454a5448:     	movl	$0x5, %edx
1454a544d:     	movq	%rsi, %rcx
1454a5450:     	callq	0x145457cb0 <.text+0x5456cb0>
1454a5455:     	testq	%rax, %rax
1454a5458:     	cmoveq	%rsi, %rax
1454a545c:     	cmoveq	%rbx, %rdx
1454a5460:     	movq	$-0x1, 0x20(%rsp)
1454a5469:     	movq	%rax, 0x28(%rsp)
1454a546e:     	movq	%rdx, 0x30(%rsp)
1454a5473:     	leaq	0x15515e3(%rip), %rax   # 0x1469f6a5d
1454a547a:     	movq	%rax, 0x38(%rsp)
1454a547f:     	movq	$0x18, 0x40(%rsp)
1454a5488:     	movb	$0x0, 0x48(%rsp)
1454a548d:     	movq	%rdi, %rcx
1454a5490:     	movaps	%xmm6, %xmm1
1454a5493:     	addq	$0x5f8, %rcx            # imm = 0x5F8
1454a549a:     	xorps	%xmm2, %xmm2
1454a549d:     	cvtss2sd	%xmm1, %xmm2
1454a54a1:     	leaq	0x20(%rsp), %rdx
1454a54a6:     	callq	0x1455021b0 <.text+0x55011b0>
1454a54ab:     	movaps	0x50(%rsp), %xmm6
1454a54b0:     	addq	$0x60, %rsp
1454a54b4:     	popq	%rbx
1454a54b5:     	popq	%rdi
1454a54b6:     	popq	%rsi
1454a54b7:     	retq
