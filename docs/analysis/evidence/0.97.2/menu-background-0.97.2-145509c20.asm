
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145509c20:     	movq	%rcx, %rax
145509c23:     	movsd	0xc8(%rdx), %xmm0
145509c2b:     	movss	0xd0(%rdx), %xmm1
145509c33:     	movq	0x10(%rdx), %rcx
145509c37:     	addq	$-0x2, %rcx
145509c3b:     	cmpq	$0x6, %rcx
145509c3f:     	ja	0x145509d83 <.text+0x5508d83>
145509c45:     	leaq	0x17de754(%rip), %r8    # 0x146ce83a0
145509c4c:     	movslq	(%r8,%rcx,4), %rcx
145509c50:     	addq	%r8, %rcx
145509c53:     	jmpq	*%rcx
145509c55:     	movq	0x8(%rdx), %rcx
145509c59:     	cmpw	$0x6d73, (%rcx)         # imm = 0x6D73
145509c5e:     	jne	0x145509d83 <.text+0x5508d83>
145509c64:     	movsd	0x14a36c4(%rip), %xmm0  # 0x1469ad330
145509c6c:     	movaps	0x14a36cd(%rip), %xmm3  # 0x1469ad340
145509c73:     	movaps	0x14a36d6(%rip), %xmm2  # 0x1469ad350
145509c7a:     	xorps	%xmm4, %xmm4
145509c7d:     	movss	0x4bdc0b(%rip), %xmm1   # 0x1459c7890
145509c85:     	jmp	0x145509dae <.text+0x5508dae>
145509c8a:     	movq	0x8(%rdx), %rcx
145509c8e:     	movl	$0x6e657261, %r8d       # imm = 0x6E657261
145509c94:     	xorl	(%rcx), %r8d
145509c97:     	movzbl	0x4(%rcx), %ecx
145509c9b:     	xorl	$0x61, %ecx
145509c9e:     	orl	%r8d, %ecx
145509ca1:     	jne	0x145509d83 <.text+0x5508d83>
145509ca7:     	movaps	0x14a3642(%rip), %xmm3  # 0x1469ad2f0
145509cae:     	movaps	0x14a364b(%rip), %xmm2  # 0x1469ad300
145509cb5:     	xorps	%xmm4, %xmm4
145509cb8:     	jmp	0x145509dae <.text+0x5508dae>
145509cbd:     	movq	0x8(%rdx), %rcx
145509cc1:     	movabsq	$0x646f6f776b737564, %r8 # imm = 0x646F6F776B737564
145509ccb:     	cmpq	%r8, (%rcx)
145509cce:     	jne	0x145509d83 <.text+0x5508d83>
145509cd4:     	movsd	0x14a35a4(%rip), %xmm0  # 0x1469ad280
145509cdc:     	movsd	0x14a35ac(%rip), %xmm3  # 0x1469ad290
145509ce4:     	movaps	0x14a35b5(%rip), %xmm2  # 0x1469ad2a0
145509ceb:     	movss	0x3ec90d(%rip), %xmm4   # 0x1458f6600
145509cf3:     	movss	0x429f55(%rip), %xmm1   # 0x145933c50
145509cfb:     	jmp	0x145509dae <.text+0x5508dae>
145509d00:     	movq	0x8(%rdx), %rcx
145509d04:     	cmpl	$0x7878616e, (%rcx)     # imm = 0x7878616E
145509d0a:     	jne	0x145509d83 <.text+0x5508d83>
145509d0c:     	movaps	0x14a35fd(%rip), %xmm3  # 0x1469ad310
145509d13:     	movaps	0x14a3606(%rip), %xmm2  # 0x1469ad320
145509d1a:     	xorps	%xmm4, %xmm4
145509d1d:     	jmp	0x145509dae <.text+0x5508dae>
145509d22:     	movq	0x8(%rdx), %rcx
145509d26:     	movl	$0x79776c65, %r8d       # imm = 0x79776C65
145509d2c:     	xorl	(%rcx), %r8d
145509d2f:     	movzwl	0x4(%rcx), %ecx
145509d33:     	xorl	$0x6e6e, %ecx           # imm = 0x6E6E
145509d39:     	orl	%r8d, %ecx
145509d3c:     	jne	0x145509d83 <.text+0x5508d83>
145509d3e:     	movsd	0x14a356a(%rip), %xmm0  # 0x1469ad2b0
145509d46:     	movsd	0x14a3572(%rip), %xmm3  # 0x1469ad2c0
145509d4e:     	movaps	0x14a357b(%rip), %xmm2  # 0x1469ad2d0
145509d55:     	movss	0x14a3583(%rip), %xmm4  # 0x1469ad2e0
145509d5d:     	movss	0x5079ff(%rip), %xmm1   # 0x145a11764
145509d65:     	jmp	0x145509dae <.text+0x5508dae>
145509d67:     	movq	0x8(%rdx), %rcx
145509d6b:     	movl	$0x61726566, %r8d       # imm = 0x61726566
145509d71:     	xorl	(%rcx), %r8d
145509d74:     	movl	$0x73616c61, %r9d       # imm = 0x73616C61
145509d7a:     	xorl	0x3(%rcx), %r9d
145509d7e:     	orl	%r8d, %r9d
145509d81:     	je	0x145509dc4 <.text+0x5508dc4>
145509d83:     	movss	0xd8(%rdx), %xmm3
145509d8b:     	mulss	0x3e1791(%rip), %xmm3   # 0x1458eb524
145509d93:     	movaps	0x14a35c6(%rip), %xmm2  # 0x1469ad360
145509d9a:     	movss	%xmm3, %xmm2            # xmm2 = xmm3[0],xmm2[1,2,3]
145509d9e:     	movsd	0x14a34ca(%rip), %xmm3  # 0x1469ad270
145509da6:     	movss	0x3ec852(%rip), %xmm4   # 0x1458f6600
145509dae:     	movlps	%xmm0, (%rax)
145509db1:     	movss	%xmm1, 0x8(%rax)
145509db6:     	movups	%xmm2, 0xc(%rax)
145509dba:     	movups	%xmm3, 0x1c(%rax)
145509dbe:     	movss	%xmm4, 0x2c(%rax)
145509dc3:     	retq
145509dc4:     	movss	0xd8(%rdx), %xmm3
145509dcc:     	mulss	0x3e1750(%rip), %xmm3   # 0x1458eb524
145509dd4:     	movaps	0x14a3485(%rip), %xmm2  # 0x1469ad260
145509ddb:     	movss	%xmm3, %xmm2            # xmm2 = xmm3[0],xmm2[1,2,3]
145509ddf:     	movsd	0x14a3489(%rip), %xmm3  # 0x1469ad270
145509de7:     	movss	0x4bde89(%rip), %xmm4   # 0x1459c7c78
145509def:     	jmp	0x145509dae <.text+0x5508dae>
