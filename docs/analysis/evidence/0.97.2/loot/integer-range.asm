
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f9a40:     	pushq	%rsi
1454f9a41:     	pushq	%rdi
1454f9a42:     	pushq	%rbx
1454f9a43:     	subq	$0x20, %rsp
1454f9a47:     	subl	%edx, %r8d
1454f9a4a:     	jbe	0x1454f9ac1 <.text+0x54f8ac1>
1454f9a4c:     	movq	%rcx, %rax
1454f9a4f:     	bsrl	%r8d, %ecx
1454f9a53:     	notl	%ecx
1454f9a55:     	movl	%r8d, %r9d
1454f9a58:     	shll	%cl, %r9d
1454f9a5b:     	decl	%r9d
1454f9a5e:     	movq	(%rax), %r11
1454f9a61:     	movq	0x8(%rax), %rcx
1454f9a65:     	movq	0x18(%rax), %rsi
1454f9a69:     	movq	0x10(%rax), %r10
1454f9a6d:     	nopl	(%rax)
1454f9a70:     	leaq	(%r11,%rsi), %rdi
1454f9a74:     	rolq	$0x17, %rdi
1454f9a78:     	addq	%r11, %rdi
1454f9a7b:     	movq	%rcx, %rbx
1454f9a7e:     	shlq	$0x11, %rbx
1454f9a82:     	xorq	%r11, %r10
1454f9a85:     	xorq	%rcx, %rsi
1454f9a88:     	xorq	%r10, %rcx
1454f9a8b:     	xorq	%rsi, %r11
1454f9a8e:     	rolq	$0x2d, %rsi
1454f9a92:     	xorq	%rbx, %r10
1454f9a95:     	shrq	$0x20, %rdi
1454f9a99:     	imulq	%r8, %rdi
1454f9a9d:     	cmpl	%edi, %r9d
1454f9aa0:     	jb	0x1454f9a70 <.text+0x54f8a70>
1454f9aa2:     	movq	%r11, (%rax)
1454f9aa5:     	movq	%rsi, 0x18(%rax)
1454f9aa9:     	movq	%rcx, 0x8(%rax)
1454f9aad:     	movq	%r10, 0x10(%rax)
1454f9ab1:     	shrq	$0x20, %rdi
1454f9ab5:     	addl	%edi, %edx
1454f9ab7:     	movl	%edx, %eax
1454f9ab9:     	addq	$0x20, %rsp
1454f9abd:     	popq	%rbx
1454f9abe:     	popq	%rdi
1454f9abf:     	popq	%rsi
1454f9ac0:     	retq
1454f9ac1:     	leaq	0x14b3c5d(%rip), %rcx   # 0x1469ad725
1454f9ac8:     	leaq	0x14b3cd1(%rip), %r8    # 0x1469ad7a0
1454f9acf:     	movl	$0x19, %edx
1454f9ad4:     	callq	0x1458e7770 <.text+0x58e6770>
1454f9ad9:     	ud2
