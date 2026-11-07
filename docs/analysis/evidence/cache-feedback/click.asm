
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d2760:     	pushq	%rbp
1454d2761:     	pushq	%rsi
1454d2762:     	pushq	%rdi
1454d2763:     	subq	$0x30, %rsp
1454d2767:     	leaq	0x30(%rsp), %rbp
1454d276c:     	movq	$-0x2, -0x8(%rbp)
1454d2774:     	cmpb	$0x1, 0x9b9(%rcx)
1454d277b:     	jne	0x1454d28be <.text+0x54d18be>
1454d2781:     	movq	0x548(%rcx), %r8
1454d2788:     	testq	%r8, %r8
1454d278b:     	je	0x1454d28be <.text+0x54d18be>
1454d2791:     	movsd	0x400(%rcx), %xmm0
1454d2799:     	movq	0x540(%rcx), %rax
1454d27a0:     	shlq	$0x3, %r8
1454d27a4:     	leaq	(%r8,%r8,8), %r8
1454d27a8:     	xorl	%esi, %esi
1454d27aa:     	xorl	%r9d, %r9d
1454d27ad:     	jmp	0x1454d27c0 <.text+0x54d17c0>
1454d27af:     	nop
1454d27b0:     	incq	%rsi
1454d27b3:     	addq	$0x48, %r9
1454d27b7:     	cmpq	%r9, %r8
1454d27ba:     	je	0x1454d28be <.text+0x54d18be>
1454d27c0:     	cmpq	%rdx, 0x28(%rax,%r9)
1454d27c5:     	jne	0x1454d27b0 <.text+0x54d17b0>
1454d27c7:     	cmpl	$0x2, 0x20(%rax,%r9)
1454d27cd:     	jne	0x1454d27b0 <.text+0x54d17b0>
1454d27cf:     	movsd	0x34(%rax,%r9), %xmm1
1454d27d6:     	subps	%xmm0, %xmm1
1454d27d9:     	mulps	%xmm1, %xmm1
1454d27dc:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454d27e0:     	addss	%xmm1, %xmm0
1454d27e4:     	sqrtss	%xmm0, %xmm0
1454d27e8:     	ucomiss	0x443011(%rip), %xmm0   # 0x145915800
1454d27ef:     	ja	0x1454d28be <.text+0x54d18be>
1454d27f5:     	movq	%rcx, %rdi
1454d27f8:     	callq	0x1454e5660 <.text+0x54e4660>
1454d27fd:     	testb	%al, %al
1454d27ff:     	je	0x1454d28be <.text+0x54d18be>
1454d2805:     	movq	%rdi, %rcx
1454d2808:     	movq	%rsi, %rdx
1454d280b:     	callq	0x1454e3210 <.text+0x54e2210>
1454d2810:     	callq	0x140002200 <.text+0x1200>
1454d2815:     	movl	$0x20, %ecx
1454d281a:     	movl	$0x1, %edx
1454d281f:     	callq	0x1400021c0 <.text+0x11c0>
1454d2824:     	testq	%rax, %rax
1454d2827:     	je	0x1454d28c6 <.text+0x54d18c6>
1454d282d:     	movq	%rax, -0x10(%rbp)
1454d2831:     	movl	$0x4b4, (%rax)          # imm = 0x4B4
1454d2837:     	movq	%rdi, %rcx
1454d283a:     	movq	0x560(%rdi), %rsi
1454d2841:     	cmpq	0x550(%rdi), %rsi
1454d2848:     	jne	0x1454d2859 <.text+0x54d1859>
1454d284a:     	addq	$0x550, %rcx            # imm = 0x550
1454d2851:     	callq	0x145774710 <.text+0x5773710>
1454d2856:     	movq	%rdi, %rcx
1454d2859:     	movq	0x558(%rcx), %rax
1454d2860:     	movq	%rsi, %rdx
1454d2863:     	shlq	$0x5, %rdx
1454d2867:     	movq	$0x20, (%rax,%rdx)
1454d286f:     	movq	-0x10(%rbp), %r8
1454d2873:     	movq	%r8, 0x8(%rax,%rdx)
1454d2878:     	movq	$0x4, 0x10(%rax,%rdx)
1454d2881:     	movw	$0x2d2, 0x18(%rax,%rdx) # imm = 0x2D2
1454d2888:     	incq	%rsi
1454d288b:     	movq	%rsi, 0x560(%rcx)
1454d2892:     	cmpb	$0x1, 0x9b9(%rcx)
1454d2899:     	jne	0x1454d28be <.text+0x54d18be>
1454d289b:     	cmpl	$0x0, 0x940(%rcx)
1454d28a2:     	je	0x1454d28be <.text+0x54d18be>
1454d28a4:     	cmpb	$0x0, 0x9b2(%rcx)
1454d28ab:     	jne	0x1454d28be <.text+0x54d18be>
1454d28ad:     	movb	$0x1, %dl
1454d28af:     	movb	$0x1, %r8b
1454d28b2:     	addq	$0x30, %rsp
1454d28b6:     	popq	%rdi
1454d28b7:     	popq	%rsi
1454d28b8:     	popq	%rbp
1454d28b9:     	jmp	0x1454ec7a0 <.text+0x54eb7a0>
1454d28be:     	addq	$0x30, %rsp
1454d28c2:     	popq	%rdi
1454d28c3:     	popq	%rsi
1454d28c4:     	popq	%rbp
1454d28c5:     	retq
1454d28c6:     	movl	$0x1, %ecx
1454d28cb:     	movl	$0x20, %edx
1454d28d0:     	callq	0x14590379b <.text+0x590279b>
1454d28d5:     	ud2
