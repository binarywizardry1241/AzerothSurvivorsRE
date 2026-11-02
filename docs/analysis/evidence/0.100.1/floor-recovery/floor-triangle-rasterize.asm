
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145530800:     	pushq	%r15
145530802:     	pushq	%r14
145530804:     	pushq	%r13
145530806:     	pushq	%r12
145530808:     	pushq	%rsi
145530809:     	pushq	%rdi
14553080a:     	pushq	%rbp
14553080b:     	pushq	%rbx
14553080c:     	subq	$0x148, %rsp            # imm = 0x148
145530813:     	movaps	%xmm15, 0x130(%rsp)
14553081c:     	movaps	%xmm14, 0x120(%rsp)
145530825:     	movaps	%xmm13, 0x110(%rsp)
14553082e:     	movaps	%xmm12, 0x100(%rsp)
145530837:     	movaps	%xmm11, 0xf0(%rsp)
145530840:     	movaps	%xmm10, 0xe0(%rsp)
145530849:     	movaps	%xmm9, 0xd0(%rsp)
145530852:     	movaps	%xmm8, 0xc0(%rsp)
14553085b:     	movaps	%xmm7, 0xb0(%rsp)
145530863:     	movaps	%xmm6, 0xa0(%rsp)
14553086b:     	movq	0x1b0(%rsp), %rax
145530873:     	movss	0x8(%r9), %xmm1
145530879:     	movss	0x8(%r8), %xmm5
14553087f:     	movss	0x8(%rax), %xmm0
145530884:     	movaps	%xmm0, %xmm6
145530887:     	unpcklps	%xmm1, %xmm6            # xmm6 = xmm6[0],xmm1[0],xmm6[1],xmm1[1]
14553088a:     	movsldup	%xmm5, %xmm2            # xmm2 = xmm5[0,0,2,2]
14553088e:     	subps	%xmm2, %xmm6
145530891:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
145530895:     	movsd	(%r9), %xmm14
14553089a:     	movsd	(%r8), %xmm7
14553089f:     	movaps	%xmm14, %xmm4
1455308a3:     	subps	%xmm7, %xmm4
1455308a6:     	movsd	(%rax), %xmm9
1455308ab:     	movaps	%xmm9, %xmm8
1455308af:     	subps	%xmm7, %xmm8
1455308b3:     	movaps	%xmm6, %xmm15
1455308b7:     	shufps	$0x10, %xmm8, %xmm15    # xmm15 = xmm15[0,0],xmm8[1,0]
1455308bc:     	shufps	$0xe2, %xmm8, %xmm15    # xmm15 = xmm15[2,0],xmm8[2,3]
1455308c1:     	mulps	%xmm4, %xmm15
1455308c5:     	movaps	%xmm6, %xmm3
1455308c8:     	shufps	$0x11, %xmm4, %xmm3     # xmm3 = xmm3[1,0],xmm4[1,0]
1455308cc:     	shufps	$0xe2, %xmm4, %xmm3     # xmm3 = xmm3[2,0],xmm4[2,3]
1455308d0:     	mulps	%xmm8, %xmm3
1455308d4:     	subps	%xmm3, %xmm15
1455308d8:     	movaps	%xmm15, %xmm3
1455308dc:     	mulps	%xmm15, %xmm3
1455308e0:     	movaps	%xmm4, 0x60(%rsp)
1455308e5:     	mulss	%xmm6, %xmm4
1455308e9:     	movaps	%xmm8, 0x50(%rsp)
1455308ef:     	mulss	%xmm8, %xmm2
1455308f4:     	subss	%xmm4, %xmm2
1455308f8:     	mulss	%xmm2, %xmm2
1455308fc:     	movshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
145530900:     	addss	%xmm2, %xmm4
145530904:     	addss	%xmm3, %xmm4
145530908:     	xorps	%xmm2, %xmm2
14553090b:     	sqrtss	%xmm4, %xmm2
14553090f:     	movss	0x4b46f9(%rip), %xmm3   # 0x1459e5010
145530917:     	ucomiss	%xmm2, %xmm3
14553091a:     	ja	0x145530e0f <.text+0x552fe0f>
145530920:     	movaps	0x3e4e59(%rip), %xmm3   # 0x145915780
145530927:     	andps	%xmm15, %xmm3
14553092b:     	divss	%xmm2, %xmm3
14553092f:     	movss	0x41759d(%rip), %xmm2   # 0x145947ed4
145530937:     	ucomiss	%xmm3, %xmm2
14553093a:     	ja	0x145530e0f <.text+0x552fe0f>
145530940:     	movaps	%xmm5, %xmm2
145530943:     	minss	%xmm1, %xmm2
145530947:     	movaps	%xmm2, %xmm1
14553094a:     	cmpunordss	%xmm2, %xmm1
14553094f:     	movaps	%xmm1, %xmm3
145530952:     	andnps	%xmm2, %xmm3
145530955:     	andps	%xmm5, %xmm1
145530958:     	orps	%xmm3, %xmm1
14553095b:     	movaps	%xmm1, %xmm2
14553095e:     	minss	%xmm0, %xmm2
145530962:     	movaps	%xmm2, %xmm0
145530965:     	cmpunordss	%xmm2, %xmm0
14553096a:     	andps	%xmm0, %xmm1
14553096d:     	andnps	%xmm2, %xmm0
145530970:     	orps	%xmm1, %xmm0
145530973:     	ucomiss	0x1b8(%rsp), %xmm0
14553097b:     	ja	0x145530e0f <.text+0x552fe0f>
145530981:     	movq	%rcx, %rsi
145530984:     	movaps	%xmm6, 0x70(%rsp)
145530989:     	movaps	%xmm5, 0x80(%rsp)
145530991:     	movss	(%rdx), %xmm13
145530996:     	movss	0x4(%rdx), %xmm0
14553099b:     	movss	%xmm0, 0x2c(%rsp)
1455309a1:     	movq	0x8(%rdx), %r14
1455309a5:     	movaps	%xmm7, %xmm0
1455309a8:     	minss	%xmm14, %xmm0
1455309ad:     	movaps	%xmm0, %xmm1
1455309b0:     	cmpunordss	%xmm0, %xmm1
1455309b5:     	movaps	%xmm1, %xmm2
1455309b8:     	andnps	%xmm0, %xmm2
1455309bb:     	andps	%xmm7, %xmm1
1455309be:     	orps	%xmm2, %xmm1
1455309c1:     	movaps	%xmm1, %xmm0
1455309c4:     	minss	%xmm9, %xmm0
1455309c9:     	movaps	%xmm0, %xmm6
1455309cc:     	cmpunordss	%xmm0, %xmm6
1455309d1:     	andps	%xmm6, %xmm1
1455309d4:     	andnps	%xmm0, %xmm6
1455309d7:     	orps	%xmm1, %xmm6
1455309da:     	movaps	%xmm7, %xmm0
1455309dd:     	maxss	%xmm14, %xmm0
1455309e2:     	movaps	%xmm0, %xmm1
1455309e5:     	cmpunordss	%xmm0, %xmm1
1455309ea:     	movaps	%xmm1, %xmm2
1455309ed:     	andnps	%xmm0, %xmm2
1455309f0:     	movaps	%xmm7, 0x30(%rsp)
1455309f5:     	andps	%xmm7, %xmm1
1455309f8:     	orps	%xmm2, %xmm1
1455309fb:     	movaps	%xmm1, %xmm2
1455309fe:     	maxss	%xmm9, %xmm2
145530a03:     	movaps	%xmm2, %xmm0
145530a06:     	cmpunordss	%xmm2, %xmm0
145530a0b:     	andps	%xmm0, %xmm1
145530a0e:     	andnps	%xmm2, %xmm0
145530a11:     	orps	%xmm1, %xmm0
145530a14:     	subss	%xmm13, %xmm0
145530a19:     	addss	%xmm0, %xmm0
145530a1d:     	addss	0x3e292f(%rip), %xmm0   # 0x145913354
145530a25:     	callq	0x145773265 <.text+0x5772265>
145530a2a:     	xorps	%xmm10, %xmm10
145530a2e:     	ucomiss	%xmm0, %xmm10
145530a32:     	jbe	0x145530a38 <.text+0x552fa38>
145530a34:     	xorl	%ebx, %ebx
145530a36:     	jmp	0x145530a80 <.text+0x552fa80>
145530a38:     	cvttss2si	%xmm0, %rax
145530a3d:     	movq	%rax, %rcx
145530a40:     	movaps	%xmm0, %xmm1
145530a43:     	subss	0x3d6795(%rip), %xmm1   # 0x1459071e0
145530a4b:     	cvttss2si	%xmm1, %rdx
145530a50:     	sarq	$0x3f, %rcx
145530a54:     	andq	%rcx, %rdx
145530a57:     	orq	%rax, %rdx
145530a5a:     	xorl	%eax, %eax
145530a5c:     	ucomiss	%xmm10, %xmm0
145530a60:     	cmovaeq	%rdx, %rax
145530a64:     	ucomiss	0x3d6779(%rip), %xmm0   # 0x1459071e4
145530a6b:     	movq	$-0x1, %rbx
145530a72:     	cmovbeq	%rax, %rbx
145530a76:     	incq	%rbx
145530a79:     	cmpq	%rbx, %r14
145530a7c:     	cmovbq	%r14, %rbx
145530a80:     	subss	%xmm13, %xmm6
145530a85:     	addss	%xmm6, %xmm6
145530a89:     	movss	0x3e28c3(%rip), %xmm7   # 0x145913354
145530a91:     	addss	%xmm7, %xmm6
145530a95:     	movaps	%xmm6, %xmm0
145530a98:     	callq	0x14577327d <.text+0x577227d>
145530a9d:     	maxss	%xmm10, %xmm0
145530aa2:     	cvttss2si	%xmm0, %rax
145530aa7:     	movq	%rax, %rcx
145530aaa:     	movaps	%xmm0, %xmm1
145530aad:     	subss	0x3d672b(%rip), %xmm1   # 0x1459071e0
145530ab5:     	cvttss2si	%xmm1, %rdi
145530aba:     	sarq	$0x3f, %rcx
145530abe:     	andq	%rcx, %rdi
145530ac1:     	orq	%rax, %rdi
145530ac4:     	xorl	%r15d, %r15d
145530ac7:     	ucomiss	%xmm10, %xmm0
145530acb:     	cmovbq	%r15, %rdi
145530acf:     	ucomiss	0x3d670e(%rip), %xmm0   # 0x1459071e4
145530ad6:     	movq	$-0x1, %r13
145530add:     	cmovaq	%r13, %rdi
145530ae1:     	movshdup	%xmm14, %xmm0           # xmm0 = xmm14[1,1,3,3]
145530ae6:     	movshdup	0x30(%rsp), %xmm4       # xmm4 = mem[1,1,3,3]
145530aec:     	movaps	%xmm4, %xmm1
145530aef:     	minss	%xmm0, %xmm1
145530af3:     	movaps	%xmm1, %xmm2
145530af6:     	cmpunordss	%xmm1, %xmm2
145530afb:     	movaps	%xmm2, %xmm3
145530afe:     	andnps	%xmm1, %xmm3
145530b01:     	andps	%xmm4, %xmm2
145530b04:     	orps	%xmm3, %xmm2
145530b07:     	movshdup	%xmm9, %xmm1            # xmm1 = xmm9[1,1,3,3]
145530b0c:     	movaps	%xmm2, %xmm3
145530b0f:     	minss	%xmm1, %xmm3
145530b13:     	movaps	%xmm3, %xmm6
145530b16:     	cmpunordss	%xmm3, %xmm6
145530b1b:     	andps	%xmm6, %xmm2
145530b1e:     	andnps	%xmm3, %xmm6
145530b21:     	orps	%xmm2, %xmm6
145530b24:     	movaps	%xmm4, %xmm2
145530b27:     	maxss	%xmm0, %xmm2
145530b2b:     	movaps	%xmm2, %xmm3
145530b2e:     	cmpunordss	%xmm2, %xmm3
145530b33:     	movaps	%xmm3, %xmm0
145530b36:     	andnps	%xmm2, %xmm0
145530b39:     	movaps	%xmm4, 0x90(%rsp)
145530b41:     	andps	%xmm4, %xmm3
145530b44:     	orps	%xmm0, %xmm3
145530b47:     	movaps	%xmm3, %xmm2
145530b4a:     	maxss	%xmm1, %xmm2
145530b4e:     	movaps	%xmm2, %xmm0
145530b51:     	cmpunordss	%xmm2, %xmm0
145530b56:     	andps	%xmm0, %xmm3
145530b59:     	andnps	%xmm2, %xmm0
145530b5c:     	orps	%xmm3, %xmm0
145530b5f:     	subss	0x2c(%rsp), %xmm0
145530b65:     	addss	%xmm0, %xmm0
145530b69:     	addss	%xmm7, %xmm0
145530b6d:     	callq	0x145773265 <.text+0x5772265>
145530b72:     	ucomiss	%xmm0, %xmm10
145530b76:     	ja	0x145530bbc <.text+0x552fbbc>
145530b78:     	cvttss2si	%xmm0, %rax
145530b7d:     	movq	%rax, %rcx
145530b80:     	sarq	$0x3f, %rcx
145530b84:     	movaps	%xmm0, %xmm1
145530b87:     	subss	0x3d6651(%rip), %xmm1   # 0x1459071e0
145530b8f:     	cvttss2si	%xmm1, %rdx
145530b94:     	andq	%rcx, %rdx
145530b97:     	orq	%rax, %rdx
145530b9a:     	xorl	%r15d, %r15d
145530b9d:     	xorps	%xmm1, %xmm1
145530ba0:     	ucomiss	%xmm1, %xmm0
145530ba3:     	cmovaeq	%rdx, %r15
145530ba7:     	ucomiss	0x3d6636(%rip), %xmm0   # 0x1459071e4
145530bae:     	cmovaq	%r13, %r15
145530bb2:     	incq	%r15
145530bb5:     	cmpq	%r15, %r14
145530bb8:     	cmovbq	%r14, %r15
145530bbc:     	subss	0x2c(%rsp), %xmm6
145530bc2:     	addss	%xmm6, %xmm6
145530bc6:     	addss	0x3e2786(%rip), %xmm6   # 0x145913354
145530bce:     	movaps	%xmm6, %xmm0
145530bd1:     	callq	0x14577327d <.text+0x577227d>
145530bd6:     	xorps	%xmm1, %xmm1
145530bd9:     	maxss	%xmm1, %xmm0
145530bdd:     	cvttss2si	%xmm0, %rax
145530be2:     	movq	%rax, %rcx
145530be5:     	movaps	%xmm0, %xmm2
145530be8:     	subss	0x3d65f0(%rip), %xmm2   # 0x1459071e0
145530bf0:     	cvttss2si	%xmm2, %rdx
145530bf5:     	sarq	$0x3f, %rcx
145530bf9:     	andq	%rcx, %rdx
145530bfc:     	orq	%rax, %rdx
145530bff:     	xorl	%r12d, %r12d
145530c02:     	ucomiss	%xmm1, %xmm0
145530c05:     	cmovaeq	%rdx, %r12
145530c09:     	ucomiss	0x3d65d4(%rip), %xmm0   # 0x1459071e4
145530c10:     	cmovaq	%r13, %r12
145530c14:     	movq	%r15, 0x48(%rsp)
145530c19:     	cmpq	%r15, %r12
145530c1c:     	movaps	0x80(%rsp), %xmm2
145530c24:     	movaps	0x70(%rsp), %xmm3
145530c29:     	movaps	0x30(%rsp), %xmm4
145530c2e:     	jae	0x145530e0f <.text+0x552fe0f>
145530c34:     	cmpq	%rbx, %rdi
145530c37:     	jae	0x145530e0f <.text+0x552fe0f>
145530c3d:     	movsldup	%xmm15, %xmm6           # xmm6 = xmm15[0,0,2,2]
145530c42:     	movshdup	0x60(%rsp), %xmm14      # xmm14 = mem[1,1,3,3]
145530c49:     	movshdup	0x50(%rsp), %xmm15      # xmm15 = mem[1,1,3,3]
145530c50:     	movl	%r12d, %ebp
145530c53:     	imull	%r14d, %ebp
145530c57:     	addl	%edi, %ebp
145530c59:     	movss	0x3d6836(%rip), %xmm10  # 0x145907498
145530c62:     	movss	0x4b43b1(%rip), %xmm11  # 0x1459e501c
145530c6b:     	movss	0x7af1ec(%rip), %xmm12  # 0x145cdfe60
145530c74:     	movq	%r14, 0x40(%rsp)
145530c79:     	jmp	0x145530c92 <.text+0x552fc92>
145530c7b:     	nopl	(%rax,%rax)
145530c80:     	incq	%r12
145530c83:     	addl	0x40(%rsp), %ebp
145530c87:     	cmpq	0x48(%rsp), %r12
145530c8c:     	je	0x145530e0f <.text+0x552fe0f>
145530c92:     	testq	%r12, %r12
145530c95:     	js	0x145530cb0 <.text+0x552fcb0>
145530c97:     	xorps	%xmm7, %xmm7
145530c9a:     	cvtsi2ss	%r12, %xmm7
145530c9f:     	jmp	0x145530ccb <.text+0x552fccb>
145530ca1:     	nopw	%cs:(%rax,%rax)
145530cb0:     	movq	%r12, %rax
145530cb3:     	shrq	%rax
145530cb6:     	movl	%r12d, %ecx
145530cb9:     	andl	$0x1, %ecx
145530cbc:     	orq	%rax, %rcx
145530cbf:     	xorps	%xmm7, %xmm7
145530cc2:     	cvtsi2ss	%rcx, %xmm7
145530cc7:     	addss	%xmm7, %xmm7
145530ccb:     	movss	0x1b8(%rsp), %xmm5
145530cd4:     	addss	%xmm10, %xmm7
145530cd9:     	mulss	%xmm10, %xmm7
145530cde:     	addss	0x2c(%rsp), %xmm7
145530ce4:     	subss	0x90(%rsp), %xmm7
145530ced:     	movaps	0x50(%rsp), %xmm8
145530cf3:     	mulss	%xmm7, %xmm8
145530cf8:     	mulss	0x60(%rsp), %xmm7
145530cfe:     	movl	%ebp, %r13d
145530d01:     	movq	%rdi, %r14
145530d04:     	jmp	0x145530d35 <.text+0x552fd35>
145530d06:     	nopw	%cs:(%rax,%rax)
145530d10:     	movq	0x8(%rsi), %rax
145530d14:     	movl	%r13d, (%rax,%r15,8)
145530d18:     	movss	%xmm9, 0x4(%rax,%r15,8)
145530d1f:     	incq	%r15
145530d22:     	movq	%r15, 0x10(%rsi)
145530d26:     	incq	%r14
145530d29:     	incl	%r13d
145530d2c:     	cmpq	%r14, %rbx
145530d2f:     	je	0x145530c80 <.text+0x552fc80>
145530d35:     	testq	%r14, %r14
145530d38:     	js	0x145530d50 <.text+0x552fd50>
145530d3a:     	xorps	%xmm1, %xmm1
145530d3d:     	cvtsi2ss	%r14, %xmm1
145530d42:     	jmp	0x145530d6b <.text+0x552fd6b>
145530d44:     	nopw	%cs:(%rax,%rax)
145530d50:     	movq	%r14, %rax
145530d53:     	shrq	%rax
145530d56:     	movl	%r14d, %ecx
145530d59:     	andl	$0x1, %ecx
145530d5c:     	orq	%rax, %rcx
145530d5f:     	xorps	%xmm1, %xmm1
145530d62:     	cvtsi2ss	%rcx, %xmm1
145530d67:     	addss	%xmm1, %xmm1
145530d6b:     	addss	%xmm10, %xmm1
145530d70:     	mulss	%xmm10, %xmm1
145530d75:     	addss	%xmm13, %xmm1
145530d7a:     	subss	%xmm4, %xmm1
145530d7e:     	movaps	%xmm15, %xmm0
145530d82:     	mulss	%xmm1, %xmm0
145530d86:     	mulss	%xmm14, %xmm1
145530d8b:     	unpcklps	%xmm8, %xmm1            # xmm1 = xmm1[0],xmm8[0],xmm1[1],xmm8[1]
145530d8f:     	movlhps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0]
145530d92:     	shufps	$0xe2, %xmm7, %xmm0     # xmm0 = xmm0[2,0],xmm7[2,3]
145530d96:     	subps	%xmm1, %xmm0
145530d99:     	divps	%xmm6, %xmm0
145530d9c:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145530da0:     	ucomiss	%xmm1, %xmm11
145530da4:     	ja	0x145530d26 <.text+0x552fd26>
145530da6:     	ucomiss	%xmm0, %xmm11
145530daa:     	ja	0x145530d26 <.text+0x552fd26>
145530db0:     	addss	%xmm0, %xmm1
145530db4:     	ucomiss	%xmm12, %xmm1
145530db8:     	ja	0x145530d26 <.text+0x552fd26>
145530dbe:     	mulps	%xmm3, %xmm0
145530dc1:     	movshdup	%xmm0, %xmm9            # xmm9 = xmm0[1,1,3,3]
145530dc6:     	addss	%xmm2, %xmm9
145530dcb:     	addss	%xmm0, %xmm9
145530dd0:     	ucomiss	%xmm9, %xmm5
145530dd4:     	jb	0x145530d26 <.text+0x552fd26>
145530dda:     	movq	0x10(%rsi), %r15
145530dde:     	cmpq	(%rsi), %r15
145530de1:     	jne	0x145530d10 <.text+0x552fd10>
145530de7:     	movq	%rsi, %rcx
145530dea:     	callq	0x145780180 <.text+0x577f180>
145530def:     	movss	0x1b8(%rsp), %xmm5
145530df8:     	movaps	0x30(%rsp), %xmm4
145530dfd:     	movaps	0x70(%rsp), %xmm3
145530e02:     	movaps	0x80(%rsp), %xmm2
145530e0a:     	jmp	0x145530d10 <.text+0x552fd10>
145530e0f:     	movaps	0xa0(%rsp), %xmm6
145530e17:     	movaps	0xb0(%rsp), %xmm7
145530e1f:     	movaps	0xc0(%rsp), %xmm8
145530e28:     	movaps	0xd0(%rsp), %xmm9
145530e31:     	movaps	0xe0(%rsp), %xmm10
145530e3a:     	movaps	0xf0(%rsp), %xmm11
145530e43:     	movaps	0x100(%rsp), %xmm12
145530e4c:     	movaps	0x110(%rsp), %xmm13
145530e55:     	movaps	0x120(%rsp), %xmm14
145530e5e:     	movaps	0x130(%rsp), %xmm15
145530e67:     	addq	$0x148, %rsp            # imm = 0x148
145530e6e:     	popq	%rbx
145530e6f:     	popq	%rbp
145530e70:     	popq	%rdi
145530e71:     	popq	%rsi
145530e72:     	popq	%r12
145530e74:     	popq	%r13
145530e76:     	popq	%r14
145530e78:     	popq	%r15
145530e7a:     	retq
