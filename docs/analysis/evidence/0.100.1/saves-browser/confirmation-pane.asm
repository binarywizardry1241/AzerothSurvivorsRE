
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140151bf0:     	pushq	%rbp
140151bf1:     	pushq	%r15
140151bf3:     	pushq	%r14
140151bf5:     	pushq	%r13
140151bf7:     	pushq	%r12
140151bf9:     	pushq	%rsi
140151bfa:     	pushq	%rdi
140151bfb:     	pushq	%rbx
140151bfc:     	subq	$0x478, %rsp            # imm = 0x478
140151c03:     	leaq	0x80(%rsp), %rbp
140151c0b:     	movq	$-0x2, 0x3f0(%rbp)
140151c16:     	movq	%rdx, %rdi
140151c19:     	movq	%rcx, %rsi
140151c1c:     	movq	(%rcx), %r15
140151c1f:     	movq	0x28(%rcx), %rax
140151c23:     	movq	%r15, 0x380(%rbp)
140151c2a:     	movups	0x8(%rcx), %xmm0
140151c2e:     	movups	%xmm0, 0x388(%rbp)
140151c35:     	movups	0x18(%rcx), %xmm0
140151c39:     	movups	%xmm0, 0x398(%rbp)
140151c40:     	movq	%rax, 0x3a8(%rbp)
140151c47:     	movw	$0x0, 0x2d4(%rbp)
140151c50:     	movb	$0x1, 0x2c4(%rbp)
140151c57:     	xorps	%xmm0, %xmm0
140151c5a:     	movaps	%xmm0, 0x1d0(%rbp)
140151c61:     	movaps	%xmm0, 0x1e0(%rbp)
140151c68:     	movaps	%xmm0, 0x1f0(%rbp)
140151c6f:     	movaps	%xmm0, 0x200(%rbp)
140151c76:     	movaps	%xmm0, 0x210(%rbp)
140151c7d:     	movq	$0x0, 0x220(%rbp)
140151c88:     	movl	$0x0, 0x2e8(%rbp)
140151c92:     	movw	$0x0, 0x2ec(%rbp)
140151c9b:     	movups	0x57eeb26(%rip), %xmm0  # 0x1459407c8
140151ca2:     	movups	%xmm0, 0x228(%rbp)
140151ca9:     	movups	0x57eeb28(%rip), %xmm0  # 0x1459407d8
140151cb0:     	movups	%xmm0, 0x238(%rbp)
140151cb7:     	movups	0x57eeb2a(%rip), %xmm0  # 0x1459407e8
140151cbe:     	movups	%xmm0, 0x248(%rbp)
140151cc5:     	movups	0x57eeb2c(%rip), %xmm0  # 0x1459407f8
140151ccc:     	movups	%xmm0, 0x258(%rbp)
140151cd3:     	movups	0x57eeb3e(%rip), %xmm0  # 0x145940818
140151cda:     	movups	%xmm0, 0x278(%rbp)
140151ce1:     	movups	0x57eeb20(%rip), %xmm0  # 0x145940808
140151ce8:     	movups	%xmm0, 0x268(%rbp)
140151cef:     	movups	0x57eeb42(%rip), %xmm0  # 0x145940838
140151cf6:     	movups	%xmm0, 0x298(%rbp)
140151cfd:     	movups	0x57eeb24(%rip), %xmm0  # 0x145940828
140151d04:     	movups	%xmm0, 0x288(%rbp)
140151d0b:     	movb	$0x0, 0x2e6(%rbp)
140151d12:     	movl	$0x0, 0x2e2(%rbp)
140151d1c:     	movq	$0x0, 0x2c8(%rbp)
140151d27:     	movl	$0x3f800000, 0x2d0(%rbp) # imm = 0x3F800000
140151d31:     	movaps	0x57b5788(%rip), %xmm0  # 0x1459074c0
140151d38:     	movups	%xmm0, 0x2a8(%rbp)
140151d3f:     	movl	$0x1, 0x2b8(%rbp)
140151d49:     	movq	$0x0, 0x2bc(%rbp)
140151d54:     	movb	$0x0, 0x2e7(%rbp)
140151d5b:     	movups	0x57ee9ae(%rip), %xmm0  # 0x145940710
140151d62:     	movaps	%xmm0, 0x170(%rbp)
140151d69:     	movq	$0x0, 0x180(%rbp)
140151d74:     	movups	0x57ee9ad(%rip), %xmm0  # 0x145940728
140151d7b:     	movups	%xmm0, 0x188(%rbp)
140151d82:     	movq	$0x0, 0x198(%rbp)
140151d8d:     	movups	0x57ee9ac(%rip), %xmm0  # 0x145940740
140151d94:     	movaps	%xmm0, 0x1a0(%rbp)
140151d9b:     	movq	$0x0, 0x1b0(%rbp)
140151da6:     	movups	0x57ee9ab(%rip), %xmm0  # 0x145940758
140151dad:     	movups	%xmm0, 0x1b8(%rbp)
140151db4:     	movq	$0x0, 0x1c8(%rbp)
140151dbf:     	movw	$0x0, 0x2da(%rbp)
140151dc8:     	movl	$0x10000, 0x2d6(%rbp)   # imm = 0x10000
140151dd2:     	movw	$0x0, 0x2e0(%rbp)
140151ddb:     	movl	$0x10000, 0x2dc(%rbp)   # imm = 0x10000
140151de5:     	leaq	0x57eee63(%rip), %rax   # 0x145940c4f
140151dec:     	movq	%rax, 0x3b0(%rbp)
140151df3:     	movq	$0x4, 0x3b8(%rbp)
140151dfe:     	movq	%r8, 0x3c0(%rbp)
140151e05:     	leaq	0x57f17ec(%rip), %rax   # 0x1459435f8
140151e0c:     	movq	%rax, 0x3c8(%rbp)
140151e13:     	movq	$0x1, 0x20(%rsp)
140151e1c:     	leaq	0x57f17f5(%rip), %rdx   # 0x145943618
140151e23:     	leaq	0x140(%rbp), %rcx
140151e2a:     	leaq	0x3b0(%rbp), %r9
140151e31:     	movl	$0x17, %r8d
140151e37:     	callq	0x145457c60 <.text+0x5456c60>
140151e3c:     	nop
140151e3d:     	cmpb	$0x1, (%rdi)
140151e40:     	jne	0x140151e61 <.text+0x150e61>
140151e42:     	movl	0x1(%rdi), %eax
140151e45:     	movl	0x4(%rdi), %ecx
140151e48:     	movl	%ecx, 0x3eb(%rbp)
140151e4e:     	movl	%eax, 0x3e8(%rbp)
140151e54:     	movq	0x8(%rdi), %r12
140151e58:     	movzbl	0x10(%rdi), %r13d
140151e5d:     	movb	$0x1, %bl
140151e5f:     	jmp	0x140151e72 <.text+0x150e72>
140151e61:     	movq	0x8(%rdi), %r12
140151e65:     	lock
140151e66:     	incq	(%r12)
140151e6a:     	jle	0x140152033 <.text+0x151033>
140151e70:     	xorl	%ebx, %ebx
140151e72:     	movq	0x150(%rbp), %rax
140151e79:     	movq	%rax, 0x138(%rbp)
140151e80:     	movups	0x140(%rbp), %xmm0
140151e87:     	movups	%xmm0, 0x128(%rbp)
140151e8e:     	movups	0x57ee853(%rip), %xmm0  # 0x1459406e8
140151e95:     	movups	%xmm0, 0x3d4(%rbp)
140151e9c:     	movl	$0x3f800000, 0x3e4(%rbp) # imm = 0x3F800000
140151ea6:     	leaq	-0x58(%rbp), %r14
140151eaa:     	leaq	0x170(%rbp), %rdx
140151eb1:     	movl	$0x180, %r8d            # imm = 0x180
140151eb7:     	movq	%r14, %rcx
140151eba:     	callq	0x1457731ed <.text+0x57721ed>
140151ebf:     	leaq	0x178(%rbp), %rcx
140151ec6:     	movl	$0x198, %r8d            # imm = 0x198
140151ecc:     	movq	%r14, %rdx
140151ecf:     	callq	0x1457731ed <.text+0x57721ed>
140151ed4:     	movq	$0x0, 0x310(%rbp)
140151edf:     	movq	$0x4, 0x318(%rbp)
140151eea:     	movq	$0x0, 0x320(%rbp)
140151ef5:     	movb	%bl, 0x328(%rbp)
140151efb:     	movl	0x3e8(%rbp), %eax
140151f01:     	movl	0x3eb(%rbp), %ecx
140151f07:     	movl	%eax, 0x329(%rbp)
140151f0d:     	movl	%ecx, 0x32c(%rbp)
140151f13:     	movq	%r12, 0x330(%rbp)
140151f1a:     	movq	%r13, 0x338(%rbp)
140151f21:     	movl	$0x41800000, 0x340(%rbp) # imm = 0x41800000
140151f2b:     	movw	$0x190, 0x344(%rbp)     # imm = 0x190
140151f34:     	movb	$0x1, 0x346(%rbp)
140151f3b:     	movups	0x3d3(%rbp), %xmm0
140151f42:     	movups	%xmm0, 0x347(%rbp)
140151f49:     	movq	0x3e0(%rbp), %rax
140151f50:     	movq	%rax, 0x354(%rbp)
140151f57:     	movups	0x57c7212(%rip), %xmm0  # 0x145919170
140151f5e:     	movups	%xmm0, 0x35c(%rbp)
140151f65:     	movl	0x57c7215(%rip), %eax   # 0x145919180
140151f6b:     	movl	%eax, 0x36c(%rbp)
140151f71:     	movsd	0x57c3857(%rip), %xmm0  # 0x1459157d0
140151f79:     	movsd	%xmm0, 0x370(%rbp)
140151f81:     	movq	%r15, 0x170(%rbp)
140151f88:     	leaq	0x140(%rbp), %rcx
140151f8f:     	leaq	0x170(%rbp), %r14
140151f96:     	leaq	0x388(%rbp), %rdx
140151f9d:     	movq	%r14, %r8
140151fa0:     	callq	0x1400db410 <.text+0xda410>
140151fa5:     	leaq	0x57f1683(%rip), %rcx   # 0x14594362f
140151fac:     	movl	$0xf, %edx
140151fb1:     	callq	0x145457c00 <.text+0x5456c00>
140151fb6:     	movq	%rdx, %r9
140151fb9:     	movabsq	$-0x7ffffffffffffff2, %rcx # imm = 0x800000000000000E
140151fc3:     	movq	%rcx, 0x170(%rbp)
140151fca:     	movq	%r14, 0x20(%rsp)
140151fcf:     	leaq	0x380(%rbp), %rbx
140151fd6:     	movq	%rbx, %rcx
140151fd9:     	movq	%rdi, %rdx
140151fdc:     	movq	%rax, %r8
140151fdf:     	callq	0x14027f930 <.text+0x27e930>
140151fe4:     	leaq	0x57f1653(%rip), %rcx   # 0x14594363e
140151feb:     	movl	$0xe, %edx
140151ff0:     	callq	0x145457c00 <.text+0x5456c00>
140151ff5:     	movq	%rdx, %r9
140151ff8:     	movabsq	$-0x7ffffffffffffff1, %rcx # imm = 0x800000000000000F
140152002:     	movq	%rcx, 0x170(%rbp)
140152009:     	movq	%r14, 0x20(%rsp)
14015200e:     	movq	%rbx, %rcx
140152011:     	movq	%rdi, %rdx
140152014:     	movq	%rax, %r8
140152017:     	callq	0x14027f930 <.text+0x27e930>
14015201c:     	movq	%rsi, %rax
14015201f:     	addq	$0x478, %rsp            # imm = 0x478
140152026:     	popq	%rbx
140152027:     	popq	%rdi
140152028:     	popq	%rsi
140152029:     	popq	%r12
14015202b:     	popq	%r13
14015202d:     	popq	%r14
14015202f:     	popq	%r15
140152031:     	popq	%rbp
140152032:     	retq
140152033:     	ud2
