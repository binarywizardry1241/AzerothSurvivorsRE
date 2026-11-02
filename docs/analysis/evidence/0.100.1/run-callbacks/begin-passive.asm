
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e6b90:     	pushq	%rbp
1454e6b91:     	pushq	%r15
1454e6b93:     	pushq	%r14
1454e6b95:     	pushq	%r13
1454e6b97:     	pushq	%r12
1454e6b99:     	pushq	%rsi
1454e6b9a:     	pushq	%rdi
1454e6b9b:     	pushq	%rbx
1454e6b9c:     	subq	$0x88, %rsp
1454e6ba3:     	leaq	0x80(%rsp), %rbp
1454e6bab:     	movaps	%xmm7, -0x10(%rbp)
1454e6baf:     	movaps	%xmm6, -0x20(%rbp)
1454e6bb3:     	movq	$-0x2, -0x28(%rbp)
1454e6bbb:     	movq	%rcx, %rsi
1454e6bbe:     	movq	(%rdx), %r8
1454e6bc1:     	movq	(%r8), %rbx
1454e6bc4:     	movq	0x8(%r8), %rdi
1454e6bc8:     	cmpq	$0xb, %rdi
1454e6bcc:     	je	0x1454e6bf6 <.text+0x54e5bf6>
1454e6bce:     	cmpq	$0xa, %rdi
1454e6bd2:     	jne	0x1454e6c14 <.text+0x54e5c14>
1454e6bd4:     	movq	(%rbx), %rax
1454e6bd7:     	xorq	0x1257c97(%rip), %rax   # 0x14673e875
1454e6bde:     	movzwl	0x8(%rbx), %ecx
1454e6be2:     	xorw	0x1257c94(%rip), %cx    # 0x14673e87d
1454e6be9:     	movzwl	%cx, %ecx
1454e6bec:     	orq	%rax, %rcx
1454e6bef:     	jne	0x1454e6c14 <.text+0x54e5c14>
1454e6bf1:     	jmp	0x1454e6e80 <.text+0x54e5e80>
1454e6bf6:     	movq	(%rbx), %rax
1454e6bf9:     	xorq	0x1257ca6(%rip), %rax   # 0x14673e8a6
1454e6c00:     	movq	0x3(%rbx), %rcx
1454e6c04:     	xorq	0x1257c9e(%rip), %rcx   # 0x14673e8a9
1454e6c0b:     	orq	%rax, %rcx
1454e6c0e:     	je	0x1454e6e80 <.text+0x54e5e80>
1454e6c14:     	movq	%r8, -0x30(%rbp)
1454e6c18:     	movss	0x48(%r8), %xmm7
1454e6c1e:     	mulss	0x431aca(%rip), %xmm7   # 0x1459186f0
1454e6c26:     	mulss	0x14(%rdx), %xmm7
1454e6c2b:     	mulss	0x3c(%rdx), %xmm7
1454e6c30:     	mulss	0x478(%rsi), %xmm7
1454e6c38:     	maxss	0x4229a0(%rip), %xmm7   # 0x1459095e0
1454e6c40:     	movq	%rbx, %rcx
1454e6c43:     	movq	%rdx, %r14
1454e6c46:     	movq	%rdi, %rdx
1454e6c49:     	callq	0x1454536c0 <.text+0x54526c0>
1454e6c4e:     	movaps	%xmm0, %xmm6
1454e6c51:     	maxss	%xmm7, %xmm6
1454e6c55:     	movss	0x50(%r14), %xmm0
1454e6c5b:     	maxss	0x42c68d(%rip), %xmm0   # 0x1459132f0
1454e6c63:     	divss	%xmm0, %xmm6
1454e6c67:     	movss	0x934(%rsi), %xmm7
1454e6c6f:     	addss	%xmm6, %xmm7
1454e6c73:     	movq	0x740(%rsi), %r12
1454e6c7a:     	movq	0x748(%rsi), %r15
1454e6c81:     	testq	%r15, %r15
1454e6c84:     	je	0x1454e6cdf <.text+0x54e5cdf>
1454e6c86:     	leaq	(,%r15,8), %rax
1454e6c8e:     	leaq	(%rax,%rax,2), %r14
1454e6c92:     	xorl	%r13d, %r13d
1454e6c95:     	jmp	0x1454e6ca9 <.text+0x54e5ca9>
1454e6c97:     	nopw	(%rax,%rax)
1454e6ca0:     	addq	$0x18, %r13
1454e6ca4:     	cmpq	%r13, %r14
1454e6ca7:     	je	0x1454e6cdf <.text+0x54e5cdf>
1454e6ca9:     	cmpq	%rdi, 0x8(%r12,%r13)
1454e6cae:     	jne	0x1454e6ca0 <.text+0x54e5ca0>
1454e6cb0:     	movq	(%r12,%r13), %rcx
1454e6cb4:     	movq	%rbx, %rdx
1454e6cb7:     	movq	%rdi, %r8
1454e6cba:     	callq	0x1457731e7 <.text+0x57721e7>
1454e6cbf:     	testl	%eax, %eax
1454e6cc1:     	jne	0x1454e6ca0 <.text+0x54e5ca0>
1454e6cc3:     	movss	%xmm7, 0x10(%r12,%r13)
1454e6cca:     	movq	-0x30(%rbp), %r14
1454e6cce:     	movq	0x2b8(%rsi), %rax
1454e6cd5:     	testq	%rax, %rax
1454e6cd8:     	jne	0x1454e6d25 <.text+0x54e5d25>
1454e6cda:     	jmp	0x1454e6d6c <.text+0x54e5d6c>
1454e6cdf:     	leaq	0x738(%rsi), %rcx
1454e6ce6:     	cmpq	(%rcx), %r15
1454e6ce9:     	jne	0x1454e6cf7 <.text+0x54e5cf7>
1454e6ceb:     	callq	0x1457745c0 <.text+0x57735c0>
1454e6cf0:     	movq	0x740(%rsi), %r12
1454e6cf7:     	leaq	(%r15,%r15,2), %rax
1454e6cfb:     	movq	%rbx, (%r12,%rax,8)
1454e6cff:     	movq	%rdi, 0x8(%r12,%rax,8)
1454e6d04:     	movss	%xmm7, 0x10(%r12,%rax,8)
1454e6d0b:     	incq	%r15
1454e6d0e:     	movq	%r15, 0x748(%rsi)
1454e6d15:     	movq	-0x30(%rbp), %r14
1454e6d19:     	movq	0x2b8(%rsi), %rax
1454e6d20:     	testq	%rax, %rax
1454e6d23:     	je	0x1454e6d6c <.text+0x54e5d6c>
1454e6d25:     	movq	0x2b0(%rsi), %r15
1454e6d2c:     	imulq	$0x58, %rax, %r12
1454e6d30:     	movq	(%r14), %rdi
1454e6d33:     	movq	0x8(%r14), %rbx
1454e6d37:     	xorl	%r13d, %r13d
1454e6d3a:     	jmp	0x1454e6d49 <.text+0x54e5d49>
1454e6d3c:     	nopl	(%rax)
1454e6d40:     	addq	$0x58, %r13
1454e6d44:     	cmpq	%r13, %r12
1454e6d47:     	je	0x1454e6d6c <.text+0x54e5d6c>
1454e6d49:     	movq	(%r15,%r13), %rax
1454e6d4d:     	cmpq	%rbx, 0x8(%rax)
1454e6d51:     	jne	0x1454e6d40 <.text+0x54e5d40>
1454e6d53:     	movq	(%rax), %rcx
1454e6d56:     	movq	%rdi, %rdx
1454e6d59:     	movq	%rbx, %r8
1454e6d5c:     	callq	0x1457731e7 <.text+0x57721e7>
1454e6d61:     	testl	%eax, %eax
1454e6d63:     	jne	0x1454e6d40 <.text+0x54e5d40>
1454e6d65:     	movss	%xmm6, 0xc(%r15,%r13)
1454e6d6c:     	mulss	0x42eba4(%rip), %xmm6   # 0x145915918
1454e6d74:     	cvttss2si	%xmm6, %rax
1454e6d79:     	xorl	%ecx, %ecx
1454e6d7b:     	xorps	%xmm0, %xmm0
1454e6d7e:     	ucomiss	%xmm0, %xmm6
1454e6d81:     	cmovael	%eax, %ecx
1454e6d84:     	leaq	0x550(%rsi), %rdi
1454e6d8b:     	ucomiss	0x42079a(%rip), %xmm6   # 0x14590752c
1454e6d92:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454e6d97:     	cmovbel	%ecx, %eax
1454e6d9a:     	movq	0x3e8(%rsi), %rdx
1454e6da1:     	movl	0x40(%r14), %ecx
1454e6da5:     	movl	%ecx, -0x38(%rbp)
1454e6da8:     	movl	%eax, -0x34(%rbp)
1454e6dab:     	leaq	-0x58(%rbp), %rcx
1454e6daf:     	leaq	-0x38(%rbp), %r8
1454e6db3:     	movl	$0x1, %r9d
1454e6db9:     	callq	0x14545d760 <.text+0x545c760>
1454e6dbe:     	movq	0x560(%rsi), %rbx
1454e6dc5:     	cmpq	0x550(%rsi), %rbx
1454e6dcc:     	jne	0x1454e6dd7 <.text+0x54e5dd7>
1454e6dce:     	movq	%rdi, %rcx
1454e6dd1:     	callq	0x145774710 <.text+0x5773710>
1454e6dd6:     	nop
1454e6dd7:     	movq	0x558(%rsi), %rax
1454e6dde:     	movq	%rbx, %rcx
1454e6de1:     	shlq	$0x5, %rcx
1454e6de5:     	movups	-0x58(%rbp), %xmm0
1454e6de9:     	movups	-0x48(%rbp), %xmm1
1454e6ded:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e6df2:     	movups	%xmm0, (%rax,%rcx)
1454e6df6:     	incq	%rbx
1454e6df9:     	movq	%rbx, 0x560(%rsi)
1454e6e00:     	movl	0x40(%r14), %ebx
1454e6e04:     	movq	0x3e8(%rsi), %r14
1454e6e0b:     	callq	0x140002200 <.text+0x1200>
1454e6e10:     	movl	$0x20, %ecx
1454e6e15:     	movl	$0x1, %edx
1454e6e1a:     	callq	0x1400021c0 <.text+0x11c0>
1454e6e1f:     	testq	%rax, %rax
1454e6e22:     	je	0x1454e6e9c <.text+0x54e5e9c>
1454e6e24:     	movl	%ebx, (%rax)
1454e6e26:     	movq	%rax, -0x30(%rbp)
1454e6e2a:     	movq	%r14, 0x4(%rax)
1454e6e2e:     	movq	0x560(%rsi), %rbx
1454e6e35:     	cmpq	0x550(%rsi), %rbx
1454e6e3c:     	jne	0x1454e6e47 <.text+0x54e5e47>
1454e6e3e:     	movq	%rdi, %rcx
1454e6e41:     	callq	0x145774710 <.text+0x5773710>
1454e6e46:     	nop
1454e6e47:     	movq	0x558(%rsi), %rax
1454e6e4e:     	movq	%rbx, %rcx
1454e6e51:     	shlq	$0x5, %rcx
1454e6e55:     	movq	$0x20, (%rax,%rcx)
1454e6e5d:     	movq	-0x30(%rbp), %rdx
1454e6e61:     	movq	%rdx, 0x8(%rax,%rcx)
1454e6e66:     	movq	$0xc, 0x10(%rax,%rcx)
1454e6e6f:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
1454e6e76:     	incq	%rbx
1454e6e79:     	movq	%rbx, 0x560(%rsi)
1454e6e80:     	movaps	-0x20(%rbp), %xmm6
1454e6e84:     	movaps	-0x10(%rbp), %xmm7
1454e6e88:     	addq	$0x88, %rsp
1454e6e8f:     	popq	%rbx
1454e6e90:     	popq	%rdi
1454e6e91:     	popq	%rsi
1454e6e92:     	popq	%r12
1454e6e94:     	popq	%r13
1454e6e96:     	popq	%r14
1454e6e98:     	popq	%r15
1454e6e9a:     	popq	%rbp
1454e6e9b:     	retq
1454e6e9c:     	movl	$0x1, %ecx
1454e6ea1:     	movl	$0x20, %edx
1454e6ea6:     	callq	0x14590379b <.text+0x590279b>
1454e6eab:     	ud2
