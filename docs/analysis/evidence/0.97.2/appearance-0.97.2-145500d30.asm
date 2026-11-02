
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145500d30:     	pushq	%rsi
145500d31:     	pushq	%rdi
145500d32:     	pushq	%rbx
145500d33:     	subq	$0x20, %rsp
145500d37:     	movl	%r8d, %ebx
145500d3a:     	movl	%edx, %edi
145500d3c:     	movq	%rcx, %rsi
145500d3f:     	callq	0x145501470 <.text+0x5500470>
145500d44:     	testq	%rax, %rax
145500d47:     	je	0x145500e73 <.text+0x54ffe73>
145500d4d:     	movq	%rax, %rcx
145500d50:     	movl	%edi, %edx
145500d52:     	movl	%ebx, %r8d
145500d55:     	callq	0x145625c70 <.text+0x5624c70>
145500d5a:     	testb	$0x1, %al
145500d5c:     	je	0x145500e73 <.text+0x54ffe73>
145500d62:     	movl	%eax, %ecx
145500d64:     	shrl	$0x8, %ecx
145500d67:     	testb	%cl, %cl
145500d69:     	je	0x145500e09 <.text+0x54ffe09>
145500d6f:     	decb	%cl
145500d71:     	movzbl	%cl, %ecx
145500d74:     	cmpb	%sil, %cl
145500d77:     	cmovael	%esi, %ecx
145500d7a:     	movl	%eax, %r8d
145500d7d:     	shrl	$0x10, %r8d
145500d81:     	testb	%r8b, %r8b
145500d84:     	je	0x145500e1b <.text+0x54ffe1b>
145500d8a:     	movl	%esi, %edx
145500d8c:     	shrl	$0x8, %edx
145500d8f:     	decb	%r8b
145500d92:     	movzbl	%dl, %edx
145500d95:     	movzbl	%r8b, %r8d
145500d99:     	cmpb	%dl, %r8b
145500d9c:     	cmovbl	%r8d, %edx
145500da0:     	movl	%eax, %r9d
145500da3:     	shrl	$0x18, %r9d
145500da7:     	je	0x145500e26 <.text+0x54ffe26>
145500da9:     	movl	%esi, %r8d
145500dac:     	shrl	$0x10, %r8d
145500db0:     	decb	%r9b
145500db3:     	movzbl	%r8b, %r8d
145500db7:     	movzbl	%r9b, %r9d
145500dbb:     	cmpb	%r8b, %r9b
145500dbe:     	cmovbl	%r9d, %r8d
145500dc2:     	movq	%rax, %r10
145500dc5:     	shrq	$0x20, %r10
145500dc9:     	testb	%r10b, %r10b
145500dcc:     	je	0x145500e35 <.text+0x54ffe35>
145500dce:     	movl	%esi, %r9d
145500dd1:     	shrl	$0x18, %r9d
145500dd5:     	decb	%r10b
145500dd8:     	movzbl	%r9b, %r9d
145500ddc:     	movzbl	%r10b, %r10d
145500de0:     	cmpb	%r9b, %r10b
145500de3:     	cmovbl	%r10d, %r9d
145500de7:     	shrq	$0x28, %rax
145500deb:     	andq	$0xff, %rax
145500df1:     	je	0x145500e44 <.text+0x54ffe44>
145500df3:     	shrq	$0x20, %rsi
145500df7:     	decb	%al
145500df9:     	movzbl	%sil, %r10d
145500dfd:     	movzbl	%al, %eax
145500e00:     	cmpb	%r10b, %al
145500e03:     	cmovbl	%eax, %r10d
145500e07:     	jmp	0x145500e47 <.text+0x54ffe47>
145500e09:     	xorl	%ecx, %ecx
145500e0b:     	movl	%eax, %r8d
145500e0e:     	shrl	$0x10, %r8d
145500e12:     	testb	%r8b, %r8b
145500e15:     	jne	0x145500d8a <.text+0x54ffd8a>
145500e1b:     	xorl	%edx, %edx
145500e1d:     	movl	%eax, %r9d
145500e20:     	shrl	$0x18, %r9d
145500e24:     	jne	0x145500da9 <.text+0x54ffda9>
145500e26:     	xorl	%r8d, %r8d
145500e29:     	movq	%rax, %r10
145500e2c:     	shrq	$0x20, %r10
145500e30:     	testb	%r10b, %r10b
145500e33:     	jne	0x145500dce <.text+0x54ffdce>
145500e35:     	xorl	%r9d, %r9d
145500e38:     	shrq	$0x28, %rax
145500e3c:     	andq	$0xff, %rax
145500e42:     	jne	0x145500df3 <.text+0x54ffdf3>
145500e44:     	xorl	%r10d, %r10d
145500e47:     	movzbl	%r10b, %eax
145500e4b:     	shlq	$0x20, %rax
145500e4f:     	movzbl	%r9b, %r9d
145500e53:     	shll	$0x18, %r9d
145500e57:     	orq	%rax, %r9
145500e5a:     	movzbl	%r8b, %eax
145500e5e:     	shll	$0x10, %eax
145500e61:     	orq	%r9, %rax
145500e64:     	movzbl	%dl, %edx
145500e67:     	shll	$0x8, %edx
145500e6a:     	orq	%rax, %rdx
145500e6d:     	movzbl	%cl, %esi
145500e70:     	orq	%rdx, %rsi
145500e73:     	movq	%rsi, %rax
145500e76:     	addq	$0x20, %rsp
145500e7a:     	popq	%rbx
145500e7b:     	popq	%rdi
145500e7c:     	popq	%rsi
145500e7d:     	retq
