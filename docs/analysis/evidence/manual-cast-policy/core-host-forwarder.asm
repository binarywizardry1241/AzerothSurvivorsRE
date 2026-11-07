
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454241d0:     	pushq	%rbp
1454241d1:     	pushq	%rsi
1454241d2:     	subq	$0x88, %rsp
1454241d9:     	leaq	0x80(%rsp), %rbp
1454241e1:     	movq	$-0x2, (%rbp)
1454241e9:     	movq	%r9, %rsi
1454241ec:     	movq	%r8, -0x10(%rbp)
1454241f0:     	movq	%rdx, -0x20(%rbp)
1454241f4:     	movq	%rcx, -0x18(%rbp)
1454241f8:     	movb	$0x1, -0x1(%rbp)
1454241fc:     	callq	0x145458650 <.text+0x5457650>
145424201:     	nop
145424202:     	movb	$0x1, -0x1(%rbp)
145424206:     	callq	0x14551bac0 <.text+0x551aac0>
14542420b:     	nop
14542420c:     	movq	0x26162cd(%rip), %rax   # 0x147a3a4e0
145424213:     	cmpq	$0xd, %rax
145424217:     	movl	$0xd, %ecx
14542421c:     	cmovbq	%rax, %rcx
145424220:     	imulq	$0x38, %rcx, %rax
145424224:     	leaq	0x15ad355(%rip), %rcx   # 0x1469d1580
14542422b:     	movq	(%rax,%rcx), %rcx
14542422f:     	movb	$0x1, -0x1(%rbp)
145424233:     	movl	$0x2, %edx
145424238:     	callq	0x145517f60 <.text+0x5516f60>
14542423d:     	nop
14542423e:     	movb	$0x1, -0x1(%rbp)
145424242:     	callq	0x145486990 <.text+0x5485990>
145424247:     	nop
145424248:     	movb	$0x1, -0x1(%rbp)
14542424c:     	callq	0x14551d410 <.text+0x551c410>
145424251:     	nop
145424252:     	movb	$0x1, -0x1(%rbp)
145424256:     	callq	0x14551c8c0 <.text+0x551b8c0>
14542425b:     	nop
14542425c:     	movb	$0x1, -0x1(%rbp)
145424260:     	callq	0x14551cd20 <.text+0x551bd20>
145424265:     	nop
145424266:     	movb	$0x1, -0x1(%rbp)
14542426a:     	callq	0x145530670 <.text+0x552f670>
14542426f:     	nop
145424270:     	movq	-0x10(%rbp), %rcx
145424274:     	movq	0x30(%rcx), %rax
145424278:     	movq	%rax, -0x30(%rbp)
14542427c:     	movups	(%rcx), %xmm0
14542427f:     	movups	0x10(%rcx), %xmm1
145424283:     	movups	0x20(%rcx), %xmm2
145424287:     	movaps	%xmm2, -0x40(%rbp)
14542428b:     	movaps	%xmm1, -0x50(%rbp)
14542428f:     	movaps	%xmm0, -0x60(%rbp)
145424293:     	movb	$0x0, -0x1(%rbp)
145424297:     	leaq	-0x60(%rbp), %r8
14542429b:     	movq	-0x18(%rbp), %rcx
14542429f:     	movq	-0x20(%rbp), %rdx
1454242a3:     	movq	%rsi, %r9
1454242a6:     	callq	0x145452f80 <.text+0x5451f80>
1454242ab:     	nop
1454242ac:     	movb	$0x0, -0x1(%rbp)
1454242b0:     	movq	%rax, %rcx
1454242b3:     	callq	0x1454688c0 <.text+0x54678c0>
1454242b8:     	nop
1454242b9:     	addq	$0x88, %rsp
1454242c0:     	popq	%rsi
1454242c1:     	popq	%rbp
1454242c2:     	retq
