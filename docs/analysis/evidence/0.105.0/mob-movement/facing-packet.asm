
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458aa520:     	pushq	%rbp
1458aa521:     	pushq	%r14
1458aa523:     	pushq	%rsi
1458aa524:     	pushq	%rdi
1458aa525:     	pushq	%rbx
1458aa526:     	subq	$0x80, %rsp
1458aa52d:     	leaq	0x80(%rsp), %rbp
1458aa535:     	movq	$-0x2, -0x8(%rbp)
1458aa53d:     	movl	%r9d, %ebx
1458aa540:     	movq	%r8, %rdi
1458aa543:     	movq	%rdx, %r14
1458aa546:     	movq	%rcx, %rsi
1458aa549:     	callq	0x140002200 <.text+0x1200>
1458aa54e:     	movl	$0x20, %ecx
1458aa553:     	movl	$0x1, %edx
1458aa558:     	callq	0x1400021c0 <.text+0x11c0>
1458aa55d:     	testq	%rax, %rax
1458aa560:     	je	0x1458aa80d <.text+0x58a980d>
1458aa566:     	movw	$0xdd, -0x18(%rbp)
1458aa56c:     	movq	$0x20, -0x30(%rbp)
1458aa574:     	movq	%rax, -0x28(%rbp)
1458aa578:     	movq	$0x0, -0x20(%rbp)
1458aa580:     	leaq	-0x30(%rbp), %rdx
1458aa584:     	movq	%r14, %rcx
1458aa587:     	callq	0x1458b6c70 <.text+0x58b5c70>
1458aa58c:     	nop
1458aa58d:     	movups	-0x30(%rbp), %xmm0
1458aa591:     	movups	-0x20(%rbp), %xmm1
1458aa595:     	movaps	%xmm1, -0x40(%rbp)
1458aa599:     	movaps	%xmm0, -0x50(%rbp)
1458aa59d:     	leaq	-0x30(%rbp), %rcx
1458aa5a1:     	leaq	-0x50(%rbp), %rdx
1458aa5a5:     	movq	%rdi, %r8
1458aa5a8:     	callq	0x145895ba0 <.text+0x5894ba0>
1458aa5ad:     	movq	-0x30(%rbp), %rax
1458aa5b1:     	movq	-0x20(%rbp), %rdx
1458aa5b5:     	subq	%rdx, %rax
1458aa5b8:     	cmpq	$0x3, %rax
1458aa5bc:     	jbe	0x1458aa745 <.text+0x58a9745>
1458aa5c2:     	movq	-0x28(%rbp), %rax
1458aa5c6:     	movl	%ebx, (%rax,%rdx)
1458aa5c9:     	addq	$0x4, %rdx
1458aa5cd:     	movq	%rdx, -0x20(%rbp)
1458aa5d1:     	movups	-0x30(%rbp), %xmm0
1458aa5d5:     	movaps	%xmm0, -0x50(%rbp)
1458aa5d9:     	movq	-0x20(%rbp), %rax
1458aa5dd:     	movq	%rax, -0x40(%rbp)
1458aa5e1:     	movq	-0x18(%rbp), %rax
1458aa5e5:     	movq	%rax, -0x38(%rbp)
1458aa5e9:     	movq	-0x40(%rbp), %rbx
1458aa5ed:     	cmpq	-0x50(%rbp), %rbx
1458aa5f1:     	jne	0x1458aa5fd <.text+0x58a95fd>
1458aa5f3:     	leaq	-0x50(%rbp), %rcx
1458aa5f7:     	callq	0x145d69340 <.text+0x5d68340>
1458aa5fc:     	nop
1458aa5fd:     	movq	-0x48(%rbp), %rax
1458aa601:     	movb	$0x3, (%rax,%rbx)
1458aa605:     	incq	%rbx
1458aa608:     	movq	%rbx, -0x40(%rbp)
1458aa60c:     	movaps	-0x50(%rbp), %xmm0
1458aa610:     	movaps	%xmm0, -0x30(%rbp)
1458aa614:     	movq	-0x40(%rbp), %rax
1458aa618:     	movq	%rax, -0x20(%rbp)
1458aa61c:     	movq	-0x38(%rbp), %rax
1458aa620:     	movq	%rax, -0x18(%rbp)
1458aa624:     	movq	-0x20(%rbp), %rdx
1458aa628:     	movq	-0x30(%rbp), %rax
1458aa62c:     	subq	%rdx, %rax
1458aa62f:     	cmpq	$0x7, %rax
1458aa633:     	jbe	0x1458aa76d <.text+0x58a976d>
1458aa639:     	movq	0x50(%rbp), %rax
1458aa63d:     	movq	-0x28(%rbp), %rcx
1458aa641:     	movq	%rax, (%rcx,%rdx)
1458aa645:     	addq	$0x8, %rdx
1458aa649:     	movq	%rdx, -0x20(%rbp)
1458aa64d:     	movaps	-0x30(%rbp), %xmm0
1458aa651:     	movaps	%xmm0, -0x50(%rbp)
1458aa655:     	movq	-0x20(%rbp), %rax
1458aa659:     	movq	%rax, -0x40(%rbp)
1458aa65d:     	movq	-0x18(%rbp), %rax
1458aa661:     	movq	%rax, -0x38(%rbp)
1458aa665:     	movq	-0x40(%rbp), %rdx
1458aa669:     	movq	-0x50(%rbp), %rax
1458aa66d:     	subq	%rdx, %rax
1458aa670:     	cmpq	$0x3, %rax
1458aa674:     	jbe	0x1458aa795 <.text+0x58a9795>
1458aa67a:     	movq	-0x48(%rbp), %rax
1458aa67e:     	movl	$0x100, (%rax,%rdx)     # imm = 0x100
1458aa685:     	addq	$0x4, %rdx
1458aa689:     	movq	%rdx, -0x40(%rbp)
1458aa68d:     	movaps	-0x50(%rbp), %xmm0
1458aa691:     	movaps	%xmm0, -0x30(%rbp)
1458aa695:     	movq	-0x40(%rbp), %rax
1458aa699:     	movq	%rax, -0x20(%rbp)
1458aa69d:     	movq	-0x38(%rbp), %rax
1458aa6a1:     	movq	%rax, -0x18(%rbp)
1458aa6a5:     	movq	-0x20(%rbp), %rdx
1458aa6a9:     	movq	-0x30(%rbp), %rax
1458aa6ad:     	subq	%rdx, %rax
1458aa6b0:     	cmpq	$0x3, %rax
1458aa6b4:     	jbe	0x1458aa7bd <.text+0x58a97bd>
1458aa6ba:     	movq	-0x28(%rbp), %rax
1458aa6be:     	movl	$0x1, (%rax,%rdx)
1458aa6c5:     	addq	$0x4, %rdx
1458aa6c9:     	movq	%rdx, -0x20(%rbp)
1458aa6cd:     	movaps	-0x30(%rbp), %xmm0
1458aa6d1:     	movaps	%xmm0, -0x50(%rbp)
1458aa6d5:     	movq	-0x20(%rbp), %rax
1458aa6d9:     	movq	%rax, -0x40(%rbp)
1458aa6dd:     	movq	-0x18(%rbp), %rax
1458aa6e1:     	movq	%rax, -0x38(%rbp)
1458aa6e5:     	movq	-0x40(%rbp), %rdx
1458aa6e9:     	movq	-0x50(%rbp), %rax
1458aa6ed:     	subq	%rdx, %rax
1458aa6f0:     	cmpq	$0x3, %rax
1458aa6f4:     	jbe	0x1458aa7e5 <.text+0x58a97e5>
1458aa6fa:     	movq	-0x48(%rbp), %rax
1458aa6fe:     	movl	$0x1, (%rax,%rdx)
1458aa705:     	addq	$0x4, %rdx
1458aa709:     	movq	%rdx, -0x40(%rbp)
1458aa70d:     	movaps	-0x50(%rbp), %xmm0
1458aa711:     	movaps	%xmm0, -0x30(%rbp)
1458aa715:     	movq	-0x40(%rbp), %rax
1458aa719:     	movq	%rax, -0x20(%rbp)
1458aa71d:     	movq	-0x38(%rbp), %rax
1458aa721:     	movq	%rax, -0x18(%rbp)
1458aa725:     	leaq	-0x30(%rbp), %rdx
1458aa729:     	movq	%rsi, %rcx
1458aa72c:     	movq	%rdi, %r8
1458aa72f:     	callq	0x145895ba0 <.text+0x5894ba0>
1458aa734:     	movq	%rsi, %rax
1458aa737:     	addq	$0x80, %rsp
1458aa73e:     	popq	%rbx
1458aa73f:     	popq	%rdi
1458aa740:     	popq	%rsi
1458aa741:     	popq	%r14
1458aa743:     	popq	%rbp
1458aa744:     	retq
1458aa745:     	movq	$0x1, 0x20(%rsp)
1458aa74e:     	leaq	-0x30(%rbp), %rcx
1458aa752:     	movl	$0x4, %r8d
1458aa758:     	movl	$0x1, %r9d
1458aa75e:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa763:     	nop
1458aa764:     	movq	-0x20(%rbp), %rdx
1458aa768:     	jmp	0x1458aa5c2 <.text+0x58a95c2>
1458aa76d:     	movq	$0x1, 0x20(%rsp)
1458aa776:     	leaq	-0x30(%rbp), %rcx
1458aa77a:     	movl	$0x8, %r8d
1458aa780:     	movl	$0x1, %r9d
1458aa786:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa78b:     	nop
1458aa78c:     	movq	-0x20(%rbp), %rdx
1458aa790:     	jmp	0x1458aa639 <.text+0x58a9639>
1458aa795:     	movq	$0x1, 0x20(%rsp)
1458aa79e:     	leaq	-0x50(%rbp), %rcx
1458aa7a2:     	movl	$0x4, %r8d
1458aa7a8:     	movl	$0x1, %r9d
1458aa7ae:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa7b3:     	nop
1458aa7b4:     	movq	-0x40(%rbp), %rdx
1458aa7b8:     	jmp	0x1458aa67a <.text+0x58a967a>
1458aa7bd:     	movq	$0x1, 0x20(%rsp)
1458aa7c6:     	leaq	-0x30(%rbp), %rcx
1458aa7ca:     	movl	$0x4, %r8d
1458aa7d0:     	movl	$0x1, %r9d
1458aa7d6:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa7db:     	nop
1458aa7dc:     	movq	-0x20(%rbp), %rdx
1458aa7e0:     	jmp	0x1458aa6ba <.text+0x58a96ba>
1458aa7e5:     	movq	$0x1, 0x20(%rsp)
1458aa7ee:     	leaq	-0x50(%rbp), %rcx
1458aa7f2:     	movl	$0x4, %r8d
1458aa7f8:     	movl	$0x1, %r9d
1458aa7fe:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458aa803:     	nop
1458aa804:     	movq	-0x40(%rbp), %rdx
1458aa808:     	jmp	0x1458aa6fa <.text+0x58a96fa>
1458aa80d:     	movl	$0x1, %ecx
1458aa812:     	movl	$0x20, %edx
1458aa817:     	callq	0x145d6944b <.text+0x5d6844b>
1458aa81c:     	ud2
