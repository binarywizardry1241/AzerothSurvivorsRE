
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402a5e70:     	pushq	%rbp
1402a5e71:     	pushq	%r14
1402a5e73:     	pushq	%rsi
1402a5e74:     	pushq	%rdi
1402a5e75:     	pushq	%rbx
1402a5e76:     	subq	$0xe0, %rsp
1402a5e7d:     	leaq	0x80(%rsp), %rbp
1402a5e85:     	movaps	%xmm6, 0x50(%rbp)
1402a5e89:     	movq	$-0x2, 0x48(%rbp)
1402a5e91:     	movq	%rcx, %rax
1402a5e94:     	addq	$0x40, %rcx
1402a5e98:     	leaq	0x5a8(%rax), %rdx
1402a5e9f:     	movq	%rcx, 0x30(%rbp)
1402a5ea3:     	movq	%rdx, 0x38(%rbp)
1402a5ea7:     	movq	$0x0, 0x18(%rbp)
1402a5eaf:     	movq	$0x8, 0x20(%rbp)
1402a5eb7:     	movq	$0x0, 0x28(%rbp)
1402a5ebf:     	cmpq	$0x0, 0x70(%rax)
1402a5ec4:     	je	0x1402a5f69 <.text+0x2a4f69>
1402a5eca:     	movabsq	$0x7a03331b1d29fe5d, %r9 # imm = 0x7A03331B1D29FE5D
1402a5ed4:     	movq	0x58(%rax), %r8
1402a5ed8:     	movq	0x60(%rax), %r10
1402a5edc:     	xorl	%r11d, %r11d
1402a5edf:     	movdqa	0x5b10189(%rip), %xmm0  # 0x145db6070
1402a5ee7:     	pcmpeqd	%xmm1, %xmm1
1402a5eeb:     	movdqa	0x5b1981d(%rip), %xmm2  # 0x145dbf710
