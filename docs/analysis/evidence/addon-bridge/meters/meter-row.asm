
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b8d60:     	pushq	%rbp
1459b8d61:     	pushq	%r15
1459b8d63:     	pushq	%r14
1459b8d65:     	pushq	%r13
1459b8d67:     	pushq	%r12
1459b8d69:     	pushq	%rsi
1459b8d6a:     	pushq	%rdi
1459b8d6b:     	pushq	%rbx
1459b8d6c:     	subq	$0x118, %rsp            # imm = 0x118
1459b8d73:     	leaq	0x80(%rsp), %rbp
1459b8d7b:     	movapd	%xmm6, 0x80(%rbp)
1459b8d83:     	movq	$-0x2, 0x78(%rbp)
1459b8d8b:     	movq	(%rcx), %r14
1459b8d8e:     	movq	0x8(%rcx), %r15
1459b8d92:     	movq	(%rdx), %rax
1459b8d95:     	movq	0x8(%rdx), %r8
1459b8d99:     	cmpq	%r15, %r14
1459b8d9c:     	je	0x1459b8f58 <.text+0x59b7f58>
1459b8da2:     	movq	%rax, 0x60(%rbp)
1459b8da6:     	movq	0x10(%rcx), %rax
1459b8daa:     	movq	%rax, 0x28(%rbp)
1459b8dae:     	movq	0x18(%rcx), %r13
1459b8db2:     	movq	0x10(%rdx), %rax
1459b8db6:     	subq	%r14, %r15
1459b8db9:     	shrq	$0x3, %r15
1459b8dbd:     	movq	%r8, 0x68(%rbp)
1459b8dc1:     	leaq	(%r8,%r8,2), %rcx
1459b8dc5:     	leaq	(%rax,%rcx,8), %rdi
1459b8dc9:     	xorl	%eax, %eax
1459b8dcb:     	leaq	-0x40(%rbp), %rsi
1459b8dcf:     	leaq	0x1f4d3a(%rip), %rbx    # 0x145badb10 <.text+0x5bacb10>
1459b8dd6:     	jmp	0x1459b8e03 <.text+0x59b7e03>
1459b8dd8:     	nopl	(%rax,%rax)
1459b8de0:     	movq	-0x48(%rbp), %rax
1459b8de4:     	movq	%rax, 0x10(%rdi)
1459b8de8:     	movups	-0x58(%rbp), %xmm0
1459b8dec:     	movups	%xmm0, (%rdi)
1459b8def:     	movq	0x58(%rbp), %rax
1459b8df3:     	incq	%rax
1459b8df6:     	addq	$0x18, %rdi
1459b8dfa:     	cmpq	%rax, %r15
1459b8dfd:     	je	0x1459b8f4d <.text+0x59b7f4d>
1459b8e03:     	movq	%rax, 0x58(%rbp)
1459b8e07:     	movq	(%r14,%rax,8), %r12
1459b8e0b:     	movq	0x20(%r12), %rcx
1459b8e10:     	movq	0x28(%r12), %rdx
1459b8e15:     	movq	$0x0, -0x40(%rbp)
1459b8e1d:     	movq	$0x1, -0x38(%rbp)
1459b8e25:     	movq	$0x0, -0x30(%rbp)
1459b8e2d:     	testq	%rdx, %rdx
1459b8e30:     	jne	0x1459b8f0b <.text+0x59b7f0b>
1459b8e36:     	addq	%rcx, %rdx
1459b8e39:     	movq	%rsi, %r8
1459b8e3c:     	callq	0x1459b9b70 <.text+0x59b8b70>
1459b8e41:     	nop
1459b8e42:     	movq	-0x30(%rbp), %rax
1459b8e46:     	movq	%rax, 0x50(%rbp)
1459b8e4a:     	movups	-0x40(%rbp), %xmm0
1459b8e4e:     	movaps	%xmm0, 0x40(%rbp)
1459b8e52:     	movsd	0x40(%r12), %xmm6
1459b8e59:     	movapd	%xmm6, %xmm0
1459b8e5d:     	callq	0x145bc97db <.text+0x5bc87db>
1459b8e62:     	movsd	%xmm0, 0x20(%rbp)
1459b8e67:     	movapd	%xmm6, %xmm0
1459b8e6b:     	movq	0x28(%rbp), %rax
1459b8e6f:     	divsd	(%rax), %xmm0
1459b8e73:     	movsd	%xmm0, 0x18(%rbp)
1459b8e78:     	divsd	(%r13), %xmm6
1459b8e7e:     	movsd	%xmm6, 0x10(%rbp)
1459b8e83:     	movzbl	0x48(%r12), %eax
1459b8e89:     	movb	%al, 0x77(%rbp)
1459b8e8c:     	leaq	0x40(%rbp), %rax
1459b8e90:     	movq	%rax, -0x40(%rbp)
1459b8e94:     	leaq	-0x59b6dbb(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1459b8e9b:     	movq	%rax, -0x38(%rbp)
1459b8e9f:     	leaq	0x20(%rbp), %rax
1459b8ea3:     	movq	%rax, -0x30(%rbp)
1459b8ea7:     	movq	%rbx, -0x28(%rbp)
1459b8eab:     	leaq	0x18(%rbp), %rax
1459b8eaf:     	movq	%rax, -0x20(%rbp)
1459b8eb3:     	movq	%rbx, -0x18(%rbp)
1459b8eb7:     	leaq	0x10(%rbp), %rax
1459b8ebb:     	movq	%rax, -0x10(%rbp)
1459b8ebf:     	movq	%rbx, -0x8(%rbp)
1459b8ec3:     	leaq	0x77(%rbp), %rax
1459b8ec7:     	movq	%rax, (%rbp)
1459b8ecb:     	leaq	0x1f19de(%rip), %rax    # 0x145baa8b0 <.text+0x5ba98b0>
1459b8ed2:     	movq	%rax, 0x8(%rbp)
1459b8ed6:     	leaq	-0x58(%rbp), %rcx
1459b8eda:     	leaq	0x17fd8cf(%rip), %rdx   # 0x1471b67b0
1459b8ee1:     	movq	%rsi, %r8
1459b8ee4:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b8ee9:     	nop
1459b8eea:     	movq	0x40(%rbp), %rdx
1459b8eee:     	testq	%rdx, %rdx
1459b8ef1:     	je	0x1459b8de0 <.text+0x59b7de0>
1459b8ef7:     	movq	0x48(%rbp), %rcx
1459b8efb:     	movl	$0x1, %r8d
1459b8f01:     	callq	0x1400021d0 <.text+0x11d0>
1459b8f06:     	jmp	0x1459b8de0 <.text+0x59b7de0>
1459b8f0b:     	movq	%rdx, %r8
1459b8f0e:     	shrq	$0x2, %r8
1459b8f12:     	movl	%edx, %eax
1459b8f14:     	andl	$0x3, %eax
1459b8f17:     	cmpq	$0x1, %rax
1459b8f1b:     	sbbq	$-0x1, %r8
1459b8f1f:     	movq	$0x1, 0x20(%rsp)
1459b8f28:     	movl	$0x1, %r9d
1459b8f2e:     	movq	%rcx, 0x30(%rbp)
1459b8f32:     	movq	%rsi, %rcx
1459b8f35:     	movq	%rdx, 0x38(%rbp)
1459b8f39:     	xorl	%edx, %edx
1459b8f3b:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b8f40:     	movq	0x38(%rbp), %rdx
1459b8f44:     	movq	0x30(%rbp), %rcx
1459b8f48:     	jmp	0x1459b8e36 <.text+0x59b7e36>
1459b8f4d:     	movq	0x68(%rbp), %r8
1459b8f51:     	addq	%rax, %r8
1459b8f54:     	movq	0x60(%rbp), %rax
1459b8f58:     	movq	%r8, (%rax)
1459b8f5b:     	movaps	0x80(%rbp), %xmm6
1459b8f62:     	addq	$0x118, %rsp            # imm = 0x118
1459b8f69:     	popq	%rbx
1459b8f6a:     	popq	%rdi
1459b8f6b:     	popq	%rsi
1459b8f6c:     	popq	%r12
1459b8f6e:     	popq	%r13
1459b8f70:     	popq	%r14
1459b8f72:     	popq	%r15
1459b8f74:     	popq	%rbp
1459b8f75:     	retq
