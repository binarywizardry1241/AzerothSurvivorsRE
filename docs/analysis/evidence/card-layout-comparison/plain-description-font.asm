
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401bed8e:     	cmpb	$0x1, (%rdi)
1401bed91:     	jne	0x1401bedb2 <.text+0x1bddb2>
1401bed93:     	movl	0x1(%rdi), %eax
1401bed96:     	movl	0x4(%rdi), %ecx
1401bed99:     	movl	%ecx, 0x5a3(%rbp)
1401bed9f:     	movl	%eax, 0x5a0(%rbp)
1401beda5:     	movq	0x8(%rdi), %rax
1401beda9:     	movzbl	0x10(%rdi), %ecx
1401bedad:     	movb	$0x1, %r8b
1401bedb0:     	jmp	0x1401bedc3 <.text+0x1bddc3>
1401bedb2:     	movq	0x8(%rdi), %rax
1401bedb6:     	lock
1401bedb7:     	incq	(%rax)
1401bedba:     	jle	0x1401bf723 <.text+0x1be723>
1401bedc0:     	xorl	%r8d, %r8d
1401bedc3:     	leaq	0x348(%rbp), %rdx
1401bedca:     	movq	0xa0(%rbp), %r9
1401bedd1:     	movq	%r9, 0x5c8(%rbp)
1401bedd8:     	movups	0x90(%rbp), %xmm0
1401beddf:     	movups	%xmm0, 0x5b8(%rbp)
1401bede6:     	movups	0x5bf9f67(%rip), %xmm0  # 0x145db8d54
1401beded:     	movups	%xmm0, 0x841(%rbp)
1401bedf4:     	movl	$0x3f800000, 0x851(%rbp) # imm = 0x3F800000
1401bedfe:     	movq	$0x0, 0x5d0(%rbp)
1401bee09:     	movq	$0x4, 0x5d8(%rbp)
1401bee14:     	movq	$0x0, 0x5e0(%rbp)
1401bee1f:     	movb	%r8b, 0x5e8(%rbp)
1401bee26:     	movl	0x5a0(%rbp), %r8d
1401bee2d:     	movl	0x5a3(%rbp), %r9d
1401bee34:     	movl	%r8d, 0x5e9(%rbp)
1401bee3b:     	movl	%r9d, 0x5ec(%rbp)
1401bee42:     	movq	%rax, 0x5f0(%rbp)
1401bee49:     	movq	%rcx, 0x5f8(%rbp)
1401bee50:     	movl	$0x41600000, 0x600(%rbp) # imm = 0x41600000
1401bee5a:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
1401bee63:     	movb	$0x1, 0x606(%rbp)
1401bee6a:     	movq	0x84d(%rbp), %rax
1401bee71:     	movq	%rax, 0x614(%rbp)
1401bee78:     	movups	0x840(%rbp), %xmm0
1401bee7f:     	movups	%xmm0, 0x607(%rbp)
1401bee86:     	movl	%r13d, 0x62c(%rbp)
1401bee8d:     	movdqu	0x5baf443(%rip), %xmm0  # 0x145d6e2d8
1401bee95:     	movdqu	%xmm0, 0x61c(%rbp)
1401bee9d:     	movq	%xmm13, 0x630(%rbp)
1401beea6:     	movw	$0x1, 0x638(%rbp)
1401beeaf:     	movq	%r14, 0x5b0(%rbp)
1401beeb6:     	leaq	0x90(%rbp), %rcx
1401beebd:     	leaq	0x5b0(%rbp), %r8
1401beec4:     	callq	0x14019edf0 <.text+0x19ddf0>
