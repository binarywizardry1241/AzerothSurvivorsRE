
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145497d00:     	pushq	%r15
145497d02:     	pushq	%r14
145497d04:     	pushq	%r12
145497d06:     	pushq	%rsi
145497d07:     	pushq	%rdi
145497d08:     	pushq	%rbp
145497d09:     	pushq	%rbx
145497d0a:     	subq	$0xc0, %rsp
145497d11:     	movaps	%xmm15, 0xb0(%rsp)
145497d1a:     	movaps	%xmm14, 0xa0(%rsp)
145497d23:     	movaps	%xmm13, 0x90(%rsp)
145497d2c:     	movaps	%xmm12, 0x80(%rsp)
145497d35:     	movaps	%xmm11, 0x70(%rsp)
145497d3b:     	movaps	%xmm10, 0x60(%rsp)
145497d41:     	movaps	%xmm9, 0x50(%rsp)
145497d47:     	movaps	%xmm8, 0x40(%rsp)
145497d4d:     	movaps	%xmm7, 0x30(%rsp)
145497d52:     	movaps	%xmm6, 0x20(%rsp)
145497d57:     	movaps	%xmm3, %xmm7
145497d5a:     	movaps	%xmm2, %xmm8
145497d5e:     	movq	%rdx, %rdi
145497d61:     	movq	%rcx, %rsi
145497d64:     	movq	0x210(%rdx), %rcx
145497d6b:     	movq	0x218(%rdx), %rdx
145497d72:     	callq	0x1453e23e0 <.text+0x53e13e0>
145497d77:     	imulq	$0xb8, %rax, %rax
145497d7e:     	leaq	0x123ac83(%rip), %r14   # 0x1466d2a08
145497d85:     	addq	%rax, %r14
145497d88:     	leaq	0x870(%rdi), %rbx
145497d8f:     	xorl	%r15d, %r15d
145497d92:     	movss	0x4107c9(%rip), %xmm12  # 0x1458a8564
145497d9b:     	movss	0x4278dc(%rip), %xmm13  # 0x1458bf680
145497da4:     	xorps	%xmm14, %xmm14
145497da8:     	movss	0x425353(%rip), %xmm15  # 0x1458bd104
145497db1:     	movq	$-0x1, %r12
145497db8:     	xorl	%ebp, %ebp
145497dba:     	jmp	0x145497dcb <.text+0x5496dcb>
145497dbc:     	nopl	(%rax)
145497dc0:     	incl	%ebp
145497dc2:     	cmpl	$0xc, %ebp
145497dc5:     	je	0x145497ff4 <.text+0x5496ff4>
145497dcb:     	movsd	0x3e8(%rdi), %xmm6
145497dd3:     	movq	0x870(%rdi), %r8
145497dda:     	movq	0x888(%rdi), %rdx
145497de1:     	movq	0x878(%rdi), %rcx
145497de8:     	movq	0x880(%rdi), %rax
145497def:     	nop
145497df0:     	leaq	(%r8,%rdx), %r9
145497df4:     	rolq	$0x17, %r9
145497df8:     	addq	%r8, %r9
145497dfb:     	movq	%rcx, %r10
145497dfe:     	shlq	$0x11, %r10
145497e02:     	xorq	%r8, %rax
145497e05:     	xorq	%rcx, %rdx
145497e08:     	xorq	%rax, %rcx
145497e0b:     	xorq	%rdx, %r8
145497e0e:     	rolq	$0x2d, %rdx
145497e12:     	xorq	%r10, %rax
145497e15:     	shrq	$0x29, %r9
145497e19:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
145497e20:     	movd	%r9d, %xmm9
145497e25:     	addss	%xmm12, %xmm9
145497e2a:     	mulss	%xmm13, %xmm9
145497e2f:     	ucomiss	%xmm9, %xmm13
145497e33:     	jbe	0x145497df0 <.text+0x5496df0>
145497e35:     	addss	%xmm14, %xmm9
145497e3a:     	movq	%r8, 0x870(%rdi)
145497e41:     	movq	%rdx, 0x888(%rdi)
145497e48:     	movq	%rcx, 0x878(%rdi)
145497e4f:     	movq	%rax, 0x880(%rdi)
145497e56:     	movq	%rbx, %rcx
145497e59:     	movaps	%xmm8, %xmm1
145497e5d:     	movaps	%xmm7, %xmm2
145497e60:     	callq	0x1454d71c0 <.text+0x54d61c0>
145497e65:     	movaps	%xmm0, %xmm10
145497e69:     	movaps	%xmm9, %xmm0
145497e6d:     	callq	0x145714a63 <.text+0x5713a63>
145497e72:     	movaps	%xmm0, %xmm11
145497e76:     	movaps	%xmm9, %xmm0
145497e7a:     	callq	0x145714a4b <.text+0x5713a4b>
145497e7f:     	unpcklps	%xmm0, %xmm11           # xmm11 = xmm11[0],xmm0[0],xmm11[1],xmm0[1]
145497e83:     	movsldup	%xmm10, %xmm0           # xmm0 = xmm10[0,0,2,2]
145497e88:     	mulps	%xmm11, %xmm0
145497e8c:     	addps	%xmm0, %xmm6
145497e8f:     	movsd	0x98(%r14), %xmm0
145497e98:     	movaps	%xmm6, %xmm1
145497e9b:     	subps	%xmm0, %xmm1
145497e9e:     	movaps	%xmm1, %xmm2
145497ea1:     	mulps	%xmm1, %xmm2
145497ea4:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145497ea8:     	addss	%xmm2, %xmm3
145497eac:     	sqrtss	%xmm3, %xmm3
145497eb0:     	movss	0xa8(%r14), %xmm2
145497eb9:     	ucomiss	%xmm2, %xmm3
145497ebc:     	jbe	0x145497ed2 <.text+0x5496ed2>
145497ebe:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
145497ec2:     	divps	%xmm3, %xmm1
145497ec5:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
145497ec9:     	mulps	%xmm1, %xmm2
145497ecc:     	addps	%xmm2, %xmm0
145497ecf:     	movaps	%xmm0, %xmm6
145497ed2:     	movq	0x868(%rdi), %rcx
145497ed9:     	cmpq	$-0x1, 0x40(%rcx)
145497ede:     	je	0x145497fb0 <.text+0x5496fb0>
145497ee4:     	movsd	0x60(%rcx), %xmm1
145497ee9:     	movaps	%xmm6, %xmm0
145497eec:     	subps	%xmm1, %xmm0
145497eef:     	movaps	%xmm0, %xmm1
145497ef2:     	xorps	%xmm2, %xmm2
145497ef5:     	cmpltps	%xmm2, %xmm1
145497ef9:     	unpcklps	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1]
145497efc:     	movmskpd	%xmm1, %eax
145497f00:     	testl	%eax, %eax
145497f02:     	jne	0x145497fb0 <.text+0x5496fb0>
145497f08:     	movaps	%xmm0, %xmm1
145497f0b:     	movss	0x4251ed(%rip), %xmm2   # 0x1458bd100
145497f13:     	subss	%xmm2, %xmm1
145497f17:     	cvttss2si	%xmm1, %rax
145497f1c:     	cvttss2si	%xmm0, %r8
145497f21:     	movq	%r8, %rdx
145497f24:     	sarq	$0x3f, %rdx
145497f28:     	andq	%rax, %rdx
145497f2b:     	orq	%r8, %rdx
145497f2e:     	ucomiss	%xmm14, %xmm0
145497f32:     	cmovbq	%r15, %rdx
145497f36:     	ucomiss	%xmm15, %xmm0
145497f3a:     	cmovaq	%r12, %rdx
145497f3e:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
145497f42:     	movaps	%xmm0, %xmm1
145497f45:     	subss	%xmm2, %xmm1
145497f49:     	cvttss2si	%xmm1, %rax
145497f4e:     	cvttss2si	%xmm0, %r9
145497f53:     	movq	%r9, %r8
145497f56:     	sarq	$0x3f, %r8
145497f5a:     	andq	%rax, %r8
145497f5d:     	orq	%r9, %r8
145497f60:     	ucomiss	%xmm14, %xmm0
145497f64:     	cmovbq	%r15, %r8
145497f68:     	ucomiss	%xmm15, %xmm0
145497f6c:     	cmovaq	%r12, %r8
145497f70:     	movq	0x58(%rcx), %rax
145497f74:     	cmpq	%rax, %rdx
145497f77:     	setae	%r9b
145497f7b:     	cmpq	%rax, %r8
145497f7e:     	setae	%r10b
145497f82:     	orb	%r9b, %r10b
145497f85:     	jne	0x145497fb0 <.text+0x5496fb0>
145497f87:     	imulq	%r8, %rax
145497f8b:     	addq	%rdx, %rax
145497f8e:     	movq	0x50(%rcx), %rdx
145497f92:     	cmpq	%rdx, %rax
145497f95:     	jae	0x145498140 <.text+0x5497140>
145497f9b:     	movq	0x48(%rcx), %rdx
145497f9f:     	cmpb	$0x0, (%rdx,%rax)
145497fa3:     	jne	0x145497dc0 <.text+0x5496dc0>
145497fa9:     	nopl	(%rax)
145497fb0:     	addq	$0x10, %rcx
145497fb4:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
145497fb8:     	movaps	%xmm6, %xmm1
145497fbb:     	callq	0x1453f66f0 <.text+0x53f56f0>
145497fc0:     	testb	$0x1, %al
145497fc2:     	je	0x145497dc0 <.text+0x5496dc0>
145497fc8:     	movss	0x3f0(%rdi), %xmm1
145497fd0:     	movaps	%xmm0, %xmm2
145497fd3:     	subss	%xmm1, %xmm2
145497fd7:     	andps	0x410612(%rip), %xmm2   # 0x1458a85f0
145497fde:     	movss	0x541fb2(%rip), %xmm1   # 0x1459d9f98
145497fe6:     	ucomiss	%xmm2, %xmm1
145497fe9:     	jbe	0x145497dc0 <.text+0x5496dc0>
145497fef:     	jmp	0x1454980e0 <.text+0x54970e0>
145497ff4:     	movsd	0x3e8(%rdi), %xmm6
145497ffc:     	movq	0x870(%rdi), %r8
145498003:     	movq	0x888(%rdi), %rdx
14549800a:     	movq	0x878(%rdi), %rcx
145498011:     	movq	0x880(%rdi), %rax
145498018:     	nopl	(%rax,%rax)
145498020:     	leaq	(%r8,%rdx), %r9
145498024:     	rolq	$0x17, %r9
145498028:     	addq	%r8, %r9
14549802b:     	movq	%rcx, %r10
14549802e:     	shlq	$0x11, %r10
145498032:     	xorq	%r8, %rax
145498035:     	xorq	%rcx, %rdx
145498038:     	xorq	%rax, %rcx
14549803b:     	xorq	%rdx, %r8
14549803e:     	rolq	$0x2d, %rdx
145498042:     	xorq	%r10, %rax
145498045:     	shrq	$0x29, %r9
145498049:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
145498050:     	movd	%r9d, %xmm9
145498055:     	addss	%xmm12, %xmm9
14549805a:     	mulss	%xmm13, %xmm9
14549805f:     	ucomiss	%xmm9, %xmm13
145498063:     	jbe	0x145498020 <.text+0x5497020>
145498065:     	xorps	%xmm0, %xmm0
145498068:     	addss	%xmm0, %xmm9
14549806d:     	movq	%r8, 0x870(%rdi)
145498074:     	movq	%rdx, 0x888(%rdi)
14549807b:     	movq	%rcx, 0x878(%rdi)
145498082:     	movq	%rax, 0x880(%rdi)
145498089:     	movq	%rbx, %rcx
14549808c:     	movaps	%xmm8, %xmm1
145498090:     	movaps	%xmm7, %xmm2
145498093:     	callq	0x1454d71c0 <.text+0x54d61c0>
145498098:     	movaps	%xmm0, %xmm7
14549809b:     	movaps	%xmm9, %xmm0
14549809f:     	callq	0x145714a63 <.text+0x5713a63>
1454980a4:     	movaps	%xmm0, %xmm8
1454980a8:     	movaps	%xmm9, %xmm0
1454980ac:     	callq	0x145714a4b <.text+0x5713a4b>
1454980b1:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
1454980b5:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
1454980b9:     	mulps	%xmm8, %xmm0
1454980bd:     	addps	%xmm0, %xmm6
1454980c0:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
1454980c4:     	movq	0x868(%rdi), %rdi
1454980cb:     	leaq	0x10(%rdi), %rcx
1454980cf:     	movaps	%xmm6, %xmm1
1454980d2:     	callq	0x1453f66f0 <.text+0x53f56f0>
1454980d7:     	testb	$0x1, %al
1454980d9:     	jne	0x1454980e0 <.text+0x54970e0>
1454980db:     	movss	0x68(%rdi), %xmm0
1454980e0:     	movlps	%xmm6, (%rsi)
1454980e3:     	movss	%xmm0, 0x8(%rsi)
1454980e8:     	movaps	0x20(%rsp), %xmm6
1454980ed:     	movaps	0x30(%rsp), %xmm7
1454980f2:     	movaps	0x40(%rsp), %xmm8
1454980f8:     	movaps	0x50(%rsp), %xmm9
1454980fe:     	movaps	0x60(%rsp), %xmm10
145498104:     	movaps	0x70(%rsp), %xmm11
14549810a:     	movaps	0x80(%rsp), %xmm12
145498113:     	movaps	0x90(%rsp), %xmm13
14549811c:     	movaps	0xa0(%rsp), %xmm14
145498125:     	movaps	0xb0(%rsp), %xmm15
14549812e:     	addq	$0xc0, %rsp
145498135:     	popq	%rbx
145498136:     	popq	%rbp
145498137:     	popq	%rdi
145498138:     	popq	%rsi
145498139:     	popq	%r12
14549813b:     	popq	%r14
14549813d:     	popq	%r15
14549813f:     	retq
145498140:     	leaq	0x161bd21(%rip), %r8    # 0x146ab3e68
145498147:     	movq	%rax, %rcx
14549814a:     	callq	0x1458a3f23 <.text+0x58a2f23>
14549814f:     	ud2
