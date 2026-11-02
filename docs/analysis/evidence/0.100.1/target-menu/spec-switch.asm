
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14542e9f0:     	pushq	%rbp
14542e9f1:     	pushq	%r15
14542e9f3:     	pushq	%r14
14542e9f5:     	pushq	%r13
14542e9f7:     	pushq	%r12
14542e9f9:     	pushq	%rsi
14542e9fa:     	pushq	%rdi
14542e9fb:     	pushq	%rbx
14542e9fc:     	subq	$0xc8, %rsp
14542ea03:     	leaq	0x80(%rsp), %rbp
14542ea0b:     	movq	$-0x2, 0x40(%rbp)
14542ea13:     	movq	%r8, %rdi
14542ea16:     	movl	%edx, %ebx
14542ea18:     	movq	%rcx, %rsi
14542ea1b:     	movq	0x80(%rcx), %rax
14542ea22:     	movq	0x88(%rcx), %rcx
14542ea29:     	shlq	$0x4, %rcx
14542ea2d:     	leaq	(%rcx,%rcx,4), %rcx
14542ea31:     	xorl	%r15d, %r15d
14542ea34:     	xorl	%edx, %edx
14542ea36:     	nopw	%cs:(%rax,%rax)
14542ea40:     	cmpq	%rdx, %rcx
14542ea43:     	je	0x14542ea57 <.text+0x542da57>
14542ea45:     	leaq	0x50(%rdx), %r8
14542ea49:     	cmpb	%bl, (%rax,%rdx)
14542ea4c:     	movq	%r8, %rdx
14542ea4f:     	jne	0x14542ea40 <.text+0x542da40>
14542ea51:     	movzbl	-0x4f(%rax,%r8), %r15d
14542ea57:     	cmpq	$0x3, %rdi
14542ea5b:     	setb	%al
14542ea5e:     	cmpq	%r15, %rdi
14542ea61:     	setne	%r14b
14542ea65:     	andb	%al, %r14b
14542ea68:     	cmpb	$0x1, %r14b
14542ea6c:     	jne	0x14542edc6 <.text+0x542ddc6>
14542ea72:     	movq	0x68(%rsi), %rax
14542ea76:     	movq	0x70(%rsi), %rdx
14542ea7a:     	shlq	$0x5, %rdx
14542ea7e:     	xorl	%r13d, %r13d
14542ea81:     	xorl	%ecx, %ecx
14542ea83:     	movq	%rax, %r8
14542ea86:     	nopw	%cs:(%rax,%rax)
14542ea90:     	cmpq	%rcx, %rdx
14542ea93:     	je	0x14542eadf <.text+0x542dadf>
14542ea95:     	addq	$0x20, %rcx
14542ea99:     	cmpb	%bl, 0x4(%r8)
14542ea9d:     	leaq	0x20(%r8), %r8
14542eaa1:     	jne	0x14542ea90 <.text+0x542da90>
14542eaa3:     	movq	-0x8(%rax,%rcx), %r13
14542eaa8:     	movq	%r13, %r12
14542eaab:     	shlq	$0x4, %r12
14542eaaf:     	movq	%r13, %rdx
14542eab2:     	shrq	$0x3c, %rdx
14542eab6:     	setne	%dl
14542eab9:     	movabsq	$0x7ffffffffffffff8, %r8 # imm = 0x7FFFFFFFFFFFFFF8
14542eac3:     	cmpq	%r8, %r12
14542eac6:     	seta	%r8b
14542eaca:     	orb	%dl, %r8b
14542eacd:     	je	0x14542eaf2 <.text+0x542daf2>
14542eacf:     	xorl	%r13d, %r13d
14542ead2:     	movq	%r13, %rcx
14542ead5:     	movq	%r12, %rdx
14542ead8:     	callq	0x14590379b <.text+0x590279b>
14542eadd:     	ud2
14542eadf:     	movl	$0x8, %eax
14542eae4:     	movq	%rax, 0x20(%rbp)
14542eae8:     	movq	$0x0, 0x30(%rbp)
14542eaf0:     	jmp	0x14542eb5d <.text+0x542db5d>
14542eaf2:     	movq	-0x10(%rax,%rcx), %rdx
14542eaf7:     	testq	%r12, %r12
14542eafa:     	je	0x14542eb44 <.text+0x542db44>
14542eafc:     	movq	%rdx, 0x28(%rbp)
14542eb00:     	movq	%r13, 0x10(%rbp)
14542eb04:     	callq	0x140002200 <.text+0x1200>
14542eb09:     	movl	$0x8, %r13d
14542eb0f:     	movl	$0x8, %edx
14542eb14:     	movq	%r12, %rcx
14542eb17:     	callq	0x1400021c0 <.text+0x11c0>
14542eb1c:     	movq	%rax, 0x20(%rbp)
14542eb20:     	testq	%rax, %rax
14542eb23:     	je	0x14542ead2 <.text+0x542dad2>
14542eb25:     	movq	0x10(%rbp), %r13
14542eb29:     	movq	%r13, 0x30(%rbp)
14542eb2d:     	movq	0x28(%rbp), %rdx
14542eb31:     	testq	%r13, %r13
14542eb34:     	je	0x14542eb5a <.text+0x542db5a>
14542eb36:     	movq	0x20(%rbp), %rcx
14542eb3a:     	movq	%r12, %r8
14542eb3d:     	callq	0x1457731ed <.text+0x57721ed>
14542eb42:     	jmp	0x14542eb5d <.text+0x542db5d>
14542eb44:     	movl	$0x8, %eax
14542eb49:     	movq	%rax, 0x20(%rbp)
14542eb4d:     	movq	$0x0, 0x30(%rbp)
14542eb55:     	testq	%r13, %r13
14542eb58:     	jne	0x14542eb36 <.text+0x542db36>
14542eb5a:     	xorl	%r13d, %r13d
14542eb5d:     	movb	$0x1, 0x3d(%rbp)
14542eb61:     	leaq	-0x10(%rbp), %rcx
14542eb65:     	movq	%rsi, %rdx
14542eb68:     	movl	%ebx, %r8d
14542eb6b:     	movq	%rdi, %r9
14542eb6e:     	callq	0x14542e5c0 <.text+0x542d5c0>
14542eb73:     	nop
14542eb74:     	movq	0x80(%rsi), %rax
14542eb7b:     	movq	0x88(%rsi), %r12
14542eb82:     	testq	%r12, %r12
14542eb85:     	je	0x14542ebb6 <.text+0x542dbb6>
14542eb87:     	movq	%r12, %rcx
14542eb8a:     	shlq	$0x4, %rcx
14542eb8e:     	leaq	(%rcx,%rcx,4), %rdx
14542eb92:     	xorl	%ecx, %ecx
14542eb94:     	xorl	%r8d, %r8d
14542eb97:     	nopw	(%rax,%rax)
14542eba0:     	cmpb	%bl, (%rax,%r8)
14542eba4:     	je	0x14542eddd <.text+0x542dddd>
14542ebaa:     	incq	%rcx
14542ebad:     	addq	$0x50, %r8
14542ebb1:     	cmpq	%r8, %rdx
14542ebb4:     	jne	0x14542eba0 <.text+0x542dba0>
14542ebb6:     	leaq	0x78(%rsi), %rcx
14542ebba:     	xorps	%xmm0, %xmm0
14542ebbd:     	movups	%xmm0, -0x48(%rbp)
14542ebc1:     	movups	%xmm0, -0x30(%rbp)
14542ebc5:     	movb	%bl, -0x60(%rbp)
14542ebc8:     	movb	$0x0, -0x5f(%rbp)
14542ebcc:     	movq	$0x0, -0x58(%rbp)
14542ebd4:     	movq	$0x8, -0x50(%rbp)
14542ebdc:     	movq	$0x8, -0x38(%rbp)
14542ebe4:     	movq	$0x8, -0x20(%rbp)
14542ebec:     	movq	$0x0, -0x18(%rbp)
14542ebf4:     	cmpq	(%rcx), %r12
14542ebf7:     	jne	0x14542ec06 <.text+0x542dc06>
14542ebf9:     	callq	0x145780650 <.text+0x577f650>
14542ebfe:     	nop
14542ebff:     	movq	0x80(%rsi), %rax
14542ec06:     	leaq	(%r12,%r12,4), %rcx
14542ec0a:     	shlq	$0x4, %rcx
14542ec0e:     	movups	-0x20(%rbp), %xmm0
14542ec12:     	movups	%xmm0, 0x40(%rax,%rcx)
14542ec17:     	movups	-0x60(%rbp), %xmm0
14542ec1b:     	movups	-0x50(%rbp), %xmm1
14542ec1f:     	movups	-0x40(%rbp), %xmm2
14542ec23:     	movups	-0x30(%rbp), %xmm3
14542ec27:     	movups	%xmm3, 0x30(%rax,%rcx)
14542ec2c:     	movups	%xmm2, 0x20(%rax,%rcx)
14542ec31:     	movups	%xmm1, 0x10(%rax,%rcx)
14542ec36:     	movups	%xmm0, (%rax,%rcx)
14542ec3a:     	leaq	0x1(%r12), %rdx
14542ec3f:     	movq	%rdx, 0x88(%rsi)
14542ec46:     	cmpq	%rdx, %r12
14542ec49:     	jae	0x14542edec <.text+0x542ddec>
14542ec4f:     	movq	%rdi, 0x10(%rbp)
14542ec53:     	cmpl	$0x3, %r15d
14542ec57:     	jae	0x14542ee1d <.text+0x542de1d>
14542ec5d:     	leaq	(%r12,%r12,4), %rdi
14542ec61:     	shlq	$0x4, %rdi
14542ec65:     	movq	0x80(%rsi), %rax
14542ec6c:     	addq	%rdi, %rax
14542ec6f:     	leaq	(%r15,%r15,2), %rcx
14542ec73:     	leaq	(%rax,%rcx,8), %r15
14542ec77:     	addq	$0x8, %r15
14542ec7b:     	movq	0x8(%rax,%rcx,8), %rdx
14542ec80:     	testq	%rdx, %rdx
14542ec83:     	je	0x14542ec98 <.text+0x542dc98>
14542ec85:     	movq	0x8(%r15), %rcx
14542ec89:     	shlq	$0x4, %rdx
14542ec8d:     	movl	$0x8, %r8d
14542ec93:     	callq	0x1400021d0 <.text+0x11d0>
14542ec98:     	movq	0x30(%rbp), %rax
14542ec9c:     	movq	%rax, (%r15)
14542ec9f:     	movq	0x20(%rbp), %rax
14542eca3:     	movq	%rax, 0x8(%r15)
14542eca7:     	movq	%r13, 0x10(%r15)
14542ecab:     	movq	(%rbp), %r13
14542ecaf:     	movq	%r13, %r15
14542ecb2:     	shlq	$0x4, %r15
14542ecb6:     	movq	%r13, %rax
14542ecb9:     	shrq	$0x3c, %rax
14542ecbd:     	setne	%al
14542ecc0:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
14542ecca:     	cmpq	%rcx, %r15
14542eccd:     	seta	%cl
14542ecd0:     	orb	%al, %cl
14542ecd2:     	je	0x14542ecec <.text+0x542dcec>
14542ecd4:     	xorl	%ecx, %ecx
14542ecd6:     	movb	$0x1, 0x3f(%rbp)
14542ecda:     	movb	$0x0, 0x3e(%rbp)
14542ecde:     	movq	%r15, %rdx
14542ece1:     	callq	0x14590379b <.text+0x590279b>
14542ece6:     	nop
14542ece7:     	jmp	0x14542ee5e <.text+0x542de5e>
14542ecec:     	movq	-0x8(%rbp), %rdx
14542ecf0:     	testq	%r15, %r15
14542ecf3:     	je	0x14542edfe <.text+0x542ddfe>
14542ecf9:     	movq	%rdx, 0x8(%rbp)
14542ecfd:     	callq	0x140002200 <.text+0x1200>
14542ed02:     	movl	$0x8, %edx
14542ed07:     	movq	%r15, %rcx
14542ed0a:     	callq	0x1400021c0 <.text+0x11c0>
14542ed0f:     	movl	$0x8, %ecx
14542ed14:     	movq	%rax, 0x28(%rbp)
14542ed18:     	testq	%rax, %rax
14542ed1b:     	je	0x14542ecd6 <.text+0x542dcd6>
14542ed1d:     	movq	%r13, 0x18(%rbp)
14542ed21:     	movq	0x8(%rbp), %rdx
14542ed25:     	testq	%r13, %r13
14542ed28:     	je	0x14542ed36 <.text+0x542dd36>
14542ed2a:     	movq	0x28(%rbp), %rcx
14542ed2e:     	movq	%r15, %r8
14542ed31:     	callq	0x1457731ed <.text+0x57721ed>
14542ed36:     	movq	0x88(%rsi), %rdx
14542ed3d:     	cmpq	%rdx, %r12
14542ed40:     	jae	0x14542ee34 <.text+0x542de34>
14542ed46:     	movq	0x80(%rsi), %rax
14542ed4d:     	addq	%rdi, %rax
14542ed50:     	movq	0x10(%rbp), %rcx
14542ed54:     	leaq	(%rcx,%rcx,2), %rcx
14542ed58:     	leaq	(%rax,%rcx,8), %r15
14542ed5c:     	addq	$0x8, %r15
14542ed60:     	movq	0x8(%rax,%rcx,8), %rdx
14542ed65:     	testq	%rdx, %rdx
14542ed68:     	je	0x14542ed7d <.text+0x542dd7d>
14542ed6a:     	movq	0x8(%r15), %rcx
14542ed6e:     	shlq	$0x4, %rdx
14542ed72:     	movl	$0x8, %r8d
14542ed78:     	callq	0x1400021d0 <.text+0x11d0>
14542ed7d:     	movq	0x18(%rbp), %rax
14542ed81:     	movq	%rax, (%r15)
14542ed84:     	movq	0x28(%rbp), %rax
14542ed88:     	movq	%rax, 0x8(%r15)
14542ed8c:     	movq	%r13, 0x10(%r15)
14542ed90:     	movq	0x88(%rsi), %rdx
14542ed97:     	cmpq	%rdx, %r12
14542ed9a:     	jae	0x14542ee46 <.text+0x542de46>
14542eda0:     	movq	0x80(%rsi), %rax
14542eda7:     	movq	0x10(%rbp), %rcx
14542edab:     	movb	%cl, 0x1(%rax,%rdi)
14542edaf:     	movb	$0x0, 0x3f(%rbp)
14542edb3:     	movb	$0x0, 0x3e(%rbp)
14542edb7:     	leaq	-0x10(%rbp), %r8
14542edbb:     	movq	%rsi, %rcx
14542edbe:     	movl	%ebx, %edx
14542edc0:     	callq	0x145439e60 <.text+0x5438e60>
14542edc5:     	nop
14542edc6:     	movl	%r14d, %eax
14542edc9:     	addq	$0xc8, %rsp
14542edd0:     	popq	%rbx
14542edd1:     	popq	%rdi
14542edd2:     	popq	%rsi
14542edd3:     	popq	%r12
14542edd5:     	popq	%r13
14542edd7:     	popq	%r14
14542edd9:     	popq	%r15
14542eddb:     	popq	%rbp
14542eddc:     	retq
14542eddd:     	movq	%r12, %rdx
14542ede0:     	movq	%rcx, %r12
14542ede3:     	cmpq	%rdx, %r12
14542ede6:     	jb	0x14542ec4f <.text+0x542dc4f>
14542edec:     	leaq	0x130ea45(%rip), %r8    # 0x14673d838
14542edf3:     	movq	%r12, %rcx
14542edf6:     	callq	0x145903b33 <.text+0x5902b33>
14542edfb:     	nop
14542edfc:     	jmp	0x14542ee5e <.text+0x542de5e>
14542edfe:     	movl	$0x8, %eax
14542ee03:     	movq	%rax, 0x28(%rbp)
14542ee07:     	movq	$0x0, 0x18(%rbp)
14542ee0f:     	testq	%r13, %r13
14542ee12:     	jne	0x14542ed2a <.text+0x542dd2a>
14542ee18:     	jmp	0x14542ed36 <.text+0x542dd36>
14542ee1d:     	leaq	0x130ea2c(%rip), %r8    # 0x14673d850
14542ee24:     	movl	$0x3, %edx
14542ee29:     	movq	%r15, %rcx
14542ee2c:     	callq	0x145903b33 <.text+0x5902b33>
14542ee31:     	nop
14542ee32:     	jmp	0x14542ee5e <.text+0x542de5e>
14542ee34:     	leaq	0x130ea2d(%rip), %r8    # 0x14673d868
14542ee3b:     	movq	%r12, %rcx
14542ee3e:     	callq	0x145903b33 <.text+0x5902b33>
14542ee43:     	nop
14542ee44:     	jmp	0x14542ee5e <.text+0x542de5e>
14542ee46:     	movb	$0x1, 0x3f(%rbp)
14542ee4a:     	movb	$0x0, 0x3e(%rbp)
14542ee4e:     	leaq	0x130ea2b(%rip), %r8    # 0x14673d880
14542ee55:     	movq	%r12, %rcx
14542ee58:     	callq	0x145903b33 <.text+0x5902b33>
14542ee5d:     	nop
14542ee5e:     	ud2
