
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140fe0440:     	pushq	%r15
140fe0442:     	pushq	%r14
140fe0444:     	pushq	%rsi
140fe0445:     	pushq	%rdi
140fe0446:     	pushq	%rbx
140fe0447:     	subq	$0x80, %rsp
140fe044e:     	movl	$0x1, %ebx
140fe0453:     	lock
140fe0454:     	xaddl	%ebx, 0x5b0(%r8)
140fe045c:     	cmpl	$0x2, 0x20(%rdx)
140fe0460:     	je	0x140fe057a <.text+0xfdf57a>
140fe0466:     	movq	%rdx, %rsi
140fe0469:     	movq	0x5a0(%r8), %rax
140fe0470:     	movq	%rax, 0x38(%rsp)
140fe0475:     	cmpq	%rax, 0x8(%rdx)
140fe0479:     	jne	0x140fe0594 <.text+0xfdf594>
140fe047f:     	movq	0x10(%rsi), %rax
140fe0483:     	movq	0x218(%r8), %rdx
140fe048a:     	cmpq	%rdx, %rax
140fe048d:     	jae	0x140fe05c5 <.text+0xfdf5c5>
140fe0493:     	movq	0x210(%r8), %r9
140fe049a:     	movq	(%r9,%rax,8), %rax
140fe049e:     	testq	%rax, %rax
140fe04a1:     	je	0x140fe05c5 <.text+0xfdf5c5>
140fe04a7:     	movq	%rcx, %rdi
140fe04aa:     	movq	0x1e0(%r8), %rcx
140fe04b1:     	notq	%rax
140fe04b4:     	imulq	$0x38, %rax, %rax
140fe04b8:     	cmpb	$0x0, 0x30(%rcx,%rax)
140fe04bd:     	je	0x140fe05c5 <.text+0xfdf5c5>
140fe04c3:     	movq	0x18(%rsi), %r10
140fe04c7:     	cmpq	%rdx, %r10
140fe04ca:     	jae	0x140fe0603 <.text+0xfdf603>
140fe04d0:     	movq	(%r9,%r10,8), %rdx
140fe04d4:     	testq	%rdx, %rdx
140fe04d7:     	je	0x140fe0603 <.text+0xfdf603>
140fe04dd:     	notq	%rdx
140fe04e0:     	imulq	$0x38, %rdx, %rdx
140fe04e4:     	cmpb	$0x0, 0x30(%rcx,%rdx)
140fe04e9:     	je	0x140fe0603 <.text+0xfdf603>
140fe04ef:     	leaq	0x20(%rsi), %r9
140fe04f3:     	addq	%rcx, %rax
140fe04f6:     	movq	0x10(%rax), %r10
140fe04fa:     	movl	(%rsi), %r11d
140fe04fd:     	addq	%rcx, %rdx
140fe0500:     	leaq	0x2c(%rax), %rcx
140fe0504:     	addq	$0x28, %rax
140fe0508:     	movq	0x10(%rdx), %r14
140fe050c:     	leaq	0x28(%rdx), %r15
140fe0510:     	addq	$0x2c, %rdx
140fe0514:     	movl	0x5b0(%r8), %r8d
140fe051b:     	movq	%r10, 0x38(%rsp)
140fe0520:     	movq	%rax, 0x40(%rsp)
140fe0525:     	movq	%rcx, 0x48(%rsp)
140fe052a:     	movl	%r11d, 0x50(%rsp)
140fe052f:     	movl	%ebx, 0x54(%rsp)
140fe0533:     	leaq	0x58(%rsp), %r8
140fe0538:     	movq	%r14, 0x58(%rsp)
140fe053d:     	movq	%r15, 0x60(%rsp)
140fe0542:     	movq	%rdx, 0x68(%rsp)
140fe0547:     	movl	%r11d, 0x70(%rsp)
140fe054c:     	movl	%ebx, 0x74(%rsp)
140fe0550:     	movq	%r9, 0x78(%rsp)
140fe0555:     	leaq	0x38(%rsp), %rdx
140fe055a:     	callq	0x140fbf8a0 <.text+0xfbe8a0>
140fe055f:     	movl	%ebx, (%rsi)
140fe0561:     	movq	$-0x3, (%rdi)
140fe0568:     	movq	%rdi, %rax
140fe056b:     	addq	$0x80, %rsp
140fe0572:     	popq	%rbx
140fe0573:     	popq	%rdi
140fe0574:     	popq	%rsi
140fe0575:     	popq	%r14
140fe0577:     	popq	%r15
140fe0579:     	retq
140fe057a:     	leaq	0x4b070c7(%rip), %rcx   # 0x145ae7648
140fe0581:     	leaq	0x4b07120(%rip), %r8    # 0x145ae76a8
140fe0588:     	movl	$0x59, %edx
140fe058d:     	callq	0x1458e74d0 <.text+0x58e64d0>
140fe0592:     	ud2
140fe0594:     	addq	$0x8, %rsi
140fe0598:     	leaq	0x4b07191(%rip), %rax   # 0x145ae7730
140fe059f:     	movq	%rax, 0x28(%rsp)
140fe05a4:     	movq	$0xdf, 0x20(%rsp)
140fe05ad:     	leaq	0x4b0710c(%rip), %r9    # 0x145ae76c0
140fe05b4:     	leaq	0x38(%rsp), %r8
140fe05b9:     	xorl	%ecx, %ecx
140fe05bb:     	movq	%rsi, %rdx
140fe05be:     	callq	0x14589fabd <.text+0x589eabd>
140fe05c3:     	ud2
140fe05c5:     	addq	$0x4, %rsi
140fe05c9:     	movq	%rsi, 0x38(%rsp)
140fe05ce:     	leaq	0x40189db(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140fe05d5:     	movq	%rax, 0x40(%rsp)
140fe05da:     	leaq	0x37(%rsp), %rcx
140fe05df:     	movq	%rcx, 0x48(%rsp)
140fe05e4:     	movq	%rax, 0x50(%rsp)
140fe05e9:     	leaq	0x4b06c60(%rip), %rcx   # 0x145ae7250
140fe05f0:     	leaq	0x4b06c89(%rip), %r8    # 0x145ae7280
140fe05f7:     	leaq	0x38(%rsp), %rdx
140fe05fc:     	callq	0x1458e7790 <.text+0x58e6790>
140fe0601:     	ud2
140fe0603:     	addq	$0x4, %rsi
140fe0607:     	movq	%rsi, 0x38(%rsp)
140fe060c:     	leaq	0x401899d(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140fe0613:     	movq	%rax, 0x40(%rsp)
140fe0618:     	leaq	0x37(%rsp), %rcx
140fe061d:     	movq	%rcx, 0x48(%rsp)
140fe0622:     	movq	%rax, 0x50(%rsp)
140fe0627:     	leaq	0x4b06c22(%rip), %rcx   # 0x145ae7250
140fe062e:     	leaq	0x4b06d1b(%rip), %r8    # 0x145ae7350
140fe0635:     	leaq	0x38(%rsp), %rdx
140fe063a:     	callq	0x1458e7790 <.text+0x58e6790>
140fe063f:     	ud2
