
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a5b6d:     	movq	0x368(%rbp), %rcx
1454a5b74:     	incl	0x674(%rcx)
1454a5b7a:     	callq	0x1454d2380 <.text+0x54d1380>
1454a5b7f:     	nop
1454a5b80:     	movq	0x368(%rbp), %rax
1454a5b87:     	movq	0x530(%rax), %rcx
1454a5b8e:     	testq	%rcx, %rcx
1454a5b91:     	je	0x1454a5d14 <.text+0x54a4d14>
1454a5b97:     	movq	0x368(%rbp), %rax
1454a5b9e:     	movss	0x3e8(%rax), %xmm0
1454a5ba6:     	movss	0x3ec(%rax), %xmm1
1454a5bae:     	movss	0x8e4(%rax), %xmm2
1454a5bb6:     	movq	0x528(%rax), %rax
1454a5bbd:     	shlq	$0x3, %rcx
1454a5bc1:     	leaq	(%rcx,%rcx,8), %rcx
1454a5bc5:     	xorl	%edx, %edx
1454a5bc7:     	jmp	0x1454a5bdd <.text+0x54a4bdd>
1454a5bc9:     	nopl	(%rax)
1454a5bd0:     	addq	$0x48, %rdx
1454a5bd4:     	cmpq	%rdx, %rcx
1454a5bd7:     	je	0x1454a5d14 <.text+0x54a4d14>
1454a5bdd:     	cmpl	$0x1, 0x20(%rax,%rdx)
1454a5be2:     	jne	0x1454a5bd0 <.text+0x54a4bd0>
1454a5be4:     	cmpl	$0x0, 0x18(%rax,%rdx)
1454a5be9:     	jne	0x1454a5bd0 <.text+0x54a4bd0>
1454a5beb:     	movss	0x34(%rax,%rdx), %xmm3
1454a5bf1:     	subss	%xmm0, %xmm3
1454a5bf5:     	movss	0x38(%rax,%rdx), %xmm4
1454a5bfb:     	subss	%xmm1, %xmm4
1454a5bff:     	mulss	%xmm3, %xmm3
1454a5c03:     	mulss	%xmm4, %xmm4
1454a5c07:     	addss	%xmm3, %xmm4
1454a5c0b:     	xorps	%xmm3, %xmm3
1454a5c0e:     	sqrtss	%xmm4, %xmm3
1454a5c12:     	divss	0x450a66(%rip), %xmm3   # 0x1458f6680
1454a5c1a:     	maxss	%xmm8, %xmm3
1454a5c1f:     	addss	%xmm2, %xmm3
1454a5c23:     	movl	$0x1, 0x18(%rax,%rdx)
1454a5c2b:     	movss	%xmm3, 0x1c(%rax,%rdx)
1454a5c31:     	jmp	0x1454a5bd0 <.text+0x54a4bd0>
1454a5c33:     	movl	%r14d, %eax
1454a5c36:     	xorps	%xmm0, %xmm0
1454a5c39:     	cvtsi2ss	%rax, %xmm0
1454a5c3e:     	movq	0x368(%rbp), %rsi
1454a5c45:     	mulss	0x488(%rsi), %xmm0
1454a5c4d:     	callq	0x145756e1f <.text+0x5755e1f>
1454a5c52:     	cvttss2si	%xmm0, %rax
1454a5c57:     	ucomiss	%xmm7, %xmm0
1454a5c5a:     	movl	$0x0, %ecx
1454a5c5f:     	cmovbl	%ecx, %eax
1454a5c62:     	ucomiss	%xmm13, %xmm0
1454a5c66:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454a5c6b:     	cmoval	%ecx, %eax
1454a5c6e:     	movl	0x408(%rsi), %ecx
1454a5c74:     	addl	%eax, %ecx
1454a5c76:     	movl	%ecx, 0x408(%rsi)
1454a5c7c:     	addl	%eax, 0x66c(%rsi)
1454a5c82:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1454a5c89:     	movq	0x8b8(%rsi), %rax
1454a5c90:     	testq	%rax, %rax
1454a5c93:     	je	0x1454a5df0 <.text+0x54a4df0>
1454a5c99:     	movq	0x8c0(%rsi), %rcx
1454a5ca0:     	movzwl	0x36(%rax), %r9d
1454a5ca5:     	movl	%r9d, %r10d
1454a5ca8:     	addl	%r10d, %r10d
1454a5cab:     	movq	$-0x1, %rdx
1454a5cb2:     	nopw	%cs:(%rax,%rax)
1454a5cc0:     	testq	%r10, %r10
1454a5cc3:     	je	0x1454a5d00 <.text+0x54a4d00>
1454a5cc5:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454a5ccb:     	cmpl	%r11d, %edi
1454a5cce:     	seta	%r11b
1454a5cd2:     	sbbb	$0x0, %r11b
1454a5cd6:     	incq	%rdx
1454a5cd9:     	addq	$-0x2, %r10
1454a5cdd:     	cmpb	$0x1, %r11b
1454a5ce1:     	je	0x1454a5cc0 <.text+0x54a4cc0>
1454a5ce3:     	movzbl	%r11b, %r9d
1454a5ce7:     	testl	%r9d, %r9d
1454a5cea:     	je	0x1454a5de6 <.text+0x54a4de6>
1454a5cf0:     	subq	$0x1, %rcx
1454a5cf4:     	jae	0x1454a5d0d <.text+0x54a4d0d>
1454a5cf6:     	jmp	0x1454a5df2 <.text+0x54a4df2>
1454a5cfb:     	nopl	(%rax,%rax)
1454a5d00:     	movq	%r9, %rdx
1454a5d03:     	subq	$0x1, %rcx
1454a5d07:     	jb	0x1454a5df2 <.text+0x54a4df2>
1454a5d0d:     	movq	0x50(%rax,%rdx,8), %rax
1454a5d12:     	jmp	0x1454a5ca0 <.text+0x54a4ca0>
1454a5d14:     	callq	0x140002200 <.text+0x1200>
1454a5d19:     	movl	$0x20, %ecx
1454a5d1e:     	movl	$0x1, %edx
1454a5d23:     	callq	0x1400021c0 <.text+0x11c0>
1454a5d28:     	testq	%rax, %rax
1454a5d2b:     	je	0x1454aabde <.text+0x54a9bde>
1454a5d31:     	movq	%rax, 0x348(%rbp)
1454a5d38:     	movl	$0x78, (%rax)
1454a5d3e:     	movq	0x368(%rbp), %rax
1454a5d45:     	movq	0x548(%rax), %rsi
1454a5d4c:     	cmpq	0x538(%rax), %rsi
1454a5d53:     	jne	0x1454a5d62 <.text+0x54a4d62>
1454a5d55:     	movq	0x340(%rbp), %rcx
1454a5d5c:     	callq	0x1457580b0 <.text+0x57570b0>
1454a5d61:     	nop
1454a5d62:     	movq	0x368(%rbp), %rdx
1454a5d69:     	movq	0x540(%rdx), %rax
1454a5d70:     	movq	%rsi, %rcx
1454a5d73:     	shlq	$0x5, %rcx
1454a5d77:     	movq	$0x20, (%rax,%rcx)
1454a5d7f:     	movq	0x348(%rbp), %r8
1454a5d86:     	movq	%r8, 0x8(%rax,%rcx)
1454a5d8b:     	movq	$0x4, 0x10(%rax,%rcx)
1454a5d94:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454a5d9b:     	incq	%rsi
1454a5d9e:     	movq	%rsi, 0x548(%rdx)
1454a5da5:     	movl	$0x2d, %edx
1454a5daa:     	leaq	0x150588f(%rip), %rcx   # 0x1469ab640
1454a5db1:     	callq	0x145452400 <.text+0x5451400>
1454a5db6:     	nop
1454a5db7:     	movq	%rdx, %r8
1454a5dba:     	testq	%rax, %rax
1454a5dbd:     	leaq	0x150587c(%rip), %rcx   # 0x1469ab640
1454a5dc4:     	cmoveq	%rcx, %rax
1454a5dc8:     	movl	$0x2d, %ecx
1454a5dcd:     	cmoveq	%rcx, %r8
1454a5dd1:     	movq	0x368(%rbp), %rcx
1454a5dd8:     	movq	%rax, %rdx
1454a5ddb:     	callq	0x1454d2190 <.text+0x54d1190>
1454a5de0:     	nop
1454a5de1:     	jmp	0x1454a59a0 <.text+0x54a49a0>
