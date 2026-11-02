
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d1b86:     	movups	%xmm0, (%r9)
1401d1b8a:     	movq	$0x0, 0x320(%rbp)
1401d1b95:     	movq	$0x4, 0x328(%rbp)
1401d1ba0:     	movq	$0x0, 0x330(%rbp)
1401d1bab:     	movb	%cl, 0x338(%rbp)
1401d1bb1:     	movq	%rax, 0x340(%rbp)
1401d1bb8:     	movq	%rdx, 0x348(%rbp)
1401d1bbf:     	movl	$0x41400000, 0x350(%rbp) # imm = 0x41400000
1401d1bc9:     	movw	$0x190, 0x354(%rbp)     # imm = 0x190
1401d1bd2:     	movb	$0x1, 0x356(%rbp)
1401d1bd9:     	movq	0x5d5(%rbp), %rax
1401d1be0:     	movq	%rax, -0x4(%r15)
1401d1be4:     	movups	0x5c8(%rbp), %xmm0
1401d1beb:     	movups	%xmm0, -0x11(%r15)
1401d1bf0:     	movl	0x5b9c6f1(%rip), %r12d  # 0x145d6e2e8
1401d1bf7:     	movl	%r12d, 0x14(%r15)
1401d1bfb:     	movups	0x5b9c6d6(%rip), %xmm0  # 0x145d6e2d8
1401d1c02:     	movups	%xmm0, 0x4(%r15)
1401d1c07:     	movsd	%xmm6, 0x380(%rbp)
1401d1c0f:     	movw	$0x300, 0x388(%rbp)     # imm = 0x300
1401d1c18:     	movq	%r14, 0x300(%rbp)
1401d1c1f:     	leaq	0x40(%rbp), %rcx
1401d1c23:     	leaq	0x528(%rbp), %rdx
1401d1c2a:     	leaq	0x300(%rbp), %r8
1401d1c31:     	callq	0x14019edf0 <.text+0x19ddf0>
1401d1c36:     	testb	%dil, %dil
1401d1c39:     	je	0x1401d1f5a <.text+0x1d0f5a>
1401d1c3f:     	leaq	0xd0(%rbp), %rax
1401d1c46:     	movupd	%xmm13, 0x10(%rax)
1401d1c4c:     	movupd	%xmm13, (%rax)
1401d1c51:     	movupd	%xmm13, -0x10(%rax)
1401d1c57:     	movupd	%xmm13, -0x20(%rax)
1401d1c5d:     	movupd	%xmm13, -0x30(%rax)
1401d1c63:     	movq	$0x0, 0x20(%rax)
1401d1c6b:     	movw	$0x0, 0x11c(%r15)
1401d1c75:     	movl	$0x0, 0x118(%r15)
1401d1c80:     	movups	0x5be6cc1(%rip), %xmm0  # 0x145db8948
1401d1c87:     	movups	%xmm0, 0x38(%rax)
1401d1c8b:     	movups	0x5be6ca6(%rip), %xmm0  # 0x145db8938
1401d1c92:     	movups	%xmm0, 0x28(%rax)
1401d1c96:     	movaps	%xmm9, 0x40(%rbp)
1401d1c9b:     	movq	$0x0, 0x50(%rbp)
1401d1ca3:     	movups	%xmm14, -0x78(%rax)
1401d1ca8:     	movq	$0x0, -0x68(%rax)
1401d1cb0:     	movups	%xmm15, -0x60(%rax)
1401d1cb5:     	movq	$0x0, -0x50(%rax)
1401d1cbd:     	movups	%xmm7, -0x48(%rax)
1401d1cc1:     	movq	$0x0, -0x38(%rax)
1401d1cc9:     	movl	$0xd8, %r8d
1401d1ccf:     	leaq	0x308(%rbp), %rcx
1401d1cd6:     	leaq	0x40(%rbp), %rdi
1401d1cda:     	movq	%rdi, %rdx
1401d1cdd:     	callq	0x145bc977b <.text+0x5bc877b>
1401d1ce2:     	movupd	%xmm13, 0x170(%r15)
1401d1ceb:     	movaps	0x5b9b94e(%rip), %xmm1  # 0x145d6d640
1401d1cf2:     	movups	%xmm1, 0x3e0(%rbp)
1401d1cf9:     	movaps	0x5b9b610(%rip), %xmm0  # 0x145d6d310
1401d1d00:     	movups	%xmm0, 0x3f0(%rbp)
1401d1d07:     	movaps	0x5b9b582(%rip), %xmm0  # 0x145d6d290
1401d1d0e:     	movups	%xmm0, 0x400(%rbp)
1401d1d15:     	movups	%xmm0, 0x410(%rbp)
1401d1d1c:     	movups	%xmm1, 0x420(%rbp)
1401d1d23:     	movups	%xmm1, 0x430(%rbp)
1401d1d2a:     	movaps	0x5b9b52f(%rip), %xmm0  # 0x145d6d260
1401d1d31:     	movups	%xmm0, 0x440(%rbp)
1401d1d38:     	movl	$0x1, 0x450(%rbp)
1401d1d42:     	movq	$0x0, 0x454(%rbp)
1401d1d4d:     	movb	$0x1, 0x45c(%rbp)
1401d1d54:     	movq	$0x0, 0xfe(%r15)
1401d1d5f:     	movq	$0x0, 0xf8(%r15)
1401d1d6a:     	movw	$0x0, 0x10a(%r15)
1401d1d74:     	movl	$0x10000, 0x106(%r15)   # imm = 0x10000
1401d1d7f:     	movw	$0x0, 0x110(%r15)
1401d1d89:     	movl	$0x10000, 0x10c(%r15)   # imm = 0x10000
1401d1d94:     	movw	$0x0, 0x116(%r15)
1401d1d9e:     	movl	$0x0, 0x112(%r15)
1401d1da9:     	movups	0x5be7137(%rip), %xmm10 # 0x145db8ee8
1401d1db1:     	movups	%xmm10, 0x120(%r15)
1401d1db9:     	movl	$0x3f19999a, 0x498(%rbp) # imm = 0x3F19999A
1401d1dc3:     	movups	%xmm10, 0x134(%r15)
1401d1dcb:     	movl	$0x3f19999a, 0x4ac(%rbp) # imm = 0x3F19999A
1401d1dd5:     	movups	%xmm10, 0x148(%r15)
1401d1ddd:     	movl	$0x3f19999a, 0x4c0(%rbp) # imm = 0x3F19999A
1401d1de7:     	movups	%xmm10, 0x15c(%r15)
1401d1def:     	movl	$0x3f19999a, 0x4d4(%rbp) # imm = 0x3F19999A
1401d1df9:     	movl	$0x3eb33333, 0x4e8(%rbp) # imm = 0x3EB33333
1401d1e03:     	movq	%r14, 0x300(%rbp)
1401d1e0a:     	movq	%rdi, %rcx
1401d1e0d:     	leaq	0x528(%rbp), %rdx
1401d1e14:     	leaq	0x300(%rbp), %r8
1401d1e1b:     	callq	0x14018a750 <.text+0x189750>
1401d1e20:     	movq	0x610(%rbp), %rax
1401d1e27:     	movq	(%rax), %rdi
1401d1e2a:     	callq	0x140002200 <.text+0x1200>
1401d1e2f:     	movl	$0x4, %ecx
1401d1e34:     	movl	$0x1, %edx
1401d1e39:     	callq	0x1400021c0 <.text+0x11c0>
1401d1e3e:     	testq	%rax, %rax
1401d1e41:     	je	0x1401d22ee <.text+0x1d12ee>
1401d1e47:     	movl	$0x636f7270, (%rax)     # imm = 0x636F7270
1401d1e4d:     	cmpb	$0x1, (%rdi)
1401d1e50:     	jne	0x1401d1e80 <.text+0x1d0e80>
1401d1e52:     	movl	0x1(%rdi), %ecx
1401d1e55:     	movl	0x4(%rdi), %edx
1401d1e58:     	movl	%edx, 0x5cb(%rbp)
1401d1e5e:     	movl	%ecx, 0x5c8(%rbp)
1401d1e64:     	movq	0x8(%rdi), %rcx
1401d1e68:     	movzbl	0x10(%rdi), %edx
1401d1e6c:     	movb	$0x1, %r8b
1401d1e6f:     	jmp	0x1401d1e91 <.text+0x1d0e91>
1401d1e71:     	nopw	%cs:(%rax,%rax)
1401d1e80:     	movq	0x8(%rdi), %rcx
1401d1e84:     	lock
1401d1e85:     	incq	(%rcx)
1401d1e88:     	jle	0x1401d22ec <.text+0x1d12ec>
1401d1e8e:     	xorl	%r8d, %r8d
1401d1e91:     	movq	$0x4, 0x300(%rbp)
1401d1e9c:     	movq	%rax, 0x308(%rbp)
1401d1ea3:     	movq	$0x4, 0x310(%rbp)
1401d1eae:     	movq	$0x0, 0x318(%rbp)
1401d1eb9:     	movq	$0x4, 0x320(%rbp)
1401d1ec4:     	movq	$0x0, 0x328(%rbp)
1401d1ecf:     	movb	%r8b, 0x330(%rbp)
1401d1ed6:     	movl	0x5c8(%rbp), %eax
1401d1edc:     	movl	0x5cb(%rbp), %r8d
1401d1ee3:     	movl	%r8d, -0x34(%r15)
1401d1ee7:     	movl	%eax, -0x37(%r15)
1401d1eeb:     	movq	%rcx, 0x338(%rbp)
1401d1ef2:     	movq	%rdx, 0x340(%rbp)
1401d1ef9:     	movl	$0x41100000, 0x348(%rbp) # imm = 0x41100000
1401d1f03:     	movw	$0x190, 0x34c(%rbp)     # imm = 0x190
1401d1f0c:     	movb	$0x1, 0x34e(%rbp)
1401d1f13:     	movups	%xmm10, -0x18(%r15)
1401d1f18:     	movl	$0x3f800000, -0x8(%r15) # imm = 0x3F800000
1401d1f20:     	movups	0x5b9c3b1(%rip), %xmm0  # 0x145d6e2d8
1401d1f27:     	movups	%xmm0, -0x4(%r15)
1401d1f2c:     	movl	%r12d, 0xc(%r15)
1401d1f30:     	movsd	%xmm6, 0x378(%rbp)
1401d1f38:     	movw	$0x300, 0x380(%rbp)     # imm = 0x300
1401d1f41:     	leaq	0x40(%rbp), %rcx
1401d1f45:     	leaq	0x300(%rbp), %rdx
1401d1f4c:     	callq	0x1401a52c0 <.text+0x1a42c0>
