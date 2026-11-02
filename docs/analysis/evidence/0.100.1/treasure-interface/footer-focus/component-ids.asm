
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14034f960:     	pushq	%rbp
14034f961:     	pushq	%r15
14034f963:     	pushq	%r14
14034f965:     	pushq	%rsi
14034f966:     	pushq	%rdi
14034f967:     	pushq	%rbx
14034f968:     	subq	$0x98, %rsp
14034f96f:     	leaq	0x80(%rsp), %rbp
14034f977:     	movq	$-0x2, 0x10(%rbp)
14034f97f:     	movq	%rdx, %rbx
14034f982:     	movq	%rcx, %rsi
14034f985:     	movq	0x18(%rcx), %rax
14034f989:     	movq	0x20(%rcx), %rcx
14034f98d:     	movabsq	$-0x4c3dd0bcb73250dd, %rdx # imm = 0xB3C22F4348CDAF23
14034f997:     	xorl	%r9d, %r9d
14034f99a:     	movdqa	0x55b784e(%rip), %xmm0  # 0x1459071f0
14034f9a2:     	pcmpeqd	%xmm1, %xmm1
14034f9a6:     	movdqa	0x560d3f2(%rip), %xmm2  # 0x14595cda0
14034f9ae:     	andq	%rcx, %rdx
14034f9b1:     	movdqu	(%rax,%rdx), %xmm3
14034f9b6:     	movdqa	%xmm3, %xmm4
14034f9ba:     	pcmpeqb	%xmm0, %xmm4
14034f9be:     	pmovmskb	%xmm4, %r10d
14034f9c3:     	testl	%r10d, %r10d
14034f9c6:     	je	0x14034fa00 <.text+0x34ea00>
14034f9c8:     	tzcntl	%r10d, %r11d
14034f9cd:     	addq	%rdx, %r11
14034f9d0:     	andq	%rcx, %r11
14034f9d3:     	negq	%r11
14034f9d6:     	leaq	(%r11,%r11,2), %r11
14034f9da:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14034f9e1:     	pcmpeqb	%xmm2, %xmm4
14034f9e5:     	pmovmskb	%xmm4, %edi
14034f9e9:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
14034f9ef:     	je	0x14034fa1b <.text+0x34ea1b>
14034f9f1:     	leal	-0x1(%r10), %r11d
14034f9f5:     	andw	%r10w, %r11w
14034f9f9:     	movl	%r11d, %r10d
14034f9fc:     	jne	0x14034f9c8 <.text+0x34e9c8>
14034f9fe:     	nop
14034fa00:     	pcmpeqb	%xmm1, %xmm3
14034fa04:     	pmovmskb	%xmm3, %r10d
14034fa09:     	testl	%r10d, %r10d
14034fa0c:     	jne	0x14034fa28 <.text+0x34ea28>
14034fa0e:     	addq	%r9, %rdx
14034fa11:     	addq	$0x10, %rdx
14034fa15:     	addq	$0x10, %r9
14034fa19:     	jmp	0x14034f9ae <.text+0x34e9ae>
14034fa1b:     	leaq	(%rax,%r11,8), %rax
14034fa1f:     	movq	-0x8(%rax), %rdi
14034fa23:     	jmp	0x14034fb83 <.text+0x34eb83>
14034fa28:     	movq	%rbx, %rcx
14034fa2b:     	movq	%r8, %r14
14034fa2e:     	callq	0x140205300 <.text+0x204300>
14034fa33:     	movq	%rdx, %rdi
14034fa36:     	movq	%rbx, %rcx
14034fa39:     	callq	0x140204480 <.text+0x203480>
14034fa3e:     	movq	%rdx, %r15
14034fa41:     	movq	%rbx, %rcx
14034fa44:     	callq	0x140203fd0 <.text+0x202fd0>
14034fa49:     	movq	$0x1, -0x18(%rbp)
14034fa51:     	movq	%r15, -0x10(%rbp)
14034fa55:     	movq	$0x1, -0x8(%rbp)
14034fa5d:     	movq	%rdi, (%rbp)
14034fa61:     	movb	$0x1, 0x8(%rbp)
14034fa65:     	movq	$0x1, -0x28(%rbp)
14034fa6d:     	movq	%rdx, -0x20(%rbp)
14034fa71:     	leaq	-0x40(%rbp), %r15
14034fa75:     	leaq	-0x28(%rbp), %rdx
14034fa79:     	movq	%r15, %rcx
14034fa7c:     	callq	0x1401a3020 <.text+0x1a2020>
14034fa81:     	movq	0x10(%rsi), %rdi
14034fa85:     	movq	0x18(%rbx), %rax
14034fa89:     	movq	%rdi, 0x30(%rsp)
14034fa8e:     	movq	%r15, 0x28(%rsp)
14034fa93:     	movq	%rax, 0x20(%rsp)
14034fa98:     	leaq	0x56143cd(%rip), %rdx   # 0x145963e6c
14034fa9f:     	leaq	-0x28(%rbp), %rcx
14034faa3:     	movl	$0x66, %r8d
14034faa9:     	movq	%r14, %r9
14034faac:     	callq	0x144e6b4c0 <.text+0x4e6a4c0>
14034fab1:     	cmpq	(%rsi), %rdi
14034fab4:     	jne	0x14034fabf <.text+0x34eabf>
14034fab6:     	movq	%rsi, %rcx
14034fab9:     	callq	0x145774780 <.text+0x5773780>
14034fabe:     	nop
14034fabf:     	movq	0x8(%rsi), %rax
14034fac3:     	leaq	(%rdi,%rdi,4), %rcx
14034fac7:     	movq	-0x8(%rbp), %rdx
14034facb:     	movq	%rdx, 0x20(%rax,%rcx,8)
14034fad0:     	movups	-0x28(%rbp), %xmm0
14034fad4:     	movdqu	-0x18(%rbp), %xmm1
14034fad9:     	movdqu	%xmm1, 0x10(%rax,%rcx,8)
14034fadf:     	movups	%xmm0, (%rax,%rcx,8)
14034fae3:     	leaq	0x1(%rdi), %rax
14034fae7:     	movq	%rax, 0x10(%rsi)
14034faeb:     	movq	0x18(%rsi), %rbx
14034faef:     	movq	0x20(%rsi), %r14
14034faf3:     	movabsq	$-0x4c3dd0bcb73250dd, %r15 # imm = 0xB3C22F4348CDAF23
14034fafd:     	movq	%r14, %rcx
14034fb00:     	andq	%r15, %rcx
14034fb03:     	movdqu	(%rbx,%rcx), %xmm0
14034fb08:     	pmovmskb	%xmm0, %eax
14034fb0c:     	testl	%eax, %eax
14034fb0e:     	je	0x14034fb96 <.text+0x34eb96>
14034fb14:     	tzcntl	%eax, %eax
14034fb18:     	addq	%rcx, %rax
14034fb1b:     	andq	%r14, %rax
14034fb1e:     	movzbl	(%rbx,%rax), %ecx
14034fb22:     	testb	%cl, %cl
14034fb24:     	jns	0x14034fbb8 <.text+0x34ebb8>
14034fb2a:     	movq	0x28(%rsi), %rdx
14034fb2e:     	testq	%rdx, %rdx
14034fb31:     	setne	%r8b
14034fb35:     	andb	$0x1, %cl
14034fb38:     	sete	%r9b
14034fb3c:     	orb	%r8b, %r9b
14034fb3f:     	je	0x14034fbcd <.text+0x34ebcd>
14034fb45:     	movzbl	%cl, %ecx
14034fb48:     	subq	%rcx, %rdx
14034fb4b:     	movq	%rdx, 0x28(%rsi)
14034fb4f:     	leaq	-0x10(%rax), %rcx
14034fb53:     	andq	%r14, %rcx
14034fb56:     	movb	$0x59, (%rbx,%rax)
14034fb5a:     	movb	$0x59, 0x10(%rbx,%rcx)
14034fb5f:     	incq	0x30(%rsi)
14034fb63:     	negq	%rax
14034fb66:     	leaq	(%rax,%rax,2), %rax
14034fb6a:     	movabsq	$-0x3d32793b1c1e7570, %rcx # imm = 0xC2CD86C4E3E18A90
14034fb74:     	movq	%rcx, -0x18(%rbx,%rax,8)
14034fb79:     	movq	%r15, -0x10(%rbx,%rax,8)
14034fb7e:     	movq	%rdi, -0x8(%rbx,%rax,8)
14034fb83:     	movq	%rdi, %rax
14034fb86:     	addq	$0x98, %rsp
14034fb8d:     	popq	%rbx
14034fb8e:     	popq	%rdi
14034fb8f:     	popq	%rsi
14034fb90:     	popq	%r14
14034fb92:     	popq	%r15
14034fb94:     	popq	%rbp
14034fb95:     	retq
14034fb96:     	movl	$0x10, %edx
14034fb9b:     	addq	%rdx, %rcx
14034fb9e:     	andq	%r14, %rcx
14034fba1:     	movdqu	(%rbx,%rcx), %xmm0
14034fba6:     	pmovmskb	%xmm0, %eax
14034fbaa:     	addq	$0x10, %rdx
14034fbae:     	testl	%eax, %eax
14034fbb0:     	jne	0x14034fb14 <.text+0x34eb14>
14034fbb6:     	jmp	0x14034fb9b <.text+0x34eb9b>
14034fbb8:     	movdqa	(%rbx), %xmm0
14034fbbc:     	pmovmskb	%xmm0, %eax
14034fbc0:     	tzcntl	%eax, %eax
14034fbc4:     	movzbl	(%rbx,%rax), %ecx
14034fbc8:     	jmp	0x14034fb2a <.text+0x34eb2a>
14034fbcd:     	leaq	0x18(%rsi), %rcx
14034fbd1:     	leaq	0x38(%rsi), %r8
14034fbd5:     	movl	$0x1, %edx
14034fbda:     	movb	$0x1, %r9b
14034fbdd:     	callq	0x1458c1ee0 <.text+0x58c0ee0>
14034fbe2:     	movq	0x18(%rsi), %rbx
14034fbe6:     	movq	0x20(%rsi), %r14
14034fbea:     	movabsq	$-0x4c3dd0bcb73250dd, %r8 # imm = 0xB3C22F4348CDAF23
14034fbf4:     	movq	%rbx, %rcx
14034fbf7:     	movq	%r14, %rdx
14034fbfa:     	callq	0x14000efd0 <.text+0xdfd0>
14034fbff:     	movzbl	(%rbx,%rax), %ecx
14034fc03:     	movq	0x28(%rsi), %rdx
14034fc07:     	andb	$0x1, %cl
14034fc0a:     	jmp	0x14034fb45 <.text+0x34eb45>
