
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545cf50:     	pushq	%rbp
14545cf51:     	pushq	%r15
14545cf53:     	pushq	%r14
14545cf55:     	pushq	%r13
14545cf57:     	pushq	%r12
14545cf59:     	pushq	%rsi
14545cf5a:     	pushq	%rdi
14545cf5b:     	pushq	%rbx
14545cf5c:     	subq	$0x98, %rsp
14545cf63:     	leaq	0x80(%rsp), %rbp
14545cf6b:     	movq	$-0x2, 0x10(%rbp)
14545cf73:     	movq	%r9, %rdi
14545cf76:     	movl	%r8d, %ebx
14545cf79:     	movq	%rdx, %r14
14545cf7c:     	movq	%rcx, %rsi
14545cf7f:     	callq	0x140002200 <.text+0x1200>
14545cf84:     	movl	$0x20, %ecx
14545cf89:     	movl	$0x1, %edx
14545cf8e:     	callq	0x1400021c0 <.text+0x11c0>
14545cf93:     	testq	%rax, %rax
14545cf96:     	je	0x14545d279 <.text+0x545c279>
14545cf9c:     	movq	%r14, (%rax)
14545cf9f:     	movl	%ebx, 0x8(%rax)
14545cfa2:     	movq	$0x20, -0x10(%rbp)
14545cfaa:     	movq	%rax, -0x8(%rbp)
14545cfae:     	movq	$0xc, (%rbp)
14545cfb6:     	movw	$0x17d, 0x8(%rbp)       # imm = 0x17D
