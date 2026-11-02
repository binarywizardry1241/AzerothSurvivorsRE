
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b22ba:     	movq	%r14, %rcx
1454b22bd:     	movq	%r15, %rdx
1454b22c0:     	callq	0x14540e820 <.text+0x540d820>
1454b22c5:     	imulq	$0xf0, %rax, %rcx
1454b22cc:     	leaq	0x1264165(%rip), %rdx   # 0x146716438
1454b22d3:     	leaq	(%rdx,%rcx), %rsi
1454b22d7:     	cmpq	$0xb, %rax
1454b22db:     	jne	0x1454b230d <.text+0x54b130d>
1454b22dd:     	movq	0x50(%rcx,%rdx), %r15
1454b22e2:     	leaq	(,%r15,8), %rdi
1454b22ea:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1454b22f4:     	cmpq	%rax, %rdi
1454b22f7:     	jbe	0x1454b2b19 <.text+0x54b1b19>
1454b22fd:     	xorl	%r14d, %r14d
1454b2300:     	movq	%r14, %rcx
1454b2303:     	movq	%rdi, %rdx
1454b2306:     	callq	0x1458e721b <.text+0x58e621b>
1454b230b:     	ud2
1454b230d:     	movq	0x78(%rsi), %rax
1454b2311:     	movq	0x80(%rsi), %rcx
1454b2318:     	leaq	(%rcx,%rcx,4), %rcx
1454b231c:     	shlq	$0x4, %rcx
1454b2320:     	addq	%rax, %rcx
1454b2323:     	movq	%rax, 0x130(%rbp)
1454b232a:     	movq	%rcx, 0x138(%rbp)
1454b2331:     	movq	$0x0, 0x140(%rbp)
1454b233c:     	leaq	0x100(%rbp), %rcx
1454b2343:     	leaq	0x130(%rbp), %rdx
1454b234a:     	callq	0x14552f2f0 <.text+0x552e2f0>
1454b234f:     	cmpq	$0x0, 0x110(%rbp)
1454b2357:     	jne	0x1454b2ced <.text+0x54b1ced>
1454b235d:     	movq	0x100(%rbp), %rdx
1454b2364:     	testq	%rdx, %rdx
1454b2367:     	je	0x1454b237f <.text+0x54b137f>
1454b2369:     	movq	0x108(%rbp), %rcx
1454b2370:     	shlq	$0x3, %rdx
1454b2374:     	movl	$0x8, %r8d
1454b237a:     	callq	0x1400021d0 <.text+0x11d0>
