
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454569f0:     	pushq	%rbp
1454569f1:     	pushq	%r15
1454569f3:     	pushq	%r14
1454569f5:     	pushq	%rsi
1454569f6:     	pushq	%rdi
1454569f7:     	pushq	%rbx
1454569f8:     	subq	$0xd8, %rsp
1454569ff:     	leaq	0x80(%rsp), %rbp
145456a07:     	movq	$-0x2, 0x50(%rbp)
145456a0f:     	movq	%rcx, %rsi
145456a12:     	movq	%rdx, %rcx
145456a15:     	movq	%r8, %rdx
145456a18:     	callq	0x14010afd0 <.text+0x109fd0>
145456a1d:     	cmpq	$0x5, %rdx
145456a21:     	jb	0x145456a38 <.text+0x5455a38>
145456a23:     	movl	$0x31455352, %ecx       # imm = 0x31455352
145456a28:     	xorl	(%rax), %ecx
145456a2a:     	movzbl	0x4(%rax), %r8d
145456a2f:     	xorl	$0x3a, %r8d
145456a33:     	orl	%ecx, %r8d
145456a36:     	je	0x145456a52 <.text+0x5455a52>
145456a38:     	movq	$-0x1, (%rsi)
145456a3f:     	movq	%rsi, %rax
145456a42:     	addq	$0xd8, %rsp
145456a49:     	popq	%rbx
145456a4a:     	popq	%rdi
145456a4b:     	popq	%rsi
145456a4c:     	popq	%r14
145456a4e:     	popq	%r15
145456a50:     	popq	%rbp
145456a51:     	retq
145456a52:     	leaq	-0x2(%rdx), %r15
145456a56:     	shrq	$0x2, %r15
145456a5a:     	leaq	(%r15,%r15,2), %r14
145456a5e:     	movq	%r15, 0x40(%rbp)
145456a62:     	je	0x145456a90 <.text+0x5455a90>
145456a64:     	movq	%rdx, %rdi
145456a67:     	movq	%rax, %rbx
145456a6a:     	callq	0x140002200 <.text+0x1200>
145456a6f:     	movl	$0x1, %edx
145456a74:     	movq	%r14, %rcx
145456a77:     	callq	0x1400021f0 <.text+0x11f0>
145456a7c:     	testq	%rax, %rax
145456a7f:     	je	0x145456cdb <.text+0x5455cdb>
145456a85:     	movq	%rax, %r8
145456a88:     	movq	%rbx, %rax
145456a8b:     	movq	%rdi, %rdx
145456a8e:     	jmp	0x145456a96 <.text+0x5455a96>
145456a90:     	movl	$0x1, %r8d
145456a96:     	addq	$-0x5, %rdx
145456a9a:     	addq	$0x5, %rax
145456a9e:     	movl	%edx, %ecx
145456aa0:     	andl	$0x3, %ecx
145456aa3:     	movq	%r14, 0x38(%rsp)
145456aa8:     	movq	%r14, 0x28(%rbp)
145456aac:     	movq	%r14, 0x28(%rsp)
145456ab1:     	movq	%r8, 0x38(%rbp)
145456ab5:     	movq	%r8, 0x20(%rsp)
145456aba:     	movq	%rcx, 0x30(%rsp)
145456abf:     	leaq	0x145c349(%rip), %r8    # 0x1468b2e0f
145456ac6:     	leaq	-0x8(%rbp), %rcx
145456aca:     	movq	%rdx, %r9
145456acd:     	movq	%r8, %rdx
145456ad0:     	movq	%rax, %r8
145456ad3:     	callq	0x145504e60 <.text+0x5503e60>
145456ad8:     	nop
145456ad9:     	cmpl	$0x2, -0x8(%rbp)
145456add:     	jne	0x145456b0e <.text+0x5455b0e>
145456adf:     	cmpb	$-0x1, (%rbp)
145456ae3:     	movq	0x40(%rbp), %rax
145456ae7:     	leaq	(%rax,%rax,2), %rdx
145456aeb:     	je	0x145456cab <.text+0x5455cab>
145456af1:     	testq	%rax, %rax
145456af4:     	movq	0x38(%rbp), %rcx
145456af8:     	je	0x145456a38 <.text+0x5455a38>
145456afe:     	movl	$0x1, %r8d
145456b04:     	callq	0x1400021d0 <.text+0x11d0>
145456b09:     	jmp	0x145456a38 <.text+0x5455a38>
145456b0e:     	movq	0x8(%rbp), %r14
145456b12:     	movq	0x40(%rbp), %rbx
145456b16:     	leaq	(%rbx,%rbx,2), %rdx
145456b1a:     	cmpq	%rdx, %r14
145456b1d:     	cmovaeq	%rdx, %r14
145456b21:     	cmpq	$0x24, %r14
145456b25:     	jae	0x145456b40 <.text+0x5455b40>
145456b27:     	movq	$-0x1, (%rsi)
145456b2e:     	movq	0x38(%rbp), %rcx
145456b32:     	testq	%rbx, %rbx
145456b35:     	jne	0x145456c9b <.text+0x5455c9b>
145456b3b:     	jmp	0x145456a3f <.text+0x5455a3f>
145456b40:     	movq	0x38(%rbp), %rcx
145456b44:     	leaq	0x10(%rcx), %rdi
145456b48:     	addq	$-0x24, %r14
145456b4c:     	leaq	0x145c3ff(%rip), %rax   # 0x1468b2f52
145456b53:     	movq	%rax, -0x8(%rbp)
145456b57:     	movq	$0x3, (%rbp)
145456b5f:     	movq	%rcx, 0x8(%rbp)
145456b63:     	movq	$0x10, 0x10(%rbp)
145456b6b:     	movq	%rdi, 0x18(%rbp)
145456b6f:     	movq	%r14, 0x20(%rbp)
145456b73:     	leaq	-0x34(%rbp), %rcx
145456b77:     	leaq	-0x8(%rbp), %rdx
145456b7b:     	callq	0x145456320 <.text+0x5455320>
145456b80:     	nop
145456b81:     	movdqu	-0x34(%rbp), %xmm0
145456b86:     	movdqu	(%rdi,%r14), %xmm1
145456b8c:     	pcmpeqb	%xmm0, %xmm1
145456b90:     	movd	-0x24(%rbp), %xmm0
145456b95:     	movd	0x10(%rdi,%r14), %xmm2
145456b9c:     	pcmpeqb	%xmm0, %xmm2
145456ba0:     	pand	%xmm1, %xmm2
145456ba4:     	pmovmskb	%xmm2, %eax
145456ba8:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
145456bad:     	je	0x145456bcc <.text+0x5455bcc>
145456baf:     	movq	$-0x1, (%rsi)
145456bb6:     	leaq	(%rbx,%rbx,2), %rdx
145456bba:     	movq	0x38(%rbp), %rcx
145456bbe:     	testq	%rbx, %rbx
145456bc1:     	jne	0x145456c9b <.text+0x5455c9b>
145456bc7:     	jmp	0x145456a3f <.text+0x5455a3f>
145456bcc:     	testq	%r14, %r14
145456bcf:     	movq	0x38(%rbp), %rbx
145456bd3:     	je	0x145456c03 <.text+0x5455c03>
145456bd5:     	callq	0x140002200 <.text+0x1200>
145456bda:     	movl	$0x1, %edx
145456bdf:     	movq	%r14, %rcx
145456be2:     	callq	0x1400021c0 <.text+0x11c0>
145456be7:     	testq	%rax, %rax
145456bea:     	je	0x145456cea <.text+0x5455cea>
145456bf0:     	movq	%rax, %r15
145456bf3:     	movq	%rax, %rcx
145456bf6:     	movq	%rdi, %rdx
145456bf9:     	movq	%r14, %r8
145456bfc:     	callq	0x1457149fd <.text+0x57139fd>
145456c01:     	jmp	0x145456c09 <.text+0x5455c09>
145456c03:     	movl	$0x1, %r15d
145456c09:     	movq	%r15, 0x30(%rbp)
145456c0d:     	movb	$0x1, 0x4f(%rbp)
145456c11:     	movq	%rbx, %rcx
145456c14:     	movq	%r15, %rdx
145456c17:     	movq	%r14, %r8
145456c1a:     	movq	%r14, 0x40(%rbp)
145456c1e:     	callq	0x1454560a0 <.text+0x54550a0>
145456c23:     	nop
145456c24:     	leaq	-0x20(%rbp), %rcx
145456c28:     	movq	0x30(%rbp), %rdx
145456c2c:     	movq	0x40(%rbp), %r8
145456c30:     	callq	0x1456d27c0 <.text+0x56d17c0>
145456c35:     	nop
145456c36:     	cmpb	$0x0, -0x20(%rbp)
145456c3a:     	je	0x145456c6c <.text+0x5455c6c>
145456c3c:     	movdqu	-0x18(%rbp), %xmm0
145456c41:     	movdqu	%xmm0, 0x10(%rbp)
145456c46:     	movq	0x40(%rbp), %rax
145456c4a:     	movq	%rax, -0x8(%rbp)
145456c4e:     	movq	0x30(%rbp), %rcx
145456c52:     	movq	%rcx, (%rbp)
145456c56:     	movq	%rax, 0x8(%rbp)
145456c5a:     	movq	$-0x1, (%rsi)
145456c61:     	leaq	-0x8(%rbp), %rcx
145456c65:     	callq	0x1405aff00 <.text+0x5aef00>
145456c6a:     	jmp	0x145456c93 <.text+0x5455c93>
145456c6c:     	movq	0x40(%rbp), %rax
145456c70:     	movq	%rax, (%rbp)
145456c74:     	movq	0x30(%rbp), %rcx
145456c78:     	movq	%rcx, 0x8(%rbp)
145456c7c:     	movq	%rax, 0x10(%rbp)
145456c80:     	movq	%rax, 0x10(%rsi)
145456c84:     	movq	(%rbp), %rax
145456c88:     	movq	%rax, (%rsi)
145456c8b:     	movq	0x8(%rbp), %rax
145456c8f:     	movq	%rax, 0x8(%rsi)
145456c93:     	movq	0x28(%rbp), %rdx
145456c97:     	movq	0x38(%rbp), %rcx
145456c9b:     	movl	$0x1, %r8d
145456ca1:     	callq	0x1400021d0 <.text+0x11d0>
145456ca6:     	jmp	0x145456a3f <.text+0x5455a3f>
145456cab:     	leaq	0x145bd46(%rip), %rax   # 0x1468b29f8
145456cb2:     	movq	%rax, -0x20(%rbp)
145456cb6:     	leaq	-0x5454bfd(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145456cbd:     	movq	%rax, -0x18(%rbp)
145456cc1:     	leaq	0x145bd40(%rip), %rcx   # 0x1468b2a08
145456cc8:     	leaq	0x145bdd1(%rip), %r8    # 0x1468b2aa0
145456ccf:     	leaq	-0x20(%rbp), %rdx
145456cd3:     	callq	0x1458a4100 <.text+0x58a3100>
145456cd8:     	nop
145456cd9:     	jmp	0x145456cf8 <.text+0x5455cf8>
145456cdb:     	movl	$0x1, %ecx
145456ce0:     	movq	%r14, %rdx
145456ce3:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145456ce8:     	ud2
145456cea:     	movl	$0x1, %ecx
145456cef:     	movq	%r14, %rdx
145456cf2:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145456cf7:     	nop
145456cf8:     	ud2
