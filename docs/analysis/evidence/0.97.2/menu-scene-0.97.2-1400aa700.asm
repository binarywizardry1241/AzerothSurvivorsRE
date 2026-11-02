
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400aa700:     	pushq	%r15
1400aa702:     	pushq	%r14
1400aa704:     	pushq	%r13
1400aa706:     	pushq	%r12
1400aa708:     	pushq	%rsi
1400aa709:     	pushq	%rdi
1400aa70a:     	pushq	%rbp
1400aa70b:     	pushq	%rbx
1400aa70c:     	subq	$0x178, %rsp            # imm = 0x178
1400aa713:     	movl	$0x1, %r9d
1400aa719:     	lock
1400aa71a:     	xaddl	%r9d, 0x5b0(%r8)
1400aa722:     	cmpq	$-0x1, 0xf0(%rdx)
1400aa72a:     	je	0x1400aaaf7 <.text+0xa9af7>
1400aa730:     	movq	%r8, %rbx
1400aa733:     	movq	%rdx, %rsi
1400aa736:     	movq	0x5a0(%r8), %rax
1400aa73d:     	movq	%rax, 0x50(%rsp)
1400aa742:     	cmpq	%rax, 0x268(%rdx)
1400aa749:     	jne	0x1400aab11 <.text+0xa9b11>
1400aa74f:     	movq	0x120(%rsi), %rax
1400aa756:     	cmpq	0x218(%rbx), %rax
1400aa75d:     	jae	0x1400aab86 <.text+0xa9b86>
1400aa763:     	movq	0x210(%rbx), %rdx
1400aa76a:     	movq	(%rdx,%rax,8), %rax
1400aa76e:     	testq	%rax, %rax
1400aa771:     	je	0x1400aab86 <.text+0xa9b86>
1400aa777:     	movq	0x1e0(%rbx), %r15
1400aa77e:     	notq	%rax
1400aa781:     	imulq	$0x38, %rax, %rax
1400aa785:     	cmpb	$0x0, 0x30(%r15,%rax)
1400aa78b:     	je	0x1400aab86 <.text+0xa9b86>
1400aa791:     	addq	%rax, %r15
1400aa794:     	movq	0x10(%r15), %r11
1400aa798:     	movl	0x5b0(%rbx), %eax
1400aa79e:     	movq	0x128(%rsi), %rax
1400aa7a5:     	movq	0x218(%rbx), %r10
1400aa7ac:     	cmpq	%r10, %rax
1400aa7af:     	jae	0x1400aab45 <.text+0xa9b45>
1400aa7b5:     	movq	0x210(%rbx), %rdx
1400aa7bc:     	movq	(%rdx,%rax,8), %r8
1400aa7c0:     	testq	%r8, %r8
1400aa7c3:     	je	0x1400aab45 <.text+0xa9b45>
1400aa7c9:     	movq	0x1e0(%rbx), %rax
1400aa7d0:     	notq	%r8
1400aa7d3:     	imulq	$0x38, %r8, %r13
1400aa7d7:     	cmpb	$0x0, 0x30(%rax,%r13)
1400aa7dd:     	je	0x1400aab45 <.text+0xa9b45>
1400aa7e3:     	movq	0x130(%rsi), %r8
1400aa7ea:     	cmpq	%r10, %r8
1400aa7ed:     	jae	0x1400aab45 <.text+0xa9b45>
1400aa7f3:     	movq	(%rdx,%r8,8), %r8
1400aa7f7:     	testq	%r8, %r8
1400aa7fa:     	je	0x1400aab45 <.text+0xa9b45>
1400aa800:     	notq	%r8
1400aa803:     	imulq	$0x38, %r8, %rdi
1400aa807:     	cmpb	$0x0, 0x30(%rax,%rdi)
1400aa80c:     	je	0x1400aab45 <.text+0xa9b45>
1400aa812:     	movq	0x138(%rsi), %r8
1400aa819:     	cmpq	%r10, %r8
1400aa81c:     	jae	0x1400aab45 <.text+0xa9b45>
1400aa822:     	movq	(%rdx,%r8,8), %r8
1400aa826:     	testq	%r8, %r8
1400aa829:     	je	0x1400aab45 <.text+0xa9b45>
1400aa82f:     	notq	%r8
1400aa832:     	imulq	$0x38, %r8, %r14
1400aa836:     	cmpb	$0x0, 0x30(%rax,%r14)
1400aa83c:     	je	0x1400aab45 <.text+0xa9b45>
1400aa842:     	movq	%r11, 0x168(%rsp)
1400aa84a:     	movq	%rcx, 0x170(%rsp)
1400aa852:     	movl	%r9d, 0x4c(%rsp)
1400aa857:     	movq	0x140(%rsi), %r8
1400aa85e:     	cmpq	%r10, %r8
1400aa861:     	jae	0x1400aab45 <.text+0xa9b45>
1400aa867:     	movq	(%rdx,%r8,8), %rcx
1400aa86b:     	testq	%rcx, %rcx
1400aa86e:     	je	0x1400aab45 <.text+0xa9b45>
1400aa874:     	notq	%rcx
1400aa877:     	imulq	$0x38, %rcx, %rbp
1400aa87b:     	cmpb	$0x0, 0x30(%rax,%rbp)
1400aa880:     	je	0x1400aab45 <.text+0xa9b45>
1400aa886:     	movl	0x270(%rsi), %r12d
1400aa88d:     	addq	%rax, %r13
1400aa890:     	movq	0x10(%r13), %rcx
1400aa894:     	movq	%rcx, 0x148(%rsp)
1400aa89c:     	addq	%rax, %rdi
1400aa89f:     	movq	0x10(%rdi), %rcx
1400aa8a3:     	movq	%rcx, 0x150(%rsp)
1400aa8ab:     	addq	%rax, %r14
1400aa8ae:     	movq	0x10(%r14), %rcx
1400aa8b2:     	movq	%rcx, 0x160(%rsp)
1400aa8ba:     	addq	%rax, %rbp
1400aa8bd:     	leaq	0x2c(%r14), %rax
1400aa8c1:     	movq	%rax, 0x158(%rsp)
1400aa8c9:     	addq	$0x28, %r14
1400aa8cd:     	leaq	0x2c(%rdi), %rax
1400aa8d1:     	movq	%rax, 0x138(%rsp)
1400aa8d9:     	addq	$0x28, %rdi
1400aa8dd:     	leaq	0x2c(%r13), %rax
1400aa8e1:     	movq	%rax, 0x128(%rsp)
1400aa8e9:     	addq	$0x28, %r13
1400aa8ed:     	leaq	0x2c(%r15), %rax
1400aa8f1:     	movq	%rax, 0x120(%rsp)
1400aa8f9:     	addq	$0x28, %r15
1400aa8fd:     	movq	0x10(%rbp), %rax
1400aa901:     	movq	%rax, 0x130(%rsp)
1400aa909:     	leaq	0x28(%rbp), %rax
1400aa90d:     	movq	%rax, 0x140(%rsp)
1400aa915:     	addq	$0x2c, %rbp
1400aa919:     	movq	%rsi, %rcx
1400aa91c:     	movq	%rbx, %rdx
1400aa91f:     	callq	0x140318410 <.text+0x317410>
1400aa924:     	leaq	0x148(%rsi), %rcx
1400aa92b:     	movq	%rbx, %rdx
1400aa92e:     	callq	0x140318410 <.text+0x317410>
1400aa933:     	movq	0x168(%rsp), %rax
1400aa93b:     	movq	%rax, 0x50(%rsp)
1400aa940:     	movq	%r15, 0x58(%rsp)
1400aa945:     	movq	0x120(%rsp), %rax
1400aa94d:     	movq	%rax, 0x60(%rsp)
1400aa952:     	movl	%r12d, 0x68(%rsp)
1400aa957:     	movl	0x4c(%rsp), %r15d
1400aa95c:     	movl	%r15d, 0x6c(%rsp)
1400aa961:     	movq	0x148(%rsp), %rax
1400aa969:     	movq	%rax, 0x70(%rsp)
1400aa96e:     	movq	%r13, 0x78(%rsp)
1400aa973:     	movq	0x128(%rsp), %rax
1400aa97b:     	movq	%rax, 0x80(%rsp)
1400aa983:     	movl	%r12d, 0x88(%rsp)
1400aa98b:     	movl	%r15d, 0x8c(%rsp)
1400aa993:     	movq	0x150(%rsp), %rax
1400aa99b:     	movq	%rax, 0x90(%rsp)
1400aa9a3:     	movq	%rdi, 0x98(%rsp)
1400aa9ab:     	movq	0x138(%rsp), %rax
1400aa9b3:     	movq	%rax, 0xa0(%rsp)
1400aa9bb:     	movl	%r12d, 0xa8(%rsp)
1400aa9c3:     	movl	%r15d, 0xac(%rsp)
1400aa9cb:     	movq	0x160(%rsp), %rax
1400aa9d3:     	movq	%rax, 0xb0(%rsp)
1400aa9db:     	movq	%r14, 0xb8(%rsp)
1400aa9e3:     	movq	0x158(%rsp), %rax
1400aa9eb:     	movq	%rax, 0xc0(%rsp)
1400aa9f3:     	movl	%r12d, 0xc8(%rsp)
1400aa9fb:     	movl	%r15d, 0xcc(%rsp)
1400aaa03:     	movq	0x130(%rsp), %rax
1400aaa0b:     	movq	%rax, 0xd0(%rsp)
1400aaa13:     	leaq	0x70(%rsp), %r8
1400aaa18:     	movq	0x140(%rsp), %rax
1400aaa20:     	movq	%rax, 0xd8(%rsp)
1400aaa28:     	leaq	0x90(%rsp), %r9
1400aaa30:     	movq	%rbp, 0xe0(%rsp)
1400aaa38:     	leaq	0xb0(%rsp), %rax
1400aaa40:     	movl	%r12d, 0xe8(%rsp)
1400aaa48:     	movl	%r15d, 0xec(%rsp)
1400aaa50:     	movq	%rsi, 0xf0(%rsp)
1400aaa58:     	movq	%rbx, 0xf8(%rsp)
1400aaa60:     	movl	%r12d, 0x100(%rsp)
1400aaa68:     	movl	%r15d, 0x104(%rsp)
1400aaa70:     	leaq	0x148(%rsi), %rcx
1400aaa77:     	movq	%rcx, 0x108(%rsp)
1400aaa7f:     	leaq	0xd0(%rsp), %rcx
1400aaa87:     	movq	%rbx, 0x110(%rsp)
1400aaa8f:     	leaq	0xf0(%rsp), %rdx
1400aaa97:     	movl	%r12d, 0x118(%rsp)
1400aaa9f:     	leaq	0x108(%rsp), %r10
1400aaaa7:     	movl	%r15d, 0x11c(%rsp)
1400aaaaf:     	movq	%r10, 0x38(%rsp)
1400aaab4:     	movq	%rdx, 0x30(%rsp)
1400aaab9:     	movq	%rcx, 0x28(%rsp)
1400aaabe:     	movq	%rax, 0x20(%rsp)
1400aaac3:     	leaq	0x50(%rsp), %rdx
1400aaac8:     	callq	0x14009d4d0 <.text+0x9c4d0>
1400aaacd:     	movl	%r15d, 0x270(%rsi)
1400aaad4:     	movq	0x170(%rsp), %rax
1400aaadc:     	movq	$-0x3, (%rax)
1400aaae3:     	addq	$0x178, %rsp            # imm = 0x178
1400aaaea:     	popq	%rbx
1400aaaeb:     	popq	%rbp
1400aaaec:     	popq	%rdi
1400aaaed:     	popq	%rsi
1400aaaee:     	popq	%r12
1400aaaf0:     	popq	%r13
1400aaaf2:     	popq	%r14
1400aaaf4:     	popq	%r15
1400aaaf6:     	retq
1400aaaf7:     	leaq	0x585150a(%rip), %rcx   # 0x1458fc008
1400aaafe:     	leaq	0x5851563(%rip), %r8    # 0x1458fc068
1400aab05:     	movl	$0x59, %edx
1400aab0a:     	callq	0x1458e74d0 <.text+0x58e64d0>
1400aab0f:     	ud2
1400aab11:     	addq	$0x268, %rsi            # imm = 0x268
1400aab18:     	leaq	0x58515d1(%rip), %rax   # 0x1458fc0f0
1400aab1f:     	movq	%rax, 0x28(%rsp)
1400aab24:     	movq	$0xdf, 0x20(%rsp)
1400aab2d:     	leaq	0x585154c(%rip), %r9    # 0x1458fc080
1400aab34:     	leaq	0x50(%rsp), %r8
1400aab39:     	xorl	%ecx, %ecx
1400aab3b:     	movq	%rsi, %rdx
1400aab3e:     	callq	0x14589fabd <.text+0x589eabd>
1400aab43:     	ud2
1400aab45:     	addq	$0x274, %rsi            # imm = 0x274
1400aab4c:     	movq	%rsi, 0x50(%rsp)
1400aab51:     	leaq	0x4f4e458(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aab58:     	movq	%rax, 0x58(%rsp)
1400aab5d:     	leaq	0x4b(%rsp), %rcx
1400aab62:     	movq	%rcx, 0x60(%rsp)
1400aab67:     	movq	%rax, 0x68(%rsp)
1400aab6c:     	leaq	0x585110d(%rip), %rcx   # 0x1458fbc80
1400aab73:     	leaq	0x5851136(%rip), %r8    # 0x1458fbcb0
1400aab7a:     	leaq	0x50(%rsp), %rdx
1400aab7f:     	callq	0x1458e7790 <.text+0x58e6790>
1400aab84:     	ud2
1400aab86:     	addq	$0x274, %rsi            # imm = 0x274
1400aab8d:     	movq	%rsi, 0x50(%rsp)
1400aab92:     	leaq	0x4f4e417(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aab99:     	movq	%rax, 0x58(%rsp)
1400aab9e:     	leaq	0x4b(%rsp), %rcx
1400aaba3:     	movq	%rcx, 0x60(%rsp)
1400aaba8:     	movq	%rax, 0x68(%rsp)
1400aabad:     	leaq	0x58510cc(%rip), %rcx   # 0x1458fbc80
1400aabb4:     	leaq	0x58512e5(%rip), %r8    # 0x1458fbea0
1400aabbb:     	leaq	0x50(%rsp), %rdx
1400aabc0:     	callq	0x1458e7790 <.text+0x58e6790>
1400aabc5:     	ud2
