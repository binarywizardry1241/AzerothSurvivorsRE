
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14550d590:     	pushq	%rsi
14550d591:     	subq	$0x20, %rsp
14550d595:     	ucomiss	%xmm1, %xmm2
14550d598:     	jbe	0x14550d6d6 <.text+0x550c6d6>
14550d59e:     	movaps	%xmm2, %xmm3
14550d5a1:     	subss	%xmm1, %xmm3
14550d5a5:     	movd	%xmm3, %r10d
14550d5aa:     	movl	%r10d, %eax
14550d5ad:     	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
14550d5b2:     	cmpl	$0x7f7fffff, %eax       # imm = 0x7F7FFFFF
14550d5b7:     	jg	0x14550d6f0 <.text+0x550c6f0>
14550d5bd:     	movq	(%rcx), %r8
14550d5c0:     	movq	0x8(%rcx), %rax
14550d5c4:     	movq	0x18(%rcx), %r9
14550d5c8:     	movq	0x10(%rcx), %rdx
14550d5cc:     	movd	%xmm1, %esi
14550d5d0:     	andl	$0x7fffffff, %esi       # imm = 0x7FFFFFFF
14550d5d6:     	movd	%xmm2, %r11d
14550d5db:     	andl	$0x7fffffff, %r11d      # imm = 0x7FFFFFFF
14550d5e2:     	cmpl	$0x7f800000, %r11d      # imm = 0x7F800000
14550d5e9:     	setl	%r11b
14550d5ed:     	cmpl	$0x7f7fffff, %esi       # imm = 0x7F7FFFFF
14550d5f3:     	jg	0x14550d677 <.text+0x550c677>
14550d5f9:     	testb	%r11b, %r11b
14550d5fc:     	je	0x14550d677 <.text+0x550c677>
14550d5fe:     	movss	0x3f9f06(%rip), %xmm3   # 0x14590750c
14550d606:     	nopw	%cs:(%rax,%rax)
14550d610:     	leaq	(%r8,%r9), %r11
14550d614:     	rolq	$0x17, %r11
14550d618:     	addq	%r8, %r11
14550d61b:     	movq	%rax, %rsi
14550d61e:     	shlq	$0x11, %rsi
14550d622:     	xorq	%r8, %rdx
14550d625:     	xorq	%rax, %r9
14550d628:     	xorq	%rdx, %rax
14550d62b:     	xorq	%r9, %r8
14550d62e:     	xorq	%rsi, %rdx
14550d631:     	rolq	$0x2d, %r9
14550d635:     	shrq	$0x29, %r11
14550d639:     	orl	$0x3f800000, %r11d      # imm = 0x3F800000
14550d640:     	movd	%r11d, %xmm4
14550d645:     	addss	%xmm3, %xmm4
14550d649:     	movd	%r10d, %xmm0
14550d64e:     	mulss	%xmm4, %xmm0
14550d652:     	addss	%xmm1, %xmm0
14550d656:     	ucomiss	%xmm0, %xmm2
14550d659:     	ja	0x14550d6c1 <.text+0x550c6c1>
14550d65b:     	movl	%r10d, %r11d
14550d65e:     	andl	$0x7fffffff, %r11d      # imm = 0x7FFFFFFF
14550d665:     	xorl	%esi, %esi
14550d667:     	cmpl	$0x7f800000, %r11d      # imm = 0x7F800000
14550d66e:     	setge	%sil
14550d672:     	subl	%esi, %r10d
14550d675:     	jmp	0x14550d610 <.text+0x550c610>
14550d677:     	leaq	(%r8,%r9), %r10
14550d67b:     	rolq	$0x17, %r10
14550d67f:     	addq	%r8, %r10
14550d682:     	movq	%rax, %r11
14550d685:     	shlq	$0x11, %r11
14550d689:     	xorq	%r8, %rdx
14550d68c:     	xorq	%rax, %r9
14550d68f:     	xorq	%rdx, %rax
14550d692:     	xorq	%r9, %r8
14550d695:     	xorq	%r11, %rdx
14550d698:     	rolq	$0x2d, %r9
14550d69c:     	shrq	$0x29, %r10
14550d6a0:     	orl	$0x3f800000, %r10d      # imm = 0x3F800000
14550d6a7:     	movd	%r10d, %xmm0
14550d6ac:     	addss	0x3f9e58(%rip), %xmm0   # 0x14590750c
14550d6b4:     	mulss	%xmm3, %xmm0
14550d6b8:     	addss	%xmm1, %xmm0
14550d6bc:     	ucomiss	%xmm0, %xmm2
14550d6bf:     	jbe	0x14550d677 <.text+0x550c677>
14550d6c1:     	movq	%r8, (%rcx)
14550d6c4:     	movq	%r9, 0x18(%rcx)
14550d6c8:     	movq	%rax, 0x8(%rcx)
14550d6cc:     	movq	%rdx, 0x10(%rcx)
14550d6d0:     	addq	$0x20, %rsp
14550d6d4:     	popq	%rsi
14550d6d5:     	retq
14550d6d6:     	leaq	0x14ebb88(%rip), %rcx   # 0x1469f9265
14550d6dd:     	leaq	0x14ebbfc(%rip), %r8    # 0x1469f92e0
14550d6e4:     	movl	$0x19, %edx
14550d6e9:     	callq	0x145903cf0 <.text+0x5902cf0>
14550d6ee:     	ud2
14550d6f0:     	leaq	0x14ebb41(%rip), %rcx   # 0x1469f9238
14550d6f7:     	leaq	0x14ebb22(%rip), %r8    # 0x1469f9220
14550d6fe:     	movl	$0x2d, %edx
14550d703:     	callq	0x145903cf0 <.text+0x5902cf0>
14550d708:     	ud2
