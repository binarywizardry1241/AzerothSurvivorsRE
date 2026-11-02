
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140171ac9:     	addss	%xmm3, %xmm1
140171acd:     	addss	%xmm3, %xmm2
140171ad1:     	testq	%rcx, %rcx
140171ad4:     	sete	%al
140171ad7:     	testb	%al, %r12b
140171ada:     	je	0x140171b01 <.text+0x170b01>
140171adc:     	movl	0x68(%rsi), %eax
140171adf:     	testl	%eax, %eax
140171ae1:     	movl	0x38(%rsp), %ecx
140171ae5:     	je	0x140171e71 <.text+0x170e71>
140171aeb:     	cmpl	$0x1, %eax
140171aee:     	jne	0x140171e2f <.text+0x170e2f>
140171af4:     	movss	0x6c(%rsi), %xmm3
140171af9:     	ucomiss	%xmm1, %xmm3
140171afc:     	jmp	0x140171e41 <.text+0x170e41>
140171b01:     	movups	0x5c44bd0(%rip), %xmm3  # 0x145db66d8
140171b08:     	movaps	%xmm3, 0x70(%rsp)
140171b0d:     	movq	$0x0, 0x80(%rsp)
140171b19:     	movups	0x5c44bd0(%rip), %xmm4  # 0x145db66f0
140171b20:     	movups	%xmm4, 0x88(%rsp)
140171b28:     	movq	$0x0, 0x98(%rsp)
140171b34:     	movups	0x5c44bcd(%rip), %xmm4  # 0x145db6708
140171b3b:     	movaps	%xmm4, 0xa0(%rsp)
140171b43:     	movq	$0x0, 0xb0(%rsp)
140171b4f:     	movups	0x5c44bca(%rip), %xmm5  # 0x145db6720
140171b56:     	movups	%xmm5, 0xb8(%rsp)
140171b5e:     	movq	$0x0, 0xc8(%rsp)
140171b6a:     	movaps	%xmm3, 0x220(%rsp)
140171b72:     	movaps	%xmm4, 0x250(%rsp)
140171b7a:     	movq	0x80(%rsp), %rax
140171b82:     	movq	%rax, 0x230(%rsp)
140171b8a:     	movq	0x88(%rsp), %rax
140171b92:     	movq	%rax, 0x238(%rsp)
140171b9a:     	movq	0x90(%rsp), %rax
140171ba2:     	movq	%rax, 0x240(%rsp)
140171baa:     	movq	0x98(%rsp), %rax
140171bb2:     	movq	%rax, 0x248(%rsp)
140171bba:     	movq	0xb0(%rsp), %rax
140171bc2:     	movq	%rax, 0x260(%rsp)
140171bca:     	movq	0xb8(%rsp), %rax
140171bd2:     	movq	%rax, 0x268(%rsp)
140171bda:     	movaps	0xc0(%rsp), %xmm3
140171be2:     	movaps	%xmm3, 0x270(%rsp)
140171bea:     	movq	$0x0, 0x280(%rsp)
140171bf6:     	movl	$0x1, 0x288(%rsp)
140171c01:     	movss	%xmm1, 0x28c(%rsp)
140171c0a:     	movq	$0x0, 0x290(%rsp)
140171c16:     	movl	$0x1, 0x298(%rsp)
140171c21:     	movss	%xmm2, 0x29c(%rsp)
140171c2a:     	movaps	0x5c4427f(%rip), %xmm1  # 0x145db5eb0
140171c31:     	movaps	%xmm1, 0x2a0(%rsp)
140171c39:     	movabsq	$0x41f8000000000001, %rax # imm = 0x41F8000000000001
140171c43:     	movq	%rax, 0x2b0(%rsp)
140171c4b:     	xorps	%xmm1, %xmm1
140171c4e:     	movups	%xmm1, 0x2c8(%rsp)
140171c56:     	movups	%xmm1, 0x2b8(%rsp)
140171c5e:     	movups	0x5c44b3b(%rip), %xmm1  # 0x145db67a0
140171c65:     	movups	%xmm1, 0x2e8(%rsp)
140171c6d:     	movups	0x5c44b1c(%rip), %xmm1  # 0x145db6790
140171c74:     	movups	%xmm1, 0x2d8(%rsp)
140171c7c:     	movups	0x5c44b3d(%rip), %xmm1  # 0x145db67c0
140171c83:     	movups	%xmm1, 0x308(%rsp)
140171c8b:     	movups	0x5c44b1e(%rip), %xmm1  # 0x145db67b0
140171c92:     	movups	%xmm1, 0x2f8(%rsp)
140171c9a:     	movups	0x5c44b3f(%rip), %xmm1  # 0x145db67e0
140171ca1:     	movups	%xmm1, 0x328(%rsp)
140171ca9:     	movups	0x5c44b20(%rip), %xmm1  # 0x145db67d0
140171cb0:     	movups	%xmm1, 0x318(%rsp)
140171cb8:     	movups	0x5c44ba9(%rip), %xmm1  # 0x145db6868
140171cbf:     	movups	%xmm1, 0x348(%rsp)
140171cc7:     	movups	0x5c44b8a(%rip), %xmm1  # 0x145db6858
140171cce:     	movups	%xmm1, 0x338(%rsp)
140171cd6:     	movaps	0x5bfb583(%rip), %xmm1  # 0x145d6d260
140171cdd:     	movups	%xmm1, 0x358(%rsp)
140171ce5:     	movl	$0x1, 0x368(%rsp)
140171cf0:     	movq	$0x0, 0x36c(%rsp)
140171cfc:     	movb	$0x1, 0x374(%rsp)
140171d04:     	movq	$0x0, 0x378(%rsp)
140171d10:     	movl	$0x3f800000, 0x380(%rsp) # imm = 0x3F800000
140171d1b:     	movw	$0x0, 0x384(%rsp)
140171d25:     	movw	$0x0, 0x38a(%rsp)
140171d2f:     	movl	$0x10000, 0x386(%rsp)   # imm = 0x10000
140171d3a:     	movw	$0x0, 0x390(%rsp)
140171d44:     	movl	$0x10000, 0x38c(%rsp)   # imm = 0x10000
140171d4f:     	movw	$0x100, 0x392(%rsp)     # imm = 0x100
140171d59:     	movw	$0x0, 0x39c(%rsp)
140171d63:     	movq	$0x0, 0x394(%rsp)
140171d6f:     	movups	0x5c44b02(%rip), %xmm1  # 0x145db6878
140171d76:     	movaps	%xmm1, 0x3a0(%rsp)
140171d7e:     	movss	%xmm0, 0x3b0(%rsp)
140171d87:     	movss	%xmm0, 0x3b4(%rsp)
140171d90:     	movss	0x5bfb5d4(%rip), %xmm0  # 0x145d6d36c
140171d98:     	movlps	%xmm0, 0x3b8(%rsp)
140171da0:     	movl	$0xfdc, 0x3c0(%rsp)     # imm = 0xFDC
140171dab:     	movw	$0x2, 0x3c4(%rsp)
140171db5:     	leaq	0x5c44adc(%rip), %r9    # 0x145db6898
140171dbc:     	leaq	0x70(%rsp), %rsi
140171dc1:     	leaq	0xd0(%rsp), %rdx
140171dc9:     	leaq	0x220(%rsp), %r8
140171dd1:     	movq	%rsi, %rcx
140171dd4:     	callq	0x1401a0ba0 <.text+0x19fba0>
140171dd9:     	leaq	0x2f(%rsp), %rax
140171dde:     	movq	%rax, 0x220(%rsp)
140171de6:     	movq	0x40(%rsp), %rax
140171deb:     	movq	%rax, 0x228(%rsp)
140171df3:     	movq	%rdi, 0x230(%rsp)
140171dfb:     	leaq	0x220(%rsp), %rdx
140171e03:     	movq	%rsi, %rcx
140171e06:     	callq	0x1401cf5a0 <.text+0x1ce5a0>
140171e0b:     	movaps	0x3d0(%rsp), %xmm6
140171e13:     	movaps	0x3e0(%rsp), %xmm7
140171e1b:     	addq	$0x3f8, %rsp            # imm = 0x3F8
140171e22:     	popq	%rbx
140171e23:     	popq	%rbp
140171e24:     	popq	%rdi
140171e25:     	popq	%rsi
140171e26:     	popq	%r12
140171e28:     	popq	%r13
140171e2a:     	popq	%r14
140171e2c:     	popq	%r15
140171e2e:     	retq
140171e2f:     	movss	0x6c(%rsi), %xmm4
140171e34:     	xorps	%xmm3, %xmm3
140171e37:     	ucomiss	%xmm3, %xmm4
140171e3a:     	jne	0x140171e71 <.text+0x170e71>
140171e3c:     	jp	0x140171e71 <.text+0x170e71>
140171e3e:     	ucomiss	%xmm3, %xmm1
140171e41:     	jne	0x140171e71 <.text+0x170e71>
140171e43:     	jp	0x140171e71 <.text+0x170e71>
140171e45:     	movl	0x78(%rsi), %eax
140171e48:     	testl	%eax, %eax
140171e4a:     	je	0x140171e71 <.text+0x170e71>
140171e4c:     	cmpl	$0x1, %eax
140171e4f:     	jne	0x140171e5b <.text+0x170e5b>
140171e51:     	movss	0x7c(%rsi), %xmm3
140171e56:     	ucomiss	%xmm2, %xmm3
140171e59:     	jmp	0x140171e6d <.text+0x170e6d>
140171e5b:     	movss	0x7c(%rsi), %xmm4
140171e60:     	xorps	%xmm3, %xmm3
140171e63:     	ucomiss	%xmm3, %xmm4
140171e66:     	jne	0x140171e71 <.text+0x170e71>
140171e68:     	jp	0x140171e71 <.text+0x170e71>
140171e6a:     	ucomiss	%xmm3, %xmm2
140171e6d:     	jne	0x140171e71 <.text+0x170e71>
140171e6f:     	jnp	0x140171e8c <.text+0x170e8c>
