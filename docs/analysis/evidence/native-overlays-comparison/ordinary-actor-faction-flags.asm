
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c0ce0:     	movzbl	%r11b, %r9d
1454c0ce4:     	testl	%r9d, %r9d
1454c0ce7:     	je	0x1454c0d00 <.text+0x54bfd00>
1454c0ce9:     	jmp	0x1454c0cf3 <.text+0x54bfcf3>
1454c0ceb:     	nopl	(%rax,%rax)
1454c0cf0:     	movq	%r9, %r8
1454c0cf3:     	subq	$0x1, %rcx
1454c0cf7:     	jb	0x1454c0d0d <.text+0x54bfd0d>
1454c0cf9:     	movq	0x50(%rax,%r8,8), %rax
1454c0cfe:     	jmp	0x1454c0ca7 <.text+0x54bfca7>
1454c0d00:     	movl	$0xe, 0x8(%rax,%r8,4)
1454c0d09:     	jmp	0x1454c0d3d <.text+0x54bfd3d>
1454c0d0b:     	xorl	%eax, %eax
1454c0d0d:     	movq	%rbx, 0x30(%rbp)
1454c0d11:     	movq	%rax, 0x38(%rbp)
1454c0d15:     	movq	$0x0, 0x40(%rbp)
1454c0d1d:     	movq	%r8, 0x48(%rbp)
1454c0d21:     	movq	$0x23, 0x50(%rbp)
1454c0d29:     	leaq	-0x8(%rbp), %rcx
1454c0d2d:     	leaq	0x30(%rbp), %rdx
1454c0d31:     	movl	$0xe, %r8d
1454c0d37:     	callq	0x145427a50 <.text+0x5426a50>
1454c0d3c:     	nop
1454c0d3d:     	movq	0x18(%rbp), %rax
1454c0d41:     	testq	%rax, %rax
1454c0d44:     	je	0x1454c0dab <.text+0x54bfdab>
1454c0d46:     	movq	0x20(%rbp), %rcx
1454c0d4a:     	movw	$0x24, %dx
1454c0d4e:     	movzwl	0x36(%rax), %r9d
1454c0d53:     	movl	%r9d, %r10d
1454c0d56:     	addl	%r10d, %r10d
1454c0d59:     	movq	$-0x1, %r8
1454c0d60:     	testq	%r10, %r10
1454c0d63:     	je	0x1454c0d90 <.text+0x54bfd90>
1454c0d65:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0d6b:     	seta	%r11b
1454c0d6f:     	sbbb	$0x0, %r11b
1454c0d73:     	incq	%r8
1454c0d76:     	addq	$-0x2, %r10
1454c0d7a:     	cmpb	$0x1, %r11b
1454c0d7e:     	je	0x1454c0d60 <.text+0x54bfd60>
1454c0d80:     	movzbl	%r11b, %r9d
1454c0d84:     	testl	%r9d, %r9d
1454c0d87:     	je	0x1454c0da0 <.text+0x54bfda0>
1454c0d89:     	jmp	0x1454c0d93 <.text+0x54bfd93>
1454c0d8b:     	nopl	(%rax,%rax)
1454c0d90:     	movq	%r9, %r8
1454c0d93:     	subq	$0x1, %rcx
1454c0d97:     	jb	0x1454c0dad <.text+0x54bfdad>
1454c0d99:     	movq	0x50(%rax,%r8,8), %rax
1454c0d9e:     	jmp	0x1454c0d4e <.text+0x54bfd4e>
1454c0da0:     	movl	$0x100, 0x8(%rax,%r8,4) # imm = 0x100
1454c0da9:     	jmp	0x1454c0ddd <.text+0x54bfddd>
1454c0dab:     	xorl	%eax, %eax
1454c0dad:     	movq	%rbx, 0x30(%rbp)
1454c0db1:     	movq	%rax, 0x38(%rbp)
1454c0db5:     	movq	$0x0, 0x40(%rbp)
1454c0dbd:     	movq	%r8, 0x48(%rbp)
1454c0dc1:     	movq	$0x24, 0x50(%rbp)
1454c0dc9:     	leaq	-0x8(%rbp), %rcx
1454c0dcd:     	leaq	0x30(%rbp), %rdx
1454c0dd1:     	movl	$0x100, %r8d            # imm = 0x100
1454c0dd7:     	callq	0x145427a50 <.text+0x5426a50>
1454c0ddc:     	nop
1454c0ddd:     	movq	0x18(%rbp), %rax
1454c0de1:     	testq	%rax, %rax
1454c0de4:     	je	0x1454c0e4b <.text+0x54bfe4b>
1454c0de6:     	movq	0x20(%rbp), %rcx
1454c0dea:     	movw	$0x2e, %dx
1454c0dee:     	movzwl	0x36(%rax), %r9d
1454c0df3:     	movl	%r9d, %r10d
1454c0df6:     	addl	%r10d, %r10d
1454c0df9:     	movq	$-0x1, %r8
1454c0e00:     	testq	%r10, %r10
1454c0e03:     	je	0x1454c0e30 <.text+0x54bfe30>
1454c0e05:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0e0b:     	seta	%r11b
1454c0e0f:     	sbbb	$0x0, %r11b
1454c0e13:     	incq	%r8
1454c0e16:     	addq	$-0x2, %r10
1454c0e1a:     	cmpb	$0x1, %r11b
1454c0e1e:     	je	0x1454c0e00 <.text+0x54bfe00>
1454c0e20:     	movzbl	%r11b, %r9d
1454c0e24:     	testl	%r9d, %r9d
1454c0e27:     	je	0x1454c0e40 <.text+0x54bfe40>
1454c0e29:     	jmp	0x1454c0e33 <.text+0x54bfe33>
1454c0e2b:     	nopl	(%rax,%rax)
1454c0e30:     	movq	%r9, %r8
1454c0e33:     	subq	$0x1, %rcx
1454c0e37:     	jb	0x1454c0e4d <.text+0x54bfe4d>
1454c0e39:     	movq	0x50(%rax,%r8,8), %rax
1454c0e3e:     	jmp	0x1454c0dee <.text+0x54bfdee>
1454c0e40:     	movl	$0x0, 0x8(%rax,%r8,4)
1454c0e49:     	jmp	0x1454c0e7a <.text+0x54bfe7a>
1454c0e4b:     	xorl	%eax, %eax
1454c0e4d:     	movq	%rbx, 0x30(%rbp)
1454c0e51:     	movq	%rax, 0x38(%rbp)
1454c0e55:     	movq	$0x0, 0x40(%rbp)
1454c0e5d:     	movq	%r8, 0x48(%rbp)
1454c0e61:     	movq	$0x2e, 0x50(%rbp)
1454c0e69:     	leaq	-0x8(%rbp), %rcx
1454c0e6d:     	leaq	0x30(%rbp), %rdx
1454c0e71:     	xorl	%r8d, %r8d
1454c0e74:     	callq	0x145427a50 <.text+0x5426a50>
1454c0e79:     	nop
1454c0e7a:     	movq	0x18(%rbp), %rax
1454c0e7e:     	testq	%rax, %rax
1454c0e81:     	je	0x1454c0eeb <.text+0x54bfeeb>
1454c0e83:     	movq	0x20(%rbp), %rcx
1454c0e87:     	movw	$0x7e, %dx
1454c0e8b:     	movzwl	0x36(%rax), %r9d
1454c0e90:     	movl	%r9d, %r10d
1454c0e93:     	addl	%r10d, %r10d
1454c0e96:     	movq	$-0x1, %r8
1454c0e9d:     	nopl	(%rax)
1454c0ea0:     	testq	%r10, %r10
1454c0ea3:     	je	0x1454c0ed0 <.text+0x54bfed0>
1454c0ea5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0eab:     	seta	%r11b
1454c0eaf:     	sbbb	$0x0, %r11b
1454c0eb3:     	incq	%r8
1454c0eb6:     	addq	$-0x2, %r10
1454c0eba:     	cmpb	$0x1, %r11b
1454c0ebe:     	je	0x1454c0ea0 <.text+0x54bfea0>
1454c0ec0:     	movzbl	%r11b, %r9d
1454c0ec4:     	testl	%r9d, %r9d
1454c0ec7:     	je	0x1454c0ee0 <.text+0x54bfee0>
1454c0ec9:     	jmp	0x1454c0ed3 <.text+0x54bfed3>
1454c0ecb:     	nopl	(%rax,%rax)
1454c0ed0:     	movq	%r9, %r8
1454c0ed3:     	subq	$0x1, %rcx
1454c0ed7:     	jb	0x1454c0eed <.text+0x54bfeed>
1454c0ed9:     	movq	0x50(%rax,%r8,8), %rax
1454c0ede:     	jmp	0x1454c0e8b <.text+0x54bfe8b>
1454c0ee0:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
1454c0ee9:     	jmp	0x1454c0f1d <.text+0x54bff1d>
1454c0eeb:     	xorl	%eax, %eax
