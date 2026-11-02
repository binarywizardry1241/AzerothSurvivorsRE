
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14568ed20:     	pushq	%rbp
14568ed21:     	pushq	%r15
14568ed23:     	pushq	%r14
14568ed25:     	pushq	%r13
14568ed27:     	pushq	%r12
14568ed29:     	pushq	%rsi
14568ed2a:     	pushq	%rdi
14568ed2b:     	pushq	%rbx
14568ed2c:     	subq	$0x1b8, %rsp            # imm = 0x1B8
14568ed33:     	leaq	0x80(%rsp), %rbp
14568ed3b:     	movaps	%xmm7, 0x120(%rbp)
14568ed42:     	movaps	%xmm6, 0x110(%rbp)
14568ed49:     	movq	$-0x2, 0x108(%rbp)
14568ed54:     	movq	%rcx, %rdi
14568ed57:     	movl	0x1b0(%rbp), %esi
14568ed5d:     	movss	0x1a8(%rbp), %xmm6
14568ed65:     	movss	0x1a0(%rbp), %xmm7
14568ed6d:     	movq	%r8, 0x48(%rbp)
14568ed71:     	movq	%r9, 0x50(%rbp)
14568ed75:     	leaq	0x78(%rbp), %rcx
14568ed79:     	movq	%rdx, 0x68(%rbp)
14568ed7d:     	movq	%r8, 0x60(%rbp)
14568ed81:     	movq	%r9, 0x58(%rbp)
14568ed85:     	callq	0x14568f440 <.text+0x568e440>
14568ed8a:     	movq	0x78(%rbp), %rax
14568ed8e:     	movq	0x80(%rbp), %rcx
14568ed95:     	cmpq	$-0x1, %rax
14568ed99:     	je	0x14568f08a <.text+0x568e08a>
14568ed9f:     	movq	%rdi, 0x100(%rbp)
14568eda6:     	movups	0x88(%rbp), %xmm0
14568edad:     	movups	0x98(%rbp), %xmm1
14568edb4:     	movups	0xa8(%rbp), %xmm2
14568edbb:     	movups	0xb8(%rbp), %xmm3
14568edc2:     	movups	%xmm3, -0x10(%rbp)
14568edc6:     	movups	%xmm2, -0x20(%rbp)
14568edca:     	movups	%xmm1, -0x30(%rbp)
14568edce:     	movups	%xmm0, -0x40(%rbp)
14568edd2:     	movq	%rax, 0x70(%rbp)
14568edd6:     	movq	%rax, -0x50(%rbp)
14568edda:     	movq	%rcx, 0xc8(%rbp)
14568ede1:     	movq	%rcx, -0x48(%rbp)
14568ede5:     	movaps	%xmm7, %xmm0
14568ede8:     	movaps	%xmm6, %xmm1
14568edeb:     	callq	0x1456d9a10 <.text+0x56d8a10>
14568edf0:     	movl	%edx, 0xd8(%rbp)
14568edf6:     	movl	%eax, %r13d
14568edf9:     	movq	$0x0, 0xe0(%rbp)
14568ee04:     	movq	$0x8, 0xe8(%rbp)
14568ee0f:     	movq	$0x0, 0xf0(%rbp)
14568ee1a:     	movl	%esi, %r14d
14568ee1d:     	negl	%r14d
14568ee20:     	movq	-0x40(%rbp), %rax
14568ee24:     	movq	%rax, 0xd0(%rbp)
14568ee2b:     	xorl	%eax, %eax
14568ee2d:     	movl	%r14d, 0xdc(%rbp)
14568ee34:     	jmp	0x14568ee4d <.text+0x568de4d>
14568ee36:     	nopw	%cs:(%rax,%rax)
14568ee40:     	movl	0xfc(%rbp), %r14d
14568ee47:     	movl	0xf8(%rbp), %eax
14568ee4d:     	testb	$0x1, %al
14568ee4f:     	jne	0x14568f014 <.text+0x568e014>
14568ee55:     	cmpl	%esi, %r14d
14568ee58:     	jg	0x14568f014 <.text+0x568e014>
14568ee5e:     	setge	%al
14568ee61:     	movl	%eax, 0xf8(%rbp)
14568ee67:     	setl	%al
14568ee6a:     	movzbl	%al, %eax
14568ee6d:     	addl	%r14d, %eax
14568ee70:     	movl	%eax, 0xfc(%rbp)
14568ee76:     	addl	0xd8(%rbp), %r14d
14568ee7d:     	movl	%r14d, %r12d
14568ee80:     	shll	$0x6, %r12d
14568ee84:     	xorl	%r15d, %r15d
14568ee87:     	movl	0xdc(%rbp), %eax
14568ee8d:     	jmp	0x14568ee9b <.text+0x568de9b>
14568ee8f:     	leaq	0x8(%rbp), %rcx
14568ee93:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
14568ee98:     	nop
14568ee99:     	movl	%ebx, %eax
14568ee9b:     	testb	$0x1, %r15b
14568ee9f:     	jne	0x14568ee40 <.text+0x568de40>
14568eea1:     	cmpl	%esi, %eax
14568eea3:     	jg	0x14568ee40 <.text+0x568de40>
14568eea5:     	setge	%r15b
14568eea9:     	setl	%cl
14568eeac:     	movzbl	%cl, %ebx
14568eeaf:     	addl	%eax, %ebx
14568eeb1:     	movl	%eax, %edi
14568eeb3:     	addl	%r13d, %edi
14568eeb6:     	movl	%ebx, %eax
14568eeb8:     	cmpl	$0x3f, %edi
14568eebb:     	ja	0x14568ee9b <.text+0x568de9b>
14568eebd:     	movl	%ebx, %eax
14568eebf:     	cmpl	$0x3f, %r14d
14568eec3:     	ja	0x14568ee9b <.text+0x568de9b>
14568eec5:     	movl	%edi, %ecx
14568eec7:     	orl	%r12d, %ecx
14568eeca:     	cmpq	%rcx, 0xd0(%rbp)
14568eed1:     	jbe	0x14568f15b <.text+0x568e15b>
14568eed7:     	movq	0xc8(%rbp), %rax
14568eede:     	cmpb	$0x0, (%rax,%rcx)
14568eee2:     	movl	%ebx, %eax
14568eee4:     	je	0x14568ee9b <.text+0x568de9b>
14568eee6:     	movl	%r14d, 0x28(%rsp)
14568eeeb:     	movl	%edi, 0x20(%rsp)
14568eeef:     	movq	%rbp, %rcx
14568eef2:     	movq	0x68(%rbp), %rdx
14568eef6:     	movq	0x60(%rbp), %r8
14568eefa:     	movq	0x58(%rbp), %r9
14568eefe:     	callq	0x14568be90 <.text+0x568ae90>
14568ef03:     	nop
14568ef04:     	cmpq	$-0x1, (%rbp)
14568ef09:     	je	0x14568ee8f <.text+0x568de8f>
14568ef0b:     	movq	0x40(%rbp), %rax
14568ef0f:     	leaq	0x80(%rbp), %rcx
14568ef16:     	movq	%rax, 0x40(%rcx)
14568ef1a:     	movups	(%rbp), %xmm0
14568ef1e:     	movups	0x10(%rbp), %xmm1
14568ef22:     	movups	0x20(%rbp), %xmm2
14568ef26:     	movups	0x30(%rbp), %xmm3
14568ef2a:     	movups	%xmm3, 0x30(%rcx)
14568ef2e:     	movups	%xmm2, 0x20(%rcx)
14568ef32:     	movups	%xmm1, 0x10(%rcx)
14568ef36:     	movups	%xmm0, (%rcx)
14568ef39:     	movl	%edi, 0x78(%rbp)
14568ef3c:     	movl	%r14d, 0x7c(%rbp)
14568ef40:     	movq	0xf0(%rbp), %rdi
14568ef47:     	cmpq	0xe0(%rbp), %rdi
14568ef4e:     	jne	0x14568efbe <.text+0x568dfbe>
14568ef50:     	leaq	0xe0(%rbp), %rcx
14568ef57:     	callq	0x145780650 <.text+0x577f650>
14568ef5c:     	nop
14568ef5d:     	leaq	(%rdi,%rdi,4), %rax
14568ef61:     	shlq	$0x4, %rax
14568ef65:     	incq	%rdi
14568ef68:     	cmpq	$-0x1, (%rbp)
14568ef6d:     	movq	0xe8(%rbp), %rcx
14568ef74:     	movups	0xb8(%rbp), %xmm0
14568ef7b:     	movups	%xmm0, 0x40(%rcx,%rax)
14568ef80:     	movups	0x78(%rbp), %xmm0
14568ef84:     	movups	0x88(%rbp), %xmm1
14568ef8b:     	movups	0x98(%rbp), %xmm2
14568ef92:     	movups	0xa8(%rbp), %xmm3
14568ef99:     	movups	%xmm3, 0x30(%rcx,%rax)
14568ef9e:     	movups	%xmm2, 0x20(%rcx,%rax)
14568efa3:     	movups	%xmm1, 0x10(%rcx,%rax)
14568efa8:     	movups	%xmm0, (%rcx,%rax)
14568efac:     	movq	%rdi, 0xf0(%rbp)
14568efb3:     	jne	0x14568ee99 <.text+0x568de99>
14568efb9:     	jmp	0x14568ee8f <.text+0x568de8f>
14568efbe:     	movq	0xe8(%rbp), %rax
14568efc5:     	leaq	(%rdi,%rdi,4), %rcx
14568efc9:     	shlq	$0x4, %rcx
14568efcd:     	movups	0xb8(%rbp), %xmm0
14568efd4:     	movups	%xmm0, 0x40(%rax,%rcx)
14568efd9:     	movups	0x78(%rbp), %xmm0
14568efdd:     	movups	0x88(%rbp), %xmm1
14568efe4:     	movups	0x98(%rbp), %xmm2
14568efeb:     	movups	0xa8(%rbp), %xmm3
14568eff2:     	movups	%xmm3, 0x30(%rax,%rcx)
14568eff7:     	movups	%xmm2, 0x20(%rax,%rcx)
14568effc:     	movups	%xmm1, 0x10(%rax,%rcx)
14568f001:     	movups	%xmm0, (%rax,%rcx)
14568f005:     	incq	%rdi
14568f008:     	movq	%rdi, 0xf0(%rbp)
14568f00f:     	jmp	0x14568ee99 <.text+0x568de99>
14568f014:     	cmpq	$0x0, 0xf0(%rbp)
14568f01c:     	je	0x14568f0ba <.text+0x568e0ba>
14568f022:     	movq	0xf0(%rbp), %rax
14568f029:     	movq	0x100(%rbp), %rcx
14568f030:     	movq	%rax, 0x10(%rcx)
14568f034:     	movq	%rcx, %rax
14568f037:     	movups	0xe0(%rbp), %xmm0
14568f03e:     	movups	%xmm0, (%rcx)
14568f041:     	movq	0x70(%rbp), %rdx
14568f045:     	testq	%rdx, %rdx
14568f048:     	je	0x14568f063 <.text+0x568e063>
14568f04a:     	movl	$0x1, %r8d
14568f050:     	movq	0xc8(%rbp), %rcx
14568f057:     	callq	0x1400021d0 <.text+0x11d0>
14568f05c:     	movq	0x100(%rbp), %rax
14568f063:     	movq	-0x38(%rbp), %rdx
14568f067:     	cmpq	$-0x1, %rdx
14568f06b:     	je	0x14568f098 <.text+0x568e098>
14568f06d:     	testq	%rdx, %rdx
14568f070:     	je	0x14568f098 <.text+0x568e098>
14568f072:     	movq	-0x30(%rbp), %rcx
14568f076:     	movl	$0x1, %r8d
14568f07c:     	callq	0x1400021d0 <.text+0x11d0>
14568f081:     	movq	0x100(%rbp), %rax
14568f088:     	jmp	0x14568f098 <.text+0x568e098>
14568f08a:     	movq	%rcx, 0x8(%rdi)
14568f08e:     	movq	$-0x1, (%rdi)
14568f095:     	movq	%rdi, %rax
14568f098:     	movaps	0x110(%rbp), %xmm6
14568f09f:     	movaps	0x120(%rbp), %xmm7
14568f0a6:     	addq	$0x1b8, %rsp            # imm = 0x1B8
14568f0ad:     	popq	%rbx
14568f0ae:     	popq	%rdi
14568f0af:     	popq	%rsi
14568f0b0:     	popq	%r12
14568f0b2:     	popq	%r13
14568f0b4:     	popq	%r14
14568f0b6:     	popq	%r15
14568f0b8:     	popq	%rbp
14568f0b9:     	retq
14568f0ba:     	leaq	0x1b0(%rbp), %rax
14568f0c1:     	movq	%rax, 0x78(%rbp)
14568f0c5:     	leaq	0xab384(%rip), %rax     # 0x14573a450 <.text+0x5739450>
14568f0cc:     	movq	%rax, 0x80(%rbp)
14568f0d3:     	leaq	0x1a0(%rbp), %rax
14568f0da:     	movq	%rax, 0x88(%rbp)
14568f0e1:     	leaq	0xaa608(%rip), %rax     # 0x1457396f0 <.text+0x57386f0>
14568f0e8:     	movq	%rax, 0x90(%rbp)
14568f0ef:     	leaq	0x1a8(%rbp), %rcx
14568f0f6:     	movq	%rcx, 0x98(%rbp)
14568f0fd:     	movq	%rax, 0xa0(%rbp)
14568f104:     	leaq	0x48(%rbp), %rax
14568f108:     	movq	%rax, 0xa8(%rbp)
14568f10f:     	leaq	-0x568d056(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14568f116:     	movq	%rax, 0xb0(%rbp)
14568f11d:     	leaq	0x16c3991(%rip), %rcx   # 0x146d52ab5
14568f124:     	leaq	0x78(%rbp), %rdx
14568f128:     	callq	0x145900810 <.text+0x58ff810>
14568f12d:     	nop
14568f12e:     	movq	0x100(%rbp), %rcx
14568f135:     	movq	%rax, 0x8(%rcx)
14568f139:     	movq	$-0x1, (%rcx)
14568f140:     	leaq	0xe0(%rbp), %rcx
14568f147:     	callq	0x145685d10 <.text+0x5684d10>
14568f14c:     	nop
14568f14d:     	leaq	-0x50(%rbp), %rcx
14568f151:     	callq	0x140795570 <.text+0x794570>
14568f156:     	jmp	0x14568f081 <.text+0x568e081>
14568f15b:     	leaq	0x16c3606(%rip), %r8    # 0x146d52768
14568f162:     	movq	0xd0(%rbp), %rdx
14568f169:     	callq	0x145903b33 <.text+0x5902b33>
14568f16e:     	nop
14568f16f:     	ud2
