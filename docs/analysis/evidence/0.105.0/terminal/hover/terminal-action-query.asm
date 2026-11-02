
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140397ce0:     	pushq	%rbp
140397ce1:     	pushq	%r15
140397ce3:     	pushq	%r14
140397ce5:     	pushq	%rsi
140397ce6:     	pushq	%rdi
140397ce7:     	pushq	%rbx
140397ce8:     	subq	$0x2d8, %rsp            # imm = 0x2D8
140397cef:     	leaq	0x80(%rsp), %rbp
140397cf7:     	movq	$-0x2, 0x250(%rbp)
140397d02:     	movq	%rdx, %rdi
140397d05:     	movq	%rcx, %rsi
140397d08:     	movq	%rdx, %rcx
140397d0b:     	callq	0x140295cf0 <.text+0x294cf0>
140397d10:     	movq	%rax, %rbx
140397d13:     	movq	%rdi, %rcx
140397d16:     	callq	0x1402a6930 <.text+0x2a5930>
140397d1b:     	movq	%rax, %r14
140397d1e:     	movq	%rdi, %rcx
140397d21:     	callq	0x1402a2340 <.text+0x2a1340>
140397d26:     	movq	%rbx, 0x230(%rbp)
140397d2d:     	movq	%r14, 0x238(%rbp)
140397d34:     	movq	%rax, 0x240(%rbp)
140397d3b:     	movq	%rdi, %rcx
140397d3e:     	callq	0x140295cf0 <.text+0x294cf0>
140397d43:     	movq	%rax, %rbx
140397d46:     	leaq	-0x60(%rbp), %r14
140397d4a:     	movq	%r14, %rcx
140397d4d:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140397d52:     	movb	$0x1, 0x24f(%rbp)
140397d59:     	leaq	0x230(%rbp), %rcx
140397d60:     	movq	%r14, %rdx
140397d63:     	callq	0x14008b590 <.text+0x8a590>
140397d68:     	nop
140397d69:     	movb	$0x1, 0x24f(%rbp)
140397d70:     	leaq	0x50(%rbp), %rcx
140397d74:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140397d79:     	nop
140397d7a:     	movzbl	0xe1(%rbp), %eax
140397d81:     	cmpq	0x90(%rbp), %rbx
140397d88:     	jae	0x140397e7f <.text+0x396e7f>
140397d8e:     	movq	0x80(%rbp), %rcx
140397d95:     	movq	%rbx, %rdx
140397d98:     	shrq	$0x6, %rdx
140397d9c:     	movq	(%rcx,%rdx,8), %rcx
140397da0:     	btq	%rbx, %rcx
140397da4:     	sbbb	$0x0, %al
140397da6:     	jne	0x140397e87 <.text+0x396e87>
140397dac:     	leaq	0x50(%rbp), %rcx
140397db0:     	movq	%rbx, %rdx
140397db3:     	callq	0x144e62670 <.text+0x4e61670>
140397db8:     	nop
140397db9:     	leaq	-0x60(%rbp), %rcx
140397dbd:     	leaq	0x50(%rbp), %rdx
140397dc1:     	callq	0x144e629e0 <.text+0x4e619e0>
140397dc6:     	nop
140397dc7:     	movb	$0x1, %r14b
140397dca:     	cmpq	$0x0, 0x90(%rdi)
140397dd2:     	je	0x140397f1a <.text+0x396f1a>
140397dd8:     	movq	0x78(%rdi), %rax
140397ddc:     	movq	0x80(%rdi), %rcx
140397de3:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
140397ded:     	xorl	%r8d, %r8d
140397df0:     	movdqa	0x5a2b118(%rip), %xmm0  # 0x145dc2f10
140397df8:     	pcmpeqd	%xmm1, %xmm1
140397dfc:     	movdqa	0x5a35c2c(%rip), %xmm2  # 0x145dcda30
140397e04:     	andq	%rcx, %rdx
140397e07:     	movdqu	(%rax,%rdx), %xmm3
140397e0c:     	movdqa	%xmm3, %xmm4
140397e10:     	pcmpeqb	%xmm0, %xmm4
140397e14:     	pmovmskb	%xmm4, %r9d
140397e19:     	testl	%r9d, %r9d
140397e1c:     	je	0x140397e60 <.text+0x396e60>
140397e1e:     	tzcntl	%r9d, %r10d
140397e23:     	addq	%rdx, %r10
140397e26:     	andq	%rcx, %r10
140397e29:     	negq	%r10
140397e2c:     	leaq	(%r10,%r10,2), %r10
140397e30:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140397e37:     	pcmpeqb	%xmm2, %xmm4
140397e3b:     	pmovmskb	%xmm4, %r11d
140397e40:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140397e47:     	je	0x140397ec0 <.text+0x396ec0>
140397e49:     	leal	-0x1(%r9), %r10d
140397e4d:     	andw	%r9w, %r10w
140397e51:     	movl	%r10d, %r9d
140397e54:     	jne	0x140397e1e <.text+0x396e1e>
140397e56:     	nopw	%cs:(%rax,%rax)
140397e60:     	pcmpeqb	%xmm1, %xmm3
140397e64:     	pmovmskb	%xmm3, %r9d
140397e69:     	testl	%r9d, %r9d
140397e6c:     	jne	0x140397f1a <.text+0x396f1a>
140397e72:     	addq	%r8, %rdx
140397e75:     	addq	$0x10, %rdx
140397e79:     	addq	$0x10, %r8
140397e7d:     	jmp	0x140397e04 <.text+0x396e04>
140397e7f:     	testb	%al, %al
140397e81:     	je	0x140397dac <.text+0x396dac>
140397e87:     	leaq	0x24e(%rbp), %rax
140397e8e:     	movq	%rax, 0x100(%rbp)
140397e95:     	leaq	0x4c4e7d4(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140397e9c:     	movq	%rax, 0x108(%rbp)
140397ea3:     	leaq	0x5a35ce6(%rip), %rcx   # 0x145dcdb90
140397eaa:     	leaq	0x5a35dbf(%rip), %r8    # 0x145dcdc70
140397eb1:     	leaq	0x100(%rbp), %rdx
140397eb8:     	callq	0x145d699c0 <.text+0x5d689c0>
140397ebd:     	nop
140397ebe:     	ud2
140397ec0:     	leaq	(%rax,%r10,8), %rax
140397ec4:     	movq	-0x8(%rax), %rax
140397ec8:     	cmpq	0x218(%rdi), %rax
140397ecf:     	jae	0x140397f1a <.text+0x396f1a>
140397ed1:     	movq	0x210(%rdi), %rcx
140397ed8:     	movq	(%rcx,%rax,8), %rcx
140397edc:     	testq	%rcx, %rcx
140397edf:     	je	0x140397f1a <.text+0x396f1a>
140397ee1:     	movq	0x1e0(%rdi), %rax
140397ee8:     	notq	%rcx
140397eeb:     	imulq	$0x38, %rcx, %rcx
140397eef:     	cmpb	$0x1, 0x30(%rax,%rcx)
140397ef4:     	jne	0x140397f1a <.text+0x396f1a>
140397ef6:     	addq	%rcx, %rax
140397ef9:     	movq	0x10(%rax), %r14
140397efd:     	leaq	-0x60(%rbp), %rdx
140397f01:     	movq	%r14, %rcx
140397f04:     	callq	0x144df2410 <.text+0x4df1410>
140397f09:     	nop
140397f0a:     	leaq	0x40(%rdi), %rdx
140397f0e:     	movq	%r14, %rcx
140397f11:     	callq	0x144df2570 <.text+0x4df1570>
140397f16:     	nop
140397f17:     	movl	%eax, %r14d
140397f1a:     	movq	0x5a0(%rdi), %r15
140397f21:     	leaq	0x140(%rbp), %rcx
140397f28:     	leaq	-0x60(%rbp), %rdx
140397f2c:     	movl	$0xb0, %r8d
140397f32:     	callq	0x145bc977b <.text+0x5bc877b>
140397f37:     	movq	%r15, 0x100(%rbp)
140397f3e:     	movl	$0x0, 0x108(%rbp)
140397f48:     	movq	$0x10, 0x110(%rbp)
140397f53:     	pxor	%xmm0, %xmm0
140397f57:     	movdqu	%xmm0, 0x118(%rbp)
140397f5f:     	movq	$0x10, 0x128(%rbp)
140397f6a:     	movdqu	%xmm0, 0x130(%rbp)
140397f72:     	movq	$0x0, 0x1f0(%rbp)
140397f7d:     	movq	$0x4, 0x1f8(%rbp)
140397f88:     	movq	$0x0, 0x200(%rbp)
140397f93:     	movb	%r14b, 0x208(%rbp)
140397f9a:     	movdqu	0x230(%rbp), %xmm0
140397fa2:     	movdqu	%xmm0, 0x210(%rbp)
140397faa:     	movq	0x240(%rbp), %rax
140397fb1:     	movq	%rax, 0x220(%rbp)
140397fb8:     	movq	%rbx, 0x228(%rbp)
140397fbf:     	movb	$0x0, 0x24f(%rbp)
140397fc6:     	leaq	0x50(%rbp), %rcx
140397fca:     	callq	0x1403721e0 <.text+0x3711e0>
140397fcf:     	nop
140397fd0:     	leaq	0x100(%rbp), %rcx
140397fd7:     	movq	%rdi, %rdx
140397fda:     	callq	0x1403970d0 <.text+0x3960d0>
140397fdf:     	nop
140397fe0:     	leaq	0x100(%rbp), %rdx
140397fe7:     	movl	$0x130, %r8d            # imm = 0x130
140397fed:     	movq	%rsi, %rcx
140397ff0:     	callq	0x145bc977b <.text+0x5bc877b>
140397ff5:     	movq	%rsi, %rax
140397ff8:     	addq	$0x2d8, %rsp            # imm = 0x2D8
140397fff:     	popq	%rbx
140398000:     	popq	%rdi
140398001:     	popq	%rsi
140398002:     	popq	%r14
140398004:     	popq	%r15
140398006:     	popq	%rbp
140398007:     	retq
