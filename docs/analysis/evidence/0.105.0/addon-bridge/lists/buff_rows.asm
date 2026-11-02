
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599a240:     	pushq	%rbp
14599a241:     	pushq	%r15
14599a243:     	pushq	%r14
14599a245:     	pushq	%r13
14599a247:     	pushq	%r12
14599a249:     	pushq	%rsi
14599a24a:     	pushq	%rdi
14599a24b:     	pushq	%rbx
14599a24c:     	subq	$0xb8, %rsp
14599a253:     	leaq	0x80(%rsp), %rbp
14599a25b:     	movq	$-0x2, 0x30(%rbp)
14599a263:     	movq	%rcx, %rsi
14599a266:     	movq	(%rdx), %rax
14599a269:     	movq	0x8(%rdx), %r13
14599a26d:     	cmpq	%r13, %rax
14599a270:     	je	0x14599a445 <.text+0x5999445>
14599a276:     	movq	0x10(%rdx), %r14
14599a27a:     	movss	(%r14), %xmm0
14599a27f:     	nop
14599a280:     	movss	0x10(%rax), %xmm1
14599a285:     	ucomiss	%xmm0, %xmm1
14599a288:     	ja	0x14599a298 <.text+0x5999298>
14599a28a:     	addq	$0x18, %rax
14599a28e:     	cmpq	%r13, %rax
14599a291:     	jne	0x14599a280 <.text+0x5999280>
14599a293:     	jmp	0x14599a445 <.text+0x5999445>
14599a298:     	leaq	0x18(%rax), %r15
14599a29c:     	movq	%r15, (%rdx)
14599a29f:     	movq	0x18(%rdx), %r12
14599a2a3:     	addq	$0xc, %rax
14599a2a7:     	subss	(%r12), %xmm1
14599a2ad:     	movss	%xmm1, -0x38(%rbp)
14599a2b2:     	movq	%rax, -0x20(%rbp)
14599a2b6:     	leaq	0x213cc3(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14599a2bd:     	movq	%rax, -0x18(%rbp)
14599a2c1:     	leaq	-0x38(%rbp), %rax
14599a2c5:     	movq	%rax, -0x10(%rbp)
14599a2c9:     	leaq	0x212fb0(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
14599a2d0:     	movq	%rax, -0x8(%rbp)
14599a2d4:     	leaq	0x181ad1a(%rip), %rdx   # 0x1471b4ff5
14599a2db:     	leaq	-0x50(%rbp), %rcx
14599a2df:     	leaq	-0x20(%rbp), %r8
14599a2e3:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a2e8:     	movq	-0x50(%rbp), %rdi
14599a2ec:     	cmpq	$-0x1, %rdi
14599a2f0:     	je	0x14599a445 <.text+0x5999445>
14599a2f6:     	movq	-0x48(%rbp), %rax
14599a2fa:     	movq	%rax, 0x20(%rbp)
14599a2fe:     	callq	0x140002200 <.text+0x1200>
14599a303:     	movl	$0x60, %ecx
14599a308:     	movl	$0x8, %edx
14599a30d:     	callq	0x1400021c0 <.text+0x11c0>
14599a312:     	testq	%rax, %rax
14599a315:     	je	0x14599a473 <.text+0x5999473>
14599a31b:     	movq	%rax, %rbx
14599a31e:     	movq	-0x40(%rbp), %rax
14599a322:     	movq	%rax, 0x10(%rbx)
14599a326:     	movups	-0x50(%rbp), %xmm0
14599a32a:     	movups	%xmm0, (%rbx)
14599a32d:     	movq	$0x4, (%rbp)
14599a335:     	movq	%rbx, 0x8(%rbp)
14599a339:     	movq	$0x1, 0x10(%rbp)
14599a341:     	cmpq	%r13, %r15
14599a344:     	je	0x14599a42c <.text+0x599942c>
14599a34a:     	movl	$0x1, %edi
14599a34f:     	movss	(%r14), %xmm0
14599a354:     	addq	$0xc, %r15
14599a358:     	nopl	(%rax,%rax)
14599a360:     	movss	0x4(%r15), %xmm1
14599a366:     	ucomiss	%xmm0, %xmm1
14599a369:     	ja	0x14599a380 <.text+0x5999380>
14599a36b:     	leaq	0x18(%r15), %rax
14599a36f:     	addq	$0xc, %r15
14599a373:     	cmpq	%r13, %r15
14599a376:     	movq	%rax, %r15
14599a379:     	jne	0x14599a360 <.text+0x5999360>
14599a37b:     	jmp	0x14599a42c <.text+0x599942c>
14599a380:     	subss	(%r12), %xmm1
14599a386:     	movss	%xmm1, 0x1c(%rbp)
14599a38b:     	movq	%r15, -0x20(%rbp)
14599a38f:     	leaq	0x213bea(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14599a396:     	movq	%rax, -0x18(%rbp)
14599a39a:     	leaq	0x1c(%rbp), %rax
14599a39e:     	movq	%rax, -0x10(%rbp)
14599a3a2:     	leaq	0x212ed7(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
14599a3a9:     	movq	%rax, -0x8(%rbp)
14599a3ad:     	leaq	-0x38(%rbp), %rcx
14599a3b1:     	leaq	0x181ac3d(%rip), %rdx   # 0x1471b4ff5
14599a3b8:     	leaq	-0x20(%rbp), %r8
14599a3bc:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a3c1:     	nop
14599a3c2:     	movq	-0x38(%rbp), %rax
14599a3c6:     	movq	%rax, 0x20(%rbp)
14599a3ca:     	cmpq	$-0x1, %rax
14599a3ce:     	je	0x14599a42c <.text+0x599942c>
14599a3d0:     	cmpq	(%rbp), %rdi
14599a3d4:     	jne	0x14599a403 <.text+0x5999403>
14599a3d6:     	movq	-0x30(%rbp), %rax
14599a3da:     	movq	%rax, 0x28(%rbp)
14599a3de:     	movq	$0x18, 0x20(%rsp)
14599a3e7:     	movl	$0x1, %r8d
14599a3ed:     	movl	$0x8, %r9d
14599a3f3:     	movq	%rbp, %rcx
14599a3f6:     	movq	%rdi, %rdx
14599a3f9:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599a3fe:     	nop
14599a3ff:     	movq	0x8(%rbp), %rbx
14599a403:     	addq	$0xc, %r15
14599a407:     	leaq	(%rdi,%rdi,2), %rax
14599a40b:     	movq	-0x28(%rbp), %rcx
14599a40f:     	movq	%rcx, 0x10(%rbx,%rax,8)
14599a414:     	movups	-0x38(%rbp), %xmm0
14599a418:     	movups	%xmm0, (%rbx,%rax,8)
14599a41c:     	incq	%rdi
14599a41f:     	movq	%rdi, 0x10(%rbp)
14599a423:     	cmpq	%r13, %r15
14599a426:     	jne	0x14599a34f <.text+0x599934f>
14599a42c:     	movq	0x10(%rbp), %rax
14599a430:     	movq	%rax, 0x10(%rsi)
14599a434:     	movq	(%rbp), %rax
14599a438:     	movq	%rax, (%rsi)
14599a43b:     	movq	0x8(%rbp), %rax
14599a43f:     	movq	%rax, 0x8(%rsi)
14599a443:     	jmp	0x14599a45c <.text+0x599945c>
14599a445:     	movq	$0x0, (%rsi)
14599a44c:     	movq	$0x8, 0x8(%rsi)
14599a454:     	movq	$0x0, 0x10(%rsi)
14599a45c:     	movq	%rsi, %rax
14599a45f:     	addq	$0xb8, %rsp
14599a466:     	popq	%rbx
14599a467:     	popq	%rdi
14599a468:     	popq	%rsi
14599a469:     	popq	%r12
14599a46b:     	popq	%r13
14599a46d:     	popq	%r14
14599a46f:     	popq	%r15
14599a471:     	popq	%rbp
14599a472:     	retq
14599a473:     	movq	%rdi, 0x28(%rbp)
14599a477:     	movl	$0x8, %ecx
14599a47c:     	movl	$0x60, %edx
14599a481:     	callq	0x145d6944b <.text+0x5d6844b>
14599a486:     	nop
14599a487:     	ud2
