Disassembly of section .text:

0000000140001000 <.text>:
140279db0:     	pushq	%rbp
140279db1:     	pushq	%r15
140279db3:     	pushq	%r14
140279db5:     	pushq	%r13
140279db7:     	pushq	%r12
140279db9:     	pushq	%rsi
140279dba:     	pushq	%rdi
140279dbb:     	pushq	%rbx
140279dbc:     	subq	$0x208, %rsp            # imm = 0x208
140279dc3:     	leaq	0x80(%rsp), %rbp
140279dcb:     	movaps	%xmm7, 0x170(%rbp)
140279dd2:     	movaps	%xmm6, 0x160(%rbp)
140279dd9:     	movq	$-0x2, 0x158(%rbp)
140279de4:     	movq	0x1f8(%rbp), %rax
140279deb:     	movq	0x1f0(%rbp), %rcx
140279df2:     	movq	(%rdx), %r15
140279df5:     	movq	0x8(%rdx), %r12
140279df9:     	movl	0x14(%rdx), %r10d
140279dfd:     	movq	(%r8), %r8
140279e00:     	movq	%r8, 0xd8(%rbp)
140279e07:     	movq	(%r9), %r8
140279e0a:     	movq	%r8, 0x100(%rbp)
140279e11:     	movq	0x10(%r9), %r8
140279e15:     	movq	%r8, 0x108(%rbp)
140279e1c:     	movl	0x1c(%r9), %r8d
140279e20:     	movl	%r8d, 0x124(%rbp)
140279e27:     	movq	(%rcx), %r8
140279e2a:     	movq	0x10(%rcx), %r9
140279e2e:     	movq	%r9, 0x98(%rbp)
140279e35:     	movl	0x1c(%rcx), %ecx
140279e38:     	movl	%ecx, 0xf0(%rbp)
140279e3e:     	movl	%r10d, %ecx
140279e41:     	subl	0x10(%rdx), %ecx
140279e44:     	cmpl	$0xc233b000, %ecx       # imm = 0xC233B000
140279e4a:     	movl	$0xc233b000, %r11d      # imm = 0xC233B000
140279e50:     	cmovbl	%ecx, %r11d
140279e54:     	movq	(%rax), %rcx
140279e57:     	movq	0x10(%rax), %rdx
140279e5b:     	movq	%rdx, 0xa0(%rbp)
140279e62:     	movl	0x1c(%rax), %eax
140279e65:     	movl	%eax, 0xf4(%rbp)
140279e6b:     	movq	0x200(%rbp), %rax
140279e72:     	movq	(%rax), %rax
140279e75:     	movq	%rax, 0x90(%rbp)
140279e7c:     	movq	0xf8(%r15), %rdi
140279e83:     	movq	0x100(%r15), %rax
140279e8a:     	leaq	(%rdi,%rax,4), %r14
140279e8e:     	movss	0x5af39e2(%rip), %xmm6  # 0x145d6d878
140279e96:     	movss	0x5af6d9e(%rip), %xmm7  # 0x145d70c3c
140279e9e:     	movzbl	0x108(%r15), %ebx
140279ea6:     	movq	%rcx, 0xd0(%rbp)
140279ead:     	leaq	0x20(%rcx), %rax
140279eb1:     	movq	%rax, 0xa8(%rbp)
140279eb8:     	leaq	0x98(%r8), %rax
140279ebf:     	movq	%rax, 0xe0(%rbp)
140279ec6:     	movq	%r8, 0x110(%rbp)
140279ecd:     	leaq	0x30(%r8), %rax
140279ed1:     	movq	%rax, 0xe8(%rbp)
140279ed8:     	xorl	%r13d, %r13d
140279edb:     	movl	$0x8, %eax
140279ee0:     	movq	%rax, 0xc8(%rbp)
140279ee7:     	movq	$0x0, 0x118(%rbp)
140279ef2:     	movq	$0x0, 0x148(%rbp)
140279efd:     	xorl	%eax, %eax
140279eff:     	xorl	%esi, %esi
140279f01:     	movq	$0x0, 0x130(%rbp)
140279f0c:     	movq	$0x0, 0x128(%rbp)
140279f17:     	movl	%r11d, 0x150(%rbp)
140279f1e:     	movb	%bl, 0x157(%rbp)
140279f24:     	testb	%bl, %bl
140279f26:     	movl	%r10d, 0x140(%rbp)
140279f2d:     	jne	0x140279f82 <.text+0x278f82>
140279f2f:     	movq	0xc8(%rbp), %r8
140279f36:     	jmp	0x14027a171 <.text+0x279171>
140279f3b:     	nopl	(%rax,%rax)
140279f40:     	movq	$0x0, 0x148(%rbp)
140279f4b:     	movq	0x128(%r15), %rdx
140279f52:     	callq	0x144e38680 <.text+0x4e37680>
140279f57:     	movq	(%rbx), %r13
140279f5a:     	movl	0x140(%rbp), %r10d
140279f61:     	movl	0x150(%rbp), %r11d
140279f68:     	movzbl	0x157(%rbp), %ebx
140279f6f:     	movl	%esi, %ecx
140279f71:     	incl	%esi
140279f73:     	movl	%r10d, %edx
140279f76:     	subl	(%rax,%rcx,4), %edx
140279f79:     	cmpl	%r11d, %edx
140279f7c:     	jb	0x14027a310 <.text+0x279310>
140279f82:     	cmpl	%r13d, %esi
140279f85:     	jne	0x140279f6f <.text+0x278f6f>
140279f87:     	cmpq	%r14, %rdi
140279f8a:     	je	0x14027a6a3 <.text+0x2796a3>
140279f90:     	movl	(%rdi), %ecx
140279f92:     	addq	$0x4, %rdi
140279f96:     	movq	0x1a8(%r12), %rax
140279f9e:     	leaq	(%rcx,%rcx,8), %rdx
140279fa2:     	cmpq	$0x0, 0x10(%rax,%rdx,8)
140279fa8:     	je	0x140279fd0 <.text+0x278fd0>
140279faa:     	leaq	(%rax,%rdx,8), %rcx
140279fae:     	leaq	(%rax,%rdx,8), %rbx
140279fb2:     	addq	$0x10, %rbx
140279fb6:     	movq	0x110(%r15), %rdx
140279fbd:     	movq	0x40(%rcx), %rax
140279fc1:     	cmpq	%rax, %rdx
140279fc4:     	jae	0x14027a050 <.text+0x279050>
140279fca:     	jmp	0x14027a00b <.text+0x27900b>
140279fcc:     	nopl	(%rax)
140279fd0:     	cmpq	%r14, %rdi
140279fd3:     	je	0x14027a6a3 <.text+0x2796a3>
140279fd9:     	movl	(%rdi), %ecx
140279fdb:     	addq	$0x4, %rdi
140279fdf:     	movq	0x1a8(%r12), %rax
140279fe7:     	leaq	(%rcx,%rcx,8), %rcx
140279feb:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
140279ff1:     	je	0x140279fd0 <.text+0x278fd0>
140279ff3:     	leaq	(%rax,%rcx,8), %rcx
140279ff7:     	leaq	0x10(%rcx), %rbx
140279ffb:     	movq	0x110(%r15), %rdx
14027a002:     	movq	0x40(%rcx), %rax
14027a006:     	cmpq	%rax, %rdx
14027a009:     	jae	0x14027a050 <.text+0x279050>
14027a00b:     	movq	0x38(%rcx), %r8
14027a00f:     	movq	(%r8,%rdx,8), %rdx
14027a013:     	testq	%rdx, %rdx
14027a016:     	je	0x14027a050 <.text+0x279050>
14027a018:     	movq	0x18(%rcx), %r8
14027a01c:     	notq	%rdx
14027a01f:     	leaq	(%rdx,%rdx,2), %rdx
14027a023:     	shlq	$0x4, %rdx
14027a027:     	movq	0x10(%r8,%rdx), %rdx
14027a02c:     	movq	%rdx, 0x128(%rbp)
14027a033:     	movq	0x118(%r15), %rdx
14027a03a:     	cmpq	%rax, %rdx
14027a03d:     	jb	0x14027a067 <.text+0x279067>
14027a03f:     	jmp	0x14027a0b0 <.text+0x2790b0>
14027a041:     	nopw	%cs:(%rax,%rax)
14027a050:     	movq	$0x0, 0x128(%rbp)
14027a05b:     	movq	0x118(%r15), %rdx
14027a062:     	cmpq	%rax, %rdx
14027a065:     	jae	0x14027a0b0 <.text+0x2790b0>
14027a067:     	movq	0x38(%rcx), %r8
14027a06b:     	movq	(%r8,%rdx,8), %rdx
14027a06f:     	testq	%rdx, %rdx
14027a072:     	je	0x14027a0b0 <.text+0x2790b0>
14027a074:     	movq	0x18(%rcx), %r8
14027a078:     	notq	%rdx
14027a07b:     	leaq	(%rdx,%rdx,2), %rdx
14027a07f:     	shlq	$0x4, %rdx
14027a083:     	movq	0x10(%r8,%rdx), %rdx
14027a088:     	movq	%rdx, 0x130(%rbp)
14027a08f:     	movq	0x120(%r15), %rdx
14027a096:     	xorl	%esi, %esi
14027a098:     	cmpq	%rax, %rdx
14027a09b:     	jae	0x140279f40 <.text+0x278f40>
14027a0a1:     	jmp	0x14027a0cd <.text+0x2790cd>
14027a0a3:     	nopw	%cs:(%rax,%rax)
14027a0b0:     	movq	$0x0, 0x130(%rbp)
14027a0bb:     	movq	0x120(%r15), %rdx
14027a0c2:     	xorl	%esi, %esi
14027a0c4:     	cmpq	%rax, %rdx
14027a0c7:     	jae	0x140279f40 <.text+0x278f40>
14027a0cd:     	movq	0x38(%rcx), %rax
14027a0d1:     	movq	(%rax,%rdx,8), %rax
14027a0d5:     	testq	%rax, %rax
14027a0d8:     	je	0x140279f40 <.text+0x278f40>
14027a0de:     	movq	0x18(%rcx), %rdx
14027a0e2:     	notq	%rax
14027a0e5:     	leaq	(%rax,%rax,2), %rax
14027a0e9:     	shlq	$0x4, %rax
14027a0ed:     	movq	0x10(%rdx,%rax), %r8
14027a0f2:     	movq	%r8, 0x118(%rbp)
14027a0f9:     	movq	0x28(%rdx,%rax), %rax
14027a0fe:     	movq	%rax, 0xf8(%rbp)
14027a105:     	movb	$0x1, %al
14027a107:     	movq	%rax, 0x148(%rbp)
14027a10e:     	jmp	0x140279f4b <.text+0x278f4b>
14027a113:     	nopw	%cs:(%rax,%rax)
14027a120:     	movq	$0x0, 0x148(%rbp)
14027a12b:     	movq	0x128(%r15), %rdx
14027a132:     	callq	0x144e38680 <.text+0x4e37680>
14027a137:     	movq	0x50(%r13), %r8
14027a13b:     	movq	(%rbx), %r13
14027a13e:     	movl	0x140(%rbp), %r10d
14027a145:     	movl	0x150(%rbp), %r11d
14027a14c:     	movzbl	0x157(%rbp), %ebx
14027a153:     	movl	%esi, %ecx
14027a155:     	shlq	$0x4, %rcx
14027a159:     	incl	%esi
14027a15b:     	movl	0x8(%r8,%rcx), %ecx
14027a160:     	notl	%ecx
14027a162:     	movl	%r10d, %edx
14027a165:     	subl	(%rax,%rcx,4), %edx
14027a168:     	cmpl	%r11d, %edx
14027a16b:     	jb	0x14027a37b <.text+0x27937b>
14027a171:     	cmpl	%r13d, %esi
14027a174:     	jne	0x14027a153 <.text+0x279153>
14027a176:     	cmpq	%r14, %rdi
14027a179:     	je	0x14027a6a3 <.text+0x2796a3>
14027a17f:     	movl	(%rdi), %ecx
14027a181:     	addq	$0x4, %rdi
14027a185:     	movq	0x108(%r12), %rax
14027a18d:     	leaq	(%rcx,%rcx,4), %rcx
14027a191:     	shlq	$0x5, %rcx
14027a195:     	cmpq	$0x0, 0x58(%rax,%rcx)
14027a19b:     	je	0x14027a1b0 <.text+0x2791b0>
14027a19d:     	leaq	(%rax,%rcx), %r13
14027a1a1:     	leaq	(%rax,%rcx), %rbx
14027a1a5:     	addq	$0x58, %rbx
14027a1a9:     	jmp	0x14027a1de <.text+0x2791de>
14027a1ab:     	nopl	(%rax,%rax)
14027a1b0:     	cmpq	%r14, %rdi
14027a1b3:     	je	0x14027a6a3 <.text+0x2796a3>
14027a1b9:     	movl	(%rdi), %eax
14027a1bb:     	addq	$0x4, %rdi
14027a1bf:     	movq	0x108(%r12), %r13
14027a1c7:     	leaq	(%rax,%rax,4), %rax
14027a1cb:     	shlq	$0x5, %rax
14027a1cf:     	cmpq	$0x0, 0x58(%r13,%rax)
14027a1d5:     	je	0x14027a1b0 <.text+0x2791b0>
14027a1d7:     	addq	%rax, %r13
14027a1da:     	leaq	0x58(%r13), %rbx
14027a1de:     	movl	0x94(%r13), %eax
14027a1e5:     	movq	0x1a8(%r12), %r8
14027a1ed:     	leaq	(%rax,%rax,8), %rax
14027a1f1:     	leaq	(%r8,%rax,8), %rcx
14027a1f5:     	movq	0x110(%r15), %rdx
14027a1fc:     	movq	0x40(%r8,%rax,8), %rax
14027a201:     	cmpq	%rax, %rdx
14027a204:     	jae	0x14027a240 <.text+0x279240>
14027a206:     	movq	0x38(%rcx), %r8
14027a20a:     	movq	(%r8,%rdx,8), %rdx
14027a20e:     	testq	%rdx, %rdx
14027a211:     	je	0x14027a240 <.text+0x279240>
14027a213:     	movq	0x18(%rcx), %r8
14027a217:     	notq	%rdx
14027a21a:     	leaq	(%rdx,%rdx,2), %rdx
14027a21e:     	shlq	$0x4, %rdx
14027a222:     	movq	0x10(%r8,%rdx), %rdx
14027a227:     	movq	%rdx, 0x128(%rbp)
14027a22e:     	movq	0x118(%r15), %rdx
14027a235:     	cmpq	%rax, %rdx
14027a238:     	jb	0x14027a257 <.text+0x279257>
14027a23a:     	jmp	0x14027a2a0 <.text+0x2792a0>
14027a23c:     	nopl	(%rax)
14027a240:     	movq	$0x0, 0x128(%rbp)
14027a24b:     	movq	0x118(%r15), %rdx
14027a252:     	cmpq	%rax, %rdx
14027a255:     	jae	0x14027a2a0 <.text+0x2792a0>
14027a257:     	movq	0x38(%rcx), %rax
14027a25b:     	movq	(%rax,%rdx,8), %rax
14027a25f:     	testq	%rax, %rax
14027a262:     	je	0x14027a2a0 <.text+0x2792a0>
14027a264:     	movq	0x18(%rcx), %rdx
14027a268:     	notq	%rax
14027a26b:     	leaq	(%rax,%rax,2), %rax
14027a26f:     	shlq	$0x4, %rax
14027a273:     	movq	0x10(%rdx,%rax), %rax
14027a278:     	movq	%rax, 0x130(%rbp)
14027a27f:     	movq	0x120(%r15), %rax
14027a286:     	xorl	%esi, %esi
14027a288:     	cmpq	0x88(%r13), %rax
14027a28f:     	jae	0x14027a120 <.text+0x279120>
14027a295:     	jmp	0x14027a2c1 <.text+0x2792c1>
14027a297:     	nopw	(%rax,%rax)
14027a2a0:     	movq	$0x0, 0x130(%rbp)
14027a2ab:     	movq	0x120(%r15), %rax
14027a2b2:     	xorl	%esi, %esi
14027a2b4:     	cmpq	0x88(%r13), %rax
14027a2bb:     	jae	0x14027a120 <.text+0x279120>
14027a2c1:     	movq	0x80(%r13), %rdx
14027a2c8:     	cmpq	$0x0, (%rdx,%rax,8)
14027a2cd:     	je	0x14027a120 <.text+0x279120>
14027a2d3:     	movq	0x18(%rcx), %rdx
14027a2d7:     	movq	0x38(%rcx), %r8
14027a2db:     	movq	(%r8,%rax,8), %rax
14027a2df:     	notq	%rax
14027a2e2:     	leaq	(%rax,%rax,2), %rax
14027a2e6:     	shlq	$0x4, %rax
14027a2ea:     	movq	0x10(%rdx,%rax), %r8
14027a2ef:     	movq	%r8, 0x118(%rbp)
14027a2f6:     	movq	0x28(%rdx,%rax), %rax
14027a2fb:     	movq	%rax, 0xf8(%rbp)
14027a302:     	movb	$0x1, %al
14027a304:     	movq	%rax, 0x148(%rbp)
14027a30b:     	jmp	0x14027a12b <.text+0x27912b>
14027a310:     	movq	0x128(%rbp), %rdx
14027a317:     	leaq	(%rdx,%rcx), %r8
14027a31b:     	movq	0x130(%rbp), %rdx
14027a322:     	addq	%rcx, %rdx
14027a325:     	cmpb	$0x1, 0x148(%rbp)
14027a32c:     	jne	0x14027a3e0 <.text+0x2793e0>
14027a332:     	movq	0xf8(%rbp), %r9
14027a339:     	leaq	(%r9,%rcx,4), %r9
14027a33d:     	movq	%r9, 0x140(%rbp)
14027a344:     	shlq	$0x5, %rcx
14027a348:     	addq	0x118(%rbp), %rcx
14027a34f:     	movq	%rdx, %r9
14027a352:     	movb	$0x1, %dl
14027a354:     	movq	%rdx, 0x148(%rbp)
14027a35b:     	movq	%r9, %rdx
14027a35e:     	movq	0x140(%rbp), %r9
14027a365:     	movq	%r9, 0xb0(%rbp)
14027a36c:     	cmpb	$0x0, (%r8)
14027a370:     	jne	0x140279f24 <.text+0x278f24>
14027a376:     	jmp	0x14027a41e <.text+0x27941e>
14027a37b:     	movq	%r8, 0xc8(%rbp)
14027a382:     	movq	0x128(%rbp), %rdx
14027a389:     	leaq	(%rdx,%rcx), %r8
14027a38d:     	movq	0x130(%rbp), %rdx
14027a394:     	addq	%rcx, %rdx
14027a397:     	cmpb	$0x1, 0x148(%rbp)
14027a39e:     	jne	0x14027a400 <.text+0x279400>
14027a3a0:     	movq	0xf8(%rbp), %r9
14027a3a7:     	leaq	(%r9,%rcx,4), %r9
14027a3ab:     	shlq	$0x5, %rcx
14027a3af:     	addq	0x118(%rbp), %rcx
14027a3b6:     	movq	%rdx, 0x140(%rbp)
14027a3bd:     	movb	$0x1, %dl
14027a3bf:     	movq	%rdx, 0x148(%rbp)
14027a3c6:     	movq	0x140(%rbp), %rdx
14027a3cd:     	movq	%r9, 0xb8(%rbp)
14027a3d4:     	cmpb	$0x0, (%r8)
14027a3d8:     	jne	0x140279f24 <.text+0x278f24>
14027a3de:     	jmp	0x14027a41e <.text+0x27941e>
14027a3e0:     	movq	$0x0, 0x148(%rbp)
14027a3eb:     	movq	0xb0(%rbp), %r9
14027a3f2:     	xorl	%ecx, %ecx
14027a3f4:     	cmpb	$0x0, (%r8)
14027a3f8:     	jne	0x140279f24 <.text+0x278f24>
14027a3fe:     	jmp	0x14027a41e <.text+0x27941e>
14027a400:     	movq	$0x0, 0x148(%rbp)
14027a40b:     	movq	0xb8(%rbp), %r9
14027a412:     	xorl	%ecx, %ecx
14027a414:     	cmpb	$0x0, (%r8)
14027a418:     	jne	0x140279f24 <.text+0x278f24>
14027a41e:     	testq	%rcx, %rcx
14027a421:     	je	0x14027a452 <.text+0x279452>
14027a423:     	movl	%r10d, (%r9)
14027a426:     	movq	0x90(%rbp), %r8
14027a42d:     	movss	0x8c(%r8), %xmm0
14027a436:     	cmpl	$0x1, 0x18(%rcx)
14027a43a:     	jne	0x14027a48e <.text+0x27948e>
14027a43c:     	movaps	%xmm0, %xmm1
14027a43f:     	subss	0x1c(%rcx), %xmm1
14027a444:     	ucomiss	%xmm1, %xmm6
14027a447:     	ja	0x140279f24 <.text+0x278f24>
14027a44d:     	ucomiss	%xmm1, %xmm7
14027a450:     	jbe	0x14027a48e <.text+0x27948e>
14027a452:     	movzbl	(%rdx), %ecx
14027a455:     	leaq	0x5b47598(%rip), %rdx   # 0x145dc19f4
14027a45c:     	movslq	(%rdx,%rcx,4), %rcx
14027a460:     	addq	%rdx, %rcx
14027a463:     	jmpq	*%rcx
14027a465:     	movq	0x100(%rbp), %rcx
14027a46c:     	cmpb	$0x0, (%rcx)
14027a46f:     	je	0x14027a661 <.text+0x279661>
14027a475:     	movq	0x108(%rbp), %rdx
14027a47c:     	movl	0x124(%rbp), %r8d
14027a483:     	movl	%r8d, (%rdx)
14027a486:     	movb	$0x0, (%rcx)
14027a489:     	jmp	0x140279f24 <.text+0x278f24>
14027a48e:     	movl	$0x1, 0x18(%rcx)
14027a495:     	movss	%xmm0, 0x1c(%rcx)
14027a49a:     	jmp	0x140279f24 <.text+0x278f24>
14027a49f:     	movq	0x108(%rbp), %rcx
14027a4a6:     	movl	0x124(%rbp), %edx
14027a4ac:     	movl	%edx, (%rcx)
14027a4ae:     	movq	0x100(%rbp), %rcx
14027a4b5:     	movb	$0x0, (%rcx)
14027a4b8:     	movl	$0xa, -0x58(%rbp)
14027a4bf:     	jmp	0x14027a66c <.text+0x27966c>
14027a4c4:     	movq	0xa0(%rbp), %rcx
14027a4cb:     	movl	0xf4(%rbp), %edx
14027a4d1:     	movl	%edx, (%rcx)
14027a4d3:     	movq	0xd0(%rbp), %rcx
14027a4da:     	movq	0x30(%rcx), %rbx
14027a4de:     	movq	0x40(%rcx), %r9
14027a4e2:     	cmpq	0x20(%rcx), %rbx
14027a4e6:     	jne	0x14027a525 <.text+0x279525>
14027a4e8:     	movq	0xa8(%rbp), %rcx
14027a4ef:     	movq	%rax, 0x138(%rbp)
14027a4f6:     	movl	%r10d, 0x140(%rbp)
14027a4fd:     	movq	%r9, 0xc0(%rbp)
14027a504:     	callq	0x145bcb680 <.text+0x5bca680>
14027a509:     	movq	0xc0(%rbp), %r9
14027a510:     	movl	0x150(%rbp), %r11d
14027a517:     	movl	0x140(%rbp), %r10d
14027a51e:     	movq	0x138(%rbp), %rax
14027a525:     	movq	0xd0(%rbp), %r8
14027a52c:     	movq	0x28(%r8), %rcx
14027a530:     	movq	%rbx, %rdx
14027a533:     	shlq	$0x4, %rdx
14027a537:     	movq	%r9, (%rcx,%rdx)
14027a53b:     	movb	$0x0, 0x8(%rcx,%rdx)
14027a540:     	incq	%rbx
14027a543:     	movq	%rbx, 0x30(%r8)
14027a547:     	incq	0x40(%r8)
14027a54b:     	movzbl	0x157(%rbp), %ebx
14027a552:     	jmp	0x140279f24 <.text+0x278f24>
14027a557:     	movl	%r10d, 0x140(%rbp)
14027a55e:     	movq	%rax, 0x138(%rbp)
14027a565:     	movq	0x108(%rbp), %rax
14027a56c:     	movl	0x124(%rbp), %ecx
14027a572:     	movl	%ecx, (%rax)
14027a574:     	movq	0x100(%rbp), %rax
14027a57b:     	movb	$0x0, (%rax)
14027a57e:     	movq	0x98(%rbp), %rax
14027a585:     	movl	0xf0(%rbp), %ecx
14027a58b:     	movl	%ecx, (%rax)
14027a58d:     	movq	0x110(%rbp), %rbx
14027a594:     	movb	$0x1, 0x1a8(%rbx)
14027a59b:     	movq	0x78(%rbx), %rdx
14027a59f:     	cmpq	$-0x1, %rdx
14027a5a3:     	je	0x14027a5c3 <.text+0x2795c3>
14027a5a5:     	testq	%rdx, %rdx
14027a5a8:     	je	0x14027a5c3 <.text+0x2795c3>
14027a5aa:     	movq	0x80(%rbx), %rcx
14027a5b1:     	movl	$0x1, %r8d
14027a5b7:     	callq	0x1400021d0 <.text+0x11d0>
14027a5bc:     	movq	0x110(%rbp), %rbx
14027a5c3:     	movq	$-0x1, 0x78(%rbx)
14027a5cb:     	movq	0xe0(%rbp), %rcx
14027a5d2:     	callq	0x1400da750 <.text+0xd9750>
14027a5d7:     	nop
14027a5d8:     	movq	$-0x1, 0x98(%rbx)
14027a5e3:     	movl	$0x0, 0x1a4(%rbx)
14027a5ed:     	cmpq	$0x0, 0x40(%rbx)
14027a5f2:     	movq	0x138(%rbp), %rax
14027a5f9:     	movl	0x140(%rbp), %r10d
14027a600:     	movl	0x150(%rbp), %r11d
14027a607:     	movzbl	0x157(%rbp), %ebx
14027a60e:     	jne	0x140279f24 <.text+0x278f24>
14027a614:     	movq	0xe8(%rbp), %rcx
14027a61b:     	cmpq	$0x0, (%rcx)
14027a61f:     	jne	0x14027a642 <.text+0x279642>
14027a621:     	movq	0xe8(%rbp), %rcx
14027a628:     	callq	0x145bcb370 <.text+0x5bca370>
14027a62d:     	movl	0x150(%rbp), %r11d
14027a634:     	movl	0x140(%rbp), %r10d
14027a63b:     	movq	0x138(%rbp), %rax
14027a642:     	movq	0x110(%rbp), %rdx
14027a649:     	movq	0x38(%rdx), %rcx
14027a64d:     	movq	$0x0, (%rcx)
14027a654:     	movq	$0x1, 0x40(%rdx)
14027a65c:     	jmp	0x140279f24 <.text+0x278f24>
14027a661:     	movb	$0x0, -0x54(%rbp)
14027a665:     	movl	$0x7, -0x58(%rbp)
14027a66c:     	movq	0xd8(%rbp), %rcx
14027a673:     	leaq	-0x58(%rbp), %rdx
14027a677:     	movq	%rax, 0x138(%rbp)
14027a67e:     	movl	%r10d, %ebx
14027a681:     	callq	0x14003eb80 <.text+0x3db80>
14027a686:     	movl	0x150(%rbp), %r11d
14027a68d:     	movl	%ebx, %r10d
14027a690:     	movzbl	0x157(%rbp), %ebx
14027a697:     	movq	0x138(%rbp), %rax
14027a69e:     	jmp	0x140279f24 <.text+0x278f24>
14027a6a3:     	movaps	0x160(%rbp), %xmm6
14027a6aa:     	movaps	0x170(%rbp), %xmm7
14027a6b1:     	addq	$0x208, %rsp            # imm = 0x208
14027a6b8:     	popq	%rbx
14027a6b9:     	popq	%rdi
14027a6ba:     	popq	%rsi
14027a6bb:     	popq	%r12
14027a6bd:     	popq	%r13
14027a6bf:     	popq	%r14
14027a6c1:     	popq	%r15
14027a6c3:     	popq	%rbp
14027a6c4:     	retq
