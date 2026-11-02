
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145910acf:     	movq	0x628(%r13), %rdx
145910ad6:     	cmpq	%rdx, %rbx
145910ad9:     	jae	0x1459116e9 <.text+0x59106e9>
145910adf:     	movq	0x620(%r13), %rax
145910ae6:     	leaq	(%rbx,%rbx,4), %rsi
145910aea:     	movq	$0x1, (%rax,%rsi,8)
145910af2:     	movq	%r15, 0x8(%rax,%rsi,8)
145910af7:     	movq	$0x0, (%r13)
145910aff:     	movss	0x9ec(%r13), %xmm0
145910b08:     	ucomiss	0xbdb879(%rip), %xmm0   # 0x1464ec388
145910b0f:     	movq	0x360(%rbp), %rcx
145910b16:     	jbe	0x1459106f0 <.text+0x590f6f0>
145910b1c:     	movq	0x290(%r13), %rcx
145910b23:     	movq	0x298(%r13), %rdx
145910b2a:     	callq	0x1458753b0 <.text+0x58743b0>
145910b2f:     	movq	0x628(%r13), %rdx
145910b36:     	cmpq	%rdx, %rbx
145910b39:     	jae	0x1459117c5 <.text+0x59107c5>
145910b3f:     	imulq	$0xf0, %rax, %rax
145910b46:     	addq	%r12, %rax
145910b49:     	movq	0x620(%r13), %rcx
145910b50:     	movq	0x10(%rcx,%rsi,8), %rcx
145910b55:     	movq	0x80(%rax), %rdx
145910b5c:     	cmpq	%rdx, %rcx
145910b5f:     	jae	0x1459117d6 <.text+0x59107d6>
145910b65:     	movq	0x78(%rax), %rsi
145910b69:     	leaq	(%rcx,%rcx,4), %rdi
145910b6d:     	shlq	$0x4, %rdi
145910b71:     	leaq	(%rsi,%rdi), %rax
145910b75:     	addq	$0x20, %rax
145910b79:     	movq	%rax, 0x230(%rbp)
145910b80:     	leaq	0x29d3f9(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
145910b87:     	movq	%rax, 0x238(%rbp)
145910b8e:     	leaq	0xa0(%rbp), %rcx
145910b95:     	leaq	0x12901c4(%rip), %rdx   # 0x146ba0d60
145910b9c:     	leaq	0x230(%rbp), %r8
145910ba3:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145910ba8:     	movq	0xa8(%rbp), %rcx
145910baf:     	movq	0xb0(%rbp), %rdx
145910bb6:     	movq	0x10(%rsi,%rdi), %r14
145910bbb:     	movq	0x18(%rsi,%rdi), %r13
145910bc0:     	movq	%rcx, 0x370(%rbp)
145910bc7:     	callq	0x1458da590 <.text+0x58d9590>
145910bcc:     	nop
145910bcd:     	movq	%rax, %rdi
145910bd0:     	movq	%rdx, %r15
145910bd3:     	movq	0xa0(%rbp), %rdx
145910bda:     	testq	%rdx, %rdx
145910bdd:     	je	0x145910bf1 <.text+0x590fbf1>
145910bdf:     	movl	$0x1, %r8d
145910be5:     	movq	0x370(%rbp), %rcx
145910bec:     	callq	0x1400021d0 <.text+0x11d0>
145910bf1:     	testq	%rdi, %rdi
145910bf4:     	cmovneq	%rdi, %r14
145910bf8:     	cmoveq	%r13, %r15
145910bfc:     	movl	$0x1d, %edx
145910c01:     	leaq	0x156a308(%rip), %rsi   # 0x146e7af10
145910c08:     	movq	%rsi, %rcx
145910c0b:     	callq	0x1458da590 <.text+0x58d9590>
145910c10:     	testq	%rax, %rax
145910c13:     	cmoveq	%rsi, %rax
145910c17:     	movl	$0x1d, %ecx
145910c1c:     	cmoveq	%rcx, %rdx
145910c20:     	movq	%rdx, 0x20(%rsp)
145910c25:     	leaq	0xa0(%rbp), %rcx
145910c2c:     	movq	%r14, %rdx
145910c2f:     	movq	%r15, %r8
145910c32:     	movq	%rax, %r9
145910c35:     	callq	0x1458a9500 <.text+0x58a8500>
145910c3a:     	movq	0x378(%rbp), %r13
145910c41:     	movq	0x5e0(%r13), %rsi
145910c48:     	cmpq	0x5d0(%r13), %rsi
145910c4f:     	jne	0x1459106ac <.text+0x590f6ac>
145910c55:     	movq	0x350(%rbp), %rcx
145910c5c:     	callq	0x145bcb530 <.text+0x5bca530>
145910c61:     	nop
145910c62:     	jmp	0x1459106ac <.text+0x590f6ac>
