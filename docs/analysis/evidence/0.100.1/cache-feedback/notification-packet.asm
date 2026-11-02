
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545bee0:     	pushq	%rbp
14545bee1:     	pushq	%r15
14545bee3:     	pushq	%r14
14545bee5:     	pushq	%r12
14545bee7:     	pushq	%rsi
14545bee8:     	pushq	%rdi
14545bee9:     	pushq	%rbx
14545beea:     	subq	$0x50, %rsp
14545beee:     	leaq	0x50(%rsp), %rbp
14545bef3:     	movq	$-0x2, -0x8(%rbp)
14545befb:     	movq	%r8, %rdi
14545befe:     	movq	%rdx, %rbx
14545bf01:     	movq	%rcx, %rsi
14545bf04:     	callq	0x140002200 <.text+0x1200>
14545bf09:     	movl	$0x20, %ecx
14545bf0e:     	movl	$0x1, %edx
14545bf13:     	callq	0x1400021c0 <.text+0x11c0>
14545bf18:     	testq	%rax, %rax
14545bf1b:     	je	0x14545bfdf <.text+0x545afdf>
14545bf21:     	movq	%rax, %r14
14545bf24:     	movw	$0x1cb, -0x10(%rbp)     # imm = 0x1CB
14545bf2a:     	movq	$0x20, -0x28(%rbp)
14545bf32:     	movq	%rax, -0x20(%rbp)
14545bf36:     	movq	$0x0, -0x18(%rbp)
14545bf3e:     	cmpq	$0x21, %rdi
14545bf42:     	jae	0x14545bfb0 <.text+0x545afb0>
14545bf44:     	movl	$0x20, %r12d
14545bf4a:     	xorl	%r15d, %r15d
14545bf4d:     	testq	%rdi, %rdi
14545bf50:     	je	0x14545bf61 <.text+0x545af61>
14545bf52:     	leaq	(%r14,%r15), %rcx
14545bf56:     	movq	%rbx, %rdx
14545bf59:     	movq	%rdi, %r8
14545bf5c:     	callq	0x1457731ed <.text+0x57721ed>
14545bf61:     	addq	%rdi, %r15
14545bf64:     	movq	%r15, -0x18(%rbp)
14545bf68:     	cmpq	%r12, %r15
14545bf6b:     	jne	0x14545bf7b <.text+0x545af7b>
14545bf6d:     	leaq	-0x28(%rbp), %rcx
14545bf71:     	callq	0x145903690 <.text+0x5902690>
14545bf76:     	nop
14545bf77:     	movq	-0x20(%rbp), %r14
14545bf7b:     	movb	$0x0, (%r14,%r15)
14545bf80:     	incq	%r15
14545bf83:     	movq	%r15, -0x18(%rbp)
14545bf87:     	movups	-0x28(%rbp), %xmm0
14545bf8b:     	movups	%xmm0, (%rsi)
14545bf8e:     	movq	-0x18(%rbp), %rax
14545bf92:     	movq	%rax, 0x10(%rsi)
14545bf96:     	movq	-0x10(%rbp), %rax
14545bf9a:     	movq	%rax, 0x18(%rsi)
14545bf9e:     	movq	%rsi, %rax
14545bfa1:     	addq	$0x50, %rsp
14545bfa5:     	popq	%rbx
14545bfa6:     	popq	%rdi
14545bfa7:     	popq	%rsi
14545bfa8:     	popq	%r12
14545bfaa:     	popq	%r14
14545bfac:     	popq	%r15
14545bfae:     	popq	%rbp
14545bfaf:     	retq
14545bfb0:     	movq	$0x1, 0x20(%rsp)
14545bfb9:     	leaq	-0x28(%rbp), %rcx
14545bfbd:     	movl	$0x1, %r9d
14545bfc3:     	xorl	%edx, %edx
14545bfc5:     	movq	%rdi, %r8
14545bfc8:     	callq	0x1457744b0 <.text+0x57734b0>
14545bfcd:     	nop
14545bfce:     	movq	-0x18(%rbp), %r15
14545bfd2:     	movq	-0x28(%rbp), %r12
14545bfd6:     	movq	-0x20(%rbp), %r14
14545bfda:     	jmp	0x14545bf52 <.text+0x545af52>
14545bfdf:     	movl	$0x1, %ecx
14545bfe4:     	movl	$0x20, %edx
14545bfe9:     	callq	0x14590379b <.text+0x590279b>
14545bfee:     	ud2
