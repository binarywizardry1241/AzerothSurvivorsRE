
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145542830:     	pushq	%r15
145542832:     	pushq	%r14
145542834:     	pushq	%r13
145542836:     	pushq	%r12
145542838:     	pushq	%rsi
145542839:     	pushq	%rdi
14554283a:     	pushq	%rbp
14554283b:     	pushq	%rbx
14554283c:     	subq	$0x108, %rsp            # imm = 0x108
145542843:     	movaps	%xmm15, 0xf0(%rsp)
14554284c:     	movaps	%xmm14, 0xe0(%rsp)
145542855:     	movaps	%xmm13, 0xd0(%rsp)
14554285e:     	movaps	%xmm12, 0xc0(%rsp)
145542867:     	movaps	%xmm11, 0xb0(%rsp)
145542870:     	movaps	%xmm10, 0xa0(%rsp)
145542879:     	movaps	%xmm9, 0x90(%rsp)
145542882:     	movaps	%xmm8, 0x80(%rsp)
14554288b:     	movaps	%xmm7, 0x70(%rsp)
145542890:     	movaps	%xmm6, 0x60(%rsp)
145542895:     	movq	%rdx, %rdi
145542898:     	movq	(%rdx), %r14
14554289b:     	movq	0x8(%rdx), %r8
14554289f:     	movq	%r8, %rsi
1455428a2:     	subq	%r14, %rsi
1455428a5:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1455428af:     	movq	%rsi, %rax
1455428b2:     	mulq	%rdx
1455428b5:     	movabsq	$0x7ffffffffffffffc, %rax # imm = 0x7FFFFFFFFFFFFFFC
1455428bf:     	cmpq	%rax, %rsi
1455428c2:     	jbe	0x1455428d3 <.text+0x55418d3>
1455428c4:     	xorl	%ebx, %ebx
1455428c6:     	movq	%rbx, %rcx
1455428c9:     	movq	%rsi, %rdx
1455428cc:     	callq	0x14590379b <.text+0x590279b>
1455428d1:     	ud2
1455428d3:     	cmpq	%r14, %r8
1455428d6:     	je	0x1455429e3 <.text+0x55419e3>
1455428dc:     	movq	%rdx, %r12
1455428df:     	movq	%rcx, %r15
1455428e2:     	callq	0x140002200 <.text+0x1200>
1455428e7:     	movl	$0x4, %ebx
1455428ec:     	movl	$0x4, %edx
1455428f1:     	movq	%rsi, %rcx
1455428f4:     	callq	0x1400021c0 <.text+0x11c0>
1455428f9:     	testq	%rax, %rax
1455428fc:     	je	0x1455428c6 <.text+0x55418c6>
1455428fe:     	movq	%r12, %rdx
145542901:     	shrq	$0x3, %rdx
145542905:     	movq	0x10(%rdi), %r8
145542909:     	movq	0x18(%rdi), %r9
14554290d:     	movq	0x20(%rdi), %r10
145542911:     	cmpq	$0x30, %rsi
145542915:     	movq	%r15, %rcx
145542918:     	jae	0x145542a5e <.text+0x5541a5e>
14554291e:     	xorl	%ebx, %ebx
145542920:     	leaq	(%rbx,%rbx,2), %r11
145542924:     	leaq	0x8(,%r11,4), %rsi
14554292c:     	movq	%rdx, %rdi
14554292f:     	subq	%rbx, %rdi
145542932:     	nopw	%cs:(%rax,%rax)
145542940:     	movss	(%r14,%rsi), %xmm1
145542946:     	movss	0x20(%r8), %xmm0
14554294c:     	mulss	%xmm1, %xmm0
145542950:     	movups	(%r8), %xmm2
145542954:     	movsd	0x10(%r8), %xmm3
14554295a:     	movsd	-0x8(%r14,%rsi), %xmm4
145542961:     	movaps	%xmm2, %xmm5
145542964:     	shufps	$0xed, %xmm2, %xmm5     # xmm5 = xmm5[1,3],xmm2[2,3]
145542968:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
14554296b:     	mulps	%xmm4, %xmm2
14554296e:     	movss	0x18(%r8), %xmm6
145542974:     	mulss	%xmm4, %xmm6
145542978:     	movshdup	%xmm4, %xmm7            # xmm7 = xmm4[1,1,3,3]
14554297c:     	shufps	$0xe1, %xmm4, %xmm4     # xmm4 = xmm4[1,0,2,3]
145542980:     	mulps	%xmm5, %xmm4
145542983:     	movss	(%r10), %xmm5
145542988:     	addps	%xmm4, %xmm2
14554298b:     	movsd	0x8(%r8), %xmm4
145542991:     	shufps	$0x1, %xmm4, %xmm3      # xmm3 = xmm3[1,0],xmm4[0,0]
145542995:     	shufps	$0x42, %xmm4, %xmm3     # xmm3 = xmm3[2,0],xmm4[0,1]
145542999:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14554299d:     	mulps	%xmm3, %xmm1
1455429a0:     	addps	%xmm2, %xmm1
1455429a3:     	mulss	0x1c(%r8), %xmm7
1455429a9:     	addss	%xmm6, %xmm7
1455429ad:     	addss	%xmm0, %xmm7
1455429b1:     	movsd	(%r9), %xmm0
1455429b6:     	movsldup	%xmm5, %xmm2            # xmm2 = xmm5[0,0,2,2]
1455429ba:     	mulps	%xmm1, %xmm2
1455429bd:     	addps	%xmm0, %xmm2
1455429c0:     	mulss	%xmm5, %xmm7
1455429c4:     	addss	0x8(%r9), %xmm7
1455429ca:     	movlps	%xmm2, -0x8(%rax,%rsi)
1455429cf:     	movss	%xmm7, (%rax,%rsi)
1455429d4:     	addq	$0xc, %rsi
1455429d8:     	decq	%rdi
1455429db:     	jne	0x145542940 <.text+0x5541940>
1455429e1:     	jmp	0x1455429ea <.text+0x55419ea>
1455429e3:     	movl	$0x4, %eax
1455429e8:     	xorl	%edx, %edx
1455429ea:     	movq	%rdx, (%rcx)
1455429ed:     	movq	%rax, 0x8(%rcx)
1455429f1:     	movq	%rdx, 0x10(%rcx)
1455429f5:     	movq	%rcx, %rax
1455429f8:     	movaps	0x60(%rsp), %xmm6
1455429fd:     	movaps	0x70(%rsp), %xmm7
145542a02:     	movaps	0x80(%rsp), %xmm8
145542a0b:     	movaps	0x90(%rsp), %xmm9
145542a14:     	movaps	0xa0(%rsp), %xmm10
145542a1d:     	movaps	0xb0(%rsp), %xmm11
145542a26:     	movaps	0xc0(%rsp), %xmm12
145542a2f:     	movaps	0xd0(%rsp), %xmm13
145542a38:     	movaps	0xe0(%rsp), %xmm14
145542a41:     	movaps	0xf0(%rsp), %xmm15
145542a4a:     	addq	$0x108, %rsp            # imm = 0x108
145542a51:     	popq	%rbx
145542a52:     	popq	%rbp
145542a53:     	popq	%rdi
145542a54:     	popq	%rsi
145542a55:     	popq	%r12
145542a57:     	popq	%r13
145542a59:     	popq	%r14
145542a5b:     	popq	%r15
145542a5d:     	retq
145542a5e:     	leaq	(,%rdx,4), %r11
145542a66:     	leaq	(%r11,%r11,2), %r11
145542a6a:     	leaq	(%rax,%r11), %r12
145542a6e:     	leaq	0x24(%r8), %rsi
145542a72:     	addq	%r14, %r11
145542a75:     	leaq	0xc(%r9), %rdi
145542a79:     	cmpq	%rsi, %rax
145542a7c:     	setb	%r15b
145542a80:     	cmpq	%r12, %r8
145542a83:     	setb	%r13b
145542a87:     	cmpq	%r11, %rax
145542a8a:     	setb	%bl
145542a8d:     	cmpq	%r12, %r14
145542a90:     	setb	%bpl
145542a94:     	cmpq	%rdi, %rax
145542a97:     	setb	%sil
145542a9b:     	cmpq	%r12, %r9
145542a9e:     	setb	%r11b
145542aa2:     	leaq	0x4(%r10), %rdi
145542aa6:     	cmpq	%rdi, %rax
145542aa9:     	setb	%dil
145542aad:     	cmpq	%r12, %r10
145542ab0:     	setb	%r12b
145542ab4:     	testb	%r13b, %r15b
145542ab7:     	jne	0x14554291e <.text+0x554191e>
145542abd:     	andb	%bpl, %bl
145542ac0:     	jne	0x14554291e <.text+0x554191e>
145542ac6:     	andb	%r11b, %sil
145542ac9:     	movl	$0x0, %ebx
145542ace:     	jne	0x145542920 <.text+0x5541920>
145542ad4:     	andb	%r12b, %dil
145542ad7:     	jne	0x145542920 <.text+0x5541920>
145542add:     	movabsq	$0xffffffffffffffc, %rbx # imm = 0xFFFFFFFFFFFFFFC
145542ae7:     	andq	%rdx, %rbx
145542aea:     	movss	(%r9), %xmm5
145542aef:     	movss	0x4(%r9), %xmm6
145542af5:     	movss	0x8(%r9), %xmm0
145542afb:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145542aff:     	movaps	%xmm0, 0x50(%rsp)
145542b04:     	movss	(%r10), %xmm3
145542b09:     	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
145542b0d:     	movss	0x20(%r8), %xmm0
145542b13:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145542b17:     	movaps	%xmm0, 0x40(%rsp)
145542b1c:     	movss	0x1c(%r8), %xmm0
145542b22:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145542b26:     	movaps	%xmm0, 0x30(%rsp)
145542b2b:     	movss	0x18(%r8), %xmm0
145542b31:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145542b35:     	movaps	%xmm0, 0x20(%rsp)
145542b3a:     	movss	0x14(%r8), %xmm1
145542b40:     	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
145542b44:     	movss	0x10(%r8), %xmm4
145542b4a:     	shufps	$0x0, %xmm4, %xmm4      # xmm4 = xmm4[0,0,0,0]
145542b4e:     	movss	(%r8), %xmm9
145542b53:     	movss	0x4(%r8), %xmm10
145542b59:     	movss	0x8(%r8), %xmm11
145542b5f:     	movss	0xc(%r8), %xmm12
145542b65:     	shufps	$0x0, %xmm12, %xmm12    # xmm12 = xmm12[0,0,0,0]
145542b6a:     	shufps	$0x0, %xmm11, %xmm11    # xmm11 = xmm11[0,0,0,0]
145542b6f:     	shufps	$0x0, %xmm10, %xmm10    # xmm10 = xmm10[0,0,0,0]
145542b74:     	shufps	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
145542b79:     	shufps	$0x0, %xmm6, %xmm6      # xmm6 = xmm6[0,0,0,0]
145542b7d:     	shufps	$0x0, %xmm5, %xmm5      # xmm5 = xmm5[0,0,0,0]
145542b81:     	xorl	%esi, %esi
145542b83:     	movq	%rbx, %rdi
145542b86:     	nopw	%cs:(%rax,%rax)
145542b90:     	movss	0x24(%r14,%rsi), %xmm0
145542b97:     	movss	0x18(%r14,%rsi), %xmm7
145542b9e:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
145542ba1:     	movss	(%r14,%rsi), %xmm0
145542ba7:     	movss	0x4(%r14,%rsi), %xmm15
145542bae:     	movss	0x8(%r14,%rsi), %xmm13
145542bb5:     	movss	0xc(%r14,%rsi), %xmm14
145542bbc:     	unpcklps	%xmm14, %xmm0           # xmm0 = xmm0[0],xmm14[0],xmm0[1],xmm14[1]
145542bc0:     	movlhps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0]
145542bc3:     	movaps	%xmm9, %xmm7
145542bc7:     	mulps	%xmm0, %xmm7
145542bca:     	movss	0x28(%r14,%rsi), %xmm14
145542bd1:     	movss	0x1c(%r14,%rsi), %xmm2
145542bd8:     	unpcklps	%xmm14, %xmm2           # xmm2 = xmm2[0],xmm14[0],xmm2[1],xmm14[1]
145542bdc:     	movss	0x10(%r14,%rsi), %xmm14
145542be3:     	unpcklps	%xmm14, %xmm15          # xmm15 = xmm15[0],xmm14[0],xmm15[1],xmm14[1]
145542be7:     	movlhps	%xmm2, %xmm15           # xmm15 = xmm15[0],xmm2[0]
145542beb:     	movaps	%xmm10, %xmm2
145542bef:     	mulps	%xmm15, %xmm2
145542bf3:     	addps	%xmm7, %xmm2
145542bf6:     	movss	0x2c(%r14,%rsi), %xmm7
145542bfd:     	movss	0x20(%r14,%rsi), %xmm14
145542c04:     	unpcklps	%xmm7, %xmm14           # xmm14 = xmm14[0],xmm7[0],xmm14[1],xmm7[1]
145542c08:     	movss	0x14(%r14,%rsi), %xmm7
145542c0f:     	unpcklps	%xmm7, %xmm13           # xmm13 = xmm13[0],xmm7[0],xmm13[1],xmm7[1]
145542c13:     	movlhps	%xmm14, %xmm13          # xmm13 = xmm13[0],xmm14[0]
145542c17:     	movaps	%xmm11, %xmm14
145542c1b:     	mulps	%xmm13, %xmm14
145542c1f:     	addps	%xmm2, %xmm14
145542c23:     	movaps	%xmm12, %xmm2
145542c27:     	mulps	%xmm0, %xmm2
145542c2a:     	movaps	%xmm4, %xmm8
145542c2e:     	mulps	%xmm15, %xmm8
145542c32:     	addps	%xmm2, %xmm8
145542c36:     	movaps	%xmm1, %xmm7
145542c39:     	mulps	%xmm13, %xmm7
145542c3d:     	addps	%xmm8, %xmm7
145542c41:     	mulps	0x20(%rsp), %xmm0
145542c46:     	mulps	0x30(%rsp), %xmm15
145542c4c:     	addps	%xmm0, %xmm15
145542c50:     	mulps	0x40(%rsp), %xmm13
145542c56:     	addps	%xmm15, %xmm13
145542c5a:     	mulps	%xmm3, %xmm14
145542c5e:     	addps	%xmm5, %xmm14
145542c62:     	mulps	%xmm3, %xmm7
145542c65:     	addps	%xmm6, %xmm7
145542c68:     	mulps	%xmm3, %xmm13
145542c6c:     	addps	0x50(%rsp), %xmm13
145542c72:     	movaps	%xmm13, %xmm0
145542c76:     	shufps	$0xd4, %xmm14, %xmm0    # xmm0 = xmm0[0,1],xmm14[1,3]
145542c7b:     	movaps	%xmm7, %xmm2
145542c7e:     	movlhps	%xmm14, %xmm2           # xmm2 = xmm2[0],xmm14[0]
145542c82:     	shufps	$0x82, %xmm0, %xmm2     # xmm2 = xmm2[2,0],xmm0[0,2]
145542c86:     	movaps	%xmm14, %xmm0
145542c8a:     	unpckhpd	%xmm7, %xmm0            # xmm0 = xmm0[1],xmm7[1]
145542c8e:     	shufps	$0xff, %xmm7, %xmm14    # xmm14 = xmm14[3,3],xmm7[3,3]
145542c93:     	shufps	$0xe9, %xmm13, %xmm14   # xmm14 = xmm14[1,2],xmm13[2,3]
145542c98:     	shufps	$0x55, %xmm7, %xmm13    # xmm13 = xmm13[1,1],xmm7[1,1]
145542c9d:     	shufps	$0x82, %xmm0, %xmm13    # xmm13 = xmm13[2,0],xmm0[0,2]
145542ca2:     	movups	%xmm13, 0x10(%rax,%rsi)
145542ca8:     	movups	%xmm2, (%rax,%rsi)
145542cac:     	shufps	$0xd2, %xmm14, %xmm14   # xmm14 = xmm14[2,0,1,3]
145542cb1:     	movups	%xmm14, 0x20(%rax,%rsi)
145542cb7:     	addq	$0x30, %rsi
145542cbb:     	addq	$-0x4, %rdi
145542cbf:     	jne	0x145542b90 <.text+0x5541b90>
145542cc5:     	cmpq	%rbx, %rdx
145542cc8:     	jne	0x145542920 <.text+0x5541920>
145542cce:     	jmp	0x1455429ea <.text+0x55419ea>
