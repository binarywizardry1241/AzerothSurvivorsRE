
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a54d2:     	leaq	0x48(%rax), %r12
1454a54d6:     	cmpl	$0x0, 0x20(%rax)
1454a54da:     	jne	0x1454a5450 <.text+0x54a4450>
1454a54e0:     	cmpb	$0x0, 0x18(%rax)
1454a54e4:     	jne	0x1454a5450 <.text+0x54a4450>
1454a54ea:     	movsd	0x34(%rax), %xmm0
1454a54ef:     	subps	%xmm7, %xmm0
1454a54f2:     	mulps	%xmm0, %xmm0
1454a54f5:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a54f9:     	addss	%xmm0, %xmm1
1454a54fd:     	xorps	%xmm15, %xmm15
1454a5501:     	sqrtss	%xmm1, %xmm15
1454a5506:     	ucomiss	%xmm15, %xmm9
1454a550a:     	setb	%dl
1454a550d:     	movl	%ecx, %r8d
1454a5510:     	notb	%r8b
1454a5513:     	testb	%dl, %r8b
1454a5516:     	jne	0x1454a5450 <.text+0x54a4450>
1454a551c:     	movb	%r10b, 0x310(%rbp)
1454a5523:     	movaps	%xmm11, %xmm0
1454a5527:     	testb	$0x1, %cl
1454a552a:     	jne	0x1454a5530 <.text+0x54a4530>
1454a552c:     	movaps	%xmm12, %xmm0
1454a5530:     	leaq	0x34(%rax), %rcx
1454a5534:     	divss	%xmm0, %xmm15
1454a5539:     	maxss	%xmm14, %xmm15
1454a553e:     	movaps	%xmm8, %xmm0
1454a5542:     	addss	%xmm15, %xmm0
1454a5547:     	movl	$0x1, 0x18(%rax)
1454a554e:     	movss	%xmm0, 0x1c(%rax)
