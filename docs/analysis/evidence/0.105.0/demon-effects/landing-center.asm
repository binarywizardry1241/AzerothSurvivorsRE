
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145927830:     	pushq	%rbp
145927831:     	pushq	%r15
145927833:     	pushq	%r14
145927835:     	pushq	%r12
145927837:     	pushq	%rsi
145927838:     	pushq	%rdi
145927839:     	pushq	%rbx
14592783a:     	subq	$0x170, %rsp            # imm = 0x170
145927841:     	leaq	0x80(%rsp), %rbp
145927849:     	movaps	%xmm13, 0xe0(%rbp)
145927851:     	movaps	%xmm12, 0xd0(%rbp)
145927859:     	movaps	%xmm11, 0xc0(%rbp)
145927861:     	movaps	%xmm10, 0xb0(%rbp)
145927869:     	movaps	%xmm9, 0xa0(%rbp)
145927871:     	movdqa	%xmm8, 0x90(%rbp)
14592787a:     	movaps	%xmm7, 0x80(%rbp)
145927881:     	movaps	%xmm6, 0x70(%rbp)
145927885:     	movq	$-0x2, 0x68(%rbp)
14592788d:     	movaps	%xmm3, %xmm6
145927890:     	movq	%rdx, %rbx
145927893:     	movq	%rcx, %rsi
145927896:     	movss	0x9ec(%rdx), %xmm7
14592789e:     	movss	%xmm7, 0x64(%rbp)
1459278a3:     	movl	0x4d0(%rdx), %eax
1459278a9:     	movl	%eax, 0x20(%rbp)
1459278ac:     	movq	0x4c8(%rdx), %rax
1459278b3:     	movq	%rax, 0x18(%rbp)
1459278b7:     	movq	$0x0, 0x28(%rsp)
1459278c0:     	movq	$0x8, 0x20(%rsp)
1459278c9:     	movq	%rbp, %rcx
1459278cc:     	leaq	0x18(%rbp), %r8
1459278d0:     	movaps	%xmm2, %xmm3
1459278d3:     	callq	0x145925c80 <.text+0x5924c80>
1459278d8:     	movq	0x560(%rbx), %r15
1459278df:     	imulq	$0x160, 0x568(%rbx), %r12 # imm = 0x160
1459278ea:     	leaq	(%r15,%r12), %rax
1459278ee:     	movq	%r15, 0x18(%rbp)
1459278f2:     	movq	%rax, 0x20(%rbp)
1459278f6:     	leaq	0x64(%rbp), %rax
1459278fa:     	movq	%rax, 0x28(%rbp)
1459278fe:     	leaq	0x48(%rbp), %r14
145927902:     	leaq	0x18(%rbp), %rdx
145927906:     	movq	%r14, %rcx
145927909:     	callq	0x1459992c0 <.text+0x59982c0>
14592790e:     	nop
14592790f:     	mulss	%xmm6, %xmm6
145927913:     	movss	%xmm6, 0x60(%rbp)
145927918:     	movq	0x8(%rbp), %rdi
14592791c:     	movq	0x10(%rbp), %rax
145927920:     	testq	%rax, %rax
145927923:     	je	0x14592797a <.text+0x592697a>
145927925:     	leaq	(%rdi,%rax,8), %rax
145927929:     	movl	$0x18, %ecx
14592792e:     	movq	%rdi, %rdx
145927931:     	decq	%rcx
145927934:     	movq	(%rdx), %r9
145927937:     	addq	$0x8, %rdx
14592793b:     	xorl	%r8d, %r8d
14592793e:     	movq	%r15, %r10
145927941:     	nopw	%cs:(%rax,%rax)
145927950:     	cmpq	%r8, %r12
145927953:     	je	0x145927970 <.text+0x5926970>
145927955:     	addq	$0x160, %r8             # imm = 0x160
14592795c:     	cmpq	%r9, 0x88(%r10)
145927963:     	leaq	0x160(%r10), %r10
14592796a:     	jne	0x145927950 <.text+0x5926950>
14592796c:     	jmp	0x145927992 <.text+0x5926992>
14592796e:     	nop
145927970:     	testq	%rcx, %rcx
145927973:     	je	0x14592797a <.text+0x592697a>
145927975:     	cmpq	%rax, %rdx
145927978:     	jne	0x145927931 <.text+0x5926931>
14592797a:     	movl	$0x0, (%rsi)
145927980:     	movq	0x48(%rbp), %rax
145927984:     	testq	%rax, %rax
145927987:     	jne	0x145927bba <.text+0x5926bba>
14592798d:     	jmp	0x145927bd1 <.text+0x5926bd1>
145927992:     	movss	-0x38(%r15,%r8), %xmm1
145927999:     	xorps	%xmm0, %xmm0
14592799c:     	ucomiss	%xmm1, %xmm0
14592799f:     	jae	0x145927a0f <.text+0x5926a0f>
1459279a1:     	subss	-0x3c(%r15,%r8), %xmm7
1459279a8:     	divss	%xmm1, %xmm7
1459279ac:     	maxss	%xmm7, %xmm0
1459279b0:     	movss	0x4459b4(%rip), %xmm2   # 0x145d6d36c
1459279b8:     	minss	%xmm0, %xmm2
1459279bc:     	movsd	-0x54(%r15,%r8), %xmm1
1459279c3:     	movsd	-0x48(%r15,%r8), %xmm3
1459279ca:     	subps	%xmm1, %xmm3
1459279cd:     	movsldup	%xmm2, %xmm0            # xmm0 = xmm2[0,0,2,2]
1459279d1:     	mulps	%xmm3, %xmm0
1459279d4:     	addps	%xmm1, %xmm0
1459279d7:     	movss	-0x4c(%r15,%r8), %xmm3
1459279de:     	movss	-0x40(%r15,%r8), %xmm1
1459279e5:     	subss	%xmm3, %xmm1
1459279e9:     	mulss	%xmm2, %xmm1
1459279ed:     	addss	%xmm3, %xmm1
1459279f1:     	movq	0x58(%rbp), %r8
1459279f5:     	testq	%r8, %r8
1459279f8:     	je	0x145927a26 <.text+0x5926a26>
1459279fa:     	movq	0x50(%rbp), %r9
1459279fe:     	cmpq	$0x5, %r8
145927a02:     	jae	0x145927a2e <.text+0x5926a2e>
145927a04:     	xorl	%r10d, %r10d
145927a07:     	xorl	%r11d, %r11d
145927a0a:     	jmp	0x145927b1c <.text+0x5926b1c>
145927a0f:     	movsd	-0x48(%r15,%r8), %xmm0
145927a16:     	movss	-0x40(%r15,%r8), %xmm1
145927a1d:     	movq	0x58(%rbp), %r8
145927a21:     	testq	%r8, %r8
145927a24:     	jne	0x1459279fa <.text+0x59269fa>
145927a26:     	xorl	%r11d, %r11d
145927a29:     	jmp	0x145927b53 <.text+0x5926b53>
145927a2e:     	movl	%r8d, %r10d
145927a31:     	andl	$0x3, %r10d
145927a35:     	movl	$0x4, %r11d
145927a3b:     	cmovneq	%r10, %r11
145927a3f:     	movq	%r8, %r10
145927a42:     	subq	%r11, %r10
145927a45:     	movsldup	%xmm0, %xmm3            # xmm3 = xmm0[0,0,2,2]
145927a49:     	movshdup	%xmm0, %xmm4            # xmm4 = xmm0[1,1,3,3]
145927a4d:     	movsldup	%xmm6, %xmm5            # xmm5 = xmm6[0,0,2,2]
145927a51:     	leaq	0x28(%r9), %r11
145927a55:     	xorps	%xmm2, %xmm2
145927a58:     	movaps	0x4458b1(%rip), %xmm7   # 0x145d6d310
145927a5f:     	movq	%r10, %r15
145927a62:     	pxor	%xmm8, %xmm8
145927a67:     	nopw	(%rax,%rax)
145927a70:     	movss	-0x28(%r11), %xmm11
145927a76:     	movss	-0x24(%r11), %xmm9
145927a7c:     	movss	-0x1c(%r11), %xmm10
145927a82:     	unpcklps	%xmm10, %xmm11          # xmm11 = xmm11[0],xmm10[0],xmm11[1],xmm10[1]
145927a86:     	movss	-0x18(%r11), %xmm10
145927a8c:     	unpcklps	%xmm10, %xmm9           # xmm9 = xmm9[0],xmm10[0],xmm9[1],xmm10[1]
145927a90:     	movss	-0x4(%r11), %xmm10
145927a96:     	movss	-0x10(%r11), %xmm12
145927a9c:     	unpcklps	%xmm10, %xmm12          # xmm12 = xmm12[0],xmm10[0],xmm12[1],xmm10[1]
145927aa0:     	movss	(%r11), %xmm13
145927aa5:     	movss	-0xc(%r11), %xmm10
145927aab:     	unpcklps	%xmm13, %xmm10          # xmm10 = xmm10[0],xmm13[0],xmm10[1],xmm13[1]
145927aaf:     	subps	%xmm3, %xmm11
145927ab3:     	subps	%xmm3, %xmm12
145927ab7:     	subps	%xmm4, %xmm9
145927abb:     	subps	%xmm4, %xmm10
145927abf:     	mulps	%xmm11, %xmm11
145927ac3:     	mulps	%xmm12, %xmm12
145927ac7:     	mulps	%xmm9, %xmm9
145927acb:     	addps	%xmm11, %xmm9
145927acf:     	mulps	%xmm10, %xmm10
145927ad3:     	addps	%xmm12, %xmm10
145927ad7:     	cmpleps	%xmm5, %xmm9
145927adc:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
145927ae0:     	andps	%xmm7, %xmm9
145927ae4:     	paddq	%xmm9, %xmm8
145927ae9:     	cmpleps	%xmm5, %xmm10
145927aee:     	unpcklps	%xmm0, %xmm10           # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
145927af2:     	andps	%xmm7, %xmm10
145927af6:     	paddq	%xmm10, %xmm2
145927afb:     	addq	$0x30, %r11
145927aff:     	addq	$-0x4, %r15
145927b03:     	jne	0x145927a70 <.text+0x5926a70>
145927b09:     	paddq	%xmm8, %xmm2
145927b0e:     	pshufd	$0xee, %xmm2, %xmm3     # xmm3 = xmm2[2,3,2,3]
145927b13:     	paddq	%xmm2, %xmm3
145927b17:     	movq	%xmm3, %r11
145927b1c:     	subq	%r10, %r8
145927b1f:     	leaq	(%r10,%r10,2), %r10
145927b23:     	leaq	(%r9,%r10,4), %r9
145927b27:     	nopw	(%rax,%rax)
145927b30:     	movsd	(%r9), %xmm2
145927b35:     	subps	%xmm0, %xmm2
145927b38:     	mulps	%xmm2, %xmm2
145927b3b:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145927b3f:     	addss	%xmm2, %xmm3
145927b43:     	ucomiss	%xmm3, %xmm6
145927b46:     	sbbq	$-0x1, %r11
145927b4a:     	addq	$0xc, %r9
145927b4e:     	decq	%r8
145927b51:     	jne	0x145927b30 <.text+0x5926b30>
145927b53:     	movq	%r11, -0x18(%rbp)
145927b57:     	movlps	%xmm0, -0x10(%rbp)
145927b5b:     	movss	%xmm1, -0x8(%rbp)
145927b60:     	movq	%rdx, 0x18(%rbp)
145927b64:     	movq	%rax, 0x20(%rbp)
145927b68:     	movq	%rcx, 0x28(%rbp)
145927b6c:     	movq	%rbx, 0x30(%rbp)
145927b70:     	movq	%r14, 0x38(%rbp)
145927b74:     	leaq	0x60(%rbp), %rax
145927b78:     	movq	%rax, 0x40(%rbp)
145927b7c:     	leaq	-0x48(%rbp), %rbx
145927b80:     	leaq	0x18(%rbp), %rdx
145927b84:     	leaq	-0x18(%rbp), %r8
145927b88:     	movq	%rbx, %rcx
145927b8b:     	callq	0x1459ae710 <.text+0x59ad710>
145927b90:     	nop
145927b91:     	movups	(%rbx), %xmm0
145927b94:     	movaps	%xmm0, -0x30(%rbp)
145927b98:     	movq	0x10(%rbx), %rax
145927b9c:     	movq	%rax, -0x20(%rbp)
145927ba0:     	movl	%eax, 0xc(%rsi)
145927ba3:     	movq	-0x28(%rbp), %rax
145927ba7:     	movq	%rax, 0x4(%rsi)
145927bab:     	movl	$0x1, (%rsi)
145927bb1:     	movq	0x48(%rbp), %rax
145927bb5:     	testq	%rax, %rax
145927bb8:     	je	0x145927bd1 <.text+0x5926bd1>
145927bba:     	movq	0x50(%rbp), %rcx
145927bbe:     	shlq	$0x2, %rax
145927bc2:     	leaq	(%rax,%rax,2), %rdx
145927bc6:     	movl	$0x4, %r8d
145927bcc:     	callq	0x1400021d0 <.text+0x11d0>
145927bd1:     	movq	(%rbp), %rdx
145927bd5:     	testq	%rdx, %rdx
145927bd8:     	je	0x145927bec <.text+0x5926bec>
145927bda:     	shlq	$0x3, %rdx
145927bde:     	movl	$0x8, %r8d
145927be4:     	movq	%rdi, %rcx
145927be7:     	callq	0x1400021d0 <.text+0x11d0>
145927bec:     	movaps	0x70(%rbp), %xmm6
145927bf0:     	movaps	0x80(%rbp), %xmm7
145927bf7:     	movaps	0x90(%rbp), %xmm8
145927bff:     	movaps	0xa0(%rbp), %xmm9
145927c07:     	movaps	0xb0(%rbp), %xmm10
145927c0f:     	movaps	0xc0(%rbp), %xmm11
145927c17:     	movaps	0xd0(%rbp), %xmm12
145927c1f:     	movaps	0xe0(%rbp), %xmm13
145927c27:     	addq	$0x170, %rsp            # imm = 0x170
145927c2e:     	popq	%rbx
145927c2f:     	popq	%rdi
145927c30:     	popq	%rsi
145927c31:     	popq	%r12
145927c33:     	popq	%r14
145927c35:     	popq	%r15
145927c37:     	popq	%rbp
145927c38:     	retq
