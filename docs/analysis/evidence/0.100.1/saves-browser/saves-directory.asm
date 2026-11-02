
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543a9c0:     	pushq	%rbp
14543a9c1:     	pushq	%rsi
14543a9c2:     	subq	$0x88, %rsp
14543a9c9:     	leaq	0x80(%rsp), %rbp
14543a9d1:     	movq	$-0x2, (%rbp)
14543a9d9:     	movq	%rcx, %rsi
14543a9dc:     	leaq	-0x30(%rbp), %rcx
14543a9e0:     	callq	0x145468d60 <.text+0x5467d60>
14543a9e5:     	movq	-0x30(%rbp), %rax
14543a9e9:     	cmpq	$-0x1, %rax
14543a9ed:     	je	0x14543aa42 <.text+0x5439a42>
14543a9ef:     	movq	%rax, -0x8(%rbp)
14543a9f3:     	movq	-0x28(%rbp), %rdx
14543a9f7:     	movq	-0x20(%rbp), %r8
14543a9fb:     	movq	$0x5, 0x20(%rsp)
14543aa04:     	leaq	0x1303174(%rip), %r9    # 0x14673db7f
14543aa0b:     	leaq	-0x50(%rbp), %rcx
14543aa0f:     	movq	%rdx, -0x10(%rbp)
14543aa13:     	callq	0x145702c70 <.text+0x5701c70>
14543aa18:     	nop
14543aa19:     	movups	-0x50(%rbp), %xmm0
14543aa1d:     	movups	-0x40(%rbp), %xmm1
14543aa21:     	movups	%xmm1, 0x10(%rsi)
14543aa25:     	movups	%xmm0, (%rsi)
14543aa28:     	movq	-0x8(%rbp), %rdx
14543aa2c:     	testq	%rdx, %rdx
14543aa2f:     	je	0x14543aa49 <.text+0x5439a49>
14543aa31:     	movl	$0x1, %r8d
14543aa37:     	movq	-0x10(%rbp), %rcx
14543aa3b:     	callq	0x1400021d0 <.text+0x11d0>
14543aa40:     	jmp	0x14543aa49 <.text+0x5439a49>
14543aa42:     	movq	$-0x1, (%rsi)
14543aa49:     	movq	%rsi, %rax
14543aa4c:     	addq	$0x88, %rsp
14543aa53:     	popq	%rsi
14543aa54:     	popq	%rbp
14543aa55:     	retq
