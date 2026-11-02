
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407e0cc0:     	pushq	%rsi
1407e0cc1:     	pushq	%rdi
1407e0cc2:     	pushq	%rbx
1407e0cc3:     	subq	$0x40, %rsp
1407e0cc7:     	movaps	%xmm6, 0x30(%rsp)
1407e0ccc:     	movq	0x10(%rcx), %rsi
1407e0cd0:     	testq	%rsi, %rsi
1407e0cd3:     	jne	0x1407e0cd9 <.text+0x7dfcd9>
1407e0cd5:     	movq	0x18(%rcx), %rsi
1407e0cd9:     	movq	(%rsi), %rax
1407e0cdc:     	movq	0x10(%rsi), %rdi
1407e0ce0:     	subq	%rdi, %rax
1407e0ce3:     	cmpq	$0x17, %rax
1407e0ce7:     	jbe	0x1407e0d18 <.text+0x7dfd18>
1407e0ce9:     	movq	0x8(%rsi), %rax
1407e0ced:     	leaq	0x37a26c(%rip), %rcx    # 0x140b5af60 <.text+0xb59f60>
1407e0cf4:     	movq	%rcx, (%rax,%rdi)
1407e0cf8:     	movq	%rdx, 0x8(%rax,%rdi)
1407e0cfd:     	movss	%xmm2, 0x10(%rax,%rdi)
1407e0d03:     	addq	$0x18, %rdi
1407e0d07:     	movq	%rdi, 0x10(%rsi)
1407e0d0b:     	movaps	0x30(%rsp), %xmm6
1407e0d10:     	addq	$0x40, %rsp
1407e0d14:     	popq	%rbx
1407e0d15:     	popq	%rdi
1407e0d16:     	popq	%rsi
1407e0d17:     	retq
1407e0d18:     	movq	$0x1, 0x20(%rsp)
1407e0d21:     	movl	$0x18, %r8d
1407e0d27:     	movl	$0x1, %r9d
1407e0d2d:     	movq	%rsi, %rcx
1407e0d30:     	movq	%rdx, %rbx
1407e0d33:     	movq	%rdi, %rdx
1407e0d36:     	movaps	%xmm2, %xmm6
1407e0d39:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1407e0d3e:     	movq	%rbx, %rdx
1407e0d41:     	movaps	%xmm6, %xmm2
1407e0d44:     	jmp	0x1407e0ce9 <.text+0x7dfce9>
