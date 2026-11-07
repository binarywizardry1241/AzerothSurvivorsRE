
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145536a90:     	pushq	%rbp
145536a91:     	pushq	%r15
145536a93:     	pushq	%r14
145536a95:     	pushq	%r12
145536a97:     	pushq	%rsi
145536a98:     	pushq	%rdi
145536a99:     	pushq	%rbx
145536a9a:     	subq	$0x40, %rsp
145536a9e:     	leaq	0x40(%rsp), %rbp
145536aa3:     	movq	$-0x2, -0x8(%rbp)
145536aab:     	movq	%rcx, %rsi
145536aae:     	movq	(%rdx), %r15
145536ab1:     	movq	0x8(%rdx), %r12
145536ab5:     	movq	%r12, %r14
145536ab8:     	subq	%r15, %r14
145536abb:     	subq	%r15, %r12
145536abe:     	je	0x145536b64 <.text+0x5535b64>
145536ac4:     	movq	%rdx, %rdi
145536ac7:     	movq	%r14, %rbx
145536aca:     	shrq	%rbx
145536acd:     	callq	0x140002200 <.text+0x1200>
145536ad2:     	movl	$0x4, %edx
145536ad7:     	movq	%rbx, %rcx
145536ada:     	callq	0x1400021c0 <.text+0x11c0>
145536adf:     	testq	%rax, %rax
145536ae2:     	je	0x145536ba0 <.text+0x5535ba0>
145536ae8:     	shrq	$0x3, %r14
145536aec:     	movq	0x10(%rdi), %r10
145536af0:     	movq	0x18(%rdi), %rdx
145536af4:     	movq	0x20(%rdi), %r8
145536af8:     	xorl	%r9d, %r9d
145536afb:     	xorps	%xmm0, %xmm0
145536afe:     	movss	0x3b4982(%rip), %xmm1   # 0x1458eb488
145536b06:     	movss	0x3b4972(%rip), %xmm2   # 0x1458eb480
145536b0e:     	movss	0x3b49e2(%rip), %xmm3   # 0x1458eb4f8
145536b16:     	nopw	%cs:(%rax,%rax)
145536b20:     	movq	(%r15,%r9,8), %rcx
145536b24:     	cmpq	%rdx, %rcx
145536b27:     	jae	0x145536b89 <.text+0x5535b89>
145536b29:     	leaq	(%rcx,%rcx,4), %rcx
145536b2d:     	shlq	$0x4, %rcx
145536b31:     	movss	(%r8), %xmm4
145536b36:     	subss	0x48(%r10,%rcx), %xmm4
145536b3d:     	maxss	%xmm0, %xmm4
145536b41:     	mulss	%xmm1, %xmm4
145536b45:     	addss	%xmm2, %xmm4
145536b49:     	minss	%xmm3, %xmm4
145536b4d:     	divss	0x44(%r10,%rcx), %xmm4
145536b54:     	movss	%xmm4, (%rax,%r9,4)
145536b5a:     	incq	%r9
145536b5d:     	cmpq	%r9, %r14
145536b60:     	jne	0x145536b20 <.text+0x5535b20>
145536b62:     	jmp	0x145536b6c <.text+0x5535b6c>
145536b64:     	xorl	%r14d, %r14d
145536b67:     	movl	$0x4, %eax
145536b6c:     	movq	%r14, (%rsi)
145536b6f:     	movq	%rax, 0x8(%rsi)
145536b73:     	movq	%r14, 0x10(%rsi)
145536b77:     	movq	%rsi, %rax
145536b7a:     	addq	$0x40, %rsp
145536b7e:     	popq	%rbx
145536b7f:     	popq	%rdi
145536b80:     	popq	%rsi
145536b81:     	popq	%r12
145536b83:     	popq	%r14
145536b85:     	popq	%r15
145536b87:     	popq	%rbp
145536b88:     	retq
145536b89:     	movq	%rax, -0x10(%rbp)
145536b8d:     	movq	%r12, -0x18(%rbp)
145536b91:     	leaq	0x17b2a80(%rip), %r8    # 0x146ce9618
145536b98:     	callq	0x1458e75b3 <.text+0x58e65b3>
145536b9d:     	nop
145536b9e:     	ud2
145536ba0:     	movl	$0x4, %ecx
145536ba5:     	movq	%rbx, %rdx
145536ba8:     	callq	0x1458e721b <.text+0x58e621b>
145536bad:     	ud2
