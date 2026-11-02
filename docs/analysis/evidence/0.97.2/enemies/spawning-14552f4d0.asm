
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552f4d0:     	pushq	%rbp
14552f4d1:     	pushq	%r15
14552f4d3:     	pushq	%r14
14552f4d5:     	pushq	%r13
14552f4d7:     	pushq	%r12
14552f4d9:     	pushq	%rsi
14552f4da:     	pushq	%rdi
14552f4db:     	pushq	%rbx
14552f4dc:     	subq	$0x68, %rsp
14552f4e0:     	leaq	0x60(%rsp), %rbp
14552f4e5:     	movaps	%xmm6, -0x10(%rbp)
14552f4e9:     	movq	$-0x2, -0x18(%rbp)
14552f4f1:     	movq	%rcx, %rsi
14552f4f4:     	movq	(%rdx), %rax
14552f4f7:     	movq	0x8(%rdx), %r12
14552f4fb:     	movq	0x18(%rdx), %rdi
14552f4ff:     	movq	0x10(%rdx), %r13
14552f503:     	movss	0x3cd8e1(%rip), %xmm6   # 0x1458fcdec
14552f50b:     	nopl	(%rax,%rax)
14552f510:     	cmpq	%r12, %rax
14552f513:     	je	0x14552f5da <.text+0x552e5da>
14552f519:     	leaq	0x8(%rax), %r14
14552f51d:     	movq	%r14, (%rdx)
14552f520:     	movq	(%rax), %rbx
14552f523:     	cmpq	%rdi, %rbx
14552f526:     	jae	0x14552f61a <.text+0x552e61a>
14552f52c:     	leaq	(%rbx,%rbx,4), %rax
14552f530:     	shlq	$0x4, %rax
14552f534:     	ucomiss	0x44(%r13,%rax), %xmm6
14552f53a:     	movq	%r14, %rax
14552f53d:     	jb	0x14552f510 <.text+0x552e510>
14552f53f:     	callq	0x140002200 <.text+0x1200>
14552f544:     	movl	$0x20, %ecx
14552f549:     	movl	$0x8, %edx
14552f54e:     	callq	0x1400021c0 <.text+0x11c0>
14552f553:     	testq	%rax, %rax
14552f556:     	je	0x14552f643 <.text+0x552e643>
14552f55c:     	movq	%rbx, (%rax)
14552f55f:     	movq	$0x4, -0x30(%rbp)
14552f567:     	movq	%rax, -0x28(%rbp)
14552f56b:     	movl	$0x1, %ebx
14552f570:     	leaq	-0x30(%rbp), %rcx
14552f574:     	movq	%rbx, -0x20(%rbp)
14552f578:     	nopl	(%rax,%rax)
14552f580:     	cmpq	%r12, %r14
14552f583:     	je	0x14552f5f3 <.text+0x552e5f3>
14552f585:     	movq	(%r14), %r15
14552f588:     	cmpq	%rdi, %r15
14552f58b:     	jae	0x14552f62e <.text+0x552e62e>
14552f591:     	addq	$0x8, %r14
14552f595:     	leaq	(%r15,%r15,4), %rdx
14552f599:     	shlq	$0x4, %rdx
14552f59d:     	ucomiss	0x44(%r13,%rdx), %xmm6
14552f5a3:     	jb	0x14552f580 <.text+0x552e580>
14552f5a5:     	cmpq	-0x30(%rbp), %rbx
14552f5a9:     	jne	0x14552f5d1 <.text+0x552e5d1>
14552f5ab:     	movq	$0x8, 0x20(%rsp)
14552f5b4:     	movl	$0x1, %r8d
14552f5ba:     	movl	$0x8, %r9d
14552f5c0:     	movq	%rbx, %rdx
14552f5c3:     	callq	0x145757d40 <.text+0x5756d40>
14552f5c8:     	nop
14552f5c9:     	movq	-0x28(%rbp), %rax
14552f5cd:     	leaq	-0x30(%rbp), %rcx
14552f5d1:     	movq	%r15, (%rax,%rbx,8)
14552f5d5:     	incq	%rbx
14552f5d8:     	jmp	0x14552f574 <.text+0x552e574>
14552f5da:     	movq	$0x0, (%rsi)
14552f5e1:     	movq	$0x8, 0x8(%rsi)
14552f5e9:     	movq	$0x0, 0x10(%rsi)
14552f5f1:     	jmp	0x14552f602 <.text+0x552e602>
14552f5f3:     	movq	-0x20(%rbp), %rax
14552f5f7:     	movq	%rax, 0x10(%rsi)
14552f5fb:     	movups	-0x30(%rbp), %xmm0
14552f5ff:     	movups	%xmm0, (%rsi)
14552f602:     	movq	%rsi, %rax
14552f605:     	movaps	-0x10(%rbp), %xmm6
14552f609:     	addq	$0x68, %rsp
14552f60d:     	popq	%rbx
14552f60e:     	popq	%rdi
14552f60f:     	popq	%rsi
14552f610:     	popq	%r12
14552f612:     	popq	%r13
14552f614:     	popq	%r14
14552f616:     	popq	%r15
14552f618:     	popq	%rbp
14552f619:     	retq
14552f61a:     	leaq	0x11df29f(%rip), %r8    # 0x14670e8c0
14552f621:     	movq	%rbx, %rcx
14552f624:     	movq	%rdi, %rdx
14552f627:     	callq	0x1458e75b3 <.text+0x58e65b3>
14552f62c:     	ud2
14552f62e:     	leaq	0x11df28b(%rip), %r8    # 0x14670e8c0
14552f635:     	movq	%r15, %rcx
14552f638:     	movq	%rdi, %rdx
14552f63b:     	callq	0x1458e75b3 <.text+0x58e65b3>
14552f640:     	nop
14552f641:     	ud2
14552f643:     	movl	$0x8, %ecx
14552f648:     	movl	$0x20, %edx
14552f64d:     	callq	0x1458e721b <.text+0x58e621b>
14552f652:     	ud2
