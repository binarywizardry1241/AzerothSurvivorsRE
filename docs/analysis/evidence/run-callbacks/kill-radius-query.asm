
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145500300:     	pushq	%rbp
145500301:     	pushq	%rsi
145500302:     	pushq	%rdi
145500303:     	subq	$0x90, %rsp
14550030a:     	leaq	0x80(%rsp), %rbp
145500312:     	movq	$-0x2, 0x8(%rbp)
14550031a:     	movq	%rcx, %rsi
14550031d:     	movaps	0x50(%rbp), %xmm0
145500321:     	movss	0x934(%rdx), %xmm1
145500329:     	movss	%xmm1, (%rbp)
14550032e:     	mulss	%xmm3, %xmm3
145500332:     	movss	%xmm3, -0x4(%rbp)
145500337:     	movq	0x4e0(%rdx), %rax
14550033e:     	imulq	$0x160, 0x4e8(%rdx), %rcx # imm = 0x160
145500349:     	addq	%rax, %rcx
14550034c:     	movq	%rax, -0x60(%rbp)
145500350:     	movq	%rcx, -0x58(%rbp)
145500354:     	movups	%xmm0, -0x50(%rbp)
145500358:     	movq	%rbp, %rax
14550035b:     	movq	%rax, -0x40(%rbp)
14550035f:     	movq	%r8, -0x38(%rbp)
145500363:     	leaq	-0x4(%rbp), %rax
145500367:     	movq	%rax, -0x30(%rbp)
14550036b:     	leaq	-0x28(%rbp), %rcx
14550036f:     	leaq	-0x60(%rbp), %rdx
145500373:     	callq	0x14553a880 <.text+0x5539880>
145500378:     	movq	-0x20(%rbp), %rcx
14550037c:     	movq	-0x18(%rbp), %rdi
145500380:     	leaq	0x7(%rbp), %rax
145500384:     	movq	%rax, -0x60(%rbp)
145500388:     	cmpq	$0x2, %rdi
14550038c:     	jae	0x14550044a <.text+0x54ff44a>
145500392:     	movq	-0x28(%rbp), %rax
145500396:     	testq	%rdi, %rdi
145500399:     	je	0x145500431 <.text+0x54ff431>
14550039f:     	leaq	-0x1(%rdi), %rdx
1455003a3:     	movl	%edi, %r11d
1455003a6:     	andl	$0x3, %r11d
1455003aa:     	cmpq	$0x3, %rdx
1455003ae:     	jae	0x1455003b4 <.text+0x54ff3b4>
1455003b0:     	xorl	%edx, %edx
1455003b2:     	jmp	0x145500404 <.text+0x54ff404>
1455003b4:     	movq	%rdi, %r8
1455003b7:     	andq	$-0x4, %r8
1455003bb:     	leaq	0x38(%rcx), %r9
1455003bf:     	xorl	%edx, %edx
1455003c1:     	nopw	%cs:(%rax,%rax)
1455003d0:     	movq	-0x30(%r9), %r10
1455003d4:     	movq	%r10, (%rcx,%rdx,8)
1455003d8:     	movq	-0x20(%r9), %r10
1455003dc:     	movq	%r10, 0x8(%rcx,%rdx,8)
1455003e1:     	movq	-0x10(%r9), %r10
1455003e5:     	movq	%r10, 0x10(%rcx,%rdx,8)
1455003ea:     	movq	(%r9), %r10
1455003ed:     	movq	%r10, 0x18(%rcx,%rdx,8)
1455003f2:     	addq	$0x4, %rdx
1455003f6:     	addq	$0x40, %r9
1455003fa:     	cmpq	%rdx, %r8
1455003fd:     	jne	0x1455003d0 <.text+0x54ff3d0>
1455003ff:     	testq	%r11, %r11
145500402:     	je	0x145500431 <.text+0x54ff431>
145500404:     	leaq	(%rcx,%rdx,8), %r8
145500408:     	shlq	$0x4, %rdx
14550040c:     	addq	%rcx, %rdx
14550040f:     	addq	$0x8, %rdx
145500413:     	shll	$0x3, %r11d
145500417:     	xorl	%r9d, %r9d
14550041a:     	nopw	(%rax,%rax)
145500420:     	movq	(%rdx,%r9,2), %r10
145500424:     	movq	%r10, (%r8,%r9)
145500428:     	addq	$0x8, %r9
14550042c:     	cmpq	%r9, %r11
14550042f:     	jne	0x145500420 <.text+0x54ff420>
145500431:     	addq	%rax, %rax
145500434:     	movq	%rax, (%rsi)
145500437:     	movq	%rcx, 0x8(%rsi)
14550043b:     	movq	%rdi, 0x10(%rsi)
14550043f:     	addq	$0x90, %rsp
145500446:     	popq	%rdi
145500447:     	popq	%rsi
145500448:     	popq	%rbp
145500449:     	retq
14550044a:     	cmpq	$0x15, %rdi
14550044e:     	movq	%rcx, -0x10(%rbp)
145500452:     	jae	0x145500473 <.text+0x54ff473>
145500454:     	leaq	-0x60(%rbp), %r9
145500458:     	movl	$0x1, %r8d
14550045e:     	movq	%rdi, %rdx
145500461:     	callq	0x14193aca0 <.text+0x1939ca0>
145500466:     	movq	-0x28(%rbp), %rax
14550046a:     	movq	-0x10(%rbp), %rcx
14550046e:     	jmp	0x14550039f <.text+0x54ff39f>
145500473:     	leaq	-0x60(%rbp), %r8
145500477:     	movq	%rdi, %rdx
14550047a:     	callq	0x145481680 <.text+0x5480680>
14550047f:     	nop
145500480:     	jmp	0x145500466 <.text+0x54ff466>
