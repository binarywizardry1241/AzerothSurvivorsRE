
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599cf60:     	pushq	%rbp
14599cf61:     	pushq	%r15
14599cf63:     	pushq	%r14
14599cf65:     	pushq	%rsi
14599cf66:     	pushq	%rdi
14599cf67:     	pushq	%rbx
14599cf68:     	subq	$0x48, %rsp
14599cf6c:     	leaq	0x40(%rsp), %rbp
14599cf71:     	movq	$-0x2, (%rbp)
14599cf79:     	movq	%rcx, %rsi
14599cf7c:     	cmpq	%r8, %rdx
14599cf7f:     	je	0x14599d096 <.text+0x599c096>
14599cf85:     	movq	%r8, %rdi
14599cf88:     	movq	%rdx, %rbx
14599cf8b:     	jmp	0x14599cfa0 <.text+0x599bfa0>
14599cf8d:     	nopl	(%rax)
14599cf90:     	addq	$0x160, %rbx            # imm = 0x160
14599cf97:     	cmpq	%rdi, %rbx
14599cf9a:     	je	0x14599d096 <.text+0x599c096>
14599cfa0:     	cmpb	$0x0, 0x68(%rbx)
14599cfa4:     	jne	0x14599cf90 <.text+0x599bf90>
14599cfa6:     	cmpq	$-0x1, 0x18(%rbx)
14599cfab:     	jne	0x14599cfbd <.text+0x599bfbd>
14599cfad:     	cmpq	$-0x1, 0x40(%rbx)
14599cfb2:     	jne	0x14599cfbd <.text+0x599bfbd>
14599cfb4:     	cmpb	$0x0, 0x15c(%rbx)
14599cfbb:     	je	0x14599cf90 <.text+0x599bf90>
14599cfbd:     	callq	0x140002200 <.text+0x1200>
14599cfc2:     	movl	$0x20, %ecx
14599cfc7:     	movl	$0x8, %edx
14599cfcc:     	callq	0x1400021c0 <.text+0x11c0>
14599cfd1:     	testq	%rax, %rax
14599cfd4:     	je	0x14599d0bd <.text+0x599c0bd>
14599cfda:     	movq	%rbx, (%rax)
14599cfdd:     	addq	$0x160, %rbx            # imm = 0x160
14599cfe4:     	movq	$0x4, -0x18(%rbp)
14599cfec:     	movq	%rax, -0x10(%rbp)
14599cff0:     	movq	$0x1, -0x8(%rbp)
14599cff8:     	cmpq	%rdi, %rbx
14599cffb:     	je	0x14599d07d <.text+0x599c07d>
14599d001:     	movl	$0x1, %r14d
14599d007:     	leaq	-0x18(%rbp), %r15
14599d00b:     	nopl	(%rax,%rax)
14599d010:     	cmpb	$0x0, 0x68(%rbx)
14599d014:     	jne	0x14599d02d <.text+0x599c02d>
14599d016:     	cmpq	$-0x1, 0x18(%rbx)
14599d01b:     	jne	0x14599d03b <.text+0x599c03b>
14599d01d:     	cmpq	$-0x1, 0x40(%rbx)
14599d022:     	jne	0x14599d03b <.text+0x599c03b>
14599d024:     	cmpb	$0x0, 0x15c(%rbx)
14599d02b:     	jne	0x14599d03b <.text+0x599c03b>
14599d02d:     	addq	$0x160, %rbx            # imm = 0x160
14599d034:     	cmpq	%rdi, %rbx
14599d037:     	jne	0x14599d010 <.text+0x599c010>
14599d039:     	jmp	0x14599d07d <.text+0x599c07d>
14599d03b:     	cmpq	-0x18(%rbp), %r14
14599d03f:     	jne	0x14599d066 <.text+0x599c066>
14599d041:     	movq	$0x8, 0x20(%rsp)
14599d04a:     	movl	$0x1, %r8d
14599d050:     	movl	$0x8, %r9d
14599d056:     	movq	%r15, %rcx
14599d059:     	movq	%r14, %rdx
14599d05c:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599d061:     	nop
14599d062:     	movq	-0x10(%rbp), %rax
14599d066:     	movq	%rbx, (%rax,%r14,8)
14599d06a:     	addq	$0x160, %rbx            # imm = 0x160
14599d071:     	incq	%r14
14599d074:     	movq	%r14, -0x8(%rbp)
14599d078:     	cmpq	%rdi, %rbx
14599d07b:     	jne	0x14599d010 <.text+0x599c010>
14599d07d:     	movq	-0x8(%rbp), %rax
14599d081:     	movq	%rax, 0x10(%rsi)
14599d085:     	movq	-0x18(%rbp), %rax
14599d089:     	movq	%rax, (%rsi)
14599d08c:     	movq	-0x10(%rbp), %rax
14599d090:     	movq	%rax, 0x8(%rsi)
14599d094:     	jmp	0x14599d0ad <.text+0x599c0ad>
14599d096:     	movq	$0x0, (%rsi)
14599d09d:     	movq	$0x8, 0x8(%rsi)
14599d0a5:     	movq	$0x0, 0x10(%rsi)
14599d0ad:     	movq	%rsi, %rax
14599d0b0:     	addq	$0x48, %rsp
14599d0b4:     	popq	%rbx
14599d0b5:     	popq	%rdi
14599d0b6:     	popq	%rsi
14599d0b7:     	popq	%r14
14599d0b9:     	popq	%r15
14599d0bb:     	popq	%rbp
14599d0bc:     	retq
14599d0bd:     	movl	$0x8, %ecx
14599d0c2:     	movl	$0x20, %edx
14599d0c7:     	callq	0x145d6944b <.text+0x5d6844b>
14599d0cc:     	ud2
