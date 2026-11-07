
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140392db0:     	pushq	%rbp
140392db1:     	pushq	%r15
140392db3:     	pushq	%r14
140392db5:     	pushq	%r12
140392db7:     	pushq	%rsi
140392db8:     	pushq	%rdi
140392db9:     	pushq	%rbx
140392dba:     	subq	$0x2f0, %rsp            # imm = 0x2F0
140392dc1:     	leaq	0x80(%rsp), %rbp
140392dc9:     	movq	$-0x2, 0x268(%rbp)
140392dd4:     	movq	%rdx, %rdi
140392dd7:     	movq	%rcx, %rsi
140392dda:     	movq	%rdx, %rcx
140392ddd:     	callq	0x1402a99a0 <.text+0x2a89a0>
140392de2:     	movq	%rax, %rbx
140392de5:     	movq	%rdi, %rcx
140392de8:     	callq	0x140295cf0 <.text+0x294cf0>
140392ded:     	movq	%rax, %r14
140392df0:     	movq	%rdi, %rcx
140392df3:     	callq	0x140294c10 <.text+0x293c10>
140392df8:     	movq	%rax, %r15
140392dfb:     	movq	%rdi, %rcx
140392dfe:     	callq	0x140299940 <.text+0x298940>
140392e03:     	movq	%rax, %r12
140392e06:     	movq	%rdi, %rcx
140392e09:     	callq	0x1402967d0 <.text+0x2957d0>
140392e0e:     	movq	%rbx, 0x238(%rbp)
140392e15:     	movq	%r14, 0x240(%rbp)
140392e1c:     	movq	%r15, 0x248(%rbp)
140392e23:     	movq	%r12, 0x250(%rbp)
140392e2a:     	movq	%rax, 0x258(%rbp)
140392e31:     	leaq	0x50(%rbp), %rbx
140392e35:     	movq	%rbx, %rcx
140392e38:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140392e3d:     	movb	$0x1, 0x267(%rbp)
140392e44:     	leaq	0x238(%rbp), %rcx
140392e4b:     	movq	%rbx, %rdx
140392e4e:     	callq	0x1401385f0 <.text+0x1375f0>
140392e53:     	nop
140392e54:     	movb	$0x1, 0x267(%rbp)
140392e5b:     	leaq	-0x60(%rbp), %rcx
140392e5f:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140392e64:     	nop
140392e65:     	leaq	0x50(%rbp), %rcx
140392e69:     	leaq	-0x60(%rbp), %rdx
140392e6d:     	callq	0x144e629e0 <.text+0x4e619e0>
140392e72:     	nop
140392e73:     	movb	$0x1, %bl
140392e75:     	cmpq	$0x0, 0x90(%rdi)
140392e7d:     	je	0x140392f84 <.text+0x391f84>
140392e83:     	movq	0x78(%rdi), %rax
140392e87:     	movq	0x80(%rdi), %rcx
140392e8e:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
140392e98:     	xorl	%r8d, %r8d
140392e9b:     	movdqa	0x5a3006d(%rip), %xmm0  # 0x145dc2f10
140392ea3:     	pcmpeqd	%xmm1, %xmm1
140392ea7:     	movdqa	0x5a3ab81(%rip), %xmm2  # 0x145dcda30
140392eaf:     	andq	%rcx, %rdx
140392eb2:     	movdqu	(%rax,%rdx), %xmm3
140392eb7:     	movdqa	%xmm3, %xmm4
140392ebb:     	pcmpeqb	%xmm0, %xmm4
140392ebf:     	pmovmskb	%xmm4, %r9d
140392ec4:     	testl	%r9d, %r9d
140392ec7:     	je	0x140392f10 <.text+0x391f10>
140392ec9:     	tzcntl	%r9d, %r10d
140392ece:     	addq	%rdx, %r10
140392ed1:     	andq	%rcx, %r10
140392ed4:     	negq	%r10
140392ed7:     	leaq	(%r10,%r10,2), %r10
140392edb:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140392ee2:     	pcmpeqb	%xmm2, %xmm4
140392ee6:     	pmovmskb	%xmm4, %r11d
140392eeb:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140392ef2:     	je	0x140392f2b <.text+0x391f2b>
140392ef4:     	leal	-0x1(%r9), %r10d
140392ef8:     	andw	%r9w, %r10w
140392efc:     	movl	%r10d, %r9d
140392eff:     	jne	0x140392ec9 <.text+0x391ec9>
140392f01:     	nopw	%cs:(%rax,%rax)
140392f10:     	pcmpeqb	%xmm1, %xmm3
140392f14:     	pmovmskb	%xmm3, %r9d
140392f19:     	testl	%r9d, %r9d
140392f1c:     	jne	0x140392f84 <.text+0x391f84>
140392f1e:     	addq	%r8, %rdx
140392f21:     	addq	$0x10, %rdx
140392f25:     	addq	$0x10, %r8
140392f29:     	jmp	0x140392eaf <.text+0x391eaf>
140392f2b:     	leaq	(%rax,%r10,8), %rax
140392f2f:     	movq	-0x8(%rax), %rax
140392f33:     	cmpq	0x218(%rdi), %rax
140392f3a:     	jae	0x140392f84 <.text+0x391f84>
140392f3c:     	movq	0x210(%rdi), %rcx
140392f43:     	movq	(%rcx,%rax,8), %rcx
140392f47:     	testq	%rcx, %rcx
140392f4a:     	je	0x140392f84 <.text+0x391f84>
140392f4c:     	movq	0x1e0(%rdi), %rax
140392f53:     	notq	%rcx
140392f56:     	imulq	$0x38, %rcx, %rcx
140392f5a:     	cmpb	$0x1, 0x30(%rax,%rcx)
140392f5f:     	jne	0x140392f84 <.text+0x391f84>
140392f61:     	addq	%rcx, %rax
140392f64:     	movq	0x10(%rax), %rbx
140392f68:     	leaq	0x50(%rbp), %rdx
140392f6c:     	movq	%rbx, %rcx
140392f6f:     	callq	0x144df2410 <.text+0x4df1410>
140392f74:     	nop
140392f75:     	leaq	0x40(%rdi), %rdx
140392f79:     	movq	%rbx, %rcx
140392f7c:     	callq	0x144df2570 <.text+0x4df1570>
140392f81:     	nop
140392f82:     	movl	%eax, %ebx
140392f84:     	movq	0x5a0(%rdi), %r14
140392f8b:     	leaq	0x140(%rbp), %rcx
140392f92:     	leaq	0x50(%rbp), %rdx
140392f96:     	movl	$0xb0, %r8d
140392f9c:     	callq	0x145bc977b <.text+0x5bc877b>
140392fa1:     	movq	%r14, 0x100(%rbp)
140392fa8:     	movl	$0x0, 0x108(%rbp)
140392fb2:     	movq	$0x10, 0x110(%rbp)
140392fbd:     	pxor	%xmm0, %xmm0
140392fc1:     	movdqu	%xmm0, 0x118(%rbp)
140392fc9:     	movq	$0x10, 0x128(%rbp)
140392fd4:     	movdqu	%xmm0, 0x130(%rbp)
140392fdc:     	movq	$0x0, 0x1f0(%rbp)
140392fe7:     	movq	$0x4, 0x1f8(%rbp)
140392ff2:     	movq	$0x0, 0x200(%rbp)
140392ffd:     	movb	%bl, 0x208(%rbp)
140393003:     	movdqu	0x238(%rbp), %xmm0
14039300b:     	movdqu	0x248(%rbp), %xmm1
140393013:     	movdqu	%xmm0, 0x210(%rbp)
14039301b:     	movdqu	%xmm1, 0x220(%rbp)
140393023:     	movq	0x258(%rbp), %rax
14039302a:     	movq	%rax, 0x230(%rbp)
140393031:     	movb	$0x0, 0x267(%rbp)
140393038:     	leaq	-0x60(%rbp), %rcx
14039303c:     	callq	0x1403721e0 <.text+0x3711e0>
140393041:     	nop
140393042:     	leaq	0x100(%rbp), %rcx
140393049:     	movq	%rdi, %rdx
14039304c:     	callq	0x14038aaf0 <.text+0x389af0>
140393051:     	nop
140393052:     	leaq	0x100(%rbp), %rdx
140393059:     	movl	$0x138, %r8d            # imm = 0x138
14039305f:     	movq	%rsi, %rcx
140393062:     	callq	0x145bc977b <.text+0x5bc877b>
140393067:     	movq	%rsi, %rax
14039306a:     	addq	$0x2f0, %rsp            # imm = 0x2F0
140393071:     	popq	%rbx
140393072:     	popq	%rdi
140393073:     	popq	%rsi
140393074:     	popq	%r12
140393076:     	popq	%r14
140393078:     	popq	%r15
14039307a:     	popq	%rbp
14039307b:     	retq
