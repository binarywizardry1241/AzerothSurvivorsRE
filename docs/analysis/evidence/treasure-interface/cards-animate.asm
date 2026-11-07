
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14021ce50:     	pushq	%rbp
14021ce51:     	pushq	%r15
14021ce53:     	pushq	%r14
14021ce55:     	pushq	%r13
14021ce57:     	pushq	%r12
14021ce59:     	pushq	%rsi
14021ce5a:     	pushq	%rdi
14021ce5b:     	pushq	%rbx
14021ce5c:     	subq	$0x2f8, %rsp            # imm = 0x2F8
14021ce63:     	leaq	0x80(%rsp), %rbp
14021ce6b:     	movaps	%xmm15, 0x260(%rbp)
14021ce73:     	movaps	%xmm14, 0x250(%rbp)
14021ce7b:     	movaps	%xmm13, 0x240(%rbp)
14021ce83:     	movaps	%xmm12, 0x230(%rbp)
14021ce8b:     	movaps	%xmm11, 0x220(%rbp)
14021ce93:     	movaps	%xmm10, 0x210(%rbp)
14021ce9b:     	movaps	%xmm9, 0x200(%rbp)
14021cea3:     	movaps	%xmm8, 0x1f0(%rbp)
14021ceab:     	movaps	%xmm7, 0x1e0(%rbp)
14021ceb2:     	movaps	%xmm6, 0x1d0(%rbp)
14021ceb9:     	movq	$-0x2, 0x1c8(%rbp)
14021cec4:     	movq	0x2f0(%rbp), %rcx
14021cecb:     	movq	0x2e8(%rbp), %r10
14021ced2:     	movq	0x2e0(%rbp), %r11
14021ced9:     	movq	(%rdx), %rdx
14021cedc:     	movq	(%r8), %rsi
14021cedf:     	movq	(%r9), %r8
14021cee2:     	movq	0x8(%r9), %rbx
14021cee6:     	movl	0x10(%r9), %eax
14021ceea:     	movl	0x14(%r9), %edi
14021ceee:     	movq	(%r11), %r9
14021cef1:     	movq	%r9, 0x108(%rbp)
14021cef8:     	movq	0x8(%r11), %r9
14021cefc:     	movq	%r9, 0xd0(%rbp)
14021cf03:     	movl	0x14(%r11), %r9d
14021cf07:     	movl	%r9d, 0xfc(%rbp)
14021cf0e:     	movq	(%r10), %r9
14021cf11:     	movq	%r9, 0x118(%rbp)
14021cf18:     	movq	0x8(%r10), %r9
14021cf1c:     	movq	%r9, 0x100(%rbp)
14021cf23:     	movl	0x14(%r10), %r9d
14021cf27:     	movl	%r9d, 0x190(%rbp)
14021cf2e:     	movss	0x58(%rdx), %xmm8
14021cf34:     	movss	0x5c(%rdx), %xmm6
14021cf39:     	movq	(%rcx), %rdx
14021cf3c:     	movq	%rdx, 0x110(%rbp)
14021cf43:     	movq	0x8(%rcx), %rdx
14021cf47:     	movq	%rdx, 0xe0(%rbp)
14021cf4e:     	movl	0x14(%rcx), %ecx
14021cf51:     	movl	%ecx, 0x194(%rbp)
14021cf57:     	movaps	%xmm6, %xmm9
14021cf5b:     	movq	%rsi, 0x1a0(%rbp)
14021cf62:     	subss	0x44(%rsi), %xmm9
14021cf68:     	movl	%edi, 0x20(%rsp)
14021cf6c:     	leaq	-0x50(%rbp), %rcx
14021cf70:     	movq	%rbx, %rdx
14021cf73:     	movq	%r8, 0x188(%rbp)
14021cf7a:     	movl	%eax, %r9d
14021cf7d:     	callq	0x140044b00 <.text+0x43b00>
14021cf82:     	movq	-0x50(%rbp), %rdi
14021cf86:     	movq	-0x48(%rbp), %r14
14021cf8a:     	movq	-0x30(%rbp), %rax
14021cf8e:     	movq	%rax, 0xd8(%rbp)
14021cf95:     	movq	-0x20(%rbp), %rax
14021cf99:     	movq	%rax, 0x148(%rbp)
14021cfa0:     	movq	-0x10(%rbp), %rax
14021cfa4:     	movq	%rax, 0x150(%rbp)
14021cfab:     	movl	-0x4(%rbp), %eax
14021cfae:     	movl	%eax, 0xec(%rbp)
14021cfb4:     	movq	(%rbp), %rax
14021cfb8:     	movq	%rax, 0x158(%rbp)
14021cfbf:     	movq	0x10(%rbp), %rax
14021cfc3:     	movq	%rax, 0x160(%rbp)
14021cfca:     	movl	0x1c(%rbp), %eax
14021cfcd:     	movl	%eax, 0xf0(%rbp)
14021cfd3:     	movq	0x20(%rbp), %rax
14021cfd7:     	movq	%rax, 0x168(%rbp)
14021cfde:     	movq	0x30(%rbp), %rax
14021cfe2:     	movq	%rax, 0x170(%rbp)
14021cfe9:     	movl	0x3c(%rbp), %eax
14021cfec:     	movl	%eax, 0xf4(%rbp)
14021cff2:     	mulss	0x56f88bd(%rip), %xmm8  # 0x1459158b8
14021cffb:     	minss	0x56ea48c(%rip), %xmm8  # 0x145907490
14021d004:     	movq	0x40(%rbp), %rax
14021d008:     	movq	%rax, 0x1b8(%rbp)
14021d00f:     	movss	0x56f8778(%rip), %xmm10 # 0x145915790
14021d018:     	movss	0x56ea46f(%rip), %xmm13 # 0x145907490
14021d021:     	movaps	0x572e4c7(%rip), %xmm15 # 0x14594b4f0
14021d029:     	movaps	0x56f88cf(%rip), %xmm14 # 0x145915900
14021d031:     	movzbl	0x70(%rbp), %eax
14021d035:     	movb	%al, 0x1c7(%rbp)
14021d03b:     	movq	0x48(%rbp), %rax
14021d03f:     	movq	%rax, 0x178(%rbp)
14021d046:     	movq	0x58(%rbp), %rax
14021d04a:     	movq	%rax, 0x180(%rbp)
14021d051:     	movl	0x64(%rbp), %eax
14021d054:     	movl	%eax, 0xf8(%rbp)
14021d05a:     	movl	0x68(%rbp), %esi
14021d05d:     	movl	0x6c(%rbp), %r15d
14021d061:     	movaps	0x572e497(%rip), %xmm12 # 0x14594b500
14021d069:     	movq	%r14, 0x78(%rbp)
14021d06d:     	jmp	0x14021d153 <.text+0x21c153>
14021d072:     	nopw	%cs:(%rax,%rax)
14021d080:     	incl	%r15d
14021d083:     	leaq	0x8(%r12), %r8
14021d088:     	movq	$0x2, (%rbx)
14021d08f:     	movq	%r13, 0x8(%rbx)
14021d093:     	movq	$0x2, 0x10(%rbx)
14021d09b:     	addq	$0x1c, %r12
14021d09f:     	leaq	0x120(%rbp), %rcx
14021d0a6:     	movq	%r12, %rdx
14021d0a9:     	movaps	%xmm7, %xmm3
14021d0ac:     	callq	0x144c93240 <.text+0x4c92240>
14021d0b1:     	movl	0x130(%rbp), %eax
14021d0b7:     	movl	%eax, 0x90(%rbp)
14021d0bd:     	movups	0x120(%rbp), %xmm0
14021d0c4:     	movaps	%xmm0, 0x80(%rbp)
14021d0cb:     	leaq	0x94(%rbp), %rcx
14021d0d2:     	movl	%eax, 0x10(%rcx)
14021d0d5:     	movups	%xmm0, (%rcx)
14021d0d8:     	movl	0x130(%rbp), %eax
14021d0de:     	movl	%eax, 0x24(%rcx)
14021d0e1:     	movups	0x120(%rbp), %xmm0
14021d0e8:     	movups	%xmm0, 0x14(%rcx)
14021d0ec:     	movl	0x130(%rbp), %eax
14021d0f2:     	movl	%eax, 0x38(%rcx)
14021d0f5:     	movups	0x120(%rbp), %xmm0
14021d0fc:     	movups	%xmm0, 0x28(%rcx)
14021d100:     	movl	0xf8(%rbp), %eax
14021d106:     	movq	0x140(%rbp), %rcx
14021d10d:     	movl	%eax, (%rcx)
14021d10f:     	movaps	0xc0(%rbp), %xmm0
14021d116:     	movq	0x138(%rbp), %rax
14021d11d:     	movups	%xmm0, 0x40(%rax)
14021d121:     	movaps	0x80(%rbp), %xmm0
14021d128:     	movaps	0x90(%rbp), %xmm1
14021d12f:     	movaps	0xa0(%rbp), %xmm2
14021d136:     	movaps	0xb0(%rbp), %xmm3
14021d13d:     	movups	%xmm3, 0x30(%rax)
14021d141:     	movups	%xmm2, 0x20(%rax)
14021d145:     	movups	%xmm1, 0x10(%rax)
14021d149:     	movups	%xmm0, (%rax)
14021d14c:     	movq	%r14, %rbx
14021d14f:     	movq	0x78(%rbp), %r14
14021d153:     	testb	$0x1, 0x1c7(%rbp)
14021d15a:     	je	0x14021d1f0 <.text+0x21c1f0>
14021d160:     	cmpl	%esi, %r15d
14021d163:     	movq	0x1a0(%rbp), %r10
14021d16a:     	jne	0x14021d36b <.text+0x21c36b>
14021d170:     	cmpq	%r14, %rdi
14021d173:     	je	0x14021d7b6 <.text+0x21c7b6>
14021d179:     	movl	(%rdi), %ecx
14021d17b:     	addq	$0x4, %rdi
14021d17f:     	movq	0x1a8(%rbx), %rax
14021d186:     	leaq	(%rcx,%rcx,8), %rcx
14021d18a:     	movq	0x10(%rax,%rcx,8), %rsi
14021d18f:     	testq	%rsi, %rsi
14021d192:     	je	0x14021d170 <.text+0x21c170>
14021d194:     	leaq	(%rax,%rcx,8), %r8
14021d198:     	movq	0x18(%r8), %rax
14021d19c:     	movq	0x38(%r8), %rcx
14021d1a0:     	movq	0x188(%rbp), %rdx
14021d1a7:     	movq	0x118(%rdx), %rdx
14021d1ae:     	cmpq	0x40(%r8), %rdx
14021d1b2:     	jae	0x14021d29e <.text+0x21c29e>
14021d1b8:     	movq	(%rcx,%rdx,8), %rdx
14021d1bc:     	testq	%rdx, %rdx
14021d1bf:     	je	0x14021d29e <.text+0x21c29e>
14021d1c5:     	notq	%rdx
14021d1c8:     	leaq	(%rdx,%rdx,2), %rdx
14021d1cc:     	shlq	$0x4, %rdx
14021d1d0:     	movq	0x10(%rax,%rdx), %rdx
14021d1d5:     	movq	%rdx, 0x1b8(%rbp)
14021d1dc:     	jmp	0x14021d2a9 <.text+0x21c2a9>
14021d1e1:     	nopw	%cs:(%rax,%rax)
14021d1f0:     	cmpl	%esi, %r15d
14021d1f3:     	movq	0x1a0(%rbp), %r10
14021d1fa:     	jne	0x14021d43c <.text+0x21c43c>
14021d200:     	cmpq	%r14, %rdi
14021d203:     	je	0x14021d7b6 <.text+0x21c7b6>
14021d209:     	movl	(%rdi), %ecx
14021d20b:     	addq	$0x4, %rdi
14021d20f:     	movq	0x108(%rbx), %rax
14021d216:     	leaq	(%rcx,%rcx,4), %rcx
14021d21a:     	shlq	$0x5, %rcx
14021d21e:     	movq	0x58(%rax,%rcx), %rsi
14021d223:     	testq	%rsi, %rsi
14021d226:     	je	0x14021d200 <.text+0x21c200>
14021d228:     	addq	%rcx, %rax
14021d22b:     	movl	0x94(%rax), %ecx
14021d231:     	movq	0x1a8(%rbx), %r10
14021d238:     	leaq	(%rcx,%rcx,8), %r11
14021d23c:     	movq	0x18(%r10,%r11,8), %rcx
14021d241:     	movq	0x38(%r10,%r11,8), %rdx
14021d246:     	movq	0x188(%rbp), %r9
14021d24d:     	movq	0x110(%r9), %r8
14021d254:     	movq	0x118(%r9), %r9
14021d25b:     	movq	(%rdx,%r8,8), %r8
14021d25f:     	notq	%r8
14021d262:     	leaq	(%r8,%r8,2), %r8
14021d266:     	shlq	$0x4, %r8
14021d26a:     	cmpq	0x40(%r10,%r11,8), %r9
14021d26f:     	jae	0x14021d373 <.text+0x21c373>
14021d275:     	movq	(%rdx,%r9,8), %r9
14021d279:     	testq	%r9, %r9
14021d27c:     	je	0x14021d373 <.text+0x21c373>
14021d282:     	notq	%r9
14021d285:     	leaq	(%r9,%r9,2), %r9
14021d289:     	shlq	$0x4, %r9
14021d28d:     	movq	0x10(%rcx,%r9), %r9
14021d292:     	movq	%r9, 0x1b8(%rbp)
14021d299:     	jmp	0x14021d37e <.text+0x21c37e>
14021d29e:     	movq	$0x0, 0x1b8(%rbp)
14021d2a9:     	movq	0x188(%rbp), %r9
14021d2b0:     	movq	0x110(%r9), %rdx
14021d2b7:     	movq	(%rcx,%rdx,8), %rdx
14021d2bb:     	notq	%rdx
14021d2be:     	leaq	(%rdx,%rdx,2), %rdx
14021d2c2:     	shlq	$0x4, %rdx
14021d2c6:     	movq	0x10(%rax,%rdx), %r8
14021d2cb:     	movq	%r8, 0x148(%rbp)
14021d2d2:     	movq	0x28(%rax,%rdx), %rdx
14021d2d7:     	movq	%rdx, 0x150(%rbp)
14021d2de:     	movq	0x120(%r9), %rdx
14021d2e5:     	movq	0x128(%r9), %r8
14021d2ec:     	movq	(%rcx,%rdx,8), %rdx
14021d2f0:     	notq	%rdx
14021d2f3:     	leaq	(%rdx,%rdx,2), %rdx
14021d2f7:     	shlq	$0x4, %rdx
14021d2fb:     	movq	0x10(%rax,%rdx), %r11
14021d300:     	movq	%r11, 0x158(%rbp)
14021d307:     	movq	0x28(%rax,%rdx), %rdx
14021d30c:     	movq	%rdx, 0x160(%rbp)
14021d313:     	movq	(%rcx,%r8,8), %rdx
14021d317:     	notq	%rdx
14021d31a:     	leaq	(%rdx,%rdx,2), %rdx
14021d31e:     	shlq	$0x4, %rdx
14021d322:     	movq	0x10(%rax,%rdx), %r8
14021d327:     	movq	%r8, 0x168(%rbp)
14021d32e:     	movq	0x28(%rax,%rdx), %rdx
14021d333:     	movq	%rdx, 0x170(%rbp)
14021d33a:     	movq	0x130(%r9), %rdx
14021d341:     	movq	(%rcx,%rdx,8), %rcx
14021d345:     	notq	%rcx
14021d348:     	leaq	(%rcx,%rcx,2), %rcx
14021d34c:     	shlq	$0x4, %rcx
14021d350:     	movq	0x10(%rax,%rcx), %rdx
14021d355:     	movq	%rdx, 0x178(%rbp)
14021d35c:     	movq	0x28(%rax,%rcx), %rax
14021d361:     	movq	%rax, 0x180(%rbp)
14021d368:     	xorl	%r15d, %r15d
14021d36b:     	movl	%r15d, %ecx
14021d36e:     	jmp	0x14021d450 <.text+0x21c450>
14021d373:     	movq	$0x0, 0x1b8(%rbp)
14021d37e:     	movq	0x1a0(%rbp), %r10
14021d385:     	movq	0x10(%rcx,%r8), %r9
14021d38a:     	movq	%r9, 0x148(%rbp)
14021d391:     	movq	0x28(%rcx,%r8), %r8
14021d396:     	movq	%r8, 0x150(%rbp)
14021d39d:     	movq	0x188(%rbp), %r11
14021d3a4:     	movq	0x120(%r11), %r8
14021d3ab:     	movq	0x128(%r11), %r9
14021d3b2:     	movq	(%rdx,%r8,8), %r8
14021d3b6:     	notq	%r8
14021d3b9:     	leaq	(%r8,%r8,2), %r8
14021d3bd:     	shlq	$0x4, %r8
14021d3c1:     	movq	0x10(%rcx,%r8), %r15
14021d3c6:     	movq	%r15, 0x158(%rbp)
14021d3cd:     	movq	0x28(%rcx,%r8), %r8
14021d3d2:     	movq	%r8, 0x160(%rbp)
14021d3d9:     	movq	(%rdx,%r9,8), %r8
14021d3dd:     	notq	%r8
14021d3e0:     	leaq	(%r8,%r8,2), %r8
14021d3e4:     	shlq	$0x4, %r8
14021d3e8:     	movq	0x10(%rcx,%r8), %r9
14021d3ed:     	movq	%r9, 0x168(%rbp)
14021d3f4:     	movq	0x28(%rcx,%r8), %r8
14021d3f9:     	movq	%r8, 0x170(%rbp)
14021d400:     	movq	0x130(%r11), %r8
14021d407:     	movq	(%rdx,%r8,8), %rdx
14021d40b:     	notq	%rdx
14021d40e:     	leaq	(%rdx,%rdx,2), %rdx
14021d412:     	shlq	$0x4, %rdx
14021d416:     	movq	0x10(%rcx,%rdx), %r8
14021d41b:     	movq	%r8, 0x178(%rbp)
14021d422:     	movq	0x28(%rcx,%rdx), %rcx
14021d427:     	movq	%rcx, 0x180(%rbp)
14021d42e:     	movq	0x50(%rax), %rax
14021d432:     	movq	%rax, 0xd8(%rbp)
14021d439:     	xorl	%r15d, %r15d
14021d43c:     	movl	%r15d, %eax
14021d43f:     	shlq	$0x4, %rax
14021d443:     	movq	0xd8(%rbp), %rcx
14021d44a:     	movl	0x8(%rcx,%rax), %ecx
14021d44e:     	notl	%ecx
14021d450:     	imulq	$0x38, %rcx, %r12
14021d454:     	addq	0x148(%rbp), %r12
14021d45b:     	movq	0x150(%rbp), %rax
14021d462:     	leaq	(%rax,%rcx,4), %rdx
14021d466:     	movq	0x1b8(%rbp), %rax
14021d46d:     	leaq	(%rax,%rcx), %r8
14021d471:     	movq	0x160(%rbp), %rax
14021d478:     	leaq	(%rax,%rcx,4), %r13
14021d47c:     	leaq	(%rcx,%rcx,2), %r9
14021d480:     	movq	0x170(%rbp), %r11
14021d487:     	leaq	(%r11,%rcx,4), %rax
14021d48b:     	movq	%rax, 0x1a8(%rbp)
14021d492:     	leaq	(%rcx,%rcx,4), %rax
14021d496:     	movq	0x180(%rbp), %r11
14021d49d:     	leaq	(%r11,%rcx,4), %r11
14021d4a1:     	movq	%r11, 0x140(%rbp)
14021d4a8:     	shlq	$0x5, %rcx
14021d4ac:     	addq	0x158(%rbp), %rcx
14021d4b3:     	movq	0x168(%rbp), %r11
14021d4ba:     	leaq	(%r11,%r9,8), %r9
14021d4be:     	movq	%r9, 0x1b0(%rbp)
14021d4c5:     	shlq	$0x4, %rax
14021d4c9:     	addq	0x178(%rbp), %rax
14021d4d0:     	movq	%rax, 0x138(%rbp)
14021d4d7:     	movaps	%xmm9, %xmm0
14021d4db:     	subss	0x30(%r12), %xmm0
14021d4e2:     	divss	%xmm10, %xmm0
14021d4e7:     	xorps	%xmm1, %xmm1
14021d4ea:     	xorps	%xmm2, %xmm2
14021d4ed:     	maxss	%xmm0, %xmm2
14021d4f1:     	movaps	%xmm13, %xmm0
14021d4f5:     	minss	%xmm2, %xmm0
14021d4f9:     	ucomiss	%xmm0, %xmm1
14021d4fc:     	jae	0x14021d52d <.text+0x21c52d>
14021d4fe:     	movaps	%xmm0, %xmm2
14021d501:     	addss	0x56ea003(%rip), %xmm2  # 0x14590750c
14021d509:     	movaps	%xmm2, %xmm1
14021d50c:     	mulss	%xmm2, %xmm1
14021d510:     	mulss	%xmm1, %xmm2
14021d514:     	mulss	0x572a9d4(%rip), %xmm2  # 0x145947ef0
14021d51c:     	addss	%xmm13, %xmm2
14021d521:     	mulss	0x56fb1c7(%rip), %xmm1  # 0x1459186f0
14021d529:     	addss	%xmm2, %xmm1
14021d52d:     	cmpl	$0x1, (%r10)
14021d531:     	jne	0x14021d550 <.text+0x21c550>
14021d533:     	movq	0x8(%r10), %r8
14021d537:     	cmpq	(%r12), %r8
14021d53b:     	sete	%r9b
14021d53f:     	xorps	%xmm0, %xmm0
14021d542:     	jmp	0x14021d566 <.text+0x21c566>
14021d544:     	nopw	%cs:(%rax,%rax)
14021d550:     	ucomiss	%xmm13, %xmm0
14021d554:     	xorps	%xmm0, %xmm0
14021d557:     	movb	$0x2, %r9b
14021d55a:     	jb	0x14021d566 <.text+0x21c566>
14021d55c:     	cmpb	$0x2, (%r8)
14021d560:     	je	0x14021d566 <.text+0x21c566>
14021d562:     	movaps	%xmm13, %xmm0
14021d566:     	subss	0x34(%r12), %xmm0
14021d56d:     	mulss	%xmm8, %xmm0
14021d572:     	movl	0xec(%rbp), %r8d
14021d579:     	movl	%r8d, (%rdx)
14021d57c:     	addss	0x34(%r12), %xmm0
14021d583:     	movss	%xmm0, 0x34(%r12)
14021d58a:     	xorps	%xmm2, %xmm2
14021d58d:     	maxss	%xmm1, %xmm2
14021d591:     	movss	0x572a963(%rip), %xmm3  # 0x145947efc
14021d599:     	minss	%xmm2, %xmm3
14021d59d:     	movaps	%xmm13, %xmm2
14021d5a1:     	subss	%xmm1, %xmm2
14021d5a5:     	mulss	0x56e9f8b(%rip), %xmm1  # 0x145907538
14021d5ad:     	addss	0x56f82f3(%rip), %xmm1  # 0x1459158a8
14021d5b5:     	unpcklps	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
14021d5b8:     	mulss	0x572df20(%rip), %xmm2  # 0x14594b4e0
14021d5c0:     	movaps	%xmm0, %xmm1
14021d5c3:     	mulss	0x572df19(%rip), %xmm1  # 0x14594b4e4
14021d5cb:     	addss	%xmm13, %xmm1
14021d5d0:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14021d5d4:     	mulps	%xmm3, %xmm1
14021d5d7:     	mulss	0x5722b81(%rip), %xmm0  # 0x145940160
14021d5df:     	addss	%xmm2, %xmm0
14021d5e3:     	cmpb	$0x2, %r9b
14021d5e7:     	je	0x14021d657 <.text+0x21c657>
14021d5e9:     	cmpb	$0x0, 0x10(%r10)
14021d5ee:     	je	0x14021d657 <.text+0x21c657>
14021d5f0:     	movaps	%xmm6, %xmm2
14021d5f3:     	subss	0x14(%r10), %xmm2
14021d5f9:     	divss	0x572295f(%rip), %xmm2  # 0x14593ff60
14021d601:     	xorps	%xmm3, %xmm3
14021d604:     	maxss	%xmm2, %xmm3
14021d608:     	movaps	%xmm13, %xmm2
14021d60c:     	minss	%xmm3, %xmm2
14021d610:     	movaps	%xmm2, %xmm3
14021d613:     	testb	$0x1, %r9b
14021d617:     	je	0x14021d637 <.text+0x21c637>
14021d619:     	mulss	0x56f5ccf(%rip), %xmm3  # 0x1459132f0
14021d621:     	addss	%xmm13, %xmm3
14021d626:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
14021d62a:     	mulps	%xmm3, %xmm1
14021d62d:     	mulss	0x572deb7(%rip), %xmm2  # 0x14594b4ec
14021d635:     	jmp	0x14021d653 <.text+0x21c653>
14021d637:     	mulss	0x572dea9(%rip), %xmm3  # 0x14594b4e8
14021d63f:     	addss	%xmm13, %xmm3
14021d644:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
14021d648:     	mulps	%xmm3, %xmm1
14021d64b:     	mulss	0x56f5cfd(%rip), %xmm2  # 0x145913350
14021d653:     	addss	%xmm2, %xmm0
14021d657:     	movlps	%xmm1, 0x10(%rcx)
14021d65b:     	movl	0xf0(%rbp), %edx
14021d661:     	movl	%edx, (%r13)
14021d665:     	movq	$0x1, (%rcx)
14021d66c:     	movl	$0x1, 0x8(%rcx)
14021d673:     	movss	%xmm0, 0xc(%rcx)
14021d678:     	movss	0x34(%r12), %xmm7
14021d67f:     	xorps	%xmm11, %xmm11
14021d683:     	testb	$0x1, %r9b
14021d687:     	je	0x14021d68d <.text+0x21c68d>
14021d689:     	movaps	%xmm13, %xmm11
14021d68d:     	callq	0x140002200 <.text+0x1200>
14021d692:     	movl	$0x68, %ecx
14021d697:     	movl	$0x4, %edx
14021d69c:     	callq	0x1400021c0 <.text+0x11c0>
14021d6a1:     	testq	%rax, %rax
14021d6a4:     	je	0x14021df2b <.text+0x21cf2b>
14021d6aa:     	movq	%rax, 0x198(%rbp)
14021d6b1:     	leaq	0x80(%rbp), %r13
14021d6b8:     	movq	%rbx, %r14
14021d6bb:     	movaps	0x572dc0e(%rip), %xmm0  # 0x14594b2d0
14021d6c2:     	movups	%xmm0, 0x84(%rbp)
14021d6c9:     	movl	$0x0, 0x80(%rbp)
14021d6d3:     	leaq	0x120(%rbp), %rbx
14021d6da:     	movq	%rbx, %rcx
14021d6dd:     	movq	%r13, %rdx
14021d6e0:     	callq	0x144c8c290 <.text+0x4c8b290>
14021d6e5:     	nop
14021d6e6:     	maxss	%xmm11, %xmm7
14021d6eb:     	movaps	0x120(%rbp), %xmm11
14021d6f3:     	movaps	%xmm7, %xmm0
14021d6f6:     	mulss	%xmm10, %xmm0
14021d6fb:     	movups	0x8(%r12), %xmm1
14021d701:     	movaps	%xmm1, 0x80(%rbp)
14021d708:     	movss	%xmm0, 0x90(%rbp)
14021d710:     	movq	%rbx, %rcx
14021d713:     	movq	%r13, %rdx
14021d716:     	callq	0x144c8c290 <.text+0x4c8b290>
14021d71b:     	nop
14021d71c:     	movaps	%xmm7, %xmm0
14021d71f:     	mulss	0x57220b9(%rip), %xmm0  # 0x14593f7e0
14021d727:     	addss	0x56fb351(%rip), %xmm0  # 0x145918a80
14021d72f:     	movaps	0x120(%rbp), %xmm1
14021d736:     	movq	0x198(%rbp), %r13
14021d73d:     	movq	$0x1, (%r13)
14021d745:     	movl	$0x1, 0x8(%r13)
14021d74d:     	movss	%xmm0, 0xc(%r13)
14021d753:     	movups	%xmm15, 0x10(%r13)
14021d758:     	movl	$0x1, 0x20(%r13)
14021d760:     	movups	%xmm11, 0x24(%r13)
14021d765:     	movups	%xmm14, 0x34(%r13)
14021d76a:     	movups	%xmm12, 0x44(%r13)
14021d76f:     	movl	$0x1, 0x54(%r13)
14021d777:     	movups	%xmm1, 0x58(%r13)
14021d77c:     	movl	0xf4(%rbp), %eax
14021d782:     	movq	0x1a8(%rbp), %rcx
14021d789:     	movl	%eax, (%rcx)
14021d78b:     	movq	0x1b0(%rbp), %rbx
14021d792:     	movq	(%rbx), %rax
14021d795:     	testq	%rax, %rax
14021d798:     	je	0x14021d080 <.text+0x21c080>
14021d79e:     	movq	0x8(%rbx), %rcx
14021d7a2:     	imulq	$0x34, %rax, %rdx
14021d7a6:     	movl	$0x4, %r8d
14021d7ac:     	callq	0x1400021d0 <.text+0x11d0>
14021d7b1:     	jmp	0x14021d080 <.text+0x21c080>
14021d7b6:     	movq	0x108(%rbp), %rcx
14021d7bd:     	movq	0xf8(%rcx), %rsi
14021d7c4:     	movq	0x100(%rcx), %rax
14021d7cb:     	leaq	(%rsi,%rax,4), %r12
14021d7cf:     	movzbl	0x108(%rcx), %eax
14021d7d6:     	movb	%al, 0x140(%rbp)
14021d7dc:     	movss	0x572dd2c(%rip), %xmm7  # 0x14594b510
14021d7e4:     	mulss	%xmm6, %xmm7
14021d7e8:     	xorl	%r15d, %r15d
14021d7eb:     	movl	$0x8, %eax
14021d7f0:     	movq	%rax, 0x198(%rbp)
14021d7f7:     	movaps	0x572daf1(%rip), %xmm8  # 0x14594b2f0
14021d7ff:     	movaps	0x572daf9(%rip), %xmm9  # 0x14594b300
14021d807:     	movaps	0x572db01(%rip), %xmm10 # 0x14594b310
14021d80f:     	movaps	0x572db09(%rip), %xmm11 # 0x14594b320
14021d817:     	movq	$0x0, 0x1b0(%rbp)
14021d822:     	xorl	%edi, %edi
14021d824:     	jmp	0x14021d84c <.text+0x21c84c>
14021d826:     	nopw	%cs:(%rax,%rax)
14021d830:     	movl	0x138(%rbp), %edi
14021d836:     	incl	%edi
14021d838:     	movq	$0x1, (%r13)
14021d840:     	movq	%r14, 0x8(%r13)
14021d844:     	movq	$0x1, 0x10(%r13)
14021d84c:     	movq	0xd0(%rbp), %rdx
14021d853:     	cmpb	$0x0, 0x140(%rbp)
14021d85a:     	je	0x14021d8e0 <.text+0x21c8e0>
14021d860:     	cmpl	%r15d, %edi
14021d863:     	jne	0x14021d8d7 <.text+0x21c8d7>
14021d865:     	nopw	%cs:(%rax,%rax)
14021d870:     	cmpq	%r12, %rsi
14021d873:     	je	0x14021db59 <.text+0x21cb59>
14021d879:     	movl	(%rsi), %ecx
14021d87b:     	addq	$0x4, %rsi
14021d87f:     	movq	0x1a8(%rdx), %rax
14021d886:     	leaq	(%rcx,%rcx,8), %rcx
14021d88a:     	movq	0x10(%rax,%rcx,8), %r15
14021d88f:     	testq	%r15, %r15
14021d892:     	je	0x14021d870 <.text+0x21c870>
14021d894:     	leaq	(%rax,%rcx,8), %rax
14021d898:     	movq	0x108(%rbp), %rcx
14021d89f:     	movq	0x110(%rcx), %rcx
14021d8a6:     	movq	0x18(%rax), %rdx
14021d8aa:     	movq	0x38(%rax), %rax
14021d8ae:     	movq	(%rax,%rcx,8), %rax
14021d8b2:     	notq	%rax
14021d8b5:     	leaq	(%rax,%rax,2), %rax
14021d8b9:     	shlq	$0x4, %rax
14021d8bd:     	movq	0x10(%rdx,%rax), %rcx
14021d8c2:     	movq	%rcx, 0x1b0(%rbp)
14021d8c9:     	movq	0x28(%rdx,%rax), %rax
14021d8ce:     	movq	%rax, 0x1a8(%rbp)
14021d8d5:     	xorl	%edi, %edi
14021d8d7:     	movl	%edi, %eax
14021d8d9:     	jmp	0x14021d98b <.text+0x21c98b>
14021d8de:     	nop
14021d8e0:     	cmpl	%r15d, %edi
14021d8e3:     	jne	0x14021d978 <.text+0x21c978>
14021d8e9:     	nopl	(%rax)
14021d8f0:     	cmpq	%r12, %rsi
14021d8f3:     	je	0x14021db59 <.text+0x21cb59>
14021d8f9:     	movl	(%rsi), %ecx
14021d8fb:     	addq	$0x4, %rsi
14021d8ff:     	movq	0x108(%rdx), %rax
14021d906:     	leaq	(%rcx,%rcx,4), %rcx
14021d90a:     	shlq	$0x5, %rcx
14021d90e:     	movq	0x58(%rax,%rcx), %r15
14021d913:     	testq	%r15, %r15
14021d916:     	je	0x14021d8f0 <.text+0x21c8f0>
14021d918:     	addq	%rcx, %rax
14021d91b:     	movl	0x94(%rax), %ecx
14021d921:     	movq	0x1a8(%rdx), %rdx
14021d928:     	leaq	(%rcx,%rcx,8), %rcx
14021d92c:     	movq	0x108(%rbp), %r8
14021d933:     	movq	0x110(%r8), %r8
14021d93a:     	movq	0x18(%rdx,%rcx,8), %r9
14021d93f:     	movq	0x38(%rdx,%rcx,8), %rcx
14021d944:     	movq	(%rcx,%r8,8), %rcx
14021d948:     	notq	%rcx
14021d94b:     	leaq	(%rcx,%rcx,2), %rcx
14021d94f:     	shlq	$0x4, %rcx
14021d953:     	movq	0x10(%r9,%rcx), %rdx
14021d958:     	movq	%rdx, 0x1b0(%rbp)
14021d95f:     	movq	0x28(%r9,%rcx), %rcx
14021d964:     	movq	%rcx, 0x1a8(%rbp)
14021d96b:     	movq	0x50(%rax), %rax
14021d96f:     	movq	%rax, 0x198(%rbp)
14021d976:     	xorl	%edi, %edi
14021d978:     	movl	%edi, %eax
14021d97a:     	shlq	$0x4, %rax
14021d97e:     	movq	0x198(%rbp), %rcx
14021d985:     	movl	0x8(%rcx,%rax), %eax
14021d989:     	notl	%eax
14021d98b:     	leaq	(%rax,%rax,2), %rcx
14021d98f:     	movq	0x1b0(%rbp), %rdx
14021d996:     	leaq	(%rdx,%rcx,8), %r13
14021d99a:     	movq	0x1a8(%rbp), %rcx
14021d9a1:     	leaq	(%rcx,%rax,4), %rbx
14021d9a5:     	movl	$0x0, -0x50(%rbp)
14021d9ac:     	movups	%xmm8, -0x4c(%rbp)
14021d9b1:     	movl	$0x0, -0x3c(%rbp)
14021d9b8:     	movups	%xmm9, -0x38(%rbp)
14021d9bd:     	movl	$0x0, -0x28(%rbp)
14021d9c4:     	movups	%xmm10, -0x24(%rbp)
14021d9c9:     	movl	$0x0, -0x14(%rbp)
14021d9d0:     	movups	%xmm11, -0x10(%rbp)
14021d9d5:     	movl	$0x0, (%rbp)
14021d9dc:     	movups	%xmm8, 0x4(%rbp)
14021d9e1:     	leaq	-0x50(%rbp), %rax
14021d9e5:     	movq	%rax, 0x120(%rbp)
14021d9ec:     	leaq	0x14(%rbp), %rax
14021d9f0:     	movq	%rax, 0x128(%rbp)
14021d9f7:     	movq	$0x0, 0x130(%rbp)
14021da02:     	leaq	0x80(%rbp), %rcx
14021da09:     	leaq	0x120(%rbp), %rdx
14021da10:     	callq	0x1401b0420 <.text+0x1af420>
14021da15:     	movb	$0x0, 0xb4(%rbp)
14021da1c:     	movups	0x572ece1(%rip), %xmm0  # 0x14594c704
14021da23:     	leaq	0x98(%rbp), %rax
14021da2a:     	movups	%xmm0, (%rax)
14021da2d:     	movq	$0x0, 0x10(%rax)
14021da35:     	movss	%xmm7, 0xb0(%rbp)
14021da3d:     	callq	0x140002200 <.text+0x1200>
14021da42:     	movl	$0x48, %ecx
14021da47:     	movl	$0x8, %edx
14021da4c:     	callq	0x1400021c0 <.text+0x11c0>
14021da51:     	testq	%rax, %rax
14021da54:     	je	0x14021df3c <.text+0x21cf3c>
14021da5a:     	movq	%rax, %r14
14021da5d:     	movl	%edi, 0x138(%rbp)
14021da63:     	movq	0xb0(%rbp), %rax
14021da6a:     	movq	%rax, 0x38(%r14)
14021da6e:     	movups	0x80(%rbp), %xmm0
14021da75:     	movups	0x90(%rbp), %xmm1
14021da7c:     	movups	0xa0(%rbp), %xmm2
14021da83:     	movups	%xmm2, 0x28(%r14)
14021da88:     	movups	%xmm1, 0x18(%r14)
14021da8d:     	movups	%xmm0, 0x8(%r14)
14021da92:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
14021da9c:     	movq	%rax, (%r14)
14021da9f:     	movl	0xfc(%rbp), %eax
14021daa5:     	movl	%eax, (%rbx)
14021daa7:     	movq	0x10(%r13), %rbx
14021daab:     	testq	%rbx, %rbx
14021daae:     	je	0x14021db30 <.text+0x21cb30>
14021dab4:     	movq	0x8(%r13), %rdi
14021dab8:     	addq	$0x8, %rdi
14021dabc:     	jmp	0x14021daea <.text+0x21caea>
14021dabe:     	nop
14021dac0:     	movq	(%rdi), %rdx
14021dac3:     	movl	$0x10, %eax
14021dac8:     	testq	%rdx, %rdx
14021dacb:     	je	0x14021dae1 <.text+0x21cae1>
14021dacd:     	movq	-0x8(%rdi,%rax), %rcx
14021dad2:     	shlq	$0x5, %rdx
14021dad6:     	movl	$0x4, %r8d
14021dadc:     	callq	0x1400021d0 <.text+0x11d0>
14021dae1:     	addq	$0x48, %rdi
14021dae5:     	decq	%rbx
14021dae8:     	je	0x14021db30 <.text+0x21cb30>
14021daea:     	movq	-0x8(%rdi), %rdx
14021daee:     	movq	%rdx, %rax
14021daf1:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
14021dafb:     	xorq	%rcx, %rax
14021dafe:     	testq	%rdx, %rdx
14021db01:     	movl	$0x1, %ecx
14021db06:     	cmovnsq	%rcx, %rax
14021db0a:     	testq	%rax, %rax
14021db0d:     	je	0x14021dac0 <.text+0x21cac0>
14021db0f:     	cmpq	$0x1, %rax
14021db13:     	jne	0x14021dac0 <.text+0x21cac0>
14021db15:     	movl	$0x8, %eax
14021db1a:     	testq	%rdx, %rdx
14021db1d:     	jne	0x14021dacd <.text+0x21cacd>
14021db1f:     	jmp	0x14021dae1 <.text+0x21cae1>
14021db21:     	nopw	%cs:(%rax,%rax)
14021db30:     	movq	(%r13), %rax
14021db34:     	testq	%rax, %rax
14021db37:     	je	0x14021d830 <.text+0x21c830>
14021db3d:     	movq	0x8(%r13), %rcx
14021db41:     	shlq	$0x3, %rax
14021db45:     	leaq	(%rax,%rax,8), %rdx
14021db49:     	movl	$0x8, %r8d
14021db4f:     	callq	0x1400021d0 <.text+0x11d0>
14021db54:     	jmp	0x14021d830 <.text+0x21c830>
14021db59:     	movss	0x56f7d5b(%rip), %xmm0  # 0x1459158bc
14021db61:     	mulss	%xmm6, %xmm0
14021db65:     	callq	0x145773235 <.text+0x5772235>
14021db6a:     	mulss	0x572d9a2(%rip), %xmm0  # 0x14594b514
14021db72:     	addss	0x56e9916(%rip), %xmm0  # 0x145907490
14021db7a:     	movq	0x118(%rbp), %rdx
14021db81:     	movq	0xf8(%rdx), %rax
14021db88:     	movq	0x100(%rdx), %rcx
14021db8f:     	leaq	(%rax,%rcx,4), %rcx
14021db93:     	cmpb	$0x0, 0x108(%rdx)
14021db9a:     	je	0x14021dbb3 <.text+0x21cbb3>
14021db9c:     	xorl	%edx, %edx
14021db9e:     	xorl	%r9d, %r9d
14021dba1:     	xorl	%r10d, %r10d
14021dba4:     	movq	0x100(%rbp), %rsi
14021dbab:     	movl	0x190(%rbp), %edi
14021dbb1:     	jmp	0x14021dc32 <.text+0x21cc32>
14021dbb3:     	xorl	%edx, %edx
14021dbb5:     	movl	$0x8, %r8d
14021dbbb:     	xorl	%r10d, %r10d
14021dbbe:     	xorl	%r11d, %r11d
14021dbc1:     	movq	0x100(%rbp), %rsi
14021dbc8:     	movl	0x190(%rbp), %edi
14021dbce:     	jmp	0x14021dceb <.text+0x21cceb>
14021dbd3:     	nopw	%cs:(%rax,%rax)
14021dbe0:     	leaq	(%r8,%r9,8), %r8
14021dbe4:     	movq	0x118(%rbp), %r9
14021dbeb:     	movq	0x110(%r9), %r9
14021dbf2:     	movq	0x18(%r8), %r10
14021dbf6:     	movq	0x38(%r8), %r8
14021dbfa:     	movq	(%r8,%r9,8), %r8
14021dbfe:     	notq	%r8
14021dc01:     	leaq	(%r8,%r8,2), %r8
14021dc05:     	shlq	$0x4, %r8
14021dc09:     	movq	0x10(%r10,%r8), %r9
14021dc0e:     	movq	0x28(%r10,%r8), %r8
14021dc13:     	xorl	%r10d, %r10d
14021dc16:     	movl	%r10d, %r11d
14021dc19:     	incl	%r10d
14021dc1c:     	movl	%edi, (%r8,%r11,4)
14021dc20:     	shlq	$0x5, %r11
14021dc24:     	movss	%xmm0, 0x10(%r9,%r11)
14021dc2b:     	movss	%xmm0, 0x14(%r9,%r11)
14021dc32:     	cmpl	%edx, %r10d
14021dc35:     	jne	0x14021dc16 <.text+0x21cc16>
14021dc37:     	nopw	(%rax,%rax)
14021dc40:     	cmpq	%rcx, %rax
14021dc43:     	je	0x14021dd19 <.text+0x21cd19>
14021dc49:     	movl	(%rax), %edx
14021dc4b:     	addq	$0x4, %rax
14021dc4f:     	movq	0x1a8(%rsi), %r8
14021dc56:     	leaq	(%rdx,%rdx,8), %r9
14021dc5a:     	movq	0x10(%r8,%r9,8), %rdx
14021dc5f:     	testq	%rdx, %rdx
14021dc62:     	je	0x14021dc40 <.text+0x21cc40>
14021dc64:     	jmp	0x14021dbe0 <.text+0x21cbe0>
14021dc69:     	nopl	(%rax)
14021dc70:     	addq	%r9, %r8
14021dc73:     	movl	0x94(%r8), %r9d
14021dc7a:     	movq	0x1a8(%rsi), %r10
14021dc81:     	leaq	(%r9,%r9,8), %r9
14021dc85:     	movq	0x118(%rbp), %r11
14021dc8c:     	movq	0x110(%r11), %r11
14021dc93:     	movq	0x18(%r10,%r9,8), %rsi
14021dc98:     	movq	0x38(%r10,%r9,8), %r9
14021dc9d:     	movq	(%r9,%r11,8), %r9
14021dca1:     	notq	%r9
14021dca4:     	leaq	(%r9,%r9,2), %r9
14021dca8:     	shlq	$0x4, %r9
14021dcac:     	movq	0x10(%rsi,%r9), %r10
14021dcb1:     	movq	0x28(%rsi,%r9), %r9
14021dcb6:     	movq	0x50(%r8), %r8
14021dcba:     	xorl	%r11d, %r11d
14021dcbd:     	movl	%r11d, %esi
14021dcc0:     	shlq	$0x4, %rsi
14021dcc4:     	incl	%r11d
14021dcc7:     	movl	0x8(%r8,%rsi), %esi
14021dccc:     	notl	%esi
14021dcce:     	movl	%edi, (%r9,%rsi,4)
14021dcd2:     	shlq	$0x5, %rsi
14021dcd6:     	movss	%xmm0, 0x10(%r10,%rsi)
14021dcdd:     	movss	%xmm0, 0x14(%r10,%rsi)
14021dce4:     	movq	0x100(%rbp), %rsi
14021dceb:     	cmpl	%edx, %r11d
14021dcee:     	jne	0x14021dcbd <.text+0x21ccbd>
14021dcf0:     	cmpq	%rcx, %rax
14021dcf3:     	je	0x14021dd19 <.text+0x21cd19>
14021dcf5:     	movl	(%rax), %edx
14021dcf7:     	addq	$0x4, %rax
14021dcfb:     	movq	0x108(%rsi), %r8
14021dd02:     	leaq	(%rdx,%rdx,4), %r9
14021dd06:     	shlq	$0x5, %r9
14021dd0a:     	movq	0x58(%r8,%r9), %rdx
14021dd0f:     	testq	%rdx, %rdx
14021dd12:     	je	0x14021dcf0 <.text+0x21ccf0>
14021dd14:     	jmp	0x14021dc70 <.text+0x21cc70>
14021dd19:     	movq	0x110(%rbp), %rbx
14021dd20:     	movq	0xf8(%rbx), %rsi
14021dd27:     	movq	0x100(%rbx), %rax
14021dd2e:     	leaq	(%rsi,%rax,4), %rdi
14021dd32:     	mulss	0x56f55b6(%rip), %xmm6  # 0x1459132f0
14021dd3a:     	movaps	%xmm6, %xmm0
14021dd3d:     	callq	0x145773235 <.text+0x5772235>
14021dd42:     	movaps	%xmm0, %xmm7
14021dd45:     	movaps	%xmm6, %xmm0
14021dd48:     	callq	0x145773247 <.text+0x5772247>
14021dd4d:     	cmpb	$0x0, 0x108(%rbx)
14021dd54:     	je	0x14021dd6d <.text+0x21cd6d>
14021dd56:     	xorl	%eax, %eax
14021dd58:     	xorl	%edx, %edx
14021dd5a:     	xorl	%r8d, %r8d
14021dd5d:     	movq	0xe0(%rbp), %r10
14021dd64:     	movl	0x194(%rbp), %r11d
14021dd6b:     	jmp	0x14021dde2 <.text+0x21cde2>
14021dd6d:     	xorl	%eax, %eax
14021dd6f:     	movl	$0x8, %ecx
14021dd74:     	xorl	%r8d, %r8d
14021dd77:     	xorl	%r9d, %r9d
14021dd7a:     	movq	0xe0(%rbp), %r11
14021dd81:     	movl	0x194(%rbp), %ebx
14021dd87:     	jmp	0x14021de94 <.text+0x21ce94>
14021dd8c:     	nopl	(%rax)
14021dd90:     	leaq	(%rcx,%rdx,8), %rcx
14021dd94:     	movq	0x110(%rbp), %rdx
14021dd9b:     	movq	0x110(%rdx), %rdx
14021dda2:     	movq	0x18(%rcx), %r8
14021dda6:     	movq	0x38(%rcx), %rcx
14021ddaa:     	movq	(%rcx,%rdx,8), %rcx
14021ddae:     	notq	%rcx
14021ddb1:     	leaq	(%rcx,%rcx,2), %rcx
14021ddb5:     	shlq	$0x4, %rcx
14021ddb9:     	movq	0x10(%r8,%rcx), %rdx
14021ddbe:     	movq	0x28(%r8,%rcx), %rcx
14021ddc3:     	xorl	%r8d, %r8d
14021ddc6:     	movl	%r8d, %r9d
14021ddc9:     	incl	%r8d
14021ddcc:     	movl	%r11d, (%rcx,%r9,4)
14021ddd0:     	shlq	$0x5, %r9
14021ddd4:     	movss	%xmm0, 0x18(%rdx,%r9)
14021dddb:     	movss	%xmm7, 0x1c(%rdx,%r9)
14021dde2:     	cmpl	%eax, %r8d
14021dde5:     	jne	0x14021ddc6 <.text+0x21cdc6>
14021dde7:     	nopw	(%rax,%rax)
14021ddf0:     	cmpq	%rdi, %rsi
14021ddf3:     	je	0x14021dec9 <.text+0x21cec9>
14021ddf9:     	movl	(%rsi), %eax
14021ddfb:     	addq	$0x4, %rsi
14021ddff:     	movq	0x1a8(%r10), %rcx
14021de06:     	leaq	(%rax,%rax,8), %rdx
14021de0a:     	movq	0x10(%rcx,%rdx,8), %rax
14021de0f:     	testq	%rax, %rax
14021de12:     	je	0x14021ddf0 <.text+0x21cdf0>
14021de14:     	jmp	0x14021dd90 <.text+0x21cd90>
14021de19:     	nopl	(%rax)
14021de20:     	addq	%rdx, %rcx
14021de23:     	movl	0x94(%rcx), %edx
14021de29:     	movq	0x1a8(%r11), %r8
14021de30:     	leaq	(%rdx,%rdx,8), %rdx
14021de34:     	movq	0x110(%rbp), %r9
14021de3b:     	movq	0x110(%r9), %r9
14021de42:     	movq	0x18(%r8,%rdx,8), %r10
14021de47:     	movq	0x38(%r8,%rdx,8), %rdx
14021de4c:     	movq	(%rdx,%r9,8), %rdx
14021de50:     	notq	%rdx
14021de53:     	leaq	(%rdx,%rdx,2), %rdx
14021de57:     	shlq	$0x4, %rdx
14021de5b:     	movq	0x10(%r10,%rdx), %r8
14021de60:     	movq	0x28(%r10,%rdx), %rdx
14021de65:     	movq	0x50(%rcx), %rcx
14021de69:     	xorl	%r9d, %r9d
14021de6c:     	movl	%r9d, %r10d
14021de6f:     	shlq	$0x4, %r10
14021de73:     	incl	%r9d
14021de76:     	movl	0x8(%rcx,%r10), %r10d
14021de7b:     	notl	%r10d
14021de7e:     	movl	%ebx, (%rdx,%r10,4)
14021de82:     	shlq	$0x5, %r10
14021de86:     	movss	%xmm0, 0x18(%r8,%r10)
14021de8d:     	movss	%xmm7, 0x1c(%r8,%r10)
14021de94:     	cmpl	%eax, %r9d
14021de97:     	jne	0x14021de6c <.text+0x21ce6c>
14021de99:     	nopl	(%rax)
14021dea0:     	cmpq	%rdi, %rsi
14021dea3:     	je	0x14021dec9 <.text+0x21cec9>
14021dea5:     	movl	(%rsi), %eax
14021dea7:     	addq	$0x4, %rsi
14021deab:     	movq	0x108(%r11), %rcx
14021deb2:     	leaq	(%rax,%rax,4), %rdx
14021deb6:     	shlq	$0x5, %rdx
14021deba:     	movq	0x58(%rcx,%rdx), %rax
14021debf:     	testq	%rax, %rax
14021dec2:     	je	0x14021dea0 <.text+0x21cea0>
14021dec4:     	jmp	0x14021de20 <.text+0x21ce20>
14021dec9:     	movaps	0x1d0(%rbp), %xmm6
14021ded0:     	movaps	0x1e0(%rbp), %xmm7
14021ded7:     	movaps	0x1f0(%rbp), %xmm8
14021dedf:     	movaps	0x200(%rbp), %xmm9
14021dee7:     	movaps	0x210(%rbp), %xmm10
14021deef:     	movaps	0x220(%rbp), %xmm11
14021def7:     	movaps	0x230(%rbp), %xmm12
14021deff:     	movaps	0x240(%rbp), %xmm13
14021df07:     	movaps	0x250(%rbp), %xmm14
14021df0f:     	movaps	0x260(%rbp), %xmm15
14021df17:     	addq	$0x2f8, %rsp            # imm = 0x2F8
14021df1e:     	popq	%rbx
14021df1f:     	popq	%rdi
14021df20:     	popq	%rsi
14021df21:     	popq	%r12
14021df23:     	popq	%r13
14021df25:     	popq	%r14
14021df27:     	popq	%r15
14021df29:     	popq	%rbp
14021df2a:     	retq
14021df2b:     	movl	$0x4, %ecx
14021df30:     	movl	$0x68, %edx
14021df35:     	callq	0x145903781 <.text+0x5902781>
14021df3a:     	ud2
14021df3c:     	movl	$0x8, %ecx
14021df41:     	movl	$0x48, %edx
14021df46:     	callq	0x145903781 <.text+0x5902781>
14021df4b:     	nop
14021df4c:     	ud2
