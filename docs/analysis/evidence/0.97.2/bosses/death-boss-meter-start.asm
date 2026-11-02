
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c35ee:     	cmpq	$-0x1, %r13
1454c35f2:     	je	0x1454c368f <.text+0x54c268f>
1454c35f8:     	cmpl	$0x0, 0x654(%rsi)
1454c35ff:     	je	0x1454c3668 <.text+0x54c2668>
1454c3601:     	movss	0x8e4(%rsi), %xmm0
1454c3609:     	movss	%xmm0, 0x650(%rsi)
1454c3611:     	movl	$0x0, 0x654(%rsi)
1454c361b:     	movq	0x600(%rsi), %r15
1454c3622:     	movq	0x608(%rsi), %r13
1454c3629:     	movq	$0x0, 0x608(%rsi)
1454c3634:     	testq	%r13, %r13
1454c3637:     	je	0x1454c3668 <.text+0x54c2668>
1454c3639:     	addq	$0x8, %r15
1454c363d:     	jmp	0x1454c3649 <.text+0x54c2649>
1454c363f:     	nop
1454c3640:     	addq	$0x38, %r15
1454c3644:     	decq	%r13
1454c3647:     	je	0x1454c3668 <.text+0x54c2668>
1454c3649:     	movq	-0x8(%r15), %rdx
1454c364d:     	cmpq	$-0x1, %rdx
1454c3651:     	je	0x1454c3640 <.text+0x54c2640>
1454c3653:     	testq	%rdx, %rdx
1454c3656:     	je	0x1454c3640 <.text+0x54c2640>
1454c3658:     	movq	(%r15), %rcx
1454c365b:     	movl	$0x1, %r8d
1454c3661:     	callq	0x1400021d0 <.text+0x11d0>
1454c3666:     	jmp	0x1454c3640 <.text+0x54c2640>
