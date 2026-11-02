
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14003de60:     	pushq	%rbp
14003de61:     	pushq	%rsi
14003de62:     	subq	$0x58, %rsp
14003de66:     	leaq	0x50(%rsp), %rbp
14003de6b:     	movq	$-0x2, (%rbp)
14003de73:     	cmpb	$0x0, (%r8)
14003de77:     	movb	$0x1, (%r8)
14003de7b:     	jne	0x14003deab <.text+0x3ceab>
14003de7d:     	movq	$0x1, 0x20(%rsp)
14003de86:     	leaq	0x5d333e3(%rip), %rax   # 0x145d71270
14003de8d:     	leaq	0x5d3305d(%rip), %r9    # 0x145d70ef1
14003de94:     	movl	$0xe, %r8d
14003de9a:     	movq	%rdx, %rcx
14003de9d:     	movq	%rdx, %rsi
14003dea0:     	movq	%rax, %rdx
14003dea3:     	callq	0x14063a3d0 <.text+0x6393d0>
14003dea8:     	movq	%rsi, %rdx
14003deab:     	leaq	0x5d333be(%rip), %r8    # 0x145d71270
14003deb2:     	leaq	-0x28(%rbp), %rcx
14003deb6:     	movl	$0xe, %r9d
14003debc:     	callq	0x14063cd20 <.text+0x63bd20>
14003dec1:     	movq	-0x28(%rbp), %rax
14003dec5:     	cmpq	$-0x1, %rax
14003dec9:     	je	0x14003def9 <.text+0x3cef9>
14003decb:     	movq	%rax, -0x8(%rbp)
14003decf:     	movq	-0x20(%rbp), %rcx
14003ded3:     	movq	-0x18(%rbp), %rdx
14003ded7:     	movq	%rcx, -0x10(%rbp)
14003dedb:     	callq	0x14006f550 <.text+0x6e550>
14003dee0:     	nop
14003dee1:     	cmpq	$0x1, %rdx
14003dee5:     	jne	0x14003defd <.text+0x3cefd>
14003dee7:     	cmpb	$0x31, (%rax)
14003deea:     	sete	%sil
14003deee:     	movq	-0x8(%rbp), %rdx
14003def2:     	testq	%rdx, %rdx
14003def5:     	jne	0x14003df08 <.text+0x3cf08>
14003def7:     	jmp	0x14003df17 <.text+0x3cf17>
14003def9:     	xorl	%esi, %esi
14003defb:     	jmp	0x14003df17 <.text+0x3cf17>
14003defd:     	xorl	%esi, %esi
14003deff:     	movq	-0x8(%rbp), %rdx
14003df03:     	testq	%rdx, %rdx
14003df06:     	je	0x14003df17 <.text+0x3cf17>
14003df08:     	movl	$0x1, %r8d
14003df0e:     	movq	-0x10(%rbp), %rcx
14003df12:     	callq	0x1400021d0 <.text+0x11d0>
14003df17:     	movl	%esi, %ecx
14003df19:     	addq	$0x58, %rsp
14003df1d:     	popq	%rsi
14003df1e:     	popq	%rbp
14003df1f:     	jmp	0x1407e0430 <.text+0x7df430>
