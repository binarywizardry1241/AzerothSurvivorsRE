
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540f1c0:     	pushq	%rbp
14540f1c1:     	pushq	%r15
14540f1c3:     	pushq	%r14
14540f1c5:     	pushq	%rsi
14540f1c6:     	pushq	%rdi
14540f1c7:     	pushq	%rbx
14540f1c8:     	subq	$0xa8, %rsp
14540f1cf:     	leaq	0x80(%rsp), %rbp
14540f1d7:     	movaps	%xmm6, 0x10(%rbp)
14540f1db:     	movq	$-0x2, 0x8(%rbp)
14540f1e3:     	movq	%rdx, %rdi
14540f1e6:     	movq	%rcx, %rsi
14540f1e9:     	testq	%r8, %r8
14540f1ec:     	je	0x14540f226 <.text+0x540e226>
14540f1ee:     	movq	(%rdi), %rdx
14540f1f1:     	movzbl	0x75(%rdx), %eax
14540f1f5:     	cmpl	$0x9, %eax
14540f1f8:     	je	0x14540f261 <.text+0x540e261>
14540f1fa:     	cmpl	$0xb, %eax
14540f1fd:     	jne	0x14540f2af <.text+0x540e2af>
14540f203:     	movq	0x30(%rdx), %rax
14540f207:     	movq	0x38(%rdx), %rcx
14540f20b:     	xorl	%r9d, %r9d
14540f20e:     	nop
14540f210:     	cmpq	%r9, %rcx
14540f213:     	je	0x14540f2bc <.text+0x540e2bc>
14540f219:     	cmpb	$0x0, (%rax,%r9)
14540f21e:     	leaq	0x1(%r9), %r9
14540f222:     	jne	0x14540f210 <.text+0x540e210>
14540f224:     	jmp	0x14540f273 <.text+0x540e273>
14540f226:     	movq	0x50(%rdi), %rax
14540f22a:     	movq	%rax, 0x50(%rsi)
14540f22e:     	movups	0x40(%rdi), %xmm0
14540f232:     	movups	%xmm0, 0x40(%rsi)
14540f236:     	movups	(%rdi), %xmm0
14540f239:     	movups	0x10(%rdi), %xmm1
14540f23d:     	movups	0x20(%rdi), %xmm2
14540f241:     	movups	0x30(%rdi), %xmm3
14540f245:     	movups	%xmm3, 0x30(%rsi)
14540f249:     	movups	%xmm2, 0x20(%rsi)
14540f24d:     	movups	%xmm1, 0x10(%rsi)
14540f251:     	movups	%xmm0, (%rsi)
14540f254:     	movq	$-0x1, 0x58(%rsi)
14540f25c:     	jmp	0x14540f3db <.text+0x540e3db>
14540f261:     	movl	0x68(%rdx), %eax
14540f264:     	cmpl	$0xc, %eax
14540f267:     	ja	0x14540f2bc <.text+0x540e2bc>
14540f269:     	movl	$0x10c0, %ecx           # imm = 0x10C0
14540f26e:     	btl	%eax, %ecx
14540f271:     	jae	0x14540f2bc <.text+0x540e2bc>
14540f273:     	cmpq	$0x6, %r8
14540f277:     	jae	0x14540f3f2 <.text+0x540e3f2>
14540f27d:     	leaq	0x130dd24(%rip), %rax   # 0x14671cfa8
14540f284:     	movss	-0x4(%rax,%r8,4), %xmm2
14540f28b:     	movss	0x4dc1ed(%rip), %xmm0   # 0x1458eb480
14540f293:     	addss	%xmm2, %xmm0
14540f297:     	mulss	0x10(%rdi), %xmm0
14540f29c:     	movss	%xmm0, 0x10(%rdi)
14540f2a1:     	leaq	-0x50(%rbp), %rcx
14540f2a5:     	callq	0x14540ee70 <.text+0x540de70>
14540f2aa:     	jmp	0x14540f39d <.text+0x540e39d>
14540f2af:     	movss	0x44(%rdx), %xmm0
14540f2b4:     	xorps	%xmm1, %xmm1
14540f2b7:     	ucomiss	%xmm1, %xmm0
14540f2ba:     	ja	0x14540f273 <.text+0x540e273>
14540f2bc:     	cmpq	$0x6, %r8
14540f2c0:     	jae	0x14540f3fe <.text+0x540e3fe>
14540f2c6:     	leaq	0x130dc6f(%rip), %rax   # 0x14671cf3c
14540f2cd:     	movss	-0x4(%rax,%r8,4), %xmm6
14540f2d4:     	movss	0x4dc1a4(%rip), %xmm0   # 0x1458eb480
14540f2dc:     	subss	%xmm6, %xmm0
14540f2e0:     	mulss	0x14(%rdi), %xmm0
14540f2e5:     	movss	%xmm0, 0x14(%rdi)
14540f2ea:     	leaq	0x130dca7(%rip), %rbx   # 0x14671cf98
14540f2f1:     	movl	$0xe, %r14d
14540f2f7:     	movl	$0xe, %edx
14540f2fc:     	movq	%rbx, %rcx
14540f2ff:     	callq	0x145452400 <.text+0x5451400>
14540f304:     	testq	%rax, %rax
14540f307:     	cmovneq	%rax, %rbx
14540f30b:     	cmovneq	%rdx, %r14
14540f30f:     	mulss	0x4dc215(%rip), %xmm6   # 0x1458eb52c
14540f317:     	movss	%xmm6, 0x4(%rbp)
14540f31c:     	leaq	0x4(%rbp), %rax
14540f320:     	movq	%rax, -0x20(%rbp)
14540f324:     	leaq	0x30dfb5(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14540f32b:     	movq	%rax, -0x18(%rbp)
14540f32f:     	leaq	0x130dbbf(%rip), %rdx   # 0x14671cef5
14540f336:     	leaq	-0x38(%rbp), %r15
14540f33a:     	leaq	-0x20(%rbp), %r8
14540f33e:     	movq	%r15, %rcx
14540f341:     	callq	0x14570bf80 <.text+0x570af80>
14540f346:     	leaq	0x130dbd3(%rip), %rax   # 0x14671cf20
14540f34d:     	movq	%rax, -0x20(%rbp)
14540f351:     	movq	$0x1, -0x18(%rbp)
14540f359:     	movq	%r15, -0x10(%rbp)
14540f35d:     	leaq	0x130db9c(%rip), %rax   # 0x14671cf00
14540f364:     	movq	%rax, -0x8(%rbp)
14540f368:     	movq	$0x1, 0x20(%rsp)
14540f371:     	leaq	-0x50(%rbp), %rcx
14540f375:     	leaq	-0x20(%rbp), %r9
14540f379:     	movq	%rbx, %rdx
14540f37c:     	movq	%r14, %r8
14540f37f:     	callq	0x145452790 <.text+0x5451790>
14540f384:     	nop
14540f385:     	movq	-0x38(%rbp), %rdx
14540f389:     	testq	%rdx, %rdx
14540f38c:     	je	0x14540f39d <.text+0x540e39d>
14540f38e:     	movq	-0x30(%rbp), %rcx
14540f392:     	movl	$0x1, %r8d
14540f398:     	callq	0x1400021d0 <.text+0x11d0>
14540f39d:     	movq	-0x40(%rbp), %rax
14540f3a1:     	movq	%rax, 0x68(%rsi)
14540f3a5:     	movups	-0x50(%rbp), %xmm0
14540f3a9:     	movups	%xmm0, 0x58(%rsi)
14540f3ad:     	movups	(%rdi), %xmm0
14540f3b0:     	movups	0x10(%rdi), %xmm1
14540f3b4:     	movups	0x20(%rdi), %xmm2
14540f3b8:     	movups	0x30(%rdi), %xmm3
14540f3bc:     	movups	%xmm0, (%rsi)
14540f3bf:     	movups	%xmm1, 0x10(%rsi)
14540f3c3:     	movups	%xmm2, 0x20(%rsi)
14540f3c7:     	movups	%xmm3, 0x30(%rsi)
14540f3cb:     	movups	0x40(%rdi), %xmm0
14540f3cf:     	movups	%xmm0, 0x40(%rsi)
14540f3d3:     	movq	0x50(%rdi), %rax
14540f3d7:     	movq	%rax, 0x50(%rsi)
14540f3db:     	movq	%rsi, %rax
14540f3de:     	movaps	0x10(%rbp), %xmm6
14540f3e2:     	addq	$0xa8, %rsp
14540f3e9:     	popq	%rbx
14540f3ea:     	popq	%rdi
14540f3eb:     	popq	%rsi
14540f3ec:     	popq	%r14
14540f3ee:     	popq	%r15
14540f3f0:     	popq	%rbp
14540f3f1:     	retq
14540f3f2:     	decq	%r8
14540f3f5:     	leaq	0x130dbc4(%rip), %rax   # 0x14671cfc0
14540f3fc:     	jmp	0x14540f408 <.text+0x540e408>
14540f3fe:     	decq	%r8
14540f401:     	leaq	0x130db78(%rip), %rax   # 0x14671cf80
14540f408:     	movl	$0x5, %edx
14540f40d:     	movq	%r8, %rcx
14540f410:     	movq	%rax, %r8
14540f413:     	callq	0x1458e75b3 <.text+0x58e65b3>
14540f418:     	ud2
