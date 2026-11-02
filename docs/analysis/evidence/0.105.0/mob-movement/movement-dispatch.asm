
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14593d6bb:     	leaq	0x28(%rax), %r15
14593d6bf:     	movq	(%rax), %r13
14593d6c2:     	movl	0x10(%rax), %ecx
14593d6c5:     	movl	%ecx, 0x1a0(%rbp)
14593d6cb:     	movq	0x8(%rax), %rcx
14593d6cf:     	movq	%rcx, 0x198(%rbp)
14593d6d6:     	movsd	0x14(%rax), %xmm7
14593d6db:     	movss	0x1c(%rax), %xmm11
14593d6e1:     	movss	0x20(%rax), %xmm10
14593d6e7:     	movq	0x2a0(%rbp), %rax
14593d6ee:     	movl	0xa10(%rax), %ebx
14593d6f4:     	incl	%ebx
14593d6f6:     	movl	%ebx, 0xa10(%rax)
14593d6fc:     	ucomiss	%xmm10, %xmm9
14593d700:     	jae	0x14593d7e0 <.text+0x593c7e0>
14593d706:     	movq	0x950(%rax), %rcx
14593d70d:     	addq	$0x10, %rcx
14593d711:     	movsd	0x198(%rbp), %xmm8
14593d71a:     	movshdup	%xmm8, %xmm2            # xmm2 = xmm8[1,1,3,3]
14593d71f:     	movaps	%xmm8, %xmm1
14593d723:     	callq	0x1458c7b60 <.text+0x58c6b60>
14593d728:     	nop
14593d729:     	testb	$0x1, %al
14593d72b:     	jne	0x14593d735 <.text+0x593c735>
14593d72d:     	movss	0x1a0(%rbp), %xmm0
14593d735:     	movlps	%xmm8, -0x8(%rbp)
14593d73a:     	movss	%xmm0, (%rbp)
14593d73f:     	movq	0x2a0(%rbp), %rax
14593d746:     	movq	0x950(%rax), %rcx
14593d74d:     	addq	$0x10, %rcx
14593d751:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
14593d755:     	movaps	%xmm7, %xmm1
14593d758:     	callq	0x1458c7b60 <.text+0x58c6b60>
14593d75d:     	nop
14593d75e:     	testb	$0x1, %al
14593d760:     	jne	0x14593d766 <.text+0x593c766>
14593d762:     	movaps	%xmm11, %xmm0
14593d766:     	movlps	%xmm7, -0x18(%rbp)
14593d76a:     	mulss	0x481e31(%rip), %xmm10  # 0x145dbf5a4
14593d773:     	cvttss2si	%xmm10, %rax
14593d778:     	ucomiss	%xmm9, %xmm10
14593d77c:     	movl	$0x0, %ecx
14593d781:     	cmovbl	%ecx, %eax
14593d784:     	movss	%xmm0, -0x10(%rbp)
14593d789:     	ucomiss	%xmm13, %xmm10
14593d78d:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14593d792:     	ja	0x14593d796 <.text+0x593c796>
14593d794:     	movl	%eax, %ecx
14593d796:     	movl	%ecx, 0x28(%rsp)
14593d79a:     	movl	%ebx, 0x20(%rsp)
14593d79e:     	movq	%r14, %rcx
14593d7a1:     	movq	%r13, %rdx
14593d7a4:     	leaq	-0x8(%rbp), %r8
14593d7a8:     	movq	%r12, %r9
14593d7ab:     	callq	0x1458aa9e0 <.text+0x58a99e0>
14593d7b0:     	nop
14593d7b1:     	movq	0x2a0(%rbp), %rbx
14593d7b8:     	movq	0x5e0(%rbx), %rsi
14593d7bf:     	cmpq	0x5d0(%rbx), %rsi
14593d7c6:     	jne	0x14593d680 <.text+0x593c680>
14593d7cc:     	movq	0x290(%rbp), %rcx
14593d7d3:     	callq	0x145bcb530 <.text+0x5bca530>
14593d7d8:     	nop
14593d7d9:     	jmp	0x14593d680 <.text+0x593c680>
14593d7de:     	nop
14593d7e0:     	movq	0x460(%rax), %rax
14593d7e7:     	movq	%rax, 0x20(%rsp)
14593d7ec:     	movq	%r14, %rcx
14593d7ef:     	movq	%r13, %rdx
14593d7f2:     	leaq	0x198(%rbp), %r8
14593d7f9:     	movl	%ebx, %r9d
14593d7fc:     	callq	0x1458aa520 <.text+0x58a9520>
