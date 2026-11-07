Disassembly of section .text:

0000000140001000 <.text>:
14003cd50:     	pushq	%rbp
14003cd51:     	pushq	%r14
14003cd53:     	pushq	%rsi
14003cd54:     	pushq	%rdi
14003cd55:     	pushq	%rbx
14003cd56:     	subq	$0x130, %rsp            # imm = 0x130
14003cd5d:     	leaq	0x80(%rsp), %rbp
14003cd65:     	movq	$-0x2, 0xa8(%rbp)
14003cd70:     	movq	%r8, %rdi
14003cd73:     	movq	%rdx, %rsi
14003cd76:     	movzbl	(%r8), %r14d
14003cd7a:     	cmpb	$0x2, %r14b
14003cd7e:     	jne	0x14003cdc9 <.text+0x3bdc9>
14003cd80:     	movq	$0x1, 0x20(%rsp)
14003cd89:     	leaq	0x5d34498(%rip), %rdx   # 0x145d71228
14003cd90:     	leaq	0x5d3415a(%rip), %rbx   # 0x145d70ef1
14003cd97:     	movl	$0xb, %r8d
14003cd9d:     	movq	%rsi, %rcx
14003cda0:     	movq	%rbx, %r9
14003cda3:     	callq	0x14063a3d0 <.text+0x6393d0>
14003cda8:     	movq	$0x1, 0x20(%rsp)
14003cdb1:     	leaq	0x5d3447b(%rip), %rdx   # 0x145d71233
14003cdb8:     	movl	$0xb, %r8d
14003cdbe:     	movq	%rsi, %rcx
14003cdc1:     	movq	%rbx, %r9
14003cdc4:     	callq	0x14063a3d0 <.text+0x6393d0>
