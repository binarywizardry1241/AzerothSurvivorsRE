
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145963a02:     	movdqa	0x1f0(%rbp), %xmm14
145963a0b:     	movl	0x200(%rbp), %edi
145963a11:     	movq	0x2c8(%rbp), %rsi
145963a18:     	cmpq	0x2b8(%rbp), %rsi
145963a1f:     	jne	0x145963a2e <.text+0x5962a2e>
145963a21:     	leaq	0x2b8(%rbp), %rcx
145963a28:     	callq	0x145d69340 <.text+0x5d68340>
145963a2d:     	nop
145963a2e:     	movq	0x2c0(%rbp), %rax
145963a35:     	movb	$0x1, (%rax,%rsi)
145963a39:     	leaq	0x1(%rsi), %rax
145963a3d:     	movq	%rax, 0x2c8(%rbp)
145963a44:     	cmpq	0x2b8(%rbp), %rax
145963a4b:     	jne	0x145963a5a <.text+0x5962a5a>
145963a4d:     	leaq	0x2b8(%rbp), %rcx
145963a54:     	callq	0x145d69340 <.text+0x5d68340>
145963a59:     	nop
145963a5a:     	movq	0x2c0(%rbp), %rax
145963a61:     	movb	$0x0, 0x1(%rax,%rsi)
145963a66:     	addq	$0x2, %rsi
145963a6a:     	movq	%rsi, 0x2c8(%rbp)
145963a71:     	movq	0x2b8(%rbp), %rax
145963a78:     	subq	%rsi, %rax
145963a7b:     	cmpq	$0x13, %rax
145963a7f:     	jbe	0x145963ddf <.text+0x5962ddf>
145963a85:     	movdqa	%xmm14, %xmm0
145963a8a:     	punpckhbw	%xmm6, %xmm0    # xmm0 = xmm0[8],xmm6[8],xmm0[9],xmm6[9],xmm0[10],xmm6[10],xmm0[11],xmm6[11],xmm0[12],xmm6[12],xmm0[13],xmm6[13],xmm0[14],xmm6[14],xmm0[15],xmm6[15]
145963a8e:     	pshuflw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[3,2,1,0,4,5,6,7]
145963a93:     	pshufhw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[0,1,2,3,7,6,5,4]
145963a98:     	punpcklbw	%xmm6, %xmm14   # xmm14 = xmm14[0],xmm6[0],xmm14[1],xmm6[1],xmm14[2],xmm6[2],xmm14[3],xmm6[3],xmm14[4],xmm6[4],xmm14[5],xmm6[5],xmm14[6],xmm6[6],xmm14[7],xmm6[7]
145963a9d:     	pshuflw	$0x1b, %xmm14, %xmm1    # xmm1 = xmm14[3,2,1,0,4,5,6,7]
145963aa3:     	pshufhw	$0x1b, %xmm1, %xmm1     # xmm1 = xmm1[0,1,2,3,7,6,5,4]
145963aa8:     	packuswb	%xmm0, %xmm1
145963aac:     	bswapl	%edi
145963aae:     	movq	0x2c0(%rbp), %rax
145963ab5:     	movdqu	%xmm1, (%rax,%rsi)
145963aba:     	movl	%edi, 0x10(%rax,%rsi)
145963abe:     	movq	0x2b8(%rbp), %rax
