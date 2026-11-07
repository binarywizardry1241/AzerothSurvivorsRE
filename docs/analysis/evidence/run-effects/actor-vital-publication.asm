
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d5aed:     	movss	0x418(%rsi), %xmm0
1454d5af5:     	movss	0x470(%rsi), %xmm7
1454d5afd:     	xorps	%xmm8, %xmm8
1454d5b01:     	maxss	%xmm8, %xmm0
1454d5b06:     	callq	0x14577327d <.text+0x577227d>
1454d5b0b:     	cvttss2si	%xmm0, %rax
1454d5b10:     	xorl	%ecx, %ecx
1454d5b12:     	ucomiss	%xmm8, %xmm0
1454d5b16:     	cmovbl	%ecx, %eax
1454d5b19:     	ucomiss	0x431a0c(%rip), %xmm0   # 0x14590752c
1454d5b20:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454d5b26:     	cmovbel	%eax, %r8d
1454d5b2a:     	leaq	0x8d8(%rsi), %r14
1454d5b31:     	movq	0x8d8(%rsi), %rax
1454d5b38:     	testq	%rax, %rax
1454d5b3b:     	je	0x1454d5ba2 <.text+0x54d4ba2>
1454d5b3d:     	movq	0x8e0(%rsi), %rcx
1454d5b44:     	movw	$0x16, %dx
1454d5b48:     	movzwl	0x36(%rax), %r10d
1454d5b4d:     	movl	%r10d, %r11d
1454d5b50:     	addl	%r11d, %r11d
1454d5b53:     	movq	$-0x1, %r9
1454d5b5a:     	nopw	(%rax,%rax)
1454d5b60:     	testq	%r11, %r11
1454d5b63:     	je	0x1454d5b8b <.text+0x54d4b8b>
1454d5b65:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d5b6b:     	seta	%r15b
1454d5b6f:     	sbbb	$0x0, %r15b
1454d5b73:     	incq	%r9
1454d5b76:     	addq	$-0x2, %r11
1454d5b7a:     	cmpb	$0x1, %r15b
1454d5b7e:     	je	0x1454d5b60 <.text+0x54d4b60>
1454d5b80:     	movzbl	%r15b, %r10d
1454d5b84:     	testl	%r10d, %r10d
1454d5b87:     	jne	0x1454d5b8e <.text+0x54d4b8e>
1454d5b89:     	jmp	0x1454d5b9b <.text+0x54d4b9b>
1454d5b8b:     	movq	%r10, %r9
1454d5b8e:     	subq	$0x1, %rcx
1454d5b92:     	jb	0x1454d5ba4 <.text+0x54d4ba4>
1454d5b94:     	movq	0x50(%rax,%r9,8), %rax
1454d5b99:     	jmp	0x1454d5b48 <.text+0x54d4b48>
1454d5b9b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454d5ba0:     	jmp	0x1454d5bea <.text+0x54d4bea>
1454d5ba2:     	xorl	%eax, %eax
1454d5ba4:     	movq	%r14, 0xf0(%rbp)
1454d5bab:     	movq	%rax, 0xf8(%rbp)
1454d5bb2:     	movq	$0x0, 0x100(%rbp)
1454d5bbd:     	movq	%r9, 0x108(%rbp)
1454d5bc4:     	movq	$0x16, 0x110(%rbp)
1454d5bcf:     	movb	$0x0, 0x175(%rbp)
1454d5bd6:     	leaq	0xb8(%rbp), %rcx
1454d5bdd:     	leaq	0xf0(%rbp), %rdx
1454d5be4:     	callq	0x14552a730 <.text+0x5529730>
1454d5be9:     	nop
1454d5bea:     	movaps	%xmm7, %xmm0
1454d5bed:     	callq	0x14577327d <.text+0x577227d>
1454d5bf2:     	cvttss2si	%xmm0, %rax
1454d5bf7:     	xorl	%ecx, %ecx
1454d5bf9:     	xorps	%xmm1, %xmm1
1454d5bfc:     	ucomiss	%xmm1, %xmm0
1454d5bff:     	cmovbl	%ecx, %eax
1454d5c02:     	ucomiss	0x431923(%rip), %xmm0   # 0x14590752c
1454d5c09:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454d5c0f:     	cmovbel	%eax, %r8d
1454d5c13:     	movq	(%r14), %rax
1454d5c16:     	testq	%rax, %rax
1454d5c19:     	je	0x1454d5c82 <.text+0x54d4c82>
1454d5c1b:     	movq	0x8e0(%rsi), %rcx
1454d5c22:     	movw	$0x1c, %dx
1454d5c26:     	movzwl	0x36(%rax), %r10d
1454d5c2b:     	movl	%r10d, %r11d
1454d5c2e:     	addl	%r11d, %r11d
1454d5c31:     	movq	$-0x1, %r9
1454d5c38:     	nopl	(%rax,%rax)
1454d5c40:     	testq	%r11, %r11
1454d5c43:     	je	0x1454d5c6b <.text+0x54d4c6b>
1454d5c45:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d5c4b:     	seta	%r15b
1454d5c4f:     	sbbb	$0x0, %r15b
1454d5c53:     	incq	%r9
1454d5c56:     	addq	$-0x2, %r11
1454d5c5a:     	cmpb	$0x1, %r15b
1454d5c5e:     	je	0x1454d5c40 <.text+0x54d4c40>
1454d5c60:     	movzbl	%r15b, %r10d
1454d5c64:     	testl	%r10d, %r10d
1454d5c67:     	jne	0x1454d5c6e <.text+0x54d4c6e>
1454d5c69:     	jmp	0x1454d5c7b <.text+0x54d4c7b>
1454d5c6b:     	movq	%r10, %r9
1454d5c6e:     	subq	$0x1, %rcx
1454d5c72:     	jb	0x1454d5c84 <.text+0x54d4c84>
1454d5c74:     	movq	0x50(%rax,%r9,8), %rax
1454d5c79:     	jmp	0x1454d5c26 <.text+0x54d4c26>
1454d5c7b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454d5c80:     	jmp	0x1454d5cca <.text+0x54d4cca>
1454d5c82:     	xorl	%eax, %eax
1454d5c84:     	movq	%r14, 0xf0(%rbp)
1454d5c8b:     	movq	%rax, 0xf8(%rbp)
1454d5c92:     	movq	$0x0, 0x100(%rbp)
1454d5c9d:     	movq	%r9, 0x108(%rbp)
1454d5ca4:     	movq	$0x1c, 0x110(%rbp)
