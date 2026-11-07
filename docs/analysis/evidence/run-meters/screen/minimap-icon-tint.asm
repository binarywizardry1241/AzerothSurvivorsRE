
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140172059:     	testq	%rsi, %rsi
14017205c:     	je	0x140172142 <.text+0x171142>
140172062:     	cmpb	$0x2, %bl
140172065:     	jne	0x140172076 <.text+0x171076>
140172067:     	movq	0x30(%rsp), %rax
14017206c:     	cmpb	$0x1, 0x30(%rax)
140172070:     	jne	0x140172108 <.text+0x171108>
140172076:     	movups	0x5c44967(%rip), %xmm0  # 0x145db69e4
14017207d:     	movaps	%xmm0, 0x50(%rsp)
140172082:     	movl	$0x3f800000, 0x60(%rsp) # imm = 0x3F800000
14017208a:     	jmp	0x14017211c <.text+0x17111c>
14017208f:     	leaq	(%rdx,%rdx,2), %r14
140172093:     	shlq	$0x7, %r14
140172097:     	addq	%r14, %rsi
14017209a:     	leaq	(%rcx,%rdx,4), %r14
14017209e:     	movq	%rdx, %rcx
1401720a1:     	shlq	$0x5, %rcx
1401720a5:     	addq	%rcx, %r11
1401720a8:     	leaq	(,%rdx,4), %rcx
1401720b0:     	addq	%r13, %rcx
1401720b3:     	movq	%rcx, 0x48(%rsp)
1401720b8:     	addq	%rdx, 0x20(%rsp)
1401720bd:     	movb	$0x1, %r12b
1401720c0:     	movl	$0x8, %r13d
1401720c6:     	jmp	0x140171a0b <.text+0x170a0b>
1401720cb:     	movq	%r13, %r14
1401720ce:     	addq	%rdx, %r14
1401720d1:     	movl	0x8(%r14), %edx
1401720d5:     	notl	%edx
1401720d7:     	leaq	(%rdx,%rdx,2), %r14
1401720db:     	shlq	$0x7, %r14
1401720df:     	addq	%r14, %rsi
1401720e2:     	leaq	(%rax,%rdx,4), %r14
1401720e6:     	leaq	(%rcx,%rdx,4), %rax
1401720ea:     	movq	%rax, 0x48(%rsp)
1401720ef:     	addq	%rdx, 0x20(%rsp)
1401720f4:     	shlq	$0x5, %rdx
1401720f8:     	addq	%rdx, %r11
1401720fb:     	movb	$0x1, %r12b
1401720fe:     	movl	$0x8, %eax
140172103:     	jmp	0x140171a0b <.text+0x170a0b>
140172108:     	movaps	0x5c43db1(%rip), %xmm0  # 0x145db5ec0
14017210f:     	movups	%xmm0, 0x54(%rsp)
140172114:     	movl	$0x0, 0x50(%rsp)
14017211c:     	addq	$0x38, %rsi
140172120:     	leaq	0x50(%rsp), %rdx
140172125:     	movq	%rsi, %rcx
140172128:     	callq	0x140186410 <.text+0x185410>
14017212d:     	testb	%al, %al
14017212f:     	jne	0x140172142 <.text+0x171142>
140172131:     	movl	%ebp, (%rdi)
140172133:     	movl	0x60(%rsp), %eax
140172137:     	movl	%eax, 0x10(%rsi)
14017213a:     	movaps	0x50(%rsp), %xmm0
14017213f:     	movups	%xmm0, (%rsi)
