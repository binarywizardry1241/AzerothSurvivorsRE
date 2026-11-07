
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400b7b00:     	movq	%rcx, %rax
1400b7b03:     	movzbl	0x8c(%rdx), %r8d
1400b7b0b:     	xorps	%xmm0, %xmm0
1400b7b0e:     	leaq	0x588556b(%rip), %rdx   # 0x14593d080
1400b7b15:     	decl	%r8d
1400b7b18:     	cmpl	$0x8, %r8d
1400b7b1c:     	ja	0x1400b7c23 <.text+0xb6c23>
1400b7b22:     	movl	$0x1, %ecx
1400b7b27:     	leaq	0x5887b6e(%rip), %r9    # 0x14593f69c
1400b7b2e:     	movslq	(%r9,%r8,4), %r8
1400b7b32:     	addq	%r9, %r8
1400b7b35:     	jmpq	*%r8
1400b7b38:     	leaq	0x5885515(%rip), %rcx   # 0x14593d054
1400b7b3f:     	jmp	0x1400b7b63 <.text+0xb6b63>
1400b7b41:     	leaq	0x5885525(%rip), %rdx   # 0x14593d06d
1400b7b48:     	jmp	0x1400b7bad <.text+0xb6bad>
1400b7b4a:     	leaq	0x5885522(%rip), %rdx   # 0x14593d073
1400b7b51:     	jmp	0x1400b7bad <.text+0xb6bad>
1400b7b53:     	leaq	0x588551f(%rip), %rcx   # 0x14593d079
1400b7b5a:     	jmp	0x1400b7b63 <.text+0xb6b63>
1400b7b5c:     	leaq	0x58854f8(%rip), %rcx   # 0x14593d05b
1400b7b63:     	movl	$0x52524157, %edx       # imm = 0x52524157
1400b7b68:     	xorl	(%rcx), %edx
1400b7b6a:     	movl	$0x524f4952, %r8d       # imm = 0x524F4952
1400b7b70:     	xorl	0x3(%rcx), %r8d
1400b7b74:     	orl	%edx, %r8d
1400b7b77:     	je	0x1400b7c18 <.text+0xb6c18>
1400b7b7d:     	movl	$0x4c524157, %edx       # imm = 0x4C524157
1400b7b82:     	xorl	(%rcx), %edx
1400b7b84:     	movl	$0x4b434f4c, %r8d       # imm = 0x4B434F4C
1400b7b8a:     	xorl	0x3(%rcx), %r8d
1400b7b8e:     	orl	%edx, %r8d
1400b7b91:     	je	0x1400b7c5d <.text+0xb6c5d>
1400b7b97:     	xorl	%ecx, %ecx
1400b7b99:     	movss	0x5860bbf(%rip), %xmm0  # 0x145918760
1400b7ba1:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7ba6:     	leaq	0x58854b5(%rip), %rdx   # 0x14593d062
1400b7bad:     	movl	$0x544e5548, %r8d       # imm = 0x544E5548
1400b7bb3:     	xorl	(%rdx), %r8d
1400b7bb6:     	movzwl	0x4(%rdx), %r9d
1400b7bbb:     	xorl	$0x5245, %r9d           # imm = 0x5245
1400b7bc2:     	movss	0x5860b86(%rip), %xmm0  # 0x145918750
1400b7bca:     	orl	%r8d, %r9d
1400b7bcd:     	je	0x1400b7c18 <.text+0xb6c18>
1400b7bcf:     	movl	$0x4d414853, %r8d       # imm = 0x4D414853
1400b7bd5:     	xorl	(%rdx), %r8d
1400b7bd8:     	movzwl	0x4(%rdx), %r9d
1400b7bdd:     	xorl	$0x4e41, %r9d           # imm = 0x4E41
1400b7be4:     	orl	%r8d, %r9d
1400b7be7:     	je	0x1400b7c71 <.text+0xb6c71>
1400b7bed:     	movl	$0x45495250, %r8d       # imm = 0x45495250
1400b7bf3:     	xorl	(%rdx), %r8d
1400b7bf6:     	movzwl	0x4(%rdx), %edx
1400b7bfa:     	xorl	$0x5453, %edx           # imm = 0x5453
1400b7c00:     	xorl	%ecx, %ecx
1400b7c02:     	orl	%r8d, %edx
1400b7c05:     	sete	%cl
1400b7c08:     	leaq	0x5860b49(%rip), %rdx   # 0x145918758
1400b7c0f:     	movss	(%rdx,%rcx,4), %xmm0
1400b7c14:     	addl	%ecx, %ecx
1400b7c16:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7c18:     	xorl	%ecx, %ecx
1400b7c1a:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7c1c:     	leaq	0x5885445(%rip), %rdx   # 0x14593d068
1400b7c23:     	movl	$0x55474f52, %ecx       # imm = 0x55474F52
1400b7c28:     	xorl	(%rdx), %ecx
1400b7c2a:     	movzbl	0x4(%rdx), %r8d
1400b7c2f:     	xorl	$0x45, %r8d
1400b7c33:     	orl	%ecx, %r8d
1400b7c36:     	je	0x1400b7c56 <.text+0xb6c56>
1400b7c38:     	movl	$0x49555244, %ecx       # imm = 0x49555244
1400b7c3d:     	xorl	(%rdx), %ecx
1400b7c3f:     	movzbl	0x4(%rdx), %edx
1400b7c43:     	xorl	$0x44, %edx
1400b7c46:     	orl	%ecx, %edx
1400b7c48:     	je	0x1400b7c6c <.text+0xb6c6c>
1400b7c4a:     	movss	0x5860b0e(%rip), %xmm0  # 0x145918760
1400b7c52:     	xorl	%ecx, %ecx
1400b7c54:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7c56:     	movl	$0x2, %ecx
1400b7c5b:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7c5d:     	movl	$0x3, %ecx
1400b7c62:     	movss	0x5860ae6(%rip), %xmm0  # 0x145918750
1400b7c6a:     	jmp	0x1400b7c71 <.text+0xb6c71>
1400b7c6c:     	movl	$0x3, %ecx
1400b7c71:     	leaq	0x5885410(%rip), %rdx   # 0x14593d088
1400b7c78:     	movss	0x5860ad0(%rip), %xmm1  # 0x145918750
1400b7c80:     	addss	%xmm0, %xmm1
1400b7c84:     	movsd	(%rdx,%rcx,4), %xmm2
1400b7c89:     	movaps	%xmm2, %xmm3
1400b7c8c:     	shufps	$0x4, %xmm0, %xmm3      # xmm3 = xmm3[0,1],xmm0[0,0]
1400b7c90:     	shufps	$0xd8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,1,3]
1400b7c94:     	shufps	$0x1, %xmm1, %xmm2      # xmm2 = xmm2[1,0],xmm1[0,0]
1400b7c98:     	shufps	$0xd8, %xmm2, %xmm2     # xmm2 = xmm2[0,2,1,3]
1400b7c9c:     	movaps	%xmm3, %xmm0
1400b7c9f:     	cmpltps	%xmm2, %xmm0
1400b7ca3:     	movddup	%xmm2, %xmm1            # xmm1 = xmm2[0,0]
1400b7ca7:     	cmpltps	%xmm3, %xmm2
1400b7cab:     	shufps	$0x23, %xmm0, %xmm2     # xmm2 = xmm2[3,0],xmm0[2,0]
1400b7caf:     	shufps	$0x24, %xmm2, %xmm0     # xmm0 = xmm0[0,1],xmm2[2,0]
1400b7cb3:     	movddup	%xmm3, %xmm2            # xmm2 = xmm3[0,0]
1400b7cb7:     	andpd	%xmm0, %xmm2
1400b7cbb:     	andnpd	%xmm1, %xmm0
1400b7cbf:     	orpd	%xmm2, %xmm0
1400b7cc3:     	movupd	%xmm0, (%rax)
1400b7cc7:     	retq
