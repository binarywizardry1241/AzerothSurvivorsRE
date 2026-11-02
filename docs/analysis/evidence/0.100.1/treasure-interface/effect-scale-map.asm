
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145544de0:     	pushq	%rbp
145544de1:     	pushq	%r14
145544de3:     	pushq	%rsi
145544de4:     	pushq	%rdi
145544de5:     	pushq	%rbx
145544de6:     	subq	$0x60, %rsp
145544dea:     	leaq	0x60(%rsp), %rbp
145544def:     	movq	$-0x2, -0x8(%rbp)
145544df7:     	movq	%rcx, %rsi
145544dfa:     	movq	(%rdx), %rax
145544dfd:     	movq	0x8(%rdx), %rcx
145544e01:     	movq	%rcx, %rdi
145544e04:     	subq	%rax, %rdi
145544e07:     	movabsq	$0x7ffffffffffffff8, %r8 # imm = 0x7FFFFFFFFFFFFFF8
145544e11:     	cmpq	%r8, %rdi
145544e14:     	jbe	0x145544e25 <.text+0x5543e25>
145544e16:     	xorl	%ebx, %ebx
145544e18:     	movq	%rbx, %rcx
145544e1b:     	movq	%rdi, %rdx
145544e1e:     	callq	0x14590379b <.text+0x590279b>
145544e23:     	ud2
145544e25:     	cmpq	%rax, %rcx
145544e28:     	je	0x145544e52 <.text+0x5543e52>
145544e2a:     	movq	%rdx, %r14
145544e2d:     	callq	0x140002200 <.text+0x1200>
145544e32:     	movl	$0x8, %ebx
145544e37:     	movl	$0x8, %edx
145544e3c:     	movq	%rdi, %rcx
145544e3f:     	callq	0x1400021c0 <.text+0x11c0>
145544e44:     	testq	%rax, %rax
145544e47:     	je	0x145544e18 <.text+0x5543e18>
145544e49:     	shrq	$0x6, %rdi
145544e4d:     	movq	%r14, %rdx
145544e50:     	jmp	0x145544e59 <.text+0x5543e59>
145544e52:     	movl	$0x8, %eax
145544e57:     	xorl	%edi, %edi
145544e59:     	movq	%rdi, -0x20(%rbp)
145544e5d:     	movq	%rax, -0x18(%rbp)
145544e61:     	leaq	-0x10(%rbp), %rcx
145544e65:     	movq	$0x0, -0x10(%rbp)
145544e6d:     	movq	%rax, -0x28(%rbp)
145544e71:     	movq	%rcx, -0x38(%rbp)
145544e75:     	movq	$0x0, -0x30(%rbp)
145544e7d:     	leaq	-0x38(%rbp), %rax
145544e81:     	movq	%rdx, %rcx
145544e84:     	movq	%rax, %rdx
145544e87:     	callq	0x14554e050 <.text+0x554d050>
145544e8c:     	nop
145544e8d:     	movq	-0x10(%rbp), %rax
145544e91:     	movq	%rax, 0x10(%rsi)
145544e95:     	movups	-0x20(%rbp), %xmm0
145544e99:     	movups	%xmm0, (%rsi)
145544e9c:     	movq	%rsi, %rax
145544e9f:     	addq	$0x60, %rsp
145544ea3:     	popq	%rbx
145544ea4:     	popq	%rdi
145544ea5:     	popq	%rsi
145544ea6:     	popq	%r14
145544ea8:     	popq	%rbp
145544ea9:     	retq
