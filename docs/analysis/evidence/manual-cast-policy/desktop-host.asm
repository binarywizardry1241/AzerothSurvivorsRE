
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14000d230:     	pushq	%rbp
14000d231:     	pushq	%r15
14000d233:     	pushq	%r14
14000d235:     	pushq	%rsi
14000d236:     	pushq	%rdi
14000d237:     	pushq	%rbx
14000d238:     	subq	$0xf8, %rsp
14000d23f:     	leaq	0x80(%rsp), %rbp
14000d247:     	movq	$-0x2, 0x70(%rbp)
14000d24f:     	movq	%rdx, %rsi
14000d252:     	movq	%rcx, %rdi
14000d255:     	movq	$0x1, -0x40(%rbp)
14000d25d:     	movq	$0x1, -0x38(%rbp)
14000d265:     	movw	$0x0, -0x30(%rbp)
14000d26b:     	movq	$0x0, -0x28(%rbp)
14000d273:     	movq	$0x8, -0x20(%rbp)
14000d27b:     	xorps	%xmm0, %xmm0
14000d27e:     	movups	%xmm0, -0x18(%rbp)
14000d282:     	movq	$0x0, -0x8(%rbp)
14000d28a:     	movq	$0x8, (%rbp)
14000d292:     	movq	$0x0, 0x8(%rbp)
14000d29a:     	movq	$-0x1, 0x10(%rbp)
14000d2a2:     	movq	$-0x1, 0x28(%rbp)
14000d2aa:     	movq	$-0x1, 0x40(%rbp)
14000d2b2:     	callq	0x140002200 <.text+0x1200>
14000d2b7:     	movl	$0x98, %ecx
14000d2bc:     	movl	$0x8, %edx
14000d2c1:     	callq	0x1400021c0 <.text+0x11c0>
14000d2c6:     	testq	%rax, %rax
14000d2c9:     	movq	%rdi, 0x60(%rbp)
14000d2cd:     	je	0x14000d4c2 <.text+0xc4c2>
14000d2d3:     	movq	%rax, %r14
14000d2d6:     	leaq	-0x40(%rbp), %rdx
14000d2da:     	movl	$0x98, %r8d
14000d2e0:     	movq	%rax, %rcx
14000d2e3:     	callq	0x1457731ed <.text+0x57721ed>
14000d2e8:     	movq	%r14, 0x58(%rbp)
14000d2ec:     	movq	0x18(%rdi), %rdi
14000d2f0:     	lock
14000d2f1:     	incq	(%r14)
14000d2f4:     	jle	0x14000d4fa <.text+0xc4fa>
14000d2fa:     	movb	$0x1, 0x6f(%rbp)
14000d2fe:     	movb	$0x1, 0x6e(%rbp)
14000d302:     	leaq	-0x40(%rbp), %rcx
14000d306:     	movq	%r14, %rdx
14000d309:     	callq	0x145424330 <.text+0x5423330>
14000d30e:     	nop
14000d30f:     	callq	0x140002200 <.text+0x1200>
14000d314:     	movl	$0x20, %ecx
14000d319:     	movl	$0x8, %edx
14000d31e:     	callq	0x1400021c0 <.text+0x11c0>
14000d323:     	testq	%rax, %rax
14000d326:     	je	0x14000d4d4 <.text+0xc4d4>
14000d32c:     	movq	0x60(%rbp), %rcx
14000d330:     	addq	$0x18, %rcx
14000d334:     	movups	-0x40(%rbp), %xmm0
14000d338:     	movups	-0x30(%rbp), %xmm1
14000d33c:     	movups	%xmm1, 0x10(%rax)
14000d340:     	movups	%xmm0, (%rax)
14000d343:     	movq	0x30(%rcx), %rdx
14000d347:     	movq	%rdx, -0x10(%rbp)
14000d34b:     	movups	(%rcx), %xmm0
14000d34e:     	movups	0x10(%rcx), %xmm1
14000d352:     	movups	0x20(%rcx), %xmm2
14000d356:     	movaps	%xmm2, -0x20(%rbp)
14000d35a:     	movaps	%xmm1, -0x30(%rbp)
14000d35e:     	movaps	%xmm0, -0x40(%rbp)
14000d362:     	movb	$0x0, 0x6f(%rbp)
14000d366:     	movb	$0x1, 0x6e(%rbp)
14000d36a:     	leaq	0x58fabc7(%rip), %rdx   # 0x145907f38
14000d371:     	leaq	-0x40(%rbp), %r8
14000d375:     	movq	%rax, %rcx
14000d378:     	movq	%rsi, %r9
14000d37b:     	callq	0x1454241d0 <.text+0x54231d0>
14000d380:     	nop
14000d381:     	negq	%rdi
14000d384:     	seto	%bl
14000d387:     	leaq	0x58fabf2(%rip), %rax   # 0x145907f80
14000d38e:     	movq	%rax, -0x40(%rbp)
14000d392:     	movq	$0x5, -0x38(%rbp)
14000d39a:     	leaq	0x58fabe4(%rip), %rax   # 0x145907f85
14000d3a1:     	movq	%rax, -0x30(%rbp)
14000d3a5:     	movq	$0x15, -0x28(%rbp)
14000d3ad:     	leaq	0x58fabe6(%rip), %rax   # 0x145907f9a
14000d3b4:     	movq	%rax, -0x20(%rbp)
14000d3b8:     	movq	$0x28, -0x18(%rbp)
14000d3c0:     	leaq	0x58fabfb(%rip), %rax   # 0x145907fc2
14000d3c7:     	movq	%rax, -0x10(%rbp)
14000d3cb:     	movq	$0x8, -0x8(%rbp)
14000d3d3:     	leaq	0x58fabf0(%rip), %rax   # 0x145907fca
14000d3da:     	movq	%rax, (%rbp)
14000d3de:     	movq	$0xa, 0x8(%rbp)
14000d3e6:     	leaq	0x58fabe7(%rip), %rax   # 0x145907fd4
14000d3ed:     	movq	%rax, 0x10(%rbp)
14000d3f1:     	movq	$0x7, 0x18(%rbp)
14000d3f9:     	movq	$0x1, 0x20(%rbp)
14000d401:     	movq	$0x0, 0x28(%rbp)
14000d409:     	movb	$0x0, 0x30(%rbp)
14000d40d:     	movq	%r14, -0x58(%rbp)
14000d411:     	seto	-0x50(%rbp)
14000d415:     	callq	0x140002200 <.text+0x1200>
14000d41a:     	movl	$0x10, %ecx
14000d41f:     	movl	$0x8, %edx
14000d424:     	callq	0x1400021c0 <.text+0x11c0>
14000d429:     	testq	%rax, %rax
14000d42c:     	je	0x14000d4e6 <.text+0xc4e6>
14000d432:     	movq	%r14, (%rax)
14000d435:     	movb	%bl, 0x8(%rax)
14000d438:     	movb	$0x0, 0x6f(%rbp)
14000d43c:     	movb	$0x0, 0x6e(%rbp)
14000d440:     	leaq	0x58fab99(%rip), %r8    # 0x145907fe0
14000d447:     	leaq	-0x40(%rbp), %rcx
14000d44b:     	movq	%rax, %rdx
14000d44e:     	callq	0x140582910 <.text+0x581910>
14000d453:     	nop
14000d454:     	movl	%eax, %ebx
14000d456:     	movq	0x60(%rbp), %r15
14000d45a:     	movq	0x8(%r15), %rsi
14000d45e:     	movq	0x10(%r15), %rdi
14000d462:     	testq	%rdi, %rdi
14000d465:     	je	0x14000d492 <.text+0xc492>
14000d467:     	leaq	0x18(%rsi), %r14
14000d46b:     	jmp	0x14000d479 <.text+0xc479>
14000d46d:     	nopl	(%rax)
14000d470:     	addq	$0x28, %r14
14000d474:     	decq	%rdi
14000d477:     	je	0x14000d492 <.text+0xc492>
14000d479:     	movq	-0x8(%r14), %rdx
14000d47d:     	testq	%rdx, %rdx
14000d480:     	je	0x14000d470 <.text+0xc470>
14000d482:     	movq	(%r14), %rcx
14000d485:     	movl	$0x1, %r8d
14000d48b:     	callq	0x1400021d0 <.text+0x11d0>
14000d490:     	jmp	0x14000d470 <.text+0xc470>
14000d492:     	movq	(%r15), %rax
14000d495:     	testq	%rax, %rax
14000d498:     	je	0x14000d4b0 <.text+0xc4b0>
14000d49a:     	shlq	$0x3, %rax
14000d49e:     	leaq	(%rax,%rax,4), %rdx
14000d4a2:     	movl	$0x8, %r8d
14000d4a8:     	movq	%rsi, %rcx
14000d4ab:     	callq	0x1400021d0 <.text+0x11d0>
14000d4b0:     	movl	%ebx, %eax
14000d4b2:     	addq	$0xf8, %rsp
14000d4b9:     	popq	%rbx
14000d4ba:     	popq	%rdi
14000d4bb:     	popq	%rsi
14000d4bc:     	popq	%r14
14000d4be:     	popq	%r15
14000d4c0:     	popq	%rbp
14000d4c1:     	retq
14000d4c2:     	movl	$0x8, %ecx
14000d4c7:     	movl	$0x98, %edx
14000d4cc:     	callq	0x145903781 <.text+0x5902781>
14000d4d1:     	nop
14000d4d2:     	jmp	0x14000d4fa <.text+0xc4fa>
14000d4d4:     	movl	$0x8, %ecx
14000d4d9:     	movl	$0x20, %edx
14000d4de:     	callq	0x145903781 <.text+0x5902781>
14000d4e3:     	nop
14000d4e4:     	jmp	0x14000d4fa <.text+0xc4fa>
14000d4e6:     	movq	%r14, -0x48(%rbp)
14000d4ea:     	movl	$0x8, %ecx
14000d4ef:     	movl	$0x10, %edx
14000d4f4:     	callq	0x145903781 <.text+0x5902781>
14000d4f9:     	nop
14000d4fa:     	ud2
