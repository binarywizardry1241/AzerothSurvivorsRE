
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403ab990:     	pushq	%r15
1403ab992:     	pushq	%r14
1403ab994:     	pushq	%r13
1403ab996:     	pushq	%r12
1403ab998:     	pushq	%rsi
1403ab999:     	pushq	%rdi
1403ab99a:     	pushq	%rbp
1403ab99b:     	pushq	%rbx
1403ab99c:     	subq	$0x188, %rsp            # imm = 0x188
1403ab9a3:     	movl	$0x1, %r11d
1403ab9a9:     	lock
1403ab9aa:     	xaddl	%r11d, 0x5b0(%r8)
1403ab9b2:     	cmpq	$-0x1, 0xf0(%rdx)
1403ab9ba:     	je	0x1403abd88 <.text+0x3aad88>
1403ab9c0:     	movq	%rdx, %rsi
1403ab9c3:     	movq	0x5a0(%r8), %rax
1403ab9ca:     	movq	%rax, 0x58(%rsp)
1403ab9cf:     	cmpq	%rax, 0x328(%rdx)
1403ab9d6:     	jne	0x1403abda2 <.text+0x3aada2>
1403ab9dc:     	movq	0x258(%rsi), %rax
1403ab9e3:     	movq	0x218(%r8), %r9
1403ab9ea:     	cmpq	%r9, %rax
1403ab9ed:     	jae	0x1403abdd6 <.text+0x3aadd6>
1403ab9f3:     	movq	0x210(%r8), %rdx
1403ab9fa:     	movq	(%rdx,%rax,8), %r10
1403ab9fe:     	testq	%r10, %r10
1403aba01:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba07:     	movq	0x1e0(%r8), %rax
1403aba0e:     	notq	%r10
1403aba11:     	imulq	$0x38, %r10, %r15
1403aba15:     	cmpb	$0x0, 0x30(%rax,%r15)
1403aba1b:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba21:     	movq	0x260(%rsi), %r10
1403aba28:     	cmpq	%r9, %r10
1403aba2b:     	jae	0x1403abdd6 <.text+0x3aadd6>
1403aba31:     	movq	(%rdx,%r10,8), %r10
1403aba35:     	testq	%r10, %r10
1403aba38:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba3e:     	notq	%r10
1403aba41:     	imulq	$0x38, %r10, %r12
1403aba45:     	cmpb	$0x0, 0x30(%rax,%r12)
1403aba4b:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba51:     	movq	0x268(%rsi), %r10
1403aba58:     	cmpq	%r9, %r10
1403aba5b:     	jae	0x1403abdd6 <.text+0x3aadd6>
1403aba61:     	movq	(%rdx,%r10,8), %r10
1403aba65:     	testq	%r10, %r10
1403aba68:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba6e:     	notq	%r10
1403aba71:     	imulq	$0x38, %r10, %r13
1403aba75:     	cmpb	$0x0, 0x30(%rax,%r13)
1403aba7b:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba81:     	movq	0x270(%rsi), %r10
1403aba88:     	cmpq	%r9, %r10
1403aba8b:     	jae	0x1403abdd6 <.text+0x3aadd6>
1403aba91:     	movq	(%rdx,%r10,8), %r10
1403aba95:     	testq	%r10, %r10
1403aba98:     	je	0x1403abdd6 <.text+0x3aadd6>
1403aba9e:     	notq	%r10
1403abaa1:     	imulq	$0x38, %r10, %rdi
1403abaa5:     	cmpb	$0x0, 0x30(%rax,%rdi)
1403abaaa:     	je	0x1403abdd6 <.text+0x3aadd6>
1403abab0:     	movl	%r11d, 0x54(%rsp)
1403abab5:     	movq	%rcx, 0x180(%rsp)
1403ababd:     	movq	0x278(%rsi), %rcx
1403abac4:     	cmpq	%r9, %rcx
1403abac7:     	jae	0x1403abdd6 <.text+0x3aadd6>
1403abacd:     	movq	(%rdx,%rcx,8), %rcx
1403abad1:     	testq	%rcx, %rcx
1403abad4:     	je	0x1403abdd6 <.text+0x3aadd6>
1403abada:     	notq	%rcx
1403abadd:     	imulq	$0x38, %rcx, %rbx
1403abae1:     	cmpb	$0x0, 0x30(%rax,%rbx)
1403abae6:     	je	0x1403abdd6 <.text+0x3aadd6>
1403abaec:     	addq	%rax, %r15
1403abaef:     	movq	0x10(%r15), %rcx
1403abaf3:     	movq	%rcx, 0x158(%rsp)
1403abafb:     	movl	0x330(%rsi), %r14d
1403abb02:     	addq	%rax, %r12
1403abb05:     	movq	0x10(%r12), %rcx
1403abb0a:     	movq	%rcx, 0x160(%rsp)
1403abb12:     	addq	%rax, %r13
1403abb15:     	movq	0x10(%r13), %rcx
1403abb19:     	movq	%rcx, 0x168(%rsp)
1403abb21:     	addq	%rax, %rdi
1403abb24:     	movq	0x10(%rdi), %rcx
1403abb28:     	movq	%rcx, 0x178(%rsp)
1403abb30:     	addq	%rax, %rbx
1403abb33:     	leaq	0x2c(%rdi), %rax
1403abb37:     	movq	%rax, 0x170(%rsp)
1403abb3f:     	addq	$0x28, %rdi
1403abb43:     	leaq	0x2c(%r13), %rax
1403abb47:     	movq	%rax, 0x150(%rsp)
1403abb4f:     	addq	$0x28, %r13
1403abb53:     	leaq	0x2c(%r12), %rax
1403abb58:     	movq	%rax, 0x138(%rsp)
1403abb60:     	addq	$0x28, %r12
1403abb64:     	leaq	0x2c(%r15), %rax
1403abb68:     	movq	%rax, 0x130(%rsp)
1403abb70:     	addq	$0x28, %r15
1403abb74:     	movq	0x10(%rbx), %rax
1403abb78:     	movq	%rax, 0x140(%rsp)
1403abb80:     	leaq	0x28(%rbx), %rax
1403abb84:     	movq	%rax, 0x148(%rsp)
1403abb8c:     	addq	$0x2c, %rbx
1403abb90:     	movq	%rsi, %rcx
1403abb93:     	movq	%r8, %rdx
1403abb96:     	movq	%r8, %rbp
1403abb99:     	callq	0x140324270 <.text+0x323270>
1403abb9e:     	leaq	0x128(%rsi), %rcx
1403abba5:     	movq	%rbp, %rdx
1403abba8:     	callq	0x14032ff30 <.text+0x32ef30>
1403abbad:     	movq	0x158(%rsp), %rax
1403abbb5:     	movq	%rax, 0x58(%rsp)
1403abbba:     	movq	%r15, 0x60(%rsp)
1403abbbf:     	movq	0x130(%rsp), %rax
1403abbc7:     	movq	%rax, 0x68(%rsp)
1403abbcc:     	movl	%r14d, 0x70(%rsp)
1403abbd1:     	movl	0x54(%rsp), %r15d
1403abbd6:     	movl	%r15d, 0x74(%rsp)
1403abbdb:     	movq	0x160(%rsp), %rax
1403abbe3:     	movq	%rax, 0x78(%rsp)
1403abbe8:     	movq	%r12, 0x80(%rsp)
1403abbf0:     	movq	0x138(%rsp), %rax
1403abbf8:     	movq	%rax, 0x88(%rsp)
1403abc00:     	movl	%r14d, 0x90(%rsp)
1403abc08:     	movl	%r15d, 0x94(%rsp)
1403abc10:     	movq	0x168(%rsp), %rax
1403abc18:     	movq	%rax, 0x98(%rsp)
1403abc20:     	movq	%r13, 0xa0(%rsp)
1403abc28:     	movq	0x150(%rsp), %rax
1403abc30:     	movq	%rax, 0xa8(%rsp)
1403abc38:     	movl	%r14d, 0xb0(%rsp)
1403abc40:     	movl	%r15d, 0xb4(%rsp)
1403abc48:     	movq	0x178(%rsp), %rax
1403abc50:     	movq	%rax, 0xb8(%rsp)
1403abc58:     	movq	%rdi, 0xc0(%rsp)
1403abc60:     	movq	0x170(%rsp), %rax
1403abc68:     	movq	%rax, 0xc8(%rsp)
1403abc70:     	movl	%r14d, 0xd0(%rsp)
1403abc78:     	movl	%r15d, 0xd4(%rsp)
1403abc80:     	movq	0x140(%rsp), %rax
1403abc88:     	movq	%rax, 0xd8(%rsp)
1403abc90:     	leaq	0x78(%rsp), %r8
1403abc95:     	movq	0x148(%rsp), %rax
1403abc9d:     	movq	%rax, 0xe0(%rsp)
1403abca5:     	leaq	0x98(%rsp), %r9
1403abcad:     	movq	%rbx, 0xe8(%rsp)
1403abcb5:     	leaq	0xb8(%rsp), %rax
1403abcbd:     	movl	%r14d, 0xf0(%rsp)
1403abcc5:     	movl	%r15d, 0xf4(%rsp)
1403abccd:     	movq	%rsi, 0xf8(%rsp)
1403abcd5:     	movq	%rbp, 0x100(%rsp)
1403abcdd:     	movl	%r14d, 0x108(%rsp)
1403abce5:     	movl	%r15d, 0x10c(%rsp)
1403abced:     	leaq	0x128(%rsi), %rcx
1403abcf4:     	movq	%rcx, 0x110(%rsp)
1403abcfc:     	leaq	0xd8(%rsp), %rcx
1403abd04:     	movq	%rbp, 0x118(%rsp)
1403abd0c:     	leaq	0xf8(%rsp), %rdx
1403abd14:     	movl	%r14d, 0x120(%rsp)
1403abd1c:     	leaq	0x110(%rsp), %r10
1403abd24:     	movl	%r15d, 0x124(%rsp)
1403abd2c:     	leaq	0x280(%rsi), %r11
1403abd33:     	movq	%r11, 0x128(%rsp)
1403abd3b:     	movq	%r11, 0x40(%rsp)
1403abd40:     	movq	%r10, 0x38(%rsp)
1403abd45:     	movq	%rdx, 0x30(%rsp)
1403abd4a:     	movq	%rcx, 0x28(%rsp)
1403abd4f:     	movq	%rax, 0x20(%rsp)
1403abd54:     	leaq	0x58(%rsp), %rdx
1403abd59:     	callq	0x1403a29f0 <.text+0x3a19f0>
1403abd5e:     	movl	%r15d, 0x330(%rsi)
1403abd65:     	movq	0x180(%rsp), %rax
1403abd6d:     	movq	$-0x3, (%rax)
1403abd74:     	addq	$0x188, %rsp            # imm = 0x188
1403abd7b:     	popq	%rbx
1403abd7c:     	popq	%rbp
1403abd7d:     	popq	%rdi
1403abd7e:     	popq	%rsi
1403abd7f:     	popq	%r12
1403abd81:     	popq	%r13
1403abd83:     	popq	%r14
1403abd85:     	popq	%r15
1403abd87:     	retq
1403abd88:     	leaq	0x55a57a9(%rip), %rcx   # 0x145951538
1403abd8f:     	leaq	0x55a5802(%rip), %r8    # 0x145951598
1403abd96:     	movl	$0x59, %edx
1403abd9b:     	callq	0x1458e74d0 <.text+0x58e64d0>
1403abda0:     	ud2
1403abda2:     	addq	$0x328, %rsi            # imm = 0x328
1403abda9:     	leaq	0x55a5870(%rip), %rax   # 0x145951620
1403abdb0:     	movq	%rax, 0x28(%rsp)
1403abdb5:     	movq	$0xdf, 0x20(%rsp)
1403abdbe:     	leaq	0x55a57eb(%rip), %r9    # 0x1459515b0
1403abdc5:     	leaq	0x58(%rsp), %r8
1403abdca:     	xorl	%ecx, %ecx
1403abdcc:     	movq	%rsi, %rdx
1403abdcf:     	callq	0x14589fabd <.text+0x589eabd>
1403abdd4:     	ud2
1403abdd6:     	addq	$0x334, %rsi            # imm = 0x334
1403abddd:     	movq	%rsi, 0x58(%rsp)
1403abde2:     	leaq	0x4c4d1c7(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1403abde9:     	movq	%rax, 0x60(%rsp)
1403abdee:     	leaq	0x53(%rsp), %rcx
1403abdf3:     	movq	%rcx, 0x68(%rsp)
1403abdf8:     	movq	%rax, 0x70(%rsp)
1403abdfd:     	leaq	0x55a542c(%rip), %rcx   # 0x145951230
1403abe04:     	leaq	0x55a54c5(%rip), %r8    # 0x1459512d0
1403abe0b:     	leaq	0x58(%rsp), %rdx
1403abe10:     	callq	0x1458e7790 <.text+0x58e6790>
1403abe15:     	ud2
