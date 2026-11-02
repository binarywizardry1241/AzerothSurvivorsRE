
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552f2f0:     	pushq	%rbp
14552f2f1:     	pushq	%r15
14552f2f3:     	pushq	%r14
14552f2f5:     	pushq	%r13
14552f2f7:     	pushq	%r12
14552f2f9:     	pushq	%rsi
14552f2fa:     	pushq	%rdi
14552f2fb:     	pushq	%rbx
14552f2fc:     	subq	$0x48, %rsp
14552f300:     	leaq	0x40(%rsp), %rbp
14552f305:     	movq	$-0x2, (%rbp)
14552f30d:     	movq	%rcx, %rsi
14552f310:     	movq	(%rdx), %r15
14552f313:     	movq	0x8(%rdx), %r14
14552f317:     	cmpq	%r14, %r15
14552f31a:     	je	0x14552f439 <.text+0x552e439>
14552f320:     	movq	0x10(%rdx), %rdi
14552f324:     	addq	$0x50, %r15
14552f328:     	movl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
14552f32d:     	jmp	0x14552f350 <.text+0x552e350>
14552f32f:     	nop
14552f330:     	leaq	0x1(%rdi), %rcx
14552f334:     	movq	%rcx, 0x10(%rdx)
14552f338:     	leaq	-0x50(%r15), %rcx
14552f33c:     	addq	$0x50, %r15
14552f340:     	incq	%rdi
14552f343:     	addq	$0x50, %rcx
14552f347:     	cmpq	%r14, %rcx
14552f34a:     	je	0x14552f439 <.text+0x552e439>
14552f350:     	cmpb	$0x1, -0x4(%r15)
14552f355:     	jne	0x14552f330 <.text+0x552e330>
14552f357:     	movl	-0x8(%r15), %ecx
14552f35b:     	andl	%eax, %ecx
14552f35d:     	leaq	0x1(%rdi), %r12
14552f361:     	movq	%r12, 0x10(%rdx)
14552f365:     	cmpl	$0x7f800000, %ecx       # imm = 0x7F800000
14552f36b:     	jge	0x14552f338 <.text+0x552e338>
14552f36d:     	movq	%r15, (%rdx)
14552f370:     	callq	0x140002200 <.text+0x1200>
14552f375:     	movl	$0x20, %ecx
14552f37a:     	movl	$0x8, %edx
14552f37f:     	callq	0x1400021c0 <.text+0x11c0>
14552f384:     	testq	%rax, %rax
14552f387:     	je	0x14552f464 <.text+0x552e464>
14552f38d:     	movq	%rdi, (%rax)
14552f390:     	movq	$0x4, -0x18(%rbp)
14552f398:     	movq	%rax, -0x10(%rbp)
14552f39c:     	movq	$0x1, -0x8(%rbp)
14552f3a4:     	cmpq	%r14, %r15
14552f3a7:     	je	0x14552f420 <.text+0x552e420>
14552f3a9:     	movl	$0x1, %edi
14552f3ae:     	movl	$0x7fffffff, %r13d      # imm = 0x7FFFFFFF
14552f3b4:     	leaq	-0x18(%rbp), %rbx
14552f3b8:     	addq	$0x50, %r15
14552f3bc:     	jmp	0x14552f3cc <.text+0x552e3cc>
14552f3be:     	nop
14552f3c0:     	incq	%r12
14552f3c3:     	cmpq	%r14, %r15
14552f3c6:     	leaq	0x50(%r15), %r15
14552f3ca:     	je	0x14552f420 <.text+0x552e420>
14552f3cc:     	cmpb	$0x1, -0x4(%r15)
14552f3d1:     	jne	0x14552f3c0 <.text+0x552e3c0>
14552f3d3:     	movl	-0x8(%r15), %ecx
14552f3d7:     	andl	%r13d, %ecx
14552f3da:     	cmpl	$0x7f800000, %ecx       # imm = 0x7F800000
14552f3e0:     	jge	0x14552f3c0 <.text+0x552e3c0>
14552f3e2:     	cmpq	-0x18(%rbp), %rdi
14552f3e6:     	jne	0x14552f40d <.text+0x552e40d>
14552f3e8:     	movq	$0x8, 0x20(%rsp)
14552f3f1:     	movl	$0x1, %r8d
14552f3f7:     	movl	$0x8, %r9d
14552f3fd:     	movq	%rbx, %rcx
14552f400:     	movq	%rdi, %rdx
14552f403:     	callq	0x145757d40 <.text+0x5756d40>
14552f408:     	nop
14552f409:     	movq	-0x10(%rbp), %rax
14552f40d:     	movq	%r12, (%rax,%rdi,8)
14552f411:     	incq	%r12
14552f414:     	incq	%rdi
14552f417:     	movq	%rdi, -0x8(%rbp)
14552f41b:     	cmpq	%r14, %r15
14552f41e:     	jne	0x14552f3b8 <.text+0x552e3b8>
14552f420:     	movq	-0x8(%rbp), %rax
14552f424:     	movq	%rax, 0x10(%rsi)
14552f428:     	movq	-0x18(%rbp), %rax
14552f42c:     	movq	%rax, (%rsi)
14552f42f:     	movq	-0x10(%rbp), %rax
14552f433:     	movq	%rax, 0x8(%rsi)
14552f437:     	jmp	0x14552f450 <.text+0x552e450>
14552f439:     	movq	$0x0, (%rsi)
14552f440:     	movq	$0x8, 0x8(%rsi)
14552f448:     	movq	$0x0, 0x10(%rsi)
14552f450:     	movq	%rsi, %rax
14552f453:     	addq	$0x48, %rsp
14552f457:     	popq	%rbx
14552f458:     	popq	%rdi
14552f459:     	popq	%rsi
14552f45a:     	popq	%r12
14552f45c:     	popq	%r13
14552f45e:     	popq	%r14
14552f460:     	popq	%r15
14552f462:     	popq	%rbp
14552f463:     	retq
