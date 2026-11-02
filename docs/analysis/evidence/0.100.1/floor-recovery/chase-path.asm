
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b0e0:     	pushq	%r15
14552b0e2:     	pushq	%r14
14552b0e4:     	pushq	%r13
14552b0e6:     	pushq	%r12
14552b0e8:     	pushq	%rsi
14552b0e9:     	pushq	%rdi
14552b0ea:     	pushq	%rbp
14552b0eb:     	pushq	%rbx
14552b0ec:     	subq	$0xb8, %rsp
14552b0f3:     	movaps	%xmm13, 0xa0(%rsp)
14552b0fc:     	movaps	%xmm12, 0x90(%rsp)
14552b105:     	movaps	%xmm11, 0x80(%rsp)
14552b10e:     	movaps	%xmm10, 0x70(%rsp)
14552b114:     	movaps	%xmm9, 0x60(%rsp)
14552b11a:     	movaps	%xmm8, 0x50(%rsp)
14552b120:     	movaps	%xmm7, 0x40(%rsp)
14552b125:     	movaps	%xmm6, 0x30(%rsp)
14552b12a:     	movq	%r8, %rdi
14552b12d:     	movq	%rdx, %r13
14552b130:     	movq	%rcx, %rsi
14552b133:     	movq	0x120(%rsp), %rax
14552b13b:     	movq	(%r9), %xmm6
14552b140:     	movq	(%rax), %r8
14552b143:     	movd	%xmm6, %ebx
14552b147:     	movshdup	%xmm6, %xmm0            # xmm0 = xmm6[1,1,3,3]
14552b14b:     	movd	%xmm0, %eax
14552b14f:     	shlq	$0x20, %rax
14552b153:     	orq	%rax, %rbx
14552b156:     	movq	%rdi, %rcx
14552b159:     	movq	%rbx, %rdx
14552b15c:     	callq	0x1455246f0 <.text+0x55236f0>
14552b161:     	xorl	%r15d, %r15d
14552b164:     	ucomiss	0x3dc325(%rip), %xmm0   # 0x145907490
14552b16b:     	jae	0x14552b471 <.text+0x552a471>
14552b171:     	movsd	0x20(%rdi), %xmm7
14552b176:     	movaps	%xmm6, %xmm0
14552b179:     	subps	%xmm7, %xmm0
14552b17c:     	xorps	%xmm1, %xmm1
14552b17f:     	movaps	%xmm0, %xmm2
14552b182:     	cmpltps	%xmm1, %xmm2
14552b186:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
14552b189:     	movmskpd	%xmm2, %eax
14552b18d:     	testl	%eax, %eax
14552b18f:     	jne	0x14552b471 <.text+0x552a471>
14552b195:     	movss	0x3dc043(%rip), %xmm1   # 0x1459071e0
14552b19d:     	movaps	%xmm0, %xmm2
14552b1a0:     	subss	%xmm1, %xmm2
14552b1a4:     	cvttss2si	%xmm2, %rcx
14552b1a9:     	cvttss2si	%xmm0, %rdx
14552b1ae:     	movq	%rdx, %rax
14552b1b1:     	sarq	$0x3f, %rax
14552b1b5:     	andq	%rcx, %rax
14552b1b8:     	orq	%rdx, %rax
14552b1bb:     	xorl	%r15d, %r15d
14552b1be:     	xorps	%xmm2, %xmm2
14552b1c1:     	ucomiss	%xmm2, %xmm0
14552b1c4:     	cmovbq	%r15, %rax
14552b1c8:     	movss	0x3dc014(%rip), %xmm3   # 0x1459071e4
14552b1d0:     	ucomiss	%xmm3, %xmm0
14552b1d3:     	movq	$-0x1, %rcx
14552b1da:     	cmovaq	%rcx, %rax
14552b1de:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
14552b1e2:     	movaps	%xmm0, %xmm4
14552b1e5:     	subss	%xmm1, %xmm4
14552b1e9:     	cvttss2si	%xmm4, %rdx
14552b1ee:     	cvttss2si	%xmm0, %r8
14552b1f3:     	movq	%r8, %r9
14552b1f6:     	sarq	$0x3f, %r9
14552b1fa:     	andq	%rdx, %r9
14552b1fd:     	orq	%r8, %r9
14552b200:     	ucomiss	%xmm2, %xmm0
14552b203:     	cmovbq	%r15, %r9
14552b207:     	ucomiss	%xmm3, %xmm0
14552b20a:     	cmovaq	%rcx, %r9
14552b20e:     	movq	0x18(%rdi), %r14
14552b212:     	cmpq	%r14, %rax
14552b215:     	setae	%cl
14552b218:     	cmpq	%r14, %r9
14552b21b:     	setae	%dl
14552b21e:     	orb	%cl, %dl
14552b220:     	jne	0x14552b471 <.text+0x552a471>
14552b226:     	imulq	%r14, %r9
14552b22a:     	addq	%rax, %r9
14552b22d:     	movq	0x10(%r13), %rax
14552b231:     	movq	%rax, 0x28(%rsp)
14552b236:     	cmpq	%rax, %r9
14552b239:     	jae	0x14552b4c2 <.text+0x552a4c2>
14552b23f:     	movq	0x8(%r13), %r12
14552b243:     	cmpw	$-0x1, (%r12,%r9,2)
14552b249:     	je	0x14552b289 <.text+0x552a289>
14552b24b:     	movq	%r9, %rax
14552b24e:     	orq	%r14, %rax
14552b251:     	shrq	$0x20, %rax
14552b255:     	je	0x14552b2b2 <.text+0x552a2b2>
14552b257:     	movq	%r9, %rax
14552b25a:     	xorl	%edx, %edx
14552b25c:     	divq	%r14
14552b25f:     	testq	%rax, %rax
14552b262:     	js	0x14552b2bf <.text+0x552a2bf>
14552b264:     	xorps	%xmm0, %xmm0
14552b267:     	cvtsi2ss	%rax, %xmm0
14552b26c:     	testq	%rdx, %rdx
14552b26f:     	jns	0x14552b2dc <.text+0x552a2dc>
14552b271:     	movq	%rdx, %rax
14552b274:     	shrq	%rax
14552b277:     	andl	$0x1, %edx
14552b27a:     	orq	%rax, %rdx
14552b27d:     	cvtsi2ss	%rdx, %xmm8
14552b282:     	addss	%xmm8, %xmm8
14552b287:     	jmp	0x14552b2e1 <.text+0x552a2e1>
14552b289:     	movq	%r12, %rcx
14552b28c:     	movq	0x28(%rsp), %rdx
14552b291:     	movq	%r14, %r8
14552b294:     	callq	0x14552a810 <.text+0x5529810>
14552b299:     	cmpq	$0x1, %rax
14552b29d:     	jne	0x14552b471 <.text+0x552a471>
14552b2a3:     	movq	%rdx, %r9
14552b2a6:     	movq	%r9, %rax
14552b2a9:     	orq	%r14, %rax
14552b2ac:     	shrq	$0x20, %rax
14552b2b0:     	jne	0x14552b257 <.text+0x552a257>
14552b2b2:     	movl	%r9d, %eax
14552b2b5:     	xorl	%edx, %edx
14552b2b7:     	divl	%r14d
14552b2ba:     	testq	%rax, %rax
14552b2bd:     	jns	0x14552b264 <.text+0x552a264>
14552b2bf:     	movq	%rax, %rcx
14552b2c2:     	shrq	%rcx
14552b2c5:     	andl	$0x1, %eax
14552b2c8:     	orq	%rcx, %rax
14552b2cb:     	xorps	%xmm0, %xmm0
14552b2ce:     	cvtsi2ss	%rax, %xmm0
14552b2d3:     	addss	%xmm0, %xmm0
14552b2d7:     	testq	%rdx, %rdx
14552b2da:     	js	0x14552b271 <.text+0x552a271>
14552b2dc:     	cvtsi2ss	%rdx, %xmm8
14552b2e1:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
14552b2e5:     	addps	0x423313(%rip), %xmm8   # 0x14594e600
14552b2ed:     	addps	%xmm7, %xmm8
14552b2f1:     	xorps	%xmm0, %xmm0
14552b2f4:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
14552b2f8:     	movq	0x18(%r13), %rbp
14552b2fc:     	cmpq	%rbp, %r9
14552b2ff:     	je	0x14552b450 <.text+0x552a450>
14552b305:     	movq	%r12, %rcx
14552b308:     	movq	0x28(%rsp), %rdx
14552b30d:     	movq	%r14, %r8
14552b310:     	callq	0x14552a810 <.text+0x5529810>
14552b315:     	cmpq	$0x1, %rax
14552b319:     	jne	0x14552b450 <.text+0x552a450>
14552b31f:     	movq	%rdx, %r13
14552b322:     	movss	0x128(%rsp), %xmm9
14552b32c:     	movl	$0x27, %r15d
14552b332:     	movaps	0x4232c6(%rip), %xmm10  # 0x14594e600
14552b33a:     	xorps	%xmm11, %xmm11
14552b33e:     	movss	0x3dc149(%rip), %xmm12  # 0x145907490
14552b347:     	nopw	(%rax,%rax)
14552b350:     	movq	%r13, %rax
14552b353:     	orq	%r14, %rax
14552b356:     	shrq	$0x20, %rax
14552b35a:     	je	0x14552b392 <.text+0x552a392>
14552b35c:     	movq	%r13, %rax
14552b35f:     	xorl	%edx, %edx
14552b361:     	divq	%r14
14552b364:     	testq	%rax, %rax
14552b367:     	js	0x14552b39f <.text+0x552a39f>
14552b369:     	xorps	%xmm0, %xmm0
14552b36c:     	cvtsi2ss	%rax, %xmm0
14552b371:     	testq	%rdx, %rdx
14552b374:     	jns	0x14552b3bc <.text+0x552a3bc>
14552b376:     	movq	%rdx, %rax
14552b379:     	shrq	%rax
14552b37c:     	andl	$0x1, %edx
14552b37f:     	orq	%rax, %rdx
14552b382:     	xorps	%xmm13, %xmm13
14552b386:     	cvtsi2ss	%rdx, %xmm13
14552b38b:     	addss	%xmm13, %xmm13
14552b390:     	jmp	0x14552b3c5 <.text+0x552a3c5>
14552b392:     	movl	%r13d, %eax
14552b395:     	xorl	%edx, %edx
14552b397:     	divl	%r14d
14552b39a:     	testq	%rax, %rax
14552b39d:     	jns	0x14552b369 <.text+0x552a369>
14552b39f:     	movq	%rax, %rcx
14552b3a2:     	shrq	%rcx
14552b3a5:     	andl	$0x1, %eax
14552b3a8:     	orq	%rcx, %rax
14552b3ab:     	xorps	%xmm0, %xmm0
14552b3ae:     	cvtsi2ss	%rax, %xmm0
14552b3b3:     	addss	%xmm0, %xmm0
14552b3b7:     	testq	%rdx, %rdx
14552b3ba:     	js	0x14552b376 <.text+0x552a376>
14552b3bc:     	xorps	%xmm13, %xmm13
14552b3c0:     	cvtsi2ss	%rdx, %xmm13
14552b3c5:     	unpcklps	%xmm0, %xmm13           # xmm13 = xmm13[0],xmm0[0],xmm13[1],xmm0[1]
14552b3c9:     	addps	%xmm10, %xmm13
14552b3cd:     	addps	%xmm7, %xmm13
14552b3d1:     	movaps	%xmm13, %xmm0
14552b3d5:     	subps	%xmm6, %xmm0
14552b3d8:     	mulps	%xmm0, %xmm0
14552b3db:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14552b3df:     	addss	%xmm0, %xmm1
14552b3e3:     	xorps	%xmm0, %xmm0
14552b3e6:     	sqrtss	%xmm1, %xmm0
14552b3ea:     	ucomiss	%xmm9, %xmm0
14552b3ee:     	ja	0x14552b450 <.text+0x552a450>
14552b3f0:     	movshdup	%xmm13, %xmm0           # xmm0 = xmm13[1,1,3,3]
14552b3f5:     	movq	%xmm0, %rax
14552b3fa:     	shlq	$0x20, %rax
14552b3fe:     	movd	%xmm13, %r8d
14552b403:     	orq	%rax, %r8
14552b406:     	movq	%rdi, %rcx
14552b409:     	movq	%rbx, %rdx
14552b40c:     	callq	0x1455246f0 <.text+0x55236f0>
14552b411:     	ucomiss	%xmm0, %xmm12
14552b415:     	ja	0x14552b450 <.text+0x552a450>
14552b417:     	unpcklps	%xmm11, %xmm13          # xmm13 = xmm13[0],xmm11[0],xmm13[1],xmm11[1]
14552b41b:     	subq	$0x1, %r15
14552b41f:     	jb	0x14552b44c <.text+0x552a44c>
14552b421:     	cmpq	%rbp, %r13
14552b424:     	je	0x14552b44c <.text+0x552a44c>
14552b426:     	movq	%r12, %rcx
14552b429:     	movq	0x28(%rsp), %rdx
14552b42e:     	movq	%r14, %r8
14552b431:     	movq	%r13, %r9
14552b434:     	callq	0x14552a810 <.text+0x5529810>
14552b439:     	movq	%rdx, %r13
14552b43c:     	movaps	%xmm13, %xmm8
14552b440:     	cmpq	$0x1, %rax
14552b444:     	je	0x14552b350 <.text+0x552a350>
14552b44a:     	jmp	0x14552b450 <.text+0x552a450>
14552b44c:     	movaps	%xmm13, %xmm8
14552b450:     	pshufd	$0xee, %xmm8, %xmm0     # xmm0 = xmm8[2,3,2,3]
14552b456:     	movq	%xmm0, %rax
14552b45b:     	shlq	$0x20, %rax
14552b45f:     	movq	%xmm8, %rcx
14552b464:     	addq	%rax, %rcx
14552b467:     	movq	%rcx, 0x4(%rsi)
14552b46b:     	movl	$0x1, %r15d
14552b471:     	movl	%r15d, (%rsi)
14552b474:     	movq	%rsi, %rax
14552b477:     	movaps	0x30(%rsp), %xmm6
14552b47c:     	movaps	0x40(%rsp), %xmm7
14552b481:     	movaps	0x50(%rsp), %xmm8
14552b487:     	movaps	0x60(%rsp), %xmm9
14552b48d:     	movaps	0x70(%rsp), %xmm10
14552b493:     	movaps	0x80(%rsp), %xmm11
14552b49c:     	movaps	0x90(%rsp), %xmm12
14552b4a5:     	movaps	0xa0(%rsp), %xmm13
14552b4ae:     	addq	$0xb8, %rsp
14552b4b5:     	popq	%rbx
14552b4b6:     	popq	%rbp
14552b4b7:     	popq	%rdi
14552b4b8:     	popq	%rsi
14552b4b9:     	popq	%r12
14552b4bb:     	popq	%r13
14552b4bd:     	popq	%r14
14552b4bf:     	popq	%r15
14552b4c1:     	retq
14552b4c2:     	leaq	0x1809a67(%rip), %r8    # 0x146d34f30
14552b4c9:     	movq	%r9, %rcx
14552b4cc:     	movq	0x28(%rsp), %rdx
14552b4d1:     	callq	0x145903b33 <.text+0x5902b33>
14552b4d6:     	ud2
