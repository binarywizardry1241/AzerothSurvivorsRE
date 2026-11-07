# resource-id-init
Disassembly of section .text:

0000000140001000 <.text>:
140c5659f:     	movq	%r15, 0x378(%rbp)
140c565a6:     	movq	%r12, 0x380(%rbp)
140c565ad:     	movq	$0x0, 0x360(%rbp)
140c565b8:     	movq	$0x8, 0x368(%rbp)
140c565c3:     	movq	$0x0, 0x370(%rbp)
140c565ce:     	leaq	0x529eaf3(%rip), %rdx   # 0x145ef50c8
140c565d5:     	leaq	0x360(%rbp), %rcx
140c565dc:     	callq	0x14097e790 <.text+0x97d790>
140c565e1:     	movq	%rax, 0x348(%rbp)
140c565e8:     	movq	0x360(%rbp), %rdx
140c565ef:     	testq	%rdx, %rdx
140c565f2:     	je	0x140c5660a <.text+0xc5560a>
140c565f4:     	movq	0x368(%rbp), %rcx
140c565fb:     	shlq	$0x3, %rdx
140c565ff:     	movl	$0x8, %r8d
140c56605:     	callq	0x1400021d0 <.text+0x11d0>

# resource-id-state-field
Disassembly of section .text:

0000000140001000 <.text>:
140c568b7:     	movq	0x340(%rbp), %rax
140c568be:     	movq	%rax, 0x268(%rdi)
140c568c5:     	movq	0x348(%rbp), %rax
140c568cc:     	movq	%rax, 0x270(%rdi)

# resource-fetch
Disassembly of section .text:

0000000140001000 <.text>:
140c571d7:     	movq	0x270(%rsi), %r10
140c571de:     	cmpq	%rax, %r10
140c571e1:     	jae	0x140c5768b <.text+0xc5668b>
140c571e7:     	movq	(%r9,%r10,8), %rax
140c571eb:     	testq	%rax, %rax
140c571ee:     	je	0x140c5768b <.text+0xc5668b>
140c571f4:     	notq	%rax
140c571f7:     	imulq	$0x38, %rax, %r9
140c571fb:     	cmpb	$0x0, 0x30(%rdx,%r9)
140c57201:     	je	0x140c5768b <.text+0xc5668b>
140c57207:     	addq	%rdx, %r8
140c5720a:     	movq	0x10(%r8), %r10
140c5720e:     	addq	%rdx, %r9
140c57211:     	movq	0x10(%r9), %rax
140c57215:     	movq	%rax, 0xc0(%rsp)
140c5721d:     	movl	0x5b0(%rbx), %eax

# resource-wrapper
Disassembly of section .text:

0000000140001000 <.text>:
140c57502:     	movq	0xc0(%rsp), %r8
140c5750a:     	movq	%r8, 0x1c0(%rsp)
140c57512:     	leaq	0x28(%r15), %r14
140c57516:     	addq	$0x2c, %r15
140c5751a:     	movq	%r9, 0x1c8(%rsp)

# paint-resource-argument
Disassembly of section .text:

0000000140001000 <.text>:
140c575b8:     	leaq	0x1c0(%rsp), %rbx
140c575c0:     	movl	%r13d, 0x2c0(%rsp)
140c575c8:     	leaq	0x1e8(%rsp), %r14
140c575d0:     	movl	%ebp, 0x2c4(%rsp)
140c575d7:     	movq	%rax, 0x60(%rsp)
140c575dc:     	movq	%r14, 0x58(%rsp)
140c575e1:     	movq	%rsi, 0x50(%rsp)
140c575e6:     	movq	%rbx, 0x48(%rsp)
140c575eb:     	movq	%r10, 0x40(%rsp)
140c575f0:     	movq	%r12, 0x38(%rsp)
140c575f5:     	movq	%r11, 0x30(%rsp)
140c575fa:     	movq	%rdi, 0x28(%rsp)
140c575ff:     	movq	%rdx, 0x20(%rsp)
140c57604:     	leaq	0xe8(%rsp), %rdx
140c5760c:     	callq	0x140bfa140 <.text+0xbf9140>

# paint-stack-frame
Disassembly of section .text:

0000000140001000 <.text>:
140bfa140:     	pushq	%rbp
140bfa141:     	pushq	%r15
140bfa143:     	pushq	%r14
140bfa145:     	pushq	%r13
140bfa147:     	pushq	%r12
140bfa149:     	pushq	%rsi
140bfa14a:     	pushq	%rdi
140bfa14b:     	pushq	%rbx
140bfa14c:     	subq	$0x728, %rsp            # imm = 0x728
140bfa153:     	leaq	0x80(%rsp), %rbp

