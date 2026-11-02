
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400b68f0:     	pushq	%rbp
1400b68f1:     	pushq	%rsi
1400b68f2:     	pushq	%rdi
1400b68f3:     	subq	$0xc0, %rsp
1400b68fa:     	leaq	0x80(%rsp), %rbp
1400b6902:     	movaps	%xmm6, 0x30(%rbp)
1400b6906:     	movq	$-0x2, 0x28(%rbp)
1400b690e:     	movq	%rcx, %rsi
1400b6911:     	movups	0x5886538(%rip), %xmm0  # 0x14593ce50
1400b6918:     	movaps	%xmm0, -0x60(%rbp)
1400b691c:     	movl	$0x3f800000, -0x50(%rbp) # imm = 0x3F800000
1400b6923:     	movups	%xmm0, -0x4c(%rbp)
1400b6927:     	movl	$0x3f800000, -0x3c(%rbp) # imm = 0x3F800000
1400b692e:     	movups	%xmm0, -0x38(%rbp)
1400b6932:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
1400b6939:     	movups	%xmm0, -0x24(%rbp)
1400b693d:     	movl	$0x3f800000, -0x14(%rbp) # imm = 0x3F800000
1400b6944:     	callq	0x140002200 <.text+0x1200>
1400b6949:     	movl	$0x40, %ecx
1400b694e:     	movl	$0x4, %edx
1400b6953:     	callq	0x1400021c0 <.text+0x11c0>
1400b6958:     	testq	%rax, %rax
1400b695b:     	je	0x1400b6a72 <.text+0xb5a72>
1400b6961:     	movq	%rax, 0x20(%rbp)
1400b6965:     	movaps	0x5861d94(%rip), %xmm0  # 0x145918700
1400b696c:     	movups	%xmm0, 0x10(%rbp)
1400b6970:     	movl	$0x0, 0xc(%rbp)
1400b6977:     	leaq	-0x10(%rbp), %rcx
1400b697b:     	leaq	0xc(%rbp), %rdx
1400b697f:     	callq	0x144c8c290 <.text+0x4c8b290>
1400b6984:     	nop
1400b6985:     	movaps	-0x10(%rbp), %xmm6
1400b6989:     	movaps	0x5861d80(%rip), %xmm0  # 0x145918710
1400b6990:     	movups	%xmm0, 0x10(%rbp)
1400b6994:     	movl	$0x0, 0xc(%rbp)
1400b699b:     	leaq	-0x10(%rbp), %rcx
1400b699f:     	leaq	0xc(%rbp), %rdx
1400b69a3:     	callq	0x144c8c290 <.text+0x4c8b290>
1400b69a8:     	nop
1400b69a9:     	movaps	-0x10(%rbp), %xmm0
1400b69ad:     	movq	0x20(%rbp), %rdi
1400b69b1:     	movl	$0x0, (%rdi)
1400b69b7:     	movl	$0x1, 0x8(%rdi)
1400b69be:     	movups	%xmm6, 0xc(%rdi)
1400b69c2:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
1400b69ca:     	movl	$0x1, 0x28(%rdi)
1400b69d1:     	movups	%xmm0, 0x2c(%rdi)
1400b69d5:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
1400b69dc:     	callq	0x140002200 <.text+0x1200>
1400b69e1:     	movl	$0x48, %ecx
1400b69e6:     	movl	$0x8, %edx
1400b69eb:     	callq	0x1400021c0 <.text+0x11c0>
1400b69f0:     	testq	%rax, %rax
1400b69f3:     	je	0x1400b6a83 <.text+0xb5a83>
1400b69f9:     	movq	$0x2, 0x8(%rax)
1400b6a01:     	movq	%rdi, 0x10(%rax)
1400b6a05:     	movq	$0x2, 0x18(%rax)
1400b6a0d:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
1400b6a14:     	movb	$0x0, 0x24(%rax)
1400b6a18:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1400b6a22:     	movq	%rcx, (%rax)
1400b6a25:     	movaps	-0x20(%rbp), %xmm0
1400b6a29:     	movups	%xmm0, 0x40(%rsi)
1400b6a2d:     	movaps	-0x60(%rbp), %xmm0
1400b6a31:     	movaps	-0x50(%rbp), %xmm1
1400b6a35:     	movaps	-0x40(%rbp), %xmm2
1400b6a39:     	movaps	-0x30(%rbp), %xmm3
1400b6a3d:     	movups	%xmm3, 0x30(%rsi)
1400b6a41:     	movups	%xmm2, 0x20(%rsi)
1400b6a45:     	movups	%xmm1, 0x10(%rsi)
1400b6a49:     	movups	%xmm0, (%rsi)
1400b6a4c:     	movq	$0x1, 0x50(%rsi)
1400b6a54:     	movq	%rax, 0x58(%rsi)
1400b6a58:     	movq	$0x1, 0x60(%rsi)
1400b6a60:     	movq	%rsi, %rax
1400b6a63:     	movaps	0x30(%rbp), %xmm6
1400b6a67:     	addq	$0xc0, %rsp
1400b6a6e:     	popq	%rdi
1400b6a6f:     	popq	%rsi
1400b6a70:     	popq	%rbp
1400b6a71:     	retq
1400b6a72:     	movl	$0x4, %ecx
1400b6a77:     	movl	$0x40, %edx
1400b6a7c:     	callq	0x145903781 <.text+0x5902781>
1400b6a81:     	ud2
1400b6a83:     	movl	$0x8, %ecx
1400b6a88:     	movl	$0x48, %edx
1400b6a8d:     	callq	0x145903781 <.text+0x5902781>
1400b6a92:     	nop
1400b6a93:     	ud2
