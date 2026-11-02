
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f9d10:     	pushq	%rbp
1401f9d11:     	pushq	%r15
1401f9d13:     	pushq	%r14
1401f9d15:     	pushq	%r13
1401f9d17:     	pushq	%r12
1401f9d19:     	pushq	%rsi
1401f9d1a:     	pushq	%rdi
1401f9d1b:     	pushq	%rbx
1401f9d1c:     	subq	$0x458, %rsp            # imm = 0x458
1401f9d23:     	leaq	0x80(%rsp), %rbp
1401f9d2b:     	movq	$-0x2, 0x3d0(%rbp)
1401f9d36:     	movq	%r8, %rax
1401f9d39:     	movq	%rdx, 0x370(%rbp)
1401f9d40:     	movq	%rcx, 0x378(%rbp)
1401f9d47:     	movq	$0x0, 0x3a0(%rbp)
1401f9d52:     	movq	$0x8, 0x3a8(%rbp)
1401f9d5d:     	movq	$0x0, 0x3b0(%rbp)
1401f9d68:     	addq	%r9, %r8
1401f9d6b:     	movb	$0x1, 0x3ce(%rbp)
1401f9d72:     	leaq	0x380(%rbp), %rcx
1401f9d79:     	movq	%rax, %rdx
1401f9d7c:     	callq	0x1401accf0 <.text+0x1abcf0>
1401f9d81:     	nop
1401f9d82:     	movq	0x390(%rbp), %rbx
1401f9d89:     	testq	%rbx, %rbx
1401f9d8c:     	je	0x1401fa053 <.text+0x1f9053>
1401f9d92:     	movq	0x388(%rbp), %rdi
1401f9d99:     	xorl	%ecx, %ecx
1401f9d9b:     	leaq	0x160(%rbp), %r14
1401f9da2:     	jmp	0x1401f9df8 <.text+0x1f8df8>
1401f9da4:     	nopw	%cs:(%rax,%rax)
1401f9db0:     	xorl	%r15d, %r15d
1401f9db3:     	movq	0x3a8(%rbp), %rax
1401f9dba:     	movq	%r13, %rcx
1401f9dbd:     	shlq	$0x5, %rcx
1401f9dc1:     	movq	0x3c0(%rbp), %rdx
1401f9dc8:     	movq	%rdx, (%rax,%rcx)
1401f9dcc:     	movq	0x3b8(%rbp), %rdx
1401f9dd3:     	movq	%rdx, 0x8(%rax,%rcx)
1401f9dd8:     	movq	%rsi, 0x10(%rax,%rcx)
1401f9ddd:     	movb	%r15b, 0x18(%rax,%rcx)
1401f9de2:     	incq	%r13
1401f9de5:     	movq	%r13, 0x3b0(%rbp)
1401f9dec:     	movq	%r12, %rcx
1401f9def:     	cmpq	%rbx, %r12
1401f9df2:     	jae	0x1401fa053 <.text+0x1f9053>
1401f9df8:     	leaq	(%rdi,%rcx,4), %r13
1401f9dfc:     	movl	(%rdi,%rcx,4), %eax
1401f9dff:     	cmpl	$0x2b, %eax
1401f9e02:     	je	0x1401f9e09 <.text+0x1f8e09>
1401f9e04:     	cmpl	$0x2d, %eax
1401f9e07:     	jne	0x1401f9e40 <.text+0x1f8e40>
1401f9e09:     	leaq	0x1(%rcx), %rax
1401f9e0d:     	movq	%rcx, %r12
1401f9e10:     	cmpq	%rbx, %rax
1401f9e13:     	jae	0x1401f9e68 <.text+0x1f8e68>
1401f9e15:     	movl	0x4(%rdi,%rcx,4), %edx
1401f9e19:     	addl	$-0x30, %edx
1401f9e1c:     	movq	%rcx, %r12
1401f9e1f:     	cmpl	$0x9, %edx
1401f9e22:     	ja	0x1401f9e68 <.text+0x1f8e68>
1401f9e24:     	movq	%rcx, %rdx
1401f9e27:     	movq	%rax, %r12
1401f9e2a:     	cmpq	%rbx, %rax
1401f9e2d:     	jb	0x1401f9eac <.text+0x1f8eac>
1401f9e2f:     	jmp	0x1401f9f72 <.text+0x1f8f72>
1401f9e34:     	nopw	%cs:(%rax,%rax)
1401f9e40:     	addl	$-0x30, %eax
1401f9e43:     	movq	%rcx, %r12
1401f9e46:     	cmpl	$0x9, %eax
1401f9e49:     	ja	0x1401f9e68 <.text+0x1f8e68>
1401f9e4b:     	leaq	0x1(%rcx), %rax
1401f9e4f:     	movq	%rcx, %rdx
1401f9e52:     	movq	%rax, %r12
1401f9e55:     	cmpq	%rbx, %rax
1401f9e58:     	jb	0x1401f9eac <.text+0x1f8eac>
1401f9e5a:     	jmp	0x1401f9f72 <.text+0x1f8f72>
1401f9e5f:     	nop
1401f9e60:     	movq	%rax, %r12
1401f9e63:     	cmpq	%rax, %rbx
1401f9e66:     	je	0x1401f9ed0 <.text+0x1f8ed0>
1401f9e68:     	movl	(%rdi,%r12,4), %edx
1401f9e6c:     	leal	-0x30(%rdx), %eax
1401f9e6f:     	cmpl	$0xa, %eax
1401f9e72:     	jb	0x1401f9ed3 <.text+0x1f8ed3>
1401f9e74:     	leaq	0x1(%r12), %rax
1401f9e79:     	cmpl	$0x2d, %edx
1401f9e7c:     	je	0x1401f9e83 <.text+0x1f8e83>
1401f9e7e:     	cmpl	$0x2b, %edx
1401f9e81:     	jne	0x1401f9e60 <.text+0x1f8e60>
1401f9e83:     	cmpq	%rbx, %rax
1401f9e86:     	jae	0x1401f9e60 <.text+0x1f8e60>
1401f9e88:     	movl	(%rdi,%rax,4), %edx
1401f9e8b:     	addl	$-0x30, %edx
1401f9e8e:     	cmpl	$0xa, %edx
1401f9e91:     	jae	0x1401f9e60 <.text+0x1f8e60>
1401f9e93:     	jmp	0x1401f9ed3 <.text+0x1f8ed3>
1401f9e95:     	nopw	%cs:(%rax,%rax)
1401f9ea0:     	incq	%r12
1401f9ea3:     	cmpq	%r12, %rbx
1401f9ea6:     	je	0x1401f9f6b <.text+0x1f8f6b>
1401f9eac:     	movl	(%rdi,%r12,4), %eax
1401f9eb0:     	leal	-0x30(%rax), %edx
1401f9eb3:     	cmpl	$0x9, %edx
1401f9eb6:     	jbe	0x1401f9ea0 <.text+0x1f8ea0>
1401f9eb8:     	cmpl	$0x25, %eax
1401f9ebb:     	je	0x1401f9ea0 <.text+0x1f8ea0>
1401f9ebd:     	cmpl	$0x2e, %eax
1401f9ec0:     	je	0x1401f9ea0 <.text+0x1f8ea0>
1401f9ec2:     	leaq	-0x1(%r12), %rdx
1401f9ec7:     	jmp	0x1401f9f72 <.text+0x1f8f72>
1401f9ecc:     	nopl	(%rax)
1401f9ed0:     	movq	%rbx, %r12
1401f9ed3:     	cmpq	%rcx, %r12
1401f9ed6:     	jb	0x1401fa241 <.text+0x1f9241>
1401f9edc:     	cmpq	%rbx, %r12
1401f9edf:     	ja	0x1401fa241 <.text+0x1f9241>
1401f9ee5:     	movq	$0x0, 0x160(%rbp)
1401f9ef0:     	movq	$0x1, 0x168(%rbp)
1401f9efb:     	movq	$0x0, 0x170(%rbp)
1401f9f06:     	movq	%r12, %r8
1401f9f09:     	subq	%rcx, %r8
1401f9f0c:     	jne	0x1401fa015 <.text+0x1f9015>
1401f9f12:     	leaq	(%rdi,%r12,4), %rdx
1401f9f16:     	movq	%r13, %rcx
1401f9f19:     	movq	%r14, %r8
1401f9f1c:     	callq	0x140236b10 <.text+0x235b10>
1401f9f21:     	nop
1401f9f22:     	movq	0x160(%rbp), %rax
1401f9f29:     	movq	%rax, 0x3c0(%rbp)
1401f9f30:     	movq	0x168(%rbp), %rax
1401f9f37:     	movq	%rax, 0x3b8(%rbp)
1401f9f3e:     	movq	0x170(%rbp), %rsi
1401f9f45:     	movq	0x3b0(%rbp), %r13
1401f9f4c:     	cmpq	0x3a0(%rbp), %r13
1401f9f53:     	jne	0x1401f9db0 <.text+0x1f8db0>
1401f9f59:     	leaq	0x3a0(%rbp), %rcx
1401f9f60:     	callq	0x145774710 <.text+0x5773710>
1401f9f65:     	nop
1401f9f66:     	jmp	0x1401f9db0 <.text+0x1f8db0>
1401f9f6b:     	leaq	-0x1(%rbx), %rdx
1401f9f6f:     	movq	%rbx, %r12
1401f9f72:     	cmpq	%rbx, %rdx
1401f9f75:     	jae	0x1401fa25d <.text+0x1f925d>
1401f9f7b:     	movq	%r12, %r8
1401f9f7e:     	subq	%rcx, %r8
1401f9f81:     	jb	0x1401fa25d <.text+0x1f925d>
1401f9f87:     	shlq	$0x2, %rcx
1401f9f8b:     	leaq	(,%r12,4), %rax
1401f9f93:     	movq	$0x0, 0x160(%rbp)
1401f9f9e:     	movq	$0x1, 0x168(%rbp)
1401f9fa9:     	movq	$0x0, 0x170(%rbp)
1401f9fb4:     	cmpq	%rcx, %rax
1401f9fb7:     	jne	0x1401fa034 <.text+0x1f9034>
1401f9fb9:     	leaq	(%rdi,%r12,4), %rdx
1401f9fbd:     	movq	%r13, %rcx
1401f9fc0:     	movq	%r14, %r8
1401f9fc3:     	callq	0x140236b10 <.text+0x235b10>
1401f9fc8:     	nop
1401f9fc9:     	movq	0x160(%rbp), %rax
1401f9fd0:     	movq	%rax, 0x3c0(%rbp)
1401f9fd7:     	movq	0x168(%rbp), %rax
1401f9fde:     	movq	%rax, 0x3b8(%rbp)
1401f9fe5:     	movq	0x170(%rbp), %rsi
1401f9fec:     	movq	0x3b0(%rbp), %r13
1401f9ff3:     	movb	$0x1, %r15b
1401f9ff6:     	cmpq	0x3a0(%rbp), %r13
1401f9ffd:     	jne	0x1401f9db3 <.text+0x1f8db3>
1401fa003:     	leaq	0x3a0(%rbp), %rcx
1401fa00a:     	callq	0x145774710 <.text+0x5773710>
1401fa00f:     	nop
1401fa010:     	jmp	0x1401f9db3 <.text+0x1f8db3>
1401fa015:     	movq	$0x1, 0x20(%rsp)
1401fa01e:     	movl	$0x1, %r9d
1401fa024:     	movq	%r14, %rcx
1401fa027:     	xorl	%edx, %edx
1401fa029:     	callq	0x1457744b0 <.text+0x57734b0>
1401fa02e:     	nop
1401fa02f:     	jmp	0x1401f9f12 <.text+0x1f8f12>
1401fa034:     	movq	$0x1, 0x20(%rsp)
1401fa03d:     	movl	$0x1, %r9d
1401fa043:     	movq	%r14, %rcx
1401fa046:     	xorl	%edx, %edx
1401fa048:     	callq	0x1457744b0 <.text+0x57734b0>
1401fa04d:     	nop
1401fa04e:     	jmp	0x1401f9fb9 <.text+0x1f8fb9>
1401fa053:     	movq	0x370(%rbp), %rdi
1401fa05a:     	cmpb	$0x1, (%rdi)
1401fa05d:     	jne	0x1401fa07d <.text+0x1f907d>
1401fa05f:     	movl	0x1(%rdi), %eax
1401fa062:     	movl	0x4(%rdi), %ecx
1401fa065:     	movl	%ecx, 0x39b(%rbp)
1401fa06b:     	movl	%eax, 0x398(%rbp)
1401fa071:     	movq	0x8(%rdi), %rax
1401fa075:     	movzbl	0x10(%rdi), %ecx
1401fa079:     	movb	$0x1, %dl
1401fa07b:     	jmp	0x1401fa08d <.text+0x1f908d>
1401fa07d:     	movq	0x8(%rdi), %rax
1401fa081:     	lock
1401fa082:     	incq	(%rax)
1401fa085:     	jle	0x1401fa277 <.text+0x1f9277>
1401fa08b:     	xorl	%edx, %edx
1401fa08d:     	movups	0x5752ac0(%rip), %xmm0  # 0x14594cb54
1401fa094:     	movups	%xmm0, -0x55(%rbp)
1401fa098:     	movl	$0x3f800000, -0x45(%rbp) # imm = 0x3F800000
1401fa09f:     	movq	$0x0, 0x168(%rbp)
1401fa0aa:     	movq	$0x1, 0x170(%rbp)
1401fa0b5:     	xorps	%xmm0, %xmm0
1401fa0b8:     	movups	%xmm0, 0x178(%rbp)
1401fa0bf:     	movq	$0x4, 0x188(%rbp)
1401fa0ca:     	movq	$0x0, 0x190(%rbp)
1401fa0d5:     	movb	%dl, 0x198(%rbp)
1401fa0db:     	movl	0x398(%rbp), %edx
1401fa0e1:     	movl	0x39b(%rbp), %r8d
1401fa0e8:     	movl	%edx, 0x199(%rbp)
1401fa0ee:     	movl	%r8d, 0x19c(%rbp)
1401fa0f5:     	movq	%rax, 0x1a0(%rbp)
1401fa0fc:     	movq	%rcx, 0x1a8(%rbp)
1401fa103:     	movl	$0x41700000, 0x1b0(%rbp) # imm = 0x41700000
1401fa10d:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
1401fa116:     	movb	$0x1, 0x1b6(%rbp)
1401fa11d:     	movups	-0x56(%rbp), %xmm0
1401fa121:     	movups	%xmm0, 0x1b7(%rbp)
1401fa128:     	movq	-0x49(%rbp), %rax
1401fa12c:     	movq	%rax, 0x1c4(%rbp)
1401fa133:     	movl	0x571f047(%rip), %eax   # 0x145919180
1401fa139:     	movl	%eax, 0x1dc(%rbp)
1401fa13f:     	movups	0x571f02a(%rip), %xmm0  # 0x145919170
1401fa146:     	movups	%xmm0, 0x1cc(%rbp)
1401fa14d:     	movsd	0x571b67b(%rip), %xmm0  # 0x1459157d0
1401fa155:     	movsd	%xmm0, 0x1e0(%rbp)
1401fa15d:     	leaq	-0x50(%rbp), %rcx
1401fa161:     	leaq	0x5751e38(%rip), %rdx   # 0x14594bfa0
1401fa168:     	movl	$0x180, %r8d            # imm = 0x180
1401fa16e:     	callq	0x1457731ed <.text+0x57721ed>
1401fa173:     	movq	0x378(%rbp), %rbx
1401fa17a:     	movq	(%rbx), %rsi
1401fa17d:     	addq	$0x8, %rbx
1401fa181:     	movw	$0x1, 0x1e8(%rbp)
1401fa18a:     	leaq	0x1ea(%rbp), %rcx
1401fa191:     	leaq	-0x56(%rbp), %rdx
1401fa195:     	movl	$0x186, %r8d            # imm = 0x186
1401fa19b:     	callq	0x1457731ed <.text+0x57721ed>
1401fa1a0:     	movq	%rsi, 0x160(%rbp)
1401fa1a7:     	movb	$0x1, 0x3cf(%rbp)
1401fa1ae:     	leaq	0x5751a33(%rip), %r9    # 0x14594bbe8
1401fa1b5:     	leaq	0x130(%rbp), %rcx
1401fa1bc:     	leaq	0x160(%rbp), %r8
1401fa1c3:     	movq	%rbx, %rdx
1401fa1c6:     	callq	0x1400ec120 <.text+0xeb120>
1401fa1cb:     	nop
1401fa1cc:     	movq	0x3b0(%rbp), %rax
1401fa1d3:     	movq	%rax, 0x170(%rbp)
1401fa1da:     	movups	0x3a0(%rbp), %xmm0
1401fa1e1:     	movaps	%xmm0, 0x160(%rbp)
1401fa1e8:     	movq	%rdi, 0x178(%rbp)
1401fa1ef:     	movb	$0x0, 0x3cf(%rbp)
1401fa1f6:     	leaq	0x130(%rbp), %rcx
1401fa1fd:     	leaq	0x160(%rbp), %rdx
1401fa204:     	callq	0x140113ee0 <.text+0x112ee0>
1401fa209:     	nop
1401fa20a:     	movq	0x380(%rbp), %rdx
1401fa211:     	testq	%rdx, %rdx
1401fa214:     	je	0x1401fa22d <.text+0x1f922d>
1401fa216:     	movq	0x388(%rbp), %rcx
1401fa21d:     	shlq	$0x2, %rdx
1401fa221:     	movl	$0x4, %r8d
1401fa227:     	callq	0x1400021d0 <.text+0x11d0>
1401fa22c:     	nop
1401fa22d:     	addq	$0x458, %rsp            # imm = 0x458
1401fa234:     	popq	%rbx
1401fa235:     	popq	%rdi
1401fa236:     	popq	%rsi
1401fa237:     	popq	%r12
1401fa239:     	popq	%r13
1401fa23b:     	popq	%r14
1401fa23d:     	popq	%r15
1401fa23f:     	popq	%rbp
1401fa240:     	retq
1401fa241:     	movb	$0x1, 0x3cf(%rbp)
1401fa248:     	leaq	0x5752919(%rip), %r9    # 0x14594cb68
1401fa24f:     	movq	%r12, %rdx
1401fa252:     	movq	%rbx, %r8
1401fa255:     	callq	0x145903d40 <.text+0x5902d40>
1401fa25a:     	nop
1401fa25b:     	jmp	0x1401fa277 <.text+0x1f9277>
1401fa25d:     	movb	$0x1, 0x3cf(%rbp)
1401fa264:     	leaq	0x5752915(%rip), %r9    # 0x14594cb80
1401fa26b:     	movq	%r12, %rdx
1401fa26e:     	movq	%rbx, %r8
1401fa271:     	callq	0x145903d40 <.text+0x5902d40>
1401fa276:     	nop
1401fa277:     	ud2