# paint-empty-slot
Disassembly of section .text:

0000000140001000 <.text>:
140bfa896:     	xorpd	%xmm0, %xmm0
140bfa89a:     	movapd	%xmm0, -0x10(%rbp)

# convert-slot-argument
Disassembly of section .text:

0000000140001000 <.text>:
140bfba87:     	cmpq	$0x0, 0x728(%rbp)
140bfba8f:     	leaq	-0x10(%rbp), %rcx
140bfba93:     	movq	%rcx, 0x68(%rsp)

# paint-call-convert
Disassembly of section .text:

0000000140001000 <.text>:
140bfbad7:     	movq	0x560(%rbp), %rax
140bfbade:     	movq	%rax, 0x28(%rsp)
140bfbae3:     	movss	%xmm9, 0x20(%rsp)
140bfbaea:     	movq	%r15, %rcx
140bfbaed:     	movaps	%xmm6, %xmm1
140bfbaf0:     	movaps	%xmm7, %xmm2
140bfbaf3:     	movaps	%xmm8, %xmm3
140bfbaf7:     	callq	0x140c01c70 <.text+0xc00c70>

# paint-publish-slot
Disassembly of section .text:

0000000140001000 <.text>:
140bfc46d:     	movq	0x738(%rbp), %rdx
140bfc474:     	movl	0x1c(%rdx), %eax
140bfc477:     	movq	0x10(%rdx), %rcx
140bfc47b:     	movl	%eax, (%rcx)
140bfc47d:     	movq	(%rdx), %rax
140bfc480:     	movaps	-0x10(%rbp), %xmm0
140bfc484:     	movaps	(%rbp), %xmm1
140bfc488:     	movaps	0x10(%rbp), %xmm2
140bfc48c:     	movaps	0x20(%rbp), %xmm3
140bfc490:     	movaps	%xmm3, 0x30(%rax)
140bfc494:     	movaps	%xmm2, 0x20(%rax)
140bfc498:     	movaps	%xmm1, 0x10(%rax)
140bfc49c:     	movaps	%xmm0, (%rax)

# convert-stack-frame
Disassembly of section .text:

0000000140001000 <.text>:
140c01c70:     	pushq	%rbp
140c01c71:     	pushq	%r15
140c01c73:     	pushq	%r14
140c01c75:     	pushq	%r13
140c01c77:     	pushq	%r12
140c01c79:     	pushq	%rsi
140c01c7a:     	pushq	%rdi
140c01c7b:     	pushq	%rbx
140c01c7c:     	subq	$0x6a8, %rsp            # imm = 0x6A8
140c01c83:     	leaq	0x80(%rsp), %rbp

# convert-coordinate-transform
Disassembly of section .text:

0000000140001000 <.text>:
140c01ce4:     	movq	%rcx, %r12
140c01ce7:     	cmpb	$0x0, 0xd4(%rcx)
140c01cee:     	je	0x140c01e8b <.text+0xc00e8b>
140c01cf4:     	movaps	%xmm1, %xmm6
140c01cf7:     	movss	0xdc(%r12), %xmm0
140c01d01:     	mulss	%xmm1, %xmm0
140c01d05:     	movss	0xe0(%r12), %xmm1
140c01d0f:     	mulss	%xmm6, %xmm1
140c01d13:     	movss	0xe4(%r12), %xmm4
140c01d1d:     	mulss	%xmm6, %xmm4
140c01d21:     	movq	%r12, 0x528(%rbp)
140c01d28:     	movss	0xd8(%r12), %xmm5
140c01d32:     	mulss	%xmm6, %xmm5
140c01d36:     	movaps	%xmm3, %xmm7
140c01d39:     	subss	%xmm1, %xmm7
140c01d3d:     	unpcklps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0],xmm0[1],xmm7[1]
140c01d40:     	movaps	%xmm3, %xmm1
140c01d43:     	subss	%xmm5, %xmm1
140c01d47:     	movlhps	%xmm4, %xmm1            # xmm1 = xmm1[0],xmm4[0]
140c01d4a:     	movddup	%xmm0, %xmm4            # xmm4 = xmm0[0,0]
140c01d4e:     	shufps	$0x24, %xmm1, %xmm0     # xmm0 = xmm0[0,1],xmm1[2,0]
140c01d52:     	movaps	%xmm0, %xmm1
140c01d55:     	shufps	$0x4e, %xmm0, %xmm1     # xmm1 = xmm1[2,3],xmm0[0,1]
140c01d59:     	movaps	%xmm0, %xmm5
140c01d5c:     	cmpltps	%xmm1, %xmm5
140c01d60:     	movhlps	%xmm0, %xmm0            # xmm0 = xmm0[1,1]
140c01d63:     	andpd	%xmm5, %xmm4
140c01d67:     	andnps	%xmm0, %xmm5
140c01d6a:     	orps	%xmm4, %xmm5
140c01d6d:     	movaps	%xmm5, 0x530(%rbp)

