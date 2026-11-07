
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140129c00:     	pushq	%rbp
140129c01:     	pushq	%r15
140129c03:     	pushq	%r14
140129c05:     	pushq	%r13
140129c07:     	pushq	%r12
140129c09:     	pushq	%rsi
140129c0a:     	pushq	%rdi
140129c0b:     	pushq	%rbx
140129c0c:     	subq	$0x468, %rsp            # imm = 0x468
140129c13:     	leaq	0x80(%rsp), %rbp
140129c1b:     	movaps	%xmm15, 0x3d0(%rbp)
140129c23:     	movaps	%xmm14, 0x3c0(%rbp)
140129c2b:     	movaps	%xmm13, 0x3b0(%rbp)
140129c33:     	movaps	%xmm12, 0x3a0(%rbp)
140129c3b:     	movaps	%xmm11, 0x390(%rbp)
140129c43:     	movaps	%xmm10, 0x380(%rbp)
140129c4b:     	movaps	%xmm9, 0x370(%rbp)
140129c53:     	movaps	%xmm8, 0x360(%rbp)
140129c5b:     	movaps	%xmm7, 0x350(%rbp)
140129c62:     	movaps	%xmm6, 0x340(%rbp)
140129c69:     	movq	$-0x2, 0x338(%rbp)
140129c74:     	movq	%r8, %r15
140129c77:     	movq	%rdx, %rsi
140129c7a:     	movq	%rcx, %r14
140129c7d:     	movq	0x460(%rbp), %rcx
140129c84:     	movq	0x458(%rbp), %r12
140129c8b:     	movq	0x450(%rbp), %rdi
140129c92:     	movb	%r9b, 0x337(%rbp)
140129c99:     	movq	0x20(%r12), %rdx
140129c9e:     	movq	0x28(%r12), %r8
140129ca3:     	movq	%rdx, -0x58(%rbp)
140129ca7:     	movq	%r8, -0x50(%rbp)
140129cab:     	callq	0x1458e1f90 <.text+0x58e0f90>
140129cb0:     	movb	%al, 0x336(%rbp)
140129cb6:     	xorps	%xmm0, %xmm0
140129cb9:     	movaps	%xmm0, 0x60(%rbp)
140129cbd:     	movaps	%xmm0, 0x50(%rbp)
140129cc1:     	movaps	%xmm0, 0x40(%rbp)
140129cc5:     	movaps	%xmm0, 0x30(%rbp)
140129cc9:     	movaps	%xmm0, 0x20(%rbp)
140129ccd:     	movq	$0x0, 0x70(%rbp)
140129cd5:     	movups	0x5c8019c(%rip), %xmm0  # 0x145da9e78
140129cdc:     	movups	%xmm0, 0x78(%rbp)
140129ce0:     	movups	0x5c801a1(%rip), %xmm0  # 0x145da9e88
140129ce7:     	movups	%xmm0, 0x88(%rbp)
140129cee:     	movups	0x5c801a3(%rip), %xmm0  # 0x145da9e98
140129cf5:     	movups	%xmm0, 0x98(%rbp)
140129cfc:     	movups	0x5c801a5(%rip), %xmm0  # 0x145da9ea8
140129d03:     	movups	%xmm0, 0xa8(%rbp)
140129d0a:     	movups	0x5c801a7(%rip), %xmm0  # 0x145da9eb8
140129d11:     	movups	%xmm0, 0xb8(%rbp)
140129d18:     	movups	0x5c801a9(%rip), %xmm0  # 0x145da9ec8
140129d1f:     	movups	%xmm0, 0xc8(%rbp)
140129d26:     	movups	0x5c801ba(%rip), %xmm10 # 0x145da9ee8
140129d2e:     	movups	%xmm10, 0xe8(%rbp)
140129d36:     	movups	0x5c8019a(%rip), %xmm11 # 0x145da9ed8
140129d3e:     	movups	%xmm11, 0xd8(%rbp)
140129d46:     	movups	0x5c80072(%rip), %xmm13 # 0x145da9dc0
140129d4e:     	movaps	%xmm13, -0x40(%rbp)
140129d53:     	movq	$0x0, -0x30(%rbp)
140129d5b:     	movups	0x5c80075(%rip), %xmm14 # 0x145da9dd8
140129d63:     	movups	%xmm14, -0x28(%rbp)
140129d68:     	movq	$0x0, -0x18(%rbp)
140129d70:     	movups	0x5c80078(%rip), %xmm15 # 0x145da9df0
140129d78:     	movaps	%xmm15, -0x10(%rbp)
140129d7d:     	movq	$0x0, (%rbp)
140129d85:     	movups	0x5c8007c(%rip), %xmm6  # 0x145da9e08
140129d8c:     	movups	%xmm6, 0x8(%rbp)
140129d90:     	movq	$0x0, 0x18(%rbp)
140129d98:     	movq	(%r14), %rbx
140129d9b:     	leaq	0x8(%r14), %r13
140129d9f:     	leaq	0x148(%rbp), %rcx
140129da6:     	leaq	-0x40(%rbp), %rdx
140129daa:     	movl	$0x138, %r8d            # imm = 0x138
140129db0:     	callq	0x145bc977b <.text+0x5bc877b>
140129db5:     	movaps	0x5c434a3(%rip), %xmm12 # 0x145d6d260
140129dbd:     	movups	%xmm12, 0x280(%rbp)
140129dc5:     	movl	$0x1, 0x290(%rbp)
140129dcf:     	movss	0x5c43499(%rip), %xmm0  # 0x145d6d270
140129dd7:     	movlps	%xmm0, 0x294(%rbp)
140129dde:     	movb	$0x1, 0x29c(%rbp)
140129de5:     	movq	$0x0, 0x2a0(%rbp)
140129df0:     	movl	$0x3f800000, 0x2a8(%rbp) # imm = 0x3F800000
140129dfa:     	movw	$0x0, 0x2ac(%rbp)
140129e03:     	movl	$0x10000, 0x2ae(%rbp)   # imm = 0x10000
140129e0d:     	movw	$0x0, 0x2b2(%rbp)
140129e16:     	movl	$0x10000, 0x2b4(%rbp)   # imm = 0x10000
140129e20:     	movw	$0x0, 0x2b8(%rbp)
140129e29:     	movq	$0x0, 0x2ba(%rbp)
140129e34:     	movl	$0x5, 0x2c2(%rbp)
140129e3e:     	movq	%rbx, 0x140(%rbp)
140129e45:     	leaq	0x5c44164(%rip), %r9    # 0x145d6dfb0
140129e4c:     	leaq	0x2e0(%rbp), %rbx
140129e53:     	leaq	0x140(%rbp), %r8
140129e5a:     	movq	%rbx, %rcx
140129e5d:     	movq	%r13, -0x48(%rbp)
140129e61:     	movq	%r13, %rdx
140129e64:     	callq	0x140189f40 <.text+0x188f40>
140129e69:     	movq	%r12, 0x140(%rbp)
140129e70:     	movq	%r15, 0x148(%rbp)
140129e77:     	movq	%rsi, 0x150(%rbp)
140129e7e:     	leaq	0x336(%rbp), %rax
140129e85:     	movq	%rax, 0x158(%rbp)
140129e8c:     	leaq	0x140(%rbp), %rdx
140129e93:     	movq	%rbx, %rcx
140129e96:     	callq	0x140218ed0 <.text+0x217ed0>
140129e9b:     	movzbl	0x337(%rbp), %r15d
140129ea3:     	movl	%r15d, %ecx
140129ea6:     	callq	0x1458e6170 <.text+0x58e5170>
140129eab:     	testq	%rax, %rax
140129eae:     	je	0x140129ee4 <.text+0x128ee4>
140129eb0:     	cmpq	$0x3, %rdi
140129eb4:     	jae	0x14012aed2 <.text+0x129ed2>
140129eba:     	movq	%rdi, %rcx
140129ebd:     	shlq	$0x6, %rcx
140129ec1:     	addq	%rcx, %rax
140129ec4:     	movq	%rax, %rcx
140129ec7:     	callq	0x1458df560 <.text+0x58de560>
140129ecc:     	movq	%rax, 0x100(%rbp)
140129ed3:     	movq	%rdx, 0x108(%rbp)
140129eda:     	movzbl	0x337(%rbp), %r15d
140129ee2:     	jmp	0x140129efa <.text+0x128efa>
140129ee4:     	movq	$0x1, 0x100(%rbp)
140129eef:     	movq	$0x0, 0x108(%rbp)
140129efa:     	movq	0x460(%rbp), %r12
140129f01:     	movq	0x458(%rbp), %rax
140129f08:     	movzbl	0x70(%rax), %r9d
140129f0d:     	leal	(%r9,%r9,4), %eax
140129f11:     	movl	%eax, 0x314(%rbp)
140129f17:     	movq	%r12, %rcx
140129f1a:     	movl	%r15d, %edx
140129f1d:     	movq	%rdi, %r8
140129f20:     	callq	0x1458e29a0 <.text+0x58e19a0>
140129f25:     	cmpl	0x314(%rbp), %eax
140129f2b:     	jae	0x14012a0f3 <.text+0x1290f3>
140129f31:     	leaq	0x5c80af0(%rip), %rcx   # 0x145daaa28
140129f38:     	movl	$0x1e, %edx
140129f3d:     	callq	0x1458da4e0 <.text+0x58d94e0>
140129f42:     	movq	%rdx, %r8
140129f45:     	leaq	0x5c80afa(%rip), %rcx   # 0x145daaa46
140129f4c:     	movq	%rcx, -0x40(%rbp)
140129f50:     	movq	$0x4, -0x38(%rbp)
140129f58:     	leaq	0x314(%rbp), %rcx
140129f5f:     	movq	%rcx, -0x30(%rbp)
140129f63:     	leaq	0x5c8083e(%rip), %rcx   # 0x145daa7a8
140129f6a:     	movq	%rcx, -0x28(%rbp)
140129f6e:     	leaq	0x5c80ad5(%rip), %rcx   # 0x145daaa4a
140129f75:     	movq	%rcx, -0x20(%rbp)
140129f79:     	movq	$0x2, -0x18(%rbp)
140129f81:     	leaq	0x100(%rbp), %rcx
140129f88:     	movq	%rcx, -0x10(%rbp)
140129f8c:     	leaq	0x5c80455(%rip), %rcx   # 0x145daa3e8
140129f93:     	movq	%rcx, -0x8(%rbp)
140129f97:     	movq	$0x2, 0x20(%rsp)
140129fa0:     	leaq	0x2e0(%rbp), %rcx
140129fa7:     	leaq	-0x40(%rbp), %r9
140129fab:     	movq	%rax, %rdx
140129fae:     	callq	0x1458da940 <.text+0x58d9940>
140129fb3:     	cmpb	$0x1, (%rsi)
140129fb6:     	jne	0x140129fd6 <.text+0x128fd6>
140129fb8:     	movl	0x1(%rsi), %eax
140129fbb:     	movl	0x4(%rsi), %ecx
140129fbe:     	movl	%ecx, 0x323(%rbp)
140129fc4:     	movl	%eax, 0x320(%rbp)
140129fca:     	movq	0x8(%rsi), %rax
140129fce:     	movzbl	0x10(%rsi), %edx
140129fd2:     	movb	$0x1, %cl
140129fd4:     	jmp	0x140129fe6 <.text+0x128fe6>
140129fd6:     	movq	0x8(%rsi), %rax
140129fda:     	lock
140129fdb:     	incq	(%rax)
140129fde:     	jle	0x14012aed0 <.text+0x129ed0>
140129fe4:     	xorl	%ecx, %ecx
140129fe6:     	movq	0x2f0(%rbp), %r8
140129fed:     	movq	%r8, 0x158(%rbp)
140129ff4:     	movups	0x2e0(%rbp), %xmm0
140129ffb:     	movups	%xmm0, 0x148(%rbp)
14012a002:     	movl	0x320(%rbp), %r8d
14012a009:     	movl	0x323(%rbp), %r9d
14012a010:     	movl	%r8d, 0x179(%rbp)
14012a017:     	movl	%r9d, 0x17c(%rbp)
14012a01e:     	movups	0x5c8030b(%rip), %xmm0  # 0x145daa330
14012a025:     	movups	%xmm0, 0x111(%rbp)
14012a02c:     	movl	$0x3f800000, 0x121(%rbp) # imm = 0x3F800000
14012a036:     	movq	(%r14), %r8
14012a039:     	movq	$0x0, 0x160(%rbp)
14012a044:     	movq	$0x4, 0x168(%rbp)
14012a04f:     	movq	$0x0, 0x170(%rbp)
14012a05a:     	movb	%cl, 0x178(%rbp)
14012a060:     	movq	%rax, 0x180(%rbp)
14012a067:     	movq	%rdx, 0x188(%rbp)
14012a06e:     	movl	$0x41500000, 0x190(%rbp) # imm = 0x41500000
14012a078:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012a081:     	movb	$0x1, 0x196(%rbp)
14012a088:     	movups	0x110(%rbp), %xmm0
14012a08f:     	movups	%xmm0, 0x197(%rbp)
14012a096:     	movq	0x11d(%rbp), %rax
14012a09d:     	movq	%rax, 0x1a4(%rbp)
14012a0a4:     	movups	0x5c4422d(%rip), %xmm0  # 0x145d6e2d8
14012a0ab:     	movups	%xmm0, 0x1ac(%rbp)
14012a0b2:     	movl	0x5c44230(%rip), %eax   # 0x145d6e2e8
14012a0b8:     	movl	%eax, 0x1bc(%rbp)
14012a0be:     	movsd	0x5c4310a(%rip), %xmm0  # 0x145d6d1d0
14012a0c6:     	movsd	%xmm0, 0x1c0(%rbp)
14012a0ce:     	movq	%r8, 0x140(%rbp)
14012a0d5:     	leaq	0x5c43ed4(%rip), %r9    # 0x145d6dfb0
14012a0dc:     	leaq	0x2e0(%rbp), %rcx
14012a0e3:     	leaq	0x140(%rbp), %r8
14012a0ea:     	leaq	0x8(%r14), %rdx
14012a0ee:     	callq	0x14018ef20 <.text+0x18df20>
14012a0f3:     	leaq	-0x40(%rbp), %rcx
14012a0f7:     	movq	0x458(%rbp), %r15
14012a0fe:     	movq	%r15, %rdx
14012a101:     	callq	0x1458e0c50 <.text+0x58dfc50>
14012a106:     	movups	-0x40(%rbp), %xmm0
14012a10a:     	movups	-0x30(%rbp), %xmm1
14012a10e:     	movups	-0x20(%rbp), %xmm2
14012a112:     	movaps	%xmm2, 0x160(%rbp)
14012a119:     	movaps	%xmm1, 0x150(%rbp)
14012a120:     	movaps	%xmm0, 0x140(%rbp)
14012a127:     	leaq	0x337(%rbp), %rax
14012a12e:     	movq	%rax, 0x170(%rbp)
14012a135:     	leaq	0x110(%rbp), %rcx
14012a13c:     	leaq	0x140(%rbp), %rdx
14012a143:     	callq	0x14025e250 <.text+0x25d250>
14012a148:     	movq	0x118(%rbp), %rax
14012a14f:     	movq	%rax, 0x318(%rbp)
14012a156:     	movq	0x120(%rbp), %rdi
14012a15d:     	movzbl	0x337(%rbp), %edx
14012a164:     	testq	%rdi, %rdi
14012a167:     	je	0x14012a286 <.text+0x129286>
14012a16d:     	movq	%r12, %rcx
14012a170:     	movq	%r15, %r8
14012a173:     	callq	0x1458e2af0 <.text+0x58e1af0>
14012a178:     	nop
14012a179:     	testb	%al, %al
14012a17b:     	jne	0x14012a489 <.text+0x129489>
14012a181:     	movq	0x318(%rbp), %rdx
14012a188:     	leaq	(%rdx,%rdi,8), %r8
14012a18c:     	leaq	-0x40(%rbp), %rcx
14012a190:     	callq	0x140263fc0 <.text+0x262fc0>
14012a195:     	nop
14012a196:     	movq	-0x38(%rbp), %rax
14012a19a:     	movq	%rax, 0x138(%rbp)
14012a1a1:     	movq	-0x30(%rbp), %rdi
14012a1a5:     	leaq	0x5c808a0(%rip), %rcx   # 0x145daaa4c
14012a1ac:     	movl	$0x4, %edx
14012a1b1:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012a1b6:     	nop
14012a1b7:     	movq	%rdx, 0x20(%rsp)
14012a1bc:     	leaq	0x140(%rbp), %rcx
14012a1c3:     	movq	0x138(%rbp), %rdx
14012a1ca:     	movq	%rdi, %r8
14012a1cd:     	movq	%rax, %r9
14012a1d0:     	callq	0x140116700 <.text+0x115700>
14012a1d5:     	nop
14012a1d6:     	movq	0x138(%rbp), %rcx
14012a1dd:     	movq	0x150(%rbp), %rax
14012a1e4:     	movq	%rax, 0x2f0(%rbp)
14012a1eb:     	movups	0x140(%rbp), %xmm0
14012a1f2:     	movaps	%xmm0, 0x2e0(%rbp)
14012a1f9:     	movq	-0x40(%rbp), %rdx
14012a1fd:     	testq	%rdx, %rdx
14012a200:     	je	0x14012a211 <.text+0x129211>
14012a202:     	shlq	$0x4, %rdx
14012a206:     	movl	$0x8, %r8d
14012a20c:     	callq	0x1400021d0 <.text+0x11d0>
14012a211:     	movq	0x318(%rbp), %rax
14012a218:     	movq	(%rax), %rax
14012a21b:     	cmpb	$0x1, 0x72(%rax)
14012a21f:     	jne	0x14012a297 <.text+0x129297>
14012a221:     	leaq	0x5c80828(%rip), %rcx   # 0x145daaa50
14012a228:     	movl	$0x19, %edx
14012a22d:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012a232:     	nop
14012a233:     	movq	%rdx, %r8
14012a236:     	leaq	0x5c80144(%rip), %rcx   # 0x145daa381
14012a23d:     	movq	%rcx, 0x140(%rbp)
14012a244:     	movq	$0x4, 0x148(%rbp)
14012a24f:     	movq	%rbx, 0x150(%rbp)
14012a256:     	leaq	0x5c80813(%rip), %rcx   # 0x145daaa70
14012a25d:     	movq	%rcx, 0x158(%rbp)
14012a264:     	movq	$0x1, 0x20(%rsp)
14012a26d:     	leaq	-0x40(%rbp), %rcx
14012a271:     	leaq	0x140(%rbp), %r9
14012a278:     	movq	%rax, %rdx
14012a27b:     	callq	0x1458da940 <.text+0x58d9940>
14012a280:     	nop
14012a281:     	jmp	0x14012a333 <.text+0x129333>
14012a286:     	movq	%r12, %rcx
14012a289:     	movq	%r15, %r8
14012a28c:     	callq	0x1458e2af0 <.text+0x58e1af0>
14012a291:     	nop
14012a292:     	jmp	0x14012a489 <.text+0x129489>
14012a297:     	leaq	0x5c807f2(%rip), %rcx   # 0x145daaa90
14012a29e:     	movl	$0x1c, %edx
14012a2a3:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012a2a8:     	nop
14012a2a9:     	movq	%rdx, %r8
14012a2ac:     	movq	0x318(%rbp), %rcx
14012a2b3:     	movq	(%rcx), %rcx
14012a2b6:     	addq	$0x72, %rcx
14012a2ba:     	leaq	0x5c80017(%rip), %rdx   # 0x145daa2d8
14012a2c1:     	movq	%rdx, 0x140(%rbp)
14012a2c8:     	movq	$0x1, 0x148(%rbp)
14012a2d3:     	movq	%rcx, 0x150(%rbp)
14012a2da:     	leaq	0x5c807cf(%rip), %rcx   # 0x145daaab0
14012a2e1:     	movq	%rcx, 0x158(%rbp)
14012a2e8:     	leaq	0x5c80092(%rip), %rcx   # 0x145daa381
14012a2ef:     	movq	%rcx, 0x160(%rbp)
14012a2f6:     	movq	$0x4, 0x168(%rbp)
14012a301:     	movq	%rbx, 0x170(%rbp)
14012a308:     	leaq	0x5c80761(%rip), %rcx   # 0x145daaa70
14012a30f:     	movq	%rcx, 0x178(%rbp)
14012a316:     	movq	$0x2, 0x20(%rsp)
14012a31f:     	leaq	-0x40(%rbp), %rcx
14012a323:     	leaq	0x140(%rbp), %r9
14012a32a:     	movq	%rax, %rdx
14012a32d:     	callq	0x1458da940 <.text+0x58d9940>
14012a332:     	nop
14012a333:     	cmpb	$0x1, (%rsi)
14012a336:     	jne	0x14012a356 <.text+0x129356>
14012a338:     	movl	0x1(%rsi), %eax
14012a33b:     	movl	0x4(%rsi), %ecx
14012a33e:     	movl	%ecx, 0x12b(%rbp)
14012a344:     	movl	%eax, 0x128(%rbp)
14012a34a:     	movq	0x8(%rsi), %rax
14012a34e:     	movzbl	0x10(%rsi), %edx
14012a352:     	movb	$0x1, %cl
14012a354:     	jmp	0x14012a366 <.text+0x129366>
14012a356:     	movq	0x8(%rsi), %rax
14012a35a:     	lock
14012a35b:     	incq	(%rax)
14012a35e:     	jle	0x14012aed0 <.text+0x129ed0>
14012a364:     	xorl	%ecx, %ecx
14012a366:     	movq	-0x30(%rbp), %r8
14012a36a:     	movq	%r8, 0x158(%rbp)
14012a371:     	movups	-0x40(%rbp), %xmm0
14012a375:     	movups	%xmm0, 0x148(%rbp)
14012a37c:     	movl	0x128(%rbp), %r8d
14012a383:     	movl	0x12b(%rbp), %r9d
14012a38a:     	movl	%r8d, 0x179(%rbp)
14012a391:     	movl	%r9d, 0x17c(%rbp)
14012a398:     	movups	0x5c7ff91(%rip), %xmm0  # 0x145daa330
14012a39f:     	movups	%xmm0, 0x321(%rbp)
14012a3a6:     	movl	$0x3f800000, 0x331(%rbp) # imm = 0x3F800000
14012a3b0:     	movq	(%r14), %r8
14012a3b3:     	movq	$0x0, 0x160(%rbp)
14012a3be:     	movq	$0x4, 0x168(%rbp)
14012a3c9:     	movq	$0x0, 0x170(%rbp)
14012a3d4:     	movb	%cl, 0x178(%rbp)
14012a3da:     	movq	%rax, 0x180(%rbp)
14012a3e1:     	movq	%rdx, 0x188(%rbp)
14012a3e8:     	movl	$0x41500000, 0x190(%rbp) # imm = 0x41500000
14012a3f2:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012a3fb:     	movb	$0x1, 0x196(%rbp)
14012a402:     	movups	0x320(%rbp), %xmm0
14012a409:     	movups	%xmm0, 0x197(%rbp)
14012a410:     	movq	0x32d(%rbp), %rax
14012a417:     	movq	%rax, 0x1a4(%rbp)
14012a41e:     	movups	0x5c43eb3(%rip), %xmm0  # 0x145d6e2d8
14012a425:     	movups	%xmm0, 0x1ac(%rbp)
14012a42c:     	movl	0x5c43eb6(%rip), %eax   # 0x145d6e2e8
14012a432:     	movl	%eax, 0x1bc(%rbp)
14012a438:     	movsd	0x5c42d90(%rip), %xmm0  # 0x145d6d1d0
14012a440:     	movsd	%xmm0, 0x1c0(%rbp)
14012a448:     	movq	%r8, 0x140(%rbp)
14012a44f:     	leaq	0x5c43b5a(%rip), %r9    # 0x145d6dfb0
14012a456:     	leaq	-0x40(%rbp), %rcx
14012a45a:     	leaq	0x140(%rbp), %r8
14012a461:     	leaq	0x8(%r14), %rdx
14012a465:     	callq	0x14018ef20 <.text+0x18df20>
14012a46a:     	nop
14012a46b:     	movq	0x2e0(%rbp), %rdx
14012a472:     	testq	%rdx, %rdx
14012a475:     	je	0x14012a489 <.text+0x129489>
14012a477:     	movq	0x2e8(%rbp), %rcx
14012a47e:     	movl	$0x1, %r8d
14012a484:     	callq	0x1400021d0 <.text+0x11d0>
14012a489:     	movzbl	0x337(%rbp), %edx
14012a490:     	movq	%r12, %rcx
14012a493:     	movq	-0x58(%rbp), %r8
14012a497:     	movq	-0x50(%rbp), %r9
14012a49b:     	callq	0x1458e2070 <.text+0x58e1070>
14012a4a0:     	nop
14012a4a1:     	movq	%rax, %r15
14012a4a4:     	testq	%rax, %rax
14012a4a7:     	je	0x14012a669 <.text+0x129669>
14012a4ad:     	leaq	0x5c8061c(%rip), %rcx   # 0x145daaad0
14012a4b4:     	movl	$0x18, %edx
14012a4b9:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012a4be:     	nop
14012a4bf:     	movq	%rax, %rdi
14012a4c2:     	movq	%rdx, %rbx
14012a4c5:     	movq	%r15, %rcx
14012a4c8:     	callq	0x1458e0c80 <.text+0x58dfc80>
14012a4cd:     	nop
14012a4ce:     	movq	%rax, 0x128(%rbp)
14012a4d5:     	movq	%rdx, 0x130(%rbp)
14012a4dc:     	leaq	0x5c7fe9e(%rip), %rax   # 0x145daa381
14012a4e3:     	movq	%rax, 0x2e0(%rbp)
14012a4ea:     	movq	$0x4, 0x2e8(%rbp)
14012a4f5:     	leaq	0x128(%rbp), %rax
14012a4fc:     	movq	%rax, 0x2f0(%rbp)
14012a503:     	leaq	0x5c7fede(%rip), %rax   # 0x145daa3e8
14012a50a:     	movq	%rax, 0x2f8(%rbp)
14012a511:     	movq	$0x1, 0x20(%rsp)
14012a51a:     	leaq	-0x40(%rbp), %rcx
14012a51e:     	leaq	0x2e0(%rbp), %r9
14012a525:     	movq	%rdi, %rdx
14012a528:     	movq	%rbx, %r8
14012a52b:     	callq	0x1458da940 <.text+0x58d9940>
14012a530:     	nop
14012a531:     	cmpb	$0x1, (%rsi)
14012a534:     	jne	0x14012a554 <.text+0x129554>
14012a536:     	movl	0x1(%rsi), %eax
14012a539:     	movl	0x4(%rsi), %ecx
14012a53c:     	movl	%ecx, 0x2db(%rbp)
14012a542:     	movl	%eax, 0x2d8(%rbp)
14012a548:     	movq	0x8(%rsi), %rax
14012a54c:     	movzbl	0x10(%rsi), %edx
14012a550:     	movb	$0x1, %cl
14012a552:     	jmp	0x14012a564 <.text+0x129564>
14012a554:     	movq	0x8(%rsi), %rax
14012a558:     	lock
14012a559:     	incq	(%rax)
14012a55c:     	jle	0x14012aed0 <.text+0x129ed0>
14012a562:     	xorl	%ecx, %ecx
14012a564:     	movq	-0x30(%rbp), %r8
14012a568:     	movq	%r8, 0x158(%rbp)
14012a56f:     	movups	-0x40(%rbp), %xmm0
14012a573:     	movups	%xmm0, 0x148(%rbp)
14012a57a:     	movl	0x2d8(%rbp), %r8d
14012a581:     	movl	0x2db(%rbp), %r9d
14012a588:     	movl	%r8d, 0x179(%rbp)
14012a58f:     	movl	%r9d, 0x17c(%rbp)
14012a596:     	movups	0x5c7fd93(%rip), %xmm0  # 0x145daa330
14012a59d:     	movups	%xmm0, 0x321(%rbp)
14012a5a4:     	movl	$0x3f800000, 0x331(%rbp) # imm = 0x3F800000
14012a5ae:     	movq	(%r14), %r8
14012a5b1:     	movq	$0x0, 0x160(%rbp)
14012a5bc:     	movq	$0x4, 0x168(%rbp)
14012a5c7:     	movq	$0x0, 0x170(%rbp)
14012a5d2:     	movb	%cl, 0x178(%rbp)
14012a5d8:     	movq	%rax, 0x180(%rbp)
14012a5df:     	movq	%rdx, 0x188(%rbp)
14012a5e6:     	movl	$0x41500000, 0x190(%rbp) # imm = 0x41500000
14012a5f0:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012a5f9:     	movb	$0x1, 0x196(%rbp)
14012a600:     	movups	0x320(%rbp), %xmm0
14012a607:     	movups	%xmm0, 0x197(%rbp)
14012a60e:     	movq	0x32d(%rbp), %rax
14012a615:     	movq	%rax, 0x1a4(%rbp)
14012a61c:     	movups	0x5c43cb5(%rip), %xmm0  # 0x145d6e2d8
14012a623:     	movups	%xmm0, 0x1ac(%rbp)
14012a62a:     	movl	0x5c43cb8(%rip), %eax   # 0x145d6e2e8
14012a630:     	movl	%eax, 0x1bc(%rbp)
14012a636:     	movsd	0x5c42b92(%rip), %xmm0  # 0x145d6d1d0
14012a63e:     	movsd	%xmm0, 0x1c0(%rbp)
14012a646:     	movq	%r8, 0x140(%rbp)
14012a64d:     	leaq	0x5c4395c(%rip), %r9    # 0x145d6dfb0
14012a654:     	leaq	-0x40(%rbp), %rcx
14012a658:     	leaq	0x140(%rbp), %r8
14012a65f:     	leaq	0x8(%r14), %rdx
14012a663:     	callq	0x14018ef20 <.text+0x18df20>
14012a668:     	nop
14012a669:     	movzbl	0x336(%rbp), %r8d
14012a671:     	cmpb	$0x1, %r8b
14012a675:     	adcl	$0x0, %r8d
14012a679:     	leaq	-0x40(%rbp), %rcx
14012a67d:     	movq	0x458(%rbp), %rdx
14012a684:     	callq	0x1458e0cb0 <.text+0x58dfcb0>
14012a689:     	nop
14012a68a:     	movzbl	(%rsi), %r13d
14012a68e:     	cmpb	$0x1, %r13b
14012a692:     	jne	0x14012a6b2 <.text+0x1296b2>
14012a694:     	movl	0x1(%rsi), %eax
14012a697:     	movl	0x4(%rsi), %ecx
14012a69a:     	movl	%ecx, 0x323(%rbp)
14012a6a0:     	movl	%eax, 0x320(%rbp)
14012a6a6:     	movq	0x8(%rsi), %rax
14012a6aa:     	movzbl	0x10(%rsi), %edx
14012a6ae:     	movb	$0x1, %cl
14012a6b0:     	jmp	0x14012a6c2 <.text+0x1296c2>
14012a6b2:     	movq	0x8(%rsi), %rax
14012a6b6:     	lock
14012a6b7:     	incq	(%rax)
14012a6ba:     	jle	0x14012aed0 <.text+0x129ed0>
14012a6c0:     	xorl	%ecx, %ecx
14012a6c2:     	movq	-0x30(%rbp), %r8
14012a6c6:     	movq	%r8, 0x158(%rbp)
14012a6cd:     	movups	-0x40(%rbp), %xmm0
14012a6d1:     	movups	%xmm0, 0x148(%rbp)
14012a6d8:     	movl	0x320(%rbp), %r8d
14012a6df:     	movl	0x323(%rbp), %r9d
14012a6e6:     	movl	%r8d, 0x179(%rbp)
14012a6ed:     	movl	%r9d, 0x17c(%rbp)
14012a6f4:     	movups	0x5c7fbf4(%rip), %xmm9  # 0x145daa2f0
14012a6fc:     	movups	%xmm9, 0x2e1(%rbp)
14012a704:     	movl	$0x3f800000, 0x2f1(%rbp) # imm = 0x3F800000
14012a70e:     	movq	(%r14), %r8
14012a711:     	movq	$0x0, 0x160(%rbp)
14012a71c:     	movq	$0x4, 0x168(%rbp)
14012a727:     	movq	$0x0, 0x170(%rbp)
14012a732:     	movb	%cl, 0x178(%rbp)
14012a738:     	movq	%rax, 0x180(%rbp)
14012a73f:     	movq	%rdx, 0x188(%rbp)
14012a746:     	movl	$0x41600000, 0x190(%rbp) # imm = 0x41600000
14012a750:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012a759:     	movb	$0x1, 0x196(%rbp)
14012a760:     	movups	0x2e0(%rbp), %xmm0
14012a767:     	movups	%xmm0, 0x197(%rbp)
14012a76e:     	movq	0x2ed(%rbp), %rax
14012a775:     	movq	%rax, 0x1a4(%rbp)
14012a77c:     	movups	0x5c43b55(%rip), %xmm7  # 0x145d6e2d8
14012a783:     	movups	%xmm7, 0x1ac(%rbp)
14012a78a:     	movl	0x5c43b57(%rip), %r15d  # 0x145d6e2e8
14012a791:     	movl	%r15d, 0x1bc(%rbp)
14012a798:     	movsd	0x5c42a2f(%rip), %xmm8  # 0x145d6d1d0
14012a7a1:     	movsd	%xmm8, 0x1c0(%rbp)
14012a7aa:     	movq	%r8, 0x140(%rbp)
14012a7b1:     	leaq	0x5c437f8(%rip), %r9    # 0x145d6dfb0
14012a7b8:     	leaq	-0x40(%rbp), %rcx
14012a7bc:     	leaq	0x140(%rbp), %r8
14012a7c3:     	leaq	0x8(%r14), %rdx
14012a7c7:     	callq	0x14018ef20 <.text+0x18df20>
14012a7cc:     	nop
14012a7cd:     	movzbl	0x336(%rbp), %eax
14012a7d4:     	testb	%al, %al
14012a7d6:     	movq	0x458(%rbp), %rcx
14012a7dd:     	je	0x14012aac0 <.text+0x129ac0>
14012a7e3:     	cmpb	0x72(%rcx), %al
14012a7e6:     	jae	0x14012aac0 <.text+0x129ac0>
14012a7ec:     	leaq	0x5c802f5(%rip), %rcx   # 0x145daaae8
14012a7f3:     	movl	$0xa, %edx
14012a7f8:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012a7fd:     	nop
14012a7fe:     	movq	%rdx, %rdi
14012a801:     	testq	%rdx, %rdx
14012a804:     	jns	0x14012a81a <.text+0x12981a>
14012a806:     	xorl	%r12d, %r12d
14012a809:     	movq	%r12, %rcx
14012a80c:     	movq	%rdi, %rdx
14012a80f:     	callq	0x145d6944b <.text+0x5d6844b>
14012a814:     	nop
14012a815:     	jmp	0x14012aed0 <.text+0x129ed0>
14012a81a:     	testq	%rdi, %rdi
14012a81d:     	je	0x14012a87b <.text+0x12987b>
14012a81f:     	movq	%rax, %r15
14012a822:     	callq	0x140002200 <.text+0x1200>
14012a827:     	movl	$0x1, %r12d
14012a82d:     	movl	$0x1, %edx
14012a832:     	movq	%rdi, %rcx
14012a835:     	callq	0x1400021c0 <.text+0x11c0>
14012a83a:     	testq	%rax, %rax
14012a83d:     	je	0x14012a809 <.text+0x129809>
14012a83f:     	movq	%rax, %rbx
14012a842:     	movq	%rax, %rcx
14012a845:     	movq	%r15, %rdx
14012a848:     	movq	%rdi, %r8
14012a84b:     	callq	0x145bc977b <.text+0x5bc877b>
14012a850:     	movq	0x460(%rbp), %r12
14012a857:     	movl	0x5c43a8a(%rip), %r15d  # 0x145d6e2e8
14012a85e:     	testb	%r13b, %r13b
14012a861:     	je	0x14012a885 <.text+0x129885>
14012a863:     	movl	0x1(%rsi), %eax
14012a866:     	movl	0x4(%rsi), %ecx
14012a869:     	movl	%ecx, -0x3d(%rbp)
14012a86c:     	movl	%eax, -0x40(%rbp)
14012a86f:     	movq	0x8(%rsi), %rax
14012a873:     	movzbl	0x10(%rsi), %edx
14012a877:     	movb	$0x1, %cl
14012a879:     	jmp	0x14012a895 <.text+0x129895>
14012a87b:     	movl	$0x1, %ebx
14012a880:     	testb	%r13b, %r13b
14012a883:     	jne	0x14012a863 <.text+0x129863>
14012a885:     	movq	0x8(%rsi), %rax
14012a889:     	lock
14012a88a:     	incq	(%rax)
14012a88d:     	jle	0x14012aed0 <.text+0x129ed0>
14012a893:     	xorl	%ecx, %ecx
14012a895:     	movl	-0x40(%rbp), %r8d
14012a899:     	movl	-0x3d(%rbp), %r9d
14012a89d:     	movl	%r9d, 0x17c(%rbp)
14012a8a4:     	movl	%r8d, 0x179(%rbp)
14012a8ab:     	movups	0x5c7fea2(%rip), %xmm0  # 0x145daa754
14012a8b2:     	movups	%xmm0, 0x2e1(%rbp)
14012a8b9:     	movl	$0x3f800000, 0x2f1(%rbp) # imm = 0x3F800000
14012a8c3:     	movq	(%r14), %r8
14012a8c6:     	movq	%rdi, 0x148(%rbp)
14012a8cd:     	movq	%rbx, 0x150(%rbp)
14012a8d4:     	movq	%rdi, 0x158(%rbp)
14012a8db:     	movq	$0x0, 0x160(%rbp)
14012a8e6:     	movq	$0x4, 0x168(%rbp)
14012a8f1:     	movq	$0x0, 0x170(%rbp)
14012a8fc:     	movb	%cl, 0x178(%rbp)
14012a902:     	movq	%rax, 0x180(%rbp)
14012a909:     	movq	%rdx, 0x188(%rbp)
14012a910:     	movl	$0x41500000, 0x190(%rbp) # imm = 0x41500000
14012a91a:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012a923:     	movb	$0x1, 0x196(%rbp)
14012a92a:     	movups	0x2e0(%rbp), %xmm0
14012a931:     	movups	%xmm0, 0x197(%rbp)
14012a938:     	movq	0x2ed(%rbp), %rax
14012a93f:     	movq	%rax, 0x1a4(%rbp)
14012a946:     	movups	%xmm7, 0x1ac(%rbp)
14012a94d:     	movl	%r15d, 0x1bc(%rbp)
14012a954:     	movsd	%xmm8, 0x1c0(%rbp)
14012a95d:     	movq	%r8, 0x140(%rbp)
14012a964:     	leaq	0x5c43645(%rip), %r9    # 0x145d6dfb0
14012a96b:     	leaq	-0x40(%rbp), %rcx
14012a96f:     	leaq	0x140(%rbp), %r8
14012a976:     	leaq	0x8(%r14), %rdx
14012a97a:     	callq	0x14018ef20 <.text+0x18df20>
14012a97f:     	nop
14012a980:     	movzbl	0x336(%rbp), %r8d
14012a988:     	incb	%r8b
14012a98b:     	leaq	-0x40(%rbp), %rcx
14012a98f:     	movq	0x458(%rbp), %rdx
14012a996:     	callq	0x1458e0cb0 <.text+0x58dfcb0>
14012a99b:     	nop
14012a99c:     	testb	%r13b, %r13b
14012a99f:     	je	0x14012a9bf <.text+0x1299bf>
14012a9a1:     	movl	0x1(%rsi), %eax
14012a9a4:     	movl	0x4(%rsi), %ecx
14012a9a7:     	movl	%ecx, 0x2d3(%rbp)
14012a9ad:     	movl	%eax, 0x2d0(%rbp)
14012a9b3:     	movq	0x8(%rsi), %rax
14012a9b7:     	movzbl	0x10(%rsi), %ecx
14012a9bb:     	movb	$0x1, %dl
14012a9bd:     	jmp	0x14012a9cf <.text+0x1299cf>
14012a9bf:     	movq	0x8(%rsi), %rax
14012a9c3:     	lock
14012a9c4:     	incq	(%rax)
14012a9c7:     	jle	0x14012aed0 <.text+0x129ed0>
14012a9cd:     	xorl	%edx, %edx
14012a9cf:     	movq	-0x30(%rbp), %r8
14012a9d3:     	movq	%r8, 0x158(%rbp)
14012a9da:     	movups	-0x40(%rbp), %xmm0
14012a9de:     	movups	%xmm0, 0x148(%rbp)
14012a9e5:     	movups	%xmm9, 0x2e1(%rbp)
14012a9ed:     	movl	$0x3f800000, 0x2f1(%rbp) # imm = 0x3F800000
14012a9f7:     	movq	(%r14), %r8
14012a9fa:     	movq	$0x0, 0x160(%rbp)
14012aa05:     	movq	$0x4, 0x168(%rbp)
14012aa10:     	movq	$0x0, 0x170(%rbp)
14012aa1b:     	movb	%dl, 0x178(%rbp)
14012aa21:     	movl	0x2d0(%rbp), %edx
14012aa27:     	movl	0x2d3(%rbp), %r9d
14012aa2e:     	movl	%edx, 0x179(%rbp)
14012aa34:     	movl	%r9d, 0x17c(%rbp)
14012aa3b:     	movq	%rax, 0x180(%rbp)
14012aa42:     	movq	%rcx, 0x188(%rbp)
14012aa49:     	movl	$0x41600000, 0x190(%rbp) # imm = 0x41600000
14012aa53:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012aa5c:     	movb	$0x1, 0x196(%rbp)
14012aa63:     	movups	0x2e0(%rbp), %xmm0
14012aa6a:     	movups	%xmm0, 0x197(%rbp)
14012aa71:     	movq	0x2ed(%rbp), %rax
14012aa78:     	movq	%rax, 0x1a4(%rbp)
14012aa7f:     	movups	%xmm7, 0x1ac(%rbp)
14012aa86:     	movl	%r15d, 0x1bc(%rbp)
14012aa8d:     	movsd	%xmm8, 0x1c0(%rbp)
14012aa96:     	movq	%r8, 0x140(%rbp)
14012aa9d:     	leaq	0x5c4350c(%rip), %r9    # 0x145d6dfb0
14012aaa4:     	leaq	-0x40(%rbp), %rcx
14012aaa8:     	leaq	0x140(%rbp), %r8
14012aaaf:     	leaq	0x8(%r14), %rdx
14012aab3:     	callq	0x14018ef20 <.text+0x18df20>
14012aab8:     	nop
14012aab9:     	movq	0x458(%rbp), %rcx
14012aac0:     	callq	0x1458e13b0 <.text+0x58e03b0>
14012aac5:     	nop
14012aac6:     	testb	%al, %al
14012aac8:     	je	0x14012ac6c <.text+0x129c6c>
14012aace:     	leaq	0x5c8001d(%rip), %rcx   # 0x145daaaf2
14012aad5:     	movl	$0x2d, %edx
14012aada:     	callq	0x1458da4e0 <.text+0x58d94e0>
14012aadf:     	nop
14012aae0:     	movq	%rdx, %rdi
14012aae3:     	testq	%rdx, %rdx
14012aae6:     	jns	0x14012aafc <.text+0x129afc>
14012aae8:     	xorl	%r12d, %r12d
14012aaeb:     	movq	%r12, %rcx
14012aaee:     	movq	%rdi, %rdx
14012aaf1:     	callq	0x145d6944b <.text+0x5d6844b>
14012aaf6:     	nop
14012aaf7:     	jmp	0x14012aed0 <.text+0x129ed0>
14012aafc:     	testq	%rdi, %rdi
14012aaff:     	je	0x14012ab63 <.text+0x129b63>
14012ab01:     	movq	%rax, %r15
14012ab04:     	callq	0x140002200 <.text+0x1200>
14012ab09:     	movl	$0x1, %r12d
14012ab0f:     	movl	$0x1, %edx
14012ab14:     	movq	%rdi, %rcx
14012ab17:     	callq	0x1400021c0 <.text+0x11c0>
14012ab1c:     	testq	%rax, %rax
14012ab1f:     	je	0x14012aaeb <.text+0x129aeb>
14012ab21:     	movq	%rax, %rbx
14012ab24:     	movq	%rax, %rcx
14012ab27:     	movq	%r15, %rdx
14012ab2a:     	movq	%rdi, %r8
14012ab2d:     	callq	0x145bc977b <.text+0x5bc877b>
14012ab32:     	movq	0x460(%rbp), %r12
14012ab39:     	movl	0x5c437a8(%rip), %r15d  # 0x145d6e2e8
14012ab40:     	testb	%r13b, %r13b
14012ab43:     	je	0x14012ab6d <.text+0x129b6d>
14012ab45:     	movl	0x1(%rsi), %eax
14012ab48:     	movl	0x4(%rsi), %ecx
14012ab4b:     	movl	%ecx, 0x2cb(%rbp)
14012ab51:     	movl	%eax, 0x2c8(%rbp)
14012ab57:     	movq	0x8(%rsi), %rax
14012ab5b:     	movzbl	0x10(%rsi), %ecx
14012ab5f:     	movb	$0x1, %dl
14012ab61:     	jmp	0x14012ab7d <.text+0x129b7d>
14012ab63:     	movl	$0x1, %ebx
14012ab68:     	testb	%r13b, %r13b
14012ab6b:     	jne	0x14012ab45 <.text+0x129b45>
14012ab6d:     	movq	0x8(%rsi), %rax
14012ab71:     	lock
14012ab72:     	incq	(%rax)
14012ab75:     	jle	0x14012aed0 <.text+0x129ed0>
14012ab7b:     	xorl	%edx, %edx
14012ab7d:     	movups	0x5c7ff9c(%rip), %xmm0  # 0x145daab20
14012ab84:     	movups	%xmm0, 0x2e1(%rbp)
14012ab8b:     	movl	$0x3f800000, 0x2f1(%rbp) # imm = 0x3F800000
14012ab95:     	movq	(%r14), %r8
14012ab98:     	movq	%rdi, 0x148(%rbp)
14012ab9f:     	movq	%rbx, 0x150(%rbp)
14012aba6:     	movq	%rdi, 0x158(%rbp)
14012abad:     	movq	$0x0, 0x160(%rbp)
14012abb8:     	movq	$0x4, 0x168(%rbp)
14012abc3:     	movq	$0x0, 0x170(%rbp)
14012abce:     	movb	%dl, 0x178(%rbp)
14012abd4:     	movl	0x2c8(%rbp), %edx
14012abda:     	movl	0x2cb(%rbp), %r9d
14012abe1:     	movl	%edx, 0x179(%rbp)
14012abe7:     	movl	%r9d, 0x17c(%rbp)
14012abee:     	movq	%rax, 0x180(%rbp)
14012abf5:     	movq	%rcx, 0x188(%rbp)
14012abfc:     	movl	$0x41400000, 0x190(%rbp) # imm = 0x41400000
14012ac06:     	movw	$0x190, 0x194(%rbp)     # imm = 0x190
14012ac0f:     	movb	$0x1, 0x196(%rbp)
14012ac16:     	movups	0x2e0(%rbp), %xmm0
14012ac1d:     	movups	%xmm0, 0x197(%rbp)
14012ac24:     	movq	0x2ed(%rbp), %rax
14012ac2b:     	movq	%rax, 0x1a4(%rbp)
14012ac32:     	movl	%r15d, 0x1bc(%rbp)
14012ac39:     	movups	%xmm7, 0x1ac(%rbp)
14012ac40:     	movsd	%xmm8, 0x1c0(%rbp)
14012ac49:     	movq	%r8, 0x140(%rbp)
14012ac50:     	leaq	0x5c43359(%rip), %r9    # 0x145d6dfb0
14012ac57:     	leaq	-0x40(%rbp), %rcx
14012ac5b:     	leaq	0x140(%rbp), %r8
14012ac62:     	leaq	0x8(%r14), %rdx
14012ac66:     	callq	0x14018ef20 <.text+0x18df20>
14012ac6b:     	nop
14012ac6c:     	cmpb	$0x0, 0x470(%rbp)
14012ac73:     	jne	0x14012ae4c <.text+0x129e4c>
14012ac79:     	xorps	%xmm0, %xmm0
14012ac7c:     	movaps	%xmm0, 0x60(%rbp)
14012ac80:     	movaps	%xmm0, 0x50(%rbp)
14012ac84:     	movaps	%xmm0, 0x40(%rbp)
14012ac88:     	movaps	%xmm0, 0x30(%rbp)
14012ac8c:     	movaps	%xmm0, 0x20(%rbp)
14012ac90:     	movq	$0x0, 0x70(%rbp)
14012ac98:     	movw	$0x0, 0x2c4(%rbp)
14012aca1:     	movl	$0x0, 0x2c0(%rbp)
14012acab:     	movaps	%xmm13, -0x40(%rbp)
14012acb0:     	movq	$0x0, -0x30(%rbp)
14012acb8:     	movups	%xmm14, -0x28(%rbp)
14012acbd:     	movq	$0x0, -0x18(%rbp)
14012acc5:     	movaps	%xmm15, -0x10(%rbp)
14012acca:     	movq	$0x0, (%rbp)
14012acd2:     	movups	%xmm6, 0x8(%rbp)
14012acd6:     	movq	$0x0, 0x18(%rbp)
14012acde:     	movq	(%r14), %rdi
14012ace1:     	leaq	0x148(%rbp), %rcx
14012ace8:     	leaq	-0x40(%rbp), %rdx
14012acec:     	movl	$0xb8, %r8d
14012acf2:     	callq	0x145bc977b <.text+0x5bc877b>
14012acf7:     	movaps	0x5c42612(%rip), %xmm0  # 0x145d6d310
14012acfe:     	movups	%xmm0, 0x200(%rbp)
14012ad05:     	movaps	0x5c428a4(%rip), %xmm0  # 0x145d6d5b0
14012ad0c:     	movups	%xmm0, 0x210(%rbp)
14012ad13:     	movups	0x5c7f17e(%rip), %xmm0  # 0x145da9e98
14012ad1a:     	movups	%xmm0, 0x220(%rbp)
14012ad21:     	movups	0x5c7f180(%rip), %xmm0  # 0x145da9ea8
14012ad28:     	movups	%xmm0, 0x230(%rbp)
14012ad2f:     	movups	0x5c7f182(%rip), %xmm0  # 0x145da9eb8
14012ad36:     	movups	%xmm0, 0x240(%rbp)
14012ad3d:     	movups	0x5c7f184(%rip), %xmm0  # 0x145da9ec8
14012ad44:     	movups	%xmm0, 0x250(%rbp)
14012ad4b:     	movups	%xmm11, 0x260(%rbp)
14012ad53:     	movups	%xmm10, 0x270(%rbp)
14012ad5b:     	movups	%xmm12, 0x280(%rbp)
14012ad63:     	movl	$0x1, 0x290(%rbp)
14012ad6d:     	movss	0x5c4284b(%rip), %xmm0  # 0x145d6d5c0
14012ad75:     	movlps	%xmm0, 0x294(%rbp)
14012ad7c:     	movb	$0x1, 0x29c(%rbp)
14012ad83:     	movq	$0x0, 0x2a0(%rbp)
14012ad8e:     	movl	$0x3f800000, 0x2a8(%rbp) # imm = 0x3F800000
14012ad98:     	movw	$0x0, 0x2ac(%rbp)
14012ada1:     	movw	$0x0, 0x2b2(%rbp)
14012adaa:     	movl	$0x10000, 0x2ae(%rbp)   # imm = 0x10000
14012adb4:     	movw	$0x0, 0x2b8(%rbp)
14012adbd:     	movl	$0x10000, 0x2b4(%rbp)   # imm = 0x10000
14012adc7:     	movw	$0x0, 0x2be(%rbp)
14012add0:     	movl	$0x0, 0x2ba(%rbp)
14012adda:     	movq	%rdi, 0x140(%rbp)
14012ade1:     	leaq	0x5c431c8(%rip), %r9    # 0x145d6dfb0
14012ade8:     	leaq	0x2e0(%rbp), %rcx
14012adef:     	leaq	0x140(%rbp), %r8
14012adf6:     	movq	-0x48(%rbp), %rdx
14012adfa:     	callq	0x140189f40 <.text+0x188f40>
14012adff:     	nop
14012ae00:     	movq	%rsi, 0x140(%rbp)
14012ae07:     	movq	%r12, 0x148(%rbp)
14012ae0e:     	leaq	0x337(%rbp), %rax
14012ae15:     	movq	%rax, 0x150(%rbp)
14012ae1c:     	movq	0x458(%rbp), %rax
14012ae23:     	movq	%rax, 0x158(%rbp)
14012ae2a:     	leaq	0x468(%rbp), %rax
14012ae31:     	movq	%rax, 0x160(%rbp)
14012ae38:     	leaq	0x2e0(%rbp), %rcx
14012ae3f:     	leaq	0x140(%rbp), %rdx
14012ae46:     	callq	0x1402198d0 <.text+0x2188d0>
14012ae4b:     	nop
14012ae4c:     	movq	0x110(%rbp), %rdx
14012ae53:     	testq	%rdx, %rdx
14012ae56:     	je	0x14012ae6e <.text+0x129e6e>
14012ae58:     	shlq	$0x3, %rdx
14012ae5c:     	movl	$0x8, %r8d
14012ae62:     	movq	0x318(%rbp), %rcx
14012ae69:     	callq	0x1400021d0 <.text+0x11d0>
14012ae6e:     	movaps	0x340(%rbp), %xmm6
14012ae75:     	movaps	0x350(%rbp), %xmm7
14012ae7c:     	movaps	0x360(%rbp), %xmm8
14012ae84:     	movaps	0x370(%rbp), %xmm9
14012ae8c:     	movaps	0x380(%rbp), %xmm10
14012ae94:     	movaps	0x390(%rbp), %xmm11
14012ae9c:     	movaps	0x3a0(%rbp), %xmm12
14012aea4:     	movaps	0x3b0(%rbp), %xmm13
14012aeac:     	movaps	0x3c0(%rbp), %xmm14
14012aeb4:     	movaps	0x3d0(%rbp), %xmm15
14012aebc:     	addq	$0x468, %rsp            # imm = 0x468
14012aec3:     	popq	%rbx
14012aec4:     	popq	%rdi
14012aec5:     	popq	%rsi
14012aec6:     	popq	%r12
14012aec8:     	popq	%r13
14012aeca:     	popq	%r14
14012aecc:     	popq	%r15
14012aece:     	popq	%rbp
14012aecf:     	retq
14012aed0:     	ud2
14012aed2:     	leaq	0x5c7fb37(%rip), %r8    # 0x145daaa10
14012aed9:     	movl	$0x3, %edx
14012aede:     	movq	%rdi, %rcx
14012aee1:     	callq	0x145d697e3 <.text+0x5d687e3>
14012aee6:     	ud2
