
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14070eb40:     	pushq	%r15
14070eb42:     	pushq	%r14
14070eb44:     	pushq	%r13
14070eb46:     	pushq	%r12
14070eb48:     	pushq	%rsi
14070eb49:     	pushq	%rdi
14070eb4a:     	pushq	%rbp
14070eb4b:     	pushq	%rbx
14070eb4c:     	subq	$0xf8, %rsp
14070eb53:     	movaps	%xmm15, 0xe0(%rsp)
14070eb5c:     	movaps	%xmm14, 0xd0(%rsp)
14070eb65:     	movaps	%xmm13, 0xc0(%rsp)
14070eb6e:     	movdqa	%xmm12, 0xb0(%rsp)
14070eb78:     	movaps	%xmm11, 0xa0(%rsp)
14070eb81:     	movaps	%xmm10, 0x90(%rsp)
14070eb8a:     	movaps	%xmm9, 0x80(%rsp)
14070eb93:     	movaps	%xmm8, 0x70(%rsp)
14070eb99:     	movaps	%xmm7, 0x60(%rsp)
14070eb9e:     	movaps	%xmm6, 0x50(%rsp)
14070eba3:     	movq	0x168(%rsp), %r14
14070ebab:     	movq	0x160(%rsp), %rax
14070ebb3:     	movq	(%rdx), %rsi
14070ebb6:     	movq	0x8(%rdx), %rdi
14070ebba:     	movl	0x14(%rdx), %ebx
14070ebbd:     	movq	(%r8), %rcx
14070ebc0:     	movq	(%r9), %rdx
14070ebc3:     	movq	(%rax), %r15
14070ebc6:     	movl	0x729097c(%rip), %eax   # 0x14799f548
14070ebcc:     	testl	%eax, %eax
14070ebce:     	jne	0x14070f368 <.text+0x70e368>
14070ebd4:     	movb	$0x1, %r8b
14070ebd7:     	xorl	%eax, %eax
14070ebd9:     	lock
14070ebda:     	cmpxchgb	%r8b, 0x7290936(%rip)   # 0x14799f518
14070ebe2:     	jne	0x14070f397 <.text+0x70e397>
14070ebe8:     	movq	0x72d81b9(%rip), %r12   # 0x1479e6da8
14070ebef:     	movq	(%r12), %rax
14070ebf3:     	shlq	%rax
14070ebf6:     	testq	%rax, %rax
14070ebf9:     	jne	0x14070f3b7 <.text+0x70e3b7>
14070ebff:     	xorl	%eax, %eax
14070ec01:     	movzbl	0x7290910(%rip), %r8d   # 0x14799f519
14070ec09:     	cmpl	$0x1, 0x729090c(%rip)   # 0x14799f51c
14070ec10:     	jne	0x14070f3df <.text+0x70e3df>
14070ec16:     	cmpb	$0x0, 0x7290928(%rip)   # 0x14799f545
14070ec1d:     	je	0x14070f3df <.text+0x70e3df>
14070ec23:     	movss	0x72908fc(%rip), %xmm12 # 0x14799f528
14070ec2c:     	movss	0x72908fc(%rip), %xmm6  # 0x14799f530
14070ec34:     	movss	0x72908ef(%rip), %xmm13 # 0x14799f52c
14070ec3d:     	movss	0x72908ee(%rip), %xmm10 # 0x14799f534
14070ec46:     	movss	0x72908e9(%rip), %xmm11 # 0x14799f538
14070ec4f:     	movss	0x72908e4(%rip), %xmm9  # 0x14799f53c
14070ec58:     	movss	0x72908df(%rip), %xmm8  # 0x14799f540
14070ec61:     	testb	%al, %al
14070ec63:     	jne	0x14070ec75 <.text+0x70dc75>
14070ec65:     	movq	(%r12), %rax
14070ec69:     	shlq	%rax
14070ec6c:     	testq	%rax, %rax
14070ec6f:     	jne	0x14070f51f <.text+0x70e51f>
14070ec75:     	xorl	%eax, %eax
14070ec77:     	xchgb	%al, 0x729089b(%rip)    # 0x14799f518
14070ec7d:     	cmpb	$0x2, %al
14070ec7f:     	je	0x14070f4d7 <.text+0x70e4d7>
14070ec85:     	xorps	%xmm7, %xmm7
14070ec88:     	xorps	%xmm1, %xmm1
14070ec8b:     	testq	%rcx, %rcx
14070ec8e:     	je	0x14070ecdb <.text+0x70dcdb>
14070ec90:     	movaps	0x51ea2b9(%rip), %xmm0  # 0x1458f8f50
14070ec97:     	movaps	%xmm12, %xmm1
14070ec9b:     	xorps	%xmm0, %xmm1
14070ec9e:     	xorps	%xmm13, %xmm0
14070eca2:     	movss	%xmm0, 0x20(%rsp)
14070eca8:     	movss	%xmm6, 0x24(%rsp)
14070ecae:     	movss	%xmm1, 0x28(%rsp)
14070ecb4:     	leaq	0x20(%rsp), %r8
14070ecb9:     	callq	0x141716030 <.text+0x1715030>
14070ecbe:     	xorps	%xmm1, %xmm1
14070ecc1:     	testb	$0x1, %al
14070ecc3:     	je	0x14070ecdb <.text+0x70dcdb>
14070ecc5:     	addss	%xmm0, %xmm8
14070ecca:     	subss	%xmm6, %xmm8
14070eccf:     	xorps	%xmm0, %xmm0
14070ecd2:     	maxss	%xmm0, %xmm8
14070ecd7:     	movaps	%xmm8, %xmm1
14070ecdb:     	movss	(%r14), %xmm0
14070ece0:     	subss	%xmm0, %xmm1
14070ece4:     	movss	0x58(%r15), %xmm2
14070ecea:     	addss	%xmm2, %xmm2
14070ecee:     	movss	0x51dc789(%rip), %xmm8  # 0x1458eb480
14070ecf7:     	minss	%xmm8, %xmm2
14070ecfc:     	mulss	%xmm1, %xmm2
14070ed00:     	movaps	0x51ea248(%rip), %xmm14 # 0x1458f8f50
14070ed08:     	xorps	%xmm14, %xmm11
14070ed0c:     	unpcklps	%xmm9, %xmm11           # xmm11 = xmm11[0],xmm9[0],xmm11[1],xmm9[1]
14070ed10:     	xorps	%xmm14, %xmm10
14070ed14:     	addss	%xmm0, %xmm2
14070ed18:     	movss	%xmm2, (%r14)
14070ed1d:     	mulss	%xmm2, %xmm7
14070ed21:     	addss	%xmm2, %xmm6
14070ed25:     	movaps	%xmm7, %xmm9
14070ed29:     	subss	%xmm13, %xmm9
14070ed2e:     	subss	%xmm12, %xmm7
14070ed33:     	movaps	%xmm9, %xmm0
14070ed37:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
14070ed3a:     	subps	%xmm0, %xmm11
14070ed3e:     	subss	%xmm7, %xmm10
14070ed43:     	movlps	%xmm11, 0x30(%rsp)
14070ed49:     	movss	%xmm10, 0x38(%rsp)
14070ed50:     	leaq	0x20(%rsp), %rcx
14070ed55:     	leaq	0x30(%rsp), %rdx
14070ed5a:     	callq	0x144cf10f0 <.text+0x4cf00f0>
14070ed5f:     	movl	0x20(%rsp), %eax
14070ed63:     	testb	%al, %al
14070ed65:     	jne	0x14070ed70 <.text+0x70dd70>
14070ed67:     	movss	0x2c(%rsp), %xmm11
14070ed6e:     	jmp	0x14070ed79 <.text+0x70dd79>
14070ed70:     	movss	0x51dc783(%rip), %xmm11 # 0x1458eb4fc
14070ed79:     	movq	0x24(%rsp), %xmm0
14070ed7f:     	movd	%eax, %xmm1
14070ed83:     	pshufd	$0x0, %xmm1, %xmm10     # xmm10 = xmm1[0,0,0,0]
14070ed89:     	pslld	$0x1f, %xmm10
14070ed8f:     	psrad	$0x1f, %xmm10
14070ed95:     	pandn	%xmm0, %xmm10
14070ed9a:     	pshufd	$0xf5, %xmm10, %xmm13   # xmm13 = xmm10[1,1,3,3]
14070eda0:     	movdqa	%xmm10, %xmm12
14070eda5:     	pxor	%xmm14, %xmm12
14070edaa:     	movabsq	$0x3f80000000000000, %rax # imm = 0x3F80000000000000
14070edb4:     	movq	%rax, 0x40(%rsp)
14070edb9:     	movl	$0x0, 0x48(%rsp)
14070edc1:     	leaq	0x20(%rsp), %rcx
14070edc6:     	leaq	0x40(%rsp), %rdx
14070edcb:     	callq	0x144cf10f0 <.text+0x4cf00f0>
14070edd0:     	movq	0x24(%rsp), %xmm0
14070edd6:     	movd	0x20(%rsp), %xmm1
14070eddc:     	pshufd	$0x0, %xmm1, %xmm4      # xmm4 = xmm1[0,0,0,0]
14070ede1:     	pslld	$0x1f, %xmm4
14070ede6:     	psrad	$0x1f, %xmm4
14070edeb:     	movdqa	%xmm4, %xmm1
14070edef:     	pandn	%xmm0, %xmm1
14070edf3:     	movq	0x51e9f75(%rip), %xmm2  # 0x1458f8d70
14070edfb:     	pand	%xmm4, %xmm2
14070edff:     	por	%xmm1, %xmm2
14070ee03:     	pshufd	$0xf5, %xmm2, %xmm3     # xmm3 = xmm2[1,1,3,3]
14070ee08:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
14070ee0c:     	movss	0x2c(%rsp), %xmm1
14070ee12:     	movss	%xmm1, %xmm0            # xmm0 = xmm1[0],xmm0[1,2,3]
14070ee16:     	pandn	%xmm0, %xmm4
14070ee1a:     	movdqa	%xmm13, %xmm0
14070ee1f:     	mulss	%xmm4, %xmm0
14070ee23:     	movaps	%xmm11, %xmm1
14070ee27:     	mulss	%xmm3, %xmm1
14070ee2b:     	subss	%xmm1, %xmm0
14070ee2f:     	pshufd	$0xa0, %xmm10, %xmm1    # xmm1 = xmm10[0,0,2,2]
14070ee35:     	movss	%xmm11, %xmm1           # xmm1 = xmm11[0],xmm1[1,2,3]
14070ee3a:     	mulps	%xmm2, %xmm1
14070ee3d:     	movdqa	%xmm10, %xmm5
14070ee42:     	mulps	%xmm4, %xmm5
14070ee45:     	subps	%xmm5, %xmm1
14070ee48:     	movaps	%xmm0, %xmm5
14070ee4b:     	mulss	%xmm0, %xmm5
14070ee4f:     	movaps	%xmm1, %xmm15
14070ee53:     	mulps	%xmm1, %xmm15
14070ee57:     	addss	%xmm15, %xmm5
14070ee5c:     	movshdup	%xmm15, %xmm15          # xmm15 = xmm15[1,1,3,3]
14070ee61:     	addss	%xmm5, %xmm15
14070ee66:     	sqrtss	%xmm15, %xmm15
14070ee6b:     	movaps	%xmm8, %xmm5
14070ee6f:     	divss	%xmm15, %xmm5
14070ee74:     	movd	%xmm5, %eax
14070ee78:     	testl	%eax, %eax
14070ee7a:     	sets	%cl
14070ee7d:     	movl	%eax, %edx
14070ee7f:     	andl	$0x7fffffff, %edx       # imm = 0x7FFFFFFF
14070ee85:     	addl	$0xff800000, %edx       # imm = 0xFF800000
14070ee8b:     	cmpl	$0x7f000000, %edx       # imm = 0x7F000000
14070ee91:     	setae	%dl
14070ee94:     	orb	%cl, %dl
14070ee96:     	decl	%eax
14070ee98:     	cmpl	$0x7fffff, %eax         # imm = 0x7FFFFF
14070ee9d:     	setae	%al
14070eea0:     	testb	%dl, %al
14070eea2:     	jne	0x14070eeb1 <.text+0x70deb1>
14070eea4:     	mulss	%xmm5, %xmm0
14070eea8:     	movsldup	%xmm5, %xmm2            # xmm2 = xmm5[0,0,2,2]
14070eeac:     	mulps	%xmm2, %xmm1
14070eeaf:     	jmp	0x14070ef0a <.text+0x70df0a>
14070eeb1:     	movaps	%xmm4, %xmm0
14070eeb4:     	andps	%xmm14, %xmm0
14070eeb8:     	orps	0x5224c11(%rip), %xmm0  # 0x145933ad0
14070eebf:     	movaps	%xmm4, %xmm1
14070eec2:     	cmpunordss	%xmm4, %xmm1
14070eec7:     	movss	0x51dc5b5(%rip), %xmm5  # 0x1458eb484
14070eecf:     	andps	%xmm1, %xmm5
14070eed2:     	andnps	%xmm0, %xmm1
14070eed5:     	orps	%xmm5, %xmm1
14070eed8:     	addss	%xmm1, %xmm4
14070eedc:     	movss	0x51dc618(%rip), %xmm5  # 0x1458eb4fc
14070eee4:     	divss	%xmm4, %xmm5
14070eee8:     	movaps	%xmm2, %xmm0
14070eeeb:     	mulss	%xmm3, %xmm0
14070eeef:     	mulss	%xmm5, %xmm0
14070eef3:     	mulss	%xmm3, %xmm3
14070eef7:     	mulss	%xmm5, %xmm3
14070eefb:     	addss	%xmm1, %xmm3
14070eeff:     	xorps	%xmm14, %xmm2
14070ef03:     	movss	%xmm3, %xmm2            # xmm2 = xmm3[0],xmm2[1,2,3]
14070ef07:     	movaps	%xmm2, %xmm1
14070ef0a:     	movaps	%xmm11, %xmm2
14070ef0e:     	mulss	%xmm1, %xmm2
14070ef12:     	movshdup	%xmm1, %xmm4            # xmm4 = xmm1[1,1,3,3]
14070ef16:     	movdqa	%xmm13, %xmm3
14070ef1b:     	mulss	%xmm4, %xmm3
14070ef1f:     	subss	%xmm3, %xmm2
14070ef23:     	mulss	%xmm10, %xmm4
14070ef28:     	movaps	%xmm11, %xmm3
14070ef2c:     	mulss	%xmm0, %xmm3
14070ef30:     	subss	%xmm3, %xmm4
14070ef34:     	movdqa	%xmm13, %xmm3
14070ef39:     	mulss	%xmm0, %xmm3
14070ef3d:     	movaps	%xmm10, %xmm5
14070ef41:     	mulss	%xmm1, %xmm5
14070ef45:     	subss	%xmm5, %xmm3
14070ef49:     	xorps	%xmm5, %xmm5
14070ef4c:     	ucomiss	%xmm5, %xmm11
14070ef50:     	jae	0x14070efb4 <.text+0x70dfb4>
14070ef52:     	addss	%xmm4, %xmm0
14070ef56:     	movaps	%xmm8, %xmm4
14070ef5a:     	subss	%xmm11, %xmm4
14070ef5f:     	ucomiss	%xmm0, %xmm5
14070ef62:     	jae	0x14070f004 <.text+0x70e004>
14070ef68:     	addss	%xmm0, %xmm4
14070ef6c:     	xorps	%xmm5, %xmm5
14070ef6f:     	sqrtss	%xmm4, %xmm5
14070ef73:     	movss	0x51dc50d(%rip), %xmm0  # 0x1458eb488
14070ef7b:     	divss	%xmm5, %xmm0
14070ef7f:     	addss	%xmm13, %xmm3
14070ef84:     	shufps	$0xd4, %xmm1, %xmm2     # xmm2 = xmm2[0,1],xmm1[1,3]
14070ef88:     	shufps	$0xf2, %xmm1, %xmm2     # xmm2 = xmm2[2,0],xmm1[3,3]
14070ef8c:     	punpckldq	%xmm1, %xmm12   # xmm12 = xmm12[0],xmm1[0],xmm12[1],xmm1[1]
14070ef91:     	subps	%xmm2, %xmm12
14070ef95:     	movlhps	%xmm12, %xmm3           # xmm3 = xmm3[0],xmm12[0]
14070ef99:     	movaps	%xmm0, %xmm1
14070ef9c:     	shufps	$0xd4, %xmm12, %xmm1    # xmm1 = xmm1[0,1],xmm12[1,3]
14070efa1:     	shufps	$0x28, %xmm1, %xmm3     # xmm3 = xmm3[0,2],xmm1[2,0]
14070efa5:     	unpcklps	%xmm4, %xmm0            # xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1]
14070efa8:     	shufps	$0x40, %xmm0, %xmm0     # xmm0 = xmm0[0,0,0,1]
14070efac:     	mulps	%xmm3, %xmm0
14070efaf:     	jmp	0x14070f080 <.text+0x70e080>
14070efb4:     	subss	%xmm0, %xmm4
14070efb8:     	addss	0x51dc4bf(%rip), %xmm11 # 0x1458eb480
14070efc1:     	ucomiss	%xmm4, %xmm5
14070efc4:     	jae	0x14070f03e <.text+0x70e03e>
14070efc6:     	unpcklps	%xmm1, %xmm10           # xmm10 = xmm10[0],xmm1[0],xmm10[1],xmm1[1]
14070efca:     	unpcklps	%xmm11, %xmm1           # xmm1 = xmm1[0],xmm11[0],xmm1[1],xmm11[1]
14070efce:     	punpcklqdq	%xmm3, %xmm12   # xmm12 = xmm12[0],xmm3[0]
14070efd3:     	shufps	$0x24, %xmm12, %xmm1    # xmm1 = xmm1[0,1],xmm12[2,0]
14070efd8:     	movlhps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0]
14070efdb:     	shufps	$0xe2, %xmm10, %xmm4    # xmm4 = xmm4[2,0],xmm10[2,3]
14070efe0:     	addps	%xmm1, %xmm4
14070efe3:     	subps	%xmm10, %xmm1
14070efe7:     	movsd	%xmm4, %xmm1            # xmm1 = xmm4[0],xmm1[1]
14070efeb:     	movshdup	%xmm4, %xmm0            # xmm0 = xmm4[1,1,3,3]
14070efef:     	xorps	%xmm2, %xmm2
14070eff2:     	sqrtss	%xmm0, %xmm2
14070eff6:     	movss	0x51dc48a(%rip), %xmm0  # 0x1458eb488
14070effe:     	divss	%xmm2, %xmm0
14070f002:     	jmp	0x14070f079 <.text+0x70e079>
14070f004:     	shufps	$0xd4, %xmm1, %xmm3     # xmm3 = xmm3[0,1],xmm1[1,3]
14070f008:     	movlhps	%xmm1, %xmm4            # xmm4 = xmm4[0],xmm1[0]
14070f00b:     	shufps	$0x82, %xmm4, %xmm3     # xmm3 = xmm3[2,0],xmm4[0,2]
14070f00f:     	movlhps	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0]
14070f012:     	shufps	$0x24, %xmm2, %xmm10    # xmm10 = xmm10[0,1],xmm2[2,0]
14070f017:     	subps	%xmm10, %xmm3
14070f01b:     	movaps	%xmm3, %xmm0
14070f01e:     	unpckhpd	%xmm3, %xmm0            # xmm0 = xmm0[1],xmm3[1]
14070f022:     	xorps	%xmm1, %xmm1
14070f025:     	sqrtss	%xmm0, %xmm1
14070f029:     	movss	0x51dc457(%rip), %xmm0  # 0x1458eb488
14070f031:     	divss	%xmm1, %xmm0
14070f035:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
14070f039:     	mulps	%xmm3, %xmm0
14070f03c:     	jmp	0x14070f080 <.text+0x70e080>
14070f03e:     	movlhps	%xmm1, %xmm11           # xmm11 = xmm11[0],xmm1[0]
14070f042:     	shufps	$0xd4, %xmm1, %xmm3     # xmm3 = xmm3[0,1],xmm1[1,3]
14070f046:     	shufps	$0x28, %xmm3, %xmm11    # xmm11 = xmm11[0,2],xmm3[2,0]
14070f04b:     	movlhps	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0]
14070f04e:     	shufps	$0x42, %xmm10, %xmm2    # xmm2 = xmm2[2,0],xmm10[0,1]
14070f053:     	movaps	%xmm11, %xmm1
14070f057:     	subps	%xmm2, %xmm1
14070f05a:     	addps	%xmm11, %xmm2
14070f05e:     	xorps	%xmm3, %xmm3
14070f061:     	sqrtss	%xmm1, %xmm3
14070f065:     	shufps	$0xd8, %xmm2, %xmm1     # xmm1 = xmm1[0,2],xmm2[1,3]
14070f069:     	shufps	$0xd8, %xmm1, %xmm1     # xmm1 = xmm1[0,2,1,3]
14070f06d:     	movss	0x51dc413(%rip), %xmm0  # 0x1458eb488
14070f075:     	divss	%xmm3, %xmm0
14070f079:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
14070f07d:     	mulps	%xmm1, %xmm0
14070f080:     	movq	0xf8(%rsi), %rax
14070f087:     	movq	0x100(%rsi), %rcx
14070f08e:     	leaq	(%rax,%rcx,4), %rcx
14070f092:     	cmpb	$0x0, 0x108(%rsi)
14070f099:     	je	0x14070f1f1 <.text+0x70e1f1>
14070f09f:     	xorl	%edx, %edx
14070f0a1:     	movsd	0x51dc497(%rip), %xmm1  # 0x1458eb540
14070f0a9:     	xorl	%r9d, %r9d
14070f0ac:     	xorl	%r10d, %r10d
14070f0af:     	jmp	0x14070f0e8 <.text+0x70e0e8>
14070f0b1:     	nopw	%cs:(%rax,%rax)
14070f0c0:     	movl	%ebx, (%r8,%r11,4)
14070f0c4:     	movaps	%xmm0, (%r14)
14070f0c8:     	movss	%xmm9, 0x10(%r14)
14070f0ce:     	movss	%xmm6, 0x14(%r14)
14070f0d4:     	movss	%xmm7, 0x18(%r14)
14070f0da:     	movsd	%xmm1, 0x1c(%r14)
14070f0e0:     	movl	$0x3f800000, 0x24(%r14) # imm = 0x3F800000
14070f0e8:     	cmpl	%edx, %r10d
14070f0eb:     	jne	0x14070f143 <.text+0x70e143>
14070f0ed:     	nopl	(%rax)
14070f0f0:     	cmpq	%rcx, %rax
14070f0f3:     	je	0x14070f406 <.text+0x70e406>
14070f0f9:     	movl	(%rax), %edx
14070f0fb:     	addq	$0x4, %rax
14070f0ff:     	movq	0x1a8(%rdi), %r8
14070f106:     	leaq	(%rdx,%rdx,8), %r9
14070f10a:     	movq	0x10(%r8,%r9,8), %rdx
14070f10f:     	testq	%rdx, %rdx
14070f112:     	je	0x14070f0f0 <.text+0x70e0f0>
14070f114:     	leaq	(%r8,%r9,8), %r8
14070f118:     	movq	0x110(%rsi), %r9
14070f11f:     	movq	0x18(%r8), %r10
14070f123:     	movq	0x38(%r8), %r8
14070f127:     	movq	(%r8,%r9,8), %r8
14070f12b:     	notq	%r8
14070f12e:     	leaq	(%r8,%r8,2), %r8
14070f132:     	shlq	$0x4, %r8
14070f136:     	movq	0x10(%r10,%r8), %r9
14070f13b:     	movq	0x28(%r10,%r8), %r8
14070f140:     	xorl	%r10d, %r10d
14070f143:     	movl	%r10d, %r11d
14070f146:     	incl	%r10d
14070f149:     	leaq	(%r11,%r11,2), %r15
14070f14d:     	shlq	$0x4, %r15
14070f151:     	leaq	(%r9,%r15), %r14
14070f155:     	movss	0x10(%r9,%r15), %xmm2
14070f15c:     	ucomiss	%xmm9, %xmm2
14070f160:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f166:     	jp	0x14070f0c0 <.text+0x70e0c0>
14070f16c:     	movss	0x14(%r14), %xmm2
14070f172:     	ucomiss	%xmm6, %xmm2
14070f175:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f17b:     	jp	0x14070f0c0 <.text+0x70e0c0>
14070f181:     	movss	0x18(%r14), %xmm2
14070f187:     	ucomiss	%xmm7, %xmm2
14070f18a:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f190:     	jp	0x14070f0c0 <.text+0x70e0c0>
14070f196:     	movaps	(%r14), %xmm2
14070f19a:     	cmpeqps	%xmm0, %xmm2
14070f19e:     	movmskps	%xmm2, %ebp
14070f1a1:     	cmpl	$0xf, %ebp
14070f1a4:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f1aa:     	movss	0x1c(%r14), %xmm2
14070f1b0:     	ucomiss	%xmm8, %xmm2
14070f1b4:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f1ba:     	jp	0x14070f0c0 <.text+0x70e0c0>
14070f1c0:     	movss	0x20(%r14), %xmm2
14070f1c6:     	ucomiss	%xmm8, %xmm2
14070f1ca:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f1d0:     	jp	0x14070f0c0 <.text+0x70e0c0>
14070f1d6:     	movss	0x24(%r14), %xmm2
14070f1dc:     	ucomiss	%xmm8, %xmm2
14070f1e0:     	jne	0x14070f0c0 <.text+0x70e0c0>
14070f1e6:     	jnp	0x14070f0e8 <.text+0x70e0e8>
14070f1ec:     	jmp	0x14070f0c0 <.text+0x70e0c0>
14070f1f1:     	movl	$0x8, %r8d
14070f1f7:     	xorl	%edx, %edx
14070f1f9:     	movsd	0x51dc33f(%rip), %xmm1  # 0x1458eb540
14070f201:     	xorl	%r10d, %r10d
14070f204:     	xorl	%r11d, %r11d
14070f207:     	jmp	0x14070f238 <.text+0x70e238>
14070f209:     	nopl	(%rax)
14070f210:     	movl	%ebx, (%r9,%r14,4)
14070f214:     	movaps	%xmm0, (%r15)
14070f218:     	movss	%xmm9, 0x10(%r15)
14070f21e:     	movss	%xmm6, 0x14(%r15)
14070f224:     	movss	%xmm7, 0x18(%r15)
14070f22a:     	movsd	%xmm1, 0x1c(%r15)
14070f230:     	movl	$0x3f800000, 0x24(%r15) # imm = 0x3F800000
14070f238:     	cmpl	%edx, %r11d
14070f23b:     	jne	0x14070f2ae <.text+0x70e2ae>
14070f23d:     	nopl	(%rax)
14070f240:     	cmpq	%rcx, %rax
14070f243:     	je	0x14070f406 <.text+0x70e406>
14070f249:     	movl	(%rax), %edx
14070f24b:     	addq	$0x4, %rax
14070f24f:     	movq	0x108(%rdi), %r8
14070f256:     	leaq	(%rdx,%rdx,4), %r9
14070f25a:     	shlq	$0x5, %r9
14070f25e:     	movq	0x58(%r8,%r9), %rdx
14070f263:     	testq	%rdx, %rdx
14070f266:     	je	0x14070f240 <.text+0x70e240>
14070f268:     	addq	%r9, %r8
14070f26b:     	movl	0x94(%r8), %r9d
14070f272:     	movq	0x1a8(%rdi), %r10
14070f279:     	leaq	(%r9,%r9,8), %r9
14070f27d:     	movq	0x110(%rsi), %r11
14070f284:     	movq	0x18(%r10,%r9,8), %r14
14070f289:     	movq	0x38(%r10,%r9,8), %r9
14070f28e:     	movq	(%r9,%r11,8), %r9
14070f292:     	notq	%r9
14070f295:     	leaq	(%r9,%r9,2), %r9
14070f299:     	shlq	$0x4, %r9
14070f29d:     	movq	0x10(%r14,%r9), %r10
14070f2a2:     	movq	0x28(%r14,%r9), %r9
14070f2a7:     	movq	0x50(%r8), %r8
14070f2ab:     	xorl	%r11d, %r11d
14070f2ae:     	movl	%r11d, %r14d
14070f2b1:     	shlq	$0x4, %r14
14070f2b5:     	incl	%r11d
14070f2b8:     	movl	0x8(%r8,%r14), %r14d
14070f2bd:     	notl	%r14d
14070f2c0:     	leaq	(%r14,%r14,2), %r12
14070f2c4:     	shlq	$0x4, %r12
14070f2c8:     	leaq	(%r10,%r12), %r15
14070f2cc:     	movss	0x10(%r10,%r12), %xmm2
14070f2d3:     	ucomiss	%xmm9, %xmm2
14070f2d7:     	jne	0x14070f210 <.text+0x70e210>
14070f2dd:     	jp	0x14070f210 <.text+0x70e210>
14070f2e3:     	movss	0x14(%r15), %xmm2
14070f2e9:     	ucomiss	%xmm6, %xmm2
14070f2ec:     	jne	0x14070f210 <.text+0x70e210>
14070f2f2:     	jp	0x14070f210 <.text+0x70e210>
14070f2f8:     	movss	0x18(%r15), %xmm2
14070f2fe:     	ucomiss	%xmm7, %xmm2
14070f301:     	jne	0x14070f210 <.text+0x70e210>
14070f307:     	jp	0x14070f210 <.text+0x70e210>
14070f30d:     	movaps	(%r15), %xmm2
14070f311:     	cmpeqps	%xmm0, %xmm2
14070f315:     	movmskps	%xmm2, %ebp
14070f318:     	cmpl	$0xf, %ebp
14070f31b:     	jne	0x14070f210 <.text+0x70e210>
14070f321:     	movss	0x1c(%r15), %xmm2
14070f327:     	ucomiss	%xmm8, %xmm2
14070f32b:     	jne	0x14070f210 <.text+0x70e210>
14070f331:     	jp	0x14070f210 <.text+0x70e210>
14070f337:     	movss	0x20(%r15), %xmm2
14070f33d:     	ucomiss	%xmm8, %xmm2
14070f341:     	jne	0x14070f210 <.text+0x70e210>
14070f347:     	jp	0x14070f210 <.text+0x70e210>
14070f34d:     	movss	0x24(%r15), %xmm2
14070f353:     	ucomiss	%xmm8, %xmm2
14070f357:     	jne	0x14070f210 <.text+0x70e210>
14070f35d:     	jnp	0x14070f238 <.text+0x70e238>
14070f363:     	jmp	0x14070f210 <.text+0x70e210>
14070f368:     	leaq	0x72901a9(%rip), %rax   # 0x14799f518
14070f36f:     	movq	%rcx, %r12
14070f372:     	movq	%rax, %rcx
14070f375:     	movq	%rdx, %r13
14070f378:     	callq	0x145762bb1 <.text+0x5761bb1>
14070f37d:     	movq	%r13, %rdx
14070f380:     	movq	%r12, %rcx
14070f383:     	movb	$0x1, %r8b
14070f386:     	xorl	%eax, %eax
14070f388:     	lock
14070f389:     	cmpxchgb	%r8b, 0x7290187(%rip)   # 0x14799f518
14070f391:     	je	0x14070ebe8 <.text+0x70dbe8>
14070f397:     	leaq	0x729017a(%rip), %rax   # 0x14799f518
14070f39e:     	movq	%rcx, %r12
14070f3a1:     	movq	%rax, %rcx
14070f3a4:     	movq	%rdx, %r13
14070f3a7:     	callq	0x1458e58c0 <.text+0x58e48c0>
14070f3ac:     	movq	%r13, %rdx
14070f3af:     	movq	%r12, %rcx
14070f3b2:     	jmp	0x14070ebe8 <.text+0x70dbe8>
14070f3b7:     	movq	%rcx, %r13
14070f3ba:     	movq	%rdx, %rbp
14070f3bd:     	callq	0x1458e6650 <.text+0x58e5650>
14070f3c2:     	movq	%rbp, %rdx
14070f3c5:     	movq	%r13, %rcx
14070f3c8:     	xorb	$0x1, %al
14070f3ca:     	movzbl	0x7290147(%rip), %r8d   # 0x14799f519
14070f3d2:     	cmpl	$0x1, 0x7290143(%rip)   # 0x14799f51c
14070f3d9:     	je	0x14070ec16 <.text+0x70dc16>
14070f3df:     	movl	$0x0, (%r14)
14070f3e6:     	testb	%al, %al
14070f3e8:     	jne	0x14070f3fa <.text+0x70e3fa>
14070f3ea:     	movq	(%r12), %rax
14070f3ee:     	shlq	%rax
14070f3f1:     	testq	%rax, %rax
14070f3f4:     	jne	0x14070f506 <.text+0x70e506>
14070f3fa:     	xorl	%eax, %eax
14070f3fc:     	xchgb	%al, 0x7290116(%rip)    # 0x14799f518
14070f402:     	cmpb	$0x2, %al
14070f404:     	je	0x14070f469 <.text+0x70e469>
14070f406:     	movaps	0x50(%rsp), %xmm6
14070f40b:     	movaps	0x60(%rsp), %xmm7
14070f410:     	movaps	0x70(%rsp), %xmm8
14070f416:     	movaps	0x80(%rsp), %xmm9
14070f41f:     	movaps	0x90(%rsp), %xmm10
14070f428:     	movaps	0xa0(%rsp), %xmm11
14070f431:     	movaps	0xb0(%rsp), %xmm12
14070f43a:     	movaps	0xc0(%rsp), %xmm13
14070f443:     	movaps	0xd0(%rsp), %xmm14
14070f44c:     	movaps	0xe0(%rsp), %xmm15
14070f455:     	addq	$0xf8, %rsp
14070f45c:     	popq	%rbx
14070f45d:     	popq	%rbp
14070f45e:     	popq	%rdi
14070f45f:     	popq	%rsi
14070f460:     	popq	%r12
14070f462:     	popq	%r13
14070f464:     	popq	%r14
14070f466:     	popq	%r15
14070f468:     	retq
14070f469:     	leaq	0x72900a8(%rip), %rcx   # 0x14799f518
14070f470:     	movaps	0x50(%rsp), %xmm6
14070f475:     	movaps	0x60(%rsp), %xmm7
14070f47a:     	movaps	0x70(%rsp), %xmm8
14070f480:     	movaps	0x80(%rsp), %xmm9
14070f489:     	movaps	0x90(%rsp), %xmm10
14070f492:     	movaps	0xa0(%rsp), %xmm11
14070f49b:     	movaps	0xb0(%rsp), %xmm12
14070f4a4:     	movaps	0xc0(%rsp), %xmm13
14070f4ad:     	movaps	0xd0(%rsp), %xmm14
14070f4b6:     	movaps	0xe0(%rsp), %xmm15
14070f4bf:     	addq	$0xf8, %rsp
14070f4c6:     	popq	%rbx
14070f4c7:     	popq	%rbp
14070f4c8:     	popq	%rdi
14070f4c9:     	popq	%rsi
14070f4ca:     	popq	%r12
14070f4cc:     	popq	%r13
14070f4ce:     	popq	%r14
14070f4d0:     	popq	%r15
14070f4d2:     	jmp	0x1458e5980 <.text+0x58e4980>
14070f4d7:     	leaq	0x729003a(%rip), %rax   # 0x14799f518
14070f4de:     	movq	%rcx, %r12
14070f4e1:     	movq	%rax, %rcx
14070f4e4:     	movq	%rdx, %r13
14070f4e7:     	callq	0x1458e5980 <.text+0x58e4980>
14070f4ec:     	movq	%r13, %rdx
14070f4ef:     	movq	%r12, %rcx
14070f4f2:     	xorps	%xmm7, %xmm7
14070f4f5:     	xorps	%xmm1, %xmm1
14070f4f8:     	testq	%rcx, %rcx
14070f4fb:     	jne	0x14070ec90 <.text+0x70dc90>
14070f501:     	jmp	0x14070ecdb <.text+0x70dcdb>
14070f506:     	callq	0x1458e6650 <.text+0x58e5650>
14070f50b:     	testb	%al, %al
14070f50d:     	jne	0x14070f3fa <.text+0x70e3fa>
14070f513:     	movb	$0x1, 0x728ffff(%rip)   # 0x14799f519
14070f51a:     	jmp	0x14070f3fa <.text+0x70e3fa>
14070f51f:     	movq	%rcx, %r12
14070f522:     	movq	%rdx, %r13
14070f525:     	callq	0x1458e6650 <.text+0x58e5650>
14070f52a:     	movq	%r13, %rdx
14070f52d:     	movq	%r12, %rcx
14070f530:     	testb	%al, %al
14070f532:     	jne	0x14070ec75 <.text+0x70dc75>
14070f538:     	movb	$0x1, 0x728ffda(%rip)   # 0x14799f519
14070f53f:     	jmp	0x14070ec75 <.text+0x70dc75>
