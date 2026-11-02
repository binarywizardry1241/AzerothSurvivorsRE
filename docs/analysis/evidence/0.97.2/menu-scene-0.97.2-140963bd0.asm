
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140963bd0:     	pushq	%rbp
140963bd1:     	pushq	%r14
140963bd3:     	pushq	%rsi
140963bd4:     	pushq	%rdi
140963bd5:     	pushq	%rbx
140963bd6:     	subq	$0xd0, %rsp
140963bdd:     	leaq	0x80(%rsp), %rbp
140963be5:     	movq	$-0x2, 0x48(%rbp)
140963bed:     	movq	%r8, %rdi
140963bf0:     	movq	%rcx, %rsi
140963bf3:     	cmpl	$0x1, (%rdx)
140963bf6:     	jne	0x140963c16 <.text+0x962c16>
140963bf8:     	movq	0x5a0(%rdi), %rax
140963bff:     	movq	%rax, -0x50(%rbp)
140963c03:     	cmpq	%rax, 0x18(%rdx)
140963c07:     	jne	0x140963d3d <.text+0x962d3d>
140963c0d:     	leaq	0x8(%rdx), %rcx
140963c11:     	jmp	0x140963c9d <.text+0x962c9d>
140963c16:     	movq	%rdx, %r14
140963c19:     	leaq	0x40(%rdi), %rax
140963c1d:     	leaq	0x5a8(%rdi), %rcx
140963c24:     	movq	%rax, -0x38(%rbp)
140963c28:     	movq	%rcx, -0x30(%rbp)
140963c2c:     	movq	$0x0, -0x50(%rbp)
140963c34:     	movq	$0x8, -0x48(%rbp)
140963c3c:     	movq	$0x0, -0x40(%rbp)
140963c44:     	leaq	0x514c985(%rip), %rdx   # 0x145ab05d0
140963c4b:     	leaq	-0x50(%rbp), %rcx
140963c4f:     	callq	0x140cca7d0 <.text+0xcc97d0>
140963c54:     	nop
140963c55:     	movq	%rax, %rbx
140963c58:     	movq	-0x50(%rbp), %rdx
140963c5c:     	testq	%rdx, %rdx
140963c5f:     	je	0x140963c74 <.text+0x962c74>
140963c61:     	movq	-0x48(%rbp), %rcx
140963c65:     	shlq	$0x3, %rdx
140963c69:     	movl	$0x8, %r8d
140963c6f:     	callq	0x1400021d0 <.text+0x11d0>
140963c74:     	movq	%rdi, %rcx
140963c77:     	callq	0x140dc2f80 <.text+0xdc1f80>
140963c7c:     	movq	0x5a0(%rdi), %r8
140963c83:     	movq	%r14, %rdx
140963c86:     	movq	$0x1, (%r14)
140963c8d:     	leaq	0x8(%r14), %rcx
140963c91:     	movq	%rbx, 0x8(%r14)
140963c95:     	movq	%rax, 0x10(%r14)
140963c99:     	movq	%r8, 0x18(%r14)
140963c9d:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
140963ca2:     	addl	0x5b0(%rdi), %eax
140963ca8:     	movl	%eax, 0x20(%rdx)
140963cab:     	addq	$0x20, %rdx
140963caf:     	movq	$0x10, -0x38(%rbp)
140963cb7:     	xorps	%xmm0, %xmm0
140963cba:     	movups	%xmm0, -0x30(%rbp)
140963cbe:     	movq	$0x10, -0x20(%rbp)
140963cc6:     	movups	%xmm0, -0x18(%rbp)
140963cca:     	movq	$0x10, -0x8(%rbp)
140963cd2:     	movups	%xmm0, (%rbp)
140963cd6:     	movq	$0x10, 0x10(%rbp)
140963cde:     	movups	%xmm0, 0x18(%rbp)
140963ce2:     	movq	$0x10, 0x28(%rbp)
140963cea:     	movq	$0x0, -0x50(%rbp)
140963cf2:     	movups	%xmm0, 0x30(%rbp)
140963cf6:     	movl	$0x0, 0x40(%rbp)
140963cfd:     	movq	$0x8, -0x48(%rbp)
140963d05:     	movq	$0x0, -0x40(%rbp)
140963d0d:     	leaq	-0x50(%rbp), %r8
140963d11:     	movq	%rdi, %r9
140963d14:     	callq	0x140d60ab0 <.text+0xd5fab0>
140963d19:     	nop
140963d1a:     	leaq	-0x50(%rbp), %rdx
140963d1e:     	movl	$0x98, %r8d
140963d24:     	movq	%rsi, %rcx
140963d27:     	callq	0x145756ddd <.text+0x5755ddd>
140963d2c:     	movq	%rsi, %rax
140963d2f:     	addq	$0xd0, %rsp
140963d36:     	popq	%rbx
140963d37:     	popq	%rdi
140963d38:     	popq	%rsi
140963d39:     	popq	%r14
140963d3b:     	popq	%rbp
140963d3c:     	retq
140963d3d:     	addq	$0x18, %rdx
140963d41:     	leaq	0x50c29f8(%rip), %rax   # 0x145a26740
140963d48:     	movq	%rax, 0x28(%rsp)
140963d4d:     	movq	$0x83, 0x20(%rsp)
140963d56:     	leaq	0x50c299f(%rip), %r9    # 0x145a266fc
140963d5d:     	leaq	-0x50(%rbp), %r8
140963d61:     	xorl	%ecx, %ecx
140963d63:     	callq	0x14589fabd <.text+0x589eabd>
140963d68:     	ud2
