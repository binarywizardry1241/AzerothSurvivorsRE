
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b3b60:     	pushq	%rbp
1459b3b61:     	pushq	%r15
1459b3b63:     	pushq	%r14
1459b3b65:     	pushq	%r13
1459b3b67:     	pushq	%r12
1459b3b69:     	pushq	%rsi
1459b3b6a:     	pushq	%rdi
1459b3b6b:     	pushq	%rbx
1459b3b6c:     	subq	$0x58, %rsp
1459b3b70:     	leaq	0x50(%rsp), %rbp
1459b3b75:     	movaps	%xmm6, -0x10(%rbp)
1459b3b79:     	movq	$-0x2, -0x18(%rbp)
1459b3b81:     	movq	(%rcx), %rsi
1459b3b84:     	movq	0x8(%rcx), %rdi
1459b3b88:     	movq	(%rdx), %rax
1459b3b8b:     	movq	0x8(%rdx), %r8
1459b3b8f:     	cmpq	%rdi, %rsi
1459b3b92:     	je	0x1459b3d21 <.text+0x59b2d21>
1459b3b98:     	movq	%rax, -0x28(%rbp)
1459b3b9c:     	movq	0x10(%rcx), %rbx
1459b3ba0:     	movq	0x10(%rdx), %rax
1459b3ba4:     	subq	%rsi, %rdi
1459b3ba7:     	shrq	$0x3, %rdi
1459b3bab:     	movq	%r8, -0x20(%rbp)
1459b3baf:     	leaq	(%rax,%r8,8), %r15
1459b3bb3:     	xorl	%r14d, %r14d
1459b3bb6:     	leaq	0x180223f(%rip), %r12   # 0x1471b5dfc
1459b3bbd:     	movss	0x3e7353(%rip), %xmm6   # 0x145d9af18
1459b3bc5:     	leaq	0x1802ce8(%rip), %r13   # 0x1471b68b4
1459b3bcc:     	jmp	0x1459b3be7 <.text+0x59b2be7>
1459b3bce:     	movl	%edx, %ecx
1459b3bd0:     	shlq	$0x20, %rax
1459b3bd4:     	orq	%rcx, %rax
1459b3bd7:     	movq	%rax, (%r15,%r14,8)
1459b3bdb:     	incq	%r14
1459b3bde:     	cmpq	%r14, %rdi
1459b3be1:     	je	0x1459b3d16 <.text+0x59b2d16>
1459b3be7:     	movq	(%rbx), %rcx
1459b3bea:     	cmpq	$0x5, %rcx
1459b3bee:     	ja	0x1459b3d39 <.text+0x59b2d39>
1459b3bf4:     	movq	(%rsi,%r14,8), %rdx
1459b3bf8:     	movss	(%r12,%rcx,4), %xmm0
1459b3bfe:     	mulss	%xmm6, %xmm0
1459b3c02:     	movq	%rdx, %rax
1459b3c05:     	shrq	$0x20, %rax
1459b3c09:     	movl	%edx, %ecx
1459b3c0b:     	movslq	(%r13,%rcx,4), %rcx
1459b3c10:     	addq	%r13, %rcx
1459b3c13:     	jmpq	*%rcx
1459b3c15:     	movd	%eax, %xmm1
1459b3c19:     	mulss	%xmm1, %xmm0
1459b3c1d:     	movd	%xmm0, %eax
1459b3c21:     	xorl	%ecx, %ecx
1459b3c23:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c25:     	movd	%eax, %xmm1
1459b3c29:     	mulss	%xmm1, %xmm0
1459b3c2d:     	movd	%xmm0, %eax
1459b3c31:     	movl	$0x4, %ecx
1459b3c36:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c38:     	movd	%eax, %xmm1
1459b3c3c:     	mulss	%xmm1, %xmm0
1459b3c40:     	movd	%xmm0, %eax
1459b3c44:     	movl	$0xc, %ecx
1459b3c49:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c4b:     	movd	%eax, %xmm1
1459b3c4f:     	mulss	%xmm1, %xmm0
1459b3c53:     	movd	%xmm0, %eax
1459b3c57:     	movl	$0x9, %ecx
1459b3c5c:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c61:     	movd	%eax, %xmm1
1459b3c65:     	mulss	%xmm1, %xmm0
1459b3c69:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1459b3c6e:     	movd	%xmm0, %eax
1459b3c72:     	movl	$0x2, %ecx
1459b3c77:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c7c:     	movd	%eax, %xmm1
1459b3c80:     	mulss	%xmm1, %xmm0
1459b3c84:     	movd	%xmm0, %eax
1459b3c88:     	movl	$0x3, %ecx
1459b3c8d:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3c92:     	movd	%eax, %xmm1
1459b3c96:     	mulss	%xmm1, %xmm0
1459b3c9a:     	movd	%xmm0, %eax
1459b3c9e:     	movl	$0x7, %ecx
1459b3ca3:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3ca8:     	movd	%eax, %xmm1
1459b3cac:     	mulss	%xmm1, %xmm0
1459b3cb0:     	movd	%xmm0, %eax
1459b3cb4:     	movl	$0x1, %ecx
1459b3cb9:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3cbe:     	movd	%eax, %xmm1
1459b3cc2:     	mulss	%xmm1, %xmm0
1459b3cc6:     	movd	%xmm0, %eax
1459b3cca:     	movl	$0x5, %ecx
1459b3ccf:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3cd4:     	movd	%eax, %xmm1
1459b3cd8:     	mulss	%xmm1, %xmm0
1459b3cdc:     	movd	%xmm0, %eax
1459b3ce0:     	movl	$0x6, %ecx
1459b3ce5:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3cea:     	movd	%eax, %xmm1
1459b3cee:     	mulss	%xmm1, %xmm0
1459b3cf2:     	movd	%xmm0, %eax
1459b3cf6:     	movl	$0xa, %ecx
1459b3cfb:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3d00:     	movd	%eax, %xmm1
1459b3d04:     	mulss	%xmm1, %xmm0
1459b3d08:     	movd	%xmm0, %eax
1459b3d0c:     	movl	$0x8, %ecx
1459b3d11:     	jmp	0x1459b3bd0 <.text+0x59b2bd0>
1459b3d16:     	movq	-0x20(%rbp), %r8
1459b3d1a:     	addq	%r14, %r8
1459b3d1d:     	movq	-0x28(%rbp), %rax
1459b3d21:     	movq	%r8, (%rax)
1459b3d24:     	movaps	-0x10(%rbp), %xmm6
1459b3d28:     	addq	$0x58, %rsp
1459b3d2c:     	popq	%rbx
1459b3d2d:     	popq	%rdi
1459b3d2e:     	popq	%rsi
1459b3d2f:     	popq	%r12
1459b3d31:     	popq	%r13
1459b3d33:     	popq	%r14
1459b3d35:     	popq	%r15
1459b3d37:     	popq	%rbp
1459b3d38:     	retq
1459b3d39:     	addq	%r14, -0x20(%rbp)
1459b3d3d:     	leaq	0x180210c(%rip), %r8    # 0x1471b5e50
1459b3d44:     	movl	$0x6, %edx
1459b3d49:     	callq	0x145d697e3 <.text+0x5d687e3>
1459b3d4e:     	nop
1459b3d4f:     	ud2
