
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145926f60:     	pushq	%rbp
145926f61:     	pushq	%rsi
145926f62:     	pushq	%rdi
145926f63:     	subq	$0x30, %rsp
145926f67:     	leaq	0x30(%rsp), %rbp
145926f6c:     	movq	$-0x2, -0x8(%rbp)
145926f74:     	testq	%rdx, %rdx
145926f77:     	je	0x145926ff5 <.text+0x5925ff5>
145926f79:     	movq	%rdx, %rdi
145926f7c:     	movq	%rcx, %rsi
145926f7f:     	callq	0x140002200 <.text+0x1200>
145926f84:     	movl	$0x20, %ecx
145926f89:     	movl	$0x1, %edx
145926f8e:     	callq	0x1400021c0 <.text+0x11c0>
145926f93:     	testq	%rax, %rax
145926f96:     	je	0x145926ffd <.text+0x5925ffd>
145926f98:     	movq	%rax, -0x10(%rbp)
145926f9c:     	movq	%rdi, (%rax)
145926f9f:     	movq	0x5e0(%rsi), %rdi
145926fa6:     	cmpq	0x5d0(%rsi), %rdi
145926fad:     	jne	0x145926fbc <.text+0x5925fbc>
145926faf:     	leaq	0x5d0(%rsi), %rcx
145926fb6:     	callq	0x145bcb530 <.text+0x5bca530>
145926fbb:     	nop
145926fbc:     	movq	0x5d8(%rsi), %rax
145926fc3:     	movq	%rdi, %rcx
145926fc6:     	shlq	$0x5, %rcx
145926fca:     	movq	$0x20, (%rax,%rcx)
145926fd2:     	movq	-0x10(%rbp), %rdx
145926fd6:     	movq	%rdx, 0x8(%rax,%rcx)
145926fdb:     	movq	$0x8, 0x10(%rax,%rcx)
145926fe4:     	movw	$0xaa, 0x18(%rax,%rcx)
145926feb:     	incq	%rdi
145926fee:     	movq	%rdi, 0x5e0(%rsi)
145926ff5:     	addq	$0x30, %rsp
145926ff9:     	popq	%rdi
145926ffa:     	popq	%rsi
145926ffb:     	popq	%rbp
145926ffc:     	retq
145926ffd:     	movl	$0x1, %ecx
145927002:     	movl	$0x20, %edx
145927007:     	callq	0x145d6944b <.text+0x5d6844b>
14592700c:     	ud2
