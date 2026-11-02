
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145529b50:     	pushq	%rbp
145529b51:     	pushq	%r15
145529b53:     	pushq	%r14
145529b55:     	pushq	%r13
145529b57:     	pushq	%r12
145529b59:     	pushq	%rsi
145529b5a:     	pushq	%rdi
145529b5b:     	pushq	%rbx
145529b5c:     	subq	$0x68, %rsp
145529b60:     	leaq	0x60(%rsp), %rbp
145529b65:     	movaps	%xmm6, -0x10(%rbp)
145529b69:     	movq	$-0x2, -0x18(%rbp)
145529b71:     	movq	%rcx, %rsi
145529b74:     	movq	(%rdx), %r12
145529b77:     	movq	0x8(%rdx), %r15
145529b7b:     	cmpq	%r15, %r12
145529b7e:     	je	0x145529bc4 <.text+0x5528bc4>
145529b80:     	movq	%rdx, %rdi
145529b83:     	movq	0x10(%rdx), %r13
145529b87:     	movss	0x3cf411(%rip), %xmm6   # 0x1458f8fa0
145529b8f:     	nop
145529b90:     	leaq	0x8(%r12), %rbx
145529b95:     	movq	%rbx, (%rdi)
145529b98:     	movq	(%r13), %rax
145529b9c:     	movss	(%r12), %xmm0
145529ba2:     	movss	0x4(%r12), %xmm1
145529ba9:     	subss	(%rax), %xmm0
145529bad:     	subss	0x4(%rax), %xmm1
145529bb2:     	callq	0x145756e67 <.text+0x5755e67>
145529bb7:     	ucomiss	%xmm6, %xmm0
145529bba:     	jae	0x145529be0 <.text+0x5528be0>
145529bbc:     	movq	%rbx, %r12
145529bbf:     	cmpq	%r15, %rbx
145529bc2:     	jne	0x145529b90 <.text+0x5528b90>
145529bc4:     	movq	$0x0, (%rsi)
145529bcb:     	movq	$0x8, 0x8(%rsi)
145529bd3:     	movq	$0x0, 0x10(%rsi)
145529bdb:     	jmp	0x145529cb5 <.text+0x5528cb5>
145529be0:     	callq	0x140002200 <.text+0x1200>
145529be5:     	movl	$0x20, %ecx
145529bea:     	movl	$0x8, %edx
145529bef:     	callq	0x1400021c0 <.text+0x11c0>
145529bf4:     	testq	%rax, %rax
145529bf7:     	je	0x145529ccd <.text+0x5528ccd>
145529bfd:     	movq	%rax, %rbx
145529c00:     	movq	%r12, (%rax)
145529c03:     	addq	$0x8, %r12
145529c07:     	movq	$0x4, -0x30(%rbp)
145529c0f:     	movq	%rax, -0x28(%rbp)
145529c13:     	movq	$0x1, -0x20(%rbp)
145529c1b:     	cmpq	%r15, %r12
145529c1e:     	je	0x145529c9e <.text+0x5528c9e>
145529c24:     	movl	$0x1, %edi
145529c29:     	leaq	-0x30(%rbp), %r14
145529c2d:     	nopl	(%rax)
145529c30:     	movq	(%r13), %rax
145529c34:     	movss	(%r12), %xmm0
145529c3a:     	movss	0x4(%r12), %xmm1
145529c41:     	subss	(%rax), %xmm0
145529c45:     	subss	0x4(%rax), %xmm1
145529c4a:     	callq	0x145756e67 <.text+0x5755e67>
145529c4f:     	ucomiss	%xmm6, %xmm0
145529c52:     	jae	0x145529c5f <.text+0x5528c5f>
145529c54:     	addq	$0x8, %r12
145529c58:     	cmpq	%r15, %r12
145529c5b:     	jne	0x145529c30 <.text+0x5528c30>
145529c5d:     	jmp	0x145529c9e <.text+0x5528c9e>
145529c5f:     	cmpq	-0x30(%rbp), %rdi
145529c63:     	jne	0x145529c8a <.text+0x5528c8a>
145529c65:     	movq	$0x8, 0x20(%rsp)
145529c6e:     	movl	$0x1, %r8d
145529c74:     	movl	$0x8, %r9d
145529c7a:     	movq	%r14, %rcx
145529c7d:     	movq	%rdi, %rdx
145529c80:     	callq	0x145757d40 <.text+0x5756d40>
145529c85:     	nop
145529c86:     	movq	-0x28(%rbp), %rbx
145529c8a:     	movq	%r12, (%rbx,%rdi,8)
145529c8e:     	addq	$0x8, %r12
145529c92:     	incq	%rdi
145529c95:     	movq	%rdi, -0x20(%rbp)
145529c99:     	cmpq	%r15, %r12
145529c9c:     	jne	0x145529c30 <.text+0x5528c30>
145529c9e:     	movq	-0x20(%rbp), %rax
145529ca2:     	movq	%rax, 0x10(%rsi)
145529ca6:     	movq	-0x30(%rbp), %rax
145529caa:     	movq	%rax, (%rsi)
145529cad:     	movq	-0x28(%rbp), %rax
145529cb1:     	movq	%rax, 0x8(%rsi)
145529cb5:     	movq	%rsi, %rax
145529cb8:     	movaps	-0x10(%rbp), %xmm6
145529cbc:     	addq	$0x68, %rsp
145529cc0:     	popq	%rbx
145529cc1:     	popq	%rdi
145529cc2:     	popq	%rsi
145529cc3:     	popq	%r12
145529cc5:     	popq	%r13
145529cc7:     	popq	%r14
145529cc9:     	popq	%r15
145529ccb:     	popq	%rbp
145529ccc:     	retq
145529ccd:     	movl	$0x8, %ecx
145529cd2:     	movl	$0x20, %edx
145529cd7:     	callq	0x1458e721b <.text+0x58e621b>
145529cdc:     	ud2
