
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454251d0:     	pushq	%rbp
1454251d1:     	pushq	%r14
1454251d3:     	pushq	%rsi
1454251d4:     	pushq	%rdi
1454251d5:     	pushq	%rbx
1454251d6:     	subq	$0x80, %rsp
1454251dd:     	leaq	0x80(%rsp), %rbp
1454251e5:     	movq	$-0x2, -0x8(%rbp)
1454251ed:     	movq	%rdx, %rdi
1454251f0:     	movl	0x68(%rdx), %eax
1454251f3:     	incl	%eax
1454251f5:     	movq	0x60(%rdx), %rdx
1454251f9:     	cmpq	$0x4, %rdx
1454251fd:     	movl	$0x4, %r8d
145425203:     	cmovbq	%rdx, %r8
145425207:     	movl	%r8d, %edx
14542520a:     	leaq	0x131816b(%rip), %r8    # 0x14673d37c
145425211:     	movss	(%r8,%rdx,4), %xmm0
145425217:     	mulss	0x4ee135(%rip), %xmm0   # 0x145913354
14542521f:     	addss	0x4e2269(%rip), %xmm0   # 0x145907490
145425227:     	cmpl	$0x1, %eax
14542522a:     	adcl	$-0x1, %eax
14542522d:     	movq	%rcx, %rsi
145425230:     	cvtsi2ss	%eax, %xmm1
145425234:     	callq	0x145773283 <.text+0x5772283>
145425239:     	addss	%xmm0, %xmm0
14542523d:     	movss	0x4ee0b7(%rip), %xmm1   # 0x1459132fc
145425245:     	subss	%xmm0, %xmm1
145425249:     	movss	%xmm1, -0x28(%rbp)
14542524e:     	movq	0x38(%rdi), %rax
145425252:     	movq	0x40(%rdi), %rcx
145425256:     	shlq	$0x6, %rcx
14542525a:     	addq	%rax, %rcx
14542525d:     	movq	%rax, -0x40(%rbp)
145425261:     	movq	%rcx, -0x38(%rbp)
145425265:     	leaq	-0x28(%rbp), %rax
145425269:     	movq	%rax, -0x30(%rbp)
14542526d:     	leaq	-0x58(%rbp), %rcx
145425271:     	leaq	-0x40(%rbp), %rdx
145425275:     	callq	0x145544de0 <.text+0x5543de0>
14542527a:     	movq	-0x50(%rbp), %r14
14542527e:     	movq	-0x48(%rbp), %rbx
145425282:     	testq	%rbx, %rbx
145425285:     	movq	%r14, -0x10(%rbp)
145425289:     	je	0x1454252be <.text+0x54242be>
14542528b:     	leaq	(,%rbx,8), %rax
145425293:     	leaq	(%rax,%rax,2), %rdi
145425297:     	callq	0x140002200 <.text+0x1200>
14542529c:     	movl	$0x8, %edx
1454252a1:     	movq	%rdi, %rcx
1454252a4:     	callq	0x1400021c0 <.text+0x11c0>
1454252a9:     	testq	%rax, %rax
1454252ac:     	jne	0x1454252c3 <.text+0x54242c3>
1454252ae:     	movl	$0x8, %ecx
1454252b3:     	movq	%rdi, %rdx
1454252b6:     	callq	0x14590379b <.text+0x590279b>
1454252bb:     	nop
1454252bc:     	ud2
1454252be:     	movl	$0x8, %eax
1454252c3:     	movq	%rbx, %rdx
1454252c6:     	shlq	$0x6, %rdx
1454252ca:     	addq	%r14, %rdx
1454252cd:     	movq	%rbx, -0x28(%rbp)
1454252d1:     	movq	%rax, -0x20(%rbp)
1454252d5:     	leaq	-0x18(%rbp), %rcx
1454252d9:     	movq	$0x0, -0x18(%rbp)
1454252e1:     	movq	%rcx, -0x40(%rbp)
1454252e5:     	movq	$0x0, -0x38(%rbp)
1454252ed:     	movq	%rax, -0x30(%rbp)
1454252f1:     	leaq	-0x40(%rbp), %r8
1454252f5:     	movq	%r14, %rcx
1454252f8:     	callq	0x1455526c0 <.text+0x55516c0>
1454252fd:     	nop
1454252fe:     	movq	-0x18(%rbp), %rax
145425302:     	movq	%rax, 0x10(%rsi)
145425306:     	movups	-0x28(%rbp), %xmm0
14542530a:     	movups	%xmm0, (%rsi)
14542530d:     	movq	-0x58(%rbp), %rdx
145425311:     	testq	%rdx, %rdx
145425314:     	je	0x145425329 <.text+0x5424329>
145425316:     	shlq	$0x6, %rdx
14542531a:     	movl	$0x8, %r8d
145425320:     	movq	-0x10(%rbp), %rcx
145425324:     	callq	0x1400021d0 <.text+0x11d0>
145425329:     	movq	%rsi, %rax
14542532c:     	addq	$0x80, %rsp
145425333:     	popq	%rbx
145425334:     	popq	%rdi
145425335:     	popq	%rsi
145425336:     	popq	%r14
145425338:     	popq	%rbp
145425339:     	retq
