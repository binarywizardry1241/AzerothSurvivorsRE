
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145533c70:     	pushq	%rbp
145533c71:     	pushq	%r15
145533c73:     	pushq	%r14
145533c75:     	pushq	%r13
145533c77:     	pushq	%r12
145533c79:     	pushq	%rsi
145533c7a:     	pushq	%rdi
145533c7b:     	pushq	%rbx
145533c7c:     	subq	$0x58, %rsp
145533c80:     	leaq	0x50(%rsp), %rbp
145533c85:     	movq	$-0x2, (%rbp)
145533c8d:     	movq	%rcx, %r13
145533c90:     	movq	(%rcx), %rax
145533c93:     	movq	0x10(%rcx), %r10
145533c97:     	subq	%r10, %rax
145533c9a:     	cmpq	%rax, %rdx
145533c9d:     	ja	0x145533ede <.text+0x5532ede>
145533ca3:     	leaq	(%r10,%r10,2), %r14
145533ca7:     	shlq	$0x3, %r14
145533cab:     	addq	0x8(%r13), %r14
145533caf:     	cmpq	$0x2, %rdx
145533cb3:     	jb	0x145533cf8 <.text+0x5532cf8>
145533cb5:     	movq	0x10(%r8), %r12
145533cb9:     	leaq	(,%r12,4), %rsi
145533cc1:     	movq	%r12, %rax
145533cc4:     	shrq	$0x3e, %rax
145533cc8:     	setne	%al
145533ccb:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145533cd5:     	cmpq	%rcx, %rsi
145533cd8:     	seta	%cl
145533cdb:     	orb	%al, %cl
145533cdd:     	je	0x145533d34 <.text+0x5532d34>
145533cdf:     	movq	%r10, -0x10(%rbp)
145533ce3:     	movq	%r13, -0x18(%rbp)
145533ce7:     	movq	%r8, -0x8(%rbp)
145533ceb:     	xorl	%ecx, %ecx
145533ced:     	movq	%rsi, %rdx
145533cf0:     	callq	0x14590379b <.text+0x590279b>
145533cf5:     	nop
145533cf6:     	ud2
145533cf8:     	testq	%rdx, %rdx
145533cfb:     	jne	0x145533eb6 <.text+0x5532eb6>
145533d01:     	movq	%r10, 0x10(%r13)
145533d05:     	movq	(%r8), %rdx
145533d08:     	testq	%rdx, %rdx
145533d0b:     	je	0x145533ecd <.text+0x5532ecd>
145533d11:     	movq	0x8(%r8), %rcx
145533d15:     	shlq	$0x2, %rdx
145533d19:     	movl	$0x4, %r8d
145533d1f:     	addq	$0x58, %rsp
145533d23:     	popq	%rbx
145533d24:     	popq	%rdi
145533d25:     	popq	%rsi
145533d26:     	popq	%r12
145533d28:     	popq	%r13
145533d2a:     	popq	%r14
145533d2c:     	popq	%r15
145533d2e:     	popq	%rbp
145533d2f:     	jmp	0x1400021d0 <.text+0x11d0>
145533d34:     	testq	%rsi, %rsi
145533d37:     	je	0x145533dc4 <.text+0x5532dc4>
145533d3d:     	movq	%r10, -0x10(%rbp)
145533d41:     	leaq	(%r10,%rdx), %rax
145533d45:     	decq	%rax
145533d48:     	movq	%rax, -0x20(%rbp)
145533d4c:     	testq	%r12, %r12
145533d4f:     	je	0x145533de2 <.text+0x5532de2>
145533d55:     	movq	%r13, -0x18(%rbp)
145533d59:     	movq	%r8, -0x8(%rbp)
145533d5d:     	movq	0x8(%r8), %rdi
145533d61:     	movl	$0x1, %r13d
145533d67:     	subq	%rdx, %r13
145533d6a:     	xorl	%r15d, %r15d
145533d6d:     	nopl	(%rax)
145533d70:     	callq	0x140002200 <.text+0x1200>
145533d75:     	movl	$0x4, %edx
145533d7a:     	movq	%rsi, %rcx
145533d7d:     	callq	0x1400021c0 <.text+0x11c0>
145533d82:     	testq	%rax, %rax
145533d85:     	je	0x145533f13 <.text+0x5532f13>
145533d8b:     	movq	%rax, %rbx
145533d8e:     	movq	%rax, %rcx
145533d91:     	movq	%rdi, %rdx
145533d94:     	movq	%rsi, %r8
145533d97:     	callq	0x1457731ed <.text+0x57721ed>
145533d9c:     	movq	%r12, (%r14)
145533d9f:     	movq	%rbx, 0x8(%r14)
145533da3:     	movq	%r12, 0x10(%r14)
145533da7:     	addq	$0x18, %r14
145533dab:     	decq	%r15
145533dae:     	cmpq	%r15, %r13
145533db1:     	jne	0x145533d70 <.text+0x5532d70>
145533db3:     	movq	-0x20(%rbp), %r10
145533db7:     	movq	-0x8(%rbp), %r8
145533dbb:     	movq	-0x18(%rbp), %r13
145533dbf:     	jmp	0x145533eb6 <.text+0x5532eb6>
145533dc4:     	movq	%r8, %r9
145533dc7:     	leaq	-0x1(%rdx), %rcx
145533dcb:     	leaq	-0x2(%rdx), %r8
145533dcf:     	movl	%ecx, %eax
145533dd1:     	andl	$0x3, %eax
145533dd4:     	cmpq	$0x3, %r8
145533dd8:     	jae	0x145533e36 <.text+0x5532e36>
145533dda:     	movq	%r9, %r8
145533ddd:     	jmp	0x145533e90 <.text+0x5532e90>
145533de2:     	movq	%r8, %r15
145533de5:     	movl	$0x1, %edi
145533dea:     	subq	%rdx, %rdi
145533ded:     	xorl	%ebx, %ebx
145533def:     	nop
145533df0:     	callq	0x140002200 <.text+0x1200>
145533df5:     	movl	$0x4, %edx
145533dfa:     	movq	%rsi, %rcx
145533dfd:     	callq	0x1400021c0 <.text+0x11c0>
145533e02:     	testq	%rax, %rax
145533e05:     	je	0x145533f19 <.text+0x5532f19>
145533e0b:     	movq	$0x0, (%r14)
145533e12:     	movq	%rax, 0x8(%r14)
145533e16:     	movq	$0x0, 0x10(%r14)
145533e1e:     	addq	$0x18, %r14
145533e22:     	decq	%rbx
145533e25:     	cmpq	%rbx, %rdi
145533e28:     	jne	0x145533df0 <.text+0x5532df0>
145533e2a:     	movq	-0x20(%rbp), %r10
145533e2e:     	movq	%r15, %r8
145533e31:     	jmp	0x145533eb6 <.text+0x5532eb6>
145533e36:     	andq	$-0x4, %rcx
145533e3a:     	xorps	%xmm0, %xmm0
145533e3d:     	nopl	(%rax)
145533e40:     	movq	$0x0, (%r14)
145533e47:     	movq	$0x4, 0x8(%r14)
145533e4f:     	movups	%xmm0, 0x10(%r14)
145533e54:     	movq	$0x4, 0x20(%r14)
145533e5c:     	movups	%xmm0, 0x28(%r14)
145533e61:     	movq	$0x4, 0x38(%r14)
145533e69:     	movups	%xmm0, 0x40(%r14)
145533e6e:     	movq	$0x4, 0x50(%r14)
145533e76:     	movq	$0x0, 0x58(%r14)
145533e7e:     	addq	$0x60, %r14
145533e82:     	addq	$-0x4, %rcx
145533e86:     	jne	0x145533e40 <.text+0x5532e40>
145533e88:     	testq	%rax, %rax
145533e8b:     	movq	%r9, %r8
145533e8e:     	je	0x145533eb0 <.text+0x5532eb0>
145533e90:     	movq	$0x0, (%r14)
145533e97:     	movq	$0x4, 0x8(%r14)
145533e9f:     	movq	$0x0, 0x10(%r14)
145533ea7:     	addq	$0x18, %r14
145533eab:     	decq	%rax
145533eae:     	jne	0x145533e90 <.text+0x5532e90>
145533eb0:     	addq	%rdx, %r10
145533eb3:     	decq	%r10
145533eb6:     	movq	0x10(%r8), %rax
145533eba:     	movq	%rax, 0x10(%r14)
145533ebe:     	movups	(%r8), %xmm0
145533ec2:     	movups	%xmm0, (%r14)
145533ec6:     	incq	%r10
145533ec9:     	movq	%r10, 0x10(%r13)
145533ecd:     	addq	$0x58, %rsp
145533ed1:     	popq	%rbx
145533ed2:     	popq	%rdi
145533ed3:     	popq	%rsi
145533ed4:     	popq	%r12
145533ed6:     	popq	%r13
145533ed8:     	popq	%r14
145533eda:     	popq	%r15
145533edc:     	popq	%rbp
145533edd:     	retq
