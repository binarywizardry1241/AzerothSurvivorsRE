
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459ae710:     	pushq	%r15
1459ae712:     	pushq	%r14
1459ae714:     	pushq	%r13
1459ae716:     	pushq	%r12
1459ae718:     	pushq	%rsi
1459ae719:     	pushq	%rdi
1459ae71a:     	pushq	%rbp
1459ae71b:     	pushq	%rbx
1459ae71c:     	subq	$0x118, %rsp            # imm = 0x118
1459ae723:     	movaps	%xmm15, 0x100(%rsp)
1459ae72c:     	movaps	%xmm14, 0xf0(%rsp)
1459ae735:     	movaps	%xmm13, 0xe0(%rsp)
1459ae73e:     	movaps	%xmm12, 0xd0(%rsp)
1459ae747:     	movdqa	%xmm11, 0xc0(%rsp)
1459ae751:     	movaps	%xmm10, 0xb0(%rsp)
1459ae75a:     	movaps	%xmm9, 0xa0(%rsp)
1459ae763:     	movaps	%xmm8, 0x90(%rsp)
1459ae76c:     	movaps	%xmm7, 0x80(%rsp)
1459ae774:     	movaps	%xmm6, 0x70(%rsp)
1459ae779:     	movq	%rcx, %rax
1459ae77c:     	movq	0x18(%rdx), %rsi
1459ae780:     	movq	0x20(%rdx), %rcx
1459ae784:     	movq	0x28(%rdx), %r9
1459ae788:     	movq	0x10(%r8), %r10
1459ae78c:     	movq	%r10, 0x10(%rsp)
1459ae791:     	movups	(%r8), %xmm0
1459ae795:     	movaps	%xmm0, (%rsp)
1459ae799:     	movq	0x10(%rdx), %r10
1459ae79d:     	movq	(%rdx), %r8
1459ae7a0:     	movq	0x8(%rdx), %rdx
1459ae7a4:     	subq	%r8, %rdx
1459ae7a7:     	shrq	$0x3, %rdx
1459ae7ab:     	cmpq	%r10, %rdx
1459ae7ae:     	cmovaeq	%r10, %rdx
1459ae7b2:     	testq	%rdx, %rdx
1459ae7b5:     	je	0x1459aea69 <.text+0x59ada69>
1459ae7bb:     	leaq	0x58(%rsp), %r10
1459ae7c0:     	movss	0x9ec(%rsi), %xmm0
1459ae7c8:     	movq	0x560(%rsi), %r11
1459ae7cf:     	imulq	$0x160, 0x568(%rsi), %rsi # imm = 0x160
1459ae7da:     	xorl	%edi, %edi
1459ae7dc:     	xorps	%xmm1, %xmm1
1459ae7df:     	leaq	0x40(%rsp), %rbx
1459ae7e4:     	movaps	0x3beb25(%rip), %xmm3   # 0x145d6d310
1459ae7eb:     	jmp	0x1459ae81f <.text+0x59ad81f>
1459ae7ed:     	nopl	(%rax)
1459ae7f0:     	movq	0x10(%rsp), %r14
1459ae7f5:     	movq	%r14, 0x30(%rsp)
1459ae7fa:     	movaps	(%rsp), %xmm2
1459ae7fe:     	movaps	%xmm2, 0x20(%rsp)
1459ae803:     	movq	0x30(%rsp), %r14
1459ae808:     	movq	%r14, 0x10(%rsp)
1459ae80d:     	movaps	0x20(%rsp), %xmm2
1459ae812:     	movaps	%xmm2, (%rsp)
1459ae816:     	cmpq	%rdx, %rdi
1459ae819:     	je	0x1459aea69 <.text+0x59ada69>
1459ae81f:     	movq	(%r8,%rdi,8), %r15
1459ae823:     	incq	%rdi
1459ae826:     	xorl	%r14d, %r14d
1459ae829:     	movq	%r11, %r12
1459ae82c:     	nopl	(%rax)
1459ae830:     	cmpq	%r14, %rsi
1459ae833:     	je	0x1459ae7f0 <.text+0x59ad7f0>
1459ae835:     	addq	$0x160, %r14            # imm = 0x160
1459ae83c:     	cmpq	%r15, 0x88(%r12)
1459ae844:     	leaq	0x160(%r12), %r12
1459ae84c:     	jne	0x1459ae830 <.text+0x59ad830>
1459ae84e:     	movss	-0x38(%r11,%r14), %xmm4
1459ae855:     	ucomiss	%xmm4, %xmm1
1459ae858:     	jae	0x1459ae8e0 <.text+0x59ad8e0>
1459ae85e:     	movaps	%xmm0, %xmm5
1459ae861:     	subss	-0x3c(%r11,%r14), %xmm5
1459ae868:     	divss	%xmm4, %xmm5
1459ae86c:     	xorps	%xmm4, %xmm4
1459ae86f:     	maxss	%xmm5, %xmm4
1459ae873:     	movss	0x3beaf1(%rip), %xmm6   # 0x145d6d36c
1459ae87b:     	minss	%xmm4, %xmm6
1459ae87f:     	movsd	-0x54(%r11,%r14), %xmm5
1459ae886:     	movsd	-0x48(%r11,%r14), %xmm7
1459ae88d:     	subps	%xmm5, %xmm7
1459ae890:     	movsldup	%xmm6, %xmm4            # xmm4 = xmm6[0,0,2,2]
1459ae894:     	mulps	%xmm7, %xmm4
1459ae897:     	addps	%xmm5, %xmm4
1459ae89a:     	movss	-0x4c(%r11,%r14), %xmm7
1459ae8a1:     	movss	-0x40(%r11,%r14), %xmm5
1459ae8a8:     	subss	%xmm7, %xmm5
1459ae8ac:     	mulss	%xmm6, %xmm5
1459ae8b0:     	addss	%xmm7, %xmm5
1459ae8b4:     	movq	0x10(%rcx), %r15
1459ae8b8:     	testq	%r15, %r15
1459ae8bb:     	je	0x1459ae8f7 <.text+0x59ad8f7>
1459ae8bd:     	movq	0x8(%rcx), %r12
1459ae8c1:     	movss	(%r9), %xmm6
1459ae8c6:     	cmpq	$0x5, %r15
1459ae8ca:     	jae	0x1459ae8ff <.text+0x59ad8ff>
1459ae8cc:     	xorl	%r14d, %r14d
1459ae8cf:     	xorl	%r13d, %r13d
1459ae8d2:     	jmp	0x1459ae9ec <.text+0x59ad9ec>
1459ae8d7:     	nopw	(%rax,%rax)
1459ae8e0:     	movsd	-0x48(%r11,%r14), %xmm4
1459ae8e7:     	movss	-0x40(%r11,%r14), %xmm5
1459ae8ee:     	movq	0x10(%rcx), %r15
1459ae8f2:     	testq	%r15, %r15
1459ae8f5:     	jne	0x1459ae8bd <.text+0x59ad8bd>
1459ae8f7:     	xorl	%r13d, %r13d
1459ae8fa:     	jmp	0x1459aea23 <.text+0x59ada23>
1459ae8ff:     	movl	%r15d, %r13d
1459ae902:     	andl	$0x3, %r13d
1459ae906:     	movl	$0x4, %r14d
1459ae90c:     	cmoveq	%r14, %r13
1459ae910:     	movq	%r15, %r14
1459ae913:     	subq	%r13, %r14
1459ae916:     	movsldup	%xmm6, %xmm8            # xmm8 = xmm6[0,0,2,2]
1459ae91b:     	movsldup	%xmm4, %xmm9            # xmm9 = xmm4[0,0,2,2]
1459ae920:     	movshdup	%xmm4, %xmm10           # xmm10 = xmm4[1,1,3,3]
1459ae925:     	leaq	0x28(%r12), %rbp
1459ae92a:     	xorps	%xmm7, %xmm7
1459ae92d:     	movq	%r14, %r13
1459ae930:     	pxor	%xmm11, %xmm11
1459ae935:     	nopw	%cs:(%rax,%rax)
1459ae940:     	movss	-0x28(%rbp), %xmm14
1459ae946:     	movss	-0x24(%rbp), %xmm12
1459ae94c:     	movss	-0x1c(%rbp), %xmm13
1459ae952:     	unpcklps	%xmm13, %xmm14          # xmm14 = xmm14[0],xmm13[0],xmm14[1],xmm13[1]
1459ae956:     	movss	-0x18(%rbp), %xmm13
1459ae95c:     	unpcklps	%xmm13, %xmm12          # xmm12 = xmm12[0],xmm13[0],xmm12[1],xmm13[1]
1459ae960:     	movss	-0x4(%rbp), %xmm13
1459ae966:     	movss	-0x10(%rbp), %xmm15
1459ae96c:     	unpcklps	%xmm13, %xmm15          # xmm15 = xmm15[0],xmm13[0],xmm15[1],xmm13[1]
1459ae970:     	movss	(%rbp), %xmm2
1459ae975:     	movss	-0xc(%rbp), %xmm13
1459ae97b:     	unpcklps	%xmm2, %xmm13           # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1]
1459ae97f:     	subps	%xmm9, %xmm14
1459ae983:     	subps	%xmm9, %xmm15
1459ae987:     	subps	%xmm10, %xmm12
1459ae98b:     	subps	%xmm10, %xmm13
1459ae98f:     	mulps	%xmm14, %xmm14
1459ae993:     	mulps	%xmm15, %xmm15
1459ae997:     	mulps	%xmm12, %xmm12
1459ae99b:     	addps	%xmm14, %xmm12
1459ae99f:     	mulps	%xmm13, %xmm13
1459ae9a3:     	addps	%xmm15, %xmm13
1459ae9a7:     	cmpleps	%xmm8, %xmm12
1459ae9ac:     	unpcklps	%xmm0, %xmm12           # xmm12 = xmm12[0],xmm0[0],xmm12[1],xmm0[1]
1459ae9b0:     	andps	%xmm3, %xmm12
1459ae9b4:     	paddq	%xmm12, %xmm11
1459ae9b9:     	cmpleps	%xmm8, %xmm13
1459ae9be:     	unpcklps	%xmm0, %xmm13           # xmm13 = xmm13[0],xmm0[0],xmm13[1],xmm0[1]
1459ae9c2:     	andps	%xmm3, %xmm13
1459ae9c6:     	paddq	%xmm13, %xmm7
1459ae9cb:     	addq	$0x30, %rbp
1459ae9cf:     	addq	$-0x4, %r13
1459ae9d3:     	jne	0x1459ae940 <.text+0x59ad940>
1459ae9d9:     	paddq	%xmm11, %xmm7
1459ae9de:     	pshufd	$0xee, %xmm7, %xmm2     # xmm2 = xmm7[2,3,2,3]
1459ae9e3:     	paddq	%xmm7, %xmm2
1459ae9e7:     	movq	%xmm2, %r13
1459ae9ec:     	subq	%r14, %r15
1459ae9ef:     	leaq	(%r14,%r14,2), %r14
1459ae9f3:     	leaq	(%r12,%r14,4), %r14
1459ae9f7:     	nopw	(%rax,%rax)
1459aea00:     	movsd	(%r14), %xmm2
1459aea05:     	subps	%xmm4, %xmm2
1459aea08:     	mulps	%xmm2, %xmm2
1459aea0b:     	movshdup	%xmm2, %xmm7            # xmm7 = xmm2[1,1,3,3]
1459aea0f:     	addss	%xmm2, %xmm7
1459aea13:     	ucomiss	%xmm7, %xmm6
1459aea16:     	sbbq	$-0x1, %r13
1459aea1a:     	addq	$0xc, %r14
1459aea1e:     	decq	%r15
1459aea21:     	jne	0x1459aea00 <.text+0x59ada00>
1459aea23:     	movaps	(%rsp), %xmm2
1459aea27:     	movaps	%xmm2, 0x40(%rsp)
1459aea2c:     	movq	0x10(%rsp), %r14
1459aea31:     	movq	%r14, 0x50(%rsp)
1459aea36:     	movq	%r13, 0x58(%rsp)
1459aea3b:     	movlps	%xmm4, 0x60(%rsp)
1459aea40:     	movss	%xmm5, 0x68(%rsp)
1459aea46:     	cmpq	%r13, 0x40(%rsp)
1459aea4b:     	movq	%r10, %r14
1459aea4e:     	cmovaq	%rbx, %r14
1459aea52:     	movups	(%r14), %xmm2
1459aea56:     	movaps	%xmm2, 0x20(%rsp)
1459aea5b:     	movq	0x10(%r14), %r14
1459aea5f:     	movq	%r14, 0x30(%rsp)
1459aea64:     	jmp	0x1459ae803 <.text+0x59ad803>
1459aea69:     	movq	0x10(%rsp), %rcx
1459aea6e:     	movq	%rcx, 0x10(%rax)
1459aea72:     	movaps	(%rsp), %xmm0
1459aea76:     	movups	%xmm0, (%rax)
1459aea79:     	movaps	0x70(%rsp), %xmm6
1459aea7e:     	movaps	0x80(%rsp), %xmm7
1459aea86:     	movaps	0x90(%rsp), %xmm8
1459aea8f:     	movaps	0xa0(%rsp), %xmm9
1459aea98:     	movaps	0xb0(%rsp), %xmm10
1459aeaa1:     	movaps	0xc0(%rsp), %xmm11
1459aeaaa:     	movaps	0xd0(%rsp), %xmm12
1459aeab3:     	movaps	0xe0(%rsp), %xmm13
1459aeabc:     	movaps	0xf0(%rsp), %xmm14
1459aeac5:     	movaps	0x100(%rsp), %xmm15
1459aeace:     	addq	$0x118, %rsp            # imm = 0x118
1459aead5:     	popq	%rbx
1459aead6:     	popq	%rbp
1459aead7:     	popq	%rdi
1459aead8:     	popq	%rsi
1459aead9:     	popq	%r12
1459aeadb:     	popq	%r13
1459aeadd:     	popq	%r14
1459aeadf:     	popq	%r15
1459aeae1:     	retq
