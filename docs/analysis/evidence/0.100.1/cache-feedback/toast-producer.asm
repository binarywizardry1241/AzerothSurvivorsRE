
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e4340:     	pushq	%rbp
1454e4341:     	pushq	%r14
1454e4343:     	pushq	%rsi
1454e4344:     	pushq	%rdi
1454e4345:     	pushq	%rbx
1454e4346:     	subq	$0x90, %rsp
1454e434d:     	leaq	0x80(%rsp), %rbp
1454e4355:     	movq	$-0x2, 0x8(%rbp)
1454e435d:     	movq	%r8, %rbx
1454e4360:     	movq	%rdx, %rdi
1454e4363:     	movq	%rcx, %rsi
1454e4366:     	callq	0x140002200 <.text+0x1200>
1454e436b:     	movl	$0x1, %ecx
1454e4370:     	movl	$0x1, %edx
1454e4375:     	callq	0x1400021c0 <.text+0x11c0>
1454e437a:     	testq	%rax, %rax
1454e437d:     	je	0x1454e4494 <.text+0x54e3494>
1454e4383:     	movb	$0x7b, (%rax)
1454e4386:     	movq	$0x1, -0x20(%rbp)
1454e438e:     	movq	%rax, -0x18(%rbp)
1454e4392:     	movq	$0x1, -0x10(%rbp)
1454e439a:     	movb	$0x1, -0x8(%rbp)
1454e439e:     	leaq	0x1512f57(%rip), %rax   # 0x1469f72fc
1454e43a5:     	movq	%rax, 0x20(%rsp)
1454e43aa:     	movq	$0x5, 0x28(%rsp)
1454e43b3:     	leaq	0x151271a(%rip), %r8    # 0x1469f6ad4
1454e43ba:     	leaq	-0x48(%rbp), %r14
1454e43be:     	leaq	-0x20(%rbp), %rdx
1454e43c2:     	movl	$0x4, %r9d
1454e43c8:     	movq	%r14, %rcx
1454e43cb:     	callq	0x145456ed0 <.text+0x5455ed0>
1454e43d0:     	movq	%rbx, 0x28(%rsp)
1454e43d5:     	movq	%rdi, 0x20(%rsp)
1454e43da:     	leaq	0x15126eb(%rip), %r8    # 0x1469f6acc
1454e43e1:     	leaq	-0x20(%rbp), %rcx
1454e43e5:     	movl	$0x4, %r9d
1454e43eb:     	movq	%r14, %rdx
1454e43ee:     	callq	0x145456ed0 <.text+0x5455ed0>
1454e43f3:     	movq	-0x20(%rbp), %rax
1454e43f7:     	movq	-0x10(%rbp), %rdi
1454e43fb:     	cmpq	%rdi, %rax
1454e43fe:     	je	0x1454e4469 <.text+0x54e3469>
1454e4400:     	movq	%rax, (%rbp)
1454e4404:     	movq	-0x18(%rbp), %rax
1454e4408:     	movq	%rax, -0x28(%rbp)
1454e440c:     	movb	$0x7d, (%rax,%rdi)
1454e4410:     	movq	0x578(%rsi), %rbx
1454e4417:     	cmpq	0x568(%rsi), %rbx
1454e441e:     	jne	0x1454e442d <.text+0x54e342d>
1454e4420:     	leaq	0x568(%rsi), %rcx
1454e4427:     	callq	0x1457745c0 <.text+0x57735c0>
1454e442c:     	nop
1454e442d:     	incq	%rdi
1454e4430:     	movq	0x570(%rsi), %rax
1454e4437:     	leaq	(%rbx,%rbx,2), %rcx
1454e443b:     	movq	(%rbp), %rdx
1454e443f:     	movq	%rdx, (%rax,%rcx,8)
1454e4443:     	movq	-0x28(%rbp), %rdx
1454e4447:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454e444c:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454e4451:     	incq	%rbx
1454e4454:     	movq	%rbx, 0x578(%rsi)
1454e445b:     	addq	$0x90, %rsp
1454e4462:     	popq	%rbx
1454e4463:     	popq	%rdi
1454e4464:     	popq	%rsi
1454e4465:     	popq	%r14
1454e4467:     	popq	%rbp
1454e4468:     	retq
1454e4469:     	movq	$0x1, 0x20(%rsp)
1454e4472:     	leaq	-0x20(%rbp), %rcx
1454e4476:     	movl	$0x1, %r8d
1454e447c:     	movl	$0x1, %r9d
1454e4482:     	movq	%rdi, %rdx
1454e4485:     	callq	0x1457744b0 <.text+0x57734b0>
1454e448a:     	nop
1454e448b:     	movq	-0x20(%rbp), %rax
1454e448f:     	jmp	0x1454e4400 <.text+0x54e3400>
1454e4494:     	movl	$0x1, %ecx
1454e4499:     	movl	$0x1, %edx
1454e449e:     	callq	0x14590379b <.text+0x590279b>
1454e44a3:     	ud2
