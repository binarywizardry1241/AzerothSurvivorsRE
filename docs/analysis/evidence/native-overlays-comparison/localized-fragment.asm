
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c6cf0:     	pushq	%rbp
1400c6cf1:     	pushq	%r14
1400c6cf3:     	pushq	%rsi
1400c6cf4:     	pushq	%rdi
1400c6cf5:     	pushq	%rbx
1400c6cf6:     	subq	$0x60, %rsp
1400c6cfa:     	leaq	0x60(%rsp), %rbp
1400c6cff:     	movq	$-0x2, -0x8(%rbp)
1400c6d07:     	movq	%rcx, %rsi
1400c6d0a:     	addq	%rdx, %r8
1400c6d0d:     	leaq	-0x20(%rbp), %rcx
1400c6d11:     	callq	0x140103d00 <.text+0x102d00>
1400c6d16:     	movq	-0x18(%rbp), %rdi
1400c6d1a:     	movq	-0x10(%rbp), %rbx
1400c6d1e:     	movq	$0x1, 0x20(%rsp)
1400c6d27:     	leaq	0x58376fe(%rip), %r9    # 0x1458fe42c
1400c6d2e:     	leaq	-0x38(%rbp), %rcx
1400c6d32:     	movq	%rdi, %rdx
1400c6d35:     	movq	%rbx, %r8
1400c6d38:     	callq	0x140032af0 <.text+0x31af0>
1400c6d3d:     	nop
1400c6d3e:     	movq	-0x28(%rbp), %rax
1400c6d42:     	movq	%rax, 0x10(%rsi)
1400c6d46:     	movups	-0x38(%rbp), %xmm0
1400c6d4a:     	movups	%xmm0, (%rsi)
1400c6d4d:     	testq	%rbx, %rbx
1400c6d50:     	je	0x1400c6d82 <.text+0xc5d82>
1400c6d52:     	leaq	0x8(%rdi), %r14
1400c6d56:     	jmp	0x1400c6d69 <.text+0xc5d69>
1400c6d58:     	nopl	(%rax,%rax)
1400c6d60:     	addq	$0x18, %r14
1400c6d64:     	decq	%rbx
1400c6d67:     	je	0x1400c6d82 <.text+0xc5d82>
1400c6d69:     	movq	-0x8(%r14), %rdx
1400c6d6d:     	testq	%rdx, %rdx
1400c6d70:     	je	0x1400c6d60 <.text+0xc5d60>
1400c6d72:     	movq	(%r14), %rcx
1400c6d75:     	movl	$0x1, %r8d
1400c6d7b:     	callq	0x1400021d0 <.text+0x11d0>
1400c6d80:     	jmp	0x1400c6d60 <.text+0xc5d60>
1400c6d82:     	movq	-0x20(%rbp), %rax
1400c6d86:     	testq	%rax, %rax
1400c6d89:     	je	0x1400c6da1 <.text+0xc5da1>
1400c6d8b:     	shlq	$0x3, %rax
1400c6d8f:     	leaq	(%rax,%rax,2), %rdx
1400c6d93:     	movl	$0x8, %r8d
1400c6d99:     	movq	%rdi, %rcx
1400c6d9c:     	callq	0x1400021d0 <.text+0x11d0>
1400c6da1:     	movq	%rsi, %rax
1400c6da4:     	addq	$0x60, %rsp
1400c6da8:     	popq	%rbx
1400c6da9:     	popq	%rdi
1400c6daa:     	popq	%rsi
1400c6dab:     	popq	%r14
1400c6dad:     	popq	%rbp
1400c6dae:     	retq
