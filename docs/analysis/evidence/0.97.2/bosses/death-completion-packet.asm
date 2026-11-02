
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543fb70:     	pushq	%rbp
14543fb71:     	pushq	%rsi
14543fb72:     	pushq	%rdi
14543fb73:     	pushq	%rbx
14543fb74:     	subq	$0x78, %rsp
14543fb78:     	leaq	0x70(%rsp), %rbp
14543fb7d:     	movq	$-0x2, (%rbp)
14543fb85:     	movl	%r8d, %edi
14543fb88:     	movq	%rdx, %rbx
14543fb8b:     	movq	%rcx, %rsi
14543fb8e:     	callq	0x140002200 <.text+0x1200>
14543fb93:     	movl	$0x20, %ecx
14543fb98:     	movl	$0x1, %edx
14543fb9d:     	callq	0x1400021c0 <.text+0x11c0>
14543fba2:     	testq	%rax, %rax
14543fba5:     	je	0x14543fc4a <.text+0x543ec4a>
14543fbab:     	movw	$0xe8, -0x28(%rbp)
14543fbb1:     	movq	$0x20, -0x40(%rbp)
14543fbb9:     	movq	%rax, -0x38(%rbp)
14543fbbd:     	movq	$0x0, -0x30(%rbp)
14543fbc5:     	leaq	-0x40(%rbp), %rdx
14543fbc9:     	movq	%rbx, %rcx
14543fbcc:     	callq	0x145509090 <.text+0x5508090>
14543fbd1:     	nop
14543fbd2:     	movups	-0x40(%rbp), %xmm0
14543fbd6:     	movups	-0x30(%rbp), %xmm1
14543fbda:     	movaps	%xmm1, -0x10(%rbp)
14543fbde:     	movaps	%xmm0, -0x20(%rbp)
14543fbe2:     	movq	-0x10(%rbp), %rdx
14543fbe6:     	movq	-0x20(%rbp), %rax
14543fbea:     	subq	%rdx, %rax
14543fbed:     	cmpq	$0x3, %rax
14543fbf1:     	jbe	0x14543fc25 <.text+0x543ec25>
14543fbf3:     	movq	-0x18(%rbp), %rax
14543fbf7:     	movl	%edi, (%rax,%rdx)
14543fbfa:     	addq	$0x4, %rdx
14543fbfe:     	movq	%rdx, -0x10(%rbp)
14543fc02:     	movaps	-0x20(%rbp), %xmm0
14543fc06:     	movups	%xmm0, (%rsi)
14543fc09:     	movq	-0x10(%rbp), %rax
14543fc0d:     	movq	%rax, 0x10(%rsi)
14543fc11:     	movq	-0x8(%rbp), %rax
14543fc15:     	movq	%rax, 0x18(%rsi)
14543fc19:     	movq	%rsi, %rax
14543fc1c:     	addq	$0x78, %rsp
14543fc20:     	popq	%rbx
14543fc21:     	popq	%rdi
14543fc22:     	popq	%rsi
14543fc23:     	popq	%rbp
14543fc24:     	retq
14543fc25:     	movq	$0x1, 0x20(%rsp)
14543fc2e:     	leaq	-0x20(%rbp), %rcx
14543fc32:     	movl	$0x4, %r8d
14543fc38:     	movl	$0x1, %r9d
14543fc3e:     	callq	0x145757d40 <.text+0x5756d40>
14543fc43:     	nop
14543fc44:     	movq	-0x10(%rbp), %rdx
14543fc48:     	jmp	0x14543fbf3 <.text+0x543ebf3>
14543fc4a:     	movl	$0x1, %ecx
14543fc4f:     	movl	$0x20, %edx
14543fc54:     	callq	0x1458e721b <.text+0x58e621b>
14543fc59:     	ud2
