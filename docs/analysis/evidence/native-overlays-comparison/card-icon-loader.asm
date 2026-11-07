
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c7c50:     	pushq	%rbp
1400c7c51:     	pushq	%r15
1400c7c53:     	pushq	%r14
1400c7c55:     	pushq	%r13
1400c7c57:     	pushq	%r12
1400c7c59:     	pushq	%rsi
1400c7c5a:     	pushq	%rdi
1400c7c5b:     	pushq	%rbx
1400c7c5c:     	subq	$0x98, %rsp
1400c7c63:     	leaq	0x80(%rsp), %rbp
1400c7c6b:     	movdqa	%xmm7, (%rbp)
1400c7c70:     	movdqa	%xmm6, -0x10(%rbp)
1400c7c75:     	movq	$-0x2, -0x18(%rbp)
1400c7c7d:     	testq	%r9, %r9
1400c7c80:     	movl	$0x15, %ebx
1400c7c85:     	cmovneq	%r9, %rbx
1400c7c89:     	testq	%rbx, %rbx
1400c7c8c:     	jns	0x1400c7c9e <.text+0xc6c9e>
1400c7c8e:     	xorl	%r13d, %r13d
1400c7c91:     	movq	%r13, %rcx
1400c7c94:     	movq	%rbx, %rdx
1400c7c97:     	callq	0x1458e721b <.text+0x58e621b>
1400c7c9c:     	ud2
1400c7c9e:     	movq	%r9, %r12
1400c7ca1:     	movq	%r8, %r15
1400c7ca4:     	movq	%rcx, %rsi
1400c7ca7:     	movq	%rdx, %rdi
1400c7caa:     	callq	0x140002200 <.text+0x1200>
1400c7caf:     	movl	$0x1, %r13d
1400c7cb5:     	movl	$0x1, %edx
1400c7cba:     	movq	%rbx, %rcx
1400c7cbd:     	callq	0x1400021c0 <.text+0x11c0>
1400c7cc2:     	testq	%rax, %rax
1400c7cc5:     	je	0x1400c7c91 <.text+0xc6c91>
1400c7cc7:     	movq	%rax, %r14
1400c7cca:     	testq	%r12, %r12
1400c7ccd:     	leaq	0x58367b8(%rip), %rax   # 0x1458fe48c
1400c7cd4:     	cmoveq	%rax, %r15
1400c7cd8:     	movq	%r14, %rcx
1400c7cdb:     	movq	%r15, %rdx
1400c7cde:     	movq	%rbx, %r8
1400c7ce1:     	callq	0x145756ddd <.text+0x5755ddd>
1400c7ce6:     	cmpq	$0x8, %rbx
1400c7cea:     	jae	0x1400c7cf3 <.text+0xc6cf3>
1400c7cec:     	xorl	%eax, %eax
1400c7cee:     	jmp	0x1400c7e03 <.text+0xc6e03>
1400c7cf3:     	cmpq	$0x20, %rbx
1400c7cf7:     	jae	0x1400c7d00 <.text+0xc6d00>
1400c7cf9:     	xorl	%eax, %eax
1400c7cfb:     	jmp	0x1400c7d99 <.text+0xc6d99>
1400c7d00:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
1400c7d0a:     	andq	%rbx, %rax
1400c7d0d:     	xorl	%ecx, %ecx
1400c7d0f:     	movdqa	0x5825319(%rip), %xmm0  # 0x1458ed030
1400c7d17:     	movdqa	0x58238e1(%rip), %xmm1  # 0x1458eb600
1400c7d1f:     	movdqa	0x5825319(%rip), %xmm2  # 0x1458ed040
1400c7d27:     	nopw	(%rax,%rax)
1400c7d30:     	movdqu	(%r14,%rcx), %xmm3
1400c7d36:     	movdqu	0x10(%r14,%rcx), %xmm4
1400c7d3d:     	movdqa	%xmm3, %xmm5
1400c7d41:     	paddb	%xmm0, %xmm5
1400c7d45:     	movdqa	%xmm4, %xmm6
1400c7d49:     	paddb	%xmm0, %xmm6
1400c7d4d:     	movdqa	%xmm5, %xmm7
1400c7d51:     	pminub	%xmm1, %xmm7
1400c7d55:     	pcmpeqb	%xmm5, %xmm7
1400c7d59:     	pand	%xmm2, %xmm7
1400c7d5d:     	movdqa	%xmm6, %xmm5
1400c7d61:     	pminub	%xmm1, %xmm5
1400c7d65:     	pcmpeqb	%xmm6, %xmm5
1400c7d69:     	pand	%xmm2, %xmm5
1400c7d6d:     	por	%xmm3, %xmm7
1400c7d71:     	por	%xmm4, %xmm5
1400c7d75:     	movdqu	%xmm7, (%r14,%rcx)
1400c7d7b:     	movdqu	%xmm5, 0x10(%r14,%rcx)
1400c7d82:     	addq	$0x20, %rcx
1400c7d86:     	cmpq	%rcx, %rax
1400c7d89:     	jne	0x1400c7d30 <.text+0xc6d30>
1400c7d8b:     	cmpq	%rax, %rbx
1400c7d8e:     	je	0x1400c7e22 <.text+0xc6e22>
1400c7d94:     	testb	$0x18, %bl
1400c7d97:     	je	0x1400c7e03 <.text+0xc6e03>
1400c7d99:     	movq	%rax, %rcx
1400c7d9c:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1400c7da6:     	andq	%rbx, %rax
1400c7da9:     	movdqa	0x582529f(%rip), %xmm0  # 0x1458ed050
1400c7db1:     	movdqa	0x58252a7(%rip), %xmm1  # 0x1458ed060
1400c7db9:     	movdqa	0x58252af(%rip), %xmm2  # 0x1458ed070
1400c7dc1:     	nopw	%cs:(%rax,%rax)
1400c7dd0:     	movq	(%r14,%rcx), %xmm3
1400c7dd6:     	movdqa	%xmm3, %xmm4
1400c7dda:     	paddb	%xmm0, %xmm4
1400c7dde:     	movdqa	%xmm4, %xmm5
1400c7de2:     	pmaxub	%xmm1, %xmm5
1400c7de6:     	pcmpeqb	%xmm4, %xmm5
1400c7dea:     	pandn	%xmm2, %xmm5
1400c7dee:     	por	%xmm3, %xmm5
1400c7df2:     	movq	%xmm5, (%r14,%rcx)
1400c7df8:     	addq	$0x8, %rcx
1400c7dfc:     	cmpq	%rcx, %rax
1400c7dff:     	jne	0x1400c7dd0 <.text+0xc6dd0>
1400c7e01:     	jmp	0x1400c7e1d <.text+0xc6e1d>
1400c7e03:     	movzbl	(%r14,%rax), %ecx
1400c7e08:     	leal	-0x41(%rcx), %edx
1400c7e0b:     	cmpb	$0x1a, %dl
1400c7e0e:     	setb	%dl
1400c7e11:     	shlb	$0x5, %dl
1400c7e14:     	orb	%cl, %dl
1400c7e16:     	movb	%dl, (%r14,%rax)
1400c7e1a:     	incq	%rax
1400c7e1d:     	cmpq	%rax, %rbx
1400c7e20:     	jne	0x1400c7e03 <.text+0xc6e03>
1400c7e22:     	movq	%rbx, -0x30(%rbp)
1400c7e26:     	movq	%r14, -0x28(%rbp)
1400c7e2a:     	movq	%rbx, -0x20(%rbp)
1400c7e2e:     	leaq	-0x30(%rbp), %rax
1400c7e32:     	movq	%rax, -0x40(%rbp)
1400c7e36:     	leaq	-0xc5d5d(%rip), %rax    # 0x1400020e0 <.text+0x10e0>
1400c7e3d:     	movq	%rax, -0x38(%rbp)
1400c7e41:     	leaq	0x5836659(%rip), %rdx   # 0x1458fe4a1
1400c7e48:     	leaq	-0x58(%rbp), %rcx
1400c7e4c:     	leaq	-0x40(%rbp), %r8
1400c7e50:     	callq	0x14570bf80 <.text+0x570af80>
1400c7e55:     	nop
1400c7e56:     	movq	-0x30(%rbp), %rdx
1400c7e5a:     	testq	%rdx, %rdx
1400c7e5d:     	je	0x1400c7e6e <.text+0xc6e6e>
1400c7e5f:     	movq	-0x28(%rbp), %rcx
1400c7e63:     	movl	$0x1, %r8d
1400c7e69:     	callq	0x1400021d0 <.text+0x11d0>
1400c7e6e:     	movq	-0x48(%rbp), %rax
1400c7e72:     	movq	%rax, -0x20(%rbp)
1400c7e76:     	movups	-0x58(%rbp), %xmm0
1400c7e7a:     	movaps	%xmm0, -0x30(%rbp)
1400c7e7e:     	leaq	0x5825a63(%rip), %rax   # 0x1458ed8e8
1400c7e85:     	movq	%rax, 0x20(%rsp)
1400c7e8a:     	leaq	-0x30(%rbp), %r8
1400c7e8e:     	movl	$0x1, %r9d
1400c7e94:     	movq	%rsi, %rcx
1400c7e97:     	movq	%rdi, %rdx
1400c7e9a:     	callq	0x1400310a0 <.text+0x300a0>
1400c7e9f:     	movq	%rsi, %rax
1400c7ea2:     	movaps	-0x10(%rbp), %xmm6
1400c7ea6:     	movaps	(%rbp), %xmm7
1400c7eaa:     	addq	$0x98, %rsp
1400c7eb1:     	popq	%rbx
1400c7eb2:     	popq	%rdi
1400c7eb3:     	popq	%rsi
1400c7eb4:     	popq	%r12
1400c7eb6:     	popq	%r13
1400c7eb8:     	popq	%r14
1400c7eba:     	popq	%r15
1400c7ebc:     	popq	%rbp
1400c7ebd:     	retq