# convert-minimap-variant
Disassembly of section .text:

0000000140001000 <.text>:
140c0248d:     	movq	0x10(%r12), %r8
140c02492:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
140c0249c:     	xorq	%r8, %rax
140c0249f:     	cmpq	$0x7, %rax
140c024a3:     	movl	$0x3, %ecx
140c024a8:     	cmovbq	%rax, %rcx
140c024ac:     	movl	$0x1, %edi
140c024b1:     	leaq	0x536daf0(%rip), %rdx   # 0x145f6ffa8
140c024b8:     	movslq	(%rdx,%rcx,4), %rcx
140c024bc:     	addq	%rdx, %rcx
140c024bf:     	jmpq	*%rcx
140c024c1:     	xorl	%edi, %edi
140c024c3:     	movq	0x10(%r12), %r8
140c024c8:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
140c024d2:     	xorq	%r8, %rax
140c024d5:     	cmpq	$0x7, %rax
140c024d9:     	movl	$0x3, %ecx
140c024de:     	cmovbq	%rax, %rcx
140c024e2:     	leaq	0x536dabf(%rip), %rdx   # 0x145f6ffa8
140c024e9:     	movslq	(%rdx,%rcx,4), %rcx
140c024ed:     	addq	%rdx, %rcx
140c024f0:     	jmpq	*%rcx
140c024f2:     	movq	0x6d8(%rbp), %rax
140c024f9:     	movzwl	0x18(%r12), %ecx
140c024ff:     	movaps	(%r12), %xmm0
140c02504:     	movss	0xfc(%r12), %xmm1
140c0250e:     	movq	$0x1, (%rax)
140c02515:     	movq	$0x0, 0x8(%rax)
140c0251d:     	movaps	0x530(%rbp), %xmm2
140c02524:     	movaps	%xmm2, 0x10(%rax)
140c02528:     	movaps	%xmm0, 0x20(%rax)
140c0252c:     	movss	%xmm1, 0x30(%rax)
140c02531:     	movw	%cx, 0x34(%rax)
140c02535:     	jmp	0x140c0642d <.text+0xc0542d>

# quad-debug-variant-dispatch
Disassembly of section .text:

0000000140001000 <.text>:
140c76793:     	movq	%rcx, %rax
140c76796:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
140c767a0:     	xorq	(%rax), %rcx
140c767a3:     	cmpq	$0x7, %rcx
140c767a7:     	movl	$0x3, %r8d
140c767ad:     	cmovbq	%rcx, %r8
140c767b1:     	movq	%rdx, %rcx
140c767b4:     	leaq	0x52f9961(%rip), %rdx   # 0x145f7011c
140c767bb:     	movslq	(%rdx,%r8,4), %r8
140c767bf:     	addq	%rdx, %r8
140c767c2:     	jmpq	*%r8

# quad-debug-minimap-name
Disassembly of section .text:

0000000140001000 <.text>:
140c76abd:     	leaq	0x8(%rax), %rdx
140c76ac1:     	addq	$0x9, %rax
140c76ac5:     	movq	%rax, 0x60(%rsp)
140c76aca:     	leaq	0x52f82b7(%rip), %rax   # 0x145f6ed88
140c76ad1:     	movq	%rax, 0x50(%rsp)
140c76ad6:     	leaq	0x60(%rsp), %rax
140c76adb:     	movq	%rax, 0x48(%rsp)
140c76ae0:     	leaq	0x52f82cc(%rip), %rax   # 0x145f6edb3
140c76ae7:     	movq	%rax, 0x38(%rsp)
140c76aec:     	leaq	0x52f8275(%rip), %rax   # 0x145f6ed68
140c76af3:     	movq	%rax, 0x30(%rsp)
140c76af8:     	movq	%rdx, 0x28(%rsp)
140c76afd:     	movq	$0xb, 0x40(%rsp)
140c76b06:     	movq	$0x4, 0x20(%rsp)
140c76b0f:     	leaq	0x52f8292(%rip), %rdx   # 0x145f6eda8
140c76b16:     	leaq	0x52f8292(%rip), %r9    # 0x145f6edaf
140c76b1d:     	movl	$0x7, %r8d
140c76b23:     	callq	0x145ba28f0 <.text+0x5ba18f0>
140c76b28:     	jmp	0x140c76da8 <.text+0xc75da8>
