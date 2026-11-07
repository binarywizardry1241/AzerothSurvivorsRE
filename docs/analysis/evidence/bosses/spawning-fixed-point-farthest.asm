
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bf491:     	cmpl	$0xb, %ebx
1454bf494:     	je	0x1454bf49f <.text+0x54be49f>
1454bf496:     	cmpl	$0x7, %ebx
1454bf499:     	jne	0x1454bfdff <.text+0x54bedff>
1454bf49f:     	leaq	0x8(%r14), %rbx
1454bf4a3:     	decq	%r12
1454bf4a6:     	movabsq	$0x1fffffffffffffff, %r15 # imm = 0x1FFFFFFFFFFFFFFF
1454bf4b0:     	andq	%r12, %r15
1454bf4b3:     	jmp	0x1454bf4cd <.text+0x54be4cd>
1454bf4b5:     	nopw	%cs:(%rax,%rax)
1454bf4c0:     	addq	$0x8, %rbx
1454bf4c4:     	decq	%r15
1454bf4c7:     	je	0x1454bf26d <.text+0x54be26d>
1454bf4cd:     	movq	0x148(%rbp), %rax
1454bf4d4:     	movss	(%r14), %xmm0
1454bf4d9:     	movss	0x4(%r14), %xmm1
1454bf4df:     	subss	(%rax), %xmm0
1454bf4e3:     	subss	0x4(%rax), %xmm1
1454bf4e8:     	callq	0x145756e67 <.text+0x5755e67>
1454bf4ed:     	movaps	%xmm0, %xmm6
1454bf4f0:     	movq	0x148(%rbp), %rax
1454bf4f7:     	movss	(%rbx), %xmm0
1454bf4fb:     	movss	0x4(%rbx), %xmm1
1454bf500:     	subss	(%rax), %xmm0
1454bf504:     	subss	0x4(%rax), %xmm1
1454bf509:     	callq	0x145756e67 <.text+0x5755e67>
1454bf50e:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454bf511:     	movaps	%xmm6, %xmm0
1454bf514:     	psrad	$0x1f, %xmm0
1454bf519:     	psrld	$0x1, %xmm0
1454bf51e:     	pxor	%xmm6, %xmm0
1454bf522:     	pshufd	$0x55, %xmm0, %xmm1     # xmm1 = xmm0[1,1,1,1]
1454bf527:     	pcmpgtd	%xmm1, %xmm0
1454bf52b:     	movd	%xmm0, %eax
1454bf52f:     	testb	$0x1, %al
1454bf531:     	jne	0x1454bf4c0 <.text+0x54be4c0>
1454bf533:     	movq	%rbx, %r14
1454bf536:     	jmp	0x1454bf4c0 <.text+0x54be4c0>
