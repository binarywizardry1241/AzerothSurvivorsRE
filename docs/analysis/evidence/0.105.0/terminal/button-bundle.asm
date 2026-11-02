
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140191ec0:     	pushq	%rbp
140191ec1:     	pushq	%r15
140191ec3:     	pushq	%r14
140191ec5:     	pushq	%r13
140191ec7:     	pushq	%r12
140191ec9:     	pushq	%rsi
140191eca:     	pushq	%rdi
140191ecb:     	pushq	%rbx
140191ecc:     	subq	$0x268, %rsp            # imm = 0x268
140191ed3:     	leaq	0x80(%rsp), %rbp
140191edb:     	movq	$-0x2, 0x1e0(%rbp)
140191ee6:     	movq	%r8, 0x1d0(%rbp)
140191eed:     	movq	%rdx, %rbx
140191ef0:     	movq	%rcx, %rsi
140191ef3:     	movq	0x8(%rdx), %rdi
140191ef7:     	movb	$0x1, 0x1df(%rbp)
140191efe:     	movq	%rdi, %rcx
140191f01:     	callq	0x144e07d20 <.text+0x4e06d20>
140191f06:     	nop
140191f07:     	movq	%rax, %r14
140191f0a:     	movq	0x10(%rbx), %r15
140191f0e:     	movq	0x18(%rbx), %r12
140191f12:     	testq	%r15, %r15
140191f15:     	movq	%rdi, 0x1c0(%rbp)
140191f1c:     	je	0x140191f9c <.text+0x190f9c>
140191f1e:     	movq	%r12, 0x1c8(%rbp)
140191f25:     	leaq	-0x58(%rbp), %rcx
140191f29:     	movl	$0x210, %r8d            # imm = 0x210
140191f2f:     	movq	0x1d0(%rbp), %r12
140191f36:     	movq	%r12, %rdx
140191f39:     	callq	0x145bc977b <.text+0x5bc877b>
140191f3e:     	movq	%r14, 0x1b8(%rbp)
140191f45:     	movq	(%r15), %rax
140191f48:     	movq	0x10(%r15), %r13
140191f4c:     	subq	%r13, %rax
140191f4f:     	cmpq	$0x21f, %rax            # imm = 0x21F
140191f55:     	jbe	0x14019204b <.text+0x19104b>
140191f5b:     	movq	0x8(%r15), %rdi
140191f5f:     	leaq	0x9411a(%rip), %rax     # 0x140226080 <.text+0x225080>
140191f66:     	movq	%rax, (%rdi,%r13)
140191f6a:     	leaq	(%rdi,%r13), %rcx
140191f6e:     	addq	$0x8, %rcx
140191f72:     	movl	$0x210, %r8d            # imm = 0x210
140191f78:     	movq	%r12, %rdx
140191f7b:     	callq	0x145bc977b <.text+0x5bc877b>
140191f80:     	movq	%r14, 0x218(%rdi,%r13)
140191f88:     	addq	$0x220, %r13            # imm = 0x220
140191f8f:     	movq	%r13, 0x10(%r15)
140191f93:     	movq	0x1c8(%rbp), %r12
140191f9a:     	jmp	0x14019200f <.text+0x19100f>
140191f9c:     	leaq	-0x58(%rbp), %rcx
140191fa0:     	movl	$0x210, %r8d            # imm = 0x210
140191fa6:     	movq	0x1d0(%rbp), %rdx
140191fad:     	callq	0x145bc977b <.text+0x5bc877b>
140191fb2:     	movq	%r14, 0x1b8(%rbp)
140191fb9:     	movq	(%r12), %rax
140191fbd:     	movq	0x10(%r12), %r13
140191fc2:     	subq	%r13, %rax
140191fc5:     	cmpq	$0x21f, %rax            # imm = 0x21F
140191fcb:     	jbe	0x140192071 <.text+0x191071>
140191fd1:     	movq	0x8(%r12), %rdi
140191fd6:     	leaq	0x940a3(%rip), %rax     # 0x140226080 <.text+0x225080>
140191fdd:     	movq	%rax, (%rdi,%r13)
140191fe1:     	leaq	(%rdi,%r13), %rcx
140191fe5:     	addq	$0x8, %rcx
140191fe9:     	movl	$0x210, %r8d            # imm = 0x210
140191fef:     	movq	0x1d0(%rbp), %rdx
140191ff6:     	callq	0x145bc977b <.text+0x5bc877b>
140191ffb:     	movq	%r14, 0x218(%rdi,%r13)
140192003:     	addq	$0x220, %r13            # imm = 0x220
14019200a:     	movq	%r13, 0x10(%r12)
14019200f:     	movq	(%rbx), %rax
140192012:     	movq	0x20(%rbx), %rcx
140192016:     	movq	%r14, (%rsi)
140192019:     	movq	%rax, 0x8(%rsi)
14019201d:     	movq	0x1c0(%rbp), %rax
140192024:     	movq	%rax, 0x10(%rsi)
140192028:     	movq	%r15, 0x18(%rsi)
14019202c:     	movq	%r12, 0x20(%rsi)
140192030:     	movq	%rcx, 0x28(%rsi)
140192034:     	movq	%rsi, %rax
140192037:     	addq	$0x268, %rsp            # imm = 0x268
14019203e:     	popq	%rbx
14019203f:     	popq	%rdi
140192040:     	popq	%rsi
140192041:     	popq	%r12
140192043:     	popq	%r13
140192045:     	popq	%r14
140192047:     	popq	%r15
140192049:     	popq	%rbp
14019204a:     	retq
14019204b:     	movq	$0x1, 0x20(%rsp)
140192054:     	movl	$0x220, %r8d            # imm = 0x220
14019205a:     	movl	$0x1, %r9d
140192060:     	movq	%r15, %rcx
140192063:     	movq	%r13, %rdx
140192066:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14019206b:     	nop
14019206c:     	jmp	0x140191f5b <.text+0x190f5b>
140192071:     	movq	$0x1, 0x20(%rsp)
14019207a:     	movl	$0x220, %r8d            # imm = 0x220
140192080:     	movl	$0x1, %r9d
140192086:     	movq	%r12, %rcx
140192089:     	movq	%r13, %rdx
14019208c:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140192091:     	nop
140192092:     	jmp	0x140191fd1 <.text+0x190fd1>
