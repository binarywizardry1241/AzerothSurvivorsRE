
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c5984:     	xorps	%xmm0, %xmm0
1454c5987:     	ucomiss	%xmm11, %xmm0
1454c598b:     	jb	0x1454c59cc <.text+0x54c49cc>
1454c598d:     	cmpb	$0x0, 0x150(%rbp)
1454c5994:     	je	0x1454c5a3a <.text+0x54c4a3a>
1454c599a:     	movb	$0x1, 0x176(%rbp)
1454c59a1:     	movq	%rsi, %rcx
1454c59a4:     	callq	0x1454d68b0 <.text+0x54d58b0>
1454c59a9:     	nop
1454c59aa:     	movb	$0x1, 0x176(%rbp)
1454c59b1:     	leaq	0x60(%rbp), %r8
1454c59b5:     	movq	%rsi, %rcx
1454c59b8:     	movq	%rdi, %rdx
1454c59bb:     	movl	$0x1, %r9d
1454c59c1:     	callq	0x1454d5230 <.text+0x54d4230>
1454c59c6:     	nop
1454c59c7:     	jmp	0x1454c5a66 <.text+0x54c4a66>
1454c59cc:     	testl	%ebx, %ebx
1454c59ce:     	sete	%al
1454c59d1:     	orb	%r12b, %al
1454c59d4:     	jne	0x1454c59e9 <.text+0x54c49e9>
1454c59d6:     	movb	$0x1, 0x176(%rbp)
1454c59dd:     	movq	%rsi, %rcx
1454c59e0:     	movq	%rdi, %rdx
1454c59e3:     	callq	0x1454d4dc0 <.text+0x54d3dc0>
1454c59e8:     	nop
1454c59e9:     	cmpb	$0x0, 0x150(%rbp)
1454c59f0:     	je	0x1454c5a2d <.text+0x54c4a2d>
1454c59f2:     	movb	$0x1, 0x176(%rbp)
1454c59f9:     	movq	%rsi, %rcx
1454c59fc:     	callq	0x1454d68b0 <.text+0x54d58b0>
1454c5a01:     	nop
1454c5a02:     	movb	$0x1, 0x176(%rbp)
1454c5a09:     	leaq	0x60(%rbp), %r8
1454c5a0d:     	movq	%rsi, %rcx
1454c5a10:     	movq	%rdi, %rdx
1454c5a13:     	movl	$0x1, %r9d
1454c5a19:     	callq	0x1454d5230 <.text+0x54d4230>
1454c5a1e:     	nop
1454c5a1f:     	xorps	%xmm0, %xmm0
1454c5a22:     	ucomiss	%xmm11, %xmm0
1454c5a26:     	jae	0x1454c5a66 <.text+0x54c4a66>
1454c5a28:     	jmp	0x1454c5fc8 <.text+0x54c4fc8>
1454c5a2d:     	xorps	%xmm0, %xmm0
1454c5a30:     	ucomiss	%xmm11, %xmm0
1454c5a34:     	jb	0x1454c5fc8 <.text+0x54c4fc8>
1454c5a3a:     	cmpb	$0x3, %r15b
1454c5a3e:     	jne	0x1454c5a66 <.text+0x54c4a66>
1454c5a40:     	cmpl	$0x1, 0x7e4(%rsi)
1454c5a47:     	jne	0x1454c5a66 <.text+0x54c4a66>
1454c5a49:     	movb	$0x1, 0x176(%rbp)
1454c5a50:     	leaq	0x60(%rbp), %r8
1454c5a54:     	movq	%rsi, %rcx
1454c5a57:     	movq	%rdi, %rdx
1454c5a5a:     	movl	$0x2, %r9d
1454c5a60:     	callq	0x1454d5230 <.text+0x54d4230>
1454c5a65:     	nop
