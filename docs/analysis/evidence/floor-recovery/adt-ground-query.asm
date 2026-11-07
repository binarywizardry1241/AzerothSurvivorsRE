
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14568f2e0:     	pushq	%rsi
14568f2e1:     	pushq	%rdi
14568f2e2:     	pushq	%rbx
14568f2e3:     	subq	$0x20, %rsp
14568f2e7:     	testq	%rdx, %rdx
14568f2ea:     	je	0x14568f431 <.text+0x568e431>
14568f2f0:     	movq	%r8, %rsi
14568f2f3:     	movq	%rcx, %rdi
14568f2f6:     	cmpq	$0x100, %rdx            # imm = 0x100
14568f2fd:     	jne	0x14568f408 <.text+0x568e408>
14568f303:     	cmpq	$0x0, 0x10(%rdi)
14568f308:     	je	0x14568f408 <.text+0x568e408>
14568f30e:     	movq	0x8(%rdi), %rax
14568f312:     	movss	(%rax), %xmm1
14568f316:     	subss	(%rsi), %xmm1
14568f31a:     	movss	0x39f79e(%rip), %xmm2   # 0x145a2eac0
14568f322:     	divss	%xmm2, %xmm1
14568f326:     	xorps	%xmm0, %xmm0
14568f329:     	ucomiss	%xmm0, %xmm1
14568f32c:     	jb	0x14568f408 <.text+0x568e408>
14568f332:     	movss	0x2b06d6(%rip), %xmm3   # 0x14593fa10
14568f33a:     	ucomiss	%xmm1, %xmm3
14568f33d:     	jbe	0x14568f408 <.text+0x568e408>
14568f343:     	movss	0x4(%rax), %xmm0
14568f348:     	subss	0x4(%rsi), %xmm0
14568f34d:     	divss	%xmm2, %xmm0
14568f351:     	xorps	%xmm2, %xmm2
14568f354:     	ucomiss	%xmm2, %xmm0
14568f357:     	jb	0x14568f408 <.text+0x568e408>
14568f35d:     	ucomiss	%xmm0, %xmm3
14568f360:     	jbe	0x14568f408 <.text+0x568e408>
14568f366:     	movss	0x277e72(%rip), %xmm2   # 0x1459071e0
14568f36e:     	movaps	%xmm1, %xmm3
14568f371:     	subss	%xmm2, %xmm3
14568f375:     	cvttss2si	%xmm3, %rcx
14568f37a:     	cvttss2si	%xmm1, %r8
14568f37f:     	movq	%r8, %rax
14568f382:     	sarq	$0x3f, %rax
14568f386:     	andq	%rcx, %rax
14568f389:     	orq	%r8, %rax
14568f38c:     	xorl	%r8d, %r8d
14568f38f:     	xorps	%xmm3, %xmm3
14568f392:     	ucomiss	%xmm3, %xmm1
14568f395:     	cmovbq	%r8, %rax
14568f399:     	movss	0x277e43(%rip), %xmm4   # 0x1459071e4
14568f3a1:     	ucomiss	%xmm4, %xmm1
14568f3a4:     	movq	$-0x1, %r9
14568f3ab:     	cmovaq	%r9, %rax
14568f3af:     	shlq	$0x4, %rax
14568f3b3:     	movaps	%xmm0, %xmm1
14568f3b6:     	subss	%xmm2, %xmm1
14568f3ba:     	cvttss2si	%xmm1, %r10
14568f3bf:     	cvttss2si	%xmm0, %r11
14568f3c4:     	movq	%r11, %rcx
14568f3c7:     	sarq	$0x3f, %rcx
14568f3cb:     	andq	%r10, %rcx
14568f3ce:     	orq	%r11, %rcx
14568f3d1:     	ucomiss	%xmm3, %xmm0
14568f3d4:     	cmovbq	%r8, %rcx
14568f3d8:     	ucomiss	%xmm4, %xmm0
14568f3db:     	cmovaq	%r9, %rcx
14568f3df:     	addq	%rax, %rcx
14568f3e2:     	cmpq	$0xff, %rcx
14568f3e9:     	ja	0x14568f408 <.text+0x568e408>
14568f3eb:     	leaq	(%rcx,%rcx,2), %rax
14568f3ef:     	shlq	$0x7, %rax
14568f3f3:     	addq	%rax, %rdi
14568f3f6:     	movq	%rdi, %rcx
14568f3f9:     	movq	%rsi, %rdx
14568f3fc:     	addq	$0x20, %rsp
14568f400:     	popq	%rbx
14568f401:     	popq	%rdi
14568f402:     	popq	%rsi
14568f403:     	jmp	0x145689130 <.text+0x5688130>
14568f408:     	shlq	$0x7, %rdx
14568f40c:     	leaq	(%rdx,%rdx,2), %rbx
14568f410:     	movq	%rdi, %rcx
14568f413:     	movq	%rsi, %rdx
14568f416:     	callq	0x145689130 <.text+0x5688130>
14568f41b:     	testb	$0x1, %al
14568f41d:     	jne	0x14568f433 <.text+0x568e433>
14568f41f:     	addq	$0x180, %rdi            # imm = 0x180
14568f426:     	addq	$-0x180, %rbx           # imm = 0xFE80
14568f42d:     	jne	0x14568f410 <.text+0x568e410>
14568f42f:     	jmp	0x14568f431 <.text+0x568e431>
14568f431:     	xorl	%eax, %eax
14568f433:     	addq	$0x20, %rsp
14568f437:     	popq	%rbx
14568f438:     	popq	%rdi
14568f439:     	popq	%rsi
14568f43a:     	retq
