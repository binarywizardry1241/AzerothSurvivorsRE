
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454952c0:     	pushq	%r15
1454952c2:     	pushq	%r14
1454952c4:     	pushq	%rsi
1454952c5:     	pushq	%rdi
1454952c6:     	pushq	%rbx
1454952c7:     	subq	$0x50, %rsp
1454952cb:     	movq	%rcx, %rsi
1454952ce:     	cmpl	$0x1, %edx
1454952d1:     	jne	0x1454952eb <.text+0x54942eb>
1454952d3:     	testb	%r8b, %r8b
1454952d6:     	je	0x145495307 <.text+0x5494307>
1454952d8:     	leaq	0x1560202(%rip), %rdi   # 0x1469f54e1
1454952df:     	movl	$0x14, %ebx
1454952e4:     	movl	$0x14, %edx
1454952e9:     	jmp	0x145495318 <.text+0x5494318>
1454952eb:     	testb	%r8b, %r8b
1454952ee:     	je	0x145495347 <.text+0x5494347>
1454952f0:     	movl	%edx, 0x2c(%rsp)
1454952f4:     	leaq	0x1560211(%rip), %rdi   # 0x1469f550c
1454952fb:     	movl	$0x1a, %ebx
145495300:     	movl	$0x1a, %edx
145495305:     	jmp	0x14549535c <.text+0x549435c>
145495307:     	leaq	0x15601c2(%rip), %rdi   # 0x1469f54d0
14549530e:     	movl	$0x11, %ebx
145495313:     	movl	$0x11, %edx
145495318:     	movq	%rdi, %rcx
14549531b:     	callq	0x145457cb0 <.text+0x5456cb0>
145495320:     	testq	%rax, %rax
145495323:     	cmoveq	%rdi, %rax
145495327:     	movq	%rdx, %rdi
14549532a:     	cmoveq	%rbx, %rdi
14549532e:     	testq	%rdi, %rdi
145495331:     	jns	0x1454953b8 <.text+0x54943b8>
145495337:     	xorl	%r15d, %r15d
14549533a:     	movq	%r15, %rcx
14549533d:     	movq	%rdi, %rdx
145495340:     	callq	0x14590379b <.text+0x590279b>
145495345:     	ud2
145495347:     	movl	%edx, 0x2c(%rsp)
14549534b:     	leaq	0x15601a3(%rip), %rdi   # 0x1469f54f5
145495352:     	movl	$0x17, %ebx
145495357:     	movl	$0x17, %edx
14549535c:     	movq	%rdi, %rcx
14549535f:     	callq	0x145457cb0 <.text+0x5456cb0>
145495364:     	testq	%rax, %rax
145495367:     	cmovneq	%rax, %rdi
14549536b:     	cmovneq	%rdx, %rbx
14549536f:     	leaq	0x1544f82(%rip), %rax   # 0x1469da2f8
145495376:     	movq	%rax, 0x30(%rsp)
14549537b:     	movq	$0x1, 0x38(%rsp)
145495384:     	leaq	0x2c(%rsp), %rax
145495389:     	movq	%rax, 0x40(%rsp)
14549538e:     	leaq	0x155f42b(%rip), %rax   # 0x1469f47c0
145495395:     	movq	%rax, 0x48(%rsp)
14549539a:     	movq	$0x1, 0x20(%rsp)
1454953a3:     	leaq	0x30(%rsp), %r9
1454953a8:     	movq	%rsi, %rcx
1454953ab:     	movq	%rdi, %rdx
1454953ae:     	movq	%rbx, %r8
1454953b1:     	callq	0x145458060 <.text+0x5457060>
1454953b6:     	jmp	0x145495401 <.text+0x5494401>
1454953b8:     	je	0x1454953f1 <.text+0x54943f1>
1454953ba:     	movq	%rax, %r14
1454953bd:     	callq	0x140002200 <.text+0x1200>
1454953c2:     	movl	$0x1, %r15d
1454953c8:     	movl	$0x1, %edx
1454953cd:     	movq	%rdi, %rcx
1454953d0:     	callq	0x1400021c0 <.text+0x11c0>
1454953d5:     	testq	%rax, %rax
1454953d8:     	je	0x14549533a <.text+0x549433a>
1454953de:     	movq	%rax, %rbx
1454953e1:     	movq	%rax, %rcx
1454953e4:     	movq	%r14, %rdx
1454953e7:     	movq	%rdi, %r8
1454953ea:     	callq	0x1457731ed <.text+0x57721ed>
1454953ef:     	jmp	0x1454953f6 <.text+0x54943f6>
1454953f1:     	movl	$0x1, %ebx
1454953f6:     	movq	%rdi, (%rsi)
1454953f9:     	movq	%rbx, 0x8(%rsi)
1454953fd:     	movq	%rdi, 0x10(%rsi)
145495401:     	addq	$0x50, %rsp
145495405:     	popq	%rbx
145495406:     	popq	%rdi
145495407:     	popq	%rsi
145495408:     	popq	%r14
14549540a:     	popq	%r15
14549540c:     	retq
