Disassembly of section .text:

0000000140001000 <.text>:
14036f970:     	pushq	%rbp
14036f971:     	pushq	%r15
14036f973:     	pushq	%r14
14036f975:     	pushq	%r13
14036f977:     	pushq	%r12
14036f979:     	pushq	%rsi
14036f97a:     	pushq	%rdi
14036f97b:     	pushq	%rbx
14036f97c:     	subq	$0x158, %rsp            # imm = 0x158
14036f983:     	leaq	0x80(%rsp), %rbp
14036f98b:     	movq	$-0x2, 0xd0(%rbp)
14036f996:     	movq	%r9, %rdi
14036f999:     	movq	%rdx, %rsi
14036f99c:     	movzbl	(%r8), %eax
14036f9a0:     	movb	$0x1, (%r8)
14036f9a4:     	cmpb	$0x1, %al
14036f9a6:     	je	0x14036fadc <.text+0x36eadc>
14036f9ac:     	movq	$0x1, 0x20(%rsp)
14036f9b5:     	leaq	0x5a5d519(%rip), %rdx   # 0x145dcced5
14036f9bc:     	leaq	0x5a5d55c(%rip), %rbx   # 0x145dccf1f
14036f9c3:     	movl	$0x8, %r8d
14036f9c9:     	movq	%rsi, %rcx
14036f9cc:     	movq	%rbx, %r9
14036f9cf:     	callq	0x14063a3d0 <.text+0x6393d0>
14036f9d4:     	movq	$0x1, 0x20(%rsp)
14036f9dd:     	leaq	0x5a5d4f9(%rip), %rdx   # 0x145dccedd
14036f9e4:     	movl	$0x9, %r8d
14036f9ea:     	movq	%rsi, %rcx
14036f9ed:     	movq	%rbx, %r9
14036f9f0:     	callq	0x14063a3d0 <.text+0x6393d0>
14036f9f5:     	movq	$0x1, 0x20(%rsp)
14036f9fe:     	leaq	0x5a5d4e1(%rip), %rdx   # 0x145dccee6
14036fa05:     	movl	$0x8, %r8d
14036fa0b:     	movq	%rsi, %rcx
14036fa0e:     	movq	%rbx, %r9
14036fa11:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fa16:     	movq	$0x1, 0x20(%rsp)
14036fa1f:     	leaq	0x5a5d4c8(%rip), %rdx   # 0x145dcceee
14036fa26:     	movl	$0x8, %r8d
14036fa2c:     	movq	%rsi, %rcx
14036fa2f:     	movq	%rbx, %r9
14036fa32:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fa37:     	movq	$0x1, 0x20(%rsp)
14036fa40:     	leaq	0x5a5d4af(%rip), %rdx   # 0x145dccef6
14036fa47:     	movl	$0xa, %r8d
14036fa4d:     	movq	%rsi, %rcx
14036fa50:     	movq	%rbx, %r9
14036fa53:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fa58:     	movq	$0x1, 0x20(%rsp)
14036fa61:     	leaq	0x5a5d498(%rip), %rdx   # 0x145dccf00
14036fa68:     	movl	$0x7, %r8d
14036fa6e:     	movq	%rsi, %rcx
14036fa71:     	movq	%rbx, %r9
14036fa74:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fa79:     	movq	$0x1, 0x20(%rsp)
14036fa82:     	leaq	0x5a5d47e(%rip), %rdx   # 0x145dccf07
14036fa89:     	movl	$0x8, %r8d
14036fa8f:     	movq	%rsi, %rcx
14036fa92:     	movq	%rbx, %r9
14036fa95:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fa9a:     	movq	$0x1, 0x20(%rsp)
14036faa3:     	leaq	0x5a5d465(%rip), %rdx   # 0x145dccf0f
14036faaa:     	movl	$0x9, %r8d
14036fab0:     	movq	%rsi, %rcx
14036fab3:     	movq	%rbx, %r9
14036fab6:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fabb:     	movq	$0x1, 0x20(%rsp)
14036fac4:     	leaq	0x5a5d44d(%rip), %rdx   # 0x145dccf18
14036facb:     	movl	$0x7, %r8d
14036fad1:     	movq	%rsi, %rcx
14036fad4:     	movq	%rbx, %r9
14036fad7:     	callq	0x14063a3d0 <.text+0x6393d0>
14036fadc:     	leaq	0x5a5d3f2(%rip), %r8    # 0x145dcced5
14036fae3:     	leaq	-0x50(%rbp), %rcx
14036fae7:     	movl	$0x8, %r9d
14036faed:     	movq	%rsi, %rdx
14036faf0:     	callq	0x14063cd20 <.text+0x63bd20>
14036faf5:     	movq	-0x50(%rbp), %rax
14036faf9:     	movb	$0x1, %bl
14036fafb:     	movb	$0x1, %r15b
14036fafe:     	cmpq	$-0x1, %rax
14036fb02:     	je	0x14036fb4b <.text+0x36eb4b>
14036fb04:     	movq	%rax, 0xb8(%rbp)
14036fb0b:     	movq	-0x48(%rbp), %rcx
14036fb0f:     	movq	-0x40(%rbp), %rdx
14036fb13:     	movq	%rcx, 0xc8(%rbp)
14036fb1a:     	callq	0x14006f550 <.text+0x6e550>
14036fb1f:     	nop
14036fb20:     	cmpq	$0x1, %rdx
14036fb24:     	jne	0x14036fb2d <.text+0x36eb2d>
14036fb26:     	cmpb	$0x30, (%rax)
14036fb29:     	setne	%r15b
14036fb2d:     	movq	0xb8(%rbp), %rdx
14036fb34:     	testq	%rdx, %rdx
14036fb37:     	je	0x14036fb4b <.text+0x36eb4b>
14036fb39:     	movl	$0x1, %r8d
14036fb3f:     	movq	0xc8(%rbp), %rcx
14036fb46:     	callq	0x1400021d0 <.text+0x11d0>
14036fb4b:     	leaq	0x5a5d38b(%rip), %r8    # 0x145dccedd
14036fb52:     	leaq	-0x50(%rbp), %rcx
14036fb56:     	movl	$0x9, %r9d
14036fb5c:     	movq	%rsi, %rdx
14036fb5f:     	callq	0x14063cd20 <.text+0x63bd20>
14036fb64:     	movq	-0x50(%rbp), %rax
14036fb68:     	cmpq	$-0x1, %rax
14036fb6c:     	je	0x14036fbb4 <.text+0x36ebb4>
14036fb6e:     	movq	%rax, 0xb8(%rbp)
14036fb75:     	movq	-0x48(%rbp), %rcx
14036fb79:     	movq	-0x40(%rbp), %rdx
14036fb7d:     	movq	%rcx, 0xc8(%rbp)
14036fb84:     	callq	0x14006f550 <.text+0x6e550>
14036fb89:     	nop
14036fb8a:     	cmpq	$0x1, %rdx
14036fb8e:     	jne	0x14036fb96 <.text+0x36eb96>
14036fb90:     	cmpb	$0x30, (%rax)
14036fb93:     	setne	%bl
14036fb96:     	movq	0xb8(%rbp), %rdx
14036fb9d:     	testq	%rdx, %rdx
14036fba0:     	je	0x14036fbb4 <.text+0x36ebb4>
14036fba2:     	movl	$0x1, %r8d
14036fba8:     	movq	0xc8(%rbp), %rcx
14036fbaf:     	callq	0x1400021d0 <.text+0x11d0>
14036fbb4:     	leaq	0x5a5d32b(%rip), %r8    # 0x145dccee6
14036fbbb:     	leaq	-0x50(%rbp), %rcx
14036fbbf:     	movl	$0x8, %r9d
14036fbc5:     	movq	%rsi, %rdx
14036fbc8:     	callq	0x14063cd20 <.text+0x63bd20>
14036fbcd:     	movq	-0x50(%rbp), %rax
14036fbd1:     	movb	$0x1, %r12b
14036fbd4:     	movb	$0x1, %r13b
14036fbd7:     	cmpq	$-0x1, %rax
14036fbdb:     	je	0x14036fc24 <.text+0x36ec24>
14036fbdd:     	movq	%rax, 0xb8(%rbp)
14036fbe4:     	movq	-0x48(%rbp), %rcx
14036fbe8:     	movq	-0x40(%rbp), %rdx
14036fbec:     	movq	%rcx, 0xc8(%rbp)
14036fbf3:     	callq	0x14006f550 <.text+0x6e550>
14036fbf8:     	nop
14036fbf9:     	cmpq	$0x1, %rdx
14036fbfd:     	jne	0x14036fc06 <.text+0x36ec06>
14036fbff:     	cmpb	$0x30, (%rax)
14036fc02:     	setne	%r13b
14036fc06:     	movq	0xb8(%rbp), %rdx
14036fc0d:     	testq	%rdx, %rdx
14036fc10:     	je	0x14036fc24 <.text+0x36ec24>
14036fc12:     	movl	$0x1, %r8d
14036fc18:     	movq	0xc8(%rbp), %rcx
14036fc1f:     	callq	0x1400021d0 <.text+0x11d0>
14036fc24:     	leaq	0x5a5d2c3(%rip), %r8    # 0x145dcceee
14036fc2b:     	leaq	-0x50(%rbp), %rcx
14036fc2f:     	movl	$0x8, %r9d
14036fc35:     	movq	%rsi, %rdx
14036fc38:     	callq	0x14063cd20 <.text+0x63bd20>
14036fc3d:     	movq	-0x50(%rbp), %rax
14036fc41:     	cmpq	$-0x1, %rax
14036fc45:     	je	0x14036fc8e <.text+0x36ec8e>
14036fc47:     	movq	%rax, 0xb8(%rbp)
14036fc4e:     	movq	-0x48(%rbp), %rcx
14036fc52:     	movq	-0x40(%rbp), %rdx
14036fc56:     	movq	%rcx, 0xc8(%rbp)
14036fc5d:     	callq	0x14006f550 <.text+0x6e550>
14036fc62:     	nop
14036fc63:     	cmpq	$0x1, %rdx
14036fc67:     	jne	0x14036fc70 <.text+0x36ec70>
14036fc69:     	cmpb	$0x30, (%rax)
14036fc6c:     	setne	%r12b
14036fc70:     	movq	0xb8(%rbp), %rdx
14036fc77:     	testq	%rdx, %rdx
14036fc7a:     	je	0x14036fc8e <.text+0x36ec8e>
14036fc7c:     	movl	$0x1, %r8d
14036fc82:     	movq	0xc8(%rbp), %rcx
14036fc89:     	callq	0x1400021d0 <.text+0x11d0>
14036fc8e:     	leaq	0x5a5d261(%rip), %r8    # 0x145dccef6
14036fc95:     	leaq	-0x50(%rbp), %rcx
14036fc99:     	movl	$0xa, %r9d
14036fc9f:     	movq	%rsi, %rdx
14036fca2:     	callq	0x14063cd20 <.text+0x63bd20>
14036fca7:     	movq	-0x50(%rbp), %rax
14036fcab:     	movb	$0x1, %r14b
14036fcae:     	movb	$0x1, 0xb8(%rbp)
14036fcb5:     	cmpq	$-0x1, %rax
14036fcb9:     	je	0x14036fd09 <.text+0x36ed09>
14036fcbb:     	movq	%rax, 0xc8(%rbp)
14036fcc2:     	movq	-0x48(%rbp), %rcx
14036fcc6:     	movq	-0x40(%rbp), %rdx
14036fcca:     	movq	%rcx, 0x98(%rbp)
14036fcd1:     	callq	0x14006f550 <.text+0x6e550>
14036fcd6:     	nop
14036fcd7:     	movb	$0x1, %cl
14036fcd9:     	cmpq	$0x1, %rdx
14036fcdd:     	jne	0x14036fce5 <.text+0x36ece5>
14036fcdf:     	cmpb	$0x30, (%rax)
14036fce2:     	setne	%cl
14036fce5:     	movb	%cl, 0xb8(%rbp)
14036fceb:     	movq	0xc8(%rbp), %rdx
14036fcf2:     	testq	%rdx, %rdx
14036fcf5:     	je	0x14036fd09 <.text+0x36ed09>
14036fcf7:     	movl	$0x1, %r8d
14036fcfd:     	movq	0x98(%rbp), %rcx
14036fd04:     	callq	0x1400021d0 <.text+0x11d0>
14036fd09:     	leaq	0x5a5d1f0(%rip), %r8    # 0x145dccf00
14036fd10:     	leaq	-0x50(%rbp), %rcx
14036fd14:     	movl	$0x7, %r9d
14036fd1a:     	movq	%rsi, %rdx
14036fd1d:     	callq	0x14063cd20 <.text+0x63bd20>
14036fd22:     	movq	-0x50(%rbp), %rax
14036fd26:     	cmpq	$-0x1, %rax
14036fd2a:     	je	0x14036fd73 <.text+0x36ed73>
14036fd2c:     	movq	%rax, 0xc8(%rbp)
14036fd33:     	movq	-0x48(%rbp), %rcx
14036fd37:     	movq	-0x40(%rbp), %rdx
14036fd3b:     	movq	%rcx, 0x98(%rbp)
14036fd42:     	callq	0x14006f550 <.text+0x6e550>
14036fd47:     	nop
14036fd48:     	cmpq	$0x1, %rdx
14036fd4c:     	jne	0x14036fd55 <.text+0x36ed55>
14036fd4e:     	cmpb	$0x30, (%rax)
14036fd51:     	setne	%r14b
14036fd55:     	movq	0xc8(%rbp), %rdx
14036fd5c:     	testq	%rdx, %rdx
14036fd5f:     	je	0x14036fd73 <.text+0x36ed73>
14036fd61:     	movl	$0x1, %r8d
14036fd67:     	movq	0x98(%rbp), %rcx
14036fd6e:     	callq	0x1400021d0 <.text+0x11d0>
14036fd73:     	leaq	0x5a5d18d(%rip), %r8    # 0x145dccf07
14036fd7a:     	leaq	-0x50(%rbp), %rcx
14036fd7e:     	movl	$0x8, %r9d
14036fd84:     	movq	%rsi, %rdx
14036fd87:     	callq	0x14063cd20 <.text+0x63bd20>
14036fd8c:     	movq	-0x50(%rbp), %rax
14036fd90:     	movb	$0x1, 0x98(%rbp)
14036fd97:     	movb	$0x1, 0xc8(%rbp)
14036fd9e:     	cmpq	$-0x1, %rax
14036fda2:     	je	0x14036fdf2 <.text+0x36edf2>
14036fda4:     	movq	%rax, 0xb0(%rbp)
14036fdab:     	movq	-0x48(%rbp), %rcx
14036fdaf:     	movq	-0x40(%rbp), %rdx
14036fdb3:     	movq	%rcx, 0xa0(%rbp)
14036fdba:     	callq	0x14006f550 <.text+0x6e550>
14036fdbf:     	nop
14036fdc0:     	movb	$0x1, %cl
14036fdc2:     	cmpq	$0x1, %rdx
14036fdc6:     	jne	0x14036fdce <.text+0x36edce>
14036fdc8:     	cmpb	$0x30, (%rax)
14036fdcb:     	setne	%cl
14036fdce:     	movb	%cl, 0xc8(%rbp)
14036fdd4:     	movq	0xb0(%rbp), %rdx
14036fddb:     	testq	%rdx, %rdx
14036fdde:     	je	0x14036fdf2 <.text+0x36edf2>
14036fde0:     	movl	$0x1, %r8d
14036fde6:     	movq	0xa0(%rbp), %rcx
14036fded:     	callq	0x1400021d0 <.text+0x11d0>
14036fdf2:     	leaq	0x5a5d116(%rip), %r8    # 0x145dccf0f
14036fdf9:     	leaq	-0x50(%rbp), %rcx
14036fdfd:     	movl	$0x9, %r9d
14036fe03:     	movq	%rsi, %rdx
14036fe06:     	callq	0x14063cd20 <.text+0x63bd20>
14036fe0b:     	movq	-0x50(%rbp), %rax
14036fe0f:     	cmpq	$-0x1, %rax
14036fe13:     	je	0x14036fe63 <.text+0x36ee63>
14036fe15:     	movq	%rax, 0xb0(%rbp)
14036fe1c:     	movq	-0x48(%rbp), %rcx
14036fe20:     	movq	-0x40(%rbp), %rdx
14036fe24:     	movq	%rcx, 0xa0(%rbp)
14036fe2b:     	callq	0x14006f550 <.text+0x6e550>
14036fe30:     	nop
14036fe31:     	movb	$0x1, %cl
14036fe33:     	cmpq	$0x1, %rdx
14036fe37:     	jne	0x14036fe3f <.text+0x36ee3f>
14036fe39:     	cmpb	$0x30, (%rax)
14036fe3c:     	setne	%cl
14036fe3f:     	movb	%cl, 0x98(%rbp)
14036fe45:     	movq	0xb0(%rbp), %rdx
14036fe4c:     	testq	%rdx, %rdx
14036fe4f:     	je	0x14036fe63 <.text+0x36ee63>
14036fe51:     	movl	$0x1, %r8d
14036fe57:     	movq	0xa0(%rbp), %rcx
14036fe5e:     	callq	0x1400021d0 <.text+0x11d0>
14036fe63:     	leaq	0x5a5d0ae(%rip), %r8    # 0x145dccf18
14036fe6a:     	leaq	-0x50(%rbp), %rcx
14036fe6e:     	movl	$0x7, %r9d
14036fe74:     	movq	%rsi, %rdx
14036fe77:     	callq	0x14063cd20 <.text+0x63bd20>
14036fe7c:     	movq	-0x50(%rbp), %rax
14036fe80:     	cmpq	$-0x1, %rax
14036fe84:     	je	0x14036ff1c <.text+0x36ef1c>
14036fe8a:     	movq	%rax, 0xb0(%rbp)
14036fe91:     	movq	-0x48(%rbp), %rcx
14036fe95:     	movq	-0x40(%rbp), %rdx
14036fe99:     	movq	%rcx, 0xa0(%rbp)
14036fea0:     	callq	0x14006f550 <.text+0x6e550>
14036fea5:     	nop
14036fea6:     	movb	$0x1, %r9b
14036fea9:     	cmpq	$0x1, %rdx
14036fead:     	jne	0x14036feb6 <.text+0x36eeb6>
14036feaf:     	cmpb	$0x30, (%rax)
14036feb2:     	setne	%r9b
14036feb6:     	movq	0xb0(%rbp), %rdx
14036febd:     	testq	%rdx, %rdx
14036fec0:     	je	0x14036ff0c <.text+0x36ef0c>
14036fec2:     	movl	$0x1, %r8d
14036fec8:     	movq	0xa0(%rbp), %rcx
14036fecf:     	movq	%rsi, 0xb0(%rbp)
14036fed6:     	movl	%r14d, %esi
14036fed9:     	movq	%rdi, %r14
14036fedc:     	movl	%r13d, %edi
14036fedf:     	movl	%r15d, %r13d
14036fee2:     	movl	%r12d, %r15d
14036fee5:     	movl	%ebx, %r12d
14036fee8:     	movl	%r9d, %ebx
14036feeb:     	callq	0x1400021d0 <.text+0x11d0>
14036fef0:     	movl	%ebx, %r9d
14036fef3:     	movl	%r12d, %ebx
14036fef6:     	movl	%r15d, %r12d
14036fef9:     	movl	%r13d, %r15d
14036fefc:     	movl	%edi, %r13d
14036feff:     	movq	%r14, %rdi
14036ff02:     	movl	%esi, %r14d
14036ff05:     	movq	0xb0(%rbp), %rsi
14036ff0c:     	movzbl	(%rdi), %eax
14036ff0f:     	cmpb	$0x2, %al
14036ff11:     	movb	%r9b, 0xb0(%rbp)
14036ff18:     	jne	0x14036ff2d <.text+0x36ef2d>
14036ff1a:     	jmp	0x14036ff38 <.text+0x36ef38>
14036ff1c:     	movb	$0x1, %r9b
14036ff1f:     	movzbl	(%rdi), %eax
14036ff22:     	cmpb	$0x2, %al
14036ff24:     	movb	%r9b, 0xb0(%rbp)
14036ff2b:     	je	0x14036ff38 <.text+0x36ef38>
14036ff2d:     	xorb	%r9b, %al
14036ff30:     	testb	$0x1, %al
14036ff32:     	je	0x140370049 <.text+0x36f049>
14036ff38:     	movb	%r9b, (%rdi)
14036ff3b:     	cmpq	$0x0, 0x90(%rsi)
14036ff43:     	je	0x140370343 <.text+0x36f343>
14036ff49:     	movq	0x78(%rsi), %rax
14036ff4d:     	movq	0x80(%rsi), %rcx
14036ff54:     	movabsq	$-0x1edfb7e3e595f2b0, %rdx # imm = 0xE120481C1A6A0D50
14036ff5e:     	xorl	%r8d, %r8d
14036ff61:     	movdqa	0x59fda07(%rip), %xmm0  # 0x145d6d970
14036ff69:     	pcmpeqd	%xmm1, %xmm1
14036ff6d:     	movdqa	0x59fda0b(%rip), %xmm2  # 0x145d6d980
14036ff75:     	andq	%rcx, %rdx
14036ff78:     	movdqu	(%rax,%rdx), %xmm3
14036ff7d:     	movdqa	%xmm3, %xmm4
14036ff81:     	pcmpeqb	%xmm0, %xmm4
14036ff85:     	pmovmskb	%xmm4, %r9d
14036ff8a:     	testl	%r9d, %r9d
14036ff8d:     	je	0x14036ffc7 <.text+0x36efc7>
14036ff8f:     	tzcntl	%r9d, %r10d
14036ff94:     	addq	%rdx, %r10
14036ff97:     	andq	%rcx, %r10
14036ff9a:     	negq	%r10
14036ff9d:     	leaq	(%r10,%r10,2), %r10
14036ffa1:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14036ffa8:     	pcmpeqb	%xmm2, %xmm4
14036ffac:     	pmovmskb	%xmm4, %r11d
14036ffb1:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14036ffb8:     	je	0x14036ffe6 <.text+0x36efe6>
14036ffba:     	leal	-0x1(%r9), %r10d
14036ffbe:     	andw	%r9w, %r10w
14036ffc2:     	movl	%r10d, %r9d
14036ffc5:     	jne	0x14036ff8f <.text+0x36ef8f>
14036ffc7:     	pcmpeqb	%xmm1, %xmm3
14036ffcb:     	pmovmskb	%xmm3, %r9d
14036ffd0:     	testl	%r9d, %r9d
14036ffd3:     	jne	0x140370343 <.text+0x36f343>
14036ffd9:     	addq	%r8, %rdx
14036ffdc:     	addq	$0x10, %rdx
14036ffe0:     	addq	$0x10, %r8
14036ffe4:     	jmp	0x14036ff75 <.text+0x36ef75>
14036ffe6:     	leaq	(%rax,%r10,8), %rax
14036ffea:     	movq	-0x8(%rax), %rax
14036ffee:     	cmpq	0x218(%rsi), %rax
14036fff5:     	movzbl	0xb0(%rbp), %edx
14036fffc:     	jae	0x140370343 <.text+0x36f343>
140370002:     	movq	0x210(%rsi), %rcx
140370009:     	movq	(%rcx,%rax,8), %rcx
14037000d:     	testq	%rcx, %rcx
140370010:     	je	0x140370343 <.text+0x36f343>
140370016:     	movq	0x1e0(%rsi), %rax
14037001d:     	notq	%rcx
140370020:     	imulq	$0x38, %rcx, %rcx
140370024:     	cmpb	$0x0, 0x30(%rax,%rcx)
140370029:     	je	0x140370343 <.text+0x36f343>
14037002f:     	addq	%rcx, %rax
140370032:     	movq	0x10(%rax), %rcx
140370036:     	movb	%dl, -0x4c(%rbp)
140370039:     	movl	$0x17, -0x50(%rbp)
140370040:     	leaq	-0x50(%rbp), %rdx
140370044:     	callq	0x14003eb80 <.text+0x3db80>
140370049:     	cmpq	$0x0, 0x90(%rsi)
140370051:     	je	0x1403702e5 <.text+0x36f2e5>
140370057:     	movq	0x78(%rsi), %rax
14037005b:     	movq	0x80(%rsi), %rcx
140370062:     	movabsq	$-0x50e2146adc60ef26, %rdx # imm = 0xAF1DEB95239F10DA
14037006c:     	xorl	%r8d, %r8d
14037006f:     	movdqa	0x59fd659(%rip), %xmm0  # 0x145d6d6d0
140370077:     	pcmpeqd	%xmm2, %xmm2
14037007b:     	movdqa	0x59fd99d(%rip), %xmm1  # 0x145d6da20
140370083:     	andq	%rcx, %rdx
140370086:     	movdqu	(%rax,%rdx), %xmm3
14037008b:     	movdqa	%xmm3, %xmm4
14037008f:     	pcmpeqb	%xmm0, %xmm4
140370093:     	pmovmskb	%xmm4, %r9d
140370098:     	testl	%r9d, %r9d
14037009b:     	je	0x1403700e0 <.text+0x36f0e0>
14037009d:     	tzcntl	%r9d, %r10d
1403700a2:     	addq	%rdx, %r10
1403700a5:     	andq	%rcx, %r10
1403700a8:     	negq	%r10
1403700ab:     	leaq	(%r10,%r10,2), %r10
1403700af:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1403700b6:     	pcmpeqb	%xmm1, %xmm4
1403700ba:     	pmovmskb	%xmm4, %r11d
1403700bf:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1403700c6:     	je	0x1403700ff <.text+0x36f0ff>
1403700c8:     	leal	-0x1(%r9), %r10d
1403700cc:     	andw	%r9w, %r10w
1403700d0:     	movl	%r10d, %r9d
1403700d3:     	jne	0x14037009d <.text+0x36f09d>
1403700d5:     	nopw	%cs:(%rax,%rax)
1403700e0:     	pcmpeqb	%xmm2, %xmm3
1403700e4:     	pmovmskb	%xmm3, %r9d
1403700e9:     	testl	%r9d, %r9d
1403700ec:     	jne	0x1403702e5 <.text+0x36f2e5>
1403700f2:     	addq	%r8, %rdx
1403700f5:     	addq	$0x10, %rdx
1403700f9:     	addq	$0x10, %r8
1403700fd:     	jmp	0x140370083 <.text+0x36f083>
1403700ff:     	leaq	(%rax,%r10,8), %rdx
140370103:     	movq	-0x8(%rdx), %rdx
140370107:     	movq	0x218(%rsi), %r8
14037010e:     	cmpq	%r8, %rdx
140370111:     	jae	0x1403702e5 <.text+0x36f2e5>
140370117:     	movq	0x210(%rsi), %r9
14037011e:     	movq	(%r9,%rdx,8), %r10
140370122:     	testq	%r10, %r10
140370125:     	je	0x1403702e5 <.text+0x36f2e5>
14037012b:     	movq	0x1e0(%rsi), %rdx
140370132:     	notq	%r10
140370135:     	imulq	$0x38, %r10, %r10
140370139:     	cmpb	$0x0, 0x30(%rdx,%r10)
14037013f:     	je	0x1403702e5 <.text+0x36f2e5>
140370145:     	addq	%rdx, %r10
140370148:     	movq	0x10(%r10), %r10
14037014c:     	cmpb	%r15b, (%r10)
14037014f:     	jne	0x1403701a5 <.text+0x36f1a5>
140370151:     	cmpb	%bl, 0x1(%r10)
140370155:     	jne	0x1403701a5 <.text+0x36f1a5>
140370157:     	cmpb	%r13b, 0x2(%r10)
14037015b:     	jne	0x1403701a5 <.text+0x36f1a5>
14037015d:     	cmpb	%r12b, 0x3(%r10)
140370161:     	jne	0x1403701a5 <.text+0x36f1a5>
140370163:     	movzbl	0xb8(%rbp), %r11d
14037016b:     	cmpb	%r11b, 0x4(%r10)
14037016f:     	jne	0x1403701a5 <.text+0x36f1a5>
140370171:     	cmpb	%r14b, 0x5(%r10)
140370175:     	jne	0x1403701a5 <.text+0x36f1a5>
140370177:     	movzbl	0xc8(%rbp), %r11d
14037017f:     	cmpb	%r11b, 0x6(%r10)
140370183:     	jne	0x1403701a5 <.text+0x36f1a5>
140370185:     	movzbl	0x98(%rbp), %r11d
14037018d:     	cmpb	%r11b, 0x7(%r10)
140370191:     	jne	0x1403701a5 <.text+0x36f1a5>
140370193:     	movzbl	0xb0(%rbp), %r11d
14037019b:     	cmpb	%r11b, 0x8(%r10)
14037019f:     	je	0x1403702d1 <.text+0x36f2d1>
1403701a5:     	movq	%r9, 0xa0(%rbp)
1403701ac:     	movb	%r14b, 0xaf(%rbp)
1403701b3:     	movabsq	$-0x50e2146adc60ef26, %r10 # imm = 0xAF1DEB95239F10DA
1403701bd:     	xorl	%r9d, %r9d
1403701c0:     	pcmpeqd	%xmm2, %xmm2
1403701c4:     	andq	%rcx, %r10
1403701c7:     	movdqu	(%rax,%r10), %xmm3
1403701cd:     	movdqa	%xmm3, %xmm4
1403701d1:     	pcmpeqb	%xmm0, %xmm4
1403701d5:     	pmovmskb	%xmm4, %edi
1403701d9:     	testl	%edi, %edi
1403701db:     	je	0x140370229 <.text+0x36f229>
1403701dd:     	movl	%r13d, %r14d
1403701e0:     	movl	%r12d, %r11d
1403701e3:     	movl	%r15d, %r12d
1403701e6:     	movl	%ebx, %r15d
1403701e9:     	tzcntl	%edi, %r13d
1403701ee:     	addq	%r10, %r13
1403701f1:     	andq	%rcx, %r13
1403701f4:     	negq	%r13
1403701f7:     	leaq	(%r13,%r13,2), %r13
1403701fc:     	movdqu	-0x18(%rax,%r13,8), %xmm4
140370203:     	pcmpeqb	%xmm1, %xmm4
140370207:     	pmovmskb	%xmm4, %ebx
14037020b:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
140370211:     	je	0x140370249 <.text+0x36f249>
140370213:     	leal	-0x1(%rdi), %ebx
140370216:     	andw	%di, %bx
140370219:     	movl	%ebx, %edi
14037021b:     	movl	%r15d, %ebx
14037021e:     	movl	%r12d, %r15d
140370221:     	movl	%r11d, %r12d
140370224:     	movl	%r14d, %r13d
140370227:     	jne	0x1403701dd <.text+0x36f1dd>
140370229:     	pcmpeqb	%xmm2, %xmm3
14037022d:     	pmovmskb	%xmm3, %edi
140370231:     	testl	%edi, %edi
140370233:     	jne	0x140370314 <.text+0x36f314>
140370239:     	addq	%r9, %r10
14037023c:     	addq	$0x10, %r10
140370240:     	addq	$0x10, %r9
140370244:     	jmp	0x1403701c4 <.text+0x36f1c4>
140370249:     	leaq	(%rax,%r13,8), %rax
14037024d:     	movq	-0x8(%rax), %rax
140370251:     	cmpq	%r8, %rax
140370254:     	jae	0x140370314 <.text+0x36f314>
14037025a:     	movq	0xa0(%rbp), %rcx
140370261:     	movq	(%rcx,%rax,8), %rax
140370265:     	testq	%rax, %rax
140370268:     	je	0x140370314 <.text+0x36f314>
14037026e:     	notq	%rax
140370271:     	imulq	$0x38, %rax, %rax
140370275:     	cmpb	$0x0, 0x30(%rdx,%rax)
14037027a:     	je	0x140370314 <.text+0x36f314>
140370280:     	addq	%rax, %rdx
140370283:     	movq	0x10(%rdx), %rax
140370287:     	movl	0x5b0(%rsi), %ecx
14037028d:     	movl	%ecx, 0x2c(%rdx)
140370290:     	movb	%r12b, (%rax)
140370293:     	movb	%r15b, 0x1(%rax)
140370297:     	movb	%r14b, 0x2(%rax)
14037029b:     	movb	%r11b, 0x3(%rax)
14037029f:     	movzbl	0xb8(%rbp), %ecx
1403702a6:     	movb	%cl, 0x4(%rax)
1403702a9:     	movzbl	0xaf(%rbp), %ecx
1403702b0:     	movb	%cl, 0x5(%rax)
1403702b3:     	movzbl	0xc8(%rbp), %ecx
1403702ba:     	movb	%cl, 0x6(%rax)
1403702bd:     	movzbl	0x98(%rbp), %ecx
1403702c4:     	movb	%cl, 0x7(%rax)
1403702c7:     	movzbl	0xb0(%rbp), %ecx
1403702ce:     	movb	%cl, 0x8(%rax)
1403702d1:     	addq	$0x158, %rsp            # imm = 0x158
1403702d8:     	popq	%rbx
1403702d9:     	popq	%rdi
1403702da:     	popq	%rsi
1403702db:     	popq	%r12
1403702dd:     	popq	%r13
1403702df:     	popq	%r14
1403702e1:     	popq	%r15
1403702e3:     	popq	%rbp
1403702e4:     	retq
1403702e5:     	leaq	0xc7(%rbp), %rax
1403702ec:     	movq	%rax, -0x50(%rbp)
1403702f0:     	leaq	0x4c76379(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
1403702f7:     	movq	%rax, -0x48(%rbp)
1403702fb:     	leaq	0x5a5340e(%rip), %rcx   # 0x145dc3710
140370302:     	leaq	0x5a5cc67(%rip), %r8    # 0x145dccf70
140370309:     	leaq	-0x50(%rbp), %rdx
14037030d:     	callq	0x145d699c0 <.text+0x5d689c0>
140370312:     	ud2
140370314:     	leaq	0xc7(%rbp), %rax
14037031b:     	movq	%rax, -0x50(%rbp)
14037031f:     	leaq	0x4c7634a(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140370326:     	movq	%rax, -0x48(%rbp)
14037032a:     	leaq	0x5a533df(%rip), %rcx   # 0x145dc3710
140370331:     	leaq	0x5a5cc50(%rip), %r8    # 0x145dccf88
140370338:     	leaq	-0x50(%rbp), %rdx
14037033c:     	callq	0x145d699c0 <.text+0x5d689c0>
140370341:     	ud2
140370343:     	leaq	0xc7(%rbp), %rax
14037034a:     	movq	%rax, -0x50(%rbp)
14037034e:     	leaq	0x4c7631b(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140370355:     	movq	%rax, -0x48(%rbp)
140370359:     	leaq	0x5a533b0(%rip), %rcx   # 0x145dc3710
140370360:     	leaq	0x5a5cbf1(%rip), %r8    # 0x145dccf58
140370367:     	leaq	-0x50(%rbp), %rdx
14037036b:     	callq	0x145d699c0 <.text+0x5d689c0>
140370370:     	ud2
