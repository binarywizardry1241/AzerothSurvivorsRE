
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a9ddc:     	movq	0x590(%r13), %r9
1454a9de3:     	jmp	0x1454a9de8 <.text+0x54a8de8>
1454a9de5:     	xorl	%r9d, %r9d
1454a9de8:     	movsd	0x3e8(%r13), %xmm0
1454a9df1:     	movq	0x588(%r13), %r14
1454a9df8:     	leaq	(,%r9,8), %rax
1454a9e00:     	leaq	(%rax,%rax,4), %rax
1454a9e04:     	xorl	%r8d, %r8d
1454a9e07:     	xorl	%ecx, %ecx
1454a9e09:     	nopl	(%rax)
1454a9e10:     	cmpq	%rcx, %rax
1454a9e13:     	je	0x1454a9ec2 <.text+0x54a8ec2>
1454a9e19:     	leaq	0x28(%rcx), %rdx
1454a9e1d:     	decq	%r8
1454a9e20:     	cmpq	$0x0, (%r14,%rcx)
1454a9e25:     	movq	%rdx, %rcx
1454a9e28:     	je	0x1454a9e10 <.text+0x54a8e10>
1454a9e2a:     	movq	%r8, %rcx
1454a9e2d:     	notq	%rcx
1454a9e30:     	subq	%rdx, %rax
1454a9e33:     	je	0x1454a9ed7 <.text+0x54a8ed7>
1454a9e39:     	leaq	(%r14,%rdx), %r10
1454a9e3d:     	leaq	(%r14,%rdx), %r11
1454a9e41:     	addq	$-0x28, %r11
1454a9e45:     	movabsq	$-0x3333333333333333, %rdx # imm = 0xCCCCCCCCCCCCCCCD
1454a9e4f:     	mulq	%rdx
1454a9e52:     	shrq	$0x5, %rdx
1454a9e56:     	negq	%r8
1454a9e59:     	xorl	%eax, %eax
1454a9e5b:     	jmp	0x1454a9e6c <.text+0x54a8e6c>
1454a9e5d:     	nopl	(%rax)
1454a9e60:     	incq	%rax
1454a9e63:     	addq	$0x28, %r10
1454a9e67:     	cmpq	%rax, %rdx
1454a9e6a:     	je	0x1454a9ed7 <.text+0x54a8ed7>
1454a9e6c:     	cmpq	$0x0, (%r10)
1454a9e70:     	je	0x1454a9e60 <.text+0x54a8e60>
1454a9e72:     	movsd	0x18(%r11), %xmm1
1454a9e78:     	subps	%xmm0, %xmm1
1454a9e7b:     	mulps	%xmm1, %xmm1
1454a9e7e:     	movsd	0x18(%r10), %xmm2
1454a9e84:     	subps	%xmm0, %xmm2
1454a9e87:     	mulps	%xmm2, %xmm2
1454a9e8a:     	haddps	%xmm2, %xmm1
1454a9e8e:     	shufps	$0xe8, %xmm1, %xmm1     # xmm1 = xmm1[0,2,2,3]
1454a9e92:     	sqrtps	%xmm1, %xmm1
1454a9e95:     	movaps	%xmm1, %xmm2
1454a9e98:     	psrad	$0x1f, %xmm2
1454a9e9d:     	psrld	$0x1, %xmm2
1454a9ea2:     	pxor	%xmm1, %xmm2
1454a9ea6:     	pshufd	$0x55, %xmm2, %xmm1     # xmm1 = xmm2[1,1,1,1]
1454a9eab:     	pcmpgtd	%xmm1, %xmm2
1454a9eaf:     	movd	%xmm2, %esi
1454a9eb3:     	testb	$0x1, %sil
1454a9eb7:     	je	0x1454a9e60 <.text+0x54a8e60>
1454a9eb9:     	leaq	(%r8,%rax), %rcx
1454a9ebd:     	movq	%r10, %r11
1454a9ec0:     	jmp	0x1454a9e60 <.text+0x54a8e60>
1454a9ec2:     	testq	%r9, %r9
1454a9ec5:     	je	0x1454aa103 <.text+0x54a9103>
1454a9ecb:     	cmpq	$0x1, %r9
1454a9ecf:     	jne	0x1454aa8fd <.text+0x54a98fd>
1454a9ed5:     	xorl	%ecx, %ecx
1454a9ed7:     	movss	0x8e4(%r13), %xmm0
1454a9ee0:     	cmpl	$0x1, (%r13)
1454a9ee5:     	jne	0x1454a9f06 <.text+0x54a8f06>
1454a9ee7:     	cmpq	%rcx, 0x8(%r13)
1454a9eeb:     	jne	0x1454a9f06 <.text+0x54a8f06>
1454a9eed:     	movaps	%xmm0, %xmm1
1454a9ef0:     	subss	0x8fc(%r13), %xmm1
1454a9ef9:     	ucomiss	0x51db84(%rip), %xmm1   # 0x1459c7a84
1454a9f00:     	jbe	0x1454aa103 <.text+0x54a9103>
1454a9f06:     	movq	$0x1, (%r13)
1454a9f0e:     	movq	%rcx, 0x8(%r13)
1454a9f12:     	movss	%xmm0, 0x8fc(%r13)
1454a9f1b:     	cmpq	%r9, %rcx
1454a9f1e:     	jae	0x1454aaec0 <.text+0x54a9ec0>
1454a9f24:     	leaq	(%rcx,%rcx,4), %r15
1454a9f28:     	movq	0x210(%r13), %rcx
1454a9f2f:     	movq	0x218(%r13), %rdx
1454a9f36:     	callq	0x14540e820 <.text+0x540d820>
1454a9f3b:     	imulq	$0xf0, %rax, %rax
1454a9f42:     	movq	0x10(%r14,%r15,8), %rcx
1454a9f47:     	movq	0x80(%rax,%r12), %rdx
1454a9f4f:     	cmpq	%rdx, %rcx
1454a9f52:     	jae	0x1454aaed1 <.text+0x54a9ed1>
1454a9f58:     	addq	%rax, %r12
1454a9f5b:     	movq	0x78(%r12), %rsi
1454a9f60:     	leaq	(%rcx,%rcx,4), %rdi
1454a9f64:     	shlq	$0x4, %rdi
1454a9f68:     	leaq	(%rsi,%rdi), %rax
1454a9f6c:     	addq	$0x20, %rax
1454a9f70:     	movq	%rax, 0x230(%rbp)
1454a9f77:     	leaq	0x2740c2(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9f7e:     	movq	%rax, 0x238(%rbp)
1454a9f85:     	leaq	0x12649da(%rip), %rdx   # 0x14670e966
1454a9f8c:     	leaq	0xa0(%rbp), %rcx
1454a9f93:     	leaq	0x230(%rbp), %r8
1454a9f9a:     	callq	0x14570bf80 <.text+0x570af80>
1454a9f9f:     	movq	0xa8(%rbp), %rcx
1454a9fa6:     	movq	0xb0(%rbp), %rdx
1454a9fad:     	movq	0x10(%rsi,%rdi), %r12
1454a9fb2:     	movq	0x18(%rsi,%rdi), %r13
1454a9fb7:     	movq	%rcx, 0x358(%rbp)
1454a9fbe:     	callq	0x145452400 <.text+0x5451400>
1454a9fc3:     	nop
1454a9fc4:     	movq	%rax, %rbx
1454a9fc7:     	movq	%rdx, %rdi
1454a9fca:     	leaq	(%r14,%r15,8), %r14
1454a9fce:     	movq	0xa0(%rbp), %rdx
1454a9fd5:     	testq	%rdx, %rdx
1454a9fd8:     	leaq	0x2d8(%rbp), %rsi
1454a9fdf:     	je	0x1454a9ff3 <.text+0x54a8ff3>
1454a9fe1:     	movl	$0x1, %r8d
1454a9fe7:     	movq	0x358(%rbp), %rcx
1454a9fee:     	callq	0x1400021d0 <.text+0x11d0>
1454a9ff3:     	testq	%rbx, %rbx
1454a9ff6:     	cmovneq	%rbx, %r12
1454a9ffa:     	cmoveq	%r13, %rdi
1454a9ffe:     	movq	%r12, 0x2d8(%rbp)
1454aa005:     	movq	%rdi, 0x2e0(%rbp)
1454aa00c:     	cmpq	$0x0, (%r14)
1454aa010:     	je	0x1454aa030 <.text+0x54a9030>
1454aa012:     	movq	%rsi, 0xa0(%rbp)
1454aa019:     	leaq	-0x54a7f60(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454aa020:     	movq	%rax, 0xa8(%rbp)
1454aa027:     	leaq	0x1502792(%rip), %rdx   # 0x1469ac7c0
1454aa02e:     	jmp	0x1454aa04c <.text+0x54a904c>
1454aa030:     	movq	%rsi, 0xa0(%rbp)
1454aa037:     	leaq	-0x54a7f7e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454aa03e:     	movq	%rax, 0xa8(%rbp)
1454aa045:     	leaq	0x1502782(%rip), %rdx   # 0x1469ac7ce
1454aa04c:     	leaq	0x230(%rbp), %rcx
1454aa053:     	leaq	0xa0(%rbp), %r8
1454aa05a:     	callq	0x14570bf80 <.text+0x570af80>
1454aa05f:     	movq	0x368(%rbp), %r13
1454aa066:     	movss	0x18(%r14), %xmm1
1454aa06c:     	movss	0x1c(%r14), %xmm2
1454aa072:     	movq	0x238(%rbp), %r9
1454aa079:     	movq	0x240(%rbp), %rax
1454aa080:     	movq	%rax, 0x20(%rsp)
1454aa085:     	leaq	0xa0(%rbp), %rcx
1454aa08c:     	movq	%r9, 0x358(%rbp)
1454aa093:     	callq	0x14543fce0 <.text+0x543ece0>
1454aa098:     	nop
1454aa099:     	movq	0x548(%r13), %rsi
1454aa0a0:     	cmpq	0x538(%r13), %rsi
1454aa0a7:     	jne	0x1454aa0b6 <.text+0x54a90b6>
1454aa0a9:     	movq	0x340(%rbp), %rcx
1454aa0b0:     	callq	0x1457580b0 <.text+0x57570b0>
1454aa0b5:     	nop
1454aa0b6:     	movq	0x540(%r13), %rax
1454aa0bd:     	movq	%rsi, %rcx
1454aa0c0:     	shlq	$0x5, %rcx
1454aa0c4:     	movups	0xa0(%rbp), %xmm0
1454aa0cb:     	movups	0xb0(%rbp), %xmm1
1454aa0d2:     	movups	%xmm1, 0x10(%rax,%rcx)
1454aa0d7:     	movups	%xmm0, (%rax,%rcx)
1454aa0db:     	incq	%rsi
1454aa0de:     	movq	%rsi, 0x548(%r13)
1454aa0e5:     	movq	0x230(%rbp), %rdx
1454aa0ec:     	testq	%rdx, %rdx
1454aa0ef:     	je	0x1454aa103 <.text+0x54a9103>
1454aa0f1:     	movl	$0x1, %r8d
1454aa0f7:     	movq	0x358(%rbp), %rcx
1454aa0fe:     	callq	0x1400021d0 <.text+0x11d0>
