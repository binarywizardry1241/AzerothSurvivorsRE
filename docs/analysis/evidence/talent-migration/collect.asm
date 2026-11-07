
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599f9f0:     	pushq	%rbp
14599f9f1:     	pushq	%r15
14599f9f3:     	pushq	%r14
14599f9f5:     	pushq	%r13
14599f9f7:     	pushq	%r12
14599f9f9:     	pushq	%rsi
14599f9fa:     	pushq	%rdi
14599f9fb:     	pushq	%rbx
14599f9fc:     	subq	$0x58, %rsp
14599fa00:     	leaq	0x50(%rsp), %rbp
14599fa05:     	movq	$-0x2, (%rbp)
14599fa0d:     	movq	%rdx, %rdi
14599fa10:     	movq	%rcx, %rbx
14599fa13:     	movq	(%rdx), %rcx
14599fa16:     	movq	0x8(%rdx), %r13
14599fa1a:     	movq	0x10(%rdx), %r14
14599fa1e:     	nop
14599fa20:     	cmpq	%r13, %rcx
14599fa23:     	je	0x14599fb3a <.text+0x599eb3a>
14599fa29:     	leaq	0x10(%rcx), %rsi
14599fa2d:     	movq	%rsi, (%rdi)
14599fa30:     	movq	(%rcx), %rax
14599fa33:     	movzbl	(%r14), %ecx
14599fa37:     	movq	0x20(%rax), %rdx
14599fa3b:     	movq	0x28(%rax), %r8
14599fa3f:     	callq	0x1458e6190 <.text+0x58e5190>
14599fa44:     	movq	%rsi, %rcx
14599fa47:     	testq	%rdx, %rdx
14599fa4a:     	je	0x14599fa20 <.text+0x599ea20>
14599fa4c:     	movq	%rbx, -0x28(%rbp)
14599fa50:     	movq	%rax, -0x8(%rbp)
14599fa54:     	movzbl	-0x8(%rsi), %r12d
14599fa59:     	movq	%rdx, %r15
14599fa5c:     	movzbl	0x72(%rdx), %ebx
14599fa60:     	callq	0x140002200 <.text+0x1200>
14599fa65:     	movl	$0x60, %ecx
14599fa6a:     	movl	$0x8, %edx
14599fa6f:     	callq	0x1400021c0 <.text+0x11c0>
14599fa74:     	testq	%rax, %rax
14599fa77:     	je	0x14599fb7a <.text+0x599eb7a>
14599fa7d:     	movq	%rax, %rdi
14599fa80:     	movzbl	%bl, %eax
14599fa83:     	movzbl	%r12b, %ecx
14599fa87:     	cmpb	%cl, %al
14599fa89:     	cmovbl	%eax, %ecx
14599fa8c:     	movq	%r15, (%rdi)
14599fa8f:     	movq	-0x8(%rbp), %rax
14599fa93:     	movq	%rax, 0x8(%rdi)
14599fa97:     	movb	%cl, 0x10(%rdi)
14599fa9a:     	movq	$0x4, -0x20(%rbp)
14599faa2:     	movq	%rdi, -0x18(%rbp)
14599faa6:     	movl	$0x1, %ebx
14599faab:     	movq	%rbx, -0x10(%rbp)
14599faaf:     	nop
14599fab0:     	cmpq	%r13, %rsi
14599fab3:     	je	0x14599fb53 <.text+0x599eb53>
14599fab9:     	movq	(%rsi), %rax
14599fabc:     	addq	$0x10, %rsi
14599fac0:     	movzbl	(%r14), %ecx
14599fac4:     	movq	0x20(%rax), %rdx
14599fac8:     	movq	0x28(%rax), %r8
14599facc:     	callq	0x1458e6190 <.text+0x58e5190>
14599fad1:     	testq	%rdx, %rdx
14599fad4:     	je	0x14599fab0 <.text+0x599eab0>
14599fad6:     	movq	%rax, %r15
14599fad9:     	movq	%rdx, %r12
14599fadc:     	movq	%rbx, %rdx
14599fadf:     	movl	-0x8(%rsi), %ebx
14599fae2:     	movzbl	0x72(%r12), %eax
14599fae8:     	cmpb	%bl, %al
14599faea:     	cmovbl	%eax, %ebx
14599faed:     	cmpq	-0x20(%rbp), %rdx
14599faf1:     	jne	0x14599fb1e <.text+0x599eb1e>
14599faf3:     	movq	$0x18, 0x20(%rsp)
14599fafc:     	movl	$0x1, %r8d
14599fb02:     	movl	$0x8, %r9d
14599fb08:     	leaq	-0x20(%rbp), %rcx
14599fb0c:     	movq	%rdx, -0x8(%rbp)
14599fb10:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599fb15:     	nop
14599fb16:     	movq	-0x18(%rbp), %rdi
14599fb1a:     	movq	-0x8(%rbp), %rdx
14599fb1e:     	leaq	(%rdx,%rdx,2), %rax
14599fb22:     	movq	%r12, (%rdi,%rax,8)
14599fb26:     	movq	%r15, 0x8(%rdi,%rax,8)
14599fb2b:     	movb	%bl, 0x10(%rdi,%rax,8)
14599fb2f:     	incq	%rdx
14599fb32:     	movq	%rdx, %rbx
14599fb35:     	jmp	0x14599faab <.text+0x599eaab>
14599fb3a:     	movq	$0x0, (%rbx)
14599fb41:     	movq	$0x8, 0x8(%rbx)
14599fb49:     	movq	$0x0, 0x10(%rbx)
14599fb51:     	jmp	0x14599fb66 <.text+0x599eb66>
14599fb53:     	movq	-0x10(%rbp), %rax
14599fb57:     	movq	-0x28(%rbp), %rbx
14599fb5b:     	movq	%rax, 0x10(%rbx)
14599fb5f:     	movups	-0x20(%rbp), %xmm0
14599fb63:     	movups	%xmm0, (%rbx)
14599fb66:     	movq	%rbx, %rax
14599fb69:     	addq	$0x58, %rsp
14599fb6d:     	popq	%rbx
14599fb6e:     	popq	%rdi
14599fb6f:     	popq	%rsi
14599fb70:     	popq	%r12
14599fb72:     	popq	%r13
14599fb74:     	popq	%r14
14599fb76:     	popq	%r15
14599fb78:     	popq	%rbp
14599fb79:     	retq
14599fb7a:     	movl	$0x8, %ecx
14599fb7f:     	movl	$0x60, %edx
14599fb84:     	callq	0x145d6944b <.text+0x5d6844b>
14599fb89:     	ud2
