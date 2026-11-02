
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458aa9e0:     	pushq	%rbp
1458aa9e1:     	pushq	%r14
1458aa9e3:     	pushq	%rsi
1458aa9e4:     	pushq	%rdi
1458aa9e5:     	pushq	%rbx
1458aa9e6:     	subq	$0x80, %rsp
1458aa9ed:     	leaq	0x80(%rsp), %rbp
1458aa9f5:     	movq	$-0x2, -0x8(%rbp)
1458aa9fd:     	movq	%r9, %rdi
1458aaa00:     	movq	%r8, %rbx
1458aaa03:     	movq	%rdx, %r14
1458aaa06:     	movq	%rcx, %rsi
1458aaa09:     	callq	0x140002200 <.text+0x1200>
1458aaa0e:     	movl	$0x20, %ecx
1458aaa13:     	movl	$0x1, %edx
1458aaa18:     	callq	0x1400021c0 <.text+0x11c0>
1458aaa1d:     	testq	%rax, %rax
1458aaa20:     	je	0x1458aac6c <.text+0x58a9c6c>
1458aaa26:     	movw	$0xdd, -0x18(%rbp)
1458aaa2c:     	movq	$0x20, -0x30(%rbp)
1458aaa34:     	movq	%rax, -0x28(%rbp)
1458aaa38:     	movq	$0x0, -0x20(%rbp)
1458aaa40:     	leaq	-0x30(%rbp), %rdx
1458aaa44:     	movq	%r14, %rcx
1458aaa47:     	callq	0x1458b6c70 <.text+0x58b5c70>
1458aaa4c:     	nop
1458aaa4d:     	movups	-0x30(%rbp), %xmm0
1458aaa51:     	movups	-0x20(%rbp), %xmm1
1458aaa55:     	movaps	%xmm1, -0x40(%rbp)
1458aaa59:     	movaps	%xmm0, -0x50(%rbp)
1458aaa5d:     	leaq	-0x30(%rbp), %rcx
1458aaa61:     	leaq	-0x50(%rbp), %rdx
1458aaa65:     	movq	%rbx, %r8
1458aaa68:     	callq	0x145895ba0 <.text+0x5894ba0>
1458aaa6d:     	movq	-0x30(%rbp), %rax
1458aaa71:     	movq	-0x20(%rbp), %rdx
1458aaa75:     	subq	%rdx, %rax
1458aaa78:     	cmpq	$0x3, %rax
1458aaa7c:     	jbe	0x1458aabcc <.text+0x58a9bcc>
1458aaa82:     	movl	0x50(%rbp), %eax
1458aaa85:     	movq	-0x28(%rbp), %rcx
1458aaa89:     	movl	%eax, (%rcx,%rdx)
1458aaa8c:     	addq	$0x4, %rdx
1458aaa90:     	movq	%rdx, -0x20(%rbp)
1458aaa94:     	movups	-0x30(%rbp), %xmm0
1458aaa98:     	movaps	%xmm0, -0x50(%rbp)
1458aaa9c:     	movq	-0x20(%rbp), %rax
1458aaaa0:     	movq	%rax, -0x40(%rbp)
1458aaaa4:     	movq	-0x18(%rbp), %rax
1458aaaa8:     	movq	%rax, -0x38(%rbp)
1458aaaac:     	movq	-0x40(%rbp), %rbx
1458aaab0:     	cmpq	-0x50(%rbp), %rbx
1458aaab4:     	jne	0x1458aaac0 <.text+0x58a9ac0>
1458aaab6:     	leaq	-0x50(%rbp), %rcx
1458aaaba:     	callq	0x145d69340 <.text+0x5d68340>
1458aaabf:     	nop
1458aaac0:     	movq	-0x48(%rbp), %rax
1458aaac4:     	movb	$0x0, (%rax,%rbx)
1458aaac8:     	incq	%rbx
1458aaacb:     	movq	%rbx, -0x40(%rbp)
1458aaacf:     	movaps	-0x50(%rbp), %xmm0
1458aaad3:     	movaps	%xmm0, -0x30(%rbp)
1458aaad7:     	movq	-0x40(%rbp), %rax
1458aaadb:     	movq	%rax, -0x20(%rbp)
1458aaadf:     	movq	-0x38(%rbp), %rax
1458aaae3:     	movq	%rax, -0x18(%rbp)
1458aaae7:     	movq	-0x20(%rbp), %rdx
1458aaaeb:     	movq	-0x30(%rbp), %rax
1458aaaef:     	subq	%rdx, %rax
1458aaaf2:     	cmpq	$0x3, %rax
1458aaaf6:     	jbe	0x1458aabf4 <.text+0x58a9bf4>
1458aaafc:     	movq	-0x28(%rbp), %rax
1458aab00:     	movl	$0x100, (%rax,%rdx)     # imm = 0x100
1458aab07:     	addq	$0x4, %rdx
1458aab0b:     	movq	%rdx, -0x20(%rbp)
1458aab0f:     	movaps	-0x30(%rbp), %xmm0
1458aab13:     	movaps	%xmm0, -0x50(%rbp)
1458aab17:     	movq	-0x20(%rbp), %rax
1458aab1b:     	movq	%rax, -0x40(%rbp)
1458aab1f:     	movq	-0x18(%rbp), %rax
1458aab23:     	movq	%rax, -0x38(%rbp)
1458aab27:     	movq	-0x40(%rbp), %rdx
1458aab2b:     	movq	-0x50(%rbp), %rax
1458aab2f:     	subq	%rdx, %rax
1458aab32:     	cmpq	$0x3, %rax
1458aab36:     	jbe	0x1458aac1c <.text+0x58a9c1c>
1458aab3c:     	movl	0x58(%rbp), %eax
1458aab3f:     	cmpl	$0x1, %eax
1458aab42:     	adcl	$0x0, %eax
1458aab45:     	movq	-0x48(%rbp), %rcx
1458aab49:     	movl	%eax, (%rcx,%rdx)
1458aab4c:     	addq	$0x4, %rdx
1458aab50:     	movq	%rdx, -0x40(%rbp)
1458aab54:     	movaps	-0x50(%rbp), %xmm0
1458aab58:     	movaps	%xmm0, -0x30(%rbp)
1458aab5c:     	movq	-0x40(%rbp), %rax
1458aab60:     	movq	%rax, -0x20(%rbp)
1458aab64:     	movq	-0x38(%rbp), %rax
1458aab68:     	movq	%rax, -0x18(%rbp)
1458aab6c:     	movq	-0x20(%rbp), %rdx
1458aab70:     	movq	-0x30(%rbp), %rax
1458aab74:     	subq	%rdx, %rax
1458aab77:     	cmpq	$0x3, %rax
1458aab7b:     	jbe	0x1458aac44 <.text+0x58a9c44>
1458aab81:     	movq	-0x28(%rbp), %rax
1458aab85:     	movl	$0x1, (%rax,%rdx)
1458aab8c:     	addq	$0x4, %rdx
1458aab90:     	movq	%rdx, -0x20(%rbp)
1458aab94:     	movaps	-0x30(%rbp), %xmm0
1458aab98:     	movaps	%xmm0, -0x50(%rbp)
1458aab9c:     	movq	-0x20(%rbp), %rax
1458aaba0:     	movq	%rax, -0x40(%rbp)
1458aaba4:     	movq	-0x18(%rbp), %rax
1458aaba8:     	movq	%rax, -0x38(%rbp)
1458aabac:     	leaq	-0x50(%rbp), %rdx
1458aabb0:     	movq	%rsi, %rcx
1458aabb3:     	movq	%rdi, %r8
1458aabb6:     	callq	0x145895ba0 <.text+0x5894ba0>
1458aabbb:     	movq	%rsi, %rax
1458aabbe:     	addq	$0x80, %rsp
1458aabc5:     	popq	%rbx
1458aabc6:     	popq	%rdi
1458aabc7:     	popq	%rsi
1458aabc8:     	popq	%r14
1458aabca:     	popq	%rbp
1458aabcb:     	retq
1458aabcc:     	movq	$0x1, 0x20(%rsp)
1458aabd5:     	leaq	-0x30(%rbp), %rcx
1458aabd9:     	movl	$0x4, %r8d
1458aabdf:     	movl	$0x1, %r9d
1458aabe5:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aabea:     	nop
1458aabeb:     	movq	-0x20(%rbp), %rdx
1458aabef:     	jmp	0x1458aaa82 <.text+0x58a9a82>
1458aabf4:     	movq	$0x1, 0x20(%rsp)
1458aabfd:     	leaq	-0x30(%rbp), %rcx
1458aac01:     	movl	$0x4, %r8d
1458aac07:     	movl	$0x1, %r9d
1458aac0d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aac12:     	nop
1458aac13:     	movq	-0x20(%rbp), %rdx
1458aac17:     	jmp	0x1458aaafc <.text+0x58a9afc>
1458aac1c:     	movq	$0x1, 0x20(%rsp)
1458aac25:     	leaq	-0x50(%rbp), %rcx
1458aac29:     	movl	$0x4, %r8d
1458aac2f:     	movl	$0x1, %r9d
1458aac35:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aac3a:     	nop
1458aac3b:     	movq	-0x40(%rbp), %rdx
1458aac3f:     	jmp	0x1458aab3c <.text+0x58a9b3c>
1458aac44:     	movq	$0x1, 0x20(%rsp)
1458aac4d:     	leaq	-0x30(%rbp), %rcx
1458aac51:     	movl	$0x4, %r8d
1458aac57:     	movl	$0x1, %r9d
1458aac5d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aac62:     	nop
1458aac63:     	movq	-0x20(%rbp), %rdx
1458aac67:     	jmp	0x1458aab81 <.text+0x58a9b81>
1458aac6c:     	movl	$0x1, %ecx
1458aac71:     	movl	$0x20, %edx
1458aac76:     	callq	0x145d6944b <.text+0x5d6844b>
1458aac7b:     	ud2
