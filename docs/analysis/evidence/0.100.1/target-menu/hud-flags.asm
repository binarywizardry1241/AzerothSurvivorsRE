
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140363920:     	pushq	%rbp
140363921:     	pushq	%r15
140363923:     	pushq	%r14
140363925:     	pushq	%r13
140363927:     	pushq	%r12
140363929:     	pushq	%rsi
14036392a:     	pushq	%rdi
14036392b:     	pushq	%rbx
14036392c:     	subq	$0x78, %rsp
140363930:     	leaq	0x70(%rsp), %rbp
140363935:     	movq	$-0x2, (%rbp)
14036393d:     	movq	%rdx, %rsi
140363940:     	movzbl	(%r8), %eax
140363944:     	movb	$0x1, (%r8)
140363948:     	cmpb	$0x1, %al
14036394a:     	je	0x140363a5f <.text+0x362a5f>
140363950:     	movq	$0x1, 0x20(%rsp)
140363959:     	leaq	0x56029d5(%rip), %rdx   # 0x145966335
140363960:     	leaq	0x5602a11(%rip), %rdi   # 0x145966378
140363967:     	movl	$0x8, %r8d
14036396d:     	movq	%rsi, %rcx
140363970:     	movq	%rdi, %r9
140363973:     	callq	0x14064b4e0 <.text+0x64a4e0>
140363978:     	movq	$0x1, 0x20(%rsp)
140363981:     	leaq	0x56029b5(%rip), %rdx   # 0x14596633d
140363988:     	movl	$0x9, %r8d
14036398e:     	movq	%rsi, %rcx
140363991:     	movq	%rdi, %r9
140363994:     	callq	0x14064b4e0 <.text+0x64a4e0>
140363999:     	movq	$0x1, 0x20(%rsp)
1403639a2:     	leaq	0x560299d(%rip), %rdx   # 0x145966346
1403639a9:     	movl	$0x8, %r8d
1403639af:     	movq	%rsi, %rcx
1403639b2:     	movq	%rdi, %r9
1403639b5:     	callq	0x14064b4e0 <.text+0x64a4e0>
1403639ba:     	movq	$0x1, 0x20(%rsp)
1403639c3:     	leaq	0x5602984(%rip), %rdx   # 0x14596634e
1403639ca:     	movl	$0x8, %r8d
1403639d0:     	movq	%rsi, %rcx
1403639d3:     	movq	%rdi, %r9
1403639d6:     	callq	0x14064b4e0 <.text+0x64a4e0>
1403639db:     	movq	$0x1, 0x20(%rsp)
1403639e4:     	leaq	0x560296b(%rip), %rdx   # 0x145966356
1403639eb:     	movl	$0xa, %r8d
1403639f1:     	movq	%rsi, %rcx
1403639f4:     	movq	%rdi, %r9
1403639f7:     	callq	0x14064b4e0 <.text+0x64a4e0>
1403639fc:     	movq	$0x1, 0x20(%rsp)
140363a05:     	leaq	0x5602954(%rip), %rdx   # 0x145966360
140363a0c:     	movl	$0x7, %r8d
140363a12:     	movq	%rsi, %rcx
140363a15:     	movq	%rdi, %r9
140363a18:     	callq	0x14064b4e0 <.text+0x64a4e0>
140363a1d:     	movq	$0x1, 0x20(%rsp)
140363a26:     	leaq	0x560293a(%rip), %rdx   # 0x145966367
140363a2d:     	movl	$0x8, %r8d
140363a33:     	movq	%rsi, %rcx
140363a36:     	movq	%rdi, %r9
140363a39:     	callq	0x14064b4e0 <.text+0x64a4e0>
140363a3e:     	movq	$0x1, 0x20(%rsp)
140363a47:     	leaq	0x5602921(%rip), %rdx   # 0x14596636f
140363a4e:     	movl	$0x9, %r8d
140363a54:     	movq	%rsi, %rcx
140363a57:     	movq	%rdi, %r9
140363a5a:     	callq	0x14064b4e0 <.text+0x64a4e0>
140363a5f:     	leaq	0x56028cf(%rip), %r8    # 0x145966335
140363a66:     	leaq	-0x30(%rbp), %rcx
140363a6a:     	movl	$0x8, %r9d
140363a70:     	movq	%rsi, %rdx
140363a73:     	callq	0x14064e700 <.text+0x64d700>
140363a78:     	movq	-0x30(%rbp), %rax
140363a7c:     	movb	$0x1, %r14b
140363a7f:     	movb	$0x1, %r12b
140363a82:     	cmpq	$-0x1, %rax
140363a86:     	je	0x140363ac3 <.text+0x362ac3>
140363a88:     	movq	%rax, -0x8(%rbp)
140363a8c:     	movq	-0x28(%rbp), %rcx
140363a90:     	movq	-0x20(%rbp), %rdx
140363a94:     	movq	%rcx, -0x10(%rbp)
140363a98:     	callq	0x1400a4890 <.text+0xa3890>
140363a9d:     	nop
140363a9e:     	cmpq	$0x1, %rdx
140363aa2:     	jne	0x140363aab <.text+0x362aab>
140363aa4:     	cmpb	$0x30, (%rax)
140363aa7:     	setne	%r12b
140363aab:     	movq	-0x8(%rbp), %rdx
140363aaf:     	testq	%rdx, %rdx
140363ab2:     	je	0x140363ac3 <.text+0x362ac3>
140363ab4:     	movl	$0x1, %r8d
140363aba:     	movq	-0x10(%rbp), %rcx
140363abe:     	callq	0x1400021d0 <.text+0x11d0>
140363ac3:     	leaq	0x5602873(%rip), %r8    # 0x14596633d
140363aca:     	leaq	-0x30(%rbp), %rcx
140363ace:     	movl	$0x9, %r9d
140363ad4:     	movq	%rsi, %rdx
140363ad7:     	callq	0x14064e700 <.text+0x64d700>
140363adc:     	movq	-0x30(%rbp), %rax
140363ae0:     	cmpq	$-0x1, %rax
140363ae4:     	je	0x140363b21 <.text+0x362b21>
140363ae6:     	movq	%rax, -0x8(%rbp)
140363aea:     	movq	-0x28(%rbp), %rcx
140363aee:     	movq	-0x20(%rbp), %rdx
140363af2:     	movq	%rcx, -0x10(%rbp)
140363af6:     	callq	0x1400a4890 <.text+0xa3890>
140363afb:     	nop
140363afc:     	cmpq	$0x1, %rdx
140363b00:     	jne	0x140363b09 <.text+0x362b09>
140363b02:     	cmpb	$0x30, (%rax)
140363b05:     	setne	%r14b
140363b09:     	movq	-0x8(%rbp), %rdx
140363b0d:     	testq	%rdx, %rdx
140363b10:     	je	0x140363b21 <.text+0x362b21>
140363b12:     	movl	$0x1, %r8d
140363b18:     	movq	-0x10(%rbp), %rcx
140363b1c:     	callq	0x1400021d0 <.text+0x11d0>
140363b21:     	leaq	0x560281e(%rip), %r8    # 0x145966346
140363b28:     	leaq	-0x30(%rbp), %rcx
140363b2c:     	movl	$0x8, %r9d
140363b32:     	movq	%rsi, %rdx
140363b35:     	callq	0x14064e700 <.text+0x64d700>
140363b3a:     	movq	-0x30(%rbp), %rax
140363b3e:     	movb	$0x1, %dil
140363b41:     	movb	$0x1, %r15b
140363b44:     	cmpq	$-0x1, %rax
140363b48:     	je	0x140363b85 <.text+0x362b85>
140363b4a:     	movq	%rax, -0x8(%rbp)
140363b4e:     	movq	-0x28(%rbp), %rcx
140363b52:     	movq	-0x20(%rbp), %rdx
140363b56:     	movq	%rcx, -0x10(%rbp)
140363b5a:     	callq	0x1400a4890 <.text+0xa3890>
140363b5f:     	nop
140363b60:     	cmpq	$0x1, %rdx
140363b64:     	jne	0x140363b6d <.text+0x362b6d>
140363b66:     	cmpb	$0x30, (%rax)
140363b69:     	setne	%r15b
140363b6d:     	movq	-0x8(%rbp), %rdx
140363b71:     	testq	%rdx, %rdx
140363b74:     	je	0x140363b85 <.text+0x362b85>
140363b76:     	movl	$0x1, %r8d
140363b7c:     	movq	-0x10(%rbp), %rcx
140363b80:     	callq	0x1400021d0 <.text+0x11d0>
140363b85:     	leaq	0x56027c2(%rip), %r8    # 0x14596634e
140363b8c:     	leaq	-0x30(%rbp), %rcx
140363b90:     	movl	$0x8, %r9d
140363b96:     	movq	%rsi, %rdx
140363b99:     	callq	0x14064e700 <.text+0x64d700>
140363b9e:     	movq	-0x30(%rbp), %rax
140363ba2:     	cmpq	$-0x1, %rax
140363ba6:     	je	0x140363be3 <.text+0x362be3>
140363ba8:     	movq	%rax, -0x8(%rbp)
140363bac:     	movq	-0x28(%rbp), %rcx
140363bb0:     	movq	-0x20(%rbp), %rdx
140363bb4:     	movq	%rcx, -0x10(%rbp)
140363bb8:     	callq	0x1400a4890 <.text+0xa3890>
140363bbd:     	nop
140363bbe:     	cmpq	$0x1, %rdx
140363bc2:     	jne	0x140363bcb <.text+0x362bcb>
140363bc4:     	cmpb	$0x30, (%rax)
140363bc7:     	setne	%dil
140363bcb:     	movq	-0x8(%rbp), %rdx
140363bcf:     	testq	%rdx, %rdx
140363bd2:     	je	0x140363be3 <.text+0x362be3>
140363bd4:     	movl	$0x1, %r8d
140363bda:     	movq	-0x10(%rbp), %rcx
140363bde:     	callq	0x1400021d0 <.text+0x11d0>
140363be3:     	leaq	0x560276c(%rip), %r8    # 0x145966356
140363bea:     	leaq	-0x30(%rbp), %rcx
140363bee:     	movl	$0xa, %r9d
140363bf4:     	movq	%rsi, %rdx
140363bf7:     	callq	0x14064e700 <.text+0x64d700>
140363bfc:     	movq	-0x30(%rbp), %rax
140363c00:     	movb	$0x1, %r13b
140363c03:     	movb	$0x1, %bl
140363c05:     	cmpq	$-0x1, %rax
140363c09:     	je	0x140363c45 <.text+0x362c45>
140363c0b:     	movq	%rax, -0x8(%rbp)
140363c0f:     	movq	-0x28(%rbp), %rcx
140363c13:     	movq	-0x20(%rbp), %rdx
140363c17:     	movq	%rcx, -0x10(%rbp)
140363c1b:     	callq	0x1400a4890 <.text+0xa3890>
140363c20:     	nop
140363c21:     	cmpq	$0x1, %rdx
140363c25:     	jne	0x140363c2d <.text+0x362c2d>
140363c27:     	cmpb	$0x30, (%rax)
140363c2a:     	setne	%bl
140363c2d:     	movq	-0x8(%rbp), %rdx
140363c31:     	testq	%rdx, %rdx
140363c34:     	je	0x140363c45 <.text+0x362c45>
140363c36:     	movl	$0x1, %r8d
140363c3c:     	movq	-0x10(%rbp), %rcx
140363c40:     	callq	0x1400021d0 <.text+0x11d0>
140363c45:     	leaq	0x5602714(%rip), %r8    # 0x145966360
140363c4c:     	leaq	-0x30(%rbp), %rcx
140363c50:     	movl	$0x7, %r9d
140363c56:     	movq	%rsi, %rdx
140363c59:     	callq	0x14064e700 <.text+0x64d700>
140363c5e:     	movq	-0x30(%rbp), %rax
140363c62:     	cmpq	$-0x1, %rax
140363c66:     	je	0x140363ca3 <.text+0x362ca3>
140363c68:     	movq	%rax, -0x8(%rbp)
140363c6c:     	movq	-0x28(%rbp), %rcx
140363c70:     	movq	-0x20(%rbp), %rdx
140363c74:     	movq	%rcx, -0x10(%rbp)
140363c78:     	callq	0x1400a4890 <.text+0xa3890>
140363c7d:     	nop
140363c7e:     	cmpq	$0x1, %rdx
140363c82:     	jne	0x140363c8b <.text+0x362c8b>
140363c84:     	cmpb	$0x30, (%rax)
140363c87:     	setne	%r13b
140363c8b:     	movq	-0x8(%rbp), %rdx
140363c8f:     	testq	%rdx, %rdx
140363c92:     	je	0x140363ca3 <.text+0x362ca3>
140363c94:     	movl	$0x1, %r8d
140363c9a:     	movq	-0x10(%rbp), %rcx
140363c9e:     	callq	0x1400021d0 <.text+0x11d0>
140363ca3:     	leaq	0x56026bd(%rip), %r8    # 0x145966367
140363caa:     	leaq	-0x30(%rbp), %rcx
140363cae:     	movl	$0x8, %r9d
140363cb4:     	movq	%rsi, %rdx
140363cb7:     	callq	0x14064e700 <.text+0x64d700>
140363cbc:     	movq	-0x30(%rbp), %rax
140363cc0:     	movb	$0x1, -0x10(%rbp)
140363cc4:     	movb	$0x1, -0x8(%rbp)
140363cc8:     	cmpq	$-0x1, %rax
140363ccc:     	je	0x140363d0d <.text+0x362d0d>
140363cce:     	movq	%rax, -0x38(%rbp)
140363cd2:     	movq	-0x28(%rbp), %rcx
140363cd6:     	movq	-0x20(%rbp), %rdx
140363cda:     	movq	%rcx, -0x40(%rbp)
140363cde:     	callq	0x1400a4890 <.text+0xa3890>
140363ce3:     	nop
140363ce4:     	movb	$0x1, %cl
140363ce6:     	cmpq	$0x1, %rdx
140363cea:     	jne	0x140363cf2 <.text+0x362cf2>
140363cec:     	cmpb	$0x30, (%rax)
140363cef:     	setne	%cl
140363cf2:     	movb	%cl, -0x8(%rbp)
140363cf5:     	movq	-0x38(%rbp), %rdx
140363cf9:     	testq	%rdx, %rdx
140363cfc:     	je	0x140363d0d <.text+0x362d0d>
140363cfe:     	movl	$0x1, %r8d
140363d04:     	movq	-0x40(%rbp), %rcx
140363d08:     	callq	0x1400021d0 <.text+0x11d0>
140363d0d:     	leaq	0x560265b(%rip), %r8    # 0x14596636f
140363d14:     	leaq	-0x30(%rbp), %rcx
140363d18:     	movl	$0x9, %r9d
140363d1e:     	movq	%rsi, %rdx
140363d21:     	callq	0x14064e700 <.text+0x64d700>
140363d26:     	movq	-0x30(%rbp), %rax
140363d2a:     	cmpq	$-0x1, %rax
140363d2e:     	je	0x140363d6f <.text+0x362d6f>
140363d30:     	movq	%rax, -0x38(%rbp)
140363d34:     	movq	-0x28(%rbp), %rcx
140363d38:     	movq	-0x20(%rbp), %rdx
140363d3c:     	movq	%rcx, -0x40(%rbp)
140363d40:     	callq	0x1400a4890 <.text+0xa3890>
140363d45:     	nop
140363d46:     	movb	$0x1, %cl
140363d48:     	cmpq	$0x1, %rdx
140363d4c:     	jne	0x140363d54 <.text+0x362d54>
140363d4e:     	cmpb	$0x30, (%rax)
140363d51:     	setne	%cl
140363d54:     	movb	%cl, -0x10(%rbp)
140363d57:     	movq	-0x38(%rbp), %rdx
140363d5b:     	testq	%rdx, %rdx
140363d5e:     	je	0x140363d6f <.text+0x362d6f>
140363d60:     	movl	$0x1, %r8d
140363d66:     	movq	-0x40(%rbp), %rcx
140363d6a:     	callq	0x1400021d0 <.text+0x11d0>
140363d6f:     	movb	%r13b, -0x38(%rbp)
140363d73:     	cmpq	$0x0, 0x90(%rsi)
140363d7b:     	je	0x140363fe0 <.text+0x362fe0>
140363d81:     	movq	0x78(%rsi), %rax
140363d85:     	movq	0x80(%rsi), %rcx
140363d8c:     	movabsq	$0x19efe694c123e2fa, %rdx # imm = 0x19EFE694C123E2FA
140363d96:     	xorl	%r8d, %r8d
140363d99:     	movdqa	0x55e426f(%rip), %xmm0  # 0x145948010
140363da1:     	pcmpeqd	%xmm2, %xmm2
140363da5:     	movdqa	0x55e4273(%rip), %xmm1  # 0x145948020
140363dad:     	andq	%rcx, %rdx
140363db0:     	movdqu	(%rax,%rdx), %xmm3
140363db5:     	movdqa	%xmm3, %xmm4
140363db9:     	pcmpeqb	%xmm0, %xmm4
140363dbd:     	pmovmskb	%xmm4, %r9d
140363dc2:     	testl	%r9d, %r9d
140363dc5:     	je	0x140363e00 <.text+0x362e00>
140363dc7:     	tzcntl	%r9d, %r10d
140363dcc:     	addq	%rdx, %r10
140363dcf:     	andq	%rcx, %r10
140363dd2:     	negq	%r10
140363dd5:     	leaq	(%r10,%r10,2), %r10
140363dd9:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140363de0:     	pcmpeqb	%xmm1, %xmm4
140363de4:     	pmovmskb	%xmm4, %r11d
140363de9:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140363df0:     	je	0x140363e1f <.text+0x362e1f>
140363df2:     	leal	-0x1(%r9), %r10d
140363df6:     	andw	%r9w, %r10w
140363dfa:     	movl	%r10d, %r9d
140363dfd:     	jne	0x140363dc7 <.text+0x362dc7>
140363dff:     	nop
140363e00:     	pcmpeqb	%xmm2, %xmm3
140363e04:     	pmovmskb	%xmm3, %r9d
140363e09:     	testl	%r9d, %r9d
140363e0c:     	jne	0x140363fe0 <.text+0x362fe0>
140363e12:     	addq	%r8, %rdx
140363e15:     	addq	$0x10, %rdx
140363e19:     	addq	$0x10, %r8
140363e1d:     	jmp	0x140363dad <.text+0x362dad>
140363e1f:     	leaq	(%rax,%r10,8), %rdx
140363e23:     	movq	-0x8(%rdx), %rdx
140363e27:     	movq	0x218(%rsi), %r13
140363e2e:     	cmpq	%r13, %rdx
140363e31:     	jae	0x140363fe0 <.text+0x362fe0>
140363e37:     	movq	0x210(%rsi), %r9
140363e3e:     	movq	(%r9,%rdx,8), %r10
140363e42:     	testq	%r10, %r10
140363e45:     	je	0x140363fe0 <.text+0x362fe0>
140363e4b:     	movq	0x1e0(%rsi), %rdx
140363e52:     	notq	%r10
140363e55:     	imulq	$0x38, %r10, %r10
140363e59:     	cmpb	$0x0, 0x30(%rdx,%r10)
140363e5f:     	je	0x140363fe0 <.text+0x362fe0>
140363e65:     	addq	%rdx, %r10
140363e68:     	movq	0x10(%r10), %r10
140363e6c:     	cmpb	%r12b, (%r10)
140363e6f:     	jne	0x140363eae <.text+0x362eae>
140363e71:     	cmpb	%r14b, 0x1(%r10)
140363e75:     	jne	0x140363eae <.text+0x362eae>
140363e77:     	cmpb	%r15b, 0x2(%r10)
140363e7b:     	jne	0x140363eae <.text+0x362eae>
140363e7d:     	cmpb	%dil, 0x3(%r10)
140363e81:     	jne	0x140363eae <.text+0x362eae>
140363e83:     	cmpb	%bl, 0x4(%r10)
140363e87:     	jne	0x140363eae <.text+0x362eae>
140363e89:     	movzbl	-0x38(%rbp), %r8d
140363e8e:     	cmpb	%r8b, 0x5(%r10)
140363e92:     	jne	0x140363eae <.text+0x362eae>
140363e94:     	movzbl	-0x8(%rbp), %r8d
140363e99:     	cmpb	%r8b, 0x6(%r10)
140363e9d:     	jne	0x140363eae <.text+0x362eae>
140363e9f:     	movzbl	-0x10(%rbp), %r8d
140363ea4:     	cmpb	%r8b, 0x7(%r10)
140363ea8:     	je	0x140363fcf <.text+0x362fcf>
140363eae:     	movb	%r15b, -0x11(%rbp)
140363eb2:     	movb	%r14b, -0x40(%rbp)
140363eb6:     	movabsq	$0x19efe694c123e2fa, %r10 # imm = 0x19EFE694C123E2FA
140363ec0:     	xorl	%r11d, %r11d
140363ec3:     	pcmpeqd	%xmm2, %xmm2
140363ec7:     	andq	%rcx, %r10
140363eca:     	movdqu	(%rax,%r10), %xmm3
140363ed0:     	movdqa	%xmm3, %xmm4
140363ed4:     	pcmpeqb	%xmm0, %xmm4
140363ed8:     	pmovmskb	%xmm4, %r15d
140363edd:     	testl	%r15d, %r15d
140363ee0:     	je	0x140363f20 <.text+0x362f20>
140363ee2:     	movl	%r12d, %r8d
140363ee5:     	tzcntl	%r15d, %r14d
140363eea:     	addq	%r10, %r14
140363eed:     	andq	%rcx, %r14
140363ef0:     	negq	%r14
140363ef3:     	leaq	(%r14,%r14,2), %r14
140363ef7:     	movdqu	-0x18(%rax,%r14,8), %xmm4
140363efe:     	pcmpeqb	%xmm1, %xmm4
140363f02:     	pmovmskb	%xmm4, %r12d
140363f07:     	cmpl	$0xffff, %r12d          # imm = 0xFFFF
140363f0e:     	je	0x140363f3f <.text+0x362f3f>
140363f10:     	leal	-0x1(%r15), %r14d
140363f14:     	andw	%r15w, %r14w
140363f18:     	movl	%r14d, %r15d
140363f1b:     	movl	%r8d, %r12d
140363f1e:     	jne	0x140363ee2 <.text+0x362ee2>
140363f20:     	pcmpeqb	%xmm2, %xmm3
140363f24:     	pmovmskb	%xmm3, %r14d
140363f29:     	testl	%r14d, %r14d
140363f2c:     	jne	0x14036400c <.text+0x36300c>
140363f32:     	addq	%r11, %r10
140363f35:     	addq	$0x10, %r10
140363f39:     	addq	$0x10, %r11
140363f3d:     	jmp	0x140363ec7 <.text+0x362ec7>
140363f3f:     	leaq	(%rax,%r14,8), %rax
140363f43:     	movq	-0x8(%rax), %rax
140363f47:     	cmpq	%r13, %rax
140363f4a:     	jae	0x14036400c <.text+0x36300c>
140363f50:     	movq	(%r9,%rax,8), %rax
140363f54:     	testq	%rax, %rax
140363f57:     	je	0x14036400c <.text+0x36300c>
140363f5d:     	notq	%rax
140363f60:     	imulq	$0x38, %rax, %rax
140363f64:     	cmpb	$0x0, 0x30(%rdx,%rax)
140363f69:     	je	0x14036400c <.text+0x36300c>
140363f6f:     	addq	%rax, %rdx
140363f72:     	movq	0x10(%rdx), %rax
140363f76:     	movl	0x5b0(%rsi), %ecx
140363f7c:     	movl	%ecx, 0x2c(%rdx)
140363f7f:     	movzbl	-0x10(%rbp), %ecx
140363f83:     	shlq	$0x38, %rcx
140363f87:     	movzbl	-0x8(%rbp), %edx
140363f8b:     	shlq	$0x30, %rdx
140363f8f:     	orq	%rcx, %rdx
140363f92:     	movzbl	-0x38(%rbp), %ecx
140363f96:     	shlq	$0x28, %rcx
140363f9a:     	orq	%rdx, %rcx
140363f9d:     	movzbl	%bl, %edx
140363fa0:     	shlq	$0x20, %rdx
140363fa4:     	orq	%rcx, %rdx
140363fa7:     	movzbl	%dil, %ecx
140363fab:     	shll	$0x18, %ecx
140363fae:     	orq	%rdx, %rcx
140363fb1:     	movzbl	-0x11(%rbp), %edx
140363fb5:     	shll	$0x10, %edx
140363fb8:     	orq	%rcx, %rdx
140363fbb:     	movzbl	-0x40(%rbp), %ecx
140363fbf:     	shll	$0x8, %ecx
140363fc2:     	orq	%rdx, %rcx
140363fc5:     	movzbl	%r8b, %edx
140363fc9:     	orq	%rcx, %rdx
140363fcc:     	movq	%rdx, (%rax)
140363fcf:     	addq	$0x78, %rsp
140363fd3:     	popq	%rbx
140363fd4:     	popq	%rdi
140363fd5:     	popq	%rsi
140363fd6:     	popq	%r12
140363fd8:     	popq	%r13
140363fda:     	popq	%r14
140363fdc:     	popq	%r15
140363fde:     	popq	%rbp
140363fdf:     	retq
140363fe0:     	leaq	-0x12(%rbp), %rax
140363fe4:     	movq	%rax, -0x30(%rbp)
140363fe8:     	leaq	0x4ca7851(%rip), %rax   # 0x14500b840 <.text+0x500a840>
140363fef:     	movq	%rax, -0x28(%rbp)
140363ff3:     	leaq	0x55f9167(%rip), %rcx   # 0x14595d161
140363ffa:     	leaq	0x56023af(%rip), %r8    # 0x1459663b0
140364001:     	leaq	-0x30(%rbp), %rdx
140364005:     	callq	0x145903d10 <.text+0x5902d10>
14036400a:     	ud2
14036400c:     	leaq	-0x12(%rbp), %rax
140364010:     	movq	%rax, -0x30(%rbp)
140364014:     	leaq	0x4ca7825(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14036401b:     	movq	%rax, -0x28(%rbp)
14036401f:     	leaq	0x55f913b(%rip), %rcx   # 0x14595d161
140364026:     	leaq	0x560239b(%rip), %r8    # 0x1459663c8
14036402d:     	leaq	-0x30(%rbp), %rdx
140364031:     	callq	0x145903d10 <.text+0x5902d10>
140364036:     	ud2
