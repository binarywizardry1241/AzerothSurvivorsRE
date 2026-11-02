
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552ef30:     	pushq	%rbp
14552ef31:     	pushq	%r15
14552ef33:     	pushq	%r14
14552ef35:     	pushq	%r13
14552ef37:     	pushq	%r12
14552ef39:     	pushq	%rsi
14552ef3a:     	pushq	%rdi
14552ef3b:     	pushq	%rbx
14552ef3c:     	subq	$0x48, %rsp
14552ef40:     	leaq	0x40(%rsp), %rbp
14552ef45:     	movq	$-0x2, (%rbp)
14552ef4d:     	movq	%rcx, %rsi
14552ef50:     	movq	(%rdx), %r15
14552ef53:     	movq	0x8(%rdx), %r14
14552ef57:     	cmpq	%r14, %r15
14552ef5a:     	je	0x14552f077 <.text+0x552e077>
14552ef60:     	movq	0x10(%rdx), %rdi
14552ef64:     	movq	0x18(%rdx), %r12
14552ef68:     	addq	$0x50, %r15
14552ef6c:     	jmp	0x14552ef90 <.text+0x552df90>
14552ef6e:     	nop
14552ef70:     	leaq	0x1(%rdi), %rax
14552ef74:     	movq	%rax, 0x10(%rdx)
14552ef78:     	leaq	-0x50(%r15), %rax
14552ef7c:     	addq	$0x50, %r15
14552ef80:     	incq	%rdi
14552ef83:     	addq	$0x50, %rax
14552ef87:     	cmpq	%r14, %rax
14552ef8a:     	je	0x14552f077 <.text+0x552e077>
14552ef90:     	cmpb	$0x0, -0x4(%r15)
14552ef95:     	jne	0x14552ef70 <.text+0x552df70>
14552ef97:     	movss	(%r12), %xmm0
14552ef9d:     	leaq	0x1(%rdi), %r13
14552efa1:     	ucomiss	-0x8(%r15), %xmm0
14552efa6:     	movq	%r13, 0x10(%rdx)
14552efaa:     	jb	0x14552ef78 <.text+0x552df78>
14552efac:     	movq	%r15, (%rdx)
14552efaf:     	callq	0x140002200 <.text+0x1200>
14552efb4:     	movl	$0x20, %ecx
14552efb9:     	movl	$0x8, %edx
14552efbe:     	callq	0x1400021c0 <.text+0x11c0>
14552efc3:     	testq	%rax, %rax
14552efc6:     	je	0x14552f0a2 <.text+0x552e0a2>
14552efcc:     	movq	%rdi, (%rax)
14552efcf:     	movq	$0x4, -0x18(%rbp)
14552efd7:     	movq	%rax, -0x10(%rbp)
14552efdb:     	movq	$0x1, -0x8(%rbp)
14552efe3:     	cmpq	%r14, %r15
14552efe6:     	je	0x14552f05e <.text+0x552e05e>
14552efe8:     	movl	$0x1, %edi
14552efed:     	leaq	-0x18(%rbp), %rbx
14552eff1:     	addq	$0x50, %r15
14552eff5:     	jmp	0x14552f00c <.text+0x552e00c>
14552eff7:     	nopw	(%rax,%rax)
14552f000:     	incq	%r13
14552f003:     	cmpq	%r14, %r15
14552f006:     	leaq	0x50(%r15), %r15
14552f00a:     	je	0x14552f05e <.text+0x552e05e>
14552f00c:     	cmpb	$0x0, -0x4(%r15)
14552f011:     	jne	0x14552f000 <.text+0x552e000>
14552f013:     	movss	(%r12), %xmm0
14552f019:     	ucomiss	-0x8(%r15), %xmm0
14552f01e:     	jb	0x14552f000 <.text+0x552e000>
14552f020:     	cmpq	-0x18(%rbp), %rdi
14552f024:     	jne	0x14552f04b <.text+0x552e04b>
14552f026:     	movq	$0x8, 0x20(%rsp)
14552f02f:     	movl	$0x1, %r8d
14552f035:     	movl	$0x8, %r9d
14552f03b:     	movq	%rbx, %rcx
14552f03e:     	movq	%rdi, %rdx
14552f041:     	callq	0x145757d40 <.text+0x5756d40>
14552f046:     	nop
14552f047:     	movq	-0x10(%rbp), %rax
14552f04b:     	movq	%r13, (%rax,%rdi,8)
14552f04f:     	incq	%r13
14552f052:     	incq	%rdi
14552f055:     	movq	%rdi, -0x8(%rbp)
14552f059:     	cmpq	%r14, %r15
14552f05c:     	jne	0x14552eff1 <.text+0x552dff1>
14552f05e:     	movq	-0x8(%rbp), %rax
14552f062:     	movq	%rax, 0x10(%rsi)
14552f066:     	movq	-0x18(%rbp), %rax
14552f06a:     	movq	%rax, (%rsi)
14552f06d:     	movq	-0x10(%rbp), %rax
14552f071:     	movq	%rax, 0x8(%rsi)
14552f075:     	jmp	0x14552f08e <.text+0x552e08e>
14552f077:     	movq	$0x0, (%rsi)
14552f07e:     	movq	$0x8, 0x8(%rsi)
14552f086:     	movq	$0x0, 0x10(%rsi)
14552f08e:     	movq	%rsi, %rax
14552f091:     	addq	$0x48, %rsp
14552f095:     	popq	%rbx
14552f096:     	popq	%rdi
14552f097:     	popq	%rsi
14552f098:     	popq	%r12
14552f09a:     	popq	%r13
14552f09c:     	popq	%r14
14552f09e:     	popq	%r15
14552f0a0:     	popq	%rbp
14552f0a1:     	retq
14552f0a2:     	movl	$0x8, %ecx
14552f0a7:     	movl	$0x20, %edx
14552f0ac:     	callq	0x1458e721b <.text+0x58e621b>
14552f0b1:     	ud2
