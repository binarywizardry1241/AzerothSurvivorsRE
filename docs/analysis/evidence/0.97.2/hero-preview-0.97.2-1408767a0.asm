
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408767a0:     	pushq	%r15
1408767a2:     	pushq	%r14
1408767a4:     	pushq	%r13
1408767a6:     	pushq	%r12
1408767a8:     	pushq	%rsi
1408767a9:     	pushq	%rdi
1408767aa:     	pushq	%rbp
1408767ab:     	pushq	%rbx
1408767ac:     	subq	$0xe8, %rsp
1408767b3:     	movl	$0x1, %ebx
1408767b8:     	lock
1408767b9:     	xaddl	%ebx, 0x5b0(%r8)
1408767c1:     	cmpb	$0x2, 0x38(%rdx)
1408767c5:     	je	0x140876a70 <.text+0x875a70>
1408767cb:     	movq	%rdx, %rsi
1408767ce:     	movq	0x5a0(%r8), %rax
1408767d5:     	movq	%rax, 0x40(%rsp)
1408767da:     	cmpq	%rax, 0x8(%rdx)
1408767de:     	jne	0x140876a8a <.text+0x875a8a>
1408767e4:     	movq	0x10(%rsi), %rax
1408767e8:     	cmpq	0x218(%r8), %rax
1408767ef:     	jae	0x140876abb <.text+0x875abb>
1408767f5:     	movq	%rcx, %rdi
1408767f8:     	movq	0x210(%r8), %rcx
1408767ff:     	movq	(%rcx,%rax,8), %rax
140876803:     	testq	%rax, %rax
140876806:     	je	0x140876abb <.text+0x875abb>
14087680c:     	movq	0x1e0(%r8), %rcx
140876813:     	notq	%rax
140876816:     	imulq	$0x38, %rax, %rax
14087681a:     	cmpb	$0x0, 0x30(%rcx,%rax)
14087681f:     	je	0x140876abb <.text+0x875abb>
140876825:     	addq	%rax, %rcx
140876828:     	movq	0x10(%rcx), %rdx
14087682c:     	movl	0x5b0(%r8), %eax
140876833:     	movq	0x18(%rsi), %rax
140876837:     	cmpq	0x218(%r8), %rax
14087683e:     	jae	0x140876abb <.text+0x875abb>
140876844:     	movq	0x210(%r8), %r9
14087684b:     	movq	(%r9,%rax,8), %rax
14087684f:     	testq	%rax, %rax
140876852:     	je	0x140876abb <.text+0x875abb>
140876858:     	movq	0x1e0(%r8), %r9
14087685f:     	notq	%rax
140876862:     	imulq	$0x38, %rax, %r10
140876866:     	cmpb	$0x0, 0x30(%r9,%r10)
14087686c:     	je	0x140876abb <.text+0x875abb>
140876872:     	movl	(%rsi), %eax
140876874:     	addq	%r10, %r9
140876877:     	movq	0x10(%r9), %r10
14087687b:     	movl	0x5b0(%r8), %r11d
140876882:     	movq	0x20(%rsi), %r11
140876886:     	movq	0x218(%r8), %r15
14087688d:     	cmpq	%r15, %r11
140876890:     	jae	0x140876af9 <.text+0x875af9>
140876896:     	movq	0x210(%r8), %r12
14087689d:     	movq	(%r12,%r11,8), %r14
1408768a1:     	testq	%r14, %r14
1408768a4:     	je	0x140876af9 <.text+0x875af9>
1408768aa:     	movq	0x1e0(%r8), %r11
1408768b1:     	notq	%r14
1408768b4:     	imulq	$0x38, %r14, %r14
1408768b8:     	cmpb	$0x0, 0x30(%r11,%r14)
1408768be:     	je	0x140876af9 <.text+0x875af9>
1408768c4:     	movq	0x28(%rsi), %r13
1408768c8:     	cmpq	%r15, %r13
1408768cb:     	jae	0x140876abb <.text+0x875abb>
1408768d1:     	movq	(%r12,%r13,8), %r15
1408768d5:     	testq	%r15, %r15
1408768d8:     	je	0x140876abb <.text+0x875abb>
1408768de:     	notq	%r15
1408768e1:     	imulq	$0x38, %r15, %r15
1408768e5:     	cmpb	$0x0, 0x30(%r11,%r15)
1408768eb:     	je	0x140876abb <.text+0x875abb>
1408768f1:     	addq	%r11, %r14
1408768f4:     	movq	0x10(%r14), %r13
1408768f8:     	addq	%r11, %r15
1408768fb:     	movq	0x10(%r15), %r12
1408768ff:     	movl	0x5b0(%r8), %r11d
140876906:     	movq	0x30(%rsi), %r11
14087690a:     	cmpq	0x218(%r8), %r11
140876911:     	jae	0x14087694b <.text+0x87594b>
140876913:     	movq	0x210(%r8), %rbp
14087691a:     	movq	(%rbp,%r11,8), %r11
14087691f:     	testq	%r11, %r11
140876922:     	je	0x14087694b <.text+0x87594b>
140876924:     	movq	0x1e0(%r8), %rbp
14087692b:     	notq	%r11
14087692e:     	imulq	$0x38, %r11, %r8
140876932:     	cmpb	$0x1, 0x30(%rbp,%r8)
140876938:     	jne	0x14087694b <.text+0x87594b>
14087693a:     	addq	%r8, %rbp
14087693d:     	movq	0x10(%rbp), %r8
140876941:     	leaq	0x28(%rbp), %r11
140876945:     	addq	$0x2c, %rbp
140876949:     	jmp	0x14087694e <.text+0x87594e>
14087694b:     	xorl	%r8d, %r8d
14087694e:     	movq	%rdx, 0x40(%rsp)
140876953:     	leaq	0x2c(%rcx), %rdx
140876957:     	addq	$0x28, %rcx
14087695b:     	movq	%rcx, 0x48(%rsp)
140876960:     	movq	%rdx, 0x50(%rsp)
140876965:     	movl	%eax, 0x58(%rsp)
140876969:     	movl	%ebx, 0x5c(%rsp)
14087696d:     	movq	%r10, 0x60(%rsp)
140876972:     	leaq	0x2c(%r9), %rcx
140876976:     	addq	$0x28, %r9
14087697a:     	movq	%r9, 0x68(%rsp)
14087697f:     	movq	%rcx, 0x70(%rsp)
140876984:     	movl	%eax, 0x78(%rsp)
140876988:     	movl	%ebx, 0x7c(%rsp)
14087698c:     	movq	%r13, 0x80(%rsp)
140876994:     	leaq	0x2c(%r14), %rcx
140876998:     	addq	$0x28, %r14
14087699c:     	movq	%r14, 0x88(%rsp)
1408769a4:     	movq	%rcx, 0x90(%rsp)
1408769ac:     	movl	%eax, 0x98(%rsp)
1408769b3:     	movl	%ebx, 0x9c(%rsp)
1408769ba:     	movq	%r12, 0xa0(%rsp)
1408769c2:     	leaq	0x2c(%r15), %rcx
1408769c6:     	addq	$0x28, %r15
1408769ca:     	movq	%r15, 0xa8(%rsp)
1408769d2:     	movq	%rcx, 0xb0(%rsp)
1408769da:     	movl	%eax, 0xb8(%rsp)
1408769e1:     	movl	%ebx, 0xbc(%rsp)
1408769e8:     	movq	%r8, 0xc0(%rsp)
1408769f0:     	leaq	0x60(%rsp), %r8
1408769f5:     	movq	%r11, 0xc8(%rsp)
1408769fd:     	leaq	0x80(%rsp), %r9
140876a05:     	movq	%rbp, 0xd0(%rsp)
140876a0d:     	leaq	0xa0(%rsp), %rcx
140876a15:     	movl	%eax, 0xd8(%rsp)
140876a1c:     	leaq	0xc0(%rsp), %rax
140876a24:     	movl	%ebx, 0xdc(%rsp)
140876a2b:     	leaq	0x38(%rsi), %rdx
140876a2f:     	movq	%rdx, 0xe0(%rsp)
140876a37:     	movq	%rdx, 0x30(%rsp)
140876a3c:     	movq	%rax, 0x28(%rsp)
140876a41:     	movq	%rcx, 0x20(%rsp)
140876a46:     	leaq	0x40(%rsp), %rdx
140876a4b:     	callq	0x140816b50 <.text+0x815b50>
140876a50:     	movl	%ebx, (%rsi)
140876a52:     	movq	$-0x3, (%rdi)
140876a59:     	movq	%rdi, %rax
140876a5c:     	addq	$0xe8, %rsp
140876a63:     	popq	%rbx
140876a64:     	popq	%rbp
140876a65:     	popq	%rdi
140876a66:     	popq	%rsi
140876a67:     	popq	%r12
140876a69:     	popq	%r13
140876a6b:     	popq	%r14
140876a6d:     	popq	%r15
140876a6f:     	retq
140876a70:     	leaq	0x5198e79(%rip), %rcx   # 0x145a0f8f0
140876a77:     	leaq	0x5198ed2(%rip), %r8    # 0x145a0f950
140876a7e:     	movl	$0x59, %edx
140876a83:     	callq	0x1458e74d0 <.text+0x58e64d0>
140876a88:     	ud2
140876a8a:     	addq	$0x8, %rsi
140876a8e:     	leaq	0x5198f43(%rip), %rax   # 0x145a0f9d8
140876a95:     	movq	%rax, 0x28(%rsp)
140876a9a:     	movq	$0xdf, 0x20(%rsp)
140876aa3:     	leaq	0x5198ebe(%rip), %r9    # 0x145a0f968
140876aaa:     	leaq	0x40(%rsp), %r8
140876aaf:     	xorl	%ecx, %ecx
140876ab1:     	movq	%rsi, %rdx
140876ab4:     	callq	0x14589fabd <.text+0x589eabd>
140876ab9:     	ud2
140876abb:     	addq	$0x4, %rsi
140876abf:     	movq	%rsi, 0x40(%rsp)
140876ac4:     	leaq	0x47824e5(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140876acb:     	movq	%rax, 0x48(%rsp)
140876ad0:     	leaq	0x3f(%rsp), %rcx
140876ad5:     	movq	%rcx, 0x50(%rsp)
140876ada:     	movq	%rax, 0x58(%rsp)
140876adf:     	leaq	0x519877c(%rip), %rcx   # 0x145a0f262
140876ae6:     	leaq	0x5198893(%rip), %r8    # 0x145a0f380
140876aed:     	leaq	0x40(%rsp), %rdx
140876af2:     	callq	0x1458e7790 <.text+0x58e6790>
140876af7:     	ud2
140876af9:     	addq	$0x4, %rsi
140876afd:     	movq	%rsi, 0x40(%rsp)
140876b02:     	leaq	0x47824a7(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140876b09:     	movq	%rax, 0x48(%rsp)
140876b0e:     	leaq	0x3f(%rsp), %rcx
140876b13:     	movq	%rcx, 0x50(%rsp)
140876b18:     	movq	%rax, 0x58(%rsp)
140876b1d:     	leaq	0x519873e(%rip), %rcx   # 0x145a0f262
140876b24:     	leaq	0x51987d5(%rip), %r8    # 0x145a0f300
140876b2b:     	leaq	0x40(%rsp), %rdx
140876b30:     	callq	0x1458e7790 <.text+0x58e6790>
140876b35:     	ud2
