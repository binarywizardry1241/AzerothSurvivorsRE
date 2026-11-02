
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14548ce70:     	pushq	%rbp
14548ce71:     	pushq	%rsi
14548ce72:     	pushq	%rdi
14548ce73:     	pushq	%rbx
14548ce74:     	subq	$0x88, %rsp
14548ce7b:     	leaq	0x80(%rsp), %rbp
14548ce83:     	movq	$-0x2, (%rbp)
14548ce8b:     	cmpb	$0x3, 0x94e(%rcx)
14548ce92:     	jne	0x14548cf76 <.text+0x548bf76>
14548ce98:     	movq	%rcx, %rsi
14548ce9b:     	movb	$0x1, 0x94e(%rcx)
14548cea2:     	callq	0x14546b5f0 <.text+0x546a5f0>
14548cea7:     	callq	0x140002200 <.text+0x1200>
14548ceac:     	movl	$0x1, %ecx
14548ceb1:     	movl	$0x1, %edx
14548ceb6:     	callq	0x1400021c0 <.text+0x11c0>
14548cebb:     	testq	%rax, %rax
14548cebe:     	je	0x14548cfad <.text+0x548bfad>
14548cec4:     	movb	$0x7b, (%rax)
14548cec7:     	movq	$0x1, -0x50(%rbp)
14548cecf:     	movq	%rax, -0x48(%rbp)
14548ced3:     	movq	$0x1, -0x40(%rbp)
14548cedb:     	movb	$0x1, -0x38(%rbp)
14548cedf:     	leaq	0x1622a26(%rip), %rax   # 0x146aaf90c
14548cee6:     	movq	%rax, 0x20(%rsp)
14548ceeb:     	movq	$0x8, 0x28(%rsp)
14548cef4:     	leaq	0x16227ae(%rip), %r8    # 0x146aaf6a9
14548cefb:     	leaq	-0x30(%rbp), %rcx
14548ceff:     	leaq	-0x50(%rbp), %rdx
14548cf03:     	movl	$0x4, %r9d
14548cf09:     	callq	0x145426da0 <.text+0x5425da0>
14548cf0e:     	movq	-0x30(%rbp), %rax
14548cf12:     	movq	-0x20(%rbp), %rdi
14548cf16:     	cmpq	%rdi, %rax
14548cf19:     	je	0x14548cf82 <.text+0x548bf82>
14548cf1b:     	movq	%rax, -0x8(%rbp)
14548cf1f:     	movq	-0x28(%rbp), %rax
14548cf23:     	movq	%rax, -0x10(%rbp)
14548cf27:     	movb	$0x7d, (%rax,%rdi)
14548cf2b:     	movq	0x560(%rsi), %rbx
14548cf32:     	cmpq	0x550(%rsi), %rbx
14548cf39:     	jne	0x14548cf48 <.text+0x548bf48>
14548cf3b:     	leaq	0x550(%rsi), %rcx
14548cf42:     	callq	0x145717c10 <.text+0x5716c10>
14548cf47:     	nop
14548cf48:     	incq	%rdi
14548cf4b:     	movq	0x558(%rsi), %rax
14548cf52:     	leaq	(%rbx,%rbx,2), %rcx
14548cf56:     	movq	-0x8(%rbp), %rdx
14548cf5a:     	movq	%rdx, (%rax,%rcx,8)
14548cf5e:     	movq	-0x10(%rbp), %rdx
14548cf62:     	movq	%rdx, 0x8(%rax,%rcx,8)
14548cf67:     	movq	%rdi, 0x10(%rax,%rcx,8)
14548cf6c:     	incq	%rbx
14548cf6f:     	movq	%rbx, 0x560(%rsi)
14548cf76:     	addq	$0x88, %rsp
14548cf7d:     	popq	%rbx
14548cf7e:     	popq	%rdi
14548cf7f:     	popq	%rsi
14548cf80:     	popq	%rbp
14548cf81:     	retq
14548cf82:     	movq	$0x1, 0x20(%rsp)
14548cf8b:     	leaq	-0x30(%rbp), %rcx
14548cf8f:     	movl	$0x1, %r8d
14548cf95:     	movl	$0x1, %r9d
14548cf9b:     	movq	%rdi, %rdx
14548cf9e:     	callq	0x145717840 <.text+0x5716840>
14548cfa3:     	nop
14548cfa4:     	movq	-0x30(%rbp), %rax
14548cfa8:     	jmp	0x14548cf1b <.text+0x548bf1b>
14548cfad:     	movl	$0x1, %ecx
14548cfb2:     	movl	$0x1, %edx
14548cfb7:     	callq	0x1458a3b8b <.text+0x58a2b8b>
14548cfbc:     	ud2
