
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14084b718:     	movaps	0x51c95f1(%rip), %xmm0  # 0x145a14d10
14084b71f:     	movups	%xmm0, 0xf0(%rax,%rdi)
14084b727:     	movw	$0x0, 0x108(%rax,%rdi)
14084b731:     	movq	$0x0, 0x100(%rax,%rdi)
14084b73d:     	movb	$0x2, 0x10a(%rax,%rdi)
14084b745:     	addq	$0x10c, %rdi            # imm = 0x10C
14084b74c:     	movq	%rdi, 0x10(%rsi)
14084b750:     	testq	%r12, %r12
14084b753:     	je	0x14084ba2d <.text+0x84aa2d>
14084b759:     	testq	%r15, %r15
14084b75c:     	je	0x14084ba2d <.text+0x84aa2d>
14084b762:     	movl	(%r14), %eax
14084b765:     	movb	$0x1, %bl
14084b767:     	cmpl	$0x2, %eax
14084b76a:     	jb	0x14084b77f <.text+0x84a77f>
14084b76c:     	movb	$0x2, %bl
14084b76e:     	cmpl	$0x4, %eax
14084b771:     	jb	0x14084b77f <.text+0x84a77f>
14084b773:     	cmpl	$0x8, %eax
14084b776:     	setae	%bl
14084b779:     	shlb	$0x2, %bl
14084b77c:     	addb	$0x4, %bl
14084b77f:     	movaps	0x51c948a(%rip), %xmm0  # 0x145a14c10
14084b786:     	movaps	%xmm0, 0x220(%rbp)
14084b78d:     	movaps	0x51c958c(%rip), %xmm0  # 0x145a14d20
14084b794:     	movaps	%xmm0, 0x230(%rbp)
14084b79b:     	movl	$0x6, 0x210(%rbp)
14084b7a5:     	movsd	0x51c9583(%rip), %xmm0  # 0x145a14d30
14084b7ad:     	movsd	%xmm0, 0x260(%rbp)
14084b7b5:     	movl	$0x460cc7cd, 0x268(%rbp) # imm = 0x460CC7CD
14084b7bf:     	movaps	0x51992ca(%rip), %xmm0  # 0x1459e4a90
14084b7c6:     	movaps	%xmm0, 0x250(%rbp)
14084b7cd:     	movabsq	$0x3f8000003f800000, %rax # imm = 0x3F8000003F800000
14084b7d7:     	movq	%rax, 0x26c(%rbp)
14084b7de:     	movl	$0x3f800000, 0x274(%rbp) # imm = 0x3F800000
14084b7e8:     	movsd	0x51c9550(%rip), %xmm0  # 0x145a14d40
14084b7f0:     	movsd	%xmm0, 0x70(%rbp)
14084b7f5:     	movl	$0xc2700000, 0x78(%rbp) # imm = 0xC2700000
14084b7fc:     	leaq	0x51c97c5(%rip), %r8    # 0x145a14fc8
14084b803:     	leaq	0x250(%rbp), %rcx
14084b80a:     	leaq	0x70(%rbp), %rdx
14084b80e:     	callq	0x140786c30 <.text+0x785c30>
14084b813:     	nop
14084b814:     	movaps	0x250(%rbp), %xmm0
14084b81b:     	movaps	0x260(%rbp), %xmm1
14084b822:     	movaps	0x270(%rbp), %xmm2
14084b829:     	movaps	%xmm0, 0x1b0(%rbp)
14084b830:     	movaps	%xmm1, 0x1c0(%rbp)
14084b837:     	movaps	%xmm2, 0x1d0(%rbp)
14084b83e:     	movq	$0x0, 0x1e0(%rbp)
14084b849:     	movq	$0x1, 0x1e8(%rbp)
14084b854:     	movl	$0x10, 0x1f0(%rbp)
14084b85e:     	movb	$0x1, 0x1f4(%rbp)
14084b865:     	movb	%bl, 0x200(%rbp)
14084b86b:     	movaps	0x210(%rbp), %xmm0
14084b872:     	movaps	0x220(%rbp), %xmm1
14084b879:     	movaps	0x230(%rbp), %xmm2
14084b880:     	movaps	%xmm0, 0x180(%rbp)
14084b887:     	movaps	%xmm1, 0x190(%rbp)
14084b88e:     	movaps	%xmm2, 0x1a0(%rbp)
14084b895:     	movb	$0x0, 0x201(%rbp)
14084b89c:     	movl	$0x3f800000, 0x1f8(%rbp) # imm = 0x3F800000
14084b8a6:     	movb	$0x0, 0x1fc(%rbp)
14084b8ad:     	movl	$0x0, 0x70(%rbp)
14084b8b4:     	movaps	0x51d3ba5(%rip), %xmm0  # 0x145a1f460
14084b8bb:     	movaps	%xmm0, 0xb0(%rbp)
14084b8c2:     	movaps	0x51d3b87(%rip), %xmm0  # 0x145a1f450
14084b8c9:     	movaps	%xmm0, 0xa0(%rbp)
14084b8d0:     	movaps	0x51d3b69(%rip), %xmm0  # 0x145a1f440
14084b8d7:     	movaps	%xmm0, 0x90(%rbp)
14084b8de:     	movaps	0x51d3b4b(%rip), %xmm0  # 0x145a1f430
14084b8e5:     	movaps	%xmm0, 0x80(%rbp)
14084b8ec:     	movl	$0x0, 0xc0(%rbp)
14084b8f6:     	movl	$0x0, 0xcc(%rbp)
14084b900:     	movq	$0x0, 0xf0(%rbp)
14084b90b:     	movl	$0x0, 0xf8(%rbp)
14084b915:     	movl	$0x0, 0x114(%rbp)
14084b91f:     	movabsq	$0xafffffffe, %rax      # imm = 0xAFFFFFFFE
14084b929:     	movq	%rax, 0x158(%rbp)
14084b930:     	movw	$0x1, 0x170(%rbp)
14084b939:     	movb	$0x1, 0x172(%rbp)
14084b940:     	movsd	0x51c9338(%rip), %xmm0  # 0x145a14c80
14084b948:     	movsd	%xmm0, 0x204(%rbp)
