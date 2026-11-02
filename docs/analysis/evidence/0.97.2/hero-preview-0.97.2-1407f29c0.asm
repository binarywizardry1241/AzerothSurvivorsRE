
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407f29c0:     	pushq	%rbp
1407f29c1:     	pushq	%rsi
1407f29c2:     	subq	$0x118, %rsp            # imm = 0x118
1407f29c9:     	leaq	0x80(%rsp), %rbp
1407f29d1:     	movq	$-0x2, 0x90(%rbp)
1407f29dc:     	movq	%rdx, %rsi
1407f29df:     	callq	0x140002200 <.text+0x1200>
1407f29e4:     	movl	$0x40, %ecx
1407f29e9:     	movl	$0x8, %edx
1407f29ee:     	callq	0x1400021c0 <.text+0x11c0>
1407f29f3:     	testq	%rax, %rax
1407f29f6:     	je	0x1407f2a98 <.text+0x7f1a98>
1407f29fc:     	movl	$0x0, (%rax)
1407f2a02:     	movb	$0x0, 0x4(%rax)
1407f2a06:     	movb	$0x2, 0x38(%rax)
1407f2a0a:     	leaq	0x5218bbf(%rip), %r8    # 0x145a0b5d0
1407f2a11:     	leaq	0x18(%rbp), %rcx
1407f2a15:     	movq	%rax, %rdx
1407f2a18:     	callq	0x144e1b980 <.text+0x4e1a980>
1407f2a1d:     	nop
1407f2a1e:     	movq	0x71ed12b(%rip), %rcx   # 0x1479dfb50
1407f2a25:     	leaq	0x52c60a4(%rip), %r8    # 0x145ab8ad0
1407f2a2c:     	leaq	0x8f(%rbp), %rdx
1407f2a33:     	callq	0x140f94df0 <.text+0xf93df0>
1407f2a38:     	nop
1407f2a39:     	movq	%rdx, %r8
1407f2a3c:     	leaq	0x18(%rbp), %rcx
1407f2a40:     	movq	%rax, %rdx
1407f2a43:     	callq	0x1410e0880 <.text+0x10df880>
1407f2a48:     	nop
1407f2a49:     	movups	0x78(%rbp), %xmm0
1407f2a4d:     	movaps	%xmm0, (%rbp)
1407f2a51:     	movups	0x68(%rbp), %xmm0
1407f2a55:     	movaps	%xmm0, -0x10(%rbp)
1407f2a59:     	movups	0x58(%rbp), %xmm0
1407f2a5d:     	movaps	%xmm0, -0x20(%rbp)
1407f2a61:     	movups	0x18(%rbp), %xmm0
1407f2a65:     	movups	0x28(%rbp), %xmm1
1407f2a69:     	movups	0x38(%rbp), %xmm2
1407f2a6d:     	movups	0x48(%rbp), %xmm3
1407f2a71:     	movaps	%xmm3, -0x30(%rbp)
1407f2a75:     	movaps	%xmm2, -0x40(%rbp)
1407f2a79:     	movaps	%xmm1, -0x50(%rbp)
1407f2a7d:     	movaps	%xmm0, -0x60(%rbp)
1407f2a81:     	leaq	-0x60(%rbp), %rdx
1407f2a85:     	movq	%rsi, %rcx
1407f2a88:     	callq	0x140f29810 <.text+0xf28810>
1407f2a8d:     	nop
1407f2a8e:     	addq	$0x118, %rsp            # imm = 0x118
1407f2a95:     	popq	%rsi
1407f2a96:     	popq	%rbp
1407f2a97:     	retq
1407f2a98:     	movl	$0x8, %ecx
1407f2a9d:     	movl	$0x40, %edx
1407f2aa2:     	callq	0x1458e7201 <.text+0x58e6201>
1407f2aa7:     	ud2
