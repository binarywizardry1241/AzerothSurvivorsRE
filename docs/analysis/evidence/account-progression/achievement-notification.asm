
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544f390:     	pushq	%rbp
14544f391:     	pushq	%r15
14544f393:     	pushq	%r14
14544f395:     	pushq	%r13
14544f397:     	pushq	%r12
14544f399:     	pushq	%rsi
14544f39a:     	pushq	%rdi
14544f39b:     	pushq	%rbx
14544f39c:     	subq	$0x78, %rsp
14544f3a0:     	leaq	0x70(%rsp), %rbp
14544f3a5:     	movq	$-0x2, (%rbp)
14544f3ad:     	movq	%rcx, %rsi
14544f3b0:     	movq	(%rdx), %rax
14544f3b3:     	movq	%rax, -0x18(%rbp)
14544f3b7:     	movq	0x8(%rdx), %rdi
14544f3bb:     	movq	0x10(%rdx), %rax
14544f3bf:     	leaq	(%rdi,%rax,8), %r13
14544f3c3:     	leaq	-0x38(%rbp), %rbx
14544f3c7:     	movq	%rdi, -0x10(%rbp)
14544f3cb:     	jmp	0x14544f3d4 <.text+0x544e3d4>
14544f3cd:     	nopl	(%rax)
14544f3d0:     	addq	$0x8, %rdi
14544f3d4:     	cmpq	%r13, %rdi
14544f3d7:     	je	0x14544f536 <.text+0x544e536>
14544f3dd:     	movq	(%rdi), %r15
14544f3e0:     	cmpl	$0x2, 0x10(%rsi)
14544f3e4:     	je	0x14544f4e7 <.text+0x544e4e7>
14544f3ea:     	leaq	-0x50(%rbp), %rcx
14544f3ee:     	movq	%r15, %rdx
14544f3f1:     	callq	0x14552f600 <.text+0x552e600>
14544f3f6:     	nop
14544f3f7:     	movq	-0x48(%rbp), %rdx
14544f3fb:     	movq	-0x40(%rbp), %r8
14544f3ff:     	movq	%rbx, %rcx
14544f402:     	movq	%rdx, -0x8(%rbp)
14544f406:     	callq	0x14545dc90 <.text+0x545cc90>
14544f40b:     	nop
14544f40c:     	movq	0x570(%rsi), %r12
14544f413:     	cmpq	0x560(%rsi), %r12
14544f41a:     	jne	0x14544f429 <.text+0x544e429>
14544f41c:     	leaq	0x560(%rsi), %rcx
14544f423:     	callq	0x145774710 <.text+0x5773710>
14544f428:     	nop
14544f429:     	movq	0x568(%rsi), %rax
14544f430:     	movq	%r12, %rcx
14544f433:     	shlq	$0x5, %rcx
14544f437:     	movups	-0x38(%rbp), %xmm0
14544f43b:     	movups	-0x28(%rbp), %xmm1
14544f43f:     	movups	%xmm1, 0x10(%rax,%rcx)
14544f444:     	movups	%xmm0, (%rax,%rcx)
14544f448:     	incq	%r12
14544f44b:     	movq	%r12, 0x570(%rsi)
14544f452:     	movq	-0x50(%rbp), %rdx
14544f456:     	testq	%rdx, %rdx
14544f459:     	je	0x14544f46a <.text+0x544e46a>
14544f45b:     	movl	$0x1, %r8d
14544f461:     	movq	-0x8(%rbp), %rcx
14544f465:     	callq	0x1400021d0 <.text+0x11d0>
14544f46a:     	callq	0x140002200 <.text+0x1200>
14544f46f:     	movl	$0x20, %ecx
14544f474:     	movl	$0x1, %edx
14544f479:     	callq	0x1400021c0 <.text+0x11c0>
14544f47e:     	testq	%rax, %rax
14544f481:     	je	0x14544f573 <.text+0x544e573>
14544f487:     	movq	%rax, -0x8(%rbp)
14544f48b:     	movl	$0x378, (%rax)          # imm = 0x378
14544f491:     	movq	0x570(%rsi), %r12
14544f498:     	cmpq	0x560(%rsi), %r12
14544f49f:     	jne	0x14544f4ae <.text+0x544e4ae>
14544f4a1:     	leaq	0x560(%rsi), %rcx
14544f4a8:     	callq	0x145774710 <.text+0x5773710>
14544f4ad:     	nop
14544f4ae:     	movq	0x568(%rsi), %rax
14544f4b5:     	movq	%r12, %rcx
14544f4b8:     	shlq	$0x5, %rcx
14544f4bc:     	movq	$0x20, (%rax,%rcx)
14544f4c4:     	movq	-0x8(%rbp), %rdx
14544f4c8:     	movq	%rdx, 0x8(%rax,%rcx)
14544f4cd:     	movq	$0x4, 0x10(%rax,%rcx)
14544f4d6:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
14544f4dd:     	incq	%r12
14544f4e0:     	movq	%r12, 0x570(%rsi)
14544f4e7:     	movq	0xf70(%rsi), %r12
14544f4ee:     	movq	0xf78(%rsi), %r14
14544f4f5:     	movq	%rbx, %rcx
14544f4f8:     	movq	%r15, %rdx
14544f4fb:     	callq	0x14552dd50 <.text+0x552cd50>
14544f500:     	nop
14544f501:     	movq	-0x30(%rbp), %rdx
14544f505:     	movq	-0x28(%rbp), %r8
14544f509:     	movq	%r12, %rcx
14544f50c:     	movq	%rdx, -0x8(%rbp)
14544f510:     	callq	*0x18(%r14)
14544f514:     	nop
14544f515:     	movq	-0x38(%rbp), %rdx
14544f519:     	testq	%rdx, %rdx
14544f51c:     	je	0x14544f3d0 <.text+0x544e3d0>
14544f522:     	movl	$0x1, %r8d
14544f528:     	movq	-0x8(%rbp), %rcx
14544f52c:     	callq	0x1400021d0 <.text+0x11d0>
14544f531:     	jmp	0x14544f3d0 <.text+0x544e3d0>
14544f536:     	movq	-0x18(%rbp), %rdx
14544f53a:     	testq	%rdx, %rdx
14544f53d:     	je	0x14544f562 <.text+0x544e562>
14544f53f:     	shlq	$0x3, %rdx
14544f543:     	movl	$0x8, %r8d
14544f549:     	movq	-0x10(%rbp), %rcx
14544f54d:     	addq	$0x78, %rsp
14544f551:     	popq	%rbx
14544f552:     	popq	%rdi
14544f553:     	popq	%rsi
14544f554:     	popq	%r12
14544f556:     	popq	%r13
14544f558:     	popq	%r14
14544f55a:     	popq	%r15
14544f55c:     	popq	%rbp
14544f55d:     	jmp	0x1400021d0 <.text+0x11d0>
14544f562:     	addq	$0x78, %rsp
14544f566:     	popq	%rbx
14544f567:     	popq	%rdi
14544f568:     	popq	%rsi
14544f569:     	popq	%r12
14544f56b:     	popq	%r13
14544f56d:     	popq	%r14
14544f56f:     	popq	%r15
14544f571:     	popq	%rbp
14544f572:     	retq
14544f573:     	movl	$0x1, %ecx
14544f578:     	movl	$0x20, %edx
14544f57d:     	callq	0x14590379b <.text+0x590279b>
14544f582:     	nop
14544f583:     	ud2
