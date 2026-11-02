
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d42f0:     	movss	0x8e4(%rcx), %xmm0
1454d42f8:     	movq	0x4c8(%rcx), %rax
1454d42ff:     	imulq	$0x160, 0x4d0(%rcx), %r9 # imm = 0x160
1454d430a:     	xorl	%r8d, %r8d
1454d430d:     	movq	%rax, %r10
1454d4310:     	cmpq	%r8, %r9
1454d4313:     	je	0x1454d4355 <.text+0x54d3355>
1454d4315:     	addq	$0x160, %r8             # imm = 0x160
1454d431c:     	cmpq	%rdx, 0x88(%r10)
1454d4323:     	leaq	0x160(%r10), %r10
1454d432a:     	jne	0x1454d4310 <.text+0x54d3310>
1454d432c:     	cmpb	$0x0, -0xf8(%rax,%r8)
1454d4335:     	jne	0x1454d4355 <.text+0x54d3355>
1454d4337:     	ucomiss	-0x20(%rax,%r8), %xmm0
1454d433d:     	jb	0x1454d4355 <.text+0x54d3355>
1454d433f:     	cmpq	$-0x1, -0x120(%rax,%r8)
1454d4348:     	je	0x1454d4358 <.text+0x54d3358>
1454d434a:     	cmpb	$0x0, -0x100(%rax,%r8)
1454d4353:     	jne	0x1454d4358 <.text+0x54d3358>
1454d4355:     	xorl	%eax, %eax
1454d4357:     	retq
1454d4358:     	movsd	0x3e8(%rcx), %xmm1
1454d4360:     	movss	-0x38(%rax,%r8), %xmm4
1454d4367:     	xorps	%xmm3, %xmm3
1454d436a:     	ucomiss	%xmm4, %xmm3
1454d436d:     	jae	0x1454d43a7 <.text+0x54d33a7>
1454d436f:     	subss	-0x3c(%rax,%r8), %xmm0
1454d4376:     	divss	%xmm4, %xmm0
1454d437a:     	maxss	%xmm0, %xmm3
1454d437e:     	movss	0x4170fa(%rip), %xmm0   # 0x1458eb480
1454d4386:     	minss	%xmm3, %xmm0
1454d438a:     	movsd	-0x54(%rax,%r8), %xmm3
1454d4391:     	movsd	-0x48(%rax,%r8), %xmm4
1454d4398:     	subps	%xmm3, %xmm4
1454d439b:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454d439f:     	mulps	%xmm4, %xmm0
1454d43a2:     	addps	%xmm3, %xmm0
1454d43a5:     	jmp	0x1454d43ae <.text+0x54d33ae>
1454d43a7:     	movsd	-0x48(%rax,%r8), %xmm0
1454d43ae:     	subps	%xmm0, %xmm1
1454d43b1:     	mulps	%xmm1, %xmm1
1454d43b4:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454d43b8:     	addss	%xmm1, %xmm0
1454d43bc:     	mulss	0x428874(%rip), %xmm2   # 0x1458fcc38
1454d43c4:     	sqrtss	%xmm0, %xmm0
1454d43c8:     	ucomiss	%xmm0, %xmm2
1454d43cb:     	setae	%al
1454d43ce:     	retq
