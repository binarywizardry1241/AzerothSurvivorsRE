
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145512d50:     	pushq	%rsi
145512d51:     	pushq	%rdi
145512d52:     	pushq	%rbx
145512d53:     	movl	%edx, %eax
145512d55:     	movq	(%rcx), %rdx
145512d58:     	movq	0x8(%rcx), %r9
145512d5c:     	cmpq	%r9, %rdx
145512d5f:     	je	0x145512df0 <.text+0x5511df0>
145512d65:     	movq	0x10(%rcx), %r10
145512d69:     	subq	%rdx, %r9
145512d6c:     	shrq	$0x4, %r9
145512d70:     	movq	0x4c8(%r10), %rcx
145512d77:     	imulq	$0x160, 0x4d0(%r10), %r10 # imm = 0x160
145512d82:     	xorl	%r11d, %r11d
145512d85:     	jmp	0x145512da9 <.text+0x5511da9>
145512d87:     	nopw	(%rax,%rax)
145512d90:     	xorl	%ebx, %ebx
145512d92:     	cmpb	%bl, %al
145512d94:     	cmovaq	%rsi, %r8
145512d98:     	movzbl	%al, %esi
145512d9b:     	movzbl	%bl, %eax
145512d9e:     	cmovbl	%esi, %eax
145512da1:     	incq	%r11
145512da4:     	cmpq	%r9, %r11
145512da7:     	je	0x145512df0 <.text+0x5511df0>
145512da9:     	movq	%r11, %rsi
145512dac:     	shlq	$0x4, %rsi
145512db0:     	movq	(%rdx,%rsi), %rsi
145512db4:     	xorl	%edi, %edi
145512db6:     	movq	%rcx, %rbx
145512db9:     	nopl	(%rax)
145512dc0:     	cmpq	%rdi, %r10
145512dc3:     	je	0x145512d90 <.text+0x5511d90>
145512dc5:     	addq	$0x160, %rdi            # imm = 0x160
145512dcc:     	cmpq	%rsi, 0x88(%rbx)
145512dd3:     	leaq	0x160(%rbx), %rbx
145512dda:     	jne	0x145512dc0 <.text+0x5511dc0>
145512ddc:     	cmpq	$-0x1, -0x148(%rcx,%rdi)
145512de5:     	setne	%bl
145512de8:     	addb	%bl, %bl
145512dea:     	orb	-0x8(%rcx,%rdi), %bl
145512dee:     	jmp	0x145512d92 <.text+0x5511d92>
145512df0:     	movq	%r8, %rdx
145512df3:     	popq	%rbx
145512df4:     	popq	%rdi
145512df5:     	popq	%rsi
145512df6:     	retq
