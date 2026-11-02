
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145439d50:     	movq	0x10(%rcx), %rdx
145439d54:     	testq	%rdx, %rdx
145439d57:     	je	0x145439d9d <.text+0x5438d9d>
145439d59:     	movq	0x8(%rcx), %rcx
145439d5d:     	movq	0x18(%rcx), %rax
145439d61:     	cmpq	$0x1, %rdx
145439d65:     	je	0x145439e57 <.text+0x5438e57>
145439d6b:     	imulq	$0x38, %rdx, %rdx
145439d6f:     	addq	$-0x38, %rdx
145439d73:     	shrq	$0x3, %rdx
145439d77:     	movabsq	$0x6db6db6db6db6db7, %r8 # imm = 0x6DB6DB6DB6DB6DB7
145439d81:     	imulq	%rdx, %r8
145439d85:     	leaq	-0x1(%r8), %r9
145439d89:     	movl	%r8d, %edx
145439d8c:     	andl	$0x3, %edx
145439d8f:     	cmpq	$0x3, %r9
145439d93:     	jae	0x145439da3 <.text+0x5438da3>
145439d95:     	xorl	%r9d, %r9d
145439d98:     	jmp	0x145439e2d <.text+0x5438e2d>
145439d9d:     	movl	$0x1, %eax
145439da2:     	retq
145439da3:     	movabsq	$0x7fffffffffffffc, %r9 # imm = 0x7FFFFFFFFFFFFFC
145439dad:     	andq	%r9, %r8
145439db0:     	leaq	0xf8(%rcx), %r10
145439db7:     	xorl	%r9d, %r9d
145439dba:     	jmp	0x145439dd0 <.text+0x5438dd0>
145439dbc:     	nopl	(%rax)
145439dc0:     	addq	$0x4, %r9
145439dc4:     	addq	$0xe0, %r10
145439dcb:     	cmpq	%r9, %r8
145439dce:     	je	0x145439e28 <.text+0x5438e28>
145439dd0:     	movq	-0xa8(%r10), %r11
145439dd7:     	cmpq	%r11, %rax
145439dda:     	jbe	0x145439e00 <.text+0x5438e00>
145439ddc:     	movq	-0x70(%r10), %r11
145439de0:     	cmpq	%r11, %rax
145439de3:     	jbe	0x145439e0c <.text+0x5438e0c>
145439de5:     	movq	-0x38(%r10), %r11
145439de9:     	cmpq	%r11, %rax
145439dec:     	jbe	0x145439e18 <.text+0x5438e18>
145439dee:     	movq	(%r10), %r11
145439df1:     	cmpq	%r11, %rax
145439df4:     	ja	0x145439dc0 <.text+0x5438dc0>
145439df6:     	jmp	0x145439e23 <.text+0x5438e23>
145439df8:     	nopl	(%rax,%rax)
145439e00:     	movq	%r11, %rax
145439e03:     	movq	-0x70(%r10), %r11
145439e07:     	cmpq	%r11, %rax
145439e0a:     	ja	0x145439de5 <.text+0x5438de5>
145439e0c:     	movq	%r11, %rax
145439e0f:     	movq	-0x38(%r10), %r11
145439e13:     	cmpq	%r11, %rax
145439e16:     	ja	0x145439dee <.text+0x5438dee>
145439e18:     	movq	%r11, %rax
145439e1b:     	movq	(%r10), %r11
145439e1e:     	cmpq	%r11, %rax
145439e21:     	ja	0x145439dc0 <.text+0x5438dc0>
145439e23:     	movq	%r11, %rax
145439e26:     	jmp	0x145439dc0 <.text+0x5438dc0>
145439e28:     	testq	%rdx, %rdx
145439e2b:     	je	0x145439e57 <.text+0x5438e57>
145439e2d:     	imulq	$0x38, %r9, %r8
145439e31:     	addq	%r8, %rcx
145439e34:     	addq	$0x50, %rcx
145439e38:     	imulq	$0x38, %rdx, %rdx
145439e3c:     	xorl	%r8d, %r8d
145439e3f:     	nop
145439e40:     	movq	%rax, %r9
145439e43:     	movq	(%rcx,%r8), %rax
145439e47:     	cmpq	%rax, %r9
145439e4a:     	cmovaq	%r9, %rax
145439e4e:     	addq	$0x38, %r8
145439e52:     	cmpq	%r8, %rdx
145439e55:     	jne	0x145439e40 <.text+0x5438e40>
145439e57:     	incq	%rax
145439e5a:     	retq
