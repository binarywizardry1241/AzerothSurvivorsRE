
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14540da00:     	movzbl	0x75(%rcx), %r8d
14540da05:     	cmpl	$0xb, %r8d
14540da09:     	jne	0x14540da48 <.text+0x540ca48>
14540da0b:     	movq	0x30(%rcx), %rax
14540da0f:     	movq	0x38(%rcx), %r8
14540da13:     	xorl	%r9d, %r9d
14540da16:     	nopw	%cs:(%rax,%rax)
14540da20:     	cmpq	%r9, %r8
14540da23:     	je	0x14540db15 <.text+0x540cb15>
14540da29:     	cmpb	%dl, (%rax,%r9)
14540da2d:     	leaq	0x1(%r9), %r9
14540da31:     	jne	0x14540da20 <.text+0x540ca20>
14540da33:     	movb	$0x1, %al
14540da35:     	cmpb	$0x2, %dl
14540da38:     	jne	0x14540db4a <.text+0x540cb4a>
14540da3e:     	cmpl	$0x0, 0x54(%rcx)
14540da42:     	setne	%al
14540da45:     	andb	$0x1, %al
14540da47:     	retq
14540da48:     	movzbl	%dl, %eax
14540da4b:     	leaq	0x130f736(%rip), %rdx   # 0x14671d188
14540da52:     	movslq	(%rdx,%rax,4), %rax
14540da56:     	addq	%rdx, %rax
14540da59:     	jmpq	*%rax
14540da5b:     	cmpb	$0x9, %r8b
14540da5f:     	jne	0x14540db4d <.text+0x540cb4d>
14540da65:     	movzbl	0x68(%rcx), %ecx
14540da69:     	movl	$0x10c0, %eax           # imm = 0x10C0
14540da6e:     	shrl	%cl, %eax
14540da70:     	andb	$0x1, %al
14540da72:     	retq
14540da73:     	xorl	%eax, %eax
14540da75:     	addl	$-0x3, %r8d
14540da79:     	cmpl	$0x7, %r8d
14540da7d:     	ja	0x14540db4a <.text+0x540cb4a>
14540da83:     	leaq	0x130f712(%rip), %rdx   # 0x14671d19c
14540da8a:     	movslq	(%rdx,%r8,4), %r8
14540da8e:     	addq	%rdx, %r8
14540da91:     	jmpq	*%r8
14540da94:     	movss	0x58(%rcx), %xmm0
14540da99:     	xorps	%xmm1, %xmm1
14540da9c:     	ucomiss	%xmm1, %xmm0
14540da9f:     	jbe	0x14540db15 <.text+0x540cb15>
14540daa1:     	movl	0x68(%rcx), %edx
14540daa4:     	movl	%edx, %eax
14540daa6:     	andl	$-0x2, %eax
14540daa9:     	cmpl	$0x6, %eax
14540daac:     	je	0x14540db15 <.text+0x540cb15>
14540daae:     	movb	$0x1, %al
14540dab0:     	cmpl	$0xc, %edx
14540dab3:     	ja	0x14540db4a <.text+0x540cb4a>
14540dab9:     	movl	$0x1300, %r8d           # imm = 0x1300
14540dabf:     	btl	%edx, %r8d
14540dac3:     	jb	0x14540db40 <.text+0x540cb40>
14540dac5:     	jmp	0x14540db4a <.text+0x540cb4a>
14540daca:     	cmpl	$0x0, 0x54(%rcx)
14540dace:     	je	0x14540db15 <.text+0x540cb15>
14540dad0:     	movzbl	%r8b, %edx
14540dad4:     	movb	$0x1, %al
14540dad6:     	movl	$0xf3, %r8d
14540dadc:     	btl	%edx, %r8d
14540dae0:     	jb	0x14540db4a <.text+0x540cb4a>
14540dae2:     	movl	$0x30c, %eax            # imm = 0x30C
14540dae7:     	btl	%edx, %eax
14540daea:     	jb	0x14540db15 <.text+0x540cb15>
14540daec:     	xorps	%xmm0, %xmm0
14540daef:     	ucomiss	0x50(%rcx), %xmm0
14540daf3:     	setae	%al
14540daf6:     	andb	$0x1, %al
14540daf8:     	retq
14540daf9:     	leal	-0x2(%r8), %eax
14540dafd:     	cmpl	$0x3, %eax
14540db00:     	jb	0x14540db1a <.text+0x540cb1a>
14540db02:     	cmpl	$0x8, %r8d
14540db06:     	je	0x14540db1a <.text+0x540cb1a>
14540db08:     	cmpl	$0xa, %r8d
14540db0c:     	jne	0x14540db15 <.text+0x540cb15>
14540db0e:     	movss	0x50(%rcx), %xmm0
14540db13:     	jmp	0x14540db52 <.text+0x540cb52>
14540db15:     	xorl	%eax, %eax
14540db17:     	andb	$0x1, %al
14540db19:     	retq
14540db1a:     	movb	$0x1, %al
14540db1c:     	andb	$0x1, %al
14540db1e:     	retq
14540db1f:     	movb	$0x1, %al
14540db21:     	cmpb	$0x9, %r8b
14540db25:     	jne	0x14540db4a <.text+0x540cb4a>
14540db27:     	movl	0x68(%rcx), %edx
14540db2a:     	cmpl	$0xc, %edx
14540db2d:     	ja	0x14540db4a <.text+0x540cb4a>
14540db2f:     	movl	$0x1300, %r8d           # imm = 0x1300
14540db35:     	btl	%edx, %r8d
14540db39:     	jae	0x14540db4a <.text+0x540cb4a>
14540db3b:     	movss	0x58(%rcx), %xmm0
14540db40:     	ucomiss	0x48(%rcx), %xmm0
14540db44:     	setb	%al
14540db47:     	andb	$0x1, %al
14540db49:     	retq
14540db4a:     	andb	$0x1, %al
14540db4c:     	retq
14540db4d:     	movss	0x44(%rcx), %xmm0
14540db52:     	xorps	%xmm1, %xmm1
14540db55:     	ucomiss	%xmm1, %xmm0
14540db58:     	seta	%al
14540db5b:     	andb	$0x1, %al
14540db5d:     	retq
