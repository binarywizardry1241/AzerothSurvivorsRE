AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b5410:     	pushq	%rbp
1459b5411:     	pushq	%r15
1459b5413:     	pushq	%r14
1459b5415:     	pushq	%r13
1459b5417:     	pushq	%r12
1459b5419:     	pushq	%rsi
1459b541a:     	pushq	%rdi
1459b541b:     	pushq	%rbx
1459b541c:     	subq	$0xa8, %rsp
1459b5423:     	leaq	0x80(%rsp), %rbp
1459b542b:     	movaps	%xmm7, 0x10(%rbp)
1459b542f:     	movaps	%xmm6, (%rbp)
1459b5433:     	movq	$-0x2, -0x8(%rbp)
1459b543b:     	movq	(%rcx), %rsi
1459b543e:     	movq	0x8(%rcx), %rbx
1459b5442:     	movq	(%rdx), %rax
1459b5445:     	movq	0x8(%rdx), %r12
1459b5449:     	cmpq	%rbx, %rsi
1459b544c:     	je	0x1459b55ba <.text+0x59b45ba>
1459b5452:     	movq	%rax, -0x18(%rbp)
1459b5456:     	movq	0x10(%rcx), %r14
1459b545a:     	subq	%rsi, %rbx
1459b545d:     	shrq	$0x6, %rbx
1459b5461:     	leaq	-0x58(%rbp), %r15
1459b5465:     	movq	%r12, -0x10(%rbp)
1459b5469:     	shlq	$0x6, %r12
1459b546d:     	addq	0x10(%rdx), %r12
1459b5471:     	negq	%rbx
1459b5474:     	xorl	%edx, %edx
1459b5476:     	movl	$0x2, %r13d
1459b547c:     	movss	0x3b82d0(%rip), %xmm6   # 0x145d6d754
1459b5484:     	movss	0x53c7bc(%rip), %xmm7   # 0x145ef1c48
1459b548c:     	leaq	-0x60(%rbp), %rdi
1459b5490:     	jmp	0x1459b551f <.text+0x59b451f>
1459b5495:     	nopw	%cs:(%rax,%rax)
1459b54a0:     	movss	0x4(%rsi), %xmm0
1459b54a5:     	mulss	(%r14), %xmm0
1459b54aa:     	movzbl	0x8(%rsi), %eax
1459b54ae:     	movb	%al, -0x58(%rbp)
1459b54b1:     	movss	%xmm0, -0x5c(%rbp)
1459b54b6:     	movb	$0x23, %al
1459b54b8:     	movb	%al, -0x60(%rbp)
1459b54bb:     	movzbl	-0x60(%rbp), %eax
1459b54bf:     	movq	-0x5f(%rbp), %rcx
1459b54c3:     	movl	-0x57(%rbp), %edx
1459b54c6:     	movzwl	-0x53(%rbp), %r8d
1459b54cb:     	movzbl	-0x51(%rbp), %r9d
1459b54d0:     	movups	-0x50(%rbp), %xmm0
1459b54d4:     	movups	-0x40(%rbp), %xmm1
1459b54d8:     	movups	-0x30(%rbp), %xmm2
1459b54dc:     	movups	%xmm2, 0x30(%r12)
1459b54e2:     	movups	%xmm1, 0x20(%r12)
1459b54e8:     	movups	%xmm0, 0x10(%r12)
1459b54ee:     	movb	%al, (%r12)
1459b54f2:     	movq	%rcx, 0x1(%r12)
1459b54f7:     	movl	%edx, 0x9(%r12)
1459b54fc:     	movw	%r8w, 0xd(%r12)
1459b5502:     	movb	%r9b, 0xf(%r12)
1459b5507:     	movq	-0x20(%rbp), %rdx
1459b550b:     	decq	%rdx
1459b550e:     	addq	$0x40, %r12
1459b5512:     	addq	$0x40, %rsi
1459b5516:     	cmpq	%rdx, %rbx
1459b5519:     	je	0x1459b55af <.text+0x59b45af>
1459b551f:     	movzbl	(%rsi), %eax
1459b5522:     	subb	$0x23, %al
1459b5524:     	movzbl	%al, %eax
1459b5527:     	cmovbl	%r13d, %eax
1459b552b:     	testb	%al, %al
1459b552d:     	movq	%rdx, -0x20(%rbp)
1459b5531:     	je	0x1459b54a0 <.text+0x59b44a0>
1459b5537:     	movzbl	%al, %eax
1459b553a:     	cmpl	$0x1, %eax
1459b553d:     	jne	0x1459b5580 <.text+0x59b4580>
1459b553f:     	movzbl	0x24(%rsi), %eax
1459b5543:     	movq	0x18(%rsi), %rcx
1459b5547:     	movq	%rcx, 0x10(%r15)
1459b554b:     	movups	0x8(%rsi), %xmm0
1459b554f:     	movups	%xmm0, (%r15)
1459b5553:     	movss	0x20(%rsi), %xmm0
1459b5558:     	mulss	(%r14), %xmm0
1459b555d:     	cmpl	$0x1, %eax
1459b5560:     	je	0x1459b5596 <.text+0x59b4596>
1459b5562:     	cmpl	$0x2, %eax
1459b5565:     	jne	0x1459b55a0 <.text+0x59b45a0>
1459b5567:     	addss	%xmm7, %xmm0
1459b556b:     	callq	0x145bc9817 <.text+0x5bc8817>
1459b5570:     	movb	$0x2, -0x3c(%rbp)
1459b5574:     	jmp	0x1459b55a3 <.text+0x59b45a3>
1459b5576:     	nopw	%cs:(%rax,%rax)
1459b5580:     	movss	(%r14), %xmm2
1459b5585:     	movq	%rdi, %rcx
1459b5588:     	movq	%rsi, %rdx
1459b558b:     	callq	0x1458e0750 <.text+0x58df750>
1459b5590:     	nop
1459b5591:     	jmp	0x1459b54bb <.text+0x59b44bb>
1459b5596:     	minss	%xmm6, %xmm0
1459b559a:     	movb	$0x1, -0x3c(%rbp)
1459b559e:     	jmp	0x1459b55a3 <.text+0x59b45a3>
1459b55a0:     	movb	%al, -0x3c(%rbp)
1459b55a3:     	movss	%xmm0, -0x40(%rbp)
1459b55a8:     	movb	$0x24, %al
1459b55aa:     	jmp	0x1459b54b8 <.text+0x59b44b8>
1459b55af:     	movq	-0x10(%rbp), %r12
1459b55b3:     	subq	%rdx, %r12
1459b55b6:     	movq	-0x18(%rbp), %rax
1459b55ba:     	movq	%r12, (%rax)
1459b55bd:     	movaps	(%rbp), %xmm6
1459b55c1:     	movaps	0x10(%rbp), %xmm7
1459b55c5:     	addq	$0xa8, %rsp
1459b55cc:     	popq	%rbx
1459b55cd:     	popq	%rdi
1459b55ce:     	popq	%rsi
1459b55cf:     	popq	%r12
1459b55d1:     	popq	%r13
1459b55d3:     	popq	%r14
1459b55d5:     	popq	%r15
1459b55d7:     	popq	%rbp
1459b55d8:     	retq
