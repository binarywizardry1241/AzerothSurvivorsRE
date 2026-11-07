
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592d39d:     	movq	0x970(%r11), %rax
14592d3a4:     	movq	0x958(%r11), %rcx
14592d3ab:     	movq	0x960(%r11), %rdx
14592d3b2:     	leaq	(%rax,%rcx), %r8
14592d3b6:     	rolq	$0x17, %r8
14592d3ba:     	addq	%rcx, %r8
14592d3bd:     	movq	%rdx, %r9
14592d3c0:     	shlq	$0x11, %r9
14592d3c4:     	movq	0x968(%r11), %r10
14592d3cb:     	xorq	%rcx, %r10
14592d3ce:     	xorq	%rdx, %rax
14592d3d1:     	xorq	%r10, %rdx
14592d3d4:     	movq	%rdx, 0x960(%r11)
14592d3db:     	xorq	%rax, %rcx
14592d3de:     	movq	%rcx, 0x958(%r11)
14592d3e5:     	xorq	%r9, %r10
14592d3e8:     	movq	%r10, 0x968(%r11)
14592d3ef:     	rolq	$0x2d, %rax
14592d3f3:     	shrq	$0x28, %r8
14592d3f7:     	xorps	%xmm0, %xmm0
14592d3fa:     	cvtsi2ss	%r8d, %xmm0
14592d3ff:     	movq	%rax, 0x970(%r11)
14592d406:     	mulss	%xmm14, %xmm0
14592d40b:     	ucomiss	%xmm8, %xmm0
14592d40f:     	jae	0x145929e10 <.text+0x5928e10>
14592d415:     	cmpb	$0x1, %r13b
14592d419:     	adcb	$-0x1, %r13b
14592d41d:     	movzbl	%r13b, %eax
14592d421:     	xorps	%xmm0, %xmm0
14592d424:     	cvtsi2ss	%eax, %xmm0
14592d428:     	mulss	0x4400e0(%rip), %xmm0   # 0x145d6d510
14592d430:     	addss	%xmm15, %xmm0
14592d435:     	movq	0x1e0(%rbp), %rax
14592d43c:     	movq	%rax, 0x20(%rsp)
14592d441:     	movss	%xmm0, 0x28(%rsp)
14592d447:     	movq	0x218(%rbp), %rcx
14592d44e:     	movq	0xf0(%rbp), %rdx
14592d455:     	movl	$0x1, %r8d
14592d45b:     	movaps	%xmm9, %xmm3
14592d45f:     	callq	0x14594e4f0 <.text+0x594d4f0>
14592d464:     	nop
14592d465:     	jmp	0x145929e10 <.text+0x5928e10>
14592d46a:     	cmpq	0x90(%r9), %r8
14592d471:     	jae	0x145929e10 <.text+0x5928e10>
14592d477:     	movq	0x218(%rbp), %rax
14592d47e:     	movq	0x88(%rax), %rax
14592d485:     	movq	0x1e0(%rbp), %rdx
14592d48c:     	movl	(%rax,%rdx,4), %ecx
14592d48f:     	incl	%ecx
14592d491:     	movl	%ecx, (%rax,%rdx,4)
14592d494:     	cmpl	0x208(%rbp), %ecx
14592d49a:     	jae	0x14592d4be <.text+0x592c4be>
14592d49c:     	movq	0x48(%rbp), %rcx
14592d4a0:     	callq	0x1458e96b0 <.text+0x58e86b0>
14592d4a5:     	shrl	$0x8, %eax
14592d4a8:     	xorps	%xmm0, %xmm0
14592d4ab:     	cvtsi2ss	%eax, %xmm0
14592d4af:     	mulss	%xmm14, %xmm0
14592d4b4:     	ucomiss	%xmm8, %xmm0
14592d4b8:     	jae	0x145929e10 <.text+0x5928e10>
14592d4be:     	movq	0x218(%rbp), %r8
14592d4c5:     	movq	0x90(%r8), %rdx
14592d4cc:     	movq	0x1e0(%rbp), %rcx
14592d4d3:     	cmpq	%rdx, %rcx
14592d4d6:     	jae	0x14592d803 <.text+0x592c803>
14592d4dc:     	movq	0x88(%r8), %rax
14592d4e3:     	movl	$0x0, (%rax,%rcx,4)
14592d4ea:     	cmpq	0x78(%r8), %rcx
14592d4ee:     	movss	0x1f0(%rbp), %xmm0
14592d4f6:     	jae	0x14592d50f <.text+0x592c50f>
14592d4f8:     	movq	0x70(%r8), %rax
14592d4fc:     	mulss	0x480(%r8), %xmm10
14592d505:     	addss	%xmm10, %xmm0
14592d50a:     	movss	%xmm0, (%rax,%rcx,4)
14592d50f:     	movq	%rcx, 0x20(%rsp)
14592d514:     	movl	$0x3f800000, 0x28(%rsp) # imm = 0x3F800000
14592d51c:     	movq	%r8, %rcx
14592d51f:     	movq	0x120(%rbp), %rdx
14592d526:     	movl	$0x1, %r8d
14592d52c:     	movdqa	%xmm9, %xmm3
14592d531:     	callq	0x14594e4f0 <.text+0x594d4f0>
14592d536:     	nop
14592d537:     	jmp	0x145929e10 <.text+0x5928e10>
