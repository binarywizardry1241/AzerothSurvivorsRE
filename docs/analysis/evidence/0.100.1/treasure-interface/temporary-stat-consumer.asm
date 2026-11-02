
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a6bbe:     	movq	0x60(%r12), %rbx
1454a6bc3:     	testq	%rbx, %rbx
1454a6bc6:     	je	0x1454a6c75 <.text+0x54a5c75>
1454a6bcc:     	movss	0x934(%r12), %xmm6
1454a6bd6:     	movq	0x58(%r12), %r14
1454a6bdb:     	shlq	$0x4, %rbx
1454a6bdf:     	addq	%r14, %rbx
1454a6be2:     	movq	%r12, %rax
1454a6be5:     	movq	0x710(%r12), %r12
1454a6bed:     	movq	%rax, 0x50(%rbp)
1454a6bf1:     	movq	0x718(%rax), %rsi
1454a6bf8:     	leaq	0x68(%rbp), %rdi
1454a6bfc:     	jmp	0x1454a6c1f <.text+0x54a5c1f>
1454a6bfe:     	nop
1454a6c00:     	movq	0x70(%rbp), %rax
1454a6c04:     	movb	%r13b, (%rax,%r15,8)
1454a6c08:     	movss	%xmm7, 0x4(%rax,%r15,8)
1454a6c0f:     	incq	%r15
1454a6c12:     	movq	%r15, 0x78(%rbp)
1454a6c16:     	addq	$0x10, %r14
1454a6c1a:     	cmpq	%rbx, %r14
1454a6c1d:     	je	0x1454a6c63 <.text+0x54a5c63>
1454a6c1f:     	ucomiss	0xc(%r14), %xmm6
1454a6c24:     	jae	0x1454a6c16 <.text+0x54a5c16>
1454a6c26:     	movq	(%r14), %rax
1454a6c29:     	cmpq	%rsi, %rax
1454a6c2c:     	jae	0x1454a6c16 <.text+0x54a5c16>
1454a6c2e:     	shlq	$0x6, %rax
1454a6c32:     	cmpb	$0xf, (%r12,%rax)
1454a6c37:     	jne	0x1454a6c16 <.text+0x54a5c16>
1454a6c39:     	addq	%r12, %rax
1454a6c3c:     	movzbl	0x1(%rax), %r13d
1454a6c41:     	movl	0x8(%r14), %ecx
1454a6c45:     	xorps	%xmm7, %xmm7
1454a6c48:     	cvtsi2ss	%rcx, %xmm7
1454a6c4d:     	mulss	0x4(%rax), %xmm7
1454a6c52:     	cmpq	0x68(%rbp), %r15
1454a6c56:     	jne	0x1454a6c00 <.text+0x54a5c00>
1454a6c58:     	movq	%rdi, %rcx
1454a6c5b:     	callq	0x145780180 <.text+0x577f180>
1454a6c60:     	nop
1454a6c61:     	jmp	0x1454a6c00 <.text+0x54a5c00>
