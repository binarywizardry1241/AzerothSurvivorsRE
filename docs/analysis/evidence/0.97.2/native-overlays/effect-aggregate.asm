
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145415a50:     	pushq	%rbp
145415a51:     	pushq	%r14
145415a53:     	pushq	%rsi
145415a54:     	pushq	%rdi
145415a55:     	pushq	%rbx
145415a56:     	subq	$0x60, %rsp
145415a5a:     	leaq	0x60(%rsp), %rbp
145415a5f:     	movaps	%xmm6, -0x10(%rbp)
145415a63:     	movq	$-0x2, -0x18(%rbp)
145415a6b:     	movq	%rcx, %rsi
145415a6e:     	movzbl	(%rdx), %eax
145415a71:     	subb	$0x1e, %al
145415a73:     	movzbl	%al, %ecx
145415a76:     	movl	$0x2, %eax
145415a7b:     	cmovael	%ecx, %eax
145415a7e:     	testb	%al, %al
145415a80:     	je	0x145415afe <.text+0x5414afe>
145415a82:     	movq	%r8, -0x28(%rbp)
145415a86:     	movzbl	%al, %eax
145415a89:     	cmpl	$0x1, %eax
145415a8c:     	jne	0x145415b55 <.text+0x5414b55>
145415a92:     	movzbl	0x24(%rdx), %ebx
145415a96:     	movss	0x20(%rdx), %xmm6
145415a9b:     	movq	0x28(%rsi), %rdi
145415a9f:     	cmpq	0x18(%rsi), %rdi
145415aa3:     	jne	0x145415ab8 <.text+0x5414ab8>
145415aa5:     	leaq	0x18(%rsi), %rcx
145415aa9:     	movb	$0x1, -0x19(%rbp)
145415aad:     	movq	%rdx, %r14
145415ab0:     	callq	0x1457580b0 <.text+0x57570b0>
145415ab5:     	movq	%r14, %rdx
145415ab8:     	addq	$0x8, %rdx
145415abc:     	movq	0x20(%rsi), %rax
145415ac0:     	movq	%rdi, %rcx
145415ac3:     	shlq	$0x5, %rcx
145415ac7:     	movq	0x10(%rdx), %r8
145415acb:     	movq	%r8, 0x10(%rax,%rcx)
145415ad0:     	movups	(%rdx), %xmm0
145415ad3:     	movups	%xmm0, (%rax,%rcx)
145415ad7:     	movb	%bl, 0x18(%rax,%rcx)
145415adb:     	movss	%xmm6, 0x1c(%rax,%rcx)
145415ae1:     	incq	%rdi
145415ae4:     	movq	%rdi, 0x28(%rsi)
145415ae8:     	movq	-0x28(%rbp), %r8
145415aec:     	movq	(%r8), %rdx
145415aef:     	cmpq	$-0x1, %rdx
145415af3:     	jne	0x145415c3f <.text+0x5414c3f>
145415af9:     	jmp	0x145415c61 <.text+0x5414c61>
145415afe:     	movzbl	0x8(%rdx), %ebx
145415b02:     	movss	0x4(%rdx), %xmm6
145415b07:     	movq	0x8(%rsi), %rax
145415b0b:     	movq	0x10(%rsi), %rdi
145415b0f:     	leaq	(,%rdi,8), %rcx
145415b17:     	xorl	%edx, %edx
145415b19:     	nopl	(%rax)
145415b20:     	cmpq	%rdx, %rcx
145415b23:     	je	0x145415c08 <.text+0x5414c08>
145415b29:     	leaq	0x8(%rdx), %r9
145415b2d:     	cmpb	%bl, (%rax,%rdx)
145415b30:     	movq	%r9, %rdx
145415b33:     	jne	0x145415b20 <.text+0x5414b20>
145415b35:     	addss	-0x4(%rax,%r9), %xmm6
145415b3c:     	movss	%xmm6, -0x4(%rax,%r9)
145415b43:     	movq	(%r8), %rdx
145415b46:     	cmpq	$-0x1, %rdx
145415b4a:     	jne	0x145415c3f <.text+0x5414c3f>
145415b50:     	jmp	0x145415c61 <.text+0x5414c61>
145415b55:     	movq	0x40(%rsi), %rdi
145415b59:     	cmpq	0x30(%rsi), %rdi
145415b5d:     	jne	0x145415b72 <.text+0x5414b72>
145415b5f:     	leaq	0x30(%rsi), %rcx
145415b63:     	movb	$0x1, -0x19(%rbp)
145415b67:     	movq	%rdx, %rbx
145415b6a:     	callq	0x145764080 <.text+0x5763080>
145415b6f:     	movq	%rbx, %rdx
145415b72:     	movq	0x38(%rsi), %rax
145415b76:     	movq	%rdi, %rcx
145415b79:     	shlq	$0x6, %rcx
145415b7d:     	movups	(%rdx), %xmm0
145415b80:     	movups	0x10(%rdx), %xmm1
145415b84:     	movups	0x20(%rdx), %xmm2
145415b88:     	movups	0x30(%rdx), %xmm3
145415b8c:     	movups	%xmm3, 0x30(%rax,%rcx)
145415b91:     	movups	%xmm2, 0x20(%rax,%rcx)
145415b96:     	movups	%xmm1, 0x10(%rax,%rcx)
145415b9b:     	movups	%xmm0, (%rax,%rcx)
145415b9f:     	incq	%rdi
145415ba2:     	movq	%rdi, 0x40(%rsi)
145415ba6:     	movq	-0x28(%rbp), %rax
145415baa:     	movq	(%rax), %rcx
145415bad:     	movq	%rcx, -0x30(%rbp)
145415bb1:     	movq	0x8(%rax), %rax
145415bb5:     	movq	%rax, -0x38(%rbp)
145415bb9:     	movq	0x58(%rsi), %rdi
145415bbd:     	cmpq	0x48(%rsi), %rdi
145415bc1:     	jne	0x145415bcd <.text+0x5414bcd>
145415bc3:     	leaq	0x48(%rsi), %rcx
145415bc7:     	callq	0x145758120 <.text+0x5757120>
145415bcc:     	nop
145415bcd:     	movq	-0x28(%rbp), %rdx
145415bd1:     	addq	$0x10, %rdx
145415bd5:     	movq	0x50(%rsi), %rax
145415bd9:     	leaq	(%rdi,%rdi,4), %rcx
145415bdd:     	movq	-0x30(%rbp), %r8
145415be1:     	movq	%r8, (%rax,%rcx,8)
145415be5:     	movq	-0x38(%rbp), %r8
145415be9:     	movq	%r8, 0x8(%rax,%rcx,8)
145415bee:     	movups	(%rdx), %xmm0
145415bf1:     	movups	%xmm0, 0x10(%rax,%rcx,8)
145415bf6:     	movq	0x10(%rdx), %rdx
145415bfa:     	movq	%rdx, 0x20(%rax,%rcx,8)
145415bff:     	incq	%rdi
145415c02:     	movq	%rdi, 0x58(%rsi)
145415c06:     	jmp	0x145415c61 <.text+0x5414c61>
145415c08:     	cmpq	(%rsi), %rdi
145415c0b:     	jne	0x145415c26 <.text+0x5414c26>
145415c0d:     	movq	%r8, -0x28(%rbp)
145415c11:     	movb	$0x1, -0x19(%rbp)
145415c15:     	movq	%rsi, %rcx
145415c18:     	callq	0x145763de0 <.text+0x5762de0>
145415c1d:     	nop
145415c1e:     	movq	0x8(%rsi), %rax
145415c22:     	movq	-0x28(%rbp), %r8
145415c26:     	movb	%bl, (%rax,%rdi,8)
145415c29:     	movss	%xmm6, 0x4(%rax,%rdi,8)
145415c2f:     	incq	%rdi
145415c32:     	movq	%rdi, 0x10(%rsi)
145415c36:     	movq	(%r8), %rdx
145415c39:     	cmpq	$-0x1, %rdx
145415c3d:     	je	0x145415c61 <.text+0x5414c61>
145415c3f:     	testq	%rdx, %rdx
145415c42:     	je	0x145415c61 <.text+0x5414c61>
145415c44:     	movq	0x8(%r8), %rcx
145415c48:     	movl	$0x1, %r8d
145415c4e:     	movaps	-0x10(%rbp), %xmm6
145415c52:     	addq	$0x60, %rsp
145415c56:     	popq	%rbx
145415c57:     	popq	%rdi
145415c58:     	popq	%rsi
145415c59:     	popq	%r14
145415c5b:     	popq	%rbp
145415c5c:     	jmp	0x1400021d0 <.text+0x11d0>
145415c61:     	movaps	-0x10(%rbp), %xmm6
145415c65:     	addq	$0x60, %rsp
145415c69:     	popq	%rbx
145415c6a:     	popq	%rdi
145415c6b:     	popq	%rsi
145415c6c:     	popq	%r14
145415c6e:     	popq	%rbp
145415c6f:     	retq
