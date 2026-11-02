
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145466ab0:     	pushq	%rbp
145466ab1:     	pushq	%r15
145466ab3:     	pushq	%r14
145466ab5:     	pushq	%r13
145466ab7:     	pushq	%r12
145466ab9:     	pushq	%rsi
145466aba:     	pushq	%rdi
145466abb:     	pushq	%rbx
145466abc:     	subq	$0xb8, %rsp
145466ac3:     	leaq	0x80(%rsp), %rbp
145466acb:     	movq	$-0x2, 0x30(%rbp)
145466ad3:     	movq	%r9, %rdi
145466ad6:     	movl	%r8d, %ebx
145466ad9:     	movq	%rdx, %r14
145466adc:     	movq	%rcx, %rsi
145466adf:     	movq	0xb0(%rbp), %rax
145466ae6:     	movl	(%rax), %r12d
145466ae9:     	callq	0x140002200 <.text+0x1200>
145466aee:     	movl	$0x20, %ecx
145466af3:     	movl	$0x1, %edx
145466af8:     	callq	0x1400021c0 <.text+0x11c0>
145466afd:     	testq	%rax, %rax
145466b00:     	je	0x145467023 <.text+0x5466023>
145466b06:     	movw	$0x132, 0x28(%rbp)      # imm = 0x132
145466b0c:     	movq	$0x20, 0x10(%rbp)
145466b14:     	movq	%rax, 0x18(%rbp)
145466b18:     	movq	$0x0, 0x20(%rbp)
145466b20:     	leaq	0x10(%rbp), %rdx
145466b24:     	movq	%r14, %rcx
145466b27:     	callq	0x14551c6a0 <.text+0x551b6a0>
145466b2c:     	nop
145466b2d:     	movups	0x10(%rbp), %xmm0
145466b31:     	movups	0x20(%rbp), %xmm1
145466b35:     	movaps	%xmm1, (%rbp)
145466b39:     	movaps	%xmm0, -0x10(%rbp)
145466b3d:     	leaq	-0x10(%rbp), %rdx
145466b41:     	movq	%r14, %rcx
145466b44:     	callq	0x14551c6a0 <.text+0x551b6a0>
145466b49:     	nop
145466b4a:     	movaps	-0x10(%rbp), %xmm0
145466b4e:     	movaps	(%rbp), %xmm1
145466b52:     	movaps	%xmm1, 0x20(%rbp)
145466b56:     	movaps	%xmm0, 0x10(%rbp)
145466b5a:     	movq	0x20(%rbp), %rdx
145466b5e:     	movq	0x10(%rbp), %rax
145466b62:     	subq	%rdx, %rax
145466b65:     	cmpq	$0x3, %rax
145466b69:     	jbe	0x145466f0b <.text+0x5465f0b>
145466b6f:     	movq	0x18(%rbp), %rax
145466b73:     	movl	%ebx, (%rax,%rdx)
145466b76:     	addq	$0x4, %rdx
145466b7a:     	movq	%rdx, 0x20(%rbp)
145466b7e:     	movaps	0x10(%rbp), %xmm0
145466b82:     	movaps	%xmm0, -0x10(%rbp)
145466b86:     	movq	0x20(%rbp), %rax
145466b8a:     	movq	%rax, (%rbp)
145466b8e:     	movq	0x28(%rbp), %rax
145466b92:     	movq	%rax, 0x8(%rbp)
145466b96:     	movq	(%rbp), %rdx
145466b9a:     	movq	-0x10(%rbp), %rax
145466b9e:     	subq	%rdx, %rax
145466ba1:     	cmpq	$0x1, %rax
145466ba5:     	jbe	0x145466f33 <.text+0x5465f33>
145466bab:     	movq	0xa0(%rbp), %r14
145466bb2:     	leal	0x8(%r12), %eax
145466bb7:     	shll	$0x5, %eax
145466bba:     	movq	-0x8(%rbp), %rcx
145466bbe:     	movw	%ax, (%rcx,%rdx)
145466bc2:     	addq	$0x2, %rdx
145466bc6:     	movq	%rdx, (%rbp)
145466bca:     	movaps	-0x10(%rbp), %xmm0
145466bce:     	movaps	%xmm0, 0x10(%rbp)
145466bd2:     	movq	(%rbp), %rax
145466bd6:     	movq	%rax, 0x20(%rbp)
145466bda:     	movq	0x8(%rbp), %rax
145466bde:     	cmpq	$0xff, %r14
145466be5:     	movl	$0xff, %ebx
145466bea:     	cmovbq	%r14, %rbx
145466bee:     	movq	%rax, 0x28(%rbp)
145466bf2:     	movq	0x20(%rbp), %r15
145466bf6:     	cmpq	0x10(%rbp), %r15
145466bfa:     	jne	0x145466c06 <.text+0x5465c06>
145466bfc:     	leaq	0x10(%rbp), %rcx
145466c00:     	callq	0x145903690 <.text+0x5902690>
145466c05:     	nop
145466c06:     	movq	0x18(%rbp), %rax
145466c0a:     	movb	%bl, (%rax,%r15)
145466c0e:     	incq	%r15
145466c11:     	movq	%r15, 0x20(%rbp)
145466c15:     	movaps	0x10(%rbp), %xmm0
145466c19:     	movaps	%xmm0, -0x50(%rbp)
145466c1d:     	movq	0x20(%rbp), %rax
145466c21:     	movq	%rax, -0x40(%rbp)
145466c25:     	movq	0x28(%rbp), %rax
145466c29:     	movq	%rax, -0x38(%rbp)
145466c2d:     	testq	%r14, %r14
145466c30:     	je	0x145466cd5 <.text+0x5465cd5>
145466c36:     	shlq	$0x3, %r14
145466c3a:     	addq	$-0x8, %r14
145466c3e:     	xorl	%r13d, %r13d
145466c41:     	leaq	0x10(%rbp), %rbx
145466c45:     	nopw	%cs:(%rax,%rax)
145466c50:     	movq	(%rdi,%r13), %r15
145466c54:     	movaps	-0x50(%rbp), %xmm0
145466c58:     	movaps	-0x40(%rbp), %xmm1
145466c5c:     	movaps	%xmm1, 0x20(%rbp)
145466c60:     	movaps	%xmm0, 0x10(%rbp)
145466c64:     	movq	0x20(%rbp), %rdx
145466c68:     	movq	0x10(%rbp), %rax
145466c6c:     	subq	%rdx, %rax
145466c6f:     	cmpq	$0x7, %rax
145466c73:     	jbe	0x145466cb1 <.text+0x5465cb1>
145466c75:     	movq	0x18(%rbp), %rax
145466c79:     	movq	%r15, (%rax,%rdx)
145466c7d:     	addq	$0x8, %rdx
145466c81:     	movq	%rdx, 0x20(%rbp)
145466c85:     	movaps	0x10(%rbp), %xmm0
145466c89:     	movaps	%xmm0, -0x50(%rbp)
145466c8d:     	movq	0x20(%rbp), %rax
145466c91:     	movq	%rax, -0x40(%rbp)
145466c95:     	movq	0x28(%rbp), %rax
145466c99:     	movq	%rax, -0x38(%rbp)
145466c9d:     	cmpq	$0x7f0, %r13            # imm = 0x7F0
145466ca4:     	je	0x145466cd5 <.text+0x5465cd5>
145466ca6:     	cmpq	%r13, %r14
145466ca9:     	leaq	0x8(%r13), %r13
145466cad:     	jne	0x145466c50 <.text+0x5465c50>
145466caf:     	jmp	0x145466cd5 <.text+0x5465cd5>
145466cb1:     	movq	$0x1, 0x20(%rsp)
145466cba:     	movl	$0x8, %r8d
145466cc0:     	movl	$0x1, %r9d
145466cc6:     	movq	%rbx, %rcx
145466cc9:     	callq	0x1457744b0 <.text+0x57734b0>
145466cce:     	nop
145466ccf:     	movq	0x20(%rbp), %rdx
145466cd3:     	jmp	0x145466c75 <.text+0x5465c75>
145466cd5:     	movaps	-0x50(%rbp), %xmm0
145466cd9:     	movq	-0x40(%rbp), %rax
145466cdd:     	movq	%rax, 0x20(%rbp)
145466ce1:     	movq	-0x38(%rbp), %rax
145466ce5:     	movq	%rax, 0x28(%rbp)
145466ce9:     	movaps	%xmm0, 0x10(%rbp)
145466ced:     	movq	0x20(%rbp), %rbx
145466cf1:     	cmpq	0x10(%rbp), %rbx
145466cf5:     	jne	0x145466d01 <.text+0x5465d01>
145466cf7:     	leaq	0x10(%rbp), %rcx
145466cfb:     	callq	0x145903690 <.text+0x5902690>
145466d00:     	nop
145466d01:     	movq	0xa8(%rbp), %rdi
145466d08:     	movq	0x18(%rbp), %rax
145466d0c:     	movb	$0x0, (%rax,%rbx)
145466d10:     	incq	%rbx
145466d13:     	movq	%rbx, 0x20(%rbp)
145466d17:     	movaps	0x10(%rbp), %xmm0
145466d1b:     	movaps	%xmm0, -0x30(%rbp)
145466d1f:     	movq	0x20(%rbp), %rax
145466d23:     	movq	%rax, -0x20(%rbp)
145466d27:     	movq	0x28(%rbp), %rax
145466d2b:     	movq	%rax, -0x18(%rbp)
145466d2f:     	movl	(%rdi), %eax
145466d31:     	testl	%eax, %eax
145466d33:     	je	0x145466d7e <.text+0x5465d7e>
145466d35:     	cmpl	$0x1, %eax
145466d38:     	jne	0x145466de0 <.text+0x5465de0>
145466d3e:     	movq	-0x30(%rbp), %rax
145466d42:     	movq	-0x20(%rbp), %rdx
145466d46:     	subq	%rdx, %rax
145466d49:     	cmpq	$0x1, %rax
145466d4d:     	jbe	0x145466fab <.text+0x5465fab>
145466d53:     	addq	$0x4, %rdi
145466d57:     	movq	-0x28(%rbp), %rax
145466d5b:     	movw	$0x40, (%rax,%rdx)
145466d61:     	addq	$0x2, %rdx
145466d65:     	movq	%rdx, -0x20(%rbp)
145466d69:     	leaq	-0x10(%rbp), %rcx
145466d6d:     	leaq	-0x30(%rbp), %rdx
145466d71:     	movq	%rdi, %r8
145466d74:     	callq	0x14550db10 <.text+0x550cb10>
145466d79:     	jmp	0x145466e1f <.text+0x5465e1f>
145466d7e:     	movq	0x8(%rdi), %rdi
145466d82:     	movq	-0x30(%rbp), %rax
145466d86:     	movq	-0x20(%rbp), %rdx
145466d8a:     	subq	%rdx, %rax
145466d8d:     	cmpq	$0x1, %rax
145466d91:     	jbe	0x145466fd3 <.text+0x5465fd3>
145466d97:     	movq	-0x28(%rbp), %rax
145466d9b:     	movw	$0x2, (%rax,%rdx)
145466da1:     	addq	$0x2, %rdx
145466da5:     	movq	%rdx, -0x20(%rbp)
145466da9:     	movaps	-0x30(%rbp), %xmm0
145466dad:     	movaps	%xmm0, 0x10(%rbp)
145466db1:     	movq	-0x20(%rbp), %rax
145466db5:     	movq	%rax, 0x20(%rbp)
145466db9:     	movq	-0x18(%rbp), %rax
145466dbd:     	movq	%rax, 0x28(%rbp)
145466dc1:     	leaq	0x10(%rbp), %rdx
145466dc5:     	movq	%rdi, %rcx
145466dc8:     	callq	0x14551c6a0 <.text+0x551b6a0>
145466dcd:     	nop
145466dce:     	movaps	0x10(%rbp), %xmm0
145466dd2:     	movaps	0x20(%rbp), %xmm1
145466dd6:     	movaps	%xmm1, (%rbp)
145466dda:     	movaps	%xmm0, -0x10(%rbp)
145466dde:     	jmp	0x145466e1f <.text+0x5465e1f>
145466de0:     	movq	-0x30(%rbp), %rax
145466de4:     	movq	-0x20(%rbp), %rdx
145466de8:     	subq	%rdx, %rax
145466deb:     	cmpq	$0x1, %rax
145466def:     	jbe	0x145466ffb <.text+0x5465ffb>
145466df5:     	movq	-0x28(%rbp), %rax
145466df9:     	movw	$0x0, (%rax,%rdx)
145466dff:     	addq	$0x2, %rdx
145466e03:     	movq	%rdx, -0x20(%rbp)
145466e07:     	movaps	-0x30(%rbp), %xmm0
145466e0b:     	movaps	%xmm0, -0x10(%rbp)
145466e0f:     	movq	-0x20(%rbp), %rax
145466e13:     	movq	%rax, (%rbp)
145466e17:     	movq	-0x18(%rbp), %rax
145466e1b:     	movq	%rax, 0x8(%rbp)
145466e1f:     	movaps	-0x10(%rbp), %xmm0
145466e23:     	movq	(%rbp), %rax
145466e27:     	movq	%rax, -0x40(%rbp)
145466e2b:     	movq	0x8(%rbp), %rax
145466e2f:     	movq	%rax, -0x38(%rbp)
145466e33:     	movaps	%xmm0, -0x50(%rbp)
145466e37:     	testl	%r12d, %r12d
145466e3a:     	je	0x145466edd <.text+0x5465edd>
145466e40:     	movq	0xb0(%rbp), %rax
145466e47:     	movl	0x4(%rax), %ebx
145466e4a:     	movl	0x8(%rax), %edi
145466e4d:     	movaps	-0x50(%rbp), %xmm0
145466e51:     	movq	-0x40(%rbp), %rax
145466e55:     	movq	%rax, 0x20(%rbp)
145466e59:     	movq	-0x38(%rbp), %rax
145466e5d:     	movq	%rax, 0x28(%rbp)
145466e61:     	movaps	%xmm0, 0x10(%rbp)
145466e65:     	movq	0x20(%rbp), %rdx
145466e69:     	movq	0x10(%rbp), %rax
145466e6d:     	subq	%rdx, %rax
145466e70:     	cmpq	$0x3, %rax
145466e74:     	jbe	0x145466f5b <.text+0x5465f5b>
145466e7a:     	movq	0x18(%rbp), %rax
145466e7e:     	movl	%ebx, (%rax,%rdx)
145466e81:     	addq	$0x4, %rdx
145466e85:     	movq	%rdx, 0x20(%rbp)
145466e89:     	movaps	0x10(%rbp), %xmm0
145466e8d:     	movaps	%xmm0, -0x10(%rbp)
145466e91:     	movq	0x20(%rbp), %rax
145466e95:     	movq	%rax, (%rbp)
145466e99:     	movq	0x28(%rbp), %rax
145466e9d:     	movq	%rax, 0x8(%rbp)
145466ea1:     	movq	(%rbp), %rdx
145466ea5:     	movq	-0x10(%rbp), %rax
145466ea9:     	subq	%rdx, %rax
145466eac:     	cmpq	$0x3, %rax
145466eb0:     	jbe	0x145466f83 <.text+0x5465f83>
145466eb6:     	movq	-0x8(%rbp), %rax
145466eba:     	movl	%edi, (%rax,%rdx)
145466ebd:     	addq	$0x4, %rdx
145466ec1:     	movq	%rdx, (%rbp)
145466ec5:     	movaps	-0x10(%rbp), %xmm0
145466ec9:     	movaps	%xmm0, -0x50(%rbp)
145466ecd:     	movq	(%rbp), %rax
145466ed1:     	movq	%rax, -0x40(%rbp)
145466ed5:     	movq	0x8(%rbp), %rax
145466ed9:     	movq	%rax, -0x38(%rbp)
145466edd:     	movaps	-0x50(%rbp), %xmm0
145466ee1:     	movq	-0x40(%rbp), %rax
145466ee5:     	movq	%rax, 0x10(%rsi)
145466ee9:     	movq	-0x38(%rbp), %rax
145466eed:     	movq	%rax, 0x18(%rsi)
145466ef1:     	movups	%xmm0, (%rsi)
145466ef4:     	movq	%rsi, %rax
145466ef7:     	addq	$0xb8, %rsp
145466efe:     	popq	%rbx
145466eff:     	popq	%rdi
145466f00:     	popq	%rsi
145466f01:     	popq	%r12
145466f03:     	popq	%r13
145466f05:     	popq	%r14
145466f07:     	popq	%r15
145466f09:     	popq	%rbp
145466f0a:     	retq
