Disassembly of section .text:

0000000140001000 <.text>:
14027a720:     	pushq	%rbp
14027a721:     	pushq	%r15
14027a723:     	pushq	%r14
14027a725:     	pushq	%r13
14027a727:     	pushq	%r12
14027a729:     	pushq	%rsi
14027a72a:     	pushq	%rdi
14027a72b:     	pushq	%rbx
14027a72c:     	subq	$0x388, %rsp            # imm = 0x388
14027a733:     	leaq	0x80(%rsp), %rbp
14027a73b:     	movq	$-0x2, 0x300(%rbp)
14027a746:     	movq	0x378(%rbp), %rax
14027a74d:     	movq	0x388(%rbp), %rcx
14027a754:     	movq	0x380(%rbp), %r10
14027a75b:     	movq	0x370(%rbp), %r11
14027a762:     	movq	0x20(%rdx), %rsi
14027a766:     	movq	%rsi, -0x20(%rbp)
14027a76a:     	movups	(%rdx), %xmm0
14027a76d:     	movups	0x10(%rdx), %xmm1
14027a771:     	movaps	%xmm1, -0x30(%rbp)
14027a775:     	movaps	%xmm0, -0x40(%rbp)
14027a779:     	movups	(%r8), %xmm0
14027a77d:     	movups	0x10(%r8), %xmm1
14027a782:     	movups	%xmm1, -0x8(%rbp)
14027a786:     	movups	%xmm0, -0x18(%rbp)
14027a78a:     	movups	(%r9), %xmm0
14027a78e:     	movups	0x10(%r9), %xmm1
14027a793:     	movups	%xmm1, 0x18(%rbp)
14027a797:     	movups	%xmm0, 0x8(%rbp)
14027a79b:     	movups	(%r11), %xmm0
14027a79f:     	movups	0x10(%r11), %xmm1
14027a7a4:     	movups	%xmm1, 0x38(%rbp)
14027a7a8:     	movups	%xmm0, 0x28(%rbp)
14027a7ac:     	movups	(%rax), %xmm0
14027a7af:     	movups	0x10(%rax), %xmm1
14027a7b3:     	movaps	%xmm1, 0x70(%rbp)
14027a7b7:     	movaps	%xmm0, 0x60(%rbp)
14027a7bb:     	movups	(%r10), %xmm0
14027a7bf:     	movups	%xmm0, 0x48(%rbp)
14027a7c3:     	movq	0x10(%r10), %rdx
14027a7c7:     	movq	%rdx, 0x58(%rbp)
14027a7cb:     	movups	(%rcx), %xmm0
14027a7ce:     	movups	0x10(%rcx), %xmm1
14027a7d2:     	movaps	%xmm0, 0x80(%rbp)
14027a7d9:     	movaps	%xmm1, 0x90(%rbp)
14027a7e0:     	movq	-0x18(%rbp), %r12
14027a7e4:     	movq	0x8(%rbp), %r15
14027a7e8:     	movq	0x28(%rbp), %rcx
14027a7ec:     	cmpb	$0x1, 0xea(%r12)
14027a7f5:     	jne	0x14027a811 <.text+0x279811>
14027a7f7:     	cmpb	$0x1, 0xe8(%r12)
14027a800:     	jne	0x14027a811 <.text+0x279811>
14027a802:     	cmpb	$-0x1, 0xa0(%r12)
14027a80b:     	je	0x14027ac4a <.text+0x279c4a>
14027a811:     	movb	$0x0, 0x2fe(%rbp)
14027a818:     	xorl	%esi, %esi
14027a81a:     	movzbl	(%rcx), %edx
14027a81d:     	movq	0x48(%rbp), %rcx
14027a821:     	movq	0x50(%rbp), %rbx
14027a825:     	movq	0xf8(%rcx), %r14
14027a82c:     	movq	0x100(%rcx), %r8
14027a833:     	movzbl	0x108(%rcx), %ecx
14027a83a:     	leaq	(,%r8,4), %r9
14027a842:     	xorl	%r10d, %r10d
14027a845:     	testb	%cl, %cl
14027a847:     	je	0x14027a880 <.text+0x279880>
14027a849:     	nopl	(%rax)
14027a850:     	cmpq	%r10, %r9
14027a853:     	je	0x14027a8f2 <.text+0x2798f2>
14027a859:     	movl	(%r14,%r10), %r11d
14027a85d:     	movq	0x1a8(%rbx), %rdi
14027a864:     	leaq	(%r11,%r11,8), %r11
14027a868:     	addq	$0x4, %r10
14027a86c:     	cmpq	$0x0, 0x10(%rdi,%r11,8)
14027a872:     	je	0x14027a850 <.text+0x279850>
14027a874:     	jmp	0x14027a8a4 <.text+0x2798a4>
14027a876:     	nopw	%cs:(%rax,%rax)
14027a880:     	cmpq	%r10, %r9
14027a883:     	je	0x14027a8f2 <.text+0x2798f2>
14027a885:     	movl	(%r14,%r10), %r11d
14027a889:     	movq	0x108(%rbx), %rdi
14027a890:     	leaq	(%r11,%r11,4), %r11
14027a894:     	shlq	$0x5, %r11
14027a898:     	addq	$0x4, %r10
14027a89c:     	cmpq	$0x0, 0x58(%rdi,%r11)
14027a8a2:     	je	0x14027a880 <.text+0x279880>
14027a8a4:     	testb	%dl, %dl
14027a8a6:     	jne	0x14027b06b <.text+0x27a06b>
14027a8ac:     	leaq	(%r14,%r8,4), %r15
14027a8b0:     	movq	-0x30(%rbp), %rax
14027a8b4:     	movq	%rax, 0x2d8(%rbp)
14027a8bb:     	movq	-0x20(%rbp), %r11
14027a8bf:     	movq	-0x28(%rbp), %r12
14027a8c3:     	movq	-0x40(%rbp), %r9
14027a8c7:     	movq	-0x38(%rbp), %r10
14027a8cb:     	xorl	%esi, %esi
14027a8cd:     	movl	$0x8, %edi
14027a8d2:     	testb	%cl, %cl
14027a8d4:     	je	0x14027aa50 <.text+0x279a50>
14027a8da:     	leaq	0xa0(%rbp), %rcx
14027a8e1:     	xorl	%r13d, %r13d
14027a8e4:     	cmpl	%esi, %r13d
14027a8e7:     	je	0x14027aa90 <.text+0x279a90>
14027a8ed:     	jmp	0x14027aa73 <.text+0x279a73>
14027a8f2:     	testb	%dl, %dl
14027a8f4:     	je	0x14027b06b <.text+0x27a06b>
14027a8fa:     	cmpq	$0x0, 0x60(%rbp)
14027a8ff:     	je	0x14027b06b <.text+0x27a06b>
14027a905:     	movups	(%rax), %xmm0
14027a908:     	movups	0x10(%rax), %xmm1
14027a90c:     	movaps	%xmm1, -0x50(%rbp)
14027a910:     	movaps	%xmm0, -0x60(%rbp)
14027a914:     	callq	0x140002200 <.text+0x1200>
14027a919:     	movl	$0x18, %ecx
14027a91e:     	movl	$0x8, %edx
14027a923:     	callq	0x1400021c0 <.text+0x11c0>
14027a928:     	testq	%rax, %rax
14027a92b:     	je	0x14027b0ba <.text+0x27a0ba>
14027a931:     	movq	%rax, 0x2d8(%rbp)
14027a938:     	testb	%sil, %sil
14027a93b:     	je	0x14027a951 <.text+0x279951>
14027a93d:     	leaq	0x5b45cfd(%rip), %rcx   # 0x145dc0641
14027a944:     	movl	$0xb, %edx
14027a949:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027a94e:     	nop
14027a94f:     	jmp	0x14027a963 <.text+0x279963>
14027a951:     	leaq	0x5b45ce0(%rip), %rcx   # 0x145dc0638
14027a958:     	movl	$0x9, %edx
14027a95d:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027a962:     	nop
14027a963:     	movq	0x2d8(%rbp), %rcx
14027a96a:     	movb	$0x0, (%rcx)
14027a96d:     	movq	%rax, 0x8(%rcx)
14027a971:     	movq	%rdx, 0x10(%rcx)
14027a975:     	movq	$0x1, 0x2e0(%rbp)
14027a980:     	movq	%rcx, 0x2e8(%rbp)
14027a987:     	movq	$0x1, 0x2f0(%rbp)
14027a992:     	movzbl	0xd(%r15), %ebx
14027a997:     	testb	%bl, %bl
14027a999:     	jne	0x14027a9aa <.text+0x2799aa>
14027a99b:     	cmpb	$0x1, 0xe8(%r12)
14027a9a4:     	jne	0x14027ad2f <.text+0x279d2f>
14027a9aa:     	movb	$0x1, 0x2ff(%rbp)
14027a9b1:     	leaq	0x5b45c94(%rip), %rcx   # 0x145dc064c
14027a9b8:     	movl	$0xe, %edx
14027a9bd:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027a9c2:     	nop
14027a9c3:     	movq	%rax, %rsi
14027a9c6:     	movq	%rdx, %rdi
14027a9c9:     	movq	0x2f0(%rbp), %r14
14027a9d0:     	cmpq	0x2e0(%rbp), %r14
14027a9d7:     	jne	0x14027a9ed <.text+0x2799ed>
14027a9d9:     	movb	$0x1, 0x2ff(%rbp)
14027a9e0:     	leaq	0x2e0(%rbp), %rcx
14027a9e7:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
14027a9ec:     	nop
14027a9ed:     	movq	0x2e8(%rbp), %rax
14027a9f4:     	leaq	(%r14,%r14,2), %rcx
14027a9f8:     	movb	$0x1, (%rax,%rcx,8)
14027a9fc:     	movq	%rsi, 0x8(%rax,%rcx,8)
14027aa01:     	movq	%rdi, 0x10(%rax,%rcx,8)
14027aa06:     	incq	%r14
14027aa09:     	movq	%r14, 0x2f0(%rbp)
14027aa10:     	testb	%bl, %bl
14027aa12:     	jne	0x14027ad2f <.text+0x279d2f>
14027aa18:     	cmpb	$0x0, 0xe8(%r12)
14027aa21:     	je	0x14027ad2f <.text+0x279d2f>
14027aa27:     	cmpb	$0x0, 0xc(%r15)
14027aa2c:     	je	0x14027acc9 <.text+0x279cc9>
14027aa32:     	movb	$0x1, 0x2ff(%rbp)
14027aa39:     	leaq	0x5b45c2f(%rip), %rcx   # 0x145dc066f
14027aa40:     	movl	$0xc, %edx
14027aa45:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027aa4a:     	nop
14027aa4b:     	jmp	0x14027ace2 <.text+0x279ce2>
14027aa50:     	leaq	0x5b45bc9(%rip), %rdx   # 0x145dc0620
14027aa57:     	xorl	%r13d, %r13d
14027aa5a:     	cmpl	%esi, %r13d
14027aa5d:     	jne	0x14027ab60 <.text+0x279b60>
14027aa63:     	jmp	0x14027ab80 <.text+0x279b80>
14027aa68:     	leaq	(%rax,%rdx,8), %rax
14027aa6c:     	movq	0x8(%rax), %rdi
14027aa70:     	xorl	%r13d, %r13d
14027aa73:     	movl	%r13d, %eax
14027aa76:     	incl	%r13d
14027aa79:     	movq	(%rdi,%rax,8), %rax
14027aa7d:     	testl	%eax, %eax
14027aa7f:     	jne	0x14027aab7 <.text+0x279ab7>
14027aa81:     	cmpl	%esi, %r13d
14027aa84:     	jne	0x14027aa73 <.text+0x279a73>
14027aa86:     	nopw	%cs:(%rax,%rax)
14027aa90:     	cmpq	%r15, %r14
14027aa93:     	je	0x14027b06b <.text+0x27a06b>
14027aa99:     	movl	(%r14), %edx
14027aa9c:     	addq	$0x4, %r14
14027aaa0:     	movq	0x1a8(%rbx), %rax
14027aaa7:     	leaq	(%rdx,%rdx,8), %rdx
14027aaab:     	movq	0x10(%rax,%rdx,8), %rsi
14027aab0:     	testq	%rsi, %rsi
14027aab3:     	je	0x14027aa90 <.text+0x279a90>
14027aab5:     	jmp	0x14027aa68 <.text+0x279a68>
14027aab7:     	movq	0x2d8(%rbp), %rdx
14027aabe:     	testq	%rdx, %rdx
14027aac1:     	movq	0x2d0(%rbp), %r8
14027aac8:     	cmovneq	%r11, %r8
14027aacc:     	movq	%rax, 0xa0(%rbp)
14027aad3:     	movq	%r9, 0xa8(%rbp)
14027aada:     	movq	%r10, 0xb0(%rbp)
14027aae1:     	movq	%rdx, 0xb8(%rbp)
14027aae8:     	movq	%r12, 0xc0(%rbp)
14027aaef:     	movq	%r8, 0x2d0(%rbp)
14027aaf6:     	movq	%r8, 0xc8(%rbp)
14027aafd:     	movq	%r11, 0x2b0(%rbp)
14027ab04:     	leaq	0x5b45b15(%rip), %rdx   # 0x145dc0620
14027ab0b:     	movq	%r12, 0x2b8(%rbp)
14027ab12:     	movq	%r9, 0x2c0(%rbp)
14027ab19:     	movq	%r10, 0x2c8(%rbp)
14027ab20:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
14027ab25:     	leaq	0xa0(%rbp), %rcx
14027ab2c:     	movq	0x2c8(%rbp), %r10
14027ab33:     	movq	0x2c0(%rbp), %r9
14027ab3a:     	movq	0x2b8(%rbp), %r12
14027ab41:     	movq	0x2b0(%rbp), %r11
14027ab48:     	cmpl	%esi, %r13d
14027ab4b:     	je	0x14027aa90 <.text+0x279a90>
14027ab51:     	jmp	0x14027aa73 <.text+0x279a73>
14027ab56:     	addq	%rcx, %rax
14027ab59:     	movq	0x50(%rax), %rdi
14027ab5d:     	xorl	%r13d, %r13d
14027ab60:     	movl	%r13d, %eax
14027ab63:     	shlq	$0x4, %rax
14027ab67:     	incl	%r13d
14027ab6a:     	movq	(%rdi,%rax), %rax
14027ab6e:     	testl	%eax, %eax
14027ab70:     	jne	0x14027abab <.text+0x279bab>
14027ab72:     	cmpl	%esi, %r13d
14027ab75:     	jne	0x14027ab60 <.text+0x279b60>
14027ab77:     	nopw	(%rax,%rax)
14027ab80:     	cmpq	%r15, %r14
14027ab83:     	je	0x14027b06b <.text+0x27a06b>
14027ab89:     	movl	(%r14), %ecx
14027ab8c:     	addq	$0x4, %r14
14027ab90:     	movq	0x108(%rbx), %rax
14027ab97:     	leaq	(%rcx,%rcx,4), %rcx
14027ab9b:     	shlq	$0x5, %rcx
14027ab9f:     	movq	0x58(%rax,%rcx), %rsi
14027aba4:     	testq	%rsi, %rsi
14027aba7:     	je	0x14027ab80 <.text+0x279b80>
14027aba9:     	jmp	0x14027ab56 <.text+0x279b56>
14027abab:     	movq	0x2d8(%rbp), %r8
14027abb2:     	testq	%r8, %r8
14027abb5:     	movq	0x2d0(%rbp), %rcx
14027abbc:     	cmovneq	%r11, %rcx
14027abc0:     	movq	%rax, 0xa0(%rbp)
14027abc7:     	movq	%r9, 0xa8(%rbp)
14027abce:     	movq	%r10, 0xb0(%rbp)
14027abd5:     	movq	%r8, 0xb8(%rbp)
14027abdc:     	movq	%r12, 0xc0(%rbp)
14027abe3:     	movq	%rcx, 0x2d0(%rbp)
14027abea:     	movq	%rcx, 0xc8(%rbp)
14027abf1:     	leaq	0xa0(%rbp), %rcx
14027abf8:     	movq	%r11, 0x2b0(%rbp)
14027abff:     	movq	%r12, 0x2b8(%rbp)
14027ac06:     	movq	%r9, 0x2c0(%rbp)
14027ac0d:     	movq	%r10, 0x2c8(%rbp)
14027ac14:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
14027ac19:     	leaq	0x5b45a00(%rip), %rdx   # 0x145dc0620
14027ac20:     	movq	0x2c8(%rbp), %r10
14027ac27:     	movq	0x2c0(%rbp), %r9
14027ac2e:     	movq	0x2b8(%rbp), %r12
14027ac35:     	movq	0x2b0(%rbp), %r11
14027ac3c:     	cmpl	%esi, %r13d
14027ac3f:     	je	0x14027ab80 <.text+0x279b80>
14027ac45:     	jmp	0x14027ab60 <.text+0x279b60>
14027ac4a:     	movq	0x80(%rbp), %rdx
14027ac51:     	movzbl	(%rdx), %edx
14027ac54:     	movl	%edx, %esi
14027ac56:     	xorb	$0x1, %sil
14027ac5a:     	movb	%sil, 0x2fe(%rbp)
14027ac61:     	testb	%dl, %dl
14027ac63:     	jne	0x14027a81a <.text+0x27981a>
14027ac69:     	movq	0x48(%rbp), %r9
14027ac6d:     	movq	0x50(%rbp), %rcx
14027ac71:     	movq	0xf8(%r9), %rdx
14027ac78:     	movq	0x100(%r9), %r8
14027ac7f:     	cmpb	$0x0, 0x108(%r9)
14027ac87:     	je	0x14027b07f <.text+0x27a07f>
14027ac8d:     	shlq	$0x2, %r8
14027ac91:     	xorl	%r9d, %r9d
14027ac94:     	nopw	%cs:(%rax,%rax)
14027aca0:     	cmpq	%r9, %r8
14027aca3:     	je	0x14027a8fa <.text+0x2798fa>
14027aca9:     	movl	(%rdx,%r9), %r10d
14027acad:     	movq	0x1a8(%rcx), %r11
14027acb4:     	leaq	(%r10,%r10,8), %r10
14027acb8:     	addq	$0x4, %r9
14027acbc:     	cmpq	$0x0, 0x10(%r11,%r10,8)
14027acc2:     	je	0x14027aca0 <.text+0x279ca0>
14027acc4:     	jmp	0x14027b06b <.text+0x27a06b>
14027acc9:     	movb	$0x1, 0x2ff(%rbp)
14027acd0:     	leaq	0x5b45983(%rip), %rcx   # 0x145dc065a
14027acd7:     	movl	$0x15, %edx
14027acdc:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027ace1:     	nop
14027ace2:     	movq	%rax, %rsi
14027ace5:     	movq	%rdx, %rdi
14027ace8:     	movq	0x2f0(%rbp), %rbx
14027acef:     	cmpq	0x2e0(%rbp), %rbx
14027acf6:     	jne	0x14027ad0c <.text+0x279d0c>
14027acf8:     	movb	$0x1, 0x2ff(%rbp)
14027acff:     	leaq	0x2e0(%rbp), %rcx
14027ad06:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
14027ad0b:     	nop
14027ad0c:     	movq	0x2e8(%rbp), %rax
14027ad13:     	leaq	(%rbx,%rbx,2), %rcx
14027ad17:     	movb	$0x2, (%rax,%rcx,8)
14027ad1b:     	movq	%rsi, 0x8(%rax,%rcx,8)
14027ad20:     	movq	%rdi, 0x10(%rax,%rcx,8)
14027ad25:     	incq	%rbx
14027ad28:     	movq	%rbx, 0x2f0(%rbp)
14027ad2f:     	movb	$0x1, 0x2ff(%rbp)
14027ad36:     	leaq	0x5b4593e(%rip), %rcx   # 0x145dc067b
14027ad3d:     	movl	$0x9, %edx
14027ad42:     	callq	0x1458da4e0 <.text+0x58d94e0>
14027ad47:     	nop
14027ad48:     	movq	%rax, %rdi
14027ad4b:     	movq	%rdx, %rsi
14027ad4e:     	movq	0x2f0(%rbp), %rbx
14027ad55:     	cmpq	0x2e0(%rbp), %rbx
14027ad5c:     	jne	0x14027ad72 <.text+0x279d72>
14027ad5e:     	movb	$0x1, 0x2ff(%rbp)
14027ad65:     	leaq	0x2e0(%rbp), %rcx
14027ad6c:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
14027ad71:     	nop
14027ad72:     	movq	0x2e8(%rbp), %rax
14027ad79:     	leaq	(%rbx,%rbx,2), %rcx
14027ad7d:     	movb	$0x3, (%rax,%rcx,8)
14027ad81:     	movq	%rdi, 0x8(%rax,%rcx,8)
14027ad86:     	incq	%rbx
14027ad89:     	xorps	%xmm0, %xmm0
14027ad8c:     	cvtsi2ss	%rbx, %xmm0
14027ad91:     	movq	%rsi, 0x10(%rax,%rcx,8)
14027ad96:     	movq	%rbx, 0x2f0(%rbp)
14027ad9d:     	mulss	0x5b447e3(%rip), %xmm0  # 0x145dbf588
14027ada5:     	addss	0x5b447df(%rip), %xmm0  # 0x145dbf58c
14027adad:     	movl	$0x43d20000, 0x2a8(%rbp) # imm = 0x43D20000
14027adb7:     	movss	%xmm0, 0x2ac(%rbp)
14027adbf:     	movups	0x5b4564a(%rip), %xmm0  # 0x145dc0410
14027adc6:     	movaps	%xmm0, 0x240(%rbp)
14027adcd:     	movq	$0x0, 0x250(%rbp)
14027add8:     	movups	0x5b45649(%rip), %xmm1  # 0x145dc0428
14027addf:     	movups	%xmm1, 0x258(%rbp)
14027ade6:     	movq	$0x0, 0x268(%rbp)
14027adf1:     	movups	0x5b45648(%rip), %xmm1  # 0x145dc0440
14027adf8:     	movaps	%xmm1, 0x270(%rbp)
14027adff:     	movq	$0x0, 0x280(%rbp)
14027ae0a:     	movups	0x5b45647(%rip), %xmm2  # 0x145dc0458
14027ae11:     	movups	%xmm2, 0x288(%rbp)
14027ae18:     	movq	$0x0, 0x298(%rbp)
14027ae23:     	movaps	%xmm0, 0xa0(%rbp)
14027ae2a:     	movq	0x250(%rbp), %rax
14027ae31:     	movq	%rax, 0xb0(%rbp)
14027ae38:     	movq	0x258(%rbp), %rax
14027ae3f:     	movq	%rax, 0xb8(%rbp)
14027ae46:     	movq	0x260(%rbp), %rax
14027ae4d:     	movq	%rax, 0xc0(%rbp)
14027ae54:     	movq	0x268(%rbp), %rax
14027ae5b:     	movq	%rax, 0xc8(%rbp)
14027ae62:     	movaps	%xmm1, 0xd0(%rbp)
14027ae69:     	movq	0x280(%rbp), %rax
14027ae70:     	movq	%rax, 0xe0(%rbp)
14027ae77:     	movq	0x288(%rbp), %rax
14027ae7e:     	movq	%rax, 0xe8(%rbp)
14027ae85:     	movaps	0x290(%rbp), %xmm0
14027ae8c:     	movaps	%xmm0, 0xf0(%rbp)
14027ae93:     	xorps	%xmm0, %xmm0
14027ae96:     	movaps	%xmm0, 0x110(%rbp)
14027ae9d:     	movaps	%xmm0, 0x100(%rbp)
14027aea4:     	movq	$0x0, 0x120(%rbp)
14027aeaf:     	movaps	0x5af294a(%rip), %xmm1  # 0x145d6d800
14027aeb6:     	movups	%xmm1, 0x128(%rbp)
14027aebd:     	movups	%xmm0, 0x148(%rbp)
14027aec4:     	movups	%xmm0, 0x138(%rbp)
14027aecb:     	movups	0x5b45606(%rip), %xmm1  # 0x145dc04d8
14027aed2:     	movups	%xmm1, 0x168(%rbp)
14027aed9:     	movups	0x5b455e8(%rip), %xmm1  # 0x145dc04c8
14027aee0:     	movups	%xmm1, 0x158(%rbp)
14027aee7:     	movups	0x5b4560a(%rip), %xmm1  # 0x145dc04f8
14027aeee:     	movups	%xmm1, 0x188(%rbp)
14027aef5:     	movups	0x5b455ec(%rip), %xmm1  # 0x145dc04e8
14027aefc:     	movups	%xmm1, 0x178(%rbp)
14027af03:     	movups	0x5b4560e(%rip), %xmm1  # 0x145dc0518
14027af0a:     	movups	%xmm1, 0x1a8(%rbp)
14027af11:     	movups	0x5b455f0(%rip), %xmm1  # 0x145dc0508
14027af18:     	movups	%xmm1, 0x198(%rbp)
14027af1f:     	movups	0x5b45612(%rip), %xmm1  # 0x145dc0538
14027af26:     	movups	%xmm1, 0x1c8(%rbp)
14027af2d:     	movups	0x5b455f4(%rip), %xmm1  # 0x145dc0528
14027af34:     	movups	%xmm1, 0x1b8(%rbp)
14027af3b:     	movaps	0x5af231e(%rip), %xmm1  # 0x145d6d260
14027af42:     	movups	%xmm1, 0x1d8(%rbp)
14027af49:     	movl	$0x1, 0x1e8(%rbp)
14027af53:     	movq	$0x0, 0x1ec(%rbp)
14027af5e:     	movb	$0x1, 0x1f4(%rbp)
14027af65:     	movq	$0x0, 0x1f8(%rbp)
14027af70:     	movl	$0x3f800000, 0x200(%rbp) # imm = 0x3F800000
14027af7a:     	movw	$0x0, 0x204(%rbp)
14027af83:     	movw	$0x0, 0x20a(%rbp)
14027af8c:     	movl	$0x10000, 0x206(%rbp)   # imm = 0x10000
14027af96:     	movw	$0x0, 0x210(%rbp)
14027af9f:     	movl	$0x10000, 0x20c(%rbp)   # imm = 0x10000
14027afa9:     	movw	$0x100, 0x212(%rbp)     # imm = 0x100
14027afb2:     	movw	$0x0, 0x21c(%rbp)
14027afbb:     	movq	$0x0, 0x214(%rbp)
14027afc6:     	movaps	%xmm0, 0x220(%rbp)
14027afcd:     	movabsq	$0x19003f0ccccd, %rax   # imm = 0x19003F0CCCCD
14027afd7:     	movq	%rax, 0x230(%rbp)
14027afde:     	movw	$0x2, 0x238(%rbp)
14027afe7:     	movb	$0x1, 0x2ff(%rbp)
14027afee:     	leaq	0x5b45693(%rip), %r9    # 0x145dc0688
14027aff5:     	leaq	0x240(%rbp), %rcx
14027affc:     	leaq	-0x40(%rbp), %rdx
14027b000:     	leaq	0xa0(%rbp), %r8
14027b007:     	callq	0x1401a0390 <.text+0x19f390>
14027b00c:     	nop
14027b00d:     	leaq	0x2a8(%rbp), %rax
14027b014:     	movq	%rax, 0xb8(%rbp)
14027b01b:     	leaq	-0x60(%rbp), %rax
14027b01f:     	movq	%rax, 0xc0(%rbp)
14027b026:     	leaq	0x2fe(%rbp), %rax
14027b02d:     	movq	%rax, 0xc8(%rbp)
14027b034:     	movups	0x2e0(%rbp), %xmm0
14027b03b:     	movaps	%xmm0, 0xa0(%rbp)
14027b042:     	movq	0x2f0(%rbp), %rax
14027b049:     	movq	%rax, 0xb0(%rbp)
14027b050:     	movb	$0x0, 0x2ff(%rbp)
14027b057:     	leaq	0x240(%rbp), %rcx
14027b05e:     	leaq	0xa0(%rbp), %rdx
14027b065:     	callq	0x1401b3d20 <.text+0x1b2d20>
14027b06a:     	nop
14027b06b:     	addq	$0x388, %rsp            # imm = 0x388
14027b072:     	popq	%rbx
14027b073:     	popq	%rdi
14027b074:     	popq	%rsi
14027b075:     	popq	%r12
14027b077:     	popq	%r13
14027b079:     	popq	%r14
14027b07b:     	popq	%r15
14027b07d:     	popq	%rbp
14027b07e:     	retq
14027b07f:     	shlq	$0x2, %r8
14027b083:     	xorl	%r9d, %r9d
14027b086:     	nopw	%cs:(%rax,%rax)
14027b090:     	cmpq	%r9, %r8
14027b093:     	je	0x14027a8fa <.text+0x2798fa>
14027b099:     	movl	(%rdx,%r9), %r10d
14027b09d:     	movq	0x108(%rcx), %r11
14027b0a4:     	leaq	(%r10,%r10,4), %r10
14027b0a8:     	shlq	$0x5, %r10
14027b0ac:     	addq	$0x4, %r9
14027b0b0:     	cmpq	$0x0, 0x58(%r11,%r10)
14027b0b6:     	je	0x14027b090 <.text+0x27a090>
14027b0b8:     	jmp	0x14027b06b <.text+0x27a06b>
14027b0ba:     	movl	$0x8, %ecx
14027b0bf:     	movl	$0x18, %edx
14027b0c4:     	callq	0x145d69431 <.text+0x5d68431>
14027b0c9:     	ud2
