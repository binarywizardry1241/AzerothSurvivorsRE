Disassembly of section .text:

0000000140001000 <.text>:
1411cbb80:     	movb	$0x1, 0x1c4(%rbp)
1411cbb87:     	leaq	-0x48(%rbp), %rcx
1411cbb8b:     	callq	0x1411cf500 <.text+0x11ce500>
1411cbb90:     	nop
1411cbb91:     	movq	-0x20(%rbp), %rcx
1411cbb95:     	movq	0x170(%rbp), %rax
1411cbb9c:     	cmpq	%rcx, %rax
1411cbb9f:     	cmovbq	%rax, %rcx
1411cbba3:     	movq	%rcx, 0x1b8(%rbp)
1411cbbaa:     	movq	-0x28(%rbp), %r14
1411cbbae:     	movq	-0x40(%rbp), %rax
1411cbbb2:     	movq	-0x38(%rbp), %rcx
1411cbbb6:     	movq	%rcx, 0x78(%rbp)
1411cbbba:     	shlq	$0x5, %rcx
1411cbbbe:     	movq	%rax, 0x160(%rbp)
1411cbbc5:     	movq	%rcx, -0x10(%rbp)
1411cbbc9:     	addq	%rcx, %rax
1411cbbcc:     	movq	%rax, 0x178(%rbp)
1411cbbd3:     	xorl	%esi, %esi
1411cbbd5:     	jmp	0x1411cbbf1 <.text+0x11cabf1>
1411cbbd7:     	nopw	(%rax,%rax)
1411cbbe0:     	movzbl	0x18(%rbx), %eax
1411cbbe4:     	movb	%al, 0x12e(%rdi)
1411cbbea:     	movq	0x98(%rbp), %rbx
1411cbbf1:     	cmpq	0x1b8(%rbp), %rsi
1411cbbf8:     	setb	0x1b7(%rbp)
1411cbbff:     	jae	0x1411cbd5f <.text+0x11cad5f>
1411cbc05:     	imulq	$0x138, %rsi, %rdi      # imm = 0x138
1411cbc0c:     	imulq	$0x68, %rsi, %rax
1411cbc10:     	movq	0x8(%r14,%rdi), %r15
1411cbc15:     	movq	0x10(%r14,%rdi), %r12
1411cbc1a:     	leaq	(%rax,%r13), %rcx
1411cbc1e:     	addq	$0x18, %rcx
1411cbc22:     	callq	0x145258960 <.text+0x5257960>
1411cbc27:     	nop
1411cbc28:     	movq	0x40(%rbp), %rcx
1411cbc2c:     	movq	%rcx, 0x28(%rsp)
1411cbc31:     	movq	0x188(%rbp), %rcx
1411cbc38:     	movq	%rcx, 0x20(%rsp)
1411cbc3d:     	leaq	-0x8(%rbp), %rcx
1411cbc41:     	movq	%r15, %rdx
1411cbc44:     	movq	%r12, %r8
1411cbc47:     	movl	%eax, %r9d
1411cbc4a:     	callq	0x145121180 <.text+0x5120180>
1411cbc4f:     	nop
1411cbc50:     	incq	%rsi
1411cbc53:     	addq	%r14, %rdi
1411cbc56:     	movb	%al, 0x12e(%rdi)
1411cbc5c:     	cmpq	$0x0, 0x78(%rbp)
1411cbc61:     	je	0x1411cbbf1 <.text+0x11cabf1>
1411cbc63:     	movq	0x8(%rdi), %r12
1411cbc67:     	movq	0x10(%rdi), %r15
1411cbc6b:     	movq	0x160(%rbp), %rbx
1411cbc72:     	cmpq	$0xf, %r15
1411cbc76:     	jbe	0x1411cbcdd <.text+0x11cacdd>
1411cbc78:     	movq	-0x10(%rbp), %r13
1411cbc7c:     	movq	0x160(%rbp), %rbx
1411cbc83:     	jmp	0x1411cbc9e <.text+0x11cac9e>
1411cbc85:     	nopw	%cs:(%rax,%rax)
1411cbc90:     	addq	$0x20, %rbx
1411cbc94:     	addq	$-0x20, %r13
1411cbc98:     	je	0x1411cbd40 <.text+0x11cad40>
1411cbc9e:     	cmpq	%r15, 0x10(%rbx)
1411cbca2:     	jne	0x1411cbc90 <.text+0x11cac90>
1411cbca4:     	movq	0x8(%rbx), %rcx
1411cbca8:     	movq	%r15, %rdx
1411cbcab:     	movq	%r12, %r8
1411cbcae:     	movq	%r15, %r9
1411cbcb1:     	callq	0x140002210 <.text+0x1210>
1411cbcb6:     	testb	%al, %al
1411cbcb8:     	je	0x1411cbc90 <.text+0x11cac90>
1411cbcba:     	movq	0x168(%rbp), %r13
1411cbcc1:     	jmp	0x1411cbbe0 <.text+0x11cabe0>
1411cbcc6:     	nopw	%cs:(%rax,%rax)
1411cbcd0:     	addq	$0x20, %rbx
1411cbcd4:     	cmpq	0x178(%rbp), %rbx
1411cbcdb:     	je	0x1411cbd53 <.text+0x11cad53>
1411cbcdd:     	cmpq	%r15, 0x10(%rbx)
1411cbce1:     	jne	0x1411cbcd0 <.text+0x11cacd0>
1411cbce3:     	movq	0x8(%rbx), %rax
1411cbce7:     	xorl	%ecx, %ecx
1411cbce9:     	nopl	(%rax)
1411cbcf0:     	cmpq	%rcx, %r15
1411cbcf3:     	je	0x1411cbbe0 <.text+0x11cabe0>
1411cbcf9:     	movzbl	(%rax,%rcx), %edx
1411cbcfd:     	leal	-0x41(%rdx), %r8d
1411cbd01:     	cmpb	$0x1a, %r8b
1411cbd05:     	setb	%r8b
1411cbd09:     	shlb	$0x5, %r8b
1411cbd0d:     	orb	%dl, %r8b
1411cbd10:     	movzbl	(%r12,%rcx), %edx
1411cbd15:     	leal	-0x41(%rdx), %r9d
1411cbd19:     	cmpb	$0x1a, %r9b
1411cbd1d:     	setb	%r9b
1411cbd21:     	shlb	$0x5, %r9b
1411cbd25:     	orb	%dl, %r9b
1411cbd28:     	incq	%rcx
1411cbd2b:     	cmpb	%r9b, %r8b
1411cbd2e:     	je	0x1411cbcf0 <.text+0x11cacf0>
1411cbd30:     	jmp	0x1411cbcd0 <.text+0x11cacd0>
1411cbd32:     	nopw	%cs:(%rax,%rax)
1411cbd40:     	movq	0x168(%rbp), %r13
1411cbd47:     	movq	0x98(%rbp), %rbx
1411cbd4e:     	jmp	0x1411cbbf1 <.text+0x11cabf1>
1411cbd53:     	movq	0x98(%rbp), %rbx
1411cbd5a:     	jmp	0x1411cbbf1 <.text+0x11cabf1>
