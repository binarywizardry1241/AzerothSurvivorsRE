
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458a9ae0:     	pushq	%rbp
1458a9ae1:     	pushq	%r15
1458a9ae3:     	pushq	%r14
1458a9ae5:     	pushq	%rsi
1458a9ae6:     	pushq	%rdi
1458a9ae7:     	pushq	%rbx
1458a9ae8:     	subq	$0xc8, %rsp
1458a9aef:     	leaq	0x80(%rsp), %rbp
1458a9af7:     	movaps	%xmm7, 0x30(%rbp)
1458a9afb:     	movaps	%xmm6, 0x20(%rbp)
1458a9aff:     	movq	$-0x2, 0x18(%rbp)
1458a9b07:     	movq	%r9, %rdi
1458a9b0a:     	movaps	%xmm2, %xmm6
1458a9b0d:     	movaps	%xmm1, %xmm7
1458a9b10:     	movq	%rcx, %rsi
1458a9b13:     	callq	0x140002200 <.text+0x1200>
1458a9b18:     	movl	$0x20, %ecx
1458a9b1d:     	movl	$0x1, %edx
1458a9b22:     	callq	0x1400021c0 <.text+0x11c0>
1458a9b27:     	testq	%rax, %rax
1458a9b2a:     	je	0x1458a9d75 <.text+0x58a8d75>
1458a9b30:     	movl	$0x63, (%rax)
1458a9b36:     	movq	$0x20, -0x50(%rbp)
1458a9b3e:     	movq	%rax, -0x48(%rbp)
1458a9b42:     	movw	$0x224, -0x38(%rbp)     # imm = 0x224
1458a9b48:     	movss	%xmm7, 0x4(%rax)
1458a9b4d:     	movq	$0x8, -0x40(%rbp)
1458a9b55:     	movq	-0x50(%rbp), %rcx
1458a9b59:     	andq	$-0x4, %rcx
1458a9b5d:     	movl	$0x8, %eax
1458a9b62:     	cmpq	$0x8, %rcx
1458a9b66:     	je	0x1458a9ccc <.text+0x58a8ccc>
1458a9b6c:     	movq	-0x48(%rbp), %rcx
1458a9b70:     	movss	%xmm6, (%rcx,%rax)
1458a9b75:     	addq	$0x4, %rax
1458a9b79:     	movq	%rax, -0x40(%rbp)
1458a9b7d:     	movq	-0x40(%rbp), %rax
1458a9b81:     	movq	%rax, (%rbp)
1458a9b85:     	movzwl	-0x38(%rbp), %eax
1458a9b89:     	movw	%ax, 0x8(%rbp)
1458a9b8d:     	movl	-0x36(%rbp), %eax
1458a9b90:     	movl	%eax, 0xa(%rbp)
1458a9b93:     	movzwl	-0x32(%rbp), %eax
1458a9b97:     	movw	%ax, 0xe(%rbp)
1458a9b9b:     	movups	-0x50(%rbp), %xmm0
1458a9b9f:     	movaps	%xmm0, -0x10(%rbp)
1458a9ba3:     	movq	(%rbp), %rdx
1458a9ba7:     	movq	-0x10(%rbp), %rax
1458a9bab:     	subq	%rdx, %rax
1458a9bae:     	cmpq	$0x3, %rax
1458a9bb2:     	jbe	0x1458a9cf9 <.text+0x58a8cf9>
1458a9bb8:     	movq	-0x8(%rbp), %rax
1458a9bbc:     	movl	$0x6, (%rax,%rdx)
1458a9bc3:     	addq	$0x4, %rdx
1458a9bc7:     	movq	%rdx, (%rbp)
1458a9bcb:     	movaps	-0x10(%rbp), %xmm0
1458a9bcf:     	movaps	%xmm0, -0x30(%rbp)
1458a9bd3:     	movq	(%rbp), %rax
1458a9bd7:     	movq	%rax, -0x20(%rbp)
1458a9bdb:     	movl	0x8(%rbp), %eax
1458a9bde:     	movl	%eax, -0x18(%rbp)
1458a9be1:     	movzwl	0xc(%rbp), %eax
1458a9be5:     	movw	%ax, -0x14(%rbp)
1458a9be9:     	movzwl	0xe(%rbp), %eax
1458a9bed:     	movw	%ax, -0x12(%rbp)
1458a9bf1:     	movq	-0x20(%rbp), %rdx
1458a9bf5:     	movq	-0x30(%rbp), %rax
1458a9bf9:     	subq	%rdx, %rax
1458a9bfc:     	cmpq	$0x3, %rax
1458a9c00:     	jbe	0x1458a9d21 <.text+0x58a8d21>
1458a9c06:     	movq	0xa0(%rbp), %rbx
1458a9c0d:     	movq	-0x28(%rbp), %rax
1458a9c11:     	movl	$0x0, (%rax,%rdx)
1458a9c18:     	addq	$0x4, %rdx
1458a9c1c:     	movq	%rdx, -0x20(%rbp)
1458a9c20:     	movaps	-0x30(%rbp), %xmm0
1458a9c24:     	movaps	%xmm0, -0x10(%rbp)
1458a9c28:     	movq	-0x20(%rbp), %rax
1458a9c2c:     	movq	%rax, (%rbp)
1458a9c30:     	movl	-0x18(%rbp), %eax
1458a9c33:     	movl	%eax, 0x8(%rbp)
1458a9c36:     	movzwl	-0x14(%rbp), %eax
1458a9c3a:     	movw	%ax, 0xc(%rbp)
1458a9c3e:     	movzwl	-0x12(%rbp), %eax
1458a9c42:     	movw	%ax, 0xe(%rbp)
1458a9c46:     	movq	(%rbp), %r14
1458a9c4a:     	movq	-0x10(%rbp), %r15
1458a9c4e:     	movq	%r15, %rax
1458a9c51:     	subq	%r14, %rax
1458a9c54:     	cmpq	%rax, %rbx
1458a9c57:     	ja	0x1458a9d49 <.text+0x58a8d49>
1458a9c5d:     	testq	%rbx, %rbx
1458a9c60:     	je	0x1458a9c74 <.text+0x58a8c74>
1458a9c62:     	movq	-0x8(%rbp), %rcx
1458a9c66:     	addq	%r14, %rcx
1458a9c69:     	movq	%rdi, %rdx
1458a9c6c:     	movq	%rbx, %r8
1458a9c6f:     	callq	0x145bc977b <.text+0x5bc877b>
1458a9c74:     	addq	%rbx, %r14
1458a9c77:     	movq	%r14, (%rbp)
1458a9c7b:     	cmpq	%r15, %r14
1458a9c7e:     	jne	0x1458a9c8a <.text+0x58a8c8a>
1458a9c80:     	leaq	-0x10(%rbp), %rcx
1458a9c84:     	callq	0x145d69340 <.text+0x5d68340>
1458a9c89:     	nop
1458a9c8a:     	movq	-0x8(%rbp), %rax
1458a9c8e:     	movb	$0x0, (%rax,%r14)
1458a9c93:     	incq	%r14
1458a9c96:     	movq	%r14, (%rbp)
1458a9c9a:     	movaps	-0x10(%rbp), %xmm0
1458a9c9e:     	movups	%xmm0, (%rsi)
1458a9ca1:     	movq	(%rbp), %rax
1458a9ca5:     	movq	%rax, 0x10(%rsi)
1458a9ca9:     	movq	0x8(%rbp), %rax
1458a9cad:     	movq	%rax, 0x18(%rsi)
1458a9cb1:     	movq	%rsi, %rax
1458a9cb4:     	movaps	0x20(%rbp), %xmm6
1458a9cb8:     	movaps	0x30(%rbp), %xmm7
1458a9cbc:     	addq	$0xc8, %rsp
1458a9cc3:     	popq	%rbx
1458a9cc4:     	popq	%rdi
1458a9cc5:     	popq	%rsi
1458a9cc6:     	popq	%r14
1458a9cc8:     	popq	%r15
1458a9cca:     	popq	%rbp
1458a9ccb:     	retq
1458a9ccc:     	movq	$0x1, 0x20(%rsp)
1458a9cd5:     	leaq	-0x50(%rbp), %rcx
1458a9cd9:     	movl	$0x8, %edx
1458a9cde:     	movl	$0x4, %r8d
1458a9ce4:     	movl	$0x1, %r9d
1458a9cea:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9cef:     	nop
1458a9cf0:     	movq	-0x40(%rbp), %rax
1458a9cf4:     	jmp	0x1458a9b6c <.text+0x58a8b6c>
1458a9cf9:     	movq	$0x1, 0x20(%rsp)
1458a9d02:     	leaq	-0x10(%rbp), %rcx
1458a9d06:     	movl	$0x4, %r8d
1458a9d0c:     	movl	$0x1, %r9d
1458a9d12:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9d17:     	nop
1458a9d18:     	movq	(%rbp), %rdx
1458a9d1c:     	jmp	0x1458a9bb8 <.text+0x58a8bb8>
1458a9d21:     	movq	$0x1, 0x20(%rsp)
1458a9d2a:     	leaq	-0x30(%rbp), %rcx
1458a9d2e:     	movl	$0x4, %r8d
1458a9d34:     	movl	$0x1, %r9d
1458a9d3a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9d3f:     	nop
1458a9d40:     	movq	-0x20(%rbp), %rdx
1458a9d44:     	jmp	0x1458a9c06 <.text+0x58a8c06>
1458a9d49:     	movq	$0x1, 0x20(%rsp)
1458a9d52:     	leaq	-0x10(%rbp), %rcx
1458a9d56:     	movl	$0x1, %r9d
1458a9d5c:     	movq	%r14, %rdx
1458a9d5f:     	movq	%rbx, %r8
1458a9d62:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458a9d67:     	nop
1458a9d68:     	movq	-0x10(%rbp), %r15
1458a9d6c:     	movq	(%rbp), %r14
1458a9d70:     	jmp	0x1458a9c62 <.text+0x58a8c62>
1458a9d75:     	movl	$0x1, %ecx
1458a9d7a:     	movl	$0x20, %edx
1458a9d7f:     	callq	0x145d6944b <.text+0x5d6844b>
1458a9d84:     	ud2
