
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592f1a0:     	pushq	%rbp
14592f1a1:     	pushq	%r15
14592f1a3:     	pushq	%r14
14592f1a5:     	pushq	%r12
14592f1a7:     	pushq	%rsi
14592f1a8:     	pushq	%rdi
14592f1a9:     	pushq	%rbx
14592f1aa:     	subq	$0x100, %rsp            # imm = 0x100
14592f1b1:     	leaq	0x80(%rsp), %rbp
14592f1b9:     	movaps	%xmm13, 0x70(%rbp)
14592f1be:     	movaps	%xmm12, 0x60(%rbp)
14592f1c3:     	movaps	%xmm11, 0x50(%rbp)
14592f1c8:     	movaps	%xmm10, 0x40(%rbp)
14592f1cd:     	movaps	%xmm9, 0x30(%rbp)
14592f1d2:     	movaps	%xmm8, 0x20(%rbp)
14592f1d7:     	movaps	%xmm7, 0x10(%rbp)
14592f1db:     	movaps	%xmm6, (%rbp)
14592f1df:     	movq	$-0x2, -0x8(%rbp)
14592f1e7:     	movq	%rdx, %rsi
14592f1ea:     	movq	0x900(%rcx), %rdx
14592f1f1:     	cmpq	%rdx, %rsi
14592f1f4:     	jae	0x14592f478 <.text+0x592e478>
14592f1fa:     	movaps	%xmm3, %xmm6
14592f1fd:     	movaps	%xmm2, %xmm7
14592f200:     	movq	%rcx, %rdi
14592f203:     	movss	0x9ec(%rcx), %xmm11
14592f20c:     	movq	0x8f8(%rcx), %r15
14592f213:     	movq	0x950(%rcx), %r12
14592f21a:     	leaq	0x10(%r12), %rbx
14592f21f:     	imulq	$0x70, %rsi, %r14
14592f223:     	movss	0x5c(%r15,%r14), %xmm1
14592f22a:     	addq	%r14, %r15
14592f22d:     	xorps	%xmm0, %xmm0
14592f230:     	ucomiss	%xmm1, %xmm0
14592f233:     	jae	0x14592f28c <.text+0x592e28c>
14592f235:     	movaps	%xmm11, %xmm2
14592f239:     	subss	0x58(%r15), %xmm2
14592f23f:     	divss	%xmm1, %xmm2
14592f243:     	maxss	%xmm2, %xmm0
14592f247:     	movss	0x43e11d(%rip), %xmm1   # 0x145d6d36c
14592f24f:     	minss	%xmm0, %xmm1
14592f253:     	movsd	0x40(%r15), %xmm0
14592f259:     	movsd	0x4c(%r15), %xmm2
14592f25f:     	subps	%xmm0, %xmm2
14592f262:     	movsldup	%xmm1, %xmm8            # xmm8 = xmm1[0,0,2,2]
14592f267:     	mulps	%xmm2, %xmm8
14592f26b:     	addps	%xmm0, %xmm8
14592f26f:     	movss	0x48(%r15), %xmm0
14592f275:     	movss	0x54(%r15), %xmm10
14592f27b:     	subss	%xmm0, %xmm10
14592f280:     	mulss	%xmm1, %xmm10
14592f285:     	addss	%xmm0, %xmm10
14592f28a:     	jmp	0x14592f298 <.text+0x592e298>
14592f28c:     	movsd	0x4c(%r15), %xmm8
14592f292:     	movss	0x54(%r15), %xmm10
14592f298:     	movshdup	%xmm8, %xmm2            # xmm2 = xmm8[1,1,3,3]
14592f29d:     	movq	%rbx, %rcx
14592f2a0:     	movaps	%xmm8, %xmm1
14592f2a4:     	callq	0x1458c7b60 <.text+0x58c6b60>
14592f2a9:     	movaps	%xmm0, %xmm9
14592f2ad:     	testb	$0x1, %al
14592f2af:     	jne	0x14592f2b5 <.text+0x592e2b5>
14592f2b1:     	movaps	%xmm10, %xmm9
14592f2b5:     	movaps	%xmm7, %xmm0
14592f2b8:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
14592f2bb:     	movaps	%xmm8, %xmm1
14592f2bf:     	subps	%xmm0, %xmm1
14592f2c2:     	mulps	%xmm1, %xmm1
14592f2c5:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
14592f2c9:     	addss	%xmm1, %xmm0
14592f2cd:     	sqrtss	%xmm0, %xmm12
14592f2d2:     	movss	0x43e46e(%rip), %xmm0   # 0x145d6d748
14592f2da:     	ucomiss	%xmm12, %xmm0
14592f2de:     	ja	0x14592f440 <.text+0x592e440>
14592f2e4:     	movss	0xe0(%rbp), %xmm13
14592f2ed:     	movq	%rbx, %rcx
14592f2f0:     	movaps	%xmm7, %xmm1
14592f2f3:     	movaps	%xmm6, %xmm2
14592f2f6:     	callq	0x1458c7b60 <.text+0x58c6b60>
14592f2fb:     	testb	$0x1, %al
14592f2fd:     	je	0x14592f305 <.text+0x592e305>
14592f2ff:     	movaps	%xmm0, %xmm10
14592f303:     	jmp	0x14592f339 <.text+0x592e339>
14592f305:     	cmpq	$-0x1, 0x68(%r12)
14592f30b:     	je	0x14592f32f <.text+0x592e32f>
14592f30d:     	leaq	0x68(%r12), %rdx
14592f312:     	leaq	-0x38(%rbp), %rcx
14592f316:     	movaps	%xmm7, %xmm2
14592f319:     	movaps	%xmm6, %xmm3
14592f31c:     	callq	0x1458cc950 <.text+0x58cb950>
14592f321:     	cmpl	$0x1, -0x38(%rbp)
14592f325:     	jne	0x14592f32f <.text+0x592e32f>
14592f327:     	movss	-0x2c(%rbp), %xmm10
14592f32d:     	jmp	0x14592f339 <.text+0x592e339>
14592f32f:     	movss	0xb8(%r12), %xmm10
14592f339:     	divss	%xmm13, %xmm12
14592f33e:     	movq	0x38(%r15), %rdx
14592f342:     	movl	0xa10(%rdi), %eax
14592f348:     	incl	%eax
14592f34a:     	movl	%eax, 0xa10(%rdi)
14592f350:     	movss	0x49024c(%rip), %xmm0   # 0x145dbf5a4
14592f358:     	mulss	%xmm12, %xmm0
14592f35d:     	cvttss2si	%xmm0, %rcx
14592f362:     	xorl	%r8d, %r8d
14592f365:     	xorps	%xmm1, %xmm1
14592f368:     	ucomiss	%xmm1, %xmm0
14592f36b:     	cmovael	%ecx, %r8d
14592f36f:     	ucomiss	0x43e4fe(%rip), %xmm0   # 0x145d6d874
14592f376:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14592f37b:     	cmovbel	%r8d, %ecx
14592f37f:     	movlps	%xmm8, -0x48(%rbp)
14592f384:     	movss	%xmm9, -0x40(%rbp)
14592f38a:     	movss	%xmm7, -0x14(%rbp)
14592f38f:     	movss	%xmm6, -0x10(%rbp)
14592f394:     	movss	%xmm10, -0xc(%rbp)
14592f39a:     	movl	%ecx, 0x28(%rsp)
14592f39e:     	movl	%eax, 0x20(%rsp)
14592f3a2:     	leaq	-0x38(%rbp), %rcx
14592f3a6:     	leaq	-0x48(%rbp), %r8
14592f3aa:     	leaq	-0x14(%rbp), %r9
14592f3ae:     	callq	0x1458aa9e0 <.text+0x58a99e0>
14592f3b3:     	movq	0x5e0(%rdi), %rbx
14592f3ba:     	cmpq	0x5d0(%rdi), %rbx
14592f3c1:     	jne	0x14592f3d0 <.text+0x592e3d0>
14592f3c3:     	leaq	0x5d0(%rdi), %rcx
14592f3ca:     	callq	0x145bcb530 <.text+0x5bca530>
14592f3cf:     	nop
14592f3d0:     	movq	0x5d8(%rdi), %rax
14592f3d7:     	movq	%rbx, %rcx
14592f3da:     	shlq	$0x5, %rcx
14592f3de:     	movups	-0x38(%rbp), %xmm0
14592f3e2:     	movups	-0x28(%rbp), %xmm1
14592f3e6:     	movups	%xmm1, 0x10(%rax,%rcx)
14592f3eb:     	movups	%xmm0, (%rax,%rcx)
14592f3ef:     	incq	%rbx
14592f3f2:     	movq	%rbx, 0x5e0(%rdi)
14592f3f9:     	movq	0x900(%rdi), %rdx
14592f400:     	cmpq	%rdx, %rsi
14592f403:     	jae	0x14592f489 <.text+0x592e489>
14592f409:     	movq	0x8f8(%rdi), %rax
14592f410:     	movlps	%xmm8, 0x40(%rax,%r14)
14592f416:     	movss	%xmm9, 0x48(%rax,%r14)
14592f41d:     	movss	%xmm7, 0x4c(%rax,%r14)
14592f424:     	movss	%xmm6, 0x50(%rax,%r14)
14592f42b:     	movss	%xmm10, 0x54(%rax,%r14)
14592f432:     	movss	%xmm11, 0x58(%rax,%r14)
14592f439:     	movss	%xmm12, 0x5c(%rax,%r14)
14592f440:     	movaps	(%rbp), %xmm6
14592f444:     	movaps	0x10(%rbp), %xmm7
14592f448:     	movaps	0x20(%rbp), %xmm8
14592f44d:     	movaps	0x30(%rbp), %xmm9
14592f452:     	movaps	0x40(%rbp), %xmm10
14592f457:     	movaps	0x50(%rbp), %xmm11
14592f45c:     	movaps	0x60(%rbp), %xmm12
14592f461:     	movaps	0x70(%rbp), %xmm13
14592f466:     	addq	$0x100, %rsp            # imm = 0x100
14592f46d:     	popq	%rbx
14592f46e:     	popq	%rdi
14592f46f:     	popq	%rsi
14592f470:     	popq	%r12
14592f472:     	popq	%r14
14592f474:     	popq	%r15
14592f476:     	popq	%rbp
14592f477:     	retq
14592f478:     	leaq	0x154a471(%rip), %r8    # 0x146e798f0
14592f47f:     	movq	%rsi, %rcx
14592f482:     	callq	0x145d697e3 <.text+0x5d687e3>
14592f487:     	ud2
14592f489:     	leaq	0x154a478(%rip), %r8    # 0x146e79908
14592f490:     	movq	%rsi, %rcx
14592f493:     	callq	0x145d697e3 <.text+0x5d687e3>
14592f498:     	ud2
