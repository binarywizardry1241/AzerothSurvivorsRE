
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c9e92:     	movl	0x134(%rdi), %esi
1454c9e98:     	testl	%esi, %esi
1454c9e9a:     	je	0x1454c9f41 <.text+0x54c8f41>
1454c9ea0:     	ucomiss	0xa4(%rdi), %xmm6
1454c9ea7:     	jb	0x1454c9f41 <.text+0x54c8f41>
1454c9ead:     	movq	0x88(%rdi), %rbx
1454c9eb4:     	movl	$0x0, 0x134(%rdi)
1454c9ebe:     	movq	0x160(%rbp), %rdi
1454c9ec5:     	cmpq	0x150(%rbp), %rdi
1454c9ecc:     	jne	0x1454c9f1a <.text+0x54c8f1a>
1454c9ece:     	movb	$0x1, 0x2b7(%rbp)
1454c9ed5:     	movb	$0x1, 0x2b6(%rbp)
1454c9edc:     	movb	$0x1, 0x2b5(%rbp)
1454c9ee3:     	movb	$0x1, 0x2b4(%rbp)
1454c9eea:     	movb	$0x1, 0x2b3(%rbp)
1454c9ef1:     	movb	$0x1, 0x2b2(%rbp)
1454c9ef8:     	movb	$0x1, 0x2b1(%rbp)
1454c9eff:     	movb	$0x1, 0x2b0(%rbp)
1454c9f06:     	movb	$0x1, 0x2af(%rbp)
1454c9f0d:     	leaq	0x150(%rbp), %rcx
1454c9f14:     	callq	0x145758200 <.text+0x5757200>
1454c9f19:     	nop
1454c9f1a:     	movq	0x158(%rbp), %rax
1454c9f21:     	movq	%rdi, %rcx
1454c9f24:     	shlq	$0x4, %rcx
1454c9f28:     	movq	%rbx, (%rax,%rcx)
1454c9f2c:     	movl	%esi, 0x8(%rax,%rcx)
1454c9f30:     	incq	%rdi
1454c9f33:     	movq	%rdi, 0x160(%rbp)
1454c9f3a:     	movq	0x290(%rbp), %rdi
1454c9f41:     	movss	0x140(%rdi), %xmm0
1454c9f49:     	ucomiss	%xmm6, %xmm0
1454c9f4c:     	jbe	0x1454c9fe0 <.text+0x54c8fe0>
1454c9f52:     	ucomiss	0x12c(%rdi), %xmm6
1454c9f59:     	movq	0x2a0(%rbp), %r12
1454c9f60:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454c9f66:     	movss	0x128(%rdi), %xmm0
1454c9f6e:     	ucomiss	%xmm0, %xmm8
1454c9f72:     	jae	0x1454ca164 <.text+0x54c9164>
1454c9f78:     	movaps	%xmm6, %xmm1
1454c9f7b:     	subss	0x124(%rdi), %xmm1
1454c9f83:     	divss	%xmm0, %xmm1
1454c9f87:     	xorps	%xmm0, %xmm0
1454c9f8a:     	maxss	%xmm1, %xmm0
1454c9f8e:     	movaps	%xmm11, %xmm1
1454c9f92:     	minss	%xmm0, %xmm1
1454c9f96:     	movsd	0x10c(%rdi), %xmm0
1454c9f9e:     	movsd	0x118(%rdi), %xmm2
1454c9fa6:     	subps	%xmm0, %xmm2
1454c9fa9:     	movsldup	%xmm1, %xmm13           # xmm13 = xmm1[0,0,2,2]
1454c9fae:     	mulps	%xmm2, %xmm13
1454c9fb2:     	addps	%xmm0, %xmm13
1454c9fb6:     	movss	0x114(%rdi), %xmm0
1454c9fbe:     	movss	0x120(%rdi), %xmm15
1454c9fc7:     	subss	%xmm0, %xmm15
1454c9fcc:     	mulss	%xmm1, %xmm15
1454c9fd1:     	addss	%xmm0, %xmm15
1454c9fd6:     	jmp	0x1454ca176 <.text+0x54c9176>
1454c9fdb:     	nopl	(%rax,%rax)
1454c9fe0:     	movss	0x144(%rdi), %xmm0
1454c9fe8:     	ucomiss	%xmm6, %xmm0
1454c9feb:     	movq	0x2a0(%rbp), %r12
1454c9ff2:     	ja	0x1454c9a4c <.text+0x54c8a4c>
1454c9ff8:     	ucomiss	%xmm8, %xmm0
1454c9ffc:     	jbe	0x1454ca2a7 <.text+0x54c92a7>
1454ca002:     	ucomiss	%xmm0, %xmm6
1454ca005:     	jb	0x1454ca2a7 <.text+0x54c92a7>
1454ca00b:     	movl	$0x0, 0x144(%rdi)
1454ca015:     	movss	0x28(%rbp), %xmm0
1454ca01a:     	movss	%xmm0, 0x14c(%rdi)
1454ca022:     	movups	0xb0(%rdi), %xmm0
1454ca029:     	movups	0xc0(%rdi), %xmm1
1454ca030:     	movups	0xd0(%rdi), %xmm2
1454ca037:     	movups	0xe0(%rdi), %xmm3
1454ca03e:     	leaq	0x200(%rbp), %rax
1454ca045:     	movups	%xmm3, 0x30(%rax)
1454ca049:     	movups	%xmm2, 0x20(%rax)
1454ca04d:     	movups	%xmm1, 0x10(%rax)
1454ca051:     	movups	%xmm0, (%rax)
1454ca054:     	movq	$0x10, 0x1f8(%rbp)
1454ca05f:     	xorl	%eax, %eax
1454ca061:     	jmp	0x1454ca090 <.text+0x54c9090>
1454ca063:     	movq	0x158(%rbp), %rax
1454ca06a:     	movq	%rsi, %rcx
1454ca06d:     	shlq	$0x4, %rcx
1454ca071:     	movq	%rdi, (%rax,%rcx)
1454ca075:     	movl	%r15d, 0x8(%rax,%rcx)
1454ca07a:     	incq	%rsi
1454ca07d:     	movq	%rsi, 0x160(%rbp)
1454ca084:     	movq	%r14, %rax
1454ca087:     	movq	0x290(%rbp), %rdi
1454ca08e:     	nop
1454ca090:     	cmpq	$0x10, %rax
1454ca094:     	je	0x1454ca2a0 <.text+0x54c92a0>
1454ca09a:     	leaq	0x1(%rax), %r14
1454ca09e:     	movq	%r14, 0x1f0(%rbp)
1454ca0a5:     	movl	0x200(%rbp,%rax,4), %r15d
1454ca0ad:     	movq	%r14, %rax
1454ca0b0:     	testl	%r15d, %r15d
1454ca0b3:     	je	0x1454ca090 <.text+0x54c9090>
1454ca0b5:     	movq	%r14, %rax
1454ca0b8:     	cmpl	0x134(%rdi), %r15d
1454ca0bf:     	je	0x1454ca090 <.text+0x54c9090>
1454ca0c1:     	movq	0x8(%rdi), %rax
1454ca0c5:     	movq	0x10(%rdi), %rcx
1454ca0c9:     	shlq	$0x4, %rcx
1454ca0cd:     	leaq	(%rcx,%rcx,2), %rcx
1454ca0d1:     	nopw	%cs:(%rax,%rax)
1454ca0e0:     	testq	%rcx, %rcx
1454ca0e3:     	je	0x1454ca0f8 <.text+0x54c90f8>
1454ca0e5:     	addq	$-0x30, %rcx
1454ca0e9:     	cmpl	%r15d, 0x10(%rax)
1454ca0ed:     	leaq	0x30(%rax), %rax
1454ca0f1:     	jne	0x1454ca0e0 <.text+0x54c90e0>
1454ca0f3:     	movq	%r14, %rax
1454ca0f6:     	jmp	0x1454ca090 <.text+0x54c9090>
1454ca0f8:     	movq	0x88(%rdi), %rdi
1454ca0ff:     	movq	0x160(%rbp), %rsi
1454ca106:     	cmpq	0x150(%rbp), %rsi
1454ca10d:     	jne	0x1454ca063 <.text+0x54c9063>
1454ca113:     	movb	$0x1, 0x2b7(%rbp)
1454ca11a:     	movb	$0x1, 0x2b6(%rbp)
1454ca121:     	movb	$0x1, 0x2b5(%rbp)
1454ca128:     	movb	$0x1, 0x2b4(%rbp)
1454ca12f:     	movb	$0x1, 0x2b3(%rbp)
1454ca136:     	movb	$0x1, 0x2b2(%rbp)
1454ca13d:     	movb	$0x1, 0x2b1(%rbp)
1454ca144:     	movb	$0x1, 0x2b0(%rbp)
1454ca14b:     	movb	$0x1, 0x2af(%rbp)
1454ca152:     	leaq	0x150(%rbp), %rcx
1454ca159:     	callq	0x145758200 <.text+0x5757200>
1454ca15e:     	nop
1454ca15f:     	jmp	0x1454ca063 <.text+0x54c9063>
1454ca164:     	movsd	0x118(%rdi), %xmm13
1454ca16d:     	movss	0x120(%rdi), %xmm15
1454ca176:     	movss	0x154(%rdi), %xmm10
1454ca17f:     	addss	0x432c60(%rip), %xmm10  # 0x1458fcde8
1454ca188:     	movaps	%xmm10, %xmm0
1454ca18c:     	callq	0x145756e31 <.text+0x5755e31>
1454ca191:     	movaps	%xmm0, %xmm9
1454ca195:     	movaps	%xmm10, %xmm0
1454ca199:     	callq	0x145756e2b <.text+0x5755e2b>
1454ca19e:     	movss	%xmm10, 0x154(%rdi)
1454ca1a7:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454ca1ab:     	addps	%xmm9, %xmm9
1454ca1af:     	addps	%xmm13, %xmm9
1454ca1b3:     	cmpq	$-0x1, 0x98(%rbp)
1454ca1bb:     	je	0x1454ca6a8 <.text+0x54c96a8>
1454ca1c1:     	movd	%xmm13, %edx
1454ca1c6:     	movshdup	%xmm13, %xmm0           # xmm0 = xmm13[1,1,3,3]
1454ca1cb:     	movd	%xmm0, %eax
1454ca1cf:     	shlq	$0x20, %rax
1454ca1d3:     	orq	%rax, %rdx
1454ca1d6:     	movd	%xmm9, %r8d
1454ca1db:     	movshdup	%xmm9, %xmm0            # xmm0 = xmm9[1,1,3,3]
1454ca1e0:     	movd	%xmm0, %eax
1454ca1e4:     	shlq	$0x20, %rax
1454ca1e8:     	orq	%rax, %r8
1454ca1eb:     	movb	$0x1, 0x2b7(%rbp)
1454ca1f2:     	movb	$0x1, 0x2b6(%rbp)
1454ca1f9:     	movb	$0x1, 0x2b5(%rbp)
1454ca200:     	movb	$0x1, 0x2b4(%rbp)
1454ca207:     	movb	$0x1, 0x2b3(%rbp)
1454ca20e:     	movb	$0x1, 0x2b2(%rbp)
1454ca215:     	movb	$0x1, 0x2b1(%rbp)
1454ca21c:     	movb	$0x1, 0x2b0(%rbp)
1454ca223:     	movb	$0x1, 0x2af(%rbp)
1454ca22a:     	movq	0xa0(%rbp), %rcx
1454ca231:     	callq	0x14545e830 <.text+0x545d830>
1454ca236:     	nop
1454ca237:     	ucomiss	%xmm11, %xmm0
1454ca23b:     	jae	0x1454ca6ae <.text+0x54c96ae>
1454ca241:     	movaps	%xmm13, %xmm1
1454ca245:     	subps	%xmm9, %xmm1
1454ca249:     	mulps	%xmm1, %xmm1
1454ca24c:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454ca250:     	addss	%xmm1, %xmm2
1454ca254:     	xorps	%xmm1, %xmm1
1454ca257:     	sqrtss	%xmm2, %xmm1
1454ca25b:     	movss	0x421225(%rip), %xmm2   # 0x1458eb488
1454ca263:     	maxss	%xmm2, %xmm1
1454ca267:     	divss	%xmm1, %xmm2
1454ca26b:     	subss	%xmm2, %xmm0
1454ca26f:     	maxss	%xmm8, %xmm0
1454ca274:     	subps	%xmm13, %xmm9
1454ca278:     	movsldup	%xmm0, %xmm1            # xmm1 = xmm0[0,0,2,2]
1454ca27c:     	mulps	%xmm9, %xmm1
1454ca280:     	addps	%xmm13, %xmm1
1454ca284:     	movaps	%xmm15, %xmm10
1454ca288:     	subss	%xmm15, %xmm10
1454ca28d:     	mulss	%xmm0, %xmm10
1454ca292:     	addss	%xmm15, %xmm10
1454ca297:     	movaps	%xmm1, %xmm9
1454ca29b:     	jmp	0x1454ca6b2 <.text+0x54c96b2>
1454ca2a0:     	movq	0x2a0(%rbp), %r12
1454ca2a7:     	movss	0x128(%rdi), %xmm0
1454ca2af:     	ucomiss	%xmm0, %xmm8
1454ca2b3:     	jae	0x1454ca321 <.text+0x54c9321>
1454ca2b5:     	movaps	%xmm6, %xmm1
1454ca2b8:     	subss	0x124(%rdi), %xmm1
1454ca2c0:     	divss	%xmm0, %xmm1
1454ca2c4:     	xorps	%xmm0, %xmm0
1454ca2c7:     	maxss	%xmm1, %xmm0
1454ca2cb:     	movaps	%xmm11, %xmm1
1454ca2cf:     	minss	%xmm0, %xmm1
1454ca2d3:     	movsd	0x10c(%rdi), %xmm0
1454ca2db:     	movsd	0x118(%rdi), %xmm2
1454ca2e3:     	subps	%xmm0, %xmm2
1454ca2e6:     	movsldup	%xmm1, %xmm13           # xmm13 = xmm1[0,0,2,2]
1454ca2eb:     	mulps	%xmm2, %xmm13
1454ca2ef:     	addps	%xmm0, %xmm13
1454ca2f3:     	movss	0x114(%rdi), %xmm0
1454ca2fb:     	movss	0x120(%rdi), %xmm2
1454ca303:     	subss	%xmm0, %xmm2
1454ca307:     	mulss	%xmm1, %xmm2
1454ca30b:     	addss	%xmm0, %xmm2
1454ca30f:     	movlps	%xmm13, 0x270(%rbp)
1454ca317:     	movss	%xmm2, 0x278(%rbp)
1454ca31f:     	jmp	0x1454ca344 <.text+0x54c9344>
1454ca321:     	movq	0x118(%rdi), %rax
1454ca328:     	movq	%rax, 0x270(%rbp)
1454ca32f:     	movl	0x120(%rdi), %eax
1454ca335:     	movl	%eax, 0x278(%rbp)
1454ca33b:     	movsd	0x270(%rbp), %xmm13
1454ca344:     	movaps	%xmm13, %xmm9
1454ca348:     	subps	0x10(%rbp), %xmm9
1454ca34d:     	movaps	%xmm9, %xmm0
1454ca351:     	mulps	%xmm9, %xmm0
1454ca355:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454ca359:     	addss	%xmm0, %xmm1
1454ca35d:     	sqrtss	%xmm1, %xmm10
1454ca362:     	movss	0x130(%rdi), %xmm0
1454ca36a:     	movss	0x150(%rdi), %xmm1
1454ca372:     	subss	%xmm7, %xmm0
1454ca376:     	movss	%xmm0, 0x130(%rdi)
1454ca37e:     	ucomiss	%xmm6, %xmm1
1454ca381:     	jbe	0x1454ca5f0 <.text+0x54c95f0>
1454ca387:     	ucomiss	0x12c(%rdi), %xmm6
1454ca38e:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454ca394:     	maxss	0x42c283(%rip), %xmm10  # 0x1458f6620
1454ca39d:     	movsldup	%xmm10, %xmm0           # xmm0 = xmm10[0,0,2,2]
1454ca3a2:     	divps	%xmm0, %xmm9
1454ca3a6:     	mulps	0x1218522(%rip), %xmm9  # 0x1466e28d0
1454ca3ae:     	addps	%xmm13, %xmm9
1454ca3b2:     	movss	0x278(%rbp), %xmm10
1454ca3bb:     	cmpq	$-0x1, 0x98(%rbp)
1454ca3c3:     	je	0x1454ca4a5 <.text+0x54c94a5>
1454ca3c9:     	movd	%xmm13, %edx
1454ca3ce:     	movshdup	%xmm13, %xmm0           # xmm0 = xmm13[1,1,3,3]
1454ca3d3:     	movd	%xmm0, %eax
1454ca3d7:     	shlq	$0x20, %rax
1454ca3db:     	orq	%rax, %rdx
1454ca3de:     	movd	%xmm9, %r8d
1454ca3e3:     	movshdup	%xmm9, %xmm0            # xmm0 = xmm9[1,1,3,3]
1454ca3e8:     	movd	%xmm0, %eax
1454ca3ec:     	shlq	$0x20, %rax
1454ca3f0:     	orq	%rax, %r8
1454ca3f3:     	movb	$0x1, 0x2b7(%rbp)
1454ca3fa:     	movb	$0x1, 0x2b6(%rbp)
1454ca401:     	movb	$0x1, 0x2b5(%rbp)
1454ca408:     	movb	$0x1, 0x2b4(%rbp)
1454ca40f:     	movb	$0x1, 0x2b3(%rbp)
1454ca416:     	movb	$0x1, 0x2b2(%rbp)
1454ca41d:     	movb	$0x1, 0x2b1(%rbp)
1454ca424:     	movb	$0x1, 0x2b0(%rbp)
1454ca42b:     	movb	$0x1, 0x2af(%rbp)
1454ca432:     	movq	0xa0(%rbp), %rcx
1454ca439:     	callq	0x14545e830 <.text+0x545d830>
1454ca43e:     	nop
1454ca43f:     	ucomiss	%xmm11, %xmm0
1454ca443:     	jae	0x1454ca49e <.text+0x54c949e>
1454ca445:     	movaps	%xmm13, %xmm1
1454ca449:     	subps	%xmm9, %xmm1
1454ca44d:     	mulps	%xmm1, %xmm1
1454ca450:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454ca454:     	addss	%xmm1, %xmm2
1454ca458:     	xorps	%xmm1, %xmm1
1454ca45b:     	sqrtss	%xmm2, %xmm1
1454ca45f:     	movss	0x421021(%rip), %xmm2   # 0x1458eb488
1454ca467:     	maxss	%xmm2, %xmm1
1454ca46b:     	divss	%xmm1, %xmm2
1454ca46f:     	subss	%xmm2, %xmm0
1454ca473:     	maxss	%xmm8, %xmm0
1454ca478:     	subps	%xmm13, %xmm9
1454ca47c:     	movsldup	%xmm0, %xmm1            # xmm1 = xmm0[0,0,2,2]
1454ca480:     	mulps	%xmm9, %xmm1
1454ca484:     	addps	%xmm13, %xmm1
1454ca488:     	movaps	%xmm10, %xmm2
1454ca48c:     	subss	%xmm10, %xmm2
1454ca491:     	mulss	%xmm0, %xmm2
1454ca495:     	addss	%xmm2, %xmm10
1454ca49a:     	movaps	%xmm1, %xmm9
1454ca49e:     	movq	0x290(%rbp), %rdi
1454ca4a5:     	movaps	%xmm11, %xmm1
1454ca4a9:     	subss	0x98(%rdi), %xmm1
1454ca4b1:     	movss	0xfc(%rdi), %xmm2
1454ca4b9:     	movaps	%xmm6, %xmm0
1454ca4bc:     	cmpltss	0x9c(%rdi), %xmm0
1454ca4c5:     	mulss	%xmm2, %xmm1
1454ca4c9:     	andps	%xmm0, %xmm1
1454ca4cc:     	andnps	%xmm2, %xmm0
1454ca4cf:     	orps	%xmm1, %xmm0
1454ca4d2:     	movaps	%xmm0, %xmm1
1454ca4d5:     	mulss	0x52cff7(%rip), %xmm1   # 0x1459f74d4
1454ca4dd:     	testb	$0x1, 0x38(%rdi)
1454ca4e1:     	jne	0x1454ca4e6 <.text+0x54c94e6>
1454ca4e3:     	movaps	%xmm0, %xmm1
1454ca4e6:     	cmpq	$-0x1, 0x18(%rdi)
1454ca4eb:     	jne	0x1454ca4f0 <.text+0x54c94f0>
1454ca4ed:     	movaps	%xmm0, %xmm1
1454ca4f0:     	mulss	0x42c130(%rip), %xmm1   # 0x1458f6628
1454ca4f8:     	movss	0x42e8ff(%rip), %xmm12  # 0x1458f8e00
1454ca501:     	divss	%xmm1, %xmm12
1454ca506:     	movq	0x270(%rbp), %rax
1454ca50d:     	movq	%rax, 0x10c(%rdi)
1454ca514:     	movl	0x278(%rbp), %eax
1454ca51a:     	movl	%eax, 0x114(%rdi)
1454ca520:     	movlps	%xmm9, 0x118(%rdi)
1454ca528:     	movss	%xmm10, 0x120(%rdi)
1454ca531:     	movss	%xmm6, 0x124(%rdi)
1454ca539:     	movss	%xmm12, 0x128(%rdi)
1454ca542:     	movss	0x2c(%rbp), %xmm0
1454ca547:     	movss	%xmm0, 0x12c(%rdi)
1454ca54f:     	movq	0x88(%rdi), %rdi
1454ca556:     	movq	0x1e8(%rbp), %rsi
1454ca55d:     	cmpq	0x1d8(%rbp), %rsi
1454ca564:     	jne	0x1454ca5b2 <.text+0x54c95b2>
1454ca566:     	movb	$0x1, 0x2b7(%rbp)
1454ca56d:     	movb	$0x1, 0x2b6(%rbp)
1454ca574:     	movb	$0x1, 0x2b5(%rbp)
1454ca57b:     	movb	$0x1, 0x2b4(%rbp)
1454ca582:     	movb	$0x1, 0x2b3(%rbp)
1454ca589:     	movb	$0x1, 0x2b2(%rbp)
1454ca590:     	movb	$0x1, 0x2b1(%rbp)
1454ca597:     	movb	$0x1, 0x2b0(%rbp)
1454ca59e:     	movb	$0x1, 0x2af(%rbp)
1454ca5a5:     	leaq	0x1d8(%rbp), %rcx
1454ca5ac:     	callq	0x145758120 <.text+0x5757120>
1454ca5b1:     	nop
1454ca5b2:     	movq	0x1e0(%rbp), %rax
1454ca5b9:     	leaq	(%rsi,%rsi,4), %rcx
1454ca5bd:     	movq	%rdi, (%rax,%rcx,8)
1454ca5c1:     	movq	0x270(%rbp), %rdx
1454ca5c8:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454ca5cd:     	movl	0x278(%rbp), %edx
1454ca5d3:     	movl	%edx, 0x10(%rax,%rcx,8)
1454ca5d7:     	movlps	%xmm9, 0x14(%rax,%rcx,8)
1454ca5dd:     	movss	%xmm10, 0x1c(%rax,%rcx,8)
1454ca5e4:     	movss	%xmm12, 0x20(%rax,%rcx,8)
1454ca5eb:     	jmp	0x1454ca78b <.text+0x54c978b>
