
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587ba74:     	movb	$0x1, %sil
14587ba77:     	cmpq	$0x13, %r15
14587ba7b:     	jne	0x14587bab2 <.text+0x587aab2>
14587ba7d:     	movdqu	(%r14), %xmm0
14587ba82:     	movdqu	0x3(%r14), %xmm1
14587ba88:     	pcmpeqb	0x1337610(%rip), %xmm1  # 0x146bb30a0
14587ba90:     	pcmpeqb	0x1337628(%rip), %xmm0  # 0x146bb30c0
14587ba98:     	pand	%xmm1, %xmm0
14587ba9c:     	pmovmskb	%xmm0, %eax
14587baa0:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
14587baa5:     	movl	$0x7, %eax
14587baaa:     	movl	$0x1, %esi
14587baaf:     	cmovel	%eax, %esi
14587bab2:     	movss	0x58(%rdi), %xmm6
14587bab7:     	pxor	%xmm0, %xmm0
14587babb:     	ucomiss	%xmm0, %xmm6
14587babe:     	setbe	%al
14587bac1:     	movl	0x68(%rdi), %r12d
14587bac5:     	movl	%r12d, %ecx
14587bac8:     	andl	$0xe, %ecx
14587bacb:     	cmpl	$0x6, %ecx
14587bace:     	sete	%cl
14587bad1:     	orb	%al, %cl
14587bad3:     	jne	0x14587c1e3 <.text+0x587b1e3>
14587bad9:     	cmpl	$0xd, %r12d
14587badd:     	ja	0x14587baf4 <.text+0x587aaf4>
14587badf:     	movl	$0x2700, %eax           # imm = 0x2700
14587bae4:     	btl	%r12d, %eax
14587bae8:     	jae	0x14587baf4 <.text+0x587aaf4>
14587baea:     	ucomiss	0x48(%rdi), %xmm6
14587baee:     	jae	0x14587c1e3 <.text+0x587b1e3>
14587baf4:     	leaq	0x30(%rbp), %rcx
14587baf8:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bafd:     	nop
14587bafe:     	movq	0x38(%rbp), %rax
14587bb02:     	movb	$0x24, (%rax)
14587bb05:     	movb	$0x1, 0x8(%rax)
14587bb09:     	movq	%r14, 0x10(%rax)
14587bb0d:     	movq	%r15, 0x18(%rax)
14587bb11:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
14587bb18:     	movb	$0x4, 0x24(%rax)
14587bb1c:     	movq	$0x1, 0x40(%rbp)
14587bb24:     	movl	$0x1, %ebx
14587bb29:     	jmp	0x14587c1e5 <.text+0x587b1e5>
