
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a5d50:     	pushq	%rbp
1454a5d51:     	pushq	%r15
1454a5d53:     	pushq	%r14
1454a5d55:     	pushq	%r12
1454a5d57:     	pushq	%rsi
1454a5d58:     	pushq	%rdi
1454a5d59:     	pushq	%rbx
1454a5d5a:     	subq	$0x50, %rsp
1454a5d5e:     	leaq	0x50(%rsp), %rbp
1454a5d63:     	movq	$-0x2, -0x8(%rbp)
1454a5d6b:     	movq	%rdx, %rdi
1454a5d6e:     	movq	0x530(%rcx), %rbx
1454a5d75:     	cmpq	%rbx, %rdx
1454a5d78:     	jae	0x1454a5f43 <.text+0x54a4f43>
1454a5d7e:     	movq	%rcx, %rsi
1454a5d81:     	movq	0x528(%rcx), %rax
1454a5d88:     	leaq	(%rdi,%rdi,8), %rdx
1454a5d8c:     	leaq	(%rax,%rdx,8), %rcx
1454a5d90:     	movq	(%rax,%rdx,8), %r12
1454a5d94:     	movq	0x8(%rax,%rdx,8), %r8
1454a5d99:     	movq	%r8, -0x28(%rbp)
1454a5d9d:     	movq	0x10(%rax,%rdx,8), %r14
1454a5da2:     	movq	0x28(%rax,%rdx,8), %r15
1454a5da7:     	leaq	(%rax,%rdx,8), %rdx
1454a5dab:     	addq	$0x48, %rdx
1454a5daf:     	movq	%rdi, %rax
1454a5db2:     	notq	%rax
1454a5db5:     	addq	%rbx, %rax
1454a5db8:     	shlq	$0x3, %rax
1454a5dbc:     	leaq	(%rax,%rax,8), %r8
1454a5dc0:     	callq	0x1457149f1 <.text+0x57139f1>
1454a5dc5:     	decq	%rbx
1454a5dc8:     	movq	%rbx, 0x530(%rsi)
1454a5dcf:     	cmpq	$-0x1, %r12
1454a5dd3:     	je	0x1454a5f43 <.text+0x54a4f43>
1454a5dd9:     	movq	%r12, -0x18(%rbp)
1454a5ddd:     	callq	0x140002200 <.text+0x1200>
1454a5de2:     	movl	$0x20, %ecx
1454a5de7:     	movl	$0x1, %edx
1454a5dec:     	callq	0x1400021c0 <.text+0x11c0>
1454a5df1:     	testq	%rax, %rax
1454a5df4:     	je	0x1454a5f57 <.text+0x54a4f57>
1454a5dfa:     	leaq	0x538(%rsi), %rdi
1454a5e01:     	movq	%rax, -0x20(%rbp)
1454a5e05:     	movq	%r15, (%rax)
1454a5e08:     	movq	0x548(%rsi), %rbx
1454a5e0f:     	cmpq	0x538(%rsi), %rbx
1454a5e16:     	jne	0x1454a5e21 <.text+0x54a4e21>
1454a5e18:     	movq	%rdi, %rcx
1454a5e1b:     	callq	0x145717d60 <.text+0x5716d60>
1454a5e20:     	nop
1454a5e21:     	movq	0x540(%rsi), %rax
1454a5e28:     	movq	%rbx, %rcx
1454a5e2b:     	shlq	$0x5, %rcx
1454a5e2f:     	movq	$0x20, (%rax,%rcx)
1454a5e37:     	movq	-0x20(%rbp), %rdx
1454a5e3b:     	movq	%rdx, 0x8(%rax,%rcx)
1454a5e40:     	movq	$0x8, 0x10(%rax,%rcx)
1454a5e49:     	movw	$0xaa, 0x18(%rax,%rcx)
1454a5e50:     	incq	%rbx
1454a5e53:     	movq	%rbx, 0x548(%rsi)
1454a5e5a:     	testq	%r14, %r14
1454a5e5d:     	je	0x1454a5ef8 <.text+0x54a4ef8>
1454a5e63:     	shlq	$0x3, %r14
1454a5e67:     	xorl	%ebx, %ebx
1454a5e69:     	jmp	0x1454a5eb2 <.text+0x54a4eb2>
1454a5e6b:     	nopl	(%rax,%rax)
1454a5e70:     	movq	0x540(%rsi), %rax
1454a5e77:     	movq	%r15, %rcx
1454a5e7a:     	shlq	$0x5, %rcx
1454a5e7e:     	movq	$0x20, (%rax,%rcx)
1454a5e86:     	movq	-0x20(%rbp), %rdx
1454a5e8a:     	movq	%rdx, 0x8(%rax,%rcx)
1454a5e8f:     	movq	$0x8, 0x10(%rax,%rcx)
1454a5e98:     	movw	$0xaa, 0x18(%rax,%rcx)
1454a5e9f:     	incq	%r15
1454a5ea2:     	movq	%r15, 0x548(%rsi)
1454a5ea9:     	addq	$0x8, %rbx
1454a5ead:     	cmpq	%rbx, %r14
1454a5eb0:     	je	0x1454a5ef8 <.text+0x54a4ef8>
1454a5eb2:     	movq	-0x28(%rbp), %rax
1454a5eb6:     	movq	(%rax,%rbx), %r15
1454a5eba:     	callq	0x140002200 <.text+0x1200>
1454a5ebf:     	movl	$0x20, %ecx
1454a5ec4:     	movl	$0x1, %edx
1454a5ec9:     	callq	0x1400021c0 <.text+0x11c0>
1454a5ece:     	testq	%rax, %rax
1454a5ed1:     	je	0x1454a5f31 <.text+0x54a4f31>
1454a5ed3:     	movq	%rax, -0x20(%rbp)
1454a5ed7:     	movq	%r15, (%rax)
1454a5eda:     	movq	0x548(%rsi), %r15
1454a5ee1:     	cmpq	0x538(%rsi), %r15
1454a5ee8:     	jne	0x1454a5e70 <.text+0x54a4e70>
1454a5eea:     	movq	%rdi, %rcx
1454a5eed:     	callq	0x145717d60 <.text+0x5716d60>
1454a5ef2:     	nop
1454a5ef3:     	jmp	0x1454a5e70 <.text+0x54a4e70>
1454a5ef8:     	movq	-0x18(%rbp), %rdx
1454a5efc:     	testq	%rdx, %rdx
1454a5eff:     	je	0x1454a5f22 <.text+0x54a4f22>
1454a5f01:     	shlq	$0x3, %rdx
1454a5f05:     	movl	$0x8, %r8d
1454a5f0b:     	movq	-0x28(%rbp), %rcx
1454a5f0f:     	addq	$0x50, %rsp
1454a5f13:     	popq	%rbx
1454a5f14:     	popq	%rdi
1454a5f15:     	popq	%rsi
1454a5f16:     	popq	%r12
1454a5f18:     	popq	%r14
1454a5f1a:     	popq	%r15
1454a5f1c:     	popq	%rbp
1454a5f1d:     	jmp	0x1400021d0 <.text+0x11d0>
1454a5f22:     	addq	$0x50, %rsp
1454a5f26:     	popq	%rbx
1454a5f27:     	popq	%rdi
1454a5f28:     	popq	%rsi
1454a5f29:     	popq	%r12
1454a5f2b:     	popq	%r14
1454a5f2d:     	popq	%r15
1454a5f2f:     	popq	%rbp
1454a5f30:     	retq
1454a5f31:     	movl	$0x1, %ecx
1454a5f36:     	movl	$0x20, %edx
1454a5f3b:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454a5f40:     	nop
1454a5f41:     	jmp	0x1454a5f6b <.text+0x54a4f6b>
1454a5f43:     	leaq	0x1609eae(%rip), %r8    # 0x146aafdf8
1454a5f4a:     	movq	%rdi, %rcx
1454a5f4d:     	movq	%rbx, %rdx
1454a5f50:     	callq	0x1458a3c5b <.text+0x58a2c5b>
1454a5f55:     	ud2
1454a5f57:     	movb	$0x0, -0x9(%rbp)
1454a5f5b:     	movl	$0x1, %ecx
1454a5f60:     	movl	$0x20, %edx
1454a5f65:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454a5f6a:     	nop
1454a5f6b:     	ud2
