
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403aa820:     	pushq	%r15
1403aa822:     	pushq	%r14
1403aa824:     	pushq	%r13
1403aa826:     	pushq	%r12
1403aa828:     	pushq	%rsi
1403aa829:     	pushq	%rdi
1403aa82a:     	pushq	%rbp
1403aa82b:     	pushq	%rbx
1403aa82c:     	subq	$0xd8, %rsp
1403aa833:     	movl	$0x1, %ebp
1403aa838:     	lock
1403aa839:     	xaddl	%ebp, 0x5b0(%r8)
1403aa841:     	cmpq	$-0x1, 0xf0(%rdx)
1403aa849:     	je	0x1403aaa3c <.text+0x3a9a3c>
1403aa84f:     	movq	%r8, %rbx
1403aa852:     	movq	%rdx, %rsi
1403aa855:     	movq	0x5a0(%r8), %rax
1403aa85c:     	movq	%rax, 0x48(%rsp)
1403aa861:     	cmpq	%rax, 0x378(%rdx)
1403aa868:     	jne	0x1403aaa56 <.text+0x3a9a56>
1403aa86e:     	movq	%rcx, %rdi
1403aa871:     	leaq	0x120(%rsi), %r15
1403aa878:     	leaq	0x240(%rsi), %r14
1403aa87f:     	movl	0x380(%rsi), %r12d
1403aa886:     	movq	%rsi, %rcx
1403aa889:     	movq	%rbx, %rdx
1403aa88c:     	callq	0x140318410 <.text+0x317410>
1403aa891:     	movq	%r15, %rcx
1403aa894:     	movq	%rbx, %rdx
1403aa897:     	callq	0x140318410 <.text+0x317410>
1403aa89c:     	movq	%r14, %rcx
1403aa89f:     	movq	%rbx, %rdx
1403aa8a2:     	callq	0x140318410 <.text+0x317410>
1403aa8a7:     	movq	0x360(%rsi), %rax
1403aa8ae:     	movq	0x218(%rbx), %rcx
1403aa8b5:     	cmpq	%rcx, %rax
1403aa8b8:     	jae	0x1403aaa8a <.text+0x3a9a8a>
1403aa8be:     	movq	0x210(%rbx), %r8
1403aa8c5:     	movq	(%r8,%rax,8), %rax
1403aa8c9:     	testq	%rax, %rax
1403aa8cc:     	je	0x1403aaa8a <.text+0x3a9a8a>
1403aa8d2:     	movq	0x1e0(%rbx), %rdx
1403aa8d9:     	notq	%rax
1403aa8dc:     	imulq	$0x38, %rax, %rax
1403aa8e0:     	cmpb	$0x0, 0x30(%rdx,%rax)
1403aa8e5:     	je	0x1403aaa8a <.text+0x3a9a8a>
1403aa8eb:     	movq	0x368(%rsi), %r9
1403aa8f2:     	cmpq	%rcx, %r9
1403aa8f5:     	jae	0x1403aaacb <.text+0x3a9acb>
1403aa8fb:     	movq	(%r8,%r9,8), %rcx
1403aa8ff:     	testq	%rcx, %rcx
1403aa902:     	je	0x1403aaacb <.text+0x3a9acb>
1403aa908:     	notq	%rcx
1403aa90b:     	imulq	$0x38, %rcx, %rcx
1403aa90f:     	cmpb	$0x0, 0x30(%rdx,%rcx)
1403aa914:     	je	0x1403aaacb <.text+0x3a9acb>
1403aa91a:     	addq	%rdx, %rax
1403aa91d:     	movq	0x10(%rax), %r10
1403aa921:     	addq	%rdx, %rcx
1403aa924:     	leaq	0x2c(%rax), %r11
1403aa928:     	addq	$0x28, %rax
1403aa92c:     	leaq	0x370(%rsi), %rdx
1403aa933:     	movq	0x10(%rcx), %r13
1403aa937:     	leaq	0x28(%rcx), %r14
1403aa93b:     	addq	$0x2c, %rcx
1403aa93f:     	movl	0x5b0(%rbx), %r8d
1403aa946:     	movq	%rsi, 0x48(%rsp)
1403aa94b:     	movq	%rbx, 0x50(%rsp)
1403aa950:     	movl	%r12d, 0x58(%rsp)
1403aa955:     	movl	%ebp, 0x5c(%rsp)
1403aa959:     	leaq	0x60(%rsp), %r8
1403aa95e:     	movq	%r15, 0x60(%rsp)
1403aa963:     	movq	%rbx, 0x68(%rsp)
1403aa968:     	movl	%r12d, 0x70(%rsp)
1403aa96d:     	movl	%ebp, 0x74(%rsp)
1403aa971:     	leaq	0x78(%rsp), %r9
1403aa976:     	leaq	0x240(%rsi), %r15
1403aa97d:     	movq	%r15, 0x78(%rsp)
1403aa982:     	movq	%rbx, 0x80(%rsp)
1403aa98a:     	movl	%r12d, 0x88(%rsp)
1403aa992:     	movl	%ebp, 0x8c(%rsp)
1403aa999:     	leaq	0x90(%rsp), %rbx
1403aa9a1:     	movq	%r10, 0x90(%rsp)
1403aa9a9:     	movq	%rax, 0x98(%rsp)
1403aa9b1:     	movq	%r11, 0xa0(%rsp)
1403aa9b9:     	movl	%r12d, 0xa8(%rsp)
1403aa9c1:     	movl	%ebp, 0xac(%rsp)
1403aa9c8:     	leaq	0xb0(%rsp), %rax
1403aa9d0:     	movq	%r13, 0xb0(%rsp)
1403aa9d8:     	movq	%r14, 0xb8(%rsp)
1403aa9e0:     	movq	%rcx, 0xc0(%rsp)
1403aa9e8:     	movl	%r12d, 0xc8(%rsp)
1403aa9f0:     	movl	%ebp, 0xcc(%rsp)
1403aa9f7:     	movq	%rdx, 0xd0(%rsp)
1403aa9ff:     	movq	%rdx, 0x30(%rsp)
1403aaa04:     	movq	%rax, 0x28(%rsp)
1403aaa09:     	movq	%rbx, 0x20(%rsp)
1403aaa0e:     	leaq	0x48(%rsp), %rdx
1403aaa13:     	callq	0x1403a24c0 <.text+0x3a14c0>
1403aaa18:     	movl	%ebp, 0x380(%rsi)
1403aaa1e:     	movq	$-0x3, (%rdi)
1403aaa25:     	movq	%rdi, %rax
1403aaa28:     	addq	$0xd8, %rsp
1403aaa2f:     	popq	%rbx
1403aaa30:     	popq	%rbp
1403aaa31:     	popq	%rdi
1403aaa32:     	popq	%rsi
1403aaa33:     	popq	%r12
1403aaa35:     	popq	%r13
1403aaa37:     	popq	%r14
1403aaa39:     	popq	%r15
1403aaa3b:     	retq
1403aaa3c:     	leaq	0x55a6af5(%rip), %rcx   # 0x145951538
1403aaa43:     	leaq	0x55a6b4e(%rip), %r8    # 0x145951598
1403aaa4a:     	movl	$0x59, %edx
1403aaa4f:     	callq	0x1458e74d0 <.text+0x58e64d0>
1403aaa54:     	ud2
1403aaa56:     	addq	$0x378, %rsi            # imm = 0x378
1403aaa5d:     	leaq	0x55a6bbc(%rip), %rax   # 0x145951620
1403aaa64:     	movq	%rax, 0x28(%rsp)
1403aaa69:     	movq	$0xdf, 0x20(%rsp)
1403aaa72:     	leaq	0x55a6b37(%rip), %r9    # 0x1459515b0
1403aaa79:     	leaq	0x48(%rsp), %r8
1403aaa7e:     	xorl	%ecx, %ecx
1403aaa80:     	movq	%rsi, %rdx
1403aaa83:     	callq	0x14589fabd <.text+0x589eabd>
1403aaa88:     	ud2
1403aaa8a:     	addq	$0x384, %rsi            # imm = 0x384
1403aaa91:     	movq	%rsi, 0x48(%rsp)
1403aaa96:     	leaq	0x4c4e513(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1403aaa9d:     	movq	%rax, 0x50(%rsp)
1403aaaa2:     	leaq	0x47(%rsp), %rcx
1403aaaa7:     	movq	%rcx, 0x58(%rsp)
1403aaaac:     	movq	%rax, 0x60(%rsp)
1403aaab1:     	leaq	0x55a6778(%rip), %rcx   # 0x145951230
1403aaab8:     	leaq	0x55a6811(%rip), %r8    # 0x1459512d0
1403aaabf:     	leaq	0x48(%rsp), %rdx
1403aaac4:     	callq	0x1458e7790 <.text+0x58e6790>
1403aaac9:     	ud2
1403aaacb:     	addq	$0x384, %rsi            # imm = 0x384
1403aaad2:     	movq	%rsi, 0x48(%rsp)
1403aaad7:     	leaq	0x4c4e4d2(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1403aaade:     	movq	%rax, 0x50(%rsp)
1403aaae3:     	leaq	0x47(%rsp), %rcx
1403aaae8:     	movq	%rcx, 0x58(%rsp)
1403aaaed:     	movq	%rax, 0x60(%rsp)
1403aaaf2:     	leaq	0x55a6737(%rip), %rcx   # 0x145951230
1403aaaf9:     	leaq	0x55a67e8(%rip), %r8    # 0x1459512e8
1403aab00:     	leaq	0x48(%rsp), %rdx
1403aab05:     	callq	0x1458e7790 <.text+0x58e6790>
1403aab0a:     	ud2
