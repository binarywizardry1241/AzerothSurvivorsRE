
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140fe0160:     	pushq	%rbp
140fe0161:     	pushq	%r15
140fe0163:     	pushq	%r14
140fe0165:     	pushq	%r12
140fe0167:     	pushq	%rsi
140fe0168:     	pushq	%rdi
140fe0169:     	pushq	%rbx
140fe016a:     	subq	$0xd0, %rsp
140fe0171:     	leaq	0x80(%rsp), %rbp
140fe0179:     	movq	$-0x2, 0x48(%rbp)
140fe0181:     	movq	%r8, %rbx
140fe0184:     	movq	%rdx, %rdi
140fe0187:     	movq	%rcx, %rsi
140fe018a:     	cmpl	$0x2, 0x20(%rdx)
140fe018e:     	jne	0x140fe025c <.text+0xfdf25c>
140fe0194:     	leaq	0x40(%rbx), %r15
140fe0198:     	leaq	0x5a8(%rbx), %r12
140fe019f:     	movq	%r15, -0x38(%rbp)
140fe01a3:     	movq	%r12, -0x30(%rbp)
140fe01a7:     	movq	$0x0, -0x50(%rbp)
140fe01af:     	movq	$0x8, -0x48(%rbp)
140fe01b7:     	movq	$0x0, -0x40(%rbp)
140fe01bf:     	leaq	0x4ad06fa(%rip), %rdx   # 0x145ab08c0
140fe01c6:     	leaq	-0x50(%rbp), %rcx
140fe01ca:     	callq	0x140cce370 <.text+0xccd370>
140fe01cf:     	nop
140fe01d0:     	movq	%rax, %r14
140fe01d3:     	movq	-0x50(%rbp), %rdx
140fe01d7:     	testq	%rdx, %rdx
140fe01da:     	je	0x140fe01ef <.text+0xfdf1ef>
140fe01dc:     	movq	-0x48(%rbp), %rcx
140fe01e0:     	shlq	$0x3, %rdx
140fe01e4:     	movl	$0x8, %r8d
140fe01ea:     	callq	0x1400021d0 <.text+0x11d0>
140fe01ef:     	movq	%r15, -0x38(%rbp)
140fe01f3:     	movq	%r12, -0x30(%rbp)
140fe01f7:     	movq	$0x0, -0x50(%rbp)
140fe01ff:     	movq	$0x8, -0x48(%rbp)
140fe0207:     	movq	$0x0, -0x40(%rbp)
140fe020f:     	leaq	0x4ad196a(%rip), %rdx   # 0x145ab1b80
140fe0216:     	leaq	-0x50(%rbp), %rcx
140fe021a:     	callq	0x140cf52c0 <.text+0xcf42c0>
140fe021f:     	nop
140fe0220:     	movq	%rax, %r15
140fe0223:     	movq	-0x50(%rbp), %rdx
140fe0227:     	testq	%rdx, %rdx
140fe022a:     	je	0x140fe023f <.text+0xfdf23f>
140fe022c:     	movq	-0x48(%rbp), %rcx
140fe0230:     	shlq	$0x3, %rdx
140fe0234:     	movl	$0x8, %r8d
140fe023a:     	callq	0x1400021d0 <.text+0x11d0>
140fe023f:     	movq	0x5a0(%rbx), %rax
140fe0246:     	movq	%rax, 0x8(%rdi)
140fe024a:     	movq	%r14, 0x10(%rdi)
140fe024e:     	movq	%r15, 0x18(%rdi)
140fe0252:     	movq	$0x0, 0x20(%rdi)
140fe025a:     	jmp	0x140fe0275 <.text+0xfdf275>
140fe025c:     	movq	0x5a0(%rbx), %rax
140fe0263:     	movq	%rax, -0x50(%rbp)
140fe0267:     	cmpq	%rax, 0x8(%rdi)
140fe026b:     	jne	0x140fe0325 <.text+0xfdf325>
140fe0271:     	movq	0x10(%rdi), %r14
140fe0275:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
140fe027a:     	addl	0x5b0(%rbx), %eax
140fe0280:     	movl	%eax, (%rdi)
140fe0282:     	movq	$0x10, -0x38(%rbp)
140fe028a:     	xorps	%xmm0, %xmm0
140fe028d:     	movups	%xmm0, -0x30(%rbp)
140fe0291:     	movq	$0x10, -0x20(%rbp)
140fe0299:     	movups	%xmm0, -0x18(%rbp)
140fe029d:     	movq	$0x10, -0x8(%rbp)
140fe02a5:     	movups	%xmm0, (%rbp)
140fe02a9:     	movq	$0x10, 0x10(%rbp)
140fe02b1:     	movups	%xmm0, 0x18(%rbp)
140fe02b5:     	movq	$0x10, 0x28(%rbp)
140fe02bd:     	movq	$0x0, -0x50(%rbp)
140fe02c5:     	movups	%xmm0, 0x30(%rbp)
140fe02c9:     	movl	$0x0, 0x40(%rbp)
140fe02d0:     	movq	$0x8, -0x48(%rbp)
140fe02d8:     	movq	$0x0, -0x40(%rbp)
140fe02e0:     	leaq	-0x50(%rbp), %rcx
140fe02e4:     	movq	%r14, %rdx
140fe02e7:     	callq	0x144e67790 <.text+0x4e66790>
140fe02ec:     	nop
140fe02ed:     	leaq	0x18(%rdi), %rcx
140fe02f1:     	leaq	-0x50(%rbp), %r8
140fe02f5:     	movq	%rdi, %rdx
140fe02f8:     	callq	0x140d60910 <.text+0xd5f910>
140fe02fd:     	nop
140fe02fe:     	leaq	-0x50(%rbp), %rdx
140fe0302:     	movl	$0x98, %r8d
140fe0308:     	movq	%rsi, %rcx
140fe030b:     	callq	0x145756ddd <.text+0x5755ddd>
140fe0310:     	movq	%rsi, %rax
140fe0313:     	addq	$0xd0, %rsp
140fe031a:     	popq	%rbx
140fe031b:     	popq	%rdi
140fe031c:     	popq	%rsi
140fe031d:     	popq	%r12
140fe031f:     	popq	%r14
140fe0321:     	popq	%r15
140fe0323:     	popq	%rbp
140fe0324:     	retq
140fe0325:     	addq	$0x8, %rdi
140fe0329:     	leaq	0x4b07300(%rip), %rax   # 0x145ae7630
140fe0330:     	movq	%rax, 0x28(%rsp)
140fe0335:     	movq	$0x83, 0x20(%rsp)
140fe033e:     	leaq	0x4b072aa(%rip), %r9    # 0x145ae75ef
140fe0345:     	leaq	-0x50(%rbp), %r8
140fe0349:     	xorl	%ecx, %ecx
140fe034b:     	movq	%rdi, %rdx
140fe034e:     	callq	0x14589fabd <.text+0x589eabd>
140fe0353:     	ud2
