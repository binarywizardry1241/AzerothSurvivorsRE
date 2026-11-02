
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c7a20:     	pushq	%rbp
1400c7a21:     	pushq	%rsi
1400c7a22:     	pushq	%rdi
1400c7a23:     	subq	$0xc0, %rsp
1400c7a2a:     	leaq	0x80(%rsp), %rbp
1400c7a32:     	movaps	%xmm6, 0x30(%rbp)
1400c7a36:     	movq	$-0x2, 0x28(%rbp)
1400c7a3e:     	movq	%rcx, %rsi
1400c7a41:     	movups	0x5836a30(%rip), %xmm0  # 0x1458fe478
1400c7a48:     	movaps	%xmm0, -0x60(%rbp)
1400c7a4c:     	movl	$0x3f800000, -0x50(%rbp) # imm = 0x3F800000
1400c7a53:     	movups	%xmm0, -0x4c(%rbp)
1400c7a57:     	movl	$0x3f800000, -0x3c(%rbp) # imm = 0x3F800000
1400c7a5e:     	movups	%xmm0, -0x38(%rbp)
1400c7a62:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
1400c7a69:     	movups	%xmm0, -0x24(%rbp)
1400c7a6d:     	movl	$0x3f800000, -0x14(%rbp) # imm = 0x3F800000
1400c7a74:     	callq	0x140002200 <.text+0x1200>
1400c7a79:     	movl	$0x40, %ecx
1400c7a7e:     	movl	$0x4, %edx
1400c7a83:     	callq	0x1400021c0 <.text+0x11c0>
1400c7a88:     	testq	%rax, %rax
1400c7a8b:     	je	0x1400c7ba2 <.text+0xc6ba2>
1400c7a91:     	movq	%rax, 0x20(%rbp)
1400c7a95:     	movaps	0x5835064(%rip), %xmm0  # 0x1458fcb00
1400c7a9c:     	movups	%xmm0, 0x10(%rbp)
1400c7aa0:     	movl	$0x0, 0xc(%rbp)
1400c7aa7:     	leaq	-0x10(%rbp), %rcx
1400c7aab:     	leaq	0xc(%rbp), %rdx
1400c7aaf:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c7ab4:     	nop
1400c7ab5:     	movaps	-0x10(%rbp), %xmm6
1400c7ab9:     	movaps	0x5835050(%rip), %xmm0  # 0x1458fcb10
1400c7ac0:     	movups	%xmm0, 0x10(%rbp)
1400c7ac4:     	movl	$0x0, 0xc(%rbp)
1400c7acb:     	leaq	-0x10(%rbp), %rcx
1400c7acf:     	leaq	0xc(%rbp), %rdx
1400c7ad3:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c7ad8:     	nop
1400c7ad9:     	movaps	-0x10(%rbp), %xmm0
1400c7add:     	movq	0x20(%rbp), %rdi
1400c7ae1:     	movl	$0x0, (%rdi)
1400c7ae7:     	movl	$0x1, 0x8(%rdi)
1400c7aee:     	movups	%xmm6, 0xc(%rdi)
1400c7af2:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
1400c7afa:     	movl	$0x1, 0x28(%rdi)
1400c7b01:     	movups	%xmm0, 0x2c(%rdi)
1400c7b05:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
1400c7b0c:     	callq	0x140002200 <.text+0x1200>
1400c7b11:     	movl	$0x48, %ecx
1400c7b16:     	movl	$0x8, %edx
1400c7b1b:     	callq	0x1400021c0 <.text+0x11c0>
1400c7b20:     	testq	%rax, %rax
1400c7b23:     	je	0x1400c7bb3 <.text+0xc6bb3>
1400c7b29:     	movq	$0x2, 0x8(%rax)
1400c7b31:     	movq	%rdi, 0x10(%rax)
1400c7b35:     	movq	$0x2, 0x18(%rax)
1400c7b3d:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
1400c7b44:     	movb	$0x0, 0x24(%rax)
1400c7b48:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1400c7b52:     	movq	%rcx, (%rax)
1400c7b55:     	movq	$0x1, 0x50(%rsi)
1400c7b5d:     	movq	%rax, 0x58(%rsi)
1400c7b61:     	movq	$0x1, 0x60(%rsi)
1400c7b69:     	movaps	-0x60(%rbp), %xmm0
1400c7b6d:     	movaps	-0x50(%rbp), %xmm1
1400c7b71:     	movaps	-0x40(%rbp), %xmm2
1400c7b75:     	movaps	-0x30(%rbp), %xmm3
1400c7b79:     	movups	%xmm0, (%rsi)
1400c7b7c:     	movups	%xmm1, 0x10(%rsi)
1400c7b80:     	movups	%xmm2, 0x20(%rsi)
1400c7b84:     	movups	%xmm3, 0x30(%rsi)
1400c7b88:     	movaps	-0x20(%rbp), %xmm0
1400c7b8c:     	movups	%xmm0, 0x40(%rsi)
1400c7b90:     	movq	%rsi, %rax
1400c7b93:     	movaps	0x30(%rbp), %xmm6
1400c7b97:     	addq	$0xc0, %rsp
1400c7b9e:     	popq	%rdi
1400c7b9f:     	popq	%rsi
1400c7ba0:     	popq	%rbp
1400c7ba1:     	retq
1400c7ba2:     	movl	$0x4, %ecx
1400c7ba7:     	movl	$0x40, %edx
1400c7bac:     	callq	0x1458e7201 <.text+0x58e6201>
1400c7bb1:     	ud2
1400c7bb3:     	movl	$0x8, %ecx
1400c7bb8:     	movl	$0x48, %edx
1400c7bbd:     	callq	0x1458e7201 <.text+0x58e6201>
1400c7bc2:     	nop
1400c7bc3:     	ud2
