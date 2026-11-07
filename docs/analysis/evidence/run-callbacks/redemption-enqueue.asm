
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e73e0:     	pushq	%r15
1454e73e2:     	pushq	%r14
1454e73e4:     	pushq	%rsi
1454e73e5:     	pushq	%rdi
1454e73e6:     	pushq	%rbp
1454e73e7:     	pushq	%rbx
1454e73e8:     	subq	$0x38, %rsp
1454e73ec:     	movaps	%xmm6, 0x20(%rsp)
1454e73f1:     	movq	0x2b8(%rcx), %rax
1454e73f8:     	testq	%rax, %rax
1454e73fb:     	je	0x1454e75d9 <.text+0x54e65d9>
1454e7401:     	movq	0x2b0(%rcx), %r10
1454e7408:     	imulq	$0x58, %rax, %rsi
1454e740c:     	xorl	%r11d, %r11d
1454e740f:     	movabsq	$0x6974706d65646572, %rdi # imm = 0x6974706D65646572
1454e7419:     	jmp	0x1454e742d <.text+0x54e642d>
1454e741b:     	nopl	(%rax,%rax)
1454e7420:     	addq	$0x58, %r11
1454e7424:     	cmpq	%r11, %rsi
1454e7427:     	je	0x1454e75d9 <.text+0x54e65d9>
1454e742d:     	movq	(%r10,%r11), %rax
1454e7431:     	cmpq	$0xa, 0x8(%rax)
1454e7436:     	jne	0x1454e7420 <.text+0x54e6420>
1454e7438:     	movq	(%rax), %rbx
1454e743b:     	movq	(%rbx), %r14
1454e743e:     	xorq	%rdi, %r14
1454e7441:     	movzwl	0x8(%rbx), %ebx
1454e7445:     	xorq	$0x6e6f, %rbx           # imm = 0x6E6F
1454e744c:     	orq	%r14, %rbx
1454e744f:     	jne	0x1454e7420 <.text+0x54e6420>
1454e7451:     	movq	0x778(%rcx), %rsi
1454e7458:     	cmpq	$0x3, %rsi
1454e745c:     	ja	0x1454e75d9 <.text+0x54e65d9>
1454e7462:     	movss	0x14(%r10,%r11), %xmm2
1454e7469:     	movss	0x3c(%r10,%r11), %xmm1
1454e7470:     	movss	0x50(%r10,%r11), %xmm0
1454e7477:     	movq	0x8b8(%rcx), %r10
1454e747e:     	movq	0x8a0(%rcx), %r11
1454e7485:     	movq	0x8a8(%rcx), %rdi
1454e748c:     	leaq	(%r10,%r11), %rbx
1454e7490:     	rolq	$0x17, %rbx
1454e7494:     	addq	%r11, %rbx
1454e7497:     	movq	%rdi, %r14
1454e749a:     	shlq	$0x11, %r14
1454e749e:     	movq	0x8b0(%rcx), %r15
1454e74a5:     	xorq	%r11, %r15
1454e74a8:     	xorq	%rdi, %r10
1454e74ab:     	xorq	%r15, %rdi
1454e74ae:     	movq	%rdi, 0x8a8(%rcx)
1454e74b5:     	xorq	%r10, %r11
1454e74b8:     	movq	%r11, 0x8a0(%rcx)
1454e74bf:     	xorq	%r14, %r15
1454e74c2:     	movq	%r15, 0x8b0(%rcx)
1454e74c9:     	shrq	$0x28, %rbx
1454e74cd:     	cvtsi2ss	%ebx, %xmm3
1454e74d1:     	rolq	$0x2d, %r10
1454e74d5:     	mulss	0x520ec3(%rip), %xmm3   # 0x145a083a0
1454e74dd:     	movq	%r10, 0x8b8(%rcx)
1454e74e4:     	movss	0x48(%rax), %xmm4
1454e74e9:     	movss	0x42bdff(%rip), %xmm5   # 0x1459132f0
1454e74f1:     	mulss	%xmm4, %xmm5
1454e74f5:     	movss	0x4311f3(%rip), %xmm6   # 0x1459186f0
1454e74fd:     	mulss	%xmm6, %xmm4
1454e7501:     	mulss	%xmm2, %xmm4
1454e7505:     	mulss	%xmm1, %xmm4
1454e7509:     	mulss	0x478(%rcx), %xmm4
1454e7511:     	maxss	0x4220c7(%rip), %xmm4   # 0x1459095e0
1454e7519:     	mulss	%xmm6, %xmm5
1454e751d:     	divss	%xmm4, %xmm5
1454e7521:     	minss	0x41fff3(%rip), %xmm5   # 0x14590751c
1454e7529:     	mulss	%xmm0, %xmm5
1454e752d:     	ucomiss	%xmm5, %xmm3
1454e7530:     	jae	0x1454e75d9 <.text+0x54e65d9>
1454e7536:     	movss	0x934(%rcx), %xmm0
1454e753e:     	movaps	%xmm0, %xmm1
1454e7541:     	maxss	0x7f8(%rcx), %xmm1
1454e7549:     	movaps	%xmm1, %xmm6
1454e754c:     	cmpunordss	%xmm1, %xmm6
1454e7551:     	movaps	%xmm6, %xmm2
1454e7554:     	andnps	%xmm1, %xmm2
1454e7557:     	andps	%xmm0, %xmm6
1454e755a:     	orps	%xmm2, %xmm6
1454e755d:     	movaps	%xmm6, %xmm0
1454e7560:     	addss	0x41ff30(%rip), %xmm0   # 0x145907498
1454e7568:     	movss	%xmm0, 0x7f8(%rcx)
1454e7570:     	cmpq	0x768(%rcx), %rsi
1454e7577:     	jne	0x1454e75a0 <.text+0x54e65a0>
1454e7579:     	leaq	0x768(%rcx), %rax
1454e7580:     	movq	%rcx, %rdi
1454e7583:     	movq	%rax, %rcx
1454e7586:     	movl	%r9d, %ebp
1454e7589:     	movq	%r8, %r14
1454e758c:     	movq	%rdx, %rbx
1454e758f:     	callq	0x145774710 <.text+0x5773710>
1454e7594:     	movq	%rbx, %rdx
1454e7597:     	movq	%r14, %r8
1454e759a:     	movl	%ebp, %r9d
1454e759d:     	movq	%rdi, %rcx
1454e75a0:     	movq	0x770(%rcx), %rax
1454e75a7:     	movq	%rsi, %r10
1454e75aa:     	shlq	$0x5, %r10
1454e75ae:     	movq	%rdx, (%rax,%r10)
1454e75b2:     	movss	%xmm6, 0x8(%rax,%r10)
1454e75b9:     	movq	(%r8), %rdx
1454e75bc:     	movq	%rdx, 0xc(%rax,%r10)
1454e75c1:     	movl	0x8(%r8), %edx
1454e75c5:     	movl	%edx, 0x14(%rax,%r10)
1454e75ca:     	movl	%r9d, 0x18(%rax,%r10)
1454e75cf:     	incq	%rsi
1454e75d2:     	movq	%rsi, 0x778(%rcx)
1454e75d9:     	movaps	0x20(%rsp), %xmm6
1454e75de:     	addq	$0x38, %rsp
1454e75e2:     	popq	%rbx
1454e75e3:     	popq	%rbp
1454e75e4:     	popq	%rdi
1454e75e5:     	popq	%rsi
1454e75e6:     	popq	%r14
1454e75e8:     	popq	%r15
1454e75ea:     	retq
